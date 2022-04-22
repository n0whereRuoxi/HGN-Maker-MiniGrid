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
      ?auto_115703 - BLOCK
      ?auto_115704 - BLOCK
      ?auto_115705 - BLOCK
      ?auto_115706 - BLOCK
      ?auto_115707 - BLOCK
      ?auto_115708 - BLOCK
      ?auto_115709 - BLOCK
    )
    :vars
    (
      ?auto_115710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115710 ?auto_115709 ) ( CLEAR ?auto_115710 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_115703 ) ( ON ?auto_115704 ?auto_115703 ) ( ON ?auto_115705 ?auto_115704 ) ( ON ?auto_115706 ?auto_115705 ) ( ON ?auto_115707 ?auto_115706 ) ( ON ?auto_115708 ?auto_115707 ) ( ON ?auto_115709 ?auto_115708 ) ( not ( = ?auto_115703 ?auto_115704 ) ) ( not ( = ?auto_115703 ?auto_115705 ) ) ( not ( = ?auto_115703 ?auto_115706 ) ) ( not ( = ?auto_115703 ?auto_115707 ) ) ( not ( = ?auto_115703 ?auto_115708 ) ) ( not ( = ?auto_115703 ?auto_115709 ) ) ( not ( = ?auto_115703 ?auto_115710 ) ) ( not ( = ?auto_115704 ?auto_115705 ) ) ( not ( = ?auto_115704 ?auto_115706 ) ) ( not ( = ?auto_115704 ?auto_115707 ) ) ( not ( = ?auto_115704 ?auto_115708 ) ) ( not ( = ?auto_115704 ?auto_115709 ) ) ( not ( = ?auto_115704 ?auto_115710 ) ) ( not ( = ?auto_115705 ?auto_115706 ) ) ( not ( = ?auto_115705 ?auto_115707 ) ) ( not ( = ?auto_115705 ?auto_115708 ) ) ( not ( = ?auto_115705 ?auto_115709 ) ) ( not ( = ?auto_115705 ?auto_115710 ) ) ( not ( = ?auto_115706 ?auto_115707 ) ) ( not ( = ?auto_115706 ?auto_115708 ) ) ( not ( = ?auto_115706 ?auto_115709 ) ) ( not ( = ?auto_115706 ?auto_115710 ) ) ( not ( = ?auto_115707 ?auto_115708 ) ) ( not ( = ?auto_115707 ?auto_115709 ) ) ( not ( = ?auto_115707 ?auto_115710 ) ) ( not ( = ?auto_115708 ?auto_115709 ) ) ( not ( = ?auto_115708 ?auto_115710 ) ) ( not ( = ?auto_115709 ?auto_115710 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_115710 ?auto_115709 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_115712 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_115712 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_115712 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_115713 - BLOCK
    )
    :vars
    (
      ?auto_115714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115713 ?auto_115714 ) ( CLEAR ?auto_115713 ) ( HAND-EMPTY ) ( not ( = ?auto_115713 ?auto_115714 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_115713 ?auto_115714 )
      ( MAKE-1PILE ?auto_115713 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_115721 - BLOCK
      ?auto_115722 - BLOCK
      ?auto_115723 - BLOCK
      ?auto_115724 - BLOCK
      ?auto_115725 - BLOCK
      ?auto_115726 - BLOCK
    )
    :vars
    (
      ?auto_115727 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115727 ?auto_115726 ) ( CLEAR ?auto_115727 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_115721 ) ( ON ?auto_115722 ?auto_115721 ) ( ON ?auto_115723 ?auto_115722 ) ( ON ?auto_115724 ?auto_115723 ) ( ON ?auto_115725 ?auto_115724 ) ( ON ?auto_115726 ?auto_115725 ) ( not ( = ?auto_115721 ?auto_115722 ) ) ( not ( = ?auto_115721 ?auto_115723 ) ) ( not ( = ?auto_115721 ?auto_115724 ) ) ( not ( = ?auto_115721 ?auto_115725 ) ) ( not ( = ?auto_115721 ?auto_115726 ) ) ( not ( = ?auto_115721 ?auto_115727 ) ) ( not ( = ?auto_115722 ?auto_115723 ) ) ( not ( = ?auto_115722 ?auto_115724 ) ) ( not ( = ?auto_115722 ?auto_115725 ) ) ( not ( = ?auto_115722 ?auto_115726 ) ) ( not ( = ?auto_115722 ?auto_115727 ) ) ( not ( = ?auto_115723 ?auto_115724 ) ) ( not ( = ?auto_115723 ?auto_115725 ) ) ( not ( = ?auto_115723 ?auto_115726 ) ) ( not ( = ?auto_115723 ?auto_115727 ) ) ( not ( = ?auto_115724 ?auto_115725 ) ) ( not ( = ?auto_115724 ?auto_115726 ) ) ( not ( = ?auto_115724 ?auto_115727 ) ) ( not ( = ?auto_115725 ?auto_115726 ) ) ( not ( = ?auto_115725 ?auto_115727 ) ) ( not ( = ?auto_115726 ?auto_115727 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_115727 ?auto_115726 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_115728 - BLOCK
      ?auto_115729 - BLOCK
      ?auto_115730 - BLOCK
      ?auto_115731 - BLOCK
      ?auto_115732 - BLOCK
      ?auto_115733 - BLOCK
    )
    :vars
    (
      ?auto_115734 - BLOCK
      ?auto_115735 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115734 ?auto_115733 ) ( CLEAR ?auto_115734 ) ( ON-TABLE ?auto_115728 ) ( ON ?auto_115729 ?auto_115728 ) ( ON ?auto_115730 ?auto_115729 ) ( ON ?auto_115731 ?auto_115730 ) ( ON ?auto_115732 ?auto_115731 ) ( ON ?auto_115733 ?auto_115732 ) ( not ( = ?auto_115728 ?auto_115729 ) ) ( not ( = ?auto_115728 ?auto_115730 ) ) ( not ( = ?auto_115728 ?auto_115731 ) ) ( not ( = ?auto_115728 ?auto_115732 ) ) ( not ( = ?auto_115728 ?auto_115733 ) ) ( not ( = ?auto_115728 ?auto_115734 ) ) ( not ( = ?auto_115729 ?auto_115730 ) ) ( not ( = ?auto_115729 ?auto_115731 ) ) ( not ( = ?auto_115729 ?auto_115732 ) ) ( not ( = ?auto_115729 ?auto_115733 ) ) ( not ( = ?auto_115729 ?auto_115734 ) ) ( not ( = ?auto_115730 ?auto_115731 ) ) ( not ( = ?auto_115730 ?auto_115732 ) ) ( not ( = ?auto_115730 ?auto_115733 ) ) ( not ( = ?auto_115730 ?auto_115734 ) ) ( not ( = ?auto_115731 ?auto_115732 ) ) ( not ( = ?auto_115731 ?auto_115733 ) ) ( not ( = ?auto_115731 ?auto_115734 ) ) ( not ( = ?auto_115732 ?auto_115733 ) ) ( not ( = ?auto_115732 ?auto_115734 ) ) ( not ( = ?auto_115733 ?auto_115734 ) ) ( HOLDING ?auto_115735 ) ( not ( = ?auto_115728 ?auto_115735 ) ) ( not ( = ?auto_115729 ?auto_115735 ) ) ( not ( = ?auto_115730 ?auto_115735 ) ) ( not ( = ?auto_115731 ?auto_115735 ) ) ( not ( = ?auto_115732 ?auto_115735 ) ) ( not ( = ?auto_115733 ?auto_115735 ) ) ( not ( = ?auto_115734 ?auto_115735 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_115735 )
      ( MAKE-6PILE ?auto_115728 ?auto_115729 ?auto_115730 ?auto_115731 ?auto_115732 ?auto_115733 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_115736 - BLOCK
      ?auto_115737 - BLOCK
      ?auto_115738 - BLOCK
      ?auto_115739 - BLOCK
      ?auto_115740 - BLOCK
      ?auto_115741 - BLOCK
    )
    :vars
    (
      ?auto_115742 - BLOCK
      ?auto_115743 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115742 ?auto_115741 ) ( ON-TABLE ?auto_115736 ) ( ON ?auto_115737 ?auto_115736 ) ( ON ?auto_115738 ?auto_115737 ) ( ON ?auto_115739 ?auto_115738 ) ( ON ?auto_115740 ?auto_115739 ) ( ON ?auto_115741 ?auto_115740 ) ( not ( = ?auto_115736 ?auto_115737 ) ) ( not ( = ?auto_115736 ?auto_115738 ) ) ( not ( = ?auto_115736 ?auto_115739 ) ) ( not ( = ?auto_115736 ?auto_115740 ) ) ( not ( = ?auto_115736 ?auto_115741 ) ) ( not ( = ?auto_115736 ?auto_115742 ) ) ( not ( = ?auto_115737 ?auto_115738 ) ) ( not ( = ?auto_115737 ?auto_115739 ) ) ( not ( = ?auto_115737 ?auto_115740 ) ) ( not ( = ?auto_115737 ?auto_115741 ) ) ( not ( = ?auto_115737 ?auto_115742 ) ) ( not ( = ?auto_115738 ?auto_115739 ) ) ( not ( = ?auto_115738 ?auto_115740 ) ) ( not ( = ?auto_115738 ?auto_115741 ) ) ( not ( = ?auto_115738 ?auto_115742 ) ) ( not ( = ?auto_115739 ?auto_115740 ) ) ( not ( = ?auto_115739 ?auto_115741 ) ) ( not ( = ?auto_115739 ?auto_115742 ) ) ( not ( = ?auto_115740 ?auto_115741 ) ) ( not ( = ?auto_115740 ?auto_115742 ) ) ( not ( = ?auto_115741 ?auto_115742 ) ) ( not ( = ?auto_115736 ?auto_115743 ) ) ( not ( = ?auto_115737 ?auto_115743 ) ) ( not ( = ?auto_115738 ?auto_115743 ) ) ( not ( = ?auto_115739 ?auto_115743 ) ) ( not ( = ?auto_115740 ?auto_115743 ) ) ( not ( = ?auto_115741 ?auto_115743 ) ) ( not ( = ?auto_115742 ?auto_115743 ) ) ( ON ?auto_115743 ?auto_115742 ) ( CLEAR ?auto_115743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_115736 ?auto_115737 ?auto_115738 ?auto_115739 ?auto_115740 ?auto_115741 ?auto_115742 )
      ( MAKE-6PILE ?auto_115736 ?auto_115737 ?auto_115738 ?auto_115739 ?auto_115740 ?auto_115741 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_115746 - BLOCK
      ?auto_115747 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_115747 ) ( CLEAR ?auto_115746 ) ( ON-TABLE ?auto_115746 ) ( not ( = ?auto_115746 ?auto_115747 ) ) )
    :subtasks
    ( ( !STACK ?auto_115747 ?auto_115746 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_115748 - BLOCK
      ?auto_115749 - BLOCK
    )
    :vars
    (
      ?auto_115750 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_115748 ) ( ON-TABLE ?auto_115748 ) ( not ( = ?auto_115748 ?auto_115749 ) ) ( ON ?auto_115749 ?auto_115750 ) ( CLEAR ?auto_115749 ) ( HAND-EMPTY ) ( not ( = ?auto_115748 ?auto_115750 ) ) ( not ( = ?auto_115749 ?auto_115750 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_115749 ?auto_115750 )
      ( MAKE-2PILE ?auto_115748 ?auto_115749 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_115751 - BLOCK
      ?auto_115752 - BLOCK
    )
    :vars
    (
      ?auto_115753 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115751 ?auto_115752 ) ) ( ON ?auto_115752 ?auto_115753 ) ( CLEAR ?auto_115752 ) ( not ( = ?auto_115751 ?auto_115753 ) ) ( not ( = ?auto_115752 ?auto_115753 ) ) ( HOLDING ?auto_115751 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_115751 )
      ( MAKE-2PILE ?auto_115751 ?auto_115752 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_115754 - BLOCK
      ?auto_115755 - BLOCK
    )
    :vars
    (
      ?auto_115756 - BLOCK
      ?auto_115757 - BLOCK
      ?auto_115758 - BLOCK
      ?auto_115760 - BLOCK
      ?auto_115759 - BLOCK
      ?auto_115761 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115754 ?auto_115755 ) ) ( ON ?auto_115755 ?auto_115756 ) ( not ( = ?auto_115754 ?auto_115756 ) ) ( not ( = ?auto_115755 ?auto_115756 ) ) ( ON ?auto_115754 ?auto_115755 ) ( CLEAR ?auto_115754 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_115757 ) ( ON ?auto_115758 ?auto_115757 ) ( ON ?auto_115760 ?auto_115758 ) ( ON ?auto_115759 ?auto_115760 ) ( ON ?auto_115761 ?auto_115759 ) ( ON ?auto_115756 ?auto_115761 ) ( not ( = ?auto_115757 ?auto_115758 ) ) ( not ( = ?auto_115757 ?auto_115760 ) ) ( not ( = ?auto_115757 ?auto_115759 ) ) ( not ( = ?auto_115757 ?auto_115761 ) ) ( not ( = ?auto_115757 ?auto_115756 ) ) ( not ( = ?auto_115757 ?auto_115755 ) ) ( not ( = ?auto_115757 ?auto_115754 ) ) ( not ( = ?auto_115758 ?auto_115760 ) ) ( not ( = ?auto_115758 ?auto_115759 ) ) ( not ( = ?auto_115758 ?auto_115761 ) ) ( not ( = ?auto_115758 ?auto_115756 ) ) ( not ( = ?auto_115758 ?auto_115755 ) ) ( not ( = ?auto_115758 ?auto_115754 ) ) ( not ( = ?auto_115760 ?auto_115759 ) ) ( not ( = ?auto_115760 ?auto_115761 ) ) ( not ( = ?auto_115760 ?auto_115756 ) ) ( not ( = ?auto_115760 ?auto_115755 ) ) ( not ( = ?auto_115760 ?auto_115754 ) ) ( not ( = ?auto_115759 ?auto_115761 ) ) ( not ( = ?auto_115759 ?auto_115756 ) ) ( not ( = ?auto_115759 ?auto_115755 ) ) ( not ( = ?auto_115759 ?auto_115754 ) ) ( not ( = ?auto_115761 ?auto_115756 ) ) ( not ( = ?auto_115761 ?auto_115755 ) ) ( not ( = ?auto_115761 ?auto_115754 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_115757 ?auto_115758 ?auto_115760 ?auto_115759 ?auto_115761 ?auto_115756 ?auto_115755 )
      ( MAKE-2PILE ?auto_115754 ?auto_115755 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_115767 - BLOCK
      ?auto_115768 - BLOCK
      ?auto_115769 - BLOCK
      ?auto_115770 - BLOCK
      ?auto_115771 - BLOCK
    )
    :vars
    (
      ?auto_115772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115772 ?auto_115771 ) ( CLEAR ?auto_115772 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_115767 ) ( ON ?auto_115768 ?auto_115767 ) ( ON ?auto_115769 ?auto_115768 ) ( ON ?auto_115770 ?auto_115769 ) ( ON ?auto_115771 ?auto_115770 ) ( not ( = ?auto_115767 ?auto_115768 ) ) ( not ( = ?auto_115767 ?auto_115769 ) ) ( not ( = ?auto_115767 ?auto_115770 ) ) ( not ( = ?auto_115767 ?auto_115771 ) ) ( not ( = ?auto_115767 ?auto_115772 ) ) ( not ( = ?auto_115768 ?auto_115769 ) ) ( not ( = ?auto_115768 ?auto_115770 ) ) ( not ( = ?auto_115768 ?auto_115771 ) ) ( not ( = ?auto_115768 ?auto_115772 ) ) ( not ( = ?auto_115769 ?auto_115770 ) ) ( not ( = ?auto_115769 ?auto_115771 ) ) ( not ( = ?auto_115769 ?auto_115772 ) ) ( not ( = ?auto_115770 ?auto_115771 ) ) ( not ( = ?auto_115770 ?auto_115772 ) ) ( not ( = ?auto_115771 ?auto_115772 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_115772 ?auto_115771 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_115773 - BLOCK
      ?auto_115774 - BLOCK
      ?auto_115775 - BLOCK
      ?auto_115776 - BLOCK
      ?auto_115777 - BLOCK
    )
    :vars
    (
      ?auto_115778 - BLOCK
      ?auto_115779 - BLOCK
      ?auto_115780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115778 ?auto_115777 ) ( CLEAR ?auto_115778 ) ( ON-TABLE ?auto_115773 ) ( ON ?auto_115774 ?auto_115773 ) ( ON ?auto_115775 ?auto_115774 ) ( ON ?auto_115776 ?auto_115775 ) ( ON ?auto_115777 ?auto_115776 ) ( not ( = ?auto_115773 ?auto_115774 ) ) ( not ( = ?auto_115773 ?auto_115775 ) ) ( not ( = ?auto_115773 ?auto_115776 ) ) ( not ( = ?auto_115773 ?auto_115777 ) ) ( not ( = ?auto_115773 ?auto_115778 ) ) ( not ( = ?auto_115774 ?auto_115775 ) ) ( not ( = ?auto_115774 ?auto_115776 ) ) ( not ( = ?auto_115774 ?auto_115777 ) ) ( not ( = ?auto_115774 ?auto_115778 ) ) ( not ( = ?auto_115775 ?auto_115776 ) ) ( not ( = ?auto_115775 ?auto_115777 ) ) ( not ( = ?auto_115775 ?auto_115778 ) ) ( not ( = ?auto_115776 ?auto_115777 ) ) ( not ( = ?auto_115776 ?auto_115778 ) ) ( not ( = ?auto_115777 ?auto_115778 ) ) ( HOLDING ?auto_115779 ) ( CLEAR ?auto_115780 ) ( not ( = ?auto_115773 ?auto_115779 ) ) ( not ( = ?auto_115773 ?auto_115780 ) ) ( not ( = ?auto_115774 ?auto_115779 ) ) ( not ( = ?auto_115774 ?auto_115780 ) ) ( not ( = ?auto_115775 ?auto_115779 ) ) ( not ( = ?auto_115775 ?auto_115780 ) ) ( not ( = ?auto_115776 ?auto_115779 ) ) ( not ( = ?auto_115776 ?auto_115780 ) ) ( not ( = ?auto_115777 ?auto_115779 ) ) ( not ( = ?auto_115777 ?auto_115780 ) ) ( not ( = ?auto_115778 ?auto_115779 ) ) ( not ( = ?auto_115778 ?auto_115780 ) ) ( not ( = ?auto_115779 ?auto_115780 ) ) )
    :subtasks
    ( ( !STACK ?auto_115779 ?auto_115780 )
      ( MAKE-5PILE ?auto_115773 ?auto_115774 ?auto_115775 ?auto_115776 ?auto_115777 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_115781 - BLOCK
      ?auto_115782 - BLOCK
      ?auto_115783 - BLOCK
      ?auto_115784 - BLOCK
      ?auto_115785 - BLOCK
    )
    :vars
    (
      ?auto_115787 - BLOCK
      ?auto_115786 - BLOCK
      ?auto_115788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115787 ?auto_115785 ) ( ON-TABLE ?auto_115781 ) ( ON ?auto_115782 ?auto_115781 ) ( ON ?auto_115783 ?auto_115782 ) ( ON ?auto_115784 ?auto_115783 ) ( ON ?auto_115785 ?auto_115784 ) ( not ( = ?auto_115781 ?auto_115782 ) ) ( not ( = ?auto_115781 ?auto_115783 ) ) ( not ( = ?auto_115781 ?auto_115784 ) ) ( not ( = ?auto_115781 ?auto_115785 ) ) ( not ( = ?auto_115781 ?auto_115787 ) ) ( not ( = ?auto_115782 ?auto_115783 ) ) ( not ( = ?auto_115782 ?auto_115784 ) ) ( not ( = ?auto_115782 ?auto_115785 ) ) ( not ( = ?auto_115782 ?auto_115787 ) ) ( not ( = ?auto_115783 ?auto_115784 ) ) ( not ( = ?auto_115783 ?auto_115785 ) ) ( not ( = ?auto_115783 ?auto_115787 ) ) ( not ( = ?auto_115784 ?auto_115785 ) ) ( not ( = ?auto_115784 ?auto_115787 ) ) ( not ( = ?auto_115785 ?auto_115787 ) ) ( CLEAR ?auto_115786 ) ( not ( = ?auto_115781 ?auto_115788 ) ) ( not ( = ?auto_115781 ?auto_115786 ) ) ( not ( = ?auto_115782 ?auto_115788 ) ) ( not ( = ?auto_115782 ?auto_115786 ) ) ( not ( = ?auto_115783 ?auto_115788 ) ) ( not ( = ?auto_115783 ?auto_115786 ) ) ( not ( = ?auto_115784 ?auto_115788 ) ) ( not ( = ?auto_115784 ?auto_115786 ) ) ( not ( = ?auto_115785 ?auto_115788 ) ) ( not ( = ?auto_115785 ?auto_115786 ) ) ( not ( = ?auto_115787 ?auto_115788 ) ) ( not ( = ?auto_115787 ?auto_115786 ) ) ( not ( = ?auto_115788 ?auto_115786 ) ) ( ON ?auto_115788 ?auto_115787 ) ( CLEAR ?auto_115788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_115781 ?auto_115782 ?auto_115783 ?auto_115784 ?auto_115785 ?auto_115787 )
      ( MAKE-5PILE ?auto_115781 ?auto_115782 ?auto_115783 ?auto_115784 ?auto_115785 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_115789 - BLOCK
      ?auto_115790 - BLOCK
      ?auto_115791 - BLOCK
      ?auto_115792 - BLOCK
      ?auto_115793 - BLOCK
    )
    :vars
    (
      ?auto_115795 - BLOCK
      ?auto_115796 - BLOCK
      ?auto_115794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115795 ?auto_115793 ) ( ON-TABLE ?auto_115789 ) ( ON ?auto_115790 ?auto_115789 ) ( ON ?auto_115791 ?auto_115790 ) ( ON ?auto_115792 ?auto_115791 ) ( ON ?auto_115793 ?auto_115792 ) ( not ( = ?auto_115789 ?auto_115790 ) ) ( not ( = ?auto_115789 ?auto_115791 ) ) ( not ( = ?auto_115789 ?auto_115792 ) ) ( not ( = ?auto_115789 ?auto_115793 ) ) ( not ( = ?auto_115789 ?auto_115795 ) ) ( not ( = ?auto_115790 ?auto_115791 ) ) ( not ( = ?auto_115790 ?auto_115792 ) ) ( not ( = ?auto_115790 ?auto_115793 ) ) ( not ( = ?auto_115790 ?auto_115795 ) ) ( not ( = ?auto_115791 ?auto_115792 ) ) ( not ( = ?auto_115791 ?auto_115793 ) ) ( not ( = ?auto_115791 ?auto_115795 ) ) ( not ( = ?auto_115792 ?auto_115793 ) ) ( not ( = ?auto_115792 ?auto_115795 ) ) ( not ( = ?auto_115793 ?auto_115795 ) ) ( not ( = ?auto_115789 ?auto_115796 ) ) ( not ( = ?auto_115789 ?auto_115794 ) ) ( not ( = ?auto_115790 ?auto_115796 ) ) ( not ( = ?auto_115790 ?auto_115794 ) ) ( not ( = ?auto_115791 ?auto_115796 ) ) ( not ( = ?auto_115791 ?auto_115794 ) ) ( not ( = ?auto_115792 ?auto_115796 ) ) ( not ( = ?auto_115792 ?auto_115794 ) ) ( not ( = ?auto_115793 ?auto_115796 ) ) ( not ( = ?auto_115793 ?auto_115794 ) ) ( not ( = ?auto_115795 ?auto_115796 ) ) ( not ( = ?auto_115795 ?auto_115794 ) ) ( not ( = ?auto_115796 ?auto_115794 ) ) ( ON ?auto_115796 ?auto_115795 ) ( CLEAR ?auto_115796 ) ( HOLDING ?auto_115794 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_115794 )
      ( MAKE-5PILE ?auto_115789 ?auto_115790 ?auto_115791 ?auto_115792 ?auto_115793 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_115797 - BLOCK
      ?auto_115798 - BLOCK
      ?auto_115799 - BLOCK
      ?auto_115800 - BLOCK
      ?auto_115801 - BLOCK
    )
    :vars
    (
      ?auto_115802 - BLOCK
      ?auto_115803 - BLOCK
      ?auto_115804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115802 ?auto_115801 ) ( ON-TABLE ?auto_115797 ) ( ON ?auto_115798 ?auto_115797 ) ( ON ?auto_115799 ?auto_115798 ) ( ON ?auto_115800 ?auto_115799 ) ( ON ?auto_115801 ?auto_115800 ) ( not ( = ?auto_115797 ?auto_115798 ) ) ( not ( = ?auto_115797 ?auto_115799 ) ) ( not ( = ?auto_115797 ?auto_115800 ) ) ( not ( = ?auto_115797 ?auto_115801 ) ) ( not ( = ?auto_115797 ?auto_115802 ) ) ( not ( = ?auto_115798 ?auto_115799 ) ) ( not ( = ?auto_115798 ?auto_115800 ) ) ( not ( = ?auto_115798 ?auto_115801 ) ) ( not ( = ?auto_115798 ?auto_115802 ) ) ( not ( = ?auto_115799 ?auto_115800 ) ) ( not ( = ?auto_115799 ?auto_115801 ) ) ( not ( = ?auto_115799 ?auto_115802 ) ) ( not ( = ?auto_115800 ?auto_115801 ) ) ( not ( = ?auto_115800 ?auto_115802 ) ) ( not ( = ?auto_115801 ?auto_115802 ) ) ( not ( = ?auto_115797 ?auto_115803 ) ) ( not ( = ?auto_115797 ?auto_115804 ) ) ( not ( = ?auto_115798 ?auto_115803 ) ) ( not ( = ?auto_115798 ?auto_115804 ) ) ( not ( = ?auto_115799 ?auto_115803 ) ) ( not ( = ?auto_115799 ?auto_115804 ) ) ( not ( = ?auto_115800 ?auto_115803 ) ) ( not ( = ?auto_115800 ?auto_115804 ) ) ( not ( = ?auto_115801 ?auto_115803 ) ) ( not ( = ?auto_115801 ?auto_115804 ) ) ( not ( = ?auto_115802 ?auto_115803 ) ) ( not ( = ?auto_115802 ?auto_115804 ) ) ( not ( = ?auto_115803 ?auto_115804 ) ) ( ON ?auto_115803 ?auto_115802 ) ( ON ?auto_115804 ?auto_115803 ) ( CLEAR ?auto_115804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_115797 ?auto_115798 ?auto_115799 ?auto_115800 ?auto_115801 ?auto_115802 ?auto_115803 )
      ( MAKE-5PILE ?auto_115797 ?auto_115798 ?auto_115799 ?auto_115800 ?auto_115801 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_115808 - BLOCK
      ?auto_115809 - BLOCK
      ?auto_115810 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_115810 ) ( CLEAR ?auto_115809 ) ( ON-TABLE ?auto_115808 ) ( ON ?auto_115809 ?auto_115808 ) ( not ( = ?auto_115808 ?auto_115809 ) ) ( not ( = ?auto_115808 ?auto_115810 ) ) ( not ( = ?auto_115809 ?auto_115810 ) ) )
    :subtasks
    ( ( !STACK ?auto_115810 ?auto_115809 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_115811 - BLOCK
      ?auto_115812 - BLOCK
      ?auto_115813 - BLOCK
    )
    :vars
    (
      ?auto_115814 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_115812 ) ( ON-TABLE ?auto_115811 ) ( ON ?auto_115812 ?auto_115811 ) ( not ( = ?auto_115811 ?auto_115812 ) ) ( not ( = ?auto_115811 ?auto_115813 ) ) ( not ( = ?auto_115812 ?auto_115813 ) ) ( ON ?auto_115813 ?auto_115814 ) ( CLEAR ?auto_115813 ) ( HAND-EMPTY ) ( not ( = ?auto_115811 ?auto_115814 ) ) ( not ( = ?auto_115812 ?auto_115814 ) ) ( not ( = ?auto_115813 ?auto_115814 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_115813 ?auto_115814 )
      ( MAKE-3PILE ?auto_115811 ?auto_115812 ?auto_115813 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_115815 - BLOCK
      ?auto_115816 - BLOCK
      ?auto_115817 - BLOCK
    )
    :vars
    (
      ?auto_115818 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115815 ) ( not ( = ?auto_115815 ?auto_115816 ) ) ( not ( = ?auto_115815 ?auto_115817 ) ) ( not ( = ?auto_115816 ?auto_115817 ) ) ( ON ?auto_115817 ?auto_115818 ) ( CLEAR ?auto_115817 ) ( not ( = ?auto_115815 ?auto_115818 ) ) ( not ( = ?auto_115816 ?auto_115818 ) ) ( not ( = ?auto_115817 ?auto_115818 ) ) ( HOLDING ?auto_115816 ) ( CLEAR ?auto_115815 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_115815 ?auto_115816 )
      ( MAKE-3PILE ?auto_115815 ?auto_115816 ?auto_115817 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_115819 - BLOCK
      ?auto_115820 - BLOCK
      ?auto_115821 - BLOCK
    )
    :vars
    (
      ?auto_115822 - BLOCK
      ?auto_115823 - BLOCK
      ?auto_115825 - BLOCK
      ?auto_115826 - BLOCK
      ?auto_115824 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115819 ) ( not ( = ?auto_115819 ?auto_115820 ) ) ( not ( = ?auto_115819 ?auto_115821 ) ) ( not ( = ?auto_115820 ?auto_115821 ) ) ( ON ?auto_115821 ?auto_115822 ) ( not ( = ?auto_115819 ?auto_115822 ) ) ( not ( = ?auto_115820 ?auto_115822 ) ) ( not ( = ?auto_115821 ?auto_115822 ) ) ( CLEAR ?auto_115819 ) ( ON ?auto_115820 ?auto_115821 ) ( CLEAR ?auto_115820 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_115823 ) ( ON ?auto_115825 ?auto_115823 ) ( ON ?auto_115826 ?auto_115825 ) ( ON ?auto_115824 ?auto_115826 ) ( ON ?auto_115822 ?auto_115824 ) ( not ( = ?auto_115823 ?auto_115825 ) ) ( not ( = ?auto_115823 ?auto_115826 ) ) ( not ( = ?auto_115823 ?auto_115824 ) ) ( not ( = ?auto_115823 ?auto_115822 ) ) ( not ( = ?auto_115823 ?auto_115821 ) ) ( not ( = ?auto_115823 ?auto_115820 ) ) ( not ( = ?auto_115825 ?auto_115826 ) ) ( not ( = ?auto_115825 ?auto_115824 ) ) ( not ( = ?auto_115825 ?auto_115822 ) ) ( not ( = ?auto_115825 ?auto_115821 ) ) ( not ( = ?auto_115825 ?auto_115820 ) ) ( not ( = ?auto_115826 ?auto_115824 ) ) ( not ( = ?auto_115826 ?auto_115822 ) ) ( not ( = ?auto_115826 ?auto_115821 ) ) ( not ( = ?auto_115826 ?auto_115820 ) ) ( not ( = ?auto_115824 ?auto_115822 ) ) ( not ( = ?auto_115824 ?auto_115821 ) ) ( not ( = ?auto_115824 ?auto_115820 ) ) ( not ( = ?auto_115819 ?auto_115823 ) ) ( not ( = ?auto_115819 ?auto_115825 ) ) ( not ( = ?auto_115819 ?auto_115826 ) ) ( not ( = ?auto_115819 ?auto_115824 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_115823 ?auto_115825 ?auto_115826 ?auto_115824 ?auto_115822 ?auto_115821 )
      ( MAKE-3PILE ?auto_115819 ?auto_115820 ?auto_115821 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_115827 - BLOCK
      ?auto_115828 - BLOCK
      ?auto_115829 - BLOCK
    )
    :vars
    (
      ?auto_115832 - BLOCK
      ?auto_115833 - BLOCK
      ?auto_115831 - BLOCK
      ?auto_115834 - BLOCK
      ?auto_115830 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115827 ?auto_115828 ) ) ( not ( = ?auto_115827 ?auto_115829 ) ) ( not ( = ?auto_115828 ?auto_115829 ) ) ( ON ?auto_115829 ?auto_115832 ) ( not ( = ?auto_115827 ?auto_115832 ) ) ( not ( = ?auto_115828 ?auto_115832 ) ) ( not ( = ?auto_115829 ?auto_115832 ) ) ( ON ?auto_115828 ?auto_115829 ) ( CLEAR ?auto_115828 ) ( ON-TABLE ?auto_115833 ) ( ON ?auto_115831 ?auto_115833 ) ( ON ?auto_115834 ?auto_115831 ) ( ON ?auto_115830 ?auto_115834 ) ( ON ?auto_115832 ?auto_115830 ) ( not ( = ?auto_115833 ?auto_115831 ) ) ( not ( = ?auto_115833 ?auto_115834 ) ) ( not ( = ?auto_115833 ?auto_115830 ) ) ( not ( = ?auto_115833 ?auto_115832 ) ) ( not ( = ?auto_115833 ?auto_115829 ) ) ( not ( = ?auto_115833 ?auto_115828 ) ) ( not ( = ?auto_115831 ?auto_115834 ) ) ( not ( = ?auto_115831 ?auto_115830 ) ) ( not ( = ?auto_115831 ?auto_115832 ) ) ( not ( = ?auto_115831 ?auto_115829 ) ) ( not ( = ?auto_115831 ?auto_115828 ) ) ( not ( = ?auto_115834 ?auto_115830 ) ) ( not ( = ?auto_115834 ?auto_115832 ) ) ( not ( = ?auto_115834 ?auto_115829 ) ) ( not ( = ?auto_115834 ?auto_115828 ) ) ( not ( = ?auto_115830 ?auto_115832 ) ) ( not ( = ?auto_115830 ?auto_115829 ) ) ( not ( = ?auto_115830 ?auto_115828 ) ) ( not ( = ?auto_115827 ?auto_115833 ) ) ( not ( = ?auto_115827 ?auto_115831 ) ) ( not ( = ?auto_115827 ?auto_115834 ) ) ( not ( = ?auto_115827 ?auto_115830 ) ) ( HOLDING ?auto_115827 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_115827 )
      ( MAKE-3PILE ?auto_115827 ?auto_115828 ?auto_115829 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_115835 - BLOCK
      ?auto_115836 - BLOCK
      ?auto_115837 - BLOCK
    )
    :vars
    (
      ?auto_115839 - BLOCK
      ?auto_115841 - BLOCK
      ?auto_115842 - BLOCK
      ?auto_115838 - BLOCK
      ?auto_115840 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115835 ?auto_115836 ) ) ( not ( = ?auto_115835 ?auto_115837 ) ) ( not ( = ?auto_115836 ?auto_115837 ) ) ( ON ?auto_115837 ?auto_115839 ) ( not ( = ?auto_115835 ?auto_115839 ) ) ( not ( = ?auto_115836 ?auto_115839 ) ) ( not ( = ?auto_115837 ?auto_115839 ) ) ( ON ?auto_115836 ?auto_115837 ) ( ON-TABLE ?auto_115841 ) ( ON ?auto_115842 ?auto_115841 ) ( ON ?auto_115838 ?auto_115842 ) ( ON ?auto_115840 ?auto_115838 ) ( ON ?auto_115839 ?auto_115840 ) ( not ( = ?auto_115841 ?auto_115842 ) ) ( not ( = ?auto_115841 ?auto_115838 ) ) ( not ( = ?auto_115841 ?auto_115840 ) ) ( not ( = ?auto_115841 ?auto_115839 ) ) ( not ( = ?auto_115841 ?auto_115837 ) ) ( not ( = ?auto_115841 ?auto_115836 ) ) ( not ( = ?auto_115842 ?auto_115838 ) ) ( not ( = ?auto_115842 ?auto_115840 ) ) ( not ( = ?auto_115842 ?auto_115839 ) ) ( not ( = ?auto_115842 ?auto_115837 ) ) ( not ( = ?auto_115842 ?auto_115836 ) ) ( not ( = ?auto_115838 ?auto_115840 ) ) ( not ( = ?auto_115838 ?auto_115839 ) ) ( not ( = ?auto_115838 ?auto_115837 ) ) ( not ( = ?auto_115838 ?auto_115836 ) ) ( not ( = ?auto_115840 ?auto_115839 ) ) ( not ( = ?auto_115840 ?auto_115837 ) ) ( not ( = ?auto_115840 ?auto_115836 ) ) ( not ( = ?auto_115835 ?auto_115841 ) ) ( not ( = ?auto_115835 ?auto_115842 ) ) ( not ( = ?auto_115835 ?auto_115838 ) ) ( not ( = ?auto_115835 ?auto_115840 ) ) ( ON ?auto_115835 ?auto_115836 ) ( CLEAR ?auto_115835 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_115841 ?auto_115842 ?auto_115838 ?auto_115840 ?auto_115839 ?auto_115837 ?auto_115836 )
      ( MAKE-3PILE ?auto_115835 ?auto_115836 ?auto_115837 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_115847 - BLOCK
      ?auto_115848 - BLOCK
      ?auto_115849 - BLOCK
      ?auto_115850 - BLOCK
    )
    :vars
    (
      ?auto_115851 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115851 ?auto_115850 ) ( CLEAR ?auto_115851 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_115847 ) ( ON ?auto_115848 ?auto_115847 ) ( ON ?auto_115849 ?auto_115848 ) ( ON ?auto_115850 ?auto_115849 ) ( not ( = ?auto_115847 ?auto_115848 ) ) ( not ( = ?auto_115847 ?auto_115849 ) ) ( not ( = ?auto_115847 ?auto_115850 ) ) ( not ( = ?auto_115847 ?auto_115851 ) ) ( not ( = ?auto_115848 ?auto_115849 ) ) ( not ( = ?auto_115848 ?auto_115850 ) ) ( not ( = ?auto_115848 ?auto_115851 ) ) ( not ( = ?auto_115849 ?auto_115850 ) ) ( not ( = ?auto_115849 ?auto_115851 ) ) ( not ( = ?auto_115850 ?auto_115851 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_115851 ?auto_115850 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_115852 - BLOCK
      ?auto_115853 - BLOCK
      ?auto_115854 - BLOCK
      ?auto_115855 - BLOCK
    )
    :vars
    (
      ?auto_115856 - BLOCK
      ?auto_115857 - BLOCK
      ?auto_115858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115856 ?auto_115855 ) ( CLEAR ?auto_115856 ) ( ON-TABLE ?auto_115852 ) ( ON ?auto_115853 ?auto_115852 ) ( ON ?auto_115854 ?auto_115853 ) ( ON ?auto_115855 ?auto_115854 ) ( not ( = ?auto_115852 ?auto_115853 ) ) ( not ( = ?auto_115852 ?auto_115854 ) ) ( not ( = ?auto_115852 ?auto_115855 ) ) ( not ( = ?auto_115852 ?auto_115856 ) ) ( not ( = ?auto_115853 ?auto_115854 ) ) ( not ( = ?auto_115853 ?auto_115855 ) ) ( not ( = ?auto_115853 ?auto_115856 ) ) ( not ( = ?auto_115854 ?auto_115855 ) ) ( not ( = ?auto_115854 ?auto_115856 ) ) ( not ( = ?auto_115855 ?auto_115856 ) ) ( HOLDING ?auto_115857 ) ( CLEAR ?auto_115858 ) ( not ( = ?auto_115852 ?auto_115857 ) ) ( not ( = ?auto_115852 ?auto_115858 ) ) ( not ( = ?auto_115853 ?auto_115857 ) ) ( not ( = ?auto_115853 ?auto_115858 ) ) ( not ( = ?auto_115854 ?auto_115857 ) ) ( not ( = ?auto_115854 ?auto_115858 ) ) ( not ( = ?auto_115855 ?auto_115857 ) ) ( not ( = ?auto_115855 ?auto_115858 ) ) ( not ( = ?auto_115856 ?auto_115857 ) ) ( not ( = ?auto_115856 ?auto_115858 ) ) ( not ( = ?auto_115857 ?auto_115858 ) ) )
    :subtasks
    ( ( !STACK ?auto_115857 ?auto_115858 )
      ( MAKE-4PILE ?auto_115852 ?auto_115853 ?auto_115854 ?auto_115855 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_115859 - BLOCK
      ?auto_115860 - BLOCK
      ?auto_115861 - BLOCK
      ?auto_115862 - BLOCK
    )
    :vars
    (
      ?auto_115863 - BLOCK
      ?auto_115865 - BLOCK
      ?auto_115864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115863 ?auto_115862 ) ( ON-TABLE ?auto_115859 ) ( ON ?auto_115860 ?auto_115859 ) ( ON ?auto_115861 ?auto_115860 ) ( ON ?auto_115862 ?auto_115861 ) ( not ( = ?auto_115859 ?auto_115860 ) ) ( not ( = ?auto_115859 ?auto_115861 ) ) ( not ( = ?auto_115859 ?auto_115862 ) ) ( not ( = ?auto_115859 ?auto_115863 ) ) ( not ( = ?auto_115860 ?auto_115861 ) ) ( not ( = ?auto_115860 ?auto_115862 ) ) ( not ( = ?auto_115860 ?auto_115863 ) ) ( not ( = ?auto_115861 ?auto_115862 ) ) ( not ( = ?auto_115861 ?auto_115863 ) ) ( not ( = ?auto_115862 ?auto_115863 ) ) ( CLEAR ?auto_115865 ) ( not ( = ?auto_115859 ?auto_115864 ) ) ( not ( = ?auto_115859 ?auto_115865 ) ) ( not ( = ?auto_115860 ?auto_115864 ) ) ( not ( = ?auto_115860 ?auto_115865 ) ) ( not ( = ?auto_115861 ?auto_115864 ) ) ( not ( = ?auto_115861 ?auto_115865 ) ) ( not ( = ?auto_115862 ?auto_115864 ) ) ( not ( = ?auto_115862 ?auto_115865 ) ) ( not ( = ?auto_115863 ?auto_115864 ) ) ( not ( = ?auto_115863 ?auto_115865 ) ) ( not ( = ?auto_115864 ?auto_115865 ) ) ( ON ?auto_115864 ?auto_115863 ) ( CLEAR ?auto_115864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_115859 ?auto_115860 ?auto_115861 ?auto_115862 ?auto_115863 )
      ( MAKE-4PILE ?auto_115859 ?auto_115860 ?auto_115861 ?auto_115862 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_115866 - BLOCK
      ?auto_115867 - BLOCK
      ?auto_115868 - BLOCK
      ?auto_115869 - BLOCK
    )
    :vars
    (
      ?auto_115870 - BLOCK
      ?auto_115871 - BLOCK
      ?auto_115872 - BLOCK
      ?auto_115873 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115870 ?auto_115869 ) ( ON-TABLE ?auto_115866 ) ( ON ?auto_115867 ?auto_115866 ) ( ON ?auto_115868 ?auto_115867 ) ( ON ?auto_115869 ?auto_115868 ) ( not ( = ?auto_115866 ?auto_115867 ) ) ( not ( = ?auto_115866 ?auto_115868 ) ) ( not ( = ?auto_115866 ?auto_115869 ) ) ( not ( = ?auto_115866 ?auto_115870 ) ) ( not ( = ?auto_115867 ?auto_115868 ) ) ( not ( = ?auto_115867 ?auto_115869 ) ) ( not ( = ?auto_115867 ?auto_115870 ) ) ( not ( = ?auto_115868 ?auto_115869 ) ) ( not ( = ?auto_115868 ?auto_115870 ) ) ( not ( = ?auto_115869 ?auto_115870 ) ) ( not ( = ?auto_115866 ?auto_115871 ) ) ( not ( = ?auto_115866 ?auto_115872 ) ) ( not ( = ?auto_115867 ?auto_115871 ) ) ( not ( = ?auto_115867 ?auto_115872 ) ) ( not ( = ?auto_115868 ?auto_115871 ) ) ( not ( = ?auto_115868 ?auto_115872 ) ) ( not ( = ?auto_115869 ?auto_115871 ) ) ( not ( = ?auto_115869 ?auto_115872 ) ) ( not ( = ?auto_115870 ?auto_115871 ) ) ( not ( = ?auto_115870 ?auto_115872 ) ) ( not ( = ?auto_115871 ?auto_115872 ) ) ( ON ?auto_115871 ?auto_115870 ) ( CLEAR ?auto_115871 ) ( HOLDING ?auto_115872 ) ( CLEAR ?auto_115873 ) ( ON-TABLE ?auto_115873 ) ( not ( = ?auto_115873 ?auto_115872 ) ) ( not ( = ?auto_115866 ?auto_115873 ) ) ( not ( = ?auto_115867 ?auto_115873 ) ) ( not ( = ?auto_115868 ?auto_115873 ) ) ( not ( = ?auto_115869 ?auto_115873 ) ) ( not ( = ?auto_115870 ?auto_115873 ) ) ( not ( = ?auto_115871 ?auto_115873 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_115873 ?auto_115872 )
      ( MAKE-4PILE ?auto_115866 ?auto_115867 ?auto_115868 ?auto_115869 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_115874 - BLOCK
      ?auto_115875 - BLOCK
      ?auto_115876 - BLOCK
      ?auto_115877 - BLOCK
    )
    :vars
    (
      ?auto_115878 - BLOCK
      ?auto_115879 - BLOCK
      ?auto_115881 - BLOCK
      ?auto_115880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115878 ?auto_115877 ) ( ON-TABLE ?auto_115874 ) ( ON ?auto_115875 ?auto_115874 ) ( ON ?auto_115876 ?auto_115875 ) ( ON ?auto_115877 ?auto_115876 ) ( not ( = ?auto_115874 ?auto_115875 ) ) ( not ( = ?auto_115874 ?auto_115876 ) ) ( not ( = ?auto_115874 ?auto_115877 ) ) ( not ( = ?auto_115874 ?auto_115878 ) ) ( not ( = ?auto_115875 ?auto_115876 ) ) ( not ( = ?auto_115875 ?auto_115877 ) ) ( not ( = ?auto_115875 ?auto_115878 ) ) ( not ( = ?auto_115876 ?auto_115877 ) ) ( not ( = ?auto_115876 ?auto_115878 ) ) ( not ( = ?auto_115877 ?auto_115878 ) ) ( not ( = ?auto_115874 ?auto_115879 ) ) ( not ( = ?auto_115874 ?auto_115881 ) ) ( not ( = ?auto_115875 ?auto_115879 ) ) ( not ( = ?auto_115875 ?auto_115881 ) ) ( not ( = ?auto_115876 ?auto_115879 ) ) ( not ( = ?auto_115876 ?auto_115881 ) ) ( not ( = ?auto_115877 ?auto_115879 ) ) ( not ( = ?auto_115877 ?auto_115881 ) ) ( not ( = ?auto_115878 ?auto_115879 ) ) ( not ( = ?auto_115878 ?auto_115881 ) ) ( not ( = ?auto_115879 ?auto_115881 ) ) ( ON ?auto_115879 ?auto_115878 ) ( CLEAR ?auto_115880 ) ( ON-TABLE ?auto_115880 ) ( not ( = ?auto_115880 ?auto_115881 ) ) ( not ( = ?auto_115874 ?auto_115880 ) ) ( not ( = ?auto_115875 ?auto_115880 ) ) ( not ( = ?auto_115876 ?auto_115880 ) ) ( not ( = ?auto_115877 ?auto_115880 ) ) ( not ( = ?auto_115878 ?auto_115880 ) ) ( not ( = ?auto_115879 ?auto_115880 ) ) ( ON ?auto_115881 ?auto_115879 ) ( CLEAR ?auto_115881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_115874 ?auto_115875 ?auto_115876 ?auto_115877 ?auto_115878 ?auto_115879 )
      ( MAKE-4PILE ?auto_115874 ?auto_115875 ?auto_115876 ?auto_115877 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_115882 - BLOCK
      ?auto_115883 - BLOCK
      ?auto_115884 - BLOCK
      ?auto_115885 - BLOCK
    )
    :vars
    (
      ?auto_115889 - BLOCK
      ?auto_115888 - BLOCK
      ?auto_115887 - BLOCK
      ?auto_115886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115889 ?auto_115885 ) ( ON-TABLE ?auto_115882 ) ( ON ?auto_115883 ?auto_115882 ) ( ON ?auto_115884 ?auto_115883 ) ( ON ?auto_115885 ?auto_115884 ) ( not ( = ?auto_115882 ?auto_115883 ) ) ( not ( = ?auto_115882 ?auto_115884 ) ) ( not ( = ?auto_115882 ?auto_115885 ) ) ( not ( = ?auto_115882 ?auto_115889 ) ) ( not ( = ?auto_115883 ?auto_115884 ) ) ( not ( = ?auto_115883 ?auto_115885 ) ) ( not ( = ?auto_115883 ?auto_115889 ) ) ( not ( = ?auto_115884 ?auto_115885 ) ) ( not ( = ?auto_115884 ?auto_115889 ) ) ( not ( = ?auto_115885 ?auto_115889 ) ) ( not ( = ?auto_115882 ?auto_115888 ) ) ( not ( = ?auto_115882 ?auto_115887 ) ) ( not ( = ?auto_115883 ?auto_115888 ) ) ( not ( = ?auto_115883 ?auto_115887 ) ) ( not ( = ?auto_115884 ?auto_115888 ) ) ( not ( = ?auto_115884 ?auto_115887 ) ) ( not ( = ?auto_115885 ?auto_115888 ) ) ( not ( = ?auto_115885 ?auto_115887 ) ) ( not ( = ?auto_115889 ?auto_115888 ) ) ( not ( = ?auto_115889 ?auto_115887 ) ) ( not ( = ?auto_115888 ?auto_115887 ) ) ( ON ?auto_115888 ?auto_115889 ) ( not ( = ?auto_115886 ?auto_115887 ) ) ( not ( = ?auto_115882 ?auto_115886 ) ) ( not ( = ?auto_115883 ?auto_115886 ) ) ( not ( = ?auto_115884 ?auto_115886 ) ) ( not ( = ?auto_115885 ?auto_115886 ) ) ( not ( = ?auto_115889 ?auto_115886 ) ) ( not ( = ?auto_115888 ?auto_115886 ) ) ( ON ?auto_115887 ?auto_115888 ) ( CLEAR ?auto_115887 ) ( HOLDING ?auto_115886 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_115886 )
      ( MAKE-4PILE ?auto_115882 ?auto_115883 ?auto_115884 ?auto_115885 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_115890 - BLOCK
      ?auto_115891 - BLOCK
      ?auto_115892 - BLOCK
      ?auto_115893 - BLOCK
    )
    :vars
    (
      ?auto_115896 - BLOCK
      ?auto_115895 - BLOCK
      ?auto_115897 - BLOCK
      ?auto_115894 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115896 ?auto_115893 ) ( ON-TABLE ?auto_115890 ) ( ON ?auto_115891 ?auto_115890 ) ( ON ?auto_115892 ?auto_115891 ) ( ON ?auto_115893 ?auto_115892 ) ( not ( = ?auto_115890 ?auto_115891 ) ) ( not ( = ?auto_115890 ?auto_115892 ) ) ( not ( = ?auto_115890 ?auto_115893 ) ) ( not ( = ?auto_115890 ?auto_115896 ) ) ( not ( = ?auto_115891 ?auto_115892 ) ) ( not ( = ?auto_115891 ?auto_115893 ) ) ( not ( = ?auto_115891 ?auto_115896 ) ) ( not ( = ?auto_115892 ?auto_115893 ) ) ( not ( = ?auto_115892 ?auto_115896 ) ) ( not ( = ?auto_115893 ?auto_115896 ) ) ( not ( = ?auto_115890 ?auto_115895 ) ) ( not ( = ?auto_115890 ?auto_115897 ) ) ( not ( = ?auto_115891 ?auto_115895 ) ) ( not ( = ?auto_115891 ?auto_115897 ) ) ( not ( = ?auto_115892 ?auto_115895 ) ) ( not ( = ?auto_115892 ?auto_115897 ) ) ( not ( = ?auto_115893 ?auto_115895 ) ) ( not ( = ?auto_115893 ?auto_115897 ) ) ( not ( = ?auto_115896 ?auto_115895 ) ) ( not ( = ?auto_115896 ?auto_115897 ) ) ( not ( = ?auto_115895 ?auto_115897 ) ) ( ON ?auto_115895 ?auto_115896 ) ( not ( = ?auto_115894 ?auto_115897 ) ) ( not ( = ?auto_115890 ?auto_115894 ) ) ( not ( = ?auto_115891 ?auto_115894 ) ) ( not ( = ?auto_115892 ?auto_115894 ) ) ( not ( = ?auto_115893 ?auto_115894 ) ) ( not ( = ?auto_115896 ?auto_115894 ) ) ( not ( = ?auto_115895 ?auto_115894 ) ) ( ON ?auto_115897 ?auto_115895 ) ( ON ?auto_115894 ?auto_115897 ) ( CLEAR ?auto_115894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_115890 ?auto_115891 ?auto_115892 ?auto_115893 ?auto_115896 ?auto_115895 ?auto_115897 )
      ( MAKE-4PILE ?auto_115890 ?auto_115891 ?auto_115892 ?auto_115893 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_115902 - BLOCK
      ?auto_115903 - BLOCK
      ?auto_115904 - BLOCK
      ?auto_115905 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_115905 ) ( CLEAR ?auto_115904 ) ( ON-TABLE ?auto_115902 ) ( ON ?auto_115903 ?auto_115902 ) ( ON ?auto_115904 ?auto_115903 ) ( not ( = ?auto_115902 ?auto_115903 ) ) ( not ( = ?auto_115902 ?auto_115904 ) ) ( not ( = ?auto_115902 ?auto_115905 ) ) ( not ( = ?auto_115903 ?auto_115904 ) ) ( not ( = ?auto_115903 ?auto_115905 ) ) ( not ( = ?auto_115904 ?auto_115905 ) ) )
    :subtasks
    ( ( !STACK ?auto_115905 ?auto_115904 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_115906 - BLOCK
      ?auto_115907 - BLOCK
      ?auto_115908 - BLOCK
      ?auto_115909 - BLOCK
    )
    :vars
    (
      ?auto_115910 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_115908 ) ( ON-TABLE ?auto_115906 ) ( ON ?auto_115907 ?auto_115906 ) ( ON ?auto_115908 ?auto_115907 ) ( not ( = ?auto_115906 ?auto_115907 ) ) ( not ( = ?auto_115906 ?auto_115908 ) ) ( not ( = ?auto_115906 ?auto_115909 ) ) ( not ( = ?auto_115907 ?auto_115908 ) ) ( not ( = ?auto_115907 ?auto_115909 ) ) ( not ( = ?auto_115908 ?auto_115909 ) ) ( ON ?auto_115909 ?auto_115910 ) ( CLEAR ?auto_115909 ) ( HAND-EMPTY ) ( not ( = ?auto_115906 ?auto_115910 ) ) ( not ( = ?auto_115907 ?auto_115910 ) ) ( not ( = ?auto_115908 ?auto_115910 ) ) ( not ( = ?auto_115909 ?auto_115910 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_115909 ?auto_115910 )
      ( MAKE-4PILE ?auto_115906 ?auto_115907 ?auto_115908 ?auto_115909 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_115911 - BLOCK
      ?auto_115912 - BLOCK
      ?auto_115913 - BLOCK
      ?auto_115914 - BLOCK
    )
    :vars
    (
      ?auto_115915 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115911 ) ( ON ?auto_115912 ?auto_115911 ) ( not ( = ?auto_115911 ?auto_115912 ) ) ( not ( = ?auto_115911 ?auto_115913 ) ) ( not ( = ?auto_115911 ?auto_115914 ) ) ( not ( = ?auto_115912 ?auto_115913 ) ) ( not ( = ?auto_115912 ?auto_115914 ) ) ( not ( = ?auto_115913 ?auto_115914 ) ) ( ON ?auto_115914 ?auto_115915 ) ( CLEAR ?auto_115914 ) ( not ( = ?auto_115911 ?auto_115915 ) ) ( not ( = ?auto_115912 ?auto_115915 ) ) ( not ( = ?auto_115913 ?auto_115915 ) ) ( not ( = ?auto_115914 ?auto_115915 ) ) ( HOLDING ?auto_115913 ) ( CLEAR ?auto_115912 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_115911 ?auto_115912 ?auto_115913 )
      ( MAKE-4PILE ?auto_115911 ?auto_115912 ?auto_115913 ?auto_115914 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_115916 - BLOCK
      ?auto_115917 - BLOCK
      ?auto_115918 - BLOCK
      ?auto_115919 - BLOCK
    )
    :vars
    (
      ?auto_115920 - BLOCK
      ?auto_115922 - BLOCK
      ?auto_115923 - BLOCK
      ?auto_115921 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115916 ) ( ON ?auto_115917 ?auto_115916 ) ( not ( = ?auto_115916 ?auto_115917 ) ) ( not ( = ?auto_115916 ?auto_115918 ) ) ( not ( = ?auto_115916 ?auto_115919 ) ) ( not ( = ?auto_115917 ?auto_115918 ) ) ( not ( = ?auto_115917 ?auto_115919 ) ) ( not ( = ?auto_115918 ?auto_115919 ) ) ( ON ?auto_115919 ?auto_115920 ) ( not ( = ?auto_115916 ?auto_115920 ) ) ( not ( = ?auto_115917 ?auto_115920 ) ) ( not ( = ?auto_115918 ?auto_115920 ) ) ( not ( = ?auto_115919 ?auto_115920 ) ) ( CLEAR ?auto_115917 ) ( ON ?auto_115918 ?auto_115919 ) ( CLEAR ?auto_115918 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_115922 ) ( ON ?auto_115923 ?auto_115922 ) ( ON ?auto_115921 ?auto_115923 ) ( ON ?auto_115920 ?auto_115921 ) ( not ( = ?auto_115922 ?auto_115923 ) ) ( not ( = ?auto_115922 ?auto_115921 ) ) ( not ( = ?auto_115922 ?auto_115920 ) ) ( not ( = ?auto_115922 ?auto_115919 ) ) ( not ( = ?auto_115922 ?auto_115918 ) ) ( not ( = ?auto_115923 ?auto_115921 ) ) ( not ( = ?auto_115923 ?auto_115920 ) ) ( not ( = ?auto_115923 ?auto_115919 ) ) ( not ( = ?auto_115923 ?auto_115918 ) ) ( not ( = ?auto_115921 ?auto_115920 ) ) ( not ( = ?auto_115921 ?auto_115919 ) ) ( not ( = ?auto_115921 ?auto_115918 ) ) ( not ( = ?auto_115916 ?auto_115922 ) ) ( not ( = ?auto_115916 ?auto_115923 ) ) ( not ( = ?auto_115916 ?auto_115921 ) ) ( not ( = ?auto_115917 ?auto_115922 ) ) ( not ( = ?auto_115917 ?auto_115923 ) ) ( not ( = ?auto_115917 ?auto_115921 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_115922 ?auto_115923 ?auto_115921 ?auto_115920 ?auto_115919 )
      ( MAKE-4PILE ?auto_115916 ?auto_115917 ?auto_115918 ?auto_115919 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_115924 - BLOCK
      ?auto_115925 - BLOCK
      ?auto_115926 - BLOCK
      ?auto_115927 - BLOCK
    )
    :vars
    (
      ?auto_115929 - BLOCK
      ?auto_115931 - BLOCK
      ?auto_115930 - BLOCK
      ?auto_115928 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115924 ) ( not ( = ?auto_115924 ?auto_115925 ) ) ( not ( = ?auto_115924 ?auto_115926 ) ) ( not ( = ?auto_115924 ?auto_115927 ) ) ( not ( = ?auto_115925 ?auto_115926 ) ) ( not ( = ?auto_115925 ?auto_115927 ) ) ( not ( = ?auto_115926 ?auto_115927 ) ) ( ON ?auto_115927 ?auto_115929 ) ( not ( = ?auto_115924 ?auto_115929 ) ) ( not ( = ?auto_115925 ?auto_115929 ) ) ( not ( = ?auto_115926 ?auto_115929 ) ) ( not ( = ?auto_115927 ?auto_115929 ) ) ( ON ?auto_115926 ?auto_115927 ) ( CLEAR ?auto_115926 ) ( ON-TABLE ?auto_115931 ) ( ON ?auto_115930 ?auto_115931 ) ( ON ?auto_115928 ?auto_115930 ) ( ON ?auto_115929 ?auto_115928 ) ( not ( = ?auto_115931 ?auto_115930 ) ) ( not ( = ?auto_115931 ?auto_115928 ) ) ( not ( = ?auto_115931 ?auto_115929 ) ) ( not ( = ?auto_115931 ?auto_115927 ) ) ( not ( = ?auto_115931 ?auto_115926 ) ) ( not ( = ?auto_115930 ?auto_115928 ) ) ( not ( = ?auto_115930 ?auto_115929 ) ) ( not ( = ?auto_115930 ?auto_115927 ) ) ( not ( = ?auto_115930 ?auto_115926 ) ) ( not ( = ?auto_115928 ?auto_115929 ) ) ( not ( = ?auto_115928 ?auto_115927 ) ) ( not ( = ?auto_115928 ?auto_115926 ) ) ( not ( = ?auto_115924 ?auto_115931 ) ) ( not ( = ?auto_115924 ?auto_115930 ) ) ( not ( = ?auto_115924 ?auto_115928 ) ) ( not ( = ?auto_115925 ?auto_115931 ) ) ( not ( = ?auto_115925 ?auto_115930 ) ) ( not ( = ?auto_115925 ?auto_115928 ) ) ( HOLDING ?auto_115925 ) ( CLEAR ?auto_115924 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_115924 ?auto_115925 )
      ( MAKE-4PILE ?auto_115924 ?auto_115925 ?auto_115926 ?auto_115927 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_115932 - BLOCK
      ?auto_115933 - BLOCK
      ?auto_115934 - BLOCK
      ?auto_115935 - BLOCK
    )
    :vars
    (
      ?auto_115939 - BLOCK
      ?auto_115938 - BLOCK
      ?auto_115937 - BLOCK
      ?auto_115936 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115932 ) ( not ( = ?auto_115932 ?auto_115933 ) ) ( not ( = ?auto_115932 ?auto_115934 ) ) ( not ( = ?auto_115932 ?auto_115935 ) ) ( not ( = ?auto_115933 ?auto_115934 ) ) ( not ( = ?auto_115933 ?auto_115935 ) ) ( not ( = ?auto_115934 ?auto_115935 ) ) ( ON ?auto_115935 ?auto_115939 ) ( not ( = ?auto_115932 ?auto_115939 ) ) ( not ( = ?auto_115933 ?auto_115939 ) ) ( not ( = ?auto_115934 ?auto_115939 ) ) ( not ( = ?auto_115935 ?auto_115939 ) ) ( ON ?auto_115934 ?auto_115935 ) ( ON-TABLE ?auto_115938 ) ( ON ?auto_115937 ?auto_115938 ) ( ON ?auto_115936 ?auto_115937 ) ( ON ?auto_115939 ?auto_115936 ) ( not ( = ?auto_115938 ?auto_115937 ) ) ( not ( = ?auto_115938 ?auto_115936 ) ) ( not ( = ?auto_115938 ?auto_115939 ) ) ( not ( = ?auto_115938 ?auto_115935 ) ) ( not ( = ?auto_115938 ?auto_115934 ) ) ( not ( = ?auto_115937 ?auto_115936 ) ) ( not ( = ?auto_115937 ?auto_115939 ) ) ( not ( = ?auto_115937 ?auto_115935 ) ) ( not ( = ?auto_115937 ?auto_115934 ) ) ( not ( = ?auto_115936 ?auto_115939 ) ) ( not ( = ?auto_115936 ?auto_115935 ) ) ( not ( = ?auto_115936 ?auto_115934 ) ) ( not ( = ?auto_115932 ?auto_115938 ) ) ( not ( = ?auto_115932 ?auto_115937 ) ) ( not ( = ?auto_115932 ?auto_115936 ) ) ( not ( = ?auto_115933 ?auto_115938 ) ) ( not ( = ?auto_115933 ?auto_115937 ) ) ( not ( = ?auto_115933 ?auto_115936 ) ) ( CLEAR ?auto_115932 ) ( ON ?auto_115933 ?auto_115934 ) ( CLEAR ?auto_115933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_115938 ?auto_115937 ?auto_115936 ?auto_115939 ?auto_115935 ?auto_115934 )
      ( MAKE-4PILE ?auto_115932 ?auto_115933 ?auto_115934 ?auto_115935 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_115940 - BLOCK
      ?auto_115941 - BLOCK
      ?auto_115942 - BLOCK
      ?auto_115943 - BLOCK
    )
    :vars
    (
      ?auto_115947 - BLOCK
      ?auto_115944 - BLOCK
      ?auto_115946 - BLOCK
      ?auto_115945 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115940 ?auto_115941 ) ) ( not ( = ?auto_115940 ?auto_115942 ) ) ( not ( = ?auto_115940 ?auto_115943 ) ) ( not ( = ?auto_115941 ?auto_115942 ) ) ( not ( = ?auto_115941 ?auto_115943 ) ) ( not ( = ?auto_115942 ?auto_115943 ) ) ( ON ?auto_115943 ?auto_115947 ) ( not ( = ?auto_115940 ?auto_115947 ) ) ( not ( = ?auto_115941 ?auto_115947 ) ) ( not ( = ?auto_115942 ?auto_115947 ) ) ( not ( = ?auto_115943 ?auto_115947 ) ) ( ON ?auto_115942 ?auto_115943 ) ( ON-TABLE ?auto_115944 ) ( ON ?auto_115946 ?auto_115944 ) ( ON ?auto_115945 ?auto_115946 ) ( ON ?auto_115947 ?auto_115945 ) ( not ( = ?auto_115944 ?auto_115946 ) ) ( not ( = ?auto_115944 ?auto_115945 ) ) ( not ( = ?auto_115944 ?auto_115947 ) ) ( not ( = ?auto_115944 ?auto_115943 ) ) ( not ( = ?auto_115944 ?auto_115942 ) ) ( not ( = ?auto_115946 ?auto_115945 ) ) ( not ( = ?auto_115946 ?auto_115947 ) ) ( not ( = ?auto_115946 ?auto_115943 ) ) ( not ( = ?auto_115946 ?auto_115942 ) ) ( not ( = ?auto_115945 ?auto_115947 ) ) ( not ( = ?auto_115945 ?auto_115943 ) ) ( not ( = ?auto_115945 ?auto_115942 ) ) ( not ( = ?auto_115940 ?auto_115944 ) ) ( not ( = ?auto_115940 ?auto_115946 ) ) ( not ( = ?auto_115940 ?auto_115945 ) ) ( not ( = ?auto_115941 ?auto_115944 ) ) ( not ( = ?auto_115941 ?auto_115946 ) ) ( not ( = ?auto_115941 ?auto_115945 ) ) ( ON ?auto_115941 ?auto_115942 ) ( CLEAR ?auto_115941 ) ( HOLDING ?auto_115940 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_115940 )
      ( MAKE-4PILE ?auto_115940 ?auto_115941 ?auto_115942 ?auto_115943 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_115948 - BLOCK
      ?auto_115949 - BLOCK
      ?auto_115950 - BLOCK
      ?auto_115951 - BLOCK
    )
    :vars
    (
      ?auto_115953 - BLOCK
      ?auto_115955 - BLOCK
      ?auto_115954 - BLOCK
      ?auto_115952 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115948 ?auto_115949 ) ) ( not ( = ?auto_115948 ?auto_115950 ) ) ( not ( = ?auto_115948 ?auto_115951 ) ) ( not ( = ?auto_115949 ?auto_115950 ) ) ( not ( = ?auto_115949 ?auto_115951 ) ) ( not ( = ?auto_115950 ?auto_115951 ) ) ( ON ?auto_115951 ?auto_115953 ) ( not ( = ?auto_115948 ?auto_115953 ) ) ( not ( = ?auto_115949 ?auto_115953 ) ) ( not ( = ?auto_115950 ?auto_115953 ) ) ( not ( = ?auto_115951 ?auto_115953 ) ) ( ON ?auto_115950 ?auto_115951 ) ( ON-TABLE ?auto_115955 ) ( ON ?auto_115954 ?auto_115955 ) ( ON ?auto_115952 ?auto_115954 ) ( ON ?auto_115953 ?auto_115952 ) ( not ( = ?auto_115955 ?auto_115954 ) ) ( not ( = ?auto_115955 ?auto_115952 ) ) ( not ( = ?auto_115955 ?auto_115953 ) ) ( not ( = ?auto_115955 ?auto_115951 ) ) ( not ( = ?auto_115955 ?auto_115950 ) ) ( not ( = ?auto_115954 ?auto_115952 ) ) ( not ( = ?auto_115954 ?auto_115953 ) ) ( not ( = ?auto_115954 ?auto_115951 ) ) ( not ( = ?auto_115954 ?auto_115950 ) ) ( not ( = ?auto_115952 ?auto_115953 ) ) ( not ( = ?auto_115952 ?auto_115951 ) ) ( not ( = ?auto_115952 ?auto_115950 ) ) ( not ( = ?auto_115948 ?auto_115955 ) ) ( not ( = ?auto_115948 ?auto_115954 ) ) ( not ( = ?auto_115948 ?auto_115952 ) ) ( not ( = ?auto_115949 ?auto_115955 ) ) ( not ( = ?auto_115949 ?auto_115954 ) ) ( not ( = ?auto_115949 ?auto_115952 ) ) ( ON ?auto_115949 ?auto_115950 ) ( ON ?auto_115948 ?auto_115949 ) ( CLEAR ?auto_115948 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_115955 ?auto_115954 ?auto_115952 ?auto_115953 ?auto_115951 ?auto_115950 ?auto_115949 )
      ( MAKE-4PILE ?auto_115948 ?auto_115949 ?auto_115950 ?auto_115951 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_115959 - BLOCK
      ?auto_115960 - BLOCK
      ?auto_115961 - BLOCK
    )
    :vars
    (
      ?auto_115962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115962 ?auto_115961 ) ( CLEAR ?auto_115962 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_115959 ) ( ON ?auto_115960 ?auto_115959 ) ( ON ?auto_115961 ?auto_115960 ) ( not ( = ?auto_115959 ?auto_115960 ) ) ( not ( = ?auto_115959 ?auto_115961 ) ) ( not ( = ?auto_115959 ?auto_115962 ) ) ( not ( = ?auto_115960 ?auto_115961 ) ) ( not ( = ?auto_115960 ?auto_115962 ) ) ( not ( = ?auto_115961 ?auto_115962 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_115962 ?auto_115961 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_115963 - BLOCK
      ?auto_115964 - BLOCK
      ?auto_115965 - BLOCK
    )
    :vars
    (
      ?auto_115966 - BLOCK
      ?auto_115967 - BLOCK
      ?auto_115968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115966 ?auto_115965 ) ( CLEAR ?auto_115966 ) ( ON-TABLE ?auto_115963 ) ( ON ?auto_115964 ?auto_115963 ) ( ON ?auto_115965 ?auto_115964 ) ( not ( = ?auto_115963 ?auto_115964 ) ) ( not ( = ?auto_115963 ?auto_115965 ) ) ( not ( = ?auto_115963 ?auto_115966 ) ) ( not ( = ?auto_115964 ?auto_115965 ) ) ( not ( = ?auto_115964 ?auto_115966 ) ) ( not ( = ?auto_115965 ?auto_115966 ) ) ( HOLDING ?auto_115967 ) ( CLEAR ?auto_115968 ) ( not ( = ?auto_115963 ?auto_115967 ) ) ( not ( = ?auto_115963 ?auto_115968 ) ) ( not ( = ?auto_115964 ?auto_115967 ) ) ( not ( = ?auto_115964 ?auto_115968 ) ) ( not ( = ?auto_115965 ?auto_115967 ) ) ( not ( = ?auto_115965 ?auto_115968 ) ) ( not ( = ?auto_115966 ?auto_115967 ) ) ( not ( = ?auto_115966 ?auto_115968 ) ) ( not ( = ?auto_115967 ?auto_115968 ) ) )
    :subtasks
    ( ( !STACK ?auto_115967 ?auto_115968 )
      ( MAKE-3PILE ?auto_115963 ?auto_115964 ?auto_115965 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_115969 - BLOCK
      ?auto_115970 - BLOCK
      ?auto_115971 - BLOCK
    )
    :vars
    (
      ?auto_115972 - BLOCK
      ?auto_115973 - BLOCK
      ?auto_115974 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115972 ?auto_115971 ) ( ON-TABLE ?auto_115969 ) ( ON ?auto_115970 ?auto_115969 ) ( ON ?auto_115971 ?auto_115970 ) ( not ( = ?auto_115969 ?auto_115970 ) ) ( not ( = ?auto_115969 ?auto_115971 ) ) ( not ( = ?auto_115969 ?auto_115972 ) ) ( not ( = ?auto_115970 ?auto_115971 ) ) ( not ( = ?auto_115970 ?auto_115972 ) ) ( not ( = ?auto_115971 ?auto_115972 ) ) ( CLEAR ?auto_115973 ) ( not ( = ?auto_115969 ?auto_115974 ) ) ( not ( = ?auto_115969 ?auto_115973 ) ) ( not ( = ?auto_115970 ?auto_115974 ) ) ( not ( = ?auto_115970 ?auto_115973 ) ) ( not ( = ?auto_115971 ?auto_115974 ) ) ( not ( = ?auto_115971 ?auto_115973 ) ) ( not ( = ?auto_115972 ?auto_115974 ) ) ( not ( = ?auto_115972 ?auto_115973 ) ) ( not ( = ?auto_115974 ?auto_115973 ) ) ( ON ?auto_115974 ?auto_115972 ) ( CLEAR ?auto_115974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_115969 ?auto_115970 ?auto_115971 ?auto_115972 )
      ( MAKE-3PILE ?auto_115969 ?auto_115970 ?auto_115971 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_115975 - BLOCK
      ?auto_115976 - BLOCK
      ?auto_115977 - BLOCK
    )
    :vars
    (
      ?auto_115980 - BLOCK
      ?auto_115978 - BLOCK
      ?auto_115979 - BLOCK
      ?auto_115981 - BLOCK
      ?auto_115982 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115980 ?auto_115977 ) ( ON-TABLE ?auto_115975 ) ( ON ?auto_115976 ?auto_115975 ) ( ON ?auto_115977 ?auto_115976 ) ( not ( = ?auto_115975 ?auto_115976 ) ) ( not ( = ?auto_115975 ?auto_115977 ) ) ( not ( = ?auto_115975 ?auto_115980 ) ) ( not ( = ?auto_115976 ?auto_115977 ) ) ( not ( = ?auto_115976 ?auto_115980 ) ) ( not ( = ?auto_115977 ?auto_115980 ) ) ( not ( = ?auto_115975 ?auto_115978 ) ) ( not ( = ?auto_115975 ?auto_115979 ) ) ( not ( = ?auto_115976 ?auto_115978 ) ) ( not ( = ?auto_115976 ?auto_115979 ) ) ( not ( = ?auto_115977 ?auto_115978 ) ) ( not ( = ?auto_115977 ?auto_115979 ) ) ( not ( = ?auto_115980 ?auto_115978 ) ) ( not ( = ?auto_115980 ?auto_115979 ) ) ( not ( = ?auto_115978 ?auto_115979 ) ) ( ON ?auto_115978 ?auto_115980 ) ( CLEAR ?auto_115978 ) ( HOLDING ?auto_115979 ) ( CLEAR ?auto_115981 ) ( ON-TABLE ?auto_115982 ) ( ON ?auto_115981 ?auto_115982 ) ( not ( = ?auto_115982 ?auto_115981 ) ) ( not ( = ?auto_115982 ?auto_115979 ) ) ( not ( = ?auto_115981 ?auto_115979 ) ) ( not ( = ?auto_115975 ?auto_115981 ) ) ( not ( = ?auto_115975 ?auto_115982 ) ) ( not ( = ?auto_115976 ?auto_115981 ) ) ( not ( = ?auto_115976 ?auto_115982 ) ) ( not ( = ?auto_115977 ?auto_115981 ) ) ( not ( = ?auto_115977 ?auto_115982 ) ) ( not ( = ?auto_115980 ?auto_115981 ) ) ( not ( = ?auto_115980 ?auto_115982 ) ) ( not ( = ?auto_115978 ?auto_115981 ) ) ( not ( = ?auto_115978 ?auto_115982 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_115982 ?auto_115981 ?auto_115979 )
      ( MAKE-3PILE ?auto_115975 ?auto_115976 ?auto_115977 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_115983 - BLOCK
      ?auto_115984 - BLOCK
      ?auto_115985 - BLOCK
    )
    :vars
    (
      ?auto_115986 - BLOCK
      ?auto_115989 - BLOCK
      ?auto_115990 - BLOCK
      ?auto_115988 - BLOCK
      ?auto_115987 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115986 ?auto_115985 ) ( ON-TABLE ?auto_115983 ) ( ON ?auto_115984 ?auto_115983 ) ( ON ?auto_115985 ?auto_115984 ) ( not ( = ?auto_115983 ?auto_115984 ) ) ( not ( = ?auto_115983 ?auto_115985 ) ) ( not ( = ?auto_115983 ?auto_115986 ) ) ( not ( = ?auto_115984 ?auto_115985 ) ) ( not ( = ?auto_115984 ?auto_115986 ) ) ( not ( = ?auto_115985 ?auto_115986 ) ) ( not ( = ?auto_115983 ?auto_115989 ) ) ( not ( = ?auto_115983 ?auto_115990 ) ) ( not ( = ?auto_115984 ?auto_115989 ) ) ( not ( = ?auto_115984 ?auto_115990 ) ) ( not ( = ?auto_115985 ?auto_115989 ) ) ( not ( = ?auto_115985 ?auto_115990 ) ) ( not ( = ?auto_115986 ?auto_115989 ) ) ( not ( = ?auto_115986 ?auto_115990 ) ) ( not ( = ?auto_115989 ?auto_115990 ) ) ( ON ?auto_115989 ?auto_115986 ) ( CLEAR ?auto_115988 ) ( ON-TABLE ?auto_115987 ) ( ON ?auto_115988 ?auto_115987 ) ( not ( = ?auto_115987 ?auto_115988 ) ) ( not ( = ?auto_115987 ?auto_115990 ) ) ( not ( = ?auto_115988 ?auto_115990 ) ) ( not ( = ?auto_115983 ?auto_115988 ) ) ( not ( = ?auto_115983 ?auto_115987 ) ) ( not ( = ?auto_115984 ?auto_115988 ) ) ( not ( = ?auto_115984 ?auto_115987 ) ) ( not ( = ?auto_115985 ?auto_115988 ) ) ( not ( = ?auto_115985 ?auto_115987 ) ) ( not ( = ?auto_115986 ?auto_115988 ) ) ( not ( = ?auto_115986 ?auto_115987 ) ) ( not ( = ?auto_115989 ?auto_115988 ) ) ( not ( = ?auto_115989 ?auto_115987 ) ) ( ON ?auto_115990 ?auto_115989 ) ( CLEAR ?auto_115990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_115983 ?auto_115984 ?auto_115985 ?auto_115986 ?auto_115989 )
      ( MAKE-3PILE ?auto_115983 ?auto_115984 ?auto_115985 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_115991 - BLOCK
      ?auto_115992 - BLOCK
      ?auto_115993 - BLOCK
    )
    :vars
    (
      ?auto_115998 - BLOCK
      ?auto_115994 - BLOCK
      ?auto_115997 - BLOCK
      ?auto_115996 - BLOCK
      ?auto_115995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115998 ?auto_115993 ) ( ON-TABLE ?auto_115991 ) ( ON ?auto_115992 ?auto_115991 ) ( ON ?auto_115993 ?auto_115992 ) ( not ( = ?auto_115991 ?auto_115992 ) ) ( not ( = ?auto_115991 ?auto_115993 ) ) ( not ( = ?auto_115991 ?auto_115998 ) ) ( not ( = ?auto_115992 ?auto_115993 ) ) ( not ( = ?auto_115992 ?auto_115998 ) ) ( not ( = ?auto_115993 ?auto_115998 ) ) ( not ( = ?auto_115991 ?auto_115994 ) ) ( not ( = ?auto_115991 ?auto_115997 ) ) ( not ( = ?auto_115992 ?auto_115994 ) ) ( not ( = ?auto_115992 ?auto_115997 ) ) ( not ( = ?auto_115993 ?auto_115994 ) ) ( not ( = ?auto_115993 ?auto_115997 ) ) ( not ( = ?auto_115998 ?auto_115994 ) ) ( not ( = ?auto_115998 ?auto_115997 ) ) ( not ( = ?auto_115994 ?auto_115997 ) ) ( ON ?auto_115994 ?auto_115998 ) ( ON-TABLE ?auto_115996 ) ( not ( = ?auto_115996 ?auto_115995 ) ) ( not ( = ?auto_115996 ?auto_115997 ) ) ( not ( = ?auto_115995 ?auto_115997 ) ) ( not ( = ?auto_115991 ?auto_115995 ) ) ( not ( = ?auto_115991 ?auto_115996 ) ) ( not ( = ?auto_115992 ?auto_115995 ) ) ( not ( = ?auto_115992 ?auto_115996 ) ) ( not ( = ?auto_115993 ?auto_115995 ) ) ( not ( = ?auto_115993 ?auto_115996 ) ) ( not ( = ?auto_115998 ?auto_115995 ) ) ( not ( = ?auto_115998 ?auto_115996 ) ) ( not ( = ?auto_115994 ?auto_115995 ) ) ( not ( = ?auto_115994 ?auto_115996 ) ) ( ON ?auto_115997 ?auto_115994 ) ( CLEAR ?auto_115997 ) ( HOLDING ?auto_115995 ) ( CLEAR ?auto_115996 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_115996 ?auto_115995 )
      ( MAKE-3PILE ?auto_115991 ?auto_115992 ?auto_115993 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_115999 - BLOCK
      ?auto_116000 - BLOCK
      ?auto_116001 - BLOCK
    )
    :vars
    (
      ?auto_116002 - BLOCK
      ?auto_116004 - BLOCK
      ?auto_116003 - BLOCK
      ?auto_116005 - BLOCK
      ?auto_116006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116002 ?auto_116001 ) ( ON-TABLE ?auto_115999 ) ( ON ?auto_116000 ?auto_115999 ) ( ON ?auto_116001 ?auto_116000 ) ( not ( = ?auto_115999 ?auto_116000 ) ) ( not ( = ?auto_115999 ?auto_116001 ) ) ( not ( = ?auto_115999 ?auto_116002 ) ) ( not ( = ?auto_116000 ?auto_116001 ) ) ( not ( = ?auto_116000 ?auto_116002 ) ) ( not ( = ?auto_116001 ?auto_116002 ) ) ( not ( = ?auto_115999 ?auto_116004 ) ) ( not ( = ?auto_115999 ?auto_116003 ) ) ( not ( = ?auto_116000 ?auto_116004 ) ) ( not ( = ?auto_116000 ?auto_116003 ) ) ( not ( = ?auto_116001 ?auto_116004 ) ) ( not ( = ?auto_116001 ?auto_116003 ) ) ( not ( = ?auto_116002 ?auto_116004 ) ) ( not ( = ?auto_116002 ?auto_116003 ) ) ( not ( = ?auto_116004 ?auto_116003 ) ) ( ON ?auto_116004 ?auto_116002 ) ( ON-TABLE ?auto_116005 ) ( not ( = ?auto_116005 ?auto_116006 ) ) ( not ( = ?auto_116005 ?auto_116003 ) ) ( not ( = ?auto_116006 ?auto_116003 ) ) ( not ( = ?auto_115999 ?auto_116006 ) ) ( not ( = ?auto_115999 ?auto_116005 ) ) ( not ( = ?auto_116000 ?auto_116006 ) ) ( not ( = ?auto_116000 ?auto_116005 ) ) ( not ( = ?auto_116001 ?auto_116006 ) ) ( not ( = ?auto_116001 ?auto_116005 ) ) ( not ( = ?auto_116002 ?auto_116006 ) ) ( not ( = ?auto_116002 ?auto_116005 ) ) ( not ( = ?auto_116004 ?auto_116006 ) ) ( not ( = ?auto_116004 ?auto_116005 ) ) ( ON ?auto_116003 ?auto_116004 ) ( CLEAR ?auto_116005 ) ( ON ?auto_116006 ?auto_116003 ) ( CLEAR ?auto_116006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_115999 ?auto_116000 ?auto_116001 ?auto_116002 ?auto_116004 ?auto_116003 )
      ( MAKE-3PILE ?auto_115999 ?auto_116000 ?auto_116001 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_116007 - BLOCK
      ?auto_116008 - BLOCK
      ?auto_116009 - BLOCK
    )
    :vars
    (
      ?auto_116014 - BLOCK
      ?auto_116011 - BLOCK
      ?auto_116012 - BLOCK
      ?auto_116013 - BLOCK
      ?auto_116010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116014 ?auto_116009 ) ( ON-TABLE ?auto_116007 ) ( ON ?auto_116008 ?auto_116007 ) ( ON ?auto_116009 ?auto_116008 ) ( not ( = ?auto_116007 ?auto_116008 ) ) ( not ( = ?auto_116007 ?auto_116009 ) ) ( not ( = ?auto_116007 ?auto_116014 ) ) ( not ( = ?auto_116008 ?auto_116009 ) ) ( not ( = ?auto_116008 ?auto_116014 ) ) ( not ( = ?auto_116009 ?auto_116014 ) ) ( not ( = ?auto_116007 ?auto_116011 ) ) ( not ( = ?auto_116007 ?auto_116012 ) ) ( not ( = ?auto_116008 ?auto_116011 ) ) ( not ( = ?auto_116008 ?auto_116012 ) ) ( not ( = ?auto_116009 ?auto_116011 ) ) ( not ( = ?auto_116009 ?auto_116012 ) ) ( not ( = ?auto_116014 ?auto_116011 ) ) ( not ( = ?auto_116014 ?auto_116012 ) ) ( not ( = ?auto_116011 ?auto_116012 ) ) ( ON ?auto_116011 ?auto_116014 ) ( not ( = ?auto_116013 ?auto_116010 ) ) ( not ( = ?auto_116013 ?auto_116012 ) ) ( not ( = ?auto_116010 ?auto_116012 ) ) ( not ( = ?auto_116007 ?auto_116010 ) ) ( not ( = ?auto_116007 ?auto_116013 ) ) ( not ( = ?auto_116008 ?auto_116010 ) ) ( not ( = ?auto_116008 ?auto_116013 ) ) ( not ( = ?auto_116009 ?auto_116010 ) ) ( not ( = ?auto_116009 ?auto_116013 ) ) ( not ( = ?auto_116014 ?auto_116010 ) ) ( not ( = ?auto_116014 ?auto_116013 ) ) ( not ( = ?auto_116011 ?auto_116010 ) ) ( not ( = ?auto_116011 ?auto_116013 ) ) ( ON ?auto_116012 ?auto_116011 ) ( ON ?auto_116010 ?auto_116012 ) ( CLEAR ?auto_116010 ) ( HOLDING ?auto_116013 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_116013 )
      ( MAKE-3PILE ?auto_116007 ?auto_116008 ?auto_116009 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_116015 - BLOCK
      ?auto_116016 - BLOCK
      ?auto_116017 - BLOCK
    )
    :vars
    (
      ?auto_116022 - BLOCK
      ?auto_116021 - BLOCK
      ?auto_116019 - BLOCK
      ?auto_116020 - BLOCK
      ?auto_116018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116022 ?auto_116017 ) ( ON-TABLE ?auto_116015 ) ( ON ?auto_116016 ?auto_116015 ) ( ON ?auto_116017 ?auto_116016 ) ( not ( = ?auto_116015 ?auto_116016 ) ) ( not ( = ?auto_116015 ?auto_116017 ) ) ( not ( = ?auto_116015 ?auto_116022 ) ) ( not ( = ?auto_116016 ?auto_116017 ) ) ( not ( = ?auto_116016 ?auto_116022 ) ) ( not ( = ?auto_116017 ?auto_116022 ) ) ( not ( = ?auto_116015 ?auto_116021 ) ) ( not ( = ?auto_116015 ?auto_116019 ) ) ( not ( = ?auto_116016 ?auto_116021 ) ) ( not ( = ?auto_116016 ?auto_116019 ) ) ( not ( = ?auto_116017 ?auto_116021 ) ) ( not ( = ?auto_116017 ?auto_116019 ) ) ( not ( = ?auto_116022 ?auto_116021 ) ) ( not ( = ?auto_116022 ?auto_116019 ) ) ( not ( = ?auto_116021 ?auto_116019 ) ) ( ON ?auto_116021 ?auto_116022 ) ( not ( = ?auto_116020 ?auto_116018 ) ) ( not ( = ?auto_116020 ?auto_116019 ) ) ( not ( = ?auto_116018 ?auto_116019 ) ) ( not ( = ?auto_116015 ?auto_116018 ) ) ( not ( = ?auto_116015 ?auto_116020 ) ) ( not ( = ?auto_116016 ?auto_116018 ) ) ( not ( = ?auto_116016 ?auto_116020 ) ) ( not ( = ?auto_116017 ?auto_116018 ) ) ( not ( = ?auto_116017 ?auto_116020 ) ) ( not ( = ?auto_116022 ?auto_116018 ) ) ( not ( = ?auto_116022 ?auto_116020 ) ) ( not ( = ?auto_116021 ?auto_116018 ) ) ( not ( = ?auto_116021 ?auto_116020 ) ) ( ON ?auto_116019 ?auto_116021 ) ( ON ?auto_116018 ?auto_116019 ) ( ON ?auto_116020 ?auto_116018 ) ( CLEAR ?auto_116020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_116015 ?auto_116016 ?auto_116017 ?auto_116022 ?auto_116021 ?auto_116019 ?auto_116018 )
      ( MAKE-3PILE ?auto_116015 ?auto_116016 ?auto_116017 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116028 - BLOCK
      ?auto_116029 - BLOCK
      ?auto_116030 - BLOCK
      ?auto_116031 - BLOCK
      ?auto_116032 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_116032 ) ( CLEAR ?auto_116031 ) ( ON-TABLE ?auto_116028 ) ( ON ?auto_116029 ?auto_116028 ) ( ON ?auto_116030 ?auto_116029 ) ( ON ?auto_116031 ?auto_116030 ) ( not ( = ?auto_116028 ?auto_116029 ) ) ( not ( = ?auto_116028 ?auto_116030 ) ) ( not ( = ?auto_116028 ?auto_116031 ) ) ( not ( = ?auto_116028 ?auto_116032 ) ) ( not ( = ?auto_116029 ?auto_116030 ) ) ( not ( = ?auto_116029 ?auto_116031 ) ) ( not ( = ?auto_116029 ?auto_116032 ) ) ( not ( = ?auto_116030 ?auto_116031 ) ) ( not ( = ?auto_116030 ?auto_116032 ) ) ( not ( = ?auto_116031 ?auto_116032 ) ) )
    :subtasks
    ( ( !STACK ?auto_116032 ?auto_116031 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116033 - BLOCK
      ?auto_116034 - BLOCK
      ?auto_116035 - BLOCK
      ?auto_116036 - BLOCK
      ?auto_116037 - BLOCK
    )
    :vars
    (
      ?auto_116038 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_116036 ) ( ON-TABLE ?auto_116033 ) ( ON ?auto_116034 ?auto_116033 ) ( ON ?auto_116035 ?auto_116034 ) ( ON ?auto_116036 ?auto_116035 ) ( not ( = ?auto_116033 ?auto_116034 ) ) ( not ( = ?auto_116033 ?auto_116035 ) ) ( not ( = ?auto_116033 ?auto_116036 ) ) ( not ( = ?auto_116033 ?auto_116037 ) ) ( not ( = ?auto_116034 ?auto_116035 ) ) ( not ( = ?auto_116034 ?auto_116036 ) ) ( not ( = ?auto_116034 ?auto_116037 ) ) ( not ( = ?auto_116035 ?auto_116036 ) ) ( not ( = ?auto_116035 ?auto_116037 ) ) ( not ( = ?auto_116036 ?auto_116037 ) ) ( ON ?auto_116037 ?auto_116038 ) ( CLEAR ?auto_116037 ) ( HAND-EMPTY ) ( not ( = ?auto_116033 ?auto_116038 ) ) ( not ( = ?auto_116034 ?auto_116038 ) ) ( not ( = ?auto_116035 ?auto_116038 ) ) ( not ( = ?auto_116036 ?auto_116038 ) ) ( not ( = ?auto_116037 ?auto_116038 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_116037 ?auto_116038 )
      ( MAKE-5PILE ?auto_116033 ?auto_116034 ?auto_116035 ?auto_116036 ?auto_116037 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116039 - BLOCK
      ?auto_116040 - BLOCK
      ?auto_116041 - BLOCK
      ?auto_116042 - BLOCK
      ?auto_116043 - BLOCK
    )
    :vars
    (
      ?auto_116044 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116039 ) ( ON ?auto_116040 ?auto_116039 ) ( ON ?auto_116041 ?auto_116040 ) ( not ( = ?auto_116039 ?auto_116040 ) ) ( not ( = ?auto_116039 ?auto_116041 ) ) ( not ( = ?auto_116039 ?auto_116042 ) ) ( not ( = ?auto_116039 ?auto_116043 ) ) ( not ( = ?auto_116040 ?auto_116041 ) ) ( not ( = ?auto_116040 ?auto_116042 ) ) ( not ( = ?auto_116040 ?auto_116043 ) ) ( not ( = ?auto_116041 ?auto_116042 ) ) ( not ( = ?auto_116041 ?auto_116043 ) ) ( not ( = ?auto_116042 ?auto_116043 ) ) ( ON ?auto_116043 ?auto_116044 ) ( CLEAR ?auto_116043 ) ( not ( = ?auto_116039 ?auto_116044 ) ) ( not ( = ?auto_116040 ?auto_116044 ) ) ( not ( = ?auto_116041 ?auto_116044 ) ) ( not ( = ?auto_116042 ?auto_116044 ) ) ( not ( = ?auto_116043 ?auto_116044 ) ) ( HOLDING ?auto_116042 ) ( CLEAR ?auto_116041 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_116039 ?auto_116040 ?auto_116041 ?auto_116042 )
      ( MAKE-5PILE ?auto_116039 ?auto_116040 ?auto_116041 ?auto_116042 ?auto_116043 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116045 - BLOCK
      ?auto_116046 - BLOCK
      ?auto_116047 - BLOCK
      ?auto_116048 - BLOCK
      ?auto_116049 - BLOCK
    )
    :vars
    (
      ?auto_116050 - BLOCK
      ?auto_116051 - BLOCK
      ?auto_116052 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116045 ) ( ON ?auto_116046 ?auto_116045 ) ( ON ?auto_116047 ?auto_116046 ) ( not ( = ?auto_116045 ?auto_116046 ) ) ( not ( = ?auto_116045 ?auto_116047 ) ) ( not ( = ?auto_116045 ?auto_116048 ) ) ( not ( = ?auto_116045 ?auto_116049 ) ) ( not ( = ?auto_116046 ?auto_116047 ) ) ( not ( = ?auto_116046 ?auto_116048 ) ) ( not ( = ?auto_116046 ?auto_116049 ) ) ( not ( = ?auto_116047 ?auto_116048 ) ) ( not ( = ?auto_116047 ?auto_116049 ) ) ( not ( = ?auto_116048 ?auto_116049 ) ) ( ON ?auto_116049 ?auto_116050 ) ( not ( = ?auto_116045 ?auto_116050 ) ) ( not ( = ?auto_116046 ?auto_116050 ) ) ( not ( = ?auto_116047 ?auto_116050 ) ) ( not ( = ?auto_116048 ?auto_116050 ) ) ( not ( = ?auto_116049 ?auto_116050 ) ) ( CLEAR ?auto_116047 ) ( ON ?auto_116048 ?auto_116049 ) ( CLEAR ?auto_116048 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_116051 ) ( ON ?auto_116052 ?auto_116051 ) ( ON ?auto_116050 ?auto_116052 ) ( not ( = ?auto_116051 ?auto_116052 ) ) ( not ( = ?auto_116051 ?auto_116050 ) ) ( not ( = ?auto_116051 ?auto_116049 ) ) ( not ( = ?auto_116051 ?auto_116048 ) ) ( not ( = ?auto_116052 ?auto_116050 ) ) ( not ( = ?auto_116052 ?auto_116049 ) ) ( not ( = ?auto_116052 ?auto_116048 ) ) ( not ( = ?auto_116045 ?auto_116051 ) ) ( not ( = ?auto_116045 ?auto_116052 ) ) ( not ( = ?auto_116046 ?auto_116051 ) ) ( not ( = ?auto_116046 ?auto_116052 ) ) ( not ( = ?auto_116047 ?auto_116051 ) ) ( not ( = ?auto_116047 ?auto_116052 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_116051 ?auto_116052 ?auto_116050 ?auto_116049 )
      ( MAKE-5PILE ?auto_116045 ?auto_116046 ?auto_116047 ?auto_116048 ?auto_116049 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116053 - BLOCK
      ?auto_116054 - BLOCK
      ?auto_116055 - BLOCK
      ?auto_116056 - BLOCK
      ?auto_116057 - BLOCK
    )
    :vars
    (
      ?auto_116060 - BLOCK
      ?auto_116058 - BLOCK
      ?auto_116059 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116053 ) ( ON ?auto_116054 ?auto_116053 ) ( not ( = ?auto_116053 ?auto_116054 ) ) ( not ( = ?auto_116053 ?auto_116055 ) ) ( not ( = ?auto_116053 ?auto_116056 ) ) ( not ( = ?auto_116053 ?auto_116057 ) ) ( not ( = ?auto_116054 ?auto_116055 ) ) ( not ( = ?auto_116054 ?auto_116056 ) ) ( not ( = ?auto_116054 ?auto_116057 ) ) ( not ( = ?auto_116055 ?auto_116056 ) ) ( not ( = ?auto_116055 ?auto_116057 ) ) ( not ( = ?auto_116056 ?auto_116057 ) ) ( ON ?auto_116057 ?auto_116060 ) ( not ( = ?auto_116053 ?auto_116060 ) ) ( not ( = ?auto_116054 ?auto_116060 ) ) ( not ( = ?auto_116055 ?auto_116060 ) ) ( not ( = ?auto_116056 ?auto_116060 ) ) ( not ( = ?auto_116057 ?auto_116060 ) ) ( ON ?auto_116056 ?auto_116057 ) ( CLEAR ?auto_116056 ) ( ON-TABLE ?auto_116058 ) ( ON ?auto_116059 ?auto_116058 ) ( ON ?auto_116060 ?auto_116059 ) ( not ( = ?auto_116058 ?auto_116059 ) ) ( not ( = ?auto_116058 ?auto_116060 ) ) ( not ( = ?auto_116058 ?auto_116057 ) ) ( not ( = ?auto_116058 ?auto_116056 ) ) ( not ( = ?auto_116059 ?auto_116060 ) ) ( not ( = ?auto_116059 ?auto_116057 ) ) ( not ( = ?auto_116059 ?auto_116056 ) ) ( not ( = ?auto_116053 ?auto_116058 ) ) ( not ( = ?auto_116053 ?auto_116059 ) ) ( not ( = ?auto_116054 ?auto_116058 ) ) ( not ( = ?auto_116054 ?auto_116059 ) ) ( not ( = ?auto_116055 ?auto_116058 ) ) ( not ( = ?auto_116055 ?auto_116059 ) ) ( HOLDING ?auto_116055 ) ( CLEAR ?auto_116054 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_116053 ?auto_116054 ?auto_116055 )
      ( MAKE-5PILE ?auto_116053 ?auto_116054 ?auto_116055 ?auto_116056 ?auto_116057 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116061 - BLOCK
      ?auto_116062 - BLOCK
      ?auto_116063 - BLOCK
      ?auto_116064 - BLOCK
      ?auto_116065 - BLOCK
    )
    :vars
    (
      ?auto_116068 - BLOCK
      ?auto_116067 - BLOCK
      ?auto_116066 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116061 ) ( ON ?auto_116062 ?auto_116061 ) ( not ( = ?auto_116061 ?auto_116062 ) ) ( not ( = ?auto_116061 ?auto_116063 ) ) ( not ( = ?auto_116061 ?auto_116064 ) ) ( not ( = ?auto_116061 ?auto_116065 ) ) ( not ( = ?auto_116062 ?auto_116063 ) ) ( not ( = ?auto_116062 ?auto_116064 ) ) ( not ( = ?auto_116062 ?auto_116065 ) ) ( not ( = ?auto_116063 ?auto_116064 ) ) ( not ( = ?auto_116063 ?auto_116065 ) ) ( not ( = ?auto_116064 ?auto_116065 ) ) ( ON ?auto_116065 ?auto_116068 ) ( not ( = ?auto_116061 ?auto_116068 ) ) ( not ( = ?auto_116062 ?auto_116068 ) ) ( not ( = ?auto_116063 ?auto_116068 ) ) ( not ( = ?auto_116064 ?auto_116068 ) ) ( not ( = ?auto_116065 ?auto_116068 ) ) ( ON ?auto_116064 ?auto_116065 ) ( ON-TABLE ?auto_116067 ) ( ON ?auto_116066 ?auto_116067 ) ( ON ?auto_116068 ?auto_116066 ) ( not ( = ?auto_116067 ?auto_116066 ) ) ( not ( = ?auto_116067 ?auto_116068 ) ) ( not ( = ?auto_116067 ?auto_116065 ) ) ( not ( = ?auto_116067 ?auto_116064 ) ) ( not ( = ?auto_116066 ?auto_116068 ) ) ( not ( = ?auto_116066 ?auto_116065 ) ) ( not ( = ?auto_116066 ?auto_116064 ) ) ( not ( = ?auto_116061 ?auto_116067 ) ) ( not ( = ?auto_116061 ?auto_116066 ) ) ( not ( = ?auto_116062 ?auto_116067 ) ) ( not ( = ?auto_116062 ?auto_116066 ) ) ( not ( = ?auto_116063 ?auto_116067 ) ) ( not ( = ?auto_116063 ?auto_116066 ) ) ( CLEAR ?auto_116062 ) ( ON ?auto_116063 ?auto_116064 ) ( CLEAR ?auto_116063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_116067 ?auto_116066 ?auto_116068 ?auto_116065 ?auto_116064 )
      ( MAKE-5PILE ?auto_116061 ?auto_116062 ?auto_116063 ?auto_116064 ?auto_116065 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116069 - BLOCK
      ?auto_116070 - BLOCK
      ?auto_116071 - BLOCK
      ?auto_116072 - BLOCK
      ?auto_116073 - BLOCK
    )
    :vars
    (
      ?auto_116074 - BLOCK
      ?auto_116076 - BLOCK
      ?auto_116075 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116069 ) ( not ( = ?auto_116069 ?auto_116070 ) ) ( not ( = ?auto_116069 ?auto_116071 ) ) ( not ( = ?auto_116069 ?auto_116072 ) ) ( not ( = ?auto_116069 ?auto_116073 ) ) ( not ( = ?auto_116070 ?auto_116071 ) ) ( not ( = ?auto_116070 ?auto_116072 ) ) ( not ( = ?auto_116070 ?auto_116073 ) ) ( not ( = ?auto_116071 ?auto_116072 ) ) ( not ( = ?auto_116071 ?auto_116073 ) ) ( not ( = ?auto_116072 ?auto_116073 ) ) ( ON ?auto_116073 ?auto_116074 ) ( not ( = ?auto_116069 ?auto_116074 ) ) ( not ( = ?auto_116070 ?auto_116074 ) ) ( not ( = ?auto_116071 ?auto_116074 ) ) ( not ( = ?auto_116072 ?auto_116074 ) ) ( not ( = ?auto_116073 ?auto_116074 ) ) ( ON ?auto_116072 ?auto_116073 ) ( ON-TABLE ?auto_116076 ) ( ON ?auto_116075 ?auto_116076 ) ( ON ?auto_116074 ?auto_116075 ) ( not ( = ?auto_116076 ?auto_116075 ) ) ( not ( = ?auto_116076 ?auto_116074 ) ) ( not ( = ?auto_116076 ?auto_116073 ) ) ( not ( = ?auto_116076 ?auto_116072 ) ) ( not ( = ?auto_116075 ?auto_116074 ) ) ( not ( = ?auto_116075 ?auto_116073 ) ) ( not ( = ?auto_116075 ?auto_116072 ) ) ( not ( = ?auto_116069 ?auto_116076 ) ) ( not ( = ?auto_116069 ?auto_116075 ) ) ( not ( = ?auto_116070 ?auto_116076 ) ) ( not ( = ?auto_116070 ?auto_116075 ) ) ( not ( = ?auto_116071 ?auto_116076 ) ) ( not ( = ?auto_116071 ?auto_116075 ) ) ( ON ?auto_116071 ?auto_116072 ) ( CLEAR ?auto_116071 ) ( HOLDING ?auto_116070 ) ( CLEAR ?auto_116069 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_116069 ?auto_116070 )
      ( MAKE-5PILE ?auto_116069 ?auto_116070 ?auto_116071 ?auto_116072 ?auto_116073 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116077 - BLOCK
      ?auto_116078 - BLOCK
      ?auto_116079 - BLOCK
      ?auto_116080 - BLOCK
      ?auto_116081 - BLOCK
    )
    :vars
    (
      ?auto_116082 - BLOCK
      ?auto_116083 - BLOCK
      ?auto_116084 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116077 ) ( not ( = ?auto_116077 ?auto_116078 ) ) ( not ( = ?auto_116077 ?auto_116079 ) ) ( not ( = ?auto_116077 ?auto_116080 ) ) ( not ( = ?auto_116077 ?auto_116081 ) ) ( not ( = ?auto_116078 ?auto_116079 ) ) ( not ( = ?auto_116078 ?auto_116080 ) ) ( not ( = ?auto_116078 ?auto_116081 ) ) ( not ( = ?auto_116079 ?auto_116080 ) ) ( not ( = ?auto_116079 ?auto_116081 ) ) ( not ( = ?auto_116080 ?auto_116081 ) ) ( ON ?auto_116081 ?auto_116082 ) ( not ( = ?auto_116077 ?auto_116082 ) ) ( not ( = ?auto_116078 ?auto_116082 ) ) ( not ( = ?auto_116079 ?auto_116082 ) ) ( not ( = ?auto_116080 ?auto_116082 ) ) ( not ( = ?auto_116081 ?auto_116082 ) ) ( ON ?auto_116080 ?auto_116081 ) ( ON-TABLE ?auto_116083 ) ( ON ?auto_116084 ?auto_116083 ) ( ON ?auto_116082 ?auto_116084 ) ( not ( = ?auto_116083 ?auto_116084 ) ) ( not ( = ?auto_116083 ?auto_116082 ) ) ( not ( = ?auto_116083 ?auto_116081 ) ) ( not ( = ?auto_116083 ?auto_116080 ) ) ( not ( = ?auto_116084 ?auto_116082 ) ) ( not ( = ?auto_116084 ?auto_116081 ) ) ( not ( = ?auto_116084 ?auto_116080 ) ) ( not ( = ?auto_116077 ?auto_116083 ) ) ( not ( = ?auto_116077 ?auto_116084 ) ) ( not ( = ?auto_116078 ?auto_116083 ) ) ( not ( = ?auto_116078 ?auto_116084 ) ) ( not ( = ?auto_116079 ?auto_116083 ) ) ( not ( = ?auto_116079 ?auto_116084 ) ) ( ON ?auto_116079 ?auto_116080 ) ( CLEAR ?auto_116077 ) ( ON ?auto_116078 ?auto_116079 ) ( CLEAR ?auto_116078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_116083 ?auto_116084 ?auto_116082 ?auto_116081 ?auto_116080 ?auto_116079 )
      ( MAKE-5PILE ?auto_116077 ?auto_116078 ?auto_116079 ?auto_116080 ?auto_116081 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116085 - BLOCK
      ?auto_116086 - BLOCK
      ?auto_116087 - BLOCK
      ?auto_116088 - BLOCK
      ?auto_116089 - BLOCK
    )
    :vars
    (
      ?auto_116091 - BLOCK
      ?auto_116092 - BLOCK
      ?auto_116090 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116085 ?auto_116086 ) ) ( not ( = ?auto_116085 ?auto_116087 ) ) ( not ( = ?auto_116085 ?auto_116088 ) ) ( not ( = ?auto_116085 ?auto_116089 ) ) ( not ( = ?auto_116086 ?auto_116087 ) ) ( not ( = ?auto_116086 ?auto_116088 ) ) ( not ( = ?auto_116086 ?auto_116089 ) ) ( not ( = ?auto_116087 ?auto_116088 ) ) ( not ( = ?auto_116087 ?auto_116089 ) ) ( not ( = ?auto_116088 ?auto_116089 ) ) ( ON ?auto_116089 ?auto_116091 ) ( not ( = ?auto_116085 ?auto_116091 ) ) ( not ( = ?auto_116086 ?auto_116091 ) ) ( not ( = ?auto_116087 ?auto_116091 ) ) ( not ( = ?auto_116088 ?auto_116091 ) ) ( not ( = ?auto_116089 ?auto_116091 ) ) ( ON ?auto_116088 ?auto_116089 ) ( ON-TABLE ?auto_116092 ) ( ON ?auto_116090 ?auto_116092 ) ( ON ?auto_116091 ?auto_116090 ) ( not ( = ?auto_116092 ?auto_116090 ) ) ( not ( = ?auto_116092 ?auto_116091 ) ) ( not ( = ?auto_116092 ?auto_116089 ) ) ( not ( = ?auto_116092 ?auto_116088 ) ) ( not ( = ?auto_116090 ?auto_116091 ) ) ( not ( = ?auto_116090 ?auto_116089 ) ) ( not ( = ?auto_116090 ?auto_116088 ) ) ( not ( = ?auto_116085 ?auto_116092 ) ) ( not ( = ?auto_116085 ?auto_116090 ) ) ( not ( = ?auto_116086 ?auto_116092 ) ) ( not ( = ?auto_116086 ?auto_116090 ) ) ( not ( = ?auto_116087 ?auto_116092 ) ) ( not ( = ?auto_116087 ?auto_116090 ) ) ( ON ?auto_116087 ?auto_116088 ) ( ON ?auto_116086 ?auto_116087 ) ( CLEAR ?auto_116086 ) ( HOLDING ?auto_116085 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_116085 )
      ( MAKE-5PILE ?auto_116085 ?auto_116086 ?auto_116087 ?auto_116088 ?auto_116089 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116093 - BLOCK
      ?auto_116094 - BLOCK
      ?auto_116095 - BLOCK
      ?auto_116096 - BLOCK
      ?auto_116097 - BLOCK
    )
    :vars
    (
      ?auto_116098 - BLOCK
      ?auto_116099 - BLOCK
      ?auto_116100 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116093 ?auto_116094 ) ) ( not ( = ?auto_116093 ?auto_116095 ) ) ( not ( = ?auto_116093 ?auto_116096 ) ) ( not ( = ?auto_116093 ?auto_116097 ) ) ( not ( = ?auto_116094 ?auto_116095 ) ) ( not ( = ?auto_116094 ?auto_116096 ) ) ( not ( = ?auto_116094 ?auto_116097 ) ) ( not ( = ?auto_116095 ?auto_116096 ) ) ( not ( = ?auto_116095 ?auto_116097 ) ) ( not ( = ?auto_116096 ?auto_116097 ) ) ( ON ?auto_116097 ?auto_116098 ) ( not ( = ?auto_116093 ?auto_116098 ) ) ( not ( = ?auto_116094 ?auto_116098 ) ) ( not ( = ?auto_116095 ?auto_116098 ) ) ( not ( = ?auto_116096 ?auto_116098 ) ) ( not ( = ?auto_116097 ?auto_116098 ) ) ( ON ?auto_116096 ?auto_116097 ) ( ON-TABLE ?auto_116099 ) ( ON ?auto_116100 ?auto_116099 ) ( ON ?auto_116098 ?auto_116100 ) ( not ( = ?auto_116099 ?auto_116100 ) ) ( not ( = ?auto_116099 ?auto_116098 ) ) ( not ( = ?auto_116099 ?auto_116097 ) ) ( not ( = ?auto_116099 ?auto_116096 ) ) ( not ( = ?auto_116100 ?auto_116098 ) ) ( not ( = ?auto_116100 ?auto_116097 ) ) ( not ( = ?auto_116100 ?auto_116096 ) ) ( not ( = ?auto_116093 ?auto_116099 ) ) ( not ( = ?auto_116093 ?auto_116100 ) ) ( not ( = ?auto_116094 ?auto_116099 ) ) ( not ( = ?auto_116094 ?auto_116100 ) ) ( not ( = ?auto_116095 ?auto_116099 ) ) ( not ( = ?auto_116095 ?auto_116100 ) ) ( ON ?auto_116095 ?auto_116096 ) ( ON ?auto_116094 ?auto_116095 ) ( ON ?auto_116093 ?auto_116094 ) ( CLEAR ?auto_116093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_116099 ?auto_116100 ?auto_116098 ?auto_116097 ?auto_116096 ?auto_116095 ?auto_116094 )
      ( MAKE-5PILE ?auto_116093 ?auto_116094 ?auto_116095 ?auto_116096 ?auto_116097 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_116103 - BLOCK
      ?auto_116104 - BLOCK
    )
    :vars
    (
      ?auto_116105 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116105 ?auto_116104 ) ( CLEAR ?auto_116105 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_116103 ) ( ON ?auto_116104 ?auto_116103 ) ( not ( = ?auto_116103 ?auto_116104 ) ) ( not ( = ?auto_116103 ?auto_116105 ) ) ( not ( = ?auto_116104 ?auto_116105 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_116105 ?auto_116104 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_116106 - BLOCK
      ?auto_116107 - BLOCK
    )
    :vars
    (
      ?auto_116108 - BLOCK
      ?auto_116109 - BLOCK
      ?auto_116110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116108 ?auto_116107 ) ( CLEAR ?auto_116108 ) ( ON-TABLE ?auto_116106 ) ( ON ?auto_116107 ?auto_116106 ) ( not ( = ?auto_116106 ?auto_116107 ) ) ( not ( = ?auto_116106 ?auto_116108 ) ) ( not ( = ?auto_116107 ?auto_116108 ) ) ( HOLDING ?auto_116109 ) ( CLEAR ?auto_116110 ) ( not ( = ?auto_116106 ?auto_116109 ) ) ( not ( = ?auto_116106 ?auto_116110 ) ) ( not ( = ?auto_116107 ?auto_116109 ) ) ( not ( = ?auto_116107 ?auto_116110 ) ) ( not ( = ?auto_116108 ?auto_116109 ) ) ( not ( = ?auto_116108 ?auto_116110 ) ) ( not ( = ?auto_116109 ?auto_116110 ) ) )
    :subtasks
    ( ( !STACK ?auto_116109 ?auto_116110 )
      ( MAKE-2PILE ?auto_116106 ?auto_116107 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_116111 - BLOCK
      ?auto_116112 - BLOCK
    )
    :vars
    (
      ?auto_116114 - BLOCK
      ?auto_116115 - BLOCK
      ?auto_116113 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116114 ?auto_116112 ) ( ON-TABLE ?auto_116111 ) ( ON ?auto_116112 ?auto_116111 ) ( not ( = ?auto_116111 ?auto_116112 ) ) ( not ( = ?auto_116111 ?auto_116114 ) ) ( not ( = ?auto_116112 ?auto_116114 ) ) ( CLEAR ?auto_116115 ) ( not ( = ?auto_116111 ?auto_116113 ) ) ( not ( = ?auto_116111 ?auto_116115 ) ) ( not ( = ?auto_116112 ?auto_116113 ) ) ( not ( = ?auto_116112 ?auto_116115 ) ) ( not ( = ?auto_116114 ?auto_116113 ) ) ( not ( = ?auto_116114 ?auto_116115 ) ) ( not ( = ?auto_116113 ?auto_116115 ) ) ( ON ?auto_116113 ?auto_116114 ) ( CLEAR ?auto_116113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_116111 ?auto_116112 ?auto_116114 )
      ( MAKE-2PILE ?auto_116111 ?auto_116112 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_116116 - BLOCK
      ?auto_116117 - BLOCK
    )
    :vars
    (
      ?auto_116118 - BLOCK
      ?auto_116119 - BLOCK
      ?auto_116120 - BLOCK
      ?auto_116123 - BLOCK
      ?auto_116122 - BLOCK
      ?auto_116121 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116118 ?auto_116117 ) ( ON-TABLE ?auto_116116 ) ( ON ?auto_116117 ?auto_116116 ) ( not ( = ?auto_116116 ?auto_116117 ) ) ( not ( = ?auto_116116 ?auto_116118 ) ) ( not ( = ?auto_116117 ?auto_116118 ) ) ( not ( = ?auto_116116 ?auto_116119 ) ) ( not ( = ?auto_116116 ?auto_116120 ) ) ( not ( = ?auto_116117 ?auto_116119 ) ) ( not ( = ?auto_116117 ?auto_116120 ) ) ( not ( = ?auto_116118 ?auto_116119 ) ) ( not ( = ?auto_116118 ?auto_116120 ) ) ( not ( = ?auto_116119 ?auto_116120 ) ) ( ON ?auto_116119 ?auto_116118 ) ( CLEAR ?auto_116119 ) ( HOLDING ?auto_116120 ) ( CLEAR ?auto_116123 ) ( ON-TABLE ?auto_116122 ) ( ON ?auto_116121 ?auto_116122 ) ( ON ?auto_116123 ?auto_116121 ) ( not ( = ?auto_116122 ?auto_116121 ) ) ( not ( = ?auto_116122 ?auto_116123 ) ) ( not ( = ?auto_116122 ?auto_116120 ) ) ( not ( = ?auto_116121 ?auto_116123 ) ) ( not ( = ?auto_116121 ?auto_116120 ) ) ( not ( = ?auto_116123 ?auto_116120 ) ) ( not ( = ?auto_116116 ?auto_116123 ) ) ( not ( = ?auto_116116 ?auto_116122 ) ) ( not ( = ?auto_116116 ?auto_116121 ) ) ( not ( = ?auto_116117 ?auto_116123 ) ) ( not ( = ?auto_116117 ?auto_116122 ) ) ( not ( = ?auto_116117 ?auto_116121 ) ) ( not ( = ?auto_116118 ?auto_116123 ) ) ( not ( = ?auto_116118 ?auto_116122 ) ) ( not ( = ?auto_116118 ?auto_116121 ) ) ( not ( = ?auto_116119 ?auto_116123 ) ) ( not ( = ?auto_116119 ?auto_116122 ) ) ( not ( = ?auto_116119 ?auto_116121 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_116122 ?auto_116121 ?auto_116123 ?auto_116120 )
      ( MAKE-2PILE ?auto_116116 ?auto_116117 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_116124 - BLOCK
      ?auto_116125 - BLOCK
    )
    :vars
    (
      ?auto_116127 - BLOCK
      ?auto_116126 - BLOCK
      ?auto_116130 - BLOCK
      ?auto_116131 - BLOCK
      ?auto_116129 - BLOCK
      ?auto_116128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116127 ?auto_116125 ) ( ON-TABLE ?auto_116124 ) ( ON ?auto_116125 ?auto_116124 ) ( not ( = ?auto_116124 ?auto_116125 ) ) ( not ( = ?auto_116124 ?auto_116127 ) ) ( not ( = ?auto_116125 ?auto_116127 ) ) ( not ( = ?auto_116124 ?auto_116126 ) ) ( not ( = ?auto_116124 ?auto_116130 ) ) ( not ( = ?auto_116125 ?auto_116126 ) ) ( not ( = ?auto_116125 ?auto_116130 ) ) ( not ( = ?auto_116127 ?auto_116126 ) ) ( not ( = ?auto_116127 ?auto_116130 ) ) ( not ( = ?auto_116126 ?auto_116130 ) ) ( ON ?auto_116126 ?auto_116127 ) ( CLEAR ?auto_116131 ) ( ON-TABLE ?auto_116129 ) ( ON ?auto_116128 ?auto_116129 ) ( ON ?auto_116131 ?auto_116128 ) ( not ( = ?auto_116129 ?auto_116128 ) ) ( not ( = ?auto_116129 ?auto_116131 ) ) ( not ( = ?auto_116129 ?auto_116130 ) ) ( not ( = ?auto_116128 ?auto_116131 ) ) ( not ( = ?auto_116128 ?auto_116130 ) ) ( not ( = ?auto_116131 ?auto_116130 ) ) ( not ( = ?auto_116124 ?auto_116131 ) ) ( not ( = ?auto_116124 ?auto_116129 ) ) ( not ( = ?auto_116124 ?auto_116128 ) ) ( not ( = ?auto_116125 ?auto_116131 ) ) ( not ( = ?auto_116125 ?auto_116129 ) ) ( not ( = ?auto_116125 ?auto_116128 ) ) ( not ( = ?auto_116127 ?auto_116131 ) ) ( not ( = ?auto_116127 ?auto_116129 ) ) ( not ( = ?auto_116127 ?auto_116128 ) ) ( not ( = ?auto_116126 ?auto_116131 ) ) ( not ( = ?auto_116126 ?auto_116129 ) ) ( not ( = ?auto_116126 ?auto_116128 ) ) ( ON ?auto_116130 ?auto_116126 ) ( CLEAR ?auto_116130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_116124 ?auto_116125 ?auto_116127 ?auto_116126 )
      ( MAKE-2PILE ?auto_116124 ?auto_116125 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_116132 - BLOCK
      ?auto_116133 - BLOCK
    )
    :vars
    (
      ?auto_116135 - BLOCK
      ?auto_116138 - BLOCK
      ?auto_116137 - BLOCK
      ?auto_116134 - BLOCK
      ?auto_116136 - BLOCK
      ?auto_116139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116135 ?auto_116133 ) ( ON-TABLE ?auto_116132 ) ( ON ?auto_116133 ?auto_116132 ) ( not ( = ?auto_116132 ?auto_116133 ) ) ( not ( = ?auto_116132 ?auto_116135 ) ) ( not ( = ?auto_116133 ?auto_116135 ) ) ( not ( = ?auto_116132 ?auto_116138 ) ) ( not ( = ?auto_116132 ?auto_116137 ) ) ( not ( = ?auto_116133 ?auto_116138 ) ) ( not ( = ?auto_116133 ?auto_116137 ) ) ( not ( = ?auto_116135 ?auto_116138 ) ) ( not ( = ?auto_116135 ?auto_116137 ) ) ( not ( = ?auto_116138 ?auto_116137 ) ) ( ON ?auto_116138 ?auto_116135 ) ( ON-TABLE ?auto_116134 ) ( ON ?auto_116136 ?auto_116134 ) ( not ( = ?auto_116134 ?auto_116136 ) ) ( not ( = ?auto_116134 ?auto_116139 ) ) ( not ( = ?auto_116134 ?auto_116137 ) ) ( not ( = ?auto_116136 ?auto_116139 ) ) ( not ( = ?auto_116136 ?auto_116137 ) ) ( not ( = ?auto_116139 ?auto_116137 ) ) ( not ( = ?auto_116132 ?auto_116139 ) ) ( not ( = ?auto_116132 ?auto_116134 ) ) ( not ( = ?auto_116132 ?auto_116136 ) ) ( not ( = ?auto_116133 ?auto_116139 ) ) ( not ( = ?auto_116133 ?auto_116134 ) ) ( not ( = ?auto_116133 ?auto_116136 ) ) ( not ( = ?auto_116135 ?auto_116139 ) ) ( not ( = ?auto_116135 ?auto_116134 ) ) ( not ( = ?auto_116135 ?auto_116136 ) ) ( not ( = ?auto_116138 ?auto_116139 ) ) ( not ( = ?auto_116138 ?auto_116134 ) ) ( not ( = ?auto_116138 ?auto_116136 ) ) ( ON ?auto_116137 ?auto_116138 ) ( CLEAR ?auto_116137 ) ( HOLDING ?auto_116139 ) ( CLEAR ?auto_116136 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_116134 ?auto_116136 ?auto_116139 )
      ( MAKE-2PILE ?auto_116132 ?auto_116133 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_116140 - BLOCK
      ?auto_116141 - BLOCK
    )
    :vars
    (
      ?auto_116147 - BLOCK
      ?auto_116143 - BLOCK
      ?auto_116142 - BLOCK
      ?auto_116144 - BLOCK
      ?auto_116145 - BLOCK
      ?auto_116146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116147 ?auto_116141 ) ( ON-TABLE ?auto_116140 ) ( ON ?auto_116141 ?auto_116140 ) ( not ( = ?auto_116140 ?auto_116141 ) ) ( not ( = ?auto_116140 ?auto_116147 ) ) ( not ( = ?auto_116141 ?auto_116147 ) ) ( not ( = ?auto_116140 ?auto_116143 ) ) ( not ( = ?auto_116140 ?auto_116142 ) ) ( not ( = ?auto_116141 ?auto_116143 ) ) ( not ( = ?auto_116141 ?auto_116142 ) ) ( not ( = ?auto_116147 ?auto_116143 ) ) ( not ( = ?auto_116147 ?auto_116142 ) ) ( not ( = ?auto_116143 ?auto_116142 ) ) ( ON ?auto_116143 ?auto_116147 ) ( ON-TABLE ?auto_116144 ) ( ON ?auto_116145 ?auto_116144 ) ( not ( = ?auto_116144 ?auto_116145 ) ) ( not ( = ?auto_116144 ?auto_116146 ) ) ( not ( = ?auto_116144 ?auto_116142 ) ) ( not ( = ?auto_116145 ?auto_116146 ) ) ( not ( = ?auto_116145 ?auto_116142 ) ) ( not ( = ?auto_116146 ?auto_116142 ) ) ( not ( = ?auto_116140 ?auto_116146 ) ) ( not ( = ?auto_116140 ?auto_116144 ) ) ( not ( = ?auto_116140 ?auto_116145 ) ) ( not ( = ?auto_116141 ?auto_116146 ) ) ( not ( = ?auto_116141 ?auto_116144 ) ) ( not ( = ?auto_116141 ?auto_116145 ) ) ( not ( = ?auto_116147 ?auto_116146 ) ) ( not ( = ?auto_116147 ?auto_116144 ) ) ( not ( = ?auto_116147 ?auto_116145 ) ) ( not ( = ?auto_116143 ?auto_116146 ) ) ( not ( = ?auto_116143 ?auto_116144 ) ) ( not ( = ?auto_116143 ?auto_116145 ) ) ( ON ?auto_116142 ?auto_116143 ) ( CLEAR ?auto_116145 ) ( ON ?auto_116146 ?auto_116142 ) ( CLEAR ?auto_116146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_116140 ?auto_116141 ?auto_116147 ?auto_116143 ?auto_116142 )
      ( MAKE-2PILE ?auto_116140 ?auto_116141 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_116148 - BLOCK
      ?auto_116149 - BLOCK
    )
    :vars
    (
      ?auto_116155 - BLOCK
      ?auto_116154 - BLOCK
      ?auto_116153 - BLOCK
      ?auto_116152 - BLOCK
      ?auto_116151 - BLOCK
      ?auto_116150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116155 ?auto_116149 ) ( ON-TABLE ?auto_116148 ) ( ON ?auto_116149 ?auto_116148 ) ( not ( = ?auto_116148 ?auto_116149 ) ) ( not ( = ?auto_116148 ?auto_116155 ) ) ( not ( = ?auto_116149 ?auto_116155 ) ) ( not ( = ?auto_116148 ?auto_116154 ) ) ( not ( = ?auto_116148 ?auto_116153 ) ) ( not ( = ?auto_116149 ?auto_116154 ) ) ( not ( = ?auto_116149 ?auto_116153 ) ) ( not ( = ?auto_116155 ?auto_116154 ) ) ( not ( = ?auto_116155 ?auto_116153 ) ) ( not ( = ?auto_116154 ?auto_116153 ) ) ( ON ?auto_116154 ?auto_116155 ) ( ON-TABLE ?auto_116152 ) ( not ( = ?auto_116152 ?auto_116151 ) ) ( not ( = ?auto_116152 ?auto_116150 ) ) ( not ( = ?auto_116152 ?auto_116153 ) ) ( not ( = ?auto_116151 ?auto_116150 ) ) ( not ( = ?auto_116151 ?auto_116153 ) ) ( not ( = ?auto_116150 ?auto_116153 ) ) ( not ( = ?auto_116148 ?auto_116150 ) ) ( not ( = ?auto_116148 ?auto_116152 ) ) ( not ( = ?auto_116148 ?auto_116151 ) ) ( not ( = ?auto_116149 ?auto_116150 ) ) ( not ( = ?auto_116149 ?auto_116152 ) ) ( not ( = ?auto_116149 ?auto_116151 ) ) ( not ( = ?auto_116155 ?auto_116150 ) ) ( not ( = ?auto_116155 ?auto_116152 ) ) ( not ( = ?auto_116155 ?auto_116151 ) ) ( not ( = ?auto_116154 ?auto_116150 ) ) ( not ( = ?auto_116154 ?auto_116152 ) ) ( not ( = ?auto_116154 ?auto_116151 ) ) ( ON ?auto_116153 ?auto_116154 ) ( ON ?auto_116150 ?auto_116153 ) ( CLEAR ?auto_116150 ) ( HOLDING ?auto_116151 ) ( CLEAR ?auto_116152 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_116152 ?auto_116151 )
      ( MAKE-2PILE ?auto_116148 ?auto_116149 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_116156 - BLOCK
      ?auto_116157 - BLOCK
    )
    :vars
    (
      ?auto_116158 - BLOCK
      ?auto_116159 - BLOCK
      ?auto_116162 - BLOCK
      ?auto_116161 - BLOCK
      ?auto_116160 - BLOCK
      ?auto_116163 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116158 ?auto_116157 ) ( ON-TABLE ?auto_116156 ) ( ON ?auto_116157 ?auto_116156 ) ( not ( = ?auto_116156 ?auto_116157 ) ) ( not ( = ?auto_116156 ?auto_116158 ) ) ( not ( = ?auto_116157 ?auto_116158 ) ) ( not ( = ?auto_116156 ?auto_116159 ) ) ( not ( = ?auto_116156 ?auto_116162 ) ) ( not ( = ?auto_116157 ?auto_116159 ) ) ( not ( = ?auto_116157 ?auto_116162 ) ) ( not ( = ?auto_116158 ?auto_116159 ) ) ( not ( = ?auto_116158 ?auto_116162 ) ) ( not ( = ?auto_116159 ?auto_116162 ) ) ( ON ?auto_116159 ?auto_116158 ) ( ON-TABLE ?auto_116161 ) ( not ( = ?auto_116161 ?auto_116160 ) ) ( not ( = ?auto_116161 ?auto_116163 ) ) ( not ( = ?auto_116161 ?auto_116162 ) ) ( not ( = ?auto_116160 ?auto_116163 ) ) ( not ( = ?auto_116160 ?auto_116162 ) ) ( not ( = ?auto_116163 ?auto_116162 ) ) ( not ( = ?auto_116156 ?auto_116163 ) ) ( not ( = ?auto_116156 ?auto_116161 ) ) ( not ( = ?auto_116156 ?auto_116160 ) ) ( not ( = ?auto_116157 ?auto_116163 ) ) ( not ( = ?auto_116157 ?auto_116161 ) ) ( not ( = ?auto_116157 ?auto_116160 ) ) ( not ( = ?auto_116158 ?auto_116163 ) ) ( not ( = ?auto_116158 ?auto_116161 ) ) ( not ( = ?auto_116158 ?auto_116160 ) ) ( not ( = ?auto_116159 ?auto_116163 ) ) ( not ( = ?auto_116159 ?auto_116161 ) ) ( not ( = ?auto_116159 ?auto_116160 ) ) ( ON ?auto_116162 ?auto_116159 ) ( ON ?auto_116163 ?auto_116162 ) ( CLEAR ?auto_116161 ) ( ON ?auto_116160 ?auto_116163 ) ( CLEAR ?auto_116160 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_116156 ?auto_116157 ?auto_116158 ?auto_116159 ?auto_116162 ?auto_116163 )
      ( MAKE-2PILE ?auto_116156 ?auto_116157 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_116164 - BLOCK
      ?auto_116165 - BLOCK
    )
    :vars
    (
      ?auto_116169 - BLOCK
      ?auto_116166 - BLOCK
      ?auto_116171 - BLOCK
      ?auto_116167 - BLOCK
      ?auto_116168 - BLOCK
      ?auto_116170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116169 ?auto_116165 ) ( ON-TABLE ?auto_116164 ) ( ON ?auto_116165 ?auto_116164 ) ( not ( = ?auto_116164 ?auto_116165 ) ) ( not ( = ?auto_116164 ?auto_116169 ) ) ( not ( = ?auto_116165 ?auto_116169 ) ) ( not ( = ?auto_116164 ?auto_116166 ) ) ( not ( = ?auto_116164 ?auto_116171 ) ) ( not ( = ?auto_116165 ?auto_116166 ) ) ( not ( = ?auto_116165 ?auto_116171 ) ) ( not ( = ?auto_116169 ?auto_116166 ) ) ( not ( = ?auto_116169 ?auto_116171 ) ) ( not ( = ?auto_116166 ?auto_116171 ) ) ( ON ?auto_116166 ?auto_116169 ) ( not ( = ?auto_116167 ?auto_116168 ) ) ( not ( = ?auto_116167 ?auto_116170 ) ) ( not ( = ?auto_116167 ?auto_116171 ) ) ( not ( = ?auto_116168 ?auto_116170 ) ) ( not ( = ?auto_116168 ?auto_116171 ) ) ( not ( = ?auto_116170 ?auto_116171 ) ) ( not ( = ?auto_116164 ?auto_116170 ) ) ( not ( = ?auto_116164 ?auto_116167 ) ) ( not ( = ?auto_116164 ?auto_116168 ) ) ( not ( = ?auto_116165 ?auto_116170 ) ) ( not ( = ?auto_116165 ?auto_116167 ) ) ( not ( = ?auto_116165 ?auto_116168 ) ) ( not ( = ?auto_116169 ?auto_116170 ) ) ( not ( = ?auto_116169 ?auto_116167 ) ) ( not ( = ?auto_116169 ?auto_116168 ) ) ( not ( = ?auto_116166 ?auto_116170 ) ) ( not ( = ?auto_116166 ?auto_116167 ) ) ( not ( = ?auto_116166 ?auto_116168 ) ) ( ON ?auto_116171 ?auto_116166 ) ( ON ?auto_116170 ?auto_116171 ) ( ON ?auto_116168 ?auto_116170 ) ( CLEAR ?auto_116168 ) ( HOLDING ?auto_116167 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_116167 )
      ( MAKE-2PILE ?auto_116164 ?auto_116165 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_116172 - BLOCK
      ?auto_116173 - BLOCK
    )
    :vars
    (
      ?auto_116179 - BLOCK
      ?auto_116177 - BLOCK
      ?auto_116174 - BLOCK
      ?auto_116178 - BLOCK
      ?auto_116175 - BLOCK
      ?auto_116176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116179 ?auto_116173 ) ( ON-TABLE ?auto_116172 ) ( ON ?auto_116173 ?auto_116172 ) ( not ( = ?auto_116172 ?auto_116173 ) ) ( not ( = ?auto_116172 ?auto_116179 ) ) ( not ( = ?auto_116173 ?auto_116179 ) ) ( not ( = ?auto_116172 ?auto_116177 ) ) ( not ( = ?auto_116172 ?auto_116174 ) ) ( not ( = ?auto_116173 ?auto_116177 ) ) ( not ( = ?auto_116173 ?auto_116174 ) ) ( not ( = ?auto_116179 ?auto_116177 ) ) ( not ( = ?auto_116179 ?auto_116174 ) ) ( not ( = ?auto_116177 ?auto_116174 ) ) ( ON ?auto_116177 ?auto_116179 ) ( not ( = ?auto_116178 ?auto_116175 ) ) ( not ( = ?auto_116178 ?auto_116176 ) ) ( not ( = ?auto_116178 ?auto_116174 ) ) ( not ( = ?auto_116175 ?auto_116176 ) ) ( not ( = ?auto_116175 ?auto_116174 ) ) ( not ( = ?auto_116176 ?auto_116174 ) ) ( not ( = ?auto_116172 ?auto_116176 ) ) ( not ( = ?auto_116172 ?auto_116178 ) ) ( not ( = ?auto_116172 ?auto_116175 ) ) ( not ( = ?auto_116173 ?auto_116176 ) ) ( not ( = ?auto_116173 ?auto_116178 ) ) ( not ( = ?auto_116173 ?auto_116175 ) ) ( not ( = ?auto_116179 ?auto_116176 ) ) ( not ( = ?auto_116179 ?auto_116178 ) ) ( not ( = ?auto_116179 ?auto_116175 ) ) ( not ( = ?auto_116177 ?auto_116176 ) ) ( not ( = ?auto_116177 ?auto_116178 ) ) ( not ( = ?auto_116177 ?auto_116175 ) ) ( ON ?auto_116174 ?auto_116177 ) ( ON ?auto_116176 ?auto_116174 ) ( ON ?auto_116175 ?auto_116176 ) ( ON ?auto_116178 ?auto_116175 ) ( CLEAR ?auto_116178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_116172 ?auto_116173 ?auto_116179 ?auto_116177 ?auto_116174 ?auto_116176 ?auto_116175 )
      ( MAKE-2PILE ?auto_116172 ?auto_116173 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116186 - BLOCK
      ?auto_116187 - BLOCK
      ?auto_116188 - BLOCK
      ?auto_116189 - BLOCK
      ?auto_116190 - BLOCK
      ?auto_116191 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_116191 ) ( CLEAR ?auto_116190 ) ( ON-TABLE ?auto_116186 ) ( ON ?auto_116187 ?auto_116186 ) ( ON ?auto_116188 ?auto_116187 ) ( ON ?auto_116189 ?auto_116188 ) ( ON ?auto_116190 ?auto_116189 ) ( not ( = ?auto_116186 ?auto_116187 ) ) ( not ( = ?auto_116186 ?auto_116188 ) ) ( not ( = ?auto_116186 ?auto_116189 ) ) ( not ( = ?auto_116186 ?auto_116190 ) ) ( not ( = ?auto_116186 ?auto_116191 ) ) ( not ( = ?auto_116187 ?auto_116188 ) ) ( not ( = ?auto_116187 ?auto_116189 ) ) ( not ( = ?auto_116187 ?auto_116190 ) ) ( not ( = ?auto_116187 ?auto_116191 ) ) ( not ( = ?auto_116188 ?auto_116189 ) ) ( not ( = ?auto_116188 ?auto_116190 ) ) ( not ( = ?auto_116188 ?auto_116191 ) ) ( not ( = ?auto_116189 ?auto_116190 ) ) ( not ( = ?auto_116189 ?auto_116191 ) ) ( not ( = ?auto_116190 ?auto_116191 ) ) )
    :subtasks
    ( ( !STACK ?auto_116191 ?auto_116190 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116192 - BLOCK
      ?auto_116193 - BLOCK
      ?auto_116194 - BLOCK
      ?auto_116195 - BLOCK
      ?auto_116196 - BLOCK
      ?auto_116197 - BLOCK
    )
    :vars
    (
      ?auto_116198 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_116196 ) ( ON-TABLE ?auto_116192 ) ( ON ?auto_116193 ?auto_116192 ) ( ON ?auto_116194 ?auto_116193 ) ( ON ?auto_116195 ?auto_116194 ) ( ON ?auto_116196 ?auto_116195 ) ( not ( = ?auto_116192 ?auto_116193 ) ) ( not ( = ?auto_116192 ?auto_116194 ) ) ( not ( = ?auto_116192 ?auto_116195 ) ) ( not ( = ?auto_116192 ?auto_116196 ) ) ( not ( = ?auto_116192 ?auto_116197 ) ) ( not ( = ?auto_116193 ?auto_116194 ) ) ( not ( = ?auto_116193 ?auto_116195 ) ) ( not ( = ?auto_116193 ?auto_116196 ) ) ( not ( = ?auto_116193 ?auto_116197 ) ) ( not ( = ?auto_116194 ?auto_116195 ) ) ( not ( = ?auto_116194 ?auto_116196 ) ) ( not ( = ?auto_116194 ?auto_116197 ) ) ( not ( = ?auto_116195 ?auto_116196 ) ) ( not ( = ?auto_116195 ?auto_116197 ) ) ( not ( = ?auto_116196 ?auto_116197 ) ) ( ON ?auto_116197 ?auto_116198 ) ( CLEAR ?auto_116197 ) ( HAND-EMPTY ) ( not ( = ?auto_116192 ?auto_116198 ) ) ( not ( = ?auto_116193 ?auto_116198 ) ) ( not ( = ?auto_116194 ?auto_116198 ) ) ( not ( = ?auto_116195 ?auto_116198 ) ) ( not ( = ?auto_116196 ?auto_116198 ) ) ( not ( = ?auto_116197 ?auto_116198 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_116197 ?auto_116198 )
      ( MAKE-6PILE ?auto_116192 ?auto_116193 ?auto_116194 ?auto_116195 ?auto_116196 ?auto_116197 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116199 - BLOCK
      ?auto_116200 - BLOCK
      ?auto_116201 - BLOCK
      ?auto_116202 - BLOCK
      ?auto_116203 - BLOCK
      ?auto_116204 - BLOCK
    )
    :vars
    (
      ?auto_116205 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116199 ) ( ON ?auto_116200 ?auto_116199 ) ( ON ?auto_116201 ?auto_116200 ) ( ON ?auto_116202 ?auto_116201 ) ( not ( = ?auto_116199 ?auto_116200 ) ) ( not ( = ?auto_116199 ?auto_116201 ) ) ( not ( = ?auto_116199 ?auto_116202 ) ) ( not ( = ?auto_116199 ?auto_116203 ) ) ( not ( = ?auto_116199 ?auto_116204 ) ) ( not ( = ?auto_116200 ?auto_116201 ) ) ( not ( = ?auto_116200 ?auto_116202 ) ) ( not ( = ?auto_116200 ?auto_116203 ) ) ( not ( = ?auto_116200 ?auto_116204 ) ) ( not ( = ?auto_116201 ?auto_116202 ) ) ( not ( = ?auto_116201 ?auto_116203 ) ) ( not ( = ?auto_116201 ?auto_116204 ) ) ( not ( = ?auto_116202 ?auto_116203 ) ) ( not ( = ?auto_116202 ?auto_116204 ) ) ( not ( = ?auto_116203 ?auto_116204 ) ) ( ON ?auto_116204 ?auto_116205 ) ( CLEAR ?auto_116204 ) ( not ( = ?auto_116199 ?auto_116205 ) ) ( not ( = ?auto_116200 ?auto_116205 ) ) ( not ( = ?auto_116201 ?auto_116205 ) ) ( not ( = ?auto_116202 ?auto_116205 ) ) ( not ( = ?auto_116203 ?auto_116205 ) ) ( not ( = ?auto_116204 ?auto_116205 ) ) ( HOLDING ?auto_116203 ) ( CLEAR ?auto_116202 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_116199 ?auto_116200 ?auto_116201 ?auto_116202 ?auto_116203 )
      ( MAKE-6PILE ?auto_116199 ?auto_116200 ?auto_116201 ?auto_116202 ?auto_116203 ?auto_116204 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116206 - BLOCK
      ?auto_116207 - BLOCK
      ?auto_116208 - BLOCK
      ?auto_116209 - BLOCK
      ?auto_116210 - BLOCK
      ?auto_116211 - BLOCK
    )
    :vars
    (
      ?auto_116212 - BLOCK
      ?auto_116213 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116206 ) ( ON ?auto_116207 ?auto_116206 ) ( ON ?auto_116208 ?auto_116207 ) ( ON ?auto_116209 ?auto_116208 ) ( not ( = ?auto_116206 ?auto_116207 ) ) ( not ( = ?auto_116206 ?auto_116208 ) ) ( not ( = ?auto_116206 ?auto_116209 ) ) ( not ( = ?auto_116206 ?auto_116210 ) ) ( not ( = ?auto_116206 ?auto_116211 ) ) ( not ( = ?auto_116207 ?auto_116208 ) ) ( not ( = ?auto_116207 ?auto_116209 ) ) ( not ( = ?auto_116207 ?auto_116210 ) ) ( not ( = ?auto_116207 ?auto_116211 ) ) ( not ( = ?auto_116208 ?auto_116209 ) ) ( not ( = ?auto_116208 ?auto_116210 ) ) ( not ( = ?auto_116208 ?auto_116211 ) ) ( not ( = ?auto_116209 ?auto_116210 ) ) ( not ( = ?auto_116209 ?auto_116211 ) ) ( not ( = ?auto_116210 ?auto_116211 ) ) ( ON ?auto_116211 ?auto_116212 ) ( not ( = ?auto_116206 ?auto_116212 ) ) ( not ( = ?auto_116207 ?auto_116212 ) ) ( not ( = ?auto_116208 ?auto_116212 ) ) ( not ( = ?auto_116209 ?auto_116212 ) ) ( not ( = ?auto_116210 ?auto_116212 ) ) ( not ( = ?auto_116211 ?auto_116212 ) ) ( CLEAR ?auto_116209 ) ( ON ?auto_116210 ?auto_116211 ) ( CLEAR ?auto_116210 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_116213 ) ( ON ?auto_116212 ?auto_116213 ) ( not ( = ?auto_116213 ?auto_116212 ) ) ( not ( = ?auto_116213 ?auto_116211 ) ) ( not ( = ?auto_116213 ?auto_116210 ) ) ( not ( = ?auto_116206 ?auto_116213 ) ) ( not ( = ?auto_116207 ?auto_116213 ) ) ( not ( = ?auto_116208 ?auto_116213 ) ) ( not ( = ?auto_116209 ?auto_116213 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_116213 ?auto_116212 ?auto_116211 )
      ( MAKE-6PILE ?auto_116206 ?auto_116207 ?auto_116208 ?auto_116209 ?auto_116210 ?auto_116211 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116214 - BLOCK
      ?auto_116215 - BLOCK
      ?auto_116216 - BLOCK
      ?auto_116217 - BLOCK
      ?auto_116218 - BLOCK
      ?auto_116219 - BLOCK
    )
    :vars
    (
      ?auto_116220 - BLOCK
      ?auto_116221 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116214 ) ( ON ?auto_116215 ?auto_116214 ) ( ON ?auto_116216 ?auto_116215 ) ( not ( = ?auto_116214 ?auto_116215 ) ) ( not ( = ?auto_116214 ?auto_116216 ) ) ( not ( = ?auto_116214 ?auto_116217 ) ) ( not ( = ?auto_116214 ?auto_116218 ) ) ( not ( = ?auto_116214 ?auto_116219 ) ) ( not ( = ?auto_116215 ?auto_116216 ) ) ( not ( = ?auto_116215 ?auto_116217 ) ) ( not ( = ?auto_116215 ?auto_116218 ) ) ( not ( = ?auto_116215 ?auto_116219 ) ) ( not ( = ?auto_116216 ?auto_116217 ) ) ( not ( = ?auto_116216 ?auto_116218 ) ) ( not ( = ?auto_116216 ?auto_116219 ) ) ( not ( = ?auto_116217 ?auto_116218 ) ) ( not ( = ?auto_116217 ?auto_116219 ) ) ( not ( = ?auto_116218 ?auto_116219 ) ) ( ON ?auto_116219 ?auto_116220 ) ( not ( = ?auto_116214 ?auto_116220 ) ) ( not ( = ?auto_116215 ?auto_116220 ) ) ( not ( = ?auto_116216 ?auto_116220 ) ) ( not ( = ?auto_116217 ?auto_116220 ) ) ( not ( = ?auto_116218 ?auto_116220 ) ) ( not ( = ?auto_116219 ?auto_116220 ) ) ( ON ?auto_116218 ?auto_116219 ) ( CLEAR ?auto_116218 ) ( ON-TABLE ?auto_116221 ) ( ON ?auto_116220 ?auto_116221 ) ( not ( = ?auto_116221 ?auto_116220 ) ) ( not ( = ?auto_116221 ?auto_116219 ) ) ( not ( = ?auto_116221 ?auto_116218 ) ) ( not ( = ?auto_116214 ?auto_116221 ) ) ( not ( = ?auto_116215 ?auto_116221 ) ) ( not ( = ?auto_116216 ?auto_116221 ) ) ( not ( = ?auto_116217 ?auto_116221 ) ) ( HOLDING ?auto_116217 ) ( CLEAR ?auto_116216 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_116214 ?auto_116215 ?auto_116216 ?auto_116217 )
      ( MAKE-6PILE ?auto_116214 ?auto_116215 ?auto_116216 ?auto_116217 ?auto_116218 ?auto_116219 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116222 - BLOCK
      ?auto_116223 - BLOCK
      ?auto_116224 - BLOCK
      ?auto_116225 - BLOCK
      ?auto_116226 - BLOCK
      ?auto_116227 - BLOCK
    )
    :vars
    (
      ?auto_116228 - BLOCK
      ?auto_116229 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116222 ) ( ON ?auto_116223 ?auto_116222 ) ( ON ?auto_116224 ?auto_116223 ) ( not ( = ?auto_116222 ?auto_116223 ) ) ( not ( = ?auto_116222 ?auto_116224 ) ) ( not ( = ?auto_116222 ?auto_116225 ) ) ( not ( = ?auto_116222 ?auto_116226 ) ) ( not ( = ?auto_116222 ?auto_116227 ) ) ( not ( = ?auto_116223 ?auto_116224 ) ) ( not ( = ?auto_116223 ?auto_116225 ) ) ( not ( = ?auto_116223 ?auto_116226 ) ) ( not ( = ?auto_116223 ?auto_116227 ) ) ( not ( = ?auto_116224 ?auto_116225 ) ) ( not ( = ?auto_116224 ?auto_116226 ) ) ( not ( = ?auto_116224 ?auto_116227 ) ) ( not ( = ?auto_116225 ?auto_116226 ) ) ( not ( = ?auto_116225 ?auto_116227 ) ) ( not ( = ?auto_116226 ?auto_116227 ) ) ( ON ?auto_116227 ?auto_116228 ) ( not ( = ?auto_116222 ?auto_116228 ) ) ( not ( = ?auto_116223 ?auto_116228 ) ) ( not ( = ?auto_116224 ?auto_116228 ) ) ( not ( = ?auto_116225 ?auto_116228 ) ) ( not ( = ?auto_116226 ?auto_116228 ) ) ( not ( = ?auto_116227 ?auto_116228 ) ) ( ON ?auto_116226 ?auto_116227 ) ( ON-TABLE ?auto_116229 ) ( ON ?auto_116228 ?auto_116229 ) ( not ( = ?auto_116229 ?auto_116228 ) ) ( not ( = ?auto_116229 ?auto_116227 ) ) ( not ( = ?auto_116229 ?auto_116226 ) ) ( not ( = ?auto_116222 ?auto_116229 ) ) ( not ( = ?auto_116223 ?auto_116229 ) ) ( not ( = ?auto_116224 ?auto_116229 ) ) ( not ( = ?auto_116225 ?auto_116229 ) ) ( CLEAR ?auto_116224 ) ( ON ?auto_116225 ?auto_116226 ) ( CLEAR ?auto_116225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_116229 ?auto_116228 ?auto_116227 ?auto_116226 )
      ( MAKE-6PILE ?auto_116222 ?auto_116223 ?auto_116224 ?auto_116225 ?auto_116226 ?auto_116227 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116230 - BLOCK
      ?auto_116231 - BLOCK
      ?auto_116232 - BLOCK
      ?auto_116233 - BLOCK
      ?auto_116234 - BLOCK
      ?auto_116235 - BLOCK
    )
    :vars
    (
      ?auto_116237 - BLOCK
      ?auto_116236 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116230 ) ( ON ?auto_116231 ?auto_116230 ) ( not ( = ?auto_116230 ?auto_116231 ) ) ( not ( = ?auto_116230 ?auto_116232 ) ) ( not ( = ?auto_116230 ?auto_116233 ) ) ( not ( = ?auto_116230 ?auto_116234 ) ) ( not ( = ?auto_116230 ?auto_116235 ) ) ( not ( = ?auto_116231 ?auto_116232 ) ) ( not ( = ?auto_116231 ?auto_116233 ) ) ( not ( = ?auto_116231 ?auto_116234 ) ) ( not ( = ?auto_116231 ?auto_116235 ) ) ( not ( = ?auto_116232 ?auto_116233 ) ) ( not ( = ?auto_116232 ?auto_116234 ) ) ( not ( = ?auto_116232 ?auto_116235 ) ) ( not ( = ?auto_116233 ?auto_116234 ) ) ( not ( = ?auto_116233 ?auto_116235 ) ) ( not ( = ?auto_116234 ?auto_116235 ) ) ( ON ?auto_116235 ?auto_116237 ) ( not ( = ?auto_116230 ?auto_116237 ) ) ( not ( = ?auto_116231 ?auto_116237 ) ) ( not ( = ?auto_116232 ?auto_116237 ) ) ( not ( = ?auto_116233 ?auto_116237 ) ) ( not ( = ?auto_116234 ?auto_116237 ) ) ( not ( = ?auto_116235 ?auto_116237 ) ) ( ON ?auto_116234 ?auto_116235 ) ( ON-TABLE ?auto_116236 ) ( ON ?auto_116237 ?auto_116236 ) ( not ( = ?auto_116236 ?auto_116237 ) ) ( not ( = ?auto_116236 ?auto_116235 ) ) ( not ( = ?auto_116236 ?auto_116234 ) ) ( not ( = ?auto_116230 ?auto_116236 ) ) ( not ( = ?auto_116231 ?auto_116236 ) ) ( not ( = ?auto_116232 ?auto_116236 ) ) ( not ( = ?auto_116233 ?auto_116236 ) ) ( ON ?auto_116233 ?auto_116234 ) ( CLEAR ?auto_116233 ) ( HOLDING ?auto_116232 ) ( CLEAR ?auto_116231 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_116230 ?auto_116231 ?auto_116232 )
      ( MAKE-6PILE ?auto_116230 ?auto_116231 ?auto_116232 ?auto_116233 ?auto_116234 ?auto_116235 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116238 - BLOCK
      ?auto_116239 - BLOCK
      ?auto_116240 - BLOCK
      ?auto_116241 - BLOCK
      ?auto_116242 - BLOCK
      ?auto_116243 - BLOCK
    )
    :vars
    (
      ?auto_116244 - BLOCK
      ?auto_116245 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116238 ) ( ON ?auto_116239 ?auto_116238 ) ( not ( = ?auto_116238 ?auto_116239 ) ) ( not ( = ?auto_116238 ?auto_116240 ) ) ( not ( = ?auto_116238 ?auto_116241 ) ) ( not ( = ?auto_116238 ?auto_116242 ) ) ( not ( = ?auto_116238 ?auto_116243 ) ) ( not ( = ?auto_116239 ?auto_116240 ) ) ( not ( = ?auto_116239 ?auto_116241 ) ) ( not ( = ?auto_116239 ?auto_116242 ) ) ( not ( = ?auto_116239 ?auto_116243 ) ) ( not ( = ?auto_116240 ?auto_116241 ) ) ( not ( = ?auto_116240 ?auto_116242 ) ) ( not ( = ?auto_116240 ?auto_116243 ) ) ( not ( = ?auto_116241 ?auto_116242 ) ) ( not ( = ?auto_116241 ?auto_116243 ) ) ( not ( = ?auto_116242 ?auto_116243 ) ) ( ON ?auto_116243 ?auto_116244 ) ( not ( = ?auto_116238 ?auto_116244 ) ) ( not ( = ?auto_116239 ?auto_116244 ) ) ( not ( = ?auto_116240 ?auto_116244 ) ) ( not ( = ?auto_116241 ?auto_116244 ) ) ( not ( = ?auto_116242 ?auto_116244 ) ) ( not ( = ?auto_116243 ?auto_116244 ) ) ( ON ?auto_116242 ?auto_116243 ) ( ON-TABLE ?auto_116245 ) ( ON ?auto_116244 ?auto_116245 ) ( not ( = ?auto_116245 ?auto_116244 ) ) ( not ( = ?auto_116245 ?auto_116243 ) ) ( not ( = ?auto_116245 ?auto_116242 ) ) ( not ( = ?auto_116238 ?auto_116245 ) ) ( not ( = ?auto_116239 ?auto_116245 ) ) ( not ( = ?auto_116240 ?auto_116245 ) ) ( not ( = ?auto_116241 ?auto_116245 ) ) ( ON ?auto_116241 ?auto_116242 ) ( CLEAR ?auto_116239 ) ( ON ?auto_116240 ?auto_116241 ) ( CLEAR ?auto_116240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_116245 ?auto_116244 ?auto_116243 ?auto_116242 ?auto_116241 )
      ( MAKE-6PILE ?auto_116238 ?auto_116239 ?auto_116240 ?auto_116241 ?auto_116242 ?auto_116243 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116246 - BLOCK
      ?auto_116247 - BLOCK
      ?auto_116248 - BLOCK
      ?auto_116249 - BLOCK
      ?auto_116250 - BLOCK
      ?auto_116251 - BLOCK
    )
    :vars
    (
      ?auto_116252 - BLOCK
      ?auto_116253 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116246 ) ( not ( = ?auto_116246 ?auto_116247 ) ) ( not ( = ?auto_116246 ?auto_116248 ) ) ( not ( = ?auto_116246 ?auto_116249 ) ) ( not ( = ?auto_116246 ?auto_116250 ) ) ( not ( = ?auto_116246 ?auto_116251 ) ) ( not ( = ?auto_116247 ?auto_116248 ) ) ( not ( = ?auto_116247 ?auto_116249 ) ) ( not ( = ?auto_116247 ?auto_116250 ) ) ( not ( = ?auto_116247 ?auto_116251 ) ) ( not ( = ?auto_116248 ?auto_116249 ) ) ( not ( = ?auto_116248 ?auto_116250 ) ) ( not ( = ?auto_116248 ?auto_116251 ) ) ( not ( = ?auto_116249 ?auto_116250 ) ) ( not ( = ?auto_116249 ?auto_116251 ) ) ( not ( = ?auto_116250 ?auto_116251 ) ) ( ON ?auto_116251 ?auto_116252 ) ( not ( = ?auto_116246 ?auto_116252 ) ) ( not ( = ?auto_116247 ?auto_116252 ) ) ( not ( = ?auto_116248 ?auto_116252 ) ) ( not ( = ?auto_116249 ?auto_116252 ) ) ( not ( = ?auto_116250 ?auto_116252 ) ) ( not ( = ?auto_116251 ?auto_116252 ) ) ( ON ?auto_116250 ?auto_116251 ) ( ON-TABLE ?auto_116253 ) ( ON ?auto_116252 ?auto_116253 ) ( not ( = ?auto_116253 ?auto_116252 ) ) ( not ( = ?auto_116253 ?auto_116251 ) ) ( not ( = ?auto_116253 ?auto_116250 ) ) ( not ( = ?auto_116246 ?auto_116253 ) ) ( not ( = ?auto_116247 ?auto_116253 ) ) ( not ( = ?auto_116248 ?auto_116253 ) ) ( not ( = ?auto_116249 ?auto_116253 ) ) ( ON ?auto_116249 ?auto_116250 ) ( ON ?auto_116248 ?auto_116249 ) ( CLEAR ?auto_116248 ) ( HOLDING ?auto_116247 ) ( CLEAR ?auto_116246 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_116246 ?auto_116247 )
      ( MAKE-6PILE ?auto_116246 ?auto_116247 ?auto_116248 ?auto_116249 ?auto_116250 ?auto_116251 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116254 - BLOCK
      ?auto_116255 - BLOCK
      ?auto_116256 - BLOCK
      ?auto_116257 - BLOCK
      ?auto_116258 - BLOCK
      ?auto_116259 - BLOCK
    )
    :vars
    (
      ?auto_116260 - BLOCK
      ?auto_116261 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116254 ) ( not ( = ?auto_116254 ?auto_116255 ) ) ( not ( = ?auto_116254 ?auto_116256 ) ) ( not ( = ?auto_116254 ?auto_116257 ) ) ( not ( = ?auto_116254 ?auto_116258 ) ) ( not ( = ?auto_116254 ?auto_116259 ) ) ( not ( = ?auto_116255 ?auto_116256 ) ) ( not ( = ?auto_116255 ?auto_116257 ) ) ( not ( = ?auto_116255 ?auto_116258 ) ) ( not ( = ?auto_116255 ?auto_116259 ) ) ( not ( = ?auto_116256 ?auto_116257 ) ) ( not ( = ?auto_116256 ?auto_116258 ) ) ( not ( = ?auto_116256 ?auto_116259 ) ) ( not ( = ?auto_116257 ?auto_116258 ) ) ( not ( = ?auto_116257 ?auto_116259 ) ) ( not ( = ?auto_116258 ?auto_116259 ) ) ( ON ?auto_116259 ?auto_116260 ) ( not ( = ?auto_116254 ?auto_116260 ) ) ( not ( = ?auto_116255 ?auto_116260 ) ) ( not ( = ?auto_116256 ?auto_116260 ) ) ( not ( = ?auto_116257 ?auto_116260 ) ) ( not ( = ?auto_116258 ?auto_116260 ) ) ( not ( = ?auto_116259 ?auto_116260 ) ) ( ON ?auto_116258 ?auto_116259 ) ( ON-TABLE ?auto_116261 ) ( ON ?auto_116260 ?auto_116261 ) ( not ( = ?auto_116261 ?auto_116260 ) ) ( not ( = ?auto_116261 ?auto_116259 ) ) ( not ( = ?auto_116261 ?auto_116258 ) ) ( not ( = ?auto_116254 ?auto_116261 ) ) ( not ( = ?auto_116255 ?auto_116261 ) ) ( not ( = ?auto_116256 ?auto_116261 ) ) ( not ( = ?auto_116257 ?auto_116261 ) ) ( ON ?auto_116257 ?auto_116258 ) ( ON ?auto_116256 ?auto_116257 ) ( CLEAR ?auto_116254 ) ( ON ?auto_116255 ?auto_116256 ) ( CLEAR ?auto_116255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_116261 ?auto_116260 ?auto_116259 ?auto_116258 ?auto_116257 ?auto_116256 )
      ( MAKE-6PILE ?auto_116254 ?auto_116255 ?auto_116256 ?auto_116257 ?auto_116258 ?auto_116259 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116262 - BLOCK
      ?auto_116263 - BLOCK
      ?auto_116264 - BLOCK
      ?auto_116265 - BLOCK
      ?auto_116266 - BLOCK
      ?auto_116267 - BLOCK
    )
    :vars
    (
      ?auto_116269 - BLOCK
      ?auto_116268 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116262 ?auto_116263 ) ) ( not ( = ?auto_116262 ?auto_116264 ) ) ( not ( = ?auto_116262 ?auto_116265 ) ) ( not ( = ?auto_116262 ?auto_116266 ) ) ( not ( = ?auto_116262 ?auto_116267 ) ) ( not ( = ?auto_116263 ?auto_116264 ) ) ( not ( = ?auto_116263 ?auto_116265 ) ) ( not ( = ?auto_116263 ?auto_116266 ) ) ( not ( = ?auto_116263 ?auto_116267 ) ) ( not ( = ?auto_116264 ?auto_116265 ) ) ( not ( = ?auto_116264 ?auto_116266 ) ) ( not ( = ?auto_116264 ?auto_116267 ) ) ( not ( = ?auto_116265 ?auto_116266 ) ) ( not ( = ?auto_116265 ?auto_116267 ) ) ( not ( = ?auto_116266 ?auto_116267 ) ) ( ON ?auto_116267 ?auto_116269 ) ( not ( = ?auto_116262 ?auto_116269 ) ) ( not ( = ?auto_116263 ?auto_116269 ) ) ( not ( = ?auto_116264 ?auto_116269 ) ) ( not ( = ?auto_116265 ?auto_116269 ) ) ( not ( = ?auto_116266 ?auto_116269 ) ) ( not ( = ?auto_116267 ?auto_116269 ) ) ( ON ?auto_116266 ?auto_116267 ) ( ON-TABLE ?auto_116268 ) ( ON ?auto_116269 ?auto_116268 ) ( not ( = ?auto_116268 ?auto_116269 ) ) ( not ( = ?auto_116268 ?auto_116267 ) ) ( not ( = ?auto_116268 ?auto_116266 ) ) ( not ( = ?auto_116262 ?auto_116268 ) ) ( not ( = ?auto_116263 ?auto_116268 ) ) ( not ( = ?auto_116264 ?auto_116268 ) ) ( not ( = ?auto_116265 ?auto_116268 ) ) ( ON ?auto_116265 ?auto_116266 ) ( ON ?auto_116264 ?auto_116265 ) ( ON ?auto_116263 ?auto_116264 ) ( CLEAR ?auto_116263 ) ( HOLDING ?auto_116262 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_116262 )
      ( MAKE-6PILE ?auto_116262 ?auto_116263 ?auto_116264 ?auto_116265 ?auto_116266 ?auto_116267 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116270 - BLOCK
      ?auto_116271 - BLOCK
      ?auto_116272 - BLOCK
      ?auto_116273 - BLOCK
      ?auto_116274 - BLOCK
      ?auto_116275 - BLOCK
    )
    :vars
    (
      ?auto_116277 - BLOCK
      ?auto_116276 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116270 ?auto_116271 ) ) ( not ( = ?auto_116270 ?auto_116272 ) ) ( not ( = ?auto_116270 ?auto_116273 ) ) ( not ( = ?auto_116270 ?auto_116274 ) ) ( not ( = ?auto_116270 ?auto_116275 ) ) ( not ( = ?auto_116271 ?auto_116272 ) ) ( not ( = ?auto_116271 ?auto_116273 ) ) ( not ( = ?auto_116271 ?auto_116274 ) ) ( not ( = ?auto_116271 ?auto_116275 ) ) ( not ( = ?auto_116272 ?auto_116273 ) ) ( not ( = ?auto_116272 ?auto_116274 ) ) ( not ( = ?auto_116272 ?auto_116275 ) ) ( not ( = ?auto_116273 ?auto_116274 ) ) ( not ( = ?auto_116273 ?auto_116275 ) ) ( not ( = ?auto_116274 ?auto_116275 ) ) ( ON ?auto_116275 ?auto_116277 ) ( not ( = ?auto_116270 ?auto_116277 ) ) ( not ( = ?auto_116271 ?auto_116277 ) ) ( not ( = ?auto_116272 ?auto_116277 ) ) ( not ( = ?auto_116273 ?auto_116277 ) ) ( not ( = ?auto_116274 ?auto_116277 ) ) ( not ( = ?auto_116275 ?auto_116277 ) ) ( ON ?auto_116274 ?auto_116275 ) ( ON-TABLE ?auto_116276 ) ( ON ?auto_116277 ?auto_116276 ) ( not ( = ?auto_116276 ?auto_116277 ) ) ( not ( = ?auto_116276 ?auto_116275 ) ) ( not ( = ?auto_116276 ?auto_116274 ) ) ( not ( = ?auto_116270 ?auto_116276 ) ) ( not ( = ?auto_116271 ?auto_116276 ) ) ( not ( = ?auto_116272 ?auto_116276 ) ) ( not ( = ?auto_116273 ?auto_116276 ) ) ( ON ?auto_116273 ?auto_116274 ) ( ON ?auto_116272 ?auto_116273 ) ( ON ?auto_116271 ?auto_116272 ) ( ON ?auto_116270 ?auto_116271 ) ( CLEAR ?auto_116270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_116276 ?auto_116277 ?auto_116275 ?auto_116274 ?auto_116273 ?auto_116272 ?auto_116271 )
      ( MAKE-6PILE ?auto_116270 ?auto_116271 ?auto_116272 ?auto_116273 ?auto_116274 ?auto_116275 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_116279 - BLOCK
    )
    :vars
    (
      ?auto_116280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116280 ?auto_116279 ) ( CLEAR ?auto_116280 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_116279 ) ( not ( = ?auto_116279 ?auto_116280 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_116280 ?auto_116279 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_116281 - BLOCK
    )
    :vars
    (
      ?auto_116282 - BLOCK
      ?auto_116283 - BLOCK
      ?auto_116284 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116282 ?auto_116281 ) ( CLEAR ?auto_116282 ) ( ON-TABLE ?auto_116281 ) ( not ( = ?auto_116281 ?auto_116282 ) ) ( HOLDING ?auto_116283 ) ( CLEAR ?auto_116284 ) ( not ( = ?auto_116281 ?auto_116283 ) ) ( not ( = ?auto_116281 ?auto_116284 ) ) ( not ( = ?auto_116282 ?auto_116283 ) ) ( not ( = ?auto_116282 ?auto_116284 ) ) ( not ( = ?auto_116283 ?auto_116284 ) ) )
    :subtasks
    ( ( !STACK ?auto_116283 ?auto_116284 )
      ( MAKE-1PILE ?auto_116281 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_116285 - BLOCK
    )
    :vars
    (
      ?auto_116287 - BLOCK
      ?auto_116286 - BLOCK
      ?auto_116288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116287 ?auto_116285 ) ( ON-TABLE ?auto_116285 ) ( not ( = ?auto_116285 ?auto_116287 ) ) ( CLEAR ?auto_116286 ) ( not ( = ?auto_116285 ?auto_116288 ) ) ( not ( = ?auto_116285 ?auto_116286 ) ) ( not ( = ?auto_116287 ?auto_116288 ) ) ( not ( = ?auto_116287 ?auto_116286 ) ) ( not ( = ?auto_116288 ?auto_116286 ) ) ( ON ?auto_116288 ?auto_116287 ) ( CLEAR ?auto_116288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_116285 ?auto_116287 )
      ( MAKE-1PILE ?auto_116285 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_116289 - BLOCK
    )
    :vars
    (
      ?auto_116290 - BLOCK
      ?auto_116291 - BLOCK
      ?auto_116292 - BLOCK
      ?auto_116295 - BLOCK
      ?auto_116294 - BLOCK
      ?auto_116296 - BLOCK
      ?auto_116293 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116290 ?auto_116289 ) ( ON-TABLE ?auto_116289 ) ( not ( = ?auto_116289 ?auto_116290 ) ) ( not ( = ?auto_116289 ?auto_116291 ) ) ( not ( = ?auto_116289 ?auto_116292 ) ) ( not ( = ?auto_116290 ?auto_116291 ) ) ( not ( = ?auto_116290 ?auto_116292 ) ) ( not ( = ?auto_116291 ?auto_116292 ) ) ( ON ?auto_116291 ?auto_116290 ) ( CLEAR ?auto_116291 ) ( HOLDING ?auto_116292 ) ( CLEAR ?auto_116295 ) ( ON-TABLE ?auto_116294 ) ( ON ?auto_116296 ?auto_116294 ) ( ON ?auto_116293 ?auto_116296 ) ( ON ?auto_116295 ?auto_116293 ) ( not ( = ?auto_116294 ?auto_116296 ) ) ( not ( = ?auto_116294 ?auto_116293 ) ) ( not ( = ?auto_116294 ?auto_116295 ) ) ( not ( = ?auto_116294 ?auto_116292 ) ) ( not ( = ?auto_116296 ?auto_116293 ) ) ( not ( = ?auto_116296 ?auto_116295 ) ) ( not ( = ?auto_116296 ?auto_116292 ) ) ( not ( = ?auto_116293 ?auto_116295 ) ) ( not ( = ?auto_116293 ?auto_116292 ) ) ( not ( = ?auto_116295 ?auto_116292 ) ) ( not ( = ?auto_116289 ?auto_116295 ) ) ( not ( = ?auto_116289 ?auto_116294 ) ) ( not ( = ?auto_116289 ?auto_116296 ) ) ( not ( = ?auto_116289 ?auto_116293 ) ) ( not ( = ?auto_116290 ?auto_116295 ) ) ( not ( = ?auto_116290 ?auto_116294 ) ) ( not ( = ?auto_116290 ?auto_116296 ) ) ( not ( = ?auto_116290 ?auto_116293 ) ) ( not ( = ?auto_116291 ?auto_116295 ) ) ( not ( = ?auto_116291 ?auto_116294 ) ) ( not ( = ?auto_116291 ?auto_116296 ) ) ( not ( = ?auto_116291 ?auto_116293 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_116294 ?auto_116296 ?auto_116293 ?auto_116295 ?auto_116292 )
      ( MAKE-1PILE ?auto_116289 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_116297 - BLOCK
    )
    :vars
    (
      ?auto_116303 - BLOCK
      ?auto_116300 - BLOCK
      ?auto_116301 - BLOCK
      ?auto_116299 - BLOCK
      ?auto_116298 - BLOCK
      ?auto_116302 - BLOCK
      ?auto_116304 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116303 ?auto_116297 ) ( ON-TABLE ?auto_116297 ) ( not ( = ?auto_116297 ?auto_116303 ) ) ( not ( = ?auto_116297 ?auto_116300 ) ) ( not ( = ?auto_116297 ?auto_116301 ) ) ( not ( = ?auto_116303 ?auto_116300 ) ) ( not ( = ?auto_116303 ?auto_116301 ) ) ( not ( = ?auto_116300 ?auto_116301 ) ) ( ON ?auto_116300 ?auto_116303 ) ( CLEAR ?auto_116299 ) ( ON-TABLE ?auto_116298 ) ( ON ?auto_116302 ?auto_116298 ) ( ON ?auto_116304 ?auto_116302 ) ( ON ?auto_116299 ?auto_116304 ) ( not ( = ?auto_116298 ?auto_116302 ) ) ( not ( = ?auto_116298 ?auto_116304 ) ) ( not ( = ?auto_116298 ?auto_116299 ) ) ( not ( = ?auto_116298 ?auto_116301 ) ) ( not ( = ?auto_116302 ?auto_116304 ) ) ( not ( = ?auto_116302 ?auto_116299 ) ) ( not ( = ?auto_116302 ?auto_116301 ) ) ( not ( = ?auto_116304 ?auto_116299 ) ) ( not ( = ?auto_116304 ?auto_116301 ) ) ( not ( = ?auto_116299 ?auto_116301 ) ) ( not ( = ?auto_116297 ?auto_116299 ) ) ( not ( = ?auto_116297 ?auto_116298 ) ) ( not ( = ?auto_116297 ?auto_116302 ) ) ( not ( = ?auto_116297 ?auto_116304 ) ) ( not ( = ?auto_116303 ?auto_116299 ) ) ( not ( = ?auto_116303 ?auto_116298 ) ) ( not ( = ?auto_116303 ?auto_116302 ) ) ( not ( = ?auto_116303 ?auto_116304 ) ) ( not ( = ?auto_116300 ?auto_116299 ) ) ( not ( = ?auto_116300 ?auto_116298 ) ) ( not ( = ?auto_116300 ?auto_116302 ) ) ( not ( = ?auto_116300 ?auto_116304 ) ) ( ON ?auto_116301 ?auto_116300 ) ( CLEAR ?auto_116301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_116297 ?auto_116303 ?auto_116300 )
      ( MAKE-1PILE ?auto_116297 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_116305 - BLOCK
    )
    :vars
    (
      ?auto_116309 - BLOCK
      ?auto_116307 - BLOCK
      ?auto_116312 - BLOCK
      ?auto_116311 - BLOCK
      ?auto_116308 - BLOCK
      ?auto_116306 - BLOCK
      ?auto_116310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116309 ?auto_116305 ) ( ON-TABLE ?auto_116305 ) ( not ( = ?auto_116305 ?auto_116309 ) ) ( not ( = ?auto_116305 ?auto_116307 ) ) ( not ( = ?auto_116305 ?auto_116312 ) ) ( not ( = ?auto_116309 ?auto_116307 ) ) ( not ( = ?auto_116309 ?auto_116312 ) ) ( not ( = ?auto_116307 ?auto_116312 ) ) ( ON ?auto_116307 ?auto_116309 ) ( ON-TABLE ?auto_116311 ) ( ON ?auto_116308 ?auto_116311 ) ( ON ?auto_116306 ?auto_116308 ) ( not ( = ?auto_116311 ?auto_116308 ) ) ( not ( = ?auto_116311 ?auto_116306 ) ) ( not ( = ?auto_116311 ?auto_116310 ) ) ( not ( = ?auto_116311 ?auto_116312 ) ) ( not ( = ?auto_116308 ?auto_116306 ) ) ( not ( = ?auto_116308 ?auto_116310 ) ) ( not ( = ?auto_116308 ?auto_116312 ) ) ( not ( = ?auto_116306 ?auto_116310 ) ) ( not ( = ?auto_116306 ?auto_116312 ) ) ( not ( = ?auto_116310 ?auto_116312 ) ) ( not ( = ?auto_116305 ?auto_116310 ) ) ( not ( = ?auto_116305 ?auto_116311 ) ) ( not ( = ?auto_116305 ?auto_116308 ) ) ( not ( = ?auto_116305 ?auto_116306 ) ) ( not ( = ?auto_116309 ?auto_116310 ) ) ( not ( = ?auto_116309 ?auto_116311 ) ) ( not ( = ?auto_116309 ?auto_116308 ) ) ( not ( = ?auto_116309 ?auto_116306 ) ) ( not ( = ?auto_116307 ?auto_116310 ) ) ( not ( = ?auto_116307 ?auto_116311 ) ) ( not ( = ?auto_116307 ?auto_116308 ) ) ( not ( = ?auto_116307 ?auto_116306 ) ) ( ON ?auto_116312 ?auto_116307 ) ( CLEAR ?auto_116312 ) ( HOLDING ?auto_116310 ) ( CLEAR ?auto_116306 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_116311 ?auto_116308 ?auto_116306 ?auto_116310 )
      ( MAKE-1PILE ?auto_116305 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_116313 - BLOCK
    )
    :vars
    (
      ?auto_116318 - BLOCK
      ?auto_116317 - BLOCK
      ?auto_116319 - BLOCK
      ?auto_116314 - BLOCK
      ?auto_116315 - BLOCK
      ?auto_116316 - BLOCK
      ?auto_116320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116318 ?auto_116313 ) ( ON-TABLE ?auto_116313 ) ( not ( = ?auto_116313 ?auto_116318 ) ) ( not ( = ?auto_116313 ?auto_116317 ) ) ( not ( = ?auto_116313 ?auto_116319 ) ) ( not ( = ?auto_116318 ?auto_116317 ) ) ( not ( = ?auto_116318 ?auto_116319 ) ) ( not ( = ?auto_116317 ?auto_116319 ) ) ( ON ?auto_116317 ?auto_116318 ) ( ON-TABLE ?auto_116314 ) ( ON ?auto_116315 ?auto_116314 ) ( ON ?auto_116316 ?auto_116315 ) ( not ( = ?auto_116314 ?auto_116315 ) ) ( not ( = ?auto_116314 ?auto_116316 ) ) ( not ( = ?auto_116314 ?auto_116320 ) ) ( not ( = ?auto_116314 ?auto_116319 ) ) ( not ( = ?auto_116315 ?auto_116316 ) ) ( not ( = ?auto_116315 ?auto_116320 ) ) ( not ( = ?auto_116315 ?auto_116319 ) ) ( not ( = ?auto_116316 ?auto_116320 ) ) ( not ( = ?auto_116316 ?auto_116319 ) ) ( not ( = ?auto_116320 ?auto_116319 ) ) ( not ( = ?auto_116313 ?auto_116320 ) ) ( not ( = ?auto_116313 ?auto_116314 ) ) ( not ( = ?auto_116313 ?auto_116315 ) ) ( not ( = ?auto_116313 ?auto_116316 ) ) ( not ( = ?auto_116318 ?auto_116320 ) ) ( not ( = ?auto_116318 ?auto_116314 ) ) ( not ( = ?auto_116318 ?auto_116315 ) ) ( not ( = ?auto_116318 ?auto_116316 ) ) ( not ( = ?auto_116317 ?auto_116320 ) ) ( not ( = ?auto_116317 ?auto_116314 ) ) ( not ( = ?auto_116317 ?auto_116315 ) ) ( not ( = ?auto_116317 ?auto_116316 ) ) ( ON ?auto_116319 ?auto_116317 ) ( CLEAR ?auto_116316 ) ( ON ?auto_116320 ?auto_116319 ) ( CLEAR ?auto_116320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_116313 ?auto_116318 ?auto_116317 ?auto_116319 )
      ( MAKE-1PILE ?auto_116313 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_116321 - BLOCK
    )
    :vars
    (
      ?auto_116327 - BLOCK
      ?auto_116323 - BLOCK
      ?auto_116328 - BLOCK
      ?auto_116322 - BLOCK
      ?auto_116326 - BLOCK
      ?auto_116324 - BLOCK
      ?auto_116325 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116327 ?auto_116321 ) ( ON-TABLE ?auto_116321 ) ( not ( = ?auto_116321 ?auto_116327 ) ) ( not ( = ?auto_116321 ?auto_116323 ) ) ( not ( = ?auto_116321 ?auto_116328 ) ) ( not ( = ?auto_116327 ?auto_116323 ) ) ( not ( = ?auto_116327 ?auto_116328 ) ) ( not ( = ?auto_116323 ?auto_116328 ) ) ( ON ?auto_116323 ?auto_116327 ) ( ON-TABLE ?auto_116322 ) ( ON ?auto_116326 ?auto_116322 ) ( not ( = ?auto_116322 ?auto_116326 ) ) ( not ( = ?auto_116322 ?auto_116324 ) ) ( not ( = ?auto_116322 ?auto_116325 ) ) ( not ( = ?auto_116322 ?auto_116328 ) ) ( not ( = ?auto_116326 ?auto_116324 ) ) ( not ( = ?auto_116326 ?auto_116325 ) ) ( not ( = ?auto_116326 ?auto_116328 ) ) ( not ( = ?auto_116324 ?auto_116325 ) ) ( not ( = ?auto_116324 ?auto_116328 ) ) ( not ( = ?auto_116325 ?auto_116328 ) ) ( not ( = ?auto_116321 ?auto_116325 ) ) ( not ( = ?auto_116321 ?auto_116322 ) ) ( not ( = ?auto_116321 ?auto_116326 ) ) ( not ( = ?auto_116321 ?auto_116324 ) ) ( not ( = ?auto_116327 ?auto_116325 ) ) ( not ( = ?auto_116327 ?auto_116322 ) ) ( not ( = ?auto_116327 ?auto_116326 ) ) ( not ( = ?auto_116327 ?auto_116324 ) ) ( not ( = ?auto_116323 ?auto_116325 ) ) ( not ( = ?auto_116323 ?auto_116322 ) ) ( not ( = ?auto_116323 ?auto_116326 ) ) ( not ( = ?auto_116323 ?auto_116324 ) ) ( ON ?auto_116328 ?auto_116323 ) ( ON ?auto_116325 ?auto_116328 ) ( CLEAR ?auto_116325 ) ( HOLDING ?auto_116324 ) ( CLEAR ?auto_116326 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_116322 ?auto_116326 ?auto_116324 )
      ( MAKE-1PILE ?auto_116321 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_116329 - BLOCK
    )
    :vars
    (
      ?auto_116333 - BLOCK
      ?auto_116334 - BLOCK
      ?auto_116332 - BLOCK
      ?auto_116330 - BLOCK
      ?auto_116331 - BLOCK
      ?auto_116335 - BLOCK
      ?auto_116336 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116333 ?auto_116329 ) ( ON-TABLE ?auto_116329 ) ( not ( = ?auto_116329 ?auto_116333 ) ) ( not ( = ?auto_116329 ?auto_116334 ) ) ( not ( = ?auto_116329 ?auto_116332 ) ) ( not ( = ?auto_116333 ?auto_116334 ) ) ( not ( = ?auto_116333 ?auto_116332 ) ) ( not ( = ?auto_116334 ?auto_116332 ) ) ( ON ?auto_116334 ?auto_116333 ) ( ON-TABLE ?auto_116330 ) ( ON ?auto_116331 ?auto_116330 ) ( not ( = ?auto_116330 ?auto_116331 ) ) ( not ( = ?auto_116330 ?auto_116335 ) ) ( not ( = ?auto_116330 ?auto_116336 ) ) ( not ( = ?auto_116330 ?auto_116332 ) ) ( not ( = ?auto_116331 ?auto_116335 ) ) ( not ( = ?auto_116331 ?auto_116336 ) ) ( not ( = ?auto_116331 ?auto_116332 ) ) ( not ( = ?auto_116335 ?auto_116336 ) ) ( not ( = ?auto_116335 ?auto_116332 ) ) ( not ( = ?auto_116336 ?auto_116332 ) ) ( not ( = ?auto_116329 ?auto_116336 ) ) ( not ( = ?auto_116329 ?auto_116330 ) ) ( not ( = ?auto_116329 ?auto_116331 ) ) ( not ( = ?auto_116329 ?auto_116335 ) ) ( not ( = ?auto_116333 ?auto_116336 ) ) ( not ( = ?auto_116333 ?auto_116330 ) ) ( not ( = ?auto_116333 ?auto_116331 ) ) ( not ( = ?auto_116333 ?auto_116335 ) ) ( not ( = ?auto_116334 ?auto_116336 ) ) ( not ( = ?auto_116334 ?auto_116330 ) ) ( not ( = ?auto_116334 ?auto_116331 ) ) ( not ( = ?auto_116334 ?auto_116335 ) ) ( ON ?auto_116332 ?auto_116334 ) ( ON ?auto_116336 ?auto_116332 ) ( CLEAR ?auto_116331 ) ( ON ?auto_116335 ?auto_116336 ) ( CLEAR ?auto_116335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_116329 ?auto_116333 ?auto_116334 ?auto_116332 ?auto_116336 )
      ( MAKE-1PILE ?auto_116329 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_116337 - BLOCK
    )
    :vars
    (
      ?auto_116344 - BLOCK
      ?auto_116341 - BLOCK
      ?auto_116340 - BLOCK
      ?auto_116339 - BLOCK
      ?auto_116342 - BLOCK
      ?auto_116338 - BLOCK
      ?auto_116343 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116344 ?auto_116337 ) ( ON-TABLE ?auto_116337 ) ( not ( = ?auto_116337 ?auto_116344 ) ) ( not ( = ?auto_116337 ?auto_116341 ) ) ( not ( = ?auto_116337 ?auto_116340 ) ) ( not ( = ?auto_116344 ?auto_116341 ) ) ( not ( = ?auto_116344 ?auto_116340 ) ) ( not ( = ?auto_116341 ?auto_116340 ) ) ( ON ?auto_116341 ?auto_116344 ) ( ON-TABLE ?auto_116339 ) ( not ( = ?auto_116339 ?auto_116342 ) ) ( not ( = ?auto_116339 ?auto_116338 ) ) ( not ( = ?auto_116339 ?auto_116343 ) ) ( not ( = ?auto_116339 ?auto_116340 ) ) ( not ( = ?auto_116342 ?auto_116338 ) ) ( not ( = ?auto_116342 ?auto_116343 ) ) ( not ( = ?auto_116342 ?auto_116340 ) ) ( not ( = ?auto_116338 ?auto_116343 ) ) ( not ( = ?auto_116338 ?auto_116340 ) ) ( not ( = ?auto_116343 ?auto_116340 ) ) ( not ( = ?auto_116337 ?auto_116343 ) ) ( not ( = ?auto_116337 ?auto_116339 ) ) ( not ( = ?auto_116337 ?auto_116342 ) ) ( not ( = ?auto_116337 ?auto_116338 ) ) ( not ( = ?auto_116344 ?auto_116343 ) ) ( not ( = ?auto_116344 ?auto_116339 ) ) ( not ( = ?auto_116344 ?auto_116342 ) ) ( not ( = ?auto_116344 ?auto_116338 ) ) ( not ( = ?auto_116341 ?auto_116343 ) ) ( not ( = ?auto_116341 ?auto_116339 ) ) ( not ( = ?auto_116341 ?auto_116342 ) ) ( not ( = ?auto_116341 ?auto_116338 ) ) ( ON ?auto_116340 ?auto_116341 ) ( ON ?auto_116343 ?auto_116340 ) ( ON ?auto_116338 ?auto_116343 ) ( CLEAR ?auto_116338 ) ( HOLDING ?auto_116342 ) ( CLEAR ?auto_116339 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_116339 ?auto_116342 )
      ( MAKE-1PILE ?auto_116337 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_116345 - BLOCK
    )
    :vars
    (
      ?auto_116350 - BLOCK
      ?auto_116348 - BLOCK
      ?auto_116352 - BLOCK
      ?auto_116346 - BLOCK
      ?auto_116349 - BLOCK
      ?auto_116351 - BLOCK
      ?auto_116347 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116350 ?auto_116345 ) ( ON-TABLE ?auto_116345 ) ( not ( = ?auto_116345 ?auto_116350 ) ) ( not ( = ?auto_116345 ?auto_116348 ) ) ( not ( = ?auto_116345 ?auto_116352 ) ) ( not ( = ?auto_116350 ?auto_116348 ) ) ( not ( = ?auto_116350 ?auto_116352 ) ) ( not ( = ?auto_116348 ?auto_116352 ) ) ( ON ?auto_116348 ?auto_116350 ) ( ON-TABLE ?auto_116346 ) ( not ( = ?auto_116346 ?auto_116349 ) ) ( not ( = ?auto_116346 ?auto_116351 ) ) ( not ( = ?auto_116346 ?auto_116347 ) ) ( not ( = ?auto_116346 ?auto_116352 ) ) ( not ( = ?auto_116349 ?auto_116351 ) ) ( not ( = ?auto_116349 ?auto_116347 ) ) ( not ( = ?auto_116349 ?auto_116352 ) ) ( not ( = ?auto_116351 ?auto_116347 ) ) ( not ( = ?auto_116351 ?auto_116352 ) ) ( not ( = ?auto_116347 ?auto_116352 ) ) ( not ( = ?auto_116345 ?auto_116347 ) ) ( not ( = ?auto_116345 ?auto_116346 ) ) ( not ( = ?auto_116345 ?auto_116349 ) ) ( not ( = ?auto_116345 ?auto_116351 ) ) ( not ( = ?auto_116350 ?auto_116347 ) ) ( not ( = ?auto_116350 ?auto_116346 ) ) ( not ( = ?auto_116350 ?auto_116349 ) ) ( not ( = ?auto_116350 ?auto_116351 ) ) ( not ( = ?auto_116348 ?auto_116347 ) ) ( not ( = ?auto_116348 ?auto_116346 ) ) ( not ( = ?auto_116348 ?auto_116349 ) ) ( not ( = ?auto_116348 ?auto_116351 ) ) ( ON ?auto_116352 ?auto_116348 ) ( ON ?auto_116347 ?auto_116352 ) ( ON ?auto_116351 ?auto_116347 ) ( CLEAR ?auto_116346 ) ( ON ?auto_116349 ?auto_116351 ) ( CLEAR ?auto_116349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_116345 ?auto_116350 ?auto_116348 ?auto_116352 ?auto_116347 ?auto_116351 )
      ( MAKE-1PILE ?auto_116345 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_116353 - BLOCK
    )
    :vars
    (
      ?auto_116359 - BLOCK
      ?auto_116354 - BLOCK
      ?auto_116360 - BLOCK
      ?auto_116358 - BLOCK
      ?auto_116356 - BLOCK
      ?auto_116357 - BLOCK
      ?auto_116355 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116359 ?auto_116353 ) ( ON-TABLE ?auto_116353 ) ( not ( = ?auto_116353 ?auto_116359 ) ) ( not ( = ?auto_116353 ?auto_116354 ) ) ( not ( = ?auto_116353 ?auto_116360 ) ) ( not ( = ?auto_116359 ?auto_116354 ) ) ( not ( = ?auto_116359 ?auto_116360 ) ) ( not ( = ?auto_116354 ?auto_116360 ) ) ( ON ?auto_116354 ?auto_116359 ) ( not ( = ?auto_116358 ?auto_116356 ) ) ( not ( = ?auto_116358 ?auto_116357 ) ) ( not ( = ?auto_116358 ?auto_116355 ) ) ( not ( = ?auto_116358 ?auto_116360 ) ) ( not ( = ?auto_116356 ?auto_116357 ) ) ( not ( = ?auto_116356 ?auto_116355 ) ) ( not ( = ?auto_116356 ?auto_116360 ) ) ( not ( = ?auto_116357 ?auto_116355 ) ) ( not ( = ?auto_116357 ?auto_116360 ) ) ( not ( = ?auto_116355 ?auto_116360 ) ) ( not ( = ?auto_116353 ?auto_116355 ) ) ( not ( = ?auto_116353 ?auto_116358 ) ) ( not ( = ?auto_116353 ?auto_116356 ) ) ( not ( = ?auto_116353 ?auto_116357 ) ) ( not ( = ?auto_116359 ?auto_116355 ) ) ( not ( = ?auto_116359 ?auto_116358 ) ) ( not ( = ?auto_116359 ?auto_116356 ) ) ( not ( = ?auto_116359 ?auto_116357 ) ) ( not ( = ?auto_116354 ?auto_116355 ) ) ( not ( = ?auto_116354 ?auto_116358 ) ) ( not ( = ?auto_116354 ?auto_116356 ) ) ( not ( = ?auto_116354 ?auto_116357 ) ) ( ON ?auto_116360 ?auto_116354 ) ( ON ?auto_116355 ?auto_116360 ) ( ON ?auto_116357 ?auto_116355 ) ( ON ?auto_116356 ?auto_116357 ) ( CLEAR ?auto_116356 ) ( HOLDING ?auto_116358 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_116358 )
      ( MAKE-1PILE ?auto_116353 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_116361 - BLOCK
    )
    :vars
    (
      ?auto_116366 - BLOCK
      ?auto_116363 - BLOCK
      ?auto_116365 - BLOCK
      ?auto_116368 - BLOCK
      ?auto_116364 - BLOCK
      ?auto_116362 - BLOCK
      ?auto_116367 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116366 ?auto_116361 ) ( ON-TABLE ?auto_116361 ) ( not ( = ?auto_116361 ?auto_116366 ) ) ( not ( = ?auto_116361 ?auto_116363 ) ) ( not ( = ?auto_116361 ?auto_116365 ) ) ( not ( = ?auto_116366 ?auto_116363 ) ) ( not ( = ?auto_116366 ?auto_116365 ) ) ( not ( = ?auto_116363 ?auto_116365 ) ) ( ON ?auto_116363 ?auto_116366 ) ( not ( = ?auto_116368 ?auto_116364 ) ) ( not ( = ?auto_116368 ?auto_116362 ) ) ( not ( = ?auto_116368 ?auto_116367 ) ) ( not ( = ?auto_116368 ?auto_116365 ) ) ( not ( = ?auto_116364 ?auto_116362 ) ) ( not ( = ?auto_116364 ?auto_116367 ) ) ( not ( = ?auto_116364 ?auto_116365 ) ) ( not ( = ?auto_116362 ?auto_116367 ) ) ( not ( = ?auto_116362 ?auto_116365 ) ) ( not ( = ?auto_116367 ?auto_116365 ) ) ( not ( = ?auto_116361 ?auto_116367 ) ) ( not ( = ?auto_116361 ?auto_116368 ) ) ( not ( = ?auto_116361 ?auto_116364 ) ) ( not ( = ?auto_116361 ?auto_116362 ) ) ( not ( = ?auto_116366 ?auto_116367 ) ) ( not ( = ?auto_116366 ?auto_116368 ) ) ( not ( = ?auto_116366 ?auto_116364 ) ) ( not ( = ?auto_116366 ?auto_116362 ) ) ( not ( = ?auto_116363 ?auto_116367 ) ) ( not ( = ?auto_116363 ?auto_116368 ) ) ( not ( = ?auto_116363 ?auto_116364 ) ) ( not ( = ?auto_116363 ?auto_116362 ) ) ( ON ?auto_116365 ?auto_116363 ) ( ON ?auto_116367 ?auto_116365 ) ( ON ?auto_116362 ?auto_116367 ) ( ON ?auto_116364 ?auto_116362 ) ( ON ?auto_116368 ?auto_116364 ) ( CLEAR ?auto_116368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_116361 ?auto_116366 ?auto_116363 ?auto_116365 ?auto_116367 ?auto_116362 ?auto_116364 )
      ( MAKE-1PILE ?auto_116361 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_116376 - BLOCK
      ?auto_116377 - BLOCK
      ?auto_116378 - BLOCK
      ?auto_116379 - BLOCK
      ?auto_116380 - BLOCK
      ?auto_116381 - BLOCK
      ?auto_116382 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_116382 ) ( CLEAR ?auto_116381 ) ( ON-TABLE ?auto_116376 ) ( ON ?auto_116377 ?auto_116376 ) ( ON ?auto_116378 ?auto_116377 ) ( ON ?auto_116379 ?auto_116378 ) ( ON ?auto_116380 ?auto_116379 ) ( ON ?auto_116381 ?auto_116380 ) ( not ( = ?auto_116376 ?auto_116377 ) ) ( not ( = ?auto_116376 ?auto_116378 ) ) ( not ( = ?auto_116376 ?auto_116379 ) ) ( not ( = ?auto_116376 ?auto_116380 ) ) ( not ( = ?auto_116376 ?auto_116381 ) ) ( not ( = ?auto_116376 ?auto_116382 ) ) ( not ( = ?auto_116377 ?auto_116378 ) ) ( not ( = ?auto_116377 ?auto_116379 ) ) ( not ( = ?auto_116377 ?auto_116380 ) ) ( not ( = ?auto_116377 ?auto_116381 ) ) ( not ( = ?auto_116377 ?auto_116382 ) ) ( not ( = ?auto_116378 ?auto_116379 ) ) ( not ( = ?auto_116378 ?auto_116380 ) ) ( not ( = ?auto_116378 ?auto_116381 ) ) ( not ( = ?auto_116378 ?auto_116382 ) ) ( not ( = ?auto_116379 ?auto_116380 ) ) ( not ( = ?auto_116379 ?auto_116381 ) ) ( not ( = ?auto_116379 ?auto_116382 ) ) ( not ( = ?auto_116380 ?auto_116381 ) ) ( not ( = ?auto_116380 ?auto_116382 ) ) ( not ( = ?auto_116381 ?auto_116382 ) ) )
    :subtasks
    ( ( !STACK ?auto_116382 ?auto_116381 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_116383 - BLOCK
      ?auto_116384 - BLOCK
      ?auto_116385 - BLOCK
      ?auto_116386 - BLOCK
      ?auto_116387 - BLOCK
      ?auto_116388 - BLOCK
      ?auto_116389 - BLOCK
    )
    :vars
    (
      ?auto_116390 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_116388 ) ( ON-TABLE ?auto_116383 ) ( ON ?auto_116384 ?auto_116383 ) ( ON ?auto_116385 ?auto_116384 ) ( ON ?auto_116386 ?auto_116385 ) ( ON ?auto_116387 ?auto_116386 ) ( ON ?auto_116388 ?auto_116387 ) ( not ( = ?auto_116383 ?auto_116384 ) ) ( not ( = ?auto_116383 ?auto_116385 ) ) ( not ( = ?auto_116383 ?auto_116386 ) ) ( not ( = ?auto_116383 ?auto_116387 ) ) ( not ( = ?auto_116383 ?auto_116388 ) ) ( not ( = ?auto_116383 ?auto_116389 ) ) ( not ( = ?auto_116384 ?auto_116385 ) ) ( not ( = ?auto_116384 ?auto_116386 ) ) ( not ( = ?auto_116384 ?auto_116387 ) ) ( not ( = ?auto_116384 ?auto_116388 ) ) ( not ( = ?auto_116384 ?auto_116389 ) ) ( not ( = ?auto_116385 ?auto_116386 ) ) ( not ( = ?auto_116385 ?auto_116387 ) ) ( not ( = ?auto_116385 ?auto_116388 ) ) ( not ( = ?auto_116385 ?auto_116389 ) ) ( not ( = ?auto_116386 ?auto_116387 ) ) ( not ( = ?auto_116386 ?auto_116388 ) ) ( not ( = ?auto_116386 ?auto_116389 ) ) ( not ( = ?auto_116387 ?auto_116388 ) ) ( not ( = ?auto_116387 ?auto_116389 ) ) ( not ( = ?auto_116388 ?auto_116389 ) ) ( ON ?auto_116389 ?auto_116390 ) ( CLEAR ?auto_116389 ) ( HAND-EMPTY ) ( not ( = ?auto_116383 ?auto_116390 ) ) ( not ( = ?auto_116384 ?auto_116390 ) ) ( not ( = ?auto_116385 ?auto_116390 ) ) ( not ( = ?auto_116386 ?auto_116390 ) ) ( not ( = ?auto_116387 ?auto_116390 ) ) ( not ( = ?auto_116388 ?auto_116390 ) ) ( not ( = ?auto_116389 ?auto_116390 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_116389 ?auto_116390 )
      ( MAKE-7PILE ?auto_116383 ?auto_116384 ?auto_116385 ?auto_116386 ?auto_116387 ?auto_116388 ?auto_116389 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_116391 - BLOCK
      ?auto_116392 - BLOCK
      ?auto_116393 - BLOCK
      ?auto_116394 - BLOCK
      ?auto_116395 - BLOCK
      ?auto_116396 - BLOCK
      ?auto_116397 - BLOCK
    )
    :vars
    (
      ?auto_116398 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116391 ) ( ON ?auto_116392 ?auto_116391 ) ( ON ?auto_116393 ?auto_116392 ) ( ON ?auto_116394 ?auto_116393 ) ( ON ?auto_116395 ?auto_116394 ) ( not ( = ?auto_116391 ?auto_116392 ) ) ( not ( = ?auto_116391 ?auto_116393 ) ) ( not ( = ?auto_116391 ?auto_116394 ) ) ( not ( = ?auto_116391 ?auto_116395 ) ) ( not ( = ?auto_116391 ?auto_116396 ) ) ( not ( = ?auto_116391 ?auto_116397 ) ) ( not ( = ?auto_116392 ?auto_116393 ) ) ( not ( = ?auto_116392 ?auto_116394 ) ) ( not ( = ?auto_116392 ?auto_116395 ) ) ( not ( = ?auto_116392 ?auto_116396 ) ) ( not ( = ?auto_116392 ?auto_116397 ) ) ( not ( = ?auto_116393 ?auto_116394 ) ) ( not ( = ?auto_116393 ?auto_116395 ) ) ( not ( = ?auto_116393 ?auto_116396 ) ) ( not ( = ?auto_116393 ?auto_116397 ) ) ( not ( = ?auto_116394 ?auto_116395 ) ) ( not ( = ?auto_116394 ?auto_116396 ) ) ( not ( = ?auto_116394 ?auto_116397 ) ) ( not ( = ?auto_116395 ?auto_116396 ) ) ( not ( = ?auto_116395 ?auto_116397 ) ) ( not ( = ?auto_116396 ?auto_116397 ) ) ( ON ?auto_116397 ?auto_116398 ) ( CLEAR ?auto_116397 ) ( not ( = ?auto_116391 ?auto_116398 ) ) ( not ( = ?auto_116392 ?auto_116398 ) ) ( not ( = ?auto_116393 ?auto_116398 ) ) ( not ( = ?auto_116394 ?auto_116398 ) ) ( not ( = ?auto_116395 ?auto_116398 ) ) ( not ( = ?auto_116396 ?auto_116398 ) ) ( not ( = ?auto_116397 ?auto_116398 ) ) ( HOLDING ?auto_116396 ) ( CLEAR ?auto_116395 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_116391 ?auto_116392 ?auto_116393 ?auto_116394 ?auto_116395 ?auto_116396 )
      ( MAKE-7PILE ?auto_116391 ?auto_116392 ?auto_116393 ?auto_116394 ?auto_116395 ?auto_116396 ?auto_116397 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_116399 - BLOCK
      ?auto_116400 - BLOCK
      ?auto_116401 - BLOCK
      ?auto_116402 - BLOCK
      ?auto_116403 - BLOCK
      ?auto_116404 - BLOCK
      ?auto_116405 - BLOCK
    )
    :vars
    (
      ?auto_116406 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116399 ) ( ON ?auto_116400 ?auto_116399 ) ( ON ?auto_116401 ?auto_116400 ) ( ON ?auto_116402 ?auto_116401 ) ( ON ?auto_116403 ?auto_116402 ) ( not ( = ?auto_116399 ?auto_116400 ) ) ( not ( = ?auto_116399 ?auto_116401 ) ) ( not ( = ?auto_116399 ?auto_116402 ) ) ( not ( = ?auto_116399 ?auto_116403 ) ) ( not ( = ?auto_116399 ?auto_116404 ) ) ( not ( = ?auto_116399 ?auto_116405 ) ) ( not ( = ?auto_116400 ?auto_116401 ) ) ( not ( = ?auto_116400 ?auto_116402 ) ) ( not ( = ?auto_116400 ?auto_116403 ) ) ( not ( = ?auto_116400 ?auto_116404 ) ) ( not ( = ?auto_116400 ?auto_116405 ) ) ( not ( = ?auto_116401 ?auto_116402 ) ) ( not ( = ?auto_116401 ?auto_116403 ) ) ( not ( = ?auto_116401 ?auto_116404 ) ) ( not ( = ?auto_116401 ?auto_116405 ) ) ( not ( = ?auto_116402 ?auto_116403 ) ) ( not ( = ?auto_116402 ?auto_116404 ) ) ( not ( = ?auto_116402 ?auto_116405 ) ) ( not ( = ?auto_116403 ?auto_116404 ) ) ( not ( = ?auto_116403 ?auto_116405 ) ) ( not ( = ?auto_116404 ?auto_116405 ) ) ( ON ?auto_116405 ?auto_116406 ) ( not ( = ?auto_116399 ?auto_116406 ) ) ( not ( = ?auto_116400 ?auto_116406 ) ) ( not ( = ?auto_116401 ?auto_116406 ) ) ( not ( = ?auto_116402 ?auto_116406 ) ) ( not ( = ?auto_116403 ?auto_116406 ) ) ( not ( = ?auto_116404 ?auto_116406 ) ) ( not ( = ?auto_116405 ?auto_116406 ) ) ( CLEAR ?auto_116403 ) ( ON ?auto_116404 ?auto_116405 ) ( CLEAR ?auto_116404 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_116406 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_116406 ?auto_116405 )
      ( MAKE-7PILE ?auto_116399 ?auto_116400 ?auto_116401 ?auto_116402 ?auto_116403 ?auto_116404 ?auto_116405 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_116407 - BLOCK
      ?auto_116408 - BLOCK
      ?auto_116409 - BLOCK
      ?auto_116410 - BLOCK
      ?auto_116411 - BLOCK
      ?auto_116412 - BLOCK
      ?auto_116413 - BLOCK
    )
    :vars
    (
      ?auto_116414 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116407 ) ( ON ?auto_116408 ?auto_116407 ) ( ON ?auto_116409 ?auto_116408 ) ( ON ?auto_116410 ?auto_116409 ) ( not ( = ?auto_116407 ?auto_116408 ) ) ( not ( = ?auto_116407 ?auto_116409 ) ) ( not ( = ?auto_116407 ?auto_116410 ) ) ( not ( = ?auto_116407 ?auto_116411 ) ) ( not ( = ?auto_116407 ?auto_116412 ) ) ( not ( = ?auto_116407 ?auto_116413 ) ) ( not ( = ?auto_116408 ?auto_116409 ) ) ( not ( = ?auto_116408 ?auto_116410 ) ) ( not ( = ?auto_116408 ?auto_116411 ) ) ( not ( = ?auto_116408 ?auto_116412 ) ) ( not ( = ?auto_116408 ?auto_116413 ) ) ( not ( = ?auto_116409 ?auto_116410 ) ) ( not ( = ?auto_116409 ?auto_116411 ) ) ( not ( = ?auto_116409 ?auto_116412 ) ) ( not ( = ?auto_116409 ?auto_116413 ) ) ( not ( = ?auto_116410 ?auto_116411 ) ) ( not ( = ?auto_116410 ?auto_116412 ) ) ( not ( = ?auto_116410 ?auto_116413 ) ) ( not ( = ?auto_116411 ?auto_116412 ) ) ( not ( = ?auto_116411 ?auto_116413 ) ) ( not ( = ?auto_116412 ?auto_116413 ) ) ( ON ?auto_116413 ?auto_116414 ) ( not ( = ?auto_116407 ?auto_116414 ) ) ( not ( = ?auto_116408 ?auto_116414 ) ) ( not ( = ?auto_116409 ?auto_116414 ) ) ( not ( = ?auto_116410 ?auto_116414 ) ) ( not ( = ?auto_116411 ?auto_116414 ) ) ( not ( = ?auto_116412 ?auto_116414 ) ) ( not ( = ?auto_116413 ?auto_116414 ) ) ( ON ?auto_116412 ?auto_116413 ) ( CLEAR ?auto_116412 ) ( ON-TABLE ?auto_116414 ) ( HOLDING ?auto_116411 ) ( CLEAR ?auto_116410 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_116407 ?auto_116408 ?auto_116409 ?auto_116410 ?auto_116411 )
      ( MAKE-7PILE ?auto_116407 ?auto_116408 ?auto_116409 ?auto_116410 ?auto_116411 ?auto_116412 ?auto_116413 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_116415 - BLOCK
      ?auto_116416 - BLOCK
      ?auto_116417 - BLOCK
      ?auto_116418 - BLOCK
      ?auto_116419 - BLOCK
      ?auto_116420 - BLOCK
      ?auto_116421 - BLOCK
    )
    :vars
    (
      ?auto_116422 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116415 ) ( ON ?auto_116416 ?auto_116415 ) ( ON ?auto_116417 ?auto_116416 ) ( ON ?auto_116418 ?auto_116417 ) ( not ( = ?auto_116415 ?auto_116416 ) ) ( not ( = ?auto_116415 ?auto_116417 ) ) ( not ( = ?auto_116415 ?auto_116418 ) ) ( not ( = ?auto_116415 ?auto_116419 ) ) ( not ( = ?auto_116415 ?auto_116420 ) ) ( not ( = ?auto_116415 ?auto_116421 ) ) ( not ( = ?auto_116416 ?auto_116417 ) ) ( not ( = ?auto_116416 ?auto_116418 ) ) ( not ( = ?auto_116416 ?auto_116419 ) ) ( not ( = ?auto_116416 ?auto_116420 ) ) ( not ( = ?auto_116416 ?auto_116421 ) ) ( not ( = ?auto_116417 ?auto_116418 ) ) ( not ( = ?auto_116417 ?auto_116419 ) ) ( not ( = ?auto_116417 ?auto_116420 ) ) ( not ( = ?auto_116417 ?auto_116421 ) ) ( not ( = ?auto_116418 ?auto_116419 ) ) ( not ( = ?auto_116418 ?auto_116420 ) ) ( not ( = ?auto_116418 ?auto_116421 ) ) ( not ( = ?auto_116419 ?auto_116420 ) ) ( not ( = ?auto_116419 ?auto_116421 ) ) ( not ( = ?auto_116420 ?auto_116421 ) ) ( ON ?auto_116421 ?auto_116422 ) ( not ( = ?auto_116415 ?auto_116422 ) ) ( not ( = ?auto_116416 ?auto_116422 ) ) ( not ( = ?auto_116417 ?auto_116422 ) ) ( not ( = ?auto_116418 ?auto_116422 ) ) ( not ( = ?auto_116419 ?auto_116422 ) ) ( not ( = ?auto_116420 ?auto_116422 ) ) ( not ( = ?auto_116421 ?auto_116422 ) ) ( ON ?auto_116420 ?auto_116421 ) ( ON-TABLE ?auto_116422 ) ( CLEAR ?auto_116418 ) ( ON ?auto_116419 ?auto_116420 ) ( CLEAR ?auto_116419 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_116422 ?auto_116421 ?auto_116420 )
      ( MAKE-7PILE ?auto_116415 ?auto_116416 ?auto_116417 ?auto_116418 ?auto_116419 ?auto_116420 ?auto_116421 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_116423 - BLOCK
      ?auto_116424 - BLOCK
      ?auto_116425 - BLOCK
      ?auto_116426 - BLOCK
      ?auto_116427 - BLOCK
      ?auto_116428 - BLOCK
      ?auto_116429 - BLOCK
    )
    :vars
    (
      ?auto_116430 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116423 ) ( ON ?auto_116424 ?auto_116423 ) ( ON ?auto_116425 ?auto_116424 ) ( not ( = ?auto_116423 ?auto_116424 ) ) ( not ( = ?auto_116423 ?auto_116425 ) ) ( not ( = ?auto_116423 ?auto_116426 ) ) ( not ( = ?auto_116423 ?auto_116427 ) ) ( not ( = ?auto_116423 ?auto_116428 ) ) ( not ( = ?auto_116423 ?auto_116429 ) ) ( not ( = ?auto_116424 ?auto_116425 ) ) ( not ( = ?auto_116424 ?auto_116426 ) ) ( not ( = ?auto_116424 ?auto_116427 ) ) ( not ( = ?auto_116424 ?auto_116428 ) ) ( not ( = ?auto_116424 ?auto_116429 ) ) ( not ( = ?auto_116425 ?auto_116426 ) ) ( not ( = ?auto_116425 ?auto_116427 ) ) ( not ( = ?auto_116425 ?auto_116428 ) ) ( not ( = ?auto_116425 ?auto_116429 ) ) ( not ( = ?auto_116426 ?auto_116427 ) ) ( not ( = ?auto_116426 ?auto_116428 ) ) ( not ( = ?auto_116426 ?auto_116429 ) ) ( not ( = ?auto_116427 ?auto_116428 ) ) ( not ( = ?auto_116427 ?auto_116429 ) ) ( not ( = ?auto_116428 ?auto_116429 ) ) ( ON ?auto_116429 ?auto_116430 ) ( not ( = ?auto_116423 ?auto_116430 ) ) ( not ( = ?auto_116424 ?auto_116430 ) ) ( not ( = ?auto_116425 ?auto_116430 ) ) ( not ( = ?auto_116426 ?auto_116430 ) ) ( not ( = ?auto_116427 ?auto_116430 ) ) ( not ( = ?auto_116428 ?auto_116430 ) ) ( not ( = ?auto_116429 ?auto_116430 ) ) ( ON ?auto_116428 ?auto_116429 ) ( ON-TABLE ?auto_116430 ) ( ON ?auto_116427 ?auto_116428 ) ( CLEAR ?auto_116427 ) ( HOLDING ?auto_116426 ) ( CLEAR ?auto_116425 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_116423 ?auto_116424 ?auto_116425 ?auto_116426 )
      ( MAKE-7PILE ?auto_116423 ?auto_116424 ?auto_116425 ?auto_116426 ?auto_116427 ?auto_116428 ?auto_116429 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_116431 - BLOCK
      ?auto_116432 - BLOCK
      ?auto_116433 - BLOCK
      ?auto_116434 - BLOCK
      ?auto_116435 - BLOCK
      ?auto_116436 - BLOCK
      ?auto_116437 - BLOCK
    )
    :vars
    (
      ?auto_116438 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116431 ) ( ON ?auto_116432 ?auto_116431 ) ( ON ?auto_116433 ?auto_116432 ) ( not ( = ?auto_116431 ?auto_116432 ) ) ( not ( = ?auto_116431 ?auto_116433 ) ) ( not ( = ?auto_116431 ?auto_116434 ) ) ( not ( = ?auto_116431 ?auto_116435 ) ) ( not ( = ?auto_116431 ?auto_116436 ) ) ( not ( = ?auto_116431 ?auto_116437 ) ) ( not ( = ?auto_116432 ?auto_116433 ) ) ( not ( = ?auto_116432 ?auto_116434 ) ) ( not ( = ?auto_116432 ?auto_116435 ) ) ( not ( = ?auto_116432 ?auto_116436 ) ) ( not ( = ?auto_116432 ?auto_116437 ) ) ( not ( = ?auto_116433 ?auto_116434 ) ) ( not ( = ?auto_116433 ?auto_116435 ) ) ( not ( = ?auto_116433 ?auto_116436 ) ) ( not ( = ?auto_116433 ?auto_116437 ) ) ( not ( = ?auto_116434 ?auto_116435 ) ) ( not ( = ?auto_116434 ?auto_116436 ) ) ( not ( = ?auto_116434 ?auto_116437 ) ) ( not ( = ?auto_116435 ?auto_116436 ) ) ( not ( = ?auto_116435 ?auto_116437 ) ) ( not ( = ?auto_116436 ?auto_116437 ) ) ( ON ?auto_116437 ?auto_116438 ) ( not ( = ?auto_116431 ?auto_116438 ) ) ( not ( = ?auto_116432 ?auto_116438 ) ) ( not ( = ?auto_116433 ?auto_116438 ) ) ( not ( = ?auto_116434 ?auto_116438 ) ) ( not ( = ?auto_116435 ?auto_116438 ) ) ( not ( = ?auto_116436 ?auto_116438 ) ) ( not ( = ?auto_116437 ?auto_116438 ) ) ( ON ?auto_116436 ?auto_116437 ) ( ON-TABLE ?auto_116438 ) ( ON ?auto_116435 ?auto_116436 ) ( CLEAR ?auto_116433 ) ( ON ?auto_116434 ?auto_116435 ) ( CLEAR ?auto_116434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_116438 ?auto_116437 ?auto_116436 ?auto_116435 )
      ( MAKE-7PILE ?auto_116431 ?auto_116432 ?auto_116433 ?auto_116434 ?auto_116435 ?auto_116436 ?auto_116437 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_116439 - BLOCK
      ?auto_116440 - BLOCK
      ?auto_116441 - BLOCK
      ?auto_116442 - BLOCK
      ?auto_116443 - BLOCK
      ?auto_116444 - BLOCK
      ?auto_116445 - BLOCK
    )
    :vars
    (
      ?auto_116446 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116439 ) ( ON ?auto_116440 ?auto_116439 ) ( not ( = ?auto_116439 ?auto_116440 ) ) ( not ( = ?auto_116439 ?auto_116441 ) ) ( not ( = ?auto_116439 ?auto_116442 ) ) ( not ( = ?auto_116439 ?auto_116443 ) ) ( not ( = ?auto_116439 ?auto_116444 ) ) ( not ( = ?auto_116439 ?auto_116445 ) ) ( not ( = ?auto_116440 ?auto_116441 ) ) ( not ( = ?auto_116440 ?auto_116442 ) ) ( not ( = ?auto_116440 ?auto_116443 ) ) ( not ( = ?auto_116440 ?auto_116444 ) ) ( not ( = ?auto_116440 ?auto_116445 ) ) ( not ( = ?auto_116441 ?auto_116442 ) ) ( not ( = ?auto_116441 ?auto_116443 ) ) ( not ( = ?auto_116441 ?auto_116444 ) ) ( not ( = ?auto_116441 ?auto_116445 ) ) ( not ( = ?auto_116442 ?auto_116443 ) ) ( not ( = ?auto_116442 ?auto_116444 ) ) ( not ( = ?auto_116442 ?auto_116445 ) ) ( not ( = ?auto_116443 ?auto_116444 ) ) ( not ( = ?auto_116443 ?auto_116445 ) ) ( not ( = ?auto_116444 ?auto_116445 ) ) ( ON ?auto_116445 ?auto_116446 ) ( not ( = ?auto_116439 ?auto_116446 ) ) ( not ( = ?auto_116440 ?auto_116446 ) ) ( not ( = ?auto_116441 ?auto_116446 ) ) ( not ( = ?auto_116442 ?auto_116446 ) ) ( not ( = ?auto_116443 ?auto_116446 ) ) ( not ( = ?auto_116444 ?auto_116446 ) ) ( not ( = ?auto_116445 ?auto_116446 ) ) ( ON ?auto_116444 ?auto_116445 ) ( ON-TABLE ?auto_116446 ) ( ON ?auto_116443 ?auto_116444 ) ( ON ?auto_116442 ?auto_116443 ) ( CLEAR ?auto_116442 ) ( HOLDING ?auto_116441 ) ( CLEAR ?auto_116440 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_116439 ?auto_116440 ?auto_116441 )
      ( MAKE-7PILE ?auto_116439 ?auto_116440 ?auto_116441 ?auto_116442 ?auto_116443 ?auto_116444 ?auto_116445 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_116447 - BLOCK
      ?auto_116448 - BLOCK
      ?auto_116449 - BLOCK
      ?auto_116450 - BLOCK
      ?auto_116451 - BLOCK
      ?auto_116452 - BLOCK
      ?auto_116453 - BLOCK
    )
    :vars
    (
      ?auto_116454 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116447 ) ( ON ?auto_116448 ?auto_116447 ) ( not ( = ?auto_116447 ?auto_116448 ) ) ( not ( = ?auto_116447 ?auto_116449 ) ) ( not ( = ?auto_116447 ?auto_116450 ) ) ( not ( = ?auto_116447 ?auto_116451 ) ) ( not ( = ?auto_116447 ?auto_116452 ) ) ( not ( = ?auto_116447 ?auto_116453 ) ) ( not ( = ?auto_116448 ?auto_116449 ) ) ( not ( = ?auto_116448 ?auto_116450 ) ) ( not ( = ?auto_116448 ?auto_116451 ) ) ( not ( = ?auto_116448 ?auto_116452 ) ) ( not ( = ?auto_116448 ?auto_116453 ) ) ( not ( = ?auto_116449 ?auto_116450 ) ) ( not ( = ?auto_116449 ?auto_116451 ) ) ( not ( = ?auto_116449 ?auto_116452 ) ) ( not ( = ?auto_116449 ?auto_116453 ) ) ( not ( = ?auto_116450 ?auto_116451 ) ) ( not ( = ?auto_116450 ?auto_116452 ) ) ( not ( = ?auto_116450 ?auto_116453 ) ) ( not ( = ?auto_116451 ?auto_116452 ) ) ( not ( = ?auto_116451 ?auto_116453 ) ) ( not ( = ?auto_116452 ?auto_116453 ) ) ( ON ?auto_116453 ?auto_116454 ) ( not ( = ?auto_116447 ?auto_116454 ) ) ( not ( = ?auto_116448 ?auto_116454 ) ) ( not ( = ?auto_116449 ?auto_116454 ) ) ( not ( = ?auto_116450 ?auto_116454 ) ) ( not ( = ?auto_116451 ?auto_116454 ) ) ( not ( = ?auto_116452 ?auto_116454 ) ) ( not ( = ?auto_116453 ?auto_116454 ) ) ( ON ?auto_116452 ?auto_116453 ) ( ON-TABLE ?auto_116454 ) ( ON ?auto_116451 ?auto_116452 ) ( ON ?auto_116450 ?auto_116451 ) ( CLEAR ?auto_116448 ) ( ON ?auto_116449 ?auto_116450 ) ( CLEAR ?auto_116449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_116454 ?auto_116453 ?auto_116452 ?auto_116451 ?auto_116450 )
      ( MAKE-7PILE ?auto_116447 ?auto_116448 ?auto_116449 ?auto_116450 ?auto_116451 ?auto_116452 ?auto_116453 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_116455 - BLOCK
      ?auto_116456 - BLOCK
      ?auto_116457 - BLOCK
      ?auto_116458 - BLOCK
      ?auto_116459 - BLOCK
      ?auto_116460 - BLOCK
      ?auto_116461 - BLOCK
    )
    :vars
    (
      ?auto_116462 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116455 ) ( not ( = ?auto_116455 ?auto_116456 ) ) ( not ( = ?auto_116455 ?auto_116457 ) ) ( not ( = ?auto_116455 ?auto_116458 ) ) ( not ( = ?auto_116455 ?auto_116459 ) ) ( not ( = ?auto_116455 ?auto_116460 ) ) ( not ( = ?auto_116455 ?auto_116461 ) ) ( not ( = ?auto_116456 ?auto_116457 ) ) ( not ( = ?auto_116456 ?auto_116458 ) ) ( not ( = ?auto_116456 ?auto_116459 ) ) ( not ( = ?auto_116456 ?auto_116460 ) ) ( not ( = ?auto_116456 ?auto_116461 ) ) ( not ( = ?auto_116457 ?auto_116458 ) ) ( not ( = ?auto_116457 ?auto_116459 ) ) ( not ( = ?auto_116457 ?auto_116460 ) ) ( not ( = ?auto_116457 ?auto_116461 ) ) ( not ( = ?auto_116458 ?auto_116459 ) ) ( not ( = ?auto_116458 ?auto_116460 ) ) ( not ( = ?auto_116458 ?auto_116461 ) ) ( not ( = ?auto_116459 ?auto_116460 ) ) ( not ( = ?auto_116459 ?auto_116461 ) ) ( not ( = ?auto_116460 ?auto_116461 ) ) ( ON ?auto_116461 ?auto_116462 ) ( not ( = ?auto_116455 ?auto_116462 ) ) ( not ( = ?auto_116456 ?auto_116462 ) ) ( not ( = ?auto_116457 ?auto_116462 ) ) ( not ( = ?auto_116458 ?auto_116462 ) ) ( not ( = ?auto_116459 ?auto_116462 ) ) ( not ( = ?auto_116460 ?auto_116462 ) ) ( not ( = ?auto_116461 ?auto_116462 ) ) ( ON ?auto_116460 ?auto_116461 ) ( ON-TABLE ?auto_116462 ) ( ON ?auto_116459 ?auto_116460 ) ( ON ?auto_116458 ?auto_116459 ) ( ON ?auto_116457 ?auto_116458 ) ( CLEAR ?auto_116457 ) ( HOLDING ?auto_116456 ) ( CLEAR ?auto_116455 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_116455 ?auto_116456 )
      ( MAKE-7PILE ?auto_116455 ?auto_116456 ?auto_116457 ?auto_116458 ?auto_116459 ?auto_116460 ?auto_116461 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_116463 - BLOCK
      ?auto_116464 - BLOCK
      ?auto_116465 - BLOCK
      ?auto_116466 - BLOCK
      ?auto_116467 - BLOCK
      ?auto_116468 - BLOCK
      ?auto_116469 - BLOCK
    )
    :vars
    (
      ?auto_116470 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116463 ) ( not ( = ?auto_116463 ?auto_116464 ) ) ( not ( = ?auto_116463 ?auto_116465 ) ) ( not ( = ?auto_116463 ?auto_116466 ) ) ( not ( = ?auto_116463 ?auto_116467 ) ) ( not ( = ?auto_116463 ?auto_116468 ) ) ( not ( = ?auto_116463 ?auto_116469 ) ) ( not ( = ?auto_116464 ?auto_116465 ) ) ( not ( = ?auto_116464 ?auto_116466 ) ) ( not ( = ?auto_116464 ?auto_116467 ) ) ( not ( = ?auto_116464 ?auto_116468 ) ) ( not ( = ?auto_116464 ?auto_116469 ) ) ( not ( = ?auto_116465 ?auto_116466 ) ) ( not ( = ?auto_116465 ?auto_116467 ) ) ( not ( = ?auto_116465 ?auto_116468 ) ) ( not ( = ?auto_116465 ?auto_116469 ) ) ( not ( = ?auto_116466 ?auto_116467 ) ) ( not ( = ?auto_116466 ?auto_116468 ) ) ( not ( = ?auto_116466 ?auto_116469 ) ) ( not ( = ?auto_116467 ?auto_116468 ) ) ( not ( = ?auto_116467 ?auto_116469 ) ) ( not ( = ?auto_116468 ?auto_116469 ) ) ( ON ?auto_116469 ?auto_116470 ) ( not ( = ?auto_116463 ?auto_116470 ) ) ( not ( = ?auto_116464 ?auto_116470 ) ) ( not ( = ?auto_116465 ?auto_116470 ) ) ( not ( = ?auto_116466 ?auto_116470 ) ) ( not ( = ?auto_116467 ?auto_116470 ) ) ( not ( = ?auto_116468 ?auto_116470 ) ) ( not ( = ?auto_116469 ?auto_116470 ) ) ( ON ?auto_116468 ?auto_116469 ) ( ON-TABLE ?auto_116470 ) ( ON ?auto_116467 ?auto_116468 ) ( ON ?auto_116466 ?auto_116467 ) ( ON ?auto_116465 ?auto_116466 ) ( CLEAR ?auto_116463 ) ( ON ?auto_116464 ?auto_116465 ) ( CLEAR ?auto_116464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_116470 ?auto_116469 ?auto_116468 ?auto_116467 ?auto_116466 ?auto_116465 )
      ( MAKE-7PILE ?auto_116463 ?auto_116464 ?auto_116465 ?auto_116466 ?auto_116467 ?auto_116468 ?auto_116469 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_116471 - BLOCK
      ?auto_116472 - BLOCK
      ?auto_116473 - BLOCK
      ?auto_116474 - BLOCK
      ?auto_116475 - BLOCK
      ?auto_116476 - BLOCK
      ?auto_116477 - BLOCK
    )
    :vars
    (
      ?auto_116478 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116471 ?auto_116472 ) ) ( not ( = ?auto_116471 ?auto_116473 ) ) ( not ( = ?auto_116471 ?auto_116474 ) ) ( not ( = ?auto_116471 ?auto_116475 ) ) ( not ( = ?auto_116471 ?auto_116476 ) ) ( not ( = ?auto_116471 ?auto_116477 ) ) ( not ( = ?auto_116472 ?auto_116473 ) ) ( not ( = ?auto_116472 ?auto_116474 ) ) ( not ( = ?auto_116472 ?auto_116475 ) ) ( not ( = ?auto_116472 ?auto_116476 ) ) ( not ( = ?auto_116472 ?auto_116477 ) ) ( not ( = ?auto_116473 ?auto_116474 ) ) ( not ( = ?auto_116473 ?auto_116475 ) ) ( not ( = ?auto_116473 ?auto_116476 ) ) ( not ( = ?auto_116473 ?auto_116477 ) ) ( not ( = ?auto_116474 ?auto_116475 ) ) ( not ( = ?auto_116474 ?auto_116476 ) ) ( not ( = ?auto_116474 ?auto_116477 ) ) ( not ( = ?auto_116475 ?auto_116476 ) ) ( not ( = ?auto_116475 ?auto_116477 ) ) ( not ( = ?auto_116476 ?auto_116477 ) ) ( ON ?auto_116477 ?auto_116478 ) ( not ( = ?auto_116471 ?auto_116478 ) ) ( not ( = ?auto_116472 ?auto_116478 ) ) ( not ( = ?auto_116473 ?auto_116478 ) ) ( not ( = ?auto_116474 ?auto_116478 ) ) ( not ( = ?auto_116475 ?auto_116478 ) ) ( not ( = ?auto_116476 ?auto_116478 ) ) ( not ( = ?auto_116477 ?auto_116478 ) ) ( ON ?auto_116476 ?auto_116477 ) ( ON-TABLE ?auto_116478 ) ( ON ?auto_116475 ?auto_116476 ) ( ON ?auto_116474 ?auto_116475 ) ( ON ?auto_116473 ?auto_116474 ) ( ON ?auto_116472 ?auto_116473 ) ( CLEAR ?auto_116472 ) ( HOLDING ?auto_116471 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_116471 )
      ( MAKE-7PILE ?auto_116471 ?auto_116472 ?auto_116473 ?auto_116474 ?auto_116475 ?auto_116476 ?auto_116477 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_116479 - BLOCK
      ?auto_116480 - BLOCK
      ?auto_116481 - BLOCK
      ?auto_116482 - BLOCK
      ?auto_116483 - BLOCK
      ?auto_116484 - BLOCK
      ?auto_116485 - BLOCK
    )
    :vars
    (
      ?auto_116486 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116479 ?auto_116480 ) ) ( not ( = ?auto_116479 ?auto_116481 ) ) ( not ( = ?auto_116479 ?auto_116482 ) ) ( not ( = ?auto_116479 ?auto_116483 ) ) ( not ( = ?auto_116479 ?auto_116484 ) ) ( not ( = ?auto_116479 ?auto_116485 ) ) ( not ( = ?auto_116480 ?auto_116481 ) ) ( not ( = ?auto_116480 ?auto_116482 ) ) ( not ( = ?auto_116480 ?auto_116483 ) ) ( not ( = ?auto_116480 ?auto_116484 ) ) ( not ( = ?auto_116480 ?auto_116485 ) ) ( not ( = ?auto_116481 ?auto_116482 ) ) ( not ( = ?auto_116481 ?auto_116483 ) ) ( not ( = ?auto_116481 ?auto_116484 ) ) ( not ( = ?auto_116481 ?auto_116485 ) ) ( not ( = ?auto_116482 ?auto_116483 ) ) ( not ( = ?auto_116482 ?auto_116484 ) ) ( not ( = ?auto_116482 ?auto_116485 ) ) ( not ( = ?auto_116483 ?auto_116484 ) ) ( not ( = ?auto_116483 ?auto_116485 ) ) ( not ( = ?auto_116484 ?auto_116485 ) ) ( ON ?auto_116485 ?auto_116486 ) ( not ( = ?auto_116479 ?auto_116486 ) ) ( not ( = ?auto_116480 ?auto_116486 ) ) ( not ( = ?auto_116481 ?auto_116486 ) ) ( not ( = ?auto_116482 ?auto_116486 ) ) ( not ( = ?auto_116483 ?auto_116486 ) ) ( not ( = ?auto_116484 ?auto_116486 ) ) ( not ( = ?auto_116485 ?auto_116486 ) ) ( ON ?auto_116484 ?auto_116485 ) ( ON-TABLE ?auto_116486 ) ( ON ?auto_116483 ?auto_116484 ) ( ON ?auto_116482 ?auto_116483 ) ( ON ?auto_116481 ?auto_116482 ) ( ON ?auto_116480 ?auto_116481 ) ( ON ?auto_116479 ?auto_116480 ) ( CLEAR ?auto_116479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_116486 ?auto_116485 ?auto_116484 ?auto_116483 ?auto_116482 ?auto_116481 ?auto_116480 )
      ( MAKE-7PILE ?auto_116479 ?auto_116480 ?auto_116481 ?auto_116482 ?auto_116483 ?auto_116484 ?auto_116485 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116493 - BLOCK
      ?auto_116494 - BLOCK
      ?auto_116495 - BLOCK
      ?auto_116496 - BLOCK
      ?auto_116497 - BLOCK
      ?auto_116498 - BLOCK
    )
    :vars
    (
      ?auto_116499 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116499 ?auto_116498 ) ( CLEAR ?auto_116499 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_116493 ) ( ON ?auto_116494 ?auto_116493 ) ( ON ?auto_116495 ?auto_116494 ) ( ON ?auto_116496 ?auto_116495 ) ( ON ?auto_116497 ?auto_116496 ) ( ON ?auto_116498 ?auto_116497 ) ( not ( = ?auto_116493 ?auto_116494 ) ) ( not ( = ?auto_116493 ?auto_116495 ) ) ( not ( = ?auto_116493 ?auto_116496 ) ) ( not ( = ?auto_116493 ?auto_116497 ) ) ( not ( = ?auto_116493 ?auto_116498 ) ) ( not ( = ?auto_116493 ?auto_116499 ) ) ( not ( = ?auto_116494 ?auto_116495 ) ) ( not ( = ?auto_116494 ?auto_116496 ) ) ( not ( = ?auto_116494 ?auto_116497 ) ) ( not ( = ?auto_116494 ?auto_116498 ) ) ( not ( = ?auto_116494 ?auto_116499 ) ) ( not ( = ?auto_116495 ?auto_116496 ) ) ( not ( = ?auto_116495 ?auto_116497 ) ) ( not ( = ?auto_116495 ?auto_116498 ) ) ( not ( = ?auto_116495 ?auto_116499 ) ) ( not ( = ?auto_116496 ?auto_116497 ) ) ( not ( = ?auto_116496 ?auto_116498 ) ) ( not ( = ?auto_116496 ?auto_116499 ) ) ( not ( = ?auto_116497 ?auto_116498 ) ) ( not ( = ?auto_116497 ?auto_116499 ) ) ( not ( = ?auto_116498 ?auto_116499 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_116499 ?auto_116498 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116515 - BLOCK
      ?auto_116516 - BLOCK
      ?auto_116517 - BLOCK
      ?auto_116518 - BLOCK
      ?auto_116519 - BLOCK
      ?auto_116520 - BLOCK
    )
    :vars
    (
      ?auto_116521 - BLOCK
      ?auto_116522 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116515 ) ( ON ?auto_116516 ?auto_116515 ) ( ON ?auto_116517 ?auto_116516 ) ( ON ?auto_116518 ?auto_116517 ) ( ON ?auto_116519 ?auto_116518 ) ( not ( = ?auto_116515 ?auto_116516 ) ) ( not ( = ?auto_116515 ?auto_116517 ) ) ( not ( = ?auto_116515 ?auto_116518 ) ) ( not ( = ?auto_116515 ?auto_116519 ) ) ( not ( = ?auto_116515 ?auto_116520 ) ) ( not ( = ?auto_116515 ?auto_116521 ) ) ( not ( = ?auto_116516 ?auto_116517 ) ) ( not ( = ?auto_116516 ?auto_116518 ) ) ( not ( = ?auto_116516 ?auto_116519 ) ) ( not ( = ?auto_116516 ?auto_116520 ) ) ( not ( = ?auto_116516 ?auto_116521 ) ) ( not ( = ?auto_116517 ?auto_116518 ) ) ( not ( = ?auto_116517 ?auto_116519 ) ) ( not ( = ?auto_116517 ?auto_116520 ) ) ( not ( = ?auto_116517 ?auto_116521 ) ) ( not ( = ?auto_116518 ?auto_116519 ) ) ( not ( = ?auto_116518 ?auto_116520 ) ) ( not ( = ?auto_116518 ?auto_116521 ) ) ( not ( = ?auto_116519 ?auto_116520 ) ) ( not ( = ?auto_116519 ?auto_116521 ) ) ( not ( = ?auto_116520 ?auto_116521 ) ) ( ON ?auto_116521 ?auto_116522 ) ( CLEAR ?auto_116521 ) ( not ( = ?auto_116515 ?auto_116522 ) ) ( not ( = ?auto_116516 ?auto_116522 ) ) ( not ( = ?auto_116517 ?auto_116522 ) ) ( not ( = ?auto_116518 ?auto_116522 ) ) ( not ( = ?auto_116519 ?auto_116522 ) ) ( not ( = ?auto_116520 ?auto_116522 ) ) ( not ( = ?auto_116521 ?auto_116522 ) ) ( HOLDING ?auto_116520 ) ( CLEAR ?auto_116519 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_116515 ?auto_116516 ?auto_116517 ?auto_116518 ?auto_116519 ?auto_116520 ?auto_116521 )
      ( MAKE-6PILE ?auto_116515 ?auto_116516 ?auto_116517 ?auto_116518 ?auto_116519 ?auto_116520 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116523 - BLOCK
      ?auto_116524 - BLOCK
      ?auto_116525 - BLOCK
      ?auto_116526 - BLOCK
      ?auto_116527 - BLOCK
      ?auto_116528 - BLOCK
    )
    :vars
    (
      ?auto_116530 - BLOCK
      ?auto_116529 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116523 ) ( ON ?auto_116524 ?auto_116523 ) ( ON ?auto_116525 ?auto_116524 ) ( ON ?auto_116526 ?auto_116525 ) ( ON ?auto_116527 ?auto_116526 ) ( not ( = ?auto_116523 ?auto_116524 ) ) ( not ( = ?auto_116523 ?auto_116525 ) ) ( not ( = ?auto_116523 ?auto_116526 ) ) ( not ( = ?auto_116523 ?auto_116527 ) ) ( not ( = ?auto_116523 ?auto_116528 ) ) ( not ( = ?auto_116523 ?auto_116530 ) ) ( not ( = ?auto_116524 ?auto_116525 ) ) ( not ( = ?auto_116524 ?auto_116526 ) ) ( not ( = ?auto_116524 ?auto_116527 ) ) ( not ( = ?auto_116524 ?auto_116528 ) ) ( not ( = ?auto_116524 ?auto_116530 ) ) ( not ( = ?auto_116525 ?auto_116526 ) ) ( not ( = ?auto_116525 ?auto_116527 ) ) ( not ( = ?auto_116525 ?auto_116528 ) ) ( not ( = ?auto_116525 ?auto_116530 ) ) ( not ( = ?auto_116526 ?auto_116527 ) ) ( not ( = ?auto_116526 ?auto_116528 ) ) ( not ( = ?auto_116526 ?auto_116530 ) ) ( not ( = ?auto_116527 ?auto_116528 ) ) ( not ( = ?auto_116527 ?auto_116530 ) ) ( not ( = ?auto_116528 ?auto_116530 ) ) ( ON ?auto_116530 ?auto_116529 ) ( not ( = ?auto_116523 ?auto_116529 ) ) ( not ( = ?auto_116524 ?auto_116529 ) ) ( not ( = ?auto_116525 ?auto_116529 ) ) ( not ( = ?auto_116526 ?auto_116529 ) ) ( not ( = ?auto_116527 ?auto_116529 ) ) ( not ( = ?auto_116528 ?auto_116529 ) ) ( not ( = ?auto_116530 ?auto_116529 ) ) ( CLEAR ?auto_116527 ) ( ON ?auto_116528 ?auto_116530 ) ( CLEAR ?auto_116528 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_116529 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_116529 ?auto_116530 )
      ( MAKE-6PILE ?auto_116523 ?auto_116524 ?auto_116525 ?auto_116526 ?auto_116527 ?auto_116528 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116531 - BLOCK
      ?auto_116532 - BLOCK
      ?auto_116533 - BLOCK
      ?auto_116534 - BLOCK
      ?auto_116535 - BLOCK
      ?auto_116536 - BLOCK
    )
    :vars
    (
      ?auto_116537 - BLOCK
      ?auto_116538 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116531 ) ( ON ?auto_116532 ?auto_116531 ) ( ON ?auto_116533 ?auto_116532 ) ( ON ?auto_116534 ?auto_116533 ) ( not ( = ?auto_116531 ?auto_116532 ) ) ( not ( = ?auto_116531 ?auto_116533 ) ) ( not ( = ?auto_116531 ?auto_116534 ) ) ( not ( = ?auto_116531 ?auto_116535 ) ) ( not ( = ?auto_116531 ?auto_116536 ) ) ( not ( = ?auto_116531 ?auto_116537 ) ) ( not ( = ?auto_116532 ?auto_116533 ) ) ( not ( = ?auto_116532 ?auto_116534 ) ) ( not ( = ?auto_116532 ?auto_116535 ) ) ( not ( = ?auto_116532 ?auto_116536 ) ) ( not ( = ?auto_116532 ?auto_116537 ) ) ( not ( = ?auto_116533 ?auto_116534 ) ) ( not ( = ?auto_116533 ?auto_116535 ) ) ( not ( = ?auto_116533 ?auto_116536 ) ) ( not ( = ?auto_116533 ?auto_116537 ) ) ( not ( = ?auto_116534 ?auto_116535 ) ) ( not ( = ?auto_116534 ?auto_116536 ) ) ( not ( = ?auto_116534 ?auto_116537 ) ) ( not ( = ?auto_116535 ?auto_116536 ) ) ( not ( = ?auto_116535 ?auto_116537 ) ) ( not ( = ?auto_116536 ?auto_116537 ) ) ( ON ?auto_116537 ?auto_116538 ) ( not ( = ?auto_116531 ?auto_116538 ) ) ( not ( = ?auto_116532 ?auto_116538 ) ) ( not ( = ?auto_116533 ?auto_116538 ) ) ( not ( = ?auto_116534 ?auto_116538 ) ) ( not ( = ?auto_116535 ?auto_116538 ) ) ( not ( = ?auto_116536 ?auto_116538 ) ) ( not ( = ?auto_116537 ?auto_116538 ) ) ( ON ?auto_116536 ?auto_116537 ) ( CLEAR ?auto_116536 ) ( ON-TABLE ?auto_116538 ) ( HOLDING ?auto_116535 ) ( CLEAR ?auto_116534 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_116531 ?auto_116532 ?auto_116533 ?auto_116534 ?auto_116535 )
      ( MAKE-6PILE ?auto_116531 ?auto_116532 ?auto_116533 ?auto_116534 ?auto_116535 ?auto_116536 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116539 - BLOCK
      ?auto_116540 - BLOCK
      ?auto_116541 - BLOCK
      ?auto_116542 - BLOCK
      ?auto_116543 - BLOCK
      ?auto_116544 - BLOCK
    )
    :vars
    (
      ?auto_116546 - BLOCK
      ?auto_116545 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116539 ) ( ON ?auto_116540 ?auto_116539 ) ( ON ?auto_116541 ?auto_116540 ) ( ON ?auto_116542 ?auto_116541 ) ( not ( = ?auto_116539 ?auto_116540 ) ) ( not ( = ?auto_116539 ?auto_116541 ) ) ( not ( = ?auto_116539 ?auto_116542 ) ) ( not ( = ?auto_116539 ?auto_116543 ) ) ( not ( = ?auto_116539 ?auto_116544 ) ) ( not ( = ?auto_116539 ?auto_116546 ) ) ( not ( = ?auto_116540 ?auto_116541 ) ) ( not ( = ?auto_116540 ?auto_116542 ) ) ( not ( = ?auto_116540 ?auto_116543 ) ) ( not ( = ?auto_116540 ?auto_116544 ) ) ( not ( = ?auto_116540 ?auto_116546 ) ) ( not ( = ?auto_116541 ?auto_116542 ) ) ( not ( = ?auto_116541 ?auto_116543 ) ) ( not ( = ?auto_116541 ?auto_116544 ) ) ( not ( = ?auto_116541 ?auto_116546 ) ) ( not ( = ?auto_116542 ?auto_116543 ) ) ( not ( = ?auto_116542 ?auto_116544 ) ) ( not ( = ?auto_116542 ?auto_116546 ) ) ( not ( = ?auto_116543 ?auto_116544 ) ) ( not ( = ?auto_116543 ?auto_116546 ) ) ( not ( = ?auto_116544 ?auto_116546 ) ) ( ON ?auto_116546 ?auto_116545 ) ( not ( = ?auto_116539 ?auto_116545 ) ) ( not ( = ?auto_116540 ?auto_116545 ) ) ( not ( = ?auto_116541 ?auto_116545 ) ) ( not ( = ?auto_116542 ?auto_116545 ) ) ( not ( = ?auto_116543 ?auto_116545 ) ) ( not ( = ?auto_116544 ?auto_116545 ) ) ( not ( = ?auto_116546 ?auto_116545 ) ) ( ON ?auto_116544 ?auto_116546 ) ( ON-TABLE ?auto_116545 ) ( CLEAR ?auto_116542 ) ( ON ?auto_116543 ?auto_116544 ) ( CLEAR ?auto_116543 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_116545 ?auto_116546 ?auto_116544 )
      ( MAKE-6PILE ?auto_116539 ?auto_116540 ?auto_116541 ?auto_116542 ?auto_116543 ?auto_116544 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116547 - BLOCK
      ?auto_116548 - BLOCK
      ?auto_116549 - BLOCK
      ?auto_116550 - BLOCK
      ?auto_116551 - BLOCK
      ?auto_116552 - BLOCK
    )
    :vars
    (
      ?auto_116554 - BLOCK
      ?auto_116553 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116547 ) ( ON ?auto_116548 ?auto_116547 ) ( ON ?auto_116549 ?auto_116548 ) ( not ( = ?auto_116547 ?auto_116548 ) ) ( not ( = ?auto_116547 ?auto_116549 ) ) ( not ( = ?auto_116547 ?auto_116550 ) ) ( not ( = ?auto_116547 ?auto_116551 ) ) ( not ( = ?auto_116547 ?auto_116552 ) ) ( not ( = ?auto_116547 ?auto_116554 ) ) ( not ( = ?auto_116548 ?auto_116549 ) ) ( not ( = ?auto_116548 ?auto_116550 ) ) ( not ( = ?auto_116548 ?auto_116551 ) ) ( not ( = ?auto_116548 ?auto_116552 ) ) ( not ( = ?auto_116548 ?auto_116554 ) ) ( not ( = ?auto_116549 ?auto_116550 ) ) ( not ( = ?auto_116549 ?auto_116551 ) ) ( not ( = ?auto_116549 ?auto_116552 ) ) ( not ( = ?auto_116549 ?auto_116554 ) ) ( not ( = ?auto_116550 ?auto_116551 ) ) ( not ( = ?auto_116550 ?auto_116552 ) ) ( not ( = ?auto_116550 ?auto_116554 ) ) ( not ( = ?auto_116551 ?auto_116552 ) ) ( not ( = ?auto_116551 ?auto_116554 ) ) ( not ( = ?auto_116552 ?auto_116554 ) ) ( ON ?auto_116554 ?auto_116553 ) ( not ( = ?auto_116547 ?auto_116553 ) ) ( not ( = ?auto_116548 ?auto_116553 ) ) ( not ( = ?auto_116549 ?auto_116553 ) ) ( not ( = ?auto_116550 ?auto_116553 ) ) ( not ( = ?auto_116551 ?auto_116553 ) ) ( not ( = ?auto_116552 ?auto_116553 ) ) ( not ( = ?auto_116554 ?auto_116553 ) ) ( ON ?auto_116552 ?auto_116554 ) ( ON-TABLE ?auto_116553 ) ( ON ?auto_116551 ?auto_116552 ) ( CLEAR ?auto_116551 ) ( HOLDING ?auto_116550 ) ( CLEAR ?auto_116549 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_116547 ?auto_116548 ?auto_116549 ?auto_116550 )
      ( MAKE-6PILE ?auto_116547 ?auto_116548 ?auto_116549 ?auto_116550 ?auto_116551 ?auto_116552 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116555 - BLOCK
      ?auto_116556 - BLOCK
      ?auto_116557 - BLOCK
      ?auto_116558 - BLOCK
      ?auto_116559 - BLOCK
      ?auto_116560 - BLOCK
    )
    :vars
    (
      ?auto_116561 - BLOCK
      ?auto_116562 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116555 ) ( ON ?auto_116556 ?auto_116555 ) ( ON ?auto_116557 ?auto_116556 ) ( not ( = ?auto_116555 ?auto_116556 ) ) ( not ( = ?auto_116555 ?auto_116557 ) ) ( not ( = ?auto_116555 ?auto_116558 ) ) ( not ( = ?auto_116555 ?auto_116559 ) ) ( not ( = ?auto_116555 ?auto_116560 ) ) ( not ( = ?auto_116555 ?auto_116561 ) ) ( not ( = ?auto_116556 ?auto_116557 ) ) ( not ( = ?auto_116556 ?auto_116558 ) ) ( not ( = ?auto_116556 ?auto_116559 ) ) ( not ( = ?auto_116556 ?auto_116560 ) ) ( not ( = ?auto_116556 ?auto_116561 ) ) ( not ( = ?auto_116557 ?auto_116558 ) ) ( not ( = ?auto_116557 ?auto_116559 ) ) ( not ( = ?auto_116557 ?auto_116560 ) ) ( not ( = ?auto_116557 ?auto_116561 ) ) ( not ( = ?auto_116558 ?auto_116559 ) ) ( not ( = ?auto_116558 ?auto_116560 ) ) ( not ( = ?auto_116558 ?auto_116561 ) ) ( not ( = ?auto_116559 ?auto_116560 ) ) ( not ( = ?auto_116559 ?auto_116561 ) ) ( not ( = ?auto_116560 ?auto_116561 ) ) ( ON ?auto_116561 ?auto_116562 ) ( not ( = ?auto_116555 ?auto_116562 ) ) ( not ( = ?auto_116556 ?auto_116562 ) ) ( not ( = ?auto_116557 ?auto_116562 ) ) ( not ( = ?auto_116558 ?auto_116562 ) ) ( not ( = ?auto_116559 ?auto_116562 ) ) ( not ( = ?auto_116560 ?auto_116562 ) ) ( not ( = ?auto_116561 ?auto_116562 ) ) ( ON ?auto_116560 ?auto_116561 ) ( ON-TABLE ?auto_116562 ) ( ON ?auto_116559 ?auto_116560 ) ( CLEAR ?auto_116557 ) ( ON ?auto_116558 ?auto_116559 ) ( CLEAR ?auto_116558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_116562 ?auto_116561 ?auto_116560 ?auto_116559 )
      ( MAKE-6PILE ?auto_116555 ?auto_116556 ?auto_116557 ?auto_116558 ?auto_116559 ?auto_116560 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116563 - BLOCK
      ?auto_116564 - BLOCK
      ?auto_116565 - BLOCK
      ?auto_116566 - BLOCK
      ?auto_116567 - BLOCK
      ?auto_116568 - BLOCK
    )
    :vars
    (
      ?auto_116569 - BLOCK
      ?auto_116570 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116563 ) ( ON ?auto_116564 ?auto_116563 ) ( not ( = ?auto_116563 ?auto_116564 ) ) ( not ( = ?auto_116563 ?auto_116565 ) ) ( not ( = ?auto_116563 ?auto_116566 ) ) ( not ( = ?auto_116563 ?auto_116567 ) ) ( not ( = ?auto_116563 ?auto_116568 ) ) ( not ( = ?auto_116563 ?auto_116569 ) ) ( not ( = ?auto_116564 ?auto_116565 ) ) ( not ( = ?auto_116564 ?auto_116566 ) ) ( not ( = ?auto_116564 ?auto_116567 ) ) ( not ( = ?auto_116564 ?auto_116568 ) ) ( not ( = ?auto_116564 ?auto_116569 ) ) ( not ( = ?auto_116565 ?auto_116566 ) ) ( not ( = ?auto_116565 ?auto_116567 ) ) ( not ( = ?auto_116565 ?auto_116568 ) ) ( not ( = ?auto_116565 ?auto_116569 ) ) ( not ( = ?auto_116566 ?auto_116567 ) ) ( not ( = ?auto_116566 ?auto_116568 ) ) ( not ( = ?auto_116566 ?auto_116569 ) ) ( not ( = ?auto_116567 ?auto_116568 ) ) ( not ( = ?auto_116567 ?auto_116569 ) ) ( not ( = ?auto_116568 ?auto_116569 ) ) ( ON ?auto_116569 ?auto_116570 ) ( not ( = ?auto_116563 ?auto_116570 ) ) ( not ( = ?auto_116564 ?auto_116570 ) ) ( not ( = ?auto_116565 ?auto_116570 ) ) ( not ( = ?auto_116566 ?auto_116570 ) ) ( not ( = ?auto_116567 ?auto_116570 ) ) ( not ( = ?auto_116568 ?auto_116570 ) ) ( not ( = ?auto_116569 ?auto_116570 ) ) ( ON ?auto_116568 ?auto_116569 ) ( ON-TABLE ?auto_116570 ) ( ON ?auto_116567 ?auto_116568 ) ( ON ?auto_116566 ?auto_116567 ) ( CLEAR ?auto_116566 ) ( HOLDING ?auto_116565 ) ( CLEAR ?auto_116564 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_116563 ?auto_116564 ?auto_116565 )
      ( MAKE-6PILE ?auto_116563 ?auto_116564 ?auto_116565 ?auto_116566 ?auto_116567 ?auto_116568 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116571 - BLOCK
      ?auto_116572 - BLOCK
      ?auto_116573 - BLOCK
      ?auto_116574 - BLOCK
      ?auto_116575 - BLOCK
      ?auto_116576 - BLOCK
    )
    :vars
    (
      ?auto_116577 - BLOCK
      ?auto_116578 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116571 ) ( ON ?auto_116572 ?auto_116571 ) ( not ( = ?auto_116571 ?auto_116572 ) ) ( not ( = ?auto_116571 ?auto_116573 ) ) ( not ( = ?auto_116571 ?auto_116574 ) ) ( not ( = ?auto_116571 ?auto_116575 ) ) ( not ( = ?auto_116571 ?auto_116576 ) ) ( not ( = ?auto_116571 ?auto_116577 ) ) ( not ( = ?auto_116572 ?auto_116573 ) ) ( not ( = ?auto_116572 ?auto_116574 ) ) ( not ( = ?auto_116572 ?auto_116575 ) ) ( not ( = ?auto_116572 ?auto_116576 ) ) ( not ( = ?auto_116572 ?auto_116577 ) ) ( not ( = ?auto_116573 ?auto_116574 ) ) ( not ( = ?auto_116573 ?auto_116575 ) ) ( not ( = ?auto_116573 ?auto_116576 ) ) ( not ( = ?auto_116573 ?auto_116577 ) ) ( not ( = ?auto_116574 ?auto_116575 ) ) ( not ( = ?auto_116574 ?auto_116576 ) ) ( not ( = ?auto_116574 ?auto_116577 ) ) ( not ( = ?auto_116575 ?auto_116576 ) ) ( not ( = ?auto_116575 ?auto_116577 ) ) ( not ( = ?auto_116576 ?auto_116577 ) ) ( ON ?auto_116577 ?auto_116578 ) ( not ( = ?auto_116571 ?auto_116578 ) ) ( not ( = ?auto_116572 ?auto_116578 ) ) ( not ( = ?auto_116573 ?auto_116578 ) ) ( not ( = ?auto_116574 ?auto_116578 ) ) ( not ( = ?auto_116575 ?auto_116578 ) ) ( not ( = ?auto_116576 ?auto_116578 ) ) ( not ( = ?auto_116577 ?auto_116578 ) ) ( ON ?auto_116576 ?auto_116577 ) ( ON-TABLE ?auto_116578 ) ( ON ?auto_116575 ?auto_116576 ) ( ON ?auto_116574 ?auto_116575 ) ( CLEAR ?auto_116572 ) ( ON ?auto_116573 ?auto_116574 ) ( CLEAR ?auto_116573 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_116578 ?auto_116577 ?auto_116576 ?auto_116575 ?auto_116574 )
      ( MAKE-6PILE ?auto_116571 ?auto_116572 ?auto_116573 ?auto_116574 ?auto_116575 ?auto_116576 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116579 - BLOCK
      ?auto_116580 - BLOCK
      ?auto_116581 - BLOCK
      ?auto_116582 - BLOCK
      ?auto_116583 - BLOCK
      ?auto_116584 - BLOCK
    )
    :vars
    (
      ?auto_116586 - BLOCK
      ?auto_116585 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116579 ) ( not ( = ?auto_116579 ?auto_116580 ) ) ( not ( = ?auto_116579 ?auto_116581 ) ) ( not ( = ?auto_116579 ?auto_116582 ) ) ( not ( = ?auto_116579 ?auto_116583 ) ) ( not ( = ?auto_116579 ?auto_116584 ) ) ( not ( = ?auto_116579 ?auto_116586 ) ) ( not ( = ?auto_116580 ?auto_116581 ) ) ( not ( = ?auto_116580 ?auto_116582 ) ) ( not ( = ?auto_116580 ?auto_116583 ) ) ( not ( = ?auto_116580 ?auto_116584 ) ) ( not ( = ?auto_116580 ?auto_116586 ) ) ( not ( = ?auto_116581 ?auto_116582 ) ) ( not ( = ?auto_116581 ?auto_116583 ) ) ( not ( = ?auto_116581 ?auto_116584 ) ) ( not ( = ?auto_116581 ?auto_116586 ) ) ( not ( = ?auto_116582 ?auto_116583 ) ) ( not ( = ?auto_116582 ?auto_116584 ) ) ( not ( = ?auto_116582 ?auto_116586 ) ) ( not ( = ?auto_116583 ?auto_116584 ) ) ( not ( = ?auto_116583 ?auto_116586 ) ) ( not ( = ?auto_116584 ?auto_116586 ) ) ( ON ?auto_116586 ?auto_116585 ) ( not ( = ?auto_116579 ?auto_116585 ) ) ( not ( = ?auto_116580 ?auto_116585 ) ) ( not ( = ?auto_116581 ?auto_116585 ) ) ( not ( = ?auto_116582 ?auto_116585 ) ) ( not ( = ?auto_116583 ?auto_116585 ) ) ( not ( = ?auto_116584 ?auto_116585 ) ) ( not ( = ?auto_116586 ?auto_116585 ) ) ( ON ?auto_116584 ?auto_116586 ) ( ON-TABLE ?auto_116585 ) ( ON ?auto_116583 ?auto_116584 ) ( ON ?auto_116582 ?auto_116583 ) ( ON ?auto_116581 ?auto_116582 ) ( CLEAR ?auto_116581 ) ( HOLDING ?auto_116580 ) ( CLEAR ?auto_116579 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_116579 ?auto_116580 )
      ( MAKE-6PILE ?auto_116579 ?auto_116580 ?auto_116581 ?auto_116582 ?auto_116583 ?auto_116584 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116587 - BLOCK
      ?auto_116588 - BLOCK
      ?auto_116589 - BLOCK
      ?auto_116590 - BLOCK
      ?auto_116591 - BLOCK
      ?auto_116592 - BLOCK
    )
    :vars
    (
      ?auto_116594 - BLOCK
      ?auto_116593 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116587 ) ( not ( = ?auto_116587 ?auto_116588 ) ) ( not ( = ?auto_116587 ?auto_116589 ) ) ( not ( = ?auto_116587 ?auto_116590 ) ) ( not ( = ?auto_116587 ?auto_116591 ) ) ( not ( = ?auto_116587 ?auto_116592 ) ) ( not ( = ?auto_116587 ?auto_116594 ) ) ( not ( = ?auto_116588 ?auto_116589 ) ) ( not ( = ?auto_116588 ?auto_116590 ) ) ( not ( = ?auto_116588 ?auto_116591 ) ) ( not ( = ?auto_116588 ?auto_116592 ) ) ( not ( = ?auto_116588 ?auto_116594 ) ) ( not ( = ?auto_116589 ?auto_116590 ) ) ( not ( = ?auto_116589 ?auto_116591 ) ) ( not ( = ?auto_116589 ?auto_116592 ) ) ( not ( = ?auto_116589 ?auto_116594 ) ) ( not ( = ?auto_116590 ?auto_116591 ) ) ( not ( = ?auto_116590 ?auto_116592 ) ) ( not ( = ?auto_116590 ?auto_116594 ) ) ( not ( = ?auto_116591 ?auto_116592 ) ) ( not ( = ?auto_116591 ?auto_116594 ) ) ( not ( = ?auto_116592 ?auto_116594 ) ) ( ON ?auto_116594 ?auto_116593 ) ( not ( = ?auto_116587 ?auto_116593 ) ) ( not ( = ?auto_116588 ?auto_116593 ) ) ( not ( = ?auto_116589 ?auto_116593 ) ) ( not ( = ?auto_116590 ?auto_116593 ) ) ( not ( = ?auto_116591 ?auto_116593 ) ) ( not ( = ?auto_116592 ?auto_116593 ) ) ( not ( = ?auto_116594 ?auto_116593 ) ) ( ON ?auto_116592 ?auto_116594 ) ( ON-TABLE ?auto_116593 ) ( ON ?auto_116591 ?auto_116592 ) ( ON ?auto_116590 ?auto_116591 ) ( ON ?auto_116589 ?auto_116590 ) ( CLEAR ?auto_116587 ) ( ON ?auto_116588 ?auto_116589 ) ( CLEAR ?auto_116588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_116593 ?auto_116594 ?auto_116592 ?auto_116591 ?auto_116590 ?auto_116589 )
      ( MAKE-6PILE ?auto_116587 ?auto_116588 ?auto_116589 ?auto_116590 ?auto_116591 ?auto_116592 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116595 - BLOCK
      ?auto_116596 - BLOCK
      ?auto_116597 - BLOCK
      ?auto_116598 - BLOCK
      ?auto_116599 - BLOCK
      ?auto_116600 - BLOCK
    )
    :vars
    (
      ?auto_116601 - BLOCK
      ?auto_116602 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116595 ?auto_116596 ) ) ( not ( = ?auto_116595 ?auto_116597 ) ) ( not ( = ?auto_116595 ?auto_116598 ) ) ( not ( = ?auto_116595 ?auto_116599 ) ) ( not ( = ?auto_116595 ?auto_116600 ) ) ( not ( = ?auto_116595 ?auto_116601 ) ) ( not ( = ?auto_116596 ?auto_116597 ) ) ( not ( = ?auto_116596 ?auto_116598 ) ) ( not ( = ?auto_116596 ?auto_116599 ) ) ( not ( = ?auto_116596 ?auto_116600 ) ) ( not ( = ?auto_116596 ?auto_116601 ) ) ( not ( = ?auto_116597 ?auto_116598 ) ) ( not ( = ?auto_116597 ?auto_116599 ) ) ( not ( = ?auto_116597 ?auto_116600 ) ) ( not ( = ?auto_116597 ?auto_116601 ) ) ( not ( = ?auto_116598 ?auto_116599 ) ) ( not ( = ?auto_116598 ?auto_116600 ) ) ( not ( = ?auto_116598 ?auto_116601 ) ) ( not ( = ?auto_116599 ?auto_116600 ) ) ( not ( = ?auto_116599 ?auto_116601 ) ) ( not ( = ?auto_116600 ?auto_116601 ) ) ( ON ?auto_116601 ?auto_116602 ) ( not ( = ?auto_116595 ?auto_116602 ) ) ( not ( = ?auto_116596 ?auto_116602 ) ) ( not ( = ?auto_116597 ?auto_116602 ) ) ( not ( = ?auto_116598 ?auto_116602 ) ) ( not ( = ?auto_116599 ?auto_116602 ) ) ( not ( = ?auto_116600 ?auto_116602 ) ) ( not ( = ?auto_116601 ?auto_116602 ) ) ( ON ?auto_116600 ?auto_116601 ) ( ON-TABLE ?auto_116602 ) ( ON ?auto_116599 ?auto_116600 ) ( ON ?auto_116598 ?auto_116599 ) ( ON ?auto_116597 ?auto_116598 ) ( ON ?auto_116596 ?auto_116597 ) ( CLEAR ?auto_116596 ) ( HOLDING ?auto_116595 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_116595 )
      ( MAKE-6PILE ?auto_116595 ?auto_116596 ?auto_116597 ?auto_116598 ?auto_116599 ?auto_116600 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116603 - BLOCK
      ?auto_116604 - BLOCK
      ?auto_116605 - BLOCK
      ?auto_116606 - BLOCK
      ?auto_116607 - BLOCK
      ?auto_116608 - BLOCK
    )
    :vars
    (
      ?auto_116610 - BLOCK
      ?auto_116609 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116603 ?auto_116604 ) ) ( not ( = ?auto_116603 ?auto_116605 ) ) ( not ( = ?auto_116603 ?auto_116606 ) ) ( not ( = ?auto_116603 ?auto_116607 ) ) ( not ( = ?auto_116603 ?auto_116608 ) ) ( not ( = ?auto_116603 ?auto_116610 ) ) ( not ( = ?auto_116604 ?auto_116605 ) ) ( not ( = ?auto_116604 ?auto_116606 ) ) ( not ( = ?auto_116604 ?auto_116607 ) ) ( not ( = ?auto_116604 ?auto_116608 ) ) ( not ( = ?auto_116604 ?auto_116610 ) ) ( not ( = ?auto_116605 ?auto_116606 ) ) ( not ( = ?auto_116605 ?auto_116607 ) ) ( not ( = ?auto_116605 ?auto_116608 ) ) ( not ( = ?auto_116605 ?auto_116610 ) ) ( not ( = ?auto_116606 ?auto_116607 ) ) ( not ( = ?auto_116606 ?auto_116608 ) ) ( not ( = ?auto_116606 ?auto_116610 ) ) ( not ( = ?auto_116607 ?auto_116608 ) ) ( not ( = ?auto_116607 ?auto_116610 ) ) ( not ( = ?auto_116608 ?auto_116610 ) ) ( ON ?auto_116610 ?auto_116609 ) ( not ( = ?auto_116603 ?auto_116609 ) ) ( not ( = ?auto_116604 ?auto_116609 ) ) ( not ( = ?auto_116605 ?auto_116609 ) ) ( not ( = ?auto_116606 ?auto_116609 ) ) ( not ( = ?auto_116607 ?auto_116609 ) ) ( not ( = ?auto_116608 ?auto_116609 ) ) ( not ( = ?auto_116610 ?auto_116609 ) ) ( ON ?auto_116608 ?auto_116610 ) ( ON-TABLE ?auto_116609 ) ( ON ?auto_116607 ?auto_116608 ) ( ON ?auto_116606 ?auto_116607 ) ( ON ?auto_116605 ?auto_116606 ) ( ON ?auto_116604 ?auto_116605 ) ( ON ?auto_116603 ?auto_116604 ) ( CLEAR ?auto_116603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_116609 ?auto_116610 ?auto_116608 ?auto_116607 ?auto_116606 ?auto_116605 ?auto_116604 )
      ( MAKE-6PILE ?auto_116603 ?auto_116604 ?auto_116605 ?auto_116606 ?auto_116607 ?auto_116608 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_116612 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_116612 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_116612 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_116613 - BLOCK
    )
    :vars
    (
      ?auto_116614 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116613 ?auto_116614 ) ( CLEAR ?auto_116613 ) ( HAND-EMPTY ) ( not ( = ?auto_116613 ?auto_116614 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_116613 ?auto_116614 )
      ( MAKE-1PILE ?auto_116613 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_116615 - BLOCK
    )
    :vars
    (
      ?auto_116616 - BLOCK
      ?auto_116619 - BLOCK
      ?auto_116621 - BLOCK
      ?auto_116617 - BLOCK
      ?auto_116618 - BLOCK
      ?auto_116620 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116615 ?auto_116616 ) ) ( HOLDING ?auto_116615 ) ( CLEAR ?auto_116616 ) ( ON-TABLE ?auto_116619 ) ( ON ?auto_116621 ?auto_116619 ) ( ON ?auto_116617 ?auto_116621 ) ( ON ?auto_116618 ?auto_116617 ) ( ON ?auto_116620 ?auto_116618 ) ( ON ?auto_116616 ?auto_116620 ) ( not ( = ?auto_116619 ?auto_116621 ) ) ( not ( = ?auto_116619 ?auto_116617 ) ) ( not ( = ?auto_116619 ?auto_116618 ) ) ( not ( = ?auto_116619 ?auto_116620 ) ) ( not ( = ?auto_116619 ?auto_116616 ) ) ( not ( = ?auto_116619 ?auto_116615 ) ) ( not ( = ?auto_116621 ?auto_116617 ) ) ( not ( = ?auto_116621 ?auto_116618 ) ) ( not ( = ?auto_116621 ?auto_116620 ) ) ( not ( = ?auto_116621 ?auto_116616 ) ) ( not ( = ?auto_116621 ?auto_116615 ) ) ( not ( = ?auto_116617 ?auto_116618 ) ) ( not ( = ?auto_116617 ?auto_116620 ) ) ( not ( = ?auto_116617 ?auto_116616 ) ) ( not ( = ?auto_116617 ?auto_116615 ) ) ( not ( = ?auto_116618 ?auto_116620 ) ) ( not ( = ?auto_116618 ?auto_116616 ) ) ( not ( = ?auto_116618 ?auto_116615 ) ) ( not ( = ?auto_116620 ?auto_116616 ) ) ( not ( = ?auto_116620 ?auto_116615 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_116619 ?auto_116621 ?auto_116617 ?auto_116618 ?auto_116620 ?auto_116616 ?auto_116615 )
      ( MAKE-1PILE ?auto_116615 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_116622 - BLOCK
    )
    :vars
    (
      ?auto_116626 - BLOCK
      ?auto_116628 - BLOCK
      ?auto_116623 - BLOCK
      ?auto_116624 - BLOCK
      ?auto_116625 - BLOCK
      ?auto_116627 - BLOCK
      ?auto_116629 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116622 ?auto_116626 ) ) ( CLEAR ?auto_116626 ) ( ON-TABLE ?auto_116628 ) ( ON ?auto_116623 ?auto_116628 ) ( ON ?auto_116624 ?auto_116623 ) ( ON ?auto_116625 ?auto_116624 ) ( ON ?auto_116627 ?auto_116625 ) ( ON ?auto_116626 ?auto_116627 ) ( not ( = ?auto_116628 ?auto_116623 ) ) ( not ( = ?auto_116628 ?auto_116624 ) ) ( not ( = ?auto_116628 ?auto_116625 ) ) ( not ( = ?auto_116628 ?auto_116627 ) ) ( not ( = ?auto_116628 ?auto_116626 ) ) ( not ( = ?auto_116628 ?auto_116622 ) ) ( not ( = ?auto_116623 ?auto_116624 ) ) ( not ( = ?auto_116623 ?auto_116625 ) ) ( not ( = ?auto_116623 ?auto_116627 ) ) ( not ( = ?auto_116623 ?auto_116626 ) ) ( not ( = ?auto_116623 ?auto_116622 ) ) ( not ( = ?auto_116624 ?auto_116625 ) ) ( not ( = ?auto_116624 ?auto_116627 ) ) ( not ( = ?auto_116624 ?auto_116626 ) ) ( not ( = ?auto_116624 ?auto_116622 ) ) ( not ( = ?auto_116625 ?auto_116627 ) ) ( not ( = ?auto_116625 ?auto_116626 ) ) ( not ( = ?auto_116625 ?auto_116622 ) ) ( not ( = ?auto_116627 ?auto_116626 ) ) ( not ( = ?auto_116627 ?auto_116622 ) ) ( ON ?auto_116622 ?auto_116629 ) ( CLEAR ?auto_116622 ) ( HAND-EMPTY ) ( not ( = ?auto_116622 ?auto_116629 ) ) ( not ( = ?auto_116626 ?auto_116629 ) ) ( not ( = ?auto_116628 ?auto_116629 ) ) ( not ( = ?auto_116623 ?auto_116629 ) ) ( not ( = ?auto_116624 ?auto_116629 ) ) ( not ( = ?auto_116625 ?auto_116629 ) ) ( not ( = ?auto_116627 ?auto_116629 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_116622 ?auto_116629 )
      ( MAKE-1PILE ?auto_116622 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_116630 - BLOCK
    )
    :vars
    (
      ?auto_116635 - BLOCK
      ?auto_116631 - BLOCK
      ?auto_116637 - BLOCK
      ?auto_116634 - BLOCK
      ?auto_116633 - BLOCK
      ?auto_116632 - BLOCK
      ?auto_116636 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116630 ?auto_116635 ) ) ( ON-TABLE ?auto_116631 ) ( ON ?auto_116637 ?auto_116631 ) ( ON ?auto_116634 ?auto_116637 ) ( ON ?auto_116633 ?auto_116634 ) ( ON ?auto_116632 ?auto_116633 ) ( not ( = ?auto_116631 ?auto_116637 ) ) ( not ( = ?auto_116631 ?auto_116634 ) ) ( not ( = ?auto_116631 ?auto_116633 ) ) ( not ( = ?auto_116631 ?auto_116632 ) ) ( not ( = ?auto_116631 ?auto_116635 ) ) ( not ( = ?auto_116631 ?auto_116630 ) ) ( not ( = ?auto_116637 ?auto_116634 ) ) ( not ( = ?auto_116637 ?auto_116633 ) ) ( not ( = ?auto_116637 ?auto_116632 ) ) ( not ( = ?auto_116637 ?auto_116635 ) ) ( not ( = ?auto_116637 ?auto_116630 ) ) ( not ( = ?auto_116634 ?auto_116633 ) ) ( not ( = ?auto_116634 ?auto_116632 ) ) ( not ( = ?auto_116634 ?auto_116635 ) ) ( not ( = ?auto_116634 ?auto_116630 ) ) ( not ( = ?auto_116633 ?auto_116632 ) ) ( not ( = ?auto_116633 ?auto_116635 ) ) ( not ( = ?auto_116633 ?auto_116630 ) ) ( not ( = ?auto_116632 ?auto_116635 ) ) ( not ( = ?auto_116632 ?auto_116630 ) ) ( ON ?auto_116630 ?auto_116636 ) ( CLEAR ?auto_116630 ) ( not ( = ?auto_116630 ?auto_116636 ) ) ( not ( = ?auto_116635 ?auto_116636 ) ) ( not ( = ?auto_116631 ?auto_116636 ) ) ( not ( = ?auto_116637 ?auto_116636 ) ) ( not ( = ?auto_116634 ?auto_116636 ) ) ( not ( = ?auto_116633 ?auto_116636 ) ) ( not ( = ?auto_116632 ?auto_116636 ) ) ( HOLDING ?auto_116635 ) ( CLEAR ?auto_116632 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_116631 ?auto_116637 ?auto_116634 ?auto_116633 ?auto_116632 ?auto_116635 )
      ( MAKE-1PILE ?auto_116630 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_116638 - BLOCK
    )
    :vars
    (
      ?auto_116645 - BLOCK
      ?auto_116640 - BLOCK
      ?auto_116644 - BLOCK
      ?auto_116639 - BLOCK
      ?auto_116641 - BLOCK
      ?auto_116642 - BLOCK
      ?auto_116643 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116638 ?auto_116645 ) ) ( ON-TABLE ?auto_116640 ) ( ON ?auto_116644 ?auto_116640 ) ( ON ?auto_116639 ?auto_116644 ) ( ON ?auto_116641 ?auto_116639 ) ( ON ?auto_116642 ?auto_116641 ) ( not ( = ?auto_116640 ?auto_116644 ) ) ( not ( = ?auto_116640 ?auto_116639 ) ) ( not ( = ?auto_116640 ?auto_116641 ) ) ( not ( = ?auto_116640 ?auto_116642 ) ) ( not ( = ?auto_116640 ?auto_116645 ) ) ( not ( = ?auto_116640 ?auto_116638 ) ) ( not ( = ?auto_116644 ?auto_116639 ) ) ( not ( = ?auto_116644 ?auto_116641 ) ) ( not ( = ?auto_116644 ?auto_116642 ) ) ( not ( = ?auto_116644 ?auto_116645 ) ) ( not ( = ?auto_116644 ?auto_116638 ) ) ( not ( = ?auto_116639 ?auto_116641 ) ) ( not ( = ?auto_116639 ?auto_116642 ) ) ( not ( = ?auto_116639 ?auto_116645 ) ) ( not ( = ?auto_116639 ?auto_116638 ) ) ( not ( = ?auto_116641 ?auto_116642 ) ) ( not ( = ?auto_116641 ?auto_116645 ) ) ( not ( = ?auto_116641 ?auto_116638 ) ) ( not ( = ?auto_116642 ?auto_116645 ) ) ( not ( = ?auto_116642 ?auto_116638 ) ) ( ON ?auto_116638 ?auto_116643 ) ( not ( = ?auto_116638 ?auto_116643 ) ) ( not ( = ?auto_116645 ?auto_116643 ) ) ( not ( = ?auto_116640 ?auto_116643 ) ) ( not ( = ?auto_116644 ?auto_116643 ) ) ( not ( = ?auto_116639 ?auto_116643 ) ) ( not ( = ?auto_116641 ?auto_116643 ) ) ( not ( = ?auto_116642 ?auto_116643 ) ) ( CLEAR ?auto_116642 ) ( ON ?auto_116645 ?auto_116638 ) ( CLEAR ?auto_116645 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_116643 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_116643 ?auto_116638 )
      ( MAKE-1PILE ?auto_116638 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_116646 - BLOCK
    )
    :vars
    (
      ?auto_116647 - BLOCK
      ?auto_116649 - BLOCK
      ?auto_116650 - BLOCK
      ?auto_116652 - BLOCK
      ?auto_116651 - BLOCK
      ?auto_116648 - BLOCK
      ?auto_116653 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116646 ?auto_116647 ) ) ( ON-TABLE ?auto_116649 ) ( ON ?auto_116650 ?auto_116649 ) ( ON ?auto_116652 ?auto_116650 ) ( ON ?auto_116651 ?auto_116652 ) ( not ( = ?auto_116649 ?auto_116650 ) ) ( not ( = ?auto_116649 ?auto_116652 ) ) ( not ( = ?auto_116649 ?auto_116651 ) ) ( not ( = ?auto_116649 ?auto_116648 ) ) ( not ( = ?auto_116649 ?auto_116647 ) ) ( not ( = ?auto_116649 ?auto_116646 ) ) ( not ( = ?auto_116650 ?auto_116652 ) ) ( not ( = ?auto_116650 ?auto_116651 ) ) ( not ( = ?auto_116650 ?auto_116648 ) ) ( not ( = ?auto_116650 ?auto_116647 ) ) ( not ( = ?auto_116650 ?auto_116646 ) ) ( not ( = ?auto_116652 ?auto_116651 ) ) ( not ( = ?auto_116652 ?auto_116648 ) ) ( not ( = ?auto_116652 ?auto_116647 ) ) ( not ( = ?auto_116652 ?auto_116646 ) ) ( not ( = ?auto_116651 ?auto_116648 ) ) ( not ( = ?auto_116651 ?auto_116647 ) ) ( not ( = ?auto_116651 ?auto_116646 ) ) ( not ( = ?auto_116648 ?auto_116647 ) ) ( not ( = ?auto_116648 ?auto_116646 ) ) ( ON ?auto_116646 ?auto_116653 ) ( not ( = ?auto_116646 ?auto_116653 ) ) ( not ( = ?auto_116647 ?auto_116653 ) ) ( not ( = ?auto_116649 ?auto_116653 ) ) ( not ( = ?auto_116650 ?auto_116653 ) ) ( not ( = ?auto_116652 ?auto_116653 ) ) ( not ( = ?auto_116651 ?auto_116653 ) ) ( not ( = ?auto_116648 ?auto_116653 ) ) ( ON ?auto_116647 ?auto_116646 ) ( CLEAR ?auto_116647 ) ( ON-TABLE ?auto_116653 ) ( HOLDING ?auto_116648 ) ( CLEAR ?auto_116651 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_116649 ?auto_116650 ?auto_116652 ?auto_116651 ?auto_116648 )
      ( MAKE-1PILE ?auto_116646 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_116654 - BLOCK
    )
    :vars
    (
      ?auto_116660 - BLOCK
      ?auto_116657 - BLOCK
      ?auto_116655 - BLOCK
      ?auto_116661 - BLOCK
      ?auto_116656 - BLOCK
      ?auto_116659 - BLOCK
      ?auto_116658 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116654 ?auto_116660 ) ) ( ON-TABLE ?auto_116657 ) ( ON ?auto_116655 ?auto_116657 ) ( ON ?auto_116661 ?auto_116655 ) ( ON ?auto_116656 ?auto_116661 ) ( not ( = ?auto_116657 ?auto_116655 ) ) ( not ( = ?auto_116657 ?auto_116661 ) ) ( not ( = ?auto_116657 ?auto_116656 ) ) ( not ( = ?auto_116657 ?auto_116659 ) ) ( not ( = ?auto_116657 ?auto_116660 ) ) ( not ( = ?auto_116657 ?auto_116654 ) ) ( not ( = ?auto_116655 ?auto_116661 ) ) ( not ( = ?auto_116655 ?auto_116656 ) ) ( not ( = ?auto_116655 ?auto_116659 ) ) ( not ( = ?auto_116655 ?auto_116660 ) ) ( not ( = ?auto_116655 ?auto_116654 ) ) ( not ( = ?auto_116661 ?auto_116656 ) ) ( not ( = ?auto_116661 ?auto_116659 ) ) ( not ( = ?auto_116661 ?auto_116660 ) ) ( not ( = ?auto_116661 ?auto_116654 ) ) ( not ( = ?auto_116656 ?auto_116659 ) ) ( not ( = ?auto_116656 ?auto_116660 ) ) ( not ( = ?auto_116656 ?auto_116654 ) ) ( not ( = ?auto_116659 ?auto_116660 ) ) ( not ( = ?auto_116659 ?auto_116654 ) ) ( ON ?auto_116654 ?auto_116658 ) ( not ( = ?auto_116654 ?auto_116658 ) ) ( not ( = ?auto_116660 ?auto_116658 ) ) ( not ( = ?auto_116657 ?auto_116658 ) ) ( not ( = ?auto_116655 ?auto_116658 ) ) ( not ( = ?auto_116661 ?auto_116658 ) ) ( not ( = ?auto_116656 ?auto_116658 ) ) ( not ( = ?auto_116659 ?auto_116658 ) ) ( ON ?auto_116660 ?auto_116654 ) ( ON-TABLE ?auto_116658 ) ( CLEAR ?auto_116656 ) ( ON ?auto_116659 ?auto_116660 ) ( CLEAR ?auto_116659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_116658 ?auto_116654 ?auto_116660 )
      ( MAKE-1PILE ?auto_116654 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_116662 - BLOCK
    )
    :vars
    (
      ?auto_116668 - BLOCK
      ?auto_116667 - BLOCK
      ?auto_116664 - BLOCK
      ?auto_116665 - BLOCK
      ?auto_116669 - BLOCK
      ?auto_116666 - BLOCK
      ?auto_116663 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116662 ?auto_116668 ) ) ( ON-TABLE ?auto_116667 ) ( ON ?auto_116664 ?auto_116667 ) ( ON ?auto_116665 ?auto_116664 ) ( not ( = ?auto_116667 ?auto_116664 ) ) ( not ( = ?auto_116667 ?auto_116665 ) ) ( not ( = ?auto_116667 ?auto_116669 ) ) ( not ( = ?auto_116667 ?auto_116666 ) ) ( not ( = ?auto_116667 ?auto_116668 ) ) ( not ( = ?auto_116667 ?auto_116662 ) ) ( not ( = ?auto_116664 ?auto_116665 ) ) ( not ( = ?auto_116664 ?auto_116669 ) ) ( not ( = ?auto_116664 ?auto_116666 ) ) ( not ( = ?auto_116664 ?auto_116668 ) ) ( not ( = ?auto_116664 ?auto_116662 ) ) ( not ( = ?auto_116665 ?auto_116669 ) ) ( not ( = ?auto_116665 ?auto_116666 ) ) ( not ( = ?auto_116665 ?auto_116668 ) ) ( not ( = ?auto_116665 ?auto_116662 ) ) ( not ( = ?auto_116669 ?auto_116666 ) ) ( not ( = ?auto_116669 ?auto_116668 ) ) ( not ( = ?auto_116669 ?auto_116662 ) ) ( not ( = ?auto_116666 ?auto_116668 ) ) ( not ( = ?auto_116666 ?auto_116662 ) ) ( ON ?auto_116662 ?auto_116663 ) ( not ( = ?auto_116662 ?auto_116663 ) ) ( not ( = ?auto_116668 ?auto_116663 ) ) ( not ( = ?auto_116667 ?auto_116663 ) ) ( not ( = ?auto_116664 ?auto_116663 ) ) ( not ( = ?auto_116665 ?auto_116663 ) ) ( not ( = ?auto_116669 ?auto_116663 ) ) ( not ( = ?auto_116666 ?auto_116663 ) ) ( ON ?auto_116668 ?auto_116662 ) ( ON-TABLE ?auto_116663 ) ( ON ?auto_116666 ?auto_116668 ) ( CLEAR ?auto_116666 ) ( HOLDING ?auto_116669 ) ( CLEAR ?auto_116665 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_116667 ?auto_116664 ?auto_116665 ?auto_116669 )
      ( MAKE-1PILE ?auto_116662 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_116670 - BLOCK
    )
    :vars
    (
      ?auto_116676 - BLOCK
      ?auto_116673 - BLOCK
      ?auto_116677 - BLOCK
      ?auto_116671 - BLOCK
      ?auto_116675 - BLOCK
      ?auto_116672 - BLOCK
      ?auto_116674 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116670 ?auto_116676 ) ) ( ON-TABLE ?auto_116673 ) ( ON ?auto_116677 ?auto_116673 ) ( ON ?auto_116671 ?auto_116677 ) ( not ( = ?auto_116673 ?auto_116677 ) ) ( not ( = ?auto_116673 ?auto_116671 ) ) ( not ( = ?auto_116673 ?auto_116675 ) ) ( not ( = ?auto_116673 ?auto_116672 ) ) ( not ( = ?auto_116673 ?auto_116676 ) ) ( not ( = ?auto_116673 ?auto_116670 ) ) ( not ( = ?auto_116677 ?auto_116671 ) ) ( not ( = ?auto_116677 ?auto_116675 ) ) ( not ( = ?auto_116677 ?auto_116672 ) ) ( not ( = ?auto_116677 ?auto_116676 ) ) ( not ( = ?auto_116677 ?auto_116670 ) ) ( not ( = ?auto_116671 ?auto_116675 ) ) ( not ( = ?auto_116671 ?auto_116672 ) ) ( not ( = ?auto_116671 ?auto_116676 ) ) ( not ( = ?auto_116671 ?auto_116670 ) ) ( not ( = ?auto_116675 ?auto_116672 ) ) ( not ( = ?auto_116675 ?auto_116676 ) ) ( not ( = ?auto_116675 ?auto_116670 ) ) ( not ( = ?auto_116672 ?auto_116676 ) ) ( not ( = ?auto_116672 ?auto_116670 ) ) ( ON ?auto_116670 ?auto_116674 ) ( not ( = ?auto_116670 ?auto_116674 ) ) ( not ( = ?auto_116676 ?auto_116674 ) ) ( not ( = ?auto_116673 ?auto_116674 ) ) ( not ( = ?auto_116677 ?auto_116674 ) ) ( not ( = ?auto_116671 ?auto_116674 ) ) ( not ( = ?auto_116675 ?auto_116674 ) ) ( not ( = ?auto_116672 ?auto_116674 ) ) ( ON ?auto_116676 ?auto_116670 ) ( ON-TABLE ?auto_116674 ) ( ON ?auto_116672 ?auto_116676 ) ( CLEAR ?auto_116671 ) ( ON ?auto_116675 ?auto_116672 ) ( CLEAR ?auto_116675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_116674 ?auto_116670 ?auto_116676 ?auto_116672 )
      ( MAKE-1PILE ?auto_116670 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_116678 - BLOCK
    )
    :vars
    (
      ?auto_116680 - BLOCK
      ?auto_116683 - BLOCK
      ?auto_116682 - BLOCK
      ?auto_116684 - BLOCK
      ?auto_116685 - BLOCK
      ?auto_116679 - BLOCK
      ?auto_116681 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116678 ?auto_116680 ) ) ( ON-TABLE ?auto_116683 ) ( ON ?auto_116682 ?auto_116683 ) ( not ( = ?auto_116683 ?auto_116682 ) ) ( not ( = ?auto_116683 ?auto_116684 ) ) ( not ( = ?auto_116683 ?auto_116685 ) ) ( not ( = ?auto_116683 ?auto_116679 ) ) ( not ( = ?auto_116683 ?auto_116680 ) ) ( not ( = ?auto_116683 ?auto_116678 ) ) ( not ( = ?auto_116682 ?auto_116684 ) ) ( not ( = ?auto_116682 ?auto_116685 ) ) ( not ( = ?auto_116682 ?auto_116679 ) ) ( not ( = ?auto_116682 ?auto_116680 ) ) ( not ( = ?auto_116682 ?auto_116678 ) ) ( not ( = ?auto_116684 ?auto_116685 ) ) ( not ( = ?auto_116684 ?auto_116679 ) ) ( not ( = ?auto_116684 ?auto_116680 ) ) ( not ( = ?auto_116684 ?auto_116678 ) ) ( not ( = ?auto_116685 ?auto_116679 ) ) ( not ( = ?auto_116685 ?auto_116680 ) ) ( not ( = ?auto_116685 ?auto_116678 ) ) ( not ( = ?auto_116679 ?auto_116680 ) ) ( not ( = ?auto_116679 ?auto_116678 ) ) ( ON ?auto_116678 ?auto_116681 ) ( not ( = ?auto_116678 ?auto_116681 ) ) ( not ( = ?auto_116680 ?auto_116681 ) ) ( not ( = ?auto_116683 ?auto_116681 ) ) ( not ( = ?auto_116682 ?auto_116681 ) ) ( not ( = ?auto_116684 ?auto_116681 ) ) ( not ( = ?auto_116685 ?auto_116681 ) ) ( not ( = ?auto_116679 ?auto_116681 ) ) ( ON ?auto_116680 ?auto_116678 ) ( ON-TABLE ?auto_116681 ) ( ON ?auto_116679 ?auto_116680 ) ( ON ?auto_116685 ?auto_116679 ) ( CLEAR ?auto_116685 ) ( HOLDING ?auto_116684 ) ( CLEAR ?auto_116682 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_116683 ?auto_116682 ?auto_116684 )
      ( MAKE-1PILE ?auto_116678 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_116686 - BLOCK
    )
    :vars
    (
      ?auto_116687 - BLOCK
      ?auto_116693 - BLOCK
      ?auto_116692 - BLOCK
      ?auto_116689 - BLOCK
      ?auto_116690 - BLOCK
      ?auto_116688 - BLOCK
      ?auto_116691 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116686 ?auto_116687 ) ) ( ON-TABLE ?auto_116693 ) ( ON ?auto_116692 ?auto_116693 ) ( not ( = ?auto_116693 ?auto_116692 ) ) ( not ( = ?auto_116693 ?auto_116689 ) ) ( not ( = ?auto_116693 ?auto_116690 ) ) ( not ( = ?auto_116693 ?auto_116688 ) ) ( not ( = ?auto_116693 ?auto_116687 ) ) ( not ( = ?auto_116693 ?auto_116686 ) ) ( not ( = ?auto_116692 ?auto_116689 ) ) ( not ( = ?auto_116692 ?auto_116690 ) ) ( not ( = ?auto_116692 ?auto_116688 ) ) ( not ( = ?auto_116692 ?auto_116687 ) ) ( not ( = ?auto_116692 ?auto_116686 ) ) ( not ( = ?auto_116689 ?auto_116690 ) ) ( not ( = ?auto_116689 ?auto_116688 ) ) ( not ( = ?auto_116689 ?auto_116687 ) ) ( not ( = ?auto_116689 ?auto_116686 ) ) ( not ( = ?auto_116690 ?auto_116688 ) ) ( not ( = ?auto_116690 ?auto_116687 ) ) ( not ( = ?auto_116690 ?auto_116686 ) ) ( not ( = ?auto_116688 ?auto_116687 ) ) ( not ( = ?auto_116688 ?auto_116686 ) ) ( ON ?auto_116686 ?auto_116691 ) ( not ( = ?auto_116686 ?auto_116691 ) ) ( not ( = ?auto_116687 ?auto_116691 ) ) ( not ( = ?auto_116693 ?auto_116691 ) ) ( not ( = ?auto_116692 ?auto_116691 ) ) ( not ( = ?auto_116689 ?auto_116691 ) ) ( not ( = ?auto_116690 ?auto_116691 ) ) ( not ( = ?auto_116688 ?auto_116691 ) ) ( ON ?auto_116687 ?auto_116686 ) ( ON-TABLE ?auto_116691 ) ( ON ?auto_116688 ?auto_116687 ) ( ON ?auto_116690 ?auto_116688 ) ( CLEAR ?auto_116692 ) ( ON ?auto_116689 ?auto_116690 ) ( CLEAR ?auto_116689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_116691 ?auto_116686 ?auto_116687 ?auto_116688 ?auto_116690 )
      ( MAKE-1PILE ?auto_116686 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_116694 - BLOCK
    )
    :vars
    (
      ?auto_116696 - BLOCK
      ?auto_116700 - BLOCK
      ?auto_116697 - BLOCK
      ?auto_116699 - BLOCK
      ?auto_116698 - BLOCK
      ?auto_116701 - BLOCK
      ?auto_116695 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116694 ?auto_116696 ) ) ( ON-TABLE ?auto_116700 ) ( not ( = ?auto_116700 ?auto_116697 ) ) ( not ( = ?auto_116700 ?auto_116699 ) ) ( not ( = ?auto_116700 ?auto_116698 ) ) ( not ( = ?auto_116700 ?auto_116701 ) ) ( not ( = ?auto_116700 ?auto_116696 ) ) ( not ( = ?auto_116700 ?auto_116694 ) ) ( not ( = ?auto_116697 ?auto_116699 ) ) ( not ( = ?auto_116697 ?auto_116698 ) ) ( not ( = ?auto_116697 ?auto_116701 ) ) ( not ( = ?auto_116697 ?auto_116696 ) ) ( not ( = ?auto_116697 ?auto_116694 ) ) ( not ( = ?auto_116699 ?auto_116698 ) ) ( not ( = ?auto_116699 ?auto_116701 ) ) ( not ( = ?auto_116699 ?auto_116696 ) ) ( not ( = ?auto_116699 ?auto_116694 ) ) ( not ( = ?auto_116698 ?auto_116701 ) ) ( not ( = ?auto_116698 ?auto_116696 ) ) ( not ( = ?auto_116698 ?auto_116694 ) ) ( not ( = ?auto_116701 ?auto_116696 ) ) ( not ( = ?auto_116701 ?auto_116694 ) ) ( ON ?auto_116694 ?auto_116695 ) ( not ( = ?auto_116694 ?auto_116695 ) ) ( not ( = ?auto_116696 ?auto_116695 ) ) ( not ( = ?auto_116700 ?auto_116695 ) ) ( not ( = ?auto_116697 ?auto_116695 ) ) ( not ( = ?auto_116699 ?auto_116695 ) ) ( not ( = ?auto_116698 ?auto_116695 ) ) ( not ( = ?auto_116701 ?auto_116695 ) ) ( ON ?auto_116696 ?auto_116694 ) ( ON-TABLE ?auto_116695 ) ( ON ?auto_116701 ?auto_116696 ) ( ON ?auto_116698 ?auto_116701 ) ( ON ?auto_116699 ?auto_116698 ) ( CLEAR ?auto_116699 ) ( HOLDING ?auto_116697 ) ( CLEAR ?auto_116700 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_116700 ?auto_116697 )
      ( MAKE-1PILE ?auto_116694 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_116702 - BLOCK
    )
    :vars
    (
      ?auto_116703 - BLOCK
      ?auto_116704 - BLOCK
      ?auto_116706 - BLOCK
      ?auto_116708 - BLOCK
      ?auto_116707 - BLOCK
      ?auto_116705 - BLOCK
      ?auto_116709 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116702 ?auto_116703 ) ) ( ON-TABLE ?auto_116704 ) ( not ( = ?auto_116704 ?auto_116706 ) ) ( not ( = ?auto_116704 ?auto_116708 ) ) ( not ( = ?auto_116704 ?auto_116707 ) ) ( not ( = ?auto_116704 ?auto_116705 ) ) ( not ( = ?auto_116704 ?auto_116703 ) ) ( not ( = ?auto_116704 ?auto_116702 ) ) ( not ( = ?auto_116706 ?auto_116708 ) ) ( not ( = ?auto_116706 ?auto_116707 ) ) ( not ( = ?auto_116706 ?auto_116705 ) ) ( not ( = ?auto_116706 ?auto_116703 ) ) ( not ( = ?auto_116706 ?auto_116702 ) ) ( not ( = ?auto_116708 ?auto_116707 ) ) ( not ( = ?auto_116708 ?auto_116705 ) ) ( not ( = ?auto_116708 ?auto_116703 ) ) ( not ( = ?auto_116708 ?auto_116702 ) ) ( not ( = ?auto_116707 ?auto_116705 ) ) ( not ( = ?auto_116707 ?auto_116703 ) ) ( not ( = ?auto_116707 ?auto_116702 ) ) ( not ( = ?auto_116705 ?auto_116703 ) ) ( not ( = ?auto_116705 ?auto_116702 ) ) ( ON ?auto_116702 ?auto_116709 ) ( not ( = ?auto_116702 ?auto_116709 ) ) ( not ( = ?auto_116703 ?auto_116709 ) ) ( not ( = ?auto_116704 ?auto_116709 ) ) ( not ( = ?auto_116706 ?auto_116709 ) ) ( not ( = ?auto_116708 ?auto_116709 ) ) ( not ( = ?auto_116707 ?auto_116709 ) ) ( not ( = ?auto_116705 ?auto_116709 ) ) ( ON ?auto_116703 ?auto_116702 ) ( ON-TABLE ?auto_116709 ) ( ON ?auto_116705 ?auto_116703 ) ( ON ?auto_116707 ?auto_116705 ) ( ON ?auto_116708 ?auto_116707 ) ( CLEAR ?auto_116704 ) ( ON ?auto_116706 ?auto_116708 ) ( CLEAR ?auto_116706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_116709 ?auto_116702 ?auto_116703 ?auto_116705 ?auto_116707 ?auto_116708 )
      ( MAKE-1PILE ?auto_116702 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_116710 - BLOCK
    )
    :vars
    (
      ?auto_116715 - BLOCK
      ?auto_116714 - BLOCK
      ?auto_116716 - BLOCK
      ?auto_116713 - BLOCK
      ?auto_116711 - BLOCK
      ?auto_116717 - BLOCK
      ?auto_116712 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116710 ?auto_116715 ) ) ( not ( = ?auto_116714 ?auto_116716 ) ) ( not ( = ?auto_116714 ?auto_116713 ) ) ( not ( = ?auto_116714 ?auto_116711 ) ) ( not ( = ?auto_116714 ?auto_116717 ) ) ( not ( = ?auto_116714 ?auto_116715 ) ) ( not ( = ?auto_116714 ?auto_116710 ) ) ( not ( = ?auto_116716 ?auto_116713 ) ) ( not ( = ?auto_116716 ?auto_116711 ) ) ( not ( = ?auto_116716 ?auto_116717 ) ) ( not ( = ?auto_116716 ?auto_116715 ) ) ( not ( = ?auto_116716 ?auto_116710 ) ) ( not ( = ?auto_116713 ?auto_116711 ) ) ( not ( = ?auto_116713 ?auto_116717 ) ) ( not ( = ?auto_116713 ?auto_116715 ) ) ( not ( = ?auto_116713 ?auto_116710 ) ) ( not ( = ?auto_116711 ?auto_116717 ) ) ( not ( = ?auto_116711 ?auto_116715 ) ) ( not ( = ?auto_116711 ?auto_116710 ) ) ( not ( = ?auto_116717 ?auto_116715 ) ) ( not ( = ?auto_116717 ?auto_116710 ) ) ( ON ?auto_116710 ?auto_116712 ) ( not ( = ?auto_116710 ?auto_116712 ) ) ( not ( = ?auto_116715 ?auto_116712 ) ) ( not ( = ?auto_116714 ?auto_116712 ) ) ( not ( = ?auto_116716 ?auto_116712 ) ) ( not ( = ?auto_116713 ?auto_116712 ) ) ( not ( = ?auto_116711 ?auto_116712 ) ) ( not ( = ?auto_116717 ?auto_116712 ) ) ( ON ?auto_116715 ?auto_116710 ) ( ON-TABLE ?auto_116712 ) ( ON ?auto_116717 ?auto_116715 ) ( ON ?auto_116711 ?auto_116717 ) ( ON ?auto_116713 ?auto_116711 ) ( ON ?auto_116716 ?auto_116713 ) ( CLEAR ?auto_116716 ) ( HOLDING ?auto_116714 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_116714 )
      ( MAKE-1PILE ?auto_116710 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_116718 - BLOCK
    )
    :vars
    (
      ?auto_116720 - BLOCK
      ?auto_116725 - BLOCK
      ?auto_116719 - BLOCK
      ?auto_116723 - BLOCK
      ?auto_116722 - BLOCK
      ?auto_116724 - BLOCK
      ?auto_116721 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116718 ?auto_116720 ) ) ( not ( = ?auto_116725 ?auto_116719 ) ) ( not ( = ?auto_116725 ?auto_116723 ) ) ( not ( = ?auto_116725 ?auto_116722 ) ) ( not ( = ?auto_116725 ?auto_116724 ) ) ( not ( = ?auto_116725 ?auto_116720 ) ) ( not ( = ?auto_116725 ?auto_116718 ) ) ( not ( = ?auto_116719 ?auto_116723 ) ) ( not ( = ?auto_116719 ?auto_116722 ) ) ( not ( = ?auto_116719 ?auto_116724 ) ) ( not ( = ?auto_116719 ?auto_116720 ) ) ( not ( = ?auto_116719 ?auto_116718 ) ) ( not ( = ?auto_116723 ?auto_116722 ) ) ( not ( = ?auto_116723 ?auto_116724 ) ) ( not ( = ?auto_116723 ?auto_116720 ) ) ( not ( = ?auto_116723 ?auto_116718 ) ) ( not ( = ?auto_116722 ?auto_116724 ) ) ( not ( = ?auto_116722 ?auto_116720 ) ) ( not ( = ?auto_116722 ?auto_116718 ) ) ( not ( = ?auto_116724 ?auto_116720 ) ) ( not ( = ?auto_116724 ?auto_116718 ) ) ( ON ?auto_116718 ?auto_116721 ) ( not ( = ?auto_116718 ?auto_116721 ) ) ( not ( = ?auto_116720 ?auto_116721 ) ) ( not ( = ?auto_116725 ?auto_116721 ) ) ( not ( = ?auto_116719 ?auto_116721 ) ) ( not ( = ?auto_116723 ?auto_116721 ) ) ( not ( = ?auto_116722 ?auto_116721 ) ) ( not ( = ?auto_116724 ?auto_116721 ) ) ( ON ?auto_116720 ?auto_116718 ) ( ON-TABLE ?auto_116721 ) ( ON ?auto_116724 ?auto_116720 ) ( ON ?auto_116722 ?auto_116724 ) ( ON ?auto_116723 ?auto_116722 ) ( ON ?auto_116719 ?auto_116723 ) ( ON ?auto_116725 ?auto_116719 ) ( CLEAR ?auto_116725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_116721 ?auto_116718 ?auto_116720 ?auto_116724 ?auto_116722 ?auto_116723 ?auto_116719 )
      ( MAKE-1PILE ?auto_116718 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116731 - BLOCK
      ?auto_116732 - BLOCK
      ?auto_116733 - BLOCK
      ?auto_116734 - BLOCK
      ?auto_116735 - BLOCK
    )
    :vars
    (
      ?auto_116736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116736 ?auto_116735 ) ( CLEAR ?auto_116736 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_116731 ) ( ON ?auto_116732 ?auto_116731 ) ( ON ?auto_116733 ?auto_116732 ) ( ON ?auto_116734 ?auto_116733 ) ( ON ?auto_116735 ?auto_116734 ) ( not ( = ?auto_116731 ?auto_116732 ) ) ( not ( = ?auto_116731 ?auto_116733 ) ) ( not ( = ?auto_116731 ?auto_116734 ) ) ( not ( = ?auto_116731 ?auto_116735 ) ) ( not ( = ?auto_116731 ?auto_116736 ) ) ( not ( = ?auto_116732 ?auto_116733 ) ) ( not ( = ?auto_116732 ?auto_116734 ) ) ( not ( = ?auto_116732 ?auto_116735 ) ) ( not ( = ?auto_116732 ?auto_116736 ) ) ( not ( = ?auto_116733 ?auto_116734 ) ) ( not ( = ?auto_116733 ?auto_116735 ) ) ( not ( = ?auto_116733 ?auto_116736 ) ) ( not ( = ?auto_116734 ?auto_116735 ) ) ( not ( = ?auto_116734 ?auto_116736 ) ) ( not ( = ?auto_116735 ?auto_116736 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_116736 ?auto_116735 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116737 - BLOCK
      ?auto_116738 - BLOCK
      ?auto_116739 - BLOCK
      ?auto_116740 - BLOCK
      ?auto_116741 - BLOCK
    )
    :vars
    (
      ?auto_116742 - BLOCK
      ?auto_116743 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116742 ?auto_116741 ) ( CLEAR ?auto_116742 ) ( ON-TABLE ?auto_116737 ) ( ON ?auto_116738 ?auto_116737 ) ( ON ?auto_116739 ?auto_116738 ) ( ON ?auto_116740 ?auto_116739 ) ( ON ?auto_116741 ?auto_116740 ) ( not ( = ?auto_116737 ?auto_116738 ) ) ( not ( = ?auto_116737 ?auto_116739 ) ) ( not ( = ?auto_116737 ?auto_116740 ) ) ( not ( = ?auto_116737 ?auto_116741 ) ) ( not ( = ?auto_116737 ?auto_116742 ) ) ( not ( = ?auto_116738 ?auto_116739 ) ) ( not ( = ?auto_116738 ?auto_116740 ) ) ( not ( = ?auto_116738 ?auto_116741 ) ) ( not ( = ?auto_116738 ?auto_116742 ) ) ( not ( = ?auto_116739 ?auto_116740 ) ) ( not ( = ?auto_116739 ?auto_116741 ) ) ( not ( = ?auto_116739 ?auto_116742 ) ) ( not ( = ?auto_116740 ?auto_116741 ) ) ( not ( = ?auto_116740 ?auto_116742 ) ) ( not ( = ?auto_116741 ?auto_116742 ) ) ( HOLDING ?auto_116743 ) ( not ( = ?auto_116737 ?auto_116743 ) ) ( not ( = ?auto_116738 ?auto_116743 ) ) ( not ( = ?auto_116739 ?auto_116743 ) ) ( not ( = ?auto_116740 ?auto_116743 ) ) ( not ( = ?auto_116741 ?auto_116743 ) ) ( not ( = ?auto_116742 ?auto_116743 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_116743 )
      ( MAKE-5PILE ?auto_116737 ?auto_116738 ?auto_116739 ?auto_116740 ?auto_116741 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116744 - BLOCK
      ?auto_116745 - BLOCK
      ?auto_116746 - BLOCK
      ?auto_116747 - BLOCK
      ?auto_116748 - BLOCK
    )
    :vars
    (
      ?auto_116749 - BLOCK
      ?auto_116750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116749 ?auto_116748 ) ( ON-TABLE ?auto_116744 ) ( ON ?auto_116745 ?auto_116744 ) ( ON ?auto_116746 ?auto_116745 ) ( ON ?auto_116747 ?auto_116746 ) ( ON ?auto_116748 ?auto_116747 ) ( not ( = ?auto_116744 ?auto_116745 ) ) ( not ( = ?auto_116744 ?auto_116746 ) ) ( not ( = ?auto_116744 ?auto_116747 ) ) ( not ( = ?auto_116744 ?auto_116748 ) ) ( not ( = ?auto_116744 ?auto_116749 ) ) ( not ( = ?auto_116745 ?auto_116746 ) ) ( not ( = ?auto_116745 ?auto_116747 ) ) ( not ( = ?auto_116745 ?auto_116748 ) ) ( not ( = ?auto_116745 ?auto_116749 ) ) ( not ( = ?auto_116746 ?auto_116747 ) ) ( not ( = ?auto_116746 ?auto_116748 ) ) ( not ( = ?auto_116746 ?auto_116749 ) ) ( not ( = ?auto_116747 ?auto_116748 ) ) ( not ( = ?auto_116747 ?auto_116749 ) ) ( not ( = ?auto_116748 ?auto_116749 ) ) ( not ( = ?auto_116744 ?auto_116750 ) ) ( not ( = ?auto_116745 ?auto_116750 ) ) ( not ( = ?auto_116746 ?auto_116750 ) ) ( not ( = ?auto_116747 ?auto_116750 ) ) ( not ( = ?auto_116748 ?auto_116750 ) ) ( not ( = ?auto_116749 ?auto_116750 ) ) ( ON ?auto_116750 ?auto_116749 ) ( CLEAR ?auto_116750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_116744 ?auto_116745 ?auto_116746 ?auto_116747 ?auto_116748 ?auto_116749 )
      ( MAKE-5PILE ?auto_116744 ?auto_116745 ?auto_116746 ?auto_116747 ?auto_116748 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116751 - BLOCK
      ?auto_116752 - BLOCK
      ?auto_116753 - BLOCK
      ?auto_116754 - BLOCK
      ?auto_116755 - BLOCK
    )
    :vars
    (
      ?auto_116756 - BLOCK
      ?auto_116757 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116756 ?auto_116755 ) ( ON-TABLE ?auto_116751 ) ( ON ?auto_116752 ?auto_116751 ) ( ON ?auto_116753 ?auto_116752 ) ( ON ?auto_116754 ?auto_116753 ) ( ON ?auto_116755 ?auto_116754 ) ( not ( = ?auto_116751 ?auto_116752 ) ) ( not ( = ?auto_116751 ?auto_116753 ) ) ( not ( = ?auto_116751 ?auto_116754 ) ) ( not ( = ?auto_116751 ?auto_116755 ) ) ( not ( = ?auto_116751 ?auto_116756 ) ) ( not ( = ?auto_116752 ?auto_116753 ) ) ( not ( = ?auto_116752 ?auto_116754 ) ) ( not ( = ?auto_116752 ?auto_116755 ) ) ( not ( = ?auto_116752 ?auto_116756 ) ) ( not ( = ?auto_116753 ?auto_116754 ) ) ( not ( = ?auto_116753 ?auto_116755 ) ) ( not ( = ?auto_116753 ?auto_116756 ) ) ( not ( = ?auto_116754 ?auto_116755 ) ) ( not ( = ?auto_116754 ?auto_116756 ) ) ( not ( = ?auto_116755 ?auto_116756 ) ) ( not ( = ?auto_116751 ?auto_116757 ) ) ( not ( = ?auto_116752 ?auto_116757 ) ) ( not ( = ?auto_116753 ?auto_116757 ) ) ( not ( = ?auto_116754 ?auto_116757 ) ) ( not ( = ?auto_116755 ?auto_116757 ) ) ( not ( = ?auto_116756 ?auto_116757 ) ) ( HOLDING ?auto_116757 ) ( CLEAR ?auto_116756 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_116751 ?auto_116752 ?auto_116753 ?auto_116754 ?auto_116755 ?auto_116756 ?auto_116757 )
      ( MAKE-5PILE ?auto_116751 ?auto_116752 ?auto_116753 ?auto_116754 ?auto_116755 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116758 - BLOCK
      ?auto_116759 - BLOCK
      ?auto_116760 - BLOCK
      ?auto_116761 - BLOCK
      ?auto_116762 - BLOCK
    )
    :vars
    (
      ?auto_116764 - BLOCK
      ?auto_116763 - BLOCK
      ?auto_116765 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116764 ?auto_116762 ) ( ON-TABLE ?auto_116758 ) ( ON ?auto_116759 ?auto_116758 ) ( ON ?auto_116760 ?auto_116759 ) ( ON ?auto_116761 ?auto_116760 ) ( ON ?auto_116762 ?auto_116761 ) ( not ( = ?auto_116758 ?auto_116759 ) ) ( not ( = ?auto_116758 ?auto_116760 ) ) ( not ( = ?auto_116758 ?auto_116761 ) ) ( not ( = ?auto_116758 ?auto_116762 ) ) ( not ( = ?auto_116758 ?auto_116764 ) ) ( not ( = ?auto_116759 ?auto_116760 ) ) ( not ( = ?auto_116759 ?auto_116761 ) ) ( not ( = ?auto_116759 ?auto_116762 ) ) ( not ( = ?auto_116759 ?auto_116764 ) ) ( not ( = ?auto_116760 ?auto_116761 ) ) ( not ( = ?auto_116760 ?auto_116762 ) ) ( not ( = ?auto_116760 ?auto_116764 ) ) ( not ( = ?auto_116761 ?auto_116762 ) ) ( not ( = ?auto_116761 ?auto_116764 ) ) ( not ( = ?auto_116762 ?auto_116764 ) ) ( not ( = ?auto_116758 ?auto_116763 ) ) ( not ( = ?auto_116759 ?auto_116763 ) ) ( not ( = ?auto_116760 ?auto_116763 ) ) ( not ( = ?auto_116761 ?auto_116763 ) ) ( not ( = ?auto_116762 ?auto_116763 ) ) ( not ( = ?auto_116764 ?auto_116763 ) ) ( CLEAR ?auto_116764 ) ( ON ?auto_116763 ?auto_116765 ) ( CLEAR ?auto_116763 ) ( HAND-EMPTY ) ( not ( = ?auto_116758 ?auto_116765 ) ) ( not ( = ?auto_116759 ?auto_116765 ) ) ( not ( = ?auto_116760 ?auto_116765 ) ) ( not ( = ?auto_116761 ?auto_116765 ) ) ( not ( = ?auto_116762 ?auto_116765 ) ) ( not ( = ?auto_116764 ?auto_116765 ) ) ( not ( = ?auto_116763 ?auto_116765 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_116763 ?auto_116765 )
      ( MAKE-5PILE ?auto_116758 ?auto_116759 ?auto_116760 ?auto_116761 ?auto_116762 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116782 - BLOCK
      ?auto_116783 - BLOCK
      ?auto_116784 - BLOCK
      ?auto_116785 - BLOCK
      ?auto_116786 - BLOCK
    )
    :vars
    (
      ?auto_116787 - BLOCK
      ?auto_116789 - BLOCK
      ?auto_116788 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116782 ) ( ON ?auto_116783 ?auto_116782 ) ( ON ?auto_116784 ?auto_116783 ) ( ON ?auto_116785 ?auto_116784 ) ( not ( = ?auto_116782 ?auto_116783 ) ) ( not ( = ?auto_116782 ?auto_116784 ) ) ( not ( = ?auto_116782 ?auto_116785 ) ) ( not ( = ?auto_116782 ?auto_116786 ) ) ( not ( = ?auto_116782 ?auto_116787 ) ) ( not ( = ?auto_116783 ?auto_116784 ) ) ( not ( = ?auto_116783 ?auto_116785 ) ) ( not ( = ?auto_116783 ?auto_116786 ) ) ( not ( = ?auto_116783 ?auto_116787 ) ) ( not ( = ?auto_116784 ?auto_116785 ) ) ( not ( = ?auto_116784 ?auto_116786 ) ) ( not ( = ?auto_116784 ?auto_116787 ) ) ( not ( = ?auto_116785 ?auto_116786 ) ) ( not ( = ?auto_116785 ?auto_116787 ) ) ( not ( = ?auto_116786 ?auto_116787 ) ) ( not ( = ?auto_116782 ?auto_116789 ) ) ( not ( = ?auto_116783 ?auto_116789 ) ) ( not ( = ?auto_116784 ?auto_116789 ) ) ( not ( = ?auto_116785 ?auto_116789 ) ) ( not ( = ?auto_116786 ?auto_116789 ) ) ( not ( = ?auto_116787 ?auto_116789 ) ) ( ON ?auto_116789 ?auto_116788 ) ( not ( = ?auto_116782 ?auto_116788 ) ) ( not ( = ?auto_116783 ?auto_116788 ) ) ( not ( = ?auto_116784 ?auto_116788 ) ) ( not ( = ?auto_116785 ?auto_116788 ) ) ( not ( = ?auto_116786 ?auto_116788 ) ) ( not ( = ?auto_116787 ?auto_116788 ) ) ( not ( = ?auto_116789 ?auto_116788 ) ) ( ON ?auto_116787 ?auto_116789 ) ( CLEAR ?auto_116787 ) ( HOLDING ?auto_116786 ) ( CLEAR ?auto_116785 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_116782 ?auto_116783 ?auto_116784 ?auto_116785 ?auto_116786 ?auto_116787 )
      ( MAKE-5PILE ?auto_116782 ?auto_116783 ?auto_116784 ?auto_116785 ?auto_116786 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116790 - BLOCK
      ?auto_116791 - BLOCK
      ?auto_116792 - BLOCK
      ?auto_116793 - BLOCK
      ?auto_116794 - BLOCK
    )
    :vars
    (
      ?auto_116796 - BLOCK
      ?auto_116795 - BLOCK
      ?auto_116797 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116790 ) ( ON ?auto_116791 ?auto_116790 ) ( ON ?auto_116792 ?auto_116791 ) ( ON ?auto_116793 ?auto_116792 ) ( not ( = ?auto_116790 ?auto_116791 ) ) ( not ( = ?auto_116790 ?auto_116792 ) ) ( not ( = ?auto_116790 ?auto_116793 ) ) ( not ( = ?auto_116790 ?auto_116794 ) ) ( not ( = ?auto_116790 ?auto_116796 ) ) ( not ( = ?auto_116791 ?auto_116792 ) ) ( not ( = ?auto_116791 ?auto_116793 ) ) ( not ( = ?auto_116791 ?auto_116794 ) ) ( not ( = ?auto_116791 ?auto_116796 ) ) ( not ( = ?auto_116792 ?auto_116793 ) ) ( not ( = ?auto_116792 ?auto_116794 ) ) ( not ( = ?auto_116792 ?auto_116796 ) ) ( not ( = ?auto_116793 ?auto_116794 ) ) ( not ( = ?auto_116793 ?auto_116796 ) ) ( not ( = ?auto_116794 ?auto_116796 ) ) ( not ( = ?auto_116790 ?auto_116795 ) ) ( not ( = ?auto_116791 ?auto_116795 ) ) ( not ( = ?auto_116792 ?auto_116795 ) ) ( not ( = ?auto_116793 ?auto_116795 ) ) ( not ( = ?auto_116794 ?auto_116795 ) ) ( not ( = ?auto_116796 ?auto_116795 ) ) ( ON ?auto_116795 ?auto_116797 ) ( not ( = ?auto_116790 ?auto_116797 ) ) ( not ( = ?auto_116791 ?auto_116797 ) ) ( not ( = ?auto_116792 ?auto_116797 ) ) ( not ( = ?auto_116793 ?auto_116797 ) ) ( not ( = ?auto_116794 ?auto_116797 ) ) ( not ( = ?auto_116796 ?auto_116797 ) ) ( not ( = ?auto_116795 ?auto_116797 ) ) ( ON ?auto_116796 ?auto_116795 ) ( CLEAR ?auto_116793 ) ( ON ?auto_116794 ?auto_116796 ) ( CLEAR ?auto_116794 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_116797 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_116797 ?auto_116795 ?auto_116796 )
      ( MAKE-5PILE ?auto_116790 ?auto_116791 ?auto_116792 ?auto_116793 ?auto_116794 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116798 - BLOCK
      ?auto_116799 - BLOCK
      ?auto_116800 - BLOCK
      ?auto_116801 - BLOCK
      ?auto_116802 - BLOCK
    )
    :vars
    (
      ?auto_116803 - BLOCK
      ?auto_116804 - BLOCK
      ?auto_116805 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116798 ) ( ON ?auto_116799 ?auto_116798 ) ( ON ?auto_116800 ?auto_116799 ) ( not ( = ?auto_116798 ?auto_116799 ) ) ( not ( = ?auto_116798 ?auto_116800 ) ) ( not ( = ?auto_116798 ?auto_116801 ) ) ( not ( = ?auto_116798 ?auto_116802 ) ) ( not ( = ?auto_116798 ?auto_116803 ) ) ( not ( = ?auto_116799 ?auto_116800 ) ) ( not ( = ?auto_116799 ?auto_116801 ) ) ( not ( = ?auto_116799 ?auto_116802 ) ) ( not ( = ?auto_116799 ?auto_116803 ) ) ( not ( = ?auto_116800 ?auto_116801 ) ) ( not ( = ?auto_116800 ?auto_116802 ) ) ( not ( = ?auto_116800 ?auto_116803 ) ) ( not ( = ?auto_116801 ?auto_116802 ) ) ( not ( = ?auto_116801 ?auto_116803 ) ) ( not ( = ?auto_116802 ?auto_116803 ) ) ( not ( = ?auto_116798 ?auto_116804 ) ) ( not ( = ?auto_116799 ?auto_116804 ) ) ( not ( = ?auto_116800 ?auto_116804 ) ) ( not ( = ?auto_116801 ?auto_116804 ) ) ( not ( = ?auto_116802 ?auto_116804 ) ) ( not ( = ?auto_116803 ?auto_116804 ) ) ( ON ?auto_116804 ?auto_116805 ) ( not ( = ?auto_116798 ?auto_116805 ) ) ( not ( = ?auto_116799 ?auto_116805 ) ) ( not ( = ?auto_116800 ?auto_116805 ) ) ( not ( = ?auto_116801 ?auto_116805 ) ) ( not ( = ?auto_116802 ?auto_116805 ) ) ( not ( = ?auto_116803 ?auto_116805 ) ) ( not ( = ?auto_116804 ?auto_116805 ) ) ( ON ?auto_116803 ?auto_116804 ) ( ON ?auto_116802 ?auto_116803 ) ( CLEAR ?auto_116802 ) ( ON-TABLE ?auto_116805 ) ( HOLDING ?auto_116801 ) ( CLEAR ?auto_116800 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_116798 ?auto_116799 ?auto_116800 ?auto_116801 )
      ( MAKE-5PILE ?auto_116798 ?auto_116799 ?auto_116800 ?auto_116801 ?auto_116802 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116806 - BLOCK
      ?auto_116807 - BLOCK
      ?auto_116808 - BLOCK
      ?auto_116809 - BLOCK
      ?auto_116810 - BLOCK
    )
    :vars
    (
      ?auto_116812 - BLOCK
      ?auto_116813 - BLOCK
      ?auto_116811 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116806 ) ( ON ?auto_116807 ?auto_116806 ) ( ON ?auto_116808 ?auto_116807 ) ( not ( = ?auto_116806 ?auto_116807 ) ) ( not ( = ?auto_116806 ?auto_116808 ) ) ( not ( = ?auto_116806 ?auto_116809 ) ) ( not ( = ?auto_116806 ?auto_116810 ) ) ( not ( = ?auto_116806 ?auto_116812 ) ) ( not ( = ?auto_116807 ?auto_116808 ) ) ( not ( = ?auto_116807 ?auto_116809 ) ) ( not ( = ?auto_116807 ?auto_116810 ) ) ( not ( = ?auto_116807 ?auto_116812 ) ) ( not ( = ?auto_116808 ?auto_116809 ) ) ( not ( = ?auto_116808 ?auto_116810 ) ) ( not ( = ?auto_116808 ?auto_116812 ) ) ( not ( = ?auto_116809 ?auto_116810 ) ) ( not ( = ?auto_116809 ?auto_116812 ) ) ( not ( = ?auto_116810 ?auto_116812 ) ) ( not ( = ?auto_116806 ?auto_116813 ) ) ( not ( = ?auto_116807 ?auto_116813 ) ) ( not ( = ?auto_116808 ?auto_116813 ) ) ( not ( = ?auto_116809 ?auto_116813 ) ) ( not ( = ?auto_116810 ?auto_116813 ) ) ( not ( = ?auto_116812 ?auto_116813 ) ) ( ON ?auto_116813 ?auto_116811 ) ( not ( = ?auto_116806 ?auto_116811 ) ) ( not ( = ?auto_116807 ?auto_116811 ) ) ( not ( = ?auto_116808 ?auto_116811 ) ) ( not ( = ?auto_116809 ?auto_116811 ) ) ( not ( = ?auto_116810 ?auto_116811 ) ) ( not ( = ?auto_116812 ?auto_116811 ) ) ( not ( = ?auto_116813 ?auto_116811 ) ) ( ON ?auto_116812 ?auto_116813 ) ( ON ?auto_116810 ?auto_116812 ) ( ON-TABLE ?auto_116811 ) ( CLEAR ?auto_116808 ) ( ON ?auto_116809 ?auto_116810 ) ( CLEAR ?auto_116809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_116811 ?auto_116813 ?auto_116812 ?auto_116810 )
      ( MAKE-5PILE ?auto_116806 ?auto_116807 ?auto_116808 ?auto_116809 ?auto_116810 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116814 - BLOCK
      ?auto_116815 - BLOCK
      ?auto_116816 - BLOCK
      ?auto_116817 - BLOCK
      ?auto_116818 - BLOCK
    )
    :vars
    (
      ?auto_116819 - BLOCK
      ?auto_116820 - BLOCK
      ?auto_116821 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116814 ) ( ON ?auto_116815 ?auto_116814 ) ( not ( = ?auto_116814 ?auto_116815 ) ) ( not ( = ?auto_116814 ?auto_116816 ) ) ( not ( = ?auto_116814 ?auto_116817 ) ) ( not ( = ?auto_116814 ?auto_116818 ) ) ( not ( = ?auto_116814 ?auto_116819 ) ) ( not ( = ?auto_116815 ?auto_116816 ) ) ( not ( = ?auto_116815 ?auto_116817 ) ) ( not ( = ?auto_116815 ?auto_116818 ) ) ( not ( = ?auto_116815 ?auto_116819 ) ) ( not ( = ?auto_116816 ?auto_116817 ) ) ( not ( = ?auto_116816 ?auto_116818 ) ) ( not ( = ?auto_116816 ?auto_116819 ) ) ( not ( = ?auto_116817 ?auto_116818 ) ) ( not ( = ?auto_116817 ?auto_116819 ) ) ( not ( = ?auto_116818 ?auto_116819 ) ) ( not ( = ?auto_116814 ?auto_116820 ) ) ( not ( = ?auto_116815 ?auto_116820 ) ) ( not ( = ?auto_116816 ?auto_116820 ) ) ( not ( = ?auto_116817 ?auto_116820 ) ) ( not ( = ?auto_116818 ?auto_116820 ) ) ( not ( = ?auto_116819 ?auto_116820 ) ) ( ON ?auto_116820 ?auto_116821 ) ( not ( = ?auto_116814 ?auto_116821 ) ) ( not ( = ?auto_116815 ?auto_116821 ) ) ( not ( = ?auto_116816 ?auto_116821 ) ) ( not ( = ?auto_116817 ?auto_116821 ) ) ( not ( = ?auto_116818 ?auto_116821 ) ) ( not ( = ?auto_116819 ?auto_116821 ) ) ( not ( = ?auto_116820 ?auto_116821 ) ) ( ON ?auto_116819 ?auto_116820 ) ( ON ?auto_116818 ?auto_116819 ) ( ON-TABLE ?auto_116821 ) ( ON ?auto_116817 ?auto_116818 ) ( CLEAR ?auto_116817 ) ( HOLDING ?auto_116816 ) ( CLEAR ?auto_116815 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_116814 ?auto_116815 ?auto_116816 )
      ( MAKE-5PILE ?auto_116814 ?auto_116815 ?auto_116816 ?auto_116817 ?auto_116818 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116822 - BLOCK
      ?auto_116823 - BLOCK
      ?auto_116824 - BLOCK
      ?auto_116825 - BLOCK
      ?auto_116826 - BLOCK
    )
    :vars
    (
      ?auto_116829 - BLOCK
      ?auto_116827 - BLOCK
      ?auto_116828 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116822 ) ( ON ?auto_116823 ?auto_116822 ) ( not ( = ?auto_116822 ?auto_116823 ) ) ( not ( = ?auto_116822 ?auto_116824 ) ) ( not ( = ?auto_116822 ?auto_116825 ) ) ( not ( = ?auto_116822 ?auto_116826 ) ) ( not ( = ?auto_116822 ?auto_116829 ) ) ( not ( = ?auto_116823 ?auto_116824 ) ) ( not ( = ?auto_116823 ?auto_116825 ) ) ( not ( = ?auto_116823 ?auto_116826 ) ) ( not ( = ?auto_116823 ?auto_116829 ) ) ( not ( = ?auto_116824 ?auto_116825 ) ) ( not ( = ?auto_116824 ?auto_116826 ) ) ( not ( = ?auto_116824 ?auto_116829 ) ) ( not ( = ?auto_116825 ?auto_116826 ) ) ( not ( = ?auto_116825 ?auto_116829 ) ) ( not ( = ?auto_116826 ?auto_116829 ) ) ( not ( = ?auto_116822 ?auto_116827 ) ) ( not ( = ?auto_116823 ?auto_116827 ) ) ( not ( = ?auto_116824 ?auto_116827 ) ) ( not ( = ?auto_116825 ?auto_116827 ) ) ( not ( = ?auto_116826 ?auto_116827 ) ) ( not ( = ?auto_116829 ?auto_116827 ) ) ( ON ?auto_116827 ?auto_116828 ) ( not ( = ?auto_116822 ?auto_116828 ) ) ( not ( = ?auto_116823 ?auto_116828 ) ) ( not ( = ?auto_116824 ?auto_116828 ) ) ( not ( = ?auto_116825 ?auto_116828 ) ) ( not ( = ?auto_116826 ?auto_116828 ) ) ( not ( = ?auto_116829 ?auto_116828 ) ) ( not ( = ?auto_116827 ?auto_116828 ) ) ( ON ?auto_116829 ?auto_116827 ) ( ON ?auto_116826 ?auto_116829 ) ( ON-TABLE ?auto_116828 ) ( ON ?auto_116825 ?auto_116826 ) ( CLEAR ?auto_116823 ) ( ON ?auto_116824 ?auto_116825 ) ( CLEAR ?auto_116824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_116828 ?auto_116827 ?auto_116829 ?auto_116826 ?auto_116825 )
      ( MAKE-5PILE ?auto_116822 ?auto_116823 ?auto_116824 ?auto_116825 ?auto_116826 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116830 - BLOCK
      ?auto_116831 - BLOCK
      ?auto_116832 - BLOCK
      ?auto_116833 - BLOCK
      ?auto_116834 - BLOCK
    )
    :vars
    (
      ?auto_116835 - BLOCK
      ?auto_116837 - BLOCK
      ?auto_116836 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116830 ) ( not ( = ?auto_116830 ?auto_116831 ) ) ( not ( = ?auto_116830 ?auto_116832 ) ) ( not ( = ?auto_116830 ?auto_116833 ) ) ( not ( = ?auto_116830 ?auto_116834 ) ) ( not ( = ?auto_116830 ?auto_116835 ) ) ( not ( = ?auto_116831 ?auto_116832 ) ) ( not ( = ?auto_116831 ?auto_116833 ) ) ( not ( = ?auto_116831 ?auto_116834 ) ) ( not ( = ?auto_116831 ?auto_116835 ) ) ( not ( = ?auto_116832 ?auto_116833 ) ) ( not ( = ?auto_116832 ?auto_116834 ) ) ( not ( = ?auto_116832 ?auto_116835 ) ) ( not ( = ?auto_116833 ?auto_116834 ) ) ( not ( = ?auto_116833 ?auto_116835 ) ) ( not ( = ?auto_116834 ?auto_116835 ) ) ( not ( = ?auto_116830 ?auto_116837 ) ) ( not ( = ?auto_116831 ?auto_116837 ) ) ( not ( = ?auto_116832 ?auto_116837 ) ) ( not ( = ?auto_116833 ?auto_116837 ) ) ( not ( = ?auto_116834 ?auto_116837 ) ) ( not ( = ?auto_116835 ?auto_116837 ) ) ( ON ?auto_116837 ?auto_116836 ) ( not ( = ?auto_116830 ?auto_116836 ) ) ( not ( = ?auto_116831 ?auto_116836 ) ) ( not ( = ?auto_116832 ?auto_116836 ) ) ( not ( = ?auto_116833 ?auto_116836 ) ) ( not ( = ?auto_116834 ?auto_116836 ) ) ( not ( = ?auto_116835 ?auto_116836 ) ) ( not ( = ?auto_116837 ?auto_116836 ) ) ( ON ?auto_116835 ?auto_116837 ) ( ON ?auto_116834 ?auto_116835 ) ( ON-TABLE ?auto_116836 ) ( ON ?auto_116833 ?auto_116834 ) ( ON ?auto_116832 ?auto_116833 ) ( CLEAR ?auto_116832 ) ( HOLDING ?auto_116831 ) ( CLEAR ?auto_116830 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_116830 ?auto_116831 )
      ( MAKE-5PILE ?auto_116830 ?auto_116831 ?auto_116832 ?auto_116833 ?auto_116834 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116838 - BLOCK
      ?auto_116839 - BLOCK
      ?auto_116840 - BLOCK
      ?auto_116841 - BLOCK
      ?auto_116842 - BLOCK
    )
    :vars
    (
      ?auto_116843 - BLOCK
      ?auto_116845 - BLOCK
      ?auto_116844 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116838 ) ( not ( = ?auto_116838 ?auto_116839 ) ) ( not ( = ?auto_116838 ?auto_116840 ) ) ( not ( = ?auto_116838 ?auto_116841 ) ) ( not ( = ?auto_116838 ?auto_116842 ) ) ( not ( = ?auto_116838 ?auto_116843 ) ) ( not ( = ?auto_116839 ?auto_116840 ) ) ( not ( = ?auto_116839 ?auto_116841 ) ) ( not ( = ?auto_116839 ?auto_116842 ) ) ( not ( = ?auto_116839 ?auto_116843 ) ) ( not ( = ?auto_116840 ?auto_116841 ) ) ( not ( = ?auto_116840 ?auto_116842 ) ) ( not ( = ?auto_116840 ?auto_116843 ) ) ( not ( = ?auto_116841 ?auto_116842 ) ) ( not ( = ?auto_116841 ?auto_116843 ) ) ( not ( = ?auto_116842 ?auto_116843 ) ) ( not ( = ?auto_116838 ?auto_116845 ) ) ( not ( = ?auto_116839 ?auto_116845 ) ) ( not ( = ?auto_116840 ?auto_116845 ) ) ( not ( = ?auto_116841 ?auto_116845 ) ) ( not ( = ?auto_116842 ?auto_116845 ) ) ( not ( = ?auto_116843 ?auto_116845 ) ) ( ON ?auto_116845 ?auto_116844 ) ( not ( = ?auto_116838 ?auto_116844 ) ) ( not ( = ?auto_116839 ?auto_116844 ) ) ( not ( = ?auto_116840 ?auto_116844 ) ) ( not ( = ?auto_116841 ?auto_116844 ) ) ( not ( = ?auto_116842 ?auto_116844 ) ) ( not ( = ?auto_116843 ?auto_116844 ) ) ( not ( = ?auto_116845 ?auto_116844 ) ) ( ON ?auto_116843 ?auto_116845 ) ( ON ?auto_116842 ?auto_116843 ) ( ON-TABLE ?auto_116844 ) ( ON ?auto_116841 ?auto_116842 ) ( ON ?auto_116840 ?auto_116841 ) ( CLEAR ?auto_116838 ) ( ON ?auto_116839 ?auto_116840 ) ( CLEAR ?auto_116839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_116844 ?auto_116845 ?auto_116843 ?auto_116842 ?auto_116841 ?auto_116840 )
      ( MAKE-5PILE ?auto_116838 ?auto_116839 ?auto_116840 ?auto_116841 ?auto_116842 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116846 - BLOCK
      ?auto_116847 - BLOCK
      ?auto_116848 - BLOCK
      ?auto_116849 - BLOCK
      ?auto_116850 - BLOCK
    )
    :vars
    (
      ?auto_116851 - BLOCK
      ?auto_116853 - BLOCK
      ?auto_116852 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116846 ?auto_116847 ) ) ( not ( = ?auto_116846 ?auto_116848 ) ) ( not ( = ?auto_116846 ?auto_116849 ) ) ( not ( = ?auto_116846 ?auto_116850 ) ) ( not ( = ?auto_116846 ?auto_116851 ) ) ( not ( = ?auto_116847 ?auto_116848 ) ) ( not ( = ?auto_116847 ?auto_116849 ) ) ( not ( = ?auto_116847 ?auto_116850 ) ) ( not ( = ?auto_116847 ?auto_116851 ) ) ( not ( = ?auto_116848 ?auto_116849 ) ) ( not ( = ?auto_116848 ?auto_116850 ) ) ( not ( = ?auto_116848 ?auto_116851 ) ) ( not ( = ?auto_116849 ?auto_116850 ) ) ( not ( = ?auto_116849 ?auto_116851 ) ) ( not ( = ?auto_116850 ?auto_116851 ) ) ( not ( = ?auto_116846 ?auto_116853 ) ) ( not ( = ?auto_116847 ?auto_116853 ) ) ( not ( = ?auto_116848 ?auto_116853 ) ) ( not ( = ?auto_116849 ?auto_116853 ) ) ( not ( = ?auto_116850 ?auto_116853 ) ) ( not ( = ?auto_116851 ?auto_116853 ) ) ( ON ?auto_116853 ?auto_116852 ) ( not ( = ?auto_116846 ?auto_116852 ) ) ( not ( = ?auto_116847 ?auto_116852 ) ) ( not ( = ?auto_116848 ?auto_116852 ) ) ( not ( = ?auto_116849 ?auto_116852 ) ) ( not ( = ?auto_116850 ?auto_116852 ) ) ( not ( = ?auto_116851 ?auto_116852 ) ) ( not ( = ?auto_116853 ?auto_116852 ) ) ( ON ?auto_116851 ?auto_116853 ) ( ON ?auto_116850 ?auto_116851 ) ( ON-TABLE ?auto_116852 ) ( ON ?auto_116849 ?auto_116850 ) ( ON ?auto_116848 ?auto_116849 ) ( ON ?auto_116847 ?auto_116848 ) ( CLEAR ?auto_116847 ) ( HOLDING ?auto_116846 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_116846 )
      ( MAKE-5PILE ?auto_116846 ?auto_116847 ?auto_116848 ?auto_116849 ?auto_116850 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116854 - BLOCK
      ?auto_116855 - BLOCK
      ?auto_116856 - BLOCK
      ?auto_116857 - BLOCK
      ?auto_116858 - BLOCK
    )
    :vars
    (
      ?auto_116861 - BLOCK
      ?auto_116859 - BLOCK
      ?auto_116860 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116854 ?auto_116855 ) ) ( not ( = ?auto_116854 ?auto_116856 ) ) ( not ( = ?auto_116854 ?auto_116857 ) ) ( not ( = ?auto_116854 ?auto_116858 ) ) ( not ( = ?auto_116854 ?auto_116861 ) ) ( not ( = ?auto_116855 ?auto_116856 ) ) ( not ( = ?auto_116855 ?auto_116857 ) ) ( not ( = ?auto_116855 ?auto_116858 ) ) ( not ( = ?auto_116855 ?auto_116861 ) ) ( not ( = ?auto_116856 ?auto_116857 ) ) ( not ( = ?auto_116856 ?auto_116858 ) ) ( not ( = ?auto_116856 ?auto_116861 ) ) ( not ( = ?auto_116857 ?auto_116858 ) ) ( not ( = ?auto_116857 ?auto_116861 ) ) ( not ( = ?auto_116858 ?auto_116861 ) ) ( not ( = ?auto_116854 ?auto_116859 ) ) ( not ( = ?auto_116855 ?auto_116859 ) ) ( not ( = ?auto_116856 ?auto_116859 ) ) ( not ( = ?auto_116857 ?auto_116859 ) ) ( not ( = ?auto_116858 ?auto_116859 ) ) ( not ( = ?auto_116861 ?auto_116859 ) ) ( ON ?auto_116859 ?auto_116860 ) ( not ( = ?auto_116854 ?auto_116860 ) ) ( not ( = ?auto_116855 ?auto_116860 ) ) ( not ( = ?auto_116856 ?auto_116860 ) ) ( not ( = ?auto_116857 ?auto_116860 ) ) ( not ( = ?auto_116858 ?auto_116860 ) ) ( not ( = ?auto_116861 ?auto_116860 ) ) ( not ( = ?auto_116859 ?auto_116860 ) ) ( ON ?auto_116861 ?auto_116859 ) ( ON ?auto_116858 ?auto_116861 ) ( ON-TABLE ?auto_116860 ) ( ON ?auto_116857 ?auto_116858 ) ( ON ?auto_116856 ?auto_116857 ) ( ON ?auto_116855 ?auto_116856 ) ( ON ?auto_116854 ?auto_116855 ) ( CLEAR ?auto_116854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_116860 ?auto_116859 ?auto_116861 ?auto_116858 ?auto_116857 ?auto_116856 ?auto_116855 )
      ( MAKE-5PILE ?auto_116854 ?auto_116855 ?auto_116856 ?auto_116857 ?auto_116858 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_116864 - BLOCK
      ?auto_116865 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_116865 ) ( CLEAR ?auto_116864 ) ( ON-TABLE ?auto_116864 ) ( not ( = ?auto_116864 ?auto_116865 ) ) )
    :subtasks
    ( ( !STACK ?auto_116865 ?auto_116864 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_116866 - BLOCK
      ?auto_116867 - BLOCK
    )
    :vars
    (
      ?auto_116868 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_116866 ) ( ON-TABLE ?auto_116866 ) ( not ( = ?auto_116866 ?auto_116867 ) ) ( ON ?auto_116867 ?auto_116868 ) ( CLEAR ?auto_116867 ) ( HAND-EMPTY ) ( not ( = ?auto_116866 ?auto_116868 ) ) ( not ( = ?auto_116867 ?auto_116868 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_116867 ?auto_116868 )
      ( MAKE-2PILE ?auto_116866 ?auto_116867 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_116869 - BLOCK
      ?auto_116870 - BLOCK
    )
    :vars
    (
      ?auto_116871 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116869 ?auto_116870 ) ) ( ON ?auto_116870 ?auto_116871 ) ( CLEAR ?auto_116870 ) ( not ( = ?auto_116869 ?auto_116871 ) ) ( not ( = ?auto_116870 ?auto_116871 ) ) ( HOLDING ?auto_116869 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_116869 )
      ( MAKE-2PILE ?auto_116869 ?auto_116870 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_116872 - BLOCK
      ?auto_116873 - BLOCK
    )
    :vars
    (
      ?auto_116874 - BLOCK
      ?auto_116877 - BLOCK
      ?auto_116875 - BLOCK
      ?auto_116876 - BLOCK
      ?auto_116878 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116872 ?auto_116873 ) ) ( ON ?auto_116873 ?auto_116874 ) ( not ( = ?auto_116872 ?auto_116874 ) ) ( not ( = ?auto_116873 ?auto_116874 ) ) ( ON ?auto_116872 ?auto_116873 ) ( CLEAR ?auto_116872 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_116877 ) ( ON ?auto_116875 ?auto_116877 ) ( ON ?auto_116876 ?auto_116875 ) ( ON ?auto_116878 ?auto_116876 ) ( ON ?auto_116874 ?auto_116878 ) ( not ( = ?auto_116877 ?auto_116875 ) ) ( not ( = ?auto_116877 ?auto_116876 ) ) ( not ( = ?auto_116877 ?auto_116878 ) ) ( not ( = ?auto_116877 ?auto_116874 ) ) ( not ( = ?auto_116877 ?auto_116873 ) ) ( not ( = ?auto_116877 ?auto_116872 ) ) ( not ( = ?auto_116875 ?auto_116876 ) ) ( not ( = ?auto_116875 ?auto_116878 ) ) ( not ( = ?auto_116875 ?auto_116874 ) ) ( not ( = ?auto_116875 ?auto_116873 ) ) ( not ( = ?auto_116875 ?auto_116872 ) ) ( not ( = ?auto_116876 ?auto_116878 ) ) ( not ( = ?auto_116876 ?auto_116874 ) ) ( not ( = ?auto_116876 ?auto_116873 ) ) ( not ( = ?auto_116876 ?auto_116872 ) ) ( not ( = ?auto_116878 ?auto_116874 ) ) ( not ( = ?auto_116878 ?auto_116873 ) ) ( not ( = ?auto_116878 ?auto_116872 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_116877 ?auto_116875 ?auto_116876 ?auto_116878 ?auto_116874 ?auto_116873 )
      ( MAKE-2PILE ?auto_116872 ?auto_116873 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_116879 - BLOCK
      ?auto_116880 - BLOCK
    )
    :vars
    (
      ?auto_116884 - BLOCK
      ?auto_116881 - BLOCK
      ?auto_116882 - BLOCK
      ?auto_116883 - BLOCK
      ?auto_116885 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116879 ?auto_116880 ) ) ( ON ?auto_116880 ?auto_116884 ) ( not ( = ?auto_116879 ?auto_116884 ) ) ( not ( = ?auto_116880 ?auto_116884 ) ) ( ON-TABLE ?auto_116881 ) ( ON ?auto_116882 ?auto_116881 ) ( ON ?auto_116883 ?auto_116882 ) ( ON ?auto_116885 ?auto_116883 ) ( ON ?auto_116884 ?auto_116885 ) ( not ( = ?auto_116881 ?auto_116882 ) ) ( not ( = ?auto_116881 ?auto_116883 ) ) ( not ( = ?auto_116881 ?auto_116885 ) ) ( not ( = ?auto_116881 ?auto_116884 ) ) ( not ( = ?auto_116881 ?auto_116880 ) ) ( not ( = ?auto_116881 ?auto_116879 ) ) ( not ( = ?auto_116882 ?auto_116883 ) ) ( not ( = ?auto_116882 ?auto_116885 ) ) ( not ( = ?auto_116882 ?auto_116884 ) ) ( not ( = ?auto_116882 ?auto_116880 ) ) ( not ( = ?auto_116882 ?auto_116879 ) ) ( not ( = ?auto_116883 ?auto_116885 ) ) ( not ( = ?auto_116883 ?auto_116884 ) ) ( not ( = ?auto_116883 ?auto_116880 ) ) ( not ( = ?auto_116883 ?auto_116879 ) ) ( not ( = ?auto_116885 ?auto_116884 ) ) ( not ( = ?auto_116885 ?auto_116880 ) ) ( not ( = ?auto_116885 ?auto_116879 ) ) ( HOLDING ?auto_116879 ) ( CLEAR ?auto_116880 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_116881 ?auto_116882 ?auto_116883 ?auto_116885 ?auto_116884 ?auto_116880 ?auto_116879 )
      ( MAKE-2PILE ?auto_116879 ?auto_116880 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_116886 - BLOCK
      ?auto_116887 - BLOCK
    )
    :vars
    (
      ?auto_116889 - BLOCK
      ?auto_116890 - BLOCK
      ?auto_116892 - BLOCK
      ?auto_116891 - BLOCK
      ?auto_116888 - BLOCK
      ?auto_116893 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116886 ?auto_116887 ) ) ( ON ?auto_116887 ?auto_116889 ) ( not ( = ?auto_116886 ?auto_116889 ) ) ( not ( = ?auto_116887 ?auto_116889 ) ) ( ON-TABLE ?auto_116890 ) ( ON ?auto_116892 ?auto_116890 ) ( ON ?auto_116891 ?auto_116892 ) ( ON ?auto_116888 ?auto_116891 ) ( ON ?auto_116889 ?auto_116888 ) ( not ( = ?auto_116890 ?auto_116892 ) ) ( not ( = ?auto_116890 ?auto_116891 ) ) ( not ( = ?auto_116890 ?auto_116888 ) ) ( not ( = ?auto_116890 ?auto_116889 ) ) ( not ( = ?auto_116890 ?auto_116887 ) ) ( not ( = ?auto_116890 ?auto_116886 ) ) ( not ( = ?auto_116892 ?auto_116891 ) ) ( not ( = ?auto_116892 ?auto_116888 ) ) ( not ( = ?auto_116892 ?auto_116889 ) ) ( not ( = ?auto_116892 ?auto_116887 ) ) ( not ( = ?auto_116892 ?auto_116886 ) ) ( not ( = ?auto_116891 ?auto_116888 ) ) ( not ( = ?auto_116891 ?auto_116889 ) ) ( not ( = ?auto_116891 ?auto_116887 ) ) ( not ( = ?auto_116891 ?auto_116886 ) ) ( not ( = ?auto_116888 ?auto_116889 ) ) ( not ( = ?auto_116888 ?auto_116887 ) ) ( not ( = ?auto_116888 ?auto_116886 ) ) ( CLEAR ?auto_116887 ) ( ON ?auto_116886 ?auto_116893 ) ( CLEAR ?auto_116886 ) ( HAND-EMPTY ) ( not ( = ?auto_116886 ?auto_116893 ) ) ( not ( = ?auto_116887 ?auto_116893 ) ) ( not ( = ?auto_116889 ?auto_116893 ) ) ( not ( = ?auto_116890 ?auto_116893 ) ) ( not ( = ?auto_116892 ?auto_116893 ) ) ( not ( = ?auto_116891 ?auto_116893 ) ) ( not ( = ?auto_116888 ?auto_116893 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_116886 ?auto_116893 )
      ( MAKE-2PILE ?auto_116886 ?auto_116887 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_116894 - BLOCK
      ?auto_116895 - BLOCK
    )
    :vars
    (
      ?auto_116898 - BLOCK
      ?auto_116899 - BLOCK
      ?auto_116896 - BLOCK
      ?auto_116901 - BLOCK
      ?auto_116897 - BLOCK
      ?auto_116900 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116894 ?auto_116895 ) ) ( not ( = ?auto_116894 ?auto_116898 ) ) ( not ( = ?auto_116895 ?auto_116898 ) ) ( ON-TABLE ?auto_116899 ) ( ON ?auto_116896 ?auto_116899 ) ( ON ?auto_116901 ?auto_116896 ) ( ON ?auto_116897 ?auto_116901 ) ( ON ?auto_116898 ?auto_116897 ) ( not ( = ?auto_116899 ?auto_116896 ) ) ( not ( = ?auto_116899 ?auto_116901 ) ) ( not ( = ?auto_116899 ?auto_116897 ) ) ( not ( = ?auto_116899 ?auto_116898 ) ) ( not ( = ?auto_116899 ?auto_116895 ) ) ( not ( = ?auto_116899 ?auto_116894 ) ) ( not ( = ?auto_116896 ?auto_116901 ) ) ( not ( = ?auto_116896 ?auto_116897 ) ) ( not ( = ?auto_116896 ?auto_116898 ) ) ( not ( = ?auto_116896 ?auto_116895 ) ) ( not ( = ?auto_116896 ?auto_116894 ) ) ( not ( = ?auto_116901 ?auto_116897 ) ) ( not ( = ?auto_116901 ?auto_116898 ) ) ( not ( = ?auto_116901 ?auto_116895 ) ) ( not ( = ?auto_116901 ?auto_116894 ) ) ( not ( = ?auto_116897 ?auto_116898 ) ) ( not ( = ?auto_116897 ?auto_116895 ) ) ( not ( = ?auto_116897 ?auto_116894 ) ) ( ON ?auto_116894 ?auto_116900 ) ( CLEAR ?auto_116894 ) ( not ( = ?auto_116894 ?auto_116900 ) ) ( not ( = ?auto_116895 ?auto_116900 ) ) ( not ( = ?auto_116898 ?auto_116900 ) ) ( not ( = ?auto_116899 ?auto_116900 ) ) ( not ( = ?auto_116896 ?auto_116900 ) ) ( not ( = ?auto_116901 ?auto_116900 ) ) ( not ( = ?auto_116897 ?auto_116900 ) ) ( HOLDING ?auto_116895 ) ( CLEAR ?auto_116898 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_116899 ?auto_116896 ?auto_116901 ?auto_116897 ?auto_116898 ?auto_116895 )
      ( MAKE-2PILE ?auto_116894 ?auto_116895 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_116902 - BLOCK
      ?auto_116903 - BLOCK
    )
    :vars
    (
      ?auto_116905 - BLOCK
      ?auto_116909 - BLOCK
      ?auto_116908 - BLOCK
      ?auto_116904 - BLOCK
      ?auto_116906 - BLOCK
      ?auto_116907 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116902 ?auto_116903 ) ) ( not ( = ?auto_116902 ?auto_116905 ) ) ( not ( = ?auto_116903 ?auto_116905 ) ) ( ON-TABLE ?auto_116909 ) ( ON ?auto_116908 ?auto_116909 ) ( ON ?auto_116904 ?auto_116908 ) ( ON ?auto_116906 ?auto_116904 ) ( ON ?auto_116905 ?auto_116906 ) ( not ( = ?auto_116909 ?auto_116908 ) ) ( not ( = ?auto_116909 ?auto_116904 ) ) ( not ( = ?auto_116909 ?auto_116906 ) ) ( not ( = ?auto_116909 ?auto_116905 ) ) ( not ( = ?auto_116909 ?auto_116903 ) ) ( not ( = ?auto_116909 ?auto_116902 ) ) ( not ( = ?auto_116908 ?auto_116904 ) ) ( not ( = ?auto_116908 ?auto_116906 ) ) ( not ( = ?auto_116908 ?auto_116905 ) ) ( not ( = ?auto_116908 ?auto_116903 ) ) ( not ( = ?auto_116908 ?auto_116902 ) ) ( not ( = ?auto_116904 ?auto_116906 ) ) ( not ( = ?auto_116904 ?auto_116905 ) ) ( not ( = ?auto_116904 ?auto_116903 ) ) ( not ( = ?auto_116904 ?auto_116902 ) ) ( not ( = ?auto_116906 ?auto_116905 ) ) ( not ( = ?auto_116906 ?auto_116903 ) ) ( not ( = ?auto_116906 ?auto_116902 ) ) ( ON ?auto_116902 ?auto_116907 ) ( not ( = ?auto_116902 ?auto_116907 ) ) ( not ( = ?auto_116903 ?auto_116907 ) ) ( not ( = ?auto_116905 ?auto_116907 ) ) ( not ( = ?auto_116909 ?auto_116907 ) ) ( not ( = ?auto_116908 ?auto_116907 ) ) ( not ( = ?auto_116904 ?auto_116907 ) ) ( not ( = ?auto_116906 ?auto_116907 ) ) ( CLEAR ?auto_116905 ) ( ON ?auto_116903 ?auto_116902 ) ( CLEAR ?auto_116903 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_116907 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_116907 ?auto_116902 )
      ( MAKE-2PILE ?auto_116902 ?auto_116903 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_116910 - BLOCK
      ?auto_116911 - BLOCK
    )
    :vars
    (
      ?auto_116912 - BLOCK
      ?auto_116914 - BLOCK
      ?auto_116913 - BLOCK
      ?auto_116917 - BLOCK
      ?auto_116915 - BLOCK
      ?auto_116916 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116910 ?auto_116911 ) ) ( not ( = ?auto_116910 ?auto_116912 ) ) ( not ( = ?auto_116911 ?auto_116912 ) ) ( ON-TABLE ?auto_116914 ) ( ON ?auto_116913 ?auto_116914 ) ( ON ?auto_116917 ?auto_116913 ) ( ON ?auto_116915 ?auto_116917 ) ( not ( = ?auto_116914 ?auto_116913 ) ) ( not ( = ?auto_116914 ?auto_116917 ) ) ( not ( = ?auto_116914 ?auto_116915 ) ) ( not ( = ?auto_116914 ?auto_116912 ) ) ( not ( = ?auto_116914 ?auto_116911 ) ) ( not ( = ?auto_116914 ?auto_116910 ) ) ( not ( = ?auto_116913 ?auto_116917 ) ) ( not ( = ?auto_116913 ?auto_116915 ) ) ( not ( = ?auto_116913 ?auto_116912 ) ) ( not ( = ?auto_116913 ?auto_116911 ) ) ( not ( = ?auto_116913 ?auto_116910 ) ) ( not ( = ?auto_116917 ?auto_116915 ) ) ( not ( = ?auto_116917 ?auto_116912 ) ) ( not ( = ?auto_116917 ?auto_116911 ) ) ( not ( = ?auto_116917 ?auto_116910 ) ) ( not ( = ?auto_116915 ?auto_116912 ) ) ( not ( = ?auto_116915 ?auto_116911 ) ) ( not ( = ?auto_116915 ?auto_116910 ) ) ( ON ?auto_116910 ?auto_116916 ) ( not ( = ?auto_116910 ?auto_116916 ) ) ( not ( = ?auto_116911 ?auto_116916 ) ) ( not ( = ?auto_116912 ?auto_116916 ) ) ( not ( = ?auto_116914 ?auto_116916 ) ) ( not ( = ?auto_116913 ?auto_116916 ) ) ( not ( = ?auto_116917 ?auto_116916 ) ) ( not ( = ?auto_116915 ?auto_116916 ) ) ( ON ?auto_116911 ?auto_116910 ) ( CLEAR ?auto_116911 ) ( ON-TABLE ?auto_116916 ) ( HOLDING ?auto_116912 ) ( CLEAR ?auto_116915 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_116914 ?auto_116913 ?auto_116917 ?auto_116915 ?auto_116912 )
      ( MAKE-2PILE ?auto_116910 ?auto_116911 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_116918 - BLOCK
      ?auto_116919 - BLOCK
    )
    :vars
    (
      ?auto_116920 - BLOCK
      ?auto_116921 - BLOCK
      ?auto_116924 - BLOCK
      ?auto_116923 - BLOCK
      ?auto_116925 - BLOCK
      ?auto_116922 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116918 ?auto_116919 ) ) ( not ( = ?auto_116918 ?auto_116920 ) ) ( not ( = ?auto_116919 ?auto_116920 ) ) ( ON-TABLE ?auto_116921 ) ( ON ?auto_116924 ?auto_116921 ) ( ON ?auto_116923 ?auto_116924 ) ( ON ?auto_116925 ?auto_116923 ) ( not ( = ?auto_116921 ?auto_116924 ) ) ( not ( = ?auto_116921 ?auto_116923 ) ) ( not ( = ?auto_116921 ?auto_116925 ) ) ( not ( = ?auto_116921 ?auto_116920 ) ) ( not ( = ?auto_116921 ?auto_116919 ) ) ( not ( = ?auto_116921 ?auto_116918 ) ) ( not ( = ?auto_116924 ?auto_116923 ) ) ( not ( = ?auto_116924 ?auto_116925 ) ) ( not ( = ?auto_116924 ?auto_116920 ) ) ( not ( = ?auto_116924 ?auto_116919 ) ) ( not ( = ?auto_116924 ?auto_116918 ) ) ( not ( = ?auto_116923 ?auto_116925 ) ) ( not ( = ?auto_116923 ?auto_116920 ) ) ( not ( = ?auto_116923 ?auto_116919 ) ) ( not ( = ?auto_116923 ?auto_116918 ) ) ( not ( = ?auto_116925 ?auto_116920 ) ) ( not ( = ?auto_116925 ?auto_116919 ) ) ( not ( = ?auto_116925 ?auto_116918 ) ) ( ON ?auto_116918 ?auto_116922 ) ( not ( = ?auto_116918 ?auto_116922 ) ) ( not ( = ?auto_116919 ?auto_116922 ) ) ( not ( = ?auto_116920 ?auto_116922 ) ) ( not ( = ?auto_116921 ?auto_116922 ) ) ( not ( = ?auto_116924 ?auto_116922 ) ) ( not ( = ?auto_116923 ?auto_116922 ) ) ( not ( = ?auto_116925 ?auto_116922 ) ) ( ON ?auto_116919 ?auto_116918 ) ( ON-TABLE ?auto_116922 ) ( CLEAR ?auto_116925 ) ( ON ?auto_116920 ?auto_116919 ) ( CLEAR ?auto_116920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_116922 ?auto_116918 ?auto_116919 )
      ( MAKE-2PILE ?auto_116918 ?auto_116919 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_116926 - BLOCK
      ?auto_116927 - BLOCK
    )
    :vars
    (
      ?auto_116930 - BLOCK
      ?auto_116932 - BLOCK
      ?auto_116931 - BLOCK
      ?auto_116933 - BLOCK
      ?auto_116929 - BLOCK
      ?auto_116928 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116926 ?auto_116927 ) ) ( not ( = ?auto_116926 ?auto_116930 ) ) ( not ( = ?auto_116927 ?auto_116930 ) ) ( ON-TABLE ?auto_116932 ) ( ON ?auto_116931 ?auto_116932 ) ( ON ?auto_116933 ?auto_116931 ) ( not ( = ?auto_116932 ?auto_116931 ) ) ( not ( = ?auto_116932 ?auto_116933 ) ) ( not ( = ?auto_116932 ?auto_116929 ) ) ( not ( = ?auto_116932 ?auto_116930 ) ) ( not ( = ?auto_116932 ?auto_116927 ) ) ( not ( = ?auto_116932 ?auto_116926 ) ) ( not ( = ?auto_116931 ?auto_116933 ) ) ( not ( = ?auto_116931 ?auto_116929 ) ) ( not ( = ?auto_116931 ?auto_116930 ) ) ( not ( = ?auto_116931 ?auto_116927 ) ) ( not ( = ?auto_116931 ?auto_116926 ) ) ( not ( = ?auto_116933 ?auto_116929 ) ) ( not ( = ?auto_116933 ?auto_116930 ) ) ( not ( = ?auto_116933 ?auto_116927 ) ) ( not ( = ?auto_116933 ?auto_116926 ) ) ( not ( = ?auto_116929 ?auto_116930 ) ) ( not ( = ?auto_116929 ?auto_116927 ) ) ( not ( = ?auto_116929 ?auto_116926 ) ) ( ON ?auto_116926 ?auto_116928 ) ( not ( = ?auto_116926 ?auto_116928 ) ) ( not ( = ?auto_116927 ?auto_116928 ) ) ( not ( = ?auto_116930 ?auto_116928 ) ) ( not ( = ?auto_116932 ?auto_116928 ) ) ( not ( = ?auto_116931 ?auto_116928 ) ) ( not ( = ?auto_116933 ?auto_116928 ) ) ( not ( = ?auto_116929 ?auto_116928 ) ) ( ON ?auto_116927 ?auto_116926 ) ( ON-TABLE ?auto_116928 ) ( ON ?auto_116930 ?auto_116927 ) ( CLEAR ?auto_116930 ) ( HOLDING ?auto_116929 ) ( CLEAR ?auto_116933 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_116932 ?auto_116931 ?auto_116933 ?auto_116929 )
      ( MAKE-2PILE ?auto_116926 ?auto_116927 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_116934 - BLOCK
      ?auto_116935 - BLOCK
    )
    :vars
    (
      ?auto_116936 - BLOCK
      ?auto_116940 - BLOCK
      ?auto_116937 - BLOCK
      ?auto_116939 - BLOCK
      ?auto_116941 - BLOCK
      ?auto_116938 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116934 ?auto_116935 ) ) ( not ( = ?auto_116934 ?auto_116936 ) ) ( not ( = ?auto_116935 ?auto_116936 ) ) ( ON-TABLE ?auto_116940 ) ( ON ?auto_116937 ?auto_116940 ) ( ON ?auto_116939 ?auto_116937 ) ( not ( = ?auto_116940 ?auto_116937 ) ) ( not ( = ?auto_116940 ?auto_116939 ) ) ( not ( = ?auto_116940 ?auto_116941 ) ) ( not ( = ?auto_116940 ?auto_116936 ) ) ( not ( = ?auto_116940 ?auto_116935 ) ) ( not ( = ?auto_116940 ?auto_116934 ) ) ( not ( = ?auto_116937 ?auto_116939 ) ) ( not ( = ?auto_116937 ?auto_116941 ) ) ( not ( = ?auto_116937 ?auto_116936 ) ) ( not ( = ?auto_116937 ?auto_116935 ) ) ( not ( = ?auto_116937 ?auto_116934 ) ) ( not ( = ?auto_116939 ?auto_116941 ) ) ( not ( = ?auto_116939 ?auto_116936 ) ) ( not ( = ?auto_116939 ?auto_116935 ) ) ( not ( = ?auto_116939 ?auto_116934 ) ) ( not ( = ?auto_116941 ?auto_116936 ) ) ( not ( = ?auto_116941 ?auto_116935 ) ) ( not ( = ?auto_116941 ?auto_116934 ) ) ( ON ?auto_116934 ?auto_116938 ) ( not ( = ?auto_116934 ?auto_116938 ) ) ( not ( = ?auto_116935 ?auto_116938 ) ) ( not ( = ?auto_116936 ?auto_116938 ) ) ( not ( = ?auto_116940 ?auto_116938 ) ) ( not ( = ?auto_116937 ?auto_116938 ) ) ( not ( = ?auto_116939 ?auto_116938 ) ) ( not ( = ?auto_116941 ?auto_116938 ) ) ( ON ?auto_116935 ?auto_116934 ) ( ON-TABLE ?auto_116938 ) ( ON ?auto_116936 ?auto_116935 ) ( CLEAR ?auto_116939 ) ( ON ?auto_116941 ?auto_116936 ) ( CLEAR ?auto_116941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_116938 ?auto_116934 ?auto_116935 ?auto_116936 )
      ( MAKE-2PILE ?auto_116934 ?auto_116935 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_116942 - BLOCK
      ?auto_116943 - BLOCK
    )
    :vars
    (
      ?auto_116945 - BLOCK
      ?auto_116949 - BLOCK
      ?auto_116947 - BLOCK
      ?auto_116946 - BLOCK
      ?auto_116944 - BLOCK
      ?auto_116948 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116942 ?auto_116943 ) ) ( not ( = ?auto_116942 ?auto_116945 ) ) ( not ( = ?auto_116943 ?auto_116945 ) ) ( ON-TABLE ?auto_116949 ) ( ON ?auto_116947 ?auto_116949 ) ( not ( = ?auto_116949 ?auto_116947 ) ) ( not ( = ?auto_116949 ?auto_116946 ) ) ( not ( = ?auto_116949 ?auto_116944 ) ) ( not ( = ?auto_116949 ?auto_116945 ) ) ( not ( = ?auto_116949 ?auto_116943 ) ) ( not ( = ?auto_116949 ?auto_116942 ) ) ( not ( = ?auto_116947 ?auto_116946 ) ) ( not ( = ?auto_116947 ?auto_116944 ) ) ( not ( = ?auto_116947 ?auto_116945 ) ) ( not ( = ?auto_116947 ?auto_116943 ) ) ( not ( = ?auto_116947 ?auto_116942 ) ) ( not ( = ?auto_116946 ?auto_116944 ) ) ( not ( = ?auto_116946 ?auto_116945 ) ) ( not ( = ?auto_116946 ?auto_116943 ) ) ( not ( = ?auto_116946 ?auto_116942 ) ) ( not ( = ?auto_116944 ?auto_116945 ) ) ( not ( = ?auto_116944 ?auto_116943 ) ) ( not ( = ?auto_116944 ?auto_116942 ) ) ( ON ?auto_116942 ?auto_116948 ) ( not ( = ?auto_116942 ?auto_116948 ) ) ( not ( = ?auto_116943 ?auto_116948 ) ) ( not ( = ?auto_116945 ?auto_116948 ) ) ( not ( = ?auto_116949 ?auto_116948 ) ) ( not ( = ?auto_116947 ?auto_116948 ) ) ( not ( = ?auto_116946 ?auto_116948 ) ) ( not ( = ?auto_116944 ?auto_116948 ) ) ( ON ?auto_116943 ?auto_116942 ) ( ON-TABLE ?auto_116948 ) ( ON ?auto_116945 ?auto_116943 ) ( ON ?auto_116944 ?auto_116945 ) ( CLEAR ?auto_116944 ) ( HOLDING ?auto_116946 ) ( CLEAR ?auto_116947 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_116949 ?auto_116947 ?auto_116946 )
      ( MAKE-2PILE ?auto_116942 ?auto_116943 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_116950 - BLOCK
      ?auto_116951 - BLOCK
    )
    :vars
    (
      ?auto_116957 - BLOCK
      ?auto_116956 - BLOCK
      ?auto_116954 - BLOCK
      ?auto_116952 - BLOCK
      ?auto_116953 - BLOCK
      ?auto_116955 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116950 ?auto_116951 ) ) ( not ( = ?auto_116950 ?auto_116957 ) ) ( not ( = ?auto_116951 ?auto_116957 ) ) ( ON-TABLE ?auto_116956 ) ( ON ?auto_116954 ?auto_116956 ) ( not ( = ?auto_116956 ?auto_116954 ) ) ( not ( = ?auto_116956 ?auto_116952 ) ) ( not ( = ?auto_116956 ?auto_116953 ) ) ( not ( = ?auto_116956 ?auto_116957 ) ) ( not ( = ?auto_116956 ?auto_116951 ) ) ( not ( = ?auto_116956 ?auto_116950 ) ) ( not ( = ?auto_116954 ?auto_116952 ) ) ( not ( = ?auto_116954 ?auto_116953 ) ) ( not ( = ?auto_116954 ?auto_116957 ) ) ( not ( = ?auto_116954 ?auto_116951 ) ) ( not ( = ?auto_116954 ?auto_116950 ) ) ( not ( = ?auto_116952 ?auto_116953 ) ) ( not ( = ?auto_116952 ?auto_116957 ) ) ( not ( = ?auto_116952 ?auto_116951 ) ) ( not ( = ?auto_116952 ?auto_116950 ) ) ( not ( = ?auto_116953 ?auto_116957 ) ) ( not ( = ?auto_116953 ?auto_116951 ) ) ( not ( = ?auto_116953 ?auto_116950 ) ) ( ON ?auto_116950 ?auto_116955 ) ( not ( = ?auto_116950 ?auto_116955 ) ) ( not ( = ?auto_116951 ?auto_116955 ) ) ( not ( = ?auto_116957 ?auto_116955 ) ) ( not ( = ?auto_116956 ?auto_116955 ) ) ( not ( = ?auto_116954 ?auto_116955 ) ) ( not ( = ?auto_116952 ?auto_116955 ) ) ( not ( = ?auto_116953 ?auto_116955 ) ) ( ON ?auto_116951 ?auto_116950 ) ( ON-TABLE ?auto_116955 ) ( ON ?auto_116957 ?auto_116951 ) ( ON ?auto_116953 ?auto_116957 ) ( CLEAR ?auto_116954 ) ( ON ?auto_116952 ?auto_116953 ) ( CLEAR ?auto_116952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_116955 ?auto_116950 ?auto_116951 ?auto_116957 ?auto_116953 )
      ( MAKE-2PILE ?auto_116950 ?auto_116951 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_116958 - BLOCK
      ?auto_116959 - BLOCK
    )
    :vars
    (
      ?auto_116960 - BLOCK
      ?auto_116964 - BLOCK
      ?auto_116961 - BLOCK
      ?auto_116962 - BLOCK
      ?auto_116963 - BLOCK
      ?auto_116965 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116958 ?auto_116959 ) ) ( not ( = ?auto_116958 ?auto_116960 ) ) ( not ( = ?auto_116959 ?auto_116960 ) ) ( ON-TABLE ?auto_116964 ) ( not ( = ?auto_116964 ?auto_116961 ) ) ( not ( = ?auto_116964 ?auto_116962 ) ) ( not ( = ?auto_116964 ?auto_116963 ) ) ( not ( = ?auto_116964 ?auto_116960 ) ) ( not ( = ?auto_116964 ?auto_116959 ) ) ( not ( = ?auto_116964 ?auto_116958 ) ) ( not ( = ?auto_116961 ?auto_116962 ) ) ( not ( = ?auto_116961 ?auto_116963 ) ) ( not ( = ?auto_116961 ?auto_116960 ) ) ( not ( = ?auto_116961 ?auto_116959 ) ) ( not ( = ?auto_116961 ?auto_116958 ) ) ( not ( = ?auto_116962 ?auto_116963 ) ) ( not ( = ?auto_116962 ?auto_116960 ) ) ( not ( = ?auto_116962 ?auto_116959 ) ) ( not ( = ?auto_116962 ?auto_116958 ) ) ( not ( = ?auto_116963 ?auto_116960 ) ) ( not ( = ?auto_116963 ?auto_116959 ) ) ( not ( = ?auto_116963 ?auto_116958 ) ) ( ON ?auto_116958 ?auto_116965 ) ( not ( = ?auto_116958 ?auto_116965 ) ) ( not ( = ?auto_116959 ?auto_116965 ) ) ( not ( = ?auto_116960 ?auto_116965 ) ) ( not ( = ?auto_116964 ?auto_116965 ) ) ( not ( = ?auto_116961 ?auto_116965 ) ) ( not ( = ?auto_116962 ?auto_116965 ) ) ( not ( = ?auto_116963 ?auto_116965 ) ) ( ON ?auto_116959 ?auto_116958 ) ( ON-TABLE ?auto_116965 ) ( ON ?auto_116960 ?auto_116959 ) ( ON ?auto_116963 ?auto_116960 ) ( ON ?auto_116962 ?auto_116963 ) ( CLEAR ?auto_116962 ) ( HOLDING ?auto_116961 ) ( CLEAR ?auto_116964 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_116964 ?auto_116961 )
      ( MAKE-2PILE ?auto_116958 ?auto_116959 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_116966 - BLOCK
      ?auto_116967 - BLOCK
    )
    :vars
    (
      ?auto_116970 - BLOCK
      ?auto_116972 - BLOCK
      ?auto_116973 - BLOCK
      ?auto_116968 - BLOCK
      ?auto_116971 - BLOCK
      ?auto_116969 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116966 ?auto_116967 ) ) ( not ( = ?auto_116966 ?auto_116970 ) ) ( not ( = ?auto_116967 ?auto_116970 ) ) ( ON-TABLE ?auto_116972 ) ( not ( = ?auto_116972 ?auto_116973 ) ) ( not ( = ?auto_116972 ?auto_116968 ) ) ( not ( = ?auto_116972 ?auto_116971 ) ) ( not ( = ?auto_116972 ?auto_116970 ) ) ( not ( = ?auto_116972 ?auto_116967 ) ) ( not ( = ?auto_116972 ?auto_116966 ) ) ( not ( = ?auto_116973 ?auto_116968 ) ) ( not ( = ?auto_116973 ?auto_116971 ) ) ( not ( = ?auto_116973 ?auto_116970 ) ) ( not ( = ?auto_116973 ?auto_116967 ) ) ( not ( = ?auto_116973 ?auto_116966 ) ) ( not ( = ?auto_116968 ?auto_116971 ) ) ( not ( = ?auto_116968 ?auto_116970 ) ) ( not ( = ?auto_116968 ?auto_116967 ) ) ( not ( = ?auto_116968 ?auto_116966 ) ) ( not ( = ?auto_116971 ?auto_116970 ) ) ( not ( = ?auto_116971 ?auto_116967 ) ) ( not ( = ?auto_116971 ?auto_116966 ) ) ( ON ?auto_116966 ?auto_116969 ) ( not ( = ?auto_116966 ?auto_116969 ) ) ( not ( = ?auto_116967 ?auto_116969 ) ) ( not ( = ?auto_116970 ?auto_116969 ) ) ( not ( = ?auto_116972 ?auto_116969 ) ) ( not ( = ?auto_116973 ?auto_116969 ) ) ( not ( = ?auto_116968 ?auto_116969 ) ) ( not ( = ?auto_116971 ?auto_116969 ) ) ( ON ?auto_116967 ?auto_116966 ) ( ON-TABLE ?auto_116969 ) ( ON ?auto_116970 ?auto_116967 ) ( ON ?auto_116971 ?auto_116970 ) ( ON ?auto_116968 ?auto_116971 ) ( CLEAR ?auto_116972 ) ( ON ?auto_116973 ?auto_116968 ) ( CLEAR ?auto_116973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_116969 ?auto_116966 ?auto_116967 ?auto_116970 ?auto_116971 ?auto_116968 )
      ( MAKE-2PILE ?auto_116966 ?auto_116967 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_116974 - BLOCK
      ?auto_116975 - BLOCK
    )
    :vars
    (
      ?auto_116980 - BLOCK
      ?auto_116977 - BLOCK
      ?auto_116978 - BLOCK
      ?auto_116979 - BLOCK
      ?auto_116976 - BLOCK
      ?auto_116981 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116974 ?auto_116975 ) ) ( not ( = ?auto_116974 ?auto_116980 ) ) ( not ( = ?auto_116975 ?auto_116980 ) ) ( not ( = ?auto_116977 ?auto_116978 ) ) ( not ( = ?auto_116977 ?auto_116979 ) ) ( not ( = ?auto_116977 ?auto_116976 ) ) ( not ( = ?auto_116977 ?auto_116980 ) ) ( not ( = ?auto_116977 ?auto_116975 ) ) ( not ( = ?auto_116977 ?auto_116974 ) ) ( not ( = ?auto_116978 ?auto_116979 ) ) ( not ( = ?auto_116978 ?auto_116976 ) ) ( not ( = ?auto_116978 ?auto_116980 ) ) ( not ( = ?auto_116978 ?auto_116975 ) ) ( not ( = ?auto_116978 ?auto_116974 ) ) ( not ( = ?auto_116979 ?auto_116976 ) ) ( not ( = ?auto_116979 ?auto_116980 ) ) ( not ( = ?auto_116979 ?auto_116975 ) ) ( not ( = ?auto_116979 ?auto_116974 ) ) ( not ( = ?auto_116976 ?auto_116980 ) ) ( not ( = ?auto_116976 ?auto_116975 ) ) ( not ( = ?auto_116976 ?auto_116974 ) ) ( ON ?auto_116974 ?auto_116981 ) ( not ( = ?auto_116974 ?auto_116981 ) ) ( not ( = ?auto_116975 ?auto_116981 ) ) ( not ( = ?auto_116980 ?auto_116981 ) ) ( not ( = ?auto_116977 ?auto_116981 ) ) ( not ( = ?auto_116978 ?auto_116981 ) ) ( not ( = ?auto_116979 ?auto_116981 ) ) ( not ( = ?auto_116976 ?auto_116981 ) ) ( ON ?auto_116975 ?auto_116974 ) ( ON-TABLE ?auto_116981 ) ( ON ?auto_116980 ?auto_116975 ) ( ON ?auto_116976 ?auto_116980 ) ( ON ?auto_116979 ?auto_116976 ) ( ON ?auto_116978 ?auto_116979 ) ( CLEAR ?auto_116978 ) ( HOLDING ?auto_116977 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_116977 )
      ( MAKE-2PILE ?auto_116974 ?auto_116975 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_116982 - BLOCK
      ?auto_116983 - BLOCK
    )
    :vars
    (
      ?auto_116984 - BLOCK
      ?auto_116987 - BLOCK
      ?auto_116986 - BLOCK
      ?auto_116989 - BLOCK
      ?auto_116985 - BLOCK
      ?auto_116988 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116982 ?auto_116983 ) ) ( not ( = ?auto_116982 ?auto_116984 ) ) ( not ( = ?auto_116983 ?auto_116984 ) ) ( not ( = ?auto_116987 ?auto_116986 ) ) ( not ( = ?auto_116987 ?auto_116989 ) ) ( not ( = ?auto_116987 ?auto_116985 ) ) ( not ( = ?auto_116987 ?auto_116984 ) ) ( not ( = ?auto_116987 ?auto_116983 ) ) ( not ( = ?auto_116987 ?auto_116982 ) ) ( not ( = ?auto_116986 ?auto_116989 ) ) ( not ( = ?auto_116986 ?auto_116985 ) ) ( not ( = ?auto_116986 ?auto_116984 ) ) ( not ( = ?auto_116986 ?auto_116983 ) ) ( not ( = ?auto_116986 ?auto_116982 ) ) ( not ( = ?auto_116989 ?auto_116985 ) ) ( not ( = ?auto_116989 ?auto_116984 ) ) ( not ( = ?auto_116989 ?auto_116983 ) ) ( not ( = ?auto_116989 ?auto_116982 ) ) ( not ( = ?auto_116985 ?auto_116984 ) ) ( not ( = ?auto_116985 ?auto_116983 ) ) ( not ( = ?auto_116985 ?auto_116982 ) ) ( ON ?auto_116982 ?auto_116988 ) ( not ( = ?auto_116982 ?auto_116988 ) ) ( not ( = ?auto_116983 ?auto_116988 ) ) ( not ( = ?auto_116984 ?auto_116988 ) ) ( not ( = ?auto_116987 ?auto_116988 ) ) ( not ( = ?auto_116986 ?auto_116988 ) ) ( not ( = ?auto_116989 ?auto_116988 ) ) ( not ( = ?auto_116985 ?auto_116988 ) ) ( ON ?auto_116983 ?auto_116982 ) ( ON-TABLE ?auto_116988 ) ( ON ?auto_116984 ?auto_116983 ) ( ON ?auto_116985 ?auto_116984 ) ( ON ?auto_116989 ?auto_116985 ) ( ON ?auto_116986 ?auto_116989 ) ( ON ?auto_116987 ?auto_116986 ) ( CLEAR ?auto_116987 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_116988 ?auto_116982 ?auto_116983 ?auto_116984 ?auto_116985 ?auto_116989 ?auto_116986 )
      ( MAKE-2PILE ?auto_116982 ?auto_116983 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_116994 - BLOCK
      ?auto_116995 - BLOCK
      ?auto_116996 - BLOCK
      ?auto_116997 - BLOCK
    )
    :vars
    (
      ?auto_116998 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116998 ?auto_116997 ) ( CLEAR ?auto_116998 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_116994 ) ( ON ?auto_116995 ?auto_116994 ) ( ON ?auto_116996 ?auto_116995 ) ( ON ?auto_116997 ?auto_116996 ) ( not ( = ?auto_116994 ?auto_116995 ) ) ( not ( = ?auto_116994 ?auto_116996 ) ) ( not ( = ?auto_116994 ?auto_116997 ) ) ( not ( = ?auto_116994 ?auto_116998 ) ) ( not ( = ?auto_116995 ?auto_116996 ) ) ( not ( = ?auto_116995 ?auto_116997 ) ) ( not ( = ?auto_116995 ?auto_116998 ) ) ( not ( = ?auto_116996 ?auto_116997 ) ) ( not ( = ?auto_116996 ?auto_116998 ) ) ( not ( = ?auto_116997 ?auto_116998 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_116998 ?auto_116997 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_116999 - BLOCK
      ?auto_117000 - BLOCK
      ?auto_117001 - BLOCK
      ?auto_117002 - BLOCK
    )
    :vars
    (
      ?auto_117003 - BLOCK
      ?auto_117004 - BLOCK
      ?auto_117005 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117003 ?auto_117002 ) ( CLEAR ?auto_117003 ) ( ON-TABLE ?auto_116999 ) ( ON ?auto_117000 ?auto_116999 ) ( ON ?auto_117001 ?auto_117000 ) ( ON ?auto_117002 ?auto_117001 ) ( not ( = ?auto_116999 ?auto_117000 ) ) ( not ( = ?auto_116999 ?auto_117001 ) ) ( not ( = ?auto_116999 ?auto_117002 ) ) ( not ( = ?auto_116999 ?auto_117003 ) ) ( not ( = ?auto_117000 ?auto_117001 ) ) ( not ( = ?auto_117000 ?auto_117002 ) ) ( not ( = ?auto_117000 ?auto_117003 ) ) ( not ( = ?auto_117001 ?auto_117002 ) ) ( not ( = ?auto_117001 ?auto_117003 ) ) ( not ( = ?auto_117002 ?auto_117003 ) ) ( HOLDING ?auto_117004 ) ( CLEAR ?auto_117005 ) ( not ( = ?auto_116999 ?auto_117004 ) ) ( not ( = ?auto_116999 ?auto_117005 ) ) ( not ( = ?auto_117000 ?auto_117004 ) ) ( not ( = ?auto_117000 ?auto_117005 ) ) ( not ( = ?auto_117001 ?auto_117004 ) ) ( not ( = ?auto_117001 ?auto_117005 ) ) ( not ( = ?auto_117002 ?auto_117004 ) ) ( not ( = ?auto_117002 ?auto_117005 ) ) ( not ( = ?auto_117003 ?auto_117004 ) ) ( not ( = ?auto_117003 ?auto_117005 ) ) ( not ( = ?auto_117004 ?auto_117005 ) ) )
    :subtasks
    ( ( !STACK ?auto_117004 ?auto_117005 )
      ( MAKE-4PILE ?auto_116999 ?auto_117000 ?auto_117001 ?auto_117002 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117006 - BLOCK
      ?auto_117007 - BLOCK
      ?auto_117008 - BLOCK
      ?auto_117009 - BLOCK
    )
    :vars
    (
      ?auto_117012 - BLOCK
      ?auto_117011 - BLOCK
      ?auto_117010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117012 ?auto_117009 ) ( ON-TABLE ?auto_117006 ) ( ON ?auto_117007 ?auto_117006 ) ( ON ?auto_117008 ?auto_117007 ) ( ON ?auto_117009 ?auto_117008 ) ( not ( = ?auto_117006 ?auto_117007 ) ) ( not ( = ?auto_117006 ?auto_117008 ) ) ( not ( = ?auto_117006 ?auto_117009 ) ) ( not ( = ?auto_117006 ?auto_117012 ) ) ( not ( = ?auto_117007 ?auto_117008 ) ) ( not ( = ?auto_117007 ?auto_117009 ) ) ( not ( = ?auto_117007 ?auto_117012 ) ) ( not ( = ?auto_117008 ?auto_117009 ) ) ( not ( = ?auto_117008 ?auto_117012 ) ) ( not ( = ?auto_117009 ?auto_117012 ) ) ( CLEAR ?auto_117011 ) ( not ( = ?auto_117006 ?auto_117010 ) ) ( not ( = ?auto_117006 ?auto_117011 ) ) ( not ( = ?auto_117007 ?auto_117010 ) ) ( not ( = ?auto_117007 ?auto_117011 ) ) ( not ( = ?auto_117008 ?auto_117010 ) ) ( not ( = ?auto_117008 ?auto_117011 ) ) ( not ( = ?auto_117009 ?auto_117010 ) ) ( not ( = ?auto_117009 ?auto_117011 ) ) ( not ( = ?auto_117012 ?auto_117010 ) ) ( not ( = ?auto_117012 ?auto_117011 ) ) ( not ( = ?auto_117010 ?auto_117011 ) ) ( ON ?auto_117010 ?auto_117012 ) ( CLEAR ?auto_117010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_117006 ?auto_117007 ?auto_117008 ?auto_117009 ?auto_117012 )
      ( MAKE-4PILE ?auto_117006 ?auto_117007 ?auto_117008 ?auto_117009 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117013 - BLOCK
      ?auto_117014 - BLOCK
      ?auto_117015 - BLOCK
      ?auto_117016 - BLOCK
    )
    :vars
    (
      ?auto_117019 - BLOCK
      ?auto_117018 - BLOCK
      ?auto_117017 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117019 ?auto_117016 ) ( ON-TABLE ?auto_117013 ) ( ON ?auto_117014 ?auto_117013 ) ( ON ?auto_117015 ?auto_117014 ) ( ON ?auto_117016 ?auto_117015 ) ( not ( = ?auto_117013 ?auto_117014 ) ) ( not ( = ?auto_117013 ?auto_117015 ) ) ( not ( = ?auto_117013 ?auto_117016 ) ) ( not ( = ?auto_117013 ?auto_117019 ) ) ( not ( = ?auto_117014 ?auto_117015 ) ) ( not ( = ?auto_117014 ?auto_117016 ) ) ( not ( = ?auto_117014 ?auto_117019 ) ) ( not ( = ?auto_117015 ?auto_117016 ) ) ( not ( = ?auto_117015 ?auto_117019 ) ) ( not ( = ?auto_117016 ?auto_117019 ) ) ( not ( = ?auto_117013 ?auto_117018 ) ) ( not ( = ?auto_117013 ?auto_117017 ) ) ( not ( = ?auto_117014 ?auto_117018 ) ) ( not ( = ?auto_117014 ?auto_117017 ) ) ( not ( = ?auto_117015 ?auto_117018 ) ) ( not ( = ?auto_117015 ?auto_117017 ) ) ( not ( = ?auto_117016 ?auto_117018 ) ) ( not ( = ?auto_117016 ?auto_117017 ) ) ( not ( = ?auto_117019 ?auto_117018 ) ) ( not ( = ?auto_117019 ?auto_117017 ) ) ( not ( = ?auto_117018 ?auto_117017 ) ) ( ON ?auto_117018 ?auto_117019 ) ( CLEAR ?auto_117018 ) ( HOLDING ?auto_117017 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_117017 )
      ( MAKE-4PILE ?auto_117013 ?auto_117014 ?auto_117015 ?auto_117016 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117020 - BLOCK
      ?auto_117021 - BLOCK
      ?auto_117022 - BLOCK
      ?auto_117023 - BLOCK
    )
    :vars
    (
      ?auto_117025 - BLOCK
      ?auto_117024 - BLOCK
      ?auto_117026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117025 ?auto_117023 ) ( ON-TABLE ?auto_117020 ) ( ON ?auto_117021 ?auto_117020 ) ( ON ?auto_117022 ?auto_117021 ) ( ON ?auto_117023 ?auto_117022 ) ( not ( = ?auto_117020 ?auto_117021 ) ) ( not ( = ?auto_117020 ?auto_117022 ) ) ( not ( = ?auto_117020 ?auto_117023 ) ) ( not ( = ?auto_117020 ?auto_117025 ) ) ( not ( = ?auto_117021 ?auto_117022 ) ) ( not ( = ?auto_117021 ?auto_117023 ) ) ( not ( = ?auto_117021 ?auto_117025 ) ) ( not ( = ?auto_117022 ?auto_117023 ) ) ( not ( = ?auto_117022 ?auto_117025 ) ) ( not ( = ?auto_117023 ?auto_117025 ) ) ( not ( = ?auto_117020 ?auto_117024 ) ) ( not ( = ?auto_117020 ?auto_117026 ) ) ( not ( = ?auto_117021 ?auto_117024 ) ) ( not ( = ?auto_117021 ?auto_117026 ) ) ( not ( = ?auto_117022 ?auto_117024 ) ) ( not ( = ?auto_117022 ?auto_117026 ) ) ( not ( = ?auto_117023 ?auto_117024 ) ) ( not ( = ?auto_117023 ?auto_117026 ) ) ( not ( = ?auto_117025 ?auto_117024 ) ) ( not ( = ?auto_117025 ?auto_117026 ) ) ( not ( = ?auto_117024 ?auto_117026 ) ) ( ON ?auto_117024 ?auto_117025 ) ( ON ?auto_117026 ?auto_117024 ) ( CLEAR ?auto_117026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_117020 ?auto_117021 ?auto_117022 ?auto_117023 ?auto_117025 ?auto_117024 )
      ( MAKE-4PILE ?auto_117020 ?auto_117021 ?auto_117022 ?auto_117023 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117027 - BLOCK
      ?auto_117028 - BLOCK
      ?auto_117029 - BLOCK
      ?auto_117030 - BLOCK
    )
    :vars
    (
      ?auto_117031 - BLOCK
      ?auto_117032 - BLOCK
      ?auto_117033 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117031 ?auto_117030 ) ( ON-TABLE ?auto_117027 ) ( ON ?auto_117028 ?auto_117027 ) ( ON ?auto_117029 ?auto_117028 ) ( ON ?auto_117030 ?auto_117029 ) ( not ( = ?auto_117027 ?auto_117028 ) ) ( not ( = ?auto_117027 ?auto_117029 ) ) ( not ( = ?auto_117027 ?auto_117030 ) ) ( not ( = ?auto_117027 ?auto_117031 ) ) ( not ( = ?auto_117028 ?auto_117029 ) ) ( not ( = ?auto_117028 ?auto_117030 ) ) ( not ( = ?auto_117028 ?auto_117031 ) ) ( not ( = ?auto_117029 ?auto_117030 ) ) ( not ( = ?auto_117029 ?auto_117031 ) ) ( not ( = ?auto_117030 ?auto_117031 ) ) ( not ( = ?auto_117027 ?auto_117032 ) ) ( not ( = ?auto_117027 ?auto_117033 ) ) ( not ( = ?auto_117028 ?auto_117032 ) ) ( not ( = ?auto_117028 ?auto_117033 ) ) ( not ( = ?auto_117029 ?auto_117032 ) ) ( not ( = ?auto_117029 ?auto_117033 ) ) ( not ( = ?auto_117030 ?auto_117032 ) ) ( not ( = ?auto_117030 ?auto_117033 ) ) ( not ( = ?auto_117031 ?auto_117032 ) ) ( not ( = ?auto_117031 ?auto_117033 ) ) ( not ( = ?auto_117032 ?auto_117033 ) ) ( ON ?auto_117032 ?auto_117031 ) ( HOLDING ?auto_117033 ) ( CLEAR ?auto_117032 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_117027 ?auto_117028 ?auto_117029 ?auto_117030 ?auto_117031 ?auto_117032 ?auto_117033 )
      ( MAKE-4PILE ?auto_117027 ?auto_117028 ?auto_117029 ?auto_117030 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117034 - BLOCK
      ?auto_117035 - BLOCK
      ?auto_117036 - BLOCK
      ?auto_117037 - BLOCK
    )
    :vars
    (
      ?auto_117039 - BLOCK
      ?auto_117040 - BLOCK
      ?auto_117038 - BLOCK
      ?auto_117041 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117039 ?auto_117037 ) ( ON-TABLE ?auto_117034 ) ( ON ?auto_117035 ?auto_117034 ) ( ON ?auto_117036 ?auto_117035 ) ( ON ?auto_117037 ?auto_117036 ) ( not ( = ?auto_117034 ?auto_117035 ) ) ( not ( = ?auto_117034 ?auto_117036 ) ) ( not ( = ?auto_117034 ?auto_117037 ) ) ( not ( = ?auto_117034 ?auto_117039 ) ) ( not ( = ?auto_117035 ?auto_117036 ) ) ( not ( = ?auto_117035 ?auto_117037 ) ) ( not ( = ?auto_117035 ?auto_117039 ) ) ( not ( = ?auto_117036 ?auto_117037 ) ) ( not ( = ?auto_117036 ?auto_117039 ) ) ( not ( = ?auto_117037 ?auto_117039 ) ) ( not ( = ?auto_117034 ?auto_117040 ) ) ( not ( = ?auto_117034 ?auto_117038 ) ) ( not ( = ?auto_117035 ?auto_117040 ) ) ( not ( = ?auto_117035 ?auto_117038 ) ) ( not ( = ?auto_117036 ?auto_117040 ) ) ( not ( = ?auto_117036 ?auto_117038 ) ) ( not ( = ?auto_117037 ?auto_117040 ) ) ( not ( = ?auto_117037 ?auto_117038 ) ) ( not ( = ?auto_117039 ?auto_117040 ) ) ( not ( = ?auto_117039 ?auto_117038 ) ) ( not ( = ?auto_117040 ?auto_117038 ) ) ( ON ?auto_117040 ?auto_117039 ) ( CLEAR ?auto_117040 ) ( ON ?auto_117038 ?auto_117041 ) ( CLEAR ?auto_117038 ) ( HAND-EMPTY ) ( not ( = ?auto_117034 ?auto_117041 ) ) ( not ( = ?auto_117035 ?auto_117041 ) ) ( not ( = ?auto_117036 ?auto_117041 ) ) ( not ( = ?auto_117037 ?auto_117041 ) ) ( not ( = ?auto_117039 ?auto_117041 ) ) ( not ( = ?auto_117040 ?auto_117041 ) ) ( not ( = ?auto_117038 ?auto_117041 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_117038 ?auto_117041 )
      ( MAKE-4PILE ?auto_117034 ?auto_117035 ?auto_117036 ?auto_117037 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117042 - BLOCK
      ?auto_117043 - BLOCK
      ?auto_117044 - BLOCK
      ?auto_117045 - BLOCK
    )
    :vars
    (
      ?auto_117048 - BLOCK
      ?auto_117047 - BLOCK
      ?auto_117049 - BLOCK
      ?auto_117046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117048 ?auto_117045 ) ( ON-TABLE ?auto_117042 ) ( ON ?auto_117043 ?auto_117042 ) ( ON ?auto_117044 ?auto_117043 ) ( ON ?auto_117045 ?auto_117044 ) ( not ( = ?auto_117042 ?auto_117043 ) ) ( not ( = ?auto_117042 ?auto_117044 ) ) ( not ( = ?auto_117042 ?auto_117045 ) ) ( not ( = ?auto_117042 ?auto_117048 ) ) ( not ( = ?auto_117043 ?auto_117044 ) ) ( not ( = ?auto_117043 ?auto_117045 ) ) ( not ( = ?auto_117043 ?auto_117048 ) ) ( not ( = ?auto_117044 ?auto_117045 ) ) ( not ( = ?auto_117044 ?auto_117048 ) ) ( not ( = ?auto_117045 ?auto_117048 ) ) ( not ( = ?auto_117042 ?auto_117047 ) ) ( not ( = ?auto_117042 ?auto_117049 ) ) ( not ( = ?auto_117043 ?auto_117047 ) ) ( not ( = ?auto_117043 ?auto_117049 ) ) ( not ( = ?auto_117044 ?auto_117047 ) ) ( not ( = ?auto_117044 ?auto_117049 ) ) ( not ( = ?auto_117045 ?auto_117047 ) ) ( not ( = ?auto_117045 ?auto_117049 ) ) ( not ( = ?auto_117048 ?auto_117047 ) ) ( not ( = ?auto_117048 ?auto_117049 ) ) ( not ( = ?auto_117047 ?auto_117049 ) ) ( ON ?auto_117049 ?auto_117046 ) ( CLEAR ?auto_117049 ) ( not ( = ?auto_117042 ?auto_117046 ) ) ( not ( = ?auto_117043 ?auto_117046 ) ) ( not ( = ?auto_117044 ?auto_117046 ) ) ( not ( = ?auto_117045 ?auto_117046 ) ) ( not ( = ?auto_117048 ?auto_117046 ) ) ( not ( = ?auto_117047 ?auto_117046 ) ) ( not ( = ?auto_117049 ?auto_117046 ) ) ( HOLDING ?auto_117047 ) ( CLEAR ?auto_117048 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_117042 ?auto_117043 ?auto_117044 ?auto_117045 ?auto_117048 ?auto_117047 )
      ( MAKE-4PILE ?auto_117042 ?auto_117043 ?auto_117044 ?auto_117045 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117050 - BLOCK
      ?auto_117051 - BLOCK
      ?auto_117052 - BLOCK
      ?auto_117053 - BLOCK
    )
    :vars
    (
      ?auto_117056 - BLOCK
      ?auto_117055 - BLOCK
      ?auto_117057 - BLOCK
      ?auto_117054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117056 ?auto_117053 ) ( ON-TABLE ?auto_117050 ) ( ON ?auto_117051 ?auto_117050 ) ( ON ?auto_117052 ?auto_117051 ) ( ON ?auto_117053 ?auto_117052 ) ( not ( = ?auto_117050 ?auto_117051 ) ) ( not ( = ?auto_117050 ?auto_117052 ) ) ( not ( = ?auto_117050 ?auto_117053 ) ) ( not ( = ?auto_117050 ?auto_117056 ) ) ( not ( = ?auto_117051 ?auto_117052 ) ) ( not ( = ?auto_117051 ?auto_117053 ) ) ( not ( = ?auto_117051 ?auto_117056 ) ) ( not ( = ?auto_117052 ?auto_117053 ) ) ( not ( = ?auto_117052 ?auto_117056 ) ) ( not ( = ?auto_117053 ?auto_117056 ) ) ( not ( = ?auto_117050 ?auto_117055 ) ) ( not ( = ?auto_117050 ?auto_117057 ) ) ( not ( = ?auto_117051 ?auto_117055 ) ) ( not ( = ?auto_117051 ?auto_117057 ) ) ( not ( = ?auto_117052 ?auto_117055 ) ) ( not ( = ?auto_117052 ?auto_117057 ) ) ( not ( = ?auto_117053 ?auto_117055 ) ) ( not ( = ?auto_117053 ?auto_117057 ) ) ( not ( = ?auto_117056 ?auto_117055 ) ) ( not ( = ?auto_117056 ?auto_117057 ) ) ( not ( = ?auto_117055 ?auto_117057 ) ) ( ON ?auto_117057 ?auto_117054 ) ( not ( = ?auto_117050 ?auto_117054 ) ) ( not ( = ?auto_117051 ?auto_117054 ) ) ( not ( = ?auto_117052 ?auto_117054 ) ) ( not ( = ?auto_117053 ?auto_117054 ) ) ( not ( = ?auto_117056 ?auto_117054 ) ) ( not ( = ?auto_117055 ?auto_117054 ) ) ( not ( = ?auto_117057 ?auto_117054 ) ) ( CLEAR ?auto_117056 ) ( ON ?auto_117055 ?auto_117057 ) ( CLEAR ?auto_117055 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_117054 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_117054 ?auto_117057 )
      ( MAKE-4PILE ?auto_117050 ?auto_117051 ?auto_117052 ?auto_117053 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117074 - BLOCK
      ?auto_117075 - BLOCK
      ?auto_117076 - BLOCK
      ?auto_117077 - BLOCK
    )
    :vars
    (
      ?auto_117081 - BLOCK
      ?auto_117080 - BLOCK
      ?auto_117078 - BLOCK
      ?auto_117079 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117074 ) ( ON ?auto_117075 ?auto_117074 ) ( ON ?auto_117076 ?auto_117075 ) ( not ( = ?auto_117074 ?auto_117075 ) ) ( not ( = ?auto_117074 ?auto_117076 ) ) ( not ( = ?auto_117074 ?auto_117077 ) ) ( not ( = ?auto_117074 ?auto_117081 ) ) ( not ( = ?auto_117075 ?auto_117076 ) ) ( not ( = ?auto_117075 ?auto_117077 ) ) ( not ( = ?auto_117075 ?auto_117081 ) ) ( not ( = ?auto_117076 ?auto_117077 ) ) ( not ( = ?auto_117076 ?auto_117081 ) ) ( not ( = ?auto_117077 ?auto_117081 ) ) ( not ( = ?auto_117074 ?auto_117080 ) ) ( not ( = ?auto_117074 ?auto_117078 ) ) ( not ( = ?auto_117075 ?auto_117080 ) ) ( not ( = ?auto_117075 ?auto_117078 ) ) ( not ( = ?auto_117076 ?auto_117080 ) ) ( not ( = ?auto_117076 ?auto_117078 ) ) ( not ( = ?auto_117077 ?auto_117080 ) ) ( not ( = ?auto_117077 ?auto_117078 ) ) ( not ( = ?auto_117081 ?auto_117080 ) ) ( not ( = ?auto_117081 ?auto_117078 ) ) ( not ( = ?auto_117080 ?auto_117078 ) ) ( ON ?auto_117078 ?auto_117079 ) ( not ( = ?auto_117074 ?auto_117079 ) ) ( not ( = ?auto_117075 ?auto_117079 ) ) ( not ( = ?auto_117076 ?auto_117079 ) ) ( not ( = ?auto_117077 ?auto_117079 ) ) ( not ( = ?auto_117081 ?auto_117079 ) ) ( not ( = ?auto_117080 ?auto_117079 ) ) ( not ( = ?auto_117078 ?auto_117079 ) ) ( ON ?auto_117080 ?auto_117078 ) ( ON-TABLE ?auto_117079 ) ( ON ?auto_117081 ?auto_117080 ) ( CLEAR ?auto_117081 ) ( HOLDING ?auto_117077 ) ( CLEAR ?auto_117076 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_117074 ?auto_117075 ?auto_117076 ?auto_117077 ?auto_117081 )
      ( MAKE-4PILE ?auto_117074 ?auto_117075 ?auto_117076 ?auto_117077 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117082 - BLOCK
      ?auto_117083 - BLOCK
      ?auto_117084 - BLOCK
      ?auto_117085 - BLOCK
    )
    :vars
    (
      ?auto_117089 - BLOCK
      ?auto_117087 - BLOCK
      ?auto_117088 - BLOCK
      ?auto_117086 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117082 ) ( ON ?auto_117083 ?auto_117082 ) ( ON ?auto_117084 ?auto_117083 ) ( not ( = ?auto_117082 ?auto_117083 ) ) ( not ( = ?auto_117082 ?auto_117084 ) ) ( not ( = ?auto_117082 ?auto_117085 ) ) ( not ( = ?auto_117082 ?auto_117089 ) ) ( not ( = ?auto_117083 ?auto_117084 ) ) ( not ( = ?auto_117083 ?auto_117085 ) ) ( not ( = ?auto_117083 ?auto_117089 ) ) ( not ( = ?auto_117084 ?auto_117085 ) ) ( not ( = ?auto_117084 ?auto_117089 ) ) ( not ( = ?auto_117085 ?auto_117089 ) ) ( not ( = ?auto_117082 ?auto_117087 ) ) ( not ( = ?auto_117082 ?auto_117088 ) ) ( not ( = ?auto_117083 ?auto_117087 ) ) ( not ( = ?auto_117083 ?auto_117088 ) ) ( not ( = ?auto_117084 ?auto_117087 ) ) ( not ( = ?auto_117084 ?auto_117088 ) ) ( not ( = ?auto_117085 ?auto_117087 ) ) ( not ( = ?auto_117085 ?auto_117088 ) ) ( not ( = ?auto_117089 ?auto_117087 ) ) ( not ( = ?auto_117089 ?auto_117088 ) ) ( not ( = ?auto_117087 ?auto_117088 ) ) ( ON ?auto_117088 ?auto_117086 ) ( not ( = ?auto_117082 ?auto_117086 ) ) ( not ( = ?auto_117083 ?auto_117086 ) ) ( not ( = ?auto_117084 ?auto_117086 ) ) ( not ( = ?auto_117085 ?auto_117086 ) ) ( not ( = ?auto_117089 ?auto_117086 ) ) ( not ( = ?auto_117087 ?auto_117086 ) ) ( not ( = ?auto_117088 ?auto_117086 ) ) ( ON ?auto_117087 ?auto_117088 ) ( ON-TABLE ?auto_117086 ) ( ON ?auto_117089 ?auto_117087 ) ( CLEAR ?auto_117084 ) ( ON ?auto_117085 ?auto_117089 ) ( CLEAR ?auto_117085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_117086 ?auto_117088 ?auto_117087 ?auto_117089 )
      ( MAKE-4PILE ?auto_117082 ?auto_117083 ?auto_117084 ?auto_117085 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117090 - BLOCK
      ?auto_117091 - BLOCK
      ?auto_117092 - BLOCK
      ?auto_117093 - BLOCK
    )
    :vars
    (
      ?auto_117095 - BLOCK
      ?auto_117094 - BLOCK
      ?auto_117096 - BLOCK
      ?auto_117097 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117090 ) ( ON ?auto_117091 ?auto_117090 ) ( not ( = ?auto_117090 ?auto_117091 ) ) ( not ( = ?auto_117090 ?auto_117092 ) ) ( not ( = ?auto_117090 ?auto_117093 ) ) ( not ( = ?auto_117090 ?auto_117095 ) ) ( not ( = ?auto_117091 ?auto_117092 ) ) ( not ( = ?auto_117091 ?auto_117093 ) ) ( not ( = ?auto_117091 ?auto_117095 ) ) ( not ( = ?auto_117092 ?auto_117093 ) ) ( not ( = ?auto_117092 ?auto_117095 ) ) ( not ( = ?auto_117093 ?auto_117095 ) ) ( not ( = ?auto_117090 ?auto_117094 ) ) ( not ( = ?auto_117090 ?auto_117096 ) ) ( not ( = ?auto_117091 ?auto_117094 ) ) ( not ( = ?auto_117091 ?auto_117096 ) ) ( not ( = ?auto_117092 ?auto_117094 ) ) ( not ( = ?auto_117092 ?auto_117096 ) ) ( not ( = ?auto_117093 ?auto_117094 ) ) ( not ( = ?auto_117093 ?auto_117096 ) ) ( not ( = ?auto_117095 ?auto_117094 ) ) ( not ( = ?auto_117095 ?auto_117096 ) ) ( not ( = ?auto_117094 ?auto_117096 ) ) ( ON ?auto_117096 ?auto_117097 ) ( not ( = ?auto_117090 ?auto_117097 ) ) ( not ( = ?auto_117091 ?auto_117097 ) ) ( not ( = ?auto_117092 ?auto_117097 ) ) ( not ( = ?auto_117093 ?auto_117097 ) ) ( not ( = ?auto_117095 ?auto_117097 ) ) ( not ( = ?auto_117094 ?auto_117097 ) ) ( not ( = ?auto_117096 ?auto_117097 ) ) ( ON ?auto_117094 ?auto_117096 ) ( ON-TABLE ?auto_117097 ) ( ON ?auto_117095 ?auto_117094 ) ( ON ?auto_117093 ?auto_117095 ) ( CLEAR ?auto_117093 ) ( HOLDING ?auto_117092 ) ( CLEAR ?auto_117091 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_117090 ?auto_117091 ?auto_117092 )
      ( MAKE-4PILE ?auto_117090 ?auto_117091 ?auto_117092 ?auto_117093 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117098 - BLOCK
      ?auto_117099 - BLOCK
      ?auto_117100 - BLOCK
      ?auto_117101 - BLOCK
    )
    :vars
    (
      ?auto_117105 - BLOCK
      ?auto_117104 - BLOCK
      ?auto_117103 - BLOCK
      ?auto_117102 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117098 ) ( ON ?auto_117099 ?auto_117098 ) ( not ( = ?auto_117098 ?auto_117099 ) ) ( not ( = ?auto_117098 ?auto_117100 ) ) ( not ( = ?auto_117098 ?auto_117101 ) ) ( not ( = ?auto_117098 ?auto_117105 ) ) ( not ( = ?auto_117099 ?auto_117100 ) ) ( not ( = ?auto_117099 ?auto_117101 ) ) ( not ( = ?auto_117099 ?auto_117105 ) ) ( not ( = ?auto_117100 ?auto_117101 ) ) ( not ( = ?auto_117100 ?auto_117105 ) ) ( not ( = ?auto_117101 ?auto_117105 ) ) ( not ( = ?auto_117098 ?auto_117104 ) ) ( not ( = ?auto_117098 ?auto_117103 ) ) ( not ( = ?auto_117099 ?auto_117104 ) ) ( not ( = ?auto_117099 ?auto_117103 ) ) ( not ( = ?auto_117100 ?auto_117104 ) ) ( not ( = ?auto_117100 ?auto_117103 ) ) ( not ( = ?auto_117101 ?auto_117104 ) ) ( not ( = ?auto_117101 ?auto_117103 ) ) ( not ( = ?auto_117105 ?auto_117104 ) ) ( not ( = ?auto_117105 ?auto_117103 ) ) ( not ( = ?auto_117104 ?auto_117103 ) ) ( ON ?auto_117103 ?auto_117102 ) ( not ( = ?auto_117098 ?auto_117102 ) ) ( not ( = ?auto_117099 ?auto_117102 ) ) ( not ( = ?auto_117100 ?auto_117102 ) ) ( not ( = ?auto_117101 ?auto_117102 ) ) ( not ( = ?auto_117105 ?auto_117102 ) ) ( not ( = ?auto_117104 ?auto_117102 ) ) ( not ( = ?auto_117103 ?auto_117102 ) ) ( ON ?auto_117104 ?auto_117103 ) ( ON-TABLE ?auto_117102 ) ( ON ?auto_117105 ?auto_117104 ) ( ON ?auto_117101 ?auto_117105 ) ( CLEAR ?auto_117099 ) ( ON ?auto_117100 ?auto_117101 ) ( CLEAR ?auto_117100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_117102 ?auto_117103 ?auto_117104 ?auto_117105 ?auto_117101 )
      ( MAKE-4PILE ?auto_117098 ?auto_117099 ?auto_117100 ?auto_117101 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117106 - BLOCK
      ?auto_117107 - BLOCK
      ?auto_117108 - BLOCK
      ?auto_117109 - BLOCK
    )
    :vars
    (
      ?auto_117110 - BLOCK
      ?auto_117112 - BLOCK
      ?auto_117111 - BLOCK
      ?auto_117113 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117106 ) ( not ( = ?auto_117106 ?auto_117107 ) ) ( not ( = ?auto_117106 ?auto_117108 ) ) ( not ( = ?auto_117106 ?auto_117109 ) ) ( not ( = ?auto_117106 ?auto_117110 ) ) ( not ( = ?auto_117107 ?auto_117108 ) ) ( not ( = ?auto_117107 ?auto_117109 ) ) ( not ( = ?auto_117107 ?auto_117110 ) ) ( not ( = ?auto_117108 ?auto_117109 ) ) ( not ( = ?auto_117108 ?auto_117110 ) ) ( not ( = ?auto_117109 ?auto_117110 ) ) ( not ( = ?auto_117106 ?auto_117112 ) ) ( not ( = ?auto_117106 ?auto_117111 ) ) ( not ( = ?auto_117107 ?auto_117112 ) ) ( not ( = ?auto_117107 ?auto_117111 ) ) ( not ( = ?auto_117108 ?auto_117112 ) ) ( not ( = ?auto_117108 ?auto_117111 ) ) ( not ( = ?auto_117109 ?auto_117112 ) ) ( not ( = ?auto_117109 ?auto_117111 ) ) ( not ( = ?auto_117110 ?auto_117112 ) ) ( not ( = ?auto_117110 ?auto_117111 ) ) ( not ( = ?auto_117112 ?auto_117111 ) ) ( ON ?auto_117111 ?auto_117113 ) ( not ( = ?auto_117106 ?auto_117113 ) ) ( not ( = ?auto_117107 ?auto_117113 ) ) ( not ( = ?auto_117108 ?auto_117113 ) ) ( not ( = ?auto_117109 ?auto_117113 ) ) ( not ( = ?auto_117110 ?auto_117113 ) ) ( not ( = ?auto_117112 ?auto_117113 ) ) ( not ( = ?auto_117111 ?auto_117113 ) ) ( ON ?auto_117112 ?auto_117111 ) ( ON-TABLE ?auto_117113 ) ( ON ?auto_117110 ?auto_117112 ) ( ON ?auto_117109 ?auto_117110 ) ( ON ?auto_117108 ?auto_117109 ) ( CLEAR ?auto_117108 ) ( HOLDING ?auto_117107 ) ( CLEAR ?auto_117106 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_117106 ?auto_117107 )
      ( MAKE-4PILE ?auto_117106 ?auto_117107 ?auto_117108 ?auto_117109 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117114 - BLOCK
      ?auto_117115 - BLOCK
      ?auto_117116 - BLOCK
      ?auto_117117 - BLOCK
    )
    :vars
    (
      ?auto_117121 - BLOCK
      ?auto_117118 - BLOCK
      ?auto_117120 - BLOCK
      ?auto_117119 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117114 ) ( not ( = ?auto_117114 ?auto_117115 ) ) ( not ( = ?auto_117114 ?auto_117116 ) ) ( not ( = ?auto_117114 ?auto_117117 ) ) ( not ( = ?auto_117114 ?auto_117121 ) ) ( not ( = ?auto_117115 ?auto_117116 ) ) ( not ( = ?auto_117115 ?auto_117117 ) ) ( not ( = ?auto_117115 ?auto_117121 ) ) ( not ( = ?auto_117116 ?auto_117117 ) ) ( not ( = ?auto_117116 ?auto_117121 ) ) ( not ( = ?auto_117117 ?auto_117121 ) ) ( not ( = ?auto_117114 ?auto_117118 ) ) ( not ( = ?auto_117114 ?auto_117120 ) ) ( not ( = ?auto_117115 ?auto_117118 ) ) ( not ( = ?auto_117115 ?auto_117120 ) ) ( not ( = ?auto_117116 ?auto_117118 ) ) ( not ( = ?auto_117116 ?auto_117120 ) ) ( not ( = ?auto_117117 ?auto_117118 ) ) ( not ( = ?auto_117117 ?auto_117120 ) ) ( not ( = ?auto_117121 ?auto_117118 ) ) ( not ( = ?auto_117121 ?auto_117120 ) ) ( not ( = ?auto_117118 ?auto_117120 ) ) ( ON ?auto_117120 ?auto_117119 ) ( not ( = ?auto_117114 ?auto_117119 ) ) ( not ( = ?auto_117115 ?auto_117119 ) ) ( not ( = ?auto_117116 ?auto_117119 ) ) ( not ( = ?auto_117117 ?auto_117119 ) ) ( not ( = ?auto_117121 ?auto_117119 ) ) ( not ( = ?auto_117118 ?auto_117119 ) ) ( not ( = ?auto_117120 ?auto_117119 ) ) ( ON ?auto_117118 ?auto_117120 ) ( ON-TABLE ?auto_117119 ) ( ON ?auto_117121 ?auto_117118 ) ( ON ?auto_117117 ?auto_117121 ) ( ON ?auto_117116 ?auto_117117 ) ( CLEAR ?auto_117114 ) ( ON ?auto_117115 ?auto_117116 ) ( CLEAR ?auto_117115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_117119 ?auto_117120 ?auto_117118 ?auto_117121 ?auto_117117 ?auto_117116 )
      ( MAKE-4PILE ?auto_117114 ?auto_117115 ?auto_117116 ?auto_117117 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117122 - BLOCK
      ?auto_117123 - BLOCK
      ?auto_117124 - BLOCK
      ?auto_117125 - BLOCK
    )
    :vars
    (
      ?auto_117129 - BLOCK
      ?auto_117127 - BLOCK
      ?auto_117126 - BLOCK
      ?auto_117128 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117122 ?auto_117123 ) ) ( not ( = ?auto_117122 ?auto_117124 ) ) ( not ( = ?auto_117122 ?auto_117125 ) ) ( not ( = ?auto_117122 ?auto_117129 ) ) ( not ( = ?auto_117123 ?auto_117124 ) ) ( not ( = ?auto_117123 ?auto_117125 ) ) ( not ( = ?auto_117123 ?auto_117129 ) ) ( not ( = ?auto_117124 ?auto_117125 ) ) ( not ( = ?auto_117124 ?auto_117129 ) ) ( not ( = ?auto_117125 ?auto_117129 ) ) ( not ( = ?auto_117122 ?auto_117127 ) ) ( not ( = ?auto_117122 ?auto_117126 ) ) ( not ( = ?auto_117123 ?auto_117127 ) ) ( not ( = ?auto_117123 ?auto_117126 ) ) ( not ( = ?auto_117124 ?auto_117127 ) ) ( not ( = ?auto_117124 ?auto_117126 ) ) ( not ( = ?auto_117125 ?auto_117127 ) ) ( not ( = ?auto_117125 ?auto_117126 ) ) ( not ( = ?auto_117129 ?auto_117127 ) ) ( not ( = ?auto_117129 ?auto_117126 ) ) ( not ( = ?auto_117127 ?auto_117126 ) ) ( ON ?auto_117126 ?auto_117128 ) ( not ( = ?auto_117122 ?auto_117128 ) ) ( not ( = ?auto_117123 ?auto_117128 ) ) ( not ( = ?auto_117124 ?auto_117128 ) ) ( not ( = ?auto_117125 ?auto_117128 ) ) ( not ( = ?auto_117129 ?auto_117128 ) ) ( not ( = ?auto_117127 ?auto_117128 ) ) ( not ( = ?auto_117126 ?auto_117128 ) ) ( ON ?auto_117127 ?auto_117126 ) ( ON-TABLE ?auto_117128 ) ( ON ?auto_117129 ?auto_117127 ) ( ON ?auto_117125 ?auto_117129 ) ( ON ?auto_117124 ?auto_117125 ) ( ON ?auto_117123 ?auto_117124 ) ( CLEAR ?auto_117123 ) ( HOLDING ?auto_117122 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_117122 )
      ( MAKE-4PILE ?auto_117122 ?auto_117123 ?auto_117124 ?auto_117125 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117130 - BLOCK
      ?auto_117131 - BLOCK
      ?auto_117132 - BLOCK
      ?auto_117133 - BLOCK
    )
    :vars
    (
      ?auto_117137 - BLOCK
      ?auto_117135 - BLOCK
      ?auto_117134 - BLOCK
      ?auto_117136 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117130 ?auto_117131 ) ) ( not ( = ?auto_117130 ?auto_117132 ) ) ( not ( = ?auto_117130 ?auto_117133 ) ) ( not ( = ?auto_117130 ?auto_117137 ) ) ( not ( = ?auto_117131 ?auto_117132 ) ) ( not ( = ?auto_117131 ?auto_117133 ) ) ( not ( = ?auto_117131 ?auto_117137 ) ) ( not ( = ?auto_117132 ?auto_117133 ) ) ( not ( = ?auto_117132 ?auto_117137 ) ) ( not ( = ?auto_117133 ?auto_117137 ) ) ( not ( = ?auto_117130 ?auto_117135 ) ) ( not ( = ?auto_117130 ?auto_117134 ) ) ( not ( = ?auto_117131 ?auto_117135 ) ) ( not ( = ?auto_117131 ?auto_117134 ) ) ( not ( = ?auto_117132 ?auto_117135 ) ) ( not ( = ?auto_117132 ?auto_117134 ) ) ( not ( = ?auto_117133 ?auto_117135 ) ) ( not ( = ?auto_117133 ?auto_117134 ) ) ( not ( = ?auto_117137 ?auto_117135 ) ) ( not ( = ?auto_117137 ?auto_117134 ) ) ( not ( = ?auto_117135 ?auto_117134 ) ) ( ON ?auto_117134 ?auto_117136 ) ( not ( = ?auto_117130 ?auto_117136 ) ) ( not ( = ?auto_117131 ?auto_117136 ) ) ( not ( = ?auto_117132 ?auto_117136 ) ) ( not ( = ?auto_117133 ?auto_117136 ) ) ( not ( = ?auto_117137 ?auto_117136 ) ) ( not ( = ?auto_117135 ?auto_117136 ) ) ( not ( = ?auto_117134 ?auto_117136 ) ) ( ON ?auto_117135 ?auto_117134 ) ( ON-TABLE ?auto_117136 ) ( ON ?auto_117137 ?auto_117135 ) ( ON ?auto_117133 ?auto_117137 ) ( ON ?auto_117132 ?auto_117133 ) ( ON ?auto_117131 ?auto_117132 ) ( ON ?auto_117130 ?auto_117131 ) ( CLEAR ?auto_117130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_117136 ?auto_117134 ?auto_117135 ?auto_117137 ?auto_117133 ?auto_117132 ?auto_117131 )
      ( MAKE-4PILE ?auto_117130 ?auto_117131 ?auto_117132 ?auto_117133 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117141 - BLOCK
      ?auto_117142 - BLOCK
      ?auto_117143 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_117143 ) ( CLEAR ?auto_117142 ) ( ON-TABLE ?auto_117141 ) ( ON ?auto_117142 ?auto_117141 ) ( not ( = ?auto_117141 ?auto_117142 ) ) ( not ( = ?auto_117141 ?auto_117143 ) ) ( not ( = ?auto_117142 ?auto_117143 ) ) )
    :subtasks
    ( ( !STACK ?auto_117143 ?auto_117142 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117144 - BLOCK
      ?auto_117145 - BLOCK
      ?auto_117146 - BLOCK
    )
    :vars
    (
      ?auto_117147 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_117145 ) ( ON-TABLE ?auto_117144 ) ( ON ?auto_117145 ?auto_117144 ) ( not ( = ?auto_117144 ?auto_117145 ) ) ( not ( = ?auto_117144 ?auto_117146 ) ) ( not ( = ?auto_117145 ?auto_117146 ) ) ( ON ?auto_117146 ?auto_117147 ) ( CLEAR ?auto_117146 ) ( HAND-EMPTY ) ( not ( = ?auto_117144 ?auto_117147 ) ) ( not ( = ?auto_117145 ?auto_117147 ) ) ( not ( = ?auto_117146 ?auto_117147 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_117146 ?auto_117147 )
      ( MAKE-3PILE ?auto_117144 ?auto_117145 ?auto_117146 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117148 - BLOCK
      ?auto_117149 - BLOCK
      ?auto_117150 - BLOCK
    )
    :vars
    (
      ?auto_117151 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117148 ) ( not ( = ?auto_117148 ?auto_117149 ) ) ( not ( = ?auto_117148 ?auto_117150 ) ) ( not ( = ?auto_117149 ?auto_117150 ) ) ( ON ?auto_117150 ?auto_117151 ) ( CLEAR ?auto_117150 ) ( not ( = ?auto_117148 ?auto_117151 ) ) ( not ( = ?auto_117149 ?auto_117151 ) ) ( not ( = ?auto_117150 ?auto_117151 ) ) ( HOLDING ?auto_117149 ) ( CLEAR ?auto_117148 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_117148 ?auto_117149 )
      ( MAKE-3PILE ?auto_117148 ?auto_117149 ?auto_117150 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117152 - BLOCK
      ?auto_117153 - BLOCK
      ?auto_117154 - BLOCK
    )
    :vars
    (
      ?auto_117155 - BLOCK
      ?auto_117157 - BLOCK
      ?auto_117158 - BLOCK
      ?auto_117156 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117152 ) ( not ( = ?auto_117152 ?auto_117153 ) ) ( not ( = ?auto_117152 ?auto_117154 ) ) ( not ( = ?auto_117153 ?auto_117154 ) ) ( ON ?auto_117154 ?auto_117155 ) ( not ( = ?auto_117152 ?auto_117155 ) ) ( not ( = ?auto_117153 ?auto_117155 ) ) ( not ( = ?auto_117154 ?auto_117155 ) ) ( CLEAR ?auto_117152 ) ( ON ?auto_117153 ?auto_117154 ) ( CLEAR ?auto_117153 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_117157 ) ( ON ?auto_117158 ?auto_117157 ) ( ON ?auto_117156 ?auto_117158 ) ( ON ?auto_117155 ?auto_117156 ) ( not ( = ?auto_117157 ?auto_117158 ) ) ( not ( = ?auto_117157 ?auto_117156 ) ) ( not ( = ?auto_117157 ?auto_117155 ) ) ( not ( = ?auto_117157 ?auto_117154 ) ) ( not ( = ?auto_117157 ?auto_117153 ) ) ( not ( = ?auto_117158 ?auto_117156 ) ) ( not ( = ?auto_117158 ?auto_117155 ) ) ( not ( = ?auto_117158 ?auto_117154 ) ) ( not ( = ?auto_117158 ?auto_117153 ) ) ( not ( = ?auto_117156 ?auto_117155 ) ) ( not ( = ?auto_117156 ?auto_117154 ) ) ( not ( = ?auto_117156 ?auto_117153 ) ) ( not ( = ?auto_117152 ?auto_117157 ) ) ( not ( = ?auto_117152 ?auto_117158 ) ) ( not ( = ?auto_117152 ?auto_117156 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_117157 ?auto_117158 ?auto_117156 ?auto_117155 ?auto_117154 )
      ( MAKE-3PILE ?auto_117152 ?auto_117153 ?auto_117154 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117159 - BLOCK
      ?auto_117160 - BLOCK
      ?auto_117161 - BLOCK
    )
    :vars
    (
      ?auto_117165 - BLOCK
      ?auto_117162 - BLOCK
      ?auto_117164 - BLOCK
      ?auto_117163 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117159 ?auto_117160 ) ) ( not ( = ?auto_117159 ?auto_117161 ) ) ( not ( = ?auto_117160 ?auto_117161 ) ) ( ON ?auto_117161 ?auto_117165 ) ( not ( = ?auto_117159 ?auto_117165 ) ) ( not ( = ?auto_117160 ?auto_117165 ) ) ( not ( = ?auto_117161 ?auto_117165 ) ) ( ON ?auto_117160 ?auto_117161 ) ( CLEAR ?auto_117160 ) ( ON-TABLE ?auto_117162 ) ( ON ?auto_117164 ?auto_117162 ) ( ON ?auto_117163 ?auto_117164 ) ( ON ?auto_117165 ?auto_117163 ) ( not ( = ?auto_117162 ?auto_117164 ) ) ( not ( = ?auto_117162 ?auto_117163 ) ) ( not ( = ?auto_117162 ?auto_117165 ) ) ( not ( = ?auto_117162 ?auto_117161 ) ) ( not ( = ?auto_117162 ?auto_117160 ) ) ( not ( = ?auto_117164 ?auto_117163 ) ) ( not ( = ?auto_117164 ?auto_117165 ) ) ( not ( = ?auto_117164 ?auto_117161 ) ) ( not ( = ?auto_117164 ?auto_117160 ) ) ( not ( = ?auto_117163 ?auto_117165 ) ) ( not ( = ?auto_117163 ?auto_117161 ) ) ( not ( = ?auto_117163 ?auto_117160 ) ) ( not ( = ?auto_117159 ?auto_117162 ) ) ( not ( = ?auto_117159 ?auto_117164 ) ) ( not ( = ?auto_117159 ?auto_117163 ) ) ( HOLDING ?auto_117159 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_117159 )
      ( MAKE-3PILE ?auto_117159 ?auto_117160 ?auto_117161 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117166 - BLOCK
      ?auto_117167 - BLOCK
      ?auto_117168 - BLOCK
    )
    :vars
    (
      ?auto_117169 - BLOCK
      ?auto_117172 - BLOCK
      ?auto_117171 - BLOCK
      ?auto_117170 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117166 ?auto_117167 ) ) ( not ( = ?auto_117166 ?auto_117168 ) ) ( not ( = ?auto_117167 ?auto_117168 ) ) ( ON ?auto_117168 ?auto_117169 ) ( not ( = ?auto_117166 ?auto_117169 ) ) ( not ( = ?auto_117167 ?auto_117169 ) ) ( not ( = ?auto_117168 ?auto_117169 ) ) ( ON ?auto_117167 ?auto_117168 ) ( ON-TABLE ?auto_117172 ) ( ON ?auto_117171 ?auto_117172 ) ( ON ?auto_117170 ?auto_117171 ) ( ON ?auto_117169 ?auto_117170 ) ( not ( = ?auto_117172 ?auto_117171 ) ) ( not ( = ?auto_117172 ?auto_117170 ) ) ( not ( = ?auto_117172 ?auto_117169 ) ) ( not ( = ?auto_117172 ?auto_117168 ) ) ( not ( = ?auto_117172 ?auto_117167 ) ) ( not ( = ?auto_117171 ?auto_117170 ) ) ( not ( = ?auto_117171 ?auto_117169 ) ) ( not ( = ?auto_117171 ?auto_117168 ) ) ( not ( = ?auto_117171 ?auto_117167 ) ) ( not ( = ?auto_117170 ?auto_117169 ) ) ( not ( = ?auto_117170 ?auto_117168 ) ) ( not ( = ?auto_117170 ?auto_117167 ) ) ( not ( = ?auto_117166 ?auto_117172 ) ) ( not ( = ?auto_117166 ?auto_117171 ) ) ( not ( = ?auto_117166 ?auto_117170 ) ) ( ON ?auto_117166 ?auto_117167 ) ( CLEAR ?auto_117166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_117172 ?auto_117171 ?auto_117170 ?auto_117169 ?auto_117168 ?auto_117167 )
      ( MAKE-3PILE ?auto_117166 ?auto_117167 ?auto_117168 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117173 - BLOCK
      ?auto_117174 - BLOCK
      ?auto_117175 - BLOCK
    )
    :vars
    (
      ?auto_117178 - BLOCK
      ?auto_117179 - BLOCK
      ?auto_117176 - BLOCK
      ?auto_117177 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117173 ?auto_117174 ) ) ( not ( = ?auto_117173 ?auto_117175 ) ) ( not ( = ?auto_117174 ?auto_117175 ) ) ( ON ?auto_117175 ?auto_117178 ) ( not ( = ?auto_117173 ?auto_117178 ) ) ( not ( = ?auto_117174 ?auto_117178 ) ) ( not ( = ?auto_117175 ?auto_117178 ) ) ( ON ?auto_117174 ?auto_117175 ) ( ON-TABLE ?auto_117179 ) ( ON ?auto_117176 ?auto_117179 ) ( ON ?auto_117177 ?auto_117176 ) ( ON ?auto_117178 ?auto_117177 ) ( not ( = ?auto_117179 ?auto_117176 ) ) ( not ( = ?auto_117179 ?auto_117177 ) ) ( not ( = ?auto_117179 ?auto_117178 ) ) ( not ( = ?auto_117179 ?auto_117175 ) ) ( not ( = ?auto_117179 ?auto_117174 ) ) ( not ( = ?auto_117176 ?auto_117177 ) ) ( not ( = ?auto_117176 ?auto_117178 ) ) ( not ( = ?auto_117176 ?auto_117175 ) ) ( not ( = ?auto_117176 ?auto_117174 ) ) ( not ( = ?auto_117177 ?auto_117178 ) ) ( not ( = ?auto_117177 ?auto_117175 ) ) ( not ( = ?auto_117177 ?auto_117174 ) ) ( not ( = ?auto_117173 ?auto_117179 ) ) ( not ( = ?auto_117173 ?auto_117176 ) ) ( not ( = ?auto_117173 ?auto_117177 ) ) ( HOLDING ?auto_117173 ) ( CLEAR ?auto_117174 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_117179 ?auto_117176 ?auto_117177 ?auto_117178 ?auto_117175 ?auto_117174 ?auto_117173 )
      ( MAKE-3PILE ?auto_117173 ?auto_117174 ?auto_117175 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117180 - BLOCK
      ?auto_117181 - BLOCK
      ?auto_117182 - BLOCK
    )
    :vars
    (
      ?auto_117183 - BLOCK
      ?auto_117186 - BLOCK
      ?auto_117185 - BLOCK
      ?auto_117184 - BLOCK
      ?auto_117187 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117180 ?auto_117181 ) ) ( not ( = ?auto_117180 ?auto_117182 ) ) ( not ( = ?auto_117181 ?auto_117182 ) ) ( ON ?auto_117182 ?auto_117183 ) ( not ( = ?auto_117180 ?auto_117183 ) ) ( not ( = ?auto_117181 ?auto_117183 ) ) ( not ( = ?auto_117182 ?auto_117183 ) ) ( ON ?auto_117181 ?auto_117182 ) ( ON-TABLE ?auto_117186 ) ( ON ?auto_117185 ?auto_117186 ) ( ON ?auto_117184 ?auto_117185 ) ( ON ?auto_117183 ?auto_117184 ) ( not ( = ?auto_117186 ?auto_117185 ) ) ( not ( = ?auto_117186 ?auto_117184 ) ) ( not ( = ?auto_117186 ?auto_117183 ) ) ( not ( = ?auto_117186 ?auto_117182 ) ) ( not ( = ?auto_117186 ?auto_117181 ) ) ( not ( = ?auto_117185 ?auto_117184 ) ) ( not ( = ?auto_117185 ?auto_117183 ) ) ( not ( = ?auto_117185 ?auto_117182 ) ) ( not ( = ?auto_117185 ?auto_117181 ) ) ( not ( = ?auto_117184 ?auto_117183 ) ) ( not ( = ?auto_117184 ?auto_117182 ) ) ( not ( = ?auto_117184 ?auto_117181 ) ) ( not ( = ?auto_117180 ?auto_117186 ) ) ( not ( = ?auto_117180 ?auto_117185 ) ) ( not ( = ?auto_117180 ?auto_117184 ) ) ( CLEAR ?auto_117181 ) ( ON ?auto_117180 ?auto_117187 ) ( CLEAR ?auto_117180 ) ( HAND-EMPTY ) ( not ( = ?auto_117180 ?auto_117187 ) ) ( not ( = ?auto_117181 ?auto_117187 ) ) ( not ( = ?auto_117182 ?auto_117187 ) ) ( not ( = ?auto_117183 ?auto_117187 ) ) ( not ( = ?auto_117186 ?auto_117187 ) ) ( not ( = ?auto_117185 ?auto_117187 ) ) ( not ( = ?auto_117184 ?auto_117187 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_117180 ?auto_117187 )
      ( MAKE-3PILE ?auto_117180 ?auto_117181 ?auto_117182 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117188 - BLOCK
      ?auto_117189 - BLOCK
      ?auto_117190 - BLOCK
    )
    :vars
    (
      ?auto_117195 - BLOCK
      ?auto_117193 - BLOCK
      ?auto_117194 - BLOCK
      ?auto_117191 - BLOCK
      ?auto_117192 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117188 ?auto_117189 ) ) ( not ( = ?auto_117188 ?auto_117190 ) ) ( not ( = ?auto_117189 ?auto_117190 ) ) ( ON ?auto_117190 ?auto_117195 ) ( not ( = ?auto_117188 ?auto_117195 ) ) ( not ( = ?auto_117189 ?auto_117195 ) ) ( not ( = ?auto_117190 ?auto_117195 ) ) ( ON-TABLE ?auto_117193 ) ( ON ?auto_117194 ?auto_117193 ) ( ON ?auto_117191 ?auto_117194 ) ( ON ?auto_117195 ?auto_117191 ) ( not ( = ?auto_117193 ?auto_117194 ) ) ( not ( = ?auto_117193 ?auto_117191 ) ) ( not ( = ?auto_117193 ?auto_117195 ) ) ( not ( = ?auto_117193 ?auto_117190 ) ) ( not ( = ?auto_117193 ?auto_117189 ) ) ( not ( = ?auto_117194 ?auto_117191 ) ) ( not ( = ?auto_117194 ?auto_117195 ) ) ( not ( = ?auto_117194 ?auto_117190 ) ) ( not ( = ?auto_117194 ?auto_117189 ) ) ( not ( = ?auto_117191 ?auto_117195 ) ) ( not ( = ?auto_117191 ?auto_117190 ) ) ( not ( = ?auto_117191 ?auto_117189 ) ) ( not ( = ?auto_117188 ?auto_117193 ) ) ( not ( = ?auto_117188 ?auto_117194 ) ) ( not ( = ?auto_117188 ?auto_117191 ) ) ( ON ?auto_117188 ?auto_117192 ) ( CLEAR ?auto_117188 ) ( not ( = ?auto_117188 ?auto_117192 ) ) ( not ( = ?auto_117189 ?auto_117192 ) ) ( not ( = ?auto_117190 ?auto_117192 ) ) ( not ( = ?auto_117195 ?auto_117192 ) ) ( not ( = ?auto_117193 ?auto_117192 ) ) ( not ( = ?auto_117194 ?auto_117192 ) ) ( not ( = ?auto_117191 ?auto_117192 ) ) ( HOLDING ?auto_117189 ) ( CLEAR ?auto_117190 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_117193 ?auto_117194 ?auto_117191 ?auto_117195 ?auto_117190 ?auto_117189 )
      ( MAKE-3PILE ?auto_117188 ?auto_117189 ?auto_117190 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117196 - BLOCK
      ?auto_117197 - BLOCK
      ?auto_117198 - BLOCK
    )
    :vars
    (
      ?auto_117201 - BLOCK
      ?auto_117199 - BLOCK
      ?auto_117203 - BLOCK
      ?auto_117202 - BLOCK
      ?auto_117200 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117196 ?auto_117197 ) ) ( not ( = ?auto_117196 ?auto_117198 ) ) ( not ( = ?auto_117197 ?auto_117198 ) ) ( ON ?auto_117198 ?auto_117201 ) ( not ( = ?auto_117196 ?auto_117201 ) ) ( not ( = ?auto_117197 ?auto_117201 ) ) ( not ( = ?auto_117198 ?auto_117201 ) ) ( ON-TABLE ?auto_117199 ) ( ON ?auto_117203 ?auto_117199 ) ( ON ?auto_117202 ?auto_117203 ) ( ON ?auto_117201 ?auto_117202 ) ( not ( = ?auto_117199 ?auto_117203 ) ) ( not ( = ?auto_117199 ?auto_117202 ) ) ( not ( = ?auto_117199 ?auto_117201 ) ) ( not ( = ?auto_117199 ?auto_117198 ) ) ( not ( = ?auto_117199 ?auto_117197 ) ) ( not ( = ?auto_117203 ?auto_117202 ) ) ( not ( = ?auto_117203 ?auto_117201 ) ) ( not ( = ?auto_117203 ?auto_117198 ) ) ( not ( = ?auto_117203 ?auto_117197 ) ) ( not ( = ?auto_117202 ?auto_117201 ) ) ( not ( = ?auto_117202 ?auto_117198 ) ) ( not ( = ?auto_117202 ?auto_117197 ) ) ( not ( = ?auto_117196 ?auto_117199 ) ) ( not ( = ?auto_117196 ?auto_117203 ) ) ( not ( = ?auto_117196 ?auto_117202 ) ) ( ON ?auto_117196 ?auto_117200 ) ( not ( = ?auto_117196 ?auto_117200 ) ) ( not ( = ?auto_117197 ?auto_117200 ) ) ( not ( = ?auto_117198 ?auto_117200 ) ) ( not ( = ?auto_117201 ?auto_117200 ) ) ( not ( = ?auto_117199 ?auto_117200 ) ) ( not ( = ?auto_117203 ?auto_117200 ) ) ( not ( = ?auto_117202 ?auto_117200 ) ) ( CLEAR ?auto_117198 ) ( ON ?auto_117197 ?auto_117196 ) ( CLEAR ?auto_117197 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_117200 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_117200 ?auto_117196 )
      ( MAKE-3PILE ?auto_117196 ?auto_117197 ?auto_117198 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117204 - BLOCK
      ?auto_117205 - BLOCK
      ?auto_117206 - BLOCK
    )
    :vars
    (
      ?auto_117210 - BLOCK
      ?auto_117211 - BLOCK
      ?auto_117208 - BLOCK
      ?auto_117207 - BLOCK
      ?auto_117209 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117204 ?auto_117205 ) ) ( not ( = ?auto_117204 ?auto_117206 ) ) ( not ( = ?auto_117205 ?auto_117206 ) ) ( not ( = ?auto_117204 ?auto_117210 ) ) ( not ( = ?auto_117205 ?auto_117210 ) ) ( not ( = ?auto_117206 ?auto_117210 ) ) ( ON-TABLE ?auto_117211 ) ( ON ?auto_117208 ?auto_117211 ) ( ON ?auto_117207 ?auto_117208 ) ( ON ?auto_117210 ?auto_117207 ) ( not ( = ?auto_117211 ?auto_117208 ) ) ( not ( = ?auto_117211 ?auto_117207 ) ) ( not ( = ?auto_117211 ?auto_117210 ) ) ( not ( = ?auto_117211 ?auto_117206 ) ) ( not ( = ?auto_117211 ?auto_117205 ) ) ( not ( = ?auto_117208 ?auto_117207 ) ) ( not ( = ?auto_117208 ?auto_117210 ) ) ( not ( = ?auto_117208 ?auto_117206 ) ) ( not ( = ?auto_117208 ?auto_117205 ) ) ( not ( = ?auto_117207 ?auto_117210 ) ) ( not ( = ?auto_117207 ?auto_117206 ) ) ( not ( = ?auto_117207 ?auto_117205 ) ) ( not ( = ?auto_117204 ?auto_117211 ) ) ( not ( = ?auto_117204 ?auto_117208 ) ) ( not ( = ?auto_117204 ?auto_117207 ) ) ( ON ?auto_117204 ?auto_117209 ) ( not ( = ?auto_117204 ?auto_117209 ) ) ( not ( = ?auto_117205 ?auto_117209 ) ) ( not ( = ?auto_117206 ?auto_117209 ) ) ( not ( = ?auto_117210 ?auto_117209 ) ) ( not ( = ?auto_117211 ?auto_117209 ) ) ( not ( = ?auto_117208 ?auto_117209 ) ) ( not ( = ?auto_117207 ?auto_117209 ) ) ( ON ?auto_117205 ?auto_117204 ) ( CLEAR ?auto_117205 ) ( ON-TABLE ?auto_117209 ) ( HOLDING ?auto_117206 ) ( CLEAR ?auto_117210 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_117211 ?auto_117208 ?auto_117207 ?auto_117210 ?auto_117206 )
      ( MAKE-3PILE ?auto_117204 ?auto_117205 ?auto_117206 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117212 - BLOCK
      ?auto_117213 - BLOCK
      ?auto_117214 - BLOCK
    )
    :vars
    (
      ?auto_117215 - BLOCK
      ?auto_117219 - BLOCK
      ?auto_117216 - BLOCK
      ?auto_117218 - BLOCK
      ?auto_117217 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117212 ?auto_117213 ) ) ( not ( = ?auto_117212 ?auto_117214 ) ) ( not ( = ?auto_117213 ?auto_117214 ) ) ( not ( = ?auto_117212 ?auto_117215 ) ) ( not ( = ?auto_117213 ?auto_117215 ) ) ( not ( = ?auto_117214 ?auto_117215 ) ) ( ON-TABLE ?auto_117219 ) ( ON ?auto_117216 ?auto_117219 ) ( ON ?auto_117218 ?auto_117216 ) ( ON ?auto_117215 ?auto_117218 ) ( not ( = ?auto_117219 ?auto_117216 ) ) ( not ( = ?auto_117219 ?auto_117218 ) ) ( not ( = ?auto_117219 ?auto_117215 ) ) ( not ( = ?auto_117219 ?auto_117214 ) ) ( not ( = ?auto_117219 ?auto_117213 ) ) ( not ( = ?auto_117216 ?auto_117218 ) ) ( not ( = ?auto_117216 ?auto_117215 ) ) ( not ( = ?auto_117216 ?auto_117214 ) ) ( not ( = ?auto_117216 ?auto_117213 ) ) ( not ( = ?auto_117218 ?auto_117215 ) ) ( not ( = ?auto_117218 ?auto_117214 ) ) ( not ( = ?auto_117218 ?auto_117213 ) ) ( not ( = ?auto_117212 ?auto_117219 ) ) ( not ( = ?auto_117212 ?auto_117216 ) ) ( not ( = ?auto_117212 ?auto_117218 ) ) ( ON ?auto_117212 ?auto_117217 ) ( not ( = ?auto_117212 ?auto_117217 ) ) ( not ( = ?auto_117213 ?auto_117217 ) ) ( not ( = ?auto_117214 ?auto_117217 ) ) ( not ( = ?auto_117215 ?auto_117217 ) ) ( not ( = ?auto_117219 ?auto_117217 ) ) ( not ( = ?auto_117216 ?auto_117217 ) ) ( not ( = ?auto_117218 ?auto_117217 ) ) ( ON ?auto_117213 ?auto_117212 ) ( ON-TABLE ?auto_117217 ) ( CLEAR ?auto_117215 ) ( ON ?auto_117214 ?auto_117213 ) ( CLEAR ?auto_117214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_117217 ?auto_117212 ?auto_117213 )
      ( MAKE-3PILE ?auto_117212 ?auto_117213 ?auto_117214 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117220 - BLOCK
      ?auto_117221 - BLOCK
      ?auto_117222 - BLOCK
    )
    :vars
    (
      ?auto_117223 - BLOCK
      ?auto_117226 - BLOCK
      ?auto_117227 - BLOCK
      ?auto_117224 - BLOCK
      ?auto_117225 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117220 ?auto_117221 ) ) ( not ( = ?auto_117220 ?auto_117222 ) ) ( not ( = ?auto_117221 ?auto_117222 ) ) ( not ( = ?auto_117220 ?auto_117223 ) ) ( not ( = ?auto_117221 ?auto_117223 ) ) ( not ( = ?auto_117222 ?auto_117223 ) ) ( ON-TABLE ?auto_117226 ) ( ON ?auto_117227 ?auto_117226 ) ( ON ?auto_117224 ?auto_117227 ) ( not ( = ?auto_117226 ?auto_117227 ) ) ( not ( = ?auto_117226 ?auto_117224 ) ) ( not ( = ?auto_117226 ?auto_117223 ) ) ( not ( = ?auto_117226 ?auto_117222 ) ) ( not ( = ?auto_117226 ?auto_117221 ) ) ( not ( = ?auto_117227 ?auto_117224 ) ) ( not ( = ?auto_117227 ?auto_117223 ) ) ( not ( = ?auto_117227 ?auto_117222 ) ) ( not ( = ?auto_117227 ?auto_117221 ) ) ( not ( = ?auto_117224 ?auto_117223 ) ) ( not ( = ?auto_117224 ?auto_117222 ) ) ( not ( = ?auto_117224 ?auto_117221 ) ) ( not ( = ?auto_117220 ?auto_117226 ) ) ( not ( = ?auto_117220 ?auto_117227 ) ) ( not ( = ?auto_117220 ?auto_117224 ) ) ( ON ?auto_117220 ?auto_117225 ) ( not ( = ?auto_117220 ?auto_117225 ) ) ( not ( = ?auto_117221 ?auto_117225 ) ) ( not ( = ?auto_117222 ?auto_117225 ) ) ( not ( = ?auto_117223 ?auto_117225 ) ) ( not ( = ?auto_117226 ?auto_117225 ) ) ( not ( = ?auto_117227 ?auto_117225 ) ) ( not ( = ?auto_117224 ?auto_117225 ) ) ( ON ?auto_117221 ?auto_117220 ) ( ON-TABLE ?auto_117225 ) ( ON ?auto_117222 ?auto_117221 ) ( CLEAR ?auto_117222 ) ( HOLDING ?auto_117223 ) ( CLEAR ?auto_117224 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_117226 ?auto_117227 ?auto_117224 ?auto_117223 )
      ( MAKE-3PILE ?auto_117220 ?auto_117221 ?auto_117222 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117228 - BLOCK
      ?auto_117229 - BLOCK
      ?auto_117230 - BLOCK
    )
    :vars
    (
      ?auto_117231 - BLOCK
      ?auto_117234 - BLOCK
      ?auto_117233 - BLOCK
      ?auto_117232 - BLOCK
      ?auto_117235 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117228 ?auto_117229 ) ) ( not ( = ?auto_117228 ?auto_117230 ) ) ( not ( = ?auto_117229 ?auto_117230 ) ) ( not ( = ?auto_117228 ?auto_117231 ) ) ( not ( = ?auto_117229 ?auto_117231 ) ) ( not ( = ?auto_117230 ?auto_117231 ) ) ( ON-TABLE ?auto_117234 ) ( ON ?auto_117233 ?auto_117234 ) ( ON ?auto_117232 ?auto_117233 ) ( not ( = ?auto_117234 ?auto_117233 ) ) ( not ( = ?auto_117234 ?auto_117232 ) ) ( not ( = ?auto_117234 ?auto_117231 ) ) ( not ( = ?auto_117234 ?auto_117230 ) ) ( not ( = ?auto_117234 ?auto_117229 ) ) ( not ( = ?auto_117233 ?auto_117232 ) ) ( not ( = ?auto_117233 ?auto_117231 ) ) ( not ( = ?auto_117233 ?auto_117230 ) ) ( not ( = ?auto_117233 ?auto_117229 ) ) ( not ( = ?auto_117232 ?auto_117231 ) ) ( not ( = ?auto_117232 ?auto_117230 ) ) ( not ( = ?auto_117232 ?auto_117229 ) ) ( not ( = ?auto_117228 ?auto_117234 ) ) ( not ( = ?auto_117228 ?auto_117233 ) ) ( not ( = ?auto_117228 ?auto_117232 ) ) ( ON ?auto_117228 ?auto_117235 ) ( not ( = ?auto_117228 ?auto_117235 ) ) ( not ( = ?auto_117229 ?auto_117235 ) ) ( not ( = ?auto_117230 ?auto_117235 ) ) ( not ( = ?auto_117231 ?auto_117235 ) ) ( not ( = ?auto_117234 ?auto_117235 ) ) ( not ( = ?auto_117233 ?auto_117235 ) ) ( not ( = ?auto_117232 ?auto_117235 ) ) ( ON ?auto_117229 ?auto_117228 ) ( ON-TABLE ?auto_117235 ) ( ON ?auto_117230 ?auto_117229 ) ( CLEAR ?auto_117232 ) ( ON ?auto_117231 ?auto_117230 ) ( CLEAR ?auto_117231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_117235 ?auto_117228 ?auto_117229 ?auto_117230 )
      ( MAKE-3PILE ?auto_117228 ?auto_117229 ?auto_117230 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117236 - BLOCK
      ?auto_117237 - BLOCK
      ?auto_117238 - BLOCK
    )
    :vars
    (
      ?auto_117241 - BLOCK
      ?auto_117243 - BLOCK
      ?auto_117239 - BLOCK
      ?auto_117242 - BLOCK
      ?auto_117240 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117236 ?auto_117237 ) ) ( not ( = ?auto_117236 ?auto_117238 ) ) ( not ( = ?auto_117237 ?auto_117238 ) ) ( not ( = ?auto_117236 ?auto_117241 ) ) ( not ( = ?auto_117237 ?auto_117241 ) ) ( not ( = ?auto_117238 ?auto_117241 ) ) ( ON-TABLE ?auto_117243 ) ( ON ?auto_117239 ?auto_117243 ) ( not ( = ?auto_117243 ?auto_117239 ) ) ( not ( = ?auto_117243 ?auto_117242 ) ) ( not ( = ?auto_117243 ?auto_117241 ) ) ( not ( = ?auto_117243 ?auto_117238 ) ) ( not ( = ?auto_117243 ?auto_117237 ) ) ( not ( = ?auto_117239 ?auto_117242 ) ) ( not ( = ?auto_117239 ?auto_117241 ) ) ( not ( = ?auto_117239 ?auto_117238 ) ) ( not ( = ?auto_117239 ?auto_117237 ) ) ( not ( = ?auto_117242 ?auto_117241 ) ) ( not ( = ?auto_117242 ?auto_117238 ) ) ( not ( = ?auto_117242 ?auto_117237 ) ) ( not ( = ?auto_117236 ?auto_117243 ) ) ( not ( = ?auto_117236 ?auto_117239 ) ) ( not ( = ?auto_117236 ?auto_117242 ) ) ( ON ?auto_117236 ?auto_117240 ) ( not ( = ?auto_117236 ?auto_117240 ) ) ( not ( = ?auto_117237 ?auto_117240 ) ) ( not ( = ?auto_117238 ?auto_117240 ) ) ( not ( = ?auto_117241 ?auto_117240 ) ) ( not ( = ?auto_117243 ?auto_117240 ) ) ( not ( = ?auto_117239 ?auto_117240 ) ) ( not ( = ?auto_117242 ?auto_117240 ) ) ( ON ?auto_117237 ?auto_117236 ) ( ON-TABLE ?auto_117240 ) ( ON ?auto_117238 ?auto_117237 ) ( ON ?auto_117241 ?auto_117238 ) ( CLEAR ?auto_117241 ) ( HOLDING ?auto_117242 ) ( CLEAR ?auto_117239 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_117243 ?auto_117239 ?auto_117242 )
      ( MAKE-3PILE ?auto_117236 ?auto_117237 ?auto_117238 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117244 - BLOCK
      ?auto_117245 - BLOCK
      ?auto_117246 - BLOCK
    )
    :vars
    (
      ?auto_117247 - BLOCK
      ?auto_117250 - BLOCK
      ?auto_117248 - BLOCK
      ?auto_117249 - BLOCK
      ?auto_117251 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117244 ?auto_117245 ) ) ( not ( = ?auto_117244 ?auto_117246 ) ) ( not ( = ?auto_117245 ?auto_117246 ) ) ( not ( = ?auto_117244 ?auto_117247 ) ) ( not ( = ?auto_117245 ?auto_117247 ) ) ( not ( = ?auto_117246 ?auto_117247 ) ) ( ON-TABLE ?auto_117250 ) ( ON ?auto_117248 ?auto_117250 ) ( not ( = ?auto_117250 ?auto_117248 ) ) ( not ( = ?auto_117250 ?auto_117249 ) ) ( not ( = ?auto_117250 ?auto_117247 ) ) ( not ( = ?auto_117250 ?auto_117246 ) ) ( not ( = ?auto_117250 ?auto_117245 ) ) ( not ( = ?auto_117248 ?auto_117249 ) ) ( not ( = ?auto_117248 ?auto_117247 ) ) ( not ( = ?auto_117248 ?auto_117246 ) ) ( not ( = ?auto_117248 ?auto_117245 ) ) ( not ( = ?auto_117249 ?auto_117247 ) ) ( not ( = ?auto_117249 ?auto_117246 ) ) ( not ( = ?auto_117249 ?auto_117245 ) ) ( not ( = ?auto_117244 ?auto_117250 ) ) ( not ( = ?auto_117244 ?auto_117248 ) ) ( not ( = ?auto_117244 ?auto_117249 ) ) ( ON ?auto_117244 ?auto_117251 ) ( not ( = ?auto_117244 ?auto_117251 ) ) ( not ( = ?auto_117245 ?auto_117251 ) ) ( not ( = ?auto_117246 ?auto_117251 ) ) ( not ( = ?auto_117247 ?auto_117251 ) ) ( not ( = ?auto_117250 ?auto_117251 ) ) ( not ( = ?auto_117248 ?auto_117251 ) ) ( not ( = ?auto_117249 ?auto_117251 ) ) ( ON ?auto_117245 ?auto_117244 ) ( ON-TABLE ?auto_117251 ) ( ON ?auto_117246 ?auto_117245 ) ( ON ?auto_117247 ?auto_117246 ) ( CLEAR ?auto_117248 ) ( ON ?auto_117249 ?auto_117247 ) ( CLEAR ?auto_117249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_117251 ?auto_117244 ?auto_117245 ?auto_117246 ?auto_117247 )
      ( MAKE-3PILE ?auto_117244 ?auto_117245 ?auto_117246 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117252 - BLOCK
      ?auto_117253 - BLOCK
      ?auto_117254 - BLOCK
    )
    :vars
    (
      ?auto_117259 - BLOCK
      ?auto_117256 - BLOCK
      ?auto_117255 - BLOCK
      ?auto_117258 - BLOCK
      ?auto_117257 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117252 ?auto_117253 ) ) ( not ( = ?auto_117252 ?auto_117254 ) ) ( not ( = ?auto_117253 ?auto_117254 ) ) ( not ( = ?auto_117252 ?auto_117259 ) ) ( not ( = ?auto_117253 ?auto_117259 ) ) ( not ( = ?auto_117254 ?auto_117259 ) ) ( ON-TABLE ?auto_117256 ) ( not ( = ?auto_117256 ?auto_117255 ) ) ( not ( = ?auto_117256 ?auto_117258 ) ) ( not ( = ?auto_117256 ?auto_117259 ) ) ( not ( = ?auto_117256 ?auto_117254 ) ) ( not ( = ?auto_117256 ?auto_117253 ) ) ( not ( = ?auto_117255 ?auto_117258 ) ) ( not ( = ?auto_117255 ?auto_117259 ) ) ( not ( = ?auto_117255 ?auto_117254 ) ) ( not ( = ?auto_117255 ?auto_117253 ) ) ( not ( = ?auto_117258 ?auto_117259 ) ) ( not ( = ?auto_117258 ?auto_117254 ) ) ( not ( = ?auto_117258 ?auto_117253 ) ) ( not ( = ?auto_117252 ?auto_117256 ) ) ( not ( = ?auto_117252 ?auto_117255 ) ) ( not ( = ?auto_117252 ?auto_117258 ) ) ( ON ?auto_117252 ?auto_117257 ) ( not ( = ?auto_117252 ?auto_117257 ) ) ( not ( = ?auto_117253 ?auto_117257 ) ) ( not ( = ?auto_117254 ?auto_117257 ) ) ( not ( = ?auto_117259 ?auto_117257 ) ) ( not ( = ?auto_117256 ?auto_117257 ) ) ( not ( = ?auto_117255 ?auto_117257 ) ) ( not ( = ?auto_117258 ?auto_117257 ) ) ( ON ?auto_117253 ?auto_117252 ) ( ON-TABLE ?auto_117257 ) ( ON ?auto_117254 ?auto_117253 ) ( ON ?auto_117259 ?auto_117254 ) ( ON ?auto_117258 ?auto_117259 ) ( CLEAR ?auto_117258 ) ( HOLDING ?auto_117255 ) ( CLEAR ?auto_117256 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_117256 ?auto_117255 )
      ( MAKE-3PILE ?auto_117252 ?auto_117253 ?auto_117254 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117260 - BLOCK
      ?auto_117261 - BLOCK
      ?auto_117262 - BLOCK
    )
    :vars
    (
      ?auto_117263 - BLOCK
      ?auto_117264 - BLOCK
      ?auto_117267 - BLOCK
      ?auto_117265 - BLOCK
      ?auto_117266 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117260 ?auto_117261 ) ) ( not ( = ?auto_117260 ?auto_117262 ) ) ( not ( = ?auto_117261 ?auto_117262 ) ) ( not ( = ?auto_117260 ?auto_117263 ) ) ( not ( = ?auto_117261 ?auto_117263 ) ) ( not ( = ?auto_117262 ?auto_117263 ) ) ( ON-TABLE ?auto_117264 ) ( not ( = ?auto_117264 ?auto_117267 ) ) ( not ( = ?auto_117264 ?auto_117265 ) ) ( not ( = ?auto_117264 ?auto_117263 ) ) ( not ( = ?auto_117264 ?auto_117262 ) ) ( not ( = ?auto_117264 ?auto_117261 ) ) ( not ( = ?auto_117267 ?auto_117265 ) ) ( not ( = ?auto_117267 ?auto_117263 ) ) ( not ( = ?auto_117267 ?auto_117262 ) ) ( not ( = ?auto_117267 ?auto_117261 ) ) ( not ( = ?auto_117265 ?auto_117263 ) ) ( not ( = ?auto_117265 ?auto_117262 ) ) ( not ( = ?auto_117265 ?auto_117261 ) ) ( not ( = ?auto_117260 ?auto_117264 ) ) ( not ( = ?auto_117260 ?auto_117267 ) ) ( not ( = ?auto_117260 ?auto_117265 ) ) ( ON ?auto_117260 ?auto_117266 ) ( not ( = ?auto_117260 ?auto_117266 ) ) ( not ( = ?auto_117261 ?auto_117266 ) ) ( not ( = ?auto_117262 ?auto_117266 ) ) ( not ( = ?auto_117263 ?auto_117266 ) ) ( not ( = ?auto_117264 ?auto_117266 ) ) ( not ( = ?auto_117267 ?auto_117266 ) ) ( not ( = ?auto_117265 ?auto_117266 ) ) ( ON ?auto_117261 ?auto_117260 ) ( ON-TABLE ?auto_117266 ) ( ON ?auto_117262 ?auto_117261 ) ( ON ?auto_117263 ?auto_117262 ) ( ON ?auto_117265 ?auto_117263 ) ( CLEAR ?auto_117264 ) ( ON ?auto_117267 ?auto_117265 ) ( CLEAR ?auto_117267 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_117266 ?auto_117260 ?auto_117261 ?auto_117262 ?auto_117263 ?auto_117265 )
      ( MAKE-3PILE ?auto_117260 ?auto_117261 ?auto_117262 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117268 - BLOCK
      ?auto_117269 - BLOCK
      ?auto_117270 - BLOCK
    )
    :vars
    (
      ?auto_117275 - BLOCK
      ?auto_117271 - BLOCK
      ?auto_117273 - BLOCK
      ?auto_117274 - BLOCK
      ?auto_117272 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117268 ?auto_117269 ) ) ( not ( = ?auto_117268 ?auto_117270 ) ) ( not ( = ?auto_117269 ?auto_117270 ) ) ( not ( = ?auto_117268 ?auto_117275 ) ) ( not ( = ?auto_117269 ?auto_117275 ) ) ( not ( = ?auto_117270 ?auto_117275 ) ) ( not ( = ?auto_117271 ?auto_117273 ) ) ( not ( = ?auto_117271 ?auto_117274 ) ) ( not ( = ?auto_117271 ?auto_117275 ) ) ( not ( = ?auto_117271 ?auto_117270 ) ) ( not ( = ?auto_117271 ?auto_117269 ) ) ( not ( = ?auto_117273 ?auto_117274 ) ) ( not ( = ?auto_117273 ?auto_117275 ) ) ( not ( = ?auto_117273 ?auto_117270 ) ) ( not ( = ?auto_117273 ?auto_117269 ) ) ( not ( = ?auto_117274 ?auto_117275 ) ) ( not ( = ?auto_117274 ?auto_117270 ) ) ( not ( = ?auto_117274 ?auto_117269 ) ) ( not ( = ?auto_117268 ?auto_117271 ) ) ( not ( = ?auto_117268 ?auto_117273 ) ) ( not ( = ?auto_117268 ?auto_117274 ) ) ( ON ?auto_117268 ?auto_117272 ) ( not ( = ?auto_117268 ?auto_117272 ) ) ( not ( = ?auto_117269 ?auto_117272 ) ) ( not ( = ?auto_117270 ?auto_117272 ) ) ( not ( = ?auto_117275 ?auto_117272 ) ) ( not ( = ?auto_117271 ?auto_117272 ) ) ( not ( = ?auto_117273 ?auto_117272 ) ) ( not ( = ?auto_117274 ?auto_117272 ) ) ( ON ?auto_117269 ?auto_117268 ) ( ON-TABLE ?auto_117272 ) ( ON ?auto_117270 ?auto_117269 ) ( ON ?auto_117275 ?auto_117270 ) ( ON ?auto_117274 ?auto_117275 ) ( ON ?auto_117273 ?auto_117274 ) ( CLEAR ?auto_117273 ) ( HOLDING ?auto_117271 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_117271 )
      ( MAKE-3PILE ?auto_117268 ?auto_117269 ?auto_117270 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117276 - BLOCK
      ?auto_117277 - BLOCK
      ?auto_117278 - BLOCK
    )
    :vars
    (
      ?auto_117280 - BLOCK
      ?auto_117282 - BLOCK
      ?auto_117279 - BLOCK
      ?auto_117281 - BLOCK
      ?auto_117283 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117276 ?auto_117277 ) ) ( not ( = ?auto_117276 ?auto_117278 ) ) ( not ( = ?auto_117277 ?auto_117278 ) ) ( not ( = ?auto_117276 ?auto_117280 ) ) ( not ( = ?auto_117277 ?auto_117280 ) ) ( not ( = ?auto_117278 ?auto_117280 ) ) ( not ( = ?auto_117282 ?auto_117279 ) ) ( not ( = ?auto_117282 ?auto_117281 ) ) ( not ( = ?auto_117282 ?auto_117280 ) ) ( not ( = ?auto_117282 ?auto_117278 ) ) ( not ( = ?auto_117282 ?auto_117277 ) ) ( not ( = ?auto_117279 ?auto_117281 ) ) ( not ( = ?auto_117279 ?auto_117280 ) ) ( not ( = ?auto_117279 ?auto_117278 ) ) ( not ( = ?auto_117279 ?auto_117277 ) ) ( not ( = ?auto_117281 ?auto_117280 ) ) ( not ( = ?auto_117281 ?auto_117278 ) ) ( not ( = ?auto_117281 ?auto_117277 ) ) ( not ( = ?auto_117276 ?auto_117282 ) ) ( not ( = ?auto_117276 ?auto_117279 ) ) ( not ( = ?auto_117276 ?auto_117281 ) ) ( ON ?auto_117276 ?auto_117283 ) ( not ( = ?auto_117276 ?auto_117283 ) ) ( not ( = ?auto_117277 ?auto_117283 ) ) ( not ( = ?auto_117278 ?auto_117283 ) ) ( not ( = ?auto_117280 ?auto_117283 ) ) ( not ( = ?auto_117282 ?auto_117283 ) ) ( not ( = ?auto_117279 ?auto_117283 ) ) ( not ( = ?auto_117281 ?auto_117283 ) ) ( ON ?auto_117277 ?auto_117276 ) ( ON-TABLE ?auto_117283 ) ( ON ?auto_117278 ?auto_117277 ) ( ON ?auto_117280 ?auto_117278 ) ( ON ?auto_117281 ?auto_117280 ) ( ON ?auto_117279 ?auto_117281 ) ( ON ?auto_117282 ?auto_117279 ) ( CLEAR ?auto_117282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_117283 ?auto_117276 ?auto_117277 ?auto_117278 ?auto_117280 ?auto_117281 ?auto_117279 )
      ( MAKE-3PILE ?auto_117276 ?auto_117277 ?auto_117278 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117287 - BLOCK
      ?auto_117288 - BLOCK
      ?auto_117289 - BLOCK
    )
    :vars
    (
      ?auto_117290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117290 ?auto_117289 ) ( CLEAR ?auto_117290 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_117287 ) ( ON ?auto_117288 ?auto_117287 ) ( ON ?auto_117289 ?auto_117288 ) ( not ( = ?auto_117287 ?auto_117288 ) ) ( not ( = ?auto_117287 ?auto_117289 ) ) ( not ( = ?auto_117287 ?auto_117290 ) ) ( not ( = ?auto_117288 ?auto_117289 ) ) ( not ( = ?auto_117288 ?auto_117290 ) ) ( not ( = ?auto_117289 ?auto_117290 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_117290 ?auto_117289 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117291 - BLOCK
      ?auto_117292 - BLOCK
      ?auto_117293 - BLOCK
    )
    :vars
    (
      ?auto_117294 - BLOCK
      ?auto_117295 - BLOCK
      ?auto_117296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117294 ?auto_117293 ) ( CLEAR ?auto_117294 ) ( ON-TABLE ?auto_117291 ) ( ON ?auto_117292 ?auto_117291 ) ( ON ?auto_117293 ?auto_117292 ) ( not ( = ?auto_117291 ?auto_117292 ) ) ( not ( = ?auto_117291 ?auto_117293 ) ) ( not ( = ?auto_117291 ?auto_117294 ) ) ( not ( = ?auto_117292 ?auto_117293 ) ) ( not ( = ?auto_117292 ?auto_117294 ) ) ( not ( = ?auto_117293 ?auto_117294 ) ) ( HOLDING ?auto_117295 ) ( CLEAR ?auto_117296 ) ( not ( = ?auto_117291 ?auto_117295 ) ) ( not ( = ?auto_117291 ?auto_117296 ) ) ( not ( = ?auto_117292 ?auto_117295 ) ) ( not ( = ?auto_117292 ?auto_117296 ) ) ( not ( = ?auto_117293 ?auto_117295 ) ) ( not ( = ?auto_117293 ?auto_117296 ) ) ( not ( = ?auto_117294 ?auto_117295 ) ) ( not ( = ?auto_117294 ?auto_117296 ) ) ( not ( = ?auto_117295 ?auto_117296 ) ) )
    :subtasks
    ( ( !STACK ?auto_117295 ?auto_117296 )
      ( MAKE-3PILE ?auto_117291 ?auto_117292 ?auto_117293 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117297 - BLOCK
      ?auto_117298 - BLOCK
      ?auto_117299 - BLOCK
    )
    :vars
    (
      ?auto_117301 - BLOCK
      ?auto_117300 - BLOCK
      ?auto_117302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117301 ?auto_117299 ) ( ON-TABLE ?auto_117297 ) ( ON ?auto_117298 ?auto_117297 ) ( ON ?auto_117299 ?auto_117298 ) ( not ( = ?auto_117297 ?auto_117298 ) ) ( not ( = ?auto_117297 ?auto_117299 ) ) ( not ( = ?auto_117297 ?auto_117301 ) ) ( not ( = ?auto_117298 ?auto_117299 ) ) ( not ( = ?auto_117298 ?auto_117301 ) ) ( not ( = ?auto_117299 ?auto_117301 ) ) ( CLEAR ?auto_117300 ) ( not ( = ?auto_117297 ?auto_117302 ) ) ( not ( = ?auto_117297 ?auto_117300 ) ) ( not ( = ?auto_117298 ?auto_117302 ) ) ( not ( = ?auto_117298 ?auto_117300 ) ) ( not ( = ?auto_117299 ?auto_117302 ) ) ( not ( = ?auto_117299 ?auto_117300 ) ) ( not ( = ?auto_117301 ?auto_117302 ) ) ( not ( = ?auto_117301 ?auto_117300 ) ) ( not ( = ?auto_117302 ?auto_117300 ) ) ( ON ?auto_117302 ?auto_117301 ) ( CLEAR ?auto_117302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_117297 ?auto_117298 ?auto_117299 ?auto_117301 )
      ( MAKE-3PILE ?auto_117297 ?auto_117298 ?auto_117299 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117303 - BLOCK
      ?auto_117304 - BLOCK
      ?auto_117305 - BLOCK
    )
    :vars
    (
      ?auto_117308 - BLOCK
      ?auto_117307 - BLOCK
      ?auto_117306 - BLOCK
      ?auto_117309 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117308 ?auto_117305 ) ( ON-TABLE ?auto_117303 ) ( ON ?auto_117304 ?auto_117303 ) ( ON ?auto_117305 ?auto_117304 ) ( not ( = ?auto_117303 ?auto_117304 ) ) ( not ( = ?auto_117303 ?auto_117305 ) ) ( not ( = ?auto_117303 ?auto_117308 ) ) ( not ( = ?auto_117304 ?auto_117305 ) ) ( not ( = ?auto_117304 ?auto_117308 ) ) ( not ( = ?auto_117305 ?auto_117308 ) ) ( not ( = ?auto_117303 ?auto_117307 ) ) ( not ( = ?auto_117303 ?auto_117306 ) ) ( not ( = ?auto_117304 ?auto_117307 ) ) ( not ( = ?auto_117304 ?auto_117306 ) ) ( not ( = ?auto_117305 ?auto_117307 ) ) ( not ( = ?auto_117305 ?auto_117306 ) ) ( not ( = ?auto_117308 ?auto_117307 ) ) ( not ( = ?auto_117308 ?auto_117306 ) ) ( not ( = ?auto_117307 ?auto_117306 ) ) ( ON ?auto_117307 ?auto_117308 ) ( CLEAR ?auto_117307 ) ( HOLDING ?auto_117306 ) ( CLEAR ?auto_117309 ) ( ON-TABLE ?auto_117309 ) ( not ( = ?auto_117309 ?auto_117306 ) ) ( not ( = ?auto_117303 ?auto_117309 ) ) ( not ( = ?auto_117304 ?auto_117309 ) ) ( not ( = ?auto_117305 ?auto_117309 ) ) ( not ( = ?auto_117308 ?auto_117309 ) ) ( not ( = ?auto_117307 ?auto_117309 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_117309 ?auto_117306 )
      ( MAKE-3PILE ?auto_117303 ?auto_117304 ?auto_117305 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117310 - BLOCK
      ?auto_117311 - BLOCK
      ?auto_117312 - BLOCK
    )
    :vars
    (
      ?auto_117313 - BLOCK
      ?auto_117314 - BLOCK
      ?auto_117315 - BLOCK
      ?auto_117316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117313 ?auto_117312 ) ( ON-TABLE ?auto_117310 ) ( ON ?auto_117311 ?auto_117310 ) ( ON ?auto_117312 ?auto_117311 ) ( not ( = ?auto_117310 ?auto_117311 ) ) ( not ( = ?auto_117310 ?auto_117312 ) ) ( not ( = ?auto_117310 ?auto_117313 ) ) ( not ( = ?auto_117311 ?auto_117312 ) ) ( not ( = ?auto_117311 ?auto_117313 ) ) ( not ( = ?auto_117312 ?auto_117313 ) ) ( not ( = ?auto_117310 ?auto_117314 ) ) ( not ( = ?auto_117310 ?auto_117315 ) ) ( not ( = ?auto_117311 ?auto_117314 ) ) ( not ( = ?auto_117311 ?auto_117315 ) ) ( not ( = ?auto_117312 ?auto_117314 ) ) ( not ( = ?auto_117312 ?auto_117315 ) ) ( not ( = ?auto_117313 ?auto_117314 ) ) ( not ( = ?auto_117313 ?auto_117315 ) ) ( not ( = ?auto_117314 ?auto_117315 ) ) ( ON ?auto_117314 ?auto_117313 ) ( CLEAR ?auto_117316 ) ( ON-TABLE ?auto_117316 ) ( not ( = ?auto_117316 ?auto_117315 ) ) ( not ( = ?auto_117310 ?auto_117316 ) ) ( not ( = ?auto_117311 ?auto_117316 ) ) ( not ( = ?auto_117312 ?auto_117316 ) ) ( not ( = ?auto_117313 ?auto_117316 ) ) ( not ( = ?auto_117314 ?auto_117316 ) ) ( ON ?auto_117315 ?auto_117314 ) ( CLEAR ?auto_117315 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_117310 ?auto_117311 ?auto_117312 ?auto_117313 ?auto_117314 )
      ( MAKE-3PILE ?auto_117310 ?auto_117311 ?auto_117312 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117317 - BLOCK
      ?auto_117318 - BLOCK
      ?auto_117319 - BLOCK
    )
    :vars
    (
      ?auto_117323 - BLOCK
      ?auto_117322 - BLOCK
      ?auto_117321 - BLOCK
      ?auto_117320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117323 ?auto_117319 ) ( ON-TABLE ?auto_117317 ) ( ON ?auto_117318 ?auto_117317 ) ( ON ?auto_117319 ?auto_117318 ) ( not ( = ?auto_117317 ?auto_117318 ) ) ( not ( = ?auto_117317 ?auto_117319 ) ) ( not ( = ?auto_117317 ?auto_117323 ) ) ( not ( = ?auto_117318 ?auto_117319 ) ) ( not ( = ?auto_117318 ?auto_117323 ) ) ( not ( = ?auto_117319 ?auto_117323 ) ) ( not ( = ?auto_117317 ?auto_117322 ) ) ( not ( = ?auto_117317 ?auto_117321 ) ) ( not ( = ?auto_117318 ?auto_117322 ) ) ( not ( = ?auto_117318 ?auto_117321 ) ) ( not ( = ?auto_117319 ?auto_117322 ) ) ( not ( = ?auto_117319 ?auto_117321 ) ) ( not ( = ?auto_117323 ?auto_117322 ) ) ( not ( = ?auto_117323 ?auto_117321 ) ) ( not ( = ?auto_117322 ?auto_117321 ) ) ( ON ?auto_117322 ?auto_117323 ) ( not ( = ?auto_117320 ?auto_117321 ) ) ( not ( = ?auto_117317 ?auto_117320 ) ) ( not ( = ?auto_117318 ?auto_117320 ) ) ( not ( = ?auto_117319 ?auto_117320 ) ) ( not ( = ?auto_117323 ?auto_117320 ) ) ( not ( = ?auto_117322 ?auto_117320 ) ) ( ON ?auto_117321 ?auto_117322 ) ( CLEAR ?auto_117321 ) ( HOLDING ?auto_117320 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_117320 )
      ( MAKE-3PILE ?auto_117317 ?auto_117318 ?auto_117319 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117324 - BLOCK
      ?auto_117325 - BLOCK
      ?auto_117326 - BLOCK
    )
    :vars
    (
      ?auto_117327 - BLOCK
      ?auto_117329 - BLOCK
      ?auto_117330 - BLOCK
      ?auto_117328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117327 ?auto_117326 ) ( ON-TABLE ?auto_117324 ) ( ON ?auto_117325 ?auto_117324 ) ( ON ?auto_117326 ?auto_117325 ) ( not ( = ?auto_117324 ?auto_117325 ) ) ( not ( = ?auto_117324 ?auto_117326 ) ) ( not ( = ?auto_117324 ?auto_117327 ) ) ( not ( = ?auto_117325 ?auto_117326 ) ) ( not ( = ?auto_117325 ?auto_117327 ) ) ( not ( = ?auto_117326 ?auto_117327 ) ) ( not ( = ?auto_117324 ?auto_117329 ) ) ( not ( = ?auto_117324 ?auto_117330 ) ) ( not ( = ?auto_117325 ?auto_117329 ) ) ( not ( = ?auto_117325 ?auto_117330 ) ) ( not ( = ?auto_117326 ?auto_117329 ) ) ( not ( = ?auto_117326 ?auto_117330 ) ) ( not ( = ?auto_117327 ?auto_117329 ) ) ( not ( = ?auto_117327 ?auto_117330 ) ) ( not ( = ?auto_117329 ?auto_117330 ) ) ( ON ?auto_117329 ?auto_117327 ) ( not ( = ?auto_117328 ?auto_117330 ) ) ( not ( = ?auto_117324 ?auto_117328 ) ) ( not ( = ?auto_117325 ?auto_117328 ) ) ( not ( = ?auto_117326 ?auto_117328 ) ) ( not ( = ?auto_117327 ?auto_117328 ) ) ( not ( = ?auto_117329 ?auto_117328 ) ) ( ON ?auto_117330 ?auto_117329 ) ( ON ?auto_117328 ?auto_117330 ) ( CLEAR ?auto_117328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_117324 ?auto_117325 ?auto_117326 ?auto_117327 ?auto_117329 ?auto_117330 )
      ( MAKE-3PILE ?auto_117324 ?auto_117325 ?auto_117326 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117331 - BLOCK
      ?auto_117332 - BLOCK
      ?auto_117333 - BLOCK
    )
    :vars
    (
      ?auto_117335 - BLOCK
      ?auto_117337 - BLOCK
      ?auto_117334 - BLOCK
      ?auto_117336 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117335 ?auto_117333 ) ( ON-TABLE ?auto_117331 ) ( ON ?auto_117332 ?auto_117331 ) ( ON ?auto_117333 ?auto_117332 ) ( not ( = ?auto_117331 ?auto_117332 ) ) ( not ( = ?auto_117331 ?auto_117333 ) ) ( not ( = ?auto_117331 ?auto_117335 ) ) ( not ( = ?auto_117332 ?auto_117333 ) ) ( not ( = ?auto_117332 ?auto_117335 ) ) ( not ( = ?auto_117333 ?auto_117335 ) ) ( not ( = ?auto_117331 ?auto_117337 ) ) ( not ( = ?auto_117331 ?auto_117334 ) ) ( not ( = ?auto_117332 ?auto_117337 ) ) ( not ( = ?auto_117332 ?auto_117334 ) ) ( not ( = ?auto_117333 ?auto_117337 ) ) ( not ( = ?auto_117333 ?auto_117334 ) ) ( not ( = ?auto_117335 ?auto_117337 ) ) ( not ( = ?auto_117335 ?auto_117334 ) ) ( not ( = ?auto_117337 ?auto_117334 ) ) ( ON ?auto_117337 ?auto_117335 ) ( not ( = ?auto_117336 ?auto_117334 ) ) ( not ( = ?auto_117331 ?auto_117336 ) ) ( not ( = ?auto_117332 ?auto_117336 ) ) ( not ( = ?auto_117333 ?auto_117336 ) ) ( not ( = ?auto_117335 ?auto_117336 ) ) ( not ( = ?auto_117337 ?auto_117336 ) ) ( ON ?auto_117334 ?auto_117337 ) ( HOLDING ?auto_117336 ) ( CLEAR ?auto_117334 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_117331 ?auto_117332 ?auto_117333 ?auto_117335 ?auto_117337 ?auto_117334 ?auto_117336 )
      ( MAKE-3PILE ?auto_117331 ?auto_117332 ?auto_117333 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117338 - BLOCK
      ?auto_117339 - BLOCK
      ?auto_117340 - BLOCK
    )
    :vars
    (
      ?auto_117343 - BLOCK
      ?auto_117344 - BLOCK
      ?auto_117342 - BLOCK
      ?auto_117341 - BLOCK
      ?auto_117345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117343 ?auto_117340 ) ( ON-TABLE ?auto_117338 ) ( ON ?auto_117339 ?auto_117338 ) ( ON ?auto_117340 ?auto_117339 ) ( not ( = ?auto_117338 ?auto_117339 ) ) ( not ( = ?auto_117338 ?auto_117340 ) ) ( not ( = ?auto_117338 ?auto_117343 ) ) ( not ( = ?auto_117339 ?auto_117340 ) ) ( not ( = ?auto_117339 ?auto_117343 ) ) ( not ( = ?auto_117340 ?auto_117343 ) ) ( not ( = ?auto_117338 ?auto_117344 ) ) ( not ( = ?auto_117338 ?auto_117342 ) ) ( not ( = ?auto_117339 ?auto_117344 ) ) ( not ( = ?auto_117339 ?auto_117342 ) ) ( not ( = ?auto_117340 ?auto_117344 ) ) ( not ( = ?auto_117340 ?auto_117342 ) ) ( not ( = ?auto_117343 ?auto_117344 ) ) ( not ( = ?auto_117343 ?auto_117342 ) ) ( not ( = ?auto_117344 ?auto_117342 ) ) ( ON ?auto_117344 ?auto_117343 ) ( not ( = ?auto_117341 ?auto_117342 ) ) ( not ( = ?auto_117338 ?auto_117341 ) ) ( not ( = ?auto_117339 ?auto_117341 ) ) ( not ( = ?auto_117340 ?auto_117341 ) ) ( not ( = ?auto_117343 ?auto_117341 ) ) ( not ( = ?auto_117344 ?auto_117341 ) ) ( ON ?auto_117342 ?auto_117344 ) ( CLEAR ?auto_117342 ) ( ON ?auto_117341 ?auto_117345 ) ( CLEAR ?auto_117341 ) ( HAND-EMPTY ) ( not ( = ?auto_117338 ?auto_117345 ) ) ( not ( = ?auto_117339 ?auto_117345 ) ) ( not ( = ?auto_117340 ?auto_117345 ) ) ( not ( = ?auto_117343 ?auto_117345 ) ) ( not ( = ?auto_117344 ?auto_117345 ) ) ( not ( = ?auto_117342 ?auto_117345 ) ) ( not ( = ?auto_117341 ?auto_117345 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_117341 ?auto_117345 )
      ( MAKE-3PILE ?auto_117338 ?auto_117339 ?auto_117340 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117346 - BLOCK
      ?auto_117347 - BLOCK
      ?auto_117348 - BLOCK
    )
    :vars
    (
      ?auto_117350 - BLOCK
      ?auto_117353 - BLOCK
      ?auto_117349 - BLOCK
      ?auto_117351 - BLOCK
      ?auto_117352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117350 ?auto_117348 ) ( ON-TABLE ?auto_117346 ) ( ON ?auto_117347 ?auto_117346 ) ( ON ?auto_117348 ?auto_117347 ) ( not ( = ?auto_117346 ?auto_117347 ) ) ( not ( = ?auto_117346 ?auto_117348 ) ) ( not ( = ?auto_117346 ?auto_117350 ) ) ( not ( = ?auto_117347 ?auto_117348 ) ) ( not ( = ?auto_117347 ?auto_117350 ) ) ( not ( = ?auto_117348 ?auto_117350 ) ) ( not ( = ?auto_117346 ?auto_117353 ) ) ( not ( = ?auto_117346 ?auto_117349 ) ) ( not ( = ?auto_117347 ?auto_117353 ) ) ( not ( = ?auto_117347 ?auto_117349 ) ) ( not ( = ?auto_117348 ?auto_117353 ) ) ( not ( = ?auto_117348 ?auto_117349 ) ) ( not ( = ?auto_117350 ?auto_117353 ) ) ( not ( = ?auto_117350 ?auto_117349 ) ) ( not ( = ?auto_117353 ?auto_117349 ) ) ( ON ?auto_117353 ?auto_117350 ) ( not ( = ?auto_117351 ?auto_117349 ) ) ( not ( = ?auto_117346 ?auto_117351 ) ) ( not ( = ?auto_117347 ?auto_117351 ) ) ( not ( = ?auto_117348 ?auto_117351 ) ) ( not ( = ?auto_117350 ?auto_117351 ) ) ( not ( = ?auto_117353 ?auto_117351 ) ) ( ON ?auto_117351 ?auto_117352 ) ( CLEAR ?auto_117351 ) ( not ( = ?auto_117346 ?auto_117352 ) ) ( not ( = ?auto_117347 ?auto_117352 ) ) ( not ( = ?auto_117348 ?auto_117352 ) ) ( not ( = ?auto_117350 ?auto_117352 ) ) ( not ( = ?auto_117353 ?auto_117352 ) ) ( not ( = ?auto_117349 ?auto_117352 ) ) ( not ( = ?auto_117351 ?auto_117352 ) ) ( HOLDING ?auto_117349 ) ( CLEAR ?auto_117353 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_117346 ?auto_117347 ?auto_117348 ?auto_117350 ?auto_117353 ?auto_117349 )
      ( MAKE-3PILE ?auto_117346 ?auto_117347 ?auto_117348 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117354 - BLOCK
      ?auto_117355 - BLOCK
      ?auto_117356 - BLOCK
    )
    :vars
    (
      ?auto_117357 - BLOCK
      ?auto_117358 - BLOCK
      ?auto_117360 - BLOCK
      ?auto_117359 - BLOCK
      ?auto_117361 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117357 ?auto_117356 ) ( ON-TABLE ?auto_117354 ) ( ON ?auto_117355 ?auto_117354 ) ( ON ?auto_117356 ?auto_117355 ) ( not ( = ?auto_117354 ?auto_117355 ) ) ( not ( = ?auto_117354 ?auto_117356 ) ) ( not ( = ?auto_117354 ?auto_117357 ) ) ( not ( = ?auto_117355 ?auto_117356 ) ) ( not ( = ?auto_117355 ?auto_117357 ) ) ( not ( = ?auto_117356 ?auto_117357 ) ) ( not ( = ?auto_117354 ?auto_117358 ) ) ( not ( = ?auto_117354 ?auto_117360 ) ) ( not ( = ?auto_117355 ?auto_117358 ) ) ( not ( = ?auto_117355 ?auto_117360 ) ) ( not ( = ?auto_117356 ?auto_117358 ) ) ( not ( = ?auto_117356 ?auto_117360 ) ) ( not ( = ?auto_117357 ?auto_117358 ) ) ( not ( = ?auto_117357 ?auto_117360 ) ) ( not ( = ?auto_117358 ?auto_117360 ) ) ( ON ?auto_117358 ?auto_117357 ) ( not ( = ?auto_117359 ?auto_117360 ) ) ( not ( = ?auto_117354 ?auto_117359 ) ) ( not ( = ?auto_117355 ?auto_117359 ) ) ( not ( = ?auto_117356 ?auto_117359 ) ) ( not ( = ?auto_117357 ?auto_117359 ) ) ( not ( = ?auto_117358 ?auto_117359 ) ) ( ON ?auto_117359 ?auto_117361 ) ( not ( = ?auto_117354 ?auto_117361 ) ) ( not ( = ?auto_117355 ?auto_117361 ) ) ( not ( = ?auto_117356 ?auto_117361 ) ) ( not ( = ?auto_117357 ?auto_117361 ) ) ( not ( = ?auto_117358 ?auto_117361 ) ) ( not ( = ?auto_117360 ?auto_117361 ) ) ( not ( = ?auto_117359 ?auto_117361 ) ) ( CLEAR ?auto_117358 ) ( ON ?auto_117360 ?auto_117359 ) ( CLEAR ?auto_117360 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_117361 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_117361 ?auto_117359 )
      ( MAKE-3PILE ?auto_117354 ?auto_117355 ?auto_117356 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117362 - BLOCK
      ?auto_117363 - BLOCK
      ?auto_117364 - BLOCK
    )
    :vars
    (
      ?auto_117367 - BLOCK
      ?auto_117369 - BLOCK
      ?auto_117368 - BLOCK
      ?auto_117366 - BLOCK
      ?auto_117365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117367 ?auto_117364 ) ( ON-TABLE ?auto_117362 ) ( ON ?auto_117363 ?auto_117362 ) ( ON ?auto_117364 ?auto_117363 ) ( not ( = ?auto_117362 ?auto_117363 ) ) ( not ( = ?auto_117362 ?auto_117364 ) ) ( not ( = ?auto_117362 ?auto_117367 ) ) ( not ( = ?auto_117363 ?auto_117364 ) ) ( not ( = ?auto_117363 ?auto_117367 ) ) ( not ( = ?auto_117364 ?auto_117367 ) ) ( not ( = ?auto_117362 ?auto_117369 ) ) ( not ( = ?auto_117362 ?auto_117368 ) ) ( not ( = ?auto_117363 ?auto_117369 ) ) ( not ( = ?auto_117363 ?auto_117368 ) ) ( not ( = ?auto_117364 ?auto_117369 ) ) ( not ( = ?auto_117364 ?auto_117368 ) ) ( not ( = ?auto_117367 ?auto_117369 ) ) ( not ( = ?auto_117367 ?auto_117368 ) ) ( not ( = ?auto_117369 ?auto_117368 ) ) ( not ( = ?auto_117366 ?auto_117368 ) ) ( not ( = ?auto_117362 ?auto_117366 ) ) ( not ( = ?auto_117363 ?auto_117366 ) ) ( not ( = ?auto_117364 ?auto_117366 ) ) ( not ( = ?auto_117367 ?auto_117366 ) ) ( not ( = ?auto_117369 ?auto_117366 ) ) ( ON ?auto_117366 ?auto_117365 ) ( not ( = ?auto_117362 ?auto_117365 ) ) ( not ( = ?auto_117363 ?auto_117365 ) ) ( not ( = ?auto_117364 ?auto_117365 ) ) ( not ( = ?auto_117367 ?auto_117365 ) ) ( not ( = ?auto_117369 ?auto_117365 ) ) ( not ( = ?auto_117368 ?auto_117365 ) ) ( not ( = ?auto_117366 ?auto_117365 ) ) ( ON ?auto_117368 ?auto_117366 ) ( CLEAR ?auto_117368 ) ( ON-TABLE ?auto_117365 ) ( HOLDING ?auto_117369 ) ( CLEAR ?auto_117367 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_117362 ?auto_117363 ?auto_117364 ?auto_117367 ?auto_117369 )
      ( MAKE-3PILE ?auto_117362 ?auto_117363 ?auto_117364 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117370 - BLOCK
      ?auto_117371 - BLOCK
      ?auto_117372 - BLOCK
    )
    :vars
    (
      ?auto_117376 - BLOCK
      ?auto_117373 - BLOCK
      ?auto_117375 - BLOCK
      ?auto_117374 - BLOCK
      ?auto_117377 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117376 ?auto_117372 ) ( ON-TABLE ?auto_117370 ) ( ON ?auto_117371 ?auto_117370 ) ( ON ?auto_117372 ?auto_117371 ) ( not ( = ?auto_117370 ?auto_117371 ) ) ( not ( = ?auto_117370 ?auto_117372 ) ) ( not ( = ?auto_117370 ?auto_117376 ) ) ( not ( = ?auto_117371 ?auto_117372 ) ) ( not ( = ?auto_117371 ?auto_117376 ) ) ( not ( = ?auto_117372 ?auto_117376 ) ) ( not ( = ?auto_117370 ?auto_117373 ) ) ( not ( = ?auto_117370 ?auto_117375 ) ) ( not ( = ?auto_117371 ?auto_117373 ) ) ( not ( = ?auto_117371 ?auto_117375 ) ) ( not ( = ?auto_117372 ?auto_117373 ) ) ( not ( = ?auto_117372 ?auto_117375 ) ) ( not ( = ?auto_117376 ?auto_117373 ) ) ( not ( = ?auto_117376 ?auto_117375 ) ) ( not ( = ?auto_117373 ?auto_117375 ) ) ( not ( = ?auto_117374 ?auto_117375 ) ) ( not ( = ?auto_117370 ?auto_117374 ) ) ( not ( = ?auto_117371 ?auto_117374 ) ) ( not ( = ?auto_117372 ?auto_117374 ) ) ( not ( = ?auto_117376 ?auto_117374 ) ) ( not ( = ?auto_117373 ?auto_117374 ) ) ( ON ?auto_117374 ?auto_117377 ) ( not ( = ?auto_117370 ?auto_117377 ) ) ( not ( = ?auto_117371 ?auto_117377 ) ) ( not ( = ?auto_117372 ?auto_117377 ) ) ( not ( = ?auto_117376 ?auto_117377 ) ) ( not ( = ?auto_117373 ?auto_117377 ) ) ( not ( = ?auto_117375 ?auto_117377 ) ) ( not ( = ?auto_117374 ?auto_117377 ) ) ( ON ?auto_117375 ?auto_117374 ) ( ON-TABLE ?auto_117377 ) ( CLEAR ?auto_117376 ) ( ON ?auto_117373 ?auto_117375 ) ( CLEAR ?auto_117373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_117377 ?auto_117374 ?auto_117375 )
      ( MAKE-3PILE ?auto_117370 ?auto_117371 ?auto_117372 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117394 - BLOCK
      ?auto_117395 - BLOCK
      ?auto_117396 - BLOCK
    )
    :vars
    (
      ?auto_117397 - BLOCK
      ?auto_117400 - BLOCK
      ?auto_117401 - BLOCK
      ?auto_117399 - BLOCK
      ?auto_117398 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117394 ) ( ON ?auto_117395 ?auto_117394 ) ( not ( = ?auto_117394 ?auto_117395 ) ) ( not ( = ?auto_117394 ?auto_117396 ) ) ( not ( = ?auto_117394 ?auto_117397 ) ) ( not ( = ?auto_117395 ?auto_117396 ) ) ( not ( = ?auto_117395 ?auto_117397 ) ) ( not ( = ?auto_117396 ?auto_117397 ) ) ( not ( = ?auto_117394 ?auto_117400 ) ) ( not ( = ?auto_117394 ?auto_117401 ) ) ( not ( = ?auto_117395 ?auto_117400 ) ) ( not ( = ?auto_117395 ?auto_117401 ) ) ( not ( = ?auto_117396 ?auto_117400 ) ) ( not ( = ?auto_117396 ?auto_117401 ) ) ( not ( = ?auto_117397 ?auto_117400 ) ) ( not ( = ?auto_117397 ?auto_117401 ) ) ( not ( = ?auto_117400 ?auto_117401 ) ) ( not ( = ?auto_117399 ?auto_117401 ) ) ( not ( = ?auto_117394 ?auto_117399 ) ) ( not ( = ?auto_117395 ?auto_117399 ) ) ( not ( = ?auto_117396 ?auto_117399 ) ) ( not ( = ?auto_117397 ?auto_117399 ) ) ( not ( = ?auto_117400 ?auto_117399 ) ) ( ON ?auto_117399 ?auto_117398 ) ( not ( = ?auto_117394 ?auto_117398 ) ) ( not ( = ?auto_117395 ?auto_117398 ) ) ( not ( = ?auto_117396 ?auto_117398 ) ) ( not ( = ?auto_117397 ?auto_117398 ) ) ( not ( = ?auto_117400 ?auto_117398 ) ) ( not ( = ?auto_117401 ?auto_117398 ) ) ( not ( = ?auto_117399 ?auto_117398 ) ) ( ON ?auto_117401 ?auto_117399 ) ( ON-TABLE ?auto_117398 ) ( ON ?auto_117400 ?auto_117401 ) ( ON ?auto_117397 ?auto_117400 ) ( CLEAR ?auto_117397 ) ( HOLDING ?auto_117396 ) ( CLEAR ?auto_117395 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_117394 ?auto_117395 ?auto_117396 ?auto_117397 )
      ( MAKE-3PILE ?auto_117394 ?auto_117395 ?auto_117396 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117402 - BLOCK
      ?auto_117403 - BLOCK
      ?auto_117404 - BLOCK
    )
    :vars
    (
      ?auto_117409 - BLOCK
      ?auto_117405 - BLOCK
      ?auto_117406 - BLOCK
      ?auto_117407 - BLOCK
      ?auto_117408 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117402 ) ( ON ?auto_117403 ?auto_117402 ) ( not ( = ?auto_117402 ?auto_117403 ) ) ( not ( = ?auto_117402 ?auto_117404 ) ) ( not ( = ?auto_117402 ?auto_117409 ) ) ( not ( = ?auto_117403 ?auto_117404 ) ) ( not ( = ?auto_117403 ?auto_117409 ) ) ( not ( = ?auto_117404 ?auto_117409 ) ) ( not ( = ?auto_117402 ?auto_117405 ) ) ( not ( = ?auto_117402 ?auto_117406 ) ) ( not ( = ?auto_117403 ?auto_117405 ) ) ( not ( = ?auto_117403 ?auto_117406 ) ) ( not ( = ?auto_117404 ?auto_117405 ) ) ( not ( = ?auto_117404 ?auto_117406 ) ) ( not ( = ?auto_117409 ?auto_117405 ) ) ( not ( = ?auto_117409 ?auto_117406 ) ) ( not ( = ?auto_117405 ?auto_117406 ) ) ( not ( = ?auto_117407 ?auto_117406 ) ) ( not ( = ?auto_117402 ?auto_117407 ) ) ( not ( = ?auto_117403 ?auto_117407 ) ) ( not ( = ?auto_117404 ?auto_117407 ) ) ( not ( = ?auto_117409 ?auto_117407 ) ) ( not ( = ?auto_117405 ?auto_117407 ) ) ( ON ?auto_117407 ?auto_117408 ) ( not ( = ?auto_117402 ?auto_117408 ) ) ( not ( = ?auto_117403 ?auto_117408 ) ) ( not ( = ?auto_117404 ?auto_117408 ) ) ( not ( = ?auto_117409 ?auto_117408 ) ) ( not ( = ?auto_117405 ?auto_117408 ) ) ( not ( = ?auto_117406 ?auto_117408 ) ) ( not ( = ?auto_117407 ?auto_117408 ) ) ( ON ?auto_117406 ?auto_117407 ) ( ON-TABLE ?auto_117408 ) ( ON ?auto_117405 ?auto_117406 ) ( ON ?auto_117409 ?auto_117405 ) ( CLEAR ?auto_117403 ) ( ON ?auto_117404 ?auto_117409 ) ( CLEAR ?auto_117404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_117408 ?auto_117407 ?auto_117406 ?auto_117405 ?auto_117409 )
      ( MAKE-3PILE ?auto_117402 ?auto_117403 ?auto_117404 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117410 - BLOCK
      ?auto_117411 - BLOCK
      ?auto_117412 - BLOCK
    )
    :vars
    (
      ?auto_117414 - BLOCK
      ?auto_117416 - BLOCK
      ?auto_117413 - BLOCK
      ?auto_117417 - BLOCK
      ?auto_117415 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117410 ) ( not ( = ?auto_117410 ?auto_117411 ) ) ( not ( = ?auto_117410 ?auto_117412 ) ) ( not ( = ?auto_117410 ?auto_117414 ) ) ( not ( = ?auto_117411 ?auto_117412 ) ) ( not ( = ?auto_117411 ?auto_117414 ) ) ( not ( = ?auto_117412 ?auto_117414 ) ) ( not ( = ?auto_117410 ?auto_117416 ) ) ( not ( = ?auto_117410 ?auto_117413 ) ) ( not ( = ?auto_117411 ?auto_117416 ) ) ( not ( = ?auto_117411 ?auto_117413 ) ) ( not ( = ?auto_117412 ?auto_117416 ) ) ( not ( = ?auto_117412 ?auto_117413 ) ) ( not ( = ?auto_117414 ?auto_117416 ) ) ( not ( = ?auto_117414 ?auto_117413 ) ) ( not ( = ?auto_117416 ?auto_117413 ) ) ( not ( = ?auto_117417 ?auto_117413 ) ) ( not ( = ?auto_117410 ?auto_117417 ) ) ( not ( = ?auto_117411 ?auto_117417 ) ) ( not ( = ?auto_117412 ?auto_117417 ) ) ( not ( = ?auto_117414 ?auto_117417 ) ) ( not ( = ?auto_117416 ?auto_117417 ) ) ( ON ?auto_117417 ?auto_117415 ) ( not ( = ?auto_117410 ?auto_117415 ) ) ( not ( = ?auto_117411 ?auto_117415 ) ) ( not ( = ?auto_117412 ?auto_117415 ) ) ( not ( = ?auto_117414 ?auto_117415 ) ) ( not ( = ?auto_117416 ?auto_117415 ) ) ( not ( = ?auto_117413 ?auto_117415 ) ) ( not ( = ?auto_117417 ?auto_117415 ) ) ( ON ?auto_117413 ?auto_117417 ) ( ON-TABLE ?auto_117415 ) ( ON ?auto_117416 ?auto_117413 ) ( ON ?auto_117414 ?auto_117416 ) ( ON ?auto_117412 ?auto_117414 ) ( CLEAR ?auto_117412 ) ( HOLDING ?auto_117411 ) ( CLEAR ?auto_117410 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_117410 ?auto_117411 )
      ( MAKE-3PILE ?auto_117410 ?auto_117411 ?auto_117412 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117418 - BLOCK
      ?auto_117419 - BLOCK
      ?auto_117420 - BLOCK
    )
    :vars
    (
      ?auto_117425 - BLOCK
      ?auto_117422 - BLOCK
      ?auto_117423 - BLOCK
      ?auto_117424 - BLOCK
      ?auto_117421 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117418 ) ( not ( = ?auto_117418 ?auto_117419 ) ) ( not ( = ?auto_117418 ?auto_117420 ) ) ( not ( = ?auto_117418 ?auto_117425 ) ) ( not ( = ?auto_117419 ?auto_117420 ) ) ( not ( = ?auto_117419 ?auto_117425 ) ) ( not ( = ?auto_117420 ?auto_117425 ) ) ( not ( = ?auto_117418 ?auto_117422 ) ) ( not ( = ?auto_117418 ?auto_117423 ) ) ( not ( = ?auto_117419 ?auto_117422 ) ) ( not ( = ?auto_117419 ?auto_117423 ) ) ( not ( = ?auto_117420 ?auto_117422 ) ) ( not ( = ?auto_117420 ?auto_117423 ) ) ( not ( = ?auto_117425 ?auto_117422 ) ) ( not ( = ?auto_117425 ?auto_117423 ) ) ( not ( = ?auto_117422 ?auto_117423 ) ) ( not ( = ?auto_117424 ?auto_117423 ) ) ( not ( = ?auto_117418 ?auto_117424 ) ) ( not ( = ?auto_117419 ?auto_117424 ) ) ( not ( = ?auto_117420 ?auto_117424 ) ) ( not ( = ?auto_117425 ?auto_117424 ) ) ( not ( = ?auto_117422 ?auto_117424 ) ) ( ON ?auto_117424 ?auto_117421 ) ( not ( = ?auto_117418 ?auto_117421 ) ) ( not ( = ?auto_117419 ?auto_117421 ) ) ( not ( = ?auto_117420 ?auto_117421 ) ) ( not ( = ?auto_117425 ?auto_117421 ) ) ( not ( = ?auto_117422 ?auto_117421 ) ) ( not ( = ?auto_117423 ?auto_117421 ) ) ( not ( = ?auto_117424 ?auto_117421 ) ) ( ON ?auto_117423 ?auto_117424 ) ( ON-TABLE ?auto_117421 ) ( ON ?auto_117422 ?auto_117423 ) ( ON ?auto_117425 ?auto_117422 ) ( ON ?auto_117420 ?auto_117425 ) ( CLEAR ?auto_117418 ) ( ON ?auto_117419 ?auto_117420 ) ( CLEAR ?auto_117419 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_117421 ?auto_117424 ?auto_117423 ?auto_117422 ?auto_117425 ?auto_117420 )
      ( MAKE-3PILE ?auto_117418 ?auto_117419 ?auto_117420 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117426 - BLOCK
      ?auto_117427 - BLOCK
      ?auto_117428 - BLOCK
    )
    :vars
    (
      ?auto_117429 - BLOCK
      ?auto_117433 - BLOCK
      ?auto_117430 - BLOCK
      ?auto_117432 - BLOCK
      ?auto_117431 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117426 ?auto_117427 ) ) ( not ( = ?auto_117426 ?auto_117428 ) ) ( not ( = ?auto_117426 ?auto_117429 ) ) ( not ( = ?auto_117427 ?auto_117428 ) ) ( not ( = ?auto_117427 ?auto_117429 ) ) ( not ( = ?auto_117428 ?auto_117429 ) ) ( not ( = ?auto_117426 ?auto_117433 ) ) ( not ( = ?auto_117426 ?auto_117430 ) ) ( not ( = ?auto_117427 ?auto_117433 ) ) ( not ( = ?auto_117427 ?auto_117430 ) ) ( not ( = ?auto_117428 ?auto_117433 ) ) ( not ( = ?auto_117428 ?auto_117430 ) ) ( not ( = ?auto_117429 ?auto_117433 ) ) ( not ( = ?auto_117429 ?auto_117430 ) ) ( not ( = ?auto_117433 ?auto_117430 ) ) ( not ( = ?auto_117432 ?auto_117430 ) ) ( not ( = ?auto_117426 ?auto_117432 ) ) ( not ( = ?auto_117427 ?auto_117432 ) ) ( not ( = ?auto_117428 ?auto_117432 ) ) ( not ( = ?auto_117429 ?auto_117432 ) ) ( not ( = ?auto_117433 ?auto_117432 ) ) ( ON ?auto_117432 ?auto_117431 ) ( not ( = ?auto_117426 ?auto_117431 ) ) ( not ( = ?auto_117427 ?auto_117431 ) ) ( not ( = ?auto_117428 ?auto_117431 ) ) ( not ( = ?auto_117429 ?auto_117431 ) ) ( not ( = ?auto_117433 ?auto_117431 ) ) ( not ( = ?auto_117430 ?auto_117431 ) ) ( not ( = ?auto_117432 ?auto_117431 ) ) ( ON ?auto_117430 ?auto_117432 ) ( ON-TABLE ?auto_117431 ) ( ON ?auto_117433 ?auto_117430 ) ( ON ?auto_117429 ?auto_117433 ) ( ON ?auto_117428 ?auto_117429 ) ( ON ?auto_117427 ?auto_117428 ) ( CLEAR ?auto_117427 ) ( HOLDING ?auto_117426 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_117426 )
      ( MAKE-3PILE ?auto_117426 ?auto_117427 ?auto_117428 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117434 - BLOCK
      ?auto_117435 - BLOCK
      ?auto_117436 - BLOCK
    )
    :vars
    (
      ?auto_117439 - BLOCK
      ?auto_117437 - BLOCK
      ?auto_117441 - BLOCK
      ?auto_117438 - BLOCK
      ?auto_117440 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117434 ?auto_117435 ) ) ( not ( = ?auto_117434 ?auto_117436 ) ) ( not ( = ?auto_117434 ?auto_117439 ) ) ( not ( = ?auto_117435 ?auto_117436 ) ) ( not ( = ?auto_117435 ?auto_117439 ) ) ( not ( = ?auto_117436 ?auto_117439 ) ) ( not ( = ?auto_117434 ?auto_117437 ) ) ( not ( = ?auto_117434 ?auto_117441 ) ) ( not ( = ?auto_117435 ?auto_117437 ) ) ( not ( = ?auto_117435 ?auto_117441 ) ) ( not ( = ?auto_117436 ?auto_117437 ) ) ( not ( = ?auto_117436 ?auto_117441 ) ) ( not ( = ?auto_117439 ?auto_117437 ) ) ( not ( = ?auto_117439 ?auto_117441 ) ) ( not ( = ?auto_117437 ?auto_117441 ) ) ( not ( = ?auto_117438 ?auto_117441 ) ) ( not ( = ?auto_117434 ?auto_117438 ) ) ( not ( = ?auto_117435 ?auto_117438 ) ) ( not ( = ?auto_117436 ?auto_117438 ) ) ( not ( = ?auto_117439 ?auto_117438 ) ) ( not ( = ?auto_117437 ?auto_117438 ) ) ( ON ?auto_117438 ?auto_117440 ) ( not ( = ?auto_117434 ?auto_117440 ) ) ( not ( = ?auto_117435 ?auto_117440 ) ) ( not ( = ?auto_117436 ?auto_117440 ) ) ( not ( = ?auto_117439 ?auto_117440 ) ) ( not ( = ?auto_117437 ?auto_117440 ) ) ( not ( = ?auto_117441 ?auto_117440 ) ) ( not ( = ?auto_117438 ?auto_117440 ) ) ( ON ?auto_117441 ?auto_117438 ) ( ON-TABLE ?auto_117440 ) ( ON ?auto_117437 ?auto_117441 ) ( ON ?auto_117439 ?auto_117437 ) ( ON ?auto_117436 ?auto_117439 ) ( ON ?auto_117435 ?auto_117436 ) ( ON ?auto_117434 ?auto_117435 ) ( CLEAR ?auto_117434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_117440 ?auto_117438 ?auto_117441 ?auto_117437 ?auto_117439 ?auto_117436 ?auto_117435 )
      ( MAKE-3PILE ?auto_117434 ?auto_117435 ?auto_117436 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117446 - BLOCK
      ?auto_117447 - BLOCK
      ?auto_117448 - BLOCK
      ?auto_117449 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_117449 ) ( CLEAR ?auto_117448 ) ( ON-TABLE ?auto_117446 ) ( ON ?auto_117447 ?auto_117446 ) ( ON ?auto_117448 ?auto_117447 ) ( not ( = ?auto_117446 ?auto_117447 ) ) ( not ( = ?auto_117446 ?auto_117448 ) ) ( not ( = ?auto_117446 ?auto_117449 ) ) ( not ( = ?auto_117447 ?auto_117448 ) ) ( not ( = ?auto_117447 ?auto_117449 ) ) ( not ( = ?auto_117448 ?auto_117449 ) ) )
    :subtasks
    ( ( !STACK ?auto_117449 ?auto_117448 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117450 - BLOCK
      ?auto_117451 - BLOCK
      ?auto_117452 - BLOCK
      ?auto_117453 - BLOCK
    )
    :vars
    (
      ?auto_117454 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_117452 ) ( ON-TABLE ?auto_117450 ) ( ON ?auto_117451 ?auto_117450 ) ( ON ?auto_117452 ?auto_117451 ) ( not ( = ?auto_117450 ?auto_117451 ) ) ( not ( = ?auto_117450 ?auto_117452 ) ) ( not ( = ?auto_117450 ?auto_117453 ) ) ( not ( = ?auto_117451 ?auto_117452 ) ) ( not ( = ?auto_117451 ?auto_117453 ) ) ( not ( = ?auto_117452 ?auto_117453 ) ) ( ON ?auto_117453 ?auto_117454 ) ( CLEAR ?auto_117453 ) ( HAND-EMPTY ) ( not ( = ?auto_117450 ?auto_117454 ) ) ( not ( = ?auto_117451 ?auto_117454 ) ) ( not ( = ?auto_117452 ?auto_117454 ) ) ( not ( = ?auto_117453 ?auto_117454 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_117453 ?auto_117454 )
      ( MAKE-4PILE ?auto_117450 ?auto_117451 ?auto_117452 ?auto_117453 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117455 - BLOCK
      ?auto_117456 - BLOCK
      ?auto_117457 - BLOCK
      ?auto_117458 - BLOCK
    )
    :vars
    (
      ?auto_117459 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117455 ) ( ON ?auto_117456 ?auto_117455 ) ( not ( = ?auto_117455 ?auto_117456 ) ) ( not ( = ?auto_117455 ?auto_117457 ) ) ( not ( = ?auto_117455 ?auto_117458 ) ) ( not ( = ?auto_117456 ?auto_117457 ) ) ( not ( = ?auto_117456 ?auto_117458 ) ) ( not ( = ?auto_117457 ?auto_117458 ) ) ( ON ?auto_117458 ?auto_117459 ) ( CLEAR ?auto_117458 ) ( not ( = ?auto_117455 ?auto_117459 ) ) ( not ( = ?auto_117456 ?auto_117459 ) ) ( not ( = ?auto_117457 ?auto_117459 ) ) ( not ( = ?auto_117458 ?auto_117459 ) ) ( HOLDING ?auto_117457 ) ( CLEAR ?auto_117456 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_117455 ?auto_117456 ?auto_117457 )
      ( MAKE-4PILE ?auto_117455 ?auto_117456 ?auto_117457 ?auto_117458 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117460 - BLOCK
      ?auto_117461 - BLOCK
      ?auto_117462 - BLOCK
      ?auto_117463 - BLOCK
    )
    :vars
    (
      ?auto_117464 - BLOCK
      ?auto_117466 - BLOCK
      ?auto_117465 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117460 ) ( ON ?auto_117461 ?auto_117460 ) ( not ( = ?auto_117460 ?auto_117461 ) ) ( not ( = ?auto_117460 ?auto_117462 ) ) ( not ( = ?auto_117460 ?auto_117463 ) ) ( not ( = ?auto_117461 ?auto_117462 ) ) ( not ( = ?auto_117461 ?auto_117463 ) ) ( not ( = ?auto_117462 ?auto_117463 ) ) ( ON ?auto_117463 ?auto_117464 ) ( not ( = ?auto_117460 ?auto_117464 ) ) ( not ( = ?auto_117461 ?auto_117464 ) ) ( not ( = ?auto_117462 ?auto_117464 ) ) ( not ( = ?auto_117463 ?auto_117464 ) ) ( CLEAR ?auto_117461 ) ( ON ?auto_117462 ?auto_117463 ) ( CLEAR ?auto_117462 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_117466 ) ( ON ?auto_117465 ?auto_117466 ) ( ON ?auto_117464 ?auto_117465 ) ( not ( = ?auto_117466 ?auto_117465 ) ) ( not ( = ?auto_117466 ?auto_117464 ) ) ( not ( = ?auto_117466 ?auto_117463 ) ) ( not ( = ?auto_117466 ?auto_117462 ) ) ( not ( = ?auto_117465 ?auto_117464 ) ) ( not ( = ?auto_117465 ?auto_117463 ) ) ( not ( = ?auto_117465 ?auto_117462 ) ) ( not ( = ?auto_117460 ?auto_117466 ) ) ( not ( = ?auto_117460 ?auto_117465 ) ) ( not ( = ?auto_117461 ?auto_117466 ) ) ( not ( = ?auto_117461 ?auto_117465 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_117466 ?auto_117465 ?auto_117464 ?auto_117463 )
      ( MAKE-4PILE ?auto_117460 ?auto_117461 ?auto_117462 ?auto_117463 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117467 - BLOCK
      ?auto_117468 - BLOCK
      ?auto_117469 - BLOCK
      ?auto_117470 - BLOCK
    )
    :vars
    (
      ?auto_117471 - BLOCK
      ?auto_117472 - BLOCK
      ?auto_117473 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117467 ) ( not ( = ?auto_117467 ?auto_117468 ) ) ( not ( = ?auto_117467 ?auto_117469 ) ) ( not ( = ?auto_117467 ?auto_117470 ) ) ( not ( = ?auto_117468 ?auto_117469 ) ) ( not ( = ?auto_117468 ?auto_117470 ) ) ( not ( = ?auto_117469 ?auto_117470 ) ) ( ON ?auto_117470 ?auto_117471 ) ( not ( = ?auto_117467 ?auto_117471 ) ) ( not ( = ?auto_117468 ?auto_117471 ) ) ( not ( = ?auto_117469 ?auto_117471 ) ) ( not ( = ?auto_117470 ?auto_117471 ) ) ( ON ?auto_117469 ?auto_117470 ) ( CLEAR ?auto_117469 ) ( ON-TABLE ?auto_117472 ) ( ON ?auto_117473 ?auto_117472 ) ( ON ?auto_117471 ?auto_117473 ) ( not ( = ?auto_117472 ?auto_117473 ) ) ( not ( = ?auto_117472 ?auto_117471 ) ) ( not ( = ?auto_117472 ?auto_117470 ) ) ( not ( = ?auto_117472 ?auto_117469 ) ) ( not ( = ?auto_117473 ?auto_117471 ) ) ( not ( = ?auto_117473 ?auto_117470 ) ) ( not ( = ?auto_117473 ?auto_117469 ) ) ( not ( = ?auto_117467 ?auto_117472 ) ) ( not ( = ?auto_117467 ?auto_117473 ) ) ( not ( = ?auto_117468 ?auto_117472 ) ) ( not ( = ?auto_117468 ?auto_117473 ) ) ( HOLDING ?auto_117468 ) ( CLEAR ?auto_117467 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_117467 ?auto_117468 )
      ( MAKE-4PILE ?auto_117467 ?auto_117468 ?auto_117469 ?auto_117470 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117474 - BLOCK
      ?auto_117475 - BLOCK
      ?auto_117476 - BLOCK
      ?auto_117477 - BLOCK
    )
    :vars
    (
      ?auto_117478 - BLOCK
      ?auto_117479 - BLOCK
      ?auto_117480 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117474 ) ( not ( = ?auto_117474 ?auto_117475 ) ) ( not ( = ?auto_117474 ?auto_117476 ) ) ( not ( = ?auto_117474 ?auto_117477 ) ) ( not ( = ?auto_117475 ?auto_117476 ) ) ( not ( = ?auto_117475 ?auto_117477 ) ) ( not ( = ?auto_117476 ?auto_117477 ) ) ( ON ?auto_117477 ?auto_117478 ) ( not ( = ?auto_117474 ?auto_117478 ) ) ( not ( = ?auto_117475 ?auto_117478 ) ) ( not ( = ?auto_117476 ?auto_117478 ) ) ( not ( = ?auto_117477 ?auto_117478 ) ) ( ON ?auto_117476 ?auto_117477 ) ( ON-TABLE ?auto_117479 ) ( ON ?auto_117480 ?auto_117479 ) ( ON ?auto_117478 ?auto_117480 ) ( not ( = ?auto_117479 ?auto_117480 ) ) ( not ( = ?auto_117479 ?auto_117478 ) ) ( not ( = ?auto_117479 ?auto_117477 ) ) ( not ( = ?auto_117479 ?auto_117476 ) ) ( not ( = ?auto_117480 ?auto_117478 ) ) ( not ( = ?auto_117480 ?auto_117477 ) ) ( not ( = ?auto_117480 ?auto_117476 ) ) ( not ( = ?auto_117474 ?auto_117479 ) ) ( not ( = ?auto_117474 ?auto_117480 ) ) ( not ( = ?auto_117475 ?auto_117479 ) ) ( not ( = ?auto_117475 ?auto_117480 ) ) ( CLEAR ?auto_117474 ) ( ON ?auto_117475 ?auto_117476 ) ( CLEAR ?auto_117475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_117479 ?auto_117480 ?auto_117478 ?auto_117477 ?auto_117476 )
      ( MAKE-4PILE ?auto_117474 ?auto_117475 ?auto_117476 ?auto_117477 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117481 - BLOCK
      ?auto_117482 - BLOCK
      ?auto_117483 - BLOCK
      ?auto_117484 - BLOCK
    )
    :vars
    (
      ?auto_117485 - BLOCK
      ?auto_117486 - BLOCK
      ?auto_117487 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117481 ?auto_117482 ) ) ( not ( = ?auto_117481 ?auto_117483 ) ) ( not ( = ?auto_117481 ?auto_117484 ) ) ( not ( = ?auto_117482 ?auto_117483 ) ) ( not ( = ?auto_117482 ?auto_117484 ) ) ( not ( = ?auto_117483 ?auto_117484 ) ) ( ON ?auto_117484 ?auto_117485 ) ( not ( = ?auto_117481 ?auto_117485 ) ) ( not ( = ?auto_117482 ?auto_117485 ) ) ( not ( = ?auto_117483 ?auto_117485 ) ) ( not ( = ?auto_117484 ?auto_117485 ) ) ( ON ?auto_117483 ?auto_117484 ) ( ON-TABLE ?auto_117486 ) ( ON ?auto_117487 ?auto_117486 ) ( ON ?auto_117485 ?auto_117487 ) ( not ( = ?auto_117486 ?auto_117487 ) ) ( not ( = ?auto_117486 ?auto_117485 ) ) ( not ( = ?auto_117486 ?auto_117484 ) ) ( not ( = ?auto_117486 ?auto_117483 ) ) ( not ( = ?auto_117487 ?auto_117485 ) ) ( not ( = ?auto_117487 ?auto_117484 ) ) ( not ( = ?auto_117487 ?auto_117483 ) ) ( not ( = ?auto_117481 ?auto_117486 ) ) ( not ( = ?auto_117481 ?auto_117487 ) ) ( not ( = ?auto_117482 ?auto_117486 ) ) ( not ( = ?auto_117482 ?auto_117487 ) ) ( ON ?auto_117482 ?auto_117483 ) ( CLEAR ?auto_117482 ) ( HOLDING ?auto_117481 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_117481 )
      ( MAKE-4PILE ?auto_117481 ?auto_117482 ?auto_117483 ?auto_117484 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117488 - BLOCK
      ?auto_117489 - BLOCK
      ?auto_117490 - BLOCK
      ?auto_117491 - BLOCK
    )
    :vars
    (
      ?auto_117492 - BLOCK
      ?auto_117494 - BLOCK
      ?auto_117493 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117488 ?auto_117489 ) ) ( not ( = ?auto_117488 ?auto_117490 ) ) ( not ( = ?auto_117488 ?auto_117491 ) ) ( not ( = ?auto_117489 ?auto_117490 ) ) ( not ( = ?auto_117489 ?auto_117491 ) ) ( not ( = ?auto_117490 ?auto_117491 ) ) ( ON ?auto_117491 ?auto_117492 ) ( not ( = ?auto_117488 ?auto_117492 ) ) ( not ( = ?auto_117489 ?auto_117492 ) ) ( not ( = ?auto_117490 ?auto_117492 ) ) ( not ( = ?auto_117491 ?auto_117492 ) ) ( ON ?auto_117490 ?auto_117491 ) ( ON-TABLE ?auto_117494 ) ( ON ?auto_117493 ?auto_117494 ) ( ON ?auto_117492 ?auto_117493 ) ( not ( = ?auto_117494 ?auto_117493 ) ) ( not ( = ?auto_117494 ?auto_117492 ) ) ( not ( = ?auto_117494 ?auto_117491 ) ) ( not ( = ?auto_117494 ?auto_117490 ) ) ( not ( = ?auto_117493 ?auto_117492 ) ) ( not ( = ?auto_117493 ?auto_117491 ) ) ( not ( = ?auto_117493 ?auto_117490 ) ) ( not ( = ?auto_117488 ?auto_117494 ) ) ( not ( = ?auto_117488 ?auto_117493 ) ) ( not ( = ?auto_117489 ?auto_117494 ) ) ( not ( = ?auto_117489 ?auto_117493 ) ) ( ON ?auto_117489 ?auto_117490 ) ( ON ?auto_117488 ?auto_117489 ) ( CLEAR ?auto_117488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_117494 ?auto_117493 ?auto_117492 ?auto_117491 ?auto_117490 ?auto_117489 )
      ( MAKE-4PILE ?auto_117488 ?auto_117489 ?auto_117490 ?auto_117491 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117495 - BLOCK
      ?auto_117496 - BLOCK
      ?auto_117497 - BLOCK
      ?auto_117498 - BLOCK
    )
    :vars
    (
      ?auto_117501 - BLOCK
      ?auto_117499 - BLOCK
      ?auto_117500 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117495 ?auto_117496 ) ) ( not ( = ?auto_117495 ?auto_117497 ) ) ( not ( = ?auto_117495 ?auto_117498 ) ) ( not ( = ?auto_117496 ?auto_117497 ) ) ( not ( = ?auto_117496 ?auto_117498 ) ) ( not ( = ?auto_117497 ?auto_117498 ) ) ( ON ?auto_117498 ?auto_117501 ) ( not ( = ?auto_117495 ?auto_117501 ) ) ( not ( = ?auto_117496 ?auto_117501 ) ) ( not ( = ?auto_117497 ?auto_117501 ) ) ( not ( = ?auto_117498 ?auto_117501 ) ) ( ON ?auto_117497 ?auto_117498 ) ( ON-TABLE ?auto_117499 ) ( ON ?auto_117500 ?auto_117499 ) ( ON ?auto_117501 ?auto_117500 ) ( not ( = ?auto_117499 ?auto_117500 ) ) ( not ( = ?auto_117499 ?auto_117501 ) ) ( not ( = ?auto_117499 ?auto_117498 ) ) ( not ( = ?auto_117499 ?auto_117497 ) ) ( not ( = ?auto_117500 ?auto_117501 ) ) ( not ( = ?auto_117500 ?auto_117498 ) ) ( not ( = ?auto_117500 ?auto_117497 ) ) ( not ( = ?auto_117495 ?auto_117499 ) ) ( not ( = ?auto_117495 ?auto_117500 ) ) ( not ( = ?auto_117496 ?auto_117499 ) ) ( not ( = ?auto_117496 ?auto_117500 ) ) ( ON ?auto_117496 ?auto_117497 ) ( HOLDING ?auto_117495 ) ( CLEAR ?auto_117496 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_117499 ?auto_117500 ?auto_117501 ?auto_117498 ?auto_117497 ?auto_117496 ?auto_117495 )
      ( MAKE-4PILE ?auto_117495 ?auto_117496 ?auto_117497 ?auto_117498 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117502 - BLOCK
      ?auto_117503 - BLOCK
      ?auto_117504 - BLOCK
      ?auto_117505 - BLOCK
    )
    :vars
    (
      ?auto_117506 - BLOCK
      ?auto_117507 - BLOCK
      ?auto_117508 - BLOCK
      ?auto_117509 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117502 ?auto_117503 ) ) ( not ( = ?auto_117502 ?auto_117504 ) ) ( not ( = ?auto_117502 ?auto_117505 ) ) ( not ( = ?auto_117503 ?auto_117504 ) ) ( not ( = ?auto_117503 ?auto_117505 ) ) ( not ( = ?auto_117504 ?auto_117505 ) ) ( ON ?auto_117505 ?auto_117506 ) ( not ( = ?auto_117502 ?auto_117506 ) ) ( not ( = ?auto_117503 ?auto_117506 ) ) ( not ( = ?auto_117504 ?auto_117506 ) ) ( not ( = ?auto_117505 ?auto_117506 ) ) ( ON ?auto_117504 ?auto_117505 ) ( ON-TABLE ?auto_117507 ) ( ON ?auto_117508 ?auto_117507 ) ( ON ?auto_117506 ?auto_117508 ) ( not ( = ?auto_117507 ?auto_117508 ) ) ( not ( = ?auto_117507 ?auto_117506 ) ) ( not ( = ?auto_117507 ?auto_117505 ) ) ( not ( = ?auto_117507 ?auto_117504 ) ) ( not ( = ?auto_117508 ?auto_117506 ) ) ( not ( = ?auto_117508 ?auto_117505 ) ) ( not ( = ?auto_117508 ?auto_117504 ) ) ( not ( = ?auto_117502 ?auto_117507 ) ) ( not ( = ?auto_117502 ?auto_117508 ) ) ( not ( = ?auto_117503 ?auto_117507 ) ) ( not ( = ?auto_117503 ?auto_117508 ) ) ( ON ?auto_117503 ?auto_117504 ) ( CLEAR ?auto_117503 ) ( ON ?auto_117502 ?auto_117509 ) ( CLEAR ?auto_117502 ) ( HAND-EMPTY ) ( not ( = ?auto_117502 ?auto_117509 ) ) ( not ( = ?auto_117503 ?auto_117509 ) ) ( not ( = ?auto_117504 ?auto_117509 ) ) ( not ( = ?auto_117505 ?auto_117509 ) ) ( not ( = ?auto_117506 ?auto_117509 ) ) ( not ( = ?auto_117507 ?auto_117509 ) ) ( not ( = ?auto_117508 ?auto_117509 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_117502 ?auto_117509 )
      ( MAKE-4PILE ?auto_117502 ?auto_117503 ?auto_117504 ?auto_117505 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117510 - BLOCK
      ?auto_117511 - BLOCK
      ?auto_117512 - BLOCK
      ?auto_117513 - BLOCK
    )
    :vars
    (
      ?auto_117514 - BLOCK
      ?auto_117516 - BLOCK
      ?auto_117517 - BLOCK
      ?auto_117515 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117510 ?auto_117511 ) ) ( not ( = ?auto_117510 ?auto_117512 ) ) ( not ( = ?auto_117510 ?auto_117513 ) ) ( not ( = ?auto_117511 ?auto_117512 ) ) ( not ( = ?auto_117511 ?auto_117513 ) ) ( not ( = ?auto_117512 ?auto_117513 ) ) ( ON ?auto_117513 ?auto_117514 ) ( not ( = ?auto_117510 ?auto_117514 ) ) ( not ( = ?auto_117511 ?auto_117514 ) ) ( not ( = ?auto_117512 ?auto_117514 ) ) ( not ( = ?auto_117513 ?auto_117514 ) ) ( ON ?auto_117512 ?auto_117513 ) ( ON-TABLE ?auto_117516 ) ( ON ?auto_117517 ?auto_117516 ) ( ON ?auto_117514 ?auto_117517 ) ( not ( = ?auto_117516 ?auto_117517 ) ) ( not ( = ?auto_117516 ?auto_117514 ) ) ( not ( = ?auto_117516 ?auto_117513 ) ) ( not ( = ?auto_117516 ?auto_117512 ) ) ( not ( = ?auto_117517 ?auto_117514 ) ) ( not ( = ?auto_117517 ?auto_117513 ) ) ( not ( = ?auto_117517 ?auto_117512 ) ) ( not ( = ?auto_117510 ?auto_117516 ) ) ( not ( = ?auto_117510 ?auto_117517 ) ) ( not ( = ?auto_117511 ?auto_117516 ) ) ( not ( = ?auto_117511 ?auto_117517 ) ) ( ON ?auto_117510 ?auto_117515 ) ( CLEAR ?auto_117510 ) ( not ( = ?auto_117510 ?auto_117515 ) ) ( not ( = ?auto_117511 ?auto_117515 ) ) ( not ( = ?auto_117512 ?auto_117515 ) ) ( not ( = ?auto_117513 ?auto_117515 ) ) ( not ( = ?auto_117514 ?auto_117515 ) ) ( not ( = ?auto_117516 ?auto_117515 ) ) ( not ( = ?auto_117517 ?auto_117515 ) ) ( HOLDING ?auto_117511 ) ( CLEAR ?auto_117512 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_117516 ?auto_117517 ?auto_117514 ?auto_117513 ?auto_117512 ?auto_117511 )
      ( MAKE-4PILE ?auto_117510 ?auto_117511 ?auto_117512 ?auto_117513 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117518 - BLOCK
      ?auto_117519 - BLOCK
      ?auto_117520 - BLOCK
      ?auto_117521 - BLOCK
    )
    :vars
    (
      ?auto_117524 - BLOCK
      ?auto_117522 - BLOCK
      ?auto_117523 - BLOCK
      ?auto_117525 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117518 ?auto_117519 ) ) ( not ( = ?auto_117518 ?auto_117520 ) ) ( not ( = ?auto_117518 ?auto_117521 ) ) ( not ( = ?auto_117519 ?auto_117520 ) ) ( not ( = ?auto_117519 ?auto_117521 ) ) ( not ( = ?auto_117520 ?auto_117521 ) ) ( ON ?auto_117521 ?auto_117524 ) ( not ( = ?auto_117518 ?auto_117524 ) ) ( not ( = ?auto_117519 ?auto_117524 ) ) ( not ( = ?auto_117520 ?auto_117524 ) ) ( not ( = ?auto_117521 ?auto_117524 ) ) ( ON ?auto_117520 ?auto_117521 ) ( ON-TABLE ?auto_117522 ) ( ON ?auto_117523 ?auto_117522 ) ( ON ?auto_117524 ?auto_117523 ) ( not ( = ?auto_117522 ?auto_117523 ) ) ( not ( = ?auto_117522 ?auto_117524 ) ) ( not ( = ?auto_117522 ?auto_117521 ) ) ( not ( = ?auto_117522 ?auto_117520 ) ) ( not ( = ?auto_117523 ?auto_117524 ) ) ( not ( = ?auto_117523 ?auto_117521 ) ) ( not ( = ?auto_117523 ?auto_117520 ) ) ( not ( = ?auto_117518 ?auto_117522 ) ) ( not ( = ?auto_117518 ?auto_117523 ) ) ( not ( = ?auto_117519 ?auto_117522 ) ) ( not ( = ?auto_117519 ?auto_117523 ) ) ( ON ?auto_117518 ?auto_117525 ) ( not ( = ?auto_117518 ?auto_117525 ) ) ( not ( = ?auto_117519 ?auto_117525 ) ) ( not ( = ?auto_117520 ?auto_117525 ) ) ( not ( = ?auto_117521 ?auto_117525 ) ) ( not ( = ?auto_117524 ?auto_117525 ) ) ( not ( = ?auto_117522 ?auto_117525 ) ) ( not ( = ?auto_117523 ?auto_117525 ) ) ( CLEAR ?auto_117520 ) ( ON ?auto_117519 ?auto_117518 ) ( CLEAR ?auto_117519 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_117525 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_117525 ?auto_117518 )
      ( MAKE-4PILE ?auto_117518 ?auto_117519 ?auto_117520 ?auto_117521 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117526 - BLOCK
      ?auto_117527 - BLOCK
      ?auto_117528 - BLOCK
      ?auto_117529 - BLOCK
    )
    :vars
    (
      ?auto_117533 - BLOCK
      ?auto_117531 - BLOCK
      ?auto_117530 - BLOCK
      ?auto_117532 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117526 ?auto_117527 ) ) ( not ( = ?auto_117526 ?auto_117528 ) ) ( not ( = ?auto_117526 ?auto_117529 ) ) ( not ( = ?auto_117527 ?auto_117528 ) ) ( not ( = ?auto_117527 ?auto_117529 ) ) ( not ( = ?auto_117528 ?auto_117529 ) ) ( ON ?auto_117529 ?auto_117533 ) ( not ( = ?auto_117526 ?auto_117533 ) ) ( not ( = ?auto_117527 ?auto_117533 ) ) ( not ( = ?auto_117528 ?auto_117533 ) ) ( not ( = ?auto_117529 ?auto_117533 ) ) ( ON-TABLE ?auto_117531 ) ( ON ?auto_117530 ?auto_117531 ) ( ON ?auto_117533 ?auto_117530 ) ( not ( = ?auto_117531 ?auto_117530 ) ) ( not ( = ?auto_117531 ?auto_117533 ) ) ( not ( = ?auto_117531 ?auto_117529 ) ) ( not ( = ?auto_117531 ?auto_117528 ) ) ( not ( = ?auto_117530 ?auto_117533 ) ) ( not ( = ?auto_117530 ?auto_117529 ) ) ( not ( = ?auto_117530 ?auto_117528 ) ) ( not ( = ?auto_117526 ?auto_117531 ) ) ( not ( = ?auto_117526 ?auto_117530 ) ) ( not ( = ?auto_117527 ?auto_117531 ) ) ( not ( = ?auto_117527 ?auto_117530 ) ) ( ON ?auto_117526 ?auto_117532 ) ( not ( = ?auto_117526 ?auto_117532 ) ) ( not ( = ?auto_117527 ?auto_117532 ) ) ( not ( = ?auto_117528 ?auto_117532 ) ) ( not ( = ?auto_117529 ?auto_117532 ) ) ( not ( = ?auto_117533 ?auto_117532 ) ) ( not ( = ?auto_117531 ?auto_117532 ) ) ( not ( = ?auto_117530 ?auto_117532 ) ) ( ON ?auto_117527 ?auto_117526 ) ( CLEAR ?auto_117527 ) ( ON-TABLE ?auto_117532 ) ( HOLDING ?auto_117528 ) ( CLEAR ?auto_117529 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_117531 ?auto_117530 ?auto_117533 ?auto_117529 ?auto_117528 )
      ( MAKE-4PILE ?auto_117526 ?auto_117527 ?auto_117528 ?auto_117529 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117534 - BLOCK
      ?auto_117535 - BLOCK
      ?auto_117536 - BLOCK
      ?auto_117537 - BLOCK
    )
    :vars
    (
      ?auto_117539 - BLOCK
      ?auto_117541 - BLOCK
      ?auto_117538 - BLOCK
      ?auto_117540 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117534 ?auto_117535 ) ) ( not ( = ?auto_117534 ?auto_117536 ) ) ( not ( = ?auto_117534 ?auto_117537 ) ) ( not ( = ?auto_117535 ?auto_117536 ) ) ( not ( = ?auto_117535 ?auto_117537 ) ) ( not ( = ?auto_117536 ?auto_117537 ) ) ( ON ?auto_117537 ?auto_117539 ) ( not ( = ?auto_117534 ?auto_117539 ) ) ( not ( = ?auto_117535 ?auto_117539 ) ) ( not ( = ?auto_117536 ?auto_117539 ) ) ( not ( = ?auto_117537 ?auto_117539 ) ) ( ON-TABLE ?auto_117541 ) ( ON ?auto_117538 ?auto_117541 ) ( ON ?auto_117539 ?auto_117538 ) ( not ( = ?auto_117541 ?auto_117538 ) ) ( not ( = ?auto_117541 ?auto_117539 ) ) ( not ( = ?auto_117541 ?auto_117537 ) ) ( not ( = ?auto_117541 ?auto_117536 ) ) ( not ( = ?auto_117538 ?auto_117539 ) ) ( not ( = ?auto_117538 ?auto_117537 ) ) ( not ( = ?auto_117538 ?auto_117536 ) ) ( not ( = ?auto_117534 ?auto_117541 ) ) ( not ( = ?auto_117534 ?auto_117538 ) ) ( not ( = ?auto_117535 ?auto_117541 ) ) ( not ( = ?auto_117535 ?auto_117538 ) ) ( ON ?auto_117534 ?auto_117540 ) ( not ( = ?auto_117534 ?auto_117540 ) ) ( not ( = ?auto_117535 ?auto_117540 ) ) ( not ( = ?auto_117536 ?auto_117540 ) ) ( not ( = ?auto_117537 ?auto_117540 ) ) ( not ( = ?auto_117539 ?auto_117540 ) ) ( not ( = ?auto_117541 ?auto_117540 ) ) ( not ( = ?auto_117538 ?auto_117540 ) ) ( ON ?auto_117535 ?auto_117534 ) ( ON-TABLE ?auto_117540 ) ( CLEAR ?auto_117537 ) ( ON ?auto_117536 ?auto_117535 ) ( CLEAR ?auto_117536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_117540 ?auto_117534 ?auto_117535 )
      ( MAKE-4PILE ?auto_117534 ?auto_117535 ?auto_117536 ?auto_117537 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117542 - BLOCK
      ?auto_117543 - BLOCK
      ?auto_117544 - BLOCK
      ?auto_117545 - BLOCK
    )
    :vars
    (
      ?auto_117548 - BLOCK
      ?auto_117546 - BLOCK
      ?auto_117547 - BLOCK
      ?auto_117549 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117542 ?auto_117543 ) ) ( not ( = ?auto_117542 ?auto_117544 ) ) ( not ( = ?auto_117542 ?auto_117545 ) ) ( not ( = ?auto_117543 ?auto_117544 ) ) ( not ( = ?auto_117543 ?auto_117545 ) ) ( not ( = ?auto_117544 ?auto_117545 ) ) ( not ( = ?auto_117542 ?auto_117548 ) ) ( not ( = ?auto_117543 ?auto_117548 ) ) ( not ( = ?auto_117544 ?auto_117548 ) ) ( not ( = ?auto_117545 ?auto_117548 ) ) ( ON-TABLE ?auto_117546 ) ( ON ?auto_117547 ?auto_117546 ) ( ON ?auto_117548 ?auto_117547 ) ( not ( = ?auto_117546 ?auto_117547 ) ) ( not ( = ?auto_117546 ?auto_117548 ) ) ( not ( = ?auto_117546 ?auto_117545 ) ) ( not ( = ?auto_117546 ?auto_117544 ) ) ( not ( = ?auto_117547 ?auto_117548 ) ) ( not ( = ?auto_117547 ?auto_117545 ) ) ( not ( = ?auto_117547 ?auto_117544 ) ) ( not ( = ?auto_117542 ?auto_117546 ) ) ( not ( = ?auto_117542 ?auto_117547 ) ) ( not ( = ?auto_117543 ?auto_117546 ) ) ( not ( = ?auto_117543 ?auto_117547 ) ) ( ON ?auto_117542 ?auto_117549 ) ( not ( = ?auto_117542 ?auto_117549 ) ) ( not ( = ?auto_117543 ?auto_117549 ) ) ( not ( = ?auto_117544 ?auto_117549 ) ) ( not ( = ?auto_117545 ?auto_117549 ) ) ( not ( = ?auto_117548 ?auto_117549 ) ) ( not ( = ?auto_117546 ?auto_117549 ) ) ( not ( = ?auto_117547 ?auto_117549 ) ) ( ON ?auto_117543 ?auto_117542 ) ( ON-TABLE ?auto_117549 ) ( ON ?auto_117544 ?auto_117543 ) ( CLEAR ?auto_117544 ) ( HOLDING ?auto_117545 ) ( CLEAR ?auto_117548 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_117546 ?auto_117547 ?auto_117548 ?auto_117545 )
      ( MAKE-4PILE ?auto_117542 ?auto_117543 ?auto_117544 ?auto_117545 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117550 - BLOCK
      ?auto_117551 - BLOCK
      ?auto_117552 - BLOCK
      ?auto_117553 - BLOCK
    )
    :vars
    (
      ?auto_117554 - BLOCK
      ?auto_117557 - BLOCK
      ?auto_117556 - BLOCK
      ?auto_117555 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117550 ?auto_117551 ) ) ( not ( = ?auto_117550 ?auto_117552 ) ) ( not ( = ?auto_117550 ?auto_117553 ) ) ( not ( = ?auto_117551 ?auto_117552 ) ) ( not ( = ?auto_117551 ?auto_117553 ) ) ( not ( = ?auto_117552 ?auto_117553 ) ) ( not ( = ?auto_117550 ?auto_117554 ) ) ( not ( = ?auto_117551 ?auto_117554 ) ) ( not ( = ?auto_117552 ?auto_117554 ) ) ( not ( = ?auto_117553 ?auto_117554 ) ) ( ON-TABLE ?auto_117557 ) ( ON ?auto_117556 ?auto_117557 ) ( ON ?auto_117554 ?auto_117556 ) ( not ( = ?auto_117557 ?auto_117556 ) ) ( not ( = ?auto_117557 ?auto_117554 ) ) ( not ( = ?auto_117557 ?auto_117553 ) ) ( not ( = ?auto_117557 ?auto_117552 ) ) ( not ( = ?auto_117556 ?auto_117554 ) ) ( not ( = ?auto_117556 ?auto_117553 ) ) ( not ( = ?auto_117556 ?auto_117552 ) ) ( not ( = ?auto_117550 ?auto_117557 ) ) ( not ( = ?auto_117550 ?auto_117556 ) ) ( not ( = ?auto_117551 ?auto_117557 ) ) ( not ( = ?auto_117551 ?auto_117556 ) ) ( ON ?auto_117550 ?auto_117555 ) ( not ( = ?auto_117550 ?auto_117555 ) ) ( not ( = ?auto_117551 ?auto_117555 ) ) ( not ( = ?auto_117552 ?auto_117555 ) ) ( not ( = ?auto_117553 ?auto_117555 ) ) ( not ( = ?auto_117554 ?auto_117555 ) ) ( not ( = ?auto_117557 ?auto_117555 ) ) ( not ( = ?auto_117556 ?auto_117555 ) ) ( ON ?auto_117551 ?auto_117550 ) ( ON-TABLE ?auto_117555 ) ( ON ?auto_117552 ?auto_117551 ) ( CLEAR ?auto_117554 ) ( ON ?auto_117553 ?auto_117552 ) ( CLEAR ?auto_117553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_117555 ?auto_117550 ?auto_117551 ?auto_117552 )
      ( MAKE-4PILE ?auto_117550 ?auto_117551 ?auto_117552 ?auto_117553 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117558 - BLOCK
      ?auto_117559 - BLOCK
      ?auto_117560 - BLOCK
      ?auto_117561 - BLOCK
    )
    :vars
    (
      ?auto_117563 - BLOCK
      ?auto_117564 - BLOCK
      ?auto_117565 - BLOCK
      ?auto_117562 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117558 ?auto_117559 ) ) ( not ( = ?auto_117558 ?auto_117560 ) ) ( not ( = ?auto_117558 ?auto_117561 ) ) ( not ( = ?auto_117559 ?auto_117560 ) ) ( not ( = ?auto_117559 ?auto_117561 ) ) ( not ( = ?auto_117560 ?auto_117561 ) ) ( not ( = ?auto_117558 ?auto_117563 ) ) ( not ( = ?auto_117559 ?auto_117563 ) ) ( not ( = ?auto_117560 ?auto_117563 ) ) ( not ( = ?auto_117561 ?auto_117563 ) ) ( ON-TABLE ?auto_117564 ) ( ON ?auto_117565 ?auto_117564 ) ( not ( = ?auto_117564 ?auto_117565 ) ) ( not ( = ?auto_117564 ?auto_117563 ) ) ( not ( = ?auto_117564 ?auto_117561 ) ) ( not ( = ?auto_117564 ?auto_117560 ) ) ( not ( = ?auto_117565 ?auto_117563 ) ) ( not ( = ?auto_117565 ?auto_117561 ) ) ( not ( = ?auto_117565 ?auto_117560 ) ) ( not ( = ?auto_117558 ?auto_117564 ) ) ( not ( = ?auto_117558 ?auto_117565 ) ) ( not ( = ?auto_117559 ?auto_117564 ) ) ( not ( = ?auto_117559 ?auto_117565 ) ) ( ON ?auto_117558 ?auto_117562 ) ( not ( = ?auto_117558 ?auto_117562 ) ) ( not ( = ?auto_117559 ?auto_117562 ) ) ( not ( = ?auto_117560 ?auto_117562 ) ) ( not ( = ?auto_117561 ?auto_117562 ) ) ( not ( = ?auto_117563 ?auto_117562 ) ) ( not ( = ?auto_117564 ?auto_117562 ) ) ( not ( = ?auto_117565 ?auto_117562 ) ) ( ON ?auto_117559 ?auto_117558 ) ( ON-TABLE ?auto_117562 ) ( ON ?auto_117560 ?auto_117559 ) ( ON ?auto_117561 ?auto_117560 ) ( CLEAR ?auto_117561 ) ( HOLDING ?auto_117563 ) ( CLEAR ?auto_117565 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_117564 ?auto_117565 ?auto_117563 )
      ( MAKE-4PILE ?auto_117558 ?auto_117559 ?auto_117560 ?auto_117561 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117566 - BLOCK
      ?auto_117567 - BLOCK
      ?auto_117568 - BLOCK
      ?auto_117569 - BLOCK
    )
    :vars
    (
      ?auto_117570 - BLOCK
      ?auto_117573 - BLOCK
      ?auto_117572 - BLOCK
      ?auto_117571 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117566 ?auto_117567 ) ) ( not ( = ?auto_117566 ?auto_117568 ) ) ( not ( = ?auto_117566 ?auto_117569 ) ) ( not ( = ?auto_117567 ?auto_117568 ) ) ( not ( = ?auto_117567 ?auto_117569 ) ) ( not ( = ?auto_117568 ?auto_117569 ) ) ( not ( = ?auto_117566 ?auto_117570 ) ) ( not ( = ?auto_117567 ?auto_117570 ) ) ( not ( = ?auto_117568 ?auto_117570 ) ) ( not ( = ?auto_117569 ?auto_117570 ) ) ( ON-TABLE ?auto_117573 ) ( ON ?auto_117572 ?auto_117573 ) ( not ( = ?auto_117573 ?auto_117572 ) ) ( not ( = ?auto_117573 ?auto_117570 ) ) ( not ( = ?auto_117573 ?auto_117569 ) ) ( not ( = ?auto_117573 ?auto_117568 ) ) ( not ( = ?auto_117572 ?auto_117570 ) ) ( not ( = ?auto_117572 ?auto_117569 ) ) ( not ( = ?auto_117572 ?auto_117568 ) ) ( not ( = ?auto_117566 ?auto_117573 ) ) ( not ( = ?auto_117566 ?auto_117572 ) ) ( not ( = ?auto_117567 ?auto_117573 ) ) ( not ( = ?auto_117567 ?auto_117572 ) ) ( ON ?auto_117566 ?auto_117571 ) ( not ( = ?auto_117566 ?auto_117571 ) ) ( not ( = ?auto_117567 ?auto_117571 ) ) ( not ( = ?auto_117568 ?auto_117571 ) ) ( not ( = ?auto_117569 ?auto_117571 ) ) ( not ( = ?auto_117570 ?auto_117571 ) ) ( not ( = ?auto_117573 ?auto_117571 ) ) ( not ( = ?auto_117572 ?auto_117571 ) ) ( ON ?auto_117567 ?auto_117566 ) ( ON-TABLE ?auto_117571 ) ( ON ?auto_117568 ?auto_117567 ) ( ON ?auto_117569 ?auto_117568 ) ( CLEAR ?auto_117572 ) ( ON ?auto_117570 ?auto_117569 ) ( CLEAR ?auto_117570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_117571 ?auto_117566 ?auto_117567 ?auto_117568 ?auto_117569 )
      ( MAKE-4PILE ?auto_117566 ?auto_117567 ?auto_117568 ?auto_117569 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117574 - BLOCK
      ?auto_117575 - BLOCK
      ?auto_117576 - BLOCK
      ?auto_117577 - BLOCK
    )
    :vars
    (
      ?auto_117581 - BLOCK
      ?auto_117578 - BLOCK
      ?auto_117579 - BLOCK
      ?auto_117580 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117574 ?auto_117575 ) ) ( not ( = ?auto_117574 ?auto_117576 ) ) ( not ( = ?auto_117574 ?auto_117577 ) ) ( not ( = ?auto_117575 ?auto_117576 ) ) ( not ( = ?auto_117575 ?auto_117577 ) ) ( not ( = ?auto_117576 ?auto_117577 ) ) ( not ( = ?auto_117574 ?auto_117581 ) ) ( not ( = ?auto_117575 ?auto_117581 ) ) ( not ( = ?auto_117576 ?auto_117581 ) ) ( not ( = ?auto_117577 ?auto_117581 ) ) ( ON-TABLE ?auto_117578 ) ( not ( = ?auto_117578 ?auto_117579 ) ) ( not ( = ?auto_117578 ?auto_117581 ) ) ( not ( = ?auto_117578 ?auto_117577 ) ) ( not ( = ?auto_117578 ?auto_117576 ) ) ( not ( = ?auto_117579 ?auto_117581 ) ) ( not ( = ?auto_117579 ?auto_117577 ) ) ( not ( = ?auto_117579 ?auto_117576 ) ) ( not ( = ?auto_117574 ?auto_117578 ) ) ( not ( = ?auto_117574 ?auto_117579 ) ) ( not ( = ?auto_117575 ?auto_117578 ) ) ( not ( = ?auto_117575 ?auto_117579 ) ) ( ON ?auto_117574 ?auto_117580 ) ( not ( = ?auto_117574 ?auto_117580 ) ) ( not ( = ?auto_117575 ?auto_117580 ) ) ( not ( = ?auto_117576 ?auto_117580 ) ) ( not ( = ?auto_117577 ?auto_117580 ) ) ( not ( = ?auto_117581 ?auto_117580 ) ) ( not ( = ?auto_117578 ?auto_117580 ) ) ( not ( = ?auto_117579 ?auto_117580 ) ) ( ON ?auto_117575 ?auto_117574 ) ( ON-TABLE ?auto_117580 ) ( ON ?auto_117576 ?auto_117575 ) ( ON ?auto_117577 ?auto_117576 ) ( ON ?auto_117581 ?auto_117577 ) ( CLEAR ?auto_117581 ) ( HOLDING ?auto_117579 ) ( CLEAR ?auto_117578 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_117578 ?auto_117579 )
      ( MAKE-4PILE ?auto_117574 ?auto_117575 ?auto_117576 ?auto_117577 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117582 - BLOCK
      ?auto_117583 - BLOCK
      ?auto_117584 - BLOCK
      ?auto_117585 - BLOCK
    )
    :vars
    (
      ?auto_117589 - BLOCK
      ?auto_117586 - BLOCK
      ?auto_117587 - BLOCK
      ?auto_117588 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117582 ?auto_117583 ) ) ( not ( = ?auto_117582 ?auto_117584 ) ) ( not ( = ?auto_117582 ?auto_117585 ) ) ( not ( = ?auto_117583 ?auto_117584 ) ) ( not ( = ?auto_117583 ?auto_117585 ) ) ( not ( = ?auto_117584 ?auto_117585 ) ) ( not ( = ?auto_117582 ?auto_117589 ) ) ( not ( = ?auto_117583 ?auto_117589 ) ) ( not ( = ?auto_117584 ?auto_117589 ) ) ( not ( = ?auto_117585 ?auto_117589 ) ) ( ON-TABLE ?auto_117586 ) ( not ( = ?auto_117586 ?auto_117587 ) ) ( not ( = ?auto_117586 ?auto_117589 ) ) ( not ( = ?auto_117586 ?auto_117585 ) ) ( not ( = ?auto_117586 ?auto_117584 ) ) ( not ( = ?auto_117587 ?auto_117589 ) ) ( not ( = ?auto_117587 ?auto_117585 ) ) ( not ( = ?auto_117587 ?auto_117584 ) ) ( not ( = ?auto_117582 ?auto_117586 ) ) ( not ( = ?auto_117582 ?auto_117587 ) ) ( not ( = ?auto_117583 ?auto_117586 ) ) ( not ( = ?auto_117583 ?auto_117587 ) ) ( ON ?auto_117582 ?auto_117588 ) ( not ( = ?auto_117582 ?auto_117588 ) ) ( not ( = ?auto_117583 ?auto_117588 ) ) ( not ( = ?auto_117584 ?auto_117588 ) ) ( not ( = ?auto_117585 ?auto_117588 ) ) ( not ( = ?auto_117589 ?auto_117588 ) ) ( not ( = ?auto_117586 ?auto_117588 ) ) ( not ( = ?auto_117587 ?auto_117588 ) ) ( ON ?auto_117583 ?auto_117582 ) ( ON-TABLE ?auto_117588 ) ( ON ?auto_117584 ?auto_117583 ) ( ON ?auto_117585 ?auto_117584 ) ( ON ?auto_117589 ?auto_117585 ) ( CLEAR ?auto_117586 ) ( ON ?auto_117587 ?auto_117589 ) ( CLEAR ?auto_117587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_117588 ?auto_117582 ?auto_117583 ?auto_117584 ?auto_117585 ?auto_117589 )
      ( MAKE-4PILE ?auto_117582 ?auto_117583 ?auto_117584 ?auto_117585 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117590 - BLOCK
      ?auto_117591 - BLOCK
      ?auto_117592 - BLOCK
      ?auto_117593 - BLOCK
    )
    :vars
    (
      ?auto_117595 - BLOCK
      ?auto_117594 - BLOCK
      ?auto_117596 - BLOCK
      ?auto_117597 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117590 ?auto_117591 ) ) ( not ( = ?auto_117590 ?auto_117592 ) ) ( not ( = ?auto_117590 ?auto_117593 ) ) ( not ( = ?auto_117591 ?auto_117592 ) ) ( not ( = ?auto_117591 ?auto_117593 ) ) ( not ( = ?auto_117592 ?auto_117593 ) ) ( not ( = ?auto_117590 ?auto_117595 ) ) ( not ( = ?auto_117591 ?auto_117595 ) ) ( not ( = ?auto_117592 ?auto_117595 ) ) ( not ( = ?auto_117593 ?auto_117595 ) ) ( not ( = ?auto_117594 ?auto_117596 ) ) ( not ( = ?auto_117594 ?auto_117595 ) ) ( not ( = ?auto_117594 ?auto_117593 ) ) ( not ( = ?auto_117594 ?auto_117592 ) ) ( not ( = ?auto_117596 ?auto_117595 ) ) ( not ( = ?auto_117596 ?auto_117593 ) ) ( not ( = ?auto_117596 ?auto_117592 ) ) ( not ( = ?auto_117590 ?auto_117594 ) ) ( not ( = ?auto_117590 ?auto_117596 ) ) ( not ( = ?auto_117591 ?auto_117594 ) ) ( not ( = ?auto_117591 ?auto_117596 ) ) ( ON ?auto_117590 ?auto_117597 ) ( not ( = ?auto_117590 ?auto_117597 ) ) ( not ( = ?auto_117591 ?auto_117597 ) ) ( not ( = ?auto_117592 ?auto_117597 ) ) ( not ( = ?auto_117593 ?auto_117597 ) ) ( not ( = ?auto_117595 ?auto_117597 ) ) ( not ( = ?auto_117594 ?auto_117597 ) ) ( not ( = ?auto_117596 ?auto_117597 ) ) ( ON ?auto_117591 ?auto_117590 ) ( ON-TABLE ?auto_117597 ) ( ON ?auto_117592 ?auto_117591 ) ( ON ?auto_117593 ?auto_117592 ) ( ON ?auto_117595 ?auto_117593 ) ( ON ?auto_117596 ?auto_117595 ) ( CLEAR ?auto_117596 ) ( HOLDING ?auto_117594 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_117594 )
      ( MAKE-4PILE ?auto_117590 ?auto_117591 ?auto_117592 ?auto_117593 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117598 - BLOCK
      ?auto_117599 - BLOCK
      ?auto_117600 - BLOCK
      ?auto_117601 - BLOCK
    )
    :vars
    (
      ?auto_117603 - BLOCK
      ?auto_117604 - BLOCK
      ?auto_117605 - BLOCK
      ?auto_117602 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117598 ?auto_117599 ) ) ( not ( = ?auto_117598 ?auto_117600 ) ) ( not ( = ?auto_117598 ?auto_117601 ) ) ( not ( = ?auto_117599 ?auto_117600 ) ) ( not ( = ?auto_117599 ?auto_117601 ) ) ( not ( = ?auto_117600 ?auto_117601 ) ) ( not ( = ?auto_117598 ?auto_117603 ) ) ( not ( = ?auto_117599 ?auto_117603 ) ) ( not ( = ?auto_117600 ?auto_117603 ) ) ( not ( = ?auto_117601 ?auto_117603 ) ) ( not ( = ?auto_117604 ?auto_117605 ) ) ( not ( = ?auto_117604 ?auto_117603 ) ) ( not ( = ?auto_117604 ?auto_117601 ) ) ( not ( = ?auto_117604 ?auto_117600 ) ) ( not ( = ?auto_117605 ?auto_117603 ) ) ( not ( = ?auto_117605 ?auto_117601 ) ) ( not ( = ?auto_117605 ?auto_117600 ) ) ( not ( = ?auto_117598 ?auto_117604 ) ) ( not ( = ?auto_117598 ?auto_117605 ) ) ( not ( = ?auto_117599 ?auto_117604 ) ) ( not ( = ?auto_117599 ?auto_117605 ) ) ( ON ?auto_117598 ?auto_117602 ) ( not ( = ?auto_117598 ?auto_117602 ) ) ( not ( = ?auto_117599 ?auto_117602 ) ) ( not ( = ?auto_117600 ?auto_117602 ) ) ( not ( = ?auto_117601 ?auto_117602 ) ) ( not ( = ?auto_117603 ?auto_117602 ) ) ( not ( = ?auto_117604 ?auto_117602 ) ) ( not ( = ?auto_117605 ?auto_117602 ) ) ( ON ?auto_117599 ?auto_117598 ) ( ON-TABLE ?auto_117602 ) ( ON ?auto_117600 ?auto_117599 ) ( ON ?auto_117601 ?auto_117600 ) ( ON ?auto_117603 ?auto_117601 ) ( ON ?auto_117605 ?auto_117603 ) ( ON ?auto_117604 ?auto_117605 ) ( CLEAR ?auto_117604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_117602 ?auto_117598 ?auto_117599 ?auto_117600 ?auto_117601 ?auto_117603 ?auto_117605 )
      ( MAKE-4PILE ?auto_117598 ?auto_117599 ?auto_117600 ?auto_117601 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_117608 - BLOCK
      ?auto_117609 - BLOCK
    )
    :vars
    (
      ?auto_117610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117610 ?auto_117609 ) ( CLEAR ?auto_117610 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_117608 ) ( ON ?auto_117609 ?auto_117608 ) ( not ( = ?auto_117608 ?auto_117609 ) ) ( not ( = ?auto_117608 ?auto_117610 ) ) ( not ( = ?auto_117609 ?auto_117610 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_117610 ?auto_117609 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_117611 - BLOCK
      ?auto_117612 - BLOCK
    )
    :vars
    (
      ?auto_117613 - BLOCK
      ?auto_117614 - BLOCK
      ?auto_117615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117613 ?auto_117612 ) ( CLEAR ?auto_117613 ) ( ON-TABLE ?auto_117611 ) ( ON ?auto_117612 ?auto_117611 ) ( not ( = ?auto_117611 ?auto_117612 ) ) ( not ( = ?auto_117611 ?auto_117613 ) ) ( not ( = ?auto_117612 ?auto_117613 ) ) ( HOLDING ?auto_117614 ) ( CLEAR ?auto_117615 ) ( not ( = ?auto_117611 ?auto_117614 ) ) ( not ( = ?auto_117611 ?auto_117615 ) ) ( not ( = ?auto_117612 ?auto_117614 ) ) ( not ( = ?auto_117612 ?auto_117615 ) ) ( not ( = ?auto_117613 ?auto_117614 ) ) ( not ( = ?auto_117613 ?auto_117615 ) ) ( not ( = ?auto_117614 ?auto_117615 ) ) )
    :subtasks
    ( ( !STACK ?auto_117614 ?auto_117615 )
      ( MAKE-2PILE ?auto_117611 ?auto_117612 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_117616 - BLOCK
      ?auto_117617 - BLOCK
    )
    :vars
    (
      ?auto_117618 - BLOCK
      ?auto_117620 - BLOCK
      ?auto_117619 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117618 ?auto_117617 ) ( ON-TABLE ?auto_117616 ) ( ON ?auto_117617 ?auto_117616 ) ( not ( = ?auto_117616 ?auto_117617 ) ) ( not ( = ?auto_117616 ?auto_117618 ) ) ( not ( = ?auto_117617 ?auto_117618 ) ) ( CLEAR ?auto_117620 ) ( not ( = ?auto_117616 ?auto_117619 ) ) ( not ( = ?auto_117616 ?auto_117620 ) ) ( not ( = ?auto_117617 ?auto_117619 ) ) ( not ( = ?auto_117617 ?auto_117620 ) ) ( not ( = ?auto_117618 ?auto_117619 ) ) ( not ( = ?auto_117618 ?auto_117620 ) ) ( not ( = ?auto_117619 ?auto_117620 ) ) ( ON ?auto_117619 ?auto_117618 ) ( CLEAR ?auto_117619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_117616 ?auto_117617 ?auto_117618 )
      ( MAKE-2PILE ?auto_117616 ?auto_117617 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_117621 - BLOCK
      ?auto_117622 - BLOCK
    )
    :vars
    (
      ?auto_117623 - BLOCK
      ?auto_117624 - BLOCK
      ?auto_117625 - BLOCK
      ?auto_117626 - BLOCK
      ?auto_117627 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117623 ?auto_117622 ) ( ON-TABLE ?auto_117621 ) ( ON ?auto_117622 ?auto_117621 ) ( not ( = ?auto_117621 ?auto_117622 ) ) ( not ( = ?auto_117621 ?auto_117623 ) ) ( not ( = ?auto_117622 ?auto_117623 ) ) ( not ( = ?auto_117621 ?auto_117624 ) ) ( not ( = ?auto_117621 ?auto_117625 ) ) ( not ( = ?auto_117622 ?auto_117624 ) ) ( not ( = ?auto_117622 ?auto_117625 ) ) ( not ( = ?auto_117623 ?auto_117624 ) ) ( not ( = ?auto_117623 ?auto_117625 ) ) ( not ( = ?auto_117624 ?auto_117625 ) ) ( ON ?auto_117624 ?auto_117623 ) ( CLEAR ?auto_117624 ) ( HOLDING ?auto_117625 ) ( CLEAR ?auto_117626 ) ( ON-TABLE ?auto_117627 ) ( ON ?auto_117626 ?auto_117627 ) ( not ( = ?auto_117627 ?auto_117626 ) ) ( not ( = ?auto_117627 ?auto_117625 ) ) ( not ( = ?auto_117626 ?auto_117625 ) ) ( not ( = ?auto_117621 ?auto_117626 ) ) ( not ( = ?auto_117621 ?auto_117627 ) ) ( not ( = ?auto_117622 ?auto_117626 ) ) ( not ( = ?auto_117622 ?auto_117627 ) ) ( not ( = ?auto_117623 ?auto_117626 ) ) ( not ( = ?auto_117623 ?auto_117627 ) ) ( not ( = ?auto_117624 ?auto_117626 ) ) ( not ( = ?auto_117624 ?auto_117627 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_117627 ?auto_117626 ?auto_117625 )
      ( MAKE-2PILE ?auto_117621 ?auto_117622 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_117628 - BLOCK
      ?auto_117629 - BLOCK
    )
    :vars
    (
      ?auto_117633 - BLOCK
      ?auto_117634 - BLOCK
      ?auto_117631 - BLOCK
      ?auto_117632 - BLOCK
      ?auto_117630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117633 ?auto_117629 ) ( ON-TABLE ?auto_117628 ) ( ON ?auto_117629 ?auto_117628 ) ( not ( = ?auto_117628 ?auto_117629 ) ) ( not ( = ?auto_117628 ?auto_117633 ) ) ( not ( = ?auto_117629 ?auto_117633 ) ) ( not ( = ?auto_117628 ?auto_117634 ) ) ( not ( = ?auto_117628 ?auto_117631 ) ) ( not ( = ?auto_117629 ?auto_117634 ) ) ( not ( = ?auto_117629 ?auto_117631 ) ) ( not ( = ?auto_117633 ?auto_117634 ) ) ( not ( = ?auto_117633 ?auto_117631 ) ) ( not ( = ?auto_117634 ?auto_117631 ) ) ( ON ?auto_117634 ?auto_117633 ) ( CLEAR ?auto_117632 ) ( ON-TABLE ?auto_117630 ) ( ON ?auto_117632 ?auto_117630 ) ( not ( = ?auto_117630 ?auto_117632 ) ) ( not ( = ?auto_117630 ?auto_117631 ) ) ( not ( = ?auto_117632 ?auto_117631 ) ) ( not ( = ?auto_117628 ?auto_117632 ) ) ( not ( = ?auto_117628 ?auto_117630 ) ) ( not ( = ?auto_117629 ?auto_117632 ) ) ( not ( = ?auto_117629 ?auto_117630 ) ) ( not ( = ?auto_117633 ?auto_117632 ) ) ( not ( = ?auto_117633 ?auto_117630 ) ) ( not ( = ?auto_117634 ?auto_117632 ) ) ( not ( = ?auto_117634 ?auto_117630 ) ) ( ON ?auto_117631 ?auto_117634 ) ( CLEAR ?auto_117631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_117628 ?auto_117629 ?auto_117633 ?auto_117634 )
      ( MAKE-2PILE ?auto_117628 ?auto_117629 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_117635 - BLOCK
      ?auto_117636 - BLOCK
    )
    :vars
    (
      ?auto_117640 - BLOCK
      ?auto_117641 - BLOCK
      ?auto_117637 - BLOCK
      ?auto_117638 - BLOCK
      ?auto_117639 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117640 ?auto_117636 ) ( ON-TABLE ?auto_117635 ) ( ON ?auto_117636 ?auto_117635 ) ( not ( = ?auto_117635 ?auto_117636 ) ) ( not ( = ?auto_117635 ?auto_117640 ) ) ( not ( = ?auto_117636 ?auto_117640 ) ) ( not ( = ?auto_117635 ?auto_117641 ) ) ( not ( = ?auto_117635 ?auto_117637 ) ) ( not ( = ?auto_117636 ?auto_117641 ) ) ( not ( = ?auto_117636 ?auto_117637 ) ) ( not ( = ?auto_117640 ?auto_117641 ) ) ( not ( = ?auto_117640 ?auto_117637 ) ) ( not ( = ?auto_117641 ?auto_117637 ) ) ( ON ?auto_117641 ?auto_117640 ) ( ON-TABLE ?auto_117638 ) ( not ( = ?auto_117638 ?auto_117639 ) ) ( not ( = ?auto_117638 ?auto_117637 ) ) ( not ( = ?auto_117639 ?auto_117637 ) ) ( not ( = ?auto_117635 ?auto_117639 ) ) ( not ( = ?auto_117635 ?auto_117638 ) ) ( not ( = ?auto_117636 ?auto_117639 ) ) ( not ( = ?auto_117636 ?auto_117638 ) ) ( not ( = ?auto_117640 ?auto_117639 ) ) ( not ( = ?auto_117640 ?auto_117638 ) ) ( not ( = ?auto_117641 ?auto_117639 ) ) ( not ( = ?auto_117641 ?auto_117638 ) ) ( ON ?auto_117637 ?auto_117641 ) ( CLEAR ?auto_117637 ) ( HOLDING ?auto_117639 ) ( CLEAR ?auto_117638 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_117638 ?auto_117639 )
      ( MAKE-2PILE ?auto_117635 ?auto_117636 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_117642 - BLOCK
      ?auto_117643 - BLOCK
    )
    :vars
    (
      ?auto_117645 - BLOCK
      ?auto_117646 - BLOCK
      ?auto_117644 - BLOCK
      ?auto_117647 - BLOCK
      ?auto_117648 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117645 ?auto_117643 ) ( ON-TABLE ?auto_117642 ) ( ON ?auto_117643 ?auto_117642 ) ( not ( = ?auto_117642 ?auto_117643 ) ) ( not ( = ?auto_117642 ?auto_117645 ) ) ( not ( = ?auto_117643 ?auto_117645 ) ) ( not ( = ?auto_117642 ?auto_117646 ) ) ( not ( = ?auto_117642 ?auto_117644 ) ) ( not ( = ?auto_117643 ?auto_117646 ) ) ( not ( = ?auto_117643 ?auto_117644 ) ) ( not ( = ?auto_117645 ?auto_117646 ) ) ( not ( = ?auto_117645 ?auto_117644 ) ) ( not ( = ?auto_117646 ?auto_117644 ) ) ( ON ?auto_117646 ?auto_117645 ) ( ON-TABLE ?auto_117647 ) ( not ( = ?auto_117647 ?auto_117648 ) ) ( not ( = ?auto_117647 ?auto_117644 ) ) ( not ( = ?auto_117648 ?auto_117644 ) ) ( not ( = ?auto_117642 ?auto_117648 ) ) ( not ( = ?auto_117642 ?auto_117647 ) ) ( not ( = ?auto_117643 ?auto_117648 ) ) ( not ( = ?auto_117643 ?auto_117647 ) ) ( not ( = ?auto_117645 ?auto_117648 ) ) ( not ( = ?auto_117645 ?auto_117647 ) ) ( not ( = ?auto_117646 ?auto_117648 ) ) ( not ( = ?auto_117646 ?auto_117647 ) ) ( ON ?auto_117644 ?auto_117646 ) ( CLEAR ?auto_117647 ) ( ON ?auto_117648 ?auto_117644 ) ( CLEAR ?auto_117648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_117642 ?auto_117643 ?auto_117645 ?auto_117646 ?auto_117644 )
      ( MAKE-2PILE ?auto_117642 ?auto_117643 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_117649 - BLOCK
      ?auto_117650 - BLOCK
    )
    :vars
    (
      ?auto_117651 - BLOCK
      ?auto_117655 - BLOCK
      ?auto_117653 - BLOCK
      ?auto_117652 - BLOCK
      ?auto_117654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117651 ?auto_117650 ) ( ON-TABLE ?auto_117649 ) ( ON ?auto_117650 ?auto_117649 ) ( not ( = ?auto_117649 ?auto_117650 ) ) ( not ( = ?auto_117649 ?auto_117651 ) ) ( not ( = ?auto_117650 ?auto_117651 ) ) ( not ( = ?auto_117649 ?auto_117655 ) ) ( not ( = ?auto_117649 ?auto_117653 ) ) ( not ( = ?auto_117650 ?auto_117655 ) ) ( not ( = ?auto_117650 ?auto_117653 ) ) ( not ( = ?auto_117651 ?auto_117655 ) ) ( not ( = ?auto_117651 ?auto_117653 ) ) ( not ( = ?auto_117655 ?auto_117653 ) ) ( ON ?auto_117655 ?auto_117651 ) ( not ( = ?auto_117652 ?auto_117654 ) ) ( not ( = ?auto_117652 ?auto_117653 ) ) ( not ( = ?auto_117654 ?auto_117653 ) ) ( not ( = ?auto_117649 ?auto_117654 ) ) ( not ( = ?auto_117649 ?auto_117652 ) ) ( not ( = ?auto_117650 ?auto_117654 ) ) ( not ( = ?auto_117650 ?auto_117652 ) ) ( not ( = ?auto_117651 ?auto_117654 ) ) ( not ( = ?auto_117651 ?auto_117652 ) ) ( not ( = ?auto_117655 ?auto_117654 ) ) ( not ( = ?auto_117655 ?auto_117652 ) ) ( ON ?auto_117653 ?auto_117655 ) ( ON ?auto_117654 ?auto_117653 ) ( CLEAR ?auto_117654 ) ( HOLDING ?auto_117652 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_117652 )
      ( MAKE-2PILE ?auto_117649 ?auto_117650 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_117656 - BLOCK
      ?auto_117657 - BLOCK
    )
    :vars
    (
      ?auto_117661 - BLOCK
      ?auto_117658 - BLOCK
      ?auto_117660 - BLOCK
      ?auto_117659 - BLOCK
      ?auto_117662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117661 ?auto_117657 ) ( ON-TABLE ?auto_117656 ) ( ON ?auto_117657 ?auto_117656 ) ( not ( = ?auto_117656 ?auto_117657 ) ) ( not ( = ?auto_117656 ?auto_117661 ) ) ( not ( = ?auto_117657 ?auto_117661 ) ) ( not ( = ?auto_117656 ?auto_117658 ) ) ( not ( = ?auto_117656 ?auto_117660 ) ) ( not ( = ?auto_117657 ?auto_117658 ) ) ( not ( = ?auto_117657 ?auto_117660 ) ) ( not ( = ?auto_117661 ?auto_117658 ) ) ( not ( = ?auto_117661 ?auto_117660 ) ) ( not ( = ?auto_117658 ?auto_117660 ) ) ( ON ?auto_117658 ?auto_117661 ) ( not ( = ?auto_117659 ?auto_117662 ) ) ( not ( = ?auto_117659 ?auto_117660 ) ) ( not ( = ?auto_117662 ?auto_117660 ) ) ( not ( = ?auto_117656 ?auto_117662 ) ) ( not ( = ?auto_117656 ?auto_117659 ) ) ( not ( = ?auto_117657 ?auto_117662 ) ) ( not ( = ?auto_117657 ?auto_117659 ) ) ( not ( = ?auto_117661 ?auto_117662 ) ) ( not ( = ?auto_117661 ?auto_117659 ) ) ( not ( = ?auto_117658 ?auto_117662 ) ) ( not ( = ?auto_117658 ?auto_117659 ) ) ( ON ?auto_117660 ?auto_117658 ) ( ON ?auto_117662 ?auto_117660 ) ( ON ?auto_117659 ?auto_117662 ) ( CLEAR ?auto_117659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_117656 ?auto_117657 ?auto_117661 ?auto_117658 ?auto_117660 ?auto_117662 )
      ( MAKE-2PILE ?auto_117656 ?auto_117657 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_117663 - BLOCK
      ?auto_117664 - BLOCK
    )
    :vars
    (
      ?auto_117667 - BLOCK
      ?auto_117665 - BLOCK
      ?auto_117668 - BLOCK
      ?auto_117666 - BLOCK
      ?auto_117669 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117667 ?auto_117664 ) ( ON-TABLE ?auto_117663 ) ( ON ?auto_117664 ?auto_117663 ) ( not ( = ?auto_117663 ?auto_117664 ) ) ( not ( = ?auto_117663 ?auto_117667 ) ) ( not ( = ?auto_117664 ?auto_117667 ) ) ( not ( = ?auto_117663 ?auto_117665 ) ) ( not ( = ?auto_117663 ?auto_117668 ) ) ( not ( = ?auto_117664 ?auto_117665 ) ) ( not ( = ?auto_117664 ?auto_117668 ) ) ( not ( = ?auto_117667 ?auto_117665 ) ) ( not ( = ?auto_117667 ?auto_117668 ) ) ( not ( = ?auto_117665 ?auto_117668 ) ) ( ON ?auto_117665 ?auto_117667 ) ( not ( = ?auto_117666 ?auto_117669 ) ) ( not ( = ?auto_117666 ?auto_117668 ) ) ( not ( = ?auto_117669 ?auto_117668 ) ) ( not ( = ?auto_117663 ?auto_117669 ) ) ( not ( = ?auto_117663 ?auto_117666 ) ) ( not ( = ?auto_117664 ?auto_117669 ) ) ( not ( = ?auto_117664 ?auto_117666 ) ) ( not ( = ?auto_117667 ?auto_117669 ) ) ( not ( = ?auto_117667 ?auto_117666 ) ) ( not ( = ?auto_117665 ?auto_117669 ) ) ( not ( = ?auto_117665 ?auto_117666 ) ) ( ON ?auto_117668 ?auto_117665 ) ( ON ?auto_117669 ?auto_117668 ) ( HOLDING ?auto_117666 ) ( CLEAR ?auto_117669 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_117663 ?auto_117664 ?auto_117667 ?auto_117665 ?auto_117668 ?auto_117669 ?auto_117666 )
      ( MAKE-2PILE ?auto_117663 ?auto_117664 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_117670 - BLOCK
      ?auto_117671 - BLOCK
    )
    :vars
    (
      ?auto_117674 - BLOCK
      ?auto_117673 - BLOCK
      ?auto_117675 - BLOCK
      ?auto_117672 - BLOCK
      ?auto_117676 - BLOCK
      ?auto_117677 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117674 ?auto_117671 ) ( ON-TABLE ?auto_117670 ) ( ON ?auto_117671 ?auto_117670 ) ( not ( = ?auto_117670 ?auto_117671 ) ) ( not ( = ?auto_117670 ?auto_117674 ) ) ( not ( = ?auto_117671 ?auto_117674 ) ) ( not ( = ?auto_117670 ?auto_117673 ) ) ( not ( = ?auto_117670 ?auto_117675 ) ) ( not ( = ?auto_117671 ?auto_117673 ) ) ( not ( = ?auto_117671 ?auto_117675 ) ) ( not ( = ?auto_117674 ?auto_117673 ) ) ( not ( = ?auto_117674 ?auto_117675 ) ) ( not ( = ?auto_117673 ?auto_117675 ) ) ( ON ?auto_117673 ?auto_117674 ) ( not ( = ?auto_117672 ?auto_117676 ) ) ( not ( = ?auto_117672 ?auto_117675 ) ) ( not ( = ?auto_117676 ?auto_117675 ) ) ( not ( = ?auto_117670 ?auto_117676 ) ) ( not ( = ?auto_117670 ?auto_117672 ) ) ( not ( = ?auto_117671 ?auto_117676 ) ) ( not ( = ?auto_117671 ?auto_117672 ) ) ( not ( = ?auto_117674 ?auto_117676 ) ) ( not ( = ?auto_117674 ?auto_117672 ) ) ( not ( = ?auto_117673 ?auto_117676 ) ) ( not ( = ?auto_117673 ?auto_117672 ) ) ( ON ?auto_117675 ?auto_117673 ) ( ON ?auto_117676 ?auto_117675 ) ( CLEAR ?auto_117676 ) ( ON ?auto_117672 ?auto_117677 ) ( CLEAR ?auto_117672 ) ( HAND-EMPTY ) ( not ( = ?auto_117670 ?auto_117677 ) ) ( not ( = ?auto_117671 ?auto_117677 ) ) ( not ( = ?auto_117674 ?auto_117677 ) ) ( not ( = ?auto_117673 ?auto_117677 ) ) ( not ( = ?auto_117675 ?auto_117677 ) ) ( not ( = ?auto_117672 ?auto_117677 ) ) ( not ( = ?auto_117676 ?auto_117677 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_117672 ?auto_117677 )
      ( MAKE-2PILE ?auto_117670 ?auto_117671 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_117678 - BLOCK
      ?auto_117679 - BLOCK
    )
    :vars
    (
      ?auto_117684 - BLOCK
      ?auto_117680 - BLOCK
      ?auto_117682 - BLOCK
      ?auto_117681 - BLOCK
      ?auto_117685 - BLOCK
      ?auto_117683 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117684 ?auto_117679 ) ( ON-TABLE ?auto_117678 ) ( ON ?auto_117679 ?auto_117678 ) ( not ( = ?auto_117678 ?auto_117679 ) ) ( not ( = ?auto_117678 ?auto_117684 ) ) ( not ( = ?auto_117679 ?auto_117684 ) ) ( not ( = ?auto_117678 ?auto_117680 ) ) ( not ( = ?auto_117678 ?auto_117682 ) ) ( not ( = ?auto_117679 ?auto_117680 ) ) ( not ( = ?auto_117679 ?auto_117682 ) ) ( not ( = ?auto_117684 ?auto_117680 ) ) ( not ( = ?auto_117684 ?auto_117682 ) ) ( not ( = ?auto_117680 ?auto_117682 ) ) ( ON ?auto_117680 ?auto_117684 ) ( not ( = ?auto_117681 ?auto_117685 ) ) ( not ( = ?auto_117681 ?auto_117682 ) ) ( not ( = ?auto_117685 ?auto_117682 ) ) ( not ( = ?auto_117678 ?auto_117685 ) ) ( not ( = ?auto_117678 ?auto_117681 ) ) ( not ( = ?auto_117679 ?auto_117685 ) ) ( not ( = ?auto_117679 ?auto_117681 ) ) ( not ( = ?auto_117684 ?auto_117685 ) ) ( not ( = ?auto_117684 ?auto_117681 ) ) ( not ( = ?auto_117680 ?auto_117685 ) ) ( not ( = ?auto_117680 ?auto_117681 ) ) ( ON ?auto_117682 ?auto_117680 ) ( ON ?auto_117681 ?auto_117683 ) ( CLEAR ?auto_117681 ) ( not ( = ?auto_117678 ?auto_117683 ) ) ( not ( = ?auto_117679 ?auto_117683 ) ) ( not ( = ?auto_117684 ?auto_117683 ) ) ( not ( = ?auto_117680 ?auto_117683 ) ) ( not ( = ?auto_117682 ?auto_117683 ) ) ( not ( = ?auto_117681 ?auto_117683 ) ) ( not ( = ?auto_117685 ?auto_117683 ) ) ( HOLDING ?auto_117685 ) ( CLEAR ?auto_117682 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_117678 ?auto_117679 ?auto_117684 ?auto_117680 ?auto_117682 ?auto_117685 )
      ( MAKE-2PILE ?auto_117678 ?auto_117679 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_117686 - BLOCK
      ?auto_117687 - BLOCK
    )
    :vars
    (
      ?auto_117692 - BLOCK
      ?auto_117693 - BLOCK
      ?auto_117691 - BLOCK
      ?auto_117688 - BLOCK
      ?auto_117690 - BLOCK
      ?auto_117689 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117692 ?auto_117687 ) ( ON-TABLE ?auto_117686 ) ( ON ?auto_117687 ?auto_117686 ) ( not ( = ?auto_117686 ?auto_117687 ) ) ( not ( = ?auto_117686 ?auto_117692 ) ) ( not ( = ?auto_117687 ?auto_117692 ) ) ( not ( = ?auto_117686 ?auto_117693 ) ) ( not ( = ?auto_117686 ?auto_117691 ) ) ( not ( = ?auto_117687 ?auto_117693 ) ) ( not ( = ?auto_117687 ?auto_117691 ) ) ( not ( = ?auto_117692 ?auto_117693 ) ) ( not ( = ?auto_117692 ?auto_117691 ) ) ( not ( = ?auto_117693 ?auto_117691 ) ) ( ON ?auto_117693 ?auto_117692 ) ( not ( = ?auto_117688 ?auto_117690 ) ) ( not ( = ?auto_117688 ?auto_117691 ) ) ( not ( = ?auto_117690 ?auto_117691 ) ) ( not ( = ?auto_117686 ?auto_117690 ) ) ( not ( = ?auto_117686 ?auto_117688 ) ) ( not ( = ?auto_117687 ?auto_117690 ) ) ( not ( = ?auto_117687 ?auto_117688 ) ) ( not ( = ?auto_117692 ?auto_117690 ) ) ( not ( = ?auto_117692 ?auto_117688 ) ) ( not ( = ?auto_117693 ?auto_117690 ) ) ( not ( = ?auto_117693 ?auto_117688 ) ) ( ON ?auto_117691 ?auto_117693 ) ( ON ?auto_117688 ?auto_117689 ) ( not ( = ?auto_117686 ?auto_117689 ) ) ( not ( = ?auto_117687 ?auto_117689 ) ) ( not ( = ?auto_117692 ?auto_117689 ) ) ( not ( = ?auto_117693 ?auto_117689 ) ) ( not ( = ?auto_117691 ?auto_117689 ) ) ( not ( = ?auto_117688 ?auto_117689 ) ) ( not ( = ?auto_117690 ?auto_117689 ) ) ( CLEAR ?auto_117691 ) ( ON ?auto_117690 ?auto_117688 ) ( CLEAR ?auto_117690 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_117689 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_117689 ?auto_117688 )
      ( MAKE-2PILE ?auto_117686 ?auto_117687 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_117694 - BLOCK
      ?auto_117695 - BLOCK
    )
    :vars
    (
      ?auto_117700 - BLOCK
      ?auto_117697 - BLOCK
      ?auto_117696 - BLOCK
      ?auto_117701 - BLOCK
      ?auto_117699 - BLOCK
      ?auto_117698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117700 ?auto_117695 ) ( ON-TABLE ?auto_117694 ) ( ON ?auto_117695 ?auto_117694 ) ( not ( = ?auto_117694 ?auto_117695 ) ) ( not ( = ?auto_117694 ?auto_117700 ) ) ( not ( = ?auto_117695 ?auto_117700 ) ) ( not ( = ?auto_117694 ?auto_117697 ) ) ( not ( = ?auto_117694 ?auto_117696 ) ) ( not ( = ?auto_117695 ?auto_117697 ) ) ( not ( = ?auto_117695 ?auto_117696 ) ) ( not ( = ?auto_117700 ?auto_117697 ) ) ( not ( = ?auto_117700 ?auto_117696 ) ) ( not ( = ?auto_117697 ?auto_117696 ) ) ( ON ?auto_117697 ?auto_117700 ) ( not ( = ?auto_117701 ?auto_117699 ) ) ( not ( = ?auto_117701 ?auto_117696 ) ) ( not ( = ?auto_117699 ?auto_117696 ) ) ( not ( = ?auto_117694 ?auto_117699 ) ) ( not ( = ?auto_117694 ?auto_117701 ) ) ( not ( = ?auto_117695 ?auto_117699 ) ) ( not ( = ?auto_117695 ?auto_117701 ) ) ( not ( = ?auto_117700 ?auto_117699 ) ) ( not ( = ?auto_117700 ?auto_117701 ) ) ( not ( = ?auto_117697 ?auto_117699 ) ) ( not ( = ?auto_117697 ?auto_117701 ) ) ( ON ?auto_117701 ?auto_117698 ) ( not ( = ?auto_117694 ?auto_117698 ) ) ( not ( = ?auto_117695 ?auto_117698 ) ) ( not ( = ?auto_117700 ?auto_117698 ) ) ( not ( = ?auto_117697 ?auto_117698 ) ) ( not ( = ?auto_117696 ?auto_117698 ) ) ( not ( = ?auto_117701 ?auto_117698 ) ) ( not ( = ?auto_117699 ?auto_117698 ) ) ( ON ?auto_117699 ?auto_117701 ) ( CLEAR ?auto_117699 ) ( ON-TABLE ?auto_117698 ) ( HOLDING ?auto_117696 ) ( CLEAR ?auto_117697 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_117694 ?auto_117695 ?auto_117700 ?auto_117697 ?auto_117696 )
      ( MAKE-2PILE ?auto_117694 ?auto_117695 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_117702 - BLOCK
      ?auto_117703 - BLOCK
    )
    :vars
    (
      ?auto_117704 - BLOCK
      ?auto_117706 - BLOCK
      ?auto_117708 - BLOCK
      ?auto_117707 - BLOCK
      ?auto_117705 - BLOCK
      ?auto_117709 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117704 ?auto_117703 ) ( ON-TABLE ?auto_117702 ) ( ON ?auto_117703 ?auto_117702 ) ( not ( = ?auto_117702 ?auto_117703 ) ) ( not ( = ?auto_117702 ?auto_117704 ) ) ( not ( = ?auto_117703 ?auto_117704 ) ) ( not ( = ?auto_117702 ?auto_117706 ) ) ( not ( = ?auto_117702 ?auto_117708 ) ) ( not ( = ?auto_117703 ?auto_117706 ) ) ( not ( = ?auto_117703 ?auto_117708 ) ) ( not ( = ?auto_117704 ?auto_117706 ) ) ( not ( = ?auto_117704 ?auto_117708 ) ) ( not ( = ?auto_117706 ?auto_117708 ) ) ( ON ?auto_117706 ?auto_117704 ) ( not ( = ?auto_117707 ?auto_117705 ) ) ( not ( = ?auto_117707 ?auto_117708 ) ) ( not ( = ?auto_117705 ?auto_117708 ) ) ( not ( = ?auto_117702 ?auto_117705 ) ) ( not ( = ?auto_117702 ?auto_117707 ) ) ( not ( = ?auto_117703 ?auto_117705 ) ) ( not ( = ?auto_117703 ?auto_117707 ) ) ( not ( = ?auto_117704 ?auto_117705 ) ) ( not ( = ?auto_117704 ?auto_117707 ) ) ( not ( = ?auto_117706 ?auto_117705 ) ) ( not ( = ?auto_117706 ?auto_117707 ) ) ( ON ?auto_117707 ?auto_117709 ) ( not ( = ?auto_117702 ?auto_117709 ) ) ( not ( = ?auto_117703 ?auto_117709 ) ) ( not ( = ?auto_117704 ?auto_117709 ) ) ( not ( = ?auto_117706 ?auto_117709 ) ) ( not ( = ?auto_117708 ?auto_117709 ) ) ( not ( = ?auto_117707 ?auto_117709 ) ) ( not ( = ?auto_117705 ?auto_117709 ) ) ( ON ?auto_117705 ?auto_117707 ) ( ON-TABLE ?auto_117709 ) ( CLEAR ?auto_117706 ) ( ON ?auto_117708 ?auto_117705 ) ( CLEAR ?auto_117708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_117709 ?auto_117707 ?auto_117705 )
      ( MAKE-2PILE ?auto_117702 ?auto_117703 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_117710 - BLOCK
      ?auto_117711 - BLOCK
    )
    :vars
    (
      ?auto_117717 - BLOCK
      ?auto_117715 - BLOCK
      ?auto_117716 - BLOCK
      ?auto_117714 - BLOCK
      ?auto_117713 - BLOCK
      ?auto_117712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117717 ?auto_117711 ) ( ON-TABLE ?auto_117710 ) ( ON ?auto_117711 ?auto_117710 ) ( not ( = ?auto_117710 ?auto_117711 ) ) ( not ( = ?auto_117710 ?auto_117717 ) ) ( not ( = ?auto_117711 ?auto_117717 ) ) ( not ( = ?auto_117710 ?auto_117715 ) ) ( not ( = ?auto_117710 ?auto_117716 ) ) ( not ( = ?auto_117711 ?auto_117715 ) ) ( not ( = ?auto_117711 ?auto_117716 ) ) ( not ( = ?auto_117717 ?auto_117715 ) ) ( not ( = ?auto_117717 ?auto_117716 ) ) ( not ( = ?auto_117715 ?auto_117716 ) ) ( not ( = ?auto_117714 ?auto_117713 ) ) ( not ( = ?auto_117714 ?auto_117716 ) ) ( not ( = ?auto_117713 ?auto_117716 ) ) ( not ( = ?auto_117710 ?auto_117713 ) ) ( not ( = ?auto_117710 ?auto_117714 ) ) ( not ( = ?auto_117711 ?auto_117713 ) ) ( not ( = ?auto_117711 ?auto_117714 ) ) ( not ( = ?auto_117717 ?auto_117713 ) ) ( not ( = ?auto_117717 ?auto_117714 ) ) ( not ( = ?auto_117715 ?auto_117713 ) ) ( not ( = ?auto_117715 ?auto_117714 ) ) ( ON ?auto_117714 ?auto_117712 ) ( not ( = ?auto_117710 ?auto_117712 ) ) ( not ( = ?auto_117711 ?auto_117712 ) ) ( not ( = ?auto_117717 ?auto_117712 ) ) ( not ( = ?auto_117715 ?auto_117712 ) ) ( not ( = ?auto_117716 ?auto_117712 ) ) ( not ( = ?auto_117714 ?auto_117712 ) ) ( not ( = ?auto_117713 ?auto_117712 ) ) ( ON ?auto_117713 ?auto_117714 ) ( ON-TABLE ?auto_117712 ) ( ON ?auto_117716 ?auto_117713 ) ( CLEAR ?auto_117716 ) ( HOLDING ?auto_117715 ) ( CLEAR ?auto_117717 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_117710 ?auto_117711 ?auto_117717 ?auto_117715 )
      ( MAKE-2PILE ?auto_117710 ?auto_117711 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_117718 - BLOCK
      ?auto_117719 - BLOCK
    )
    :vars
    (
      ?auto_117725 - BLOCK
      ?auto_117723 - BLOCK
      ?auto_117720 - BLOCK
      ?auto_117722 - BLOCK
      ?auto_117724 - BLOCK
      ?auto_117721 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117725 ?auto_117719 ) ( ON-TABLE ?auto_117718 ) ( ON ?auto_117719 ?auto_117718 ) ( not ( = ?auto_117718 ?auto_117719 ) ) ( not ( = ?auto_117718 ?auto_117725 ) ) ( not ( = ?auto_117719 ?auto_117725 ) ) ( not ( = ?auto_117718 ?auto_117723 ) ) ( not ( = ?auto_117718 ?auto_117720 ) ) ( not ( = ?auto_117719 ?auto_117723 ) ) ( not ( = ?auto_117719 ?auto_117720 ) ) ( not ( = ?auto_117725 ?auto_117723 ) ) ( not ( = ?auto_117725 ?auto_117720 ) ) ( not ( = ?auto_117723 ?auto_117720 ) ) ( not ( = ?auto_117722 ?auto_117724 ) ) ( not ( = ?auto_117722 ?auto_117720 ) ) ( not ( = ?auto_117724 ?auto_117720 ) ) ( not ( = ?auto_117718 ?auto_117724 ) ) ( not ( = ?auto_117718 ?auto_117722 ) ) ( not ( = ?auto_117719 ?auto_117724 ) ) ( not ( = ?auto_117719 ?auto_117722 ) ) ( not ( = ?auto_117725 ?auto_117724 ) ) ( not ( = ?auto_117725 ?auto_117722 ) ) ( not ( = ?auto_117723 ?auto_117724 ) ) ( not ( = ?auto_117723 ?auto_117722 ) ) ( ON ?auto_117722 ?auto_117721 ) ( not ( = ?auto_117718 ?auto_117721 ) ) ( not ( = ?auto_117719 ?auto_117721 ) ) ( not ( = ?auto_117725 ?auto_117721 ) ) ( not ( = ?auto_117723 ?auto_117721 ) ) ( not ( = ?auto_117720 ?auto_117721 ) ) ( not ( = ?auto_117722 ?auto_117721 ) ) ( not ( = ?auto_117724 ?auto_117721 ) ) ( ON ?auto_117724 ?auto_117722 ) ( ON-TABLE ?auto_117721 ) ( ON ?auto_117720 ?auto_117724 ) ( CLEAR ?auto_117725 ) ( ON ?auto_117723 ?auto_117720 ) ( CLEAR ?auto_117723 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_117721 ?auto_117722 ?auto_117724 ?auto_117720 )
      ( MAKE-2PILE ?auto_117718 ?auto_117719 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_117742 - BLOCK
      ?auto_117743 - BLOCK
    )
    :vars
    (
      ?auto_117749 - BLOCK
      ?auto_117747 - BLOCK
      ?auto_117744 - BLOCK
      ?auto_117748 - BLOCK
      ?auto_117746 - BLOCK
      ?auto_117745 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117742 ) ( not ( = ?auto_117742 ?auto_117743 ) ) ( not ( = ?auto_117742 ?auto_117749 ) ) ( not ( = ?auto_117743 ?auto_117749 ) ) ( not ( = ?auto_117742 ?auto_117747 ) ) ( not ( = ?auto_117742 ?auto_117744 ) ) ( not ( = ?auto_117743 ?auto_117747 ) ) ( not ( = ?auto_117743 ?auto_117744 ) ) ( not ( = ?auto_117749 ?auto_117747 ) ) ( not ( = ?auto_117749 ?auto_117744 ) ) ( not ( = ?auto_117747 ?auto_117744 ) ) ( not ( = ?auto_117748 ?auto_117746 ) ) ( not ( = ?auto_117748 ?auto_117744 ) ) ( not ( = ?auto_117746 ?auto_117744 ) ) ( not ( = ?auto_117742 ?auto_117746 ) ) ( not ( = ?auto_117742 ?auto_117748 ) ) ( not ( = ?auto_117743 ?auto_117746 ) ) ( not ( = ?auto_117743 ?auto_117748 ) ) ( not ( = ?auto_117749 ?auto_117746 ) ) ( not ( = ?auto_117749 ?auto_117748 ) ) ( not ( = ?auto_117747 ?auto_117746 ) ) ( not ( = ?auto_117747 ?auto_117748 ) ) ( ON ?auto_117748 ?auto_117745 ) ( not ( = ?auto_117742 ?auto_117745 ) ) ( not ( = ?auto_117743 ?auto_117745 ) ) ( not ( = ?auto_117749 ?auto_117745 ) ) ( not ( = ?auto_117747 ?auto_117745 ) ) ( not ( = ?auto_117744 ?auto_117745 ) ) ( not ( = ?auto_117748 ?auto_117745 ) ) ( not ( = ?auto_117746 ?auto_117745 ) ) ( ON ?auto_117746 ?auto_117748 ) ( ON-TABLE ?auto_117745 ) ( ON ?auto_117744 ?auto_117746 ) ( ON ?auto_117747 ?auto_117744 ) ( ON ?auto_117749 ?auto_117747 ) ( CLEAR ?auto_117749 ) ( HOLDING ?auto_117743 ) ( CLEAR ?auto_117742 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_117742 ?auto_117743 ?auto_117749 )
      ( MAKE-2PILE ?auto_117742 ?auto_117743 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_117750 - BLOCK
      ?auto_117751 - BLOCK
    )
    :vars
    (
      ?auto_117757 - BLOCK
      ?auto_117754 - BLOCK
      ?auto_117755 - BLOCK
      ?auto_117753 - BLOCK
      ?auto_117756 - BLOCK
      ?auto_117752 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117750 ) ( not ( = ?auto_117750 ?auto_117751 ) ) ( not ( = ?auto_117750 ?auto_117757 ) ) ( not ( = ?auto_117751 ?auto_117757 ) ) ( not ( = ?auto_117750 ?auto_117754 ) ) ( not ( = ?auto_117750 ?auto_117755 ) ) ( not ( = ?auto_117751 ?auto_117754 ) ) ( not ( = ?auto_117751 ?auto_117755 ) ) ( not ( = ?auto_117757 ?auto_117754 ) ) ( not ( = ?auto_117757 ?auto_117755 ) ) ( not ( = ?auto_117754 ?auto_117755 ) ) ( not ( = ?auto_117753 ?auto_117756 ) ) ( not ( = ?auto_117753 ?auto_117755 ) ) ( not ( = ?auto_117756 ?auto_117755 ) ) ( not ( = ?auto_117750 ?auto_117756 ) ) ( not ( = ?auto_117750 ?auto_117753 ) ) ( not ( = ?auto_117751 ?auto_117756 ) ) ( not ( = ?auto_117751 ?auto_117753 ) ) ( not ( = ?auto_117757 ?auto_117756 ) ) ( not ( = ?auto_117757 ?auto_117753 ) ) ( not ( = ?auto_117754 ?auto_117756 ) ) ( not ( = ?auto_117754 ?auto_117753 ) ) ( ON ?auto_117753 ?auto_117752 ) ( not ( = ?auto_117750 ?auto_117752 ) ) ( not ( = ?auto_117751 ?auto_117752 ) ) ( not ( = ?auto_117757 ?auto_117752 ) ) ( not ( = ?auto_117754 ?auto_117752 ) ) ( not ( = ?auto_117755 ?auto_117752 ) ) ( not ( = ?auto_117753 ?auto_117752 ) ) ( not ( = ?auto_117756 ?auto_117752 ) ) ( ON ?auto_117756 ?auto_117753 ) ( ON-TABLE ?auto_117752 ) ( ON ?auto_117755 ?auto_117756 ) ( ON ?auto_117754 ?auto_117755 ) ( ON ?auto_117757 ?auto_117754 ) ( CLEAR ?auto_117750 ) ( ON ?auto_117751 ?auto_117757 ) ( CLEAR ?auto_117751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_117752 ?auto_117753 ?auto_117756 ?auto_117755 ?auto_117754 ?auto_117757 )
      ( MAKE-2PILE ?auto_117750 ?auto_117751 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_117758 - BLOCK
      ?auto_117759 - BLOCK
    )
    :vars
    (
      ?auto_117762 - BLOCK
      ?auto_117765 - BLOCK
      ?auto_117763 - BLOCK
      ?auto_117761 - BLOCK
      ?auto_117764 - BLOCK
      ?auto_117760 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117758 ?auto_117759 ) ) ( not ( = ?auto_117758 ?auto_117762 ) ) ( not ( = ?auto_117759 ?auto_117762 ) ) ( not ( = ?auto_117758 ?auto_117765 ) ) ( not ( = ?auto_117758 ?auto_117763 ) ) ( not ( = ?auto_117759 ?auto_117765 ) ) ( not ( = ?auto_117759 ?auto_117763 ) ) ( not ( = ?auto_117762 ?auto_117765 ) ) ( not ( = ?auto_117762 ?auto_117763 ) ) ( not ( = ?auto_117765 ?auto_117763 ) ) ( not ( = ?auto_117761 ?auto_117764 ) ) ( not ( = ?auto_117761 ?auto_117763 ) ) ( not ( = ?auto_117764 ?auto_117763 ) ) ( not ( = ?auto_117758 ?auto_117764 ) ) ( not ( = ?auto_117758 ?auto_117761 ) ) ( not ( = ?auto_117759 ?auto_117764 ) ) ( not ( = ?auto_117759 ?auto_117761 ) ) ( not ( = ?auto_117762 ?auto_117764 ) ) ( not ( = ?auto_117762 ?auto_117761 ) ) ( not ( = ?auto_117765 ?auto_117764 ) ) ( not ( = ?auto_117765 ?auto_117761 ) ) ( ON ?auto_117761 ?auto_117760 ) ( not ( = ?auto_117758 ?auto_117760 ) ) ( not ( = ?auto_117759 ?auto_117760 ) ) ( not ( = ?auto_117762 ?auto_117760 ) ) ( not ( = ?auto_117765 ?auto_117760 ) ) ( not ( = ?auto_117763 ?auto_117760 ) ) ( not ( = ?auto_117761 ?auto_117760 ) ) ( not ( = ?auto_117764 ?auto_117760 ) ) ( ON ?auto_117764 ?auto_117761 ) ( ON-TABLE ?auto_117760 ) ( ON ?auto_117763 ?auto_117764 ) ( ON ?auto_117765 ?auto_117763 ) ( ON ?auto_117762 ?auto_117765 ) ( ON ?auto_117759 ?auto_117762 ) ( CLEAR ?auto_117759 ) ( HOLDING ?auto_117758 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_117758 )
      ( MAKE-2PILE ?auto_117758 ?auto_117759 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_117766 - BLOCK
      ?auto_117767 - BLOCK
    )
    :vars
    (
      ?auto_117769 - BLOCK
      ?auto_117772 - BLOCK
      ?auto_117768 - BLOCK
      ?auto_117771 - BLOCK
      ?auto_117770 - BLOCK
      ?auto_117773 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117766 ?auto_117767 ) ) ( not ( = ?auto_117766 ?auto_117769 ) ) ( not ( = ?auto_117767 ?auto_117769 ) ) ( not ( = ?auto_117766 ?auto_117772 ) ) ( not ( = ?auto_117766 ?auto_117768 ) ) ( not ( = ?auto_117767 ?auto_117772 ) ) ( not ( = ?auto_117767 ?auto_117768 ) ) ( not ( = ?auto_117769 ?auto_117772 ) ) ( not ( = ?auto_117769 ?auto_117768 ) ) ( not ( = ?auto_117772 ?auto_117768 ) ) ( not ( = ?auto_117771 ?auto_117770 ) ) ( not ( = ?auto_117771 ?auto_117768 ) ) ( not ( = ?auto_117770 ?auto_117768 ) ) ( not ( = ?auto_117766 ?auto_117770 ) ) ( not ( = ?auto_117766 ?auto_117771 ) ) ( not ( = ?auto_117767 ?auto_117770 ) ) ( not ( = ?auto_117767 ?auto_117771 ) ) ( not ( = ?auto_117769 ?auto_117770 ) ) ( not ( = ?auto_117769 ?auto_117771 ) ) ( not ( = ?auto_117772 ?auto_117770 ) ) ( not ( = ?auto_117772 ?auto_117771 ) ) ( ON ?auto_117771 ?auto_117773 ) ( not ( = ?auto_117766 ?auto_117773 ) ) ( not ( = ?auto_117767 ?auto_117773 ) ) ( not ( = ?auto_117769 ?auto_117773 ) ) ( not ( = ?auto_117772 ?auto_117773 ) ) ( not ( = ?auto_117768 ?auto_117773 ) ) ( not ( = ?auto_117771 ?auto_117773 ) ) ( not ( = ?auto_117770 ?auto_117773 ) ) ( ON ?auto_117770 ?auto_117771 ) ( ON-TABLE ?auto_117773 ) ( ON ?auto_117768 ?auto_117770 ) ( ON ?auto_117772 ?auto_117768 ) ( ON ?auto_117769 ?auto_117772 ) ( ON ?auto_117767 ?auto_117769 ) ( ON ?auto_117766 ?auto_117767 ) ( CLEAR ?auto_117766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_117773 ?auto_117771 ?auto_117770 ?auto_117768 ?auto_117772 ?auto_117769 ?auto_117767 )
      ( MAKE-2PILE ?auto_117766 ?auto_117767 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117779 - BLOCK
      ?auto_117780 - BLOCK
      ?auto_117781 - BLOCK
      ?auto_117782 - BLOCK
      ?auto_117783 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_117783 ) ( CLEAR ?auto_117782 ) ( ON-TABLE ?auto_117779 ) ( ON ?auto_117780 ?auto_117779 ) ( ON ?auto_117781 ?auto_117780 ) ( ON ?auto_117782 ?auto_117781 ) ( not ( = ?auto_117779 ?auto_117780 ) ) ( not ( = ?auto_117779 ?auto_117781 ) ) ( not ( = ?auto_117779 ?auto_117782 ) ) ( not ( = ?auto_117779 ?auto_117783 ) ) ( not ( = ?auto_117780 ?auto_117781 ) ) ( not ( = ?auto_117780 ?auto_117782 ) ) ( not ( = ?auto_117780 ?auto_117783 ) ) ( not ( = ?auto_117781 ?auto_117782 ) ) ( not ( = ?auto_117781 ?auto_117783 ) ) ( not ( = ?auto_117782 ?auto_117783 ) ) )
    :subtasks
    ( ( !STACK ?auto_117783 ?auto_117782 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117784 - BLOCK
      ?auto_117785 - BLOCK
      ?auto_117786 - BLOCK
      ?auto_117787 - BLOCK
      ?auto_117788 - BLOCK
    )
    :vars
    (
      ?auto_117789 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_117787 ) ( ON-TABLE ?auto_117784 ) ( ON ?auto_117785 ?auto_117784 ) ( ON ?auto_117786 ?auto_117785 ) ( ON ?auto_117787 ?auto_117786 ) ( not ( = ?auto_117784 ?auto_117785 ) ) ( not ( = ?auto_117784 ?auto_117786 ) ) ( not ( = ?auto_117784 ?auto_117787 ) ) ( not ( = ?auto_117784 ?auto_117788 ) ) ( not ( = ?auto_117785 ?auto_117786 ) ) ( not ( = ?auto_117785 ?auto_117787 ) ) ( not ( = ?auto_117785 ?auto_117788 ) ) ( not ( = ?auto_117786 ?auto_117787 ) ) ( not ( = ?auto_117786 ?auto_117788 ) ) ( not ( = ?auto_117787 ?auto_117788 ) ) ( ON ?auto_117788 ?auto_117789 ) ( CLEAR ?auto_117788 ) ( HAND-EMPTY ) ( not ( = ?auto_117784 ?auto_117789 ) ) ( not ( = ?auto_117785 ?auto_117789 ) ) ( not ( = ?auto_117786 ?auto_117789 ) ) ( not ( = ?auto_117787 ?auto_117789 ) ) ( not ( = ?auto_117788 ?auto_117789 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_117788 ?auto_117789 )
      ( MAKE-5PILE ?auto_117784 ?auto_117785 ?auto_117786 ?auto_117787 ?auto_117788 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117790 - BLOCK
      ?auto_117791 - BLOCK
      ?auto_117792 - BLOCK
      ?auto_117793 - BLOCK
      ?auto_117794 - BLOCK
    )
    :vars
    (
      ?auto_117795 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117790 ) ( ON ?auto_117791 ?auto_117790 ) ( ON ?auto_117792 ?auto_117791 ) ( not ( = ?auto_117790 ?auto_117791 ) ) ( not ( = ?auto_117790 ?auto_117792 ) ) ( not ( = ?auto_117790 ?auto_117793 ) ) ( not ( = ?auto_117790 ?auto_117794 ) ) ( not ( = ?auto_117791 ?auto_117792 ) ) ( not ( = ?auto_117791 ?auto_117793 ) ) ( not ( = ?auto_117791 ?auto_117794 ) ) ( not ( = ?auto_117792 ?auto_117793 ) ) ( not ( = ?auto_117792 ?auto_117794 ) ) ( not ( = ?auto_117793 ?auto_117794 ) ) ( ON ?auto_117794 ?auto_117795 ) ( CLEAR ?auto_117794 ) ( not ( = ?auto_117790 ?auto_117795 ) ) ( not ( = ?auto_117791 ?auto_117795 ) ) ( not ( = ?auto_117792 ?auto_117795 ) ) ( not ( = ?auto_117793 ?auto_117795 ) ) ( not ( = ?auto_117794 ?auto_117795 ) ) ( HOLDING ?auto_117793 ) ( CLEAR ?auto_117792 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_117790 ?auto_117791 ?auto_117792 ?auto_117793 )
      ( MAKE-5PILE ?auto_117790 ?auto_117791 ?auto_117792 ?auto_117793 ?auto_117794 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117796 - BLOCK
      ?auto_117797 - BLOCK
      ?auto_117798 - BLOCK
      ?auto_117799 - BLOCK
      ?auto_117800 - BLOCK
    )
    :vars
    (
      ?auto_117801 - BLOCK
      ?auto_117802 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117796 ) ( ON ?auto_117797 ?auto_117796 ) ( ON ?auto_117798 ?auto_117797 ) ( not ( = ?auto_117796 ?auto_117797 ) ) ( not ( = ?auto_117796 ?auto_117798 ) ) ( not ( = ?auto_117796 ?auto_117799 ) ) ( not ( = ?auto_117796 ?auto_117800 ) ) ( not ( = ?auto_117797 ?auto_117798 ) ) ( not ( = ?auto_117797 ?auto_117799 ) ) ( not ( = ?auto_117797 ?auto_117800 ) ) ( not ( = ?auto_117798 ?auto_117799 ) ) ( not ( = ?auto_117798 ?auto_117800 ) ) ( not ( = ?auto_117799 ?auto_117800 ) ) ( ON ?auto_117800 ?auto_117801 ) ( not ( = ?auto_117796 ?auto_117801 ) ) ( not ( = ?auto_117797 ?auto_117801 ) ) ( not ( = ?auto_117798 ?auto_117801 ) ) ( not ( = ?auto_117799 ?auto_117801 ) ) ( not ( = ?auto_117800 ?auto_117801 ) ) ( CLEAR ?auto_117798 ) ( ON ?auto_117799 ?auto_117800 ) ( CLEAR ?auto_117799 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_117802 ) ( ON ?auto_117801 ?auto_117802 ) ( not ( = ?auto_117802 ?auto_117801 ) ) ( not ( = ?auto_117802 ?auto_117800 ) ) ( not ( = ?auto_117802 ?auto_117799 ) ) ( not ( = ?auto_117796 ?auto_117802 ) ) ( not ( = ?auto_117797 ?auto_117802 ) ) ( not ( = ?auto_117798 ?auto_117802 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_117802 ?auto_117801 ?auto_117800 )
      ( MAKE-5PILE ?auto_117796 ?auto_117797 ?auto_117798 ?auto_117799 ?auto_117800 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117803 - BLOCK
      ?auto_117804 - BLOCK
      ?auto_117805 - BLOCK
      ?auto_117806 - BLOCK
      ?auto_117807 - BLOCK
    )
    :vars
    (
      ?auto_117809 - BLOCK
      ?auto_117808 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117803 ) ( ON ?auto_117804 ?auto_117803 ) ( not ( = ?auto_117803 ?auto_117804 ) ) ( not ( = ?auto_117803 ?auto_117805 ) ) ( not ( = ?auto_117803 ?auto_117806 ) ) ( not ( = ?auto_117803 ?auto_117807 ) ) ( not ( = ?auto_117804 ?auto_117805 ) ) ( not ( = ?auto_117804 ?auto_117806 ) ) ( not ( = ?auto_117804 ?auto_117807 ) ) ( not ( = ?auto_117805 ?auto_117806 ) ) ( not ( = ?auto_117805 ?auto_117807 ) ) ( not ( = ?auto_117806 ?auto_117807 ) ) ( ON ?auto_117807 ?auto_117809 ) ( not ( = ?auto_117803 ?auto_117809 ) ) ( not ( = ?auto_117804 ?auto_117809 ) ) ( not ( = ?auto_117805 ?auto_117809 ) ) ( not ( = ?auto_117806 ?auto_117809 ) ) ( not ( = ?auto_117807 ?auto_117809 ) ) ( ON ?auto_117806 ?auto_117807 ) ( CLEAR ?auto_117806 ) ( ON-TABLE ?auto_117808 ) ( ON ?auto_117809 ?auto_117808 ) ( not ( = ?auto_117808 ?auto_117809 ) ) ( not ( = ?auto_117808 ?auto_117807 ) ) ( not ( = ?auto_117808 ?auto_117806 ) ) ( not ( = ?auto_117803 ?auto_117808 ) ) ( not ( = ?auto_117804 ?auto_117808 ) ) ( not ( = ?auto_117805 ?auto_117808 ) ) ( HOLDING ?auto_117805 ) ( CLEAR ?auto_117804 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_117803 ?auto_117804 ?auto_117805 )
      ( MAKE-5PILE ?auto_117803 ?auto_117804 ?auto_117805 ?auto_117806 ?auto_117807 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117810 - BLOCK
      ?auto_117811 - BLOCK
      ?auto_117812 - BLOCK
      ?auto_117813 - BLOCK
      ?auto_117814 - BLOCK
    )
    :vars
    (
      ?auto_117815 - BLOCK
      ?auto_117816 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117810 ) ( ON ?auto_117811 ?auto_117810 ) ( not ( = ?auto_117810 ?auto_117811 ) ) ( not ( = ?auto_117810 ?auto_117812 ) ) ( not ( = ?auto_117810 ?auto_117813 ) ) ( not ( = ?auto_117810 ?auto_117814 ) ) ( not ( = ?auto_117811 ?auto_117812 ) ) ( not ( = ?auto_117811 ?auto_117813 ) ) ( not ( = ?auto_117811 ?auto_117814 ) ) ( not ( = ?auto_117812 ?auto_117813 ) ) ( not ( = ?auto_117812 ?auto_117814 ) ) ( not ( = ?auto_117813 ?auto_117814 ) ) ( ON ?auto_117814 ?auto_117815 ) ( not ( = ?auto_117810 ?auto_117815 ) ) ( not ( = ?auto_117811 ?auto_117815 ) ) ( not ( = ?auto_117812 ?auto_117815 ) ) ( not ( = ?auto_117813 ?auto_117815 ) ) ( not ( = ?auto_117814 ?auto_117815 ) ) ( ON ?auto_117813 ?auto_117814 ) ( ON-TABLE ?auto_117816 ) ( ON ?auto_117815 ?auto_117816 ) ( not ( = ?auto_117816 ?auto_117815 ) ) ( not ( = ?auto_117816 ?auto_117814 ) ) ( not ( = ?auto_117816 ?auto_117813 ) ) ( not ( = ?auto_117810 ?auto_117816 ) ) ( not ( = ?auto_117811 ?auto_117816 ) ) ( not ( = ?auto_117812 ?auto_117816 ) ) ( CLEAR ?auto_117811 ) ( ON ?auto_117812 ?auto_117813 ) ( CLEAR ?auto_117812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_117816 ?auto_117815 ?auto_117814 ?auto_117813 )
      ( MAKE-5PILE ?auto_117810 ?auto_117811 ?auto_117812 ?auto_117813 ?auto_117814 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117817 - BLOCK
      ?auto_117818 - BLOCK
      ?auto_117819 - BLOCK
      ?auto_117820 - BLOCK
      ?auto_117821 - BLOCK
    )
    :vars
    (
      ?auto_117823 - BLOCK
      ?auto_117822 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117817 ) ( not ( = ?auto_117817 ?auto_117818 ) ) ( not ( = ?auto_117817 ?auto_117819 ) ) ( not ( = ?auto_117817 ?auto_117820 ) ) ( not ( = ?auto_117817 ?auto_117821 ) ) ( not ( = ?auto_117818 ?auto_117819 ) ) ( not ( = ?auto_117818 ?auto_117820 ) ) ( not ( = ?auto_117818 ?auto_117821 ) ) ( not ( = ?auto_117819 ?auto_117820 ) ) ( not ( = ?auto_117819 ?auto_117821 ) ) ( not ( = ?auto_117820 ?auto_117821 ) ) ( ON ?auto_117821 ?auto_117823 ) ( not ( = ?auto_117817 ?auto_117823 ) ) ( not ( = ?auto_117818 ?auto_117823 ) ) ( not ( = ?auto_117819 ?auto_117823 ) ) ( not ( = ?auto_117820 ?auto_117823 ) ) ( not ( = ?auto_117821 ?auto_117823 ) ) ( ON ?auto_117820 ?auto_117821 ) ( ON-TABLE ?auto_117822 ) ( ON ?auto_117823 ?auto_117822 ) ( not ( = ?auto_117822 ?auto_117823 ) ) ( not ( = ?auto_117822 ?auto_117821 ) ) ( not ( = ?auto_117822 ?auto_117820 ) ) ( not ( = ?auto_117817 ?auto_117822 ) ) ( not ( = ?auto_117818 ?auto_117822 ) ) ( not ( = ?auto_117819 ?auto_117822 ) ) ( ON ?auto_117819 ?auto_117820 ) ( CLEAR ?auto_117819 ) ( HOLDING ?auto_117818 ) ( CLEAR ?auto_117817 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_117817 ?auto_117818 )
      ( MAKE-5PILE ?auto_117817 ?auto_117818 ?auto_117819 ?auto_117820 ?auto_117821 ) )
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
      ?auto_117830 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117824 ) ( not ( = ?auto_117824 ?auto_117825 ) ) ( not ( = ?auto_117824 ?auto_117826 ) ) ( not ( = ?auto_117824 ?auto_117827 ) ) ( not ( = ?auto_117824 ?auto_117828 ) ) ( not ( = ?auto_117825 ?auto_117826 ) ) ( not ( = ?auto_117825 ?auto_117827 ) ) ( not ( = ?auto_117825 ?auto_117828 ) ) ( not ( = ?auto_117826 ?auto_117827 ) ) ( not ( = ?auto_117826 ?auto_117828 ) ) ( not ( = ?auto_117827 ?auto_117828 ) ) ( ON ?auto_117828 ?auto_117829 ) ( not ( = ?auto_117824 ?auto_117829 ) ) ( not ( = ?auto_117825 ?auto_117829 ) ) ( not ( = ?auto_117826 ?auto_117829 ) ) ( not ( = ?auto_117827 ?auto_117829 ) ) ( not ( = ?auto_117828 ?auto_117829 ) ) ( ON ?auto_117827 ?auto_117828 ) ( ON-TABLE ?auto_117830 ) ( ON ?auto_117829 ?auto_117830 ) ( not ( = ?auto_117830 ?auto_117829 ) ) ( not ( = ?auto_117830 ?auto_117828 ) ) ( not ( = ?auto_117830 ?auto_117827 ) ) ( not ( = ?auto_117824 ?auto_117830 ) ) ( not ( = ?auto_117825 ?auto_117830 ) ) ( not ( = ?auto_117826 ?auto_117830 ) ) ( ON ?auto_117826 ?auto_117827 ) ( CLEAR ?auto_117824 ) ( ON ?auto_117825 ?auto_117826 ) ( CLEAR ?auto_117825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_117830 ?auto_117829 ?auto_117828 ?auto_117827 ?auto_117826 )
      ( MAKE-5PILE ?auto_117824 ?auto_117825 ?auto_117826 ?auto_117827 ?auto_117828 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117831 - BLOCK
      ?auto_117832 - BLOCK
      ?auto_117833 - BLOCK
      ?auto_117834 - BLOCK
      ?auto_117835 - BLOCK
    )
    :vars
    (
      ?auto_117836 - BLOCK
      ?auto_117837 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117831 ?auto_117832 ) ) ( not ( = ?auto_117831 ?auto_117833 ) ) ( not ( = ?auto_117831 ?auto_117834 ) ) ( not ( = ?auto_117831 ?auto_117835 ) ) ( not ( = ?auto_117832 ?auto_117833 ) ) ( not ( = ?auto_117832 ?auto_117834 ) ) ( not ( = ?auto_117832 ?auto_117835 ) ) ( not ( = ?auto_117833 ?auto_117834 ) ) ( not ( = ?auto_117833 ?auto_117835 ) ) ( not ( = ?auto_117834 ?auto_117835 ) ) ( ON ?auto_117835 ?auto_117836 ) ( not ( = ?auto_117831 ?auto_117836 ) ) ( not ( = ?auto_117832 ?auto_117836 ) ) ( not ( = ?auto_117833 ?auto_117836 ) ) ( not ( = ?auto_117834 ?auto_117836 ) ) ( not ( = ?auto_117835 ?auto_117836 ) ) ( ON ?auto_117834 ?auto_117835 ) ( ON-TABLE ?auto_117837 ) ( ON ?auto_117836 ?auto_117837 ) ( not ( = ?auto_117837 ?auto_117836 ) ) ( not ( = ?auto_117837 ?auto_117835 ) ) ( not ( = ?auto_117837 ?auto_117834 ) ) ( not ( = ?auto_117831 ?auto_117837 ) ) ( not ( = ?auto_117832 ?auto_117837 ) ) ( not ( = ?auto_117833 ?auto_117837 ) ) ( ON ?auto_117833 ?auto_117834 ) ( ON ?auto_117832 ?auto_117833 ) ( CLEAR ?auto_117832 ) ( HOLDING ?auto_117831 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_117831 )
      ( MAKE-5PILE ?auto_117831 ?auto_117832 ?auto_117833 ?auto_117834 ?auto_117835 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117838 - BLOCK
      ?auto_117839 - BLOCK
      ?auto_117840 - BLOCK
      ?auto_117841 - BLOCK
      ?auto_117842 - BLOCK
    )
    :vars
    (
      ?auto_117843 - BLOCK
      ?auto_117844 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117838 ?auto_117839 ) ) ( not ( = ?auto_117838 ?auto_117840 ) ) ( not ( = ?auto_117838 ?auto_117841 ) ) ( not ( = ?auto_117838 ?auto_117842 ) ) ( not ( = ?auto_117839 ?auto_117840 ) ) ( not ( = ?auto_117839 ?auto_117841 ) ) ( not ( = ?auto_117839 ?auto_117842 ) ) ( not ( = ?auto_117840 ?auto_117841 ) ) ( not ( = ?auto_117840 ?auto_117842 ) ) ( not ( = ?auto_117841 ?auto_117842 ) ) ( ON ?auto_117842 ?auto_117843 ) ( not ( = ?auto_117838 ?auto_117843 ) ) ( not ( = ?auto_117839 ?auto_117843 ) ) ( not ( = ?auto_117840 ?auto_117843 ) ) ( not ( = ?auto_117841 ?auto_117843 ) ) ( not ( = ?auto_117842 ?auto_117843 ) ) ( ON ?auto_117841 ?auto_117842 ) ( ON-TABLE ?auto_117844 ) ( ON ?auto_117843 ?auto_117844 ) ( not ( = ?auto_117844 ?auto_117843 ) ) ( not ( = ?auto_117844 ?auto_117842 ) ) ( not ( = ?auto_117844 ?auto_117841 ) ) ( not ( = ?auto_117838 ?auto_117844 ) ) ( not ( = ?auto_117839 ?auto_117844 ) ) ( not ( = ?auto_117840 ?auto_117844 ) ) ( ON ?auto_117840 ?auto_117841 ) ( ON ?auto_117839 ?auto_117840 ) ( ON ?auto_117838 ?auto_117839 ) ( CLEAR ?auto_117838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_117844 ?auto_117843 ?auto_117842 ?auto_117841 ?auto_117840 ?auto_117839 )
      ( MAKE-5PILE ?auto_117838 ?auto_117839 ?auto_117840 ?auto_117841 ?auto_117842 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117845 - BLOCK
      ?auto_117846 - BLOCK
      ?auto_117847 - BLOCK
      ?auto_117848 - BLOCK
      ?auto_117849 - BLOCK
    )
    :vars
    (
      ?auto_117851 - BLOCK
      ?auto_117850 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117845 ?auto_117846 ) ) ( not ( = ?auto_117845 ?auto_117847 ) ) ( not ( = ?auto_117845 ?auto_117848 ) ) ( not ( = ?auto_117845 ?auto_117849 ) ) ( not ( = ?auto_117846 ?auto_117847 ) ) ( not ( = ?auto_117846 ?auto_117848 ) ) ( not ( = ?auto_117846 ?auto_117849 ) ) ( not ( = ?auto_117847 ?auto_117848 ) ) ( not ( = ?auto_117847 ?auto_117849 ) ) ( not ( = ?auto_117848 ?auto_117849 ) ) ( ON ?auto_117849 ?auto_117851 ) ( not ( = ?auto_117845 ?auto_117851 ) ) ( not ( = ?auto_117846 ?auto_117851 ) ) ( not ( = ?auto_117847 ?auto_117851 ) ) ( not ( = ?auto_117848 ?auto_117851 ) ) ( not ( = ?auto_117849 ?auto_117851 ) ) ( ON ?auto_117848 ?auto_117849 ) ( ON-TABLE ?auto_117850 ) ( ON ?auto_117851 ?auto_117850 ) ( not ( = ?auto_117850 ?auto_117851 ) ) ( not ( = ?auto_117850 ?auto_117849 ) ) ( not ( = ?auto_117850 ?auto_117848 ) ) ( not ( = ?auto_117845 ?auto_117850 ) ) ( not ( = ?auto_117846 ?auto_117850 ) ) ( not ( = ?auto_117847 ?auto_117850 ) ) ( ON ?auto_117847 ?auto_117848 ) ( ON ?auto_117846 ?auto_117847 ) ( HOLDING ?auto_117845 ) ( CLEAR ?auto_117846 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_117850 ?auto_117851 ?auto_117849 ?auto_117848 ?auto_117847 ?auto_117846 ?auto_117845 )
      ( MAKE-5PILE ?auto_117845 ?auto_117846 ?auto_117847 ?auto_117848 ?auto_117849 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117852 - BLOCK
      ?auto_117853 - BLOCK
      ?auto_117854 - BLOCK
      ?auto_117855 - BLOCK
      ?auto_117856 - BLOCK
    )
    :vars
    (
      ?auto_117857 - BLOCK
      ?auto_117858 - BLOCK
      ?auto_117859 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117852 ?auto_117853 ) ) ( not ( = ?auto_117852 ?auto_117854 ) ) ( not ( = ?auto_117852 ?auto_117855 ) ) ( not ( = ?auto_117852 ?auto_117856 ) ) ( not ( = ?auto_117853 ?auto_117854 ) ) ( not ( = ?auto_117853 ?auto_117855 ) ) ( not ( = ?auto_117853 ?auto_117856 ) ) ( not ( = ?auto_117854 ?auto_117855 ) ) ( not ( = ?auto_117854 ?auto_117856 ) ) ( not ( = ?auto_117855 ?auto_117856 ) ) ( ON ?auto_117856 ?auto_117857 ) ( not ( = ?auto_117852 ?auto_117857 ) ) ( not ( = ?auto_117853 ?auto_117857 ) ) ( not ( = ?auto_117854 ?auto_117857 ) ) ( not ( = ?auto_117855 ?auto_117857 ) ) ( not ( = ?auto_117856 ?auto_117857 ) ) ( ON ?auto_117855 ?auto_117856 ) ( ON-TABLE ?auto_117858 ) ( ON ?auto_117857 ?auto_117858 ) ( not ( = ?auto_117858 ?auto_117857 ) ) ( not ( = ?auto_117858 ?auto_117856 ) ) ( not ( = ?auto_117858 ?auto_117855 ) ) ( not ( = ?auto_117852 ?auto_117858 ) ) ( not ( = ?auto_117853 ?auto_117858 ) ) ( not ( = ?auto_117854 ?auto_117858 ) ) ( ON ?auto_117854 ?auto_117855 ) ( ON ?auto_117853 ?auto_117854 ) ( CLEAR ?auto_117853 ) ( ON ?auto_117852 ?auto_117859 ) ( CLEAR ?auto_117852 ) ( HAND-EMPTY ) ( not ( = ?auto_117852 ?auto_117859 ) ) ( not ( = ?auto_117853 ?auto_117859 ) ) ( not ( = ?auto_117854 ?auto_117859 ) ) ( not ( = ?auto_117855 ?auto_117859 ) ) ( not ( = ?auto_117856 ?auto_117859 ) ) ( not ( = ?auto_117857 ?auto_117859 ) ) ( not ( = ?auto_117858 ?auto_117859 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_117852 ?auto_117859 )
      ( MAKE-5PILE ?auto_117852 ?auto_117853 ?auto_117854 ?auto_117855 ?auto_117856 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117860 - BLOCK
      ?auto_117861 - BLOCK
      ?auto_117862 - BLOCK
      ?auto_117863 - BLOCK
      ?auto_117864 - BLOCK
    )
    :vars
    (
      ?auto_117867 - BLOCK
      ?auto_117865 - BLOCK
      ?auto_117866 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117860 ?auto_117861 ) ) ( not ( = ?auto_117860 ?auto_117862 ) ) ( not ( = ?auto_117860 ?auto_117863 ) ) ( not ( = ?auto_117860 ?auto_117864 ) ) ( not ( = ?auto_117861 ?auto_117862 ) ) ( not ( = ?auto_117861 ?auto_117863 ) ) ( not ( = ?auto_117861 ?auto_117864 ) ) ( not ( = ?auto_117862 ?auto_117863 ) ) ( not ( = ?auto_117862 ?auto_117864 ) ) ( not ( = ?auto_117863 ?auto_117864 ) ) ( ON ?auto_117864 ?auto_117867 ) ( not ( = ?auto_117860 ?auto_117867 ) ) ( not ( = ?auto_117861 ?auto_117867 ) ) ( not ( = ?auto_117862 ?auto_117867 ) ) ( not ( = ?auto_117863 ?auto_117867 ) ) ( not ( = ?auto_117864 ?auto_117867 ) ) ( ON ?auto_117863 ?auto_117864 ) ( ON-TABLE ?auto_117865 ) ( ON ?auto_117867 ?auto_117865 ) ( not ( = ?auto_117865 ?auto_117867 ) ) ( not ( = ?auto_117865 ?auto_117864 ) ) ( not ( = ?auto_117865 ?auto_117863 ) ) ( not ( = ?auto_117860 ?auto_117865 ) ) ( not ( = ?auto_117861 ?auto_117865 ) ) ( not ( = ?auto_117862 ?auto_117865 ) ) ( ON ?auto_117862 ?auto_117863 ) ( ON ?auto_117860 ?auto_117866 ) ( CLEAR ?auto_117860 ) ( not ( = ?auto_117860 ?auto_117866 ) ) ( not ( = ?auto_117861 ?auto_117866 ) ) ( not ( = ?auto_117862 ?auto_117866 ) ) ( not ( = ?auto_117863 ?auto_117866 ) ) ( not ( = ?auto_117864 ?auto_117866 ) ) ( not ( = ?auto_117867 ?auto_117866 ) ) ( not ( = ?auto_117865 ?auto_117866 ) ) ( HOLDING ?auto_117861 ) ( CLEAR ?auto_117862 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_117865 ?auto_117867 ?auto_117864 ?auto_117863 ?auto_117862 ?auto_117861 )
      ( MAKE-5PILE ?auto_117860 ?auto_117861 ?auto_117862 ?auto_117863 ?auto_117864 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117868 - BLOCK
      ?auto_117869 - BLOCK
      ?auto_117870 - BLOCK
      ?auto_117871 - BLOCK
      ?auto_117872 - BLOCK
    )
    :vars
    (
      ?auto_117874 - BLOCK
      ?auto_117875 - BLOCK
      ?auto_117873 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117868 ?auto_117869 ) ) ( not ( = ?auto_117868 ?auto_117870 ) ) ( not ( = ?auto_117868 ?auto_117871 ) ) ( not ( = ?auto_117868 ?auto_117872 ) ) ( not ( = ?auto_117869 ?auto_117870 ) ) ( not ( = ?auto_117869 ?auto_117871 ) ) ( not ( = ?auto_117869 ?auto_117872 ) ) ( not ( = ?auto_117870 ?auto_117871 ) ) ( not ( = ?auto_117870 ?auto_117872 ) ) ( not ( = ?auto_117871 ?auto_117872 ) ) ( ON ?auto_117872 ?auto_117874 ) ( not ( = ?auto_117868 ?auto_117874 ) ) ( not ( = ?auto_117869 ?auto_117874 ) ) ( not ( = ?auto_117870 ?auto_117874 ) ) ( not ( = ?auto_117871 ?auto_117874 ) ) ( not ( = ?auto_117872 ?auto_117874 ) ) ( ON ?auto_117871 ?auto_117872 ) ( ON-TABLE ?auto_117875 ) ( ON ?auto_117874 ?auto_117875 ) ( not ( = ?auto_117875 ?auto_117874 ) ) ( not ( = ?auto_117875 ?auto_117872 ) ) ( not ( = ?auto_117875 ?auto_117871 ) ) ( not ( = ?auto_117868 ?auto_117875 ) ) ( not ( = ?auto_117869 ?auto_117875 ) ) ( not ( = ?auto_117870 ?auto_117875 ) ) ( ON ?auto_117870 ?auto_117871 ) ( ON ?auto_117868 ?auto_117873 ) ( not ( = ?auto_117868 ?auto_117873 ) ) ( not ( = ?auto_117869 ?auto_117873 ) ) ( not ( = ?auto_117870 ?auto_117873 ) ) ( not ( = ?auto_117871 ?auto_117873 ) ) ( not ( = ?auto_117872 ?auto_117873 ) ) ( not ( = ?auto_117874 ?auto_117873 ) ) ( not ( = ?auto_117875 ?auto_117873 ) ) ( CLEAR ?auto_117870 ) ( ON ?auto_117869 ?auto_117868 ) ( CLEAR ?auto_117869 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_117873 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_117873 ?auto_117868 )
      ( MAKE-5PILE ?auto_117868 ?auto_117869 ?auto_117870 ?auto_117871 ?auto_117872 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117876 - BLOCK
      ?auto_117877 - BLOCK
      ?auto_117878 - BLOCK
      ?auto_117879 - BLOCK
      ?auto_117880 - BLOCK
    )
    :vars
    (
      ?auto_117883 - BLOCK
      ?auto_117882 - BLOCK
      ?auto_117881 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117876 ?auto_117877 ) ) ( not ( = ?auto_117876 ?auto_117878 ) ) ( not ( = ?auto_117876 ?auto_117879 ) ) ( not ( = ?auto_117876 ?auto_117880 ) ) ( not ( = ?auto_117877 ?auto_117878 ) ) ( not ( = ?auto_117877 ?auto_117879 ) ) ( not ( = ?auto_117877 ?auto_117880 ) ) ( not ( = ?auto_117878 ?auto_117879 ) ) ( not ( = ?auto_117878 ?auto_117880 ) ) ( not ( = ?auto_117879 ?auto_117880 ) ) ( ON ?auto_117880 ?auto_117883 ) ( not ( = ?auto_117876 ?auto_117883 ) ) ( not ( = ?auto_117877 ?auto_117883 ) ) ( not ( = ?auto_117878 ?auto_117883 ) ) ( not ( = ?auto_117879 ?auto_117883 ) ) ( not ( = ?auto_117880 ?auto_117883 ) ) ( ON ?auto_117879 ?auto_117880 ) ( ON-TABLE ?auto_117882 ) ( ON ?auto_117883 ?auto_117882 ) ( not ( = ?auto_117882 ?auto_117883 ) ) ( not ( = ?auto_117882 ?auto_117880 ) ) ( not ( = ?auto_117882 ?auto_117879 ) ) ( not ( = ?auto_117876 ?auto_117882 ) ) ( not ( = ?auto_117877 ?auto_117882 ) ) ( not ( = ?auto_117878 ?auto_117882 ) ) ( ON ?auto_117876 ?auto_117881 ) ( not ( = ?auto_117876 ?auto_117881 ) ) ( not ( = ?auto_117877 ?auto_117881 ) ) ( not ( = ?auto_117878 ?auto_117881 ) ) ( not ( = ?auto_117879 ?auto_117881 ) ) ( not ( = ?auto_117880 ?auto_117881 ) ) ( not ( = ?auto_117883 ?auto_117881 ) ) ( not ( = ?auto_117882 ?auto_117881 ) ) ( ON ?auto_117877 ?auto_117876 ) ( CLEAR ?auto_117877 ) ( ON-TABLE ?auto_117881 ) ( HOLDING ?auto_117878 ) ( CLEAR ?auto_117879 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_117882 ?auto_117883 ?auto_117880 ?auto_117879 ?auto_117878 )
      ( MAKE-5PILE ?auto_117876 ?auto_117877 ?auto_117878 ?auto_117879 ?auto_117880 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117884 - BLOCK
      ?auto_117885 - BLOCK
      ?auto_117886 - BLOCK
      ?auto_117887 - BLOCK
      ?auto_117888 - BLOCK
    )
    :vars
    (
      ?auto_117889 - BLOCK
      ?auto_117890 - BLOCK
      ?auto_117891 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117884 ?auto_117885 ) ) ( not ( = ?auto_117884 ?auto_117886 ) ) ( not ( = ?auto_117884 ?auto_117887 ) ) ( not ( = ?auto_117884 ?auto_117888 ) ) ( not ( = ?auto_117885 ?auto_117886 ) ) ( not ( = ?auto_117885 ?auto_117887 ) ) ( not ( = ?auto_117885 ?auto_117888 ) ) ( not ( = ?auto_117886 ?auto_117887 ) ) ( not ( = ?auto_117886 ?auto_117888 ) ) ( not ( = ?auto_117887 ?auto_117888 ) ) ( ON ?auto_117888 ?auto_117889 ) ( not ( = ?auto_117884 ?auto_117889 ) ) ( not ( = ?auto_117885 ?auto_117889 ) ) ( not ( = ?auto_117886 ?auto_117889 ) ) ( not ( = ?auto_117887 ?auto_117889 ) ) ( not ( = ?auto_117888 ?auto_117889 ) ) ( ON ?auto_117887 ?auto_117888 ) ( ON-TABLE ?auto_117890 ) ( ON ?auto_117889 ?auto_117890 ) ( not ( = ?auto_117890 ?auto_117889 ) ) ( not ( = ?auto_117890 ?auto_117888 ) ) ( not ( = ?auto_117890 ?auto_117887 ) ) ( not ( = ?auto_117884 ?auto_117890 ) ) ( not ( = ?auto_117885 ?auto_117890 ) ) ( not ( = ?auto_117886 ?auto_117890 ) ) ( ON ?auto_117884 ?auto_117891 ) ( not ( = ?auto_117884 ?auto_117891 ) ) ( not ( = ?auto_117885 ?auto_117891 ) ) ( not ( = ?auto_117886 ?auto_117891 ) ) ( not ( = ?auto_117887 ?auto_117891 ) ) ( not ( = ?auto_117888 ?auto_117891 ) ) ( not ( = ?auto_117889 ?auto_117891 ) ) ( not ( = ?auto_117890 ?auto_117891 ) ) ( ON ?auto_117885 ?auto_117884 ) ( ON-TABLE ?auto_117891 ) ( CLEAR ?auto_117887 ) ( ON ?auto_117886 ?auto_117885 ) ( CLEAR ?auto_117886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_117891 ?auto_117884 ?auto_117885 )
      ( MAKE-5PILE ?auto_117884 ?auto_117885 ?auto_117886 ?auto_117887 ?auto_117888 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117892 - BLOCK
      ?auto_117893 - BLOCK
      ?auto_117894 - BLOCK
      ?auto_117895 - BLOCK
      ?auto_117896 - BLOCK
    )
    :vars
    (
      ?auto_117898 - BLOCK
      ?auto_117897 - BLOCK
      ?auto_117899 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117892 ?auto_117893 ) ) ( not ( = ?auto_117892 ?auto_117894 ) ) ( not ( = ?auto_117892 ?auto_117895 ) ) ( not ( = ?auto_117892 ?auto_117896 ) ) ( not ( = ?auto_117893 ?auto_117894 ) ) ( not ( = ?auto_117893 ?auto_117895 ) ) ( not ( = ?auto_117893 ?auto_117896 ) ) ( not ( = ?auto_117894 ?auto_117895 ) ) ( not ( = ?auto_117894 ?auto_117896 ) ) ( not ( = ?auto_117895 ?auto_117896 ) ) ( ON ?auto_117896 ?auto_117898 ) ( not ( = ?auto_117892 ?auto_117898 ) ) ( not ( = ?auto_117893 ?auto_117898 ) ) ( not ( = ?auto_117894 ?auto_117898 ) ) ( not ( = ?auto_117895 ?auto_117898 ) ) ( not ( = ?auto_117896 ?auto_117898 ) ) ( ON-TABLE ?auto_117897 ) ( ON ?auto_117898 ?auto_117897 ) ( not ( = ?auto_117897 ?auto_117898 ) ) ( not ( = ?auto_117897 ?auto_117896 ) ) ( not ( = ?auto_117897 ?auto_117895 ) ) ( not ( = ?auto_117892 ?auto_117897 ) ) ( not ( = ?auto_117893 ?auto_117897 ) ) ( not ( = ?auto_117894 ?auto_117897 ) ) ( ON ?auto_117892 ?auto_117899 ) ( not ( = ?auto_117892 ?auto_117899 ) ) ( not ( = ?auto_117893 ?auto_117899 ) ) ( not ( = ?auto_117894 ?auto_117899 ) ) ( not ( = ?auto_117895 ?auto_117899 ) ) ( not ( = ?auto_117896 ?auto_117899 ) ) ( not ( = ?auto_117898 ?auto_117899 ) ) ( not ( = ?auto_117897 ?auto_117899 ) ) ( ON ?auto_117893 ?auto_117892 ) ( ON-TABLE ?auto_117899 ) ( ON ?auto_117894 ?auto_117893 ) ( CLEAR ?auto_117894 ) ( HOLDING ?auto_117895 ) ( CLEAR ?auto_117896 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_117897 ?auto_117898 ?auto_117896 ?auto_117895 )
      ( MAKE-5PILE ?auto_117892 ?auto_117893 ?auto_117894 ?auto_117895 ?auto_117896 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117900 - BLOCK
      ?auto_117901 - BLOCK
      ?auto_117902 - BLOCK
      ?auto_117903 - BLOCK
      ?auto_117904 - BLOCK
    )
    :vars
    (
      ?auto_117907 - BLOCK
      ?auto_117905 - BLOCK
      ?auto_117906 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117900 ?auto_117901 ) ) ( not ( = ?auto_117900 ?auto_117902 ) ) ( not ( = ?auto_117900 ?auto_117903 ) ) ( not ( = ?auto_117900 ?auto_117904 ) ) ( not ( = ?auto_117901 ?auto_117902 ) ) ( not ( = ?auto_117901 ?auto_117903 ) ) ( not ( = ?auto_117901 ?auto_117904 ) ) ( not ( = ?auto_117902 ?auto_117903 ) ) ( not ( = ?auto_117902 ?auto_117904 ) ) ( not ( = ?auto_117903 ?auto_117904 ) ) ( ON ?auto_117904 ?auto_117907 ) ( not ( = ?auto_117900 ?auto_117907 ) ) ( not ( = ?auto_117901 ?auto_117907 ) ) ( not ( = ?auto_117902 ?auto_117907 ) ) ( not ( = ?auto_117903 ?auto_117907 ) ) ( not ( = ?auto_117904 ?auto_117907 ) ) ( ON-TABLE ?auto_117905 ) ( ON ?auto_117907 ?auto_117905 ) ( not ( = ?auto_117905 ?auto_117907 ) ) ( not ( = ?auto_117905 ?auto_117904 ) ) ( not ( = ?auto_117905 ?auto_117903 ) ) ( not ( = ?auto_117900 ?auto_117905 ) ) ( not ( = ?auto_117901 ?auto_117905 ) ) ( not ( = ?auto_117902 ?auto_117905 ) ) ( ON ?auto_117900 ?auto_117906 ) ( not ( = ?auto_117900 ?auto_117906 ) ) ( not ( = ?auto_117901 ?auto_117906 ) ) ( not ( = ?auto_117902 ?auto_117906 ) ) ( not ( = ?auto_117903 ?auto_117906 ) ) ( not ( = ?auto_117904 ?auto_117906 ) ) ( not ( = ?auto_117907 ?auto_117906 ) ) ( not ( = ?auto_117905 ?auto_117906 ) ) ( ON ?auto_117901 ?auto_117900 ) ( ON-TABLE ?auto_117906 ) ( ON ?auto_117902 ?auto_117901 ) ( CLEAR ?auto_117904 ) ( ON ?auto_117903 ?auto_117902 ) ( CLEAR ?auto_117903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_117906 ?auto_117900 ?auto_117901 ?auto_117902 )
      ( MAKE-5PILE ?auto_117900 ?auto_117901 ?auto_117902 ?auto_117903 ?auto_117904 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117908 - BLOCK
      ?auto_117909 - BLOCK
      ?auto_117910 - BLOCK
      ?auto_117911 - BLOCK
      ?auto_117912 - BLOCK
    )
    :vars
    (
      ?auto_117914 - BLOCK
      ?auto_117913 - BLOCK
      ?auto_117915 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117908 ?auto_117909 ) ) ( not ( = ?auto_117908 ?auto_117910 ) ) ( not ( = ?auto_117908 ?auto_117911 ) ) ( not ( = ?auto_117908 ?auto_117912 ) ) ( not ( = ?auto_117909 ?auto_117910 ) ) ( not ( = ?auto_117909 ?auto_117911 ) ) ( not ( = ?auto_117909 ?auto_117912 ) ) ( not ( = ?auto_117910 ?auto_117911 ) ) ( not ( = ?auto_117910 ?auto_117912 ) ) ( not ( = ?auto_117911 ?auto_117912 ) ) ( not ( = ?auto_117908 ?auto_117914 ) ) ( not ( = ?auto_117909 ?auto_117914 ) ) ( not ( = ?auto_117910 ?auto_117914 ) ) ( not ( = ?auto_117911 ?auto_117914 ) ) ( not ( = ?auto_117912 ?auto_117914 ) ) ( ON-TABLE ?auto_117913 ) ( ON ?auto_117914 ?auto_117913 ) ( not ( = ?auto_117913 ?auto_117914 ) ) ( not ( = ?auto_117913 ?auto_117912 ) ) ( not ( = ?auto_117913 ?auto_117911 ) ) ( not ( = ?auto_117908 ?auto_117913 ) ) ( not ( = ?auto_117909 ?auto_117913 ) ) ( not ( = ?auto_117910 ?auto_117913 ) ) ( ON ?auto_117908 ?auto_117915 ) ( not ( = ?auto_117908 ?auto_117915 ) ) ( not ( = ?auto_117909 ?auto_117915 ) ) ( not ( = ?auto_117910 ?auto_117915 ) ) ( not ( = ?auto_117911 ?auto_117915 ) ) ( not ( = ?auto_117912 ?auto_117915 ) ) ( not ( = ?auto_117914 ?auto_117915 ) ) ( not ( = ?auto_117913 ?auto_117915 ) ) ( ON ?auto_117909 ?auto_117908 ) ( ON-TABLE ?auto_117915 ) ( ON ?auto_117910 ?auto_117909 ) ( ON ?auto_117911 ?auto_117910 ) ( CLEAR ?auto_117911 ) ( HOLDING ?auto_117912 ) ( CLEAR ?auto_117914 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_117913 ?auto_117914 ?auto_117912 )
      ( MAKE-5PILE ?auto_117908 ?auto_117909 ?auto_117910 ?auto_117911 ?auto_117912 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117916 - BLOCK
      ?auto_117917 - BLOCK
      ?auto_117918 - BLOCK
      ?auto_117919 - BLOCK
      ?auto_117920 - BLOCK
    )
    :vars
    (
      ?auto_117922 - BLOCK
      ?auto_117923 - BLOCK
      ?auto_117921 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117916 ?auto_117917 ) ) ( not ( = ?auto_117916 ?auto_117918 ) ) ( not ( = ?auto_117916 ?auto_117919 ) ) ( not ( = ?auto_117916 ?auto_117920 ) ) ( not ( = ?auto_117917 ?auto_117918 ) ) ( not ( = ?auto_117917 ?auto_117919 ) ) ( not ( = ?auto_117917 ?auto_117920 ) ) ( not ( = ?auto_117918 ?auto_117919 ) ) ( not ( = ?auto_117918 ?auto_117920 ) ) ( not ( = ?auto_117919 ?auto_117920 ) ) ( not ( = ?auto_117916 ?auto_117922 ) ) ( not ( = ?auto_117917 ?auto_117922 ) ) ( not ( = ?auto_117918 ?auto_117922 ) ) ( not ( = ?auto_117919 ?auto_117922 ) ) ( not ( = ?auto_117920 ?auto_117922 ) ) ( ON-TABLE ?auto_117923 ) ( ON ?auto_117922 ?auto_117923 ) ( not ( = ?auto_117923 ?auto_117922 ) ) ( not ( = ?auto_117923 ?auto_117920 ) ) ( not ( = ?auto_117923 ?auto_117919 ) ) ( not ( = ?auto_117916 ?auto_117923 ) ) ( not ( = ?auto_117917 ?auto_117923 ) ) ( not ( = ?auto_117918 ?auto_117923 ) ) ( ON ?auto_117916 ?auto_117921 ) ( not ( = ?auto_117916 ?auto_117921 ) ) ( not ( = ?auto_117917 ?auto_117921 ) ) ( not ( = ?auto_117918 ?auto_117921 ) ) ( not ( = ?auto_117919 ?auto_117921 ) ) ( not ( = ?auto_117920 ?auto_117921 ) ) ( not ( = ?auto_117922 ?auto_117921 ) ) ( not ( = ?auto_117923 ?auto_117921 ) ) ( ON ?auto_117917 ?auto_117916 ) ( ON-TABLE ?auto_117921 ) ( ON ?auto_117918 ?auto_117917 ) ( ON ?auto_117919 ?auto_117918 ) ( CLEAR ?auto_117922 ) ( ON ?auto_117920 ?auto_117919 ) ( CLEAR ?auto_117920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_117921 ?auto_117916 ?auto_117917 ?auto_117918 ?auto_117919 )
      ( MAKE-5PILE ?auto_117916 ?auto_117917 ?auto_117918 ?auto_117919 ?auto_117920 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117924 - BLOCK
      ?auto_117925 - BLOCK
      ?auto_117926 - BLOCK
      ?auto_117927 - BLOCK
      ?auto_117928 - BLOCK
    )
    :vars
    (
      ?auto_117930 - BLOCK
      ?auto_117929 - BLOCK
      ?auto_117931 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117924 ?auto_117925 ) ) ( not ( = ?auto_117924 ?auto_117926 ) ) ( not ( = ?auto_117924 ?auto_117927 ) ) ( not ( = ?auto_117924 ?auto_117928 ) ) ( not ( = ?auto_117925 ?auto_117926 ) ) ( not ( = ?auto_117925 ?auto_117927 ) ) ( not ( = ?auto_117925 ?auto_117928 ) ) ( not ( = ?auto_117926 ?auto_117927 ) ) ( not ( = ?auto_117926 ?auto_117928 ) ) ( not ( = ?auto_117927 ?auto_117928 ) ) ( not ( = ?auto_117924 ?auto_117930 ) ) ( not ( = ?auto_117925 ?auto_117930 ) ) ( not ( = ?auto_117926 ?auto_117930 ) ) ( not ( = ?auto_117927 ?auto_117930 ) ) ( not ( = ?auto_117928 ?auto_117930 ) ) ( ON-TABLE ?auto_117929 ) ( not ( = ?auto_117929 ?auto_117930 ) ) ( not ( = ?auto_117929 ?auto_117928 ) ) ( not ( = ?auto_117929 ?auto_117927 ) ) ( not ( = ?auto_117924 ?auto_117929 ) ) ( not ( = ?auto_117925 ?auto_117929 ) ) ( not ( = ?auto_117926 ?auto_117929 ) ) ( ON ?auto_117924 ?auto_117931 ) ( not ( = ?auto_117924 ?auto_117931 ) ) ( not ( = ?auto_117925 ?auto_117931 ) ) ( not ( = ?auto_117926 ?auto_117931 ) ) ( not ( = ?auto_117927 ?auto_117931 ) ) ( not ( = ?auto_117928 ?auto_117931 ) ) ( not ( = ?auto_117930 ?auto_117931 ) ) ( not ( = ?auto_117929 ?auto_117931 ) ) ( ON ?auto_117925 ?auto_117924 ) ( ON-TABLE ?auto_117931 ) ( ON ?auto_117926 ?auto_117925 ) ( ON ?auto_117927 ?auto_117926 ) ( ON ?auto_117928 ?auto_117927 ) ( CLEAR ?auto_117928 ) ( HOLDING ?auto_117930 ) ( CLEAR ?auto_117929 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_117929 ?auto_117930 )
      ( MAKE-5PILE ?auto_117924 ?auto_117925 ?auto_117926 ?auto_117927 ?auto_117928 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117932 - BLOCK
      ?auto_117933 - BLOCK
      ?auto_117934 - BLOCK
      ?auto_117935 - BLOCK
      ?auto_117936 - BLOCK
    )
    :vars
    (
      ?auto_117937 - BLOCK
      ?auto_117939 - BLOCK
      ?auto_117938 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117932 ?auto_117933 ) ) ( not ( = ?auto_117932 ?auto_117934 ) ) ( not ( = ?auto_117932 ?auto_117935 ) ) ( not ( = ?auto_117932 ?auto_117936 ) ) ( not ( = ?auto_117933 ?auto_117934 ) ) ( not ( = ?auto_117933 ?auto_117935 ) ) ( not ( = ?auto_117933 ?auto_117936 ) ) ( not ( = ?auto_117934 ?auto_117935 ) ) ( not ( = ?auto_117934 ?auto_117936 ) ) ( not ( = ?auto_117935 ?auto_117936 ) ) ( not ( = ?auto_117932 ?auto_117937 ) ) ( not ( = ?auto_117933 ?auto_117937 ) ) ( not ( = ?auto_117934 ?auto_117937 ) ) ( not ( = ?auto_117935 ?auto_117937 ) ) ( not ( = ?auto_117936 ?auto_117937 ) ) ( ON-TABLE ?auto_117939 ) ( not ( = ?auto_117939 ?auto_117937 ) ) ( not ( = ?auto_117939 ?auto_117936 ) ) ( not ( = ?auto_117939 ?auto_117935 ) ) ( not ( = ?auto_117932 ?auto_117939 ) ) ( not ( = ?auto_117933 ?auto_117939 ) ) ( not ( = ?auto_117934 ?auto_117939 ) ) ( ON ?auto_117932 ?auto_117938 ) ( not ( = ?auto_117932 ?auto_117938 ) ) ( not ( = ?auto_117933 ?auto_117938 ) ) ( not ( = ?auto_117934 ?auto_117938 ) ) ( not ( = ?auto_117935 ?auto_117938 ) ) ( not ( = ?auto_117936 ?auto_117938 ) ) ( not ( = ?auto_117937 ?auto_117938 ) ) ( not ( = ?auto_117939 ?auto_117938 ) ) ( ON ?auto_117933 ?auto_117932 ) ( ON-TABLE ?auto_117938 ) ( ON ?auto_117934 ?auto_117933 ) ( ON ?auto_117935 ?auto_117934 ) ( ON ?auto_117936 ?auto_117935 ) ( CLEAR ?auto_117939 ) ( ON ?auto_117937 ?auto_117936 ) ( CLEAR ?auto_117937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_117938 ?auto_117932 ?auto_117933 ?auto_117934 ?auto_117935 ?auto_117936 )
      ( MAKE-5PILE ?auto_117932 ?auto_117933 ?auto_117934 ?auto_117935 ?auto_117936 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117940 - BLOCK
      ?auto_117941 - BLOCK
      ?auto_117942 - BLOCK
      ?auto_117943 - BLOCK
      ?auto_117944 - BLOCK
    )
    :vars
    (
      ?auto_117945 - BLOCK
      ?auto_117947 - BLOCK
      ?auto_117946 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117940 ?auto_117941 ) ) ( not ( = ?auto_117940 ?auto_117942 ) ) ( not ( = ?auto_117940 ?auto_117943 ) ) ( not ( = ?auto_117940 ?auto_117944 ) ) ( not ( = ?auto_117941 ?auto_117942 ) ) ( not ( = ?auto_117941 ?auto_117943 ) ) ( not ( = ?auto_117941 ?auto_117944 ) ) ( not ( = ?auto_117942 ?auto_117943 ) ) ( not ( = ?auto_117942 ?auto_117944 ) ) ( not ( = ?auto_117943 ?auto_117944 ) ) ( not ( = ?auto_117940 ?auto_117945 ) ) ( not ( = ?auto_117941 ?auto_117945 ) ) ( not ( = ?auto_117942 ?auto_117945 ) ) ( not ( = ?auto_117943 ?auto_117945 ) ) ( not ( = ?auto_117944 ?auto_117945 ) ) ( not ( = ?auto_117947 ?auto_117945 ) ) ( not ( = ?auto_117947 ?auto_117944 ) ) ( not ( = ?auto_117947 ?auto_117943 ) ) ( not ( = ?auto_117940 ?auto_117947 ) ) ( not ( = ?auto_117941 ?auto_117947 ) ) ( not ( = ?auto_117942 ?auto_117947 ) ) ( ON ?auto_117940 ?auto_117946 ) ( not ( = ?auto_117940 ?auto_117946 ) ) ( not ( = ?auto_117941 ?auto_117946 ) ) ( not ( = ?auto_117942 ?auto_117946 ) ) ( not ( = ?auto_117943 ?auto_117946 ) ) ( not ( = ?auto_117944 ?auto_117946 ) ) ( not ( = ?auto_117945 ?auto_117946 ) ) ( not ( = ?auto_117947 ?auto_117946 ) ) ( ON ?auto_117941 ?auto_117940 ) ( ON-TABLE ?auto_117946 ) ( ON ?auto_117942 ?auto_117941 ) ( ON ?auto_117943 ?auto_117942 ) ( ON ?auto_117944 ?auto_117943 ) ( ON ?auto_117945 ?auto_117944 ) ( CLEAR ?auto_117945 ) ( HOLDING ?auto_117947 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_117947 )
      ( MAKE-5PILE ?auto_117940 ?auto_117941 ?auto_117942 ?auto_117943 ?auto_117944 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117948 - BLOCK
      ?auto_117949 - BLOCK
      ?auto_117950 - BLOCK
      ?auto_117951 - BLOCK
      ?auto_117952 - BLOCK
    )
    :vars
    (
      ?auto_117955 - BLOCK
      ?auto_117953 - BLOCK
      ?auto_117954 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117948 ?auto_117949 ) ) ( not ( = ?auto_117948 ?auto_117950 ) ) ( not ( = ?auto_117948 ?auto_117951 ) ) ( not ( = ?auto_117948 ?auto_117952 ) ) ( not ( = ?auto_117949 ?auto_117950 ) ) ( not ( = ?auto_117949 ?auto_117951 ) ) ( not ( = ?auto_117949 ?auto_117952 ) ) ( not ( = ?auto_117950 ?auto_117951 ) ) ( not ( = ?auto_117950 ?auto_117952 ) ) ( not ( = ?auto_117951 ?auto_117952 ) ) ( not ( = ?auto_117948 ?auto_117955 ) ) ( not ( = ?auto_117949 ?auto_117955 ) ) ( not ( = ?auto_117950 ?auto_117955 ) ) ( not ( = ?auto_117951 ?auto_117955 ) ) ( not ( = ?auto_117952 ?auto_117955 ) ) ( not ( = ?auto_117953 ?auto_117955 ) ) ( not ( = ?auto_117953 ?auto_117952 ) ) ( not ( = ?auto_117953 ?auto_117951 ) ) ( not ( = ?auto_117948 ?auto_117953 ) ) ( not ( = ?auto_117949 ?auto_117953 ) ) ( not ( = ?auto_117950 ?auto_117953 ) ) ( ON ?auto_117948 ?auto_117954 ) ( not ( = ?auto_117948 ?auto_117954 ) ) ( not ( = ?auto_117949 ?auto_117954 ) ) ( not ( = ?auto_117950 ?auto_117954 ) ) ( not ( = ?auto_117951 ?auto_117954 ) ) ( not ( = ?auto_117952 ?auto_117954 ) ) ( not ( = ?auto_117955 ?auto_117954 ) ) ( not ( = ?auto_117953 ?auto_117954 ) ) ( ON ?auto_117949 ?auto_117948 ) ( ON-TABLE ?auto_117954 ) ( ON ?auto_117950 ?auto_117949 ) ( ON ?auto_117951 ?auto_117950 ) ( ON ?auto_117952 ?auto_117951 ) ( ON ?auto_117955 ?auto_117952 ) ( ON ?auto_117953 ?auto_117955 ) ( CLEAR ?auto_117953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_117954 ?auto_117948 ?auto_117949 ?auto_117950 ?auto_117951 ?auto_117952 ?auto_117955 )
      ( MAKE-5PILE ?auto_117948 ?auto_117949 ?auto_117950 ?auto_117951 ?auto_117952 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_117957 - BLOCK
    )
    :vars
    (
      ?auto_117958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117958 ?auto_117957 ) ( CLEAR ?auto_117958 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_117957 ) ( not ( = ?auto_117957 ?auto_117958 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_117958 ?auto_117957 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_117959 - BLOCK
    )
    :vars
    (
      ?auto_117960 - BLOCK
      ?auto_117961 - BLOCK
      ?auto_117962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117960 ?auto_117959 ) ( CLEAR ?auto_117960 ) ( ON-TABLE ?auto_117959 ) ( not ( = ?auto_117959 ?auto_117960 ) ) ( HOLDING ?auto_117961 ) ( CLEAR ?auto_117962 ) ( not ( = ?auto_117959 ?auto_117961 ) ) ( not ( = ?auto_117959 ?auto_117962 ) ) ( not ( = ?auto_117960 ?auto_117961 ) ) ( not ( = ?auto_117960 ?auto_117962 ) ) ( not ( = ?auto_117961 ?auto_117962 ) ) )
    :subtasks
    ( ( !STACK ?auto_117961 ?auto_117962 )
      ( MAKE-1PILE ?auto_117959 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_117963 - BLOCK
    )
    :vars
    (
      ?auto_117965 - BLOCK
      ?auto_117966 - BLOCK
      ?auto_117964 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117965 ?auto_117963 ) ( ON-TABLE ?auto_117963 ) ( not ( = ?auto_117963 ?auto_117965 ) ) ( CLEAR ?auto_117966 ) ( not ( = ?auto_117963 ?auto_117964 ) ) ( not ( = ?auto_117963 ?auto_117966 ) ) ( not ( = ?auto_117965 ?auto_117964 ) ) ( not ( = ?auto_117965 ?auto_117966 ) ) ( not ( = ?auto_117964 ?auto_117966 ) ) ( ON ?auto_117964 ?auto_117965 ) ( CLEAR ?auto_117964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_117963 ?auto_117965 )
      ( MAKE-1PILE ?auto_117963 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_117967 - BLOCK
    )
    :vars
    (
      ?auto_117968 - BLOCK
      ?auto_117969 - BLOCK
      ?auto_117970 - BLOCK
      ?auto_117971 - BLOCK
      ?auto_117972 - BLOCK
      ?auto_117973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117968 ?auto_117967 ) ( ON-TABLE ?auto_117967 ) ( not ( = ?auto_117967 ?auto_117968 ) ) ( not ( = ?auto_117967 ?auto_117969 ) ) ( not ( = ?auto_117967 ?auto_117970 ) ) ( not ( = ?auto_117968 ?auto_117969 ) ) ( not ( = ?auto_117968 ?auto_117970 ) ) ( not ( = ?auto_117969 ?auto_117970 ) ) ( ON ?auto_117969 ?auto_117968 ) ( CLEAR ?auto_117969 ) ( HOLDING ?auto_117970 ) ( CLEAR ?auto_117971 ) ( ON-TABLE ?auto_117972 ) ( ON ?auto_117973 ?auto_117972 ) ( ON ?auto_117971 ?auto_117973 ) ( not ( = ?auto_117972 ?auto_117973 ) ) ( not ( = ?auto_117972 ?auto_117971 ) ) ( not ( = ?auto_117972 ?auto_117970 ) ) ( not ( = ?auto_117973 ?auto_117971 ) ) ( not ( = ?auto_117973 ?auto_117970 ) ) ( not ( = ?auto_117971 ?auto_117970 ) ) ( not ( = ?auto_117967 ?auto_117971 ) ) ( not ( = ?auto_117967 ?auto_117972 ) ) ( not ( = ?auto_117967 ?auto_117973 ) ) ( not ( = ?auto_117968 ?auto_117971 ) ) ( not ( = ?auto_117968 ?auto_117972 ) ) ( not ( = ?auto_117968 ?auto_117973 ) ) ( not ( = ?auto_117969 ?auto_117971 ) ) ( not ( = ?auto_117969 ?auto_117972 ) ) ( not ( = ?auto_117969 ?auto_117973 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_117972 ?auto_117973 ?auto_117971 ?auto_117970 )
      ( MAKE-1PILE ?auto_117967 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_117974 - BLOCK
    )
    :vars
    (
      ?auto_117976 - BLOCK
      ?auto_117980 - BLOCK
      ?auto_117975 - BLOCK
      ?auto_117977 - BLOCK
      ?auto_117978 - BLOCK
      ?auto_117979 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117976 ?auto_117974 ) ( ON-TABLE ?auto_117974 ) ( not ( = ?auto_117974 ?auto_117976 ) ) ( not ( = ?auto_117974 ?auto_117980 ) ) ( not ( = ?auto_117974 ?auto_117975 ) ) ( not ( = ?auto_117976 ?auto_117980 ) ) ( not ( = ?auto_117976 ?auto_117975 ) ) ( not ( = ?auto_117980 ?auto_117975 ) ) ( ON ?auto_117980 ?auto_117976 ) ( CLEAR ?auto_117977 ) ( ON-TABLE ?auto_117978 ) ( ON ?auto_117979 ?auto_117978 ) ( ON ?auto_117977 ?auto_117979 ) ( not ( = ?auto_117978 ?auto_117979 ) ) ( not ( = ?auto_117978 ?auto_117977 ) ) ( not ( = ?auto_117978 ?auto_117975 ) ) ( not ( = ?auto_117979 ?auto_117977 ) ) ( not ( = ?auto_117979 ?auto_117975 ) ) ( not ( = ?auto_117977 ?auto_117975 ) ) ( not ( = ?auto_117974 ?auto_117977 ) ) ( not ( = ?auto_117974 ?auto_117978 ) ) ( not ( = ?auto_117974 ?auto_117979 ) ) ( not ( = ?auto_117976 ?auto_117977 ) ) ( not ( = ?auto_117976 ?auto_117978 ) ) ( not ( = ?auto_117976 ?auto_117979 ) ) ( not ( = ?auto_117980 ?auto_117977 ) ) ( not ( = ?auto_117980 ?auto_117978 ) ) ( not ( = ?auto_117980 ?auto_117979 ) ) ( ON ?auto_117975 ?auto_117980 ) ( CLEAR ?auto_117975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_117974 ?auto_117976 ?auto_117980 )
      ( MAKE-1PILE ?auto_117974 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_117981 - BLOCK
    )
    :vars
    (
      ?auto_117985 - BLOCK
      ?auto_117982 - BLOCK
      ?auto_117987 - BLOCK
      ?auto_117986 - BLOCK
      ?auto_117983 - BLOCK
      ?auto_117984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117985 ?auto_117981 ) ( ON-TABLE ?auto_117981 ) ( not ( = ?auto_117981 ?auto_117985 ) ) ( not ( = ?auto_117981 ?auto_117982 ) ) ( not ( = ?auto_117981 ?auto_117987 ) ) ( not ( = ?auto_117985 ?auto_117982 ) ) ( not ( = ?auto_117985 ?auto_117987 ) ) ( not ( = ?auto_117982 ?auto_117987 ) ) ( ON ?auto_117982 ?auto_117985 ) ( ON-TABLE ?auto_117986 ) ( ON ?auto_117983 ?auto_117986 ) ( not ( = ?auto_117986 ?auto_117983 ) ) ( not ( = ?auto_117986 ?auto_117984 ) ) ( not ( = ?auto_117986 ?auto_117987 ) ) ( not ( = ?auto_117983 ?auto_117984 ) ) ( not ( = ?auto_117983 ?auto_117987 ) ) ( not ( = ?auto_117984 ?auto_117987 ) ) ( not ( = ?auto_117981 ?auto_117984 ) ) ( not ( = ?auto_117981 ?auto_117986 ) ) ( not ( = ?auto_117981 ?auto_117983 ) ) ( not ( = ?auto_117985 ?auto_117984 ) ) ( not ( = ?auto_117985 ?auto_117986 ) ) ( not ( = ?auto_117985 ?auto_117983 ) ) ( not ( = ?auto_117982 ?auto_117984 ) ) ( not ( = ?auto_117982 ?auto_117986 ) ) ( not ( = ?auto_117982 ?auto_117983 ) ) ( ON ?auto_117987 ?auto_117982 ) ( CLEAR ?auto_117987 ) ( HOLDING ?auto_117984 ) ( CLEAR ?auto_117983 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_117986 ?auto_117983 ?auto_117984 )
      ( MAKE-1PILE ?auto_117981 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_117988 - BLOCK
    )
    :vars
    (
      ?auto_117992 - BLOCK
      ?auto_117990 - BLOCK
      ?auto_117993 - BLOCK
      ?auto_117994 - BLOCK
      ?auto_117991 - BLOCK
      ?auto_117989 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117992 ?auto_117988 ) ( ON-TABLE ?auto_117988 ) ( not ( = ?auto_117988 ?auto_117992 ) ) ( not ( = ?auto_117988 ?auto_117990 ) ) ( not ( = ?auto_117988 ?auto_117993 ) ) ( not ( = ?auto_117992 ?auto_117990 ) ) ( not ( = ?auto_117992 ?auto_117993 ) ) ( not ( = ?auto_117990 ?auto_117993 ) ) ( ON ?auto_117990 ?auto_117992 ) ( ON-TABLE ?auto_117994 ) ( ON ?auto_117991 ?auto_117994 ) ( not ( = ?auto_117994 ?auto_117991 ) ) ( not ( = ?auto_117994 ?auto_117989 ) ) ( not ( = ?auto_117994 ?auto_117993 ) ) ( not ( = ?auto_117991 ?auto_117989 ) ) ( not ( = ?auto_117991 ?auto_117993 ) ) ( not ( = ?auto_117989 ?auto_117993 ) ) ( not ( = ?auto_117988 ?auto_117989 ) ) ( not ( = ?auto_117988 ?auto_117994 ) ) ( not ( = ?auto_117988 ?auto_117991 ) ) ( not ( = ?auto_117992 ?auto_117989 ) ) ( not ( = ?auto_117992 ?auto_117994 ) ) ( not ( = ?auto_117992 ?auto_117991 ) ) ( not ( = ?auto_117990 ?auto_117989 ) ) ( not ( = ?auto_117990 ?auto_117994 ) ) ( not ( = ?auto_117990 ?auto_117991 ) ) ( ON ?auto_117993 ?auto_117990 ) ( CLEAR ?auto_117991 ) ( ON ?auto_117989 ?auto_117993 ) ( CLEAR ?auto_117989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_117988 ?auto_117992 ?auto_117990 ?auto_117993 )
      ( MAKE-1PILE ?auto_117988 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_117995 - BLOCK
    )
    :vars
    (
      ?auto_117996 - BLOCK
      ?auto_118001 - BLOCK
      ?auto_117998 - BLOCK
      ?auto_117999 - BLOCK
      ?auto_117997 - BLOCK
      ?auto_118000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117996 ?auto_117995 ) ( ON-TABLE ?auto_117995 ) ( not ( = ?auto_117995 ?auto_117996 ) ) ( not ( = ?auto_117995 ?auto_118001 ) ) ( not ( = ?auto_117995 ?auto_117998 ) ) ( not ( = ?auto_117996 ?auto_118001 ) ) ( not ( = ?auto_117996 ?auto_117998 ) ) ( not ( = ?auto_118001 ?auto_117998 ) ) ( ON ?auto_118001 ?auto_117996 ) ( ON-TABLE ?auto_117999 ) ( not ( = ?auto_117999 ?auto_117997 ) ) ( not ( = ?auto_117999 ?auto_118000 ) ) ( not ( = ?auto_117999 ?auto_117998 ) ) ( not ( = ?auto_117997 ?auto_118000 ) ) ( not ( = ?auto_117997 ?auto_117998 ) ) ( not ( = ?auto_118000 ?auto_117998 ) ) ( not ( = ?auto_117995 ?auto_118000 ) ) ( not ( = ?auto_117995 ?auto_117999 ) ) ( not ( = ?auto_117995 ?auto_117997 ) ) ( not ( = ?auto_117996 ?auto_118000 ) ) ( not ( = ?auto_117996 ?auto_117999 ) ) ( not ( = ?auto_117996 ?auto_117997 ) ) ( not ( = ?auto_118001 ?auto_118000 ) ) ( not ( = ?auto_118001 ?auto_117999 ) ) ( not ( = ?auto_118001 ?auto_117997 ) ) ( ON ?auto_117998 ?auto_118001 ) ( ON ?auto_118000 ?auto_117998 ) ( CLEAR ?auto_118000 ) ( HOLDING ?auto_117997 ) ( CLEAR ?auto_117999 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_117999 ?auto_117997 )
      ( MAKE-1PILE ?auto_117995 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_118002 - BLOCK
    )
    :vars
    (
      ?auto_118007 - BLOCK
      ?auto_118006 - BLOCK
      ?auto_118003 - BLOCK
      ?auto_118005 - BLOCK
      ?auto_118004 - BLOCK
      ?auto_118008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118007 ?auto_118002 ) ( ON-TABLE ?auto_118002 ) ( not ( = ?auto_118002 ?auto_118007 ) ) ( not ( = ?auto_118002 ?auto_118006 ) ) ( not ( = ?auto_118002 ?auto_118003 ) ) ( not ( = ?auto_118007 ?auto_118006 ) ) ( not ( = ?auto_118007 ?auto_118003 ) ) ( not ( = ?auto_118006 ?auto_118003 ) ) ( ON ?auto_118006 ?auto_118007 ) ( ON-TABLE ?auto_118005 ) ( not ( = ?auto_118005 ?auto_118004 ) ) ( not ( = ?auto_118005 ?auto_118008 ) ) ( not ( = ?auto_118005 ?auto_118003 ) ) ( not ( = ?auto_118004 ?auto_118008 ) ) ( not ( = ?auto_118004 ?auto_118003 ) ) ( not ( = ?auto_118008 ?auto_118003 ) ) ( not ( = ?auto_118002 ?auto_118008 ) ) ( not ( = ?auto_118002 ?auto_118005 ) ) ( not ( = ?auto_118002 ?auto_118004 ) ) ( not ( = ?auto_118007 ?auto_118008 ) ) ( not ( = ?auto_118007 ?auto_118005 ) ) ( not ( = ?auto_118007 ?auto_118004 ) ) ( not ( = ?auto_118006 ?auto_118008 ) ) ( not ( = ?auto_118006 ?auto_118005 ) ) ( not ( = ?auto_118006 ?auto_118004 ) ) ( ON ?auto_118003 ?auto_118006 ) ( ON ?auto_118008 ?auto_118003 ) ( CLEAR ?auto_118005 ) ( ON ?auto_118004 ?auto_118008 ) ( CLEAR ?auto_118004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_118002 ?auto_118007 ?auto_118006 ?auto_118003 ?auto_118008 )
      ( MAKE-1PILE ?auto_118002 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_118009 - BLOCK
    )
    :vars
    (
      ?auto_118011 - BLOCK
      ?auto_118010 - BLOCK
      ?auto_118014 - BLOCK
      ?auto_118015 - BLOCK
      ?auto_118012 - BLOCK
      ?auto_118013 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118011 ?auto_118009 ) ( ON-TABLE ?auto_118009 ) ( not ( = ?auto_118009 ?auto_118011 ) ) ( not ( = ?auto_118009 ?auto_118010 ) ) ( not ( = ?auto_118009 ?auto_118014 ) ) ( not ( = ?auto_118011 ?auto_118010 ) ) ( not ( = ?auto_118011 ?auto_118014 ) ) ( not ( = ?auto_118010 ?auto_118014 ) ) ( ON ?auto_118010 ?auto_118011 ) ( not ( = ?auto_118015 ?auto_118012 ) ) ( not ( = ?auto_118015 ?auto_118013 ) ) ( not ( = ?auto_118015 ?auto_118014 ) ) ( not ( = ?auto_118012 ?auto_118013 ) ) ( not ( = ?auto_118012 ?auto_118014 ) ) ( not ( = ?auto_118013 ?auto_118014 ) ) ( not ( = ?auto_118009 ?auto_118013 ) ) ( not ( = ?auto_118009 ?auto_118015 ) ) ( not ( = ?auto_118009 ?auto_118012 ) ) ( not ( = ?auto_118011 ?auto_118013 ) ) ( not ( = ?auto_118011 ?auto_118015 ) ) ( not ( = ?auto_118011 ?auto_118012 ) ) ( not ( = ?auto_118010 ?auto_118013 ) ) ( not ( = ?auto_118010 ?auto_118015 ) ) ( not ( = ?auto_118010 ?auto_118012 ) ) ( ON ?auto_118014 ?auto_118010 ) ( ON ?auto_118013 ?auto_118014 ) ( ON ?auto_118012 ?auto_118013 ) ( CLEAR ?auto_118012 ) ( HOLDING ?auto_118015 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_118015 )
      ( MAKE-1PILE ?auto_118009 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_118016 - BLOCK
    )
    :vars
    (
      ?auto_118019 - BLOCK
      ?auto_118022 - BLOCK
      ?auto_118018 - BLOCK
      ?auto_118017 - BLOCK
      ?auto_118020 - BLOCK
      ?auto_118021 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118019 ?auto_118016 ) ( ON-TABLE ?auto_118016 ) ( not ( = ?auto_118016 ?auto_118019 ) ) ( not ( = ?auto_118016 ?auto_118022 ) ) ( not ( = ?auto_118016 ?auto_118018 ) ) ( not ( = ?auto_118019 ?auto_118022 ) ) ( not ( = ?auto_118019 ?auto_118018 ) ) ( not ( = ?auto_118022 ?auto_118018 ) ) ( ON ?auto_118022 ?auto_118019 ) ( not ( = ?auto_118017 ?auto_118020 ) ) ( not ( = ?auto_118017 ?auto_118021 ) ) ( not ( = ?auto_118017 ?auto_118018 ) ) ( not ( = ?auto_118020 ?auto_118021 ) ) ( not ( = ?auto_118020 ?auto_118018 ) ) ( not ( = ?auto_118021 ?auto_118018 ) ) ( not ( = ?auto_118016 ?auto_118021 ) ) ( not ( = ?auto_118016 ?auto_118017 ) ) ( not ( = ?auto_118016 ?auto_118020 ) ) ( not ( = ?auto_118019 ?auto_118021 ) ) ( not ( = ?auto_118019 ?auto_118017 ) ) ( not ( = ?auto_118019 ?auto_118020 ) ) ( not ( = ?auto_118022 ?auto_118021 ) ) ( not ( = ?auto_118022 ?auto_118017 ) ) ( not ( = ?auto_118022 ?auto_118020 ) ) ( ON ?auto_118018 ?auto_118022 ) ( ON ?auto_118021 ?auto_118018 ) ( ON ?auto_118020 ?auto_118021 ) ( ON ?auto_118017 ?auto_118020 ) ( CLEAR ?auto_118017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_118016 ?auto_118019 ?auto_118022 ?auto_118018 ?auto_118021 ?auto_118020 )
      ( MAKE-1PILE ?auto_118016 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_118023 - BLOCK
    )
    :vars
    (
      ?auto_118029 - BLOCK
      ?auto_118028 - BLOCK
      ?auto_118027 - BLOCK
      ?auto_118026 - BLOCK
      ?auto_118024 - BLOCK
      ?auto_118025 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118029 ?auto_118023 ) ( ON-TABLE ?auto_118023 ) ( not ( = ?auto_118023 ?auto_118029 ) ) ( not ( = ?auto_118023 ?auto_118028 ) ) ( not ( = ?auto_118023 ?auto_118027 ) ) ( not ( = ?auto_118029 ?auto_118028 ) ) ( not ( = ?auto_118029 ?auto_118027 ) ) ( not ( = ?auto_118028 ?auto_118027 ) ) ( ON ?auto_118028 ?auto_118029 ) ( not ( = ?auto_118026 ?auto_118024 ) ) ( not ( = ?auto_118026 ?auto_118025 ) ) ( not ( = ?auto_118026 ?auto_118027 ) ) ( not ( = ?auto_118024 ?auto_118025 ) ) ( not ( = ?auto_118024 ?auto_118027 ) ) ( not ( = ?auto_118025 ?auto_118027 ) ) ( not ( = ?auto_118023 ?auto_118025 ) ) ( not ( = ?auto_118023 ?auto_118026 ) ) ( not ( = ?auto_118023 ?auto_118024 ) ) ( not ( = ?auto_118029 ?auto_118025 ) ) ( not ( = ?auto_118029 ?auto_118026 ) ) ( not ( = ?auto_118029 ?auto_118024 ) ) ( not ( = ?auto_118028 ?auto_118025 ) ) ( not ( = ?auto_118028 ?auto_118026 ) ) ( not ( = ?auto_118028 ?auto_118024 ) ) ( ON ?auto_118027 ?auto_118028 ) ( ON ?auto_118025 ?auto_118027 ) ( ON ?auto_118024 ?auto_118025 ) ( HOLDING ?auto_118026 ) ( CLEAR ?auto_118024 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_118023 ?auto_118029 ?auto_118028 ?auto_118027 ?auto_118025 ?auto_118024 ?auto_118026 )
      ( MAKE-1PILE ?auto_118023 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_118030 - BLOCK
    )
    :vars
    (
      ?auto_118031 - BLOCK
      ?auto_118035 - BLOCK
      ?auto_118032 - BLOCK
      ?auto_118034 - BLOCK
      ?auto_118036 - BLOCK
      ?auto_118033 - BLOCK
      ?auto_118037 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118031 ?auto_118030 ) ( ON-TABLE ?auto_118030 ) ( not ( = ?auto_118030 ?auto_118031 ) ) ( not ( = ?auto_118030 ?auto_118035 ) ) ( not ( = ?auto_118030 ?auto_118032 ) ) ( not ( = ?auto_118031 ?auto_118035 ) ) ( not ( = ?auto_118031 ?auto_118032 ) ) ( not ( = ?auto_118035 ?auto_118032 ) ) ( ON ?auto_118035 ?auto_118031 ) ( not ( = ?auto_118034 ?auto_118036 ) ) ( not ( = ?auto_118034 ?auto_118033 ) ) ( not ( = ?auto_118034 ?auto_118032 ) ) ( not ( = ?auto_118036 ?auto_118033 ) ) ( not ( = ?auto_118036 ?auto_118032 ) ) ( not ( = ?auto_118033 ?auto_118032 ) ) ( not ( = ?auto_118030 ?auto_118033 ) ) ( not ( = ?auto_118030 ?auto_118034 ) ) ( not ( = ?auto_118030 ?auto_118036 ) ) ( not ( = ?auto_118031 ?auto_118033 ) ) ( not ( = ?auto_118031 ?auto_118034 ) ) ( not ( = ?auto_118031 ?auto_118036 ) ) ( not ( = ?auto_118035 ?auto_118033 ) ) ( not ( = ?auto_118035 ?auto_118034 ) ) ( not ( = ?auto_118035 ?auto_118036 ) ) ( ON ?auto_118032 ?auto_118035 ) ( ON ?auto_118033 ?auto_118032 ) ( ON ?auto_118036 ?auto_118033 ) ( CLEAR ?auto_118036 ) ( ON ?auto_118034 ?auto_118037 ) ( CLEAR ?auto_118034 ) ( HAND-EMPTY ) ( not ( = ?auto_118030 ?auto_118037 ) ) ( not ( = ?auto_118031 ?auto_118037 ) ) ( not ( = ?auto_118035 ?auto_118037 ) ) ( not ( = ?auto_118032 ?auto_118037 ) ) ( not ( = ?auto_118034 ?auto_118037 ) ) ( not ( = ?auto_118036 ?auto_118037 ) ) ( not ( = ?auto_118033 ?auto_118037 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_118034 ?auto_118037 )
      ( MAKE-1PILE ?auto_118030 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_118038 - BLOCK
    )
    :vars
    (
      ?auto_118043 - BLOCK
      ?auto_118040 - BLOCK
      ?auto_118044 - BLOCK
      ?auto_118041 - BLOCK
      ?auto_118042 - BLOCK
      ?auto_118039 - BLOCK
      ?auto_118045 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118043 ?auto_118038 ) ( ON-TABLE ?auto_118038 ) ( not ( = ?auto_118038 ?auto_118043 ) ) ( not ( = ?auto_118038 ?auto_118040 ) ) ( not ( = ?auto_118038 ?auto_118044 ) ) ( not ( = ?auto_118043 ?auto_118040 ) ) ( not ( = ?auto_118043 ?auto_118044 ) ) ( not ( = ?auto_118040 ?auto_118044 ) ) ( ON ?auto_118040 ?auto_118043 ) ( not ( = ?auto_118041 ?auto_118042 ) ) ( not ( = ?auto_118041 ?auto_118039 ) ) ( not ( = ?auto_118041 ?auto_118044 ) ) ( not ( = ?auto_118042 ?auto_118039 ) ) ( not ( = ?auto_118042 ?auto_118044 ) ) ( not ( = ?auto_118039 ?auto_118044 ) ) ( not ( = ?auto_118038 ?auto_118039 ) ) ( not ( = ?auto_118038 ?auto_118041 ) ) ( not ( = ?auto_118038 ?auto_118042 ) ) ( not ( = ?auto_118043 ?auto_118039 ) ) ( not ( = ?auto_118043 ?auto_118041 ) ) ( not ( = ?auto_118043 ?auto_118042 ) ) ( not ( = ?auto_118040 ?auto_118039 ) ) ( not ( = ?auto_118040 ?auto_118041 ) ) ( not ( = ?auto_118040 ?auto_118042 ) ) ( ON ?auto_118044 ?auto_118040 ) ( ON ?auto_118039 ?auto_118044 ) ( ON ?auto_118041 ?auto_118045 ) ( CLEAR ?auto_118041 ) ( not ( = ?auto_118038 ?auto_118045 ) ) ( not ( = ?auto_118043 ?auto_118045 ) ) ( not ( = ?auto_118040 ?auto_118045 ) ) ( not ( = ?auto_118044 ?auto_118045 ) ) ( not ( = ?auto_118041 ?auto_118045 ) ) ( not ( = ?auto_118042 ?auto_118045 ) ) ( not ( = ?auto_118039 ?auto_118045 ) ) ( HOLDING ?auto_118042 ) ( CLEAR ?auto_118039 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_118038 ?auto_118043 ?auto_118040 ?auto_118044 ?auto_118039 ?auto_118042 )
      ( MAKE-1PILE ?auto_118038 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_118046 - BLOCK
    )
    :vars
    (
      ?auto_118053 - BLOCK
      ?auto_118049 - BLOCK
      ?auto_118048 - BLOCK
      ?auto_118051 - BLOCK
      ?auto_118052 - BLOCK
      ?auto_118050 - BLOCK
      ?auto_118047 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118053 ?auto_118046 ) ( ON-TABLE ?auto_118046 ) ( not ( = ?auto_118046 ?auto_118053 ) ) ( not ( = ?auto_118046 ?auto_118049 ) ) ( not ( = ?auto_118046 ?auto_118048 ) ) ( not ( = ?auto_118053 ?auto_118049 ) ) ( not ( = ?auto_118053 ?auto_118048 ) ) ( not ( = ?auto_118049 ?auto_118048 ) ) ( ON ?auto_118049 ?auto_118053 ) ( not ( = ?auto_118051 ?auto_118052 ) ) ( not ( = ?auto_118051 ?auto_118050 ) ) ( not ( = ?auto_118051 ?auto_118048 ) ) ( not ( = ?auto_118052 ?auto_118050 ) ) ( not ( = ?auto_118052 ?auto_118048 ) ) ( not ( = ?auto_118050 ?auto_118048 ) ) ( not ( = ?auto_118046 ?auto_118050 ) ) ( not ( = ?auto_118046 ?auto_118051 ) ) ( not ( = ?auto_118046 ?auto_118052 ) ) ( not ( = ?auto_118053 ?auto_118050 ) ) ( not ( = ?auto_118053 ?auto_118051 ) ) ( not ( = ?auto_118053 ?auto_118052 ) ) ( not ( = ?auto_118049 ?auto_118050 ) ) ( not ( = ?auto_118049 ?auto_118051 ) ) ( not ( = ?auto_118049 ?auto_118052 ) ) ( ON ?auto_118048 ?auto_118049 ) ( ON ?auto_118050 ?auto_118048 ) ( ON ?auto_118051 ?auto_118047 ) ( not ( = ?auto_118046 ?auto_118047 ) ) ( not ( = ?auto_118053 ?auto_118047 ) ) ( not ( = ?auto_118049 ?auto_118047 ) ) ( not ( = ?auto_118048 ?auto_118047 ) ) ( not ( = ?auto_118051 ?auto_118047 ) ) ( not ( = ?auto_118052 ?auto_118047 ) ) ( not ( = ?auto_118050 ?auto_118047 ) ) ( CLEAR ?auto_118050 ) ( ON ?auto_118052 ?auto_118051 ) ( CLEAR ?auto_118052 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_118047 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_118047 ?auto_118051 )
      ( MAKE-1PILE ?auto_118046 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_118054 - BLOCK
    )
    :vars
    (
      ?auto_118059 - BLOCK
      ?auto_118058 - BLOCK
      ?auto_118055 - BLOCK
      ?auto_118056 - BLOCK
      ?auto_118061 - BLOCK
      ?auto_118057 - BLOCK
      ?auto_118060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118059 ?auto_118054 ) ( ON-TABLE ?auto_118054 ) ( not ( = ?auto_118054 ?auto_118059 ) ) ( not ( = ?auto_118054 ?auto_118058 ) ) ( not ( = ?auto_118054 ?auto_118055 ) ) ( not ( = ?auto_118059 ?auto_118058 ) ) ( not ( = ?auto_118059 ?auto_118055 ) ) ( not ( = ?auto_118058 ?auto_118055 ) ) ( ON ?auto_118058 ?auto_118059 ) ( not ( = ?auto_118056 ?auto_118061 ) ) ( not ( = ?auto_118056 ?auto_118057 ) ) ( not ( = ?auto_118056 ?auto_118055 ) ) ( not ( = ?auto_118061 ?auto_118057 ) ) ( not ( = ?auto_118061 ?auto_118055 ) ) ( not ( = ?auto_118057 ?auto_118055 ) ) ( not ( = ?auto_118054 ?auto_118057 ) ) ( not ( = ?auto_118054 ?auto_118056 ) ) ( not ( = ?auto_118054 ?auto_118061 ) ) ( not ( = ?auto_118059 ?auto_118057 ) ) ( not ( = ?auto_118059 ?auto_118056 ) ) ( not ( = ?auto_118059 ?auto_118061 ) ) ( not ( = ?auto_118058 ?auto_118057 ) ) ( not ( = ?auto_118058 ?auto_118056 ) ) ( not ( = ?auto_118058 ?auto_118061 ) ) ( ON ?auto_118055 ?auto_118058 ) ( ON ?auto_118056 ?auto_118060 ) ( not ( = ?auto_118054 ?auto_118060 ) ) ( not ( = ?auto_118059 ?auto_118060 ) ) ( not ( = ?auto_118058 ?auto_118060 ) ) ( not ( = ?auto_118055 ?auto_118060 ) ) ( not ( = ?auto_118056 ?auto_118060 ) ) ( not ( = ?auto_118061 ?auto_118060 ) ) ( not ( = ?auto_118057 ?auto_118060 ) ) ( ON ?auto_118061 ?auto_118056 ) ( CLEAR ?auto_118061 ) ( ON-TABLE ?auto_118060 ) ( HOLDING ?auto_118057 ) ( CLEAR ?auto_118055 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_118054 ?auto_118059 ?auto_118058 ?auto_118055 ?auto_118057 )
      ( MAKE-1PILE ?auto_118054 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_118062 - BLOCK
    )
    :vars
    (
      ?auto_118069 - BLOCK
      ?auto_118065 - BLOCK
      ?auto_118064 - BLOCK
      ?auto_118066 - BLOCK
      ?auto_118068 - BLOCK
      ?auto_118067 - BLOCK
      ?auto_118063 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118069 ?auto_118062 ) ( ON-TABLE ?auto_118062 ) ( not ( = ?auto_118062 ?auto_118069 ) ) ( not ( = ?auto_118062 ?auto_118065 ) ) ( not ( = ?auto_118062 ?auto_118064 ) ) ( not ( = ?auto_118069 ?auto_118065 ) ) ( not ( = ?auto_118069 ?auto_118064 ) ) ( not ( = ?auto_118065 ?auto_118064 ) ) ( ON ?auto_118065 ?auto_118069 ) ( not ( = ?auto_118066 ?auto_118068 ) ) ( not ( = ?auto_118066 ?auto_118067 ) ) ( not ( = ?auto_118066 ?auto_118064 ) ) ( not ( = ?auto_118068 ?auto_118067 ) ) ( not ( = ?auto_118068 ?auto_118064 ) ) ( not ( = ?auto_118067 ?auto_118064 ) ) ( not ( = ?auto_118062 ?auto_118067 ) ) ( not ( = ?auto_118062 ?auto_118066 ) ) ( not ( = ?auto_118062 ?auto_118068 ) ) ( not ( = ?auto_118069 ?auto_118067 ) ) ( not ( = ?auto_118069 ?auto_118066 ) ) ( not ( = ?auto_118069 ?auto_118068 ) ) ( not ( = ?auto_118065 ?auto_118067 ) ) ( not ( = ?auto_118065 ?auto_118066 ) ) ( not ( = ?auto_118065 ?auto_118068 ) ) ( ON ?auto_118064 ?auto_118065 ) ( ON ?auto_118066 ?auto_118063 ) ( not ( = ?auto_118062 ?auto_118063 ) ) ( not ( = ?auto_118069 ?auto_118063 ) ) ( not ( = ?auto_118065 ?auto_118063 ) ) ( not ( = ?auto_118064 ?auto_118063 ) ) ( not ( = ?auto_118066 ?auto_118063 ) ) ( not ( = ?auto_118068 ?auto_118063 ) ) ( not ( = ?auto_118067 ?auto_118063 ) ) ( ON ?auto_118068 ?auto_118066 ) ( ON-TABLE ?auto_118063 ) ( CLEAR ?auto_118064 ) ( ON ?auto_118067 ?auto_118068 ) ( CLEAR ?auto_118067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_118063 ?auto_118066 ?auto_118068 )
      ( MAKE-1PILE ?auto_118062 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_118070 - BLOCK
    )
    :vars
    (
      ?auto_118076 - BLOCK
      ?auto_118072 - BLOCK
      ?auto_118075 - BLOCK
      ?auto_118074 - BLOCK
      ?auto_118073 - BLOCK
      ?auto_118071 - BLOCK
      ?auto_118077 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118076 ?auto_118070 ) ( ON-TABLE ?auto_118070 ) ( not ( = ?auto_118070 ?auto_118076 ) ) ( not ( = ?auto_118070 ?auto_118072 ) ) ( not ( = ?auto_118070 ?auto_118075 ) ) ( not ( = ?auto_118076 ?auto_118072 ) ) ( not ( = ?auto_118076 ?auto_118075 ) ) ( not ( = ?auto_118072 ?auto_118075 ) ) ( ON ?auto_118072 ?auto_118076 ) ( not ( = ?auto_118074 ?auto_118073 ) ) ( not ( = ?auto_118074 ?auto_118071 ) ) ( not ( = ?auto_118074 ?auto_118075 ) ) ( not ( = ?auto_118073 ?auto_118071 ) ) ( not ( = ?auto_118073 ?auto_118075 ) ) ( not ( = ?auto_118071 ?auto_118075 ) ) ( not ( = ?auto_118070 ?auto_118071 ) ) ( not ( = ?auto_118070 ?auto_118074 ) ) ( not ( = ?auto_118070 ?auto_118073 ) ) ( not ( = ?auto_118076 ?auto_118071 ) ) ( not ( = ?auto_118076 ?auto_118074 ) ) ( not ( = ?auto_118076 ?auto_118073 ) ) ( not ( = ?auto_118072 ?auto_118071 ) ) ( not ( = ?auto_118072 ?auto_118074 ) ) ( not ( = ?auto_118072 ?auto_118073 ) ) ( ON ?auto_118074 ?auto_118077 ) ( not ( = ?auto_118070 ?auto_118077 ) ) ( not ( = ?auto_118076 ?auto_118077 ) ) ( not ( = ?auto_118072 ?auto_118077 ) ) ( not ( = ?auto_118075 ?auto_118077 ) ) ( not ( = ?auto_118074 ?auto_118077 ) ) ( not ( = ?auto_118073 ?auto_118077 ) ) ( not ( = ?auto_118071 ?auto_118077 ) ) ( ON ?auto_118073 ?auto_118074 ) ( ON-TABLE ?auto_118077 ) ( ON ?auto_118071 ?auto_118073 ) ( CLEAR ?auto_118071 ) ( HOLDING ?auto_118075 ) ( CLEAR ?auto_118072 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_118070 ?auto_118076 ?auto_118072 ?auto_118075 )
      ( MAKE-1PILE ?auto_118070 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_118078 - BLOCK
    )
    :vars
    (
      ?auto_118079 - BLOCK
      ?auto_118082 - BLOCK
      ?auto_118084 - BLOCK
      ?auto_118083 - BLOCK
      ?auto_118080 - BLOCK
      ?auto_118081 - BLOCK
      ?auto_118085 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118079 ?auto_118078 ) ( ON-TABLE ?auto_118078 ) ( not ( = ?auto_118078 ?auto_118079 ) ) ( not ( = ?auto_118078 ?auto_118082 ) ) ( not ( = ?auto_118078 ?auto_118084 ) ) ( not ( = ?auto_118079 ?auto_118082 ) ) ( not ( = ?auto_118079 ?auto_118084 ) ) ( not ( = ?auto_118082 ?auto_118084 ) ) ( ON ?auto_118082 ?auto_118079 ) ( not ( = ?auto_118083 ?auto_118080 ) ) ( not ( = ?auto_118083 ?auto_118081 ) ) ( not ( = ?auto_118083 ?auto_118084 ) ) ( not ( = ?auto_118080 ?auto_118081 ) ) ( not ( = ?auto_118080 ?auto_118084 ) ) ( not ( = ?auto_118081 ?auto_118084 ) ) ( not ( = ?auto_118078 ?auto_118081 ) ) ( not ( = ?auto_118078 ?auto_118083 ) ) ( not ( = ?auto_118078 ?auto_118080 ) ) ( not ( = ?auto_118079 ?auto_118081 ) ) ( not ( = ?auto_118079 ?auto_118083 ) ) ( not ( = ?auto_118079 ?auto_118080 ) ) ( not ( = ?auto_118082 ?auto_118081 ) ) ( not ( = ?auto_118082 ?auto_118083 ) ) ( not ( = ?auto_118082 ?auto_118080 ) ) ( ON ?auto_118083 ?auto_118085 ) ( not ( = ?auto_118078 ?auto_118085 ) ) ( not ( = ?auto_118079 ?auto_118085 ) ) ( not ( = ?auto_118082 ?auto_118085 ) ) ( not ( = ?auto_118084 ?auto_118085 ) ) ( not ( = ?auto_118083 ?auto_118085 ) ) ( not ( = ?auto_118080 ?auto_118085 ) ) ( not ( = ?auto_118081 ?auto_118085 ) ) ( ON ?auto_118080 ?auto_118083 ) ( ON-TABLE ?auto_118085 ) ( ON ?auto_118081 ?auto_118080 ) ( CLEAR ?auto_118082 ) ( ON ?auto_118084 ?auto_118081 ) ( CLEAR ?auto_118084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_118085 ?auto_118083 ?auto_118080 ?auto_118081 )
      ( MAKE-1PILE ?auto_118078 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_118086 - BLOCK
    )
    :vars
    (
      ?auto_118091 - BLOCK
      ?auto_118092 - BLOCK
      ?auto_118089 - BLOCK
      ?auto_118088 - BLOCK
      ?auto_118090 - BLOCK
      ?auto_118093 - BLOCK
      ?auto_118087 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118091 ?auto_118086 ) ( ON-TABLE ?auto_118086 ) ( not ( = ?auto_118086 ?auto_118091 ) ) ( not ( = ?auto_118086 ?auto_118092 ) ) ( not ( = ?auto_118086 ?auto_118089 ) ) ( not ( = ?auto_118091 ?auto_118092 ) ) ( not ( = ?auto_118091 ?auto_118089 ) ) ( not ( = ?auto_118092 ?auto_118089 ) ) ( not ( = ?auto_118088 ?auto_118090 ) ) ( not ( = ?auto_118088 ?auto_118093 ) ) ( not ( = ?auto_118088 ?auto_118089 ) ) ( not ( = ?auto_118090 ?auto_118093 ) ) ( not ( = ?auto_118090 ?auto_118089 ) ) ( not ( = ?auto_118093 ?auto_118089 ) ) ( not ( = ?auto_118086 ?auto_118093 ) ) ( not ( = ?auto_118086 ?auto_118088 ) ) ( not ( = ?auto_118086 ?auto_118090 ) ) ( not ( = ?auto_118091 ?auto_118093 ) ) ( not ( = ?auto_118091 ?auto_118088 ) ) ( not ( = ?auto_118091 ?auto_118090 ) ) ( not ( = ?auto_118092 ?auto_118093 ) ) ( not ( = ?auto_118092 ?auto_118088 ) ) ( not ( = ?auto_118092 ?auto_118090 ) ) ( ON ?auto_118088 ?auto_118087 ) ( not ( = ?auto_118086 ?auto_118087 ) ) ( not ( = ?auto_118091 ?auto_118087 ) ) ( not ( = ?auto_118092 ?auto_118087 ) ) ( not ( = ?auto_118089 ?auto_118087 ) ) ( not ( = ?auto_118088 ?auto_118087 ) ) ( not ( = ?auto_118090 ?auto_118087 ) ) ( not ( = ?auto_118093 ?auto_118087 ) ) ( ON ?auto_118090 ?auto_118088 ) ( ON-TABLE ?auto_118087 ) ( ON ?auto_118093 ?auto_118090 ) ( ON ?auto_118089 ?auto_118093 ) ( CLEAR ?auto_118089 ) ( HOLDING ?auto_118092 ) ( CLEAR ?auto_118091 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_118086 ?auto_118091 ?auto_118092 )
      ( MAKE-1PILE ?auto_118086 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_118094 - BLOCK
    )
    :vars
    (
      ?auto_118099 - BLOCK
      ?auto_118101 - BLOCK
      ?auto_118096 - BLOCK
      ?auto_118097 - BLOCK
      ?auto_118098 - BLOCK
      ?auto_118095 - BLOCK
      ?auto_118100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118099 ?auto_118094 ) ( ON-TABLE ?auto_118094 ) ( not ( = ?auto_118094 ?auto_118099 ) ) ( not ( = ?auto_118094 ?auto_118101 ) ) ( not ( = ?auto_118094 ?auto_118096 ) ) ( not ( = ?auto_118099 ?auto_118101 ) ) ( not ( = ?auto_118099 ?auto_118096 ) ) ( not ( = ?auto_118101 ?auto_118096 ) ) ( not ( = ?auto_118097 ?auto_118098 ) ) ( not ( = ?auto_118097 ?auto_118095 ) ) ( not ( = ?auto_118097 ?auto_118096 ) ) ( not ( = ?auto_118098 ?auto_118095 ) ) ( not ( = ?auto_118098 ?auto_118096 ) ) ( not ( = ?auto_118095 ?auto_118096 ) ) ( not ( = ?auto_118094 ?auto_118095 ) ) ( not ( = ?auto_118094 ?auto_118097 ) ) ( not ( = ?auto_118094 ?auto_118098 ) ) ( not ( = ?auto_118099 ?auto_118095 ) ) ( not ( = ?auto_118099 ?auto_118097 ) ) ( not ( = ?auto_118099 ?auto_118098 ) ) ( not ( = ?auto_118101 ?auto_118095 ) ) ( not ( = ?auto_118101 ?auto_118097 ) ) ( not ( = ?auto_118101 ?auto_118098 ) ) ( ON ?auto_118097 ?auto_118100 ) ( not ( = ?auto_118094 ?auto_118100 ) ) ( not ( = ?auto_118099 ?auto_118100 ) ) ( not ( = ?auto_118101 ?auto_118100 ) ) ( not ( = ?auto_118096 ?auto_118100 ) ) ( not ( = ?auto_118097 ?auto_118100 ) ) ( not ( = ?auto_118098 ?auto_118100 ) ) ( not ( = ?auto_118095 ?auto_118100 ) ) ( ON ?auto_118098 ?auto_118097 ) ( ON-TABLE ?auto_118100 ) ( ON ?auto_118095 ?auto_118098 ) ( ON ?auto_118096 ?auto_118095 ) ( CLEAR ?auto_118099 ) ( ON ?auto_118101 ?auto_118096 ) ( CLEAR ?auto_118101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_118100 ?auto_118097 ?auto_118098 ?auto_118095 ?auto_118096 )
      ( MAKE-1PILE ?auto_118094 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_118118 - BLOCK
    )
    :vars
    (
      ?auto_118120 - BLOCK
      ?auto_118124 - BLOCK
      ?auto_118119 - BLOCK
      ?auto_118121 - BLOCK
      ?auto_118123 - BLOCK
      ?auto_118122 - BLOCK
      ?auto_118125 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118118 ?auto_118120 ) ) ( not ( = ?auto_118118 ?auto_118124 ) ) ( not ( = ?auto_118118 ?auto_118119 ) ) ( not ( = ?auto_118120 ?auto_118124 ) ) ( not ( = ?auto_118120 ?auto_118119 ) ) ( not ( = ?auto_118124 ?auto_118119 ) ) ( not ( = ?auto_118121 ?auto_118123 ) ) ( not ( = ?auto_118121 ?auto_118122 ) ) ( not ( = ?auto_118121 ?auto_118119 ) ) ( not ( = ?auto_118123 ?auto_118122 ) ) ( not ( = ?auto_118123 ?auto_118119 ) ) ( not ( = ?auto_118122 ?auto_118119 ) ) ( not ( = ?auto_118118 ?auto_118122 ) ) ( not ( = ?auto_118118 ?auto_118121 ) ) ( not ( = ?auto_118118 ?auto_118123 ) ) ( not ( = ?auto_118120 ?auto_118122 ) ) ( not ( = ?auto_118120 ?auto_118121 ) ) ( not ( = ?auto_118120 ?auto_118123 ) ) ( not ( = ?auto_118124 ?auto_118122 ) ) ( not ( = ?auto_118124 ?auto_118121 ) ) ( not ( = ?auto_118124 ?auto_118123 ) ) ( ON ?auto_118121 ?auto_118125 ) ( not ( = ?auto_118118 ?auto_118125 ) ) ( not ( = ?auto_118120 ?auto_118125 ) ) ( not ( = ?auto_118124 ?auto_118125 ) ) ( not ( = ?auto_118119 ?auto_118125 ) ) ( not ( = ?auto_118121 ?auto_118125 ) ) ( not ( = ?auto_118123 ?auto_118125 ) ) ( not ( = ?auto_118122 ?auto_118125 ) ) ( ON ?auto_118123 ?auto_118121 ) ( ON-TABLE ?auto_118125 ) ( ON ?auto_118122 ?auto_118123 ) ( ON ?auto_118119 ?auto_118122 ) ( ON ?auto_118124 ?auto_118119 ) ( ON ?auto_118120 ?auto_118124 ) ( CLEAR ?auto_118120 ) ( HOLDING ?auto_118118 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_118118 ?auto_118120 )
      ( MAKE-1PILE ?auto_118118 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_118126 - BLOCK
    )
    :vars
    (
      ?auto_118132 - BLOCK
      ?auto_118133 - BLOCK
      ?auto_118130 - BLOCK
      ?auto_118128 - BLOCK
      ?auto_118129 - BLOCK
      ?auto_118131 - BLOCK
      ?auto_118127 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118126 ?auto_118132 ) ) ( not ( = ?auto_118126 ?auto_118133 ) ) ( not ( = ?auto_118126 ?auto_118130 ) ) ( not ( = ?auto_118132 ?auto_118133 ) ) ( not ( = ?auto_118132 ?auto_118130 ) ) ( not ( = ?auto_118133 ?auto_118130 ) ) ( not ( = ?auto_118128 ?auto_118129 ) ) ( not ( = ?auto_118128 ?auto_118131 ) ) ( not ( = ?auto_118128 ?auto_118130 ) ) ( not ( = ?auto_118129 ?auto_118131 ) ) ( not ( = ?auto_118129 ?auto_118130 ) ) ( not ( = ?auto_118131 ?auto_118130 ) ) ( not ( = ?auto_118126 ?auto_118131 ) ) ( not ( = ?auto_118126 ?auto_118128 ) ) ( not ( = ?auto_118126 ?auto_118129 ) ) ( not ( = ?auto_118132 ?auto_118131 ) ) ( not ( = ?auto_118132 ?auto_118128 ) ) ( not ( = ?auto_118132 ?auto_118129 ) ) ( not ( = ?auto_118133 ?auto_118131 ) ) ( not ( = ?auto_118133 ?auto_118128 ) ) ( not ( = ?auto_118133 ?auto_118129 ) ) ( ON ?auto_118128 ?auto_118127 ) ( not ( = ?auto_118126 ?auto_118127 ) ) ( not ( = ?auto_118132 ?auto_118127 ) ) ( not ( = ?auto_118133 ?auto_118127 ) ) ( not ( = ?auto_118130 ?auto_118127 ) ) ( not ( = ?auto_118128 ?auto_118127 ) ) ( not ( = ?auto_118129 ?auto_118127 ) ) ( not ( = ?auto_118131 ?auto_118127 ) ) ( ON ?auto_118129 ?auto_118128 ) ( ON-TABLE ?auto_118127 ) ( ON ?auto_118131 ?auto_118129 ) ( ON ?auto_118130 ?auto_118131 ) ( ON ?auto_118133 ?auto_118130 ) ( ON ?auto_118132 ?auto_118133 ) ( ON ?auto_118126 ?auto_118132 ) ( CLEAR ?auto_118126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_118127 ?auto_118128 ?auto_118129 ?auto_118131 ?auto_118130 ?auto_118133 ?auto_118132 )
      ( MAKE-1PILE ?auto_118126 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_118140 - BLOCK
      ?auto_118141 - BLOCK
      ?auto_118142 - BLOCK
      ?auto_118143 - BLOCK
      ?auto_118144 - BLOCK
      ?auto_118145 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_118145 ) ( CLEAR ?auto_118144 ) ( ON-TABLE ?auto_118140 ) ( ON ?auto_118141 ?auto_118140 ) ( ON ?auto_118142 ?auto_118141 ) ( ON ?auto_118143 ?auto_118142 ) ( ON ?auto_118144 ?auto_118143 ) ( not ( = ?auto_118140 ?auto_118141 ) ) ( not ( = ?auto_118140 ?auto_118142 ) ) ( not ( = ?auto_118140 ?auto_118143 ) ) ( not ( = ?auto_118140 ?auto_118144 ) ) ( not ( = ?auto_118140 ?auto_118145 ) ) ( not ( = ?auto_118141 ?auto_118142 ) ) ( not ( = ?auto_118141 ?auto_118143 ) ) ( not ( = ?auto_118141 ?auto_118144 ) ) ( not ( = ?auto_118141 ?auto_118145 ) ) ( not ( = ?auto_118142 ?auto_118143 ) ) ( not ( = ?auto_118142 ?auto_118144 ) ) ( not ( = ?auto_118142 ?auto_118145 ) ) ( not ( = ?auto_118143 ?auto_118144 ) ) ( not ( = ?auto_118143 ?auto_118145 ) ) ( not ( = ?auto_118144 ?auto_118145 ) ) )
    :subtasks
    ( ( !STACK ?auto_118145 ?auto_118144 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_118146 - BLOCK
      ?auto_118147 - BLOCK
      ?auto_118148 - BLOCK
      ?auto_118149 - BLOCK
      ?auto_118150 - BLOCK
      ?auto_118151 - BLOCK
    )
    :vars
    (
      ?auto_118152 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_118150 ) ( ON-TABLE ?auto_118146 ) ( ON ?auto_118147 ?auto_118146 ) ( ON ?auto_118148 ?auto_118147 ) ( ON ?auto_118149 ?auto_118148 ) ( ON ?auto_118150 ?auto_118149 ) ( not ( = ?auto_118146 ?auto_118147 ) ) ( not ( = ?auto_118146 ?auto_118148 ) ) ( not ( = ?auto_118146 ?auto_118149 ) ) ( not ( = ?auto_118146 ?auto_118150 ) ) ( not ( = ?auto_118146 ?auto_118151 ) ) ( not ( = ?auto_118147 ?auto_118148 ) ) ( not ( = ?auto_118147 ?auto_118149 ) ) ( not ( = ?auto_118147 ?auto_118150 ) ) ( not ( = ?auto_118147 ?auto_118151 ) ) ( not ( = ?auto_118148 ?auto_118149 ) ) ( not ( = ?auto_118148 ?auto_118150 ) ) ( not ( = ?auto_118148 ?auto_118151 ) ) ( not ( = ?auto_118149 ?auto_118150 ) ) ( not ( = ?auto_118149 ?auto_118151 ) ) ( not ( = ?auto_118150 ?auto_118151 ) ) ( ON ?auto_118151 ?auto_118152 ) ( CLEAR ?auto_118151 ) ( HAND-EMPTY ) ( not ( = ?auto_118146 ?auto_118152 ) ) ( not ( = ?auto_118147 ?auto_118152 ) ) ( not ( = ?auto_118148 ?auto_118152 ) ) ( not ( = ?auto_118149 ?auto_118152 ) ) ( not ( = ?auto_118150 ?auto_118152 ) ) ( not ( = ?auto_118151 ?auto_118152 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_118151 ?auto_118152 )
      ( MAKE-6PILE ?auto_118146 ?auto_118147 ?auto_118148 ?auto_118149 ?auto_118150 ?auto_118151 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_118153 - BLOCK
      ?auto_118154 - BLOCK
      ?auto_118155 - BLOCK
      ?auto_118156 - BLOCK
      ?auto_118157 - BLOCK
      ?auto_118158 - BLOCK
    )
    :vars
    (
      ?auto_118159 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_118153 ) ( ON ?auto_118154 ?auto_118153 ) ( ON ?auto_118155 ?auto_118154 ) ( ON ?auto_118156 ?auto_118155 ) ( not ( = ?auto_118153 ?auto_118154 ) ) ( not ( = ?auto_118153 ?auto_118155 ) ) ( not ( = ?auto_118153 ?auto_118156 ) ) ( not ( = ?auto_118153 ?auto_118157 ) ) ( not ( = ?auto_118153 ?auto_118158 ) ) ( not ( = ?auto_118154 ?auto_118155 ) ) ( not ( = ?auto_118154 ?auto_118156 ) ) ( not ( = ?auto_118154 ?auto_118157 ) ) ( not ( = ?auto_118154 ?auto_118158 ) ) ( not ( = ?auto_118155 ?auto_118156 ) ) ( not ( = ?auto_118155 ?auto_118157 ) ) ( not ( = ?auto_118155 ?auto_118158 ) ) ( not ( = ?auto_118156 ?auto_118157 ) ) ( not ( = ?auto_118156 ?auto_118158 ) ) ( not ( = ?auto_118157 ?auto_118158 ) ) ( ON ?auto_118158 ?auto_118159 ) ( CLEAR ?auto_118158 ) ( not ( = ?auto_118153 ?auto_118159 ) ) ( not ( = ?auto_118154 ?auto_118159 ) ) ( not ( = ?auto_118155 ?auto_118159 ) ) ( not ( = ?auto_118156 ?auto_118159 ) ) ( not ( = ?auto_118157 ?auto_118159 ) ) ( not ( = ?auto_118158 ?auto_118159 ) ) ( HOLDING ?auto_118157 ) ( CLEAR ?auto_118156 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_118153 ?auto_118154 ?auto_118155 ?auto_118156 ?auto_118157 )
      ( MAKE-6PILE ?auto_118153 ?auto_118154 ?auto_118155 ?auto_118156 ?auto_118157 ?auto_118158 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_118160 - BLOCK
      ?auto_118161 - BLOCK
      ?auto_118162 - BLOCK
      ?auto_118163 - BLOCK
      ?auto_118164 - BLOCK
      ?auto_118165 - BLOCK
    )
    :vars
    (
      ?auto_118166 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_118160 ) ( ON ?auto_118161 ?auto_118160 ) ( ON ?auto_118162 ?auto_118161 ) ( ON ?auto_118163 ?auto_118162 ) ( not ( = ?auto_118160 ?auto_118161 ) ) ( not ( = ?auto_118160 ?auto_118162 ) ) ( not ( = ?auto_118160 ?auto_118163 ) ) ( not ( = ?auto_118160 ?auto_118164 ) ) ( not ( = ?auto_118160 ?auto_118165 ) ) ( not ( = ?auto_118161 ?auto_118162 ) ) ( not ( = ?auto_118161 ?auto_118163 ) ) ( not ( = ?auto_118161 ?auto_118164 ) ) ( not ( = ?auto_118161 ?auto_118165 ) ) ( not ( = ?auto_118162 ?auto_118163 ) ) ( not ( = ?auto_118162 ?auto_118164 ) ) ( not ( = ?auto_118162 ?auto_118165 ) ) ( not ( = ?auto_118163 ?auto_118164 ) ) ( not ( = ?auto_118163 ?auto_118165 ) ) ( not ( = ?auto_118164 ?auto_118165 ) ) ( ON ?auto_118165 ?auto_118166 ) ( not ( = ?auto_118160 ?auto_118166 ) ) ( not ( = ?auto_118161 ?auto_118166 ) ) ( not ( = ?auto_118162 ?auto_118166 ) ) ( not ( = ?auto_118163 ?auto_118166 ) ) ( not ( = ?auto_118164 ?auto_118166 ) ) ( not ( = ?auto_118165 ?auto_118166 ) ) ( CLEAR ?auto_118163 ) ( ON ?auto_118164 ?auto_118165 ) ( CLEAR ?auto_118164 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_118166 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_118166 ?auto_118165 )
      ( MAKE-6PILE ?auto_118160 ?auto_118161 ?auto_118162 ?auto_118163 ?auto_118164 ?auto_118165 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_118167 - BLOCK
      ?auto_118168 - BLOCK
      ?auto_118169 - BLOCK
      ?auto_118170 - BLOCK
      ?auto_118171 - BLOCK
      ?auto_118172 - BLOCK
    )
    :vars
    (
      ?auto_118173 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_118167 ) ( ON ?auto_118168 ?auto_118167 ) ( ON ?auto_118169 ?auto_118168 ) ( not ( = ?auto_118167 ?auto_118168 ) ) ( not ( = ?auto_118167 ?auto_118169 ) ) ( not ( = ?auto_118167 ?auto_118170 ) ) ( not ( = ?auto_118167 ?auto_118171 ) ) ( not ( = ?auto_118167 ?auto_118172 ) ) ( not ( = ?auto_118168 ?auto_118169 ) ) ( not ( = ?auto_118168 ?auto_118170 ) ) ( not ( = ?auto_118168 ?auto_118171 ) ) ( not ( = ?auto_118168 ?auto_118172 ) ) ( not ( = ?auto_118169 ?auto_118170 ) ) ( not ( = ?auto_118169 ?auto_118171 ) ) ( not ( = ?auto_118169 ?auto_118172 ) ) ( not ( = ?auto_118170 ?auto_118171 ) ) ( not ( = ?auto_118170 ?auto_118172 ) ) ( not ( = ?auto_118171 ?auto_118172 ) ) ( ON ?auto_118172 ?auto_118173 ) ( not ( = ?auto_118167 ?auto_118173 ) ) ( not ( = ?auto_118168 ?auto_118173 ) ) ( not ( = ?auto_118169 ?auto_118173 ) ) ( not ( = ?auto_118170 ?auto_118173 ) ) ( not ( = ?auto_118171 ?auto_118173 ) ) ( not ( = ?auto_118172 ?auto_118173 ) ) ( ON ?auto_118171 ?auto_118172 ) ( CLEAR ?auto_118171 ) ( ON-TABLE ?auto_118173 ) ( HOLDING ?auto_118170 ) ( CLEAR ?auto_118169 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_118167 ?auto_118168 ?auto_118169 ?auto_118170 )
      ( MAKE-6PILE ?auto_118167 ?auto_118168 ?auto_118169 ?auto_118170 ?auto_118171 ?auto_118172 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
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
    ( and ( ON-TABLE ?auto_118174 ) ( ON ?auto_118175 ?auto_118174 ) ( ON ?auto_118176 ?auto_118175 ) ( not ( = ?auto_118174 ?auto_118175 ) ) ( not ( = ?auto_118174 ?auto_118176 ) ) ( not ( = ?auto_118174 ?auto_118177 ) ) ( not ( = ?auto_118174 ?auto_118178 ) ) ( not ( = ?auto_118174 ?auto_118179 ) ) ( not ( = ?auto_118175 ?auto_118176 ) ) ( not ( = ?auto_118175 ?auto_118177 ) ) ( not ( = ?auto_118175 ?auto_118178 ) ) ( not ( = ?auto_118175 ?auto_118179 ) ) ( not ( = ?auto_118176 ?auto_118177 ) ) ( not ( = ?auto_118176 ?auto_118178 ) ) ( not ( = ?auto_118176 ?auto_118179 ) ) ( not ( = ?auto_118177 ?auto_118178 ) ) ( not ( = ?auto_118177 ?auto_118179 ) ) ( not ( = ?auto_118178 ?auto_118179 ) ) ( ON ?auto_118179 ?auto_118180 ) ( not ( = ?auto_118174 ?auto_118180 ) ) ( not ( = ?auto_118175 ?auto_118180 ) ) ( not ( = ?auto_118176 ?auto_118180 ) ) ( not ( = ?auto_118177 ?auto_118180 ) ) ( not ( = ?auto_118178 ?auto_118180 ) ) ( not ( = ?auto_118179 ?auto_118180 ) ) ( ON ?auto_118178 ?auto_118179 ) ( ON-TABLE ?auto_118180 ) ( CLEAR ?auto_118176 ) ( ON ?auto_118177 ?auto_118178 ) ( CLEAR ?auto_118177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_118180 ?auto_118179 ?auto_118178 )
      ( MAKE-6PILE ?auto_118174 ?auto_118175 ?auto_118176 ?auto_118177 ?auto_118178 ?auto_118179 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_118181 - BLOCK
      ?auto_118182 - BLOCK
      ?auto_118183 - BLOCK
      ?auto_118184 - BLOCK
      ?auto_118185 - BLOCK
      ?auto_118186 - BLOCK
    )
    :vars
    (
      ?auto_118187 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_118181 ) ( ON ?auto_118182 ?auto_118181 ) ( not ( = ?auto_118181 ?auto_118182 ) ) ( not ( = ?auto_118181 ?auto_118183 ) ) ( not ( = ?auto_118181 ?auto_118184 ) ) ( not ( = ?auto_118181 ?auto_118185 ) ) ( not ( = ?auto_118181 ?auto_118186 ) ) ( not ( = ?auto_118182 ?auto_118183 ) ) ( not ( = ?auto_118182 ?auto_118184 ) ) ( not ( = ?auto_118182 ?auto_118185 ) ) ( not ( = ?auto_118182 ?auto_118186 ) ) ( not ( = ?auto_118183 ?auto_118184 ) ) ( not ( = ?auto_118183 ?auto_118185 ) ) ( not ( = ?auto_118183 ?auto_118186 ) ) ( not ( = ?auto_118184 ?auto_118185 ) ) ( not ( = ?auto_118184 ?auto_118186 ) ) ( not ( = ?auto_118185 ?auto_118186 ) ) ( ON ?auto_118186 ?auto_118187 ) ( not ( = ?auto_118181 ?auto_118187 ) ) ( not ( = ?auto_118182 ?auto_118187 ) ) ( not ( = ?auto_118183 ?auto_118187 ) ) ( not ( = ?auto_118184 ?auto_118187 ) ) ( not ( = ?auto_118185 ?auto_118187 ) ) ( not ( = ?auto_118186 ?auto_118187 ) ) ( ON ?auto_118185 ?auto_118186 ) ( ON-TABLE ?auto_118187 ) ( ON ?auto_118184 ?auto_118185 ) ( CLEAR ?auto_118184 ) ( HOLDING ?auto_118183 ) ( CLEAR ?auto_118182 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_118181 ?auto_118182 ?auto_118183 )
      ( MAKE-6PILE ?auto_118181 ?auto_118182 ?auto_118183 ?auto_118184 ?auto_118185 ?auto_118186 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_118188 - BLOCK
      ?auto_118189 - BLOCK
      ?auto_118190 - BLOCK
      ?auto_118191 - BLOCK
      ?auto_118192 - BLOCK
      ?auto_118193 - BLOCK
    )
    :vars
    (
      ?auto_118194 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_118188 ) ( ON ?auto_118189 ?auto_118188 ) ( not ( = ?auto_118188 ?auto_118189 ) ) ( not ( = ?auto_118188 ?auto_118190 ) ) ( not ( = ?auto_118188 ?auto_118191 ) ) ( not ( = ?auto_118188 ?auto_118192 ) ) ( not ( = ?auto_118188 ?auto_118193 ) ) ( not ( = ?auto_118189 ?auto_118190 ) ) ( not ( = ?auto_118189 ?auto_118191 ) ) ( not ( = ?auto_118189 ?auto_118192 ) ) ( not ( = ?auto_118189 ?auto_118193 ) ) ( not ( = ?auto_118190 ?auto_118191 ) ) ( not ( = ?auto_118190 ?auto_118192 ) ) ( not ( = ?auto_118190 ?auto_118193 ) ) ( not ( = ?auto_118191 ?auto_118192 ) ) ( not ( = ?auto_118191 ?auto_118193 ) ) ( not ( = ?auto_118192 ?auto_118193 ) ) ( ON ?auto_118193 ?auto_118194 ) ( not ( = ?auto_118188 ?auto_118194 ) ) ( not ( = ?auto_118189 ?auto_118194 ) ) ( not ( = ?auto_118190 ?auto_118194 ) ) ( not ( = ?auto_118191 ?auto_118194 ) ) ( not ( = ?auto_118192 ?auto_118194 ) ) ( not ( = ?auto_118193 ?auto_118194 ) ) ( ON ?auto_118192 ?auto_118193 ) ( ON-TABLE ?auto_118194 ) ( ON ?auto_118191 ?auto_118192 ) ( CLEAR ?auto_118189 ) ( ON ?auto_118190 ?auto_118191 ) ( CLEAR ?auto_118190 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_118194 ?auto_118193 ?auto_118192 ?auto_118191 )
      ( MAKE-6PILE ?auto_118188 ?auto_118189 ?auto_118190 ?auto_118191 ?auto_118192 ?auto_118193 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_118195 - BLOCK
      ?auto_118196 - BLOCK
      ?auto_118197 - BLOCK
      ?auto_118198 - BLOCK
      ?auto_118199 - BLOCK
      ?auto_118200 - BLOCK
    )
    :vars
    (
      ?auto_118201 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_118195 ) ( not ( = ?auto_118195 ?auto_118196 ) ) ( not ( = ?auto_118195 ?auto_118197 ) ) ( not ( = ?auto_118195 ?auto_118198 ) ) ( not ( = ?auto_118195 ?auto_118199 ) ) ( not ( = ?auto_118195 ?auto_118200 ) ) ( not ( = ?auto_118196 ?auto_118197 ) ) ( not ( = ?auto_118196 ?auto_118198 ) ) ( not ( = ?auto_118196 ?auto_118199 ) ) ( not ( = ?auto_118196 ?auto_118200 ) ) ( not ( = ?auto_118197 ?auto_118198 ) ) ( not ( = ?auto_118197 ?auto_118199 ) ) ( not ( = ?auto_118197 ?auto_118200 ) ) ( not ( = ?auto_118198 ?auto_118199 ) ) ( not ( = ?auto_118198 ?auto_118200 ) ) ( not ( = ?auto_118199 ?auto_118200 ) ) ( ON ?auto_118200 ?auto_118201 ) ( not ( = ?auto_118195 ?auto_118201 ) ) ( not ( = ?auto_118196 ?auto_118201 ) ) ( not ( = ?auto_118197 ?auto_118201 ) ) ( not ( = ?auto_118198 ?auto_118201 ) ) ( not ( = ?auto_118199 ?auto_118201 ) ) ( not ( = ?auto_118200 ?auto_118201 ) ) ( ON ?auto_118199 ?auto_118200 ) ( ON-TABLE ?auto_118201 ) ( ON ?auto_118198 ?auto_118199 ) ( ON ?auto_118197 ?auto_118198 ) ( CLEAR ?auto_118197 ) ( HOLDING ?auto_118196 ) ( CLEAR ?auto_118195 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_118195 ?auto_118196 )
      ( MAKE-6PILE ?auto_118195 ?auto_118196 ?auto_118197 ?auto_118198 ?auto_118199 ?auto_118200 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_118202 - BLOCK
      ?auto_118203 - BLOCK
      ?auto_118204 - BLOCK
      ?auto_118205 - BLOCK
      ?auto_118206 - BLOCK
      ?auto_118207 - BLOCK
    )
    :vars
    (
      ?auto_118208 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_118202 ) ( not ( = ?auto_118202 ?auto_118203 ) ) ( not ( = ?auto_118202 ?auto_118204 ) ) ( not ( = ?auto_118202 ?auto_118205 ) ) ( not ( = ?auto_118202 ?auto_118206 ) ) ( not ( = ?auto_118202 ?auto_118207 ) ) ( not ( = ?auto_118203 ?auto_118204 ) ) ( not ( = ?auto_118203 ?auto_118205 ) ) ( not ( = ?auto_118203 ?auto_118206 ) ) ( not ( = ?auto_118203 ?auto_118207 ) ) ( not ( = ?auto_118204 ?auto_118205 ) ) ( not ( = ?auto_118204 ?auto_118206 ) ) ( not ( = ?auto_118204 ?auto_118207 ) ) ( not ( = ?auto_118205 ?auto_118206 ) ) ( not ( = ?auto_118205 ?auto_118207 ) ) ( not ( = ?auto_118206 ?auto_118207 ) ) ( ON ?auto_118207 ?auto_118208 ) ( not ( = ?auto_118202 ?auto_118208 ) ) ( not ( = ?auto_118203 ?auto_118208 ) ) ( not ( = ?auto_118204 ?auto_118208 ) ) ( not ( = ?auto_118205 ?auto_118208 ) ) ( not ( = ?auto_118206 ?auto_118208 ) ) ( not ( = ?auto_118207 ?auto_118208 ) ) ( ON ?auto_118206 ?auto_118207 ) ( ON-TABLE ?auto_118208 ) ( ON ?auto_118205 ?auto_118206 ) ( ON ?auto_118204 ?auto_118205 ) ( CLEAR ?auto_118202 ) ( ON ?auto_118203 ?auto_118204 ) ( CLEAR ?auto_118203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_118208 ?auto_118207 ?auto_118206 ?auto_118205 ?auto_118204 )
      ( MAKE-6PILE ?auto_118202 ?auto_118203 ?auto_118204 ?auto_118205 ?auto_118206 ?auto_118207 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_118209 - BLOCK
      ?auto_118210 - BLOCK
      ?auto_118211 - BLOCK
      ?auto_118212 - BLOCK
      ?auto_118213 - BLOCK
      ?auto_118214 - BLOCK
    )
    :vars
    (
      ?auto_118215 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118209 ?auto_118210 ) ) ( not ( = ?auto_118209 ?auto_118211 ) ) ( not ( = ?auto_118209 ?auto_118212 ) ) ( not ( = ?auto_118209 ?auto_118213 ) ) ( not ( = ?auto_118209 ?auto_118214 ) ) ( not ( = ?auto_118210 ?auto_118211 ) ) ( not ( = ?auto_118210 ?auto_118212 ) ) ( not ( = ?auto_118210 ?auto_118213 ) ) ( not ( = ?auto_118210 ?auto_118214 ) ) ( not ( = ?auto_118211 ?auto_118212 ) ) ( not ( = ?auto_118211 ?auto_118213 ) ) ( not ( = ?auto_118211 ?auto_118214 ) ) ( not ( = ?auto_118212 ?auto_118213 ) ) ( not ( = ?auto_118212 ?auto_118214 ) ) ( not ( = ?auto_118213 ?auto_118214 ) ) ( ON ?auto_118214 ?auto_118215 ) ( not ( = ?auto_118209 ?auto_118215 ) ) ( not ( = ?auto_118210 ?auto_118215 ) ) ( not ( = ?auto_118211 ?auto_118215 ) ) ( not ( = ?auto_118212 ?auto_118215 ) ) ( not ( = ?auto_118213 ?auto_118215 ) ) ( not ( = ?auto_118214 ?auto_118215 ) ) ( ON ?auto_118213 ?auto_118214 ) ( ON-TABLE ?auto_118215 ) ( ON ?auto_118212 ?auto_118213 ) ( ON ?auto_118211 ?auto_118212 ) ( ON ?auto_118210 ?auto_118211 ) ( CLEAR ?auto_118210 ) ( HOLDING ?auto_118209 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_118209 )
      ( MAKE-6PILE ?auto_118209 ?auto_118210 ?auto_118211 ?auto_118212 ?auto_118213 ?auto_118214 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_118216 - BLOCK
      ?auto_118217 - BLOCK
      ?auto_118218 - BLOCK
      ?auto_118219 - BLOCK
      ?auto_118220 - BLOCK
      ?auto_118221 - BLOCK
    )
    :vars
    (
      ?auto_118222 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118216 ?auto_118217 ) ) ( not ( = ?auto_118216 ?auto_118218 ) ) ( not ( = ?auto_118216 ?auto_118219 ) ) ( not ( = ?auto_118216 ?auto_118220 ) ) ( not ( = ?auto_118216 ?auto_118221 ) ) ( not ( = ?auto_118217 ?auto_118218 ) ) ( not ( = ?auto_118217 ?auto_118219 ) ) ( not ( = ?auto_118217 ?auto_118220 ) ) ( not ( = ?auto_118217 ?auto_118221 ) ) ( not ( = ?auto_118218 ?auto_118219 ) ) ( not ( = ?auto_118218 ?auto_118220 ) ) ( not ( = ?auto_118218 ?auto_118221 ) ) ( not ( = ?auto_118219 ?auto_118220 ) ) ( not ( = ?auto_118219 ?auto_118221 ) ) ( not ( = ?auto_118220 ?auto_118221 ) ) ( ON ?auto_118221 ?auto_118222 ) ( not ( = ?auto_118216 ?auto_118222 ) ) ( not ( = ?auto_118217 ?auto_118222 ) ) ( not ( = ?auto_118218 ?auto_118222 ) ) ( not ( = ?auto_118219 ?auto_118222 ) ) ( not ( = ?auto_118220 ?auto_118222 ) ) ( not ( = ?auto_118221 ?auto_118222 ) ) ( ON ?auto_118220 ?auto_118221 ) ( ON-TABLE ?auto_118222 ) ( ON ?auto_118219 ?auto_118220 ) ( ON ?auto_118218 ?auto_118219 ) ( ON ?auto_118217 ?auto_118218 ) ( ON ?auto_118216 ?auto_118217 ) ( CLEAR ?auto_118216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_118222 ?auto_118221 ?auto_118220 ?auto_118219 ?auto_118218 ?auto_118217 )
      ( MAKE-6PILE ?auto_118216 ?auto_118217 ?auto_118218 ?auto_118219 ?auto_118220 ?auto_118221 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
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
    ( and ( not ( = ?auto_118223 ?auto_118224 ) ) ( not ( = ?auto_118223 ?auto_118225 ) ) ( not ( = ?auto_118223 ?auto_118226 ) ) ( not ( = ?auto_118223 ?auto_118227 ) ) ( not ( = ?auto_118223 ?auto_118228 ) ) ( not ( = ?auto_118224 ?auto_118225 ) ) ( not ( = ?auto_118224 ?auto_118226 ) ) ( not ( = ?auto_118224 ?auto_118227 ) ) ( not ( = ?auto_118224 ?auto_118228 ) ) ( not ( = ?auto_118225 ?auto_118226 ) ) ( not ( = ?auto_118225 ?auto_118227 ) ) ( not ( = ?auto_118225 ?auto_118228 ) ) ( not ( = ?auto_118226 ?auto_118227 ) ) ( not ( = ?auto_118226 ?auto_118228 ) ) ( not ( = ?auto_118227 ?auto_118228 ) ) ( ON ?auto_118228 ?auto_118229 ) ( not ( = ?auto_118223 ?auto_118229 ) ) ( not ( = ?auto_118224 ?auto_118229 ) ) ( not ( = ?auto_118225 ?auto_118229 ) ) ( not ( = ?auto_118226 ?auto_118229 ) ) ( not ( = ?auto_118227 ?auto_118229 ) ) ( not ( = ?auto_118228 ?auto_118229 ) ) ( ON ?auto_118227 ?auto_118228 ) ( ON-TABLE ?auto_118229 ) ( ON ?auto_118226 ?auto_118227 ) ( ON ?auto_118225 ?auto_118226 ) ( ON ?auto_118224 ?auto_118225 ) ( HOLDING ?auto_118223 ) ( CLEAR ?auto_118224 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_118229 ?auto_118228 ?auto_118227 ?auto_118226 ?auto_118225 ?auto_118224 ?auto_118223 )
      ( MAKE-6PILE ?auto_118223 ?auto_118224 ?auto_118225 ?auto_118226 ?auto_118227 ?auto_118228 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_118230 - BLOCK
      ?auto_118231 - BLOCK
      ?auto_118232 - BLOCK
      ?auto_118233 - BLOCK
      ?auto_118234 - BLOCK
      ?auto_118235 - BLOCK
    )
    :vars
    (
      ?auto_118236 - BLOCK
      ?auto_118237 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118230 ?auto_118231 ) ) ( not ( = ?auto_118230 ?auto_118232 ) ) ( not ( = ?auto_118230 ?auto_118233 ) ) ( not ( = ?auto_118230 ?auto_118234 ) ) ( not ( = ?auto_118230 ?auto_118235 ) ) ( not ( = ?auto_118231 ?auto_118232 ) ) ( not ( = ?auto_118231 ?auto_118233 ) ) ( not ( = ?auto_118231 ?auto_118234 ) ) ( not ( = ?auto_118231 ?auto_118235 ) ) ( not ( = ?auto_118232 ?auto_118233 ) ) ( not ( = ?auto_118232 ?auto_118234 ) ) ( not ( = ?auto_118232 ?auto_118235 ) ) ( not ( = ?auto_118233 ?auto_118234 ) ) ( not ( = ?auto_118233 ?auto_118235 ) ) ( not ( = ?auto_118234 ?auto_118235 ) ) ( ON ?auto_118235 ?auto_118236 ) ( not ( = ?auto_118230 ?auto_118236 ) ) ( not ( = ?auto_118231 ?auto_118236 ) ) ( not ( = ?auto_118232 ?auto_118236 ) ) ( not ( = ?auto_118233 ?auto_118236 ) ) ( not ( = ?auto_118234 ?auto_118236 ) ) ( not ( = ?auto_118235 ?auto_118236 ) ) ( ON ?auto_118234 ?auto_118235 ) ( ON-TABLE ?auto_118236 ) ( ON ?auto_118233 ?auto_118234 ) ( ON ?auto_118232 ?auto_118233 ) ( ON ?auto_118231 ?auto_118232 ) ( CLEAR ?auto_118231 ) ( ON ?auto_118230 ?auto_118237 ) ( CLEAR ?auto_118230 ) ( HAND-EMPTY ) ( not ( = ?auto_118230 ?auto_118237 ) ) ( not ( = ?auto_118231 ?auto_118237 ) ) ( not ( = ?auto_118232 ?auto_118237 ) ) ( not ( = ?auto_118233 ?auto_118237 ) ) ( not ( = ?auto_118234 ?auto_118237 ) ) ( not ( = ?auto_118235 ?auto_118237 ) ) ( not ( = ?auto_118236 ?auto_118237 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_118230 ?auto_118237 )
      ( MAKE-6PILE ?auto_118230 ?auto_118231 ?auto_118232 ?auto_118233 ?auto_118234 ?auto_118235 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_118238 - BLOCK
      ?auto_118239 - BLOCK
      ?auto_118240 - BLOCK
      ?auto_118241 - BLOCK
      ?auto_118242 - BLOCK
      ?auto_118243 - BLOCK
    )
    :vars
    (
      ?auto_118245 - BLOCK
      ?auto_118244 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118238 ?auto_118239 ) ) ( not ( = ?auto_118238 ?auto_118240 ) ) ( not ( = ?auto_118238 ?auto_118241 ) ) ( not ( = ?auto_118238 ?auto_118242 ) ) ( not ( = ?auto_118238 ?auto_118243 ) ) ( not ( = ?auto_118239 ?auto_118240 ) ) ( not ( = ?auto_118239 ?auto_118241 ) ) ( not ( = ?auto_118239 ?auto_118242 ) ) ( not ( = ?auto_118239 ?auto_118243 ) ) ( not ( = ?auto_118240 ?auto_118241 ) ) ( not ( = ?auto_118240 ?auto_118242 ) ) ( not ( = ?auto_118240 ?auto_118243 ) ) ( not ( = ?auto_118241 ?auto_118242 ) ) ( not ( = ?auto_118241 ?auto_118243 ) ) ( not ( = ?auto_118242 ?auto_118243 ) ) ( ON ?auto_118243 ?auto_118245 ) ( not ( = ?auto_118238 ?auto_118245 ) ) ( not ( = ?auto_118239 ?auto_118245 ) ) ( not ( = ?auto_118240 ?auto_118245 ) ) ( not ( = ?auto_118241 ?auto_118245 ) ) ( not ( = ?auto_118242 ?auto_118245 ) ) ( not ( = ?auto_118243 ?auto_118245 ) ) ( ON ?auto_118242 ?auto_118243 ) ( ON-TABLE ?auto_118245 ) ( ON ?auto_118241 ?auto_118242 ) ( ON ?auto_118240 ?auto_118241 ) ( ON ?auto_118238 ?auto_118244 ) ( CLEAR ?auto_118238 ) ( not ( = ?auto_118238 ?auto_118244 ) ) ( not ( = ?auto_118239 ?auto_118244 ) ) ( not ( = ?auto_118240 ?auto_118244 ) ) ( not ( = ?auto_118241 ?auto_118244 ) ) ( not ( = ?auto_118242 ?auto_118244 ) ) ( not ( = ?auto_118243 ?auto_118244 ) ) ( not ( = ?auto_118245 ?auto_118244 ) ) ( HOLDING ?auto_118239 ) ( CLEAR ?auto_118240 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_118245 ?auto_118243 ?auto_118242 ?auto_118241 ?auto_118240 ?auto_118239 )
      ( MAKE-6PILE ?auto_118238 ?auto_118239 ?auto_118240 ?auto_118241 ?auto_118242 ?auto_118243 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_118246 - BLOCK
      ?auto_118247 - BLOCK
      ?auto_118248 - BLOCK
      ?auto_118249 - BLOCK
      ?auto_118250 - BLOCK
      ?auto_118251 - BLOCK
    )
    :vars
    (
      ?auto_118253 - BLOCK
      ?auto_118252 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118246 ?auto_118247 ) ) ( not ( = ?auto_118246 ?auto_118248 ) ) ( not ( = ?auto_118246 ?auto_118249 ) ) ( not ( = ?auto_118246 ?auto_118250 ) ) ( not ( = ?auto_118246 ?auto_118251 ) ) ( not ( = ?auto_118247 ?auto_118248 ) ) ( not ( = ?auto_118247 ?auto_118249 ) ) ( not ( = ?auto_118247 ?auto_118250 ) ) ( not ( = ?auto_118247 ?auto_118251 ) ) ( not ( = ?auto_118248 ?auto_118249 ) ) ( not ( = ?auto_118248 ?auto_118250 ) ) ( not ( = ?auto_118248 ?auto_118251 ) ) ( not ( = ?auto_118249 ?auto_118250 ) ) ( not ( = ?auto_118249 ?auto_118251 ) ) ( not ( = ?auto_118250 ?auto_118251 ) ) ( ON ?auto_118251 ?auto_118253 ) ( not ( = ?auto_118246 ?auto_118253 ) ) ( not ( = ?auto_118247 ?auto_118253 ) ) ( not ( = ?auto_118248 ?auto_118253 ) ) ( not ( = ?auto_118249 ?auto_118253 ) ) ( not ( = ?auto_118250 ?auto_118253 ) ) ( not ( = ?auto_118251 ?auto_118253 ) ) ( ON ?auto_118250 ?auto_118251 ) ( ON-TABLE ?auto_118253 ) ( ON ?auto_118249 ?auto_118250 ) ( ON ?auto_118248 ?auto_118249 ) ( ON ?auto_118246 ?auto_118252 ) ( not ( = ?auto_118246 ?auto_118252 ) ) ( not ( = ?auto_118247 ?auto_118252 ) ) ( not ( = ?auto_118248 ?auto_118252 ) ) ( not ( = ?auto_118249 ?auto_118252 ) ) ( not ( = ?auto_118250 ?auto_118252 ) ) ( not ( = ?auto_118251 ?auto_118252 ) ) ( not ( = ?auto_118253 ?auto_118252 ) ) ( CLEAR ?auto_118248 ) ( ON ?auto_118247 ?auto_118246 ) ( CLEAR ?auto_118247 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_118252 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_118252 ?auto_118246 )
      ( MAKE-6PILE ?auto_118246 ?auto_118247 ?auto_118248 ?auto_118249 ?auto_118250 ?auto_118251 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_118254 - BLOCK
      ?auto_118255 - BLOCK
      ?auto_118256 - BLOCK
      ?auto_118257 - BLOCK
      ?auto_118258 - BLOCK
      ?auto_118259 - BLOCK
    )
    :vars
    (
      ?auto_118260 - BLOCK
      ?auto_118261 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118254 ?auto_118255 ) ) ( not ( = ?auto_118254 ?auto_118256 ) ) ( not ( = ?auto_118254 ?auto_118257 ) ) ( not ( = ?auto_118254 ?auto_118258 ) ) ( not ( = ?auto_118254 ?auto_118259 ) ) ( not ( = ?auto_118255 ?auto_118256 ) ) ( not ( = ?auto_118255 ?auto_118257 ) ) ( not ( = ?auto_118255 ?auto_118258 ) ) ( not ( = ?auto_118255 ?auto_118259 ) ) ( not ( = ?auto_118256 ?auto_118257 ) ) ( not ( = ?auto_118256 ?auto_118258 ) ) ( not ( = ?auto_118256 ?auto_118259 ) ) ( not ( = ?auto_118257 ?auto_118258 ) ) ( not ( = ?auto_118257 ?auto_118259 ) ) ( not ( = ?auto_118258 ?auto_118259 ) ) ( ON ?auto_118259 ?auto_118260 ) ( not ( = ?auto_118254 ?auto_118260 ) ) ( not ( = ?auto_118255 ?auto_118260 ) ) ( not ( = ?auto_118256 ?auto_118260 ) ) ( not ( = ?auto_118257 ?auto_118260 ) ) ( not ( = ?auto_118258 ?auto_118260 ) ) ( not ( = ?auto_118259 ?auto_118260 ) ) ( ON ?auto_118258 ?auto_118259 ) ( ON-TABLE ?auto_118260 ) ( ON ?auto_118257 ?auto_118258 ) ( ON ?auto_118254 ?auto_118261 ) ( not ( = ?auto_118254 ?auto_118261 ) ) ( not ( = ?auto_118255 ?auto_118261 ) ) ( not ( = ?auto_118256 ?auto_118261 ) ) ( not ( = ?auto_118257 ?auto_118261 ) ) ( not ( = ?auto_118258 ?auto_118261 ) ) ( not ( = ?auto_118259 ?auto_118261 ) ) ( not ( = ?auto_118260 ?auto_118261 ) ) ( ON ?auto_118255 ?auto_118254 ) ( CLEAR ?auto_118255 ) ( ON-TABLE ?auto_118261 ) ( HOLDING ?auto_118256 ) ( CLEAR ?auto_118257 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_118260 ?auto_118259 ?auto_118258 ?auto_118257 ?auto_118256 )
      ( MAKE-6PILE ?auto_118254 ?auto_118255 ?auto_118256 ?auto_118257 ?auto_118258 ?auto_118259 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_118262 - BLOCK
      ?auto_118263 - BLOCK
      ?auto_118264 - BLOCK
      ?auto_118265 - BLOCK
      ?auto_118266 - BLOCK
      ?auto_118267 - BLOCK
    )
    :vars
    (
      ?auto_118268 - BLOCK
      ?auto_118269 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118262 ?auto_118263 ) ) ( not ( = ?auto_118262 ?auto_118264 ) ) ( not ( = ?auto_118262 ?auto_118265 ) ) ( not ( = ?auto_118262 ?auto_118266 ) ) ( not ( = ?auto_118262 ?auto_118267 ) ) ( not ( = ?auto_118263 ?auto_118264 ) ) ( not ( = ?auto_118263 ?auto_118265 ) ) ( not ( = ?auto_118263 ?auto_118266 ) ) ( not ( = ?auto_118263 ?auto_118267 ) ) ( not ( = ?auto_118264 ?auto_118265 ) ) ( not ( = ?auto_118264 ?auto_118266 ) ) ( not ( = ?auto_118264 ?auto_118267 ) ) ( not ( = ?auto_118265 ?auto_118266 ) ) ( not ( = ?auto_118265 ?auto_118267 ) ) ( not ( = ?auto_118266 ?auto_118267 ) ) ( ON ?auto_118267 ?auto_118268 ) ( not ( = ?auto_118262 ?auto_118268 ) ) ( not ( = ?auto_118263 ?auto_118268 ) ) ( not ( = ?auto_118264 ?auto_118268 ) ) ( not ( = ?auto_118265 ?auto_118268 ) ) ( not ( = ?auto_118266 ?auto_118268 ) ) ( not ( = ?auto_118267 ?auto_118268 ) ) ( ON ?auto_118266 ?auto_118267 ) ( ON-TABLE ?auto_118268 ) ( ON ?auto_118265 ?auto_118266 ) ( ON ?auto_118262 ?auto_118269 ) ( not ( = ?auto_118262 ?auto_118269 ) ) ( not ( = ?auto_118263 ?auto_118269 ) ) ( not ( = ?auto_118264 ?auto_118269 ) ) ( not ( = ?auto_118265 ?auto_118269 ) ) ( not ( = ?auto_118266 ?auto_118269 ) ) ( not ( = ?auto_118267 ?auto_118269 ) ) ( not ( = ?auto_118268 ?auto_118269 ) ) ( ON ?auto_118263 ?auto_118262 ) ( ON-TABLE ?auto_118269 ) ( CLEAR ?auto_118265 ) ( ON ?auto_118264 ?auto_118263 ) ( CLEAR ?auto_118264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_118269 ?auto_118262 ?auto_118263 )
      ( MAKE-6PILE ?auto_118262 ?auto_118263 ?auto_118264 ?auto_118265 ?auto_118266 ?auto_118267 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_118270 - BLOCK
      ?auto_118271 - BLOCK
      ?auto_118272 - BLOCK
      ?auto_118273 - BLOCK
      ?auto_118274 - BLOCK
      ?auto_118275 - BLOCK
    )
    :vars
    (
      ?auto_118277 - BLOCK
      ?auto_118276 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118270 ?auto_118271 ) ) ( not ( = ?auto_118270 ?auto_118272 ) ) ( not ( = ?auto_118270 ?auto_118273 ) ) ( not ( = ?auto_118270 ?auto_118274 ) ) ( not ( = ?auto_118270 ?auto_118275 ) ) ( not ( = ?auto_118271 ?auto_118272 ) ) ( not ( = ?auto_118271 ?auto_118273 ) ) ( not ( = ?auto_118271 ?auto_118274 ) ) ( not ( = ?auto_118271 ?auto_118275 ) ) ( not ( = ?auto_118272 ?auto_118273 ) ) ( not ( = ?auto_118272 ?auto_118274 ) ) ( not ( = ?auto_118272 ?auto_118275 ) ) ( not ( = ?auto_118273 ?auto_118274 ) ) ( not ( = ?auto_118273 ?auto_118275 ) ) ( not ( = ?auto_118274 ?auto_118275 ) ) ( ON ?auto_118275 ?auto_118277 ) ( not ( = ?auto_118270 ?auto_118277 ) ) ( not ( = ?auto_118271 ?auto_118277 ) ) ( not ( = ?auto_118272 ?auto_118277 ) ) ( not ( = ?auto_118273 ?auto_118277 ) ) ( not ( = ?auto_118274 ?auto_118277 ) ) ( not ( = ?auto_118275 ?auto_118277 ) ) ( ON ?auto_118274 ?auto_118275 ) ( ON-TABLE ?auto_118277 ) ( ON ?auto_118270 ?auto_118276 ) ( not ( = ?auto_118270 ?auto_118276 ) ) ( not ( = ?auto_118271 ?auto_118276 ) ) ( not ( = ?auto_118272 ?auto_118276 ) ) ( not ( = ?auto_118273 ?auto_118276 ) ) ( not ( = ?auto_118274 ?auto_118276 ) ) ( not ( = ?auto_118275 ?auto_118276 ) ) ( not ( = ?auto_118277 ?auto_118276 ) ) ( ON ?auto_118271 ?auto_118270 ) ( ON-TABLE ?auto_118276 ) ( ON ?auto_118272 ?auto_118271 ) ( CLEAR ?auto_118272 ) ( HOLDING ?auto_118273 ) ( CLEAR ?auto_118274 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_118277 ?auto_118275 ?auto_118274 ?auto_118273 )
      ( MAKE-6PILE ?auto_118270 ?auto_118271 ?auto_118272 ?auto_118273 ?auto_118274 ?auto_118275 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_118278 - BLOCK
      ?auto_118279 - BLOCK
      ?auto_118280 - BLOCK
      ?auto_118281 - BLOCK
      ?auto_118282 - BLOCK
      ?auto_118283 - BLOCK
    )
    :vars
    (
      ?auto_118284 - BLOCK
      ?auto_118285 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118278 ?auto_118279 ) ) ( not ( = ?auto_118278 ?auto_118280 ) ) ( not ( = ?auto_118278 ?auto_118281 ) ) ( not ( = ?auto_118278 ?auto_118282 ) ) ( not ( = ?auto_118278 ?auto_118283 ) ) ( not ( = ?auto_118279 ?auto_118280 ) ) ( not ( = ?auto_118279 ?auto_118281 ) ) ( not ( = ?auto_118279 ?auto_118282 ) ) ( not ( = ?auto_118279 ?auto_118283 ) ) ( not ( = ?auto_118280 ?auto_118281 ) ) ( not ( = ?auto_118280 ?auto_118282 ) ) ( not ( = ?auto_118280 ?auto_118283 ) ) ( not ( = ?auto_118281 ?auto_118282 ) ) ( not ( = ?auto_118281 ?auto_118283 ) ) ( not ( = ?auto_118282 ?auto_118283 ) ) ( ON ?auto_118283 ?auto_118284 ) ( not ( = ?auto_118278 ?auto_118284 ) ) ( not ( = ?auto_118279 ?auto_118284 ) ) ( not ( = ?auto_118280 ?auto_118284 ) ) ( not ( = ?auto_118281 ?auto_118284 ) ) ( not ( = ?auto_118282 ?auto_118284 ) ) ( not ( = ?auto_118283 ?auto_118284 ) ) ( ON ?auto_118282 ?auto_118283 ) ( ON-TABLE ?auto_118284 ) ( ON ?auto_118278 ?auto_118285 ) ( not ( = ?auto_118278 ?auto_118285 ) ) ( not ( = ?auto_118279 ?auto_118285 ) ) ( not ( = ?auto_118280 ?auto_118285 ) ) ( not ( = ?auto_118281 ?auto_118285 ) ) ( not ( = ?auto_118282 ?auto_118285 ) ) ( not ( = ?auto_118283 ?auto_118285 ) ) ( not ( = ?auto_118284 ?auto_118285 ) ) ( ON ?auto_118279 ?auto_118278 ) ( ON-TABLE ?auto_118285 ) ( ON ?auto_118280 ?auto_118279 ) ( CLEAR ?auto_118282 ) ( ON ?auto_118281 ?auto_118280 ) ( CLEAR ?auto_118281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_118285 ?auto_118278 ?auto_118279 ?auto_118280 )
      ( MAKE-6PILE ?auto_118278 ?auto_118279 ?auto_118280 ?auto_118281 ?auto_118282 ?auto_118283 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_118286 - BLOCK
      ?auto_118287 - BLOCK
      ?auto_118288 - BLOCK
      ?auto_118289 - BLOCK
      ?auto_118290 - BLOCK
      ?auto_118291 - BLOCK
    )
    :vars
    (
      ?auto_118292 - BLOCK
      ?auto_118293 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118286 ?auto_118287 ) ) ( not ( = ?auto_118286 ?auto_118288 ) ) ( not ( = ?auto_118286 ?auto_118289 ) ) ( not ( = ?auto_118286 ?auto_118290 ) ) ( not ( = ?auto_118286 ?auto_118291 ) ) ( not ( = ?auto_118287 ?auto_118288 ) ) ( not ( = ?auto_118287 ?auto_118289 ) ) ( not ( = ?auto_118287 ?auto_118290 ) ) ( not ( = ?auto_118287 ?auto_118291 ) ) ( not ( = ?auto_118288 ?auto_118289 ) ) ( not ( = ?auto_118288 ?auto_118290 ) ) ( not ( = ?auto_118288 ?auto_118291 ) ) ( not ( = ?auto_118289 ?auto_118290 ) ) ( not ( = ?auto_118289 ?auto_118291 ) ) ( not ( = ?auto_118290 ?auto_118291 ) ) ( ON ?auto_118291 ?auto_118292 ) ( not ( = ?auto_118286 ?auto_118292 ) ) ( not ( = ?auto_118287 ?auto_118292 ) ) ( not ( = ?auto_118288 ?auto_118292 ) ) ( not ( = ?auto_118289 ?auto_118292 ) ) ( not ( = ?auto_118290 ?auto_118292 ) ) ( not ( = ?auto_118291 ?auto_118292 ) ) ( ON-TABLE ?auto_118292 ) ( ON ?auto_118286 ?auto_118293 ) ( not ( = ?auto_118286 ?auto_118293 ) ) ( not ( = ?auto_118287 ?auto_118293 ) ) ( not ( = ?auto_118288 ?auto_118293 ) ) ( not ( = ?auto_118289 ?auto_118293 ) ) ( not ( = ?auto_118290 ?auto_118293 ) ) ( not ( = ?auto_118291 ?auto_118293 ) ) ( not ( = ?auto_118292 ?auto_118293 ) ) ( ON ?auto_118287 ?auto_118286 ) ( ON-TABLE ?auto_118293 ) ( ON ?auto_118288 ?auto_118287 ) ( ON ?auto_118289 ?auto_118288 ) ( CLEAR ?auto_118289 ) ( HOLDING ?auto_118290 ) ( CLEAR ?auto_118291 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_118292 ?auto_118291 ?auto_118290 )
      ( MAKE-6PILE ?auto_118286 ?auto_118287 ?auto_118288 ?auto_118289 ?auto_118290 ?auto_118291 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_118294 - BLOCK
      ?auto_118295 - BLOCK
      ?auto_118296 - BLOCK
      ?auto_118297 - BLOCK
      ?auto_118298 - BLOCK
      ?auto_118299 - BLOCK
    )
    :vars
    (
      ?auto_118301 - BLOCK
      ?auto_118300 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118294 ?auto_118295 ) ) ( not ( = ?auto_118294 ?auto_118296 ) ) ( not ( = ?auto_118294 ?auto_118297 ) ) ( not ( = ?auto_118294 ?auto_118298 ) ) ( not ( = ?auto_118294 ?auto_118299 ) ) ( not ( = ?auto_118295 ?auto_118296 ) ) ( not ( = ?auto_118295 ?auto_118297 ) ) ( not ( = ?auto_118295 ?auto_118298 ) ) ( not ( = ?auto_118295 ?auto_118299 ) ) ( not ( = ?auto_118296 ?auto_118297 ) ) ( not ( = ?auto_118296 ?auto_118298 ) ) ( not ( = ?auto_118296 ?auto_118299 ) ) ( not ( = ?auto_118297 ?auto_118298 ) ) ( not ( = ?auto_118297 ?auto_118299 ) ) ( not ( = ?auto_118298 ?auto_118299 ) ) ( ON ?auto_118299 ?auto_118301 ) ( not ( = ?auto_118294 ?auto_118301 ) ) ( not ( = ?auto_118295 ?auto_118301 ) ) ( not ( = ?auto_118296 ?auto_118301 ) ) ( not ( = ?auto_118297 ?auto_118301 ) ) ( not ( = ?auto_118298 ?auto_118301 ) ) ( not ( = ?auto_118299 ?auto_118301 ) ) ( ON-TABLE ?auto_118301 ) ( ON ?auto_118294 ?auto_118300 ) ( not ( = ?auto_118294 ?auto_118300 ) ) ( not ( = ?auto_118295 ?auto_118300 ) ) ( not ( = ?auto_118296 ?auto_118300 ) ) ( not ( = ?auto_118297 ?auto_118300 ) ) ( not ( = ?auto_118298 ?auto_118300 ) ) ( not ( = ?auto_118299 ?auto_118300 ) ) ( not ( = ?auto_118301 ?auto_118300 ) ) ( ON ?auto_118295 ?auto_118294 ) ( ON-TABLE ?auto_118300 ) ( ON ?auto_118296 ?auto_118295 ) ( ON ?auto_118297 ?auto_118296 ) ( CLEAR ?auto_118299 ) ( ON ?auto_118298 ?auto_118297 ) ( CLEAR ?auto_118298 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_118300 ?auto_118294 ?auto_118295 ?auto_118296 ?auto_118297 )
      ( MAKE-6PILE ?auto_118294 ?auto_118295 ?auto_118296 ?auto_118297 ?auto_118298 ?auto_118299 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_118302 - BLOCK
      ?auto_118303 - BLOCK
      ?auto_118304 - BLOCK
      ?auto_118305 - BLOCK
      ?auto_118306 - BLOCK
      ?auto_118307 - BLOCK
    )
    :vars
    (
      ?auto_118308 - BLOCK
      ?auto_118309 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118302 ?auto_118303 ) ) ( not ( = ?auto_118302 ?auto_118304 ) ) ( not ( = ?auto_118302 ?auto_118305 ) ) ( not ( = ?auto_118302 ?auto_118306 ) ) ( not ( = ?auto_118302 ?auto_118307 ) ) ( not ( = ?auto_118303 ?auto_118304 ) ) ( not ( = ?auto_118303 ?auto_118305 ) ) ( not ( = ?auto_118303 ?auto_118306 ) ) ( not ( = ?auto_118303 ?auto_118307 ) ) ( not ( = ?auto_118304 ?auto_118305 ) ) ( not ( = ?auto_118304 ?auto_118306 ) ) ( not ( = ?auto_118304 ?auto_118307 ) ) ( not ( = ?auto_118305 ?auto_118306 ) ) ( not ( = ?auto_118305 ?auto_118307 ) ) ( not ( = ?auto_118306 ?auto_118307 ) ) ( not ( = ?auto_118302 ?auto_118308 ) ) ( not ( = ?auto_118303 ?auto_118308 ) ) ( not ( = ?auto_118304 ?auto_118308 ) ) ( not ( = ?auto_118305 ?auto_118308 ) ) ( not ( = ?auto_118306 ?auto_118308 ) ) ( not ( = ?auto_118307 ?auto_118308 ) ) ( ON-TABLE ?auto_118308 ) ( ON ?auto_118302 ?auto_118309 ) ( not ( = ?auto_118302 ?auto_118309 ) ) ( not ( = ?auto_118303 ?auto_118309 ) ) ( not ( = ?auto_118304 ?auto_118309 ) ) ( not ( = ?auto_118305 ?auto_118309 ) ) ( not ( = ?auto_118306 ?auto_118309 ) ) ( not ( = ?auto_118307 ?auto_118309 ) ) ( not ( = ?auto_118308 ?auto_118309 ) ) ( ON ?auto_118303 ?auto_118302 ) ( ON-TABLE ?auto_118309 ) ( ON ?auto_118304 ?auto_118303 ) ( ON ?auto_118305 ?auto_118304 ) ( ON ?auto_118306 ?auto_118305 ) ( CLEAR ?auto_118306 ) ( HOLDING ?auto_118307 ) ( CLEAR ?auto_118308 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_118308 ?auto_118307 )
      ( MAKE-6PILE ?auto_118302 ?auto_118303 ?auto_118304 ?auto_118305 ?auto_118306 ?auto_118307 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_118310 - BLOCK
      ?auto_118311 - BLOCK
      ?auto_118312 - BLOCK
      ?auto_118313 - BLOCK
      ?auto_118314 - BLOCK
      ?auto_118315 - BLOCK
    )
    :vars
    (
      ?auto_118316 - BLOCK
      ?auto_118317 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118310 ?auto_118311 ) ) ( not ( = ?auto_118310 ?auto_118312 ) ) ( not ( = ?auto_118310 ?auto_118313 ) ) ( not ( = ?auto_118310 ?auto_118314 ) ) ( not ( = ?auto_118310 ?auto_118315 ) ) ( not ( = ?auto_118311 ?auto_118312 ) ) ( not ( = ?auto_118311 ?auto_118313 ) ) ( not ( = ?auto_118311 ?auto_118314 ) ) ( not ( = ?auto_118311 ?auto_118315 ) ) ( not ( = ?auto_118312 ?auto_118313 ) ) ( not ( = ?auto_118312 ?auto_118314 ) ) ( not ( = ?auto_118312 ?auto_118315 ) ) ( not ( = ?auto_118313 ?auto_118314 ) ) ( not ( = ?auto_118313 ?auto_118315 ) ) ( not ( = ?auto_118314 ?auto_118315 ) ) ( not ( = ?auto_118310 ?auto_118316 ) ) ( not ( = ?auto_118311 ?auto_118316 ) ) ( not ( = ?auto_118312 ?auto_118316 ) ) ( not ( = ?auto_118313 ?auto_118316 ) ) ( not ( = ?auto_118314 ?auto_118316 ) ) ( not ( = ?auto_118315 ?auto_118316 ) ) ( ON-TABLE ?auto_118316 ) ( ON ?auto_118310 ?auto_118317 ) ( not ( = ?auto_118310 ?auto_118317 ) ) ( not ( = ?auto_118311 ?auto_118317 ) ) ( not ( = ?auto_118312 ?auto_118317 ) ) ( not ( = ?auto_118313 ?auto_118317 ) ) ( not ( = ?auto_118314 ?auto_118317 ) ) ( not ( = ?auto_118315 ?auto_118317 ) ) ( not ( = ?auto_118316 ?auto_118317 ) ) ( ON ?auto_118311 ?auto_118310 ) ( ON-TABLE ?auto_118317 ) ( ON ?auto_118312 ?auto_118311 ) ( ON ?auto_118313 ?auto_118312 ) ( ON ?auto_118314 ?auto_118313 ) ( CLEAR ?auto_118316 ) ( ON ?auto_118315 ?auto_118314 ) ( CLEAR ?auto_118315 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_118317 ?auto_118310 ?auto_118311 ?auto_118312 ?auto_118313 ?auto_118314 )
      ( MAKE-6PILE ?auto_118310 ?auto_118311 ?auto_118312 ?auto_118313 ?auto_118314 ?auto_118315 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_118318 - BLOCK
      ?auto_118319 - BLOCK
      ?auto_118320 - BLOCK
      ?auto_118321 - BLOCK
      ?auto_118322 - BLOCK
      ?auto_118323 - BLOCK
    )
    :vars
    (
      ?auto_118324 - BLOCK
      ?auto_118325 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118318 ?auto_118319 ) ) ( not ( = ?auto_118318 ?auto_118320 ) ) ( not ( = ?auto_118318 ?auto_118321 ) ) ( not ( = ?auto_118318 ?auto_118322 ) ) ( not ( = ?auto_118318 ?auto_118323 ) ) ( not ( = ?auto_118319 ?auto_118320 ) ) ( not ( = ?auto_118319 ?auto_118321 ) ) ( not ( = ?auto_118319 ?auto_118322 ) ) ( not ( = ?auto_118319 ?auto_118323 ) ) ( not ( = ?auto_118320 ?auto_118321 ) ) ( not ( = ?auto_118320 ?auto_118322 ) ) ( not ( = ?auto_118320 ?auto_118323 ) ) ( not ( = ?auto_118321 ?auto_118322 ) ) ( not ( = ?auto_118321 ?auto_118323 ) ) ( not ( = ?auto_118322 ?auto_118323 ) ) ( not ( = ?auto_118318 ?auto_118324 ) ) ( not ( = ?auto_118319 ?auto_118324 ) ) ( not ( = ?auto_118320 ?auto_118324 ) ) ( not ( = ?auto_118321 ?auto_118324 ) ) ( not ( = ?auto_118322 ?auto_118324 ) ) ( not ( = ?auto_118323 ?auto_118324 ) ) ( ON ?auto_118318 ?auto_118325 ) ( not ( = ?auto_118318 ?auto_118325 ) ) ( not ( = ?auto_118319 ?auto_118325 ) ) ( not ( = ?auto_118320 ?auto_118325 ) ) ( not ( = ?auto_118321 ?auto_118325 ) ) ( not ( = ?auto_118322 ?auto_118325 ) ) ( not ( = ?auto_118323 ?auto_118325 ) ) ( not ( = ?auto_118324 ?auto_118325 ) ) ( ON ?auto_118319 ?auto_118318 ) ( ON-TABLE ?auto_118325 ) ( ON ?auto_118320 ?auto_118319 ) ( ON ?auto_118321 ?auto_118320 ) ( ON ?auto_118322 ?auto_118321 ) ( ON ?auto_118323 ?auto_118322 ) ( CLEAR ?auto_118323 ) ( HOLDING ?auto_118324 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_118324 )
      ( MAKE-6PILE ?auto_118318 ?auto_118319 ?auto_118320 ?auto_118321 ?auto_118322 ?auto_118323 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_118326 - BLOCK
      ?auto_118327 - BLOCK
      ?auto_118328 - BLOCK
      ?auto_118329 - BLOCK
      ?auto_118330 - BLOCK
      ?auto_118331 - BLOCK
    )
    :vars
    (
      ?auto_118332 - BLOCK
      ?auto_118333 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118326 ?auto_118327 ) ) ( not ( = ?auto_118326 ?auto_118328 ) ) ( not ( = ?auto_118326 ?auto_118329 ) ) ( not ( = ?auto_118326 ?auto_118330 ) ) ( not ( = ?auto_118326 ?auto_118331 ) ) ( not ( = ?auto_118327 ?auto_118328 ) ) ( not ( = ?auto_118327 ?auto_118329 ) ) ( not ( = ?auto_118327 ?auto_118330 ) ) ( not ( = ?auto_118327 ?auto_118331 ) ) ( not ( = ?auto_118328 ?auto_118329 ) ) ( not ( = ?auto_118328 ?auto_118330 ) ) ( not ( = ?auto_118328 ?auto_118331 ) ) ( not ( = ?auto_118329 ?auto_118330 ) ) ( not ( = ?auto_118329 ?auto_118331 ) ) ( not ( = ?auto_118330 ?auto_118331 ) ) ( not ( = ?auto_118326 ?auto_118332 ) ) ( not ( = ?auto_118327 ?auto_118332 ) ) ( not ( = ?auto_118328 ?auto_118332 ) ) ( not ( = ?auto_118329 ?auto_118332 ) ) ( not ( = ?auto_118330 ?auto_118332 ) ) ( not ( = ?auto_118331 ?auto_118332 ) ) ( ON ?auto_118326 ?auto_118333 ) ( not ( = ?auto_118326 ?auto_118333 ) ) ( not ( = ?auto_118327 ?auto_118333 ) ) ( not ( = ?auto_118328 ?auto_118333 ) ) ( not ( = ?auto_118329 ?auto_118333 ) ) ( not ( = ?auto_118330 ?auto_118333 ) ) ( not ( = ?auto_118331 ?auto_118333 ) ) ( not ( = ?auto_118332 ?auto_118333 ) ) ( ON ?auto_118327 ?auto_118326 ) ( ON-TABLE ?auto_118333 ) ( ON ?auto_118328 ?auto_118327 ) ( ON ?auto_118329 ?auto_118328 ) ( ON ?auto_118330 ?auto_118329 ) ( ON ?auto_118331 ?auto_118330 ) ( ON ?auto_118332 ?auto_118331 ) ( CLEAR ?auto_118332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_118333 ?auto_118326 ?auto_118327 ?auto_118328 ?auto_118329 ?auto_118330 ?auto_118331 )
      ( MAKE-6PILE ?auto_118326 ?auto_118327 ?auto_118328 ?auto_118329 ?auto_118330 ?auto_118331 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_118341 - BLOCK
      ?auto_118342 - BLOCK
      ?auto_118343 - BLOCK
      ?auto_118344 - BLOCK
      ?auto_118345 - BLOCK
      ?auto_118346 - BLOCK
      ?auto_118347 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_118347 ) ( CLEAR ?auto_118346 ) ( ON-TABLE ?auto_118341 ) ( ON ?auto_118342 ?auto_118341 ) ( ON ?auto_118343 ?auto_118342 ) ( ON ?auto_118344 ?auto_118343 ) ( ON ?auto_118345 ?auto_118344 ) ( ON ?auto_118346 ?auto_118345 ) ( not ( = ?auto_118341 ?auto_118342 ) ) ( not ( = ?auto_118341 ?auto_118343 ) ) ( not ( = ?auto_118341 ?auto_118344 ) ) ( not ( = ?auto_118341 ?auto_118345 ) ) ( not ( = ?auto_118341 ?auto_118346 ) ) ( not ( = ?auto_118341 ?auto_118347 ) ) ( not ( = ?auto_118342 ?auto_118343 ) ) ( not ( = ?auto_118342 ?auto_118344 ) ) ( not ( = ?auto_118342 ?auto_118345 ) ) ( not ( = ?auto_118342 ?auto_118346 ) ) ( not ( = ?auto_118342 ?auto_118347 ) ) ( not ( = ?auto_118343 ?auto_118344 ) ) ( not ( = ?auto_118343 ?auto_118345 ) ) ( not ( = ?auto_118343 ?auto_118346 ) ) ( not ( = ?auto_118343 ?auto_118347 ) ) ( not ( = ?auto_118344 ?auto_118345 ) ) ( not ( = ?auto_118344 ?auto_118346 ) ) ( not ( = ?auto_118344 ?auto_118347 ) ) ( not ( = ?auto_118345 ?auto_118346 ) ) ( not ( = ?auto_118345 ?auto_118347 ) ) ( not ( = ?auto_118346 ?auto_118347 ) ) )
    :subtasks
    ( ( !STACK ?auto_118347 ?auto_118346 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_118348 - BLOCK
      ?auto_118349 - BLOCK
      ?auto_118350 - BLOCK
      ?auto_118351 - BLOCK
      ?auto_118352 - BLOCK
      ?auto_118353 - BLOCK
      ?auto_118354 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_118353 ) ( ON-TABLE ?auto_118348 ) ( ON ?auto_118349 ?auto_118348 ) ( ON ?auto_118350 ?auto_118349 ) ( ON ?auto_118351 ?auto_118350 ) ( ON ?auto_118352 ?auto_118351 ) ( ON ?auto_118353 ?auto_118352 ) ( not ( = ?auto_118348 ?auto_118349 ) ) ( not ( = ?auto_118348 ?auto_118350 ) ) ( not ( = ?auto_118348 ?auto_118351 ) ) ( not ( = ?auto_118348 ?auto_118352 ) ) ( not ( = ?auto_118348 ?auto_118353 ) ) ( not ( = ?auto_118348 ?auto_118354 ) ) ( not ( = ?auto_118349 ?auto_118350 ) ) ( not ( = ?auto_118349 ?auto_118351 ) ) ( not ( = ?auto_118349 ?auto_118352 ) ) ( not ( = ?auto_118349 ?auto_118353 ) ) ( not ( = ?auto_118349 ?auto_118354 ) ) ( not ( = ?auto_118350 ?auto_118351 ) ) ( not ( = ?auto_118350 ?auto_118352 ) ) ( not ( = ?auto_118350 ?auto_118353 ) ) ( not ( = ?auto_118350 ?auto_118354 ) ) ( not ( = ?auto_118351 ?auto_118352 ) ) ( not ( = ?auto_118351 ?auto_118353 ) ) ( not ( = ?auto_118351 ?auto_118354 ) ) ( not ( = ?auto_118352 ?auto_118353 ) ) ( not ( = ?auto_118352 ?auto_118354 ) ) ( not ( = ?auto_118353 ?auto_118354 ) ) ( ON-TABLE ?auto_118354 ) ( CLEAR ?auto_118354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_118354 )
      ( MAKE-7PILE ?auto_118348 ?auto_118349 ?auto_118350 ?auto_118351 ?auto_118352 ?auto_118353 ?auto_118354 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_118355 - BLOCK
      ?auto_118356 - BLOCK
      ?auto_118357 - BLOCK
      ?auto_118358 - BLOCK
      ?auto_118359 - BLOCK
      ?auto_118360 - BLOCK
      ?auto_118361 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_118355 ) ( ON ?auto_118356 ?auto_118355 ) ( ON ?auto_118357 ?auto_118356 ) ( ON ?auto_118358 ?auto_118357 ) ( ON ?auto_118359 ?auto_118358 ) ( not ( = ?auto_118355 ?auto_118356 ) ) ( not ( = ?auto_118355 ?auto_118357 ) ) ( not ( = ?auto_118355 ?auto_118358 ) ) ( not ( = ?auto_118355 ?auto_118359 ) ) ( not ( = ?auto_118355 ?auto_118360 ) ) ( not ( = ?auto_118355 ?auto_118361 ) ) ( not ( = ?auto_118356 ?auto_118357 ) ) ( not ( = ?auto_118356 ?auto_118358 ) ) ( not ( = ?auto_118356 ?auto_118359 ) ) ( not ( = ?auto_118356 ?auto_118360 ) ) ( not ( = ?auto_118356 ?auto_118361 ) ) ( not ( = ?auto_118357 ?auto_118358 ) ) ( not ( = ?auto_118357 ?auto_118359 ) ) ( not ( = ?auto_118357 ?auto_118360 ) ) ( not ( = ?auto_118357 ?auto_118361 ) ) ( not ( = ?auto_118358 ?auto_118359 ) ) ( not ( = ?auto_118358 ?auto_118360 ) ) ( not ( = ?auto_118358 ?auto_118361 ) ) ( not ( = ?auto_118359 ?auto_118360 ) ) ( not ( = ?auto_118359 ?auto_118361 ) ) ( not ( = ?auto_118360 ?auto_118361 ) ) ( ON-TABLE ?auto_118361 ) ( CLEAR ?auto_118361 ) ( HOLDING ?auto_118360 ) ( CLEAR ?auto_118359 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_118355 ?auto_118356 ?auto_118357 ?auto_118358 ?auto_118359 ?auto_118360 )
      ( MAKE-7PILE ?auto_118355 ?auto_118356 ?auto_118357 ?auto_118358 ?auto_118359 ?auto_118360 ?auto_118361 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_118362 - BLOCK
      ?auto_118363 - BLOCK
      ?auto_118364 - BLOCK
      ?auto_118365 - BLOCK
      ?auto_118366 - BLOCK
      ?auto_118367 - BLOCK
      ?auto_118368 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_118362 ) ( ON ?auto_118363 ?auto_118362 ) ( ON ?auto_118364 ?auto_118363 ) ( ON ?auto_118365 ?auto_118364 ) ( ON ?auto_118366 ?auto_118365 ) ( not ( = ?auto_118362 ?auto_118363 ) ) ( not ( = ?auto_118362 ?auto_118364 ) ) ( not ( = ?auto_118362 ?auto_118365 ) ) ( not ( = ?auto_118362 ?auto_118366 ) ) ( not ( = ?auto_118362 ?auto_118367 ) ) ( not ( = ?auto_118362 ?auto_118368 ) ) ( not ( = ?auto_118363 ?auto_118364 ) ) ( not ( = ?auto_118363 ?auto_118365 ) ) ( not ( = ?auto_118363 ?auto_118366 ) ) ( not ( = ?auto_118363 ?auto_118367 ) ) ( not ( = ?auto_118363 ?auto_118368 ) ) ( not ( = ?auto_118364 ?auto_118365 ) ) ( not ( = ?auto_118364 ?auto_118366 ) ) ( not ( = ?auto_118364 ?auto_118367 ) ) ( not ( = ?auto_118364 ?auto_118368 ) ) ( not ( = ?auto_118365 ?auto_118366 ) ) ( not ( = ?auto_118365 ?auto_118367 ) ) ( not ( = ?auto_118365 ?auto_118368 ) ) ( not ( = ?auto_118366 ?auto_118367 ) ) ( not ( = ?auto_118366 ?auto_118368 ) ) ( not ( = ?auto_118367 ?auto_118368 ) ) ( ON-TABLE ?auto_118368 ) ( CLEAR ?auto_118366 ) ( ON ?auto_118367 ?auto_118368 ) ( CLEAR ?auto_118367 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_118368 )
      ( MAKE-7PILE ?auto_118362 ?auto_118363 ?auto_118364 ?auto_118365 ?auto_118366 ?auto_118367 ?auto_118368 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_118369 - BLOCK
      ?auto_118370 - BLOCK
      ?auto_118371 - BLOCK
      ?auto_118372 - BLOCK
      ?auto_118373 - BLOCK
      ?auto_118374 - BLOCK
      ?auto_118375 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_118369 ) ( ON ?auto_118370 ?auto_118369 ) ( ON ?auto_118371 ?auto_118370 ) ( ON ?auto_118372 ?auto_118371 ) ( not ( = ?auto_118369 ?auto_118370 ) ) ( not ( = ?auto_118369 ?auto_118371 ) ) ( not ( = ?auto_118369 ?auto_118372 ) ) ( not ( = ?auto_118369 ?auto_118373 ) ) ( not ( = ?auto_118369 ?auto_118374 ) ) ( not ( = ?auto_118369 ?auto_118375 ) ) ( not ( = ?auto_118370 ?auto_118371 ) ) ( not ( = ?auto_118370 ?auto_118372 ) ) ( not ( = ?auto_118370 ?auto_118373 ) ) ( not ( = ?auto_118370 ?auto_118374 ) ) ( not ( = ?auto_118370 ?auto_118375 ) ) ( not ( = ?auto_118371 ?auto_118372 ) ) ( not ( = ?auto_118371 ?auto_118373 ) ) ( not ( = ?auto_118371 ?auto_118374 ) ) ( not ( = ?auto_118371 ?auto_118375 ) ) ( not ( = ?auto_118372 ?auto_118373 ) ) ( not ( = ?auto_118372 ?auto_118374 ) ) ( not ( = ?auto_118372 ?auto_118375 ) ) ( not ( = ?auto_118373 ?auto_118374 ) ) ( not ( = ?auto_118373 ?auto_118375 ) ) ( not ( = ?auto_118374 ?auto_118375 ) ) ( ON-TABLE ?auto_118375 ) ( ON ?auto_118374 ?auto_118375 ) ( CLEAR ?auto_118374 ) ( HOLDING ?auto_118373 ) ( CLEAR ?auto_118372 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_118369 ?auto_118370 ?auto_118371 ?auto_118372 ?auto_118373 )
      ( MAKE-7PILE ?auto_118369 ?auto_118370 ?auto_118371 ?auto_118372 ?auto_118373 ?auto_118374 ?auto_118375 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_118376 - BLOCK
      ?auto_118377 - BLOCK
      ?auto_118378 - BLOCK
      ?auto_118379 - BLOCK
      ?auto_118380 - BLOCK
      ?auto_118381 - BLOCK
      ?auto_118382 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_118376 ) ( ON ?auto_118377 ?auto_118376 ) ( ON ?auto_118378 ?auto_118377 ) ( ON ?auto_118379 ?auto_118378 ) ( not ( = ?auto_118376 ?auto_118377 ) ) ( not ( = ?auto_118376 ?auto_118378 ) ) ( not ( = ?auto_118376 ?auto_118379 ) ) ( not ( = ?auto_118376 ?auto_118380 ) ) ( not ( = ?auto_118376 ?auto_118381 ) ) ( not ( = ?auto_118376 ?auto_118382 ) ) ( not ( = ?auto_118377 ?auto_118378 ) ) ( not ( = ?auto_118377 ?auto_118379 ) ) ( not ( = ?auto_118377 ?auto_118380 ) ) ( not ( = ?auto_118377 ?auto_118381 ) ) ( not ( = ?auto_118377 ?auto_118382 ) ) ( not ( = ?auto_118378 ?auto_118379 ) ) ( not ( = ?auto_118378 ?auto_118380 ) ) ( not ( = ?auto_118378 ?auto_118381 ) ) ( not ( = ?auto_118378 ?auto_118382 ) ) ( not ( = ?auto_118379 ?auto_118380 ) ) ( not ( = ?auto_118379 ?auto_118381 ) ) ( not ( = ?auto_118379 ?auto_118382 ) ) ( not ( = ?auto_118380 ?auto_118381 ) ) ( not ( = ?auto_118380 ?auto_118382 ) ) ( not ( = ?auto_118381 ?auto_118382 ) ) ( ON-TABLE ?auto_118382 ) ( ON ?auto_118381 ?auto_118382 ) ( CLEAR ?auto_118379 ) ( ON ?auto_118380 ?auto_118381 ) ( CLEAR ?auto_118380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_118382 ?auto_118381 )
      ( MAKE-7PILE ?auto_118376 ?auto_118377 ?auto_118378 ?auto_118379 ?auto_118380 ?auto_118381 ?auto_118382 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_118383 - BLOCK
      ?auto_118384 - BLOCK
      ?auto_118385 - BLOCK
      ?auto_118386 - BLOCK
      ?auto_118387 - BLOCK
      ?auto_118388 - BLOCK
      ?auto_118389 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_118383 ) ( ON ?auto_118384 ?auto_118383 ) ( ON ?auto_118385 ?auto_118384 ) ( not ( = ?auto_118383 ?auto_118384 ) ) ( not ( = ?auto_118383 ?auto_118385 ) ) ( not ( = ?auto_118383 ?auto_118386 ) ) ( not ( = ?auto_118383 ?auto_118387 ) ) ( not ( = ?auto_118383 ?auto_118388 ) ) ( not ( = ?auto_118383 ?auto_118389 ) ) ( not ( = ?auto_118384 ?auto_118385 ) ) ( not ( = ?auto_118384 ?auto_118386 ) ) ( not ( = ?auto_118384 ?auto_118387 ) ) ( not ( = ?auto_118384 ?auto_118388 ) ) ( not ( = ?auto_118384 ?auto_118389 ) ) ( not ( = ?auto_118385 ?auto_118386 ) ) ( not ( = ?auto_118385 ?auto_118387 ) ) ( not ( = ?auto_118385 ?auto_118388 ) ) ( not ( = ?auto_118385 ?auto_118389 ) ) ( not ( = ?auto_118386 ?auto_118387 ) ) ( not ( = ?auto_118386 ?auto_118388 ) ) ( not ( = ?auto_118386 ?auto_118389 ) ) ( not ( = ?auto_118387 ?auto_118388 ) ) ( not ( = ?auto_118387 ?auto_118389 ) ) ( not ( = ?auto_118388 ?auto_118389 ) ) ( ON-TABLE ?auto_118389 ) ( ON ?auto_118388 ?auto_118389 ) ( ON ?auto_118387 ?auto_118388 ) ( CLEAR ?auto_118387 ) ( HOLDING ?auto_118386 ) ( CLEAR ?auto_118385 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_118383 ?auto_118384 ?auto_118385 ?auto_118386 )
      ( MAKE-7PILE ?auto_118383 ?auto_118384 ?auto_118385 ?auto_118386 ?auto_118387 ?auto_118388 ?auto_118389 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_118390 - BLOCK
      ?auto_118391 - BLOCK
      ?auto_118392 - BLOCK
      ?auto_118393 - BLOCK
      ?auto_118394 - BLOCK
      ?auto_118395 - BLOCK
      ?auto_118396 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_118390 ) ( ON ?auto_118391 ?auto_118390 ) ( ON ?auto_118392 ?auto_118391 ) ( not ( = ?auto_118390 ?auto_118391 ) ) ( not ( = ?auto_118390 ?auto_118392 ) ) ( not ( = ?auto_118390 ?auto_118393 ) ) ( not ( = ?auto_118390 ?auto_118394 ) ) ( not ( = ?auto_118390 ?auto_118395 ) ) ( not ( = ?auto_118390 ?auto_118396 ) ) ( not ( = ?auto_118391 ?auto_118392 ) ) ( not ( = ?auto_118391 ?auto_118393 ) ) ( not ( = ?auto_118391 ?auto_118394 ) ) ( not ( = ?auto_118391 ?auto_118395 ) ) ( not ( = ?auto_118391 ?auto_118396 ) ) ( not ( = ?auto_118392 ?auto_118393 ) ) ( not ( = ?auto_118392 ?auto_118394 ) ) ( not ( = ?auto_118392 ?auto_118395 ) ) ( not ( = ?auto_118392 ?auto_118396 ) ) ( not ( = ?auto_118393 ?auto_118394 ) ) ( not ( = ?auto_118393 ?auto_118395 ) ) ( not ( = ?auto_118393 ?auto_118396 ) ) ( not ( = ?auto_118394 ?auto_118395 ) ) ( not ( = ?auto_118394 ?auto_118396 ) ) ( not ( = ?auto_118395 ?auto_118396 ) ) ( ON-TABLE ?auto_118396 ) ( ON ?auto_118395 ?auto_118396 ) ( ON ?auto_118394 ?auto_118395 ) ( CLEAR ?auto_118392 ) ( ON ?auto_118393 ?auto_118394 ) ( CLEAR ?auto_118393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_118396 ?auto_118395 ?auto_118394 )
      ( MAKE-7PILE ?auto_118390 ?auto_118391 ?auto_118392 ?auto_118393 ?auto_118394 ?auto_118395 ?auto_118396 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_118397 - BLOCK
      ?auto_118398 - BLOCK
      ?auto_118399 - BLOCK
      ?auto_118400 - BLOCK
      ?auto_118401 - BLOCK
      ?auto_118402 - BLOCK
      ?auto_118403 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_118397 ) ( ON ?auto_118398 ?auto_118397 ) ( not ( = ?auto_118397 ?auto_118398 ) ) ( not ( = ?auto_118397 ?auto_118399 ) ) ( not ( = ?auto_118397 ?auto_118400 ) ) ( not ( = ?auto_118397 ?auto_118401 ) ) ( not ( = ?auto_118397 ?auto_118402 ) ) ( not ( = ?auto_118397 ?auto_118403 ) ) ( not ( = ?auto_118398 ?auto_118399 ) ) ( not ( = ?auto_118398 ?auto_118400 ) ) ( not ( = ?auto_118398 ?auto_118401 ) ) ( not ( = ?auto_118398 ?auto_118402 ) ) ( not ( = ?auto_118398 ?auto_118403 ) ) ( not ( = ?auto_118399 ?auto_118400 ) ) ( not ( = ?auto_118399 ?auto_118401 ) ) ( not ( = ?auto_118399 ?auto_118402 ) ) ( not ( = ?auto_118399 ?auto_118403 ) ) ( not ( = ?auto_118400 ?auto_118401 ) ) ( not ( = ?auto_118400 ?auto_118402 ) ) ( not ( = ?auto_118400 ?auto_118403 ) ) ( not ( = ?auto_118401 ?auto_118402 ) ) ( not ( = ?auto_118401 ?auto_118403 ) ) ( not ( = ?auto_118402 ?auto_118403 ) ) ( ON-TABLE ?auto_118403 ) ( ON ?auto_118402 ?auto_118403 ) ( ON ?auto_118401 ?auto_118402 ) ( ON ?auto_118400 ?auto_118401 ) ( CLEAR ?auto_118400 ) ( HOLDING ?auto_118399 ) ( CLEAR ?auto_118398 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_118397 ?auto_118398 ?auto_118399 )
      ( MAKE-7PILE ?auto_118397 ?auto_118398 ?auto_118399 ?auto_118400 ?auto_118401 ?auto_118402 ?auto_118403 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_118404 - BLOCK
      ?auto_118405 - BLOCK
      ?auto_118406 - BLOCK
      ?auto_118407 - BLOCK
      ?auto_118408 - BLOCK
      ?auto_118409 - BLOCK
      ?auto_118410 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_118404 ) ( ON ?auto_118405 ?auto_118404 ) ( not ( = ?auto_118404 ?auto_118405 ) ) ( not ( = ?auto_118404 ?auto_118406 ) ) ( not ( = ?auto_118404 ?auto_118407 ) ) ( not ( = ?auto_118404 ?auto_118408 ) ) ( not ( = ?auto_118404 ?auto_118409 ) ) ( not ( = ?auto_118404 ?auto_118410 ) ) ( not ( = ?auto_118405 ?auto_118406 ) ) ( not ( = ?auto_118405 ?auto_118407 ) ) ( not ( = ?auto_118405 ?auto_118408 ) ) ( not ( = ?auto_118405 ?auto_118409 ) ) ( not ( = ?auto_118405 ?auto_118410 ) ) ( not ( = ?auto_118406 ?auto_118407 ) ) ( not ( = ?auto_118406 ?auto_118408 ) ) ( not ( = ?auto_118406 ?auto_118409 ) ) ( not ( = ?auto_118406 ?auto_118410 ) ) ( not ( = ?auto_118407 ?auto_118408 ) ) ( not ( = ?auto_118407 ?auto_118409 ) ) ( not ( = ?auto_118407 ?auto_118410 ) ) ( not ( = ?auto_118408 ?auto_118409 ) ) ( not ( = ?auto_118408 ?auto_118410 ) ) ( not ( = ?auto_118409 ?auto_118410 ) ) ( ON-TABLE ?auto_118410 ) ( ON ?auto_118409 ?auto_118410 ) ( ON ?auto_118408 ?auto_118409 ) ( ON ?auto_118407 ?auto_118408 ) ( CLEAR ?auto_118405 ) ( ON ?auto_118406 ?auto_118407 ) ( CLEAR ?auto_118406 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_118410 ?auto_118409 ?auto_118408 ?auto_118407 )
      ( MAKE-7PILE ?auto_118404 ?auto_118405 ?auto_118406 ?auto_118407 ?auto_118408 ?auto_118409 ?auto_118410 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_118411 - BLOCK
      ?auto_118412 - BLOCK
      ?auto_118413 - BLOCK
      ?auto_118414 - BLOCK
      ?auto_118415 - BLOCK
      ?auto_118416 - BLOCK
      ?auto_118417 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_118411 ) ( not ( = ?auto_118411 ?auto_118412 ) ) ( not ( = ?auto_118411 ?auto_118413 ) ) ( not ( = ?auto_118411 ?auto_118414 ) ) ( not ( = ?auto_118411 ?auto_118415 ) ) ( not ( = ?auto_118411 ?auto_118416 ) ) ( not ( = ?auto_118411 ?auto_118417 ) ) ( not ( = ?auto_118412 ?auto_118413 ) ) ( not ( = ?auto_118412 ?auto_118414 ) ) ( not ( = ?auto_118412 ?auto_118415 ) ) ( not ( = ?auto_118412 ?auto_118416 ) ) ( not ( = ?auto_118412 ?auto_118417 ) ) ( not ( = ?auto_118413 ?auto_118414 ) ) ( not ( = ?auto_118413 ?auto_118415 ) ) ( not ( = ?auto_118413 ?auto_118416 ) ) ( not ( = ?auto_118413 ?auto_118417 ) ) ( not ( = ?auto_118414 ?auto_118415 ) ) ( not ( = ?auto_118414 ?auto_118416 ) ) ( not ( = ?auto_118414 ?auto_118417 ) ) ( not ( = ?auto_118415 ?auto_118416 ) ) ( not ( = ?auto_118415 ?auto_118417 ) ) ( not ( = ?auto_118416 ?auto_118417 ) ) ( ON-TABLE ?auto_118417 ) ( ON ?auto_118416 ?auto_118417 ) ( ON ?auto_118415 ?auto_118416 ) ( ON ?auto_118414 ?auto_118415 ) ( ON ?auto_118413 ?auto_118414 ) ( CLEAR ?auto_118413 ) ( HOLDING ?auto_118412 ) ( CLEAR ?auto_118411 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_118411 ?auto_118412 )
      ( MAKE-7PILE ?auto_118411 ?auto_118412 ?auto_118413 ?auto_118414 ?auto_118415 ?auto_118416 ?auto_118417 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_118418 - BLOCK
      ?auto_118419 - BLOCK
      ?auto_118420 - BLOCK
      ?auto_118421 - BLOCK
      ?auto_118422 - BLOCK
      ?auto_118423 - BLOCK
      ?auto_118424 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_118418 ) ( not ( = ?auto_118418 ?auto_118419 ) ) ( not ( = ?auto_118418 ?auto_118420 ) ) ( not ( = ?auto_118418 ?auto_118421 ) ) ( not ( = ?auto_118418 ?auto_118422 ) ) ( not ( = ?auto_118418 ?auto_118423 ) ) ( not ( = ?auto_118418 ?auto_118424 ) ) ( not ( = ?auto_118419 ?auto_118420 ) ) ( not ( = ?auto_118419 ?auto_118421 ) ) ( not ( = ?auto_118419 ?auto_118422 ) ) ( not ( = ?auto_118419 ?auto_118423 ) ) ( not ( = ?auto_118419 ?auto_118424 ) ) ( not ( = ?auto_118420 ?auto_118421 ) ) ( not ( = ?auto_118420 ?auto_118422 ) ) ( not ( = ?auto_118420 ?auto_118423 ) ) ( not ( = ?auto_118420 ?auto_118424 ) ) ( not ( = ?auto_118421 ?auto_118422 ) ) ( not ( = ?auto_118421 ?auto_118423 ) ) ( not ( = ?auto_118421 ?auto_118424 ) ) ( not ( = ?auto_118422 ?auto_118423 ) ) ( not ( = ?auto_118422 ?auto_118424 ) ) ( not ( = ?auto_118423 ?auto_118424 ) ) ( ON-TABLE ?auto_118424 ) ( ON ?auto_118423 ?auto_118424 ) ( ON ?auto_118422 ?auto_118423 ) ( ON ?auto_118421 ?auto_118422 ) ( ON ?auto_118420 ?auto_118421 ) ( CLEAR ?auto_118418 ) ( ON ?auto_118419 ?auto_118420 ) ( CLEAR ?auto_118419 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_118424 ?auto_118423 ?auto_118422 ?auto_118421 ?auto_118420 )
      ( MAKE-7PILE ?auto_118418 ?auto_118419 ?auto_118420 ?auto_118421 ?auto_118422 ?auto_118423 ?auto_118424 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_118425 - BLOCK
      ?auto_118426 - BLOCK
      ?auto_118427 - BLOCK
      ?auto_118428 - BLOCK
      ?auto_118429 - BLOCK
      ?auto_118430 - BLOCK
      ?auto_118431 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118425 ?auto_118426 ) ) ( not ( = ?auto_118425 ?auto_118427 ) ) ( not ( = ?auto_118425 ?auto_118428 ) ) ( not ( = ?auto_118425 ?auto_118429 ) ) ( not ( = ?auto_118425 ?auto_118430 ) ) ( not ( = ?auto_118425 ?auto_118431 ) ) ( not ( = ?auto_118426 ?auto_118427 ) ) ( not ( = ?auto_118426 ?auto_118428 ) ) ( not ( = ?auto_118426 ?auto_118429 ) ) ( not ( = ?auto_118426 ?auto_118430 ) ) ( not ( = ?auto_118426 ?auto_118431 ) ) ( not ( = ?auto_118427 ?auto_118428 ) ) ( not ( = ?auto_118427 ?auto_118429 ) ) ( not ( = ?auto_118427 ?auto_118430 ) ) ( not ( = ?auto_118427 ?auto_118431 ) ) ( not ( = ?auto_118428 ?auto_118429 ) ) ( not ( = ?auto_118428 ?auto_118430 ) ) ( not ( = ?auto_118428 ?auto_118431 ) ) ( not ( = ?auto_118429 ?auto_118430 ) ) ( not ( = ?auto_118429 ?auto_118431 ) ) ( not ( = ?auto_118430 ?auto_118431 ) ) ( ON-TABLE ?auto_118431 ) ( ON ?auto_118430 ?auto_118431 ) ( ON ?auto_118429 ?auto_118430 ) ( ON ?auto_118428 ?auto_118429 ) ( ON ?auto_118427 ?auto_118428 ) ( ON ?auto_118426 ?auto_118427 ) ( CLEAR ?auto_118426 ) ( HOLDING ?auto_118425 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_118425 )
      ( MAKE-7PILE ?auto_118425 ?auto_118426 ?auto_118427 ?auto_118428 ?auto_118429 ?auto_118430 ?auto_118431 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_118432 - BLOCK
      ?auto_118433 - BLOCK
      ?auto_118434 - BLOCK
      ?auto_118435 - BLOCK
      ?auto_118436 - BLOCK
      ?auto_118437 - BLOCK
      ?auto_118438 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118432 ?auto_118433 ) ) ( not ( = ?auto_118432 ?auto_118434 ) ) ( not ( = ?auto_118432 ?auto_118435 ) ) ( not ( = ?auto_118432 ?auto_118436 ) ) ( not ( = ?auto_118432 ?auto_118437 ) ) ( not ( = ?auto_118432 ?auto_118438 ) ) ( not ( = ?auto_118433 ?auto_118434 ) ) ( not ( = ?auto_118433 ?auto_118435 ) ) ( not ( = ?auto_118433 ?auto_118436 ) ) ( not ( = ?auto_118433 ?auto_118437 ) ) ( not ( = ?auto_118433 ?auto_118438 ) ) ( not ( = ?auto_118434 ?auto_118435 ) ) ( not ( = ?auto_118434 ?auto_118436 ) ) ( not ( = ?auto_118434 ?auto_118437 ) ) ( not ( = ?auto_118434 ?auto_118438 ) ) ( not ( = ?auto_118435 ?auto_118436 ) ) ( not ( = ?auto_118435 ?auto_118437 ) ) ( not ( = ?auto_118435 ?auto_118438 ) ) ( not ( = ?auto_118436 ?auto_118437 ) ) ( not ( = ?auto_118436 ?auto_118438 ) ) ( not ( = ?auto_118437 ?auto_118438 ) ) ( ON-TABLE ?auto_118438 ) ( ON ?auto_118437 ?auto_118438 ) ( ON ?auto_118436 ?auto_118437 ) ( ON ?auto_118435 ?auto_118436 ) ( ON ?auto_118434 ?auto_118435 ) ( ON ?auto_118433 ?auto_118434 ) ( ON ?auto_118432 ?auto_118433 ) ( CLEAR ?auto_118432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_118438 ?auto_118437 ?auto_118436 ?auto_118435 ?auto_118434 ?auto_118433 )
      ( MAKE-7PILE ?auto_118432 ?auto_118433 ?auto_118434 ?auto_118435 ?auto_118436 ?auto_118437 ?auto_118438 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_118439 - BLOCK
      ?auto_118440 - BLOCK
      ?auto_118441 - BLOCK
      ?auto_118442 - BLOCK
      ?auto_118443 - BLOCK
      ?auto_118444 - BLOCK
      ?auto_118445 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118439 ?auto_118440 ) ) ( not ( = ?auto_118439 ?auto_118441 ) ) ( not ( = ?auto_118439 ?auto_118442 ) ) ( not ( = ?auto_118439 ?auto_118443 ) ) ( not ( = ?auto_118439 ?auto_118444 ) ) ( not ( = ?auto_118439 ?auto_118445 ) ) ( not ( = ?auto_118440 ?auto_118441 ) ) ( not ( = ?auto_118440 ?auto_118442 ) ) ( not ( = ?auto_118440 ?auto_118443 ) ) ( not ( = ?auto_118440 ?auto_118444 ) ) ( not ( = ?auto_118440 ?auto_118445 ) ) ( not ( = ?auto_118441 ?auto_118442 ) ) ( not ( = ?auto_118441 ?auto_118443 ) ) ( not ( = ?auto_118441 ?auto_118444 ) ) ( not ( = ?auto_118441 ?auto_118445 ) ) ( not ( = ?auto_118442 ?auto_118443 ) ) ( not ( = ?auto_118442 ?auto_118444 ) ) ( not ( = ?auto_118442 ?auto_118445 ) ) ( not ( = ?auto_118443 ?auto_118444 ) ) ( not ( = ?auto_118443 ?auto_118445 ) ) ( not ( = ?auto_118444 ?auto_118445 ) ) ( ON-TABLE ?auto_118445 ) ( ON ?auto_118444 ?auto_118445 ) ( ON ?auto_118443 ?auto_118444 ) ( ON ?auto_118442 ?auto_118443 ) ( ON ?auto_118441 ?auto_118442 ) ( ON ?auto_118440 ?auto_118441 ) ( HOLDING ?auto_118439 ) ( CLEAR ?auto_118440 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_118445 ?auto_118444 ?auto_118443 ?auto_118442 ?auto_118441 ?auto_118440 ?auto_118439 )
      ( MAKE-7PILE ?auto_118439 ?auto_118440 ?auto_118441 ?auto_118442 ?auto_118443 ?auto_118444 ?auto_118445 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_118446 - BLOCK
      ?auto_118447 - BLOCK
      ?auto_118448 - BLOCK
      ?auto_118449 - BLOCK
      ?auto_118450 - BLOCK
      ?auto_118451 - BLOCK
      ?auto_118452 - BLOCK
    )
    :vars
    (
      ?auto_118453 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118446 ?auto_118447 ) ) ( not ( = ?auto_118446 ?auto_118448 ) ) ( not ( = ?auto_118446 ?auto_118449 ) ) ( not ( = ?auto_118446 ?auto_118450 ) ) ( not ( = ?auto_118446 ?auto_118451 ) ) ( not ( = ?auto_118446 ?auto_118452 ) ) ( not ( = ?auto_118447 ?auto_118448 ) ) ( not ( = ?auto_118447 ?auto_118449 ) ) ( not ( = ?auto_118447 ?auto_118450 ) ) ( not ( = ?auto_118447 ?auto_118451 ) ) ( not ( = ?auto_118447 ?auto_118452 ) ) ( not ( = ?auto_118448 ?auto_118449 ) ) ( not ( = ?auto_118448 ?auto_118450 ) ) ( not ( = ?auto_118448 ?auto_118451 ) ) ( not ( = ?auto_118448 ?auto_118452 ) ) ( not ( = ?auto_118449 ?auto_118450 ) ) ( not ( = ?auto_118449 ?auto_118451 ) ) ( not ( = ?auto_118449 ?auto_118452 ) ) ( not ( = ?auto_118450 ?auto_118451 ) ) ( not ( = ?auto_118450 ?auto_118452 ) ) ( not ( = ?auto_118451 ?auto_118452 ) ) ( ON-TABLE ?auto_118452 ) ( ON ?auto_118451 ?auto_118452 ) ( ON ?auto_118450 ?auto_118451 ) ( ON ?auto_118449 ?auto_118450 ) ( ON ?auto_118448 ?auto_118449 ) ( ON ?auto_118447 ?auto_118448 ) ( CLEAR ?auto_118447 ) ( ON ?auto_118446 ?auto_118453 ) ( CLEAR ?auto_118446 ) ( HAND-EMPTY ) ( not ( = ?auto_118446 ?auto_118453 ) ) ( not ( = ?auto_118447 ?auto_118453 ) ) ( not ( = ?auto_118448 ?auto_118453 ) ) ( not ( = ?auto_118449 ?auto_118453 ) ) ( not ( = ?auto_118450 ?auto_118453 ) ) ( not ( = ?auto_118451 ?auto_118453 ) ) ( not ( = ?auto_118452 ?auto_118453 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_118446 ?auto_118453 )
      ( MAKE-7PILE ?auto_118446 ?auto_118447 ?auto_118448 ?auto_118449 ?auto_118450 ?auto_118451 ?auto_118452 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_118454 - BLOCK
      ?auto_118455 - BLOCK
      ?auto_118456 - BLOCK
      ?auto_118457 - BLOCK
      ?auto_118458 - BLOCK
      ?auto_118459 - BLOCK
      ?auto_118460 - BLOCK
    )
    :vars
    (
      ?auto_118461 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118454 ?auto_118455 ) ) ( not ( = ?auto_118454 ?auto_118456 ) ) ( not ( = ?auto_118454 ?auto_118457 ) ) ( not ( = ?auto_118454 ?auto_118458 ) ) ( not ( = ?auto_118454 ?auto_118459 ) ) ( not ( = ?auto_118454 ?auto_118460 ) ) ( not ( = ?auto_118455 ?auto_118456 ) ) ( not ( = ?auto_118455 ?auto_118457 ) ) ( not ( = ?auto_118455 ?auto_118458 ) ) ( not ( = ?auto_118455 ?auto_118459 ) ) ( not ( = ?auto_118455 ?auto_118460 ) ) ( not ( = ?auto_118456 ?auto_118457 ) ) ( not ( = ?auto_118456 ?auto_118458 ) ) ( not ( = ?auto_118456 ?auto_118459 ) ) ( not ( = ?auto_118456 ?auto_118460 ) ) ( not ( = ?auto_118457 ?auto_118458 ) ) ( not ( = ?auto_118457 ?auto_118459 ) ) ( not ( = ?auto_118457 ?auto_118460 ) ) ( not ( = ?auto_118458 ?auto_118459 ) ) ( not ( = ?auto_118458 ?auto_118460 ) ) ( not ( = ?auto_118459 ?auto_118460 ) ) ( ON-TABLE ?auto_118460 ) ( ON ?auto_118459 ?auto_118460 ) ( ON ?auto_118458 ?auto_118459 ) ( ON ?auto_118457 ?auto_118458 ) ( ON ?auto_118456 ?auto_118457 ) ( ON ?auto_118454 ?auto_118461 ) ( CLEAR ?auto_118454 ) ( not ( = ?auto_118454 ?auto_118461 ) ) ( not ( = ?auto_118455 ?auto_118461 ) ) ( not ( = ?auto_118456 ?auto_118461 ) ) ( not ( = ?auto_118457 ?auto_118461 ) ) ( not ( = ?auto_118458 ?auto_118461 ) ) ( not ( = ?auto_118459 ?auto_118461 ) ) ( not ( = ?auto_118460 ?auto_118461 ) ) ( HOLDING ?auto_118455 ) ( CLEAR ?auto_118456 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_118460 ?auto_118459 ?auto_118458 ?auto_118457 ?auto_118456 ?auto_118455 )
      ( MAKE-7PILE ?auto_118454 ?auto_118455 ?auto_118456 ?auto_118457 ?auto_118458 ?auto_118459 ?auto_118460 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_118462 - BLOCK
      ?auto_118463 - BLOCK
      ?auto_118464 - BLOCK
      ?auto_118465 - BLOCK
      ?auto_118466 - BLOCK
      ?auto_118467 - BLOCK
      ?auto_118468 - BLOCK
    )
    :vars
    (
      ?auto_118469 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118462 ?auto_118463 ) ) ( not ( = ?auto_118462 ?auto_118464 ) ) ( not ( = ?auto_118462 ?auto_118465 ) ) ( not ( = ?auto_118462 ?auto_118466 ) ) ( not ( = ?auto_118462 ?auto_118467 ) ) ( not ( = ?auto_118462 ?auto_118468 ) ) ( not ( = ?auto_118463 ?auto_118464 ) ) ( not ( = ?auto_118463 ?auto_118465 ) ) ( not ( = ?auto_118463 ?auto_118466 ) ) ( not ( = ?auto_118463 ?auto_118467 ) ) ( not ( = ?auto_118463 ?auto_118468 ) ) ( not ( = ?auto_118464 ?auto_118465 ) ) ( not ( = ?auto_118464 ?auto_118466 ) ) ( not ( = ?auto_118464 ?auto_118467 ) ) ( not ( = ?auto_118464 ?auto_118468 ) ) ( not ( = ?auto_118465 ?auto_118466 ) ) ( not ( = ?auto_118465 ?auto_118467 ) ) ( not ( = ?auto_118465 ?auto_118468 ) ) ( not ( = ?auto_118466 ?auto_118467 ) ) ( not ( = ?auto_118466 ?auto_118468 ) ) ( not ( = ?auto_118467 ?auto_118468 ) ) ( ON-TABLE ?auto_118468 ) ( ON ?auto_118467 ?auto_118468 ) ( ON ?auto_118466 ?auto_118467 ) ( ON ?auto_118465 ?auto_118466 ) ( ON ?auto_118464 ?auto_118465 ) ( ON ?auto_118462 ?auto_118469 ) ( not ( = ?auto_118462 ?auto_118469 ) ) ( not ( = ?auto_118463 ?auto_118469 ) ) ( not ( = ?auto_118464 ?auto_118469 ) ) ( not ( = ?auto_118465 ?auto_118469 ) ) ( not ( = ?auto_118466 ?auto_118469 ) ) ( not ( = ?auto_118467 ?auto_118469 ) ) ( not ( = ?auto_118468 ?auto_118469 ) ) ( CLEAR ?auto_118464 ) ( ON ?auto_118463 ?auto_118462 ) ( CLEAR ?auto_118463 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_118469 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_118469 ?auto_118462 )
      ( MAKE-7PILE ?auto_118462 ?auto_118463 ?auto_118464 ?auto_118465 ?auto_118466 ?auto_118467 ?auto_118468 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_118470 - BLOCK
      ?auto_118471 - BLOCK
      ?auto_118472 - BLOCK
      ?auto_118473 - BLOCK
      ?auto_118474 - BLOCK
      ?auto_118475 - BLOCK
      ?auto_118476 - BLOCK
    )
    :vars
    (
      ?auto_118477 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118470 ?auto_118471 ) ) ( not ( = ?auto_118470 ?auto_118472 ) ) ( not ( = ?auto_118470 ?auto_118473 ) ) ( not ( = ?auto_118470 ?auto_118474 ) ) ( not ( = ?auto_118470 ?auto_118475 ) ) ( not ( = ?auto_118470 ?auto_118476 ) ) ( not ( = ?auto_118471 ?auto_118472 ) ) ( not ( = ?auto_118471 ?auto_118473 ) ) ( not ( = ?auto_118471 ?auto_118474 ) ) ( not ( = ?auto_118471 ?auto_118475 ) ) ( not ( = ?auto_118471 ?auto_118476 ) ) ( not ( = ?auto_118472 ?auto_118473 ) ) ( not ( = ?auto_118472 ?auto_118474 ) ) ( not ( = ?auto_118472 ?auto_118475 ) ) ( not ( = ?auto_118472 ?auto_118476 ) ) ( not ( = ?auto_118473 ?auto_118474 ) ) ( not ( = ?auto_118473 ?auto_118475 ) ) ( not ( = ?auto_118473 ?auto_118476 ) ) ( not ( = ?auto_118474 ?auto_118475 ) ) ( not ( = ?auto_118474 ?auto_118476 ) ) ( not ( = ?auto_118475 ?auto_118476 ) ) ( ON-TABLE ?auto_118476 ) ( ON ?auto_118475 ?auto_118476 ) ( ON ?auto_118474 ?auto_118475 ) ( ON ?auto_118473 ?auto_118474 ) ( ON ?auto_118470 ?auto_118477 ) ( not ( = ?auto_118470 ?auto_118477 ) ) ( not ( = ?auto_118471 ?auto_118477 ) ) ( not ( = ?auto_118472 ?auto_118477 ) ) ( not ( = ?auto_118473 ?auto_118477 ) ) ( not ( = ?auto_118474 ?auto_118477 ) ) ( not ( = ?auto_118475 ?auto_118477 ) ) ( not ( = ?auto_118476 ?auto_118477 ) ) ( ON ?auto_118471 ?auto_118470 ) ( CLEAR ?auto_118471 ) ( ON-TABLE ?auto_118477 ) ( HOLDING ?auto_118472 ) ( CLEAR ?auto_118473 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_118476 ?auto_118475 ?auto_118474 ?auto_118473 ?auto_118472 )
      ( MAKE-7PILE ?auto_118470 ?auto_118471 ?auto_118472 ?auto_118473 ?auto_118474 ?auto_118475 ?auto_118476 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_118478 - BLOCK
      ?auto_118479 - BLOCK
      ?auto_118480 - BLOCK
      ?auto_118481 - BLOCK
      ?auto_118482 - BLOCK
      ?auto_118483 - BLOCK
      ?auto_118484 - BLOCK
    )
    :vars
    (
      ?auto_118485 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118478 ?auto_118479 ) ) ( not ( = ?auto_118478 ?auto_118480 ) ) ( not ( = ?auto_118478 ?auto_118481 ) ) ( not ( = ?auto_118478 ?auto_118482 ) ) ( not ( = ?auto_118478 ?auto_118483 ) ) ( not ( = ?auto_118478 ?auto_118484 ) ) ( not ( = ?auto_118479 ?auto_118480 ) ) ( not ( = ?auto_118479 ?auto_118481 ) ) ( not ( = ?auto_118479 ?auto_118482 ) ) ( not ( = ?auto_118479 ?auto_118483 ) ) ( not ( = ?auto_118479 ?auto_118484 ) ) ( not ( = ?auto_118480 ?auto_118481 ) ) ( not ( = ?auto_118480 ?auto_118482 ) ) ( not ( = ?auto_118480 ?auto_118483 ) ) ( not ( = ?auto_118480 ?auto_118484 ) ) ( not ( = ?auto_118481 ?auto_118482 ) ) ( not ( = ?auto_118481 ?auto_118483 ) ) ( not ( = ?auto_118481 ?auto_118484 ) ) ( not ( = ?auto_118482 ?auto_118483 ) ) ( not ( = ?auto_118482 ?auto_118484 ) ) ( not ( = ?auto_118483 ?auto_118484 ) ) ( ON-TABLE ?auto_118484 ) ( ON ?auto_118483 ?auto_118484 ) ( ON ?auto_118482 ?auto_118483 ) ( ON ?auto_118481 ?auto_118482 ) ( ON ?auto_118478 ?auto_118485 ) ( not ( = ?auto_118478 ?auto_118485 ) ) ( not ( = ?auto_118479 ?auto_118485 ) ) ( not ( = ?auto_118480 ?auto_118485 ) ) ( not ( = ?auto_118481 ?auto_118485 ) ) ( not ( = ?auto_118482 ?auto_118485 ) ) ( not ( = ?auto_118483 ?auto_118485 ) ) ( not ( = ?auto_118484 ?auto_118485 ) ) ( ON ?auto_118479 ?auto_118478 ) ( ON-TABLE ?auto_118485 ) ( CLEAR ?auto_118481 ) ( ON ?auto_118480 ?auto_118479 ) ( CLEAR ?auto_118480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_118485 ?auto_118478 ?auto_118479 )
      ( MAKE-7PILE ?auto_118478 ?auto_118479 ?auto_118480 ?auto_118481 ?auto_118482 ?auto_118483 ?auto_118484 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_118486 - BLOCK
      ?auto_118487 - BLOCK
      ?auto_118488 - BLOCK
      ?auto_118489 - BLOCK
      ?auto_118490 - BLOCK
      ?auto_118491 - BLOCK
      ?auto_118492 - BLOCK
    )
    :vars
    (
      ?auto_118493 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118486 ?auto_118487 ) ) ( not ( = ?auto_118486 ?auto_118488 ) ) ( not ( = ?auto_118486 ?auto_118489 ) ) ( not ( = ?auto_118486 ?auto_118490 ) ) ( not ( = ?auto_118486 ?auto_118491 ) ) ( not ( = ?auto_118486 ?auto_118492 ) ) ( not ( = ?auto_118487 ?auto_118488 ) ) ( not ( = ?auto_118487 ?auto_118489 ) ) ( not ( = ?auto_118487 ?auto_118490 ) ) ( not ( = ?auto_118487 ?auto_118491 ) ) ( not ( = ?auto_118487 ?auto_118492 ) ) ( not ( = ?auto_118488 ?auto_118489 ) ) ( not ( = ?auto_118488 ?auto_118490 ) ) ( not ( = ?auto_118488 ?auto_118491 ) ) ( not ( = ?auto_118488 ?auto_118492 ) ) ( not ( = ?auto_118489 ?auto_118490 ) ) ( not ( = ?auto_118489 ?auto_118491 ) ) ( not ( = ?auto_118489 ?auto_118492 ) ) ( not ( = ?auto_118490 ?auto_118491 ) ) ( not ( = ?auto_118490 ?auto_118492 ) ) ( not ( = ?auto_118491 ?auto_118492 ) ) ( ON-TABLE ?auto_118492 ) ( ON ?auto_118491 ?auto_118492 ) ( ON ?auto_118490 ?auto_118491 ) ( ON ?auto_118486 ?auto_118493 ) ( not ( = ?auto_118486 ?auto_118493 ) ) ( not ( = ?auto_118487 ?auto_118493 ) ) ( not ( = ?auto_118488 ?auto_118493 ) ) ( not ( = ?auto_118489 ?auto_118493 ) ) ( not ( = ?auto_118490 ?auto_118493 ) ) ( not ( = ?auto_118491 ?auto_118493 ) ) ( not ( = ?auto_118492 ?auto_118493 ) ) ( ON ?auto_118487 ?auto_118486 ) ( ON-TABLE ?auto_118493 ) ( ON ?auto_118488 ?auto_118487 ) ( CLEAR ?auto_118488 ) ( HOLDING ?auto_118489 ) ( CLEAR ?auto_118490 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_118492 ?auto_118491 ?auto_118490 ?auto_118489 )
      ( MAKE-7PILE ?auto_118486 ?auto_118487 ?auto_118488 ?auto_118489 ?auto_118490 ?auto_118491 ?auto_118492 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_118494 - BLOCK
      ?auto_118495 - BLOCK
      ?auto_118496 - BLOCK
      ?auto_118497 - BLOCK
      ?auto_118498 - BLOCK
      ?auto_118499 - BLOCK
      ?auto_118500 - BLOCK
    )
    :vars
    (
      ?auto_118501 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118494 ?auto_118495 ) ) ( not ( = ?auto_118494 ?auto_118496 ) ) ( not ( = ?auto_118494 ?auto_118497 ) ) ( not ( = ?auto_118494 ?auto_118498 ) ) ( not ( = ?auto_118494 ?auto_118499 ) ) ( not ( = ?auto_118494 ?auto_118500 ) ) ( not ( = ?auto_118495 ?auto_118496 ) ) ( not ( = ?auto_118495 ?auto_118497 ) ) ( not ( = ?auto_118495 ?auto_118498 ) ) ( not ( = ?auto_118495 ?auto_118499 ) ) ( not ( = ?auto_118495 ?auto_118500 ) ) ( not ( = ?auto_118496 ?auto_118497 ) ) ( not ( = ?auto_118496 ?auto_118498 ) ) ( not ( = ?auto_118496 ?auto_118499 ) ) ( not ( = ?auto_118496 ?auto_118500 ) ) ( not ( = ?auto_118497 ?auto_118498 ) ) ( not ( = ?auto_118497 ?auto_118499 ) ) ( not ( = ?auto_118497 ?auto_118500 ) ) ( not ( = ?auto_118498 ?auto_118499 ) ) ( not ( = ?auto_118498 ?auto_118500 ) ) ( not ( = ?auto_118499 ?auto_118500 ) ) ( ON-TABLE ?auto_118500 ) ( ON ?auto_118499 ?auto_118500 ) ( ON ?auto_118498 ?auto_118499 ) ( ON ?auto_118494 ?auto_118501 ) ( not ( = ?auto_118494 ?auto_118501 ) ) ( not ( = ?auto_118495 ?auto_118501 ) ) ( not ( = ?auto_118496 ?auto_118501 ) ) ( not ( = ?auto_118497 ?auto_118501 ) ) ( not ( = ?auto_118498 ?auto_118501 ) ) ( not ( = ?auto_118499 ?auto_118501 ) ) ( not ( = ?auto_118500 ?auto_118501 ) ) ( ON ?auto_118495 ?auto_118494 ) ( ON-TABLE ?auto_118501 ) ( ON ?auto_118496 ?auto_118495 ) ( CLEAR ?auto_118498 ) ( ON ?auto_118497 ?auto_118496 ) ( CLEAR ?auto_118497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_118501 ?auto_118494 ?auto_118495 ?auto_118496 )
      ( MAKE-7PILE ?auto_118494 ?auto_118495 ?auto_118496 ?auto_118497 ?auto_118498 ?auto_118499 ?auto_118500 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_118502 - BLOCK
      ?auto_118503 - BLOCK
      ?auto_118504 - BLOCK
      ?auto_118505 - BLOCK
      ?auto_118506 - BLOCK
      ?auto_118507 - BLOCK
      ?auto_118508 - BLOCK
    )
    :vars
    (
      ?auto_118509 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118502 ?auto_118503 ) ) ( not ( = ?auto_118502 ?auto_118504 ) ) ( not ( = ?auto_118502 ?auto_118505 ) ) ( not ( = ?auto_118502 ?auto_118506 ) ) ( not ( = ?auto_118502 ?auto_118507 ) ) ( not ( = ?auto_118502 ?auto_118508 ) ) ( not ( = ?auto_118503 ?auto_118504 ) ) ( not ( = ?auto_118503 ?auto_118505 ) ) ( not ( = ?auto_118503 ?auto_118506 ) ) ( not ( = ?auto_118503 ?auto_118507 ) ) ( not ( = ?auto_118503 ?auto_118508 ) ) ( not ( = ?auto_118504 ?auto_118505 ) ) ( not ( = ?auto_118504 ?auto_118506 ) ) ( not ( = ?auto_118504 ?auto_118507 ) ) ( not ( = ?auto_118504 ?auto_118508 ) ) ( not ( = ?auto_118505 ?auto_118506 ) ) ( not ( = ?auto_118505 ?auto_118507 ) ) ( not ( = ?auto_118505 ?auto_118508 ) ) ( not ( = ?auto_118506 ?auto_118507 ) ) ( not ( = ?auto_118506 ?auto_118508 ) ) ( not ( = ?auto_118507 ?auto_118508 ) ) ( ON-TABLE ?auto_118508 ) ( ON ?auto_118507 ?auto_118508 ) ( ON ?auto_118502 ?auto_118509 ) ( not ( = ?auto_118502 ?auto_118509 ) ) ( not ( = ?auto_118503 ?auto_118509 ) ) ( not ( = ?auto_118504 ?auto_118509 ) ) ( not ( = ?auto_118505 ?auto_118509 ) ) ( not ( = ?auto_118506 ?auto_118509 ) ) ( not ( = ?auto_118507 ?auto_118509 ) ) ( not ( = ?auto_118508 ?auto_118509 ) ) ( ON ?auto_118503 ?auto_118502 ) ( ON-TABLE ?auto_118509 ) ( ON ?auto_118504 ?auto_118503 ) ( ON ?auto_118505 ?auto_118504 ) ( CLEAR ?auto_118505 ) ( HOLDING ?auto_118506 ) ( CLEAR ?auto_118507 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_118508 ?auto_118507 ?auto_118506 )
      ( MAKE-7PILE ?auto_118502 ?auto_118503 ?auto_118504 ?auto_118505 ?auto_118506 ?auto_118507 ?auto_118508 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_118510 - BLOCK
      ?auto_118511 - BLOCK
      ?auto_118512 - BLOCK
      ?auto_118513 - BLOCK
      ?auto_118514 - BLOCK
      ?auto_118515 - BLOCK
      ?auto_118516 - BLOCK
    )
    :vars
    (
      ?auto_118517 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118510 ?auto_118511 ) ) ( not ( = ?auto_118510 ?auto_118512 ) ) ( not ( = ?auto_118510 ?auto_118513 ) ) ( not ( = ?auto_118510 ?auto_118514 ) ) ( not ( = ?auto_118510 ?auto_118515 ) ) ( not ( = ?auto_118510 ?auto_118516 ) ) ( not ( = ?auto_118511 ?auto_118512 ) ) ( not ( = ?auto_118511 ?auto_118513 ) ) ( not ( = ?auto_118511 ?auto_118514 ) ) ( not ( = ?auto_118511 ?auto_118515 ) ) ( not ( = ?auto_118511 ?auto_118516 ) ) ( not ( = ?auto_118512 ?auto_118513 ) ) ( not ( = ?auto_118512 ?auto_118514 ) ) ( not ( = ?auto_118512 ?auto_118515 ) ) ( not ( = ?auto_118512 ?auto_118516 ) ) ( not ( = ?auto_118513 ?auto_118514 ) ) ( not ( = ?auto_118513 ?auto_118515 ) ) ( not ( = ?auto_118513 ?auto_118516 ) ) ( not ( = ?auto_118514 ?auto_118515 ) ) ( not ( = ?auto_118514 ?auto_118516 ) ) ( not ( = ?auto_118515 ?auto_118516 ) ) ( ON-TABLE ?auto_118516 ) ( ON ?auto_118515 ?auto_118516 ) ( ON ?auto_118510 ?auto_118517 ) ( not ( = ?auto_118510 ?auto_118517 ) ) ( not ( = ?auto_118511 ?auto_118517 ) ) ( not ( = ?auto_118512 ?auto_118517 ) ) ( not ( = ?auto_118513 ?auto_118517 ) ) ( not ( = ?auto_118514 ?auto_118517 ) ) ( not ( = ?auto_118515 ?auto_118517 ) ) ( not ( = ?auto_118516 ?auto_118517 ) ) ( ON ?auto_118511 ?auto_118510 ) ( ON-TABLE ?auto_118517 ) ( ON ?auto_118512 ?auto_118511 ) ( ON ?auto_118513 ?auto_118512 ) ( CLEAR ?auto_118515 ) ( ON ?auto_118514 ?auto_118513 ) ( CLEAR ?auto_118514 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_118517 ?auto_118510 ?auto_118511 ?auto_118512 ?auto_118513 )
      ( MAKE-7PILE ?auto_118510 ?auto_118511 ?auto_118512 ?auto_118513 ?auto_118514 ?auto_118515 ?auto_118516 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_118518 - BLOCK
      ?auto_118519 - BLOCK
      ?auto_118520 - BLOCK
      ?auto_118521 - BLOCK
      ?auto_118522 - BLOCK
      ?auto_118523 - BLOCK
      ?auto_118524 - BLOCK
    )
    :vars
    (
      ?auto_118525 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118518 ?auto_118519 ) ) ( not ( = ?auto_118518 ?auto_118520 ) ) ( not ( = ?auto_118518 ?auto_118521 ) ) ( not ( = ?auto_118518 ?auto_118522 ) ) ( not ( = ?auto_118518 ?auto_118523 ) ) ( not ( = ?auto_118518 ?auto_118524 ) ) ( not ( = ?auto_118519 ?auto_118520 ) ) ( not ( = ?auto_118519 ?auto_118521 ) ) ( not ( = ?auto_118519 ?auto_118522 ) ) ( not ( = ?auto_118519 ?auto_118523 ) ) ( not ( = ?auto_118519 ?auto_118524 ) ) ( not ( = ?auto_118520 ?auto_118521 ) ) ( not ( = ?auto_118520 ?auto_118522 ) ) ( not ( = ?auto_118520 ?auto_118523 ) ) ( not ( = ?auto_118520 ?auto_118524 ) ) ( not ( = ?auto_118521 ?auto_118522 ) ) ( not ( = ?auto_118521 ?auto_118523 ) ) ( not ( = ?auto_118521 ?auto_118524 ) ) ( not ( = ?auto_118522 ?auto_118523 ) ) ( not ( = ?auto_118522 ?auto_118524 ) ) ( not ( = ?auto_118523 ?auto_118524 ) ) ( ON-TABLE ?auto_118524 ) ( ON ?auto_118518 ?auto_118525 ) ( not ( = ?auto_118518 ?auto_118525 ) ) ( not ( = ?auto_118519 ?auto_118525 ) ) ( not ( = ?auto_118520 ?auto_118525 ) ) ( not ( = ?auto_118521 ?auto_118525 ) ) ( not ( = ?auto_118522 ?auto_118525 ) ) ( not ( = ?auto_118523 ?auto_118525 ) ) ( not ( = ?auto_118524 ?auto_118525 ) ) ( ON ?auto_118519 ?auto_118518 ) ( ON-TABLE ?auto_118525 ) ( ON ?auto_118520 ?auto_118519 ) ( ON ?auto_118521 ?auto_118520 ) ( ON ?auto_118522 ?auto_118521 ) ( CLEAR ?auto_118522 ) ( HOLDING ?auto_118523 ) ( CLEAR ?auto_118524 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_118524 ?auto_118523 )
      ( MAKE-7PILE ?auto_118518 ?auto_118519 ?auto_118520 ?auto_118521 ?auto_118522 ?auto_118523 ?auto_118524 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_118526 - BLOCK
      ?auto_118527 - BLOCK
      ?auto_118528 - BLOCK
      ?auto_118529 - BLOCK
      ?auto_118530 - BLOCK
      ?auto_118531 - BLOCK
      ?auto_118532 - BLOCK
    )
    :vars
    (
      ?auto_118533 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118526 ?auto_118527 ) ) ( not ( = ?auto_118526 ?auto_118528 ) ) ( not ( = ?auto_118526 ?auto_118529 ) ) ( not ( = ?auto_118526 ?auto_118530 ) ) ( not ( = ?auto_118526 ?auto_118531 ) ) ( not ( = ?auto_118526 ?auto_118532 ) ) ( not ( = ?auto_118527 ?auto_118528 ) ) ( not ( = ?auto_118527 ?auto_118529 ) ) ( not ( = ?auto_118527 ?auto_118530 ) ) ( not ( = ?auto_118527 ?auto_118531 ) ) ( not ( = ?auto_118527 ?auto_118532 ) ) ( not ( = ?auto_118528 ?auto_118529 ) ) ( not ( = ?auto_118528 ?auto_118530 ) ) ( not ( = ?auto_118528 ?auto_118531 ) ) ( not ( = ?auto_118528 ?auto_118532 ) ) ( not ( = ?auto_118529 ?auto_118530 ) ) ( not ( = ?auto_118529 ?auto_118531 ) ) ( not ( = ?auto_118529 ?auto_118532 ) ) ( not ( = ?auto_118530 ?auto_118531 ) ) ( not ( = ?auto_118530 ?auto_118532 ) ) ( not ( = ?auto_118531 ?auto_118532 ) ) ( ON-TABLE ?auto_118532 ) ( ON ?auto_118526 ?auto_118533 ) ( not ( = ?auto_118526 ?auto_118533 ) ) ( not ( = ?auto_118527 ?auto_118533 ) ) ( not ( = ?auto_118528 ?auto_118533 ) ) ( not ( = ?auto_118529 ?auto_118533 ) ) ( not ( = ?auto_118530 ?auto_118533 ) ) ( not ( = ?auto_118531 ?auto_118533 ) ) ( not ( = ?auto_118532 ?auto_118533 ) ) ( ON ?auto_118527 ?auto_118526 ) ( ON-TABLE ?auto_118533 ) ( ON ?auto_118528 ?auto_118527 ) ( ON ?auto_118529 ?auto_118528 ) ( ON ?auto_118530 ?auto_118529 ) ( CLEAR ?auto_118532 ) ( ON ?auto_118531 ?auto_118530 ) ( CLEAR ?auto_118531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_118533 ?auto_118526 ?auto_118527 ?auto_118528 ?auto_118529 ?auto_118530 )
      ( MAKE-7PILE ?auto_118526 ?auto_118527 ?auto_118528 ?auto_118529 ?auto_118530 ?auto_118531 ?auto_118532 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_118534 - BLOCK
      ?auto_118535 - BLOCK
      ?auto_118536 - BLOCK
      ?auto_118537 - BLOCK
      ?auto_118538 - BLOCK
      ?auto_118539 - BLOCK
      ?auto_118540 - BLOCK
    )
    :vars
    (
      ?auto_118541 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118534 ?auto_118535 ) ) ( not ( = ?auto_118534 ?auto_118536 ) ) ( not ( = ?auto_118534 ?auto_118537 ) ) ( not ( = ?auto_118534 ?auto_118538 ) ) ( not ( = ?auto_118534 ?auto_118539 ) ) ( not ( = ?auto_118534 ?auto_118540 ) ) ( not ( = ?auto_118535 ?auto_118536 ) ) ( not ( = ?auto_118535 ?auto_118537 ) ) ( not ( = ?auto_118535 ?auto_118538 ) ) ( not ( = ?auto_118535 ?auto_118539 ) ) ( not ( = ?auto_118535 ?auto_118540 ) ) ( not ( = ?auto_118536 ?auto_118537 ) ) ( not ( = ?auto_118536 ?auto_118538 ) ) ( not ( = ?auto_118536 ?auto_118539 ) ) ( not ( = ?auto_118536 ?auto_118540 ) ) ( not ( = ?auto_118537 ?auto_118538 ) ) ( not ( = ?auto_118537 ?auto_118539 ) ) ( not ( = ?auto_118537 ?auto_118540 ) ) ( not ( = ?auto_118538 ?auto_118539 ) ) ( not ( = ?auto_118538 ?auto_118540 ) ) ( not ( = ?auto_118539 ?auto_118540 ) ) ( ON ?auto_118534 ?auto_118541 ) ( not ( = ?auto_118534 ?auto_118541 ) ) ( not ( = ?auto_118535 ?auto_118541 ) ) ( not ( = ?auto_118536 ?auto_118541 ) ) ( not ( = ?auto_118537 ?auto_118541 ) ) ( not ( = ?auto_118538 ?auto_118541 ) ) ( not ( = ?auto_118539 ?auto_118541 ) ) ( not ( = ?auto_118540 ?auto_118541 ) ) ( ON ?auto_118535 ?auto_118534 ) ( ON-TABLE ?auto_118541 ) ( ON ?auto_118536 ?auto_118535 ) ( ON ?auto_118537 ?auto_118536 ) ( ON ?auto_118538 ?auto_118537 ) ( ON ?auto_118539 ?auto_118538 ) ( CLEAR ?auto_118539 ) ( HOLDING ?auto_118540 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_118540 )
      ( MAKE-7PILE ?auto_118534 ?auto_118535 ?auto_118536 ?auto_118537 ?auto_118538 ?auto_118539 ?auto_118540 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_118542 - BLOCK
      ?auto_118543 - BLOCK
      ?auto_118544 - BLOCK
      ?auto_118545 - BLOCK
      ?auto_118546 - BLOCK
      ?auto_118547 - BLOCK
      ?auto_118548 - BLOCK
    )
    :vars
    (
      ?auto_118549 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118542 ?auto_118543 ) ) ( not ( = ?auto_118542 ?auto_118544 ) ) ( not ( = ?auto_118542 ?auto_118545 ) ) ( not ( = ?auto_118542 ?auto_118546 ) ) ( not ( = ?auto_118542 ?auto_118547 ) ) ( not ( = ?auto_118542 ?auto_118548 ) ) ( not ( = ?auto_118543 ?auto_118544 ) ) ( not ( = ?auto_118543 ?auto_118545 ) ) ( not ( = ?auto_118543 ?auto_118546 ) ) ( not ( = ?auto_118543 ?auto_118547 ) ) ( not ( = ?auto_118543 ?auto_118548 ) ) ( not ( = ?auto_118544 ?auto_118545 ) ) ( not ( = ?auto_118544 ?auto_118546 ) ) ( not ( = ?auto_118544 ?auto_118547 ) ) ( not ( = ?auto_118544 ?auto_118548 ) ) ( not ( = ?auto_118545 ?auto_118546 ) ) ( not ( = ?auto_118545 ?auto_118547 ) ) ( not ( = ?auto_118545 ?auto_118548 ) ) ( not ( = ?auto_118546 ?auto_118547 ) ) ( not ( = ?auto_118546 ?auto_118548 ) ) ( not ( = ?auto_118547 ?auto_118548 ) ) ( ON ?auto_118542 ?auto_118549 ) ( not ( = ?auto_118542 ?auto_118549 ) ) ( not ( = ?auto_118543 ?auto_118549 ) ) ( not ( = ?auto_118544 ?auto_118549 ) ) ( not ( = ?auto_118545 ?auto_118549 ) ) ( not ( = ?auto_118546 ?auto_118549 ) ) ( not ( = ?auto_118547 ?auto_118549 ) ) ( not ( = ?auto_118548 ?auto_118549 ) ) ( ON ?auto_118543 ?auto_118542 ) ( ON-TABLE ?auto_118549 ) ( ON ?auto_118544 ?auto_118543 ) ( ON ?auto_118545 ?auto_118544 ) ( ON ?auto_118546 ?auto_118545 ) ( ON ?auto_118547 ?auto_118546 ) ( ON ?auto_118548 ?auto_118547 ) ( CLEAR ?auto_118548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_118549 ?auto_118542 ?auto_118543 ?auto_118544 ?auto_118545 ?auto_118546 ?auto_118547 )
      ( MAKE-7PILE ?auto_118542 ?auto_118543 ?auto_118544 ?auto_118545 ?auto_118546 ?auto_118547 ?auto_118548 ) )
  )

)

