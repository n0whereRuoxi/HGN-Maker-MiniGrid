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
      ?auto_22669 - BLOCK
    )
    :vars
    (
      ?auto_22670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22669 ?auto_22670 ) ( CLEAR ?auto_22669 ) ( HAND-EMPTY ) ( not ( = ?auto_22669 ?auto_22670 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22669 ?auto_22670 )
      ( !PUTDOWN ?auto_22669 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22672 - BLOCK
    )
    :vars
    (
      ?auto_22673 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22672 ?auto_22673 ) ( CLEAR ?auto_22672 ) ( HAND-EMPTY ) ( not ( = ?auto_22672 ?auto_22673 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22672 ?auto_22673 )
      ( !PUTDOWN ?auto_22672 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22676 - BLOCK
      ?auto_22677 - BLOCK
    )
    :vars
    (
      ?auto_22678 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_22676 ) ( ON ?auto_22677 ?auto_22678 ) ( CLEAR ?auto_22677 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22676 ) ( not ( = ?auto_22676 ?auto_22677 ) ) ( not ( = ?auto_22676 ?auto_22678 ) ) ( not ( = ?auto_22677 ?auto_22678 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22677 ?auto_22678 )
      ( !STACK ?auto_22677 ?auto_22676 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22681 - BLOCK
      ?auto_22682 - BLOCK
    )
    :vars
    (
      ?auto_22683 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_22681 ) ( ON ?auto_22682 ?auto_22683 ) ( CLEAR ?auto_22682 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22681 ) ( not ( = ?auto_22681 ?auto_22682 ) ) ( not ( = ?auto_22681 ?auto_22683 ) ) ( not ( = ?auto_22682 ?auto_22683 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22682 ?auto_22683 )
      ( !STACK ?auto_22682 ?auto_22681 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22686 - BLOCK
      ?auto_22687 - BLOCK
    )
    :vars
    (
      ?auto_22688 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22687 ?auto_22688 ) ( not ( = ?auto_22686 ?auto_22687 ) ) ( not ( = ?auto_22686 ?auto_22688 ) ) ( not ( = ?auto_22687 ?auto_22688 ) ) ( ON ?auto_22686 ?auto_22687 ) ( CLEAR ?auto_22686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22686 )
      ( MAKE-2PILE ?auto_22686 ?auto_22687 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22691 - BLOCK
      ?auto_22692 - BLOCK
    )
    :vars
    (
      ?auto_22693 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22692 ?auto_22693 ) ( not ( = ?auto_22691 ?auto_22692 ) ) ( not ( = ?auto_22691 ?auto_22693 ) ) ( not ( = ?auto_22692 ?auto_22693 ) ) ( ON ?auto_22691 ?auto_22692 ) ( CLEAR ?auto_22691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22691 )
      ( MAKE-2PILE ?auto_22691 ?auto_22692 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22697 - BLOCK
      ?auto_22698 - BLOCK
      ?auto_22699 - BLOCK
    )
    :vars
    (
      ?auto_22700 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_22698 ) ( ON ?auto_22699 ?auto_22700 ) ( CLEAR ?auto_22699 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22697 ) ( ON ?auto_22698 ?auto_22697 ) ( not ( = ?auto_22697 ?auto_22698 ) ) ( not ( = ?auto_22697 ?auto_22699 ) ) ( not ( = ?auto_22697 ?auto_22700 ) ) ( not ( = ?auto_22698 ?auto_22699 ) ) ( not ( = ?auto_22698 ?auto_22700 ) ) ( not ( = ?auto_22699 ?auto_22700 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22699 ?auto_22700 )
      ( !STACK ?auto_22699 ?auto_22698 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22704 - BLOCK
      ?auto_22705 - BLOCK
      ?auto_22706 - BLOCK
    )
    :vars
    (
      ?auto_22707 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_22705 ) ( ON ?auto_22706 ?auto_22707 ) ( CLEAR ?auto_22706 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22704 ) ( ON ?auto_22705 ?auto_22704 ) ( not ( = ?auto_22704 ?auto_22705 ) ) ( not ( = ?auto_22704 ?auto_22706 ) ) ( not ( = ?auto_22704 ?auto_22707 ) ) ( not ( = ?auto_22705 ?auto_22706 ) ) ( not ( = ?auto_22705 ?auto_22707 ) ) ( not ( = ?auto_22706 ?auto_22707 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22706 ?auto_22707 )
      ( !STACK ?auto_22706 ?auto_22705 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22711 - BLOCK
      ?auto_22712 - BLOCK
      ?auto_22713 - BLOCK
    )
    :vars
    (
      ?auto_22714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22713 ?auto_22714 ) ( ON-TABLE ?auto_22711 ) ( not ( = ?auto_22711 ?auto_22712 ) ) ( not ( = ?auto_22711 ?auto_22713 ) ) ( not ( = ?auto_22711 ?auto_22714 ) ) ( not ( = ?auto_22712 ?auto_22713 ) ) ( not ( = ?auto_22712 ?auto_22714 ) ) ( not ( = ?auto_22713 ?auto_22714 ) ) ( CLEAR ?auto_22711 ) ( ON ?auto_22712 ?auto_22713 ) ( CLEAR ?auto_22712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22711 ?auto_22712 )
      ( MAKE-3PILE ?auto_22711 ?auto_22712 ?auto_22713 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22718 - BLOCK
      ?auto_22719 - BLOCK
      ?auto_22720 - BLOCK
    )
    :vars
    (
      ?auto_22721 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22720 ?auto_22721 ) ( ON-TABLE ?auto_22718 ) ( not ( = ?auto_22718 ?auto_22719 ) ) ( not ( = ?auto_22718 ?auto_22720 ) ) ( not ( = ?auto_22718 ?auto_22721 ) ) ( not ( = ?auto_22719 ?auto_22720 ) ) ( not ( = ?auto_22719 ?auto_22721 ) ) ( not ( = ?auto_22720 ?auto_22721 ) ) ( CLEAR ?auto_22718 ) ( ON ?auto_22719 ?auto_22720 ) ( CLEAR ?auto_22719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22718 ?auto_22719 )
      ( MAKE-3PILE ?auto_22718 ?auto_22719 ?auto_22720 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22725 - BLOCK
      ?auto_22726 - BLOCK
      ?auto_22727 - BLOCK
    )
    :vars
    (
      ?auto_22728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22727 ?auto_22728 ) ( not ( = ?auto_22725 ?auto_22726 ) ) ( not ( = ?auto_22725 ?auto_22727 ) ) ( not ( = ?auto_22725 ?auto_22728 ) ) ( not ( = ?auto_22726 ?auto_22727 ) ) ( not ( = ?auto_22726 ?auto_22728 ) ) ( not ( = ?auto_22727 ?auto_22728 ) ) ( ON ?auto_22726 ?auto_22727 ) ( ON ?auto_22725 ?auto_22726 ) ( CLEAR ?auto_22725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22725 )
      ( MAKE-3PILE ?auto_22725 ?auto_22726 ?auto_22727 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22732 - BLOCK
      ?auto_22733 - BLOCK
      ?auto_22734 - BLOCK
    )
    :vars
    (
      ?auto_22735 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22734 ?auto_22735 ) ( not ( = ?auto_22732 ?auto_22733 ) ) ( not ( = ?auto_22732 ?auto_22734 ) ) ( not ( = ?auto_22732 ?auto_22735 ) ) ( not ( = ?auto_22733 ?auto_22734 ) ) ( not ( = ?auto_22733 ?auto_22735 ) ) ( not ( = ?auto_22734 ?auto_22735 ) ) ( ON ?auto_22733 ?auto_22734 ) ( ON ?auto_22732 ?auto_22733 ) ( CLEAR ?auto_22732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22732 )
      ( MAKE-3PILE ?auto_22732 ?auto_22733 ?auto_22734 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22740 - BLOCK
      ?auto_22741 - BLOCK
      ?auto_22742 - BLOCK
      ?auto_22743 - BLOCK
    )
    :vars
    (
      ?auto_22744 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_22742 ) ( ON ?auto_22743 ?auto_22744 ) ( CLEAR ?auto_22743 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22740 ) ( ON ?auto_22741 ?auto_22740 ) ( ON ?auto_22742 ?auto_22741 ) ( not ( = ?auto_22740 ?auto_22741 ) ) ( not ( = ?auto_22740 ?auto_22742 ) ) ( not ( = ?auto_22740 ?auto_22743 ) ) ( not ( = ?auto_22740 ?auto_22744 ) ) ( not ( = ?auto_22741 ?auto_22742 ) ) ( not ( = ?auto_22741 ?auto_22743 ) ) ( not ( = ?auto_22741 ?auto_22744 ) ) ( not ( = ?auto_22742 ?auto_22743 ) ) ( not ( = ?auto_22742 ?auto_22744 ) ) ( not ( = ?auto_22743 ?auto_22744 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22743 ?auto_22744 )
      ( !STACK ?auto_22743 ?auto_22742 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22749 - BLOCK
      ?auto_22750 - BLOCK
      ?auto_22751 - BLOCK
      ?auto_22752 - BLOCK
    )
    :vars
    (
      ?auto_22753 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_22751 ) ( ON ?auto_22752 ?auto_22753 ) ( CLEAR ?auto_22752 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22749 ) ( ON ?auto_22750 ?auto_22749 ) ( ON ?auto_22751 ?auto_22750 ) ( not ( = ?auto_22749 ?auto_22750 ) ) ( not ( = ?auto_22749 ?auto_22751 ) ) ( not ( = ?auto_22749 ?auto_22752 ) ) ( not ( = ?auto_22749 ?auto_22753 ) ) ( not ( = ?auto_22750 ?auto_22751 ) ) ( not ( = ?auto_22750 ?auto_22752 ) ) ( not ( = ?auto_22750 ?auto_22753 ) ) ( not ( = ?auto_22751 ?auto_22752 ) ) ( not ( = ?auto_22751 ?auto_22753 ) ) ( not ( = ?auto_22752 ?auto_22753 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22752 ?auto_22753 )
      ( !STACK ?auto_22752 ?auto_22751 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22758 - BLOCK
      ?auto_22759 - BLOCK
      ?auto_22760 - BLOCK
      ?auto_22761 - BLOCK
    )
    :vars
    (
      ?auto_22762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22761 ?auto_22762 ) ( ON-TABLE ?auto_22758 ) ( ON ?auto_22759 ?auto_22758 ) ( not ( = ?auto_22758 ?auto_22759 ) ) ( not ( = ?auto_22758 ?auto_22760 ) ) ( not ( = ?auto_22758 ?auto_22761 ) ) ( not ( = ?auto_22758 ?auto_22762 ) ) ( not ( = ?auto_22759 ?auto_22760 ) ) ( not ( = ?auto_22759 ?auto_22761 ) ) ( not ( = ?auto_22759 ?auto_22762 ) ) ( not ( = ?auto_22760 ?auto_22761 ) ) ( not ( = ?auto_22760 ?auto_22762 ) ) ( not ( = ?auto_22761 ?auto_22762 ) ) ( CLEAR ?auto_22759 ) ( ON ?auto_22760 ?auto_22761 ) ( CLEAR ?auto_22760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22758 ?auto_22759 ?auto_22760 )
      ( MAKE-4PILE ?auto_22758 ?auto_22759 ?auto_22760 ?auto_22761 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22767 - BLOCK
      ?auto_22768 - BLOCK
      ?auto_22769 - BLOCK
      ?auto_22770 - BLOCK
    )
    :vars
    (
      ?auto_22771 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22770 ?auto_22771 ) ( ON-TABLE ?auto_22767 ) ( ON ?auto_22768 ?auto_22767 ) ( not ( = ?auto_22767 ?auto_22768 ) ) ( not ( = ?auto_22767 ?auto_22769 ) ) ( not ( = ?auto_22767 ?auto_22770 ) ) ( not ( = ?auto_22767 ?auto_22771 ) ) ( not ( = ?auto_22768 ?auto_22769 ) ) ( not ( = ?auto_22768 ?auto_22770 ) ) ( not ( = ?auto_22768 ?auto_22771 ) ) ( not ( = ?auto_22769 ?auto_22770 ) ) ( not ( = ?auto_22769 ?auto_22771 ) ) ( not ( = ?auto_22770 ?auto_22771 ) ) ( CLEAR ?auto_22768 ) ( ON ?auto_22769 ?auto_22770 ) ( CLEAR ?auto_22769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22767 ?auto_22768 ?auto_22769 )
      ( MAKE-4PILE ?auto_22767 ?auto_22768 ?auto_22769 ?auto_22770 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22776 - BLOCK
      ?auto_22777 - BLOCK
      ?auto_22778 - BLOCK
      ?auto_22779 - BLOCK
    )
    :vars
    (
      ?auto_22780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22779 ?auto_22780 ) ( ON-TABLE ?auto_22776 ) ( not ( = ?auto_22776 ?auto_22777 ) ) ( not ( = ?auto_22776 ?auto_22778 ) ) ( not ( = ?auto_22776 ?auto_22779 ) ) ( not ( = ?auto_22776 ?auto_22780 ) ) ( not ( = ?auto_22777 ?auto_22778 ) ) ( not ( = ?auto_22777 ?auto_22779 ) ) ( not ( = ?auto_22777 ?auto_22780 ) ) ( not ( = ?auto_22778 ?auto_22779 ) ) ( not ( = ?auto_22778 ?auto_22780 ) ) ( not ( = ?auto_22779 ?auto_22780 ) ) ( ON ?auto_22778 ?auto_22779 ) ( CLEAR ?auto_22776 ) ( ON ?auto_22777 ?auto_22778 ) ( CLEAR ?auto_22777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22776 ?auto_22777 )
      ( MAKE-4PILE ?auto_22776 ?auto_22777 ?auto_22778 ?auto_22779 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22785 - BLOCK
      ?auto_22786 - BLOCK
      ?auto_22787 - BLOCK
      ?auto_22788 - BLOCK
    )
    :vars
    (
      ?auto_22789 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22788 ?auto_22789 ) ( ON-TABLE ?auto_22785 ) ( not ( = ?auto_22785 ?auto_22786 ) ) ( not ( = ?auto_22785 ?auto_22787 ) ) ( not ( = ?auto_22785 ?auto_22788 ) ) ( not ( = ?auto_22785 ?auto_22789 ) ) ( not ( = ?auto_22786 ?auto_22787 ) ) ( not ( = ?auto_22786 ?auto_22788 ) ) ( not ( = ?auto_22786 ?auto_22789 ) ) ( not ( = ?auto_22787 ?auto_22788 ) ) ( not ( = ?auto_22787 ?auto_22789 ) ) ( not ( = ?auto_22788 ?auto_22789 ) ) ( ON ?auto_22787 ?auto_22788 ) ( CLEAR ?auto_22785 ) ( ON ?auto_22786 ?auto_22787 ) ( CLEAR ?auto_22786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22785 ?auto_22786 )
      ( MAKE-4PILE ?auto_22785 ?auto_22786 ?auto_22787 ?auto_22788 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22794 - BLOCK
      ?auto_22795 - BLOCK
      ?auto_22796 - BLOCK
      ?auto_22797 - BLOCK
    )
    :vars
    (
      ?auto_22798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22797 ?auto_22798 ) ( not ( = ?auto_22794 ?auto_22795 ) ) ( not ( = ?auto_22794 ?auto_22796 ) ) ( not ( = ?auto_22794 ?auto_22797 ) ) ( not ( = ?auto_22794 ?auto_22798 ) ) ( not ( = ?auto_22795 ?auto_22796 ) ) ( not ( = ?auto_22795 ?auto_22797 ) ) ( not ( = ?auto_22795 ?auto_22798 ) ) ( not ( = ?auto_22796 ?auto_22797 ) ) ( not ( = ?auto_22796 ?auto_22798 ) ) ( not ( = ?auto_22797 ?auto_22798 ) ) ( ON ?auto_22796 ?auto_22797 ) ( ON ?auto_22795 ?auto_22796 ) ( ON ?auto_22794 ?auto_22795 ) ( CLEAR ?auto_22794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22794 )
      ( MAKE-4PILE ?auto_22794 ?auto_22795 ?auto_22796 ?auto_22797 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22803 - BLOCK
      ?auto_22804 - BLOCK
      ?auto_22805 - BLOCK
      ?auto_22806 - BLOCK
    )
    :vars
    (
      ?auto_22807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22806 ?auto_22807 ) ( not ( = ?auto_22803 ?auto_22804 ) ) ( not ( = ?auto_22803 ?auto_22805 ) ) ( not ( = ?auto_22803 ?auto_22806 ) ) ( not ( = ?auto_22803 ?auto_22807 ) ) ( not ( = ?auto_22804 ?auto_22805 ) ) ( not ( = ?auto_22804 ?auto_22806 ) ) ( not ( = ?auto_22804 ?auto_22807 ) ) ( not ( = ?auto_22805 ?auto_22806 ) ) ( not ( = ?auto_22805 ?auto_22807 ) ) ( not ( = ?auto_22806 ?auto_22807 ) ) ( ON ?auto_22805 ?auto_22806 ) ( ON ?auto_22804 ?auto_22805 ) ( ON ?auto_22803 ?auto_22804 ) ( CLEAR ?auto_22803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22803 )
      ( MAKE-4PILE ?auto_22803 ?auto_22804 ?auto_22805 ?auto_22806 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22813 - BLOCK
      ?auto_22814 - BLOCK
      ?auto_22815 - BLOCK
      ?auto_22816 - BLOCK
      ?auto_22817 - BLOCK
    )
    :vars
    (
      ?auto_22818 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_22816 ) ( ON ?auto_22817 ?auto_22818 ) ( CLEAR ?auto_22817 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22813 ) ( ON ?auto_22814 ?auto_22813 ) ( ON ?auto_22815 ?auto_22814 ) ( ON ?auto_22816 ?auto_22815 ) ( not ( = ?auto_22813 ?auto_22814 ) ) ( not ( = ?auto_22813 ?auto_22815 ) ) ( not ( = ?auto_22813 ?auto_22816 ) ) ( not ( = ?auto_22813 ?auto_22817 ) ) ( not ( = ?auto_22813 ?auto_22818 ) ) ( not ( = ?auto_22814 ?auto_22815 ) ) ( not ( = ?auto_22814 ?auto_22816 ) ) ( not ( = ?auto_22814 ?auto_22817 ) ) ( not ( = ?auto_22814 ?auto_22818 ) ) ( not ( = ?auto_22815 ?auto_22816 ) ) ( not ( = ?auto_22815 ?auto_22817 ) ) ( not ( = ?auto_22815 ?auto_22818 ) ) ( not ( = ?auto_22816 ?auto_22817 ) ) ( not ( = ?auto_22816 ?auto_22818 ) ) ( not ( = ?auto_22817 ?auto_22818 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22817 ?auto_22818 )
      ( !STACK ?auto_22817 ?auto_22816 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22824 - BLOCK
      ?auto_22825 - BLOCK
      ?auto_22826 - BLOCK
      ?auto_22827 - BLOCK
      ?auto_22828 - BLOCK
    )
    :vars
    (
      ?auto_22829 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_22827 ) ( ON ?auto_22828 ?auto_22829 ) ( CLEAR ?auto_22828 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22824 ) ( ON ?auto_22825 ?auto_22824 ) ( ON ?auto_22826 ?auto_22825 ) ( ON ?auto_22827 ?auto_22826 ) ( not ( = ?auto_22824 ?auto_22825 ) ) ( not ( = ?auto_22824 ?auto_22826 ) ) ( not ( = ?auto_22824 ?auto_22827 ) ) ( not ( = ?auto_22824 ?auto_22828 ) ) ( not ( = ?auto_22824 ?auto_22829 ) ) ( not ( = ?auto_22825 ?auto_22826 ) ) ( not ( = ?auto_22825 ?auto_22827 ) ) ( not ( = ?auto_22825 ?auto_22828 ) ) ( not ( = ?auto_22825 ?auto_22829 ) ) ( not ( = ?auto_22826 ?auto_22827 ) ) ( not ( = ?auto_22826 ?auto_22828 ) ) ( not ( = ?auto_22826 ?auto_22829 ) ) ( not ( = ?auto_22827 ?auto_22828 ) ) ( not ( = ?auto_22827 ?auto_22829 ) ) ( not ( = ?auto_22828 ?auto_22829 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22828 ?auto_22829 )
      ( !STACK ?auto_22828 ?auto_22827 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22835 - BLOCK
      ?auto_22836 - BLOCK
      ?auto_22837 - BLOCK
      ?auto_22838 - BLOCK
      ?auto_22839 - BLOCK
    )
    :vars
    (
      ?auto_22840 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22839 ?auto_22840 ) ( ON-TABLE ?auto_22835 ) ( ON ?auto_22836 ?auto_22835 ) ( ON ?auto_22837 ?auto_22836 ) ( not ( = ?auto_22835 ?auto_22836 ) ) ( not ( = ?auto_22835 ?auto_22837 ) ) ( not ( = ?auto_22835 ?auto_22838 ) ) ( not ( = ?auto_22835 ?auto_22839 ) ) ( not ( = ?auto_22835 ?auto_22840 ) ) ( not ( = ?auto_22836 ?auto_22837 ) ) ( not ( = ?auto_22836 ?auto_22838 ) ) ( not ( = ?auto_22836 ?auto_22839 ) ) ( not ( = ?auto_22836 ?auto_22840 ) ) ( not ( = ?auto_22837 ?auto_22838 ) ) ( not ( = ?auto_22837 ?auto_22839 ) ) ( not ( = ?auto_22837 ?auto_22840 ) ) ( not ( = ?auto_22838 ?auto_22839 ) ) ( not ( = ?auto_22838 ?auto_22840 ) ) ( not ( = ?auto_22839 ?auto_22840 ) ) ( CLEAR ?auto_22837 ) ( ON ?auto_22838 ?auto_22839 ) ( CLEAR ?auto_22838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22835 ?auto_22836 ?auto_22837 ?auto_22838 )
      ( MAKE-5PILE ?auto_22835 ?auto_22836 ?auto_22837 ?auto_22838 ?auto_22839 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22846 - BLOCK
      ?auto_22847 - BLOCK
      ?auto_22848 - BLOCK
      ?auto_22849 - BLOCK
      ?auto_22850 - BLOCK
    )
    :vars
    (
      ?auto_22851 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22850 ?auto_22851 ) ( ON-TABLE ?auto_22846 ) ( ON ?auto_22847 ?auto_22846 ) ( ON ?auto_22848 ?auto_22847 ) ( not ( = ?auto_22846 ?auto_22847 ) ) ( not ( = ?auto_22846 ?auto_22848 ) ) ( not ( = ?auto_22846 ?auto_22849 ) ) ( not ( = ?auto_22846 ?auto_22850 ) ) ( not ( = ?auto_22846 ?auto_22851 ) ) ( not ( = ?auto_22847 ?auto_22848 ) ) ( not ( = ?auto_22847 ?auto_22849 ) ) ( not ( = ?auto_22847 ?auto_22850 ) ) ( not ( = ?auto_22847 ?auto_22851 ) ) ( not ( = ?auto_22848 ?auto_22849 ) ) ( not ( = ?auto_22848 ?auto_22850 ) ) ( not ( = ?auto_22848 ?auto_22851 ) ) ( not ( = ?auto_22849 ?auto_22850 ) ) ( not ( = ?auto_22849 ?auto_22851 ) ) ( not ( = ?auto_22850 ?auto_22851 ) ) ( CLEAR ?auto_22848 ) ( ON ?auto_22849 ?auto_22850 ) ( CLEAR ?auto_22849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22846 ?auto_22847 ?auto_22848 ?auto_22849 )
      ( MAKE-5PILE ?auto_22846 ?auto_22847 ?auto_22848 ?auto_22849 ?auto_22850 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22857 - BLOCK
      ?auto_22858 - BLOCK
      ?auto_22859 - BLOCK
      ?auto_22860 - BLOCK
      ?auto_22861 - BLOCK
    )
    :vars
    (
      ?auto_22862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22861 ?auto_22862 ) ( ON-TABLE ?auto_22857 ) ( ON ?auto_22858 ?auto_22857 ) ( not ( = ?auto_22857 ?auto_22858 ) ) ( not ( = ?auto_22857 ?auto_22859 ) ) ( not ( = ?auto_22857 ?auto_22860 ) ) ( not ( = ?auto_22857 ?auto_22861 ) ) ( not ( = ?auto_22857 ?auto_22862 ) ) ( not ( = ?auto_22858 ?auto_22859 ) ) ( not ( = ?auto_22858 ?auto_22860 ) ) ( not ( = ?auto_22858 ?auto_22861 ) ) ( not ( = ?auto_22858 ?auto_22862 ) ) ( not ( = ?auto_22859 ?auto_22860 ) ) ( not ( = ?auto_22859 ?auto_22861 ) ) ( not ( = ?auto_22859 ?auto_22862 ) ) ( not ( = ?auto_22860 ?auto_22861 ) ) ( not ( = ?auto_22860 ?auto_22862 ) ) ( not ( = ?auto_22861 ?auto_22862 ) ) ( ON ?auto_22860 ?auto_22861 ) ( CLEAR ?auto_22858 ) ( ON ?auto_22859 ?auto_22860 ) ( CLEAR ?auto_22859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22857 ?auto_22858 ?auto_22859 )
      ( MAKE-5PILE ?auto_22857 ?auto_22858 ?auto_22859 ?auto_22860 ?auto_22861 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22868 - BLOCK
      ?auto_22869 - BLOCK
      ?auto_22870 - BLOCK
      ?auto_22871 - BLOCK
      ?auto_22872 - BLOCK
    )
    :vars
    (
      ?auto_22873 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22872 ?auto_22873 ) ( ON-TABLE ?auto_22868 ) ( ON ?auto_22869 ?auto_22868 ) ( not ( = ?auto_22868 ?auto_22869 ) ) ( not ( = ?auto_22868 ?auto_22870 ) ) ( not ( = ?auto_22868 ?auto_22871 ) ) ( not ( = ?auto_22868 ?auto_22872 ) ) ( not ( = ?auto_22868 ?auto_22873 ) ) ( not ( = ?auto_22869 ?auto_22870 ) ) ( not ( = ?auto_22869 ?auto_22871 ) ) ( not ( = ?auto_22869 ?auto_22872 ) ) ( not ( = ?auto_22869 ?auto_22873 ) ) ( not ( = ?auto_22870 ?auto_22871 ) ) ( not ( = ?auto_22870 ?auto_22872 ) ) ( not ( = ?auto_22870 ?auto_22873 ) ) ( not ( = ?auto_22871 ?auto_22872 ) ) ( not ( = ?auto_22871 ?auto_22873 ) ) ( not ( = ?auto_22872 ?auto_22873 ) ) ( ON ?auto_22871 ?auto_22872 ) ( CLEAR ?auto_22869 ) ( ON ?auto_22870 ?auto_22871 ) ( CLEAR ?auto_22870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22868 ?auto_22869 ?auto_22870 )
      ( MAKE-5PILE ?auto_22868 ?auto_22869 ?auto_22870 ?auto_22871 ?auto_22872 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22879 - BLOCK
      ?auto_22880 - BLOCK
      ?auto_22881 - BLOCK
      ?auto_22882 - BLOCK
      ?auto_22883 - BLOCK
    )
    :vars
    (
      ?auto_22884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22883 ?auto_22884 ) ( ON-TABLE ?auto_22879 ) ( not ( = ?auto_22879 ?auto_22880 ) ) ( not ( = ?auto_22879 ?auto_22881 ) ) ( not ( = ?auto_22879 ?auto_22882 ) ) ( not ( = ?auto_22879 ?auto_22883 ) ) ( not ( = ?auto_22879 ?auto_22884 ) ) ( not ( = ?auto_22880 ?auto_22881 ) ) ( not ( = ?auto_22880 ?auto_22882 ) ) ( not ( = ?auto_22880 ?auto_22883 ) ) ( not ( = ?auto_22880 ?auto_22884 ) ) ( not ( = ?auto_22881 ?auto_22882 ) ) ( not ( = ?auto_22881 ?auto_22883 ) ) ( not ( = ?auto_22881 ?auto_22884 ) ) ( not ( = ?auto_22882 ?auto_22883 ) ) ( not ( = ?auto_22882 ?auto_22884 ) ) ( not ( = ?auto_22883 ?auto_22884 ) ) ( ON ?auto_22882 ?auto_22883 ) ( ON ?auto_22881 ?auto_22882 ) ( CLEAR ?auto_22879 ) ( ON ?auto_22880 ?auto_22881 ) ( CLEAR ?auto_22880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22879 ?auto_22880 )
      ( MAKE-5PILE ?auto_22879 ?auto_22880 ?auto_22881 ?auto_22882 ?auto_22883 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22890 - BLOCK
      ?auto_22891 - BLOCK
      ?auto_22892 - BLOCK
      ?auto_22893 - BLOCK
      ?auto_22894 - BLOCK
    )
    :vars
    (
      ?auto_22895 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22894 ?auto_22895 ) ( ON-TABLE ?auto_22890 ) ( not ( = ?auto_22890 ?auto_22891 ) ) ( not ( = ?auto_22890 ?auto_22892 ) ) ( not ( = ?auto_22890 ?auto_22893 ) ) ( not ( = ?auto_22890 ?auto_22894 ) ) ( not ( = ?auto_22890 ?auto_22895 ) ) ( not ( = ?auto_22891 ?auto_22892 ) ) ( not ( = ?auto_22891 ?auto_22893 ) ) ( not ( = ?auto_22891 ?auto_22894 ) ) ( not ( = ?auto_22891 ?auto_22895 ) ) ( not ( = ?auto_22892 ?auto_22893 ) ) ( not ( = ?auto_22892 ?auto_22894 ) ) ( not ( = ?auto_22892 ?auto_22895 ) ) ( not ( = ?auto_22893 ?auto_22894 ) ) ( not ( = ?auto_22893 ?auto_22895 ) ) ( not ( = ?auto_22894 ?auto_22895 ) ) ( ON ?auto_22893 ?auto_22894 ) ( ON ?auto_22892 ?auto_22893 ) ( CLEAR ?auto_22890 ) ( ON ?auto_22891 ?auto_22892 ) ( CLEAR ?auto_22891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22890 ?auto_22891 )
      ( MAKE-5PILE ?auto_22890 ?auto_22891 ?auto_22892 ?auto_22893 ?auto_22894 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22901 - BLOCK
      ?auto_22902 - BLOCK
      ?auto_22903 - BLOCK
      ?auto_22904 - BLOCK
      ?auto_22905 - BLOCK
    )
    :vars
    (
      ?auto_22906 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22905 ?auto_22906 ) ( not ( = ?auto_22901 ?auto_22902 ) ) ( not ( = ?auto_22901 ?auto_22903 ) ) ( not ( = ?auto_22901 ?auto_22904 ) ) ( not ( = ?auto_22901 ?auto_22905 ) ) ( not ( = ?auto_22901 ?auto_22906 ) ) ( not ( = ?auto_22902 ?auto_22903 ) ) ( not ( = ?auto_22902 ?auto_22904 ) ) ( not ( = ?auto_22902 ?auto_22905 ) ) ( not ( = ?auto_22902 ?auto_22906 ) ) ( not ( = ?auto_22903 ?auto_22904 ) ) ( not ( = ?auto_22903 ?auto_22905 ) ) ( not ( = ?auto_22903 ?auto_22906 ) ) ( not ( = ?auto_22904 ?auto_22905 ) ) ( not ( = ?auto_22904 ?auto_22906 ) ) ( not ( = ?auto_22905 ?auto_22906 ) ) ( ON ?auto_22904 ?auto_22905 ) ( ON ?auto_22903 ?auto_22904 ) ( ON ?auto_22902 ?auto_22903 ) ( ON ?auto_22901 ?auto_22902 ) ( CLEAR ?auto_22901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22901 )
      ( MAKE-5PILE ?auto_22901 ?auto_22902 ?auto_22903 ?auto_22904 ?auto_22905 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22912 - BLOCK
      ?auto_22913 - BLOCK
      ?auto_22914 - BLOCK
      ?auto_22915 - BLOCK
      ?auto_22916 - BLOCK
    )
    :vars
    (
      ?auto_22917 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22916 ?auto_22917 ) ( not ( = ?auto_22912 ?auto_22913 ) ) ( not ( = ?auto_22912 ?auto_22914 ) ) ( not ( = ?auto_22912 ?auto_22915 ) ) ( not ( = ?auto_22912 ?auto_22916 ) ) ( not ( = ?auto_22912 ?auto_22917 ) ) ( not ( = ?auto_22913 ?auto_22914 ) ) ( not ( = ?auto_22913 ?auto_22915 ) ) ( not ( = ?auto_22913 ?auto_22916 ) ) ( not ( = ?auto_22913 ?auto_22917 ) ) ( not ( = ?auto_22914 ?auto_22915 ) ) ( not ( = ?auto_22914 ?auto_22916 ) ) ( not ( = ?auto_22914 ?auto_22917 ) ) ( not ( = ?auto_22915 ?auto_22916 ) ) ( not ( = ?auto_22915 ?auto_22917 ) ) ( not ( = ?auto_22916 ?auto_22917 ) ) ( ON ?auto_22915 ?auto_22916 ) ( ON ?auto_22914 ?auto_22915 ) ( ON ?auto_22913 ?auto_22914 ) ( ON ?auto_22912 ?auto_22913 ) ( CLEAR ?auto_22912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22912 )
      ( MAKE-5PILE ?auto_22912 ?auto_22913 ?auto_22914 ?auto_22915 ?auto_22916 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_22924 - BLOCK
      ?auto_22925 - BLOCK
      ?auto_22926 - BLOCK
      ?auto_22927 - BLOCK
      ?auto_22928 - BLOCK
      ?auto_22929 - BLOCK
    )
    :vars
    (
      ?auto_22930 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_22928 ) ( ON ?auto_22929 ?auto_22930 ) ( CLEAR ?auto_22929 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22924 ) ( ON ?auto_22925 ?auto_22924 ) ( ON ?auto_22926 ?auto_22925 ) ( ON ?auto_22927 ?auto_22926 ) ( ON ?auto_22928 ?auto_22927 ) ( not ( = ?auto_22924 ?auto_22925 ) ) ( not ( = ?auto_22924 ?auto_22926 ) ) ( not ( = ?auto_22924 ?auto_22927 ) ) ( not ( = ?auto_22924 ?auto_22928 ) ) ( not ( = ?auto_22924 ?auto_22929 ) ) ( not ( = ?auto_22924 ?auto_22930 ) ) ( not ( = ?auto_22925 ?auto_22926 ) ) ( not ( = ?auto_22925 ?auto_22927 ) ) ( not ( = ?auto_22925 ?auto_22928 ) ) ( not ( = ?auto_22925 ?auto_22929 ) ) ( not ( = ?auto_22925 ?auto_22930 ) ) ( not ( = ?auto_22926 ?auto_22927 ) ) ( not ( = ?auto_22926 ?auto_22928 ) ) ( not ( = ?auto_22926 ?auto_22929 ) ) ( not ( = ?auto_22926 ?auto_22930 ) ) ( not ( = ?auto_22927 ?auto_22928 ) ) ( not ( = ?auto_22927 ?auto_22929 ) ) ( not ( = ?auto_22927 ?auto_22930 ) ) ( not ( = ?auto_22928 ?auto_22929 ) ) ( not ( = ?auto_22928 ?auto_22930 ) ) ( not ( = ?auto_22929 ?auto_22930 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22929 ?auto_22930 )
      ( !STACK ?auto_22929 ?auto_22928 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_22937 - BLOCK
      ?auto_22938 - BLOCK
      ?auto_22939 - BLOCK
      ?auto_22940 - BLOCK
      ?auto_22941 - BLOCK
      ?auto_22942 - BLOCK
    )
    :vars
    (
      ?auto_22943 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_22941 ) ( ON ?auto_22942 ?auto_22943 ) ( CLEAR ?auto_22942 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22937 ) ( ON ?auto_22938 ?auto_22937 ) ( ON ?auto_22939 ?auto_22938 ) ( ON ?auto_22940 ?auto_22939 ) ( ON ?auto_22941 ?auto_22940 ) ( not ( = ?auto_22937 ?auto_22938 ) ) ( not ( = ?auto_22937 ?auto_22939 ) ) ( not ( = ?auto_22937 ?auto_22940 ) ) ( not ( = ?auto_22937 ?auto_22941 ) ) ( not ( = ?auto_22937 ?auto_22942 ) ) ( not ( = ?auto_22937 ?auto_22943 ) ) ( not ( = ?auto_22938 ?auto_22939 ) ) ( not ( = ?auto_22938 ?auto_22940 ) ) ( not ( = ?auto_22938 ?auto_22941 ) ) ( not ( = ?auto_22938 ?auto_22942 ) ) ( not ( = ?auto_22938 ?auto_22943 ) ) ( not ( = ?auto_22939 ?auto_22940 ) ) ( not ( = ?auto_22939 ?auto_22941 ) ) ( not ( = ?auto_22939 ?auto_22942 ) ) ( not ( = ?auto_22939 ?auto_22943 ) ) ( not ( = ?auto_22940 ?auto_22941 ) ) ( not ( = ?auto_22940 ?auto_22942 ) ) ( not ( = ?auto_22940 ?auto_22943 ) ) ( not ( = ?auto_22941 ?auto_22942 ) ) ( not ( = ?auto_22941 ?auto_22943 ) ) ( not ( = ?auto_22942 ?auto_22943 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22942 ?auto_22943 )
      ( !STACK ?auto_22942 ?auto_22941 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_22950 - BLOCK
      ?auto_22951 - BLOCK
      ?auto_22952 - BLOCK
      ?auto_22953 - BLOCK
      ?auto_22954 - BLOCK
      ?auto_22955 - BLOCK
    )
    :vars
    (
      ?auto_22956 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22955 ?auto_22956 ) ( ON-TABLE ?auto_22950 ) ( ON ?auto_22951 ?auto_22950 ) ( ON ?auto_22952 ?auto_22951 ) ( ON ?auto_22953 ?auto_22952 ) ( not ( = ?auto_22950 ?auto_22951 ) ) ( not ( = ?auto_22950 ?auto_22952 ) ) ( not ( = ?auto_22950 ?auto_22953 ) ) ( not ( = ?auto_22950 ?auto_22954 ) ) ( not ( = ?auto_22950 ?auto_22955 ) ) ( not ( = ?auto_22950 ?auto_22956 ) ) ( not ( = ?auto_22951 ?auto_22952 ) ) ( not ( = ?auto_22951 ?auto_22953 ) ) ( not ( = ?auto_22951 ?auto_22954 ) ) ( not ( = ?auto_22951 ?auto_22955 ) ) ( not ( = ?auto_22951 ?auto_22956 ) ) ( not ( = ?auto_22952 ?auto_22953 ) ) ( not ( = ?auto_22952 ?auto_22954 ) ) ( not ( = ?auto_22952 ?auto_22955 ) ) ( not ( = ?auto_22952 ?auto_22956 ) ) ( not ( = ?auto_22953 ?auto_22954 ) ) ( not ( = ?auto_22953 ?auto_22955 ) ) ( not ( = ?auto_22953 ?auto_22956 ) ) ( not ( = ?auto_22954 ?auto_22955 ) ) ( not ( = ?auto_22954 ?auto_22956 ) ) ( not ( = ?auto_22955 ?auto_22956 ) ) ( CLEAR ?auto_22953 ) ( ON ?auto_22954 ?auto_22955 ) ( CLEAR ?auto_22954 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_22950 ?auto_22951 ?auto_22952 ?auto_22953 ?auto_22954 )
      ( MAKE-6PILE ?auto_22950 ?auto_22951 ?auto_22952 ?auto_22953 ?auto_22954 ?auto_22955 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_22963 - BLOCK
      ?auto_22964 - BLOCK
      ?auto_22965 - BLOCK
      ?auto_22966 - BLOCK
      ?auto_22967 - BLOCK
      ?auto_22968 - BLOCK
    )
    :vars
    (
      ?auto_22969 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22968 ?auto_22969 ) ( ON-TABLE ?auto_22963 ) ( ON ?auto_22964 ?auto_22963 ) ( ON ?auto_22965 ?auto_22964 ) ( ON ?auto_22966 ?auto_22965 ) ( not ( = ?auto_22963 ?auto_22964 ) ) ( not ( = ?auto_22963 ?auto_22965 ) ) ( not ( = ?auto_22963 ?auto_22966 ) ) ( not ( = ?auto_22963 ?auto_22967 ) ) ( not ( = ?auto_22963 ?auto_22968 ) ) ( not ( = ?auto_22963 ?auto_22969 ) ) ( not ( = ?auto_22964 ?auto_22965 ) ) ( not ( = ?auto_22964 ?auto_22966 ) ) ( not ( = ?auto_22964 ?auto_22967 ) ) ( not ( = ?auto_22964 ?auto_22968 ) ) ( not ( = ?auto_22964 ?auto_22969 ) ) ( not ( = ?auto_22965 ?auto_22966 ) ) ( not ( = ?auto_22965 ?auto_22967 ) ) ( not ( = ?auto_22965 ?auto_22968 ) ) ( not ( = ?auto_22965 ?auto_22969 ) ) ( not ( = ?auto_22966 ?auto_22967 ) ) ( not ( = ?auto_22966 ?auto_22968 ) ) ( not ( = ?auto_22966 ?auto_22969 ) ) ( not ( = ?auto_22967 ?auto_22968 ) ) ( not ( = ?auto_22967 ?auto_22969 ) ) ( not ( = ?auto_22968 ?auto_22969 ) ) ( CLEAR ?auto_22966 ) ( ON ?auto_22967 ?auto_22968 ) ( CLEAR ?auto_22967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_22963 ?auto_22964 ?auto_22965 ?auto_22966 ?auto_22967 )
      ( MAKE-6PILE ?auto_22963 ?auto_22964 ?auto_22965 ?auto_22966 ?auto_22967 ?auto_22968 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_22976 - BLOCK
      ?auto_22977 - BLOCK
      ?auto_22978 - BLOCK
      ?auto_22979 - BLOCK
      ?auto_22980 - BLOCK
      ?auto_22981 - BLOCK
    )
    :vars
    (
      ?auto_22982 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22981 ?auto_22982 ) ( ON-TABLE ?auto_22976 ) ( ON ?auto_22977 ?auto_22976 ) ( ON ?auto_22978 ?auto_22977 ) ( not ( = ?auto_22976 ?auto_22977 ) ) ( not ( = ?auto_22976 ?auto_22978 ) ) ( not ( = ?auto_22976 ?auto_22979 ) ) ( not ( = ?auto_22976 ?auto_22980 ) ) ( not ( = ?auto_22976 ?auto_22981 ) ) ( not ( = ?auto_22976 ?auto_22982 ) ) ( not ( = ?auto_22977 ?auto_22978 ) ) ( not ( = ?auto_22977 ?auto_22979 ) ) ( not ( = ?auto_22977 ?auto_22980 ) ) ( not ( = ?auto_22977 ?auto_22981 ) ) ( not ( = ?auto_22977 ?auto_22982 ) ) ( not ( = ?auto_22978 ?auto_22979 ) ) ( not ( = ?auto_22978 ?auto_22980 ) ) ( not ( = ?auto_22978 ?auto_22981 ) ) ( not ( = ?auto_22978 ?auto_22982 ) ) ( not ( = ?auto_22979 ?auto_22980 ) ) ( not ( = ?auto_22979 ?auto_22981 ) ) ( not ( = ?auto_22979 ?auto_22982 ) ) ( not ( = ?auto_22980 ?auto_22981 ) ) ( not ( = ?auto_22980 ?auto_22982 ) ) ( not ( = ?auto_22981 ?auto_22982 ) ) ( ON ?auto_22980 ?auto_22981 ) ( CLEAR ?auto_22978 ) ( ON ?auto_22979 ?auto_22980 ) ( CLEAR ?auto_22979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22976 ?auto_22977 ?auto_22978 ?auto_22979 )
      ( MAKE-6PILE ?auto_22976 ?auto_22977 ?auto_22978 ?auto_22979 ?auto_22980 ?auto_22981 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_22989 - BLOCK
      ?auto_22990 - BLOCK
      ?auto_22991 - BLOCK
      ?auto_22992 - BLOCK
      ?auto_22993 - BLOCK
      ?auto_22994 - BLOCK
    )
    :vars
    (
      ?auto_22995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22994 ?auto_22995 ) ( ON-TABLE ?auto_22989 ) ( ON ?auto_22990 ?auto_22989 ) ( ON ?auto_22991 ?auto_22990 ) ( not ( = ?auto_22989 ?auto_22990 ) ) ( not ( = ?auto_22989 ?auto_22991 ) ) ( not ( = ?auto_22989 ?auto_22992 ) ) ( not ( = ?auto_22989 ?auto_22993 ) ) ( not ( = ?auto_22989 ?auto_22994 ) ) ( not ( = ?auto_22989 ?auto_22995 ) ) ( not ( = ?auto_22990 ?auto_22991 ) ) ( not ( = ?auto_22990 ?auto_22992 ) ) ( not ( = ?auto_22990 ?auto_22993 ) ) ( not ( = ?auto_22990 ?auto_22994 ) ) ( not ( = ?auto_22990 ?auto_22995 ) ) ( not ( = ?auto_22991 ?auto_22992 ) ) ( not ( = ?auto_22991 ?auto_22993 ) ) ( not ( = ?auto_22991 ?auto_22994 ) ) ( not ( = ?auto_22991 ?auto_22995 ) ) ( not ( = ?auto_22992 ?auto_22993 ) ) ( not ( = ?auto_22992 ?auto_22994 ) ) ( not ( = ?auto_22992 ?auto_22995 ) ) ( not ( = ?auto_22993 ?auto_22994 ) ) ( not ( = ?auto_22993 ?auto_22995 ) ) ( not ( = ?auto_22994 ?auto_22995 ) ) ( ON ?auto_22993 ?auto_22994 ) ( CLEAR ?auto_22991 ) ( ON ?auto_22992 ?auto_22993 ) ( CLEAR ?auto_22992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22989 ?auto_22990 ?auto_22991 ?auto_22992 )
      ( MAKE-6PILE ?auto_22989 ?auto_22990 ?auto_22991 ?auto_22992 ?auto_22993 ?auto_22994 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_23002 - BLOCK
      ?auto_23003 - BLOCK
      ?auto_23004 - BLOCK
      ?auto_23005 - BLOCK
      ?auto_23006 - BLOCK
      ?auto_23007 - BLOCK
    )
    :vars
    (
      ?auto_23008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23007 ?auto_23008 ) ( ON-TABLE ?auto_23002 ) ( ON ?auto_23003 ?auto_23002 ) ( not ( = ?auto_23002 ?auto_23003 ) ) ( not ( = ?auto_23002 ?auto_23004 ) ) ( not ( = ?auto_23002 ?auto_23005 ) ) ( not ( = ?auto_23002 ?auto_23006 ) ) ( not ( = ?auto_23002 ?auto_23007 ) ) ( not ( = ?auto_23002 ?auto_23008 ) ) ( not ( = ?auto_23003 ?auto_23004 ) ) ( not ( = ?auto_23003 ?auto_23005 ) ) ( not ( = ?auto_23003 ?auto_23006 ) ) ( not ( = ?auto_23003 ?auto_23007 ) ) ( not ( = ?auto_23003 ?auto_23008 ) ) ( not ( = ?auto_23004 ?auto_23005 ) ) ( not ( = ?auto_23004 ?auto_23006 ) ) ( not ( = ?auto_23004 ?auto_23007 ) ) ( not ( = ?auto_23004 ?auto_23008 ) ) ( not ( = ?auto_23005 ?auto_23006 ) ) ( not ( = ?auto_23005 ?auto_23007 ) ) ( not ( = ?auto_23005 ?auto_23008 ) ) ( not ( = ?auto_23006 ?auto_23007 ) ) ( not ( = ?auto_23006 ?auto_23008 ) ) ( not ( = ?auto_23007 ?auto_23008 ) ) ( ON ?auto_23006 ?auto_23007 ) ( ON ?auto_23005 ?auto_23006 ) ( CLEAR ?auto_23003 ) ( ON ?auto_23004 ?auto_23005 ) ( CLEAR ?auto_23004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23002 ?auto_23003 ?auto_23004 )
      ( MAKE-6PILE ?auto_23002 ?auto_23003 ?auto_23004 ?auto_23005 ?auto_23006 ?auto_23007 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_23015 - BLOCK
      ?auto_23016 - BLOCK
      ?auto_23017 - BLOCK
      ?auto_23018 - BLOCK
      ?auto_23019 - BLOCK
      ?auto_23020 - BLOCK
    )
    :vars
    (
      ?auto_23021 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23020 ?auto_23021 ) ( ON-TABLE ?auto_23015 ) ( ON ?auto_23016 ?auto_23015 ) ( not ( = ?auto_23015 ?auto_23016 ) ) ( not ( = ?auto_23015 ?auto_23017 ) ) ( not ( = ?auto_23015 ?auto_23018 ) ) ( not ( = ?auto_23015 ?auto_23019 ) ) ( not ( = ?auto_23015 ?auto_23020 ) ) ( not ( = ?auto_23015 ?auto_23021 ) ) ( not ( = ?auto_23016 ?auto_23017 ) ) ( not ( = ?auto_23016 ?auto_23018 ) ) ( not ( = ?auto_23016 ?auto_23019 ) ) ( not ( = ?auto_23016 ?auto_23020 ) ) ( not ( = ?auto_23016 ?auto_23021 ) ) ( not ( = ?auto_23017 ?auto_23018 ) ) ( not ( = ?auto_23017 ?auto_23019 ) ) ( not ( = ?auto_23017 ?auto_23020 ) ) ( not ( = ?auto_23017 ?auto_23021 ) ) ( not ( = ?auto_23018 ?auto_23019 ) ) ( not ( = ?auto_23018 ?auto_23020 ) ) ( not ( = ?auto_23018 ?auto_23021 ) ) ( not ( = ?auto_23019 ?auto_23020 ) ) ( not ( = ?auto_23019 ?auto_23021 ) ) ( not ( = ?auto_23020 ?auto_23021 ) ) ( ON ?auto_23019 ?auto_23020 ) ( ON ?auto_23018 ?auto_23019 ) ( CLEAR ?auto_23016 ) ( ON ?auto_23017 ?auto_23018 ) ( CLEAR ?auto_23017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23015 ?auto_23016 ?auto_23017 )
      ( MAKE-6PILE ?auto_23015 ?auto_23016 ?auto_23017 ?auto_23018 ?auto_23019 ?auto_23020 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_23028 - BLOCK
      ?auto_23029 - BLOCK
      ?auto_23030 - BLOCK
      ?auto_23031 - BLOCK
      ?auto_23032 - BLOCK
      ?auto_23033 - BLOCK
    )
    :vars
    (
      ?auto_23034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23033 ?auto_23034 ) ( ON-TABLE ?auto_23028 ) ( not ( = ?auto_23028 ?auto_23029 ) ) ( not ( = ?auto_23028 ?auto_23030 ) ) ( not ( = ?auto_23028 ?auto_23031 ) ) ( not ( = ?auto_23028 ?auto_23032 ) ) ( not ( = ?auto_23028 ?auto_23033 ) ) ( not ( = ?auto_23028 ?auto_23034 ) ) ( not ( = ?auto_23029 ?auto_23030 ) ) ( not ( = ?auto_23029 ?auto_23031 ) ) ( not ( = ?auto_23029 ?auto_23032 ) ) ( not ( = ?auto_23029 ?auto_23033 ) ) ( not ( = ?auto_23029 ?auto_23034 ) ) ( not ( = ?auto_23030 ?auto_23031 ) ) ( not ( = ?auto_23030 ?auto_23032 ) ) ( not ( = ?auto_23030 ?auto_23033 ) ) ( not ( = ?auto_23030 ?auto_23034 ) ) ( not ( = ?auto_23031 ?auto_23032 ) ) ( not ( = ?auto_23031 ?auto_23033 ) ) ( not ( = ?auto_23031 ?auto_23034 ) ) ( not ( = ?auto_23032 ?auto_23033 ) ) ( not ( = ?auto_23032 ?auto_23034 ) ) ( not ( = ?auto_23033 ?auto_23034 ) ) ( ON ?auto_23032 ?auto_23033 ) ( ON ?auto_23031 ?auto_23032 ) ( ON ?auto_23030 ?auto_23031 ) ( CLEAR ?auto_23028 ) ( ON ?auto_23029 ?auto_23030 ) ( CLEAR ?auto_23029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23028 ?auto_23029 )
      ( MAKE-6PILE ?auto_23028 ?auto_23029 ?auto_23030 ?auto_23031 ?auto_23032 ?auto_23033 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_23041 - BLOCK
      ?auto_23042 - BLOCK
      ?auto_23043 - BLOCK
      ?auto_23044 - BLOCK
      ?auto_23045 - BLOCK
      ?auto_23046 - BLOCK
    )
    :vars
    (
      ?auto_23047 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23046 ?auto_23047 ) ( ON-TABLE ?auto_23041 ) ( not ( = ?auto_23041 ?auto_23042 ) ) ( not ( = ?auto_23041 ?auto_23043 ) ) ( not ( = ?auto_23041 ?auto_23044 ) ) ( not ( = ?auto_23041 ?auto_23045 ) ) ( not ( = ?auto_23041 ?auto_23046 ) ) ( not ( = ?auto_23041 ?auto_23047 ) ) ( not ( = ?auto_23042 ?auto_23043 ) ) ( not ( = ?auto_23042 ?auto_23044 ) ) ( not ( = ?auto_23042 ?auto_23045 ) ) ( not ( = ?auto_23042 ?auto_23046 ) ) ( not ( = ?auto_23042 ?auto_23047 ) ) ( not ( = ?auto_23043 ?auto_23044 ) ) ( not ( = ?auto_23043 ?auto_23045 ) ) ( not ( = ?auto_23043 ?auto_23046 ) ) ( not ( = ?auto_23043 ?auto_23047 ) ) ( not ( = ?auto_23044 ?auto_23045 ) ) ( not ( = ?auto_23044 ?auto_23046 ) ) ( not ( = ?auto_23044 ?auto_23047 ) ) ( not ( = ?auto_23045 ?auto_23046 ) ) ( not ( = ?auto_23045 ?auto_23047 ) ) ( not ( = ?auto_23046 ?auto_23047 ) ) ( ON ?auto_23045 ?auto_23046 ) ( ON ?auto_23044 ?auto_23045 ) ( ON ?auto_23043 ?auto_23044 ) ( CLEAR ?auto_23041 ) ( ON ?auto_23042 ?auto_23043 ) ( CLEAR ?auto_23042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23041 ?auto_23042 )
      ( MAKE-6PILE ?auto_23041 ?auto_23042 ?auto_23043 ?auto_23044 ?auto_23045 ?auto_23046 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_23054 - BLOCK
      ?auto_23055 - BLOCK
      ?auto_23056 - BLOCK
      ?auto_23057 - BLOCK
      ?auto_23058 - BLOCK
      ?auto_23059 - BLOCK
    )
    :vars
    (
      ?auto_23060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23059 ?auto_23060 ) ( not ( = ?auto_23054 ?auto_23055 ) ) ( not ( = ?auto_23054 ?auto_23056 ) ) ( not ( = ?auto_23054 ?auto_23057 ) ) ( not ( = ?auto_23054 ?auto_23058 ) ) ( not ( = ?auto_23054 ?auto_23059 ) ) ( not ( = ?auto_23054 ?auto_23060 ) ) ( not ( = ?auto_23055 ?auto_23056 ) ) ( not ( = ?auto_23055 ?auto_23057 ) ) ( not ( = ?auto_23055 ?auto_23058 ) ) ( not ( = ?auto_23055 ?auto_23059 ) ) ( not ( = ?auto_23055 ?auto_23060 ) ) ( not ( = ?auto_23056 ?auto_23057 ) ) ( not ( = ?auto_23056 ?auto_23058 ) ) ( not ( = ?auto_23056 ?auto_23059 ) ) ( not ( = ?auto_23056 ?auto_23060 ) ) ( not ( = ?auto_23057 ?auto_23058 ) ) ( not ( = ?auto_23057 ?auto_23059 ) ) ( not ( = ?auto_23057 ?auto_23060 ) ) ( not ( = ?auto_23058 ?auto_23059 ) ) ( not ( = ?auto_23058 ?auto_23060 ) ) ( not ( = ?auto_23059 ?auto_23060 ) ) ( ON ?auto_23058 ?auto_23059 ) ( ON ?auto_23057 ?auto_23058 ) ( ON ?auto_23056 ?auto_23057 ) ( ON ?auto_23055 ?auto_23056 ) ( ON ?auto_23054 ?auto_23055 ) ( CLEAR ?auto_23054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23054 )
      ( MAKE-6PILE ?auto_23054 ?auto_23055 ?auto_23056 ?auto_23057 ?auto_23058 ?auto_23059 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_23067 - BLOCK
      ?auto_23068 - BLOCK
      ?auto_23069 - BLOCK
      ?auto_23070 - BLOCK
      ?auto_23071 - BLOCK
      ?auto_23072 - BLOCK
    )
    :vars
    (
      ?auto_23073 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23072 ?auto_23073 ) ( not ( = ?auto_23067 ?auto_23068 ) ) ( not ( = ?auto_23067 ?auto_23069 ) ) ( not ( = ?auto_23067 ?auto_23070 ) ) ( not ( = ?auto_23067 ?auto_23071 ) ) ( not ( = ?auto_23067 ?auto_23072 ) ) ( not ( = ?auto_23067 ?auto_23073 ) ) ( not ( = ?auto_23068 ?auto_23069 ) ) ( not ( = ?auto_23068 ?auto_23070 ) ) ( not ( = ?auto_23068 ?auto_23071 ) ) ( not ( = ?auto_23068 ?auto_23072 ) ) ( not ( = ?auto_23068 ?auto_23073 ) ) ( not ( = ?auto_23069 ?auto_23070 ) ) ( not ( = ?auto_23069 ?auto_23071 ) ) ( not ( = ?auto_23069 ?auto_23072 ) ) ( not ( = ?auto_23069 ?auto_23073 ) ) ( not ( = ?auto_23070 ?auto_23071 ) ) ( not ( = ?auto_23070 ?auto_23072 ) ) ( not ( = ?auto_23070 ?auto_23073 ) ) ( not ( = ?auto_23071 ?auto_23072 ) ) ( not ( = ?auto_23071 ?auto_23073 ) ) ( not ( = ?auto_23072 ?auto_23073 ) ) ( ON ?auto_23071 ?auto_23072 ) ( ON ?auto_23070 ?auto_23071 ) ( ON ?auto_23069 ?auto_23070 ) ( ON ?auto_23068 ?auto_23069 ) ( ON ?auto_23067 ?auto_23068 ) ( CLEAR ?auto_23067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23067 )
      ( MAKE-6PILE ?auto_23067 ?auto_23068 ?auto_23069 ?auto_23070 ?auto_23071 ?auto_23072 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23081 - BLOCK
      ?auto_23082 - BLOCK
      ?auto_23083 - BLOCK
      ?auto_23084 - BLOCK
      ?auto_23085 - BLOCK
      ?auto_23086 - BLOCK
      ?auto_23087 - BLOCK
    )
    :vars
    (
      ?auto_23088 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_23086 ) ( ON ?auto_23087 ?auto_23088 ) ( CLEAR ?auto_23087 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23081 ) ( ON ?auto_23082 ?auto_23081 ) ( ON ?auto_23083 ?auto_23082 ) ( ON ?auto_23084 ?auto_23083 ) ( ON ?auto_23085 ?auto_23084 ) ( ON ?auto_23086 ?auto_23085 ) ( not ( = ?auto_23081 ?auto_23082 ) ) ( not ( = ?auto_23081 ?auto_23083 ) ) ( not ( = ?auto_23081 ?auto_23084 ) ) ( not ( = ?auto_23081 ?auto_23085 ) ) ( not ( = ?auto_23081 ?auto_23086 ) ) ( not ( = ?auto_23081 ?auto_23087 ) ) ( not ( = ?auto_23081 ?auto_23088 ) ) ( not ( = ?auto_23082 ?auto_23083 ) ) ( not ( = ?auto_23082 ?auto_23084 ) ) ( not ( = ?auto_23082 ?auto_23085 ) ) ( not ( = ?auto_23082 ?auto_23086 ) ) ( not ( = ?auto_23082 ?auto_23087 ) ) ( not ( = ?auto_23082 ?auto_23088 ) ) ( not ( = ?auto_23083 ?auto_23084 ) ) ( not ( = ?auto_23083 ?auto_23085 ) ) ( not ( = ?auto_23083 ?auto_23086 ) ) ( not ( = ?auto_23083 ?auto_23087 ) ) ( not ( = ?auto_23083 ?auto_23088 ) ) ( not ( = ?auto_23084 ?auto_23085 ) ) ( not ( = ?auto_23084 ?auto_23086 ) ) ( not ( = ?auto_23084 ?auto_23087 ) ) ( not ( = ?auto_23084 ?auto_23088 ) ) ( not ( = ?auto_23085 ?auto_23086 ) ) ( not ( = ?auto_23085 ?auto_23087 ) ) ( not ( = ?auto_23085 ?auto_23088 ) ) ( not ( = ?auto_23086 ?auto_23087 ) ) ( not ( = ?auto_23086 ?auto_23088 ) ) ( not ( = ?auto_23087 ?auto_23088 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23087 ?auto_23088 )
      ( !STACK ?auto_23087 ?auto_23086 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23096 - BLOCK
      ?auto_23097 - BLOCK
      ?auto_23098 - BLOCK
      ?auto_23099 - BLOCK
      ?auto_23100 - BLOCK
      ?auto_23101 - BLOCK
      ?auto_23102 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_23101 ) ( ON-TABLE ?auto_23102 ) ( CLEAR ?auto_23102 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23096 ) ( ON ?auto_23097 ?auto_23096 ) ( ON ?auto_23098 ?auto_23097 ) ( ON ?auto_23099 ?auto_23098 ) ( ON ?auto_23100 ?auto_23099 ) ( ON ?auto_23101 ?auto_23100 ) ( not ( = ?auto_23096 ?auto_23097 ) ) ( not ( = ?auto_23096 ?auto_23098 ) ) ( not ( = ?auto_23096 ?auto_23099 ) ) ( not ( = ?auto_23096 ?auto_23100 ) ) ( not ( = ?auto_23096 ?auto_23101 ) ) ( not ( = ?auto_23096 ?auto_23102 ) ) ( not ( = ?auto_23097 ?auto_23098 ) ) ( not ( = ?auto_23097 ?auto_23099 ) ) ( not ( = ?auto_23097 ?auto_23100 ) ) ( not ( = ?auto_23097 ?auto_23101 ) ) ( not ( = ?auto_23097 ?auto_23102 ) ) ( not ( = ?auto_23098 ?auto_23099 ) ) ( not ( = ?auto_23098 ?auto_23100 ) ) ( not ( = ?auto_23098 ?auto_23101 ) ) ( not ( = ?auto_23098 ?auto_23102 ) ) ( not ( = ?auto_23099 ?auto_23100 ) ) ( not ( = ?auto_23099 ?auto_23101 ) ) ( not ( = ?auto_23099 ?auto_23102 ) ) ( not ( = ?auto_23100 ?auto_23101 ) ) ( not ( = ?auto_23100 ?auto_23102 ) ) ( not ( = ?auto_23101 ?auto_23102 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_23102 )
      ( !STACK ?auto_23102 ?auto_23101 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23110 - BLOCK
      ?auto_23111 - BLOCK
      ?auto_23112 - BLOCK
      ?auto_23113 - BLOCK
      ?auto_23114 - BLOCK
      ?auto_23115 - BLOCK
      ?auto_23116 - BLOCK
    )
    :vars
    (
      ?auto_23117 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23116 ?auto_23117 ) ( ON-TABLE ?auto_23110 ) ( ON ?auto_23111 ?auto_23110 ) ( ON ?auto_23112 ?auto_23111 ) ( ON ?auto_23113 ?auto_23112 ) ( ON ?auto_23114 ?auto_23113 ) ( not ( = ?auto_23110 ?auto_23111 ) ) ( not ( = ?auto_23110 ?auto_23112 ) ) ( not ( = ?auto_23110 ?auto_23113 ) ) ( not ( = ?auto_23110 ?auto_23114 ) ) ( not ( = ?auto_23110 ?auto_23115 ) ) ( not ( = ?auto_23110 ?auto_23116 ) ) ( not ( = ?auto_23110 ?auto_23117 ) ) ( not ( = ?auto_23111 ?auto_23112 ) ) ( not ( = ?auto_23111 ?auto_23113 ) ) ( not ( = ?auto_23111 ?auto_23114 ) ) ( not ( = ?auto_23111 ?auto_23115 ) ) ( not ( = ?auto_23111 ?auto_23116 ) ) ( not ( = ?auto_23111 ?auto_23117 ) ) ( not ( = ?auto_23112 ?auto_23113 ) ) ( not ( = ?auto_23112 ?auto_23114 ) ) ( not ( = ?auto_23112 ?auto_23115 ) ) ( not ( = ?auto_23112 ?auto_23116 ) ) ( not ( = ?auto_23112 ?auto_23117 ) ) ( not ( = ?auto_23113 ?auto_23114 ) ) ( not ( = ?auto_23113 ?auto_23115 ) ) ( not ( = ?auto_23113 ?auto_23116 ) ) ( not ( = ?auto_23113 ?auto_23117 ) ) ( not ( = ?auto_23114 ?auto_23115 ) ) ( not ( = ?auto_23114 ?auto_23116 ) ) ( not ( = ?auto_23114 ?auto_23117 ) ) ( not ( = ?auto_23115 ?auto_23116 ) ) ( not ( = ?auto_23115 ?auto_23117 ) ) ( not ( = ?auto_23116 ?auto_23117 ) ) ( CLEAR ?auto_23114 ) ( ON ?auto_23115 ?auto_23116 ) ( CLEAR ?auto_23115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_23110 ?auto_23111 ?auto_23112 ?auto_23113 ?auto_23114 ?auto_23115 )
      ( MAKE-7PILE ?auto_23110 ?auto_23111 ?auto_23112 ?auto_23113 ?auto_23114 ?auto_23115 ?auto_23116 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23125 - BLOCK
      ?auto_23126 - BLOCK
      ?auto_23127 - BLOCK
      ?auto_23128 - BLOCK
      ?auto_23129 - BLOCK
      ?auto_23130 - BLOCK
      ?auto_23131 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23131 ) ( ON-TABLE ?auto_23125 ) ( ON ?auto_23126 ?auto_23125 ) ( ON ?auto_23127 ?auto_23126 ) ( ON ?auto_23128 ?auto_23127 ) ( ON ?auto_23129 ?auto_23128 ) ( not ( = ?auto_23125 ?auto_23126 ) ) ( not ( = ?auto_23125 ?auto_23127 ) ) ( not ( = ?auto_23125 ?auto_23128 ) ) ( not ( = ?auto_23125 ?auto_23129 ) ) ( not ( = ?auto_23125 ?auto_23130 ) ) ( not ( = ?auto_23125 ?auto_23131 ) ) ( not ( = ?auto_23126 ?auto_23127 ) ) ( not ( = ?auto_23126 ?auto_23128 ) ) ( not ( = ?auto_23126 ?auto_23129 ) ) ( not ( = ?auto_23126 ?auto_23130 ) ) ( not ( = ?auto_23126 ?auto_23131 ) ) ( not ( = ?auto_23127 ?auto_23128 ) ) ( not ( = ?auto_23127 ?auto_23129 ) ) ( not ( = ?auto_23127 ?auto_23130 ) ) ( not ( = ?auto_23127 ?auto_23131 ) ) ( not ( = ?auto_23128 ?auto_23129 ) ) ( not ( = ?auto_23128 ?auto_23130 ) ) ( not ( = ?auto_23128 ?auto_23131 ) ) ( not ( = ?auto_23129 ?auto_23130 ) ) ( not ( = ?auto_23129 ?auto_23131 ) ) ( not ( = ?auto_23130 ?auto_23131 ) ) ( CLEAR ?auto_23129 ) ( ON ?auto_23130 ?auto_23131 ) ( CLEAR ?auto_23130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_23125 ?auto_23126 ?auto_23127 ?auto_23128 ?auto_23129 ?auto_23130 )
      ( MAKE-7PILE ?auto_23125 ?auto_23126 ?auto_23127 ?auto_23128 ?auto_23129 ?auto_23130 ?auto_23131 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23139 - BLOCK
      ?auto_23140 - BLOCK
      ?auto_23141 - BLOCK
      ?auto_23142 - BLOCK
      ?auto_23143 - BLOCK
      ?auto_23144 - BLOCK
      ?auto_23145 - BLOCK
    )
    :vars
    (
      ?auto_23146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23145 ?auto_23146 ) ( ON-TABLE ?auto_23139 ) ( ON ?auto_23140 ?auto_23139 ) ( ON ?auto_23141 ?auto_23140 ) ( ON ?auto_23142 ?auto_23141 ) ( not ( = ?auto_23139 ?auto_23140 ) ) ( not ( = ?auto_23139 ?auto_23141 ) ) ( not ( = ?auto_23139 ?auto_23142 ) ) ( not ( = ?auto_23139 ?auto_23143 ) ) ( not ( = ?auto_23139 ?auto_23144 ) ) ( not ( = ?auto_23139 ?auto_23145 ) ) ( not ( = ?auto_23139 ?auto_23146 ) ) ( not ( = ?auto_23140 ?auto_23141 ) ) ( not ( = ?auto_23140 ?auto_23142 ) ) ( not ( = ?auto_23140 ?auto_23143 ) ) ( not ( = ?auto_23140 ?auto_23144 ) ) ( not ( = ?auto_23140 ?auto_23145 ) ) ( not ( = ?auto_23140 ?auto_23146 ) ) ( not ( = ?auto_23141 ?auto_23142 ) ) ( not ( = ?auto_23141 ?auto_23143 ) ) ( not ( = ?auto_23141 ?auto_23144 ) ) ( not ( = ?auto_23141 ?auto_23145 ) ) ( not ( = ?auto_23141 ?auto_23146 ) ) ( not ( = ?auto_23142 ?auto_23143 ) ) ( not ( = ?auto_23142 ?auto_23144 ) ) ( not ( = ?auto_23142 ?auto_23145 ) ) ( not ( = ?auto_23142 ?auto_23146 ) ) ( not ( = ?auto_23143 ?auto_23144 ) ) ( not ( = ?auto_23143 ?auto_23145 ) ) ( not ( = ?auto_23143 ?auto_23146 ) ) ( not ( = ?auto_23144 ?auto_23145 ) ) ( not ( = ?auto_23144 ?auto_23146 ) ) ( not ( = ?auto_23145 ?auto_23146 ) ) ( ON ?auto_23144 ?auto_23145 ) ( CLEAR ?auto_23142 ) ( ON ?auto_23143 ?auto_23144 ) ( CLEAR ?auto_23143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23139 ?auto_23140 ?auto_23141 ?auto_23142 ?auto_23143 )
      ( MAKE-7PILE ?auto_23139 ?auto_23140 ?auto_23141 ?auto_23142 ?auto_23143 ?auto_23144 ?auto_23145 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23154 - BLOCK
      ?auto_23155 - BLOCK
      ?auto_23156 - BLOCK
      ?auto_23157 - BLOCK
      ?auto_23158 - BLOCK
      ?auto_23159 - BLOCK
      ?auto_23160 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23160 ) ( ON-TABLE ?auto_23154 ) ( ON ?auto_23155 ?auto_23154 ) ( ON ?auto_23156 ?auto_23155 ) ( ON ?auto_23157 ?auto_23156 ) ( not ( = ?auto_23154 ?auto_23155 ) ) ( not ( = ?auto_23154 ?auto_23156 ) ) ( not ( = ?auto_23154 ?auto_23157 ) ) ( not ( = ?auto_23154 ?auto_23158 ) ) ( not ( = ?auto_23154 ?auto_23159 ) ) ( not ( = ?auto_23154 ?auto_23160 ) ) ( not ( = ?auto_23155 ?auto_23156 ) ) ( not ( = ?auto_23155 ?auto_23157 ) ) ( not ( = ?auto_23155 ?auto_23158 ) ) ( not ( = ?auto_23155 ?auto_23159 ) ) ( not ( = ?auto_23155 ?auto_23160 ) ) ( not ( = ?auto_23156 ?auto_23157 ) ) ( not ( = ?auto_23156 ?auto_23158 ) ) ( not ( = ?auto_23156 ?auto_23159 ) ) ( not ( = ?auto_23156 ?auto_23160 ) ) ( not ( = ?auto_23157 ?auto_23158 ) ) ( not ( = ?auto_23157 ?auto_23159 ) ) ( not ( = ?auto_23157 ?auto_23160 ) ) ( not ( = ?auto_23158 ?auto_23159 ) ) ( not ( = ?auto_23158 ?auto_23160 ) ) ( not ( = ?auto_23159 ?auto_23160 ) ) ( ON ?auto_23159 ?auto_23160 ) ( CLEAR ?auto_23157 ) ( ON ?auto_23158 ?auto_23159 ) ( CLEAR ?auto_23158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23154 ?auto_23155 ?auto_23156 ?auto_23157 ?auto_23158 )
      ( MAKE-7PILE ?auto_23154 ?auto_23155 ?auto_23156 ?auto_23157 ?auto_23158 ?auto_23159 ?auto_23160 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23168 - BLOCK
      ?auto_23169 - BLOCK
      ?auto_23170 - BLOCK
      ?auto_23171 - BLOCK
      ?auto_23172 - BLOCK
      ?auto_23173 - BLOCK
      ?auto_23174 - BLOCK
    )
    :vars
    (
      ?auto_23175 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23174 ?auto_23175 ) ( ON-TABLE ?auto_23168 ) ( ON ?auto_23169 ?auto_23168 ) ( ON ?auto_23170 ?auto_23169 ) ( not ( = ?auto_23168 ?auto_23169 ) ) ( not ( = ?auto_23168 ?auto_23170 ) ) ( not ( = ?auto_23168 ?auto_23171 ) ) ( not ( = ?auto_23168 ?auto_23172 ) ) ( not ( = ?auto_23168 ?auto_23173 ) ) ( not ( = ?auto_23168 ?auto_23174 ) ) ( not ( = ?auto_23168 ?auto_23175 ) ) ( not ( = ?auto_23169 ?auto_23170 ) ) ( not ( = ?auto_23169 ?auto_23171 ) ) ( not ( = ?auto_23169 ?auto_23172 ) ) ( not ( = ?auto_23169 ?auto_23173 ) ) ( not ( = ?auto_23169 ?auto_23174 ) ) ( not ( = ?auto_23169 ?auto_23175 ) ) ( not ( = ?auto_23170 ?auto_23171 ) ) ( not ( = ?auto_23170 ?auto_23172 ) ) ( not ( = ?auto_23170 ?auto_23173 ) ) ( not ( = ?auto_23170 ?auto_23174 ) ) ( not ( = ?auto_23170 ?auto_23175 ) ) ( not ( = ?auto_23171 ?auto_23172 ) ) ( not ( = ?auto_23171 ?auto_23173 ) ) ( not ( = ?auto_23171 ?auto_23174 ) ) ( not ( = ?auto_23171 ?auto_23175 ) ) ( not ( = ?auto_23172 ?auto_23173 ) ) ( not ( = ?auto_23172 ?auto_23174 ) ) ( not ( = ?auto_23172 ?auto_23175 ) ) ( not ( = ?auto_23173 ?auto_23174 ) ) ( not ( = ?auto_23173 ?auto_23175 ) ) ( not ( = ?auto_23174 ?auto_23175 ) ) ( ON ?auto_23173 ?auto_23174 ) ( ON ?auto_23172 ?auto_23173 ) ( CLEAR ?auto_23170 ) ( ON ?auto_23171 ?auto_23172 ) ( CLEAR ?auto_23171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23168 ?auto_23169 ?auto_23170 ?auto_23171 )
      ( MAKE-7PILE ?auto_23168 ?auto_23169 ?auto_23170 ?auto_23171 ?auto_23172 ?auto_23173 ?auto_23174 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23183 - BLOCK
      ?auto_23184 - BLOCK
      ?auto_23185 - BLOCK
      ?auto_23186 - BLOCK
      ?auto_23187 - BLOCK
      ?auto_23188 - BLOCK
      ?auto_23189 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23189 ) ( ON-TABLE ?auto_23183 ) ( ON ?auto_23184 ?auto_23183 ) ( ON ?auto_23185 ?auto_23184 ) ( not ( = ?auto_23183 ?auto_23184 ) ) ( not ( = ?auto_23183 ?auto_23185 ) ) ( not ( = ?auto_23183 ?auto_23186 ) ) ( not ( = ?auto_23183 ?auto_23187 ) ) ( not ( = ?auto_23183 ?auto_23188 ) ) ( not ( = ?auto_23183 ?auto_23189 ) ) ( not ( = ?auto_23184 ?auto_23185 ) ) ( not ( = ?auto_23184 ?auto_23186 ) ) ( not ( = ?auto_23184 ?auto_23187 ) ) ( not ( = ?auto_23184 ?auto_23188 ) ) ( not ( = ?auto_23184 ?auto_23189 ) ) ( not ( = ?auto_23185 ?auto_23186 ) ) ( not ( = ?auto_23185 ?auto_23187 ) ) ( not ( = ?auto_23185 ?auto_23188 ) ) ( not ( = ?auto_23185 ?auto_23189 ) ) ( not ( = ?auto_23186 ?auto_23187 ) ) ( not ( = ?auto_23186 ?auto_23188 ) ) ( not ( = ?auto_23186 ?auto_23189 ) ) ( not ( = ?auto_23187 ?auto_23188 ) ) ( not ( = ?auto_23187 ?auto_23189 ) ) ( not ( = ?auto_23188 ?auto_23189 ) ) ( ON ?auto_23188 ?auto_23189 ) ( ON ?auto_23187 ?auto_23188 ) ( CLEAR ?auto_23185 ) ( ON ?auto_23186 ?auto_23187 ) ( CLEAR ?auto_23186 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23183 ?auto_23184 ?auto_23185 ?auto_23186 )
      ( MAKE-7PILE ?auto_23183 ?auto_23184 ?auto_23185 ?auto_23186 ?auto_23187 ?auto_23188 ?auto_23189 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23197 - BLOCK
      ?auto_23198 - BLOCK
      ?auto_23199 - BLOCK
      ?auto_23200 - BLOCK
      ?auto_23201 - BLOCK
      ?auto_23202 - BLOCK
      ?auto_23203 - BLOCK
    )
    :vars
    (
      ?auto_23204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23203 ?auto_23204 ) ( ON-TABLE ?auto_23197 ) ( ON ?auto_23198 ?auto_23197 ) ( not ( = ?auto_23197 ?auto_23198 ) ) ( not ( = ?auto_23197 ?auto_23199 ) ) ( not ( = ?auto_23197 ?auto_23200 ) ) ( not ( = ?auto_23197 ?auto_23201 ) ) ( not ( = ?auto_23197 ?auto_23202 ) ) ( not ( = ?auto_23197 ?auto_23203 ) ) ( not ( = ?auto_23197 ?auto_23204 ) ) ( not ( = ?auto_23198 ?auto_23199 ) ) ( not ( = ?auto_23198 ?auto_23200 ) ) ( not ( = ?auto_23198 ?auto_23201 ) ) ( not ( = ?auto_23198 ?auto_23202 ) ) ( not ( = ?auto_23198 ?auto_23203 ) ) ( not ( = ?auto_23198 ?auto_23204 ) ) ( not ( = ?auto_23199 ?auto_23200 ) ) ( not ( = ?auto_23199 ?auto_23201 ) ) ( not ( = ?auto_23199 ?auto_23202 ) ) ( not ( = ?auto_23199 ?auto_23203 ) ) ( not ( = ?auto_23199 ?auto_23204 ) ) ( not ( = ?auto_23200 ?auto_23201 ) ) ( not ( = ?auto_23200 ?auto_23202 ) ) ( not ( = ?auto_23200 ?auto_23203 ) ) ( not ( = ?auto_23200 ?auto_23204 ) ) ( not ( = ?auto_23201 ?auto_23202 ) ) ( not ( = ?auto_23201 ?auto_23203 ) ) ( not ( = ?auto_23201 ?auto_23204 ) ) ( not ( = ?auto_23202 ?auto_23203 ) ) ( not ( = ?auto_23202 ?auto_23204 ) ) ( not ( = ?auto_23203 ?auto_23204 ) ) ( ON ?auto_23202 ?auto_23203 ) ( ON ?auto_23201 ?auto_23202 ) ( ON ?auto_23200 ?auto_23201 ) ( CLEAR ?auto_23198 ) ( ON ?auto_23199 ?auto_23200 ) ( CLEAR ?auto_23199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23197 ?auto_23198 ?auto_23199 )
      ( MAKE-7PILE ?auto_23197 ?auto_23198 ?auto_23199 ?auto_23200 ?auto_23201 ?auto_23202 ?auto_23203 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23212 - BLOCK
      ?auto_23213 - BLOCK
      ?auto_23214 - BLOCK
      ?auto_23215 - BLOCK
      ?auto_23216 - BLOCK
      ?auto_23217 - BLOCK
      ?auto_23218 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23218 ) ( ON-TABLE ?auto_23212 ) ( ON ?auto_23213 ?auto_23212 ) ( not ( = ?auto_23212 ?auto_23213 ) ) ( not ( = ?auto_23212 ?auto_23214 ) ) ( not ( = ?auto_23212 ?auto_23215 ) ) ( not ( = ?auto_23212 ?auto_23216 ) ) ( not ( = ?auto_23212 ?auto_23217 ) ) ( not ( = ?auto_23212 ?auto_23218 ) ) ( not ( = ?auto_23213 ?auto_23214 ) ) ( not ( = ?auto_23213 ?auto_23215 ) ) ( not ( = ?auto_23213 ?auto_23216 ) ) ( not ( = ?auto_23213 ?auto_23217 ) ) ( not ( = ?auto_23213 ?auto_23218 ) ) ( not ( = ?auto_23214 ?auto_23215 ) ) ( not ( = ?auto_23214 ?auto_23216 ) ) ( not ( = ?auto_23214 ?auto_23217 ) ) ( not ( = ?auto_23214 ?auto_23218 ) ) ( not ( = ?auto_23215 ?auto_23216 ) ) ( not ( = ?auto_23215 ?auto_23217 ) ) ( not ( = ?auto_23215 ?auto_23218 ) ) ( not ( = ?auto_23216 ?auto_23217 ) ) ( not ( = ?auto_23216 ?auto_23218 ) ) ( not ( = ?auto_23217 ?auto_23218 ) ) ( ON ?auto_23217 ?auto_23218 ) ( ON ?auto_23216 ?auto_23217 ) ( ON ?auto_23215 ?auto_23216 ) ( CLEAR ?auto_23213 ) ( ON ?auto_23214 ?auto_23215 ) ( CLEAR ?auto_23214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23212 ?auto_23213 ?auto_23214 )
      ( MAKE-7PILE ?auto_23212 ?auto_23213 ?auto_23214 ?auto_23215 ?auto_23216 ?auto_23217 ?auto_23218 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23226 - BLOCK
      ?auto_23227 - BLOCK
      ?auto_23228 - BLOCK
      ?auto_23229 - BLOCK
      ?auto_23230 - BLOCK
      ?auto_23231 - BLOCK
      ?auto_23232 - BLOCK
    )
    :vars
    (
      ?auto_23233 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23232 ?auto_23233 ) ( ON-TABLE ?auto_23226 ) ( not ( = ?auto_23226 ?auto_23227 ) ) ( not ( = ?auto_23226 ?auto_23228 ) ) ( not ( = ?auto_23226 ?auto_23229 ) ) ( not ( = ?auto_23226 ?auto_23230 ) ) ( not ( = ?auto_23226 ?auto_23231 ) ) ( not ( = ?auto_23226 ?auto_23232 ) ) ( not ( = ?auto_23226 ?auto_23233 ) ) ( not ( = ?auto_23227 ?auto_23228 ) ) ( not ( = ?auto_23227 ?auto_23229 ) ) ( not ( = ?auto_23227 ?auto_23230 ) ) ( not ( = ?auto_23227 ?auto_23231 ) ) ( not ( = ?auto_23227 ?auto_23232 ) ) ( not ( = ?auto_23227 ?auto_23233 ) ) ( not ( = ?auto_23228 ?auto_23229 ) ) ( not ( = ?auto_23228 ?auto_23230 ) ) ( not ( = ?auto_23228 ?auto_23231 ) ) ( not ( = ?auto_23228 ?auto_23232 ) ) ( not ( = ?auto_23228 ?auto_23233 ) ) ( not ( = ?auto_23229 ?auto_23230 ) ) ( not ( = ?auto_23229 ?auto_23231 ) ) ( not ( = ?auto_23229 ?auto_23232 ) ) ( not ( = ?auto_23229 ?auto_23233 ) ) ( not ( = ?auto_23230 ?auto_23231 ) ) ( not ( = ?auto_23230 ?auto_23232 ) ) ( not ( = ?auto_23230 ?auto_23233 ) ) ( not ( = ?auto_23231 ?auto_23232 ) ) ( not ( = ?auto_23231 ?auto_23233 ) ) ( not ( = ?auto_23232 ?auto_23233 ) ) ( ON ?auto_23231 ?auto_23232 ) ( ON ?auto_23230 ?auto_23231 ) ( ON ?auto_23229 ?auto_23230 ) ( ON ?auto_23228 ?auto_23229 ) ( CLEAR ?auto_23226 ) ( ON ?auto_23227 ?auto_23228 ) ( CLEAR ?auto_23227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23226 ?auto_23227 )
      ( MAKE-7PILE ?auto_23226 ?auto_23227 ?auto_23228 ?auto_23229 ?auto_23230 ?auto_23231 ?auto_23232 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23241 - BLOCK
      ?auto_23242 - BLOCK
      ?auto_23243 - BLOCK
      ?auto_23244 - BLOCK
      ?auto_23245 - BLOCK
      ?auto_23246 - BLOCK
      ?auto_23247 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23247 ) ( ON-TABLE ?auto_23241 ) ( not ( = ?auto_23241 ?auto_23242 ) ) ( not ( = ?auto_23241 ?auto_23243 ) ) ( not ( = ?auto_23241 ?auto_23244 ) ) ( not ( = ?auto_23241 ?auto_23245 ) ) ( not ( = ?auto_23241 ?auto_23246 ) ) ( not ( = ?auto_23241 ?auto_23247 ) ) ( not ( = ?auto_23242 ?auto_23243 ) ) ( not ( = ?auto_23242 ?auto_23244 ) ) ( not ( = ?auto_23242 ?auto_23245 ) ) ( not ( = ?auto_23242 ?auto_23246 ) ) ( not ( = ?auto_23242 ?auto_23247 ) ) ( not ( = ?auto_23243 ?auto_23244 ) ) ( not ( = ?auto_23243 ?auto_23245 ) ) ( not ( = ?auto_23243 ?auto_23246 ) ) ( not ( = ?auto_23243 ?auto_23247 ) ) ( not ( = ?auto_23244 ?auto_23245 ) ) ( not ( = ?auto_23244 ?auto_23246 ) ) ( not ( = ?auto_23244 ?auto_23247 ) ) ( not ( = ?auto_23245 ?auto_23246 ) ) ( not ( = ?auto_23245 ?auto_23247 ) ) ( not ( = ?auto_23246 ?auto_23247 ) ) ( ON ?auto_23246 ?auto_23247 ) ( ON ?auto_23245 ?auto_23246 ) ( ON ?auto_23244 ?auto_23245 ) ( ON ?auto_23243 ?auto_23244 ) ( CLEAR ?auto_23241 ) ( ON ?auto_23242 ?auto_23243 ) ( CLEAR ?auto_23242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23241 ?auto_23242 )
      ( MAKE-7PILE ?auto_23241 ?auto_23242 ?auto_23243 ?auto_23244 ?auto_23245 ?auto_23246 ?auto_23247 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23255 - BLOCK
      ?auto_23256 - BLOCK
      ?auto_23257 - BLOCK
      ?auto_23258 - BLOCK
      ?auto_23259 - BLOCK
      ?auto_23260 - BLOCK
      ?auto_23261 - BLOCK
    )
    :vars
    (
      ?auto_23262 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23261 ?auto_23262 ) ( not ( = ?auto_23255 ?auto_23256 ) ) ( not ( = ?auto_23255 ?auto_23257 ) ) ( not ( = ?auto_23255 ?auto_23258 ) ) ( not ( = ?auto_23255 ?auto_23259 ) ) ( not ( = ?auto_23255 ?auto_23260 ) ) ( not ( = ?auto_23255 ?auto_23261 ) ) ( not ( = ?auto_23255 ?auto_23262 ) ) ( not ( = ?auto_23256 ?auto_23257 ) ) ( not ( = ?auto_23256 ?auto_23258 ) ) ( not ( = ?auto_23256 ?auto_23259 ) ) ( not ( = ?auto_23256 ?auto_23260 ) ) ( not ( = ?auto_23256 ?auto_23261 ) ) ( not ( = ?auto_23256 ?auto_23262 ) ) ( not ( = ?auto_23257 ?auto_23258 ) ) ( not ( = ?auto_23257 ?auto_23259 ) ) ( not ( = ?auto_23257 ?auto_23260 ) ) ( not ( = ?auto_23257 ?auto_23261 ) ) ( not ( = ?auto_23257 ?auto_23262 ) ) ( not ( = ?auto_23258 ?auto_23259 ) ) ( not ( = ?auto_23258 ?auto_23260 ) ) ( not ( = ?auto_23258 ?auto_23261 ) ) ( not ( = ?auto_23258 ?auto_23262 ) ) ( not ( = ?auto_23259 ?auto_23260 ) ) ( not ( = ?auto_23259 ?auto_23261 ) ) ( not ( = ?auto_23259 ?auto_23262 ) ) ( not ( = ?auto_23260 ?auto_23261 ) ) ( not ( = ?auto_23260 ?auto_23262 ) ) ( not ( = ?auto_23261 ?auto_23262 ) ) ( ON ?auto_23260 ?auto_23261 ) ( ON ?auto_23259 ?auto_23260 ) ( ON ?auto_23258 ?auto_23259 ) ( ON ?auto_23257 ?auto_23258 ) ( ON ?auto_23256 ?auto_23257 ) ( ON ?auto_23255 ?auto_23256 ) ( CLEAR ?auto_23255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23255 )
      ( MAKE-7PILE ?auto_23255 ?auto_23256 ?auto_23257 ?auto_23258 ?auto_23259 ?auto_23260 ?auto_23261 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23270 - BLOCK
      ?auto_23271 - BLOCK
      ?auto_23272 - BLOCK
      ?auto_23273 - BLOCK
      ?auto_23274 - BLOCK
      ?auto_23275 - BLOCK
      ?auto_23276 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23276 ) ( not ( = ?auto_23270 ?auto_23271 ) ) ( not ( = ?auto_23270 ?auto_23272 ) ) ( not ( = ?auto_23270 ?auto_23273 ) ) ( not ( = ?auto_23270 ?auto_23274 ) ) ( not ( = ?auto_23270 ?auto_23275 ) ) ( not ( = ?auto_23270 ?auto_23276 ) ) ( not ( = ?auto_23271 ?auto_23272 ) ) ( not ( = ?auto_23271 ?auto_23273 ) ) ( not ( = ?auto_23271 ?auto_23274 ) ) ( not ( = ?auto_23271 ?auto_23275 ) ) ( not ( = ?auto_23271 ?auto_23276 ) ) ( not ( = ?auto_23272 ?auto_23273 ) ) ( not ( = ?auto_23272 ?auto_23274 ) ) ( not ( = ?auto_23272 ?auto_23275 ) ) ( not ( = ?auto_23272 ?auto_23276 ) ) ( not ( = ?auto_23273 ?auto_23274 ) ) ( not ( = ?auto_23273 ?auto_23275 ) ) ( not ( = ?auto_23273 ?auto_23276 ) ) ( not ( = ?auto_23274 ?auto_23275 ) ) ( not ( = ?auto_23274 ?auto_23276 ) ) ( not ( = ?auto_23275 ?auto_23276 ) ) ( ON ?auto_23275 ?auto_23276 ) ( ON ?auto_23274 ?auto_23275 ) ( ON ?auto_23273 ?auto_23274 ) ( ON ?auto_23272 ?auto_23273 ) ( ON ?auto_23271 ?auto_23272 ) ( ON ?auto_23270 ?auto_23271 ) ( CLEAR ?auto_23270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23270 )
      ( MAKE-7PILE ?auto_23270 ?auto_23271 ?auto_23272 ?auto_23273 ?auto_23274 ?auto_23275 ?auto_23276 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23284 - BLOCK
      ?auto_23285 - BLOCK
      ?auto_23286 - BLOCK
      ?auto_23287 - BLOCK
      ?auto_23288 - BLOCK
      ?auto_23289 - BLOCK
      ?auto_23290 - BLOCK
    )
    :vars
    (
      ?auto_23291 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23284 ?auto_23285 ) ) ( not ( = ?auto_23284 ?auto_23286 ) ) ( not ( = ?auto_23284 ?auto_23287 ) ) ( not ( = ?auto_23284 ?auto_23288 ) ) ( not ( = ?auto_23284 ?auto_23289 ) ) ( not ( = ?auto_23284 ?auto_23290 ) ) ( not ( = ?auto_23285 ?auto_23286 ) ) ( not ( = ?auto_23285 ?auto_23287 ) ) ( not ( = ?auto_23285 ?auto_23288 ) ) ( not ( = ?auto_23285 ?auto_23289 ) ) ( not ( = ?auto_23285 ?auto_23290 ) ) ( not ( = ?auto_23286 ?auto_23287 ) ) ( not ( = ?auto_23286 ?auto_23288 ) ) ( not ( = ?auto_23286 ?auto_23289 ) ) ( not ( = ?auto_23286 ?auto_23290 ) ) ( not ( = ?auto_23287 ?auto_23288 ) ) ( not ( = ?auto_23287 ?auto_23289 ) ) ( not ( = ?auto_23287 ?auto_23290 ) ) ( not ( = ?auto_23288 ?auto_23289 ) ) ( not ( = ?auto_23288 ?auto_23290 ) ) ( not ( = ?auto_23289 ?auto_23290 ) ) ( ON ?auto_23284 ?auto_23291 ) ( not ( = ?auto_23290 ?auto_23291 ) ) ( not ( = ?auto_23289 ?auto_23291 ) ) ( not ( = ?auto_23288 ?auto_23291 ) ) ( not ( = ?auto_23287 ?auto_23291 ) ) ( not ( = ?auto_23286 ?auto_23291 ) ) ( not ( = ?auto_23285 ?auto_23291 ) ) ( not ( = ?auto_23284 ?auto_23291 ) ) ( ON ?auto_23285 ?auto_23284 ) ( ON ?auto_23286 ?auto_23285 ) ( ON ?auto_23287 ?auto_23286 ) ( ON ?auto_23288 ?auto_23287 ) ( ON ?auto_23289 ?auto_23288 ) ( ON ?auto_23290 ?auto_23289 ) ( CLEAR ?auto_23290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_23290 ?auto_23289 ?auto_23288 ?auto_23287 ?auto_23286 ?auto_23285 ?auto_23284 )
      ( MAKE-7PILE ?auto_23284 ?auto_23285 ?auto_23286 ?auto_23287 ?auto_23288 ?auto_23289 ?auto_23290 ) )
  )

)

