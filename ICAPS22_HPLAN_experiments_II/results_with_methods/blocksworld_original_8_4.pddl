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

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_149728 - BLOCK
      ?auto_149729 - BLOCK
      ?auto_149730 - BLOCK
      ?auto_149731 - BLOCK
      ?auto_149732 - BLOCK
      ?auto_149733 - BLOCK
      ?auto_149734 - BLOCK
      ?auto_149735 - BLOCK
    )
    :vars
    (
      ?auto_149736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149736 ?auto_149735 ) ( CLEAR ?auto_149736 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_149728 ) ( ON ?auto_149729 ?auto_149728 ) ( ON ?auto_149730 ?auto_149729 ) ( ON ?auto_149731 ?auto_149730 ) ( ON ?auto_149732 ?auto_149731 ) ( ON ?auto_149733 ?auto_149732 ) ( ON ?auto_149734 ?auto_149733 ) ( ON ?auto_149735 ?auto_149734 ) ( not ( = ?auto_149728 ?auto_149729 ) ) ( not ( = ?auto_149728 ?auto_149730 ) ) ( not ( = ?auto_149728 ?auto_149731 ) ) ( not ( = ?auto_149728 ?auto_149732 ) ) ( not ( = ?auto_149728 ?auto_149733 ) ) ( not ( = ?auto_149728 ?auto_149734 ) ) ( not ( = ?auto_149728 ?auto_149735 ) ) ( not ( = ?auto_149728 ?auto_149736 ) ) ( not ( = ?auto_149729 ?auto_149730 ) ) ( not ( = ?auto_149729 ?auto_149731 ) ) ( not ( = ?auto_149729 ?auto_149732 ) ) ( not ( = ?auto_149729 ?auto_149733 ) ) ( not ( = ?auto_149729 ?auto_149734 ) ) ( not ( = ?auto_149729 ?auto_149735 ) ) ( not ( = ?auto_149729 ?auto_149736 ) ) ( not ( = ?auto_149730 ?auto_149731 ) ) ( not ( = ?auto_149730 ?auto_149732 ) ) ( not ( = ?auto_149730 ?auto_149733 ) ) ( not ( = ?auto_149730 ?auto_149734 ) ) ( not ( = ?auto_149730 ?auto_149735 ) ) ( not ( = ?auto_149730 ?auto_149736 ) ) ( not ( = ?auto_149731 ?auto_149732 ) ) ( not ( = ?auto_149731 ?auto_149733 ) ) ( not ( = ?auto_149731 ?auto_149734 ) ) ( not ( = ?auto_149731 ?auto_149735 ) ) ( not ( = ?auto_149731 ?auto_149736 ) ) ( not ( = ?auto_149732 ?auto_149733 ) ) ( not ( = ?auto_149732 ?auto_149734 ) ) ( not ( = ?auto_149732 ?auto_149735 ) ) ( not ( = ?auto_149732 ?auto_149736 ) ) ( not ( = ?auto_149733 ?auto_149734 ) ) ( not ( = ?auto_149733 ?auto_149735 ) ) ( not ( = ?auto_149733 ?auto_149736 ) ) ( not ( = ?auto_149734 ?auto_149735 ) ) ( not ( = ?auto_149734 ?auto_149736 ) ) ( not ( = ?auto_149735 ?auto_149736 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_149736 ?auto_149735 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_149738 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_149738 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_149738 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_149739 - BLOCK
    )
    :vars
    (
      ?auto_149740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149739 ?auto_149740 ) ( CLEAR ?auto_149739 ) ( HAND-EMPTY ) ( not ( = ?auto_149739 ?auto_149740 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_149739 ?auto_149740 )
      ( MAKE-1PILE ?auto_149739 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_149748 - BLOCK
      ?auto_149749 - BLOCK
      ?auto_149750 - BLOCK
      ?auto_149751 - BLOCK
      ?auto_149752 - BLOCK
      ?auto_149753 - BLOCK
      ?auto_149754 - BLOCK
    )
    :vars
    (
      ?auto_149755 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149755 ?auto_149754 ) ( CLEAR ?auto_149755 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_149748 ) ( ON ?auto_149749 ?auto_149748 ) ( ON ?auto_149750 ?auto_149749 ) ( ON ?auto_149751 ?auto_149750 ) ( ON ?auto_149752 ?auto_149751 ) ( ON ?auto_149753 ?auto_149752 ) ( ON ?auto_149754 ?auto_149753 ) ( not ( = ?auto_149748 ?auto_149749 ) ) ( not ( = ?auto_149748 ?auto_149750 ) ) ( not ( = ?auto_149748 ?auto_149751 ) ) ( not ( = ?auto_149748 ?auto_149752 ) ) ( not ( = ?auto_149748 ?auto_149753 ) ) ( not ( = ?auto_149748 ?auto_149754 ) ) ( not ( = ?auto_149748 ?auto_149755 ) ) ( not ( = ?auto_149749 ?auto_149750 ) ) ( not ( = ?auto_149749 ?auto_149751 ) ) ( not ( = ?auto_149749 ?auto_149752 ) ) ( not ( = ?auto_149749 ?auto_149753 ) ) ( not ( = ?auto_149749 ?auto_149754 ) ) ( not ( = ?auto_149749 ?auto_149755 ) ) ( not ( = ?auto_149750 ?auto_149751 ) ) ( not ( = ?auto_149750 ?auto_149752 ) ) ( not ( = ?auto_149750 ?auto_149753 ) ) ( not ( = ?auto_149750 ?auto_149754 ) ) ( not ( = ?auto_149750 ?auto_149755 ) ) ( not ( = ?auto_149751 ?auto_149752 ) ) ( not ( = ?auto_149751 ?auto_149753 ) ) ( not ( = ?auto_149751 ?auto_149754 ) ) ( not ( = ?auto_149751 ?auto_149755 ) ) ( not ( = ?auto_149752 ?auto_149753 ) ) ( not ( = ?auto_149752 ?auto_149754 ) ) ( not ( = ?auto_149752 ?auto_149755 ) ) ( not ( = ?auto_149753 ?auto_149754 ) ) ( not ( = ?auto_149753 ?auto_149755 ) ) ( not ( = ?auto_149754 ?auto_149755 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_149755 ?auto_149754 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_149756 - BLOCK
      ?auto_149757 - BLOCK
      ?auto_149758 - BLOCK
      ?auto_149759 - BLOCK
      ?auto_149760 - BLOCK
      ?auto_149761 - BLOCK
      ?auto_149762 - BLOCK
    )
    :vars
    (
      ?auto_149763 - BLOCK
      ?auto_149764 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149763 ?auto_149762 ) ( CLEAR ?auto_149763 ) ( ON-TABLE ?auto_149756 ) ( ON ?auto_149757 ?auto_149756 ) ( ON ?auto_149758 ?auto_149757 ) ( ON ?auto_149759 ?auto_149758 ) ( ON ?auto_149760 ?auto_149759 ) ( ON ?auto_149761 ?auto_149760 ) ( ON ?auto_149762 ?auto_149761 ) ( not ( = ?auto_149756 ?auto_149757 ) ) ( not ( = ?auto_149756 ?auto_149758 ) ) ( not ( = ?auto_149756 ?auto_149759 ) ) ( not ( = ?auto_149756 ?auto_149760 ) ) ( not ( = ?auto_149756 ?auto_149761 ) ) ( not ( = ?auto_149756 ?auto_149762 ) ) ( not ( = ?auto_149756 ?auto_149763 ) ) ( not ( = ?auto_149757 ?auto_149758 ) ) ( not ( = ?auto_149757 ?auto_149759 ) ) ( not ( = ?auto_149757 ?auto_149760 ) ) ( not ( = ?auto_149757 ?auto_149761 ) ) ( not ( = ?auto_149757 ?auto_149762 ) ) ( not ( = ?auto_149757 ?auto_149763 ) ) ( not ( = ?auto_149758 ?auto_149759 ) ) ( not ( = ?auto_149758 ?auto_149760 ) ) ( not ( = ?auto_149758 ?auto_149761 ) ) ( not ( = ?auto_149758 ?auto_149762 ) ) ( not ( = ?auto_149758 ?auto_149763 ) ) ( not ( = ?auto_149759 ?auto_149760 ) ) ( not ( = ?auto_149759 ?auto_149761 ) ) ( not ( = ?auto_149759 ?auto_149762 ) ) ( not ( = ?auto_149759 ?auto_149763 ) ) ( not ( = ?auto_149760 ?auto_149761 ) ) ( not ( = ?auto_149760 ?auto_149762 ) ) ( not ( = ?auto_149760 ?auto_149763 ) ) ( not ( = ?auto_149761 ?auto_149762 ) ) ( not ( = ?auto_149761 ?auto_149763 ) ) ( not ( = ?auto_149762 ?auto_149763 ) ) ( HOLDING ?auto_149764 ) ( not ( = ?auto_149756 ?auto_149764 ) ) ( not ( = ?auto_149757 ?auto_149764 ) ) ( not ( = ?auto_149758 ?auto_149764 ) ) ( not ( = ?auto_149759 ?auto_149764 ) ) ( not ( = ?auto_149760 ?auto_149764 ) ) ( not ( = ?auto_149761 ?auto_149764 ) ) ( not ( = ?auto_149762 ?auto_149764 ) ) ( not ( = ?auto_149763 ?auto_149764 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_149764 )
      ( MAKE-7PILE ?auto_149756 ?auto_149757 ?auto_149758 ?auto_149759 ?auto_149760 ?auto_149761 ?auto_149762 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_149765 - BLOCK
      ?auto_149766 - BLOCK
      ?auto_149767 - BLOCK
      ?auto_149768 - BLOCK
      ?auto_149769 - BLOCK
      ?auto_149770 - BLOCK
      ?auto_149771 - BLOCK
    )
    :vars
    (
      ?auto_149773 - BLOCK
      ?auto_149772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149773 ?auto_149771 ) ( ON-TABLE ?auto_149765 ) ( ON ?auto_149766 ?auto_149765 ) ( ON ?auto_149767 ?auto_149766 ) ( ON ?auto_149768 ?auto_149767 ) ( ON ?auto_149769 ?auto_149768 ) ( ON ?auto_149770 ?auto_149769 ) ( ON ?auto_149771 ?auto_149770 ) ( not ( = ?auto_149765 ?auto_149766 ) ) ( not ( = ?auto_149765 ?auto_149767 ) ) ( not ( = ?auto_149765 ?auto_149768 ) ) ( not ( = ?auto_149765 ?auto_149769 ) ) ( not ( = ?auto_149765 ?auto_149770 ) ) ( not ( = ?auto_149765 ?auto_149771 ) ) ( not ( = ?auto_149765 ?auto_149773 ) ) ( not ( = ?auto_149766 ?auto_149767 ) ) ( not ( = ?auto_149766 ?auto_149768 ) ) ( not ( = ?auto_149766 ?auto_149769 ) ) ( not ( = ?auto_149766 ?auto_149770 ) ) ( not ( = ?auto_149766 ?auto_149771 ) ) ( not ( = ?auto_149766 ?auto_149773 ) ) ( not ( = ?auto_149767 ?auto_149768 ) ) ( not ( = ?auto_149767 ?auto_149769 ) ) ( not ( = ?auto_149767 ?auto_149770 ) ) ( not ( = ?auto_149767 ?auto_149771 ) ) ( not ( = ?auto_149767 ?auto_149773 ) ) ( not ( = ?auto_149768 ?auto_149769 ) ) ( not ( = ?auto_149768 ?auto_149770 ) ) ( not ( = ?auto_149768 ?auto_149771 ) ) ( not ( = ?auto_149768 ?auto_149773 ) ) ( not ( = ?auto_149769 ?auto_149770 ) ) ( not ( = ?auto_149769 ?auto_149771 ) ) ( not ( = ?auto_149769 ?auto_149773 ) ) ( not ( = ?auto_149770 ?auto_149771 ) ) ( not ( = ?auto_149770 ?auto_149773 ) ) ( not ( = ?auto_149771 ?auto_149773 ) ) ( not ( = ?auto_149765 ?auto_149772 ) ) ( not ( = ?auto_149766 ?auto_149772 ) ) ( not ( = ?auto_149767 ?auto_149772 ) ) ( not ( = ?auto_149768 ?auto_149772 ) ) ( not ( = ?auto_149769 ?auto_149772 ) ) ( not ( = ?auto_149770 ?auto_149772 ) ) ( not ( = ?auto_149771 ?auto_149772 ) ) ( not ( = ?auto_149773 ?auto_149772 ) ) ( ON ?auto_149772 ?auto_149773 ) ( CLEAR ?auto_149772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_149765 ?auto_149766 ?auto_149767 ?auto_149768 ?auto_149769 ?auto_149770 ?auto_149771 ?auto_149773 )
      ( MAKE-7PILE ?auto_149765 ?auto_149766 ?auto_149767 ?auto_149768 ?auto_149769 ?auto_149770 ?auto_149771 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_149776 - BLOCK
      ?auto_149777 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_149777 ) ( CLEAR ?auto_149776 ) ( ON-TABLE ?auto_149776 ) ( not ( = ?auto_149776 ?auto_149777 ) ) )
    :subtasks
    ( ( !STACK ?auto_149777 ?auto_149776 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_149778 - BLOCK
      ?auto_149779 - BLOCK
    )
    :vars
    (
      ?auto_149780 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_149778 ) ( ON-TABLE ?auto_149778 ) ( not ( = ?auto_149778 ?auto_149779 ) ) ( ON ?auto_149779 ?auto_149780 ) ( CLEAR ?auto_149779 ) ( HAND-EMPTY ) ( not ( = ?auto_149778 ?auto_149780 ) ) ( not ( = ?auto_149779 ?auto_149780 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_149779 ?auto_149780 )
      ( MAKE-2PILE ?auto_149778 ?auto_149779 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_149781 - BLOCK
      ?auto_149782 - BLOCK
    )
    :vars
    (
      ?auto_149783 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149781 ?auto_149782 ) ) ( ON ?auto_149782 ?auto_149783 ) ( CLEAR ?auto_149782 ) ( not ( = ?auto_149781 ?auto_149783 ) ) ( not ( = ?auto_149782 ?auto_149783 ) ) ( HOLDING ?auto_149781 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_149781 )
      ( MAKE-2PILE ?auto_149781 ?auto_149782 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_149784 - BLOCK
      ?auto_149785 - BLOCK
    )
    :vars
    (
      ?auto_149786 - BLOCK
      ?auto_149788 - BLOCK
      ?auto_149787 - BLOCK
      ?auto_149792 - BLOCK
      ?auto_149790 - BLOCK
      ?auto_149789 - BLOCK
      ?auto_149791 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149784 ?auto_149785 ) ) ( ON ?auto_149785 ?auto_149786 ) ( not ( = ?auto_149784 ?auto_149786 ) ) ( not ( = ?auto_149785 ?auto_149786 ) ) ( ON ?auto_149784 ?auto_149785 ) ( CLEAR ?auto_149784 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_149788 ) ( ON ?auto_149787 ?auto_149788 ) ( ON ?auto_149792 ?auto_149787 ) ( ON ?auto_149790 ?auto_149792 ) ( ON ?auto_149789 ?auto_149790 ) ( ON ?auto_149791 ?auto_149789 ) ( ON ?auto_149786 ?auto_149791 ) ( not ( = ?auto_149788 ?auto_149787 ) ) ( not ( = ?auto_149788 ?auto_149792 ) ) ( not ( = ?auto_149788 ?auto_149790 ) ) ( not ( = ?auto_149788 ?auto_149789 ) ) ( not ( = ?auto_149788 ?auto_149791 ) ) ( not ( = ?auto_149788 ?auto_149786 ) ) ( not ( = ?auto_149788 ?auto_149785 ) ) ( not ( = ?auto_149788 ?auto_149784 ) ) ( not ( = ?auto_149787 ?auto_149792 ) ) ( not ( = ?auto_149787 ?auto_149790 ) ) ( not ( = ?auto_149787 ?auto_149789 ) ) ( not ( = ?auto_149787 ?auto_149791 ) ) ( not ( = ?auto_149787 ?auto_149786 ) ) ( not ( = ?auto_149787 ?auto_149785 ) ) ( not ( = ?auto_149787 ?auto_149784 ) ) ( not ( = ?auto_149792 ?auto_149790 ) ) ( not ( = ?auto_149792 ?auto_149789 ) ) ( not ( = ?auto_149792 ?auto_149791 ) ) ( not ( = ?auto_149792 ?auto_149786 ) ) ( not ( = ?auto_149792 ?auto_149785 ) ) ( not ( = ?auto_149792 ?auto_149784 ) ) ( not ( = ?auto_149790 ?auto_149789 ) ) ( not ( = ?auto_149790 ?auto_149791 ) ) ( not ( = ?auto_149790 ?auto_149786 ) ) ( not ( = ?auto_149790 ?auto_149785 ) ) ( not ( = ?auto_149790 ?auto_149784 ) ) ( not ( = ?auto_149789 ?auto_149791 ) ) ( not ( = ?auto_149789 ?auto_149786 ) ) ( not ( = ?auto_149789 ?auto_149785 ) ) ( not ( = ?auto_149789 ?auto_149784 ) ) ( not ( = ?auto_149791 ?auto_149786 ) ) ( not ( = ?auto_149791 ?auto_149785 ) ) ( not ( = ?auto_149791 ?auto_149784 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_149788 ?auto_149787 ?auto_149792 ?auto_149790 ?auto_149789 ?auto_149791 ?auto_149786 ?auto_149785 )
      ( MAKE-2PILE ?auto_149784 ?auto_149785 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_149799 - BLOCK
      ?auto_149800 - BLOCK
      ?auto_149801 - BLOCK
      ?auto_149802 - BLOCK
      ?auto_149803 - BLOCK
      ?auto_149804 - BLOCK
    )
    :vars
    (
      ?auto_149805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149805 ?auto_149804 ) ( CLEAR ?auto_149805 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_149799 ) ( ON ?auto_149800 ?auto_149799 ) ( ON ?auto_149801 ?auto_149800 ) ( ON ?auto_149802 ?auto_149801 ) ( ON ?auto_149803 ?auto_149802 ) ( ON ?auto_149804 ?auto_149803 ) ( not ( = ?auto_149799 ?auto_149800 ) ) ( not ( = ?auto_149799 ?auto_149801 ) ) ( not ( = ?auto_149799 ?auto_149802 ) ) ( not ( = ?auto_149799 ?auto_149803 ) ) ( not ( = ?auto_149799 ?auto_149804 ) ) ( not ( = ?auto_149799 ?auto_149805 ) ) ( not ( = ?auto_149800 ?auto_149801 ) ) ( not ( = ?auto_149800 ?auto_149802 ) ) ( not ( = ?auto_149800 ?auto_149803 ) ) ( not ( = ?auto_149800 ?auto_149804 ) ) ( not ( = ?auto_149800 ?auto_149805 ) ) ( not ( = ?auto_149801 ?auto_149802 ) ) ( not ( = ?auto_149801 ?auto_149803 ) ) ( not ( = ?auto_149801 ?auto_149804 ) ) ( not ( = ?auto_149801 ?auto_149805 ) ) ( not ( = ?auto_149802 ?auto_149803 ) ) ( not ( = ?auto_149802 ?auto_149804 ) ) ( not ( = ?auto_149802 ?auto_149805 ) ) ( not ( = ?auto_149803 ?auto_149804 ) ) ( not ( = ?auto_149803 ?auto_149805 ) ) ( not ( = ?auto_149804 ?auto_149805 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_149805 ?auto_149804 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_149806 - BLOCK
      ?auto_149807 - BLOCK
      ?auto_149808 - BLOCK
      ?auto_149809 - BLOCK
      ?auto_149810 - BLOCK
      ?auto_149811 - BLOCK
    )
    :vars
    (
      ?auto_149812 - BLOCK
      ?auto_149813 - BLOCK
      ?auto_149814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149812 ?auto_149811 ) ( CLEAR ?auto_149812 ) ( ON-TABLE ?auto_149806 ) ( ON ?auto_149807 ?auto_149806 ) ( ON ?auto_149808 ?auto_149807 ) ( ON ?auto_149809 ?auto_149808 ) ( ON ?auto_149810 ?auto_149809 ) ( ON ?auto_149811 ?auto_149810 ) ( not ( = ?auto_149806 ?auto_149807 ) ) ( not ( = ?auto_149806 ?auto_149808 ) ) ( not ( = ?auto_149806 ?auto_149809 ) ) ( not ( = ?auto_149806 ?auto_149810 ) ) ( not ( = ?auto_149806 ?auto_149811 ) ) ( not ( = ?auto_149806 ?auto_149812 ) ) ( not ( = ?auto_149807 ?auto_149808 ) ) ( not ( = ?auto_149807 ?auto_149809 ) ) ( not ( = ?auto_149807 ?auto_149810 ) ) ( not ( = ?auto_149807 ?auto_149811 ) ) ( not ( = ?auto_149807 ?auto_149812 ) ) ( not ( = ?auto_149808 ?auto_149809 ) ) ( not ( = ?auto_149808 ?auto_149810 ) ) ( not ( = ?auto_149808 ?auto_149811 ) ) ( not ( = ?auto_149808 ?auto_149812 ) ) ( not ( = ?auto_149809 ?auto_149810 ) ) ( not ( = ?auto_149809 ?auto_149811 ) ) ( not ( = ?auto_149809 ?auto_149812 ) ) ( not ( = ?auto_149810 ?auto_149811 ) ) ( not ( = ?auto_149810 ?auto_149812 ) ) ( not ( = ?auto_149811 ?auto_149812 ) ) ( HOLDING ?auto_149813 ) ( CLEAR ?auto_149814 ) ( not ( = ?auto_149806 ?auto_149813 ) ) ( not ( = ?auto_149806 ?auto_149814 ) ) ( not ( = ?auto_149807 ?auto_149813 ) ) ( not ( = ?auto_149807 ?auto_149814 ) ) ( not ( = ?auto_149808 ?auto_149813 ) ) ( not ( = ?auto_149808 ?auto_149814 ) ) ( not ( = ?auto_149809 ?auto_149813 ) ) ( not ( = ?auto_149809 ?auto_149814 ) ) ( not ( = ?auto_149810 ?auto_149813 ) ) ( not ( = ?auto_149810 ?auto_149814 ) ) ( not ( = ?auto_149811 ?auto_149813 ) ) ( not ( = ?auto_149811 ?auto_149814 ) ) ( not ( = ?auto_149812 ?auto_149813 ) ) ( not ( = ?auto_149812 ?auto_149814 ) ) ( not ( = ?auto_149813 ?auto_149814 ) ) )
    :subtasks
    ( ( !STACK ?auto_149813 ?auto_149814 )
      ( MAKE-6PILE ?auto_149806 ?auto_149807 ?auto_149808 ?auto_149809 ?auto_149810 ?auto_149811 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_149815 - BLOCK
      ?auto_149816 - BLOCK
      ?auto_149817 - BLOCK
      ?auto_149818 - BLOCK
      ?auto_149819 - BLOCK
      ?auto_149820 - BLOCK
    )
    :vars
    (
      ?auto_149821 - BLOCK
      ?auto_149823 - BLOCK
      ?auto_149822 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149821 ?auto_149820 ) ( ON-TABLE ?auto_149815 ) ( ON ?auto_149816 ?auto_149815 ) ( ON ?auto_149817 ?auto_149816 ) ( ON ?auto_149818 ?auto_149817 ) ( ON ?auto_149819 ?auto_149818 ) ( ON ?auto_149820 ?auto_149819 ) ( not ( = ?auto_149815 ?auto_149816 ) ) ( not ( = ?auto_149815 ?auto_149817 ) ) ( not ( = ?auto_149815 ?auto_149818 ) ) ( not ( = ?auto_149815 ?auto_149819 ) ) ( not ( = ?auto_149815 ?auto_149820 ) ) ( not ( = ?auto_149815 ?auto_149821 ) ) ( not ( = ?auto_149816 ?auto_149817 ) ) ( not ( = ?auto_149816 ?auto_149818 ) ) ( not ( = ?auto_149816 ?auto_149819 ) ) ( not ( = ?auto_149816 ?auto_149820 ) ) ( not ( = ?auto_149816 ?auto_149821 ) ) ( not ( = ?auto_149817 ?auto_149818 ) ) ( not ( = ?auto_149817 ?auto_149819 ) ) ( not ( = ?auto_149817 ?auto_149820 ) ) ( not ( = ?auto_149817 ?auto_149821 ) ) ( not ( = ?auto_149818 ?auto_149819 ) ) ( not ( = ?auto_149818 ?auto_149820 ) ) ( not ( = ?auto_149818 ?auto_149821 ) ) ( not ( = ?auto_149819 ?auto_149820 ) ) ( not ( = ?auto_149819 ?auto_149821 ) ) ( not ( = ?auto_149820 ?auto_149821 ) ) ( CLEAR ?auto_149823 ) ( not ( = ?auto_149815 ?auto_149822 ) ) ( not ( = ?auto_149815 ?auto_149823 ) ) ( not ( = ?auto_149816 ?auto_149822 ) ) ( not ( = ?auto_149816 ?auto_149823 ) ) ( not ( = ?auto_149817 ?auto_149822 ) ) ( not ( = ?auto_149817 ?auto_149823 ) ) ( not ( = ?auto_149818 ?auto_149822 ) ) ( not ( = ?auto_149818 ?auto_149823 ) ) ( not ( = ?auto_149819 ?auto_149822 ) ) ( not ( = ?auto_149819 ?auto_149823 ) ) ( not ( = ?auto_149820 ?auto_149822 ) ) ( not ( = ?auto_149820 ?auto_149823 ) ) ( not ( = ?auto_149821 ?auto_149822 ) ) ( not ( = ?auto_149821 ?auto_149823 ) ) ( not ( = ?auto_149822 ?auto_149823 ) ) ( ON ?auto_149822 ?auto_149821 ) ( CLEAR ?auto_149822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_149815 ?auto_149816 ?auto_149817 ?auto_149818 ?auto_149819 ?auto_149820 ?auto_149821 )
      ( MAKE-6PILE ?auto_149815 ?auto_149816 ?auto_149817 ?auto_149818 ?auto_149819 ?auto_149820 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_149824 - BLOCK
      ?auto_149825 - BLOCK
      ?auto_149826 - BLOCK
      ?auto_149827 - BLOCK
      ?auto_149828 - BLOCK
      ?auto_149829 - BLOCK
    )
    :vars
    (
      ?auto_149831 - BLOCK
      ?auto_149832 - BLOCK
      ?auto_149830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149831 ?auto_149829 ) ( ON-TABLE ?auto_149824 ) ( ON ?auto_149825 ?auto_149824 ) ( ON ?auto_149826 ?auto_149825 ) ( ON ?auto_149827 ?auto_149826 ) ( ON ?auto_149828 ?auto_149827 ) ( ON ?auto_149829 ?auto_149828 ) ( not ( = ?auto_149824 ?auto_149825 ) ) ( not ( = ?auto_149824 ?auto_149826 ) ) ( not ( = ?auto_149824 ?auto_149827 ) ) ( not ( = ?auto_149824 ?auto_149828 ) ) ( not ( = ?auto_149824 ?auto_149829 ) ) ( not ( = ?auto_149824 ?auto_149831 ) ) ( not ( = ?auto_149825 ?auto_149826 ) ) ( not ( = ?auto_149825 ?auto_149827 ) ) ( not ( = ?auto_149825 ?auto_149828 ) ) ( not ( = ?auto_149825 ?auto_149829 ) ) ( not ( = ?auto_149825 ?auto_149831 ) ) ( not ( = ?auto_149826 ?auto_149827 ) ) ( not ( = ?auto_149826 ?auto_149828 ) ) ( not ( = ?auto_149826 ?auto_149829 ) ) ( not ( = ?auto_149826 ?auto_149831 ) ) ( not ( = ?auto_149827 ?auto_149828 ) ) ( not ( = ?auto_149827 ?auto_149829 ) ) ( not ( = ?auto_149827 ?auto_149831 ) ) ( not ( = ?auto_149828 ?auto_149829 ) ) ( not ( = ?auto_149828 ?auto_149831 ) ) ( not ( = ?auto_149829 ?auto_149831 ) ) ( not ( = ?auto_149824 ?auto_149832 ) ) ( not ( = ?auto_149824 ?auto_149830 ) ) ( not ( = ?auto_149825 ?auto_149832 ) ) ( not ( = ?auto_149825 ?auto_149830 ) ) ( not ( = ?auto_149826 ?auto_149832 ) ) ( not ( = ?auto_149826 ?auto_149830 ) ) ( not ( = ?auto_149827 ?auto_149832 ) ) ( not ( = ?auto_149827 ?auto_149830 ) ) ( not ( = ?auto_149828 ?auto_149832 ) ) ( not ( = ?auto_149828 ?auto_149830 ) ) ( not ( = ?auto_149829 ?auto_149832 ) ) ( not ( = ?auto_149829 ?auto_149830 ) ) ( not ( = ?auto_149831 ?auto_149832 ) ) ( not ( = ?auto_149831 ?auto_149830 ) ) ( not ( = ?auto_149832 ?auto_149830 ) ) ( ON ?auto_149832 ?auto_149831 ) ( CLEAR ?auto_149832 ) ( HOLDING ?auto_149830 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_149830 )
      ( MAKE-6PILE ?auto_149824 ?auto_149825 ?auto_149826 ?auto_149827 ?auto_149828 ?auto_149829 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_149833 - BLOCK
      ?auto_149834 - BLOCK
      ?auto_149835 - BLOCK
      ?auto_149836 - BLOCK
      ?auto_149837 - BLOCK
      ?auto_149838 - BLOCK
    )
    :vars
    (
      ?auto_149839 - BLOCK
      ?auto_149840 - BLOCK
      ?auto_149841 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149839 ?auto_149838 ) ( ON-TABLE ?auto_149833 ) ( ON ?auto_149834 ?auto_149833 ) ( ON ?auto_149835 ?auto_149834 ) ( ON ?auto_149836 ?auto_149835 ) ( ON ?auto_149837 ?auto_149836 ) ( ON ?auto_149838 ?auto_149837 ) ( not ( = ?auto_149833 ?auto_149834 ) ) ( not ( = ?auto_149833 ?auto_149835 ) ) ( not ( = ?auto_149833 ?auto_149836 ) ) ( not ( = ?auto_149833 ?auto_149837 ) ) ( not ( = ?auto_149833 ?auto_149838 ) ) ( not ( = ?auto_149833 ?auto_149839 ) ) ( not ( = ?auto_149834 ?auto_149835 ) ) ( not ( = ?auto_149834 ?auto_149836 ) ) ( not ( = ?auto_149834 ?auto_149837 ) ) ( not ( = ?auto_149834 ?auto_149838 ) ) ( not ( = ?auto_149834 ?auto_149839 ) ) ( not ( = ?auto_149835 ?auto_149836 ) ) ( not ( = ?auto_149835 ?auto_149837 ) ) ( not ( = ?auto_149835 ?auto_149838 ) ) ( not ( = ?auto_149835 ?auto_149839 ) ) ( not ( = ?auto_149836 ?auto_149837 ) ) ( not ( = ?auto_149836 ?auto_149838 ) ) ( not ( = ?auto_149836 ?auto_149839 ) ) ( not ( = ?auto_149837 ?auto_149838 ) ) ( not ( = ?auto_149837 ?auto_149839 ) ) ( not ( = ?auto_149838 ?auto_149839 ) ) ( not ( = ?auto_149833 ?auto_149840 ) ) ( not ( = ?auto_149833 ?auto_149841 ) ) ( not ( = ?auto_149834 ?auto_149840 ) ) ( not ( = ?auto_149834 ?auto_149841 ) ) ( not ( = ?auto_149835 ?auto_149840 ) ) ( not ( = ?auto_149835 ?auto_149841 ) ) ( not ( = ?auto_149836 ?auto_149840 ) ) ( not ( = ?auto_149836 ?auto_149841 ) ) ( not ( = ?auto_149837 ?auto_149840 ) ) ( not ( = ?auto_149837 ?auto_149841 ) ) ( not ( = ?auto_149838 ?auto_149840 ) ) ( not ( = ?auto_149838 ?auto_149841 ) ) ( not ( = ?auto_149839 ?auto_149840 ) ) ( not ( = ?auto_149839 ?auto_149841 ) ) ( not ( = ?auto_149840 ?auto_149841 ) ) ( ON ?auto_149840 ?auto_149839 ) ( ON ?auto_149841 ?auto_149840 ) ( CLEAR ?auto_149841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_149833 ?auto_149834 ?auto_149835 ?auto_149836 ?auto_149837 ?auto_149838 ?auto_149839 ?auto_149840 )
      ( MAKE-6PILE ?auto_149833 ?auto_149834 ?auto_149835 ?auto_149836 ?auto_149837 ?auto_149838 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_149845 - BLOCK
      ?auto_149846 - BLOCK
      ?auto_149847 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_149847 ) ( CLEAR ?auto_149846 ) ( ON-TABLE ?auto_149845 ) ( ON ?auto_149846 ?auto_149845 ) ( not ( = ?auto_149845 ?auto_149846 ) ) ( not ( = ?auto_149845 ?auto_149847 ) ) ( not ( = ?auto_149846 ?auto_149847 ) ) )
    :subtasks
    ( ( !STACK ?auto_149847 ?auto_149846 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_149848 - BLOCK
      ?auto_149849 - BLOCK
      ?auto_149850 - BLOCK
    )
    :vars
    (
      ?auto_149851 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_149849 ) ( ON-TABLE ?auto_149848 ) ( ON ?auto_149849 ?auto_149848 ) ( not ( = ?auto_149848 ?auto_149849 ) ) ( not ( = ?auto_149848 ?auto_149850 ) ) ( not ( = ?auto_149849 ?auto_149850 ) ) ( ON ?auto_149850 ?auto_149851 ) ( CLEAR ?auto_149850 ) ( HAND-EMPTY ) ( not ( = ?auto_149848 ?auto_149851 ) ) ( not ( = ?auto_149849 ?auto_149851 ) ) ( not ( = ?auto_149850 ?auto_149851 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_149850 ?auto_149851 )
      ( MAKE-3PILE ?auto_149848 ?auto_149849 ?auto_149850 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_149852 - BLOCK
      ?auto_149853 - BLOCK
      ?auto_149854 - BLOCK
    )
    :vars
    (
      ?auto_149855 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149852 ) ( not ( = ?auto_149852 ?auto_149853 ) ) ( not ( = ?auto_149852 ?auto_149854 ) ) ( not ( = ?auto_149853 ?auto_149854 ) ) ( ON ?auto_149854 ?auto_149855 ) ( CLEAR ?auto_149854 ) ( not ( = ?auto_149852 ?auto_149855 ) ) ( not ( = ?auto_149853 ?auto_149855 ) ) ( not ( = ?auto_149854 ?auto_149855 ) ) ( HOLDING ?auto_149853 ) ( CLEAR ?auto_149852 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_149852 ?auto_149853 )
      ( MAKE-3PILE ?auto_149852 ?auto_149853 ?auto_149854 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_149856 - BLOCK
      ?auto_149857 - BLOCK
      ?auto_149858 - BLOCK
    )
    :vars
    (
      ?auto_149859 - BLOCK
      ?auto_149860 - BLOCK
      ?auto_149862 - BLOCK
      ?auto_149861 - BLOCK
      ?auto_149863 - BLOCK
      ?auto_149864 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149856 ) ( not ( = ?auto_149856 ?auto_149857 ) ) ( not ( = ?auto_149856 ?auto_149858 ) ) ( not ( = ?auto_149857 ?auto_149858 ) ) ( ON ?auto_149858 ?auto_149859 ) ( not ( = ?auto_149856 ?auto_149859 ) ) ( not ( = ?auto_149857 ?auto_149859 ) ) ( not ( = ?auto_149858 ?auto_149859 ) ) ( CLEAR ?auto_149856 ) ( ON ?auto_149857 ?auto_149858 ) ( CLEAR ?auto_149857 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_149860 ) ( ON ?auto_149862 ?auto_149860 ) ( ON ?auto_149861 ?auto_149862 ) ( ON ?auto_149863 ?auto_149861 ) ( ON ?auto_149864 ?auto_149863 ) ( ON ?auto_149859 ?auto_149864 ) ( not ( = ?auto_149860 ?auto_149862 ) ) ( not ( = ?auto_149860 ?auto_149861 ) ) ( not ( = ?auto_149860 ?auto_149863 ) ) ( not ( = ?auto_149860 ?auto_149864 ) ) ( not ( = ?auto_149860 ?auto_149859 ) ) ( not ( = ?auto_149860 ?auto_149858 ) ) ( not ( = ?auto_149860 ?auto_149857 ) ) ( not ( = ?auto_149862 ?auto_149861 ) ) ( not ( = ?auto_149862 ?auto_149863 ) ) ( not ( = ?auto_149862 ?auto_149864 ) ) ( not ( = ?auto_149862 ?auto_149859 ) ) ( not ( = ?auto_149862 ?auto_149858 ) ) ( not ( = ?auto_149862 ?auto_149857 ) ) ( not ( = ?auto_149861 ?auto_149863 ) ) ( not ( = ?auto_149861 ?auto_149864 ) ) ( not ( = ?auto_149861 ?auto_149859 ) ) ( not ( = ?auto_149861 ?auto_149858 ) ) ( not ( = ?auto_149861 ?auto_149857 ) ) ( not ( = ?auto_149863 ?auto_149864 ) ) ( not ( = ?auto_149863 ?auto_149859 ) ) ( not ( = ?auto_149863 ?auto_149858 ) ) ( not ( = ?auto_149863 ?auto_149857 ) ) ( not ( = ?auto_149864 ?auto_149859 ) ) ( not ( = ?auto_149864 ?auto_149858 ) ) ( not ( = ?auto_149864 ?auto_149857 ) ) ( not ( = ?auto_149856 ?auto_149860 ) ) ( not ( = ?auto_149856 ?auto_149862 ) ) ( not ( = ?auto_149856 ?auto_149861 ) ) ( not ( = ?auto_149856 ?auto_149863 ) ) ( not ( = ?auto_149856 ?auto_149864 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_149860 ?auto_149862 ?auto_149861 ?auto_149863 ?auto_149864 ?auto_149859 ?auto_149858 )
      ( MAKE-3PILE ?auto_149856 ?auto_149857 ?auto_149858 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_149865 - BLOCK
      ?auto_149866 - BLOCK
      ?auto_149867 - BLOCK
    )
    :vars
    (
      ?auto_149868 - BLOCK
      ?auto_149873 - BLOCK
      ?auto_149869 - BLOCK
      ?auto_149871 - BLOCK
      ?auto_149872 - BLOCK
      ?auto_149870 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149865 ?auto_149866 ) ) ( not ( = ?auto_149865 ?auto_149867 ) ) ( not ( = ?auto_149866 ?auto_149867 ) ) ( ON ?auto_149867 ?auto_149868 ) ( not ( = ?auto_149865 ?auto_149868 ) ) ( not ( = ?auto_149866 ?auto_149868 ) ) ( not ( = ?auto_149867 ?auto_149868 ) ) ( ON ?auto_149866 ?auto_149867 ) ( CLEAR ?auto_149866 ) ( ON-TABLE ?auto_149873 ) ( ON ?auto_149869 ?auto_149873 ) ( ON ?auto_149871 ?auto_149869 ) ( ON ?auto_149872 ?auto_149871 ) ( ON ?auto_149870 ?auto_149872 ) ( ON ?auto_149868 ?auto_149870 ) ( not ( = ?auto_149873 ?auto_149869 ) ) ( not ( = ?auto_149873 ?auto_149871 ) ) ( not ( = ?auto_149873 ?auto_149872 ) ) ( not ( = ?auto_149873 ?auto_149870 ) ) ( not ( = ?auto_149873 ?auto_149868 ) ) ( not ( = ?auto_149873 ?auto_149867 ) ) ( not ( = ?auto_149873 ?auto_149866 ) ) ( not ( = ?auto_149869 ?auto_149871 ) ) ( not ( = ?auto_149869 ?auto_149872 ) ) ( not ( = ?auto_149869 ?auto_149870 ) ) ( not ( = ?auto_149869 ?auto_149868 ) ) ( not ( = ?auto_149869 ?auto_149867 ) ) ( not ( = ?auto_149869 ?auto_149866 ) ) ( not ( = ?auto_149871 ?auto_149872 ) ) ( not ( = ?auto_149871 ?auto_149870 ) ) ( not ( = ?auto_149871 ?auto_149868 ) ) ( not ( = ?auto_149871 ?auto_149867 ) ) ( not ( = ?auto_149871 ?auto_149866 ) ) ( not ( = ?auto_149872 ?auto_149870 ) ) ( not ( = ?auto_149872 ?auto_149868 ) ) ( not ( = ?auto_149872 ?auto_149867 ) ) ( not ( = ?auto_149872 ?auto_149866 ) ) ( not ( = ?auto_149870 ?auto_149868 ) ) ( not ( = ?auto_149870 ?auto_149867 ) ) ( not ( = ?auto_149870 ?auto_149866 ) ) ( not ( = ?auto_149865 ?auto_149873 ) ) ( not ( = ?auto_149865 ?auto_149869 ) ) ( not ( = ?auto_149865 ?auto_149871 ) ) ( not ( = ?auto_149865 ?auto_149872 ) ) ( not ( = ?auto_149865 ?auto_149870 ) ) ( HOLDING ?auto_149865 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_149865 )
      ( MAKE-3PILE ?auto_149865 ?auto_149866 ?auto_149867 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_149874 - BLOCK
      ?auto_149875 - BLOCK
      ?auto_149876 - BLOCK
    )
    :vars
    (
      ?auto_149879 - BLOCK
      ?auto_149880 - BLOCK
      ?auto_149881 - BLOCK
      ?auto_149882 - BLOCK
      ?auto_149878 - BLOCK
      ?auto_149877 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149874 ?auto_149875 ) ) ( not ( = ?auto_149874 ?auto_149876 ) ) ( not ( = ?auto_149875 ?auto_149876 ) ) ( ON ?auto_149876 ?auto_149879 ) ( not ( = ?auto_149874 ?auto_149879 ) ) ( not ( = ?auto_149875 ?auto_149879 ) ) ( not ( = ?auto_149876 ?auto_149879 ) ) ( ON ?auto_149875 ?auto_149876 ) ( ON-TABLE ?auto_149880 ) ( ON ?auto_149881 ?auto_149880 ) ( ON ?auto_149882 ?auto_149881 ) ( ON ?auto_149878 ?auto_149882 ) ( ON ?auto_149877 ?auto_149878 ) ( ON ?auto_149879 ?auto_149877 ) ( not ( = ?auto_149880 ?auto_149881 ) ) ( not ( = ?auto_149880 ?auto_149882 ) ) ( not ( = ?auto_149880 ?auto_149878 ) ) ( not ( = ?auto_149880 ?auto_149877 ) ) ( not ( = ?auto_149880 ?auto_149879 ) ) ( not ( = ?auto_149880 ?auto_149876 ) ) ( not ( = ?auto_149880 ?auto_149875 ) ) ( not ( = ?auto_149881 ?auto_149882 ) ) ( not ( = ?auto_149881 ?auto_149878 ) ) ( not ( = ?auto_149881 ?auto_149877 ) ) ( not ( = ?auto_149881 ?auto_149879 ) ) ( not ( = ?auto_149881 ?auto_149876 ) ) ( not ( = ?auto_149881 ?auto_149875 ) ) ( not ( = ?auto_149882 ?auto_149878 ) ) ( not ( = ?auto_149882 ?auto_149877 ) ) ( not ( = ?auto_149882 ?auto_149879 ) ) ( not ( = ?auto_149882 ?auto_149876 ) ) ( not ( = ?auto_149882 ?auto_149875 ) ) ( not ( = ?auto_149878 ?auto_149877 ) ) ( not ( = ?auto_149878 ?auto_149879 ) ) ( not ( = ?auto_149878 ?auto_149876 ) ) ( not ( = ?auto_149878 ?auto_149875 ) ) ( not ( = ?auto_149877 ?auto_149879 ) ) ( not ( = ?auto_149877 ?auto_149876 ) ) ( not ( = ?auto_149877 ?auto_149875 ) ) ( not ( = ?auto_149874 ?auto_149880 ) ) ( not ( = ?auto_149874 ?auto_149881 ) ) ( not ( = ?auto_149874 ?auto_149882 ) ) ( not ( = ?auto_149874 ?auto_149878 ) ) ( not ( = ?auto_149874 ?auto_149877 ) ) ( ON ?auto_149874 ?auto_149875 ) ( CLEAR ?auto_149874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_149880 ?auto_149881 ?auto_149882 ?auto_149878 ?auto_149877 ?auto_149879 ?auto_149876 ?auto_149875 )
      ( MAKE-3PILE ?auto_149874 ?auto_149875 ?auto_149876 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_149888 - BLOCK
      ?auto_149889 - BLOCK
      ?auto_149890 - BLOCK
      ?auto_149891 - BLOCK
      ?auto_149892 - BLOCK
    )
    :vars
    (
      ?auto_149893 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149893 ?auto_149892 ) ( CLEAR ?auto_149893 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_149888 ) ( ON ?auto_149889 ?auto_149888 ) ( ON ?auto_149890 ?auto_149889 ) ( ON ?auto_149891 ?auto_149890 ) ( ON ?auto_149892 ?auto_149891 ) ( not ( = ?auto_149888 ?auto_149889 ) ) ( not ( = ?auto_149888 ?auto_149890 ) ) ( not ( = ?auto_149888 ?auto_149891 ) ) ( not ( = ?auto_149888 ?auto_149892 ) ) ( not ( = ?auto_149888 ?auto_149893 ) ) ( not ( = ?auto_149889 ?auto_149890 ) ) ( not ( = ?auto_149889 ?auto_149891 ) ) ( not ( = ?auto_149889 ?auto_149892 ) ) ( not ( = ?auto_149889 ?auto_149893 ) ) ( not ( = ?auto_149890 ?auto_149891 ) ) ( not ( = ?auto_149890 ?auto_149892 ) ) ( not ( = ?auto_149890 ?auto_149893 ) ) ( not ( = ?auto_149891 ?auto_149892 ) ) ( not ( = ?auto_149891 ?auto_149893 ) ) ( not ( = ?auto_149892 ?auto_149893 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_149893 ?auto_149892 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_149894 - BLOCK
      ?auto_149895 - BLOCK
      ?auto_149896 - BLOCK
      ?auto_149897 - BLOCK
      ?auto_149898 - BLOCK
    )
    :vars
    (
      ?auto_149899 - BLOCK
      ?auto_149900 - BLOCK
      ?auto_149901 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149899 ?auto_149898 ) ( CLEAR ?auto_149899 ) ( ON-TABLE ?auto_149894 ) ( ON ?auto_149895 ?auto_149894 ) ( ON ?auto_149896 ?auto_149895 ) ( ON ?auto_149897 ?auto_149896 ) ( ON ?auto_149898 ?auto_149897 ) ( not ( = ?auto_149894 ?auto_149895 ) ) ( not ( = ?auto_149894 ?auto_149896 ) ) ( not ( = ?auto_149894 ?auto_149897 ) ) ( not ( = ?auto_149894 ?auto_149898 ) ) ( not ( = ?auto_149894 ?auto_149899 ) ) ( not ( = ?auto_149895 ?auto_149896 ) ) ( not ( = ?auto_149895 ?auto_149897 ) ) ( not ( = ?auto_149895 ?auto_149898 ) ) ( not ( = ?auto_149895 ?auto_149899 ) ) ( not ( = ?auto_149896 ?auto_149897 ) ) ( not ( = ?auto_149896 ?auto_149898 ) ) ( not ( = ?auto_149896 ?auto_149899 ) ) ( not ( = ?auto_149897 ?auto_149898 ) ) ( not ( = ?auto_149897 ?auto_149899 ) ) ( not ( = ?auto_149898 ?auto_149899 ) ) ( HOLDING ?auto_149900 ) ( CLEAR ?auto_149901 ) ( not ( = ?auto_149894 ?auto_149900 ) ) ( not ( = ?auto_149894 ?auto_149901 ) ) ( not ( = ?auto_149895 ?auto_149900 ) ) ( not ( = ?auto_149895 ?auto_149901 ) ) ( not ( = ?auto_149896 ?auto_149900 ) ) ( not ( = ?auto_149896 ?auto_149901 ) ) ( not ( = ?auto_149897 ?auto_149900 ) ) ( not ( = ?auto_149897 ?auto_149901 ) ) ( not ( = ?auto_149898 ?auto_149900 ) ) ( not ( = ?auto_149898 ?auto_149901 ) ) ( not ( = ?auto_149899 ?auto_149900 ) ) ( not ( = ?auto_149899 ?auto_149901 ) ) ( not ( = ?auto_149900 ?auto_149901 ) ) )
    :subtasks
    ( ( !STACK ?auto_149900 ?auto_149901 )
      ( MAKE-5PILE ?auto_149894 ?auto_149895 ?auto_149896 ?auto_149897 ?auto_149898 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_149902 - BLOCK
      ?auto_149903 - BLOCK
      ?auto_149904 - BLOCK
      ?auto_149905 - BLOCK
      ?auto_149906 - BLOCK
    )
    :vars
    (
      ?auto_149909 - BLOCK
      ?auto_149908 - BLOCK
      ?auto_149907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149909 ?auto_149906 ) ( ON-TABLE ?auto_149902 ) ( ON ?auto_149903 ?auto_149902 ) ( ON ?auto_149904 ?auto_149903 ) ( ON ?auto_149905 ?auto_149904 ) ( ON ?auto_149906 ?auto_149905 ) ( not ( = ?auto_149902 ?auto_149903 ) ) ( not ( = ?auto_149902 ?auto_149904 ) ) ( not ( = ?auto_149902 ?auto_149905 ) ) ( not ( = ?auto_149902 ?auto_149906 ) ) ( not ( = ?auto_149902 ?auto_149909 ) ) ( not ( = ?auto_149903 ?auto_149904 ) ) ( not ( = ?auto_149903 ?auto_149905 ) ) ( not ( = ?auto_149903 ?auto_149906 ) ) ( not ( = ?auto_149903 ?auto_149909 ) ) ( not ( = ?auto_149904 ?auto_149905 ) ) ( not ( = ?auto_149904 ?auto_149906 ) ) ( not ( = ?auto_149904 ?auto_149909 ) ) ( not ( = ?auto_149905 ?auto_149906 ) ) ( not ( = ?auto_149905 ?auto_149909 ) ) ( not ( = ?auto_149906 ?auto_149909 ) ) ( CLEAR ?auto_149908 ) ( not ( = ?auto_149902 ?auto_149907 ) ) ( not ( = ?auto_149902 ?auto_149908 ) ) ( not ( = ?auto_149903 ?auto_149907 ) ) ( not ( = ?auto_149903 ?auto_149908 ) ) ( not ( = ?auto_149904 ?auto_149907 ) ) ( not ( = ?auto_149904 ?auto_149908 ) ) ( not ( = ?auto_149905 ?auto_149907 ) ) ( not ( = ?auto_149905 ?auto_149908 ) ) ( not ( = ?auto_149906 ?auto_149907 ) ) ( not ( = ?auto_149906 ?auto_149908 ) ) ( not ( = ?auto_149909 ?auto_149907 ) ) ( not ( = ?auto_149909 ?auto_149908 ) ) ( not ( = ?auto_149907 ?auto_149908 ) ) ( ON ?auto_149907 ?auto_149909 ) ( CLEAR ?auto_149907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_149902 ?auto_149903 ?auto_149904 ?auto_149905 ?auto_149906 ?auto_149909 )
      ( MAKE-5PILE ?auto_149902 ?auto_149903 ?auto_149904 ?auto_149905 ?auto_149906 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_149910 - BLOCK
      ?auto_149911 - BLOCK
      ?auto_149912 - BLOCK
      ?auto_149913 - BLOCK
      ?auto_149914 - BLOCK
    )
    :vars
    (
      ?auto_149915 - BLOCK
      ?auto_149917 - BLOCK
      ?auto_149916 - BLOCK
      ?auto_149918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149915 ?auto_149914 ) ( ON-TABLE ?auto_149910 ) ( ON ?auto_149911 ?auto_149910 ) ( ON ?auto_149912 ?auto_149911 ) ( ON ?auto_149913 ?auto_149912 ) ( ON ?auto_149914 ?auto_149913 ) ( not ( = ?auto_149910 ?auto_149911 ) ) ( not ( = ?auto_149910 ?auto_149912 ) ) ( not ( = ?auto_149910 ?auto_149913 ) ) ( not ( = ?auto_149910 ?auto_149914 ) ) ( not ( = ?auto_149910 ?auto_149915 ) ) ( not ( = ?auto_149911 ?auto_149912 ) ) ( not ( = ?auto_149911 ?auto_149913 ) ) ( not ( = ?auto_149911 ?auto_149914 ) ) ( not ( = ?auto_149911 ?auto_149915 ) ) ( not ( = ?auto_149912 ?auto_149913 ) ) ( not ( = ?auto_149912 ?auto_149914 ) ) ( not ( = ?auto_149912 ?auto_149915 ) ) ( not ( = ?auto_149913 ?auto_149914 ) ) ( not ( = ?auto_149913 ?auto_149915 ) ) ( not ( = ?auto_149914 ?auto_149915 ) ) ( not ( = ?auto_149910 ?auto_149917 ) ) ( not ( = ?auto_149910 ?auto_149916 ) ) ( not ( = ?auto_149911 ?auto_149917 ) ) ( not ( = ?auto_149911 ?auto_149916 ) ) ( not ( = ?auto_149912 ?auto_149917 ) ) ( not ( = ?auto_149912 ?auto_149916 ) ) ( not ( = ?auto_149913 ?auto_149917 ) ) ( not ( = ?auto_149913 ?auto_149916 ) ) ( not ( = ?auto_149914 ?auto_149917 ) ) ( not ( = ?auto_149914 ?auto_149916 ) ) ( not ( = ?auto_149915 ?auto_149917 ) ) ( not ( = ?auto_149915 ?auto_149916 ) ) ( not ( = ?auto_149917 ?auto_149916 ) ) ( ON ?auto_149917 ?auto_149915 ) ( CLEAR ?auto_149917 ) ( HOLDING ?auto_149916 ) ( CLEAR ?auto_149918 ) ( ON-TABLE ?auto_149918 ) ( not ( = ?auto_149918 ?auto_149916 ) ) ( not ( = ?auto_149910 ?auto_149918 ) ) ( not ( = ?auto_149911 ?auto_149918 ) ) ( not ( = ?auto_149912 ?auto_149918 ) ) ( not ( = ?auto_149913 ?auto_149918 ) ) ( not ( = ?auto_149914 ?auto_149918 ) ) ( not ( = ?auto_149915 ?auto_149918 ) ) ( not ( = ?auto_149917 ?auto_149918 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_149918 ?auto_149916 )
      ( MAKE-5PILE ?auto_149910 ?auto_149911 ?auto_149912 ?auto_149913 ?auto_149914 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_149919 - BLOCK
      ?auto_149920 - BLOCK
      ?auto_149921 - BLOCK
      ?auto_149922 - BLOCK
      ?auto_149923 - BLOCK
    )
    :vars
    (
      ?auto_149927 - BLOCK
      ?auto_149925 - BLOCK
      ?auto_149926 - BLOCK
      ?auto_149924 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149927 ?auto_149923 ) ( ON-TABLE ?auto_149919 ) ( ON ?auto_149920 ?auto_149919 ) ( ON ?auto_149921 ?auto_149920 ) ( ON ?auto_149922 ?auto_149921 ) ( ON ?auto_149923 ?auto_149922 ) ( not ( = ?auto_149919 ?auto_149920 ) ) ( not ( = ?auto_149919 ?auto_149921 ) ) ( not ( = ?auto_149919 ?auto_149922 ) ) ( not ( = ?auto_149919 ?auto_149923 ) ) ( not ( = ?auto_149919 ?auto_149927 ) ) ( not ( = ?auto_149920 ?auto_149921 ) ) ( not ( = ?auto_149920 ?auto_149922 ) ) ( not ( = ?auto_149920 ?auto_149923 ) ) ( not ( = ?auto_149920 ?auto_149927 ) ) ( not ( = ?auto_149921 ?auto_149922 ) ) ( not ( = ?auto_149921 ?auto_149923 ) ) ( not ( = ?auto_149921 ?auto_149927 ) ) ( not ( = ?auto_149922 ?auto_149923 ) ) ( not ( = ?auto_149922 ?auto_149927 ) ) ( not ( = ?auto_149923 ?auto_149927 ) ) ( not ( = ?auto_149919 ?auto_149925 ) ) ( not ( = ?auto_149919 ?auto_149926 ) ) ( not ( = ?auto_149920 ?auto_149925 ) ) ( not ( = ?auto_149920 ?auto_149926 ) ) ( not ( = ?auto_149921 ?auto_149925 ) ) ( not ( = ?auto_149921 ?auto_149926 ) ) ( not ( = ?auto_149922 ?auto_149925 ) ) ( not ( = ?auto_149922 ?auto_149926 ) ) ( not ( = ?auto_149923 ?auto_149925 ) ) ( not ( = ?auto_149923 ?auto_149926 ) ) ( not ( = ?auto_149927 ?auto_149925 ) ) ( not ( = ?auto_149927 ?auto_149926 ) ) ( not ( = ?auto_149925 ?auto_149926 ) ) ( ON ?auto_149925 ?auto_149927 ) ( CLEAR ?auto_149924 ) ( ON-TABLE ?auto_149924 ) ( not ( = ?auto_149924 ?auto_149926 ) ) ( not ( = ?auto_149919 ?auto_149924 ) ) ( not ( = ?auto_149920 ?auto_149924 ) ) ( not ( = ?auto_149921 ?auto_149924 ) ) ( not ( = ?auto_149922 ?auto_149924 ) ) ( not ( = ?auto_149923 ?auto_149924 ) ) ( not ( = ?auto_149927 ?auto_149924 ) ) ( not ( = ?auto_149925 ?auto_149924 ) ) ( ON ?auto_149926 ?auto_149925 ) ( CLEAR ?auto_149926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_149919 ?auto_149920 ?auto_149921 ?auto_149922 ?auto_149923 ?auto_149927 ?auto_149925 )
      ( MAKE-5PILE ?auto_149919 ?auto_149920 ?auto_149921 ?auto_149922 ?auto_149923 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_149928 - BLOCK
      ?auto_149929 - BLOCK
      ?auto_149930 - BLOCK
      ?auto_149931 - BLOCK
      ?auto_149932 - BLOCK
    )
    :vars
    (
      ?auto_149934 - BLOCK
      ?auto_149935 - BLOCK
      ?auto_149933 - BLOCK
      ?auto_149936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149934 ?auto_149932 ) ( ON-TABLE ?auto_149928 ) ( ON ?auto_149929 ?auto_149928 ) ( ON ?auto_149930 ?auto_149929 ) ( ON ?auto_149931 ?auto_149930 ) ( ON ?auto_149932 ?auto_149931 ) ( not ( = ?auto_149928 ?auto_149929 ) ) ( not ( = ?auto_149928 ?auto_149930 ) ) ( not ( = ?auto_149928 ?auto_149931 ) ) ( not ( = ?auto_149928 ?auto_149932 ) ) ( not ( = ?auto_149928 ?auto_149934 ) ) ( not ( = ?auto_149929 ?auto_149930 ) ) ( not ( = ?auto_149929 ?auto_149931 ) ) ( not ( = ?auto_149929 ?auto_149932 ) ) ( not ( = ?auto_149929 ?auto_149934 ) ) ( not ( = ?auto_149930 ?auto_149931 ) ) ( not ( = ?auto_149930 ?auto_149932 ) ) ( not ( = ?auto_149930 ?auto_149934 ) ) ( not ( = ?auto_149931 ?auto_149932 ) ) ( not ( = ?auto_149931 ?auto_149934 ) ) ( not ( = ?auto_149932 ?auto_149934 ) ) ( not ( = ?auto_149928 ?auto_149935 ) ) ( not ( = ?auto_149928 ?auto_149933 ) ) ( not ( = ?auto_149929 ?auto_149935 ) ) ( not ( = ?auto_149929 ?auto_149933 ) ) ( not ( = ?auto_149930 ?auto_149935 ) ) ( not ( = ?auto_149930 ?auto_149933 ) ) ( not ( = ?auto_149931 ?auto_149935 ) ) ( not ( = ?auto_149931 ?auto_149933 ) ) ( not ( = ?auto_149932 ?auto_149935 ) ) ( not ( = ?auto_149932 ?auto_149933 ) ) ( not ( = ?auto_149934 ?auto_149935 ) ) ( not ( = ?auto_149934 ?auto_149933 ) ) ( not ( = ?auto_149935 ?auto_149933 ) ) ( ON ?auto_149935 ?auto_149934 ) ( not ( = ?auto_149936 ?auto_149933 ) ) ( not ( = ?auto_149928 ?auto_149936 ) ) ( not ( = ?auto_149929 ?auto_149936 ) ) ( not ( = ?auto_149930 ?auto_149936 ) ) ( not ( = ?auto_149931 ?auto_149936 ) ) ( not ( = ?auto_149932 ?auto_149936 ) ) ( not ( = ?auto_149934 ?auto_149936 ) ) ( not ( = ?auto_149935 ?auto_149936 ) ) ( ON ?auto_149933 ?auto_149935 ) ( CLEAR ?auto_149933 ) ( HOLDING ?auto_149936 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_149936 )
      ( MAKE-5PILE ?auto_149928 ?auto_149929 ?auto_149930 ?auto_149931 ?auto_149932 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_149937 - BLOCK
      ?auto_149938 - BLOCK
      ?auto_149939 - BLOCK
      ?auto_149940 - BLOCK
      ?auto_149941 - BLOCK
    )
    :vars
    (
      ?auto_149942 - BLOCK
      ?auto_149944 - BLOCK
      ?auto_149945 - BLOCK
      ?auto_149943 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149942 ?auto_149941 ) ( ON-TABLE ?auto_149937 ) ( ON ?auto_149938 ?auto_149937 ) ( ON ?auto_149939 ?auto_149938 ) ( ON ?auto_149940 ?auto_149939 ) ( ON ?auto_149941 ?auto_149940 ) ( not ( = ?auto_149937 ?auto_149938 ) ) ( not ( = ?auto_149937 ?auto_149939 ) ) ( not ( = ?auto_149937 ?auto_149940 ) ) ( not ( = ?auto_149937 ?auto_149941 ) ) ( not ( = ?auto_149937 ?auto_149942 ) ) ( not ( = ?auto_149938 ?auto_149939 ) ) ( not ( = ?auto_149938 ?auto_149940 ) ) ( not ( = ?auto_149938 ?auto_149941 ) ) ( not ( = ?auto_149938 ?auto_149942 ) ) ( not ( = ?auto_149939 ?auto_149940 ) ) ( not ( = ?auto_149939 ?auto_149941 ) ) ( not ( = ?auto_149939 ?auto_149942 ) ) ( not ( = ?auto_149940 ?auto_149941 ) ) ( not ( = ?auto_149940 ?auto_149942 ) ) ( not ( = ?auto_149941 ?auto_149942 ) ) ( not ( = ?auto_149937 ?auto_149944 ) ) ( not ( = ?auto_149937 ?auto_149945 ) ) ( not ( = ?auto_149938 ?auto_149944 ) ) ( not ( = ?auto_149938 ?auto_149945 ) ) ( not ( = ?auto_149939 ?auto_149944 ) ) ( not ( = ?auto_149939 ?auto_149945 ) ) ( not ( = ?auto_149940 ?auto_149944 ) ) ( not ( = ?auto_149940 ?auto_149945 ) ) ( not ( = ?auto_149941 ?auto_149944 ) ) ( not ( = ?auto_149941 ?auto_149945 ) ) ( not ( = ?auto_149942 ?auto_149944 ) ) ( not ( = ?auto_149942 ?auto_149945 ) ) ( not ( = ?auto_149944 ?auto_149945 ) ) ( ON ?auto_149944 ?auto_149942 ) ( not ( = ?auto_149943 ?auto_149945 ) ) ( not ( = ?auto_149937 ?auto_149943 ) ) ( not ( = ?auto_149938 ?auto_149943 ) ) ( not ( = ?auto_149939 ?auto_149943 ) ) ( not ( = ?auto_149940 ?auto_149943 ) ) ( not ( = ?auto_149941 ?auto_149943 ) ) ( not ( = ?auto_149942 ?auto_149943 ) ) ( not ( = ?auto_149944 ?auto_149943 ) ) ( ON ?auto_149945 ?auto_149944 ) ( ON ?auto_149943 ?auto_149945 ) ( CLEAR ?auto_149943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_149937 ?auto_149938 ?auto_149939 ?auto_149940 ?auto_149941 ?auto_149942 ?auto_149944 ?auto_149945 )
      ( MAKE-5PILE ?auto_149937 ?auto_149938 ?auto_149939 ?auto_149940 ?auto_149941 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_149950 - BLOCK
      ?auto_149951 - BLOCK
      ?auto_149952 - BLOCK
      ?auto_149953 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_149953 ) ( CLEAR ?auto_149952 ) ( ON-TABLE ?auto_149950 ) ( ON ?auto_149951 ?auto_149950 ) ( ON ?auto_149952 ?auto_149951 ) ( not ( = ?auto_149950 ?auto_149951 ) ) ( not ( = ?auto_149950 ?auto_149952 ) ) ( not ( = ?auto_149950 ?auto_149953 ) ) ( not ( = ?auto_149951 ?auto_149952 ) ) ( not ( = ?auto_149951 ?auto_149953 ) ) ( not ( = ?auto_149952 ?auto_149953 ) ) )
    :subtasks
    ( ( !STACK ?auto_149953 ?auto_149952 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_149954 - BLOCK
      ?auto_149955 - BLOCK
      ?auto_149956 - BLOCK
      ?auto_149957 - BLOCK
    )
    :vars
    (
      ?auto_149958 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_149956 ) ( ON-TABLE ?auto_149954 ) ( ON ?auto_149955 ?auto_149954 ) ( ON ?auto_149956 ?auto_149955 ) ( not ( = ?auto_149954 ?auto_149955 ) ) ( not ( = ?auto_149954 ?auto_149956 ) ) ( not ( = ?auto_149954 ?auto_149957 ) ) ( not ( = ?auto_149955 ?auto_149956 ) ) ( not ( = ?auto_149955 ?auto_149957 ) ) ( not ( = ?auto_149956 ?auto_149957 ) ) ( ON ?auto_149957 ?auto_149958 ) ( CLEAR ?auto_149957 ) ( HAND-EMPTY ) ( not ( = ?auto_149954 ?auto_149958 ) ) ( not ( = ?auto_149955 ?auto_149958 ) ) ( not ( = ?auto_149956 ?auto_149958 ) ) ( not ( = ?auto_149957 ?auto_149958 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_149957 ?auto_149958 )
      ( MAKE-4PILE ?auto_149954 ?auto_149955 ?auto_149956 ?auto_149957 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_149959 - BLOCK
      ?auto_149960 - BLOCK
      ?auto_149961 - BLOCK
      ?auto_149962 - BLOCK
    )
    :vars
    (
      ?auto_149963 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149959 ) ( ON ?auto_149960 ?auto_149959 ) ( not ( = ?auto_149959 ?auto_149960 ) ) ( not ( = ?auto_149959 ?auto_149961 ) ) ( not ( = ?auto_149959 ?auto_149962 ) ) ( not ( = ?auto_149960 ?auto_149961 ) ) ( not ( = ?auto_149960 ?auto_149962 ) ) ( not ( = ?auto_149961 ?auto_149962 ) ) ( ON ?auto_149962 ?auto_149963 ) ( CLEAR ?auto_149962 ) ( not ( = ?auto_149959 ?auto_149963 ) ) ( not ( = ?auto_149960 ?auto_149963 ) ) ( not ( = ?auto_149961 ?auto_149963 ) ) ( not ( = ?auto_149962 ?auto_149963 ) ) ( HOLDING ?auto_149961 ) ( CLEAR ?auto_149960 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_149959 ?auto_149960 ?auto_149961 )
      ( MAKE-4PILE ?auto_149959 ?auto_149960 ?auto_149961 ?auto_149962 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_149964 - BLOCK
      ?auto_149965 - BLOCK
      ?auto_149966 - BLOCK
      ?auto_149967 - BLOCK
    )
    :vars
    (
      ?auto_149968 - BLOCK
      ?auto_149969 - BLOCK
      ?auto_149971 - BLOCK
      ?auto_149970 - BLOCK
      ?auto_149972 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149964 ) ( ON ?auto_149965 ?auto_149964 ) ( not ( = ?auto_149964 ?auto_149965 ) ) ( not ( = ?auto_149964 ?auto_149966 ) ) ( not ( = ?auto_149964 ?auto_149967 ) ) ( not ( = ?auto_149965 ?auto_149966 ) ) ( not ( = ?auto_149965 ?auto_149967 ) ) ( not ( = ?auto_149966 ?auto_149967 ) ) ( ON ?auto_149967 ?auto_149968 ) ( not ( = ?auto_149964 ?auto_149968 ) ) ( not ( = ?auto_149965 ?auto_149968 ) ) ( not ( = ?auto_149966 ?auto_149968 ) ) ( not ( = ?auto_149967 ?auto_149968 ) ) ( CLEAR ?auto_149965 ) ( ON ?auto_149966 ?auto_149967 ) ( CLEAR ?auto_149966 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_149969 ) ( ON ?auto_149971 ?auto_149969 ) ( ON ?auto_149970 ?auto_149971 ) ( ON ?auto_149972 ?auto_149970 ) ( ON ?auto_149968 ?auto_149972 ) ( not ( = ?auto_149969 ?auto_149971 ) ) ( not ( = ?auto_149969 ?auto_149970 ) ) ( not ( = ?auto_149969 ?auto_149972 ) ) ( not ( = ?auto_149969 ?auto_149968 ) ) ( not ( = ?auto_149969 ?auto_149967 ) ) ( not ( = ?auto_149969 ?auto_149966 ) ) ( not ( = ?auto_149971 ?auto_149970 ) ) ( not ( = ?auto_149971 ?auto_149972 ) ) ( not ( = ?auto_149971 ?auto_149968 ) ) ( not ( = ?auto_149971 ?auto_149967 ) ) ( not ( = ?auto_149971 ?auto_149966 ) ) ( not ( = ?auto_149970 ?auto_149972 ) ) ( not ( = ?auto_149970 ?auto_149968 ) ) ( not ( = ?auto_149970 ?auto_149967 ) ) ( not ( = ?auto_149970 ?auto_149966 ) ) ( not ( = ?auto_149972 ?auto_149968 ) ) ( not ( = ?auto_149972 ?auto_149967 ) ) ( not ( = ?auto_149972 ?auto_149966 ) ) ( not ( = ?auto_149964 ?auto_149969 ) ) ( not ( = ?auto_149964 ?auto_149971 ) ) ( not ( = ?auto_149964 ?auto_149970 ) ) ( not ( = ?auto_149964 ?auto_149972 ) ) ( not ( = ?auto_149965 ?auto_149969 ) ) ( not ( = ?auto_149965 ?auto_149971 ) ) ( not ( = ?auto_149965 ?auto_149970 ) ) ( not ( = ?auto_149965 ?auto_149972 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_149969 ?auto_149971 ?auto_149970 ?auto_149972 ?auto_149968 ?auto_149967 )
      ( MAKE-4PILE ?auto_149964 ?auto_149965 ?auto_149966 ?auto_149967 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_149973 - BLOCK
      ?auto_149974 - BLOCK
      ?auto_149975 - BLOCK
      ?auto_149976 - BLOCK
    )
    :vars
    (
      ?auto_149981 - BLOCK
      ?auto_149980 - BLOCK
      ?auto_149978 - BLOCK
      ?auto_149977 - BLOCK
      ?auto_149979 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149973 ) ( not ( = ?auto_149973 ?auto_149974 ) ) ( not ( = ?auto_149973 ?auto_149975 ) ) ( not ( = ?auto_149973 ?auto_149976 ) ) ( not ( = ?auto_149974 ?auto_149975 ) ) ( not ( = ?auto_149974 ?auto_149976 ) ) ( not ( = ?auto_149975 ?auto_149976 ) ) ( ON ?auto_149976 ?auto_149981 ) ( not ( = ?auto_149973 ?auto_149981 ) ) ( not ( = ?auto_149974 ?auto_149981 ) ) ( not ( = ?auto_149975 ?auto_149981 ) ) ( not ( = ?auto_149976 ?auto_149981 ) ) ( ON ?auto_149975 ?auto_149976 ) ( CLEAR ?auto_149975 ) ( ON-TABLE ?auto_149980 ) ( ON ?auto_149978 ?auto_149980 ) ( ON ?auto_149977 ?auto_149978 ) ( ON ?auto_149979 ?auto_149977 ) ( ON ?auto_149981 ?auto_149979 ) ( not ( = ?auto_149980 ?auto_149978 ) ) ( not ( = ?auto_149980 ?auto_149977 ) ) ( not ( = ?auto_149980 ?auto_149979 ) ) ( not ( = ?auto_149980 ?auto_149981 ) ) ( not ( = ?auto_149980 ?auto_149976 ) ) ( not ( = ?auto_149980 ?auto_149975 ) ) ( not ( = ?auto_149978 ?auto_149977 ) ) ( not ( = ?auto_149978 ?auto_149979 ) ) ( not ( = ?auto_149978 ?auto_149981 ) ) ( not ( = ?auto_149978 ?auto_149976 ) ) ( not ( = ?auto_149978 ?auto_149975 ) ) ( not ( = ?auto_149977 ?auto_149979 ) ) ( not ( = ?auto_149977 ?auto_149981 ) ) ( not ( = ?auto_149977 ?auto_149976 ) ) ( not ( = ?auto_149977 ?auto_149975 ) ) ( not ( = ?auto_149979 ?auto_149981 ) ) ( not ( = ?auto_149979 ?auto_149976 ) ) ( not ( = ?auto_149979 ?auto_149975 ) ) ( not ( = ?auto_149973 ?auto_149980 ) ) ( not ( = ?auto_149973 ?auto_149978 ) ) ( not ( = ?auto_149973 ?auto_149977 ) ) ( not ( = ?auto_149973 ?auto_149979 ) ) ( not ( = ?auto_149974 ?auto_149980 ) ) ( not ( = ?auto_149974 ?auto_149978 ) ) ( not ( = ?auto_149974 ?auto_149977 ) ) ( not ( = ?auto_149974 ?auto_149979 ) ) ( HOLDING ?auto_149974 ) ( CLEAR ?auto_149973 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_149973 ?auto_149974 )
      ( MAKE-4PILE ?auto_149973 ?auto_149974 ?auto_149975 ?auto_149976 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_149982 - BLOCK
      ?auto_149983 - BLOCK
      ?auto_149984 - BLOCK
      ?auto_149985 - BLOCK
    )
    :vars
    (
      ?auto_149988 - BLOCK
      ?auto_149987 - BLOCK
      ?auto_149990 - BLOCK
      ?auto_149989 - BLOCK
      ?auto_149986 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149982 ) ( not ( = ?auto_149982 ?auto_149983 ) ) ( not ( = ?auto_149982 ?auto_149984 ) ) ( not ( = ?auto_149982 ?auto_149985 ) ) ( not ( = ?auto_149983 ?auto_149984 ) ) ( not ( = ?auto_149983 ?auto_149985 ) ) ( not ( = ?auto_149984 ?auto_149985 ) ) ( ON ?auto_149985 ?auto_149988 ) ( not ( = ?auto_149982 ?auto_149988 ) ) ( not ( = ?auto_149983 ?auto_149988 ) ) ( not ( = ?auto_149984 ?auto_149988 ) ) ( not ( = ?auto_149985 ?auto_149988 ) ) ( ON ?auto_149984 ?auto_149985 ) ( ON-TABLE ?auto_149987 ) ( ON ?auto_149990 ?auto_149987 ) ( ON ?auto_149989 ?auto_149990 ) ( ON ?auto_149986 ?auto_149989 ) ( ON ?auto_149988 ?auto_149986 ) ( not ( = ?auto_149987 ?auto_149990 ) ) ( not ( = ?auto_149987 ?auto_149989 ) ) ( not ( = ?auto_149987 ?auto_149986 ) ) ( not ( = ?auto_149987 ?auto_149988 ) ) ( not ( = ?auto_149987 ?auto_149985 ) ) ( not ( = ?auto_149987 ?auto_149984 ) ) ( not ( = ?auto_149990 ?auto_149989 ) ) ( not ( = ?auto_149990 ?auto_149986 ) ) ( not ( = ?auto_149990 ?auto_149988 ) ) ( not ( = ?auto_149990 ?auto_149985 ) ) ( not ( = ?auto_149990 ?auto_149984 ) ) ( not ( = ?auto_149989 ?auto_149986 ) ) ( not ( = ?auto_149989 ?auto_149988 ) ) ( not ( = ?auto_149989 ?auto_149985 ) ) ( not ( = ?auto_149989 ?auto_149984 ) ) ( not ( = ?auto_149986 ?auto_149988 ) ) ( not ( = ?auto_149986 ?auto_149985 ) ) ( not ( = ?auto_149986 ?auto_149984 ) ) ( not ( = ?auto_149982 ?auto_149987 ) ) ( not ( = ?auto_149982 ?auto_149990 ) ) ( not ( = ?auto_149982 ?auto_149989 ) ) ( not ( = ?auto_149982 ?auto_149986 ) ) ( not ( = ?auto_149983 ?auto_149987 ) ) ( not ( = ?auto_149983 ?auto_149990 ) ) ( not ( = ?auto_149983 ?auto_149989 ) ) ( not ( = ?auto_149983 ?auto_149986 ) ) ( CLEAR ?auto_149982 ) ( ON ?auto_149983 ?auto_149984 ) ( CLEAR ?auto_149983 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_149987 ?auto_149990 ?auto_149989 ?auto_149986 ?auto_149988 ?auto_149985 ?auto_149984 )
      ( MAKE-4PILE ?auto_149982 ?auto_149983 ?auto_149984 ?auto_149985 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_149991 - BLOCK
      ?auto_149992 - BLOCK
      ?auto_149993 - BLOCK
      ?auto_149994 - BLOCK
    )
    :vars
    (
      ?auto_149996 - BLOCK
      ?auto_149995 - BLOCK
      ?auto_149999 - BLOCK
      ?auto_149997 - BLOCK
      ?auto_149998 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149991 ?auto_149992 ) ) ( not ( = ?auto_149991 ?auto_149993 ) ) ( not ( = ?auto_149991 ?auto_149994 ) ) ( not ( = ?auto_149992 ?auto_149993 ) ) ( not ( = ?auto_149992 ?auto_149994 ) ) ( not ( = ?auto_149993 ?auto_149994 ) ) ( ON ?auto_149994 ?auto_149996 ) ( not ( = ?auto_149991 ?auto_149996 ) ) ( not ( = ?auto_149992 ?auto_149996 ) ) ( not ( = ?auto_149993 ?auto_149996 ) ) ( not ( = ?auto_149994 ?auto_149996 ) ) ( ON ?auto_149993 ?auto_149994 ) ( ON-TABLE ?auto_149995 ) ( ON ?auto_149999 ?auto_149995 ) ( ON ?auto_149997 ?auto_149999 ) ( ON ?auto_149998 ?auto_149997 ) ( ON ?auto_149996 ?auto_149998 ) ( not ( = ?auto_149995 ?auto_149999 ) ) ( not ( = ?auto_149995 ?auto_149997 ) ) ( not ( = ?auto_149995 ?auto_149998 ) ) ( not ( = ?auto_149995 ?auto_149996 ) ) ( not ( = ?auto_149995 ?auto_149994 ) ) ( not ( = ?auto_149995 ?auto_149993 ) ) ( not ( = ?auto_149999 ?auto_149997 ) ) ( not ( = ?auto_149999 ?auto_149998 ) ) ( not ( = ?auto_149999 ?auto_149996 ) ) ( not ( = ?auto_149999 ?auto_149994 ) ) ( not ( = ?auto_149999 ?auto_149993 ) ) ( not ( = ?auto_149997 ?auto_149998 ) ) ( not ( = ?auto_149997 ?auto_149996 ) ) ( not ( = ?auto_149997 ?auto_149994 ) ) ( not ( = ?auto_149997 ?auto_149993 ) ) ( not ( = ?auto_149998 ?auto_149996 ) ) ( not ( = ?auto_149998 ?auto_149994 ) ) ( not ( = ?auto_149998 ?auto_149993 ) ) ( not ( = ?auto_149991 ?auto_149995 ) ) ( not ( = ?auto_149991 ?auto_149999 ) ) ( not ( = ?auto_149991 ?auto_149997 ) ) ( not ( = ?auto_149991 ?auto_149998 ) ) ( not ( = ?auto_149992 ?auto_149995 ) ) ( not ( = ?auto_149992 ?auto_149999 ) ) ( not ( = ?auto_149992 ?auto_149997 ) ) ( not ( = ?auto_149992 ?auto_149998 ) ) ( ON ?auto_149992 ?auto_149993 ) ( CLEAR ?auto_149992 ) ( HOLDING ?auto_149991 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_149991 )
      ( MAKE-4PILE ?auto_149991 ?auto_149992 ?auto_149993 ?auto_149994 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_150000 - BLOCK
      ?auto_150001 - BLOCK
      ?auto_150002 - BLOCK
      ?auto_150003 - BLOCK
    )
    :vars
    (
      ?auto_150004 - BLOCK
      ?auto_150008 - BLOCK
      ?auto_150005 - BLOCK
      ?auto_150006 - BLOCK
      ?auto_150007 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150000 ?auto_150001 ) ) ( not ( = ?auto_150000 ?auto_150002 ) ) ( not ( = ?auto_150000 ?auto_150003 ) ) ( not ( = ?auto_150001 ?auto_150002 ) ) ( not ( = ?auto_150001 ?auto_150003 ) ) ( not ( = ?auto_150002 ?auto_150003 ) ) ( ON ?auto_150003 ?auto_150004 ) ( not ( = ?auto_150000 ?auto_150004 ) ) ( not ( = ?auto_150001 ?auto_150004 ) ) ( not ( = ?auto_150002 ?auto_150004 ) ) ( not ( = ?auto_150003 ?auto_150004 ) ) ( ON ?auto_150002 ?auto_150003 ) ( ON-TABLE ?auto_150008 ) ( ON ?auto_150005 ?auto_150008 ) ( ON ?auto_150006 ?auto_150005 ) ( ON ?auto_150007 ?auto_150006 ) ( ON ?auto_150004 ?auto_150007 ) ( not ( = ?auto_150008 ?auto_150005 ) ) ( not ( = ?auto_150008 ?auto_150006 ) ) ( not ( = ?auto_150008 ?auto_150007 ) ) ( not ( = ?auto_150008 ?auto_150004 ) ) ( not ( = ?auto_150008 ?auto_150003 ) ) ( not ( = ?auto_150008 ?auto_150002 ) ) ( not ( = ?auto_150005 ?auto_150006 ) ) ( not ( = ?auto_150005 ?auto_150007 ) ) ( not ( = ?auto_150005 ?auto_150004 ) ) ( not ( = ?auto_150005 ?auto_150003 ) ) ( not ( = ?auto_150005 ?auto_150002 ) ) ( not ( = ?auto_150006 ?auto_150007 ) ) ( not ( = ?auto_150006 ?auto_150004 ) ) ( not ( = ?auto_150006 ?auto_150003 ) ) ( not ( = ?auto_150006 ?auto_150002 ) ) ( not ( = ?auto_150007 ?auto_150004 ) ) ( not ( = ?auto_150007 ?auto_150003 ) ) ( not ( = ?auto_150007 ?auto_150002 ) ) ( not ( = ?auto_150000 ?auto_150008 ) ) ( not ( = ?auto_150000 ?auto_150005 ) ) ( not ( = ?auto_150000 ?auto_150006 ) ) ( not ( = ?auto_150000 ?auto_150007 ) ) ( not ( = ?auto_150001 ?auto_150008 ) ) ( not ( = ?auto_150001 ?auto_150005 ) ) ( not ( = ?auto_150001 ?auto_150006 ) ) ( not ( = ?auto_150001 ?auto_150007 ) ) ( ON ?auto_150001 ?auto_150002 ) ( ON ?auto_150000 ?auto_150001 ) ( CLEAR ?auto_150000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_150008 ?auto_150005 ?auto_150006 ?auto_150007 ?auto_150004 ?auto_150003 ?auto_150002 ?auto_150001 )
      ( MAKE-4PILE ?auto_150000 ?auto_150001 ?auto_150002 ?auto_150003 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_150013 - BLOCK
      ?auto_150014 - BLOCK
      ?auto_150015 - BLOCK
      ?auto_150016 - BLOCK
    )
    :vars
    (
      ?auto_150017 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150017 ?auto_150016 ) ( CLEAR ?auto_150017 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_150013 ) ( ON ?auto_150014 ?auto_150013 ) ( ON ?auto_150015 ?auto_150014 ) ( ON ?auto_150016 ?auto_150015 ) ( not ( = ?auto_150013 ?auto_150014 ) ) ( not ( = ?auto_150013 ?auto_150015 ) ) ( not ( = ?auto_150013 ?auto_150016 ) ) ( not ( = ?auto_150013 ?auto_150017 ) ) ( not ( = ?auto_150014 ?auto_150015 ) ) ( not ( = ?auto_150014 ?auto_150016 ) ) ( not ( = ?auto_150014 ?auto_150017 ) ) ( not ( = ?auto_150015 ?auto_150016 ) ) ( not ( = ?auto_150015 ?auto_150017 ) ) ( not ( = ?auto_150016 ?auto_150017 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_150017 ?auto_150016 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_150018 - BLOCK
      ?auto_150019 - BLOCK
      ?auto_150020 - BLOCK
      ?auto_150021 - BLOCK
    )
    :vars
    (
      ?auto_150022 - BLOCK
      ?auto_150023 - BLOCK
      ?auto_150024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150022 ?auto_150021 ) ( CLEAR ?auto_150022 ) ( ON-TABLE ?auto_150018 ) ( ON ?auto_150019 ?auto_150018 ) ( ON ?auto_150020 ?auto_150019 ) ( ON ?auto_150021 ?auto_150020 ) ( not ( = ?auto_150018 ?auto_150019 ) ) ( not ( = ?auto_150018 ?auto_150020 ) ) ( not ( = ?auto_150018 ?auto_150021 ) ) ( not ( = ?auto_150018 ?auto_150022 ) ) ( not ( = ?auto_150019 ?auto_150020 ) ) ( not ( = ?auto_150019 ?auto_150021 ) ) ( not ( = ?auto_150019 ?auto_150022 ) ) ( not ( = ?auto_150020 ?auto_150021 ) ) ( not ( = ?auto_150020 ?auto_150022 ) ) ( not ( = ?auto_150021 ?auto_150022 ) ) ( HOLDING ?auto_150023 ) ( CLEAR ?auto_150024 ) ( not ( = ?auto_150018 ?auto_150023 ) ) ( not ( = ?auto_150018 ?auto_150024 ) ) ( not ( = ?auto_150019 ?auto_150023 ) ) ( not ( = ?auto_150019 ?auto_150024 ) ) ( not ( = ?auto_150020 ?auto_150023 ) ) ( not ( = ?auto_150020 ?auto_150024 ) ) ( not ( = ?auto_150021 ?auto_150023 ) ) ( not ( = ?auto_150021 ?auto_150024 ) ) ( not ( = ?auto_150022 ?auto_150023 ) ) ( not ( = ?auto_150022 ?auto_150024 ) ) ( not ( = ?auto_150023 ?auto_150024 ) ) )
    :subtasks
    ( ( !STACK ?auto_150023 ?auto_150024 )
      ( MAKE-4PILE ?auto_150018 ?auto_150019 ?auto_150020 ?auto_150021 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_150025 - BLOCK
      ?auto_150026 - BLOCK
      ?auto_150027 - BLOCK
      ?auto_150028 - BLOCK
    )
    :vars
    (
      ?auto_150031 - BLOCK
      ?auto_150030 - BLOCK
      ?auto_150029 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150031 ?auto_150028 ) ( ON-TABLE ?auto_150025 ) ( ON ?auto_150026 ?auto_150025 ) ( ON ?auto_150027 ?auto_150026 ) ( ON ?auto_150028 ?auto_150027 ) ( not ( = ?auto_150025 ?auto_150026 ) ) ( not ( = ?auto_150025 ?auto_150027 ) ) ( not ( = ?auto_150025 ?auto_150028 ) ) ( not ( = ?auto_150025 ?auto_150031 ) ) ( not ( = ?auto_150026 ?auto_150027 ) ) ( not ( = ?auto_150026 ?auto_150028 ) ) ( not ( = ?auto_150026 ?auto_150031 ) ) ( not ( = ?auto_150027 ?auto_150028 ) ) ( not ( = ?auto_150027 ?auto_150031 ) ) ( not ( = ?auto_150028 ?auto_150031 ) ) ( CLEAR ?auto_150030 ) ( not ( = ?auto_150025 ?auto_150029 ) ) ( not ( = ?auto_150025 ?auto_150030 ) ) ( not ( = ?auto_150026 ?auto_150029 ) ) ( not ( = ?auto_150026 ?auto_150030 ) ) ( not ( = ?auto_150027 ?auto_150029 ) ) ( not ( = ?auto_150027 ?auto_150030 ) ) ( not ( = ?auto_150028 ?auto_150029 ) ) ( not ( = ?auto_150028 ?auto_150030 ) ) ( not ( = ?auto_150031 ?auto_150029 ) ) ( not ( = ?auto_150031 ?auto_150030 ) ) ( not ( = ?auto_150029 ?auto_150030 ) ) ( ON ?auto_150029 ?auto_150031 ) ( CLEAR ?auto_150029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_150025 ?auto_150026 ?auto_150027 ?auto_150028 ?auto_150031 )
      ( MAKE-4PILE ?auto_150025 ?auto_150026 ?auto_150027 ?auto_150028 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_150032 - BLOCK
      ?auto_150033 - BLOCK
      ?auto_150034 - BLOCK
      ?auto_150035 - BLOCK
    )
    :vars
    (
      ?auto_150038 - BLOCK
      ?auto_150037 - BLOCK
      ?auto_150036 - BLOCK
      ?auto_150040 - BLOCK
      ?auto_150039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150038 ?auto_150035 ) ( ON-TABLE ?auto_150032 ) ( ON ?auto_150033 ?auto_150032 ) ( ON ?auto_150034 ?auto_150033 ) ( ON ?auto_150035 ?auto_150034 ) ( not ( = ?auto_150032 ?auto_150033 ) ) ( not ( = ?auto_150032 ?auto_150034 ) ) ( not ( = ?auto_150032 ?auto_150035 ) ) ( not ( = ?auto_150032 ?auto_150038 ) ) ( not ( = ?auto_150033 ?auto_150034 ) ) ( not ( = ?auto_150033 ?auto_150035 ) ) ( not ( = ?auto_150033 ?auto_150038 ) ) ( not ( = ?auto_150034 ?auto_150035 ) ) ( not ( = ?auto_150034 ?auto_150038 ) ) ( not ( = ?auto_150035 ?auto_150038 ) ) ( not ( = ?auto_150032 ?auto_150037 ) ) ( not ( = ?auto_150032 ?auto_150036 ) ) ( not ( = ?auto_150033 ?auto_150037 ) ) ( not ( = ?auto_150033 ?auto_150036 ) ) ( not ( = ?auto_150034 ?auto_150037 ) ) ( not ( = ?auto_150034 ?auto_150036 ) ) ( not ( = ?auto_150035 ?auto_150037 ) ) ( not ( = ?auto_150035 ?auto_150036 ) ) ( not ( = ?auto_150038 ?auto_150037 ) ) ( not ( = ?auto_150038 ?auto_150036 ) ) ( not ( = ?auto_150037 ?auto_150036 ) ) ( ON ?auto_150037 ?auto_150038 ) ( CLEAR ?auto_150037 ) ( HOLDING ?auto_150036 ) ( CLEAR ?auto_150040 ) ( ON-TABLE ?auto_150039 ) ( ON ?auto_150040 ?auto_150039 ) ( not ( = ?auto_150039 ?auto_150040 ) ) ( not ( = ?auto_150039 ?auto_150036 ) ) ( not ( = ?auto_150040 ?auto_150036 ) ) ( not ( = ?auto_150032 ?auto_150040 ) ) ( not ( = ?auto_150032 ?auto_150039 ) ) ( not ( = ?auto_150033 ?auto_150040 ) ) ( not ( = ?auto_150033 ?auto_150039 ) ) ( not ( = ?auto_150034 ?auto_150040 ) ) ( not ( = ?auto_150034 ?auto_150039 ) ) ( not ( = ?auto_150035 ?auto_150040 ) ) ( not ( = ?auto_150035 ?auto_150039 ) ) ( not ( = ?auto_150038 ?auto_150040 ) ) ( not ( = ?auto_150038 ?auto_150039 ) ) ( not ( = ?auto_150037 ?auto_150040 ) ) ( not ( = ?auto_150037 ?auto_150039 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_150039 ?auto_150040 ?auto_150036 )
      ( MAKE-4PILE ?auto_150032 ?auto_150033 ?auto_150034 ?auto_150035 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_150041 - BLOCK
      ?auto_150042 - BLOCK
      ?auto_150043 - BLOCK
      ?auto_150044 - BLOCK
    )
    :vars
    (
      ?auto_150045 - BLOCK
      ?auto_150047 - BLOCK
      ?auto_150046 - BLOCK
      ?auto_150049 - BLOCK
      ?auto_150048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150045 ?auto_150044 ) ( ON-TABLE ?auto_150041 ) ( ON ?auto_150042 ?auto_150041 ) ( ON ?auto_150043 ?auto_150042 ) ( ON ?auto_150044 ?auto_150043 ) ( not ( = ?auto_150041 ?auto_150042 ) ) ( not ( = ?auto_150041 ?auto_150043 ) ) ( not ( = ?auto_150041 ?auto_150044 ) ) ( not ( = ?auto_150041 ?auto_150045 ) ) ( not ( = ?auto_150042 ?auto_150043 ) ) ( not ( = ?auto_150042 ?auto_150044 ) ) ( not ( = ?auto_150042 ?auto_150045 ) ) ( not ( = ?auto_150043 ?auto_150044 ) ) ( not ( = ?auto_150043 ?auto_150045 ) ) ( not ( = ?auto_150044 ?auto_150045 ) ) ( not ( = ?auto_150041 ?auto_150047 ) ) ( not ( = ?auto_150041 ?auto_150046 ) ) ( not ( = ?auto_150042 ?auto_150047 ) ) ( not ( = ?auto_150042 ?auto_150046 ) ) ( not ( = ?auto_150043 ?auto_150047 ) ) ( not ( = ?auto_150043 ?auto_150046 ) ) ( not ( = ?auto_150044 ?auto_150047 ) ) ( not ( = ?auto_150044 ?auto_150046 ) ) ( not ( = ?auto_150045 ?auto_150047 ) ) ( not ( = ?auto_150045 ?auto_150046 ) ) ( not ( = ?auto_150047 ?auto_150046 ) ) ( ON ?auto_150047 ?auto_150045 ) ( CLEAR ?auto_150049 ) ( ON-TABLE ?auto_150048 ) ( ON ?auto_150049 ?auto_150048 ) ( not ( = ?auto_150048 ?auto_150049 ) ) ( not ( = ?auto_150048 ?auto_150046 ) ) ( not ( = ?auto_150049 ?auto_150046 ) ) ( not ( = ?auto_150041 ?auto_150049 ) ) ( not ( = ?auto_150041 ?auto_150048 ) ) ( not ( = ?auto_150042 ?auto_150049 ) ) ( not ( = ?auto_150042 ?auto_150048 ) ) ( not ( = ?auto_150043 ?auto_150049 ) ) ( not ( = ?auto_150043 ?auto_150048 ) ) ( not ( = ?auto_150044 ?auto_150049 ) ) ( not ( = ?auto_150044 ?auto_150048 ) ) ( not ( = ?auto_150045 ?auto_150049 ) ) ( not ( = ?auto_150045 ?auto_150048 ) ) ( not ( = ?auto_150047 ?auto_150049 ) ) ( not ( = ?auto_150047 ?auto_150048 ) ) ( ON ?auto_150046 ?auto_150047 ) ( CLEAR ?auto_150046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_150041 ?auto_150042 ?auto_150043 ?auto_150044 ?auto_150045 ?auto_150047 )
      ( MAKE-4PILE ?auto_150041 ?auto_150042 ?auto_150043 ?auto_150044 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_150050 - BLOCK
      ?auto_150051 - BLOCK
      ?auto_150052 - BLOCK
      ?auto_150053 - BLOCK
    )
    :vars
    (
      ?auto_150056 - BLOCK
      ?auto_150057 - BLOCK
      ?auto_150058 - BLOCK
      ?auto_150054 - BLOCK
      ?auto_150055 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150056 ?auto_150053 ) ( ON-TABLE ?auto_150050 ) ( ON ?auto_150051 ?auto_150050 ) ( ON ?auto_150052 ?auto_150051 ) ( ON ?auto_150053 ?auto_150052 ) ( not ( = ?auto_150050 ?auto_150051 ) ) ( not ( = ?auto_150050 ?auto_150052 ) ) ( not ( = ?auto_150050 ?auto_150053 ) ) ( not ( = ?auto_150050 ?auto_150056 ) ) ( not ( = ?auto_150051 ?auto_150052 ) ) ( not ( = ?auto_150051 ?auto_150053 ) ) ( not ( = ?auto_150051 ?auto_150056 ) ) ( not ( = ?auto_150052 ?auto_150053 ) ) ( not ( = ?auto_150052 ?auto_150056 ) ) ( not ( = ?auto_150053 ?auto_150056 ) ) ( not ( = ?auto_150050 ?auto_150057 ) ) ( not ( = ?auto_150050 ?auto_150058 ) ) ( not ( = ?auto_150051 ?auto_150057 ) ) ( not ( = ?auto_150051 ?auto_150058 ) ) ( not ( = ?auto_150052 ?auto_150057 ) ) ( not ( = ?auto_150052 ?auto_150058 ) ) ( not ( = ?auto_150053 ?auto_150057 ) ) ( not ( = ?auto_150053 ?auto_150058 ) ) ( not ( = ?auto_150056 ?auto_150057 ) ) ( not ( = ?auto_150056 ?auto_150058 ) ) ( not ( = ?auto_150057 ?auto_150058 ) ) ( ON ?auto_150057 ?auto_150056 ) ( ON-TABLE ?auto_150054 ) ( not ( = ?auto_150054 ?auto_150055 ) ) ( not ( = ?auto_150054 ?auto_150058 ) ) ( not ( = ?auto_150055 ?auto_150058 ) ) ( not ( = ?auto_150050 ?auto_150055 ) ) ( not ( = ?auto_150050 ?auto_150054 ) ) ( not ( = ?auto_150051 ?auto_150055 ) ) ( not ( = ?auto_150051 ?auto_150054 ) ) ( not ( = ?auto_150052 ?auto_150055 ) ) ( not ( = ?auto_150052 ?auto_150054 ) ) ( not ( = ?auto_150053 ?auto_150055 ) ) ( not ( = ?auto_150053 ?auto_150054 ) ) ( not ( = ?auto_150056 ?auto_150055 ) ) ( not ( = ?auto_150056 ?auto_150054 ) ) ( not ( = ?auto_150057 ?auto_150055 ) ) ( not ( = ?auto_150057 ?auto_150054 ) ) ( ON ?auto_150058 ?auto_150057 ) ( CLEAR ?auto_150058 ) ( HOLDING ?auto_150055 ) ( CLEAR ?auto_150054 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_150054 ?auto_150055 )
      ( MAKE-4PILE ?auto_150050 ?auto_150051 ?auto_150052 ?auto_150053 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_150059 - BLOCK
      ?auto_150060 - BLOCK
      ?auto_150061 - BLOCK
      ?auto_150062 - BLOCK
    )
    :vars
    (
      ?auto_150063 - BLOCK
      ?auto_150066 - BLOCK
      ?auto_150065 - BLOCK
      ?auto_150064 - BLOCK
      ?auto_150067 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150063 ?auto_150062 ) ( ON-TABLE ?auto_150059 ) ( ON ?auto_150060 ?auto_150059 ) ( ON ?auto_150061 ?auto_150060 ) ( ON ?auto_150062 ?auto_150061 ) ( not ( = ?auto_150059 ?auto_150060 ) ) ( not ( = ?auto_150059 ?auto_150061 ) ) ( not ( = ?auto_150059 ?auto_150062 ) ) ( not ( = ?auto_150059 ?auto_150063 ) ) ( not ( = ?auto_150060 ?auto_150061 ) ) ( not ( = ?auto_150060 ?auto_150062 ) ) ( not ( = ?auto_150060 ?auto_150063 ) ) ( not ( = ?auto_150061 ?auto_150062 ) ) ( not ( = ?auto_150061 ?auto_150063 ) ) ( not ( = ?auto_150062 ?auto_150063 ) ) ( not ( = ?auto_150059 ?auto_150066 ) ) ( not ( = ?auto_150059 ?auto_150065 ) ) ( not ( = ?auto_150060 ?auto_150066 ) ) ( not ( = ?auto_150060 ?auto_150065 ) ) ( not ( = ?auto_150061 ?auto_150066 ) ) ( not ( = ?auto_150061 ?auto_150065 ) ) ( not ( = ?auto_150062 ?auto_150066 ) ) ( not ( = ?auto_150062 ?auto_150065 ) ) ( not ( = ?auto_150063 ?auto_150066 ) ) ( not ( = ?auto_150063 ?auto_150065 ) ) ( not ( = ?auto_150066 ?auto_150065 ) ) ( ON ?auto_150066 ?auto_150063 ) ( ON-TABLE ?auto_150064 ) ( not ( = ?auto_150064 ?auto_150067 ) ) ( not ( = ?auto_150064 ?auto_150065 ) ) ( not ( = ?auto_150067 ?auto_150065 ) ) ( not ( = ?auto_150059 ?auto_150067 ) ) ( not ( = ?auto_150059 ?auto_150064 ) ) ( not ( = ?auto_150060 ?auto_150067 ) ) ( not ( = ?auto_150060 ?auto_150064 ) ) ( not ( = ?auto_150061 ?auto_150067 ) ) ( not ( = ?auto_150061 ?auto_150064 ) ) ( not ( = ?auto_150062 ?auto_150067 ) ) ( not ( = ?auto_150062 ?auto_150064 ) ) ( not ( = ?auto_150063 ?auto_150067 ) ) ( not ( = ?auto_150063 ?auto_150064 ) ) ( not ( = ?auto_150066 ?auto_150067 ) ) ( not ( = ?auto_150066 ?auto_150064 ) ) ( ON ?auto_150065 ?auto_150066 ) ( CLEAR ?auto_150064 ) ( ON ?auto_150067 ?auto_150065 ) ( CLEAR ?auto_150067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_150059 ?auto_150060 ?auto_150061 ?auto_150062 ?auto_150063 ?auto_150066 ?auto_150065 )
      ( MAKE-4PILE ?auto_150059 ?auto_150060 ?auto_150061 ?auto_150062 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_150068 - BLOCK
      ?auto_150069 - BLOCK
      ?auto_150070 - BLOCK
      ?auto_150071 - BLOCK
    )
    :vars
    (
      ?auto_150075 - BLOCK
      ?auto_150074 - BLOCK
      ?auto_150073 - BLOCK
      ?auto_150076 - BLOCK
      ?auto_150072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150075 ?auto_150071 ) ( ON-TABLE ?auto_150068 ) ( ON ?auto_150069 ?auto_150068 ) ( ON ?auto_150070 ?auto_150069 ) ( ON ?auto_150071 ?auto_150070 ) ( not ( = ?auto_150068 ?auto_150069 ) ) ( not ( = ?auto_150068 ?auto_150070 ) ) ( not ( = ?auto_150068 ?auto_150071 ) ) ( not ( = ?auto_150068 ?auto_150075 ) ) ( not ( = ?auto_150069 ?auto_150070 ) ) ( not ( = ?auto_150069 ?auto_150071 ) ) ( not ( = ?auto_150069 ?auto_150075 ) ) ( not ( = ?auto_150070 ?auto_150071 ) ) ( not ( = ?auto_150070 ?auto_150075 ) ) ( not ( = ?auto_150071 ?auto_150075 ) ) ( not ( = ?auto_150068 ?auto_150074 ) ) ( not ( = ?auto_150068 ?auto_150073 ) ) ( not ( = ?auto_150069 ?auto_150074 ) ) ( not ( = ?auto_150069 ?auto_150073 ) ) ( not ( = ?auto_150070 ?auto_150074 ) ) ( not ( = ?auto_150070 ?auto_150073 ) ) ( not ( = ?auto_150071 ?auto_150074 ) ) ( not ( = ?auto_150071 ?auto_150073 ) ) ( not ( = ?auto_150075 ?auto_150074 ) ) ( not ( = ?auto_150075 ?auto_150073 ) ) ( not ( = ?auto_150074 ?auto_150073 ) ) ( ON ?auto_150074 ?auto_150075 ) ( not ( = ?auto_150076 ?auto_150072 ) ) ( not ( = ?auto_150076 ?auto_150073 ) ) ( not ( = ?auto_150072 ?auto_150073 ) ) ( not ( = ?auto_150068 ?auto_150072 ) ) ( not ( = ?auto_150068 ?auto_150076 ) ) ( not ( = ?auto_150069 ?auto_150072 ) ) ( not ( = ?auto_150069 ?auto_150076 ) ) ( not ( = ?auto_150070 ?auto_150072 ) ) ( not ( = ?auto_150070 ?auto_150076 ) ) ( not ( = ?auto_150071 ?auto_150072 ) ) ( not ( = ?auto_150071 ?auto_150076 ) ) ( not ( = ?auto_150075 ?auto_150072 ) ) ( not ( = ?auto_150075 ?auto_150076 ) ) ( not ( = ?auto_150074 ?auto_150072 ) ) ( not ( = ?auto_150074 ?auto_150076 ) ) ( ON ?auto_150073 ?auto_150074 ) ( ON ?auto_150072 ?auto_150073 ) ( CLEAR ?auto_150072 ) ( HOLDING ?auto_150076 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_150076 )
      ( MAKE-4PILE ?auto_150068 ?auto_150069 ?auto_150070 ?auto_150071 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_150077 - BLOCK
      ?auto_150078 - BLOCK
      ?auto_150079 - BLOCK
      ?auto_150080 - BLOCK
    )
    :vars
    (
      ?auto_150084 - BLOCK
      ?auto_150081 - BLOCK
      ?auto_150082 - BLOCK
      ?auto_150085 - BLOCK
      ?auto_150083 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150084 ?auto_150080 ) ( ON-TABLE ?auto_150077 ) ( ON ?auto_150078 ?auto_150077 ) ( ON ?auto_150079 ?auto_150078 ) ( ON ?auto_150080 ?auto_150079 ) ( not ( = ?auto_150077 ?auto_150078 ) ) ( not ( = ?auto_150077 ?auto_150079 ) ) ( not ( = ?auto_150077 ?auto_150080 ) ) ( not ( = ?auto_150077 ?auto_150084 ) ) ( not ( = ?auto_150078 ?auto_150079 ) ) ( not ( = ?auto_150078 ?auto_150080 ) ) ( not ( = ?auto_150078 ?auto_150084 ) ) ( not ( = ?auto_150079 ?auto_150080 ) ) ( not ( = ?auto_150079 ?auto_150084 ) ) ( not ( = ?auto_150080 ?auto_150084 ) ) ( not ( = ?auto_150077 ?auto_150081 ) ) ( not ( = ?auto_150077 ?auto_150082 ) ) ( not ( = ?auto_150078 ?auto_150081 ) ) ( not ( = ?auto_150078 ?auto_150082 ) ) ( not ( = ?auto_150079 ?auto_150081 ) ) ( not ( = ?auto_150079 ?auto_150082 ) ) ( not ( = ?auto_150080 ?auto_150081 ) ) ( not ( = ?auto_150080 ?auto_150082 ) ) ( not ( = ?auto_150084 ?auto_150081 ) ) ( not ( = ?auto_150084 ?auto_150082 ) ) ( not ( = ?auto_150081 ?auto_150082 ) ) ( ON ?auto_150081 ?auto_150084 ) ( not ( = ?auto_150085 ?auto_150083 ) ) ( not ( = ?auto_150085 ?auto_150082 ) ) ( not ( = ?auto_150083 ?auto_150082 ) ) ( not ( = ?auto_150077 ?auto_150083 ) ) ( not ( = ?auto_150077 ?auto_150085 ) ) ( not ( = ?auto_150078 ?auto_150083 ) ) ( not ( = ?auto_150078 ?auto_150085 ) ) ( not ( = ?auto_150079 ?auto_150083 ) ) ( not ( = ?auto_150079 ?auto_150085 ) ) ( not ( = ?auto_150080 ?auto_150083 ) ) ( not ( = ?auto_150080 ?auto_150085 ) ) ( not ( = ?auto_150084 ?auto_150083 ) ) ( not ( = ?auto_150084 ?auto_150085 ) ) ( not ( = ?auto_150081 ?auto_150083 ) ) ( not ( = ?auto_150081 ?auto_150085 ) ) ( ON ?auto_150082 ?auto_150081 ) ( ON ?auto_150083 ?auto_150082 ) ( ON ?auto_150085 ?auto_150083 ) ( CLEAR ?auto_150085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_150077 ?auto_150078 ?auto_150079 ?auto_150080 ?auto_150084 ?auto_150081 ?auto_150082 ?auto_150083 )
      ( MAKE-4PILE ?auto_150077 ?auto_150078 ?auto_150079 ?auto_150080 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_150091 - BLOCK
      ?auto_150092 - BLOCK
      ?auto_150093 - BLOCK
      ?auto_150094 - BLOCK
      ?auto_150095 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_150095 ) ( CLEAR ?auto_150094 ) ( ON-TABLE ?auto_150091 ) ( ON ?auto_150092 ?auto_150091 ) ( ON ?auto_150093 ?auto_150092 ) ( ON ?auto_150094 ?auto_150093 ) ( not ( = ?auto_150091 ?auto_150092 ) ) ( not ( = ?auto_150091 ?auto_150093 ) ) ( not ( = ?auto_150091 ?auto_150094 ) ) ( not ( = ?auto_150091 ?auto_150095 ) ) ( not ( = ?auto_150092 ?auto_150093 ) ) ( not ( = ?auto_150092 ?auto_150094 ) ) ( not ( = ?auto_150092 ?auto_150095 ) ) ( not ( = ?auto_150093 ?auto_150094 ) ) ( not ( = ?auto_150093 ?auto_150095 ) ) ( not ( = ?auto_150094 ?auto_150095 ) ) )
    :subtasks
    ( ( !STACK ?auto_150095 ?auto_150094 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_150096 - BLOCK
      ?auto_150097 - BLOCK
      ?auto_150098 - BLOCK
      ?auto_150099 - BLOCK
      ?auto_150100 - BLOCK
    )
    :vars
    (
      ?auto_150101 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_150099 ) ( ON-TABLE ?auto_150096 ) ( ON ?auto_150097 ?auto_150096 ) ( ON ?auto_150098 ?auto_150097 ) ( ON ?auto_150099 ?auto_150098 ) ( not ( = ?auto_150096 ?auto_150097 ) ) ( not ( = ?auto_150096 ?auto_150098 ) ) ( not ( = ?auto_150096 ?auto_150099 ) ) ( not ( = ?auto_150096 ?auto_150100 ) ) ( not ( = ?auto_150097 ?auto_150098 ) ) ( not ( = ?auto_150097 ?auto_150099 ) ) ( not ( = ?auto_150097 ?auto_150100 ) ) ( not ( = ?auto_150098 ?auto_150099 ) ) ( not ( = ?auto_150098 ?auto_150100 ) ) ( not ( = ?auto_150099 ?auto_150100 ) ) ( ON ?auto_150100 ?auto_150101 ) ( CLEAR ?auto_150100 ) ( HAND-EMPTY ) ( not ( = ?auto_150096 ?auto_150101 ) ) ( not ( = ?auto_150097 ?auto_150101 ) ) ( not ( = ?auto_150098 ?auto_150101 ) ) ( not ( = ?auto_150099 ?auto_150101 ) ) ( not ( = ?auto_150100 ?auto_150101 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_150100 ?auto_150101 )
      ( MAKE-5PILE ?auto_150096 ?auto_150097 ?auto_150098 ?auto_150099 ?auto_150100 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_150102 - BLOCK
      ?auto_150103 - BLOCK
      ?auto_150104 - BLOCK
      ?auto_150105 - BLOCK
      ?auto_150106 - BLOCK
    )
    :vars
    (
      ?auto_150107 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150102 ) ( ON ?auto_150103 ?auto_150102 ) ( ON ?auto_150104 ?auto_150103 ) ( not ( = ?auto_150102 ?auto_150103 ) ) ( not ( = ?auto_150102 ?auto_150104 ) ) ( not ( = ?auto_150102 ?auto_150105 ) ) ( not ( = ?auto_150102 ?auto_150106 ) ) ( not ( = ?auto_150103 ?auto_150104 ) ) ( not ( = ?auto_150103 ?auto_150105 ) ) ( not ( = ?auto_150103 ?auto_150106 ) ) ( not ( = ?auto_150104 ?auto_150105 ) ) ( not ( = ?auto_150104 ?auto_150106 ) ) ( not ( = ?auto_150105 ?auto_150106 ) ) ( ON ?auto_150106 ?auto_150107 ) ( CLEAR ?auto_150106 ) ( not ( = ?auto_150102 ?auto_150107 ) ) ( not ( = ?auto_150103 ?auto_150107 ) ) ( not ( = ?auto_150104 ?auto_150107 ) ) ( not ( = ?auto_150105 ?auto_150107 ) ) ( not ( = ?auto_150106 ?auto_150107 ) ) ( HOLDING ?auto_150105 ) ( CLEAR ?auto_150104 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_150102 ?auto_150103 ?auto_150104 ?auto_150105 )
      ( MAKE-5PILE ?auto_150102 ?auto_150103 ?auto_150104 ?auto_150105 ?auto_150106 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_150108 - BLOCK
      ?auto_150109 - BLOCK
      ?auto_150110 - BLOCK
      ?auto_150111 - BLOCK
      ?auto_150112 - BLOCK
    )
    :vars
    (
      ?auto_150113 - BLOCK
      ?auto_150114 - BLOCK
      ?auto_150115 - BLOCK
      ?auto_150116 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150108 ) ( ON ?auto_150109 ?auto_150108 ) ( ON ?auto_150110 ?auto_150109 ) ( not ( = ?auto_150108 ?auto_150109 ) ) ( not ( = ?auto_150108 ?auto_150110 ) ) ( not ( = ?auto_150108 ?auto_150111 ) ) ( not ( = ?auto_150108 ?auto_150112 ) ) ( not ( = ?auto_150109 ?auto_150110 ) ) ( not ( = ?auto_150109 ?auto_150111 ) ) ( not ( = ?auto_150109 ?auto_150112 ) ) ( not ( = ?auto_150110 ?auto_150111 ) ) ( not ( = ?auto_150110 ?auto_150112 ) ) ( not ( = ?auto_150111 ?auto_150112 ) ) ( ON ?auto_150112 ?auto_150113 ) ( not ( = ?auto_150108 ?auto_150113 ) ) ( not ( = ?auto_150109 ?auto_150113 ) ) ( not ( = ?auto_150110 ?auto_150113 ) ) ( not ( = ?auto_150111 ?auto_150113 ) ) ( not ( = ?auto_150112 ?auto_150113 ) ) ( CLEAR ?auto_150110 ) ( ON ?auto_150111 ?auto_150112 ) ( CLEAR ?auto_150111 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_150114 ) ( ON ?auto_150115 ?auto_150114 ) ( ON ?auto_150116 ?auto_150115 ) ( ON ?auto_150113 ?auto_150116 ) ( not ( = ?auto_150114 ?auto_150115 ) ) ( not ( = ?auto_150114 ?auto_150116 ) ) ( not ( = ?auto_150114 ?auto_150113 ) ) ( not ( = ?auto_150114 ?auto_150112 ) ) ( not ( = ?auto_150114 ?auto_150111 ) ) ( not ( = ?auto_150115 ?auto_150116 ) ) ( not ( = ?auto_150115 ?auto_150113 ) ) ( not ( = ?auto_150115 ?auto_150112 ) ) ( not ( = ?auto_150115 ?auto_150111 ) ) ( not ( = ?auto_150116 ?auto_150113 ) ) ( not ( = ?auto_150116 ?auto_150112 ) ) ( not ( = ?auto_150116 ?auto_150111 ) ) ( not ( = ?auto_150108 ?auto_150114 ) ) ( not ( = ?auto_150108 ?auto_150115 ) ) ( not ( = ?auto_150108 ?auto_150116 ) ) ( not ( = ?auto_150109 ?auto_150114 ) ) ( not ( = ?auto_150109 ?auto_150115 ) ) ( not ( = ?auto_150109 ?auto_150116 ) ) ( not ( = ?auto_150110 ?auto_150114 ) ) ( not ( = ?auto_150110 ?auto_150115 ) ) ( not ( = ?auto_150110 ?auto_150116 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_150114 ?auto_150115 ?auto_150116 ?auto_150113 ?auto_150112 )
      ( MAKE-5PILE ?auto_150108 ?auto_150109 ?auto_150110 ?auto_150111 ?auto_150112 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_150117 - BLOCK
      ?auto_150118 - BLOCK
      ?auto_150119 - BLOCK
      ?auto_150120 - BLOCK
      ?auto_150121 - BLOCK
    )
    :vars
    (
      ?auto_150125 - BLOCK
      ?auto_150124 - BLOCK
      ?auto_150122 - BLOCK
      ?auto_150123 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150117 ) ( ON ?auto_150118 ?auto_150117 ) ( not ( = ?auto_150117 ?auto_150118 ) ) ( not ( = ?auto_150117 ?auto_150119 ) ) ( not ( = ?auto_150117 ?auto_150120 ) ) ( not ( = ?auto_150117 ?auto_150121 ) ) ( not ( = ?auto_150118 ?auto_150119 ) ) ( not ( = ?auto_150118 ?auto_150120 ) ) ( not ( = ?auto_150118 ?auto_150121 ) ) ( not ( = ?auto_150119 ?auto_150120 ) ) ( not ( = ?auto_150119 ?auto_150121 ) ) ( not ( = ?auto_150120 ?auto_150121 ) ) ( ON ?auto_150121 ?auto_150125 ) ( not ( = ?auto_150117 ?auto_150125 ) ) ( not ( = ?auto_150118 ?auto_150125 ) ) ( not ( = ?auto_150119 ?auto_150125 ) ) ( not ( = ?auto_150120 ?auto_150125 ) ) ( not ( = ?auto_150121 ?auto_150125 ) ) ( ON ?auto_150120 ?auto_150121 ) ( CLEAR ?auto_150120 ) ( ON-TABLE ?auto_150124 ) ( ON ?auto_150122 ?auto_150124 ) ( ON ?auto_150123 ?auto_150122 ) ( ON ?auto_150125 ?auto_150123 ) ( not ( = ?auto_150124 ?auto_150122 ) ) ( not ( = ?auto_150124 ?auto_150123 ) ) ( not ( = ?auto_150124 ?auto_150125 ) ) ( not ( = ?auto_150124 ?auto_150121 ) ) ( not ( = ?auto_150124 ?auto_150120 ) ) ( not ( = ?auto_150122 ?auto_150123 ) ) ( not ( = ?auto_150122 ?auto_150125 ) ) ( not ( = ?auto_150122 ?auto_150121 ) ) ( not ( = ?auto_150122 ?auto_150120 ) ) ( not ( = ?auto_150123 ?auto_150125 ) ) ( not ( = ?auto_150123 ?auto_150121 ) ) ( not ( = ?auto_150123 ?auto_150120 ) ) ( not ( = ?auto_150117 ?auto_150124 ) ) ( not ( = ?auto_150117 ?auto_150122 ) ) ( not ( = ?auto_150117 ?auto_150123 ) ) ( not ( = ?auto_150118 ?auto_150124 ) ) ( not ( = ?auto_150118 ?auto_150122 ) ) ( not ( = ?auto_150118 ?auto_150123 ) ) ( not ( = ?auto_150119 ?auto_150124 ) ) ( not ( = ?auto_150119 ?auto_150122 ) ) ( not ( = ?auto_150119 ?auto_150123 ) ) ( HOLDING ?auto_150119 ) ( CLEAR ?auto_150118 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_150117 ?auto_150118 ?auto_150119 )
      ( MAKE-5PILE ?auto_150117 ?auto_150118 ?auto_150119 ?auto_150120 ?auto_150121 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_150126 - BLOCK
      ?auto_150127 - BLOCK
      ?auto_150128 - BLOCK
      ?auto_150129 - BLOCK
      ?auto_150130 - BLOCK
    )
    :vars
    (
      ?auto_150134 - BLOCK
      ?auto_150132 - BLOCK
      ?auto_150133 - BLOCK
      ?auto_150131 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150126 ) ( ON ?auto_150127 ?auto_150126 ) ( not ( = ?auto_150126 ?auto_150127 ) ) ( not ( = ?auto_150126 ?auto_150128 ) ) ( not ( = ?auto_150126 ?auto_150129 ) ) ( not ( = ?auto_150126 ?auto_150130 ) ) ( not ( = ?auto_150127 ?auto_150128 ) ) ( not ( = ?auto_150127 ?auto_150129 ) ) ( not ( = ?auto_150127 ?auto_150130 ) ) ( not ( = ?auto_150128 ?auto_150129 ) ) ( not ( = ?auto_150128 ?auto_150130 ) ) ( not ( = ?auto_150129 ?auto_150130 ) ) ( ON ?auto_150130 ?auto_150134 ) ( not ( = ?auto_150126 ?auto_150134 ) ) ( not ( = ?auto_150127 ?auto_150134 ) ) ( not ( = ?auto_150128 ?auto_150134 ) ) ( not ( = ?auto_150129 ?auto_150134 ) ) ( not ( = ?auto_150130 ?auto_150134 ) ) ( ON ?auto_150129 ?auto_150130 ) ( ON-TABLE ?auto_150132 ) ( ON ?auto_150133 ?auto_150132 ) ( ON ?auto_150131 ?auto_150133 ) ( ON ?auto_150134 ?auto_150131 ) ( not ( = ?auto_150132 ?auto_150133 ) ) ( not ( = ?auto_150132 ?auto_150131 ) ) ( not ( = ?auto_150132 ?auto_150134 ) ) ( not ( = ?auto_150132 ?auto_150130 ) ) ( not ( = ?auto_150132 ?auto_150129 ) ) ( not ( = ?auto_150133 ?auto_150131 ) ) ( not ( = ?auto_150133 ?auto_150134 ) ) ( not ( = ?auto_150133 ?auto_150130 ) ) ( not ( = ?auto_150133 ?auto_150129 ) ) ( not ( = ?auto_150131 ?auto_150134 ) ) ( not ( = ?auto_150131 ?auto_150130 ) ) ( not ( = ?auto_150131 ?auto_150129 ) ) ( not ( = ?auto_150126 ?auto_150132 ) ) ( not ( = ?auto_150126 ?auto_150133 ) ) ( not ( = ?auto_150126 ?auto_150131 ) ) ( not ( = ?auto_150127 ?auto_150132 ) ) ( not ( = ?auto_150127 ?auto_150133 ) ) ( not ( = ?auto_150127 ?auto_150131 ) ) ( not ( = ?auto_150128 ?auto_150132 ) ) ( not ( = ?auto_150128 ?auto_150133 ) ) ( not ( = ?auto_150128 ?auto_150131 ) ) ( CLEAR ?auto_150127 ) ( ON ?auto_150128 ?auto_150129 ) ( CLEAR ?auto_150128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_150132 ?auto_150133 ?auto_150131 ?auto_150134 ?auto_150130 ?auto_150129 )
      ( MAKE-5PILE ?auto_150126 ?auto_150127 ?auto_150128 ?auto_150129 ?auto_150130 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_150135 - BLOCK
      ?auto_150136 - BLOCK
      ?auto_150137 - BLOCK
      ?auto_150138 - BLOCK
      ?auto_150139 - BLOCK
    )
    :vars
    (
      ?auto_150142 - BLOCK
      ?auto_150143 - BLOCK
      ?auto_150141 - BLOCK
      ?auto_150140 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150135 ) ( not ( = ?auto_150135 ?auto_150136 ) ) ( not ( = ?auto_150135 ?auto_150137 ) ) ( not ( = ?auto_150135 ?auto_150138 ) ) ( not ( = ?auto_150135 ?auto_150139 ) ) ( not ( = ?auto_150136 ?auto_150137 ) ) ( not ( = ?auto_150136 ?auto_150138 ) ) ( not ( = ?auto_150136 ?auto_150139 ) ) ( not ( = ?auto_150137 ?auto_150138 ) ) ( not ( = ?auto_150137 ?auto_150139 ) ) ( not ( = ?auto_150138 ?auto_150139 ) ) ( ON ?auto_150139 ?auto_150142 ) ( not ( = ?auto_150135 ?auto_150142 ) ) ( not ( = ?auto_150136 ?auto_150142 ) ) ( not ( = ?auto_150137 ?auto_150142 ) ) ( not ( = ?auto_150138 ?auto_150142 ) ) ( not ( = ?auto_150139 ?auto_150142 ) ) ( ON ?auto_150138 ?auto_150139 ) ( ON-TABLE ?auto_150143 ) ( ON ?auto_150141 ?auto_150143 ) ( ON ?auto_150140 ?auto_150141 ) ( ON ?auto_150142 ?auto_150140 ) ( not ( = ?auto_150143 ?auto_150141 ) ) ( not ( = ?auto_150143 ?auto_150140 ) ) ( not ( = ?auto_150143 ?auto_150142 ) ) ( not ( = ?auto_150143 ?auto_150139 ) ) ( not ( = ?auto_150143 ?auto_150138 ) ) ( not ( = ?auto_150141 ?auto_150140 ) ) ( not ( = ?auto_150141 ?auto_150142 ) ) ( not ( = ?auto_150141 ?auto_150139 ) ) ( not ( = ?auto_150141 ?auto_150138 ) ) ( not ( = ?auto_150140 ?auto_150142 ) ) ( not ( = ?auto_150140 ?auto_150139 ) ) ( not ( = ?auto_150140 ?auto_150138 ) ) ( not ( = ?auto_150135 ?auto_150143 ) ) ( not ( = ?auto_150135 ?auto_150141 ) ) ( not ( = ?auto_150135 ?auto_150140 ) ) ( not ( = ?auto_150136 ?auto_150143 ) ) ( not ( = ?auto_150136 ?auto_150141 ) ) ( not ( = ?auto_150136 ?auto_150140 ) ) ( not ( = ?auto_150137 ?auto_150143 ) ) ( not ( = ?auto_150137 ?auto_150141 ) ) ( not ( = ?auto_150137 ?auto_150140 ) ) ( ON ?auto_150137 ?auto_150138 ) ( CLEAR ?auto_150137 ) ( HOLDING ?auto_150136 ) ( CLEAR ?auto_150135 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_150135 ?auto_150136 )
      ( MAKE-5PILE ?auto_150135 ?auto_150136 ?auto_150137 ?auto_150138 ?auto_150139 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_150144 - BLOCK
      ?auto_150145 - BLOCK
      ?auto_150146 - BLOCK
      ?auto_150147 - BLOCK
      ?auto_150148 - BLOCK
    )
    :vars
    (
      ?auto_150149 - BLOCK
      ?auto_150150 - BLOCK
      ?auto_150151 - BLOCK
      ?auto_150152 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150144 ) ( not ( = ?auto_150144 ?auto_150145 ) ) ( not ( = ?auto_150144 ?auto_150146 ) ) ( not ( = ?auto_150144 ?auto_150147 ) ) ( not ( = ?auto_150144 ?auto_150148 ) ) ( not ( = ?auto_150145 ?auto_150146 ) ) ( not ( = ?auto_150145 ?auto_150147 ) ) ( not ( = ?auto_150145 ?auto_150148 ) ) ( not ( = ?auto_150146 ?auto_150147 ) ) ( not ( = ?auto_150146 ?auto_150148 ) ) ( not ( = ?auto_150147 ?auto_150148 ) ) ( ON ?auto_150148 ?auto_150149 ) ( not ( = ?auto_150144 ?auto_150149 ) ) ( not ( = ?auto_150145 ?auto_150149 ) ) ( not ( = ?auto_150146 ?auto_150149 ) ) ( not ( = ?auto_150147 ?auto_150149 ) ) ( not ( = ?auto_150148 ?auto_150149 ) ) ( ON ?auto_150147 ?auto_150148 ) ( ON-TABLE ?auto_150150 ) ( ON ?auto_150151 ?auto_150150 ) ( ON ?auto_150152 ?auto_150151 ) ( ON ?auto_150149 ?auto_150152 ) ( not ( = ?auto_150150 ?auto_150151 ) ) ( not ( = ?auto_150150 ?auto_150152 ) ) ( not ( = ?auto_150150 ?auto_150149 ) ) ( not ( = ?auto_150150 ?auto_150148 ) ) ( not ( = ?auto_150150 ?auto_150147 ) ) ( not ( = ?auto_150151 ?auto_150152 ) ) ( not ( = ?auto_150151 ?auto_150149 ) ) ( not ( = ?auto_150151 ?auto_150148 ) ) ( not ( = ?auto_150151 ?auto_150147 ) ) ( not ( = ?auto_150152 ?auto_150149 ) ) ( not ( = ?auto_150152 ?auto_150148 ) ) ( not ( = ?auto_150152 ?auto_150147 ) ) ( not ( = ?auto_150144 ?auto_150150 ) ) ( not ( = ?auto_150144 ?auto_150151 ) ) ( not ( = ?auto_150144 ?auto_150152 ) ) ( not ( = ?auto_150145 ?auto_150150 ) ) ( not ( = ?auto_150145 ?auto_150151 ) ) ( not ( = ?auto_150145 ?auto_150152 ) ) ( not ( = ?auto_150146 ?auto_150150 ) ) ( not ( = ?auto_150146 ?auto_150151 ) ) ( not ( = ?auto_150146 ?auto_150152 ) ) ( ON ?auto_150146 ?auto_150147 ) ( CLEAR ?auto_150144 ) ( ON ?auto_150145 ?auto_150146 ) ( CLEAR ?auto_150145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_150150 ?auto_150151 ?auto_150152 ?auto_150149 ?auto_150148 ?auto_150147 ?auto_150146 )
      ( MAKE-5PILE ?auto_150144 ?auto_150145 ?auto_150146 ?auto_150147 ?auto_150148 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_150153 - BLOCK
      ?auto_150154 - BLOCK
      ?auto_150155 - BLOCK
      ?auto_150156 - BLOCK
      ?auto_150157 - BLOCK
    )
    :vars
    (
      ?auto_150160 - BLOCK
      ?auto_150159 - BLOCK
      ?auto_150161 - BLOCK
      ?auto_150158 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150153 ?auto_150154 ) ) ( not ( = ?auto_150153 ?auto_150155 ) ) ( not ( = ?auto_150153 ?auto_150156 ) ) ( not ( = ?auto_150153 ?auto_150157 ) ) ( not ( = ?auto_150154 ?auto_150155 ) ) ( not ( = ?auto_150154 ?auto_150156 ) ) ( not ( = ?auto_150154 ?auto_150157 ) ) ( not ( = ?auto_150155 ?auto_150156 ) ) ( not ( = ?auto_150155 ?auto_150157 ) ) ( not ( = ?auto_150156 ?auto_150157 ) ) ( ON ?auto_150157 ?auto_150160 ) ( not ( = ?auto_150153 ?auto_150160 ) ) ( not ( = ?auto_150154 ?auto_150160 ) ) ( not ( = ?auto_150155 ?auto_150160 ) ) ( not ( = ?auto_150156 ?auto_150160 ) ) ( not ( = ?auto_150157 ?auto_150160 ) ) ( ON ?auto_150156 ?auto_150157 ) ( ON-TABLE ?auto_150159 ) ( ON ?auto_150161 ?auto_150159 ) ( ON ?auto_150158 ?auto_150161 ) ( ON ?auto_150160 ?auto_150158 ) ( not ( = ?auto_150159 ?auto_150161 ) ) ( not ( = ?auto_150159 ?auto_150158 ) ) ( not ( = ?auto_150159 ?auto_150160 ) ) ( not ( = ?auto_150159 ?auto_150157 ) ) ( not ( = ?auto_150159 ?auto_150156 ) ) ( not ( = ?auto_150161 ?auto_150158 ) ) ( not ( = ?auto_150161 ?auto_150160 ) ) ( not ( = ?auto_150161 ?auto_150157 ) ) ( not ( = ?auto_150161 ?auto_150156 ) ) ( not ( = ?auto_150158 ?auto_150160 ) ) ( not ( = ?auto_150158 ?auto_150157 ) ) ( not ( = ?auto_150158 ?auto_150156 ) ) ( not ( = ?auto_150153 ?auto_150159 ) ) ( not ( = ?auto_150153 ?auto_150161 ) ) ( not ( = ?auto_150153 ?auto_150158 ) ) ( not ( = ?auto_150154 ?auto_150159 ) ) ( not ( = ?auto_150154 ?auto_150161 ) ) ( not ( = ?auto_150154 ?auto_150158 ) ) ( not ( = ?auto_150155 ?auto_150159 ) ) ( not ( = ?auto_150155 ?auto_150161 ) ) ( not ( = ?auto_150155 ?auto_150158 ) ) ( ON ?auto_150155 ?auto_150156 ) ( ON ?auto_150154 ?auto_150155 ) ( CLEAR ?auto_150154 ) ( HOLDING ?auto_150153 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_150153 )
      ( MAKE-5PILE ?auto_150153 ?auto_150154 ?auto_150155 ?auto_150156 ?auto_150157 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_150162 - BLOCK
      ?auto_150163 - BLOCK
      ?auto_150164 - BLOCK
      ?auto_150165 - BLOCK
      ?auto_150166 - BLOCK
    )
    :vars
    (
      ?auto_150168 - BLOCK
      ?auto_150170 - BLOCK
      ?auto_150169 - BLOCK
      ?auto_150167 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150162 ?auto_150163 ) ) ( not ( = ?auto_150162 ?auto_150164 ) ) ( not ( = ?auto_150162 ?auto_150165 ) ) ( not ( = ?auto_150162 ?auto_150166 ) ) ( not ( = ?auto_150163 ?auto_150164 ) ) ( not ( = ?auto_150163 ?auto_150165 ) ) ( not ( = ?auto_150163 ?auto_150166 ) ) ( not ( = ?auto_150164 ?auto_150165 ) ) ( not ( = ?auto_150164 ?auto_150166 ) ) ( not ( = ?auto_150165 ?auto_150166 ) ) ( ON ?auto_150166 ?auto_150168 ) ( not ( = ?auto_150162 ?auto_150168 ) ) ( not ( = ?auto_150163 ?auto_150168 ) ) ( not ( = ?auto_150164 ?auto_150168 ) ) ( not ( = ?auto_150165 ?auto_150168 ) ) ( not ( = ?auto_150166 ?auto_150168 ) ) ( ON ?auto_150165 ?auto_150166 ) ( ON-TABLE ?auto_150170 ) ( ON ?auto_150169 ?auto_150170 ) ( ON ?auto_150167 ?auto_150169 ) ( ON ?auto_150168 ?auto_150167 ) ( not ( = ?auto_150170 ?auto_150169 ) ) ( not ( = ?auto_150170 ?auto_150167 ) ) ( not ( = ?auto_150170 ?auto_150168 ) ) ( not ( = ?auto_150170 ?auto_150166 ) ) ( not ( = ?auto_150170 ?auto_150165 ) ) ( not ( = ?auto_150169 ?auto_150167 ) ) ( not ( = ?auto_150169 ?auto_150168 ) ) ( not ( = ?auto_150169 ?auto_150166 ) ) ( not ( = ?auto_150169 ?auto_150165 ) ) ( not ( = ?auto_150167 ?auto_150168 ) ) ( not ( = ?auto_150167 ?auto_150166 ) ) ( not ( = ?auto_150167 ?auto_150165 ) ) ( not ( = ?auto_150162 ?auto_150170 ) ) ( not ( = ?auto_150162 ?auto_150169 ) ) ( not ( = ?auto_150162 ?auto_150167 ) ) ( not ( = ?auto_150163 ?auto_150170 ) ) ( not ( = ?auto_150163 ?auto_150169 ) ) ( not ( = ?auto_150163 ?auto_150167 ) ) ( not ( = ?auto_150164 ?auto_150170 ) ) ( not ( = ?auto_150164 ?auto_150169 ) ) ( not ( = ?auto_150164 ?auto_150167 ) ) ( ON ?auto_150164 ?auto_150165 ) ( ON ?auto_150163 ?auto_150164 ) ( ON ?auto_150162 ?auto_150163 ) ( CLEAR ?auto_150162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_150170 ?auto_150169 ?auto_150167 ?auto_150168 ?auto_150166 ?auto_150165 ?auto_150164 ?auto_150163 )
      ( MAKE-5PILE ?auto_150162 ?auto_150163 ?auto_150164 ?auto_150165 ?auto_150166 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_150174 - BLOCK
      ?auto_150175 - BLOCK
      ?auto_150176 - BLOCK
    )
    :vars
    (
      ?auto_150177 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150177 ?auto_150176 ) ( CLEAR ?auto_150177 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_150174 ) ( ON ?auto_150175 ?auto_150174 ) ( ON ?auto_150176 ?auto_150175 ) ( not ( = ?auto_150174 ?auto_150175 ) ) ( not ( = ?auto_150174 ?auto_150176 ) ) ( not ( = ?auto_150174 ?auto_150177 ) ) ( not ( = ?auto_150175 ?auto_150176 ) ) ( not ( = ?auto_150175 ?auto_150177 ) ) ( not ( = ?auto_150176 ?auto_150177 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_150177 ?auto_150176 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_150178 - BLOCK
      ?auto_150179 - BLOCK
      ?auto_150180 - BLOCK
    )
    :vars
    (
      ?auto_150181 - BLOCK
      ?auto_150182 - BLOCK
      ?auto_150183 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150181 ?auto_150180 ) ( CLEAR ?auto_150181 ) ( ON-TABLE ?auto_150178 ) ( ON ?auto_150179 ?auto_150178 ) ( ON ?auto_150180 ?auto_150179 ) ( not ( = ?auto_150178 ?auto_150179 ) ) ( not ( = ?auto_150178 ?auto_150180 ) ) ( not ( = ?auto_150178 ?auto_150181 ) ) ( not ( = ?auto_150179 ?auto_150180 ) ) ( not ( = ?auto_150179 ?auto_150181 ) ) ( not ( = ?auto_150180 ?auto_150181 ) ) ( HOLDING ?auto_150182 ) ( CLEAR ?auto_150183 ) ( not ( = ?auto_150178 ?auto_150182 ) ) ( not ( = ?auto_150178 ?auto_150183 ) ) ( not ( = ?auto_150179 ?auto_150182 ) ) ( not ( = ?auto_150179 ?auto_150183 ) ) ( not ( = ?auto_150180 ?auto_150182 ) ) ( not ( = ?auto_150180 ?auto_150183 ) ) ( not ( = ?auto_150181 ?auto_150182 ) ) ( not ( = ?auto_150181 ?auto_150183 ) ) ( not ( = ?auto_150182 ?auto_150183 ) ) )
    :subtasks
    ( ( !STACK ?auto_150182 ?auto_150183 )
      ( MAKE-3PILE ?auto_150178 ?auto_150179 ?auto_150180 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_150184 - BLOCK
      ?auto_150185 - BLOCK
      ?auto_150186 - BLOCK
    )
    :vars
    (
      ?auto_150187 - BLOCK
      ?auto_150189 - BLOCK
      ?auto_150188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150187 ?auto_150186 ) ( ON-TABLE ?auto_150184 ) ( ON ?auto_150185 ?auto_150184 ) ( ON ?auto_150186 ?auto_150185 ) ( not ( = ?auto_150184 ?auto_150185 ) ) ( not ( = ?auto_150184 ?auto_150186 ) ) ( not ( = ?auto_150184 ?auto_150187 ) ) ( not ( = ?auto_150185 ?auto_150186 ) ) ( not ( = ?auto_150185 ?auto_150187 ) ) ( not ( = ?auto_150186 ?auto_150187 ) ) ( CLEAR ?auto_150189 ) ( not ( = ?auto_150184 ?auto_150188 ) ) ( not ( = ?auto_150184 ?auto_150189 ) ) ( not ( = ?auto_150185 ?auto_150188 ) ) ( not ( = ?auto_150185 ?auto_150189 ) ) ( not ( = ?auto_150186 ?auto_150188 ) ) ( not ( = ?auto_150186 ?auto_150189 ) ) ( not ( = ?auto_150187 ?auto_150188 ) ) ( not ( = ?auto_150187 ?auto_150189 ) ) ( not ( = ?auto_150188 ?auto_150189 ) ) ( ON ?auto_150188 ?auto_150187 ) ( CLEAR ?auto_150188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_150184 ?auto_150185 ?auto_150186 ?auto_150187 )
      ( MAKE-3PILE ?auto_150184 ?auto_150185 ?auto_150186 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_150190 - BLOCK
      ?auto_150191 - BLOCK
      ?auto_150192 - BLOCK
    )
    :vars
    (
      ?auto_150195 - BLOCK
      ?auto_150194 - BLOCK
      ?auto_150193 - BLOCK
      ?auto_150196 - BLOCK
      ?auto_150197 - BLOCK
      ?auto_150198 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150195 ?auto_150192 ) ( ON-TABLE ?auto_150190 ) ( ON ?auto_150191 ?auto_150190 ) ( ON ?auto_150192 ?auto_150191 ) ( not ( = ?auto_150190 ?auto_150191 ) ) ( not ( = ?auto_150190 ?auto_150192 ) ) ( not ( = ?auto_150190 ?auto_150195 ) ) ( not ( = ?auto_150191 ?auto_150192 ) ) ( not ( = ?auto_150191 ?auto_150195 ) ) ( not ( = ?auto_150192 ?auto_150195 ) ) ( not ( = ?auto_150190 ?auto_150194 ) ) ( not ( = ?auto_150190 ?auto_150193 ) ) ( not ( = ?auto_150191 ?auto_150194 ) ) ( not ( = ?auto_150191 ?auto_150193 ) ) ( not ( = ?auto_150192 ?auto_150194 ) ) ( not ( = ?auto_150192 ?auto_150193 ) ) ( not ( = ?auto_150195 ?auto_150194 ) ) ( not ( = ?auto_150195 ?auto_150193 ) ) ( not ( = ?auto_150194 ?auto_150193 ) ) ( ON ?auto_150194 ?auto_150195 ) ( CLEAR ?auto_150194 ) ( HOLDING ?auto_150193 ) ( CLEAR ?auto_150196 ) ( ON-TABLE ?auto_150197 ) ( ON ?auto_150198 ?auto_150197 ) ( ON ?auto_150196 ?auto_150198 ) ( not ( = ?auto_150197 ?auto_150198 ) ) ( not ( = ?auto_150197 ?auto_150196 ) ) ( not ( = ?auto_150197 ?auto_150193 ) ) ( not ( = ?auto_150198 ?auto_150196 ) ) ( not ( = ?auto_150198 ?auto_150193 ) ) ( not ( = ?auto_150196 ?auto_150193 ) ) ( not ( = ?auto_150190 ?auto_150196 ) ) ( not ( = ?auto_150190 ?auto_150197 ) ) ( not ( = ?auto_150190 ?auto_150198 ) ) ( not ( = ?auto_150191 ?auto_150196 ) ) ( not ( = ?auto_150191 ?auto_150197 ) ) ( not ( = ?auto_150191 ?auto_150198 ) ) ( not ( = ?auto_150192 ?auto_150196 ) ) ( not ( = ?auto_150192 ?auto_150197 ) ) ( not ( = ?auto_150192 ?auto_150198 ) ) ( not ( = ?auto_150195 ?auto_150196 ) ) ( not ( = ?auto_150195 ?auto_150197 ) ) ( not ( = ?auto_150195 ?auto_150198 ) ) ( not ( = ?auto_150194 ?auto_150196 ) ) ( not ( = ?auto_150194 ?auto_150197 ) ) ( not ( = ?auto_150194 ?auto_150198 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_150197 ?auto_150198 ?auto_150196 ?auto_150193 )
      ( MAKE-3PILE ?auto_150190 ?auto_150191 ?auto_150192 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_150199 - BLOCK
      ?auto_150200 - BLOCK
      ?auto_150201 - BLOCK
    )
    :vars
    (
      ?auto_150203 - BLOCK
      ?auto_150202 - BLOCK
      ?auto_150207 - BLOCK
      ?auto_150206 - BLOCK
      ?auto_150204 - BLOCK
      ?auto_150205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150203 ?auto_150201 ) ( ON-TABLE ?auto_150199 ) ( ON ?auto_150200 ?auto_150199 ) ( ON ?auto_150201 ?auto_150200 ) ( not ( = ?auto_150199 ?auto_150200 ) ) ( not ( = ?auto_150199 ?auto_150201 ) ) ( not ( = ?auto_150199 ?auto_150203 ) ) ( not ( = ?auto_150200 ?auto_150201 ) ) ( not ( = ?auto_150200 ?auto_150203 ) ) ( not ( = ?auto_150201 ?auto_150203 ) ) ( not ( = ?auto_150199 ?auto_150202 ) ) ( not ( = ?auto_150199 ?auto_150207 ) ) ( not ( = ?auto_150200 ?auto_150202 ) ) ( not ( = ?auto_150200 ?auto_150207 ) ) ( not ( = ?auto_150201 ?auto_150202 ) ) ( not ( = ?auto_150201 ?auto_150207 ) ) ( not ( = ?auto_150203 ?auto_150202 ) ) ( not ( = ?auto_150203 ?auto_150207 ) ) ( not ( = ?auto_150202 ?auto_150207 ) ) ( ON ?auto_150202 ?auto_150203 ) ( CLEAR ?auto_150206 ) ( ON-TABLE ?auto_150204 ) ( ON ?auto_150205 ?auto_150204 ) ( ON ?auto_150206 ?auto_150205 ) ( not ( = ?auto_150204 ?auto_150205 ) ) ( not ( = ?auto_150204 ?auto_150206 ) ) ( not ( = ?auto_150204 ?auto_150207 ) ) ( not ( = ?auto_150205 ?auto_150206 ) ) ( not ( = ?auto_150205 ?auto_150207 ) ) ( not ( = ?auto_150206 ?auto_150207 ) ) ( not ( = ?auto_150199 ?auto_150206 ) ) ( not ( = ?auto_150199 ?auto_150204 ) ) ( not ( = ?auto_150199 ?auto_150205 ) ) ( not ( = ?auto_150200 ?auto_150206 ) ) ( not ( = ?auto_150200 ?auto_150204 ) ) ( not ( = ?auto_150200 ?auto_150205 ) ) ( not ( = ?auto_150201 ?auto_150206 ) ) ( not ( = ?auto_150201 ?auto_150204 ) ) ( not ( = ?auto_150201 ?auto_150205 ) ) ( not ( = ?auto_150203 ?auto_150206 ) ) ( not ( = ?auto_150203 ?auto_150204 ) ) ( not ( = ?auto_150203 ?auto_150205 ) ) ( not ( = ?auto_150202 ?auto_150206 ) ) ( not ( = ?auto_150202 ?auto_150204 ) ) ( not ( = ?auto_150202 ?auto_150205 ) ) ( ON ?auto_150207 ?auto_150202 ) ( CLEAR ?auto_150207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_150199 ?auto_150200 ?auto_150201 ?auto_150203 ?auto_150202 )
      ( MAKE-3PILE ?auto_150199 ?auto_150200 ?auto_150201 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_150208 - BLOCK
      ?auto_150209 - BLOCK
      ?auto_150210 - BLOCK
    )
    :vars
    (
      ?auto_150215 - BLOCK
      ?auto_150211 - BLOCK
      ?auto_150212 - BLOCK
      ?auto_150216 - BLOCK
      ?auto_150213 - BLOCK
      ?auto_150214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150215 ?auto_150210 ) ( ON-TABLE ?auto_150208 ) ( ON ?auto_150209 ?auto_150208 ) ( ON ?auto_150210 ?auto_150209 ) ( not ( = ?auto_150208 ?auto_150209 ) ) ( not ( = ?auto_150208 ?auto_150210 ) ) ( not ( = ?auto_150208 ?auto_150215 ) ) ( not ( = ?auto_150209 ?auto_150210 ) ) ( not ( = ?auto_150209 ?auto_150215 ) ) ( not ( = ?auto_150210 ?auto_150215 ) ) ( not ( = ?auto_150208 ?auto_150211 ) ) ( not ( = ?auto_150208 ?auto_150212 ) ) ( not ( = ?auto_150209 ?auto_150211 ) ) ( not ( = ?auto_150209 ?auto_150212 ) ) ( not ( = ?auto_150210 ?auto_150211 ) ) ( not ( = ?auto_150210 ?auto_150212 ) ) ( not ( = ?auto_150215 ?auto_150211 ) ) ( not ( = ?auto_150215 ?auto_150212 ) ) ( not ( = ?auto_150211 ?auto_150212 ) ) ( ON ?auto_150211 ?auto_150215 ) ( ON-TABLE ?auto_150216 ) ( ON ?auto_150213 ?auto_150216 ) ( not ( = ?auto_150216 ?auto_150213 ) ) ( not ( = ?auto_150216 ?auto_150214 ) ) ( not ( = ?auto_150216 ?auto_150212 ) ) ( not ( = ?auto_150213 ?auto_150214 ) ) ( not ( = ?auto_150213 ?auto_150212 ) ) ( not ( = ?auto_150214 ?auto_150212 ) ) ( not ( = ?auto_150208 ?auto_150214 ) ) ( not ( = ?auto_150208 ?auto_150216 ) ) ( not ( = ?auto_150208 ?auto_150213 ) ) ( not ( = ?auto_150209 ?auto_150214 ) ) ( not ( = ?auto_150209 ?auto_150216 ) ) ( not ( = ?auto_150209 ?auto_150213 ) ) ( not ( = ?auto_150210 ?auto_150214 ) ) ( not ( = ?auto_150210 ?auto_150216 ) ) ( not ( = ?auto_150210 ?auto_150213 ) ) ( not ( = ?auto_150215 ?auto_150214 ) ) ( not ( = ?auto_150215 ?auto_150216 ) ) ( not ( = ?auto_150215 ?auto_150213 ) ) ( not ( = ?auto_150211 ?auto_150214 ) ) ( not ( = ?auto_150211 ?auto_150216 ) ) ( not ( = ?auto_150211 ?auto_150213 ) ) ( ON ?auto_150212 ?auto_150211 ) ( CLEAR ?auto_150212 ) ( HOLDING ?auto_150214 ) ( CLEAR ?auto_150213 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_150216 ?auto_150213 ?auto_150214 )
      ( MAKE-3PILE ?auto_150208 ?auto_150209 ?auto_150210 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_150217 - BLOCK
      ?auto_150218 - BLOCK
      ?auto_150219 - BLOCK
    )
    :vars
    (
      ?auto_150225 - BLOCK
      ?auto_150220 - BLOCK
      ?auto_150224 - BLOCK
      ?auto_150222 - BLOCK
      ?auto_150221 - BLOCK
      ?auto_150223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150225 ?auto_150219 ) ( ON-TABLE ?auto_150217 ) ( ON ?auto_150218 ?auto_150217 ) ( ON ?auto_150219 ?auto_150218 ) ( not ( = ?auto_150217 ?auto_150218 ) ) ( not ( = ?auto_150217 ?auto_150219 ) ) ( not ( = ?auto_150217 ?auto_150225 ) ) ( not ( = ?auto_150218 ?auto_150219 ) ) ( not ( = ?auto_150218 ?auto_150225 ) ) ( not ( = ?auto_150219 ?auto_150225 ) ) ( not ( = ?auto_150217 ?auto_150220 ) ) ( not ( = ?auto_150217 ?auto_150224 ) ) ( not ( = ?auto_150218 ?auto_150220 ) ) ( not ( = ?auto_150218 ?auto_150224 ) ) ( not ( = ?auto_150219 ?auto_150220 ) ) ( not ( = ?auto_150219 ?auto_150224 ) ) ( not ( = ?auto_150225 ?auto_150220 ) ) ( not ( = ?auto_150225 ?auto_150224 ) ) ( not ( = ?auto_150220 ?auto_150224 ) ) ( ON ?auto_150220 ?auto_150225 ) ( ON-TABLE ?auto_150222 ) ( ON ?auto_150221 ?auto_150222 ) ( not ( = ?auto_150222 ?auto_150221 ) ) ( not ( = ?auto_150222 ?auto_150223 ) ) ( not ( = ?auto_150222 ?auto_150224 ) ) ( not ( = ?auto_150221 ?auto_150223 ) ) ( not ( = ?auto_150221 ?auto_150224 ) ) ( not ( = ?auto_150223 ?auto_150224 ) ) ( not ( = ?auto_150217 ?auto_150223 ) ) ( not ( = ?auto_150217 ?auto_150222 ) ) ( not ( = ?auto_150217 ?auto_150221 ) ) ( not ( = ?auto_150218 ?auto_150223 ) ) ( not ( = ?auto_150218 ?auto_150222 ) ) ( not ( = ?auto_150218 ?auto_150221 ) ) ( not ( = ?auto_150219 ?auto_150223 ) ) ( not ( = ?auto_150219 ?auto_150222 ) ) ( not ( = ?auto_150219 ?auto_150221 ) ) ( not ( = ?auto_150225 ?auto_150223 ) ) ( not ( = ?auto_150225 ?auto_150222 ) ) ( not ( = ?auto_150225 ?auto_150221 ) ) ( not ( = ?auto_150220 ?auto_150223 ) ) ( not ( = ?auto_150220 ?auto_150222 ) ) ( not ( = ?auto_150220 ?auto_150221 ) ) ( ON ?auto_150224 ?auto_150220 ) ( CLEAR ?auto_150221 ) ( ON ?auto_150223 ?auto_150224 ) ( CLEAR ?auto_150223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_150217 ?auto_150218 ?auto_150219 ?auto_150225 ?auto_150220 ?auto_150224 )
      ( MAKE-3PILE ?auto_150217 ?auto_150218 ?auto_150219 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_150226 - BLOCK
      ?auto_150227 - BLOCK
      ?auto_150228 - BLOCK
    )
    :vars
    (
      ?auto_150230 - BLOCK
      ?auto_150231 - BLOCK
      ?auto_150233 - BLOCK
      ?auto_150234 - BLOCK
      ?auto_150229 - BLOCK
      ?auto_150232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150230 ?auto_150228 ) ( ON-TABLE ?auto_150226 ) ( ON ?auto_150227 ?auto_150226 ) ( ON ?auto_150228 ?auto_150227 ) ( not ( = ?auto_150226 ?auto_150227 ) ) ( not ( = ?auto_150226 ?auto_150228 ) ) ( not ( = ?auto_150226 ?auto_150230 ) ) ( not ( = ?auto_150227 ?auto_150228 ) ) ( not ( = ?auto_150227 ?auto_150230 ) ) ( not ( = ?auto_150228 ?auto_150230 ) ) ( not ( = ?auto_150226 ?auto_150231 ) ) ( not ( = ?auto_150226 ?auto_150233 ) ) ( not ( = ?auto_150227 ?auto_150231 ) ) ( not ( = ?auto_150227 ?auto_150233 ) ) ( not ( = ?auto_150228 ?auto_150231 ) ) ( not ( = ?auto_150228 ?auto_150233 ) ) ( not ( = ?auto_150230 ?auto_150231 ) ) ( not ( = ?auto_150230 ?auto_150233 ) ) ( not ( = ?auto_150231 ?auto_150233 ) ) ( ON ?auto_150231 ?auto_150230 ) ( ON-TABLE ?auto_150234 ) ( not ( = ?auto_150234 ?auto_150229 ) ) ( not ( = ?auto_150234 ?auto_150232 ) ) ( not ( = ?auto_150234 ?auto_150233 ) ) ( not ( = ?auto_150229 ?auto_150232 ) ) ( not ( = ?auto_150229 ?auto_150233 ) ) ( not ( = ?auto_150232 ?auto_150233 ) ) ( not ( = ?auto_150226 ?auto_150232 ) ) ( not ( = ?auto_150226 ?auto_150234 ) ) ( not ( = ?auto_150226 ?auto_150229 ) ) ( not ( = ?auto_150227 ?auto_150232 ) ) ( not ( = ?auto_150227 ?auto_150234 ) ) ( not ( = ?auto_150227 ?auto_150229 ) ) ( not ( = ?auto_150228 ?auto_150232 ) ) ( not ( = ?auto_150228 ?auto_150234 ) ) ( not ( = ?auto_150228 ?auto_150229 ) ) ( not ( = ?auto_150230 ?auto_150232 ) ) ( not ( = ?auto_150230 ?auto_150234 ) ) ( not ( = ?auto_150230 ?auto_150229 ) ) ( not ( = ?auto_150231 ?auto_150232 ) ) ( not ( = ?auto_150231 ?auto_150234 ) ) ( not ( = ?auto_150231 ?auto_150229 ) ) ( ON ?auto_150233 ?auto_150231 ) ( ON ?auto_150232 ?auto_150233 ) ( CLEAR ?auto_150232 ) ( HOLDING ?auto_150229 ) ( CLEAR ?auto_150234 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_150234 ?auto_150229 )
      ( MAKE-3PILE ?auto_150226 ?auto_150227 ?auto_150228 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_150235 - BLOCK
      ?auto_150236 - BLOCK
      ?auto_150237 - BLOCK
    )
    :vars
    (
      ?auto_150238 - BLOCK
      ?auto_150239 - BLOCK
      ?auto_150242 - BLOCK
      ?auto_150243 - BLOCK
      ?auto_150241 - BLOCK
      ?auto_150240 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150238 ?auto_150237 ) ( ON-TABLE ?auto_150235 ) ( ON ?auto_150236 ?auto_150235 ) ( ON ?auto_150237 ?auto_150236 ) ( not ( = ?auto_150235 ?auto_150236 ) ) ( not ( = ?auto_150235 ?auto_150237 ) ) ( not ( = ?auto_150235 ?auto_150238 ) ) ( not ( = ?auto_150236 ?auto_150237 ) ) ( not ( = ?auto_150236 ?auto_150238 ) ) ( not ( = ?auto_150237 ?auto_150238 ) ) ( not ( = ?auto_150235 ?auto_150239 ) ) ( not ( = ?auto_150235 ?auto_150242 ) ) ( not ( = ?auto_150236 ?auto_150239 ) ) ( not ( = ?auto_150236 ?auto_150242 ) ) ( not ( = ?auto_150237 ?auto_150239 ) ) ( not ( = ?auto_150237 ?auto_150242 ) ) ( not ( = ?auto_150238 ?auto_150239 ) ) ( not ( = ?auto_150238 ?auto_150242 ) ) ( not ( = ?auto_150239 ?auto_150242 ) ) ( ON ?auto_150239 ?auto_150238 ) ( ON-TABLE ?auto_150243 ) ( not ( = ?auto_150243 ?auto_150241 ) ) ( not ( = ?auto_150243 ?auto_150240 ) ) ( not ( = ?auto_150243 ?auto_150242 ) ) ( not ( = ?auto_150241 ?auto_150240 ) ) ( not ( = ?auto_150241 ?auto_150242 ) ) ( not ( = ?auto_150240 ?auto_150242 ) ) ( not ( = ?auto_150235 ?auto_150240 ) ) ( not ( = ?auto_150235 ?auto_150243 ) ) ( not ( = ?auto_150235 ?auto_150241 ) ) ( not ( = ?auto_150236 ?auto_150240 ) ) ( not ( = ?auto_150236 ?auto_150243 ) ) ( not ( = ?auto_150236 ?auto_150241 ) ) ( not ( = ?auto_150237 ?auto_150240 ) ) ( not ( = ?auto_150237 ?auto_150243 ) ) ( not ( = ?auto_150237 ?auto_150241 ) ) ( not ( = ?auto_150238 ?auto_150240 ) ) ( not ( = ?auto_150238 ?auto_150243 ) ) ( not ( = ?auto_150238 ?auto_150241 ) ) ( not ( = ?auto_150239 ?auto_150240 ) ) ( not ( = ?auto_150239 ?auto_150243 ) ) ( not ( = ?auto_150239 ?auto_150241 ) ) ( ON ?auto_150242 ?auto_150239 ) ( ON ?auto_150240 ?auto_150242 ) ( CLEAR ?auto_150243 ) ( ON ?auto_150241 ?auto_150240 ) ( CLEAR ?auto_150241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_150235 ?auto_150236 ?auto_150237 ?auto_150238 ?auto_150239 ?auto_150242 ?auto_150240 )
      ( MAKE-3PILE ?auto_150235 ?auto_150236 ?auto_150237 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_150244 - BLOCK
      ?auto_150245 - BLOCK
      ?auto_150246 - BLOCK
    )
    :vars
    (
      ?auto_150251 - BLOCK
      ?auto_150248 - BLOCK
      ?auto_150249 - BLOCK
      ?auto_150252 - BLOCK
      ?auto_150247 - BLOCK
      ?auto_150250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150251 ?auto_150246 ) ( ON-TABLE ?auto_150244 ) ( ON ?auto_150245 ?auto_150244 ) ( ON ?auto_150246 ?auto_150245 ) ( not ( = ?auto_150244 ?auto_150245 ) ) ( not ( = ?auto_150244 ?auto_150246 ) ) ( not ( = ?auto_150244 ?auto_150251 ) ) ( not ( = ?auto_150245 ?auto_150246 ) ) ( not ( = ?auto_150245 ?auto_150251 ) ) ( not ( = ?auto_150246 ?auto_150251 ) ) ( not ( = ?auto_150244 ?auto_150248 ) ) ( not ( = ?auto_150244 ?auto_150249 ) ) ( not ( = ?auto_150245 ?auto_150248 ) ) ( not ( = ?auto_150245 ?auto_150249 ) ) ( not ( = ?auto_150246 ?auto_150248 ) ) ( not ( = ?auto_150246 ?auto_150249 ) ) ( not ( = ?auto_150251 ?auto_150248 ) ) ( not ( = ?auto_150251 ?auto_150249 ) ) ( not ( = ?auto_150248 ?auto_150249 ) ) ( ON ?auto_150248 ?auto_150251 ) ( not ( = ?auto_150252 ?auto_150247 ) ) ( not ( = ?auto_150252 ?auto_150250 ) ) ( not ( = ?auto_150252 ?auto_150249 ) ) ( not ( = ?auto_150247 ?auto_150250 ) ) ( not ( = ?auto_150247 ?auto_150249 ) ) ( not ( = ?auto_150250 ?auto_150249 ) ) ( not ( = ?auto_150244 ?auto_150250 ) ) ( not ( = ?auto_150244 ?auto_150252 ) ) ( not ( = ?auto_150244 ?auto_150247 ) ) ( not ( = ?auto_150245 ?auto_150250 ) ) ( not ( = ?auto_150245 ?auto_150252 ) ) ( not ( = ?auto_150245 ?auto_150247 ) ) ( not ( = ?auto_150246 ?auto_150250 ) ) ( not ( = ?auto_150246 ?auto_150252 ) ) ( not ( = ?auto_150246 ?auto_150247 ) ) ( not ( = ?auto_150251 ?auto_150250 ) ) ( not ( = ?auto_150251 ?auto_150252 ) ) ( not ( = ?auto_150251 ?auto_150247 ) ) ( not ( = ?auto_150248 ?auto_150250 ) ) ( not ( = ?auto_150248 ?auto_150252 ) ) ( not ( = ?auto_150248 ?auto_150247 ) ) ( ON ?auto_150249 ?auto_150248 ) ( ON ?auto_150250 ?auto_150249 ) ( ON ?auto_150247 ?auto_150250 ) ( CLEAR ?auto_150247 ) ( HOLDING ?auto_150252 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_150252 )
      ( MAKE-3PILE ?auto_150244 ?auto_150245 ?auto_150246 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_150253 - BLOCK
      ?auto_150254 - BLOCK
      ?auto_150255 - BLOCK
    )
    :vars
    (
      ?auto_150258 - BLOCK
      ?auto_150259 - BLOCK
      ?auto_150261 - BLOCK
      ?auto_150256 - BLOCK
      ?auto_150257 - BLOCK
      ?auto_150260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150258 ?auto_150255 ) ( ON-TABLE ?auto_150253 ) ( ON ?auto_150254 ?auto_150253 ) ( ON ?auto_150255 ?auto_150254 ) ( not ( = ?auto_150253 ?auto_150254 ) ) ( not ( = ?auto_150253 ?auto_150255 ) ) ( not ( = ?auto_150253 ?auto_150258 ) ) ( not ( = ?auto_150254 ?auto_150255 ) ) ( not ( = ?auto_150254 ?auto_150258 ) ) ( not ( = ?auto_150255 ?auto_150258 ) ) ( not ( = ?auto_150253 ?auto_150259 ) ) ( not ( = ?auto_150253 ?auto_150261 ) ) ( not ( = ?auto_150254 ?auto_150259 ) ) ( not ( = ?auto_150254 ?auto_150261 ) ) ( not ( = ?auto_150255 ?auto_150259 ) ) ( not ( = ?auto_150255 ?auto_150261 ) ) ( not ( = ?auto_150258 ?auto_150259 ) ) ( not ( = ?auto_150258 ?auto_150261 ) ) ( not ( = ?auto_150259 ?auto_150261 ) ) ( ON ?auto_150259 ?auto_150258 ) ( not ( = ?auto_150256 ?auto_150257 ) ) ( not ( = ?auto_150256 ?auto_150260 ) ) ( not ( = ?auto_150256 ?auto_150261 ) ) ( not ( = ?auto_150257 ?auto_150260 ) ) ( not ( = ?auto_150257 ?auto_150261 ) ) ( not ( = ?auto_150260 ?auto_150261 ) ) ( not ( = ?auto_150253 ?auto_150260 ) ) ( not ( = ?auto_150253 ?auto_150256 ) ) ( not ( = ?auto_150253 ?auto_150257 ) ) ( not ( = ?auto_150254 ?auto_150260 ) ) ( not ( = ?auto_150254 ?auto_150256 ) ) ( not ( = ?auto_150254 ?auto_150257 ) ) ( not ( = ?auto_150255 ?auto_150260 ) ) ( not ( = ?auto_150255 ?auto_150256 ) ) ( not ( = ?auto_150255 ?auto_150257 ) ) ( not ( = ?auto_150258 ?auto_150260 ) ) ( not ( = ?auto_150258 ?auto_150256 ) ) ( not ( = ?auto_150258 ?auto_150257 ) ) ( not ( = ?auto_150259 ?auto_150260 ) ) ( not ( = ?auto_150259 ?auto_150256 ) ) ( not ( = ?auto_150259 ?auto_150257 ) ) ( ON ?auto_150261 ?auto_150259 ) ( ON ?auto_150260 ?auto_150261 ) ( ON ?auto_150257 ?auto_150260 ) ( ON ?auto_150256 ?auto_150257 ) ( CLEAR ?auto_150256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_150253 ?auto_150254 ?auto_150255 ?auto_150258 ?auto_150259 ?auto_150261 ?auto_150260 ?auto_150257 )
      ( MAKE-3PILE ?auto_150253 ?auto_150254 ?auto_150255 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_150268 - BLOCK
      ?auto_150269 - BLOCK
      ?auto_150270 - BLOCK
      ?auto_150271 - BLOCK
      ?auto_150272 - BLOCK
      ?auto_150273 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_150273 ) ( CLEAR ?auto_150272 ) ( ON-TABLE ?auto_150268 ) ( ON ?auto_150269 ?auto_150268 ) ( ON ?auto_150270 ?auto_150269 ) ( ON ?auto_150271 ?auto_150270 ) ( ON ?auto_150272 ?auto_150271 ) ( not ( = ?auto_150268 ?auto_150269 ) ) ( not ( = ?auto_150268 ?auto_150270 ) ) ( not ( = ?auto_150268 ?auto_150271 ) ) ( not ( = ?auto_150268 ?auto_150272 ) ) ( not ( = ?auto_150268 ?auto_150273 ) ) ( not ( = ?auto_150269 ?auto_150270 ) ) ( not ( = ?auto_150269 ?auto_150271 ) ) ( not ( = ?auto_150269 ?auto_150272 ) ) ( not ( = ?auto_150269 ?auto_150273 ) ) ( not ( = ?auto_150270 ?auto_150271 ) ) ( not ( = ?auto_150270 ?auto_150272 ) ) ( not ( = ?auto_150270 ?auto_150273 ) ) ( not ( = ?auto_150271 ?auto_150272 ) ) ( not ( = ?auto_150271 ?auto_150273 ) ) ( not ( = ?auto_150272 ?auto_150273 ) ) )
    :subtasks
    ( ( !STACK ?auto_150273 ?auto_150272 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_150274 - BLOCK
      ?auto_150275 - BLOCK
      ?auto_150276 - BLOCK
      ?auto_150277 - BLOCK
      ?auto_150278 - BLOCK
      ?auto_150279 - BLOCK
    )
    :vars
    (
      ?auto_150280 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_150278 ) ( ON-TABLE ?auto_150274 ) ( ON ?auto_150275 ?auto_150274 ) ( ON ?auto_150276 ?auto_150275 ) ( ON ?auto_150277 ?auto_150276 ) ( ON ?auto_150278 ?auto_150277 ) ( not ( = ?auto_150274 ?auto_150275 ) ) ( not ( = ?auto_150274 ?auto_150276 ) ) ( not ( = ?auto_150274 ?auto_150277 ) ) ( not ( = ?auto_150274 ?auto_150278 ) ) ( not ( = ?auto_150274 ?auto_150279 ) ) ( not ( = ?auto_150275 ?auto_150276 ) ) ( not ( = ?auto_150275 ?auto_150277 ) ) ( not ( = ?auto_150275 ?auto_150278 ) ) ( not ( = ?auto_150275 ?auto_150279 ) ) ( not ( = ?auto_150276 ?auto_150277 ) ) ( not ( = ?auto_150276 ?auto_150278 ) ) ( not ( = ?auto_150276 ?auto_150279 ) ) ( not ( = ?auto_150277 ?auto_150278 ) ) ( not ( = ?auto_150277 ?auto_150279 ) ) ( not ( = ?auto_150278 ?auto_150279 ) ) ( ON ?auto_150279 ?auto_150280 ) ( CLEAR ?auto_150279 ) ( HAND-EMPTY ) ( not ( = ?auto_150274 ?auto_150280 ) ) ( not ( = ?auto_150275 ?auto_150280 ) ) ( not ( = ?auto_150276 ?auto_150280 ) ) ( not ( = ?auto_150277 ?auto_150280 ) ) ( not ( = ?auto_150278 ?auto_150280 ) ) ( not ( = ?auto_150279 ?auto_150280 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_150279 ?auto_150280 )
      ( MAKE-6PILE ?auto_150274 ?auto_150275 ?auto_150276 ?auto_150277 ?auto_150278 ?auto_150279 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_150281 - BLOCK
      ?auto_150282 - BLOCK
      ?auto_150283 - BLOCK
      ?auto_150284 - BLOCK
      ?auto_150285 - BLOCK
      ?auto_150286 - BLOCK
    )
    :vars
    (
      ?auto_150287 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150281 ) ( ON ?auto_150282 ?auto_150281 ) ( ON ?auto_150283 ?auto_150282 ) ( ON ?auto_150284 ?auto_150283 ) ( not ( = ?auto_150281 ?auto_150282 ) ) ( not ( = ?auto_150281 ?auto_150283 ) ) ( not ( = ?auto_150281 ?auto_150284 ) ) ( not ( = ?auto_150281 ?auto_150285 ) ) ( not ( = ?auto_150281 ?auto_150286 ) ) ( not ( = ?auto_150282 ?auto_150283 ) ) ( not ( = ?auto_150282 ?auto_150284 ) ) ( not ( = ?auto_150282 ?auto_150285 ) ) ( not ( = ?auto_150282 ?auto_150286 ) ) ( not ( = ?auto_150283 ?auto_150284 ) ) ( not ( = ?auto_150283 ?auto_150285 ) ) ( not ( = ?auto_150283 ?auto_150286 ) ) ( not ( = ?auto_150284 ?auto_150285 ) ) ( not ( = ?auto_150284 ?auto_150286 ) ) ( not ( = ?auto_150285 ?auto_150286 ) ) ( ON ?auto_150286 ?auto_150287 ) ( CLEAR ?auto_150286 ) ( not ( = ?auto_150281 ?auto_150287 ) ) ( not ( = ?auto_150282 ?auto_150287 ) ) ( not ( = ?auto_150283 ?auto_150287 ) ) ( not ( = ?auto_150284 ?auto_150287 ) ) ( not ( = ?auto_150285 ?auto_150287 ) ) ( not ( = ?auto_150286 ?auto_150287 ) ) ( HOLDING ?auto_150285 ) ( CLEAR ?auto_150284 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_150281 ?auto_150282 ?auto_150283 ?auto_150284 ?auto_150285 )
      ( MAKE-6PILE ?auto_150281 ?auto_150282 ?auto_150283 ?auto_150284 ?auto_150285 ?auto_150286 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_150288 - BLOCK
      ?auto_150289 - BLOCK
      ?auto_150290 - BLOCK
      ?auto_150291 - BLOCK
      ?auto_150292 - BLOCK
      ?auto_150293 - BLOCK
    )
    :vars
    (
      ?auto_150294 - BLOCK
      ?auto_150295 - BLOCK
      ?auto_150296 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150288 ) ( ON ?auto_150289 ?auto_150288 ) ( ON ?auto_150290 ?auto_150289 ) ( ON ?auto_150291 ?auto_150290 ) ( not ( = ?auto_150288 ?auto_150289 ) ) ( not ( = ?auto_150288 ?auto_150290 ) ) ( not ( = ?auto_150288 ?auto_150291 ) ) ( not ( = ?auto_150288 ?auto_150292 ) ) ( not ( = ?auto_150288 ?auto_150293 ) ) ( not ( = ?auto_150289 ?auto_150290 ) ) ( not ( = ?auto_150289 ?auto_150291 ) ) ( not ( = ?auto_150289 ?auto_150292 ) ) ( not ( = ?auto_150289 ?auto_150293 ) ) ( not ( = ?auto_150290 ?auto_150291 ) ) ( not ( = ?auto_150290 ?auto_150292 ) ) ( not ( = ?auto_150290 ?auto_150293 ) ) ( not ( = ?auto_150291 ?auto_150292 ) ) ( not ( = ?auto_150291 ?auto_150293 ) ) ( not ( = ?auto_150292 ?auto_150293 ) ) ( ON ?auto_150293 ?auto_150294 ) ( not ( = ?auto_150288 ?auto_150294 ) ) ( not ( = ?auto_150289 ?auto_150294 ) ) ( not ( = ?auto_150290 ?auto_150294 ) ) ( not ( = ?auto_150291 ?auto_150294 ) ) ( not ( = ?auto_150292 ?auto_150294 ) ) ( not ( = ?auto_150293 ?auto_150294 ) ) ( CLEAR ?auto_150291 ) ( ON ?auto_150292 ?auto_150293 ) ( CLEAR ?auto_150292 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_150295 ) ( ON ?auto_150296 ?auto_150295 ) ( ON ?auto_150294 ?auto_150296 ) ( not ( = ?auto_150295 ?auto_150296 ) ) ( not ( = ?auto_150295 ?auto_150294 ) ) ( not ( = ?auto_150295 ?auto_150293 ) ) ( not ( = ?auto_150295 ?auto_150292 ) ) ( not ( = ?auto_150296 ?auto_150294 ) ) ( not ( = ?auto_150296 ?auto_150293 ) ) ( not ( = ?auto_150296 ?auto_150292 ) ) ( not ( = ?auto_150288 ?auto_150295 ) ) ( not ( = ?auto_150288 ?auto_150296 ) ) ( not ( = ?auto_150289 ?auto_150295 ) ) ( not ( = ?auto_150289 ?auto_150296 ) ) ( not ( = ?auto_150290 ?auto_150295 ) ) ( not ( = ?auto_150290 ?auto_150296 ) ) ( not ( = ?auto_150291 ?auto_150295 ) ) ( not ( = ?auto_150291 ?auto_150296 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_150295 ?auto_150296 ?auto_150294 ?auto_150293 )
      ( MAKE-6PILE ?auto_150288 ?auto_150289 ?auto_150290 ?auto_150291 ?auto_150292 ?auto_150293 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_150297 - BLOCK
      ?auto_150298 - BLOCK
      ?auto_150299 - BLOCK
      ?auto_150300 - BLOCK
      ?auto_150301 - BLOCK
      ?auto_150302 - BLOCK
    )
    :vars
    (
      ?auto_150304 - BLOCK
      ?auto_150305 - BLOCK
      ?auto_150303 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150297 ) ( ON ?auto_150298 ?auto_150297 ) ( ON ?auto_150299 ?auto_150298 ) ( not ( = ?auto_150297 ?auto_150298 ) ) ( not ( = ?auto_150297 ?auto_150299 ) ) ( not ( = ?auto_150297 ?auto_150300 ) ) ( not ( = ?auto_150297 ?auto_150301 ) ) ( not ( = ?auto_150297 ?auto_150302 ) ) ( not ( = ?auto_150298 ?auto_150299 ) ) ( not ( = ?auto_150298 ?auto_150300 ) ) ( not ( = ?auto_150298 ?auto_150301 ) ) ( not ( = ?auto_150298 ?auto_150302 ) ) ( not ( = ?auto_150299 ?auto_150300 ) ) ( not ( = ?auto_150299 ?auto_150301 ) ) ( not ( = ?auto_150299 ?auto_150302 ) ) ( not ( = ?auto_150300 ?auto_150301 ) ) ( not ( = ?auto_150300 ?auto_150302 ) ) ( not ( = ?auto_150301 ?auto_150302 ) ) ( ON ?auto_150302 ?auto_150304 ) ( not ( = ?auto_150297 ?auto_150304 ) ) ( not ( = ?auto_150298 ?auto_150304 ) ) ( not ( = ?auto_150299 ?auto_150304 ) ) ( not ( = ?auto_150300 ?auto_150304 ) ) ( not ( = ?auto_150301 ?auto_150304 ) ) ( not ( = ?auto_150302 ?auto_150304 ) ) ( ON ?auto_150301 ?auto_150302 ) ( CLEAR ?auto_150301 ) ( ON-TABLE ?auto_150305 ) ( ON ?auto_150303 ?auto_150305 ) ( ON ?auto_150304 ?auto_150303 ) ( not ( = ?auto_150305 ?auto_150303 ) ) ( not ( = ?auto_150305 ?auto_150304 ) ) ( not ( = ?auto_150305 ?auto_150302 ) ) ( not ( = ?auto_150305 ?auto_150301 ) ) ( not ( = ?auto_150303 ?auto_150304 ) ) ( not ( = ?auto_150303 ?auto_150302 ) ) ( not ( = ?auto_150303 ?auto_150301 ) ) ( not ( = ?auto_150297 ?auto_150305 ) ) ( not ( = ?auto_150297 ?auto_150303 ) ) ( not ( = ?auto_150298 ?auto_150305 ) ) ( not ( = ?auto_150298 ?auto_150303 ) ) ( not ( = ?auto_150299 ?auto_150305 ) ) ( not ( = ?auto_150299 ?auto_150303 ) ) ( not ( = ?auto_150300 ?auto_150305 ) ) ( not ( = ?auto_150300 ?auto_150303 ) ) ( HOLDING ?auto_150300 ) ( CLEAR ?auto_150299 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_150297 ?auto_150298 ?auto_150299 ?auto_150300 )
      ( MAKE-6PILE ?auto_150297 ?auto_150298 ?auto_150299 ?auto_150300 ?auto_150301 ?auto_150302 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_150306 - BLOCK
      ?auto_150307 - BLOCK
      ?auto_150308 - BLOCK
      ?auto_150309 - BLOCK
      ?auto_150310 - BLOCK
      ?auto_150311 - BLOCK
    )
    :vars
    (
      ?auto_150313 - BLOCK
      ?auto_150312 - BLOCK
      ?auto_150314 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150306 ) ( ON ?auto_150307 ?auto_150306 ) ( ON ?auto_150308 ?auto_150307 ) ( not ( = ?auto_150306 ?auto_150307 ) ) ( not ( = ?auto_150306 ?auto_150308 ) ) ( not ( = ?auto_150306 ?auto_150309 ) ) ( not ( = ?auto_150306 ?auto_150310 ) ) ( not ( = ?auto_150306 ?auto_150311 ) ) ( not ( = ?auto_150307 ?auto_150308 ) ) ( not ( = ?auto_150307 ?auto_150309 ) ) ( not ( = ?auto_150307 ?auto_150310 ) ) ( not ( = ?auto_150307 ?auto_150311 ) ) ( not ( = ?auto_150308 ?auto_150309 ) ) ( not ( = ?auto_150308 ?auto_150310 ) ) ( not ( = ?auto_150308 ?auto_150311 ) ) ( not ( = ?auto_150309 ?auto_150310 ) ) ( not ( = ?auto_150309 ?auto_150311 ) ) ( not ( = ?auto_150310 ?auto_150311 ) ) ( ON ?auto_150311 ?auto_150313 ) ( not ( = ?auto_150306 ?auto_150313 ) ) ( not ( = ?auto_150307 ?auto_150313 ) ) ( not ( = ?auto_150308 ?auto_150313 ) ) ( not ( = ?auto_150309 ?auto_150313 ) ) ( not ( = ?auto_150310 ?auto_150313 ) ) ( not ( = ?auto_150311 ?auto_150313 ) ) ( ON ?auto_150310 ?auto_150311 ) ( ON-TABLE ?auto_150312 ) ( ON ?auto_150314 ?auto_150312 ) ( ON ?auto_150313 ?auto_150314 ) ( not ( = ?auto_150312 ?auto_150314 ) ) ( not ( = ?auto_150312 ?auto_150313 ) ) ( not ( = ?auto_150312 ?auto_150311 ) ) ( not ( = ?auto_150312 ?auto_150310 ) ) ( not ( = ?auto_150314 ?auto_150313 ) ) ( not ( = ?auto_150314 ?auto_150311 ) ) ( not ( = ?auto_150314 ?auto_150310 ) ) ( not ( = ?auto_150306 ?auto_150312 ) ) ( not ( = ?auto_150306 ?auto_150314 ) ) ( not ( = ?auto_150307 ?auto_150312 ) ) ( not ( = ?auto_150307 ?auto_150314 ) ) ( not ( = ?auto_150308 ?auto_150312 ) ) ( not ( = ?auto_150308 ?auto_150314 ) ) ( not ( = ?auto_150309 ?auto_150312 ) ) ( not ( = ?auto_150309 ?auto_150314 ) ) ( CLEAR ?auto_150308 ) ( ON ?auto_150309 ?auto_150310 ) ( CLEAR ?auto_150309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_150312 ?auto_150314 ?auto_150313 ?auto_150311 ?auto_150310 )
      ( MAKE-6PILE ?auto_150306 ?auto_150307 ?auto_150308 ?auto_150309 ?auto_150310 ?auto_150311 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_150315 - BLOCK
      ?auto_150316 - BLOCK
      ?auto_150317 - BLOCK
      ?auto_150318 - BLOCK
      ?auto_150319 - BLOCK
      ?auto_150320 - BLOCK
    )
    :vars
    (
      ?auto_150322 - BLOCK
      ?auto_150321 - BLOCK
      ?auto_150323 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150315 ) ( ON ?auto_150316 ?auto_150315 ) ( not ( = ?auto_150315 ?auto_150316 ) ) ( not ( = ?auto_150315 ?auto_150317 ) ) ( not ( = ?auto_150315 ?auto_150318 ) ) ( not ( = ?auto_150315 ?auto_150319 ) ) ( not ( = ?auto_150315 ?auto_150320 ) ) ( not ( = ?auto_150316 ?auto_150317 ) ) ( not ( = ?auto_150316 ?auto_150318 ) ) ( not ( = ?auto_150316 ?auto_150319 ) ) ( not ( = ?auto_150316 ?auto_150320 ) ) ( not ( = ?auto_150317 ?auto_150318 ) ) ( not ( = ?auto_150317 ?auto_150319 ) ) ( not ( = ?auto_150317 ?auto_150320 ) ) ( not ( = ?auto_150318 ?auto_150319 ) ) ( not ( = ?auto_150318 ?auto_150320 ) ) ( not ( = ?auto_150319 ?auto_150320 ) ) ( ON ?auto_150320 ?auto_150322 ) ( not ( = ?auto_150315 ?auto_150322 ) ) ( not ( = ?auto_150316 ?auto_150322 ) ) ( not ( = ?auto_150317 ?auto_150322 ) ) ( not ( = ?auto_150318 ?auto_150322 ) ) ( not ( = ?auto_150319 ?auto_150322 ) ) ( not ( = ?auto_150320 ?auto_150322 ) ) ( ON ?auto_150319 ?auto_150320 ) ( ON-TABLE ?auto_150321 ) ( ON ?auto_150323 ?auto_150321 ) ( ON ?auto_150322 ?auto_150323 ) ( not ( = ?auto_150321 ?auto_150323 ) ) ( not ( = ?auto_150321 ?auto_150322 ) ) ( not ( = ?auto_150321 ?auto_150320 ) ) ( not ( = ?auto_150321 ?auto_150319 ) ) ( not ( = ?auto_150323 ?auto_150322 ) ) ( not ( = ?auto_150323 ?auto_150320 ) ) ( not ( = ?auto_150323 ?auto_150319 ) ) ( not ( = ?auto_150315 ?auto_150321 ) ) ( not ( = ?auto_150315 ?auto_150323 ) ) ( not ( = ?auto_150316 ?auto_150321 ) ) ( not ( = ?auto_150316 ?auto_150323 ) ) ( not ( = ?auto_150317 ?auto_150321 ) ) ( not ( = ?auto_150317 ?auto_150323 ) ) ( not ( = ?auto_150318 ?auto_150321 ) ) ( not ( = ?auto_150318 ?auto_150323 ) ) ( ON ?auto_150318 ?auto_150319 ) ( CLEAR ?auto_150318 ) ( HOLDING ?auto_150317 ) ( CLEAR ?auto_150316 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_150315 ?auto_150316 ?auto_150317 )
      ( MAKE-6PILE ?auto_150315 ?auto_150316 ?auto_150317 ?auto_150318 ?auto_150319 ?auto_150320 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_150324 - BLOCK
      ?auto_150325 - BLOCK
      ?auto_150326 - BLOCK
      ?auto_150327 - BLOCK
      ?auto_150328 - BLOCK
      ?auto_150329 - BLOCK
    )
    :vars
    (
      ?auto_150332 - BLOCK
      ?auto_150331 - BLOCK
      ?auto_150330 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150324 ) ( ON ?auto_150325 ?auto_150324 ) ( not ( = ?auto_150324 ?auto_150325 ) ) ( not ( = ?auto_150324 ?auto_150326 ) ) ( not ( = ?auto_150324 ?auto_150327 ) ) ( not ( = ?auto_150324 ?auto_150328 ) ) ( not ( = ?auto_150324 ?auto_150329 ) ) ( not ( = ?auto_150325 ?auto_150326 ) ) ( not ( = ?auto_150325 ?auto_150327 ) ) ( not ( = ?auto_150325 ?auto_150328 ) ) ( not ( = ?auto_150325 ?auto_150329 ) ) ( not ( = ?auto_150326 ?auto_150327 ) ) ( not ( = ?auto_150326 ?auto_150328 ) ) ( not ( = ?auto_150326 ?auto_150329 ) ) ( not ( = ?auto_150327 ?auto_150328 ) ) ( not ( = ?auto_150327 ?auto_150329 ) ) ( not ( = ?auto_150328 ?auto_150329 ) ) ( ON ?auto_150329 ?auto_150332 ) ( not ( = ?auto_150324 ?auto_150332 ) ) ( not ( = ?auto_150325 ?auto_150332 ) ) ( not ( = ?auto_150326 ?auto_150332 ) ) ( not ( = ?auto_150327 ?auto_150332 ) ) ( not ( = ?auto_150328 ?auto_150332 ) ) ( not ( = ?auto_150329 ?auto_150332 ) ) ( ON ?auto_150328 ?auto_150329 ) ( ON-TABLE ?auto_150331 ) ( ON ?auto_150330 ?auto_150331 ) ( ON ?auto_150332 ?auto_150330 ) ( not ( = ?auto_150331 ?auto_150330 ) ) ( not ( = ?auto_150331 ?auto_150332 ) ) ( not ( = ?auto_150331 ?auto_150329 ) ) ( not ( = ?auto_150331 ?auto_150328 ) ) ( not ( = ?auto_150330 ?auto_150332 ) ) ( not ( = ?auto_150330 ?auto_150329 ) ) ( not ( = ?auto_150330 ?auto_150328 ) ) ( not ( = ?auto_150324 ?auto_150331 ) ) ( not ( = ?auto_150324 ?auto_150330 ) ) ( not ( = ?auto_150325 ?auto_150331 ) ) ( not ( = ?auto_150325 ?auto_150330 ) ) ( not ( = ?auto_150326 ?auto_150331 ) ) ( not ( = ?auto_150326 ?auto_150330 ) ) ( not ( = ?auto_150327 ?auto_150331 ) ) ( not ( = ?auto_150327 ?auto_150330 ) ) ( ON ?auto_150327 ?auto_150328 ) ( CLEAR ?auto_150325 ) ( ON ?auto_150326 ?auto_150327 ) ( CLEAR ?auto_150326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_150331 ?auto_150330 ?auto_150332 ?auto_150329 ?auto_150328 ?auto_150327 )
      ( MAKE-6PILE ?auto_150324 ?auto_150325 ?auto_150326 ?auto_150327 ?auto_150328 ?auto_150329 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_150333 - BLOCK
      ?auto_150334 - BLOCK
      ?auto_150335 - BLOCK
      ?auto_150336 - BLOCK
      ?auto_150337 - BLOCK
      ?auto_150338 - BLOCK
    )
    :vars
    (
      ?auto_150340 - BLOCK
      ?auto_150339 - BLOCK
      ?auto_150341 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150333 ) ( not ( = ?auto_150333 ?auto_150334 ) ) ( not ( = ?auto_150333 ?auto_150335 ) ) ( not ( = ?auto_150333 ?auto_150336 ) ) ( not ( = ?auto_150333 ?auto_150337 ) ) ( not ( = ?auto_150333 ?auto_150338 ) ) ( not ( = ?auto_150334 ?auto_150335 ) ) ( not ( = ?auto_150334 ?auto_150336 ) ) ( not ( = ?auto_150334 ?auto_150337 ) ) ( not ( = ?auto_150334 ?auto_150338 ) ) ( not ( = ?auto_150335 ?auto_150336 ) ) ( not ( = ?auto_150335 ?auto_150337 ) ) ( not ( = ?auto_150335 ?auto_150338 ) ) ( not ( = ?auto_150336 ?auto_150337 ) ) ( not ( = ?auto_150336 ?auto_150338 ) ) ( not ( = ?auto_150337 ?auto_150338 ) ) ( ON ?auto_150338 ?auto_150340 ) ( not ( = ?auto_150333 ?auto_150340 ) ) ( not ( = ?auto_150334 ?auto_150340 ) ) ( not ( = ?auto_150335 ?auto_150340 ) ) ( not ( = ?auto_150336 ?auto_150340 ) ) ( not ( = ?auto_150337 ?auto_150340 ) ) ( not ( = ?auto_150338 ?auto_150340 ) ) ( ON ?auto_150337 ?auto_150338 ) ( ON-TABLE ?auto_150339 ) ( ON ?auto_150341 ?auto_150339 ) ( ON ?auto_150340 ?auto_150341 ) ( not ( = ?auto_150339 ?auto_150341 ) ) ( not ( = ?auto_150339 ?auto_150340 ) ) ( not ( = ?auto_150339 ?auto_150338 ) ) ( not ( = ?auto_150339 ?auto_150337 ) ) ( not ( = ?auto_150341 ?auto_150340 ) ) ( not ( = ?auto_150341 ?auto_150338 ) ) ( not ( = ?auto_150341 ?auto_150337 ) ) ( not ( = ?auto_150333 ?auto_150339 ) ) ( not ( = ?auto_150333 ?auto_150341 ) ) ( not ( = ?auto_150334 ?auto_150339 ) ) ( not ( = ?auto_150334 ?auto_150341 ) ) ( not ( = ?auto_150335 ?auto_150339 ) ) ( not ( = ?auto_150335 ?auto_150341 ) ) ( not ( = ?auto_150336 ?auto_150339 ) ) ( not ( = ?auto_150336 ?auto_150341 ) ) ( ON ?auto_150336 ?auto_150337 ) ( ON ?auto_150335 ?auto_150336 ) ( CLEAR ?auto_150335 ) ( HOLDING ?auto_150334 ) ( CLEAR ?auto_150333 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_150333 ?auto_150334 )
      ( MAKE-6PILE ?auto_150333 ?auto_150334 ?auto_150335 ?auto_150336 ?auto_150337 ?auto_150338 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_150342 - BLOCK
      ?auto_150343 - BLOCK
      ?auto_150344 - BLOCK
      ?auto_150345 - BLOCK
      ?auto_150346 - BLOCK
      ?auto_150347 - BLOCK
    )
    :vars
    (
      ?auto_150350 - BLOCK
      ?auto_150349 - BLOCK
      ?auto_150348 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150342 ) ( not ( = ?auto_150342 ?auto_150343 ) ) ( not ( = ?auto_150342 ?auto_150344 ) ) ( not ( = ?auto_150342 ?auto_150345 ) ) ( not ( = ?auto_150342 ?auto_150346 ) ) ( not ( = ?auto_150342 ?auto_150347 ) ) ( not ( = ?auto_150343 ?auto_150344 ) ) ( not ( = ?auto_150343 ?auto_150345 ) ) ( not ( = ?auto_150343 ?auto_150346 ) ) ( not ( = ?auto_150343 ?auto_150347 ) ) ( not ( = ?auto_150344 ?auto_150345 ) ) ( not ( = ?auto_150344 ?auto_150346 ) ) ( not ( = ?auto_150344 ?auto_150347 ) ) ( not ( = ?auto_150345 ?auto_150346 ) ) ( not ( = ?auto_150345 ?auto_150347 ) ) ( not ( = ?auto_150346 ?auto_150347 ) ) ( ON ?auto_150347 ?auto_150350 ) ( not ( = ?auto_150342 ?auto_150350 ) ) ( not ( = ?auto_150343 ?auto_150350 ) ) ( not ( = ?auto_150344 ?auto_150350 ) ) ( not ( = ?auto_150345 ?auto_150350 ) ) ( not ( = ?auto_150346 ?auto_150350 ) ) ( not ( = ?auto_150347 ?auto_150350 ) ) ( ON ?auto_150346 ?auto_150347 ) ( ON-TABLE ?auto_150349 ) ( ON ?auto_150348 ?auto_150349 ) ( ON ?auto_150350 ?auto_150348 ) ( not ( = ?auto_150349 ?auto_150348 ) ) ( not ( = ?auto_150349 ?auto_150350 ) ) ( not ( = ?auto_150349 ?auto_150347 ) ) ( not ( = ?auto_150349 ?auto_150346 ) ) ( not ( = ?auto_150348 ?auto_150350 ) ) ( not ( = ?auto_150348 ?auto_150347 ) ) ( not ( = ?auto_150348 ?auto_150346 ) ) ( not ( = ?auto_150342 ?auto_150349 ) ) ( not ( = ?auto_150342 ?auto_150348 ) ) ( not ( = ?auto_150343 ?auto_150349 ) ) ( not ( = ?auto_150343 ?auto_150348 ) ) ( not ( = ?auto_150344 ?auto_150349 ) ) ( not ( = ?auto_150344 ?auto_150348 ) ) ( not ( = ?auto_150345 ?auto_150349 ) ) ( not ( = ?auto_150345 ?auto_150348 ) ) ( ON ?auto_150345 ?auto_150346 ) ( ON ?auto_150344 ?auto_150345 ) ( CLEAR ?auto_150342 ) ( ON ?auto_150343 ?auto_150344 ) ( CLEAR ?auto_150343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_150349 ?auto_150348 ?auto_150350 ?auto_150347 ?auto_150346 ?auto_150345 ?auto_150344 )
      ( MAKE-6PILE ?auto_150342 ?auto_150343 ?auto_150344 ?auto_150345 ?auto_150346 ?auto_150347 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_150351 - BLOCK
      ?auto_150352 - BLOCK
      ?auto_150353 - BLOCK
      ?auto_150354 - BLOCK
      ?auto_150355 - BLOCK
      ?auto_150356 - BLOCK
    )
    :vars
    (
      ?auto_150359 - BLOCK
      ?auto_150357 - BLOCK
      ?auto_150358 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150351 ?auto_150352 ) ) ( not ( = ?auto_150351 ?auto_150353 ) ) ( not ( = ?auto_150351 ?auto_150354 ) ) ( not ( = ?auto_150351 ?auto_150355 ) ) ( not ( = ?auto_150351 ?auto_150356 ) ) ( not ( = ?auto_150352 ?auto_150353 ) ) ( not ( = ?auto_150352 ?auto_150354 ) ) ( not ( = ?auto_150352 ?auto_150355 ) ) ( not ( = ?auto_150352 ?auto_150356 ) ) ( not ( = ?auto_150353 ?auto_150354 ) ) ( not ( = ?auto_150353 ?auto_150355 ) ) ( not ( = ?auto_150353 ?auto_150356 ) ) ( not ( = ?auto_150354 ?auto_150355 ) ) ( not ( = ?auto_150354 ?auto_150356 ) ) ( not ( = ?auto_150355 ?auto_150356 ) ) ( ON ?auto_150356 ?auto_150359 ) ( not ( = ?auto_150351 ?auto_150359 ) ) ( not ( = ?auto_150352 ?auto_150359 ) ) ( not ( = ?auto_150353 ?auto_150359 ) ) ( not ( = ?auto_150354 ?auto_150359 ) ) ( not ( = ?auto_150355 ?auto_150359 ) ) ( not ( = ?auto_150356 ?auto_150359 ) ) ( ON ?auto_150355 ?auto_150356 ) ( ON-TABLE ?auto_150357 ) ( ON ?auto_150358 ?auto_150357 ) ( ON ?auto_150359 ?auto_150358 ) ( not ( = ?auto_150357 ?auto_150358 ) ) ( not ( = ?auto_150357 ?auto_150359 ) ) ( not ( = ?auto_150357 ?auto_150356 ) ) ( not ( = ?auto_150357 ?auto_150355 ) ) ( not ( = ?auto_150358 ?auto_150359 ) ) ( not ( = ?auto_150358 ?auto_150356 ) ) ( not ( = ?auto_150358 ?auto_150355 ) ) ( not ( = ?auto_150351 ?auto_150357 ) ) ( not ( = ?auto_150351 ?auto_150358 ) ) ( not ( = ?auto_150352 ?auto_150357 ) ) ( not ( = ?auto_150352 ?auto_150358 ) ) ( not ( = ?auto_150353 ?auto_150357 ) ) ( not ( = ?auto_150353 ?auto_150358 ) ) ( not ( = ?auto_150354 ?auto_150357 ) ) ( not ( = ?auto_150354 ?auto_150358 ) ) ( ON ?auto_150354 ?auto_150355 ) ( ON ?auto_150353 ?auto_150354 ) ( ON ?auto_150352 ?auto_150353 ) ( CLEAR ?auto_150352 ) ( HOLDING ?auto_150351 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_150351 )
      ( MAKE-6PILE ?auto_150351 ?auto_150352 ?auto_150353 ?auto_150354 ?auto_150355 ?auto_150356 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_150360 - BLOCK
      ?auto_150361 - BLOCK
      ?auto_150362 - BLOCK
      ?auto_150363 - BLOCK
      ?auto_150364 - BLOCK
      ?auto_150365 - BLOCK
    )
    :vars
    (
      ?auto_150366 - BLOCK
      ?auto_150367 - BLOCK
      ?auto_150368 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150360 ?auto_150361 ) ) ( not ( = ?auto_150360 ?auto_150362 ) ) ( not ( = ?auto_150360 ?auto_150363 ) ) ( not ( = ?auto_150360 ?auto_150364 ) ) ( not ( = ?auto_150360 ?auto_150365 ) ) ( not ( = ?auto_150361 ?auto_150362 ) ) ( not ( = ?auto_150361 ?auto_150363 ) ) ( not ( = ?auto_150361 ?auto_150364 ) ) ( not ( = ?auto_150361 ?auto_150365 ) ) ( not ( = ?auto_150362 ?auto_150363 ) ) ( not ( = ?auto_150362 ?auto_150364 ) ) ( not ( = ?auto_150362 ?auto_150365 ) ) ( not ( = ?auto_150363 ?auto_150364 ) ) ( not ( = ?auto_150363 ?auto_150365 ) ) ( not ( = ?auto_150364 ?auto_150365 ) ) ( ON ?auto_150365 ?auto_150366 ) ( not ( = ?auto_150360 ?auto_150366 ) ) ( not ( = ?auto_150361 ?auto_150366 ) ) ( not ( = ?auto_150362 ?auto_150366 ) ) ( not ( = ?auto_150363 ?auto_150366 ) ) ( not ( = ?auto_150364 ?auto_150366 ) ) ( not ( = ?auto_150365 ?auto_150366 ) ) ( ON ?auto_150364 ?auto_150365 ) ( ON-TABLE ?auto_150367 ) ( ON ?auto_150368 ?auto_150367 ) ( ON ?auto_150366 ?auto_150368 ) ( not ( = ?auto_150367 ?auto_150368 ) ) ( not ( = ?auto_150367 ?auto_150366 ) ) ( not ( = ?auto_150367 ?auto_150365 ) ) ( not ( = ?auto_150367 ?auto_150364 ) ) ( not ( = ?auto_150368 ?auto_150366 ) ) ( not ( = ?auto_150368 ?auto_150365 ) ) ( not ( = ?auto_150368 ?auto_150364 ) ) ( not ( = ?auto_150360 ?auto_150367 ) ) ( not ( = ?auto_150360 ?auto_150368 ) ) ( not ( = ?auto_150361 ?auto_150367 ) ) ( not ( = ?auto_150361 ?auto_150368 ) ) ( not ( = ?auto_150362 ?auto_150367 ) ) ( not ( = ?auto_150362 ?auto_150368 ) ) ( not ( = ?auto_150363 ?auto_150367 ) ) ( not ( = ?auto_150363 ?auto_150368 ) ) ( ON ?auto_150363 ?auto_150364 ) ( ON ?auto_150362 ?auto_150363 ) ( ON ?auto_150361 ?auto_150362 ) ( ON ?auto_150360 ?auto_150361 ) ( CLEAR ?auto_150360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_150367 ?auto_150368 ?auto_150366 ?auto_150365 ?auto_150364 ?auto_150363 ?auto_150362 ?auto_150361 )
      ( MAKE-6PILE ?auto_150360 ?auto_150361 ?auto_150362 ?auto_150363 ?auto_150364 ?auto_150365 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_150371 - BLOCK
      ?auto_150372 - BLOCK
    )
    :vars
    (
      ?auto_150373 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150373 ?auto_150372 ) ( CLEAR ?auto_150373 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_150371 ) ( ON ?auto_150372 ?auto_150371 ) ( not ( = ?auto_150371 ?auto_150372 ) ) ( not ( = ?auto_150371 ?auto_150373 ) ) ( not ( = ?auto_150372 ?auto_150373 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_150373 ?auto_150372 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_150374 - BLOCK
      ?auto_150375 - BLOCK
    )
    :vars
    (
      ?auto_150376 - BLOCK
      ?auto_150377 - BLOCK
      ?auto_150378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150376 ?auto_150375 ) ( CLEAR ?auto_150376 ) ( ON-TABLE ?auto_150374 ) ( ON ?auto_150375 ?auto_150374 ) ( not ( = ?auto_150374 ?auto_150375 ) ) ( not ( = ?auto_150374 ?auto_150376 ) ) ( not ( = ?auto_150375 ?auto_150376 ) ) ( HOLDING ?auto_150377 ) ( CLEAR ?auto_150378 ) ( not ( = ?auto_150374 ?auto_150377 ) ) ( not ( = ?auto_150374 ?auto_150378 ) ) ( not ( = ?auto_150375 ?auto_150377 ) ) ( not ( = ?auto_150375 ?auto_150378 ) ) ( not ( = ?auto_150376 ?auto_150377 ) ) ( not ( = ?auto_150376 ?auto_150378 ) ) ( not ( = ?auto_150377 ?auto_150378 ) ) )
    :subtasks
    ( ( !STACK ?auto_150377 ?auto_150378 )
      ( MAKE-2PILE ?auto_150374 ?auto_150375 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_150379 - BLOCK
      ?auto_150380 - BLOCK
    )
    :vars
    (
      ?auto_150383 - BLOCK
      ?auto_150382 - BLOCK
      ?auto_150381 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150383 ?auto_150380 ) ( ON-TABLE ?auto_150379 ) ( ON ?auto_150380 ?auto_150379 ) ( not ( = ?auto_150379 ?auto_150380 ) ) ( not ( = ?auto_150379 ?auto_150383 ) ) ( not ( = ?auto_150380 ?auto_150383 ) ) ( CLEAR ?auto_150382 ) ( not ( = ?auto_150379 ?auto_150381 ) ) ( not ( = ?auto_150379 ?auto_150382 ) ) ( not ( = ?auto_150380 ?auto_150381 ) ) ( not ( = ?auto_150380 ?auto_150382 ) ) ( not ( = ?auto_150383 ?auto_150381 ) ) ( not ( = ?auto_150383 ?auto_150382 ) ) ( not ( = ?auto_150381 ?auto_150382 ) ) ( ON ?auto_150381 ?auto_150383 ) ( CLEAR ?auto_150381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_150379 ?auto_150380 ?auto_150383 )
      ( MAKE-2PILE ?auto_150379 ?auto_150380 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_150384 - BLOCK
      ?auto_150385 - BLOCK
    )
    :vars
    (
      ?auto_150387 - BLOCK
      ?auto_150386 - BLOCK
      ?auto_150388 - BLOCK
      ?auto_150389 - BLOCK
      ?auto_150391 - BLOCK
      ?auto_150390 - BLOCK
      ?auto_150392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150387 ?auto_150385 ) ( ON-TABLE ?auto_150384 ) ( ON ?auto_150385 ?auto_150384 ) ( not ( = ?auto_150384 ?auto_150385 ) ) ( not ( = ?auto_150384 ?auto_150387 ) ) ( not ( = ?auto_150385 ?auto_150387 ) ) ( not ( = ?auto_150384 ?auto_150386 ) ) ( not ( = ?auto_150384 ?auto_150388 ) ) ( not ( = ?auto_150385 ?auto_150386 ) ) ( not ( = ?auto_150385 ?auto_150388 ) ) ( not ( = ?auto_150387 ?auto_150386 ) ) ( not ( = ?auto_150387 ?auto_150388 ) ) ( not ( = ?auto_150386 ?auto_150388 ) ) ( ON ?auto_150386 ?auto_150387 ) ( CLEAR ?auto_150386 ) ( HOLDING ?auto_150388 ) ( CLEAR ?auto_150389 ) ( ON-TABLE ?auto_150391 ) ( ON ?auto_150390 ?auto_150391 ) ( ON ?auto_150392 ?auto_150390 ) ( ON ?auto_150389 ?auto_150392 ) ( not ( = ?auto_150391 ?auto_150390 ) ) ( not ( = ?auto_150391 ?auto_150392 ) ) ( not ( = ?auto_150391 ?auto_150389 ) ) ( not ( = ?auto_150391 ?auto_150388 ) ) ( not ( = ?auto_150390 ?auto_150392 ) ) ( not ( = ?auto_150390 ?auto_150389 ) ) ( not ( = ?auto_150390 ?auto_150388 ) ) ( not ( = ?auto_150392 ?auto_150389 ) ) ( not ( = ?auto_150392 ?auto_150388 ) ) ( not ( = ?auto_150389 ?auto_150388 ) ) ( not ( = ?auto_150384 ?auto_150389 ) ) ( not ( = ?auto_150384 ?auto_150391 ) ) ( not ( = ?auto_150384 ?auto_150390 ) ) ( not ( = ?auto_150384 ?auto_150392 ) ) ( not ( = ?auto_150385 ?auto_150389 ) ) ( not ( = ?auto_150385 ?auto_150391 ) ) ( not ( = ?auto_150385 ?auto_150390 ) ) ( not ( = ?auto_150385 ?auto_150392 ) ) ( not ( = ?auto_150387 ?auto_150389 ) ) ( not ( = ?auto_150387 ?auto_150391 ) ) ( not ( = ?auto_150387 ?auto_150390 ) ) ( not ( = ?auto_150387 ?auto_150392 ) ) ( not ( = ?auto_150386 ?auto_150389 ) ) ( not ( = ?auto_150386 ?auto_150391 ) ) ( not ( = ?auto_150386 ?auto_150390 ) ) ( not ( = ?auto_150386 ?auto_150392 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_150391 ?auto_150390 ?auto_150392 ?auto_150389 ?auto_150388 )
      ( MAKE-2PILE ?auto_150384 ?auto_150385 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_150393 - BLOCK
      ?auto_150394 - BLOCK
    )
    :vars
    (
      ?auto_150397 - BLOCK
      ?auto_150400 - BLOCK
      ?auto_150395 - BLOCK
      ?auto_150396 - BLOCK
      ?auto_150398 - BLOCK
      ?auto_150399 - BLOCK
      ?auto_150401 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150397 ?auto_150394 ) ( ON-TABLE ?auto_150393 ) ( ON ?auto_150394 ?auto_150393 ) ( not ( = ?auto_150393 ?auto_150394 ) ) ( not ( = ?auto_150393 ?auto_150397 ) ) ( not ( = ?auto_150394 ?auto_150397 ) ) ( not ( = ?auto_150393 ?auto_150400 ) ) ( not ( = ?auto_150393 ?auto_150395 ) ) ( not ( = ?auto_150394 ?auto_150400 ) ) ( not ( = ?auto_150394 ?auto_150395 ) ) ( not ( = ?auto_150397 ?auto_150400 ) ) ( not ( = ?auto_150397 ?auto_150395 ) ) ( not ( = ?auto_150400 ?auto_150395 ) ) ( ON ?auto_150400 ?auto_150397 ) ( CLEAR ?auto_150396 ) ( ON-TABLE ?auto_150398 ) ( ON ?auto_150399 ?auto_150398 ) ( ON ?auto_150401 ?auto_150399 ) ( ON ?auto_150396 ?auto_150401 ) ( not ( = ?auto_150398 ?auto_150399 ) ) ( not ( = ?auto_150398 ?auto_150401 ) ) ( not ( = ?auto_150398 ?auto_150396 ) ) ( not ( = ?auto_150398 ?auto_150395 ) ) ( not ( = ?auto_150399 ?auto_150401 ) ) ( not ( = ?auto_150399 ?auto_150396 ) ) ( not ( = ?auto_150399 ?auto_150395 ) ) ( not ( = ?auto_150401 ?auto_150396 ) ) ( not ( = ?auto_150401 ?auto_150395 ) ) ( not ( = ?auto_150396 ?auto_150395 ) ) ( not ( = ?auto_150393 ?auto_150396 ) ) ( not ( = ?auto_150393 ?auto_150398 ) ) ( not ( = ?auto_150393 ?auto_150399 ) ) ( not ( = ?auto_150393 ?auto_150401 ) ) ( not ( = ?auto_150394 ?auto_150396 ) ) ( not ( = ?auto_150394 ?auto_150398 ) ) ( not ( = ?auto_150394 ?auto_150399 ) ) ( not ( = ?auto_150394 ?auto_150401 ) ) ( not ( = ?auto_150397 ?auto_150396 ) ) ( not ( = ?auto_150397 ?auto_150398 ) ) ( not ( = ?auto_150397 ?auto_150399 ) ) ( not ( = ?auto_150397 ?auto_150401 ) ) ( not ( = ?auto_150400 ?auto_150396 ) ) ( not ( = ?auto_150400 ?auto_150398 ) ) ( not ( = ?auto_150400 ?auto_150399 ) ) ( not ( = ?auto_150400 ?auto_150401 ) ) ( ON ?auto_150395 ?auto_150400 ) ( CLEAR ?auto_150395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_150393 ?auto_150394 ?auto_150397 ?auto_150400 )
      ( MAKE-2PILE ?auto_150393 ?auto_150394 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_150402 - BLOCK
      ?auto_150403 - BLOCK
    )
    :vars
    (
      ?auto_150410 - BLOCK
      ?auto_150406 - BLOCK
      ?auto_150409 - BLOCK
      ?auto_150405 - BLOCK
      ?auto_150407 - BLOCK
      ?auto_150404 - BLOCK
      ?auto_150408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150410 ?auto_150403 ) ( ON-TABLE ?auto_150402 ) ( ON ?auto_150403 ?auto_150402 ) ( not ( = ?auto_150402 ?auto_150403 ) ) ( not ( = ?auto_150402 ?auto_150410 ) ) ( not ( = ?auto_150403 ?auto_150410 ) ) ( not ( = ?auto_150402 ?auto_150406 ) ) ( not ( = ?auto_150402 ?auto_150409 ) ) ( not ( = ?auto_150403 ?auto_150406 ) ) ( not ( = ?auto_150403 ?auto_150409 ) ) ( not ( = ?auto_150410 ?auto_150406 ) ) ( not ( = ?auto_150410 ?auto_150409 ) ) ( not ( = ?auto_150406 ?auto_150409 ) ) ( ON ?auto_150406 ?auto_150410 ) ( ON-TABLE ?auto_150405 ) ( ON ?auto_150407 ?auto_150405 ) ( ON ?auto_150404 ?auto_150407 ) ( not ( = ?auto_150405 ?auto_150407 ) ) ( not ( = ?auto_150405 ?auto_150404 ) ) ( not ( = ?auto_150405 ?auto_150408 ) ) ( not ( = ?auto_150405 ?auto_150409 ) ) ( not ( = ?auto_150407 ?auto_150404 ) ) ( not ( = ?auto_150407 ?auto_150408 ) ) ( not ( = ?auto_150407 ?auto_150409 ) ) ( not ( = ?auto_150404 ?auto_150408 ) ) ( not ( = ?auto_150404 ?auto_150409 ) ) ( not ( = ?auto_150408 ?auto_150409 ) ) ( not ( = ?auto_150402 ?auto_150408 ) ) ( not ( = ?auto_150402 ?auto_150405 ) ) ( not ( = ?auto_150402 ?auto_150407 ) ) ( not ( = ?auto_150402 ?auto_150404 ) ) ( not ( = ?auto_150403 ?auto_150408 ) ) ( not ( = ?auto_150403 ?auto_150405 ) ) ( not ( = ?auto_150403 ?auto_150407 ) ) ( not ( = ?auto_150403 ?auto_150404 ) ) ( not ( = ?auto_150410 ?auto_150408 ) ) ( not ( = ?auto_150410 ?auto_150405 ) ) ( not ( = ?auto_150410 ?auto_150407 ) ) ( not ( = ?auto_150410 ?auto_150404 ) ) ( not ( = ?auto_150406 ?auto_150408 ) ) ( not ( = ?auto_150406 ?auto_150405 ) ) ( not ( = ?auto_150406 ?auto_150407 ) ) ( not ( = ?auto_150406 ?auto_150404 ) ) ( ON ?auto_150409 ?auto_150406 ) ( CLEAR ?auto_150409 ) ( HOLDING ?auto_150408 ) ( CLEAR ?auto_150404 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_150405 ?auto_150407 ?auto_150404 ?auto_150408 )
      ( MAKE-2PILE ?auto_150402 ?auto_150403 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_150411 - BLOCK
      ?auto_150412 - BLOCK
    )
    :vars
    (
      ?auto_150416 - BLOCK
      ?auto_150418 - BLOCK
      ?auto_150414 - BLOCK
      ?auto_150419 - BLOCK
      ?auto_150417 - BLOCK
      ?auto_150415 - BLOCK
      ?auto_150413 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150416 ?auto_150412 ) ( ON-TABLE ?auto_150411 ) ( ON ?auto_150412 ?auto_150411 ) ( not ( = ?auto_150411 ?auto_150412 ) ) ( not ( = ?auto_150411 ?auto_150416 ) ) ( not ( = ?auto_150412 ?auto_150416 ) ) ( not ( = ?auto_150411 ?auto_150418 ) ) ( not ( = ?auto_150411 ?auto_150414 ) ) ( not ( = ?auto_150412 ?auto_150418 ) ) ( not ( = ?auto_150412 ?auto_150414 ) ) ( not ( = ?auto_150416 ?auto_150418 ) ) ( not ( = ?auto_150416 ?auto_150414 ) ) ( not ( = ?auto_150418 ?auto_150414 ) ) ( ON ?auto_150418 ?auto_150416 ) ( ON-TABLE ?auto_150419 ) ( ON ?auto_150417 ?auto_150419 ) ( ON ?auto_150415 ?auto_150417 ) ( not ( = ?auto_150419 ?auto_150417 ) ) ( not ( = ?auto_150419 ?auto_150415 ) ) ( not ( = ?auto_150419 ?auto_150413 ) ) ( not ( = ?auto_150419 ?auto_150414 ) ) ( not ( = ?auto_150417 ?auto_150415 ) ) ( not ( = ?auto_150417 ?auto_150413 ) ) ( not ( = ?auto_150417 ?auto_150414 ) ) ( not ( = ?auto_150415 ?auto_150413 ) ) ( not ( = ?auto_150415 ?auto_150414 ) ) ( not ( = ?auto_150413 ?auto_150414 ) ) ( not ( = ?auto_150411 ?auto_150413 ) ) ( not ( = ?auto_150411 ?auto_150419 ) ) ( not ( = ?auto_150411 ?auto_150417 ) ) ( not ( = ?auto_150411 ?auto_150415 ) ) ( not ( = ?auto_150412 ?auto_150413 ) ) ( not ( = ?auto_150412 ?auto_150419 ) ) ( not ( = ?auto_150412 ?auto_150417 ) ) ( not ( = ?auto_150412 ?auto_150415 ) ) ( not ( = ?auto_150416 ?auto_150413 ) ) ( not ( = ?auto_150416 ?auto_150419 ) ) ( not ( = ?auto_150416 ?auto_150417 ) ) ( not ( = ?auto_150416 ?auto_150415 ) ) ( not ( = ?auto_150418 ?auto_150413 ) ) ( not ( = ?auto_150418 ?auto_150419 ) ) ( not ( = ?auto_150418 ?auto_150417 ) ) ( not ( = ?auto_150418 ?auto_150415 ) ) ( ON ?auto_150414 ?auto_150418 ) ( CLEAR ?auto_150415 ) ( ON ?auto_150413 ?auto_150414 ) ( CLEAR ?auto_150413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_150411 ?auto_150412 ?auto_150416 ?auto_150418 ?auto_150414 )
      ( MAKE-2PILE ?auto_150411 ?auto_150412 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_150420 - BLOCK
      ?auto_150421 - BLOCK
    )
    :vars
    (
      ?auto_150426 - BLOCK
      ?auto_150423 - BLOCK
      ?auto_150428 - BLOCK
      ?auto_150425 - BLOCK
      ?auto_150424 - BLOCK
      ?auto_150422 - BLOCK
      ?auto_150427 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150426 ?auto_150421 ) ( ON-TABLE ?auto_150420 ) ( ON ?auto_150421 ?auto_150420 ) ( not ( = ?auto_150420 ?auto_150421 ) ) ( not ( = ?auto_150420 ?auto_150426 ) ) ( not ( = ?auto_150421 ?auto_150426 ) ) ( not ( = ?auto_150420 ?auto_150423 ) ) ( not ( = ?auto_150420 ?auto_150428 ) ) ( not ( = ?auto_150421 ?auto_150423 ) ) ( not ( = ?auto_150421 ?auto_150428 ) ) ( not ( = ?auto_150426 ?auto_150423 ) ) ( not ( = ?auto_150426 ?auto_150428 ) ) ( not ( = ?auto_150423 ?auto_150428 ) ) ( ON ?auto_150423 ?auto_150426 ) ( ON-TABLE ?auto_150425 ) ( ON ?auto_150424 ?auto_150425 ) ( not ( = ?auto_150425 ?auto_150424 ) ) ( not ( = ?auto_150425 ?auto_150422 ) ) ( not ( = ?auto_150425 ?auto_150427 ) ) ( not ( = ?auto_150425 ?auto_150428 ) ) ( not ( = ?auto_150424 ?auto_150422 ) ) ( not ( = ?auto_150424 ?auto_150427 ) ) ( not ( = ?auto_150424 ?auto_150428 ) ) ( not ( = ?auto_150422 ?auto_150427 ) ) ( not ( = ?auto_150422 ?auto_150428 ) ) ( not ( = ?auto_150427 ?auto_150428 ) ) ( not ( = ?auto_150420 ?auto_150427 ) ) ( not ( = ?auto_150420 ?auto_150425 ) ) ( not ( = ?auto_150420 ?auto_150424 ) ) ( not ( = ?auto_150420 ?auto_150422 ) ) ( not ( = ?auto_150421 ?auto_150427 ) ) ( not ( = ?auto_150421 ?auto_150425 ) ) ( not ( = ?auto_150421 ?auto_150424 ) ) ( not ( = ?auto_150421 ?auto_150422 ) ) ( not ( = ?auto_150426 ?auto_150427 ) ) ( not ( = ?auto_150426 ?auto_150425 ) ) ( not ( = ?auto_150426 ?auto_150424 ) ) ( not ( = ?auto_150426 ?auto_150422 ) ) ( not ( = ?auto_150423 ?auto_150427 ) ) ( not ( = ?auto_150423 ?auto_150425 ) ) ( not ( = ?auto_150423 ?auto_150424 ) ) ( not ( = ?auto_150423 ?auto_150422 ) ) ( ON ?auto_150428 ?auto_150423 ) ( ON ?auto_150427 ?auto_150428 ) ( CLEAR ?auto_150427 ) ( HOLDING ?auto_150422 ) ( CLEAR ?auto_150424 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_150425 ?auto_150424 ?auto_150422 )
      ( MAKE-2PILE ?auto_150420 ?auto_150421 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_150429 - BLOCK
      ?auto_150430 - BLOCK
    )
    :vars
    (
      ?auto_150436 - BLOCK
      ?auto_150437 - BLOCK
      ?auto_150433 - BLOCK
      ?auto_150432 - BLOCK
      ?auto_150431 - BLOCK
      ?auto_150435 - BLOCK
      ?auto_150434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150436 ?auto_150430 ) ( ON-TABLE ?auto_150429 ) ( ON ?auto_150430 ?auto_150429 ) ( not ( = ?auto_150429 ?auto_150430 ) ) ( not ( = ?auto_150429 ?auto_150436 ) ) ( not ( = ?auto_150430 ?auto_150436 ) ) ( not ( = ?auto_150429 ?auto_150437 ) ) ( not ( = ?auto_150429 ?auto_150433 ) ) ( not ( = ?auto_150430 ?auto_150437 ) ) ( not ( = ?auto_150430 ?auto_150433 ) ) ( not ( = ?auto_150436 ?auto_150437 ) ) ( not ( = ?auto_150436 ?auto_150433 ) ) ( not ( = ?auto_150437 ?auto_150433 ) ) ( ON ?auto_150437 ?auto_150436 ) ( ON-TABLE ?auto_150432 ) ( ON ?auto_150431 ?auto_150432 ) ( not ( = ?auto_150432 ?auto_150431 ) ) ( not ( = ?auto_150432 ?auto_150435 ) ) ( not ( = ?auto_150432 ?auto_150434 ) ) ( not ( = ?auto_150432 ?auto_150433 ) ) ( not ( = ?auto_150431 ?auto_150435 ) ) ( not ( = ?auto_150431 ?auto_150434 ) ) ( not ( = ?auto_150431 ?auto_150433 ) ) ( not ( = ?auto_150435 ?auto_150434 ) ) ( not ( = ?auto_150435 ?auto_150433 ) ) ( not ( = ?auto_150434 ?auto_150433 ) ) ( not ( = ?auto_150429 ?auto_150434 ) ) ( not ( = ?auto_150429 ?auto_150432 ) ) ( not ( = ?auto_150429 ?auto_150431 ) ) ( not ( = ?auto_150429 ?auto_150435 ) ) ( not ( = ?auto_150430 ?auto_150434 ) ) ( not ( = ?auto_150430 ?auto_150432 ) ) ( not ( = ?auto_150430 ?auto_150431 ) ) ( not ( = ?auto_150430 ?auto_150435 ) ) ( not ( = ?auto_150436 ?auto_150434 ) ) ( not ( = ?auto_150436 ?auto_150432 ) ) ( not ( = ?auto_150436 ?auto_150431 ) ) ( not ( = ?auto_150436 ?auto_150435 ) ) ( not ( = ?auto_150437 ?auto_150434 ) ) ( not ( = ?auto_150437 ?auto_150432 ) ) ( not ( = ?auto_150437 ?auto_150431 ) ) ( not ( = ?auto_150437 ?auto_150435 ) ) ( ON ?auto_150433 ?auto_150437 ) ( ON ?auto_150434 ?auto_150433 ) ( CLEAR ?auto_150431 ) ( ON ?auto_150435 ?auto_150434 ) ( CLEAR ?auto_150435 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_150429 ?auto_150430 ?auto_150436 ?auto_150437 ?auto_150433 ?auto_150434 )
      ( MAKE-2PILE ?auto_150429 ?auto_150430 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_150438 - BLOCK
      ?auto_150439 - BLOCK
    )
    :vars
    (
      ?auto_150442 - BLOCK
      ?auto_150441 - BLOCK
      ?auto_150440 - BLOCK
      ?auto_150445 - BLOCK
      ?auto_150444 - BLOCK
      ?auto_150443 - BLOCK
      ?auto_150446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150442 ?auto_150439 ) ( ON-TABLE ?auto_150438 ) ( ON ?auto_150439 ?auto_150438 ) ( not ( = ?auto_150438 ?auto_150439 ) ) ( not ( = ?auto_150438 ?auto_150442 ) ) ( not ( = ?auto_150439 ?auto_150442 ) ) ( not ( = ?auto_150438 ?auto_150441 ) ) ( not ( = ?auto_150438 ?auto_150440 ) ) ( not ( = ?auto_150439 ?auto_150441 ) ) ( not ( = ?auto_150439 ?auto_150440 ) ) ( not ( = ?auto_150442 ?auto_150441 ) ) ( not ( = ?auto_150442 ?auto_150440 ) ) ( not ( = ?auto_150441 ?auto_150440 ) ) ( ON ?auto_150441 ?auto_150442 ) ( ON-TABLE ?auto_150445 ) ( not ( = ?auto_150445 ?auto_150444 ) ) ( not ( = ?auto_150445 ?auto_150443 ) ) ( not ( = ?auto_150445 ?auto_150446 ) ) ( not ( = ?auto_150445 ?auto_150440 ) ) ( not ( = ?auto_150444 ?auto_150443 ) ) ( not ( = ?auto_150444 ?auto_150446 ) ) ( not ( = ?auto_150444 ?auto_150440 ) ) ( not ( = ?auto_150443 ?auto_150446 ) ) ( not ( = ?auto_150443 ?auto_150440 ) ) ( not ( = ?auto_150446 ?auto_150440 ) ) ( not ( = ?auto_150438 ?auto_150446 ) ) ( not ( = ?auto_150438 ?auto_150445 ) ) ( not ( = ?auto_150438 ?auto_150444 ) ) ( not ( = ?auto_150438 ?auto_150443 ) ) ( not ( = ?auto_150439 ?auto_150446 ) ) ( not ( = ?auto_150439 ?auto_150445 ) ) ( not ( = ?auto_150439 ?auto_150444 ) ) ( not ( = ?auto_150439 ?auto_150443 ) ) ( not ( = ?auto_150442 ?auto_150446 ) ) ( not ( = ?auto_150442 ?auto_150445 ) ) ( not ( = ?auto_150442 ?auto_150444 ) ) ( not ( = ?auto_150442 ?auto_150443 ) ) ( not ( = ?auto_150441 ?auto_150446 ) ) ( not ( = ?auto_150441 ?auto_150445 ) ) ( not ( = ?auto_150441 ?auto_150444 ) ) ( not ( = ?auto_150441 ?auto_150443 ) ) ( ON ?auto_150440 ?auto_150441 ) ( ON ?auto_150446 ?auto_150440 ) ( ON ?auto_150443 ?auto_150446 ) ( CLEAR ?auto_150443 ) ( HOLDING ?auto_150444 ) ( CLEAR ?auto_150445 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_150445 ?auto_150444 )
      ( MAKE-2PILE ?auto_150438 ?auto_150439 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_150447 - BLOCK
      ?auto_150448 - BLOCK
    )
    :vars
    (
      ?auto_150452 - BLOCK
      ?auto_150453 - BLOCK
      ?auto_150449 - BLOCK
      ?auto_150455 - BLOCK
      ?auto_150454 - BLOCK
      ?auto_150451 - BLOCK
      ?auto_150450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150452 ?auto_150448 ) ( ON-TABLE ?auto_150447 ) ( ON ?auto_150448 ?auto_150447 ) ( not ( = ?auto_150447 ?auto_150448 ) ) ( not ( = ?auto_150447 ?auto_150452 ) ) ( not ( = ?auto_150448 ?auto_150452 ) ) ( not ( = ?auto_150447 ?auto_150453 ) ) ( not ( = ?auto_150447 ?auto_150449 ) ) ( not ( = ?auto_150448 ?auto_150453 ) ) ( not ( = ?auto_150448 ?auto_150449 ) ) ( not ( = ?auto_150452 ?auto_150453 ) ) ( not ( = ?auto_150452 ?auto_150449 ) ) ( not ( = ?auto_150453 ?auto_150449 ) ) ( ON ?auto_150453 ?auto_150452 ) ( ON-TABLE ?auto_150455 ) ( not ( = ?auto_150455 ?auto_150454 ) ) ( not ( = ?auto_150455 ?auto_150451 ) ) ( not ( = ?auto_150455 ?auto_150450 ) ) ( not ( = ?auto_150455 ?auto_150449 ) ) ( not ( = ?auto_150454 ?auto_150451 ) ) ( not ( = ?auto_150454 ?auto_150450 ) ) ( not ( = ?auto_150454 ?auto_150449 ) ) ( not ( = ?auto_150451 ?auto_150450 ) ) ( not ( = ?auto_150451 ?auto_150449 ) ) ( not ( = ?auto_150450 ?auto_150449 ) ) ( not ( = ?auto_150447 ?auto_150450 ) ) ( not ( = ?auto_150447 ?auto_150455 ) ) ( not ( = ?auto_150447 ?auto_150454 ) ) ( not ( = ?auto_150447 ?auto_150451 ) ) ( not ( = ?auto_150448 ?auto_150450 ) ) ( not ( = ?auto_150448 ?auto_150455 ) ) ( not ( = ?auto_150448 ?auto_150454 ) ) ( not ( = ?auto_150448 ?auto_150451 ) ) ( not ( = ?auto_150452 ?auto_150450 ) ) ( not ( = ?auto_150452 ?auto_150455 ) ) ( not ( = ?auto_150452 ?auto_150454 ) ) ( not ( = ?auto_150452 ?auto_150451 ) ) ( not ( = ?auto_150453 ?auto_150450 ) ) ( not ( = ?auto_150453 ?auto_150455 ) ) ( not ( = ?auto_150453 ?auto_150454 ) ) ( not ( = ?auto_150453 ?auto_150451 ) ) ( ON ?auto_150449 ?auto_150453 ) ( ON ?auto_150450 ?auto_150449 ) ( ON ?auto_150451 ?auto_150450 ) ( CLEAR ?auto_150455 ) ( ON ?auto_150454 ?auto_150451 ) ( CLEAR ?auto_150454 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_150447 ?auto_150448 ?auto_150452 ?auto_150453 ?auto_150449 ?auto_150450 ?auto_150451 )
      ( MAKE-2PILE ?auto_150447 ?auto_150448 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_150456 - BLOCK
      ?auto_150457 - BLOCK
    )
    :vars
    (
      ?auto_150462 - BLOCK
      ?auto_150459 - BLOCK
      ?auto_150464 - BLOCK
      ?auto_150460 - BLOCK
      ?auto_150458 - BLOCK
      ?auto_150461 - BLOCK
      ?auto_150463 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150462 ?auto_150457 ) ( ON-TABLE ?auto_150456 ) ( ON ?auto_150457 ?auto_150456 ) ( not ( = ?auto_150456 ?auto_150457 ) ) ( not ( = ?auto_150456 ?auto_150462 ) ) ( not ( = ?auto_150457 ?auto_150462 ) ) ( not ( = ?auto_150456 ?auto_150459 ) ) ( not ( = ?auto_150456 ?auto_150464 ) ) ( not ( = ?auto_150457 ?auto_150459 ) ) ( not ( = ?auto_150457 ?auto_150464 ) ) ( not ( = ?auto_150462 ?auto_150459 ) ) ( not ( = ?auto_150462 ?auto_150464 ) ) ( not ( = ?auto_150459 ?auto_150464 ) ) ( ON ?auto_150459 ?auto_150462 ) ( not ( = ?auto_150460 ?auto_150458 ) ) ( not ( = ?auto_150460 ?auto_150461 ) ) ( not ( = ?auto_150460 ?auto_150463 ) ) ( not ( = ?auto_150460 ?auto_150464 ) ) ( not ( = ?auto_150458 ?auto_150461 ) ) ( not ( = ?auto_150458 ?auto_150463 ) ) ( not ( = ?auto_150458 ?auto_150464 ) ) ( not ( = ?auto_150461 ?auto_150463 ) ) ( not ( = ?auto_150461 ?auto_150464 ) ) ( not ( = ?auto_150463 ?auto_150464 ) ) ( not ( = ?auto_150456 ?auto_150463 ) ) ( not ( = ?auto_150456 ?auto_150460 ) ) ( not ( = ?auto_150456 ?auto_150458 ) ) ( not ( = ?auto_150456 ?auto_150461 ) ) ( not ( = ?auto_150457 ?auto_150463 ) ) ( not ( = ?auto_150457 ?auto_150460 ) ) ( not ( = ?auto_150457 ?auto_150458 ) ) ( not ( = ?auto_150457 ?auto_150461 ) ) ( not ( = ?auto_150462 ?auto_150463 ) ) ( not ( = ?auto_150462 ?auto_150460 ) ) ( not ( = ?auto_150462 ?auto_150458 ) ) ( not ( = ?auto_150462 ?auto_150461 ) ) ( not ( = ?auto_150459 ?auto_150463 ) ) ( not ( = ?auto_150459 ?auto_150460 ) ) ( not ( = ?auto_150459 ?auto_150458 ) ) ( not ( = ?auto_150459 ?auto_150461 ) ) ( ON ?auto_150464 ?auto_150459 ) ( ON ?auto_150463 ?auto_150464 ) ( ON ?auto_150461 ?auto_150463 ) ( ON ?auto_150458 ?auto_150461 ) ( CLEAR ?auto_150458 ) ( HOLDING ?auto_150460 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_150460 )
      ( MAKE-2PILE ?auto_150456 ?auto_150457 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_150465 - BLOCK
      ?auto_150466 - BLOCK
    )
    :vars
    (
      ?auto_150467 - BLOCK
      ?auto_150469 - BLOCK
      ?auto_150470 - BLOCK
      ?auto_150468 - BLOCK
      ?auto_150471 - BLOCK
      ?auto_150472 - BLOCK
      ?auto_150473 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150467 ?auto_150466 ) ( ON-TABLE ?auto_150465 ) ( ON ?auto_150466 ?auto_150465 ) ( not ( = ?auto_150465 ?auto_150466 ) ) ( not ( = ?auto_150465 ?auto_150467 ) ) ( not ( = ?auto_150466 ?auto_150467 ) ) ( not ( = ?auto_150465 ?auto_150469 ) ) ( not ( = ?auto_150465 ?auto_150470 ) ) ( not ( = ?auto_150466 ?auto_150469 ) ) ( not ( = ?auto_150466 ?auto_150470 ) ) ( not ( = ?auto_150467 ?auto_150469 ) ) ( not ( = ?auto_150467 ?auto_150470 ) ) ( not ( = ?auto_150469 ?auto_150470 ) ) ( ON ?auto_150469 ?auto_150467 ) ( not ( = ?auto_150468 ?auto_150471 ) ) ( not ( = ?auto_150468 ?auto_150472 ) ) ( not ( = ?auto_150468 ?auto_150473 ) ) ( not ( = ?auto_150468 ?auto_150470 ) ) ( not ( = ?auto_150471 ?auto_150472 ) ) ( not ( = ?auto_150471 ?auto_150473 ) ) ( not ( = ?auto_150471 ?auto_150470 ) ) ( not ( = ?auto_150472 ?auto_150473 ) ) ( not ( = ?auto_150472 ?auto_150470 ) ) ( not ( = ?auto_150473 ?auto_150470 ) ) ( not ( = ?auto_150465 ?auto_150473 ) ) ( not ( = ?auto_150465 ?auto_150468 ) ) ( not ( = ?auto_150465 ?auto_150471 ) ) ( not ( = ?auto_150465 ?auto_150472 ) ) ( not ( = ?auto_150466 ?auto_150473 ) ) ( not ( = ?auto_150466 ?auto_150468 ) ) ( not ( = ?auto_150466 ?auto_150471 ) ) ( not ( = ?auto_150466 ?auto_150472 ) ) ( not ( = ?auto_150467 ?auto_150473 ) ) ( not ( = ?auto_150467 ?auto_150468 ) ) ( not ( = ?auto_150467 ?auto_150471 ) ) ( not ( = ?auto_150467 ?auto_150472 ) ) ( not ( = ?auto_150469 ?auto_150473 ) ) ( not ( = ?auto_150469 ?auto_150468 ) ) ( not ( = ?auto_150469 ?auto_150471 ) ) ( not ( = ?auto_150469 ?auto_150472 ) ) ( ON ?auto_150470 ?auto_150469 ) ( ON ?auto_150473 ?auto_150470 ) ( ON ?auto_150472 ?auto_150473 ) ( ON ?auto_150471 ?auto_150472 ) ( ON ?auto_150468 ?auto_150471 ) ( CLEAR ?auto_150468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_150465 ?auto_150466 ?auto_150467 ?auto_150469 ?auto_150470 ?auto_150473 ?auto_150472 ?auto_150471 )
      ( MAKE-2PILE ?auto_150465 ?auto_150466 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150481 - BLOCK
      ?auto_150482 - BLOCK
      ?auto_150483 - BLOCK
      ?auto_150484 - BLOCK
      ?auto_150485 - BLOCK
      ?auto_150486 - BLOCK
      ?auto_150487 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_150487 ) ( CLEAR ?auto_150486 ) ( ON-TABLE ?auto_150481 ) ( ON ?auto_150482 ?auto_150481 ) ( ON ?auto_150483 ?auto_150482 ) ( ON ?auto_150484 ?auto_150483 ) ( ON ?auto_150485 ?auto_150484 ) ( ON ?auto_150486 ?auto_150485 ) ( not ( = ?auto_150481 ?auto_150482 ) ) ( not ( = ?auto_150481 ?auto_150483 ) ) ( not ( = ?auto_150481 ?auto_150484 ) ) ( not ( = ?auto_150481 ?auto_150485 ) ) ( not ( = ?auto_150481 ?auto_150486 ) ) ( not ( = ?auto_150481 ?auto_150487 ) ) ( not ( = ?auto_150482 ?auto_150483 ) ) ( not ( = ?auto_150482 ?auto_150484 ) ) ( not ( = ?auto_150482 ?auto_150485 ) ) ( not ( = ?auto_150482 ?auto_150486 ) ) ( not ( = ?auto_150482 ?auto_150487 ) ) ( not ( = ?auto_150483 ?auto_150484 ) ) ( not ( = ?auto_150483 ?auto_150485 ) ) ( not ( = ?auto_150483 ?auto_150486 ) ) ( not ( = ?auto_150483 ?auto_150487 ) ) ( not ( = ?auto_150484 ?auto_150485 ) ) ( not ( = ?auto_150484 ?auto_150486 ) ) ( not ( = ?auto_150484 ?auto_150487 ) ) ( not ( = ?auto_150485 ?auto_150486 ) ) ( not ( = ?auto_150485 ?auto_150487 ) ) ( not ( = ?auto_150486 ?auto_150487 ) ) )
    :subtasks
    ( ( !STACK ?auto_150487 ?auto_150486 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150488 - BLOCK
      ?auto_150489 - BLOCK
      ?auto_150490 - BLOCK
      ?auto_150491 - BLOCK
      ?auto_150492 - BLOCK
      ?auto_150493 - BLOCK
      ?auto_150494 - BLOCK
    )
    :vars
    (
      ?auto_150495 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_150493 ) ( ON-TABLE ?auto_150488 ) ( ON ?auto_150489 ?auto_150488 ) ( ON ?auto_150490 ?auto_150489 ) ( ON ?auto_150491 ?auto_150490 ) ( ON ?auto_150492 ?auto_150491 ) ( ON ?auto_150493 ?auto_150492 ) ( not ( = ?auto_150488 ?auto_150489 ) ) ( not ( = ?auto_150488 ?auto_150490 ) ) ( not ( = ?auto_150488 ?auto_150491 ) ) ( not ( = ?auto_150488 ?auto_150492 ) ) ( not ( = ?auto_150488 ?auto_150493 ) ) ( not ( = ?auto_150488 ?auto_150494 ) ) ( not ( = ?auto_150489 ?auto_150490 ) ) ( not ( = ?auto_150489 ?auto_150491 ) ) ( not ( = ?auto_150489 ?auto_150492 ) ) ( not ( = ?auto_150489 ?auto_150493 ) ) ( not ( = ?auto_150489 ?auto_150494 ) ) ( not ( = ?auto_150490 ?auto_150491 ) ) ( not ( = ?auto_150490 ?auto_150492 ) ) ( not ( = ?auto_150490 ?auto_150493 ) ) ( not ( = ?auto_150490 ?auto_150494 ) ) ( not ( = ?auto_150491 ?auto_150492 ) ) ( not ( = ?auto_150491 ?auto_150493 ) ) ( not ( = ?auto_150491 ?auto_150494 ) ) ( not ( = ?auto_150492 ?auto_150493 ) ) ( not ( = ?auto_150492 ?auto_150494 ) ) ( not ( = ?auto_150493 ?auto_150494 ) ) ( ON ?auto_150494 ?auto_150495 ) ( CLEAR ?auto_150494 ) ( HAND-EMPTY ) ( not ( = ?auto_150488 ?auto_150495 ) ) ( not ( = ?auto_150489 ?auto_150495 ) ) ( not ( = ?auto_150490 ?auto_150495 ) ) ( not ( = ?auto_150491 ?auto_150495 ) ) ( not ( = ?auto_150492 ?auto_150495 ) ) ( not ( = ?auto_150493 ?auto_150495 ) ) ( not ( = ?auto_150494 ?auto_150495 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_150494 ?auto_150495 )
      ( MAKE-7PILE ?auto_150488 ?auto_150489 ?auto_150490 ?auto_150491 ?auto_150492 ?auto_150493 ?auto_150494 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150496 - BLOCK
      ?auto_150497 - BLOCK
      ?auto_150498 - BLOCK
      ?auto_150499 - BLOCK
      ?auto_150500 - BLOCK
      ?auto_150501 - BLOCK
      ?auto_150502 - BLOCK
    )
    :vars
    (
      ?auto_150503 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150496 ) ( ON ?auto_150497 ?auto_150496 ) ( ON ?auto_150498 ?auto_150497 ) ( ON ?auto_150499 ?auto_150498 ) ( ON ?auto_150500 ?auto_150499 ) ( not ( = ?auto_150496 ?auto_150497 ) ) ( not ( = ?auto_150496 ?auto_150498 ) ) ( not ( = ?auto_150496 ?auto_150499 ) ) ( not ( = ?auto_150496 ?auto_150500 ) ) ( not ( = ?auto_150496 ?auto_150501 ) ) ( not ( = ?auto_150496 ?auto_150502 ) ) ( not ( = ?auto_150497 ?auto_150498 ) ) ( not ( = ?auto_150497 ?auto_150499 ) ) ( not ( = ?auto_150497 ?auto_150500 ) ) ( not ( = ?auto_150497 ?auto_150501 ) ) ( not ( = ?auto_150497 ?auto_150502 ) ) ( not ( = ?auto_150498 ?auto_150499 ) ) ( not ( = ?auto_150498 ?auto_150500 ) ) ( not ( = ?auto_150498 ?auto_150501 ) ) ( not ( = ?auto_150498 ?auto_150502 ) ) ( not ( = ?auto_150499 ?auto_150500 ) ) ( not ( = ?auto_150499 ?auto_150501 ) ) ( not ( = ?auto_150499 ?auto_150502 ) ) ( not ( = ?auto_150500 ?auto_150501 ) ) ( not ( = ?auto_150500 ?auto_150502 ) ) ( not ( = ?auto_150501 ?auto_150502 ) ) ( ON ?auto_150502 ?auto_150503 ) ( CLEAR ?auto_150502 ) ( not ( = ?auto_150496 ?auto_150503 ) ) ( not ( = ?auto_150497 ?auto_150503 ) ) ( not ( = ?auto_150498 ?auto_150503 ) ) ( not ( = ?auto_150499 ?auto_150503 ) ) ( not ( = ?auto_150500 ?auto_150503 ) ) ( not ( = ?auto_150501 ?auto_150503 ) ) ( not ( = ?auto_150502 ?auto_150503 ) ) ( HOLDING ?auto_150501 ) ( CLEAR ?auto_150500 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_150496 ?auto_150497 ?auto_150498 ?auto_150499 ?auto_150500 ?auto_150501 )
      ( MAKE-7PILE ?auto_150496 ?auto_150497 ?auto_150498 ?auto_150499 ?auto_150500 ?auto_150501 ?auto_150502 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150504 - BLOCK
      ?auto_150505 - BLOCK
      ?auto_150506 - BLOCK
      ?auto_150507 - BLOCK
      ?auto_150508 - BLOCK
      ?auto_150509 - BLOCK
      ?auto_150510 - BLOCK
    )
    :vars
    (
      ?auto_150511 - BLOCK
      ?auto_150512 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150504 ) ( ON ?auto_150505 ?auto_150504 ) ( ON ?auto_150506 ?auto_150505 ) ( ON ?auto_150507 ?auto_150506 ) ( ON ?auto_150508 ?auto_150507 ) ( not ( = ?auto_150504 ?auto_150505 ) ) ( not ( = ?auto_150504 ?auto_150506 ) ) ( not ( = ?auto_150504 ?auto_150507 ) ) ( not ( = ?auto_150504 ?auto_150508 ) ) ( not ( = ?auto_150504 ?auto_150509 ) ) ( not ( = ?auto_150504 ?auto_150510 ) ) ( not ( = ?auto_150505 ?auto_150506 ) ) ( not ( = ?auto_150505 ?auto_150507 ) ) ( not ( = ?auto_150505 ?auto_150508 ) ) ( not ( = ?auto_150505 ?auto_150509 ) ) ( not ( = ?auto_150505 ?auto_150510 ) ) ( not ( = ?auto_150506 ?auto_150507 ) ) ( not ( = ?auto_150506 ?auto_150508 ) ) ( not ( = ?auto_150506 ?auto_150509 ) ) ( not ( = ?auto_150506 ?auto_150510 ) ) ( not ( = ?auto_150507 ?auto_150508 ) ) ( not ( = ?auto_150507 ?auto_150509 ) ) ( not ( = ?auto_150507 ?auto_150510 ) ) ( not ( = ?auto_150508 ?auto_150509 ) ) ( not ( = ?auto_150508 ?auto_150510 ) ) ( not ( = ?auto_150509 ?auto_150510 ) ) ( ON ?auto_150510 ?auto_150511 ) ( not ( = ?auto_150504 ?auto_150511 ) ) ( not ( = ?auto_150505 ?auto_150511 ) ) ( not ( = ?auto_150506 ?auto_150511 ) ) ( not ( = ?auto_150507 ?auto_150511 ) ) ( not ( = ?auto_150508 ?auto_150511 ) ) ( not ( = ?auto_150509 ?auto_150511 ) ) ( not ( = ?auto_150510 ?auto_150511 ) ) ( CLEAR ?auto_150508 ) ( ON ?auto_150509 ?auto_150510 ) ( CLEAR ?auto_150509 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_150512 ) ( ON ?auto_150511 ?auto_150512 ) ( not ( = ?auto_150512 ?auto_150511 ) ) ( not ( = ?auto_150512 ?auto_150510 ) ) ( not ( = ?auto_150512 ?auto_150509 ) ) ( not ( = ?auto_150504 ?auto_150512 ) ) ( not ( = ?auto_150505 ?auto_150512 ) ) ( not ( = ?auto_150506 ?auto_150512 ) ) ( not ( = ?auto_150507 ?auto_150512 ) ) ( not ( = ?auto_150508 ?auto_150512 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_150512 ?auto_150511 ?auto_150510 )
      ( MAKE-7PILE ?auto_150504 ?auto_150505 ?auto_150506 ?auto_150507 ?auto_150508 ?auto_150509 ?auto_150510 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150513 - BLOCK
      ?auto_150514 - BLOCK
      ?auto_150515 - BLOCK
      ?auto_150516 - BLOCK
      ?auto_150517 - BLOCK
      ?auto_150518 - BLOCK
      ?auto_150519 - BLOCK
    )
    :vars
    (
      ?auto_150520 - BLOCK
      ?auto_150521 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150513 ) ( ON ?auto_150514 ?auto_150513 ) ( ON ?auto_150515 ?auto_150514 ) ( ON ?auto_150516 ?auto_150515 ) ( not ( = ?auto_150513 ?auto_150514 ) ) ( not ( = ?auto_150513 ?auto_150515 ) ) ( not ( = ?auto_150513 ?auto_150516 ) ) ( not ( = ?auto_150513 ?auto_150517 ) ) ( not ( = ?auto_150513 ?auto_150518 ) ) ( not ( = ?auto_150513 ?auto_150519 ) ) ( not ( = ?auto_150514 ?auto_150515 ) ) ( not ( = ?auto_150514 ?auto_150516 ) ) ( not ( = ?auto_150514 ?auto_150517 ) ) ( not ( = ?auto_150514 ?auto_150518 ) ) ( not ( = ?auto_150514 ?auto_150519 ) ) ( not ( = ?auto_150515 ?auto_150516 ) ) ( not ( = ?auto_150515 ?auto_150517 ) ) ( not ( = ?auto_150515 ?auto_150518 ) ) ( not ( = ?auto_150515 ?auto_150519 ) ) ( not ( = ?auto_150516 ?auto_150517 ) ) ( not ( = ?auto_150516 ?auto_150518 ) ) ( not ( = ?auto_150516 ?auto_150519 ) ) ( not ( = ?auto_150517 ?auto_150518 ) ) ( not ( = ?auto_150517 ?auto_150519 ) ) ( not ( = ?auto_150518 ?auto_150519 ) ) ( ON ?auto_150519 ?auto_150520 ) ( not ( = ?auto_150513 ?auto_150520 ) ) ( not ( = ?auto_150514 ?auto_150520 ) ) ( not ( = ?auto_150515 ?auto_150520 ) ) ( not ( = ?auto_150516 ?auto_150520 ) ) ( not ( = ?auto_150517 ?auto_150520 ) ) ( not ( = ?auto_150518 ?auto_150520 ) ) ( not ( = ?auto_150519 ?auto_150520 ) ) ( ON ?auto_150518 ?auto_150519 ) ( CLEAR ?auto_150518 ) ( ON-TABLE ?auto_150521 ) ( ON ?auto_150520 ?auto_150521 ) ( not ( = ?auto_150521 ?auto_150520 ) ) ( not ( = ?auto_150521 ?auto_150519 ) ) ( not ( = ?auto_150521 ?auto_150518 ) ) ( not ( = ?auto_150513 ?auto_150521 ) ) ( not ( = ?auto_150514 ?auto_150521 ) ) ( not ( = ?auto_150515 ?auto_150521 ) ) ( not ( = ?auto_150516 ?auto_150521 ) ) ( not ( = ?auto_150517 ?auto_150521 ) ) ( HOLDING ?auto_150517 ) ( CLEAR ?auto_150516 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_150513 ?auto_150514 ?auto_150515 ?auto_150516 ?auto_150517 )
      ( MAKE-7PILE ?auto_150513 ?auto_150514 ?auto_150515 ?auto_150516 ?auto_150517 ?auto_150518 ?auto_150519 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150522 - BLOCK
      ?auto_150523 - BLOCK
      ?auto_150524 - BLOCK
      ?auto_150525 - BLOCK
      ?auto_150526 - BLOCK
      ?auto_150527 - BLOCK
      ?auto_150528 - BLOCK
    )
    :vars
    (
      ?auto_150530 - BLOCK
      ?auto_150529 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150522 ) ( ON ?auto_150523 ?auto_150522 ) ( ON ?auto_150524 ?auto_150523 ) ( ON ?auto_150525 ?auto_150524 ) ( not ( = ?auto_150522 ?auto_150523 ) ) ( not ( = ?auto_150522 ?auto_150524 ) ) ( not ( = ?auto_150522 ?auto_150525 ) ) ( not ( = ?auto_150522 ?auto_150526 ) ) ( not ( = ?auto_150522 ?auto_150527 ) ) ( not ( = ?auto_150522 ?auto_150528 ) ) ( not ( = ?auto_150523 ?auto_150524 ) ) ( not ( = ?auto_150523 ?auto_150525 ) ) ( not ( = ?auto_150523 ?auto_150526 ) ) ( not ( = ?auto_150523 ?auto_150527 ) ) ( not ( = ?auto_150523 ?auto_150528 ) ) ( not ( = ?auto_150524 ?auto_150525 ) ) ( not ( = ?auto_150524 ?auto_150526 ) ) ( not ( = ?auto_150524 ?auto_150527 ) ) ( not ( = ?auto_150524 ?auto_150528 ) ) ( not ( = ?auto_150525 ?auto_150526 ) ) ( not ( = ?auto_150525 ?auto_150527 ) ) ( not ( = ?auto_150525 ?auto_150528 ) ) ( not ( = ?auto_150526 ?auto_150527 ) ) ( not ( = ?auto_150526 ?auto_150528 ) ) ( not ( = ?auto_150527 ?auto_150528 ) ) ( ON ?auto_150528 ?auto_150530 ) ( not ( = ?auto_150522 ?auto_150530 ) ) ( not ( = ?auto_150523 ?auto_150530 ) ) ( not ( = ?auto_150524 ?auto_150530 ) ) ( not ( = ?auto_150525 ?auto_150530 ) ) ( not ( = ?auto_150526 ?auto_150530 ) ) ( not ( = ?auto_150527 ?auto_150530 ) ) ( not ( = ?auto_150528 ?auto_150530 ) ) ( ON ?auto_150527 ?auto_150528 ) ( ON-TABLE ?auto_150529 ) ( ON ?auto_150530 ?auto_150529 ) ( not ( = ?auto_150529 ?auto_150530 ) ) ( not ( = ?auto_150529 ?auto_150528 ) ) ( not ( = ?auto_150529 ?auto_150527 ) ) ( not ( = ?auto_150522 ?auto_150529 ) ) ( not ( = ?auto_150523 ?auto_150529 ) ) ( not ( = ?auto_150524 ?auto_150529 ) ) ( not ( = ?auto_150525 ?auto_150529 ) ) ( not ( = ?auto_150526 ?auto_150529 ) ) ( CLEAR ?auto_150525 ) ( ON ?auto_150526 ?auto_150527 ) ( CLEAR ?auto_150526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_150529 ?auto_150530 ?auto_150528 ?auto_150527 )
      ( MAKE-7PILE ?auto_150522 ?auto_150523 ?auto_150524 ?auto_150525 ?auto_150526 ?auto_150527 ?auto_150528 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150531 - BLOCK
      ?auto_150532 - BLOCK
      ?auto_150533 - BLOCK
      ?auto_150534 - BLOCK
      ?auto_150535 - BLOCK
      ?auto_150536 - BLOCK
      ?auto_150537 - BLOCK
    )
    :vars
    (
      ?auto_150538 - BLOCK
      ?auto_150539 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150531 ) ( ON ?auto_150532 ?auto_150531 ) ( ON ?auto_150533 ?auto_150532 ) ( not ( = ?auto_150531 ?auto_150532 ) ) ( not ( = ?auto_150531 ?auto_150533 ) ) ( not ( = ?auto_150531 ?auto_150534 ) ) ( not ( = ?auto_150531 ?auto_150535 ) ) ( not ( = ?auto_150531 ?auto_150536 ) ) ( not ( = ?auto_150531 ?auto_150537 ) ) ( not ( = ?auto_150532 ?auto_150533 ) ) ( not ( = ?auto_150532 ?auto_150534 ) ) ( not ( = ?auto_150532 ?auto_150535 ) ) ( not ( = ?auto_150532 ?auto_150536 ) ) ( not ( = ?auto_150532 ?auto_150537 ) ) ( not ( = ?auto_150533 ?auto_150534 ) ) ( not ( = ?auto_150533 ?auto_150535 ) ) ( not ( = ?auto_150533 ?auto_150536 ) ) ( not ( = ?auto_150533 ?auto_150537 ) ) ( not ( = ?auto_150534 ?auto_150535 ) ) ( not ( = ?auto_150534 ?auto_150536 ) ) ( not ( = ?auto_150534 ?auto_150537 ) ) ( not ( = ?auto_150535 ?auto_150536 ) ) ( not ( = ?auto_150535 ?auto_150537 ) ) ( not ( = ?auto_150536 ?auto_150537 ) ) ( ON ?auto_150537 ?auto_150538 ) ( not ( = ?auto_150531 ?auto_150538 ) ) ( not ( = ?auto_150532 ?auto_150538 ) ) ( not ( = ?auto_150533 ?auto_150538 ) ) ( not ( = ?auto_150534 ?auto_150538 ) ) ( not ( = ?auto_150535 ?auto_150538 ) ) ( not ( = ?auto_150536 ?auto_150538 ) ) ( not ( = ?auto_150537 ?auto_150538 ) ) ( ON ?auto_150536 ?auto_150537 ) ( ON-TABLE ?auto_150539 ) ( ON ?auto_150538 ?auto_150539 ) ( not ( = ?auto_150539 ?auto_150538 ) ) ( not ( = ?auto_150539 ?auto_150537 ) ) ( not ( = ?auto_150539 ?auto_150536 ) ) ( not ( = ?auto_150531 ?auto_150539 ) ) ( not ( = ?auto_150532 ?auto_150539 ) ) ( not ( = ?auto_150533 ?auto_150539 ) ) ( not ( = ?auto_150534 ?auto_150539 ) ) ( not ( = ?auto_150535 ?auto_150539 ) ) ( ON ?auto_150535 ?auto_150536 ) ( CLEAR ?auto_150535 ) ( HOLDING ?auto_150534 ) ( CLEAR ?auto_150533 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_150531 ?auto_150532 ?auto_150533 ?auto_150534 )
      ( MAKE-7PILE ?auto_150531 ?auto_150532 ?auto_150533 ?auto_150534 ?auto_150535 ?auto_150536 ?auto_150537 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150540 - BLOCK
      ?auto_150541 - BLOCK
      ?auto_150542 - BLOCK
      ?auto_150543 - BLOCK
      ?auto_150544 - BLOCK
      ?auto_150545 - BLOCK
      ?auto_150546 - BLOCK
    )
    :vars
    (
      ?auto_150547 - BLOCK
      ?auto_150548 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150540 ) ( ON ?auto_150541 ?auto_150540 ) ( ON ?auto_150542 ?auto_150541 ) ( not ( = ?auto_150540 ?auto_150541 ) ) ( not ( = ?auto_150540 ?auto_150542 ) ) ( not ( = ?auto_150540 ?auto_150543 ) ) ( not ( = ?auto_150540 ?auto_150544 ) ) ( not ( = ?auto_150540 ?auto_150545 ) ) ( not ( = ?auto_150540 ?auto_150546 ) ) ( not ( = ?auto_150541 ?auto_150542 ) ) ( not ( = ?auto_150541 ?auto_150543 ) ) ( not ( = ?auto_150541 ?auto_150544 ) ) ( not ( = ?auto_150541 ?auto_150545 ) ) ( not ( = ?auto_150541 ?auto_150546 ) ) ( not ( = ?auto_150542 ?auto_150543 ) ) ( not ( = ?auto_150542 ?auto_150544 ) ) ( not ( = ?auto_150542 ?auto_150545 ) ) ( not ( = ?auto_150542 ?auto_150546 ) ) ( not ( = ?auto_150543 ?auto_150544 ) ) ( not ( = ?auto_150543 ?auto_150545 ) ) ( not ( = ?auto_150543 ?auto_150546 ) ) ( not ( = ?auto_150544 ?auto_150545 ) ) ( not ( = ?auto_150544 ?auto_150546 ) ) ( not ( = ?auto_150545 ?auto_150546 ) ) ( ON ?auto_150546 ?auto_150547 ) ( not ( = ?auto_150540 ?auto_150547 ) ) ( not ( = ?auto_150541 ?auto_150547 ) ) ( not ( = ?auto_150542 ?auto_150547 ) ) ( not ( = ?auto_150543 ?auto_150547 ) ) ( not ( = ?auto_150544 ?auto_150547 ) ) ( not ( = ?auto_150545 ?auto_150547 ) ) ( not ( = ?auto_150546 ?auto_150547 ) ) ( ON ?auto_150545 ?auto_150546 ) ( ON-TABLE ?auto_150548 ) ( ON ?auto_150547 ?auto_150548 ) ( not ( = ?auto_150548 ?auto_150547 ) ) ( not ( = ?auto_150548 ?auto_150546 ) ) ( not ( = ?auto_150548 ?auto_150545 ) ) ( not ( = ?auto_150540 ?auto_150548 ) ) ( not ( = ?auto_150541 ?auto_150548 ) ) ( not ( = ?auto_150542 ?auto_150548 ) ) ( not ( = ?auto_150543 ?auto_150548 ) ) ( not ( = ?auto_150544 ?auto_150548 ) ) ( ON ?auto_150544 ?auto_150545 ) ( CLEAR ?auto_150542 ) ( ON ?auto_150543 ?auto_150544 ) ( CLEAR ?auto_150543 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_150548 ?auto_150547 ?auto_150546 ?auto_150545 ?auto_150544 )
      ( MAKE-7PILE ?auto_150540 ?auto_150541 ?auto_150542 ?auto_150543 ?auto_150544 ?auto_150545 ?auto_150546 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150549 - BLOCK
      ?auto_150550 - BLOCK
      ?auto_150551 - BLOCK
      ?auto_150552 - BLOCK
      ?auto_150553 - BLOCK
      ?auto_150554 - BLOCK
      ?auto_150555 - BLOCK
    )
    :vars
    (
      ?auto_150556 - BLOCK
      ?auto_150557 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150549 ) ( ON ?auto_150550 ?auto_150549 ) ( not ( = ?auto_150549 ?auto_150550 ) ) ( not ( = ?auto_150549 ?auto_150551 ) ) ( not ( = ?auto_150549 ?auto_150552 ) ) ( not ( = ?auto_150549 ?auto_150553 ) ) ( not ( = ?auto_150549 ?auto_150554 ) ) ( not ( = ?auto_150549 ?auto_150555 ) ) ( not ( = ?auto_150550 ?auto_150551 ) ) ( not ( = ?auto_150550 ?auto_150552 ) ) ( not ( = ?auto_150550 ?auto_150553 ) ) ( not ( = ?auto_150550 ?auto_150554 ) ) ( not ( = ?auto_150550 ?auto_150555 ) ) ( not ( = ?auto_150551 ?auto_150552 ) ) ( not ( = ?auto_150551 ?auto_150553 ) ) ( not ( = ?auto_150551 ?auto_150554 ) ) ( not ( = ?auto_150551 ?auto_150555 ) ) ( not ( = ?auto_150552 ?auto_150553 ) ) ( not ( = ?auto_150552 ?auto_150554 ) ) ( not ( = ?auto_150552 ?auto_150555 ) ) ( not ( = ?auto_150553 ?auto_150554 ) ) ( not ( = ?auto_150553 ?auto_150555 ) ) ( not ( = ?auto_150554 ?auto_150555 ) ) ( ON ?auto_150555 ?auto_150556 ) ( not ( = ?auto_150549 ?auto_150556 ) ) ( not ( = ?auto_150550 ?auto_150556 ) ) ( not ( = ?auto_150551 ?auto_150556 ) ) ( not ( = ?auto_150552 ?auto_150556 ) ) ( not ( = ?auto_150553 ?auto_150556 ) ) ( not ( = ?auto_150554 ?auto_150556 ) ) ( not ( = ?auto_150555 ?auto_150556 ) ) ( ON ?auto_150554 ?auto_150555 ) ( ON-TABLE ?auto_150557 ) ( ON ?auto_150556 ?auto_150557 ) ( not ( = ?auto_150557 ?auto_150556 ) ) ( not ( = ?auto_150557 ?auto_150555 ) ) ( not ( = ?auto_150557 ?auto_150554 ) ) ( not ( = ?auto_150549 ?auto_150557 ) ) ( not ( = ?auto_150550 ?auto_150557 ) ) ( not ( = ?auto_150551 ?auto_150557 ) ) ( not ( = ?auto_150552 ?auto_150557 ) ) ( not ( = ?auto_150553 ?auto_150557 ) ) ( ON ?auto_150553 ?auto_150554 ) ( ON ?auto_150552 ?auto_150553 ) ( CLEAR ?auto_150552 ) ( HOLDING ?auto_150551 ) ( CLEAR ?auto_150550 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_150549 ?auto_150550 ?auto_150551 )
      ( MAKE-7PILE ?auto_150549 ?auto_150550 ?auto_150551 ?auto_150552 ?auto_150553 ?auto_150554 ?auto_150555 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150558 - BLOCK
      ?auto_150559 - BLOCK
      ?auto_150560 - BLOCK
      ?auto_150561 - BLOCK
      ?auto_150562 - BLOCK
      ?auto_150563 - BLOCK
      ?auto_150564 - BLOCK
    )
    :vars
    (
      ?auto_150565 - BLOCK
      ?auto_150566 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150558 ) ( ON ?auto_150559 ?auto_150558 ) ( not ( = ?auto_150558 ?auto_150559 ) ) ( not ( = ?auto_150558 ?auto_150560 ) ) ( not ( = ?auto_150558 ?auto_150561 ) ) ( not ( = ?auto_150558 ?auto_150562 ) ) ( not ( = ?auto_150558 ?auto_150563 ) ) ( not ( = ?auto_150558 ?auto_150564 ) ) ( not ( = ?auto_150559 ?auto_150560 ) ) ( not ( = ?auto_150559 ?auto_150561 ) ) ( not ( = ?auto_150559 ?auto_150562 ) ) ( not ( = ?auto_150559 ?auto_150563 ) ) ( not ( = ?auto_150559 ?auto_150564 ) ) ( not ( = ?auto_150560 ?auto_150561 ) ) ( not ( = ?auto_150560 ?auto_150562 ) ) ( not ( = ?auto_150560 ?auto_150563 ) ) ( not ( = ?auto_150560 ?auto_150564 ) ) ( not ( = ?auto_150561 ?auto_150562 ) ) ( not ( = ?auto_150561 ?auto_150563 ) ) ( not ( = ?auto_150561 ?auto_150564 ) ) ( not ( = ?auto_150562 ?auto_150563 ) ) ( not ( = ?auto_150562 ?auto_150564 ) ) ( not ( = ?auto_150563 ?auto_150564 ) ) ( ON ?auto_150564 ?auto_150565 ) ( not ( = ?auto_150558 ?auto_150565 ) ) ( not ( = ?auto_150559 ?auto_150565 ) ) ( not ( = ?auto_150560 ?auto_150565 ) ) ( not ( = ?auto_150561 ?auto_150565 ) ) ( not ( = ?auto_150562 ?auto_150565 ) ) ( not ( = ?auto_150563 ?auto_150565 ) ) ( not ( = ?auto_150564 ?auto_150565 ) ) ( ON ?auto_150563 ?auto_150564 ) ( ON-TABLE ?auto_150566 ) ( ON ?auto_150565 ?auto_150566 ) ( not ( = ?auto_150566 ?auto_150565 ) ) ( not ( = ?auto_150566 ?auto_150564 ) ) ( not ( = ?auto_150566 ?auto_150563 ) ) ( not ( = ?auto_150558 ?auto_150566 ) ) ( not ( = ?auto_150559 ?auto_150566 ) ) ( not ( = ?auto_150560 ?auto_150566 ) ) ( not ( = ?auto_150561 ?auto_150566 ) ) ( not ( = ?auto_150562 ?auto_150566 ) ) ( ON ?auto_150562 ?auto_150563 ) ( ON ?auto_150561 ?auto_150562 ) ( CLEAR ?auto_150559 ) ( ON ?auto_150560 ?auto_150561 ) ( CLEAR ?auto_150560 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_150566 ?auto_150565 ?auto_150564 ?auto_150563 ?auto_150562 ?auto_150561 )
      ( MAKE-7PILE ?auto_150558 ?auto_150559 ?auto_150560 ?auto_150561 ?auto_150562 ?auto_150563 ?auto_150564 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150567 - BLOCK
      ?auto_150568 - BLOCK
      ?auto_150569 - BLOCK
      ?auto_150570 - BLOCK
      ?auto_150571 - BLOCK
      ?auto_150572 - BLOCK
      ?auto_150573 - BLOCK
    )
    :vars
    (
      ?auto_150575 - BLOCK
      ?auto_150574 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150567 ) ( not ( = ?auto_150567 ?auto_150568 ) ) ( not ( = ?auto_150567 ?auto_150569 ) ) ( not ( = ?auto_150567 ?auto_150570 ) ) ( not ( = ?auto_150567 ?auto_150571 ) ) ( not ( = ?auto_150567 ?auto_150572 ) ) ( not ( = ?auto_150567 ?auto_150573 ) ) ( not ( = ?auto_150568 ?auto_150569 ) ) ( not ( = ?auto_150568 ?auto_150570 ) ) ( not ( = ?auto_150568 ?auto_150571 ) ) ( not ( = ?auto_150568 ?auto_150572 ) ) ( not ( = ?auto_150568 ?auto_150573 ) ) ( not ( = ?auto_150569 ?auto_150570 ) ) ( not ( = ?auto_150569 ?auto_150571 ) ) ( not ( = ?auto_150569 ?auto_150572 ) ) ( not ( = ?auto_150569 ?auto_150573 ) ) ( not ( = ?auto_150570 ?auto_150571 ) ) ( not ( = ?auto_150570 ?auto_150572 ) ) ( not ( = ?auto_150570 ?auto_150573 ) ) ( not ( = ?auto_150571 ?auto_150572 ) ) ( not ( = ?auto_150571 ?auto_150573 ) ) ( not ( = ?auto_150572 ?auto_150573 ) ) ( ON ?auto_150573 ?auto_150575 ) ( not ( = ?auto_150567 ?auto_150575 ) ) ( not ( = ?auto_150568 ?auto_150575 ) ) ( not ( = ?auto_150569 ?auto_150575 ) ) ( not ( = ?auto_150570 ?auto_150575 ) ) ( not ( = ?auto_150571 ?auto_150575 ) ) ( not ( = ?auto_150572 ?auto_150575 ) ) ( not ( = ?auto_150573 ?auto_150575 ) ) ( ON ?auto_150572 ?auto_150573 ) ( ON-TABLE ?auto_150574 ) ( ON ?auto_150575 ?auto_150574 ) ( not ( = ?auto_150574 ?auto_150575 ) ) ( not ( = ?auto_150574 ?auto_150573 ) ) ( not ( = ?auto_150574 ?auto_150572 ) ) ( not ( = ?auto_150567 ?auto_150574 ) ) ( not ( = ?auto_150568 ?auto_150574 ) ) ( not ( = ?auto_150569 ?auto_150574 ) ) ( not ( = ?auto_150570 ?auto_150574 ) ) ( not ( = ?auto_150571 ?auto_150574 ) ) ( ON ?auto_150571 ?auto_150572 ) ( ON ?auto_150570 ?auto_150571 ) ( ON ?auto_150569 ?auto_150570 ) ( CLEAR ?auto_150569 ) ( HOLDING ?auto_150568 ) ( CLEAR ?auto_150567 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_150567 ?auto_150568 )
      ( MAKE-7PILE ?auto_150567 ?auto_150568 ?auto_150569 ?auto_150570 ?auto_150571 ?auto_150572 ?auto_150573 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150576 - BLOCK
      ?auto_150577 - BLOCK
      ?auto_150578 - BLOCK
      ?auto_150579 - BLOCK
      ?auto_150580 - BLOCK
      ?auto_150581 - BLOCK
      ?auto_150582 - BLOCK
    )
    :vars
    (
      ?auto_150583 - BLOCK
      ?auto_150584 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150576 ) ( not ( = ?auto_150576 ?auto_150577 ) ) ( not ( = ?auto_150576 ?auto_150578 ) ) ( not ( = ?auto_150576 ?auto_150579 ) ) ( not ( = ?auto_150576 ?auto_150580 ) ) ( not ( = ?auto_150576 ?auto_150581 ) ) ( not ( = ?auto_150576 ?auto_150582 ) ) ( not ( = ?auto_150577 ?auto_150578 ) ) ( not ( = ?auto_150577 ?auto_150579 ) ) ( not ( = ?auto_150577 ?auto_150580 ) ) ( not ( = ?auto_150577 ?auto_150581 ) ) ( not ( = ?auto_150577 ?auto_150582 ) ) ( not ( = ?auto_150578 ?auto_150579 ) ) ( not ( = ?auto_150578 ?auto_150580 ) ) ( not ( = ?auto_150578 ?auto_150581 ) ) ( not ( = ?auto_150578 ?auto_150582 ) ) ( not ( = ?auto_150579 ?auto_150580 ) ) ( not ( = ?auto_150579 ?auto_150581 ) ) ( not ( = ?auto_150579 ?auto_150582 ) ) ( not ( = ?auto_150580 ?auto_150581 ) ) ( not ( = ?auto_150580 ?auto_150582 ) ) ( not ( = ?auto_150581 ?auto_150582 ) ) ( ON ?auto_150582 ?auto_150583 ) ( not ( = ?auto_150576 ?auto_150583 ) ) ( not ( = ?auto_150577 ?auto_150583 ) ) ( not ( = ?auto_150578 ?auto_150583 ) ) ( not ( = ?auto_150579 ?auto_150583 ) ) ( not ( = ?auto_150580 ?auto_150583 ) ) ( not ( = ?auto_150581 ?auto_150583 ) ) ( not ( = ?auto_150582 ?auto_150583 ) ) ( ON ?auto_150581 ?auto_150582 ) ( ON-TABLE ?auto_150584 ) ( ON ?auto_150583 ?auto_150584 ) ( not ( = ?auto_150584 ?auto_150583 ) ) ( not ( = ?auto_150584 ?auto_150582 ) ) ( not ( = ?auto_150584 ?auto_150581 ) ) ( not ( = ?auto_150576 ?auto_150584 ) ) ( not ( = ?auto_150577 ?auto_150584 ) ) ( not ( = ?auto_150578 ?auto_150584 ) ) ( not ( = ?auto_150579 ?auto_150584 ) ) ( not ( = ?auto_150580 ?auto_150584 ) ) ( ON ?auto_150580 ?auto_150581 ) ( ON ?auto_150579 ?auto_150580 ) ( ON ?auto_150578 ?auto_150579 ) ( CLEAR ?auto_150576 ) ( ON ?auto_150577 ?auto_150578 ) ( CLEAR ?auto_150577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_150584 ?auto_150583 ?auto_150582 ?auto_150581 ?auto_150580 ?auto_150579 ?auto_150578 )
      ( MAKE-7PILE ?auto_150576 ?auto_150577 ?auto_150578 ?auto_150579 ?auto_150580 ?auto_150581 ?auto_150582 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150585 - BLOCK
      ?auto_150586 - BLOCK
      ?auto_150587 - BLOCK
      ?auto_150588 - BLOCK
      ?auto_150589 - BLOCK
      ?auto_150590 - BLOCK
      ?auto_150591 - BLOCK
    )
    :vars
    (
      ?auto_150593 - BLOCK
      ?auto_150592 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150585 ?auto_150586 ) ) ( not ( = ?auto_150585 ?auto_150587 ) ) ( not ( = ?auto_150585 ?auto_150588 ) ) ( not ( = ?auto_150585 ?auto_150589 ) ) ( not ( = ?auto_150585 ?auto_150590 ) ) ( not ( = ?auto_150585 ?auto_150591 ) ) ( not ( = ?auto_150586 ?auto_150587 ) ) ( not ( = ?auto_150586 ?auto_150588 ) ) ( not ( = ?auto_150586 ?auto_150589 ) ) ( not ( = ?auto_150586 ?auto_150590 ) ) ( not ( = ?auto_150586 ?auto_150591 ) ) ( not ( = ?auto_150587 ?auto_150588 ) ) ( not ( = ?auto_150587 ?auto_150589 ) ) ( not ( = ?auto_150587 ?auto_150590 ) ) ( not ( = ?auto_150587 ?auto_150591 ) ) ( not ( = ?auto_150588 ?auto_150589 ) ) ( not ( = ?auto_150588 ?auto_150590 ) ) ( not ( = ?auto_150588 ?auto_150591 ) ) ( not ( = ?auto_150589 ?auto_150590 ) ) ( not ( = ?auto_150589 ?auto_150591 ) ) ( not ( = ?auto_150590 ?auto_150591 ) ) ( ON ?auto_150591 ?auto_150593 ) ( not ( = ?auto_150585 ?auto_150593 ) ) ( not ( = ?auto_150586 ?auto_150593 ) ) ( not ( = ?auto_150587 ?auto_150593 ) ) ( not ( = ?auto_150588 ?auto_150593 ) ) ( not ( = ?auto_150589 ?auto_150593 ) ) ( not ( = ?auto_150590 ?auto_150593 ) ) ( not ( = ?auto_150591 ?auto_150593 ) ) ( ON ?auto_150590 ?auto_150591 ) ( ON-TABLE ?auto_150592 ) ( ON ?auto_150593 ?auto_150592 ) ( not ( = ?auto_150592 ?auto_150593 ) ) ( not ( = ?auto_150592 ?auto_150591 ) ) ( not ( = ?auto_150592 ?auto_150590 ) ) ( not ( = ?auto_150585 ?auto_150592 ) ) ( not ( = ?auto_150586 ?auto_150592 ) ) ( not ( = ?auto_150587 ?auto_150592 ) ) ( not ( = ?auto_150588 ?auto_150592 ) ) ( not ( = ?auto_150589 ?auto_150592 ) ) ( ON ?auto_150589 ?auto_150590 ) ( ON ?auto_150588 ?auto_150589 ) ( ON ?auto_150587 ?auto_150588 ) ( ON ?auto_150586 ?auto_150587 ) ( CLEAR ?auto_150586 ) ( HOLDING ?auto_150585 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_150585 )
      ( MAKE-7PILE ?auto_150585 ?auto_150586 ?auto_150587 ?auto_150588 ?auto_150589 ?auto_150590 ?auto_150591 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150594 - BLOCK
      ?auto_150595 - BLOCK
      ?auto_150596 - BLOCK
      ?auto_150597 - BLOCK
      ?auto_150598 - BLOCK
      ?auto_150599 - BLOCK
      ?auto_150600 - BLOCK
    )
    :vars
    (
      ?auto_150601 - BLOCK
      ?auto_150602 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150594 ?auto_150595 ) ) ( not ( = ?auto_150594 ?auto_150596 ) ) ( not ( = ?auto_150594 ?auto_150597 ) ) ( not ( = ?auto_150594 ?auto_150598 ) ) ( not ( = ?auto_150594 ?auto_150599 ) ) ( not ( = ?auto_150594 ?auto_150600 ) ) ( not ( = ?auto_150595 ?auto_150596 ) ) ( not ( = ?auto_150595 ?auto_150597 ) ) ( not ( = ?auto_150595 ?auto_150598 ) ) ( not ( = ?auto_150595 ?auto_150599 ) ) ( not ( = ?auto_150595 ?auto_150600 ) ) ( not ( = ?auto_150596 ?auto_150597 ) ) ( not ( = ?auto_150596 ?auto_150598 ) ) ( not ( = ?auto_150596 ?auto_150599 ) ) ( not ( = ?auto_150596 ?auto_150600 ) ) ( not ( = ?auto_150597 ?auto_150598 ) ) ( not ( = ?auto_150597 ?auto_150599 ) ) ( not ( = ?auto_150597 ?auto_150600 ) ) ( not ( = ?auto_150598 ?auto_150599 ) ) ( not ( = ?auto_150598 ?auto_150600 ) ) ( not ( = ?auto_150599 ?auto_150600 ) ) ( ON ?auto_150600 ?auto_150601 ) ( not ( = ?auto_150594 ?auto_150601 ) ) ( not ( = ?auto_150595 ?auto_150601 ) ) ( not ( = ?auto_150596 ?auto_150601 ) ) ( not ( = ?auto_150597 ?auto_150601 ) ) ( not ( = ?auto_150598 ?auto_150601 ) ) ( not ( = ?auto_150599 ?auto_150601 ) ) ( not ( = ?auto_150600 ?auto_150601 ) ) ( ON ?auto_150599 ?auto_150600 ) ( ON-TABLE ?auto_150602 ) ( ON ?auto_150601 ?auto_150602 ) ( not ( = ?auto_150602 ?auto_150601 ) ) ( not ( = ?auto_150602 ?auto_150600 ) ) ( not ( = ?auto_150602 ?auto_150599 ) ) ( not ( = ?auto_150594 ?auto_150602 ) ) ( not ( = ?auto_150595 ?auto_150602 ) ) ( not ( = ?auto_150596 ?auto_150602 ) ) ( not ( = ?auto_150597 ?auto_150602 ) ) ( not ( = ?auto_150598 ?auto_150602 ) ) ( ON ?auto_150598 ?auto_150599 ) ( ON ?auto_150597 ?auto_150598 ) ( ON ?auto_150596 ?auto_150597 ) ( ON ?auto_150595 ?auto_150596 ) ( ON ?auto_150594 ?auto_150595 ) ( CLEAR ?auto_150594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_150602 ?auto_150601 ?auto_150600 ?auto_150599 ?auto_150598 ?auto_150597 ?auto_150596 ?auto_150595 )
      ( MAKE-7PILE ?auto_150594 ?auto_150595 ?auto_150596 ?auto_150597 ?auto_150598 ?auto_150599 ?auto_150600 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_150604 - BLOCK
    )
    :vars
    (
      ?auto_150605 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150605 ?auto_150604 ) ( CLEAR ?auto_150605 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_150604 ) ( not ( = ?auto_150604 ?auto_150605 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_150605 ?auto_150604 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_150606 - BLOCK
    )
    :vars
    (
      ?auto_150607 - BLOCK
      ?auto_150608 - BLOCK
      ?auto_150609 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150607 ?auto_150606 ) ( CLEAR ?auto_150607 ) ( ON-TABLE ?auto_150606 ) ( not ( = ?auto_150606 ?auto_150607 ) ) ( HOLDING ?auto_150608 ) ( CLEAR ?auto_150609 ) ( not ( = ?auto_150606 ?auto_150608 ) ) ( not ( = ?auto_150606 ?auto_150609 ) ) ( not ( = ?auto_150607 ?auto_150608 ) ) ( not ( = ?auto_150607 ?auto_150609 ) ) ( not ( = ?auto_150608 ?auto_150609 ) ) )
    :subtasks
    ( ( !STACK ?auto_150608 ?auto_150609 )
      ( MAKE-1PILE ?auto_150606 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_150610 - BLOCK
    )
    :vars
    (
      ?auto_150613 - BLOCK
      ?auto_150612 - BLOCK
      ?auto_150611 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150613 ?auto_150610 ) ( ON-TABLE ?auto_150610 ) ( not ( = ?auto_150610 ?auto_150613 ) ) ( CLEAR ?auto_150612 ) ( not ( = ?auto_150610 ?auto_150611 ) ) ( not ( = ?auto_150610 ?auto_150612 ) ) ( not ( = ?auto_150613 ?auto_150611 ) ) ( not ( = ?auto_150613 ?auto_150612 ) ) ( not ( = ?auto_150611 ?auto_150612 ) ) ( ON ?auto_150611 ?auto_150613 ) ( CLEAR ?auto_150611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_150610 ?auto_150613 )
      ( MAKE-1PILE ?auto_150610 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_150614 - BLOCK
    )
    :vars
    (
      ?auto_150615 - BLOCK
      ?auto_150617 - BLOCK
      ?auto_150616 - BLOCK
      ?auto_150622 - BLOCK
      ?auto_150621 - BLOCK
      ?auto_150618 - BLOCK
      ?auto_150620 - BLOCK
      ?auto_150619 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150615 ?auto_150614 ) ( ON-TABLE ?auto_150614 ) ( not ( = ?auto_150614 ?auto_150615 ) ) ( not ( = ?auto_150614 ?auto_150617 ) ) ( not ( = ?auto_150614 ?auto_150616 ) ) ( not ( = ?auto_150615 ?auto_150617 ) ) ( not ( = ?auto_150615 ?auto_150616 ) ) ( not ( = ?auto_150617 ?auto_150616 ) ) ( ON ?auto_150617 ?auto_150615 ) ( CLEAR ?auto_150617 ) ( HOLDING ?auto_150616 ) ( CLEAR ?auto_150622 ) ( ON-TABLE ?auto_150621 ) ( ON ?auto_150618 ?auto_150621 ) ( ON ?auto_150620 ?auto_150618 ) ( ON ?auto_150619 ?auto_150620 ) ( ON ?auto_150622 ?auto_150619 ) ( not ( = ?auto_150621 ?auto_150618 ) ) ( not ( = ?auto_150621 ?auto_150620 ) ) ( not ( = ?auto_150621 ?auto_150619 ) ) ( not ( = ?auto_150621 ?auto_150622 ) ) ( not ( = ?auto_150621 ?auto_150616 ) ) ( not ( = ?auto_150618 ?auto_150620 ) ) ( not ( = ?auto_150618 ?auto_150619 ) ) ( not ( = ?auto_150618 ?auto_150622 ) ) ( not ( = ?auto_150618 ?auto_150616 ) ) ( not ( = ?auto_150620 ?auto_150619 ) ) ( not ( = ?auto_150620 ?auto_150622 ) ) ( not ( = ?auto_150620 ?auto_150616 ) ) ( not ( = ?auto_150619 ?auto_150622 ) ) ( not ( = ?auto_150619 ?auto_150616 ) ) ( not ( = ?auto_150622 ?auto_150616 ) ) ( not ( = ?auto_150614 ?auto_150622 ) ) ( not ( = ?auto_150614 ?auto_150621 ) ) ( not ( = ?auto_150614 ?auto_150618 ) ) ( not ( = ?auto_150614 ?auto_150620 ) ) ( not ( = ?auto_150614 ?auto_150619 ) ) ( not ( = ?auto_150615 ?auto_150622 ) ) ( not ( = ?auto_150615 ?auto_150621 ) ) ( not ( = ?auto_150615 ?auto_150618 ) ) ( not ( = ?auto_150615 ?auto_150620 ) ) ( not ( = ?auto_150615 ?auto_150619 ) ) ( not ( = ?auto_150617 ?auto_150622 ) ) ( not ( = ?auto_150617 ?auto_150621 ) ) ( not ( = ?auto_150617 ?auto_150618 ) ) ( not ( = ?auto_150617 ?auto_150620 ) ) ( not ( = ?auto_150617 ?auto_150619 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_150621 ?auto_150618 ?auto_150620 ?auto_150619 ?auto_150622 ?auto_150616 )
      ( MAKE-1PILE ?auto_150614 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_150623 - BLOCK
    )
    :vars
    (
      ?auto_150631 - BLOCK
      ?auto_150630 - BLOCK
      ?auto_150629 - BLOCK
      ?auto_150628 - BLOCK
      ?auto_150624 - BLOCK
      ?auto_150625 - BLOCK
      ?auto_150626 - BLOCK
      ?auto_150627 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150631 ?auto_150623 ) ( ON-TABLE ?auto_150623 ) ( not ( = ?auto_150623 ?auto_150631 ) ) ( not ( = ?auto_150623 ?auto_150630 ) ) ( not ( = ?auto_150623 ?auto_150629 ) ) ( not ( = ?auto_150631 ?auto_150630 ) ) ( not ( = ?auto_150631 ?auto_150629 ) ) ( not ( = ?auto_150630 ?auto_150629 ) ) ( ON ?auto_150630 ?auto_150631 ) ( CLEAR ?auto_150628 ) ( ON-TABLE ?auto_150624 ) ( ON ?auto_150625 ?auto_150624 ) ( ON ?auto_150626 ?auto_150625 ) ( ON ?auto_150627 ?auto_150626 ) ( ON ?auto_150628 ?auto_150627 ) ( not ( = ?auto_150624 ?auto_150625 ) ) ( not ( = ?auto_150624 ?auto_150626 ) ) ( not ( = ?auto_150624 ?auto_150627 ) ) ( not ( = ?auto_150624 ?auto_150628 ) ) ( not ( = ?auto_150624 ?auto_150629 ) ) ( not ( = ?auto_150625 ?auto_150626 ) ) ( not ( = ?auto_150625 ?auto_150627 ) ) ( not ( = ?auto_150625 ?auto_150628 ) ) ( not ( = ?auto_150625 ?auto_150629 ) ) ( not ( = ?auto_150626 ?auto_150627 ) ) ( not ( = ?auto_150626 ?auto_150628 ) ) ( not ( = ?auto_150626 ?auto_150629 ) ) ( not ( = ?auto_150627 ?auto_150628 ) ) ( not ( = ?auto_150627 ?auto_150629 ) ) ( not ( = ?auto_150628 ?auto_150629 ) ) ( not ( = ?auto_150623 ?auto_150628 ) ) ( not ( = ?auto_150623 ?auto_150624 ) ) ( not ( = ?auto_150623 ?auto_150625 ) ) ( not ( = ?auto_150623 ?auto_150626 ) ) ( not ( = ?auto_150623 ?auto_150627 ) ) ( not ( = ?auto_150631 ?auto_150628 ) ) ( not ( = ?auto_150631 ?auto_150624 ) ) ( not ( = ?auto_150631 ?auto_150625 ) ) ( not ( = ?auto_150631 ?auto_150626 ) ) ( not ( = ?auto_150631 ?auto_150627 ) ) ( not ( = ?auto_150630 ?auto_150628 ) ) ( not ( = ?auto_150630 ?auto_150624 ) ) ( not ( = ?auto_150630 ?auto_150625 ) ) ( not ( = ?auto_150630 ?auto_150626 ) ) ( not ( = ?auto_150630 ?auto_150627 ) ) ( ON ?auto_150629 ?auto_150630 ) ( CLEAR ?auto_150629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_150623 ?auto_150631 ?auto_150630 )
      ( MAKE-1PILE ?auto_150623 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_150632 - BLOCK
    )
    :vars
    (
      ?auto_150639 - BLOCK
      ?auto_150635 - BLOCK
      ?auto_150633 - BLOCK
      ?auto_150640 - BLOCK
      ?auto_150634 - BLOCK
      ?auto_150636 - BLOCK
      ?auto_150638 - BLOCK
      ?auto_150637 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150639 ?auto_150632 ) ( ON-TABLE ?auto_150632 ) ( not ( = ?auto_150632 ?auto_150639 ) ) ( not ( = ?auto_150632 ?auto_150635 ) ) ( not ( = ?auto_150632 ?auto_150633 ) ) ( not ( = ?auto_150639 ?auto_150635 ) ) ( not ( = ?auto_150639 ?auto_150633 ) ) ( not ( = ?auto_150635 ?auto_150633 ) ) ( ON ?auto_150635 ?auto_150639 ) ( ON-TABLE ?auto_150640 ) ( ON ?auto_150634 ?auto_150640 ) ( ON ?auto_150636 ?auto_150634 ) ( ON ?auto_150638 ?auto_150636 ) ( not ( = ?auto_150640 ?auto_150634 ) ) ( not ( = ?auto_150640 ?auto_150636 ) ) ( not ( = ?auto_150640 ?auto_150638 ) ) ( not ( = ?auto_150640 ?auto_150637 ) ) ( not ( = ?auto_150640 ?auto_150633 ) ) ( not ( = ?auto_150634 ?auto_150636 ) ) ( not ( = ?auto_150634 ?auto_150638 ) ) ( not ( = ?auto_150634 ?auto_150637 ) ) ( not ( = ?auto_150634 ?auto_150633 ) ) ( not ( = ?auto_150636 ?auto_150638 ) ) ( not ( = ?auto_150636 ?auto_150637 ) ) ( not ( = ?auto_150636 ?auto_150633 ) ) ( not ( = ?auto_150638 ?auto_150637 ) ) ( not ( = ?auto_150638 ?auto_150633 ) ) ( not ( = ?auto_150637 ?auto_150633 ) ) ( not ( = ?auto_150632 ?auto_150637 ) ) ( not ( = ?auto_150632 ?auto_150640 ) ) ( not ( = ?auto_150632 ?auto_150634 ) ) ( not ( = ?auto_150632 ?auto_150636 ) ) ( not ( = ?auto_150632 ?auto_150638 ) ) ( not ( = ?auto_150639 ?auto_150637 ) ) ( not ( = ?auto_150639 ?auto_150640 ) ) ( not ( = ?auto_150639 ?auto_150634 ) ) ( not ( = ?auto_150639 ?auto_150636 ) ) ( not ( = ?auto_150639 ?auto_150638 ) ) ( not ( = ?auto_150635 ?auto_150637 ) ) ( not ( = ?auto_150635 ?auto_150640 ) ) ( not ( = ?auto_150635 ?auto_150634 ) ) ( not ( = ?auto_150635 ?auto_150636 ) ) ( not ( = ?auto_150635 ?auto_150638 ) ) ( ON ?auto_150633 ?auto_150635 ) ( CLEAR ?auto_150633 ) ( HOLDING ?auto_150637 ) ( CLEAR ?auto_150638 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_150640 ?auto_150634 ?auto_150636 ?auto_150638 ?auto_150637 )
      ( MAKE-1PILE ?auto_150632 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_150641 - BLOCK
    )
    :vars
    (
      ?auto_150645 - BLOCK
      ?auto_150648 - BLOCK
      ?auto_150647 - BLOCK
      ?auto_150642 - BLOCK
      ?auto_150649 - BLOCK
      ?auto_150644 - BLOCK
      ?auto_150643 - BLOCK
      ?auto_150646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150645 ?auto_150641 ) ( ON-TABLE ?auto_150641 ) ( not ( = ?auto_150641 ?auto_150645 ) ) ( not ( = ?auto_150641 ?auto_150648 ) ) ( not ( = ?auto_150641 ?auto_150647 ) ) ( not ( = ?auto_150645 ?auto_150648 ) ) ( not ( = ?auto_150645 ?auto_150647 ) ) ( not ( = ?auto_150648 ?auto_150647 ) ) ( ON ?auto_150648 ?auto_150645 ) ( ON-TABLE ?auto_150642 ) ( ON ?auto_150649 ?auto_150642 ) ( ON ?auto_150644 ?auto_150649 ) ( ON ?auto_150643 ?auto_150644 ) ( not ( = ?auto_150642 ?auto_150649 ) ) ( not ( = ?auto_150642 ?auto_150644 ) ) ( not ( = ?auto_150642 ?auto_150643 ) ) ( not ( = ?auto_150642 ?auto_150646 ) ) ( not ( = ?auto_150642 ?auto_150647 ) ) ( not ( = ?auto_150649 ?auto_150644 ) ) ( not ( = ?auto_150649 ?auto_150643 ) ) ( not ( = ?auto_150649 ?auto_150646 ) ) ( not ( = ?auto_150649 ?auto_150647 ) ) ( not ( = ?auto_150644 ?auto_150643 ) ) ( not ( = ?auto_150644 ?auto_150646 ) ) ( not ( = ?auto_150644 ?auto_150647 ) ) ( not ( = ?auto_150643 ?auto_150646 ) ) ( not ( = ?auto_150643 ?auto_150647 ) ) ( not ( = ?auto_150646 ?auto_150647 ) ) ( not ( = ?auto_150641 ?auto_150646 ) ) ( not ( = ?auto_150641 ?auto_150642 ) ) ( not ( = ?auto_150641 ?auto_150649 ) ) ( not ( = ?auto_150641 ?auto_150644 ) ) ( not ( = ?auto_150641 ?auto_150643 ) ) ( not ( = ?auto_150645 ?auto_150646 ) ) ( not ( = ?auto_150645 ?auto_150642 ) ) ( not ( = ?auto_150645 ?auto_150649 ) ) ( not ( = ?auto_150645 ?auto_150644 ) ) ( not ( = ?auto_150645 ?auto_150643 ) ) ( not ( = ?auto_150648 ?auto_150646 ) ) ( not ( = ?auto_150648 ?auto_150642 ) ) ( not ( = ?auto_150648 ?auto_150649 ) ) ( not ( = ?auto_150648 ?auto_150644 ) ) ( not ( = ?auto_150648 ?auto_150643 ) ) ( ON ?auto_150647 ?auto_150648 ) ( CLEAR ?auto_150643 ) ( ON ?auto_150646 ?auto_150647 ) ( CLEAR ?auto_150646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_150641 ?auto_150645 ?auto_150648 ?auto_150647 )
      ( MAKE-1PILE ?auto_150641 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_150650 - BLOCK
    )
    :vars
    (
      ?auto_150656 - BLOCK
      ?auto_150655 - BLOCK
      ?auto_150654 - BLOCK
      ?auto_150657 - BLOCK
      ?auto_150658 - BLOCK
      ?auto_150652 - BLOCK
      ?auto_150651 - BLOCK
      ?auto_150653 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150656 ?auto_150650 ) ( ON-TABLE ?auto_150650 ) ( not ( = ?auto_150650 ?auto_150656 ) ) ( not ( = ?auto_150650 ?auto_150655 ) ) ( not ( = ?auto_150650 ?auto_150654 ) ) ( not ( = ?auto_150656 ?auto_150655 ) ) ( not ( = ?auto_150656 ?auto_150654 ) ) ( not ( = ?auto_150655 ?auto_150654 ) ) ( ON ?auto_150655 ?auto_150656 ) ( ON-TABLE ?auto_150657 ) ( ON ?auto_150658 ?auto_150657 ) ( ON ?auto_150652 ?auto_150658 ) ( not ( = ?auto_150657 ?auto_150658 ) ) ( not ( = ?auto_150657 ?auto_150652 ) ) ( not ( = ?auto_150657 ?auto_150651 ) ) ( not ( = ?auto_150657 ?auto_150653 ) ) ( not ( = ?auto_150657 ?auto_150654 ) ) ( not ( = ?auto_150658 ?auto_150652 ) ) ( not ( = ?auto_150658 ?auto_150651 ) ) ( not ( = ?auto_150658 ?auto_150653 ) ) ( not ( = ?auto_150658 ?auto_150654 ) ) ( not ( = ?auto_150652 ?auto_150651 ) ) ( not ( = ?auto_150652 ?auto_150653 ) ) ( not ( = ?auto_150652 ?auto_150654 ) ) ( not ( = ?auto_150651 ?auto_150653 ) ) ( not ( = ?auto_150651 ?auto_150654 ) ) ( not ( = ?auto_150653 ?auto_150654 ) ) ( not ( = ?auto_150650 ?auto_150653 ) ) ( not ( = ?auto_150650 ?auto_150657 ) ) ( not ( = ?auto_150650 ?auto_150658 ) ) ( not ( = ?auto_150650 ?auto_150652 ) ) ( not ( = ?auto_150650 ?auto_150651 ) ) ( not ( = ?auto_150656 ?auto_150653 ) ) ( not ( = ?auto_150656 ?auto_150657 ) ) ( not ( = ?auto_150656 ?auto_150658 ) ) ( not ( = ?auto_150656 ?auto_150652 ) ) ( not ( = ?auto_150656 ?auto_150651 ) ) ( not ( = ?auto_150655 ?auto_150653 ) ) ( not ( = ?auto_150655 ?auto_150657 ) ) ( not ( = ?auto_150655 ?auto_150658 ) ) ( not ( = ?auto_150655 ?auto_150652 ) ) ( not ( = ?auto_150655 ?auto_150651 ) ) ( ON ?auto_150654 ?auto_150655 ) ( ON ?auto_150653 ?auto_150654 ) ( CLEAR ?auto_150653 ) ( HOLDING ?auto_150651 ) ( CLEAR ?auto_150652 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_150657 ?auto_150658 ?auto_150652 ?auto_150651 )
      ( MAKE-1PILE ?auto_150650 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_150659 - BLOCK
    )
    :vars
    (
      ?auto_150661 - BLOCK
      ?auto_150667 - BLOCK
      ?auto_150662 - BLOCK
      ?auto_150663 - BLOCK
      ?auto_150666 - BLOCK
      ?auto_150664 - BLOCK
      ?auto_150665 - BLOCK
      ?auto_150660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150661 ?auto_150659 ) ( ON-TABLE ?auto_150659 ) ( not ( = ?auto_150659 ?auto_150661 ) ) ( not ( = ?auto_150659 ?auto_150667 ) ) ( not ( = ?auto_150659 ?auto_150662 ) ) ( not ( = ?auto_150661 ?auto_150667 ) ) ( not ( = ?auto_150661 ?auto_150662 ) ) ( not ( = ?auto_150667 ?auto_150662 ) ) ( ON ?auto_150667 ?auto_150661 ) ( ON-TABLE ?auto_150663 ) ( ON ?auto_150666 ?auto_150663 ) ( ON ?auto_150664 ?auto_150666 ) ( not ( = ?auto_150663 ?auto_150666 ) ) ( not ( = ?auto_150663 ?auto_150664 ) ) ( not ( = ?auto_150663 ?auto_150665 ) ) ( not ( = ?auto_150663 ?auto_150660 ) ) ( not ( = ?auto_150663 ?auto_150662 ) ) ( not ( = ?auto_150666 ?auto_150664 ) ) ( not ( = ?auto_150666 ?auto_150665 ) ) ( not ( = ?auto_150666 ?auto_150660 ) ) ( not ( = ?auto_150666 ?auto_150662 ) ) ( not ( = ?auto_150664 ?auto_150665 ) ) ( not ( = ?auto_150664 ?auto_150660 ) ) ( not ( = ?auto_150664 ?auto_150662 ) ) ( not ( = ?auto_150665 ?auto_150660 ) ) ( not ( = ?auto_150665 ?auto_150662 ) ) ( not ( = ?auto_150660 ?auto_150662 ) ) ( not ( = ?auto_150659 ?auto_150660 ) ) ( not ( = ?auto_150659 ?auto_150663 ) ) ( not ( = ?auto_150659 ?auto_150666 ) ) ( not ( = ?auto_150659 ?auto_150664 ) ) ( not ( = ?auto_150659 ?auto_150665 ) ) ( not ( = ?auto_150661 ?auto_150660 ) ) ( not ( = ?auto_150661 ?auto_150663 ) ) ( not ( = ?auto_150661 ?auto_150666 ) ) ( not ( = ?auto_150661 ?auto_150664 ) ) ( not ( = ?auto_150661 ?auto_150665 ) ) ( not ( = ?auto_150667 ?auto_150660 ) ) ( not ( = ?auto_150667 ?auto_150663 ) ) ( not ( = ?auto_150667 ?auto_150666 ) ) ( not ( = ?auto_150667 ?auto_150664 ) ) ( not ( = ?auto_150667 ?auto_150665 ) ) ( ON ?auto_150662 ?auto_150667 ) ( ON ?auto_150660 ?auto_150662 ) ( CLEAR ?auto_150664 ) ( ON ?auto_150665 ?auto_150660 ) ( CLEAR ?auto_150665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_150659 ?auto_150661 ?auto_150667 ?auto_150662 ?auto_150660 )
      ( MAKE-1PILE ?auto_150659 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_150668 - BLOCK
    )
    :vars
    (
      ?auto_150675 - BLOCK
      ?auto_150674 - BLOCK
      ?auto_150669 - BLOCK
      ?auto_150672 - BLOCK
      ?auto_150673 - BLOCK
      ?auto_150670 - BLOCK
      ?auto_150671 - BLOCK
      ?auto_150676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150675 ?auto_150668 ) ( ON-TABLE ?auto_150668 ) ( not ( = ?auto_150668 ?auto_150675 ) ) ( not ( = ?auto_150668 ?auto_150674 ) ) ( not ( = ?auto_150668 ?auto_150669 ) ) ( not ( = ?auto_150675 ?auto_150674 ) ) ( not ( = ?auto_150675 ?auto_150669 ) ) ( not ( = ?auto_150674 ?auto_150669 ) ) ( ON ?auto_150674 ?auto_150675 ) ( ON-TABLE ?auto_150672 ) ( ON ?auto_150673 ?auto_150672 ) ( not ( = ?auto_150672 ?auto_150673 ) ) ( not ( = ?auto_150672 ?auto_150670 ) ) ( not ( = ?auto_150672 ?auto_150671 ) ) ( not ( = ?auto_150672 ?auto_150676 ) ) ( not ( = ?auto_150672 ?auto_150669 ) ) ( not ( = ?auto_150673 ?auto_150670 ) ) ( not ( = ?auto_150673 ?auto_150671 ) ) ( not ( = ?auto_150673 ?auto_150676 ) ) ( not ( = ?auto_150673 ?auto_150669 ) ) ( not ( = ?auto_150670 ?auto_150671 ) ) ( not ( = ?auto_150670 ?auto_150676 ) ) ( not ( = ?auto_150670 ?auto_150669 ) ) ( not ( = ?auto_150671 ?auto_150676 ) ) ( not ( = ?auto_150671 ?auto_150669 ) ) ( not ( = ?auto_150676 ?auto_150669 ) ) ( not ( = ?auto_150668 ?auto_150676 ) ) ( not ( = ?auto_150668 ?auto_150672 ) ) ( not ( = ?auto_150668 ?auto_150673 ) ) ( not ( = ?auto_150668 ?auto_150670 ) ) ( not ( = ?auto_150668 ?auto_150671 ) ) ( not ( = ?auto_150675 ?auto_150676 ) ) ( not ( = ?auto_150675 ?auto_150672 ) ) ( not ( = ?auto_150675 ?auto_150673 ) ) ( not ( = ?auto_150675 ?auto_150670 ) ) ( not ( = ?auto_150675 ?auto_150671 ) ) ( not ( = ?auto_150674 ?auto_150676 ) ) ( not ( = ?auto_150674 ?auto_150672 ) ) ( not ( = ?auto_150674 ?auto_150673 ) ) ( not ( = ?auto_150674 ?auto_150670 ) ) ( not ( = ?auto_150674 ?auto_150671 ) ) ( ON ?auto_150669 ?auto_150674 ) ( ON ?auto_150676 ?auto_150669 ) ( ON ?auto_150671 ?auto_150676 ) ( CLEAR ?auto_150671 ) ( HOLDING ?auto_150670 ) ( CLEAR ?auto_150673 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_150672 ?auto_150673 ?auto_150670 )
      ( MAKE-1PILE ?auto_150668 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_150677 - BLOCK
    )
    :vars
    (
      ?auto_150683 - BLOCK
      ?auto_150684 - BLOCK
      ?auto_150678 - BLOCK
      ?auto_150681 - BLOCK
      ?auto_150682 - BLOCK
      ?auto_150680 - BLOCK
      ?auto_150679 - BLOCK
      ?auto_150685 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150683 ?auto_150677 ) ( ON-TABLE ?auto_150677 ) ( not ( = ?auto_150677 ?auto_150683 ) ) ( not ( = ?auto_150677 ?auto_150684 ) ) ( not ( = ?auto_150677 ?auto_150678 ) ) ( not ( = ?auto_150683 ?auto_150684 ) ) ( not ( = ?auto_150683 ?auto_150678 ) ) ( not ( = ?auto_150684 ?auto_150678 ) ) ( ON ?auto_150684 ?auto_150683 ) ( ON-TABLE ?auto_150681 ) ( ON ?auto_150682 ?auto_150681 ) ( not ( = ?auto_150681 ?auto_150682 ) ) ( not ( = ?auto_150681 ?auto_150680 ) ) ( not ( = ?auto_150681 ?auto_150679 ) ) ( not ( = ?auto_150681 ?auto_150685 ) ) ( not ( = ?auto_150681 ?auto_150678 ) ) ( not ( = ?auto_150682 ?auto_150680 ) ) ( not ( = ?auto_150682 ?auto_150679 ) ) ( not ( = ?auto_150682 ?auto_150685 ) ) ( not ( = ?auto_150682 ?auto_150678 ) ) ( not ( = ?auto_150680 ?auto_150679 ) ) ( not ( = ?auto_150680 ?auto_150685 ) ) ( not ( = ?auto_150680 ?auto_150678 ) ) ( not ( = ?auto_150679 ?auto_150685 ) ) ( not ( = ?auto_150679 ?auto_150678 ) ) ( not ( = ?auto_150685 ?auto_150678 ) ) ( not ( = ?auto_150677 ?auto_150685 ) ) ( not ( = ?auto_150677 ?auto_150681 ) ) ( not ( = ?auto_150677 ?auto_150682 ) ) ( not ( = ?auto_150677 ?auto_150680 ) ) ( not ( = ?auto_150677 ?auto_150679 ) ) ( not ( = ?auto_150683 ?auto_150685 ) ) ( not ( = ?auto_150683 ?auto_150681 ) ) ( not ( = ?auto_150683 ?auto_150682 ) ) ( not ( = ?auto_150683 ?auto_150680 ) ) ( not ( = ?auto_150683 ?auto_150679 ) ) ( not ( = ?auto_150684 ?auto_150685 ) ) ( not ( = ?auto_150684 ?auto_150681 ) ) ( not ( = ?auto_150684 ?auto_150682 ) ) ( not ( = ?auto_150684 ?auto_150680 ) ) ( not ( = ?auto_150684 ?auto_150679 ) ) ( ON ?auto_150678 ?auto_150684 ) ( ON ?auto_150685 ?auto_150678 ) ( ON ?auto_150679 ?auto_150685 ) ( CLEAR ?auto_150682 ) ( ON ?auto_150680 ?auto_150679 ) ( CLEAR ?auto_150680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_150677 ?auto_150683 ?auto_150684 ?auto_150678 ?auto_150685 ?auto_150679 )
      ( MAKE-1PILE ?auto_150677 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_150686 - BLOCK
    )
    :vars
    (
      ?auto_150692 - BLOCK
      ?auto_150690 - BLOCK
      ?auto_150694 - BLOCK
      ?auto_150687 - BLOCK
      ?auto_150693 - BLOCK
      ?auto_150688 - BLOCK
      ?auto_150689 - BLOCK
      ?auto_150691 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150692 ?auto_150686 ) ( ON-TABLE ?auto_150686 ) ( not ( = ?auto_150686 ?auto_150692 ) ) ( not ( = ?auto_150686 ?auto_150690 ) ) ( not ( = ?auto_150686 ?auto_150694 ) ) ( not ( = ?auto_150692 ?auto_150690 ) ) ( not ( = ?auto_150692 ?auto_150694 ) ) ( not ( = ?auto_150690 ?auto_150694 ) ) ( ON ?auto_150690 ?auto_150692 ) ( ON-TABLE ?auto_150687 ) ( not ( = ?auto_150687 ?auto_150693 ) ) ( not ( = ?auto_150687 ?auto_150688 ) ) ( not ( = ?auto_150687 ?auto_150689 ) ) ( not ( = ?auto_150687 ?auto_150691 ) ) ( not ( = ?auto_150687 ?auto_150694 ) ) ( not ( = ?auto_150693 ?auto_150688 ) ) ( not ( = ?auto_150693 ?auto_150689 ) ) ( not ( = ?auto_150693 ?auto_150691 ) ) ( not ( = ?auto_150693 ?auto_150694 ) ) ( not ( = ?auto_150688 ?auto_150689 ) ) ( not ( = ?auto_150688 ?auto_150691 ) ) ( not ( = ?auto_150688 ?auto_150694 ) ) ( not ( = ?auto_150689 ?auto_150691 ) ) ( not ( = ?auto_150689 ?auto_150694 ) ) ( not ( = ?auto_150691 ?auto_150694 ) ) ( not ( = ?auto_150686 ?auto_150691 ) ) ( not ( = ?auto_150686 ?auto_150687 ) ) ( not ( = ?auto_150686 ?auto_150693 ) ) ( not ( = ?auto_150686 ?auto_150688 ) ) ( not ( = ?auto_150686 ?auto_150689 ) ) ( not ( = ?auto_150692 ?auto_150691 ) ) ( not ( = ?auto_150692 ?auto_150687 ) ) ( not ( = ?auto_150692 ?auto_150693 ) ) ( not ( = ?auto_150692 ?auto_150688 ) ) ( not ( = ?auto_150692 ?auto_150689 ) ) ( not ( = ?auto_150690 ?auto_150691 ) ) ( not ( = ?auto_150690 ?auto_150687 ) ) ( not ( = ?auto_150690 ?auto_150693 ) ) ( not ( = ?auto_150690 ?auto_150688 ) ) ( not ( = ?auto_150690 ?auto_150689 ) ) ( ON ?auto_150694 ?auto_150690 ) ( ON ?auto_150691 ?auto_150694 ) ( ON ?auto_150689 ?auto_150691 ) ( ON ?auto_150688 ?auto_150689 ) ( CLEAR ?auto_150688 ) ( HOLDING ?auto_150693 ) ( CLEAR ?auto_150687 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_150687 ?auto_150693 )
      ( MAKE-1PILE ?auto_150686 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_150695 - BLOCK
    )
    :vars
    (
      ?auto_150701 - BLOCK
      ?auto_150698 - BLOCK
      ?auto_150702 - BLOCK
      ?auto_150703 - BLOCK
      ?auto_150699 - BLOCK
      ?auto_150696 - BLOCK
      ?auto_150697 - BLOCK
      ?auto_150700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150701 ?auto_150695 ) ( ON-TABLE ?auto_150695 ) ( not ( = ?auto_150695 ?auto_150701 ) ) ( not ( = ?auto_150695 ?auto_150698 ) ) ( not ( = ?auto_150695 ?auto_150702 ) ) ( not ( = ?auto_150701 ?auto_150698 ) ) ( not ( = ?auto_150701 ?auto_150702 ) ) ( not ( = ?auto_150698 ?auto_150702 ) ) ( ON ?auto_150698 ?auto_150701 ) ( ON-TABLE ?auto_150703 ) ( not ( = ?auto_150703 ?auto_150699 ) ) ( not ( = ?auto_150703 ?auto_150696 ) ) ( not ( = ?auto_150703 ?auto_150697 ) ) ( not ( = ?auto_150703 ?auto_150700 ) ) ( not ( = ?auto_150703 ?auto_150702 ) ) ( not ( = ?auto_150699 ?auto_150696 ) ) ( not ( = ?auto_150699 ?auto_150697 ) ) ( not ( = ?auto_150699 ?auto_150700 ) ) ( not ( = ?auto_150699 ?auto_150702 ) ) ( not ( = ?auto_150696 ?auto_150697 ) ) ( not ( = ?auto_150696 ?auto_150700 ) ) ( not ( = ?auto_150696 ?auto_150702 ) ) ( not ( = ?auto_150697 ?auto_150700 ) ) ( not ( = ?auto_150697 ?auto_150702 ) ) ( not ( = ?auto_150700 ?auto_150702 ) ) ( not ( = ?auto_150695 ?auto_150700 ) ) ( not ( = ?auto_150695 ?auto_150703 ) ) ( not ( = ?auto_150695 ?auto_150699 ) ) ( not ( = ?auto_150695 ?auto_150696 ) ) ( not ( = ?auto_150695 ?auto_150697 ) ) ( not ( = ?auto_150701 ?auto_150700 ) ) ( not ( = ?auto_150701 ?auto_150703 ) ) ( not ( = ?auto_150701 ?auto_150699 ) ) ( not ( = ?auto_150701 ?auto_150696 ) ) ( not ( = ?auto_150701 ?auto_150697 ) ) ( not ( = ?auto_150698 ?auto_150700 ) ) ( not ( = ?auto_150698 ?auto_150703 ) ) ( not ( = ?auto_150698 ?auto_150699 ) ) ( not ( = ?auto_150698 ?auto_150696 ) ) ( not ( = ?auto_150698 ?auto_150697 ) ) ( ON ?auto_150702 ?auto_150698 ) ( ON ?auto_150700 ?auto_150702 ) ( ON ?auto_150697 ?auto_150700 ) ( ON ?auto_150696 ?auto_150697 ) ( CLEAR ?auto_150703 ) ( ON ?auto_150699 ?auto_150696 ) ( CLEAR ?auto_150699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_150695 ?auto_150701 ?auto_150698 ?auto_150702 ?auto_150700 ?auto_150697 ?auto_150696 )
      ( MAKE-1PILE ?auto_150695 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_150704 - BLOCK
    )
    :vars
    (
      ?auto_150712 - BLOCK
      ?auto_150706 - BLOCK
      ?auto_150709 - BLOCK
      ?auto_150707 - BLOCK
      ?auto_150705 - BLOCK
      ?auto_150710 - BLOCK
      ?auto_150711 - BLOCK
      ?auto_150708 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150712 ?auto_150704 ) ( ON-TABLE ?auto_150704 ) ( not ( = ?auto_150704 ?auto_150712 ) ) ( not ( = ?auto_150704 ?auto_150706 ) ) ( not ( = ?auto_150704 ?auto_150709 ) ) ( not ( = ?auto_150712 ?auto_150706 ) ) ( not ( = ?auto_150712 ?auto_150709 ) ) ( not ( = ?auto_150706 ?auto_150709 ) ) ( ON ?auto_150706 ?auto_150712 ) ( not ( = ?auto_150707 ?auto_150705 ) ) ( not ( = ?auto_150707 ?auto_150710 ) ) ( not ( = ?auto_150707 ?auto_150711 ) ) ( not ( = ?auto_150707 ?auto_150708 ) ) ( not ( = ?auto_150707 ?auto_150709 ) ) ( not ( = ?auto_150705 ?auto_150710 ) ) ( not ( = ?auto_150705 ?auto_150711 ) ) ( not ( = ?auto_150705 ?auto_150708 ) ) ( not ( = ?auto_150705 ?auto_150709 ) ) ( not ( = ?auto_150710 ?auto_150711 ) ) ( not ( = ?auto_150710 ?auto_150708 ) ) ( not ( = ?auto_150710 ?auto_150709 ) ) ( not ( = ?auto_150711 ?auto_150708 ) ) ( not ( = ?auto_150711 ?auto_150709 ) ) ( not ( = ?auto_150708 ?auto_150709 ) ) ( not ( = ?auto_150704 ?auto_150708 ) ) ( not ( = ?auto_150704 ?auto_150707 ) ) ( not ( = ?auto_150704 ?auto_150705 ) ) ( not ( = ?auto_150704 ?auto_150710 ) ) ( not ( = ?auto_150704 ?auto_150711 ) ) ( not ( = ?auto_150712 ?auto_150708 ) ) ( not ( = ?auto_150712 ?auto_150707 ) ) ( not ( = ?auto_150712 ?auto_150705 ) ) ( not ( = ?auto_150712 ?auto_150710 ) ) ( not ( = ?auto_150712 ?auto_150711 ) ) ( not ( = ?auto_150706 ?auto_150708 ) ) ( not ( = ?auto_150706 ?auto_150707 ) ) ( not ( = ?auto_150706 ?auto_150705 ) ) ( not ( = ?auto_150706 ?auto_150710 ) ) ( not ( = ?auto_150706 ?auto_150711 ) ) ( ON ?auto_150709 ?auto_150706 ) ( ON ?auto_150708 ?auto_150709 ) ( ON ?auto_150711 ?auto_150708 ) ( ON ?auto_150710 ?auto_150711 ) ( ON ?auto_150705 ?auto_150710 ) ( CLEAR ?auto_150705 ) ( HOLDING ?auto_150707 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_150707 )
      ( MAKE-1PILE ?auto_150704 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_150713 - BLOCK
    )
    :vars
    (
      ?auto_150721 - BLOCK
      ?auto_150717 - BLOCK
      ?auto_150715 - BLOCK
      ?auto_150714 - BLOCK
      ?auto_150719 - BLOCK
      ?auto_150716 - BLOCK
      ?auto_150718 - BLOCK
      ?auto_150720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150721 ?auto_150713 ) ( ON-TABLE ?auto_150713 ) ( not ( = ?auto_150713 ?auto_150721 ) ) ( not ( = ?auto_150713 ?auto_150717 ) ) ( not ( = ?auto_150713 ?auto_150715 ) ) ( not ( = ?auto_150721 ?auto_150717 ) ) ( not ( = ?auto_150721 ?auto_150715 ) ) ( not ( = ?auto_150717 ?auto_150715 ) ) ( ON ?auto_150717 ?auto_150721 ) ( not ( = ?auto_150714 ?auto_150719 ) ) ( not ( = ?auto_150714 ?auto_150716 ) ) ( not ( = ?auto_150714 ?auto_150718 ) ) ( not ( = ?auto_150714 ?auto_150720 ) ) ( not ( = ?auto_150714 ?auto_150715 ) ) ( not ( = ?auto_150719 ?auto_150716 ) ) ( not ( = ?auto_150719 ?auto_150718 ) ) ( not ( = ?auto_150719 ?auto_150720 ) ) ( not ( = ?auto_150719 ?auto_150715 ) ) ( not ( = ?auto_150716 ?auto_150718 ) ) ( not ( = ?auto_150716 ?auto_150720 ) ) ( not ( = ?auto_150716 ?auto_150715 ) ) ( not ( = ?auto_150718 ?auto_150720 ) ) ( not ( = ?auto_150718 ?auto_150715 ) ) ( not ( = ?auto_150720 ?auto_150715 ) ) ( not ( = ?auto_150713 ?auto_150720 ) ) ( not ( = ?auto_150713 ?auto_150714 ) ) ( not ( = ?auto_150713 ?auto_150719 ) ) ( not ( = ?auto_150713 ?auto_150716 ) ) ( not ( = ?auto_150713 ?auto_150718 ) ) ( not ( = ?auto_150721 ?auto_150720 ) ) ( not ( = ?auto_150721 ?auto_150714 ) ) ( not ( = ?auto_150721 ?auto_150719 ) ) ( not ( = ?auto_150721 ?auto_150716 ) ) ( not ( = ?auto_150721 ?auto_150718 ) ) ( not ( = ?auto_150717 ?auto_150720 ) ) ( not ( = ?auto_150717 ?auto_150714 ) ) ( not ( = ?auto_150717 ?auto_150719 ) ) ( not ( = ?auto_150717 ?auto_150716 ) ) ( not ( = ?auto_150717 ?auto_150718 ) ) ( ON ?auto_150715 ?auto_150717 ) ( ON ?auto_150720 ?auto_150715 ) ( ON ?auto_150718 ?auto_150720 ) ( ON ?auto_150716 ?auto_150718 ) ( ON ?auto_150719 ?auto_150716 ) ( ON ?auto_150714 ?auto_150719 ) ( CLEAR ?auto_150714 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_150713 ?auto_150721 ?auto_150717 ?auto_150715 ?auto_150720 ?auto_150718 ?auto_150716 ?auto_150719 )
      ( MAKE-1PILE ?auto_150713 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150730 - BLOCK
      ?auto_150731 - BLOCK
      ?auto_150732 - BLOCK
      ?auto_150733 - BLOCK
      ?auto_150734 - BLOCK
      ?auto_150735 - BLOCK
      ?auto_150736 - BLOCK
      ?auto_150737 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_150737 ) ( CLEAR ?auto_150736 ) ( ON-TABLE ?auto_150730 ) ( ON ?auto_150731 ?auto_150730 ) ( ON ?auto_150732 ?auto_150731 ) ( ON ?auto_150733 ?auto_150732 ) ( ON ?auto_150734 ?auto_150733 ) ( ON ?auto_150735 ?auto_150734 ) ( ON ?auto_150736 ?auto_150735 ) ( not ( = ?auto_150730 ?auto_150731 ) ) ( not ( = ?auto_150730 ?auto_150732 ) ) ( not ( = ?auto_150730 ?auto_150733 ) ) ( not ( = ?auto_150730 ?auto_150734 ) ) ( not ( = ?auto_150730 ?auto_150735 ) ) ( not ( = ?auto_150730 ?auto_150736 ) ) ( not ( = ?auto_150730 ?auto_150737 ) ) ( not ( = ?auto_150731 ?auto_150732 ) ) ( not ( = ?auto_150731 ?auto_150733 ) ) ( not ( = ?auto_150731 ?auto_150734 ) ) ( not ( = ?auto_150731 ?auto_150735 ) ) ( not ( = ?auto_150731 ?auto_150736 ) ) ( not ( = ?auto_150731 ?auto_150737 ) ) ( not ( = ?auto_150732 ?auto_150733 ) ) ( not ( = ?auto_150732 ?auto_150734 ) ) ( not ( = ?auto_150732 ?auto_150735 ) ) ( not ( = ?auto_150732 ?auto_150736 ) ) ( not ( = ?auto_150732 ?auto_150737 ) ) ( not ( = ?auto_150733 ?auto_150734 ) ) ( not ( = ?auto_150733 ?auto_150735 ) ) ( not ( = ?auto_150733 ?auto_150736 ) ) ( not ( = ?auto_150733 ?auto_150737 ) ) ( not ( = ?auto_150734 ?auto_150735 ) ) ( not ( = ?auto_150734 ?auto_150736 ) ) ( not ( = ?auto_150734 ?auto_150737 ) ) ( not ( = ?auto_150735 ?auto_150736 ) ) ( not ( = ?auto_150735 ?auto_150737 ) ) ( not ( = ?auto_150736 ?auto_150737 ) ) )
    :subtasks
    ( ( !STACK ?auto_150737 ?auto_150736 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150738 - BLOCK
      ?auto_150739 - BLOCK
      ?auto_150740 - BLOCK
      ?auto_150741 - BLOCK
      ?auto_150742 - BLOCK
      ?auto_150743 - BLOCK
      ?auto_150744 - BLOCK
      ?auto_150745 - BLOCK
    )
    :vars
    (
      ?auto_150746 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_150744 ) ( ON-TABLE ?auto_150738 ) ( ON ?auto_150739 ?auto_150738 ) ( ON ?auto_150740 ?auto_150739 ) ( ON ?auto_150741 ?auto_150740 ) ( ON ?auto_150742 ?auto_150741 ) ( ON ?auto_150743 ?auto_150742 ) ( ON ?auto_150744 ?auto_150743 ) ( not ( = ?auto_150738 ?auto_150739 ) ) ( not ( = ?auto_150738 ?auto_150740 ) ) ( not ( = ?auto_150738 ?auto_150741 ) ) ( not ( = ?auto_150738 ?auto_150742 ) ) ( not ( = ?auto_150738 ?auto_150743 ) ) ( not ( = ?auto_150738 ?auto_150744 ) ) ( not ( = ?auto_150738 ?auto_150745 ) ) ( not ( = ?auto_150739 ?auto_150740 ) ) ( not ( = ?auto_150739 ?auto_150741 ) ) ( not ( = ?auto_150739 ?auto_150742 ) ) ( not ( = ?auto_150739 ?auto_150743 ) ) ( not ( = ?auto_150739 ?auto_150744 ) ) ( not ( = ?auto_150739 ?auto_150745 ) ) ( not ( = ?auto_150740 ?auto_150741 ) ) ( not ( = ?auto_150740 ?auto_150742 ) ) ( not ( = ?auto_150740 ?auto_150743 ) ) ( not ( = ?auto_150740 ?auto_150744 ) ) ( not ( = ?auto_150740 ?auto_150745 ) ) ( not ( = ?auto_150741 ?auto_150742 ) ) ( not ( = ?auto_150741 ?auto_150743 ) ) ( not ( = ?auto_150741 ?auto_150744 ) ) ( not ( = ?auto_150741 ?auto_150745 ) ) ( not ( = ?auto_150742 ?auto_150743 ) ) ( not ( = ?auto_150742 ?auto_150744 ) ) ( not ( = ?auto_150742 ?auto_150745 ) ) ( not ( = ?auto_150743 ?auto_150744 ) ) ( not ( = ?auto_150743 ?auto_150745 ) ) ( not ( = ?auto_150744 ?auto_150745 ) ) ( ON ?auto_150745 ?auto_150746 ) ( CLEAR ?auto_150745 ) ( HAND-EMPTY ) ( not ( = ?auto_150738 ?auto_150746 ) ) ( not ( = ?auto_150739 ?auto_150746 ) ) ( not ( = ?auto_150740 ?auto_150746 ) ) ( not ( = ?auto_150741 ?auto_150746 ) ) ( not ( = ?auto_150742 ?auto_150746 ) ) ( not ( = ?auto_150743 ?auto_150746 ) ) ( not ( = ?auto_150744 ?auto_150746 ) ) ( not ( = ?auto_150745 ?auto_150746 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_150745 ?auto_150746 )
      ( MAKE-8PILE ?auto_150738 ?auto_150739 ?auto_150740 ?auto_150741 ?auto_150742 ?auto_150743 ?auto_150744 ?auto_150745 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150747 - BLOCK
      ?auto_150748 - BLOCK
      ?auto_150749 - BLOCK
      ?auto_150750 - BLOCK
      ?auto_150751 - BLOCK
      ?auto_150752 - BLOCK
      ?auto_150753 - BLOCK
      ?auto_150754 - BLOCK
    )
    :vars
    (
      ?auto_150755 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150747 ) ( ON ?auto_150748 ?auto_150747 ) ( ON ?auto_150749 ?auto_150748 ) ( ON ?auto_150750 ?auto_150749 ) ( ON ?auto_150751 ?auto_150750 ) ( ON ?auto_150752 ?auto_150751 ) ( not ( = ?auto_150747 ?auto_150748 ) ) ( not ( = ?auto_150747 ?auto_150749 ) ) ( not ( = ?auto_150747 ?auto_150750 ) ) ( not ( = ?auto_150747 ?auto_150751 ) ) ( not ( = ?auto_150747 ?auto_150752 ) ) ( not ( = ?auto_150747 ?auto_150753 ) ) ( not ( = ?auto_150747 ?auto_150754 ) ) ( not ( = ?auto_150748 ?auto_150749 ) ) ( not ( = ?auto_150748 ?auto_150750 ) ) ( not ( = ?auto_150748 ?auto_150751 ) ) ( not ( = ?auto_150748 ?auto_150752 ) ) ( not ( = ?auto_150748 ?auto_150753 ) ) ( not ( = ?auto_150748 ?auto_150754 ) ) ( not ( = ?auto_150749 ?auto_150750 ) ) ( not ( = ?auto_150749 ?auto_150751 ) ) ( not ( = ?auto_150749 ?auto_150752 ) ) ( not ( = ?auto_150749 ?auto_150753 ) ) ( not ( = ?auto_150749 ?auto_150754 ) ) ( not ( = ?auto_150750 ?auto_150751 ) ) ( not ( = ?auto_150750 ?auto_150752 ) ) ( not ( = ?auto_150750 ?auto_150753 ) ) ( not ( = ?auto_150750 ?auto_150754 ) ) ( not ( = ?auto_150751 ?auto_150752 ) ) ( not ( = ?auto_150751 ?auto_150753 ) ) ( not ( = ?auto_150751 ?auto_150754 ) ) ( not ( = ?auto_150752 ?auto_150753 ) ) ( not ( = ?auto_150752 ?auto_150754 ) ) ( not ( = ?auto_150753 ?auto_150754 ) ) ( ON ?auto_150754 ?auto_150755 ) ( CLEAR ?auto_150754 ) ( not ( = ?auto_150747 ?auto_150755 ) ) ( not ( = ?auto_150748 ?auto_150755 ) ) ( not ( = ?auto_150749 ?auto_150755 ) ) ( not ( = ?auto_150750 ?auto_150755 ) ) ( not ( = ?auto_150751 ?auto_150755 ) ) ( not ( = ?auto_150752 ?auto_150755 ) ) ( not ( = ?auto_150753 ?auto_150755 ) ) ( not ( = ?auto_150754 ?auto_150755 ) ) ( HOLDING ?auto_150753 ) ( CLEAR ?auto_150752 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_150747 ?auto_150748 ?auto_150749 ?auto_150750 ?auto_150751 ?auto_150752 ?auto_150753 )
      ( MAKE-8PILE ?auto_150747 ?auto_150748 ?auto_150749 ?auto_150750 ?auto_150751 ?auto_150752 ?auto_150753 ?auto_150754 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150756 - BLOCK
      ?auto_150757 - BLOCK
      ?auto_150758 - BLOCK
      ?auto_150759 - BLOCK
      ?auto_150760 - BLOCK
      ?auto_150761 - BLOCK
      ?auto_150762 - BLOCK
      ?auto_150763 - BLOCK
    )
    :vars
    (
      ?auto_150764 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150756 ) ( ON ?auto_150757 ?auto_150756 ) ( ON ?auto_150758 ?auto_150757 ) ( ON ?auto_150759 ?auto_150758 ) ( ON ?auto_150760 ?auto_150759 ) ( ON ?auto_150761 ?auto_150760 ) ( not ( = ?auto_150756 ?auto_150757 ) ) ( not ( = ?auto_150756 ?auto_150758 ) ) ( not ( = ?auto_150756 ?auto_150759 ) ) ( not ( = ?auto_150756 ?auto_150760 ) ) ( not ( = ?auto_150756 ?auto_150761 ) ) ( not ( = ?auto_150756 ?auto_150762 ) ) ( not ( = ?auto_150756 ?auto_150763 ) ) ( not ( = ?auto_150757 ?auto_150758 ) ) ( not ( = ?auto_150757 ?auto_150759 ) ) ( not ( = ?auto_150757 ?auto_150760 ) ) ( not ( = ?auto_150757 ?auto_150761 ) ) ( not ( = ?auto_150757 ?auto_150762 ) ) ( not ( = ?auto_150757 ?auto_150763 ) ) ( not ( = ?auto_150758 ?auto_150759 ) ) ( not ( = ?auto_150758 ?auto_150760 ) ) ( not ( = ?auto_150758 ?auto_150761 ) ) ( not ( = ?auto_150758 ?auto_150762 ) ) ( not ( = ?auto_150758 ?auto_150763 ) ) ( not ( = ?auto_150759 ?auto_150760 ) ) ( not ( = ?auto_150759 ?auto_150761 ) ) ( not ( = ?auto_150759 ?auto_150762 ) ) ( not ( = ?auto_150759 ?auto_150763 ) ) ( not ( = ?auto_150760 ?auto_150761 ) ) ( not ( = ?auto_150760 ?auto_150762 ) ) ( not ( = ?auto_150760 ?auto_150763 ) ) ( not ( = ?auto_150761 ?auto_150762 ) ) ( not ( = ?auto_150761 ?auto_150763 ) ) ( not ( = ?auto_150762 ?auto_150763 ) ) ( ON ?auto_150763 ?auto_150764 ) ( not ( = ?auto_150756 ?auto_150764 ) ) ( not ( = ?auto_150757 ?auto_150764 ) ) ( not ( = ?auto_150758 ?auto_150764 ) ) ( not ( = ?auto_150759 ?auto_150764 ) ) ( not ( = ?auto_150760 ?auto_150764 ) ) ( not ( = ?auto_150761 ?auto_150764 ) ) ( not ( = ?auto_150762 ?auto_150764 ) ) ( not ( = ?auto_150763 ?auto_150764 ) ) ( CLEAR ?auto_150761 ) ( ON ?auto_150762 ?auto_150763 ) ( CLEAR ?auto_150762 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_150764 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_150764 ?auto_150763 )
      ( MAKE-8PILE ?auto_150756 ?auto_150757 ?auto_150758 ?auto_150759 ?auto_150760 ?auto_150761 ?auto_150762 ?auto_150763 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150765 - BLOCK
      ?auto_150766 - BLOCK
      ?auto_150767 - BLOCK
      ?auto_150768 - BLOCK
      ?auto_150769 - BLOCK
      ?auto_150770 - BLOCK
      ?auto_150771 - BLOCK
      ?auto_150772 - BLOCK
    )
    :vars
    (
      ?auto_150773 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150765 ) ( ON ?auto_150766 ?auto_150765 ) ( ON ?auto_150767 ?auto_150766 ) ( ON ?auto_150768 ?auto_150767 ) ( ON ?auto_150769 ?auto_150768 ) ( not ( = ?auto_150765 ?auto_150766 ) ) ( not ( = ?auto_150765 ?auto_150767 ) ) ( not ( = ?auto_150765 ?auto_150768 ) ) ( not ( = ?auto_150765 ?auto_150769 ) ) ( not ( = ?auto_150765 ?auto_150770 ) ) ( not ( = ?auto_150765 ?auto_150771 ) ) ( not ( = ?auto_150765 ?auto_150772 ) ) ( not ( = ?auto_150766 ?auto_150767 ) ) ( not ( = ?auto_150766 ?auto_150768 ) ) ( not ( = ?auto_150766 ?auto_150769 ) ) ( not ( = ?auto_150766 ?auto_150770 ) ) ( not ( = ?auto_150766 ?auto_150771 ) ) ( not ( = ?auto_150766 ?auto_150772 ) ) ( not ( = ?auto_150767 ?auto_150768 ) ) ( not ( = ?auto_150767 ?auto_150769 ) ) ( not ( = ?auto_150767 ?auto_150770 ) ) ( not ( = ?auto_150767 ?auto_150771 ) ) ( not ( = ?auto_150767 ?auto_150772 ) ) ( not ( = ?auto_150768 ?auto_150769 ) ) ( not ( = ?auto_150768 ?auto_150770 ) ) ( not ( = ?auto_150768 ?auto_150771 ) ) ( not ( = ?auto_150768 ?auto_150772 ) ) ( not ( = ?auto_150769 ?auto_150770 ) ) ( not ( = ?auto_150769 ?auto_150771 ) ) ( not ( = ?auto_150769 ?auto_150772 ) ) ( not ( = ?auto_150770 ?auto_150771 ) ) ( not ( = ?auto_150770 ?auto_150772 ) ) ( not ( = ?auto_150771 ?auto_150772 ) ) ( ON ?auto_150772 ?auto_150773 ) ( not ( = ?auto_150765 ?auto_150773 ) ) ( not ( = ?auto_150766 ?auto_150773 ) ) ( not ( = ?auto_150767 ?auto_150773 ) ) ( not ( = ?auto_150768 ?auto_150773 ) ) ( not ( = ?auto_150769 ?auto_150773 ) ) ( not ( = ?auto_150770 ?auto_150773 ) ) ( not ( = ?auto_150771 ?auto_150773 ) ) ( not ( = ?auto_150772 ?auto_150773 ) ) ( ON ?auto_150771 ?auto_150772 ) ( CLEAR ?auto_150771 ) ( ON-TABLE ?auto_150773 ) ( HOLDING ?auto_150770 ) ( CLEAR ?auto_150769 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_150765 ?auto_150766 ?auto_150767 ?auto_150768 ?auto_150769 ?auto_150770 )
      ( MAKE-8PILE ?auto_150765 ?auto_150766 ?auto_150767 ?auto_150768 ?auto_150769 ?auto_150770 ?auto_150771 ?auto_150772 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150774 - BLOCK
      ?auto_150775 - BLOCK
      ?auto_150776 - BLOCK
      ?auto_150777 - BLOCK
      ?auto_150778 - BLOCK
      ?auto_150779 - BLOCK
      ?auto_150780 - BLOCK
      ?auto_150781 - BLOCK
    )
    :vars
    (
      ?auto_150782 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150774 ) ( ON ?auto_150775 ?auto_150774 ) ( ON ?auto_150776 ?auto_150775 ) ( ON ?auto_150777 ?auto_150776 ) ( ON ?auto_150778 ?auto_150777 ) ( not ( = ?auto_150774 ?auto_150775 ) ) ( not ( = ?auto_150774 ?auto_150776 ) ) ( not ( = ?auto_150774 ?auto_150777 ) ) ( not ( = ?auto_150774 ?auto_150778 ) ) ( not ( = ?auto_150774 ?auto_150779 ) ) ( not ( = ?auto_150774 ?auto_150780 ) ) ( not ( = ?auto_150774 ?auto_150781 ) ) ( not ( = ?auto_150775 ?auto_150776 ) ) ( not ( = ?auto_150775 ?auto_150777 ) ) ( not ( = ?auto_150775 ?auto_150778 ) ) ( not ( = ?auto_150775 ?auto_150779 ) ) ( not ( = ?auto_150775 ?auto_150780 ) ) ( not ( = ?auto_150775 ?auto_150781 ) ) ( not ( = ?auto_150776 ?auto_150777 ) ) ( not ( = ?auto_150776 ?auto_150778 ) ) ( not ( = ?auto_150776 ?auto_150779 ) ) ( not ( = ?auto_150776 ?auto_150780 ) ) ( not ( = ?auto_150776 ?auto_150781 ) ) ( not ( = ?auto_150777 ?auto_150778 ) ) ( not ( = ?auto_150777 ?auto_150779 ) ) ( not ( = ?auto_150777 ?auto_150780 ) ) ( not ( = ?auto_150777 ?auto_150781 ) ) ( not ( = ?auto_150778 ?auto_150779 ) ) ( not ( = ?auto_150778 ?auto_150780 ) ) ( not ( = ?auto_150778 ?auto_150781 ) ) ( not ( = ?auto_150779 ?auto_150780 ) ) ( not ( = ?auto_150779 ?auto_150781 ) ) ( not ( = ?auto_150780 ?auto_150781 ) ) ( ON ?auto_150781 ?auto_150782 ) ( not ( = ?auto_150774 ?auto_150782 ) ) ( not ( = ?auto_150775 ?auto_150782 ) ) ( not ( = ?auto_150776 ?auto_150782 ) ) ( not ( = ?auto_150777 ?auto_150782 ) ) ( not ( = ?auto_150778 ?auto_150782 ) ) ( not ( = ?auto_150779 ?auto_150782 ) ) ( not ( = ?auto_150780 ?auto_150782 ) ) ( not ( = ?auto_150781 ?auto_150782 ) ) ( ON ?auto_150780 ?auto_150781 ) ( ON-TABLE ?auto_150782 ) ( CLEAR ?auto_150778 ) ( ON ?auto_150779 ?auto_150780 ) ( CLEAR ?auto_150779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_150782 ?auto_150781 ?auto_150780 )
      ( MAKE-8PILE ?auto_150774 ?auto_150775 ?auto_150776 ?auto_150777 ?auto_150778 ?auto_150779 ?auto_150780 ?auto_150781 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150783 - BLOCK
      ?auto_150784 - BLOCK
      ?auto_150785 - BLOCK
      ?auto_150786 - BLOCK
      ?auto_150787 - BLOCK
      ?auto_150788 - BLOCK
      ?auto_150789 - BLOCK
      ?auto_150790 - BLOCK
    )
    :vars
    (
      ?auto_150791 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150783 ) ( ON ?auto_150784 ?auto_150783 ) ( ON ?auto_150785 ?auto_150784 ) ( ON ?auto_150786 ?auto_150785 ) ( not ( = ?auto_150783 ?auto_150784 ) ) ( not ( = ?auto_150783 ?auto_150785 ) ) ( not ( = ?auto_150783 ?auto_150786 ) ) ( not ( = ?auto_150783 ?auto_150787 ) ) ( not ( = ?auto_150783 ?auto_150788 ) ) ( not ( = ?auto_150783 ?auto_150789 ) ) ( not ( = ?auto_150783 ?auto_150790 ) ) ( not ( = ?auto_150784 ?auto_150785 ) ) ( not ( = ?auto_150784 ?auto_150786 ) ) ( not ( = ?auto_150784 ?auto_150787 ) ) ( not ( = ?auto_150784 ?auto_150788 ) ) ( not ( = ?auto_150784 ?auto_150789 ) ) ( not ( = ?auto_150784 ?auto_150790 ) ) ( not ( = ?auto_150785 ?auto_150786 ) ) ( not ( = ?auto_150785 ?auto_150787 ) ) ( not ( = ?auto_150785 ?auto_150788 ) ) ( not ( = ?auto_150785 ?auto_150789 ) ) ( not ( = ?auto_150785 ?auto_150790 ) ) ( not ( = ?auto_150786 ?auto_150787 ) ) ( not ( = ?auto_150786 ?auto_150788 ) ) ( not ( = ?auto_150786 ?auto_150789 ) ) ( not ( = ?auto_150786 ?auto_150790 ) ) ( not ( = ?auto_150787 ?auto_150788 ) ) ( not ( = ?auto_150787 ?auto_150789 ) ) ( not ( = ?auto_150787 ?auto_150790 ) ) ( not ( = ?auto_150788 ?auto_150789 ) ) ( not ( = ?auto_150788 ?auto_150790 ) ) ( not ( = ?auto_150789 ?auto_150790 ) ) ( ON ?auto_150790 ?auto_150791 ) ( not ( = ?auto_150783 ?auto_150791 ) ) ( not ( = ?auto_150784 ?auto_150791 ) ) ( not ( = ?auto_150785 ?auto_150791 ) ) ( not ( = ?auto_150786 ?auto_150791 ) ) ( not ( = ?auto_150787 ?auto_150791 ) ) ( not ( = ?auto_150788 ?auto_150791 ) ) ( not ( = ?auto_150789 ?auto_150791 ) ) ( not ( = ?auto_150790 ?auto_150791 ) ) ( ON ?auto_150789 ?auto_150790 ) ( ON-TABLE ?auto_150791 ) ( ON ?auto_150788 ?auto_150789 ) ( CLEAR ?auto_150788 ) ( HOLDING ?auto_150787 ) ( CLEAR ?auto_150786 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_150783 ?auto_150784 ?auto_150785 ?auto_150786 ?auto_150787 )
      ( MAKE-8PILE ?auto_150783 ?auto_150784 ?auto_150785 ?auto_150786 ?auto_150787 ?auto_150788 ?auto_150789 ?auto_150790 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150792 - BLOCK
      ?auto_150793 - BLOCK
      ?auto_150794 - BLOCK
      ?auto_150795 - BLOCK
      ?auto_150796 - BLOCK
      ?auto_150797 - BLOCK
      ?auto_150798 - BLOCK
      ?auto_150799 - BLOCK
    )
    :vars
    (
      ?auto_150800 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150792 ) ( ON ?auto_150793 ?auto_150792 ) ( ON ?auto_150794 ?auto_150793 ) ( ON ?auto_150795 ?auto_150794 ) ( not ( = ?auto_150792 ?auto_150793 ) ) ( not ( = ?auto_150792 ?auto_150794 ) ) ( not ( = ?auto_150792 ?auto_150795 ) ) ( not ( = ?auto_150792 ?auto_150796 ) ) ( not ( = ?auto_150792 ?auto_150797 ) ) ( not ( = ?auto_150792 ?auto_150798 ) ) ( not ( = ?auto_150792 ?auto_150799 ) ) ( not ( = ?auto_150793 ?auto_150794 ) ) ( not ( = ?auto_150793 ?auto_150795 ) ) ( not ( = ?auto_150793 ?auto_150796 ) ) ( not ( = ?auto_150793 ?auto_150797 ) ) ( not ( = ?auto_150793 ?auto_150798 ) ) ( not ( = ?auto_150793 ?auto_150799 ) ) ( not ( = ?auto_150794 ?auto_150795 ) ) ( not ( = ?auto_150794 ?auto_150796 ) ) ( not ( = ?auto_150794 ?auto_150797 ) ) ( not ( = ?auto_150794 ?auto_150798 ) ) ( not ( = ?auto_150794 ?auto_150799 ) ) ( not ( = ?auto_150795 ?auto_150796 ) ) ( not ( = ?auto_150795 ?auto_150797 ) ) ( not ( = ?auto_150795 ?auto_150798 ) ) ( not ( = ?auto_150795 ?auto_150799 ) ) ( not ( = ?auto_150796 ?auto_150797 ) ) ( not ( = ?auto_150796 ?auto_150798 ) ) ( not ( = ?auto_150796 ?auto_150799 ) ) ( not ( = ?auto_150797 ?auto_150798 ) ) ( not ( = ?auto_150797 ?auto_150799 ) ) ( not ( = ?auto_150798 ?auto_150799 ) ) ( ON ?auto_150799 ?auto_150800 ) ( not ( = ?auto_150792 ?auto_150800 ) ) ( not ( = ?auto_150793 ?auto_150800 ) ) ( not ( = ?auto_150794 ?auto_150800 ) ) ( not ( = ?auto_150795 ?auto_150800 ) ) ( not ( = ?auto_150796 ?auto_150800 ) ) ( not ( = ?auto_150797 ?auto_150800 ) ) ( not ( = ?auto_150798 ?auto_150800 ) ) ( not ( = ?auto_150799 ?auto_150800 ) ) ( ON ?auto_150798 ?auto_150799 ) ( ON-TABLE ?auto_150800 ) ( ON ?auto_150797 ?auto_150798 ) ( CLEAR ?auto_150795 ) ( ON ?auto_150796 ?auto_150797 ) ( CLEAR ?auto_150796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_150800 ?auto_150799 ?auto_150798 ?auto_150797 )
      ( MAKE-8PILE ?auto_150792 ?auto_150793 ?auto_150794 ?auto_150795 ?auto_150796 ?auto_150797 ?auto_150798 ?auto_150799 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150801 - BLOCK
      ?auto_150802 - BLOCK
      ?auto_150803 - BLOCK
      ?auto_150804 - BLOCK
      ?auto_150805 - BLOCK
      ?auto_150806 - BLOCK
      ?auto_150807 - BLOCK
      ?auto_150808 - BLOCK
    )
    :vars
    (
      ?auto_150809 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150801 ) ( ON ?auto_150802 ?auto_150801 ) ( ON ?auto_150803 ?auto_150802 ) ( not ( = ?auto_150801 ?auto_150802 ) ) ( not ( = ?auto_150801 ?auto_150803 ) ) ( not ( = ?auto_150801 ?auto_150804 ) ) ( not ( = ?auto_150801 ?auto_150805 ) ) ( not ( = ?auto_150801 ?auto_150806 ) ) ( not ( = ?auto_150801 ?auto_150807 ) ) ( not ( = ?auto_150801 ?auto_150808 ) ) ( not ( = ?auto_150802 ?auto_150803 ) ) ( not ( = ?auto_150802 ?auto_150804 ) ) ( not ( = ?auto_150802 ?auto_150805 ) ) ( not ( = ?auto_150802 ?auto_150806 ) ) ( not ( = ?auto_150802 ?auto_150807 ) ) ( not ( = ?auto_150802 ?auto_150808 ) ) ( not ( = ?auto_150803 ?auto_150804 ) ) ( not ( = ?auto_150803 ?auto_150805 ) ) ( not ( = ?auto_150803 ?auto_150806 ) ) ( not ( = ?auto_150803 ?auto_150807 ) ) ( not ( = ?auto_150803 ?auto_150808 ) ) ( not ( = ?auto_150804 ?auto_150805 ) ) ( not ( = ?auto_150804 ?auto_150806 ) ) ( not ( = ?auto_150804 ?auto_150807 ) ) ( not ( = ?auto_150804 ?auto_150808 ) ) ( not ( = ?auto_150805 ?auto_150806 ) ) ( not ( = ?auto_150805 ?auto_150807 ) ) ( not ( = ?auto_150805 ?auto_150808 ) ) ( not ( = ?auto_150806 ?auto_150807 ) ) ( not ( = ?auto_150806 ?auto_150808 ) ) ( not ( = ?auto_150807 ?auto_150808 ) ) ( ON ?auto_150808 ?auto_150809 ) ( not ( = ?auto_150801 ?auto_150809 ) ) ( not ( = ?auto_150802 ?auto_150809 ) ) ( not ( = ?auto_150803 ?auto_150809 ) ) ( not ( = ?auto_150804 ?auto_150809 ) ) ( not ( = ?auto_150805 ?auto_150809 ) ) ( not ( = ?auto_150806 ?auto_150809 ) ) ( not ( = ?auto_150807 ?auto_150809 ) ) ( not ( = ?auto_150808 ?auto_150809 ) ) ( ON ?auto_150807 ?auto_150808 ) ( ON-TABLE ?auto_150809 ) ( ON ?auto_150806 ?auto_150807 ) ( ON ?auto_150805 ?auto_150806 ) ( CLEAR ?auto_150805 ) ( HOLDING ?auto_150804 ) ( CLEAR ?auto_150803 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_150801 ?auto_150802 ?auto_150803 ?auto_150804 )
      ( MAKE-8PILE ?auto_150801 ?auto_150802 ?auto_150803 ?auto_150804 ?auto_150805 ?auto_150806 ?auto_150807 ?auto_150808 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150810 - BLOCK
      ?auto_150811 - BLOCK
      ?auto_150812 - BLOCK
      ?auto_150813 - BLOCK
      ?auto_150814 - BLOCK
      ?auto_150815 - BLOCK
      ?auto_150816 - BLOCK
      ?auto_150817 - BLOCK
    )
    :vars
    (
      ?auto_150818 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150810 ) ( ON ?auto_150811 ?auto_150810 ) ( ON ?auto_150812 ?auto_150811 ) ( not ( = ?auto_150810 ?auto_150811 ) ) ( not ( = ?auto_150810 ?auto_150812 ) ) ( not ( = ?auto_150810 ?auto_150813 ) ) ( not ( = ?auto_150810 ?auto_150814 ) ) ( not ( = ?auto_150810 ?auto_150815 ) ) ( not ( = ?auto_150810 ?auto_150816 ) ) ( not ( = ?auto_150810 ?auto_150817 ) ) ( not ( = ?auto_150811 ?auto_150812 ) ) ( not ( = ?auto_150811 ?auto_150813 ) ) ( not ( = ?auto_150811 ?auto_150814 ) ) ( not ( = ?auto_150811 ?auto_150815 ) ) ( not ( = ?auto_150811 ?auto_150816 ) ) ( not ( = ?auto_150811 ?auto_150817 ) ) ( not ( = ?auto_150812 ?auto_150813 ) ) ( not ( = ?auto_150812 ?auto_150814 ) ) ( not ( = ?auto_150812 ?auto_150815 ) ) ( not ( = ?auto_150812 ?auto_150816 ) ) ( not ( = ?auto_150812 ?auto_150817 ) ) ( not ( = ?auto_150813 ?auto_150814 ) ) ( not ( = ?auto_150813 ?auto_150815 ) ) ( not ( = ?auto_150813 ?auto_150816 ) ) ( not ( = ?auto_150813 ?auto_150817 ) ) ( not ( = ?auto_150814 ?auto_150815 ) ) ( not ( = ?auto_150814 ?auto_150816 ) ) ( not ( = ?auto_150814 ?auto_150817 ) ) ( not ( = ?auto_150815 ?auto_150816 ) ) ( not ( = ?auto_150815 ?auto_150817 ) ) ( not ( = ?auto_150816 ?auto_150817 ) ) ( ON ?auto_150817 ?auto_150818 ) ( not ( = ?auto_150810 ?auto_150818 ) ) ( not ( = ?auto_150811 ?auto_150818 ) ) ( not ( = ?auto_150812 ?auto_150818 ) ) ( not ( = ?auto_150813 ?auto_150818 ) ) ( not ( = ?auto_150814 ?auto_150818 ) ) ( not ( = ?auto_150815 ?auto_150818 ) ) ( not ( = ?auto_150816 ?auto_150818 ) ) ( not ( = ?auto_150817 ?auto_150818 ) ) ( ON ?auto_150816 ?auto_150817 ) ( ON-TABLE ?auto_150818 ) ( ON ?auto_150815 ?auto_150816 ) ( ON ?auto_150814 ?auto_150815 ) ( CLEAR ?auto_150812 ) ( ON ?auto_150813 ?auto_150814 ) ( CLEAR ?auto_150813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_150818 ?auto_150817 ?auto_150816 ?auto_150815 ?auto_150814 )
      ( MAKE-8PILE ?auto_150810 ?auto_150811 ?auto_150812 ?auto_150813 ?auto_150814 ?auto_150815 ?auto_150816 ?auto_150817 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150819 - BLOCK
      ?auto_150820 - BLOCK
      ?auto_150821 - BLOCK
      ?auto_150822 - BLOCK
      ?auto_150823 - BLOCK
      ?auto_150824 - BLOCK
      ?auto_150825 - BLOCK
      ?auto_150826 - BLOCK
    )
    :vars
    (
      ?auto_150827 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150819 ) ( ON ?auto_150820 ?auto_150819 ) ( not ( = ?auto_150819 ?auto_150820 ) ) ( not ( = ?auto_150819 ?auto_150821 ) ) ( not ( = ?auto_150819 ?auto_150822 ) ) ( not ( = ?auto_150819 ?auto_150823 ) ) ( not ( = ?auto_150819 ?auto_150824 ) ) ( not ( = ?auto_150819 ?auto_150825 ) ) ( not ( = ?auto_150819 ?auto_150826 ) ) ( not ( = ?auto_150820 ?auto_150821 ) ) ( not ( = ?auto_150820 ?auto_150822 ) ) ( not ( = ?auto_150820 ?auto_150823 ) ) ( not ( = ?auto_150820 ?auto_150824 ) ) ( not ( = ?auto_150820 ?auto_150825 ) ) ( not ( = ?auto_150820 ?auto_150826 ) ) ( not ( = ?auto_150821 ?auto_150822 ) ) ( not ( = ?auto_150821 ?auto_150823 ) ) ( not ( = ?auto_150821 ?auto_150824 ) ) ( not ( = ?auto_150821 ?auto_150825 ) ) ( not ( = ?auto_150821 ?auto_150826 ) ) ( not ( = ?auto_150822 ?auto_150823 ) ) ( not ( = ?auto_150822 ?auto_150824 ) ) ( not ( = ?auto_150822 ?auto_150825 ) ) ( not ( = ?auto_150822 ?auto_150826 ) ) ( not ( = ?auto_150823 ?auto_150824 ) ) ( not ( = ?auto_150823 ?auto_150825 ) ) ( not ( = ?auto_150823 ?auto_150826 ) ) ( not ( = ?auto_150824 ?auto_150825 ) ) ( not ( = ?auto_150824 ?auto_150826 ) ) ( not ( = ?auto_150825 ?auto_150826 ) ) ( ON ?auto_150826 ?auto_150827 ) ( not ( = ?auto_150819 ?auto_150827 ) ) ( not ( = ?auto_150820 ?auto_150827 ) ) ( not ( = ?auto_150821 ?auto_150827 ) ) ( not ( = ?auto_150822 ?auto_150827 ) ) ( not ( = ?auto_150823 ?auto_150827 ) ) ( not ( = ?auto_150824 ?auto_150827 ) ) ( not ( = ?auto_150825 ?auto_150827 ) ) ( not ( = ?auto_150826 ?auto_150827 ) ) ( ON ?auto_150825 ?auto_150826 ) ( ON-TABLE ?auto_150827 ) ( ON ?auto_150824 ?auto_150825 ) ( ON ?auto_150823 ?auto_150824 ) ( ON ?auto_150822 ?auto_150823 ) ( CLEAR ?auto_150822 ) ( HOLDING ?auto_150821 ) ( CLEAR ?auto_150820 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_150819 ?auto_150820 ?auto_150821 )
      ( MAKE-8PILE ?auto_150819 ?auto_150820 ?auto_150821 ?auto_150822 ?auto_150823 ?auto_150824 ?auto_150825 ?auto_150826 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150828 - BLOCK
      ?auto_150829 - BLOCK
      ?auto_150830 - BLOCK
      ?auto_150831 - BLOCK
      ?auto_150832 - BLOCK
      ?auto_150833 - BLOCK
      ?auto_150834 - BLOCK
      ?auto_150835 - BLOCK
    )
    :vars
    (
      ?auto_150836 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150828 ) ( ON ?auto_150829 ?auto_150828 ) ( not ( = ?auto_150828 ?auto_150829 ) ) ( not ( = ?auto_150828 ?auto_150830 ) ) ( not ( = ?auto_150828 ?auto_150831 ) ) ( not ( = ?auto_150828 ?auto_150832 ) ) ( not ( = ?auto_150828 ?auto_150833 ) ) ( not ( = ?auto_150828 ?auto_150834 ) ) ( not ( = ?auto_150828 ?auto_150835 ) ) ( not ( = ?auto_150829 ?auto_150830 ) ) ( not ( = ?auto_150829 ?auto_150831 ) ) ( not ( = ?auto_150829 ?auto_150832 ) ) ( not ( = ?auto_150829 ?auto_150833 ) ) ( not ( = ?auto_150829 ?auto_150834 ) ) ( not ( = ?auto_150829 ?auto_150835 ) ) ( not ( = ?auto_150830 ?auto_150831 ) ) ( not ( = ?auto_150830 ?auto_150832 ) ) ( not ( = ?auto_150830 ?auto_150833 ) ) ( not ( = ?auto_150830 ?auto_150834 ) ) ( not ( = ?auto_150830 ?auto_150835 ) ) ( not ( = ?auto_150831 ?auto_150832 ) ) ( not ( = ?auto_150831 ?auto_150833 ) ) ( not ( = ?auto_150831 ?auto_150834 ) ) ( not ( = ?auto_150831 ?auto_150835 ) ) ( not ( = ?auto_150832 ?auto_150833 ) ) ( not ( = ?auto_150832 ?auto_150834 ) ) ( not ( = ?auto_150832 ?auto_150835 ) ) ( not ( = ?auto_150833 ?auto_150834 ) ) ( not ( = ?auto_150833 ?auto_150835 ) ) ( not ( = ?auto_150834 ?auto_150835 ) ) ( ON ?auto_150835 ?auto_150836 ) ( not ( = ?auto_150828 ?auto_150836 ) ) ( not ( = ?auto_150829 ?auto_150836 ) ) ( not ( = ?auto_150830 ?auto_150836 ) ) ( not ( = ?auto_150831 ?auto_150836 ) ) ( not ( = ?auto_150832 ?auto_150836 ) ) ( not ( = ?auto_150833 ?auto_150836 ) ) ( not ( = ?auto_150834 ?auto_150836 ) ) ( not ( = ?auto_150835 ?auto_150836 ) ) ( ON ?auto_150834 ?auto_150835 ) ( ON-TABLE ?auto_150836 ) ( ON ?auto_150833 ?auto_150834 ) ( ON ?auto_150832 ?auto_150833 ) ( ON ?auto_150831 ?auto_150832 ) ( CLEAR ?auto_150829 ) ( ON ?auto_150830 ?auto_150831 ) ( CLEAR ?auto_150830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_150836 ?auto_150835 ?auto_150834 ?auto_150833 ?auto_150832 ?auto_150831 )
      ( MAKE-8PILE ?auto_150828 ?auto_150829 ?auto_150830 ?auto_150831 ?auto_150832 ?auto_150833 ?auto_150834 ?auto_150835 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150837 - BLOCK
      ?auto_150838 - BLOCK
      ?auto_150839 - BLOCK
      ?auto_150840 - BLOCK
      ?auto_150841 - BLOCK
      ?auto_150842 - BLOCK
      ?auto_150843 - BLOCK
      ?auto_150844 - BLOCK
    )
    :vars
    (
      ?auto_150845 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150837 ) ( not ( = ?auto_150837 ?auto_150838 ) ) ( not ( = ?auto_150837 ?auto_150839 ) ) ( not ( = ?auto_150837 ?auto_150840 ) ) ( not ( = ?auto_150837 ?auto_150841 ) ) ( not ( = ?auto_150837 ?auto_150842 ) ) ( not ( = ?auto_150837 ?auto_150843 ) ) ( not ( = ?auto_150837 ?auto_150844 ) ) ( not ( = ?auto_150838 ?auto_150839 ) ) ( not ( = ?auto_150838 ?auto_150840 ) ) ( not ( = ?auto_150838 ?auto_150841 ) ) ( not ( = ?auto_150838 ?auto_150842 ) ) ( not ( = ?auto_150838 ?auto_150843 ) ) ( not ( = ?auto_150838 ?auto_150844 ) ) ( not ( = ?auto_150839 ?auto_150840 ) ) ( not ( = ?auto_150839 ?auto_150841 ) ) ( not ( = ?auto_150839 ?auto_150842 ) ) ( not ( = ?auto_150839 ?auto_150843 ) ) ( not ( = ?auto_150839 ?auto_150844 ) ) ( not ( = ?auto_150840 ?auto_150841 ) ) ( not ( = ?auto_150840 ?auto_150842 ) ) ( not ( = ?auto_150840 ?auto_150843 ) ) ( not ( = ?auto_150840 ?auto_150844 ) ) ( not ( = ?auto_150841 ?auto_150842 ) ) ( not ( = ?auto_150841 ?auto_150843 ) ) ( not ( = ?auto_150841 ?auto_150844 ) ) ( not ( = ?auto_150842 ?auto_150843 ) ) ( not ( = ?auto_150842 ?auto_150844 ) ) ( not ( = ?auto_150843 ?auto_150844 ) ) ( ON ?auto_150844 ?auto_150845 ) ( not ( = ?auto_150837 ?auto_150845 ) ) ( not ( = ?auto_150838 ?auto_150845 ) ) ( not ( = ?auto_150839 ?auto_150845 ) ) ( not ( = ?auto_150840 ?auto_150845 ) ) ( not ( = ?auto_150841 ?auto_150845 ) ) ( not ( = ?auto_150842 ?auto_150845 ) ) ( not ( = ?auto_150843 ?auto_150845 ) ) ( not ( = ?auto_150844 ?auto_150845 ) ) ( ON ?auto_150843 ?auto_150844 ) ( ON-TABLE ?auto_150845 ) ( ON ?auto_150842 ?auto_150843 ) ( ON ?auto_150841 ?auto_150842 ) ( ON ?auto_150840 ?auto_150841 ) ( ON ?auto_150839 ?auto_150840 ) ( CLEAR ?auto_150839 ) ( HOLDING ?auto_150838 ) ( CLEAR ?auto_150837 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_150837 ?auto_150838 )
      ( MAKE-8PILE ?auto_150837 ?auto_150838 ?auto_150839 ?auto_150840 ?auto_150841 ?auto_150842 ?auto_150843 ?auto_150844 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150846 - BLOCK
      ?auto_150847 - BLOCK
      ?auto_150848 - BLOCK
      ?auto_150849 - BLOCK
      ?auto_150850 - BLOCK
      ?auto_150851 - BLOCK
      ?auto_150852 - BLOCK
      ?auto_150853 - BLOCK
    )
    :vars
    (
      ?auto_150854 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150846 ) ( not ( = ?auto_150846 ?auto_150847 ) ) ( not ( = ?auto_150846 ?auto_150848 ) ) ( not ( = ?auto_150846 ?auto_150849 ) ) ( not ( = ?auto_150846 ?auto_150850 ) ) ( not ( = ?auto_150846 ?auto_150851 ) ) ( not ( = ?auto_150846 ?auto_150852 ) ) ( not ( = ?auto_150846 ?auto_150853 ) ) ( not ( = ?auto_150847 ?auto_150848 ) ) ( not ( = ?auto_150847 ?auto_150849 ) ) ( not ( = ?auto_150847 ?auto_150850 ) ) ( not ( = ?auto_150847 ?auto_150851 ) ) ( not ( = ?auto_150847 ?auto_150852 ) ) ( not ( = ?auto_150847 ?auto_150853 ) ) ( not ( = ?auto_150848 ?auto_150849 ) ) ( not ( = ?auto_150848 ?auto_150850 ) ) ( not ( = ?auto_150848 ?auto_150851 ) ) ( not ( = ?auto_150848 ?auto_150852 ) ) ( not ( = ?auto_150848 ?auto_150853 ) ) ( not ( = ?auto_150849 ?auto_150850 ) ) ( not ( = ?auto_150849 ?auto_150851 ) ) ( not ( = ?auto_150849 ?auto_150852 ) ) ( not ( = ?auto_150849 ?auto_150853 ) ) ( not ( = ?auto_150850 ?auto_150851 ) ) ( not ( = ?auto_150850 ?auto_150852 ) ) ( not ( = ?auto_150850 ?auto_150853 ) ) ( not ( = ?auto_150851 ?auto_150852 ) ) ( not ( = ?auto_150851 ?auto_150853 ) ) ( not ( = ?auto_150852 ?auto_150853 ) ) ( ON ?auto_150853 ?auto_150854 ) ( not ( = ?auto_150846 ?auto_150854 ) ) ( not ( = ?auto_150847 ?auto_150854 ) ) ( not ( = ?auto_150848 ?auto_150854 ) ) ( not ( = ?auto_150849 ?auto_150854 ) ) ( not ( = ?auto_150850 ?auto_150854 ) ) ( not ( = ?auto_150851 ?auto_150854 ) ) ( not ( = ?auto_150852 ?auto_150854 ) ) ( not ( = ?auto_150853 ?auto_150854 ) ) ( ON ?auto_150852 ?auto_150853 ) ( ON-TABLE ?auto_150854 ) ( ON ?auto_150851 ?auto_150852 ) ( ON ?auto_150850 ?auto_150851 ) ( ON ?auto_150849 ?auto_150850 ) ( ON ?auto_150848 ?auto_150849 ) ( CLEAR ?auto_150846 ) ( ON ?auto_150847 ?auto_150848 ) ( CLEAR ?auto_150847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_150854 ?auto_150853 ?auto_150852 ?auto_150851 ?auto_150850 ?auto_150849 ?auto_150848 )
      ( MAKE-8PILE ?auto_150846 ?auto_150847 ?auto_150848 ?auto_150849 ?auto_150850 ?auto_150851 ?auto_150852 ?auto_150853 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150855 - BLOCK
      ?auto_150856 - BLOCK
      ?auto_150857 - BLOCK
      ?auto_150858 - BLOCK
      ?auto_150859 - BLOCK
      ?auto_150860 - BLOCK
      ?auto_150861 - BLOCK
      ?auto_150862 - BLOCK
    )
    :vars
    (
      ?auto_150863 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150855 ?auto_150856 ) ) ( not ( = ?auto_150855 ?auto_150857 ) ) ( not ( = ?auto_150855 ?auto_150858 ) ) ( not ( = ?auto_150855 ?auto_150859 ) ) ( not ( = ?auto_150855 ?auto_150860 ) ) ( not ( = ?auto_150855 ?auto_150861 ) ) ( not ( = ?auto_150855 ?auto_150862 ) ) ( not ( = ?auto_150856 ?auto_150857 ) ) ( not ( = ?auto_150856 ?auto_150858 ) ) ( not ( = ?auto_150856 ?auto_150859 ) ) ( not ( = ?auto_150856 ?auto_150860 ) ) ( not ( = ?auto_150856 ?auto_150861 ) ) ( not ( = ?auto_150856 ?auto_150862 ) ) ( not ( = ?auto_150857 ?auto_150858 ) ) ( not ( = ?auto_150857 ?auto_150859 ) ) ( not ( = ?auto_150857 ?auto_150860 ) ) ( not ( = ?auto_150857 ?auto_150861 ) ) ( not ( = ?auto_150857 ?auto_150862 ) ) ( not ( = ?auto_150858 ?auto_150859 ) ) ( not ( = ?auto_150858 ?auto_150860 ) ) ( not ( = ?auto_150858 ?auto_150861 ) ) ( not ( = ?auto_150858 ?auto_150862 ) ) ( not ( = ?auto_150859 ?auto_150860 ) ) ( not ( = ?auto_150859 ?auto_150861 ) ) ( not ( = ?auto_150859 ?auto_150862 ) ) ( not ( = ?auto_150860 ?auto_150861 ) ) ( not ( = ?auto_150860 ?auto_150862 ) ) ( not ( = ?auto_150861 ?auto_150862 ) ) ( ON ?auto_150862 ?auto_150863 ) ( not ( = ?auto_150855 ?auto_150863 ) ) ( not ( = ?auto_150856 ?auto_150863 ) ) ( not ( = ?auto_150857 ?auto_150863 ) ) ( not ( = ?auto_150858 ?auto_150863 ) ) ( not ( = ?auto_150859 ?auto_150863 ) ) ( not ( = ?auto_150860 ?auto_150863 ) ) ( not ( = ?auto_150861 ?auto_150863 ) ) ( not ( = ?auto_150862 ?auto_150863 ) ) ( ON ?auto_150861 ?auto_150862 ) ( ON-TABLE ?auto_150863 ) ( ON ?auto_150860 ?auto_150861 ) ( ON ?auto_150859 ?auto_150860 ) ( ON ?auto_150858 ?auto_150859 ) ( ON ?auto_150857 ?auto_150858 ) ( ON ?auto_150856 ?auto_150857 ) ( CLEAR ?auto_150856 ) ( HOLDING ?auto_150855 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_150855 )
      ( MAKE-8PILE ?auto_150855 ?auto_150856 ?auto_150857 ?auto_150858 ?auto_150859 ?auto_150860 ?auto_150861 ?auto_150862 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150864 - BLOCK
      ?auto_150865 - BLOCK
      ?auto_150866 - BLOCK
      ?auto_150867 - BLOCK
      ?auto_150868 - BLOCK
      ?auto_150869 - BLOCK
      ?auto_150870 - BLOCK
      ?auto_150871 - BLOCK
    )
    :vars
    (
      ?auto_150872 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150864 ?auto_150865 ) ) ( not ( = ?auto_150864 ?auto_150866 ) ) ( not ( = ?auto_150864 ?auto_150867 ) ) ( not ( = ?auto_150864 ?auto_150868 ) ) ( not ( = ?auto_150864 ?auto_150869 ) ) ( not ( = ?auto_150864 ?auto_150870 ) ) ( not ( = ?auto_150864 ?auto_150871 ) ) ( not ( = ?auto_150865 ?auto_150866 ) ) ( not ( = ?auto_150865 ?auto_150867 ) ) ( not ( = ?auto_150865 ?auto_150868 ) ) ( not ( = ?auto_150865 ?auto_150869 ) ) ( not ( = ?auto_150865 ?auto_150870 ) ) ( not ( = ?auto_150865 ?auto_150871 ) ) ( not ( = ?auto_150866 ?auto_150867 ) ) ( not ( = ?auto_150866 ?auto_150868 ) ) ( not ( = ?auto_150866 ?auto_150869 ) ) ( not ( = ?auto_150866 ?auto_150870 ) ) ( not ( = ?auto_150866 ?auto_150871 ) ) ( not ( = ?auto_150867 ?auto_150868 ) ) ( not ( = ?auto_150867 ?auto_150869 ) ) ( not ( = ?auto_150867 ?auto_150870 ) ) ( not ( = ?auto_150867 ?auto_150871 ) ) ( not ( = ?auto_150868 ?auto_150869 ) ) ( not ( = ?auto_150868 ?auto_150870 ) ) ( not ( = ?auto_150868 ?auto_150871 ) ) ( not ( = ?auto_150869 ?auto_150870 ) ) ( not ( = ?auto_150869 ?auto_150871 ) ) ( not ( = ?auto_150870 ?auto_150871 ) ) ( ON ?auto_150871 ?auto_150872 ) ( not ( = ?auto_150864 ?auto_150872 ) ) ( not ( = ?auto_150865 ?auto_150872 ) ) ( not ( = ?auto_150866 ?auto_150872 ) ) ( not ( = ?auto_150867 ?auto_150872 ) ) ( not ( = ?auto_150868 ?auto_150872 ) ) ( not ( = ?auto_150869 ?auto_150872 ) ) ( not ( = ?auto_150870 ?auto_150872 ) ) ( not ( = ?auto_150871 ?auto_150872 ) ) ( ON ?auto_150870 ?auto_150871 ) ( ON-TABLE ?auto_150872 ) ( ON ?auto_150869 ?auto_150870 ) ( ON ?auto_150868 ?auto_150869 ) ( ON ?auto_150867 ?auto_150868 ) ( ON ?auto_150866 ?auto_150867 ) ( ON ?auto_150865 ?auto_150866 ) ( ON ?auto_150864 ?auto_150865 ) ( CLEAR ?auto_150864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_150872 ?auto_150871 ?auto_150870 ?auto_150869 ?auto_150868 ?auto_150867 ?auto_150866 ?auto_150865 )
      ( MAKE-8PILE ?auto_150864 ?auto_150865 ?auto_150866 ?auto_150867 ?auto_150868 ?auto_150869 ?auto_150870 ?auto_150871 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150880 - BLOCK
      ?auto_150881 - BLOCK
      ?auto_150882 - BLOCK
      ?auto_150883 - BLOCK
      ?auto_150884 - BLOCK
      ?auto_150885 - BLOCK
      ?auto_150886 - BLOCK
    )
    :vars
    (
      ?auto_150887 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150887 ?auto_150886 ) ( CLEAR ?auto_150887 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_150880 ) ( ON ?auto_150881 ?auto_150880 ) ( ON ?auto_150882 ?auto_150881 ) ( ON ?auto_150883 ?auto_150882 ) ( ON ?auto_150884 ?auto_150883 ) ( ON ?auto_150885 ?auto_150884 ) ( ON ?auto_150886 ?auto_150885 ) ( not ( = ?auto_150880 ?auto_150881 ) ) ( not ( = ?auto_150880 ?auto_150882 ) ) ( not ( = ?auto_150880 ?auto_150883 ) ) ( not ( = ?auto_150880 ?auto_150884 ) ) ( not ( = ?auto_150880 ?auto_150885 ) ) ( not ( = ?auto_150880 ?auto_150886 ) ) ( not ( = ?auto_150880 ?auto_150887 ) ) ( not ( = ?auto_150881 ?auto_150882 ) ) ( not ( = ?auto_150881 ?auto_150883 ) ) ( not ( = ?auto_150881 ?auto_150884 ) ) ( not ( = ?auto_150881 ?auto_150885 ) ) ( not ( = ?auto_150881 ?auto_150886 ) ) ( not ( = ?auto_150881 ?auto_150887 ) ) ( not ( = ?auto_150882 ?auto_150883 ) ) ( not ( = ?auto_150882 ?auto_150884 ) ) ( not ( = ?auto_150882 ?auto_150885 ) ) ( not ( = ?auto_150882 ?auto_150886 ) ) ( not ( = ?auto_150882 ?auto_150887 ) ) ( not ( = ?auto_150883 ?auto_150884 ) ) ( not ( = ?auto_150883 ?auto_150885 ) ) ( not ( = ?auto_150883 ?auto_150886 ) ) ( not ( = ?auto_150883 ?auto_150887 ) ) ( not ( = ?auto_150884 ?auto_150885 ) ) ( not ( = ?auto_150884 ?auto_150886 ) ) ( not ( = ?auto_150884 ?auto_150887 ) ) ( not ( = ?auto_150885 ?auto_150886 ) ) ( not ( = ?auto_150885 ?auto_150887 ) ) ( not ( = ?auto_150886 ?auto_150887 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_150887 ?auto_150886 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150905 - BLOCK
      ?auto_150906 - BLOCK
      ?auto_150907 - BLOCK
      ?auto_150908 - BLOCK
      ?auto_150909 - BLOCK
      ?auto_150910 - BLOCK
      ?auto_150911 - BLOCK
    )
    :vars
    (
      ?auto_150912 - BLOCK
      ?auto_150913 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150905 ) ( ON ?auto_150906 ?auto_150905 ) ( ON ?auto_150907 ?auto_150906 ) ( ON ?auto_150908 ?auto_150907 ) ( ON ?auto_150909 ?auto_150908 ) ( ON ?auto_150910 ?auto_150909 ) ( not ( = ?auto_150905 ?auto_150906 ) ) ( not ( = ?auto_150905 ?auto_150907 ) ) ( not ( = ?auto_150905 ?auto_150908 ) ) ( not ( = ?auto_150905 ?auto_150909 ) ) ( not ( = ?auto_150905 ?auto_150910 ) ) ( not ( = ?auto_150905 ?auto_150911 ) ) ( not ( = ?auto_150905 ?auto_150912 ) ) ( not ( = ?auto_150906 ?auto_150907 ) ) ( not ( = ?auto_150906 ?auto_150908 ) ) ( not ( = ?auto_150906 ?auto_150909 ) ) ( not ( = ?auto_150906 ?auto_150910 ) ) ( not ( = ?auto_150906 ?auto_150911 ) ) ( not ( = ?auto_150906 ?auto_150912 ) ) ( not ( = ?auto_150907 ?auto_150908 ) ) ( not ( = ?auto_150907 ?auto_150909 ) ) ( not ( = ?auto_150907 ?auto_150910 ) ) ( not ( = ?auto_150907 ?auto_150911 ) ) ( not ( = ?auto_150907 ?auto_150912 ) ) ( not ( = ?auto_150908 ?auto_150909 ) ) ( not ( = ?auto_150908 ?auto_150910 ) ) ( not ( = ?auto_150908 ?auto_150911 ) ) ( not ( = ?auto_150908 ?auto_150912 ) ) ( not ( = ?auto_150909 ?auto_150910 ) ) ( not ( = ?auto_150909 ?auto_150911 ) ) ( not ( = ?auto_150909 ?auto_150912 ) ) ( not ( = ?auto_150910 ?auto_150911 ) ) ( not ( = ?auto_150910 ?auto_150912 ) ) ( not ( = ?auto_150911 ?auto_150912 ) ) ( ON ?auto_150912 ?auto_150913 ) ( CLEAR ?auto_150912 ) ( not ( = ?auto_150905 ?auto_150913 ) ) ( not ( = ?auto_150906 ?auto_150913 ) ) ( not ( = ?auto_150907 ?auto_150913 ) ) ( not ( = ?auto_150908 ?auto_150913 ) ) ( not ( = ?auto_150909 ?auto_150913 ) ) ( not ( = ?auto_150910 ?auto_150913 ) ) ( not ( = ?auto_150911 ?auto_150913 ) ) ( not ( = ?auto_150912 ?auto_150913 ) ) ( HOLDING ?auto_150911 ) ( CLEAR ?auto_150910 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_150905 ?auto_150906 ?auto_150907 ?auto_150908 ?auto_150909 ?auto_150910 ?auto_150911 ?auto_150912 )
      ( MAKE-7PILE ?auto_150905 ?auto_150906 ?auto_150907 ?auto_150908 ?auto_150909 ?auto_150910 ?auto_150911 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150914 - BLOCK
      ?auto_150915 - BLOCK
      ?auto_150916 - BLOCK
      ?auto_150917 - BLOCK
      ?auto_150918 - BLOCK
      ?auto_150919 - BLOCK
      ?auto_150920 - BLOCK
    )
    :vars
    (
      ?auto_150921 - BLOCK
      ?auto_150922 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150914 ) ( ON ?auto_150915 ?auto_150914 ) ( ON ?auto_150916 ?auto_150915 ) ( ON ?auto_150917 ?auto_150916 ) ( ON ?auto_150918 ?auto_150917 ) ( ON ?auto_150919 ?auto_150918 ) ( not ( = ?auto_150914 ?auto_150915 ) ) ( not ( = ?auto_150914 ?auto_150916 ) ) ( not ( = ?auto_150914 ?auto_150917 ) ) ( not ( = ?auto_150914 ?auto_150918 ) ) ( not ( = ?auto_150914 ?auto_150919 ) ) ( not ( = ?auto_150914 ?auto_150920 ) ) ( not ( = ?auto_150914 ?auto_150921 ) ) ( not ( = ?auto_150915 ?auto_150916 ) ) ( not ( = ?auto_150915 ?auto_150917 ) ) ( not ( = ?auto_150915 ?auto_150918 ) ) ( not ( = ?auto_150915 ?auto_150919 ) ) ( not ( = ?auto_150915 ?auto_150920 ) ) ( not ( = ?auto_150915 ?auto_150921 ) ) ( not ( = ?auto_150916 ?auto_150917 ) ) ( not ( = ?auto_150916 ?auto_150918 ) ) ( not ( = ?auto_150916 ?auto_150919 ) ) ( not ( = ?auto_150916 ?auto_150920 ) ) ( not ( = ?auto_150916 ?auto_150921 ) ) ( not ( = ?auto_150917 ?auto_150918 ) ) ( not ( = ?auto_150917 ?auto_150919 ) ) ( not ( = ?auto_150917 ?auto_150920 ) ) ( not ( = ?auto_150917 ?auto_150921 ) ) ( not ( = ?auto_150918 ?auto_150919 ) ) ( not ( = ?auto_150918 ?auto_150920 ) ) ( not ( = ?auto_150918 ?auto_150921 ) ) ( not ( = ?auto_150919 ?auto_150920 ) ) ( not ( = ?auto_150919 ?auto_150921 ) ) ( not ( = ?auto_150920 ?auto_150921 ) ) ( ON ?auto_150921 ?auto_150922 ) ( not ( = ?auto_150914 ?auto_150922 ) ) ( not ( = ?auto_150915 ?auto_150922 ) ) ( not ( = ?auto_150916 ?auto_150922 ) ) ( not ( = ?auto_150917 ?auto_150922 ) ) ( not ( = ?auto_150918 ?auto_150922 ) ) ( not ( = ?auto_150919 ?auto_150922 ) ) ( not ( = ?auto_150920 ?auto_150922 ) ) ( not ( = ?auto_150921 ?auto_150922 ) ) ( CLEAR ?auto_150919 ) ( ON ?auto_150920 ?auto_150921 ) ( CLEAR ?auto_150920 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_150922 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_150922 ?auto_150921 )
      ( MAKE-7PILE ?auto_150914 ?auto_150915 ?auto_150916 ?auto_150917 ?auto_150918 ?auto_150919 ?auto_150920 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150923 - BLOCK
      ?auto_150924 - BLOCK
      ?auto_150925 - BLOCK
      ?auto_150926 - BLOCK
      ?auto_150927 - BLOCK
      ?auto_150928 - BLOCK
      ?auto_150929 - BLOCK
    )
    :vars
    (
      ?auto_150930 - BLOCK
      ?auto_150931 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150923 ) ( ON ?auto_150924 ?auto_150923 ) ( ON ?auto_150925 ?auto_150924 ) ( ON ?auto_150926 ?auto_150925 ) ( ON ?auto_150927 ?auto_150926 ) ( not ( = ?auto_150923 ?auto_150924 ) ) ( not ( = ?auto_150923 ?auto_150925 ) ) ( not ( = ?auto_150923 ?auto_150926 ) ) ( not ( = ?auto_150923 ?auto_150927 ) ) ( not ( = ?auto_150923 ?auto_150928 ) ) ( not ( = ?auto_150923 ?auto_150929 ) ) ( not ( = ?auto_150923 ?auto_150930 ) ) ( not ( = ?auto_150924 ?auto_150925 ) ) ( not ( = ?auto_150924 ?auto_150926 ) ) ( not ( = ?auto_150924 ?auto_150927 ) ) ( not ( = ?auto_150924 ?auto_150928 ) ) ( not ( = ?auto_150924 ?auto_150929 ) ) ( not ( = ?auto_150924 ?auto_150930 ) ) ( not ( = ?auto_150925 ?auto_150926 ) ) ( not ( = ?auto_150925 ?auto_150927 ) ) ( not ( = ?auto_150925 ?auto_150928 ) ) ( not ( = ?auto_150925 ?auto_150929 ) ) ( not ( = ?auto_150925 ?auto_150930 ) ) ( not ( = ?auto_150926 ?auto_150927 ) ) ( not ( = ?auto_150926 ?auto_150928 ) ) ( not ( = ?auto_150926 ?auto_150929 ) ) ( not ( = ?auto_150926 ?auto_150930 ) ) ( not ( = ?auto_150927 ?auto_150928 ) ) ( not ( = ?auto_150927 ?auto_150929 ) ) ( not ( = ?auto_150927 ?auto_150930 ) ) ( not ( = ?auto_150928 ?auto_150929 ) ) ( not ( = ?auto_150928 ?auto_150930 ) ) ( not ( = ?auto_150929 ?auto_150930 ) ) ( ON ?auto_150930 ?auto_150931 ) ( not ( = ?auto_150923 ?auto_150931 ) ) ( not ( = ?auto_150924 ?auto_150931 ) ) ( not ( = ?auto_150925 ?auto_150931 ) ) ( not ( = ?auto_150926 ?auto_150931 ) ) ( not ( = ?auto_150927 ?auto_150931 ) ) ( not ( = ?auto_150928 ?auto_150931 ) ) ( not ( = ?auto_150929 ?auto_150931 ) ) ( not ( = ?auto_150930 ?auto_150931 ) ) ( ON ?auto_150929 ?auto_150930 ) ( CLEAR ?auto_150929 ) ( ON-TABLE ?auto_150931 ) ( HOLDING ?auto_150928 ) ( CLEAR ?auto_150927 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_150923 ?auto_150924 ?auto_150925 ?auto_150926 ?auto_150927 ?auto_150928 )
      ( MAKE-7PILE ?auto_150923 ?auto_150924 ?auto_150925 ?auto_150926 ?auto_150927 ?auto_150928 ?auto_150929 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150932 - BLOCK
      ?auto_150933 - BLOCK
      ?auto_150934 - BLOCK
      ?auto_150935 - BLOCK
      ?auto_150936 - BLOCK
      ?auto_150937 - BLOCK
      ?auto_150938 - BLOCK
    )
    :vars
    (
      ?auto_150940 - BLOCK
      ?auto_150939 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150932 ) ( ON ?auto_150933 ?auto_150932 ) ( ON ?auto_150934 ?auto_150933 ) ( ON ?auto_150935 ?auto_150934 ) ( ON ?auto_150936 ?auto_150935 ) ( not ( = ?auto_150932 ?auto_150933 ) ) ( not ( = ?auto_150932 ?auto_150934 ) ) ( not ( = ?auto_150932 ?auto_150935 ) ) ( not ( = ?auto_150932 ?auto_150936 ) ) ( not ( = ?auto_150932 ?auto_150937 ) ) ( not ( = ?auto_150932 ?auto_150938 ) ) ( not ( = ?auto_150932 ?auto_150940 ) ) ( not ( = ?auto_150933 ?auto_150934 ) ) ( not ( = ?auto_150933 ?auto_150935 ) ) ( not ( = ?auto_150933 ?auto_150936 ) ) ( not ( = ?auto_150933 ?auto_150937 ) ) ( not ( = ?auto_150933 ?auto_150938 ) ) ( not ( = ?auto_150933 ?auto_150940 ) ) ( not ( = ?auto_150934 ?auto_150935 ) ) ( not ( = ?auto_150934 ?auto_150936 ) ) ( not ( = ?auto_150934 ?auto_150937 ) ) ( not ( = ?auto_150934 ?auto_150938 ) ) ( not ( = ?auto_150934 ?auto_150940 ) ) ( not ( = ?auto_150935 ?auto_150936 ) ) ( not ( = ?auto_150935 ?auto_150937 ) ) ( not ( = ?auto_150935 ?auto_150938 ) ) ( not ( = ?auto_150935 ?auto_150940 ) ) ( not ( = ?auto_150936 ?auto_150937 ) ) ( not ( = ?auto_150936 ?auto_150938 ) ) ( not ( = ?auto_150936 ?auto_150940 ) ) ( not ( = ?auto_150937 ?auto_150938 ) ) ( not ( = ?auto_150937 ?auto_150940 ) ) ( not ( = ?auto_150938 ?auto_150940 ) ) ( ON ?auto_150940 ?auto_150939 ) ( not ( = ?auto_150932 ?auto_150939 ) ) ( not ( = ?auto_150933 ?auto_150939 ) ) ( not ( = ?auto_150934 ?auto_150939 ) ) ( not ( = ?auto_150935 ?auto_150939 ) ) ( not ( = ?auto_150936 ?auto_150939 ) ) ( not ( = ?auto_150937 ?auto_150939 ) ) ( not ( = ?auto_150938 ?auto_150939 ) ) ( not ( = ?auto_150940 ?auto_150939 ) ) ( ON ?auto_150938 ?auto_150940 ) ( ON-TABLE ?auto_150939 ) ( CLEAR ?auto_150936 ) ( ON ?auto_150937 ?auto_150938 ) ( CLEAR ?auto_150937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_150939 ?auto_150940 ?auto_150938 )
      ( MAKE-7PILE ?auto_150932 ?auto_150933 ?auto_150934 ?auto_150935 ?auto_150936 ?auto_150937 ?auto_150938 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150941 - BLOCK
      ?auto_150942 - BLOCK
      ?auto_150943 - BLOCK
      ?auto_150944 - BLOCK
      ?auto_150945 - BLOCK
      ?auto_150946 - BLOCK
      ?auto_150947 - BLOCK
    )
    :vars
    (
      ?auto_150949 - BLOCK
      ?auto_150948 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150941 ) ( ON ?auto_150942 ?auto_150941 ) ( ON ?auto_150943 ?auto_150942 ) ( ON ?auto_150944 ?auto_150943 ) ( not ( = ?auto_150941 ?auto_150942 ) ) ( not ( = ?auto_150941 ?auto_150943 ) ) ( not ( = ?auto_150941 ?auto_150944 ) ) ( not ( = ?auto_150941 ?auto_150945 ) ) ( not ( = ?auto_150941 ?auto_150946 ) ) ( not ( = ?auto_150941 ?auto_150947 ) ) ( not ( = ?auto_150941 ?auto_150949 ) ) ( not ( = ?auto_150942 ?auto_150943 ) ) ( not ( = ?auto_150942 ?auto_150944 ) ) ( not ( = ?auto_150942 ?auto_150945 ) ) ( not ( = ?auto_150942 ?auto_150946 ) ) ( not ( = ?auto_150942 ?auto_150947 ) ) ( not ( = ?auto_150942 ?auto_150949 ) ) ( not ( = ?auto_150943 ?auto_150944 ) ) ( not ( = ?auto_150943 ?auto_150945 ) ) ( not ( = ?auto_150943 ?auto_150946 ) ) ( not ( = ?auto_150943 ?auto_150947 ) ) ( not ( = ?auto_150943 ?auto_150949 ) ) ( not ( = ?auto_150944 ?auto_150945 ) ) ( not ( = ?auto_150944 ?auto_150946 ) ) ( not ( = ?auto_150944 ?auto_150947 ) ) ( not ( = ?auto_150944 ?auto_150949 ) ) ( not ( = ?auto_150945 ?auto_150946 ) ) ( not ( = ?auto_150945 ?auto_150947 ) ) ( not ( = ?auto_150945 ?auto_150949 ) ) ( not ( = ?auto_150946 ?auto_150947 ) ) ( not ( = ?auto_150946 ?auto_150949 ) ) ( not ( = ?auto_150947 ?auto_150949 ) ) ( ON ?auto_150949 ?auto_150948 ) ( not ( = ?auto_150941 ?auto_150948 ) ) ( not ( = ?auto_150942 ?auto_150948 ) ) ( not ( = ?auto_150943 ?auto_150948 ) ) ( not ( = ?auto_150944 ?auto_150948 ) ) ( not ( = ?auto_150945 ?auto_150948 ) ) ( not ( = ?auto_150946 ?auto_150948 ) ) ( not ( = ?auto_150947 ?auto_150948 ) ) ( not ( = ?auto_150949 ?auto_150948 ) ) ( ON ?auto_150947 ?auto_150949 ) ( ON-TABLE ?auto_150948 ) ( ON ?auto_150946 ?auto_150947 ) ( CLEAR ?auto_150946 ) ( HOLDING ?auto_150945 ) ( CLEAR ?auto_150944 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_150941 ?auto_150942 ?auto_150943 ?auto_150944 ?auto_150945 )
      ( MAKE-7PILE ?auto_150941 ?auto_150942 ?auto_150943 ?auto_150944 ?auto_150945 ?auto_150946 ?auto_150947 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150950 - BLOCK
      ?auto_150951 - BLOCK
      ?auto_150952 - BLOCK
      ?auto_150953 - BLOCK
      ?auto_150954 - BLOCK
      ?auto_150955 - BLOCK
      ?auto_150956 - BLOCK
    )
    :vars
    (
      ?auto_150957 - BLOCK
      ?auto_150958 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150950 ) ( ON ?auto_150951 ?auto_150950 ) ( ON ?auto_150952 ?auto_150951 ) ( ON ?auto_150953 ?auto_150952 ) ( not ( = ?auto_150950 ?auto_150951 ) ) ( not ( = ?auto_150950 ?auto_150952 ) ) ( not ( = ?auto_150950 ?auto_150953 ) ) ( not ( = ?auto_150950 ?auto_150954 ) ) ( not ( = ?auto_150950 ?auto_150955 ) ) ( not ( = ?auto_150950 ?auto_150956 ) ) ( not ( = ?auto_150950 ?auto_150957 ) ) ( not ( = ?auto_150951 ?auto_150952 ) ) ( not ( = ?auto_150951 ?auto_150953 ) ) ( not ( = ?auto_150951 ?auto_150954 ) ) ( not ( = ?auto_150951 ?auto_150955 ) ) ( not ( = ?auto_150951 ?auto_150956 ) ) ( not ( = ?auto_150951 ?auto_150957 ) ) ( not ( = ?auto_150952 ?auto_150953 ) ) ( not ( = ?auto_150952 ?auto_150954 ) ) ( not ( = ?auto_150952 ?auto_150955 ) ) ( not ( = ?auto_150952 ?auto_150956 ) ) ( not ( = ?auto_150952 ?auto_150957 ) ) ( not ( = ?auto_150953 ?auto_150954 ) ) ( not ( = ?auto_150953 ?auto_150955 ) ) ( not ( = ?auto_150953 ?auto_150956 ) ) ( not ( = ?auto_150953 ?auto_150957 ) ) ( not ( = ?auto_150954 ?auto_150955 ) ) ( not ( = ?auto_150954 ?auto_150956 ) ) ( not ( = ?auto_150954 ?auto_150957 ) ) ( not ( = ?auto_150955 ?auto_150956 ) ) ( not ( = ?auto_150955 ?auto_150957 ) ) ( not ( = ?auto_150956 ?auto_150957 ) ) ( ON ?auto_150957 ?auto_150958 ) ( not ( = ?auto_150950 ?auto_150958 ) ) ( not ( = ?auto_150951 ?auto_150958 ) ) ( not ( = ?auto_150952 ?auto_150958 ) ) ( not ( = ?auto_150953 ?auto_150958 ) ) ( not ( = ?auto_150954 ?auto_150958 ) ) ( not ( = ?auto_150955 ?auto_150958 ) ) ( not ( = ?auto_150956 ?auto_150958 ) ) ( not ( = ?auto_150957 ?auto_150958 ) ) ( ON ?auto_150956 ?auto_150957 ) ( ON-TABLE ?auto_150958 ) ( ON ?auto_150955 ?auto_150956 ) ( CLEAR ?auto_150953 ) ( ON ?auto_150954 ?auto_150955 ) ( CLEAR ?auto_150954 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_150958 ?auto_150957 ?auto_150956 ?auto_150955 )
      ( MAKE-7PILE ?auto_150950 ?auto_150951 ?auto_150952 ?auto_150953 ?auto_150954 ?auto_150955 ?auto_150956 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150959 - BLOCK
      ?auto_150960 - BLOCK
      ?auto_150961 - BLOCK
      ?auto_150962 - BLOCK
      ?auto_150963 - BLOCK
      ?auto_150964 - BLOCK
      ?auto_150965 - BLOCK
    )
    :vars
    (
      ?auto_150966 - BLOCK
      ?auto_150967 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150959 ) ( ON ?auto_150960 ?auto_150959 ) ( ON ?auto_150961 ?auto_150960 ) ( not ( = ?auto_150959 ?auto_150960 ) ) ( not ( = ?auto_150959 ?auto_150961 ) ) ( not ( = ?auto_150959 ?auto_150962 ) ) ( not ( = ?auto_150959 ?auto_150963 ) ) ( not ( = ?auto_150959 ?auto_150964 ) ) ( not ( = ?auto_150959 ?auto_150965 ) ) ( not ( = ?auto_150959 ?auto_150966 ) ) ( not ( = ?auto_150960 ?auto_150961 ) ) ( not ( = ?auto_150960 ?auto_150962 ) ) ( not ( = ?auto_150960 ?auto_150963 ) ) ( not ( = ?auto_150960 ?auto_150964 ) ) ( not ( = ?auto_150960 ?auto_150965 ) ) ( not ( = ?auto_150960 ?auto_150966 ) ) ( not ( = ?auto_150961 ?auto_150962 ) ) ( not ( = ?auto_150961 ?auto_150963 ) ) ( not ( = ?auto_150961 ?auto_150964 ) ) ( not ( = ?auto_150961 ?auto_150965 ) ) ( not ( = ?auto_150961 ?auto_150966 ) ) ( not ( = ?auto_150962 ?auto_150963 ) ) ( not ( = ?auto_150962 ?auto_150964 ) ) ( not ( = ?auto_150962 ?auto_150965 ) ) ( not ( = ?auto_150962 ?auto_150966 ) ) ( not ( = ?auto_150963 ?auto_150964 ) ) ( not ( = ?auto_150963 ?auto_150965 ) ) ( not ( = ?auto_150963 ?auto_150966 ) ) ( not ( = ?auto_150964 ?auto_150965 ) ) ( not ( = ?auto_150964 ?auto_150966 ) ) ( not ( = ?auto_150965 ?auto_150966 ) ) ( ON ?auto_150966 ?auto_150967 ) ( not ( = ?auto_150959 ?auto_150967 ) ) ( not ( = ?auto_150960 ?auto_150967 ) ) ( not ( = ?auto_150961 ?auto_150967 ) ) ( not ( = ?auto_150962 ?auto_150967 ) ) ( not ( = ?auto_150963 ?auto_150967 ) ) ( not ( = ?auto_150964 ?auto_150967 ) ) ( not ( = ?auto_150965 ?auto_150967 ) ) ( not ( = ?auto_150966 ?auto_150967 ) ) ( ON ?auto_150965 ?auto_150966 ) ( ON-TABLE ?auto_150967 ) ( ON ?auto_150964 ?auto_150965 ) ( ON ?auto_150963 ?auto_150964 ) ( CLEAR ?auto_150963 ) ( HOLDING ?auto_150962 ) ( CLEAR ?auto_150961 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_150959 ?auto_150960 ?auto_150961 ?auto_150962 )
      ( MAKE-7PILE ?auto_150959 ?auto_150960 ?auto_150961 ?auto_150962 ?auto_150963 ?auto_150964 ?auto_150965 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150968 - BLOCK
      ?auto_150969 - BLOCK
      ?auto_150970 - BLOCK
      ?auto_150971 - BLOCK
      ?auto_150972 - BLOCK
      ?auto_150973 - BLOCK
      ?auto_150974 - BLOCK
    )
    :vars
    (
      ?auto_150975 - BLOCK
      ?auto_150976 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150968 ) ( ON ?auto_150969 ?auto_150968 ) ( ON ?auto_150970 ?auto_150969 ) ( not ( = ?auto_150968 ?auto_150969 ) ) ( not ( = ?auto_150968 ?auto_150970 ) ) ( not ( = ?auto_150968 ?auto_150971 ) ) ( not ( = ?auto_150968 ?auto_150972 ) ) ( not ( = ?auto_150968 ?auto_150973 ) ) ( not ( = ?auto_150968 ?auto_150974 ) ) ( not ( = ?auto_150968 ?auto_150975 ) ) ( not ( = ?auto_150969 ?auto_150970 ) ) ( not ( = ?auto_150969 ?auto_150971 ) ) ( not ( = ?auto_150969 ?auto_150972 ) ) ( not ( = ?auto_150969 ?auto_150973 ) ) ( not ( = ?auto_150969 ?auto_150974 ) ) ( not ( = ?auto_150969 ?auto_150975 ) ) ( not ( = ?auto_150970 ?auto_150971 ) ) ( not ( = ?auto_150970 ?auto_150972 ) ) ( not ( = ?auto_150970 ?auto_150973 ) ) ( not ( = ?auto_150970 ?auto_150974 ) ) ( not ( = ?auto_150970 ?auto_150975 ) ) ( not ( = ?auto_150971 ?auto_150972 ) ) ( not ( = ?auto_150971 ?auto_150973 ) ) ( not ( = ?auto_150971 ?auto_150974 ) ) ( not ( = ?auto_150971 ?auto_150975 ) ) ( not ( = ?auto_150972 ?auto_150973 ) ) ( not ( = ?auto_150972 ?auto_150974 ) ) ( not ( = ?auto_150972 ?auto_150975 ) ) ( not ( = ?auto_150973 ?auto_150974 ) ) ( not ( = ?auto_150973 ?auto_150975 ) ) ( not ( = ?auto_150974 ?auto_150975 ) ) ( ON ?auto_150975 ?auto_150976 ) ( not ( = ?auto_150968 ?auto_150976 ) ) ( not ( = ?auto_150969 ?auto_150976 ) ) ( not ( = ?auto_150970 ?auto_150976 ) ) ( not ( = ?auto_150971 ?auto_150976 ) ) ( not ( = ?auto_150972 ?auto_150976 ) ) ( not ( = ?auto_150973 ?auto_150976 ) ) ( not ( = ?auto_150974 ?auto_150976 ) ) ( not ( = ?auto_150975 ?auto_150976 ) ) ( ON ?auto_150974 ?auto_150975 ) ( ON-TABLE ?auto_150976 ) ( ON ?auto_150973 ?auto_150974 ) ( ON ?auto_150972 ?auto_150973 ) ( CLEAR ?auto_150970 ) ( ON ?auto_150971 ?auto_150972 ) ( CLEAR ?auto_150971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_150976 ?auto_150975 ?auto_150974 ?auto_150973 ?auto_150972 )
      ( MAKE-7PILE ?auto_150968 ?auto_150969 ?auto_150970 ?auto_150971 ?auto_150972 ?auto_150973 ?auto_150974 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150977 - BLOCK
      ?auto_150978 - BLOCK
      ?auto_150979 - BLOCK
      ?auto_150980 - BLOCK
      ?auto_150981 - BLOCK
      ?auto_150982 - BLOCK
      ?auto_150983 - BLOCK
    )
    :vars
    (
      ?auto_150984 - BLOCK
      ?auto_150985 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150977 ) ( ON ?auto_150978 ?auto_150977 ) ( not ( = ?auto_150977 ?auto_150978 ) ) ( not ( = ?auto_150977 ?auto_150979 ) ) ( not ( = ?auto_150977 ?auto_150980 ) ) ( not ( = ?auto_150977 ?auto_150981 ) ) ( not ( = ?auto_150977 ?auto_150982 ) ) ( not ( = ?auto_150977 ?auto_150983 ) ) ( not ( = ?auto_150977 ?auto_150984 ) ) ( not ( = ?auto_150978 ?auto_150979 ) ) ( not ( = ?auto_150978 ?auto_150980 ) ) ( not ( = ?auto_150978 ?auto_150981 ) ) ( not ( = ?auto_150978 ?auto_150982 ) ) ( not ( = ?auto_150978 ?auto_150983 ) ) ( not ( = ?auto_150978 ?auto_150984 ) ) ( not ( = ?auto_150979 ?auto_150980 ) ) ( not ( = ?auto_150979 ?auto_150981 ) ) ( not ( = ?auto_150979 ?auto_150982 ) ) ( not ( = ?auto_150979 ?auto_150983 ) ) ( not ( = ?auto_150979 ?auto_150984 ) ) ( not ( = ?auto_150980 ?auto_150981 ) ) ( not ( = ?auto_150980 ?auto_150982 ) ) ( not ( = ?auto_150980 ?auto_150983 ) ) ( not ( = ?auto_150980 ?auto_150984 ) ) ( not ( = ?auto_150981 ?auto_150982 ) ) ( not ( = ?auto_150981 ?auto_150983 ) ) ( not ( = ?auto_150981 ?auto_150984 ) ) ( not ( = ?auto_150982 ?auto_150983 ) ) ( not ( = ?auto_150982 ?auto_150984 ) ) ( not ( = ?auto_150983 ?auto_150984 ) ) ( ON ?auto_150984 ?auto_150985 ) ( not ( = ?auto_150977 ?auto_150985 ) ) ( not ( = ?auto_150978 ?auto_150985 ) ) ( not ( = ?auto_150979 ?auto_150985 ) ) ( not ( = ?auto_150980 ?auto_150985 ) ) ( not ( = ?auto_150981 ?auto_150985 ) ) ( not ( = ?auto_150982 ?auto_150985 ) ) ( not ( = ?auto_150983 ?auto_150985 ) ) ( not ( = ?auto_150984 ?auto_150985 ) ) ( ON ?auto_150983 ?auto_150984 ) ( ON-TABLE ?auto_150985 ) ( ON ?auto_150982 ?auto_150983 ) ( ON ?auto_150981 ?auto_150982 ) ( ON ?auto_150980 ?auto_150981 ) ( CLEAR ?auto_150980 ) ( HOLDING ?auto_150979 ) ( CLEAR ?auto_150978 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_150977 ?auto_150978 ?auto_150979 )
      ( MAKE-7PILE ?auto_150977 ?auto_150978 ?auto_150979 ?auto_150980 ?auto_150981 ?auto_150982 ?auto_150983 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150986 - BLOCK
      ?auto_150987 - BLOCK
      ?auto_150988 - BLOCK
      ?auto_150989 - BLOCK
      ?auto_150990 - BLOCK
      ?auto_150991 - BLOCK
      ?auto_150992 - BLOCK
    )
    :vars
    (
      ?auto_150993 - BLOCK
      ?auto_150994 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150986 ) ( ON ?auto_150987 ?auto_150986 ) ( not ( = ?auto_150986 ?auto_150987 ) ) ( not ( = ?auto_150986 ?auto_150988 ) ) ( not ( = ?auto_150986 ?auto_150989 ) ) ( not ( = ?auto_150986 ?auto_150990 ) ) ( not ( = ?auto_150986 ?auto_150991 ) ) ( not ( = ?auto_150986 ?auto_150992 ) ) ( not ( = ?auto_150986 ?auto_150993 ) ) ( not ( = ?auto_150987 ?auto_150988 ) ) ( not ( = ?auto_150987 ?auto_150989 ) ) ( not ( = ?auto_150987 ?auto_150990 ) ) ( not ( = ?auto_150987 ?auto_150991 ) ) ( not ( = ?auto_150987 ?auto_150992 ) ) ( not ( = ?auto_150987 ?auto_150993 ) ) ( not ( = ?auto_150988 ?auto_150989 ) ) ( not ( = ?auto_150988 ?auto_150990 ) ) ( not ( = ?auto_150988 ?auto_150991 ) ) ( not ( = ?auto_150988 ?auto_150992 ) ) ( not ( = ?auto_150988 ?auto_150993 ) ) ( not ( = ?auto_150989 ?auto_150990 ) ) ( not ( = ?auto_150989 ?auto_150991 ) ) ( not ( = ?auto_150989 ?auto_150992 ) ) ( not ( = ?auto_150989 ?auto_150993 ) ) ( not ( = ?auto_150990 ?auto_150991 ) ) ( not ( = ?auto_150990 ?auto_150992 ) ) ( not ( = ?auto_150990 ?auto_150993 ) ) ( not ( = ?auto_150991 ?auto_150992 ) ) ( not ( = ?auto_150991 ?auto_150993 ) ) ( not ( = ?auto_150992 ?auto_150993 ) ) ( ON ?auto_150993 ?auto_150994 ) ( not ( = ?auto_150986 ?auto_150994 ) ) ( not ( = ?auto_150987 ?auto_150994 ) ) ( not ( = ?auto_150988 ?auto_150994 ) ) ( not ( = ?auto_150989 ?auto_150994 ) ) ( not ( = ?auto_150990 ?auto_150994 ) ) ( not ( = ?auto_150991 ?auto_150994 ) ) ( not ( = ?auto_150992 ?auto_150994 ) ) ( not ( = ?auto_150993 ?auto_150994 ) ) ( ON ?auto_150992 ?auto_150993 ) ( ON-TABLE ?auto_150994 ) ( ON ?auto_150991 ?auto_150992 ) ( ON ?auto_150990 ?auto_150991 ) ( ON ?auto_150989 ?auto_150990 ) ( CLEAR ?auto_150987 ) ( ON ?auto_150988 ?auto_150989 ) ( CLEAR ?auto_150988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_150994 ?auto_150993 ?auto_150992 ?auto_150991 ?auto_150990 ?auto_150989 )
      ( MAKE-7PILE ?auto_150986 ?auto_150987 ?auto_150988 ?auto_150989 ?auto_150990 ?auto_150991 ?auto_150992 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150995 - BLOCK
      ?auto_150996 - BLOCK
      ?auto_150997 - BLOCK
      ?auto_150998 - BLOCK
      ?auto_150999 - BLOCK
      ?auto_151000 - BLOCK
      ?auto_151001 - BLOCK
    )
    :vars
    (
      ?auto_151002 - BLOCK
      ?auto_151003 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150995 ) ( not ( = ?auto_150995 ?auto_150996 ) ) ( not ( = ?auto_150995 ?auto_150997 ) ) ( not ( = ?auto_150995 ?auto_150998 ) ) ( not ( = ?auto_150995 ?auto_150999 ) ) ( not ( = ?auto_150995 ?auto_151000 ) ) ( not ( = ?auto_150995 ?auto_151001 ) ) ( not ( = ?auto_150995 ?auto_151002 ) ) ( not ( = ?auto_150996 ?auto_150997 ) ) ( not ( = ?auto_150996 ?auto_150998 ) ) ( not ( = ?auto_150996 ?auto_150999 ) ) ( not ( = ?auto_150996 ?auto_151000 ) ) ( not ( = ?auto_150996 ?auto_151001 ) ) ( not ( = ?auto_150996 ?auto_151002 ) ) ( not ( = ?auto_150997 ?auto_150998 ) ) ( not ( = ?auto_150997 ?auto_150999 ) ) ( not ( = ?auto_150997 ?auto_151000 ) ) ( not ( = ?auto_150997 ?auto_151001 ) ) ( not ( = ?auto_150997 ?auto_151002 ) ) ( not ( = ?auto_150998 ?auto_150999 ) ) ( not ( = ?auto_150998 ?auto_151000 ) ) ( not ( = ?auto_150998 ?auto_151001 ) ) ( not ( = ?auto_150998 ?auto_151002 ) ) ( not ( = ?auto_150999 ?auto_151000 ) ) ( not ( = ?auto_150999 ?auto_151001 ) ) ( not ( = ?auto_150999 ?auto_151002 ) ) ( not ( = ?auto_151000 ?auto_151001 ) ) ( not ( = ?auto_151000 ?auto_151002 ) ) ( not ( = ?auto_151001 ?auto_151002 ) ) ( ON ?auto_151002 ?auto_151003 ) ( not ( = ?auto_150995 ?auto_151003 ) ) ( not ( = ?auto_150996 ?auto_151003 ) ) ( not ( = ?auto_150997 ?auto_151003 ) ) ( not ( = ?auto_150998 ?auto_151003 ) ) ( not ( = ?auto_150999 ?auto_151003 ) ) ( not ( = ?auto_151000 ?auto_151003 ) ) ( not ( = ?auto_151001 ?auto_151003 ) ) ( not ( = ?auto_151002 ?auto_151003 ) ) ( ON ?auto_151001 ?auto_151002 ) ( ON-TABLE ?auto_151003 ) ( ON ?auto_151000 ?auto_151001 ) ( ON ?auto_150999 ?auto_151000 ) ( ON ?auto_150998 ?auto_150999 ) ( ON ?auto_150997 ?auto_150998 ) ( CLEAR ?auto_150997 ) ( HOLDING ?auto_150996 ) ( CLEAR ?auto_150995 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_150995 ?auto_150996 )
      ( MAKE-7PILE ?auto_150995 ?auto_150996 ?auto_150997 ?auto_150998 ?auto_150999 ?auto_151000 ?auto_151001 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_151004 - BLOCK
      ?auto_151005 - BLOCK
      ?auto_151006 - BLOCK
      ?auto_151007 - BLOCK
      ?auto_151008 - BLOCK
      ?auto_151009 - BLOCK
      ?auto_151010 - BLOCK
    )
    :vars
    (
      ?auto_151011 - BLOCK
      ?auto_151012 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151004 ) ( not ( = ?auto_151004 ?auto_151005 ) ) ( not ( = ?auto_151004 ?auto_151006 ) ) ( not ( = ?auto_151004 ?auto_151007 ) ) ( not ( = ?auto_151004 ?auto_151008 ) ) ( not ( = ?auto_151004 ?auto_151009 ) ) ( not ( = ?auto_151004 ?auto_151010 ) ) ( not ( = ?auto_151004 ?auto_151011 ) ) ( not ( = ?auto_151005 ?auto_151006 ) ) ( not ( = ?auto_151005 ?auto_151007 ) ) ( not ( = ?auto_151005 ?auto_151008 ) ) ( not ( = ?auto_151005 ?auto_151009 ) ) ( not ( = ?auto_151005 ?auto_151010 ) ) ( not ( = ?auto_151005 ?auto_151011 ) ) ( not ( = ?auto_151006 ?auto_151007 ) ) ( not ( = ?auto_151006 ?auto_151008 ) ) ( not ( = ?auto_151006 ?auto_151009 ) ) ( not ( = ?auto_151006 ?auto_151010 ) ) ( not ( = ?auto_151006 ?auto_151011 ) ) ( not ( = ?auto_151007 ?auto_151008 ) ) ( not ( = ?auto_151007 ?auto_151009 ) ) ( not ( = ?auto_151007 ?auto_151010 ) ) ( not ( = ?auto_151007 ?auto_151011 ) ) ( not ( = ?auto_151008 ?auto_151009 ) ) ( not ( = ?auto_151008 ?auto_151010 ) ) ( not ( = ?auto_151008 ?auto_151011 ) ) ( not ( = ?auto_151009 ?auto_151010 ) ) ( not ( = ?auto_151009 ?auto_151011 ) ) ( not ( = ?auto_151010 ?auto_151011 ) ) ( ON ?auto_151011 ?auto_151012 ) ( not ( = ?auto_151004 ?auto_151012 ) ) ( not ( = ?auto_151005 ?auto_151012 ) ) ( not ( = ?auto_151006 ?auto_151012 ) ) ( not ( = ?auto_151007 ?auto_151012 ) ) ( not ( = ?auto_151008 ?auto_151012 ) ) ( not ( = ?auto_151009 ?auto_151012 ) ) ( not ( = ?auto_151010 ?auto_151012 ) ) ( not ( = ?auto_151011 ?auto_151012 ) ) ( ON ?auto_151010 ?auto_151011 ) ( ON-TABLE ?auto_151012 ) ( ON ?auto_151009 ?auto_151010 ) ( ON ?auto_151008 ?auto_151009 ) ( ON ?auto_151007 ?auto_151008 ) ( ON ?auto_151006 ?auto_151007 ) ( CLEAR ?auto_151004 ) ( ON ?auto_151005 ?auto_151006 ) ( CLEAR ?auto_151005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_151012 ?auto_151011 ?auto_151010 ?auto_151009 ?auto_151008 ?auto_151007 ?auto_151006 )
      ( MAKE-7PILE ?auto_151004 ?auto_151005 ?auto_151006 ?auto_151007 ?auto_151008 ?auto_151009 ?auto_151010 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_151013 - BLOCK
      ?auto_151014 - BLOCK
      ?auto_151015 - BLOCK
      ?auto_151016 - BLOCK
      ?auto_151017 - BLOCK
      ?auto_151018 - BLOCK
      ?auto_151019 - BLOCK
    )
    :vars
    (
      ?auto_151020 - BLOCK
      ?auto_151021 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151013 ?auto_151014 ) ) ( not ( = ?auto_151013 ?auto_151015 ) ) ( not ( = ?auto_151013 ?auto_151016 ) ) ( not ( = ?auto_151013 ?auto_151017 ) ) ( not ( = ?auto_151013 ?auto_151018 ) ) ( not ( = ?auto_151013 ?auto_151019 ) ) ( not ( = ?auto_151013 ?auto_151020 ) ) ( not ( = ?auto_151014 ?auto_151015 ) ) ( not ( = ?auto_151014 ?auto_151016 ) ) ( not ( = ?auto_151014 ?auto_151017 ) ) ( not ( = ?auto_151014 ?auto_151018 ) ) ( not ( = ?auto_151014 ?auto_151019 ) ) ( not ( = ?auto_151014 ?auto_151020 ) ) ( not ( = ?auto_151015 ?auto_151016 ) ) ( not ( = ?auto_151015 ?auto_151017 ) ) ( not ( = ?auto_151015 ?auto_151018 ) ) ( not ( = ?auto_151015 ?auto_151019 ) ) ( not ( = ?auto_151015 ?auto_151020 ) ) ( not ( = ?auto_151016 ?auto_151017 ) ) ( not ( = ?auto_151016 ?auto_151018 ) ) ( not ( = ?auto_151016 ?auto_151019 ) ) ( not ( = ?auto_151016 ?auto_151020 ) ) ( not ( = ?auto_151017 ?auto_151018 ) ) ( not ( = ?auto_151017 ?auto_151019 ) ) ( not ( = ?auto_151017 ?auto_151020 ) ) ( not ( = ?auto_151018 ?auto_151019 ) ) ( not ( = ?auto_151018 ?auto_151020 ) ) ( not ( = ?auto_151019 ?auto_151020 ) ) ( ON ?auto_151020 ?auto_151021 ) ( not ( = ?auto_151013 ?auto_151021 ) ) ( not ( = ?auto_151014 ?auto_151021 ) ) ( not ( = ?auto_151015 ?auto_151021 ) ) ( not ( = ?auto_151016 ?auto_151021 ) ) ( not ( = ?auto_151017 ?auto_151021 ) ) ( not ( = ?auto_151018 ?auto_151021 ) ) ( not ( = ?auto_151019 ?auto_151021 ) ) ( not ( = ?auto_151020 ?auto_151021 ) ) ( ON ?auto_151019 ?auto_151020 ) ( ON-TABLE ?auto_151021 ) ( ON ?auto_151018 ?auto_151019 ) ( ON ?auto_151017 ?auto_151018 ) ( ON ?auto_151016 ?auto_151017 ) ( ON ?auto_151015 ?auto_151016 ) ( ON ?auto_151014 ?auto_151015 ) ( CLEAR ?auto_151014 ) ( HOLDING ?auto_151013 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_151013 )
      ( MAKE-7PILE ?auto_151013 ?auto_151014 ?auto_151015 ?auto_151016 ?auto_151017 ?auto_151018 ?auto_151019 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_151022 - BLOCK
      ?auto_151023 - BLOCK
      ?auto_151024 - BLOCK
      ?auto_151025 - BLOCK
      ?auto_151026 - BLOCK
      ?auto_151027 - BLOCK
      ?auto_151028 - BLOCK
    )
    :vars
    (
      ?auto_151030 - BLOCK
      ?auto_151029 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151022 ?auto_151023 ) ) ( not ( = ?auto_151022 ?auto_151024 ) ) ( not ( = ?auto_151022 ?auto_151025 ) ) ( not ( = ?auto_151022 ?auto_151026 ) ) ( not ( = ?auto_151022 ?auto_151027 ) ) ( not ( = ?auto_151022 ?auto_151028 ) ) ( not ( = ?auto_151022 ?auto_151030 ) ) ( not ( = ?auto_151023 ?auto_151024 ) ) ( not ( = ?auto_151023 ?auto_151025 ) ) ( not ( = ?auto_151023 ?auto_151026 ) ) ( not ( = ?auto_151023 ?auto_151027 ) ) ( not ( = ?auto_151023 ?auto_151028 ) ) ( not ( = ?auto_151023 ?auto_151030 ) ) ( not ( = ?auto_151024 ?auto_151025 ) ) ( not ( = ?auto_151024 ?auto_151026 ) ) ( not ( = ?auto_151024 ?auto_151027 ) ) ( not ( = ?auto_151024 ?auto_151028 ) ) ( not ( = ?auto_151024 ?auto_151030 ) ) ( not ( = ?auto_151025 ?auto_151026 ) ) ( not ( = ?auto_151025 ?auto_151027 ) ) ( not ( = ?auto_151025 ?auto_151028 ) ) ( not ( = ?auto_151025 ?auto_151030 ) ) ( not ( = ?auto_151026 ?auto_151027 ) ) ( not ( = ?auto_151026 ?auto_151028 ) ) ( not ( = ?auto_151026 ?auto_151030 ) ) ( not ( = ?auto_151027 ?auto_151028 ) ) ( not ( = ?auto_151027 ?auto_151030 ) ) ( not ( = ?auto_151028 ?auto_151030 ) ) ( ON ?auto_151030 ?auto_151029 ) ( not ( = ?auto_151022 ?auto_151029 ) ) ( not ( = ?auto_151023 ?auto_151029 ) ) ( not ( = ?auto_151024 ?auto_151029 ) ) ( not ( = ?auto_151025 ?auto_151029 ) ) ( not ( = ?auto_151026 ?auto_151029 ) ) ( not ( = ?auto_151027 ?auto_151029 ) ) ( not ( = ?auto_151028 ?auto_151029 ) ) ( not ( = ?auto_151030 ?auto_151029 ) ) ( ON ?auto_151028 ?auto_151030 ) ( ON-TABLE ?auto_151029 ) ( ON ?auto_151027 ?auto_151028 ) ( ON ?auto_151026 ?auto_151027 ) ( ON ?auto_151025 ?auto_151026 ) ( ON ?auto_151024 ?auto_151025 ) ( ON ?auto_151023 ?auto_151024 ) ( ON ?auto_151022 ?auto_151023 ) ( CLEAR ?auto_151022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_151029 ?auto_151030 ?auto_151028 ?auto_151027 ?auto_151026 ?auto_151025 ?auto_151024 ?auto_151023 )
      ( MAKE-7PILE ?auto_151022 ?auto_151023 ?auto_151024 ?auto_151025 ?auto_151026 ?auto_151027 ?auto_151028 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_151032 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_151032 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_151032 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_151033 - BLOCK
    )
    :vars
    (
      ?auto_151034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151033 ?auto_151034 ) ( CLEAR ?auto_151033 ) ( HAND-EMPTY ) ( not ( = ?auto_151033 ?auto_151034 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_151033 ?auto_151034 )
      ( MAKE-1PILE ?auto_151033 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_151035 - BLOCK
    )
    :vars
    (
      ?auto_151036 - BLOCK
      ?auto_151041 - BLOCK
      ?auto_151039 - BLOCK
      ?auto_151038 - BLOCK
      ?auto_151042 - BLOCK
      ?auto_151040 - BLOCK
      ?auto_151037 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151035 ?auto_151036 ) ) ( HOLDING ?auto_151035 ) ( CLEAR ?auto_151036 ) ( ON-TABLE ?auto_151041 ) ( ON ?auto_151039 ?auto_151041 ) ( ON ?auto_151038 ?auto_151039 ) ( ON ?auto_151042 ?auto_151038 ) ( ON ?auto_151040 ?auto_151042 ) ( ON ?auto_151037 ?auto_151040 ) ( ON ?auto_151036 ?auto_151037 ) ( not ( = ?auto_151041 ?auto_151039 ) ) ( not ( = ?auto_151041 ?auto_151038 ) ) ( not ( = ?auto_151041 ?auto_151042 ) ) ( not ( = ?auto_151041 ?auto_151040 ) ) ( not ( = ?auto_151041 ?auto_151037 ) ) ( not ( = ?auto_151041 ?auto_151036 ) ) ( not ( = ?auto_151041 ?auto_151035 ) ) ( not ( = ?auto_151039 ?auto_151038 ) ) ( not ( = ?auto_151039 ?auto_151042 ) ) ( not ( = ?auto_151039 ?auto_151040 ) ) ( not ( = ?auto_151039 ?auto_151037 ) ) ( not ( = ?auto_151039 ?auto_151036 ) ) ( not ( = ?auto_151039 ?auto_151035 ) ) ( not ( = ?auto_151038 ?auto_151042 ) ) ( not ( = ?auto_151038 ?auto_151040 ) ) ( not ( = ?auto_151038 ?auto_151037 ) ) ( not ( = ?auto_151038 ?auto_151036 ) ) ( not ( = ?auto_151038 ?auto_151035 ) ) ( not ( = ?auto_151042 ?auto_151040 ) ) ( not ( = ?auto_151042 ?auto_151037 ) ) ( not ( = ?auto_151042 ?auto_151036 ) ) ( not ( = ?auto_151042 ?auto_151035 ) ) ( not ( = ?auto_151040 ?auto_151037 ) ) ( not ( = ?auto_151040 ?auto_151036 ) ) ( not ( = ?auto_151040 ?auto_151035 ) ) ( not ( = ?auto_151037 ?auto_151036 ) ) ( not ( = ?auto_151037 ?auto_151035 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_151041 ?auto_151039 ?auto_151038 ?auto_151042 ?auto_151040 ?auto_151037 ?auto_151036 ?auto_151035 )
      ( MAKE-1PILE ?auto_151035 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_151043 - BLOCK
    )
    :vars
    (
      ?auto_151046 - BLOCK
      ?auto_151049 - BLOCK
      ?auto_151045 - BLOCK
      ?auto_151050 - BLOCK
      ?auto_151048 - BLOCK
      ?auto_151047 - BLOCK
      ?auto_151044 - BLOCK
      ?auto_151051 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151043 ?auto_151046 ) ) ( CLEAR ?auto_151046 ) ( ON-TABLE ?auto_151049 ) ( ON ?auto_151045 ?auto_151049 ) ( ON ?auto_151050 ?auto_151045 ) ( ON ?auto_151048 ?auto_151050 ) ( ON ?auto_151047 ?auto_151048 ) ( ON ?auto_151044 ?auto_151047 ) ( ON ?auto_151046 ?auto_151044 ) ( not ( = ?auto_151049 ?auto_151045 ) ) ( not ( = ?auto_151049 ?auto_151050 ) ) ( not ( = ?auto_151049 ?auto_151048 ) ) ( not ( = ?auto_151049 ?auto_151047 ) ) ( not ( = ?auto_151049 ?auto_151044 ) ) ( not ( = ?auto_151049 ?auto_151046 ) ) ( not ( = ?auto_151049 ?auto_151043 ) ) ( not ( = ?auto_151045 ?auto_151050 ) ) ( not ( = ?auto_151045 ?auto_151048 ) ) ( not ( = ?auto_151045 ?auto_151047 ) ) ( not ( = ?auto_151045 ?auto_151044 ) ) ( not ( = ?auto_151045 ?auto_151046 ) ) ( not ( = ?auto_151045 ?auto_151043 ) ) ( not ( = ?auto_151050 ?auto_151048 ) ) ( not ( = ?auto_151050 ?auto_151047 ) ) ( not ( = ?auto_151050 ?auto_151044 ) ) ( not ( = ?auto_151050 ?auto_151046 ) ) ( not ( = ?auto_151050 ?auto_151043 ) ) ( not ( = ?auto_151048 ?auto_151047 ) ) ( not ( = ?auto_151048 ?auto_151044 ) ) ( not ( = ?auto_151048 ?auto_151046 ) ) ( not ( = ?auto_151048 ?auto_151043 ) ) ( not ( = ?auto_151047 ?auto_151044 ) ) ( not ( = ?auto_151047 ?auto_151046 ) ) ( not ( = ?auto_151047 ?auto_151043 ) ) ( not ( = ?auto_151044 ?auto_151046 ) ) ( not ( = ?auto_151044 ?auto_151043 ) ) ( ON ?auto_151043 ?auto_151051 ) ( CLEAR ?auto_151043 ) ( HAND-EMPTY ) ( not ( = ?auto_151043 ?auto_151051 ) ) ( not ( = ?auto_151046 ?auto_151051 ) ) ( not ( = ?auto_151049 ?auto_151051 ) ) ( not ( = ?auto_151045 ?auto_151051 ) ) ( not ( = ?auto_151050 ?auto_151051 ) ) ( not ( = ?auto_151048 ?auto_151051 ) ) ( not ( = ?auto_151047 ?auto_151051 ) ) ( not ( = ?auto_151044 ?auto_151051 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_151043 ?auto_151051 )
      ( MAKE-1PILE ?auto_151043 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_151052 - BLOCK
    )
    :vars
    (
      ?auto_151056 - BLOCK
      ?auto_151060 - BLOCK
      ?auto_151054 - BLOCK
      ?auto_151053 - BLOCK
      ?auto_151058 - BLOCK
      ?auto_151059 - BLOCK
      ?auto_151057 - BLOCK
      ?auto_151055 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151052 ?auto_151056 ) ) ( ON-TABLE ?auto_151060 ) ( ON ?auto_151054 ?auto_151060 ) ( ON ?auto_151053 ?auto_151054 ) ( ON ?auto_151058 ?auto_151053 ) ( ON ?auto_151059 ?auto_151058 ) ( ON ?auto_151057 ?auto_151059 ) ( not ( = ?auto_151060 ?auto_151054 ) ) ( not ( = ?auto_151060 ?auto_151053 ) ) ( not ( = ?auto_151060 ?auto_151058 ) ) ( not ( = ?auto_151060 ?auto_151059 ) ) ( not ( = ?auto_151060 ?auto_151057 ) ) ( not ( = ?auto_151060 ?auto_151056 ) ) ( not ( = ?auto_151060 ?auto_151052 ) ) ( not ( = ?auto_151054 ?auto_151053 ) ) ( not ( = ?auto_151054 ?auto_151058 ) ) ( not ( = ?auto_151054 ?auto_151059 ) ) ( not ( = ?auto_151054 ?auto_151057 ) ) ( not ( = ?auto_151054 ?auto_151056 ) ) ( not ( = ?auto_151054 ?auto_151052 ) ) ( not ( = ?auto_151053 ?auto_151058 ) ) ( not ( = ?auto_151053 ?auto_151059 ) ) ( not ( = ?auto_151053 ?auto_151057 ) ) ( not ( = ?auto_151053 ?auto_151056 ) ) ( not ( = ?auto_151053 ?auto_151052 ) ) ( not ( = ?auto_151058 ?auto_151059 ) ) ( not ( = ?auto_151058 ?auto_151057 ) ) ( not ( = ?auto_151058 ?auto_151056 ) ) ( not ( = ?auto_151058 ?auto_151052 ) ) ( not ( = ?auto_151059 ?auto_151057 ) ) ( not ( = ?auto_151059 ?auto_151056 ) ) ( not ( = ?auto_151059 ?auto_151052 ) ) ( not ( = ?auto_151057 ?auto_151056 ) ) ( not ( = ?auto_151057 ?auto_151052 ) ) ( ON ?auto_151052 ?auto_151055 ) ( CLEAR ?auto_151052 ) ( not ( = ?auto_151052 ?auto_151055 ) ) ( not ( = ?auto_151056 ?auto_151055 ) ) ( not ( = ?auto_151060 ?auto_151055 ) ) ( not ( = ?auto_151054 ?auto_151055 ) ) ( not ( = ?auto_151053 ?auto_151055 ) ) ( not ( = ?auto_151058 ?auto_151055 ) ) ( not ( = ?auto_151059 ?auto_151055 ) ) ( not ( = ?auto_151057 ?auto_151055 ) ) ( HOLDING ?auto_151056 ) ( CLEAR ?auto_151057 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_151060 ?auto_151054 ?auto_151053 ?auto_151058 ?auto_151059 ?auto_151057 ?auto_151056 )
      ( MAKE-1PILE ?auto_151052 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_151061 - BLOCK
    )
    :vars
    (
      ?auto_151062 - BLOCK
      ?auto_151069 - BLOCK
      ?auto_151063 - BLOCK
      ?auto_151066 - BLOCK
      ?auto_151067 - BLOCK
      ?auto_151065 - BLOCK
      ?auto_151068 - BLOCK
      ?auto_151064 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151061 ?auto_151062 ) ) ( ON-TABLE ?auto_151069 ) ( ON ?auto_151063 ?auto_151069 ) ( ON ?auto_151066 ?auto_151063 ) ( ON ?auto_151067 ?auto_151066 ) ( ON ?auto_151065 ?auto_151067 ) ( ON ?auto_151068 ?auto_151065 ) ( not ( = ?auto_151069 ?auto_151063 ) ) ( not ( = ?auto_151069 ?auto_151066 ) ) ( not ( = ?auto_151069 ?auto_151067 ) ) ( not ( = ?auto_151069 ?auto_151065 ) ) ( not ( = ?auto_151069 ?auto_151068 ) ) ( not ( = ?auto_151069 ?auto_151062 ) ) ( not ( = ?auto_151069 ?auto_151061 ) ) ( not ( = ?auto_151063 ?auto_151066 ) ) ( not ( = ?auto_151063 ?auto_151067 ) ) ( not ( = ?auto_151063 ?auto_151065 ) ) ( not ( = ?auto_151063 ?auto_151068 ) ) ( not ( = ?auto_151063 ?auto_151062 ) ) ( not ( = ?auto_151063 ?auto_151061 ) ) ( not ( = ?auto_151066 ?auto_151067 ) ) ( not ( = ?auto_151066 ?auto_151065 ) ) ( not ( = ?auto_151066 ?auto_151068 ) ) ( not ( = ?auto_151066 ?auto_151062 ) ) ( not ( = ?auto_151066 ?auto_151061 ) ) ( not ( = ?auto_151067 ?auto_151065 ) ) ( not ( = ?auto_151067 ?auto_151068 ) ) ( not ( = ?auto_151067 ?auto_151062 ) ) ( not ( = ?auto_151067 ?auto_151061 ) ) ( not ( = ?auto_151065 ?auto_151068 ) ) ( not ( = ?auto_151065 ?auto_151062 ) ) ( not ( = ?auto_151065 ?auto_151061 ) ) ( not ( = ?auto_151068 ?auto_151062 ) ) ( not ( = ?auto_151068 ?auto_151061 ) ) ( ON ?auto_151061 ?auto_151064 ) ( not ( = ?auto_151061 ?auto_151064 ) ) ( not ( = ?auto_151062 ?auto_151064 ) ) ( not ( = ?auto_151069 ?auto_151064 ) ) ( not ( = ?auto_151063 ?auto_151064 ) ) ( not ( = ?auto_151066 ?auto_151064 ) ) ( not ( = ?auto_151067 ?auto_151064 ) ) ( not ( = ?auto_151065 ?auto_151064 ) ) ( not ( = ?auto_151068 ?auto_151064 ) ) ( CLEAR ?auto_151068 ) ( ON ?auto_151062 ?auto_151061 ) ( CLEAR ?auto_151062 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_151064 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_151064 ?auto_151061 )
      ( MAKE-1PILE ?auto_151061 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_151070 - BLOCK
    )
    :vars
    (
      ?auto_151075 - BLOCK
      ?auto_151073 - BLOCK
      ?auto_151077 - BLOCK
      ?auto_151074 - BLOCK
      ?auto_151078 - BLOCK
      ?auto_151072 - BLOCK
      ?auto_151076 - BLOCK
      ?auto_151071 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151070 ?auto_151075 ) ) ( ON-TABLE ?auto_151073 ) ( ON ?auto_151077 ?auto_151073 ) ( ON ?auto_151074 ?auto_151077 ) ( ON ?auto_151078 ?auto_151074 ) ( ON ?auto_151072 ?auto_151078 ) ( not ( = ?auto_151073 ?auto_151077 ) ) ( not ( = ?auto_151073 ?auto_151074 ) ) ( not ( = ?auto_151073 ?auto_151078 ) ) ( not ( = ?auto_151073 ?auto_151072 ) ) ( not ( = ?auto_151073 ?auto_151076 ) ) ( not ( = ?auto_151073 ?auto_151075 ) ) ( not ( = ?auto_151073 ?auto_151070 ) ) ( not ( = ?auto_151077 ?auto_151074 ) ) ( not ( = ?auto_151077 ?auto_151078 ) ) ( not ( = ?auto_151077 ?auto_151072 ) ) ( not ( = ?auto_151077 ?auto_151076 ) ) ( not ( = ?auto_151077 ?auto_151075 ) ) ( not ( = ?auto_151077 ?auto_151070 ) ) ( not ( = ?auto_151074 ?auto_151078 ) ) ( not ( = ?auto_151074 ?auto_151072 ) ) ( not ( = ?auto_151074 ?auto_151076 ) ) ( not ( = ?auto_151074 ?auto_151075 ) ) ( not ( = ?auto_151074 ?auto_151070 ) ) ( not ( = ?auto_151078 ?auto_151072 ) ) ( not ( = ?auto_151078 ?auto_151076 ) ) ( not ( = ?auto_151078 ?auto_151075 ) ) ( not ( = ?auto_151078 ?auto_151070 ) ) ( not ( = ?auto_151072 ?auto_151076 ) ) ( not ( = ?auto_151072 ?auto_151075 ) ) ( not ( = ?auto_151072 ?auto_151070 ) ) ( not ( = ?auto_151076 ?auto_151075 ) ) ( not ( = ?auto_151076 ?auto_151070 ) ) ( ON ?auto_151070 ?auto_151071 ) ( not ( = ?auto_151070 ?auto_151071 ) ) ( not ( = ?auto_151075 ?auto_151071 ) ) ( not ( = ?auto_151073 ?auto_151071 ) ) ( not ( = ?auto_151077 ?auto_151071 ) ) ( not ( = ?auto_151074 ?auto_151071 ) ) ( not ( = ?auto_151078 ?auto_151071 ) ) ( not ( = ?auto_151072 ?auto_151071 ) ) ( not ( = ?auto_151076 ?auto_151071 ) ) ( ON ?auto_151075 ?auto_151070 ) ( CLEAR ?auto_151075 ) ( ON-TABLE ?auto_151071 ) ( HOLDING ?auto_151076 ) ( CLEAR ?auto_151072 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_151073 ?auto_151077 ?auto_151074 ?auto_151078 ?auto_151072 ?auto_151076 )
      ( MAKE-1PILE ?auto_151070 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_151079 - BLOCK
    )
    :vars
    (
      ?auto_151084 - BLOCK
      ?auto_151085 - BLOCK
      ?auto_151081 - BLOCK
      ?auto_151080 - BLOCK
      ?auto_151083 - BLOCK
      ?auto_151082 - BLOCK
      ?auto_151087 - BLOCK
      ?auto_151086 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151079 ?auto_151084 ) ) ( ON-TABLE ?auto_151085 ) ( ON ?auto_151081 ?auto_151085 ) ( ON ?auto_151080 ?auto_151081 ) ( ON ?auto_151083 ?auto_151080 ) ( ON ?auto_151082 ?auto_151083 ) ( not ( = ?auto_151085 ?auto_151081 ) ) ( not ( = ?auto_151085 ?auto_151080 ) ) ( not ( = ?auto_151085 ?auto_151083 ) ) ( not ( = ?auto_151085 ?auto_151082 ) ) ( not ( = ?auto_151085 ?auto_151087 ) ) ( not ( = ?auto_151085 ?auto_151084 ) ) ( not ( = ?auto_151085 ?auto_151079 ) ) ( not ( = ?auto_151081 ?auto_151080 ) ) ( not ( = ?auto_151081 ?auto_151083 ) ) ( not ( = ?auto_151081 ?auto_151082 ) ) ( not ( = ?auto_151081 ?auto_151087 ) ) ( not ( = ?auto_151081 ?auto_151084 ) ) ( not ( = ?auto_151081 ?auto_151079 ) ) ( not ( = ?auto_151080 ?auto_151083 ) ) ( not ( = ?auto_151080 ?auto_151082 ) ) ( not ( = ?auto_151080 ?auto_151087 ) ) ( not ( = ?auto_151080 ?auto_151084 ) ) ( not ( = ?auto_151080 ?auto_151079 ) ) ( not ( = ?auto_151083 ?auto_151082 ) ) ( not ( = ?auto_151083 ?auto_151087 ) ) ( not ( = ?auto_151083 ?auto_151084 ) ) ( not ( = ?auto_151083 ?auto_151079 ) ) ( not ( = ?auto_151082 ?auto_151087 ) ) ( not ( = ?auto_151082 ?auto_151084 ) ) ( not ( = ?auto_151082 ?auto_151079 ) ) ( not ( = ?auto_151087 ?auto_151084 ) ) ( not ( = ?auto_151087 ?auto_151079 ) ) ( ON ?auto_151079 ?auto_151086 ) ( not ( = ?auto_151079 ?auto_151086 ) ) ( not ( = ?auto_151084 ?auto_151086 ) ) ( not ( = ?auto_151085 ?auto_151086 ) ) ( not ( = ?auto_151081 ?auto_151086 ) ) ( not ( = ?auto_151080 ?auto_151086 ) ) ( not ( = ?auto_151083 ?auto_151086 ) ) ( not ( = ?auto_151082 ?auto_151086 ) ) ( not ( = ?auto_151087 ?auto_151086 ) ) ( ON ?auto_151084 ?auto_151079 ) ( ON-TABLE ?auto_151086 ) ( CLEAR ?auto_151082 ) ( ON ?auto_151087 ?auto_151084 ) ( CLEAR ?auto_151087 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_151086 ?auto_151079 ?auto_151084 )
      ( MAKE-1PILE ?auto_151079 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_151088 - BLOCK
    )
    :vars
    (
      ?auto_151095 - BLOCK
      ?auto_151093 - BLOCK
      ?auto_151096 - BLOCK
      ?auto_151090 - BLOCK
      ?auto_151092 - BLOCK
      ?auto_151089 - BLOCK
      ?auto_151091 - BLOCK
      ?auto_151094 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151088 ?auto_151095 ) ) ( ON-TABLE ?auto_151093 ) ( ON ?auto_151096 ?auto_151093 ) ( ON ?auto_151090 ?auto_151096 ) ( ON ?auto_151092 ?auto_151090 ) ( not ( = ?auto_151093 ?auto_151096 ) ) ( not ( = ?auto_151093 ?auto_151090 ) ) ( not ( = ?auto_151093 ?auto_151092 ) ) ( not ( = ?auto_151093 ?auto_151089 ) ) ( not ( = ?auto_151093 ?auto_151091 ) ) ( not ( = ?auto_151093 ?auto_151095 ) ) ( not ( = ?auto_151093 ?auto_151088 ) ) ( not ( = ?auto_151096 ?auto_151090 ) ) ( not ( = ?auto_151096 ?auto_151092 ) ) ( not ( = ?auto_151096 ?auto_151089 ) ) ( not ( = ?auto_151096 ?auto_151091 ) ) ( not ( = ?auto_151096 ?auto_151095 ) ) ( not ( = ?auto_151096 ?auto_151088 ) ) ( not ( = ?auto_151090 ?auto_151092 ) ) ( not ( = ?auto_151090 ?auto_151089 ) ) ( not ( = ?auto_151090 ?auto_151091 ) ) ( not ( = ?auto_151090 ?auto_151095 ) ) ( not ( = ?auto_151090 ?auto_151088 ) ) ( not ( = ?auto_151092 ?auto_151089 ) ) ( not ( = ?auto_151092 ?auto_151091 ) ) ( not ( = ?auto_151092 ?auto_151095 ) ) ( not ( = ?auto_151092 ?auto_151088 ) ) ( not ( = ?auto_151089 ?auto_151091 ) ) ( not ( = ?auto_151089 ?auto_151095 ) ) ( not ( = ?auto_151089 ?auto_151088 ) ) ( not ( = ?auto_151091 ?auto_151095 ) ) ( not ( = ?auto_151091 ?auto_151088 ) ) ( ON ?auto_151088 ?auto_151094 ) ( not ( = ?auto_151088 ?auto_151094 ) ) ( not ( = ?auto_151095 ?auto_151094 ) ) ( not ( = ?auto_151093 ?auto_151094 ) ) ( not ( = ?auto_151096 ?auto_151094 ) ) ( not ( = ?auto_151090 ?auto_151094 ) ) ( not ( = ?auto_151092 ?auto_151094 ) ) ( not ( = ?auto_151089 ?auto_151094 ) ) ( not ( = ?auto_151091 ?auto_151094 ) ) ( ON ?auto_151095 ?auto_151088 ) ( ON-TABLE ?auto_151094 ) ( ON ?auto_151091 ?auto_151095 ) ( CLEAR ?auto_151091 ) ( HOLDING ?auto_151089 ) ( CLEAR ?auto_151092 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_151093 ?auto_151096 ?auto_151090 ?auto_151092 ?auto_151089 )
      ( MAKE-1PILE ?auto_151088 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_151097 - BLOCK
    )
    :vars
    (
      ?auto_151105 - BLOCK
      ?auto_151103 - BLOCK
      ?auto_151098 - BLOCK
      ?auto_151100 - BLOCK
      ?auto_151101 - BLOCK
      ?auto_151104 - BLOCK
      ?auto_151102 - BLOCK
      ?auto_151099 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151097 ?auto_151105 ) ) ( ON-TABLE ?auto_151103 ) ( ON ?auto_151098 ?auto_151103 ) ( ON ?auto_151100 ?auto_151098 ) ( ON ?auto_151101 ?auto_151100 ) ( not ( = ?auto_151103 ?auto_151098 ) ) ( not ( = ?auto_151103 ?auto_151100 ) ) ( not ( = ?auto_151103 ?auto_151101 ) ) ( not ( = ?auto_151103 ?auto_151104 ) ) ( not ( = ?auto_151103 ?auto_151102 ) ) ( not ( = ?auto_151103 ?auto_151105 ) ) ( not ( = ?auto_151103 ?auto_151097 ) ) ( not ( = ?auto_151098 ?auto_151100 ) ) ( not ( = ?auto_151098 ?auto_151101 ) ) ( not ( = ?auto_151098 ?auto_151104 ) ) ( not ( = ?auto_151098 ?auto_151102 ) ) ( not ( = ?auto_151098 ?auto_151105 ) ) ( not ( = ?auto_151098 ?auto_151097 ) ) ( not ( = ?auto_151100 ?auto_151101 ) ) ( not ( = ?auto_151100 ?auto_151104 ) ) ( not ( = ?auto_151100 ?auto_151102 ) ) ( not ( = ?auto_151100 ?auto_151105 ) ) ( not ( = ?auto_151100 ?auto_151097 ) ) ( not ( = ?auto_151101 ?auto_151104 ) ) ( not ( = ?auto_151101 ?auto_151102 ) ) ( not ( = ?auto_151101 ?auto_151105 ) ) ( not ( = ?auto_151101 ?auto_151097 ) ) ( not ( = ?auto_151104 ?auto_151102 ) ) ( not ( = ?auto_151104 ?auto_151105 ) ) ( not ( = ?auto_151104 ?auto_151097 ) ) ( not ( = ?auto_151102 ?auto_151105 ) ) ( not ( = ?auto_151102 ?auto_151097 ) ) ( ON ?auto_151097 ?auto_151099 ) ( not ( = ?auto_151097 ?auto_151099 ) ) ( not ( = ?auto_151105 ?auto_151099 ) ) ( not ( = ?auto_151103 ?auto_151099 ) ) ( not ( = ?auto_151098 ?auto_151099 ) ) ( not ( = ?auto_151100 ?auto_151099 ) ) ( not ( = ?auto_151101 ?auto_151099 ) ) ( not ( = ?auto_151104 ?auto_151099 ) ) ( not ( = ?auto_151102 ?auto_151099 ) ) ( ON ?auto_151105 ?auto_151097 ) ( ON-TABLE ?auto_151099 ) ( ON ?auto_151102 ?auto_151105 ) ( CLEAR ?auto_151101 ) ( ON ?auto_151104 ?auto_151102 ) ( CLEAR ?auto_151104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_151099 ?auto_151097 ?auto_151105 ?auto_151102 )
      ( MAKE-1PILE ?auto_151097 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_151106 - BLOCK
    )
    :vars
    (
      ?auto_151107 - BLOCK
      ?auto_151113 - BLOCK
      ?auto_151109 - BLOCK
      ?auto_151112 - BLOCK
      ?auto_151114 - BLOCK
      ?auto_151111 - BLOCK
      ?auto_151110 - BLOCK
      ?auto_151108 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151106 ?auto_151107 ) ) ( ON-TABLE ?auto_151113 ) ( ON ?auto_151109 ?auto_151113 ) ( ON ?auto_151112 ?auto_151109 ) ( not ( = ?auto_151113 ?auto_151109 ) ) ( not ( = ?auto_151113 ?auto_151112 ) ) ( not ( = ?auto_151113 ?auto_151114 ) ) ( not ( = ?auto_151113 ?auto_151111 ) ) ( not ( = ?auto_151113 ?auto_151110 ) ) ( not ( = ?auto_151113 ?auto_151107 ) ) ( not ( = ?auto_151113 ?auto_151106 ) ) ( not ( = ?auto_151109 ?auto_151112 ) ) ( not ( = ?auto_151109 ?auto_151114 ) ) ( not ( = ?auto_151109 ?auto_151111 ) ) ( not ( = ?auto_151109 ?auto_151110 ) ) ( not ( = ?auto_151109 ?auto_151107 ) ) ( not ( = ?auto_151109 ?auto_151106 ) ) ( not ( = ?auto_151112 ?auto_151114 ) ) ( not ( = ?auto_151112 ?auto_151111 ) ) ( not ( = ?auto_151112 ?auto_151110 ) ) ( not ( = ?auto_151112 ?auto_151107 ) ) ( not ( = ?auto_151112 ?auto_151106 ) ) ( not ( = ?auto_151114 ?auto_151111 ) ) ( not ( = ?auto_151114 ?auto_151110 ) ) ( not ( = ?auto_151114 ?auto_151107 ) ) ( not ( = ?auto_151114 ?auto_151106 ) ) ( not ( = ?auto_151111 ?auto_151110 ) ) ( not ( = ?auto_151111 ?auto_151107 ) ) ( not ( = ?auto_151111 ?auto_151106 ) ) ( not ( = ?auto_151110 ?auto_151107 ) ) ( not ( = ?auto_151110 ?auto_151106 ) ) ( ON ?auto_151106 ?auto_151108 ) ( not ( = ?auto_151106 ?auto_151108 ) ) ( not ( = ?auto_151107 ?auto_151108 ) ) ( not ( = ?auto_151113 ?auto_151108 ) ) ( not ( = ?auto_151109 ?auto_151108 ) ) ( not ( = ?auto_151112 ?auto_151108 ) ) ( not ( = ?auto_151114 ?auto_151108 ) ) ( not ( = ?auto_151111 ?auto_151108 ) ) ( not ( = ?auto_151110 ?auto_151108 ) ) ( ON ?auto_151107 ?auto_151106 ) ( ON-TABLE ?auto_151108 ) ( ON ?auto_151110 ?auto_151107 ) ( ON ?auto_151111 ?auto_151110 ) ( CLEAR ?auto_151111 ) ( HOLDING ?auto_151114 ) ( CLEAR ?auto_151112 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_151113 ?auto_151109 ?auto_151112 ?auto_151114 )
      ( MAKE-1PILE ?auto_151106 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_151115 - BLOCK
    )
    :vars
    (
      ?auto_151123 - BLOCK
      ?auto_151122 - BLOCK
      ?auto_151119 - BLOCK
      ?auto_151118 - BLOCK
      ?auto_151116 - BLOCK
      ?auto_151121 - BLOCK
      ?auto_151120 - BLOCK
      ?auto_151117 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151115 ?auto_151123 ) ) ( ON-TABLE ?auto_151122 ) ( ON ?auto_151119 ?auto_151122 ) ( ON ?auto_151118 ?auto_151119 ) ( not ( = ?auto_151122 ?auto_151119 ) ) ( not ( = ?auto_151122 ?auto_151118 ) ) ( not ( = ?auto_151122 ?auto_151116 ) ) ( not ( = ?auto_151122 ?auto_151121 ) ) ( not ( = ?auto_151122 ?auto_151120 ) ) ( not ( = ?auto_151122 ?auto_151123 ) ) ( not ( = ?auto_151122 ?auto_151115 ) ) ( not ( = ?auto_151119 ?auto_151118 ) ) ( not ( = ?auto_151119 ?auto_151116 ) ) ( not ( = ?auto_151119 ?auto_151121 ) ) ( not ( = ?auto_151119 ?auto_151120 ) ) ( not ( = ?auto_151119 ?auto_151123 ) ) ( not ( = ?auto_151119 ?auto_151115 ) ) ( not ( = ?auto_151118 ?auto_151116 ) ) ( not ( = ?auto_151118 ?auto_151121 ) ) ( not ( = ?auto_151118 ?auto_151120 ) ) ( not ( = ?auto_151118 ?auto_151123 ) ) ( not ( = ?auto_151118 ?auto_151115 ) ) ( not ( = ?auto_151116 ?auto_151121 ) ) ( not ( = ?auto_151116 ?auto_151120 ) ) ( not ( = ?auto_151116 ?auto_151123 ) ) ( not ( = ?auto_151116 ?auto_151115 ) ) ( not ( = ?auto_151121 ?auto_151120 ) ) ( not ( = ?auto_151121 ?auto_151123 ) ) ( not ( = ?auto_151121 ?auto_151115 ) ) ( not ( = ?auto_151120 ?auto_151123 ) ) ( not ( = ?auto_151120 ?auto_151115 ) ) ( ON ?auto_151115 ?auto_151117 ) ( not ( = ?auto_151115 ?auto_151117 ) ) ( not ( = ?auto_151123 ?auto_151117 ) ) ( not ( = ?auto_151122 ?auto_151117 ) ) ( not ( = ?auto_151119 ?auto_151117 ) ) ( not ( = ?auto_151118 ?auto_151117 ) ) ( not ( = ?auto_151116 ?auto_151117 ) ) ( not ( = ?auto_151121 ?auto_151117 ) ) ( not ( = ?auto_151120 ?auto_151117 ) ) ( ON ?auto_151123 ?auto_151115 ) ( ON-TABLE ?auto_151117 ) ( ON ?auto_151120 ?auto_151123 ) ( ON ?auto_151121 ?auto_151120 ) ( CLEAR ?auto_151118 ) ( ON ?auto_151116 ?auto_151121 ) ( CLEAR ?auto_151116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_151117 ?auto_151115 ?auto_151123 ?auto_151120 ?auto_151121 )
      ( MAKE-1PILE ?auto_151115 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_151124 - BLOCK
    )
    :vars
    (
      ?auto_151130 - BLOCK
      ?auto_151125 - BLOCK
      ?auto_151132 - BLOCK
      ?auto_151128 - BLOCK
      ?auto_151126 - BLOCK
      ?auto_151127 - BLOCK
      ?auto_151129 - BLOCK
      ?auto_151131 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151124 ?auto_151130 ) ) ( ON-TABLE ?auto_151125 ) ( ON ?auto_151132 ?auto_151125 ) ( not ( = ?auto_151125 ?auto_151132 ) ) ( not ( = ?auto_151125 ?auto_151128 ) ) ( not ( = ?auto_151125 ?auto_151126 ) ) ( not ( = ?auto_151125 ?auto_151127 ) ) ( not ( = ?auto_151125 ?auto_151129 ) ) ( not ( = ?auto_151125 ?auto_151130 ) ) ( not ( = ?auto_151125 ?auto_151124 ) ) ( not ( = ?auto_151132 ?auto_151128 ) ) ( not ( = ?auto_151132 ?auto_151126 ) ) ( not ( = ?auto_151132 ?auto_151127 ) ) ( not ( = ?auto_151132 ?auto_151129 ) ) ( not ( = ?auto_151132 ?auto_151130 ) ) ( not ( = ?auto_151132 ?auto_151124 ) ) ( not ( = ?auto_151128 ?auto_151126 ) ) ( not ( = ?auto_151128 ?auto_151127 ) ) ( not ( = ?auto_151128 ?auto_151129 ) ) ( not ( = ?auto_151128 ?auto_151130 ) ) ( not ( = ?auto_151128 ?auto_151124 ) ) ( not ( = ?auto_151126 ?auto_151127 ) ) ( not ( = ?auto_151126 ?auto_151129 ) ) ( not ( = ?auto_151126 ?auto_151130 ) ) ( not ( = ?auto_151126 ?auto_151124 ) ) ( not ( = ?auto_151127 ?auto_151129 ) ) ( not ( = ?auto_151127 ?auto_151130 ) ) ( not ( = ?auto_151127 ?auto_151124 ) ) ( not ( = ?auto_151129 ?auto_151130 ) ) ( not ( = ?auto_151129 ?auto_151124 ) ) ( ON ?auto_151124 ?auto_151131 ) ( not ( = ?auto_151124 ?auto_151131 ) ) ( not ( = ?auto_151130 ?auto_151131 ) ) ( not ( = ?auto_151125 ?auto_151131 ) ) ( not ( = ?auto_151132 ?auto_151131 ) ) ( not ( = ?auto_151128 ?auto_151131 ) ) ( not ( = ?auto_151126 ?auto_151131 ) ) ( not ( = ?auto_151127 ?auto_151131 ) ) ( not ( = ?auto_151129 ?auto_151131 ) ) ( ON ?auto_151130 ?auto_151124 ) ( ON-TABLE ?auto_151131 ) ( ON ?auto_151129 ?auto_151130 ) ( ON ?auto_151127 ?auto_151129 ) ( ON ?auto_151126 ?auto_151127 ) ( CLEAR ?auto_151126 ) ( HOLDING ?auto_151128 ) ( CLEAR ?auto_151132 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_151125 ?auto_151132 ?auto_151128 )
      ( MAKE-1PILE ?auto_151124 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_151133 - BLOCK
    )
    :vars
    (
      ?auto_151135 - BLOCK
      ?auto_151140 - BLOCK
      ?auto_151141 - BLOCK
      ?auto_151134 - BLOCK
      ?auto_151138 - BLOCK
      ?auto_151137 - BLOCK
      ?auto_151136 - BLOCK
      ?auto_151139 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151133 ?auto_151135 ) ) ( ON-TABLE ?auto_151140 ) ( ON ?auto_151141 ?auto_151140 ) ( not ( = ?auto_151140 ?auto_151141 ) ) ( not ( = ?auto_151140 ?auto_151134 ) ) ( not ( = ?auto_151140 ?auto_151138 ) ) ( not ( = ?auto_151140 ?auto_151137 ) ) ( not ( = ?auto_151140 ?auto_151136 ) ) ( not ( = ?auto_151140 ?auto_151135 ) ) ( not ( = ?auto_151140 ?auto_151133 ) ) ( not ( = ?auto_151141 ?auto_151134 ) ) ( not ( = ?auto_151141 ?auto_151138 ) ) ( not ( = ?auto_151141 ?auto_151137 ) ) ( not ( = ?auto_151141 ?auto_151136 ) ) ( not ( = ?auto_151141 ?auto_151135 ) ) ( not ( = ?auto_151141 ?auto_151133 ) ) ( not ( = ?auto_151134 ?auto_151138 ) ) ( not ( = ?auto_151134 ?auto_151137 ) ) ( not ( = ?auto_151134 ?auto_151136 ) ) ( not ( = ?auto_151134 ?auto_151135 ) ) ( not ( = ?auto_151134 ?auto_151133 ) ) ( not ( = ?auto_151138 ?auto_151137 ) ) ( not ( = ?auto_151138 ?auto_151136 ) ) ( not ( = ?auto_151138 ?auto_151135 ) ) ( not ( = ?auto_151138 ?auto_151133 ) ) ( not ( = ?auto_151137 ?auto_151136 ) ) ( not ( = ?auto_151137 ?auto_151135 ) ) ( not ( = ?auto_151137 ?auto_151133 ) ) ( not ( = ?auto_151136 ?auto_151135 ) ) ( not ( = ?auto_151136 ?auto_151133 ) ) ( ON ?auto_151133 ?auto_151139 ) ( not ( = ?auto_151133 ?auto_151139 ) ) ( not ( = ?auto_151135 ?auto_151139 ) ) ( not ( = ?auto_151140 ?auto_151139 ) ) ( not ( = ?auto_151141 ?auto_151139 ) ) ( not ( = ?auto_151134 ?auto_151139 ) ) ( not ( = ?auto_151138 ?auto_151139 ) ) ( not ( = ?auto_151137 ?auto_151139 ) ) ( not ( = ?auto_151136 ?auto_151139 ) ) ( ON ?auto_151135 ?auto_151133 ) ( ON-TABLE ?auto_151139 ) ( ON ?auto_151136 ?auto_151135 ) ( ON ?auto_151137 ?auto_151136 ) ( ON ?auto_151138 ?auto_151137 ) ( CLEAR ?auto_151141 ) ( ON ?auto_151134 ?auto_151138 ) ( CLEAR ?auto_151134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_151139 ?auto_151133 ?auto_151135 ?auto_151136 ?auto_151137 ?auto_151138 )
      ( MAKE-1PILE ?auto_151133 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_151142 - BLOCK
    )
    :vars
    (
      ?auto_151145 - BLOCK
      ?auto_151146 - BLOCK
      ?auto_151144 - BLOCK
      ?auto_151143 - BLOCK
      ?auto_151148 - BLOCK
      ?auto_151149 - BLOCK
      ?auto_151150 - BLOCK
      ?auto_151147 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151142 ?auto_151145 ) ) ( ON-TABLE ?auto_151146 ) ( not ( = ?auto_151146 ?auto_151144 ) ) ( not ( = ?auto_151146 ?auto_151143 ) ) ( not ( = ?auto_151146 ?auto_151148 ) ) ( not ( = ?auto_151146 ?auto_151149 ) ) ( not ( = ?auto_151146 ?auto_151150 ) ) ( not ( = ?auto_151146 ?auto_151145 ) ) ( not ( = ?auto_151146 ?auto_151142 ) ) ( not ( = ?auto_151144 ?auto_151143 ) ) ( not ( = ?auto_151144 ?auto_151148 ) ) ( not ( = ?auto_151144 ?auto_151149 ) ) ( not ( = ?auto_151144 ?auto_151150 ) ) ( not ( = ?auto_151144 ?auto_151145 ) ) ( not ( = ?auto_151144 ?auto_151142 ) ) ( not ( = ?auto_151143 ?auto_151148 ) ) ( not ( = ?auto_151143 ?auto_151149 ) ) ( not ( = ?auto_151143 ?auto_151150 ) ) ( not ( = ?auto_151143 ?auto_151145 ) ) ( not ( = ?auto_151143 ?auto_151142 ) ) ( not ( = ?auto_151148 ?auto_151149 ) ) ( not ( = ?auto_151148 ?auto_151150 ) ) ( not ( = ?auto_151148 ?auto_151145 ) ) ( not ( = ?auto_151148 ?auto_151142 ) ) ( not ( = ?auto_151149 ?auto_151150 ) ) ( not ( = ?auto_151149 ?auto_151145 ) ) ( not ( = ?auto_151149 ?auto_151142 ) ) ( not ( = ?auto_151150 ?auto_151145 ) ) ( not ( = ?auto_151150 ?auto_151142 ) ) ( ON ?auto_151142 ?auto_151147 ) ( not ( = ?auto_151142 ?auto_151147 ) ) ( not ( = ?auto_151145 ?auto_151147 ) ) ( not ( = ?auto_151146 ?auto_151147 ) ) ( not ( = ?auto_151144 ?auto_151147 ) ) ( not ( = ?auto_151143 ?auto_151147 ) ) ( not ( = ?auto_151148 ?auto_151147 ) ) ( not ( = ?auto_151149 ?auto_151147 ) ) ( not ( = ?auto_151150 ?auto_151147 ) ) ( ON ?auto_151145 ?auto_151142 ) ( ON-TABLE ?auto_151147 ) ( ON ?auto_151150 ?auto_151145 ) ( ON ?auto_151149 ?auto_151150 ) ( ON ?auto_151148 ?auto_151149 ) ( ON ?auto_151143 ?auto_151148 ) ( CLEAR ?auto_151143 ) ( HOLDING ?auto_151144 ) ( CLEAR ?auto_151146 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_151146 ?auto_151144 )
      ( MAKE-1PILE ?auto_151142 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_151151 - BLOCK
    )
    :vars
    (
      ?auto_151153 - BLOCK
      ?auto_151156 - BLOCK
      ?auto_151152 - BLOCK
      ?auto_151159 - BLOCK
      ?auto_151155 - BLOCK
      ?auto_151157 - BLOCK
      ?auto_151158 - BLOCK
      ?auto_151154 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151151 ?auto_151153 ) ) ( ON-TABLE ?auto_151156 ) ( not ( = ?auto_151156 ?auto_151152 ) ) ( not ( = ?auto_151156 ?auto_151159 ) ) ( not ( = ?auto_151156 ?auto_151155 ) ) ( not ( = ?auto_151156 ?auto_151157 ) ) ( not ( = ?auto_151156 ?auto_151158 ) ) ( not ( = ?auto_151156 ?auto_151153 ) ) ( not ( = ?auto_151156 ?auto_151151 ) ) ( not ( = ?auto_151152 ?auto_151159 ) ) ( not ( = ?auto_151152 ?auto_151155 ) ) ( not ( = ?auto_151152 ?auto_151157 ) ) ( not ( = ?auto_151152 ?auto_151158 ) ) ( not ( = ?auto_151152 ?auto_151153 ) ) ( not ( = ?auto_151152 ?auto_151151 ) ) ( not ( = ?auto_151159 ?auto_151155 ) ) ( not ( = ?auto_151159 ?auto_151157 ) ) ( not ( = ?auto_151159 ?auto_151158 ) ) ( not ( = ?auto_151159 ?auto_151153 ) ) ( not ( = ?auto_151159 ?auto_151151 ) ) ( not ( = ?auto_151155 ?auto_151157 ) ) ( not ( = ?auto_151155 ?auto_151158 ) ) ( not ( = ?auto_151155 ?auto_151153 ) ) ( not ( = ?auto_151155 ?auto_151151 ) ) ( not ( = ?auto_151157 ?auto_151158 ) ) ( not ( = ?auto_151157 ?auto_151153 ) ) ( not ( = ?auto_151157 ?auto_151151 ) ) ( not ( = ?auto_151158 ?auto_151153 ) ) ( not ( = ?auto_151158 ?auto_151151 ) ) ( ON ?auto_151151 ?auto_151154 ) ( not ( = ?auto_151151 ?auto_151154 ) ) ( not ( = ?auto_151153 ?auto_151154 ) ) ( not ( = ?auto_151156 ?auto_151154 ) ) ( not ( = ?auto_151152 ?auto_151154 ) ) ( not ( = ?auto_151159 ?auto_151154 ) ) ( not ( = ?auto_151155 ?auto_151154 ) ) ( not ( = ?auto_151157 ?auto_151154 ) ) ( not ( = ?auto_151158 ?auto_151154 ) ) ( ON ?auto_151153 ?auto_151151 ) ( ON-TABLE ?auto_151154 ) ( ON ?auto_151158 ?auto_151153 ) ( ON ?auto_151157 ?auto_151158 ) ( ON ?auto_151155 ?auto_151157 ) ( ON ?auto_151159 ?auto_151155 ) ( CLEAR ?auto_151156 ) ( ON ?auto_151152 ?auto_151159 ) ( CLEAR ?auto_151152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_151154 ?auto_151151 ?auto_151153 ?auto_151158 ?auto_151157 ?auto_151155 ?auto_151159 )
      ( MAKE-1PILE ?auto_151151 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_151160 - BLOCK
    )
    :vars
    (
      ?auto_151168 - BLOCK
      ?auto_151162 - BLOCK
      ?auto_151163 - BLOCK
      ?auto_151167 - BLOCK
      ?auto_151164 - BLOCK
      ?auto_151165 - BLOCK
      ?auto_151161 - BLOCK
      ?auto_151166 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151160 ?auto_151168 ) ) ( not ( = ?auto_151162 ?auto_151163 ) ) ( not ( = ?auto_151162 ?auto_151167 ) ) ( not ( = ?auto_151162 ?auto_151164 ) ) ( not ( = ?auto_151162 ?auto_151165 ) ) ( not ( = ?auto_151162 ?auto_151161 ) ) ( not ( = ?auto_151162 ?auto_151168 ) ) ( not ( = ?auto_151162 ?auto_151160 ) ) ( not ( = ?auto_151163 ?auto_151167 ) ) ( not ( = ?auto_151163 ?auto_151164 ) ) ( not ( = ?auto_151163 ?auto_151165 ) ) ( not ( = ?auto_151163 ?auto_151161 ) ) ( not ( = ?auto_151163 ?auto_151168 ) ) ( not ( = ?auto_151163 ?auto_151160 ) ) ( not ( = ?auto_151167 ?auto_151164 ) ) ( not ( = ?auto_151167 ?auto_151165 ) ) ( not ( = ?auto_151167 ?auto_151161 ) ) ( not ( = ?auto_151167 ?auto_151168 ) ) ( not ( = ?auto_151167 ?auto_151160 ) ) ( not ( = ?auto_151164 ?auto_151165 ) ) ( not ( = ?auto_151164 ?auto_151161 ) ) ( not ( = ?auto_151164 ?auto_151168 ) ) ( not ( = ?auto_151164 ?auto_151160 ) ) ( not ( = ?auto_151165 ?auto_151161 ) ) ( not ( = ?auto_151165 ?auto_151168 ) ) ( not ( = ?auto_151165 ?auto_151160 ) ) ( not ( = ?auto_151161 ?auto_151168 ) ) ( not ( = ?auto_151161 ?auto_151160 ) ) ( ON ?auto_151160 ?auto_151166 ) ( not ( = ?auto_151160 ?auto_151166 ) ) ( not ( = ?auto_151168 ?auto_151166 ) ) ( not ( = ?auto_151162 ?auto_151166 ) ) ( not ( = ?auto_151163 ?auto_151166 ) ) ( not ( = ?auto_151167 ?auto_151166 ) ) ( not ( = ?auto_151164 ?auto_151166 ) ) ( not ( = ?auto_151165 ?auto_151166 ) ) ( not ( = ?auto_151161 ?auto_151166 ) ) ( ON ?auto_151168 ?auto_151160 ) ( ON-TABLE ?auto_151166 ) ( ON ?auto_151161 ?auto_151168 ) ( ON ?auto_151165 ?auto_151161 ) ( ON ?auto_151164 ?auto_151165 ) ( ON ?auto_151167 ?auto_151164 ) ( ON ?auto_151163 ?auto_151167 ) ( CLEAR ?auto_151163 ) ( HOLDING ?auto_151162 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_151162 )
      ( MAKE-1PILE ?auto_151160 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_151169 - BLOCK
    )
    :vars
    (
      ?auto_151174 - BLOCK
      ?auto_151175 - BLOCK
      ?auto_151171 - BLOCK
      ?auto_151173 - BLOCK
      ?auto_151176 - BLOCK
      ?auto_151172 - BLOCK
      ?auto_151170 - BLOCK
      ?auto_151177 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151169 ?auto_151174 ) ) ( not ( = ?auto_151175 ?auto_151171 ) ) ( not ( = ?auto_151175 ?auto_151173 ) ) ( not ( = ?auto_151175 ?auto_151176 ) ) ( not ( = ?auto_151175 ?auto_151172 ) ) ( not ( = ?auto_151175 ?auto_151170 ) ) ( not ( = ?auto_151175 ?auto_151174 ) ) ( not ( = ?auto_151175 ?auto_151169 ) ) ( not ( = ?auto_151171 ?auto_151173 ) ) ( not ( = ?auto_151171 ?auto_151176 ) ) ( not ( = ?auto_151171 ?auto_151172 ) ) ( not ( = ?auto_151171 ?auto_151170 ) ) ( not ( = ?auto_151171 ?auto_151174 ) ) ( not ( = ?auto_151171 ?auto_151169 ) ) ( not ( = ?auto_151173 ?auto_151176 ) ) ( not ( = ?auto_151173 ?auto_151172 ) ) ( not ( = ?auto_151173 ?auto_151170 ) ) ( not ( = ?auto_151173 ?auto_151174 ) ) ( not ( = ?auto_151173 ?auto_151169 ) ) ( not ( = ?auto_151176 ?auto_151172 ) ) ( not ( = ?auto_151176 ?auto_151170 ) ) ( not ( = ?auto_151176 ?auto_151174 ) ) ( not ( = ?auto_151176 ?auto_151169 ) ) ( not ( = ?auto_151172 ?auto_151170 ) ) ( not ( = ?auto_151172 ?auto_151174 ) ) ( not ( = ?auto_151172 ?auto_151169 ) ) ( not ( = ?auto_151170 ?auto_151174 ) ) ( not ( = ?auto_151170 ?auto_151169 ) ) ( ON ?auto_151169 ?auto_151177 ) ( not ( = ?auto_151169 ?auto_151177 ) ) ( not ( = ?auto_151174 ?auto_151177 ) ) ( not ( = ?auto_151175 ?auto_151177 ) ) ( not ( = ?auto_151171 ?auto_151177 ) ) ( not ( = ?auto_151173 ?auto_151177 ) ) ( not ( = ?auto_151176 ?auto_151177 ) ) ( not ( = ?auto_151172 ?auto_151177 ) ) ( not ( = ?auto_151170 ?auto_151177 ) ) ( ON ?auto_151174 ?auto_151169 ) ( ON-TABLE ?auto_151177 ) ( ON ?auto_151170 ?auto_151174 ) ( ON ?auto_151172 ?auto_151170 ) ( ON ?auto_151176 ?auto_151172 ) ( ON ?auto_151173 ?auto_151176 ) ( ON ?auto_151171 ?auto_151173 ) ( ON ?auto_151175 ?auto_151171 ) ( CLEAR ?auto_151175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_151177 ?auto_151169 ?auto_151174 ?auto_151170 ?auto_151172 ?auto_151176 ?auto_151173 ?auto_151171 )
      ( MAKE-1PILE ?auto_151169 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_151184 - BLOCK
      ?auto_151185 - BLOCK
      ?auto_151186 - BLOCK
      ?auto_151187 - BLOCK
      ?auto_151188 - BLOCK
      ?auto_151189 - BLOCK
    )
    :vars
    (
      ?auto_151190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151190 ?auto_151189 ) ( CLEAR ?auto_151190 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_151184 ) ( ON ?auto_151185 ?auto_151184 ) ( ON ?auto_151186 ?auto_151185 ) ( ON ?auto_151187 ?auto_151186 ) ( ON ?auto_151188 ?auto_151187 ) ( ON ?auto_151189 ?auto_151188 ) ( not ( = ?auto_151184 ?auto_151185 ) ) ( not ( = ?auto_151184 ?auto_151186 ) ) ( not ( = ?auto_151184 ?auto_151187 ) ) ( not ( = ?auto_151184 ?auto_151188 ) ) ( not ( = ?auto_151184 ?auto_151189 ) ) ( not ( = ?auto_151184 ?auto_151190 ) ) ( not ( = ?auto_151185 ?auto_151186 ) ) ( not ( = ?auto_151185 ?auto_151187 ) ) ( not ( = ?auto_151185 ?auto_151188 ) ) ( not ( = ?auto_151185 ?auto_151189 ) ) ( not ( = ?auto_151185 ?auto_151190 ) ) ( not ( = ?auto_151186 ?auto_151187 ) ) ( not ( = ?auto_151186 ?auto_151188 ) ) ( not ( = ?auto_151186 ?auto_151189 ) ) ( not ( = ?auto_151186 ?auto_151190 ) ) ( not ( = ?auto_151187 ?auto_151188 ) ) ( not ( = ?auto_151187 ?auto_151189 ) ) ( not ( = ?auto_151187 ?auto_151190 ) ) ( not ( = ?auto_151188 ?auto_151189 ) ) ( not ( = ?auto_151188 ?auto_151190 ) ) ( not ( = ?auto_151189 ?auto_151190 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_151190 ?auto_151189 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_151191 - BLOCK
      ?auto_151192 - BLOCK
      ?auto_151193 - BLOCK
      ?auto_151194 - BLOCK
      ?auto_151195 - BLOCK
      ?auto_151196 - BLOCK
    )
    :vars
    (
      ?auto_151197 - BLOCK
      ?auto_151198 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151197 ?auto_151196 ) ( CLEAR ?auto_151197 ) ( ON-TABLE ?auto_151191 ) ( ON ?auto_151192 ?auto_151191 ) ( ON ?auto_151193 ?auto_151192 ) ( ON ?auto_151194 ?auto_151193 ) ( ON ?auto_151195 ?auto_151194 ) ( ON ?auto_151196 ?auto_151195 ) ( not ( = ?auto_151191 ?auto_151192 ) ) ( not ( = ?auto_151191 ?auto_151193 ) ) ( not ( = ?auto_151191 ?auto_151194 ) ) ( not ( = ?auto_151191 ?auto_151195 ) ) ( not ( = ?auto_151191 ?auto_151196 ) ) ( not ( = ?auto_151191 ?auto_151197 ) ) ( not ( = ?auto_151192 ?auto_151193 ) ) ( not ( = ?auto_151192 ?auto_151194 ) ) ( not ( = ?auto_151192 ?auto_151195 ) ) ( not ( = ?auto_151192 ?auto_151196 ) ) ( not ( = ?auto_151192 ?auto_151197 ) ) ( not ( = ?auto_151193 ?auto_151194 ) ) ( not ( = ?auto_151193 ?auto_151195 ) ) ( not ( = ?auto_151193 ?auto_151196 ) ) ( not ( = ?auto_151193 ?auto_151197 ) ) ( not ( = ?auto_151194 ?auto_151195 ) ) ( not ( = ?auto_151194 ?auto_151196 ) ) ( not ( = ?auto_151194 ?auto_151197 ) ) ( not ( = ?auto_151195 ?auto_151196 ) ) ( not ( = ?auto_151195 ?auto_151197 ) ) ( not ( = ?auto_151196 ?auto_151197 ) ) ( HOLDING ?auto_151198 ) ( not ( = ?auto_151191 ?auto_151198 ) ) ( not ( = ?auto_151192 ?auto_151198 ) ) ( not ( = ?auto_151193 ?auto_151198 ) ) ( not ( = ?auto_151194 ?auto_151198 ) ) ( not ( = ?auto_151195 ?auto_151198 ) ) ( not ( = ?auto_151196 ?auto_151198 ) ) ( not ( = ?auto_151197 ?auto_151198 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_151198 )
      ( MAKE-6PILE ?auto_151191 ?auto_151192 ?auto_151193 ?auto_151194 ?auto_151195 ?auto_151196 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_151199 - BLOCK
      ?auto_151200 - BLOCK
      ?auto_151201 - BLOCK
      ?auto_151202 - BLOCK
      ?auto_151203 - BLOCK
      ?auto_151204 - BLOCK
    )
    :vars
    (
      ?auto_151206 - BLOCK
      ?auto_151205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151206 ?auto_151204 ) ( ON-TABLE ?auto_151199 ) ( ON ?auto_151200 ?auto_151199 ) ( ON ?auto_151201 ?auto_151200 ) ( ON ?auto_151202 ?auto_151201 ) ( ON ?auto_151203 ?auto_151202 ) ( ON ?auto_151204 ?auto_151203 ) ( not ( = ?auto_151199 ?auto_151200 ) ) ( not ( = ?auto_151199 ?auto_151201 ) ) ( not ( = ?auto_151199 ?auto_151202 ) ) ( not ( = ?auto_151199 ?auto_151203 ) ) ( not ( = ?auto_151199 ?auto_151204 ) ) ( not ( = ?auto_151199 ?auto_151206 ) ) ( not ( = ?auto_151200 ?auto_151201 ) ) ( not ( = ?auto_151200 ?auto_151202 ) ) ( not ( = ?auto_151200 ?auto_151203 ) ) ( not ( = ?auto_151200 ?auto_151204 ) ) ( not ( = ?auto_151200 ?auto_151206 ) ) ( not ( = ?auto_151201 ?auto_151202 ) ) ( not ( = ?auto_151201 ?auto_151203 ) ) ( not ( = ?auto_151201 ?auto_151204 ) ) ( not ( = ?auto_151201 ?auto_151206 ) ) ( not ( = ?auto_151202 ?auto_151203 ) ) ( not ( = ?auto_151202 ?auto_151204 ) ) ( not ( = ?auto_151202 ?auto_151206 ) ) ( not ( = ?auto_151203 ?auto_151204 ) ) ( not ( = ?auto_151203 ?auto_151206 ) ) ( not ( = ?auto_151204 ?auto_151206 ) ) ( not ( = ?auto_151199 ?auto_151205 ) ) ( not ( = ?auto_151200 ?auto_151205 ) ) ( not ( = ?auto_151201 ?auto_151205 ) ) ( not ( = ?auto_151202 ?auto_151205 ) ) ( not ( = ?auto_151203 ?auto_151205 ) ) ( not ( = ?auto_151204 ?auto_151205 ) ) ( not ( = ?auto_151206 ?auto_151205 ) ) ( ON ?auto_151205 ?auto_151206 ) ( CLEAR ?auto_151205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_151199 ?auto_151200 ?auto_151201 ?auto_151202 ?auto_151203 ?auto_151204 ?auto_151206 )
      ( MAKE-6PILE ?auto_151199 ?auto_151200 ?auto_151201 ?auto_151202 ?auto_151203 ?auto_151204 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_151207 - BLOCK
      ?auto_151208 - BLOCK
      ?auto_151209 - BLOCK
      ?auto_151210 - BLOCK
      ?auto_151211 - BLOCK
      ?auto_151212 - BLOCK
    )
    :vars
    (
      ?auto_151213 - BLOCK
      ?auto_151214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151213 ?auto_151212 ) ( ON-TABLE ?auto_151207 ) ( ON ?auto_151208 ?auto_151207 ) ( ON ?auto_151209 ?auto_151208 ) ( ON ?auto_151210 ?auto_151209 ) ( ON ?auto_151211 ?auto_151210 ) ( ON ?auto_151212 ?auto_151211 ) ( not ( = ?auto_151207 ?auto_151208 ) ) ( not ( = ?auto_151207 ?auto_151209 ) ) ( not ( = ?auto_151207 ?auto_151210 ) ) ( not ( = ?auto_151207 ?auto_151211 ) ) ( not ( = ?auto_151207 ?auto_151212 ) ) ( not ( = ?auto_151207 ?auto_151213 ) ) ( not ( = ?auto_151208 ?auto_151209 ) ) ( not ( = ?auto_151208 ?auto_151210 ) ) ( not ( = ?auto_151208 ?auto_151211 ) ) ( not ( = ?auto_151208 ?auto_151212 ) ) ( not ( = ?auto_151208 ?auto_151213 ) ) ( not ( = ?auto_151209 ?auto_151210 ) ) ( not ( = ?auto_151209 ?auto_151211 ) ) ( not ( = ?auto_151209 ?auto_151212 ) ) ( not ( = ?auto_151209 ?auto_151213 ) ) ( not ( = ?auto_151210 ?auto_151211 ) ) ( not ( = ?auto_151210 ?auto_151212 ) ) ( not ( = ?auto_151210 ?auto_151213 ) ) ( not ( = ?auto_151211 ?auto_151212 ) ) ( not ( = ?auto_151211 ?auto_151213 ) ) ( not ( = ?auto_151212 ?auto_151213 ) ) ( not ( = ?auto_151207 ?auto_151214 ) ) ( not ( = ?auto_151208 ?auto_151214 ) ) ( not ( = ?auto_151209 ?auto_151214 ) ) ( not ( = ?auto_151210 ?auto_151214 ) ) ( not ( = ?auto_151211 ?auto_151214 ) ) ( not ( = ?auto_151212 ?auto_151214 ) ) ( not ( = ?auto_151213 ?auto_151214 ) ) ( HOLDING ?auto_151214 ) ( CLEAR ?auto_151213 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_151207 ?auto_151208 ?auto_151209 ?auto_151210 ?auto_151211 ?auto_151212 ?auto_151213 ?auto_151214 )
      ( MAKE-6PILE ?auto_151207 ?auto_151208 ?auto_151209 ?auto_151210 ?auto_151211 ?auto_151212 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_151215 - BLOCK
      ?auto_151216 - BLOCK
      ?auto_151217 - BLOCK
      ?auto_151218 - BLOCK
      ?auto_151219 - BLOCK
      ?auto_151220 - BLOCK
    )
    :vars
    (
      ?auto_151222 - BLOCK
      ?auto_151221 - BLOCK
      ?auto_151223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151222 ?auto_151220 ) ( ON-TABLE ?auto_151215 ) ( ON ?auto_151216 ?auto_151215 ) ( ON ?auto_151217 ?auto_151216 ) ( ON ?auto_151218 ?auto_151217 ) ( ON ?auto_151219 ?auto_151218 ) ( ON ?auto_151220 ?auto_151219 ) ( not ( = ?auto_151215 ?auto_151216 ) ) ( not ( = ?auto_151215 ?auto_151217 ) ) ( not ( = ?auto_151215 ?auto_151218 ) ) ( not ( = ?auto_151215 ?auto_151219 ) ) ( not ( = ?auto_151215 ?auto_151220 ) ) ( not ( = ?auto_151215 ?auto_151222 ) ) ( not ( = ?auto_151216 ?auto_151217 ) ) ( not ( = ?auto_151216 ?auto_151218 ) ) ( not ( = ?auto_151216 ?auto_151219 ) ) ( not ( = ?auto_151216 ?auto_151220 ) ) ( not ( = ?auto_151216 ?auto_151222 ) ) ( not ( = ?auto_151217 ?auto_151218 ) ) ( not ( = ?auto_151217 ?auto_151219 ) ) ( not ( = ?auto_151217 ?auto_151220 ) ) ( not ( = ?auto_151217 ?auto_151222 ) ) ( not ( = ?auto_151218 ?auto_151219 ) ) ( not ( = ?auto_151218 ?auto_151220 ) ) ( not ( = ?auto_151218 ?auto_151222 ) ) ( not ( = ?auto_151219 ?auto_151220 ) ) ( not ( = ?auto_151219 ?auto_151222 ) ) ( not ( = ?auto_151220 ?auto_151222 ) ) ( not ( = ?auto_151215 ?auto_151221 ) ) ( not ( = ?auto_151216 ?auto_151221 ) ) ( not ( = ?auto_151217 ?auto_151221 ) ) ( not ( = ?auto_151218 ?auto_151221 ) ) ( not ( = ?auto_151219 ?auto_151221 ) ) ( not ( = ?auto_151220 ?auto_151221 ) ) ( not ( = ?auto_151222 ?auto_151221 ) ) ( CLEAR ?auto_151222 ) ( ON ?auto_151221 ?auto_151223 ) ( CLEAR ?auto_151221 ) ( HAND-EMPTY ) ( not ( = ?auto_151215 ?auto_151223 ) ) ( not ( = ?auto_151216 ?auto_151223 ) ) ( not ( = ?auto_151217 ?auto_151223 ) ) ( not ( = ?auto_151218 ?auto_151223 ) ) ( not ( = ?auto_151219 ?auto_151223 ) ) ( not ( = ?auto_151220 ?auto_151223 ) ) ( not ( = ?auto_151222 ?auto_151223 ) ) ( not ( = ?auto_151221 ?auto_151223 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_151221 ?auto_151223 )
      ( MAKE-6PILE ?auto_151215 ?auto_151216 ?auto_151217 ?auto_151218 ?auto_151219 ?auto_151220 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_151242 - BLOCK
      ?auto_151243 - BLOCK
      ?auto_151244 - BLOCK
      ?auto_151245 - BLOCK
      ?auto_151246 - BLOCK
      ?auto_151247 - BLOCK
    )
    :vars
    (
      ?auto_151249 - BLOCK
      ?auto_151250 - BLOCK
      ?auto_151248 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151242 ) ( ON ?auto_151243 ?auto_151242 ) ( ON ?auto_151244 ?auto_151243 ) ( ON ?auto_151245 ?auto_151244 ) ( ON ?auto_151246 ?auto_151245 ) ( not ( = ?auto_151242 ?auto_151243 ) ) ( not ( = ?auto_151242 ?auto_151244 ) ) ( not ( = ?auto_151242 ?auto_151245 ) ) ( not ( = ?auto_151242 ?auto_151246 ) ) ( not ( = ?auto_151242 ?auto_151247 ) ) ( not ( = ?auto_151242 ?auto_151249 ) ) ( not ( = ?auto_151243 ?auto_151244 ) ) ( not ( = ?auto_151243 ?auto_151245 ) ) ( not ( = ?auto_151243 ?auto_151246 ) ) ( not ( = ?auto_151243 ?auto_151247 ) ) ( not ( = ?auto_151243 ?auto_151249 ) ) ( not ( = ?auto_151244 ?auto_151245 ) ) ( not ( = ?auto_151244 ?auto_151246 ) ) ( not ( = ?auto_151244 ?auto_151247 ) ) ( not ( = ?auto_151244 ?auto_151249 ) ) ( not ( = ?auto_151245 ?auto_151246 ) ) ( not ( = ?auto_151245 ?auto_151247 ) ) ( not ( = ?auto_151245 ?auto_151249 ) ) ( not ( = ?auto_151246 ?auto_151247 ) ) ( not ( = ?auto_151246 ?auto_151249 ) ) ( not ( = ?auto_151247 ?auto_151249 ) ) ( not ( = ?auto_151242 ?auto_151250 ) ) ( not ( = ?auto_151243 ?auto_151250 ) ) ( not ( = ?auto_151244 ?auto_151250 ) ) ( not ( = ?auto_151245 ?auto_151250 ) ) ( not ( = ?auto_151246 ?auto_151250 ) ) ( not ( = ?auto_151247 ?auto_151250 ) ) ( not ( = ?auto_151249 ?auto_151250 ) ) ( ON ?auto_151250 ?auto_151248 ) ( not ( = ?auto_151242 ?auto_151248 ) ) ( not ( = ?auto_151243 ?auto_151248 ) ) ( not ( = ?auto_151244 ?auto_151248 ) ) ( not ( = ?auto_151245 ?auto_151248 ) ) ( not ( = ?auto_151246 ?auto_151248 ) ) ( not ( = ?auto_151247 ?auto_151248 ) ) ( not ( = ?auto_151249 ?auto_151248 ) ) ( not ( = ?auto_151250 ?auto_151248 ) ) ( ON ?auto_151249 ?auto_151250 ) ( CLEAR ?auto_151249 ) ( HOLDING ?auto_151247 ) ( CLEAR ?auto_151246 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_151242 ?auto_151243 ?auto_151244 ?auto_151245 ?auto_151246 ?auto_151247 ?auto_151249 )
      ( MAKE-6PILE ?auto_151242 ?auto_151243 ?auto_151244 ?auto_151245 ?auto_151246 ?auto_151247 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_151251 - BLOCK
      ?auto_151252 - BLOCK
      ?auto_151253 - BLOCK
      ?auto_151254 - BLOCK
      ?auto_151255 - BLOCK
      ?auto_151256 - BLOCK
    )
    :vars
    (
      ?auto_151259 - BLOCK
      ?auto_151258 - BLOCK
      ?auto_151257 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151251 ) ( ON ?auto_151252 ?auto_151251 ) ( ON ?auto_151253 ?auto_151252 ) ( ON ?auto_151254 ?auto_151253 ) ( ON ?auto_151255 ?auto_151254 ) ( not ( = ?auto_151251 ?auto_151252 ) ) ( not ( = ?auto_151251 ?auto_151253 ) ) ( not ( = ?auto_151251 ?auto_151254 ) ) ( not ( = ?auto_151251 ?auto_151255 ) ) ( not ( = ?auto_151251 ?auto_151256 ) ) ( not ( = ?auto_151251 ?auto_151259 ) ) ( not ( = ?auto_151252 ?auto_151253 ) ) ( not ( = ?auto_151252 ?auto_151254 ) ) ( not ( = ?auto_151252 ?auto_151255 ) ) ( not ( = ?auto_151252 ?auto_151256 ) ) ( not ( = ?auto_151252 ?auto_151259 ) ) ( not ( = ?auto_151253 ?auto_151254 ) ) ( not ( = ?auto_151253 ?auto_151255 ) ) ( not ( = ?auto_151253 ?auto_151256 ) ) ( not ( = ?auto_151253 ?auto_151259 ) ) ( not ( = ?auto_151254 ?auto_151255 ) ) ( not ( = ?auto_151254 ?auto_151256 ) ) ( not ( = ?auto_151254 ?auto_151259 ) ) ( not ( = ?auto_151255 ?auto_151256 ) ) ( not ( = ?auto_151255 ?auto_151259 ) ) ( not ( = ?auto_151256 ?auto_151259 ) ) ( not ( = ?auto_151251 ?auto_151258 ) ) ( not ( = ?auto_151252 ?auto_151258 ) ) ( not ( = ?auto_151253 ?auto_151258 ) ) ( not ( = ?auto_151254 ?auto_151258 ) ) ( not ( = ?auto_151255 ?auto_151258 ) ) ( not ( = ?auto_151256 ?auto_151258 ) ) ( not ( = ?auto_151259 ?auto_151258 ) ) ( ON ?auto_151258 ?auto_151257 ) ( not ( = ?auto_151251 ?auto_151257 ) ) ( not ( = ?auto_151252 ?auto_151257 ) ) ( not ( = ?auto_151253 ?auto_151257 ) ) ( not ( = ?auto_151254 ?auto_151257 ) ) ( not ( = ?auto_151255 ?auto_151257 ) ) ( not ( = ?auto_151256 ?auto_151257 ) ) ( not ( = ?auto_151259 ?auto_151257 ) ) ( not ( = ?auto_151258 ?auto_151257 ) ) ( ON ?auto_151259 ?auto_151258 ) ( CLEAR ?auto_151255 ) ( ON ?auto_151256 ?auto_151259 ) ( CLEAR ?auto_151256 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_151257 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_151257 ?auto_151258 ?auto_151259 )
      ( MAKE-6PILE ?auto_151251 ?auto_151252 ?auto_151253 ?auto_151254 ?auto_151255 ?auto_151256 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_151260 - BLOCK
      ?auto_151261 - BLOCK
      ?auto_151262 - BLOCK
      ?auto_151263 - BLOCK
      ?auto_151264 - BLOCK
      ?auto_151265 - BLOCK
    )
    :vars
    (
      ?auto_151268 - BLOCK
      ?auto_151266 - BLOCK
      ?auto_151267 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151260 ) ( ON ?auto_151261 ?auto_151260 ) ( ON ?auto_151262 ?auto_151261 ) ( ON ?auto_151263 ?auto_151262 ) ( not ( = ?auto_151260 ?auto_151261 ) ) ( not ( = ?auto_151260 ?auto_151262 ) ) ( not ( = ?auto_151260 ?auto_151263 ) ) ( not ( = ?auto_151260 ?auto_151264 ) ) ( not ( = ?auto_151260 ?auto_151265 ) ) ( not ( = ?auto_151260 ?auto_151268 ) ) ( not ( = ?auto_151261 ?auto_151262 ) ) ( not ( = ?auto_151261 ?auto_151263 ) ) ( not ( = ?auto_151261 ?auto_151264 ) ) ( not ( = ?auto_151261 ?auto_151265 ) ) ( not ( = ?auto_151261 ?auto_151268 ) ) ( not ( = ?auto_151262 ?auto_151263 ) ) ( not ( = ?auto_151262 ?auto_151264 ) ) ( not ( = ?auto_151262 ?auto_151265 ) ) ( not ( = ?auto_151262 ?auto_151268 ) ) ( not ( = ?auto_151263 ?auto_151264 ) ) ( not ( = ?auto_151263 ?auto_151265 ) ) ( not ( = ?auto_151263 ?auto_151268 ) ) ( not ( = ?auto_151264 ?auto_151265 ) ) ( not ( = ?auto_151264 ?auto_151268 ) ) ( not ( = ?auto_151265 ?auto_151268 ) ) ( not ( = ?auto_151260 ?auto_151266 ) ) ( not ( = ?auto_151261 ?auto_151266 ) ) ( not ( = ?auto_151262 ?auto_151266 ) ) ( not ( = ?auto_151263 ?auto_151266 ) ) ( not ( = ?auto_151264 ?auto_151266 ) ) ( not ( = ?auto_151265 ?auto_151266 ) ) ( not ( = ?auto_151268 ?auto_151266 ) ) ( ON ?auto_151266 ?auto_151267 ) ( not ( = ?auto_151260 ?auto_151267 ) ) ( not ( = ?auto_151261 ?auto_151267 ) ) ( not ( = ?auto_151262 ?auto_151267 ) ) ( not ( = ?auto_151263 ?auto_151267 ) ) ( not ( = ?auto_151264 ?auto_151267 ) ) ( not ( = ?auto_151265 ?auto_151267 ) ) ( not ( = ?auto_151268 ?auto_151267 ) ) ( not ( = ?auto_151266 ?auto_151267 ) ) ( ON ?auto_151268 ?auto_151266 ) ( ON ?auto_151265 ?auto_151268 ) ( CLEAR ?auto_151265 ) ( ON-TABLE ?auto_151267 ) ( HOLDING ?auto_151264 ) ( CLEAR ?auto_151263 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_151260 ?auto_151261 ?auto_151262 ?auto_151263 ?auto_151264 )
      ( MAKE-6PILE ?auto_151260 ?auto_151261 ?auto_151262 ?auto_151263 ?auto_151264 ?auto_151265 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_151269 - BLOCK
      ?auto_151270 - BLOCK
      ?auto_151271 - BLOCK
      ?auto_151272 - BLOCK
      ?auto_151273 - BLOCK
      ?auto_151274 - BLOCK
    )
    :vars
    (
      ?auto_151276 - BLOCK
      ?auto_151275 - BLOCK
      ?auto_151277 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151269 ) ( ON ?auto_151270 ?auto_151269 ) ( ON ?auto_151271 ?auto_151270 ) ( ON ?auto_151272 ?auto_151271 ) ( not ( = ?auto_151269 ?auto_151270 ) ) ( not ( = ?auto_151269 ?auto_151271 ) ) ( not ( = ?auto_151269 ?auto_151272 ) ) ( not ( = ?auto_151269 ?auto_151273 ) ) ( not ( = ?auto_151269 ?auto_151274 ) ) ( not ( = ?auto_151269 ?auto_151276 ) ) ( not ( = ?auto_151270 ?auto_151271 ) ) ( not ( = ?auto_151270 ?auto_151272 ) ) ( not ( = ?auto_151270 ?auto_151273 ) ) ( not ( = ?auto_151270 ?auto_151274 ) ) ( not ( = ?auto_151270 ?auto_151276 ) ) ( not ( = ?auto_151271 ?auto_151272 ) ) ( not ( = ?auto_151271 ?auto_151273 ) ) ( not ( = ?auto_151271 ?auto_151274 ) ) ( not ( = ?auto_151271 ?auto_151276 ) ) ( not ( = ?auto_151272 ?auto_151273 ) ) ( not ( = ?auto_151272 ?auto_151274 ) ) ( not ( = ?auto_151272 ?auto_151276 ) ) ( not ( = ?auto_151273 ?auto_151274 ) ) ( not ( = ?auto_151273 ?auto_151276 ) ) ( not ( = ?auto_151274 ?auto_151276 ) ) ( not ( = ?auto_151269 ?auto_151275 ) ) ( not ( = ?auto_151270 ?auto_151275 ) ) ( not ( = ?auto_151271 ?auto_151275 ) ) ( not ( = ?auto_151272 ?auto_151275 ) ) ( not ( = ?auto_151273 ?auto_151275 ) ) ( not ( = ?auto_151274 ?auto_151275 ) ) ( not ( = ?auto_151276 ?auto_151275 ) ) ( ON ?auto_151275 ?auto_151277 ) ( not ( = ?auto_151269 ?auto_151277 ) ) ( not ( = ?auto_151270 ?auto_151277 ) ) ( not ( = ?auto_151271 ?auto_151277 ) ) ( not ( = ?auto_151272 ?auto_151277 ) ) ( not ( = ?auto_151273 ?auto_151277 ) ) ( not ( = ?auto_151274 ?auto_151277 ) ) ( not ( = ?auto_151276 ?auto_151277 ) ) ( not ( = ?auto_151275 ?auto_151277 ) ) ( ON ?auto_151276 ?auto_151275 ) ( ON ?auto_151274 ?auto_151276 ) ( ON-TABLE ?auto_151277 ) ( CLEAR ?auto_151272 ) ( ON ?auto_151273 ?auto_151274 ) ( CLEAR ?auto_151273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_151277 ?auto_151275 ?auto_151276 ?auto_151274 )
      ( MAKE-6PILE ?auto_151269 ?auto_151270 ?auto_151271 ?auto_151272 ?auto_151273 ?auto_151274 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_151278 - BLOCK
      ?auto_151279 - BLOCK
      ?auto_151280 - BLOCK
      ?auto_151281 - BLOCK
      ?auto_151282 - BLOCK
      ?auto_151283 - BLOCK
    )
    :vars
    (
      ?auto_151284 - BLOCK
      ?auto_151286 - BLOCK
      ?auto_151285 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151278 ) ( ON ?auto_151279 ?auto_151278 ) ( ON ?auto_151280 ?auto_151279 ) ( not ( = ?auto_151278 ?auto_151279 ) ) ( not ( = ?auto_151278 ?auto_151280 ) ) ( not ( = ?auto_151278 ?auto_151281 ) ) ( not ( = ?auto_151278 ?auto_151282 ) ) ( not ( = ?auto_151278 ?auto_151283 ) ) ( not ( = ?auto_151278 ?auto_151284 ) ) ( not ( = ?auto_151279 ?auto_151280 ) ) ( not ( = ?auto_151279 ?auto_151281 ) ) ( not ( = ?auto_151279 ?auto_151282 ) ) ( not ( = ?auto_151279 ?auto_151283 ) ) ( not ( = ?auto_151279 ?auto_151284 ) ) ( not ( = ?auto_151280 ?auto_151281 ) ) ( not ( = ?auto_151280 ?auto_151282 ) ) ( not ( = ?auto_151280 ?auto_151283 ) ) ( not ( = ?auto_151280 ?auto_151284 ) ) ( not ( = ?auto_151281 ?auto_151282 ) ) ( not ( = ?auto_151281 ?auto_151283 ) ) ( not ( = ?auto_151281 ?auto_151284 ) ) ( not ( = ?auto_151282 ?auto_151283 ) ) ( not ( = ?auto_151282 ?auto_151284 ) ) ( not ( = ?auto_151283 ?auto_151284 ) ) ( not ( = ?auto_151278 ?auto_151286 ) ) ( not ( = ?auto_151279 ?auto_151286 ) ) ( not ( = ?auto_151280 ?auto_151286 ) ) ( not ( = ?auto_151281 ?auto_151286 ) ) ( not ( = ?auto_151282 ?auto_151286 ) ) ( not ( = ?auto_151283 ?auto_151286 ) ) ( not ( = ?auto_151284 ?auto_151286 ) ) ( ON ?auto_151286 ?auto_151285 ) ( not ( = ?auto_151278 ?auto_151285 ) ) ( not ( = ?auto_151279 ?auto_151285 ) ) ( not ( = ?auto_151280 ?auto_151285 ) ) ( not ( = ?auto_151281 ?auto_151285 ) ) ( not ( = ?auto_151282 ?auto_151285 ) ) ( not ( = ?auto_151283 ?auto_151285 ) ) ( not ( = ?auto_151284 ?auto_151285 ) ) ( not ( = ?auto_151286 ?auto_151285 ) ) ( ON ?auto_151284 ?auto_151286 ) ( ON ?auto_151283 ?auto_151284 ) ( ON-TABLE ?auto_151285 ) ( ON ?auto_151282 ?auto_151283 ) ( CLEAR ?auto_151282 ) ( HOLDING ?auto_151281 ) ( CLEAR ?auto_151280 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_151278 ?auto_151279 ?auto_151280 ?auto_151281 )
      ( MAKE-6PILE ?auto_151278 ?auto_151279 ?auto_151280 ?auto_151281 ?auto_151282 ?auto_151283 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_151287 - BLOCK
      ?auto_151288 - BLOCK
      ?auto_151289 - BLOCK
      ?auto_151290 - BLOCK
      ?auto_151291 - BLOCK
      ?auto_151292 - BLOCK
    )
    :vars
    (
      ?auto_151294 - BLOCK
      ?auto_151293 - BLOCK
      ?auto_151295 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151287 ) ( ON ?auto_151288 ?auto_151287 ) ( ON ?auto_151289 ?auto_151288 ) ( not ( = ?auto_151287 ?auto_151288 ) ) ( not ( = ?auto_151287 ?auto_151289 ) ) ( not ( = ?auto_151287 ?auto_151290 ) ) ( not ( = ?auto_151287 ?auto_151291 ) ) ( not ( = ?auto_151287 ?auto_151292 ) ) ( not ( = ?auto_151287 ?auto_151294 ) ) ( not ( = ?auto_151288 ?auto_151289 ) ) ( not ( = ?auto_151288 ?auto_151290 ) ) ( not ( = ?auto_151288 ?auto_151291 ) ) ( not ( = ?auto_151288 ?auto_151292 ) ) ( not ( = ?auto_151288 ?auto_151294 ) ) ( not ( = ?auto_151289 ?auto_151290 ) ) ( not ( = ?auto_151289 ?auto_151291 ) ) ( not ( = ?auto_151289 ?auto_151292 ) ) ( not ( = ?auto_151289 ?auto_151294 ) ) ( not ( = ?auto_151290 ?auto_151291 ) ) ( not ( = ?auto_151290 ?auto_151292 ) ) ( not ( = ?auto_151290 ?auto_151294 ) ) ( not ( = ?auto_151291 ?auto_151292 ) ) ( not ( = ?auto_151291 ?auto_151294 ) ) ( not ( = ?auto_151292 ?auto_151294 ) ) ( not ( = ?auto_151287 ?auto_151293 ) ) ( not ( = ?auto_151288 ?auto_151293 ) ) ( not ( = ?auto_151289 ?auto_151293 ) ) ( not ( = ?auto_151290 ?auto_151293 ) ) ( not ( = ?auto_151291 ?auto_151293 ) ) ( not ( = ?auto_151292 ?auto_151293 ) ) ( not ( = ?auto_151294 ?auto_151293 ) ) ( ON ?auto_151293 ?auto_151295 ) ( not ( = ?auto_151287 ?auto_151295 ) ) ( not ( = ?auto_151288 ?auto_151295 ) ) ( not ( = ?auto_151289 ?auto_151295 ) ) ( not ( = ?auto_151290 ?auto_151295 ) ) ( not ( = ?auto_151291 ?auto_151295 ) ) ( not ( = ?auto_151292 ?auto_151295 ) ) ( not ( = ?auto_151294 ?auto_151295 ) ) ( not ( = ?auto_151293 ?auto_151295 ) ) ( ON ?auto_151294 ?auto_151293 ) ( ON ?auto_151292 ?auto_151294 ) ( ON-TABLE ?auto_151295 ) ( ON ?auto_151291 ?auto_151292 ) ( CLEAR ?auto_151289 ) ( ON ?auto_151290 ?auto_151291 ) ( CLEAR ?auto_151290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_151295 ?auto_151293 ?auto_151294 ?auto_151292 ?auto_151291 )
      ( MAKE-6PILE ?auto_151287 ?auto_151288 ?auto_151289 ?auto_151290 ?auto_151291 ?auto_151292 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_151296 - BLOCK
      ?auto_151297 - BLOCK
      ?auto_151298 - BLOCK
      ?auto_151299 - BLOCK
      ?auto_151300 - BLOCK
      ?auto_151301 - BLOCK
    )
    :vars
    (
      ?auto_151303 - BLOCK
      ?auto_151302 - BLOCK
      ?auto_151304 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151296 ) ( ON ?auto_151297 ?auto_151296 ) ( not ( = ?auto_151296 ?auto_151297 ) ) ( not ( = ?auto_151296 ?auto_151298 ) ) ( not ( = ?auto_151296 ?auto_151299 ) ) ( not ( = ?auto_151296 ?auto_151300 ) ) ( not ( = ?auto_151296 ?auto_151301 ) ) ( not ( = ?auto_151296 ?auto_151303 ) ) ( not ( = ?auto_151297 ?auto_151298 ) ) ( not ( = ?auto_151297 ?auto_151299 ) ) ( not ( = ?auto_151297 ?auto_151300 ) ) ( not ( = ?auto_151297 ?auto_151301 ) ) ( not ( = ?auto_151297 ?auto_151303 ) ) ( not ( = ?auto_151298 ?auto_151299 ) ) ( not ( = ?auto_151298 ?auto_151300 ) ) ( not ( = ?auto_151298 ?auto_151301 ) ) ( not ( = ?auto_151298 ?auto_151303 ) ) ( not ( = ?auto_151299 ?auto_151300 ) ) ( not ( = ?auto_151299 ?auto_151301 ) ) ( not ( = ?auto_151299 ?auto_151303 ) ) ( not ( = ?auto_151300 ?auto_151301 ) ) ( not ( = ?auto_151300 ?auto_151303 ) ) ( not ( = ?auto_151301 ?auto_151303 ) ) ( not ( = ?auto_151296 ?auto_151302 ) ) ( not ( = ?auto_151297 ?auto_151302 ) ) ( not ( = ?auto_151298 ?auto_151302 ) ) ( not ( = ?auto_151299 ?auto_151302 ) ) ( not ( = ?auto_151300 ?auto_151302 ) ) ( not ( = ?auto_151301 ?auto_151302 ) ) ( not ( = ?auto_151303 ?auto_151302 ) ) ( ON ?auto_151302 ?auto_151304 ) ( not ( = ?auto_151296 ?auto_151304 ) ) ( not ( = ?auto_151297 ?auto_151304 ) ) ( not ( = ?auto_151298 ?auto_151304 ) ) ( not ( = ?auto_151299 ?auto_151304 ) ) ( not ( = ?auto_151300 ?auto_151304 ) ) ( not ( = ?auto_151301 ?auto_151304 ) ) ( not ( = ?auto_151303 ?auto_151304 ) ) ( not ( = ?auto_151302 ?auto_151304 ) ) ( ON ?auto_151303 ?auto_151302 ) ( ON ?auto_151301 ?auto_151303 ) ( ON-TABLE ?auto_151304 ) ( ON ?auto_151300 ?auto_151301 ) ( ON ?auto_151299 ?auto_151300 ) ( CLEAR ?auto_151299 ) ( HOLDING ?auto_151298 ) ( CLEAR ?auto_151297 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_151296 ?auto_151297 ?auto_151298 )
      ( MAKE-6PILE ?auto_151296 ?auto_151297 ?auto_151298 ?auto_151299 ?auto_151300 ?auto_151301 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_151305 - BLOCK
      ?auto_151306 - BLOCK
      ?auto_151307 - BLOCK
      ?auto_151308 - BLOCK
      ?auto_151309 - BLOCK
      ?auto_151310 - BLOCK
    )
    :vars
    (
      ?auto_151313 - BLOCK
      ?auto_151311 - BLOCK
      ?auto_151312 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151305 ) ( ON ?auto_151306 ?auto_151305 ) ( not ( = ?auto_151305 ?auto_151306 ) ) ( not ( = ?auto_151305 ?auto_151307 ) ) ( not ( = ?auto_151305 ?auto_151308 ) ) ( not ( = ?auto_151305 ?auto_151309 ) ) ( not ( = ?auto_151305 ?auto_151310 ) ) ( not ( = ?auto_151305 ?auto_151313 ) ) ( not ( = ?auto_151306 ?auto_151307 ) ) ( not ( = ?auto_151306 ?auto_151308 ) ) ( not ( = ?auto_151306 ?auto_151309 ) ) ( not ( = ?auto_151306 ?auto_151310 ) ) ( not ( = ?auto_151306 ?auto_151313 ) ) ( not ( = ?auto_151307 ?auto_151308 ) ) ( not ( = ?auto_151307 ?auto_151309 ) ) ( not ( = ?auto_151307 ?auto_151310 ) ) ( not ( = ?auto_151307 ?auto_151313 ) ) ( not ( = ?auto_151308 ?auto_151309 ) ) ( not ( = ?auto_151308 ?auto_151310 ) ) ( not ( = ?auto_151308 ?auto_151313 ) ) ( not ( = ?auto_151309 ?auto_151310 ) ) ( not ( = ?auto_151309 ?auto_151313 ) ) ( not ( = ?auto_151310 ?auto_151313 ) ) ( not ( = ?auto_151305 ?auto_151311 ) ) ( not ( = ?auto_151306 ?auto_151311 ) ) ( not ( = ?auto_151307 ?auto_151311 ) ) ( not ( = ?auto_151308 ?auto_151311 ) ) ( not ( = ?auto_151309 ?auto_151311 ) ) ( not ( = ?auto_151310 ?auto_151311 ) ) ( not ( = ?auto_151313 ?auto_151311 ) ) ( ON ?auto_151311 ?auto_151312 ) ( not ( = ?auto_151305 ?auto_151312 ) ) ( not ( = ?auto_151306 ?auto_151312 ) ) ( not ( = ?auto_151307 ?auto_151312 ) ) ( not ( = ?auto_151308 ?auto_151312 ) ) ( not ( = ?auto_151309 ?auto_151312 ) ) ( not ( = ?auto_151310 ?auto_151312 ) ) ( not ( = ?auto_151313 ?auto_151312 ) ) ( not ( = ?auto_151311 ?auto_151312 ) ) ( ON ?auto_151313 ?auto_151311 ) ( ON ?auto_151310 ?auto_151313 ) ( ON-TABLE ?auto_151312 ) ( ON ?auto_151309 ?auto_151310 ) ( ON ?auto_151308 ?auto_151309 ) ( CLEAR ?auto_151306 ) ( ON ?auto_151307 ?auto_151308 ) ( CLEAR ?auto_151307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_151312 ?auto_151311 ?auto_151313 ?auto_151310 ?auto_151309 ?auto_151308 )
      ( MAKE-6PILE ?auto_151305 ?auto_151306 ?auto_151307 ?auto_151308 ?auto_151309 ?auto_151310 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_151314 - BLOCK
      ?auto_151315 - BLOCK
      ?auto_151316 - BLOCK
      ?auto_151317 - BLOCK
      ?auto_151318 - BLOCK
      ?auto_151319 - BLOCK
    )
    :vars
    (
      ?auto_151321 - BLOCK
      ?auto_151322 - BLOCK
      ?auto_151320 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151314 ) ( not ( = ?auto_151314 ?auto_151315 ) ) ( not ( = ?auto_151314 ?auto_151316 ) ) ( not ( = ?auto_151314 ?auto_151317 ) ) ( not ( = ?auto_151314 ?auto_151318 ) ) ( not ( = ?auto_151314 ?auto_151319 ) ) ( not ( = ?auto_151314 ?auto_151321 ) ) ( not ( = ?auto_151315 ?auto_151316 ) ) ( not ( = ?auto_151315 ?auto_151317 ) ) ( not ( = ?auto_151315 ?auto_151318 ) ) ( not ( = ?auto_151315 ?auto_151319 ) ) ( not ( = ?auto_151315 ?auto_151321 ) ) ( not ( = ?auto_151316 ?auto_151317 ) ) ( not ( = ?auto_151316 ?auto_151318 ) ) ( not ( = ?auto_151316 ?auto_151319 ) ) ( not ( = ?auto_151316 ?auto_151321 ) ) ( not ( = ?auto_151317 ?auto_151318 ) ) ( not ( = ?auto_151317 ?auto_151319 ) ) ( not ( = ?auto_151317 ?auto_151321 ) ) ( not ( = ?auto_151318 ?auto_151319 ) ) ( not ( = ?auto_151318 ?auto_151321 ) ) ( not ( = ?auto_151319 ?auto_151321 ) ) ( not ( = ?auto_151314 ?auto_151322 ) ) ( not ( = ?auto_151315 ?auto_151322 ) ) ( not ( = ?auto_151316 ?auto_151322 ) ) ( not ( = ?auto_151317 ?auto_151322 ) ) ( not ( = ?auto_151318 ?auto_151322 ) ) ( not ( = ?auto_151319 ?auto_151322 ) ) ( not ( = ?auto_151321 ?auto_151322 ) ) ( ON ?auto_151322 ?auto_151320 ) ( not ( = ?auto_151314 ?auto_151320 ) ) ( not ( = ?auto_151315 ?auto_151320 ) ) ( not ( = ?auto_151316 ?auto_151320 ) ) ( not ( = ?auto_151317 ?auto_151320 ) ) ( not ( = ?auto_151318 ?auto_151320 ) ) ( not ( = ?auto_151319 ?auto_151320 ) ) ( not ( = ?auto_151321 ?auto_151320 ) ) ( not ( = ?auto_151322 ?auto_151320 ) ) ( ON ?auto_151321 ?auto_151322 ) ( ON ?auto_151319 ?auto_151321 ) ( ON-TABLE ?auto_151320 ) ( ON ?auto_151318 ?auto_151319 ) ( ON ?auto_151317 ?auto_151318 ) ( ON ?auto_151316 ?auto_151317 ) ( CLEAR ?auto_151316 ) ( HOLDING ?auto_151315 ) ( CLEAR ?auto_151314 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_151314 ?auto_151315 )
      ( MAKE-6PILE ?auto_151314 ?auto_151315 ?auto_151316 ?auto_151317 ?auto_151318 ?auto_151319 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_151323 - BLOCK
      ?auto_151324 - BLOCK
      ?auto_151325 - BLOCK
      ?auto_151326 - BLOCK
      ?auto_151327 - BLOCK
      ?auto_151328 - BLOCK
    )
    :vars
    (
      ?auto_151330 - BLOCK
      ?auto_151329 - BLOCK
      ?auto_151331 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151323 ) ( not ( = ?auto_151323 ?auto_151324 ) ) ( not ( = ?auto_151323 ?auto_151325 ) ) ( not ( = ?auto_151323 ?auto_151326 ) ) ( not ( = ?auto_151323 ?auto_151327 ) ) ( not ( = ?auto_151323 ?auto_151328 ) ) ( not ( = ?auto_151323 ?auto_151330 ) ) ( not ( = ?auto_151324 ?auto_151325 ) ) ( not ( = ?auto_151324 ?auto_151326 ) ) ( not ( = ?auto_151324 ?auto_151327 ) ) ( not ( = ?auto_151324 ?auto_151328 ) ) ( not ( = ?auto_151324 ?auto_151330 ) ) ( not ( = ?auto_151325 ?auto_151326 ) ) ( not ( = ?auto_151325 ?auto_151327 ) ) ( not ( = ?auto_151325 ?auto_151328 ) ) ( not ( = ?auto_151325 ?auto_151330 ) ) ( not ( = ?auto_151326 ?auto_151327 ) ) ( not ( = ?auto_151326 ?auto_151328 ) ) ( not ( = ?auto_151326 ?auto_151330 ) ) ( not ( = ?auto_151327 ?auto_151328 ) ) ( not ( = ?auto_151327 ?auto_151330 ) ) ( not ( = ?auto_151328 ?auto_151330 ) ) ( not ( = ?auto_151323 ?auto_151329 ) ) ( not ( = ?auto_151324 ?auto_151329 ) ) ( not ( = ?auto_151325 ?auto_151329 ) ) ( not ( = ?auto_151326 ?auto_151329 ) ) ( not ( = ?auto_151327 ?auto_151329 ) ) ( not ( = ?auto_151328 ?auto_151329 ) ) ( not ( = ?auto_151330 ?auto_151329 ) ) ( ON ?auto_151329 ?auto_151331 ) ( not ( = ?auto_151323 ?auto_151331 ) ) ( not ( = ?auto_151324 ?auto_151331 ) ) ( not ( = ?auto_151325 ?auto_151331 ) ) ( not ( = ?auto_151326 ?auto_151331 ) ) ( not ( = ?auto_151327 ?auto_151331 ) ) ( not ( = ?auto_151328 ?auto_151331 ) ) ( not ( = ?auto_151330 ?auto_151331 ) ) ( not ( = ?auto_151329 ?auto_151331 ) ) ( ON ?auto_151330 ?auto_151329 ) ( ON ?auto_151328 ?auto_151330 ) ( ON-TABLE ?auto_151331 ) ( ON ?auto_151327 ?auto_151328 ) ( ON ?auto_151326 ?auto_151327 ) ( ON ?auto_151325 ?auto_151326 ) ( CLEAR ?auto_151323 ) ( ON ?auto_151324 ?auto_151325 ) ( CLEAR ?auto_151324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_151331 ?auto_151329 ?auto_151330 ?auto_151328 ?auto_151327 ?auto_151326 ?auto_151325 )
      ( MAKE-6PILE ?auto_151323 ?auto_151324 ?auto_151325 ?auto_151326 ?auto_151327 ?auto_151328 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_151332 - BLOCK
      ?auto_151333 - BLOCK
      ?auto_151334 - BLOCK
      ?auto_151335 - BLOCK
      ?auto_151336 - BLOCK
      ?auto_151337 - BLOCK
    )
    :vars
    (
      ?auto_151339 - BLOCK
      ?auto_151338 - BLOCK
      ?auto_151340 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151332 ?auto_151333 ) ) ( not ( = ?auto_151332 ?auto_151334 ) ) ( not ( = ?auto_151332 ?auto_151335 ) ) ( not ( = ?auto_151332 ?auto_151336 ) ) ( not ( = ?auto_151332 ?auto_151337 ) ) ( not ( = ?auto_151332 ?auto_151339 ) ) ( not ( = ?auto_151333 ?auto_151334 ) ) ( not ( = ?auto_151333 ?auto_151335 ) ) ( not ( = ?auto_151333 ?auto_151336 ) ) ( not ( = ?auto_151333 ?auto_151337 ) ) ( not ( = ?auto_151333 ?auto_151339 ) ) ( not ( = ?auto_151334 ?auto_151335 ) ) ( not ( = ?auto_151334 ?auto_151336 ) ) ( not ( = ?auto_151334 ?auto_151337 ) ) ( not ( = ?auto_151334 ?auto_151339 ) ) ( not ( = ?auto_151335 ?auto_151336 ) ) ( not ( = ?auto_151335 ?auto_151337 ) ) ( not ( = ?auto_151335 ?auto_151339 ) ) ( not ( = ?auto_151336 ?auto_151337 ) ) ( not ( = ?auto_151336 ?auto_151339 ) ) ( not ( = ?auto_151337 ?auto_151339 ) ) ( not ( = ?auto_151332 ?auto_151338 ) ) ( not ( = ?auto_151333 ?auto_151338 ) ) ( not ( = ?auto_151334 ?auto_151338 ) ) ( not ( = ?auto_151335 ?auto_151338 ) ) ( not ( = ?auto_151336 ?auto_151338 ) ) ( not ( = ?auto_151337 ?auto_151338 ) ) ( not ( = ?auto_151339 ?auto_151338 ) ) ( ON ?auto_151338 ?auto_151340 ) ( not ( = ?auto_151332 ?auto_151340 ) ) ( not ( = ?auto_151333 ?auto_151340 ) ) ( not ( = ?auto_151334 ?auto_151340 ) ) ( not ( = ?auto_151335 ?auto_151340 ) ) ( not ( = ?auto_151336 ?auto_151340 ) ) ( not ( = ?auto_151337 ?auto_151340 ) ) ( not ( = ?auto_151339 ?auto_151340 ) ) ( not ( = ?auto_151338 ?auto_151340 ) ) ( ON ?auto_151339 ?auto_151338 ) ( ON ?auto_151337 ?auto_151339 ) ( ON-TABLE ?auto_151340 ) ( ON ?auto_151336 ?auto_151337 ) ( ON ?auto_151335 ?auto_151336 ) ( ON ?auto_151334 ?auto_151335 ) ( ON ?auto_151333 ?auto_151334 ) ( CLEAR ?auto_151333 ) ( HOLDING ?auto_151332 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_151332 )
      ( MAKE-6PILE ?auto_151332 ?auto_151333 ?auto_151334 ?auto_151335 ?auto_151336 ?auto_151337 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_151341 - BLOCK
      ?auto_151342 - BLOCK
      ?auto_151343 - BLOCK
      ?auto_151344 - BLOCK
      ?auto_151345 - BLOCK
      ?auto_151346 - BLOCK
    )
    :vars
    (
      ?auto_151349 - BLOCK
      ?auto_151347 - BLOCK
      ?auto_151348 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151341 ?auto_151342 ) ) ( not ( = ?auto_151341 ?auto_151343 ) ) ( not ( = ?auto_151341 ?auto_151344 ) ) ( not ( = ?auto_151341 ?auto_151345 ) ) ( not ( = ?auto_151341 ?auto_151346 ) ) ( not ( = ?auto_151341 ?auto_151349 ) ) ( not ( = ?auto_151342 ?auto_151343 ) ) ( not ( = ?auto_151342 ?auto_151344 ) ) ( not ( = ?auto_151342 ?auto_151345 ) ) ( not ( = ?auto_151342 ?auto_151346 ) ) ( not ( = ?auto_151342 ?auto_151349 ) ) ( not ( = ?auto_151343 ?auto_151344 ) ) ( not ( = ?auto_151343 ?auto_151345 ) ) ( not ( = ?auto_151343 ?auto_151346 ) ) ( not ( = ?auto_151343 ?auto_151349 ) ) ( not ( = ?auto_151344 ?auto_151345 ) ) ( not ( = ?auto_151344 ?auto_151346 ) ) ( not ( = ?auto_151344 ?auto_151349 ) ) ( not ( = ?auto_151345 ?auto_151346 ) ) ( not ( = ?auto_151345 ?auto_151349 ) ) ( not ( = ?auto_151346 ?auto_151349 ) ) ( not ( = ?auto_151341 ?auto_151347 ) ) ( not ( = ?auto_151342 ?auto_151347 ) ) ( not ( = ?auto_151343 ?auto_151347 ) ) ( not ( = ?auto_151344 ?auto_151347 ) ) ( not ( = ?auto_151345 ?auto_151347 ) ) ( not ( = ?auto_151346 ?auto_151347 ) ) ( not ( = ?auto_151349 ?auto_151347 ) ) ( ON ?auto_151347 ?auto_151348 ) ( not ( = ?auto_151341 ?auto_151348 ) ) ( not ( = ?auto_151342 ?auto_151348 ) ) ( not ( = ?auto_151343 ?auto_151348 ) ) ( not ( = ?auto_151344 ?auto_151348 ) ) ( not ( = ?auto_151345 ?auto_151348 ) ) ( not ( = ?auto_151346 ?auto_151348 ) ) ( not ( = ?auto_151349 ?auto_151348 ) ) ( not ( = ?auto_151347 ?auto_151348 ) ) ( ON ?auto_151349 ?auto_151347 ) ( ON ?auto_151346 ?auto_151349 ) ( ON-TABLE ?auto_151348 ) ( ON ?auto_151345 ?auto_151346 ) ( ON ?auto_151344 ?auto_151345 ) ( ON ?auto_151343 ?auto_151344 ) ( ON ?auto_151342 ?auto_151343 ) ( ON ?auto_151341 ?auto_151342 ) ( CLEAR ?auto_151341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_151348 ?auto_151347 ?auto_151349 ?auto_151346 ?auto_151345 ?auto_151344 ?auto_151343 ?auto_151342 )
      ( MAKE-6PILE ?auto_151341 ?auto_151342 ?auto_151343 ?auto_151344 ?auto_151345 ?auto_151346 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_151352 - BLOCK
      ?auto_151353 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_151353 ) ( CLEAR ?auto_151352 ) ( ON-TABLE ?auto_151352 ) ( not ( = ?auto_151352 ?auto_151353 ) ) )
    :subtasks
    ( ( !STACK ?auto_151353 ?auto_151352 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_151354 - BLOCK
      ?auto_151355 - BLOCK
    )
    :vars
    (
      ?auto_151356 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_151354 ) ( ON-TABLE ?auto_151354 ) ( not ( = ?auto_151354 ?auto_151355 ) ) ( ON ?auto_151355 ?auto_151356 ) ( CLEAR ?auto_151355 ) ( HAND-EMPTY ) ( not ( = ?auto_151354 ?auto_151356 ) ) ( not ( = ?auto_151355 ?auto_151356 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_151355 ?auto_151356 )
      ( MAKE-2PILE ?auto_151354 ?auto_151355 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_151357 - BLOCK
      ?auto_151358 - BLOCK
    )
    :vars
    (
      ?auto_151359 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151357 ?auto_151358 ) ) ( ON ?auto_151358 ?auto_151359 ) ( CLEAR ?auto_151358 ) ( not ( = ?auto_151357 ?auto_151359 ) ) ( not ( = ?auto_151358 ?auto_151359 ) ) ( HOLDING ?auto_151357 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_151357 )
      ( MAKE-2PILE ?auto_151357 ?auto_151358 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_151360 - BLOCK
      ?auto_151361 - BLOCK
    )
    :vars
    (
      ?auto_151362 - BLOCK
      ?auto_151363 - BLOCK
      ?auto_151365 - BLOCK
      ?auto_151367 - BLOCK
      ?auto_151364 - BLOCK
      ?auto_151366 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151360 ?auto_151361 ) ) ( ON ?auto_151361 ?auto_151362 ) ( not ( = ?auto_151360 ?auto_151362 ) ) ( not ( = ?auto_151361 ?auto_151362 ) ) ( ON ?auto_151360 ?auto_151361 ) ( CLEAR ?auto_151360 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_151363 ) ( ON ?auto_151365 ?auto_151363 ) ( ON ?auto_151367 ?auto_151365 ) ( ON ?auto_151364 ?auto_151367 ) ( ON ?auto_151366 ?auto_151364 ) ( ON ?auto_151362 ?auto_151366 ) ( not ( = ?auto_151363 ?auto_151365 ) ) ( not ( = ?auto_151363 ?auto_151367 ) ) ( not ( = ?auto_151363 ?auto_151364 ) ) ( not ( = ?auto_151363 ?auto_151366 ) ) ( not ( = ?auto_151363 ?auto_151362 ) ) ( not ( = ?auto_151363 ?auto_151361 ) ) ( not ( = ?auto_151363 ?auto_151360 ) ) ( not ( = ?auto_151365 ?auto_151367 ) ) ( not ( = ?auto_151365 ?auto_151364 ) ) ( not ( = ?auto_151365 ?auto_151366 ) ) ( not ( = ?auto_151365 ?auto_151362 ) ) ( not ( = ?auto_151365 ?auto_151361 ) ) ( not ( = ?auto_151365 ?auto_151360 ) ) ( not ( = ?auto_151367 ?auto_151364 ) ) ( not ( = ?auto_151367 ?auto_151366 ) ) ( not ( = ?auto_151367 ?auto_151362 ) ) ( not ( = ?auto_151367 ?auto_151361 ) ) ( not ( = ?auto_151367 ?auto_151360 ) ) ( not ( = ?auto_151364 ?auto_151366 ) ) ( not ( = ?auto_151364 ?auto_151362 ) ) ( not ( = ?auto_151364 ?auto_151361 ) ) ( not ( = ?auto_151364 ?auto_151360 ) ) ( not ( = ?auto_151366 ?auto_151362 ) ) ( not ( = ?auto_151366 ?auto_151361 ) ) ( not ( = ?auto_151366 ?auto_151360 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_151363 ?auto_151365 ?auto_151367 ?auto_151364 ?auto_151366 ?auto_151362 ?auto_151361 )
      ( MAKE-2PILE ?auto_151360 ?auto_151361 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_151368 - BLOCK
      ?auto_151369 - BLOCK
    )
    :vars
    (
      ?auto_151374 - BLOCK
      ?auto_151373 - BLOCK
      ?auto_151370 - BLOCK
      ?auto_151375 - BLOCK
      ?auto_151371 - BLOCK
      ?auto_151372 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151368 ?auto_151369 ) ) ( ON ?auto_151369 ?auto_151374 ) ( not ( = ?auto_151368 ?auto_151374 ) ) ( not ( = ?auto_151369 ?auto_151374 ) ) ( ON-TABLE ?auto_151373 ) ( ON ?auto_151370 ?auto_151373 ) ( ON ?auto_151375 ?auto_151370 ) ( ON ?auto_151371 ?auto_151375 ) ( ON ?auto_151372 ?auto_151371 ) ( ON ?auto_151374 ?auto_151372 ) ( not ( = ?auto_151373 ?auto_151370 ) ) ( not ( = ?auto_151373 ?auto_151375 ) ) ( not ( = ?auto_151373 ?auto_151371 ) ) ( not ( = ?auto_151373 ?auto_151372 ) ) ( not ( = ?auto_151373 ?auto_151374 ) ) ( not ( = ?auto_151373 ?auto_151369 ) ) ( not ( = ?auto_151373 ?auto_151368 ) ) ( not ( = ?auto_151370 ?auto_151375 ) ) ( not ( = ?auto_151370 ?auto_151371 ) ) ( not ( = ?auto_151370 ?auto_151372 ) ) ( not ( = ?auto_151370 ?auto_151374 ) ) ( not ( = ?auto_151370 ?auto_151369 ) ) ( not ( = ?auto_151370 ?auto_151368 ) ) ( not ( = ?auto_151375 ?auto_151371 ) ) ( not ( = ?auto_151375 ?auto_151372 ) ) ( not ( = ?auto_151375 ?auto_151374 ) ) ( not ( = ?auto_151375 ?auto_151369 ) ) ( not ( = ?auto_151375 ?auto_151368 ) ) ( not ( = ?auto_151371 ?auto_151372 ) ) ( not ( = ?auto_151371 ?auto_151374 ) ) ( not ( = ?auto_151371 ?auto_151369 ) ) ( not ( = ?auto_151371 ?auto_151368 ) ) ( not ( = ?auto_151372 ?auto_151374 ) ) ( not ( = ?auto_151372 ?auto_151369 ) ) ( not ( = ?auto_151372 ?auto_151368 ) ) ( HOLDING ?auto_151368 ) ( CLEAR ?auto_151369 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_151373 ?auto_151370 ?auto_151375 ?auto_151371 ?auto_151372 ?auto_151374 ?auto_151369 ?auto_151368 )
      ( MAKE-2PILE ?auto_151368 ?auto_151369 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_151376 - BLOCK
      ?auto_151377 - BLOCK
    )
    :vars
    (
      ?auto_151379 - BLOCK
      ?auto_151382 - BLOCK
      ?auto_151380 - BLOCK
      ?auto_151378 - BLOCK
      ?auto_151383 - BLOCK
      ?auto_151381 - BLOCK
      ?auto_151384 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151376 ?auto_151377 ) ) ( ON ?auto_151377 ?auto_151379 ) ( not ( = ?auto_151376 ?auto_151379 ) ) ( not ( = ?auto_151377 ?auto_151379 ) ) ( ON-TABLE ?auto_151382 ) ( ON ?auto_151380 ?auto_151382 ) ( ON ?auto_151378 ?auto_151380 ) ( ON ?auto_151383 ?auto_151378 ) ( ON ?auto_151381 ?auto_151383 ) ( ON ?auto_151379 ?auto_151381 ) ( not ( = ?auto_151382 ?auto_151380 ) ) ( not ( = ?auto_151382 ?auto_151378 ) ) ( not ( = ?auto_151382 ?auto_151383 ) ) ( not ( = ?auto_151382 ?auto_151381 ) ) ( not ( = ?auto_151382 ?auto_151379 ) ) ( not ( = ?auto_151382 ?auto_151377 ) ) ( not ( = ?auto_151382 ?auto_151376 ) ) ( not ( = ?auto_151380 ?auto_151378 ) ) ( not ( = ?auto_151380 ?auto_151383 ) ) ( not ( = ?auto_151380 ?auto_151381 ) ) ( not ( = ?auto_151380 ?auto_151379 ) ) ( not ( = ?auto_151380 ?auto_151377 ) ) ( not ( = ?auto_151380 ?auto_151376 ) ) ( not ( = ?auto_151378 ?auto_151383 ) ) ( not ( = ?auto_151378 ?auto_151381 ) ) ( not ( = ?auto_151378 ?auto_151379 ) ) ( not ( = ?auto_151378 ?auto_151377 ) ) ( not ( = ?auto_151378 ?auto_151376 ) ) ( not ( = ?auto_151383 ?auto_151381 ) ) ( not ( = ?auto_151383 ?auto_151379 ) ) ( not ( = ?auto_151383 ?auto_151377 ) ) ( not ( = ?auto_151383 ?auto_151376 ) ) ( not ( = ?auto_151381 ?auto_151379 ) ) ( not ( = ?auto_151381 ?auto_151377 ) ) ( not ( = ?auto_151381 ?auto_151376 ) ) ( CLEAR ?auto_151377 ) ( ON ?auto_151376 ?auto_151384 ) ( CLEAR ?auto_151376 ) ( HAND-EMPTY ) ( not ( = ?auto_151376 ?auto_151384 ) ) ( not ( = ?auto_151377 ?auto_151384 ) ) ( not ( = ?auto_151379 ?auto_151384 ) ) ( not ( = ?auto_151382 ?auto_151384 ) ) ( not ( = ?auto_151380 ?auto_151384 ) ) ( not ( = ?auto_151378 ?auto_151384 ) ) ( not ( = ?auto_151383 ?auto_151384 ) ) ( not ( = ?auto_151381 ?auto_151384 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_151376 ?auto_151384 )
      ( MAKE-2PILE ?auto_151376 ?auto_151377 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_151385 - BLOCK
      ?auto_151386 - BLOCK
    )
    :vars
    (
      ?auto_151388 - BLOCK
      ?auto_151390 - BLOCK
      ?auto_151393 - BLOCK
      ?auto_151387 - BLOCK
      ?auto_151392 - BLOCK
      ?auto_151391 - BLOCK
      ?auto_151389 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151385 ?auto_151386 ) ) ( not ( = ?auto_151385 ?auto_151388 ) ) ( not ( = ?auto_151386 ?auto_151388 ) ) ( ON-TABLE ?auto_151390 ) ( ON ?auto_151393 ?auto_151390 ) ( ON ?auto_151387 ?auto_151393 ) ( ON ?auto_151392 ?auto_151387 ) ( ON ?auto_151391 ?auto_151392 ) ( ON ?auto_151388 ?auto_151391 ) ( not ( = ?auto_151390 ?auto_151393 ) ) ( not ( = ?auto_151390 ?auto_151387 ) ) ( not ( = ?auto_151390 ?auto_151392 ) ) ( not ( = ?auto_151390 ?auto_151391 ) ) ( not ( = ?auto_151390 ?auto_151388 ) ) ( not ( = ?auto_151390 ?auto_151386 ) ) ( not ( = ?auto_151390 ?auto_151385 ) ) ( not ( = ?auto_151393 ?auto_151387 ) ) ( not ( = ?auto_151393 ?auto_151392 ) ) ( not ( = ?auto_151393 ?auto_151391 ) ) ( not ( = ?auto_151393 ?auto_151388 ) ) ( not ( = ?auto_151393 ?auto_151386 ) ) ( not ( = ?auto_151393 ?auto_151385 ) ) ( not ( = ?auto_151387 ?auto_151392 ) ) ( not ( = ?auto_151387 ?auto_151391 ) ) ( not ( = ?auto_151387 ?auto_151388 ) ) ( not ( = ?auto_151387 ?auto_151386 ) ) ( not ( = ?auto_151387 ?auto_151385 ) ) ( not ( = ?auto_151392 ?auto_151391 ) ) ( not ( = ?auto_151392 ?auto_151388 ) ) ( not ( = ?auto_151392 ?auto_151386 ) ) ( not ( = ?auto_151392 ?auto_151385 ) ) ( not ( = ?auto_151391 ?auto_151388 ) ) ( not ( = ?auto_151391 ?auto_151386 ) ) ( not ( = ?auto_151391 ?auto_151385 ) ) ( ON ?auto_151385 ?auto_151389 ) ( CLEAR ?auto_151385 ) ( not ( = ?auto_151385 ?auto_151389 ) ) ( not ( = ?auto_151386 ?auto_151389 ) ) ( not ( = ?auto_151388 ?auto_151389 ) ) ( not ( = ?auto_151390 ?auto_151389 ) ) ( not ( = ?auto_151393 ?auto_151389 ) ) ( not ( = ?auto_151387 ?auto_151389 ) ) ( not ( = ?auto_151392 ?auto_151389 ) ) ( not ( = ?auto_151391 ?auto_151389 ) ) ( HOLDING ?auto_151386 ) ( CLEAR ?auto_151388 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_151390 ?auto_151393 ?auto_151387 ?auto_151392 ?auto_151391 ?auto_151388 ?auto_151386 )
      ( MAKE-2PILE ?auto_151385 ?auto_151386 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_151394 - BLOCK
      ?auto_151395 - BLOCK
    )
    :vars
    (
      ?auto_151397 - BLOCK
      ?auto_151399 - BLOCK
      ?auto_151396 - BLOCK
      ?auto_151398 - BLOCK
      ?auto_151402 - BLOCK
      ?auto_151400 - BLOCK
      ?auto_151401 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151394 ?auto_151395 ) ) ( not ( = ?auto_151394 ?auto_151397 ) ) ( not ( = ?auto_151395 ?auto_151397 ) ) ( ON-TABLE ?auto_151399 ) ( ON ?auto_151396 ?auto_151399 ) ( ON ?auto_151398 ?auto_151396 ) ( ON ?auto_151402 ?auto_151398 ) ( ON ?auto_151400 ?auto_151402 ) ( ON ?auto_151397 ?auto_151400 ) ( not ( = ?auto_151399 ?auto_151396 ) ) ( not ( = ?auto_151399 ?auto_151398 ) ) ( not ( = ?auto_151399 ?auto_151402 ) ) ( not ( = ?auto_151399 ?auto_151400 ) ) ( not ( = ?auto_151399 ?auto_151397 ) ) ( not ( = ?auto_151399 ?auto_151395 ) ) ( not ( = ?auto_151399 ?auto_151394 ) ) ( not ( = ?auto_151396 ?auto_151398 ) ) ( not ( = ?auto_151396 ?auto_151402 ) ) ( not ( = ?auto_151396 ?auto_151400 ) ) ( not ( = ?auto_151396 ?auto_151397 ) ) ( not ( = ?auto_151396 ?auto_151395 ) ) ( not ( = ?auto_151396 ?auto_151394 ) ) ( not ( = ?auto_151398 ?auto_151402 ) ) ( not ( = ?auto_151398 ?auto_151400 ) ) ( not ( = ?auto_151398 ?auto_151397 ) ) ( not ( = ?auto_151398 ?auto_151395 ) ) ( not ( = ?auto_151398 ?auto_151394 ) ) ( not ( = ?auto_151402 ?auto_151400 ) ) ( not ( = ?auto_151402 ?auto_151397 ) ) ( not ( = ?auto_151402 ?auto_151395 ) ) ( not ( = ?auto_151402 ?auto_151394 ) ) ( not ( = ?auto_151400 ?auto_151397 ) ) ( not ( = ?auto_151400 ?auto_151395 ) ) ( not ( = ?auto_151400 ?auto_151394 ) ) ( ON ?auto_151394 ?auto_151401 ) ( not ( = ?auto_151394 ?auto_151401 ) ) ( not ( = ?auto_151395 ?auto_151401 ) ) ( not ( = ?auto_151397 ?auto_151401 ) ) ( not ( = ?auto_151399 ?auto_151401 ) ) ( not ( = ?auto_151396 ?auto_151401 ) ) ( not ( = ?auto_151398 ?auto_151401 ) ) ( not ( = ?auto_151402 ?auto_151401 ) ) ( not ( = ?auto_151400 ?auto_151401 ) ) ( CLEAR ?auto_151397 ) ( ON ?auto_151395 ?auto_151394 ) ( CLEAR ?auto_151395 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_151401 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_151401 ?auto_151394 )
      ( MAKE-2PILE ?auto_151394 ?auto_151395 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_151403 - BLOCK
      ?auto_151404 - BLOCK
    )
    :vars
    (
      ?auto_151407 - BLOCK
      ?auto_151409 - BLOCK
      ?auto_151406 - BLOCK
      ?auto_151410 - BLOCK
      ?auto_151408 - BLOCK
      ?auto_151405 - BLOCK
      ?auto_151411 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151403 ?auto_151404 ) ) ( not ( = ?auto_151403 ?auto_151407 ) ) ( not ( = ?auto_151404 ?auto_151407 ) ) ( ON-TABLE ?auto_151409 ) ( ON ?auto_151406 ?auto_151409 ) ( ON ?auto_151410 ?auto_151406 ) ( ON ?auto_151408 ?auto_151410 ) ( ON ?auto_151405 ?auto_151408 ) ( not ( = ?auto_151409 ?auto_151406 ) ) ( not ( = ?auto_151409 ?auto_151410 ) ) ( not ( = ?auto_151409 ?auto_151408 ) ) ( not ( = ?auto_151409 ?auto_151405 ) ) ( not ( = ?auto_151409 ?auto_151407 ) ) ( not ( = ?auto_151409 ?auto_151404 ) ) ( not ( = ?auto_151409 ?auto_151403 ) ) ( not ( = ?auto_151406 ?auto_151410 ) ) ( not ( = ?auto_151406 ?auto_151408 ) ) ( not ( = ?auto_151406 ?auto_151405 ) ) ( not ( = ?auto_151406 ?auto_151407 ) ) ( not ( = ?auto_151406 ?auto_151404 ) ) ( not ( = ?auto_151406 ?auto_151403 ) ) ( not ( = ?auto_151410 ?auto_151408 ) ) ( not ( = ?auto_151410 ?auto_151405 ) ) ( not ( = ?auto_151410 ?auto_151407 ) ) ( not ( = ?auto_151410 ?auto_151404 ) ) ( not ( = ?auto_151410 ?auto_151403 ) ) ( not ( = ?auto_151408 ?auto_151405 ) ) ( not ( = ?auto_151408 ?auto_151407 ) ) ( not ( = ?auto_151408 ?auto_151404 ) ) ( not ( = ?auto_151408 ?auto_151403 ) ) ( not ( = ?auto_151405 ?auto_151407 ) ) ( not ( = ?auto_151405 ?auto_151404 ) ) ( not ( = ?auto_151405 ?auto_151403 ) ) ( ON ?auto_151403 ?auto_151411 ) ( not ( = ?auto_151403 ?auto_151411 ) ) ( not ( = ?auto_151404 ?auto_151411 ) ) ( not ( = ?auto_151407 ?auto_151411 ) ) ( not ( = ?auto_151409 ?auto_151411 ) ) ( not ( = ?auto_151406 ?auto_151411 ) ) ( not ( = ?auto_151410 ?auto_151411 ) ) ( not ( = ?auto_151408 ?auto_151411 ) ) ( not ( = ?auto_151405 ?auto_151411 ) ) ( ON ?auto_151404 ?auto_151403 ) ( CLEAR ?auto_151404 ) ( ON-TABLE ?auto_151411 ) ( HOLDING ?auto_151407 ) ( CLEAR ?auto_151405 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_151409 ?auto_151406 ?auto_151410 ?auto_151408 ?auto_151405 ?auto_151407 )
      ( MAKE-2PILE ?auto_151403 ?auto_151404 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_151412 - BLOCK
      ?auto_151413 - BLOCK
    )
    :vars
    (
      ?auto_151418 - BLOCK
      ?auto_151414 - BLOCK
      ?auto_151419 - BLOCK
      ?auto_151420 - BLOCK
      ?auto_151417 - BLOCK
      ?auto_151415 - BLOCK
      ?auto_151416 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151412 ?auto_151413 ) ) ( not ( = ?auto_151412 ?auto_151418 ) ) ( not ( = ?auto_151413 ?auto_151418 ) ) ( ON-TABLE ?auto_151414 ) ( ON ?auto_151419 ?auto_151414 ) ( ON ?auto_151420 ?auto_151419 ) ( ON ?auto_151417 ?auto_151420 ) ( ON ?auto_151415 ?auto_151417 ) ( not ( = ?auto_151414 ?auto_151419 ) ) ( not ( = ?auto_151414 ?auto_151420 ) ) ( not ( = ?auto_151414 ?auto_151417 ) ) ( not ( = ?auto_151414 ?auto_151415 ) ) ( not ( = ?auto_151414 ?auto_151418 ) ) ( not ( = ?auto_151414 ?auto_151413 ) ) ( not ( = ?auto_151414 ?auto_151412 ) ) ( not ( = ?auto_151419 ?auto_151420 ) ) ( not ( = ?auto_151419 ?auto_151417 ) ) ( not ( = ?auto_151419 ?auto_151415 ) ) ( not ( = ?auto_151419 ?auto_151418 ) ) ( not ( = ?auto_151419 ?auto_151413 ) ) ( not ( = ?auto_151419 ?auto_151412 ) ) ( not ( = ?auto_151420 ?auto_151417 ) ) ( not ( = ?auto_151420 ?auto_151415 ) ) ( not ( = ?auto_151420 ?auto_151418 ) ) ( not ( = ?auto_151420 ?auto_151413 ) ) ( not ( = ?auto_151420 ?auto_151412 ) ) ( not ( = ?auto_151417 ?auto_151415 ) ) ( not ( = ?auto_151417 ?auto_151418 ) ) ( not ( = ?auto_151417 ?auto_151413 ) ) ( not ( = ?auto_151417 ?auto_151412 ) ) ( not ( = ?auto_151415 ?auto_151418 ) ) ( not ( = ?auto_151415 ?auto_151413 ) ) ( not ( = ?auto_151415 ?auto_151412 ) ) ( ON ?auto_151412 ?auto_151416 ) ( not ( = ?auto_151412 ?auto_151416 ) ) ( not ( = ?auto_151413 ?auto_151416 ) ) ( not ( = ?auto_151418 ?auto_151416 ) ) ( not ( = ?auto_151414 ?auto_151416 ) ) ( not ( = ?auto_151419 ?auto_151416 ) ) ( not ( = ?auto_151420 ?auto_151416 ) ) ( not ( = ?auto_151417 ?auto_151416 ) ) ( not ( = ?auto_151415 ?auto_151416 ) ) ( ON ?auto_151413 ?auto_151412 ) ( ON-TABLE ?auto_151416 ) ( CLEAR ?auto_151415 ) ( ON ?auto_151418 ?auto_151413 ) ( CLEAR ?auto_151418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_151416 ?auto_151412 ?auto_151413 )
      ( MAKE-2PILE ?auto_151412 ?auto_151413 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_151421 - BLOCK
      ?auto_151422 - BLOCK
    )
    :vars
    (
      ?auto_151429 - BLOCK
      ?auto_151427 - BLOCK
      ?auto_151424 - BLOCK
      ?auto_151428 - BLOCK
      ?auto_151426 - BLOCK
      ?auto_151425 - BLOCK
      ?auto_151423 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151421 ?auto_151422 ) ) ( not ( = ?auto_151421 ?auto_151429 ) ) ( not ( = ?auto_151422 ?auto_151429 ) ) ( ON-TABLE ?auto_151427 ) ( ON ?auto_151424 ?auto_151427 ) ( ON ?auto_151428 ?auto_151424 ) ( ON ?auto_151426 ?auto_151428 ) ( not ( = ?auto_151427 ?auto_151424 ) ) ( not ( = ?auto_151427 ?auto_151428 ) ) ( not ( = ?auto_151427 ?auto_151426 ) ) ( not ( = ?auto_151427 ?auto_151425 ) ) ( not ( = ?auto_151427 ?auto_151429 ) ) ( not ( = ?auto_151427 ?auto_151422 ) ) ( not ( = ?auto_151427 ?auto_151421 ) ) ( not ( = ?auto_151424 ?auto_151428 ) ) ( not ( = ?auto_151424 ?auto_151426 ) ) ( not ( = ?auto_151424 ?auto_151425 ) ) ( not ( = ?auto_151424 ?auto_151429 ) ) ( not ( = ?auto_151424 ?auto_151422 ) ) ( not ( = ?auto_151424 ?auto_151421 ) ) ( not ( = ?auto_151428 ?auto_151426 ) ) ( not ( = ?auto_151428 ?auto_151425 ) ) ( not ( = ?auto_151428 ?auto_151429 ) ) ( not ( = ?auto_151428 ?auto_151422 ) ) ( not ( = ?auto_151428 ?auto_151421 ) ) ( not ( = ?auto_151426 ?auto_151425 ) ) ( not ( = ?auto_151426 ?auto_151429 ) ) ( not ( = ?auto_151426 ?auto_151422 ) ) ( not ( = ?auto_151426 ?auto_151421 ) ) ( not ( = ?auto_151425 ?auto_151429 ) ) ( not ( = ?auto_151425 ?auto_151422 ) ) ( not ( = ?auto_151425 ?auto_151421 ) ) ( ON ?auto_151421 ?auto_151423 ) ( not ( = ?auto_151421 ?auto_151423 ) ) ( not ( = ?auto_151422 ?auto_151423 ) ) ( not ( = ?auto_151429 ?auto_151423 ) ) ( not ( = ?auto_151427 ?auto_151423 ) ) ( not ( = ?auto_151424 ?auto_151423 ) ) ( not ( = ?auto_151428 ?auto_151423 ) ) ( not ( = ?auto_151426 ?auto_151423 ) ) ( not ( = ?auto_151425 ?auto_151423 ) ) ( ON ?auto_151422 ?auto_151421 ) ( ON-TABLE ?auto_151423 ) ( ON ?auto_151429 ?auto_151422 ) ( CLEAR ?auto_151429 ) ( HOLDING ?auto_151425 ) ( CLEAR ?auto_151426 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_151427 ?auto_151424 ?auto_151428 ?auto_151426 ?auto_151425 )
      ( MAKE-2PILE ?auto_151421 ?auto_151422 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_151430 - BLOCK
      ?auto_151431 - BLOCK
    )
    :vars
    (
      ?auto_151434 - BLOCK
      ?auto_151437 - BLOCK
      ?auto_151432 - BLOCK
      ?auto_151438 - BLOCK
      ?auto_151433 - BLOCK
      ?auto_151435 - BLOCK
      ?auto_151436 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151430 ?auto_151431 ) ) ( not ( = ?auto_151430 ?auto_151434 ) ) ( not ( = ?auto_151431 ?auto_151434 ) ) ( ON-TABLE ?auto_151437 ) ( ON ?auto_151432 ?auto_151437 ) ( ON ?auto_151438 ?auto_151432 ) ( ON ?auto_151433 ?auto_151438 ) ( not ( = ?auto_151437 ?auto_151432 ) ) ( not ( = ?auto_151437 ?auto_151438 ) ) ( not ( = ?auto_151437 ?auto_151433 ) ) ( not ( = ?auto_151437 ?auto_151435 ) ) ( not ( = ?auto_151437 ?auto_151434 ) ) ( not ( = ?auto_151437 ?auto_151431 ) ) ( not ( = ?auto_151437 ?auto_151430 ) ) ( not ( = ?auto_151432 ?auto_151438 ) ) ( not ( = ?auto_151432 ?auto_151433 ) ) ( not ( = ?auto_151432 ?auto_151435 ) ) ( not ( = ?auto_151432 ?auto_151434 ) ) ( not ( = ?auto_151432 ?auto_151431 ) ) ( not ( = ?auto_151432 ?auto_151430 ) ) ( not ( = ?auto_151438 ?auto_151433 ) ) ( not ( = ?auto_151438 ?auto_151435 ) ) ( not ( = ?auto_151438 ?auto_151434 ) ) ( not ( = ?auto_151438 ?auto_151431 ) ) ( not ( = ?auto_151438 ?auto_151430 ) ) ( not ( = ?auto_151433 ?auto_151435 ) ) ( not ( = ?auto_151433 ?auto_151434 ) ) ( not ( = ?auto_151433 ?auto_151431 ) ) ( not ( = ?auto_151433 ?auto_151430 ) ) ( not ( = ?auto_151435 ?auto_151434 ) ) ( not ( = ?auto_151435 ?auto_151431 ) ) ( not ( = ?auto_151435 ?auto_151430 ) ) ( ON ?auto_151430 ?auto_151436 ) ( not ( = ?auto_151430 ?auto_151436 ) ) ( not ( = ?auto_151431 ?auto_151436 ) ) ( not ( = ?auto_151434 ?auto_151436 ) ) ( not ( = ?auto_151437 ?auto_151436 ) ) ( not ( = ?auto_151432 ?auto_151436 ) ) ( not ( = ?auto_151438 ?auto_151436 ) ) ( not ( = ?auto_151433 ?auto_151436 ) ) ( not ( = ?auto_151435 ?auto_151436 ) ) ( ON ?auto_151431 ?auto_151430 ) ( ON-TABLE ?auto_151436 ) ( ON ?auto_151434 ?auto_151431 ) ( CLEAR ?auto_151433 ) ( ON ?auto_151435 ?auto_151434 ) ( CLEAR ?auto_151435 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_151436 ?auto_151430 ?auto_151431 ?auto_151434 )
      ( MAKE-2PILE ?auto_151430 ?auto_151431 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_151439 - BLOCK
      ?auto_151440 - BLOCK
    )
    :vars
    (
      ?auto_151441 - BLOCK
      ?auto_151444 - BLOCK
      ?auto_151447 - BLOCK
      ?auto_151442 - BLOCK
      ?auto_151446 - BLOCK
      ?auto_151443 - BLOCK
      ?auto_151445 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151439 ?auto_151440 ) ) ( not ( = ?auto_151439 ?auto_151441 ) ) ( not ( = ?auto_151440 ?auto_151441 ) ) ( ON-TABLE ?auto_151444 ) ( ON ?auto_151447 ?auto_151444 ) ( ON ?auto_151442 ?auto_151447 ) ( not ( = ?auto_151444 ?auto_151447 ) ) ( not ( = ?auto_151444 ?auto_151442 ) ) ( not ( = ?auto_151444 ?auto_151446 ) ) ( not ( = ?auto_151444 ?auto_151443 ) ) ( not ( = ?auto_151444 ?auto_151441 ) ) ( not ( = ?auto_151444 ?auto_151440 ) ) ( not ( = ?auto_151444 ?auto_151439 ) ) ( not ( = ?auto_151447 ?auto_151442 ) ) ( not ( = ?auto_151447 ?auto_151446 ) ) ( not ( = ?auto_151447 ?auto_151443 ) ) ( not ( = ?auto_151447 ?auto_151441 ) ) ( not ( = ?auto_151447 ?auto_151440 ) ) ( not ( = ?auto_151447 ?auto_151439 ) ) ( not ( = ?auto_151442 ?auto_151446 ) ) ( not ( = ?auto_151442 ?auto_151443 ) ) ( not ( = ?auto_151442 ?auto_151441 ) ) ( not ( = ?auto_151442 ?auto_151440 ) ) ( not ( = ?auto_151442 ?auto_151439 ) ) ( not ( = ?auto_151446 ?auto_151443 ) ) ( not ( = ?auto_151446 ?auto_151441 ) ) ( not ( = ?auto_151446 ?auto_151440 ) ) ( not ( = ?auto_151446 ?auto_151439 ) ) ( not ( = ?auto_151443 ?auto_151441 ) ) ( not ( = ?auto_151443 ?auto_151440 ) ) ( not ( = ?auto_151443 ?auto_151439 ) ) ( ON ?auto_151439 ?auto_151445 ) ( not ( = ?auto_151439 ?auto_151445 ) ) ( not ( = ?auto_151440 ?auto_151445 ) ) ( not ( = ?auto_151441 ?auto_151445 ) ) ( not ( = ?auto_151444 ?auto_151445 ) ) ( not ( = ?auto_151447 ?auto_151445 ) ) ( not ( = ?auto_151442 ?auto_151445 ) ) ( not ( = ?auto_151446 ?auto_151445 ) ) ( not ( = ?auto_151443 ?auto_151445 ) ) ( ON ?auto_151440 ?auto_151439 ) ( ON-TABLE ?auto_151445 ) ( ON ?auto_151441 ?auto_151440 ) ( ON ?auto_151443 ?auto_151441 ) ( CLEAR ?auto_151443 ) ( HOLDING ?auto_151446 ) ( CLEAR ?auto_151442 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_151444 ?auto_151447 ?auto_151442 ?auto_151446 )
      ( MAKE-2PILE ?auto_151439 ?auto_151440 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_151448 - BLOCK
      ?auto_151449 - BLOCK
    )
    :vars
    (
      ?auto_151456 - BLOCK
      ?auto_151455 - BLOCK
      ?auto_151453 - BLOCK
      ?auto_151451 - BLOCK
      ?auto_151452 - BLOCK
      ?auto_151454 - BLOCK
      ?auto_151450 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151448 ?auto_151449 ) ) ( not ( = ?auto_151448 ?auto_151456 ) ) ( not ( = ?auto_151449 ?auto_151456 ) ) ( ON-TABLE ?auto_151455 ) ( ON ?auto_151453 ?auto_151455 ) ( ON ?auto_151451 ?auto_151453 ) ( not ( = ?auto_151455 ?auto_151453 ) ) ( not ( = ?auto_151455 ?auto_151451 ) ) ( not ( = ?auto_151455 ?auto_151452 ) ) ( not ( = ?auto_151455 ?auto_151454 ) ) ( not ( = ?auto_151455 ?auto_151456 ) ) ( not ( = ?auto_151455 ?auto_151449 ) ) ( not ( = ?auto_151455 ?auto_151448 ) ) ( not ( = ?auto_151453 ?auto_151451 ) ) ( not ( = ?auto_151453 ?auto_151452 ) ) ( not ( = ?auto_151453 ?auto_151454 ) ) ( not ( = ?auto_151453 ?auto_151456 ) ) ( not ( = ?auto_151453 ?auto_151449 ) ) ( not ( = ?auto_151453 ?auto_151448 ) ) ( not ( = ?auto_151451 ?auto_151452 ) ) ( not ( = ?auto_151451 ?auto_151454 ) ) ( not ( = ?auto_151451 ?auto_151456 ) ) ( not ( = ?auto_151451 ?auto_151449 ) ) ( not ( = ?auto_151451 ?auto_151448 ) ) ( not ( = ?auto_151452 ?auto_151454 ) ) ( not ( = ?auto_151452 ?auto_151456 ) ) ( not ( = ?auto_151452 ?auto_151449 ) ) ( not ( = ?auto_151452 ?auto_151448 ) ) ( not ( = ?auto_151454 ?auto_151456 ) ) ( not ( = ?auto_151454 ?auto_151449 ) ) ( not ( = ?auto_151454 ?auto_151448 ) ) ( ON ?auto_151448 ?auto_151450 ) ( not ( = ?auto_151448 ?auto_151450 ) ) ( not ( = ?auto_151449 ?auto_151450 ) ) ( not ( = ?auto_151456 ?auto_151450 ) ) ( not ( = ?auto_151455 ?auto_151450 ) ) ( not ( = ?auto_151453 ?auto_151450 ) ) ( not ( = ?auto_151451 ?auto_151450 ) ) ( not ( = ?auto_151452 ?auto_151450 ) ) ( not ( = ?auto_151454 ?auto_151450 ) ) ( ON ?auto_151449 ?auto_151448 ) ( ON-TABLE ?auto_151450 ) ( ON ?auto_151456 ?auto_151449 ) ( ON ?auto_151454 ?auto_151456 ) ( CLEAR ?auto_151451 ) ( ON ?auto_151452 ?auto_151454 ) ( CLEAR ?auto_151452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_151450 ?auto_151448 ?auto_151449 ?auto_151456 ?auto_151454 )
      ( MAKE-2PILE ?auto_151448 ?auto_151449 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_151457 - BLOCK
      ?auto_151458 - BLOCK
    )
    :vars
    (
      ?auto_151461 - BLOCK
      ?auto_151464 - BLOCK
      ?auto_151462 - BLOCK
      ?auto_151460 - BLOCK
      ?auto_151465 - BLOCK
      ?auto_151459 - BLOCK
      ?auto_151463 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151457 ?auto_151458 ) ) ( not ( = ?auto_151457 ?auto_151461 ) ) ( not ( = ?auto_151458 ?auto_151461 ) ) ( ON-TABLE ?auto_151464 ) ( ON ?auto_151462 ?auto_151464 ) ( not ( = ?auto_151464 ?auto_151462 ) ) ( not ( = ?auto_151464 ?auto_151460 ) ) ( not ( = ?auto_151464 ?auto_151465 ) ) ( not ( = ?auto_151464 ?auto_151459 ) ) ( not ( = ?auto_151464 ?auto_151461 ) ) ( not ( = ?auto_151464 ?auto_151458 ) ) ( not ( = ?auto_151464 ?auto_151457 ) ) ( not ( = ?auto_151462 ?auto_151460 ) ) ( not ( = ?auto_151462 ?auto_151465 ) ) ( not ( = ?auto_151462 ?auto_151459 ) ) ( not ( = ?auto_151462 ?auto_151461 ) ) ( not ( = ?auto_151462 ?auto_151458 ) ) ( not ( = ?auto_151462 ?auto_151457 ) ) ( not ( = ?auto_151460 ?auto_151465 ) ) ( not ( = ?auto_151460 ?auto_151459 ) ) ( not ( = ?auto_151460 ?auto_151461 ) ) ( not ( = ?auto_151460 ?auto_151458 ) ) ( not ( = ?auto_151460 ?auto_151457 ) ) ( not ( = ?auto_151465 ?auto_151459 ) ) ( not ( = ?auto_151465 ?auto_151461 ) ) ( not ( = ?auto_151465 ?auto_151458 ) ) ( not ( = ?auto_151465 ?auto_151457 ) ) ( not ( = ?auto_151459 ?auto_151461 ) ) ( not ( = ?auto_151459 ?auto_151458 ) ) ( not ( = ?auto_151459 ?auto_151457 ) ) ( ON ?auto_151457 ?auto_151463 ) ( not ( = ?auto_151457 ?auto_151463 ) ) ( not ( = ?auto_151458 ?auto_151463 ) ) ( not ( = ?auto_151461 ?auto_151463 ) ) ( not ( = ?auto_151464 ?auto_151463 ) ) ( not ( = ?auto_151462 ?auto_151463 ) ) ( not ( = ?auto_151460 ?auto_151463 ) ) ( not ( = ?auto_151465 ?auto_151463 ) ) ( not ( = ?auto_151459 ?auto_151463 ) ) ( ON ?auto_151458 ?auto_151457 ) ( ON-TABLE ?auto_151463 ) ( ON ?auto_151461 ?auto_151458 ) ( ON ?auto_151459 ?auto_151461 ) ( ON ?auto_151465 ?auto_151459 ) ( CLEAR ?auto_151465 ) ( HOLDING ?auto_151460 ) ( CLEAR ?auto_151462 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_151464 ?auto_151462 ?auto_151460 )
      ( MAKE-2PILE ?auto_151457 ?auto_151458 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_151466 - BLOCK
      ?auto_151467 - BLOCK
    )
    :vars
    (
      ?auto_151471 - BLOCK
      ?auto_151470 - BLOCK
      ?auto_151474 - BLOCK
      ?auto_151469 - BLOCK
      ?auto_151468 - BLOCK
      ?auto_151472 - BLOCK
      ?auto_151473 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151466 ?auto_151467 ) ) ( not ( = ?auto_151466 ?auto_151471 ) ) ( not ( = ?auto_151467 ?auto_151471 ) ) ( ON-TABLE ?auto_151470 ) ( ON ?auto_151474 ?auto_151470 ) ( not ( = ?auto_151470 ?auto_151474 ) ) ( not ( = ?auto_151470 ?auto_151469 ) ) ( not ( = ?auto_151470 ?auto_151468 ) ) ( not ( = ?auto_151470 ?auto_151472 ) ) ( not ( = ?auto_151470 ?auto_151471 ) ) ( not ( = ?auto_151470 ?auto_151467 ) ) ( not ( = ?auto_151470 ?auto_151466 ) ) ( not ( = ?auto_151474 ?auto_151469 ) ) ( not ( = ?auto_151474 ?auto_151468 ) ) ( not ( = ?auto_151474 ?auto_151472 ) ) ( not ( = ?auto_151474 ?auto_151471 ) ) ( not ( = ?auto_151474 ?auto_151467 ) ) ( not ( = ?auto_151474 ?auto_151466 ) ) ( not ( = ?auto_151469 ?auto_151468 ) ) ( not ( = ?auto_151469 ?auto_151472 ) ) ( not ( = ?auto_151469 ?auto_151471 ) ) ( not ( = ?auto_151469 ?auto_151467 ) ) ( not ( = ?auto_151469 ?auto_151466 ) ) ( not ( = ?auto_151468 ?auto_151472 ) ) ( not ( = ?auto_151468 ?auto_151471 ) ) ( not ( = ?auto_151468 ?auto_151467 ) ) ( not ( = ?auto_151468 ?auto_151466 ) ) ( not ( = ?auto_151472 ?auto_151471 ) ) ( not ( = ?auto_151472 ?auto_151467 ) ) ( not ( = ?auto_151472 ?auto_151466 ) ) ( ON ?auto_151466 ?auto_151473 ) ( not ( = ?auto_151466 ?auto_151473 ) ) ( not ( = ?auto_151467 ?auto_151473 ) ) ( not ( = ?auto_151471 ?auto_151473 ) ) ( not ( = ?auto_151470 ?auto_151473 ) ) ( not ( = ?auto_151474 ?auto_151473 ) ) ( not ( = ?auto_151469 ?auto_151473 ) ) ( not ( = ?auto_151468 ?auto_151473 ) ) ( not ( = ?auto_151472 ?auto_151473 ) ) ( ON ?auto_151467 ?auto_151466 ) ( ON-TABLE ?auto_151473 ) ( ON ?auto_151471 ?auto_151467 ) ( ON ?auto_151472 ?auto_151471 ) ( ON ?auto_151468 ?auto_151472 ) ( CLEAR ?auto_151474 ) ( ON ?auto_151469 ?auto_151468 ) ( CLEAR ?auto_151469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_151473 ?auto_151466 ?auto_151467 ?auto_151471 ?auto_151472 ?auto_151468 )
      ( MAKE-2PILE ?auto_151466 ?auto_151467 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_151475 - BLOCK
      ?auto_151476 - BLOCK
    )
    :vars
    (
      ?auto_151478 - BLOCK
      ?auto_151482 - BLOCK
      ?auto_151477 - BLOCK
      ?auto_151480 - BLOCK
      ?auto_151483 - BLOCK
      ?auto_151481 - BLOCK
      ?auto_151479 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151475 ?auto_151476 ) ) ( not ( = ?auto_151475 ?auto_151478 ) ) ( not ( = ?auto_151476 ?auto_151478 ) ) ( ON-TABLE ?auto_151482 ) ( not ( = ?auto_151482 ?auto_151477 ) ) ( not ( = ?auto_151482 ?auto_151480 ) ) ( not ( = ?auto_151482 ?auto_151483 ) ) ( not ( = ?auto_151482 ?auto_151481 ) ) ( not ( = ?auto_151482 ?auto_151478 ) ) ( not ( = ?auto_151482 ?auto_151476 ) ) ( not ( = ?auto_151482 ?auto_151475 ) ) ( not ( = ?auto_151477 ?auto_151480 ) ) ( not ( = ?auto_151477 ?auto_151483 ) ) ( not ( = ?auto_151477 ?auto_151481 ) ) ( not ( = ?auto_151477 ?auto_151478 ) ) ( not ( = ?auto_151477 ?auto_151476 ) ) ( not ( = ?auto_151477 ?auto_151475 ) ) ( not ( = ?auto_151480 ?auto_151483 ) ) ( not ( = ?auto_151480 ?auto_151481 ) ) ( not ( = ?auto_151480 ?auto_151478 ) ) ( not ( = ?auto_151480 ?auto_151476 ) ) ( not ( = ?auto_151480 ?auto_151475 ) ) ( not ( = ?auto_151483 ?auto_151481 ) ) ( not ( = ?auto_151483 ?auto_151478 ) ) ( not ( = ?auto_151483 ?auto_151476 ) ) ( not ( = ?auto_151483 ?auto_151475 ) ) ( not ( = ?auto_151481 ?auto_151478 ) ) ( not ( = ?auto_151481 ?auto_151476 ) ) ( not ( = ?auto_151481 ?auto_151475 ) ) ( ON ?auto_151475 ?auto_151479 ) ( not ( = ?auto_151475 ?auto_151479 ) ) ( not ( = ?auto_151476 ?auto_151479 ) ) ( not ( = ?auto_151478 ?auto_151479 ) ) ( not ( = ?auto_151482 ?auto_151479 ) ) ( not ( = ?auto_151477 ?auto_151479 ) ) ( not ( = ?auto_151480 ?auto_151479 ) ) ( not ( = ?auto_151483 ?auto_151479 ) ) ( not ( = ?auto_151481 ?auto_151479 ) ) ( ON ?auto_151476 ?auto_151475 ) ( ON-TABLE ?auto_151479 ) ( ON ?auto_151478 ?auto_151476 ) ( ON ?auto_151481 ?auto_151478 ) ( ON ?auto_151483 ?auto_151481 ) ( ON ?auto_151480 ?auto_151483 ) ( CLEAR ?auto_151480 ) ( HOLDING ?auto_151477 ) ( CLEAR ?auto_151482 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_151482 ?auto_151477 )
      ( MAKE-2PILE ?auto_151475 ?auto_151476 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_151484 - BLOCK
      ?auto_151485 - BLOCK
    )
    :vars
    (
      ?auto_151486 - BLOCK
      ?auto_151489 - BLOCK
      ?auto_151492 - BLOCK
      ?auto_151491 - BLOCK
      ?auto_151488 - BLOCK
      ?auto_151490 - BLOCK
      ?auto_151487 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151484 ?auto_151485 ) ) ( not ( = ?auto_151484 ?auto_151486 ) ) ( not ( = ?auto_151485 ?auto_151486 ) ) ( ON-TABLE ?auto_151489 ) ( not ( = ?auto_151489 ?auto_151492 ) ) ( not ( = ?auto_151489 ?auto_151491 ) ) ( not ( = ?auto_151489 ?auto_151488 ) ) ( not ( = ?auto_151489 ?auto_151490 ) ) ( not ( = ?auto_151489 ?auto_151486 ) ) ( not ( = ?auto_151489 ?auto_151485 ) ) ( not ( = ?auto_151489 ?auto_151484 ) ) ( not ( = ?auto_151492 ?auto_151491 ) ) ( not ( = ?auto_151492 ?auto_151488 ) ) ( not ( = ?auto_151492 ?auto_151490 ) ) ( not ( = ?auto_151492 ?auto_151486 ) ) ( not ( = ?auto_151492 ?auto_151485 ) ) ( not ( = ?auto_151492 ?auto_151484 ) ) ( not ( = ?auto_151491 ?auto_151488 ) ) ( not ( = ?auto_151491 ?auto_151490 ) ) ( not ( = ?auto_151491 ?auto_151486 ) ) ( not ( = ?auto_151491 ?auto_151485 ) ) ( not ( = ?auto_151491 ?auto_151484 ) ) ( not ( = ?auto_151488 ?auto_151490 ) ) ( not ( = ?auto_151488 ?auto_151486 ) ) ( not ( = ?auto_151488 ?auto_151485 ) ) ( not ( = ?auto_151488 ?auto_151484 ) ) ( not ( = ?auto_151490 ?auto_151486 ) ) ( not ( = ?auto_151490 ?auto_151485 ) ) ( not ( = ?auto_151490 ?auto_151484 ) ) ( ON ?auto_151484 ?auto_151487 ) ( not ( = ?auto_151484 ?auto_151487 ) ) ( not ( = ?auto_151485 ?auto_151487 ) ) ( not ( = ?auto_151486 ?auto_151487 ) ) ( not ( = ?auto_151489 ?auto_151487 ) ) ( not ( = ?auto_151492 ?auto_151487 ) ) ( not ( = ?auto_151491 ?auto_151487 ) ) ( not ( = ?auto_151488 ?auto_151487 ) ) ( not ( = ?auto_151490 ?auto_151487 ) ) ( ON ?auto_151485 ?auto_151484 ) ( ON-TABLE ?auto_151487 ) ( ON ?auto_151486 ?auto_151485 ) ( ON ?auto_151490 ?auto_151486 ) ( ON ?auto_151488 ?auto_151490 ) ( ON ?auto_151491 ?auto_151488 ) ( CLEAR ?auto_151489 ) ( ON ?auto_151492 ?auto_151491 ) ( CLEAR ?auto_151492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_151487 ?auto_151484 ?auto_151485 ?auto_151486 ?auto_151490 ?auto_151488 ?auto_151491 )
      ( MAKE-2PILE ?auto_151484 ?auto_151485 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_151493 - BLOCK
      ?auto_151494 - BLOCK
    )
    :vars
    (
      ?auto_151497 - BLOCK
      ?auto_151496 - BLOCK
      ?auto_151499 - BLOCK
      ?auto_151498 - BLOCK
      ?auto_151500 - BLOCK
      ?auto_151495 - BLOCK
      ?auto_151501 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151493 ?auto_151494 ) ) ( not ( = ?auto_151493 ?auto_151497 ) ) ( not ( = ?auto_151494 ?auto_151497 ) ) ( not ( = ?auto_151496 ?auto_151499 ) ) ( not ( = ?auto_151496 ?auto_151498 ) ) ( not ( = ?auto_151496 ?auto_151500 ) ) ( not ( = ?auto_151496 ?auto_151495 ) ) ( not ( = ?auto_151496 ?auto_151497 ) ) ( not ( = ?auto_151496 ?auto_151494 ) ) ( not ( = ?auto_151496 ?auto_151493 ) ) ( not ( = ?auto_151499 ?auto_151498 ) ) ( not ( = ?auto_151499 ?auto_151500 ) ) ( not ( = ?auto_151499 ?auto_151495 ) ) ( not ( = ?auto_151499 ?auto_151497 ) ) ( not ( = ?auto_151499 ?auto_151494 ) ) ( not ( = ?auto_151499 ?auto_151493 ) ) ( not ( = ?auto_151498 ?auto_151500 ) ) ( not ( = ?auto_151498 ?auto_151495 ) ) ( not ( = ?auto_151498 ?auto_151497 ) ) ( not ( = ?auto_151498 ?auto_151494 ) ) ( not ( = ?auto_151498 ?auto_151493 ) ) ( not ( = ?auto_151500 ?auto_151495 ) ) ( not ( = ?auto_151500 ?auto_151497 ) ) ( not ( = ?auto_151500 ?auto_151494 ) ) ( not ( = ?auto_151500 ?auto_151493 ) ) ( not ( = ?auto_151495 ?auto_151497 ) ) ( not ( = ?auto_151495 ?auto_151494 ) ) ( not ( = ?auto_151495 ?auto_151493 ) ) ( ON ?auto_151493 ?auto_151501 ) ( not ( = ?auto_151493 ?auto_151501 ) ) ( not ( = ?auto_151494 ?auto_151501 ) ) ( not ( = ?auto_151497 ?auto_151501 ) ) ( not ( = ?auto_151496 ?auto_151501 ) ) ( not ( = ?auto_151499 ?auto_151501 ) ) ( not ( = ?auto_151498 ?auto_151501 ) ) ( not ( = ?auto_151500 ?auto_151501 ) ) ( not ( = ?auto_151495 ?auto_151501 ) ) ( ON ?auto_151494 ?auto_151493 ) ( ON-TABLE ?auto_151501 ) ( ON ?auto_151497 ?auto_151494 ) ( ON ?auto_151495 ?auto_151497 ) ( ON ?auto_151500 ?auto_151495 ) ( ON ?auto_151498 ?auto_151500 ) ( ON ?auto_151499 ?auto_151498 ) ( CLEAR ?auto_151499 ) ( HOLDING ?auto_151496 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_151496 )
      ( MAKE-2PILE ?auto_151493 ?auto_151494 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_151502 - BLOCK
      ?auto_151503 - BLOCK
    )
    :vars
    (
      ?auto_151507 - BLOCK
      ?auto_151509 - BLOCK
      ?auto_151508 - BLOCK
      ?auto_151506 - BLOCK
      ?auto_151505 - BLOCK
      ?auto_151504 - BLOCK
      ?auto_151510 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151502 ?auto_151503 ) ) ( not ( = ?auto_151502 ?auto_151507 ) ) ( not ( = ?auto_151503 ?auto_151507 ) ) ( not ( = ?auto_151509 ?auto_151508 ) ) ( not ( = ?auto_151509 ?auto_151506 ) ) ( not ( = ?auto_151509 ?auto_151505 ) ) ( not ( = ?auto_151509 ?auto_151504 ) ) ( not ( = ?auto_151509 ?auto_151507 ) ) ( not ( = ?auto_151509 ?auto_151503 ) ) ( not ( = ?auto_151509 ?auto_151502 ) ) ( not ( = ?auto_151508 ?auto_151506 ) ) ( not ( = ?auto_151508 ?auto_151505 ) ) ( not ( = ?auto_151508 ?auto_151504 ) ) ( not ( = ?auto_151508 ?auto_151507 ) ) ( not ( = ?auto_151508 ?auto_151503 ) ) ( not ( = ?auto_151508 ?auto_151502 ) ) ( not ( = ?auto_151506 ?auto_151505 ) ) ( not ( = ?auto_151506 ?auto_151504 ) ) ( not ( = ?auto_151506 ?auto_151507 ) ) ( not ( = ?auto_151506 ?auto_151503 ) ) ( not ( = ?auto_151506 ?auto_151502 ) ) ( not ( = ?auto_151505 ?auto_151504 ) ) ( not ( = ?auto_151505 ?auto_151507 ) ) ( not ( = ?auto_151505 ?auto_151503 ) ) ( not ( = ?auto_151505 ?auto_151502 ) ) ( not ( = ?auto_151504 ?auto_151507 ) ) ( not ( = ?auto_151504 ?auto_151503 ) ) ( not ( = ?auto_151504 ?auto_151502 ) ) ( ON ?auto_151502 ?auto_151510 ) ( not ( = ?auto_151502 ?auto_151510 ) ) ( not ( = ?auto_151503 ?auto_151510 ) ) ( not ( = ?auto_151507 ?auto_151510 ) ) ( not ( = ?auto_151509 ?auto_151510 ) ) ( not ( = ?auto_151508 ?auto_151510 ) ) ( not ( = ?auto_151506 ?auto_151510 ) ) ( not ( = ?auto_151505 ?auto_151510 ) ) ( not ( = ?auto_151504 ?auto_151510 ) ) ( ON ?auto_151503 ?auto_151502 ) ( ON-TABLE ?auto_151510 ) ( ON ?auto_151507 ?auto_151503 ) ( ON ?auto_151504 ?auto_151507 ) ( ON ?auto_151505 ?auto_151504 ) ( ON ?auto_151506 ?auto_151505 ) ( ON ?auto_151508 ?auto_151506 ) ( ON ?auto_151509 ?auto_151508 ) ( CLEAR ?auto_151509 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_151510 ?auto_151502 ?auto_151503 ?auto_151507 ?auto_151504 ?auto_151505 ?auto_151506 ?auto_151508 )
      ( MAKE-2PILE ?auto_151502 ?auto_151503 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_151516 - BLOCK
      ?auto_151517 - BLOCK
      ?auto_151518 - BLOCK
      ?auto_151519 - BLOCK
      ?auto_151520 - BLOCK
    )
    :vars
    (
      ?auto_151521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151521 ?auto_151520 ) ( CLEAR ?auto_151521 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_151516 ) ( ON ?auto_151517 ?auto_151516 ) ( ON ?auto_151518 ?auto_151517 ) ( ON ?auto_151519 ?auto_151518 ) ( ON ?auto_151520 ?auto_151519 ) ( not ( = ?auto_151516 ?auto_151517 ) ) ( not ( = ?auto_151516 ?auto_151518 ) ) ( not ( = ?auto_151516 ?auto_151519 ) ) ( not ( = ?auto_151516 ?auto_151520 ) ) ( not ( = ?auto_151516 ?auto_151521 ) ) ( not ( = ?auto_151517 ?auto_151518 ) ) ( not ( = ?auto_151517 ?auto_151519 ) ) ( not ( = ?auto_151517 ?auto_151520 ) ) ( not ( = ?auto_151517 ?auto_151521 ) ) ( not ( = ?auto_151518 ?auto_151519 ) ) ( not ( = ?auto_151518 ?auto_151520 ) ) ( not ( = ?auto_151518 ?auto_151521 ) ) ( not ( = ?auto_151519 ?auto_151520 ) ) ( not ( = ?auto_151519 ?auto_151521 ) ) ( not ( = ?auto_151520 ?auto_151521 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_151521 ?auto_151520 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_151522 - BLOCK
      ?auto_151523 - BLOCK
      ?auto_151524 - BLOCK
      ?auto_151525 - BLOCK
      ?auto_151526 - BLOCK
    )
    :vars
    (
      ?auto_151527 - BLOCK
      ?auto_151528 - BLOCK
      ?auto_151529 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151527 ?auto_151526 ) ( CLEAR ?auto_151527 ) ( ON-TABLE ?auto_151522 ) ( ON ?auto_151523 ?auto_151522 ) ( ON ?auto_151524 ?auto_151523 ) ( ON ?auto_151525 ?auto_151524 ) ( ON ?auto_151526 ?auto_151525 ) ( not ( = ?auto_151522 ?auto_151523 ) ) ( not ( = ?auto_151522 ?auto_151524 ) ) ( not ( = ?auto_151522 ?auto_151525 ) ) ( not ( = ?auto_151522 ?auto_151526 ) ) ( not ( = ?auto_151522 ?auto_151527 ) ) ( not ( = ?auto_151523 ?auto_151524 ) ) ( not ( = ?auto_151523 ?auto_151525 ) ) ( not ( = ?auto_151523 ?auto_151526 ) ) ( not ( = ?auto_151523 ?auto_151527 ) ) ( not ( = ?auto_151524 ?auto_151525 ) ) ( not ( = ?auto_151524 ?auto_151526 ) ) ( not ( = ?auto_151524 ?auto_151527 ) ) ( not ( = ?auto_151525 ?auto_151526 ) ) ( not ( = ?auto_151525 ?auto_151527 ) ) ( not ( = ?auto_151526 ?auto_151527 ) ) ( HOLDING ?auto_151528 ) ( CLEAR ?auto_151529 ) ( not ( = ?auto_151522 ?auto_151528 ) ) ( not ( = ?auto_151522 ?auto_151529 ) ) ( not ( = ?auto_151523 ?auto_151528 ) ) ( not ( = ?auto_151523 ?auto_151529 ) ) ( not ( = ?auto_151524 ?auto_151528 ) ) ( not ( = ?auto_151524 ?auto_151529 ) ) ( not ( = ?auto_151525 ?auto_151528 ) ) ( not ( = ?auto_151525 ?auto_151529 ) ) ( not ( = ?auto_151526 ?auto_151528 ) ) ( not ( = ?auto_151526 ?auto_151529 ) ) ( not ( = ?auto_151527 ?auto_151528 ) ) ( not ( = ?auto_151527 ?auto_151529 ) ) ( not ( = ?auto_151528 ?auto_151529 ) ) )
    :subtasks
    ( ( !STACK ?auto_151528 ?auto_151529 )
      ( MAKE-5PILE ?auto_151522 ?auto_151523 ?auto_151524 ?auto_151525 ?auto_151526 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_151530 - BLOCK
      ?auto_151531 - BLOCK
      ?auto_151532 - BLOCK
      ?auto_151533 - BLOCK
      ?auto_151534 - BLOCK
    )
    :vars
    (
      ?auto_151537 - BLOCK
      ?auto_151535 - BLOCK
      ?auto_151536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151537 ?auto_151534 ) ( ON-TABLE ?auto_151530 ) ( ON ?auto_151531 ?auto_151530 ) ( ON ?auto_151532 ?auto_151531 ) ( ON ?auto_151533 ?auto_151532 ) ( ON ?auto_151534 ?auto_151533 ) ( not ( = ?auto_151530 ?auto_151531 ) ) ( not ( = ?auto_151530 ?auto_151532 ) ) ( not ( = ?auto_151530 ?auto_151533 ) ) ( not ( = ?auto_151530 ?auto_151534 ) ) ( not ( = ?auto_151530 ?auto_151537 ) ) ( not ( = ?auto_151531 ?auto_151532 ) ) ( not ( = ?auto_151531 ?auto_151533 ) ) ( not ( = ?auto_151531 ?auto_151534 ) ) ( not ( = ?auto_151531 ?auto_151537 ) ) ( not ( = ?auto_151532 ?auto_151533 ) ) ( not ( = ?auto_151532 ?auto_151534 ) ) ( not ( = ?auto_151532 ?auto_151537 ) ) ( not ( = ?auto_151533 ?auto_151534 ) ) ( not ( = ?auto_151533 ?auto_151537 ) ) ( not ( = ?auto_151534 ?auto_151537 ) ) ( CLEAR ?auto_151535 ) ( not ( = ?auto_151530 ?auto_151536 ) ) ( not ( = ?auto_151530 ?auto_151535 ) ) ( not ( = ?auto_151531 ?auto_151536 ) ) ( not ( = ?auto_151531 ?auto_151535 ) ) ( not ( = ?auto_151532 ?auto_151536 ) ) ( not ( = ?auto_151532 ?auto_151535 ) ) ( not ( = ?auto_151533 ?auto_151536 ) ) ( not ( = ?auto_151533 ?auto_151535 ) ) ( not ( = ?auto_151534 ?auto_151536 ) ) ( not ( = ?auto_151534 ?auto_151535 ) ) ( not ( = ?auto_151537 ?auto_151536 ) ) ( not ( = ?auto_151537 ?auto_151535 ) ) ( not ( = ?auto_151536 ?auto_151535 ) ) ( ON ?auto_151536 ?auto_151537 ) ( CLEAR ?auto_151536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_151530 ?auto_151531 ?auto_151532 ?auto_151533 ?auto_151534 ?auto_151537 )
      ( MAKE-5PILE ?auto_151530 ?auto_151531 ?auto_151532 ?auto_151533 ?auto_151534 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_151538 - BLOCK
      ?auto_151539 - BLOCK
      ?auto_151540 - BLOCK
      ?auto_151541 - BLOCK
      ?auto_151542 - BLOCK
    )
    :vars
    (
      ?auto_151545 - BLOCK
      ?auto_151544 - BLOCK
      ?auto_151543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151545 ?auto_151542 ) ( ON-TABLE ?auto_151538 ) ( ON ?auto_151539 ?auto_151538 ) ( ON ?auto_151540 ?auto_151539 ) ( ON ?auto_151541 ?auto_151540 ) ( ON ?auto_151542 ?auto_151541 ) ( not ( = ?auto_151538 ?auto_151539 ) ) ( not ( = ?auto_151538 ?auto_151540 ) ) ( not ( = ?auto_151538 ?auto_151541 ) ) ( not ( = ?auto_151538 ?auto_151542 ) ) ( not ( = ?auto_151538 ?auto_151545 ) ) ( not ( = ?auto_151539 ?auto_151540 ) ) ( not ( = ?auto_151539 ?auto_151541 ) ) ( not ( = ?auto_151539 ?auto_151542 ) ) ( not ( = ?auto_151539 ?auto_151545 ) ) ( not ( = ?auto_151540 ?auto_151541 ) ) ( not ( = ?auto_151540 ?auto_151542 ) ) ( not ( = ?auto_151540 ?auto_151545 ) ) ( not ( = ?auto_151541 ?auto_151542 ) ) ( not ( = ?auto_151541 ?auto_151545 ) ) ( not ( = ?auto_151542 ?auto_151545 ) ) ( not ( = ?auto_151538 ?auto_151544 ) ) ( not ( = ?auto_151538 ?auto_151543 ) ) ( not ( = ?auto_151539 ?auto_151544 ) ) ( not ( = ?auto_151539 ?auto_151543 ) ) ( not ( = ?auto_151540 ?auto_151544 ) ) ( not ( = ?auto_151540 ?auto_151543 ) ) ( not ( = ?auto_151541 ?auto_151544 ) ) ( not ( = ?auto_151541 ?auto_151543 ) ) ( not ( = ?auto_151542 ?auto_151544 ) ) ( not ( = ?auto_151542 ?auto_151543 ) ) ( not ( = ?auto_151545 ?auto_151544 ) ) ( not ( = ?auto_151545 ?auto_151543 ) ) ( not ( = ?auto_151544 ?auto_151543 ) ) ( ON ?auto_151544 ?auto_151545 ) ( CLEAR ?auto_151544 ) ( HOLDING ?auto_151543 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_151543 )
      ( MAKE-5PILE ?auto_151538 ?auto_151539 ?auto_151540 ?auto_151541 ?auto_151542 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_151546 - BLOCK
      ?auto_151547 - BLOCK
      ?auto_151548 - BLOCK
      ?auto_151549 - BLOCK
      ?auto_151550 - BLOCK
    )
    :vars
    (
      ?auto_151553 - BLOCK
      ?auto_151551 - BLOCK
      ?auto_151552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151553 ?auto_151550 ) ( ON-TABLE ?auto_151546 ) ( ON ?auto_151547 ?auto_151546 ) ( ON ?auto_151548 ?auto_151547 ) ( ON ?auto_151549 ?auto_151548 ) ( ON ?auto_151550 ?auto_151549 ) ( not ( = ?auto_151546 ?auto_151547 ) ) ( not ( = ?auto_151546 ?auto_151548 ) ) ( not ( = ?auto_151546 ?auto_151549 ) ) ( not ( = ?auto_151546 ?auto_151550 ) ) ( not ( = ?auto_151546 ?auto_151553 ) ) ( not ( = ?auto_151547 ?auto_151548 ) ) ( not ( = ?auto_151547 ?auto_151549 ) ) ( not ( = ?auto_151547 ?auto_151550 ) ) ( not ( = ?auto_151547 ?auto_151553 ) ) ( not ( = ?auto_151548 ?auto_151549 ) ) ( not ( = ?auto_151548 ?auto_151550 ) ) ( not ( = ?auto_151548 ?auto_151553 ) ) ( not ( = ?auto_151549 ?auto_151550 ) ) ( not ( = ?auto_151549 ?auto_151553 ) ) ( not ( = ?auto_151550 ?auto_151553 ) ) ( not ( = ?auto_151546 ?auto_151551 ) ) ( not ( = ?auto_151546 ?auto_151552 ) ) ( not ( = ?auto_151547 ?auto_151551 ) ) ( not ( = ?auto_151547 ?auto_151552 ) ) ( not ( = ?auto_151548 ?auto_151551 ) ) ( not ( = ?auto_151548 ?auto_151552 ) ) ( not ( = ?auto_151549 ?auto_151551 ) ) ( not ( = ?auto_151549 ?auto_151552 ) ) ( not ( = ?auto_151550 ?auto_151551 ) ) ( not ( = ?auto_151550 ?auto_151552 ) ) ( not ( = ?auto_151553 ?auto_151551 ) ) ( not ( = ?auto_151553 ?auto_151552 ) ) ( not ( = ?auto_151551 ?auto_151552 ) ) ( ON ?auto_151551 ?auto_151553 ) ( ON ?auto_151552 ?auto_151551 ) ( CLEAR ?auto_151552 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_151546 ?auto_151547 ?auto_151548 ?auto_151549 ?auto_151550 ?auto_151553 ?auto_151551 )
      ( MAKE-5PILE ?auto_151546 ?auto_151547 ?auto_151548 ?auto_151549 ?auto_151550 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_151554 - BLOCK
      ?auto_151555 - BLOCK
      ?auto_151556 - BLOCK
      ?auto_151557 - BLOCK
      ?auto_151558 - BLOCK
    )
    :vars
    (
      ?auto_151559 - BLOCK
      ?auto_151560 - BLOCK
      ?auto_151561 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151559 ?auto_151558 ) ( ON-TABLE ?auto_151554 ) ( ON ?auto_151555 ?auto_151554 ) ( ON ?auto_151556 ?auto_151555 ) ( ON ?auto_151557 ?auto_151556 ) ( ON ?auto_151558 ?auto_151557 ) ( not ( = ?auto_151554 ?auto_151555 ) ) ( not ( = ?auto_151554 ?auto_151556 ) ) ( not ( = ?auto_151554 ?auto_151557 ) ) ( not ( = ?auto_151554 ?auto_151558 ) ) ( not ( = ?auto_151554 ?auto_151559 ) ) ( not ( = ?auto_151555 ?auto_151556 ) ) ( not ( = ?auto_151555 ?auto_151557 ) ) ( not ( = ?auto_151555 ?auto_151558 ) ) ( not ( = ?auto_151555 ?auto_151559 ) ) ( not ( = ?auto_151556 ?auto_151557 ) ) ( not ( = ?auto_151556 ?auto_151558 ) ) ( not ( = ?auto_151556 ?auto_151559 ) ) ( not ( = ?auto_151557 ?auto_151558 ) ) ( not ( = ?auto_151557 ?auto_151559 ) ) ( not ( = ?auto_151558 ?auto_151559 ) ) ( not ( = ?auto_151554 ?auto_151560 ) ) ( not ( = ?auto_151554 ?auto_151561 ) ) ( not ( = ?auto_151555 ?auto_151560 ) ) ( not ( = ?auto_151555 ?auto_151561 ) ) ( not ( = ?auto_151556 ?auto_151560 ) ) ( not ( = ?auto_151556 ?auto_151561 ) ) ( not ( = ?auto_151557 ?auto_151560 ) ) ( not ( = ?auto_151557 ?auto_151561 ) ) ( not ( = ?auto_151558 ?auto_151560 ) ) ( not ( = ?auto_151558 ?auto_151561 ) ) ( not ( = ?auto_151559 ?auto_151560 ) ) ( not ( = ?auto_151559 ?auto_151561 ) ) ( not ( = ?auto_151560 ?auto_151561 ) ) ( ON ?auto_151560 ?auto_151559 ) ( HOLDING ?auto_151561 ) ( CLEAR ?auto_151560 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_151554 ?auto_151555 ?auto_151556 ?auto_151557 ?auto_151558 ?auto_151559 ?auto_151560 ?auto_151561 )
      ( MAKE-5PILE ?auto_151554 ?auto_151555 ?auto_151556 ?auto_151557 ?auto_151558 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_151562 - BLOCK
      ?auto_151563 - BLOCK
      ?auto_151564 - BLOCK
      ?auto_151565 - BLOCK
      ?auto_151566 - BLOCK
    )
    :vars
    (
      ?auto_151568 - BLOCK
      ?auto_151567 - BLOCK
      ?auto_151569 - BLOCK
      ?auto_151570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151568 ?auto_151566 ) ( ON-TABLE ?auto_151562 ) ( ON ?auto_151563 ?auto_151562 ) ( ON ?auto_151564 ?auto_151563 ) ( ON ?auto_151565 ?auto_151564 ) ( ON ?auto_151566 ?auto_151565 ) ( not ( = ?auto_151562 ?auto_151563 ) ) ( not ( = ?auto_151562 ?auto_151564 ) ) ( not ( = ?auto_151562 ?auto_151565 ) ) ( not ( = ?auto_151562 ?auto_151566 ) ) ( not ( = ?auto_151562 ?auto_151568 ) ) ( not ( = ?auto_151563 ?auto_151564 ) ) ( not ( = ?auto_151563 ?auto_151565 ) ) ( not ( = ?auto_151563 ?auto_151566 ) ) ( not ( = ?auto_151563 ?auto_151568 ) ) ( not ( = ?auto_151564 ?auto_151565 ) ) ( not ( = ?auto_151564 ?auto_151566 ) ) ( not ( = ?auto_151564 ?auto_151568 ) ) ( not ( = ?auto_151565 ?auto_151566 ) ) ( not ( = ?auto_151565 ?auto_151568 ) ) ( not ( = ?auto_151566 ?auto_151568 ) ) ( not ( = ?auto_151562 ?auto_151567 ) ) ( not ( = ?auto_151562 ?auto_151569 ) ) ( not ( = ?auto_151563 ?auto_151567 ) ) ( not ( = ?auto_151563 ?auto_151569 ) ) ( not ( = ?auto_151564 ?auto_151567 ) ) ( not ( = ?auto_151564 ?auto_151569 ) ) ( not ( = ?auto_151565 ?auto_151567 ) ) ( not ( = ?auto_151565 ?auto_151569 ) ) ( not ( = ?auto_151566 ?auto_151567 ) ) ( not ( = ?auto_151566 ?auto_151569 ) ) ( not ( = ?auto_151568 ?auto_151567 ) ) ( not ( = ?auto_151568 ?auto_151569 ) ) ( not ( = ?auto_151567 ?auto_151569 ) ) ( ON ?auto_151567 ?auto_151568 ) ( CLEAR ?auto_151567 ) ( ON ?auto_151569 ?auto_151570 ) ( CLEAR ?auto_151569 ) ( HAND-EMPTY ) ( not ( = ?auto_151562 ?auto_151570 ) ) ( not ( = ?auto_151563 ?auto_151570 ) ) ( not ( = ?auto_151564 ?auto_151570 ) ) ( not ( = ?auto_151565 ?auto_151570 ) ) ( not ( = ?auto_151566 ?auto_151570 ) ) ( not ( = ?auto_151568 ?auto_151570 ) ) ( not ( = ?auto_151567 ?auto_151570 ) ) ( not ( = ?auto_151569 ?auto_151570 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_151569 ?auto_151570 )
      ( MAKE-5PILE ?auto_151562 ?auto_151563 ?auto_151564 ?auto_151565 ?auto_151566 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_151571 - BLOCK
      ?auto_151572 - BLOCK
      ?auto_151573 - BLOCK
      ?auto_151574 - BLOCK
      ?auto_151575 - BLOCK
    )
    :vars
    (
      ?auto_151577 - BLOCK
      ?auto_151578 - BLOCK
      ?auto_151576 - BLOCK
      ?auto_151579 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151577 ?auto_151575 ) ( ON-TABLE ?auto_151571 ) ( ON ?auto_151572 ?auto_151571 ) ( ON ?auto_151573 ?auto_151572 ) ( ON ?auto_151574 ?auto_151573 ) ( ON ?auto_151575 ?auto_151574 ) ( not ( = ?auto_151571 ?auto_151572 ) ) ( not ( = ?auto_151571 ?auto_151573 ) ) ( not ( = ?auto_151571 ?auto_151574 ) ) ( not ( = ?auto_151571 ?auto_151575 ) ) ( not ( = ?auto_151571 ?auto_151577 ) ) ( not ( = ?auto_151572 ?auto_151573 ) ) ( not ( = ?auto_151572 ?auto_151574 ) ) ( not ( = ?auto_151572 ?auto_151575 ) ) ( not ( = ?auto_151572 ?auto_151577 ) ) ( not ( = ?auto_151573 ?auto_151574 ) ) ( not ( = ?auto_151573 ?auto_151575 ) ) ( not ( = ?auto_151573 ?auto_151577 ) ) ( not ( = ?auto_151574 ?auto_151575 ) ) ( not ( = ?auto_151574 ?auto_151577 ) ) ( not ( = ?auto_151575 ?auto_151577 ) ) ( not ( = ?auto_151571 ?auto_151578 ) ) ( not ( = ?auto_151571 ?auto_151576 ) ) ( not ( = ?auto_151572 ?auto_151578 ) ) ( not ( = ?auto_151572 ?auto_151576 ) ) ( not ( = ?auto_151573 ?auto_151578 ) ) ( not ( = ?auto_151573 ?auto_151576 ) ) ( not ( = ?auto_151574 ?auto_151578 ) ) ( not ( = ?auto_151574 ?auto_151576 ) ) ( not ( = ?auto_151575 ?auto_151578 ) ) ( not ( = ?auto_151575 ?auto_151576 ) ) ( not ( = ?auto_151577 ?auto_151578 ) ) ( not ( = ?auto_151577 ?auto_151576 ) ) ( not ( = ?auto_151578 ?auto_151576 ) ) ( ON ?auto_151576 ?auto_151579 ) ( CLEAR ?auto_151576 ) ( not ( = ?auto_151571 ?auto_151579 ) ) ( not ( = ?auto_151572 ?auto_151579 ) ) ( not ( = ?auto_151573 ?auto_151579 ) ) ( not ( = ?auto_151574 ?auto_151579 ) ) ( not ( = ?auto_151575 ?auto_151579 ) ) ( not ( = ?auto_151577 ?auto_151579 ) ) ( not ( = ?auto_151578 ?auto_151579 ) ) ( not ( = ?auto_151576 ?auto_151579 ) ) ( HOLDING ?auto_151578 ) ( CLEAR ?auto_151577 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_151571 ?auto_151572 ?auto_151573 ?auto_151574 ?auto_151575 ?auto_151577 ?auto_151578 )
      ( MAKE-5PILE ?auto_151571 ?auto_151572 ?auto_151573 ?auto_151574 ?auto_151575 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_151580 - BLOCK
      ?auto_151581 - BLOCK
      ?auto_151582 - BLOCK
      ?auto_151583 - BLOCK
      ?auto_151584 - BLOCK
    )
    :vars
    (
      ?auto_151587 - BLOCK
      ?auto_151585 - BLOCK
      ?auto_151586 - BLOCK
      ?auto_151588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151587 ?auto_151584 ) ( ON-TABLE ?auto_151580 ) ( ON ?auto_151581 ?auto_151580 ) ( ON ?auto_151582 ?auto_151581 ) ( ON ?auto_151583 ?auto_151582 ) ( ON ?auto_151584 ?auto_151583 ) ( not ( = ?auto_151580 ?auto_151581 ) ) ( not ( = ?auto_151580 ?auto_151582 ) ) ( not ( = ?auto_151580 ?auto_151583 ) ) ( not ( = ?auto_151580 ?auto_151584 ) ) ( not ( = ?auto_151580 ?auto_151587 ) ) ( not ( = ?auto_151581 ?auto_151582 ) ) ( not ( = ?auto_151581 ?auto_151583 ) ) ( not ( = ?auto_151581 ?auto_151584 ) ) ( not ( = ?auto_151581 ?auto_151587 ) ) ( not ( = ?auto_151582 ?auto_151583 ) ) ( not ( = ?auto_151582 ?auto_151584 ) ) ( not ( = ?auto_151582 ?auto_151587 ) ) ( not ( = ?auto_151583 ?auto_151584 ) ) ( not ( = ?auto_151583 ?auto_151587 ) ) ( not ( = ?auto_151584 ?auto_151587 ) ) ( not ( = ?auto_151580 ?auto_151585 ) ) ( not ( = ?auto_151580 ?auto_151586 ) ) ( not ( = ?auto_151581 ?auto_151585 ) ) ( not ( = ?auto_151581 ?auto_151586 ) ) ( not ( = ?auto_151582 ?auto_151585 ) ) ( not ( = ?auto_151582 ?auto_151586 ) ) ( not ( = ?auto_151583 ?auto_151585 ) ) ( not ( = ?auto_151583 ?auto_151586 ) ) ( not ( = ?auto_151584 ?auto_151585 ) ) ( not ( = ?auto_151584 ?auto_151586 ) ) ( not ( = ?auto_151587 ?auto_151585 ) ) ( not ( = ?auto_151587 ?auto_151586 ) ) ( not ( = ?auto_151585 ?auto_151586 ) ) ( ON ?auto_151586 ?auto_151588 ) ( not ( = ?auto_151580 ?auto_151588 ) ) ( not ( = ?auto_151581 ?auto_151588 ) ) ( not ( = ?auto_151582 ?auto_151588 ) ) ( not ( = ?auto_151583 ?auto_151588 ) ) ( not ( = ?auto_151584 ?auto_151588 ) ) ( not ( = ?auto_151587 ?auto_151588 ) ) ( not ( = ?auto_151585 ?auto_151588 ) ) ( not ( = ?auto_151586 ?auto_151588 ) ) ( CLEAR ?auto_151587 ) ( ON ?auto_151585 ?auto_151586 ) ( CLEAR ?auto_151585 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_151588 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_151588 ?auto_151586 )
      ( MAKE-5PILE ?auto_151580 ?auto_151581 ?auto_151582 ?auto_151583 ?auto_151584 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_151607 - BLOCK
      ?auto_151608 - BLOCK
      ?auto_151609 - BLOCK
      ?auto_151610 - BLOCK
      ?auto_151611 - BLOCK
    )
    :vars
    (
      ?auto_151615 - BLOCK
      ?auto_151614 - BLOCK
      ?auto_151613 - BLOCK
      ?auto_151612 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151607 ) ( ON ?auto_151608 ?auto_151607 ) ( ON ?auto_151609 ?auto_151608 ) ( ON ?auto_151610 ?auto_151609 ) ( not ( = ?auto_151607 ?auto_151608 ) ) ( not ( = ?auto_151607 ?auto_151609 ) ) ( not ( = ?auto_151607 ?auto_151610 ) ) ( not ( = ?auto_151607 ?auto_151611 ) ) ( not ( = ?auto_151607 ?auto_151615 ) ) ( not ( = ?auto_151608 ?auto_151609 ) ) ( not ( = ?auto_151608 ?auto_151610 ) ) ( not ( = ?auto_151608 ?auto_151611 ) ) ( not ( = ?auto_151608 ?auto_151615 ) ) ( not ( = ?auto_151609 ?auto_151610 ) ) ( not ( = ?auto_151609 ?auto_151611 ) ) ( not ( = ?auto_151609 ?auto_151615 ) ) ( not ( = ?auto_151610 ?auto_151611 ) ) ( not ( = ?auto_151610 ?auto_151615 ) ) ( not ( = ?auto_151611 ?auto_151615 ) ) ( not ( = ?auto_151607 ?auto_151614 ) ) ( not ( = ?auto_151607 ?auto_151613 ) ) ( not ( = ?auto_151608 ?auto_151614 ) ) ( not ( = ?auto_151608 ?auto_151613 ) ) ( not ( = ?auto_151609 ?auto_151614 ) ) ( not ( = ?auto_151609 ?auto_151613 ) ) ( not ( = ?auto_151610 ?auto_151614 ) ) ( not ( = ?auto_151610 ?auto_151613 ) ) ( not ( = ?auto_151611 ?auto_151614 ) ) ( not ( = ?auto_151611 ?auto_151613 ) ) ( not ( = ?auto_151615 ?auto_151614 ) ) ( not ( = ?auto_151615 ?auto_151613 ) ) ( not ( = ?auto_151614 ?auto_151613 ) ) ( ON ?auto_151613 ?auto_151612 ) ( not ( = ?auto_151607 ?auto_151612 ) ) ( not ( = ?auto_151608 ?auto_151612 ) ) ( not ( = ?auto_151609 ?auto_151612 ) ) ( not ( = ?auto_151610 ?auto_151612 ) ) ( not ( = ?auto_151611 ?auto_151612 ) ) ( not ( = ?auto_151615 ?auto_151612 ) ) ( not ( = ?auto_151614 ?auto_151612 ) ) ( not ( = ?auto_151613 ?auto_151612 ) ) ( ON ?auto_151614 ?auto_151613 ) ( ON-TABLE ?auto_151612 ) ( ON ?auto_151615 ?auto_151614 ) ( CLEAR ?auto_151615 ) ( HOLDING ?auto_151611 ) ( CLEAR ?auto_151610 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_151607 ?auto_151608 ?auto_151609 ?auto_151610 ?auto_151611 ?auto_151615 )
      ( MAKE-5PILE ?auto_151607 ?auto_151608 ?auto_151609 ?auto_151610 ?auto_151611 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_151616 - BLOCK
      ?auto_151617 - BLOCK
      ?auto_151618 - BLOCK
      ?auto_151619 - BLOCK
      ?auto_151620 - BLOCK
    )
    :vars
    (
      ?auto_151621 - BLOCK
      ?auto_151624 - BLOCK
      ?auto_151622 - BLOCK
      ?auto_151623 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151616 ) ( ON ?auto_151617 ?auto_151616 ) ( ON ?auto_151618 ?auto_151617 ) ( ON ?auto_151619 ?auto_151618 ) ( not ( = ?auto_151616 ?auto_151617 ) ) ( not ( = ?auto_151616 ?auto_151618 ) ) ( not ( = ?auto_151616 ?auto_151619 ) ) ( not ( = ?auto_151616 ?auto_151620 ) ) ( not ( = ?auto_151616 ?auto_151621 ) ) ( not ( = ?auto_151617 ?auto_151618 ) ) ( not ( = ?auto_151617 ?auto_151619 ) ) ( not ( = ?auto_151617 ?auto_151620 ) ) ( not ( = ?auto_151617 ?auto_151621 ) ) ( not ( = ?auto_151618 ?auto_151619 ) ) ( not ( = ?auto_151618 ?auto_151620 ) ) ( not ( = ?auto_151618 ?auto_151621 ) ) ( not ( = ?auto_151619 ?auto_151620 ) ) ( not ( = ?auto_151619 ?auto_151621 ) ) ( not ( = ?auto_151620 ?auto_151621 ) ) ( not ( = ?auto_151616 ?auto_151624 ) ) ( not ( = ?auto_151616 ?auto_151622 ) ) ( not ( = ?auto_151617 ?auto_151624 ) ) ( not ( = ?auto_151617 ?auto_151622 ) ) ( not ( = ?auto_151618 ?auto_151624 ) ) ( not ( = ?auto_151618 ?auto_151622 ) ) ( not ( = ?auto_151619 ?auto_151624 ) ) ( not ( = ?auto_151619 ?auto_151622 ) ) ( not ( = ?auto_151620 ?auto_151624 ) ) ( not ( = ?auto_151620 ?auto_151622 ) ) ( not ( = ?auto_151621 ?auto_151624 ) ) ( not ( = ?auto_151621 ?auto_151622 ) ) ( not ( = ?auto_151624 ?auto_151622 ) ) ( ON ?auto_151622 ?auto_151623 ) ( not ( = ?auto_151616 ?auto_151623 ) ) ( not ( = ?auto_151617 ?auto_151623 ) ) ( not ( = ?auto_151618 ?auto_151623 ) ) ( not ( = ?auto_151619 ?auto_151623 ) ) ( not ( = ?auto_151620 ?auto_151623 ) ) ( not ( = ?auto_151621 ?auto_151623 ) ) ( not ( = ?auto_151624 ?auto_151623 ) ) ( not ( = ?auto_151622 ?auto_151623 ) ) ( ON ?auto_151624 ?auto_151622 ) ( ON-TABLE ?auto_151623 ) ( ON ?auto_151621 ?auto_151624 ) ( CLEAR ?auto_151619 ) ( ON ?auto_151620 ?auto_151621 ) ( CLEAR ?auto_151620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_151623 ?auto_151622 ?auto_151624 ?auto_151621 )
      ( MAKE-5PILE ?auto_151616 ?auto_151617 ?auto_151618 ?auto_151619 ?auto_151620 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_151625 - BLOCK
      ?auto_151626 - BLOCK
      ?auto_151627 - BLOCK
      ?auto_151628 - BLOCK
      ?auto_151629 - BLOCK
    )
    :vars
    (
      ?auto_151633 - BLOCK
      ?auto_151632 - BLOCK
      ?auto_151631 - BLOCK
      ?auto_151630 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151625 ) ( ON ?auto_151626 ?auto_151625 ) ( ON ?auto_151627 ?auto_151626 ) ( not ( = ?auto_151625 ?auto_151626 ) ) ( not ( = ?auto_151625 ?auto_151627 ) ) ( not ( = ?auto_151625 ?auto_151628 ) ) ( not ( = ?auto_151625 ?auto_151629 ) ) ( not ( = ?auto_151625 ?auto_151633 ) ) ( not ( = ?auto_151626 ?auto_151627 ) ) ( not ( = ?auto_151626 ?auto_151628 ) ) ( not ( = ?auto_151626 ?auto_151629 ) ) ( not ( = ?auto_151626 ?auto_151633 ) ) ( not ( = ?auto_151627 ?auto_151628 ) ) ( not ( = ?auto_151627 ?auto_151629 ) ) ( not ( = ?auto_151627 ?auto_151633 ) ) ( not ( = ?auto_151628 ?auto_151629 ) ) ( not ( = ?auto_151628 ?auto_151633 ) ) ( not ( = ?auto_151629 ?auto_151633 ) ) ( not ( = ?auto_151625 ?auto_151632 ) ) ( not ( = ?auto_151625 ?auto_151631 ) ) ( not ( = ?auto_151626 ?auto_151632 ) ) ( not ( = ?auto_151626 ?auto_151631 ) ) ( not ( = ?auto_151627 ?auto_151632 ) ) ( not ( = ?auto_151627 ?auto_151631 ) ) ( not ( = ?auto_151628 ?auto_151632 ) ) ( not ( = ?auto_151628 ?auto_151631 ) ) ( not ( = ?auto_151629 ?auto_151632 ) ) ( not ( = ?auto_151629 ?auto_151631 ) ) ( not ( = ?auto_151633 ?auto_151632 ) ) ( not ( = ?auto_151633 ?auto_151631 ) ) ( not ( = ?auto_151632 ?auto_151631 ) ) ( ON ?auto_151631 ?auto_151630 ) ( not ( = ?auto_151625 ?auto_151630 ) ) ( not ( = ?auto_151626 ?auto_151630 ) ) ( not ( = ?auto_151627 ?auto_151630 ) ) ( not ( = ?auto_151628 ?auto_151630 ) ) ( not ( = ?auto_151629 ?auto_151630 ) ) ( not ( = ?auto_151633 ?auto_151630 ) ) ( not ( = ?auto_151632 ?auto_151630 ) ) ( not ( = ?auto_151631 ?auto_151630 ) ) ( ON ?auto_151632 ?auto_151631 ) ( ON-TABLE ?auto_151630 ) ( ON ?auto_151633 ?auto_151632 ) ( ON ?auto_151629 ?auto_151633 ) ( CLEAR ?auto_151629 ) ( HOLDING ?auto_151628 ) ( CLEAR ?auto_151627 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_151625 ?auto_151626 ?auto_151627 ?auto_151628 )
      ( MAKE-5PILE ?auto_151625 ?auto_151626 ?auto_151627 ?auto_151628 ?auto_151629 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_151634 - BLOCK
      ?auto_151635 - BLOCK
      ?auto_151636 - BLOCK
      ?auto_151637 - BLOCK
      ?auto_151638 - BLOCK
    )
    :vars
    (
      ?auto_151642 - BLOCK
      ?auto_151639 - BLOCK
      ?auto_151641 - BLOCK
      ?auto_151640 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151634 ) ( ON ?auto_151635 ?auto_151634 ) ( ON ?auto_151636 ?auto_151635 ) ( not ( = ?auto_151634 ?auto_151635 ) ) ( not ( = ?auto_151634 ?auto_151636 ) ) ( not ( = ?auto_151634 ?auto_151637 ) ) ( not ( = ?auto_151634 ?auto_151638 ) ) ( not ( = ?auto_151634 ?auto_151642 ) ) ( not ( = ?auto_151635 ?auto_151636 ) ) ( not ( = ?auto_151635 ?auto_151637 ) ) ( not ( = ?auto_151635 ?auto_151638 ) ) ( not ( = ?auto_151635 ?auto_151642 ) ) ( not ( = ?auto_151636 ?auto_151637 ) ) ( not ( = ?auto_151636 ?auto_151638 ) ) ( not ( = ?auto_151636 ?auto_151642 ) ) ( not ( = ?auto_151637 ?auto_151638 ) ) ( not ( = ?auto_151637 ?auto_151642 ) ) ( not ( = ?auto_151638 ?auto_151642 ) ) ( not ( = ?auto_151634 ?auto_151639 ) ) ( not ( = ?auto_151634 ?auto_151641 ) ) ( not ( = ?auto_151635 ?auto_151639 ) ) ( not ( = ?auto_151635 ?auto_151641 ) ) ( not ( = ?auto_151636 ?auto_151639 ) ) ( not ( = ?auto_151636 ?auto_151641 ) ) ( not ( = ?auto_151637 ?auto_151639 ) ) ( not ( = ?auto_151637 ?auto_151641 ) ) ( not ( = ?auto_151638 ?auto_151639 ) ) ( not ( = ?auto_151638 ?auto_151641 ) ) ( not ( = ?auto_151642 ?auto_151639 ) ) ( not ( = ?auto_151642 ?auto_151641 ) ) ( not ( = ?auto_151639 ?auto_151641 ) ) ( ON ?auto_151641 ?auto_151640 ) ( not ( = ?auto_151634 ?auto_151640 ) ) ( not ( = ?auto_151635 ?auto_151640 ) ) ( not ( = ?auto_151636 ?auto_151640 ) ) ( not ( = ?auto_151637 ?auto_151640 ) ) ( not ( = ?auto_151638 ?auto_151640 ) ) ( not ( = ?auto_151642 ?auto_151640 ) ) ( not ( = ?auto_151639 ?auto_151640 ) ) ( not ( = ?auto_151641 ?auto_151640 ) ) ( ON ?auto_151639 ?auto_151641 ) ( ON-TABLE ?auto_151640 ) ( ON ?auto_151642 ?auto_151639 ) ( ON ?auto_151638 ?auto_151642 ) ( CLEAR ?auto_151636 ) ( ON ?auto_151637 ?auto_151638 ) ( CLEAR ?auto_151637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_151640 ?auto_151641 ?auto_151639 ?auto_151642 ?auto_151638 )
      ( MAKE-5PILE ?auto_151634 ?auto_151635 ?auto_151636 ?auto_151637 ?auto_151638 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_151643 - BLOCK
      ?auto_151644 - BLOCK
      ?auto_151645 - BLOCK
      ?auto_151646 - BLOCK
      ?auto_151647 - BLOCK
    )
    :vars
    (
      ?auto_151648 - BLOCK
      ?auto_151649 - BLOCK
      ?auto_151650 - BLOCK
      ?auto_151651 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151643 ) ( ON ?auto_151644 ?auto_151643 ) ( not ( = ?auto_151643 ?auto_151644 ) ) ( not ( = ?auto_151643 ?auto_151645 ) ) ( not ( = ?auto_151643 ?auto_151646 ) ) ( not ( = ?auto_151643 ?auto_151647 ) ) ( not ( = ?auto_151643 ?auto_151648 ) ) ( not ( = ?auto_151644 ?auto_151645 ) ) ( not ( = ?auto_151644 ?auto_151646 ) ) ( not ( = ?auto_151644 ?auto_151647 ) ) ( not ( = ?auto_151644 ?auto_151648 ) ) ( not ( = ?auto_151645 ?auto_151646 ) ) ( not ( = ?auto_151645 ?auto_151647 ) ) ( not ( = ?auto_151645 ?auto_151648 ) ) ( not ( = ?auto_151646 ?auto_151647 ) ) ( not ( = ?auto_151646 ?auto_151648 ) ) ( not ( = ?auto_151647 ?auto_151648 ) ) ( not ( = ?auto_151643 ?auto_151649 ) ) ( not ( = ?auto_151643 ?auto_151650 ) ) ( not ( = ?auto_151644 ?auto_151649 ) ) ( not ( = ?auto_151644 ?auto_151650 ) ) ( not ( = ?auto_151645 ?auto_151649 ) ) ( not ( = ?auto_151645 ?auto_151650 ) ) ( not ( = ?auto_151646 ?auto_151649 ) ) ( not ( = ?auto_151646 ?auto_151650 ) ) ( not ( = ?auto_151647 ?auto_151649 ) ) ( not ( = ?auto_151647 ?auto_151650 ) ) ( not ( = ?auto_151648 ?auto_151649 ) ) ( not ( = ?auto_151648 ?auto_151650 ) ) ( not ( = ?auto_151649 ?auto_151650 ) ) ( ON ?auto_151650 ?auto_151651 ) ( not ( = ?auto_151643 ?auto_151651 ) ) ( not ( = ?auto_151644 ?auto_151651 ) ) ( not ( = ?auto_151645 ?auto_151651 ) ) ( not ( = ?auto_151646 ?auto_151651 ) ) ( not ( = ?auto_151647 ?auto_151651 ) ) ( not ( = ?auto_151648 ?auto_151651 ) ) ( not ( = ?auto_151649 ?auto_151651 ) ) ( not ( = ?auto_151650 ?auto_151651 ) ) ( ON ?auto_151649 ?auto_151650 ) ( ON-TABLE ?auto_151651 ) ( ON ?auto_151648 ?auto_151649 ) ( ON ?auto_151647 ?auto_151648 ) ( ON ?auto_151646 ?auto_151647 ) ( CLEAR ?auto_151646 ) ( HOLDING ?auto_151645 ) ( CLEAR ?auto_151644 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_151643 ?auto_151644 ?auto_151645 )
      ( MAKE-5PILE ?auto_151643 ?auto_151644 ?auto_151645 ?auto_151646 ?auto_151647 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_151652 - BLOCK
      ?auto_151653 - BLOCK
      ?auto_151654 - BLOCK
      ?auto_151655 - BLOCK
      ?auto_151656 - BLOCK
    )
    :vars
    (
      ?auto_151660 - BLOCK
      ?auto_151658 - BLOCK
      ?auto_151657 - BLOCK
      ?auto_151659 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151652 ) ( ON ?auto_151653 ?auto_151652 ) ( not ( = ?auto_151652 ?auto_151653 ) ) ( not ( = ?auto_151652 ?auto_151654 ) ) ( not ( = ?auto_151652 ?auto_151655 ) ) ( not ( = ?auto_151652 ?auto_151656 ) ) ( not ( = ?auto_151652 ?auto_151660 ) ) ( not ( = ?auto_151653 ?auto_151654 ) ) ( not ( = ?auto_151653 ?auto_151655 ) ) ( not ( = ?auto_151653 ?auto_151656 ) ) ( not ( = ?auto_151653 ?auto_151660 ) ) ( not ( = ?auto_151654 ?auto_151655 ) ) ( not ( = ?auto_151654 ?auto_151656 ) ) ( not ( = ?auto_151654 ?auto_151660 ) ) ( not ( = ?auto_151655 ?auto_151656 ) ) ( not ( = ?auto_151655 ?auto_151660 ) ) ( not ( = ?auto_151656 ?auto_151660 ) ) ( not ( = ?auto_151652 ?auto_151658 ) ) ( not ( = ?auto_151652 ?auto_151657 ) ) ( not ( = ?auto_151653 ?auto_151658 ) ) ( not ( = ?auto_151653 ?auto_151657 ) ) ( not ( = ?auto_151654 ?auto_151658 ) ) ( not ( = ?auto_151654 ?auto_151657 ) ) ( not ( = ?auto_151655 ?auto_151658 ) ) ( not ( = ?auto_151655 ?auto_151657 ) ) ( not ( = ?auto_151656 ?auto_151658 ) ) ( not ( = ?auto_151656 ?auto_151657 ) ) ( not ( = ?auto_151660 ?auto_151658 ) ) ( not ( = ?auto_151660 ?auto_151657 ) ) ( not ( = ?auto_151658 ?auto_151657 ) ) ( ON ?auto_151657 ?auto_151659 ) ( not ( = ?auto_151652 ?auto_151659 ) ) ( not ( = ?auto_151653 ?auto_151659 ) ) ( not ( = ?auto_151654 ?auto_151659 ) ) ( not ( = ?auto_151655 ?auto_151659 ) ) ( not ( = ?auto_151656 ?auto_151659 ) ) ( not ( = ?auto_151660 ?auto_151659 ) ) ( not ( = ?auto_151658 ?auto_151659 ) ) ( not ( = ?auto_151657 ?auto_151659 ) ) ( ON ?auto_151658 ?auto_151657 ) ( ON-TABLE ?auto_151659 ) ( ON ?auto_151660 ?auto_151658 ) ( ON ?auto_151656 ?auto_151660 ) ( ON ?auto_151655 ?auto_151656 ) ( CLEAR ?auto_151653 ) ( ON ?auto_151654 ?auto_151655 ) ( CLEAR ?auto_151654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_151659 ?auto_151657 ?auto_151658 ?auto_151660 ?auto_151656 ?auto_151655 )
      ( MAKE-5PILE ?auto_151652 ?auto_151653 ?auto_151654 ?auto_151655 ?auto_151656 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_151661 - BLOCK
      ?auto_151662 - BLOCK
      ?auto_151663 - BLOCK
      ?auto_151664 - BLOCK
      ?auto_151665 - BLOCK
    )
    :vars
    (
      ?auto_151669 - BLOCK
      ?auto_151668 - BLOCK
      ?auto_151666 - BLOCK
      ?auto_151667 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151661 ) ( not ( = ?auto_151661 ?auto_151662 ) ) ( not ( = ?auto_151661 ?auto_151663 ) ) ( not ( = ?auto_151661 ?auto_151664 ) ) ( not ( = ?auto_151661 ?auto_151665 ) ) ( not ( = ?auto_151661 ?auto_151669 ) ) ( not ( = ?auto_151662 ?auto_151663 ) ) ( not ( = ?auto_151662 ?auto_151664 ) ) ( not ( = ?auto_151662 ?auto_151665 ) ) ( not ( = ?auto_151662 ?auto_151669 ) ) ( not ( = ?auto_151663 ?auto_151664 ) ) ( not ( = ?auto_151663 ?auto_151665 ) ) ( not ( = ?auto_151663 ?auto_151669 ) ) ( not ( = ?auto_151664 ?auto_151665 ) ) ( not ( = ?auto_151664 ?auto_151669 ) ) ( not ( = ?auto_151665 ?auto_151669 ) ) ( not ( = ?auto_151661 ?auto_151668 ) ) ( not ( = ?auto_151661 ?auto_151666 ) ) ( not ( = ?auto_151662 ?auto_151668 ) ) ( not ( = ?auto_151662 ?auto_151666 ) ) ( not ( = ?auto_151663 ?auto_151668 ) ) ( not ( = ?auto_151663 ?auto_151666 ) ) ( not ( = ?auto_151664 ?auto_151668 ) ) ( not ( = ?auto_151664 ?auto_151666 ) ) ( not ( = ?auto_151665 ?auto_151668 ) ) ( not ( = ?auto_151665 ?auto_151666 ) ) ( not ( = ?auto_151669 ?auto_151668 ) ) ( not ( = ?auto_151669 ?auto_151666 ) ) ( not ( = ?auto_151668 ?auto_151666 ) ) ( ON ?auto_151666 ?auto_151667 ) ( not ( = ?auto_151661 ?auto_151667 ) ) ( not ( = ?auto_151662 ?auto_151667 ) ) ( not ( = ?auto_151663 ?auto_151667 ) ) ( not ( = ?auto_151664 ?auto_151667 ) ) ( not ( = ?auto_151665 ?auto_151667 ) ) ( not ( = ?auto_151669 ?auto_151667 ) ) ( not ( = ?auto_151668 ?auto_151667 ) ) ( not ( = ?auto_151666 ?auto_151667 ) ) ( ON ?auto_151668 ?auto_151666 ) ( ON-TABLE ?auto_151667 ) ( ON ?auto_151669 ?auto_151668 ) ( ON ?auto_151665 ?auto_151669 ) ( ON ?auto_151664 ?auto_151665 ) ( ON ?auto_151663 ?auto_151664 ) ( CLEAR ?auto_151663 ) ( HOLDING ?auto_151662 ) ( CLEAR ?auto_151661 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_151661 ?auto_151662 )
      ( MAKE-5PILE ?auto_151661 ?auto_151662 ?auto_151663 ?auto_151664 ?auto_151665 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_151670 - BLOCK
      ?auto_151671 - BLOCK
      ?auto_151672 - BLOCK
      ?auto_151673 - BLOCK
      ?auto_151674 - BLOCK
    )
    :vars
    (
      ?auto_151678 - BLOCK
      ?auto_151675 - BLOCK
      ?auto_151677 - BLOCK
      ?auto_151676 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151670 ) ( not ( = ?auto_151670 ?auto_151671 ) ) ( not ( = ?auto_151670 ?auto_151672 ) ) ( not ( = ?auto_151670 ?auto_151673 ) ) ( not ( = ?auto_151670 ?auto_151674 ) ) ( not ( = ?auto_151670 ?auto_151678 ) ) ( not ( = ?auto_151671 ?auto_151672 ) ) ( not ( = ?auto_151671 ?auto_151673 ) ) ( not ( = ?auto_151671 ?auto_151674 ) ) ( not ( = ?auto_151671 ?auto_151678 ) ) ( not ( = ?auto_151672 ?auto_151673 ) ) ( not ( = ?auto_151672 ?auto_151674 ) ) ( not ( = ?auto_151672 ?auto_151678 ) ) ( not ( = ?auto_151673 ?auto_151674 ) ) ( not ( = ?auto_151673 ?auto_151678 ) ) ( not ( = ?auto_151674 ?auto_151678 ) ) ( not ( = ?auto_151670 ?auto_151675 ) ) ( not ( = ?auto_151670 ?auto_151677 ) ) ( not ( = ?auto_151671 ?auto_151675 ) ) ( not ( = ?auto_151671 ?auto_151677 ) ) ( not ( = ?auto_151672 ?auto_151675 ) ) ( not ( = ?auto_151672 ?auto_151677 ) ) ( not ( = ?auto_151673 ?auto_151675 ) ) ( not ( = ?auto_151673 ?auto_151677 ) ) ( not ( = ?auto_151674 ?auto_151675 ) ) ( not ( = ?auto_151674 ?auto_151677 ) ) ( not ( = ?auto_151678 ?auto_151675 ) ) ( not ( = ?auto_151678 ?auto_151677 ) ) ( not ( = ?auto_151675 ?auto_151677 ) ) ( ON ?auto_151677 ?auto_151676 ) ( not ( = ?auto_151670 ?auto_151676 ) ) ( not ( = ?auto_151671 ?auto_151676 ) ) ( not ( = ?auto_151672 ?auto_151676 ) ) ( not ( = ?auto_151673 ?auto_151676 ) ) ( not ( = ?auto_151674 ?auto_151676 ) ) ( not ( = ?auto_151678 ?auto_151676 ) ) ( not ( = ?auto_151675 ?auto_151676 ) ) ( not ( = ?auto_151677 ?auto_151676 ) ) ( ON ?auto_151675 ?auto_151677 ) ( ON-TABLE ?auto_151676 ) ( ON ?auto_151678 ?auto_151675 ) ( ON ?auto_151674 ?auto_151678 ) ( ON ?auto_151673 ?auto_151674 ) ( ON ?auto_151672 ?auto_151673 ) ( CLEAR ?auto_151670 ) ( ON ?auto_151671 ?auto_151672 ) ( CLEAR ?auto_151671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_151676 ?auto_151677 ?auto_151675 ?auto_151678 ?auto_151674 ?auto_151673 ?auto_151672 )
      ( MAKE-5PILE ?auto_151670 ?auto_151671 ?auto_151672 ?auto_151673 ?auto_151674 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_151679 - BLOCK
      ?auto_151680 - BLOCK
      ?auto_151681 - BLOCK
      ?auto_151682 - BLOCK
      ?auto_151683 - BLOCK
    )
    :vars
    (
      ?auto_151685 - BLOCK
      ?auto_151686 - BLOCK
      ?auto_151684 - BLOCK
      ?auto_151687 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151679 ?auto_151680 ) ) ( not ( = ?auto_151679 ?auto_151681 ) ) ( not ( = ?auto_151679 ?auto_151682 ) ) ( not ( = ?auto_151679 ?auto_151683 ) ) ( not ( = ?auto_151679 ?auto_151685 ) ) ( not ( = ?auto_151680 ?auto_151681 ) ) ( not ( = ?auto_151680 ?auto_151682 ) ) ( not ( = ?auto_151680 ?auto_151683 ) ) ( not ( = ?auto_151680 ?auto_151685 ) ) ( not ( = ?auto_151681 ?auto_151682 ) ) ( not ( = ?auto_151681 ?auto_151683 ) ) ( not ( = ?auto_151681 ?auto_151685 ) ) ( not ( = ?auto_151682 ?auto_151683 ) ) ( not ( = ?auto_151682 ?auto_151685 ) ) ( not ( = ?auto_151683 ?auto_151685 ) ) ( not ( = ?auto_151679 ?auto_151686 ) ) ( not ( = ?auto_151679 ?auto_151684 ) ) ( not ( = ?auto_151680 ?auto_151686 ) ) ( not ( = ?auto_151680 ?auto_151684 ) ) ( not ( = ?auto_151681 ?auto_151686 ) ) ( not ( = ?auto_151681 ?auto_151684 ) ) ( not ( = ?auto_151682 ?auto_151686 ) ) ( not ( = ?auto_151682 ?auto_151684 ) ) ( not ( = ?auto_151683 ?auto_151686 ) ) ( not ( = ?auto_151683 ?auto_151684 ) ) ( not ( = ?auto_151685 ?auto_151686 ) ) ( not ( = ?auto_151685 ?auto_151684 ) ) ( not ( = ?auto_151686 ?auto_151684 ) ) ( ON ?auto_151684 ?auto_151687 ) ( not ( = ?auto_151679 ?auto_151687 ) ) ( not ( = ?auto_151680 ?auto_151687 ) ) ( not ( = ?auto_151681 ?auto_151687 ) ) ( not ( = ?auto_151682 ?auto_151687 ) ) ( not ( = ?auto_151683 ?auto_151687 ) ) ( not ( = ?auto_151685 ?auto_151687 ) ) ( not ( = ?auto_151686 ?auto_151687 ) ) ( not ( = ?auto_151684 ?auto_151687 ) ) ( ON ?auto_151686 ?auto_151684 ) ( ON-TABLE ?auto_151687 ) ( ON ?auto_151685 ?auto_151686 ) ( ON ?auto_151683 ?auto_151685 ) ( ON ?auto_151682 ?auto_151683 ) ( ON ?auto_151681 ?auto_151682 ) ( ON ?auto_151680 ?auto_151681 ) ( CLEAR ?auto_151680 ) ( HOLDING ?auto_151679 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_151679 )
      ( MAKE-5PILE ?auto_151679 ?auto_151680 ?auto_151681 ?auto_151682 ?auto_151683 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_151688 - BLOCK
      ?auto_151689 - BLOCK
      ?auto_151690 - BLOCK
      ?auto_151691 - BLOCK
      ?auto_151692 - BLOCK
    )
    :vars
    (
      ?auto_151693 - BLOCK
      ?auto_151694 - BLOCK
      ?auto_151695 - BLOCK
      ?auto_151696 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151688 ?auto_151689 ) ) ( not ( = ?auto_151688 ?auto_151690 ) ) ( not ( = ?auto_151688 ?auto_151691 ) ) ( not ( = ?auto_151688 ?auto_151692 ) ) ( not ( = ?auto_151688 ?auto_151693 ) ) ( not ( = ?auto_151689 ?auto_151690 ) ) ( not ( = ?auto_151689 ?auto_151691 ) ) ( not ( = ?auto_151689 ?auto_151692 ) ) ( not ( = ?auto_151689 ?auto_151693 ) ) ( not ( = ?auto_151690 ?auto_151691 ) ) ( not ( = ?auto_151690 ?auto_151692 ) ) ( not ( = ?auto_151690 ?auto_151693 ) ) ( not ( = ?auto_151691 ?auto_151692 ) ) ( not ( = ?auto_151691 ?auto_151693 ) ) ( not ( = ?auto_151692 ?auto_151693 ) ) ( not ( = ?auto_151688 ?auto_151694 ) ) ( not ( = ?auto_151688 ?auto_151695 ) ) ( not ( = ?auto_151689 ?auto_151694 ) ) ( not ( = ?auto_151689 ?auto_151695 ) ) ( not ( = ?auto_151690 ?auto_151694 ) ) ( not ( = ?auto_151690 ?auto_151695 ) ) ( not ( = ?auto_151691 ?auto_151694 ) ) ( not ( = ?auto_151691 ?auto_151695 ) ) ( not ( = ?auto_151692 ?auto_151694 ) ) ( not ( = ?auto_151692 ?auto_151695 ) ) ( not ( = ?auto_151693 ?auto_151694 ) ) ( not ( = ?auto_151693 ?auto_151695 ) ) ( not ( = ?auto_151694 ?auto_151695 ) ) ( ON ?auto_151695 ?auto_151696 ) ( not ( = ?auto_151688 ?auto_151696 ) ) ( not ( = ?auto_151689 ?auto_151696 ) ) ( not ( = ?auto_151690 ?auto_151696 ) ) ( not ( = ?auto_151691 ?auto_151696 ) ) ( not ( = ?auto_151692 ?auto_151696 ) ) ( not ( = ?auto_151693 ?auto_151696 ) ) ( not ( = ?auto_151694 ?auto_151696 ) ) ( not ( = ?auto_151695 ?auto_151696 ) ) ( ON ?auto_151694 ?auto_151695 ) ( ON-TABLE ?auto_151696 ) ( ON ?auto_151693 ?auto_151694 ) ( ON ?auto_151692 ?auto_151693 ) ( ON ?auto_151691 ?auto_151692 ) ( ON ?auto_151690 ?auto_151691 ) ( ON ?auto_151689 ?auto_151690 ) ( ON ?auto_151688 ?auto_151689 ) ( CLEAR ?auto_151688 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_151696 ?auto_151695 ?auto_151694 ?auto_151693 ?auto_151692 ?auto_151691 ?auto_151690 ?auto_151689 )
      ( MAKE-5PILE ?auto_151688 ?auto_151689 ?auto_151690 ?auto_151691 ?auto_151692 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_151700 - BLOCK
      ?auto_151701 - BLOCK
      ?auto_151702 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_151702 ) ( CLEAR ?auto_151701 ) ( ON-TABLE ?auto_151700 ) ( ON ?auto_151701 ?auto_151700 ) ( not ( = ?auto_151700 ?auto_151701 ) ) ( not ( = ?auto_151700 ?auto_151702 ) ) ( not ( = ?auto_151701 ?auto_151702 ) ) )
    :subtasks
    ( ( !STACK ?auto_151702 ?auto_151701 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_151703 - BLOCK
      ?auto_151704 - BLOCK
      ?auto_151705 - BLOCK
    )
    :vars
    (
      ?auto_151706 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_151704 ) ( ON-TABLE ?auto_151703 ) ( ON ?auto_151704 ?auto_151703 ) ( not ( = ?auto_151703 ?auto_151704 ) ) ( not ( = ?auto_151703 ?auto_151705 ) ) ( not ( = ?auto_151704 ?auto_151705 ) ) ( ON ?auto_151705 ?auto_151706 ) ( CLEAR ?auto_151705 ) ( HAND-EMPTY ) ( not ( = ?auto_151703 ?auto_151706 ) ) ( not ( = ?auto_151704 ?auto_151706 ) ) ( not ( = ?auto_151705 ?auto_151706 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_151705 ?auto_151706 )
      ( MAKE-3PILE ?auto_151703 ?auto_151704 ?auto_151705 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_151707 - BLOCK
      ?auto_151708 - BLOCK
      ?auto_151709 - BLOCK
    )
    :vars
    (
      ?auto_151710 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151707 ) ( not ( = ?auto_151707 ?auto_151708 ) ) ( not ( = ?auto_151707 ?auto_151709 ) ) ( not ( = ?auto_151708 ?auto_151709 ) ) ( ON ?auto_151709 ?auto_151710 ) ( CLEAR ?auto_151709 ) ( not ( = ?auto_151707 ?auto_151710 ) ) ( not ( = ?auto_151708 ?auto_151710 ) ) ( not ( = ?auto_151709 ?auto_151710 ) ) ( HOLDING ?auto_151708 ) ( CLEAR ?auto_151707 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_151707 ?auto_151708 )
      ( MAKE-3PILE ?auto_151707 ?auto_151708 ?auto_151709 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_151711 - BLOCK
      ?auto_151712 - BLOCK
      ?auto_151713 - BLOCK
    )
    :vars
    (
      ?auto_151714 - BLOCK
      ?auto_151716 - BLOCK
      ?auto_151718 - BLOCK
      ?auto_151717 - BLOCK
      ?auto_151715 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151711 ) ( not ( = ?auto_151711 ?auto_151712 ) ) ( not ( = ?auto_151711 ?auto_151713 ) ) ( not ( = ?auto_151712 ?auto_151713 ) ) ( ON ?auto_151713 ?auto_151714 ) ( not ( = ?auto_151711 ?auto_151714 ) ) ( not ( = ?auto_151712 ?auto_151714 ) ) ( not ( = ?auto_151713 ?auto_151714 ) ) ( CLEAR ?auto_151711 ) ( ON ?auto_151712 ?auto_151713 ) ( CLEAR ?auto_151712 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_151716 ) ( ON ?auto_151718 ?auto_151716 ) ( ON ?auto_151717 ?auto_151718 ) ( ON ?auto_151715 ?auto_151717 ) ( ON ?auto_151714 ?auto_151715 ) ( not ( = ?auto_151716 ?auto_151718 ) ) ( not ( = ?auto_151716 ?auto_151717 ) ) ( not ( = ?auto_151716 ?auto_151715 ) ) ( not ( = ?auto_151716 ?auto_151714 ) ) ( not ( = ?auto_151716 ?auto_151713 ) ) ( not ( = ?auto_151716 ?auto_151712 ) ) ( not ( = ?auto_151718 ?auto_151717 ) ) ( not ( = ?auto_151718 ?auto_151715 ) ) ( not ( = ?auto_151718 ?auto_151714 ) ) ( not ( = ?auto_151718 ?auto_151713 ) ) ( not ( = ?auto_151718 ?auto_151712 ) ) ( not ( = ?auto_151717 ?auto_151715 ) ) ( not ( = ?auto_151717 ?auto_151714 ) ) ( not ( = ?auto_151717 ?auto_151713 ) ) ( not ( = ?auto_151717 ?auto_151712 ) ) ( not ( = ?auto_151715 ?auto_151714 ) ) ( not ( = ?auto_151715 ?auto_151713 ) ) ( not ( = ?auto_151715 ?auto_151712 ) ) ( not ( = ?auto_151711 ?auto_151716 ) ) ( not ( = ?auto_151711 ?auto_151718 ) ) ( not ( = ?auto_151711 ?auto_151717 ) ) ( not ( = ?auto_151711 ?auto_151715 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_151716 ?auto_151718 ?auto_151717 ?auto_151715 ?auto_151714 ?auto_151713 )
      ( MAKE-3PILE ?auto_151711 ?auto_151712 ?auto_151713 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_151719 - BLOCK
      ?auto_151720 - BLOCK
      ?auto_151721 - BLOCK
    )
    :vars
    (
      ?auto_151725 - BLOCK
      ?auto_151724 - BLOCK
      ?auto_151726 - BLOCK
      ?auto_151723 - BLOCK
      ?auto_151722 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151719 ?auto_151720 ) ) ( not ( = ?auto_151719 ?auto_151721 ) ) ( not ( = ?auto_151720 ?auto_151721 ) ) ( ON ?auto_151721 ?auto_151725 ) ( not ( = ?auto_151719 ?auto_151725 ) ) ( not ( = ?auto_151720 ?auto_151725 ) ) ( not ( = ?auto_151721 ?auto_151725 ) ) ( ON ?auto_151720 ?auto_151721 ) ( CLEAR ?auto_151720 ) ( ON-TABLE ?auto_151724 ) ( ON ?auto_151726 ?auto_151724 ) ( ON ?auto_151723 ?auto_151726 ) ( ON ?auto_151722 ?auto_151723 ) ( ON ?auto_151725 ?auto_151722 ) ( not ( = ?auto_151724 ?auto_151726 ) ) ( not ( = ?auto_151724 ?auto_151723 ) ) ( not ( = ?auto_151724 ?auto_151722 ) ) ( not ( = ?auto_151724 ?auto_151725 ) ) ( not ( = ?auto_151724 ?auto_151721 ) ) ( not ( = ?auto_151724 ?auto_151720 ) ) ( not ( = ?auto_151726 ?auto_151723 ) ) ( not ( = ?auto_151726 ?auto_151722 ) ) ( not ( = ?auto_151726 ?auto_151725 ) ) ( not ( = ?auto_151726 ?auto_151721 ) ) ( not ( = ?auto_151726 ?auto_151720 ) ) ( not ( = ?auto_151723 ?auto_151722 ) ) ( not ( = ?auto_151723 ?auto_151725 ) ) ( not ( = ?auto_151723 ?auto_151721 ) ) ( not ( = ?auto_151723 ?auto_151720 ) ) ( not ( = ?auto_151722 ?auto_151725 ) ) ( not ( = ?auto_151722 ?auto_151721 ) ) ( not ( = ?auto_151722 ?auto_151720 ) ) ( not ( = ?auto_151719 ?auto_151724 ) ) ( not ( = ?auto_151719 ?auto_151726 ) ) ( not ( = ?auto_151719 ?auto_151723 ) ) ( not ( = ?auto_151719 ?auto_151722 ) ) ( HOLDING ?auto_151719 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_151719 )
      ( MAKE-3PILE ?auto_151719 ?auto_151720 ?auto_151721 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_151727 - BLOCK
      ?auto_151728 - BLOCK
      ?auto_151729 - BLOCK
    )
    :vars
    (
      ?auto_151730 - BLOCK
      ?auto_151733 - BLOCK
      ?auto_151732 - BLOCK
      ?auto_151734 - BLOCK
      ?auto_151731 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151727 ?auto_151728 ) ) ( not ( = ?auto_151727 ?auto_151729 ) ) ( not ( = ?auto_151728 ?auto_151729 ) ) ( ON ?auto_151729 ?auto_151730 ) ( not ( = ?auto_151727 ?auto_151730 ) ) ( not ( = ?auto_151728 ?auto_151730 ) ) ( not ( = ?auto_151729 ?auto_151730 ) ) ( ON ?auto_151728 ?auto_151729 ) ( ON-TABLE ?auto_151733 ) ( ON ?auto_151732 ?auto_151733 ) ( ON ?auto_151734 ?auto_151732 ) ( ON ?auto_151731 ?auto_151734 ) ( ON ?auto_151730 ?auto_151731 ) ( not ( = ?auto_151733 ?auto_151732 ) ) ( not ( = ?auto_151733 ?auto_151734 ) ) ( not ( = ?auto_151733 ?auto_151731 ) ) ( not ( = ?auto_151733 ?auto_151730 ) ) ( not ( = ?auto_151733 ?auto_151729 ) ) ( not ( = ?auto_151733 ?auto_151728 ) ) ( not ( = ?auto_151732 ?auto_151734 ) ) ( not ( = ?auto_151732 ?auto_151731 ) ) ( not ( = ?auto_151732 ?auto_151730 ) ) ( not ( = ?auto_151732 ?auto_151729 ) ) ( not ( = ?auto_151732 ?auto_151728 ) ) ( not ( = ?auto_151734 ?auto_151731 ) ) ( not ( = ?auto_151734 ?auto_151730 ) ) ( not ( = ?auto_151734 ?auto_151729 ) ) ( not ( = ?auto_151734 ?auto_151728 ) ) ( not ( = ?auto_151731 ?auto_151730 ) ) ( not ( = ?auto_151731 ?auto_151729 ) ) ( not ( = ?auto_151731 ?auto_151728 ) ) ( not ( = ?auto_151727 ?auto_151733 ) ) ( not ( = ?auto_151727 ?auto_151732 ) ) ( not ( = ?auto_151727 ?auto_151734 ) ) ( not ( = ?auto_151727 ?auto_151731 ) ) ( ON ?auto_151727 ?auto_151728 ) ( CLEAR ?auto_151727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_151733 ?auto_151732 ?auto_151734 ?auto_151731 ?auto_151730 ?auto_151729 ?auto_151728 )
      ( MAKE-3PILE ?auto_151727 ?auto_151728 ?auto_151729 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_151735 - BLOCK
      ?auto_151736 - BLOCK
      ?auto_151737 - BLOCK
    )
    :vars
    (
      ?auto_151739 - BLOCK
      ?auto_151738 - BLOCK
      ?auto_151740 - BLOCK
      ?auto_151742 - BLOCK
      ?auto_151741 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151735 ?auto_151736 ) ) ( not ( = ?auto_151735 ?auto_151737 ) ) ( not ( = ?auto_151736 ?auto_151737 ) ) ( ON ?auto_151737 ?auto_151739 ) ( not ( = ?auto_151735 ?auto_151739 ) ) ( not ( = ?auto_151736 ?auto_151739 ) ) ( not ( = ?auto_151737 ?auto_151739 ) ) ( ON ?auto_151736 ?auto_151737 ) ( ON-TABLE ?auto_151738 ) ( ON ?auto_151740 ?auto_151738 ) ( ON ?auto_151742 ?auto_151740 ) ( ON ?auto_151741 ?auto_151742 ) ( ON ?auto_151739 ?auto_151741 ) ( not ( = ?auto_151738 ?auto_151740 ) ) ( not ( = ?auto_151738 ?auto_151742 ) ) ( not ( = ?auto_151738 ?auto_151741 ) ) ( not ( = ?auto_151738 ?auto_151739 ) ) ( not ( = ?auto_151738 ?auto_151737 ) ) ( not ( = ?auto_151738 ?auto_151736 ) ) ( not ( = ?auto_151740 ?auto_151742 ) ) ( not ( = ?auto_151740 ?auto_151741 ) ) ( not ( = ?auto_151740 ?auto_151739 ) ) ( not ( = ?auto_151740 ?auto_151737 ) ) ( not ( = ?auto_151740 ?auto_151736 ) ) ( not ( = ?auto_151742 ?auto_151741 ) ) ( not ( = ?auto_151742 ?auto_151739 ) ) ( not ( = ?auto_151742 ?auto_151737 ) ) ( not ( = ?auto_151742 ?auto_151736 ) ) ( not ( = ?auto_151741 ?auto_151739 ) ) ( not ( = ?auto_151741 ?auto_151737 ) ) ( not ( = ?auto_151741 ?auto_151736 ) ) ( not ( = ?auto_151735 ?auto_151738 ) ) ( not ( = ?auto_151735 ?auto_151740 ) ) ( not ( = ?auto_151735 ?auto_151742 ) ) ( not ( = ?auto_151735 ?auto_151741 ) ) ( HOLDING ?auto_151735 ) ( CLEAR ?auto_151736 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_151738 ?auto_151740 ?auto_151742 ?auto_151741 ?auto_151739 ?auto_151737 ?auto_151736 ?auto_151735 )
      ( MAKE-3PILE ?auto_151735 ?auto_151736 ?auto_151737 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_151743 - BLOCK
      ?auto_151744 - BLOCK
      ?auto_151745 - BLOCK
    )
    :vars
    (
      ?auto_151746 - BLOCK
      ?auto_151747 - BLOCK
      ?auto_151750 - BLOCK
      ?auto_151749 - BLOCK
      ?auto_151748 - BLOCK
      ?auto_151751 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151743 ?auto_151744 ) ) ( not ( = ?auto_151743 ?auto_151745 ) ) ( not ( = ?auto_151744 ?auto_151745 ) ) ( ON ?auto_151745 ?auto_151746 ) ( not ( = ?auto_151743 ?auto_151746 ) ) ( not ( = ?auto_151744 ?auto_151746 ) ) ( not ( = ?auto_151745 ?auto_151746 ) ) ( ON ?auto_151744 ?auto_151745 ) ( ON-TABLE ?auto_151747 ) ( ON ?auto_151750 ?auto_151747 ) ( ON ?auto_151749 ?auto_151750 ) ( ON ?auto_151748 ?auto_151749 ) ( ON ?auto_151746 ?auto_151748 ) ( not ( = ?auto_151747 ?auto_151750 ) ) ( not ( = ?auto_151747 ?auto_151749 ) ) ( not ( = ?auto_151747 ?auto_151748 ) ) ( not ( = ?auto_151747 ?auto_151746 ) ) ( not ( = ?auto_151747 ?auto_151745 ) ) ( not ( = ?auto_151747 ?auto_151744 ) ) ( not ( = ?auto_151750 ?auto_151749 ) ) ( not ( = ?auto_151750 ?auto_151748 ) ) ( not ( = ?auto_151750 ?auto_151746 ) ) ( not ( = ?auto_151750 ?auto_151745 ) ) ( not ( = ?auto_151750 ?auto_151744 ) ) ( not ( = ?auto_151749 ?auto_151748 ) ) ( not ( = ?auto_151749 ?auto_151746 ) ) ( not ( = ?auto_151749 ?auto_151745 ) ) ( not ( = ?auto_151749 ?auto_151744 ) ) ( not ( = ?auto_151748 ?auto_151746 ) ) ( not ( = ?auto_151748 ?auto_151745 ) ) ( not ( = ?auto_151748 ?auto_151744 ) ) ( not ( = ?auto_151743 ?auto_151747 ) ) ( not ( = ?auto_151743 ?auto_151750 ) ) ( not ( = ?auto_151743 ?auto_151749 ) ) ( not ( = ?auto_151743 ?auto_151748 ) ) ( CLEAR ?auto_151744 ) ( ON ?auto_151743 ?auto_151751 ) ( CLEAR ?auto_151743 ) ( HAND-EMPTY ) ( not ( = ?auto_151743 ?auto_151751 ) ) ( not ( = ?auto_151744 ?auto_151751 ) ) ( not ( = ?auto_151745 ?auto_151751 ) ) ( not ( = ?auto_151746 ?auto_151751 ) ) ( not ( = ?auto_151747 ?auto_151751 ) ) ( not ( = ?auto_151750 ?auto_151751 ) ) ( not ( = ?auto_151749 ?auto_151751 ) ) ( not ( = ?auto_151748 ?auto_151751 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_151743 ?auto_151751 )
      ( MAKE-3PILE ?auto_151743 ?auto_151744 ?auto_151745 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_151752 - BLOCK
      ?auto_151753 - BLOCK
      ?auto_151754 - BLOCK
    )
    :vars
    (
      ?auto_151760 - BLOCK
      ?auto_151755 - BLOCK
      ?auto_151757 - BLOCK
      ?auto_151759 - BLOCK
      ?auto_151756 - BLOCK
      ?auto_151758 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151752 ?auto_151753 ) ) ( not ( = ?auto_151752 ?auto_151754 ) ) ( not ( = ?auto_151753 ?auto_151754 ) ) ( ON ?auto_151754 ?auto_151760 ) ( not ( = ?auto_151752 ?auto_151760 ) ) ( not ( = ?auto_151753 ?auto_151760 ) ) ( not ( = ?auto_151754 ?auto_151760 ) ) ( ON-TABLE ?auto_151755 ) ( ON ?auto_151757 ?auto_151755 ) ( ON ?auto_151759 ?auto_151757 ) ( ON ?auto_151756 ?auto_151759 ) ( ON ?auto_151760 ?auto_151756 ) ( not ( = ?auto_151755 ?auto_151757 ) ) ( not ( = ?auto_151755 ?auto_151759 ) ) ( not ( = ?auto_151755 ?auto_151756 ) ) ( not ( = ?auto_151755 ?auto_151760 ) ) ( not ( = ?auto_151755 ?auto_151754 ) ) ( not ( = ?auto_151755 ?auto_151753 ) ) ( not ( = ?auto_151757 ?auto_151759 ) ) ( not ( = ?auto_151757 ?auto_151756 ) ) ( not ( = ?auto_151757 ?auto_151760 ) ) ( not ( = ?auto_151757 ?auto_151754 ) ) ( not ( = ?auto_151757 ?auto_151753 ) ) ( not ( = ?auto_151759 ?auto_151756 ) ) ( not ( = ?auto_151759 ?auto_151760 ) ) ( not ( = ?auto_151759 ?auto_151754 ) ) ( not ( = ?auto_151759 ?auto_151753 ) ) ( not ( = ?auto_151756 ?auto_151760 ) ) ( not ( = ?auto_151756 ?auto_151754 ) ) ( not ( = ?auto_151756 ?auto_151753 ) ) ( not ( = ?auto_151752 ?auto_151755 ) ) ( not ( = ?auto_151752 ?auto_151757 ) ) ( not ( = ?auto_151752 ?auto_151759 ) ) ( not ( = ?auto_151752 ?auto_151756 ) ) ( ON ?auto_151752 ?auto_151758 ) ( CLEAR ?auto_151752 ) ( not ( = ?auto_151752 ?auto_151758 ) ) ( not ( = ?auto_151753 ?auto_151758 ) ) ( not ( = ?auto_151754 ?auto_151758 ) ) ( not ( = ?auto_151760 ?auto_151758 ) ) ( not ( = ?auto_151755 ?auto_151758 ) ) ( not ( = ?auto_151757 ?auto_151758 ) ) ( not ( = ?auto_151759 ?auto_151758 ) ) ( not ( = ?auto_151756 ?auto_151758 ) ) ( HOLDING ?auto_151753 ) ( CLEAR ?auto_151754 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_151755 ?auto_151757 ?auto_151759 ?auto_151756 ?auto_151760 ?auto_151754 ?auto_151753 )
      ( MAKE-3PILE ?auto_151752 ?auto_151753 ?auto_151754 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_151761 - BLOCK
      ?auto_151762 - BLOCK
      ?auto_151763 - BLOCK
    )
    :vars
    (
      ?auto_151765 - BLOCK
      ?auto_151766 - BLOCK
      ?auto_151764 - BLOCK
      ?auto_151768 - BLOCK
      ?auto_151767 - BLOCK
      ?auto_151769 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151761 ?auto_151762 ) ) ( not ( = ?auto_151761 ?auto_151763 ) ) ( not ( = ?auto_151762 ?auto_151763 ) ) ( ON ?auto_151763 ?auto_151765 ) ( not ( = ?auto_151761 ?auto_151765 ) ) ( not ( = ?auto_151762 ?auto_151765 ) ) ( not ( = ?auto_151763 ?auto_151765 ) ) ( ON-TABLE ?auto_151766 ) ( ON ?auto_151764 ?auto_151766 ) ( ON ?auto_151768 ?auto_151764 ) ( ON ?auto_151767 ?auto_151768 ) ( ON ?auto_151765 ?auto_151767 ) ( not ( = ?auto_151766 ?auto_151764 ) ) ( not ( = ?auto_151766 ?auto_151768 ) ) ( not ( = ?auto_151766 ?auto_151767 ) ) ( not ( = ?auto_151766 ?auto_151765 ) ) ( not ( = ?auto_151766 ?auto_151763 ) ) ( not ( = ?auto_151766 ?auto_151762 ) ) ( not ( = ?auto_151764 ?auto_151768 ) ) ( not ( = ?auto_151764 ?auto_151767 ) ) ( not ( = ?auto_151764 ?auto_151765 ) ) ( not ( = ?auto_151764 ?auto_151763 ) ) ( not ( = ?auto_151764 ?auto_151762 ) ) ( not ( = ?auto_151768 ?auto_151767 ) ) ( not ( = ?auto_151768 ?auto_151765 ) ) ( not ( = ?auto_151768 ?auto_151763 ) ) ( not ( = ?auto_151768 ?auto_151762 ) ) ( not ( = ?auto_151767 ?auto_151765 ) ) ( not ( = ?auto_151767 ?auto_151763 ) ) ( not ( = ?auto_151767 ?auto_151762 ) ) ( not ( = ?auto_151761 ?auto_151766 ) ) ( not ( = ?auto_151761 ?auto_151764 ) ) ( not ( = ?auto_151761 ?auto_151768 ) ) ( not ( = ?auto_151761 ?auto_151767 ) ) ( ON ?auto_151761 ?auto_151769 ) ( not ( = ?auto_151761 ?auto_151769 ) ) ( not ( = ?auto_151762 ?auto_151769 ) ) ( not ( = ?auto_151763 ?auto_151769 ) ) ( not ( = ?auto_151765 ?auto_151769 ) ) ( not ( = ?auto_151766 ?auto_151769 ) ) ( not ( = ?auto_151764 ?auto_151769 ) ) ( not ( = ?auto_151768 ?auto_151769 ) ) ( not ( = ?auto_151767 ?auto_151769 ) ) ( CLEAR ?auto_151763 ) ( ON ?auto_151762 ?auto_151761 ) ( CLEAR ?auto_151762 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_151769 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_151769 ?auto_151761 )
      ( MAKE-3PILE ?auto_151761 ?auto_151762 ?auto_151763 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_151770 - BLOCK
      ?auto_151771 - BLOCK
      ?auto_151772 - BLOCK
    )
    :vars
    (
      ?auto_151775 - BLOCK
      ?auto_151773 - BLOCK
      ?auto_151776 - BLOCK
      ?auto_151777 - BLOCK
      ?auto_151774 - BLOCK
      ?auto_151778 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151770 ?auto_151771 ) ) ( not ( = ?auto_151770 ?auto_151772 ) ) ( not ( = ?auto_151771 ?auto_151772 ) ) ( not ( = ?auto_151770 ?auto_151775 ) ) ( not ( = ?auto_151771 ?auto_151775 ) ) ( not ( = ?auto_151772 ?auto_151775 ) ) ( ON-TABLE ?auto_151773 ) ( ON ?auto_151776 ?auto_151773 ) ( ON ?auto_151777 ?auto_151776 ) ( ON ?auto_151774 ?auto_151777 ) ( ON ?auto_151775 ?auto_151774 ) ( not ( = ?auto_151773 ?auto_151776 ) ) ( not ( = ?auto_151773 ?auto_151777 ) ) ( not ( = ?auto_151773 ?auto_151774 ) ) ( not ( = ?auto_151773 ?auto_151775 ) ) ( not ( = ?auto_151773 ?auto_151772 ) ) ( not ( = ?auto_151773 ?auto_151771 ) ) ( not ( = ?auto_151776 ?auto_151777 ) ) ( not ( = ?auto_151776 ?auto_151774 ) ) ( not ( = ?auto_151776 ?auto_151775 ) ) ( not ( = ?auto_151776 ?auto_151772 ) ) ( not ( = ?auto_151776 ?auto_151771 ) ) ( not ( = ?auto_151777 ?auto_151774 ) ) ( not ( = ?auto_151777 ?auto_151775 ) ) ( not ( = ?auto_151777 ?auto_151772 ) ) ( not ( = ?auto_151777 ?auto_151771 ) ) ( not ( = ?auto_151774 ?auto_151775 ) ) ( not ( = ?auto_151774 ?auto_151772 ) ) ( not ( = ?auto_151774 ?auto_151771 ) ) ( not ( = ?auto_151770 ?auto_151773 ) ) ( not ( = ?auto_151770 ?auto_151776 ) ) ( not ( = ?auto_151770 ?auto_151777 ) ) ( not ( = ?auto_151770 ?auto_151774 ) ) ( ON ?auto_151770 ?auto_151778 ) ( not ( = ?auto_151770 ?auto_151778 ) ) ( not ( = ?auto_151771 ?auto_151778 ) ) ( not ( = ?auto_151772 ?auto_151778 ) ) ( not ( = ?auto_151775 ?auto_151778 ) ) ( not ( = ?auto_151773 ?auto_151778 ) ) ( not ( = ?auto_151776 ?auto_151778 ) ) ( not ( = ?auto_151777 ?auto_151778 ) ) ( not ( = ?auto_151774 ?auto_151778 ) ) ( ON ?auto_151771 ?auto_151770 ) ( CLEAR ?auto_151771 ) ( ON-TABLE ?auto_151778 ) ( HOLDING ?auto_151772 ) ( CLEAR ?auto_151775 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_151773 ?auto_151776 ?auto_151777 ?auto_151774 ?auto_151775 ?auto_151772 )
      ( MAKE-3PILE ?auto_151770 ?auto_151771 ?auto_151772 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_151779 - BLOCK
      ?auto_151780 - BLOCK
      ?auto_151781 - BLOCK
    )
    :vars
    (
      ?auto_151785 - BLOCK
      ?auto_151786 - BLOCK
      ?auto_151782 - BLOCK
      ?auto_151787 - BLOCK
      ?auto_151783 - BLOCK
      ?auto_151784 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151779 ?auto_151780 ) ) ( not ( = ?auto_151779 ?auto_151781 ) ) ( not ( = ?auto_151780 ?auto_151781 ) ) ( not ( = ?auto_151779 ?auto_151785 ) ) ( not ( = ?auto_151780 ?auto_151785 ) ) ( not ( = ?auto_151781 ?auto_151785 ) ) ( ON-TABLE ?auto_151786 ) ( ON ?auto_151782 ?auto_151786 ) ( ON ?auto_151787 ?auto_151782 ) ( ON ?auto_151783 ?auto_151787 ) ( ON ?auto_151785 ?auto_151783 ) ( not ( = ?auto_151786 ?auto_151782 ) ) ( not ( = ?auto_151786 ?auto_151787 ) ) ( not ( = ?auto_151786 ?auto_151783 ) ) ( not ( = ?auto_151786 ?auto_151785 ) ) ( not ( = ?auto_151786 ?auto_151781 ) ) ( not ( = ?auto_151786 ?auto_151780 ) ) ( not ( = ?auto_151782 ?auto_151787 ) ) ( not ( = ?auto_151782 ?auto_151783 ) ) ( not ( = ?auto_151782 ?auto_151785 ) ) ( not ( = ?auto_151782 ?auto_151781 ) ) ( not ( = ?auto_151782 ?auto_151780 ) ) ( not ( = ?auto_151787 ?auto_151783 ) ) ( not ( = ?auto_151787 ?auto_151785 ) ) ( not ( = ?auto_151787 ?auto_151781 ) ) ( not ( = ?auto_151787 ?auto_151780 ) ) ( not ( = ?auto_151783 ?auto_151785 ) ) ( not ( = ?auto_151783 ?auto_151781 ) ) ( not ( = ?auto_151783 ?auto_151780 ) ) ( not ( = ?auto_151779 ?auto_151786 ) ) ( not ( = ?auto_151779 ?auto_151782 ) ) ( not ( = ?auto_151779 ?auto_151787 ) ) ( not ( = ?auto_151779 ?auto_151783 ) ) ( ON ?auto_151779 ?auto_151784 ) ( not ( = ?auto_151779 ?auto_151784 ) ) ( not ( = ?auto_151780 ?auto_151784 ) ) ( not ( = ?auto_151781 ?auto_151784 ) ) ( not ( = ?auto_151785 ?auto_151784 ) ) ( not ( = ?auto_151786 ?auto_151784 ) ) ( not ( = ?auto_151782 ?auto_151784 ) ) ( not ( = ?auto_151787 ?auto_151784 ) ) ( not ( = ?auto_151783 ?auto_151784 ) ) ( ON ?auto_151780 ?auto_151779 ) ( ON-TABLE ?auto_151784 ) ( CLEAR ?auto_151785 ) ( ON ?auto_151781 ?auto_151780 ) ( CLEAR ?auto_151781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_151784 ?auto_151779 ?auto_151780 )
      ( MAKE-3PILE ?auto_151779 ?auto_151780 ?auto_151781 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_151788 - BLOCK
      ?auto_151789 - BLOCK
      ?auto_151790 - BLOCK
    )
    :vars
    (
      ?auto_151795 - BLOCK
      ?auto_151791 - BLOCK
      ?auto_151794 - BLOCK
      ?auto_151792 - BLOCK
      ?auto_151796 - BLOCK
      ?auto_151793 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151788 ?auto_151789 ) ) ( not ( = ?auto_151788 ?auto_151790 ) ) ( not ( = ?auto_151789 ?auto_151790 ) ) ( not ( = ?auto_151788 ?auto_151795 ) ) ( not ( = ?auto_151789 ?auto_151795 ) ) ( not ( = ?auto_151790 ?auto_151795 ) ) ( ON-TABLE ?auto_151791 ) ( ON ?auto_151794 ?auto_151791 ) ( ON ?auto_151792 ?auto_151794 ) ( ON ?auto_151796 ?auto_151792 ) ( not ( = ?auto_151791 ?auto_151794 ) ) ( not ( = ?auto_151791 ?auto_151792 ) ) ( not ( = ?auto_151791 ?auto_151796 ) ) ( not ( = ?auto_151791 ?auto_151795 ) ) ( not ( = ?auto_151791 ?auto_151790 ) ) ( not ( = ?auto_151791 ?auto_151789 ) ) ( not ( = ?auto_151794 ?auto_151792 ) ) ( not ( = ?auto_151794 ?auto_151796 ) ) ( not ( = ?auto_151794 ?auto_151795 ) ) ( not ( = ?auto_151794 ?auto_151790 ) ) ( not ( = ?auto_151794 ?auto_151789 ) ) ( not ( = ?auto_151792 ?auto_151796 ) ) ( not ( = ?auto_151792 ?auto_151795 ) ) ( not ( = ?auto_151792 ?auto_151790 ) ) ( not ( = ?auto_151792 ?auto_151789 ) ) ( not ( = ?auto_151796 ?auto_151795 ) ) ( not ( = ?auto_151796 ?auto_151790 ) ) ( not ( = ?auto_151796 ?auto_151789 ) ) ( not ( = ?auto_151788 ?auto_151791 ) ) ( not ( = ?auto_151788 ?auto_151794 ) ) ( not ( = ?auto_151788 ?auto_151792 ) ) ( not ( = ?auto_151788 ?auto_151796 ) ) ( ON ?auto_151788 ?auto_151793 ) ( not ( = ?auto_151788 ?auto_151793 ) ) ( not ( = ?auto_151789 ?auto_151793 ) ) ( not ( = ?auto_151790 ?auto_151793 ) ) ( not ( = ?auto_151795 ?auto_151793 ) ) ( not ( = ?auto_151791 ?auto_151793 ) ) ( not ( = ?auto_151794 ?auto_151793 ) ) ( not ( = ?auto_151792 ?auto_151793 ) ) ( not ( = ?auto_151796 ?auto_151793 ) ) ( ON ?auto_151789 ?auto_151788 ) ( ON-TABLE ?auto_151793 ) ( ON ?auto_151790 ?auto_151789 ) ( CLEAR ?auto_151790 ) ( HOLDING ?auto_151795 ) ( CLEAR ?auto_151796 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_151791 ?auto_151794 ?auto_151792 ?auto_151796 ?auto_151795 )
      ( MAKE-3PILE ?auto_151788 ?auto_151789 ?auto_151790 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_151797 - BLOCK
      ?auto_151798 - BLOCK
      ?auto_151799 - BLOCK
    )
    :vars
    (
      ?auto_151800 - BLOCK
      ?auto_151804 - BLOCK
      ?auto_151803 - BLOCK
      ?auto_151801 - BLOCK
      ?auto_151805 - BLOCK
      ?auto_151802 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151797 ?auto_151798 ) ) ( not ( = ?auto_151797 ?auto_151799 ) ) ( not ( = ?auto_151798 ?auto_151799 ) ) ( not ( = ?auto_151797 ?auto_151800 ) ) ( not ( = ?auto_151798 ?auto_151800 ) ) ( not ( = ?auto_151799 ?auto_151800 ) ) ( ON-TABLE ?auto_151804 ) ( ON ?auto_151803 ?auto_151804 ) ( ON ?auto_151801 ?auto_151803 ) ( ON ?auto_151805 ?auto_151801 ) ( not ( = ?auto_151804 ?auto_151803 ) ) ( not ( = ?auto_151804 ?auto_151801 ) ) ( not ( = ?auto_151804 ?auto_151805 ) ) ( not ( = ?auto_151804 ?auto_151800 ) ) ( not ( = ?auto_151804 ?auto_151799 ) ) ( not ( = ?auto_151804 ?auto_151798 ) ) ( not ( = ?auto_151803 ?auto_151801 ) ) ( not ( = ?auto_151803 ?auto_151805 ) ) ( not ( = ?auto_151803 ?auto_151800 ) ) ( not ( = ?auto_151803 ?auto_151799 ) ) ( not ( = ?auto_151803 ?auto_151798 ) ) ( not ( = ?auto_151801 ?auto_151805 ) ) ( not ( = ?auto_151801 ?auto_151800 ) ) ( not ( = ?auto_151801 ?auto_151799 ) ) ( not ( = ?auto_151801 ?auto_151798 ) ) ( not ( = ?auto_151805 ?auto_151800 ) ) ( not ( = ?auto_151805 ?auto_151799 ) ) ( not ( = ?auto_151805 ?auto_151798 ) ) ( not ( = ?auto_151797 ?auto_151804 ) ) ( not ( = ?auto_151797 ?auto_151803 ) ) ( not ( = ?auto_151797 ?auto_151801 ) ) ( not ( = ?auto_151797 ?auto_151805 ) ) ( ON ?auto_151797 ?auto_151802 ) ( not ( = ?auto_151797 ?auto_151802 ) ) ( not ( = ?auto_151798 ?auto_151802 ) ) ( not ( = ?auto_151799 ?auto_151802 ) ) ( not ( = ?auto_151800 ?auto_151802 ) ) ( not ( = ?auto_151804 ?auto_151802 ) ) ( not ( = ?auto_151803 ?auto_151802 ) ) ( not ( = ?auto_151801 ?auto_151802 ) ) ( not ( = ?auto_151805 ?auto_151802 ) ) ( ON ?auto_151798 ?auto_151797 ) ( ON-TABLE ?auto_151802 ) ( ON ?auto_151799 ?auto_151798 ) ( CLEAR ?auto_151805 ) ( ON ?auto_151800 ?auto_151799 ) ( CLEAR ?auto_151800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_151802 ?auto_151797 ?auto_151798 ?auto_151799 )
      ( MAKE-3PILE ?auto_151797 ?auto_151798 ?auto_151799 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_151806 - BLOCK
      ?auto_151807 - BLOCK
      ?auto_151808 - BLOCK
    )
    :vars
    (
      ?auto_151810 - BLOCK
      ?auto_151813 - BLOCK
      ?auto_151811 - BLOCK
      ?auto_151812 - BLOCK
      ?auto_151809 - BLOCK
      ?auto_151814 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151806 ?auto_151807 ) ) ( not ( = ?auto_151806 ?auto_151808 ) ) ( not ( = ?auto_151807 ?auto_151808 ) ) ( not ( = ?auto_151806 ?auto_151810 ) ) ( not ( = ?auto_151807 ?auto_151810 ) ) ( not ( = ?auto_151808 ?auto_151810 ) ) ( ON-TABLE ?auto_151813 ) ( ON ?auto_151811 ?auto_151813 ) ( ON ?auto_151812 ?auto_151811 ) ( not ( = ?auto_151813 ?auto_151811 ) ) ( not ( = ?auto_151813 ?auto_151812 ) ) ( not ( = ?auto_151813 ?auto_151809 ) ) ( not ( = ?auto_151813 ?auto_151810 ) ) ( not ( = ?auto_151813 ?auto_151808 ) ) ( not ( = ?auto_151813 ?auto_151807 ) ) ( not ( = ?auto_151811 ?auto_151812 ) ) ( not ( = ?auto_151811 ?auto_151809 ) ) ( not ( = ?auto_151811 ?auto_151810 ) ) ( not ( = ?auto_151811 ?auto_151808 ) ) ( not ( = ?auto_151811 ?auto_151807 ) ) ( not ( = ?auto_151812 ?auto_151809 ) ) ( not ( = ?auto_151812 ?auto_151810 ) ) ( not ( = ?auto_151812 ?auto_151808 ) ) ( not ( = ?auto_151812 ?auto_151807 ) ) ( not ( = ?auto_151809 ?auto_151810 ) ) ( not ( = ?auto_151809 ?auto_151808 ) ) ( not ( = ?auto_151809 ?auto_151807 ) ) ( not ( = ?auto_151806 ?auto_151813 ) ) ( not ( = ?auto_151806 ?auto_151811 ) ) ( not ( = ?auto_151806 ?auto_151812 ) ) ( not ( = ?auto_151806 ?auto_151809 ) ) ( ON ?auto_151806 ?auto_151814 ) ( not ( = ?auto_151806 ?auto_151814 ) ) ( not ( = ?auto_151807 ?auto_151814 ) ) ( not ( = ?auto_151808 ?auto_151814 ) ) ( not ( = ?auto_151810 ?auto_151814 ) ) ( not ( = ?auto_151813 ?auto_151814 ) ) ( not ( = ?auto_151811 ?auto_151814 ) ) ( not ( = ?auto_151812 ?auto_151814 ) ) ( not ( = ?auto_151809 ?auto_151814 ) ) ( ON ?auto_151807 ?auto_151806 ) ( ON-TABLE ?auto_151814 ) ( ON ?auto_151808 ?auto_151807 ) ( ON ?auto_151810 ?auto_151808 ) ( CLEAR ?auto_151810 ) ( HOLDING ?auto_151809 ) ( CLEAR ?auto_151812 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_151813 ?auto_151811 ?auto_151812 ?auto_151809 )
      ( MAKE-3PILE ?auto_151806 ?auto_151807 ?auto_151808 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_151815 - BLOCK
      ?auto_151816 - BLOCK
      ?auto_151817 - BLOCK
    )
    :vars
    (
      ?auto_151820 - BLOCK
      ?auto_151818 - BLOCK
      ?auto_151819 - BLOCK
      ?auto_151823 - BLOCK
      ?auto_151821 - BLOCK
      ?auto_151822 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151815 ?auto_151816 ) ) ( not ( = ?auto_151815 ?auto_151817 ) ) ( not ( = ?auto_151816 ?auto_151817 ) ) ( not ( = ?auto_151815 ?auto_151820 ) ) ( not ( = ?auto_151816 ?auto_151820 ) ) ( not ( = ?auto_151817 ?auto_151820 ) ) ( ON-TABLE ?auto_151818 ) ( ON ?auto_151819 ?auto_151818 ) ( ON ?auto_151823 ?auto_151819 ) ( not ( = ?auto_151818 ?auto_151819 ) ) ( not ( = ?auto_151818 ?auto_151823 ) ) ( not ( = ?auto_151818 ?auto_151821 ) ) ( not ( = ?auto_151818 ?auto_151820 ) ) ( not ( = ?auto_151818 ?auto_151817 ) ) ( not ( = ?auto_151818 ?auto_151816 ) ) ( not ( = ?auto_151819 ?auto_151823 ) ) ( not ( = ?auto_151819 ?auto_151821 ) ) ( not ( = ?auto_151819 ?auto_151820 ) ) ( not ( = ?auto_151819 ?auto_151817 ) ) ( not ( = ?auto_151819 ?auto_151816 ) ) ( not ( = ?auto_151823 ?auto_151821 ) ) ( not ( = ?auto_151823 ?auto_151820 ) ) ( not ( = ?auto_151823 ?auto_151817 ) ) ( not ( = ?auto_151823 ?auto_151816 ) ) ( not ( = ?auto_151821 ?auto_151820 ) ) ( not ( = ?auto_151821 ?auto_151817 ) ) ( not ( = ?auto_151821 ?auto_151816 ) ) ( not ( = ?auto_151815 ?auto_151818 ) ) ( not ( = ?auto_151815 ?auto_151819 ) ) ( not ( = ?auto_151815 ?auto_151823 ) ) ( not ( = ?auto_151815 ?auto_151821 ) ) ( ON ?auto_151815 ?auto_151822 ) ( not ( = ?auto_151815 ?auto_151822 ) ) ( not ( = ?auto_151816 ?auto_151822 ) ) ( not ( = ?auto_151817 ?auto_151822 ) ) ( not ( = ?auto_151820 ?auto_151822 ) ) ( not ( = ?auto_151818 ?auto_151822 ) ) ( not ( = ?auto_151819 ?auto_151822 ) ) ( not ( = ?auto_151823 ?auto_151822 ) ) ( not ( = ?auto_151821 ?auto_151822 ) ) ( ON ?auto_151816 ?auto_151815 ) ( ON-TABLE ?auto_151822 ) ( ON ?auto_151817 ?auto_151816 ) ( ON ?auto_151820 ?auto_151817 ) ( CLEAR ?auto_151823 ) ( ON ?auto_151821 ?auto_151820 ) ( CLEAR ?auto_151821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_151822 ?auto_151815 ?auto_151816 ?auto_151817 ?auto_151820 )
      ( MAKE-3PILE ?auto_151815 ?auto_151816 ?auto_151817 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_151824 - BLOCK
      ?auto_151825 - BLOCK
      ?auto_151826 - BLOCK
    )
    :vars
    (
      ?auto_151827 - BLOCK
      ?auto_151831 - BLOCK
      ?auto_151829 - BLOCK
      ?auto_151828 - BLOCK
      ?auto_151832 - BLOCK
      ?auto_151830 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151824 ?auto_151825 ) ) ( not ( = ?auto_151824 ?auto_151826 ) ) ( not ( = ?auto_151825 ?auto_151826 ) ) ( not ( = ?auto_151824 ?auto_151827 ) ) ( not ( = ?auto_151825 ?auto_151827 ) ) ( not ( = ?auto_151826 ?auto_151827 ) ) ( ON-TABLE ?auto_151831 ) ( ON ?auto_151829 ?auto_151831 ) ( not ( = ?auto_151831 ?auto_151829 ) ) ( not ( = ?auto_151831 ?auto_151828 ) ) ( not ( = ?auto_151831 ?auto_151832 ) ) ( not ( = ?auto_151831 ?auto_151827 ) ) ( not ( = ?auto_151831 ?auto_151826 ) ) ( not ( = ?auto_151831 ?auto_151825 ) ) ( not ( = ?auto_151829 ?auto_151828 ) ) ( not ( = ?auto_151829 ?auto_151832 ) ) ( not ( = ?auto_151829 ?auto_151827 ) ) ( not ( = ?auto_151829 ?auto_151826 ) ) ( not ( = ?auto_151829 ?auto_151825 ) ) ( not ( = ?auto_151828 ?auto_151832 ) ) ( not ( = ?auto_151828 ?auto_151827 ) ) ( not ( = ?auto_151828 ?auto_151826 ) ) ( not ( = ?auto_151828 ?auto_151825 ) ) ( not ( = ?auto_151832 ?auto_151827 ) ) ( not ( = ?auto_151832 ?auto_151826 ) ) ( not ( = ?auto_151832 ?auto_151825 ) ) ( not ( = ?auto_151824 ?auto_151831 ) ) ( not ( = ?auto_151824 ?auto_151829 ) ) ( not ( = ?auto_151824 ?auto_151828 ) ) ( not ( = ?auto_151824 ?auto_151832 ) ) ( ON ?auto_151824 ?auto_151830 ) ( not ( = ?auto_151824 ?auto_151830 ) ) ( not ( = ?auto_151825 ?auto_151830 ) ) ( not ( = ?auto_151826 ?auto_151830 ) ) ( not ( = ?auto_151827 ?auto_151830 ) ) ( not ( = ?auto_151831 ?auto_151830 ) ) ( not ( = ?auto_151829 ?auto_151830 ) ) ( not ( = ?auto_151828 ?auto_151830 ) ) ( not ( = ?auto_151832 ?auto_151830 ) ) ( ON ?auto_151825 ?auto_151824 ) ( ON-TABLE ?auto_151830 ) ( ON ?auto_151826 ?auto_151825 ) ( ON ?auto_151827 ?auto_151826 ) ( ON ?auto_151832 ?auto_151827 ) ( CLEAR ?auto_151832 ) ( HOLDING ?auto_151828 ) ( CLEAR ?auto_151829 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_151831 ?auto_151829 ?auto_151828 )
      ( MAKE-3PILE ?auto_151824 ?auto_151825 ?auto_151826 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_151833 - BLOCK
      ?auto_151834 - BLOCK
      ?auto_151835 - BLOCK
    )
    :vars
    (
      ?auto_151836 - BLOCK
      ?auto_151838 - BLOCK
      ?auto_151841 - BLOCK
      ?auto_151837 - BLOCK
      ?auto_151840 - BLOCK
      ?auto_151839 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151833 ?auto_151834 ) ) ( not ( = ?auto_151833 ?auto_151835 ) ) ( not ( = ?auto_151834 ?auto_151835 ) ) ( not ( = ?auto_151833 ?auto_151836 ) ) ( not ( = ?auto_151834 ?auto_151836 ) ) ( not ( = ?auto_151835 ?auto_151836 ) ) ( ON-TABLE ?auto_151838 ) ( ON ?auto_151841 ?auto_151838 ) ( not ( = ?auto_151838 ?auto_151841 ) ) ( not ( = ?auto_151838 ?auto_151837 ) ) ( not ( = ?auto_151838 ?auto_151840 ) ) ( not ( = ?auto_151838 ?auto_151836 ) ) ( not ( = ?auto_151838 ?auto_151835 ) ) ( not ( = ?auto_151838 ?auto_151834 ) ) ( not ( = ?auto_151841 ?auto_151837 ) ) ( not ( = ?auto_151841 ?auto_151840 ) ) ( not ( = ?auto_151841 ?auto_151836 ) ) ( not ( = ?auto_151841 ?auto_151835 ) ) ( not ( = ?auto_151841 ?auto_151834 ) ) ( not ( = ?auto_151837 ?auto_151840 ) ) ( not ( = ?auto_151837 ?auto_151836 ) ) ( not ( = ?auto_151837 ?auto_151835 ) ) ( not ( = ?auto_151837 ?auto_151834 ) ) ( not ( = ?auto_151840 ?auto_151836 ) ) ( not ( = ?auto_151840 ?auto_151835 ) ) ( not ( = ?auto_151840 ?auto_151834 ) ) ( not ( = ?auto_151833 ?auto_151838 ) ) ( not ( = ?auto_151833 ?auto_151841 ) ) ( not ( = ?auto_151833 ?auto_151837 ) ) ( not ( = ?auto_151833 ?auto_151840 ) ) ( ON ?auto_151833 ?auto_151839 ) ( not ( = ?auto_151833 ?auto_151839 ) ) ( not ( = ?auto_151834 ?auto_151839 ) ) ( not ( = ?auto_151835 ?auto_151839 ) ) ( not ( = ?auto_151836 ?auto_151839 ) ) ( not ( = ?auto_151838 ?auto_151839 ) ) ( not ( = ?auto_151841 ?auto_151839 ) ) ( not ( = ?auto_151837 ?auto_151839 ) ) ( not ( = ?auto_151840 ?auto_151839 ) ) ( ON ?auto_151834 ?auto_151833 ) ( ON-TABLE ?auto_151839 ) ( ON ?auto_151835 ?auto_151834 ) ( ON ?auto_151836 ?auto_151835 ) ( ON ?auto_151840 ?auto_151836 ) ( CLEAR ?auto_151841 ) ( ON ?auto_151837 ?auto_151840 ) ( CLEAR ?auto_151837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_151839 ?auto_151833 ?auto_151834 ?auto_151835 ?auto_151836 ?auto_151840 )
      ( MAKE-3PILE ?auto_151833 ?auto_151834 ?auto_151835 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_151842 - BLOCK
      ?auto_151843 - BLOCK
      ?auto_151844 - BLOCK
    )
    :vars
    (
      ?auto_151849 - BLOCK
      ?auto_151846 - BLOCK
      ?auto_151845 - BLOCK
      ?auto_151848 - BLOCK
      ?auto_151850 - BLOCK
      ?auto_151847 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151842 ?auto_151843 ) ) ( not ( = ?auto_151842 ?auto_151844 ) ) ( not ( = ?auto_151843 ?auto_151844 ) ) ( not ( = ?auto_151842 ?auto_151849 ) ) ( not ( = ?auto_151843 ?auto_151849 ) ) ( not ( = ?auto_151844 ?auto_151849 ) ) ( ON-TABLE ?auto_151846 ) ( not ( = ?auto_151846 ?auto_151845 ) ) ( not ( = ?auto_151846 ?auto_151848 ) ) ( not ( = ?auto_151846 ?auto_151850 ) ) ( not ( = ?auto_151846 ?auto_151849 ) ) ( not ( = ?auto_151846 ?auto_151844 ) ) ( not ( = ?auto_151846 ?auto_151843 ) ) ( not ( = ?auto_151845 ?auto_151848 ) ) ( not ( = ?auto_151845 ?auto_151850 ) ) ( not ( = ?auto_151845 ?auto_151849 ) ) ( not ( = ?auto_151845 ?auto_151844 ) ) ( not ( = ?auto_151845 ?auto_151843 ) ) ( not ( = ?auto_151848 ?auto_151850 ) ) ( not ( = ?auto_151848 ?auto_151849 ) ) ( not ( = ?auto_151848 ?auto_151844 ) ) ( not ( = ?auto_151848 ?auto_151843 ) ) ( not ( = ?auto_151850 ?auto_151849 ) ) ( not ( = ?auto_151850 ?auto_151844 ) ) ( not ( = ?auto_151850 ?auto_151843 ) ) ( not ( = ?auto_151842 ?auto_151846 ) ) ( not ( = ?auto_151842 ?auto_151845 ) ) ( not ( = ?auto_151842 ?auto_151848 ) ) ( not ( = ?auto_151842 ?auto_151850 ) ) ( ON ?auto_151842 ?auto_151847 ) ( not ( = ?auto_151842 ?auto_151847 ) ) ( not ( = ?auto_151843 ?auto_151847 ) ) ( not ( = ?auto_151844 ?auto_151847 ) ) ( not ( = ?auto_151849 ?auto_151847 ) ) ( not ( = ?auto_151846 ?auto_151847 ) ) ( not ( = ?auto_151845 ?auto_151847 ) ) ( not ( = ?auto_151848 ?auto_151847 ) ) ( not ( = ?auto_151850 ?auto_151847 ) ) ( ON ?auto_151843 ?auto_151842 ) ( ON-TABLE ?auto_151847 ) ( ON ?auto_151844 ?auto_151843 ) ( ON ?auto_151849 ?auto_151844 ) ( ON ?auto_151850 ?auto_151849 ) ( ON ?auto_151848 ?auto_151850 ) ( CLEAR ?auto_151848 ) ( HOLDING ?auto_151845 ) ( CLEAR ?auto_151846 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_151846 ?auto_151845 )
      ( MAKE-3PILE ?auto_151842 ?auto_151843 ?auto_151844 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_151851 - BLOCK
      ?auto_151852 - BLOCK
      ?auto_151853 - BLOCK
    )
    :vars
    (
      ?auto_151855 - BLOCK
      ?auto_151854 - BLOCK
      ?auto_151856 - BLOCK
      ?auto_151858 - BLOCK
      ?auto_151857 - BLOCK
      ?auto_151859 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151851 ?auto_151852 ) ) ( not ( = ?auto_151851 ?auto_151853 ) ) ( not ( = ?auto_151852 ?auto_151853 ) ) ( not ( = ?auto_151851 ?auto_151855 ) ) ( not ( = ?auto_151852 ?auto_151855 ) ) ( not ( = ?auto_151853 ?auto_151855 ) ) ( ON-TABLE ?auto_151854 ) ( not ( = ?auto_151854 ?auto_151856 ) ) ( not ( = ?auto_151854 ?auto_151858 ) ) ( not ( = ?auto_151854 ?auto_151857 ) ) ( not ( = ?auto_151854 ?auto_151855 ) ) ( not ( = ?auto_151854 ?auto_151853 ) ) ( not ( = ?auto_151854 ?auto_151852 ) ) ( not ( = ?auto_151856 ?auto_151858 ) ) ( not ( = ?auto_151856 ?auto_151857 ) ) ( not ( = ?auto_151856 ?auto_151855 ) ) ( not ( = ?auto_151856 ?auto_151853 ) ) ( not ( = ?auto_151856 ?auto_151852 ) ) ( not ( = ?auto_151858 ?auto_151857 ) ) ( not ( = ?auto_151858 ?auto_151855 ) ) ( not ( = ?auto_151858 ?auto_151853 ) ) ( not ( = ?auto_151858 ?auto_151852 ) ) ( not ( = ?auto_151857 ?auto_151855 ) ) ( not ( = ?auto_151857 ?auto_151853 ) ) ( not ( = ?auto_151857 ?auto_151852 ) ) ( not ( = ?auto_151851 ?auto_151854 ) ) ( not ( = ?auto_151851 ?auto_151856 ) ) ( not ( = ?auto_151851 ?auto_151858 ) ) ( not ( = ?auto_151851 ?auto_151857 ) ) ( ON ?auto_151851 ?auto_151859 ) ( not ( = ?auto_151851 ?auto_151859 ) ) ( not ( = ?auto_151852 ?auto_151859 ) ) ( not ( = ?auto_151853 ?auto_151859 ) ) ( not ( = ?auto_151855 ?auto_151859 ) ) ( not ( = ?auto_151854 ?auto_151859 ) ) ( not ( = ?auto_151856 ?auto_151859 ) ) ( not ( = ?auto_151858 ?auto_151859 ) ) ( not ( = ?auto_151857 ?auto_151859 ) ) ( ON ?auto_151852 ?auto_151851 ) ( ON-TABLE ?auto_151859 ) ( ON ?auto_151853 ?auto_151852 ) ( ON ?auto_151855 ?auto_151853 ) ( ON ?auto_151857 ?auto_151855 ) ( ON ?auto_151858 ?auto_151857 ) ( CLEAR ?auto_151854 ) ( ON ?auto_151856 ?auto_151858 ) ( CLEAR ?auto_151856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_151859 ?auto_151851 ?auto_151852 ?auto_151853 ?auto_151855 ?auto_151857 ?auto_151858 )
      ( MAKE-3PILE ?auto_151851 ?auto_151852 ?auto_151853 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_151860 - BLOCK
      ?auto_151861 - BLOCK
      ?auto_151862 - BLOCK
    )
    :vars
    (
      ?auto_151863 - BLOCK
      ?auto_151864 - BLOCK
      ?auto_151866 - BLOCK
      ?auto_151867 - BLOCK
      ?auto_151865 - BLOCK
      ?auto_151868 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151860 ?auto_151861 ) ) ( not ( = ?auto_151860 ?auto_151862 ) ) ( not ( = ?auto_151861 ?auto_151862 ) ) ( not ( = ?auto_151860 ?auto_151863 ) ) ( not ( = ?auto_151861 ?auto_151863 ) ) ( not ( = ?auto_151862 ?auto_151863 ) ) ( not ( = ?auto_151864 ?auto_151866 ) ) ( not ( = ?auto_151864 ?auto_151867 ) ) ( not ( = ?auto_151864 ?auto_151865 ) ) ( not ( = ?auto_151864 ?auto_151863 ) ) ( not ( = ?auto_151864 ?auto_151862 ) ) ( not ( = ?auto_151864 ?auto_151861 ) ) ( not ( = ?auto_151866 ?auto_151867 ) ) ( not ( = ?auto_151866 ?auto_151865 ) ) ( not ( = ?auto_151866 ?auto_151863 ) ) ( not ( = ?auto_151866 ?auto_151862 ) ) ( not ( = ?auto_151866 ?auto_151861 ) ) ( not ( = ?auto_151867 ?auto_151865 ) ) ( not ( = ?auto_151867 ?auto_151863 ) ) ( not ( = ?auto_151867 ?auto_151862 ) ) ( not ( = ?auto_151867 ?auto_151861 ) ) ( not ( = ?auto_151865 ?auto_151863 ) ) ( not ( = ?auto_151865 ?auto_151862 ) ) ( not ( = ?auto_151865 ?auto_151861 ) ) ( not ( = ?auto_151860 ?auto_151864 ) ) ( not ( = ?auto_151860 ?auto_151866 ) ) ( not ( = ?auto_151860 ?auto_151867 ) ) ( not ( = ?auto_151860 ?auto_151865 ) ) ( ON ?auto_151860 ?auto_151868 ) ( not ( = ?auto_151860 ?auto_151868 ) ) ( not ( = ?auto_151861 ?auto_151868 ) ) ( not ( = ?auto_151862 ?auto_151868 ) ) ( not ( = ?auto_151863 ?auto_151868 ) ) ( not ( = ?auto_151864 ?auto_151868 ) ) ( not ( = ?auto_151866 ?auto_151868 ) ) ( not ( = ?auto_151867 ?auto_151868 ) ) ( not ( = ?auto_151865 ?auto_151868 ) ) ( ON ?auto_151861 ?auto_151860 ) ( ON-TABLE ?auto_151868 ) ( ON ?auto_151862 ?auto_151861 ) ( ON ?auto_151863 ?auto_151862 ) ( ON ?auto_151865 ?auto_151863 ) ( ON ?auto_151867 ?auto_151865 ) ( ON ?auto_151866 ?auto_151867 ) ( CLEAR ?auto_151866 ) ( HOLDING ?auto_151864 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_151864 )
      ( MAKE-3PILE ?auto_151860 ?auto_151861 ?auto_151862 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_151869 - BLOCK
      ?auto_151870 - BLOCK
      ?auto_151871 - BLOCK
    )
    :vars
    (
      ?auto_151873 - BLOCK
      ?auto_151874 - BLOCK
      ?auto_151877 - BLOCK
      ?auto_151875 - BLOCK
      ?auto_151872 - BLOCK
      ?auto_151876 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151869 ?auto_151870 ) ) ( not ( = ?auto_151869 ?auto_151871 ) ) ( not ( = ?auto_151870 ?auto_151871 ) ) ( not ( = ?auto_151869 ?auto_151873 ) ) ( not ( = ?auto_151870 ?auto_151873 ) ) ( not ( = ?auto_151871 ?auto_151873 ) ) ( not ( = ?auto_151874 ?auto_151877 ) ) ( not ( = ?auto_151874 ?auto_151875 ) ) ( not ( = ?auto_151874 ?auto_151872 ) ) ( not ( = ?auto_151874 ?auto_151873 ) ) ( not ( = ?auto_151874 ?auto_151871 ) ) ( not ( = ?auto_151874 ?auto_151870 ) ) ( not ( = ?auto_151877 ?auto_151875 ) ) ( not ( = ?auto_151877 ?auto_151872 ) ) ( not ( = ?auto_151877 ?auto_151873 ) ) ( not ( = ?auto_151877 ?auto_151871 ) ) ( not ( = ?auto_151877 ?auto_151870 ) ) ( not ( = ?auto_151875 ?auto_151872 ) ) ( not ( = ?auto_151875 ?auto_151873 ) ) ( not ( = ?auto_151875 ?auto_151871 ) ) ( not ( = ?auto_151875 ?auto_151870 ) ) ( not ( = ?auto_151872 ?auto_151873 ) ) ( not ( = ?auto_151872 ?auto_151871 ) ) ( not ( = ?auto_151872 ?auto_151870 ) ) ( not ( = ?auto_151869 ?auto_151874 ) ) ( not ( = ?auto_151869 ?auto_151877 ) ) ( not ( = ?auto_151869 ?auto_151875 ) ) ( not ( = ?auto_151869 ?auto_151872 ) ) ( ON ?auto_151869 ?auto_151876 ) ( not ( = ?auto_151869 ?auto_151876 ) ) ( not ( = ?auto_151870 ?auto_151876 ) ) ( not ( = ?auto_151871 ?auto_151876 ) ) ( not ( = ?auto_151873 ?auto_151876 ) ) ( not ( = ?auto_151874 ?auto_151876 ) ) ( not ( = ?auto_151877 ?auto_151876 ) ) ( not ( = ?auto_151875 ?auto_151876 ) ) ( not ( = ?auto_151872 ?auto_151876 ) ) ( ON ?auto_151870 ?auto_151869 ) ( ON-TABLE ?auto_151876 ) ( ON ?auto_151871 ?auto_151870 ) ( ON ?auto_151873 ?auto_151871 ) ( ON ?auto_151872 ?auto_151873 ) ( ON ?auto_151875 ?auto_151872 ) ( ON ?auto_151877 ?auto_151875 ) ( ON ?auto_151874 ?auto_151877 ) ( CLEAR ?auto_151874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_151876 ?auto_151869 ?auto_151870 ?auto_151871 ?auto_151873 ?auto_151872 ?auto_151875 ?auto_151877 )
      ( MAKE-3PILE ?auto_151869 ?auto_151870 ?auto_151871 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_151882 - BLOCK
      ?auto_151883 - BLOCK
      ?auto_151884 - BLOCK
      ?auto_151885 - BLOCK
    )
    :vars
    (
      ?auto_151886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151886 ?auto_151885 ) ( CLEAR ?auto_151886 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_151882 ) ( ON ?auto_151883 ?auto_151882 ) ( ON ?auto_151884 ?auto_151883 ) ( ON ?auto_151885 ?auto_151884 ) ( not ( = ?auto_151882 ?auto_151883 ) ) ( not ( = ?auto_151882 ?auto_151884 ) ) ( not ( = ?auto_151882 ?auto_151885 ) ) ( not ( = ?auto_151882 ?auto_151886 ) ) ( not ( = ?auto_151883 ?auto_151884 ) ) ( not ( = ?auto_151883 ?auto_151885 ) ) ( not ( = ?auto_151883 ?auto_151886 ) ) ( not ( = ?auto_151884 ?auto_151885 ) ) ( not ( = ?auto_151884 ?auto_151886 ) ) ( not ( = ?auto_151885 ?auto_151886 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_151886 ?auto_151885 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_151887 - BLOCK
      ?auto_151888 - BLOCK
      ?auto_151889 - BLOCK
      ?auto_151890 - BLOCK
    )
    :vars
    (
      ?auto_151891 - BLOCK
      ?auto_151892 - BLOCK
      ?auto_151893 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151891 ?auto_151890 ) ( CLEAR ?auto_151891 ) ( ON-TABLE ?auto_151887 ) ( ON ?auto_151888 ?auto_151887 ) ( ON ?auto_151889 ?auto_151888 ) ( ON ?auto_151890 ?auto_151889 ) ( not ( = ?auto_151887 ?auto_151888 ) ) ( not ( = ?auto_151887 ?auto_151889 ) ) ( not ( = ?auto_151887 ?auto_151890 ) ) ( not ( = ?auto_151887 ?auto_151891 ) ) ( not ( = ?auto_151888 ?auto_151889 ) ) ( not ( = ?auto_151888 ?auto_151890 ) ) ( not ( = ?auto_151888 ?auto_151891 ) ) ( not ( = ?auto_151889 ?auto_151890 ) ) ( not ( = ?auto_151889 ?auto_151891 ) ) ( not ( = ?auto_151890 ?auto_151891 ) ) ( HOLDING ?auto_151892 ) ( CLEAR ?auto_151893 ) ( not ( = ?auto_151887 ?auto_151892 ) ) ( not ( = ?auto_151887 ?auto_151893 ) ) ( not ( = ?auto_151888 ?auto_151892 ) ) ( not ( = ?auto_151888 ?auto_151893 ) ) ( not ( = ?auto_151889 ?auto_151892 ) ) ( not ( = ?auto_151889 ?auto_151893 ) ) ( not ( = ?auto_151890 ?auto_151892 ) ) ( not ( = ?auto_151890 ?auto_151893 ) ) ( not ( = ?auto_151891 ?auto_151892 ) ) ( not ( = ?auto_151891 ?auto_151893 ) ) ( not ( = ?auto_151892 ?auto_151893 ) ) )
    :subtasks
    ( ( !STACK ?auto_151892 ?auto_151893 )
      ( MAKE-4PILE ?auto_151887 ?auto_151888 ?auto_151889 ?auto_151890 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_151894 - BLOCK
      ?auto_151895 - BLOCK
      ?auto_151896 - BLOCK
      ?auto_151897 - BLOCK
    )
    :vars
    (
      ?auto_151900 - BLOCK
      ?auto_151898 - BLOCK
      ?auto_151899 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151900 ?auto_151897 ) ( ON-TABLE ?auto_151894 ) ( ON ?auto_151895 ?auto_151894 ) ( ON ?auto_151896 ?auto_151895 ) ( ON ?auto_151897 ?auto_151896 ) ( not ( = ?auto_151894 ?auto_151895 ) ) ( not ( = ?auto_151894 ?auto_151896 ) ) ( not ( = ?auto_151894 ?auto_151897 ) ) ( not ( = ?auto_151894 ?auto_151900 ) ) ( not ( = ?auto_151895 ?auto_151896 ) ) ( not ( = ?auto_151895 ?auto_151897 ) ) ( not ( = ?auto_151895 ?auto_151900 ) ) ( not ( = ?auto_151896 ?auto_151897 ) ) ( not ( = ?auto_151896 ?auto_151900 ) ) ( not ( = ?auto_151897 ?auto_151900 ) ) ( CLEAR ?auto_151898 ) ( not ( = ?auto_151894 ?auto_151899 ) ) ( not ( = ?auto_151894 ?auto_151898 ) ) ( not ( = ?auto_151895 ?auto_151899 ) ) ( not ( = ?auto_151895 ?auto_151898 ) ) ( not ( = ?auto_151896 ?auto_151899 ) ) ( not ( = ?auto_151896 ?auto_151898 ) ) ( not ( = ?auto_151897 ?auto_151899 ) ) ( not ( = ?auto_151897 ?auto_151898 ) ) ( not ( = ?auto_151900 ?auto_151899 ) ) ( not ( = ?auto_151900 ?auto_151898 ) ) ( not ( = ?auto_151899 ?auto_151898 ) ) ( ON ?auto_151899 ?auto_151900 ) ( CLEAR ?auto_151899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_151894 ?auto_151895 ?auto_151896 ?auto_151897 ?auto_151900 )
      ( MAKE-4PILE ?auto_151894 ?auto_151895 ?auto_151896 ?auto_151897 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_151901 - BLOCK
      ?auto_151902 - BLOCK
      ?auto_151903 - BLOCK
      ?auto_151904 - BLOCK
    )
    :vars
    (
      ?auto_151906 - BLOCK
      ?auto_151907 - BLOCK
      ?auto_151905 - BLOCK
      ?auto_151908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151906 ?auto_151904 ) ( ON-TABLE ?auto_151901 ) ( ON ?auto_151902 ?auto_151901 ) ( ON ?auto_151903 ?auto_151902 ) ( ON ?auto_151904 ?auto_151903 ) ( not ( = ?auto_151901 ?auto_151902 ) ) ( not ( = ?auto_151901 ?auto_151903 ) ) ( not ( = ?auto_151901 ?auto_151904 ) ) ( not ( = ?auto_151901 ?auto_151906 ) ) ( not ( = ?auto_151902 ?auto_151903 ) ) ( not ( = ?auto_151902 ?auto_151904 ) ) ( not ( = ?auto_151902 ?auto_151906 ) ) ( not ( = ?auto_151903 ?auto_151904 ) ) ( not ( = ?auto_151903 ?auto_151906 ) ) ( not ( = ?auto_151904 ?auto_151906 ) ) ( not ( = ?auto_151901 ?auto_151907 ) ) ( not ( = ?auto_151901 ?auto_151905 ) ) ( not ( = ?auto_151902 ?auto_151907 ) ) ( not ( = ?auto_151902 ?auto_151905 ) ) ( not ( = ?auto_151903 ?auto_151907 ) ) ( not ( = ?auto_151903 ?auto_151905 ) ) ( not ( = ?auto_151904 ?auto_151907 ) ) ( not ( = ?auto_151904 ?auto_151905 ) ) ( not ( = ?auto_151906 ?auto_151907 ) ) ( not ( = ?auto_151906 ?auto_151905 ) ) ( not ( = ?auto_151907 ?auto_151905 ) ) ( ON ?auto_151907 ?auto_151906 ) ( CLEAR ?auto_151907 ) ( HOLDING ?auto_151905 ) ( CLEAR ?auto_151908 ) ( ON-TABLE ?auto_151908 ) ( not ( = ?auto_151908 ?auto_151905 ) ) ( not ( = ?auto_151901 ?auto_151908 ) ) ( not ( = ?auto_151902 ?auto_151908 ) ) ( not ( = ?auto_151903 ?auto_151908 ) ) ( not ( = ?auto_151904 ?auto_151908 ) ) ( not ( = ?auto_151906 ?auto_151908 ) ) ( not ( = ?auto_151907 ?auto_151908 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_151908 ?auto_151905 )
      ( MAKE-4PILE ?auto_151901 ?auto_151902 ?auto_151903 ?auto_151904 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_151909 - BLOCK
      ?auto_151910 - BLOCK
      ?auto_151911 - BLOCK
      ?auto_151912 - BLOCK
    )
    :vars
    (
      ?auto_151915 - BLOCK
      ?auto_151914 - BLOCK
      ?auto_151913 - BLOCK
      ?auto_151916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151915 ?auto_151912 ) ( ON-TABLE ?auto_151909 ) ( ON ?auto_151910 ?auto_151909 ) ( ON ?auto_151911 ?auto_151910 ) ( ON ?auto_151912 ?auto_151911 ) ( not ( = ?auto_151909 ?auto_151910 ) ) ( not ( = ?auto_151909 ?auto_151911 ) ) ( not ( = ?auto_151909 ?auto_151912 ) ) ( not ( = ?auto_151909 ?auto_151915 ) ) ( not ( = ?auto_151910 ?auto_151911 ) ) ( not ( = ?auto_151910 ?auto_151912 ) ) ( not ( = ?auto_151910 ?auto_151915 ) ) ( not ( = ?auto_151911 ?auto_151912 ) ) ( not ( = ?auto_151911 ?auto_151915 ) ) ( not ( = ?auto_151912 ?auto_151915 ) ) ( not ( = ?auto_151909 ?auto_151914 ) ) ( not ( = ?auto_151909 ?auto_151913 ) ) ( not ( = ?auto_151910 ?auto_151914 ) ) ( not ( = ?auto_151910 ?auto_151913 ) ) ( not ( = ?auto_151911 ?auto_151914 ) ) ( not ( = ?auto_151911 ?auto_151913 ) ) ( not ( = ?auto_151912 ?auto_151914 ) ) ( not ( = ?auto_151912 ?auto_151913 ) ) ( not ( = ?auto_151915 ?auto_151914 ) ) ( not ( = ?auto_151915 ?auto_151913 ) ) ( not ( = ?auto_151914 ?auto_151913 ) ) ( ON ?auto_151914 ?auto_151915 ) ( CLEAR ?auto_151916 ) ( ON-TABLE ?auto_151916 ) ( not ( = ?auto_151916 ?auto_151913 ) ) ( not ( = ?auto_151909 ?auto_151916 ) ) ( not ( = ?auto_151910 ?auto_151916 ) ) ( not ( = ?auto_151911 ?auto_151916 ) ) ( not ( = ?auto_151912 ?auto_151916 ) ) ( not ( = ?auto_151915 ?auto_151916 ) ) ( not ( = ?auto_151914 ?auto_151916 ) ) ( ON ?auto_151913 ?auto_151914 ) ( CLEAR ?auto_151913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_151909 ?auto_151910 ?auto_151911 ?auto_151912 ?auto_151915 ?auto_151914 )
      ( MAKE-4PILE ?auto_151909 ?auto_151910 ?auto_151911 ?auto_151912 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_151917 - BLOCK
      ?auto_151918 - BLOCK
      ?auto_151919 - BLOCK
      ?auto_151920 - BLOCK
    )
    :vars
    (
      ?auto_151922 - BLOCK
      ?auto_151924 - BLOCK
      ?auto_151923 - BLOCK
      ?auto_151921 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151922 ?auto_151920 ) ( ON-TABLE ?auto_151917 ) ( ON ?auto_151918 ?auto_151917 ) ( ON ?auto_151919 ?auto_151918 ) ( ON ?auto_151920 ?auto_151919 ) ( not ( = ?auto_151917 ?auto_151918 ) ) ( not ( = ?auto_151917 ?auto_151919 ) ) ( not ( = ?auto_151917 ?auto_151920 ) ) ( not ( = ?auto_151917 ?auto_151922 ) ) ( not ( = ?auto_151918 ?auto_151919 ) ) ( not ( = ?auto_151918 ?auto_151920 ) ) ( not ( = ?auto_151918 ?auto_151922 ) ) ( not ( = ?auto_151919 ?auto_151920 ) ) ( not ( = ?auto_151919 ?auto_151922 ) ) ( not ( = ?auto_151920 ?auto_151922 ) ) ( not ( = ?auto_151917 ?auto_151924 ) ) ( not ( = ?auto_151917 ?auto_151923 ) ) ( not ( = ?auto_151918 ?auto_151924 ) ) ( not ( = ?auto_151918 ?auto_151923 ) ) ( not ( = ?auto_151919 ?auto_151924 ) ) ( not ( = ?auto_151919 ?auto_151923 ) ) ( not ( = ?auto_151920 ?auto_151924 ) ) ( not ( = ?auto_151920 ?auto_151923 ) ) ( not ( = ?auto_151922 ?auto_151924 ) ) ( not ( = ?auto_151922 ?auto_151923 ) ) ( not ( = ?auto_151924 ?auto_151923 ) ) ( ON ?auto_151924 ?auto_151922 ) ( not ( = ?auto_151921 ?auto_151923 ) ) ( not ( = ?auto_151917 ?auto_151921 ) ) ( not ( = ?auto_151918 ?auto_151921 ) ) ( not ( = ?auto_151919 ?auto_151921 ) ) ( not ( = ?auto_151920 ?auto_151921 ) ) ( not ( = ?auto_151922 ?auto_151921 ) ) ( not ( = ?auto_151924 ?auto_151921 ) ) ( ON ?auto_151923 ?auto_151924 ) ( CLEAR ?auto_151923 ) ( HOLDING ?auto_151921 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_151921 )
      ( MAKE-4PILE ?auto_151917 ?auto_151918 ?auto_151919 ?auto_151920 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_151925 - BLOCK
      ?auto_151926 - BLOCK
      ?auto_151927 - BLOCK
      ?auto_151928 - BLOCK
    )
    :vars
    (
      ?auto_151929 - BLOCK
      ?auto_151932 - BLOCK
      ?auto_151931 - BLOCK
      ?auto_151930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151929 ?auto_151928 ) ( ON-TABLE ?auto_151925 ) ( ON ?auto_151926 ?auto_151925 ) ( ON ?auto_151927 ?auto_151926 ) ( ON ?auto_151928 ?auto_151927 ) ( not ( = ?auto_151925 ?auto_151926 ) ) ( not ( = ?auto_151925 ?auto_151927 ) ) ( not ( = ?auto_151925 ?auto_151928 ) ) ( not ( = ?auto_151925 ?auto_151929 ) ) ( not ( = ?auto_151926 ?auto_151927 ) ) ( not ( = ?auto_151926 ?auto_151928 ) ) ( not ( = ?auto_151926 ?auto_151929 ) ) ( not ( = ?auto_151927 ?auto_151928 ) ) ( not ( = ?auto_151927 ?auto_151929 ) ) ( not ( = ?auto_151928 ?auto_151929 ) ) ( not ( = ?auto_151925 ?auto_151932 ) ) ( not ( = ?auto_151925 ?auto_151931 ) ) ( not ( = ?auto_151926 ?auto_151932 ) ) ( not ( = ?auto_151926 ?auto_151931 ) ) ( not ( = ?auto_151927 ?auto_151932 ) ) ( not ( = ?auto_151927 ?auto_151931 ) ) ( not ( = ?auto_151928 ?auto_151932 ) ) ( not ( = ?auto_151928 ?auto_151931 ) ) ( not ( = ?auto_151929 ?auto_151932 ) ) ( not ( = ?auto_151929 ?auto_151931 ) ) ( not ( = ?auto_151932 ?auto_151931 ) ) ( ON ?auto_151932 ?auto_151929 ) ( not ( = ?auto_151930 ?auto_151931 ) ) ( not ( = ?auto_151925 ?auto_151930 ) ) ( not ( = ?auto_151926 ?auto_151930 ) ) ( not ( = ?auto_151927 ?auto_151930 ) ) ( not ( = ?auto_151928 ?auto_151930 ) ) ( not ( = ?auto_151929 ?auto_151930 ) ) ( not ( = ?auto_151932 ?auto_151930 ) ) ( ON ?auto_151931 ?auto_151932 ) ( ON ?auto_151930 ?auto_151931 ) ( CLEAR ?auto_151930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_151925 ?auto_151926 ?auto_151927 ?auto_151928 ?auto_151929 ?auto_151932 ?auto_151931 )
      ( MAKE-4PILE ?auto_151925 ?auto_151926 ?auto_151927 ?auto_151928 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_151933 - BLOCK
      ?auto_151934 - BLOCK
      ?auto_151935 - BLOCK
      ?auto_151936 - BLOCK
    )
    :vars
    (
      ?auto_151937 - BLOCK
      ?auto_151940 - BLOCK
      ?auto_151939 - BLOCK
      ?auto_151938 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151937 ?auto_151936 ) ( ON-TABLE ?auto_151933 ) ( ON ?auto_151934 ?auto_151933 ) ( ON ?auto_151935 ?auto_151934 ) ( ON ?auto_151936 ?auto_151935 ) ( not ( = ?auto_151933 ?auto_151934 ) ) ( not ( = ?auto_151933 ?auto_151935 ) ) ( not ( = ?auto_151933 ?auto_151936 ) ) ( not ( = ?auto_151933 ?auto_151937 ) ) ( not ( = ?auto_151934 ?auto_151935 ) ) ( not ( = ?auto_151934 ?auto_151936 ) ) ( not ( = ?auto_151934 ?auto_151937 ) ) ( not ( = ?auto_151935 ?auto_151936 ) ) ( not ( = ?auto_151935 ?auto_151937 ) ) ( not ( = ?auto_151936 ?auto_151937 ) ) ( not ( = ?auto_151933 ?auto_151940 ) ) ( not ( = ?auto_151933 ?auto_151939 ) ) ( not ( = ?auto_151934 ?auto_151940 ) ) ( not ( = ?auto_151934 ?auto_151939 ) ) ( not ( = ?auto_151935 ?auto_151940 ) ) ( not ( = ?auto_151935 ?auto_151939 ) ) ( not ( = ?auto_151936 ?auto_151940 ) ) ( not ( = ?auto_151936 ?auto_151939 ) ) ( not ( = ?auto_151937 ?auto_151940 ) ) ( not ( = ?auto_151937 ?auto_151939 ) ) ( not ( = ?auto_151940 ?auto_151939 ) ) ( ON ?auto_151940 ?auto_151937 ) ( not ( = ?auto_151938 ?auto_151939 ) ) ( not ( = ?auto_151933 ?auto_151938 ) ) ( not ( = ?auto_151934 ?auto_151938 ) ) ( not ( = ?auto_151935 ?auto_151938 ) ) ( not ( = ?auto_151936 ?auto_151938 ) ) ( not ( = ?auto_151937 ?auto_151938 ) ) ( not ( = ?auto_151940 ?auto_151938 ) ) ( ON ?auto_151939 ?auto_151940 ) ( HOLDING ?auto_151938 ) ( CLEAR ?auto_151939 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_151933 ?auto_151934 ?auto_151935 ?auto_151936 ?auto_151937 ?auto_151940 ?auto_151939 ?auto_151938 )
      ( MAKE-4PILE ?auto_151933 ?auto_151934 ?auto_151935 ?auto_151936 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_151941 - BLOCK
      ?auto_151942 - BLOCK
      ?auto_151943 - BLOCK
      ?auto_151944 - BLOCK
    )
    :vars
    (
      ?auto_151946 - BLOCK
      ?auto_151945 - BLOCK
      ?auto_151948 - BLOCK
      ?auto_151947 - BLOCK
      ?auto_151949 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151946 ?auto_151944 ) ( ON-TABLE ?auto_151941 ) ( ON ?auto_151942 ?auto_151941 ) ( ON ?auto_151943 ?auto_151942 ) ( ON ?auto_151944 ?auto_151943 ) ( not ( = ?auto_151941 ?auto_151942 ) ) ( not ( = ?auto_151941 ?auto_151943 ) ) ( not ( = ?auto_151941 ?auto_151944 ) ) ( not ( = ?auto_151941 ?auto_151946 ) ) ( not ( = ?auto_151942 ?auto_151943 ) ) ( not ( = ?auto_151942 ?auto_151944 ) ) ( not ( = ?auto_151942 ?auto_151946 ) ) ( not ( = ?auto_151943 ?auto_151944 ) ) ( not ( = ?auto_151943 ?auto_151946 ) ) ( not ( = ?auto_151944 ?auto_151946 ) ) ( not ( = ?auto_151941 ?auto_151945 ) ) ( not ( = ?auto_151941 ?auto_151948 ) ) ( not ( = ?auto_151942 ?auto_151945 ) ) ( not ( = ?auto_151942 ?auto_151948 ) ) ( not ( = ?auto_151943 ?auto_151945 ) ) ( not ( = ?auto_151943 ?auto_151948 ) ) ( not ( = ?auto_151944 ?auto_151945 ) ) ( not ( = ?auto_151944 ?auto_151948 ) ) ( not ( = ?auto_151946 ?auto_151945 ) ) ( not ( = ?auto_151946 ?auto_151948 ) ) ( not ( = ?auto_151945 ?auto_151948 ) ) ( ON ?auto_151945 ?auto_151946 ) ( not ( = ?auto_151947 ?auto_151948 ) ) ( not ( = ?auto_151941 ?auto_151947 ) ) ( not ( = ?auto_151942 ?auto_151947 ) ) ( not ( = ?auto_151943 ?auto_151947 ) ) ( not ( = ?auto_151944 ?auto_151947 ) ) ( not ( = ?auto_151946 ?auto_151947 ) ) ( not ( = ?auto_151945 ?auto_151947 ) ) ( ON ?auto_151948 ?auto_151945 ) ( CLEAR ?auto_151948 ) ( ON ?auto_151947 ?auto_151949 ) ( CLEAR ?auto_151947 ) ( HAND-EMPTY ) ( not ( = ?auto_151941 ?auto_151949 ) ) ( not ( = ?auto_151942 ?auto_151949 ) ) ( not ( = ?auto_151943 ?auto_151949 ) ) ( not ( = ?auto_151944 ?auto_151949 ) ) ( not ( = ?auto_151946 ?auto_151949 ) ) ( not ( = ?auto_151945 ?auto_151949 ) ) ( not ( = ?auto_151948 ?auto_151949 ) ) ( not ( = ?auto_151947 ?auto_151949 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_151947 ?auto_151949 )
      ( MAKE-4PILE ?auto_151941 ?auto_151942 ?auto_151943 ?auto_151944 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_151950 - BLOCK
      ?auto_151951 - BLOCK
      ?auto_151952 - BLOCK
      ?auto_151953 - BLOCK
    )
    :vars
    (
      ?auto_151957 - BLOCK
      ?auto_151954 - BLOCK
      ?auto_151958 - BLOCK
      ?auto_151956 - BLOCK
      ?auto_151955 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151957 ?auto_151953 ) ( ON-TABLE ?auto_151950 ) ( ON ?auto_151951 ?auto_151950 ) ( ON ?auto_151952 ?auto_151951 ) ( ON ?auto_151953 ?auto_151952 ) ( not ( = ?auto_151950 ?auto_151951 ) ) ( not ( = ?auto_151950 ?auto_151952 ) ) ( not ( = ?auto_151950 ?auto_151953 ) ) ( not ( = ?auto_151950 ?auto_151957 ) ) ( not ( = ?auto_151951 ?auto_151952 ) ) ( not ( = ?auto_151951 ?auto_151953 ) ) ( not ( = ?auto_151951 ?auto_151957 ) ) ( not ( = ?auto_151952 ?auto_151953 ) ) ( not ( = ?auto_151952 ?auto_151957 ) ) ( not ( = ?auto_151953 ?auto_151957 ) ) ( not ( = ?auto_151950 ?auto_151954 ) ) ( not ( = ?auto_151950 ?auto_151958 ) ) ( not ( = ?auto_151951 ?auto_151954 ) ) ( not ( = ?auto_151951 ?auto_151958 ) ) ( not ( = ?auto_151952 ?auto_151954 ) ) ( not ( = ?auto_151952 ?auto_151958 ) ) ( not ( = ?auto_151953 ?auto_151954 ) ) ( not ( = ?auto_151953 ?auto_151958 ) ) ( not ( = ?auto_151957 ?auto_151954 ) ) ( not ( = ?auto_151957 ?auto_151958 ) ) ( not ( = ?auto_151954 ?auto_151958 ) ) ( ON ?auto_151954 ?auto_151957 ) ( not ( = ?auto_151956 ?auto_151958 ) ) ( not ( = ?auto_151950 ?auto_151956 ) ) ( not ( = ?auto_151951 ?auto_151956 ) ) ( not ( = ?auto_151952 ?auto_151956 ) ) ( not ( = ?auto_151953 ?auto_151956 ) ) ( not ( = ?auto_151957 ?auto_151956 ) ) ( not ( = ?auto_151954 ?auto_151956 ) ) ( ON ?auto_151956 ?auto_151955 ) ( CLEAR ?auto_151956 ) ( not ( = ?auto_151950 ?auto_151955 ) ) ( not ( = ?auto_151951 ?auto_151955 ) ) ( not ( = ?auto_151952 ?auto_151955 ) ) ( not ( = ?auto_151953 ?auto_151955 ) ) ( not ( = ?auto_151957 ?auto_151955 ) ) ( not ( = ?auto_151954 ?auto_151955 ) ) ( not ( = ?auto_151958 ?auto_151955 ) ) ( not ( = ?auto_151956 ?auto_151955 ) ) ( HOLDING ?auto_151958 ) ( CLEAR ?auto_151954 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_151950 ?auto_151951 ?auto_151952 ?auto_151953 ?auto_151957 ?auto_151954 ?auto_151958 )
      ( MAKE-4PILE ?auto_151950 ?auto_151951 ?auto_151952 ?auto_151953 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_151959 - BLOCK
      ?auto_151960 - BLOCK
      ?auto_151961 - BLOCK
      ?auto_151962 - BLOCK
    )
    :vars
    (
      ?auto_151967 - BLOCK
      ?auto_151963 - BLOCK
      ?auto_151965 - BLOCK
      ?auto_151966 - BLOCK
      ?auto_151964 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151967 ?auto_151962 ) ( ON-TABLE ?auto_151959 ) ( ON ?auto_151960 ?auto_151959 ) ( ON ?auto_151961 ?auto_151960 ) ( ON ?auto_151962 ?auto_151961 ) ( not ( = ?auto_151959 ?auto_151960 ) ) ( not ( = ?auto_151959 ?auto_151961 ) ) ( not ( = ?auto_151959 ?auto_151962 ) ) ( not ( = ?auto_151959 ?auto_151967 ) ) ( not ( = ?auto_151960 ?auto_151961 ) ) ( not ( = ?auto_151960 ?auto_151962 ) ) ( not ( = ?auto_151960 ?auto_151967 ) ) ( not ( = ?auto_151961 ?auto_151962 ) ) ( not ( = ?auto_151961 ?auto_151967 ) ) ( not ( = ?auto_151962 ?auto_151967 ) ) ( not ( = ?auto_151959 ?auto_151963 ) ) ( not ( = ?auto_151959 ?auto_151965 ) ) ( not ( = ?auto_151960 ?auto_151963 ) ) ( not ( = ?auto_151960 ?auto_151965 ) ) ( not ( = ?auto_151961 ?auto_151963 ) ) ( not ( = ?auto_151961 ?auto_151965 ) ) ( not ( = ?auto_151962 ?auto_151963 ) ) ( not ( = ?auto_151962 ?auto_151965 ) ) ( not ( = ?auto_151967 ?auto_151963 ) ) ( not ( = ?auto_151967 ?auto_151965 ) ) ( not ( = ?auto_151963 ?auto_151965 ) ) ( ON ?auto_151963 ?auto_151967 ) ( not ( = ?auto_151966 ?auto_151965 ) ) ( not ( = ?auto_151959 ?auto_151966 ) ) ( not ( = ?auto_151960 ?auto_151966 ) ) ( not ( = ?auto_151961 ?auto_151966 ) ) ( not ( = ?auto_151962 ?auto_151966 ) ) ( not ( = ?auto_151967 ?auto_151966 ) ) ( not ( = ?auto_151963 ?auto_151966 ) ) ( ON ?auto_151966 ?auto_151964 ) ( not ( = ?auto_151959 ?auto_151964 ) ) ( not ( = ?auto_151960 ?auto_151964 ) ) ( not ( = ?auto_151961 ?auto_151964 ) ) ( not ( = ?auto_151962 ?auto_151964 ) ) ( not ( = ?auto_151967 ?auto_151964 ) ) ( not ( = ?auto_151963 ?auto_151964 ) ) ( not ( = ?auto_151965 ?auto_151964 ) ) ( not ( = ?auto_151966 ?auto_151964 ) ) ( CLEAR ?auto_151963 ) ( ON ?auto_151965 ?auto_151966 ) ( CLEAR ?auto_151965 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_151964 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_151964 ?auto_151966 )
      ( MAKE-4PILE ?auto_151959 ?auto_151960 ?auto_151961 ?auto_151962 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_151968 - BLOCK
      ?auto_151969 - BLOCK
      ?auto_151970 - BLOCK
      ?auto_151971 - BLOCK
    )
    :vars
    (
      ?auto_151972 - BLOCK
      ?auto_151975 - BLOCK
      ?auto_151974 - BLOCK
      ?auto_151976 - BLOCK
      ?auto_151973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151972 ?auto_151971 ) ( ON-TABLE ?auto_151968 ) ( ON ?auto_151969 ?auto_151968 ) ( ON ?auto_151970 ?auto_151969 ) ( ON ?auto_151971 ?auto_151970 ) ( not ( = ?auto_151968 ?auto_151969 ) ) ( not ( = ?auto_151968 ?auto_151970 ) ) ( not ( = ?auto_151968 ?auto_151971 ) ) ( not ( = ?auto_151968 ?auto_151972 ) ) ( not ( = ?auto_151969 ?auto_151970 ) ) ( not ( = ?auto_151969 ?auto_151971 ) ) ( not ( = ?auto_151969 ?auto_151972 ) ) ( not ( = ?auto_151970 ?auto_151971 ) ) ( not ( = ?auto_151970 ?auto_151972 ) ) ( not ( = ?auto_151971 ?auto_151972 ) ) ( not ( = ?auto_151968 ?auto_151975 ) ) ( not ( = ?auto_151968 ?auto_151974 ) ) ( not ( = ?auto_151969 ?auto_151975 ) ) ( not ( = ?auto_151969 ?auto_151974 ) ) ( not ( = ?auto_151970 ?auto_151975 ) ) ( not ( = ?auto_151970 ?auto_151974 ) ) ( not ( = ?auto_151971 ?auto_151975 ) ) ( not ( = ?auto_151971 ?auto_151974 ) ) ( not ( = ?auto_151972 ?auto_151975 ) ) ( not ( = ?auto_151972 ?auto_151974 ) ) ( not ( = ?auto_151975 ?auto_151974 ) ) ( not ( = ?auto_151976 ?auto_151974 ) ) ( not ( = ?auto_151968 ?auto_151976 ) ) ( not ( = ?auto_151969 ?auto_151976 ) ) ( not ( = ?auto_151970 ?auto_151976 ) ) ( not ( = ?auto_151971 ?auto_151976 ) ) ( not ( = ?auto_151972 ?auto_151976 ) ) ( not ( = ?auto_151975 ?auto_151976 ) ) ( ON ?auto_151976 ?auto_151973 ) ( not ( = ?auto_151968 ?auto_151973 ) ) ( not ( = ?auto_151969 ?auto_151973 ) ) ( not ( = ?auto_151970 ?auto_151973 ) ) ( not ( = ?auto_151971 ?auto_151973 ) ) ( not ( = ?auto_151972 ?auto_151973 ) ) ( not ( = ?auto_151975 ?auto_151973 ) ) ( not ( = ?auto_151974 ?auto_151973 ) ) ( not ( = ?auto_151976 ?auto_151973 ) ) ( ON ?auto_151974 ?auto_151976 ) ( CLEAR ?auto_151974 ) ( ON-TABLE ?auto_151973 ) ( HOLDING ?auto_151975 ) ( CLEAR ?auto_151972 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_151968 ?auto_151969 ?auto_151970 ?auto_151971 ?auto_151972 ?auto_151975 )
      ( MAKE-4PILE ?auto_151968 ?auto_151969 ?auto_151970 ?auto_151971 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_151977 - BLOCK
      ?auto_151978 - BLOCK
      ?auto_151979 - BLOCK
      ?auto_151980 - BLOCK
    )
    :vars
    (
      ?auto_151984 - BLOCK
      ?auto_151981 - BLOCK
      ?auto_151982 - BLOCK
      ?auto_151985 - BLOCK
      ?auto_151983 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151984 ?auto_151980 ) ( ON-TABLE ?auto_151977 ) ( ON ?auto_151978 ?auto_151977 ) ( ON ?auto_151979 ?auto_151978 ) ( ON ?auto_151980 ?auto_151979 ) ( not ( = ?auto_151977 ?auto_151978 ) ) ( not ( = ?auto_151977 ?auto_151979 ) ) ( not ( = ?auto_151977 ?auto_151980 ) ) ( not ( = ?auto_151977 ?auto_151984 ) ) ( not ( = ?auto_151978 ?auto_151979 ) ) ( not ( = ?auto_151978 ?auto_151980 ) ) ( not ( = ?auto_151978 ?auto_151984 ) ) ( not ( = ?auto_151979 ?auto_151980 ) ) ( not ( = ?auto_151979 ?auto_151984 ) ) ( not ( = ?auto_151980 ?auto_151984 ) ) ( not ( = ?auto_151977 ?auto_151981 ) ) ( not ( = ?auto_151977 ?auto_151982 ) ) ( not ( = ?auto_151978 ?auto_151981 ) ) ( not ( = ?auto_151978 ?auto_151982 ) ) ( not ( = ?auto_151979 ?auto_151981 ) ) ( not ( = ?auto_151979 ?auto_151982 ) ) ( not ( = ?auto_151980 ?auto_151981 ) ) ( not ( = ?auto_151980 ?auto_151982 ) ) ( not ( = ?auto_151984 ?auto_151981 ) ) ( not ( = ?auto_151984 ?auto_151982 ) ) ( not ( = ?auto_151981 ?auto_151982 ) ) ( not ( = ?auto_151985 ?auto_151982 ) ) ( not ( = ?auto_151977 ?auto_151985 ) ) ( not ( = ?auto_151978 ?auto_151985 ) ) ( not ( = ?auto_151979 ?auto_151985 ) ) ( not ( = ?auto_151980 ?auto_151985 ) ) ( not ( = ?auto_151984 ?auto_151985 ) ) ( not ( = ?auto_151981 ?auto_151985 ) ) ( ON ?auto_151985 ?auto_151983 ) ( not ( = ?auto_151977 ?auto_151983 ) ) ( not ( = ?auto_151978 ?auto_151983 ) ) ( not ( = ?auto_151979 ?auto_151983 ) ) ( not ( = ?auto_151980 ?auto_151983 ) ) ( not ( = ?auto_151984 ?auto_151983 ) ) ( not ( = ?auto_151981 ?auto_151983 ) ) ( not ( = ?auto_151982 ?auto_151983 ) ) ( not ( = ?auto_151985 ?auto_151983 ) ) ( ON ?auto_151982 ?auto_151985 ) ( ON-TABLE ?auto_151983 ) ( CLEAR ?auto_151984 ) ( ON ?auto_151981 ?auto_151982 ) ( CLEAR ?auto_151981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_151983 ?auto_151985 ?auto_151982 )
      ( MAKE-4PILE ?auto_151977 ?auto_151978 ?auto_151979 ?auto_151980 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152004 - BLOCK
      ?auto_152005 - BLOCK
      ?auto_152006 - BLOCK
      ?auto_152007 - BLOCK
    )
    :vars
    (
      ?auto_152009 - BLOCK
      ?auto_152011 - BLOCK
      ?auto_152008 - BLOCK
      ?auto_152010 - BLOCK
      ?auto_152012 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_152004 ) ( ON ?auto_152005 ?auto_152004 ) ( ON ?auto_152006 ?auto_152005 ) ( not ( = ?auto_152004 ?auto_152005 ) ) ( not ( = ?auto_152004 ?auto_152006 ) ) ( not ( = ?auto_152004 ?auto_152007 ) ) ( not ( = ?auto_152004 ?auto_152009 ) ) ( not ( = ?auto_152005 ?auto_152006 ) ) ( not ( = ?auto_152005 ?auto_152007 ) ) ( not ( = ?auto_152005 ?auto_152009 ) ) ( not ( = ?auto_152006 ?auto_152007 ) ) ( not ( = ?auto_152006 ?auto_152009 ) ) ( not ( = ?auto_152007 ?auto_152009 ) ) ( not ( = ?auto_152004 ?auto_152011 ) ) ( not ( = ?auto_152004 ?auto_152008 ) ) ( not ( = ?auto_152005 ?auto_152011 ) ) ( not ( = ?auto_152005 ?auto_152008 ) ) ( not ( = ?auto_152006 ?auto_152011 ) ) ( not ( = ?auto_152006 ?auto_152008 ) ) ( not ( = ?auto_152007 ?auto_152011 ) ) ( not ( = ?auto_152007 ?auto_152008 ) ) ( not ( = ?auto_152009 ?auto_152011 ) ) ( not ( = ?auto_152009 ?auto_152008 ) ) ( not ( = ?auto_152011 ?auto_152008 ) ) ( not ( = ?auto_152010 ?auto_152008 ) ) ( not ( = ?auto_152004 ?auto_152010 ) ) ( not ( = ?auto_152005 ?auto_152010 ) ) ( not ( = ?auto_152006 ?auto_152010 ) ) ( not ( = ?auto_152007 ?auto_152010 ) ) ( not ( = ?auto_152009 ?auto_152010 ) ) ( not ( = ?auto_152011 ?auto_152010 ) ) ( ON ?auto_152010 ?auto_152012 ) ( not ( = ?auto_152004 ?auto_152012 ) ) ( not ( = ?auto_152005 ?auto_152012 ) ) ( not ( = ?auto_152006 ?auto_152012 ) ) ( not ( = ?auto_152007 ?auto_152012 ) ) ( not ( = ?auto_152009 ?auto_152012 ) ) ( not ( = ?auto_152011 ?auto_152012 ) ) ( not ( = ?auto_152008 ?auto_152012 ) ) ( not ( = ?auto_152010 ?auto_152012 ) ) ( ON ?auto_152008 ?auto_152010 ) ( ON-TABLE ?auto_152012 ) ( ON ?auto_152011 ?auto_152008 ) ( ON ?auto_152009 ?auto_152011 ) ( CLEAR ?auto_152009 ) ( HOLDING ?auto_152007 ) ( CLEAR ?auto_152006 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_152004 ?auto_152005 ?auto_152006 ?auto_152007 ?auto_152009 )
      ( MAKE-4PILE ?auto_152004 ?auto_152005 ?auto_152006 ?auto_152007 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152013 - BLOCK
      ?auto_152014 - BLOCK
      ?auto_152015 - BLOCK
      ?auto_152016 - BLOCK
    )
    :vars
    (
      ?auto_152019 - BLOCK
      ?auto_152020 - BLOCK
      ?auto_152017 - BLOCK
      ?auto_152018 - BLOCK
      ?auto_152021 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_152013 ) ( ON ?auto_152014 ?auto_152013 ) ( ON ?auto_152015 ?auto_152014 ) ( not ( = ?auto_152013 ?auto_152014 ) ) ( not ( = ?auto_152013 ?auto_152015 ) ) ( not ( = ?auto_152013 ?auto_152016 ) ) ( not ( = ?auto_152013 ?auto_152019 ) ) ( not ( = ?auto_152014 ?auto_152015 ) ) ( not ( = ?auto_152014 ?auto_152016 ) ) ( not ( = ?auto_152014 ?auto_152019 ) ) ( not ( = ?auto_152015 ?auto_152016 ) ) ( not ( = ?auto_152015 ?auto_152019 ) ) ( not ( = ?auto_152016 ?auto_152019 ) ) ( not ( = ?auto_152013 ?auto_152020 ) ) ( not ( = ?auto_152013 ?auto_152017 ) ) ( not ( = ?auto_152014 ?auto_152020 ) ) ( not ( = ?auto_152014 ?auto_152017 ) ) ( not ( = ?auto_152015 ?auto_152020 ) ) ( not ( = ?auto_152015 ?auto_152017 ) ) ( not ( = ?auto_152016 ?auto_152020 ) ) ( not ( = ?auto_152016 ?auto_152017 ) ) ( not ( = ?auto_152019 ?auto_152020 ) ) ( not ( = ?auto_152019 ?auto_152017 ) ) ( not ( = ?auto_152020 ?auto_152017 ) ) ( not ( = ?auto_152018 ?auto_152017 ) ) ( not ( = ?auto_152013 ?auto_152018 ) ) ( not ( = ?auto_152014 ?auto_152018 ) ) ( not ( = ?auto_152015 ?auto_152018 ) ) ( not ( = ?auto_152016 ?auto_152018 ) ) ( not ( = ?auto_152019 ?auto_152018 ) ) ( not ( = ?auto_152020 ?auto_152018 ) ) ( ON ?auto_152018 ?auto_152021 ) ( not ( = ?auto_152013 ?auto_152021 ) ) ( not ( = ?auto_152014 ?auto_152021 ) ) ( not ( = ?auto_152015 ?auto_152021 ) ) ( not ( = ?auto_152016 ?auto_152021 ) ) ( not ( = ?auto_152019 ?auto_152021 ) ) ( not ( = ?auto_152020 ?auto_152021 ) ) ( not ( = ?auto_152017 ?auto_152021 ) ) ( not ( = ?auto_152018 ?auto_152021 ) ) ( ON ?auto_152017 ?auto_152018 ) ( ON-TABLE ?auto_152021 ) ( ON ?auto_152020 ?auto_152017 ) ( ON ?auto_152019 ?auto_152020 ) ( CLEAR ?auto_152015 ) ( ON ?auto_152016 ?auto_152019 ) ( CLEAR ?auto_152016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_152021 ?auto_152018 ?auto_152017 ?auto_152020 ?auto_152019 )
      ( MAKE-4PILE ?auto_152013 ?auto_152014 ?auto_152015 ?auto_152016 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152022 - BLOCK
      ?auto_152023 - BLOCK
      ?auto_152024 - BLOCK
      ?auto_152025 - BLOCK
    )
    :vars
    (
      ?auto_152026 - BLOCK
      ?auto_152028 - BLOCK
      ?auto_152027 - BLOCK
      ?auto_152029 - BLOCK
      ?auto_152030 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_152022 ) ( ON ?auto_152023 ?auto_152022 ) ( not ( = ?auto_152022 ?auto_152023 ) ) ( not ( = ?auto_152022 ?auto_152024 ) ) ( not ( = ?auto_152022 ?auto_152025 ) ) ( not ( = ?auto_152022 ?auto_152026 ) ) ( not ( = ?auto_152023 ?auto_152024 ) ) ( not ( = ?auto_152023 ?auto_152025 ) ) ( not ( = ?auto_152023 ?auto_152026 ) ) ( not ( = ?auto_152024 ?auto_152025 ) ) ( not ( = ?auto_152024 ?auto_152026 ) ) ( not ( = ?auto_152025 ?auto_152026 ) ) ( not ( = ?auto_152022 ?auto_152028 ) ) ( not ( = ?auto_152022 ?auto_152027 ) ) ( not ( = ?auto_152023 ?auto_152028 ) ) ( not ( = ?auto_152023 ?auto_152027 ) ) ( not ( = ?auto_152024 ?auto_152028 ) ) ( not ( = ?auto_152024 ?auto_152027 ) ) ( not ( = ?auto_152025 ?auto_152028 ) ) ( not ( = ?auto_152025 ?auto_152027 ) ) ( not ( = ?auto_152026 ?auto_152028 ) ) ( not ( = ?auto_152026 ?auto_152027 ) ) ( not ( = ?auto_152028 ?auto_152027 ) ) ( not ( = ?auto_152029 ?auto_152027 ) ) ( not ( = ?auto_152022 ?auto_152029 ) ) ( not ( = ?auto_152023 ?auto_152029 ) ) ( not ( = ?auto_152024 ?auto_152029 ) ) ( not ( = ?auto_152025 ?auto_152029 ) ) ( not ( = ?auto_152026 ?auto_152029 ) ) ( not ( = ?auto_152028 ?auto_152029 ) ) ( ON ?auto_152029 ?auto_152030 ) ( not ( = ?auto_152022 ?auto_152030 ) ) ( not ( = ?auto_152023 ?auto_152030 ) ) ( not ( = ?auto_152024 ?auto_152030 ) ) ( not ( = ?auto_152025 ?auto_152030 ) ) ( not ( = ?auto_152026 ?auto_152030 ) ) ( not ( = ?auto_152028 ?auto_152030 ) ) ( not ( = ?auto_152027 ?auto_152030 ) ) ( not ( = ?auto_152029 ?auto_152030 ) ) ( ON ?auto_152027 ?auto_152029 ) ( ON-TABLE ?auto_152030 ) ( ON ?auto_152028 ?auto_152027 ) ( ON ?auto_152026 ?auto_152028 ) ( ON ?auto_152025 ?auto_152026 ) ( CLEAR ?auto_152025 ) ( HOLDING ?auto_152024 ) ( CLEAR ?auto_152023 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_152022 ?auto_152023 ?auto_152024 )
      ( MAKE-4PILE ?auto_152022 ?auto_152023 ?auto_152024 ?auto_152025 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152031 - BLOCK
      ?auto_152032 - BLOCK
      ?auto_152033 - BLOCK
      ?auto_152034 - BLOCK
    )
    :vars
    (
      ?auto_152036 - BLOCK
      ?auto_152035 - BLOCK
      ?auto_152037 - BLOCK
      ?auto_152038 - BLOCK
      ?auto_152039 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_152031 ) ( ON ?auto_152032 ?auto_152031 ) ( not ( = ?auto_152031 ?auto_152032 ) ) ( not ( = ?auto_152031 ?auto_152033 ) ) ( not ( = ?auto_152031 ?auto_152034 ) ) ( not ( = ?auto_152031 ?auto_152036 ) ) ( not ( = ?auto_152032 ?auto_152033 ) ) ( not ( = ?auto_152032 ?auto_152034 ) ) ( not ( = ?auto_152032 ?auto_152036 ) ) ( not ( = ?auto_152033 ?auto_152034 ) ) ( not ( = ?auto_152033 ?auto_152036 ) ) ( not ( = ?auto_152034 ?auto_152036 ) ) ( not ( = ?auto_152031 ?auto_152035 ) ) ( not ( = ?auto_152031 ?auto_152037 ) ) ( not ( = ?auto_152032 ?auto_152035 ) ) ( not ( = ?auto_152032 ?auto_152037 ) ) ( not ( = ?auto_152033 ?auto_152035 ) ) ( not ( = ?auto_152033 ?auto_152037 ) ) ( not ( = ?auto_152034 ?auto_152035 ) ) ( not ( = ?auto_152034 ?auto_152037 ) ) ( not ( = ?auto_152036 ?auto_152035 ) ) ( not ( = ?auto_152036 ?auto_152037 ) ) ( not ( = ?auto_152035 ?auto_152037 ) ) ( not ( = ?auto_152038 ?auto_152037 ) ) ( not ( = ?auto_152031 ?auto_152038 ) ) ( not ( = ?auto_152032 ?auto_152038 ) ) ( not ( = ?auto_152033 ?auto_152038 ) ) ( not ( = ?auto_152034 ?auto_152038 ) ) ( not ( = ?auto_152036 ?auto_152038 ) ) ( not ( = ?auto_152035 ?auto_152038 ) ) ( ON ?auto_152038 ?auto_152039 ) ( not ( = ?auto_152031 ?auto_152039 ) ) ( not ( = ?auto_152032 ?auto_152039 ) ) ( not ( = ?auto_152033 ?auto_152039 ) ) ( not ( = ?auto_152034 ?auto_152039 ) ) ( not ( = ?auto_152036 ?auto_152039 ) ) ( not ( = ?auto_152035 ?auto_152039 ) ) ( not ( = ?auto_152037 ?auto_152039 ) ) ( not ( = ?auto_152038 ?auto_152039 ) ) ( ON ?auto_152037 ?auto_152038 ) ( ON-TABLE ?auto_152039 ) ( ON ?auto_152035 ?auto_152037 ) ( ON ?auto_152036 ?auto_152035 ) ( ON ?auto_152034 ?auto_152036 ) ( CLEAR ?auto_152032 ) ( ON ?auto_152033 ?auto_152034 ) ( CLEAR ?auto_152033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_152039 ?auto_152038 ?auto_152037 ?auto_152035 ?auto_152036 ?auto_152034 )
      ( MAKE-4PILE ?auto_152031 ?auto_152032 ?auto_152033 ?auto_152034 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152040 - BLOCK
      ?auto_152041 - BLOCK
      ?auto_152042 - BLOCK
      ?auto_152043 - BLOCK
    )
    :vars
    (
      ?auto_152047 - BLOCK
      ?auto_152046 - BLOCK
      ?auto_152048 - BLOCK
      ?auto_152045 - BLOCK
      ?auto_152044 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_152040 ) ( not ( = ?auto_152040 ?auto_152041 ) ) ( not ( = ?auto_152040 ?auto_152042 ) ) ( not ( = ?auto_152040 ?auto_152043 ) ) ( not ( = ?auto_152040 ?auto_152047 ) ) ( not ( = ?auto_152041 ?auto_152042 ) ) ( not ( = ?auto_152041 ?auto_152043 ) ) ( not ( = ?auto_152041 ?auto_152047 ) ) ( not ( = ?auto_152042 ?auto_152043 ) ) ( not ( = ?auto_152042 ?auto_152047 ) ) ( not ( = ?auto_152043 ?auto_152047 ) ) ( not ( = ?auto_152040 ?auto_152046 ) ) ( not ( = ?auto_152040 ?auto_152048 ) ) ( not ( = ?auto_152041 ?auto_152046 ) ) ( not ( = ?auto_152041 ?auto_152048 ) ) ( not ( = ?auto_152042 ?auto_152046 ) ) ( not ( = ?auto_152042 ?auto_152048 ) ) ( not ( = ?auto_152043 ?auto_152046 ) ) ( not ( = ?auto_152043 ?auto_152048 ) ) ( not ( = ?auto_152047 ?auto_152046 ) ) ( not ( = ?auto_152047 ?auto_152048 ) ) ( not ( = ?auto_152046 ?auto_152048 ) ) ( not ( = ?auto_152045 ?auto_152048 ) ) ( not ( = ?auto_152040 ?auto_152045 ) ) ( not ( = ?auto_152041 ?auto_152045 ) ) ( not ( = ?auto_152042 ?auto_152045 ) ) ( not ( = ?auto_152043 ?auto_152045 ) ) ( not ( = ?auto_152047 ?auto_152045 ) ) ( not ( = ?auto_152046 ?auto_152045 ) ) ( ON ?auto_152045 ?auto_152044 ) ( not ( = ?auto_152040 ?auto_152044 ) ) ( not ( = ?auto_152041 ?auto_152044 ) ) ( not ( = ?auto_152042 ?auto_152044 ) ) ( not ( = ?auto_152043 ?auto_152044 ) ) ( not ( = ?auto_152047 ?auto_152044 ) ) ( not ( = ?auto_152046 ?auto_152044 ) ) ( not ( = ?auto_152048 ?auto_152044 ) ) ( not ( = ?auto_152045 ?auto_152044 ) ) ( ON ?auto_152048 ?auto_152045 ) ( ON-TABLE ?auto_152044 ) ( ON ?auto_152046 ?auto_152048 ) ( ON ?auto_152047 ?auto_152046 ) ( ON ?auto_152043 ?auto_152047 ) ( ON ?auto_152042 ?auto_152043 ) ( CLEAR ?auto_152042 ) ( HOLDING ?auto_152041 ) ( CLEAR ?auto_152040 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_152040 ?auto_152041 )
      ( MAKE-4PILE ?auto_152040 ?auto_152041 ?auto_152042 ?auto_152043 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152049 - BLOCK
      ?auto_152050 - BLOCK
      ?auto_152051 - BLOCK
      ?auto_152052 - BLOCK
    )
    :vars
    (
      ?auto_152054 - BLOCK
      ?auto_152053 - BLOCK
      ?auto_152055 - BLOCK
      ?auto_152057 - BLOCK
      ?auto_152056 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_152049 ) ( not ( = ?auto_152049 ?auto_152050 ) ) ( not ( = ?auto_152049 ?auto_152051 ) ) ( not ( = ?auto_152049 ?auto_152052 ) ) ( not ( = ?auto_152049 ?auto_152054 ) ) ( not ( = ?auto_152050 ?auto_152051 ) ) ( not ( = ?auto_152050 ?auto_152052 ) ) ( not ( = ?auto_152050 ?auto_152054 ) ) ( not ( = ?auto_152051 ?auto_152052 ) ) ( not ( = ?auto_152051 ?auto_152054 ) ) ( not ( = ?auto_152052 ?auto_152054 ) ) ( not ( = ?auto_152049 ?auto_152053 ) ) ( not ( = ?auto_152049 ?auto_152055 ) ) ( not ( = ?auto_152050 ?auto_152053 ) ) ( not ( = ?auto_152050 ?auto_152055 ) ) ( not ( = ?auto_152051 ?auto_152053 ) ) ( not ( = ?auto_152051 ?auto_152055 ) ) ( not ( = ?auto_152052 ?auto_152053 ) ) ( not ( = ?auto_152052 ?auto_152055 ) ) ( not ( = ?auto_152054 ?auto_152053 ) ) ( not ( = ?auto_152054 ?auto_152055 ) ) ( not ( = ?auto_152053 ?auto_152055 ) ) ( not ( = ?auto_152057 ?auto_152055 ) ) ( not ( = ?auto_152049 ?auto_152057 ) ) ( not ( = ?auto_152050 ?auto_152057 ) ) ( not ( = ?auto_152051 ?auto_152057 ) ) ( not ( = ?auto_152052 ?auto_152057 ) ) ( not ( = ?auto_152054 ?auto_152057 ) ) ( not ( = ?auto_152053 ?auto_152057 ) ) ( ON ?auto_152057 ?auto_152056 ) ( not ( = ?auto_152049 ?auto_152056 ) ) ( not ( = ?auto_152050 ?auto_152056 ) ) ( not ( = ?auto_152051 ?auto_152056 ) ) ( not ( = ?auto_152052 ?auto_152056 ) ) ( not ( = ?auto_152054 ?auto_152056 ) ) ( not ( = ?auto_152053 ?auto_152056 ) ) ( not ( = ?auto_152055 ?auto_152056 ) ) ( not ( = ?auto_152057 ?auto_152056 ) ) ( ON ?auto_152055 ?auto_152057 ) ( ON-TABLE ?auto_152056 ) ( ON ?auto_152053 ?auto_152055 ) ( ON ?auto_152054 ?auto_152053 ) ( ON ?auto_152052 ?auto_152054 ) ( ON ?auto_152051 ?auto_152052 ) ( CLEAR ?auto_152049 ) ( ON ?auto_152050 ?auto_152051 ) ( CLEAR ?auto_152050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_152056 ?auto_152057 ?auto_152055 ?auto_152053 ?auto_152054 ?auto_152052 ?auto_152051 )
      ( MAKE-4PILE ?auto_152049 ?auto_152050 ?auto_152051 ?auto_152052 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152058 - BLOCK
      ?auto_152059 - BLOCK
      ?auto_152060 - BLOCK
      ?auto_152061 - BLOCK
    )
    :vars
    (
      ?auto_152062 - BLOCK
      ?auto_152065 - BLOCK
      ?auto_152064 - BLOCK
      ?auto_152063 - BLOCK
      ?auto_152066 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152058 ?auto_152059 ) ) ( not ( = ?auto_152058 ?auto_152060 ) ) ( not ( = ?auto_152058 ?auto_152061 ) ) ( not ( = ?auto_152058 ?auto_152062 ) ) ( not ( = ?auto_152059 ?auto_152060 ) ) ( not ( = ?auto_152059 ?auto_152061 ) ) ( not ( = ?auto_152059 ?auto_152062 ) ) ( not ( = ?auto_152060 ?auto_152061 ) ) ( not ( = ?auto_152060 ?auto_152062 ) ) ( not ( = ?auto_152061 ?auto_152062 ) ) ( not ( = ?auto_152058 ?auto_152065 ) ) ( not ( = ?auto_152058 ?auto_152064 ) ) ( not ( = ?auto_152059 ?auto_152065 ) ) ( not ( = ?auto_152059 ?auto_152064 ) ) ( not ( = ?auto_152060 ?auto_152065 ) ) ( not ( = ?auto_152060 ?auto_152064 ) ) ( not ( = ?auto_152061 ?auto_152065 ) ) ( not ( = ?auto_152061 ?auto_152064 ) ) ( not ( = ?auto_152062 ?auto_152065 ) ) ( not ( = ?auto_152062 ?auto_152064 ) ) ( not ( = ?auto_152065 ?auto_152064 ) ) ( not ( = ?auto_152063 ?auto_152064 ) ) ( not ( = ?auto_152058 ?auto_152063 ) ) ( not ( = ?auto_152059 ?auto_152063 ) ) ( not ( = ?auto_152060 ?auto_152063 ) ) ( not ( = ?auto_152061 ?auto_152063 ) ) ( not ( = ?auto_152062 ?auto_152063 ) ) ( not ( = ?auto_152065 ?auto_152063 ) ) ( ON ?auto_152063 ?auto_152066 ) ( not ( = ?auto_152058 ?auto_152066 ) ) ( not ( = ?auto_152059 ?auto_152066 ) ) ( not ( = ?auto_152060 ?auto_152066 ) ) ( not ( = ?auto_152061 ?auto_152066 ) ) ( not ( = ?auto_152062 ?auto_152066 ) ) ( not ( = ?auto_152065 ?auto_152066 ) ) ( not ( = ?auto_152064 ?auto_152066 ) ) ( not ( = ?auto_152063 ?auto_152066 ) ) ( ON ?auto_152064 ?auto_152063 ) ( ON-TABLE ?auto_152066 ) ( ON ?auto_152065 ?auto_152064 ) ( ON ?auto_152062 ?auto_152065 ) ( ON ?auto_152061 ?auto_152062 ) ( ON ?auto_152060 ?auto_152061 ) ( ON ?auto_152059 ?auto_152060 ) ( CLEAR ?auto_152059 ) ( HOLDING ?auto_152058 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_152058 )
      ( MAKE-4PILE ?auto_152058 ?auto_152059 ?auto_152060 ?auto_152061 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152067 - BLOCK
      ?auto_152068 - BLOCK
      ?auto_152069 - BLOCK
      ?auto_152070 - BLOCK
    )
    :vars
    (
      ?auto_152071 - BLOCK
      ?auto_152074 - BLOCK
      ?auto_152073 - BLOCK
      ?auto_152072 - BLOCK
      ?auto_152075 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152067 ?auto_152068 ) ) ( not ( = ?auto_152067 ?auto_152069 ) ) ( not ( = ?auto_152067 ?auto_152070 ) ) ( not ( = ?auto_152067 ?auto_152071 ) ) ( not ( = ?auto_152068 ?auto_152069 ) ) ( not ( = ?auto_152068 ?auto_152070 ) ) ( not ( = ?auto_152068 ?auto_152071 ) ) ( not ( = ?auto_152069 ?auto_152070 ) ) ( not ( = ?auto_152069 ?auto_152071 ) ) ( not ( = ?auto_152070 ?auto_152071 ) ) ( not ( = ?auto_152067 ?auto_152074 ) ) ( not ( = ?auto_152067 ?auto_152073 ) ) ( not ( = ?auto_152068 ?auto_152074 ) ) ( not ( = ?auto_152068 ?auto_152073 ) ) ( not ( = ?auto_152069 ?auto_152074 ) ) ( not ( = ?auto_152069 ?auto_152073 ) ) ( not ( = ?auto_152070 ?auto_152074 ) ) ( not ( = ?auto_152070 ?auto_152073 ) ) ( not ( = ?auto_152071 ?auto_152074 ) ) ( not ( = ?auto_152071 ?auto_152073 ) ) ( not ( = ?auto_152074 ?auto_152073 ) ) ( not ( = ?auto_152072 ?auto_152073 ) ) ( not ( = ?auto_152067 ?auto_152072 ) ) ( not ( = ?auto_152068 ?auto_152072 ) ) ( not ( = ?auto_152069 ?auto_152072 ) ) ( not ( = ?auto_152070 ?auto_152072 ) ) ( not ( = ?auto_152071 ?auto_152072 ) ) ( not ( = ?auto_152074 ?auto_152072 ) ) ( ON ?auto_152072 ?auto_152075 ) ( not ( = ?auto_152067 ?auto_152075 ) ) ( not ( = ?auto_152068 ?auto_152075 ) ) ( not ( = ?auto_152069 ?auto_152075 ) ) ( not ( = ?auto_152070 ?auto_152075 ) ) ( not ( = ?auto_152071 ?auto_152075 ) ) ( not ( = ?auto_152074 ?auto_152075 ) ) ( not ( = ?auto_152073 ?auto_152075 ) ) ( not ( = ?auto_152072 ?auto_152075 ) ) ( ON ?auto_152073 ?auto_152072 ) ( ON-TABLE ?auto_152075 ) ( ON ?auto_152074 ?auto_152073 ) ( ON ?auto_152071 ?auto_152074 ) ( ON ?auto_152070 ?auto_152071 ) ( ON ?auto_152069 ?auto_152070 ) ( ON ?auto_152068 ?auto_152069 ) ( ON ?auto_152067 ?auto_152068 ) ( CLEAR ?auto_152067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_152075 ?auto_152072 ?auto_152073 ?auto_152074 ?auto_152071 ?auto_152070 ?auto_152069 ?auto_152068 )
      ( MAKE-4PILE ?auto_152067 ?auto_152068 ?auto_152069 ?auto_152070 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152080 - BLOCK
      ?auto_152081 - BLOCK
      ?auto_152082 - BLOCK
      ?auto_152083 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_152083 ) ( CLEAR ?auto_152082 ) ( ON-TABLE ?auto_152080 ) ( ON ?auto_152081 ?auto_152080 ) ( ON ?auto_152082 ?auto_152081 ) ( not ( = ?auto_152080 ?auto_152081 ) ) ( not ( = ?auto_152080 ?auto_152082 ) ) ( not ( = ?auto_152080 ?auto_152083 ) ) ( not ( = ?auto_152081 ?auto_152082 ) ) ( not ( = ?auto_152081 ?auto_152083 ) ) ( not ( = ?auto_152082 ?auto_152083 ) ) )
    :subtasks
    ( ( !STACK ?auto_152083 ?auto_152082 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152084 - BLOCK
      ?auto_152085 - BLOCK
      ?auto_152086 - BLOCK
      ?auto_152087 - BLOCK
    )
    :vars
    (
      ?auto_152088 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_152086 ) ( ON-TABLE ?auto_152084 ) ( ON ?auto_152085 ?auto_152084 ) ( ON ?auto_152086 ?auto_152085 ) ( not ( = ?auto_152084 ?auto_152085 ) ) ( not ( = ?auto_152084 ?auto_152086 ) ) ( not ( = ?auto_152084 ?auto_152087 ) ) ( not ( = ?auto_152085 ?auto_152086 ) ) ( not ( = ?auto_152085 ?auto_152087 ) ) ( not ( = ?auto_152086 ?auto_152087 ) ) ( ON ?auto_152087 ?auto_152088 ) ( CLEAR ?auto_152087 ) ( HAND-EMPTY ) ( not ( = ?auto_152084 ?auto_152088 ) ) ( not ( = ?auto_152085 ?auto_152088 ) ) ( not ( = ?auto_152086 ?auto_152088 ) ) ( not ( = ?auto_152087 ?auto_152088 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_152087 ?auto_152088 )
      ( MAKE-4PILE ?auto_152084 ?auto_152085 ?auto_152086 ?auto_152087 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152089 - BLOCK
      ?auto_152090 - BLOCK
      ?auto_152091 - BLOCK
      ?auto_152092 - BLOCK
    )
    :vars
    (
      ?auto_152093 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_152089 ) ( ON ?auto_152090 ?auto_152089 ) ( not ( = ?auto_152089 ?auto_152090 ) ) ( not ( = ?auto_152089 ?auto_152091 ) ) ( not ( = ?auto_152089 ?auto_152092 ) ) ( not ( = ?auto_152090 ?auto_152091 ) ) ( not ( = ?auto_152090 ?auto_152092 ) ) ( not ( = ?auto_152091 ?auto_152092 ) ) ( ON ?auto_152092 ?auto_152093 ) ( CLEAR ?auto_152092 ) ( not ( = ?auto_152089 ?auto_152093 ) ) ( not ( = ?auto_152090 ?auto_152093 ) ) ( not ( = ?auto_152091 ?auto_152093 ) ) ( not ( = ?auto_152092 ?auto_152093 ) ) ( HOLDING ?auto_152091 ) ( CLEAR ?auto_152090 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_152089 ?auto_152090 ?auto_152091 )
      ( MAKE-4PILE ?auto_152089 ?auto_152090 ?auto_152091 ?auto_152092 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152094 - BLOCK
      ?auto_152095 - BLOCK
      ?auto_152096 - BLOCK
      ?auto_152097 - BLOCK
    )
    :vars
    (
      ?auto_152098 - BLOCK
      ?auto_152101 - BLOCK
      ?auto_152100 - BLOCK
      ?auto_152099 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_152094 ) ( ON ?auto_152095 ?auto_152094 ) ( not ( = ?auto_152094 ?auto_152095 ) ) ( not ( = ?auto_152094 ?auto_152096 ) ) ( not ( = ?auto_152094 ?auto_152097 ) ) ( not ( = ?auto_152095 ?auto_152096 ) ) ( not ( = ?auto_152095 ?auto_152097 ) ) ( not ( = ?auto_152096 ?auto_152097 ) ) ( ON ?auto_152097 ?auto_152098 ) ( not ( = ?auto_152094 ?auto_152098 ) ) ( not ( = ?auto_152095 ?auto_152098 ) ) ( not ( = ?auto_152096 ?auto_152098 ) ) ( not ( = ?auto_152097 ?auto_152098 ) ) ( CLEAR ?auto_152095 ) ( ON ?auto_152096 ?auto_152097 ) ( CLEAR ?auto_152096 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_152101 ) ( ON ?auto_152100 ?auto_152101 ) ( ON ?auto_152099 ?auto_152100 ) ( ON ?auto_152098 ?auto_152099 ) ( not ( = ?auto_152101 ?auto_152100 ) ) ( not ( = ?auto_152101 ?auto_152099 ) ) ( not ( = ?auto_152101 ?auto_152098 ) ) ( not ( = ?auto_152101 ?auto_152097 ) ) ( not ( = ?auto_152101 ?auto_152096 ) ) ( not ( = ?auto_152100 ?auto_152099 ) ) ( not ( = ?auto_152100 ?auto_152098 ) ) ( not ( = ?auto_152100 ?auto_152097 ) ) ( not ( = ?auto_152100 ?auto_152096 ) ) ( not ( = ?auto_152099 ?auto_152098 ) ) ( not ( = ?auto_152099 ?auto_152097 ) ) ( not ( = ?auto_152099 ?auto_152096 ) ) ( not ( = ?auto_152094 ?auto_152101 ) ) ( not ( = ?auto_152094 ?auto_152100 ) ) ( not ( = ?auto_152094 ?auto_152099 ) ) ( not ( = ?auto_152095 ?auto_152101 ) ) ( not ( = ?auto_152095 ?auto_152100 ) ) ( not ( = ?auto_152095 ?auto_152099 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_152101 ?auto_152100 ?auto_152099 ?auto_152098 ?auto_152097 )
      ( MAKE-4PILE ?auto_152094 ?auto_152095 ?auto_152096 ?auto_152097 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152102 - BLOCK
      ?auto_152103 - BLOCK
      ?auto_152104 - BLOCK
      ?auto_152105 - BLOCK
    )
    :vars
    (
      ?auto_152107 - BLOCK
      ?auto_152106 - BLOCK
      ?auto_152108 - BLOCK
      ?auto_152109 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_152102 ) ( not ( = ?auto_152102 ?auto_152103 ) ) ( not ( = ?auto_152102 ?auto_152104 ) ) ( not ( = ?auto_152102 ?auto_152105 ) ) ( not ( = ?auto_152103 ?auto_152104 ) ) ( not ( = ?auto_152103 ?auto_152105 ) ) ( not ( = ?auto_152104 ?auto_152105 ) ) ( ON ?auto_152105 ?auto_152107 ) ( not ( = ?auto_152102 ?auto_152107 ) ) ( not ( = ?auto_152103 ?auto_152107 ) ) ( not ( = ?auto_152104 ?auto_152107 ) ) ( not ( = ?auto_152105 ?auto_152107 ) ) ( ON ?auto_152104 ?auto_152105 ) ( CLEAR ?auto_152104 ) ( ON-TABLE ?auto_152106 ) ( ON ?auto_152108 ?auto_152106 ) ( ON ?auto_152109 ?auto_152108 ) ( ON ?auto_152107 ?auto_152109 ) ( not ( = ?auto_152106 ?auto_152108 ) ) ( not ( = ?auto_152106 ?auto_152109 ) ) ( not ( = ?auto_152106 ?auto_152107 ) ) ( not ( = ?auto_152106 ?auto_152105 ) ) ( not ( = ?auto_152106 ?auto_152104 ) ) ( not ( = ?auto_152108 ?auto_152109 ) ) ( not ( = ?auto_152108 ?auto_152107 ) ) ( not ( = ?auto_152108 ?auto_152105 ) ) ( not ( = ?auto_152108 ?auto_152104 ) ) ( not ( = ?auto_152109 ?auto_152107 ) ) ( not ( = ?auto_152109 ?auto_152105 ) ) ( not ( = ?auto_152109 ?auto_152104 ) ) ( not ( = ?auto_152102 ?auto_152106 ) ) ( not ( = ?auto_152102 ?auto_152108 ) ) ( not ( = ?auto_152102 ?auto_152109 ) ) ( not ( = ?auto_152103 ?auto_152106 ) ) ( not ( = ?auto_152103 ?auto_152108 ) ) ( not ( = ?auto_152103 ?auto_152109 ) ) ( HOLDING ?auto_152103 ) ( CLEAR ?auto_152102 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_152102 ?auto_152103 )
      ( MAKE-4PILE ?auto_152102 ?auto_152103 ?auto_152104 ?auto_152105 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152110 - BLOCK
      ?auto_152111 - BLOCK
      ?auto_152112 - BLOCK
      ?auto_152113 - BLOCK
    )
    :vars
    (
      ?auto_152115 - BLOCK
      ?auto_152117 - BLOCK
      ?auto_152116 - BLOCK
      ?auto_152114 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_152110 ) ( not ( = ?auto_152110 ?auto_152111 ) ) ( not ( = ?auto_152110 ?auto_152112 ) ) ( not ( = ?auto_152110 ?auto_152113 ) ) ( not ( = ?auto_152111 ?auto_152112 ) ) ( not ( = ?auto_152111 ?auto_152113 ) ) ( not ( = ?auto_152112 ?auto_152113 ) ) ( ON ?auto_152113 ?auto_152115 ) ( not ( = ?auto_152110 ?auto_152115 ) ) ( not ( = ?auto_152111 ?auto_152115 ) ) ( not ( = ?auto_152112 ?auto_152115 ) ) ( not ( = ?auto_152113 ?auto_152115 ) ) ( ON ?auto_152112 ?auto_152113 ) ( ON-TABLE ?auto_152117 ) ( ON ?auto_152116 ?auto_152117 ) ( ON ?auto_152114 ?auto_152116 ) ( ON ?auto_152115 ?auto_152114 ) ( not ( = ?auto_152117 ?auto_152116 ) ) ( not ( = ?auto_152117 ?auto_152114 ) ) ( not ( = ?auto_152117 ?auto_152115 ) ) ( not ( = ?auto_152117 ?auto_152113 ) ) ( not ( = ?auto_152117 ?auto_152112 ) ) ( not ( = ?auto_152116 ?auto_152114 ) ) ( not ( = ?auto_152116 ?auto_152115 ) ) ( not ( = ?auto_152116 ?auto_152113 ) ) ( not ( = ?auto_152116 ?auto_152112 ) ) ( not ( = ?auto_152114 ?auto_152115 ) ) ( not ( = ?auto_152114 ?auto_152113 ) ) ( not ( = ?auto_152114 ?auto_152112 ) ) ( not ( = ?auto_152110 ?auto_152117 ) ) ( not ( = ?auto_152110 ?auto_152116 ) ) ( not ( = ?auto_152110 ?auto_152114 ) ) ( not ( = ?auto_152111 ?auto_152117 ) ) ( not ( = ?auto_152111 ?auto_152116 ) ) ( not ( = ?auto_152111 ?auto_152114 ) ) ( CLEAR ?auto_152110 ) ( ON ?auto_152111 ?auto_152112 ) ( CLEAR ?auto_152111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_152117 ?auto_152116 ?auto_152114 ?auto_152115 ?auto_152113 ?auto_152112 )
      ( MAKE-4PILE ?auto_152110 ?auto_152111 ?auto_152112 ?auto_152113 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152118 - BLOCK
      ?auto_152119 - BLOCK
      ?auto_152120 - BLOCK
      ?auto_152121 - BLOCK
    )
    :vars
    (
      ?auto_152123 - BLOCK
      ?auto_152124 - BLOCK
      ?auto_152125 - BLOCK
      ?auto_152122 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152118 ?auto_152119 ) ) ( not ( = ?auto_152118 ?auto_152120 ) ) ( not ( = ?auto_152118 ?auto_152121 ) ) ( not ( = ?auto_152119 ?auto_152120 ) ) ( not ( = ?auto_152119 ?auto_152121 ) ) ( not ( = ?auto_152120 ?auto_152121 ) ) ( ON ?auto_152121 ?auto_152123 ) ( not ( = ?auto_152118 ?auto_152123 ) ) ( not ( = ?auto_152119 ?auto_152123 ) ) ( not ( = ?auto_152120 ?auto_152123 ) ) ( not ( = ?auto_152121 ?auto_152123 ) ) ( ON ?auto_152120 ?auto_152121 ) ( ON-TABLE ?auto_152124 ) ( ON ?auto_152125 ?auto_152124 ) ( ON ?auto_152122 ?auto_152125 ) ( ON ?auto_152123 ?auto_152122 ) ( not ( = ?auto_152124 ?auto_152125 ) ) ( not ( = ?auto_152124 ?auto_152122 ) ) ( not ( = ?auto_152124 ?auto_152123 ) ) ( not ( = ?auto_152124 ?auto_152121 ) ) ( not ( = ?auto_152124 ?auto_152120 ) ) ( not ( = ?auto_152125 ?auto_152122 ) ) ( not ( = ?auto_152125 ?auto_152123 ) ) ( not ( = ?auto_152125 ?auto_152121 ) ) ( not ( = ?auto_152125 ?auto_152120 ) ) ( not ( = ?auto_152122 ?auto_152123 ) ) ( not ( = ?auto_152122 ?auto_152121 ) ) ( not ( = ?auto_152122 ?auto_152120 ) ) ( not ( = ?auto_152118 ?auto_152124 ) ) ( not ( = ?auto_152118 ?auto_152125 ) ) ( not ( = ?auto_152118 ?auto_152122 ) ) ( not ( = ?auto_152119 ?auto_152124 ) ) ( not ( = ?auto_152119 ?auto_152125 ) ) ( not ( = ?auto_152119 ?auto_152122 ) ) ( ON ?auto_152119 ?auto_152120 ) ( CLEAR ?auto_152119 ) ( HOLDING ?auto_152118 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_152118 )
      ( MAKE-4PILE ?auto_152118 ?auto_152119 ?auto_152120 ?auto_152121 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152126 - BLOCK
      ?auto_152127 - BLOCK
      ?auto_152128 - BLOCK
      ?auto_152129 - BLOCK
    )
    :vars
    (
      ?auto_152132 - BLOCK
      ?auto_152131 - BLOCK
      ?auto_152130 - BLOCK
      ?auto_152133 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152126 ?auto_152127 ) ) ( not ( = ?auto_152126 ?auto_152128 ) ) ( not ( = ?auto_152126 ?auto_152129 ) ) ( not ( = ?auto_152127 ?auto_152128 ) ) ( not ( = ?auto_152127 ?auto_152129 ) ) ( not ( = ?auto_152128 ?auto_152129 ) ) ( ON ?auto_152129 ?auto_152132 ) ( not ( = ?auto_152126 ?auto_152132 ) ) ( not ( = ?auto_152127 ?auto_152132 ) ) ( not ( = ?auto_152128 ?auto_152132 ) ) ( not ( = ?auto_152129 ?auto_152132 ) ) ( ON ?auto_152128 ?auto_152129 ) ( ON-TABLE ?auto_152131 ) ( ON ?auto_152130 ?auto_152131 ) ( ON ?auto_152133 ?auto_152130 ) ( ON ?auto_152132 ?auto_152133 ) ( not ( = ?auto_152131 ?auto_152130 ) ) ( not ( = ?auto_152131 ?auto_152133 ) ) ( not ( = ?auto_152131 ?auto_152132 ) ) ( not ( = ?auto_152131 ?auto_152129 ) ) ( not ( = ?auto_152131 ?auto_152128 ) ) ( not ( = ?auto_152130 ?auto_152133 ) ) ( not ( = ?auto_152130 ?auto_152132 ) ) ( not ( = ?auto_152130 ?auto_152129 ) ) ( not ( = ?auto_152130 ?auto_152128 ) ) ( not ( = ?auto_152133 ?auto_152132 ) ) ( not ( = ?auto_152133 ?auto_152129 ) ) ( not ( = ?auto_152133 ?auto_152128 ) ) ( not ( = ?auto_152126 ?auto_152131 ) ) ( not ( = ?auto_152126 ?auto_152130 ) ) ( not ( = ?auto_152126 ?auto_152133 ) ) ( not ( = ?auto_152127 ?auto_152131 ) ) ( not ( = ?auto_152127 ?auto_152130 ) ) ( not ( = ?auto_152127 ?auto_152133 ) ) ( ON ?auto_152127 ?auto_152128 ) ( ON ?auto_152126 ?auto_152127 ) ( CLEAR ?auto_152126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_152131 ?auto_152130 ?auto_152133 ?auto_152132 ?auto_152129 ?auto_152128 ?auto_152127 )
      ( MAKE-4PILE ?auto_152126 ?auto_152127 ?auto_152128 ?auto_152129 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152134 - BLOCK
      ?auto_152135 - BLOCK
      ?auto_152136 - BLOCK
      ?auto_152137 - BLOCK
    )
    :vars
    (
      ?auto_152138 - BLOCK
      ?auto_152141 - BLOCK
      ?auto_152140 - BLOCK
      ?auto_152139 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152134 ?auto_152135 ) ) ( not ( = ?auto_152134 ?auto_152136 ) ) ( not ( = ?auto_152134 ?auto_152137 ) ) ( not ( = ?auto_152135 ?auto_152136 ) ) ( not ( = ?auto_152135 ?auto_152137 ) ) ( not ( = ?auto_152136 ?auto_152137 ) ) ( ON ?auto_152137 ?auto_152138 ) ( not ( = ?auto_152134 ?auto_152138 ) ) ( not ( = ?auto_152135 ?auto_152138 ) ) ( not ( = ?auto_152136 ?auto_152138 ) ) ( not ( = ?auto_152137 ?auto_152138 ) ) ( ON ?auto_152136 ?auto_152137 ) ( ON-TABLE ?auto_152141 ) ( ON ?auto_152140 ?auto_152141 ) ( ON ?auto_152139 ?auto_152140 ) ( ON ?auto_152138 ?auto_152139 ) ( not ( = ?auto_152141 ?auto_152140 ) ) ( not ( = ?auto_152141 ?auto_152139 ) ) ( not ( = ?auto_152141 ?auto_152138 ) ) ( not ( = ?auto_152141 ?auto_152137 ) ) ( not ( = ?auto_152141 ?auto_152136 ) ) ( not ( = ?auto_152140 ?auto_152139 ) ) ( not ( = ?auto_152140 ?auto_152138 ) ) ( not ( = ?auto_152140 ?auto_152137 ) ) ( not ( = ?auto_152140 ?auto_152136 ) ) ( not ( = ?auto_152139 ?auto_152138 ) ) ( not ( = ?auto_152139 ?auto_152137 ) ) ( not ( = ?auto_152139 ?auto_152136 ) ) ( not ( = ?auto_152134 ?auto_152141 ) ) ( not ( = ?auto_152134 ?auto_152140 ) ) ( not ( = ?auto_152134 ?auto_152139 ) ) ( not ( = ?auto_152135 ?auto_152141 ) ) ( not ( = ?auto_152135 ?auto_152140 ) ) ( not ( = ?auto_152135 ?auto_152139 ) ) ( ON ?auto_152135 ?auto_152136 ) ( HOLDING ?auto_152134 ) ( CLEAR ?auto_152135 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_152141 ?auto_152140 ?auto_152139 ?auto_152138 ?auto_152137 ?auto_152136 ?auto_152135 ?auto_152134 )
      ( MAKE-4PILE ?auto_152134 ?auto_152135 ?auto_152136 ?auto_152137 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152142 - BLOCK
      ?auto_152143 - BLOCK
      ?auto_152144 - BLOCK
      ?auto_152145 - BLOCK
    )
    :vars
    (
      ?auto_152147 - BLOCK
      ?auto_152146 - BLOCK
      ?auto_152148 - BLOCK
      ?auto_152149 - BLOCK
      ?auto_152150 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152142 ?auto_152143 ) ) ( not ( = ?auto_152142 ?auto_152144 ) ) ( not ( = ?auto_152142 ?auto_152145 ) ) ( not ( = ?auto_152143 ?auto_152144 ) ) ( not ( = ?auto_152143 ?auto_152145 ) ) ( not ( = ?auto_152144 ?auto_152145 ) ) ( ON ?auto_152145 ?auto_152147 ) ( not ( = ?auto_152142 ?auto_152147 ) ) ( not ( = ?auto_152143 ?auto_152147 ) ) ( not ( = ?auto_152144 ?auto_152147 ) ) ( not ( = ?auto_152145 ?auto_152147 ) ) ( ON ?auto_152144 ?auto_152145 ) ( ON-TABLE ?auto_152146 ) ( ON ?auto_152148 ?auto_152146 ) ( ON ?auto_152149 ?auto_152148 ) ( ON ?auto_152147 ?auto_152149 ) ( not ( = ?auto_152146 ?auto_152148 ) ) ( not ( = ?auto_152146 ?auto_152149 ) ) ( not ( = ?auto_152146 ?auto_152147 ) ) ( not ( = ?auto_152146 ?auto_152145 ) ) ( not ( = ?auto_152146 ?auto_152144 ) ) ( not ( = ?auto_152148 ?auto_152149 ) ) ( not ( = ?auto_152148 ?auto_152147 ) ) ( not ( = ?auto_152148 ?auto_152145 ) ) ( not ( = ?auto_152148 ?auto_152144 ) ) ( not ( = ?auto_152149 ?auto_152147 ) ) ( not ( = ?auto_152149 ?auto_152145 ) ) ( not ( = ?auto_152149 ?auto_152144 ) ) ( not ( = ?auto_152142 ?auto_152146 ) ) ( not ( = ?auto_152142 ?auto_152148 ) ) ( not ( = ?auto_152142 ?auto_152149 ) ) ( not ( = ?auto_152143 ?auto_152146 ) ) ( not ( = ?auto_152143 ?auto_152148 ) ) ( not ( = ?auto_152143 ?auto_152149 ) ) ( ON ?auto_152143 ?auto_152144 ) ( CLEAR ?auto_152143 ) ( ON ?auto_152142 ?auto_152150 ) ( CLEAR ?auto_152142 ) ( HAND-EMPTY ) ( not ( = ?auto_152142 ?auto_152150 ) ) ( not ( = ?auto_152143 ?auto_152150 ) ) ( not ( = ?auto_152144 ?auto_152150 ) ) ( not ( = ?auto_152145 ?auto_152150 ) ) ( not ( = ?auto_152147 ?auto_152150 ) ) ( not ( = ?auto_152146 ?auto_152150 ) ) ( not ( = ?auto_152148 ?auto_152150 ) ) ( not ( = ?auto_152149 ?auto_152150 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_152142 ?auto_152150 )
      ( MAKE-4PILE ?auto_152142 ?auto_152143 ?auto_152144 ?auto_152145 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152151 - BLOCK
      ?auto_152152 - BLOCK
      ?auto_152153 - BLOCK
      ?auto_152154 - BLOCK
    )
    :vars
    (
      ?auto_152156 - BLOCK
      ?auto_152159 - BLOCK
      ?auto_152158 - BLOCK
      ?auto_152155 - BLOCK
      ?auto_152157 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152151 ?auto_152152 ) ) ( not ( = ?auto_152151 ?auto_152153 ) ) ( not ( = ?auto_152151 ?auto_152154 ) ) ( not ( = ?auto_152152 ?auto_152153 ) ) ( not ( = ?auto_152152 ?auto_152154 ) ) ( not ( = ?auto_152153 ?auto_152154 ) ) ( ON ?auto_152154 ?auto_152156 ) ( not ( = ?auto_152151 ?auto_152156 ) ) ( not ( = ?auto_152152 ?auto_152156 ) ) ( not ( = ?auto_152153 ?auto_152156 ) ) ( not ( = ?auto_152154 ?auto_152156 ) ) ( ON ?auto_152153 ?auto_152154 ) ( ON-TABLE ?auto_152159 ) ( ON ?auto_152158 ?auto_152159 ) ( ON ?auto_152155 ?auto_152158 ) ( ON ?auto_152156 ?auto_152155 ) ( not ( = ?auto_152159 ?auto_152158 ) ) ( not ( = ?auto_152159 ?auto_152155 ) ) ( not ( = ?auto_152159 ?auto_152156 ) ) ( not ( = ?auto_152159 ?auto_152154 ) ) ( not ( = ?auto_152159 ?auto_152153 ) ) ( not ( = ?auto_152158 ?auto_152155 ) ) ( not ( = ?auto_152158 ?auto_152156 ) ) ( not ( = ?auto_152158 ?auto_152154 ) ) ( not ( = ?auto_152158 ?auto_152153 ) ) ( not ( = ?auto_152155 ?auto_152156 ) ) ( not ( = ?auto_152155 ?auto_152154 ) ) ( not ( = ?auto_152155 ?auto_152153 ) ) ( not ( = ?auto_152151 ?auto_152159 ) ) ( not ( = ?auto_152151 ?auto_152158 ) ) ( not ( = ?auto_152151 ?auto_152155 ) ) ( not ( = ?auto_152152 ?auto_152159 ) ) ( not ( = ?auto_152152 ?auto_152158 ) ) ( not ( = ?auto_152152 ?auto_152155 ) ) ( ON ?auto_152151 ?auto_152157 ) ( CLEAR ?auto_152151 ) ( not ( = ?auto_152151 ?auto_152157 ) ) ( not ( = ?auto_152152 ?auto_152157 ) ) ( not ( = ?auto_152153 ?auto_152157 ) ) ( not ( = ?auto_152154 ?auto_152157 ) ) ( not ( = ?auto_152156 ?auto_152157 ) ) ( not ( = ?auto_152159 ?auto_152157 ) ) ( not ( = ?auto_152158 ?auto_152157 ) ) ( not ( = ?auto_152155 ?auto_152157 ) ) ( HOLDING ?auto_152152 ) ( CLEAR ?auto_152153 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_152159 ?auto_152158 ?auto_152155 ?auto_152156 ?auto_152154 ?auto_152153 ?auto_152152 )
      ( MAKE-4PILE ?auto_152151 ?auto_152152 ?auto_152153 ?auto_152154 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152160 - BLOCK
      ?auto_152161 - BLOCK
      ?auto_152162 - BLOCK
      ?auto_152163 - BLOCK
    )
    :vars
    (
      ?auto_152166 - BLOCK
      ?auto_152167 - BLOCK
      ?auto_152165 - BLOCK
      ?auto_152164 - BLOCK
      ?auto_152168 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152160 ?auto_152161 ) ) ( not ( = ?auto_152160 ?auto_152162 ) ) ( not ( = ?auto_152160 ?auto_152163 ) ) ( not ( = ?auto_152161 ?auto_152162 ) ) ( not ( = ?auto_152161 ?auto_152163 ) ) ( not ( = ?auto_152162 ?auto_152163 ) ) ( ON ?auto_152163 ?auto_152166 ) ( not ( = ?auto_152160 ?auto_152166 ) ) ( not ( = ?auto_152161 ?auto_152166 ) ) ( not ( = ?auto_152162 ?auto_152166 ) ) ( not ( = ?auto_152163 ?auto_152166 ) ) ( ON ?auto_152162 ?auto_152163 ) ( ON-TABLE ?auto_152167 ) ( ON ?auto_152165 ?auto_152167 ) ( ON ?auto_152164 ?auto_152165 ) ( ON ?auto_152166 ?auto_152164 ) ( not ( = ?auto_152167 ?auto_152165 ) ) ( not ( = ?auto_152167 ?auto_152164 ) ) ( not ( = ?auto_152167 ?auto_152166 ) ) ( not ( = ?auto_152167 ?auto_152163 ) ) ( not ( = ?auto_152167 ?auto_152162 ) ) ( not ( = ?auto_152165 ?auto_152164 ) ) ( not ( = ?auto_152165 ?auto_152166 ) ) ( not ( = ?auto_152165 ?auto_152163 ) ) ( not ( = ?auto_152165 ?auto_152162 ) ) ( not ( = ?auto_152164 ?auto_152166 ) ) ( not ( = ?auto_152164 ?auto_152163 ) ) ( not ( = ?auto_152164 ?auto_152162 ) ) ( not ( = ?auto_152160 ?auto_152167 ) ) ( not ( = ?auto_152160 ?auto_152165 ) ) ( not ( = ?auto_152160 ?auto_152164 ) ) ( not ( = ?auto_152161 ?auto_152167 ) ) ( not ( = ?auto_152161 ?auto_152165 ) ) ( not ( = ?auto_152161 ?auto_152164 ) ) ( ON ?auto_152160 ?auto_152168 ) ( not ( = ?auto_152160 ?auto_152168 ) ) ( not ( = ?auto_152161 ?auto_152168 ) ) ( not ( = ?auto_152162 ?auto_152168 ) ) ( not ( = ?auto_152163 ?auto_152168 ) ) ( not ( = ?auto_152166 ?auto_152168 ) ) ( not ( = ?auto_152167 ?auto_152168 ) ) ( not ( = ?auto_152165 ?auto_152168 ) ) ( not ( = ?auto_152164 ?auto_152168 ) ) ( CLEAR ?auto_152162 ) ( ON ?auto_152161 ?auto_152160 ) ( CLEAR ?auto_152161 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_152168 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_152168 ?auto_152160 )
      ( MAKE-4PILE ?auto_152160 ?auto_152161 ?auto_152162 ?auto_152163 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152169 - BLOCK
      ?auto_152170 - BLOCK
      ?auto_152171 - BLOCK
      ?auto_152172 - BLOCK
    )
    :vars
    (
      ?auto_152177 - BLOCK
      ?auto_152174 - BLOCK
      ?auto_152175 - BLOCK
      ?auto_152173 - BLOCK
      ?auto_152176 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152169 ?auto_152170 ) ) ( not ( = ?auto_152169 ?auto_152171 ) ) ( not ( = ?auto_152169 ?auto_152172 ) ) ( not ( = ?auto_152170 ?auto_152171 ) ) ( not ( = ?auto_152170 ?auto_152172 ) ) ( not ( = ?auto_152171 ?auto_152172 ) ) ( ON ?auto_152172 ?auto_152177 ) ( not ( = ?auto_152169 ?auto_152177 ) ) ( not ( = ?auto_152170 ?auto_152177 ) ) ( not ( = ?auto_152171 ?auto_152177 ) ) ( not ( = ?auto_152172 ?auto_152177 ) ) ( ON-TABLE ?auto_152174 ) ( ON ?auto_152175 ?auto_152174 ) ( ON ?auto_152173 ?auto_152175 ) ( ON ?auto_152177 ?auto_152173 ) ( not ( = ?auto_152174 ?auto_152175 ) ) ( not ( = ?auto_152174 ?auto_152173 ) ) ( not ( = ?auto_152174 ?auto_152177 ) ) ( not ( = ?auto_152174 ?auto_152172 ) ) ( not ( = ?auto_152174 ?auto_152171 ) ) ( not ( = ?auto_152175 ?auto_152173 ) ) ( not ( = ?auto_152175 ?auto_152177 ) ) ( not ( = ?auto_152175 ?auto_152172 ) ) ( not ( = ?auto_152175 ?auto_152171 ) ) ( not ( = ?auto_152173 ?auto_152177 ) ) ( not ( = ?auto_152173 ?auto_152172 ) ) ( not ( = ?auto_152173 ?auto_152171 ) ) ( not ( = ?auto_152169 ?auto_152174 ) ) ( not ( = ?auto_152169 ?auto_152175 ) ) ( not ( = ?auto_152169 ?auto_152173 ) ) ( not ( = ?auto_152170 ?auto_152174 ) ) ( not ( = ?auto_152170 ?auto_152175 ) ) ( not ( = ?auto_152170 ?auto_152173 ) ) ( ON ?auto_152169 ?auto_152176 ) ( not ( = ?auto_152169 ?auto_152176 ) ) ( not ( = ?auto_152170 ?auto_152176 ) ) ( not ( = ?auto_152171 ?auto_152176 ) ) ( not ( = ?auto_152172 ?auto_152176 ) ) ( not ( = ?auto_152177 ?auto_152176 ) ) ( not ( = ?auto_152174 ?auto_152176 ) ) ( not ( = ?auto_152175 ?auto_152176 ) ) ( not ( = ?auto_152173 ?auto_152176 ) ) ( ON ?auto_152170 ?auto_152169 ) ( CLEAR ?auto_152170 ) ( ON-TABLE ?auto_152176 ) ( HOLDING ?auto_152171 ) ( CLEAR ?auto_152172 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_152174 ?auto_152175 ?auto_152173 ?auto_152177 ?auto_152172 ?auto_152171 )
      ( MAKE-4PILE ?auto_152169 ?auto_152170 ?auto_152171 ?auto_152172 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152178 - BLOCK
      ?auto_152179 - BLOCK
      ?auto_152180 - BLOCK
      ?auto_152181 - BLOCK
    )
    :vars
    (
      ?auto_152186 - BLOCK
      ?auto_152184 - BLOCK
      ?auto_152185 - BLOCK
      ?auto_152183 - BLOCK
      ?auto_152182 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152178 ?auto_152179 ) ) ( not ( = ?auto_152178 ?auto_152180 ) ) ( not ( = ?auto_152178 ?auto_152181 ) ) ( not ( = ?auto_152179 ?auto_152180 ) ) ( not ( = ?auto_152179 ?auto_152181 ) ) ( not ( = ?auto_152180 ?auto_152181 ) ) ( ON ?auto_152181 ?auto_152186 ) ( not ( = ?auto_152178 ?auto_152186 ) ) ( not ( = ?auto_152179 ?auto_152186 ) ) ( not ( = ?auto_152180 ?auto_152186 ) ) ( not ( = ?auto_152181 ?auto_152186 ) ) ( ON-TABLE ?auto_152184 ) ( ON ?auto_152185 ?auto_152184 ) ( ON ?auto_152183 ?auto_152185 ) ( ON ?auto_152186 ?auto_152183 ) ( not ( = ?auto_152184 ?auto_152185 ) ) ( not ( = ?auto_152184 ?auto_152183 ) ) ( not ( = ?auto_152184 ?auto_152186 ) ) ( not ( = ?auto_152184 ?auto_152181 ) ) ( not ( = ?auto_152184 ?auto_152180 ) ) ( not ( = ?auto_152185 ?auto_152183 ) ) ( not ( = ?auto_152185 ?auto_152186 ) ) ( not ( = ?auto_152185 ?auto_152181 ) ) ( not ( = ?auto_152185 ?auto_152180 ) ) ( not ( = ?auto_152183 ?auto_152186 ) ) ( not ( = ?auto_152183 ?auto_152181 ) ) ( not ( = ?auto_152183 ?auto_152180 ) ) ( not ( = ?auto_152178 ?auto_152184 ) ) ( not ( = ?auto_152178 ?auto_152185 ) ) ( not ( = ?auto_152178 ?auto_152183 ) ) ( not ( = ?auto_152179 ?auto_152184 ) ) ( not ( = ?auto_152179 ?auto_152185 ) ) ( not ( = ?auto_152179 ?auto_152183 ) ) ( ON ?auto_152178 ?auto_152182 ) ( not ( = ?auto_152178 ?auto_152182 ) ) ( not ( = ?auto_152179 ?auto_152182 ) ) ( not ( = ?auto_152180 ?auto_152182 ) ) ( not ( = ?auto_152181 ?auto_152182 ) ) ( not ( = ?auto_152186 ?auto_152182 ) ) ( not ( = ?auto_152184 ?auto_152182 ) ) ( not ( = ?auto_152185 ?auto_152182 ) ) ( not ( = ?auto_152183 ?auto_152182 ) ) ( ON ?auto_152179 ?auto_152178 ) ( ON-TABLE ?auto_152182 ) ( CLEAR ?auto_152181 ) ( ON ?auto_152180 ?auto_152179 ) ( CLEAR ?auto_152180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_152182 ?auto_152178 ?auto_152179 )
      ( MAKE-4PILE ?auto_152178 ?auto_152179 ?auto_152180 ?auto_152181 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152187 - BLOCK
      ?auto_152188 - BLOCK
      ?auto_152189 - BLOCK
      ?auto_152190 - BLOCK
    )
    :vars
    (
      ?auto_152192 - BLOCK
      ?auto_152193 - BLOCK
      ?auto_152194 - BLOCK
      ?auto_152195 - BLOCK
      ?auto_152191 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152187 ?auto_152188 ) ) ( not ( = ?auto_152187 ?auto_152189 ) ) ( not ( = ?auto_152187 ?auto_152190 ) ) ( not ( = ?auto_152188 ?auto_152189 ) ) ( not ( = ?auto_152188 ?auto_152190 ) ) ( not ( = ?auto_152189 ?auto_152190 ) ) ( not ( = ?auto_152187 ?auto_152192 ) ) ( not ( = ?auto_152188 ?auto_152192 ) ) ( not ( = ?auto_152189 ?auto_152192 ) ) ( not ( = ?auto_152190 ?auto_152192 ) ) ( ON-TABLE ?auto_152193 ) ( ON ?auto_152194 ?auto_152193 ) ( ON ?auto_152195 ?auto_152194 ) ( ON ?auto_152192 ?auto_152195 ) ( not ( = ?auto_152193 ?auto_152194 ) ) ( not ( = ?auto_152193 ?auto_152195 ) ) ( not ( = ?auto_152193 ?auto_152192 ) ) ( not ( = ?auto_152193 ?auto_152190 ) ) ( not ( = ?auto_152193 ?auto_152189 ) ) ( not ( = ?auto_152194 ?auto_152195 ) ) ( not ( = ?auto_152194 ?auto_152192 ) ) ( not ( = ?auto_152194 ?auto_152190 ) ) ( not ( = ?auto_152194 ?auto_152189 ) ) ( not ( = ?auto_152195 ?auto_152192 ) ) ( not ( = ?auto_152195 ?auto_152190 ) ) ( not ( = ?auto_152195 ?auto_152189 ) ) ( not ( = ?auto_152187 ?auto_152193 ) ) ( not ( = ?auto_152187 ?auto_152194 ) ) ( not ( = ?auto_152187 ?auto_152195 ) ) ( not ( = ?auto_152188 ?auto_152193 ) ) ( not ( = ?auto_152188 ?auto_152194 ) ) ( not ( = ?auto_152188 ?auto_152195 ) ) ( ON ?auto_152187 ?auto_152191 ) ( not ( = ?auto_152187 ?auto_152191 ) ) ( not ( = ?auto_152188 ?auto_152191 ) ) ( not ( = ?auto_152189 ?auto_152191 ) ) ( not ( = ?auto_152190 ?auto_152191 ) ) ( not ( = ?auto_152192 ?auto_152191 ) ) ( not ( = ?auto_152193 ?auto_152191 ) ) ( not ( = ?auto_152194 ?auto_152191 ) ) ( not ( = ?auto_152195 ?auto_152191 ) ) ( ON ?auto_152188 ?auto_152187 ) ( ON-TABLE ?auto_152191 ) ( ON ?auto_152189 ?auto_152188 ) ( CLEAR ?auto_152189 ) ( HOLDING ?auto_152190 ) ( CLEAR ?auto_152192 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_152193 ?auto_152194 ?auto_152195 ?auto_152192 ?auto_152190 )
      ( MAKE-4PILE ?auto_152187 ?auto_152188 ?auto_152189 ?auto_152190 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152196 - BLOCK
      ?auto_152197 - BLOCK
      ?auto_152198 - BLOCK
      ?auto_152199 - BLOCK
    )
    :vars
    (
      ?auto_152204 - BLOCK
      ?auto_152203 - BLOCK
      ?auto_152202 - BLOCK
      ?auto_152201 - BLOCK
      ?auto_152200 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152196 ?auto_152197 ) ) ( not ( = ?auto_152196 ?auto_152198 ) ) ( not ( = ?auto_152196 ?auto_152199 ) ) ( not ( = ?auto_152197 ?auto_152198 ) ) ( not ( = ?auto_152197 ?auto_152199 ) ) ( not ( = ?auto_152198 ?auto_152199 ) ) ( not ( = ?auto_152196 ?auto_152204 ) ) ( not ( = ?auto_152197 ?auto_152204 ) ) ( not ( = ?auto_152198 ?auto_152204 ) ) ( not ( = ?auto_152199 ?auto_152204 ) ) ( ON-TABLE ?auto_152203 ) ( ON ?auto_152202 ?auto_152203 ) ( ON ?auto_152201 ?auto_152202 ) ( ON ?auto_152204 ?auto_152201 ) ( not ( = ?auto_152203 ?auto_152202 ) ) ( not ( = ?auto_152203 ?auto_152201 ) ) ( not ( = ?auto_152203 ?auto_152204 ) ) ( not ( = ?auto_152203 ?auto_152199 ) ) ( not ( = ?auto_152203 ?auto_152198 ) ) ( not ( = ?auto_152202 ?auto_152201 ) ) ( not ( = ?auto_152202 ?auto_152204 ) ) ( not ( = ?auto_152202 ?auto_152199 ) ) ( not ( = ?auto_152202 ?auto_152198 ) ) ( not ( = ?auto_152201 ?auto_152204 ) ) ( not ( = ?auto_152201 ?auto_152199 ) ) ( not ( = ?auto_152201 ?auto_152198 ) ) ( not ( = ?auto_152196 ?auto_152203 ) ) ( not ( = ?auto_152196 ?auto_152202 ) ) ( not ( = ?auto_152196 ?auto_152201 ) ) ( not ( = ?auto_152197 ?auto_152203 ) ) ( not ( = ?auto_152197 ?auto_152202 ) ) ( not ( = ?auto_152197 ?auto_152201 ) ) ( ON ?auto_152196 ?auto_152200 ) ( not ( = ?auto_152196 ?auto_152200 ) ) ( not ( = ?auto_152197 ?auto_152200 ) ) ( not ( = ?auto_152198 ?auto_152200 ) ) ( not ( = ?auto_152199 ?auto_152200 ) ) ( not ( = ?auto_152204 ?auto_152200 ) ) ( not ( = ?auto_152203 ?auto_152200 ) ) ( not ( = ?auto_152202 ?auto_152200 ) ) ( not ( = ?auto_152201 ?auto_152200 ) ) ( ON ?auto_152197 ?auto_152196 ) ( ON-TABLE ?auto_152200 ) ( ON ?auto_152198 ?auto_152197 ) ( CLEAR ?auto_152204 ) ( ON ?auto_152199 ?auto_152198 ) ( CLEAR ?auto_152199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_152200 ?auto_152196 ?auto_152197 ?auto_152198 )
      ( MAKE-4PILE ?auto_152196 ?auto_152197 ?auto_152198 ?auto_152199 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152205 - BLOCK
      ?auto_152206 - BLOCK
      ?auto_152207 - BLOCK
      ?auto_152208 - BLOCK
    )
    :vars
    (
      ?auto_152213 - BLOCK
      ?auto_152212 - BLOCK
      ?auto_152209 - BLOCK
      ?auto_152211 - BLOCK
      ?auto_152210 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152205 ?auto_152206 ) ) ( not ( = ?auto_152205 ?auto_152207 ) ) ( not ( = ?auto_152205 ?auto_152208 ) ) ( not ( = ?auto_152206 ?auto_152207 ) ) ( not ( = ?auto_152206 ?auto_152208 ) ) ( not ( = ?auto_152207 ?auto_152208 ) ) ( not ( = ?auto_152205 ?auto_152213 ) ) ( not ( = ?auto_152206 ?auto_152213 ) ) ( not ( = ?auto_152207 ?auto_152213 ) ) ( not ( = ?auto_152208 ?auto_152213 ) ) ( ON-TABLE ?auto_152212 ) ( ON ?auto_152209 ?auto_152212 ) ( ON ?auto_152211 ?auto_152209 ) ( not ( = ?auto_152212 ?auto_152209 ) ) ( not ( = ?auto_152212 ?auto_152211 ) ) ( not ( = ?auto_152212 ?auto_152213 ) ) ( not ( = ?auto_152212 ?auto_152208 ) ) ( not ( = ?auto_152212 ?auto_152207 ) ) ( not ( = ?auto_152209 ?auto_152211 ) ) ( not ( = ?auto_152209 ?auto_152213 ) ) ( not ( = ?auto_152209 ?auto_152208 ) ) ( not ( = ?auto_152209 ?auto_152207 ) ) ( not ( = ?auto_152211 ?auto_152213 ) ) ( not ( = ?auto_152211 ?auto_152208 ) ) ( not ( = ?auto_152211 ?auto_152207 ) ) ( not ( = ?auto_152205 ?auto_152212 ) ) ( not ( = ?auto_152205 ?auto_152209 ) ) ( not ( = ?auto_152205 ?auto_152211 ) ) ( not ( = ?auto_152206 ?auto_152212 ) ) ( not ( = ?auto_152206 ?auto_152209 ) ) ( not ( = ?auto_152206 ?auto_152211 ) ) ( ON ?auto_152205 ?auto_152210 ) ( not ( = ?auto_152205 ?auto_152210 ) ) ( not ( = ?auto_152206 ?auto_152210 ) ) ( not ( = ?auto_152207 ?auto_152210 ) ) ( not ( = ?auto_152208 ?auto_152210 ) ) ( not ( = ?auto_152213 ?auto_152210 ) ) ( not ( = ?auto_152212 ?auto_152210 ) ) ( not ( = ?auto_152209 ?auto_152210 ) ) ( not ( = ?auto_152211 ?auto_152210 ) ) ( ON ?auto_152206 ?auto_152205 ) ( ON-TABLE ?auto_152210 ) ( ON ?auto_152207 ?auto_152206 ) ( ON ?auto_152208 ?auto_152207 ) ( CLEAR ?auto_152208 ) ( HOLDING ?auto_152213 ) ( CLEAR ?auto_152211 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_152212 ?auto_152209 ?auto_152211 ?auto_152213 )
      ( MAKE-4PILE ?auto_152205 ?auto_152206 ?auto_152207 ?auto_152208 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152214 - BLOCK
      ?auto_152215 - BLOCK
      ?auto_152216 - BLOCK
      ?auto_152217 - BLOCK
    )
    :vars
    (
      ?auto_152219 - BLOCK
      ?auto_152220 - BLOCK
      ?auto_152221 - BLOCK
      ?auto_152222 - BLOCK
      ?auto_152218 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152214 ?auto_152215 ) ) ( not ( = ?auto_152214 ?auto_152216 ) ) ( not ( = ?auto_152214 ?auto_152217 ) ) ( not ( = ?auto_152215 ?auto_152216 ) ) ( not ( = ?auto_152215 ?auto_152217 ) ) ( not ( = ?auto_152216 ?auto_152217 ) ) ( not ( = ?auto_152214 ?auto_152219 ) ) ( not ( = ?auto_152215 ?auto_152219 ) ) ( not ( = ?auto_152216 ?auto_152219 ) ) ( not ( = ?auto_152217 ?auto_152219 ) ) ( ON-TABLE ?auto_152220 ) ( ON ?auto_152221 ?auto_152220 ) ( ON ?auto_152222 ?auto_152221 ) ( not ( = ?auto_152220 ?auto_152221 ) ) ( not ( = ?auto_152220 ?auto_152222 ) ) ( not ( = ?auto_152220 ?auto_152219 ) ) ( not ( = ?auto_152220 ?auto_152217 ) ) ( not ( = ?auto_152220 ?auto_152216 ) ) ( not ( = ?auto_152221 ?auto_152222 ) ) ( not ( = ?auto_152221 ?auto_152219 ) ) ( not ( = ?auto_152221 ?auto_152217 ) ) ( not ( = ?auto_152221 ?auto_152216 ) ) ( not ( = ?auto_152222 ?auto_152219 ) ) ( not ( = ?auto_152222 ?auto_152217 ) ) ( not ( = ?auto_152222 ?auto_152216 ) ) ( not ( = ?auto_152214 ?auto_152220 ) ) ( not ( = ?auto_152214 ?auto_152221 ) ) ( not ( = ?auto_152214 ?auto_152222 ) ) ( not ( = ?auto_152215 ?auto_152220 ) ) ( not ( = ?auto_152215 ?auto_152221 ) ) ( not ( = ?auto_152215 ?auto_152222 ) ) ( ON ?auto_152214 ?auto_152218 ) ( not ( = ?auto_152214 ?auto_152218 ) ) ( not ( = ?auto_152215 ?auto_152218 ) ) ( not ( = ?auto_152216 ?auto_152218 ) ) ( not ( = ?auto_152217 ?auto_152218 ) ) ( not ( = ?auto_152219 ?auto_152218 ) ) ( not ( = ?auto_152220 ?auto_152218 ) ) ( not ( = ?auto_152221 ?auto_152218 ) ) ( not ( = ?auto_152222 ?auto_152218 ) ) ( ON ?auto_152215 ?auto_152214 ) ( ON-TABLE ?auto_152218 ) ( ON ?auto_152216 ?auto_152215 ) ( ON ?auto_152217 ?auto_152216 ) ( CLEAR ?auto_152222 ) ( ON ?auto_152219 ?auto_152217 ) ( CLEAR ?auto_152219 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_152218 ?auto_152214 ?auto_152215 ?auto_152216 ?auto_152217 )
      ( MAKE-4PILE ?auto_152214 ?auto_152215 ?auto_152216 ?auto_152217 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152223 - BLOCK
      ?auto_152224 - BLOCK
      ?auto_152225 - BLOCK
      ?auto_152226 - BLOCK
    )
    :vars
    (
      ?auto_152228 - BLOCK
      ?auto_152227 - BLOCK
      ?auto_152231 - BLOCK
      ?auto_152230 - BLOCK
      ?auto_152229 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152223 ?auto_152224 ) ) ( not ( = ?auto_152223 ?auto_152225 ) ) ( not ( = ?auto_152223 ?auto_152226 ) ) ( not ( = ?auto_152224 ?auto_152225 ) ) ( not ( = ?auto_152224 ?auto_152226 ) ) ( not ( = ?auto_152225 ?auto_152226 ) ) ( not ( = ?auto_152223 ?auto_152228 ) ) ( not ( = ?auto_152224 ?auto_152228 ) ) ( not ( = ?auto_152225 ?auto_152228 ) ) ( not ( = ?auto_152226 ?auto_152228 ) ) ( ON-TABLE ?auto_152227 ) ( ON ?auto_152231 ?auto_152227 ) ( not ( = ?auto_152227 ?auto_152231 ) ) ( not ( = ?auto_152227 ?auto_152230 ) ) ( not ( = ?auto_152227 ?auto_152228 ) ) ( not ( = ?auto_152227 ?auto_152226 ) ) ( not ( = ?auto_152227 ?auto_152225 ) ) ( not ( = ?auto_152231 ?auto_152230 ) ) ( not ( = ?auto_152231 ?auto_152228 ) ) ( not ( = ?auto_152231 ?auto_152226 ) ) ( not ( = ?auto_152231 ?auto_152225 ) ) ( not ( = ?auto_152230 ?auto_152228 ) ) ( not ( = ?auto_152230 ?auto_152226 ) ) ( not ( = ?auto_152230 ?auto_152225 ) ) ( not ( = ?auto_152223 ?auto_152227 ) ) ( not ( = ?auto_152223 ?auto_152231 ) ) ( not ( = ?auto_152223 ?auto_152230 ) ) ( not ( = ?auto_152224 ?auto_152227 ) ) ( not ( = ?auto_152224 ?auto_152231 ) ) ( not ( = ?auto_152224 ?auto_152230 ) ) ( ON ?auto_152223 ?auto_152229 ) ( not ( = ?auto_152223 ?auto_152229 ) ) ( not ( = ?auto_152224 ?auto_152229 ) ) ( not ( = ?auto_152225 ?auto_152229 ) ) ( not ( = ?auto_152226 ?auto_152229 ) ) ( not ( = ?auto_152228 ?auto_152229 ) ) ( not ( = ?auto_152227 ?auto_152229 ) ) ( not ( = ?auto_152231 ?auto_152229 ) ) ( not ( = ?auto_152230 ?auto_152229 ) ) ( ON ?auto_152224 ?auto_152223 ) ( ON-TABLE ?auto_152229 ) ( ON ?auto_152225 ?auto_152224 ) ( ON ?auto_152226 ?auto_152225 ) ( ON ?auto_152228 ?auto_152226 ) ( CLEAR ?auto_152228 ) ( HOLDING ?auto_152230 ) ( CLEAR ?auto_152231 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_152227 ?auto_152231 ?auto_152230 )
      ( MAKE-4PILE ?auto_152223 ?auto_152224 ?auto_152225 ?auto_152226 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152232 - BLOCK
      ?auto_152233 - BLOCK
      ?auto_152234 - BLOCK
      ?auto_152235 - BLOCK
    )
    :vars
    (
      ?auto_152236 - BLOCK
      ?auto_152240 - BLOCK
      ?auto_152238 - BLOCK
      ?auto_152237 - BLOCK
      ?auto_152239 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152232 ?auto_152233 ) ) ( not ( = ?auto_152232 ?auto_152234 ) ) ( not ( = ?auto_152232 ?auto_152235 ) ) ( not ( = ?auto_152233 ?auto_152234 ) ) ( not ( = ?auto_152233 ?auto_152235 ) ) ( not ( = ?auto_152234 ?auto_152235 ) ) ( not ( = ?auto_152232 ?auto_152236 ) ) ( not ( = ?auto_152233 ?auto_152236 ) ) ( not ( = ?auto_152234 ?auto_152236 ) ) ( not ( = ?auto_152235 ?auto_152236 ) ) ( ON-TABLE ?auto_152240 ) ( ON ?auto_152238 ?auto_152240 ) ( not ( = ?auto_152240 ?auto_152238 ) ) ( not ( = ?auto_152240 ?auto_152237 ) ) ( not ( = ?auto_152240 ?auto_152236 ) ) ( not ( = ?auto_152240 ?auto_152235 ) ) ( not ( = ?auto_152240 ?auto_152234 ) ) ( not ( = ?auto_152238 ?auto_152237 ) ) ( not ( = ?auto_152238 ?auto_152236 ) ) ( not ( = ?auto_152238 ?auto_152235 ) ) ( not ( = ?auto_152238 ?auto_152234 ) ) ( not ( = ?auto_152237 ?auto_152236 ) ) ( not ( = ?auto_152237 ?auto_152235 ) ) ( not ( = ?auto_152237 ?auto_152234 ) ) ( not ( = ?auto_152232 ?auto_152240 ) ) ( not ( = ?auto_152232 ?auto_152238 ) ) ( not ( = ?auto_152232 ?auto_152237 ) ) ( not ( = ?auto_152233 ?auto_152240 ) ) ( not ( = ?auto_152233 ?auto_152238 ) ) ( not ( = ?auto_152233 ?auto_152237 ) ) ( ON ?auto_152232 ?auto_152239 ) ( not ( = ?auto_152232 ?auto_152239 ) ) ( not ( = ?auto_152233 ?auto_152239 ) ) ( not ( = ?auto_152234 ?auto_152239 ) ) ( not ( = ?auto_152235 ?auto_152239 ) ) ( not ( = ?auto_152236 ?auto_152239 ) ) ( not ( = ?auto_152240 ?auto_152239 ) ) ( not ( = ?auto_152238 ?auto_152239 ) ) ( not ( = ?auto_152237 ?auto_152239 ) ) ( ON ?auto_152233 ?auto_152232 ) ( ON-TABLE ?auto_152239 ) ( ON ?auto_152234 ?auto_152233 ) ( ON ?auto_152235 ?auto_152234 ) ( ON ?auto_152236 ?auto_152235 ) ( CLEAR ?auto_152238 ) ( ON ?auto_152237 ?auto_152236 ) ( CLEAR ?auto_152237 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_152239 ?auto_152232 ?auto_152233 ?auto_152234 ?auto_152235 ?auto_152236 )
      ( MAKE-4PILE ?auto_152232 ?auto_152233 ?auto_152234 ?auto_152235 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152241 - BLOCK
      ?auto_152242 - BLOCK
      ?auto_152243 - BLOCK
      ?auto_152244 - BLOCK
    )
    :vars
    (
      ?auto_152249 - BLOCK
      ?auto_152248 - BLOCK
      ?auto_152247 - BLOCK
      ?auto_152246 - BLOCK
      ?auto_152245 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152241 ?auto_152242 ) ) ( not ( = ?auto_152241 ?auto_152243 ) ) ( not ( = ?auto_152241 ?auto_152244 ) ) ( not ( = ?auto_152242 ?auto_152243 ) ) ( not ( = ?auto_152242 ?auto_152244 ) ) ( not ( = ?auto_152243 ?auto_152244 ) ) ( not ( = ?auto_152241 ?auto_152249 ) ) ( not ( = ?auto_152242 ?auto_152249 ) ) ( not ( = ?auto_152243 ?auto_152249 ) ) ( not ( = ?auto_152244 ?auto_152249 ) ) ( ON-TABLE ?auto_152248 ) ( not ( = ?auto_152248 ?auto_152247 ) ) ( not ( = ?auto_152248 ?auto_152246 ) ) ( not ( = ?auto_152248 ?auto_152249 ) ) ( not ( = ?auto_152248 ?auto_152244 ) ) ( not ( = ?auto_152248 ?auto_152243 ) ) ( not ( = ?auto_152247 ?auto_152246 ) ) ( not ( = ?auto_152247 ?auto_152249 ) ) ( not ( = ?auto_152247 ?auto_152244 ) ) ( not ( = ?auto_152247 ?auto_152243 ) ) ( not ( = ?auto_152246 ?auto_152249 ) ) ( not ( = ?auto_152246 ?auto_152244 ) ) ( not ( = ?auto_152246 ?auto_152243 ) ) ( not ( = ?auto_152241 ?auto_152248 ) ) ( not ( = ?auto_152241 ?auto_152247 ) ) ( not ( = ?auto_152241 ?auto_152246 ) ) ( not ( = ?auto_152242 ?auto_152248 ) ) ( not ( = ?auto_152242 ?auto_152247 ) ) ( not ( = ?auto_152242 ?auto_152246 ) ) ( ON ?auto_152241 ?auto_152245 ) ( not ( = ?auto_152241 ?auto_152245 ) ) ( not ( = ?auto_152242 ?auto_152245 ) ) ( not ( = ?auto_152243 ?auto_152245 ) ) ( not ( = ?auto_152244 ?auto_152245 ) ) ( not ( = ?auto_152249 ?auto_152245 ) ) ( not ( = ?auto_152248 ?auto_152245 ) ) ( not ( = ?auto_152247 ?auto_152245 ) ) ( not ( = ?auto_152246 ?auto_152245 ) ) ( ON ?auto_152242 ?auto_152241 ) ( ON-TABLE ?auto_152245 ) ( ON ?auto_152243 ?auto_152242 ) ( ON ?auto_152244 ?auto_152243 ) ( ON ?auto_152249 ?auto_152244 ) ( ON ?auto_152246 ?auto_152249 ) ( CLEAR ?auto_152246 ) ( HOLDING ?auto_152247 ) ( CLEAR ?auto_152248 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_152248 ?auto_152247 )
      ( MAKE-4PILE ?auto_152241 ?auto_152242 ?auto_152243 ?auto_152244 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152250 - BLOCK
      ?auto_152251 - BLOCK
      ?auto_152252 - BLOCK
      ?auto_152253 - BLOCK
    )
    :vars
    (
      ?auto_152258 - BLOCK
      ?auto_152256 - BLOCK
      ?auto_152254 - BLOCK
      ?auto_152257 - BLOCK
      ?auto_152255 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152250 ?auto_152251 ) ) ( not ( = ?auto_152250 ?auto_152252 ) ) ( not ( = ?auto_152250 ?auto_152253 ) ) ( not ( = ?auto_152251 ?auto_152252 ) ) ( not ( = ?auto_152251 ?auto_152253 ) ) ( not ( = ?auto_152252 ?auto_152253 ) ) ( not ( = ?auto_152250 ?auto_152258 ) ) ( not ( = ?auto_152251 ?auto_152258 ) ) ( not ( = ?auto_152252 ?auto_152258 ) ) ( not ( = ?auto_152253 ?auto_152258 ) ) ( ON-TABLE ?auto_152256 ) ( not ( = ?auto_152256 ?auto_152254 ) ) ( not ( = ?auto_152256 ?auto_152257 ) ) ( not ( = ?auto_152256 ?auto_152258 ) ) ( not ( = ?auto_152256 ?auto_152253 ) ) ( not ( = ?auto_152256 ?auto_152252 ) ) ( not ( = ?auto_152254 ?auto_152257 ) ) ( not ( = ?auto_152254 ?auto_152258 ) ) ( not ( = ?auto_152254 ?auto_152253 ) ) ( not ( = ?auto_152254 ?auto_152252 ) ) ( not ( = ?auto_152257 ?auto_152258 ) ) ( not ( = ?auto_152257 ?auto_152253 ) ) ( not ( = ?auto_152257 ?auto_152252 ) ) ( not ( = ?auto_152250 ?auto_152256 ) ) ( not ( = ?auto_152250 ?auto_152254 ) ) ( not ( = ?auto_152250 ?auto_152257 ) ) ( not ( = ?auto_152251 ?auto_152256 ) ) ( not ( = ?auto_152251 ?auto_152254 ) ) ( not ( = ?auto_152251 ?auto_152257 ) ) ( ON ?auto_152250 ?auto_152255 ) ( not ( = ?auto_152250 ?auto_152255 ) ) ( not ( = ?auto_152251 ?auto_152255 ) ) ( not ( = ?auto_152252 ?auto_152255 ) ) ( not ( = ?auto_152253 ?auto_152255 ) ) ( not ( = ?auto_152258 ?auto_152255 ) ) ( not ( = ?auto_152256 ?auto_152255 ) ) ( not ( = ?auto_152254 ?auto_152255 ) ) ( not ( = ?auto_152257 ?auto_152255 ) ) ( ON ?auto_152251 ?auto_152250 ) ( ON-TABLE ?auto_152255 ) ( ON ?auto_152252 ?auto_152251 ) ( ON ?auto_152253 ?auto_152252 ) ( ON ?auto_152258 ?auto_152253 ) ( ON ?auto_152257 ?auto_152258 ) ( CLEAR ?auto_152256 ) ( ON ?auto_152254 ?auto_152257 ) ( CLEAR ?auto_152254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_152255 ?auto_152250 ?auto_152251 ?auto_152252 ?auto_152253 ?auto_152258 ?auto_152257 )
      ( MAKE-4PILE ?auto_152250 ?auto_152251 ?auto_152252 ?auto_152253 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152259 - BLOCK
      ?auto_152260 - BLOCK
      ?auto_152261 - BLOCK
      ?auto_152262 - BLOCK
    )
    :vars
    (
      ?auto_152267 - BLOCK
      ?auto_152263 - BLOCK
      ?auto_152265 - BLOCK
      ?auto_152266 - BLOCK
      ?auto_152264 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152259 ?auto_152260 ) ) ( not ( = ?auto_152259 ?auto_152261 ) ) ( not ( = ?auto_152259 ?auto_152262 ) ) ( not ( = ?auto_152260 ?auto_152261 ) ) ( not ( = ?auto_152260 ?auto_152262 ) ) ( not ( = ?auto_152261 ?auto_152262 ) ) ( not ( = ?auto_152259 ?auto_152267 ) ) ( not ( = ?auto_152260 ?auto_152267 ) ) ( not ( = ?auto_152261 ?auto_152267 ) ) ( not ( = ?auto_152262 ?auto_152267 ) ) ( not ( = ?auto_152263 ?auto_152265 ) ) ( not ( = ?auto_152263 ?auto_152266 ) ) ( not ( = ?auto_152263 ?auto_152267 ) ) ( not ( = ?auto_152263 ?auto_152262 ) ) ( not ( = ?auto_152263 ?auto_152261 ) ) ( not ( = ?auto_152265 ?auto_152266 ) ) ( not ( = ?auto_152265 ?auto_152267 ) ) ( not ( = ?auto_152265 ?auto_152262 ) ) ( not ( = ?auto_152265 ?auto_152261 ) ) ( not ( = ?auto_152266 ?auto_152267 ) ) ( not ( = ?auto_152266 ?auto_152262 ) ) ( not ( = ?auto_152266 ?auto_152261 ) ) ( not ( = ?auto_152259 ?auto_152263 ) ) ( not ( = ?auto_152259 ?auto_152265 ) ) ( not ( = ?auto_152259 ?auto_152266 ) ) ( not ( = ?auto_152260 ?auto_152263 ) ) ( not ( = ?auto_152260 ?auto_152265 ) ) ( not ( = ?auto_152260 ?auto_152266 ) ) ( ON ?auto_152259 ?auto_152264 ) ( not ( = ?auto_152259 ?auto_152264 ) ) ( not ( = ?auto_152260 ?auto_152264 ) ) ( not ( = ?auto_152261 ?auto_152264 ) ) ( not ( = ?auto_152262 ?auto_152264 ) ) ( not ( = ?auto_152267 ?auto_152264 ) ) ( not ( = ?auto_152263 ?auto_152264 ) ) ( not ( = ?auto_152265 ?auto_152264 ) ) ( not ( = ?auto_152266 ?auto_152264 ) ) ( ON ?auto_152260 ?auto_152259 ) ( ON-TABLE ?auto_152264 ) ( ON ?auto_152261 ?auto_152260 ) ( ON ?auto_152262 ?auto_152261 ) ( ON ?auto_152267 ?auto_152262 ) ( ON ?auto_152266 ?auto_152267 ) ( ON ?auto_152265 ?auto_152266 ) ( CLEAR ?auto_152265 ) ( HOLDING ?auto_152263 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_152263 )
      ( MAKE-4PILE ?auto_152259 ?auto_152260 ?auto_152261 ?auto_152262 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152268 - BLOCK
      ?auto_152269 - BLOCK
      ?auto_152270 - BLOCK
      ?auto_152271 - BLOCK
    )
    :vars
    (
      ?auto_152274 - BLOCK
      ?auto_152275 - BLOCK
      ?auto_152276 - BLOCK
      ?auto_152273 - BLOCK
      ?auto_152272 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152268 ?auto_152269 ) ) ( not ( = ?auto_152268 ?auto_152270 ) ) ( not ( = ?auto_152268 ?auto_152271 ) ) ( not ( = ?auto_152269 ?auto_152270 ) ) ( not ( = ?auto_152269 ?auto_152271 ) ) ( not ( = ?auto_152270 ?auto_152271 ) ) ( not ( = ?auto_152268 ?auto_152274 ) ) ( not ( = ?auto_152269 ?auto_152274 ) ) ( not ( = ?auto_152270 ?auto_152274 ) ) ( not ( = ?auto_152271 ?auto_152274 ) ) ( not ( = ?auto_152275 ?auto_152276 ) ) ( not ( = ?auto_152275 ?auto_152273 ) ) ( not ( = ?auto_152275 ?auto_152274 ) ) ( not ( = ?auto_152275 ?auto_152271 ) ) ( not ( = ?auto_152275 ?auto_152270 ) ) ( not ( = ?auto_152276 ?auto_152273 ) ) ( not ( = ?auto_152276 ?auto_152274 ) ) ( not ( = ?auto_152276 ?auto_152271 ) ) ( not ( = ?auto_152276 ?auto_152270 ) ) ( not ( = ?auto_152273 ?auto_152274 ) ) ( not ( = ?auto_152273 ?auto_152271 ) ) ( not ( = ?auto_152273 ?auto_152270 ) ) ( not ( = ?auto_152268 ?auto_152275 ) ) ( not ( = ?auto_152268 ?auto_152276 ) ) ( not ( = ?auto_152268 ?auto_152273 ) ) ( not ( = ?auto_152269 ?auto_152275 ) ) ( not ( = ?auto_152269 ?auto_152276 ) ) ( not ( = ?auto_152269 ?auto_152273 ) ) ( ON ?auto_152268 ?auto_152272 ) ( not ( = ?auto_152268 ?auto_152272 ) ) ( not ( = ?auto_152269 ?auto_152272 ) ) ( not ( = ?auto_152270 ?auto_152272 ) ) ( not ( = ?auto_152271 ?auto_152272 ) ) ( not ( = ?auto_152274 ?auto_152272 ) ) ( not ( = ?auto_152275 ?auto_152272 ) ) ( not ( = ?auto_152276 ?auto_152272 ) ) ( not ( = ?auto_152273 ?auto_152272 ) ) ( ON ?auto_152269 ?auto_152268 ) ( ON-TABLE ?auto_152272 ) ( ON ?auto_152270 ?auto_152269 ) ( ON ?auto_152271 ?auto_152270 ) ( ON ?auto_152274 ?auto_152271 ) ( ON ?auto_152273 ?auto_152274 ) ( ON ?auto_152276 ?auto_152273 ) ( ON ?auto_152275 ?auto_152276 ) ( CLEAR ?auto_152275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_152272 ?auto_152268 ?auto_152269 ?auto_152270 ?auto_152271 ?auto_152274 ?auto_152273 ?auto_152276 )
      ( MAKE-4PILE ?auto_152268 ?auto_152269 ?auto_152270 ?auto_152271 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152280 - BLOCK
      ?auto_152281 - BLOCK
      ?auto_152282 - BLOCK
    )
    :vars
    (
      ?auto_152283 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152283 ?auto_152282 ) ( CLEAR ?auto_152283 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_152280 ) ( ON ?auto_152281 ?auto_152280 ) ( ON ?auto_152282 ?auto_152281 ) ( not ( = ?auto_152280 ?auto_152281 ) ) ( not ( = ?auto_152280 ?auto_152282 ) ) ( not ( = ?auto_152280 ?auto_152283 ) ) ( not ( = ?auto_152281 ?auto_152282 ) ) ( not ( = ?auto_152281 ?auto_152283 ) ) ( not ( = ?auto_152282 ?auto_152283 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_152283 ?auto_152282 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152284 - BLOCK
      ?auto_152285 - BLOCK
      ?auto_152286 - BLOCK
    )
    :vars
    (
      ?auto_152287 - BLOCK
      ?auto_152288 - BLOCK
      ?auto_152289 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152287 ?auto_152286 ) ( CLEAR ?auto_152287 ) ( ON-TABLE ?auto_152284 ) ( ON ?auto_152285 ?auto_152284 ) ( ON ?auto_152286 ?auto_152285 ) ( not ( = ?auto_152284 ?auto_152285 ) ) ( not ( = ?auto_152284 ?auto_152286 ) ) ( not ( = ?auto_152284 ?auto_152287 ) ) ( not ( = ?auto_152285 ?auto_152286 ) ) ( not ( = ?auto_152285 ?auto_152287 ) ) ( not ( = ?auto_152286 ?auto_152287 ) ) ( HOLDING ?auto_152288 ) ( CLEAR ?auto_152289 ) ( not ( = ?auto_152284 ?auto_152288 ) ) ( not ( = ?auto_152284 ?auto_152289 ) ) ( not ( = ?auto_152285 ?auto_152288 ) ) ( not ( = ?auto_152285 ?auto_152289 ) ) ( not ( = ?auto_152286 ?auto_152288 ) ) ( not ( = ?auto_152286 ?auto_152289 ) ) ( not ( = ?auto_152287 ?auto_152288 ) ) ( not ( = ?auto_152287 ?auto_152289 ) ) ( not ( = ?auto_152288 ?auto_152289 ) ) )
    :subtasks
    ( ( !STACK ?auto_152288 ?auto_152289 )
      ( MAKE-3PILE ?auto_152284 ?auto_152285 ?auto_152286 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152290 - BLOCK
      ?auto_152291 - BLOCK
      ?auto_152292 - BLOCK
    )
    :vars
    (
      ?auto_152293 - BLOCK
      ?auto_152295 - BLOCK
      ?auto_152294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152293 ?auto_152292 ) ( ON-TABLE ?auto_152290 ) ( ON ?auto_152291 ?auto_152290 ) ( ON ?auto_152292 ?auto_152291 ) ( not ( = ?auto_152290 ?auto_152291 ) ) ( not ( = ?auto_152290 ?auto_152292 ) ) ( not ( = ?auto_152290 ?auto_152293 ) ) ( not ( = ?auto_152291 ?auto_152292 ) ) ( not ( = ?auto_152291 ?auto_152293 ) ) ( not ( = ?auto_152292 ?auto_152293 ) ) ( CLEAR ?auto_152295 ) ( not ( = ?auto_152290 ?auto_152294 ) ) ( not ( = ?auto_152290 ?auto_152295 ) ) ( not ( = ?auto_152291 ?auto_152294 ) ) ( not ( = ?auto_152291 ?auto_152295 ) ) ( not ( = ?auto_152292 ?auto_152294 ) ) ( not ( = ?auto_152292 ?auto_152295 ) ) ( not ( = ?auto_152293 ?auto_152294 ) ) ( not ( = ?auto_152293 ?auto_152295 ) ) ( not ( = ?auto_152294 ?auto_152295 ) ) ( ON ?auto_152294 ?auto_152293 ) ( CLEAR ?auto_152294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_152290 ?auto_152291 ?auto_152292 ?auto_152293 )
      ( MAKE-3PILE ?auto_152290 ?auto_152291 ?auto_152292 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152296 - BLOCK
      ?auto_152297 - BLOCK
      ?auto_152298 - BLOCK
    )
    :vars
    (
      ?auto_152300 - BLOCK
      ?auto_152299 - BLOCK
      ?auto_152301 - BLOCK
      ?auto_152303 - BLOCK
      ?auto_152302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152300 ?auto_152298 ) ( ON-TABLE ?auto_152296 ) ( ON ?auto_152297 ?auto_152296 ) ( ON ?auto_152298 ?auto_152297 ) ( not ( = ?auto_152296 ?auto_152297 ) ) ( not ( = ?auto_152296 ?auto_152298 ) ) ( not ( = ?auto_152296 ?auto_152300 ) ) ( not ( = ?auto_152297 ?auto_152298 ) ) ( not ( = ?auto_152297 ?auto_152300 ) ) ( not ( = ?auto_152298 ?auto_152300 ) ) ( not ( = ?auto_152296 ?auto_152299 ) ) ( not ( = ?auto_152296 ?auto_152301 ) ) ( not ( = ?auto_152297 ?auto_152299 ) ) ( not ( = ?auto_152297 ?auto_152301 ) ) ( not ( = ?auto_152298 ?auto_152299 ) ) ( not ( = ?auto_152298 ?auto_152301 ) ) ( not ( = ?auto_152300 ?auto_152299 ) ) ( not ( = ?auto_152300 ?auto_152301 ) ) ( not ( = ?auto_152299 ?auto_152301 ) ) ( ON ?auto_152299 ?auto_152300 ) ( CLEAR ?auto_152299 ) ( HOLDING ?auto_152301 ) ( CLEAR ?auto_152303 ) ( ON-TABLE ?auto_152302 ) ( ON ?auto_152303 ?auto_152302 ) ( not ( = ?auto_152302 ?auto_152303 ) ) ( not ( = ?auto_152302 ?auto_152301 ) ) ( not ( = ?auto_152303 ?auto_152301 ) ) ( not ( = ?auto_152296 ?auto_152303 ) ) ( not ( = ?auto_152296 ?auto_152302 ) ) ( not ( = ?auto_152297 ?auto_152303 ) ) ( not ( = ?auto_152297 ?auto_152302 ) ) ( not ( = ?auto_152298 ?auto_152303 ) ) ( not ( = ?auto_152298 ?auto_152302 ) ) ( not ( = ?auto_152300 ?auto_152303 ) ) ( not ( = ?auto_152300 ?auto_152302 ) ) ( not ( = ?auto_152299 ?auto_152303 ) ) ( not ( = ?auto_152299 ?auto_152302 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_152302 ?auto_152303 ?auto_152301 )
      ( MAKE-3PILE ?auto_152296 ?auto_152297 ?auto_152298 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152304 - BLOCK
      ?auto_152305 - BLOCK
      ?auto_152306 - BLOCK
    )
    :vars
    (
      ?auto_152308 - BLOCK
      ?auto_152307 - BLOCK
      ?auto_152309 - BLOCK
      ?auto_152310 - BLOCK
      ?auto_152311 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152308 ?auto_152306 ) ( ON-TABLE ?auto_152304 ) ( ON ?auto_152305 ?auto_152304 ) ( ON ?auto_152306 ?auto_152305 ) ( not ( = ?auto_152304 ?auto_152305 ) ) ( not ( = ?auto_152304 ?auto_152306 ) ) ( not ( = ?auto_152304 ?auto_152308 ) ) ( not ( = ?auto_152305 ?auto_152306 ) ) ( not ( = ?auto_152305 ?auto_152308 ) ) ( not ( = ?auto_152306 ?auto_152308 ) ) ( not ( = ?auto_152304 ?auto_152307 ) ) ( not ( = ?auto_152304 ?auto_152309 ) ) ( not ( = ?auto_152305 ?auto_152307 ) ) ( not ( = ?auto_152305 ?auto_152309 ) ) ( not ( = ?auto_152306 ?auto_152307 ) ) ( not ( = ?auto_152306 ?auto_152309 ) ) ( not ( = ?auto_152308 ?auto_152307 ) ) ( not ( = ?auto_152308 ?auto_152309 ) ) ( not ( = ?auto_152307 ?auto_152309 ) ) ( ON ?auto_152307 ?auto_152308 ) ( CLEAR ?auto_152310 ) ( ON-TABLE ?auto_152311 ) ( ON ?auto_152310 ?auto_152311 ) ( not ( = ?auto_152311 ?auto_152310 ) ) ( not ( = ?auto_152311 ?auto_152309 ) ) ( not ( = ?auto_152310 ?auto_152309 ) ) ( not ( = ?auto_152304 ?auto_152310 ) ) ( not ( = ?auto_152304 ?auto_152311 ) ) ( not ( = ?auto_152305 ?auto_152310 ) ) ( not ( = ?auto_152305 ?auto_152311 ) ) ( not ( = ?auto_152306 ?auto_152310 ) ) ( not ( = ?auto_152306 ?auto_152311 ) ) ( not ( = ?auto_152308 ?auto_152310 ) ) ( not ( = ?auto_152308 ?auto_152311 ) ) ( not ( = ?auto_152307 ?auto_152310 ) ) ( not ( = ?auto_152307 ?auto_152311 ) ) ( ON ?auto_152309 ?auto_152307 ) ( CLEAR ?auto_152309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_152304 ?auto_152305 ?auto_152306 ?auto_152308 ?auto_152307 )
      ( MAKE-3PILE ?auto_152304 ?auto_152305 ?auto_152306 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152312 - BLOCK
      ?auto_152313 - BLOCK
      ?auto_152314 - BLOCK
    )
    :vars
    (
      ?auto_152319 - BLOCK
      ?auto_152316 - BLOCK
      ?auto_152315 - BLOCK
      ?auto_152318 - BLOCK
      ?auto_152317 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152319 ?auto_152314 ) ( ON-TABLE ?auto_152312 ) ( ON ?auto_152313 ?auto_152312 ) ( ON ?auto_152314 ?auto_152313 ) ( not ( = ?auto_152312 ?auto_152313 ) ) ( not ( = ?auto_152312 ?auto_152314 ) ) ( not ( = ?auto_152312 ?auto_152319 ) ) ( not ( = ?auto_152313 ?auto_152314 ) ) ( not ( = ?auto_152313 ?auto_152319 ) ) ( not ( = ?auto_152314 ?auto_152319 ) ) ( not ( = ?auto_152312 ?auto_152316 ) ) ( not ( = ?auto_152312 ?auto_152315 ) ) ( not ( = ?auto_152313 ?auto_152316 ) ) ( not ( = ?auto_152313 ?auto_152315 ) ) ( not ( = ?auto_152314 ?auto_152316 ) ) ( not ( = ?auto_152314 ?auto_152315 ) ) ( not ( = ?auto_152319 ?auto_152316 ) ) ( not ( = ?auto_152319 ?auto_152315 ) ) ( not ( = ?auto_152316 ?auto_152315 ) ) ( ON ?auto_152316 ?auto_152319 ) ( ON-TABLE ?auto_152318 ) ( not ( = ?auto_152318 ?auto_152317 ) ) ( not ( = ?auto_152318 ?auto_152315 ) ) ( not ( = ?auto_152317 ?auto_152315 ) ) ( not ( = ?auto_152312 ?auto_152317 ) ) ( not ( = ?auto_152312 ?auto_152318 ) ) ( not ( = ?auto_152313 ?auto_152317 ) ) ( not ( = ?auto_152313 ?auto_152318 ) ) ( not ( = ?auto_152314 ?auto_152317 ) ) ( not ( = ?auto_152314 ?auto_152318 ) ) ( not ( = ?auto_152319 ?auto_152317 ) ) ( not ( = ?auto_152319 ?auto_152318 ) ) ( not ( = ?auto_152316 ?auto_152317 ) ) ( not ( = ?auto_152316 ?auto_152318 ) ) ( ON ?auto_152315 ?auto_152316 ) ( CLEAR ?auto_152315 ) ( HOLDING ?auto_152317 ) ( CLEAR ?auto_152318 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_152318 ?auto_152317 )
      ( MAKE-3PILE ?auto_152312 ?auto_152313 ?auto_152314 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152320 - BLOCK
      ?auto_152321 - BLOCK
      ?auto_152322 - BLOCK
    )
    :vars
    (
      ?auto_152327 - BLOCK
      ?auto_152326 - BLOCK
      ?auto_152324 - BLOCK
      ?auto_152323 - BLOCK
      ?auto_152325 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152327 ?auto_152322 ) ( ON-TABLE ?auto_152320 ) ( ON ?auto_152321 ?auto_152320 ) ( ON ?auto_152322 ?auto_152321 ) ( not ( = ?auto_152320 ?auto_152321 ) ) ( not ( = ?auto_152320 ?auto_152322 ) ) ( not ( = ?auto_152320 ?auto_152327 ) ) ( not ( = ?auto_152321 ?auto_152322 ) ) ( not ( = ?auto_152321 ?auto_152327 ) ) ( not ( = ?auto_152322 ?auto_152327 ) ) ( not ( = ?auto_152320 ?auto_152326 ) ) ( not ( = ?auto_152320 ?auto_152324 ) ) ( not ( = ?auto_152321 ?auto_152326 ) ) ( not ( = ?auto_152321 ?auto_152324 ) ) ( not ( = ?auto_152322 ?auto_152326 ) ) ( not ( = ?auto_152322 ?auto_152324 ) ) ( not ( = ?auto_152327 ?auto_152326 ) ) ( not ( = ?auto_152327 ?auto_152324 ) ) ( not ( = ?auto_152326 ?auto_152324 ) ) ( ON ?auto_152326 ?auto_152327 ) ( ON-TABLE ?auto_152323 ) ( not ( = ?auto_152323 ?auto_152325 ) ) ( not ( = ?auto_152323 ?auto_152324 ) ) ( not ( = ?auto_152325 ?auto_152324 ) ) ( not ( = ?auto_152320 ?auto_152325 ) ) ( not ( = ?auto_152320 ?auto_152323 ) ) ( not ( = ?auto_152321 ?auto_152325 ) ) ( not ( = ?auto_152321 ?auto_152323 ) ) ( not ( = ?auto_152322 ?auto_152325 ) ) ( not ( = ?auto_152322 ?auto_152323 ) ) ( not ( = ?auto_152327 ?auto_152325 ) ) ( not ( = ?auto_152327 ?auto_152323 ) ) ( not ( = ?auto_152326 ?auto_152325 ) ) ( not ( = ?auto_152326 ?auto_152323 ) ) ( ON ?auto_152324 ?auto_152326 ) ( CLEAR ?auto_152323 ) ( ON ?auto_152325 ?auto_152324 ) ( CLEAR ?auto_152325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_152320 ?auto_152321 ?auto_152322 ?auto_152327 ?auto_152326 ?auto_152324 )
      ( MAKE-3PILE ?auto_152320 ?auto_152321 ?auto_152322 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152328 - BLOCK
      ?auto_152329 - BLOCK
      ?auto_152330 - BLOCK
    )
    :vars
    (
      ?auto_152332 - BLOCK
      ?auto_152331 - BLOCK
      ?auto_152335 - BLOCK
      ?auto_152333 - BLOCK
      ?auto_152334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152332 ?auto_152330 ) ( ON-TABLE ?auto_152328 ) ( ON ?auto_152329 ?auto_152328 ) ( ON ?auto_152330 ?auto_152329 ) ( not ( = ?auto_152328 ?auto_152329 ) ) ( not ( = ?auto_152328 ?auto_152330 ) ) ( not ( = ?auto_152328 ?auto_152332 ) ) ( not ( = ?auto_152329 ?auto_152330 ) ) ( not ( = ?auto_152329 ?auto_152332 ) ) ( not ( = ?auto_152330 ?auto_152332 ) ) ( not ( = ?auto_152328 ?auto_152331 ) ) ( not ( = ?auto_152328 ?auto_152335 ) ) ( not ( = ?auto_152329 ?auto_152331 ) ) ( not ( = ?auto_152329 ?auto_152335 ) ) ( not ( = ?auto_152330 ?auto_152331 ) ) ( not ( = ?auto_152330 ?auto_152335 ) ) ( not ( = ?auto_152332 ?auto_152331 ) ) ( not ( = ?auto_152332 ?auto_152335 ) ) ( not ( = ?auto_152331 ?auto_152335 ) ) ( ON ?auto_152331 ?auto_152332 ) ( not ( = ?auto_152333 ?auto_152334 ) ) ( not ( = ?auto_152333 ?auto_152335 ) ) ( not ( = ?auto_152334 ?auto_152335 ) ) ( not ( = ?auto_152328 ?auto_152334 ) ) ( not ( = ?auto_152328 ?auto_152333 ) ) ( not ( = ?auto_152329 ?auto_152334 ) ) ( not ( = ?auto_152329 ?auto_152333 ) ) ( not ( = ?auto_152330 ?auto_152334 ) ) ( not ( = ?auto_152330 ?auto_152333 ) ) ( not ( = ?auto_152332 ?auto_152334 ) ) ( not ( = ?auto_152332 ?auto_152333 ) ) ( not ( = ?auto_152331 ?auto_152334 ) ) ( not ( = ?auto_152331 ?auto_152333 ) ) ( ON ?auto_152335 ?auto_152331 ) ( ON ?auto_152334 ?auto_152335 ) ( CLEAR ?auto_152334 ) ( HOLDING ?auto_152333 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_152333 )
      ( MAKE-3PILE ?auto_152328 ?auto_152329 ?auto_152330 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152336 - BLOCK
      ?auto_152337 - BLOCK
      ?auto_152338 - BLOCK
    )
    :vars
    (
      ?auto_152343 - BLOCK
      ?auto_152341 - BLOCK
      ?auto_152342 - BLOCK
      ?auto_152339 - BLOCK
      ?auto_152340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152343 ?auto_152338 ) ( ON-TABLE ?auto_152336 ) ( ON ?auto_152337 ?auto_152336 ) ( ON ?auto_152338 ?auto_152337 ) ( not ( = ?auto_152336 ?auto_152337 ) ) ( not ( = ?auto_152336 ?auto_152338 ) ) ( not ( = ?auto_152336 ?auto_152343 ) ) ( not ( = ?auto_152337 ?auto_152338 ) ) ( not ( = ?auto_152337 ?auto_152343 ) ) ( not ( = ?auto_152338 ?auto_152343 ) ) ( not ( = ?auto_152336 ?auto_152341 ) ) ( not ( = ?auto_152336 ?auto_152342 ) ) ( not ( = ?auto_152337 ?auto_152341 ) ) ( not ( = ?auto_152337 ?auto_152342 ) ) ( not ( = ?auto_152338 ?auto_152341 ) ) ( not ( = ?auto_152338 ?auto_152342 ) ) ( not ( = ?auto_152343 ?auto_152341 ) ) ( not ( = ?auto_152343 ?auto_152342 ) ) ( not ( = ?auto_152341 ?auto_152342 ) ) ( ON ?auto_152341 ?auto_152343 ) ( not ( = ?auto_152339 ?auto_152340 ) ) ( not ( = ?auto_152339 ?auto_152342 ) ) ( not ( = ?auto_152340 ?auto_152342 ) ) ( not ( = ?auto_152336 ?auto_152340 ) ) ( not ( = ?auto_152336 ?auto_152339 ) ) ( not ( = ?auto_152337 ?auto_152340 ) ) ( not ( = ?auto_152337 ?auto_152339 ) ) ( not ( = ?auto_152338 ?auto_152340 ) ) ( not ( = ?auto_152338 ?auto_152339 ) ) ( not ( = ?auto_152343 ?auto_152340 ) ) ( not ( = ?auto_152343 ?auto_152339 ) ) ( not ( = ?auto_152341 ?auto_152340 ) ) ( not ( = ?auto_152341 ?auto_152339 ) ) ( ON ?auto_152342 ?auto_152341 ) ( ON ?auto_152340 ?auto_152342 ) ( ON ?auto_152339 ?auto_152340 ) ( CLEAR ?auto_152339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_152336 ?auto_152337 ?auto_152338 ?auto_152343 ?auto_152341 ?auto_152342 ?auto_152340 )
      ( MAKE-3PILE ?auto_152336 ?auto_152337 ?auto_152338 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152344 - BLOCK
      ?auto_152345 - BLOCK
      ?auto_152346 - BLOCK
    )
    :vars
    (
      ?auto_152349 - BLOCK
      ?auto_152351 - BLOCK
      ?auto_152348 - BLOCK
      ?auto_152347 - BLOCK
      ?auto_152350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152349 ?auto_152346 ) ( ON-TABLE ?auto_152344 ) ( ON ?auto_152345 ?auto_152344 ) ( ON ?auto_152346 ?auto_152345 ) ( not ( = ?auto_152344 ?auto_152345 ) ) ( not ( = ?auto_152344 ?auto_152346 ) ) ( not ( = ?auto_152344 ?auto_152349 ) ) ( not ( = ?auto_152345 ?auto_152346 ) ) ( not ( = ?auto_152345 ?auto_152349 ) ) ( not ( = ?auto_152346 ?auto_152349 ) ) ( not ( = ?auto_152344 ?auto_152351 ) ) ( not ( = ?auto_152344 ?auto_152348 ) ) ( not ( = ?auto_152345 ?auto_152351 ) ) ( not ( = ?auto_152345 ?auto_152348 ) ) ( not ( = ?auto_152346 ?auto_152351 ) ) ( not ( = ?auto_152346 ?auto_152348 ) ) ( not ( = ?auto_152349 ?auto_152351 ) ) ( not ( = ?auto_152349 ?auto_152348 ) ) ( not ( = ?auto_152351 ?auto_152348 ) ) ( ON ?auto_152351 ?auto_152349 ) ( not ( = ?auto_152347 ?auto_152350 ) ) ( not ( = ?auto_152347 ?auto_152348 ) ) ( not ( = ?auto_152350 ?auto_152348 ) ) ( not ( = ?auto_152344 ?auto_152350 ) ) ( not ( = ?auto_152344 ?auto_152347 ) ) ( not ( = ?auto_152345 ?auto_152350 ) ) ( not ( = ?auto_152345 ?auto_152347 ) ) ( not ( = ?auto_152346 ?auto_152350 ) ) ( not ( = ?auto_152346 ?auto_152347 ) ) ( not ( = ?auto_152349 ?auto_152350 ) ) ( not ( = ?auto_152349 ?auto_152347 ) ) ( not ( = ?auto_152351 ?auto_152350 ) ) ( not ( = ?auto_152351 ?auto_152347 ) ) ( ON ?auto_152348 ?auto_152351 ) ( ON ?auto_152350 ?auto_152348 ) ( HOLDING ?auto_152347 ) ( CLEAR ?auto_152350 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_152344 ?auto_152345 ?auto_152346 ?auto_152349 ?auto_152351 ?auto_152348 ?auto_152350 ?auto_152347 )
      ( MAKE-3PILE ?auto_152344 ?auto_152345 ?auto_152346 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152352 - BLOCK
      ?auto_152353 - BLOCK
      ?auto_152354 - BLOCK
    )
    :vars
    (
      ?auto_152358 - BLOCK
      ?auto_152357 - BLOCK
      ?auto_152359 - BLOCK
      ?auto_152355 - BLOCK
      ?auto_152356 - BLOCK
      ?auto_152360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152358 ?auto_152354 ) ( ON-TABLE ?auto_152352 ) ( ON ?auto_152353 ?auto_152352 ) ( ON ?auto_152354 ?auto_152353 ) ( not ( = ?auto_152352 ?auto_152353 ) ) ( not ( = ?auto_152352 ?auto_152354 ) ) ( not ( = ?auto_152352 ?auto_152358 ) ) ( not ( = ?auto_152353 ?auto_152354 ) ) ( not ( = ?auto_152353 ?auto_152358 ) ) ( not ( = ?auto_152354 ?auto_152358 ) ) ( not ( = ?auto_152352 ?auto_152357 ) ) ( not ( = ?auto_152352 ?auto_152359 ) ) ( not ( = ?auto_152353 ?auto_152357 ) ) ( not ( = ?auto_152353 ?auto_152359 ) ) ( not ( = ?auto_152354 ?auto_152357 ) ) ( not ( = ?auto_152354 ?auto_152359 ) ) ( not ( = ?auto_152358 ?auto_152357 ) ) ( not ( = ?auto_152358 ?auto_152359 ) ) ( not ( = ?auto_152357 ?auto_152359 ) ) ( ON ?auto_152357 ?auto_152358 ) ( not ( = ?auto_152355 ?auto_152356 ) ) ( not ( = ?auto_152355 ?auto_152359 ) ) ( not ( = ?auto_152356 ?auto_152359 ) ) ( not ( = ?auto_152352 ?auto_152356 ) ) ( not ( = ?auto_152352 ?auto_152355 ) ) ( not ( = ?auto_152353 ?auto_152356 ) ) ( not ( = ?auto_152353 ?auto_152355 ) ) ( not ( = ?auto_152354 ?auto_152356 ) ) ( not ( = ?auto_152354 ?auto_152355 ) ) ( not ( = ?auto_152358 ?auto_152356 ) ) ( not ( = ?auto_152358 ?auto_152355 ) ) ( not ( = ?auto_152357 ?auto_152356 ) ) ( not ( = ?auto_152357 ?auto_152355 ) ) ( ON ?auto_152359 ?auto_152357 ) ( ON ?auto_152356 ?auto_152359 ) ( CLEAR ?auto_152356 ) ( ON ?auto_152355 ?auto_152360 ) ( CLEAR ?auto_152355 ) ( HAND-EMPTY ) ( not ( = ?auto_152352 ?auto_152360 ) ) ( not ( = ?auto_152353 ?auto_152360 ) ) ( not ( = ?auto_152354 ?auto_152360 ) ) ( not ( = ?auto_152358 ?auto_152360 ) ) ( not ( = ?auto_152357 ?auto_152360 ) ) ( not ( = ?auto_152359 ?auto_152360 ) ) ( not ( = ?auto_152355 ?auto_152360 ) ) ( not ( = ?auto_152356 ?auto_152360 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_152355 ?auto_152360 )
      ( MAKE-3PILE ?auto_152352 ?auto_152353 ?auto_152354 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152361 - BLOCK
      ?auto_152362 - BLOCK
      ?auto_152363 - BLOCK
    )
    :vars
    (
      ?auto_152367 - BLOCK
      ?auto_152369 - BLOCK
      ?auto_152365 - BLOCK
      ?auto_152368 - BLOCK
      ?auto_152364 - BLOCK
      ?auto_152366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152367 ?auto_152363 ) ( ON-TABLE ?auto_152361 ) ( ON ?auto_152362 ?auto_152361 ) ( ON ?auto_152363 ?auto_152362 ) ( not ( = ?auto_152361 ?auto_152362 ) ) ( not ( = ?auto_152361 ?auto_152363 ) ) ( not ( = ?auto_152361 ?auto_152367 ) ) ( not ( = ?auto_152362 ?auto_152363 ) ) ( not ( = ?auto_152362 ?auto_152367 ) ) ( not ( = ?auto_152363 ?auto_152367 ) ) ( not ( = ?auto_152361 ?auto_152369 ) ) ( not ( = ?auto_152361 ?auto_152365 ) ) ( not ( = ?auto_152362 ?auto_152369 ) ) ( not ( = ?auto_152362 ?auto_152365 ) ) ( not ( = ?auto_152363 ?auto_152369 ) ) ( not ( = ?auto_152363 ?auto_152365 ) ) ( not ( = ?auto_152367 ?auto_152369 ) ) ( not ( = ?auto_152367 ?auto_152365 ) ) ( not ( = ?auto_152369 ?auto_152365 ) ) ( ON ?auto_152369 ?auto_152367 ) ( not ( = ?auto_152368 ?auto_152364 ) ) ( not ( = ?auto_152368 ?auto_152365 ) ) ( not ( = ?auto_152364 ?auto_152365 ) ) ( not ( = ?auto_152361 ?auto_152364 ) ) ( not ( = ?auto_152361 ?auto_152368 ) ) ( not ( = ?auto_152362 ?auto_152364 ) ) ( not ( = ?auto_152362 ?auto_152368 ) ) ( not ( = ?auto_152363 ?auto_152364 ) ) ( not ( = ?auto_152363 ?auto_152368 ) ) ( not ( = ?auto_152367 ?auto_152364 ) ) ( not ( = ?auto_152367 ?auto_152368 ) ) ( not ( = ?auto_152369 ?auto_152364 ) ) ( not ( = ?auto_152369 ?auto_152368 ) ) ( ON ?auto_152365 ?auto_152369 ) ( ON ?auto_152368 ?auto_152366 ) ( CLEAR ?auto_152368 ) ( not ( = ?auto_152361 ?auto_152366 ) ) ( not ( = ?auto_152362 ?auto_152366 ) ) ( not ( = ?auto_152363 ?auto_152366 ) ) ( not ( = ?auto_152367 ?auto_152366 ) ) ( not ( = ?auto_152369 ?auto_152366 ) ) ( not ( = ?auto_152365 ?auto_152366 ) ) ( not ( = ?auto_152368 ?auto_152366 ) ) ( not ( = ?auto_152364 ?auto_152366 ) ) ( HOLDING ?auto_152364 ) ( CLEAR ?auto_152365 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_152361 ?auto_152362 ?auto_152363 ?auto_152367 ?auto_152369 ?auto_152365 ?auto_152364 )
      ( MAKE-3PILE ?auto_152361 ?auto_152362 ?auto_152363 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152370 - BLOCK
      ?auto_152371 - BLOCK
      ?auto_152372 - BLOCK
    )
    :vars
    (
      ?auto_152373 - BLOCK
      ?auto_152377 - BLOCK
      ?auto_152376 - BLOCK
      ?auto_152375 - BLOCK
      ?auto_152374 - BLOCK
      ?auto_152378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152373 ?auto_152372 ) ( ON-TABLE ?auto_152370 ) ( ON ?auto_152371 ?auto_152370 ) ( ON ?auto_152372 ?auto_152371 ) ( not ( = ?auto_152370 ?auto_152371 ) ) ( not ( = ?auto_152370 ?auto_152372 ) ) ( not ( = ?auto_152370 ?auto_152373 ) ) ( not ( = ?auto_152371 ?auto_152372 ) ) ( not ( = ?auto_152371 ?auto_152373 ) ) ( not ( = ?auto_152372 ?auto_152373 ) ) ( not ( = ?auto_152370 ?auto_152377 ) ) ( not ( = ?auto_152370 ?auto_152376 ) ) ( not ( = ?auto_152371 ?auto_152377 ) ) ( not ( = ?auto_152371 ?auto_152376 ) ) ( not ( = ?auto_152372 ?auto_152377 ) ) ( not ( = ?auto_152372 ?auto_152376 ) ) ( not ( = ?auto_152373 ?auto_152377 ) ) ( not ( = ?auto_152373 ?auto_152376 ) ) ( not ( = ?auto_152377 ?auto_152376 ) ) ( ON ?auto_152377 ?auto_152373 ) ( not ( = ?auto_152375 ?auto_152374 ) ) ( not ( = ?auto_152375 ?auto_152376 ) ) ( not ( = ?auto_152374 ?auto_152376 ) ) ( not ( = ?auto_152370 ?auto_152374 ) ) ( not ( = ?auto_152370 ?auto_152375 ) ) ( not ( = ?auto_152371 ?auto_152374 ) ) ( not ( = ?auto_152371 ?auto_152375 ) ) ( not ( = ?auto_152372 ?auto_152374 ) ) ( not ( = ?auto_152372 ?auto_152375 ) ) ( not ( = ?auto_152373 ?auto_152374 ) ) ( not ( = ?auto_152373 ?auto_152375 ) ) ( not ( = ?auto_152377 ?auto_152374 ) ) ( not ( = ?auto_152377 ?auto_152375 ) ) ( ON ?auto_152376 ?auto_152377 ) ( ON ?auto_152375 ?auto_152378 ) ( not ( = ?auto_152370 ?auto_152378 ) ) ( not ( = ?auto_152371 ?auto_152378 ) ) ( not ( = ?auto_152372 ?auto_152378 ) ) ( not ( = ?auto_152373 ?auto_152378 ) ) ( not ( = ?auto_152377 ?auto_152378 ) ) ( not ( = ?auto_152376 ?auto_152378 ) ) ( not ( = ?auto_152375 ?auto_152378 ) ) ( not ( = ?auto_152374 ?auto_152378 ) ) ( CLEAR ?auto_152376 ) ( ON ?auto_152374 ?auto_152375 ) ( CLEAR ?auto_152374 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_152378 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_152378 ?auto_152375 )
      ( MAKE-3PILE ?auto_152370 ?auto_152371 ?auto_152372 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152379 - BLOCK
      ?auto_152380 - BLOCK
      ?auto_152381 - BLOCK
    )
    :vars
    (
      ?auto_152384 - BLOCK
      ?auto_152382 - BLOCK
      ?auto_152387 - BLOCK
      ?auto_152386 - BLOCK
      ?auto_152383 - BLOCK
      ?auto_152385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152384 ?auto_152381 ) ( ON-TABLE ?auto_152379 ) ( ON ?auto_152380 ?auto_152379 ) ( ON ?auto_152381 ?auto_152380 ) ( not ( = ?auto_152379 ?auto_152380 ) ) ( not ( = ?auto_152379 ?auto_152381 ) ) ( not ( = ?auto_152379 ?auto_152384 ) ) ( not ( = ?auto_152380 ?auto_152381 ) ) ( not ( = ?auto_152380 ?auto_152384 ) ) ( not ( = ?auto_152381 ?auto_152384 ) ) ( not ( = ?auto_152379 ?auto_152382 ) ) ( not ( = ?auto_152379 ?auto_152387 ) ) ( not ( = ?auto_152380 ?auto_152382 ) ) ( not ( = ?auto_152380 ?auto_152387 ) ) ( not ( = ?auto_152381 ?auto_152382 ) ) ( not ( = ?auto_152381 ?auto_152387 ) ) ( not ( = ?auto_152384 ?auto_152382 ) ) ( not ( = ?auto_152384 ?auto_152387 ) ) ( not ( = ?auto_152382 ?auto_152387 ) ) ( ON ?auto_152382 ?auto_152384 ) ( not ( = ?auto_152386 ?auto_152383 ) ) ( not ( = ?auto_152386 ?auto_152387 ) ) ( not ( = ?auto_152383 ?auto_152387 ) ) ( not ( = ?auto_152379 ?auto_152383 ) ) ( not ( = ?auto_152379 ?auto_152386 ) ) ( not ( = ?auto_152380 ?auto_152383 ) ) ( not ( = ?auto_152380 ?auto_152386 ) ) ( not ( = ?auto_152381 ?auto_152383 ) ) ( not ( = ?auto_152381 ?auto_152386 ) ) ( not ( = ?auto_152384 ?auto_152383 ) ) ( not ( = ?auto_152384 ?auto_152386 ) ) ( not ( = ?auto_152382 ?auto_152383 ) ) ( not ( = ?auto_152382 ?auto_152386 ) ) ( ON ?auto_152386 ?auto_152385 ) ( not ( = ?auto_152379 ?auto_152385 ) ) ( not ( = ?auto_152380 ?auto_152385 ) ) ( not ( = ?auto_152381 ?auto_152385 ) ) ( not ( = ?auto_152384 ?auto_152385 ) ) ( not ( = ?auto_152382 ?auto_152385 ) ) ( not ( = ?auto_152387 ?auto_152385 ) ) ( not ( = ?auto_152386 ?auto_152385 ) ) ( not ( = ?auto_152383 ?auto_152385 ) ) ( ON ?auto_152383 ?auto_152386 ) ( CLEAR ?auto_152383 ) ( ON-TABLE ?auto_152385 ) ( HOLDING ?auto_152387 ) ( CLEAR ?auto_152382 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_152379 ?auto_152380 ?auto_152381 ?auto_152384 ?auto_152382 ?auto_152387 )
      ( MAKE-3PILE ?auto_152379 ?auto_152380 ?auto_152381 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152388 - BLOCK
      ?auto_152389 - BLOCK
      ?auto_152390 - BLOCK
    )
    :vars
    (
      ?auto_152396 - BLOCK
      ?auto_152395 - BLOCK
      ?auto_152392 - BLOCK
      ?auto_152391 - BLOCK
      ?auto_152394 - BLOCK
      ?auto_152393 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152396 ?auto_152390 ) ( ON-TABLE ?auto_152388 ) ( ON ?auto_152389 ?auto_152388 ) ( ON ?auto_152390 ?auto_152389 ) ( not ( = ?auto_152388 ?auto_152389 ) ) ( not ( = ?auto_152388 ?auto_152390 ) ) ( not ( = ?auto_152388 ?auto_152396 ) ) ( not ( = ?auto_152389 ?auto_152390 ) ) ( not ( = ?auto_152389 ?auto_152396 ) ) ( not ( = ?auto_152390 ?auto_152396 ) ) ( not ( = ?auto_152388 ?auto_152395 ) ) ( not ( = ?auto_152388 ?auto_152392 ) ) ( not ( = ?auto_152389 ?auto_152395 ) ) ( not ( = ?auto_152389 ?auto_152392 ) ) ( not ( = ?auto_152390 ?auto_152395 ) ) ( not ( = ?auto_152390 ?auto_152392 ) ) ( not ( = ?auto_152396 ?auto_152395 ) ) ( not ( = ?auto_152396 ?auto_152392 ) ) ( not ( = ?auto_152395 ?auto_152392 ) ) ( ON ?auto_152395 ?auto_152396 ) ( not ( = ?auto_152391 ?auto_152394 ) ) ( not ( = ?auto_152391 ?auto_152392 ) ) ( not ( = ?auto_152394 ?auto_152392 ) ) ( not ( = ?auto_152388 ?auto_152394 ) ) ( not ( = ?auto_152388 ?auto_152391 ) ) ( not ( = ?auto_152389 ?auto_152394 ) ) ( not ( = ?auto_152389 ?auto_152391 ) ) ( not ( = ?auto_152390 ?auto_152394 ) ) ( not ( = ?auto_152390 ?auto_152391 ) ) ( not ( = ?auto_152396 ?auto_152394 ) ) ( not ( = ?auto_152396 ?auto_152391 ) ) ( not ( = ?auto_152395 ?auto_152394 ) ) ( not ( = ?auto_152395 ?auto_152391 ) ) ( ON ?auto_152391 ?auto_152393 ) ( not ( = ?auto_152388 ?auto_152393 ) ) ( not ( = ?auto_152389 ?auto_152393 ) ) ( not ( = ?auto_152390 ?auto_152393 ) ) ( not ( = ?auto_152396 ?auto_152393 ) ) ( not ( = ?auto_152395 ?auto_152393 ) ) ( not ( = ?auto_152392 ?auto_152393 ) ) ( not ( = ?auto_152391 ?auto_152393 ) ) ( not ( = ?auto_152394 ?auto_152393 ) ) ( ON ?auto_152394 ?auto_152391 ) ( ON-TABLE ?auto_152393 ) ( CLEAR ?auto_152395 ) ( ON ?auto_152392 ?auto_152394 ) ( CLEAR ?auto_152392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_152393 ?auto_152391 ?auto_152394 )
      ( MAKE-3PILE ?auto_152388 ?auto_152389 ?auto_152390 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152397 - BLOCK
      ?auto_152398 - BLOCK
      ?auto_152399 - BLOCK
    )
    :vars
    (
      ?auto_152405 - BLOCK
      ?auto_152401 - BLOCK
      ?auto_152403 - BLOCK
      ?auto_152402 - BLOCK
      ?auto_152400 - BLOCK
      ?auto_152404 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152405 ?auto_152399 ) ( ON-TABLE ?auto_152397 ) ( ON ?auto_152398 ?auto_152397 ) ( ON ?auto_152399 ?auto_152398 ) ( not ( = ?auto_152397 ?auto_152398 ) ) ( not ( = ?auto_152397 ?auto_152399 ) ) ( not ( = ?auto_152397 ?auto_152405 ) ) ( not ( = ?auto_152398 ?auto_152399 ) ) ( not ( = ?auto_152398 ?auto_152405 ) ) ( not ( = ?auto_152399 ?auto_152405 ) ) ( not ( = ?auto_152397 ?auto_152401 ) ) ( not ( = ?auto_152397 ?auto_152403 ) ) ( not ( = ?auto_152398 ?auto_152401 ) ) ( not ( = ?auto_152398 ?auto_152403 ) ) ( not ( = ?auto_152399 ?auto_152401 ) ) ( not ( = ?auto_152399 ?auto_152403 ) ) ( not ( = ?auto_152405 ?auto_152401 ) ) ( not ( = ?auto_152405 ?auto_152403 ) ) ( not ( = ?auto_152401 ?auto_152403 ) ) ( not ( = ?auto_152402 ?auto_152400 ) ) ( not ( = ?auto_152402 ?auto_152403 ) ) ( not ( = ?auto_152400 ?auto_152403 ) ) ( not ( = ?auto_152397 ?auto_152400 ) ) ( not ( = ?auto_152397 ?auto_152402 ) ) ( not ( = ?auto_152398 ?auto_152400 ) ) ( not ( = ?auto_152398 ?auto_152402 ) ) ( not ( = ?auto_152399 ?auto_152400 ) ) ( not ( = ?auto_152399 ?auto_152402 ) ) ( not ( = ?auto_152405 ?auto_152400 ) ) ( not ( = ?auto_152405 ?auto_152402 ) ) ( not ( = ?auto_152401 ?auto_152400 ) ) ( not ( = ?auto_152401 ?auto_152402 ) ) ( ON ?auto_152402 ?auto_152404 ) ( not ( = ?auto_152397 ?auto_152404 ) ) ( not ( = ?auto_152398 ?auto_152404 ) ) ( not ( = ?auto_152399 ?auto_152404 ) ) ( not ( = ?auto_152405 ?auto_152404 ) ) ( not ( = ?auto_152401 ?auto_152404 ) ) ( not ( = ?auto_152403 ?auto_152404 ) ) ( not ( = ?auto_152402 ?auto_152404 ) ) ( not ( = ?auto_152400 ?auto_152404 ) ) ( ON ?auto_152400 ?auto_152402 ) ( ON-TABLE ?auto_152404 ) ( ON ?auto_152403 ?auto_152400 ) ( CLEAR ?auto_152403 ) ( HOLDING ?auto_152401 ) ( CLEAR ?auto_152405 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_152397 ?auto_152398 ?auto_152399 ?auto_152405 ?auto_152401 )
      ( MAKE-3PILE ?auto_152397 ?auto_152398 ?auto_152399 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152406 - BLOCK
      ?auto_152407 - BLOCK
      ?auto_152408 - BLOCK
    )
    :vars
    (
      ?auto_152414 - BLOCK
      ?auto_152409 - BLOCK
      ?auto_152412 - BLOCK
      ?auto_152411 - BLOCK
      ?auto_152410 - BLOCK
      ?auto_152413 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152414 ?auto_152408 ) ( ON-TABLE ?auto_152406 ) ( ON ?auto_152407 ?auto_152406 ) ( ON ?auto_152408 ?auto_152407 ) ( not ( = ?auto_152406 ?auto_152407 ) ) ( not ( = ?auto_152406 ?auto_152408 ) ) ( not ( = ?auto_152406 ?auto_152414 ) ) ( not ( = ?auto_152407 ?auto_152408 ) ) ( not ( = ?auto_152407 ?auto_152414 ) ) ( not ( = ?auto_152408 ?auto_152414 ) ) ( not ( = ?auto_152406 ?auto_152409 ) ) ( not ( = ?auto_152406 ?auto_152412 ) ) ( not ( = ?auto_152407 ?auto_152409 ) ) ( not ( = ?auto_152407 ?auto_152412 ) ) ( not ( = ?auto_152408 ?auto_152409 ) ) ( not ( = ?auto_152408 ?auto_152412 ) ) ( not ( = ?auto_152414 ?auto_152409 ) ) ( not ( = ?auto_152414 ?auto_152412 ) ) ( not ( = ?auto_152409 ?auto_152412 ) ) ( not ( = ?auto_152411 ?auto_152410 ) ) ( not ( = ?auto_152411 ?auto_152412 ) ) ( not ( = ?auto_152410 ?auto_152412 ) ) ( not ( = ?auto_152406 ?auto_152410 ) ) ( not ( = ?auto_152406 ?auto_152411 ) ) ( not ( = ?auto_152407 ?auto_152410 ) ) ( not ( = ?auto_152407 ?auto_152411 ) ) ( not ( = ?auto_152408 ?auto_152410 ) ) ( not ( = ?auto_152408 ?auto_152411 ) ) ( not ( = ?auto_152414 ?auto_152410 ) ) ( not ( = ?auto_152414 ?auto_152411 ) ) ( not ( = ?auto_152409 ?auto_152410 ) ) ( not ( = ?auto_152409 ?auto_152411 ) ) ( ON ?auto_152411 ?auto_152413 ) ( not ( = ?auto_152406 ?auto_152413 ) ) ( not ( = ?auto_152407 ?auto_152413 ) ) ( not ( = ?auto_152408 ?auto_152413 ) ) ( not ( = ?auto_152414 ?auto_152413 ) ) ( not ( = ?auto_152409 ?auto_152413 ) ) ( not ( = ?auto_152412 ?auto_152413 ) ) ( not ( = ?auto_152411 ?auto_152413 ) ) ( not ( = ?auto_152410 ?auto_152413 ) ) ( ON ?auto_152410 ?auto_152411 ) ( ON-TABLE ?auto_152413 ) ( ON ?auto_152412 ?auto_152410 ) ( CLEAR ?auto_152414 ) ( ON ?auto_152409 ?auto_152412 ) ( CLEAR ?auto_152409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_152413 ?auto_152411 ?auto_152410 ?auto_152412 )
      ( MAKE-3PILE ?auto_152406 ?auto_152407 ?auto_152408 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152433 - BLOCK
      ?auto_152434 - BLOCK
      ?auto_152435 - BLOCK
    )
    :vars
    (
      ?auto_152439 - BLOCK
      ?auto_152437 - BLOCK
      ?auto_152441 - BLOCK
      ?auto_152438 - BLOCK
      ?auto_152436 - BLOCK
      ?auto_152440 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_152433 ) ( ON ?auto_152434 ?auto_152433 ) ( not ( = ?auto_152433 ?auto_152434 ) ) ( not ( = ?auto_152433 ?auto_152435 ) ) ( not ( = ?auto_152433 ?auto_152439 ) ) ( not ( = ?auto_152434 ?auto_152435 ) ) ( not ( = ?auto_152434 ?auto_152439 ) ) ( not ( = ?auto_152435 ?auto_152439 ) ) ( not ( = ?auto_152433 ?auto_152437 ) ) ( not ( = ?auto_152433 ?auto_152441 ) ) ( not ( = ?auto_152434 ?auto_152437 ) ) ( not ( = ?auto_152434 ?auto_152441 ) ) ( not ( = ?auto_152435 ?auto_152437 ) ) ( not ( = ?auto_152435 ?auto_152441 ) ) ( not ( = ?auto_152439 ?auto_152437 ) ) ( not ( = ?auto_152439 ?auto_152441 ) ) ( not ( = ?auto_152437 ?auto_152441 ) ) ( not ( = ?auto_152438 ?auto_152436 ) ) ( not ( = ?auto_152438 ?auto_152441 ) ) ( not ( = ?auto_152436 ?auto_152441 ) ) ( not ( = ?auto_152433 ?auto_152436 ) ) ( not ( = ?auto_152433 ?auto_152438 ) ) ( not ( = ?auto_152434 ?auto_152436 ) ) ( not ( = ?auto_152434 ?auto_152438 ) ) ( not ( = ?auto_152435 ?auto_152436 ) ) ( not ( = ?auto_152435 ?auto_152438 ) ) ( not ( = ?auto_152439 ?auto_152436 ) ) ( not ( = ?auto_152439 ?auto_152438 ) ) ( not ( = ?auto_152437 ?auto_152436 ) ) ( not ( = ?auto_152437 ?auto_152438 ) ) ( ON ?auto_152438 ?auto_152440 ) ( not ( = ?auto_152433 ?auto_152440 ) ) ( not ( = ?auto_152434 ?auto_152440 ) ) ( not ( = ?auto_152435 ?auto_152440 ) ) ( not ( = ?auto_152439 ?auto_152440 ) ) ( not ( = ?auto_152437 ?auto_152440 ) ) ( not ( = ?auto_152441 ?auto_152440 ) ) ( not ( = ?auto_152438 ?auto_152440 ) ) ( not ( = ?auto_152436 ?auto_152440 ) ) ( ON ?auto_152436 ?auto_152438 ) ( ON-TABLE ?auto_152440 ) ( ON ?auto_152441 ?auto_152436 ) ( ON ?auto_152437 ?auto_152441 ) ( ON ?auto_152439 ?auto_152437 ) ( CLEAR ?auto_152439 ) ( HOLDING ?auto_152435 ) ( CLEAR ?auto_152434 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_152433 ?auto_152434 ?auto_152435 ?auto_152439 )
      ( MAKE-3PILE ?auto_152433 ?auto_152434 ?auto_152435 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152442 - BLOCK
      ?auto_152443 - BLOCK
      ?auto_152444 - BLOCK
    )
    :vars
    (
      ?auto_152449 - BLOCK
      ?auto_152448 - BLOCK
      ?auto_152445 - BLOCK
      ?auto_152447 - BLOCK
      ?auto_152450 - BLOCK
      ?auto_152446 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_152442 ) ( ON ?auto_152443 ?auto_152442 ) ( not ( = ?auto_152442 ?auto_152443 ) ) ( not ( = ?auto_152442 ?auto_152444 ) ) ( not ( = ?auto_152442 ?auto_152449 ) ) ( not ( = ?auto_152443 ?auto_152444 ) ) ( not ( = ?auto_152443 ?auto_152449 ) ) ( not ( = ?auto_152444 ?auto_152449 ) ) ( not ( = ?auto_152442 ?auto_152448 ) ) ( not ( = ?auto_152442 ?auto_152445 ) ) ( not ( = ?auto_152443 ?auto_152448 ) ) ( not ( = ?auto_152443 ?auto_152445 ) ) ( not ( = ?auto_152444 ?auto_152448 ) ) ( not ( = ?auto_152444 ?auto_152445 ) ) ( not ( = ?auto_152449 ?auto_152448 ) ) ( not ( = ?auto_152449 ?auto_152445 ) ) ( not ( = ?auto_152448 ?auto_152445 ) ) ( not ( = ?auto_152447 ?auto_152450 ) ) ( not ( = ?auto_152447 ?auto_152445 ) ) ( not ( = ?auto_152450 ?auto_152445 ) ) ( not ( = ?auto_152442 ?auto_152450 ) ) ( not ( = ?auto_152442 ?auto_152447 ) ) ( not ( = ?auto_152443 ?auto_152450 ) ) ( not ( = ?auto_152443 ?auto_152447 ) ) ( not ( = ?auto_152444 ?auto_152450 ) ) ( not ( = ?auto_152444 ?auto_152447 ) ) ( not ( = ?auto_152449 ?auto_152450 ) ) ( not ( = ?auto_152449 ?auto_152447 ) ) ( not ( = ?auto_152448 ?auto_152450 ) ) ( not ( = ?auto_152448 ?auto_152447 ) ) ( ON ?auto_152447 ?auto_152446 ) ( not ( = ?auto_152442 ?auto_152446 ) ) ( not ( = ?auto_152443 ?auto_152446 ) ) ( not ( = ?auto_152444 ?auto_152446 ) ) ( not ( = ?auto_152449 ?auto_152446 ) ) ( not ( = ?auto_152448 ?auto_152446 ) ) ( not ( = ?auto_152445 ?auto_152446 ) ) ( not ( = ?auto_152447 ?auto_152446 ) ) ( not ( = ?auto_152450 ?auto_152446 ) ) ( ON ?auto_152450 ?auto_152447 ) ( ON-TABLE ?auto_152446 ) ( ON ?auto_152445 ?auto_152450 ) ( ON ?auto_152448 ?auto_152445 ) ( ON ?auto_152449 ?auto_152448 ) ( CLEAR ?auto_152443 ) ( ON ?auto_152444 ?auto_152449 ) ( CLEAR ?auto_152444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_152446 ?auto_152447 ?auto_152450 ?auto_152445 ?auto_152448 ?auto_152449 )
      ( MAKE-3PILE ?auto_152442 ?auto_152443 ?auto_152444 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152451 - BLOCK
      ?auto_152452 - BLOCK
      ?auto_152453 - BLOCK
    )
    :vars
    (
      ?auto_152454 - BLOCK
      ?auto_152456 - BLOCK
      ?auto_152457 - BLOCK
      ?auto_152458 - BLOCK
      ?auto_152459 - BLOCK
      ?auto_152455 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_152451 ) ( not ( = ?auto_152451 ?auto_152452 ) ) ( not ( = ?auto_152451 ?auto_152453 ) ) ( not ( = ?auto_152451 ?auto_152454 ) ) ( not ( = ?auto_152452 ?auto_152453 ) ) ( not ( = ?auto_152452 ?auto_152454 ) ) ( not ( = ?auto_152453 ?auto_152454 ) ) ( not ( = ?auto_152451 ?auto_152456 ) ) ( not ( = ?auto_152451 ?auto_152457 ) ) ( not ( = ?auto_152452 ?auto_152456 ) ) ( not ( = ?auto_152452 ?auto_152457 ) ) ( not ( = ?auto_152453 ?auto_152456 ) ) ( not ( = ?auto_152453 ?auto_152457 ) ) ( not ( = ?auto_152454 ?auto_152456 ) ) ( not ( = ?auto_152454 ?auto_152457 ) ) ( not ( = ?auto_152456 ?auto_152457 ) ) ( not ( = ?auto_152458 ?auto_152459 ) ) ( not ( = ?auto_152458 ?auto_152457 ) ) ( not ( = ?auto_152459 ?auto_152457 ) ) ( not ( = ?auto_152451 ?auto_152459 ) ) ( not ( = ?auto_152451 ?auto_152458 ) ) ( not ( = ?auto_152452 ?auto_152459 ) ) ( not ( = ?auto_152452 ?auto_152458 ) ) ( not ( = ?auto_152453 ?auto_152459 ) ) ( not ( = ?auto_152453 ?auto_152458 ) ) ( not ( = ?auto_152454 ?auto_152459 ) ) ( not ( = ?auto_152454 ?auto_152458 ) ) ( not ( = ?auto_152456 ?auto_152459 ) ) ( not ( = ?auto_152456 ?auto_152458 ) ) ( ON ?auto_152458 ?auto_152455 ) ( not ( = ?auto_152451 ?auto_152455 ) ) ( not ( = ?auto_152452 ?auto_152455 ) ) ( not ( = ?auto_152453 ?auto_152455 ) ) ( not ( = ?auto_152454 ?auto_152455 ) ) ( not ( = ?auto_152456 ?auto_152455 ) ) ( not ( = ?auto_152457 ?auto_152455 ) ) ( not ( = ?auto_152458 ?auto_152455 ) ) ( not ( = ?auto_152459 ?auto_152455 ) ) ( ON ?auto_152459 ?auto_152458 ) ( ON-TABLE ?auto_152455 ) ( ON ?auto_152457 ?auto_152459 ) ( ON ?auto_152456 ?auto_152457 ) ( ON ?auto_152454 ?auto_152456 ) ( ON ?auto_152453 ?auto_152454 ) ( CLEAR ?auto_152453 ) ( HOLDING ?auto_152452 ) ( CLEAR ?auto_152451 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_152451 ?auto_152452 )
      ( MAKE-3PILE ?auto_152451 ?auto_152452 ?auto_152453 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152460 - BLOCK
      ?auto_152461 - BLOCK
      ?auto_152462 - BLOCK
    )
    :vars
    (
      ?auto_152466 - BLOCK
      ?auto_152468 - BLOCK
      ?auto_152467 - BLOCK
      ?auto_152464 - BLOCK
      ?auto_152463 - BLOCK
      ?auto_152465 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_152460 ) ( not ( = ?auto_152460 ?auto_152461 ) ) ( not ( = ?auto_152460 ?auto_152462 ) ) ( not ( = ?auto_152460 ?auto_152466 ) ) ( not ( = ?auto_152461 ?auto_152462 ) ) ( not ( = ?auto_152461 ?auto_152466 ) ) ( not ( = ?auto_152462 ?auto_152466 ) ) ( not ( = ?auto_152460 ?auto_152468 ) ) ( not ( = ?auto_152460 ?auto_152467 ) ) ( not ( = ?auto_152461 ?auto_152468 ) ) ( not ( = ?auto_152461 ?auto_152467 ) ) ( not ( = ?auto_152462 ?auto_152468 ) ) ( not ( = ?auto_152462 ?auto_152467 ) ) ( not ( = ?auto_152466 ?auto_152468 ) ) ( not ( = ?auto_152466 ?auto_152467 ) ) ( not ( = ?auto_152468 ?auto_152467 ) ) ( not ( = ?auto_152464 ?auto_152463 ) ) ( not ( = ?auto_152464 ?auto_152467 ) ) ( not ( = ?auto_152463 ?auto_152467 ) ) ( not ( = ?auto_152460 ?auto_152463 ) ) ( not ( = ?auto_152460 ?auto_152464 ) ) ( not ( = ?auto_152461 ?auto_152463 ) ) ( not ( = ?auto_152461 ?auto_152464 ) ) ( not ( = ?auto_152462 ?auto_152463 ) ) ( not ( = ?auto_152462 ?auto_152464 ) ) ( not ( = ?auto_152466 ?auto_152463 ) ) ( not ( = ?auto_152466 ?auto_152464 ) ) ( not ( = ?auto_152468 ?auto_152463 ) ) ( not ( = ?auto_152468 ?auto_152464 ) ) ( ON ?auto_152464 ?auto_152465 ) ( not ( = ?auto_152460 ?auto_152465 ) ) ( not ( = ?auto_152461 ?auto_152465 ) ) ( not ( = ?auto_152462 ?auto_152465 ) ) ( not ( = ?auto_152466 ?auto_152465 ) ) ( not ( = ?auto_152468 ?auto_152465 ) ) ( not ( = ?auto_152467 ?auto_152465 ) ) ( not ( = ?auto_152464 ?auto_152465 ) ) ( not ( = ?auto_152463 ?auto_152465 ) ) ( ON ?auto_152463 ?auto_152464 ) ( ON-TABLE ?auto_152465 ) ( ON ?auto_152467 ?auto_152463 ) ( ON ?auto_152468 ?auto_152467 ) ( ON ?auto_152466 ?auto_152468 ) ( ON ?auto_152462 ?auto_152466 ) ( CLEAR ?auto_152460 ) ( ON ?auto_152461 ?auto_152462 ) ( CLEAR ?auto_152461 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_152465 ?auto_152464 ?auto_152463 ?auto_152467 ?auto_152468 ?auto_152466 ?auto_152462 )
      ( MAKE-3PILE ?auto_152460 ?auto_152461 ?auto_152462 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152469 - BLOCK
      ?auto_152470 - BLOCK
      ?auto_152471 - BLOCK
    )
    :vars
    (
      ?auto_152477 - BLOCK
      ?auto_152476 - BLOCK
      ?auto_152472 - BLOCK
      ?auto_152474 - BLOCK
      ?auto_152473 - BLOCK
      ?auto_152475 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152469 ?auto_152470 ) ) ( not ( = ?auto_152469 ?auto_152471 ) ) ( not ( = ?auto_152469 ?auto_152477 ) ) ( not ( = ?auto_152470 ?auto_152471 ) ) ( not ( = ?auto_152470 ?auto_152477 ) ) ( not ( = ?auto_152471 ?auto_152477 ) ) ( not ( = ?auto_152469 ?auto_152476 ) ) ( not ( = ?auto_152469 ?auto_152472 ) ) ( not ( = ?auto_152470 ?auto_152476 ) ) ( not ( = ?auto_152470 ?auto_152472 ) ) ( not ( = ?auto_152471 ?auto_152476 ) ) ( not ( = ?auto_152471 ?auto_152472 ) ) ( not ( = ?auto_152477 ?auto_152476 ) ) ( not ( = ?auto_152477 ?auto_152472 ) ) ( not ( = ?auto_152476 ?auto_152472 ) ) ( not ( = ?auto_152474 ?auto_152473 ) ) ( not ( = ?auto_152474 ?auto_152472 ) ) ( not ( = ?auto_152473 ?auto_152472 ) ) ( not ( = ?auto_152469 ?auto_152473 ) ) ( not ( = ?auto_152469 ?auto_152474 ) ) ( not ( = ?auto_152470 ?auto_152473 ) ) ( not ( = ?auto_152470 ?auto_152474 ) ) ( not ( = ?auto_152471 ?auto_152473 ) ) ( not ( = ?auto_152471 ?auto_152474 ) ) ( not ( = ?auto_152477 ?auto_152473 ) ) ( not ( = ?auto_152477 ?auto_152474 ) ) ( not ( = ?auto_152476 ?auto_152473 ) ) ( not ( = ?auto_152476 ?auto_152474 ) ) ( ON ?auto_152474 ?auto_152475 ) ( not ( = ?auto_152469 ?auto_152475 ) ) ( not ( = ?auto_152470 ?auto_152475 ) ) ( not ( = ?auto_152471 ?auto_152475 ) ) ( not ( = ?auto_152477 ?auto_152475 ) ) ( not ( = ?auto_152476 ?auto_152475 ) ) ( not ( = ?auto_152472 ?auto_152475 ) ) ( not ( = ?auto_152474 ?auto_152475 ) ) ( not ( = ?auto_152473 ?auto_152475 ) ) ( ON ?auto_152473 ?auto_152474 ) ( ON-TABLE ?auto_152475 ) ( ON ?auto_152472 ?auto_152473 ) ( ON ?auto_152476 ?auto_152472 ) ( ON ?auto_152477 ?auto_152476 ) ( ON ?auto_152471 ?auto_152477 ) ( ON ?auto_152470 ?auto_152471 ) ( CLEAR ?auto_152470 ) ( HOLDING ?auto_152469 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_152469 )
      ( MAKE-3PILE ?auto_152469 ?auto_152470 ?auto_152471 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152478 - BLOCK
      ?auto_152479 - BLOCK
      ?auto_152480 - BLOCK
    )
    :vars
    (
      ?auto_152484 - BLOCK
      ?auto_152482 - BLOCK
      ?auto_152486 - BLOCK
      ?auto_152483 - BLOCK
      ?auto_152481 - BLOCK
      ?auto_152485 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152478 ?auto_152479 ) ) ( not ( = ?auto_152478 ?auto_152480 ) ) ( not ( = ?auto_152478 ?auto_152484 ) ) ( not ( = ?auto_152479 ?auto_152480 ) ) ( not ( = ?auto_152479 ?auto_152484 ) ) ( not ( = ?auto_152480 ?auto_152484 ) ) ( not ( = ?auto_152478 ?auto_152482 ) ) ( not ( = ?auto_152478 ?auto_152486 ) ) ( not ( = ?auto_152479 ?auto_152482 ) ) ( not ( = ?auto_152479 ?auto_152486 ) ) ( not ( = ?auto_152480 ?auto_152482 ) ) ( not ( = ?auto_152480 ?auto_152486 ) ) ( not ( = ?auto_152484 ?auto_152482 ) ) ( not ( = ?auto_152484 ?auto_152486 ) ) ( not ( = ?auto_152482 ?auto_152486 ) ) ( not ( = ?auto_152483 ?auto_152481 ) ) ( not ( = ?auto_152483 ?auto_152486 ) ) ( not ( = ?auto_152481 ?auto_152486 ) ) ( not ( = ?auto_152478 ?auto_152481 ) ) ( not ( = ?auto_152478 ?auto_152483 ) ) ( not ( = ?auto_152479 ?auto_152481 ) ) ( not ( = ?auto_152479 ?auto_152483 ) ) ( not ( = ?auto_152480 ?auto_152481 ) ) ( not ( = ?auto_152480 ?auto_152483 ) ) ( not ( = ?auto_152484 ?auto_152481 ) ) ( not ( = ?auto_152484 ?auto_152483 ) ) ( not ( = ?auto_152482 ?auto_152481 ) ) ( not ( = ?auto_152482 ?auto_152483 ) ) ( ON ?auto_152483 ?auto_152485 ) ( not ( = ?auto_152478 ?auto_152485 ) ) ( not ( = ?auto_152479 ?auto_152485 ) ) ( not ( = ?auto_152480 ?auto_152485 ) ) ( not ( = ?auto_152484 ?auto_152485 ) ) ( not ( = ?auto_152482 ?auto_152485 ) ) ( not ( = ?auto_152486 ?auto_152485 ) ) ( not ( = ?auto_152483 ?auto_152485 ) ) ( not ( = ?auto_152481 ?auto_152485 ) ) ( ON ?auto_152481 ?auto_152483 ) ( ON-TABLE ?auto_152485 ) ( ON ?auto_152486 ?auto_152481 ) ( ON ?auto_152482 ?auto_152486 ) ( ON ?auto_152484 ?auto_152482 ) ( ON ?auto_152480 ?auto_152484 ) ( ON ?auto_152479 ?auto_152480 ) ( ON ?auto_152478 ?auto_152479 ) ( CLEAR ?auto_152478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_152485 ?auto_152483 ?auto_152481 ?auto_152486 ?auto_152482 ?auto_152484 ?auto_152480 ?auto_152479 )
      ( MAKE-3PILE ?auto_152478 ?auto_152479 ?auto_152480 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_152492 - BLOCK
      ?auto_152493 - BLOCK
      ?auto_152494 - BLOCK
      ?auto_152495 - BLOCK
      ?auto_152496 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_152496 ) ( CLEAR ?auto_152495 ) ( ON-TABLE ?auto_152492 ) ( ON ?auto_152493 ?auto_152492 ) ( ON ?auto_152494 ?auto_152493 ) ( ON ?auto_152495 ?auto_152494 ) ( not ( = ?auto_152492 ?auto_152493 ) ) ( not ( = ?auto_152492 ?auto_152494 ) ) ( not ( = ?auto_152492 ?auto_152495 ) ) ( not ( = ?auto_152492 ?auto_152496 ) ) ( not ( = ?auto_152493 ?auto_152494 ) ) ( not ( = ?auto_152493 ?auto_152495 ) ) ( not ( = ?auto_152493 ?auto_152496 ) ) ( not ( = ?auto_152494 ?auto_152495 ) ) ( not ( = ?auto_152494 ?auto_152496 ) ) ( not ( = ?auto_152495 ?auto_152496 ) ) )
    :subtasks
    ( ( !STACK ?auto_152496 ?auto_152495 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_152497 - BLOCK
      ?auto_152498 - BLOCK
      ?auto_152499 - BLOCK
      ?auto_152500 - BLOCK
      ?auto_152501 - BLOCK
    )
    :vars
    (
      ?auto_152502 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_152500 ) ( ON-TABLE ?auto_152497 ) ( ON ?auto_152498 ?auto_152497 ) ( ON ?auto_152499 ?auto_152498 ) ( ON ?auto_152500 ?auto_152499 ) ( not ( = ?auto_152497 ?auto_152498 ) ) ( not ( = ?auto_152497 ?auto_152499 ) ) ( not ( = ?auto_152497 ?auto_152500 ) ) ( not ( = ?auto_152497 ?auto_152501 ) ) ( not ( = ?auto_152498 ?auto_152499 ) ) ( not ( = ?auto_152498 ?auto_152500 ) ) ( not ( = ?auto_152498 ?auto_152501 ) ) ( not ( = ?auto_152499 ?auto_152500 ) ) ( not ( = ?auto_152499 ?auto_152501 ) ) ( not ( = ?auto_152500 ?auto_152501 ) ) ( ON ?auto_152501 ?auto_152502 ) ( CLEAR ?auto_152501 ) ( HAND-EMPTY ) ( not ( = ?auto_152497 ?auto_152502 ) ) ( not ( = ?auto_152498 ?auto_152502 ) ) ( not ( = ?auto_152499 ?auto_152502 ) ) ( not ( = ?auto_152500 ?auto_152502 ) ) ( not ( = ?auto_152501 ?auto_152502 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_152501 ?auto_152502 )
      ( MAKE-5PILE ?auto_152497 ?auto_152498 ?auto_152499 ?auto_152500 ?auto_152501 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_152503 - BLOCK
      ?auto_152504 - BLOCK
      ?auto_152505 - BLOCK
      ?auto_152506 - BLOCK
      ?auto_152507 - BLOCK
    )
    :vars
    (
      ?auto_152508 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_152503 ) ( ON ?auto_152504 ?auto_152503 ) ( ON ?auto_152505 ?auto_152504 ) ( not ( = ?auto_152503 ?auto_152504 ) ) ( not ( = ?auto_152503 ?auto_152505 ) ) ( not ( = ?auto_152503 ?auto_152506 ) ) ( not ( = ?auto_152503 ?auto_152507 ) ) ( not ( = ?auto_152504 ?auto_152505 ) ) ( not ( = ?auto_152504 ?auto_152506 ) ) ( not ( = ?auto_152504 ?auto_152507 ) ) ( not ( = ?auto_152505 ?auto_152506 ) ) ( not ( = ?auto_152505 ?auto_152507 ) ) ( not ( = ?auto_152506 ?auto_152507 ) ) ( ON ?auto_152507 ?auto_152508 ) ( CLEAR ?auto_152507 ) ( not ( = ?auto_152503 ?auto_152508 ) ) ( not ( = ?auto_152504 ?auto_152508 ) ) ( not ( = ?auto_152505 ?auto_152508 ) ) ( not ( = ?auto_152506 ?auto_152508 ) ) ( not ( = ?auto_152507 ?auto_152508 ) ) ( HOLDING ?auto_152506 ) ( CLEAR ?auto_152505 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_152503 ?auto_152504 ?auto_152505 ?auto_152506 )
      ( MAKE-5PILE ?auto_152503 ?auto_152504 ?auto_152505 ?auto_152506 ?auto_152507 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_152509 - BLOCK
      ?auto_152510 - BLOCK
      ?auto_152511 - BLOCK
      ?auto_152512 - BLOCK
      ?auto_152513 - BLOCK
    )
    :vars
    (
      ?auto_152514 - BLOCK
      ?auto_152515 - BLOCK
      ?auto_152516 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_152509 ) ( ON ?auto_152510 ?auto_152509 ) ( ON ?auto_152511 ?auto_152510 ) ( not ( = ?auto_152509 ?auto_152510 ) ) ( not ( = ?auto_152509 ?auto_152511 ) ) ( not ( = ?auto_152509 ?auto_152512 ) ) ( not ( = ?auto_152509 ?auto_152513 ) ) ( not ( = ?auto_152510 ?auto_152511 ) ) ( not ( = ?auto_152510 ?auto_152512 ) ) ( not ( = ?auto_152510 ?auto_152513 ) ) ( not ( = ?auto_152511 ?auto_152512 ) ) ( not ( = ?auto_152511 ?auto_152513 ) ) ( not ( = ?auto_152512 ?auto_152513 ) ) ( ON ?auto_152513 ?auto_152514 ) ( not ( = ?auto_152509 ?auto_152514 ) ) ( not ( = ?auto_152510 ?auto_152514 ) ) ( not ( = ?auto_152511 ?auto_152514 ) ) ( not ( = ?auto_152512 ?auto_152514 ) ) ( not ( = ?auto_152513 ?auto_152514 ) ) ( CLEAR ?auto_152511 ) ( ON ?auto_152512 ?auto_152513 ) ( CLEAR ?auto_152512 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_152515 ) ( ON ?auto_152516 ?auto_152515 ) ( ON ?auto_152514 ?auto_152516 ) ( not ( = ?auto_152515 ?auto_152516 ) ) ( not ( = ?auto_152515 ?auto_152514 ) ) ( not ( = ?auto_152515 ?auto_152513 ) ) ( not ( = ?auto_152515 ?auto_152512 ) ) ( not ( = ?auto_152516 ?auto_152514 ) ) ( not ( = ?auto_152516 ?auto_152513 ) ) ( not ( = ?auto_152516 ?auto_152512 ) ) ( not ( = ?auto_152509 ?auto_152515 ) ) ( not ( = ?auto_152509 ?auto_152516 ) ) ( not ( = ?auto_152510 ?auto_152515 ) ) ( not ( = ?auto_152510 ?auto_152516 ) ) ( not ( = ?auto_152511 ?auto_152515 ) ) ( not ( = ?auto_152511 ?auto_152516 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_152515 ?auto_152516 ?auto_152514 ?auto_152513 )
      ( MAKE-5PILE ?auto_152509 ?auto_152510 ?auto_152511 ?auto_152512 ?auto_152513 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_152517 - BLOCK
      ?auto_152518 - BLOCK
      ?auto_152519 - BLOCK
      ?auto_152520 - BLOCK
      ?auto_152521 - BLOCK
    )
    :vars
    (
      ?auto_152523 - BLOCK
      ?auto_152524 - BLOCK
      ?auto_152522 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_152517 ) ( ON ?auto_152518 ?auto_152517 ) ( not ( = ?auto_152517 ?auto_152518 ) ) ( not ( = ?auto_152517 ?auto_152519 ) ) ( not ( = ?auto_152517 ?auto_152520 ) ) ( not ( = ?auto_152517 ?auto_152521 ) ) ( not ( = ?auto_152518 ?auto_152519 ) ) ( not ( = ?auto_152518 ?auto_152520 ) ) ( not ( = ?auto_152518 ?auto_152521 ) ) ( not ( = ?auto_152519 ?auto_152520 ) ) ( not ( = ?auto_152519 ?auto_152521 ) ) ( not ( = ?auto_152520 ?auto_152521 ) ) ( ON ?auto_152521 ?auto_152523 ) ( not ( = ?auto_152517 ?auto_152523 ) ) ( not ( = ?auto_152518 ?auto_152523 ) ) ( not ( = ?auto_152519 ?auto_152523 ) ) ( not ( = ?auto_152520 ?auto_152523 ) ) ( not ( = ?auto_152521 ?auto_152523 ) ) ( ON ?auto_152520 ?auto_152521 ) ( CLEAR ?auto_152520 ) ( ON-TABLE ?auto_152524 ) ( ON ?auto_152522 ?auto_152524 ) ( ON ?auto_152523 ?auto_152522 ) ( not ( = ?auto_152524 ?auto_152522 ) ) ( not ( = ?auto_152524 ?auto_152523 ) ) ( not ( = ?auto_152524 ?auto_152521 ) ) ( not ( = ?auto_152524 ?auto_152520 ) ) ( not ( = ?auto_152522 ?auto_152523 ) ) ( not ( = ?auto_152522 ?auto_152521 ) ) ( not ( = ?auto_152522 ?auto_152520 ) ) ( not ( = ?auto_152517 ?auto_152524 ) ) ( not ( = ?auto_152517 ?auto_152522 ) ) ( not ( = ?auto_152518 ?auto_152524 ) ) ( not ( = ?auto_152518 ?auto_152522 ) ) ( not ( = ?auto_152519 ?auto_152524 ) ) ( not ( = ?auto_152519 ?auto_152522 ) ) ( HOLDING ?auto_152519 ) ( CLEAR ?auto_152518 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_152517 ?auto_152518 ?auto_152519 )
      ( MAKE-5PILE ?auto_152517 ?auto_152518 ?auto_152519 ?auto_152520 ?auto_152521 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_152525 - BLOCK
      ?auto_152526 - BLOCK
      ?auto_152527 - BLOCK
      ?auto_152528 - BLOCK
      ?auto_152529 - BLOCK
    )
    :vars
    (
      ?auto_152532 - BLOCK
      ?auto_152531 - BLOCK
      ?auto_152530 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_152525 ) ( ON ?auto_152526 ?auto_152525 ) ( not ( = ?auto_152525 ?auto_152526 ) ) ( not ( = ?auto_152525 ?auto_152527 ) ) ( not ( = ?auto_152525 ?auto_152528 ) ) ( not ( = ?auto_152525 ?auto_152529 ) ) ( not ( = ?auto_152526 ?auto_152527 ) ) ( not ( = ?auto_152526 ?auto_152528 ) ) ( not ( = ?auto_152526 ?auto_152529 ) ) ( not ( = ?auto_152527 ?auto_152528 ) ) ( not ( = ?auto_152527 ?auto_152529 ) ) ( not ( = ?auto_152528 ?auto_152529 ) ) ( ON ?auto_152529 ?auto_152532 ) ( not ( = ?auto_152525 ?auto_152532 ) ) ( not ( = ?auto_152526 ?auto_152532 ) ) ( not ( = ?auto_152527 ?auto_152532 ) ) ( not ( = ?auto_152528 ?auto_152532 ) ) ( not ( = ?auto_152529 ?auto_152532 ) ) ( ON ?auto_152528 ?auto_152529 ) ( ON-TABLE ?auto_152531 ) ( ON ?auto_152530 ?auto_152531 ) ( ON ?auto_152532 ?auto_152530 ) ( not ( = ?auto_152531 ?auto_152530 ) ) ( not ( = ?auto_152531 ?auto_152532 ) ) ( not ( = ?auto_152531 ?auto_152529 ) ) ( not ( = ?auto_152531 ?auto_152528 ) ) ( not ( = ?auto_152530 ?auto_152532 ) ) ( not ( = ?auto_152530 ?auto_152529 ) ) ( not ( = ?auto_152530 ?auto_152528 ) ) ( not ( = ?auto_152525 ?auto_152531 ) ) ( not ( = ?auto_152525 ?auto_152530 ) ) ( not ( = ?auto_152526 ?auto_152531 ) ) ( not ( = ?auto_152526 ?auto_152530 ) ) ( not ( = ?auto_152527 ?auto_152531 ) ) ( not ( = ?auto_152527 ?auto_152530 ) ) ( CLEAR ?auto_152526 ) ( ON ?auto_152527 ?auto_152528 ) ( CLEAR ?auto_152527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_152531 ?auto_152530 ?auto_152532 ?auto_152529 ?auto_152528 )
      ( MAKE-5PILE ?auto_152525 ?auto_152526 ?auto_152527 ?auto_152528 ?auto_152529 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_152533 - BLOCK
      ?auto_152534 - BLOCK
      ?auto_152535 - BLOCK
      ?auto_152536 - BLOCK
      ?auto_152537 - BLOCK
    )
    :vars
    (
      ?auto_152539 - BLOCK
      ?auto_152538 - BLOCK
      ?auto_152540 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_152533 ) ( not ( = ?auto_152533 ?auto_152534 ) ) ( not ( = ?auto_152533 ?auto_152535 ) ) ( not ( = ?auto_152533 ?auto_152536 ) ) ( not ( = ?auto_152533 ?auto_152537 ) ) ( not ( = ?auto_152534 ?auto_152535 ) ) ( not ( = ?auto_152534 ?auto_152536 ) ) ( not ( = ?auto_152534 ?auto_152537 ) ) ( not ( = ?auto_152535 ?auto_152536 ) ) ( not ( = ?auto_152535 ?auto_152537 ) ) ( not ( = ?auto_152536 ?auto_152537 ) ) ( ON ?auto_152537 ?auto_152539 ) ( not ( = ?auto_152533 ?auto_152539 ) ) ( not ( = ?auto_152534 ?auto_152539 ) ) ( not ( = ?auto_152535 ?auto_152539 ) ) ( not ( = ?auto_152536 ?auto_152539 ) ) ( not ( = ?auto_152537 ?auto_152539 ) ) ( ON ?auto_152536 ?auto_152537 ) ( ON-TABLE ?auto_152538 ) ( ON ?auto_152540 ?auto_152538 ) ( ON ?auto_152539 ?auto_152540 ) ( not ( = ?auto_152538 ?auto_152540 ) ) ( not ( = ?auto_152538 ?auto_152539 ) ) ( not ( = ?auto_152538 ?auto_152537 ) ) ( not ( = ?auto_152538 ?auto_152536 ) ) ( not ( = ?auto_152540 ?auto_152539 ) ) ( not ( = ?auto_152540 ?auto_152537 ) ) ( not ( = ?auto_152540 ?auto_152536 ) ) ( not ( = ?auto_152533 ?auto_152538 ) ) ( not ( = ?auto_152533 ?auto_152540 ) ) ( not ( = ?auto_152534 ?auto_152538 ) ) ( not ( = ?auto_152534 ?auto_152540 ) ) ( not ( = ?auto_152535 ?auto_152538 ) ) ( not ( = ?auto_152535 ?auto_152540 ) ) ( ON ?auto_152535 ?auto_152536 ) ( CLEAR ?auto_152535 ) ( HOLDING ?auto_152534 ) ( CLEAR ?auto_152533 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_152533 ?auto_152534 )
      ( MAKE-5PILE ?auto_152533 ?auto_152534 ?auto_152535 ?auto_152536 ?auto_152537 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_152541 - BLOCK
      ?auto_152542 - BLOCK
      ?auto_152543 - BLOCK
      ?auto_152544 - BLOCK
      ?auto_152545 - BLOCK
    )
    :vars
    (
      ?auto_152546 - BLOCK
      ?auto_152547 - BLOCK
      ?auto_152548 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_152541 ) ( not ( = ?auto_152541 ?auto_152542 ) ) ( not ( = ?auto_152541 ?auto_152543 ) ) ( not ( = ?auto_152541 ?auto_152544 ) ) ( not ( = ?auto_152541 ?auto_152545 ) ) ( not ( = ?auto_152542 ?auto_152543 ) ) ( not ( = ?auto_152542 ?auto_152544 ) ) ( not ( = ?auto_152542 ?auto_152545 ) ) ( not ( = ?auto_152543 ?auto_152544 ) ) ( not ( = ?auto_152543 ?auto_152545 ) ) ( not ( = ?auto_152544 ?auto_152545 ) ) ( ON ?auto_152545 ?auto_152546 ) ( not ( = ?auto_152541 ?auto_152546 ) ) ( not ( = ?auto_152542 ?auto_152546 ) ) ( not ( = ?auto_152543 ?auto_152546 ) ) ( not ( = ?auto_152544 ?auto_152546 ) ) ( not ( = ?auto_152545 ?auto_152546 ) ) ( ON ?auto_152544 ?auto_152545 ) ( ON-TABLE ?auto_152547 ) ( ON ?auto_152548 ?auto_152547 ) ( ON ?auto_152546 ?auto_152548 ) ( not ( = ?auto_152547 ?auto_152548 ) ) ( not ( = ?auto_152547 ?auto_152546 ) ) ( not ( = ?auto_152547 ?auto_152545 ) ) ( not ( = ?auto_152547 ?auto_152544 ) ) ( not ( = ?auto_152548 ?auto_152546 ) ) ( not ( = ?auto_152548 ?auto_152545 ) ) ( not ( = ?auto_152548 ?auto_152544 ) ) ( not ( = ?auto_152541 ?auto_152547 ) ) ( not ( = ?auto_152541 ?auto_152548 ) ) ( not ( = ?auto_152542 ?auto_152547 ) ) ( not ( = ?auto_152542 ?auto_152548 ) ) ( not ( = ?auto_152543 ?auto_152547 ) ) ( not ( = ?auto_152543 ?auto_152548 ) ) ( ON ?auto_152543 ?auto_152544 ) ( CLEAR ?auto_152541 ) ( ON ?auto_152542 ?auto_152543 ) ( CLEAR ?auto_152542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_152547 ?auto_152548 ?auto_152546 ?auto_152545 ?auto_152544 ?auto_152543 )
      ( MAKE-5PILE ?auto_152541 ?auto_152542 ?auto_152543 ?auto_152544 ?auto_152545 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_152549 - BLOCK
      ?auto_152550 - BLOCK
      ?auto_152551 - BLOCK
      ?auto_152552 - BLOCK
      ?auto_152553 - BLOCK
    )
    :vars
    (
      ?auto_152555 - BLOCK
      ?auto_152556 - BLOCK
      ?auto_152554 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152549 ?auto_152550 ) ) ( not ( = ?auto_152549 ?auto_152551 ) ) ( not ( = ?auto_152549 ?auto_152552 ) ) ( not ( = ?auto_152549 ?auto_152553 ) ) ( not ( = ?auto_152550 ?auto_152551 ) ) ( not ( = ?auto_152550 ?auto_152552 ) ) ( not ( = ?auto_152550 ?auto_152553 ) ) ( not ( = ?auto_152551 ?auto_152552 ) ) ( not ( = ?auto_152551 ?auto_152553 ) ) ( not ( = ?auto_152552 ?auto_152553 ) ) ( ON ?auto_152553 ?auto_152555 ) ( not ( = ?auto_152549 ?auto_152555 ) ) ( not ( = ?auto_152550 ?auto_152555 ) ) ( not ( = ?auto_152551 ?auto_152555 ) ) ( not ( = ?auto_152552 ?auto_152555 ) ) ( not ( = ?auto_152553 ?auto_152555 ) ) ( ON ?auto_152552 ?auto_152553 ) ( ON-TABLE ?auto_152556 ) ( ON ?auto_152554 ?auto_152556 ) ( ON ?auto_152555 ?auto_152554 ) ( not ( = ?auto_152556 ?auto_152554 ) ) ( not ( = ?auto_152556 ?auto_152555 ) ) ( not ( = ?auto_152556 ?auto_152553 ) ) ( not ( = ?auto_152556 ?auto_152552 ) ) ( not ( = ?auto_152554 ?auto_152555 ) ) ( not ( = ?auto_152554 ?auto_152553 ) ) ( not ( = ?auto_152554 ?auto_152552 ) ) ( not ( = ?auto_152549 ?auto_152556 ) ) ( not ( = ?auto_152549 ?auto_152554 ) ) ( not ( = ?auto_152550 ?auto_152556 ) ) ( not ( = ?auto_152550 ?auto_152554 ) ) ( not ( = ?auto_152551 ?auto_152556 ) ) ( not ( = ?auto_152551 ?auto_152554 ) ) ( ON ?auto_152551 ?auto_152552 ) ( ON ?auto_152550 ?auto_152551 ) ( CLEAR ?auto_152550 ) ( HOLDING ?auto_152549 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_152549 )
      ( MAKE-5PILE ?auto_152549 ?auto_152550 ?auto_152551 ?auto_152552 ?auto_152553 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_152557 - BLOCK
      ?auto_152558 - BLOCK
      ?auto_152559 - BLOCK
      ?auto_152560 - BLOCK
      ?auto_152561 - BLOCK
    )
    :vars
    (
      ?auto_152562 - BLOCK
      ?auto_152563 - BLOCK
      ?auto_152564 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152557 ?auto_152558 ) ) ( not ( = ?auto_152557 ?auto_152559 ) ) ( not ( = ?auto_152557 ?auto_152560 ) ) ( not ( = ?auto_152557 ?auto_152561 ) ) ( not ( = ?auto_152558 ?auto_152559 ) ) ( not ( = ?auto_152558 ?auto_152560 ) ) ( not ( = ?auto_152558 ?auto_152561 ) ) ( not ( = ?auto_152559 ?auto_152560 ) ) ( not ( = ?auto_152559 ?auto_152561 ) ) ( not ( = ?auto_152560 ?auto_152561 ) ) ( ON ?auto_152561 ?auto_152562 ) ( not ( = ?auto_152557 ?auto_152562 ) ) ( not ( = ?auto_152558 ?auto_152562 ) ) ( not ( = ?auto_152559 ?auto_152562 ) ) ( not ( = ?auto_152560 ?auto_152562 ) ) ( not ( = ?auto_152561 ?auto_152562 ) ) ( ON ?auto_152560 ?auto_152561 ) ( ON-TABLE ?auto_152563 ) ( ON ?auto_152564 ?auto_152563 ) ( ON ?auto_152562 ?auto_152564 ) ( not ( = ?auto_152563 ?auto_152564 ) ) ( not ( = ?auto_152563 ?auto_152562 ) ) ( not ( = ?auto_152563 ?auto_152561 ) ) ( not ( = ?auto_152563 ?auto_152560 ) ) ( not ( = ?auto_152564 ?auto_152562 ) ) ( not ( = ?auto_152564 ?auto_152561 ) ) ( not ( = ?auto_152564 ?auto_152560 ) ) ( not ( = ?auto_152557 ?auto_152563 ) ) ( not ( = ?auto_152557 ?auto_152564 ) ) ( not ( = ?auto_152558 ?auto_152563 ) ) ( not ( = ?auto_152558 ?auto_152564 ) ) ( not ( = ?auto_152559 ?auto_152563 ) ) ( not ( = ?auto_152559 ?auto_152564 ) ) ( ON ?auto_152559 ?auto_152560 ) ( ON ?auto_152558 ?auto_152559 ) ( ON ?auto_152557 ?auto_152558 ) ( CLEAR ?auto_152557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_152563 ?auto_152564 ?auto_152562 ?auto_152561 ?auto_152560 ?auto_152559 ?auto_152558 )
      ( MAKE-5PILE ?auto_152557 ?auto_152558 ?auto_152559 ?auto_152560 ?auto_152561 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_152565 - BLOCK
      ?auto_152566 - BLOCK
      ?auto_152567 - BLOCK
      ?auto_152568 - BLOCK
      ?auto_152569 - BLOCK
    )
    :vars
    (
      ?auto_152572 - BLOCK
      ?auto_152571 - BLOCK
      ?auto_152570 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152565 ?auto_152566 ) ) ( not ( = ?auto_152565 ?auto_152567 ) ) ( not ( = ?auto_152565 ?auto_152568 ) ) ( not ( = ?auto_152565 ?auto_152569 ) ) ( not ( = ?auto_152566 ?auto_152567 ) ) ( not ( = ?auto_152566 ?auto_152568 ) ) ( not ( = ?auto_152566 ?auto_152569 ) ) ( not ( = ?auto_152567 ?auto_152568 ) ) ( not ( = ?auto_152567 ?auto_152569 ) ) ( not ( = ?auto_152568 ?auto_152569 ) ) ( ON ?auto_152569 ?auto_152572 ) ( not ( = ?auto_152565 ?auto_152572 ) ) ( not ( = ?auto_152566 ?auto_152572 ) ) ( not ( = ?auto_152567 ?auto_152572 ) ) ( not ( = ?auto_152568 ?auto_152572 ) ) ( not ( = ?auto_152569 ?auto_152572 ) ) ( ON ?auto_152568 ?auto_152569 ) ( ON-TABLE ?auto_152571 ) ( ON ?auto_152570 ?auto_152571 ) ( ON ?auto_152572 ?auto_152570 ) ( not ( = ?auto_152571 ?auto_152570 ) ) ( not ( = ?auto_152571 ?auto_152572 ) ) ( not ( = ?auto_152571 ?auto_152569 ) ) ( not ( = ?auto_152571 ?auto_152568 ) ) ( not ( = ?auto_152570 ?auto_152572 ) ) ( not ( = ?auto_152570 ?auto_152569 ) ) ( not ( = ?auto_152570 ?auto_152568 ) ) ( not ( = ?auto_152565 ?auto_152571 ) ) ( not ( = ?auto_152565 ?auto_152570 ) ) ( not ( = ?auto_152566 ?auto_152571 ) ) ( not ( = ?auto_152566 ?auto_152570 ) ) ( not ( = ?auto_152567 ?auto_152571 ) ) ( not ( = ?auto_152567 ?auto_152570 ) ) ( ON ?auto_152567 ?auto_152568 ) ( ON ?auto_152566 ?auto_152567 ) ( HOLDING ?auto_152565 ) ( CLEAR ?auto_152566 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_152571 ?auto_152570 ?auto_152572 ?auto_152569 ?auto_152568 ?auto_152567 ?auto_152566 ?auto_152565 )
      ( MAKE-5PILE ?auto_152565 ?auto_152566 ?auto_152567 ?auto_152568 ?auto_152569 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_152573 - BLOCK
      ?auto_152574 - BLOCK
      ?auto_152575 - BLOCK
      ?auto_152576 - BLOCK
      ?auto_152577 - BLOCK
    )
    :vars
    (
      ?auto_152578 - BLOCK
      ?auto_152580 - BLOCK
      ?auto_152579 - BLOCK
      ?auto_152581 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152573 ?auto_152574 ) ) ( not ( = ?auto_152573 ?auto_152575 ) ) ( not ( = ?auto_152573 ?auto_152576 ) ) ( not ( = ?auto_152573 ?auto_152577 ) ) ( not ( = ?auto_152574 ?auto_152575 ) ) ( not ( = ?auto_152574 ?auto_152576 ) ) ( not ( = ?auto_152574 ?auto_152577 ) ) ( not ( = ?auto_152575 ?auto_152576 ) ) ( not ( = ?auto_152575 ?auto_152577 ) ) ( not ( = ?auto_152576 ?auto_152577 ) ) ( ON ?auto_152577 ?auto_152578 ) ( not ( = ?auto_152573 ?auto_152578 ) ) ( not ( = ?auto_152574 ?auto_152578 ) ) ( not ( = ?auto_152575 ?auto_152578 ) ) ( not ( = ?auto_152576 ?auto_152578 ) ) ( not ( = ?auto_152577 ?auto_152578 ) ) ( ON ?auto_152576 ?auto_152577 ) ( ON-TABLE ?auto_152580 ) ( ON ?auto_152579 ?auto_152580 ) ( ON ?auto_152578 ?auto_152579 ) ( not ( = ?auto_152580 ?auto_152579 ) ) ( not ( = ?auto_152580 ?auto_152578 ) ) ( not ( = ?auto_152580 ?auto_152577 ) ) ( not ( = ?auto_152580 ?auto_152576 ) ) ( not ( = ?auto_152579 ?auto_152578 ) ) ( not ( = ?auto_152579 ?auto_152577 ) ) ( not ( = ?auto_152579 ?auto_152576 ) ) ( not ( = ?auto_152573 ?auto_152580 ) ) ( not ( = ?auto_152573 ?auto_152579 ) ) ( not ( = ?auto_152574 ?auto_152580 ) ) ( not ( = ?auto_152574 ?auto_152579 ) ) ( not ( = ?auto_152575 ?auto_152580 ) ) ( not ( = ?auto_152575 ?auto_152579 ) ) ( ON ?auto_152575 ?auto_152576 ) ( ON ?auto_152574 ?auto_152575 ) ( CLEAR ?auto_152574 ) ( ON ?auto_152573 ?auto_152581 ) ( CLEAR ?auto_152573 ) ( HAND-EMPTY ) ( not ( = ?auto_152573 ?auto_152581 ) ) ( not ( = ?auto_152574 ?auto_152581 ) ) ( not ( = ?auto_152575 ?auto_152581 ) ) ( not ( = ?auto_152576 ?auto_152581 ) ) ( not ( = ?auto_152577 ?auto_152581 ) ) ( not ( = ?auto_152578 ?auto_152581 ) ) ( not ( = ?auto_152580 ?auto_152581 ) ) ( not ( = ?auto_152579 ?auto_152581 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_152573 ?auto_152581 )
      ( MAKE-5PILE ?auto_152573 ?auto_152574 ?auto_152575 ?auto_152576 ?auto_152577 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_152582 - BLOCK
      ?auto_152583 - BLOCK
      ?auto_152584 - BLOCK
      ?auto_152585 - BLOCK
      ?auto_152586 - BLOCK
    )
    :vars
    (
      ?auto_152590 - BLOCK
      ?auto_152587 - BLOCK
      ?auto_152588 - BLOCK
      ?auto_152589 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152582 ?auto_152583 ) ) ( not ( = ?auto_152582 ?auto_152584 ) ) ( not ( = ?auto_152582 ?auto_152585 ) ) ( not ( = ?auto_152582 ?auto_152586 ) ) ( not ( = ?auto_152583 ?auto_152584 ) ) ( not ( = ?auto_152583 ?auto_152585 ) ) ( not ( = ?auto_152583 ?auto_152586 ) ) ( not ( = ?auto_152584 ?auto_152585 ) ) ( not ( = ?auto_152584 ?auto_152586 ) ) ( not ( = ?auto_152585 ?auto_152586 ) ) ( ON ?auto_152586 ?auto_152590 ) ( not ( = ?auto_152582 ?auto_152590 ) ) ( not ( = ?auto_152583 ?auto_152590 ) ) ( not ( = ?auto_152584 ?auto_152590 ) ) ( not ( = ?auto_152585 ?auto_152590 ) ) ( not ( = ?auto_152586 ?auto_152590 ) ) ( ON ?auto_152585 ?auto_152586 ) ( ON-TABLE ?auto_152587 ) ( ON ?auto_152588 ?auto_152587 ) ( ON ?auto_152590 ?auto_152588 ) ( not ( = ?auto_152587 ?auto_152588 ) ) ( not ( = ?auto_152587 ?auto_152590 ) ) ( not ( = ?auto_152587 ?auto_152586 ) ) ( not ( = ?auto_152587 ?auto_152585 ) ) ( not ( = ?auto_152588 ?auto_152590 ) ) ( not ( = ?auto_152588 ?auto_152586 ) ) ( not ( = ?auto_152588 ?auto_152585 ) ) ( not ( = ?auto_152582 ?auto_152587 ) ) ( not ( = ?auto_152582 ?auto_152588 ) ) ( not ( = ?auto_152583 ?auto_152587 ) ) ( not ( = ?auto_152583 ?auto_152588 ) ) ( not ( = ?auto_152584 ?auto_152587 ) ) ( not ( = ?auto_152584 ?auto_152588 ) ) ( ON ?auto_152584 ?auto_152585 ) ( ON ?auto_152582 ?auto_152589 ) ( CLEAR ?auto_152582 ) ( not ( = ?auto_152582 ?auto_152589 ) ) ( not ( = ?auto_152583 ?auto_152589 ) ) ( not ( = ?auto_152584 ?auto_152589 ) ) ( not ( = ?auto_152585 ?auto_152589 ) ) ( not ( = ?auto_152586 ?auto_152589 ) ) ( not ( = ?auto_152590 ?auto_152589 ) ) ( not ( = ?auto_152587 ?auto_152589 ) ) ( not ( = ?auto_152588 ?auto_152589 ) ) ( HOLDING ?auto_152583 ) ( CLEAR ?auto_152584 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_152587 ?auto_152588 ?auto_152590 ?auto_152586 ?auto_152585 ?auto_152584 ?auto_152583 )
      ( MAKE-5PILE ?auto_152582 ?auto_152583 ?auto_152584 ?auto_152585 ?auto_152586 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_152591 - BLOCK
      ?auto_152592 - BLOCK
      ?auto_152593 - BLOCK
      ?auto_152594 - BLOCK
      ?auto_152595 - BLOCK
    )
    :vars
    (
      ?auto_152598 - BLOCK
      ?auto_152597 - BLOCK
      ?auto_152599 - BLOCK
      ?auto_152596 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152591 ?auto_152592 ) ) ( not ( = ?auto_152591 ?auto_152593 ) ) ( not ( = ?auto_152591 ?auto_152594 ) ) ( not ( = ?auto_152591 ?auto_152595 ) ) ( not ( = ?auto_152592 ?auto_152593 ) ) ( not ( = ?auto_152592 ?auto_152594 ) ) ( not ( = ?auto_152592 ?auto_152595 ) ) ( not ( = ?auto_152593 ?auto_152594 ) ) ( not ( = ?auto_152593 ?auto_152595 ) ) ( not ( = ?auto_152594 ?auto_152595 ) ) ( ON ?auto_152595 ?auto_152598 ) ( not ( = ?auto_152591 ?auto_152598 ) ) ( not ( = ?auto_152592 ?auto_152598 ) ) ( not ( = ?auto_152593 ?auto_152598 ) ) ( not ( = ?auto_152594 ?auto_152598 ) ) ( not ( = ?auto_152595 ?auto_152598 ) ) ( ON ?auto_152594 ?auto_152595 ) ( ON-TABLE ?auto_152597 ) ( ON ?auto_152599 ?auto_152597 ) ( ON ?auto_152598 ?auto_152599 ) ( not ( = ?auto_152597 ?auto_152599 ) ) ( not ( = ?auto_152597 ?auto_152598 ) ) ( not ( = ?auto_152597 ?auto_152595 ) ) ( not ( = ?auto_152597 ?auto_152594 ) ) ( not ( = ?auto_152599 ?auto_152598 ) ) ( not ( = ?auto_152599 ?auto_152595 ) ) ( not ( = ?auto_152599 ?auto_152594 ) ) ( not ( = ?auto_152591 ?auto_152597 ) ) ( not ( = ?auto_152591 ?auto_152599 ) ) ( not ( = ?auto_152592 ?auto_152597 ) ) ( not ( = ?auto_152592 ?auto_152599 ) ) ( not ( = ?auto_152593 ?auto_152597 ) ) ( not ( = ?auto_152593 ?auto_152599 ) ) ( ON ?auto_152593 ?auto_152594 ) ( ON ?auto_152591 ?auto_152596 ) ( not ( = ?auto_152591 ?auto_152596 ) ) ( not ( = ?auto_152592 ?auto_152596 ) ) ( not ( = ?auto_152593 ?auto_152596 ) ) ( not ( = ?auto_152594 ?auto_152596 ) ) ( not ( = ?auto_152595 ?auto_152596 ) ) ( not ( = ?auto_152598 ?auto_152596 ) ) ( not ( = ?auto_152597 ?auto_152596 ) ) ( not ( = ?auto_152599 ?auto_152596 ) ) ( CLEAR ?auto_152593 ) ( ON ?auto_152592 ?auto_152591 ) ( CLEAR ?auto_152592 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_152596 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_152596 ?auto_152591 )
      ( MAKE-5PILE ?auto_152591 ?auto_152592 ?auto_152593 ?auto_152594 ?auto_152595 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_152600 - BLOCK
      ?auto_152601 - BLOCK
      ?auto_152602 - BLOCK
      ?auto_152603 - BLOCK
      ?auto_152604 - BLOCK
    )
    :vars
    (
      ?auto_152607 - BLOCK
      ?auto_152608 - BLOCK
      ?auto_152606 - BLOCK
      ?auto_152605 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152600 ?auto_152601 ) ) ( not ( = ?auto_152600 ?auto_152602 ) ) ( not ( = ?auto_152600 ?auto_152603 ) ) ( not ( = ?auto_152600 ?auto_152604 ) ) ( not ( = ?auto_152601 ?auto_152602 ) ) ( not ( = ?auto_152601 ?auto_152603 ) ) ( not ( = ?auto_152601 ?auto_152604 ) ) ( not ( = ?auto_152602 ?auto_152603 ) ) ( not ( = ?auto_152602 ?auto_152604 ) ) ( not ( = ?auto_152603 ?auto_152604 ) ) ( ON ?auto_152604 ?auto_152607 ) ( not ( = ?auto_152600 ?auto_152607 ) ) ( not ( = ?auto_152601 ?auto_152607 ) ) ( not ( = ?auto_152602 ?auto_152607 ) ) ( not ( = ?auto_152603 ?auto_152607 ) ) ( not ( = ?auto_152604 ?auto_152607 ) ) ( ON ?auto_152603 ?auto_152604 ) ( ON-TABLE ?auto_152608 ) ( ON ?auto_152606 ?auto_152608 ) ( ON ?auto_152607 ?auto_152606 ) ( not ( = ?auto_152608 ?auto_152606 ) ) ( not ( = ?auto_152608 ?auto_152607 ) ) ( not ( = ?auto_152608 ?auto_152604 ) ) ( not ( = ?auto_152608 ?auto_152603 ) ) ( not ( = ?auto_152606 ?auto_152607 ) ) ( not ( = ?auto_152606 ?auto_152604 ) ) ( not ( = ?auto_152606 ?auto_152603 ) ) ( not ( = ?auto_152600 ?auto_152608 ) ) ( not ( = ?auto_152600 ?auto_152606 ) ) ( not ( = ?auto_152601 ?auto_152608 ) ) ( not ( = ?auto_152601 ?auto_152606 ) ) ( not ( = ?auto_152602 ?auto_152608 ) ) ( not ( = ?auto_152602 ?auto_152606 ) ) ( ON ?auto_152600 ?auto_152605 ) ( not ( = ?auto_152600 ?auto_152605 ) ) ( not ( = ?auto_152601 ?auto_152605 ) ) ( not ( = ?auto_152602 ?auto_152605 ) ) ( not ( = ?auto_152603 ?auto_152605 ) ) ( not ( = ?auto_152604 ?auto_152605 ) ) ( not ( = ?auto_152607 ?auto_152605 ) ) ( not ( = ?auto_152608 ?auto_152605 ) ) ( not ( = ?auto_152606 ?auto_152605 ) ) ( ON ?auto_152601 ?auto_152600 ) ( CLEAR ?auto_152601 ) ( ON-TABLE ?auto_152605 ) ( HOLDING ?auto_152602 ) ( CLEAR ?auto_152603 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_152608 ?auto_152606 ?auto_152607 ?auto_152604 ?auto_152603 ?auto_152602 )
      ( MAKE-5PILE ?auto_152600 ?auto_152601 ?auto_152602 ?auto_152603 ?auto_152604 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_152609 - BLOCK
      ?auto_152610 - BLOCK
      ?auto_152611 - BLOCK
      ?auto_152612 - BLOCK
      ?auto_152613 - BLOCK
    )
    :vars
    (
      ?auto_152616 - BLOCK
      ?auto_152614 - BLOCK
      ?auto_152615 - BLOCK
      ?auto_152617 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152609 ?auto_152610 ) ) ( not ( = ?auto_152609 ?auto_152611 ) ) ( not ( = ?auto_152609 ?auto_152612 ) ) ( not ( = ?auto_152609 ?auto_152613 ) ) ( not ( = ?auto_152610 ?auto_152611 ) ) ( not ( = ?auto_152610 ?auto_152612 ) ) ( not ( = ?auto_152610 ?auto_152613 ) ) ( not ( = ?auto_152611 ?auto_152612 ) ) ( not ( = ?auto_152611 ?auto_152613 ) ) ( not ( = ?auto_152612 ?auto_152613 ) ) ( ON ?auto_152613 ?auto_152616 ) ( not ( = ?auto_152609 ?auto_152616 ) ) ( not ( = ?auto_152610 ?auto_152616 ) ) ( not ( = ?auto_152611 ?auto_152616 ) ) ( not ( = ?auto_152612 ?auto_152616 ) ) ( not ( = ?auto_152613 ?auto_152616 ) ) ( ON ?auto_152612 ?auto_152613 ) ( ON-TABLE ?auto_152614 ) ( ON ?auto_152615 ?auto_152614 ) ( ON ?auto_152616 ?auto_152615 ) ( not ( = ?auto_152614 ?auto_152615 ) ) ( not ( = ?auto_152614 ?auto_152616 ) ) ( not ( = ?auto_152614 ?auto_152613 ) ) ( not ( = ?auto_152614 ?auto_152612 ) ) ( not ( = ?auto_152615 ?auto_152616 ) ) ( not ( = ?auto_152615 ?auto_152613 ) ) ( not ( = ?auto_152615 ?auto_152612 ) ) ( not ( = ?auto_152609 ?auto_152614 ) ) ( not ( = ?auto_152609 ?auto_152615 ) ) ( not ( = ?auto_152610 ?auto_152614 ) ) ( not ( = ?auto_152610 ?auto_152615 ) ) ( not ( = ?auto_152611 ?auto_152614 ) ) ( not ( = ?auto_152611 ?auto_152615 ) ) ( ON ?auto_152609 ?auto_152617 ) ( not ( = ?auto_152609 ?auto_152617 ) ) ( not ( = ?auto_152610 ?auto_152617 ) ) ( not ( = ?auto_152611 ?auto_152617 ) ) ( not ( = ?auto_152612 ?auto_152617 ) ) ( not ( = ?auto_152613 ?auto_152617 ) ) ( not ( = ?auto_152616 ?auto_152617 ) ) ( not ( = ?auto_152614 ?auto_152617 ) ) ( not ( = ?auto_152615 ?auto_152617 ) ) ( ON ?auto_152610 ?auto_152609 ) ( ON-TABLE ?auto_152617 ) ( CLEAR ?auto_152612 ) ( ON ?auto_152611 ?auto_152610 ) ( CLEAR ?auto_152611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_152617 ?auto_152609 ?auto_152610 )
      ( MAKE-5PILE ?auto_152609 ?auto_152610 ?auto_152611 ?auto_152612 ?auto_152613 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_152618 - BLOCK
      ?auto_152619 - BLOCK
      ?auto_152620 - BLOCK
      ?auto_152621 - BLOCK
      ?auto_152622 - BLOCK
    )
    :vars
    (
      ?auto_152626 - BLOCK
      ?auto_152624 - BLOCK
      ?auto_152623 - BLOCK
      ?auto_152625 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152618 ?auto_152619 ) ) ( not ( = ?auto_152618 ?auto_152620 ) ) ( not ( = ?auto_152618 ?auto_152621 ) ) ( not ( = ?auto_152618 ?auto_152622 ) ) ( not ( = ?auto_152619 ?auto_152620 ) ) ( not ( = ?auto_152619 ?auto_152621 ) ) ( not ( = ?auto_152619 ?auto_152622 ) ) ( not ( = ?auto_152620 ?auto_152621 ) ) ( not ( = ?auto_152620 ?auto_152622 ) ) ( not ( = ?auto_152621 ?auto_152622 ) ) ( ON ?auto_152622 ?auto_152626 ) ( not ( = ?auto_152618 ?auto_152626 ) ) ( not ( = ?auto_152619 ?auto_152626 ) ) ( not ( = ?auto_152620 ?auto_152626 ) ) ( not ( = ?auto_152621 ?auto_152626 ) ) ( not ( = ?auto_152622 ?auto_152626 ) ) ( ON-TABLE ?auto_152624 ) ( ON ?auto_152623 ?auto_152624 ) ( ON ?auto_152626 ?auto_152623 ) ( not ( = ?auto_152624 ?auto_152623 ) ) ( not ( = ?auto_152624 ?auto_152626 ) ) ( not ( = ?auto_152624 ?auto_152622 ) ) ( not ( = ?auto_152624 ?auto_152621 ) ) ( not ( = ?auto_152623 ?auto_152626 ) ) ( not ( = ?auto_152623 ?auto_152622 ) ) ( not ( = ?auto_152623 ?auto_152621 ) ) ( not ( = ?auto_152618 ?auto_152624 ) ) ( not ( = ?auto_152618 ?auto_152623 ) ) ( not ( = ?auto_152619 ?auto_152624 ) ) ( not ( = ?auto_152619 ?auto_152623 ) ) ( not ( = ?auto_152620 ?auto_152624 ) ) ( not ( = ?auto_152620 ?auto_152623 ) ) ( ON ?auto_152618 ?auto_152625 ) ( not ( = ?auto_152618 ?auto_152625 ) ) ( not ( = ?auto_152619 ?auto_152625 ) ) ( not ( = ?auto_152620 ?auto_152625 ) ) ( not ( = ?auto_152621 ?auto_152625 ) ) ( not ( = ?auto_152622 ?auto_152625 ) ) ( not ( = ?auto_152626 ?auto_152625 ) ) ( not ( = ?auto_152624 ?auto_152625 ) ) ( not ( = ?auto_152623 ?auto_152625 ) ) ( ON ?auto_152619 ?auto_152618 ) ( ON-TABLE ?auto_152625 ) ( ON ?auto_152620 ?auto_152619 ) ( CLEAR ?auto_152620 ) ( HOLDING ?auto_152621 ) ( CLEAR ?auto_152622 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_152624 ?auto_152623 ?auto_152626 ?auto_152622 ?auto_152621 )
      ( MAKE-5PILE ?auto_152618 ?auto_152619 ?auto_152620 ?auto_152621 ?auto_152622 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_152627 - BLOCK
      ?auto_152628 - BLOCK
      ?auto_152629 - BLOCK
      ?auto_152630 - BLOCK
      ?auto_152631 - BLOCK
    )
    :vars
    (
      ?auto_152633 - BLOCK
      ?auto_152634 - BLOCK
      ?auto_152635 - BLOCK
      ?auto_152632 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152627 ?auto_152628 ) ) ( not ( = ?auto_152627 ?auto_152629 ) ) ( not ( = ?auto_152627 ?auto_152630 ) ) ( not ( = ?auto_152627 ?auto_152631 ) ) ( not ( = ?auto_152628 ?auto_152629 ) ) ( not ( = ?auto_152628 ?auto_152630 ) ) ( not ( = ?auto_152628 ?auto_152631 ) ) ( not ( = ?auto_152629 ?auto_152630 ) ) ( not ( = ?auto_152629 ?auto_152631 ) ) ( not ( = ?auto_152630 ?auto_152631 ) ) ( ON ?auto_152631 ?auto_152633 ) ( not ( = ?auto_152627 ?auto_152633 ) ) ( not ( = ?auto_152628 ?auto_152633 ) ) ( not ( = ?auto_152629 ?auto_152633 ) ) ( not ( = ?auto_152630 ?auto_152633 ) ) ( not ( = ?auto_152631 ?auto_152633 ) ) ( ON-TABLE ?auto_152634 ) ( ON ?auto_152635 ?auto_152634 ) ( ON ?auto_152633 ?auto_152635 ) ( not ( = ?auto_152634 ?auto_152635 ) ) ( not ( = ?auto_152634 ?auto_152633 ) ) ( not ( = ?auto_152634 ?auto_152631 ) ) ( not ( = ?auto_152634 ?auto_152630 ) ) ( not ( = ?auto_152635 ?auto_152633 ) ) ( not ( = ?auto_152635 ?auto_152631 ) ) ( not ( = ?auto_152635 ?auto_152630 ) ) ( not ( = ?auto_152627 ?auto_152634 ) ) ( not ( = ?auto_152627 ?auto_152635 ) ) ( not ( = ?auto_152628 ?auto_152634 ) ) ( not ( = ?auto_152628 ?auto_152635 ) ) ( not ( = ?auto_152629 ?auto_152634 ) ) ( not ( = ?auto_152629 ?auto_152635 ) ) ( ON ?auto_152627 ?auto_152632 ) ( not ( = ?auto_152627 ?auto_152632 ) ) ( not ( = ?auto_152628 ?auto_152632 ) ) ( not ( = ?auto_152629 ?auto_152632 ) ) ( not ( = ?auto_152630 ?auto_152632 ) ) ( not ( = ?auto_152631 ?auto_152632 ) ) ( not ( = ?auto_152633 ?auto_152632 ) ) ( not ( = ?auto_152634 ?auto_152632 ) ) ( not ( = ?auto_152635 ?auto_152632 ) ) ( ON ?auto_152628 ?auto_152627 ) ( ON-TABLE ?auto_152632 ) ( ON ?auto_152629 ?auto_152628 ) ( CLEAR ?auto_152631 ) ( ON ?auto_152630 ?auto_152629 ) ( CLEAR ?auto_152630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_152632 ?auto_152627 ?auto_152628 ?auto_152629 )
      ( MAKE-5PILE ?auto_152627 ?auto_152628 ?auto_152629 ?auto_152630 ?auto_152631 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_152636 - BLOCK
      ?auto_152637 - BLOCK
      ?auto_152638 - BLOCK
      ?auto_152639 - BLOCK
      ?auto_152640 - BLOCK
    )
    :vars
    (
      ?auto_152641 - BLOCK
      ?auto_152642 - BLOCK
      ?auto_152643 - BLOCK
      ?auto_152644 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152636 ?auto_152637 ) ) ( not ( = ?auto_152636 ?auto_152638 ) ) ( not ( = ?auto_152636 ?auto_152639 ) ) ( not ( = ?auto_152636 ?auto_152640 ) ) ( not ( = ?auto_152637 ?auto_152638 ) ) ( not ( = ?auto_152637 ?auto_152639 ) ) ( not ( = ?auto_152637 ?auto_152640 ) ) ( not ( = ?auto_152638 ?auto_152639 ) ) ( not ( = ?auto_152638 ?auto_152640 ) ) ( not ( = ?auto_152639 ?auto_152640 ) ) ( not ( = ?auto_152636 ?auto_152641 ) ) ( not ( = ?auto_152637 ?auto_152641 ) ) ( not ( = ?auto_152638 ?auto_152641 ) ) ( not ( = ?auto_152639 ?auto_152641 ) ) ( not ( = ?auto_152640 ?auto_152641 ) ) ( ON-TABLE ?auto_152642 ) ( ON ?auto_152643 ?auto_152642 ) ( ON ?auto_152641 ?auto_152643 ) ( not ( = ?auto_152642 ?auto_152643 ) ) ( not ( = ?auto_152642 ?auto_152641 ) ) ( not ( = ?auto_152642 ?auto_152640 ) ) ( not ( = ?auto_152642 ?auto_152639 ) ) ( not ( = ?auto_152643 ?auto_152641 ) ) ( not ( = ?auto_152643 ?auto_152640 ) ) ( not ( = ?auto_152643 ?auto_152639 ) ) ( not ( = ?auto_152636 ?auto_152642 ) ) ( not ( = ?auto_152636 ?auto_152643 ) ) ( not ( = ?auto_152637 ?auto_152642 ) ) ( not ( = ?auto_152637 ?auto_152643 ) ) ( not ( = ?auto_152638 ?auto_152642 ) ) ( not ( = ?auto_152638 ?auto_152643 ) ) ( ON ?auto_152636 ?auto_152644 ) ( not ( = ?auto_152636 ?auto_152644 ) ) ( not ( = ?auto_152637 ?auto_152644 ) ) ( not ( = ?auto_152638 ?auto_152644 ) ) ( not ( = ?auto_152639 ?auto_152644 ) ) ( not ( = ?auto_152640 ?auto_152644 ) ) ( not ( = ?auto_152641 ?auto_152644 ) ) ( not ( = ?auto_152642 ?auto_152644 ) ) ( not ( = ?auto_152643 ?auto_152644 ) ) ( ON ?auto_152637 ?auto_152636 ) ( ON-TABLE ?auto_152644 ) ( ON ?auto_152638 ?auto_152637 ) ( ON ?auto_152639 ?auto_152638 ) ( CLEAR ?auto_152639 ) ( HOLDING ?auto_152640 ) ( CLEAR ?auto_152641 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_152642 ?auto_152643 ?auto_152641 ?auto_152640 )
      ( MAKE-5PILE ?auto_152636 ?auto_152637 ?auto_152638 ?auto_152639 ?auto_152640 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_152645 - BLOCK
      ?auto_152646 - BLOCK
      ?auto_152647 - BLOCK
      ?auto_152648 - BLOCK
      ?auto_152649 - BLOCK
    )
    :vars
    (
      ?auto_152652 - BLOCK
      ?auto_152650 - BLOCK
      ?auto_152653 - BLOCK
      ?auto_152651 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152645 ?auto_152646 ) ) ( not ( = ?auto_152645 ?auto_152647 ) ) ( not ( = ?auto_152645 ?auto_152648 ) ) ( not ( = ?auto_152645 ?auto_152649 ) ) ( not ( = ?auto_152646 ?auto_152647 ) ) ( not ( = ?auto_152646 ?auto_152648 ) ) ( not ( = ?auto_152646 ?auto_152649 ) ) ( not ( = ?auto_152647 ?auto_152648 ) ) ( not ( = ?auto_152647 ?auto_152649 ) ) ( not ( = ?auto_152648 ?auto_152649 ) ) ( not ( = ?auto_152645 ?auto_152652 ) ) ( not ( = ?auto_152646 ?auto_152652 ) ) ( not ( = ?auto_152647 ?auto_152652 ) ) ( not ( = ?auto_152648 ?auto_152652 ) ) ( not ( = ?auto_152649 ?auto_152652 ) ) ( ON-TABLE ?auto_152650 ) ( ON ?auto_152653 ?auto_152650 ) ( ON ?auto_152652 ?auto_152653 ) ( not ( = ?auto_152650 ?auto_152653 ) ) ( not ( = ?auto_152650 ?auto_152652 ) ) ( not ( = ?auto_152650 ?auto_152649 ) ) ( not ( = ?auto_152650 ?auto_152648 ) ) ( not ( = ?auto_152653 ?auto_152652 ) ) ( not ( = ?auto_152653 ?auto_152649 ) ) ( not ( = ?auto_152653 ?auto_152648 ) ) ( not ( = ?auto_152645 ?auto_152650 ) ) ( not ( = ?auto_152645 ?auto_152653 ) ) ( not ( = ?auto_152646 ?auto_152650 ) ) ( not ( = ?auto_152646 ?auto_152653 ) ) ( not ( = ?auto_152647 ?auto_152650 ) ) ( not ( = ?auto_152647 ?auto_152653 ) ) ( ON ?auto_152645 ?auto_152651 ) ( not ( = ?auto_152645 ?auto_152651 ) ) ( not ( = ?auto_152646 ?auto_152651 ) ) ( not ( = ?auto_152647 ?auto_152651 ) ) ( not ( = ?auto_152648 ?auto_152651 ) ) ( not ( = ?auto_152649 ?auto_152651 ) ) ( not ( = ?auto_152652 ?auto_152651 ) ) ( not ( = ?auto_152650 ?auto_152651 ) ) ( not ( = ?auto_152653 ?auto_152651 ) ) ( ON ?auto_152646 ?auto_152645 ) ( ON-TABLE ?auto_152651 ) ( ON ?auto_152647 ?auto_152646 ) ( ON ?auto_152648 ?auto_152647 ) ( CLEAR ?auto_152652 ) ( ON ?auto_152649 ?auto_152648 ) ( CLEAR ?auto_152649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_152651 ?auto_152645 ?auto_152646 ?auto_152647 ?auto_152648 )
      ( MAKE-5PILE ?auto_152645 ?auto_152646 ?auto_152647 ?auto_152648 ?auto_152649 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_152654 - BLOCK
      ?auto_152655 - BLOCK
      ?auto_152656 - BLOCK
      ?auto_152657 - BLOCK
      ?auto_152658 - BLOCK
    )
    :vars
    (
      ?auto_152662 - BLOCK
      ?auto_152660 - BLOCK
      ?auto_152661 - BLOCK
      ?auto_152659 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152654 ?auto_152655 ) ) ( not ( = ?auto_152654 ?auto_152656 ) ) ( not ( = ?auto_152654 ?auto_152657 ) ) ( not ( = ?auto_152654 ?auto_152658 ) ) ( not ( = ?auto_152655 ?auto_152656 ) ) ( not ( = ?auto_152655 ?auto_152657 ) ) ( not ( = ?auto_152655 ?auto_152658 ) ) ( not ( = ?auto_152656 ?auto_152657 ) ) ( not ( = ?auto_152656 ?auto_152658 ) ) ( not ( = ?auto_152657 ?auto_152658 ) ) ( not ( = ?auto_152654 ?auto_152662 ) ) ( not ( = ?auto_152655 ?auto_152662 ) ) ( not ( = ?auto_152656 ?auto_152662 ) ) ( not ( = ?auto_152657 ?auto_152662 ) ) ( not ( = ?auto_152658 ?auto_152662 ) ) ( ON-TABLE ?auto_152660 ) ( ON ?auto_152661 ?auto_152660 ) ( not ( = ?auto_152660 ?auto_152661 ) ) ( not ( = ?auto_152660 ?auto_152662 ) ) ( not ( = ?auto_152660 ?auto_152658 ) ) ( not ( = ?auto_152660 ?auto_152657 ) ) ( not ( = ?auto_152661 ?auto_152662 ) ) ( not ( = ?auto_152661 ?auto_152658 ) ) ( not ( = ?auto_152661 ?auto_152657 ) ) ( not ( = ?auto_152654 ?auto_152660 ) ) ( not ( = ?auto_152654 ?auto_152661 ) ) ( not ( = ?auto_152655 ?auto_152660 ) ) ( not ( = ?auto_152655 ?auto_152661 ) ) ( not ( = ?auto_152656 ?auto_152660 ) ) ( not ( = ?auto_152656 ?auto_152661 ) ) ( ON ?auto_152654 ?auto_152659 ) ( not ( = ?auto_152654 ?auto_152659 ) ) ( not ( = ?auto_152655 ?auto_152659 ) ) ( not ( = ?auto_152656 ?auto_152659 ) ) ( not ( = ?auto_152657 ?auto_152659 ) ) ( not ( = ?auto_152658 ?auto_152659 ) ) ( not ( = ?auto_152662 ?auto_152659 ) ) ( not ( = ?auto_152660 ?auto_152659 ) ) ( not ( = ?auto_152661 ?auto_152659 ) ) ( ON ?auto_152655 ?auto_152654 ) ( ON-TABLE ?auto_152659 ) ( ON ?auto_152656 ?auto_152655 ) ( ON ?auto_152657 ?auto_152656 ) ( ON ?auto_152658 ?auto_152657 ) ( CLEAR ?auto_152658 ) ( HOLDING ?auto_152662 ) ( CLEAR ?auto_152661 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_152660 ?auto_152661 ?auto_152662 )
      ( MAKE-5PILE ?auto_152654 ?auto_152655 ?auto_152656 ?auto_152657 ?auto_152658 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_152663 - BLOCK
      ?auto_152664 - BLOCK
      ?auto_152665 - BLOCK
      ?auto_152666 - BLOCK
      ?auto_152667 - BLOCK
    )
    :vars
    (
      ?auto_152670 - BLOCK
      ?auto_152669 - BLOCK
      ?auto_152668 - BLOCK
      ?auto_152671 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152663 ?auto_152664 ) ) ( not ( = ?auto_152663 ?auto_152665 ) ) ( not ( = ?auto_152663 ?auto_152666 ) ) ( not ( = ?auto_152663 ?auto_152667 ) ) ( not ( = ?auto_152664 ?auto_152665 ) ) ( not ( = ?auto_152664 ?auto_152666 ) ) ( not ( = ?auto_152664 ?auto_152667 ) ) ( not ( = ?auto_152665 ?auto_152666 ) ) ( not ( = ?auto_152665 ?auto_152667 ) ) ( not ( = ?auto_152666 ?auto_152667 ) ) ( not ( = ?auto_152663 ?auto_152670 ) ) ( not ( = ?auto_152664 ?auto_152670 ) ) ( not ( = ?auto_152665 ?auto_152670 ) ) ( not ( = ?auto_152666 ?auto_152670 ) ) ( not ( = ?auto_152667 ?auto_152670 ) ) ( ON-TABLE ?auto_152669 ) ( ON ?auto_152668 ?auto_152669 ) ( not ( = ?auto_152669 ?auto_152668 ) ) ( not ( = ?auto_152669 ?auto_152670 ) ) ( not ( = ?auto_152669 ?auto_152667 ) ) ( not ( = ?auto_152669 ?auto_152666 ) ) ( not ( = ?auto_152668 ?auto_152670 ) ) ( not ( = ?auto_152668 ?auto_152667 ) ) ( not ( = ?auto_152668 ?auto_152666 ) ) ( not ( = ?auto_152663 ?auto_152669 ) ) ( not ( = ?auto_152663 ?auto_152668 ) ) ( not ( = ?auto_152664 ?auto_152669 ) ) ( not ( = ?auto_152664 ?auto_152668 ) ) ( not ( = ?auto_152665 ?auto_152669 ) ) ( not ( = ?auto_152665 ?auto_152668 ) ) ( ON ?auto_152663 ?auto_152671 ) ( not ( = ?auto_152663 ?auto_152671 ) ) ( not ( = ?auto_152664 ?auto_152671 ) ) ( not ( = ?auto_152665 ?auto_152671 ) ) ( not ( = ?auto_152666 ?auto_152671 ) ) ( not ( = ?auto_152667 ?auto_152671 ) ) ( not ( = ?auto_152670 ?auto_152671 ) ) ( not ( = ?auto_152669 ?auto_152671 ) ) ( not ( = ?auto_152668 ?auto_152671 ) ) ( ON ?auto_152664 ?auto_152663 ) ( ON-TABLE ?auto_152671 ) ( ON ?auto_152665 ?auto_152664 ) ( ON ?auto_152666 ?auto_152665 ) ( ON ?auto_152667 ?auto_152666 ) ( CLEAR ?auto_152668 ) ( ON ?auto_152670 ?auto_152667 ) ( CLEAR ?auto_152670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_152671 ?auto_152663 ?auto_152664 ?auto_152665 ?auto_152666 ?auto_152667 )
      ( MAKE-5PILE ?auto_152663 ?auto_152664 ?auto_152665 ?auto_152666 ?auto_152667 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_152672 - BLOCK
      ?auto_152673 - BLOCK
      ?auto_152674 - BLOCK
      ?auto_152675 - BLOCK
      ?auto_152676 - BLOCK
    )
    :vars
    (
      ?auto_152678 - BLOCK
      ?auto_152680 - BLOCK
      ?auto_152679 - BLOCK
      ?auto_152677 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152672 ?auto_152673 ) ) ( not ( = ?auto_152672 ?auto_152674 ) ) ( not ( = ?auto_152672 ?auto_152675 ) ) ( not ( = ?auto_152672 ?auto_152676 ) ) ( not ( = ?auto_152673 ?auto_152674 ) ) ( not ( = ?auto_152673 ?auto_152675 ) ) ( not ( = ?auto_152673 ?auto_152676 ) ) ( not ( = ?auto_152674 ?auto_152675 ) ) ( not ( = ?auto_152674 ?auto_152676 ) ) ( not ( = ?auto_152675 ?auto_152676 ) ) ( not ( = ?auto_152672 ?auto_152678 ) ) ( not ( = ?auto_152673 ?auto_152678 ) ) ( not ( = ?auto_152674 ?auto_152678 ) ) ( not ( = ?auto_152675 ?auto_152678 ) ) ( not ( = ?auto_152676 ?auto_152678 ) ) ( ON-TABLE ?auto_152680 ) ( not ( = ?auto_152680 ?auto_152679 ) ) ( not ( = ?auto_152680 ?auto_152678 ) ) ( not ( = ?auto_152680 ?auto_152676 ) ) ( not ( = ?auto_152680 ?auto_152675 ) ) ( not ( = ?auto_152679 ?auto_152678 ) ) ( not ( = ?auto_152679 ?auto_152676 ) ) ( not ( = ?auto_152679 ?auto_152675 ) ) ( not ( = ?auto_152672 ?auto_152680 ) ) ( not ( = ?auto_152672 ?auto_152679 ) ) ( not ( = ?auto_152673 ?auto_152680 ) ) ( not ( = ?auto_152673 ?auto_152679 ) ) ( not ( = ?auto_152674 ?auto_152680 ) ) ( not ( = ?auto_152674 ?auto_152679 ) ) ( ON ?auto_152672 ?auto_152677 ) ( not ( = ?auto_152672 ?auto_152677 ) ) ( not ( = ?auto_152673 ?auto_152677 ) ) ( not ( = ?auto_152674 ?auto_152677 ) ) ( not ( = ?auto_152675 ?auto_152677 ) ) ( not ( = ?auto_152676 ?auto_152677 ) ) ( not ( = ?auto_152678 ?auto_152677 ) ) ( not ( = ?auto_152680 ?auto_152677 ) ) ( not ( = ?auto_152679 ?auto_152677 ) ) ( ON ?auto_152673 ?auto_152672 ) ( ON-TABLE ?auto_152677 ) ( ON ?auto_152674 ?auto_152673 ) ( ON ?auto_152675 ?auto_152674 ) ( ON ?auto_152676 ?auto_152675 ) ( ON ?auto_152678 ?auto_152676 ) ( CLEAR ?auto_152678 ) ( HOLDING ?auto_152679 ) ( CLEAR ?auto_152680 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_152680 ?auto_152679 )
      ( MAKE-5PILE ?auto_152672 ?auto_152673 ?auto_152674 ?auto_152675 ?auto_152676 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_152681 - BLOCK
      ?auto_152682 - BLOCK
      ?auto_152683 - BLOCK
      ?auto_152684 - BLOCK
      ?auto_152685 - BLOCK
    )
    :vars
    (
      ?auto_152687 - BLOCK
      ?auto_152686 - BLOCK
      ?auto_152688 - BLOCK
      ?auto_152689 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152681 ?auto_152682 ) ) ( not ( = ?auto_152681 ?auto_152683 ) ) ( not ( = ?auto_152681 ?auto_152684 ) ) ( not ( = ?auto_152681 ?auto_152685 ) ) ( not ( = ?auto_152682 ?auto_152683 ) ) ( not ( = ?auto_152682 ?auto_152684 ) ) ( not ( = ?auto_152682 ?auto_152685 ) ) ( not ( = ?auto_152683 ?auto_152684 ) ) ( not ( = ?auto_152683 ?auto_152685 ) ) ( not ( = ?auto_152684 ?auto_152685 ) ) ( not ( = ?auto_152681 ?auto_152687 ) ) ( not ( = ?auto_152682 ?auto_152687 ) ) ( not ( = ?auto_152683 ?auto_152687 ) ) ( not ( = ?auto_152684 ?auto_152687 ) ) ( not ( = ?auto_152685 ?auto_152687 ) ) ( ON-TABLE ?auto_152686 ) ( not ( = ?auto_152686 ?auto_152688 ) ) ( not ( = ?auto_152686 ?auto_152687 ) ) ( not ( = ?auto_152686 ?auto_152685 ) ) ( not ( = ?auto_152686 ?auto_152684 ) ) ( not ( = ?auto_152688 ?auto_152687 ) ) ( not ( = ?auto_152688 ?auto_152685 ) ) ( not ( = ?auto_152688 ?auto_152684 ) ) ( not ( = ?auto_152681 ?auto_152686 ) ) ( not ( = ?auto_152681 ?auto_152688 ) ) ( not ( = ?auto_152682 ?auto_152686 ) ) ( not ( = ?auto_152682 ?auto_152688 ) ) ( not ( = ?auto_152683 ?auto_152686 ) ) ( not ( = ?auto_152683 ?auto_152688 ) ) ( ON ?auto_152681 ?auto_152689 ) ( not ( = ?auto_152681 ?auto_152689 ) ) ( not ( = ?auto_152682 ?auto_152689 ) ) ( not ( = ?auto_152683 ?auto_152689 ) ) ( not ( = ?auto_152684 ?auto_152689 ) ) ( not ( = ?auto_152685 ?auto_152689 ) ) ( not ( = ?auto_152687 ?auto_152689 ) ) ( not ( = ?auto_152686 ?auto_152689 ) ) ( not ( = ?auto_152688 ?auto_152689 ) ) ( ON ?auto_152682 ?auto_152681 ) ( ON-TABLE ?auto_152689 ) ( ON ?auto_152683 ?auto_152682 ) ( ON ?auto_152684 ?auto_152683 ) ( ON ?auto_152685 ?auto_152684 ) ( ON ?auto_152687 ?auto_152685 ) ( CLEAR ?auto_152686 ) ( ON ?auto_152688 ?auto_152687 ) ( CLEAR ?auto_152688 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_152689 ?auto_152681 ?auto_152682 ?auto_152683 ?auto_152684 ?auto_152685 ?auto_152687 )
      ( MAKE-5PILE ?auto_152681 ?auto_152682 ?auto_152683 ?auto_152684 ?auto_152685 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_152690 - BLOCK
      ?auto_152691 - BLOCK
      ?auto_152692 - BLOCK
      ?auto_152693 - BLOCK
      ?auto_152694 - BLOCK
    )
    :vars
    (
      ?auto_152698 - BLOCK
      ?auto_152695 - BLOCK
      ?auto_152696 - BLOCK
      ?auto_152697 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152690 ?auto_152691 ) ) ( not ( = ?auto_152690 ?auto_152692 ) ) ( not ( = ?auto_152690 ?auto_152693 ) ) ( not ( = ?auto_152690 ?auto_152694 ) ) ( not ( = ?auto_152691 ?auto_152692 ) ) ( not ( = ?auto_152691 ?auto_152693 ) ) ( not ( = ?auto_152691 ?auto_152694 ) ) ( not ( = ?auto_152692 ?auto_152693 ) ) ( not ( = ?auto_152692 ?auto_152694 ) ) ( not ( = ?auto_152693 ?auto_152694 ) ) ( not ( = ?auto_152690 ?auto_152698 ) ) ( not ( = ?auto_152691 ?auto_152698 ) ) ( not ( = ?auto_152692 ?auto_152698 ) ) ( not ( = ?auto_152693 ?auto_152698 ) ) ( not ( = ?auto_152694 ?auto_152698 ) ) ( not ( = ?auto_152695 ?auto_152696 ) ) ( not ( = ?auto_152695 ?auto_152698 ) ) ( not ( = ?auto_152695 ?auto_152694 ) ) ( not ( = ?auto_152695 ?auto_152693 ) ) ( not ( = ?auto_152696 ?auto_152698 ) ) ( not ( = ?auto_152696 ?auto_152694 ) ) ( not ( = ?auto_152696 ?auto_152693 ) ) ( not ( = ?auto_152690 ?auto_152695 ) ) ( not ( = ?auto_152690 ?auto_152696 ) ) ( not ( = ?auto_152691 ?auto_152695 ) ) ( not ( = ?auto_152691 ?auto_152696 ) ) ( not ( = ?auto_152692 ?auto_152695 ) ) ( not ( = ?auto_152692 ?auto_152696 ) ) ( ON ?auto_152690 ?auto_152697 ) ( not ( = ?auto_152690 ?auto_152697 ) ) ( not ( = ?auto_152691 ?auto_152697 ) ) ( not ( = ?auto_152692 ?auto_152697 ) ) ( not ( = ?auto_152693 ?auto_152697 ) ) ( not ( = ?auto_152694 ?auto_152697 ) ) ( not ( = ?auto_152698 ?auto_152697 ) ) ( not ( = ?auto_152695 ?auto_152697 ) ) ( not ( = ?auto_152696 ?auto_152697 ) ) ( ON ?auto_152691 ?auto_152690 ) ( ON-TABLE ?auto_152697 ) ( ON ?auto_152692 ?auto_152691 ) ( ON ?auto_152693 ?auto_152692 ) ( ON ?auto_152694 ?auto_152693 ) ( ON ?auto_152698 ?auto_152694 ) ( ON ?auto_152696 ?auto_152698 ) ( CLEAR ?auto_152696 ) ( HOLDING ?auto_152695 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_152695 )
      ( MAKE-5PILE ?auto_152690 ?auto_152691 ?auto_152692 ?auto_152693 ?auto_152694 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_152699 - BLOCK
      ?auto_152700 - BLOCK
      ?auto_152701 - BLOCK
      ?auto_152702 - BLOCK
      ?auto_152703 - BLOCK
    )
    :vars
    (
      ?auto_152705 - BLOCK
      ?auto_152706 - BLOCK
      ?auto_152704 - BLOCK
      ?auto_152707 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152699 ?auto_152700 ) ) ( not ( = ?auto_152699 ?auto_152701 ) ) ( not ( = ?auto_152699 ?auto_152702 ) ) ( not ( = ?auto_152699 ?auto_152703 ) ) ( not ( = ?auto_152700 ?auto_152701 ) ) ( not ( = ?auto_152700 ?auto_152702 ) ) ( not ( = ?auto_152700 ?auto_152703 ) ) ( not ( = ?auto_152701 ?auto_152702 ) ) ( not ( = ?auto_152701 ?auto_152703 ) ) ( not ( = ?auto_152702 ?auto_152703 ) ) ( not ( = ?auto_152699 ?auto_152705 ) ) ( not ( = ?auto_152700 ?auto_152705 ) ) ( not ( = ?auto_152701 ?auto_152705 ) ) ( not ( = ?auto_152702 ?auto_152705 ) ) ( not ( = ?auto_152703 ?auto_152705 ) ) ( not ( = ?auto_152706 ?auto_152704 ) ) ( not ( = ?auto_152706 ?auto_152705 ) ) ( not ( = ?auto_152706 ?auto_152703 ) ) ( not ( = ?auto_152706 ?auto_152702 ) ) ( not ( = ?auto_152704 ?auto_152705 ) ) ( not ( = ?auto_152704 ?auto_152703 ) ) ( not ( = ?auto_152704 ?auto_152702 ) ) ( not ( = ?auto_152699 ?auto_152706 ) ) ( not ( = ?auto_152699 ?auto_152704 ) ) ( not ( = ?auto_152700 ?auto_152706 ) ) ( not ( = ?auto_152700 ?auto_152704 ) ) ( not ( = ?auto_152701 ?auto_152706 ) ) ( not ( = ?auto_152701 ?auto_152704 ) ) ( ON ?auto_152699 ?auto_152707 ) ( not ( = ?auto_152699 ?auto_152707 ) ) ( not ( = ?auto_152700 ?auto_152707 ) ) ( not ( = ?auto_152701 ?auto_152707 ) ) ( not ( = ?auto_152702 ?auto_152707 ) ) ( not ( = ?auto_152703 ?auto_152707 ) ) ( not ( = ?auto_152705 ?auto_152707 ) ) ( not ( = ?auto_152706 ?auto_152707 ) ) ( not ( = ?auto_152704 ?auto_152707 ) ) ( ON ?auto_152700 ?auto_152699 ) ( ON-TABLE ?auto_152707 ) ( ON ?auto_152701 ?auto_152700 ) ( ON ?auto_152702 ?auto_152701 ) ( ON ?auto_152703 ?auto_152702 ) ( ON ?auto_152705 ?auto_152703 ) ( ON ?auto_152704 ?auto_152705 ) ( ON ?auto_152706 ?auto_152704 ) ( CLEAR ?auto_152706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_152707 ?auto_152699 ?auto_152700 ?auto_152701 ?auto_152702 ?auto_152703 ?auto_152705 ?auto_152704 )
      ( MAKE-5PILE ?auto_152699 ?auto_152700 ?auto_152701 ?auto_152702 ?auto_152703 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_152710 - BLOCK
      ?auto_152711 - BLOCK
    )
    :vars
    (
      ?auto_152712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152712 ?auto_152711 ) ( CLEAR ?auto_152712 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_152710 ) ( ON ?auto_152711 ?auto_152710 ) ( not ( = ?auto_152710 ?auto_152711 ) ) ( not ( = ?auto_152710 ?auto_152712 ) ) ( not ( = ?auto_152711 ?auto_152712 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_152712 ?auto_152711 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_152713 - BLOCK
      ?auto_152714 - BLOCK
    )
    :vars
    (
      ?auto_152715 - BLOCK
      ?auto_152716 - BLOCK
      ?auto_152717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152715 ?auto_152714 ) ( CLEAR ?auto_152715 ) ( ON-TABLE ?auto_152713 ) ( ON ?auto_152714 ?auto_152713 ) ( not ( = ?auto_152713 ?auto_152714 ) ) ( not ( = ?auto_152713 ?auto_152715 ) ) ( not ( = ?auto_152714 ?auto_152715 ) ) ( HOLDING ?auto_152716 ) ( CLEAR ?auto_152717 ) ( not ( = ?auto_152713 ?auto_152716 ) ) ( not ( = ?auto_152713 ?auto_152717 ) ) ( not ( = ?auto_152714 ?auto_152716 ) ) ( not ( = ?auto_152714 ?auto_152717 ) ) ( not ( = ?auto_152715 ?auto_152716 ) ) ( not ( = ?auto_152715 ?auto_152717 ) ) ( not ( = ?auto_152716 ?auto_152717 ) ) )
    :subtasks
    ( ( !STACK ?auto_152716 ?auto_152717 )
      ( MAKE-2PILE ?auto_152713 ?auto_152714 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_152718 - BLOCK
      ?auto_152719 - BLOCK
    )
    :vars
    (
      ?auto_152722 - BLOCK
      ?auto_152721 - BLOCK
      ?auto_152720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152722 ?auto_152719 ) ( ON-TABLE ?auto_152718 ) ( ON ?auto_152719 ?auto_152718 ) ( not ( = ?auto_152718 ?auto_152719 ) ) ( not ( = ?auto_152718 ?auto_152722 ) ) ( not ( = ?auto_152719 ?auto_152722 ) ) ( CLEAR ?auto_152721 ) ( not ( = ?auto_152718 ?auto_152720 ) ) ( not ( = ?auto_152718 ?auto_152721 ) ) ( not ( = ?auto_152719 ?auto_152720 ) ) ( not ( = ?auto_152719 ?auto_152721 ) ) ( not ( = ?auto_152722 ?auto_152720 ) ) ( not ( = ?auto_152722 ?auto_152721 ) ) ( not ( = ?auto_152720 ?auto_152721 ) ) ( ON ?auto_152720 ?auto_152722 ) ( CLEAR ?auto_152720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_152718 ?auto_152719 ?auto_152722 )
      ( MAKE-2PILE ?auto_152718 ?auto_152719 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_152723 - BLOCK
      ?auto_152724 - BLOCK
    )
    :vars
    (
      ?auto_152726 - BLOCK
      ?auto_152725 - BLOCK
      ?auto_152727 - BLOCK
      ?auto_152730 - BLOCK
      ?auto_152728 - BLOCK
      ?auto_152729 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152726 ?auto_152724 ) ( ON-TABLE ?auto_152723 ) ( ON ?auto_152724 ?auto_152723 ) ( not ( = ?auto_152723 ?auto_152724 ) ) ( not ( = ?auto_152723 ?auto_152726 ) ) ( not ( = ?auto_152724 ?auto_152726 ) ) ( not ( = ?auto_152723 ?auto_152725 ) ) ( not ( = ?auto_152723 ?auto_152727 ) ) ( not ( = ?auto_152724 ?auto_152725 ) ) ( not ( = ?auto_152724 ?auto_152727 ) ) ( not ( = ?auto_152726 ?auto_152725 ) ) ( not ( = ?auto_152726 ?auto_152727 ) ) ( not ( = ?auto_152725 ?auto_152727 ) ) ( ON ?auto_152725 ?auto_152726 ) ( CLEAR ?auto_152725 ) ( HOLDING ?auto_152727 ) ( CLEAR ?auto_152730 ) ( ON-TABLE ?auto_152728 ) ( ON ?auto_152729 ?auto_152728 ) ( ON ?auto_152730 ?auto_152729 ) ( not ( = ?auto_152728 ?auto_152729 ) ) ( not ( = ?auto_152728 ?auto_152730 ) ) ( not ( = ?auto_152728 ?auto_152727 ) ) ( not ( = ?auto_152729 ?auto_152730 ) ) ( not ( = ?auto_152729 ?auto_152727 ) ) ( not ( = ?auto_152730 ?auto_152727 ) ) ( not ( = ?auto_152723 ?auto_152730 ) ) ( not ( = ?auto_152723 ?auto_152728 ) ) ( not ( = ?auto_152723 ?auto_152729 ) ) ( not ( = ?auto_152724 ?auto_152730 ) ) ( not ( = ?auto_152724 ?auto_152728 ) ) ( not ( = ?auto_152724 ?auto_152729 ) ) ( not ( = ?auto_152726 ?auto_152730 ) ) ( not ( = ?auto_152726 ?auto_152728 ) ) ( not ( = ?auto_152726 ?auto_152729 ) ) ( not ( = ?auto_152725 ?auto_152730 ) ) ( not ( = ?auto_152725 ?auto_152728 ) ) ( not ( = ?auto_152725 ?auto_152729 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_152728 ?auto_152729 ?auto_152730 ?auto_152727 )
      ( MAKE-2PILE ?auto_152723 ?auto_152724 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_152731 - BLOCK
      ?auto_152732 - BLOCK
    )
    :vars
    (
      ?auto_152734 - BLOCK
      ?auto_152735 - BLOCK
      ?auto_152736 - BLOCK
      ?auto_152733 - BLOCK
      ?auto_152737 - BLOCK
      ?auto_152738 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152734 ?auto_152732 ) ( ON-TABLE ?auto_152731 ) ( ON ?auto_152732 ?auto_152731 ) ( not ( = ?auto_152731 ?auto_152732 ) ) ( not ( = ?auto_152731 ?auto_152734 ) ) ( not ( = ?auto_152732 ?auto_152734 ) ) ( not ( = ?auto_152731 ?auto_152735 ) ) ( not ( = ?auto_152731 ?auto_152736 ) ) ( not ( = ?auto_152732 ?auto_152735 ) ) ( not ( = ?auto_152732 ?auto_152736 ) ) ( not ( = ?auto_152734 ?auto_152735 ) ) ( not ( = ?auto_152734 ?auto_152736 ) ) ( not ( = ?auto_152735 ?auto_152736 ) ) ( ON ?auto_152735 ?auto_152734 ) ( CLEAR ?auto_152733 ) ( ON-TABLE ?auto_152737 ) ( ON ?auto_152738 ?auto_152737 ) ( ON ?auto_152733 ?auto_152738 ) ( not ( = ?auto_152737 ?auto_152738 ) ) ( not ( = ?auto_152737 ?auto_152733 ) ) ( not ( = ?auto_152737 ?auto_152736 ) ) ( not ( = ?auto_152738 ?auto_152733 ) ) ( not ( = ?auto_152738 ?auto_152736 ) ) ( not ( = ?auto_152733 ?auto_152736 ) ) ( not ( = ?auto_152731 ?auto_152733 ) ) ( not ( = ?auto_152731 ?auto_152737 ) ) ( not ( = ?auto_152731 ?auto_152738 ) ) ( not ( = ?auto_152732 ?auto_152733 ) ) ( not ( = ?auto_152732 ?auto_152737 ) ) ( not ( = ?auto_152732 ?auto_152738 ) ) ( not ( = ?auto_152734 ?auto_152733 ) ) ( not ( = ?auto_152734 ?auto_152737 ) ) ( not ( = ?auto_152734 ?auto_152738 ) ) ( not ( = ?auto_152735 ?auto_152733 ) ) ( not ( = ?auto_152735 ?auto_152737 ) ) ( not ( = ?auto_152735 ?auto_152738 ) ) ( ON ?auto_152736 ?auto_152735 ) ( CLEAR ?auto_152736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_152731 ?auto_152732 ?auto_152734 ?auto_152735 )
      ( MAKE-2PILE ?auto_152731 ?auto_152732 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_152739 - BLOCK
      ?auto_152740 - BLOCK
    )
    :vars
    (
      ?auto_152744 - BLOCK
      ?auto_152742 - BLOCK
      ?auto_152746 - BLOCK
      ?auto_152743 - BLOCK
      ?auto_152745 - BLOCK
      ?auto_152741 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152744 ?auto_152740 ) ( ON-TABLE ?auto_152739 ) ( ON ?auto_152740 ?auto_152739 ) ( not ( = ?auto_152739 ?auto_152740 ) ) ( not ( = ?auto_152739 ?auto_152744 ) ) ( not ( = ?auto_152740 ?auto_152744 ) ) ( not ( = ?auto_152739 ?auto_152742 ) ) ( not ( = ?auto_152739 ?auto_152746 ) ) ( not ( = ?auto_152740 ?auto_152742 ) ) ( not ( = ?auto_152740 ?auto_152746 ) ) ( not ( = ?auto_152744 ?auto_152742 ) ) ( not ( = ?auto_152744 ?auto_152746 ) ) ( not ( = ?auto_152742 ?auto_152746 ) ) ( ON ?auto_152742 ?auto_152744 ) ( ON-TABLE ?auto_152743 ) ( ON ?auto_152745 ?auto_152743 ) ( not ( = ?auto_152743 ?auto_152745 ) ) ( not ( = ?auto_152743 ?auto_152741 ) ) ( not ( = ?auto_152743 ?auto_152746 ) ) ( not ( = ?auto_152745 ?auto_152741 ) ) ( not ( = ?auto_152745 ?auto_152746 ) ) ( not ( = ?auto_152741 ?auto_152746 ) ) ( not ( = ?auto_152739 ?auto_152741 ) ) ( not ( = ?auto_152739 ?auto_152743 ) ) ( not ( = ?auto_152739 ?auto_152745 ) ) ( not ( = ?auto_152740 ?auto_152741 ) ) ( not ( = ?auto_152740 ?auto_152743 ) ) ( not ( = ?auto_152740 ?auto_152745 ) ) ( not ( = ?auto_152744 ?auto_152741 ) ) ( not ( = ?auto_152744 ?auto_152743 ) ) ( not ( = ?auto_152744 ?auto_152745 ) ) ( not ( = ?auto_152742 ?auto_152741 ) ) ( not ( = ?auto_152742 ?auto_152743 ) ) ( not ( = ?auto_152742 ?auto_152745 ) ) ( ON ?auto_152746 ?auto_152742 ) ( CLEAR ?auto_152746 ) ( HOLDING ?auto_152741 ) ( CLEAR ?auto_152745 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_152743 ?auto_152745 ?auto_152741 )
      ( MAKE-2PILE ?auto_152739 ?auto_152740 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_152747 - BLOCK
      ?auto_152748 - BLOCK
    )
    :vars
    (
      ?auto_152750 - BLOCK
      ?auto_152752 - BLOCK
      ?auto_152753 - BLOCK
      ?auto_152749 - BLOCK
      ?auto_152751 - BLOCK
      ?auto_152754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152750 ?auto_152748 ) ( ON-TABLE ?auto_152747 ) ( ON ?auto_152748 ?auto_152747 ) ( not ( = ?auto_152747 ?auto_152748 ) ) ( not ( = ?auto_152747 ?auto_152750 ) ) ( not ( = ?auto_152748 ?auto_152750 ) ) ( not ( = ?auto_152747 ?auto_152752 ) ) ( not ( = ?auto_152747 ?auto_152753 ) ) ( not ( = ?auto_152748 ?auto_152752 ) ) ( not ( = ?auto_152748 ?auto_152753 ) ) ( not ( = ?auto_152750 ?auto_152752 ) ) ( not ( = ?auto_152750 ?auto_152753 ) ) ( not ( = ?auto_152752 ?auto_152753 ) ) ( ON ?auto_152752 ?auto_152750 ) ( ON-TABLE ?auto_152749 ) ( ON ?auto_152751 ?auto_152749 ) ( not ( = ?auto_152749 ?auto_152751 ) ) ( not ( = ?auto_152749 ?auto_152754 ) ) ( not ( = ?auto_152749 ?auto_152753 ) ) ( not ( = ?auto_152751 ?auto_152754 ) ) ( not ( = ?auto_152751 ?auto_152753 ) ) ( not ( = ?auto_152754 ?auto_152753 ) ) ( not ( = ?auto_152747 ?auto_152754 ) ) ( not ( = ?auto_152747 ?auto_152749 ) ) ( not ( = ?auto_152747 ?auto_152751 ) ) ( not ( = ?auto_152748 ?auto_152754 ) ) ( not ( = ?auto_152748 ?auto_152749 ) ) ( not ( = ?auto_152748 ?auto_152751 ) ) ( not ( = ?auto_152750 ?auto_152754 ) ) ( not ( = ?auto_152750 ?auto_152749 ) ) ( not ( = ?auto_152750 ?auto_152751 ) ) ( not ( = ?auto_152752 ?auto_152754 ) ) ( not ( = ?auto_152752 ?auto_152749 ) ) ( not ( = ?auto_152752 ?auto_152751 ) ) ( ON ?auto_152753 ?auto_152752 ) ( CLEAR ?auto_152751 ) ( ON ?auto_152754 ?auto_152753 ) ( CLEAR ?auto_152754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_152747 ?auto_152748 ?auto_152750 ?auto_152752 ?auto_152753 )
      ( MAKE-2PILE ?auto_152747 ?auto_152748 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_152755 - BLOCK
      ?auto_152756 - BLOCK
    )
    :vars
    (
      ?auto_152759 - BLOCK
      ?auto_152760 - BLOCK
      ?auto_152762 - BLOCK
      ?auto_152758 - BLOCK
      ?auto_152757 - BLOCK
      ?auto_152761 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152759 ?auto_152756 ) ( ON-TABLE ?auto_152755 ) ( ON ?auto_152756 ?auto_152755 ) ( not ( = ?auto_152755 ?auto_152756 ) ) ( not ( = ?auto_152755 ?auto_152759 ) ) ( not ( = ?auto_152756 ?auto_152759 ) ) ( not ( = ?auto_152755 ?auto_152760 ) ) ( not ( = ?auto_152755 ?auto_152762 ) ) ( not ( = ?auto_152756 ?auto_152760 ) ) ( not ( = ?auto_152756 ?auto_152762 ) ) ( not ( = ?auto_152759 ?auto_152760 ) ) ( not ( = ?auto_152759 ?auto_152762 ) ) ( not ( = ?auto_152760 ?auto_152762 ) ) ( ON ?auto_152760 ?auto_152759 ) ( ON-TABLE ?auto_152758 ) ( not ( = ?auto_152758 ?auto_152757 ) ) ( not ( = ?auto_152758 ?auto_152761 ) ) ( not ( = ?auto_152758 ?auto_152762 ) ) ( not ( = ?auto_152757 ?auto_152761 ) ) ( not ( = ?auto_152757 ?auto_152762 ) ) ( not ( = ?auto_152761 ?auto_152762 ) ) ( not ( = ?auto_152755 ?auto_152761 ) ) ( not ( = ?auto_152755 ?auto_152758 ) ) ( not ( = ?auto_152755 ?auto_152757 ) ) ( not ( = ?auto_152756 ?auto_152761 ) ) ( not ( = ?auto_152756 ?auto_152758 ) ) ( not ( = ?auto_152756 ?auto_152757 ) ) ( not ( = ?auto_152759 ?auto_152761 ) ) ( not ( = ?auto_152759 ?auto_152758 ) ) ( not ( = ?auto_152759 ?auto_152757 ) ) ( not ( = ?auto_152760 ?auto_152761 ) ) ( not ( = ?auto_152760 ?auto_152758 ) ) ( not ( = ?auto_152760 ?auto_152757 ) ) ( ON ?auto_152762 ?auto_152760 ) ( ON ?auto_152761 ?auto_152762 ) ( CLEAR ?auto_152761 ) ( HOLDING ?auto_152757 ) ( CLEAR ?auto_152758 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_152758 ?auto_152757 )
      ( MAKE-2PILE ?auto_152755 ?auto_152756 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_152763 - BLOCK
      ?auto_152764 - BLOCK
    )
    :vars
    (
      ?auto_152766 - BLOCK
      ?auto_152770 - BLOCK
      ?auto_152765 - BLOCK
      ?auto_152768 - BLOCK
      ?auto_152769 - BLOCK
      ?auto_152767 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152766 ?auto_152764 ) ( ON-TABLE ?auto_152763 ) ( ON ?auto_152764 ?auto_152763 ) ( not ( = ?auto_152763 ?auto_152764 ) ) ( not ( = ?auto_152763 ?auto_152766 ) ) ( not ( = ?auto_152764 ?auto_152766 ) ) ( not ( = ?auto_152763 ?auto_152770 ) ) ( not ( = ?auto_152763 ?auto_152765 ) ) ( not ( = ?auto_152764 ?auto_152770 ) ) ( not ( = ?auto_152764 ?auto_152765 ) ) ( not ( = ?auto_152766 ?auto_152770 ) ) ( not ( = ?auto_152766 ?auto_152765 ) ) ( not ( = ?auto_152770 ?auto_152765 ) ) ( ON ?auto_152770 ?auto_152766 ) ( ON-TABLE ?auto_152768 ) ( not ( = ?auto_152768 ?auto_152769 ) ) ( not ( = ?auto_152768 ?auto_152767 ) ) ( not ( = ?auto_152768 ?auto_152765 ) ) ( not ( = ?auto_152769 ?auto_152767 ) ) ( not ( = ?auto_152769 ?auto_152765 ) ) ( not ( = ?auto_152767 ?auto_152765 ) ) ( not ( = ?auto_152763 ?auto_152767 ) ) ( not ( = ?auto_152763 ?auto_152768 ) ) ( not ( = ?auto_152763 ?auto_152769 ) ) ( not ( = ?auto_152764 ?auto_152767 ) ) ( not ( = ?auto_152764 ?auto_152768 ) ) ( not ( = ?auto_152764 ?auto_152769 ) ) ( not ( = ?auto_152766 ?auto_152767 ) ) ( not ( = ?auto_152766 ?auto_152768 ) ) ( not ( = ?auto_152766 ?auto_152769 ) ) ( not ( = ?auto_152770 ?auto_152767 ) ) ( not ( = ?auto_152770 ?auto_152768 ) ) ( not ( = ?auto_152770 ?auto_152769 ) ) ( ON ?auto_152765 ?auto_152770 ) ( ON ?auto_152767 ?auto_152765 ) ( CLEAR ?auto_152768 ) ( ON ?auto_152769 ?auto_152767 ) ( CLEAR ?auto_152769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_152763 ?auto_152764 ?auto_152766 ?auto_152770 ?auto_152765 ?auto_152767 )
      ( MAKE-2PILE ?auto_152763 ?auto_152764 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_152771 - BLOCK
      ?auto_152772 - BLOCK
    )
    :vars
    (
      ?auto_152776 - BLOCK
      ?auto_152773 - BLOCK
      ?auto_152774 - BLOCK
      ?auto_152775 - BLOCK
      ?auto_152777 - BLOCK
      ?auto_152778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152776 ?auto_152772 ) ( ON-TABLE ?auto_152771 ) ( ON ?auto_152772 ?auto_152771 ) ( not ( = ?auto_152771 ?auto_152772 ) ) ( not ( = ?auto_152771 ?auto_152776 ) ) ( not ( = ?auto_152772 ?auto_152776 ) ) ( not ( = ?auto_152771 ?auto_152773 ) ) ( not ( = ?auto_152771 ?auto_152774 ) ) ( not ( = ?auto_152772 ?auto_152773 ) ) ( not ( = ?auto_152772 ?auto_152774 ) ) ( not ( = ?auto_152776 ?auto_152773 ) ) ( not ( = ?auto_152776 ?auto_152774 ) ) ( not ( = ?auto_152773 ?auto_152774 ) ) ( ON ?auto_152773 ?auto_152776 ) ( not ( = ?auto_152775 ?auto_152777 ) ) ( not ( = ?auto_152775 ?auto_152778 ) ) ( not ( = ?auto_152775 ?auto_152774 ) ) ( not ( = ?auto_152777 ?auto_152778 ) ) ( not ( = ?auto_152777 ?auto_152774 ) ) ( not ( = ?auto_152778 ?auto_152774 ) ) ( not ( = ?auto_152771 ?auto_152778 ) ) ( not ( = ?auto_152771 ?auto_152775 ) ) ( not ( = ?auto_152771 ?auto_152777 ) ) ( not ( = ?auto_152772 ?auto_152778 ) ) ( not ( = ?auto_152772 ?auto_152775 ) ) ( not ( = ?auto_152772 ?auto_152777 ) ) ( not ( = ?auto_152776 ?auto_152778 ) ) ( not ( = ?auto_152776 ?auto_152775 ) ) ( not ( = ?auto_152776 ?auto_152777 ) ) ( not ( = ?auto_152773 ?auto_152778 ) ) ( not ( = ?auto_152773 ?auto_152775 ) ) ( not ( = ?auto_152773 ?auto_152777 ) ) ( ON ?auto_152774 ?auto_152773 ) ( ON ?auto_152778 ?auto_152774 ) ( ON ?auto_152777 ?auto_152778 ) ( CLEAR ?auto_152777 ) ( HOLDING ?auto_152775 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_152775 )
      ( MAKE-2PILE ?auto_152771 ?auto_152772 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_152779 - BLOCK
      ?auto_152780 - BLOCK
    )
    :vars
    (
      ?auto_152781 - BLOCK
      ?auto_152782 - BLOCK
      ?auto_152785 - BLOCK
      ?auto_152784 - BLOCK
      ?auto_152786 - BLOCK
      ?auto_152783 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152781 ?auto_152780 ) ( ON-TABLE ?auto_152779 ) ( ON ?auto_152780 ?auto_152779 ) ( not ( = ?auto_152779 ?auto_152780 ) ) ( not ( = ?auto_152779 ?auto_152781 ) ) ( not ( = ?auto_152780 ?auto_152781 ) ) ( not ( = ?auto_152779 ?auto_152782 ) ) ( not ( = ?auto_152779 ?auto_152785 ) ) ( not ( = ?auto_152780 ?auto_152782 ) ) ( not ( = ?auto_152780 ?auto_152785 ) ) ( not ( = ?auto_152781 ?auto_152782 ) ) ( not ( = ?auto_152781 ?auto_152785 ) ) ( not ( = ?auto_152782 ?auto_152785 ) ) ( ON ?auto_152782 ?auto_152781 ) ( not ( = ?auto_152784 ?auto_152786 ) ) ( not ( = ?auto_152784 ?auto_152783 ) ) ( not ( = ?auto_152784 ?auto_152785 ) ) ( not ( = ?auto_152786 ?auto_152783 ) ) ( not ( = ?auto_152786 ?auto_152785 ) ) ( not ( = ?auto_152783 ?auto_152785 ) ) ( not ( = ?auto_152779 ?auto_152783 ) ) ( not ( = ?auto_152779 ?auto_152784 ) ) ( not ( = ?auto_152779 ?auto_152786 ) ) ( not ( = ?auto_152780 ?auto_152783 ) ) ( not ( = ?auto_152780 ?auto_152784 ) ) ( not ( = ?auto_152780 ?auto_152786 ) ) ( not ( = ?auto_152781 ?auto_152783 ) ) ( not ( = ?auto_152781 ?auto_152784 ) ) ( not ( = ?auto_152781 ?auto_152786 ) ) ( not ( = ?auto_152782 ?auto_152783 ) ) ( not ( = ?auto_152782 ?auto_152784 ) ) ( not ( = ?auto_152782 ?auto_152786 ) ) ( ON ?auto_152785 ?auto_152782 ) ( ON ?auto_152783 ?auto_152785 ) ( ON ?auto_152786 ?auto_152783 ) ( ON ?auto_152784 ?auto_152786 ) ( CLEAR ?auto_152784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_152779 ?auto_152780 ?auto_152781 ?auto_152782 ?auto_152785 ?auto_152783 ?auto_152786 )
      ( MAKE-2PILE ?auto_152779 ?auto_152780 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_152787 - BLOCK
      ?auto_152788 - BLOCK
    )
    :vars
    (
      ?auto_152791 - BLOCK
      ?auto_152794 - BLOCK
      ?auto_152790 - BLOCK
      ?auto_152792 - BLOCK
      ?auto_152793 - BLOCK
      ?auto_152789 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152791 ?auto_152788 ) ( ON-TABLE ?auto_152787 ) ( ON ?auto_152788 ?auto_152787 ) ( not ( = ?auto_152787 ?auto_152788 ) ) ( not ( = ?auto_152787 ?auto_152791 ) ) ( not ( = ?auto_152788 ?auto_152791 ) ) ( not ( = ?auto_152787 ?auto_152794 ) ) ( not ( = ?auto_152787 ?auto_152790 ) ) ( not ( = ?auto_152788 ?auto_152794 ) ) ( not ( = ?auto_152788 ?auto_152790 ) ) ( not ( = ?auto_152791 ?auto_152794 ) ) ( not ( = ?auto_152791 ?auto_152790 ) ) ( not ( = ?auto_152794 ?auto_152790 ) ) ( ON ?auto_152794 ?auto_152791 ) ( not ( = ?auto_152792 ?auto_152793 ) ) ( not ( = ?auto_152792 ?auto_152789 ) ) ( not ( = ?auto_152792 ?auto_152790 ) ) ( not ( = ?auto_152793 ?auto_152789 ) ) ( not ( = ?auto_152793 ?auto_152790 ) ) ( not ( = ?auto_152789 ?auto_152790 ) ) ( not ( = ?auto_152787 ?auto_152789 ) ) ( not ( = ?auto_152787 ?auto_152792 ) ) ( not ( = ?auto_152787 ?auto_152793 ) ) ( not ( = ?auto_152788 ?auto_152789 ) ) ( not ( = ?auto_152788 ?auto_152792 ) ) ( not ( = ?auto_152788 ?auto_152793 ) ) ( not ( = ?auto_152791 ?auto_152789 ) ) ( not ( = ?auto_152791 ?auto_152792 ) ) ( not ( = ?auto_152791 ?auto_152793 ) ) ( not ( = ?auto_152794 ?auto_152789 ) ) ( not ( = ?auto_152794 ?auto_152792 ) ) ( not ( = ?auto_152794 ?auto_152793 ) ) ( ON ?auto_152790 ?auto_152794 ) ( ON ?auto_152789 ?auto_152790 ) ( ON ?auto_152793 ?auto_152789 ) ( HOLDING ?auto_152792 ) ( CLEAR ?auto_152793 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_152787 ?auto_152788 ?auto_152791 ?auto_152794 ?auto_152790 ?auto_152789 ?auto_152793 ?auto_152792 )
      ( MAKE-2PILE ?auto_152787 ?auto_152788 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_152795 - BLOCK
      ?auto_152796 - BLOCK
    )
    :vars
    (
      ?auto_152800 - BLOCK
      ?auto_152802 - BLOCK
      ?auto_152798 - BLOCK
      ?auto_152801 - BLOCK
      ?auto_152797 - BLOCK
      ?auto_152799 - BLOCK
      ?auto_152803 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152800 ?auto_152796 ) ( ON-TABLE ?auto_152795 ) ( ON ?auto_152796 ?auto_152795 ) ( not ( = ?auto_152795 ?auto_152796 ) ) ( not ( = ?auto_152795 ?auto_152800 ) ) ( not ( = ?auto_152796 ?auto_152800 ) ) ( not ( = ?auto_152795 ?auto_152802 ) ) ( not ( = ?auto_152795 ?auto_152798 ) ) ( not ( = ?auto_152796 ?auto_152802 ) ) ( not ( = ?auto_152796 ?auto_152798 ) ) ( not ( = ?auto_152800 ?auto_152802 ) ) ( not ( = ?auto_152800 ?auto_152798 ) ) ( not ( = ?auto_152802 ?auto_152798 ) ) ( ON ?auto_152802 ?auto_152800 ) ( not ( = ?auto_152801 ?auto_152797 ) ) ( not ( = ?auto_152801 ?auto_152799 ) ) ( not ( = ?auto_152801 ?auto_152798 ) ) ( not ( = ?auto_152797 ?auto_152799 ) ) ( not ( = ?auto_152797 ?auto_152798 ) ) ( not ( = ?auto_152799 ?auto_152798 ) ) ( not ( = ?auto_152795 ?auto_152799 ) ) ( not ( = ?auto_152795 ?auto_152801 ) ) ( not ( = ?auto_152795 ?auto_152797 ) ) ( not ( = ?auto_152796 ?auto_152799 ) ) ( not ( = ?auto_152796 ?auto_152801 ) ) ( not ( = ?auto_152796 ?auto_152797 ) ) ( not ( = ?auto_152800 ?auto_152799 ) ) ( not ( = ?auto_152800 ?auto_152801 ) ) ( not ( = ?auto_152800 ?auto_152797 ) ) ( not ( = ?auto_152802 ?auto_152799 ) ) ( not ( = ?auto_152802 ?auto_152801 ) ) ( not ( = ?auto_152802 ?auto_152797 ) ) ( ON ?auto_152798 ?auto_152802 ) ( ON ?auto_152799 ?auto_152798 ) ( ON ?auto_152797 ?auto_152799 ) ( CLEAR ?auto_152797 ) ( ON ?auto_152801 ?auto_152803 ) ( CLEAR ?auto_152801 ) ( HAND-EMPTY ) ( not ( = ?auto_152795 ?auto_152803 ) ) ( not ( = ?auto_152796 ?auto_152803 ) ) ( not ( = ?auto_152800 ?auto_152803 ) ) ( not ( = ?auto_152802 ?auto_152803 ) ) ( not ( = ?auto_152798 ?auto_152803 ) ) ( not ( = ?auto_152801 ?auto_152803 ) ) ( not ( = ?auto_152797 ?auto_152803 ) ) ( not ( = ?auto_152799 ?auto_152803 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_152801 ?auto_152803 )
      ( MAKE-2PILE ?auto_152795 ?auto_152796 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_152804 - BLOCK
      ?auto_152805 - BLOCK
    )
    :vars
    (
      ?auto_152806 - BLOCK
      ?auto_152807 - BLOCK
      ?auto_152810 - BLOCK
      ?auto_152809 - BLOCK
      ?auto_152808 - BLOCK
      ?auto_152812 - BLOCK
      ?auto_152811 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152806 ?auto_152805 ) ( ON-TABLE ?auto_152804 ) ( ON ?auto_152805 ?auto_152804 ) ( not ( = ?auto_152804 ?auto_152805 ) ) ( not ( = ?auto_152804 ?auto_152806 ) ) ( not ( = ?auto_152805 ?auto_152806 ) ) ( not ( = ?auto_152804 ?auto_152807 ) ) ( not ( = ?auto_152804 ?auto_152810 ) ) ( not ( = ?auto_152805 ?auto_152807 ) ) ( not ( = ?auto_152805 ?auto_152810 ) ) ( not ( = ?auto_152806 ?auto_152807 ) ) ( not ( = ?auto_152806 ?auto_152810 ) ) ( not ( = ?auto_152807 ?auto_152810 ) ) ( ON ?auto_152807 ?auto_152806 ) ( not ( = ?auto_152809 ?auto_152808 ) ) ( not ( = ?auto_152809 ?auto_152812 ) ) ( not ( = ?auto_152809 ?auto_152810 ) ) ( not ( = ?auto_152808 ?auto_152812 ) ) ( not ( = ?auto_152808 ?auto_152810 ) ) ( not ( = ?auto_152812 ?auto_152810 ) ) ( not ( = ?auto_152804 ?auto_152812 ) ) ( not ( = ?auto_152804 ?auto_152809 ) ) ( not ( = ?auto_152804 ?auto_152808 ) ) ( not ( = ?auto_152805 ?auto_152812 ) ) ( not ( = ?auto_152805 ?auto_152809 ) ) ( not ( = ?auto_152805 ?auto_152808 ) ) ( not ( = ?auto_152806 ?auto_152812 ) ) ( not ( = ?auto_152806 ?auto_152809 ) ) ( not ( = ?auto_152806 ?auto_152808 ) ) ( not ( = ?auto_152807 ?auto_152812 ) ) ( not ( = ?auto_152807 ?auto_152809 ) ) ( not ( = ?auto_152807 ?auto_152808 ) ) ( ON ?auto_152810 ?auto_152807 ) ( ON ?auto_152812 ?auto_152810 ) ( ON ?auto_152809 ?auto_152811 ) ( CLEAR ?auto_152809 ) ( not ( = ?auto_152804 ?auto_152811 ) ) ( not ( = ?auto_152805 ?auto_152811 ) ) ( not ( = ?auto_152806 ?auto_152811 ) ) ( not ( = ?auto_152807 ?auto_152811 ) ) ( not ( = ?auto_152810 ?auto_152811 ) ) ( not ( = ?auto_152809 ?auto_152811 ) ) ( not ( = ?auto_152808 ?auto_152811 ) ) ( not ( = ?auto_152812 ?auto_152811 ) ) ( HOLDING ?auto_152808 ) ( CLEAR ?auto_152812 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_152804 ?auto_152805 ?auto_152806 ?auto_152807 ?auto_152810 ?auto_152812 ?auto_152808 )
      ( MAKE-2PILE ?auto_152804 ?auto_152805 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_152813 - BLOCK
      ?auto_152814 - BLOCK
    )
    :vars
    (
      ?auto_152820 - BLOCK
      ?auto_152815 - BLOCK
      ?auto_152819 - BLOCK
      ?auto_152818 - BLOCK
      ?auto_152821 - BLOCK
      ?auto_152816 - BLOCK
      ?auto_152817 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152820 ?auto_152814 ) ( ON-TABLE ?auto_152813 ) ( ON ?auto_152814 ?auto_152813 ) ( not ( = ?auto_152813 ?auto_152814 ) ) ( not ( = ?auto_152813 ?auto_152820 ) ) ( not ( = ?auto_152814 ?auto_152820 ) ) ( not ( = ?auto_152813 ?auto_152815 ) ) ( not ( = ?auto_152813 ?auto_152819 ) ) ( not ( = ?auto_152814 ?auto_152815 ) ) ( not ( = ?auto_152814 ?auto_152819 ) ) ( not ( = ?auto_152820 ?auto_152815 ) ) ( not ( = ?auto_152820 ?auto_152819 ) ) ( not ( = ?auto_152815 ?auto_152819 ) ) ( ON ?auto_152815 ?auto_152820 ) ( not ( = ?auto_152818 ?auto_152821 ) ) ( not ( = ?auto_152818 ?auto_152816 ) ) ( not ( = ?auto_152818 ?auto_152819 ) ) ( not ( = ?auto_152821 ?auto_152816 ) ) ( not ( = ?auto_152821 ?auto_152819 ) ) ( not ( = ?auto_152816 ?auto_152819 ) ) ( not ( = ?auto_152813 ?auto_152816 ) ) ( not ( = ?auto_152813 ?auto_152818 ) ) ( not ( = ?auto_152813 ?auto_152821 ) ) ( not ( = ?auto_152814 ?auto_152816 ) ) ( not ( = ?auto_152814 ?auto_152818 ) ) ( not ( = ?auto_152814 ?auto_152821 ) ) ( not ( = ?auto_152820 ?auto_152816 ) ) ( not ( = ?auto_152820 ?auto_152818 ) ) ( not ( = ?auto_152820 ?auto_152821 ) ) ( not ( = ?auto_152815 ?auto_152816 ) ) ( not ( = ?auto_152815 ?auto_152818 ) ) ( not ( = ?auto_152815 ?auto_152821 ) ) ( ON ?auto_152819 ?auto_152815 ) ( ON ?auto_152816 ?auto_152819 ) ( ON ?auto_152818 ?auto_152817 ) ( not ( = ?auto_152813 ?auto_152817 ) ) ( not ( = ?auto_152814 ?auto_152817 ) ) ( not ( = ?auto_152820 ?auto_152817 ) ) ( not ( = ?auto_152815 ?auto_152817 ) ) ( not ( = ?auto_152819 ?auto_152817 ) ) ( not ( = ?auto_152818 ?auto_152817 ) ) ( not ( = ?auto_152821 ?auto_152817 ) ) ( not ( = ?auto_152816 ?auto_152817 ) ) ( CLEAR ?auto_152816 ) ( ON ?auto_152821 ?auto_152818 ) ( CLEAR ?auto_152821 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_152817 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_152817 ?auto_152818 )
      ( MAKE-2PILE ?auto_152813 ?auto_152814 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_152822 - BLOCK
      ?auto_152823 - BLOCK
    )
    :vars
    (
      ?auto_152828 - BLOCK
      ?auto_152824 - BLOCK
      ?auto_152827 - BLOCK
      ?auto_152830 - BLOCK
      ?auto_152826 - BLOCK
      ?auto_152829 - BLOCK
      ?auto_152825 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152828 ?auto_152823 ) ( ON-TABLE ?auto_152822 ) ( ON ?auto_152823 ?auto_152822 ) ( not ( = ?auto_152822 ?auto_152823 ) ) ( not ( = ?auto_152822 ?auto_152828 ) ) ( not ( = ?auto_152823 ?auto_152828 ) ) ( not ( = ?auto_152822 ?auto_152824 ) ) ( not ( = ?auto_152822 ?auto_152827 ) ) ( not ( = ?auto_152823 ?auto_152824 ) ) ( not ( = ?auto_152823 ?auto_152827 ) ) ( not ( = ?auto_152828 ?auto_152824 ) ) ( not ( = ?auto_152828 ?auto_152827 ) ) ( not ( = ?auto_152824 ?auto_152827 ) ) ( ON ?auto_152824 ?auto_152828 ) ( not ( = ?auto_152830 ?auto_152826 ) ) ( not ( = ?auto_152830 ?auto_152829 ) ) ( not ( = ?auto_152830 ?auto_152827 ) ) ( not ( = ?auto_152826 ?auto_152829 ) ) ( not ( = ?auto_152826 ?auto_152827 ) ) ( not ( = ?auto_152829 ?auto_152827 ) ) ( not ( = ?auto_152822 ?auto_152829 ) ) ( not ( = ?auto_152822 ?auto_152830 ) ) ( not ( = ?auto_152822 ?auto_152826 ) ) ( not ( = ?auto_152823 ?auto_152829 ) ) ( not ( = ?auto_152823 ?auto_152830 ) ) ( not ( = ?auto_152823 ?auto_152826 ) ) ( not ( = ?auto_152828 ?auto_152829 ) ) ( not ( = ?auto_152828 ?auto_152830 ) ) ( not ( = ?auto_152828 ?auto_152826 ) ) ( not ( = ?auto_152824 ?auto_152829 ) ) ( not ( = ?auto_152824 ?auto_152830 ) ) ( not ( = ?auto_152824 ?auto_152826 ) ) ( ON ?auto_152827 ?auto_152824 ) ( ON ?auto_152830 ?auto_152825 ) ( not ( = ?auto_152822 ?auto_152825 ) ) ( not ( = ?auto_152823 ?auto_152825 ) ) ( not ( = ?auto_152828 ?auto_152825 ) ) ( not ( = ?auto_152824 ?auto_152825 ) ) ( not ( = ?auto_152827 ?auto_152825 ) ) ( not ( = ?auto_152830 ?auto_152825 ) ) ( not ( = ?auto_152826 ?auto_152825 ) ) ( not ( = ?auto_152829 ?auto_152825 ) ) ( ON ?auto_152826 ?auto_152830 ) ( CLEAR ?auto_152826 ) ( ON-TABLE ?auto_152825 ) ( HOLDING ?auto_152829 ) ( CLEAR ?auto_152827 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_152822 ?auto_152823 ?auto_152828 ?auto_152824 ?auto_152827 ?auto_152829 )
      ( MAKE-2PILE ?auto_152822 ?auto_152823 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_152831 - BLOCK
      ?auto_152832 - BLOCK
    )
    :vars
    (
      ?auto_152833 - BLOCK
      ?auto_152835 - BLOCK
      ?auto_152836 - BLOCK
      ?auto_152834 - BLOCK
      ?auto_152838 - BLOCK
      ?auto_152839 - BLOCK
      ?auto_152837 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152833 ?auto_152832 ) ( ON-TABLE ?auto_152831 ) ( ON ?auto_152832 ?auto_152831 ) ( not ( = ?auto_152831 ?auto_152832 ) ) ( not ( = ?auto_152831 ?auto_152833 ) ) ( not ( = ?auto_152832 ?auto_152833 ) ) ( not ( = ?auto_152831 ?auto_152835 ) ) ( not ( = ?auto_152831 ?auto_152836 ) ) ( not ( = ?auto_152832 ?auto_152835 ) ) ( not ( = ?auto_152832 ?auto_152836 ) ) ( not ( = ?auto_152833 ?auto_152835 ) ) ( not ( = ?auto_152833 ?auto_152836 ) ) ( not ( = ?auto_152835 ?auto_152836 ) ) ( ON ?auto_152835 ?auto_152833 ) ( not ( = ?auto_152834 ?auto_152838 ) ) ( not ( = ?auto_152834 ?auto_152839 ) ) ( not ( = ?auto_152834 ?auto_152836 ) ) ( not ( = ?auto_152838 ?auto_152839 ) ) ( not ( = ?auto_152838 ?auto_152836 ) ) ( not ( = ?auto_152839 ?auto_152836 ) ) ( not ( = ?auto_152831 ?auto_152839 ) ) ( not ( = ?auto_152831 ?auto_152834 ) ) ( not ( = ?auto_152831 ?auto_152838 ) ) ( not ( = ?auto_152832 ?auto_152839 ) ) ( not ( = ?auto_152832 ?auto_152834 ) ) ( not ( = ?auto_152832 ?auto_152838 ) ) ( not ( = ?auto_152833 ?auto_152839 ) ) ( not ( = ?auto_152833 ?auto_152834 ) ) ( not ( = ?auto_152833 ?auto_152838 ) ) ( not ( = ?auto_152835 ?auto_152839 ) ) ( not ( = ?auto_152835 ?auto_152834 ) ) ( not ( = ?auto_152835 ?auto_152838 ) ) ( ON ?auto_152836 ?auto_152835 ) ( ON ?auto_152834 ?auto_152837 ) ( not ( = ?auto_152831 ?auto_152837 ) ) ( not ( = ?auto_152832 ?auto_152837 ) ) ( not ( = ?auto_152833 ?auto_152837 ) ) ( not ( = ?auto_152835 ?auto_152837 ) ) ( not ( = ?auto_152836 ?auto_152837 ) ) ( not ( = ?auto_152834 ?auto_152837 ) ) ( not ( = ?auto_152838 ?auto_152837 ) ) ( not ( = ?auto_152839 ?auto_152837 ) ) ( ON ?auto_152838 ?auto_152834 ) ( ON-TABLE ?auto_152837 ) ( CLEAR ?auto_152836 ) ( ON ?auto_152839 ?auto_152838 ) ( CLEAR ?auto_152839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_152837 ?auto_152834 ?auto_152838 )
      ( MAKE-2PILE ?auto_152831 ?auto_152832 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_152840 - BLOCK
      ?auto_152841 - BLOCK
    )
    :vars
    (
      ?auto_152843 - BLOCK
      ?auto_152846 - BLOCK
      ?auto_152844 - BLOCK
      ?auto_152847 - BLOCK
      ?auto_152848 - BLOCK
      ?auto_152845 - BLOCK
      ?auto_152842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152843 ?auto_152841 ) ( ON-TABLE ?auto_152840 ) ( ON ?auto_152841 ?auto_152840 ) ( not ( = ?auto_152840 ?auto_152841 ) ) ( not ( = ?auto_152840 ?auto_152843 ) ) ( not ( = ?auto_152841 ?auto_152843 ) ) ( not ( = ?auto_152840 ?auto_152846 ) ) ( not ( = ?auto_152840 ?auto_152844 ) ) ( not ( = ?auto_152841 ?auto_152846 ) ) ( not ( = ?auto_152841 ?auto_152844 ) ) ( not ( = ?auto_152843 ?auto_152846 ) ) ( not ( = ?auto_152843 ?auto_152844 ) ) ( not ( = ?auto_152846 ?auto_152844 ) ) ( ON ?auto_152846 ?auto_152843 ) ( not ( = ?auto_152847 ?auto_152848 ) ) ( not ( = ?auto_152847 ?auto_152845 ) ) ( not ( = ?auto_152847 ?auto_152844 ) ) ( not ( = ?auto_152848 ?auto_152845 ) ) ( not ( = ?auto_152848 ?auto_152844 ) ) ( not ( = ?auto_152845 ?auto_152844 ) ) ( not ( = ?auto_152840 ?auto_152845 ) ) ( not ( = ?auto_152840 ?auto_152847 ) ) ( not ( = ?auto_152840 ?auto_152848 ) ) ( not ( = ?auto_152841 ?auto_152845 ) ) ( not ( = ?auto_152841 ?auto_152847 ) ) ( not ( = ?auto_152841 ?auto_152848 ) ) ( not ( = ?auto_152843 ?auto_152845 ) ) ( not ( = ?auto_152843 ?auto_152847 ) ) ( not ( = ?auto_152843 ?auto_152848 ) ) ( not ( = ?auto_152846 ?auto_152845 ) ) ( not ( = ?auto_152846 ?auto_152847 ) ) ( not ( = ?auto_152846 ?auto_152848 ) ) ( ON ?auto_152847 ?auto_152842 ) ( not ( = ?auto_152840 ?auto_152842 ) ) ( not ( = ?auto_152841 ?auto_152842 ) ) ( not ( = ?auto_152843 ?auto_152842 ) ) ( not ( = ?auto_152846 ?auto_152842 ) ) ( not ( = ?auto_152844 ?auto_152842 ) ) ( not ( = ?auto_152847 ?auto_152842 ) ) ( not ( = ?auto_152848 ?auto_152842 ) ) ( not ( = ?auto_152845 ?auto_152842 ) ) ( ON ?auto_152848 ?auto_152847 ) ( ON-TABLE ?auto_152842 ) ( ON ?auto_152845 ?auto_152848 ) ( CLEAR ?auto_152845 ) ( HOLDING ?auto_152844 ) ( CLEAR ?auto_152846 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_152840 ?auto_152841 ?auto_152843 ?auto_152846 ?auto_152844 )
      ( MAKE-2PILE ?auto_152840 ?auto_152841 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_152849 - BLOCK
      ?auto_152850 - BLOCK
    )
    :vars
    (
      ?auto_152851 - BLOCK
      ?auto_152857 - BLOCK
      ?auto_152852 - BLOCK
      ?auto_152856 - BLOCK
      ?auto_152855 - BLOCK
      ?auto_152853 - BLOCK
      ?auto_152854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152851 ?auto_152850 ) ( ON-TABLE ?auto_152849 ) ( ON ?auto_152850 ?auto_152849 ) ( not ( = ?auto_152849 ?auto_152850 ) ) ( not ( = ?auto_152849 ?auto_152851 ) ) ( not ( = ?auto_152850 ?auto_152851 ) ) ( not ( = ?auto_152849 ?auto_152857 ) ) ( not ( = ?auto_152849 ?auto_152852 ) ) ( not ( = ?auto_152850 ?auto_152857 ) ) ( not ( = ?auto_152850 ?auto_152852 ) ) ( not ( = ?auto_152851 ?auto_152857 ) ) ( not ( = ?auto_152851 ?auto_152852 ) ) ( not ( = ?auto_152857 ?auto_152852 ) ) ( ON ?auto_152857 ?auto_152851 ) ( not ( = ?auto_152856 ?auto_152855 ) ) ( not ( = ?auto_152856 ?auto_152853 ) ) ( not ( = ?auto_152856 ?auto_152852 ) ) ( not ( = ?auto_152855 ?auto_152853 ) ) ( not ( = ?auto_152855 ?auto_152852 ) ) ( not ( = ?auto_152853 ?auto_152852 ) ) ( not ( = ?auto_152849 ?auto_152853 ) ) ( not ( = ?auto_152849 ?auto_152856 ) ) ( not ( = ?auto_152849 ?auto_152855 ) ) ( not ( = ?auto_152850 ?auto_152853 ) ) ( not ( = ?auto_152850 ?auto_152856 ) ) ( not ( = ?auto_152850 ?auto_152855 ) ) ( not ( = ?auto_152851 ?auto_152853 ) ) ( not ( = ?auto_152851 ?auto_152856 ) ) ( not ( = ?auto_152851 ?auto_152855 ) ) ( not ( = ?auto_152857 ?auto_152853 ) ) ( not ( = ?auto_152857 ?auto_152856 ) ) ( not ( = ?auto_152857 ?auto_152855 ) ) ( ON ?auto_152856 ?auto_152854 ) ( not ( = ?auto_152849 ?auto_152854 ) ) ( not ( = ?auto_152850 ?auto_152854 ) ) ( not ( = ?auto_152851 ?auto_152854 ) ) ( not ( = ?auto_152857 ?auto_152854 ) ) ( not ( = ?auto_152852 ?auto_152854 ) ) ( not ( = ?auto_152856 ?auto_152854 ) ) ( not ( = ?auto_152855 ?auto_152854 ) ) ( not ( = ?auto_152853 ?auto_152854 ) ) ( ON ?auto_152855 ?auto_152856 ) ( ON-TABLE ?auto_152854 ) ( ON ?auto_152853 ?auto_152855 ) ( CLEAR ?auto_152857 ) ( ON ?auto_152852 ?auto_152853 ) ( CLEAR ?auto_152852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_152854 ?auto_152856 ?auto_152855 ?auto_152853 )
      ( MAKE-2PILE ?auto_152849 ?auto_152850 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_152858 - BLOCK
      ?auto_152859 - BLOCK
    )
    :vars
    (
      ?auto_152861 - BLOCK
      ?auto_152863 - BLOCK
      ?auto_152862 - BLOCK
      ?auto_152866 - BLOCK
      ?auto_152864 - BLOCK
      ?auto_152860 - BLOCK
      ?auto_152865 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152861 ?auto_152859 ) ( ON-TABLE ?auto_152858 ) ( ON ?auto_152859 ?auto_152858 ) ( not ( = ?auto_152858 ?auto_152859 ) ) ( not ( = ?auto_152858 ?auto_152861 ) ) ( not ( = ?auto_152859 ?auto_152861 ) ) ( not ( = ?auto_152858 ?auto_152863 ) ) ( not ( = ?auto_152858 ?auto_152862 ) ) ( not ( = ?auto_152859 ?auto_152863 ) ) ( not ( = ?auto_152859 ?auto_152862 ) ) ( not ( = ?auto_152861 ?auto_152863 ) ) ( not ( = ?auto_152861 ?auto_152862 ) ) ( not ( = ?auto_152863 ?auto_152862 ) ) ( not ( = ?auto_152866 ?auto_152864 ) ) ( not ( = ?auto_152866 ?auto_152860 ) ) ( not ( = ?auto_152866 ?auto_152862 ) ) ( not ( = ?auto_152864 ?auto_152860 ) ) ( not ( = ?auto_152864 ?auto_152862 ) ) ( not ( = ?auto_152860 ?auto_152862 ) ) ( not ( = ?auto_152858 ?auto_152860 ) ) ( not ( = ?auto_152858 ?auto_152866 ) ) ( not ( = ?auto_152858 ?auto_152864 ) ) ( not ( = ?auto_152859 ?auto_152860 ) ) ( not ( = ?auto_152859 ?auto_152866 ) ) ( not ( = ?auto_152859 ?auto_152864 ) ) ( not ( = ?auto_152861 ?auto_152860 ) ) ( not ( = ?auto_152861 ?auto_152866 ) ) ( not ( = ?auto_152861 ?auto_152864 ) ) ( not ( = ?auto_152863 ?auto_152860 ) ) ( not ( = ?auto_152863 ?auto_152866 ) ) ( not ( = ?auto_152863 ?auto_152864 ) ) ( ON ?auto_152866 ?auto_152865 ) ( not ( = ?auto_152858 ?auto_152865 ) ) ( not ( = ?auto_152859 ?auto_152865 ) ) ( not ( = ?auto_152861 ?auto_152865 ) ) ( not ( = ?auto_152863 ?auto_152865 ) ) ( not ( = ?auto_152862 ?auto_152865 ) ) ( not ( = ?auto_152866 ?auto_152865 ) ) ( not ( = ?auto_152864 ?auto_152865 ) ) ( not ( = ?auto_152860 ?auto_152865 ) ) ( ON ?auto_152864 ?auto_152866 ) ( ON-TABLE ?auto_152865 ) ( ON ?auto_152860 ?auto_152864 ) ( ON ?auto_152862 ?auto_152860 ) ( CLEAR ?auto_152862 ) ( HOLDING ?auto_152863 ) ( CLEAR ?auto_152861 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_152858 ?auto_152859 ?auto_152861 ?auto_152863 )
      ( MAKE-2PILE ?auto_152858 ?auto_152859 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_152867 - BLOCK
      ?auto_152868 - BLOCK
    )
    :vars
    (
      ?auto_152871 - BLOCK
      ?auto_152875 - BLOCK
      ?auto_152873 - BLOCK
      ?auto_152870 - BLOCK
      ?auto_152869 - BLOCK
      ?auto_152874 - BLOCK
      ?auto_152872 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152871 ?auto_152868 ) ( ON-TABLE ?auto_152867 ) ( ON ?auto_152868 ?auto_152867 ) ( not ( = ?auto_152867 ?auto_152868 ) ) ( not ( = ?auto_152867 ?auto_152871 ) ) ( not ( = ?auto_152868 ?auto_152871 ) ) ( not ( = ?auto_152867 ?auto_152875 ) ) ( not ( = ?auto_152867 ?auto_152873 ) ) ( not ( = ?auto_152868 ?auto_152875 ) ) ( not ( = ?auto_152868 ?auto_152873 ) ) ( not ( = ?auto_152871 ?auto_152875 ) ) ( not ( = ?auto_152871 ?auto_152873 ) ) ( not ( = ?auto_152875 ?auto_152873 ) ) ( not ( = ?auto_152870 ?auto_152869 ) ) ( not ( = ?auto_152870 ?auto_152874 ) ) ( not ( = ?auto_152870 ?auto_152873 ) ) ( not ( = ?auto_152869 ?auto_152874 ) ) ( not ( = ?auto_152869 ?auto_152873 ) ) ( not ( = ?auto_152874 ?auto_152873 ) ) ( not ( = ?auto_152867 ?auto_152874 ) ) ( not ( = ?auto_152867 ?auto_152870 ) ) ( not ( = ?auto_152867 ?auto_152869 ) ) ( not ( = ?auto_152868 ?auto_152874 ) ) ( not ( = ?auto_152868 ?auto_152870 ) ) ( not ( = ?auto_152868 ?auto_152869 ) ) ( not ( = ?auto_152871 ?auto_152874 ) ) ( not ( = ?auto_152871 ?auto_152870 ) ) ( not ( = ?auto_152871 ?auto_152869 ) ) ( not ( = ?auto_152875 ?auto_152874 ) ) ( not ( = ?auto_152875 ?auto_152870 ) ) ( not ( = ?auto_152875 ?auto_152869 ) ) ( ON ?auto_152870 ?auto_152872 ) ( not ( = ?auto_152867 ?auto_152872 ) ) ( not ( = ?auto_152868 ?auto_152872 ) ) ( not ( = ?auto_152871 ?auto_152872 ) ) ( not ( = ?auto_152875 ?auto_152872 ) ) ( not ( = ?auto_152873 ?auto_152872 ) ) ( not ( = ?auto_152870 ?auto_152872 ) ) ( not ( = ?auto_152869 ?auto_152872 ) ) ( not ( = ?auto_152874 ?auto_152872 ) ) ( ON ?auto_152869 ?auto_152870 ) ( ON-TABLE ?auto_152872 ) ( ON ?auto_152874 ?auto_152869 ) ( ON ?auto_152873 ?auto_152874 ) ( CLEAR ?auto_152871 ) ( ON ?auto_152875 ?auto_152873 ) ( CLEAR ?auto_152875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_152872 ?auto_152870 ?auto_152869 ?auto_152874 ?auto_152873 )
      ( MAKE-2PILE ?auto_152867 ?auto_152868 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_152894 - BLOCK
      ?auto_152895 - BLOCK
    )
    :vars
    (
      ?auto_152902 - BLOCK
      ?auto_152899 - BLOCK
      ?auto_152896 - BLOCK
      ?auto_152900 - BLOCK
      ?auto_152897 - BLOCK
      ?auto_152901 - BLOCK
      ?auto_152898 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_152894 ) ( not ( = ?auto_152894 ?auto_152895 ) ) ( not ( = ?auto_152894 ?auto_152902 ) ) ( not ( = ?auto_152895 ?auto_152902 ) ) ( not ( = ?auto_152894 ?auto_152899 ) ) ( not ( = ?auto_152894 ?auto_152896 ) ) ( not ( = ?auto_152895 ?auto_152899 ) ) ( not ( = ?auto_152895 ?auto_152896 ) ) ( not ( = ?auto_152902 ?auto_152899 ) ) ( not ( = ?auto_152902 ?auto_152896 ) ) ( not ( = ?auto_152899 ?auto_152896 ) ) ( not ( = ?auto_152900 ?auto_152897 ) ) ( not ( = ?auto_152900 ?auto_152901 ) ) ( not ( = ?auto_152900 ?auto_152896 ) ) ( not ( = ?auto_152897 ?auto_152901 ) ) ( not ( = ?auto_152897 ?auto_152896 ) ) ( not ( = ?auto_152901 ?auto_152896 ) ) ( not ( = ?auto_152894 ?auto_152901 ) ) ( not ( = ?auto_152894 ?auto_152900 ) ) ( not ( = ?auto_152894 ?auto_152897 ) ) ( not ( = ?auto_152895 ?auto_152901 ) ) ( not ( = ?auto_152895 ?auto_152900 ) ) ( not ( = ?auto_152895 ?auto_152897 ) ) ( not ( = ?auto_152902 ?auto_152901 ) ) ( not ( = ?auto_152902 ?auto_152900 ) ) ( not ( = ?auto_152902 ?auto_152897 ) ) ( not ( = ?auto_152899 ?auto_152901 ) ) ( not ( = ?auto_152899 ?auto_152900 ) ) ( not ( = ?auto_152899 ?auto_152897 ) ) ( ON ?auto_152900 ?auto_152898 ) ( not ( = ?auto_152894 ?auto_152898 ) ) ( not ( = ?auto_152895 ?auto_152898 ) ) ( not ( = ?auto_152902 ?auto_152898 ) ) ( not ( = ?auto_152899 ?auto_152898 ) ) ( not ( = ?auto_152896 ?auto_152898 ) ) ( not ( = ?auto_152900 ?auto_152898 ) ) ( not ( = ?auto_152897 ?auto_152898 ) ) ( not ( = ?auto_152901 ?auto_152898 ) ) ( ON ?auto_152897 ?auto_152900 ) ( ON-TABLE ?auto_152898 ) ( ON ?auto_152901 ?auto_152897 ) ( ON ?auto_152896 ?auto_152901 ) ( ON ?auto_152899 ?auto_152896 ) ( ON ?auto_152902 ?auto_152899 ) ( CLEAR ?auto_152902 ) ( HOLDING ?auto_152895 ) ( CLEAR ?auto_152894 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_152894 ?auto_152895 ?auto_152902 )
      ( MAKE-2PILE ?auto_152894 ?auto_152895 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_152903 - BLOCK
      ?auto_152904 - BLOCK
    )
    :vars
    (
      ?auto_152908 - BLOCK
      ?auto_152911 - BLOCK
      ?auto_152907 - BLOCK
      ?auto_152910 - BLOCK
      ?auto_152905 - BLOCK
      ?auto_152906 - BLOCK
      ?auto_152909 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_152903 ) ( not ( = ?auto_152903 ?auto_152904 ) ) ( not ( = ?auto_152903 ?auto_152908 ) ) ( not ( = ?auto_152904 ?auto_152908 ) ) ( not ( = ?auto_152903 ?auto_152911 ) ) ( not ( = ?auto_152903 ?auto_152907 ) ) ( not ( = ?auto_152904 ?auto_152911 ) ) ( not ( = ?auto_152904 ?auto_152907 ) ) ( not ( = ?auto_152908 ?auto_152911 ) ) ( not ( = ?auto_152908 ?auto_152907 ) ) ( not ( = ?auto_152911 ?auto_152907 ) ) ( not ( = ?auto_152910 ?auto_152905 ) ) ( not ( = ?auto_152910 ?auto_152906 ) ) ( not ( = ?auto_152910 ?auto_152907 ) ) ( not ( = ?auto_152905 ?auto_152906 ) ) ( not ( = ?auto_152905 ?auto_152907 ) ) ( not ( = ?auto_152906 ?auto_152907 ) ) ( not ( = ?auto_152903 ?auto_152906 ) ) ( not ( = ?auto_152903 ?auto_152910 ) ) ( not ( = ?auto_152903 ?auto_152905 ) ) ( not ( = ?auto_152904 ?auto_152906 ) ) ( not ( = ?auto_152904 ?auto_152910 ) ) ( not ( = ?auto_152904 ?auto_152905 ) ) ( not ( = ?auto_152908 ?auto_152906 ) ) ( not ( = ?auto_152908 ?auto_152910 ) ) ( not ( = ?auto_152908 ?auto_152905 ) ) ( not ( = ?auto_152911 ?auto_152906 ) ) ( not ( = ?auto_152911 ?auto_152910 ) ) ( not ( = ?auto_152911 ?auto_152905 ) ) ( ON ?auto_152910 ?auto_152909 ) ( not ( = ?auto_152903 ?auto_152909 ) ) ( not ( = ?auto_152904 ?auto_152909 ) ) ( not ( = ?auto_152908 ?auto_152909 ) ) ( not ( = ?auto_152911 ?auto_152909 ) ) ( not ( = ?auto_152907 ?auto_152909 ) ) ( not ( = ?auto_152910 ?auto_152909 ) ) ( not ( = ?auto_152905 ?auto_152909 ) ) ( not ( = ?auto_152906 ?auto_152909 ) ) ( ON ?auto_152905 ?auto_152910 ) ( ON-TABLE ?auto_152909 ) ( ON ?auto_152906 ?auto_152905 ) ( ON ?auto_152907 ?auto_152906 ) ( ON ?auto_152911 ?auto_152907 ) ( ON ?auto_152908 ?auto_152911 ) ( CLEAR ?auto_152903 ) ( ON ?auto_152904 ?auto_152908 ) ( CLEAR ?auto_152904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_152909 ?auto_152910 ?auto_152905 ?auto_152906 ?auto_152907 ?auto_152911 ?auto_152908 )
      ( MAKE-2PILE ?auto_152903 ?auto_152904 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_152912 - BLOCK
      ?auto_152913 - BLOCK
    )
    :vars
    (
      ?auto_152915 - BLOCK
      ?auto_152916 - BLOCK
      ?auto_152919 - BLOCK
      ?auto_152918 - BLOCK
      ?auto_152917 - BLOCK
      ?auto_152920 - BLOCK
      ?auto_152914 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152912 ?auto_152913 ) ) ( not ( = ?auto_152912 ?auto_152915 ) ) ( not ( = ?auto_152913 ?auto_152915 ) ) ( not ( = ?auto_152912 ?auto_152916 ) ) ( not ( = ?auto_152912 ?auto_152919 ) ) ( not ( = ?auto_152913 ?auto_152916 ) ) ( not ( = ?auto_152913 ?auto_152919 ) ) ( not ( = ?auto_152915 ?auto_152916 ) ) ( not ( = ?auto_152915 ?auto_152919 ) ) ( not ( = ?auto_152916 ?auto_152919 ) ) ( not ( = ?auto_152918 ?auto_152917 ) ) ( not ( = ?auto_152918 ?auto_152920 ) ) ( not ( = ?auto_152918 ?auto_152919 ) ) ( not ( = ?auto_152917 ?auto_152920 ) ) ( not ( = ?auto_152917 ?auto_152919 ) ) ( not ( = ?auto_152920 ?auto_152919 ) ) ( not ( = ?auto_152912 ?auto_152920 ) ) ( not ( = ?auto_152912 ?auto_152918 ) ) ( not ( = ?auto_152912 ?auto_152917 ) ) ( not ( = ?auto_152913 ?auto_152920 ) ) ( not ( = ?auto_152913 ?auto_152918 ) ) ( not ( = ?auto_152913 ?auto_152917 ) ) ( not ( = ?auto_152915 ?auto_152920 ) ) ( not ( = ?auto_152915 ?auto_152918 ) ) ( not ( = ?auto_152915 ?auto_152917 ) ) ( not ( = ?auto_152916 ?auto_152920 ) ) ( not ( = ?auto_152916 ?auto_152918 ) ) ( not ( = ?auto_152916 ?auto_152917 ) ) ( ON ?auto_152918 ?auto_152914 ) ( not ( = ?auto_152912 ?auto_152914 ) ) ( not ( = ?auto_152913 ?auto_152914 ) ) ( not ( = ?auto_152915 ?auto_152914 ) ) ( not ( = ?auto_152916 ?auto_152914 ) ) ( not ( = ?auto_152919 ?auto_152914 ) ) ( not ( = ?auto_152918 ?auto_152914 ) ) ( not ( = ?auto_152917 ?auto_152914 ) ) ( not ( = ?auto_152920 ?auto_152914 ) ) ( ON ?auto_152917 ?auto_152918 ) ( ON-TABLE ?auto_152914 ) ( ON ?auto_152920 ?auto_152917 ) ( ON ?auto_152919 ?auto_152920 ) ( ON ?auto_152916 ?auto_152919 ) ( ON ?auto_152915 ?auto_152916 ) ( ON ?auto_152913 ?auto_152915 ) ( CLEAR ?auto_152913 ) ( HOLDING ?auto_152912 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_152912 )
      ( MAKE-2PILE ?auto_152912 ?auto_152913 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_152921 - BLOCK
      ?auto_152922 - BLOCK
    )
    :vars
    (
      ?auto_152924 - BLOCK
      ?auto_152927 - BLOCK
      ?auto_152929 - BLOCK
      ?auto_152928 - BLOCK
      ?auto_152925 - BLOCK
      ?auto_152923 - BLOCK
      ?auto_152926 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152921 ?auto_152922 ) ) ( not ( = ?auto_152921 ?auto_152924 ) ) ( not ( = ?auto_152922 ?auto_152924 ) ) ( not ( = ?auto_152921 ?auto_152927 ) ) ( not ( = ?auto_152921 ?auto_152929 ) ) ( not ( = ?auto_152922 ?auto_152927 ) ) ( not ( = ?auto_152922 ?auto_152929 ) ) ( not ( = ?auto_152924 ?auto_152927 ) ) ( not ( = ?auto_152924 ?auto_152929 ) ) ( not ( = ?auto_152927 ?auto_152929 ) ) ( not ( = ?auto_152928 ?auto_152925 ) ) ( not ( = ?auto_152928 ?auto_152923 ) ) ( not ( = ?auto_152928 ?auto_152929 ) ) ( not ( = ?auto_152925 ?auto_152923 ) ) ( not ( = ?auto_152925 ?auto_152929 ) ) ( not ( = ?auto_152923 ?auto_152929 ) ) ( not ( = ?auto_152921 ?auto_152923 ) ) ( not ( = ?auto_152921 ?auto_152928 ) ) ( not ( = ?auto_152921 ?auto_152925 ) ) ( not ( = ?auto_152922 ?auto_152923 ) ) ( not ( = ?auto_152922 ?auto_152928 ) ) ( not ( = ?auto_152922 ?auto_152925 ) ) ( not ( = ?auto_152924 ?auto_152923 ) ) ( not ( = ?auto_152924 ?auto_152928 ) ) ( not ( = ?auto_152924 ?auto_152925 ) ) ( not ( = ?auto_152927 ?auto_152923 ) ) ( not ( = ?auto_152927 ?auto_152928 ) ) ( not ( = ?auto_152927 ?auto_152925 ) ) ( ON ?auto_152928 ?auto_152926 ) ( not ( = ?auto_152921 ?auto_152926 ) ) ( not ( = ?auto_152922 ?auto_152926 ) ) ( not ( = ?auto_152924 ?auto_152926 ) ) ( not ( = ?auto_152927 ?auto_152926 ) ) ( not ( = ?auto_152929 ?auto_152926 ) ) ( not ( = ?auto_152928 ?auto_152926 ) ) ( not ( = ?auto_152925 ?auto_152926 ) ) ( not ( = ?auto_152923 ?auto_152926 ) ) ( ON ?auto_152925 ?auto_152928 ) ( ON-TABLE ?auto_152926 ) ( ON ?auto_152923 ?auto_152925 ) ( ON ?auto_152929 ?auto_152923 ) ( ON ?auto_152927 ?auto_152929 ) ( ON ?auto_152924 ?auto_152927 ) ( ON ?auto_152922 ?auto_152924 ) ( ON ?auto_152921 ?auto_152922 ) ( CLEAR ?auto_152921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_152926 ?auto_152928 ?auto_152925 ?auto_152923 ?auto_152929 ?auto_152927 ?auto_152924 ?auto_152922 )
      ( MAKE-2PILE ?auto_152921 ?auto_152922 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_152936 - BLOCK
      ?auto_152937 - BLOCK
      ?auto_152938 - BLOCK
      ?auto_152939 - BLOCK
      ?auto_152940 - BLOCK
      ?auto_152941 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_152941 ) ( CLEAR ?auto_152940 ) ( ON-TABLE ?auto_152936 ) ( ON ?auto_152937 ?auto_152936 ) ( ON ?auto_152938 ?auto_152937 ) ( ON ?auto_152939 ?auto_152938 ) ( ON ?auto_152940 ?auto_152939 ) ( not ( = ?auto_152936 ?auto_152937 ) ) ( not ( = ?auto_152936 ?auto_152938 ) ) ( not ( = ?auto_152936 ?auto_152939 ) ) ( not ( = ?auto_152936 ?auto_152940 ) ) ( not ( = ?auto_152936 ?auto_152941 ) ) ( not ( = ?auto_152937 ?auto_152938 ) ) ( not ( = ?auto_152937 ?auto_152939 ) ) ( not ( = ?auto_152937 ?auto_152940 ) ) ( not ( = ?auto_152937 ?auto_152941 ) ) ( not ( = ?auto_152938 ?auto_152939 ) ) ( not ( = ?auto_152938 ?auto_152940 ) ) ( not ( = ?auto_152938 ?auto_152941 ) ) ( not ( = ?auto_152939 ?auto_152940 ) ) ( not ( = ?auto_152939 ?auto_152941 ) ) ( not ( = ?auto_152940 ?auto_152941 ) ) )
    :subtasks
    ( ( !STACK ?auto_152941 ?auto_152940 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_152942 - BLOCK
      ?auto_152943 - BLOCK
      ?auto_152944 - BLOCK
      ?auto_152945 - BLOCK
      ?auto_152946 - BLOCK
      ?auto_152947 - BLOCK
    )
    :vars
    (
      ?auto_152948 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_152946 ) ( ON-TABLE ?auto_152942 ) ( ON ?auto_152943 ?auto_152942 ) ( ON ?auto_152944 ?auto_152943 ) ( ON ?auto_152945 ?auto_152944 ) ( ON ?auto_152946 ?auto_152945 ) ( not ( = ?auto_152942 ?auto_152943 ) ) ( not ( = ?auto_152942 ?auto_152944 ) ) ( not ( = ?auto_152942 ?auto_152945 ) ) ( not ( = ?auto_152942 ?auto_152946 ) ) ( not ( = ?auto_152942 ?auto_152947 ) ) ( not ( = ?auto_152943 ?auto_152944 ) ) ( not ( = ?auto_152943 ?auto_152945 ) ) ( not ( = ?auto_152943 ?auto_152946 ) ) ( not ( = ?auto_152943 ?auto_152947 ) ) ( not ( = ?auto_152944 ?auto_152945 ) ) ( not ( = ?auto_152944 ?auto_152946 ) ) ( not ( = ?auto_152944 ?auto_152947 ) ) ( not ( = ?auto_152945 ?auto_152946 ) ) ( not ( = ?auto_152945 ?auto_152947 ) ) ( not ( = ?auto_152946 ?auto_152947 ) ) ( ON ?auto_152947 ?auto_152948 ) ( CLEAR ?auto_152947 ) ( HAND-EMPTY ) ( not ( = ?auto_152942 ?auto_152948 ) ) ( not ( = ?auto_152943 ?auto_152948 ) ) ( not ( = ?auto_152944 ?auto_152948 ) ) ( not ( = ?auto_152945 ?auto_152948 ) ) ( not ( = ?auto_152946 ?auto_152948 ) ) ( not ( = ?auto_152947 ?auto_152948 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_152947 ?auto_152948 )
      ( MAKE-6PILE ?auto_152942 ?auto_152943 ?auto_152944 ?auto_152945 ?auto_152946 ?auto_152947 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_152949 - BLOCK
      ?auto_152950 - BLOCK
      ?auto_152951 - BLOCK
      ?auto_152952 - BLOCK
      ?auto_152953 - BLOCK
      ?auto_152954 - BLOCK
    )
    :vars
    (
      ?auto_152955 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_152949 ) ( ON ?auto_152950 ?auto_152949 ) ( ON ?auto_152951 ?auto_152950 ) ( ON ?auto_152952 ?auto_152951 ) ( not ( = ?auto_152949 ?auto_152950 ) ) ( not ( = ?auto_152949 ?auto_152951 ) ) ( not ( = ?auto_152949 ?auto_152952 ) ) ( not ( = ?auto_152949 ?auto_152953 ) ) ( not ( = ?auto_152949 ?auto_152954 ) ) ( not ( = ?auto_152950 ?auto_152951 ) ) ( not ( = ?auto_152950 ?auto_152952 ) ) ( not ( = ?auto_152950 ?auto_152953 ) ) ( not ( = ?auto_152950 ?auto_152954 ) ) ( not ( = ?auto_152951 ?auto_152952 ) ) ( not ( = ?auto_152951 ?auto_152953 ) ) ( not ( = ?auto_152951 ?auto_152954 ) ) ( not ( = ?auto_152952 ?auto_152953 ) ) ( not ( = ?auto_152952 ?auto_152954 ) ) ( not ( = ?auto_152953 ?auto_152954 ) ) ( ON ?auto_152954 ?auto_152955 ) ( CLEAR ?auto_152954 ) ( not ( = ?auto_152949 ?auto_152955 ) ) ( not ( = ?auto_152950 ?auto_152955 ) ) ( not ( = ?auto_152951 ?auto_152955 ) ) ( not ( = ?auto_152952 ?auto_152955 ) ) ( not ( = ?auto_152953 ?auto_152955 ) ) ( not ( = ?auto_152954 ?auto_152955 ) ) ( HOLDING ?auto_152953 ) ( CLEAR ?auto_152952 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_152949 ?auto_152950 ?auto_152951 ?auto_152952 ?auto_152953 )
      ( MAKE-6PILE ?auto_152949 ?auto_152950 ?auto_152951 ?auto_152952 ?auto_152953 ?auto_152954 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_152956 - BLOCK
      ?auto_152957 - BLOCK
      ?auto_152958 - BLOCK
      ?auto_152959 - BLOCK
      ?auto_152960 - BLOCK
      ?auto_152961 - BLOCK
    )
    :vars
    (
      ?auto_152962 - BLOCK
      ?auto_152963 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_152956 ) ( ON ?auto_152957 ?auto_152956 ) ( ON ?auto_152958 ?auto_152957 ) ( ON ?auto_152959 ?auto_152958 ) ( not ( = ?auto_152956 ?auto_152957 ) ) ( not ( = ?auto_152956 ?auto_152958 ) ) ( not ( = ?auto_152956 ?auto_152959 ) ) ( not ( = ?auto_152956 ?auto_152960 ) ) ( not ( = ?auto_152956 ?auto_152961 ) ) ( not ( = ?auto_152957 ?auto_152958 ) ) ( not ( = ?auto_152957 ?auto_152959 ) ) ( not ( = ?auto_152957 ?auto_152960 ) ) ( not ( = ?auto_152957 ?auto_152961 ) ) ( not ( = ?auto_152958 ?auto_152959 ) ) ( not ( = ?auto_152958 ?auto_152960 ) ) ( not ( = ?auto_152958 ?auto_152961 ) ) ( not ( = ?auto_152959 ?auto_152960 ) ) ( not ( = ?auto_152959 ?auto_152961 ) ) ( not ( = ?auto_152960 ?auto_152961 ) ) ( ON ?auto_152961 ?auto_152962 ) ( not ( = ?auto_152956 ?auto_152962 ) ) ( not ( = ?auto_152957 ?auto_152962 ) ) ( not ( = ?auto_152958 ?auto_152962 ) ) ( not ( = ?auto_152959 ?auto_152962 ) ) ( not ( = ?auto_152960 ?auto_152962 ) ) ( not ( = ?auto_152961 ?auto_152962 ) ) ( CLEAR ?auto_152959 ) ( ON ?auto_152960 ?auto_152961 ) ( CLEAR ?auto_152960 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_152963 ) ( ON ?auto_152962 ?auto_152963 ) ( not ( = ?auto_152963 ?auto_152962 ) ) ( not ( = ?auto_152963 ?auto_152961 ) ) ( not ( = ?auto_152963 ?auto_152960 ) ) ( not ( = ?auto_152956 ?auto_152963 ) ) ( not ( = ?auto_152957 ?auto_152963 ) ) ( not ( = ?auto_152958 ?auto_152963 ) ) ( not ( = ?auto_152959 ?auto_152963 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_152963 ?auto_152962 ?auto_152961 )
      ( MAKE-6PILE ?auto_152956 ?auto_152957 ?auto_152958 ?auto_152959 ?auto_152960 ?auto_152961 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_152964 - BLOCK
      ?auto_152965 - BLOCK
      ?auto_152966 - BLOCK
      ?auto_152967 - BLOCK
      ?auto_152968 - BLOCK
      ?auto_152969 - BLOCK
    )
    :vars
    (
      ?auto_152971 - BLOCK
      ?auto_152970 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_152964 ) ( ON ?auto_152965 ?auto_152964 ) ( ON ?auto_152966 ?auto_152965 ) ( not ( = ?auto_152964 ?auto_152965 ) ) ( not ( = ?auto_152964 ?auto_152966 ) ) ( not ( = ?auto_152964 ?auto_152967 ) ) ( not ( = ?auto_152964 ?auto_152968 ) ) ( not ( = ?auto_152964 ?auto_152969 ) ) ( not ( = ?auto_152965 ?auto_152966 ) ) ( not ( = ?auto_152965 ?auto_152967 ) ) ( not ( = ?auto_152965 ?auto_152968 ) ) ( not ( = ?auto_152965 ?auto_152969 ) ) ( not ( = ?auto_152966 ?auto_152967 ) ) ( not ( = ?auto_152966 ?auto_152968 ) ) ( not ( = ?auto_152966 ?auto_152969 ) ) ( not ( = ?auto_152967 ?auto_152968 ) ) ( not ( = ?auto_152967 ?auto_152969 ) ) ( not ( = ?auto_152968 ?auto_152969 ) ) ( ON ?auto_152969 ?auto_152971 ) ( not ( = ?auto_152964 ?auto_152971 ) ) ( not ( = ?auto_152965 ?auto_152971 ) ) ( not ( = ?auto_152966 ?auto_152971 ) ) ( not ( = ?auto_152967 ?auto_152971 ) ) ( not ( = ?auto_152968 ?auto_152971 ) ) ( not ( = ?auto_152969 ?auto_152971 ) ) ( ON ?auto_152968 ?auto_152969 ) ( CLEAR ?auto_152968 ) ( ON-TABLE ?auto_152970 ) ( ON ?auto_152971 ?auto_152970 ) ( not ( = ?auto_152970 ?auto_152971 ) ) ( not ( = ?auto_152970 ?auto_152969 ) ) ( not ( = ?auto_152970 ?auto_152968 ) ) ( not ( = ?auto_152964 ?auto_152970 ) ) ( not ( = ?auto_152965 ?auto_152970 ) ) ( not ( = ?auto_152966 ?auto_152970 ) ) ( not ( = ?auto_152967 ?auto_152970 ) ) ( HOLDING ?auto_152967 ) ( CLEAR ?auto_152966 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_152964 ?auto_152965 ?auto_152966 ?auto_152967 )
      ( MAKE-6PILE ?auto_152964 ?auto_152965 ?auto_152966 ?auto_152967 ?auto_152968 ?auto_152969 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_152972 - BLOCK
      ?auto_152973 - BLOCK
      ?auto_152974 - BLOCK
      ?auto_152975 - BLOCK
      ?auto_152976 - BLOCK
      ?auto_152977 - BLOCK
    )
    :vars
    (
      ?auto_152978 - BLOCK
      ?auto_152979 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_152972 ) ( ON ?auto_152973 ?auto_152972 ) ( ON ?auto_152974 ?auto_152973 ) ( not ( = ?auto_152972 ?auto_152973 ) ) ( not ( = ?auto_152972 ?auto_152974 ) ) ( not ( = ?auto_152972 ?auto_152975 ) ) ( not ( = ?auto_152972 ?auto_152976 ) ) ( not ( = ?auto_152972 ?auto_152977 ) ) ( not ( = ?auto_152973 ?auto_152974 ) ) ( not ( = ?auto_152973 ?auto_152975 ) ) ( not ( = ?auto_152973 ?auto_152976 ) ) ( not ( = ?auto_152973 ?auto_152977 ) ) ( not ( = ?auto_152974 ?auto_152975 ) ) ( not ( = ?auto_152974 ?auto_152976 ) ) ( not ( = ?auto_152974 ?auto_152977 ) ) ( not ( = ?auto_152975 ?auto_152976 ) ) ( not ( = ?auto_152975 ?auto_152977 ) ) ( not ( = ?auto_152976 ?auto_152977 ) ) ( ON ?auto_152977 ?auto_152978 ) ( not ( = ?auto_152972 ?auto_152978 ) ) ( not ( = ?auto_152973 ?auto_152978 ) ) ( not ( = ?auto_152974 ?auto_152978 ) ) ( not ( = ?auto_152975 ?auto_152978 ) ) ( not ( = ?auto_152976 ?auto_152978 ) ) ( not ( = ?auto_152977 ?auto_152978 ) ) ( ON ?auto_152976 ?auto_152977 ) ( ON-TABLE ?auto_152979 ) ( ON ?auto_152978 ?auto_152979 ) ( not ( = ?auto_152979 ?auto_152978 ) ) ( not ( = ?auto_152979 ?auto_152977 ) ) ( not ( = ?auto_152979 ?auto_152976 ) ) ( not ( = ?auto_152972 ?auto_152979 ) ) ( not ( = ?auto_152973 ?auto_152979 ) ) ( not ( = ?auto_152974 ?auto_152979 ) ) ( not ( = ?auto_152975 ?auto_152979 ) ) ( CLEAR ?auto_152974 ) ( ON ?auto_152975 ?auto_152976 ) ( CLEAR ?auto_152975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_152979 ?auto_152978 ?auto_152977 ?auto_152976 )
      ( MAKE-6PILE ?auto_152972 ?auto_152973 ?auto_152974 ?auto_152975 ?auto_152976 ?auto_152977 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_152980 - BLOCK
      ?auto_152981 - BLOCK
      ?auto_152982 - BLOCK
      ?auto_152983 - BLOCK
      ?auto_152984 - BLOCK
      ?auto_152985 - BLOCK
    )
    :vars
    (
      ?auto_152987 - BLOCK
      ?auto_152986 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_152980 ) ( ON ?auto_152981 ?auto_152980 ) ( not ( = ?auto_152980 ?auto_152981 ) ) ( not ( = ?auto_152980 ?auto_152982 ) ) ( not ( = ?auto_152980 ?auto_152983 ) ) ( not ( = ?auto_152980 ?auto_152984 ) ) ( not ( = ?auto_152980 ?auto_152985 ) ) ( not ( = ?auto_152981 ?auto_152982 ) ) ( not ( = ?auto_152981 ?auto_152983 ) ) ( not ( = ?auto_152981 ?auto_152984 ) ) ( not ( = ?auto_152981 ?auto_152985 ) ) ( not ( = ?auto_152982 ?auto_152983 ) ) ( not ( = ?auto_152982 ?auto_152984 ) ) ( not ( = ?auto_152982 ?auto_152985 ) ) ( not ( = ?auto_152983 ?auto_152984 ) ) ( not ( = ?auto_152983 ?auto_152985 ) ) ( not ( = ?auto_152984 ?auto_152985 ) ) ( ON ?auto_152985 ?auto_152987 ) ( not ( = ?auto_152980 ?auto_152987 ) ) ( not ( = ?auto_152981 ?auto_152987 ) ) ( not ( = ?auto_152982 ?auto_152987 ) ) ( not ( = ?auto_152983 ?auto_152987 ) ) ( not ( = ?auto_152984 ?auto_152987 ) ) ( not ( = ?auto_152985 ?auto_152987 ) ) ( ON ?auto_152984 ?auto_152985 ) ( ON-TABLE ?auto_152986 ) ( ON ?auto_152987 ?auto_152986 ) ( not ( = ?auto_152986 ?auto_152987 ) ) ( not ( = ?auto_152986 ?auto_152985 ) ) ( not ( = ?auto_152986 ?auto_152984 ) ) ( not ( = ?auto_152980 ?auto_152986 ) ) ( not ( = ?auto_152981 ?auto_152986 ) ) ( not ( = ?auto_152982 ?auto_152986 ) ) ( not ( = ?auto_152983 ?auto_152986 ) ) ( ON ?auto_152983 ?auto_152984 ) ( CLEAR ?auto_152983 ) ( HOLDING ?auto_152982 ) ( CLEAR ?auto_152981 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_152980 ?auto_152981 ?auto_152982 )
      ( MAKE-6PILE ?auto_152980 ?auto_152981 ?auto_152982 ?auto_152983 ?auto_152984 ?auto_152985 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_152988 - BLOCK
      ?auto_152989 - BLOCK
      ?auto_152990 - BLOCK
      ?auto_152991 - BLOCK
      ?auto_152992 - BLOCK
      ?auto_152993 - BLOCK
    )
    :vars
    (
      ?auto_152994 - BLOCK
      ?auto_152995 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_152988 ) ( ON ?auto_152989 ?auto_152988 ) ( not ( = ?auto_152988 ?auto_152989 ) ) ( not ( = ?auto_152988 ?auto_152990 ) ) ( not ( = ?auto_152988 ?auto_152991 ) ) ( not ( = ?auto_152988 ?auto_152992 ) ) ( not ( = ?auto_152988 ?auto_152993 ) ) ( not ( = ?auto_152989 ?auto_152990 ) ) ( not ( = ?auto_152989 ?auto_152991 ) ) ( not ( = ?auto_152989 ?auto_152992 ) ) ( not ( = ?auto_152989 ?auto_152993 ) ) ( not ( = ?auto_152990 ?auto_152991 ) ) ( not ( = ?auto_152990 ?auto_152992 ) ) ( not ( = ?auto_152990 ?auto_152993 ) ) ( not ( = ?auto_152991 ?auto_152992 ) ) ( not ( = ?auto_152991 ?auto_152993 ) ) ( not ( = ?auto_152992 ?auto_152993 ) ) ( ON ?auto_152993 ?auto_152994 ) ( not ( = ?auto_152988 ?auto_152994 ) ) ( not ( = ?auto_152989 ?auto_152994 ) ) ( not ( = ?auto_152990 ?auto_152994 ) ) ( not ( = ?auto_152991 ?auto_152994 ) ) ( not ( = ?auto_152992 ?auto_152994 ) ) ( not ( = ?auto_152993 ?auto_152994 ) ) ( ON ?auto_152992 ?auto_152993 ) ( ON-TABLE ?auto_152995 ) ( ON ?auto_152994 ?auto_152995 ) ( not ( = ?auto_152995 ?auto_152994 ) ) ( not ( = ?auto_152995 ?auto_152993 ) ) ( not ( = ?auto_152995 ?auto_152992 ) ) ( not ( = ?auto_152988 ?auto_152995 ) ) ( not ( = ?auto_152989 ?auto_152995 ) ) ( not ( = ?auto_152990 ?auto_152995 ) ) ( not ( = ?auto_152991 ?auto_152995 ) ) ( ON ?auto_152991 ?auto_152992 ) ( CLEAR ?auto_152989 ) ( ON ?auto_152990 ?auto_152991 ) ( CLEAR ?auto_152990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_152995 ?auto_152994 ?auto_152993 ?auto_152992 ?auto_152991 )
      ( MAKE-6PILE ?auto_152988 ?auto_152989 ?auto_152990 ?auto_152991 ?auto_152992 ?auto_152993 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_152996 - BLOCK
      ?auto_152997 - BLOCK
      ?auto_152998 - BLOCK
      ?auto_152999 - BLOCK
      ?auto_153000 - BLOCK
      ?auto_153001 - BLOCK
    )
    :vars
    (
      ?auto_153002 - BLOCK
      ?auto_153003 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_152996 ) ( not ( = ?auto_152996 ?auto_152997 ) ) ( not ( = ?auto_152996 ?auto_152998 ) ) ( not ( = ?auto_152996 ?auto_152999 ) ) ( not ( = ?auto_152996 ?auto_153000 ) ) ( not ( = ?auto_152996 ?auto_153001 ) ) ( not ( = ?auto_152997 ?auto_152998 ) ) ( not ( = ?auto_152997 ?auto_152999 ) ) ( not ( = ?auto_152997 ?auto_153000 ) ) ( not ( = ?auto_152997 ?auto_153001 ) ) ( not ( = ?auto_152998 ?auto_152999 ) ) ( not ( = ?auto_152998 ?auto_153000 ) ) ( not ( = ?auto_152998 ?auto_153001 ) ) ( not ( = ?auto_152999 ?auto_153000 ) ) ( not ( = ?auto_152999 ?auto_153001 ) ) ( not ( = ?auto_153000 ?auto_153001 ) ) ( ON ?auto_153001 ?auto_153002 ) ( not ( = ?auto_152996 ?auto_153002 ) ) ( not ( = ?auto_152997 ?auto_153002 ) ) ( not ( = ?auto_152998 ?auto_153002 ) ) ( not ( = ?auto_152999 ?auto_153002 ) ) ( not ( = ?auto_153000 ?auto_153002 ) ) ( not ( = ?auto_153001 ?auto_153002 ) ) ( ON ?auto_153000 ?auto_153001 ) ( ON-TABLE ?auto_153003 ) ( ON ?auto_153002 ?auto_153003 ) ( not ( = ?auto_153003 ?auto_153002 ) ) ( not ( = ?auto_153003 ?auto_153001 ) ) ( not ( = ?auto_153003 ?auto_153000 ) ) ( not ( = ?auto_152996 ?auto_153003 ) ) ( not ( = ?auto_152997 ?auto_153003 ) ) ( not ( = ?auto_152998 ?auto_153003 ) ) ( not ( = ?auto_152999 ?auto_153003 ) ) ( ON ?auto_152999 ?auto_153000 ) ( ON ?auto_152998 ?auto_152999 ) ( CLEAR ?auto_152998 ) ( HOLDING ?auto_152997 ) ( CLEAR ?auto_152996 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_152996 ?auto_152997 )
      ( MAKE-6PILE ?auto_152996 ?auto_152997 ?auto_152998 ?auto_152999 ?auto_153000 ?auto_153001 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153004 - BLOCK
      ?auto_153005 - BLOCK
      ?auto_153006 - BLOCK
      ?auto_153007 - BLOCK
      ?auto_153008 - BLOCK
      ?auto_153009 - BLOCK
    )
    :vars
    (
      ?auto_153010 - BLOCK
      ?auto_153011 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_153004 ) ( not ( = ?auto_153004 ?auto_153005 ) ) ( not ( = ?auto_153004 ?auto_153006 ) ) ( not ( = ?auto_153004 ?auto_153007 ) ) ( not ( = ?auto_153004 ?auto_153008 ) ) ( not ( = ?auto_153004 ?auto_153009 ) ) ( not ( = ?auto_153005 ?auto_153006 ) ) ( not ( = ?auto_153005 ?auto_153007 ) ) ( not ( = ?auto_153005 ?auto_153008 ) ) ( not ( = ?auto_153005 ?auto_153009 ) ) ( not ( = ?auto_153006 ?auto_153007 ) ) ( not ( = ?auto_153006 ?auto_153008 ) ) ( not ( = ?auto_153006 ?auto_153009 ) ) ( not ( = ?auto_153007 ?auto_153008 ) ) ( not ( = ?auto_153007 ?auto_153009 ) ) ( not ( = ?auto_153008 ?auto_153009 ) ) ( ON ?auto_153009 ?auto_153010 ) ( not ( = ?auto_153004 ?auto_153010 ) ) ( not ( = ?auto_153005 ?auto_153010 ) ) ( not ( = ?auto_153006 ?auto_153010 ) ) ( not ( = ?auto_153007 ?auto_153010 ) ) ( not ( = ?auto_153008 ?auto_153010 ) ) ( not ( = ?auto_153009 ?auto_153010 ) ) ( ON ?auto_153008 ?auto_153009 ) ( ON-TABLE ?auto_153011 ) ( ON ?auto_153010 ?auto_153011 ) ( not ( = ?auto_153011 ?auto_153010 ) ) ( not ( = ?auto_153011 ?auto_153009 ) ) ( not ( = ?auto_153011 ?auto_153008 ) ) ( not ( = ?auto_153004 ?auto_153011 ) ) ( not ( = ?auto_153005 ?auto_153011 ) ) ( not ( = ?auto_153006 ?auto_153011 ) ) ( not ( = ?auto_153007 ?auto_153011 ) ) ( ON ?auto_153007 ?auto_153008 ) ( ON ?auto_153006 ?auto_153007 ) ( CLEAR ?auto_153004 ) ( ON ?auto_153005 ?auto_153006 ) ( CLEAR ?auto_153005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_153011 ?auto_153010 ?auto_153009 ?auto_153008 ?auto_153007 ?auto_153006 )
      ( MAKE-6PILE ?auto_153004 ?auto_153005 ?auto_153006 ?auto_153007 ?auto_153008 ?auto_153009 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153012 - BLOCK
      ?auto_153013 - BLOCK
      ?auto_153014 - BLOCK
      ?auto_153015 - BLOCK
      ?auto_153016 - BLOCK
      ?auto_153017 - BLOCK
    )
    :vars
    (
      ?auto_153019 - BLOCK
      ?auto_153018 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153012 ?auto_153013 ) ) ( not ( = ?auto_153012 ?auto_153014 ) ) ( not ( = ?auto_153012 ?auto_153015 ) ) ( not ( = ?auto_153012 ?auto_153016 ) ) ( not ( = ?auto_153012 ?auto_153017 ) ) ( not ( = ?auto_153013 ?auto_153014 ) ) ( not ( = ?auto_153013 ?auto_153015 ) ) ( not ( = ?auto_153013 ?auto_153016 ) ) ( not ( = ?auto_153013 ?auto_153017 ) ) ( not ( = ?auto_153014 ?auto_153015 ) ) ( not ( = ?auto_153014 ?auto_153016 ) ) ( not ( = ?auto_153014 ?auto_153017 ) ) ( not ( = ?auto_153015 ?auto_153016 ) ) ( not ( = ?auto_153015 ?auto_153017 ) ) ( not ( = ?auto_153016 ?auto_153017 ) ) ( ON ?auto_153017 ?auto_153019 ) ( not ( = ?auto_153012 ?auto_153019 ) ) ( not ( = ?auto_153013 ?auto_153019 ) ) ( not ( = ?auto_153014 ?auto_153019 ) ) ( not ( = ?auto_153015 ?auto_153019 ) ) ( not ( = ?auto_153016 ?auto_153019 ) ) ( not ( = ?auto_153017 ?auto_153019 ) ) ( ON ?auto_153016 ?auto_153017 ) ( ON-TABLE ?auto_153018 ) ( ON ?auto_153019 ?auto_153018 ) ( not ( = ?auto_153018 ?auto_153019 ) ) ( not ( = ?auto_153018 ?auto_153017 ) ) ( not ( = ?auto_153018 ?auto_153016 ) ) ( not ( = ?auto_153012 ?auto_153018 ) ) ( not ( = ?auto_153013 ?auto_153018 ) ) ( not ( = ?auto_153014 ?auto_153018 ) ) ( not ( = ?auto_153015 ?auto_153018 ) ) ( ON ?auto_153015 ?auto_153016 ) ( ON ?auto_153014 ?auto_153015 ) ( ON ?auto_153013 ?auto_153014 ) ( CLEAR ?auto_153013 ) ( HOLDING ?auto_153012 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_153012 )
      ( MAKE-6PILE ?auto_153012 ?auto_153013 ?auto_153014 ?auto_153015 ?auto_153016 ?auto_153017 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153020 - BLOCK
      ?auto_153021 - BLOCK
      ?auto_153022 - BLOCK
      ?auto_153023 - BLOCK
      ?auto_153024 - BLOCK
      ?auto_153025 - BLOCK
    )
    :vars
    (
      ?auto_153027 - BLOCK
      ?auto_153026 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153020 ?auto_153021 ) ) ( not ( = ?auto_153020 ?auto_153022 ) ) ( not ( = ?auto_153020 ?auto_153023 ) ) ( not ( = ?auto_153020 ?auto_153024 ) ) ( not ( = ?auto_153020 ?auto_153025 ) ) ( not ( = ?auto_153021 ?auto_153022 ) ) ( not ( = ?auto_153021 ?auto_153023 ) ) ( not ( = ?auto_153021 ?auto_153024 ) ) ( not ( = ?auto_153021 ?auto_153025 ) ) ( not ( = ?auto_153022 ?auto_153023 ) ) ( not ( = ?auto_153022 ?auto_153024 ) ) ( not ( = ?auto_153022 ?auto_153025 ) ) ( not ( = ?auto_153023 ?auto_153024 ) ) ( not ( = ?auto_153023 ?auto_153025 ) ) ( not ( = ?auto_153024 ?auto_153025 ) ) ( ON ?auto_153025 ?auto_153027 ) ( not ( = ?auto_153020 ?auto_153027 ) ) ( not ( = ?auto_153021 ?auto_153027 ) ) ( not ( = ?auto_153022 ?auto_153027 ) ) ( not ( = ?auto_153023 ?auto_153027 ) ) ( not ( = ?auto_153024 ?auto_153027 ) ) ( not ( = ?auto_153025 ?auto_153027 ) ) ( ON ?auto_153024 ?auto_153025 ) ( ON-TABLE ?auto_153026 ) ( ON ?auto_153027 ?auto_153026 ) ( not ( = ?auto_153026 ?auto_153027 ) ) ( not ( = ?auto_153026 ?auto_153025 ) ) ( not ( = ?auto_153026 ?auto_153024 ) ) ( not ( = ?auto_153020 ?auto_153026 ) ) ( not ( = ?auto_153021 ?auto_153026 ) ) ( not ( = ?auto_153022 ?auto_153026 ) ) ( not ( = ?auto_153023 ?auto_153026 ) ) ( ON ?auto_153023 ?auto_153024 ) ( ON ?auto_153022 ?auto_153023 ) ( ON ?auto_153021 ?auto_153022 ) ( ON ?auto_153020 ?auto_153021 ) ( CLEAR ?auto_153020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_153026 ?auto_153027 ?auto_153025 ?auto_153024 ?auto_153023 ?auto_153022 ?auto_153021 )
      ( MAKE-6PILE ?auto_153020 ?auto_153021 ?auto_153022 ?auto_153023 ?auto_153024 ?auto_153025 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153028 - BLOCK
      ?auto_153029 - BLOCK
      ?auto_153030 - BLOCK
      ?auto_153031 - BLOCK
      ?auto_153032 - BLOCK
      ?auto_153033 - BLOCK
    )
    :vars
    (
      ?auto_153035 - BLOCK
      ?auto_153034 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153028 ?auto_153029 ) ) ( not ( = ?auto_153028 ?auto_153030 ) ) ( not ( = ?auto_153028 ?auto_153031 ) ) ( not ( = ?auto_153028 ?auto_153032 ) ) ( not ( = ?auto_153028 ?auto_153033 ) ) ( not ( = ?auto_153029 ?auto_153030 ) ) ( not ( = ?auto_153029 ?auto_153031 ) ) ( not ( = ?auto_153029 ?auto_153032 ) ) ( not ( = ?auto_153029 ?auto_153033 ) ) ( not ( = ?auto_153030 ?auto_153031 ) ) ( not ( = ?auto_153030 ?auto_153032 ) ) ( not ( = ?auto_153030 ?auto_153033 ) ) ( not ( = ?auto_153031 ?auto_153032 ) ) ( not ( = ?auto_153031 ?auto_153033 ) ) ( not ( = ?auto_153032 ?auto_153033 ) ) ( ON ?auto_153033 ?auto_153035 ) ( not ( = ?auto_153028 ?auto_153035 ) ) ( not ( = ?auto_153029 ?auto_153035 ) ) ( not ( = ?auto_153030 ?auto_153035 ) ) ( not ( = ?auto_153031 ?auto_153035 ) ) ( not ( = ?auto_153032 ?auto_153035 ) ) ( not ( = ?auto_153033 ?auto_153035 ) ) ( ON ?auto_153032 ?auto_153033 ) ( ON-TABLE ?auto_153034 ) ( ON ?auto_153035 ?auto_153034 ) ( not ( = ?auto_153034 ?auto_153035 ) ) ( not ( = ?auto_153034 ?auto_153033 ) ) ( not ( = ?auto_153034 ?auto_153032 ) ) ( not ( = ?auto_153028 ?auto_153034 ) ) ( not ( = ?auto_153029 ?auto_153034 ) ) ( not ( = ?auto_153030 ?auto_153034 ) ) ( not ( = ?auto_153031 ?auto_153034 ) ) ( ON ?auto_153031 ?auto_153032 ) ( ON ?auto_153030 ?auto_153031 ) ( ON ?auto_153029 ?auto_153030 ) ( HOLDING ?auto_153028 ) ( CLEAR ?auto_153029 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_153034 ?auto_153035 ?auto_153033 ?auto_153032 ?auto_153031 ?auto_153030 ?auto_153029 ?auto_153028 )
      ( MAKE-6PILE ?auto_153028 ?auto_153029 ?auto_153030 ?auto_153031 ?auto_153032 ?auto_153033 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153036 - BLOCK
      ?auto_153037 - BLOCK
      ?auto_153038 - BLOCK
      ?auto_153039 - BLOCK
      ?auto_153040 - BLOCK
      ?auto_153041 - BLOCK
    )
    :vars
    (
      ?auto_153042 - BLOCK
      ?auto_153043 - BLOCK
      ?auto_153044 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153036 ?auto_153037 ) ) ( not ( = ?auto_153036 ?auto_153038 ) ) ( not ( = ?auto_153036 ?auto_153039 ) ) ( not ( = ?auto_153036 ?auto_153040 ) ) ( not ( = ?auto_153036 ?auto_153041 ) ) ( not ( = ?auto_153037 ?auto_153038 ) ) ( not ( = ?auto_153037 ?auto_153039 ) ) ( not ( = ?auto_153037 ?auto_153040 ) ) ( not ( = ?auto_153037 ?auto_153041 ) ) ( not ( = ?auto_153038 ?auto_153039 ) ) ( not ( = ?auto_153038 ?auto_153040 ) ) ( not ( = ?auto_153038 ?auto_153041 ) ) ( not ( = ?auto_153039 ?auto_153040 ) ) ( not ( = ?auto_153039 ?auto_153041 ) ) ( not ( = ?auto_153040 ?auto_153041 ) ) ( ON ?auto_153041 ?auto_153042 ) ( not ( = ?auto_153036 ?auto_153042 ) ) ( not ( = ?auto_153037 ?auto_153042 ) ) ( not ( = ?auto_153038 ?auto_153042 ) ) ( not ( = ?auto_153039 ?auto_153042 ) ) ( not ( = ?auto_153040 ?auto_153042 ) ) ( not ( = ?auto_153041 ?auto_153042 ) ) ( ON ?auto_153040 ?auto_153041 ) ( ON-TABLE ?auto_153043 ) ( ON ?auto_153042 ?auto_153043 ) ( not ( = ?auto_153043 ?auto_153042 ) ) ( not ( = ?auto_153043 ?auto_153041 ) ) ( not ( = ?auto_153043 ?auto_153040 ) ) ( not ( = ?auto_153036 ?auto_153043 ) ) ( not ( = ?auto_153037 ?auto_153043 ) ) ( not ( = ?auto_153038 ?auto_153043 ) ) ( not ( = ?auto_153039 ?auto_153043 ) ) ( ON ?auto_153039 ?auto_153040 ) ( ON ?auto_153038 ?auto_153039 ) ( ON ?auto_153037 ?auto_153038 ) ( CLEAR ?auto_153037 ) ( ON ?auto_153036 ?auto_153044 ) ( CLEAR ?auto_153036 ) ( HAND-EMPTY ) ( not ( = ?auto_153036 ?auto_153044 ) ) ( not ( = ?auto_153037 ?auto_153044 ) ) ( not ( = ?auto_153038 ?auto_153044 ) ) ( not ( = ?auto_153039 ?auto_153044 ) ) ( not ( = ?auto_153040 ?auto_153044 ) ) ( not ( = ?auto_153041 ?auto_153044 ) ) ( not ( = ?auto_153042 ?auto_153044 ) ) ( not ( = ?auto_153043 ?auto_153044 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_153036 ?auto_153044 )
      ( MAKE-6PILE ?auto_153036 ?auto_153037 ?auto_153038 ?auto_153039 ?auto_153040 ?auto_153041 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153045 - BLOCK
      ?auto_153046 - BLOCK
      ?auto_153047 - BLOCK
      ?auto_153048 - BLOCK
      ?auto_153049 - BLOCK
      ?auto_153050 - BLOCK
    )
    :vars
    (
      ?auto_153052 - BLOCK
      ?auto_153053 - BLOCK
      ?auto_153051 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153045 ?auto_153046 ) ) ( not ( = ?auto_153045 ?auto_153047 ) ) ( not ( = ?auto_153045 ?auto_153048 ) ) ( not ( = ?auto_153045 ?auto_153049 ) ) ( not ( = ?auto_153045 ?auto_153050 ) ) ( not ( = ?auto_153046 ?auto_153047 ) ) ( not ( = ?auto_153046 ?auto_153048 ) ) ( not ( = ?auto_153046 ?auto_153049 ) ) ( not ( = ?auto_153046 ?auto_153050 ) ) ( not ( = ?auto_153047 ?auto_153048 ) ) ( not ( = ?auto_153047 ?auto_153049 ) ) ( not ( = ?auto_153047 ?auto_153050 ) ) ( not ( = ?auto_153048 ?auto_153049 ) ) ( not ( = ?auto_153048 ?auto_153050 ) ) ( not ( = ?auto_153049 ?auto_153050 ) ) ( ON ?auto_153050 ?auto_153052 ) ( not ( = ?auto_153045 ?auto_153052 ) ) ( not ( = ?auto_153046 ?auto_153052 ) ) ( not ( = ?auto_153047 ?auto_153052 ) ) ( not ( = ?auto_153048 ?auto_153052 ) ) ( not ( = ?auto_153049 ?auto_153052 ) ) ( not ( = ?auto_153050 ?auto_153052 ) ) ( ON ?auto_153049 ?auto_153050 ) ( ON-TABLE ?auto_153053 ) ( ON ?auto_153052 ?auto_153053 ) ( not ( = ?auto_153053 ?auto_153052 ) ) ( not ( = ?auto_153053 ?auto_153050 ) ) ( not ( = ?auto_153053 ?auto_153049 ) ) ( not ( = ?auto_153045 ?auto_153053 ) ) ( not ( = ?auto_153046 ?auto_153053 ) ) ( not ( = ?auto_153047 ?auto_153053 ) ) ( not ( = ?auto_153048 ?auto_153053 ) ) ( ON ?auto_153048 ?auto_153049 ) ( ON ?auto_153047 ?auto_153048 ) ( ON ?auto_153045 ?auto_153051 ) ( CLEAR ?auto_153045 ) ( not ( = ?auto_153045 ?auto_153051 ) ) ( not ( = ?auto_153046 ?auto_153051 ) ) ( not ( = ?auto_153047 ?auto_153051 ) ) ( not ( = ?auto_153048 ?auto_153051 ) ) ( not ( = ?auto_153049 ?auto_153051 ) ) ( not ( = ?auto_153050 ?auto_153051 ) ) ( not ( = ?auto_153052 ?auto_153051 ) ) ( not ( = ?auto_153053 ?auto_153051 ) ) ( HOLDING ?auto_153046 ) ( CLEAR ?auto_153047 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_153053 ?auto_153052 ?auto_153050 ?auto_153049 ?auto_153048 ?auto_153047 ?auto_153046 )
      ( MAKE-6PILE ?auto_153045 ?auto_153046 ?auto_153047 ?auto_153048 ?auto_153049 ?auto_153050 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153054 - BLOCK
      ?auto_153055 - BLOCK
      ?auto_153056 - BLOCK
      ?auto_153057 - BLOCK
      ?auto_153058 - BLOCK
      ?auto_153059 - BLOCK
    )
    :vars
    (
      ?auto_153060 - BLOCK
      ?auto_153061 - BLOCK
      ?auto_153062 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153054 ?auto_153055 ) ) ( not ( = ?auto_153054 ?auto_153056 ) ) ( not ( = ?auto_153054 ?auto_153057 ) ) ( not ( = ?auto_153054 ?auto_153058 ) ) ( not ( = ?auto_153054 ?auto_153059 ) ) ( not ( = ?auto_153055 ?auto_153056 ) ) ( not ( = ?auto_153055 ?auto_153057 ) ) ( not ( = ?auto_153055 ?auto_153058 ) ) ( not ( = ?auto_153055 ?auto_153059 ) ) ( not ( = ?auto_153056 ?auto_153057 ) ) ( not ( = ?auto_153056 ?auto_153058 ) ) ( not ( = ?auto_153056 ?auto_153059 ) ) ( not ( = ?auto_153057 ?auto_153058 ) ) ( not ( = ?auto_153057 ?auto_153059 ) ) ( not ( = ?auto_153058 ?auto_153059 ) ) ( ON ?auto_153059 ?auto_153060 ) ( not ( = ?auto_153054 ?auto_153060 ) ) ( not ( = ?auto_153055 ?auto_153060 ) ) ( not ( = ?auto_153056 ?auto_153060 ) ) ( not ( = ?auto_153057 ?auto_153060 ) ) ( not ( = ?auto_153058 ?auto_153060 ) ) ( not ( = ?auto_153059 ?auto_153060 ) ) ( ON ?auto_153058 ?auto_153059 ) ( ON-TABLE ?auto_153061 ) ( ON ?auto_153060 ?auto_153061 ) ( not ( = ?auto_153061 ?auto_153060 ) ) ( not ( = ?auto_153061 ?auto_153059 ) ) ( not ( = ?auto_153061 ?auto_153058 ) ) ( not ( = ?auto_153054 ?auto_153061 ) ) ( not ( = ?auto_153055 ?auto_153061 ) ) ( not ( = ?auto_153056 ?auto_153061 ) ) ( not ( = ?auto_153057 ?auto_153061 ) ) ( ON ?auto_153057 ?auto_153058 ) ( ON ?auto_153056 ?auto_153057 ) ( ON ?auto_153054 ?auto_153062 ) ( not ( = ?auto_153054 ?auto_153062 ) ) ( not ( = ?auto_153055 ?auto_153062 ) ) ( not ( = ?auto_153056 ?auto_153062 ) ) ( not ( = ?auto_153057 ?auto_153062 ) ) ( not ( = ?auto_153058 ?auto_153062 ) ) ( not ( = ?auto_153059 ?auto_153062 ) ) ( not ( = ?auto_153060 ?auto_153062 ) ) ( not ( = ?auto_153061 ?auto_153062 ) ) ( CLEAR ?auto_153056 ) ( ON ?auto_153055 ?auto_153054 ) ( CLEAR ?auto_153055 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_153062 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_153062 ?auto_153054 )
      ( MAKE-6PILE ?auto_153054 ?auto_153055 ?auto_153056 ?auto_153057 ?auto_153058 ?auto_153059 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153063 - BLOCK
      ?auto_153064 - BLOCK
      ?auto_153065 - BLOCK
      ?auto_153066 - BLOCK
      ?auto_153067 - BLOCK
      ?auto_153068 - BLOCK
    )
    :vars
    (
      ?auto_153069 - BLOCK
      ?auto_153070 - BLOCK
      ?auto_153071 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153063 ?auto_153064 ) ) ( not ( = ?auto_153063 ?auto_153065 ) ) ( not ( = ?auto_153063 ?auto_153066 ) ) ( not ( = ?auto_153063 ?auto_153067 ) ) ( not ( = ?auto_153063 ?auto_153068 ) ) ( not ( = ?auto_153064 ?auto_153065 ) ) ( not ( = ?auto_153064 ?auto_153066 ) ) ( not ( = ?auto_153064 ?auto_153067 ) ) ( not ( = ?auto_153064 ?auto_153068 ) ) ( not ( = ?auto_153065 ?auto_153066 ) ) ( not ( = ?auto_153065 ?auto_153067 ) ) ( not ( = ?auto_153065 ?auto_153068 ) ) ( not ( = ?auto_153066 ?auto_153067 ) ) ( not ( = ?auto_153066 ?auto_153068 ) ) ( not ( = ?auto_153067 ?auto_153068 ) ) ( ON ?auto_153068 ?auto_153069 ) ( not ( = ?auto_153063 ?auto_153069 ) ) ( not ( = ?auto_153064 ?auto_153069 ) ) ( not ( = ?auto_153065 ?auto_153069 ) ) ( not ( = ?auto_153066 ?auto_153069 ) ) ( not ( = ?auto_153067 ?auto_153069 ) ) ( not ( = ?auto_153068 ?auto_153069 ) ) ( ON ?auto_153067 ?auto_153068 ) ( ON-TABLE ?auto_153070 ) ( ON ?auto_153069 ?auto_153070 ) ( not ( = ?auto_153070 ?auto_153069 ) ) ( not ( = ?auto_153070 ?auto_153068 ) ) ( not ( = ?auto_153070 ?auto_153067 ) ) ( not ( = ?auto_153063 ?auto_153070 ) ) ( not ( = ?auto_153064 ?auto_153070 ) ) ( not ( = ?auto_153065 ?auto_153070 ) ) ( not ( = ?auto_153066 ?auto_153070 ) ) ( ON ?auto_153066 ?auto_153067 ) ( ON ?auto_153063 ?auto_153071 ) ( not ( = ?auto_153063 ?auto_153071 ) ) ( not ( = ?auto_153064 ?auto_153071 ) ) ( not ( = ?auto_153065 ?auto_153071 ) ) ( not ( = ?auto_153066 ?auto_153071 ) ) ( not ( = ?auto_153067 ?auto_153071 ) ) ( not ( = ?auto_153068 ?auto_153071 ) ) ( not ( = ?auto_153069 ?auto_153071 ) ) ( not ( = ?auto_153070 ?auto_153071 ) ) ( ON ?auto_153064 ?auto_153063 ) ( CLEAR ?auto_153064 ) ( ON-TABLE ?auto_153071 ) ( HOLDING ?auto_153065 ) ( CLEAR ?auto_153066 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_153070 ?auto_153069 ?auto_153068 ?auto_153067 ?auto_153066 ?auto_153065 )
      ( MAKE-6PILE ?auto_153063 ?auto_153064 ?auto_153065 ?auto_153066 ?auto_153067 ?auto_153068 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153072 - BLOCK
      ?auto_153073 - BLOCK
      ?auto_153074 - BLOCK
      ?auto_153075 - BLOCK
      ?auto_153076 - BLOCK
      ?auto_153077 - BLOCK
    )
    :vars
    (
      ?auto_153080 - BLOCK
      ?auto_153079 - BLOCK
      ?auto_153078 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153072 ?auto_153073 ) ) ( not ( = ?auto_153072 ?auto_153074 ) ) ( not ( = ?auto_153072 ?auto_153075 ) ) ( not ( = ?auto_153072 ?auto_153076 ) ) ( not ( = ?auto_153072 ?auto_153077 ) ) ( not ( = ?auto_153073 ?auto_153074 ) ) ( not ( = ?auto_153073 ?auto_153075 ) ) ( not ( = ?auto_153073 ?auto_153076 ) ) ( not ( = ?auto_153073 ?auto_153077 ) ) ( not ( = ?auto_153074 ?auto_153075 ) ) ( not ( = ?auto_153074 ?auto_153076 ) ) ( not ( = ?auto_153074 ?auto_153077 ) ) ( not ( = ?auto_153075 ?auto_153076 ) ) ( not ( = ?auto_153075 ?auto_153077 ) ) ( not ( = ?auto_153076 ?auto_153077 ) ) ( ON ?auto_153077 ?auto_153080 ) ( not ( = ?auto_153072 ?auto_153080 ) ) ( not ( = ?auto_153073 ?auto_153080 ) ) ( not ( = ?auto_153074 ?auto_153080 ) ) ( not ( = ?auto_153075 ?auto_153080 ) ) ( not ( = ?auto_153076 ?auto_153080 ) ) ( not ( = ?auto_153077 ?auto_153080 ) ) ( ON ?auto_153076 ?auto_153077 ) ( ON-TABLE ?auto_153079 ) ( ON ?auto_153080 ?auto_153079 ) ( not ( = ?auto_153079 ?auto_153080 ) ) ( not ( = ?auto_153079 ?auto_153077 ) ) ( not ( = ?auto_153079 ?auto_153076 ) ) ( not ( = ?auto_153072 ?auto_153079 ) ) ( not ( = ?auto_153073 ?auto_153079 ) ) ( not ( = ?auto_153074 ?auto_153079 ) ) ( not ( = ?auto_153075 ?auto_153079 ) ) ( ON ?auto_153075 ?auto_153076 ) ( ON ?auto_153072 ?auto_153078 ) ( not ( = ?auto_153072 ?auto_153078 ) ) ( not ( = ?auto_153073 ?auto_153078 ) ) ( not ( = ?auto_153074 ?auto_153078 ) ) ( not ( = ?auto_153075 ?auto_153078 ) ) ( not ( = ?auto_153076 ?auto_153078 ) ) ( not ( = ?auto_153077 ?auto_153078 ) ) ( not ( = ?auto_153080 ?auto_153078 ) ) ( not ( = ?auto_153079 ?auto_153078 ) ) ( ON ?auto_153073 ?auto_153072 ) ( ON-TABLE ?auto_153078 ) ( CLEAR ?auto_153075 ) ( ON ?auto_153074 ?auto_153073 ) ( CLEAR ?auto_153074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_153078 ?auto_153072 ?auto_153073 )
      ( MAKE-6PILE ?auto_153072 ?auto_153073 ?auto_153074 ?auto_153075 ?auto_153076 ?auto_153077 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153081 - BLOCK
      ?auto_153082 - BLOCK
      ?auto_153083 - BLOCK
      ?auto_153084 - BLOCK
      ?auto_153085 - BLOCK
      ?auto_153086 - BLOCK
    )
    :vars
    (
      ?auto_153089 - BLOCK
      ?auto_153088 - BLOCK
      ?auto_153087 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153081 ?auto_153082 ) ) ( not ( = ?auto_153081 ?auto_153083 ) ) ( not ( = ?auto_153081 ?auto_153084 ) ) ( not ( = ?auto_153081 ?auto_153085 ) ) ( not ( = ?auto_153081 ?auto_153086 ) ) ( not ( = ?auto_153082 ?auto_153083 ) ) ( not ( = ?auto_153082 ?auto_153084 ) ) ( not ( = ?auto_153082 ?auto_153085 ) ) ( not ( = ?auto_153082 ?auto_153086 ) ) ( not ( = ?auto_153083 ?auto_153084 ) ) ( not ( = ?auto_153083 ?auto_153085 ) ) ( not ( = ?auto_153083 ?auto_153086 ) ) ( not ( = ?auto_153084 ?auto_153085 ) ) ( not ( = ?auto_153084 ?auto_153086 ) ) ( not ( = ?auto_153085 ?auto_153086 ) ) ( ON ?auto_153086 ?auto_153089 ) ( not ( = ?auto_153081 ?auto_153089 ) ) ( not ( = ?auto_153082 ?auto_153089 ) ) ( not ( = ?auto_153083 ?auto_153089 ) ) ( not ( = ?auto_153084 ?auto_153089 ) ) ( not ( = ?auto_153085 ?auto_153089 ) ) ( not ( = ?auto_153086 ?auto_153089 ) ) ( ON ?auto_153085 ?auto_153086 ) ( ON-TABLE ?auto_153088 ) ( ON ?auto_153089 ?auto_153088 ) ( not ( = ?auto_153088 ?auto_153089 ) ) ( not ( = ?auto_153088 ?auto_153086 ) ) ( not ( = ?auto_153088 ?auto_153085 ) ) ( not ( = ?auto_153081 ?auto_153088 ) ) ( not ( = ?auto_153082 ?auto_153088 ) ) ( not ( = ?auto_153083 ?auto_153088 ) ) ( not ( = ?auto_153084 ?auto_153088 ) ) ( ON ?auto_153081 ?auto_153087 ) ( not ( = ?auto_153081 ?auto_153087 ) ) ( not ( = ?auto_153082 ?auto_153087 ) ) ( not ( = ?auto_153083 ?auto_153087 ) ) ( not ( = ?auto_153084 ?auto_153087 ) ) ( not ( = ?auto_153085 ?auto_153087 ) ) ( not ( = ?auto_153086 ?auto_153087 ) ) ( not ( = ?auto_153089 ?auto_153087 ) ) ( not ( = ?auto_153088 ?auto_153087 ) ) ( ON ?auto_153082 ?auto_153081 ) ( ON-TABLE ?auto_153087 ) ( ON ?auto_153083 ?auto_153082 ) ( CLEAR ?auto_153083 ) ( HOLDING ?auto_153084 ) ( CLEAR ?auto_153085 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_153088 ?auto_153089 ?auto_153086 ?auto_153085 ?auto_153084 )
      ( MAKE-6PILE ?auto_153081 ?auto_153082 ?auto_153083 ?auto_153084 ?auto_153085 ?auto_153086 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153090 - BLOCK
      ?auto_153091 - BLOCK
      ?auto_153092 - BLOCK
      ?auto_153093 - BLOCK
      ?auto_153094 - BLOCK
      ?auto_153095 - BLOCK
    )
    :vars
    (
      ?auto_153098 - BLOCK
      ?auto_153097 - BLOCK
      ?auto_153096 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153090 ?auto_153091 ) ) ( not ( = ?auto_153090 ?auto_153092 ) ) ( not ( = ?auto_153090 ?auto_153093 ) ) ( not ( = ?auto_153090 ?auto_153094 ) ) ( not ( = ?auto_153090 ?auto_153095 ) ) ( not ( = ?auto_153091 ?auto_153092 ) ) ( not ( = ?auto_153091 ?auto_153093 ) ) ( not ( = ?auto_153091 ?auto_153094 ) ) ( not ( = ?auto_153091 ?auto_153095 ) ) ( not ( = ?auto_153092 ?auto_153093 ) ) ( not ( = ?auto_153092 ?auto_153094 ) ) ( not ( = ?auto_153092 ?auto_153095 ) ) ( not ( = ?auto_153093 ?auto_153094 ) ) ( not ( = ?auto_153093 ?auto_153095 ) ) ( not ( = ?auto_153094 ?auto_153095 ) ) ( ON ?auto_153095 ?auto_153098 ) ( not ( = ?auto_153090 ?auto_153098 ) ) ( not ( = ?auto_153091 ?auto_153098 ) ) ( not ( = ?auto_153092 ?auto_153098 ) ) ( not ( = ?auto_153093 ?auto_153098 ) ) ( not ( = ?auto_153094 ?auto_153098 ) ) ( not ( = ?auto_153095 ?auto_153098 ) ) ( ON ?auto_153094 ?auto_153095 ) ( ON-TABLE ?auto_153097 ) ( ON ?auto_153098 ?auto_153097 ) ( not ( = ?auto_153097 ?auto_153098 ) ) ( not ( = ?auto_153097 ?auto_153095 ) ) ( not ( = ?auto_153097 ?auto_153094 ) ) ( not ( = ?auto_153090 ?auto_153097 ) ) ( not ( = ?auto_153091 ?auto_153097 ) ) ( not ( = ?auto_153092 ?auto_153097 ) ) ( not ( = ?auto_153093 ?auto_153097 ) ) ( ON ?auto_153090 ?auto_153096 ) ( not ( = ?auto_153090 ?auto_153096 ) ) ( not ( = ?auto_153091 ?auto_153096 ) ) ( not ( = ?auto_153092 ?auto_153096 ) ) ( not ( = ?auto_153093 ?auto_153096 ) ) ( not ( = ?auto_153094 ?auto_153096 ) ) ( not ( = ?auto_153095 ?auto_153096 ) ) ( not ( = ?auto_153098 ?auto_153096 ) ) ( not ( = ?auto_153097 ?auto_153096 ) ) ( ON ?auto_153091 ?auto_153090 ) ( ON-TABLE ?auto_153096 ) ( ON ?auto_153092 ?auto_153091 ) ( CLEAR ?auto_153094 ) ( ON ?auto_153093 ?auto_153092 ) ( CLEAR ?auto_153093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_153096 ?auto_153090 ?auto_153091 ?auto_153092 )
      ( MAKE-6PILE ?auto_153090 ?auto_153091 ?auto_153092 ?auto_153093 ?auto_153094 ?auto_153095 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153099 - BLOCK
      ?auto_153100 - BLOCK
      ?auto_153101 - BLOCK
      ?auto_153102 - BLOCK
      ?auto_153103 - BLOCK
      ?auto_153104 - BLOCK
    )
    :vars
    (
      ?auto_153107 - BLOCK
      ?auto_153105 - BLOCK
      ?auto_153106 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153099 ?auto_153100 ) ) ( not ( = ?auto_153099 ?auto_153101 ) ) ( not ( = ?auto_153099 ?auto_153102 ) ) ( not ( = ?auto_153099 ?auto_153103 ) ) ( not ( = ?auto_153099 ?auto_153104 ) ) ( not ( = ?auto_153100 ?auto_153101 ) ) ( not ( = ?auto_153100 ?auto_153102 ) ) ( not ( = ?auto_153100 ?auto_153103 ) ) ( not ( = ?auto_153100 ?auto_153104 ) ) ( not ( = ?auto_153101 ?auto_153102 ) ) ( not ( = ?auto_153101 ?auto_153103 ) ) ( not ( = ?auto_153101 ?auto_153104 ) ) ( not ( = ?auto_153102 ?auto_153103 ) ) ( not ( = ?auto_153102 ?auto_153104 ) ) ( not ( = ?auto_153103 ?auto_153104 ) ) ( ON ?auto_153104 ?auto_153107 ) ( not ( = ?auto_153099 ?auto_153107 ) ) ( not ( = ?auto_153100 ?auto_153107 ) ) ( not ( = ?auto_153101 ?auto_153107 ) ) ( not ( = ?auto_153102 ?auto_153107 ) ) ( not ( = ?auto_153103 ?auto_153107 ) ) ( not ( = ?auto_153104 ?auto_153107 ) ) ( ON-TABLE ?auto_153105 ) ( ON ?auto_153107 ?auto_153105 ) ( not ( = ?auto_153105 ?auto_153107 ) ) ( not ( = ?auto_153105 ?auto_153104 ) ) ( not ( = ?auto_153105 ?auto_153103 ) ) ( not ( = ?auto_153099 ?auto_153105 ) ) ( not ( = ?auto_153100 ?auto_153105 ) ) ( not ( = ?auto_153101 ?auto_153105 ) ) ( not ( = ?auto_153102 ?auto_153105 ) ) ( ON ?auto_153099 ?auto_153106 ) ( not ( = ?auto_153099 ?auto_153106 ) ) ( not ( = ?auto_153100 ?auto_153106 ) ) ( not ( = ?auto_153101 ?auto_153106 ) ) ( not ( = ?auto_153102 ?auto_153106 ) ) ( not ( = ?auto_153103 ?auto_153106 ) ) ( not ( = ?auto_153104 ?auto_153106 ) ) ( not ( = ?auto_153107 ?auto_153106 ) ) ( not ( = ?auto_153105 ?auto_153106 ) ) ( ON ?auto_153100 ?auto_153099 ) ( ON-TABLE ?auto_153106 ) ( ON ?auto_153101 ?auto_153100 ) ( ON ?auto_153102 ?auto_153101 ) ( CLEAR ?auto_153102 ) ( HOLDING ?auto_153103 ) ( CLEAR ?auto_153104 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_153105 ?auto_153107 ?auto_153104 ?auto_153103 )
      ( MAKE-6PILE ?auto_153099 ?auto_153100 ?auto_153101 ?auto_153102 ?auto_153103 ?auto_153104 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153108 - BLOCK
      ?auto_153109 - BLOCK
      ?auto_153110 - BLOCK
      ?auto_153111 - BLOCK
      ?auto_153112 - BLOCK
      ?auto_153113 - BLOCK
    )
    :vars
    (
      ?auto_153116 - BLOCK
      ?auto_153115 - BLOCK
      ?auto_153114 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153108 ?auto_153109 ) ) ( not ( = ?auto_153108 ?auto_153110 ) ) ( not ( = ?auto_153108 ?auto_153111 ) ) ( not ( = ?auto_153108 ?auto_153112 ) ) ( not ( = ?auto_153108 ?auto_153113 ) ) ( not ( = ?auto_153109 ?auto_153110 ) ) ( not ( = ?auto_153109 ?auto_153111 ) ) ( not ( = ?auto_153109 ?auto_153112 ) ) ( not ( = ?auto_153109 ?auto_153113 ) ) ( not ( = ?auto_153110 ?auto_153111 ) ) ( not ( = ?auto_153110 ?auto_153112 ) ) ( not ( = ?auto_153110 ?auto_153113 ) ) ( not ( = ?auto_153111 ?auto_153112 ) ) ( not ( = ?auto_153111 ?auto_153113 ) ) ( not ( = ?auto_153112 ?auto_153113 ) ) ( ON ?auto_153113 ?auto_153116 ) ( not ( = ?auto_153108 ?auto_153116 ) ) ( not ( = ?auto_153109 ?auto_153116 ) ) ( not ( = ?auto_153110 ?auto_153116 ) ) ( not ( = ?auto_153111 ?auto_153116 ) ) ( not ( = ?auto_153112 ?auto_153116 ) ) ( not ( = ?auto_153113 ?auto_153116 ) ) ( ON-TABLE ?auto_153115 ) ( ON ?auto_153116 ?auto_153115 ) ( not ( = ?auto_153115 ?auto_153116 ) ) ( not ( = ?auto_153115 ?auto_153113 ) ) ( not ( = ?auto_153115 ?auto_153112 ) ) ( not ( = ?auto_153108 ?auto_153115 ) ) ( not ( = ?auto_153109 ?auto_153115 ) ) ( not ( = ?auto_153110 ?auto_153115 ) ) ( not ( = ?auto_153111 ?auto_153115 ) ) ( ON ?auto_153108 ?auto_153114 ) ( not ( = ?auto_153108 ?auto_153114 ) ) ( not ( = ?auto_153109 ?auto_153114 ) ) ( not ( = ?auto_153110 ?auto_153114 ) ) ( not ( = ?auto_153111 ?auto_153114 ) ) ( not ( = ?auto_153112 ?auto_153114 ) ) ( not ( = ?auto_153113 ?auto_153114 ) ) ( not ( = ?auto_153116 ?auto_153114 ) ) ( not ( = ?auto_153115 ?auto_153114 ) ) ( ON ?auto_153109 ?auto_153108 ) ( ON-TABLE ?auto_153114 ) ( ON ?auto_153110 ?auto_153109 ) ( ON ?auto_153111 ?auto_153110 ) ( CLEAR ?auto_153113 ) ( ON ?auto_153112 ?auto_153111 ) ( CLEAR ?auto_153112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_153114 ?auto_153108 ?auto_153109 ?auto_153110 ?auto_153111 )
      ( MAKE-6PILE ?auto_153108 ?auto_153109 ?auto_153110 ?auto_153111 ?auto_153112 ?auto_153113 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153117 - BLOCK
      ?auto_153118 - BLOCK
      ?auto_153119 - BLOCK
      ?auto_153120 - BLOCK
      ?auto_153121 - BLOCK
      ?auto_153122 - BLOCK
    )
    :vars
    (
      ?auto_153125 - BLOCK
      ?auto_153123 - BLOCK
      ?auto_153124 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153117 ?auto_153118 ) ) ( not ( = ?auto_153117 ?auto_153119 ) ) ( not ( = ?auto_153117 ?auto_153120 ) ) ( not ( = ?auto_153117 ?auto_153121 ) ) ( not ( = ?auto_153117 ?auto_153122 ) ) ( not ( = ?auto_153118 ?auto_153119 ) ) ( not ( = ?auto_153118 ?auto_153120 ) ) ( not ( = ?auto_153118 ?auto_153121 ) ) ( not ( = ?auto_153118 ?auto_153122 ) ) ( not ( = ?auto_153119 ?auto_153120 ) ) ( not ( = ?auto_153119 ?auto_153121 ) ) ( not ( = ?auto_153119 ?auto_153122 ) ) ( not ( = ?auto_153120 ?auto_153121 ) ) ( not ( = ?auto_153120 ?auto_153122 ) ) ( not ( = ?auto_153121 ?auto_153122 ) ) ( not ( = ?auto_153117 ?auto_153125 ) ) ( not ( = ?auto_153118 ?auto_153125 ) ) ( not ( = ?auto_153119 ?auto_153125 ) ) ( not ( = ?auto_153120 ?auto_153125 ) ) ( not ( = ?auto_153121 ?auto_153125 ) ) ( not ( = ?auto_153122 ?auto_153125 ) ) ( ON-TABLE ?auto_153123 ) ( ON ?auto_153125 ?auto_153123 ) ( not ( = ?auto_153123 ?auto_153125 ) ) ( not ( = ?auto_153123 ?auto_153122 ) ) ( not ( = ?auto_153123 ?auto_153121 ) ) ( not ( = ?auto_153117 ?auto_153123 ) ) ( not ( = ?auto_153118 ?auto_153123 ) ) ( not ( = ?auto_153119 ?auto_153123 ) ) ( not ( = ?auto_153120 ?auto_153123 ) ) ( ON ?auto_153117 ?auto_153124 ) ( not ( = ?auto_153117 ?auto_153124 ) ) ( not ( = ?auto_153118 ?auto_153124 ) ) ( not ( = ?auto_153119 ?auto_153124 ) ) ( not ( = ?auto_153120 ?auto_153124 ) ) ( not ( = ?auto_153121 ?auto_153124 ) ) ( not ( = ?auto_153122 ?auto_153124 ) ) ( not ( = ?auto_153125 ?auto_153124 ) ) ( not ( = ?auto_153123 ?auto_153124 ) ) ( ON ?auto_153118 ?auto_153117 ) ( ON-TABLE ?auto_153124 ) ( ON ?auto_153119 ?auto_153118 ) ( ON ?auto_153120 ?auto_153119 ) ( ON ?auto_153121 ?auto_153120 ) ( CLEAR ?auto_153121 ) ( HOLDING ?auto_153122 ) ( CLEAR ?auto_153125 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_153123 ?auto_153125 ?auto_153122 )
      ( MAKE-6PILE ?auto_153117 ?auto_153118 ?auto_153119 ?auto_153120 ?auto_153121 ?auto_153122 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153126 - BLOCK
      ?auto_153127 - BLOCK
      ?auto_153128 - BLOCK
      ?auto_153129 - BLOCK
      ?auto_153130 - BLOCK
      ?auto_153131 - BLOCK
    )
    :vars
    (
      ?auto_153134 - BLOCK
      ?auto_153132 - BLOCK
      ?auto_153133 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153126 ?auto_153127 ) ) ( not ( = ?auto_153126 ?auto_153128 ) ) ( not ( = ?auto_153126 ?auto_153129 ) ) ( not ( = ?auto_153126 ?auto_153130 ) ) ( not ( = ?auto_153126 ?auto_153131 ) ) ( not ( = ?auto_153127 ?auto_153128 ) ) ( not ( = ?auto_153127 ?auto_153129 ) ) ( not ( = ?auto_153127 ?auto_153130 ) ) ( not ( = ?auto_153127 ?auto_153131 ) ) ( not ( = ?auto_153128 ?auto_153129 ) ) ( not ( = ?auto_153128 ?auto_153130 ) ) ( not ( = ?auto_153128 ?auto_153131 ) ) ( not ( = ?auto_153129 ?auto_153130 ) ) ( not ( = ?auto_153129 ?auto_153131 ) ) ( not ( = ?auto_153130 ?auto_153131 ) ) ( not ( = ?auto_153126 ?auto_153134 ) ) ( not ( = ?auto_153127 ?auto_153134 ) ) ( not ( = ?auto_153128 ?auto_153134 ) ) ( not ( = ?auto_153129 ?auto_153134 ) ) ( not ( = ?auto_153130 ?auto_153134 ) ) ( not ( = ?auto_153131 ?auto_153134 ) ) ( ON-TABLE ?auto_153132 ) ( ON ?auto_153134 ?auto_153132 ) ( not ( = ?auto_153132 ?auto_153134 ) ) ( not ( = ?auto_153132 ?auto_153131 ) ) ( not ( = ?auto_153132 ?auto_153130 ) ) ( not ( = ?auto_153126 ?auto_153132 ) ) ( not ( = ?auto_153127 ?auto_153132 ) ) ( not ( = ?auto_153128 ?auto_153132 ) ) ( not ( = ?auto_153129 ?auto_153132 ) ) ( ON ?auto_153126 ?auto_153133 ) ( not ( = ?auto_153126 ?auto_153133 ) ) ( not ( = ?auto_153127 ?auto_153133 ) ) ( not ( = ?auto_153128 ?auto_153133 ) ) ( not ( = ?auto_153129 ?auto_153133 ) ) ( not ( = ?auto_153130 ?auto_153133 ) ) ( not ( = ?auto_153131 ?auto_153133 ) ) ( not ( = ?auto_153134 ?auto_153133 ) ) ( not ( = ?auto_153132 ?auto_153133 ) ) ( ON ?auto_153127 ?auto_153126 ) ( ON-TABLE ?auto_153133 ) ( ON ?auto_153128 ?auto_153127 ) ( ON ?auto_153129 ?auto_153128 ) ( ON ?auto_153130 ?auto_153129 ) ( CLEAR ?auto_153134 ) ( ON ?auto_153131 ?auto_153130 ) ( CLEAR ?auto_153131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_153133 ?auto_153126 ?auto_153127 ?auto_153128 ?auto_153129 ?auto_153130 )
      ( MAKE-6PILE ?auto_153126 ?auto_153127 ?auto_153128 ?auto_153129 ?auto_153130 ?auto_153131 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153135 - BLOCK
      ?auto_153136 - BLOCK
      ?auto_153137 - BLOCK
      ?auto_153138 - BLOCK
      ?auto_153139 - BLOCK
      ?auto_153140 - BLOCK
    )
    :vars
    (
      ?auto_153141 - BLOCK
      ?auto_153142 - BLOCK
      ?auto_153143 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153135 ?auto_153136 ) ) ( not ( = ?auto_153135 ?auto_153137 ) ) ( not ( = ?auto_153135 ?auto_153138 ) ) ( not ( = ?auto_153135 ?auto_153139 ) ) ( not ( = ?auto_153135 ?auto_153140 ) ) ( not ( = ?auto_153136 ?auto_153137 ) ) ( not ( = ?auto_153136 ?auto_153138 ) ) ( not ( = ?auto_153136 ?auto_153139 ) ) ( not ( = ?auto_153136 ?auto_153140 ) ) ( not ( = ?auto_153137 ?auto_153138 ) ) ( not ( = ?auto_153137 ?auto_153139 ) ) ( not ( = ?auto_153137 ?auto_153140 ) ) ( not ( = ?auto_153138 ?auto_153139 ) ) ( not ( = ?auto_153138 ?auto_153140 ) ) ( not ( = ?auto_153139 ?auto_153140 ) ) ( not ( = ?auto_153135 ?auto_153141 ) ) ( not ( = ?auto_153136 ?auto_153141 ) ) ( not ( = ?auto_153137 ?auto_153141 ) ) ( not ( = ?auto_153138 ?auto_153141 ) ) ( not ( = ?auto_153139 ?auto_153141 ) ) ( not ( = ?auto_153140 ?auto_153141 ) ) ( ON-TABLE ?auto_153142 ) ( not ( = ?auto_153142 ?auto_153141 ) ) ( not ( = ?auto_153142 ?auto_153140 ) ) ( not ( = ?auto_153142 ?auto_153139 ) ) ( not ( = ?auto_153135 ?auto_153142 ) ) ( not ( = ?auto_153136 ?auto_153142 ) ) ( not ( = ?auto_153137 ?auto_153142 ) ) ( not ( = ?auto_153138 ?auto_153142 ) ) ( ON ?auto_153135 ?auto_153143 ) ( not ( = ?auto_153135 ?auto_153143 ) ) ( not ( = ?auto_153136 ?auto_153143 ) ) ( not ( = ?auto_153137 ?auto_153143 ) ) ( not ( = ?auto_153138 ?auto_153143 ) ) ( not ( = ?auto_153139 ?auto_153143 ) ) ( not ( = ?auto_153140 ?auto_153143 ) ) ( not ( = ?auto_153141 ?auto_153143 ) ) ( not ( = ?auto_153142 ?auto_153143 ) ) ( ON ?auto_153136 ?auto_153135 ) ( ON-TABLE ?auto_153143 ) ( ON ?auto_153137 ?auto_153136 ) ( ON ?auto_153138 ?auto_153137 ) ( ON ?auto_153139 ?auto_153138 ) ( ON ?auto_153140 ?auto_153139 ) ( CLEAR ?auto_153140 ) ( HOLDING ?auto_153141 ) ( CLEAR ?auto_153142 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_153142 ?auto_153141 )
      ( MAKE-6PILE ?auto_153135 ?auto_153136 ?auto_153137 ?auto_153138 ?auto_153139 ?auto_153140 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153144 - BLOCK
      ?auto_153145 - BLOCK
      ?auto_153146 - BLOCK
      ?auto_153147 - BLOCK
      ?auto_153148 - BLOCK
      ?auto_153149 - BLOCK
    )
    :vars
    (
      ?auto_153151 - BLOCK
      ?auto_153152 - BLOCK
      ?auto_153150 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153144 ?auto_153145 ) ) ( not ( = ?auto_153144 ?auto_153146 ) ) ( not ( = ?auto_153144 ?auto_153147 ) ) ( not ( = ?auto_153144 ?auto_153148 ) ) ( not ( = ?auto_153144 ?auto_153149 ) ) ( not ( = ?auto_153145 ?auto_153146 ) ) ( not ( = ?auto_153145 ?auto_153147 ) ) ( not ( = ?auto_153145 ?auto_153148 ) ) ( not ( = ?auto_153145 ?auto_153149 ) ) ( not ( = ?auto_153146 ?auto_153147 ) ) ( not ( = ?auto_153146 ?auto_153148 ) ) ( not ( = ?auto_153146 ?auto_153149 ) ) ( not ( = ?auto_153147 ?auto_153148 ) ) ( not ( = ?auto_153147 ?auto_153149 ) ) ( not ( = ?auto_153148 ?auto_153149 ) ) ( not ( = ?auto_153144 ?auto_153151 ) ) ( not ( = ?auto_153145 ?auto_153151 ) ) ( not ( = ?auto_153146 ?auto_153151 ) ) ( not ( = ?auto_153147 ?auto_153151 ) ) ( not ( = ?auto_153148 ?auto_153151 ) ) ( not ( = ?auto_153149 ?auto_153151 ) ) ( ON-TABLE ?auto_153152 ) ( not ( = ?auto_153152 ?auto_153151 ) ) ( not ( = ?auto_153152 ?auto_153149 ) ) ( not ( = ?auto_153152 ?auto_153148 ) ) ( not ( = ?auto_153144 ?auto_153152 ) ) ( not ( = ?auto_153145 ?auto_153152 ) ) ( not ( = ?auto_153146 ?auto_153152 ) ) ( not ( = ?auto_153147 ?auto_153152 ) ) ( ON ?auto_153144 ?auto_153150 ) ( not ( = ?auto_153144 ?auto_153150 ) ) ( not ( = ?auto_153145 ?auto_153150 ) ) ( not ( = ?auto_153146 ?auto_153150 ) ) ( not ( = ?auto_153147 ?auto_153150 ) ) ( not ( = ?auto_153148 ?auto_153150 ) ) ( not ( = ?auto_153149 ?auto_153150 ) ) ( not ( = ?auto_153151 ?auto_153150 ) ) ( not ( = ?auto_153152 ?auto_153150 ) ) ( ON ?auto_153145 ?auto_153144 ) ( ON-TABLE ?auto_153150 ) ( ON ?auto_153146 ?auto_153145 ) ( ON ?auto_153147 ?auto_153146 ) ( ON ?auto_153148 ?auto_153147 ) ( ON ?auto_153149 ?auto_153148 ) ( CLEAR ?auto_153152 ) ( ON ?auto_153151 ?auto_153149 ) ( CLEAR ?auto_153151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_153150 ?auto_153144 ?auto_153145 ?auto_153146 ?auto_153147 ?auto_153148 ?auto_153149 )
      ( MAKE-6PILE ?auto_153144 ?auto_153145 ?auto_153146 ?auto_153147 ?auto_153148 ?auto_153149 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153153 - BLOCK
      ?auto_153154 - BLOCK
      ?auto_153155 - BLOCK
      ?auto_153156 - BLOCK
      ?auto_153157 - BLOCK
      ?auto_153158 - BLOCK
    )
    :vars
    (
      ?auto_153160 - BLOCK
      ?auto_153161 - BLOCK
      ?auto_153159 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153153 ?auto_153154 ) ) ( not ( = ?auto_153153 ?auto_153155 ) ) ( not ( = ?auto_153153 ?auto_153156 ) ) ( not ( = ?auto_153153 ?auto_153157 ) ) ( not ( = ?auto_153153 ?auto_153158 ) ) ( not ( = ?auto_153154 ?auto_153155 ) ) ( not ( = ?auto_153154 ?auto_153156 ) ) ( not ( = ?auto_153154 ?auto_153157 ) ) ( not ( = ?auto_153154 ?auto_153158 ) ) ( not ( = ?auto_153155 ?auto_153156 ) ) ( not ( = ?auto_153155 ?auto_153157 ) ) ( not ( = ?auto_153155 ?auto_153158 ) ) ( not ( = ?auto_153156 ?auto_153157 ) ) ( not ( = ?auto_153156 ?auto_153158 ) ) ( not ( = ?auto_153157 ?auto_153158 ) ) ( not ( = ?auto_153153 ?auto_153160 ) ) ( not ( = ?auto_153154 ?auto_153160 ) ) ( not ( = ?auto_153155 ?auto_153160 ) ) ( not ( = ?auto_153156 ?auto_153160 ) ) ( not ( = ?auto_153157 ?auto_153160 ) ) ( not ( = ?auto_153158 ?auto_153160 ) ) ( not ( = ?auto_153161 ?auto_153160 ) ) ( not ( = ?auto_153161 ?auto_153158 ) ) ( not ( = ?auto_153161 ?auto_153157 ) ) ( not ( = ?auto_153153 ?auto_153161 ) ) ( not ( = ?auto_153154 ?auto_153161 ) ) ( not ( = ?auto_153155 ?auto_153161 ) ) ( not ( = ?auto_153156 ?auto_153161 ) ) ( ON ?auto_153153 ?auto_153159 ) ( not ( = ?auto_153153 ?auto_153159 ) ) ( not ( = ?auto_153154 ?auto_153159 ) ) ( not ( = ?auto_153155 ?auto_153159 ) ) ( not ( = ?auto_153156 ?auto_153159 ) ) ( not ( = ?auto_153157 ?auto_153159 ) ) ( not ( = ?auto_153158 ?auto_153159 ) ) ( not ( = ?auto_153160 ?auto_153159 ) ) ( not ( = ?auto_153161 ?auto_153159 ) ) ( ON ?auto_153154 ?auto_153153 ) ( ON-TABLE ?auto_153159 ) ( ON ?auto_153155 ?auto_153154 ) ( ON ?auto_153156 ?auto_153155 ) ( ON ?auto_153157 ?auto_153156 ) ( ON ?auto_153158 ?auto_153157 ) ( ON ?auto_153160 ?auto_153158 ) ( CLEAR ?auto_153160 ) ( HOLDING ?auto_153161 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_153161 )
      ( MAKE-6PILE ?auto_153153 ?auto_153154 ?auto_153155 ?auto_153156 ?auto_153157 ?auto_153158 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153162 - BLOCK
      ?auto_153163 - BLOCK
      ?auto_153164 - BLOCK
      ?auto_153165 - BLOCK
      ?auto_153166 - BLOCK
      ?auto_153167 - BLOCK
    )
    :vars
    (
      ?auto_153168 - BLOCK
      ?auto_153169 - BLOCK
      ?auto_153170 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153162 ?auto_153163 ) ) ( not ( = ?auto_153162 ?auto_153164 ) ) ( not ( = ?auto_153162 ?auto_153165 ) ) ( not ( = ?auto_153162 ?auto_153166 ) ) ( not ( = ?auto_153162 ?auto_153167 ) ) ( not ( = ?auto_153163 ?auto_153164 ) ) ( not ( = ?auto_153163 ?auto_153165 ) ) ( not ( = ?auto_153163 ?auto_153166 ) ) ( not ( = ?auto_153163 ?auto_153167 ) ) ( not ( = ?auto_153164 ?auto_153165 ) ) ( not ( = ?auto_153164 ?auto_153166 ) ) ( not ( = ?auto_153164 ?auto_153167 ) ) ( not ( = ?auto_153165 ?auto_153166 ) ) ( not ( = ?auto_153165 ?auto_153167 ) ) ( not ( = ?auto_153166 ?auto_153167 ) ) ( not ( = ?auto_153162 ?auto_153168 ) ) ( not ( = ?auto_153163 ?auto_153168 ) ) ( not ( = ?auto_153164 ?auto_153168 ) ) ( not ( = ?auto_153165 ?auto_153168 ) ) ( not ( = ?auto_153166 ?auto_153168 ) ) ( not ( = ?auto_153167 ?auto_153168 ) ) ( not ( = ?auto_153169 ?auto_153168 ) ) ( not ( = ?auto_153169 ?auto_153167 ) ) ( not ( = ?auto_153169 ?auto_153166 ) ) ( not ( = ?auto_153162 ?auto_153169 ) ) ( not ( = ?auto_153163 ?auto_153169 ) ) ( not ( = ?auto_153164 ?auto_153169 ) ) ( not ( = ?auto_153165 ?auto_153169 ) ) ( ON ?auto_153162 ?auto_153170 ) ( not ( = ?auto_153162 ?auto_153170 ) ) ( not ( = ?auto_153163 ?auto_153170 ) ) ( not ( = ?auto_153164 ?auto_153170 ) ) ( not ( = ?auto_153165 ?auto_153170 ) ) ( not ( = ?auto_153166 ?auto_153170 ) ) ( not ( = ?auto_153167 ?auto_153170 ) ) ( not ( = ?auto_153168 ?auto_153170 ) ) ( not ( = ?auto_153169 ?auto_153170 ) ) ( ON ?auto_153163 ?auto_153162 ) ( ON-TABLE ?auto_153170 ) ( ON ?auto_153164 ?auto_153163 ) ( ON ?auto_153165 ?auto_153164 ) ( ON ?auto_153166 ?auto_153165 ) ( ON ?auto_153167 ?auto_153166 ) ( ON ?auto_153168 ?auto_153167 ) ( ON ?auto_153169 ?auto_153168 ) ( CLEAR ?auto_153169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_153170 ?auto_153162 ?auto_153163 ?auto_153164 ?auto_153165 ?auto_153166 ?auto_153167 ?auto_153168 )
      ( MAKE-6PILE ?auto_153162 ?auto_153163 ?auto_153164 ?auto_153165 ?auto_153166 ?auto_153167 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_153172 - BLOCK
    )
    :vars
    (
      ?auto_153173 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153173 ?auto_153172 ) ( CLEAR ?auto_153173 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_153172 ) ( not ( = ?auto_153172 ?auto_153173 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_153173 ?auto_153172 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_153174 - BLOCK
    )
    :vars
    (
      ?auto_153175 - BLOCK
      ?auto_153176 - BLOCK
      ?auto_153177 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153175 ?auto_153174 ) ( CLEAR ?auto_153175 ) ( ON-TABLE ?auto_153174 ) ( not ( = ?auto_153174 ?auto_153175 ) ) ( HOLDING ?auto_153176 ) ( CLEAR ?auto_153177 ) ( not ( = ?auto_153174 ?auto_153176 ) ) ( not ( = ?auto_153174 ?auto_153177 ) ) ( not ( = ?auto_153175 ?auto_153176 ) ) ( not ( = ?auto_153175 ?auto_153177 ) ) ( not ( = ?auto_153176 ?auto_153177 ) ) )
    :subtasks
    ( ( !STACK ?auto_153176 ?auto_153177 )
      ( MAKE-1PILE ?auto_153174 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_153178 - BLOCK
    )
    :vars
    (
      ?auto_153179 - BLOCK
      ?auto_153181 - BLOCK
      ?auto_153180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153179 ?auto_153178 ) ( ON-TABLE ?auto_153178 ) ( not ( = ?auto_153178 ?auto_153179 ) ) ( CLEAR ?auto_153181 ) ( not ( = ?auto_153178 ?auto_153180 ) ) ( not ( = ?auto_153178 ?auto_153181 ) ) ( not ( = ?auto_153179 ?auto_153180 ) ) ( not ( = ?auto_153179 ?auto_153181 ) ) ( not ( = ?auto_153180 ?auto_153181 ) ) ( ON ?auto_153180 ?auto_153179 ) ( CLEAR ?auto_153180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_153178 ?auto_153179 )
      ( MAKE-1PILE ?auto_153178 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_153182 - BLOCK
    )
    :vars
    (
      ?auto_153184 - BLOCK
      ?auto_153183 - BLOCK
      ?auto_153185 - BLOCK
      ?auto_153189 - BLOCK
      ?auto_153186 - BLOCK
      ?auto_153187 - BLOCK
      ?auto_153188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153184 ?auto_153182 ) ( ON-TABLE ?auto_153182 ) ( not ( = ?auto_153182 ?auto_153184 ) ) ( not ( = ?auto_153182 ?auto_153183 ) ) ( not ( = ?auto_153182 ?auto_153185 ) ) ( not ( = ?auto_153184 ?auto_153183 ) ) ( not ( = ?auto_153184 ?auto_153185 ) ) ( not ( = ?auto_153183 ?auto_153185 ) ) ( ON ?auto_153183 ?auto_153184 ) ( CLEAR ?auto_153183 ) ( HOLDING ?auto_153185 ) ( CLEAR ?auto_153189 ) ( ON-TABLE ?auto_153186 ) ( ON ?auto_153187 ?auto_153186 ) ( ON ?auto_153188 ?auto_153187 ) ( ON ?auto_153189 ?auto_153188 ) ( not ( = ?auto_153186 ?auto_153187 ) ) ( not ( = ?auto_153186 ?auto_153188 ) ) ( not ( = ?auto_153186 ?auto_153189 ) ) ( not ( = ?auto_153186 ?auto_153185 ) ) ( not ( = ?auto_153187 ?auto_153188 ) ) ( not ( = ?auto_153187 ?auto_153189 ) ) ( not ( = ?auto_153187 ?auto_153185 ) ) ( not ( = ?auto_153188 ?auto_153189 ) ) ( not ( = ?auto_153188 ?auto_153185 ) ) ( not ( = ?auto_153189 ?auto_153185 ) ) ( not ( = ?auto_153182 ?auto_153189 ) ) ( not ( = ?auto_153182 ?auto_153186 ) ) ( not ( = ?auto_153182 ?auto_153187 ) ) ( not ( = ?auto_153182 ?auto_153188 ) ) ( not ( = ?auto_153184 ?auto_153189 ) ) ( not ( = ?auto_153184 ?auto_153186 ) ) ( not ( = ?auto_153184 ?auto_153187 ) ) ( not ( = ?auto_153184 ?auto_153188 ) ) ( not ( = ?auto_153183 ?auto_153189 ) ) ( not ( = ?auto_153183 ?auto_153186 ) ) ( not ( = ?auto_153183 ?auto_153187 ) ) ( not ( = ?auto_153183 ?auto_153188 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_153186 ?auto_153187 ?auto_153188 ?auto_153189 ?auto_153185 )
      ( MAKE-1PILE ?auto_153182 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_153190 - BLOCK
    )
    :vars
    (
      ?auto_153194 - BLOCK
      ?auto_153191 - BLOCK
      ?auto_153197 - BLOCK
      ?auto_153192 - BLOCK
      ?auto_153196 - BLOCK
      ?auto_153195 - BLOCK
      ?auto_153193 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153194 ?auto_153190 ) ( ON-TABLE ?auto_153190 ) ( not ( = ?auto_153190 ?auto_153194 ) ) ( not ( = ?auto_153190 ?auto_153191 ) ) ( not ( = ?auto_153190 ?auto_153197 ) ) ( not ( = ?auto_153194 ?auto_153191 ) ) ( not ( = ?auto_153194 ?auto_153197 ) ) ( not ( = ?auto_153191 ?auto_153197 ) ) ( ON ?auto_153191 ?auto_153194 ) ( CLEAR ?auto_153192 ) ( ON-TABLE ?auto_153196 ) ( ON ?auto_153195 ?auto_153196 ) ( ON ?auto_153193 ?auto_153195 ) ( ON ?auto_153192 ?auto_153193 ) ( not ( = ?auto_153196 ?auto_153195 ) ) ( not ( = ?auto_153196 ?auto_153193 ) ) ( not ( = ?auto_153196 ?auto_153192 ) ) ( not ( = ?auto_153196 ?auto_153197 ) ) ( not ( = ?auto_153195 ?auto_153193 ) ) ( not ( = ?auto_153195 ?auto_153192 ) ) ( not ( = ?auto_153195 ?auto_153197 ) ) ( not ( = ?auto_153193 ?auto_153192 ) ) ( not ( = ?auto_153193 ?auto_153197 ) ) ( not ( = ?auto_153192 ?auto_153197 ) ) ( not ( = ?auto_153190 ?auto_153192 ) ) ( not ( = ?auto_153190 ?auto_153196 ) ) ( not ( = ?auto_153190 ?auto_153195 ) ) ( not ( = ?auto_153190 ?auto_153193 ) ) ( not ( = ?auto_153194 ?auto_153192 ) ) ( not ( = ?auto_153194 ?auto_153196 ) ) ( not ( = ?auto_153194 ?auto_153195 ) ) ( not ( = ?auto_153194 ?auto_153193 ) ) ( not ( = ?auto_153191 ?auto_153192 ) ) ( not ( = ?auto_153191 ?auto_153196 ) ) ( not ( = ?auto_153191 ?auto_153195 ) ) ( not ( = ?auto_153191 ?auto_153193 ) ) ( ON ?auto_153197 ?auto_153191 ) ( CLEAR ?auto_153197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_153190 ?auto_153194 ?auto_153191 )
      ( MAKE-1PILE ?auto_153190 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_153198 - BLOCK
    )
    :vars
    (
      ?auto_153200 - BLOCK
      ?auto_153205 - BLOCK
      ?auto_153204 - BLOCK
      ?auto_153203 - BLOCK
      ?auto_153199 - BLOCK
      ?auto_153201 - BLOCK
      ?auto_153202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153200 ?auto_153198 ) ( ON-TABLE ?auto_153198 ) ( not ( = ?auto_153198 ?auto_153200 ) ) ( not ( = ?auto_153198 ?auto_153205 ) ) ( not ( = ?auto_153198 ?auto_153204 ) ) ( not ( = ?auto_153200 ?auto_153205 ) ) ( not ( = ?auto_153200 ?auto_153204 ) ) ( not ( = ?auto_153205 ?auto_153204 ) ) ( ON ?auto_153205 ?auto_153200 ) ( ON-TABLE ?auto_153203 ) ( ON ?auto_153199 ?auto_153203 ) ( ON ?auto_153201 ?auto_153199 ) ( not ( = ?auto_153203 ?auto_153199 ) ) ( not ( = ?auto_153203 ?auto_153201 ) ) ( not ( = ?auto_153203 ?auto_153202 ) ) ( not ( = ?auto_153203 ?auto_153204 ) ) ( not ( = ?auto_153199 ?auto_153201 ) ) ( not ( = ?auto_153199 ?auto_153202 ) ) ( not ( = ?auto_153199 ?auto_153204 ) ) ( not ( = ?auto_153201 ?auto_153202 ) ) ( not ( = ?auto_153201 ?auto_153204 ) ) ( not ( = ?auto_153202 ?auto_153204 ) ) ( not ( = ?auto_153198 ?auto_153202 ) ) ( not ( = ?auto_153198 ?auto_153203 ) ) ( not ( = ?auto_153198 ?auto_153199 ) ) ( not ( = ?auto_153198 ?auto_153201 ) ) ( not ( = ?auto_153200 ?auto_153202 ) ) ( not ( = ?auto_153200 ?auto_153203 ) ) ( not ( = ?auto_153200 ?auto_153199 ) ) ( not ( = ?auto_153200 ?auto_153201 ) ) ( not ( = ?auto_153205 ?auto_153202 ) ) ( not ( = ?auto_153205 ?auto_153203 ) ) ( not ( = ?auto_153205 ?auto_153199 ) ) ( not ( = ?auto_153205 ?auto_153201 ) ) ( ON ?auto_153204 ?auto_153205 ) ( CLEAR ?auto_153204 ) ( HOLDING ?auto_153202 ) ( CLEAR ?auto_153201 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_153203 ?auto_153199 ?auto_153201 ?auto_153202 )
      ( MAKE-1PILE ?auto_153198 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_153206 - BLOCK
    )
    :vars
    (
      ?auto_153211 - BLOCK
      ?auto_153213 - BLOCK
      ?auto_153207 - BLOCK
      ?auto_153212 - BLOCK
      ?auto_153210 - BLOCK
      ?auto_153208 - BLOCK
      ?auto_153209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153211 ?auto_153206 ) ( ON-TABLE ?auto_153206 ) ( not ( = ?auto_153206 ?auto_153211 ) ) ( not ( = ?auto_153206 ?auto_153213 ) ) ( not ( = ?auto_153206 ?auto_153207 ) ) ( not ( = ?auto_153211 ?auto_153213 ) ) ( not ( = ?auto_153211 ?auto_153207 ) ) ( not ( = ?auto_153213 ?auto_153207 ) ) ( ON ?auto_153213 ?auto_153211 ) ( ON-TABLE ?auto_153212 ) ( ON ?auto_153210 ?auto_153212 ) ( ON ?auto_153208 ?auto_153210 ) ( not ( = ?auto_153212 ?auto_153210 ) ) ( not ( = ?auto_153212 ?auto_153208 ) ) ( not ( = ?auto_153212 ?auto_153209 ) ) ( not ( = ?auto_153212 ?auto_153207 ) ) ( not ( = ?auto_153210 ?auto_153208 ) ) ( not ( = ?auto_153210 ?auto_153209 ) ) ( not ( = ?auto_153210 ?auto_153207 ) ) ( not ( = ?auto_153208 ?auto_153209 ) ) ( not ( = ?auto_153208 ?auto_153207 ) ) ( not ( = ?auto_153209 ?auto_153207 ) ) ( not ( = ?auto_153206 ?auto_153209 ) ) ( not ( = ?auto_153206 ?auto_153212 ) ) ( not ( = ?auto_153206 ?auto_153210 ) ) ( not ( = ?auto_153206 ?auto_153208 ) ) ( not ( = ?auto_153211 ?auto_153209 ) ) ( not ( = ?auto_153211 ?auto_153212 ) ) ( not ( = ?auto_153211 ?auto_153210 ) ) ( not ( = ?auto_153211 ?auto_153208 ) ) ( not ( = ?auto_153213 ?auto_153209 ) ) ( not ( = ?auto_153213 ?auto_153212 ) ) ( not ( = ?auto_153213 ?auto_153210 ) ) ( not ( = ?auto_153213 ?auto_153208 ) ) ( ON ?auto_153207 ?auto_153213 ) ( CLEAR ?auto_153208 ) ( ON ?auto_153209 ?auto_153207 ) ( CLEAR ?auto_153209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_153206 ?auto_153211 ?auto_153213 ?auto_153207 )
      ( MAKE-1PILE ?auto_153206 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_153214 - BLOCK
    )
    :vars
    (
      ?auto_153220 - BLOCK
      ?auto_153216 - BLOCK
      ?auto_153217 - BLOCK
      ?auto_153215 - BLOCK
      ?auto_153219 - BLOCK
      ?auto_153218 - BLOCK
      ?auto_153221 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153220 ?auto_153214 ) ( ON-TABLE ?auto_153214 ) ( not ( = ?auto_153214 ?auto_153220 ) ) ( not ( = ?auto_153214 ?auto_153216 ) ) ( not ( = ?auto_153214 ?auto_153217 ) ) ( not ( = ?auto_153220 ?auto_153216 ) ) ( not ( = ?auto_153220 ?auto_153217 ) ) ( not ( = ?auto_153216 ?auto_153217 ) ) ( ON ?auto_153216 ?auto_153220 ) ( ON-TABLE ?auto_153215 ) ( ON ?auto_153219 ?auto_153215 ) ( not ( = ?auto_153215 ?auto_153219 ) ) ( not ( = ?auto_153215 ?auto_153218 ) ) ( not ( = ?auto_153215 ?auto_153221 ) ) ( not ( = ?auto_153215 ?auto_153217 ) ) ( not ( = ?auto_153219 ?auto_153218 ) ) ( not ( = ?auto_153219 ?auto_153221 ) ) ( not ( = ?auto_153219 ?auto_153217 ) ) ( not ( = ?auto_153218 ?auto_153221 ) ) ( not ( = ?auto_153218 ?auto_153217 ) ) ( not ( = ?auto_153221 ?auto_153217 ) ) ( not ( = ?auto_153214 ?auto_153221 ) ) ( not ( = ?auto_153214 ?auto_153215 ) ) ( not ( = ?auto_153214 ?auto_153219 ) ) ( not ( = ?auto_153214 ?auto_153218 ) ) ( not ( = ?auto_153220 ?auto_153221 ) ) ( not ( = ?auto_153220 ?auto_153215 ) ) ( not ( = ?auto_153220 ?auto_153219 ) ) ( not ( = ?auto_153220 ?auto_153218 ) ) ( not ( = ?auto_153216 ?auto_153221 ) ) ( not ( = ?auto_153216 ?auto_153215 ) ) ( not ( = ?auto_153216 ?auto_153219 ) ) ( not ( = ?auto_153216 ?auto_153218 ) ) ( ON ?auto_153217 ?auto_153216 ) ( ON ?auto_153221 ?auto_153217 ) ( CLEAR ?auto_153221 ) ( HOLDING ?auto_153218 ) ( CLEAR ?auto_153219 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_153215 ?auto_153219 ?auto_153218 )
      ( MAKE-1PILE ?auto_153214 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_153222 - BLOCK
    )
    :vars
    (
      ?auto_153229 - BLOCK
      ?auto_153224 - BLOCK
      ?auto_153225 - BLOCK
      ?auto_153226 - BLOCK
      ?auto_153227 - BLOCK
      ?auto_153228 - BLOCK
      ?auto_153223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153229 ?auto_153222 ) ( ON-TABLE ?auto_153222 ) ( not ( = ?auto_153222 ?auto_153229 ) ) ( not ( = ?auto_153222 ?auto_153224 ) ) ( not ( = ?auto_153222 ?auto_153225 ) ) ( not ( = ?auto_153229 ?auto_153224 ) ) ( not ( = ?auto_153229 ?auto_153225 ) ) ( not ( = ?auto_153224 ?auto_153225 ) ) ( ON ?auto_153224 ?auto_153229 ) ( ON-TABLE ?auto_153226 ) ( ON ?auto_153227 ?auto_153226 ) ( not ( = ?auto_153226 ?auto_153227 ) ) ( not ( = ?auto_153226 ?auto_153228 ) ) ( not ( = ?auto_153226 ?auto_153223 ) ) ( not ( = ?auto_153226 ?auto_153225 ) ) ( not ( = ?auto_153227 ?auto_153228 ) ) ( not ( = ?auto_153227 ?auto_153223 ) ) ( not ( = ?auto_153227 ?auto_153225 ) ) ( not ( = ?auto_153228 ?auto_153223 ) ) ( not ( = ?auto_153228 ?auto_153225 ) ) ( not ( = ?auto_153223 ?auto_153225 ) ) ( not ( = ?auto_153222 ?auto_153223 ) ) ( not ( = ?auto_153222 ?auto_153226 ) ) ( not ( = ?auto_153222 ?auto_153227 ) ) ( not ( = ?auto_153222 ?auto_153228 ) ) ( not ( = ?auto_153229 ?auto_153223 ) ) ( not ( = ?auto_153229 ?auto_153226 ) ) ( not ( = ?auto_153229 ?auto_153227 ) ) ( not ( = ?auto_153229 ?auto_153228 ) ) ( not ( = ?auto_153224 ?auto_153223 ) ) ( not ( = ?auto_153224 ?auto_153226 ) ) ( not ( = ?auto_153224 ?auto_153227 ) ) ( not ( = ?auto_153224 ?auto_153228 ) ) ( ON ?auto_153225 ?auto_153224 ) ( ON ?auto_153223 ?auto_153225 ) ( CLEAR ?auto_153227 ) ( ON ?auto_153228 ?auto_153223 ) ( CLEAR ?auto_153228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_153222 ?auto_153229 ?auto_153224 ?auto_153225 ?auto_153223 )
      ( MAKE-1PILE ?auto_153222 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_153230 - BLOCK
    )
    :vars
    (
      ?auto_153232 - BLOCK
      ?auto_153231 - BLOCK
      ?auto_153236 - BLOCK
      ?auto_153235 - BLOCK
      ?auto_153234 - BLOCK
      ?auto_153237 - BLOCK
      ?auto_153233 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153232 ?auto_153230 ) ( ON-TABLE ?auto_153230 ) ( not ( = ?auto_153230 ?auto_153232 ) ) ( not ( = ?auto_153230 ?auto_153231 ) ) ( not ( = ?auto_153230 ?auto_153236 ) ) ( not ( = ?auto_153232 ?auto_153231 ) ) ( not ( = ?auto_153232 ?auto_153236 ) ) ( not ( = ?auto_153231 ?auto_153236 ) ) ( ON ?auto_153231 ?auto_153232 ) ( ON-TABLE ?auto_153235 ) ( not ( = ?auto_153235 ?auto_153234 ) ) ( not ( = ?auto_153235 ?auto_153237 ) ) ( not ( = ?auto_153235 ?auto_153233 ) ) ( not ( = ?auto_153235 ?auto_153236 ) ) ( not ( = ?auto_153234 ?auto_153237 ) ) ( not ( = ?auto_153234 ?auto_153233 ) ) ( not ( = ?auto_153234 ?auto_153236 ) ) ( not ( = ?auto_153237 ?auto_153233 ) ) ( not ( = ?auto_153237 ?auto_153236 ) ) ( not ( = ?auto_153233 ?auto_153236 ) ) ( not ( = ?auto_153230 ?auto_153233 ) ) ( not ( = ?auto_153230 ?auto_153235 ) ) ( not ( = ?auto_153230 ?auto_153234 ) ) ( not ( = ?auto_153230 ?auto_153237 ) ) ( not ( = ?auto_153232 ?auto_153233 ) ) ( not ( = ?auto_153232 ?auto_153235 ) ) ( not ( = ?auto_153232 ?auto_153234 ) ) ( not ( = ?auto_153232 ?auto_153237 ) ) ( not ( = ?auto_153231 ?auto_153233 ) ) ( not ( = ?auto_153231 ?auto_153235 ) ) ( not ( = ?auto_153231 ?auto_153234 ) ) ( not ( = ?auto_153231 ?auto_153237 ) ) ( ON ?auto_153236 ?auto_153231 ) ( ON ?auto_153233 ?auto_153236 ) ( ON ?auto_153237 ?auto_153233 ) ( CLEAR ?auto_153237 ) ( HOLDING ?auto_153234 ) ( CLEAR ?auto_153235 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_153235 ?auto_153234 )
      ( MAKE-1PILE ?auto_153230 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_153238 - BLOCK
    )
    :vars
    (
      ?auto_153239 - BLOCK
      ?auto_153245 - BLOCK
      ?auto_153242 - BLOCK
      ?auto_153244 - BLOCK
      ?auto_153240 - BLOCK
      ?auto_153243 - BLOCK
      ?auto_153241 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153239 ?auto_153238 ) ( ON-TABLE ?auto_153238 ) ( not ( = ?auto_153238 ?auto_153239 ) ) ( not ( = ?auto_153238 ?auto_153245 ) ) ( not ( = ?auto_153238 ?auto_153242 ) ) ( not ( = ?auto_153239 ?auto_153245 ) ) ( not ( = ?auto_153239 ?auto_153242 ) ) ( not ( = ?auto_153245 ?auto_153242 ) ) ( ON ?auto_153245 ?auto_153239 ) ( ON-TABLE ?auto_153244 ) ( not ( = ?auto_153244 ?auto_153240 ) ) ( not ( = ?auto_153244 ?auto_153243 ) ) ( not ( = ?auto_153244 ?auto_153241 ) ) ( not ( = ?auto_153244 ?auto_153242 ) ) ( not ( = ?auto_153240 ?auto_153243 ) ) ( not ( = ?auto_153240 ?auto_153241 ) ) ( not ( = ?auto_153240 ?auto_153242 ) ) ( not ( = ?auto_153243 ?auto_153241 ) ) ( not ( = ?auto_153243 ?auto_153242 ) ) ( not ( = ?auto_153241 ?auto_153242 ) ) ( not ( = ?auto_153238 ?auto_153241 ) ) ( not ( = ?auto_153238 ?auto_153244 ) ) ( not ( = ?auto_153238 ?auto_153240 ) ) ( not ( = ?auto_153238 ?auto_153243 ) ) ( not ( = ?auto_153239 ?auto_153241 ) ) ( not ( = ?auto_153239 ?auto_153244 ) ) ( not ( = ?auto_153239 ?auto_153240 ) ) ( not ( = ?auto_153239 ?auto_153243 ) ) ( not ( = ?auto_153245 ?auto_153241 ) ) ( not ( = ?auto_153245 ?auto_153244 ) ) ( not ( = ?auto_153245 ?auto_153240 ) ) ( not ( = ?auto_153245 ?auto_153243 ) ) ( ON ?auto_153242 ?auto_153245 ) ( ON ?auto_153241 ?auto_153242 ) ( ON ?auto_153243 ?auto_153241 ) ( CLEAR ?auto_153244 ) ( ON ?auto_153240 ?auto_153243 ) ( CLEAR ?auto_153240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_153238 ?auto_153239 ?auto_153245 ?auto_153242 ?auto_153241 ?auto_153243 )
      ( MAKE-1PILE ?auto_153238 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_153246 - BLOCK
    )
    :vars
    (
      ?auto_153248 - BLOCK
      ?auto_153247 - BLOCK
      ?auto_153253 - BLOCK
      ?auto_153252 - BLOCK
      ?auto_153251 - BLOCK
      ?auto_153250 - BLOCK
      ?auto_153249 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153248 ?auto_153246 ) ( ON-TABLE ?auto_153246 ) ( not ( = ?auto_153246 ?auto_153248 ) ) ( not ( = ?auto_153246 ?auto_153247 ) ) ( not ( = ?auto_153246 ?auto_153253 ) ) ( not ( = ?auto_153248 ?auto_153247 ) ) ( not ( = ?auto_153248 ?auto_153253 ) ) ( not ( = ?auto_153247 ?auto_153253 ) ) ( ON ?auto_153247 ?auto_153248 ) ( not ( = ?auto_153252 ?auto_153251 ) ) ( not ( = ?auto_153252 ?auto_153250 ) ) ( not ( = ?auto_153252 ?auto_153249 ) ) ( not ( = ?auto_153252 ?auto_153253 ) ) ( not ( = ?auto_153251 ?auto_153250 ) ) ( not ( = ?auto_153251 ?auto_153249 ) ) ( not ( = ?auto_153251 ?auto_153253 ) ) ( not ( = ?auto_153250 ?auto_153249 ) ) ( not ( = ?auto_153250 ?auto_153253 ) ) ( not ( = ?auto_153249 ?auto_153253 ) ) ( not ( = ?auto_153246 ?auto_153249 ) ) ( not ( = ?auto_153246 ?auto_153252 ) ) ( not ( = ?auto_153246 ?auto_153251 ) ) ( not ( = ?auto_153246 ?auto_153250 ) ) ( not ( = ?auto_153248 ?auto_153249 ) ) ( not ( = ?auto_153248 ?auto_153252 ) ) ( not ( = ?auto_153248 ?auto_153251 ) ) ( not ( = ?auto_153248 ?auto_153250 ) ) ( not ( = ?auto_153247 ?auto_153249 ) ) ( not ( = ?auto_153247 ?auto_153252 ) ) ( not ( = ?auto_153247 ?auto_153251 ) ) ( not ( = ?auto_153247 ?auto_153250 ) ) ( ON ?auto_153253 ?auto_153247 ) ( ON ?auto_153249 ?auto_153253 ) ( ON ?auto_153250 ?auto_153249 ) ( ON ?auto_153251 ?auto_153250 ) ( CLEAR ?auto_153251 ) ( HOLDING ?auto_153252 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_153252 )
      ( MAKE-1PILE ?auto_153246 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_153254 - BLOCK
    )
    :vars
    (
      ?auto_153260 - BLOCK
      ?auto_153257 - BLOCK
      ?auto_153255 - BLOCK
      ?auto_153261 - BLOCK
      ?auto_153258 - BLOCK
      ?auto_153259 - BLOCK
      ?auto_153256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153260 ?auto_153254 ) ( ON-TABLE ?auto_153254 ) ( not ( = ?auto_153254 ?auto_153260 ) ) ( not ( = ?auto_153254 ?auto_153257 ) ) ( not ( = ?auto_153254 ?auto_153255 ) ) ( not ( = ?auto_153260 ?auto_153257 ) ) ( not ( = ?auto_153260 ?auto_153255 ) ) ( not ( = ?auto_153257 ?auto_153255 ) ) ( ON ?auto_153257 ?auto_153260 ) ( not ( = ?auto_153261 ?auto_153258 ) ) ( not ( = ?auto_153261 ?auto_153259 ) ) ( not ( = ?auto_153261 ?auto_153256 ) ) ( not ( = ?auto_153261 ?auto_153255 ) ) ( not ( = ?auto_153258 ?auto_153259 ) ) ( not ( = ?auto_153258 ?auto_153256 ) ) ( not ( = ?auto_153258 ?auto_153255 ) ) ( not ( = ?auto_153259 ?auto_153256 ) ) ( not ( = ?auto_153259 ?auto_153255 ) ) ( not ( = ?auto_153256 ?auto_153255 ) ) ( not ( = ?auto_153254 ?auto_153256 ) ) ( not ( = ?auto_153254 ?auto_153261 ) ) ( not ( = ?auto_153254 ?auto_153258 ) ) ( not ( = ?auto_153254 ?auto_153259 ) ) ( not ( = ?auto_153260 ?auto_153256 ) ) ( not ( = ?auto_153260 ?auto_153261 ) ) ( not ( = ?auto_153260 ?auto_153258 ) ) ( not ( = ?auto_153260 ?auto_153259 ) ) ( not ( = ?auto_153257 ?auto_153256 ) ) ( not ( = ?auto_153257 ?auto_153261 ) ) ( not ( = ?auto_153257 ?auto_153258 ) ) ( not ( = ?auto_153257 ?auto_153259 ) ) ( ON ?auto_153255 ?auto_153257 ) ( ON ?auto_153256 ?auto_153255 ) ( ON ?auto_153259 ?auto_153256 ) ( ON ?auto_153258 ?auto_153259 ) ( ON ?auto_153261 ?auto_153258 ) ( CLEAR ?auto_153261 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_153254 ?auto_153260 ?auto_153257 ?auto_153255 ?auto_153256 ?auto_153259 ?auto_153258 )
      ( MAKE-1PILE ?auto_153254 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_153262 - BLOCK
    )
    :vars
    (
      ?auto_153268 - BLOCK
      ?auto_153266 - BLOCK
      ?auto_153267 - BLOCK
      ?auto_153264 - BLOCK
      ?auto_153265 - BLOCK
      ?auto_153269 - BLOCK
      ?auto_153263 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153268 ?auto_153262 ) ( ON-TABLE ?auto_153262 ) ( not ( = ?auto_153262 ?auto_153268 ) ) ( not ( = ?auto_153262 ?auto_153266 ) ) ( not ( = ?auto_153262 ?auto_153267 ) ) ( not ( = ?auto_153268 ?auto_153266 ) ) ( not ( = ?auto_153268 ?auto_153267 ) ) ( not ( = ?auto_153266 ?auto_153267 ) ) ( ON ?auto_153266 ?auto_153268 ) ( not ( = ?auto_153264 ?auto_153265 ) ) ( not ( = ?auto_153264 ?auto_153269 ) ) ( not ( = ?auto_153264 ?auto_153263 ) ) ( not ( = ?auto_153264 ?auto_153267 ) ) ( not ( = ?auto_153265 ?auto_153269 ) ) ( not ( = ?auto_153265 ?auto_153263 ) ) ( not ( = ?auto_153265 ?auto_153267 ) ) ( not ( = ?auto_153269 ?auto_153263 ) ) ( not ( = ?auto_153269 ?auto_153267 ) ) ( not ( = ?auto_153263 ?auto_153267 ) ) ( not ( = ?auto_153262 ?auto_153263 ) ) ( not ( = ?auto_153262 ?auto_153264 ) ) ( not ( = ?auto_153262 ?auto_153265 ) ) ( not ( = ?auto_153262 ?auto_153269 ) ) ( not ( = ?auto_153268 ?auto_153263 ) ) ( not ( = ?auto_153268 ?auto_153264 ) ) ( not ( = ?auto_153268 ?auto_153265 ) ) ( not ( = ?auto_153268 ?auto_153269 ) ) ( not ( = ?auto_153266 ?auto_153263 ) ) ( not ( = ?auto_153266 ?auto_153264 ) ) ( not ( = ?auto_153266 ?auto_153265 ) ) ( not ( = ?auto_153266 ?auto_153269 ) ) ( ON ?auto_153267 ?auto_153266 ) ( ON ?auto_153263 ?auto_153267 ) ( ON ?auto_153269 ?auto_153263 ) ( ON ?auto_153265 ?auto_153269 ) ( HOLDING ?auto_153264 ) ( CLEAR ?auto_153265 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_153262 ?auto_153268 ?auto_153266 ?auto_153267 ?auto_153263 ?auto_153269 ?auto_153265 ?auto_153264 )
      ( MAKE-1PILE ?auto_153262 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_153270 - BLOCK
    )
    :vars
    (
      ?auto_153277 - BLOCK
      ?auto_153273 - BLOCK
      ?auto_153276 - BLOCK
      ?auto_153271 - BLOCK
      ?auto_153274 - BLOCK
      ?auto_153275 - BLOCK
      ?auto_153272 - BLOCK
      ?auto_153278 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153277 ?auto_153270 ) ( ON-TABLE ?auto_153270 ) ( not ( = ?auto_153270 ?auto_153277 ) ) ( not ( = ?auto_153270 ?auto_153273 ) ) ( not ( = ?auto_153270 ?auto_153276 ) ) ( not ( = ?auto_153277 ?auto_153273 ) ) ( not ( = ?auto_153277 ?auto_153276 ) ) ( not ( = ?auto_153273 ?auto_153276 ) ) ( ON ?auto_153273 ?auto_153277 ) ( not ( = ?auto_153271 ?auto_153274 ) ) ( not ( = ?auto_153271 ?auto_153275 ) ) ( not ( = ?auto_153271 ?auto_153272 ) ) ( not ( = ?auto_153271 ?auto_153276 ) ) ( not ( = ?auto_153274 ?auto_153275 ) ) ( not ( = ?auto_153274 ?auto_153272 ) ) ( not ( = ?auto_153274 ?auto_153276 ) ) ( not ( = ?auto_153275 ?auto_153272 ) ) ( not ( = ?auto_153275 ?auto_153276 ) ) ( not ( = ?auto_153272 ?auto_153276 ) ) ( not ( = ?auto_153270 ?auto_153272 ) ) ( not ( = ?auto_153270 ?auto_153271 ) ) ( not ( = ?auto_153270 ?auto_153274 ) ) ( not ( = ?auto_153270 ?auto_153275 ) ) ( not ( = ?auto_153277 ?auto_153272 ) ) ( not ( = ?auto_153277 ?auto_153271 ) ) ( not ( = ?auto_153277 ?auto_153274 ) ) ( not ( = ?auto_153277 ?auto_153275 ) ) ( not ( = ?auto_153273 ?auto_153272 ) ) ( not ( = ?auto_153273 ?auto_153271 ) ) ( not ( = ?auto_153273 ?auto_153274 ) ) ( not ( = ?auto_153273 ?auto_153275 ) ) ( ON ?auto_153276 ?auto_153273 ) ( ON ?auto_153272 ?auto_153276 ) ( ON ?auto_153275 ?auto_153272 ) ( ON ?auto_153274 ?auto_153275 ) ( CLEAR ?auto_153274 ) ( ON ?auto_153271 ?auto_153278 ) ( CLEAR ?auto_153271 ) ( HAND-EMPTY ) ( not ( = ?auto_153270 ?auto_153278 ) ) ( not ( = ?auto_153277 ?auto_153278 ) ) ( not ( = ?auto_153273 ?auto_153278 ) ) ( not ( = ?auto_153276 ?auto_153278 ) ) ( not ( = ?auto_153271 ?auto_153278 ) ) ( not ( = ?auto_153274 ?auto_153278 ) ) ( not ( = ?auto_153275 ?auto_153278 ) ) ( not ( = ?auto_153272 ?auto_153278 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_153271 ?auto_153278 )
      ( MAKE-1PILE ?auto_153270 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_153279 - BLOCK
    )
    :vars
    (
      ?auto_153283 - BLOCK
      ?auto_153282 - BLOCK
      ?auto_153286 - BLOCK
      ?auto_153280 - BLOCK
      ?auto_153281 - BLOCK
      ?auto_153285 - BLOCK
      ?auto_153284 - BLOCK
      ?auto_153287 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153283 ?auto_153279 ) ( ON-TABLE ?auto_153279 ) ( not ( = ?auto_153279 ?auto_153283 ) ) ( not ( = ?auto_153279 ?auto_153282 ) ) ( not ( = ?auto_153279 ?auto_153286 ) ) ( not ( = ?auto_153283 ?auto_153282 ) ) ( not ( = ?auto_153283 ?auto_153286 ) ) ( not ( = ?auto_153282 ?auto_153286 ) ) ( ON ?auto_153282 ?auto_153283 ) ( not ( = ?auto_153280 ?auto_153281 ) ) ( not ( = ?auto_153280 ?auto_153285 ) ) ( not ( = ?auto_153280 ?auto_153284 ) ) ( not ( = ?auto_153280 ?auto_153286 ) ) ( not ( = ?auto_153281 ?auto_153285 ) ) ( not ( = ?auto_153281 ?auto_153284 ) ) ( not ( = ?auto_153281 ?auto_153286 ) ) ( not ( = ?auto_153285 ?auto_153284 ) ) ( not ( = ?auto_153285 ?auto_153286 ) ) ( not ( = ?auto_153284 ?auto_153286 ) ) ( not ( = ?auto_153279 ?auto_153284 ) ) ( not ( = ?auto_153279 ?auto_153280 ) ) ( not ( = ?auto_153279 ?auto_153281 ) ) ( not ( = ?auto_153279 ?auto_153285 ) ) ( not ( = ?auto_153283 ?auto_153284 ) ) ( not ( = ?auto_153283 ?auto_153280 ) ) ( not ( = ?auto_153283 ?auto_153281 ) ) ( not ( = ?auto_153283 ?auto_153285 ) ) ( not ( = ?auto_153282 ?auto_153284 ) ) ( not ( = ?auto_153282 ?auto_153280 ) ) ( not ( = ?auto_153282 ?auto_153281 ) ) ( not ( = ?auto_153282 ?auto_153285 ) ) ( ON ?auto_153286 ?auto_153282 ) ( ON ?auto_153284 ?auto_153286 ) ( ON ?auto_153285 ?auto_153284 ) ( ON ?auto_153280 ?auto_153287 ) ( CLEAR ?auto_153280 ) ( not ( = ?auto_153279 ?auto_153287 ) ) ( not ( = ?auto_153283 ?auto_153287 ) ) ( not ( = ?auto_153282 ?auto_153287 ) ) ( not ( = ?auto_153286 ?auto_153287 ) ) ( not ( = ?auto_153280 ?auto_153287 ) ) ( not ( = ?auto_153281 ?auto_153287 ) ) ( not ( = ?auto_153285 ?auto_153287 ) ) ( not ( = ?auto_153284 ?auto_153287 ) ) ( HOLDING ?auto_153281 ) ( CLEAR ?auto_153285 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_153279 ?auto_153283 ?auto_153282 ?auto_153286 ?auto_153284 ?auto_153285 ?auto_153281 )
      ( MAKE-1PILE ?auto_153279 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_153288 - BLOCK
    )
    :vars
    (
      ?auto_153294 - BLOCK
      ?auto_153293 - BLOCK
      ?auto_153292 - BLOCK
      ?auto_153289 - BLOCK
      ?auto_153291 - BLOCK
      ?auto_153290 - BLOCK
      ?auto_153296 - BLOCK
      ?auto_153295 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153294 ?auto_153288 ) ( ON-TABLE ?auto_153288 ) ( not ( = ?auto_153288 ?auto_153294 ) ) ( not ( = ?auto_153288 ?auto_153293 ) ) ( not ( = ?auto_153288 ?auto_153292 ) ) ( not ( = ?auto_153294 ?auto_153293 ) ) ( not ( = ?auto_153294 ?auto_153292 ) ) ( not ( = ?auto_153293 ?auto_153292 ) ) ( ON ?auto_153293 ?auto_153294 ) ( not ( = ?auto_153289 ?auto_153291 ) ) ( not ( = ?auto_153289 ?auto_153290 ) ) ( not ( = ?auto_153289 ?auto_153296 ) ) ( not ( = ?auto_153289 ?auto_153292 ) ) ( not ( = ?auto_153291 ?auto_153290 ) ) ( not ( = ?auto_153291 ?auto_153296 ) ) ( not ( = ?auto_153291 ?auto_153292 ) ) ( not ( = ?auto_153290 ?auto_153296 ) ) ( not ( = ?auto_153290 ?auto_153292 ) ) ( not ( = ?auto_153296 ?auto_153292 ) ) ( not ( = ?auto_153288 ?auto_153296 ) ) ( not ( = ?auto_153288 ?auto_153289 ) ) ( not ( = ?auto_153288 ?auto_153291 ) ) ( not ( = ?auto_153288 ?auto_153290 ) ) ( not ( = ?auto_153294 ?auto_153296 ) ) ( not ( = ?auto_153294 ?auto_153289 ) ) ( not ( = ?auto_153294 ?auto_153291 ) ) ( not ( = ?auto_153294 ?auto_153290 ) ) ( not ( = ?auto_153293 ?auto_153296 ) ) ( not ( = ?auto_153293 ?auto_153289 ) ) ( not ( = ?auto_153293 ?auto_153291 ) ) ( not ( = ?auto_153293 ?auto_153290 ) ) ( ON ?auto_153292 ?auto_153293 ) ( ON ?auto_153296 ?auto_153292 ) ( ON ?auto_153290 ?auto_153296 ) ( ON ?auto_153289 ?auto_153295 ) ( not ( = ?auto_153288 ?auto_153295 ) ) ( not ( = ?auto_153294 ?auto_153295 ) ) ( not ( = ?auto_153293 ?auto_153295 ) ) ( not ( = ?auto_153292 ?auto_153295 ) ) ( not ( = ?auto_153289 ?auto_153295 ) ) ( not ( = ?auto_153291 ?auto_153295 ) ) ( not ( = ?auto_153290 ?auto_153295 ) ) ( not ( = ?auto_153296 ?auto_153295 ) ) ( CLEAR ?auto_153290 ) ( ON ?auto_153291 ?auto_153289 ) ( CLEAR ?auto_153291 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_153295 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_153295 ?auto_153289 )
      ( MAKE-1PILE ?auto_153288 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_153297 - BLOCK
    )
    :vars
    (
      ?auto_153301 - BLOCK
      ?auto_153302 - BLOCK
      ?auto_153305 - BLOCK
      ?auto_153304 - BLOCK
      ?auto_153298 - BLOCK
      ?auto_153299 - BLOCK
      ?auto_153300 - BLOCK
      ?auto_153303 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153301 ?auto_153297 ) ( ON-TABLE ?auto_153297 ) ( not ( = ?auto_153297 ?auto_153301 ) ) ( not ( = ?auto_153297 ?auto_153302 ) ) ( not ( = ?auto_153297 ?auto_153305 ) ) ( not ( = ?auto_153301 ?auto_153302 ) ) ( not ( = ?auto_153301 ?auto_153305 ) ) ( not ( = ?auto_153302 ?auto_153305 ) ) ( ON ?auto_153302 ?auto_153301 ) ( not ( = ?auto_153304 ?auto_153298 ) ) ( not ( = ?auto_153304 ?auto_153299 ) ) ( not ( = ?auto_153304 ?auto_153300 ) ) ( not ( = ?auto_153304 ?auto_153305 ) ) ( not ( = ?auto_153298 ?auto_153299 ) ) ( not ( = ?auto_153298 ?auto_153300 ) ) ( not ( = ?auto_153298 ?auto_153305 ) ) ( not ( = ?auto_153299 ?auto_153300 ) ) ( not ( = ?auto_153299 ?auto_153305 ) ) ( not ( = ?auto_153300 ?auto_153305 ) ) ( not ( = ?auto_153297 ?auto_153300 ) ) ( not ( = ?auto_153297 ?auto_153304 ) ) ( not ( = ?auto_153297 ?auto_153298 ) ) ( not ( = ?auto_153297 ?auto_153299 ) ) ( not ( = ?auto_153301 ?auto_153300 ) ) ( not ( = ?auto_153301 ?auto_153304 ) ) ( not ( = ?auto_153301 ?auto_153298 ) ) ( not ( = ?auto_153301 ?auto_153299 ) ) ( not ( = ?auto_153302 ?auto_153300 ) ) ( not ( = ?auto_153302 ?auto_153304 ) ) ( not ( = ?auto_153302 ?auto_153298 ) ) ( not ( = ?auto_153302 ?auto_153299 ) ) ( ON ?auto_153305 ?auto_153302 ) ( ON ?auto_153300 ?auto_153305 ) ( ON ?auto_153304 ?auto_153303 ) ( not ( = ?auto_153297 ?auto_153303 ) ) ( not ( = ?auto_153301 ?auto_153303 ) ) ( not ( = ?auto_153302 ?auto_153303 ) ) ( not ( = ?auto_153305 ?auto_153303 ) ) ( not ( = ?auto_153304 ?auto_153303 ) ) ( not ( = ?auto_153298 ?auto_153303 ) ) ( not ( = ?auto_153299 ?auto_153303 ) ) ( not ( = ?auto_153300 ?auto_153303 ) ) ( ON ?auto_153298 ?auto_153304 ) ( CLEAR ?auto_153298 ) ( ON-TABLE ?auto_153303 ) ( HOLDING ?auto_153299 ) ( CLEAR ?auto_153300 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_153297 ?auto_153301 ?auto_153302 ?auto_153305 ?auto_153300 ?auto_153299 )
      ( MAKE-1PILE ?auto_153297 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_153306 - BLOCK
    )
    :vars
    (
      ?auto_153311 - BLOCK
      ?auto_153314 - BLOCK
      ?auto_153310 - BLOCK
      ?auto_153313 - BLOCK
      ?auto_153312 - BLOCK
      ?auto_153308 - BLOCK
      ?auto_153309 - BLOCK
      ?auto_153307 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153311 ?auto_153306 ) ( ON-TABLE ?auto_153306 ) ( not ( = ?auto_153306 ?auto_153311 ) ) ( not ( = ?auto_153306 ?auto_153314 ) ) ( not ( = ?auto_153306 ?auto_153310 ) ) ( not ( = ?auto_153311 ?auto_153314 ) ) ( not ( = ?auto_153311 ?auto_153310 ) ) ( not ( = ?auto_153314 ?auto_153310 ) ) ( ON ?auto_153314 ?auto_153311 ) ( not ( = ?auto_153313 ?auto_153312 ) ) ( not ( = ?auto_153313 ?auto_153308 ) ) ( not ( = ?auto_153313 ?auto_153309 ) ) ( not ( = ?auto_153313 ?auto_153310 ) ) ( not ( = ?auto_153312 ?auto_153308 ) ) ( not ( = ?auto_153312 ?auto_153309 ) ) ( not ( = ?auto_153312 ?auto_153310 ) ) ( not ( = ?auto_153308 ?auto_153309 ) ) ( not ( = ?auto_153308 ?auto_153310 ) ) ( not ( = ?auto_153309 ?auto_153310 ) ) ( not ( = ?auto_153306 ?auto_153309 ) ) ( not ( = ?auto_153306 ?auto_153313 ) ) ( not ( = ?auto_153306 ?auto_153312 ) ) ( not ( = ?auto_153306 ?auto_153308 ) ) ( not ( = ?auto_153311 ?auto_153309 ) ) ( not ( = ?auto_153311 ?auto_153313 ) ) ( not ( = ?auto_153311 ?auto_153312 ) ) ( not ( = ?auto_153311 ?auto_153308 ) ) ( not ( = ?auto_153314 ?auto_153309 ) ) ( not ( = ?auto_153314 ?auto_153313 ) ) ( not ( = ?auto_153314 ?auto_153312 ) ) ( not ( = ?auto_153314 ?auto_153308 ) ) ( ON ?auto_153310 ?auto_153314 ) ( ON ?auto_153309 ?auto_153310 ) ( ON ?auto_153313 ?auto_153307 ) ( not ( = ?auto_153306 ?auto_153307 ) ) ( not ( = ?auto_153311 ?auto_153307 ) ) ( not ( = ?auto_153314 ?auto_153307 ) ) ( not ( = ?auto_153310 ?auto_153307 ) ) ( not ( = ?auto_153313 ?auto_153307 ) ) ( not ( = ?auto_153312 ?auto_153307 ) ) ( not ( = ?auto_153308 ?auto_153307 ) ) ( not ( = ?auto_153309 ?auto_153307 ) ) ( ON ?auto_153312 ?auto_153313 ) ( ON-TABLE ?auto_153307 ) ( CLEAR ?auto_153309 ) ( ON ?auto_153308 ?auto_153312 ) ( CLEAR ?auto_153308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_153307 ?auto_153313 ?auto_153312 )
      ( MAKE-1PILE ?auto_153306 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_153315 - BLOCK
    )
    :vars
    (
      ?auto_153317 - BLOCK
      ?auto_153322 - BLOCK
      ?auto_153318 - BLOCK
      ?auto_153320 - BLOCK
      ?auto_153323 - BLOCK
      ?auto_153316 - BLOCK
      ?auto_153319 - BLOCK
      ?auto_153321 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153317 ?auto_153315 ) ( ON-TABLE ?auto_153315 ) ( not ( = ?auto_153315 ?auto_153317 ) ) ( not ( = ?auto_153315 ?auto_153322 ) ) ( not ( = ?auto_153315 ?auto_153318 ) ) ( not ( = ?auto_153317 ?auto_153322 ) ) ( not ( = ?auto_153317 ?auto_153318 ) ) ( not ( = ?auto_153322 ?auto_153318 ) ) ( ON ?auto_153322 ?auto_153317 ) ( not ( = ?auto_153320 ?auto_153323 ) ) ( not ( = ?auto_153320 ?auto_153316 ) ) ( not ( = ?auto_153320 ?auto_153319 ) ) ( not ( = ?auto_153320 ?auto_153318 ) ) ( not ( = ?auto_153323 ?auto_153316 ) ) ( not ( = ?auto_153323 ?auto_153319 ) ) ( not ( = ?auto_153323 ?auto_153318 ) ) ( not ( = ?auto_153316 ?auto_153319 ) ) ( not ( = ?auto_153316 ?auto_153318 ) ) ( not ( = ?auto_153319 ?auto_153318 ) ) ( not ( = ?auto_153315 ?auto_153319 ) ) ( not ( = ?auto_153315 ?auto_153320 ) ) ( not ( = ?auto_153315 ?auto_153323 ) ) ( not ( = ?auto_153315 ?auto_153316 ) ) ( not ( = ?auto_153317 ?auto_153319 ) ) ( not ( = ?auto_153317 ?auto_153320 ) ) ( not ( = ?auto_153317 ?auto_153323 ) ) ( not ( = ?auto_153317 ?auto_153316 ) ) ( not ( = ?auto_153322 ?auto_153319 ) ) ( not ( = ?auto_153322 ?auto_153320 ) ) ( not ( = ?auto_153322 ?auto_153323 ) ) ( not ( = ?auto_153322 ?auto_153316 ) ) ( ON ?auto_153318 ?auto_153322 ) ( ON ?auto_153320 ?auto_153321 ) ( not ( = ?auto_153315 ?auto_153321 ) ) ( not ( = ?auto_153317 ?auto_153321 ) ) ( not ( = ?auto_153322 ?auto_153321 ) ) ( not ( = ?auto_153318 ?auto_153321 ) ) ( not ( = ?auto_153320 ?auto_153321 ) ) ( not ( = ?auto_153323 ?auto_153321 ) ) ( not ( = ?auto_153316 ?auto_153321 ) ) ( not ( = ?auto_153319 ?auto_153321 ) ) ( ON ?auto_153323 ?auto_153320 ) ( ON-TABLE ?auto_153321 ) ( ON ?auto_153316 ?auto_153323 ) ( CLEAR ?auto_153316 ) ( HOLDING ?auto_153319 ) ( CLEAR ?auto_153318 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_153315 ?auto_153317 ?auto_153322 ?auto_153318 ?auto_153319 )
      ( MAKE-1PILE ?auto_153315 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_153324 - BLOCK
    )
    :vars
    (
      ?auto_153326 - BLOCK
      ?auto_153325 - BLOCK
      ?auto_153328 - BLOCK
      ?auto_153330 - BLOCK
      ?auto_153327 - BLOCK
      ?auto_153329 - BLOCK
      ?auto_153331 - BLOCK
      ?auto_153332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153326 ?auto_153324 ) ( ON-TABLE ?auto_153324 ) ( not ( = ?auto_153324 ?auto_153326 ) ) ( not ( = ?auto_153324 ?auto_153325 ) ) ( not ( = ?auto_153324 ?auto_153328 ) ) ( not ( = ?auto_153326 ?auto_153325 ) ) ( not ( = ?auto_153326 ?auto_153328 ) ) ( not ( = ?auto_153325 ?auto_153328 ) ) ( ON ?auto_153325 ?auto_153326 ) ( not ( = ?auto_153330 ?auto_153327 ) ) ( not ( = ?auto_153330 ?auto_153329 ) ) ( not ( = ?auto_153330 ?auto_153331 ) ) ( not ( = ?auto_153330 ?auto_153328 ) ) ( not ( = ?auto_153327 ?auto_153329 ) ) ( not ( = ?auto_153327 ?auto_153331 ) ) ( not ( = ?auto_153327 ?auto_153328 ) ) ( not ( = ?auto_153329 ?auto_153331 ) ) ( not ( = ?auto_153329 ?auto_153328 ) ) ( not ( = ?auto_153331 ?auto_153328 ) ) ( not ( = ?auto_153324 ?auto_153331 ) ) ( not ( = ?auto_153324 ?auto_153330 ) ) ( not ( = ?auto_153324 ?auto_153327 ) ) ( not ( = ?auto_153324 ?auto_153329 ) ) ( not ( = ?auto_153326 ?auto_153331 ) ) ( not ( = ?auto_153326 ?auto_153330 ) ) ( not ( = ?auto_153326 ?auto_153327 ) ) ( not ( = ?auto_153326 ?auto_153329 ) ) ( not ( = ?auto_153325 ?auto_153331 ) ) ( not ( = ?auto_153325 ?auto_153330 ) ) ( not ( = ?auto_153325 ?auto_153327 ) ) ( not ( = ?auto_153325 ?auto_153329 ) ) ( ON ?auto_153328 ?auto_153325 ) ( ON ?auto_153330 ?auto_153332 ) ( not ( = ?auto_153324 ?auto_153332 ) ) ( not ( = ?auto_153326 ?auto_153332 ) ) ( not ( = ?auto_153325 ?auto_153332 ) ) ( not ( = ?auto_153328 ?auto_153332 ) ) ( not ( = ?auto_153330 ?auto_153332 ) ) ( not ( = ?auto_153327 ?auto_153332 ) ) ( not ( = ?auto_153329 ?auto_153332 ) ) ( not ( = ?auto_153331 ?auto_153332 ) ) ( ON ?auto_153327 ?auto_153330 ) ( ON-TABLE ?auto_153332 ) ( ON ?auto_153329 ?auto_153327 ) ( CLEAR ?auto_153328 ) ( ON ?auto_153331 ?auto_153329 ) ( CLEAR ?auto_153331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_153332 ?auto_153330 ?auto_153327 ?auto_153329 )
      ( MAKE-1PILE ?auto_153324 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_153333 - BLOCK
    )
    :vars
    (
      ?auto_153341 - BLOCK
      ?auto_153337 - BLOCK
      ?auto_153340 - BLOCK
      ?auto_153335 - BLOCK
      ?auto_153338 - BLOCK
      ?auto_153339 - BLOCK
      ?auto_153334 - BLOCK
      ?auto_153336 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153341 ?auto_153333 ) ( ON-TABLE ?auto_153333 ) ( not ( = ?auto_153333 ?auto_153341 ) ) ( not ( = ?auto_153333 ?auto_153337 ) ) ( not ( = ?auto_153333 ?auto_153340 ) ) ( not ( = ?auto_153341 ?auto_153337 ) ) ( not ( = ?auto_153341 ?auto_153340 ) ) ( not ( = ?auto_153337 ?auto_153340 ) ) ( ON ?auto_153337 ?auto_153341 ) ( not ( = ?auto_153335 ?auto_153338 ) ) ( not ( = ?auto_153335 ?auto_153339 ) ) ( not ( = ?auto_153335 ?auto_153334 ) ) ( not ( = ?auto_153335 ?auto_153340 ) ) ( not ( = ?auto_153338 ?auto_153339 ) ) ( not ( = ?auto_153338 ?auto_153334 ) ) ( not ( = ?auto_153338 ?auto_153340 ) ) ( not ( = ?auto_153339 ?auto_153334 ) ) ( not ( = ?auto_153339 ?auto_153340 ) ) ( not ( = ?auto_153334 ?auto_153340 ) ) ( not ( = ?auto_153333 ?auto_153334 ) ) ( not ( = ?auto_153333 ?auto_153335 ) ) ( not ( = ?auto_153333 ?auto_153338 ) ) ( not ( = ?auto_153333 ?auto_153339 ) ) ( not ( = ?auto_153341 ?auto_153334 ) ) ( not ( = ?auto_153341 ?auto_153335 ) ) ( not ( = ?auto_153341 ?auto_153338 ) ) ( not ( = ?auto_153341 ?auto_153339 ) ) ( not ( = ?auto_153337 ?auto_153334 ) ) ( not ( = ?auto_153337 ?auto_153335 ) ) ( not ( = ?auto_153337 ?auto_153338 ) ) ( not ( = ?auto_153337 ?auto_153339 ) ) ( ON ?auto_153335 ?auto_153336 ) ( not ( = ?auto_153333 ?auto_153336 ) ) ( not ( = ?auto_153341 ?auto_153336 ) ) ( not ( = ?auto_153337 ?auto_153336 ) ) ( not ( = ?auto_153340 ?auto_153336 ) ) ( not ( = ?auto_153335 ?auto_153336 ) ) ( not ( = ?auto_153338 ?auto_153336 ) ) ( not ( = ?auto_153339 ?auto_153336 ) ) ( not ( = ?auto_153334 ?auto_153336 ) ) ( ON ?auto_153338 ?auto_153335 ) ( ON-TABLE ?auto_153336 ) ( ON ?auto_153339 ?auto_153338 ) ( ON ?auto_153334 ?auto_153339 ) ( CLEAR ?auto_153334 ) ( HOLDING ?auto_153340 ) ( CLEAR ?auto_153337 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_153333 ?auto_153341 ?auto_153337 ?auto_153340 )
      ( MAKE-1PILE ?auto_153333 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_153342 - BLOCK
    )
    :vars
    (
      ?auto_153343 - BLOCK
      ?auto_153348 - BLOCK
      ?auto_153349 - BLOCK
      ?auto_153344 - BLOCK
      ?auto_153347 - BLOCK
      ?auto_153350 - BLOCK
      ?auto_153345 - BLOCK
      ?auto_153346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153343 ?auto_153342 ) ( ON-TABLE ?auto_153342 ) ( not ( = ?auto_153342 ?auto_153343 ) ) ( not ( = ?auto_153342 ?auto_153348 ) ) ( not ( = ?auto_153342 ?auto_153349 ) ) ( not ( = ?auto_153343 ?auto_153348 ) ) ( not ( = ?auto_153343 ?auto_153349 ) ) ( not ( = ?auto_153348 ?auto_153349 ) ) ( ON ?auto_153348 ?auto_153343 ) ( not ( = ?auto_153344 ?auto_153347 ) ) ( not ( = ?auto_153344 ?auto_153350 ) ) ( not ( = ?auto_153344 ?auto_153345 ) ) ( not ( = ?auto_153344 ?auto_153349 ) ) ( not ( = ?auto_153347 ?auto_153350 ) ) ( not ( = ?auto_153347 ?auto_153345 ) ) ( not ( = ?auto_153347 ?auto_153349 ) ) ( not ( = ?auto_153350 ?auto_153345 ) ) ( not ( = ?auto_153350 ?auto_153349 ) ) ( not ( = ?auto_153345 ?auto_153349 ) ) ( not ( = ?auto_153342 ?auto_153345 ) ) ( not ( = ?auto_153342 ?auto_153344 ) ) ( not ( = ?auto_153342 ?auto_153347 ) ) ( not ( = ?auto_153342 ?auto_153350 ) ) ( not ( = ?auto_153343 ?auto_153345 ) ) ( not ( = ?auto_153343 ?auto_153344 ) ) ( not ( = ?auto_153343 ?auto_153347 ) ) ( not ( = ?auto_153343 ?auto_153350 ) ) ( not ( = ?auto_153348 ?auto_153345 ) ) ( not ( = ?auto_153348 ?auto_153344 ) ) ( not ( = ?auto_153348 ?auto_153347 ) ) ( not ( = ?auto_153348 ?auto_153350 ) ) ( ON ?auto_153344 ?auto_153346 ) ( not ( = ?auto_153342 ?auto_153346 ) ) ( not ( = ?auto_153343 ?auto_153346 ) ) ( not ( = ?auto_153348 ?auto_153346 ) ) ( not ( = ?auto_153349 ?auto_153346 ) ) ( not ( = ?auto_153344 ?auto_153346 ) ) ( not ( = ?auto_153347 ?auto_153346 ) ) ( not ( = ?auto_153350 ?auto_153346 ) ) ( not ( = ?auto_153345 ?auto_153346 ) ) ( ON ?auto_153347 ?auto_153344 ) ( ON-TABLE ?auto_153346 ) ( ON ?auto_153350 ?auto_153347 ) ( ON ?auto_153345 ?auto_153350 ) ( CLEAR ?auto_153348 ) ( ON ?auto_153349 ?auto_153345 ) ( CLEAR ?auto_153349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_153346 ?auto_153344 ?auto_153347 ?auto_153350 ?auto_153345 )
      ( MAKE-1PILE ?auto_153342 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_153351 - BLOCK
    )
    :vars
    (
      ?auto_153354 - BLOCK
      ?auto_153356 - BLOCK
      ?auto_153352 - BLOCK
      ?auto_153358 - BLOCK
      ?auto_153359 - BLOCK
      ?auto_153353 - BLOCK
      ?auto_153357 - BLOCK
      ?auto_153355 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153354 ?auto_153351 ) ( ON-TABLE ?auto_153351 ) ( not ( = ?auto_153351 ?auto_153354 ) ) ( not ( = ?auto_153351 ?auto_153356 ) ) ( not ( = ?auto_153351 ?auto_153352 ) ) ( not ( = ?auto_153354 ?auto_153356 ) ) ( not ( = ?auto_153354 ?auto_153352 ) ) ( not ( = ?auto_153356 ?auto_153352 ) ) ( not ( = ?auto_153358 ?auto_153359 ) ) ( not ( = ?auto_153358 ?auto_153353 ) ) ( not ( = ?auto_153358 ?auto_153357 ) ) ( not ( = ?auto_153358 ?auto_153352 ) ) ( not ( = ?auto_153359 ?auto_153353 ) ) ( not ( = ?auto_153359 ?auto_153357 ) ) ( not ( = ?auto_153359 ?auto_153352 ) ) ( not ( = ?auto_153353 ?auto_153357 ) ) ( not ( = ?auto_153353 ?auto_153352 ) ) ( not ( = ?auto_153357 ?auto_153352 ) ) ( not ( = ?auto_153351 ?auto_153357 ) ) ( not ( = ?auto_153351 ?auto_153358 ) ) ( not ( = ?auto_153351 ?auto_153359 ) ) ( not ( = ?auto_153351 ?auto_153353 ) ) ( not ( = ?auto_153354 ?auto_153357 ) ) ( not ( = ?auto_153354 ?auto_153358 ) ) ( not ( = ?auto_153354 ?auto_153359 ) ) ( not ( = ?auto_153354 ?auto_153353 ) ) ( not ( = ?auto_153356 ?auto_153357 ) ) ( not ( = ?auto_153356 ?auto_153358 ) ) ( not ( = ?auto_153356 ?auto_153359 ) ) ( not ( = ?auto_153356 ?auto_153353 ) ) ( ON ?auto_153358 ?auto_153355 ) ( not ( = ?auto_153351 ?auto_153355 ) ) ( not ( = ?auto_153354 ?auto_153355 ) ) ( not ( = ?auto_153356 ?auto_153355 ) ) ( not ( = ?auto_153352 ?auto_153355 ) ) ( not ( = ?auto_153358 ?auto_153355 ) ) ( not ( = ?auto_153359 ?auto_153355 ) ) ( not ( = ?auto_153353 ?auto_153355 ) ) ( not ( = ?auto_153357 ?auto_153355 ) ) ( ON ?auto_153359 ?auto_153358 ) ( ON-TABLE ?auto_153355 ) ( ON ?auto_153353 ?auto_153359 ) ( ON ?auto_153357 ?auto_153353 ) ( ON ?auto_153352 ?auto_153357 ) ( CLEAR ?auto_153352 ) ( HOLDING ?auto_153356 ) ( CLEAR ?auto_153354 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_153351 ?auto_153354 ?auto_153356 )
      ( MAKE-1PILE ?auto_153351 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_153360 - BLOCK
    )
    :vars
    (
      ?auto_153367 - BLOCK
      ?auto_153366 - BLOCK
      ?auto_153365 - BLOCK
      ?auto_153361 - BLOCK
      ?auto_153362 - BLOCK
      ?auto_153368 - BLOCK
      ?auto_153364 - BLOCK
      ?auto_153363 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153367 ?auto_153360 ) ( ON-TABLE ?auto_153360 ) ( not ( = ?auto_153360 ?auto_153367 ) ) ( not ( = ?auto_153360 ?auto_153366 ) ) ( not ( = ?auto_153360 ?auto_153365 ) ) ( not ( = ?auto_153367 ?auto_153366 ) ) ( not ( = ?auto_153367 ?auto_153365 ) ) ( not ( = ?auto_153366 ?auto_153365 ) ) ( not ( = ?auto_153361 ?auto_153362 ) ) ( not ( = ?auto_153361 ?auto_153368 ) ) ( not ( = ?auto_153361 ?auto_153364 ) ) ( not ( = ?auto_153361 ?auto_153365 ) ) ( not ( = ?auto_153362 ?auto_153368 ) ) ( not ( = ?auto_153362 ?auto_153364 ) ) ( not ( = ?auto_153362 ?auto_153365 ) ) ( not ( = ?auto_153368 ?auto_153364 ) ) ( not ( = ?auto_153368 ?auto_153365 ) ) ( not ( = ?auto_153364 ?auto_153365 ) ) ( not ( = ?auto_153360 ?auto_153364 ) ) ( not ( = ?auto_153360 ?auto_153361 ) ) ( not ( = ?auto_153360 ?auto_153362 ) ) ( not ( = ?auto_153360 ?auto_153368 ) ) ( not ( = ?auto_153367 ?auto_153364 ) ) ( not ( = ?auto_153367 ?auto_153361 ) ) ( not ( = ?auto_153367 ?auto_153362 ) ) ( not ( = ?auto_153367 ?auto_153368 ) ) ( not ( = ?auto_153366 ?auto_153364 ) ) ( not ( = ?auto_153366 ?auto_153361 ) ) ( not ( = ?auto_153366 ?auto_153362 ) ) ( not ( = ?auto_153366 ?auto_153368 ) ) ( ON ?auto_153361 ?auto_153363 ) ( not ( = ?auto_153360 ?auto_153363 ) ) ( not ( = ?auto_153367 ?auto_153363 ) ) ( not ( = ?auto_153366 ?auto_153363 ) ) ( not ( = ?auto_153365 ?auto_153363 ) ) ( not ( = ?auto_153361 ?auto_153363 ) ) ( not ( = ?auto_153362 ?auto_153363 ) ) ( not ( = ?auto_153368 ?auto_153363 ) ) ( not ( = ?auto_153364 ?auto_153363 ) ) ( ON ?auto_153362 ?auto_153361 ) ( ON-TABLE ?auto_153363 ) ( ON ?auto_153368 ?auto_153362 ) ( ON ?auto_153364 ?auto_153368 ) ( ON ?auto_153365 ?auto_153364 ) ( CLEAR ?auto_153367 ) ( ON ?auto_153366 ?auto_153365 ) ( CLEAR ?auto_153366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_153363 ?auto_153361 ?auto_153362 ?auto_153368 ?auto_153364 ?auto_153365 )
      ( MAKE-1PILE ?auto_153360 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_153387 - BLOCK
    )
    :vars
    (
      ?auto_153389 - BLOCK
      ?auto_153388 - BLOCK
      ?auto_153390 - BLOCK
      ?auto_153392 - BLOCK
      ?auto_153391 - BLOCK
      ?auto_153394 - BLOCK
      ?auto_153395 - BLOCK
      ?auto_153393 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153387 ?auto_153389 ) ) ( not ( = ?auto_153387 ?auto_153388 ) ) ( not ( = ?auto_153387 ?auto_153390 ) ) ( not ( = ?auto_153389 ?auto_153388 ) ) ( not ( = ?auto_153389 ?auto_153390 ) ) ( not ( = ?auto_153388 ?auto_153390 ) ) ( not ( = ?auto_153392 ?auto_153391 ) ) ( not ( = ?auto_153392 ?auto_153394 ) ) ( not ( = ?auto_153392 ?auto_153395 ) ) ( not ( = ?auto_153392 ?auto_153390 ) ) ( not ( = ?auto_153391 ?auto_153394 ) ) ( not ( = ?auto_153391 ?auto_153395 ) ) ( not ( = ?auto_153391 ?auto_153390 ) ) ( not ( = ?auto_153394 ?auto_153395 ) ) ( not ( = ?auto_153394 ?auto_153390 ) ) ( not ( = ?auto_153395 ?auto_153390 ) ) ( not ( = ?auto_153387 ?auto_153395 ) ) ( not ( = ?auto_153387 ?auto_153392 ) ) ( not ( = ?auto_153387 ?auto_153391 ) ) ( not ( = ?auto_153387 ?auto_153394 ) ) ( not ( = ?auto_153389 ?auto_153395 ) ) ( not ( = ?auto_153389 ?auto_153392 ) ) ( not ( = ?auto_153389 ?auto_153391 ) ) ( not ( = ?auto_153389 ?auto_153394 ) ) ( not ( = ?auto_153388 ?auto_153395 ) ) ( not ( = ?auto_153388 ?auto_153392 ) ) ( not ( = ?auto_153388 ?auto_153391 ) ) ( not ( = ?auto_153388 ?auto_153394 ) ) ( ON ?auto_153392 ?auto_153393 ) ( not ( = ?auto_153387 ?auto_153393 ) ) ( not ( = ?auto_153389 ?auto_153393 ) ) ( not ( = ?auto_153388 ?auto_153393 ) ) ( not ( = ?auto_153390 ?auto_153393 ) ) ( not ( = ?auto_153392 ?auto_153393 ) ) ( not ( = ?auto_153391 ?auto_153393 ) ) ( not ( = ?auto_153394 ?auto_153393 ) ) ( not ( = ?auto_153395 ?auto_153393 ) ) ( ON ?auto_153391 ?auto_153392 ) ( ON-TABLE ?auto_153393 ) ( ON ?auto_153394 ?auto_153391 ) ( ON ?auto_153395 ?auto_153394 ) ( ON ?auto_153390 ?auto_153395 ) ( ON ?auto_153388 ?auto_153390 ) ( ON ?auto_153389 ?auto_153388 ) ( CLEAR ?auto_153389 ) ( HOLDING ?auto_153387 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_153387 ?auto_153389 )
      ( MAKE-1PILE ?auto_153387 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_153396 - BLOCK
    )
    :vars
    (
      ?auto_153400 - BLOCK
      ?auto_153401 - BLOCK
      ?auto_153403 - BLOCK
      ?auto_153399 - BLOCK
      ?auto_153398 - BLOCK
      ?auto_153402 - BLOCK
      ?auto_153397 - BLOCK
      ?auto_153404 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153396 ?auto_153400 ) ) ( not ( = ?auto_153396 ?auto_153401 ) ) ( not ( = ?auto_153396 ?auto_153403 ) ) ( not ( = ?auto_153400 ?auto_153401 ) ) ( not ( = ?auto_153400 ?auto_153403 ) ) ( not ( = ?auto_153401 ?auto_153403 ) ) ( not ( = ?auto_153399 ?auto_153398 ) ) ( not ( = ?auto_153399 ?auto_153402 ) ) ( not ( = ?auto_153399 ?auto_153397 ) ) ( not ( = ?auto_153399 ?auto_153403 ) ) ( not ( = ?auto_153398 ?auto_153402 ) ) ( not ( = ?auto_153398 ?auto_153397 ) ) ( not ( = ?auto_153398 ?auto_153403 ) ) ( not ( = ?auto_153402 ?auto_153397 ) ) ( not ( = ?auto_153402 ?auto_153403 ) ) ( not ( = ?auto_153397 ?auto_153403 ) ) ( not ( = ?auto_153396 ?auto_153397 ) ) ( not ( = ?auto_153396 ?auto_153399 ) ) ( not ( = ?auto_153396 ?auto_153398 ) ) ( not ( = ?auto_153396 ?auto_153402 ) ) ( not ( = ?auto_153400 ?auto_153397 ) ) ( not ( = ?auto_153400 ?auto_153399 ) ) ( not ( = ?auto_153400 ?auto_153398 ) ) ( not ( = ?auto_153400 ?auto_153402 ) ) ( not ( = ?auto_153401 ?auto_153397 ) ) ( not ( = ?auto_153401 ?auto_153399 ) ) ( not ( = ?auto_153401 ?auto_153398 ) ) ( not ( = ?auto_153401 ?auto_153402 ) ) ( ON ?auto_153399 ?auto_153404 ) ( not ( = ?auto_153396 ?auto_153404 ) ) ( not ( = ?auto_153400 ?auto_153404 ) ) ( not ( = ?auto_153401 ?auto_153404 ) ) ( not ( = ?auto_153403 ?auto_153404 ) ) ( not ( = ?auto_153399 ?auto_153404 ) ) ( not ( = ?auto_153398 ?auto_153404 ) ) ( not ( = ?auto_153402 ?auto_153404 ) ) ( not ( = ?auto_153397 ?auto_153404 ) ) ( ON ?auto_153398 ?auto_153399 ) ( ON-TABLE ?auto_153404 ) ( ON ?auto_153402 ?auto_153398 ) ( ON ?auto_153397 ?auto_153402 ) ( ON ?auto_153403 ?auto_153397 ) ( ON ?auto_153401 ?auto_153403 ) ( ON ?auto_153400 ?auto_153401 ) ( ON ?auto_153396 ?auto_153400 ) ( CLEAR ?auto_153396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_153404 ?auto_153399 ?auto_153398 ?auto_153402 ?auto_153397 ?auto_153403 ?auto_153401 ?auto_153400 )
      ( MAKE-1PILE ?auto_153396 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153412 - BLOCK
      ?auto_153413 - BLOCK
      ?auto_153414 - BLOCK
      ?auto_153415 - BLOCK
      ?auto_153416 - BLOCK
      ?auto_153417 - BLOCK
      ?auto_153418 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_153418 ) ( CLEAR ?auto_153417 ) ( ON-TABLE ?auto_153412 ) ( ON ?auto_153413 ?auto_153412 ) ( ON ?auto_153414 ?auto_153413 ) ( ON ?auto_153415 ?auto_153414 ) ( ON ?auto_153416 ?auto_153415 ) ( ON ?auto_153417 ?auto_153416 ) ( not ( = ?auto_153412 ?auto_153413 ) ) ( not ( = ?auto_153412 ?auto_153414 ) ) ( not ( = ?auto_153412 ?auto_153415 ) ) ( not ( = ?auto_153412 ?auto_153416 ) ) ( not ( = ?auto_153412 ?auto_153417 ) ) ( not ( = ?auto_153412 ?auto_153418 ) ) ( not ( = ?auto_153413 ?auto_153414 ) ) ( not ( = ?auto_153413 ?auto_153415 ) ) ( not ( = ?auto_153413 ?auto_153416 ) ) ( not ( = ?auto_153413 ?auto_153417 ) ) ( not ( = ?auto_153413 ?auto_153418 ) ) ( not ( = ?auto_153414 ?auto_153415 ) ) ( not ( = ?auto_153414 ?auto_153416 ) ) ( not ( = ?auto_153414 ?auto_153417 ) ) ( not ( = ?auto_153414 ?auto_153418 ) ) ( not ( = ?auto_153415 ?auto_153416 ) ) ( not ( = ?auto_153415 ?auto_153417 ) ) ( not ( = ?auto_153415 ?auto_153418 ) ) ( not ( = ?auto_153416 ?auto_153417 ) ) ( not ( = ?auto_153416 ?auto_153418 ) ) ( not ( = ?auto_153417 ?auto_153418 ) ) )
    :subtasks
    ( ( !STACK ?auto_153418 ?auto_153417 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153419 - BLOCK
      ?auto_153420 - BLOCK
      ?auto_153421 - BLOCK
      ?auto_153422 - BLOCK
      ?auto_153423 - BLOCK
      ?auto_153424 - BLOCK
      ?auto_153425 - BLOCK
    )
    :vars
    (
      ?auto_153426 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_153424 ) ( ON-TABLE ?auto_153419 ) ( ON ?auto_153420 ?auto_153419 ) ( ON ?auto_153421 ?auto_153420 ) ( ON ?auto_153422 ?auto_153421 ) ( ON ?auto_153423 ?auto_153422 ) ( ON ?auto_153424 ?auto_153423 ) ( not ( = ?auto_153419 ?auto_153420 ) ) ( not ( = ?auto_153419 ?auto_153421 ) ) ( not ( = ?auto_153419 ?auto_153422 ) ) ( not ( = ?auto_153419 ?auto_153423 ) ) ( not ( = ?auto_153419 ?auto_153424 ) ) ( not ( = ?auto_153419 ?auto_153425 ) ) ( not ( = ?auto_153420 ?auto_153421 ) ) ( not ( = ?auto_153420 ?auto_153422 ) ) ( not ( = ?auto_153420 ?auto_153423 ) ) ( not ( = ?auto_153420 ?auto_153424 ) ) ( not ( = ?auto_153420 ?auto_153425 ) ) ( not ( = ?auto_153421 ?auto_153422 ) ) ( not ( = ?auto_153421 ?auto_153423 ) ) ( not ( = ?auto_153421 ?auto_153424 ) ) ( not ( = ?auto_153421 ?auto_153425 ) ) ( not ( = ?auto_153422 ?auto_153423 ) ) ( not ( = ?auto_153422 ?auto_153424 ) ) ( not ( = ?auto_153422 ?auto_153425 ) ) ( not ( = ?auto_153423 ?auto_153424 ) ) ( not ( = ?auto_153423 ?auto_153425 ) ) ( not ( = ?auto_153424 ?auto_153425 ) ) ( ON ?auto_153425 ?auto_153426 ) ( CLEAR ?auto_153425 ) ( HAND-EMPTY ) ( not ( = ?auto_153419 ?auto_153426 ) ) ( not ( = ?auto_153420 ?auto_153426 ) ) ( not ( = ?auto_153421 ?auto_153426 ) ) ( not ( = ?auto_153422 ?auto_153426 ) ) ( not ( = ?auto_153423 ?auto_153426 ) ) ( not ( = ?auto_153424 ?auto_153426 ) ) ( not ( = ?auto_153425 ?auto_153426 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_153425 ?auto_153426 )
      ( MAKE-7PILE ?auto_153419 ?auto_153420 ?auto_153421 ?auto_153422 ?auto_153423 ?auto_153424 ?auto_153425 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153427 - BLOCK
      ?auto_153428 - BLOCK
      ?auto_153429 - BLOCK
      ?auto_153430 - BLOCK
      ?auto_153431 - BLOCK
      ?auto_153432 - BLOCK
      ?auto_153433 - BLOCK
    )
    :vars
    (
      ?auto_153434 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_153427 ) ( ON ?auto_153428 ?auto_153427 ) ( ON ?auto_153429 ?auto_153428 ) ( ON ?auto_153430 ?auto_153429 ) ( ON ?auto_153431 ?auto_153430 ) ( not ( = ?auto_153427 ?auto_153428 ) ) ( not ( = ?auto_153427 ?auto_153429 ) ) ( not ( = ?auto_153427 ?auto_153430 ) ) ( not ( = ?auto_153427 ?auto_153431 ) ) ( not ( = ?auto_153427 ?auto_153432 ) ) ( not ( = ?auto_153427 ?auto_153433 ) ) ( not ( = ?auto_153428 ?auto_153429 ) ) ( not ( = ?auto_153428 ?auto_153430 ) ) ( not ( = ?auto_153428 ?auto_153431 ) ) ( not ( = ?auto_153428 ?auto_153432 ) ) ( not ( = ?auto_153428 ?auto_153433 ) ) ( not ( = ?auto_153429 ?auto_153430 ) ) ( not ( = ?auto_153429 ?auto_153431 ) ) ( not ( = ?auto_153429 ?auto_153432 ) ) ( not ( = ?auto_153429 ?auto_153433 ) ) ( not ( = ?auto_153430 ?auto_153431 ) ) ( not ( = ?auto_153430 ?auto_153432 ) ) ( not ( = ?auto_153430 ?auto_153433 ) ) ( not ( = ?auto_153431 ?auto_153432 ) ) ( not ( = ?auto_153431 ?auto_153433 ) ) ( not ( = ?auto_153432 ?auto_153433 ) ) ( ON ?auto_153433 ?auto_153434 ) ( CLEAR ?auto_153433 ) ( not ( = ?auto_153427 ?auto_153434 ) ) ( not ( = ?auto_153428 ?auto_153434 ) ) ( not ( = ?auto_153429 ?auto_153434 ) ) ( not ( = ?auto_153430 ?auto_153434 ) ) ( not ( = ?auto_153431 ?auto_153434 ) ) ( not ( = ?auto_153432 ?auto_153434 ) ) ( not ( = ?auto_153433 ?auto_153434 ) ) ( HOLDING ?auto_153432 ) ( CLEAR ?auto_153431 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_153427 ?auto_153428 ?auto_153429 ?auto_153430 ?auto_153431 ?auto_153432 )
      ( MAKE-7PILE ?auto_153427 ?auto_153428 ?auto_153429 ?auto_153430 ?auto_153431 ?auto_153432 ?auto_153433 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153435 - BLOCK
      ?auto_153436 - BLOCK
      ?auto_153437 - BLOCK
      ?auto_153438 - BLOCK
      ?auto_153439 - BLOCK
      ?auto_153440 - BLOCK
      ?auto_153441 - BLOCK
    )
    :vars
    (
      ?auto_153442 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_153435 ) ( ON ?auto_153436 ?auto_153435 ) ( ON ?auto_153437 ?auto_153436 ) ( ON ?auto_153438 ?auto_153437 ) ( ON ?auto_153439 ?auto_153438 ) ( not ( = ?auto_153435 ?auto_153436 ) ) ( not ( = ?auto_153435 ?auto_153437 ) ) ( not ( = ?auto_153435 ?auto_153438 ) ) ( not ( = ?auto_153435 ?auto_153439 ) ) ( not ( = ?auto_153435 ?auto_153440 ) ) ( not ( = ?auto_153435 ?auto_153441 ) ) ( not ( = ?auto_153436 ?auto_153437 ) ) ( not ( = ?auto_153436 ?auto_153438 ) ) ( not ( = ?auto_153436 ?auto_153439 ) ) ( not ( = ?auto_153436 ?auto_153440 ) ) ( not ( = ?auto_153436 ?auto_153441 ) ) ( not ( = ?auto_153437 ?auto_153438 ) ) ( not ( = ?auto_153437 ?auto_153439 ) ) ( not ( = ?auto_153437 ?auto_153440 ) ) ( not ( = ?auto_153437 ?auto_153441 ) ) ( not ( = ?auto_153438 ?auto_153439 ) ) ( not ( = ?auto_153438 ?auto_153440 ) ) ( not ( = ?auto_153438 ?auto_153441 ) ) ( not ( = ?auto_153439 ?auto_153440 ) ) ( not ( = ?auto_153439 ?auto_153441 ) ) ( not ( = ?auto_153440 ?auto_153441 ) ) ( ON ?auto_153441 ?auto_153442 ) ( not ( = ?auto_153435 ?auto_153442 ) ) ( not ( = ?auto_153436 ?auto_153442 ) ) ( not ( = ?auto_153437 ?auto_153442 ) ) ( not ( = ?auto_153438 ?auto_153442 ) ) ( not ( = ?auto_153439 ?auto_153442 ) ) ( not ( = ?auto_153440 ?auto_153442 ) ) ( not ( = ?auto_153441 ?auto_153442 ) ) ( CLEAR ?auto_153439 ) ( ON ?auto_153440 ?auto_153441 ) ( CLEAR ?auto_153440 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_153442 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_153442 ?auto_153441 )
      ( MAKE-7PILE ?auto_153435 ?auto_153436 ?auto_153437 ?auto_153438 ?auto_153439 ?auto_153440 ?auto_153441 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153443 - BLOCK
      ?auto_153444 - BLOCK
      ?auto_153445 - BLOCK
      ?auto_153446 - BLOCK
      ?auto_153447 - BLOCK
      ?auto_153448 - BLOCK
      ?auto_153449 - BLOCK
    )
    :vars
    (
      ?auto_153450 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_153443 ) ( ON ?auto_153444 ?auto_153443 ) ( ON ?auto_153445 ?auto_153444 ) ( ON ?auto_153446 ?auto_153445 ) ( not ( = ?auto_153443 ?auto_153444 ) ) ( not ( = ?auto_153443 ?auto_153445 ) ) ( not ( = ?auto_153443 ?auto_153446 ) ) ( not ( = ?auto_153443 ?auto_153447 ) ) ( not ( = ?auto_153443 ?auto_153448 ) ) ( not ( = ?auto_153443 ?auto_153449 ) ) ( not ( = ?auto_153444 ?auto_153445 ) ) ( not ( = ?auto_153444 ?auto_153446 ) ) ( not ( = ?auto_153444 ?auto_153447 ) ) ( not ( = ?auto_153444 ?auto_153448 ) ) ( not ( = ?auto_153444 ?auto_153449 ) ) ( not ( = ?auto_153445 ?auto_153446 ) ) ( not ( = ?auto_153445 ?auto_153447 ) ) ( not ( = ?auto_153445 ?auto_153448 ) ) ( not ( = ?auto_153445 ?auto_153449 ) ) ( not ( = ?auto_153446 ?auto_153447 ) ) ( not ( = ?auto_153446 ?auto_153448 ) ) ( not ( = ?auto_153446 ?auto_153449 ) ) ( not ( = ?auto_153447 ?auto_153448 ) ) ( not ( = ?auto_153447 ?auto_153449 ) ) ( not ( = ?auto_153448 ?auto_153449 ) ) ( ON ?auto_153449 ?auto_153450 ) ( not ( = ?auto_153443 ?auto_153450 ) ) ( not ( = ?auto_153444 ?auto_153450 ) ) ( not ( = ?auto_153445 ?auto_153450 ) ) ( not ( = ?auto_153446 ?auto_153450 ) ) ( not ( = ?auto_153447 ?auto_153450 ) ) ( not ( = ?auto_153448 ?auto_153450 ) ) ( not ( = ?auto_153449 ?auto_153450 ) ) ( ON ?auto_153448 ?auto_153449 ) ( CLEAR ?auto_153448 ) ( ON-TABLE ?auto_153450 ) ( HOLDING ?auto_153447 ) ( CLEAR ?auto_153446 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_153443 ?auto_153444 ?auto_153445 ?auto_153446 ?auto_153447 )
      ( MAKE-7PILE ?auto_153443 ?auto_153444 ?auto_153445 ?auto_153446 ?auto_153447 ?auto_153448 ?auto_153449 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153451 - BLOCK
      ?auto_153452 - BLOCK
      ?auto_153453 - BLOCK
      ?auto_153454 - BLOCK
      ?auto_153455 - BLOCK
      ?auto_153456 - BLOCK
      ?auto_153457 - BLOCK
    )
    :vars
    (
      ?auto_153458 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_153451 ) ( ON ?auto_153452 ?auto_153451 ) ( ON ?auto_153453 ?auto_153452 ) ( ON ?auto_153454 ?auto_153453 ) ( not ( = ?auto_153451 ?auto_153452 ) ) ( not ( = ?auto_153451 ?auto_153453 ) ) ( not ( = ?auto_153451 ?auto_153454 ) ) ( not ( = ?auto_153451 ?auto_153455 ) ) ( not ( = ?auto_153451 ?auto_153456 ) ) ( not ( = ?auto_153451 ?auto_153457 ) ) ( not ( = ?auto_153452 ?auto_153453 ) ) ( not ( = ?auto_153452 ?auto_153454 ) ) ( not ( = ?auto_153452 ?auto_153455 ) ) ( not ( = ?auto_153452 ?auto_153456 ) ) ( not ( = ?auto_153452 ?auto_153457 ) ) ( not ( = ?auto_153453 ?auto_153454 ) ) ( not ( = ?auto_153453 ?auto_153455 ) ) ( not ( = ?auto_153453 ?auto_153456 ) ) ( not ( = ?auto_153453 ?auto_153457 ) ) ( not ( = ?auto_153454 ?auto_153455 ) ) ( not ( = ?auto_153454 ?auto_153456 ) ) ( not ( = ?auto_153454 ?auto_153457 ) ) ( not ( = ?auto_153455 ?auto_153456 ) ) ( not ( = ?auto_153455 ?auto_153457 ) ) ( not ( = ?auto_153456 ?auto_153457 ) ) ( ON ?auto_153457 ?auto_153458 ) ( not ( = ?auto_153451 ?auto_153458 ) ) ( not ( = ?auto_153452 ?auto_153458 ) ) ( not ( = ?auto_153453 ?auto_153458 ) ) ( not ( = ?auto_153454 ?auto_153458 ) ) ( not ( = ?auto_153455 ?auto_153458 ) ) ( not ( = ?auto_153456 ?auto_153458 ) ) ( not ( = ?auto_153457 ?auto_153458 ) ) ( ON ?auto_153456 ?auto_153457 ) ( ON-TABLE ?auto_153458 ) ( CLEAR ?auto_153454 ) ( ON ?auto_153455 ?auto_153456 ) ( CLEAR ?auto_153455 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_153458 ?auto_153457 ?auto_153456 )
      ( MAKE-7PILE ?auto_153451 ?auto_153452 ?auto_153453 ?auto_153454 ?auto_153455 ?auto_153456 ?auto_153457 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153459 - BLOCK
      ?auto_153460 - BLOCK
      ?auto_153461 - BLOCK
      ?auto_153462 - BLOCK
      ?auto_153463 - BLOCK
      ?auto_153464 - BLOCK
      ?auto_153465 - BLOCK
    )
    :vars
    (
      ?auto_153466 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_153459 ) ( ON ?auto_153460 ?auto_153459 ) ( ON ?auto_153461 ?auto_153460 ) ( not ( = ?auto_153459 ?auto_153460 ) ) ( not ( = ?auto_153459 ?auto_153461 ) ) ( not ( = ?auto_153459 ?auto_153462 ) ) ( not ( = ?auto_153459 ?auto_153463 ) ) ( not ( = ?auto_153459 ?auto_153464 ) ) ( not ( = ?auto_153459 ?auto_153465 ) ) ( not ( = ?auto_153460 ?auto_153461 ) ) ( not ( = ?auto_153460 ?auto_153462 ) ) ( not ( = ?auto_153460 ?auto_153463 ) ) ( not ( = ?auto_153460 ?auto_153464 ) ) ( not ( = ?auto_153460 ?auto_153465 ) ) ( not ( = ?auto_153461 ?auto_153462 ) ) ( not ( = ?auto_153461 ?auto_153463 ) ) ( not ( = ?auto_153461 ?auto_153464 ) ) ( not ( = ?auto_153461 ?auto_153465 ) ) ( not ( = ?auto_153462 ?auto_153463 ) ) ( not ( = ?auto_153462 ?auto_153464 ) ) ( not ( = ?auto_153462 ?auto_153465 ) ) ( not ( = ?auto_153463 ?auto_153464 ) ) ( not ( = ?auto_153463 ?auto_153465 ) ) ( not ( = ?auto_153464 ?auto_153465 ) ) ( ON ?auto_153465 ?auto_153466 ) ( not ( = ?auto_153459 ?auto_153466 ) ) ( not ( = ?auto_153460 ?auto_153466 ) ) ( not ( = ?auto_153461 ?auto_153466 ) ) ( not ( = ?auto_153462 ?auto_153466 ) ) ( not ( = ?auto_153463 ?auto_153466 ) ) ( not ( = ?auto_153464 ?auto_153466 ) ) ( not ( = ?auto_153465 ?auto_153466 ) ) ( ON ?auto_153464 ?auto_153465 ) ( ON-TABLE ?auto_153466 ) ( ON ?auto_153463 ?auto_153464 ) ( CLEAR ?auto_153463 ) ( HOLDING ?auto_153462 ) ( CLEAR ?auto_153461 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_153459 ?auto_153460 ?auto_153461 ?auto_153462 )
      ( MAKE-7PILE ?auto_153459 ?auto_153460 ?auto_153461 ?auto_153462 ?auto_153463 ?auto_153464 ?auto_153465 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153467 - BLOCK
      ?auto_153468 - BLOCK
      ?auto_153469 - BLOCK
      ?auto_153470 - BLOCK
      ?auto_153471 - BLOCK
      ?auto_153472 - BLOCK
      ?auto_153473 - BLOCK
    )
    :vars
    (
      ?auto_153474 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_153467 ) ( ON ?auto_153468 ?auto_153467 ) ( ON ?auto_153469 ?auto_153468 ) ( not ( = ?auto_153467 ?auto_153468 ) ) ( not ( = ?auto_153467 ?auto_153469 ) ) ( not ( = ?auto_153467 ?auto_153470 ) ) ( not ( = ?auto_153467 ?auto_153471 ) ) ( not ( = ?auto_153467 ?auto_153472 ) ) ( not ( = ?auto_153467 ?auto_153473 ) ) ( not ( = ?auto_153468 ?auto_153469 ) ) ( not ( = ?auto_153468 ?auto_153470 ) ) ( not ( = ?auto_153468 ?auto_153471 ) ) ( not ( = ?auto_153468 ?auto_153472 ) ) ( not ( = ?auto_153468 ?auto_153473 ) ) ( not ( = ?auto_153469 ?auto_153470 ) ) ( not ( = ?auto_153469 ?auto_153471 ) ) ( not ( = ?auto_153469 ?auto_153472 ) ) ( not ( = ?auto_153469 ?auto_153473 ) ) ( not ( = ?auto_153470 ?auto_153471 ) ) ( not ( = ?auto_153470 ?auto_153472 ) ) ( not ( = ?auto_153470 ?auto_153473 ) ) ( not ( = ?auto_153471 ?auto_153472 ) ) ( not ( = ?auto_153471 ?auto_153473 ) ) ( not ( = ?auto_153472 ?auto_153473 ) ) ( ON ?auto_153473 ?auto_153474 ) ( not ( = ?auto_153467 ?auto_153474 ) ) ( not ( = ?auto_153468 ?auto_153474 ) ) ( not ( = ?auto_153469 ?auto_153474 ) ) ( not ( = ?auto_153470 ?auto_153474 ) ) ( not ( = ?auto_153471 ?auto_153474 ) ) ( not ( = ?auto_153472 ?auto_153474 ) ) ( not ( = ?auto_153473 ?auto_153474 ) ) ( ON ?auto_153472 ?auto_153473 ) ( ON-TABLE ?auto_153474 ) ( ON ?auto_153471 ?auto_153472 ) ( CLEAR ?auto_153469 ) ( ON ?auto_153470 ?auto_153471 ) ( CLEAR ?auto_153470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_153474 ?auto_153473 ?auto_153472 ?auto_153471 )
      ( MAKE-7PILE ?auto_153467 ?auto_153468 ?auto_153469 ?auto_153470 ?auto_153471 ?auto_153472 ?auto_153473 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153475 - BLOCK
      ?auto_153476 - BLOCK
      ?auto_153477 - BLOCK
      ?auto_153478 - BLOCK
      ?auto_153479 - BLOCK
      ?auto_153480 - BLOCK
      ?auto_153481 - BLOCK
    )
    :vars
    (
      ?auto_153482 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_153475 ) ( ON ?auto_153476 ?auto_153475 ) ( not ( = ?auto_153475 ?auto_153476 ) ) ( not ( = ?auto_153475 ?auto_153477 ) ) ( not ( = ?auto_153475 ?auto_153478 ) ) ( not ( = ?auto_153475 ?auto_153479 ) ) ( not ( = ?auto_153475 ?auto_153480 ) ) ( not ( = ?auto_153475 ?auto_153481 ) ) ( not ( = ?auto_153476 ?auto_153477 ) ) ( not ( = ?auto_153476 ?auto_153478 ) ) ( not ( = ?auto_153476 ?auto_153479 ) ) ( not ( = ?auto_153476 ?auto_153480 ) ) ( not ( = ?auto_153476 ?auto_153481 ) ) ( not ( = ?auto_153477 ?auto_153478 ) ) ( not ( = ?auto_153477 ?auto_153479 ) ) ( not ( = ?auto_153477 ?auto_153480 ) ) ( not ( = ?auto_153477 ?auto_153481 ) ) ( not ( = ?auto_153478 ?auto_153479 ) ) ( not ( = ?auto_153478 ?auto_153480 ) ) ( not ( = ?auto_153478 ?auto_153481 ) ) ( not ( = ?auto_153479 ?auto_153480 ) ) ( not ( = ?auto_153479 ?auto_153481 ) ) ( not ( = ?auto_153480 ?auto_153481 ) ) ( ON ?auto_153481 ?auto_153482 ) ( not ( = ?auto_153475 ?auto_153482 ) ) ( not ( = ?auto_153476 ?auto_153482 ) ) ( not ( = ?auto_153477 ?auto_153482 ) ) ( not ( = ?auto_153478 ?auto_153482 ) ) ( not ( = ?auto_153479 ?auto_153482 ) ) ( not ( = ?auto_153480 ?auto_153482 ) ) ( not ( = ?auto_153481 ?auto_153482 ) ) ( ON ?auto_153480 ?auto_153481 ) ( ON-TABLE ?auto_153482 ) ( ON ?auto_153479 ?auto_153480 ) ( ON ?auto_153478 ?auto_153479 ) ( CLEAR ?auto_153478 ) ( HOLDING ?auto_153477 ) ( CLEAR ?auto_153476 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_153475 ?auto_153476 ?auto_153477 )
      ( MAKE-7PILE ?auto_153475 ?auto_153476 ?auto_153477 ?auto_153478 ?auto_153479 ?auto_153480 ?auto_153481 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153483 - BLOCK
      ?auto_153484 - BLOCK
      ?auto_153485 - BLOCK
      ?auto_153486 - BLOCK
      ?auto_153487 - BLOCK
      ?auto_153488 - BLOCK
      ?auto_153489 - BLOCK
    )
    :vars
    (
      ?auto_153490 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_153483 ) ( ON ?auto_153484 ?auto_153483 ) ( not ( = ?auto_153483 ?auto_153484 ) ) ( not ( = ?auto_153483 ?auto_153485 ) ) ( not ( = ?auto_153483 ?auto_153486 ) ) ( not ( = ?auto_153483 ?auto_153487 ) ) ( not ( = ?auto_153483 ?auto_153488 ) ) ( not ( = ?auto_153483 ?auto_153489 ) ) ( not ( = ?auto_153484 ?auto_153485 ) ) ( not ( = ?auto_153484 ?auto_153486 ) ) ( not ( = ?auto_153484 ?auto_153487 ) ) ( not ( = ?auto_153484 ?auto_153488 ) ) ( not ( = ?auto_153484 ?auto_153489 ) ) ( not ( = ?auto_153485 ?auto_153486 ) ) ( not ( = ?auto_153485 ?auto_153487 ) ) ( not ( = ?auto_153485 ?auto_153488 ) ) ( not ( = ?auto_153485 ?auto_153489 ) ) ( not ( = ?auto_153486 ?auto_153487 ) ) ( not ( = ?auto_153486 ?auto_153488 ) ) ( not ( = ?auto_153486 ?auto_153489 ) ) ( not ( = ?auto_153487 ?auto_153488 ) ) ( not ( = ?auto_153487 ?auto_153489 ) ) ( not ( = ?auto_153488 ?auto_153489 ) ) ( ON ?auto_153489 ?auto_153490 ) ( not ( = ?auto_153483 ?auto_153490 ) ) ( not ( = ?auto_153484 ?auto_153490 ) ) ( not ( = ?auto_153485 ?auto_153490 ) ) ( not ( = ?auto_153486 ?auto_153490 ) ) ( not ( = ?auto_153487 ?auto_153490 ) ) ( not ( = ?auto_153488 ?auto_153490 ) ) ( not ( = ?auto_153489 ?auto_153490 ) ) ( ON ?auto_153488 ?auto_153489 ) ( ON-TABLE ?auto_153490 ) ( ON ?auto_153487 ?auto_153488 ) ( ON ?auto_153486 ?auto_153487 ) ( CLEAR ?auto_153484 ) ( ON ?auto_153485 ?auto_153486 ) ( CLEAR ?auto_153485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_153490 ?auto_153489 ?auto_153488 ?auto_153487 ?auto_153486 )
      ( MAKE-7PILE ?auto_153483 ?auto_153484 ?auto_153485 ?auto_153486 ?auto_153487 ?auto_153488 ?auto_153489 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153491 - BLOCK
      ?auto_153492 - BLOCK
      ?auto_153493 - BLOCK
      ?auto_153494 - BLOCK
      ?auto_153495 - BLOCK
      ?auto_153496 - BLOCK
      ?auto_153497 - BLOCK
    )
    :vars
    (
      ?auto_153498 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_153491 ) ( not ( = ?auto_153491 ?auto_153492 ) ) ( not ( = ?auto_153491 ?auto_153493 ) ) ( not ( = ?auto_153491 ?auto_153494 ) ) ( not ( = ?auto_153491 ?auto_153495 ) ) ( not ( = ?auto_153491 ?auto_153496 ) ) ( not ( = ?auto_153491 ?auto_153497 ) ) ( not ( = ?auto_153492 ?auto_153493 ) ) ( not ( = ?auto_153492 ?auto_153494 ) ) ( not ( = ?auto_153492 ?auto_153495 ) ) ( not ( = ?auto_153492 ?auto_153496 ) ) ( not ( = ?auto_153492 ?auto_153497 ) ) ( not ( = ?auto_153493 ?auto_153494 ) ) ( not ( = ?auto_153493 ?auto_153495 ) ) ( not ( = ?auto_153493 ?auto_153496 ) ) ( not ( = ?auto_153493 ?auto_153497 ) ) ( not ( = ?auto_153494 ?auto_153495 ) ) ( not ( = ?auto_153494 ?auto_153496 ) ) ( not ( = ?auto_153494 ?auto_153497 ) ) ( not ( = ?auto_153495 ?auto_153496 ) ) ( not ( = ?auto_153495 ?auto_153497 ) ) ( not ( = ?auto_153496 ?auto_153497 ) ) ( ON ?auto_153497 ?auto_153498 ) ( not ( = ?auto_153491 ?auto_153498 ) ) ( not ( = ?auto_153492 ?auto_153498 ) ) ( not ( = ?auto_153493 ?auto_153498 ) ) ( not ( = ?auto_153494 ?auto_153498 ) ) ( not ( = ?auto_153495 ?auto_153498 ) ) ( not ( = ?auto_153496 ?auto_153498 ) ) ( not ( = ?auto_153497 ?auto_153498 ) ) ( ON ?auto_153496 ?auto_153497 ) ( ON-TABLE ?auto_153498 ) ( ON ?auto_153495 ?auto_153496 ) ( ON ?auto_153494 ?auto_153495 ) ( ON ?auto_153493 ?auto_153494 ) ( CLEAR ?auto_153493 ) ( HOLDING ?auto_153492 ) ( CLEAR ?auto_153491 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_153491 ?auto_153492 )
      ( MAKE-7PILE ?auto_153491 ?auto_153492 ?auto_153493 ?auto_153494 ?auto_153495 ?auto_153496 ?auto_153497 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153499 - BLOCK
      ?auto_153500 - BLOCK
      ?auto_153501 - BLOCK
      ?auto_153502 - BLOCK
      ?auto_153503 - BLOCK
      ?auto_153504 - BLOCK
      ?auto_153505 - BLOCK
    )
    :vars
    (
      ?auto_153506 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_153499 ) ( not ( = ?auto_153499 ?auto_153500 ) ) ( not ( = ?auto_153499 ?auto_153501 ) ) ( not ( = ?auto_153499 ?auto_153502 ) ) ( not ( = ?auto_153499 ?auto_153503 ) ) ( not ( = ?auto_153499 ?auto_153504 ) ) ( not ( = ?auto_153499 ?auto_153505 ) ) ( not ( = ?auto_153500 ?auto_153501 ) ) ( not ( = ?auto_153500 ?auto_153502 ) ) ( not ( = ?auto_153500 ?auto_153503 ) ) ( not ( = ?auto_153500 ?auto_153504 ) ) ( not ( = ?auto_153500 ?auto_153505 ) ) ( not ( = ?auto_153501 ?auto_153502 ) ) ( not ( = ?auto_153501 ?auto_153503 ) ) ( not ( = ?auto_153501 ?auto_153504 ) ) ( not ( = ?auto_153501 ?auto_153505 ) ) ( not ( = ?auto_153502 ?auto_153503 ) ) ( not ( = ?auto_153502 ?auto_153504 ) ) ( not ( = ?auto_153502 ?auto_153505 ) ) ( not ( = ?auto_153503 ?auto_153504 ) ) ( not ( = ?auto_153503 ?auto_153505 ) ) ( not ( = ?auto_153504 ?auto_153505 ) ) ( ON ?auto_153505 ?auto_153506 ) ( not ( = ?auto_153499 ?auto_153506 ) ) ( not ( = ?auto_153500 ?auto_153506 ) ) ( not ( = ?auto_153501 ?auto_153506 ) ) ( not ( = ?auto_153502 ?auto_153506 ) ) ( not ( = ?auto_153503 ?auto_153506 ) ) ( not ( = ?auto_153504 ?auto_153506 ) ) ( not ( = ?auto_153505 ?auto_153506 ) ) ( ON ?auto_153504 ?auto_153505 ) ( ON-TABLE ?auto_153506 ) ( ON ?auto_153503 ?auto_153504 ) ( ON ?auto_153502 ?auto_153503 ) ( ON ?auto_153501 ?auto_153502 ) ( CLEAR ?auto_153499 ) ( ON ?auto_153500 ?auto_153501 ) ( CLEAR ?auto_153500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_153506 ?auto_153505 ?auto_153504 ?auto_153503 ?auto_153502 ?auto_153501 )
      ( MAKE-7PILE ?auto_153499 ?auto_153500 ?auto_153501 ?auto_153502 ?auto_153503 ?auto_153504 ?auto_153505 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153507 - BLOCK
      ?auto_153508 - BLOCK
      ?auto_153509 - BLOCK
      ?auto_153510 - BLOCK
      ?auto_153511 - BLOCK
      ?auto_153512 - BLOCK
      ?auto_153513 - BLOCK
    )
    :vars
    (
      ?auto_153514 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153507 ?auto_153508 ) ) ( not ( = ?auto_153507 ?auto_153509 ) ) ( not ( = ?auto_153507 ?auto_153510 ) ) ( not ( = ?auto_153507 ?auto_153511 ) ) ( not ( = ?auto_153507 ?auto_153512 ) ) ( not ( = ?auto_153507 ?auto_153513 ) ) ( not ( = ?auto_153508 ?auto_153509 ) ) ( not ( = ?auto_153508 ?auto_153510 ) ) ( not ( = ?auto_153508 ?auto_153511 ) ) ( not ( = ?auto_153508 ?auto_153512 ) ) ( not ( = ?auto_153508 ?auto_153513 ) ) ( not ( = ?auto_153509 ?auto_153510 ) ) ( not ( = ?auto_153509 ?auto_153511 ) ) ( not ( = ?auto_153509 ?auto_153512 ) ) ( not ( = ?auto_153509 ?auto_153513 ) ) ( not ( = ?auto_153510 ?auto_153511 ) ) ( not ( = ?auto_153510 ?auto_153512 ) ) ( not ( = ?auto_153510 ?auto_153513 ) ) ( not ( = ?auto_153511 ?auto_153512 ) ) ( not ( = ?auto_153511 ?auto_153513 ) ) ( not ( = ?auto_153512 ?auto_153513 ) ) ( ON ?auto_153513 ?auto_153514 ) ( not ( = ?auto_153507 ?auto_153514 ) ) ( not ( = ?auto_153508 ?auto_153514 ) ) ( not ( = ?auto_153509 ?auto_153514 ) ) ( not ( = ?auto_153510 ?auto_153514 ) ) ( not ( = ?auto_153511 ?auto_153514 ) ) ( not ( = ?auto_153512 ?auto_153514 ) ) ( not ( = ?auto_153513 ?auto_153514 ) ) ( ON ?auto_153512 ?auto_153513 ) ( ON-TABLE ?auto_153514 ) ( ON ?auto_153511 ?auto_153512 ) ( ON ?auto_153510 ?auto_153511 ) ( ON ?auto_153509 ?auto_153510 ) ( ON ?auto_153508 ?auto_153509 ) ( CLEAR ?auto_153508 ) ( HOLDING ?auto_153507 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_153507 )
      ( MAKE-7PILE ?auto_153507 ?auto_153508 ?auto_153509 ?auto_153510 ?auto_153511 ?auto_153512 ?auto_153513 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153515 - BLOCK
      ?auto_153516 - BLOCK
      ?auto_153517 - BLOCK
      ?auto_153518 - BLOCK
      ?auto_153519 - BLOCK
      ?auto_153520 - BLOCK
      ?auto_153521 - BLOCK
    )
    :vars
    (
      ?auto_153522 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153515 ?auto_153516 ) ) ( not ( = ?auto_153515 ?auto_153517 ) ) ( not ( = ?auto_153515 ?auto_153518 ) ) ( not ( = ?auto_153515 ?auto_153519 ) ) ( not ( = ?auto_153515 ?auto_153520 ) ) ( not ( = ?auto_153515 ?auto_153521 ) ) ( not ( = ?auto_153516 ?auto_153517 ) ) ( not ( = ?auto_153516 ?auto_153518 ) ) ( not ( = ?auto_153516 ?auto_153519 ) ) ( not ( = ?auto_153516 ?auto_153520 ) ) ( not ( = ?auto_153516 ?auto_153521 ) ) ( not ( = ?auto_153517 ?auto_153518 ) ) ( not ( = ?auto_153517 ?auto_153519 ) ) ( not ( = ?auto_153517 ?auto_153520 ) ) ( not ( = ?auto_153517 ?auto_153521 ) ) ( not ( = ?auto_153518 ?auto_153519 ) ) ( not ( = ?auto_153518 ?auto_153520 ) ) ( not ( = ?auto_153518 ?auto_153521 ) ) ( not ( = ?auto_153519 ?auto_153520 ) ) ( not ( = ?auto_153519 ?auto_153521 ) ) ( not ( = ?auto_153520 ?auto_153521 ) ) ( ON ?auto_153521 ?auto_153522 ) ( not ( = ?auto_153515 ?auto_153522 ) ) ( not ( = ?auto_153516 ?auto_153522 ) ) ( not ( = ?auto_153517 ?auto_153522 ) ) ( not ( = ?auto_153518 ?auto_153522 ) ) ( not ( = ?auto_153519 ?auto_153522 ) ) ( not ( = ?auto_153520 ?auto_153522 ) ) ( not ( = ?auto_153521 ?auto_153522 ) ) ( ON ?auto_153520 ?auto_153521 ) ( ON-TABLE ?auto_153522 ) ( ON ?auto_153519 ?auto_153520 ) ( ON ?auto_153518 ?auto_153519 ) ( ON ?auto_153517 ?auto_153518 ) ( ON ?auto_153516 ?auto_153517 ) ( ON ?auto_153515 ?auto_153516 ) ( CLEAR ?auto_153515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_153522 ?auto_153521 ?auto_153520 ?auto_153519 ?auto_153518 ?auto_153517 ?auto_153516 )
      ( MAKE-7PILE ?auto_153515 ?auto_153516 ?auto_153517 ?auto_153518 ?auto_153519 ?auto_153520 ?auto_153521 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153523 - BLOCK
      ?auto_153524 - BLOCK
      ?auto_153525 - BLOCK
      ?auto_153526 - BLOCK
      ?auto_153527 - BLOCK
      ?auto_153528 - BLOCK
      ?auto_153529 - BLOCK
    )
    :vars
    (
      ?auto_153530 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153523 ?auto_153524 ) ) ( not ( = ?auto_153523 ?auto_153525 ) ) ( not ( = ?auto_153523 ?auto_153526 ) ) ( not ( = ?auto_153523 ?auto_153527 ) ) ( not ( = ?auto_153523 ?auto_153528 ) ) ( not ( = ?auto_153523 ?auto_153529 ) ) ( not ( = ?auto_153524 ?auto_153525 ) ) ( not ( = ?auto_153524 ?auto_153526 ) ) ( not ( = ?auto_153524 ?auto_153527 ) ) ( not ( = ?auto_153524 ?auto_153528 ) ) ( not ( = ?auto_153524 ?auto_153529 ) ) ( not ( = ?auto_153525 ?auto_153526 ) ) ( not ( = ?auto_153525 ?auto_153527 ) ) ( not ( = ?auto_153525 ?auto_153528 ) ) ( not ( = ?auto_153525 ?auto_153529 ) ) ( not ( = ?auto_153526 ?auto_153527 ) ) ( not ( = ?auto_153526 ?auto_153528 ) ) ( not ( = ?auto_153526 ?auto_153529 ) ) ( not ( = ?auto_153527 ?auto_153528 ) ) ( not ( = ?auto_153527 ?auto_153529 ) ) ( not ( = ?auto_153528 ?auto_153529 ) ) ( ON ?auto_153529 ?auto_153530 ) ( not ( = ?auto_153523 ?auto_153530 ) ) ( not ( = ?auto_153524 ?auto_153530 ) ) ( not ( = ?auto_153525 ?auto_153530 ) ) ( not ( = ?auto_153526 ?auto_153530 ) ) ( not ( = ?auto_153527 ?auto_153530 ) ) ( not ( = ?auto_153528 ?auto_153530 ) ) ( not ( = ?auto_153529 ?auto_153530 ) ) ( ON ?auto_153528 ?auto_153529 ) ( ON-TABLE ?auto_153530 ) ( ON ?auto_153527 ?auto_153528 ) ( ON ?auto_153526 ?auto_153527 ) ( ON ?auto_153525 ?auto_153526 ) ( ON ?auto_153524 ?auto_153525 ) ( HOLDING ?auto_153523 ) ( CLEAR ?auto_153524 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_153530 ?auto_153529 ?auto_153528 ?auto_153527 ?auto_153526 ?auto_153525 ?auto_153524 ?auto_153523 )
      ( MAKE-7PILE ?auto_153523 ?auto_153524 ?auto_153525 ?auto_153526 ?auto_153527 ?auto_153528 ?auto_153529 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153531 - BLOCK
      ?auto_153532 - BLOCK
      ?auto_153533 - BLOCK
      ?auto_153534 - BLOCK
      ?auto_153535 - BLOCK
      ?auto_153536 - BLOCK
      ?auto_153537 - BLOCK
    )
    :vars
    (
      ?auto_153538 - BLOCK
      ?auto_153539 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153531 ?auto_153532 ) ) ( not ( = ?auto_153531 ?auto_153533 ) ) ( not ( = ?auto_153531 ?auto_153534 ) ) ( not ( = ?auto_153531 ?auto_153535 ) ) ( not ( = ?auto_153531 ?auto_153536 ) ) ( not ( = ?auto_153531 ?auto_153537 ) ) ( not ( = ?auto_153532 ?auto_153533 ) ) ( not ( = ?auto_153532 ?auto_153534 ) ) ( not ( = ?auto_153532 ?auto_153535 ) ) ( not ( = ?auto_153532 ?auto_153536 ) ) ( not ( = ?auto_153532 ?auto_153537 ) ) ( not ( = ?auto_153533 ?auto_153534 ) ) ( not ( = ?auto_153533 ?auto_153535 ) ) ( not ( = ?auto_153533 ?auto_153536 ) ) ( not ( = ?auto_153533 ?auto_153537 ) ) ( not ( = ?auto_153534 ?auto_153535 ) ) ( not ( = ?auto_153534 ?auto_153536 ) ) ( not ( = ?auto_153534 ?auto_153537 ) ) ( not ( = ?auto_153535 ?auto_153536 ) ) ( not ( = ?auto_153535 ?auto_153537 ) ) ( not ( = ?auto_153536 ?auto_153537 ) ) ( ON ?auto_153537 ?auto_153538 ) ( not ( = ?auto_153531 ?auto_153538 ) ) ( not ( = ?auto_153532 ?auto_153538 ) ) ( not ( = ?auto_153533 ?auto_153538 ) ) ( not ( = ?auto_153534 ?auto_153538 ) ) ( not ( = ?auto_153535 ?auto_153538 ) ) ( not ( = ?auto_153536 ?auto_153538 ) ) ( not ( = ?auto_153537 ?auto_153538 ) ) ( ON ?auto_153536 ?auto_153537 ) ( ON-TABLE ?auto_153538 ) ( ON ?auto_153535 ?auto_153536 ) ( ON ?auto_153534 ?auto_153535 ) ( ON ?auto_153533 ?auto_153534 ) ( ON ?auto_153532 ?auto_153533 ) ( CLEAR ?auto_153532 ) ( ON ?auto_153531 ?auto_153539 ) ( CLEAR ?auto_153531 ) ( HAND-EMPTY ) ( not ( = ?auto_153531 ?auto_153539 ) ) ( not ( = ?auto_153532 ?auto_153539 ) ) ( not ( = ?auto_153533 ?auto_153539 ) ) ( not ( = ?auto_153534 ?auto_153539 ) ) ( not ( = ?auto_153535 ?auto_153539 ) ) ( not ( = ?auto_153536 ?auto_153539 ) ) ( not ( = ?auto_153537 ?auto_153539 ) ) ( not ( = ?auto_153538 ?auto_153539 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_153531 ?auto_153539 )
      ( MAKE-7PILE ?auto_153531 ?auto_153532 ?auto_153533 ?auto_153534 ?auto_153535 ?auto_153536 ?auto_153537 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153540 - BLOCK
      ?auto_153541 - BLOCK
      ?auto_153542 - BLOCK
      ?auto_153543 - BLOCK
      ?auto_153544 - BLOCK
      ?auto_153545 - BLOCK
      ?auto_153546 - BLOCK
    )
    :vars
    (
      ?auto_153548 - BLOCK
      ?auto_153547 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153540 ?auto_153541 ) ) ( not ( = ?auto_153540 ?auto_153542 ) ) ( not ( = ?auto_153540 ?auto_153543 ) ) ( not ( = ?auto_153540 ?auto_153544 ) ) ( not ( = ?auto_153540 ?auto_153545 ) ) ( not ( = ?auto_153540 ?auto_153546 ) ) ( not ( = ?auto_153541 ?auto_153542 ) ) ( not ( = ?auto_153541 ?auto_153543 ) ) ( not ( = ?auto_153541 ?auto_153544 ) ) ( not ( = ?auto_153541 ?auto_153545 ) ) ( not ( = ?auto_153541 ?auto_153546 ) ) ( not ( = ?auto_153542 ?auto_153543 ) ) ( not ( = ?auto_153542 ?auto_153544 ) ) ( not ( = ?auto_153542 ?auto_153545 ) ) ( not ( = ?auto_153542 ?auto_153546 ) ) ( not ( = ?auto_153543 ?auto_153544 ) ) ( not ( = ?auto_153543 ?auto_153545 ) ) ( not ( = ?auto_153543 ?auto_153546 ) ) ( not ( = ?auto_153544 ?auto_153545 ) ) ( not ( = ?auto_153544 ?auto_153546 ) ) ( not ( = ?auto_153545 ?auto_153546 ) ) ( ON ?auto_153546 ?auto_153548 ) ( not ( = ?auto_153540 ?auto_153548 ) ) ( not ( = ?auto_153541 ?auto_153548 ) ) ( not ( = ?auto_153542 ?auto_153548 ) ) ( not ( = ?auto_153543 ?auto_153548 ) ) ( not ( = ?auto_153544 ?auto_153548 ) ) ( not ( = ?auto_153545 ?auto_153548 ) ) ( not ( = ?auto_153546 ?auto_153548 ) ) ( ON ?auto_153545 ?auto_153546 ) ( ON-TABLE ?auto_153548 ) ( ON ?auto_153544 ?auto_153545 ) ( ON ?auto_153543 ?auto_153544 ) ( ON ?auto_153542 ?auto_153543 ) ( ON ?auto_153540 ?auto_153547 ) ( CLEAR ?auto_153540 ) ( not ( = ?auto_153540 ?auto_153547 ) ) ( not ( = ?auto_153541 ?auto_153547 ) ) ( not ( = ?auto_153542 ?auto_153547 ) ) ( not ( = ?auto_153543 ?auto_153547 ) ) ( not ( = ?auto_153544 ?auto_153547 ) ) ( not ( = ?auto_153545 ?auto_153547 ) ) ( not ( = ?auto_153546 ?auto_153547 ) ) ( not ( = ?auto_153548 ?auto_153547 ) ) ( HOLDING ?auto_153541 ) ( CLEAR ?auto_153542 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_153548 ?auto_153546 ?auto_153545 ?auto_153544 ?auto_153543 ?auto_153542 ?auto_153541 )
      ( MAKE-7PILE ?auto_153540 ?auto_153541 ?auto_153542 ?auto_153543 ?auto_153544 ?auto_153545 ?auto_153546 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153549 - BLOCK
      ?auto_153550 - BLOCK
      ?auto_153551 - BLOCK
      ?auto_153552 - BLOCK
      ?auto_153553 - BLOCK
      ?auto_153554 - BLOCK
      ?auto_153555 - BLOCK
    )
    :vars
    (
      ?auto_153556 - BLOCK
      ?auto_153557 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153549 ?auto_153550 ) ) ( not ( = ?auto_153549 ?auto_153551 ) ) ( not ( = ?auto_153549 ?auto_153552 ) ) ( not ( = ?auto_153549 ?auto_153553 ) ) ( not ( = ?auto_153549 ?auto_153554 ) ) ( not ( = ?auto_153549 ?auto_153555 ) ) ( not ( = ?auto_153550 ?auto_153551 ) ) ( not ( = ?auto_153550 ?auto_153552 ) ) ( not ( = ?auto_153550 ?auto_153553 ) ) ( not ( = ?auto_153550 ?auto_153554 ) ) ( not ( = ?auto_153550 ?auto_153555 ) ) ( not ( = ?auto_153551 ?auto_153552 ) ) ( not ( = ?auto_153551 ?auto_153553 ) ) ( not ( = ?auto_153551 ?auto_153554 ) ) ( not ( = ?auto_153551 ?auto_153555 ) ) ( not ( = ?auto_153552 ?auto_153553 ) ) ( not ( = ?auto_153552 ?auto_153554 ) ) ( not ( = ?auto_153552 ?auto_153555 ) ) ( not ( = ?auto_153553 ?auto_153554 ) ) ( not ( = ?auto_153553 ?auto_153555 ) ) ( not ( = ?auto_153554 ?auto_153555 ) ) ( ON ?auto_153555 ?auto_153556 ) ( not ( = ?auto_153549 ?auto_153556 ) ) ( not ( = ?auto_153550 ?auto_153556 ) ) ( not ( = ?auto_153551 ?auto_153556 ) ) ( not ( = ?auto_153552 ?auto_153556 ) ) ( not ( = ?auto_153553 ?auto_153556 ) ) ( not ( = ?auto_153554 ?auto_153556 ) ) ( not ( = ?auto_153555 ?auto_153556 ) ) ( ON ?auto_153554 ?auto_153555 ) ( ON-TABLE ?auto_153556 ) ( ON ?auto_153553 ?auto_153554 ) ( ON ?auto_153552 ?auto_153553 ) ( ON ?auto_153551 ?auto_153552 ) ( ON ?auto_153549 ?auto_153557 ) ( not ( = ?auto_153549 ?auto_153557 ) ) ( not ( = ?auto_153550 ?auto_153557 ) ) ( not ( = ?auto_153551 ?auto_153557 ) ) ( not ( = ?auto_153552 ?auto_153557 ) ) ( not ( = ?auto_153553 ?auto_153557 ) ) ( not ( = ?auto_153554 ?auto_153557 ) ) ( not ( = ?auto_153555 ?auto_153557 ) ) ( not ( = ?auto_153556 ?auto_153557 ) ) ( CLEAR ?auto_153551 ) ( ON ?auto_153550 ?auto_153549 ) ( CLEAR ?auto_153550 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_153557 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_153557 ?auto_153549 )
      ( MAKE-7PILE ?auto_153549 ?auto_153550 ?auto_153551 ?auto_153552 ?auto_153553 ?auto_153554 ?auto_153555 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153558 - BLOCK
      ?auto_153559 - BLOCK
      ?auto_153560 - BLOCK
      ?auto_153561 - BLOCK
      ?auto_153562 - BLOCK
      ?auto_153563 - BLOCK
      ?auto_153564 - BLOCK
    )
    :vars
    (
      ?auto_153566 - BLOCK
      ?auto_153565 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153558 ?auto_153559 ) ) ( not ( = ?auto_153558 ?auto_153560 ) ) ( not ( = ?auto_153558 ?auto_153561 ) ) ( not ( = ?auto_153558 ?auto_153562 ) ) ( not ( = ?auto_153558 ?auto_153563 ) ) ( not ( = ?auto_153558 ?auto_153564 ) ) ( not ( = ?auto_153559 ?auto_153560 ) ) ( not ( = ?auto_153559 ?auto_153561 ) ) ( not ( = ?auto_153559 ?auto_153562 ) ) ( not ( = ?auto_153559 ?auto_153563 ) ) ( not ( = ?auto_153559 ?auto_153564 ) ) ( not ( = ?auto_153560 ?auto_153561 ) ) ( not ( = ?auto_153560 ?auto_153562 ) ) ( not ( = ?auto_153560 ?auto_153563 ) ) ( not ( = ?auto_153560 ?auto_153564 ) ) ( not ( = ?auto_153561 ?auto_153562 ) ) ( not ( = ?auto_153561 ?auto_153563 ) ) ( not ( = ?auto_153561 ?auto_153564 ) ) ( not ( = ?auto_153562 ?auto_153563 ) ) ( not ( = ?auto_153562 ?auto_153564 ) ) ( not ( = ?auto_153563 ?auto_153564 ) ) ( ON ?auto_153564 ?auto_153566 ) ( not ( = ?auto_153558 ?auto_153566 ) ) ( not ( = ?auto_153559 ?auto_153566 ) ) ( not ( = ?auto_153560 ?auto_153566 ) ) ( not ( = ?auto_153561 ?auto_153566 ) ) ( not ( = ?auto_153562 ?auto_153566 ) ) ( not ( = ?auto_153563 ?auto_153566 ) ) ( not ( = ?auto_153564 ?auto_153566 ) ) ( ON ?auto_153563 ?auto_153564 ) ( ON-TABLE ?auto_153566 ) ( ON ?auto_153562 ?auto_153563 ) ( ON ?auto_153561 ?auto_153562 ) ( ON ?auto_153558 ?auto_153565 ) ( not ( = ?auto_153558 ?auto_153565 ) ) ( not ( = ?auto_153559 ?auto_153565 ) ) ( not ( = ?auto_153560 ?auto_153565 ) ) ( not ( = ?auto_153561 ?auto_153565 ) ) ( not ( = ?auto_153562 ?auto_153565 ) ) ( not ( = ?auto_153563 ?auto_153565 ) ) ( not ( = ?auto_153564 ?auto_153565 ) ) ( not ( = ?auto_153566 ?auto_153565 ) ) ( ON ?auto_153559 ?auto_153558 ) ( CLEAR ?auto_153559 ) ( ON-TABLE ?auto_153565 ) ( HOLDING ?auto_153560 ) ( CLEAR ?auto_153561 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_153566 ?auto_153564 ?auto_153563 ?auto_153562 ?auto_153561 ?auto_153560 )
      ( MAKE-7PILE ?auto_153558 ?auto_153559 ?auto_153560 ?auto_153561 ?auto_153562 ?auto_153563 ?auto_153564 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153567 - BLOCK
      ?auto_153568 - BLOCK
      ?auto_153569 - BLOCK
      ?auto_153570 - BLOCK
      ?auto_153571 - BLOCK
      ?auto_153572 - BLOCK
      ?auto_153573 - BLOCK
    )
    :vars
    (
      ?auto_153575 - BLOCK
      ?auto_153574 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153567 ?auto_153568 ) ) ( not ( = ?auto_153567 ?auto_153569 ) ) ( not ( = ?auto_153567 ?auto_153570 ) ) ( not ( = ?auto_153567 ?auto_153571 ) ) ( not ( = ?auto_153567 ?auto_153572 ) ) ( not ( = ?auto_153567 ?auto_153573 ) ) ( not ( = ?auto_153568 ?auto_153569 ) ) ( not ( = ?auto_153568 ?auto_153570 ) ) ( not ( = ?auto_153568 ?auto_153571 ) ) ( not ( = ?auto_153568 ?auto_153572 ) ) ( not ( = ?auto_153568 ?auto_153573 ) ) ( not ( = ?auto_153569 ?auto_153570 ) ) ( not ( = ?auto_153569 ?auto_153571 ) ) ( not ( = ?auto_153569 ?auto_153572 ) ) ( not ( = ?auto_153569 ?auto_153573 ) ) ( not ( = ?auto_153570 ?auto_153571 ) ) ( not ( = ?auto_153570 ?auto_153572 ) ) ( not ( = ?auto_153570 ?auto_153573 ) ) ( not ( = ?auto_153571 ?auto_153572 ) ) ( not ( = ?auto_153571 ?auto_153573 ) ) ( not ( = ?auto_153572 ?auto_153573 ) ) ( ON ?auto_153573 ?auto_153575 ) ( not ( = ?auto_153567 ?auto_153575 ) ) ( not ( = ?auto_153568 ?auto_153575 ) ) ( not ( = ?auto_153569 ?auto_153575 ) ) ( not ( = ?auto_153570 ?auto_153575 ) ) ( not ( = ?auto_153571 ?auto_153575 ) ) ( not ( = ?auto_153572 ?auto_153575 ) ) ( not ( = ?auto_153573 ?auto_153575 ) ) ( ON ?auto_153572 ?auto_153573 ) ( ON-TABLE ?auto_153575 ) ( ON ?auto_153571 ?auto_153572 ) ( ON ?auto_153570 ?auto_153571 ) ( ON ?auto_153567 ?auto_153574 ) ( not ( = ?auto_153567 ?auto_153574 ) ) ( not ( = ?auto_153568 ?auto_153574 ) ) ( not ( = ?auto_153569 ?auto_153574 ) ) ( not ( = ?auto_153570 ?auto_153574 ) ) ( not ( = ?auto_153571 ?auto_153574 ) ) ( not ( = ?auto_153572 ?auto_153574 ) ) ( not ( = ?auto_153573 ?auto_153574 ) ) ( not ( = ?auto_153575 ?auto_153574 ) ) ( ON ?auto_153568 ?auto_153567 ) ( ON-TABLE ?auto_153574 ) ( CLEAR ?auto_153570 ) ( ON ?auto_153569 ?auto_153568 ) ( CLEAR ?auto_153569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_153574 ?auto_153567 ?auto_153568 )
      ( MAKE-7PILE ?auto_153567 ?auto_153568 ?auto_153569 ?auto_153570 ?auto_153571 ?auto_153572 ?auto_153573 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153576 - BLOCK
      ?auto_153577 - BLOCK
      ?auto_153578 - BLOCK
      ?auto_153579 - BLOCK
      ?auto_153580 - BLOCK
      ?auto_153581 - BLOCK
      ?auto_153582 - BLOCK
    )
    :vars
    (
      ?auto_153583 - BLOCK
      ?auto_153584 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153576 ?auto_153577 ) ) ( not ( = ?auto_153576 ?auto_153578 ) ) ( not ( = ?auto_153576 ?auto_153579 ) ) ( not ( = ?auto_153576 ?auto_153580 ) ) ( not ( = ?auto_153576 ?auto_153581 ) ) ( not ( = ?auto_153576 ?auto_153582 ) ) ( not ( = ?auto_153577 ?auto_153578 ) ) ( not ( = ?auto_153577 ?auto_153579 ) ) ( not ( = ?auto_153577 ?auto_153580 ) ) ( not ( = ?auto_153577 ?auto_153581 ) ) ( not ( = ?auto_153577 ?auto_153582 ) ) ( not ( = ?auto_153578 ?auto_153579 ) ) ( not ( = ?auto_153578 ?auto_153580 ) ) ( not ( = ?auto_153578 ?auto_153581 ) ) ( not ( = ?auto_153578 ?auto_153582 ) ) ( not ( = ?auto_153579 ?auto_153580 ) ) ( not ( = ?auto_153579 ?auto_153581 ) ) ( not ( = ?auto_153579 ?auto_153582 ) ) ( not ( = ?auto_153580 ?auto_153581 ) ) ( not ( = ?auto_153580 ?auto_153582 ) ) ( not ( = ?auto_153581 ?auto_153582 ) ) ( ON ?auto_153582 ?auto_153583 ) ( not ( = ?auto_153576 ?auto_153583 ) ) ( not ( = ?auto_153577 ?auto_153583 ) ) ( not ( = ?auto_153578 ?auto_153583 ) ) ( not ( = ?auto_153579 ?auto_153583 ) ) ( not ( = ?auto_153580 ?auto_153583 ) ) ( not ( = ?auto_153581 ?auto_153583 ) ) ( not ( = ?auto_153582 ?auto_153583 ) ) ( ON ?auto_153581 ?auto_153582 ) ( ON-TABLE ?auto_153583 ) ( ON ?auto_153580 ?auto_153581 ) ( ON ?auto_153576 ?auto_153584 ) ( not ( = ?auto_153576 ?auto_153584 ) ) ( not ( = ?auto_153577 ?auto_153584 ) ) ( not ( = ?auto_153578 ?auto_153584 ) ) ( not ( = ?auto_153579 ?auto_153584 ) ) ( not ( = ?auto_153580 ?auto_153584 ) ) ( not ( = ?auto_153581 ?auto_153584 ) ) ( not ( = ?auto_153582 ?auto_153584 ) ) ( not ( = ?auto_153583 ?auto_153584 ) ) ( ON ?auto_153577 ?auto_153576 ) ( ON-TABLE ?auto_153584 ) ( ON ?auto_153578 ?auto_153577 ) ( CLEAR ?auto_153578 ) ( HOLDING ?auto_153579 ) ( CLEAR ?auto_153580 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_153583 ?auto_153582 ?auto_153581 ?auto_153580 ?auto_153579 )
      ( MAKE-7PILE ?auto_153576 ?auto_153577 ?auto_153578 ?auto_153579 ?auto_153580 ?auto_153581 ?auto_153582 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153585 - BLOCK
      ?auto_153586 - BLOCK
      ?auto_153587 - BLOCK
      ?auto_153588 - BLOCK
      ?auto_153589 - BLOCK
      ?auto_153590 - BLOCK
      ?auto_153591 - BLOCK
    )
    :vars
    (
      ?auto_153593 - BLOCK
      ?auto_153592 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153585 ?auto_153586 ) ) ( not ( = ?auto_153585 ?auto_153587 ) ) ( not ( = ?auto_153585 ?auto_153588 ) ) ( not ( = ?auto_153585 ?auto_153589 ) ) ( not ( = ?auto_153585 ?auto_153590 ) ) ( not ( = ?auto_153585 ?auto_153591 ) ) ( not ( = ?auto_153586 ?auto_153587 ) ) ( not ( = ?auto_153586 ?auto_153588 ) ) ( not ( = ?auto_153586 ?auto_153589 ) ) ( not ( = ?auto_153586 ?auto_153590 ) ) ( not ( = ?auto_153586 ?auto_153591 ) ) ( not ( = ?auto_153587 ?auto_153588 ) ) ( not ( = ?auto_153587 ?auto_153589 ) ) ( not ( = ?auto_153587 ?auto_153590 ) ) ( not ( = ?auto_153587 ?auto_153591 ) ) ( not ( = ?auto_153588 ?auto_153589 ) ) ( not ( = ?auto_153588 ?auto_153590 ) ) ( not ( = ?auto_153588 ?auto_153591 ) ) ( not ( = ?auto_153589 ?auto_153590 ) ) ( not ( = ?auto_153589 ?auto_153591 ) ) ( not ( = ?auto_153590 ?auto_153591 ) ) ( ON ?auto_153591 ?auto_153593 ) ( not ( = ?auto_153585 ?auto_153593 ) ) ( not ( = ?auto_153586 ?auto_153593 ) ) ( not ( = ?auto_153587 ?auto_153593 ) ) ( not ( = ?auto_153588 ?auto_153593 ) ) ( not ( = ?auto_153589 ?auto_153593 ) ) ( not ( = ?auto_153590 ?auto_153593 ) ) ( not ( = ?auto_153591 ?auto_153593 ) ) ( ON ?auto_153590 ?auto_153591 ) ( ON-TABLE ?auto_153593 ) ( ON ?auto_153589 ?auto_153590 ) ( ON ?auto_153585 ?auto_153592 ) ( not ( = ?auto_153585 ?auto_153592 ) ) ( not ( = ?auto_153586 ?auto_153592 ) ) ( not ( = ?auto_153587 ?auto_153592 ) ) ( not ( = ?auto_153588 ?auto_153592 ) ) ( not ( = ?auto_153589 ?auto_153592 ) ) ( not ( = ?auto_153590 ?auto_153592 ) ) ( not ( = ?auto_153591 ?auto_153592 ) ) ( not ( = ?auto_153593 ?auto_153592 ) ) ( ON ?auto_153586 ?auto_153585 ) ( ON-TABLE ?auto_153592 ) ( ON ?auto_153587 ?auto_153586 ) ( CLEAR ?auto_153589 ) ( ON ?auto_153588 ?auto_153587 ) ( CLEAR ?auto_153588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_153592 ?auto_153585 ?auto_153586 ?auto_153587 )
      ( MAKE-7PILE ?auto_153585 ?auto_153586 ?auto_153587 ?auto_153588 ?auto_153589 ?auto_153590 ?auto_153591 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153594 - BLOCK
      ?auto_153595 - BLOCK
      ?auto_153596 - BLOCK
      ?auto_153597 - BLOCK
      ?auto_153598 - BLOCK
      ?auto_153599 - BLOCK
      ?auto_153600 - BLOCK
    )
    :vars
    (
      ?auto_153601 - BLOCK
      ?auto_153602 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153594 ?auto_153595 ) ) ( not ( = ?auto_153594 ?auto_153596 ) ) ( not ( = ?auto_153594 ?auto_153597 ) ) ( not ( = ?auto_153594 ?auto_153598 ) ) ( not ( = ?auto_153594 ?auto_153599 ) ) ( not ( = ?auto_153594 ?auto_153600 ) ) ( not ( = ?auto_153595 ?auto_153596 ) ) ( not ( = ?auto_153595 ?auto_153597 ) ) ( not ( = ?auto_153595 ?auto_153598 ) ) ( not ( = ?auto_153595 ?auto_153599 ) ) ( not ( = ?auto_153595 ?auto_153600 ) ) ( not ( = ?auto_153596 ?auto_153597 ) ) ( not ( = ?auto_153596 ?auto_153598 ) ) ( not ( = ?auto_153596 ?auto_153599 ) ) ( not ( = ?auto_153596 ?auto_153600 ) ) ( not ( = ?auto_153597 ?auto_153598 ) ) ( not ( = ?auto_153597 ?auto_153599 ) ) ( not ( = ?auto_153597 ?auto_153600 ) ) ( not ( = ?auto_153598 ?auto_153599 ) ) ( not ( = ?auto_153598 ?auto_153600 ) ) ( not ( = ?auto_153599 ?auto_153600 ) ) ( ON ?auto_153600 ?auto_153601 ) ( not ( = ?auto_153594 ?auto_153601 ) ) ( not ( = ?auto_153595 ?auto_153601 ) ) ( not ( = ?auto_153596 ?auto_153601 ) ) ( not ( = ?auto_153597 ?auto_153601 ) ) ( not ( = ?auto_153598 ?auto_153601 ) ) ( not ( = ?auto_153599 ?auto_153601 ) ) ( not ( = ?auto_153600 ?auto_153601 ) ) ( ON ?auto_153599 ?auto_153600 ) ( ON-TABLE ?auto_153601 ) ( ON ?auto_153594 ?auto_153602 ) ( not ( = ?auto_153594 ?auto_153602 ) ) ( not ( = ?auto_153595 ?auto_153602 ) ) ( not ( = ?auto_153596 ?auto_153602 ) ) ( not ( = ?auto_153597 ?auto_153602 ) ) ( not ( = ?auto_153598 ?auto_153602 ) ) ( not ( = ?auto_153599 ?auto_153602 ) ) ( not ( = ?auto_153600 ?auto_153602 ) ) ( not ( = ?auto_153601 ?auto_153602 ) ) ( ON ?auto_153595 ?auto_153594 ) ( ON-TABLE ?auto_153602 ) ( ON ?auto_153596 ?auto_153595 ) ( ON ?auto_153597 ?auto_153596 ) ( CLEAR ?auto_153597 ) ( HOLDING ?auto_153598 ) ( CLEAR ?auto_153599 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_153601 ?auto_153600 ?auto_153599 ?auto_153598 )
      ( MAKE-7PILE ?auto_153594 ?auto_153595 ?auto_153596 ?auto_153597 ?auto_153598 ?auto_153599 ?auto_153600 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153603 - BLOCK
      ?auto_153604 - BLOCK
      ?auto_153605 - BLOCK
      ?auto_153606 - BLOCK
      ?auto_153607 - BLOCK
      ?auto_153608 - BLOCK
      ?auto_153609 - BLOCK
    )
    :vars
    (
      ?auto_153610 - BLOCK
      ?auto_153611 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153603 ?auto_153604 ) ) ( not ( = ?auto_153603 ?auto_153605 ) ) ( not ( = ?auto_153603 ?auto_153606 ) ) ( not ( = ?auto_153603 ?auto_153607 ) ) ( not ( = ?auto_153603 ?auto_153608 ) ) ( not ( = ?auto_153603 ?auto_153609 ) ) ( not ( = ?auto_153604 ?auto_153605 ) ) ( not ( = ?auto_153604 ?auto_153606 ) ) ( not ( = ?auto_153604 ?auto_153607 ) ) ( not ( = ?auto_153604 ?auto_153608 ) ) ( not ( = ?auto_153604 ?auto_153609 ) ) ( not ( = ?auto_153605 ?auto_153606 ) ) ( not ( = ?auto_153605 ?auto_153607 ) ) ( not ( = ?auto_153605 ?auto_153608 ) ) ( not ( = ?auto_153605 ?auto_153609 ) ) ( not ( = ?auto_153606 ?auto_153607 ) ) ( not ( = ?auto_153606 ?auto_153608 ) ) ( not ( = ?auto_153606 ?auto_153609 ) ) ( not ( = ?auto_153607 ?auto_153608 ) ) ( not ( = ?auto_153607 ?auto_153609 ) ) ( not ( = ?auto_153608 ?auto_153609 ) ) ( ON ?auto_153609 ?auto_153610 ) ( not ( = ?auto_153603 ?auto_153610 ) ) ( not ( = ?auto_153604 ?auto_153610 ) ) ( not ( = ?auto_153605 ?auto_153610 ) ) ( not ( = ?auto_153606 ?auto_153610 ) ) ( not ( = ?auto_153607 ?auto_153610 ) ) ( not ( = ?auto_153608 ?auto_153610 ) ) ( not ( = ?auto_153609 ?auto_153610 ) ) ( ON ?auto_153608 ?auto_153609 ) ( ON-TABLE ?auto_153610 ) ( ON ?auto_153603 ?auto_153611 ) ( not ( = ?auto_153603 ?auto_153611 ) ) ( not ( = ?auto_153604 ?auto_153611 ) ) ( not ( = ?auto_153605 ?auto_153611 ) ) ( not ( = ?auto_153606 ?auto_153611 ) ) ( not ( = ?auto_153607 ?auto_153611 ) ) ( not ( = ?auto_153608 ?auto_153611 ) ) ( not ( = ?auto_153609 ?auto_153611 ) ) ( not ( = ?auto_153610 ?auto_153611 ) ) ( ON ?auto_153604 ?auto_153603 ) ( ON-TABLE ?auto_153611 ) ( ON ?auto_153605 ?auto_153604 ) ( ON ?auto_153606 ?auto_153605 ) ( CLEAR ?auto_153608 ) ( ON ?auto_153607 ?auto_153606 ) ( CLEAR ?auto_153607 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_153611 ?auto_153603 ?auto_153604 ?auto_153605 ?auto_153606 )
      ( MAKE-7PILE ?auto_153603 ?auto_153604 ?auto_153605 ?auto_153606 ?auto_153607 ?auto_153608 ?auto_153609 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153612 - BLOCK
      ?auto_153613 - BLOCK
      ?auto_153614 - BLOCK
      ?auto_153615 - BLOCK
      ?auto_153616 - BLOCK
      ?auto_153617 - BLOCK
      ?auto_153618 - BLOCK
    )
    :vars
    (
      ?auto_153619 - BLOCK
      ?auto_153620 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153612 ?auto_153613 ) ) ( not ( = ?auto_153612 ?auto_153614 ) ) ( not ( = ?auto_153612 ?auto_153615 ) ) ( not ( = ?auto_153612 ?auto_153616 ) ) ( not ( = ?auto_153612 ?auto_153617 ) ) ( not ( = ?auto_153612 ?auto_153618 ) ) ( not ( = ?auto_153613 ?auto_153614 ) ) ( not ( = ?auto_153613 ?auto_153615 ) ) ( not ( = ?auto_153613 ?auto_153616 ) ) ( not ( = ?auto_153613 ?auto_153617 ) ) ( not ( = ?auto_153613 ?auto_153618 ) ) ( not ( = ?auto_153614 ?auto_153615 ) ) ( not ( = ?auto_153614 ?auto_153616 ) ) ( not ( = ?auto_153614 ?auto_153617 ) ) ( not ( = ?auto_153614 ?auto_153618 ) ) ( not ( = ?auto_153615 ?auto_153616 ) ) ( not ( = ?auto_153615 ?auto_153617 ) ) ( not ( = ?auto_153615 ?auto_153618 ) ) ( not ( = ?auto_153616 ?auto_153617 ) ) ( not ( = ?auto_153616 ?auto_153618 ) ) ( not ( = ?auto_153617 ?auto_153618 ) ) ( ON ?auto_153618 ?auto_153619 ) ( not ( = ?auto_153612 ?auto_153619 ) ) ( not ( = ?auto_153613 ?auto_153619 ) ) ( not ( = ?auto_153614 ?auto_153619 ) ) ( not ( = ?auto_153615 ?auto_153619 ) ) ( not ( = ?auto_153616 ?auto_153619 ) ) ( not ( = ?auto_153617 ?auto_153619 ) ) ( not ( = ?auto_153618 ?auto_153619 ) ) ( ON-TABLE ?auto_153619 ) ( ON ?auto_153612 ?auto_153620 ) ( not ( = ?auto_153612 ?auto_153620 ) ) ( not ( = ?auto_153613 ?auto_153620 ) ) ( not ( = ?auto_153614 ?auto_153620 ) ) ( not ( = ?auto_153615 ?auto_153620 ) ) ( not ( = ?auto_153616 ?auto_153620 ) ) ( not ( = ?auto_153617 ?auto_153620 ) ) ( not ( = ?auto_153618 ?auto_153620 ) ) ( not ( = ?auto_153619 ?auto_153620 ) ) ( ON ?auto_153613 ?auto_153612 ) ( ON-TABLE ?auto_153620 ) ( ON ?auto_153614 ?auto_153613 ) ( ON ?auto_153615 ?auto_153614 ) ( ON ?auto_153616 ?auto_153615 ) ( CLEAR ?auto_153616 ) ( HOLDING ?auto_153617 ) ( CLEAR ?auto_153618 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_153619 ?auto_153618 ?auto_153617 )
      ( MAKE-7PILE ?auto_153612 ?auto_153613 ?auto_153614 ?auto_153615 ?auto_153616 ?auto_153617 ?auto_153618 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153621 - BLOCK
      ?auto_153622 - BLOCK
      ?auto_153623 - BLOCK
      ?auto_153624 - BLOCK
      ?auto_153625 - BLOCK
      ?auto_153626 - BLOCK
      ?auto_153627 - BLOCK
    )
    :vars
    (
      ?auto_153628 - BLOCK
      ?auto_153629 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153621 ?auto_153622 ) ) ( not ( = ?auto_153621 ?auto_153623 ) ) ( not ( = ?auto_153621 ?auto_153624 ) ) ( not ( = ?auto_153621 ?auto_153625 ) ) ( not ( = ?auto_153621 ?auto_153626 ) ) ( not ( = ?auto_153621 ?auto_153627 ) ) ( not ( = ?auto_153622 ?auto_153623 ) ) ( not ( = ?auto_153622 ?auto_153624 ) ) ( not ( = ?auto_153622 ?auto_153625 ) ) ( not ( = ?auto_153622 ?auto_153626 ) ) ( not ( = ?auto_153622 ?auto_153627 ) ) ( not ( = ?auto_153623 ?auto_153624 ) ) ( not ( = ?auto_153623 ?auto_153625 ) ) ( not ( = ?auto_153623 ?auto_153626 ) ) ( not ( = ?auto_153623 ?auto_153627 ) ) ( not ( = ?auto_153624 ?auto_153625 ) ) ( not ( = ?auto_153624 ?auto_153626 ) ) ( not ( = ?auto_153624 ?auto_153627 ) ) ( not ( = ?auto_153625 ?auto_153626 ) ) ( not ( = ?auto_153625 ?auto_153627 ) ) ( not ( = ?auto_153626 ?auto_153627 ) ) ( ON ?auto_153627 ?auto_153628 ) ( not ( = ?auto_153621 ?auto_153628 ) ) ( not ( = ?auto_153622 ?auto_153628 ) ) ( not ( = ?auto_153623 ?auto_153628 ) ) ( not ( = ?auto_153624 ?auto_153628 ) ) ( not ( = ?auto_153625 ?auto_153628 ) ) ( not ( = ?auto_153626 ?auto_153628 ) ) ( not ( = ?auto_153627 ?auto_153628 ) ) ( ON-TABLE ?auto_153628 ) ( ON ?auto_153621 ?auto_153629 ) ( not ( = ?auto_153621 ?auto_153629 ) ) ( not ( = ?auto_153622 ?auto_153629 ) ) ( not ( = ?auto_153623 ?auto_153629 ) ) ( not ( = ?auto_153624 ?auto_153629 ) ) ( not ( = ?auto_153625 ?auto_153629 ) ) ( not ( = ?auto_153626 ?auto_153629 ) ) ( not ( = ?auto_153627 ?auto_153629 ) ) ( not ( = ?auto_153628 ?auto_153629 ) ) ( ON ?auto_153622 ?auto_153621 ) ( ON-TABLE ?auto_153629 ) ( ON ?auto_153623 ?auto_153622 ) ( ON ?auto_153624 ?auto_153623 ) ( ON ?auto_153625 ?auto_153624 ) ( CLEAR ?auto_153627 ) ( ON ?auto_153626 ?auto_153625 ) ( CLEAR ?auto_153626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_153629 ?auto_153621 ?auto_153622 ?auto_153623 ?auto_153624 ?auto_153625 )
      ( MAKE-7PILE ?auto_153621 ?auto_153622 ?auto_153623 ?auto_153624 ?auto_153625 ?auto_153626 ?auto_153627 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153630 - BLOCK
      ?auto_153631 - BLOCK
      ?auto_153632 - BLOCK
      ?auto_153633 - BLOCK
      ?auto_153634 - BLOCK
      ?auto_153635 - BLOCK
      ?auto_153636 - BLOCK
    )
    :vars
    (
      ?auto_153638 - BLOCK
      ?auto_153637 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153630 ?auto_153631 ) ) ( not ( = ?auto_153630 ?auto_153632 ) ) ( not ( = ?auto_153630 ?auto_153633 ) ) ( not ( = ?auto_153630 ?auto_153634 ) ) ( not ( = ?auto_153630 ?auto_153635 ) ) ( not ( = ?auto_153630 ?auto_153636 ) ) ( not ( = ?auto_153631 ?auto_153632 ) ) ( not ( = ?auto_153631 ?auto_153633 ) ) ( not ( = ?auto_153631 ?auto_153634 ) ) ( not ( = ?auto_153631 ?auto_153635 ) ) ( not ( = ?auto_153631 ?auto_153636 ) ) ( not ( = ?auto_153632 ?auto_153633 ) ) ( not ( = ?auto_153632 ?auto_153634 ) ) ( not ( = ?auto_153632 ?auto_153635 ) ) ( not ( = ?auto_153632 ?auto_153636 ) ) ( not ( = ?auto_153633 ?auto_153634 ) ) ( not ( = ?auto_153633 ?auto_153635 ) ) ( not ( = ?auto_153633 ?auto_153636 ) ) ( not ( = ?auto_153634 ?auto_153635 ) ) ( not ( = ?auto_153634 ?auto_153636 ) ) ( not ( = ?auto_153635 ?auto_153636 ) ) ( not ( = ?auto_153630 ?auto_153638 ) ) ( not ( = ?auto_153631 ?auto_153638 ) ) ( not ( = ?auto_153632 ?auto_153638 ) ) ( not ( = ?auto_153633 ?auto_153638 ) ) ( not ( = ?auto_153634 ?auto_153638 ) ) ( not ( = ?auto_153635 ?auto_153638 ) ) ( not ( = ?auto_153636 ?auto_153638 ) ) ( ON-TABLE ?auto_153638 ) ( ON ?auto_153630 ?auto_153637 ) ( not ( = ?auto_153630 ?auto_153637 ) ) ( not ( = ?auto_153631 ?auto_153637 ) ) ( not ( = ?auto_153632 ?auto_153637 ) ) ( not ( = ?auto_153633 ?auto_153637 ) ) ( not ( = ?auto_153634 ?auto_153637 ) ) ( not ( = ?auto_153635 ?auto_153637 ) ) ( not ( = ?auto_153636 ?auto_153637 ) ) ( not ( = ?auto_153638 ?auto_153637 ) ) ( ON ?auto_153631 ?auto_153630 ) ( ON-TABLE ?auto_153637 ) ( ON ?auto_153632 ?auto_153631 ) ( ON ?auto_153633 ?auto_153632 ) ( ON ?auto_153634 ?auto_153633 ) ( ON ?auto_153635 ?auto_153634 ) ( CLEAR ?auto_153635 ) ( HOLDING ?auto_153636 ) ( CLEAR ?auto_153638 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_153638 ?auto_153636 )
      ( MAKE-7PILE ?auto_153630 ?auto_153631 ?auto_153632 ?auto_153633 ?auto_153634 ?auto_153635 ?auto_153636 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153639 - BLOCK
      ?auto_153640 - BLOCK
      ?auto_153641 - BLOCK
      ?auto_153642 - BLOCK
      ?auto_153643 - BLOCK
      ?auto_153644 - BLOCK
      ?auto_153645 - BLOCK
    )
    :vars
    (
      ?auto_153647 - BLOCK
      ?auto_153646 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153639 ?auto_153640 ) ) ( not ( = ?auto_153639 ?auto_153641 ) ) ( not ( = ?auto_153639 ?auto_153642 ) ) ( not ( = ?auto_153639 ?auto_153643 ) ) ( not ( = ?auto_153639 ?auto_153644 ) ) ( not ( = ?auto_153639 ?auto_153645 ) ) ( not ( = ?auto_153640 ?auto_153641 ) ) ( not ( = ?auto_153640 ?auto_153642 ) ) ( not ( = ?auto_153640 ?auto_153643 ) ) ( not ( = ?auto_153640 ?auto_153644 ) ) ( not ( = ?auto_153640 ?auto_153645 ) ) ( not ( = ?auto_153641 ?auto_153642 ) ) ( not ( = ?auto_153641 ?auto_153643 ) ) ( not ( = ?auto_153641 ?auto_153644 ) ) ( not ( = ?auto_153641 ?auto_153645 ) ) ( not ( = ?auto_153642 ?auto_153643 ) ) ( not ( = ?auto_153642 ?auto_153644 ) ) ( not ( = ?auto_153642 ?auto_153645 ) ) ( not ( = ?auto_153643 ?auto_153644 ) ) ( not ( = ?auto_153643 ?auto_153645 ) ) ( not ( = ?auto_153644 ?auto_153645 ) ) ( not ( = ?auto_153639 ?auto_153647 ) ) ( not ( = ?auto_153640 ?auto_153647 ) ) ( not ( = ?auto_153641 ?auto_153647 ) ) ( not ( = ?auto_153642 ?auto_153647 ) ) ( not ( = ?auto_153643 ?auto_153647 ) ) ( not ( = ?auto_153644 ?auto_153647 ) ) ( not ( = ?auto_153645 ?auto_153647 ) ) ( ON-TABLE ?auto_153647 ) ( ON ?auto_153639 ?auto_153646 ) ( not ( = ?auto_153639 ?auto_153646 ) ) ( not ( = ?auto_153640 ?auto_153646 ) ) ( not ( = ?auto_153641 ?auto_153646 ) ) ( not ( = ?auto_153642 ?auto_153646 ) ) ( not ( = ?auto_153643 ?auto_153646 ) ) ( not ( = ?auto_153644 ?auto_153646 ) ) ( not ( = ?auto_153645 ?auto_153646 ) ) ( not ( = ?auto_153647 ?auto_153646 ) ) ( ON ?auto_153640 ?auto_153639 ) ( ON-TABLE ?auto_153646 ) ( ON ?auto_153641 ?auto_153640 ) ( ON ?auto_153642 ?auto_153641 ) ( ON ?auto_153643 ?auto_153642 ) ( ON ?auto_153644 ?auto_153643 ) ( CLEAR ?auto_153647 ) ( ON ?auto_153645 ?auto_153644 ) ( CLEAR ?auto_153645 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_153646 ?auto_153639 ?auto_153640 ?auto_153641 ?auto_153642 ?auto_153643 ?auto_153644 )
      ( MAKE-7PILE ?auto_153639 ?auto_153640 ?auto_153641 ?auto_153642 ?auto_153643 ?auto_153644 ?auto_153645 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153648 - BLOCK
      ?auto_153649 - BLOCK
      ?auto_153650 - BLOCK
      ?auto_153651 - BLOCK
      ?auto_153652 - BLOCK
      ?auto_153653 - BLOCK
      ?auto_153654 - BLOCK
    )
    :vars
    (
      ?auto_153656 - BLOCK
      ?auto_153655 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153648 ?auto_153649 ) ) ( not ( = ?auto_153648 ?auto_153650 ) ) ( not ( = ?auto_153648 ?auto_153651 ) ) ( not ( = ?auto_153648 ?auto_153652 ) ) ( not ( = ?auto_153648 ?auto_153653 ) ) ( not ( = ?auto_153648 ?auto_153654 ) ) ( not ( = ?auto_153649 ?auto_153650 ) ) ( not ( = ?auto_153649 ?auto_153651 ) ) ( not ( = ?auto_153649 ?auto_153652 ) ) ( not ( = ?auto_153649 ?auto_153653 ) ) ( not ( = ?auto_153649 ?auto_153654 ) ) ( not ( = ?auto_153650 ?auto_153651 ) ) ( not ( = ?auto_153650 ?auto_153652 ) ) ( not ( = ?auto_153650 ?auto_153653 ) ) ( not ( = ?auto_153650 ?auto_153654 ) ) ( not ( = ?auto_153651 ?auto_153652 ) ) ( not ( = ?auto_153651 ?auto_153653 ) ) ( not ( = ?auto_153651 ?auto_153654 ) ) ( not ( = ?auto_153652 ?auto_153653 ) ) ( not ( = ?auto_153652 ?auto_153654 ) ) ( not ( = ?auto_153653 ?auto_153654 ) ) ( not ( = ?auto_153648 ?auto_153656 ) ) ( not ( = ?auto_153649 ?auto_153656 ) ) ( not ( = ?auto_153650 ?auto_153656 ) ) ( not ( = ?auto_153651 ?auto_153656 ) ) ( not ( = ?auto_153652 ?auto_153656 ) ) ( not ( = ?auto_153653 ?auto_153656 ) ) ( not ( = ?auto_153654 ?auto_153656 ) ) ( ON ?auto_153648 ?auto_153655 ) ( not ( = ?auto_153648 ?auto_153655 ) ) ( not ( = ?auto_153649 ?auto_153655 ) ) ( not ( = ?auto_153650 ?auto_153655 ) ) ( not ( = ?auto_153651 ?auto_153655 ) ) ( not ( = ?auto_153652 ?auto_153655 ) ) ( not ( = ?auto_153653 ?auto_153655 ) ) ( not ( = ?auto_153654 ?auto_153655 ) ) ( not ( = ?auto_153656 ?auto_153655 ) ) ( ON ?auto_153649 ?auto_153648 ) ( ON-TABLE ?auto_153655 ) ( ON ?auto_153650 ?auto_153649 ) ( ON ?auto_153651 ?auto_153650 ) ( ON ?auto_153652 ?auto_153651 ) ( ON ?auto_153653 ?auto_153652 ) ( ON ?auto_153654 ?auto_153653 ) ( CLEAR ?auto_153654 ) ( HOLDING ?auto_153656 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_153656 )
      ( MAKE-7PILE ?auto_153648 ?auto_153649 ?auto_153650 ?auto_153651 ?auto_153652 ?auto_153653 ?auto_153654 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153657 - BLOCK
      ?auto_153658 - BLOCK
      ?auto_153659 - BLOCK
      ?auto_153660 - BLOCK
      ?auto_153661 - BLOCK
      ?auto_153662 - BLOCK
      ?auto_153663 - BLOCK
    )
    :vars
    (
      ?auto_153665 - BLOCK
      ?auto_153664 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153657 ?auto_153658 ) ) ( not ( = ?auto_153657 ?auto_153659 ) ) ( not ( = ?auto_153657 ?auto_153660 ) ) ( not ( = ?auto_153657 ?auto_153661 ) ) ( not ( = ?auto_153657 ?auto_153662 ) ) ( not ( = ?auto_153657 ?auto_153663 ) ) ( not ( = ?auto_153658 ?auto_153659 ) ) ( not ( = ?auto_153658 ?auto_153660 ) ) ( not ( = ?auto_153658 ?auto_153661 ) ) ( not ( = ?auto_153658 ?auto_153662 ) ) ( not ( = ?auto_153658 ?auto_153663 ) ) ( not ( = ?auto_153659 ?auto_153660 ) ) ( not ( = ?auto_153659 ?auto_153661 ) ) ( not ( = ?auto_153659 ?auto_153662 ) ) ( not ( = ?auto_153659 ?auto_153663 ) ) ( not ( = ?auto_153660 ?auto_153661 ) ) ( not ( = ?auto_153660 ?auto_153662 ) ) ( not ( = ?auto_153660 ?auto_153663 ) ) ( not ( = ?auto_153661 ?auto_153662 ) ) ( not ( = ?auto_153661 ?auto_153663 ) ) ( not ( = ?auto_153662 ?auto_153663 ) ) ( not ( = ?auto_153657 ?auto_153665 ) ) ( not ( = ?auto_153658 ?auto_153665 ) ) ( not ( = ?auto_153659 ?auto_153665 ) ) ( not ( = ?auto_153660 ?auto_153665 ) ) ( not ( = ?auto_153661 ?auto_153665 ) ) ( not ( = ?auto_153662 ?auto_153665 ) ) ( not ( = ?auto_153663 ?auto_153665 ) ) ( ON ?auto_153657 ?auto_153664 ) ( not ( = ?auto_153657 ?auto_153664 ) ) ( not ( = ?auto_153658 ?auto_153664 ) ) ( not ( = ?auto_153659 ?auto_153664 ) ) ( not ( = ?auto_153660 ?auto_153664 ) ) ( not ( = ?auto_153661 ?auto_153664 ) ) ( not ( = ?auto_153662 ?auto_153664 ) ) ( not ( = ?auto_153663 ?auto_153664 ) ) ( not ( = ?auto_153665 ?auto_153664 ) ) ( ON ?auto_153658 ?auto_153657 ) ( ON-TABLE ?auto_153664 ) ( ON ?auto_153659 ?auto_153658 ) ( ON ?auto_153660 ?auto_153659 ) ( ON ?auto_153661 ?auto_153660 ) ( ON ?auto_153662 ?auto_153661 ) ( ON ?auto_153663 ?auto_153662 ) ( ON ?auto_153665 ?auto_153663 ) ( CLEAR ?auto_153665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_153664 ?auto_153657 ?auto_153658 ?auto_153659 ?auto_153660 ?auto_153661 ?auto_153662 ?auto_153663 )
      ( MAKE-7PILE ?auto_153657 ?auto_153658 ?auto_153659 ?auto_153660 ?auto_153661 ?auto_153662 ?auto_153663 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_153674 - BLOCK
      ?auto_153675 - BLOCK
      ?auto_153676 - BLOCK
      ?auto_153677 - BLOCK
      ?auto_153678 - BLOCK
      ?auto_153679 - BLOCK
      ?auto_153680 - BLOCK
      ?auto_153681 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_153681 ) ( CLEAR ?auto_153680 ) ( ON-TABLE ?auto_153674 ) ( ON ?auto_153675 ?auto_153674 ) ( ON ?auto_153676 ?auto_153675 ) ( ON ?auto_153677 ?auto_153676 ) ( ON ?auto_153678 ?auto_153677 ) ( ON ?auto_153679 ?auto_153678 ) ( ON ?auto_153680 ?auto_153679 ) ( not ( = ?auto_153674 ?auto_153675 ) ) ( not ( = ?auto_153674 ?auto_153676 ) ) ( not ( = ?auto_153674 ?auto_153677 ) ) ( not ( = ?auto_153674 ?auto_153678 ) ) ( not ( = ?auto_153674 ?auto_153679 ) ) ( not ( = ?auto_153674 ?auto_153680 ) ) ( not ( = ?auto_153674 ?auto_153681 ) ) ( not ( = ?auto_153675 ?auto_153676 ) ) ( not ( = ?auto_153675 ?auto_153677 ) ) ( not ( = ?auto_153675 ?auto_153678 ) ) ( not ( = ?auto_153675 ?auto_153679 ) ) ( not ( = ?auto_153675 ?auto_153680 ) ) ( not ( = ?auto_153675 ?auto_153681 ) ) ( not ( = ?auto_153676 ?auto_153677 ) ) ( not ( = ?auto_153676 ?auto_153678 ) ) ( not ( = ?auto_153676 ?auto_153679 ) ) ( not ( = ?auto_153676 ?auto_153680 ) ) ( not ( = ?auto_153676 ?auto_153681 ) ) ( not ( = ?auto_153677 ?auto_153678 ) ) ( not ( = ?auto_153677 ?auto_153679 ) ) ( not ( = ?auto_153677 ?auto_153680 ) ) ( not ( = ?auto_153677 ?auto_153681 ) ) ( not ( = ?auto_153678 ?auto_153679 ) ) ( not ( = ?auto_153678 ?auto_153680 ) ) ( not ( = ?auto_153678 ?auto_153681 ) ) ( not ( = ?auto_153679 ?auto_153680 ) ) ( not ( = ?auto_153679 ?auto_153681 ) ) ( not ( = ?auto_153680 ?auto_153681 ) ) )
    :subtasks
    ( ( !STACK ?auto_153681 ?auto_153680 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_153682 - BLOCK
      ?auto_153683 - BLOCK
      ?auto_153684 - BLOCK
      ?auto_153685 - BLOCK
      ?auto_153686 - BLOCK
      ?auto_153687 - BLOCK
      ?auto_153688 - BLOCK
      ?auto_153689 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_153688 ) ( ON-TABLE ?auto_153682 ) ( ON ?auto_153683 ?auto_153682 ) ( ON ?auto_153684 ?auto_153683 ) ( ON ?auto_153685 ?auto_153684 ) ( ON ?auto_153686 ?auto_153685 ) ( ON ?auto_153687 ?auto_153686 ) ( ON ?auto_153688 ?auto_153687 ) ( not ( = ?auto_153682 ?auto_153683 ) ) ( not ( = ?auto_153682 ?auto_153684 ) ) ( not ( = ?auto_153682 ?auto_153685 ) ) ( not ( = ?auto_153682 ?auto_153686 ) ) ( not ( = ?auto_153682 ?auto_153687 ) ) ( not ( = ?auto_153682 ?auto_153688 ) ) ( not ( = ?auto_153682 ?auto_153689 ) ) ( not ( = ?auto_153683 ?auto_153684 ) ) ( not ( = ?auto_153683 ?auto_153685 ) ) ( not ( = ?auto_153683 ?auto_153686 ) ) ( not ( = ?auto_153683 ?auto_153687 ) ) ( not ( = ?auto_153683 ?auto_153688 ) ) ( not ( = ?auto_153683 ?auto_153689 ) ) ( not ( = ?auto_153684 ?auto_153685 ) ) ( not ( = ?auto_153684 ?auto_153686 ) ) ( not ( = ?auto_153684 ?auto_153687 ) ) ( not ( = ?auto_153684 ?auto_153688 ) ) ( not ( = ?auto_153684 ?auto_153689 ) ) ( not ( = ?auto_153685 ?auto_153686 ) ) ( not ( = ?auto_153685 ?auto_153687 ) ) ( not ( = ?auto_153685 ?auto_153688 ) ) ( not ( = ?auto_153685 ?auto_153689 ) ) ( not ( = ?auto_153686 ?auto_153687 ) ) ( not ( = ?auto_153686 ?auto_153688 ) ) ( not ( = ?auto_153686 ?auto_153689 ) ) ( not ( = ?auto_153687 ?auto_153688 ) ) ( not ( = ?auto_153687 ?auto_153689 ) ) ( not ( = ?auto_153688 ?auto_153689 ) ) ( ON-TABLE ?auto_153689 ) ( CLEAR ?auto_153689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_153689 )
      ( MAKE-8PILE ?auto_153682 ?auto_153683 ?auto_153684 ?auto_153685 ?auto_153686 ?auto_153687 ?auto_153688 ?auto_153689 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_153690 - BLOCK
      ?auto_153691 - BLOCK
      ?auto_153692 - BLOCK
      ?auto_153693 - BLOCK
      ?auto_153694 - BLOCK
      ?auto_153695 - BLOCK
      ?auto_153696 - BLOCK
      ?auto_153697 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_153690 ) ( ON ?auto_153691 ?auto_153690 ) ( ON ?auto_153692 ?auto_153691 ) ( ON ?auto_153693 ?auto_153692 ) ( ON ?auto_153694 ?auto_153693 ) ( ON ?auto_153695 ?auto_153694 ) ( not ( = ?auto_153690 ?auto_153691 ) ) ( not ( = ?auto_153690 ?auto_153692 ) ) ( not ( = ?auto_153690 ?auto_153693 ) ) ( not ( = ?auto_153690 ?auto_153694 ) ) ( not ( = ?auto_153690 ?auto_153695 ) ) ( not ( = ?auto_153690 ?auto_153696 ) ) ( not ( = ?auto_153690 ?auto_153697 ) ) ( not ( = ?auto_153691 ?auto_153692 ) ) ( not ( = ?auto_153691 ?auto_153693 ) ) ( not ( = ?auto_153691 ?auto_153694 ) ) ( not ( = ?auto_153691 ?auto_153695 ) ) ( not ( = ?auto_153691 ?auto_153696 ) ) ( not ( = ?auto_153691 ?auto_153697 ) ) ( not ( = ?auto_153692 ?auto_153693 ) ) ( not ( = ?auto_153692 ?auto_153694 ) ) ( not ( = ?auto_153692 ?auto_153695 ) ) ( not ( = ?auto_153692 ?auto_153696 ) ) ( not ( = ?auto_153692 ?auto_153697 ) ) ( not ( = ?auto_153693 ?auto_153694 ) ) ( not ( = ?auto_153693 ?auto_153695 ) ) ( not ( = ?auto_153693 ?auto_153696 ) ) ( not ( = ?auto_153693 ?auto_153697 ) ) ( not ( = ?auto_153694 ?auto_153695 ) ) ( not ( = ?auto_153694 ?auto_153696 ) ) ( not ( = ?auto_153694 ?auto_153697 ) ) ( not ( = ?auto_153695 ?auto_153696 ) ) ( not ( = ?auto_153695 ?auto_153697 ) ) ( not ( = ?auto_153696 ?auto_153697 ) ) ( ON-TABLE ?auto_153697 ) ( CLEAR ?auto_153697 ) ( HOLDING ?auto_153696 ) ( CLEAR ?auto_153695 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_153690 ?auto_153691 ?auto_153692 ?auto_153693 ?auto_153694 ?auto_153695 ?auto_153696 )
      ( MAKE-8PILE ?auto_153690 ?auto_153691 ?auto_153692 ?auto_153693 ?auto_153694 ?auto_153695 ?auto_153696 ?auto_153697 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_153698 - BLOCK
      ?auto_153699 - BLOCK
      ?auto_153700 - BLOCK
      ?auto_153701 - BLOCK
      ?auto_153702 - BLOCK
      ?auto_153703 - BLOCK
      ?auto_153704 - BLOCK
      ?auto_153705 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_153698 ) ( ON ?auto_153699 ?auto_153698 ) ( ON ?auto_153700 ?auto_153699 ) ( ON ?auto_153701 ?auto_153700 ) ( ON ?auto_153702 ?auto_153701 ) ( ON ?auto_153703 ?auto_153702 ) ( not ( = ?auto_153698 ?auto_153699 ) ) ( not ( = ?auto_153698 ?auto_153700 ) ) ( not ( = ?auto_153698 ?auto_153701 ) ) ( not ( = ?auto_153698 ?auto_153702 ) ) ( not ( = ?auto_153698 ?auto_153703 ) ) ( not ( = ?auto_153698 ?auto_153704 ) ) ( not ( = ?auto_153698 ?auto_153705 ) ) ( not ( = ?auto_153699 ?auto_153700 ) ) ( not ( = ?auto_153699 ?auto_153701 ) ) ( not ( = ?auto_153699 ?auto_153702 ) ) ( not ( = ?auto_153699 ?auto_153703 ) ) ( not ( = ?auto_153699 ?auto_153704 ) ) ( not ( = ?auto_153699 ?auto_153705 ) ) ( not ( = ?auto_153700 ?auto_153701 ) ) ( not ( = ?auto_153700 ?auto_153702 ) ) ( not ( = ?auto_153700 ?auto_153703 ) ) ( not ( = ?auto_153700 ?auto_153704 ) ) ( not ( = ?auto_153700 ?auto_153705 ) ) ( not ( = ?auto_153701 ?auto_153702 ) ) ( not ( = ?auto_153701 ?auto_153703 ) ) ( not ( = ?auto_153701 ?auto_153704 ) ) ( not ( = ?auto_153701 ?auto_153705 ) ) ( not ( = ?auto_153702 ?auto_153703 ) ) ( not ( = ?auto_153702 ?auto_153704 ) ) ( not ( = ?auto_153702 ?auto_153705 ) ) ( not ( = ?auto_153703 ?auto_153704 ) ) ( not ( = ?auto_153703 ?auto_153705 ) ) ( not ( = ?auto_153704 ?auto_153705 ) ) ( ON-TABLE ?auto_153705 ) ( CLEAR ?auto_153703 ) ( ON ?auto_153704 ?auto_153705 ) ( CLEAR ?auto_153704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_153705 )
      ( MAKE-8PILE ?auto_153698 ?auto_153699 ?auto_153700 ?auto_153701 ?auto_153702 ?auto_153703 ?auto_153704 ?auto_153705 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_153706 - BLOCK
      ?auto_153707 - BLOCK
      ?auto_153708 - BLOCK
      ?auto_153709 - BLOCK
      ?auto_153710 - BLOCK
      ?auto_153711 - BLOCK
      ?auto_153712 - BLOCK
      ?auto_153713 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_153706 ) ( ON ?auto_153707 ?auto_153706 ) ( ON ?auto_153708 ?auto_153707 ) ( ON ?auto_153709 ?auto_153708 ) ( ON ?auto_153710 ?auto_153709 ) ( not ( = ?auto_153706 ?auto_153707 ) ) ( not ( = ?auto_153706 ?auto_153708 ) ) ( not ( = ?auto_153706 ?auto_153709 ) ) ( not ( = ?auto_153706 ?auto_153710 ) ) ( not ( = ?auto_153706 ?auto_153711 ) ) ( not ( = ?auto_153706 ?auto_153712 ) ) ( not ( = ?auto_153706 ?auto_153713 ) ) ( not ( = ?auto_153707 ?auto_153708 ) ) ( not ( = ?auto_153707 ?auto_153709 ) ) ( not ( = ?auto_153707 ?auto_153710 ) ) ( not ( = ?auto_153707 ?auto_153711 ) ) ( not ( = ?auto_153707 ?auto_153712 ) ) ( not ( = ?auto_153707 ?auto_153713 ) ) ( not ( = ?auto_153708 ?auto_153709 ) ) ( not ( = ?auto_153708 ?auto_153710 ) ) ( not ( = ?auto_153708 ?auto_153711 ) ) ( not ( = ?auto_153708 ?auto_153712 ) ) ( not ( = ?auto_153708 ?auto_153713 ) ) ( not ( = ?auto_153709 ?auto_153710 ) ) ( not ( = ?auto_153709 ?auto_153711 ) ) ( not ( = ?auto_153709 ?auto_153712 ) ) ( not ( = ?auto_153709 ?auto_153713 ) ) ( not ( = ?auto_153710 ?auto_153711 ) ) ( not ( = ?auto_153710 ?auto_153712 ) ) ( not ( = ?auto_153710 ?auto_153713 ) ) ( not ( = ?auto_153711 ?auto_153712 ) ) ( not ( = ?auto_153711 ?auto_153713 ) ) ( not ( = ?auto_153712 ?auto_153713 ) ) ( ON-TABLE ?auto_153713 ) ( ON ?auto_153712 ?auto_153713 ) ( CLEAR ?auto_153712 ) ( HOLDING ?auto_153711 ) ( CLEAR ?auto_153710 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_153706 ?auto_153707 ?auto_153708 ?auto_153709 ?auto_153710 ?auto_153711 )
      ( MAKE-8PILE ?auto_153706 ?auto_153707 ?auto_153708 ?auto_153709 ?auto_153710 ?auto_153711 ?auto_153712 ?auto_153713 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_153714 - BLOCK
      ?auto_153715 - BLOCK
      ?auto_153716 - BLOCK
      ?auto_153717 - BLOCK
      ?auto_153718 - BLOCK
      ?auto_153719 - BLOCK
      ?auto_153720 - BLOCK
      ?auto_153721 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_153714 ) ( ON ?auto_153715 ?auto_153714 ) ( ON ?auto_153716 ?auto_153715 ) ( ON ?auto_153717 ?auto_153716 ) ( ON ?auto_153718 ?auto_153717 ) ( not ( = ?auto_153714 ?auto_153715 ) ) ( not ( = ?auto_153714 ?auto_153716 ) ) ( not ( = ?auto_153714 ?auto_153717 ) ) ( not ( = ?auto_153714 ?auto_153718 ) ) ( not ( = ?auto_153714 ?auto_153719 ) ) ( not ( = ?auto_153714 ?auto_153720 ) ) ( not ( = ?auto_153714 ?auto_153721 ) ) ( not ( = ?auto_153715 ?auto_153716 ) ) ( not ( = ?auto_153715 ?auto_153717 ) ) ( not ( = ?auto_153715 ?auto_153718 ) ) ( not ( = ?auto_153715 ?auto_153719 ) ) ( not ( = ?auto_153715 ?auto_153720 ) ) ( not ( = ?auto_153715 ?auto_153721 ) ) ( not ( = ?auto_153716 ?auto_153717 ) ) ( not ( = ?auto_153716 ?auto_153718 ) ) ( not ( = ?auto_153716 ?auto_153719 ) ) ( not ( = ?auto_153716 ?auto_153720 ) ) ( not ( = ?auto_153716 ?auto_153721 ) ) ( not ( = ?auto_153717 ?auto_153718 ) ) ( not ( = ?auto_153717 ?auto_153719 ) ) ( not ( = ?auto_153717 ?auto_153720 ) ) ( not ( = ?auto_153717 ?auto_153721 ) ) ( not ( = ?auto_153718 ?auto_153719 ) ) ( not ( = ?auto_153718 ?auto_153720 ) ) ( not ( = ?auto_153718 ?auto_153721 ) ) ( not ( = ?auto_153719 ?auto_153720 ) ) ( not ( = ?auto_153719 ?auto_153721 ) ) ( not ( = ?auto_153720 ?auto_153721 ) ) ( ON-TABLE ?auto_153721 ) ( ON ?auto_153720 ?auto_153721 ) ( CLEAR ?auto_153718 ) ( ON ?auto_153719 ?auto_153720 ) ( CLEAR ?auto_153719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_153721 ?auto_153720 )
      ( MAKE-8PILE ?auto_153714 ?auto_153715 ?auto_153716 ?auto_153717 ?auto_153718 ?auto_153719 ?auto_153720 ?auto_153721 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_153722 - BLOCK
      ?auto_153723 - BLOCK
      ?auto_153724 - BLOCK
      ?auto_153725 - BLOCK
      ?auto_153726 - BLOCK
      ?auto_153727 - BLOCK
      ?auto_153728 - BLOCK
      ?auto_153729 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_153722 ) ( ON ?auto_153723 ?auto_153722 ) ( ON ?auto_153724 ?auto_153723 ) ( ON ?auto_153725 ?auto_153724 ) ( not ( = ?auto_153722 ?auto_153723 ) ) ( not ( = ?auto_153722 ?auto_153724 ) ) ( not ( = ?auto_153722 ?auto_153725 ) ) ( not ( = ?auto_153722 ?auto_153726 ) ) ( not ( = ?auto_153722 ?auto_153727 ) ) ( not ( = ?auto_153722 ?auto_153728 ) ) ( not ( = ?auto_153722 ?auto_153729 ) ) ( not ( = ?auto_153723 ?auto_153724 ) ) ( not ( = ?auto_153723 ?auto_153725 ) ) ( not ( = ?auto_153723 ?auto_153726 ) ) ( not ( = ?auto_153723 ?auto_153727 ) ) ( not ( = ?auto_153723 ?auto_153728 ) ) ( not ( = ?auto_153723 ?auto_153729 ) ) ( not ( = ?auto_153724 ?auto_153725 ) ) ( not ( = ?auto_153724 ?auto_153726 ) ) ( not ( = ?auto_153724 ?auto_153727 ) ) ( not ( = ?auto_153724 ?auto_153728 ) ) ( not ( = ?auto_153724 ?auto_153729 ) ) ( not ( = ?auto_153725 ?auto_153726 ) ) ( not ( = ?auto_153725 ?auto_153727 ) ) ( not ( = ?auto_153725 ?auto_153728 ) ) ( not ( = ?auto_153725 ?auto_153729 ) ) ( not ( = ?auto_153726 ?auto_153727 ) ) ( not ( = ?auto_153726 ?auto_153728 ) ) ( not ( = ?auto_153726 ?auto_153729 ) ) ( not ( = ?auto_153727 ?auto_153728 ) ) ( not ( = ?auto_153727 ?auto_153729 ) ) ( not ( = ?auto_153728 ?auto_153729 ) ) ( ON-TABLE ?auto_153729 ) ( ON ?auto_153728 ?auto_153729 ) ( ON ?auto_153727 ?auto_153728 ) ( CLEAR ?auto_153727 ) ( HOLDING ?auto_153726 ) ( CLEAR ?auto_153725 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_153722 ?auto_153723 ?auto_153724 ?auto_153725 ?auto_153726 )
      ( MAKE-8PILE ?auto_153722 ?auto_153723 ?auto_153724 ?auto_153725 ?auto_153726 ?auto_153727 ?auto_153728 ?auto_153729 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_153730 - BLOCK
      ?auto_153731 - BLOCK
      ?auto_153732 - BLOCK
      ?auto_153733 - BLOCK
      ?auto_153734 - BLOCK
      ?auto_153735 - BLOCK
      ?auto_153736 - BLOCK
      ?auto_153737 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_153730 ) ( ON ?auto_153731 ?auto_153730 ) ( ON ?auto_153732 ?auto_153731 ) ( ON ?auto_153733 ?auto_153732 ) ( not ( = ?auto_153730 ?auto_153731 ) ) ( not ( = ?auto_153730 ?auto_153732 ) ) ( not ( = ?auto_153730 ?auto_153733 ) ) ( not ( = ?auto_153730 ?auto_153734 ) ) ( not ( = ?auto_153730 ?auto_153735 ) ) ( not ( = ?auto_153730 ?auto_153736 ) ) ( not ( = ?auto_153730 ?auto_153737 ) ) ( not ( = ?auto_153731 ?auto_153732 ) ) ( not ( = ?auto_153731 ?auto_153733 ) ) ( not ( = ?auto_153731 ?auto_153734 ) ) ( not ( = ?auto_153731 ?auto_153735 ) ) ( not ( = ?auto_153731 ?auto_153736 ) ) ( not ( = ?auto_153731 ?auto_153737 ) ) ( not ( = ?auto_153732 ?auto_153733 ) ) ( not ( = ?auto_153732 ?auto_153734 ) ) ( not ( = ?auto_153732 ?auto_153735 ) ) ( not ( = ?auto_153732 ?auto_153736 ) ) ( not ( = ?auto_153732 ?auto_153737 ) ) ( not ( = ?auto_153733 ?auto_153734 ) ) ( not ( = ?auto_153733 ?auto_153735 ) ) ( not ( = ?auto_153733 ?auto_153736 ) ) ( not ( = ?auto_153733 ?auto_153737 ) ) ( not ( = ?auto_153734 ?auto_153735 ) ) ( not ( = ?auto_153734 ?auto_153736 ) ) ( not ( = ?auto_153734 ?auto_153737 ) ) ( not ( = ?auto_153735 ?auto_153736 ) ) ( not ( = ?auto_153735 ?auto_153737 ) ) ( not ( = ?auto_153736 ?auto_153737 ) ) ( ON-TABLE ?auto_153737 ) ( ON ?auto_153736 ?auto_153737 ) ( ON ?auto_153735 ?auto_153736 ) ( CLEAR ?auto_153733 ) ( ON ?auto_153734 ?auto_153735 ) ( CLEAR ?auto_153734 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_153737 ?auto_153736 ?auto_153735 )
      ( MAKE-8PILE ?auto_153730 ?auto_153731 ?auto_153732 ?auto_153733 ?auto_153734 ?auto_153735 ?auto_153736 ?auto_153737 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_153738 - BLOCK
      ?auto_153739 - BLOCK
      ?auto_153740 - BLOCK
      ?auto_153741 - BLOCK
      ?auto_153742 - BLOCK
      ?auto_153743 - BLOCK
      ?auto_153744 - BLOCK
      ?auto_153745 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_153738 ) ( ON ?auto_153739 ?auto_153738 ) ( ON ?auto_153740 ?auto_153739 ) ( not ( = ?auto_153738 ?auto_153739 ) ) ( not ( = ?auto_153738 ?auto_153740 ) ) ( not ( = ?auto_153738 ?auto_153741 ) ) ( not ( = ?auto_153738 ?auto_153742 ) ) ( not ( = ?auto_153738 ?auto_153743 ) ) ( not ( = ?auto_153738 ?auto_153744 ) ) ( not ( = ?auto_153738 ?auto_153745 ) ) ( not ( = ?auto_153739 ?auto_153740 ) ) ( not ( = ?auto_153739 ?auto_153741 ) ) ( not ( = ?auto_153739 ?auto_153742 ) ) ( not ( = ?auto_153739 ?auto_153743 ) ) ( not ( = ?auto_153739 ?auto_153744 ) ) ( not ( = ?auto_153739 ?auto_153745 ) ) ( not ( = ?auto_153740 ?auto_153741 ) ) ( not ( = ?auto_153740 ?auto_153742 ) ) ( not ( = ?auto_153740 ?auto_153743 ) ) ( not ( = ?auto_153740 ?auto_153744 ) ) ( not ( = ?auto_153740 ?auto_153745 ) ) ( not ( = ?auto_153741 ?auto_153742 ) ) ( not ( = ?auto_153741 ?auto_153743 ) ) ( not ( = ?auto_153741 ?auto_153744 ) ) ( not ( = ?auto_153741 ?auto_153745 ) ) ( not ( = ?auto_153742 ?auto_153743 ) ) ( not ( = ?auto_153742 ?auto_153744 ) ) ( not ( = ?auto_153742 ?auto_153745 ) ) ( not ( = ?auto_153743 ?auto_153744 ) ) ( not ( = ?auto_153743 ?auto_153745 ) ) ( not ( = ?auto_153744 ?auto_153745 ) ) ( ON-TABLE ?auto_153745 ) ( ON ?auto_153744 ?auto_153745 ) ( ON ?auto_153743 ?auto_153744 ) ( ON ?auto_153742 ?auto_153743 ) ( CLEAR ?auto_153742 ) ( HOLDING ?auto_153741 ) ( CLEAR ?auto_153740 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_153738 ?auto_153739 ?auto_153740 ?auto_153741 )
      ( MAKE-8PILE ?auto_153738 ?auto_153739 ?auto_153740 ?auto_153741 ?auto_153742 ?auto_153743 ?auto_153744 ?auto_153745 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_153746 - BLOCK
      ?auto_153747 - BLOCK
      ?auto_153748 - BLOCK
      ?auto_153749 - BLOCK
      ?auto_153750 - BLOCK
      ?auto_153751 - BLOCK
      ?auto_153752 - BLOCK
      ?auto_153753 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_153746 ) ( ON ?auto_153747 ?auto_153746 ) ( ON ?auto_153748 ?auto_153747 ) ( not ( = ?auto_153746 ?auto_153747 ) ) ( not ( = ?auto_153746 ?auto_153748 ) ) ( not ( = ?auto_153746 ?auto_153749 ) ) ( not ( = ?auto_153746 ?auto_153750 ) ) ( not ( = ?auto_153746 ?auto_153751 ) ) ( not ( = ?auto_153746 ?auto_153752 ) ) ( not ( = ?auto_153746 ?auto_153753 ) ) ( not ( = ?auto_153747 ?auto_153748 ) ) ( not ( = ?auto_153747 ?auto_153749 ) ) ( not ( = ?auto_153747 ?auto_153750 ) ) ( not ( = ?auto_153747 ?auto_153751 ) ) ( not ( = ?auto_153747 ?auto_153752 ) ) ( not ( = ?auto_153747 ?auto_153753 ) ) ( not ( = ?auto_153748 ?auto_153749 ) ) ( not ( = ?auto_153748 ?auto_153750 ) ) ( not ( = ?auto_153748 ?auto_153751 ) ) ( not ( = ?auto_153748 ?auto_153752 ) ) ( not ( = ?auto_153748 ?auto_153753 ) ) ( not ( = ?auto_153749 ?auto_153750 ) ) ( not ( = ?auto_153749 ?auto_153751 ) ) ( not ( = ?auto_153749 ?auto_153752 ) ) ( not ( = ?auto_153749 ?auto_153753 ) ) ( not ( = ?auto_153750 ?auto_153751 ) ) ( not ( = ?auto_153750 ?auto_153752 ) ) ( not ( = ?auto_153750 ?auto_153753 ) ) ( not ( = ?auto_153751 ?auto_153752 ) ) ( not ( = ?auto_153751 ?auto_153753 ) ) ( not ( = ?auto_153752 ?auto_153753 ) ) ( ON-TABLE ?auto_153753 ) ( ON ?auto_153752 ?auto_153753 ) ( ON ?auto_153751 ?auto_153752 ) ( ON ?auto_153750 ?auto_153751 ) ( CLEAR ?auto_153748 ) ( ON ?auto_153749 ?auto_153750 ) ( CLEAR ?auto_153749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_153753 ?auto_153752 ?auto_153751 ?auto_153750 )
      ( MAKE-8PILE ?auto_153746 ?auto_153747 ?auto_153748 ?auto_153749 ?auto_153750 ?auto_153751 ?auto_153752 ?auto_153753 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_153754 - BLOCK
      ?auto_153755 - BLOCK
      ?auto_153756 - BLOCK
      ?auto_153757 - BLOCK
      ?auto_153758 - BLOCK
      ?auto_153759 - BLOCK
      ?auto_153760 - BLOCK
      ?auto_153761 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_153754 ) ( ON ?auto_153755 ?auto_153754 ) ( not ( = ?auto_153754 ?auto_153755 ) ) ( not ( = ?auto_153754 ?auto_153756 ) ) ( not ( = ?auto_153754 ?auto_153757 ) ) ( not ( = ?auto_153754 ?auto_153758 ) ) ( not ( = ?auto_153754 ?auto_153759 ) ) ( not ( = ?auto_153754 ?auto_153760 ) ) ( not ( = ?auto_153754 ?auto_153761 ) ) ( not ( = ?auto_153755 ?auto_153756 ) ) ( not ( = ?auto_153755 ?auto_153757 ) ) ( not ( = ?auto_153755 ?auto_153758 ) ) ( not ( = ?auto_153755 ?auto_153759 ) ) ( not ( = ?auto_153755 ?auto_153760 ) ) ( not ( = ?auto_153755 ?auto_153761 ) ) ( not ( = ?auto_153756 ?auto_153757 ) ) ( not ( = ?auto_153756 ?auto_153758 ) ) ( not ( = ?auto_153756 ?auto_153759 ) ) ( not ( = ?auto_153756 ?auto_153760 ) ) ( not ( = ?auto_153756 ?auto_153761 ) ) ( not ( = ?auto_153757 ?auto_153758 ) ) ( not ( = ?auto_153757 ?auto_153759 ) ) ( not ( = ?auto_153757 ?auto_153760 ) ) ( not ( = ?auto_153757 ?auto_153761 ) ) ( not ( = ?auto_153758 ?auto_153759 ) ) ( not ( = ?auto_153758 ?auto_153760 ) ) ( not ( = ?auto_153758 ?auto_153761 ) ) ( not ( = ?auto_153759 ?auto_153760 ) ) ( not ( = ?auto_153759 ?auto_153761 ) ) ( not ( = ?auto_153760 ?auto_153761 ) ) ( ON-TABLE ?auto_153761 ) ( ON ?auto_153760 ?auto_153761 ) ( ON ?auto_153759 ?auto_153760 ) ( ON ?auto_153758 ?auto_153759 ) ( ON ?auto_153757 ?auto_153758 ) ( CLEAR ?auto_153757 ) ( HOLDING ?auto_153756 ) ( CLEAR ?auto_153755 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_153754 ?auto_153755 ?auto_153756 )
      ( MAKE-8PILE ?auto_153754 ?auto_153755 ?auto_153756 ?auto_153757 ?auto_153758 ?auto_153759 ?auto_153760 ?auto_153761 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_153762 - BLOCK
      ?auto_153763 - BLOCK
      ?auto_153764 - BLOCK
      ?auto_153765 - BLOCK
      ?auto_153766 - BLOCK
      ?auto_153767 - BLOCK
      ?auto_153768 - BLOCK
      ?auto_153769 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_153762 ) ( ON ?auto_153763 ?auto_153762 ) ( not ( = ?auto_153762 ?auto_153763 ) ) ( not ( = ?auto_153762 ?auto_153764 ) ) ( not ( = ?auto_153762 ?auto_153765 ) ) ( not ( = ?auto_153762 ?auto_153766 ) ) ( not ( = ?auto_153762 ?auto_153767 ) ) ( not ( = ?auto_153762 ?auto_153768 ) ) ( not ( = ?auto_153762 ?auto_153769 ) ) ( not ( = ?auto_153763 ?auto_153764 ) ) ( not ( = ?auto_153763 ?auto_153765 ) ) ( not ( = ?auto_153763 ?auto_153766 ) ) ( not ( = ?auto_153763 ?auto_153767 ) ) ( not ( = ?auto_153763 ?auto_153768 ) ) ( not ( = ?auto_153763 ?auto_153769 ) ) ( not ( = ?auto_153764 ?auto_153765 ) ) ( not ( = ?auto_153764 ?auto_153766 ) ) ( not ( = ?auto_153764 ?auto_153767 ) ) ( not ( = ?auto_153764 ?auto_153768 ) ) ( not ( = ?auto_153764 ?auto_153769 ) ) ( not ( = ?auto_153765 ?auto_153766 ) ) ( not ( = ?auto_153765 ?auto_153767 ) ) ( not ( = ?auto_153765 ?auto_153768 ) ) ( not ( = ?auto_153765 ?auto_153769 ) ) ( not ( = ?auto_153766 ?auto_153767 ) ) ( not ( = ?auto_153766 ?auto_153768 ) ) ( not ( = ?auto_153766 ?auto_153769 ) ) ( not ( = ?auto_153767 ?auto_153768 ) ) ( not ( = ?auto_153767 ?auto_153769 ) ) ( not ( = ?auto_153768 ?auto_153769 ) ) ( ON-TABLE ?auto_153769 ) ( ON ?auto_153768 ?auto_153769 ) ( ON ?auto_153767 ?auto_153768 ) ( ON ?auto_153766 ?auto_153767 ) ( ON ?auto_153765 ?auto_153766 ) ( CLEAR ?auto_153763 ) ( ON ?auto_153764 ?auto_153765 ) ( CLEAR ?auto_153764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_153769 ?auto_153768 ?auto_153767 ?auto_153766 ?auto_153765 )
      ( MAKE-8PILE ?auto_153762 ?auto_153763 ?auto_153764 ?auto_153765 ?auto_153766 ?auto_153767 ?auto_153768 ?auto_153769 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_153770 - BLOCK
      ?auto_153771 - BLOCK
      ?auto_153772 - BLOCK
      ?auto_153773 - BLOCK
      ?auto_153774 - BLOCK
      ?auto_153775 - BLOCK
      ?auto_153776 - BLOCK
      ?auto_153777 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_153770 ) ( not ( = ?auto_153770 ?auto_153771 ) ) ( not ( = ?auto_153770 ?auto_153772 ) ) ( not ( = ?auto_153770 ?auto_153773 ) ) ( not ( = ?auto_153770 ?auto_153774 ) ) ( not ( = ?auto_153770 ?auto_153775 ) ) ( not ( = ?auto_153770 ?auto_153776 ) ) ( not ( = ?auto_153770 ?auto_153777 ) ) ( not ( = ?auto_153771 ?auto_153772 ) ) ( not ( = ?auto_153771 ?auto_153773 ) ) ( not ( = ?auto_153771 ?auto_153774 ) ) ( not ( = ?auto_153771 ?auto_153775 ) ) ( not ( = ?auto_153771 ?auto_153776 ) ) ( not ( = ?auto_153771 ?auto_153777 ) ) ( not ( = ?auto_153772 ?auto_153773 ) ) ( not ( = ?auto_153772 ?auto_153774 ) ) ( not ( = ?auto_153772 ?auto_153775 ) ) ( not ( = ?auto_153772 ?auto_153776 ) ) ( not ( = ?auto_153772 ?auto_153777 ) ) ( not ( = ?auto_153773 ?auto_153774 ) ) ( not ( = ?auto_153773 ?auto_153775 ) ) ( not ( = ?auto_153773 ?auto_153776 ) ) ( not ( = ?auto_153773 ?auto_153777 ) ) ( not ( = ?auto_153774 ?auto_153775 ) ) ( not ( = ?auto_153774 ?auto_153776 ) ) ( not ( = ?auto_153774 ?auto_153777 ) ) ( not ( = ?auto_153775 ?auto_153776 ) ) ( not ( = ?auto_153775 ?auto_153777 ) ) ( not ( = ?auto_153776 ?auto_153777 ) ) ( ON-TABLE ?auto_153777 ) ( ON ?auto_153776 ?auto_153777 ) ( ON ?auto_153775 ?auto_153776 ) ( ON ?auto_153774 ?auto_153775 ) ( ON ?auto_153773 ?auto_153774 ) ( ON ?auto_153772 ?auto_153773 ) ( CLEAR ?auto_153772 ) ( HOLDING ?auto_153771 ) ( CLEAR ?auto_153770 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_153770 ?auto_153771 )
      ( MAKE-8PILE ?auto_153770 ?auto_153771 ?auto_153772 ?auto_153773 ?auto_153774 ?auto_153775 ?auto_153776 ?auto_153777 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_153778 - BLOCK
      ?auto_153779 - BLOCK
      ?auto_153780 - BLOCK
      ?auto_153781 - BLOCK
      ?auto_153782 - BLOCK
      ?auto_153783 - BLOCK
      ?auto_153784 - BLOCK
      ?auto_153785 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_153778 ) ( not ( = ?auto_153778 ?auto_153779 ) ) ( not ( = ?auto_153778 ?auto_153780 ) ) ( not ( = ?auto_153778 ?auto_153781 ) ) ( not ( = ?auto_153778 ?auto_153782 ) ) ( not ( = ?auto_153778 ?auto_153783 ) ) ( not ( = ?auto_153778 ?auto_153784 ) ) ( not ( = ?auto_153778 ?auto_153785 ) ) ( not ( = ?auto_153779 ?auto_153780 ) ) ( not ( = ?auto_153779 ?auto_153781 ) ) ( not ( = ?auto_153779 ?auto_153782 ) ) ( not ( = ?auto_153779 ?auto_153783 ) ) ( not ( = ?auto_153779 ?auto_153784 ) ) ( not ( = ?auto_153779 ?auto_153785 ) ) ( not ( = ?auto_153780 ?auto_153781 ) ) ( not ( = ?auto_153780 ?auto_153782 ) ) ( not ( = ?auto_153780 ?auto_153783 ) ) ( not ( = ?auto_153780 ?auto_153784 ) ) ( not ( = ?auto_153780 ?auto_153785 ) ) ( not ( = ?auto_153781 ?auto_153782 ) ) ( not ( = ?auto_153781 ?auto_153783 ) ) ( not ( = ?auto_153781 ?auto_153784 ) ) ( not ( = ?auto_153781 ?auto_153785 ) ) ( not ( = ?auto_153782 ?auto_153783 ) ) ( not ( = ?auto_153782 ?auto_153784 ) ) ( not ( = ?auto_153782 ?auto_153785 ) ) ( not ( = ?auto_153783 ?auto_153784 ) ) ( not ( = ?auto_153783 ?auto_153785 ) ) ( not ( = ?auto_153784 ?auto_153785 ) ) ( ON-TABLE ?auto_153785 ) ( ON ?auto_153784 ?auto_153785 ) ( ON ?auto_153783 ?auto_153784 ) ( ON ?auto_153782 ?auto_153783 ) ( ON ?auto_153781 ?auto_153782 ) ( ON ?auto_153780 ?auto_153781 ) ( CLEAR ?auto_153778 ) ( ON ?auto_153779 ?auto_153780 ) ( CLEAR ?auto_153779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_153785 ?auto_153784 ?auto_153783 ?auto_153782 ?auto_153781 ?auto_153780 )
      ( MAKE-8PILE ?auto_153778 ?auto_153779 ?auto_153780 ?auto_153781 ?auto_153782 ?auto_153783 ?auto_153784 ?auto_153785 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_153786 - BLOCK
      ?auto_153787 - BLOCK
      ?auto_153788 - BLOCK
      ?auto_153789 - BLOCK
      ?auto_153790 - BLOCK
      ?auto_153791 - BLOCK
      ?auto_153792 - BLOCK
      ?auto_153793 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153786 ?auto_153787 ) ) ( not ( = ?auto_153786 ?auto_153788 ) ) ( not ( = ?auto_153786 ?auto_153789 ) ) ( not ( = ?auto_153786 ?auto_153790 ) ) ( not ( = ?auto_153786 ?auto_153791 ) ) ( not ( = ?auto_153786 ?auto_153792 ) ) ( not ( = ?auto_153786 ?auto_153793 ) ) ( not ( = ?auto_153787 ?auto_153788 ) ) ( not ( = ?auto_153787 ?auto_153789 ) ) ( not ( = ?auto_153787 ?auto_153790 ) ) ( not ( = ?auto_153787 ?auto_153791 ) ) ( not ( = ?auto_153787 ?auto_153792 ) ) ( not ( = ?auto_153787 ?auto_153793 ) ) ( not ( = ?auto_153788 ?auto_153789 ) ) ( not ( = ?auto_153788 ?auto_153790 ) ) ( not ( = ?auto_153788 ?auto_153791 ) ) ( not ( = ?auto_153788 ?auto_153792 ) ) ( not ( = ?auto_153788 ?auto_153793 ) ) ( not ( = ?auto_153789 ?auto_153790 ) ) ( not ( = ?auto_153789 ?auto_153791 ) ) ( not ( = ?auto_153789 ?auto_153792 ) ) ( not ( = ?auto_153789 ?auto_153793 ) ) ( not ( = ?auto_153790 ?auto_153791 ) ) ( not ( = ?auto_153790 ?auto_153792 ) ) ( not ( = ?auto_153790 ?auto_153793 ) ) ( not ( = ?auto_153791 ?auto_153792 ) ) ( not ( = ?auto_153791 ?auto_153793 ) ) ( not ( = ?auto_153792 ?auto_153793 ) ) ( ON-TABLE ?auto_153793 ) ( ON ?auto_153792 ?auto_153793 ) ( ON ?auto_153791 ?auto_153792 ) ( ON ?auto_153790 ?auto_153791 ) ( ON ?auto_153789 ?auto_153790 ) ( ON ?auto_153788 ?auto_153789 ) ( ON ?auto_153787 ?auto_153788 ) ( CLEAR ?auto_153787 ) ( HOLDING ?auto_153786 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_153786 )
      ( MAKE-8PILE ?auto_153786 ?auto_153787 ?auto_153788 ?auto_153789 ?auto_153790 ?auto_153791 ?auto_153792 ?auto_153793 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_153794 - BLOCK
      ?auto_153795 - BLOCK
      ?auto_153796 - BLOCK
      ?auto_153797 - BLOCK
      ?auto_153798 - BLOCK
      ?auto_153799 - BLOCK
      ?auto_153800 - BLOCK
      ?auto_153801 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153794 ?auto_153795 ) ) ( not ( = ?auto_153794 ?auto_153796 ) ) ( not ( = ?auto_153794 ?auto_153797 ) ) ( not ( = ?auto_153794 ?auto_153798 ) ) ( not ( = ?auto_153794 ?auto_153799 ) ) ( not ( = ?auto_153794 ?auto_153800 ) ) ( not ( = ?auto_153794 ?auto_153801 ) ) ( not ( = ?auto_153795 ?auto_153796 ) ) ( not ( = ?auto_153795 ?auto_153797 ) ) ( not ( = ?auto_153795 ?auto_153798 ) ) ( not ( = ?auto_153795 ?auto_153799 ) ) ( not ( = ?auto_153795 ?auto_153800 ) ) ( not ( = ?auto_153795 ?auto_153801 ) ) ( not ( = ?auto_153796 ?auto_153797 ) ) ( not ( = ?auto_153796 ?auto_153798 ) ) ( not ( = ?auto_153796 ?auto_153799 ) ) ( not ( = ?auto_153796 ?auto_153800 ) ) ( not ( = ?auto_153796 ?auto_153801 ) ) ( not ( = ?auto_153797 ?auto_153798 ) ) ( not ( = ?auto_153797 ?auto_153799 ) ) ( not ( = ?auto_153797 ?auto_153800 ) ) ( not ( = ?auto_153797 ?auto_153801 ) ) ( not ( = ?auto_153798 ?auto_153799 ) ) ( not ( = ?auto_153798 ?auto_153800 ) ) ( not ( = ?auto_153798 ?auto_153801 ) ) ( not ( = ?auto_153799 ?auto_153800 ) ) ( not ( = ?auto_153799 ?auto_153801 ) ) ( not ( = ?auto_153800 ?auto_153801 ) ) ( ON-TABLE ?auto_153801 ) ( ON ?auto_153800 ?auto_153801 ) ( ON ?auto_153799 ?auto_153800 ) ( ON ?auto_153798 ?auto_153799 ) ( ON ?auto_153797 ?auto_153798 ) ( ON ?auto_153796 ?auto_153797 ) ( ON ?auto_153795 ?auto_153796 ) ( ON ?auto_153794 ?auto_153795 ) ( CLEAR ?auto_153794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_153801 ?auto_153800 ?auto_153799 ?auto_153798 ?auto_153797 ?auto_153796 ?auto_153795 )
      ( MAKE-8PILE ?auto_153794 ?auto_153795 ?auto_153796 ?auto_153797 ?auto_153798 ?auto_153799 ?auto_153800 ?auto_153801 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_153802 - BLOCK
      ?auto_153803 - BLOCK
      ?auto_153804 - BLOCK
      ?auto_153805 - BLOCK
      ?auto_153806 - BLOCK
      ?auto_153807 - BLOCK
      ?auto_153808 - BLOCK
      ?auto_153809 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153802 ?auto_153803 ) ) ( not ( = ?auto_153802 ?auto_153804 ) ) ( not ( = ?auto_153802 ?auto_153805 ) ) ( not ( = ?auto_153802 ?auto_153806 ) ) ( not ( = ?auto_153802 ?auto_153807 ) ) ( not ( = ?auto_153802 ?auto_153808 ) ) ( not ( = ?auto_153802 ?auto_153809 ) ) ( not ( = ?auto_153803 ?auto_153804 ) ) ( not ( = ?auto_153803 ?auto_153805 ) ) ( not ( = ?auto_153803 ?auto_153806 ) ) ( not ( = ?auto_153803 ?auto_153807 ) ) ( not ( = ?auto_153803 ?auto_153808 ) ) ( not ( = ?auto_153803 ?auto_153809 ) ) ( not ( = ?auto_153804 ?auto_153805 ) ) ( not ( = ?auto_153804 ?auto_153806 ) ) ( not ( = ?auto_153804 ?auto_153807 ) ) ( not ( = ?auto_153804 ?auto_153808 ) ) ( not ( = ?auto_153804 ?auto_153809 ) ) ( not ( = ?auto_153805 ?auto_153806 ) ) ( not ( = ?auto_153805 ?auto_153807 ) ) ( not ( = ?auto_153805 ?auto_153808 ) ) ( not ( = ?auto_153805 ?auto_153809 ) ) ( not ( = ?auto_153806 ?auto_153807 ) ) ( not ( = ?auto_153806 ?auto_153808 ) ) ( not ( = ?auto_153806 ?auto_153809 ) ) ( not ( = ?auto_153807 ?auto_153808 ) ) ( not ( = ?auto_153807 ?auto_153809 ) ) ( not ( = ?auto_153808 ?auto_153809 ) ) ( ON-TABLE ?auto_153809 ) ( ON ?auto_153808 ?auto_153809 ) ( ON ?auto_153807 ?auto_153808 ) ( ON ?auto_153806 ?auto_153807 ) ( ON ?auto_153805 ?auto_153806 ) ( ON ?auto_153804 ?auto_153805 ) ( ON ?auto_153803 ?auto_153804 ) ( HOLDING ?auto_153802 ) ( CLEAR ?auto_153803 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_153809 ?auto_153808 ?auto_153807 ?auto_153806 ?auto_153805 ?auto_153804 ?auto_153803 ?auto_153802 )
      ( MAKE-8PILE ?auto_153802 ?auto_153803 ?auto_153804 ?auto_153805 ?auto_153806 ?auto_153807 ?auto_153808 ?auto_153809 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_153810 - BLOCK
      ?auto_153811 - BLOCK
      ?auto_153812 - BLOCK
      ?auto_153813 - BLOCK
      ?auto_153814 - BLOCK
      ?auto_153815 - BLOCK
      ?auto_153816 - BLOCK
      ?auto_153817 - BLOCK
    )
    :vars
    (
      ?auto_153818 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153810 ?auto_153811 ) ) ( not ( = ?auto_153810 ?auto_153812 ) ) ( not ( = ?auto_153810 ?auto_153813 ) ) ( not ( = ?auto_153810 ?auto_153814 ) ) ( not ( = ?auto_153810 ?auto_153815 ) ) ( not ( = ?auto_153810 ?auto_153816 ) ) ( not ( = ?auto_153810 ?auto_153817 ) ) ( not ( = ?auto_153811 ?auto_153812 ) ) ( not ( = ?auto_153811 ?auto_153813 ) ) ( not ( = ?auto_153811 ?auto_153814 ) ) ( not ( = ?auto_153811 ?auto_153815 ) ) ( not ( = ?auto_153811 ?auto_153816 ) ) ( not ( = ?auto_153811 ?auto_153817 ) ) ( not ( = ?auto_153812 ?auto_153813 ) ) ( not ( = ?auto_153812 ?auto_153814 ) ) ( not ( = ?auto_153812 ?auto_153815 ) ) ( not ( = ?auto_153812 ?auto_153816 ) ) ( not ( = ?auto_153812 ?auto_153817 ) ) ( not ( = ?auto_153813 ?auto_153814 ) ) ( not ( = ?auto_153813 ?auto_153815 ) ) ( not ( = ?auto_153813 ?auto_153816 ) ) ( not ( = ?auto_153813 ?auto_153817 ) ) ( not ( = ?auto_153814 ?auto_153815 ) ) ( not ( = ?auto_153814 ?auto_153816 ) ) ( not ( = ?auto_153814 ?auto_153817 ) ) ( not ( = ?auto_153815 ?auto_153816 ) ) ( not ( = ?auto_153815 ?auto_153817 ) ) ( not ( = ?auto_153816 ?auto_153817 ) ) ( ON-TABLE ?auto_153817 ) ( ON ?auto_153816 ?auto_153817 ) ( ON ?auto_153815 ?auto_153816 ) ( ON ?auto_153814 ?auto_153815 ) ( ON ?auto_153813 ?auto_153814 ) ( ON ?auto_153812 ?auto_153813 ) ( ON ?auto_153811 ?auto_153812 ) ( CLEAR ?auto_153811 ) ( ON ?auto_153810 ?auto_153818 ) ( CLEAR ?auto_153810 ) ( HAND-EMPTY ) ( not ( = ?auto_153810 ?auto_153818 ) ) ( not ( = ?auto_153811 ?auto_153818 ) ) ( not ( = ?auto_153812 ?auto_153818 ) ) ( not ( = ?auto_153813 ?auto_153818 ) ) ( not ( = ?auto_153814 ?auto_153818 ) ) ( not ( = ?auto_153815 ?auto_153818 ) ) ( not ( = ?auto_153816 ?auto_153818 ) ) ( not ( = ?auto_153817 ?auto_153818 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_153810 ?auto_153818 )
      ( MAKE-8PILE ?auto_153810 ?auto_153811 ?auto_153812 ?auto_153813 ?auto_153814 ?auto_153815 ?auto_153816 ?auto_153817 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_153819 - BLOCK
      ?auto_153820 - BLOCK
      ?auto_153821 - BLOCK
      ?auto_153822 - BLOCK
      ?auto_153823 - BLOCK
      ?auto_153824 - BLOCK
      ?auto_153825 - BLOCK
      ?auto_153826 - BLOCK
    )
    :vars
    (
      ?auto_153827 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153819 ?auto_153820 ) ) ( not ( = ?auto_153819 ?auto_153821 ) ) ( not ( = ?auto_153819 ?auto_153822 ) ) ( not ( = ?auto_153819 ?auto_153823 ) ) ( not ( = ?auto_153819 ?auto_153824 ) ) ( not ( = ?auto_153819 ?auto_153825 ) ) ( not ( = ?auto_153819 ?auto_153826 ) ) ( not ( = ?auto_153820 ?auto_153821 ) ) ( not ( = ?auto_153820 ?auto_153822 ) ) ( not ( = ?auto_153820 ?auto_153823 ) ) ( not ( = ?auto_153820 ?auto_153824 ) ) ( not ( = ?auto_153820 ?auto_153825 ) ) ( not ( = ?auto_153820 ?auto_153826 ) ) ( not ( = ?auto_153821 ?auto_153822 ) ) ( not ( = ?auto_153821 ?auto_153823 ) ) ( not ( = ?auto_153821 ?auto_153824 ) ) ( not ( = ?auto_153821 ?auto_153825 ) ) ( not ( = ?auto_153821 ?auto_153826 ) ) ( not ( = ?auto_153822 ?auto_153823 ) ) ( not ( = ?auto_153822 ?auto_153824 ) ) ( not ( = ?auto_153822 ?auto_153825 ) ) ( not ( = ?auto_153822 ?auto_153826 ) ) ( not ( = ?auto_153823 ?auto_153824 ) ) ( not ( = ?auto_153823 ?auto_153825 ) ) ( not ( = ?auto_153823 ?auto_153826 ) ) ( not ( = ?auto_153824 ?auto_153825 ) ) ( not ( = ?auto_153824 ?auto_153826 ) ) ( not ( = ?auto_153825 ?auto_153826 ) ) ( ON-TABLE ?auto_153826 ) ( ON ?auto_153825 ?auto_153826 ) ( ON ?auto_153824 ?auto_153825 ) ( ON ?auto_153823 ?auto_153824 ) ( ON ?auto_153822 ?auto_153823 ) ( ON ?auto_153821 ?auto_153822 ) ( ON ?auto_153819 ?auto_153827 ) ( CLEAR ?auto_153819 ) ( not ( = ?auto_153819 ?auto_153827 ) ) ( not ( = ?auto_153820 ?auto_153827 ) ) ( not ( = ?auto_153821 ?auto_153827 ) ) ( not ( = ?auto_153822 ?auto_153827 ) ) ( not ( = ?auto_153823 ?auto_153827 ) ) ( not ( = ?auto_153824 ?auto_153827 ) ) ( not ( = ?auto_153825 ?auto_153827 ) ) ( not ( = ?auto_153826 ?auto_153827 ) ) ( HOLDING ?auto_153820 ) ( CLEAR ?auto_153821 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_153826 ?auto_153825 ?auto_153824 ?auto_153823 ?auto_153822 ?auto_153821 ?auto_153820 )
      ( MAKE-8PILE ?auto_153819 ?auto_153820 ?auto_153821 ?auto_153822 ?auto_153823 ?auto_153824 ?auto_153825 ?auto_153826 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_153828 - BLOCK
      ?auto_153829 - BLOCK
      ?auto_153830 - BLOCK
      ?auto_153831 - BLOCK
      ?auto_153832 - BLOCK
      ?auto_153833 - BLOCK
      ?auto_153834 - BLOCK
      ?auto_153835 - BLOCK
    )
    :vars
    (
      ?auto_153836 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153828 ?auto_153829 ) ) ( not ( = ?auto_153828 ?auto_153830 ) ) ( not ( = ?auto_153828 ?auto_153831 ) ) ( not ( = ?auto_153828 ?auto_153832 ) ) ( not ( = ?auto_153828 ?auto_153833 ) ) ( not ( = ?auto_153828 ?auto_153834 ) ) ( not ( = ?auto_153828 ?auto_153835 ) ) ( not ( = ?auto_153829 ?auto_153830 ) ) ( not ( = ?auto_153829 ?auto_153831 ) ) ( not ( = ?auto_153829 ?auto_153832 ) ) ( not ( = ?auto_153829 ?auto_153833 ) ) ( not ( = ?auto_153829 ?auto_153834 ) ) ( not ( = ?auto_153829 ?auto_153835 ) ) ( not ( = ?auto_153830 ?auto_153831 ) ) ( not ( = ?auto_153830 ?auto_153832 ) ) ( not ( = ?auto_153830 ?auto_153833 ) ) ( not ( = ?auto_153830 ?auto_153834 ) ) ( not ( = ?auto_153830 ?auto_153835 ) ) ( not ( = ?auto_153831 ?auto_153832 ) ) ( not ( = ?auto_153831 ?auto_153833 ) ) ( not ( = ?auto_153831 ?auto_153834 ) ) ( not ( = ?auto_153831 ?auto_153835 ) ) ( not ( = ?auto_153832 ?auto_153833 ) ) ( not ( = ?auto_153832 ?auto_153834 ) ) ( not ( = ?auto_153832 ?auto_153835 ) ) ( not ( = ?auto_153833 ?auto_153834 ) ) ( not ( = ?auto_153833 ?auto_153835 ) ) ( not ( = ?auto_153834 ?auto_153835 ) ) ( ON-TABLE ?auto_153835 ) ( ON ?auto_153834 ?auto_153835 ) ( ON ?auto_153833 ?auto_153834 ) ( ON ?auto_153832 ?auto_153833 ) ( ON ?auto_153831 ?auto_153832 ) ( ON ?auto_153830 ?auto_153831 ) ( ON ?auto_153828 ?auto_153836 ) ( not ( = ?auto_153828 ?auto_153836 ) ) ( not ( = ?auto_153829 ?auto_153836 ) ) ( not ( = ?auto_153830 ?auto_153836 ) ) ( not ( = ?auto_153831 ?auto_153836 ) ) ( not ( = ?auto_153832 ?auto_153836 ) ) ( not ( = ?auto_153833 ?auto_153836 ) ) ( not ( = ?auto_153834 ?auto_153836 ) ) ( not ( = ?auto_153835 ?auto_153836 ) ) ( CLEAR ?auto_153830 ) ( ON ?auto_153829 ?auto_153828 ) ( CLEAR ?auto_153829 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_153836 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_153836 ?auto_153828 )
      ( MAKE-8PILE ?auto_153828 ?auto_153829 ?auto_153830 ?auto_153831 ?auto_153832 ?auto_153833 ?auto_153834 ?auto_153835 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_153837 - BLOCK
      ?auto_153838 - BLOCK
      ?auto_153839 - BLOCK
      ?auto_153840 - BLOCK
      ?auto_153841 - BLOCK
      ?auto_153842 - BLOCK
      ?auto_153843 - BLOCK
      ?auto_153844 - BLOCK
    )
    :vars
    (
      ?auto_153845 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153837 ?auto_153838 ) ) ( not ( = ?auto_153837 ?auto_153839 ) ) ( not ( = ?auto_153837 ?auto_153840 ) ) ( not ( = ?auto_153837 ?auto_153841 ) ) ( not ( = ?auto_153837 ?auto_153842 ) ) ( not ( = ?auto_153837 ?auto_153843 ) ) ( not ( = ?auto_153837 ?auto_153844 ) ) ( not ( = ?auto_153838 ?auto_153839 ) ) ( not ( = ?auto_153838 ?auto_153840 ) ) ( not ( = ?auto_153838 ?auto_153841 ) ) ( not ( = ?auto_153838 ?auto_153842 ) ) ( not ( = ?auto_153838 ?auto_153843 ) ) ( not ( = ?auto_153838 ?auto_153844 ) ) ( not ( = ?auto_153839 ?auto_153840 ) ) ( not ( = ?auto_153839 ?auto_153841 ) ) ( not ( = ?auto_153839 ?auto_153842 ) ) ( not ( = ?auto_153839 ?auto_153843 ) ) ( not ( = ?auto_153839 ?auto_153844 ) ) ( not ( = ?auto_153840 ?auto_153841 ) ) ( not ( = ?auto_153840 ?auto_153842 ) ) ( not ( = ?auto_153840 ?auto_153843 ) ) ( not ( = ?auto_153840 ?auto_153844 ) ) ( not ( = ?auto_153841 ?auto_153842 ) ) ( not ( = ?auto_153841 ?auto_153843 ) ) ( not ( = ?auto_153841 ?auto_153844 ) ) ( not ( = ?auto_153842 ?auto_153843 ) ) ( not ( = ?auto_153842 ?auto_153844 ) ) ( not ( = ?auto_153843 ?auto_153844 ) ) ( ON-TABLE ?auto_153844 ) ( ON ?auto_153843 ?auto_153844 ) ( ON ?auto_153842 ?auto_153843 ) ( ON ?auto_153841 ?auto_153842 ) ( ON ?auto_153840 ?auto_153841 ) ( ON ?auto_153837 ?auto_153845 ) ( not ( = ?auto_153837 ?auto_153845 ) ) ( not ( = ?auto_153838 ?auto_153845 ) ) ( not ( = ?auto_153839 ?auto_153845 ) ) ( not ( = ?auto_153840 ?auto_153845 ) ) ( not ( = ?auto_153841 ?auto_153845 ) ) ( not ( = ?auto_153842 ?auto_153845 ) ) ( not ( = ?auto_153843 ?auto_153845 ) ) ( not ( = ?auto_153844 ?auto_153845 ) ) ( ON ?auto_153838 ?auto_153837 ) ( CLEAR ?auto_153838 ) ( ON-TABLE ?auto_153845 ) ( HOLDING ?auto_153839 ) ( CLEAR ?auto_153840 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_153844 ?auto_153843 ?auto_153842 ?auto_153841 ?auto_153840 ?auto_153839 )
      ( MAKE-8PILE ?auto_153837 ?auto_153838 ?auto_153839 ?auto_153840 ?auto_153841 ?auto_153842 ?auto_153843 ?auto_153844 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_153846 - BLOCK
      ?auto_153847 - BLOCK
      ?auto_153848 - BLOCK
      ?auto_153849 - BLOCK
      ?auto_153850 - BLOCK
      ?auto_153851 - BLOCK
      ?auto_153852 - BLOCK
      ?auto_153853 - BLOCK
    )
    :vars
    (
      ?auto_153854 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153846 ?auto_153847 ) ) ( not ( = ?auto_153846 ?auto_153848 ) ) ( not ( = ?auto_153846 ?auto_153849 ) ) ( not ( = ?auto_153846 ?auto_153850 ) ) ( not ( = ?auto_153846 ?auto_153851 ) ) ( not ( = ?auto_153846 ?auto_153852 ) ) ( not ( = ?auto_153846 ?auto_153853 ) ) ( not ( = ?auto_153847 ?auto_153848 ) ) ( not ( = ?auto_153847 ?auto_153849 ) ) ( not ( = ?auto_153847 ?auto_153850 ) ) ( not ( = ?auto_153847 ?auto_153851 ) ) ( not ( = ?auto_153847 ?auto_153852 ) ) ( not ( = ?auto_153847 ?auto_153853 ) ) ( not ( = ?auto_153848 ?auto_153849 ) ) ( not ( = ?auto_153848 ?auto_153850 ) ) ( not ( = ?auto_153848 ?auto_153851 ) ) ( not ( = ?auto_153848 ?auto_153852 ) ) ( not ( = ?auto_153848 ?auto_153853 ) ) ( not ( = ?auto_153849 ?auto_153850 ) ) ( not ( = ?auto_153849 ?auto_153851 ) ) ( not ( = ?auto_153849 ?auto_153852 ) ) ( not ( = ?auto_153849 ?auto_153853 ) ) ( not ( = ?auto_153850 ?auto_153851 ) ) ( not ( = ?auto_153850 ?auto_153852 ) ) ( not ( = ?auto_153850 ?auto_153853 ) ) ( not ( = ?auto_153851 ?auto_153852 ) ) ( not ( = ?auto_153851 ?auto_153853 ) ) ( not ( = ?auto_153852 ?auto_153853 ) ) ( ON-TABLE ?auto_153853 ) ( ON ?auto_153852 ?auto_153853 ) ( ON ?auto_153851 ?auto_153852 ) ( ON ?auto_153850 ?auto_153851 ) ( ON ?auto_153849 ?auto_153850 ) ( ON ?auto_153846 ?auto_153854 ) ( not ( = ?auto_153846 ?auto_153854 ) ) ( not ( = ?auto_153847 ?auto_153854 ) ) ( not ( = ?auto_153848 ?auto_153854 ) ) ( not ( = ?auto_153849 ?auto_153854 ) ) ( not ( = ?auto_153850 ?auto_153854 ) ) ( not ( = ?auto_153851 ?auto_153854 ) ) ( not ( = ?auto_153852 ?auto_153854 ) ) ( not ( = ?auto_153853 ?auto_153854 ) ) ( ON ?auto_153847 ?auto_153846 ) ( ON-TABLE ?auto_153854 ) ( CLEAR ?auto_153849 ) ( ON ?auto_153848 ?auto_153847 ) ( CLEAR ?auto_153848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_153854 ?auto_153846 ?auto_153847 )
      ( MAKE-8PILE ?auto_153846 ?auto_153847 ?auto_153848 ?auto_153849 ?auto_153850 ?auto_153851 ?auto_153852 ?auto_153853 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_153855 - BLOCK
      ?auto_153856 - BLOCK
      ?auto_153857 - BLOCK
      ?auto_153858 - BLOCK
      ?auto_153859 - BLOCK
      ?auto_153860 - BLOCK
      ?auto_153861 - BLOCK
      ?auto_153862 - BLOCK
    )
    :vars
    (
      ?auto_153863 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153855 ?auto_153856 ) ) ( not ( = ?auto_153855 ?auto_153857 ) ) ( not ( = ?auto_153855 ?auto_153858 ) ) ( not ( = ?auto_153855 ?auto_153859 ) ) ( not ( = ?auto_153855 ?auto_153860 ) ) ( not ( = ?auto_153855 ?auto_153861 ) ) ( not ( = ?auto_153855 ?auto_153862 ) ) ( not ( = ?auto_153856 ?auto_153857 ) ) ( not ( = ?auto_153856 ?auto_153858 ) ) ( not ( = ?auto_153856 ?auto_153859 ) ) ( not ( = ?auto_153856 ?auto_153860 ) ) ( not ( = ?auto_153856 ?auto_153861 ) ) ( not ( = ?auto_153856 ?auto_153862 ) ) ( not ( = ?auto_153857 ?auto_153858 ) ) ( not ( = ?auto_153857 ?auto_153859 ) ) ( not ( = ?auto_153857 ?auto_153860 ) ) ( not ( = ?auto_153857 ?auto_153861 ) ) ( not ( = ?auto_153857 ?auto_153862 ) ) ( not ( = ?auto_153858 ?auto_153859 ) ) ( not ( = ?auto_153858 ?auto_153860 ) ) ( not ( = ?auto_153858 ?auto_153861 ) ) ( not ( = ?auto_153858 ?auto_153862 ) ) ( not ( = ?auto_153859 ?auto_153860 ) ) ( not ( = ?auto_153859 ?auto_153861 ) ) ( not ( = ?auto_153859 ?auto_153862 ) ) ( not ( = ?auto_153860 ?auto_153861 ) ) ( not ( = ?auto_153860 ?auto_153862 ) ) ( not ( = ?auto_153861 ?auto_153862 ) ) ( ON-TABLE ?auto_153862 ) ( ON ?auto_153861 ?auto_153862 ) ( ON ?auto_153860 ?auto_153861 ) ( ON ?auto_153859 ?auto_153860 ) ( ON ?auto_153855 ?auto_153863 ) ( not ( = ?auto_153855 ?auto_153863 ) ) ( not ( = ?auto_153856 ?auto_153863 ) ) ( not ( = ?auto_153857 ?auto_153863 ) ) ( not ( = ?auto_153858 ?auto_153863 ) ) ( not ( = ?auto_153859 ?auto_153863 ) ) ( not ( = ?auto_153860 ?auto_153863 ) ) ( not ( = ?auto_153861 ?auto_153863 ) ) ( not ( = ?auto_153862 ?auto_153863 ) ) ( ON ?auto_153856 ?auto_153855 ) ( ON-TABLE ?auto_153863 ) ( ON ?auto_153857 ?auto_153856 ) ( CLEAR ?auto_153857 ) ( HOLDING ?auto_153858 ) ( CLEAR ?auto_153859 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_153862 ?auto_153861 ?auto_153860 ?auto_153859 ?auto_153858 )
      ( MAKE-8PILE ?auto_153855 ?auto_153856 ?auto_153857 ?auto_153858 ?auto_153859 ?auto_153860 ?auto_153861 ?auto_153862 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_153864 - BLOCK
      ?auto_153865 - BLOCK
      ?auto_153866 - BLOCK
      ?auto_153867 - BLOCK
      ?auto_153868 - BLOCK
      ?auto_153869 - BLOCK
      ?auto_153870 - BLOCK
      ?auto_153871 - BLOCK
    )
    :vars
    (
      ?auto_153872 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153864 ?auto_153865 ) ) ( not ( = ?auto_153864 ?auto_153866 ) ) ( not ( = ?auto_153864 ?auto_153867 ) ) ( not ( = ?auto_153864 ?auto_153868 ) ) ( not ( = ?auto_153864 ?auto_153869 ) ) ( not ( = ?auto_153864 ?auto_153870 ) ) ( not ( = ?auto_153864 ?auto_153871 ) ) ( not ( = ?auto_153865 ?auto_153866 ) ) ( not ( = ?auto_153865 ?auto_153867 ) ) ( not ( = ?auto_153865 ?auto_153868 ) ) ( not ( = ?auto_153865 ?auto_153869 ) ) ( not ( = ?auto_153865 ?auto_153870 ) ) ( not ( = ?auto_153865 ?auto_153871 ) ) ( not ( = ?auto_153866 ?auto_153867 ) ) ( not ( = ?auto_153866 ?auto_153868 ) ) ( not ( = ?auto_153866 ?auto_153869 ) ) ( not ( = ?auto_153866 ?auto_153870 ) ) ( not ( = ?auto_153866 ?auto_153871 ) ) ( not ( = ?auto_153867 ?auto_153868 ) ) ( not ( = ?auto_153867 ?auto_153869 ) ) ( not ( = ?auto_153867 ?auto_153870 ) ) ( not ( = ?auto_153867 ?auto_153871 ) ) ( not ( = ?auto_153868 ?auto_153869 ) ) ( not ( = ?auto_153868 ?auto_153870 ) ) ( not ( = ?auto_153868 ?auto_153871 ) ) ( not ( = ?auto_153869 ?auto_153870 ) ) ( not ( = ?auto_153869 ?auto_153871 ) ) ( not ( = ?auto_153870 ?auto_153871 ) ) ( ON-TABLE ?auto_153871 ) ( ON ?auto_153870 ?auto_153871 ) ( ON ?auto_153869 ?auto_153870 ) ( ON ?auto_153868 ?auto_153869 ) ( ON ?auto_153864 ?auto_153872 ) ( not ( = ?auto_153864 ?auto_153872 ) ) ( not ( = ?auto_153865 ?auto_153872 ) ) ( not ( = ?auto_153866 ?auto_153872 ) ) ( not ( = ?auto_153867 ?auto_153872 ) ) ( not ( = ?auto_153868 ?auto_153872 ) ) ( not ( = ?auto_153869 ?auto_153872 ) ) ( not ( = ?auto_153870 ?auto_153872 ) ) ( not ( = ?auto_153871 ?auto_153872 ) ) ( ON ?auto_153865 ?auto_153864 ) ( ON-TABLE ?auto_153872 ) ( ON ?auto_153866 ?auto_153865 ) ( CLEAR ?auto_153868 ) ( ON ?auto_153867 ?auto_153866 ) ( CLEAR ?auto_153867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_153872 ?auto_153864 ?auto_153865 ?auto_153866 )
      ( MAKE-8PILE ?auto_153864 ?auto_153865 ?auto_153866 ?auto_153867 ?auto_153868 ?auto_153869 ?auto_153870 ?auto_153871 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_153873 - BLOCK
      ?auto_153874 - BLOCK
      ?auto_153875 - BLOCK
      ?auto_153876 - BLOCK
      ?auto_153877 - BLOCK
      ?auto_153878 - BLOCK
      ?auto_153879 - BLOCK
      ?auto_153880 - BLOCK
    )
    :vars
    (
      ?auto_153881 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153873 ?auto_153874 ) ) ( not ( = ?auto_153873 ?auto_153875 ) ) ( not ( = ?auto_153873 ?auto_153876 ) ) ( not ( = ?auto_153873 ?auto_153877 ) ) ( not ( = ?auto_153873 ?auto_153878 ) ) ( not ( = ?auto_153873 ?auto_153879 ) ) ( not ( = ?auto_153873 ?auto_153880 ) ) ( not ( = ?auto_153874 ?auto_153875 ) ) ( not ( = ?auto_153874 ?auto_153876 ) ) ( not ( = ?auto_153874 ?auto_153877 ) ) ( not ( = ?auto_153874 ?auto_153878 ) ) ( not ( = ?auto_153874 ?auto_153879 ) ) ( not ( = ?auto_153874 ?auto_153880 ) ) ( not ( = ?auto_153875 ?auto_153876 ) ) ( not ( = ?auto_153875 ?auto_153877 ) ) ( not ( = ?auto_153875 ?auto_153878 ) ) ( not ( = ?auto_153875 ?auto_153879 ) ) ( not ( = ?auto_153875 ?auto_153880 ) ) ( not ( = ?auto_153876 ?auto_153877 ) ) ( not ( = ?auto_153876 ?auto_153878 ) ) ( not ( = ?auto_153876 ?auto_153879 ) ) ( not ( = ?auto_153876 ?auto_153880 ) ) ( not ( = ?auto_153877 ?auto_153878 ) ) ( not ( = ?auto_153877 ?auto_153879 ) ) ( not ( = ?auto_153877 ?auto_153880 ) ) ( not ( = ?auto_153878 ?auto_153879 ) ) ( not ( = ?auto_153878 ?auto_153880 ) ) ( not ( = ?auto_153879 ?auto_153880 ) ) ( ON-TABLE ?auto_153880 ) ( ON ?auto_153879 ?auto_153880 ) ( ON ?auto_153878 ?auto_153879 ) ( ON ?auto_153873 ?auto_153881 ) ( not ( = ?auto_153873 ?auto_153881 ) ) ( not ( = ?auto_153874 ?auto_153881 ) ) ( not ( = ?auto_153875 ?auto_153881 ) ) ( not ( = ?auto_153876 ?auto_153881 ) ) ( not ( = ?auto_153877 ?auto_153881 ) ) ( not ( = ?auto_153878 ?auto_153881 ) ) ( not ( = ?auto_153879 ?auto_153881 ) ) ( not ( = ?auto_153880 ?auto_153881 ) ) ( ON ?auto_153874 ?auto_153873 ) ( ON-TABLE ?auto_153881 ) ( ON ?auto_153875 ?auto_153874 ) ( ON ?auto_153876 ?auto_153875 ) ( CLEAR ?auto_153876 ) ( HOLDING ?auto_153877 ) ( CLEAR ?auto_153878 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_153880 ?auto_153879 ?auto_153878 ?auto_153877 )
      ( MAKE-8PILE ?auto_153873 ?auto_153874 ?auto_153875 ?auto_153876 ?auto_153877 ?auto_153878 ?auto_153879 ?auto_153880 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_153882 - BLOCK
      ?auto_153883 - BLOCK
      ?auto_153884 - BLOCK
      ?auto_153885 - BLOCK
      ?auto_153886 - BLOCK
      ?auto_153887 - BLOCK
      ?auto_153888 - BLOCK
      ?auto_153889 - BLOCK
    )
    :vars
    (
      ?auto_153890 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153882 ?auto_153883 ) ) ( not ( = ?auto_153882 ?auto_153884 ) ) ( not ( = ?auto_153882 ?auto_153885 ) ) ( not ( = ?auto_153882 ?auto_153886 ) ) ( not ( = ?auto_153882 ?auto_153887 ) ) ( not ( = ?auto_153882 ?auto_153888 ) ) ( not ( = ?auto_153882 ?auto_153889 ) ) ( not ( = ?auto_153883 ?auto_153884 ) ) ( not ( = ?auto_153883 ?auto_153885 ) ) ( not ( = ?auto_153883 ?auto_153886 ) ) ( not ( = ?auto_153883 ?auto_153887 ) ) ( not ( = ?auto_153883 ?auto_153888 ) ) ( not ( = ?auto_153883 ?auto_153889 ) ) ( not ( = ?auto_153884 ?auto_153885 ) ) ( not ( = ?auto_153884 ?auto_153886 ) ) ( not ( = ?auto_153884 ?auto_153887 ) ) ( not ( = ?auto_153884 ?auto_153888 ) ) ( not ( = ?auto_153884 ?auto_153889 ) ) ( not ( = ?auto_153885 ?auto_153886 ) ) ( not ( = ?auto_153885 ?auto_153887 ) ) ( not ( = ?auto_153885 ?auto_153888 ) ) ( not ( = ?auto_153885 ?auto_153889 ) ) ( not ( = ?auto_153886 ?auto_153887 ) ) ( not ( = ?auto_153886 ?auto_153888 ) ) ( not ( = ?auto_153886 ?auto_153889 ) ) ( not ( = ?auto_153887 ?auto_153888 ) ) ( not ( = ?auto_153887 ?auto_153889 ) ) ( not ( = ?auto_153888 ?auto_153889 ) ) ( ON-TABLE ?auto_153889 ) ( ON ?auto_153888 ?auto_153889 ) ( ON ?auto_153887 ?auto_153888 ) ( ON ?auto_153882 ?auto_153890 ) ( not ( = ?auto_153882 ?auto_153890 ) ) ( not ( = ?auto_153883 ?auto_153890 ) ) ( not ( = ?auto_153884 ?auto_153890 ) ) ( not ( = ?auto_153885 ?auto_153890 ) ) ( not ( = ?auto_153886 ?auto_153890 ) ) ( not ( = ?auto_153887 ?auto_153890 ) ) ( not ( = ?auto_153888 ?auto_153890 ) ) ( not ( = ?auto_153889 ?auto_153890 ) ) ( ON ?auto_153883 ?auto_153882 ) ( ON-TABLE ?auto_153890 ) ( ON ?auto_153884 ?auto_153883 ) ( ON ?auto_153885 ?auto_153884 ) ( CLEAR ?auto_153887 ) ( ON ?auto_153886 ?auto_153885 ) ( CLEAR ?auto_153886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_153890 ?auto_153882 ?auto_153883 ?auto_153884 ?auto_153885 )
      ( MAKE-8PILE ?auto_153882 ?auto_153883 ?auto_153884 ?auto_153885 ?auto_153886 ?auto_153887 ?auto_153888 ?auto_153889 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_153891 - BLOCK
      ?auto_153892 - BLOCK
      ?auto_153893 - BLOCK
      ?auto_153894 - BLOCK
      ?auto_153895 - BLOCK
      ?auto_153896 - BLOCK
      ?auto_153897 - BLOCK
      ?auto_153898 - BLOCK
    )
    :vars
    (
      ?auto_153899 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153891 ?auto_153892 ) ) ( not ( = ?auto_153891 ?auto_153893 ) ) ( not ( = ?auto_153891 ?auto_153894 ) ) ( not ( = ?auto_153891 ?auto_153895 ) ) ( not ( = ?auto_153891 ?auto_153896 ) ) ( not ( = ?auto_153891 ?auto_153897 ) ) ( not ( = ?auto_153891 ?auto_153898 ) ) ( not ( = ?auto_153892 ?auto_153893 ) ) ( not ( = ?auto_153892 ?auto_153894 ) ) ( not ( = ?auto_153892 ?auto_153895 ) ) ( not ( = ?auto_153892 ?auto_153896 ) ) ( not ( = ?auto_153892 ?auto_153897 ) ) ( not ( = ?auto_153892 ?auto_153898 ) ) ( not ( = ?auto_153893 ?auto_153894 ) ) ( not ( = ?auto_153893 ?auto_153895 ) ) ( not ( = ?auto_153893 ?auto_153896 ) ) ( not ( = ?auto_153893 ?auto_153897 ) ) ( not ( = ?auto_153893 ?auto_153898 ) ) ( not ( = ?auto_153894 ?auto_153895 ) ) ( not ( = ?auto_153894 ?auto_153896 ) ) ( not ( = ?auto_153894 ?auto_153897 ) ) ( not ( = ?auto_153894 ?auto_153898 ) ) ( not ( = ?auto_153895 ?auto_153896 ) ) ( not ( = ?auto_153895 ?auto_153897 ) ) ( not ( = ?auto_153895 ?auto_153898 ) ) ( not ( = ?auto_153896 ?auto_153897 ) ) ( not ( = ?auto_153896 ?auto_153898 ) ) ( not ( = ?auto_153897 ?auto_153898 ) ) ( ON-TABLE ?auto_153898 ) ( ON ?auto_153897 ?auto_153898 ) ( ON ?auto_153891 ?auto_153899 ) ( not ( = ?auto_153891 ?auto_153899 ) ) ( not ( = ?auto_153892 ?auto_153899 ) ) ( not ( = ?auto_153893 ?auto_153899 ) ) ( not ( = ?auto_153894 ?auto_153899 ) ) ( not ( = ?auto_153895 ?auto_153899 ) ) ( not ( = ?auto_153896 ?auto_153899 ) ) ( not ( = ?auto_153897 ?auto_153899 ) ) ( not ( = ?auto_153898 ?auto_153899 ) ) ( ON ?auto_153892 ?auto_153891 ) ( ON-TABLE ?auto_153899 ) ( ON ?auto_153893 ?auto_153892 ) ( ON ?auto_153894 ?auto_153893 ) ( ON ?auto_153895 ?auto_153894 ) ( CLEAR ?auto_153895 ) ( HOLDING ?auto_153896 ) ( CLEAR ?auto_153897 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_153898 ?auto_153897 ?auto_153896 )
      ( MAKE-8PILE ?auto_153891 ?auto_153892 ?auto_153893 ?auto_153894 ?auto_153895 ?auto_153896 ?auto_153897 ?auto_153898 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_153900 - BLOCK
      ?auto_153901 - BLOCK
      ?auto_153902 - BLOCK
      ?auto_153903 - BLOCK
      ?auto_153904 - BLOCK
      ?auto_153905 - BLOCK
      ?auto_153906 - BLOCK
      ?auto_153907 - BLOCK
    )
    :vars
    (
      ?auto_153908 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153900 ?auto_153901 ) ) ( not ( = ?auto_153900 ?auto_153902 ) ) ( not ( = ?auto_153900 ?auto_153903 ) ) ( not ( = ?auto_153900 ?auto_153904 ) ) ( not ( = ?auto_153900 ?auto_153905 ) ) ( not ( = ?auto_153900 ?auto_153906 ) ) ( not ( = ?auto_153900 ?auto_153907 ) ) ( not ( = ?auto_153901 ?auto_153902 ) ) ( not ( = ?auto_153901 ?auto_153903 ) ) ( not ( = ?auto_153901 ?auto_153904 ) ) ( not ( = ?auto_153901 ?auto_153905 ) ) ( not ( = ?auto_153901 ?auto_153906 ) ) ( not ( = ?auto_153901 ?auto_153907 ) ) ( not ( = ?auto_153902 ?auto_153903 ) ) ( not ( = ?auto_153902 ?auto_153904 ) ) ( not ( = ?auto_153902 ?auto_153905 ) ) ( not ( = ?auto_153902 ?auto_153906 ) ) ( not ( = ?auto_153902 ?auto_153907 ) ) ( not ( = ?auto_153903 ?auto_153904 ) ) ( not ( = ?auto_153903 ?auto_153905 ) ) ( not ( = ?auto_153903 ?auto_153906 ) ) ( not ( = ?auto_153903 ?auto_153907 ) ) ( not ( = ?auto_153904 ?auto_153905 ) ) ( not ( = ?auto_153904 ?auto_153906 ) ) ( not ( = ?auto_153904 ?auto_153907 ) ) ( not ( = ?auto_153905 ?auto_153906 ) ) ( not ( = ?auto_153905 ?auto_153907 ) ) ( not ( = ?auto_153906 ?auto_153907 ) ) ( ON-TABLE ?auto_153907 ) ( ON ?auto_153906 ?auto_153907 ) ( ON ?auto_153900 ?auto_153908 ) ( not ( = ?auto_153900 ?auto_153908 ) ) ( not ( = ?auto_153901 ?auto_153908 ) ) ( not ( = ?auto_153902 ?auto_153908 ) ) ( not ( = ?auto_153903 ?auto_153908 ) ) ( not ( = ?auto_153904 ?auto_153908 ) ) ( not ( = ?auto_153905 ?auto_153908 ) ) ( not ( = ?auto_153906 ?auto_153908 ) ) ( not ( = ?auto_153907 ?auto_153908 ) ) ( ON ?auto_153901 ?auto_153900 ) ( ON-TABLE ?auto_153908 ) ( ON ?auto_153902 ?auto_153901 ) ( ON ?auto_153903 ?auto_153902 ) ( ON ?auto_153904 ?auto_153903 ) ( CLEAR ?auto_153906 ) ( ON ?auto_153905 ?auto_153904 ) ( CLEAR ?auto_153905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_153908 ?auto_153900 ?auto_153901 ?auto_153902 ?auto_153903 ?auto_153904 )
      ( MAKE-8PILE ?auto_153900 ?auto_153901 ?auto_153902 ?auto_153903 ?auto_153904 ?auto_153905 ?auto_153906 ?auto_153907 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_153909 - BLOCK
      ?auto_153910 - BLOCK
      ?auto_153911 - BLOCK
      ?auto_153912 - BLOCK
      ?auto_153913 - BLOCK
      ?auto_153914 - BLOCK
      ?auto_153915 - BLOCK
      ?auto_153916 - BLOCK
    )
    :vars
    (
      ?auto_153917 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153909 ?auto_153910 ) ) ( not ( = ?auto_153909 ?auto_153911 ) ) ( not ( = ?auto_153909 ?auto_153912 ) ) ( not ( = ?auto_153909 ?auto_153913 ) ) ( not ( = ?auto_153909 ?auto_153914 ) ) ( not ( = ?auto_153909 ?auto_153915 ) ) ( not ( = ?auto_153909 ?auto_153916 ) ) ( not ( = ?auto_153910 ?auto_153911 ) ) ( not ( = ?auto_153910 ?auto_153912 ) ) ( not ( = ?auto_153910 ?auto_153913 ) ) ( not ( = ?auto_153910 ?auto_153914 ) ) ( not ( = ?auto_153910 ?auto_153915 ) ) ( not ( = ?auto_153910 ?auto_153916 ) ) ( not ( = ?auto_153911 ?auto_153912 ) ) ( not ( = ?auto_153911 ?auto_153913 ) ) ( not ( = ?auto_153911 ?auto_153914 ) ) ( not ( = ?auto_153911 ?auto_153915 ) ) ( not ( = ?auto_153911 ?auto_153916 ) ) ( not ( = ?auto_153912 ?auto_153913 ) ) ( not ( = ?auto_153912 ?auto_153914 ) ) ( not ( = ?auto_153912 ?auto_153915 ) ) ( not ( = ?auto_153912 ?auto_153916 ) ) ( not ( = ?auto_153913 ?auto_153914 ) ) ( not ( = ?auto_153913 ?auto_153915 ) ) ( not ( = ?auto_153913 ?auto_153916 ) ) ( not ( = ?auto_153914 ?auto_153915 ) ) ( not ( = ?auto_153914 ?auto_153916 ) ) ( not ( = ?auto_153915 ?auto_153916 ) ) ( ON-TABLE ?auto_153916 ) ( ON ?auto_153909 ?auto_153917 ) ( not ( = ?auto_153909 ?auto_153917 ) ) ( not ( = ?auto_153910 ?auto_153917 ) ) ( not ( = ?auto_153911 ?auto_153917 ) ) ( not ( = ?auto_153912 ?auto_153917 ) ) ( not ( = ?auto_153913 ?auto_153917 ) ) ( not ( = ?auto_153914 ?auto_153917 ) ) ( not ( = ?auto_153915 ?auto_153917 ) ) ( not ( = ?auto_153916 ?auto_153917 ) ) ( ON ?auto_153910 ?auto_153909 ) ( ON-TABLE ?auto_153917 ) ( ON ?auto_153911 ?auto_153910 ) ( ON ?auto_153912 ?auto_153911 ) ( ON ?auto_153913 ?auto_153912 ) ( ON ?auto_153914 ?auto_153913 ) ( CLEAR ?auto_153914 ) ( HOLDING ?auto_153915 ) ( CLEAR ?auto_153916 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_153916 ?auto_153915 )
      ( MAKE-8PILE ?auto_153909 ?auto_153910 ?auto_153911 ?auto_153912 ?auto_153913 ?auto_153914 ?auto_153915 ?auto_153916 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_153918 - BLOCK
      ?auto_153919 - BLOCK
      ?auto_153920 - BLOCK
      ?auto_153921 - BLOCK
      ?auto_153922 - BLOCK
      ?auto_153923 - BLOCK
      ?auto_153924 - BLOCK
      ?auto_153925 - BLOCK
    )
    :vars
    (
      ?auto_153926 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153918 ?auto_153919 ) ) ( not ( = ?auto_153918 ?auto_153920 ) ) ( not ( = ?auto_153918 ?auto_153921 ) ) ( not ( = ?auto_153918 ?auto_153922 ) ) ( not ( = ?auto_153918 ?auto_153923 ) ) ( not ( = ?auto_153918 ?auto_153924 ) ) ( not ( = ?auto_153918 ?auto_153925 ) ) ( not ( = ?auto_153919 ?auto_153920 ) ) ( not ( = ?auto_153919 ?auto_153921 ) ) ( not ( = ?auto_153919 ?auto_153922 ) ) ( not ( = ?auto_153919 ?auto_153923 ) ) ( not ( = ?auto_153919 ?auto_153924 ) ) ( not ( = ?auto_153919 ?auto_153925 ) ) ( not ( = ?auto_153920 ?auto_153921 ) ) ( not ( = ?auto_153920 ?auto_153922 ) ) ( not ( = ?auto_153920 ?auto_153923 ) ) ( not ( = ?auto_153920 ?auto_153924 ) ) ( not ( = ?auto_153920 ?auto_153925 ) ) ( not ( = ?auto_153921 ?auto_153922 ) ) ( not ( = ?auto_153921 ?auto_153923 ) ) ( not ( = ?auto_153921 ?auto_153924 ) ) ( not ( = ?auto_153921 ?auto_153925 ) ) ( not ( = ?auto_153922 ?auto_153923 ) ) ( not ( = ?auto_153922 ?auto_153924 ) ) ( not ( = ?auto_153922 ?auto_153925 ) ) ( not ( = ?auto_153923 ?auto_153924 ) ) ( not ( = ?auto_153923 ?auto_153925 ) ) ( not ( = ?auto_153924 ?auto_153925 ) ) ( ON-TABLE ?auto_153925 ) ( ON ?auto_153918 ?auto_153926 ) ( not ( = ?auto_153918 ?auto_153926 ) ) ( not ( = ?auto_153919 ?auto_153926 ) ) ( not ( = ?auto_153920 ?auto_153926 ) ) ( not ( = ?auto_153921 ?auto_153926 ) ) ( not ( = ?auto_153922 ?auto_153926 ) ) ( not ( = ?auto_153923 ?auto_153926 ) ) ( not ( = ?auto_153924 ?auto_153926 ) ) ( not ( = ?auto_153925 ?auto_153926 ) ) ( ON ?auto_153919 ?auto_153918 ) ( ON-TABLE ?auto_153926 ) ( ON ?auto_153920 ?auto_153919 ) ( ON ?auto_153921 ?auto_153920 ) ( ON ?auto_153922 ?auto_153921 ) ( ON ?auto_153923 ?auto_153922 ) ( CLEAR ?auto_153925 ) ( ON ?auto_153924 ?auto_153923 ) ( CLEAR ?auto_153924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_153926 ?auto_153918 ?auto_153919 ?auto_153920 ?auto_153921 ?auto_153922 ?auto_153923 )
      ( MAKE-8PILE ?auto_153918 ?auto_153919 ?auto_153920 ?auto_153921 ?auto_153922 ?auto_153923 ?auto_153924 ?auto_153925 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_153927 - BLOCK
      ?auto_153928 - BLOCK
      ?auto_153929 - BLOCK
      ?auto_153930 - BLOCK
      ?auto_153931 - BLOCK
      ?auto_153932 - BLOCK
      ?auto_153933 - BLOCK
      ?auto_153934 - BLOCK
    )
    :vars
    (
      ?auto_153935 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153927 ?auto_153928 ) ) ( not ( = ?auto_153927 ?auto_153929 ) ) ( not ( = ?auto_153927 ?auto_153930 ) ) ( not ( = ?auto_153927 ?auto_153931 ) ) ( not ( = ?auto_153927 ?auto_153932 ) ) ( not ( = ?auto_153927 ?auto_153933 ) ) ( not ( = ?auto_153927 ?auto_153934 ) ) ( not ( = ?auto_153928 ?auto_153929 ) ) ( not ( = ?auto_153928 ?auto_153930 ) ) ( not ( = ?auto_153928 ?auto_153931 ) ) ( not ( = ?auto_153928 ?auto_153932 ) ) ( not ( = ?auto_153928 ?auto_153933 ) ) ( not ( = ?auto_153928 ?auto_153934 ) ) ( not ( = ?auto_153929 ?auto_153930 ) ) ( not ( = ?auto_153929 ?auto_153931 ) ) ( not ( = ?auto_153929 ?auto_153932 ) ) ( not ( = ?auto_153929 ?auto_153933 ) ) ( not ( = ?auto_153929 ?auto_153934 ) ) ( not ( = ?auto_153930 ?auto_153931 ) ) ( not ( = ?auto_153930 ?auto_153932 ) ) ( not ( = ?auto_153930 ?auto_153933 ) ) ( not ( = ?auto_153930 ?auto_153934 ) ) ( not ( = ?auto_153931 ?auto_153932 ) ) ( not ( = ?auto_153931 ?auto_153933 ) ) ( not ( = ?auto_153931 ?auto_153934 ) ) ( not ( = ?auto_153932 ?auto_153933 ) ) ( not ( = ?auto_153932 ?auto_153934 ) ) ( not ( = ?auto_153933 ?auto_153934 ) ) ( ON ?auto_153927 ?auto_153935 ) ( not ( = ?auto_153927 ?auto_153935 ) ) ( not ( = ?auto_153928 ?auto_153935 ) ) ( not ( = ?auto_153929 ?auto_153935 ) ) ( not ( = ?auto_153930 ?auto_153935 ) ) ( not ( = ?auto_153931 ?auto_153935 ) ) ( not ( = ?auto_153932 ?auto_153935 ) ) ( not ( = ?auto_153933 ?auto_153935 ) ) ( not ( = ?auto_153934 ?auto_153935 ) ) ( ON ?auto_153928 ?auto_153927 ) ( ON-TABLE ?auto_153935 ) ( ON ?auto_153929 ?auto_153928 ) ( ON ?auto_153930 ?auto_153929 ) ( ON ?auto_153931 ?auto_153930 ) ( ON ?auto_153932 ?auto_153931 ) ( ON ?auto_153933 ?auto_153932 ) ( CLEAR ?auto_153933 ) ( HOLDING ?auto_153934 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_153934 )
      ( MAKE-8PILE ?auto_153927 ?auto_153928 ?auto_153929 ?auto_153930 ?auto_153931 ?auto_153932 ?auto_153933 ?auto_153934 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_153936 - BLOCK
      ?auto_153937 - BLOCK
      ?auto_153938 - BLOCK
      ?auto_153939 - BLOCK
      ?auto_153940 - BLOCK
      ?auto_153941 - BLOCK
      ?auto_153942 - BLOCK
      ?auto_153943 - BLOCK
    )
    :vars
    (
      ?auto_153944 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153936 ?auto_153937 ) ) ( not ( = ?auto_153936 ?auto_153938 ) ) ( not ( = ?auto_153936 ?auto_153939 ) ) ( not ( = ?auto_153936 ?auto_153940 ) ) ( not ( = ?auto_153936 ?auto_153941 ) ) ( not ( = ?auto_153936 ?auto_153942 ) ) ( not ( = ?auto_153936 ?auto_153943 ) ) ( not ( = ?auto_153937 ?auto_153938 ) ) ( not ( = ?auto_153937 ?auto_153939 ) ) ( not ( = ?auto_153937 ?auto_153940 ) ) ( not ( = ?auto_153937 ?auto_153941 ) ) ( not ( = ?auto_153937 ?auto_153942 ) ) ( not ( = ?auto_153937 ?auto_153943 ) ) ( not ( = ?auto_153938 ?auto_153939 ) ) ( not ( = ?auto_153938 ?auto_153940 ) ) ( not ( = ?auto_153938 ?auto_153941 ) ) ( not ( = ?auto_153938 ?auto_153942 ) ) ( not ( = ?auto_153938 ?auto_153943 ) ) ( not ( = ?auto_153939 ?auto_153940 ) ) ( not ( = ?auto_153939 ?auto_153941 ) ) ( not ( = ?auto_153939 ?auto_153942 ) ) ( not ( = ?auto_153939 ?auto_153943 ) ) ( not ( = ?auto_153940 ?auto_153941 ) ) ( not ( = ?auto_153940 ?auto_153942 ) ) ( not ( = ?auto_153940 ?auto_153943 ) ) ( not ( = ?auto_153941 ?auto_153942 ) ) ( not ( = ?auto_153941 ?auto_153943 ) ) ( not ( = ?auto_153942 ?auto_153943 ) ) ( ON ?auto_153936 ?auto_153944 ) ( not ( = ?auto_153936 ?auto_153944 ) ) ( not ( = ?auto_153937 ?auto_153944 ) ) ( not ( = ?auto_153938 ?auto_153944 ) ) ( not ( = ?auto_153939 ?auto_153944 ) ) ( not ( = ?auto_153940 ?auto_153944 ) ) ( not ( = ?auto_153941 ?auto_153944 ) ) ( not ( = ?auto_153942 ?auto_153944 ) ) ( not ( = ?auto_153943 ?auto_153944 ) ) ( ON ?auto_153937 ?auto_153936 ) ( ON-TABLE ?auto_153944 ) ( ON ?auto_153938 ?auto_153937 ) ( ON ?auto_153939 ?auto_153938 ) ( ON ?auto_153940 ?auto_153939 ) ( ON ?auto_153941 ?auto_153940 ) ( ON ?auto_153942 ?auto_153941 ) ( ON ?auto_153943 ?auto_153942 ) ( CLEAR ?auto_153943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_153944 ?auto_153936 ?auto_153937 ?auto_153938 ?auto_153939 ?auto_153940 ?auto_153941 ?auto_153942 )
      ( MAKE-8PILE ?auto_153936 ?auto_153937 ?auto_153938 ?auto_153939 ?auto_153940 ?auto_153941 ?auto_153942 ?auto_153943 ) )
  )

)

