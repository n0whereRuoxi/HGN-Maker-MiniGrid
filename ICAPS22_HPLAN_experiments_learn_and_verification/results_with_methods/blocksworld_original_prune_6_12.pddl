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
      ?auto_53670 - BLOCK
      ?auto_53671 - BLOCK
      ?auto_53672 - BLOCK
      ?auto_53673 - BLOCK
      ?auto_53674 - BLOCK
      ?auto_53675 - BLOCK
    )
    :vars
    (
      ?auto_53676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53676 ?auto_53675 ) ( CLEAR ?auto_53676 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53670 ) ( ON ?auto_53671 ?auto_53670 ) ( ON ?auto_53672 ?auto_53671 ) ( ON ?auto_53673 ?auto_53672 ) ( ON ?auto_53674 ?auto_53673 ) ( ON ?auto_53675 ?auto_53674 ) ( not ( = ?auto_53670 ?auto_53671 ) ) ( not ( = ?auto_53670 ?auto_53672 ) ) ( not ( = ?auto_53670 ?auto_53673 ) ) ( not ( = ?auto_53670 ?auto_53674 ) ) ( not ( = ?auto_53670 ?auto_53675 ) ) ( not ( = ?auto_53670 ?auto_53676 ) ) ( not ( = ?auto_53671 ?auto_53672 ) ) ( not ( = ?auto_53671 ?auto_53673 ) ) ( not ( = ?auto_53671 ?auto_53674 ) ) ( not ( = ?auto_53671 ?auto_53675 ) ) ( not ( = ?auto_53671 ?auto_53676 ) ) ( not ( = ?auto_53672 ?auto_53673 ) ) ( not ( = ?auto_53672 ?auto_53674 ) ) ( not ( = ?auto_53672 ?auto_53675 ) ) ( not ( = ?auto_53672 ?auto_53676 ) ) ( not ( = ?auto_53673 ?auto_53674 ) ) ( not ( = ?auto_53673 ?auto_53675 ) ) ( not ( = ?auto_53673 ?auto_53676 ) ) ( not ( = ?auto_53674 ?auto_53675 ) ) ( not ( = ?auto_53674 ?auto_53676 ) ) ( not ( = ?auto_53675 ?auto_53676 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53676 ?auto_53675 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_53678 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_53678 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_53678 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_53679 - BLOCK
    )
    :vars
    (
      ?auto_53680 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53679 ?auto_53680 ) ( CLEAR ?auto_53679 ) ( HAND-EMPTY ) ( not ( = ?auto_53679 ?auto_53680 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53679 ?auto_53680 )
      ( MAKE-1PILE ?auto_53679 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53686 - BLOCK
      ?auto_53687 - BLOCK
      ?auto_53688 - BLOCK
      ?auto_53689 - BLOCK
      ?auto_53690 - BLOCK
    )
    :vars
    (
      ?auto_53691 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53691 ?auto_53690 ) ( CLEAR ?auto_53691 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53686 ) ( ON ?auto_53687 ?auto_53686 ) ( ON ?auto_53688 ?auto_53687 ) ( ON ?auto_53689 ?auto_53688 ) ( ON ?auto_53690 ?auto_53689 ) ( not ( = ?auto_53686 ?auto_53687 ) ) ( not ( = ?auto_53686 ?auto_53688 ) ) ( not ( = ?auto_53686 ?auto_53689 ) ) ( not ( = ?auto_53686 ?auto_53690 ) ) ( not ( = ?auto_53686 ?auto_53691 ) ) ( not ( = ?auto_53687 ?auto_53688 ) ) ( not ( = ?auto_53687 ?auto_53689 ) ) ( not ( = ?auto_53687 ?auto_53690 ) ) ( not ( = ?auto_53687 ?auto_53691 ) ) ( not ( = ?auto_53688 ?auto_53689 ) ) ( not ( = ?auto_53688 ?auto_53690 ) ) ( not ( = ?auto_53688 ?auto_53691 ) ) ( not ( = ?auto_53689 ?auto_53690 ) ) ( not ( = ?auto_53689 ?auto_53691 ) ) ( not ( = ?auto_53690 ?auto_53691 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53691 ?auto_53690 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53692 - BLOCK
      ?auto_53693 - BLOCK
      ?auto_53694 - BLOCK
      ?auto_53695 - BLOCK
      ?auto_53696 - BLOCK
    )
    :vars
    (
      ?auto_53697 - BLOCK
      ?auto_53698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53697 ?auto_53696 ) ( CLEAR ?auto_53697 ) ( ON-TABLE ?auto_53692 ) ( ON ?auto_53693 ?auto_53692 ) ( ON ?auto_53694 ?auto_53693 ) ( ON ?auto_53695 ?auto_53694 ) ( ON ?auto_53696 ?auto_53695 ) ( not ( = ?auto_53692 ?auto_53693 ) ) ( not ( = ?auto_53692 ?auto_53694 ) ) ( not ( = ?auto_53692 ?auto_53695 ) ) ( not ( = ?auto_53692 ?auto_53696 ) ) ( not ( = ?auto_53692 ?auto_53697 ) ) ( not ( = ?auto_53693 ?auto_53694 ) ) ( not ( = ?auto_53693 ?auto_53695 ) ) ( not ( = ?auto_53693 ?auto_53696 ) ) ( not ( = ?auto_53693 ?auto_53697 ) ) ( not ( = ?auto_53694 ?auto_53695 ) ) ( not ( = ?auto_53694 ?auto_53696 ) ) ( not ( = ?auto_53694 ?auto_53697 ) ) ( not ( = ?auto_53695 ?auto_53696 ) ) ( not ( = ?auto_53695 ?auto_53697 ) ) ( not ( = ?auto_53696 ?auto_53697 ) ) ( HOLDING ?auto_53698 ) ( not ( = ?auto_53692 ?auto_53698 ) ) ( not ( = ?auto_53693 ?auto_53698 ) ) ( not ( = ?auto_53694 ?auto_53698 ) ) ( not ( = ?auto_53695 ?auto_53698 ) ) ( not ( = ?auto_53696 ?auto_53698 ) ) ( not ( = ?auto_53697 ?auto_53698 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_53698 )
      ( MAKE-5PILE ?auto_53692 ?auto_53693 ?auto_53694 ?auto_53695 ?auto_53696 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53699 - BLOCK
      ?auto_53700 - BLOCK
      ?auto_53701 - BLOCK
      ?auto_53702 - BLOCK
      ?auto_53703 - BLOCK
    )
    :vars
    (
      ?auto_53705 - BLOCK
      ?auto_53704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53705 ?auto_53703 ) ( ON-TABLE ?auto_53699 ) ( ON ?auto_53700 ?auto_53699 ) ( ON ?auto_53701 ?auto_53700 ) ( ON ?auto_53702 ?auto_53701 ) ( ON ?auto_53703 ?auto_53702 ) ( not ( = ?auto_53699 ?auto_53700 ) ) ( not ( = ?auto_53699 ?auto_53701 ) ) ( not ( = ?auto_53699 ?auto_53702 ) ) ( not ( = ?auto_53699 ?auto_53703 ) ) ( not ( = ?auto_53699 ?auto_53705 ) ) ( not ( = ?auto_53700 ?auto_53701 ) ) ( not ( = ?auto_53700 ?auto_53702 ) ) ( not ( = ?auto_53700 ?auto_53703 ) ) ( not ( = ?auto_53700 ?auto_53705 ) ) ( not ( = ?auto_53701 ?auto_53702 ) ) ( not ( = ?auto_53701 ?auto_53703 ) ) ( not ( = ?auto_53701 ?auto_53705 ) ) ( not ( = ?auto_53702 ?auto_53703 ) ) ( not ( = ?auto_53702 ?auto_53705 ) ) ( not ( = ?auto_53703 ?auto_53705 ) ) ( not ( = ?auto_53699 ?auto_53704 ) ) ( not ( = ?auto_53700 ?auto_53704 ) ) ( not ( = ?auto_53701 ?auto_53704 ) ) ( not ( = ?auto_53702 ?auto_53704 ) ) ( not ( = ?auto_53703 ?auto_53704 ) ) ( not ( = ?auto_53705 ?auto_53704 ) ) ( ON ?auto_53704 ?auto_53705 ) ( CLEAR ?auto_53704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_53699 ?auto_53700 ?auto_53701 ?auto_53702 ?auto_53703 ?auto_53705 )
      ( MAKE-5PILE ?auto_53699 ?auto_53700 ?auto_53701 ?auto_53702 ?auto_53703 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_53708 - BLOCK
      ?auto_53709 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_53709 ) ( CLEAR ?auto_53708 ) ( ON-TABLE ?auto_53708 ) ( not ( = ?auto_53708 ?auto_53709 ) ) )
    :subtasks
    ( ( !STACK ?auto_53709 ?auto_53708 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_53710 - BLOCK
      ?auto_53711 - BLOCK
    )
    :vars
    (
      ?auto_53712 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_53710 ) ( ON-TABLE ?auto_53710 ) ( not ( = ?auto_53710 ?auto_53711 ) ) ( ON ?auto_53711 ?auto_53712 ) ( CLEAR ?auto_53711 ) ( HAND-EMPTY ) ( not ( = ?auto_53710 ?auto_53712 ) ) ( not ( = ?auto_53711 ?auto_53712 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53711 ?auto_53712 )
      ( MAKE-2PILE ?auto_53710 ?auto_53711 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_53713 - BLOCK
      ?auto_53714 - BLOCK
    )
    :vars
    (
      ?auto_53715 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53713 ?auto_53714 ) ) ( ON ?auto_53714 ?auto_53715 ) ( CLEAR ?auto_53714 ) ( not ( = ?auto_53713 ?auto_53715 ) ) ( not ( = ?auto_53714 ?auto_53715 ) ) ( HOLDING ?auto_53713 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53713 )
      ( MAKE-2PILE ?auto_53713 ?auto_53714 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_53716 - BLOCK
      ?auto_53717 - BLOCK
    )
    :vars
    (
      ?auto_53718 - BLOCK
      ?auto_53722 - BLOCK
      ?auto_53720 - BLOCK
      ?auto_53719 - BLOCK
      ?auto_53721 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53716 ?auto_53717 ) ) ( ON ?auto_53717 ?auto_53718 ) ( not ( = ?auto_53716 ?auto_53718 ) ) ( not ( = ?auto_53717 ?auto_53718 ) ) ( ON ?auto_53716 ?auto_53717 ) ( CLEAR ?auto_53716 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53722 ) ( ON ?auto_53720 ?auto_53722 ) ( ON ?auto_53719 ?auto_53720 ) ( ON ?auto_53721 ?auto_53719 ) ( ON ?auto_53718 ?auto_53721 ) ( not ( = ?auto_53722 ?auto_53720 ) ) ( not ( = ?auto_53722 ?auto_53719 ) ) ( not ( = ?auto_53722 ?auto_53721 ) ) ( not ( = ?auto_53722 ?auto_53718 ) ) ( not ( = ?auto_53722 ?auto_53717 ) ) ( not ( = ?auto_53722 ?auto_53716 ) ) ( not ( = ?auto_53720 ?auto_53719 ) ) ( not ( = ?auto_53720 ?auto_53721 ) ) ( not ( = ?auto_53720 ?auto_53718 ) ) ( not ( = ?auto_53720 ?auto_53717 ) ) ( not ( = ?auto_53720 ?auto_53716 ) ) ( not ( = ?auto_53719 ?auto_53721 ) ) ( not ( = ?auto_53719 ?auto_53718 ) ) ( not ( = ?auto_53719 ?auto_53717 ) ) ( not ( = ?auto_53719 ?auto_53716 ) ) ( not ( = ?auto_53721 ?auto_53718 ) ) ( not ( = ?auto_53721 ?auto_53717 ) ) ( not ( = ?auto_53721 ?auto_53716 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_53722 ?auto_53720 ?auto_53719 ?auto_53721 ?auto_53718 ?auto_53717 )
      ( MAKE-2PILE ?auto_53716 ?auto_53717 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53727 - BLOCK
      ?auto_53728 - BLOCK
      ?auto_53729 - BLOCK
      ?auto_53730 - BLOCK
    )
    :vars
    (
      ?auto_53731 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53731 ?auto_53730 ) ( CLEAR ?auto_53731 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53727 ) ( ON ?auto_53728 ?auto_53727 ) ( ON ?auto_53729 ?auto_53728 ) ( ON ?auto_53730 ?auto_53729 ) ( not ( = ?auto_53727 ?auto_53728 ) ) ( not ( = ?auto_53727 ?auto_53729 ) ) ( not ( = ?auto_53727 ?auto_53730 ) ) ( not ( = ?auto_53727 ?auto_53731 ) ) ( not ( = ?auto_53728 ?auto_53729 ) ) ( not ( = ?auto_53728 ?auto_53730 ) ) ( not ( = ?auto_53728 ?auto_53731 ) ) ( not ( = ?auto_53729 ?auto_53730 ) ) ( not ( = ?auto_53729 ?auto_53731 ) ) ( not ( = ?auto_53730 ?auto_53731 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53731 ?auto_53730 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53732 - BLOCK
      ?auto_53733 - BLOCK
      ?auto_53734 - BLOCK
      ?auto_53735 - BLOCK
    )
    :vars
    (
      ?auto_53736 - BLOCK
      ?auto_53737 - BLOCK
      ?auto_53738 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53736 ?auto_53735 ) ( CLEAR ?auto_53736 ) ( ON-TABLE ?auto_53732 ) ( ON ?auto_53733 ?auto_53732 ) ( ON ?auto_53734 ?auto_53733 ) ( ON ?auto_53735 ?auto_53734 ) ( not ( = ?auto_53732 ?auto_53733 ) ) ( not ( = ?auto_53732 ?auto_53734 ) ) ( not ( = ?auto_53732 ?auto_53735 ) ) ( not ( = ?auto_53732 ?auto_53736 ) ) ( not ( = ?auto_53733 ?auto_53734 ) ) ( not ( = ?auto_53733 ?auto_53735 ) ) ( not ( = ?auto_53733 ?auto_53736 ) ) ( not ( = ?auto_53734 ?auto_53735 ) ) ( not ( = ?auto_53734 ?auto_53736 ) ) ( not ( = ?auto_53735 ?auto_53736 ) ) ( HOLDING ?auto_53737 ) ( CLEAR ?auto_53738 ) ( not ( = ?auto_53732 ?auto_53737 ) ) ( not ( = ?auto_53732 ?auto_53738 ) ) ( not ( = ?auto_53733 ?auto_53737 ) ) ( not ( = ?auto_53733 ?auto_53738 ) ) ( not ( = ?auto_53734 ?auto_53737 ) ) ( not ( = ?auto_53734 ?auto_53738 ) ) ( not ( = ?auto_53735 ?auto_53737 ) ) ( not ( = ?auto_53735 ?auto_53738 ) ) ( not ( = ?auto_53736 ?auto_53737 ) ) ( not ( = ?auto_53736 ?auto_53738 ) ) ( not ( = ?auto_53737 ?auto_53738 ) ) )
    :subtasks
    ( ( !STACK ?auto_53737 ?auto_53738 )
      ( MAKE-4PILE ?auto_53732 ?auto_53733 ?auto_53734 ?auto_53735 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_54338 - BLOCK
      ?auto_54339 - BLOCK
      ?auto_54340 - BLOCK
      ?auto_54341 - BLOCK
    )
    :vars
    (
      ?auto_54342 - BLOCK
      ?auto_54343 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54342 ?auto_54341 ) ( ON-TABLE ?auto_54338 ) ( ON ?auto_54339 ?auto_54338 ) ( ON ?auto_54340 ?auto_54339 ) ( ON ?auto_54341 ?auto_54340 ) ( not ( = ?auto_54338 ?auto_54339 ) ) ( not ( = ?auto_54338 ?auto_54340 ) ) ( not ( = ?auto_54338 ?auto_54341 ) ) ( not ( = ?auto_54338 ?auto_54342 ) ) ( not ( = ?auto_54339 ?auto_54340 ) ) ( not ( = ?auto_54339 ?auto_54341 ) ) ( not ( = ?auto_54339 ?auto_54342 ) ) ( not ( = ?auto_54340 ?auto_54341 ) ) ( not ( = ?auto_54340 ?auto_54342 ) ) ( not ( = ?auto_54341 ?auto_54342 ) ) ( not ( = ?auto_54338 ?auto_54343 ) ) ( not ( = ?auto_54339 ?auto_54343 ) ) ( not ( = ?auto_54340 ?auto_54343 ) ) ( not ( = ?auto_54341 ?auto_54343 ) ) ( not ( = ?auto_54342 ?auto_54343 ) ) ( ON ?auto_54343 ?auto_54342 ) ( CLEAR ?auto_54343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54338 ?auto_54339 ?auto_54340 ?auto_54341 ?auto_54342 )
      ( MAKE-4PILE ?auto_54338 ?auto_54339 ?auto_54340 ?auto_54341 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53746 - BLOCK
      ?auto_53747 - BLOCK
      ?auto_53748 - BLOCK
      ?auto_53749 - BLOCK
    )
    :vars
    (
      ?auto_53750 - BLOCK
      ?auto_53752 - BLOCK
      ?auto_53751 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53750 ?auto_53749 ) ( ON-TABLE ?auto_53746 ) ( ON ?auto_53747 ?auto_53746 ) ( ON ?auto_53748 ?auto_53747 ) ( ON ?auto_53749 ?auto_53748 ) ( not ( = ?auto_53746 ?auto_53747 ) ) ( not ( = ?auto_53746 ?auto_53748 ) ) ( not ( = ?auto_53746 ?auto_53749 ) ) ( not ( = ?auto_53746 ?auto_53750 ) ) ( not ( = ?auto_53747 ?auto_53748 ) ) ( not ( = ?auto_53747 ?auto_53749 ) ) ( not ( = ?auto_53747 ?auto_53750 ) ) ( not ( = ?auto_53748 ?auto_53749 ) ) ( not ( = ?auto_53748 ?auto_53750 ) ) ( not ( = ?auto_53749 ?auto_53750 ) ) ( not ( = ?auto_53746 ?auto_53752 ) ) ( not ( = ?auto_53746 ?auto_53751 ) ) ( not ( = ?auto_53747 ?auto_53752 ) ) ( not ( = ?auto_53747 ?auto_53751 ) ) ( not ( = ?auto_53748 ?auto_53752 ) ) ( not ( = ?auto_53748 ?auto_53751 ) ) ( not ( = ?auto_53749 ?auto_53752 ) ) ( not ( = ?auto_53749 ?auto_53751 ) ) ( not ( = ?auto_53750 ?auto_53752 ) ) ( not ( = ?auto_53750 ?auto_53751 ) ) ( not ( = ?auto_53752 ?auto_53751 ) ) ( ON ?auto_53752 ?auto_53750 ) ( CLEAR ?auto_53752 ) ( HOLDING ?auto_53751 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53751 )
      ( MAKE-4PILE ?auto_53746 ?auto_53747 ?auto_53748 ?auto_53749 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53753 - BLOCK
      ?auto_53754 - BLOCK
      ?auto_53755 - BLOCK
      ?auto_53756 - BLOCK
    )
    :vars
    (
      ?auto_53757 - BLOCK
      ?auto_53759 - BLOCK
      ?auto_53758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53757 ?auto_53756 ) ( ON-TABLE ?auto_53753 ) ( ON ?auto_53754 ?auto_53753 ) ( ON ?auto_53755 ?auto_53754 ) ( ON ?auto_53756 ?auto_53755 ) ( not ( = ?auto_53753 ?auto_53754 ) ) ( not ( = ?auto_53753 ?auto_53755 ) ) ( not ( = ?auto_53753 ?auto_53756 ) ) ( not ( = ?auto_53753 ?auto_53757 ) ) ( not ( = ?auto_53754 ?auto_53755 ) ) ( not ( = ?auto_53754 ?auto_53756 ) ) ( not ( = ?auto_53754 ?auto_53757 ) ) ( not ( = ?auto_53755 ?auto_53756 ) ) ( not ( = ?auto_53755 ?auto_53757 ) ) ( not ( = ?auto_53756 ?auto_53757 ) ) ( not ( = ?auto_53753 ?auto_53759 ) ) ( not ( = ?auto_53753 ?auto_53758 ) ) ( not ( = ?auto_53754 ?auto_53759 ) ) ( not ( = ?auto_53754 ?auto_53758 ) ) ( not ( = ?auto_53755 ?auto_53759 ) ) ( not ( = ?auto_53755 ?auto_53758 ) ) ( not ( = ?auto_53756 ?auto_53759 ) ) ( not ( = ?auto_53756 ?auto_53758 ) ) ( not ( = ?auto_53757 ?auto_53759 ) ) ( not ( = ?auto_53757 ?auto_53758 ) ) ( not ( = ?auto_53759 ?auto_53758 ) ) ( ON ?auto_53759 ?auto_53757 ) ( ON ?auto_53758 ?auto_53759 ) ( CLEAR ?auto_53758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_53753 ?auto_53754 ?auto_53755 ?auto_53756 ?auto_53757 ?auto_53759 )
      ( MAKE-4PILE ?auto_53753 ?auto_53754 ?auto_53755 ?auto_53756 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53763 - BLOCK
      ?auto_53764 - BLOCK
      ?auto_53765 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_53765 ) ( CLEAR ?auto_53764 ) ( ON-TABLE ?auto_53763 ) ( ON ?auto_53764 ?auto_53763 ) ( not ( = ?auto_53763 ?auto_53764 ) ) ( not ( = ?auto_53763 ?auto_53765 ) ) ( not ( = ?auto_53764 ?auto_53765 ) ) )
    :subtasks
    ( ( !STACK ?auto_53765 ?auto_53764 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53766 - BLOCK
      ?auto_53767 - BLOCK
      ?auto_53768 - BLOCK
    )
    :vars
    (
      ?auto_53769 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_53767 ) ( ON-TABLE ?auto_53766 ) ( ON ?auto_53767 ?auto_53766 ) ( not ( = ?auto_53766 ?auto_53767 ) ) ( not ( = ?auto_53766 ?auto_53768 ) ) ( not ( = ?auto_53767 ?auto_53768 ) ) ( ON ?auto_53768 ?auto_53769 ) ( CLEAR ?auto_53768 ) ( HAND-EMPTY ) ( not ( = ?auto_53766 ?auto_53769 ) ) ( not ( = ?auto_53767 ?auto_53769 ) ) ( not ( = ?auto_53768 ?auto_53769 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53768 ?auto_53769 )
      ( MAKE-3PILE ?auto_53766 ?auto_53767 ?auto_53768 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53770 - BLOCK
      ?auto_53771 - BLOCK
      ?auto_53772 - BLOCK
    )
    :vars
    (
      ?auto_53773 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53770 ) ( not ( = ?auto_53770 ?auto_53771 ) ) ( not ( = ?auto_53770 ?auto_53772 ) ) ( not ( = ?auto_53771 ?auto_53772 ) ) ( ON ?auto_53772 ?auto_53773 ) ( CLEAR ?auto_53772 ) ( not ( = ?auto_53770 ?auto_53773 ) ) ( not ( = ?auto_53771 ?auto_53773 ) ) ( not ( = ?auto_53772 ?auto_53773 ) ) ( HOLDING ?auto_53771 ) ( CLEAR ?auto_53770 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53770 ?auto_53771 )
      ( MAKE-3PILE ?auto_53770 ?auto_53771 ?auto_53772 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53774 - BLOCK
      ?auto_53775 - BLOCK
      ?auto_53776 - BLOCK
    )
    :vars
    (
      ?auto_53777 - BLOCK
      ?auto_53780 - BLOCK
      ?auto_53779 - BLOCK
      ?auto_53778 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53774 ) ( not ( = ?auto_53774 ?auto_53775 ) ) ( not ( = ?auto_53774 ?auto_53776 ) ) ( not ( = ?auto_53775 ?auto_53776 ) ) ( ON ?auto_53776 ?auto_53777 ) ( not ( = ?auto_53774 ?auto_53777 ) ) ( not ( = ?auto_53775 ?auto_53777 ) ) ( not ( = ?auto_53776 ?auto_53777 ) ) ( CLEAR ?auto_53774 ) ( ON ?auto_53775 ?auto_53776 ) ( CLEAR ?auto_53775 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53780 ) ( ON ?auto_53779 ?auto_53780 ) ( ON ?auto_53778 ?auto_53779 ) ( ON ?auto_53777 ?auto_53778 ) ( not ( = ?auto_53780 ?auto_53779 ) ) ( not ( = ?auto_53780 ?auto_53778 ) ) ( not ( = ?auto_53780 ?auto_53777 ) ) ( not ( = ?auto_53780 ?auto_53776 ) ) ( not ( = ?auto_53780 ?auto_53775 ) ) ( not ( = ?auto_53779 ?auto_53778 ) ) ( not ( = ?auto_53779 ?auto_53777 ) ) ( not ( = ?auto_53779 ?auto_53776 ) ) ( not ( = ?auto_53779 ?auto_53775 ) ) ( not ( = ?auto_53778 ?auto_53777 ) ) ( not ( = ?auto_53778 ?auto_53776 ) ) ( not ( = ?auto_53778 ?auto_53775 ) ) ( not ( = ?auto_53774 ?auto_53780 ) ) ( not ( = ?auto_53774 ?auto_53779 ) ) ( not ( = ?auto_53774 ?auto_53778 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53780 ?auto_53779 ?auto_53778 ?auto_53777 ?auto_53776 )
      ( MAKE-3PILE ?auto_53774 ?auto_53775 ?auto_53776 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53781 - BLOCK
      ?auto_53782 - BLOCK
      ?auto_53783 - BLOCK
    )
    :vars
    (
      ?auto_53787 - BLOCK
      ?auto_53785 - BLOCK
      ?auto_53784 - BLOCK
      ?auto_53786 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53781 ?auto_53782 ) ) ( not ( = ?auto_53781 ?auto_53783 ) ) ( not ( = ?auto_53782 ?auto_53783 ) ) ( ON ?auto_53783 ?auto_53787 ) ( not ( = ?auto_53781 ?auto_53787 ) ) ( not ( = ?auto_53782 ?auto_53787 ) ) ( not ( = ?auto_53783 ?auto_53787 ) ) ( ON ?auto_53782 ?auto_53783 ) ( CLEAR ?auto_53782 ) ( ON-TABLE ?auto_53785 ) ( ON ?auto_53784 ?auto_53785 ) ( ON ?auto_53786 ?auto_53784 ) ( ON ?auto_53787 ?auto_53786 ) ( not ( = ?auto_53785 ?auto_53784 ) ) ( not ( = ?auto_53785 ?auto_53786 ) ) ( not ( = ?auto_53785 ?auto_53787 ) ) ( not ( = ?auto_53785 ?auto_53783 ) ) ( not ( = ?auto_53785 ?auto_53782 ) ) ( not ( = ?auto_53784 ?auto_53786 ) ) ( not ( = ?auto_53784 ?auto_53787 ) ) ( not ( = ?auto_53784 ?auto_53783 ) ) ( not ( = ?auto_53784 ?auto_53782 ) ) ( not ( = ?auto_53786 ?auto_53787 ) ) ( not ( = ?auto_53786 ?auto_53783 ) ) ( not ( = ?auto_53786 ?auto_53782 ) ) ( not ( = ?auto_53781 ?auto_53785 ) ) ( not ( = ?auto_53781 ?auto_53784 ) ) ( not ( = ?auto_53781 ?auto_53786 ) ) ( HOLDING ?auto_53781 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53781 )
      ( MAKE-3PILE ?auto_53781 ?auto_53782 ?auto_53783 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53788 - BLOCK
      ?auto_53789 - BLOCK
      ?auto_53790 - BLOCK
    )
    :vars
    (
      ?auto_53794 - BLOCK
      ?auto_53792 - BLOCK
      ?auto_53793 - BLOCK
      ?auto_53791 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53788 ?auto_53789 ) ) ( not ( = ?auto_53788 ?auto_53790 ) ) ( not ( = ?auto_53789 ?auto_53790 ) ) ( ON ?auto_53790 ?auto_53794 ) ( not ( = ?auto_53788 ?auto_53794 ) ) ( not ( = ?auto_53789 ?auto_53794 ) ) ( not ( = ?auto_53790 ?auto_53794 ) ) ( ON ?auto_53789 ?auto_53790 ) ( ON-TABLE ?auto_53792 ) ( ON ?auto_53793 ?auto_53792 ) ( ON ?auto_53791 ?auto_53793 ) ( ON ?auto_53794 ?auto_53791 ) ( not ( = ?auto_53792 ?auto_53793 ) ) ( not ( = ?auto_53792 ?auto_53791 ) ) ( not ( = ?auto_53792 ?auto_53794 ) ) ( not ( = ?auto_53792 ?auto_53790 ) ) ( not ( = ?auto_53792 ?auto_53789 ) ) ( not ( = ?auto_53793 ?auto_53791 ) ) ( not ( = ?auto_53793 ?auto_53794 ) ) ( not ( = ?auto_53793 ?auto_53790 ) ) ( not ( = ?auto_53793 ?auto_53789 ) ) ( not ( = ?auto_53791 ?auto_53794 ) ) ( not ( = ?auto_53791 ?auto_53790 ) ) ( not ( = ?auto_53791 ?auto_53789 ) ) ( not ( = ?auto_53788 ?auto_53792 ) ) ( not ( = ?auto_53788 ?auto_53793 ) ) ( not ( = ?auto_53788 ?auto_53791 ) ) ( ON ?auto_53788 ?auto_53789 ) ( CLEAR ?auto_53788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_53792 ?auto_53793 ?auto_53791 ?auto_53794 ?auto_53790 ?auto_53789 )
      ( MAKE-3PILE ?auto_53788 ?auto_53789 ?auto_53790 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53798 - BLOCK
      ?auto_53799 - BLOCK
      ?auto_53800 - BLOCK
    )
    :vars
    (
      ?auto_53801 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53801 ?auto_53800 ) ( CLEAR ?auto_53801 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53798 ) ( ON ?auto_53799 ?auto_53798 ) ( ON ?auto_53800 ?auto_53799 ) ( not ( = ?auto_53798 ?auto_53799 ) ) ( not ( = ?auto_53798 ?auto_53800 ) ) ( not ( = ?auto_53798 ?auto_53801 ) ) ( not ( = ?auto_53799 ?auto_53800 ) ) ( not ( = ?auto_53799 ?auto_53801 ) ) ( not ( = ?auto_53800 ?auto_53801 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53801 ?auto_53800 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53802 - BLOCK
      ?auto_53803 - BLOCK
      ?auto_53804 - BLOCK
    )
    :vars
    (
      ?auto_53805 - BLOCK
      ?auto_53806 - BLOCK
      ?auto_53807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53805 ?auto_53804 ) ( CLEAR ?auto_53805 ) ( ON-TABLE ?auto_53802 ) ( ON ?auto_53803 ?auto_53802 ) ( ON ?auto_53804 ?auto_53803 ) ( not ( = ?auto_53802 ?auto_53803 ) ) ( not ( = ?auto_53802 ?auto_53804 ) ) ( not ( = ?auto_53802 ?auto_53805 ) ) ( not ( = ?auto_53803 ?auto_53804 ) ) ( not ( = ?auto_53803 ?auto_53805 ) ) ( not ( = ?auto_53804 ?auto_53805 ) ) ( HOLDING ?auto_53806 ) ( CLEAR ?auto_53807 ) ( not ( = ?auto_53802 ?auto_53806 ) ) ( not ( = ?auto_53802 ?auto_53807 ) ) ( not ( = ?auto_53803 ?auto_53806 ) ) ( not ( = ?auto_53803 ?auto_53807 ) ) ( not ( = ?auto_53804 ?auto_53806 ) ) ( not ( = ?auto_53804 ?auto_53807 ) ) ( not ( = ?auto_53805 ?auto_53806 ) ) ( not ( = ?auto_53805 ?auto_53807 ) ) ( not ( = ?auto_53806 ?auto_53807 ) ) )
    :subtasks
    ( ( !STACK ?auto_53806 ?auto_53807 )
      ( MAKE-3PILE ?auto_53802 ?auto_53803 ?auto_53804 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53808 - BLOCK
      ?auto_53809 - BLOCK
      ?auto_53810 - BLOCK
    )
    :vars
    (
      ?auto_53812 - BLOCK
      ?auto_53811 - BLOCK
      ?auto_53813 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53812 ?auto_53810 ) ( ON-TABLE ?auto_53808 ) ( ON ?auto_53809 ?auto_53808 ) ( ON ?auto_53810 ?auto_53809 ) ( not ( = ?auto_53808 ?auto_53809 ) ) ( not ( = ?auto_53808 ?auto_53810 ) ) ( not ( = ?auto_53808 ?auto_53812 ) ) ( not ( = ?auto_53809 ?auto_53810 ) ) ( not ( = ?auto_53809 ?auto_53812 ) ) ( not ( = ?auto_53810 ?auto_53812 ) ) ( CLEAR ?auto_53811 ) ( not ( = ?auto_53808 ?auto_53813 ) ) ( not ( = ?auto_53808 ?auto_53811 ) ) ( not ( = ?auto_53809 ?auto_53813 ) ) ( not ( = ?auto_53809 ?auto_53811 ) ) ( not ( = ?auto_53810 ?auto_53813 ) ) ( not ( = ?auto_53810 ?auto_53811 ) ) ( not ( = ?auto_53812 ?auto_53813 ) ) ( not ( = ?auto_53812 ?auto_53811 ) ) ( not ( = ?auto_53813 ?auto_53811 ) ) ( ON ?auto_53813 ?auto_53812 ) ( CLEAR ?auto_53813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53808 ?auto_53809 ?auto_53810 ?auto_53812 )
      ( MAKE-3PILE ?auto_53808 ?auto_53809 ?auto_53810 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53814 - BLOCK
      ?auto_53815 - BLOCK
      ?auto_53816 - BLOCK
    )
    :vars
    (
      ?auto_53818 - BLOCK
      ?auto_53817 - BLOCK
      ?auto_53819 - BLOCK
      ?auto_53820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53818 ?auto_53816 ) ( ON-TABLE ?auto_53814 ) ( ON ?auto_53815 ?auto_53814 ) ( ON ?auto_53816 ?auto_53815 ) ( not ( = ?auto_53814 ?auto_53815 ) ) ( not ( = ?auto_53814 ?auto_53816 ) ) ( not ( = ?auto_53814 ?auto_53818 ) ) ( not ( = ?auto_53815 ?auto_53816 ) ) ( not ( = ?auto_53815 ?auto_53818 ) ) ( not ( = ?auto_53816 ?auto_53818 ) ) ( not ( = ?auto_53814 ?auto_53817 ) ) ( not ( = ?auto_53814 ?auto_53819 ) ) ( not ( = ?auto_53815 ?auto_53817 ) ) ( not ( = ?auto_53815 ?auto_53819 ) ) ( not ( = ?auto_53816 ?auto_53817 ) ) ( not ( = ?auto_53816 ?auto_53819 ) ) ( not ( = ?auto_53818 ?auto_53817 ) ) ( not ( = ?auto_53818 ?auto_53819 ) ) ( not ( = ?auto_53817 ?auto_53819 ) ) ( ON ?auto_53817 ?auto_53818 ) ( CLEAR ?auto_53817 ) ( HOLDING ?auto_53819 ) ( CLEAR ?auto_53820 ) ( ON-TABLE ?auto_53820 ) ( not ( = ?auto_53820 ?auto_53819 ) ) ( not ( = ?auto_53814 ?auto_53820 ) ) ( not ( = ?auto_53815 ?auto_53820 ) ) ( not ( = ?auto_53816 ?auto_53820 ) ) ( not ( = ?auto_53818 ?auto_53820 ) ) ( not ( = ?auto_53817 ?auto_53820 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53820 ?auto_53819 )
      ( MAKE-3PILE ?auto_53814 ?auto_53815 ?auto_53816 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54512 - BLOCK
      ?auto_54513 - BLOCK
      ?auto_54514 - BLOCK
    )
    :vars
    (
      ?auto_54516 - BLOCK
      ?auto_54515 - BLOCK
      ?auto_54517 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54516 ?auto_54514 ) ( ON-TABLE ?auto_54512 ) ( ON ?auto_54513 ?auto_54512 ) ( ON ?auto_54514 ?auto_54513 ) ( not ( = ?auto_54512 ?auto_54513 ) ) ( not ( = ?auto_54512 ?auto_54514 ) ) ( not ( = ?auto_54512 ?auto_54516 ) ) ( not ( = ?auto_54513 ?auto_54514 ) ) ( not ( = ?auto_54513 ?auto_54516 ) ) ( not ( = ?auto_54514 ?auto_54516 ) ) ( not ( = ?auto_54512 ?auto_54515 ) ) ( not ( = ?auto_54512 ?auto_54517 ) ) ( not ( = ?auto_54513 ?auto_54515 ) ) ( not ( = ?auto_54513 ?auto_54517 ) ) ( not ( = ?auto_54514 ?auto_54515 ) ) ( not ( = ?auto_54514 ?auto_54517 ) ) ( not ( = ?auto_54516 ?auto_54515 ) ) ( not ( = ?auto_54516 ?auto_54517 ) ) ( not ( = ?auto_54515 ?auto_54517 ) ) ( ON ?auto_54515 ?auto_54516 ) ( ON ?auto_54517 ?auto_54515 ) ( CLEAR ?auto_54517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54512 ?auto_54513 ?auto_54514 ?auto_54516 ?auto_54515 )
      ( MAKE-3PILE ?auto_54512 ?auto_54513 ?auto_54514 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53828 - BLOCK
      ?auto_53829 - BLOCK
      ?auto_53830 - BLOCK
    )
    :vars
    (
      ?auto_53834 - BLOCK
      ?auto_53833 - BLOCK
      ?auto_53832 - BLOCK
      ?auto_53831 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53834 ?auto_53830 ) ( ON-TABLE ?auto_53828 ) ( ON ?auto_53829 ?auto_53828 ) ( ON ?auto_53830 ?auto_53829 ) ( not ( = ?auto_53828 ?auto_53829 ) ) ( not ( = ?auto_53828 ?auto_53830 ) ) ( not ( = ?auto_53828 ?auto_53834 ) ) ( not ( = ?auto_53829 ?auto_53830 ) ) ( not ( = ?auto_53829 ?auto_53834 ) ) ( not ( = ?auto_53830 ?auto_53834 ) ) ( not ( = ?auto_53828 ?auto_53833 ) ) ( not ( = ?auto_53828 ?auto_53832 ) ) ( not ( = ?auto_53829 ?auto_53833 ) ) ( not ( = ?auto_53829 ?auto_53832 ) ) ( not ( = ?auto_53830 ?auto_53833 ) ) ( not ( = ?auto_53830 ?auto_53832 ) ) ( not ( = ?auto_53834 ?auto_53833 ) ) ( not ( = ?auto_53834 ?auto_53832 ) ) ( not ( = ?auto_53833 ?auto_53832 ) ) ( ON ?auto_53833 ?auto_53834 ) ( not ( = ?auto_53831 ?auto_53832 ) ) ( not ( = ?auto_53828 ?auto_53831 ) ) ( not ( = ?auto_53829 ?auto_53831 ) ) ( not ( = ?auto_53830 ?auto_53831 ) ) ( not ( = ?auto_53834 ?auto_53831 ) ) ( not ( = ?auto_53833 ?auto_53831 ) ) ( ON ?auto_53832 ?auto_53833 ) ( CLEAR ?auto_53832 ) ( HOLDING ?auto_53831 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53831 )
      ( MAKE-3PILE ?auto_53828 ?auto_53829 ?auto_53830 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53835 - BLOCK
      ?auto_53836 - BLOCK
      ?auto_53837 - BLOCK
    )
    :vars
    (
      ?auto_53841 - BLOCK
      ?auto_53839 - BLOCK
      ?auto_53838 - BLOCK
      ?auto_53840 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53841 ?auto_53837 ) ( ON-TABLE ?auto_53835 ) ( ON ?auto_53836 ?auto_53835 ) ( ON ?auto_53837 ?auto_53836 ) ( not ( = ?auto_53835 ?auto_53836 ) ) ( not ( = ?auto_53835 ?auto_53837 ) ) ( not ( = ?auto_53835 ?auto_53841 ) ) ( not ( = ?auto_53836 ?auto_53837 ) ) ( not ( = ?auto_53836 ?auto_53841 ) ) ( not ( = ?auto_53837 ?auto_53841 ) ) ( not ( = ?auto_53835 ?auto_53839 ) ) ( not ( = ?auto_53835 ?auto_53838 ) ) ( not ( = ?auto_53836 ?auto_53839 ) ) ( not ( = ?auto_53836 ?auto_53838 ) ) ( not ( = ?auto_53837 ?auto_53839 ) ) ( not ( = ?auto_53837 ?auto_53838 ) ) ( not ( = ?auto_53841 ?auto_53839 ) ) ( not ( = ?auto_53841 ?auto_53838 ) ) ( not ( = ?auto_53839 ?auto_53838 ) ) ( ON ?auto_53839 ?auto_53841 ) ( not ( = ?auto_53840 ?auto_53838 ) ) ( not ( = ?auto_53835 ?auto_53840 ) ) ( not ( = ?auto_53836 ?auto_53840 ) ) ( not ( = ?auto_53837 ?auto_53840 ) ) ( not ( = ?auto_53841 ?auto_53840 ) ) ( not ( = ?auto_53839 ?auto_53840 ) ) ( ON ?auto_53838 ?auto_53839 ) ( ON ?auto_53840 ?auto_53838 ) ( CLEAR ?auto_53840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_53835 ?auto_53836 ?auto_53837 ?auto_53841 ?auto_53839 ?auto_53838 )
      ( MAKE-3PILE ?auto_53835 ?auto_53836 ?auto_53837 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53846 - BLOCK
      ?auto_53847 - BLOCK
      ?auto_53848 - BLOCK
      ?auto_53849 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_53849 ) ( CLEAR ?auto_53848 ) ( ON-TABLE ?auto_53846 ) ( ON ?auto_53847 ?auto_53846 ) ( ON ?auto_53848 ?auto_53847 ) ( not ( = ?auto_53846 ?auto_53847 ) ) ( not ( = ?auto_53846 ?auto_53848 ) ) ( not ( = ?auto_53846 ?auto_53849 ) ) ( not ( = ?auto_53847 ?auto_53848 ) ) ( not ( = ?auto_53847 ?auto_53849 ) ) ( not ( = ?auto_53848 ?auto_53849 ) ) )
    :subtasks
    ( ( !STACK ?auto_53849 ?auto_53848 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53850 - BLOCK
      ?auto_53851 - BLOCK
      ?auto_53852 - BLOCK
      ?auto_53853 - BLOCK
    )
    :vars
    (
      ?auto_53854 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_53852 ) ( ON-TABLE ?auto_53850 ) ( ON ?auto_53851 ?auto_53850 ) ( ON ?auto_53852 ?auto_53851 ) ( not ( = ?auto_53850 ?auto_53851 ) ) ( not ( = ?auto_53850 ?auto_53852 ) ) ( not ( = ?auto_53850 ?auto_53853 ) ) ( not ( = ?auto_53851 ?auto_53852 ) ) ( not ( = ?auto_53851 ?auto_53853 ) ) ( not ( = ?auto_53852 ?auto_53853 ) ) ( ON ?auto_53853 ?auto_53854 ) ( CLEAR ?auto_53853 ) ( HAND-EMPTY ) ( not ( = ?auto_53850 ?auto_53854 ) ) ( not ( = ?auto_53851 ?auto_53854 ) ) ( not ( = ?auto_53852 ?auto_53854 ) ) ( not ( = ?auto_53853 ?auto_53854 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53853 ?auto_53854 )
      ( MAKE-4PILE ?auto_53850 ?auto_53851 ?auto_53852 ?auto_53853 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53855 - BLOCK
      ?auto_53856 - BLOCK
      ?auto_53857 - BLOCK
      ?auto_53858 - BLOCK
    )
    :vars
    (
      ?auto_53859 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53855 ) ( ON ?auto_53856 ?auto_53855 ) ( not ( = ?auto_53855 ?auto_53856 ) ) ( not ( = ?auto_53855 ?auto_53857 ) ) ( not ( = ?auto_53855 ?auto_53858 ) ) ( not ( = ?auto_53856 ?auto_53857 ) ) ( not ( = ?auto_53856 ?auto_53858 ) ) ( not ( = ?auto_53857 ?auto_53858 ) ) ( ON ?auto_53858 ?auto_53859 ) ( CLEAR ?auto_53858 ) ( not ( = ?auto_53855 ?auto_53859 ) ) ( not ( = ?auto_53856 ?auto_53859 ) ) ( not ( = ?auto_53857 ?auto_53859 ) ) ( not ( = ?auto_53858 ?auto_53859 ) ) ( HOLDING ?auto_53857 ) ( CLEAR ?auto_53856 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53855 ?auto_53856 ?auto_53857 )
      ( MAKE-4PILE ?auto_53855 ?auto_53856 ?auto_53857 ?auto_53858 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53860 - BLOCK
      ?auto_53861 - BLOCK
      ?auto_53862 - BLOCK
      ?auto_53863 - BLOCK
    )
    :vars
    (
      ?auto_53864 - BLOCK
      ?auto_53865 - BLOCK
      ?auto_53866 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53860 ) ( ON ?auto_53861 ?auto_53860 ) ( not ( = ?auto_53860 ?auto_53861 ) ) ( not ( = ?auto_53860 ?auto_53862 ) ) ( not ( = ?auto_53860 ?auto_53863 ) ) ( not ( = ?auto_53861 ?auto_53862 ) ) ( not ( = ?auto_53861 ?auto_53863 ) ) ( not ( = ?auto_53862 ?auto_53863 ) ) ( ON ?auto_53863 ?auto_53864 ) ( not ( = ?auto_53860 ?auto_53864 ) ) ( not ( = ?auto_53861 ?auto_53864 ) ) ( not ( = ?auto_53862 ?auto_53864 ) ) ( not ( = ?auto_53863 ?auto_53864 ) ) ( CLEAR ?auto_53861 ) ( ON ?auto_53862 ?auto_53863 ) ( CLEAR ?auto_53862 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53865 ) ( ON ?auto_53866 ?auto_53865 ) ( ON ?auto_53864 ?auto_53866 ) ( not ( = ?auto_53865 ?auto_53866 ) ) ( not ( = ?auto_53865 ?auto_53864 ) ) ( not ( = ?auto_53865 ?auto_53863 ) ) ( not ( = ?auto_53865 ?auto_53862 ) ) ( not ( = ?auto_53866 ?auto_53864 ) ) ( not ( = ?auto_53866 ?auto_53863 ) ) ( not ( = ?auto_53866 ?auto_53862 ) ) ( not ( = ?auto_53860 ?auto_53865 ) ) ( not ( = ?auto_53860 ?auto_53866 ) ) ( not ( = ?auto_53861 ?auto_53865 ) ) ( not ( = ?auto_53861 ?auto_53866 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53865 ?auto_53866 ?auto_53864 ?auto_53863 )
      ( MAKE-4PILE ?auto_53860 ?auto_53861 ?auto_53862 ?auto_53863 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53867 - BLOCK
      ?auto_53868 - BLOCK
      ?auto_53869 - BLOCK
      ?auto_53870 - BLOCK
    )
    :vars
    (
      ?auto_53873 - BLOCK
      ?auto_53871 - BLOCK
      ?auto_53872 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53867 ) ( not ( = ?auto_53867 ?auto_53868 ) ) ( not ( = ?auto_53867 ?auto_53869 ) ) ( not ( = ?auto_53867 ?auto_53870 ) ) ( not ( = ?auto_53868 ?auto_53869 ) ) ( not ( = ?auto_53868 ?auto_53870 ) ) ( not ( = ?auto_53869 ?auto_53870 ) ) ( ON ?auto_53870 ?auto_53873 ) ( not ( = ?auto_53867 ?auto_53873 ) ) ( not ( = ?auto_53868 ?auto_53873 ) ) ( not ( = ?auto_53869 ?auto_53873 ) ) ( not ( = ?auto_53870 ?auto_53873 ) ) ( ON ?auto_53869 ?auto_53870 ) ( CLEAR ?auto_53869 ) ( ON-TABLE ?auto_53871 ) ( ON ?auto_53872 ?auto_53871 ) ( ON ?auto_53873 ?auto_53872 ) ( not ( = ?auto_53871 ?auto_53872 ) ) ( not ( = ?auto_53871 ?auto_53873 ) ) ( not ( = ?auto_53871 ?auto_53870 ) ) ( not ( = ?auto_53871 ?auto_53869 ) ) ( not ( = ?auto_53872 ?auto_53873 ) ) ( not ( = ?auto_53872 ?auto_53870 ) ) ( not ( = ?auto_53872 ?auto_53869 ) ) ( not ( = ?auto_53867 ?auto_53871 ) ) ( not ( = ?auto_53867 ?auto_53872 ) ) ( not ( = ?auto_53868 ?auto_53871 ) ) ( not ( = ?auto_53868 ?auto_53872 ) ) ( HOLDING ?auto_53868 ) ( CLEAR ?auto_53867 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53867 ?auto_53868 )
      ( MAKE-4PILE ?auto_53867 ?auto_53868 ?auto_53869 ?auto_53870 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53874 - BLOCK
      ?auto_53875 - BLOCK
      ?auto_53876 - BLOCK
      ?auto_53877 - BLOCK
    )
    :vars
    (
      ?auto_53880 - BLOCK
      ?auto_53879 - BLOCK
      ?auto_53878 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53874 ) ( not ( = ?auto_53874 ?auto_53875 ) ) ( not ( = ?auto_53874 ?auto_53876 ) ) ( not ( = ?auto_53874 ?auto_53877 ) ) ( not ( = ?auto_53875 ?auto_53876 ) ) ( not ( = ?auto_53875 ?auto_53877 ) ) ( not ( = ?auto_53876 ?auto_53877 ) ) ( ON ?auto_53877 ?auto_53880 ) ( not ( = ?auto_53874 ?auto_53880 ) ) ( not ( = ?auto_53875 ?auto_53880 ) ) ( not ( = ?auto_53876 ?auto_53880 ) ) ( not ( = ?auto_53877 ?auto_53880 ) ) ( ON ?auto_53876 ?auto_53877 ) ( ON-TABLE ?auto_53879 ) ( ON ?auto_53878 ?auto_53879 ) ( ON ?auto_53880 ?auto_53878 ) ( not ( = ?auto_53879 ?auto_53878 ) ) ( not ( = ?auto_53879 ?auto_53880 ) ) ( not ( = ?auto_53879 ?auto_53877 ) ) ( not ( = ?auto_53879 ?auto_53876 ) ) ( not ( = ?auto_53878 ?auto_53880 ) ) ( not ( = ?auto_53878 ?auto_53877 ) ) ( not ( = ?auto_53878 ?auto_53876 ) ) ( not ( = ?auto_53874 ?auto_53879 ) ) ( not ( = ?auto_53874 ?auto_53878 ) ) ( not ( = ?auto_53875 ?auto_53879 ) ) ( not ( = ?auto_53875 ?auto_53878 ) ) ( CLEAR ?auto_53874 ) ( ON ?auto_53875 ?auto_53876 ) ( CLEAR ?auto_53875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53879 ?auto_53878 ?auto_53880 ?auto_53877 ?auto_53876 )
      ( MAKE-4PILE ?auto_53874 ?auto_53875 ?auto_53876 ?auto_53877 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53881 - BLOCK
      ?auto_53882 - BLOCK
      ?auto_53883 - BLOCK
      ?auto_53884 - BLOCK
    )
    :vars
    (
      ?auto_53886 - BLOCK
      ?auto_53885 - BLOCK
      ?auto_53887 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53881 ?auto_53882 ) ) ( not ( = ?auto_53881 ?auto_53883 ) ) ( not ( = ?auto_53881 ?auto_53884 ) ) ( not ( = ?auto_53882 ?auto_53883 ) ) ( not ( = ?auto_53882 ?auto_53884 ) ) ( not ( = ?auto_53883 ?auto_53884 ) ) ( ON ?auto_53884 ?auto_53886 ) ( not ( = ?auto_53881 ?auto_53886 ) ) ( not ( = ?auto_53882 ?auto_53886 ) ) ( not ( = ?auto_53883 ?auto_53886 ) ) ( not ( = ?auto_53884 ?auto_53886 ) ) ( ON ?auto_53883 ?auto_53884 ) ( ON-TABLE ?auto_53885 ) ( ON ?auto_53887 ?auto_53885 ) ( ON ?auto_53886 ?auto_53887 ) ( not ( = ?auto_53885 ?auto_53887 ) ) ( not ( = ?auto_53885 ?auto_53886 ) ) ( not ( = ?auto_53885 ?auto_53884 ) ) ( not ( = ?auto_53885 ?auto_53883 ) ) ( not ( = ?auto_53887 ?auto_53886 ) ) ( not ( = ?auto_53887 ?auto_53884 ) ) ( not ( = ?auto_53887 ?auto_53883 ) ) ( not ( = ?auto_53881 ?auto_53885 ) ) ( not ( = ?auto_53881 ?auto_53887 ) ) ( not ( = ?auto_53882 ?auto_53885 ) ) ( not ( = ?auto_53882 ?auto_53887 ) ) ( ON ?auto_53882 ?auto_53883 ) ( CLEAR ?auto_53882 ) ( HOLDING ?auto_53881 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53881 )
      ( MAKE-4PILE ?auto_53881 ?auto_53882 ?auto_53883 ?auto_53884 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53888 - BLOCK
      ?auto_53889 - BLOCK
      ?auto_53890 - BLOCK
      ?auto_53891 - BLOCK
    )
    :vars
    (
      ?auto_53892 - BLOCK
      ?auto_53894 - BLOCK
      ?auto_53893 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53888 ?auto_53889 ) ) ( not ( = ?auto_53888 ?auto_53890 ) ) ( not ( = ?auto_53888 ?auto_53891 ) ) ( not ( = ?auto_53889 ?auto_53890 ) ) ( not ( = ?auto_53889 ?auto_53891 ) ) ( not ( = ?auto_53890 ?auto_53891 ) ) ( ON ?auto_53891 ?auto_53892 ) ( not ( = ?auto_53888 ?auto_53892 ) ) ( not ( = ?auto_53889 ?auto_53892 ) ) ( not ( = ?auto_53890 ?auto_53892 ) ) ( not ( = ?auto_53891 ?auto_53892 ) ) ( ON ?auto_53890 ?auto_53891 ) ( ON-TABLE ?auto_53894 ) ( ON ?auto_53893 ?auto_53894 ) ( ON ?auto_53892 ?auto_53893 ) ( not ( = ?auto_53894 ?auto_53893 ) ) ( not ( = ?auto_53894 ?auto_53892 ) ) ( not ( = ?auto_53894 ?auto_53891 ) ) ( not ( = ?auto_53894 ?auto_53890 ) ) ( not ( = ?auto_53893 ?auto_53892 ) ) ( not ( = ?auto_53893 ?auto_53891 ) ) ( not ( = ?auto_53893 ?auto_53890 ) ) ( not ( = ?auto_53888 ?auto_53894 ) ) ( not ( = ?auto_53888 ?auto_53893 ) ) ( not ( = ?auto_53889 ?auto_53894 ) ) ( not ( = ?auto_53889 ?auto_53893 ) ) ( ON ?auto_53889 ?auto_53890 ) ( ON ?auto_53888 ?auto_53889 ) ( CLEAR ?auto_53888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_53894 ?auto_53893 ?auto_53892 ?auto_53891 ?auto_53890 ?auto_53889 )
      ( MAKE-4PILE ?auto_53888 ?auto_53889 ?auto_53890 ?auto_53891 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_53897 - BLOCK
      ?auto_53898 - BLOCK
    )
    :vars
    (
      ?auto_53899 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53899 ?auto_53898 ) ( CLEAR ?auto_53899 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53897 ) ( ON ?auto_53898 ?auto_53897 ) ( not ( = ?auto_53897 ?auto_53898 ) ) ( not ( = ?auto_53897 ?auto_53899 ) ) ( not ( = ?auto_53898 ?auto_53899 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53899 ?auto_53898 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_53900 - BLOCK
      ?auto_53901 - BLOCK
    )
    :vars
    (
      ?auto_53902 - BLOCK
      ?auto_53903 - BLOCK
      ?auto_53904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53902 ?auto_53901 ) ( CLEAR ?auto_53902 ) ( ON-TABLE ?auto_53900 ) ( ON ?auto_53901 ?auto_53900 ) ( not ( = ?auto_53900 ?auto_53901 ) ) ( not ( = ?auto_53900 ?auto_53902 ) ) ( not ( = ?auto_53901 ?auto_53902 ) ) ( HOLDING ?auto_53903 ) ( CLEAR ?auto_53904 ) ( not ( = ?auto_53900 ?auto_53903 ) ) ( not ( = ?auto_53900 ?auto_53904 ) ) ( not ( = ?auto_53901 ?auto_53903 ) ) ( not ( = ?auto_53901 ?auto_53904 ) ) ( not ( = ?auto_53902 ?auto_53903 ) ) ( not ( = ?auto_53902 ?auto_53904 ) ) ( not ( = ?auto_53903 ?auto_53904 ) ) )
    :subtasks
    ( ( !STACK ?auto_53903 ?auto_53904 )
      ( MAKE-2PILE ?auto_53900 ?auto_53901 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_53905 - BLOCK
      ?auto_53906 - BLOCK
    )
    :vars
    (
      ?auto_53908 - BLOCK
      ?auto_53909 - BLOCK
      ?auto_53907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53908 ?auto_53906 ) ( ON-TABLE ?auto_53905 ) ( ON ?auto_53906 ?auto_53905 ) ( not ( = ?auto_53905 ?auto_53906 ) ) ( not ( = ?auto_53905 ?auto_53908 ) ) ( not ( = ?auto_53906 ?auto_53908 ) ) ( CLEAR ?auto_53909 ) ( not ( = ?auto_53905 ?auto_53907 ) ) ( not ( = ?auto_53905 ?auto_53909 ) ) ( not ( = ?auto_53906 ?auto_53907 ) ) ( not ( = ?auto_53906 ?auto_53909 ) ) ( not ( = ?auto_53908 ?auto_53907 ) ) ( not ( = ?auto_53908 ?auto_53909 ) ) ( not ( = ?auto_53907 ?auto_53909 ) ) ( ON ?auto_53907 ?auto_53908 ) ( CLEAR ?auto_53907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53905 ?auto_53906 ?auto_53908 )
      ( MAKE-2PILE ?auto_53905 ?auto_53906 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_53910 - BLOCK
      ?auto_53911 - BLOCK
    )
    :vars
    (
      ?auto_53914 - BLOCK
      ?auto_53912 - BLOCK
      ?auto_53913 - BLOCK
      ?auto_53916 - BLOCK
      ?auto_53915 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53914 ?auto_53911 ) ( ON-TABLE ?auto_53910 ) ( ON ?auto_53911 ?auto_53910 ) ( not ( = ?auto_53910 ?auto_53911 ) ) ( not ( = ?auto_53910 ?auto_53914 ) ) ( not ( = ?auto_53911 ?auto_53914 ) ) ( not ( = ?auto_53910 ?auto_53912 ) ) ( not ( = ?auto_53910 ?auto_53913 ) ) ( not ( = ?auto_53911 ?auto_53912 ) ) ( not ( = ?auto_53911 ?auto_53913 ) ) ( not ( = ?auto_53914 ?auto_53912 ) ) ( not ( = ?auto_53914 ?auto_53913 ) ) ( not ( = ?auto_53912 ?auto_53913 ) ) ( ON ?auto_53912 ?auto_53914 ) ( CLEAR ?auto_53912 ) ( HOLDING ?auto_53913 ) ( CLEAR ?auto_53916 ) ( ON-TABLE ?auto_53915 ) ( ON ?auto_53916 ?auto_53915 ) ( not ( = ?auto_53915 ?auto_53916 ) ) ( not ( = ?auto_53915 ?auto_53913 ) ) ( not ( = ?auto_53916 ?auto_53913 ) ) ( not ( = ?auto_53910 ?auto_53916 ) ) ( not ( = ?auto_53910 ?auto_53915 ) ) ( not ( = ?auto_53911 ?auto_53916 ) ) ( not ( = ?auto_53911 ?auto_53915 ) ) ( not ( = ?auto_53914 ?auto_53916 ) ) ( not ( = ?auto_53914 ?auto_53915 ) ) ( not ( = ?auto_53912 ?auto_53916 ) ) ( not ( = ?auto_53912 ?auto_53915 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53915 ?auto_53916 ?auto_53913 )
      ( MAKE-2PILE ?auto_53910 ?auto_53911 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_53917 - BLOCK
      ?auto_53918 - BLOCK
    )
    :vars
    (
      ?auto_53920 - BLOCK
      ?auto_53921 - BLOCK
      ?auto_53923 - BLOCK
      ?auto_53922 - BLOCK
      ?auto_53919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53920 ?auto_53918 ) ( ON-TABLE ?auto_53917 ) ( ON ?auto_53918 ?auto_53917 ) ( not ( = ?auto_53917 ?auto_53918 ) ) ( not ( = ?auto_53917 ?auto_53920 ) ) ( not ( = ?auto_53918 ?auto_53920 ) ) ( not ( = ?auto_53917 ?auto_53921 ) ) ( not ( = ?auto_53917 ?auto_53923 ) ) ( not ( = ?auto_53918 ?auto_53921 ) ) ( not ( = ?auto_53918 ?auto_53923 ) ) ( not ( = ?auto_53920 ?auto_53921 ) ) ( not ( = ?auto_53920 ?auto_53923 ) ) ( not ( = ?auto_53921 ?auto_53923 ) ) ( ON ?auto_53921 ?auto_53920 ) ( CLEAR ?auto_53922 ) ( ON-TABLE ?auto_53919 ) ( ON ?auto_53922 ?auto_53919 ) ( not ( = ?auto_53919 ?auto_53922 ) ) ( not ( = ?auto_53919 ?auto_53923 ) ) ( not ( = ?auto_53922 ?auto_53923 ) ) ( not ( = ?auto_53917 ?auto_53922 ) ) ( not ( = ?auto_53917 ?auto_53919 ) ) ( not ( = ?auto_53918 ?auto_53922 ) ) ( not ( = ?auto_53918 ?auto_53919 ) ) ( not ( = ?auto_53920 ?auto_53922 ) ) ( not ( = ?auto_53920 ?auto_53919 ) ) ( not ( = ?auto_53921 ?auto_53922 ) ) ( not ( = ?auto_53921 ?auto_53919 ) ) ( ON ?auto_53923 ?auto_53921 ) ( CLEAR ?auto_53923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53917 ?auto_53918 ?auto_53920 ?auto_53921 )
      ( MAKE-2PILE ?auto_53917 ?auto_53918 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_53924 - BLOCK
      ?auto_53925 - BLOCK
    )
    :vars
    (
      ?auto_53927 - BLOCK
      ?auto_53926 - BLOCK
      ?auto_53930 - BLOCK
      ?auto_53929 - BLOCK
      ?auto_53928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53927 ?auto_53925 ) ( ON-TABLE ?auto_53924 ) ( ON ?auto_53925 ?auto_53924 ) ( not ( = ?auto_53924 ?auto_53925 ) ) ( not ( = ?auto_53924 ?auto_53927 ) ) ( not ( = ?auto_53925 ?auto_53927 ) ) ( not ( = ?auto_53924 ?auto_53926 ) ) ( not ( = ?auto_53924 ?auto_53930 ) ) ( not ( = ?auto_53925 ?auto_53926 ) ) ( not ( = ?auto_53925 ?auto_53930 ) ) ( not ( = ?auto_53927 ?auto_53926 ) ) ( not ( = ?auto_53927 ?auto_53930 ) ) ( not ( = ?auto_53926 ?auto_53930 ) ) ( ON ?auto_53926 ?auto_53927 ) ( ON-TABLE ?auto_53929 ) ( not ( = ?auto_53929 ?auto_53928 ) ) ( not ( = ?auto_53929 ?auto_53930 ) ) ( not ( = ?auto_53928 ?auto_53930 ) ) ( not ( = ?auto_53924 ?auto_53928 ) ) ( not ( = ?auto_53924 ?auto_53929 ) ) ( not ( = ?auto_53925 ?auto_53928 ) ) ( not ( = ?auto_53925 ?auto_53929 ) ) ( not ( = ?auto_53927 ?auto_53928 ) ) ( not ( = ?auto_53927 ?auto_53929 ) ) ( not ( = ?auto_53926 ?auto_53928 ) ) ( not ( = ?auto_53926 ?auto_53929 ) ) ( ON ?auto_53930 ?auto_53926 ) ( CLEAR ?auto_53930 ) ( HOLDING ?auto_53928 ) ( CLEAR ?auto_53929 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53929 ?auto_53928 )
      ( MAKE-2PILE ?auto_53924 ?auto_53925 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54702 - BLOCK
      ?auto_54703 - BLOCK
    )
    :vars
    (
      ?auto_54707 - BLOCK
      ?auto_54705 - BLOCK
      ?auto_54706 - BLOCK
      ?auto_54704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54707 ?auto_54703 ) ( ON-TABLE ?auto_54702 ) ( ON ?auto_54703 ?auto_54702 ) ( not ( = ?auto_54702 ?auto_54703 ) ) ( not ( = ?auto_54702 ?auto_54707 ) ) ( not ( = ?auto_54703 ?auto_54707 ) ) ( not ( = ?auto_54702 ?auto_54705 ) ) ( not ( = ?auto_54702 ?auto_54706 ) ) ( not ( = ?auto_54703 ?auto_54705 ) ) ( not ( = ?auto_54703 ?auto_54706 ) ) ( not ( = ?auto_54707 ?auto_54705 ) ) ( not ( = ?auto_54707 ?auto_54706 ) ) ( not ( = ?auto_54705 ?auto_54706 ) ) ( ON ?auto_54705 ?auto_54707 ) ( not ( = ?auto_54704 ?auto_54706 ) ) ( not ( = ?auto_54702 ?auto_54704 ) ) ( not ( = ?auto_54703 ?auto_54704 ) ) ( not ( = ?auto_54707 ?auto_54704 ) ) ( not ( = ?auto_54705 ?auto_54704 ) ) ( ON ?auto_54706 ?auto_54705 ) ( ON ?auto_54704 ?auto_54706 ) ( CLEAR ?auto_54704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54702 ?auto_54703 ?auto_54707 ?auto_54705 ?auto_54706 )
      ( MAKE-2PILE ?auto_54702 ?auto_54703 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_53938 - BLOCK
      ?auto_53939 - BLOCK
    )
    :vars
    (
      ?auto_53940 - BLOCK
      ?auto_53943 - BLOCK
      ?auto_53944 - BLOCK
      ?auto_53941 - BLOCK
      ?auto_53942 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53940 ?auto_53939 ) ( ON-TABLE ?auto_53938 ) ( ON ?auto_53939 ?auto_53938 ) ( not ( = ?auto_53938 ?auto_53939 ) ) ( not ( = ?auto_53938 ?auto_53940 ) ) ( not ( = ?auto_53939 ?auto_53940 ) ) ( not ( = ?auto_53938 ?auto_53943 ) ) ( not ( = ?auto_53938 ?auto_53944 ) ) ( not ( = ?auto_53939 ?auto_53943 ) ) ( not ( = ?auto_53939 ?auto_53944 ) ) ( not ( = ?auto_53940 ?auto_53943 ) ) ( not ( = ?auto_53940 ?auto_53944 ) ) ( not ( = ?auto_53943 ?auto_53944 ) ) ( ON ?auto_53943 ?auto_53940 ) ( not ( = ?auto_53941 ?auto_53942 ) ) ( not ( = ?auto_53941 ?auto_53944 ) ) ( not ( = ?auto_53942 ?auto_53944 ) ) ( not ( = ?auto_53938 ?auto_53942 ) ) ( not ( = ?auto_53938 ?auto_53941 ) ) ( not ( = ?auto_53939 ?auto_53942 ) ) ( not ( = ?auto_53939 ?auto_53941 ) ) ( not ( = ?auto_53940 ?auto_53942 ) ) ( not ( = ?auto_53940 ?auto_53941 ) ) ( not ( = ?auto_53943 ?auto_53942 ) ) ( not ( = ?auto_53943 ?auto_53941 ) ) ( ON ?auto_53944 ?auto_53943 ) ( ON ?auto_53942 ?auto_53944 ) ( CLEAR ?auto_53942 ) ( HOLDING ?auto_53941 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53941 )
      ( MAKE-2PILE ?auto_53938 ?auto_53939 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_53945 - BLOCK
      ?auto_53946 - BLOCK
    )
    :vars
    (
      ?auto_53949 - BLOCK
      ?auto_53950 - BLOCK
      ?auto_53951 - BLOCK
      ?auto_53947 - BLOCK
      ?auto_53948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53949 ?auto_53946 ) ( ON-TABLE ?auto_53945 ) ( ON ?auto_53946 ?auto_53945 ) ( not ( = ?auto_53945 ?auto_53946 ) ) ( not ( = ?auto_53945 ?auto_53949 ) ) ( not ( = ?auto_53946 ?auto_53949 ) ) ( not ( = ?auto_53945 ?auto_53950 ) ) ( not ( = ?auto_53945 ?auto_53951 ) ) ( not ( = ?auto_53946 ?auto_53950 ) ) ( not ( = ?auto_53946 ?auto_53951 ) ) ( not ( = ?auto_53949 ?auto_53950 ) ) ( not ( = ?auto_53949 ?auto_53951 ) ) ( not ( = ?auto_53950 ?auto_53951 ) ) ( ON ?auto_53950 ?auto_53949 ) ( not ( = ?auto_53947 ?auto_53948 ) ) ( not ( = ?auto_53947 ?auto_53951 ) ) ( not ( = ?auto_53948 ?auto_53951 ) ) ( not ( = ?auto_53945 ?auto_53948 ) ) ( not ( = ?auto_53945 ?auto_53947 ) ) ( not ( = ?auto_53946 ?auto_53948 ) ) ( not ( = ?auto_53946 ?auto_53947 ) ) ( not ( = ?auto_53949 ?auto_53948 ) ) ( not ( = ?auto_53949 ?auto_53947 ) ) ( not ( = ?auto_53950 ?auto_53948 ) ) ( not ( = ?auto_53950 ?auto_53947 ) ) ( ON ?auto_53951 ?auto_53950 ) ( ON ?auto_53948 ?auto_53951 ) ( ON ?auto_53947 ?auto_53948 ) ( CLEAR ?auto_53947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_53945 ?auto_53946 ?auto_53949 ?auto_53950 ?auto_53951 ?auto_53948 )
      ( MAKE-2PILE ?auto_53945 ?auto_53946 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53957 - BLOCK
      ?auto_53958 - BLOCK
      ?auto_53959 - BLOCK
      ?auto_53960 - BLOCK
      ?auto_53961 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_53961 ) ( CLEAR ?auto_53960 ) ( ON-TABLE ?auto_53957 ) ( ON ?auto_53958 ?auto_53957 ) ( ON ?auto_53959 ?auto_53958 ) ( ON ?auto_53960 ?auto_53959 ) ( not ( = ?auto_53957 ?auto_53958 ) ) ( not ( = ?auto_53957 ?auto_53959 ) ) ( not ( = ?auto_53957 ?auto_53960 ) ) ( not ( = ?auto_53957 ?auto_53961 ) ) ( not ( = ?auto_53958 ?auto_53959 ) ) ( not ( = ?auto_53958 ?auto_53960 ) ) ( not ( = ?auto_53958 ?auto_53961 ) ) ( not ( = ?auto_53959 ?auto_53960 ) ) ( not ( = ?auto_53959 ?auto_53961 ) ) ( not ( = ?auto_53960 ?auto_53961 ) ) )
    :subtasks
    ( ( !STACK ?auto_53961 ?auto_53960 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53962 - BLOCK
      ?auto_53963 - BLOCK
      ?auto_53964 - BLOCK
      ?auto_53965 - BLOCK
      ?auto_53966 - BLOCK
    )
    :vars
    (
      ?auto_53967 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_53965 ) ( ON-TABLE ?auto_53962 ) ( ON ?auto_53963 ?auto_53962 ) ( ON ?auto_53964 ?auto_53963 ) ( ON ?auto_53965 ?auto_53964 ) ( not ( = ?auto_53962 ?auto_53963 ) ) ( not ( = ?auto_53962 ?auto_53964 ) ) ( not ( = ?auto_53962 ?auto_53965 ) ) ( not ( = ?auto_53962 ?auto_53966 ) ) ( not ( = ?auto_53963 ?auto_53964 ) ) ( not ( = ?auto_53963 ?auto_53965 ) ) ( not ( = ?auto_53963 ?auto_53966 ) ) ( not ( = ?auto_53964 ?auto_53965 ) ) ( not ( = ?auto_53964 ?auto_53966 ) ) ( not ( = ?auto_53965 ?auto_53966 ) ) ( ON ?auto_53966 ?auto_53967 ) ( CLEAR ?auto_53966 ) ( HAND-EMPTY ) ( not ( = ?auto_53962 ?auto_53967 ) ) ( not ( = ?auto_53963 ?auto_53967 ) ) ( not ( = ?auto_53964 ?auto_53967 ) ) ( not ( = ?auto_53965 ?auto_53967 ) ) ( not ( = ?auto_53966 ?auto_53967 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53966 ?auto_53967 )
      ( MAKE-5PILE ?auto_53962 ?auto_53963 ?auto_53964 ?auto_53965 ?auto_53966 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53968 - BLOCK
      ?auto_53969 - BLOCK
      ?auto_53970 - BLOCK
      ?auto_53971 - BLOCK
      ?auto_53972 - BLOCK
    )
    :vars
    (
      ?auto_53973 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53968 ) ( ON ?auto_53969 ?auto_53968 ) ( ON ?auto_53970 ?auto_53969 ) ( not ( = ?auto_53968 ?auto_53969 ) ) ( not ( = ?auto_53968 ?auto_53970 ) ) ( not ( = ?auto_53968 ?auto_53971 ) ) ( not ( = ?auto_53968 ?auto_53972 ) ) ( not ( = ?auto_53969 ?auto_53970 ) ) ( not ( = ?auto_53969 ?auto_53971 ) ) ( not ( = ?auto_53969 ?auto_53972 ) ) ( not ( = ?auto_53970 ?auto_53971 ) ) ( not ( = ?auto_53970 ?auto_53972 ) ) ( not ( = ?auto_53971 ?auto_53972 ) ) ( ON ?auto_53972 ?auto_53973 ) ( CLEAR ?auto_53972 ) ( not ( = ?auto_53968 ?auto_53973 ) ) ( not ( = ?auto_53969 ?auto_53973 ) ) ( not ( = ?auto_53970 ?auto_53973 ) ) ( not ( = ?auto_53971 ?auto_53973 ) ) ( not ( = ?auto_53972 ?auto_53973 ) ) ( HOLDING ?auto_53971 ) ( CLEAR ?auto_53970 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53968 ?auto_53969 ?auto_53970 ?auto_53971 )
      ( MAKE-5PILE ?auto_53968 ?auto_53969 ?auto_53970 ?auto_53971 ?auto_53972 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53974 - BLOCK
      ?auto_53975 - BLOCK
      ?auto_53976 - BLOCK
      ?auto_53977 - BLOCK
      ?auto_53978 - BLOCK
    )
    :vars
    (
      ?auto_53979 - BLOCK
      ?auto_53980 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53974 ) ( ON ?auto_53975 ?auto_53974 ) ( ON ?auto_53976 ?auto_53975 ) ( not ( = ?auto_53974 ?auto_53975 ) ) ( not ( = ?auto_53974 ?auto_53976 ) ) ( not ( = ?auto_53974 ?auto_53977 ) ) ( not ( = ?auto_53974 ?auto_53978 ) ) ( not ( = ?auto_53975 ?auto_53976 ) ) ( not ( = ?auto_53975 ?auto_53977 ) ) ( not ( = ?auto_53975 ?auto_53978 ) ) ( not ( = ?auto_53976 ?auto_53977 ) ) ( not ( = ?auto_53976 ?auto_53978 ) ) ( not ( = ?auto_53977 ?auto_53978 ) ) ( ON ?auto_53978 ?auto_53979 ) ( not ( = ?auto_53974 ?auto_53979 ) ) ( not ( = ?auto_53975 ?auto_53979 ) ) ( not ( = ?auto_53976 ?auto_53979 ) ) ( not ( = ?auto_53977 ?auto_53979 ) ) ( not ( = ?auto_53978 ?auto_53979 ) ) ( CLEAR ?auto_53976 ) ( ON ?auto_53977 ?auto_53978 ) ( CLEAR ?auto_53977 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53980 ) ( ON ?auto_53979 ?auto_53980 ) ( not ( = ?auto_53980 ?auto_53979 ) ) ( not ( = ?auto_53980 ?auto_53978 ) ) ( not ( = ?auto_53980 ?auto_53977 ) ) ( not ( = ?auto_53974 ?auto_53980 ) ) ( not ( = ?auto_53975 ?auto_53980 ) ) ( not ( = ?auto_53976 ?auto_53980 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53980 ?auto_53979 ?auto_53978 )
      ( MAKE-5PILE ?auto_53974 ?auto_53975 ?auto_53976 ?auto_53977 ?auto_53978 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53981 - BLOCK
      ?auto_53982 - BLOCK
      ?auto_53983 - BLOCK
      ?auto_53984 - BLOCK
      ?auto_53985 - BLOCK
    )
    :vars
    (
      ?auto_53987 - BLOCK
      ?auto_53986 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53981 ) ( ON ?auto_53982 ?auto_53981 ) ( not ( = ?auto_53981 ?auto_53982 ) ) ( not ( = ?auto_53981 ?auto_53983 ) ) ( not ( = ?auto_53981 ?auto_53984 ) ) ( not ( = ?auto_53981 ?auto_53985 ) ) ( not ( = ?auto_53982 ?auto_53983 ) ) ( not ( = ?auto_53982 ?auto_53984 ) ) ( not ( = ?auto_53982 ?auto_53985 ) ) ( not ( = ?auto_53983 ?auto_53984 ) ) ( not ( = ?auto_53983 ?auto_53985 ) ) ( not ( = ?auto_53984 ?auto_53985 ) ) ( ON ?auto_53985 ?auto_53987 ) ( not ( = ?auto_53981 ?auto_53987 ) ) ( not ( = ?auto_53982 ?auto_53987 ) ) ( not ( = ?auto_53983 ?auto_53987 ) ) ( not ( = ?auto_53984 ?auto_53987 ) ) ( not ( = ?auto_53985 ?auto_53987 ) ) ( ON ?auto_53984 ?auto_53985 ) ( CLEAR ?auto_53984 ) ( ON-TABLE ?auto_53986 ) ( ON ?auto_53987 ?auto_53986 ) ( not ( = ?auto_53986 ?auto_53987 ) ) ( not ( = ?auto_53986 ?auto_53985 ) ) ( not ( = ?auto_53986 ?auto_53984 ) ) ( not ( = ?auto_53981 ?auto_53986 ) ) ( not ( = ?auto_53982 ?auto_53986 ) ) ( not ( = ?auto_53983 ?auto_53986 ) ) ( HOLDING ?auto_53983 ) ( CLEAR ?auto_53982 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53981 ?auto_53982 ?auto_53983 )
      ( MAKE-5PILE ?auto_53981 ?auto_53982 ?auto_53983 ?auto_53984 ?auto_53985 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53988 - BLOCK
      ?auto_53989 - BLOCK
      ?auto_53990 - BLOCK
      ?auto_53991 - BLOCK
      ?auto_53992 - BLOCK
    )
    :vars
    (
      ?auto_53993 - BLOCK
      ?auto_53994 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53988 ) ( ON ?auto_53989 ?auto_53988 ) ( not ( = ?auto_53988 ?auto_53989 ) ) ( not ( = ?auto_53988 ?auto_53990 ) ) ( not ( = ?auto_53988 ?auto_53991 ) ) ( not ( = ?auto_53988 ?auto_53992 ) ) ( not ( = ?auto_53989 ?auto_53990 ) ) ( not ( = ?auto_53989 ?auto_53991 ) ) ( not ( = ?auto_53989 ?auto_53992 ) ) ( not ( = ?auto_53990 ?auto_53991 ) ) ( not ( = ?auto_53990 ?auto_53992 ) ) ( not ( = ?auto_53991 ?auto_53992 ) ) ( ON ?auto_53992 ?auto_53993 ) ( not ( = ?auto_53988 ?auto_53993 ) ) ( not ( = ?auto_53989 ?auto_53993 ) ) ( not ( = ?auto_53990 ?auto_53993 ) ) ( not ( = ?auto_53991 ?auto_53993 ) ) ( not ( = ?auto_53992 ?auto_53993 ) ) ( ON ?auto_53991 ?auto_53992 ) ( ON-TABLE ?auto_53994 ) ( ON ?auto_53993 ?auto_53994 ) ( not ( = ?auto_53994 ?auto_53993 ) ) ( not ( = ?auto_53994 ?auto_53992 ) ) ( not ( = ?auto_53994 ?auto_53991 ) ) ( not ( = ?auto_53988 ?auto_53994 ) ) ( not ( = ?auto_53989 ?auto_53994 ) ) ( not ( = ?auto_53990 ?auto_53994 ) ) ( CLEAR ?auto_53989 ) ( ON ?auto_53990 ?auto_53991 ) ( CLEAR ?auto_53990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53994 ?auto_53993 ?auto_53992 ?auto_53991 )
      ( MAKE-5PILE ?auto_53988 ?auto_53989 ?auto_53990 ?auto_53991 ?auto_53992 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53995 - BLOCK
      ?auto_53996 - BLOCK
      ?auto_53997 - BLOCK
      ?auto_53998 - BLOCK
      ?auto_53999 - BLOCK
    )
    :vars
    (
      ?auto_54000 - BLOCK
      ?auto_54001 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53995 ) ( not ( = ?auto_53995 ?auto_53996 ) ) ( not ( = ?auto_53995 ?auto_53997 ) ) ( not ( = ?auto_53995 ?auto_53998 ) ) ( not ( = ?auto_53995 ?auto_53999 ) ) ( not ( = ?auto_53996 ?auto_53997 ) ) ( not ( = ?auto_53996 ?auto_53998 ) ) ( not ( = ?auto_53996 ?auto_53999 ) ) ( not ( = ?auto_53997 ?auto_53998 ) ) ( not ( = ?auto_53997 ?auto_53999 ) ) ( not ( = ?auto_53998 ?auto_53999 ) ) ( ON ?auto_53999 ?auto_54000 ) ( not ( = ?auto_53995 ?auto_54000 ) ) ( not ( = ?auto_53996 ?auto_54000 ) ) ( not ( = ?auto_53997 ?auto_54000 ) ) ( not ( = ?auto_53998 ?auto_54000 ) ) ( not ( = ?auto_53999 ?auto_54000 ) ) ( ON ?auto_53998 ?auto_53999 ) ( ON-TABLE ?auto_54001 ) ( ON ?auto_54000 ?auto_54001 ) ( not ( = ?auto_54001 ?auto_54000 ) ) ( not ( = ?auto_54001 ?auto_53999 ) ) ( not ( = ?auto_54001 ?auto_53998 ) ) ( not ( = ?auto_53995 ?auto_54001 ) ) ( not ( = ?auto_53996 ?auto_54001 ) ) ( not ( = ?auto_53997 ?auto_54001 ) ) ( ON ?auto_53997 ?auto_53998 ) ( CLEAR ?auto_53997 ) ( HOLDING ?auto_53996 ) ( CLEAR ?auto_53995 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53995 ?auto_53996 )
      ( MAKE-5PILE ?auto_53995 ?auto_53996 ?auto_53997 ?auto_53998 ?auto_53999 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_54002 - BLOCK
      ?auto_54003 - BLOCK
      ?auto_54004 - BLOCK
      ?auto_54005 - BLOCK
      ?auto_54006 - BLOCK
    )
    :vars
    (
      ?auto_54007 - BLOCK
      ?auto_54008 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54002 ) ( not ( = ?auto_54002 ?auto_54003 ) ) ( not ( = ?auto_54002 ?auto_54004 ) ) ( not ( = ?auto_54002 ?auto_54005 ) ) ( not ( = ?auto_54002 ?auto_54006 ) ) ( not ( = ?auto_54003 ?auto_54004 ) ) ( not ( = ?auto_54003 ?auto_54005 ) ) ( not ( = ?auto_54003 ?auto_54006 ) ) ( not ( = ?auto_54004 ?auto_54005 ) ) ( not ( = ?auto_54004 ?auto_54006 ) ) ( not ( = ?auto_54005 ?auto_54006 ) ) ( ON ?auto_54006 ?auto_54007 ) ( not ( = ?auto_54002 ?auto_54007 ) ) ( not ( = ?auto_54003 ?auto_54007 ) ) ( not ( = ?auto_54004 ?auto_54007 ) ) ( not ( = ?auto_54005 ?auto_54007 ) ) ( not ( = ?auto_54006 ?auto_54007 ) ) ( ON ?auto_54005 ?auto_54006 ) ( ON-TABLE ?auto_54008 ) ( ON ?auto_54007 ?auto_54008 ) ( not ( = ?auto_54008 ?auto_54007 ) ) ( not ( = ?auto_54008 ?auto_54006 ) ) ( not ( = ?auto_54008 ?auto_54005 ) ) ( not ( = ?auto_54002 ?auto_54008 ) ) ( not ( = ?auto_54003 ?auto_54008 ) ) ( not ( = ?auto_54004 ?auto_54008 ) ) ( ON ?auto_54004 ?auto_54005 ) ( CLEAR ?auto_54002 ) ( ON ?auto_54003 ?auto_54004 ) ( CLEAR ?auto_54003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54008 ?auto_54007 ?auto_54006 ?auto_54005 ?auto_54004 )
      ( MAKE-5PILE ?auto_54002 ?auto_54003 ?auto_54004 ?auto_54005 ?auto_54006 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_54009 - BLOCK
      ?auto_54010 - BLOCK
      ?auto_54011 - BLOCK
      ?auto_54012 - BLOCK
      ?auto_54013 - BLOCK
    )
    :vars
    (
      ?auto_54014 - BLOCK
      ?auto_54015 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54009 ?auto_54010 ) ) ( not ( = ?auto_54009 ?auto_54011 ) ) ( not ( = ?auto_54009 ?auto_54012 ) ) ( not ( = ?auto_54009 ?auto_54013 ) ) ( not ( = ?auto_54010 ?auto_54011 ) ) ( not ( = ?auto_54010 ?auto_54012 ) ) ( not ( = ?auto_54010 ?auto_54013 ) ) ( not ( = ?auto_54011 ?auto_54012 ) ) ( not ( = ?auto_54011 ?auto_54013 ) ) ( not ( = ?auto_54012 ?auto_54013 ) ) ( ON ?auto_54013 ?auto_54014 ) ( not ( = ?auto_54009 ?auto_54014 ) ) ( not ( = ?auto_54010 ?auto_54014 ) ) ( not ( = ?auto_54011 ?auto_54014 ) ) ( not ( = ?auto_54012 ?auto_54014 ) ) ( not ( = ?auto_54013 ?auto_54014 ) ) ( ON ?auto_54012 ?auto_54013 ) ( ON-TABLE ?auto_54015 ) ( ON ?auto_54014 ?auto_54015 ) ( not ( = ?auto_54015 ?auto_54014 ) ) ( not ( = ?auto_54015 ?auto_54013 ) ) ( not ( = ?auto_54015 ?auto_54012 ) ) ( not ( = ?auto_54009 ?auto_54015 ) ) ( not ( = ?auto_54010 ?auto_54015 ) ) ( not ( = ?auto_54011 ?auto_54015 ) ) ( ON ?auto_54011 ?auto_54012 ) ( ON ?auto_54010 ?auto_54011 ) ( CLEAR ?auto_54010 ) ( HOLDING ?auto_54009 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_54009 )
      ( MAKE-5PILE ?auto_54009 ?auto_54010 ?auto_54011 ?auto_54012 ?auto_54013 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_54016 - BLOCK
      ?auto_54017 - BLOCK
      ?auto_54018 - BLOCK
      ?auto_54019 - BLOCK
      ?auto_54020 - BLOCK
    )
    :vars
    (
      ?auto_54021 - BLOCK
      ?auto_54022 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54016 ?auto_54017 ) ) ( not ( = ?auto_54016 ?auto_54018 ) ) ( not ( = ?auto_54016 ?auto_54019 ) ) ( not ( = ?auto_54016 ?auto_54020 ) ) ( not ( = ?auto_54017 ?auto_54018 ) ) ( not ( = ?auto_54017 ?auto_54019 ) ) ( not ( = ?auto_54017 ?auto_54020 ) ) ( not ( = ?auto_54018 ?auto_54019 ) ) ( not ( = ?auto_54018 ?auto_54020 ) ) ( not ( = ?auto_54019 ?auto_54020 ) ) ( ON ?auto_54020 ?auto_54021 ) ( not ( = ?auto_54016 ?auto_54021 ) ) ( not ( = ?auto_54017 ?auto_54021 ) ) ( not ( = ?auto_54018 ?auto_54021 ) ) ( not ( = ?auto_54019 ?auto_54021 ) ) ( not ( = ?auto_54020 ?auto_54021 ) ) ( ON ?auto_54019 ?auto_54020 ) ( ON-TABLE ?auto_54022 ) ( ON ?auto_54021 ?auto_54022 ) ( not ( = ?auto_54022 ?auto_54021 ) ) ( not ( = ?auto_54022 ?auto_54020 ) ) ( not ( = ?auto_54022 ?auto_54019 ) ) ( not ( = ?auto_54016 ?auto_54022 ) ) ( not ( = ?auto_54017 ?auto_54022 ) ) ( not ( = ?auto_54018 ?auto_54022 ) ) ( ON ?auto_54018 ?auto_54019 ) ( ON ?auto_54017 ?auto_54018 ) ( ON ?auto_54016 ?auto_54017 ) ( CLEAR ?auto_54016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_54022 ?auto_54021 ?auto_54020 ?auto_54019 ?auto_54018 ?auto_54017 )
      ( MAKE-5PILE ?auto_54016 ?auto_54017 ?auto_54018 ?auto_54019 ?auto_54020 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54024 - BLOCK
    )
    :vars
    (
      ?auto_54025 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54025 ?auto_54024 ) ( CLEAR ?auto_54025 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_54024 ) ( not ( = ?auto_54024 ?auto_54025 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_54025 ?auto_54024 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54026 - BLOCK
    )
    :vars
    (
      ?auto_54027 - BLOCK
      ?auto_54028 - BLOCK
      ?auto_54029 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54027 ?auto_54026 ) ( CLEAR ?auto_54027 ) ( ON-TABLE ?auto_54026 ) ( not ( = ?auto_54026 ?auto_54027 ) ) ( HOLDING ?auto_54028 ) ( CLEAR ?auto_54029 ) ( not ( = ?auto_54026 ?auto_54028 ) ) ( not ( = ?auto_54026 ?auto_54029 ) ) ( not ( = ?auto_54027 ?auto_54028 ) ) ( not ( = ?auto_54027 ?auto_54029 ) ) ( not ( = ?auto_54028 ?auto_54029 ) ) )
    :subtasks
    ( ( !STACK ?auto_54028 ?auto_54029 )
      ( MAKE-1PILE ?auto_54026 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54030 - BLOCK
    )
    :vars
    (
      ?auto_54031 - BLOCK
      ?auto_54032 - BLOCK
      ?auto_54033 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54031 ?auto_54030 ) ( ON-TABLE ?auto_54030 ) ( not ( = ?auto_54030 ?auto_54031 ) ) ( CLEAR ?auto_54032 ) ( not ( = ?auto_54030 ?auto_54033 ) ) ( not ( = ?auto_54030 ?auto_54032 ) ) ( not ( = ?auto_54031 ?auto_54033 ) ) ( not ( = ?auto_54031 ?auto_54032 ) ) ( not ( = ?auto_54033 ?auto_54032 ) ) ( ON ?auto_54033 ?auto_54031 ) ( CLEAR ?auto_54033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54030 ?auto_54031 )
      ( MAKE-1PILE ?auto_54030 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54034 - BLOCK
    )
    :vars
    (
      ?auto_54036 - BLOCK
      ?auto_54037 - BLOCK
      ?auto_54035 - BLOCK
      ?auto_54038 - BLOCK
      ?auto_54040 - BLOCK
      ?auto_54039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54036 ?auto_54034 ) ( ON-TABLE ?auto_54034 ) ( not ( = ?auto_54034 ?auto_54036 ) ) ( not ( = ?auto_54034 ?auto_54037 ) ) ( not ( = ?auto_54034 ?auto_54035 ) ) ( not ( = ?auto_54036 ?auto_54037 ) ) ( not ( = ?auto_54036 ?auto_54035 ) ) ( not ( = ?auto_54037 ?auto_54035 ) ) ( ON ?auto_54037 ?auto_54036 ) ( CLEAR ?auto_54037 ) ( HOLDING ?auto_54035 ) ( CLEAR ?auto_54038 ) ( ON-TABLE ?auto_54040 ) ( ON ?auto_54039 ?auto_54040 ) ( ON ?auto_54038 ?auto_54039 ) ( not ( = ?auto_54040 ?auto_54039 ) ) ( not ( = ?auto_54040 ?auto_54038 ) ) ( not ( = ?auto_54040 ?auto_54035 ) ) ( not ( = ?auto_54039 ?auto_54038 ) ) ( not ( = ?auto_54039 ?auto_54035 ) ) ( not ( = ?auto_54038 ?auto_54035 ) ) ( not ( = ?auto_54034 ?auto_54038 ) ) ( not ( = ?auto_54034 ?auto_54040 ) ) ( not ( = ?auto_54034 ?auto_54039 ) ) ( not ( = ?auto_54036 ?auto_54038 ) ) ( not ( = ?auto_54036 ?auto_54040 ) ) ( not ( = ?auto_54036 ?auto_54039 ) ) ( not ( = ?auto_54037 ?auto_54038 ) ) ( not ( = ?auto_54037 ?auto_54040 ) ) ( not ( = ?auto_54037 ?auto_54039 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_54040 ?auto_54039 ?auto_54038 ?auto_54035 )
      ( MAKE-1PILE ?auto_54034 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54041 - BLOCK
    )
    :vars
    (
      ?auto_54044 - BLOCK
      ?auto_54047 - BLOCK
      ?auto_54043 - BLOCK
      ?auto_54042 - BLOCK
      ?auto_54045 - BLOCK
      ?auto_54046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54044 ?auto_54041 ) ( ON-TABLE ?auto_54041 ) ( not ( = ?auto_54041 ?auto_54044 ) ) ( not ( = ?auto_54041 ?auto_54047 ) ) ( not ( = ?auto_54041 ?auto_54043 ) ) ( not ( = ?auto_54044 ?auto_54047 ) ) ( not ( = ?auto_54044 ?auto_54043 ) ) ( not ( = ?auto_54047 ?auto_54043 ) ) ( ON ?auto_54047 ?auto_54044 ) ( CLEAR ?auto_54042 ) ( ON-TABLE ?auto_54045 ) ( ON ?auto_54046 ?auto_54045 ) ( ON ?auto_54042 ?auto_54046 ) ( not ( = ?auto_54045 ?auto_54046 ) ) ( not ( = ?auto_54045 ?auto_54042 ) ) ( not ( = ?auto_54045 ?auto_54043 ) ) ( not ( = ?auto_54046 ?auto_54042 ) ) ( not ( = ?auto_54046 ?auto_54043 ) ) ( not ( = ?auto_54042 ?auto_54043 ) ) ( not ( = ?auto_54041 ?auto_54042 ) ) ( not ( = ?auto_54041 ?auto_54045 ) ) ( not ( = ?auto_54041 ?auto_54046 ) ) ( not ( = ?auto_54044 ?auto_54042 ) ) ( not ( = ?auto_54044 ?auto_54045 ) ) ( not ( = ?auto_54044 ?auto_54046 ) ) ( not ( = ?auto_54047 ?auto_54042 ) ) ( not ( = ?auto_54047 ?auto_54045 ) ) ( not ( = ?auto_54047 ?auto_54046 ) ) ( ON ?auto_54043 ?auto_54047 ) ( CLEAR ?auto_54043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_54041 ?auto_54044 ?auto_54047 )
      ( MAKE-1PILE ?auto_54041 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54048 - BLOCK
    )
    :vars
    (
      ?auto_54054 - BLOCK
      ?auto_54049 - BLOCK
      ?auto_54050 - BLOCK
      ?auto_54051 - BLOCK
      ?auto_54053 - BLOCK
      ?auto_54052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54054 ?auto_54048 ) ( ON-TABLE ?auto_54048 ) ( not ( = ?auto_54048 ?auto_54054 ) ) ( not ( = ?auto_54048 ?auto_54049 ) ) ( not ( = ?auto_54048 ?auto_54050 ) ) ( not ( = ?auto_54054 ?auto_54049 ) ) ( not ( = ?auto_54054 ?auto_54050 ) ) ( not ( = ?auto_54049 ?auto_54050 ) ) ( ON ?auto_54049 ?auto_54054 ) ( ON-TABLE ?auto_54051 ) ( ON ?auto_54053 ?auto_54051 ) ( not ( = ?auto_54051 ?auto_54053 ) ) ( not ( = ?auto_54051 ?auto_54052 ) ) ( not ( = ?auto_54051 ?auto_54050 ) ) ( not ( = ?auto_54053 ?auto_54052 ) ) ( not ( = ?auto_54053 ?auto_54050 ) ) ( not ( = ?auto_54052 ?auto_54050 ) ) ( not ( = ?auto_54048 ?auto_54052 ) ) ( not ( = ?auto_54048 ?auto_54051 ) ) ( not ( = ?auto_54048 ?auto_54053 ) ) ( not ( = ?auto_54054 ?auto_54052 ) ) ( not ( = ?auto_54054 ?auto_54051 ) ) ( not ( = ?auto_54054 ?auto_54053 ) ) ( not ( = ?auto_54049 ?auto_54052 ) ) ( not ( = ?auto_54049 ?auto_54051 ) ) ( not ( = ?auto_54049 ?auto_54053 ) ) ( ON ?auto_54050 ?auto_54049 ) ( CLEAR ?auto_54050 ) ( HOLDING ?auto_54052 ) ( CLEAR ?auto_54053 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_54051 ?auto_54053 ?auto_54052 )
      ( MAKE-1PILE ?auto_54048 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54055 - BLOCK
    )
    :vars
    (
      ?auto_54058 - BLOCK
      ?auto_54060 - BLOCK
      ?auto_54056 - BLOCK
      ?auto_54061 - BLOCK
      ?auto_54059 - BLOCK
      ?auto_54057 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54058 ?auto_54055 ) ( ON-TABLE ?auto_54055 ) ( not ( = ?auto_54055 ?auto_54058 ) ) ( not ( = ?auto_54055 ?auto_54060 ) ) ( not ( = ?auto_54055 ?auto_54056 ) ) ( not ( = ?auto_54058 ?auto_54060 ) ) ( not ( = ?auto_54058 ?auto_54056 ) ) ( not ( = ?auto_54060 ?auto_54056 ) ) ( ON ?auto_54060 ?auto_54058 ) ( ON-TABLE ?auto_54061 ) ( ON ?auto_54059 ?auto_54061 ) ( not ( = ?auto_54061 ?auto_54059 ) ) ( not ( = ?auto_54061 ?auto_54057 ) ) ( not ( = ?auto_54061 ?auto_54056 ) ) ( not ( = ?auto_54059 ?auto_54057 ) ) ( not ( = ?auto_54059 ?auto_54056 ) ) ( not ( = ?auto_54057 ?auto_54056 ) ) ( not ( = ?auto_54055 ?auto_54057 ) ) ( not ( = ?auto_54055 ?auto_54061 ) ) ( not ( = ?auto_54055 ?auto_54059 ) ) ( not ( = ?auto_54058 ?auto_54057 ) ) ( not ( = ?auto_54058 ?auto_54061 ) ) ( not ( = ?auto_54058 ?auto_54059 ) ) ( not ( = ?auto_54060 ?auto_54057 ) ) ( not ( = ?auto_54060 ?auto_54061 ) ) ( not ( = ?auto_54060 ?auto_54059 ) ) ( ON ?auto_54056 ?auto_54060 ) ( CLEAR ?auto_54059 ) ( ON ?auto_54057 ?auto_54056 ) ( CLEAR ?auto_54057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_54055 ?auto_54058 ?auto_54060 ?auto_54056 )
      ( MAKE-1PILE ?auto_54055 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54062 - BLOCK
    )
    :vars
    (
      ?auto_54063 - BLOCK
      ?auto_54065 - BLOCK
      ?auto_54066 - BLOCK
      ?auto_54064 - BLOCK
      ?auto_54068 - BLOCK
      ?auto_54067 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54063 ?auto_54062 ) ( ON-TABLE ?auto_54062 ) ( not ( = ?auto_54062 ?auto_54063 ) ) ( not ( = ?auto_54062 ?auto_54065 ) ) ( not ( = ?auto_54062 ?auto_54066 ) ) ( not ( = ?auto_54063 ?auto_54065 ) ) ( not ( = ?auto_54063 ?auto_54066 ) ) ( not ( = ?auto_54065 ?auto_54066 ) ) ( ON ?auto_54065 ?auto_54063 ) ( ON-TABLE ?auto_54064 ) ( not ( = ?auto_54064 ?auto_54068 ) ) ( not ( = ?auto_54064 ?auto_54067 ) ) ( not ( = ?auto_54064 ?auto_54066 ) ) ( not ( = ?auto_54068 ?auto_54067 ) ) ( not ( = ?auto_54068 ?auto_54066 ) ) ( not ( = ?auto_54067 ?auto_54066 ) ) ( not ( = ?auto_54062 ?auto_54067 ) ) ( not ( = ?auto_54062 ?auto_54064 ) ) ( not ( = ?auto_54062 ?auto_54068 ) ) ( not ( = ?auto_54063 ?auto_54067 ) ) ( not ( = ?auto_54063 ?auto_54064 ) ) ( not ( = ?auto_54063 ?auto_54068 ) ) ( not ( = ?auto_54065 ?auto_54067 ) ) ( not ( = ?auto_54065 ?auto_54064 ) ) ( not ( = ?auto_54065 ?auto_54068 ) ) ( ON ?auto_54066 ?auto_54065 ) ( ON ?auto_54067 ?auto_54066 ) ( CLEAR ?auto_54067 ) ( HOLDING ?auto_54068 ) ( CLEAR ?auto_54064 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54064 ?auto_54068 )
      ( MAKE-1PILE ?auto_54062 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54915 - BLOCK
    )
    :vars
    (
      ?auto_54917 - BLOCK
      ?auto_54916 - BLOCK
      ?auto_54920 - BLOCK
      ?auto_54918 - BLOCK
      ?auto_54919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54917 ?auto_54915 ) ( ON-TABLE ?auto_54915 ) ( not ( = ?auto_54915 ?auto_54917 ) ) ( not ( = ?auto_54915 ?auto_54916 ) ) ( not ( = ?auto_54915 ?auto_54920 ) ) ( not ( = ?auto_54917 ?auto_54916 ) ) ( not ( = ?auto_54917 ?auto_54920 ) ) ( not ( = ?auto_54916 ?auto_54920 ) ) ( ON ?auto_54916 ?auto_54917 ) ( not ( = ?auto_54918 ?auto_54919 ) ) ( not ( = ?auto_54918 ?auto_54920 ) ) ( not ( = ?auto_54919 ?auto_54920 ) ) ( not ( = ?auto_54915 ?auto_54919 ) ) ( not ( = ?auto_54915 ?auto_54918 ) ) ( not ( = ?auto_54917 ?auto_54919 ) ) ( not ( = ?auto_54917 ?auto_54918 ) ) ( not ( = ?auto_54916 ?auto_54919 ) ) ( not ( = ?auto_54916 ?auto_54918 ) ) ( ON ?auto_54920 ?auto_54916 ) ( ON ?auto_54919 ?auto_54920 ) ( ON ?auto_54918 ?auto_54919 ) ( CLEAR ?auto_54918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54915 ?auto_54917 ?auto_54916 ?auto_54920 ?auto_54919 )
      ( MAKE-1PILE ?auto_54915 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54076 - BLOCK
    )
    :vars
    (
      ?auto_54078 - BLOCK
      ?auto_54080 - BLOCK
      ?auto_54082 - BLOCK
      ?auto_54077 - BLOCK
      ?auto_54079 - BLOCK
      ?auto_54081 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54078 ?auto_54076 ) ( ON-TABLE ?auto_54076 ) ( not ( = ?auto_54076 ?auto_54078 ) ) ( not ( = ?auto_54076 ?auto_54080 ) ) ( not ( = ?auto_54076 ?auto_54082 ) ) ( not ( = ?auto_54078 ?auto_54080 ) ) ( not ( = ?auto_54078 ?auto_54082 ) ) ( not ( = ?auto_54080 ?auto_54082 ) ) ( ON ?auto_54080 ?auto_54078 ) ( not ( = ?auto_54077 ?auto_54079 ) ) ( not ( = ?auto_54077 ?auto_54081 ) ) ( not ( = ?auto_54077 ?auto_54082 ) ) ( not ( = ?auto_54079 ?auto_54081 ) ) ( not ( = ?auto_54079 ?auto_54082 ) ) ( not ( = ?auto_54081 ?auto_54082 ) ) ( not ( = ?auto_54076 ?auto_54081 ) ) ( not ( = ?auto_54076 ?auto_54077 ) ) ( not ( = ?auto_54076 ?auto_54079 ) ) ( not ( = ?auto_54078 ?auto_54081 ) ) ( not ( = ?auto_54078 ?auto_54077 ) ) ( not ( = ?auto_54078 ?auto_54079 ) ) ( not ( = ?auto_54080 ?auto_54081 ) ) ( not ( = ?auto_54080 ?auto_54077 ) ) ( not ( = ?auto_54080 ?auto_54079 ) ) ( ON ?auto_54082 ?auto_54080 ) ( ON ?auto_54081 ?auto_54082 ) ( ON ?auto_54079 ?auto_54081 ) ( CLEAR ?auto_54079 ) ( HOLDING ?auto_54077 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_54077 )
      ( MAKE-1PILE ?auto_54076 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54083 - BLOCK
    )
    :vars
    (
      ?auto_54088 - BLOCK
      ?auto_54085 - BLOCK
      ?auto_54084 - BLOCK
      ?auto_54086 - BLOCK
      ?auto_54087 - BLOCK
      ?auto_54089 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54088 ?auto_54083 ) ( ON-TABLE ?auto_54083 ) ( not ( = ?auto_54083 ?auto_54088 ) ) ( not ( = ?auto_54083 ?auto_54085 ) ) ( not ( = ?auto_54083 ?auto_54084 ) ) ( not ( = ?auto_54088 ?auto_54085 ) ) ( not ( = ?auto_54088 ?auto_54084 ) ) ( not ( = ?auto_54085 ?auto_54084 ) ) ( ON ?auto_54085 ?auto_54088 ) ( not ( = ?auto_54086 ?auto_54087 ) ) ( not ( = ?auto_54086 ?auto_54089 ) ) ( not ( = ?auto_54086 ?auto_54084 ) ) ( not ( = ?auto_54087 ?auto_54089 ) ) ( not ( = ?auto_54087 ?auto_54084 ) ) ( not ( = ?auto_54089 ?auto_54084 ) ) ( not ( = ?auto_54083 ?auto_54089 ) ) ( not ( = ?auto_54083 ?auto_54086 ) ) ( not ( = ?auto_54083 ?auto_54087 ) ) ( not ( = ?auto_54088 ?auto_54089 ) ) ( not ( = ?auto_54088 ?auto_54086 ) ) ( not ( = ?auto_54088 ?auto_54087 ) ) ( not ( = ?auto_54085 ?auto_54089 ) ) ( not ( = ?auto_54085 ?auto_54086 ) ) ( not ( = ?auto_54085 ?auto_54087 ) ) ( ON ?auto_54084 ?auto_54085 ) ( ON ?auto_54089 ?auto_54084 ) ( ON ?auto_54087 ?auto_54089 ) ( ON ?auto_54086 ?auto_54087 ) ( CLEAR ?auto_54086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_54083 ?auto_54088 ?auto_54085 ?auto_54084 ?auto_54089 ?auto_54087 )
      ( MAKE-1PILE ?auto_54083 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_54096 - BLOCK
      ?auto_54097 - BLOCK
      ?auto_54098 - BLOCK
      ?auto_54099 - BLOCK
      ?auto_54100 - BLOCK
      ?auto_54101 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_54101 ) ( CLEAR ?auto_54100 ) ( ON-TABLE ?auto_54096 ) ( ON ?auto_54097 ?auto_54096 ) ( ON ?auto_54098 ?auto_54097 ) ( ON ?auto_54099 ?auto_54098 ) ( ON ?auto_54100 ?auto_54099 ) ( not ( = ?auto_54096 ?auto_54097 ) ) ( not ( = ?auto_54096 ?auto_54098 ) ) ( not ( = ?auto_54096 ?auto_54099 ) ) ( not ( = ?auto_54096 ?auto_54100 ) ) ( not ( = ?auto_54096 ?auto_54101 ) ) ( not ( = ?auto_54097 ?auto_54098 ) ) ( not ( = ?auto_54097 ?auto_54099 ) ) ( not ( = ?auto_54097 ?auto_54100 ) ) ( not ( = ?auto_54097 ?auto_54101 ) ) ( not ( = ?auto_54098 ?auto_54099 ) ) ( not ( = ?auto_54098 ?auto_54100 ) ) ( not ( = ?auto_54098 ?auto_54101 ) ) ( not ( = ?auto_54099 ?auto_54100 ) ) ( not ( = ?auto_54099 ?auto_54101 ) ) ( not ( = ?auto_54100 ?auto_54101 ) ) )
    :subtasks
    ( ( !STACK ?auto_54101 ?auto_54100 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_54102 - BLOCK
      ?auto_54103 - BLOCK
      ?auto_54104 - BLOCK
      ?auto_54105 - BLOCK
      ?auto_54106 - BLOCK
      ?auto_54107 - BLOCK
    )
    :vars
    (
      ?auto_54108 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_54106 ) ( ON-TABLE ?auto_54102 ) ( ON ?auto_54103 ?auto_54102 ) ( ON ?auto_54104 ?auto_54103 ) ( ON ?auto_54105 ?auto_54104 ) ( ON ?auto_54106 ?auto_54105 ) ( not ( = ?auto_54102 ?auto_54103 ) ) ( not ( = ?auto_54102 ?auto_54104 ) ) ( not ( = ?auto_54102 ?auto_54105 ) ) ( not ( = ?auto_54102 ?auto_54106 ) ) ( not ( = ?auto_54102 ?auto_54107 ) ) ( not ( = ?auto_54103 ?auto_54104 ) ) ( not ( = ?auto_54103 ?auto_54105 ) ) ( not ( = ?auto_54103 ?auto_54106 ) ) ( not ( = ?auto_54103 ?auto_54107 ) ) ( not ( = ?auto_54104 ?auto_54105 ) ) ( not ( = ?auto_54104 ?auto_54106 ) ) ( not ( = ?auto_54104 ?auto_54107 ) ) ( not ( = ?auto_54105 ?auto_54106 ) ) ( not ( = ?auto_54105 ?auto_54107 ) ) ( not ( = ?auto_54106 ?auto_54107 ) ) ( ON ?auto_54107 ?auto_54108 ) ( CLEAR ?auto_54107 ) ( HAND-EMPTY ) ( not ( = ?auto_54102 ?auto_54108 ) ) ( not ( = ?auto_54103 ?auto_54108 ) ) ( not ( = ?auto_54104 ?auto_54108 ) ) ( not ( = ?auto_54105 ?auto_54108 ) ) ( not ( = ?auto_54106 ?auto_54108 ) ) ( not ( = ?auto_54107 ?auto_54108 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_54107 ?auto_54108 )
      ( MAKE-6PILE ?auto_54102 ?auto_54103 ?auto_54104 ?auto_54105 ?auto_54106 ?auto_54107 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
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
    ( and ( ON-TABLE ?auto_54109 ) ( ON ?auto_54110 ?auto_54109 ) ( ON ?auto_54111 ?auto_54110 ) ( ON ?auto_54112 ?auto_54111 ) ( not ( = ?auto_54109 ?auto_54110 ) ) ( not ( = ?auto_54109 ?auto_54111 ) ) ( not ( = ?auto_54109 ?auto_54112 ) ) ( not ( = ?auto_54109 ?auto_54113 ) ) ( not ( = ?auto_54109 ?auto_54114 ) ) ( not ( = ?auto_54110 ?auto_54111 ) ) ( not ( = ?auto_54110 ?auto_54112 ) ) ( not ( = ?auto_54110 ?auto_54113 ) ) ( not ( = ?auto_54110 ?auto_54114 ) ) ( not ( = ?auto_54111 ?auto_54112 ) ) ( not ( = ?auto_54111 ?auto_54113 ) ) ( not ( = ?auto_54111 ?auto_54114 ) ) ( not ( = ?auto_54112 ?auto_54113 ) ) ( not ( = ?auto_54112 ?auto_54114 ) ) ( not ( = ?auto_54113 ?auto_54114 ) ) ( ON ?auto_54114 ?auto_54115 ) ( CLEAR ?auto_54114 ) ( not ( = ?auto_54109 ?auto_54115 ) ) ( not ( = ?auto_54110 ?auto_54115 ) ) ( not ( = ?auto_54111 ?auto_54115 ) ) ( not ( = ?auto_54112 ?auto_54115 ) ) ( not ( = ?auto_54113 ?auto_54115 ) ) ( not ( = ?auto_54114 ?auto_54115 ) ) ( HOLDING ?auto_54113 ) ( CLEAR ?auto_54112 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54109 ?auto_54110 ?auto_54111 ?auto_54112 ?auto_54113 )
      ( MAKE-6PILE ?auto_54109 ?auto_54110 ?auto_54111 ?auto_54112 ?auto_54113 ?auto_54114 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_54116 - BLOCK
      ?auto_54117 - BLOCK
      ?auto_54118 - BLOCK
      ?auto_54119 - BLOCK
      ?auto_54120 - BLOCK
      ?auto_54121 - BLOCK
    )
    :vars
    (
      ?auto_54122 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54116 ) ( ON ?auto_54117 ?auto_54116 ) ( ON ?auto_54118 ?auto_54117 ) ( ON ?auto_54119 ?auto_54118 ) ( not ( = ?auto_54116 ?auto_54117 ) ) ( not ( = ?auto_54116 ?auto_54118 ) ) ( not ( = ?auto_54116 ?auto_54119 ) ) ( not ( = ?auto_54116 ?auto_54120 ) ) ( not ( = ?auto_54116 ?auto_54121 ) ) ( not ( = ?auto_54117 ?auto_54118 ) ) ( not ( = ?auto_54117 ?auto_54119 ) ) ( not ( = ?auto_54117 ?auto_54120 ) ) ( not ( = ?auto_54117 ?auto_54121 ) ) ( not ( = ?auto_54118 ?auto_54119 ) ) ( not ( = ?auto_54118 ?auto_54120 ) ) ( not ( = ?auto_54118 ?auto_54121 ) ) ( not ( = ?auto_54119 ?auto_54120 ) ) ( not ( = ?auto_54119 ?auto_54121 ) ) ( not ( = ?auto_54120 ?auto_54121 ) ) ( ON ?auto_54121 ?auto_54122 ) ( not ( = ?auto_54116 ?auto_54122 ) ) ( not ( = ?auto_54117 ?auto_54122 ) ) ( not ( = ?auto_54118 ?auto_54122 ) ) ( not ( = ?auto_54119 ?auto_54122 ) ) ( not ( = ?auto_54120 ?auto_54122 ) ) ( not ( = ?auto_54121 ?auto_54122 ) ) ( CLEAR ?auto_54119 ) ( ON ?auto_54120 ?auto_54121 ) ( CLEAR ?auto_54120 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_54122 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54122 ?auto_54121 )
      ( MAKE-6PILE ?auto_54116 ?auto_54117 ?auto_54118 ?auto_54119 ?auto_54120 ?auto_54121 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_54123 - BLOCK
      ?auto_54124 - BLOCK
      ?auto_54125 - BLOCK
      ?auto_54126 - BLOCK
      ?auto_54127 - BLOCK
      ?auto_54128 - BLOCK
    )
    :vars
    (
      ?auto_54129 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54123 ) ( ON ?auto_54124 ?auto_54123 ) ( ON ?auto_54125 ?auto_54124 ) ( not ( = ?auto_54123 ?auto_54124 ) ) ( not ( = ?auto_54123 ?auto_54125 ) ) ( not ( = ?auto_54123 ?auto_54126 ) ) ( not ( = ?auto_54123 ?auto_54127 ) ) ( not ( = ?auto_54123 ?auto_54128 ) ) ( not ( = ?auto_54124 ?auto_54125 ) ) ( not ( = ?auto_54124 ?auto_54126 ) ) ( not ( = ?auto_54124 ?auto_54127 ) ) ( not ( = ?auto_54124 ?auto_54128 ) ) ( not ( = ?auto_54125 ?auto_54126 ) ) ( not ( = ?auto_54125 ?auto_54127 ) ) ( not ( = ?auto_54125 ?auto_54128 ) ) ( not ( = ?auto_54126 ?auto_54127 ) ) ( not ( = ?auto_54126 ?auto_54128 ) ) ( not ( = ?auto_54127 ?auto_54128 ) ) ( ON ?auto_54128 ?auto_54129 ) ( not ( = ?auto_54123 ?auto_54129 ) ) ( not ( = ?auto_54124 ?auto_54129 ) ) ( not ( = ?auto_54125 ?auto_54129 ) ) ( not ( = ?auto_54126 ?auto_54129 ) ) ( not ( = ?auto_54127 ?auto_54129 ) ) ( not ( = ?auto_54128 ?auto_54129 ) ) ( ON ?auto_54127 ?auto_54128 ) ( CLEAR ?auto_54127 ) ( ON-TABLE ?auto_54129 ) ( HOLDING ?auto_54126 ) ( CLEAR ?auto_54125 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_54123 ?auto_54124 ?auto_54125 ?auto_54126 )
      ( MAKE-6PILE ?auto_54123 ?auto_54124 ?auto_54125 ?auto_54126 ?auto_54127 ?auto_54128 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_54130 - BLOCK
      ?auto_54131 - BLOCK
      ?auto_54132 - BLOCK
      ?auto_54133 - BLOCK
      ?auto_54134 - BLOCK
      ?auto_54135 - BLOCK
    )
    :vars
    (
      ?auto_54136 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54130 ) ( ON ?auto_54131 ?auto_54130 ) ( ON ?auto_54132 ?auto_54131 ) ( not ( = ?auto_54130 ?auto_54131 ) ) ( not ( = ?auto_54130 ?auto_54132 ) ) ( not ( = ?auto_54130 ?auto_54133 ) ) ( not ( = ?auto_54130 ?auto_54134 ) ) ( not ( = ?auto_54130 ?auto_54135 ) ) ( not ( = ?auto_54131 ?auto_54132 ) ) ( not ( = ?auto_54131 ?auto_54133 ) ) ( not ( = ?auto_54131 ?auto_54134 ) ) ( not ( = ?auto_54131 ?auto_54135 ) ) ( not ( = ?auto_54132 ?auto_54133 ) ) ( not ( = ?auto_54132 ?auto_54134 ) ) ( not ( = ?auto_54132 ?auto_54135 ) ) ( not ( = ?auto_54133 ?auto_54134 ) ) ( not ( = ?auto_54133 ?auto_54135 ) ) ( not ( = ?auto_54134 ?auto_54135 ) ) ( ON ?auto_54135 ?auto_54136 ) ( not ( = ?auto_54130 ?auto_54136 ) ) ( not ( = ?auto_54131 ?auto_54136 ) ) ( not ( = ?auto_54132 ?auto_54136 ) ) ( not ( = ?auto_54133 ?auto_54136 ) ) ( not ( = ?auto_54134 ?auto_54136 ) ) ( not ( = ?auto_54135 ?auto_54136 ) ) ( ON ?auto_54134 ?auto_54135 ) ( ON-TABLE ?auto_54136 ) ( CLEAR ?auto_54132 ) ( ON ?auto_54133 ?auto_54134 ) ( CLEAR ?auto_54133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_54136 ?auto_54135 ?auto_54134 )
      ( MAKE-6PILE ?auto_54130 ?auto_54131 ?auto_54132 ?auto_54133 ?auto_54134 ?auto_54135 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_54137 - BLOCK
      ?auto_54138 - BLOCK
      ?auto_54139 - BLOCK
      ?auto_54140 - BLOCK
      ?auto_54141 - BLOCK
      ?auto_54142 - BLOCK
    )
    :vars
    (
      ?auto_54143 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54137 ) ( ON ?auto_54138 ?auto_54137 ) ( not ( = ?auto_54137 ?auto_54138 ) ) ( not ( = ?auto_54137 ?auto_54139 ) ) ( not ( = ?auto_54137 ?auto_54140 ) ) ( not ( = ?auto_54137 ?auto_54141 ) ) ( not ( = ?auto_54137 ?auto_54142 ) ) ( not ( = ?auto_54138 ?auto_54139 ) ) ( not ( = ?auto_54138 ?auto_54140 ) ) ( not ( = ?auto_54138 ?auto_54141 ) ) ( not ( = ?auto_54138 ?auto_54142 ) ) ( not ( = ?auto_54139 ?auto_54140 ) ) ( not ( = ?auto_54139 ?auto_54141 ) ) ( not ( = ?auto_54139 ?auto_54142 ) ) ( not ( = ?auto_54140 ?auto_54141 ) ) ( not ( = ?auto_54140 ?auto_54142 ) ) ( not ( = ?auto_54141 ?auto_54142 ) ) ( ON ?auto_54142 ?auto_54143 ) ( not ( = ?auto_54137 ?auto_54143 ) ) ( not ( = ?auto_54138 ?auto_54143 ) ) ( not ( = ?auto_54139 ?auto_54143 ) ) ( not ( = ?auto_54140 ?auto_54143 ) ) ( not ( = ?auto_54141 ?auto_54143 ) ) ( not ( = ?auto_54142 ?auto_54143 ) ) ( ON ?auto_54141 ?auto_54142 ) ( ON-TABLE ?auto_54143 ) ( ON ?auto_54140 ?auto_54141 ) ( CLEAR ?auto_54140 ) ( HOLDING ?auto_54139 ) ( CLEAR ?auto_54138 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_54137 ?auto_54138 ?auto_54139 )
      ( MAKE-6PILE ?auto_54137 ?auto_54138 ?auto_54139 ?auto_54140 ?auto_54141 ?auto_54142 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_54144 - BLOCK
      ?auto_54145 - BLOCK
      ?auto_54146 - BLOCK
      ?auto_54147 - BLOCK
      ?auto_54148 - BLOCK
      ?auto_54149 - BLOCK
    )
    :vars
    (
      ?auto_54150 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54144 ) ( ON ?auto_54145 ?auto_54144 ) ( not ( = ?auto_54144 ?auto_54145 ) ) ( not ( = ?auto_54144 ?auto_54146 ) ) ( not ( = ?auto_54144 ?auto_54147 ) ) ( not ( = ?auto_54144 ?auto_54148 ) ) ( not ( = ?auto_54144 ?auto_54149 ) ) ( not ( = ?auto_54145 ?auto_54146 ) ) ( not ( = ?auto_54145 ?auto_54147 ) ) ( not ( = ?auto_54145 ?auto_54148 ) ) ( not ( = ?auto_54145 ?auto_54149 ) ) ( not ( = ?auto_54146 ?auto_54147 ) ) ( not ( = ?auto_54146 ?auto_54148 ) ) ( not ( = ?auto_54146 ?auto_54149 ) ) ( not ( = ?auto_54147 ?auto_54148 ) ) ( not ( = ?auto_54147 ?auto_54149 ) ) ( not ( = ?auto_54148 ?auto_54149 ) ) ( ON ?auto_54149 ?auto_54150 ) ( not ( = ?auto_54144 ?auto_54150 ) ) ( not ( = ?auto_54145 ?auto_54150 ) ) ( not ( = ?auto_54146 ?auto_54150 ) ) ( not ( = ?auto_54147 ?auto_54150 ) ) ( not ( = ?auto_54148 ?auto_54150 ) ) ( not ( = ?auto_54149 ?auto_54150 ) ) ( ON ?auto_54148 ?auto_54149 ) ( ON-TABLE ?auto_54150 ) ( ON ?auto_54147 ?auto_54148 ) ( CLEAR ?auto_54145 ) ( ON ?auto_54146 ?auto_54147 ) ( CLEAR ?auto_54146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_54150 ?auto_54149 ?auto_54148 ?auto_54147 )
      ( MAKE-6PILE ?auto_54144 ?auto_54145 ?auto_54146 ?auto_54147 ?auto_54148 ?auto_54149 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_54151 - BLOCK
      ?auto_54152 - BLOCK
      ?auto_54153 - BLOCK
      ?auto_54154 - BLOCK
      ?auto_54155 - BLOCK
      ?auto_54156 - BLOCK
    )
    :vars
    (
      ?auto_54157 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54151 ) ( not ( = ?auto_54151 ?auto_54152 ) ) ( not ( = ?auto_54151 ?auto_54153 ) ) ( not ( = ?auto_54151 ?auto_54154 ) ) ( not ( = ?auto_54151 ?auto_54155 ) ) ( not ( = ?auto_54151 ?auto_54156 ) ) ( not ( = ?auto_54152 ?auto_54153 ) ) ( not ( = ?auto_54152 ?auto_54154 ) ) ( not ( = ?auto_54152 ?auto_54155 ) ) ( not ( = ?auto_54152 ?auto_54156 ) ) ( not ( = ?auto_54153 ?auto_54154 ) ) ( not ( = ?auto_54153 ?auto_54155 ) ) ( not ( = ?auto_54153 ?auto_54156 ) ) ( not ( = ?auto_54154 ?auto_54155 ) ) ( not ( = ?auto_54154 ?auto_54156 ) ) ( not ( = ?auto_54155 ?auto_54156 ) ) ( ON ?auto_54156 ?auto_54157 ) ( not ( = ?auto_54151 ?auto_54157 ) ) ( not ( = ?auto_54152 ?auto_54157 ) ) ( not ( = ?auto_54153 ?auto_54157 ) ) ( not ( = ?auto_54154 ?auto_54157 ) ) ( not ( = ?auto_54155 ?auto_54157 ) ) ( not ( = ?auto_54156 ?auto_54157 ) ) ( ON ?auto_54155 ?auto_54156 ) ( ON-TABLE ?auto_54157 ) ( ON ?auto_54154 ?auto_54155 ) ( ON ?auto_54153 ?auto_54154 ) ( CLEAR ?auto_54153 ) ( HOLDING ?auto_54152 ) ( CLEAR ?auto_54151 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54151 ?auto_54152 )
      ( MAKE-6PILE ?auto_54151 ?auto_54152 ?auto_54153 ?auto_54154 ?auto_54155 ?auto_54156 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_54158 - BLOCK
      ?auto_54159 - BLOCK
      ?auto_54160 - BLOCK
      ?auto_54161 - BLOCK
      ?auto_54162 - BLOCK
      ?auto_54163 - BLOCK
    )
    :vars
    (
      ?auto_54164 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54158 ) ( not ( = ?auto_54158 ?auto_54159 ) ) ( not ( = ?auto_54158 ?auto_54160 ) ) ( not ( = ?auto_54158 ?auto_54161 ) ) ( not ( = ?auto_54158 ?auto_54162 ) ) ( not ( = ?auto_54158 ?auto_54163 ) ) ( not ( = ?auto_54159 ?auto_54160 ) ) ( not ( = ?auto_54159 ?auto_54161 ) ) ( not ( = ?auto_54159 ?auto_54162 ) ) ( not ( = ?auto_54159 ?auto_54163 ) ) ( not ( = ?auto_54160 ?auto_54161 ) ) ( not ( = ?auto_54160 ?auto_54162 ) ) ( not ( = ?auto_54160 ?auto_54163 ) ) ( not ( = ?auto_54161 ?auto_54162 ) ) ( not ( = ?auto_54161 ?auto_54163 ) ) ( not ( = ?auto_54162 ?auto_54163 ) ) ( ON ?auto_54163 ?auto_54164 ) ( not ( = ?auto_54158 ?auto_54164 ) ) ( not ( = ?auto_54159 ?auto_54164 ) ) ( not ( = ?auto_54160 ?auto_54164 ) ) ( not ( = ?auto_54161 ?auto_54164 ) ) ( not ( = ?auto_54162 ?auto_54164 ) ) ( not ( = ?auto_54163 ?auto_54164 ) ) ( ON ?auto_54162 ?auto_54163 ) ( ON-TABLE ?auto_54164 ) ( ON ?auto_54161 ?auto_54162 ) ( ON ?auto_54160 ?auto_54161 ) ( CLEAR ?auto_54158 ) ( ON ?auto_54159 ?auto_54160 ) ( CLEAR ?auto_54159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54164 ?auto_54163 ?auto_54162 ?auto_54161 ?auto_54160 )
      ( MAKE-6PILE ?auto_54158 ?auto_54159 ?auto_54160 ?auto_54161 ?auto_54162 ?auto_54163 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_54165 - BLOCK
      ?auto_54166 - BLOCK
      ?auto_54167 - BLOCK
      ?auto_54168 - BLOCK
      ?auto_54169 - BLOCK
      ?auto_54170 - BLOCK
    )
    :vars
    (
      ?auto_54171 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54165 ?auto_54166 ) ) ( not ( = ?auto_54165 ?auto_54167 ) ) ( not ( = ?auto_54165 ?auto_54168 ) ) ( not ( = ?auto_54165 ?auto_54169 ) ) ( not ( = ?auto_54165 ?auto_54170 ) ) ( not ( = ?auto_54166 ?auto_54167 ) ) ( not ( = ?auto_54166 ?auto_54168 ) ) ( not ( = ?auto_54166 ?auto_54169 ) ) ( not ( = ?auto_54166 ?auto_54170 ) ) ( not ( = ?auto_54167 ?auto_54168 ) ) ( not ( = ?auto_54167 ?auto_54169 ) ) ( not ( = ?auto_54167 ?auto_54170 ) ) ( not ( = ?auto_54168 ?auto_54169 ) ) ( not ( = ?auto_54168 ?auto_54170 ) ) ( not ( = ?auto_54169 ?auto_54170 ) ) ( ON ?auto_54170 ?auto_54171 ) ( not ( = ?auto_54165 ?auto_54171 ) ) ( not ( = ?auto_54166 ?auto_54171 ) ) ( not ( = ?auto_54167 ?auto_54171 ) ) ( not ( = ?auto_54168 ?auto_54171 ) ) ( not ( = ?auto_54169 ?auto_54171 ) ) ( not ( = ?auto_54170 ?auto_54171 ) ) ( ON ?auto_54169 ?auto_54170 ) ( ON-TABLE ?auto_54171 ) ( ON ?auto_54168 ?auto_54169 ) ( ON ?auto_54167 ?auto_54168 ) ( ON ?auto_54166 ?auto_54167 ) ( CLEAR ?auto_54166 ) ( HOLDING ?auto_54165 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_54165 )
      ( MAKE-6PILE ?auto_54165 ?auto_54166 ?auto_54167 ?auto_54168 ?auto_54169 ?auto_54170 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_54172 - BLOCK
      ?auto_54173 - BLOCK
      ?auto_54174 - BLOCK
      ?auto_54175 - BLOCK
      ?auto_54176 - BLOCK
      ?auto_54177 - BLOCK
    )
    :vars
    (
      ?auto_54178 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54172 ?auto_54173 ) ) ( not ( = ?auto_54172 ?auto_54174 ) ) ( not ( = ?auto_54172 ?auto_54175 ) ) ( not ( = ?auto_54172 ?auto_54176 ) ) ( not ( = ?auto_54172 ?auto_54177 ) ) ( not ( = ?auto_54173 ?auto_54174 ) ) ( not ( = ?auto_54173 ?auto_54175 ) ) ( not ( = ?auto_54173 ?auto_54176 ) ) ( not ( = ?auto_54173 ?auto_54177 ) ) ( not ( = ?auto_54174 ?auto_54175 ) ) ( not ( = ?auto_54174 ?auto_54176 ) ) ( not ( = ?auto_54174 ?auto_54177 ) ) ( not ( = ?auto_54175 ?auto_54176 ) ) ( not ( = ?auto_54175 ?auto_54177 ) ) ( not ( = ?auto_54176 ?auto_54177 ) ) ( ON ?auto_54177 ?auto_54178 ) ( not ( = ?auto_54172 ?auto_54178 ) ) ( not ( = ?auto_54173 ?auto_54178 ) ) ( not ( = ?auto_54174 ?auto_54178 ) ) ( not ( = ?auto_54175 ?auto_54178 ) ) ( not ( = ?auto_54176 ?auto_54178 ) ) ( not ( = ?auto_54177 ?auto_54178 ) ) ( ON ?auto_54176 ?auto_54177 ) ( ON-TABLE ?auto_54178 ) ( ON ?auto_54175 ?auto_54176 ) ( ON ?auto_54174 ?auto_54175 ) ( ON ?auto_54173 ?auto_54174 ) ( ON ?auto_54172 ?auto_54173 ) ( CLEAR ?auto_54172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_54178 ?auto_54177 ?auto_54176 ?auto_54175 ?auto_54174 ?auto_54173 )
      ( MAKE-6PILE ?auto_54172 ?auto_54173 ?auto_54174 ?auto_54175 ?auto_54176 ?auto_54177 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54259 - BLOCK
    )
    :vars
    (
      ?auto_54260 - BLOCK
      ?auto_54261 - BLOCK
      ?auto_54262 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54259 ?auto_54260 ) ( CLEAR ?auto_54259 ) ( not ( = ?auto_54259 ?auto_54260 ) ) ( HOLDING ?auto_54261 ) ( CLEAR ?auto_54262 ) ( not ( = ?auto_54259 ?auto_54261 ) ) ( not ( = ?auto_54259 ?auto_54262 ) ) ( not ( = ?auto_54260 ?auto_54261 ) ) ( not ( = ?auto_54260 ?auto_54262 ) ) ( not ( = ?auto_54261 ?auto_54262 ) ) )
    :subtasks
    ( ( !STACK ?auto_54261 ?auto_54262 )
      ( MAKE-1PILE ?auto_54259 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54263 - BLOCK
    )
    :vars
    (
      ?auto_54264 - BLOCK
      ?auto_54265 - BLOCK
      ?auto_54266 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54263 ?auto_54264 ) ( not ( = ?auto_54263 ?auto_54264 ) ) ( CLEAR ?auto_54265 ) ( not ( = ?auto_54263 ?auto_54266 ) ) ( not ( = ?auto_54263 ?auto_54265 ) ) ( not ( = ?auto_54264 ?auto_54266 ) ) ( not ( = ?auto_54264 ?auto_54265 ) ) ( not ( = ?auto_54266 ?auto_54265 ) ) ( ON ?auto_54266 ?auto_54263 ) ( CLEAR ?auto_54266 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_54264 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54264 ?auto_54263 )
      ( MAKE-1PILE ?auto_54263 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54267 - BLOCK
    )
    :vars
    (
      ?auto_54270 - BLOCK
      ?auto_54269 - BLOCK
      ?auto_54268 - BLOCK
      ?auto_54271 - BLOCK
      ?auto_54273 - BLOCK
      ?auto_54272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54267 ?auto_54270 ) ( not ( = ?auto_54267 ?auto_54270 ) ) ( not ( = ?auto_54267 ?auto_54269 ) ) ( not ( = ?auto_54267 ?auto_54268 ) ) ( not ( = ?auto_54270 ?auto_54269 ) ) ( not ( = ?auto_54270 ?auto_54268 ) ) ( not ( = ?auto_54269 ?auto_54268 ) ) ( ON ?auto_54269 ?auto_54267 ) ( CLEAR ?auto_54269 ) ( ON-TABLE ?auto_54270 ) ( HOLDING ?auto_54268 ) ( CLEAR ?auto_54271 ) ( ON-TABLE ?auto_54273 ) ( ON ?auto_54272 ?auto_54273 ) ( ON ?auto_54271 ?auto_54272 ) ( not ( = ?auto_54273 ?auto_54272 ) ) ( not ( = ?auto_54273 ?auto_54271 ) ) ( not ( = ?auto_54273 ?auto_54268 ) ) ( not ( = ?auto_54272 ?auto_54271 ) ) ( not ( = ?auto_54272 ?auto_54268 ) ) ( not ( = ?auto_54271 ?auto_54268 ) ) ( not ( = ?auto_54267 ?auto_54271 ) ) ( not ( = ?auto_54267 ?auto_54273 ) ) ( not ( = ?auto_54267 ?auto_54272 ) ) ( not ( = ?auto_54270 ?auto_54271 ) ) ( not ( = ?auto_54270 ?auto_54273 ) ) ( not ( = ?auto_54270 ?auto_54272 ) ) ( not ( = ?auto_54269 ?auto_54271 ) ) ( not ( = ?auto_54269 ?auto_54273 ) ) ( not ( = ?auto_54269 ?auto_54272 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_54273 ?auto_54272 ?auto_54271 ?auto_54268 )
      ( MAKE-1PILE ?auto_54267 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54274 - BLOCK
    )
    :vars
    (
      ?auto_54276 - BLOCK
      ?auto_54280 - BLOCK
      ?auto_54275 - BLOCK
      ?auto_54277 - BLOCK
      ?auto_54279 - BLOCK
      ?auto_54278 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54274 ?auto_54276 ) ( not ( = ?auto_54274 ?auto_54276 ) ) ( not ( = ?auto_54274 ?auto_54280 ) ) ( not ( = ?auto_54274 ?auto_54275 ) ) ( not ( = ?auto_54276 ?auto_54280 ) ) ( not ( = ?auto_54276 ?auto_54275 ) ) ( not ( = ?auto_54280 ?auto_54275 ) ) ( ON ?auto_54280 ?auto_54274 ) ( ON-TABLE ?auto_54276 ) ( CLEAR ?auto_54277 ) ( ON-TABLE ?auto_54279 ) ( ON ?auto_54278 ?auto_54279 ) ( ON ?auto_54277 ?auto_54278 ) ( not ( = ?auto_54279 ?auto_54278 ) ) ( not ( = ?auto_54279 ?auto_54277 ) ) ( not ( = ?auto_54279 ?auto_54275 ) ) ( not ( = ?auto_54278 ?auto_54277 ) ) ( not ( = ?auto_54278 ?auto_54275 ) ) ( not ( = ?auto_54277 ?auto_54275 ) ) ( not ( = ?auto_54274 ?auto_54277 ) ) ( not ( = ?auto_54274 ?auto_54279 ) ) ( not ( = ?auto_54274 ?auto_54278 ) ) ( not ( = ?auto_54276 ?auto_54277 ) ) ( not ( = ?auto_54276 ?auto_54279 ) ) ( not ( = ?auto_54276 ?auto_54278 ) ) ( not ( = ?auto_54280 ?auto_54277 ) ) ( not ( = ?auto_54280 ?auto_54279 ) ) ( not ( = ?auto_54280 ?auto_54278 ) ) ( ON ?auto_54275 ?auto_54280 ) ( CLEAR ?auto_54275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_54276 ?auto_54274 ?auto_54280 )
      ( MAKE-1PILE ?auto_54274 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54281 - BLOCK
    )
    :vars
    (
      ?auto_54286 - BLOCK
      ?auto_54287 - BLOCK
      ?auto_54284 - BLOCK
      ?auto_54285 - BLOCK
      ?auto_54283 - BLOCK
      ?auto_54282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54281 ?auto_54286 ) ( not ( = ?auto_54281 ?auto_54286 ) ) ( not ( = ?auto_54281 ?auto_54287 ) ) ( not ( = ?auto_54281 ?auto_54284 ) ) ( not ( = ?auto_54286 ?auto_54287 ) ) ( not ( = ?auto_54286 ?auto_54284 ) ) ( not ( = ?auto_54287 ?auto_54284 ) ) ( ON ?auto_54287 ?auto_54281 ) ( ON-TABLE ?auto_54286 ) ( ON-TABLE ?auto_54285 ) ( ON ?auto_54283 ?auto_54285 ) ( not ( = ?auto_54285 ?auto_54283 ) ) ( not ( = ?auto_54285 ?auto_54282 ) ) ( not ( = ?auto_54285 ?auto_54284 ) ) ( not ( = ?auto_54283 ?auto_54282 ) ) ( not ( = ?auto_54283 ?auto_54284 ) ) ( not ( = ?auto_54282 ?auto_54284 ) ) ( not ( = ?auto_54281 ?auto_54282 ) ) ( not ( = ?auto_54281 ?auto_54285 ) ) ( not ( = ?auto_54281 ?auto_54283 ) ) ( not ( = ?auto_54286 ?auto_54282 ) ) ( not ( = ?auto_54286 ?auto_54285 ) ) ( not ( = ?auto_54286 ?auto_54283 ) ) ( not ( = ?auto_54287 ?auto_54282 ) ) ( not ( = ?auto_54287 ?auto_54285 ) ) ( not ( = ?auto_54287 ?auto_54283 ) ) ( ON ?auto_54284 ?auto_54287 ) ( CLEAR ?auto_54284 ) ( HOLDING ?auto_54282 ) ( CLEAR ?auto_54283 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_54285 ?auto_54283 ?auto_54282 )
      ( MAKE-1PILE ?auto_54281 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54288 - BLOCK
    )
    :vars
    (
      ?auto_54293 - BLOCK
      ?auto_54291 - BLOCK
      ?auto_54294 - BLOCK
      ?auto_54292 - BLOCK
      ?auto_54289 - BLOCK
      ?auto_54290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54288 ?auto_54293 ) ( not ( = ?auto_54288 ?auto_54293 ) ) ( not ( = ?auto_54288 ?auto_54291 ) ) ( not ( = ?auto_54288 ?auto_54294 ) ) ( not ( = ?auto_54293 ?auto_54291 ) ) ( not ( = ?auto_54293 ?auto_54294 ) ) ( not ( = ?auto_54291 ?auto_54294 ) ) ( ON ?auto_54291 ?auto_54288 ) ( ON-TABLE ?auto_54293 ) ( ON-TABLE ?auto_54292 ) ( ON ?auto_54289 ?auto_54292 ) ( not ( = ?auto_54292 ?auto_54289 ) ) ( not ( = ?auto_54292 ?auto_54290 ) ) ( not ( = ?auto_54292 ?auto_54294 ) ) ( not ( = ?auto_54289 ?auto_54290 ) ) ( not ( = ?auto_54289 ?auto_54294 ) ) ( not ( = ?auto_54290 ?auto_54294 ) ) ( not ( = ?auto_54288 ?auto_54290 ) ) ( not ( = ?auto_54288 ?auto_54292 ) ) ( not ( = ?auto_54288 ?auto_54289 ) ) ( not ( = ?auto_54293 ?auto_54290 ) ) ( not ( = ?auto_54293 ?auto_54292 ) ) ( not ( = ?auto_54293 ?auto_54289 ) ) ( not ( = ?auto_54291 ?auto_54290 ) ) ( not ( = ?auto_54291 ?auto_54292 ) ) ( not ( = ?auto_54291 ?auto_54289 ) ) ( ON ?auto_54294 ?auto_54291 ) ( CLEAR ?auto_54289 ) ( ON ?auto_54290 ?auto_54294 ) ( CLEAR ?auto_54290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_54293 ?auto_54288 ?auto_54291 ?auto_54294 )
      ( MAKE-1PILE ?auto_54288 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54295 - BLOCK
    )
    :vars
    (
      ?auto_54297 - BLOCK
      ?auto_54296 - BLOCK
      ?auto_54298 - BLOCK
      ?auto_54299 - BLOCK
      ?auto_54300 - BLOCK
      ?auto_54301 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54295 ?auto_54297 ) ( not ( = ?auto_54295 ?auto_54297 ) ) ( not ( = ?auto_54295 ?auto_54296 ) ) ( not ( = ?auto_54295 ?auto_54298 ) ) ( not ( = ?auto_54297 ?auto_54296 ) ) ( not ( = ?auto_54297 ?auto_54298 ) ) ( not ( = ?auto_54296 ?auto_54298 ) ) ( ON ?auto_54296 ?auto_54295 ) ( ON-TABLE ?auto_54297 ) ( ON-TABLE ?auto_54299 ) ( not ( = ?auto_54299 ?auto_54300 ) ) ( not ( = ?auto_54299 ?auto_54301 ) ) ( not ( = ?auto_54299 ?auto_54298 ) ) ( not ( = ?auto_54300 ?auto_54301 ) ) ( not ( = ?auto_54300 ?auto_54298 ) ) ( not ( = ?auto_54301 ?auto_54298 ) ) ( not ( = ?auto_54295 ?auto_54301 ) ) ( not ( = ?auto_54295 ?auto_54299 ) ) ( not ( = ?auto_54295 ?auto_54300 ) ) ( not ( = ?auto_54297 ?auto_54301 ) ) ( not ( = ?auto_54297 ?auto_54299 ) ) ( not ( = ?auto_54297 ?auto_54300 ) ) ( not ( = ?auto_54296 ?auto_54301 ) ) ( not ( = ?auto_54296 ?auto_54299 ) ) ( not ( = ?auto_54296 ?auto_54300 ) ) ( ON ?auto_54298 ?auto_54296 ) ( ON ?auto_54301 ?auto_54298 ) ( CLEAR ?auto_54301 ) ( HOLDING ?auto_54300 ) ( CLEAR ?auto_54299 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54299 ?auto_54300 )
      ( MAKE-1PILE ?auto_54295 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54302 - BLOCK
    )
    :vars
    (
      ?auto_54305 - BLOCK
      ?auto_54307 - BLOCK
      ?auto_54306 - BLOCK
      ?auto_54303 - BLOCK
      ?auto_54304 - BLOCK
      ?auto_54308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54302 ?auto_54305 ) ( not ( = ?auto_54302 ?auto_54305 ) ) ( not ( = ?auto_54302 ?auto_54307 ) ) ( not ( = ?auto_54302 ?auto_54306 ) ) ( not ( = ?auto_54305 ?auto_54307 ) ) ( not ( = ?auto_54305 ?auto_54306 ) ) ( not ( = ?auto_54307 ?auto_54306 ) ) ( ON ?auto_54307 ?auto_54302 ) ( ON-TABLE ?auto_54305 ) ( ON-TABLE ?auto_54303 ) ( not ( = ?auto_54303 ?auto_54304 ) ) ( not ( = ?auto_54303 ?auto_54308 ) ) ( not ( = ?auto_54303 ?auto_54306 ) ) ( not ( = ?auto_54304 ?auto_54308 ) ) ( not ( = ?auto_54304 ?auto_54306 ) ) ( not ( = ?auto_54308 ?auto_54306 ) ) ( not ( = ?auto_54302 ?auto_54308 ) ) ( not ( = ?auto_54302 ?auto_54303 ) ) ( not ( = ?auto_54302 ?auto_54304 ) ) ( not ( = ?auto_54305 ?auto_54308 ) ) ( not ( = ?auto_54305 ?auto_54303 ) ) ( not ( = ?auto_54305 ?auto_54304 ) ) ( not ( = ?auto_54307 ?auto_54308 ) ) ( not ( = ?auto_54307 ?auto_54303 ) ) ( not ( = ?auto_54307 ?auto_54304 ) ) ( ON ?auto_54306 ?auto_54307 ) ( ON ?auto_54308 ?auto_54306 ) ( CLEAR ?auto_54303 ) ( ON ?auto_54304 ?auto_54308 ) ( CLEAR ?auto_54304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54305 ?auto_54302 ?auto_54307 ?auto_54306 ?auto_54308 )
      ( MAKE-1PILE ?auto_54302 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54309 - BLOCK
    )
    :vars
    (
      ?auto_54315 - BLOCK
      ?auto_54314 - BLOCK
      ?auto_54313 - BLOCK
      ?auto_54310 - BLOCK
      ?auto_54312 - BLOCK
      ?auto_54311 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54309 ?auto_54315 ) ( not ( = ?auto_54309 ?auto_54315 ) ) ( not ( = ?auto_54309 ?auto_54314 ) ) ( not ( = ?auto_54309 ?auto_54313 ) ) ( not ( = ?auto_54315 ?auto_54314 ) ) ( not ( = ?auto_54315 ?auto_54313 ) ) ( not ( = ?auto_54314 ?auto_54313 ) ) ( ON ?auto_54314 ?auto_54309 ) ( ON-TABLE ?auto_54315 ) ( not ( = ?auto_54310 ?auto_54312 ) ) ( not ( = ?auto_54310 ?auto_54311 ) ) ( not ( = ?auto_54310 ?auto_54313 ) ) ( not ( = ?auto_54312 ?auto_54311 ) ) ( not ( = ?auto_54312 ?auto_54313 ) ) ( not ( = ?auto_54311 ?auto_54313 ) ) ( not ( = ?auto_54309 ?auto_54311 ) ) ( not ( = ?auto_54309 ?auto_54310 ) ) ( not ( = ?auto_54309 ?auto_54312 ) ) ( not ( = ?auto_54315 ?auto_54311 ) ) ( not ( = ?auto_54315 ?auto_54310 ) ) ( not ( = ?auto_54315 ?auto_54312 ) ) ( not ( = ?auto_54314 ?auto_54311 ) ) ( not ( = ?auto_54314 ?auto_54310 ) ) ( not ( = ?auto_54314 ?auto_54312 ) ) ( ON ?auto_54313 ?auto_54314 ) ( ON ?auto_54311 ?auto_54313 ) ( ON ?auto_54312 ?auto_54311 ) ( CLEAR ?auto_54312 ) ( HOLDING ?auto_54310 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_54310 )
      ( MAKE-1PILE ?auto_54309 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54316 - BLOCK
    )
    :vars
    (
      ?auto_54320 - BLOCK
      ?auto_54318 - BLOCK
      ?auto_54321 - BLOCK
      ?auto_54317 - BLOCK
      ?auto_54319 - BLOCK
      ?auto_54322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54316 ?auto_54320 ) ( not ( = ?auto_54316 ?auto_54320 ) ) ( not ( = ?auto_54316 ?auto_54318 ) ) ( not ( = ?auto_54316 ?auto_54321 ) ) ( not ( = ?auto_54320 ?auto_54318 ) ) ( not ( = ?auto_54320 ?auto_54321 ) ) ( not ( = ?auto_54318 ?auto_54321 ) ) ( ON ?auto_54318 ?auto_54316 ) ( ON-TABLE ?auto_54320 ) ( not ( = ?auto_54317 ?auto_54319 ) ) ( not ( = ?auto_54317 ?auto_54322 ) ) ( not ( = ?auto_54317 ?auto_54321 ) ) ( not ( = ?auto_54319 ?auto_54322 ) ) ( not ( = ?auto_54319 ?auto_54321 ) ) ( not ( = ?auto_54322 ?auto_54321 ) ) ( not ( = ?auto_54316 ?auto_54322 ) ) ( not ( = ?auto_54316 ?auto_54317 ) ) ( not ( = ?auto_54316 ?auto_54319 ) ) ( not ( = ?auto_54320 ?auto_54322 ) ) ( not ( = ?auto_54320 ?auto_54317 ) ) ( not ( = ?auto_54320 ?auto_54319 ) ) ( not ( = ?auto_54318 ?auto_54322 ) ) ( not ( = ?auto_54318 ?auto_54317 ) ) ( not ( = ?auto_54318 ?auto_54319 ) ) ( ON ?auto_54321 ?auto_54318 ) ( ON ?auto_54322 ?auto_54321 ) ( ON ?auto_54319 ?auto_54322 ) ( ON ?auto_54317 ?auto_54319 ) ( CLEAR ?auto_54317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_54320 ?auto_54316 ?auto_54318 ?auto_54321 ?auto_54322 ?auto_54319 )
      ( MAKE-1PILE ?auto_54316 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_54332 - BLOCK
      ?auto_54333 - BLOCK
      ?auto_54334 - BLOCK
      ?auto_54335 - BLOCK
    )
    :vars
    (
      ?auto_54336 - BLOCK
      ?auto_54337 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54336 ?auto_54335 ) ( CLEAR ?auto_54336 ) ( ON-TABLE ?auto_54332 ) ( ON ?auto_54333 ?auto_54332 ) ( ON ?auto_54334 ?auto_54333 ) ( ON ?auto_54335 ?auto_54334 ) ( not ( = ?auto_54332 ?auto_54333 ) ) ( not ( = ?auto_54332 ?auto_54334 ) ) ( not ( = ?auto_54332 ?auto_54335 ) ) ( not ( = ?auto_54332 ?auto_54336 ) ) ( not ( = ?auto_54333 ?auto_54334 ) ) ( not ( = ?auto_54333 ?auto_54335 ) ) ( not ( = ?auto_54333 ?auto_54336 ) ) ( not ( = ?auto_54334 ?auto_54335 ) ) ( not ( = ?auto_54334 ?auto_54336 ) ) ( not ( = ?auto_54335 ?auto_54336 ) ) ( HOLDING ?auto_54337 ) ( not ( = ?auto_54332 ?auto_54337 ) ) ( not ( = ?auto_54333 ?auto_54337 ) ) ( not ( = ?auto_54334 ?auto_54337 ) ) ( not ( = ?auto_54335 ?auto_54337 ) ) ( not ( = ?auto_54336 ?auto_54337 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_54337 )
      ( MAKE-4PILE ?auto_54332 ?auto_54333 ?auto_54334 ?auto_54335 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54405 - BLOCK
      ?auto_54406 - BLOCK
    )
    :vars
    (
      ?auto_54407 - BLOCK
      ?auto_54409 - BLOCK
      ?auto_54410 - BLOCK
      ?auto_54408 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54405 ?auto_54406 ) ) ( ON ?auto_54406 ?auto_54407 ) ( not ( = ?auto_54405 ?auto_54407 ) ) ( not ( = ?auto_54406 ?auto_54407 ) ) ( ON ?auto_54405 ?auto_54406 ) ( CLEAR ?auto_54405 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_54409 ) ( ON ?auto_54410 ?auto_54409 ) ( ON ?auto_54408 ?auto_54410 ) ( ON ?auto_54407 ?auto_54408 ) ( not ( = ?auto_54409 ?auto_54410 ) ) ( not ( = ?auto_54409 ?auto_54408 ) ) ( not ( = ?auto_54409 ?auto_54407 ) ) ( not ( = ?auto_54409 ?auto_54406 ) ) ( not ( = ?auto_54409 ?auto_54405 ) ) ( not ( = ?auto_54410 ?auto_54408 ) ) ( not ( = ?auto_54410 ?auto_54407 ) ) ( not ( = ?auto_54410 ?auto_54406 ) ) ( not ( = ?auto_54410 ?auto_54405 ) ) ( not ( = ?auto_54408 ?auto_54407 ) ) ( not ( = ?auto_54408 ?auto_54406 ) ) ( not ( = ?auto_54408 ?auto_54405 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54409 ?auto_54410 ?auto_54408 ?auto_54407 ?auto_54406 )
      ( MAKE-2PILE ?auto_54405 ?auto_54406 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54413 - BLOCK
      ?auto_54414 - BLOCK
    )
    :vars
    (
      ?auto_54415 - BLOCK
      ?auto_54416 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54413 ?auto_54414 ) ) ( ON ?auto_54414 ?auto_54415 ) ( CLEAR ?auto_54414 ) ( not ( = ?auto_54413 ?auto_54415 ) ) ( not ( = ?auto_54414 ?auto_54415 ) ) ( ON ?auto_54413 ?auto_54416 ) ( CLEAR ?auto_54413 ) ( HAND-EMPTY ) ( not ( = ?auto_54413 ?auto_54416 ) ) ( not ( = ?auto_54414 ?auto_54416 ) ) ( not ( = ?auto_54415 ?auto_54416 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_54413 ?auto_54416 )
      ( MAKE-2PILE ?auto_54413 ?auto_54414 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54417 - BLOCK
      ?auto_54418 - BLOCK
    )
    :vars
    (
      ?auto_54420 - BLOCK
      ?auto_54419 - BLOCK
      ?auto_54421 - BLOCK
      ?auto_54423 - BLOCK
      ?auto_54422 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54417 ?auto_54418 ) ) ( not ( = ?auto_54417 ?auto_54420 ) ) ( not ( = ?auto_54418 ?auto_54420 ) ) ( ON ?auto_54417 ?auto_54419 ) ( CLEAR ?auto_54417 ) ( not ( = ?auto_54417 ?auto_54419 ) ) ( not ( = ?auto_54418 ?auto_54419 ) ) ( not ( = ?auto_54420 ?auto_54419 ) ) ( HOLDING ?auto_54418 ) ( CLEAR ?auto_54420 ) ( ON-TABLE ?auto_54421 ) ( ON ?auto_54423 ?auto_54421 ) ( ON ?auto_54422 ?auto_54423 ) ( ON ?auto_54420 ?auto_54422 ) ( not ( = ?auto_54421 ?auto_54423 ) ) ( not ( = ?auto_54421 ?auto_54422 ) ) ( not ( = ?auto_54421 ?auto_54420 ) ) ( not ( = ?auto_54421 ?auto_54418 ) ) ( not ( = ?auto_54423 ?auto_54422 ) ) ( not ( = ?auto_54423 ?auto_54420 ) ) ( not ( = ?auto_54423 ?auto_54418 ) ) ( not ( = ?auto_54422 ?auto_54420 ) ) ( not ( = ?auto_54422 ?auto_54418 ) ) ( not ( = ?auto_54417 ?auto_54421 ) ) ( not ( = ?auto_54417 ?auto_54423 ) ) ( not ( = ?auto_54417 ?auto_54422 ) ) ( not ( = ?auto_54419 ?auto_54421 ) ) ( not ( = ?auto_54419 ?auto_54423 ) ) ( not ( = ?auto_54419 ?auto_54422 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54421 ?auto_54423 ?auto_54422 ?auto_54420 ?auto_54418 )
      ( MAKE-2PILE ?auto_54417 ?auto_54418 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54424 - BLOCK
      ?auto_54425 - BLOCK
    )
    :vars
    (
      ?auto_54430 - BLOCK
      ?auto_54427 - BLOCK
      ?auto_54429 - BLOCK
      ?auto_54428 - BLOCK
      ?auto_54426 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54424 ?auto_54425 ) ) ( not ( = ?auto_54424 ?auto_54430 ) ) ( not ( = ?auto_54425 ?auto_54430 ) ) ( ON ?auto_54424 ?auto_54427 ) ( not ( = ?auto_54424 ?auto_54427 ) ) ( not ( = ?auto_54425 ?auto_54427 ) ) ( not ( = ?auto_54430 ?auto_54427 ) ) ( CLEAR ?auto_54430 ) ( ON-TABLE ?auto_54429 ) ( ON ?auto_54428 ?auto_54429 ) ( ON ?auto_54426 ?auto_54428 ) ( ON ?auto_54430 ?auto_54426 ) ( not ( = ?auto_54429 ?auto_54428 ) ) ( not ( = ?auto_54429 ?auto_54426 ) ) ( not ( = ?auto_54429 ?auto_54430 ) ) ( not ( = ?auto_54429 ?auto_54425 ) ) ( not ( = ?auto_54428 ?auto_54426 ) ) ( not ( = ?auto_54428 ?auto_54430 ) ) ( not ( = ?auto_54428 ?auto_54425 ) ) ( not ( = ?auto_54426 ?auto_54430 ) ) ( not ( = ?auto_54426 ?auto_54425 ) ) ( not ( = ?auto_54424 ?auto_54429 ) ) ( not ( = ?auto_54424 ?auto_54428 ) ) ( not ( = ?auto_54424 ?auto_54426 ) ) ( not ( = ?auto_54427 ?auto_54429 ) ) ( not ( = ?auto_54427 ?auto_54428 ) ) ( not ( = ?auto_54427 ?auto_54426 ) ) ( ON ?auto_54425 ?auto_54424 ) ( CLEAR ?auto_54425 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_54427 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54427 ?auto_54424 )
      ( MAKE-2PILE ?auto_54424 ?auto_54425 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54431 - BLOCK
      ?auto_54432 - BLOCK
    )
    :vars
    (
      ?auto_54434 - BLOCK
      ?auto_54436 - BLOCK
      ?auto_54435 - BLOCK
      ?auto_54437 - BLOCK
      ?auto_54433 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54431 ?auto_54432 ) ) ( not ( = ?auto_54431 ?auto_54434 ) ) ( not ( = ?auto_54432 ?auto_54434 ) ) ( ON ?auto_54431 ?auto_54436 ) ( not ( = ?auto_54431 ?auto_54436 ) ) ( not ( = ?auto_54432 ?auto_54436 ) ) ( not ( = ?auto_54434 ?auto_54436 ) ) ( ON-TABLE ?auto_54435 ) ( ON ?auto_54437 ?auto_54435 ) ( ON ?auto_54433 ?auto_54437 ) ( not ( = ?auto_54435 ?auto_54437 ) ) ( not ( = ?auto_54435 ?auto_54433 ) ) ( not ( = ?auto_54435 ?auto_54434 ) ) ( not ( = ?auto_54435 ?auto_54432 ) ) ( not ( = ?auto_54437 ?auto_54433 ) ) ( not ( = ?auto_54437 ?auto_54434 ) ) ( not ( = ?auto_54437 ?auto_54432 ) ) ( not ( = ?auto_54433 ?auto_54434 ) ) ( not ( = ?auto_54433 ?auto_54432 ) ) ( not ( = ?auto_54431 ?auto_54435 ) ) ( not ( = ?auto_54431 ?auto_54437 ) ) ( not ( = ?auto_54431 ?auto_54433 ) ) ( not ( = ?auto_54436 ?auto_54435 ) ) ( not ( = ?auto_54436 ?auto_54437 ) ) ( not ( = ?auto_54436 ?auto_54433 ) ) ( ON ?auto_54432 ?auto_54431 ) ( CLEAR ?auto_54432 ) ( ON-TABLE ?auto_54436 ) ( HOLDING ?auto_54434 ) ( CLEAR ?auto_54433 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_54435 ?auto_54437 ?auto_54433 ?auto_54434 )
      ( MAKE-2PILE ?auto_54431 ?auto_54432 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54438 - BLOCK
      ?auto_54439 - BLOCK
    )
    :vars
    (
      ?auto_54440 - BLOCK
      ?auto_54441 - BLOCK
      ?auto_54442 - BLOCK
      ?auto_54444 - BLOCK
      ?auto_54443 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54438 ?auto_54439 ) ) ( not ( = ?auto_54438 ?auto_54440 ) ) ( not ( = ?auto_54439 ?auto_54440 ) ) ( ON ?auto_54438 ?auto_54441 ) ( not ( = ?auto_54438 ?auto_54441 ) ) ( not ( = ?auto_54439 ?auto_54441 ) ) ( not ( = ?auto_54440 ?auto_54441 ) ) ( ON-TABLE ?auto_54442 ) ( ON ?auto_54444 ?auto_54442 ) ( ON ?auto_54443 ?auto_54444 ) ( not ( = ?auto_54442 ?auto_54444 ) ) ( not ( = ?auto_54442 ?auto_54443 ) ) ( not ( = ?auto_54442 ?auto_54440 ) ) ( not ( = ?auto_54442 ?auto_54439 ) ) ( not ( = ?auto_54444 ?auto_54443 ) ) ( not ( = ?auto_54444 ?auto_54440 ) ) ( not ( = ?auto_54444 ?auto_54439 ) ) ( not ( = ?auto_54443 ?auto_54440 ) ) ( not ( = ?auto_54443 ?auto_54439 ) ) ( not ( = ?auto_54438 ?auto_54442 ) ) ( not ( = ?auto_54438 ?auto_54444 ) ) ( not ( = ?auto_54438 ?auto_54443 ) ) ( not ( = ?auto_54441 ?auto_54442 ) ) ( not ( = ?auto_54441 ?auto_54444 ) ) ( not ( = ?auto_54441 ?auto_54443 ) ) ( ON ?auto_54439 ?auto_54438 ) ( ON-TABLE ?auto_54441 ) ( CLEAR ?auto_54443 ) ( ON ?auto_54440 ?auto_54439 ) ( CLEAR ?auto_54440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_54441 ?auto_54438 ?auto_54439 )
      ( MAKE-2PILE ?auto_54438 ?auto_54439 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54445 - BLOCK
      ?auto_54446 - BLOCK
    )
    :vars
    (
      ?auto_54447 - BLOCK
      ?auto_54450 - BLOCK
      ?auto_54451 - BLOCK
      ?auto_54449 - BLOCK
      ?auto_54448 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54445 ?auto_54446 ) ) ( not ( = ?auto_54445 ?auto_54447 ) ) ( not ( = ?auto_54446 ?auto_54447 ) ) ( ON ?auto_54445 ?auto_54450 ) ( not ( = ?auto_54445 ?auto_54450 ) ) ( not ( = ?auto_54446 ?auto_54450 ) ) ( not ( = ?auto_54447 ?auto_54450 ) ) ( ON-TABLE ?auto_54451 ) ( ON ?auto_54449 ?auto_54451 ) ( not ( = ?auto_54451 ?auto_54449 ) ) ( not ( = ?auto_54451 ?auto_54448 ) ) ( not ( = ?auto_54451 ?auto_54447 ) ) ( not ( = ?auto_54451 ?auto_54446 ) ) ( not ( = ?auto_54449 ?auto_54448 ) ) ( not ( = ?auto_54449 ?auto_54447 ) ) ( not ( = ?auto_54449 ?auto_54446 ) ) ( not ( = ?auto_54448 ?auto_54447 ) ) ( not ( = ?auto_54448 ?auto_54446 ) ) ( not ( = ?auto_54445 ?auto_54451 ) ) ( not ( = ?auto_54445 ?auto_54449 ) ) ( not ( = ?auto_54445 ?auto_54448 ) ) ( not ( = ?auto_54450 ?auto_54451 ) ) ( not ( = ?auto_54450 ?auto_54449 ) ) ( not ( = ?auto_54450 ?auto_54448 ) ) ( ON ?auto_54446 ?auto_54445 ) ( ON-TABLE ?auto_54450 ) ( ON ?auto_54447 ?auto_54446 ) ( CLEAR ?auto_54447 ) ( HOLDING ?auto_54448 ) ( CLEAR ?auto_54449 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_54451 ?auto_54449 ?auto_54448 )
      ( MAKE-2PILE ?auto_54445 ?auto_54446 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54452 - BLOCK
      ?auto_54453 - BLOCK
    )
    :vars
    (
      ?auto_54457 - BLOCK
      ?auto_54455 - BLOCK
      ?auto_54458 - BLOCK
      ?auto_54454 - BLOCK
      ?auto_54456 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54452 ?auto_54453 ) ) ( not ( = ?auto_54452 ?auto_54457 ) ) ( not ( = ?auto_54453 ?auto_54457 ) ) ( ON ?auto_54452 ?auto_54455 ) ( not ( = ?auto_54452 ?auto_54455 ) ) ( not ( = ?auto_54453 ?auto_54455 ) ) ( not ( = ?auto_54457 ?auto_54455 ) ) ( ON-TABLE ?auto_54458 ) ( ON ?auto_54454 ?auto_54458 ) ( not ( = ?auto_54458 ?auto_54454 ) ) ( not ( = ?auto_54458 ?auto_54456 ) ) ( not ( = ?auto_54458 ?auto_54457 ) ) ( not ( = ?auto_54458 ?auto_54453 ) ) ( not ( = ?auto_54454 ?auto_54456 ) ) ( not ( = ?auto_54454 ?auto_54457 ) ) ( not ( = ?auto_54454 ?auto_54453 ) ) ( not ( = ?auto_54456 ?auto_54457 ) ) ( not ( = ?auto_54456 ?auto_54453 ) ) ( not ( = ?auto_54452 ?auto_54458 ) ) ( not ( = ?auto_54452 ?auto_54454 ) ) ( not ( = ?auto_54452 ?auto_54456 ) ) ( not ( = ?auto_54455 ?auto_54458 ) ) ( not ( = ?auto_54455 ?auto_54454 ) ) ( not ( = ?auto_54455 ?auto_54456 ) ) ( ON ?auto_54453 ?auto_54452 ) ( ON-TABLE ?auto_54455 ) ( ON ?auto_54457 ?auto_54453 ) ( CLEAR ?auto_54454 ) ( ON ?auto_54456 ?auto_54457 ) ( CLEAR ?auto_54456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_54455 ?auto_54452 ?auto_54453 ?auto_54457 )
      ( MAKE-2PILE ?auto_54452 ?auto_54453 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54459 - BLOCK
      ?auto_54460 - BLOCK
    )
    :vars
    (
      ?auto_54461 - BLOCK
      ?auto_54463 - BLOCK
      ?auto_54465 - BLOCK
      ?auto_54464 - BLOCK
      ?auto_54462 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54459 ?auto_54460 ) ) ( not ( = ?auto_54459 ?auto_54461 ) ) ( not ( = ?auto_54460 ?auto_54461 ) ) ( ON ?auto_54459 ?auto_54463 ) ( not ( = ?auto_54459 ?auto_54463 ) ) ( not ( = ?auto_54460 ?auto_54463 ) ) ( not ( = ?auto_54461 ?auto_54463 ) ) ( ON-TABLE ?auto_54465 ) ( not ( = ?auto_54465 ?auto_54464 ) ) ( not ( = ?auto_54465 ?auto_54462 ) ) ( not ( = ?auto_54465 ?auto_54461 ) ) ( not ( = ?auto_54465 ?auto_54460 ) ) ( not ( = ?auto_54464 ?auto_54462 ) ) ( not ( = ?auto_54464 ?auto_54461 ) ) ( not ( = ?auto_54464 ?auto_54460 ) ) ( not ( = ?auto_54462 ?auto_54461 ) ) ( not ( = ?auto_54462 ?auto_54460 ) ) ( not ( = ?auto_54459 ?auto_54465 ) ) ( not ( = ?auto_54459 ?auto_54464 ) ) ( not ( = ?auto_54459 ?auto_54462 ) ) ( not ( = ?auto_54463 ?auto_54465 ) ) ( not ( = ?auto_54463 ?auto_54464 ) ) ( not ( = ?auto_54463 ?auto_54462 ) ) ( ON ?auto_54460 ?auto_54459 ) ( ON-TABLE ?auto_54463 ) ( ON ?auto_54461 ?auto_54460 ) ( ON ?auto_54462 ?auto_54461 ) ( CLEAR ?auto_54462 ) ( HOLDING ?auto_54464 ) ( CLEAR ?auto_54465 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54465 ?auto_54464 )
      ( MAKE-2PILE ?auto_54459 ?auto_54460 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54466 - BLOCK
      ?auto_54467 - BLOCK
    )
    :vars
    (
      ?auto_54470 - BLOCK
      ?auto_54471 - BLOCK
      ?auto_54469 - BLOCK
      ?auto_54472 - BLOCK
      ?auto_54468 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54466 ?auto_54467 ) ) ( not ( = ?auto_54466 ?auto_54470 ) ) ( not ( = ?auto_54467 ?auto_54470 ) ) ( ON ?auto_54466 ?auto_54471 ) ( not ( = ?auto_54466 ?auto_54471 ) ) ( not ( = ?auto_54467 ?auto_54471 ) ) ( not ( = ?auto_54470 ?auto_54471 ) ) ( ON-TABLE ?auto_54469 ) ( not ( = ?auto_54469 ?auto_54472 ) ) ( not ( = ?auto_54469 ?auto_54468 ) ) ( not ( = ?auto_54469 ?auto_54470 ) ) ( not ( = ?auto_54469 ?auto_54467 ) ) ( not ( = ?auto_54472 ?auto_54468 ) ) ( not ( = ?auto_54472 ?auto_54470 ) ) ( not ( = ?auto_54472 ?auto_54467 ) ) ( not ( = ?auto_54468 ?auto_54470 ) ) ( not ( = ?auto_54468 ?auto_54467 ) ) ( not ( = ?auto_54466 ?auto_54469 ) ) ( not ( = ?auto_54466 ?auto_54472 ) ) ( not ( = ?auto_54466 ?auto_54468 ) ) ( not ( = ?auto_54471 ?auto_54469 ) ) ( not ( = ?auto_54471 ?auto_54472 ) ) ( not ( = ?auto_54471 ?auto_54468 ) ) ( ON ?auto_54467 ?auto_54466 ) ( ON-TABLE ?auto_54471 ) ( ON ?auto_54470 ?auto_54467 ) ( ON ?auto_54468 ?auto_54470 ) ( CLEAR ?auto_54469 ) ( ON ?auto_54472 ?auto_54468 ) ( CLEAR ?auto_54472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54471 ?auto_54466 ?auto_54467 ?auto_54470 ?auto_54468 )
      ( MAKE-2PILE ?auto_54466 ?auto_54467 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54473 - BLOCK
      ?auto_54474 - BLOCK
    )
    :vars
    (
      ?auto_54477 - BLOCK
      ?auto_54478 - BLOCK
      ?auto_54479 - BLOCK
      ?auto_54476 - BLOCK
      ?auto_54475 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54473 ?auto_54474 ) ) ( not ( = ?auto_54473 ?auto_54477 ) ) ( not ( = ?auto_54474 ?auto_54477 ) ) ( ON ?auto_54473 ?auto_54478 ) ( not ( = ?auto_54473 ?auto_54478 ) ) ( not ( = ?auto_54474 ?auto_54478 ) ) ( not ( = ?auto_54477 ?auto_54478 ) ) ( not ( = ?auto_54479 ?auto_54476 ) ) ( not ( = ?auto_54479 ?auto_54475 ) ) ( not ( = ?auto_54479 ?auto_54477 ) ) ( not ( = ?auto_54479 ?auto_54474 ) ) ( not ( = ?auto_54476 ?auto_54475 ) ) ( not ( = ?auto_54476 ?auto_54477 ) ) ( not ( = ?auto_54476 ?auto_54474 ) ) ( not ( = ?auto_54475 ?auto_54477 ) ) ( not ( = ?auto_54475 ?auto_54474 ) ) ( not ( = ?auto_54473 ?auto_54479 ) ) ( not ( = ?auto_54473 ?auto_54476 ) ) ( not ( = ?auto_54473 ?auto_54475 ) ) ( not ( = ?auto_54478 ?auto_54479 ) ) ( not ( = ?auto_54478 ?auto_54476 ) ) ( not ( = ?auto_54478 ?auto_54475 ) ) ( ON ?auto_54474 ?auto_54473 ) ( ON-TABLE ?auto_54478 ) ( ON ?auto_54477 ?auto_54474 ) ( ON ?auto_54475 ?auto_54477 ) ( ON ?auto_54476 ?auto_54475 ) ( CLEAR ?auto_54476 ) ( HOLDING ?auto_54479 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_54479 )
      ( MAKE-2PILE ?auto_54473 ?auto_54474 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54480 - BLOCK
      ?auto_54481 - BLOCK
    )
    :vars
    (
      ?auto_54482 - BLOCK
      ?auto_54486 - BLOCK
      ?auto_54483 - BLOCK
      ?auto_54485 - BLOCK
      ?auto_54484 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54480 ?auto_54481 ) ) ( not ( = ?auto_54480 ?auto_54482 ) ) ( not ( = ?auto_54481 ?auto_54482 ) ) ( ON ?auto_54480 ?auto_54486 ) ( not ( = ?auto_54480 ?auto_54486 ) ) ( not ( = ?auto_54481 ?auto_54486 ) ) ( not ( = ?auto_54482 ?auto_54486 ) ) ( not ( = ?auto_54483 ?auto_54485 ) ) ( not ( = ?auto_54483 ?auto_54484 ) ) ( not ( = ?auto_54483 ?auto_54482 ) ) ( not ( = ?auto_54483 ?auto_54481 ) ) ( not ( = ?auto_54485 ?auto_54484 ) ) ( not ( = ?auto_54485 ?auto_54482 ) ) ( not ( = ?auto_54485 ?auto_54481 ) ) ( not ( = ?auto_54484 ?auto_54482 ) ) ( not ( = ?auto_54484 ?auto_54481 ) ) ( not ( = ?auto_54480 ?auto_54483 ) ) ( not ( = ?auto_54480 ?auto_54485 ) ) ( not ( = ?auto_54480 ?auto_54484 ) ) ( not ( = ?auto_54486 ?auto_54483 ) ) ( not ( = ?auto_54486 ?auto_54485 ) ) ( not ( = ?auto_54486 ?auto_54484 ) ) ( ON ?auto_54481 ?auto_54480 ) ( ON-TABLE ?auto_54486 ) ( ON ?auto_54482 ?auto_54481 ) ( ON ?auto_54484 ?auto_54482 ) ( ON ?auto_54485 ?auto_54484 ) ( ON ?auto_54483 ?auto_54485 ) ( CLEAR ?auto_54483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_54486 ?auto_54480 ?auto_54481 ?auto_54482 ?auto_54484 ?auto_54485 )
      ( MAKE-2PILE ?auto_54480 ?auto_54481 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54506 - BLOCK
      ?auto_54507 - BLOCK
      ?auto_54508 - BLOCK
    )
    :vars
    (
      ?auto_54509 - BLOCK
      ?auto_54510 - BLOCK
      ?auto_54511 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54509 ?auto_54508 ) ( ON-TABLE ?auto_54506 ) ( ON ?auto_54507 ?auto_54506 ) ( ON ?auto_54508 ?auto_54507 ) ( not ( = ?auto_54506 ?auto_54507 ) ) ( not ( = ?auto_54506 ?auto_54508 ) ) ( not ( = ?auto_54506 ?auto_54509 ) ) ( not ( = ?auto_54507 ?auto_54508 ) ) ( not ( = ?auto_54507 ?auto_54509 ) ) ( not ( = ?auto_54508 ?auto_54509 ) ) ( not ( = ?auto_54506 ?auto_54510 ) ) ( not ( = ?auto_54506 ?auto_54511 ) ) ( not ( = ?auto_54507 ?auto_54510 ) ) ( not ( = ?auto_54507 ?auto_54511 ) ) ( not ( = ?auto_54508 ?auto_54510 ) ) ( not ( = ?auto_54508 ?auto_54511 ) ) ( not ( = ?auto_54509 ?auto_54510 ) ) ( not ( = ?auto_54509 ?auto_54511 ) ) ( not ( = ?auto_54510 ?auto_54511 ) ) ( ON ?auto_54510 ?auto_54509 ) ( CLEAR ?auto_54510 ) ( HOLDING ?auto_54511 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_54511 )
      ( MAKE-3PILE ?auto_54506 ?auto_54507 ?auto_54508 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54571 - BLOCK
      ?auto_54572 - BLOCK
      ?auto_54573 - BLOCK
    )
    :vars
    (
      ?auto_54574 - BLOCK
      ?auto_54576 - BLOCK
      ?auto_54575 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54571 ) ( not ( = ?auto_54571 ?auto_54572 ) ) ( not ( = ?auto_54571 ?auto_54573 ) ) ( not ( = ?auto_54572 ?auto_54573 ) ) ( ON ?auto_54573 ?auto_54574 ) ( not ( = ?auto_54571 ?auto_54574 ) ) ( not ( = ?auto_54572 ?auto_54574 ) ) ( not ( = ?auto_54573 ?auto_54574 ) ) ( CLEAR ?auto_54571 ) ( ON ?auto_54572 ?auto_54573 ) ( CLEAR ?auto_54572 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_54576 ) ( ON ?auto_54575 ?auto_54576 ) ( ON ?auto_54574 ?auto_54575 ) ( not ( = ?auto_54576 ?auto_54575 ) ) ( not ( = ?auto_54576 ?auto_54574 ) ) ( not ( = ?auto_54576 ?auto_54573 ) ) ( not ( = ?auto_54576 ?auto_54572 ) ) ( not ( = ?auto_54575 ?auto_54574 ) ) ( not ( = ?auto_54575 ?auto_54573 ) ) ( not ( = ?auto_54575 ?auto_54572 ) ) ( not ( = ?auto_54571 ?auto_54576 ) ) ( not ( = ?auto_54571 ?auto_54575 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_54576 ?auto_54575 ?auto_54574 ?auto_54573 )
      ( MAKE-3PILE ?auto_54571 ?auto_54572 ?auto_54573 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54577 - BLOCK
      ?auto_54578 - BLOCK
      ?auto_54579 - BLOCK
    )
    :vars
    (
      ?auto_54580 - BLOCK
      ?auto_54582 - BLOCK
      ?auto_54581 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54577 ?auto_54578 ) ) ( not ( = ?auto_54577 ?auto_54579 ) ) ( not ( = ?auto_54578 ?auto_54579 ) ) ( ON ?auto_54579 ?auto_54580 ) ( not ( = ?auto_54577 ?auto_54580 ) ) ( not ( = ?auto_54578 ?auto_54580 ) ) ( not ( = ?auto_54579 ?auto_54580 ) ) ( ON ?auto_54578 ?auto_54579 ) ( CLEAR ?auto_54578 ) ( ON-TABLE ?auto_54582 ) ( ON ?auto_54581 ?auto_54582 ) ( ON ?auto_54580 ?auto_54581 ) ( not ( = ?auto_54582 ?auto_54581 ) ) ( not ( = ?auto_54582 ?auto_54580 ) ) ( not ( = ?auto_54582 ?auto_54579 ) ) ( not ( = ?auto_54582 ?auto_54578 ) ) ( not ( = ?auto_54581 ?auto_54580 ) ) ( not ( = ?auto_54581 ?auto_54579 ) ) ( not ( = ?auto_54581 ?auto_54578 ) ) ( not ( = ?auto_54577 ?auto_54582 ) ) ( not ( = ?auto_54577 ?auto_54581 ) ) ( HOLDING ?auto_54577 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_54577 )
      ( MAKE-3PILE ?auto_54577 ?auto_54578 ?auto_54579 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54583 - BLOCK
      ?auto_54584 - BLOCK
      ?auto_54585 - BLOCK
    )
    :vars
    (
      ?auto_54588 - BLOCK
      ?auto_54587 - BLOCK
      ?auto_54586 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54583 ?auto_54584 ) ) ( not ( = ?auto_54583 ?auto_54585 ) ) ( not ( = ?auto_54584 ?auto_54585 ) ) ( ON ?auto_54585 ?auto_54588 ) ( not ( = ?auto_54583 ?auto_54588 ) ) ( not ( = ?auto_54584 ?auto_54588 ) ) ( not ( = ?auto_54585 ?auto_54588 ) ) ( ON ?auto_54584 ?auto_54585 ) ( ON-TABLE ?auto_54587 ) ( ON ?auto_54586 ?auto_54587 ) ( ON ?auto_54588 ?auto_54586 ) ( not ( = ?auto_54587 ?auto_54586 ) ) ( not ( = ?auto_54587 ?auto_54588 ) ) ( not ( = ?auto_54587 ?auto_54585 ) ) ( not ( = ?auto_54587 ?auto_54584 ) ) ( not ( = ?auto_54586 ?auto_54588 ) ) ( not ( = ?auto_54586 ?auto_54585 ) ) ( not ( = ?auto_54586 ?auto_54584 ) ) ( not ( = ?auto_54583 ?auto_54587 ) ) ( not ( = ?auto_54583 ?auto_54586 ) ) ( ON ?auto_54583 ?auto_54584 ) ( CLEAR ?auto_54583 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54587 ?auto_54586 ?auto_54588 ?auto_54585 ?auto_54584 )
      ( MAKE-3PILE ?auto_54583 ?auto_54584 ?auto_54585 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54592 - BLOCK
      ?auto_54593 - BLOCK
      ?auto_54594 - BLOCK
    )
    :vars
    (
      ?auto_54597 - BLOCK
      ?auto_54596 - BLOCK
      ?auto_54595 - BLOCK
      ?auto_54598 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54592 ?auto_54593 ) ) ( not ( = ?auto_54592 ?auto_54594 ) ) ( not ( = ?auto_54593 ?auto_54594 ) ) ( ON ?auto_54594 ?auto_54597 ) ( not ( = ?auto_54592 ?auto_54597 ) ) ( not ( = ?auto_54593 ?auto_54597 ) ) ( not ( = ?auto_54594 ?auto_54597 ) ) ( ON ?auto_54593 ?auto_54594 ) ( CLEAR ?auto_54593 ) ( ON-TABLE ?auto_54596 ) ( ON ?auto_54595 ?auto_54596 ) ( ON ?auto_54597 ?auto_54595 ) ( not ( = ?auto_54596 ?auto_54595 ) ) ( not ( = ?auto_54596 ?auto_54597 ) ) ( not ( = ?auto_54596 ?auto_54594 ) ) ( not ( = ?auto_54596 ?auto_54593 ) ) ( not ( = ?auto_54595 ?auto_54597 ) ) ( not ( = ?auto_54595 ?auto_54594 ) ) ( not ( = ?auto_54595 ?auto_54593 ) ) ( not ( = ?auto_54592 ?auto_54596 ) ) ( not ( = ?auto_54592 ?auto_54595 ) ) ( ON ?auto_54592 ?auto_54598 ) ( CLEAR ?auto_54592 ) ( HAND-EMPTY ) ( not ( = ?auto_54592 ?auto_54598 ) ) ( not ( = ?auto_54593 ?auto_54598 ) ) ( not ( = ?auto_54594 ?auto_54598 ) ) ( not ( = ?auto_54597 ?auto_54598 ) ) ( not ( = ?auto_54596 ?auto_54598 ) ) ( not ( = ?auto_54595 ?auto_54598 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_54592 ?auto_54598 )
      ( MAKE-3PILE ?auto_54592 ?auto_54593 ?auto_54594 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54599 - BLOCK
      ?auto_54600 - BLOCK
      ?auto_54601 - BLOCK
    )
    :vars
    (
      ?auto_54603 - BLOCK
      ?auto_54605 - BLOCK
      ?auto_54602 - BLOCK
      ?auto_54604 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54599 ?auto_54600 ) ) ( not ( = ?auto_54599 ?auto_54601 ) ) ( not ( = ?auto_54600 ?auto_54601 ) ) ( ON ?auto_54601 ?auto_54603 ) ( not ( = ?auto_54599 ?auto_54603 ) ) ( not ( = ?auto_54600 ?auto_54603 ) ) ( not ( = ?auto_54601 ?auto_54603 ) ) ( ON-TABLE ?auto_54605 ) ( ON ?auto_54602 ?auto_54605 ) ( ON ?auto_54603 ?auto_54602 ) ( not ( = ?auto_54605 ?auto_54602 ) ) ( not ( = ?auto_54605 ?auto_54603 ) ) ( not ( = ?auto_54605 ?auto_54601 ) ) ( not ( = ?auto_54605 ?auto_54600 ) ) ( not ( = ?auto_54602 ?auto_54603 ) ) ( not ( = ?auto_54602 ?auto_54601 ) ) ( not ( = ?auto_54602 ?auto_54600 ) ) ( not ( = ?auto_54599 ?auto_54605 ) ) ( not ( = ?auto_54599 ?auto_54602 ) ) ( ON ?auto_54599 ?auto_54604 ) ( CLEAR ?auto_54599 ) ( not ( = ?auto_54599 ?auto_54604 ) ) ( not ( = ?auto_54600 ?auto_54604 ) ) ( not ( = ?auto_54601 ?auto_54604 ) ) ( not ( = ?auto_54603 ?auto_54604 ) ) ( not ( = ?auto_54605 ?auto_54604 ) ) ( not ( = ?auto_54602 ?auto_54604 ) ) ( HOLDING ?auto_54600 ) ( CLEAR ?auto_54601 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54605 ?auto_54602 ?auto_54603 ?auto_54601 ?auto_54600 )
      ( MAKE-3PILE ?auto_54599 ?auto_54600 ?auto_54601 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54606 - BLOCK
      ?auto_54607 - BLOCK
      ?auto_54608 - BLOCK
    )
    :vars
    (
      ?auto_54612 - BLOCK
      ?auto_54611 - BLOCK
      ?auto_54609 - BLOCK
      ?auto_54610 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54606 ?auto_54607 ) ) ( not ( = ?auto_54606 ?auto_54608 ) ) ( not ( = ?auto_54607 ?auto_54608 ) ) ( ON ?auto_54608 ?auto_54612 ) ( not ( = ?auto_54606 ?auto_54612 ) ) ( not ( = ?auto_54607 ?auto_54612 ) ) ( not ( = ?auto_54608 ?auto_54612 ) ) ( ON-TABLE ?auto_54611 ) ( ON ?auto_54609 ?auto_54611 ) ( ON ?auto_54612 ?auto_54609 ) ( not ( = ?auto_54611 ?auto_54609 ) ) ( not ( = ?auto_54611 ?auto_54612 ) ) ( not ( = ?auto_54611 ?auto_54608 ) ) ( not ( = ?auto_54611 ?auto_54607 ) ) ( not ( = ?auto_54609 ?auto_54612 ) ) ( not ( = ?auto_54609 ?auto_54608 ) ) ( not ( = ?auto_54609 ?auto_54607 ) ) ( not ( = ?auto_54606 ?auto_54611 ) ) ( not ( = ?auto_54606 ?auto_54609 ) ) ( ON ?auto_54606 ?auto_54610 ) ( not ( = ?auto_54606 ?auto_54610 ) ) ( not ( = ?auto_54607 ?auto_54610 ) ) ( not ( = ?auto_54608 ?auto_54610 ) ) ( not ( = ?auto_54612 ?auto_54610 ) ) ( not ( = ?auto_54611 ?auto_54610 ) ) ( not ( = ?auto_54609 ?auto_54610 ) ) ( CLEAR ?auto_54608 ) ( ON ?auto_54607 ?auto_54606 ) ( CLEAR ?auto_54607 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_54610 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54610 ?auto_54606 )
      ( MAKE-3PILE ?auto_54606 ?auto_54607 ?auto_54608 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54613 - BLOCK
      ?auto_54614 - BLOCK
      ?auto_54615 - BLOCK
    )
    :vars
    (
      ?auto_54616 - BLOCK
      ?auto_54617 - BLOCK
      ?auto_54619 - BLOCK
      ?auto_54618 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54613 ?auto_54614 ) ) ( not ( = ?auto_54613 ?auto_54615 ) ) ( not ( = ?auto_54614 ?auto_54615 ) ) ( not ( = ?auto_54613 ?auto_54616 ) ) ( not ( = ?auto_54614 ?auto_54616 ) ) ( not ( = ?auto_54615 ?auto_54616 ) ) ( ON-TABLE ?auto_54617 ) ( ON ?auto_54619 ?auto_54617 ) ( ON ?auto_54616 ?auto_54619 ) ( not ( = ?auto_54617 ?auto_54619 ) ) ( not ( = ?auto_54617 ?auto_54616 ) ) ( not ( = ?auto_54617 ?auto_54615 ) ) ( not ( = ?auto_54617 ?auto_54614 ) ) ( not ( = ?auto_54619 ?auto_54616 ) ) ( not ( = ?auto_54619 ?auto_54615 ) ) ( not ( = ?auto_54619 ?auto_54614 ) ) ( not ( = ?auto_54613 ?auto_54617 ) ) ( not ( = ?auto_54613 ?auto_54619 ) ) ( ON ?auto_54613 ?auto_54618 ) ( not ( = ?auto_54613 ?auto_54618 ) ) ( not ( = ?auto_54614 ?auto_54618 ) ) ( not ( = ?auto_54615 ?auto_54618 ) ) ( not ( = ?auto_54616 ?auto_54618 ) ) ( not ( = ?auto_54617 ?auto_54618 ) ) ( not ( = ?auto_54619 ?auto_54618 ) ) ( ON ?auto_54614 ?auto_54613 ) ( CLEAR ?auto_54614 ) ( ON-TABLE ?auto_54618 ) ( HOLDING ?auto_54615 ) ( CLEAR ?auto_54616 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_54617 ?auto_54619 ?auto_54616 ?auto_54615 )
      ( MAKE-3PILE ?auto_54613 ?auto_54614 ?auto_54615 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54620 - BLOCK
      ?auto_54621 - BLOCK
      ?auto_54622 - BLOCK
    )
    :vars
    (
      ?auto_54626 - BLOCK
      ?auto_54623 - BLOCK
      ?auto_54625 - BLOCK
      ?auto_54624 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54620 ?auto_54621 ) ) ( not ( = ?auto_54620 ?auto_54622 ) ) ( not ( = ?auto_54621 ?auto_54622 ) ) ( not ( = ?auto_54620 ?auto_54626 ) ) ( not ( = ?auto_54621 ?auto_54626 ) ) ( not ( = ?auto_54622 ?auto_54626 ) ) ( ON-TABLE ?auto_54623 ) ( ON ?auto_54625 ?auto_54623 ) ( ON ?auto_54626 ?auto_54625 ) ( not ( = ?auto_54623 ?auto_54625 ) ) ( not ( = ?auto_54623 ?auto_54626 ) ) ( not ( = ?auto_54623 ?auto_54622 ) ) ( not ( = ?auto_54623 ?auto_54621 ) ) ( not ( = ?auto_54625 ?auto_54626 ) ) ( not ( = ?auto_54625 ?auto_54622 ) ) ( not ( = ?auto_54625 ?auto_54621 ) ) ( not ( = ?auto_54620 ?auto_54623 ) ) ( not ( = ?auto_54620 ?auto_54625 ) ) ( ON ?auto_54620 ?auto_54624 ) ( not ( = ?auto_54620 ?auto_54624 ) ) ( not ( = ?auto_54621 ?auto_54624 ) ) ( not ( = ?auto_54622 ?auto_54624 ) ) ( not ( = ?auto_54626 ?auto_54624 ) ) ( not ( = ?auto_54623 ?auto_54624 ) ) ( not ( = ?auto_54625 ?auto_54624 ) ) ( ON ?auto_54621 ?auto_54620 ) ( ON-TABLE ?auto_54624 ) ( CLEAR ?auto_54626 ) ( ON ?auto_54622 ?auto_54621 ) ( CLEAR ?auto_54622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_54624 ?auto_54620 ?auto_54621 )
      ( MAKE-3PILE ?auto_54620 ?auto_54621 ?auto_54622 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54627 - BLOCK
      ?auto_54628 - BLOCK
      ?auto_54629 - BLOCK
    )
    :vars
    (
      ?auto_54633 - BLOCK
      ?auto_54631 - BLOCK
      ?auto_54632 - BLOCK
      ?auto_54630 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54627 ?auto_54628 ) ) ( not ( = ?auto_54627 ?auto_54629 ) ) ( not ( = ?auto_54628 ?auto_54629 ) ) ( not ( = ?auto_54627 ?auto_54633 ) ) ( not ( = ?auto_54628 ?auto_54633 ) ) ( not ( = ?auto_54629 ?auto_54633 ) ) ( ON-TABLE ?auto_54631 ) ( ON ?auto_54632 ?auto_54631 ) ( not ( = ?auto_54631 ?auto_54632 ) ) ( not ( = ?auto_54631 ?auto_54633 ) ) ( not ( = ?auto_54631 ?auto_54629 ) ) ( not ( = ?auto_54631 ?auto_54628 ) ) ( not ( = ?auto_54632 ?auto_54633 ) ) ( not ( = ?auto_54632 ?auto_54629 ) ) ( not ( = ?auto_54632 ?auto_54628 ) ) ( not ( = ?auto_54627 ?auto_54631 ) ) ( not ( = ?auto_54627 ?auto_54632 ) ) ( ON ?auto_54627 ?auto_54630 ) ( not ( = ?auto_54627 ?auto_54630 ) ) ( not ( = ?auto_54628 ?auto_54630 ) ) ( not ( = ?auto_54629 ?auto_54630 ) ) ( not ( = ?auto_54633 ?auto_54630 ) ) ( not ( = ?auto_54631 ?auto_54630 ) ) ( not ( = ?auto_54632 ?auto_54630 ) ) ( ON ?auto_54628 ?auto_54627 ) ( ON-TABLE ?auto_54630 ) ( ON ?auto_54629 ?auto_54628 ) ( CLEAR ?auto_54629 ) ( HOLDING ?auto_54633 ) ( CLEAR ?auto_54632 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_54631 ?auto_54632 ?auto_54633 )
      ( MAKE-3PILE ?auto_54627 ?auto_54628 ?auto_54629 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54634 - BLOCK
      ?auto_54635 - BLOCK
      ?auto_54636 - BLOCK
    )
    :vars
    (
      ?auto_54639 - BLOCK
      ?auto_54637 - BLOCK
      ?auto_54638 - BLOCK
      ?auto_54640 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54634 ?auto_54635 ) ) ( not ( = ?auto_54634 ?auto_54636 ) ) ( not ( = ?auto_54635 ?auto_54636 ) ) ( not ( = ?auto_54634 ?auto_54639 ) ) ( not ( = ?auto_54635 ?auto_54639 ) ) ( not ( = ?auto_54636 ?auto_54639 ) ) ( ON-TABLE ?auto_54637 ) ( ON ?auto_54638 ?auto_54637 ) ( not ( = ?auto_54637 ?auto_54638 ) ) ( not ( = ?auto_54637 ?auto_54639 ) ) ( not ( = ?auto_54637 ?auto_54636 ) ) ( not ( = ?auto_54637 ?auto_54635 ) ) ( not ( = ?auto_54638 ?auto_54639 ) ) ( not ( = ?auto_54638 ?auto_54636 ) ) ( not ( = ?auto_54638 ?auto_54635 ) ) ( not ( = ?auto_54634 ?auto_54637 ) ) ( not ( = ?auto_54634 ?auto_54638 ) ) ( ON ?auto_54634 ?auto_54640 ) ( not ( = ?auto_54634 ?auto_54640 ) ) ( not ( = ?auto_54635 ?auto_54640 ) ) ( not ( = ?auto_54636 ?auto_54640 ) ) ( not ( = ?auto_54639 ?auto_54640 ) ) ( not ( = ?auto_54637 ?auto_54640 ) ) ( not ( = ?auto_54638 ?auto_54640 ) ) ( ON ?auto_54635 ?auto_54634 ) ( ON-TABLE ?auto_54640 ) ( ON ?auto_54636 ?auto_54635 ) ( CLEAR ?auto_54638 ) ( ON ?auto_54639 ?auto_54636 ) ( CLEAR ?auto_54639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_54640 ?auto_54634 ?auto_54635 ?auto_54636 )
      ( MAKE-3PILE ?auto_54634 ?auto_54635 ?auto_54636 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54641 - BLOCK
      ?auto_54642 - BLOCK
      ?auto_54643 - BLOCK
    )
    :vars
    (
      ?auto_54646 - BLOCK
      ?auto_54645 - BLOCK
      ?auto_54644 - BLOCK
      ?auto_54647 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54641 ?auto_54642 ) ) ( not ( = ?auto_54641 ?auto_54643 ) ) ( not ( = ?auto_54642 ?auto_54643 ) ) ( not ( = ?auto_54641 ?auto_54646 ) ) ( not ( = ?auto_54642 ?auto_54646 ) ) ( not ( = ?auto_54643 ?auto_54646 ) ) ( ON-TABLE ?auto_54645 ) ( not ( = ?auto_54645 ?auto_54644 ) ) ( not ( = ?auto_54645 ?auto_54646 ) ) ( not ( = ?auto_54645 ?auto_54643 ) ) ( not ( = ?auto_54645 ?auto_54642 ) ) ( not ( = ?auto_54644 ?auto_54646 ) ) ( not ( = ?auto_54644 ?auto_54643 ) ) ( not ( = ?auto_54644 ?auto_54642 ) ) ( not ( = ?auto_54641 ?auto_54645 ) ) ( not ( = ?auto_54641 ?auto_54644 ) ) ( ON ?auto_54641 ?auto_54647 ) ( not ( = ?auto_54641 ?auto_54647 ) ) ( not ( = ?auto_54642 ?auto_54647 ) ) ( not ( = ?auto_54643 ?auto_54647 ) ) ( not ( = ?auto_54646 ?auto_54647 ) ) ( not ( = ?auto_54645 ?auto_54647 ) ) ( not ( = ?auto_54644 ?auto_54647 ) ) ( ON ?auto_54642 ?auto_54641 ) ( ON-TABLE ?auto_54647 ) ( ON ?auto_54643 ?auto_54642 ) ( ON ?auto_54646 ?auto_54643 ) ( CLEAR ?auto_54646 ) ( HOLDING ?auto_54644 ) ( CLEAR ?auto_54645 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54645 ?auto_54644 )
      ( MAKE-3PILE ?auto_54641 ?auto_54642 ?auto_54643 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54648 - BLOCK
      ?auto_54649 - BLOCK
      ?auto_54650 - BLOCK
    )
    :vars
    (
      ?auto_54652 - BLOCK
      ?auto_54651 - BLOCK
      ?auto_54654 - BLOCK
      ?auto_54653 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54648 ?auto_54649 ) ) ( not ( = ?auto_54648 ?auto_54650 ) ) ( not ( = ?auto_54649 ?auto_54650 ) ) ( not ( = ?auto_54648 ?auto_54652 ) ) ( not ( = ?auto_54649 ?auto_54652 ) ) ( not ( = ?auto_54650 ?auto_54652 ) ) ( ON-TABLE ?auto_54651 ) ( not ( = ?auto_54651 ?auto_54654 ) ) ( not ( = ?auto_54651 ?auto_54652 ) ) ( not ( = ?auto_54651 ?auto_54650 ) ) ( not ( = ?auto_54651 ?auto_54649 ) ) ( not ( = ?auto_54654 ?auto_54652 ) ) ( not ( = ?auto_54654 ?auto_54650 ) ) ( not ( = ?auto_54654 ?auto_54649 ) ) ( not ( = ?auto_54648 ?auto_54651 ) ) ( not ( = ?auto_54648 ?auto_54654 ) ) ( ON ?auto_54648 ?auto_54653 ) ( not ( = ?auto_54648 ?auto_54653 ) ) ( not ( = ?auto_54649 ?auto_54653 ) ) ( not ( = ?auto_54650 ?auto_54653 ) ) ( not ( = ?auto_54652 ?auto_54653 ) ) ( not ( = ?auto_54651 ?auto_54653 ) ) ( not ( = ?auto_54654 ?auto_54653 ) ) ( ON ?auto_54649 ?auto_54648 ) ( ON-TABLE ?auto_54653 ) ( ON ?auto_54650 ?auto_54649 ) ( ON ?auto_54652 ?auto_54650 ) ( CLEAR ?auto_54651 ) ( ON ?auto_54654 ?auto_54652 ) ( CLEAR ?auto_54654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54653 ?auto_54648 ?auto_54649 ?auto_54650 ?auto_54652 )
      ( MAKE-3PILE ?auto_54648 ?auto_54649 ?auto_54650 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54655 - BLOCK
      ?auto_54656 - BLOCK
      ?auto_54657 - BLOCK
    )
    :vars
    (
      ?auto_54661 - BLOCK
      ?auto_54660 - BLOCK
      ?auto_54659 - BLOCK
      ?auto_54658 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54655 ?auto_54656 ) ) ( not ( = ?auto_54655 ?auto_54657 ) ) ( not ( = ?auto_54656 ?auto_54657 ) ) ( not ( = ?auto_54655 ?auto_54661 ) ) ( not ( = ?auto_54656 ?auto_54661 ) ) ( not ( = ?auto_54657 ?auto_54661 ) ) ( not ( = ?auto_54660 ?auto_54659 ) ) ( not ( = ?auto_54660 ?auto_54661 ) ) ( not ( = ?auto_54660 ?auto_54657 ) ) ( not ( = ?auto_54660 ?auto_54656 ) ) ( not ( = ?auto_54659 ?auto_54661 ) ) ( not ( = ?auto_54659 ?auto_54657 ) ) ( not ( = ?auto_54659 ?auto_54656 ) ) ( not ( = ?auto_54655 ?auto_54660 ) ) ( not ( = ?auto_54655 ?auto_54659 ) ) ( ON ?auto_54655 ?auto_54658 ) ( not ( = ?auto_54655 ?auto_54658 ) ) ( not ( = ?auto_54656 ?auto_54658 ) ) ( not ( = ?auto_54657 ?auto_54658 ) ) ( not ( = ?auto_54661 ?auto_54658 ) ) ( not ( = ?auto_54660 ?auto_54658 ) ) ( not ( = ?auto_54659 ?auto_54658 ) ) ( ON ?auto_54656 ?auto_54655 ) ( ON-TABLE ?auto_54658 ) ( ON ?auto_54657 ?auto_54656 ) ( ON ?auto_54661 ?auto_54657 ) ( ON ?auto_54659 ?auto_54661 ) ( CLEAR ?auto_54659 ) ( HOLDING ?auto_54660 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_54660 )
      ( MAKE-3PILE ?auto_54655 ?auto_54656 ?auto_54657 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54662 - BLOCK
      ?auto_54663 - BLOCK
      ?auto_54664 - BLOCK
    )
    :vars
    (
      ?auto_54665 - BLOCK
      ?auto_54666 - BLOCK
      ?auto_54667 - BLOCK
      ?auto_54668 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54662 ?auto_54663 ) ) ( not ( = ?auto_54662 ?auto_54664 ) ) ( not ( = ?auto_54663 ?auto_54664 ) ) ( not ( = ?auto_54662 ?auto_54665 ) ) ( not ( = ?auto_54663 ?auto_54665 ) ) ( not ( = ?auto_54664 ?auto_54665 ) ) ( not ( = ?auto_54666 ?auto_54667 ) ) ( not ( = ?auto_54666 ?auto_54665 ) ) ( not ( = ?auto_54666 ?auto_54664 ) ) ( not ( = ?auto_54666 ?auto_54663 ) ) ( not ( = ?auto_54667 ?auto_54665 ) ) ( not ( = ?auto_54667 ?auto_54664 ) ) ( not ( = ?auto_54667 ?auto_54663 ) ) ( not ( = ?auto_54662 ?auto_54666 ) ) ( not ( = ?auto_54662 ?auto_54667 ) ) ( ON ?auto_54662 ?auto_54668 ) ( not ( = ?auto_54662 ?auto_54668 ) ) ( not ( = ?auto_54663 ?auto_54668 ) ) ( not ( = ?auto_54664 ?auto_54668 ) ) ( not ( = ?auto_54665 ?auto_54668 ) ) ( not ( = ?auto_54666 ?auto_54668 ) ) ( not ( = ?auto_54667 ?auto_54668 ) ) ( ON ?auto_54663 ?auto_54662 ) ( ON-TABLE ?auto_54668 ) ( ON ?auto_54664 ?auto_54663 ) ( ON ?auto_54665 ?auto_54664 ) ( ON ?auto_54667 ?auto_54665 ) ( ON ?auto_54666 ?auto_54667 ) ( CLEAR ?auto_54666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_54668 ?auto_54662 ?auto_54663 ?auto_54664 ?auto_54665 ?auto_54667 )
      ( MAKE-3PILE ?auto_54662 ?auto_54663 ?auto_54664 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54684 - BLOCK
      ?auto_54685 - BLOCK
    )
    :vars
    (
      ?auto_54688 - BLOCK
      ?auto_54687 - BLOCK
      ?auto_54686 - BLOCK
      ?auto_54689 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54688 ?auto_54685 ) ( ON-TABLE ?auto_54684 ) ( ON ?auto_54685 ?auto_54684 ) ( not ( = ?auto_54684 ?auto_54685 ) ) ( not ( = ?auto_54684 ?auto_54688 ) ) ( not ( = ?auto_54685 ?auto_54688 ) ) ( not ( = ?auto_54684 ?auto_54687 ) ) ( not ( = ?auto_54684 ?auto_54686 ) ) ( not ( = ?auto_54685 ?auto_54687 ) ) ( not ( = ?auto_54685 ?auto_54686 ) ) ( not ( = ?auto_54688 ?auto_54687 ) ) ( not ( = ?auto_54688 ?auto_54686 ) ) ( not ( = ?auto_54687 ?auto_54686 ) ) ( ON ?auto_54687 ?auto_54688 ) ( CLEAR ?auto_54687 ) ( HOLDING ?auto_54686 ) ( CLEAR ?auto_54689 ) ( ON-TABLE ?auto_54689 ) ( not ( = ?auto_54689 ?auto_54686 ) ) ( not ( = ?auto_54684 ?auto_54689 ) ) ( not ( = ?auto_54685 ?auto_54689 ) ) ( not ( = ?auto_54688 ?auto_54689 ) ) ( not ( = ?auto_54687 ?auto_54689 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54689 ?auto_54686 )
      ( MAKE-2PILE ?auto_54684 ?auto_54685 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54690 - BLOCK
      ?auto_54691 - BLOCK
    )
    :vars
    (
      ?auto_54693 - BLOCK
      ?auto_54695 - BLOCK
      ?auto_54694 - BLOCK
      ?auto_54692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54693 ?auto_54691 ) ( ON-TABLE ?auto_54690 ) ( ON ?auto_54691 ?auto_54690 ) ( not ( = ?auto_54690 ?auto_54691 ) ) ( not ( = ?auto_54690 ?auto_54693 ) ) ( not ( = ?auto_54691 ?auto_54693 ) ) ( not ( = ?auto_54690 ?auto_54695 ) ) ( not ( = ?auto_54690 ?auto_54694 ) ) ( not ( = ?auto_54691 ?auto_54695 ) ) ( not ( = ?auto_54691 ?auto_54694 ) ) ( not ( = ?auto_54693 ?auto_54695 ) ) ( not ( = ?auto_54693 ?auto_54694 ) ) ( not ( = ?auto_54695 ?auto_54694 ) ) ( ON ?auto_54695 ?auto_54693 ) ( CLEAR ?auto_54692 ) ( ON-TABLE ?auto_54692 ) ( not ( = ?auto_54692 ?auto_54694 ) ) ( not ( = ?auto_54690 ?auto_54692 ) ) ( not ( = ?auto_54691 ?auto_54692 ) ) ( not ( = ?auto_54693 ?auto_54692 ) ) ( not ( = ?auto_54695 ?auto_54692 ) ) ( ON ?auto_54694 ?auto_54695 ) ( CLEAR ?auto_54694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_54690 ?auto_54691 ?auto_54693 ?auto_54695 )
      ( MAKE-2PILE ?auto_54690 ?auto_54691 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54696 - BLOCK
      ?auto_54697 - BLOCK
    )
    :vars
    (
      ?auto_54700 - BLOCK
      ?auto_54701 - BLOCK
      ?auto_54699 - BLOCK
      ?auto_54698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54700 ?auto_54697 ) ( ON-TABLE ?auto_54696 ) ( ON ?auto_54697 ?auto_54696 ) ( not ( = ?auto_54696 ?auto_54697 ) ) ( not ( = ?auto_54696 ?auto_54700 ) ) ( not ( = ?auto_54697 ?auto_54700 ) ) ( not ( = ?auto_54696 ?auto_54701 ) ) ( not ( = ?auto_54696 ?auto_54699 ) ) ( not ( = ?auto_54697 ?auto_54701 ) ) ( not ( = ?auto_54697 ?auto_54699 ) ) ( not ( = ?auto_54700 ?auto_54701 ) ) ( not ( = ?auto_54700 ?auto_54699 ) ) ( not ( = ?auto_54701 ?auto_54699 ) ) ( ON ?auto_54701 ?auto_54700 ) ( not ( = ?auto_54698 ?auto_54699 ) ) ( not ( = ?auto_54696 ?auto_54698 ) ) ( not ( = ?auto_54697 ?auto_54698 ) ) ( not ( = ?auto_54700 ?auto_54698 ) ) ( not ( = ?auto_54701 ?auto_54698 ) ) ( ON ?auto_54699 ?auto_54701 ) ( CLEAR ?auto_54699 ) ( HOLDING ?auto_54698 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_54698 )
      ( MAKE-2PILE ?auto_54696 ?auto_54697 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54710 - BLOCK
      ?auto_54711 - BLOCK
    )
    :vars
    (
      ?auto_54713 - BLOCK
      ?auto_54715 - BLOCK
      ?auto_54714 - BLOCK
      ?auto_54712 - BLOCK
      ?auto_54716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54713 ?auto_54711 ) ( ON-TABLE ?auto_54710 ) ( ON ?auto_54711 ?auto_54710 ) ( not ( = ?auto_54710 ?auto_54711 ) ) ( not ( = ?auto_54710 ?auto_54713 ) ) ( not ( = ?auto_54711 ?auto_54713 ) ) ( not ( = ?auto_54710 ?auto_54715 ) ) ( not ( = ?auto_54710 ?auto_54714 ) ) ( not ( = ?auto_54711 ?auto_54715 ) ) ( not ( = ?auto_54711 ?auto_54714 ) ) ( not ( = ?auto_54713 ?auto_54715 ) ) ( not ( = ?auto_54713 ?auto_54714 ) ) ( not ( = ?auto_54715 ?auto_54714 ) ) ( ON ?auto_54715 ?auto_54713 ) ( not ( = ?auto_54712 ?auto_54714 ) ) ( not ( = ?auto_54710 ?auto_54712 ) ) ( not ( = ?auto_54711 ?auto_54712 ) ) ( not ( = ?auto_54713 ?auto_54712 ) ) ( not ( = ?auto_54715 ?auto_54712 ) ) ( ON ?auto_54714 ?auto_54715 ) ( CLEAR ?auto_54714 ) ( ON ?auto_54712 ?auto_54716 ) ( CLEAR ?auto_54712 ) ( HAND-EMPTY ) ( not ( = ?auto_54710 ?auto_54716 ) ) ( not ( = ?auto_54711 ?auto_54716 ) ) ( not ( = ?auto_54713 ?auto_54716 ) ) ( not ( = ?auto_54715 ?auto_54716 ) ) ( not ( = ?auto_54714 ?auto_54716 ) ) ( not ( = ?auto_54712 ?auto_54716 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_54712 ?auto_54716 )
      ( MAKE-2PILE ?auto_54710 ?auto_54711 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54717 - BLOCK
      ?auto_54718 - BLOCK
    )
    :vars
    (
      ?auto_54721 - BLOCK
      ?auto_54723 - BLOCK
      ?auto_54719 - BLOCK
      ?auto_54722 - BLOCK
      ?auto_54720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54721 ?auto_54718 ) ( ON-TABLE ?auto_54717 ) ( ON ?auto_54718 ?auto_54717 ) ( not ( = ?auto_54717 ?auto_54718 ) ) ( not ( = ?auto_54717 ?auto_54721 ) ) ( not ( = ?auto_54718 ?auto_54721 ) ) ( not ( = ?auto_54717 ?auto_54723 ) ) ( not ( = ?auto_54717 ?auto_54719 ) ) ( not ( = ?auto_54718 ?auto_54723 ) ) ( not ( = ?auto_54718 ?auto_54719 ) ) ( not ( = ?auto_54721 ?auto_54723 ) ) ( not ( = ?auto_54721 ?auto_54719 ) ) ( not ( = ?auto_54723 ?auto_54719 ) ) ( ON ?auto_54723 ?auto_54721 ) ( not ( = ?auto_54722 ?auto_54719 ) ) ( not ( = ?auto_54717 ?auto_54722 ) ) ( not ( = ?auto_54718 ?auto_54722 ) ) ( not ( = ?auto_54721 ?auto_54722 ) ) ( not ( = ?auto_54723 ?auto_54722 ) ) ( ON ?auto_54722 ?auto_54720 ) ( CLEAR ?auto_54722 ) ( not ( = ?auto_54717 ?auto_54720 ) ) ( not ( = ?auto_54718 ?auto_54720 ) ) ( not ( = ?auto_54721 ?auto_54720 ) ) ( not ( = ?auto_54723 ?auto_54720 ) ) ( not ( = ?auto_54719 ?auto_54720 ) ) ( not ( = ?auto_54722 ?auto_54720 ) ) ( HOLDING ?auto_54719 ) ( CLEAR ?auto_54723 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54717 ?auto_54718 ?auto_54721 ?auto_54723 ?auto_54719 )
      ( MAKE-2PILE ?auto_54717 ?auto_54718 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_54763 - BLOCK
      ?auto_54764 - BLOCK
      ?auto_54765 - BLOCK
      ?auto_54766 - BLOCK
    )
    :vars
    (
      ?auto_54767 - BLOCK
      ?auto_54768 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54763 ) ( ON ?auto_54764 ?auto_54763 ) ( not ( = ?auto_54763 ?auto_54764 ) ) ( not ( = ?auto_54763 ?auto_54765 ) ) ( not ( = ?auto_54763 ?auto_54766 ) ) ( not ( = ?auto_54764 ?auto_54765 ) ) ( not ( = ?auto_54764 ?auto_54766 ) ) ( not ( = ?auto_54765 ?auto_54766 ) ) ( ON ?auto_54766 ?auto_54767 ) ( not ( = ?auto_54763 ?auto_54767 ) ) ( not ( = ?auto_54764 ?auto_54767 ) ) ( not ( = ?auto_54765 ?auto_54767 ) ) ( not ( = ?auto_54766 ?auto_54767 ) ) ( CLEAR ?auto_54764 ) ( ON ?auto_54765 ?auto_54766 ) ( CLEAR ?auto_54765 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_54768 ) ( ON ?auto_54767 ?auto_54768 ) ( not ( = ?auto_54768 ?auto_54767 ) ) ( not ( = ?auto_54768 ?auto_54766 ) ) ( not ( = ?auto_54768 ?auto_54765 ) ) ( not ( = ?auto_54763 ?auto_54768 ) ) ( not ( = ?auto_54764 ?auto_54768 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_54768 ?auto_54767 ?auto_54766 )
      ( MAKE-4PILE ?auto_54763 ?auto_54764 ?auto_54765 ?auto_54766 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_54769 - BLOCK
      ?auto_54770 - BLOCK
      ?auto_54771 - BLOCK
      ?auto_54772 - BLOCK
    )
    :vars
    (
      ?auto_54773 - BLOCK
      ?auto_54774 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54769 ) ( not ( = ?auto_54769 ?auto_54770 ) ) ( not ( = ?auto_54769 ?auto_54771 ) ) ( not ( = ?auto_54769 ?auto_54772 ) ) ( not ( = ?auto_54770 ?auto_54771 ) ) ( not ( = ?auto_54770 ?auto_54772 ) ) ( not ( = ?auto_54771 ?auto_54772 ) ) ( ON ?auto_54772 ?auto_54773 ) ( not ( = ?auto_54769 ?auto_54773 ) ) ( not ( = ?auto_54770 ?auto_54773 ) ) ( not ( = ?auto_54771 ?auto_54773 ) ) ( not ( = ?auto_54772 ?auto_54773 ) ) ( ON ?auto_54771 ?auto_54772 ) ( CLEAR ?auto_54771 ) ( ON-TABLE ?auto_54774 ) ( ON ?auto_54773 ?auto_54774 ) ( not ( = ?auto_54774 ?auto_54773 ) ) ( not ( = ?auto_54774 ?auto_54772 ) ) ( not ( = ?auto_54774 ?auto_54771 ) ) ( not ( = ?auto_54769 ?auto_54774 ) ) ( not ( = ?auto_54770 ?auto_54774 ) ) ( HOLDING ?auto_54770 ) ( CLEAR ?auto_54769 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54769 ?auto_54770 )
      ( MAKE-4PILE ?auto_54769 ?auto_54770 ?auto_54771 ?auto_54772 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_54775 - BLOCK
      ?auto_54776 - BLOCK
      ?auto_54777 - BLOCK
      ?auto_54778 - BLOCK
    )
    :vars
    (
      ?auto_54780 - BLOCK
      ?auto_54779 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54775 ) ( not ( = ?auto_54775 ?auto_54776 ) ) ( not ( = ?auto_54775 ?auto_54777 ) ) ( not ( = ?auto_54775 ?auto_54778 ) ) ( not ( = ?auto_54776 ?auto_54777 ) ) ( not ( = ?auto_54776 ?auto_54778 ) ) ( not ( = ?auto_54777 ?auto_54778 ) ) ( ON ?auto_54778 ?auto_54780 ) ( not ( = ?auto_54775 ?auto_54780 ) ) ( not ( = ?auto_54776 ?auto_54780 ) ) ( not ( = ?auto_54777 ?auto_54780 ) ) ( not ( = ?auto_54778 ?auto_54780 ) ) ( ON ?auto_54777 ?auto_54778 ) ( ON-TABLE ?auto_54779 ) ( ON ?auto_54780 ?auto_54779 ) ( not ( = ?auto_54779 ?auto_54780 ) ) ( not ( = ?auto_54779 ?auto_54778 ) ) ( not ( = ?auto_54779 ?auto_54777 ) ) ( not ( = ?auto_54775 ?auto_54779 ) ) ( not ( = ?auto_54776 ?auto_54779 ) ) ( CLEAR ?auto_54775 ) ( ON ?auto_54776 ?auto_54777 ) ( CLEAR ?auto_54776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_54779 ?auto_54780 ?auto_54778 ?auto_54777 )
      ( MAKE-4PILE ?auto_54775 ?auto_54776 ?auto_54777 ?auto_54778 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_54781 - BLOCK
      ?auto_54782 - BLOCK
      ?auto_54783 - BLOCK
      ?auto_54784 - BLOCK
    )
    :vars
    (
      ?auto_54786 - BLOCK
      ?auto_54785 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54781 ?auto_54782 ) ) ( not ( = ?auto_54781 ?auto_54783 ) ) ( not ( = ?auto_54781 ?auto_54784 ) ) ( not ( = ?auto_54782 ?auto_54783 ) ) ( not ( = ?auto_54782 ?auto_54784 ) ) ( not ( = ?auto_54783 ?auto_54784 ) ) ( ON ?auto_54784 ?auto_54786 ) ( not ( = ?auto_54781 ?auto_54786 ) ) ( not ( = ?auto_54782 ?auto_54786 ) ) ( not ( = ?auto_54783 ?auto_54786 ) ) ( not ( = ?auto_54784 ?auto_54786 ) ) ( ON ?auto_54783 ?auto_54784 ) ( ON-TABLE ?auto_54785 ) ( ON ?auto_54786 ?auto_54785 ) ( not ( = ?auto_54785 ?auto_54786 ) ) ( not ( = ?auto_54785 ?auto_54784 ) ) ( not ( = ?auto_54785 ?auto_54783 ) ) ( not ( = ?auto_54781 ?auto_54785 ) ) ( not ( = ?auto_54782 ?auto_54785 ) ) ( ON ?auto_54782 ?auto_54783 ) ( CLEAR ?auto_54782 ) ( HOLDING ?auto_54781 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_54781 )
      ( MAKE-4PILE ?auto_54781 ?auto_54782 ?auto_54783 ?auto_54784 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_54787 - BLOCK
      ?auto_54788 - BLOCK
      ?auto_54789 - BLOCK
      ?auto_54790 - BLOCK
    )
    :vars
    (
      ?auto_54792 - BLOCK
      ?auto_54791 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54787 ?auto_54788 ) ) ( not ( = ?auto_54787 ?auto_54789 ) ) ( not ( = ?auto_54787 ?auto_54790 ) ) ( not ( = ?auto_54788 ?auto_54789 ) ) ( not ( = ?auto_54788 ?auto_54790 ) ) ( not ( = ?auto_54789 ?auto_54790 ) ) ( ON ?auto_54790 ?auto_54792 ) ( not ( = ?auto_54787 ?auto_54792 ) ) ( not ( = ?auto_54788 ?auto_54792 ) ) ( not ( = ?auto_54789 ?auto_54792 ) ) ( not ( = ?auto_54790 ?auto_54792 ) ) ( ON ?auto_54789 ?auto_54790 ) ( ON-TABLE ?auto_54791 ) ( ON ?auto_54792 ?auto_54791 ) ( not ( = ?auto_54791 ?auto_54792 ) ) ( not ( = ?auto_54791 ?auto_54790 ) ) ( not ( = ?auto_54791 ?auto_54789 ) ) ( not ( = ?auto_54787 ?auto_54791 ) ) ( not ( = ?auto_54788 ?auto_54791 ) ) ( ON ?auto_54788 ?auto_54789 ) ( ON ?auto_54787 ?auto_54788 ) ( CLEAR ?auto_54787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54791 ?auto_54792 ?auto_54790 ?auto_54789 ?auto_54788 )
      ( MAKE-4PILE ?auto_54787 ?auto_54788 ?auto_54789 ?auto_54790 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_54797 - BLOCK
      ?auto_54798 - BLOCK
      ?auto_54799 - BLOCK
      ?auto_54800 - BLOCK
    )
    :vars
    (
      ?auto_54802 - BLOCK
      ?auto_54801 - BLOCK
      ?auto_54803 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54797 ?auto_54798 ) ) ( not ( = ?auto_54797 ?auto_54799 ) ) ( not ( = ?auto_54797 ?auto_54800 ) ) ( not ( = ?auto_54798 ?auto_54799 ) ) ( not ( = ?auto_54798 ?auto_54800 ) ) ( not ( = ?auto_54799 ?auto_54800 ) ) ( ON ?auto_54800 ?auto_54802 ) ( not ( = ?auto_54797 ?auto_54802 ) ) ( not ( = ?auto_54798 ?auto_54802 ) ) ( not ( = ?auto_54799 ?auto_54802 ) ) ( not ( = ?auto_54800 ?auto_54802 ) ) ( ON ?auto_54799 ?auto_54800 ) ( ON-TABLE ?auto_54801 ) ( ON ?auto_54802 ?auto_54801 ) ( not ( = ?auto_54801 ?auto_54802 ) ) ( not ( = ?auto_54801 ?auto_54800 ) ) ( not ( = ?auto_54801 ?auto_54799 ) ) ( not ( = ?auto_54797 ?auto_54801 ) ) ( not ( = ?auto_54798 ?auto_54801 ) ) ( ON ?auto_54798 ?auto_54799 ) ( CLEAR ?auto_54798 ) ( ON ?auto_54797 ?auto_54803 ) ( CLEAR ?auto_54797 ) ( HAND-EMPTY ) ( not ( = ?auto_54797 ?auto_54803 ) ) ( not ( = ?auto_54798 ?auto_54803 ) ) ( not ( = ?auto_54799 ?auto_54803 ) ) ( not ( = ?auto_54800 ?auto_54803 ) ) ( not ( = ?auto_54802 ?auto_54803 ) ) ( not ( = ?auto_54801 ?auto_54803 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_54797 ?auto_54803 )
      ( MAKE-4PILE ?auto_54797 ?auto_54798 ?auto_54799 ?auto_54800 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_54804 - BLOCK
      ?auto_54805 - BLOCK
      ?auto_54806 - BLOCK
      ?auto_54807 - BLOCK
    )
    :vars
    (
      ?auto_54808 - BLOCK
      ?auto_54810 - BLOCK
      ?auto_54809 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54804 ?auto_54805 ) ) ( not ( = ?auto_54804 ?auto_54806 ) ) ( not ( = ?auto_54804 ?auto_54807 ) ) ( not ( = ?auto_54805 ?auto_54806 ) ) ( not ( = ?auto_54805 ?auto_54807 ) ) ( not ( = ?auto_54806 ?auto_54807 ) ) ( ON ?auto_54807 ?auto_54808 ) ( not ( = ?auto_54804 ?auto_54808 ) ) ( not ( = ?auto_54805 ?auto_54808 ) ) ( not ( = ?auto_54806 ?auto_54808 ) ) ( not ( = ?auto_54807 ?auto_54808 ) ) ( ON ?auto_54806 ?auto_54807 ) ( ON-TABLE ?auto_54810 ) ( ON ?auto_54808 ?auto_54810 ) ( not ( = ?auto_54810 ?auto_54808 ) ) ( not ( = ?auto_54810 ?auto_54807 ) ) ( not ( = ?auto_54810 ?auto_54806 ) ) ( not ( = ?auto_54804 ?auto_54810 ) ) ( not ( = ?auto_54805 ?auto_54810 ) ) ( ON ?auto_54804 ?auto_54809 ) ( CLEAR ?auto_54804 ) ( not ( = ?auto_54804 ?auto_54809 ) ) ( not ( = ?auto_54805 ?auto_54809 ) ) ( not ( = ?auto_54806 ?auto_54809 ) ) ( not ( = ?auto_54807 ?auto_54809 ) ) ( not ( = ?auto_54808 ?auto_54809 ) ) ( not ( = ?auto_54810 ?auto_54809 ) ) ( HOLDING ?auto_54805 ) ( CLEAR ?auto_54806 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54810 ?auto_54808 ?auto_54807 ?auto_54806 ?auto_54805 )
      ( MAKE-4PILE ?auto_54804 ?auto_54805 ?auto_54806 ?auto_54807 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_54811 - BLOCK
      ?auto_54812 - BLOCK
      ?auto_54813 - BLOCK
      ?auto_54814 - BLOCK
    )
    :vars
    (
      ?auto_54815 - BLOCK
      ?auto_54816 - BLOCK
      ?auto_54817 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54811 ?auto_54812 ) ) ( not ( = ?auto_54811 ?auto_54813 ) ) ( not ( = ?auto_54811 ?auto_54814 ) ) ( not ( = ?auto_54812 ?auto_54813 ) ) ( not ( = ?auto_54812 ?auto_54814 ) ) ( not ( = ?auto_54813 ?auto_54814 ) ) ( ON ?auto_54814 ?auto_54815 ) ( not ( = ?auto_54811 ?auto_54815 ) ) ( not ( = ?auto_54812 ?auto_54815 ) ) ( not ( = ?auto_54813 ?auto_54815 ) ) ( not ( = ?auto_54814 ?auto_54815 ) ) ( ON ?auto_54813 ?auto_54814 ) ( ON-TABLE ?auto_54816 ) ( ON ?auto_54815 ?auto_54816 ) ( not ( = ?auto_54816 ?auto_54815 ) ) ( not ( = ?auto_54816 ?auto_54814 ) ) ( not ( = ?auto_54816 ?auto_54813 ) ) ( not ( = ?auto_54811 ?auto_54816 ) ) ( not ( = ?auto_54812 ?auto_54816 ) ) ( ON ?auto_54811 ?auto_54817 ) ( not ( = ?auto_54811 ?auto_54817 ) ) ( not ( = ?auto_54812 ?auto_54817 ) ) ( not ( = ?auto_54813 ?auto_54817 ) ) ( not ( = ?auto_54814 ?auto_54817 ) ) ( not ( = ?auto_54815 ?auto_54817 ) ) ( not ( = ?auto_54816 ?auto_54817 ) ) ( CLEAR ?auto_54813 ) ( ON ?auto_54812 ?auto_54811 ) ( CLEAR ?auto_54812 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_54817 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54817 ?auto_54811 )
      ( MAKE-4PILE ?auto_54811 ?auto_54812 ?auto_54813 ?auto_54814 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_54818 - BLOCK
      ?auto_54819 - BLOCK
      ?auto_54820 - BLOCK
      ?auto_54821 - BLOCK
    )
    :vars
    (
      ?auto_54823 - BLOCK
      ?auto_54824 - BLOCK
      ?auto_54822 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54818 ?auto_54819 ) ) ( not ( = ?auto_54818 ?auto_54820 ) ) ( not ( = ?auto_54818 ?auto_54821 ) ) ( not ( = ?auto_54819 ?auto_54820 ) ) ( not ( = ?auto_54819 ?auto_54821 ) ) ( not ( = ?auto_54820 ?auto_54821 ) ) ( ON ?auto_54821 ?auto_54823 ) ( not ( = ?auto_54818 ?auto_54823 ) ) ( not ( = ?auto_54819 ?auto_54823 ) ) ( not ( = ?auto_54820 ?auto_54823 ) ) ( not ( = ?auto_54821 ?auto_54823 ) ) ( ON-TABLE ?auto_54824 ) ( ON ?auto_54823 ?auto_54824 ) ( not ( = ?auto_54824 ?auto_54823 ) ) ( not ( = ?auto_54824 ?auto_54821 ) ) ( not ( = ?auto_54824 ?auto_54820 ) ) ( not ( = ?auto_54818 ?auto_54824 ) ) ( not ( = ?auto_54819 ?auto_54824 ) ) ( ON ?auto_54818 ?auto_54822 ) ( not ( = ?auto_54818 ?auto_54822 ) ) ( not ( = ?auto_54819 ?auto_54822 ) ) ( not ( = ?auto_54820 ?auto_54822 ) ) ( not ( = ?auto_54821 ?auto_54822 ) ) ( not ( = ?auto_54823 ?auto_54822 ) ) ( not ( = ?auto_54824 ?auto_54822 ) ) ( ON ?auto_54819 ?auto_54818 ) ( CLEAR ?auto_54819 ) ( ON-TABLE ?auto_54822 ) ( HOLDING ?auto_54820 ) ( CLEAR ?auto_54821 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_54824 ?auto_54823 ?auto_54821 ?auto_54820 )
      ( MAKE-4PILE ?auto_54818 ?auto_54819 ?auto_54820 ?auto_54821 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_54825 - BLOCK
      ?auto_54826 - BLOCK
      ?auto_54827 - BLOCK
      ?auto_54828 - BLOCK
    )
    :vars
    (
      ?auto_54829 - BLOCK
      ?auto_54831 - BLOCK
      ?auto_54830 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54825 ?auto_54826 ) ) ( not ( = ?auto_54825 ?auto_54827 ) ) ( not ( = ?auto_54825 ?auto_54828 ) ) ( not ( = ?auto_54826 ?auto_54827 ) ) ( not ( = ?auto_54826 ?auto_54828 ) ) ( not ( = ?auto_54827 ?auto_54828 ) ) ( ON ?auto_54828 ?auto_54829 ) ( not ( = ?auto_54825 ?auto_54829 ) ) ( not ( = ?auto_54826 ?auto_54829 ) ) ( not ( = ?auto_54827 ?auto_54829 ) ) ( not ( = ?auto_54828 ?auto_54829 ) ) ( ON-TABLE ?auto_54831 ) ( ON ?auto_54829 ?auto_54831 ) ( not ( = ?auto_54831 ?auto_54829 ) ) ( not ( = ?auto_54831 ?auto_54828 ) ) ( not ( = ?auto_54831 ?auto_54827 ) ) ( not ( = ?auto_54825 ?auto_54831 ) ) ( not ( = ?auto_54826 ?auto_54831 ) ) ( ON ?auto_54825 ?auto_54830 ) ( not ( = ?auto_54825 ?auto_54830 ) ) ( not ( = ?auto_54826 ?auto_54830 ) ) ( not ( = ?auto_54827 ?auto_54830 ) ) ( not ( = ?auto_54828 ?auto_54830 ) ) ( not ( = ?auto_54829 ?auto_54830 ) ) ( not ( = ?auto_54831 ?auto_54830 ) ) ( ON ?auto_54826 ?auto_54825 ) ( ON-TABLE ?auto_54830 ) ( CLEAR ?auto_54828 ) ( ON ?auto_54827 ?auto_54826 ) ( CLEAR ?auto_54827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_54830 ?auto_54825 ?auto_54826 )
      ( MAKE-4PILE ?auto_54825 ?auto_54826 ?auto_54827 ?auto_54828 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_54832 - BLOCK
      ?auto_54833 - BLOCK
      ?auto_54834 - BLOCK
      ?auto_54835 - BLOCK
    )
    :vars
    (
      ?auto_54836 - BLOCK
      ?auto_54838 - BLOCK
      ?auto_54837 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54832 ?auto_54833 ) ) ( not ( = ?auto_54832 ?auto_54834 ) ) ( not ( = ?auto_54832 ?auto_54835 ) ) ( not ( = ?auto_54833 ?auto_54834 ) ) ( not ( = ?auto_54833 ?auto_54835 ) ) ( not ( = ?auto_54834 ?auto_54835 ) ) ( not ( = ?auto_54832 ?auto_54836 ) ) ( not ( = ?auto_54833 ?auto_54836 ) ) ( not ( = ?auto_54834 ?auto_54836 ) ) ( not ( = ?auto_54835 ?auto_54836 ) ) ( ON-TABLE ?auto_54838 ) ( ON ?auto_54836 ?auto_54838 ) ( not ( = ?auto_54838 ?auto_54836 ) ) ( not ( = ?auto_54838 ?auto_54835 ) ) ( not ( = ?auto_54838 ?auto_54834 ) ) ( not ( = ?auto_54832 ?auto_54838 ) ) ( not ( = ?auto_54833 ?auto_54838 ) ) ( ON ?auto_54832 ?auto_54837 ) ( not ( = ?auto_54832 ?auto_54837 ) ) ( not ( = ?auto_54833 ?auto_54837 ) ) ( not ( = ?auto_54834 ?auto_54837 ) ) ( not ( = ?auto_54835 ?auto_54837 ) ) ( not ( = ?auto_54836 ?auto_54837 ) ) ( not ( = ?auto_54838 ?auto_54837 ) ) ( ON ?auto_54833 ?auto_54832 ) ( ON-TABLE ?auto_54837 ) ( ON ?auto_54834 ?auto_54833 ) ( CLEAR ?auto_54834 ) ( HOLDING ?auto_54835 ) ( CLEAR ?auto_54836 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_54838 ?auto_54836 ?auto_54835 )
      ( MAKE-4PILE ?auto_54832 ?auto_54833 ?auto_54834 ?auto_54835 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_54839 - BLOCK
      ?auto_54840 - BLOCK
      ?auto_54841 - BLOCK
      ?auto_54842 - BLOCK
    )
    :vars
    (
      ?auto_54843 - BLOCK
      ?auto_54844 - BLOCK
      ?auto_54845 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54839 ?auto_54840 ) ) ( not ( = ?auto_54839 ?auto_54841 ) ) ( not ( = ?auto_54839 ?auto_54842 ) ) ( not ( = ?auto_54840 ?auto_54841 ) ) ( not ( = ?auto_54840 ?auto_54842 ) ) ( not ( = ?auto_54841 ?auto_54842 ) ) ( not ( = ?auto_54839 ?auto_54843 ) ) ( not ( = ?auto_54840 ?auto_54843 ) ) ( not ( = ?auto_54841 ?auto_54843 ) ) ( not ( = ?auto_54842 ?auto_54843 ) ) ( ON-TABLE ?auto_54844 ) ( ON ?auto_54843 ?auto_54844 ) ( not ( = ?auto_54844 ?auto_54843 ) ) ( not ( = ?auto_54844 ?auto_54842 ) ) ( not ( = ?auto_54844 ?auto_54841 ) ) ( not ( = ?auto_54839 ?auto_54844 ) ) ( not ( = ?auto_54840 ?auto_54844 ) ) ( ON ?auto_54839 ?auto_54845 ) ( not ( = ?auto_54839 ?auto_54845 ) ) ( not ( = ?auto_54840 ?auto_54845 ) ) ( not ( = ?auto_54841 ?auto_54845 ) ) ( not ( = ?auto_54842 ?auto_54845 ) ) ( not ( = ?auto_54843 ?auto_54845 ) ) ( not ( = ?auto_54844 ?auto_54845 ) ) ( ON ?auto_54840 ?auto_54839 ) ( ON-TABLE ?auto_54845 ) ( ON ?auto_54841 ?auto_54840 ) ( CLEAR ?auto_54843 ) ( ON ?auto_54842 ?auto_54841 ) ( CLEAR ?auto_54842 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_54845 ?auto_54839 ?auto_54840 ?auto_54841 )
      ( MAKE-4PILE ?auto_54839 ?auto_54840 ?auto_54841 ?auto_54842 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_54846 - BLOCK
      ?auto_54847 - BLOCK
      ?auto_54848 - BLOCK
      ?auto_54849 - BLOCK
    )
    :vars
    (
      ?auto_54852 - BLOCK
      ?auto_54851 - BLOCK
      ?auto_54850 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54846 ?auto_54847 ) ) ( not ( = ?auto_54846 ?auto_54848 ) ) ( not ( = ?auto_54846 ?auto_54849 ) ) ( not ( = ?auto_54847 ?auto_54848 ) ) ( not ( = ?auto_54847 ?auto_54849 ) ) ( not ( = ?auto_54848 ?auto_54849 ) ) ( not ( = ?auto_54846 ?auto_54852 ) ) ( not ( = ?auto_54847 ?auto_54852 ) ) ( not ( = ?auto_54848 ?auto_54852 ) ) ( not ( = ?auto_54849 ?auto_54852 ) ) ( ON-TABLE ?auto_54851 ) ( not ( = ?auto_54851 ?auto_54852 ) ) ( not ( = ?auto_54851 ?auto_54849 ) ) ( not ( = ?auto_54851 ?auto_54848 ) ) ( not ( = ?auto_54846 ?auto_54851 ) ) ( not ( = ?auto_54847 ?auto_54851 ) ) ( ON ?auto_54846 ?auto_54850 ) ( not ( = ?auto_54846 ?auto_54850 ) ) ( not ( = ?auto_54847 ?auto_54850 ) ) ( not ( = ?auto_54848 ?auto_54850 ) ) ( not ( = ?auto_54849 ?auto_54850 ) ) ( not ( = ?auto_54852 ?auto_54850 ) ) ( not ( = ?auto_54851 ?auto_54850 ) ) ( ON ?auto_54847 ?auto_54846 ) ( ON-TABLE ?auto_54850 ) ( ON ?auto_54848 ?auto_54847 ) ( ON ?auto_54849 ?auto_54848 ) ( CLEAR ?auto_54849 ) ( HOLDING ?auto_54852 ) ( CLEAR ?auto_54851 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54851 ?auto_54852 )
      ( MAKE-4PILE ?auto_54846 ?auto_54847 ?auto_54848 ?auto_54849 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_54853 - BLOCK
      ?auto_54854 - BLOCK
      ?auto_54855 - BLOCK
      ?auto_54856 - BLOCK
    )
    :vars
    (
      ?auto_54858 - BLOCK
      ?auto_54859 - BLOCK
      ?auto_54857 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54853 ?auto_54854 ) ) ( not ( = ?auto_54853 ?auto_54855 ) ) ( not ( = ?auto_54853 ?auto_54856 ) ) ( not ( = ?auto_54854 ?auto_54855 ) ) ( not ( = ?auto_54854 ?auto_54856 ) ) ( not ( = ?auto_54855 ?auto_54856 ) ) ( not ( = ?auto_54853 ?auto_54858 ) ) ( not ( = ?auto_54854 ?auto_54858 ) ) ( not ( = ?auto_54855 ?auto_54858 ) ) ( not ( = ?auto_54856 ?auto_54858 ) ) ( ON-TABLE ?auto_54859 ) ( not ( = ?auto_54859 ?auto_54858 ) ) ( not ( = ?auto_54859 ?auto_54856 ) ) ( not ( = ?auto_54859 ?auto_54855 ) ) ( not ( = ?auto_54853 ?auto_54859 ) ) ( not ( = ?auto_54854 ?auto_54859 ) ) ( ON ?auto_54853 ?auto_54857 ) ( not ( = ?auto_54853 ?auto_54857 ) ) ( not ( = ?auto_54854 ?auto_54857 ) ) ( not ( = ?auto_54855 ?auto_54857 ) ) ( not ( = ?auto_54856 ?auto_54857 ) ) ( not ( = ?auto_54858 ?auto_54857 ) ) ( not ( = ?auto_54859 ?auto_54857 ) ) ( ON ?auto_54854 ?auto_54853 ) ( ON-TABLE ?auto_54857 ) ( ON ?auto_54855 ?auto_54854 ) ( ON ?auto_54856 ?auto_54855 ) ( CLEAR ?auto_54859 ) ( ON ?auto_54858 ?auto_54856 ) ( CLEAR ?auto_54858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54857 ?auto_54853 ?auto_54854 ?auto_54855 ?auto_54856 )
      ( MAKE-4PILE ?auto_54853 ?auto_54854 ?auto_54855 ?auto_54856 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_54860 - BLOCK
      ?auto_54861 - BLOCK
      ?auto_54862 - BLOCK
      ?auto_54863 - BLOCK
    )
    :vars
    (
      ?auto_54864 - BLOCK
      ?auto_54866 - BLOCK
      ?auto_54865 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54860 ?auto_54861 ) ) ( not ( = ?auto_54860 ?auto_54862 ) ) ( not ( = ?auto_54860 ?auto_54863 ) ) ( not ( = ?auto_54861 ?auto_54862 ) ) ( not ( = ?auto_54861 ?auto_54863 ) ) ( not ( = ?auto_54862 ?auto_54863 ) ) ( not ( = ?auto_54860 ?auto_54864 ) ) ( not ( = ?auto_54861 ?auto_54864 ) ) ( not ( = ?auto_54862 ?auto_54864 ) ) ( not ( = ?auto_54863 ?auto_54864 ) ) ( not ( = ?auto_54866 ?auto_54864 ) ) ( not ( = ?auto_54866 ?auto_54863 ) ) ( not ( = ?auto_54866 ?auto_54862 ) ) ( not ( = ?auto_54860 ?auto_54866 ) ) ( not ( = ?auto_54861 ?auto_54866 ) ) ( ON ?auto_54860 ?auto_54865 ) ( not ( = ?auto_54860 ?auto_54865 ) ) ( not ( = ?auto_54861 ?auto_54865 ) ) ( not ( = ?auto_54862 ?auto_54865 ) ) ( not ( = ?auto_54863 ?auto_54865 ) ) ( not ( = ?auto_54864 ?auto_54865 ) ) ( not ( = ?auto_54866 ?auto_54865 ) ) ( ON ?auto_54861 ?auto_54860 ) ( ON-TABLE ?auto_54865 ) ( ON ?auto_54862 ?auto_54861 ) ( ON ?auto_54863 ?auto_54862 ) ( ON ?auto_54864 ?auto_54863 ) ( CLEAR ?auto_54864 ) ( HOLDING ?auto_54866 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_54866 )
      ( MAKE-4PILE ?auto_54860 ?auto_54861 ?auto_54862 ?auto_54863 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_54867 - BLOCK
      ?auto_54868 - BLOCK
      ?auto_54869 - BLOCK
      ?auto_54870 - BLOCK
    )
    :vars
    (
      ?auto_54872 - BLOCK
      ?auto_54873 - BLOCK
      ?auto_54871 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54867 ?auto_54868 ) ) ( not ( = ?auto_54867 ?auto_54869 ) ) ( not ( = ?auto_54867 ?auto_54870 ) ) ( not ( = ?auto_54868 ?auto_54869 ) ) ( not ( = ?auto_54868 ?auto_54870 ) ) ( not ( = ?auto_54869 ?auto_54870 ) ) ( not ( = ?auto_54867 ?auto_54872 ) ) ( not ( = ?auto_54868 ?auto_54872 ) ) ( not ( = ?auto_54869 ?auto_54872 ) ) ( not ( = ?auto_54870 ?auto_54872 ) ) ( not ( = ?auto_54873 ?auto_54872 ) ) ( not ( = ?auto_54873 ?auto_54870 ) ) ( not ( = ?auto_54873 ?auto_54869 ) ) ( not ( = ?auto_54867 ?auto_54873 ) ) ( not ( = ?auto_54868 ?auto_54873 ) ) ( ON ?auto_54867 ?auto_54871 ) ( not ( = ?auto_54867 ?auto_54871 ) ) ( not ( = ?auto_54868 ?auto_54871 ) ) ( not ( = ?auto_54869 ?auto_54871 ) ) ( not ( = ?auto_54870 ?auto_54871 ) ) ( not ( = ?auto_54872 ?auto_54871 ) ) ( not ( = ?auto_54873 ?auto_54871 ) ) ( ON ?auto_54868 ?auto_54867 ) ( ON-TABLE ?auto_54871 ) ( ON ?auto_54869 ?auto_54868 ) ( ON ?auto_54870 ?auto_54869 ) ( ON ?auto_54872 ?auto_54870 ) ( ON ?auto_54873 ?auto_54872 ) ( CLEAR ?auto_54873 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_54871 ?auto_54867 ?auto_54868 ?auto_54869 ?auto_54870 ?auto_54872 )
      ( MAKE-4PILE ?auto_54867 ?auto_54868 ?auto_54869 ?auto_54870 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54885 - BLOCK
    )
    :vars
    (
      ?auto_54887 - BLOCK
      ?auto_54888 - BLOCK
      ?auto_54886 - BLOCK
      ?auto_54890 - BLOCK
      ?auto_54889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54887 ?auto_54885 ) ( ON-TABLE ?auto_54885 ) ( not ( = ?auto_54885 ?auto_54887 ) ) ( not ( = ?auto_54885 ?auto_54888 ) ) ( not ( = ?auto_54885 ?auto_54886 ) ) ( not ( = ?auto_54887 ?auto_54888 ) ) ( not ( = ?auto_54887 ?auto_54886 ) ) ( not ( = ?auto_54888 ?auto_54886 ) ) ( ON ?auto_54888 ?auto_54887 ) ( CLEAR ?auto_54888 ) ( HOLDING ?auto_54886 ) ( CLEAR ?auto_54890 ) ( ON-TABLE ?auto_54889 ) ( ON ?auto_54890 ?auto_54889 ) ( not ( = ?auto_54889 ?auto_54890 ) ) ( not ( = ?auto_54889 ?auto_54886 ) ) ( not ( = ?auto_54890 ?auto_54886 ) ) ( not ( = ?auto_54885 ?auto_54890 ) ) ( not ( = ?auto_54885 ?auto_54889 ) ) ( not ( = ?auto_54887 ?auto_54890 ) ) ( not ( = ?auto_54887 ?auto_54889 ) ) ( not ( = ?auto_54888 ?auto_54890 ) ) ( not ( = ?auto_54888 ?auto_54889 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_54889 ?auto_54890 ?auto_54886 )
      ( MAKE-1PILE ?auto_54885 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54891 - BLOCK
    )
    :vars
    (
      ?auto_54896 - BLOCK
      ?auto_54893 - BLOCK
      ?auto_54892 - BLOCK
      ?auto_54895 - BLOCK
      ?auto_54894 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54896 ?auto_54891 ) ( ON-TABLE ?auto_54891 ) ( not ( = ?auto_54891 ?auto_54896 ) ) ( not ( = ?auto_54891 ?auto_54893 ) ) ( not ( = ?auto_54891 ?auto_54892 ) ) ( not ( = ?auto_54896 ?auto_54893 ) ) ( not ( = ?auto_54896 ?auto_54892 ) ) ( not ( = ?auto_54893 ?auto_54892 ) ) ( ON ?auto_54893 ?auto_54896 ) ( CLEAR ?auto_54895 ) ( ON-TABLE ?auto_54894 ) ( ON ?auto_54895 ?auto_54894 ) ( not ( = ?auto_54894 ?auto_54895 ) ) ( not ( = ?auto_54894 ?auto_54892 ) ) ( not ( = ?auto_54895 ?auto_54892 ) ) ( not ( = ?auto_54891 ?auto_54895 ) ) ( not ( = ?auto_54891 ?auto_54894 ) ) ( not ( = ?auto_54896 ?auto_54895 ) ) ( not ( = ?auto_54896 ?auto_54894 ) ) ( not ( = ?auto_54893 ?auto_54895 ) ) ( not ( = ?auto_54893 ?auto_54894 ) ) ( ON ?auto_54892 ?auto_54893 ) ( CLEAR ?auto_54892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_54891 ?auto_54896 ?auto_54893 )
      ( MAKE-1PILE ?auto_54891 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54897 - BLOCK
    )
    :vars
    (
      ?auto_54898 - BLOCK
      ?auto_54901 - BLOCK
      ?auto_54899 - BLOCK
      ?auto_54902 - BLOCK
      ?auto_54900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54898 ?auto_54897 ) ( ON-TABLE ?auto_54897 ) ( not ( = ?auto_54897 ?auto_54898 ) ) ( not ( = ?auto_54897 ?auto_54901 ) ) ( not ( = ?auto_54897 ?auto_54899 ) ) ( not ( = ?auto_54898 ?auto_54901 ) ) ( not ( = ?auto_54898 ?auto_54899 ) ) ( not ( = ?auto_54901 ?auto_54899 ) ) ( ON ?auto_54901 ?auto_54898 ) ( ON-TABLE ?auto_54902 ) ( not ( = ?auto_54902 ?auto_54900 ) ) ( not ( = ?auto_54902 ?auto_54899 ) ) ( not ( = ?auto_54900 ?auto_54899 ) ) ( not ( = ?auto_54897 ?auto_54900 ) ) ( not ( = ?auto_54897 ?auto_54902 ) ) ( not ( = ?auto_54898 ?auto_54900 ) ) ( not ( = ?auto_54898 ?auto_54902 ) ) ( not ( = ?auto_54901 ?auto_54900 ) ) ( not ( = ?auto_54901 ?auto_54902 ) ) ( ON ?auto_54899 ?auto_54901 ) ( CLEAR ?auto_54899 ) ( HOLDING ?auto_54900 ) ( CLEAR ?auto_54902 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54902 ?auto_54900 )
      ( MAKE-1PILE ?auto_54897 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54903 - BLOCK
    )
    :vars
    (
      ?auto_54908 - BLOCK
      ?auto_54905 - BLOCK
      ?auto_54904 - BLOCK
      ?auto_54907 - BLOCK
      ?auto_54906 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54908 ?auto_54903 ) ( ON-TABLE ?auto_54903 ) ( not ( = ?auto_54903 ?auto_54908 ) ) ( not ( = ?auto_54903 ?auto_54905 ) ) ( not ( = ?auto_54903 ?auto_54904 ) ) ( not ( = ?auto_54908 ?auto_54905 ) ) ( not ( = ?auto_54908 ?auto_54904 ) ) ( not ( = ?auto_54905 ?auto_54904 ) ) ( ON ?auto_54905 ?auto_54908 ) ( ON-TABLE ?auto_54907 ) ( not ( = ?auto_54907 ?auto_54906 ) ) ( not ( = ?auto_54907 ?auto_54904 ) ) ( not ( = ?auto_54906 ?auto_54904 ) ) ( not ( = ?auto_54903 ?auto_54906 ) ) ( not ( = ?auto_54903 ?auto_54907 ) ) ( not ( = ?auto_54908 ?auto_54906 ) ) ( not ( = ?auto_54908 ?auto_54907 ) ) ( not ( = ?auto_54905 ?auto_54906 ) ) ( not ( = ?auto_54905 ?auto_54907 ) ) ( ON ?auto_54904 ?auto_54905 ) ( CLEAR ?auto_54907 ) ( ON ?auto_54906 ?auto_54904 ) ( CLEAR ?auto_54906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_54903 ?auto_54908 ?auto_54905 ?auto_54904 )
      ( MAKE-1PILE ?auto_54903 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54909 - BLOCK
    )
    :vars
    (
      ?auto_54912 - BLOCK
      ?auto_54911 - BLOCK
      ?auto_54913 - BLOCK
      ?auto_54914 - BLOCK
      ?auto_54910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54912 ?auto_54909 ) ( ON-TABLE ?auto_54909 ) ( not ( = ?auto_54909 ?auto_54912 ) ) ( not ( = ?auto_54909 ?auto_54911 ) ) ( not ( = ?auto_54909 ?auto_54913 ) ) ( not ( = ?auto_54912 ?auto_54911 ) ) ( not ( = ?auto_54912 ?auto_54913 ) ) ( not ( = ?auto_54911 ?auto_54913 ) ) ( ON ?auto_54911 ?auto_54912 ) ( not ( = ?auto_54914 ?auto_54910 ) ) ( not ( = ?auto_54914 ?auto_54913 ) ) ( not ( = ?auto_54910 ?auto_54913 ) ) ( not ( = ?auto_54909 ?auto_54910 ) ) ( not ( = ?auto_54909 ?auto_54914 ) ) ( not ( = ?auto_54912 ?auto_54910 ) ) ( not ( = ?auto_54912 ?auto_54914 ) ) ( not ( = ?auto_54911 ?auto_54910 ) ) ( not ( = ?auto_54911 ?auto_54914 ) ) ( ON ?auto_54913 ?auto_54911 ) ( ON ?auto_54910 ?auto_54913 ) ( CLEAR ?auto_54910 ) ( HOLDING ?auto_54914 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_54914 )
      ( MAKE-1PILE ?auto_54909 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54922 - BLOCK
    )
    :vars
    (
      ?auto_54926 - BLOCK
      ?auto_54923 - BLOCK
      ?auto_54924 - BLOCK
      ?auto_54925 - BLOCK
      ?auto_54927 - BLOCK
      ?auto_54928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54926 ?auto_54922 ) ( ON-TABLE ?auto_54922 ) ( not ( = ?auto_54922 ?auto_54926 ) ) ( not ( = ?auto_54922 ?auto_54923 ) ) ( not ( = ?auto_54922 ?auto_54924 ) ) ( not ( = ?auto_54926 ?auto_54923 ) ) ( not ( = ?auto_54926 ?auto_54924 ) ) ( not ( = ?auto_54923 ?auto_54924 ) ) ( ON ?auto_54923 ?auto_54926 ) ( not ( = ?auto_54925 ?auto_54927 ) ) ( not ( = ?auto_54925 ?auto_54924 ) ) ( not ( = ?auto_54927 ?auto_54924 ) ) ( not ( = ?auto_54922 ?auto_54927 ) ) ( not ( = ?auto_54922 ?auto_54925 ) ) ( not ( = ?auto_54926 ?auto_54927 ) ) ( not ( = ?auto_54926 ?auto_54925 ) ) ( not ( = ?auto_54923 ?auto_54927 ) ) ( not ( = ?auto_54923 ?auto_54925 ) ) ( ON ?auto_54924 ?auto_54923 ) ( ON ?auto_54927 ?auto_54924 ) ( CLEAR ?auto_54927 ) ( ON ?auto_54925 ?auto_54928 ) ( CLEAR ?auto_54925 ) ( HAND-EMPTY ) ( not ( = ?auto_54922 ?auto_54928 ) ) ( not ( = ?auto_54926 ?auto_54928 ) ) ( not ( = ?auto_54923 ?auto_54928 ) ) ( not ( = ?auto_54924 ?auto_54928 ) ) ( not ( = ?auto_54925 ?auto_54928 ) ) ( not ( = ?auto_54927 ?auto_54928 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_54925 ?auto_54928 )
      ( MAKE-1PILE ?auto_54922 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54929 - BLOCK
    )
    :vars
    (
      ?auto_54934 - BLOCK
      ?auto_54933 - BLOCK
      ?auto_54935 - BLOCK
      ?auto_54931 - BLOCK
      ?auto_54932 - BLOCK
      ?auto_54930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54934 ?auto_54929 ) ( ON-TABLE ?auto_54929 ) ( not ( = ?auto_54929 ?auto_54934 ) ) ( not ( = ?auto_54929 ?auto_54933 ) ) ( not ( = ?auto_54929 ?auto_54935 ) ) ( not ( = ?auto_54934 ?auto_54933 ) ) ( not ( = ?auto_54934 ?auto_54935 ) ) ( not ( = ?auto_54933 ?auto_54935 ) ) ( ON ?auto_54933 ?auto_54934 ) ( not ( = ?auto_54931 ?auto_54932 ) ) ( not ( = ?auto_54931 ?auto_54935 ) ) ( not ( = ?auto_54932 ?auto_54935 ) ) ( not ( = ?auto_54929 ?auto_54932 ) ) ( not ( = ?auto_54929 ?auto_54931 ) ) ( not ( = ?auto_54934 ?auto_54932 ) ) ( not ( = ?auto_54934 ?auto_54931 ) ) ( not ( = ?auto_54933 ?auto_54932 ) ) ( not ( = ?auto_54933 ?auto_54931 ) ) ( ON ?auto_54935 ?auto_54933 ) ( ON ?auto_54931 ?auto_54930 ) ( CLEAR ?auto_54931 ) ( not ( = ?auto_54929 ?auto_54930 ) ) ( not ( = ?auto_54934 ?auto_54930 ) ) ( not ( = ?auto_54933 ?auto_54930 ) ) ( not ( = ?auto_54935 ?auto_54930 ) ) ( not ( = ?auto_54931 ?auto_54930 ) ) ( not ( = ?auto_54932 ?auto_54930 ) ) ( HOLDING ?auto_54932 ) ( CLEAR ?auto_54935 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54929 ?auto_54934 ?auto_54933 ?auto_54935 ?auto_54932 )
      ( MAKE-1PILE ?auto_54929 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54936 - BLOCK
    )
    :vars
    (
      ?auto_54941 - BLOCK
      ?auto_54939 - BLOCK
      ?auto_54937 - BLOCK
      ?auto_54938 - BLOCK
      ?auto_54942 - BLOCK
      ?auto_54940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54941 ?auto_54936 ) ( ON-TABLE ?auto_54936 ) ( not ( = ?auto_54936 ?auto_54941 ) ) ( not ( = ?auto_54936 ?auto_54939 ) ) ( not ( = ?auto_54936 ?auto_54937 ) ) ( not ( = ?auto_54941 ?auto_54939 ) ) ( not ( = ?auto_54941 ?auto_54937 ) ) ( not ( = ?auto_54939 ?auto_54937 ) ) ( ON ?auto_54939 ?auto_54941 ) ( not ( = ?auto_54938 ?auto_54942 ) ) ( not ( = ?auto_54938 ?auto_54937 ) ) ( not ( = ?auto_54942 ?auto_54937 ) ) ( not ( = ?auto_54936 ?auto_54942 ) ) ( not ( = ?auto_54936 ?auto_54938 ) ) ( not ( = ?auto_54941 ?auto_54942 ) ) ( not ( = ?auto_54941 ?auto_54938 ) ) ( not ( = ?auto_54939 ?auto_54942 ) ) ( not ( = ?auto_54939 ?auto_54938 ) ) ( ON ?auto_54937 ?auto_54939 ) ( ON ?auto_54938 ?auto_54940 ) ( not ( = ?auto_54936 ?auto_54940 ) ) ( not ( = ?auto_54941 ?auto_54940 ) ) ( not ( = ?auto_54939 ?auto_54940 ) ) ( not ( = ?auto_54937 ?auto_54940 ) ) ( not ( = ?auto_54938 ?auto_54940 ) ) ( not ( = ?auto_54942 ?auto_54940 ) ) ( CLEAR ?auto_54937 ) ( ON ?auto_54942 ?auto_54938 ) ( CLEAR ?auto_54942 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_54940 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54940 ?auto_54938 )
      ( MAKE-1PILE ?auto_54936 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_54976 - BLOCK
      ?auto_54977 - BLOCK
      ?auto_54978 - BLOCK
      ?auto_54979 - BLOCK
      ?auto_54980 - BLOCK
    )
    :vars
    (
      ?auto_54981 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54976 ) ( ON ?auto_54977 ?auto_54976 ) ( ON ?auto_54978 ?auto_54977 ) ( not ( = ?auto_54976 ?auto_54977 ) ) ( not ( = ?auto_54976 ?auto_54978 ) ) ( not ( = ?auto_54976 ?auto_54979 ) ) ( not ( = ?auto_54976 ?auto_54980 ) ) ( not ( = ?auto_54977 ?auto_54978 ) ) ( not ( = ?auto_54977 ?auto_54979 ) ) ( not ( = ?auto_54977 ?auto_54980 ) ) ( not ( = ?auto_54978 ?auto_54979 ) ) ( not ( = ?auto_54978 ?auto_54980 ) ) ( not ( = ?auto_54979 ?auto_54980 ) ) ( ON ?auto_54980 ?auto_54981 ) ( not ( = ?auto_54976 ?auto_54981 ) ) ( not ( = ?auto_54977 ?auto_54981 ) ) ( not ( = ?auto_54978 ?auto_54981 ) ) ( not ( = ?auto_54979 ?auto_54981 ) ) ( not ( = ?auto_54980 ?auto_54981 ) ) ( CLEAR ?auto_54978 ) ( ON ?auto_54979 ?auto_54980 ) ( CLEAR ?auto_54979 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_54981 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54981 ?auto_54980 )
      ( MAKE-5PILE ?auto_54976 ?auto_54977 ?auto_54978 ?auto_54979 ?auto_54980 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_54982 - BLOCK
      ?auto_54983 - BLOCK
      ?auto_54984 - BLOCK
      ?auto_54985 - BLOCK
      ?auto_54986 - BLOCK
    )
    :vars
    (
      ?auto_54987 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54982 ) ( ON ?auto_54983 ?auto_54982 ) ( not ( = ?auto_54982 ?auto_54983 ) ) ( not ( = ?auto_54982 ?auto_54984 ) ) ( not ( = ?auto_54982 ?auto_54985 ) ) ( not ( = ?auto_54982 ?auto_54986 ) ) ( not ( = ?auto_54983 ?auto_54984 ) ) ( not ( = ?auto_54983 ?auto_54985 ) ) ( not ( = ?auto_54983 ?auto_54986 ) ) ( not ( = ?auto_54984 ?auto_54985 ) ) ( not ( = ?auto_54984 ?auto_54986 ) ) ( not ( = ?auto_54985 ?auto_54986 ) ) ( ON ?auto_54986 ?auto_54987 ) ( not ( = ?auto_54982 ?auto_54987 ) ) ( not ( = ?auto_54983 ?auto_54987 ) ) ( not ( = ?auto_54984 ?auto_54987 ) ) ( not ( = ?auto_54985 ?auto_54987 ) ) ( not ( = ?auto_54986 ?auto_54987 ) ) ( ON ?auto_54985 ?auto_54986 ) ( CLEAR ?auto_54985 ) ( ON-TABLE ?auto_54987 ) ( HOLDING ?auto_54984 ) ( CLEAR ?auto_54983 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_54982 ?auto_54983 ?auto_54984 )
      ( MAKE-5PILE ?auto_54982 ?auto_54983 ?auto_54984 ?auto_54985 ?auto_54986 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_54988 - BLOCK
      ?auto_54989 - BLOCK
      ?auto_54990 - BLOCK
      ?auto_54991 - BLOCK
      ?auto_54992 - BLOCK
    )
    :vars
    (
      ?auto_54993 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54988 ) ( ON ?auto_54989 ?auto_54988 ) ( not ( = ?auto_54988 ?auto_54989 ) ) ( not ( = ?auto_54988 ?auto_54990 ) ) ( not ( = ?auto_54988 ?auto_54991 ) ) ( not ( = ?auto_54988 ?auto_54992 ) ) ( not ( = ?auto_54989 ?auto_54990 ) ) ( not ( = ?auto_54989 ?auto_54991 ) ) ( not ( = ?auto_54989 ?auto_54992 ) ) ( not ( = ?auto_54990 ?auto_54991 ) ) ( not ( = ?auto_54990 ?auto_54992 ) ) ( not ( = ?auto_54991 ?auto_54992 ) ) ( ON ?auto_54992 ?auto_54993 ) ( not ( = ?auto_54988 ?auto_54993 ) ) ( not ( = ?auto_54989 ?auto_54993 ) ) ( not ( = ?auto_54990 ?auto_54993 ) ) ( not ( = ?auto_54991 ?auto_54993 ) ) ( not ( = ?auto_54992 ?auto_54993 ) ) ( ON ?auto_54991 ?auto_54992 ) ( ON-TABLE ?auto_54993 ) ( CLEAR ?auto_54989 ) ( ON ?auto_54990 ?auto_54991 ) ( CLEAR ?auto_54990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_54993 ?auto_54992 ?auto_54991 )
      ( MAKE-5PILE ?auto_54988 ?auto_54989 ?auto_54990 ?auto_54991 ?auto_54992 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_54994 - BLOCK
      ?auto_54995 - BLOCK
      ?auto_54996 - BLOCK
      ?auto_54997 - BLOCK
      ?auto_54998 - BLOCK
    )
    :vars
    (
      ?auto_54999 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54994 ) ( not ( = ?auto_54994 ?auto_54995 ) ) ( not ( = ?auto_54994 ?auto_54996 ) ) ( not ( = ?auto_54994 ?auto_54997 ) ) ( not ( = ?auto_54994 ?auto_54998 ) ) ( not ( = ?auto_54995 ?auto_54996 ) ) ( not ( = ?auto_54995 ?auto_54997 ) ) ( not ( = ?auto_54995 ?auto_54998 ) ) ( not ( = ?auto_54996 ?auto_54997 ) ) ( not ( = ?auto_54996 ?auto_54998 ) ) ( not ( = ?auto_54997 ?auto_54998 ) ) ( ON ?auto_54998 ?auto_54999 ) ( not ( = ?auto_54994 ?auto_54999 ) ) ( not ( = ?auto_54995 ?auto_54999 ) ) ( not ( = ?auto_54996 ?auto_54999 ) ) ( not ( = ?auto_54997 ?auto_54999 ) ) ( not ( = ?auto_54998 ?auto_54999 ) ) ( ON ?auto_54997 ?auto_54998 ) ( ON-TABLE ?auto_54999 ) ( ON ?auto_54996 ?auto_54997 ) ( CLEAR ?auto_54996 ) ( HOLDING ?auto_54995 ) ( CLEAR ?auto_54994 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54994 ?auto_54995 )
      ( MAKE-5PILE ?auto_54994 ?auto_54995 ?auto_54996 ?auto_54997 ?auto_54998 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55000 - BLOCK
      ?auto_55001 - BLOCK
      ?auto_55002 - BLOCK
      ?auto_55003 - BLOCK
      ?auto_55004 - BLOCK
    )
    :vars
    (
      ?auto_55005 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55000 ) ( not ( = ?auto_55000 ?auto_55001 ) ) ( not ( = ?auto_55000 ?auto_55002 ) ) ( not ( = ?auto_55000 ?auto_55003 ) ) ( not ( = ?auto_55000 ?auto_55004 ) ) ( not ( = ?auto_55001 ?auto_55002 ) ) ( not ( = ?auto_55001 ?auto_55003 ) ) ( not ( = ?auto_55001 ?auto_55004 ) ) ( not ( = ?auto_55002 ?auto_55003 ) ) ( not ( = ?auto_55002 ?auto_55004 ) ) ( not ( = ?auto_55003 ?auto_55004 ) ) ( ON ?auto_55004 ?auto_55005 ) ( not ( = ?auto_55000 ?auto_55005 ) ) ( not ( = ?auto_55001 ?auto_55005 ) ) ( not ( = ?auto_55002 ?auto_55005 ) ) ( not ( = ?auto_55003 ?auto_55005 ) ) ( not ( = ?auto_55004 ?auto_55005 ) ) ( ON ?auto_55003 ?auto_55004 ) ( ON-TABLE ?auto_55005 ) ( ON ?auto_55002 ?auto_55003 ) ( CLEAR ?auto_55000 ) ( ON ?auto_55001 ?auto_55002 ) ( CLEAR ?auto_55001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_55005 ?auto_55004 ?auto_55003 ?auto_55002 )
      ( MAKE-5PILE ?auto_55000 ?auto_55001 ?auto_55002 ?auto_55003 ?auto_55004 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55006 - BLOCK
      ?auto_55007 - BLOCK
      ?auto_55008 - BLOCK
      ?auto_55009 - BLOCK
      ?auto_55010 - BLOCK
    )
    :vars
    (
      ?auto_55011 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55006 ?auto_55007 ) ) ( not ( = ?auto_55006 ?auto_55008 ) ) ( not ( = ?auto_55006 ?auto_55009 ) ) ( not ( = ?auto_55006 ?auto_55010 ) ) ( not ( = ?auto_55007 ?auto_55008 ) ) ( not ( = ?auto_55007 ?auto_55009 ) ) ( not ( = ?auto_55007 ?auto_55010 ) ) ( not ( = ?auto_55008 ?auto_55009 ) ) ( not ( = ?auto_55008 ?auto_55010 ) ) ( not ( = ?auto_55009 ?auto_55010 ) ) ( ON ?auto_55010 ?auto_55011 ) ( not ( = ?auto_55006 ?auto_55011 ) ) ( not ( = ?auto_55007 ?auto_55011 ) ) ( not ( = ?auto_55008 ?auto_55011 ) ) ( not ( = ?auto_55009 ?auto_55011 ) ) ( not ( = ?auto_55010 ?auto_55011 ) ) ( ON ?auto_55009 ?auto_55010 ) ( ON-TABLE ?auto_55011 ) ( ON ?auto_55008 ?auto_55009 ) ( ON ?auto_55007 ?auto_55008 ) ( CLEAR ?auto_55007 ) ( HOLDING ?auto_55006 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_55006 )
      ( MAKE-5PILE ?auto_55006 ?auto_55007 ?auto_55008 ?auto_55009 ?auto_55010 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55012 - BLOCK
      ?auto_55013 - BLOCK
      ?auto_55014 - BLOCK
      ?auto_55015 - BLOCK
      ?auto_55016 - BLOCK
    )
    :vars
    (
      ?auto_55017 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55012 ?auto_55013 ) ) ( not ( = ?auto_55012 ?auto_55014 ) ) ( not ( = ?auto_55012 ?auto_55015 ) ) ( not ( = ?auto_55012 ?auto_55016 ) ) ( not ( = ?auto_55013 ?auto_55014 ) ) ( not ( = ?auto_55013 ?auto_55015 ) ) ( not ( = ?auto_55013 ?auto_55016 ) ) ( not ( = ?auto_55014 ?auto_55015 ) ) ( not ( = ?auto_55014 ?auto_55016 ) ) ( not ( = ?auto_55015 ?auto_55016 ) ) ( ON ?auto_55016 ?auto_55017 ) ( not ( = ?auto_55012 ?auto_55017 ) ) ( not ( = ?auto_55013 ?auto_55017 ) ) ( not ( = ?auto_55014 ?auto_55017 ) ) ( not ( = ?auto_55015 ?auto_55017 ) ) ( not ( = ?auto_55016 ?auto_55017 ) ) ( ON ?auto_55015 ?auto_55016 ) ( ON-TABLE ?auto_55017 ) ( ON ?auto_55014 ?auto_55015 ) ( ON ?auto_55013 ?auto_55014 ) ( ON ?auto_55012 ?auto_55013 ) ( CLEAR ?auto_55012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_55017 ?auto_55016 ?auto_55015 ?auto_55014 ?auto_55013 )
      ( MAKE-5PILE ?auto_55012 ?auto_55013 ?auto_55014 ?auto_55015 ?auto_55016 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55023 - BLOCK
      ?auto_55024 - BLOCK
      ?auto_55025 - BLOCK
      ?auto_55026 - BLOCK
      ?auto_55027 - BLOCK
    )
    :vars
    (
      ?auto_55028 - BLOCK
      ?auto_55029 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55023 ?auto_55024 ) ) ( not ( = ?auto_55023 ?auto_55025 ) ) ( not ( = ?auto_55023 ?auto_55026 ) ) ( not ( = ?auto_55023 ?auto_55027 ) ) ( not ( = ?auto_55024 ?auto_55025 ) ) ( not ( = ?auto_55024 ?auto_55026 ) ) ( not ( = ?auto_55024 ?auto_55027 ) ) ( not ( = ?auto_55025 ?auto_55026 ) ) ( not ( = ?auto_55025 ?auto_55027 ) ) ( not ( = ?auto_55026 ?auto_55027 ) ) ( ON ?auto_55027 ?auto_55028 ) ( not ( = ?auto_55023 ?auto_55028 ) ) ( not ( = ?auto_55024 ?auto_55028 ) ) ( not ( = ?auto_55025 ?auto_55028 ) ) ( not ( = ?auto_55026 ?auto_55028 ) ) ( not ( = ?auto_55027 ?auto_55028 ) ) ( ON ?auto_55026 ?auto_55027 ) ( ON-TABLE ?auto_55028 ) ( ON ?auto_55025 ?auto_55026 ) ( ON ?auto_55024 ?auto_55025 ) ( CLEAR ?auto_55024 ) ( ON ?auto_55023 ?auto_55029 ) ( CLEAR ?auto_55023 ) ( HAND-EMPTY ) ( not ( = ?auto_55023 ?auto_55029 ) ) ( not ( = ?auto_55024 ?auto_55029 ) ) ( not ( = ?auto_55025 ?auto_55029 ) ) ( not ( = ?auto_55026 ?auto_55029 ) ) ( not ( = ?auto_55027 ?auto_55029 ) ) ( not ( = ?auto_55028 ?auto_55029 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_55023 ?auto_55029 )
      ( MAKE-5PILE ?auto_55023 ?auto_55024 ?auto_55025 ?auto_55026 ?auto_55027 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55030 - BLOCK
      ?auto_55031 - BLOCK
      ?auto_55032 - BLOCK
      ?auto_55033 - BLOCK
      ?auto_55034 - BLOCK
    )
    :vars
    (
      ?auto_55036 - BLOCK
      ?auto_55035 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55030 ?auto_55031 ) ) ( not ( = ?auto_55030 ?auto_55032 ) ) ( not ( = ?auto_55030 ?auto_55033 ) ) ( not ( = ?auto_55030 ?auto_55034 ) ) ( not ( = ?auto_55031 ?auto_55032 ) ) ( not ( = ?auto_55031 ?auto_55033 ) ) ( not ( = ?auto_55031 ?auto_55034 ) ) ( not ( = ?auto_55032 ?auto_55033 ) ) ( not ( = ?auto_55032 ?auto_55034 ) ) ( not ( = ?auto_55033 ?auto_55034 ) ) ( ON ?auto_55034 ?auto_55036 ) ( not ( = ?auto_55030 ?auto_55036 ) ) ( not ( = ?auto_55031 ?auto_55036 ) ) ( not ( = ?auto_55032 ?auto_55036 ) ) ( not ( = ?auto_55033 ?auto_55036 ) ) ( not ( = ?auto_55034 ?auto_55036 ) ) ( ON ?auto_55033 ?auto_55034 ) ( ON-TABLE ?auto_55036 ) ( ON ?auto_55032 ?auto_55033 ) ( ON ?auto_55030 ?auto_55035 ) ( CLEAR ?auto_55030 ) ( not ( = ?auto_55030 ?auto_55035 ) ) ( not ( = ?auto_55031 ?auto_55035 ) ) ( not ( = ?auto_55032 ?auto_55035 ) ) ( not ( = ?auto_55033 ?auto_55035 ) ) ( not ( = ?auto_55034 ?auto_55035 ) ) ( not ( = ?auto_55036 ?auto_55035 ) ) ( HOLDING ?auto_55031 ) ( CLEAR ?auto_55032 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_55036 ?auto_55034 ?auto_55033 ?auto_55032 ?auto_55031 )
      ( MAKE-5PILE ?auto_55030 ?auto_55031 ?auto_55032 ?auto_55033 ?auto_55034 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55037 - BLOCK
      ?auto_55038 - BLOCK
      ?auto_55039 - BLOCK
      ?auto_55040 - BLOCK
      ?auto_55041 - BLOCK
    )
    :vars
    (
      ?auto_55042 - BLOCK
      ?auto_55043 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55037 ?auto_55038 ) ) ( not ( = ?auto_55037 ?auto_55039 ) ) ( not ( = ?auto_55037 ?auto_55040 ) ) ( not ( = ?auto_55037 ?auto_55041 ) ) ( not ( = ?auto_55038 ?auto_55039 ) ) ( not ( = ?auto_55038 ?auto_55040 ) ) ( not ( = ?auto_55038 ?auto_55041 ) ) ( not ( = ?auto_55039 ?auto_55040 ) ) ( not ( = ?auto_55039 ?auto_55041 ) ) ( not ( = ?auto_55040 ?auto_55041 ) ) ( ON ?auto_55041 ?auto_55042 ) ( not ( = ?auto_55037 ?auto_55042 ) ) ( not ( = ?auto_55038 ?auto_55042 ) ) ( not ( = ?auto_55039 ?auto_55042 ) ) ( not ( = ?auto_55040 ?auto_55042 ) ) ( not ( = ?auto_55041 ?auto_55042 ) ) ( ON ?auto_55040 ?auto_55041 ) ( ON-TABLE ?auto_55042 ) ( ON ?auto_55039 ?auto_55040 ) ( ON ?auto_55037 ?auto_55043 ) ( not ( = ?auto_55037 ?auto_55043 ) ) ( not ( = ?auto_55038 ?auto_55043 ) ) ( not ( = ?auto_55039 ?auto_55043 ) ) ( not ( = ?auto_55040 ?auto_55043 ) ) ( not ( = ?auto_55041 ?auto_55043 ) ) ( not ( = ?auto_55042 ?auto_55043 ) ) ( CLEAR ?auto_55039 ) ( ON ?auto_55038 ?auto_55037 ) ( CLEAR ?auto_55038 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_55043 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_55043 ?auto_55037 )
      ( MAKE-5PILE ?auto_55037 ?auto_55038 ?auto_55039 ?auto_55040 ?auto_55041 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55044 - BLOCK
      ?auto_55045 - BLOCK
      ?auto_55046 - BLOCK
      ?auto_55047 - BLOCK
      ?auto_55048 - BLOCK
    )
    :vars
    (
      ?auto_55050 - BLOCK
      ?auto_55049 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55044 ?auto_55045 ) ) ( not ( = ?auto_55044 ?auto_55046 ) ) ( not ( = ?auto_55044 ?auto_55047 ) ) ( not ( = ?auto_55044 ?auto_55048 ) ) ( not ( = ?auto_55045 ?auto_55046 ) ) ( not ( = ?auto_55045 ?auto_55047 ) ) ( not ( = ?auto_55045 ?auto_55048 ) ) ( not ( = ?auto_55046 ?auto_55047 ) ) ( not ( = ?auto_55046 ?auto_55048 ) ) ( not ( = ?auto_55047 ?auto_55048 ) ) ( ON ?auto_55048 ?auto_55050 ) ( not ( = ?auto_55044 ?auto_55050 ) ) ( not ( = ?auto_55045 ?auto_55050 ) ) ( not ( = ?auto_55046 ?auto_55050 ) ) ( not ( = ?auto_55047 ?auto_55050 ) ) ( not ( = ?auto_55048 ?auto_55050 ) ) ( ON ?auto_55047 ?auto_55048 ) ( ON-TABLE ?auto_55050 ) ( ON ?auto_55044 ?auto_55049 ) ( not ( = ?auto_55044 ?auto_55049 ) ) ( not ( = ?auto_55045 ?auto_55049 ) ) ( not ( = ?auto_55046 ?auto_55049 ) ) ( not ( = ?auto_55047 ?auto_55049 ) ) ( not ( = ?auto_55048 ?auto_55049 ) ) ( not ( = ?auto_55050 ?auto_55049 ) ) ( ON ?auto_55045 ?auto_55044 ) ( CLEAR ?auto_55045 ) ( ON-TABLE ?auto_55049 ) ( HOLDING ?auto_55046 ) ( CLEAR ?auto_55047 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_55050 ?auto_55048 ?auto_55047 ?auto_55046 )
      ( MAKE-5PILE ?auto_55044 ?auto_55045 ?auto_55046 ?auto_55047 ?auto_55048 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55051 - BLOCK
      ?auto_55052 - BLOCK
      ?auto_55053 - BLOCK
      ?auto_55054 - BLOCK
      ?auto_55055 - BLOCK
    )
    :vars
    (
      ?auto_55056 - BLOCK
      ?auto_55057 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55051 ?auto_55052 ) ) ( not ( = ?auto_55051 ?auto_55053 ) ) ( not ( = ?auto_55051 ?auto_55054 ) ) ( not ( = ?auto_55051 ?auto_55055 ) ) ( not ( = ?auto_55052 ?auto_55053 ) ) ( not ( = ?auto_55052 ?auto_55054 ) ) ( not ( = ?auto_55052 ?auto_55055 ) ) ( not ( = ?auto_55053 ?auto_55054 ) ) ( not ( = ?auto_55053 ?auto_55055 ) ) ( not ( = ?auto_55054 ?auto_55055 ) ) ( ON ?auto_55055 ?auto_55056 ) ( not ( = ?auto_55051 ?auto_55056 ) ) ( not ( = ?auto_55052 ?auto_55056 ) ) ( not ( = ?auto_55053 ?auto_55056 ) ) ( not ( = ?auto_55054 ?auto_55056 ) ) ( not ( = ?auto_55055 ?auto_55056 ) ) ( ON ?auto_55054 ?auto_55055 ) ( ON-TABLE ?auto_55056 ) ( ON ?auto_55051 ?auto_55057 ) ( not ( = ?auto_55051 ?auto_55057 ) ) ( not ( = ?auto_55052 ?auto_55057 ) ) ( not ( = ?auto_55053 ?auto_55057 ) ) ( not ( = ?auto_55054 ?auto_55057 ) ) ( not ( = ?auto_55055 ?auto_55057 ) ) ( not ( = ?auto_55056 ?auto_55057 ) ) ( ON ?auto_55052 ?auto_55051 ) ( ON-TABLE ?auto_55057 ) ( CLEAR ?auto_55054 ) ( ON ?auto_55053 ?auto_55052 ) ( CLEAR ?auto_55053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55057 ?auto_55051 ?auto_55052 )
      ( MAKE-5PILE ?auto_55051 ?auto_55052 ?auto_55053 ?auto_55054 ?auto_55055 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55058 - BLOCK
      ?auto_55059 - BLOCK
      ?auto_55060 - BLOCK
      ?auto_55061 - BLOCK
      ?auto_55062 - BLOCK
    )
    :vars
    (
      ?auto_55064 - BLOCK
      ?auto_55063 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55058 ?auto_55059 ) ) ( not ( = ?auto_55058 ?auto_55060 ) ) ( not ( = ?auto_55058 ?auto_55061 ) ) ( not ( = ?auto_55058 ?auto_55062 ) ) ( not ( = ?auto_55059 ?auto_55060 ) ) ( not ( = ?auto_55059 ?auto_55061 ) ) ( not ( = ?auto_55059 ?auto_55062 ) ) ( not ( = ?auto_55060 ?auto_55061 ) ) ( not ( = ?auto_55060 ?auto_55062 ) ) ( not ( = ?auto_55061 ?auto_55062 ) ) ( ON ?auto_55062 ?auto_55064 ) ( not ( = ?auto_55058 ?auto_55064 ) ) ( not ( = ?auto_55059 ?auto_55064 ) ) ( not ( = ?auto_55060 ?auto_55064 ) ) ( not ( = ?auto_55061 ?auto_55064 ) ) ( not ( = ?auto_55062 ?auto_55064 ) ) ( ON-TABLE ?auto_55064 ) ( ON ?auto_55058 ?auto_55063 ) ( not ( = ?auto_55058 ?auto_55063 ) ) ( not ( = ?auto_55059 ?auto_55063 ) ) ( not ( = ?auto_55060 ?auto_55063 ) ) ( not ( = ?auto_55061 ?auto_55063 ) ) ( not ( = ?auto_55062 ?auto_55063 ) ) ( not ( = ?auto_55064 ?auto_55063 ) ) ( ON ?auto_55059 ?auto_55058 ) ( ON-TABLE ?auto_55063 ) ( ON ?auto_55060 ?auto_55059 ) ( CLEAR ?auto_55060 ) ( HOLDING ?auto_55061 ) ( CLEAR ?auto_55062 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55064 ?auto_55062 ?auto_55061 )
      ( MAKE-5PILE ?auto_55058 ?auto_55059 ?auto_55060 ?auto_55061 ?auto_55062 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55065 - BLOCK
      ?auto_55066 - BLOCK
      ?auto_55067 - BLOCK
      ?auto_55068 - BLOCK
      ?auto_55069 - BLOCK
    )
    :vars
    (
      ?auto_55071 - BLOCK
      ?auto_55070 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55065 ?auto_55066 ) ) ( not ( = ?auto_55065 ?auto_55067 ) ) ( not ( = ?auto_55065 ?auto_55068 ) ) ( not ( = ?auto_55065 ?auto_55069 ) ) ( not ( = ?auto_55066 ?auto_55067 ) ) ( not ( = ?auto_55066 ?auto_55068 ) ) ( not ( = ?auto_55066 ?auto_55069 ) ) ( not ( = ?auto_55067 ?auto_55068 ) ) ( not ( = ?auto_55067 ?auto_55069 ) ) ( not ( = ?auto_55068 ?auto_55069 ) ) ( ON ?auto_55069 ?auto_55071 ) ( not ( = ?auto_55065 ?auto_55071 ) ) ( not ( = ?auto_55066 ?auto_55071 ) ) ( not ( = ?auto_55067 ?auto_55071 ) ) ( not ( = ?auto_55068 ?auto_55071 ) ) ( not ( = ?auto_55069 ?auto_55071 ) ) ( ON-TABLE ?auto_55071 ) ( ON ?auto_55065 ?auto_55070 ) ( not ( = ?auto_55065 ?auto_55070 ) ) ( not ( = ?auto_55066 ?auto_55070 ) ) ( not ( = ?auto_55067 ?auto_55070 ) ) ( not ( = ?auto_55068 ?auto_55070 ) ) ( not ( = ?auto_55069 ?auto_55070 ) ) ( not ( = ?auto_55071 ?auto_55070 ) ) ( ON ?auto_55066 ?auto_55065 ) ( ON-TABLE ?auto_55070 ) ( ON ?auto_55067 ?auto_55066 ) ( CLEAR ?auto_55069 ) ( ON ?auto_55068 ?auto_55067 ) ( CLEAR ?auto_55068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_55070 ?auto_55065 ?auto_55066 ?auto_55067 )
      ( MAKE-5PILE ?auto_55065 ?auto_55066 ?auto_55067 ?auto_55068 ?auto_55069 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55072 - BLOCK
      ?auto_55073 - BLOCK
      ?auto_55074 - BLOCK
      ?auto_55075 - BLOCK
      ?auto_55076 - BLOCK
    )
    :vars
    (
      ?auto_55078 - BLOCK
      ?auto_55077 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55072 ?auto_55073 ) ) ( not ( = ?auto_55072 ?auto_55074 ) ) ( not ( = ?auto_55072 ?auto_55075 ) ) ( not ( = ?auto_55072 ?auto_55076 ) ) ( not ( = ?auto_55073 ?auto_55074 ) ) ( not ( = ?auto_55073 ?auto_55075 ) ) ( not ( = ?auto_55073 ?auto_55076 ) ) ( not ( = ?auto_55074 ?auto_55075 ) ) ( not ( = ?auto_55074 ?auto_55076 ) ) ( not ( = ?auto_55075 ?auto_55076 ) ) ( not ( = ?auto_55072 ?auto_55078 ) ) ( not ( = ?auto_55073 ?auto_55078 ) ) ( not ( = ?auto_55074 ?auto_55078 ) ) ( not ( = ?auto_55075 ?auto_55078 ) ) ( not ( = ?auto_55076 ?auto_55078 ) ) ( ON-TABLE ?auto_55078 ) ( ON ?auto_55072 ?auto_55077 ) ( not ( = ?auto_55072 ?auto_55077 ) ) ( not ( = ?auto_55073 ?auto_55077 ) ) ( not ( = ?auto_55074 ?auto_55077 ) ) ( not ( = ?auto_55075 ?auto_55077 ) ) ( not ( = ?auto_55076 ?auto_55077 ) ) ( not ( = ?auto_55078 ?auto_55077 ) ) ( ON ?auto_55073 ?auto_55072 ) ( ON-TABLE ?auto_55077 ) ( ON ?auto_55074 ?auto_55073 ) ( ON ?auto_55075 ?auto_55074 ) ( CLEAR ?auto_55075 ) ( HOLDING ?auto_55076 ) ( CLEAR ?auto_55078 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_55078 ?auto_55076 )
      ( MAKE-5PILE ?auto_55072 ?auto_55073 ?auto_55074 ?auto_55075 ?auto_55076 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55079 - BLOCK
      ?auto_55080 - BLOCK
      ?auto_55081 - BLOCK
      ?auto_55082 - BLOCK
      ?auto_55083 - BLOCK
    )
    :vars
    (
      ?auto_55084 - BLOCK
      ?auto_55085 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55079 ?auto_55080 ) ) ( not ( = ?auto_55079 ?auto_55081 ) ) ( not ( = ?auto_55079 ?auto_55082 ) ) ( not ( = ?auto_55079 ?auto_55083 ) ) ( not ( = ?auto_55080 ?auto_55081 ) ) ( not ( = ?auto_55080 ?auto_55082 ) ) ( not ( = ?auto_55080 ?auto_55083 ) ) ( not ( = ?auto_55081 ?auto_55082 ) ) ( not ( = ?auto_55081 ?auto_55083 ) ) ( not ( = ?auto_55082 ?auto_55083 ) ) ( not ( = ?auto_55079 ?auto_55084 ) ) ( not ( = ?auto_55080 ?auto_55084 ) ) ( not ( = ?auto_55081 ?auto_55084 ) ) ( not ( = ?auto_55082 ?auto_55084 ) ) ( not ( = ?auto_55083 ?auto_55084 ) ) ( ON-TABLE ?auto_55084 ) ( ON ?auto_55079 ?auto_55085 ) ( not ( = ?auto_55079 ?auto_55085 ) ) ( not ( = ?auto_55080 ?auto_55085 ) ) ( not ( = ?auto_55081 ?auto_55085 ) ) ( not ( = ?auto_55082 ?auto_55085 ) ) ( not ( = ?auto_55083 ?auto_55085 ) ) ( not ( = ?auto_55084 ?auto_55085 ) ) ( ON ?auto_55080 ?auto_55079 ) ( ON-TABLE ?auto_55085 ) ( ON ?auto_55081 ?auto_55080 ) ( ON ?auto_55082 ?auto_55081 ) ( CLEAR ?auto_55084 ) ( ON ?auto_55083 ?auto_55082 ) ( CLEAR ?auto_55083 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_55085 ?auto_55079 ?auto_55080 ?auto_55081 ?auto_55082 )
      ( MAKE-5PILE ?auto_55079 ?auto_55080 ?auto_55081 ?auto_55082 ?auto_55083 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55086 - BLOCK
      ?auto_55087 - BLOCK
      ?auto_55088 - BLOCK
      ?auto_55089 - BLOCK
      ?auto_55090 - BLOCK
    )
    :vars
    (
      ?auto_55091 - BLOCK
      ?auto_55092 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55086 ?auto_55087 ) ) ( not ( = ?auto_55086 ?auto_55088 ) ) ( not ( = ?auto_55086 ?auto_55089 ) ) ( not ( = ?auto_55086 ?auto_55090 ) ) ( not ( = ?auto_55087 ?auto_55088 ) ) ( not ( = ?auto_55087 ?auto_55089 ) ) ( not ( = ?auto_55087 ?auto_55090 ) ) ( not ( = ?auto_55088 ?auto_55089 ) ) ( not ( = ?auto_55088 ?auto_55090 ) ) ( not ( = ?auto_55089 ?auto_55090 ) ) ( not ( = ?auto_55086 ?auto_55091 ) ) ( not ( = ?auto_55087 ?auto_55091 ) ) ( not ( = ?auto_55088 ?auto_55091 ) ) ( not ( = ?auto_55089 ?auto_55091 ) ) ( not ( = ?auto_55090 ?auto_55091 ) ) ( ON ?auto_55086 ?auto_55092 ) ( not ( = ?auto_55086 ?auto_55092 ) ) ( not ( = ?auto_55087 ?auto_55092 ) ) ( not ( = ?auto_55088 ?auto_55092 ) ) ( not ( = ?auto_55089 ?auto_55092 ) ) ( not ( = ?auto_55090 ?auto_55092 ) ) ( not ( = ?auto_55091 ?auto_55092 ) ) ( ON ?auto_55087 ?auto_55086 ) ( ON-TABLE ?auto_55092 ) ( ON ?auto_55088 ?auto_55087 ) ( ON ?auto_55089 ?auto_55088 ) ( ON ?auto_55090 ?auto_55089 ) ( CLEAR ?auto_55090 ) ( HOLDING ?auto_55091 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_55091 )
      ( MAKE-5PILE ?auto_55086 ?auto_55087 ?auto_55088 ?auto_55089 ?auto_55090 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55093 - BLOCK
      ?auto_55094 - BLOCK
      ?auto_55095 - BLOCK
      ?auto_55096 - BLOCK
      ?auto_55097 - BLOCK
    )
    :vars
    (
      ?auto_55098 - BLOCK
      ?auto_55099 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55093 ?auto_55094 ) ) ( not ( = ?auto_55093 ?auto_55095 ) ) ( not ( = ?auto_55093 ?auto_55096 ) ) ( not ( = ?auto_55093 ?auto_55097 ) ) ( not ( = ?auto_55094 ?auto_55095 ) ) ( not ( = ?auto_55094 ?auto_55096 ) ) ( not ( = ?auto_55094 ?auto_55097 ) ) ( not ( = ?auto_55095 ?auto_55096 ) ) ( not ( = ?auto_55095 ?auto_55097 ) ) ( not ( = ?auto_55096 ?auto_55097 ) ) ( not ( = ?auto_55093 ?auto_55098 ) ) ( not ( = ?auto_55094 ?auto_55098 ) ) ( not ( = ?auto_55095 ?auto_55098 ) ) ( not ( = ?auto_55096 ?auto_55098 ) ) ( not ( = ?auto_55097 ?auto_55098 ) ) ( ON ?auto_55093 ?auto_55099 ) ( not ( = ?auto_55093 ?auto_55099 ) ) ( not ( = ?auto_55094 ?auto_55099 ) ) ( not ( = ?auto_55095 ?auto_55099 ) ) ( not ( = ?auto_55096 ?auto_55099 ) ) ( not ( = ?auto_55097 ?auto_55099 ) ) ( not ( = ?auto_55098 ?auto_55099 ) ) ( ON ?auto_55094 ?auto_55093 ) ( ON-TABLE ?auto_55099 ) ( ON ?auto_55095 ?auto_55094 ) ( ON ?auto_55096 ?auto_55095 ) ( ON ?auto_55097 ?auto_55096 ) ( ON ?auto_55098 ?auto_55097 ) ( CLEAR ?auto_55098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_55099 ?auto_55093 ?auto_55094 ?auto_55095 ?auto_55096 ?auto_55097 )
      ( MAKE-5PILE ?auto_55093 ?auto_55094 ?auto_55095 ?auto_55096 ?auto_55097 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55112 - BLOCK
      ?auto_55113 - BLOCK
      ?auto_55114 - BLOCK
      ?auto_55115 - BLOCK
      ?auto_55116 - BLOCK
      ?auto_55117 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_55116 ) ( ON-TABLE ?auto_55112 ) ( ON ?auto_55113 ?auto_55112 ) ( ON ?auto_55114 ?auto_55113 ) ( ON ?auto_55115 ?auto_55114 ) ( ON ?auto_55116 ?auto_55115 ) ( not ( = ?auto_55112 ?auto_55113 ) ) ( not ( = ?auto_55112 ?auto_55114 ) ) ( not ( = ?auto_55112 ?auto_55115 ) ) ( not ( = ?auto_55112 ?auto_55116 ) ) ( not ( = ?auto_55112 ?auto_55117 ) ) ( not ( = ?auto_55113 ?auto_55114 ) ) ( not ( = ?auto_55113 ?auto_55115 ) ) ( not ( = ?auto_55113 ?auto_55116 ) ) ( not ( = ?auto_55113 ?auto_55117 ) ) ( not ( = ?auto_55114 ?auto_55115 ) ) ( not ( = ?auto_55114 ?auto_55116 ) ) ( not ( = ?auto_55114 ?auto_55117 ) ) ( not ( = ?auto_55115 ?auto_55116 ) ) ( not ( = ?auto_55115 ?auto_55117 ) ) ( not ( = ?auto_55116 ?auto_55117 ) ) ( ON-TABLE ?auto_55117 ) ( CLEAR ?auto_55117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_55117 )
      ( MAKE-6PILE ?auto_55112 ?auto_55113 ?auto_55114 ?auto_55115 ?auto_55116 ?auto_55117 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55118 - BLOCK
      ?auto_55119 - BLOCK
      ?auto_55120 - BLOCK
      ?auto_55121 - BLOCK
      ?auto_55122 - BLOCK
      ?auto_55123 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55118 ) ( ON ?auto_55119 ?auto_55118 ) ( ON ?auto_55120 ?auto_55119 ) ( ON ?auto_55121 ?auto_55120 ) ( not ( = ?auto_55118 ?auto_55119 ) ) ( not ( = ?auto_55118 ?auto_55120 ) ) ( not ( = ?auto_55118 ?auto_55121 ) ) ( not ( = ?auto_55118 ?auto_55122 ) ) ( not ( = ?auto_55118 ?auto_55123 ) ) ( not ( = ?auto_55119 ?auto_55120 ) ) ( not ( = ?auto_55119 ?auto_55121 ) ) ( not ( = ?auto_55119 ?auto_55122 ) ) ( not ( = ?auto_55119 ?auto_55123 ) ) ( not ( = ?auto_55120 ?auto_55121 ) ) ( not ( = ?auto_55120 ?auto_55122 ) ) ( not ( = ?auto_55120 ?auto_55123 ) ) ( not ( = ?auto_55121 ?auto_55122 ) ) ( not ( = ?auto_55121 ?auto_55123 ) ) ( not ( = ?auto_55122 ?auto_55123 ) ) ( ON-TABLE ?auto_55123 ) ( CLEAR ?auto_55123 ) ( HOLDING ?auto_55122 ) ( CLEAR ?auto_55121 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_55118 ?auto_55119 ?auto_55120 ?auto_55121 ?auto_55122 )
      ( MAKE-6PILE ?auto_55118 ?auto_55119 ?auto_55120 ?auto_55121 ?auto_55122 ?auto_55123 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55124 - BLOCK
      ?auto_55125 - BLOCK
      ?auto_55126 - BLOCK
      ?auto_55127 - BLOCK
      ?auto_55128 - BLOCK
      ?auto_55129 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55124 ) ( ON ?auto_55125 ?auto_55124 ) ( ON ?auto_55126 ?auto_55125 ) ( ON ?auto_55127 ?auto_55126 ) ( not ( = ?auto_55124 ?auto_55125 ) ) ( not ( = ?auto_55124 ?auto_55126 ) ) ( not ( = ?auto_55124 ?auto_55127 ) ) ( not ( = ?auto_55124 ?auto_55128 ) ) ( not ( = ?auto_55124 ?auto_55129 ) ) ( not ( = ?auto_55125 ?auto_55126 ) ) ( not ( = ?auto_55125 ?auto_55127 ) ) ( not ( = ?auto_55125 ?auto_55128 ) ) ( not ( = ?auto_55125 ?auto_55129 ) ) ( not ( = ?auto_55126 ?auto_55127 ) ) ( not ( = ?auto_55126 ?auto_55128 ) ) ( not ( = ?auto_55126 ?auto_55129 ) ) ( not ( = ?auto_55127 ?auto_55128 ) ) ( not ( = ?auto_55127 ?auto_55129 ) ) ( not ( = ?auto_55128 ?auto_55129 ) ) ( ON-TABLE ?auto_55129 ) ( CLEAR ?auto_55127 ) ( ON ?auto_55128 ?auto_55129 ) ( CLEAR ?auto_55128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_55129 )
      ( MAKE-6PILE ?auto_55124 ?auto_55125 ?auto_55126 ?auto_55127 ?auto_55128 ?auto_55129 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55130 - BLOCK
      ?auto_55131 - BLOCK
      ?auto_55132 - BLOCK
      ?auto_55133 - BLOCK
      ?auto_55134 - BLOCK
      ?auto_55135 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55130 ) ( ON ?auto_55131 ?auto_55130 ) ( ON ?auto_55132 ?auto_55131 ) ( not ( = ?auto_55130 ?auto_55131 ) ) ( not ( = ?auto_55130 ?auto_55132 ) ) ( not ( = ?auto_55130 ?auto_55133 ) ) ( not ( = ?auto_55130 ?auto_55134 ) ) ( not ( = ?auto_55130 ?auto_55135 ) ) ( not ( = ?auto_55131 ?auto_55132 ) ) ( not ( = ?auto_55131 ?auto_55133 ) ) ( not ( = ?auto_55131 ?auto_55134 ) ) ( not ( = ?auto_55131 ?auto_55135 ) ) ( not ( = ?auto_55132 ?auto_55133 ) ) ( not ( = ?auto_55132 ?auto_55134 ) ) ( not ( = ?auto_55132 ?auto_55135 ) ) ( not ( = ?auto_55133 ?auto_55134 ) ) ( not ( = ?auto_55133 ?auto_55135 ) ) ( not ( = ?auto_55134 ?auto_55135 ) ) ( ON-TABLE ?auto_55135 ) ( ON ?auto_55134 ?auto_55135 ) ( CLEAR ?auto_55134 ) ( HOLDING ?auto_55133 ) ( CLEAR ?auto_55132 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_55130 ?auto_55131 ?auto_55132 ?auto_55133 )
      ( MAKE-6PILE ?auto_55130 ?auto_55131 ?auto_55132 ?auto_55133 ?auto_55134 ?auto_55135 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55136 - BLOCK
      ?auto_55137 - BLOCK
      ?auto_55138 - BLOCK
      ?auto_55139 - BLOCK
      ?auto_55140 - BLOCK
      ?auto_55141 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55136 ) ( ON ?auto_55137 ?auto_55136 ) ( ON ?auto_55138 ?auto_55137 ) ( not ( = ?auto_55136 ?auto_55137 ) ) ( not ( = ?auto_55136 ?auto_55138 ) ) ( not ( = ?auto_55136 ?auto_55139 ) ) ( not ( = ?auto_55136 ?auto_55140 ) ) ( not ( = ?auto_55136 ?auto_55141 ) ) ( not ( = ?auto_55137 ?auto_55138 ) ) ( not ( = ?auto_55137 ?auto_55139 ) ) ( not ( = ?auto_55137 ?auto_55140 ) ) ( not ( = ?auto_55137 ?auto_55141 ) ) ( not ( = ?auto_55138 ?auto_55139 ) ) ( not ( = ?auto_55138 ?auto_55140 ) ) ( not ( = ?auto_55138 ?auto_55141 ) ) ( not ( = ?auto_55139 ?auto_55140 ) ) ( not ( = ?auto_55139 ?auto_55141 ) ) ( not ( = ?auto_55140 ?auto_55141 ) ) ( ON-TABLE ?auto_55141 ) ( ON ?auto_55140 ?auto_55141 ) ( CLEAR ?auto_55138 ) ( ON ?auto_55139 ?auto_55140 ) ( CLEAR ?auto_55139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_55141 ?auto_55140 )
      ( MAKE-6PILE ?auto_55136 ?auto_55137 ?auto_55138 ?auto_55139 ?auto_55140 ?auto_55141 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55142 - BLOCK
      ?auto_55143 - BLOCK
      ?auto_55144 - BLOCK
      ?auto_55145 - BLOCK
      ?auto_55146 - BLOCK
      ?auto_55147 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55142 ) ( ON ?auto_55143 ?auto_55142 ) ( not ( = ?auto_55142 ?auto_55143 ) ) ( not ( = ?auto_55142 ?auto_55144 ) ) ( not ( = ?auto_55142 ?auto_55145 ) ) ( not ( = ?auto_55142 ?auto_55146 ) ) ( not ( = ?auto_55142 ?auto_55147 ) ) ( not ( = ?auto_55143 ?auto_55144 ) ) ( not ( = ?auto_55143 ?auto_55145 ) ) ( not ( = ?auto_55143 ?auto_55146 ) ) ( not ( = ?auto_55143 ?auto_55147 ) ) ( not ( = ?auto_55144 ?auto_55145 ) ) ( not ( = ?auto_55144 ?auto_55146 ) ) ( not ( = ?auto_55144 ?auto_55147 ) ) ( not ( = ?auto_55145 ?auto_55146 ) ) ( not ( = ?auto_55145 ?auto_55147 ) ) ( not ( = ?auto_55146 ?auto_55147 ) ) ( ON-TABLE ?auto_55147 ) ( ON ?auto_55146 ?auto_55147 ) ( ON ?auto_55145 ?auto_55146 ) ( CLEAR ?auto_55145 ) ( HOLDING ?auto_55144 ) ( CLEAR ?auto_55143 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55142 ?auto_55143 ?auto_55144 )
      ( MAKE-6PILE ?auto_55142 ?auto_55143 ?auto_55144 ?auto_55145 ?auto_55146 ?auto_55147 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55148 - BLOCK
      ?auto_55149 - BLOCK
      ?auto_55150 - BLOCK
      ?auto_55151 - BLOCK
      ?auto_55152 - BLOCK
      ?auto_55153 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55148 ) ( ON ?auto_55149 ?auto_55148 ) ( not ( = ?auto_55148 ?auto_55149 ) ) ( not ( = ?auto_55148 ?auto_55150 ) ) ( not ( = ?auto_55148 ?auto_55151 ) ) ( not ( = ?auto_55148 ?auto_55152 ) ) ( not ( = ?auto_55148 ?auto_55153 ) ) ( not ( = ?auto_55149 ?auto_55150 ) ) ( not ( = ?auto_55149 ?auto_55151 ) ) ( not ( = ?auto_55149 ?auto_55152 ) ) ( not ( = ?auto_55149 ?auto_55153 ) ) ( not ( = ?auto_55150 ?auto_55151 ) ) ( not ( = ?auto_55150 ?auto_55152 ) ) ( not ( = ?auto_55150 ?auto_55153 ) ) ( not ( = ?auto_55151 ?auto_55152 ) ) ( not ( = ?auto_55151 ?auto_55153 ) ) ( not ( = ?auto_55152 ?auto_55153 ) ) ( ON-TABLE ?auto_55153 ) ( ON ?auto_55152 ?auto_55153 ) ( ON ?auto_55151 ?auto_55152 ) ( CLEAR ?auto_55149 ) ( ON ?auto_55150 ?auto_55151 ) ( CLEAR ?auto_55150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55153 ?auto_55152 ?auto_55151 )
      ( MAKE-6PILE ?auto_55148 ?auto_55149 ?auto_55150 ?auto_55151 ?auto_55152 ?auto_55153 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55154 - BLOCK
      ?auto_55155 - BLOCK
      ?auto_55156 - BLOCK
      ?auto_55157 - BLOCK
      ?auto_55158 - BLOCK
      ?auto_55159 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55154 ) ( not ( = ?auto_55154 ?auto_55155 ) ) ( not ( = ?auto_55154 ?auto_55156 ) ) ( not ( = ?auto_55154 ?auto_55157 ) ) ( not ( = ?auto_55154 ?auto_55158 ) ) ( not ( = ?auto_55154 ?auto_55159 ) ) ( not ( = ?auto_55155 ?auto_55156 ) ) ( not ( = ?auto_55155 ?auto_55157 ) ) ( not ( = ?auto_55155 ?auto_55158 ) ) ( not ( = ?auto_55155 ?auto_55159 ) ) ( not ( = ?auto_55156 ?auto_55157 ) ) ( not ( = ?auto_55156 ?auto_55158 ) ) ( not ( = ?auto_55156 ?auto_55159 ) ) ( not ( = ?auto_55157 ?auto_55158 ) ) ( not ( = ?auto_55157 ?auto_55159 ) ) ( not ( = ?auto_55158 ?auto_55159 ) ) ( ON-TABLE ?auto_55159 ) ( ON ?auto_55158 ?auto_55159 ) ( ON ?auto_55157 ?auto_55158 ) ( ON ?auto_55156 ?auto_55157 ) ( CLEAR ?auto_55156 ) ( HOLDING ?auto_55155 ) ( CLEAR ?auto_55154 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_55154 ?auto_55155 )
      ( MAKE-6PILE ?auto_55154 ?auto_55155 ?auto_55156 ?auto_55157 ?auto_55158 ?auto_55159 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55160 - BLOCK
      ?auto_55161 - BLOCK
      ?auto_55162 - BLOCK
      ?auto_55163 - BLOCK
      ?auto_55164 - BLOCK
      ?auto_55165 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55160 ) ( not ( = ?auto_55160 ?auto_55161 ) ) ( not ( = ?auto_55160 ?auto_55162 ) ) ( not ( = ?auto_55160 ?auto_55163 ) ) ( not ( = ?auto_55160 ?auto_55164 ) ) ( not ( = ?auto_55160 ?auto_55165 ) ) ( not ( = ?auto_55161 ?auto_55162 ) ) ( not ( = ?auto_55161 ?auto_55163 ) ) ( not ( = ?auto_55161 ?auto_55164 ) ) ( not ( = ?auto_55161 ?auto_55165 ) ) ( not ( = ?auto_55162 ?auto_55163 ) ) ( not ( = ?auto_55162 ?auto_55164 ) ) ( not ( = ?auto_55162 ?auto_55165 ) ) ( not ( = ?auto_55163 ?auto_55164 ) ) ( not ( = ?auto_55163 ?auto_55165 ) ) ( not ( = ?auto_55164 ?auto_55165 ) ) ( ON-TABLE ?auto_55165 ) ( ON ?auto_55164 ?auto_55165 ) ( ON ?auto_55163 ?auto_55164 ) ( ON ?auto_55162 ?auto_55163 ) ( CLEAR ?auto_55160 ) ( ON ?auto_55161 ?auto_55162 ) ( CLEAR ?auto_55161 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_55165 ?auto_55164 ?auto_55163 ?auto_55162 )
      ( MAKE-6PILE ?auto_55160 ?auto_55161 ?auto_55162 ?auto_55163 ?auto_55164 ?auto_55165 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55166 - BLOCK
      ?auto_55167 - BLOCK
      ?auto_55168 - BLOCK
      ?auto_55169 - BLOCK
      ?auto_55170 - BLOCK
      ?auto_55171 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55166 ?auto_55167 ) ) ( not ( = ?auto_55166 ?auto_55168 ) ) ( not ( = ?auto_55166 ?auto_55169 ) ) ( not ( = ?auto_55166 ?auto_55170 ) ) ( not ( = ?auto_55166 ?auto_55171 ) ) ( not ( = ?auto_55167 ?auto_55168 ) ) ( not ( = ?auto_55167 ?auto_55169 ) ) ( not ( = ?auto_55167 ?auto_55170 ) ) ( not ( = ?auto_55167 ?auto_55171 ) ) ( not ( = ?auto_55168 ?auto_55169 ) ) ( not ( = ?auto_55168 ?auto_55170 ) ) ( not ( = ?auto_55168 ?auto_55171 ) ) ( not ( = ?auto_55169 ?auto_55170 ) ) ( not ( = ?auto_55169 ?auto_55171 ) ) ( not ( = ?auto_55170 ?auto_55171 ) ) ( ON-TABLE ?auto_55171 ) ( ON ?auto_55170 ?auto_55171 ) ( ON ?auto_55169 ?auto_55170 ) ( ON ?auto_55168 ?auto_55169 ) ( ON ?auto_55167 ?auto_55168 ) ( CLEAR ?auto_55167 ) ( HOLDING ?auto_55166 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_55166 )
      ( MAKE-6PILE ?auto_55166 ?auto_55167 ?auto_55168 ?auto_55169 ?auto_55170 ?auto_55171 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55172 - BLOCK
      ?auto_55173 - BLOCK
      ?auto_55174 - BLOCK
      ?auto_55175 - BLOCK
      ?auto_55176 - BLOCK
      ?auto_55177 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55172 ?auto_55173 ) ) ( not ( = ?auto_55172 ?auto_55174 ) ) ( not ( = ?auto_55172 ?auto_55175 ) ) ( not ( = ?auto_55172 ?auto_55176 ) ) ( not ( = ?auto_55172 ?auto_55177 ) ) ( not ( = ?auto_55173 ?auto_55174 ) ) ( not ( = ?auto_55173 ?auto_55175 ) ) ( not ( = ?auto_55173 ?auto_55176 ) ) ( not ( = ?auto_55173 ?auto_55177 ) ) ( not ( = ?auto_55174 ?auto_55175 ) ) ( not ( = ?auto_55174 ?auto_55176 ) ) ( not ( = ?auto_55174 ?auto_55177 ) ) ( not ( = ?auto_55175 ?auto_55176 ) ) ( not ( = ?auto_55175 ?auto_55177 ) ) ( not ( = ?auto_55176 ?auto_55177 ) ) ( ON-TABLE ?auto_55177 ) ( ON ?auto_55176 ?auto_55177 ) ( ON ?auto_55175 ?auto_55176 ) ( ON ?auto_55174 ?auto_55175 ) ( ON ?auto_55173 ?auto_55174 ) ( ON ?auto_55172 ?auto_55173 ) ( CLEAR ?auto_55172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_55177 ?auto_55176 ?auto_55175 ?auto_55174 ?auto_55173 )
      ( MAKE-6PILE ?auto_55172 ?auto_55173 ?auto_55174 ?auto_55175 ?auto_55176 ?auto_55177 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55184 - BLOCK
      ?auto_55185 - BLOCK
      ?auto_55186 - BLOCK
      ?auto_55187 - BLOCK
      ?auto_55188 - BLOCK
      ?auto_55189 - BLOCK
    )
    :vars
    (
      ?auto_55190 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55184 ?auto_55185 ) ) ( not ( = ?auto_55184 ?auto_55186 ) ) ( not ( = ?auto_55184 ?auto_55187 ) ) ( not ( = ?auto_55184 ?auto_55188 ) ) ( not ( = ?auto_55184 ?auto_55189 ) ) ( not ( = ?auto_55185 ?auto_55186 ) ) ( not ( = ?auto_55185 ?auto_55187 ) ) ( not ( = ?auto_55185 ?auto_55188 ) ) ( not ( = ?auto_55185 ?auto_55189 ) ) ( not ( = ?auto_55186 ?auto_55187 ) ) ( not ( = ?auto_55186 ?auto_55188 ) ) ( not ( = ?auto_55186 ?auto_55189 ) ) ( not ( = ?auto_55187 ?auto_55188 ) ) ( not ( = ?auto_55187 ?auto_55189 ) ) ( not ( = ?auto_55188 ?auto_55189 ) ) ( ON-TABLE ?auto_55189 ) ( ON ?auto_55188 ?auto_55189 ) ( ON ?auto_55187 ?auto_55188 ) ( ON ?auto_55186 ?auto_55187 ) ( ON ?auto_55185 ?auto_55186 ) ( CLEAR ?auto_55185 ) ( ON ?auto_55184 ?auto_55190 ) ( CLEAR ?auto_55184 ) ( HAND-EMPTY ) ( not ( = ?auto_55184 ?auto_55190 ) ) ( not ( = ?auto_55185 ?auto_55190 ) ) ( not ( = ?auto_55186 ?auto_55190 ) ) ( not ( = ?auto_55187 ?auto_55190 ) ) ( not ( = ?auto_55188 ?auto_55190 ) ) ( not ( = ?auto_55189 ?auto_55190 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_55184 ?auto_55190 )
      ( MAKE-6PILE ?auto_55184 ?auto_55185 ?auto_55186 ?auto_55187 ?auto_55188 ?auto_55189 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55191 - BLOCK
      ?auto_55192 - BLOCK
      ?auto_55193 - BLOCK
      ?auto_55194 - BLOCK
      ?auto_55195 - BLOCK
      ?auto_55196 - BLOCK
    )
    :vars
    (
      ?auto_55197 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55191 ?auto_55192 ) ) ( not ( = ?auto_55191 ?auto_55193 ) ) ( not ( = ?auto_55191 ?auto_55194 ) ) ( not ( = ?auto_55191 ?auto_55195 ) ) ( not ( = ?auto_55191 ?auto_55196 ) ) ( not ( = ?auto_55192 ?auto_55193 ) ) ( not ( = ?auto_55192 ?auto_55194 ) ) ( not ( = ?auto_55192 ?auto_55195 ) ) ( not ( = ?auto_55192 ?auto_55196 ) ) ( not ( = ?auto_55193 ?auto_55194 ) ) ( not ( = ?auto_55193 ?auto_55195 ) ) ( not ( = ?auto_55193 ?auto_55196 ) ) ( not ( = ?auto_55194 ?auto_55195 ) ) ( not ( = ?auto_55194 ?auto_55196 ) ) ( not ( = ?auto_55195 ?auto_55196 ) ) ( ON-TABLE ?auto_55196 ) ( ON ?auto_55195 ?auto_55196 ) ( ON ?auto_55194 ?auto_55195 ) ( ON ?auto_55193 ?auto_55194 ) ( ON ?auto_55191 ?auto_55197 ) ( CLEAR ?auto_55191 ) ( not ( = ?auto_55191 ?auto_55197 ) ) ( not ( = ?auto_55192 ?auto_55197 ) ) ( not ( = ?auto_55193 ?auto_55197 ) ) ( not ( = ?auto_55194 ?auto_55197 ) ) ( not ( = ?auto_55195 ?auto_55197 ) ) ( not ( = ?auto_55196 ?auto_55197 ) ) ( HOLDING ?auto_55192 ) ( CLEAR ?auto_55193 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_55196 ?auto_55195 ?auto_55194 ?auto_55193 ?auto_55192 )
      ( MAKE-6PILE ?auto_55191 ?auto_55192 ?auto_55193 ?auto_55194 ?auto_55195 ?auto_55196 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55198 - BLOCK
      ?auto_55199 - BLOCK
      ?auto_55200 - BLOCK
      ?auto_55201 - BLOCK
      ?auto_55202 - BLOCK
      ?auto_55203 - BLOCK
    )
    :vars
    (
      ?auto_55204 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55198 ?auto_55199 ) ) ( not ( = ?auto_55198 ?auto_55200 ) ) ( not ( = ?auto_55198 ?auto_55201 ) ) ( not ( = ?auto_55198 ?auto_55202 ) ) ( not ( = ?auto_55198 ?auto_55203 ) ) ( not ( = ?auto_55199 ?auto_55200 ) ) ( not ( = ?auto_55199 ?auto_55201 ) ) ( not ( = ?auto_55199 ?auto_55202 ) ) ( not ( = ?auto_55199 ?auto_55203 ) ) ( not ( = ?auto_55200 ?auto_55201 ) ) ( not ( = ?auto_55200 ?auto_55202 ) ) ( not ( = ?auto_55200 ?auto_55203 ) ) ( not ( = ?auto_55201 ?auto_55202 ) ) ( not ( = ?auto_55201 ?auto_55203 ) ) ( not ( = ?auto_55202 ?auto_55203 ) ) ( ON-TABLE ?auto_55203 ) ( ON ?auto_55202 ?auto_55203 ) ( ON ?auto_55201 ?auto_55202 ) ( ON ?auto_55200 ?auto_55201 ) ( ON ?auto_55198 ?auto_55204 ) ( not ( = ?auto_55198 ?auto_55204 ) ) ( not ( = ?auto_55199 ?auto_55204 ) ) ( not ( = ?auto_55200 ?auto_55204 ) ) ( not ( = ?auto_55201 ?auto_55204 ) ) ( not ( = ?auto_55202 ?auto_55204 ) ) ( not ( = ?auto_55203 ?auto_55204 ) ) ( CLEAR ?auto_55200 ) ( ON ?auto_55199 ?auto_55198 ) ( CLEAR ?auto_55199 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_55204 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_55204 ?auto_55198 )
      ( MAKE-6PILE ?auto_55198 ?auto_55199 ?auto_55200 ?auto_55201 ?auto_55202 ?auto_55203 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55205 - BLOCK
      ?auto_55206 - BLOCK
      ?auto_55207 - BLOCK
      ?auto_55208 - BLOCK
      ?auto_55209 - BLOCK
      ?auto_55210 - BLOCK
    )
    :vars
    (
      ?auto_55211 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55205 ?auto_55206 ) ) ( not ( = ?auto_55205 ?auto_55207 ) ) ( not ( = ?auto_55205 ?auto_55208 ) ) ( not ( = ?auto_55205 ?auto_55209 ) ) ( not ( = ?auto_55205 ?auto_55210 ) ) ( not ( = ?auto_55206 ?auto_55207 ) ) ( not ( = ?auto_55206 ?auto_55208 ) ) ( not ( = ?auto_55206 ?auto_55209 ) ) ( not ( = ?auto_55206 ?auto_55210 ) ) ( not ( = ?auto_55207 ?auto_55208 ) ) ( not ( = ?auto_55207 ?auto_55209 ) ) ( not ( = ?auto_55207 ?auto_55210 ) ) ( not ( = ?auto_55208 ?auto_55209 ) ) ( not ( = ?auto_55208 ?auto_55210 ) ) ( not ( = ?auto_55209 ?auto_55210 ) ) ( ON-TABLE ?auto_55210 ) ( ON ?auto_55209 ?auto_55210 ) ( ON ?auto_55208 ?auto_55209 ) ( ON ?auto_55205 ?auto_55211 ) ( not ( = ?auto_55205 ?auto_55211 ) ) ( not ( = ?auto_55206 ?auto_55211 ) ) ( not ( = ?auto_55207 ?auto_55211 ) ) ( not ( = ?auto_55208 ?auto_55211 ) ) ( not ( = ?auto_55209 ?auto_55211 ) ) ( not ( = ?auto_55210 ?auto_55211 ) ) ( ON ?auto_55206 ?auto_55205 ) ( CLEAR ?auto_55206 ) ( ON-TABLE ?auto_55211 ) ( HOLDING ?auto_55207 ) ( CLEAR ?auto_55208 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_55210 ?auto_55209 ?auto_55208 ?auto_55207 )
      ( MAKE-6PILE ?auto_55205 ?auto_55206 ?auto_55207 ?auto_55208 ?auto_55209 ?auto_55210 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55212 - BLOCK
      ?auto_55213 - BLOCK
      ?auto_55214 - BLOCK
      ?auto_55215 - BLOCK
      ?auto_55216 - BLOCK
      ?auto_55217 - BLOCK
    )
    :vars
    (
      ?auto_55218 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55212 ?auto_55213 ) ) ( not ( = ?auto_55212 ?auto_55214 ) ) ( not ( = ?auto_55212 ?auto_55215 ) ) ( not ( = ?auto_55212 ?auto_55216 ) ) ( not ( = ?auto_55212 ?auto_55217 ) ) ( not ( = ?auto_55213 ?auto_55214 ) ) ( not ( = ?auto_55213 ?auto_55215 ) ) ( not ( = ?auto_55213 ?auto_55216 ) ) ( not ( = ?auto_55213 ?auto_55217 ) ) ( not ( = ?auto_55214 ?auto_55215 ) ) ( not ( = ?auto_55214 ?auto_55216 ) ) ( not ( = ?auto_55214 ?auto_55217 ) ) ( not ( = ?auto_55215 ?auto_55216 ) ) ( not ( = ?auto_55215 ?auto_55217 ) ) ( not ( = ?auto_55216 ?auto_55217 ) ) ( ON-TABLE ?auto_55217 ) ( ON ?auto_55216 ?auto_55217 ) ( ON ?auto_55215 ?auto_55216 ) ( ON ?auto_55212 ?auto_55218 ) ( not ( = ?auto_55212 ?auto_55218 ) ) ( not ( = ?auto_55213 ?auto_55218 ) ) ( not ( = ?auto_55214 ?auto_55218 ) ) ( not ( = ?auto_55215 ?auto_55218 ) ) ( not ( = ?auto_55216 ?auto_55218 ) ) ( not ( = ?auto_55217 ?auto_55218 ) ) ( ON ?auto_55213 ?auto_55212 ) ( ON-TABLE ?auto_55218 ) ( CLEAR ?auto_55215 ) ( ON ?auto_55214 ?auto_55213 ) ( CLEAR ?auto_55214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55218 ?auto_55212 ?auto_55213 )
      ( MAKE-6PILE ?auto_55212 ?auto_55213 ?auto_55214 ?auto_55215 ?auto_55216 ?auto_55217 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55219 - BLOCK
      ?auto_55220 - BLOCK
      ?auto_55221 - BLOCK
      ?auto_55222 - BLOCK
      ?auto_55223 - BLOCK
      ?auto_55224 - BLOCK
    )
    :vars
    (
      ?auto_55225 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55219 ?auto_55220 ) ) ( not ( = ?auto_55219 ?auto_55221 ) ) ( not ( = ?auto_55219 ?auto_55222 ) ) ( not ( = ?auto_55219 ?auto_55223 ) ) ( not ( = ?auto_55219 ?auto_55224 ) ) ( not ( = ?auto_55220 ?auto_55221 ) ) ( not ( = ?auto_55220 ?auto_55222 ) ) ( not ( = ?auto_55220 ?auto_55223 ) ) ( not ( = ?auto_55220 ?auto_55224 ) ) ( not ( = ?auto_55221 ?auto_55222 ) ) ( not ( = ?auto_55221 ?auto_55223 ) ) ( not ( = ?auto_55221 ?auto_55224 ) ) ( not ( = ?auto_55222 ?auto_55223 ) ) ( not ( = ?auto_55222 ?auto_55224 ) ) ( not ( = ?auto_55223 ?auto_55224 ) ) ( ON-TABLE ?auto_55224 ) ( ON ?auto_55223 ?auto_55224 ) ( ON ?auto_55219 ?auto_55225 ) ( not ( = ?auto_55219 ?auto_55225 ) ) ( not ( = ?auto_55220 ?auto_55225 ) ) ( not ( = ?auto_55221 ?auto_55225 ) ) ( not ( = ?auto_55222 ?auto_55225 ) ) ( not ( = ?auto_55223 ?auto_55225 ) ) ( not ( = ?auto_55224 ?auto_55225 ) ) ( ON ?auto_55220 ?auto_55219 ) ( ON-TABLE ?auto_55225 ) ( ON ?auto_55221 ?auto_55220 ) ( CLEAR ?auto_55221 ) ( HOLDING ?auto_55222 ) ( CLEAR ?auto_55223 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55224 ?auto_55223 ?auto_55222 )
      ( MAKE-6PILE ?auto_55219 ?auto_55220 ?auto_55221 ?auto_55222 ?auto_55223 ?auto_55224 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55226 - BLOCK
      ?auto_55227 - BLOCK
      ?auto_55228 - BLOCK
      ?auto_55229 - BLOCK
      ?auto_55230 - BLOCK
      ?auto_55231 - BLOCK
    )
    :vars
    (
      ?auto_55232 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55226 ?auto_55227 ) ) ( not ( = ?auto_55226 ?auto_55228 ) ) ( not ( = ?auto_55226 ?auto_55229 ) ) ( not ( = ?auto_55226 ?auto_55230 ) ) ( not ( = ?auto_55226 ?auto_55231 ) ) ( not ( = ?auto_55227 ?auto_55228 ) ) ( not ( = ?auto_55227 ?auto_55229 ) ) ( not ( = ?auto_55227 ?auto_55230 ) ) ( not ( = ?auto_55227 ?auto_55231 ) ) ( not ( = ?auto_55228 ?auto_55229 ) ) ( not ( = ?auto_55228 ?auto_55230 ) ) ( not ( = ?auto_55228 ?auto_55231 ) ) ( not ( = ?auto_55229 ?auto_55230 ) ) ( not ( = ?auto_55229 ?auto_55231 ) ) ( not ( = ?auto_55230 ?auto_55231 ) ) ( ON-TABLE ?auto_55231 ) ( ON ?auto_55230 ?auto_55231 ) ( ON ?auto_55226 ?auto_55232 ) ( not ( = ?auto_55226 ?auto_55232 ) ) ( not ( = ?auto_55227 ?auto_55232 ) ) ( not ( = ?auto_55228 ?auto_55232 ) ) ( not ( = ?auto_55229 ?auto_55232 ) ) ( not ( = ?auto_55230 ?auto_55232 ) ) ( not ( = ?auto_55231 ?auto_55232 ) ) ( ON ?auto_55227 ?auto_55226 ) ( ON-TABLE ?auto_55232 ) ( ON ?auto_55228 ?auto_55227 ) ( CLEAR ?auto_55230 ) ( ON ?auto_55229 ?auto_55228 ) ( CLEAR ?auto_55229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_55232 ?auto_55226 ?auto_55227 ?auto_55228 )
      ( MAKE-6PILE ?auto_55226 ?auto_55227 ?auto_55228 ?auto_55229 ?auto_55230 ?auto_55231 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55233 - BLOCK
      ?auto_55234 - BLOCK
      ?auto_55235 - BLOCK
      ?auto_55236 - BLOCK
      ?auto_55237 - BLOCK
      ?auto_55238 - BLOCK
    )
    :vars
    (
      ?auto_55239 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55233 ?auto_55234 ) ) ( not ( = ?auto_55233 ?auto_55235 ) ) ( not ( = ?auto_55233 ?auto_55236 ) ) ( not ( = ?auto_55233 ?auto_55237 ) ) ( not ( = ?auto_55233 ?auto_55238 ) ) ( not ( = ?auto_55234 ?auto_55235 ) ) ( not ( = ?auto_55234 ?auto_55236 ) ) ( not ( = ?auto_55234 ?auto_55237 ) ) ( not ( = ?auto_55234 ?auto_55238 ) ) ( not ( = ?auto_55235 ?auto_55236 ) ) ( not ( = ?auto_55235 ?auto_55237 ) ) ( not ( = ?auto_55235 ?auto_55238 ) ) ( not ( = ?auto_55236 ?auto_55237 ) ) ( not ( = ?auto_55236 ?auto_55238 ) ) ( not ( = ?auto_55237 ?auto_55238 ) ) ( ON-TABLE ?auto_55238 ) ( ON ?auto_55233 ?auto_55239 ) ( not ( = ?auto_55233 ?auto_55239 ) ) ( not ( = ?auto_55234 ?auto_55239 ) ) ( not ( = ?auto_55235 ?auto_55239 ) ) ( not ( = ?auto_55236 ?auto_55239 ) ) ( not ( = ?auto_55237 ?auto_55239 ) ) ( not ( = ?auto_55238 ?auto_55239 ) ) ( ON ?auto_55234 ?auto_55233 ) ( ON-TABLE ?auto_55239 ) ( ON ?auto_55235 ?auto_55234 ) ( ON ?auto_55236 ?auto_55235 ) ( CLEAR ?auto_55236 ) ( HOLDING ?auto_55237 ) ( CLEAR ?auto_55238 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_55238 ?auto_55237 )
      ( MAKE-6PILE ?auto_55233 ?auto_55234 ?auto_55235 ?auto_55236 ?auto_55237 ?auto_55238 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55240 - BLOCK
      ?auto_55241 - BLOCK
      ?auto_55242 - BLOCK
      ?auto_55243 - BLOCK
      ?auto_55244 - BLOCK
      ?auto_55245 - BLOCK
    )
    :vars
    (
      ?auto_55246 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55240 ?auto_55241 ) ) ( not ( = ?auto_55240 ?auto_55242 ) ) ( not ( = ?auto_55240 ?auto_55243 ) ) ( not ( = ?auto_55240 ?auto_55244 ) ) ( not ( = ?auto_55240 ?auto_55245 ) ) ( not ( = ?auto_55241 ?auto_55242 ) ) ( not ( = ?auto_55241 ?auto_55243 ) ) ( not ( = ?auto_55241 ?auto_55244 ) ) ( not ( = ?auto_55241 ?auto_55245 ) ) ( not ( = ?auto_55242 ?auto_55243 ) ) ( not ( = ?auto_55242 ?auto_55244 ) ) ( not ( = ?auto_55242 ?auto_55245 ) ) ( not ( = ?auto_55243 ?auto_55244 ) ) ( not ( = ?auto_55243 ?auto_55245 ) ) ( not ( = ?auto_55244 ?auto_55245 ) ) ( ON-TABLE ?auto_55245 ) ( ON ?auto_55240 ?auto_55246 ) ( not ( = ?auto_55240 ?auto_55246 ) ) ( not ( = ?auto_55241 ?auto_55246 ) ) ( not ( = ?auto_55242 ?auto_55246 ) ) ( not ( = ?auto_55243 ?auto_55246 ) ) ( not ( = ?auto_55244 ?auto_55246 ) ) ( not ( = ?auto_55245 ?auto_55246 ) ) ( ON ?auto_55241 ?auto_55240 ) ( ON-TABLE ?auto_55246 ) ( ON ?auto_55242 ?auto_55241 ) ( ON ?auto_55243 ?auto_55242 ) ( CLEAR ?auto_55245 ) ( ON ?auto_55244 ?auto_55243 ) ( CLEAR ?auto_55244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_55246 ?auto_55240 ?auto_55241 ?auto_55242 ?auto_55243 )
      ( MAKE-6PILE ?auto_55240 ?auto_55241 ?auto_55242 ?auto_55243 ?auto_55244 ?auto_55245 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55247 - BLOCK
      ?auto_55248 - BLOCK
      ?auto_55249 - BLOCK
      ?auto_55250 - BLOCK
      ?auto_55251 - BLOCK
      ?auto_55252 - BLOCK
    )
    :vars
    (
      ?auto_55253 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55247 ?auto_55248 ) ) ( not ( = ?auto_55247 ?auto_55249 ) ) ( not ( = ?auto_55247 ?auto_55250 ) ) ( not ( = ?auto_55247 ?auto_55251 ) ) ( not ( = ?auto_55247 ?auto_55252 ) ) ( not ( = ?auto_55248 ?auto_55249 ) ) ( not ( = ?auto_55248 ?auto_55250 ) ) ( not ( = ?auto_55248 ?auto_55251 ) ) ( not ( = ?auto_55248 ?auto_55252 ) ) ( not ( = ?auto_55249 ?auto_55250 ) ) ( not ( = ?auto_55249 ?auto_55251 ) ) ( not ( = ?auto_55249 ?auto_55252 ) ) ( not ( = ?auto_55250 ?auto_55251 ) ) ( not ( = ?auto_55250 ?auto_55252 ) ) ( not ( = ?auto_55251 ?auto_55252 ) ) ( ON ?auto_55247 ?auto_55253 ) ( not ( = ?auto_55247 ?auto_55253 ) ) ( not ( = ?auto_55248 ?auto_55253 ) ) ( not ( = ?auto_55249 ?auto_55253 ) ) ( not ( = ?auto_55250 ?auto_55253 ) ) ( not ( = ?auto_55251 ?auto_55253 ) ) ( not ( = ?auto_55252 ?auto_55253 ) ) ( ON ?auto_55248 ?auto_55247 ) ( ON-TABLE ?auto_55253 ) ( ON ?auto_55249 ?auto_55248 ) ( ON ?auto_55250 ?auto_55249 ) ( ON ?auto_55251 ?auto_55250 ) ( CLEAR ?auto_55251 ) ( HOLDING ?auto_55252 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_55252 )
      ( MAKE-6PILE ?auto_55247 ?auto_55248 ?auto_55249 ?auto_55250 ?auto_55251 ?auto_55252 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55254 - BLOCK
      ?auto_55255 - BLOCK
      ?auto_55256 - BLOCK
      ?auto_55257 - BLOCK
      ?auto_55258 - BLOCK
      ?auto_55259 - BLOCK
    )
    :vars
    (
      ?auto_55260 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55254 ?auto_55255 ) ) ( not ( = ?auto_55254 ?auto_55256 ) ) ( not ( = ?auto_55254 ?auto_55257 ) ) ( not ( = ?auto_55254 ?auto_55258 ) ) ( not ( = ?auto_55254 ?auto_55259 ) ) ( not ( = ?auto_55255 ?auto_55256 ) ) ( not ( = ?auto_55255 ?auto_55257 ) ) ( not ( = ?auto_55255 ?auto_55258 ) ) ( not ( = ?auto_55255 ?auto_55259 ) ) ( not ( = ?auto_55256 ?auto_55257 ) ) ( not ( = ?auto_55256 ?auto_55258 ) ) ( not ( = ?auto_55256 ?auto_55259 ) ) ( not ( = ?auto_55257 ?auto_55258 ) ) ( not ( = ?auto_55257 ?auto_55259 ) ) ( not ( = ?auto_55258 ?auto_55259 ) ) ( ON ?auto_55254 ?auto_55260 ) ( not ( = ?auto_55254 ?auto_55260 ) ) ( not ( = ?auto_55255 ?auto_55260 ) ) ( not ( = ?auto_55256 ?auto_55260 ) ) ( not ( = ?auto_55257 ?auto_55260 ) ) ( not ( = ?auto_55258 ?auto_55260 ) ) ( not ( = ?auto_55259 ?auto_55260 ) ) ( ON ?auto_55255 ?auto_55254 ) ( ON-TABLE ?auto_55260 ) ( ON ?auto_55256 ?auto_55255 ) ( ON ?auto_55257 ?auto_55256 ) ( ON ?auto_55258 ?auto_55257 ) ( ON ?auto_55259 ?auto_55258 ) ( CLEAR ?auto_55259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_55260 ?auto_55254 ?auto_55255 ?auto_55256 ?auto_55257 ?auto_55258 )
      ( MAKE-6PILE ?auto_55254 ?auto_55255 ?auto_55256 ?auto_55257 ?auto_55258 ?auto_55259 ) )
  )

)

