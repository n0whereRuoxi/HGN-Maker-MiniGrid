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
      ?auto_14780 - BLOCK
      ?auto_14781 - BLOCK
      ?auto_14782 - BLOCK
      ?auto_14783 - BLOCK
    )
    :vars
    (
      ?auto_14784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14784 ?auto_14783 ) ( CLEAR ?auto_14784 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14780 ) ( ON ?auto_14781 ?auto_14780 ) ( ON ?auto_14782 ?auto_14781 ) ( ON ?auto_14783 ?auto_14782 ) ( not ( = ?auto_14780 ?auto_14781 ) ) ( not ( = ?auto_14780 ?auto_14782 ) ) ( not ( = ?auto_14780 ?auto_14783 ) ) ( not ( = ?auto_14780 ?auto_14784 ) ) ( not ( = ?auto_14781 ?auto_14782 ) ) ( not ( = ?auto_14781 ?auto_14783 ) ) ( not ( = ?auto_14781 ?auto_14784 ) ) ( not ( = ?auto_14782 ?auto_14783 ) ) ( not ( = ?auto_14782 ?auto_14784 ) ) ( not ( = ?auto_14783 ?auto_14784 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14784 ?auto_14783 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14786 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_14786 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_14786 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14787 - BLOCK
    )
    :vars
    (
      ?auto_14788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14787 ?auto_14788 ) ( CLEAR ?auto_14787 ) ( HAND-EMPTY ) ( not ( = ?auto_14787 ?auto_14788 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14787 ?auto_14788 )
      ( MAKE-1PILE ?auto_14787 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14792 - BLOCK
      ?auto_14793 - BLOCK
      ?auto_14794 - BLOCK
    )
    :vars
    (
      ?auto_14795 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14795 ?auto_14794 ) ( CLEAR ?auto_14795 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14792 ) ( ON ?auto_14793 ?auto_14792 ) ( ON ?auto_14794 ?auto_14793 ) ( not ( = ?auto_14792 ?auto_14793 ) ) ( not ( = ?auto_14792 ?auto_14794 ) ) ( not ( = ?auto_14792 ?auto_14795 ) ) ( not ( = ?auto_14793 ?auto_14794 ) ) ( not ( = ?auto_14793 ?auto_14795 ) ) ( not ( = ?auto_14794 ?auto_14795 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14795 ?auto_14794 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14796 - BLOCK
      ?auto_14797 - BLOCK
      ?auto_14798 - BLOCK
    )
    :vars
    (
      ?auto_14799 - BLOCK
      ?auto_14800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14799 ?auto_14798 ) ( CLEAR ?auto_14799 ) ( ON-TABLE ?auto_14796 ) ( ON ?auto_14797 ?auto_14796 ) ( ON ?auto_14798 ?auto_14797 ) ( not ( = ?auto_14796 ?auto_14797 ) ) ( not ( = ?auto_14796 ?auto_14798 ) ) ( not ( = ?auto_14796 ?auto_14799 ) ) ( not ( = ?auto_14797 ?auto_14798 ) ) ( not ( = ?auto_14797 ?auto_14799 ) ) ( not ( = ?auto_14798 ?auto_14799 ) ) ( HOLDING ?auto_14800 ) ( not ( = ?auto_14796 ?auto_14800 ) ) ( not ( = ?auto_14797 ?auto_14800 ) ) ( not ( = ?auto_14798 ?auto_14800 ) ) ( not ( = ?auto_14799 ?auto_14800 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_14800 )
      ( MAKE-3PILE ?auto_14796 ?auto_14797 ?auto_14798 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14801 - BLOCK
      ?auto_14802 - BLOCK
      ?auto_14803 - BLOCK
    )
    :vars
    (
      ?auto_14804 - BLOCK
      ?auto_14805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14804 ?auto_14803 ) ( ON-TABLE ?auto_14801 ) ( ON ?auto_14802 ?auto_14801 ) ( ON ?auto_14803 ?auto_14802 ) ( not ( = ?auto_14801 ?auto_14802 ) ) ( not ( = ?auto_14801 ?auto_14803 ) ) ( not ( = ?auto_14801 ?auto_14804 ) ) ( not ( = ?auto_14802 ?auto_14803 ) ) ( not ( = ?auto_14802 ?auto_14804 ) ) ( not ( = ?auto_14803 ?auto_14804 ) ) ( not ( = ?auto_14801 ?auto_14805 ) ) ( not ( = ?auto_14802 ?auto_14805 ) ) ( not ( = ?auto_14803 ?auto_14805 ) ) ( not ( = ?auto_14804 ?auto_14805 ) ) ( ON ?auto_14805 ?auto_14804 ) ( CLEAR ?auto_14805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14801 ?auto_14802 ?auto_14803 ?auto_14804 )
      ( MAKE-3PILE ?auto_14801 ?auto_14802 ?auto_14803 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14808 - BLOCK
      ?auto_14809 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_14809 ) ( CLEAR ?auto_14808 ) ( ON-TABLE ?auto_14808 ) ( not ( = ?auto_14808 ?auto_14809 ) ) )
    :subtasks
    ( ( !STACK ?auto_14809 ?auto_14808 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14810 - BLOCK
      ?auto_14811 - BLOCK
    )
    :vars
    (
      ?auto_14812 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_14810 ) ( ON-TABLE ?auto_14810 ) ( not ( = ?auto_14810 ?auto_14811 ) ) ( ON ?auto_14811 ?auto_14812 ) ( CLEAR ?auto_14811 ) ( HAND-EMPTY ) ( not ( = ?auto_14810 ?auto_14812 ) ) ( not ( = ?auto_14811 ?auto_14812 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14811 ?auto_14812 )
      ( MAKE-2PILE ?auto_14810 ?auto_14811 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14813 - BLOCK
      ?auto_14814 - BLOCK
    )
    :vars
    (
      ?auto_14815 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14813 ?auto_14814 ) ) ( ON ?auto_14814 ?auto_14815 ) ( CLEAR ?auto_14814 ) ( not ( = ?auto_14813 ?auto_14815 ) ) ( not ( = ?auto_14814 ?auto_14815 ) ) ( HOLDING ?auto_14813 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14813 )
      ( MAKE-2PILE ?auto_14813 ?auto_14814 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14816 - BLOCK
      ?auto_14817 - BLOCK
    )
    :vars
    (
      ?auto_14818 - BLOCK
      ?auto_14820 - BLOCK
      ?auto_14819 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14816 ?auto_14817 ) ) ( ON ?auto_14817 ?auto_14818 ) ( not ( = ?auto_14816 ?auto_14818 ) ) ( not ( = ?auto_14817 ?auto_14818 ) ) ( ON ?auto_14816 ?auto_14817 ) ( CLEAR ?auto_14816 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14820 ) ( ON ?auto_14819 ?auto_14820 ) ( ON ?auto_14818 ?auto_14819 ) ( not ( = ?auto_14820 ?auto_14819 ) ) ( not ( = ?auto_14820 ?auto_14818 ) ) ( not ( = ?auto_14820 ?auto_14817 ) ) ( not ( = ?auto_14820 ?auto_14816 ) ) ( not ( = ?auto_14819 ?auto_14818 ) ) ( not ( = ?auto_14819 ?auto_14817 ) ) ( not ( = ?auto_14819 ?auto_14816 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14820 ?auto_14819 ?auto_14818 ?auto_14817 )
      ( MAKE-2PILE ?auto_14816 ?auto_14817 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14823 - BLOCK
      ?auto_14824 - BLOCK
    )
    :vars
    (
      ?auto_14825 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14825 ?auto_14824 ) ( CLEAR ?auto_14825 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14823 ) ( ON ?auto_14824 ?auto_14823 ) ( not ( = ?auto_14823 ?auto_14824 ) ) ( not ( = ?auto_14823 ?auto_14825 ) ) ( not ( = ?auto_14824 ?auto_14825 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14825 ?auto_14824 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14826 - BLOCK
      ?auto_14827 - BLOCK
    )
    :vars
    (
      ?auto_14828 - BLOCK
      ?auto_14829 - BLOCK
      ?auto_14830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14828 ?auto_14827 ) ( CLEAR ?auto_14828 ) ( ON-TABLE ?auto_14826 ) ( ON ?auto_14827 ?auto_14826 ) ( not ( = ?auto_14826 ?auto_14827 ) ) ( not ( = ?auto_14826 ?auto_14828 ) ) ( not ( = ?auto_14827 ?auto_14828 ) ) ( HOLDING ?auto_14829 ) ( CLEAR ?auto_14830 ) ( not ( = ?auto_14826 ?auto_14829 ) ) ( not ( = ?auto_14826 ?auto_14830 ) ) ( not ( = ?auto_14827 ?auto_14829 ) ) ( not ( = ?auto_14827 ?auto_14830 ) ) ( not ( = ?auto_14828 ?auto_14829 ) ) ( not ( = ?auto_14828 ?auto_14830 ) ) ( not ( = ?auto_14829 ?auto_14830 ) ) )
    :subtasks
    ( ( !STACK ?auto_14829 ?auto_14830 )
      ( MAKE-2PILE ?auto_14826 ?auto_14827 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15026 - BLOCK
      ?auto_15027 - BLOCK
    )
    :vars
    (
      ?auto_15029 - BLOCK
      ?auto_15028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15029 ?auto_15027 ) ( ON-TABLE ?auto_15026 ) ( ON ?auto_15027 ?auto_15026 ) ( not ( = ?auto_15026 ?auto_15027 ) ) ( not ( = ?auto_15026 ?auto_15029 ) ) ( not ( = ?auto_15027 ?auto_15029 ) ) ( not ( = ?auto_15026 ?auto_15028 ) ) ( not ( = ?auto_15027 ?auto_15028 ) ) ( not ( = ?auto_15029 ?auto_15028 ) ) ( ON ?auto_15028 ?auto_15029 ) ( CLEAR ?auto_15028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15026 ?auto_15027 ?auto_15029 )
      ( MAKE-2PILE ?auto_15026 ?auto_15027 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14836 - BLOCK
      ?auto_14837 - BLOCK
    )
    :vars
    (
      ?auto_14839 - BLOCK
      ?auto_14838 - BLOCK
      ?auto_14840 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14839 ?auto_14837 ) ( ON-TABLE ?auto_14836 ) ( ON ?auto_14837 ?auto_14836 ) ( not ( = ?auto_14836 ?auto_14837 ) ) ( not ( = ?auto_14836 ?auto_14839 ) ) ( not ( = ?auto_14837 ?auto_14839 ) ) ( not ( = ?auto_14836 ?auto_14838 ) ) ( not ( = ?auto_14836 ?auto_14840 ) ) ( not ( = ?auto_14837 ?auto_14838 ) ) ( not ( = ?auto_14837 ?auto_14840 ) ) ( not ( = ?auto_14839 ?auto_14838 ) ) ( not ( = ?auto_14839 ?auto_14840 ) ) ( not ( = ?auto_14838 ?auto_14840 ) ) ( ON ?auto_14838 ?auto_14839 ) ( CLEAR ?auto_14838 ) ( HOLDING ?auto_14840 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14840 )
      ( MAKE-2PILE ?auto_14836 ?auto_14837 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14841 - BLOCK
      ?auto_14842 - BLOCK
    )
    :vars
    (
      ?auto_14843 - BLOCK
      ?auto_14844 - BLOCK
      ?auto_14845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14843 ?auto_14842 ) ( ON-TABLE ?auto_14841 ) ( ON ?auto_14842 ?auto_14841 ) ( not ( = ?auto_14841 ?auto_14842 ) ) ( not ( = ?auto_14841 ?auto_14843 ) ) ( not ( = ?auto_14842 ?auto_14843 ) ) ( not ( = ?auto_14841 ?auto_14844 ) ) ( not ( = ?auto_14841 ?auto_14845 ) ) ( not ( = ?auto_14842 ?auto_14844 ) ) ( not ( = ?auto_14842 ?auto_14845 ) ) ( not ( = ?auto_14843 ?auto_14844 ) ) ( not ( = ?auto_14843 ?auto_14845 ) ) ( not ( = ?auto_14844 ?auto_14845 ) ) ( ON ?auto_14844 ?auto_14843 ) ( ON ?auto_14845 ?auto_14844 ) ( CLEAR ?auto_14845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14841 ?auto_14842 ?auto_14843 ?auto_14844 )
      ( MAKE-2PILE ?auto_14841 ?auto_14842 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14849 - BLOCK
      ?auto_14850 - BLOCK
      ?auto_14851 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_14851 ) ( CLEAR ?auto_14850 ) ( ON-TABLE ?auto_14849 ) ( ON ?auto_14850 ?auto_14849 ) ( not ( = ?auto_14849 ?auto_14850 ) ) ( not ( = ?auto_14849 ?auto_14851 ) ) ( not ( = ?auto_14850 ?auto_14851 ) ) )
    :subtasks
    ( ( !STACK ?auto_14851 ?auto_14850 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14852 - BLOCK
      ?auto_14853 - BLOCK
      ?auto_14854 - BLOCK
    )
    :vars
    (
      ?auto_14855 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_14853 ) ( ON-TABLE ?auto_14852 ) ( ON ?auto_14853 ?auto_14852 ) ( not ( = ?auto_14852 ?auto_14853 ) ) ( not ( = ?auto_14852 ?auto_14854 ) ) ( not ( = ?auto_14853 ?auto_14854 ) ) ( ON ?auto_14854 ?auto_14855 ) ( CLEAR ?auto_14854 ) ( HAND-EMPTY ) ( not ( = ?auto_14852 ?auto_14855 ) ) ( not ( = ?auto_14853 ?auto_14855 ) ) ( not ( = ?auto_14854 ?auto_14855 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14854 ?auto_14855 )
      ( MAKE-3PILE ?auto_14852 ?auto_14853 ?auto_14854 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14856 - BLOCK
      ?auto_14857 - BLOCK
      ?auto_14858 - BLOCK
    )
    :vars
    (
      ?auto_14859 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14856 ) ( not ( = ?auto_14856 ?auto_14857 ) ) ( not ( = ?auto_14856 ?auto_14858 ) ) ( not ( = ?auto_14857 ?auto_14858 ) ) ( ON ?auto_14858 ?auto_14859 ) ( CLEAR ?auto_14858 ) ( not ( = ?auto_14856 ?auto_14859 ) ) ( not ( = ?auto_14857 ?auto_14859 ) ) ( not ( = ?auto_14858 ?auto_14859 ) ) ( HOLDING ?auto_14857 ) ( CLEAR ?auto_14856 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14856 ?auto_14857 )
      ( MAKE-3PILE ?auto_14856 ?auto_14857 ?auto_14858 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14860 - BLOCK
      ?auto_14861 - BLOCK
      ?auto_14862 - BLOCK
    )
    :vars
    (
      ?auto_14863 - BLOCK
      ?auto_14864 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14860 ) ( not ( = ?auto_14860 ?auto_14861 ) ) ( not ( = ?auto_14860 ?auto_14862 ) ) ( not ( = ?auto_14861 ?auto_14862 ) ) ( ON ?auto_14862 ?auto_14863 ) ( not ( = ?auto_14860 ?auto_14863 ) ) ( not ( = ?auto_14861 ?auto_14863 ) ) ( not ( = ?auto_14862 ?auto_14863 ) ) ( CLEAR ?auto_14860 ) ( ON ?auto_14861 ?auto_14862 ) ( CLEAR ?auto_14861 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14864 ) ( ON ?auto_14863 ?auto_14864 ) ( not ( = ?auto_14864 ?auto_14863 ) ) ( not ( = ?auto_14864 ?auto_14862 ) ) ( not ( = ?auto_14864 ?auto_14861 ) ) ( not ( = ?auto_14860 ?auto_14864 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14864 ?auto_14863 ?auto_14862 )
      ( MAKE-3PILE ?auto_14860 ?auto_14861 ?auto_14862 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14865 - BLOCK
      ?auto_14866 - BLOCK
      ?auto_14867 - BLOCK
    )
    :vars
    (
      ?auto_14869 - BLOCK
      ?auto_14868 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14865 ?auto_14866 ) ) ( not ( = ?auto_14865 ?auto_14867 ) ) ( not ( = ?auto_14866 ?auto_14867 ) ) ( ON ?auto_14867 ?auto_14869 ) ( not ( = ?auto_14865 ?auto_14869 ) ) ( not ( = ?auto_14866 ?auto_14869 ) ) ( not ( = ?auto_14867 ?auto_14869 ) ) ( ON ?auto_14866 ?auto_14867 ) ( CLEAR ?auto_14866 ) ( ON-TABLE ?auto_14868 ) ( ON ?auto_14869 ?auto_14868 ) ( not ( = ?auto_14868 ?auto_14869 ) ) ( not ( = ?auto_14868 ?auto_14867 ) ) ( not ( = ?auto_14868 ?auto_14866 ) ) ( not ( = ?auto_14865 ?auto_14868 ) ) ( HOLDING ?auto_14865 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14865 )
      ( MAKE-3PILE ?auto_14865 ?auto_14866 ?auto_14867 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14870 - BLOCK
      ?auto_14871 - BLOCK
      ?auto_14872 - BLOCK
    )
    :vars
    (
      ?auto_14874 - BLOCK
      ?auto_14873 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14870 ?auto_14871 ) ) ( not ( = ?auto_14870 ?auto_14872 ) ) ( not ( = ?auto_14871 ?auto_14872 ) ) ( ON ?auto_14872 ?auto_14874 ) ( not ( = ?auto_14870 ?auto_14874 ) ) ( not ( = ?auto_14871 ?auto_14874 ) ) ( not ( = ?auto_14872 ?auto_14874 ) ) ( ON ?auto_14871 ?auto_14872 ) ( ON-TABLE ?auto_14873 ) ( ON ?auto_14874 ?auto_14873 ) ( not ( = ?auto_14873 ?auto_14874 ) ) ( not ( = ?auto_14873 ?auto_14872 ) ) ( not ( = ?auto_14873 ?auto_14871 ) ) ( not ( = ?auto_14870 ?auto_14873 ) ) ( ON ?auto_14870 ?auto_14871 ) ( CLEAR ?auto_14870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14873 ?auto_14874 ?auto_14872 ?auto_14871 )
      ( MAKE-3PILE ?auto_14870 ?auto_14871 ?auto_14872 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14876 - BLOCK
    )
    :vars
    (
      ?auto_14877 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14877 ?auto_14876 ) ( CLEAR ?auto_14877 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14876 ) ( not ( = ?auto_14876 ?auto_14877 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14877 ?auto_14876 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14878 - BLOCK
    )
    :vars
    (
      ?auto_14879 - BLOCK
      ?auto_14880 - BLOCK
      ?auto_14881 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14879 ?auto_14878 ) ( CLEAR ?auto_14879 ) ( ON-TABLE ?auto_14878 ) ( not ( = ?auto_14878 ?auto_14879 ) ) ( HOLDING ?auto_14880 ) ( CLEAR ?auto_14881 ) ( not ( = ?auto_14878 ?auto_14880 ) ) ( not ( = ?auto_14878 ?auto_14881 ) ) ( not ( = ?auto_14879 ?auto_14880 ) ) ( not ( = ?auto_14879 ?auto_14881 ) ) ( not ( = ?auto_14880 ?auto_14881 ) ) )
    :subtasks
    ( ( !STACK ?auto_14880 ?auto_14881 )
      ( MAKE-1PILE ?auto_14878 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14882 - BLOCK
    )
    :vars
    (
      ?auto_14885 - BLOCK
      ?auto_14884 - BLOCK
      ?auto_14883 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14885 ?auto_14882 ) ( ON-TABLE ?auto_14882 ) ( not ( = ?auto_14882 ?auto_14885 ) ) ( CLEAR ?auto_14884 ) ( not ( = ?auto_14882 ?auto_14883 ) ) ( not ( = ?auto_14882 ?auto_14884 ) ) ( not ( = ?auto_14885 ?auto_14883 ) ) ( not ( = ?auto_14885 ?auto_14884 ) ) ( not ( = ?auto_14883 ?auto_14884 ) ) ( ON ?auto_14883 ?auto_14885 ) ( CLEAR ?auto_14883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14882 ?auto_14885 )
      ( MAKE-1PILE ?auto_14882 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14886 - BLOCK
    )
    :vars
    (
      ?auto_14888 - BLOCK
      ?auto_14889 - BLOCK
      ?auto_14887 - BLOCK
      ?auto_14890 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14888 ?auto_14886 ) ( ON-TABLE ?auto_14886 ) ( not ( = ?auto_14886 ?auto_14888 ) ) ( not ( = ?auto_14886 ?auto_14889 ) ) ( not ( = ?auto_14886 ?auto_14887 ) ) ( not ( = ?auto_14888 ?auto_14889 ) ) ( not ( = ?auto_14888 ?auto_14887 ) ) ( not ( = ?auto_14889 ?auto_14887 ) ) ( ON ?auto_14889 ?auto_14888 ) ( CLEAR ?auto_14889 ) ( HOLDING ?auto_14887 ) ( CLEAR ?auto_14890 ) ( ON-TABLE ?auto_14890 ) ( not ( = ?auto_14890 ?auto_14887 ) ) ( not ( = ?auto_14886 ?auto_14890 ) ) ( not ( = ?auto_14888 ?auto_14890 ) ) ( not ( = ?auto_14889 ?auto_14890 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14890 ?auto_14887 )
      ( MAKE-1PILE ?auto_14886 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15114 - BLOCK
    )
    :vars
    (
      ?auto_15116 - BLOCK
      ?auto_15117 - BLOCK
      ?auto_15115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15116 ?auto_15114 ) ( ON-TABLE ?auto_15114 ) ( not ( = ?auto_15114 ?auto_15116 ) ) ( not ( = ?auto_15114 ?auto_15117 ) ) ( not ( = ?auto_15114 ?auto_15115 ) ) ( not ( = ?auto_15116 ?auto_15117 ) ) ( not ( = ?auto_15116 ?auto_15115 ) ) ( not ( = ?auto_15117 ?auto_15115 ) ) ( ON ?auto_15117 ?auto_15116 ) ( ON ?auto_15115 ?auto_15117 ) ( CLEAR ?auto_15115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15114 ?auto_15116 ?auto_15117 )
      ( MAKE-1PILE ?auto_15114 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14896 - BLOCK
    )
    :vars
    (
      ?auto_14899 - BLOCK
      ?auto_14900 - BLOCK
      ?auto_14898 - BLOCK
      ?auto_14897 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14899 ?auto_14896 ) ( ON-TABLE ?auto_14896 ) ( not ( = ?auto_14896 ?auto_14899 ) ) ( not ( = ?auto_14896 ?auto_14900 ) ) ( not ( = ?auto_14896 ?auto_14898 ) ) ( not ( = ?auto_14899 ?auto_14900 ) ) ( not ( = ?auto_14899 ?auto_14898 ) ) ( not ( = ?auto_14900 ?auto_14898 ) ) ( ON ?auto_14900 ?auto_14899 ) ( not ( = ?auto_14897 ?auto_14898 ) ) ( not ( = ?auto_14896 ?auto_14897 ) ) ( not ( = ?auto_14899 ?auto_14897 ) ) ( not ( = ?auto_14900 ?auto_14897 ) ) ( ON ?auto_14898 ?auto_14900 ) ( CLEAR ?auto_14898 ) ( HOLDING ?auto_14897 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14897 )
      ( MAKE-1PILE ?auto_14896 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14901 - BLOCK
    )
    :vars
    (
      ?auto_14904 - BLOCK
      ?auto_14902 - BLOCK
      ?auto_14903 - BLOCK
      ?auto_14905 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14904 ?auto_14901 ) ( ON-TABLE ?auto_14901 ) ( not ( = ?auto_14901 ?auto_14904 ) ) ( not ( = ?auto_14901 ?auto_14902 ) ) ( not ( = ?auto_14901 ?auto_14903 ) ) ( not ( = ?auto_14904 ?auto_14902 ) ) ( not ( = ?auto_14904 ?auto_14903 ) ) ( not ( = ?auto_14902 ?auto_14903 ) ) ( ON ?auto_14902 ?auto_14904 ) ( not ( = ?auto_14905 ?auto_14903 ) ) ( not ( = ?auto_14901 ?auto_14905 ) ) ( not ( = ?auto_14904 ?auto_14905 ) ) ( not ( = ?auto_14902 ?auto_14905 ) ) ( ON ?auto_14903 ?auto_14902 ) ( ON ?auto_14905 ?auto_14903 ) ( CLEAR ?auto_14905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14901 ?auto_14904 ?auto_14902 ?auto_14903 )
      ( MAKE-1PILE ?auto_14901 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14910 - BLOCK
      ?auto_14911 - BLOCK
      ?auto_14912 - BLOCK
      ?auto_14913 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_14913 ) ( CLEAR ?auto_14912 ) ( ON-TABLE ?auto_14910 ) ( ON ?auto_14911 ?auto_14910 ) ( ON ?auto_14912 ?auto_14911 ) ( not ( = ?auto_14910 ?auto_14911 ) ) ( not ( = ?auto_14910 ?auto_14912 ) ) ( not ( = ?auto_14910 ?auto_14913 ) ) ( not ( = ?auto_14911 ?auto_14912 ) ) ( not ( = ?auto_14911 ?auto_14913 ) ) ( not ( = ?auto_14912 ?auto_14913 ) ) )
    :subtasks
    ( ( !STACK ?auto_14913 ?auto_14912 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14914 - BLOCK
      ?auto_14915 - BLOCK
      ?auto_14916 - BLOCK
      ?auto_14917 - BLOCK
    )
    :vars
    (
      ?auto_14918 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_14916 ) ( ON-TABLE ?auto_14914 ) ( ON ?auto_14915 ?auto_14914 ) ( ON ?auto_14916 ?auto_14915 ) ( not ( = ?auto_14914 ?auto_14915 ) ) ( not ( = ?auto_14914 ?auto_14916 ) ) ( not ( = ?auto_14914 ?auto_14917 ) ) ( not ( = ?auto_14915 ?auto_14916 ) ) ( not ( = ?auto_14915 ?auto_14917 ) ) ( not ( = ?auto_14916 ?auto_14917 ) ) ( ON ?auto_14917 ?auto_14918 ) ( CLEAR ?auto_14917 ) ( HAND-EMPTY ) ( not ( = ?auto_14914 ?auto_14918 ) ) ( not ( = ?auto_14915 ?auto_14918 ) ) ( not ( = ?auto_14916 ?auto_14918 ) ) ( not ( = ?auto_14917 ?auto_14918 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14917 ?auto_14918 )
      ( MAKE-4PILE ?auto_14914 ?auto_14915 ?auto_14916 ?auto_14917 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14919 - BLOCK
      ?auto_14920 - BLOCK
      ?auto_14921 - BLOCK
      ?auto_14922 - BLOCK
    )
    :vars
    (
      ?auto_14923 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14919 ) ( ON ?auto_14920 ?auto_14919 ) ( not ( = ?auto_14919 ?auto_14920 ) ) ( not ( = ?auto_14919 ?auto_14921 ) ) ( not ( = ?auto_14919 ?auto_14922 ) ) ( not ( = ?auto_14920 ?auto_14921 ) ) ( not ( = ?auto_14920 ?auto_14922 ) ) ( not ( = ?auto_14921 ?auto_14922 ) ) ( ON ?auto_14922 ?auto_14923 ) ( CLEAR ?auto_14922 ) ( not ( = ?auto_14919 ?auto_14923 ) ) ( not ( = ?auto_14920 ?auto_14923 ) ) ( not ( = ?auto_14921 ?auto_14923 ) ) ( not ( = ?auto_14922 ?auto_14923 ) ) ( HOLDING ?auto_14921 ) ( CLEAR ?auto_14920 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14919 ?auto_14920 ?auto_14921 )
      ( MAKE-4PILE ?auto_14919 ?auto_14920 ?auto_14921 ?auto_14922 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14924 - BLOCK
      ?auto_14925 - BLOCK
      ?auto_14926 - BLOCK
      ?auto_14927 - BLOCK
    )
    :vars
    (
      ?auto_14928 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14924 ) ( ON ?auto_14925 ?auto_14924 ) ( not ( = ?auto_14924 ?auto_14925 ) ) ( not ( = ?auto_14924 ?auto_14926 ) ) ( not ( = ?auto_14924 ?auto_14927 ) ) ( not ( = ?auto_14925 ?auto_14926 ) ) ( not ( = ?auto_14925 ?auto_14927 ) ) ( not ( = ?auto_14926 ?auto_14927 ) ) ( ON ?auto_14927 ?auto_14928 ) ( not ( = ?auto_14924 ?auto_14928 ) ) ( not ( = ?auto_14925 ?auto_14928 ) ) ( not ( = ?auto_14926 ?auto_14928 ) ) ( not ( = ?auto_14927 ?auto_14928 ) ) ( CLEAR ?auto_14925 ) ( ON ?auto_14926 ?auto_14927 ) ( CLEAR ?auto_14926 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14928 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14928 ?auto_14927 )
      ( MAKE-4PILE ?auto_14924 ?auto_14925 ?auto_14926 ?auto_14927 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14929 - BLOCK
      ?auto_14930 - BLOCK
      ?auto_14931 - BLOCK
      ?auto_14932 - BLOCK
    )
    :vars
    (
      ?auto_14933 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14929 ) ( not ( = ?auto_14929 ?auto_14930 ) ) ( not ( = ?auto_14929 ?auto_14931 ) ) ( not ( = ?auto_14929 ?auto_14932 ) ) ( not ( = ?auto_14930 ?auto_14931 ) ) ( not ( = ?auto_14930 ?auto_14932 ) ) ( not ( = ?auto_14931 ?auto_14932 ) ) ( ON ?auto_14932 ?auto_14933 ) ( not ( = ?auto_14929 ?auto_14933 ) ) ( not ( = ?auto_14930 ?auto_14933 ) ) ( not ( = ?auto_14931 ?auto_14933 ) ) ( not ( = ?auto_14932 ?auto_14933 ) ) ( ON ?auto_14931 ?auto_14932 ) ( CLEAR ?auto_14931 ) ( ON-TABLE ?auto_14933 ) ( HOLDING ?auto_14930 ) ( CLEAR ?auto_14929 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14929 ?auto_14930 )
      ( MAKE-4PILE ?auto_14929 ?auto_14930 ?auto_14931 ?auto_14932 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14934 - BLOCK
      ?auto_14935 - BLOCK
      ?auto_14936 - BLOCK
      ?auto_14937 - BLOCK
    )
    :vars
    (
      ?auto_14938 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14934 ) ( not ( = ?auto_14934 ?auto_14935 ) ) ( not ( = ?auto_14934 ?auto_14936 ) ) ( not ( = ?auto_14934 ?auto_14937 ) ) ( not ( = ?auto_14935 ?auto_14936 ) ) ( not ( = ?auto_14935 ?auto_14937 ) ) ( not ( = ?auto_14936 ?auto_14937 ) ) ( ON ?auto_14937 ?auto_14938 ) ( not ( = ?auto_14934 ?auto_14938 ) ) ( not ( = ?auto_14935 ?auto_14938 ) ) ( not ( = ?auto_14936 ?auto_14938 ) ) ( not ( = ?auto_14937 ?auto_14938 ) ) ( ON ?auto_14936 ?auto_14937 ) ( ON-TABLE ?auto_14938 ) ( CLEAR ?auto_14934 ) ( ON ?auto_14935 ?auto_14936 ) ( CLEAR ?auto_14935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14938 ?auto_14937 ?auto_14936 )
      ( MAKE-4PILE ?auto_14934 ?auto_14935 ?auto_14936 ?auto_14937 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14939 - BLOCK
      ?auto_14940 - BLOCK
      ?auto_14941 - BLOCK
      ?auto_14942 - BLOCK
    )
    :vars
    (
      ?auto_14943 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14939 ?auto_14940 ) ) ( not ( = ?auto_14939 ?auto_14941 ) ) ( not ( = ?auto_14939 ?auto_14942 ) ) ( not ( = ?auto_14940 ?auto_14941 ) ) ( not ( = ?auto_14940 ?auto_14942 ) ) ( not ( = ?auto_14941 ?auto_14942 ) ) ( ON ?auto_14942 ?auto_14943 ) ( not ( = ?auto_14939 ?auto_14943 ) ) ( not ( = ?auto_14940 ?auto_14943 ) ) ( not ( = ?auto_14941 ?auto_14943 ) ) ( not ( = ?auto_14942 ?auto_14943 ) ) ( ON ?auto_14941 ?auto_14942 ) ( ON-TABLE ?auto_14943 ) ( ON ?auto_14940 ?auto_14941 ) ( CLEAR ?auto_14940 ) ( HOLDING ?auto_14939 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14939 )
      ( MAKE-4PILE ?auto_14939 ?auto_14940 ?auto_14941 ?auto_14942 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14944 - BLOCK
      ?auto_14945 - BLOCK
      ?auto_14946 - BLOCK
      ?auto_14947 - BLOCK
    )
    :vars
    (
      ?auto_14948 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14944 ?auto_14945 ) ) ( not ( = ?auto_14944 ?auto_14946 ) ) ( not ( = ?auto_14944 ?auto_14947 ) ) ( not ( = ?auto_14945 ?auto_14946 ) ) ( not ( = ?auto_14945 ?auto_14947 ) ) ( not ( = ?auto_14946 ?auto_14947 ) ) ( ON ?auto_14947 ?auto_14948 ) ( not ( = ?auto_14944 ?auto_14948 ) ) ( not ( = ?auto_14945 ?auto_14948 ) ) ( not ( = ?auto_14946 ?auto_14948 ) ) ( not ( = ?auto_14947 ?auto_14948 ) ) ( ON ?auto_14946 ?auto_14947 ) ( ON-TABLE ?auto_14948 ) ( ON ?auto_14945 ?auto_14946 ) ( ON ?auto_14944 ?auto_14945 ) ( CLEAR ?auto_14944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14948 ?auto_14947 ?auto_14946 ?auto_14945 )
      ( MAKE-4PILE ?auto_14944 ?auto_14945 ?auto_14946 ?auto_14947 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14989 - BLOCK
    )
    :vars
    (
      ?auto_14990 - BLOCK
      ?auto_14991 - BLOCK
      ?auto_14992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14989 ?auto_14990 ) ( CLEAR ?auto_14989 ) ( not ( = ?auto_14989 ?auto_14990 ) ) ( HOLDING ?auto_14991 ) ( CLEAR ?auto_14992 ) ( not ( = ?auto_14989 ?auto_14991 ) ) ( not ( = ?auto_14989 ?auto_14992 ) ) ( not ( = ?auto_14990 ?auto_14991 ) ) ( not ( = ?auto_14990 ?auto_14992 ) ) ( not ( = ?auto_14991 ?auto_14992 ) ) )
    :subtasks
    ( ( !STACK ?auto_14991 ?auto_14992 )
      ( MAKE-1PILE ?auto_14989 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14993 - BLOCK
    )
    :vars
    (
      ?auto_14995 - BLOCK
      ?auto_14994 - BLOCK
      ?auto_14996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14993 ?auto_14995 ) ( not ( = ?auto_14993 ?auto_14995 ) ) ( CLEAR ?auto_14994 ) ( not ( = ?auto_14993 ?auto_14996 ) ) ( not ( = ?auto_14993 ?auto_14994 ) ) ( not ( = ?auto_14995 ?auto_14996 ) ) ( not ( = ?auto_14995 ?auto_14994 ) ) ( not ( = ?auto_14996 ?auto_14994 ) ) ( ON ?auto_14996 ?auto_14993 ) ( CLEAR ?auto_14996 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14995 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14995 ?auto_14993 )
      ( MAKE-1PILE ?auto_14993 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14997 - BLOCK
    )
    :vars
    (
      ?auto_14999 - BLOCK
      ?auto_14998 - BLOCK
      ?auto_15000 - BLOCK
      ?auto_15001 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14997 ?auto_14999 ) ( not ( = ?auto_14997 ?auto_14999 ) ) ( not ( = ?auto_14997 ?auto_14998 ) ) ( not ( = ?auto_14997 ?auto_15000 ) ) ( not ( = ?auto_14999 ?auto_14998 ) ) ( not ( = ?auto_14999 ?auto_15000 ) ) ( not ( = ?auto_14998 ?auto_15000 ) ) ( ON ?auto_14998 ?auto_14997 ) ( CLEAR ?auto_14998 ) ( ON-TABLE ?auto_14999 ) ( HOLDING ?auto_15000 ) ( CLEAR ?auto_15001 ) ( ON-TABLE ?auto_15001 ) ( not ( = ?auto_15001 ?auto_15000 ) ) ( not ( = ?auto_14997 ?auto_15001 ) ) ( not ( = ?auto_14999 ?auto_15001 ) ) ( not ( = ?auto_14998 ?auto_15001 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15001 ?auto_15000 )
      ( MAKE-1PILE ?auto_14997 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15002 - BLOCK
    )
    :vars
    (
      ?auto_15004 - BLOCK
      ?auto_15005 - BLOCK
      ?auto_15006 - BLOCK
      ?auto_15003 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15002 ?auto_15004 ) ( not ( = ?auto_15002 ?auto_15004 ) ) ( not ( = ?auto_15002 ?auto_15005 ) ) ( not ( = ?auto_15002 ?auto_15006 ) ) ( not ( = ?auto_15004 ?auto_15005 ) ) ( not ( = ?auto_15004 ?auto_15006 ) ) ( not ( = ?auto_15005 ?auto_15006 ) ) ( ON ?auto_15005 ?auto_15002 ) ( ON-TABLE ?auto_15004 ) ( CLEAR ?auto_15003 ) ( ON-TABLE ?auto_15003 ) ( not ( = ?auto_15003 ?auto_15006 ) ) ( not ( = ?auto_15002 ?auto_15003 ) ) ( not ( = ?auto_15004 ?auto_15003 ) ) ( not ( = ?auto_15005 ?auto_15003 ) ) ( ON ?auto_15006 ?auto_15005 ) ( CLEAR ?auto_15006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15004 ?auto_15002 ?auto_15005 )
      ( MAKE-1PILE ?auto_15002 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15007 - BLOCK
    )
    :vars
    (
      ?auto_15011 - BLOCK
      ?auto_15009 - BLOCK
      ?auto_15010 - BLOCK
      ?auto_15008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15007 ?auto_15011 ) ( not ( = ?auto_15007 ?auto_15011 ) ) ( not ( = ?auto_15007 ?auto_15009 ) ) ( not ( = ?auto_15007 ?auto_15010 ) ) ( not ( = ?auto_15011 ?auto_15009 ) ) ( not ( = ?auto_15011 ?auto_15010 ) ) ( not ( = ?auto_15009 ?auto_15010 ) ) ( ON ?auto_15009 ?auto_15007 ) ( ON-TABLE ?auto_15011 ) ( not ( = ?auto_15008 ?auto_15010 ) ) ( not ( = ?auto_15007 ?auto_15008 ) ) ( not ( = ?auto_15011 ?auto_15008 ) ) ( not ( = ?auto_15009 ?auto_15008 ) ) ( ON ?auto_15010 ?auto_15009 ) ( CLEAR ?auto_15010 ) ( HOLDING ?auto_15008 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15008 )
      ( MAKE-1PILE ?auto_15007 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15012 - BLOCK
    )
    :vars
    (
      ?auto_15016 - BLOCK
      ?auto_15015 - BLOCK
      ?auto_15013 - BLOCK
      ?auto_15014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15012 ?auto_15016 ) ( not ( = ?auto_15012 ?auto_15016 ) ) ( not ( = ?auto_15012 ?auto_15015 ) ) ( not ( = ?auto_15012 ?auto_15013 ) ) ( not ( = ?auto_15016 ?auto_15015 ) ) ( not ( = ?auto_15016 ?auto_15013 ) ) ( not ( = ?auto_15015 ?auto_15013 ) ) ( ON ?auto_15015 ?auto_15012 ) ( ON-TABLE ?auto_15016 ) ( not ( = ?auto_15014 ?auto_15013 ) ) ( not ( = ?auto_15012 ?auto_15014 ) ) ( not ( = ?auto_15016 ?auto_15014 ) ) ( not ( = ?auto_15015 ?auto_15014 ) ) ( ON ?auto_15013 ?auto_15015 ) ( ON ?auto_15014 ?auto_15013 ) ( CLEAR ?auto_15014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15016 ?auto_15012 ?auto_15015 ?auto_15013 )
      ( MAKE-1PILE ?auto_15012 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15022 - BLOCK
      ?auto_15023 - BLOCK
    )
    :vars
    (
      ?auto_15024 - BLOCK
      ?auto_15025 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15024 ?auto_15023 ) ( CLEAR ?auto_15024 ) ( ON-TABLE ?auto_15022 ) ( ON ?auto_15023 ?auto_15022 ) ( not ( = ?auto_15022 ?auto_15023 ) ) ( not ( = ?auto_15022 ?auto_15024 ) ) ( not ( = ?auto_15023 ?auto_15024 ) ) ( HOLDING ?auto_15025 ) ( not ( = ?auto_15022 ?auto_15025 ) ) ( not ( = ?auto_15023 ?auto_15025 ) ) ( not ( = ?auto_15024 ?auto_15025 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_15025 )
      ( MAKE-2PILE ?auto_15022 ?auto_15023 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15059 - BLOCK
      ?auto_15060 - BLOCK
    )
    :vars
    (
      ?auto_15061 - BLOCK
      ?auto_15062 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15059 ?auto_15060 ) ) ( ON ?auto_15060 ?auto_15061 ) ( not ( = ?auto_15059 ?auto_15061 ) ) ( not ( = ?auto_15060 ?auto_15061 ) ) ( ON ?auto_15059 ?auto_15060 ) ( CLEAR ?auto_15059 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15062 ) ( ON ?auto_15061 ?auto_15062 ) ( not ( = ?auto_15062 ?auto_15061 ) ) ( not ( = ?auto_15062 ?auto_15060 ) ) ( not ( = ?auto_15062 ?auto_15059 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15062 ?auto_15061 ?auto_15060 )
      ( MAKE-2PILE ?auto_15059 ?auto_15060 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15065 - BLOCK
      ?auto_15066 - BLOCK
    )
    :vars
    (
      ?auto_15067 - BLOCK
      ?auto_15068 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15065 ?auto_15066 ) ) ( ON ?auto_15066 ?auto_15067 ) ( CLEAR ?auto_15066 ) ( not ( = ?auto_15065 ?auto_15067 ) ) ( not ( = ?auto_15066 ?auto_15067 ) ) ( ON ?auto_15065 ?auto_15068 ) ( CLEAR ?auto_15065 ) ( HAND-EMPTY ) ( not ( = ?auto_15065 ?auto_15068 ) ) ( not ( = ?auto_15066 ?auto_15068 ) ) ( not ( = ?auto_15067 ?auto_15068 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15065 ?auto_15068 )
      ( MAKE-2PILE ?auto_15065 ?auto_15066 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15069 - BLOCK
      ?auto_15070 - BLOCK
    )
    :vars
    (
      ?auto_15072 - BLOCK
      ?auto_15071 - BLOCK
      ?auto_15073 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15069 ?auto_15070 ) ) ( not ( = ?auto_15069 ?auto_15072 ) ) ( not ( = ?auto_15070 ?auto_15072 ) ) ( ON ?auto_15069 ?auto_15071 ) ( CLEAR ?auto_15069 ) ( not ( = ?auto_15069 ?auto_15071 ) ) ( not ( = ?auto_15070 ?auto_15071 ) ) ( not ( = ?auto_15072 ?auto_15071 ) ) ( HOLDING ?auto_15070 ) ( CLEAR ?auto_15072 ) ( ON-TABLE ?auto_15073 ) ( ON ?auto_15072 ?auto_15073 ) ( not ( = ?auto_15073 ?auto_15072 ) ) ( not ( = ?auto_15073 ?auto_15070 ) ) ( not ( = ?auto_15069 ?auto_15073 ) ) ( not ( = ?auto_15071 ?auto_15073 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15073 ?auto_15072 ?auto_15070 )
      ( MAKE-2PILE ?auto_15069 ?auto_15070 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15074 - BLOCK
      ?auto_15075 - BLOCK
    )
    :vars
    (
      ?auto_15076 - BLOCK
      ?auto_15077 - BLOCK
      ?auto_15078 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15074 ?auto_15075 ) ) ( not ( = ?auto_15074 ?auto_15076 ) ) ( not ( = ?auto_15075 ?auto_15076 ) ) ( ON ?auto_15074 ?auto_15077 ) ( not ( = ?auto_15074 ?auto_15077 ) ) ( not ( = ?auto_15075 ?auto_15077 ) ) ( not ( = ?auto_15076 ?auto_15077 ) ) ( CLEAR ?auto_15076 ) ( ON-TABLE ?auto_15078 ) ( ON ?auto_15076 ?auto_15078 ) ( not ( = ?auto_15078 ?auto_15076 ) ) ( not ( = ?auto_15078 ?auto_15075 ) ) ( not ( = ?auto_15074 ?auto_15078 ) ) ( not ( = ?auto_15077 ?auto_15078 ) ) ( ON ?auto_15075 ?auto_15074 ) ( CLEAR ?auto_15075 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15077 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15077 ?auto_15074 )
      ( MAKE-2PILE ?auto_15074 ?auto_15075 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15079 - BLOCK
      ?auto_15080 - BLOCK
    )
    :vars
    (
      ?auto_15081 - BLOCK
      ?auto_15082 - BLOCK
      ?auto_15083 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15079 ?auto_15080 ) ) ( not ( = ?auto_15079 ?auto_15081 ) ) ( not ( = ?auto_15080 ?auto_15081 ) ) ( ON ?auto_15079 ?auto_15082 ) ( not ( = ?auto_15079 ?auto_15082 ) ) ( not ( = ?auto_15080 ?auto_15082 ) ) ( not ( = ?auto_15081 ?auto_15082 ) ) ( ON-TABLE ?auto_15083 ) ( not ( = ?auto_15083 ?auto_15081 ) ) ( not ( = ?auto_15083 ?auto_15080 ) ) ( not ( = ?auto_15079 ?auto_15083 ) ) ( not ( = ?auto_15082 ?auto_15083 ) ) ( ON ?auto_15080 ?auto_15079 ) ( CLEAR ?auto_15080 ) ( ON-TABLE ?auto_15082 ) ( HOLDING ?auto_15081 ) ( CLEAR ?auto_15083 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15083 ?auto_15081 )
      ( MAKE-2PILE ?auto_15079 ?auto_15080 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15084 - BLOCK
      ?auto_15085 - BLOCK
    )
    :vars
    (
      ?auto_15088 - BLOCK
      ?auto_15087 - BLOCK
      ?auto_15086 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15084 ?auto_15085 ) ) ( not ( = ?auto_15084 ?auto_15088 ) ) ( not ( = ?auto_15085 ?auto_15088 ) ) ( ON ?auto_15084 ?auto_15087 ) ( not ( = ?auto_15084 ?auto_15087 ) ) ( not ( = ?auto_15085 ?auto_15087 ) ) ( not ( = ?auto_15088 ?auto_15087 ) ) ( ON-TABLE ?auto_15086 ) ( not ( = ?auto_15086 ?auto_15088 ) ) ( not ( = ?auto_15086 ?auto_15085 ) ) ( not ( = ?auto_15084 ?auto_15086 ) ) ( not ( = ?auto_15087 ?auto_15086 ) ) ( ON ?auto_15085 ?auto_15084 ) ( ON-TABLE ?auto_15087 ) ( CLEAR ?auto_15086 ) ( ON ?auto_15088 ?auto_15085 ) ( CLEAR ?auto_15088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15087 ?auto_15084 ?auto_15085 )
      ( MAKE-2PILE ?auto_15084 ?auto_15085 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15089 - BLOCK
      ?auto_15090 - BLOCK
    )
    :vars
    (
      ?auto_15093 - BLOCK
      ?auto_15092 - BLOCK
      ?auto_15091 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15089 ?auto_15090 ) ) ( not ( = ?auto_15089 ?auto_15093 ) ) ( not ( = ?auto_15090 ?auto_15093 ) ) ( ON ?auto_15089 ?auto_15092 ) ( not ( = ?auto_15089 ?auto_15092 ) ) ( not ( = ?auto_15090 ?auto_15092 ) ) ( not ( = ?auto_15093 ?auto_15092 ) ) ( not ( = ?auto_15091 ?auto_15093 ) ) ( not ( = ?auto_15091 ?auto_15090 ) ) ( not ( = ?auto_15089 ?auto_15091 ) ) ( not ( = ?auto_15092 ?auto_15091 ) ) ( ON ?auto_15090 ?auto_15089 ) ( ON-TABLE ?auto_15092 ) ( ON ?auto_15093 ?auto_15090 ) ( CLEAR ?auto_15093 ) ( HOLDING ?auto_15091 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15091 )
      ( MAKE-2PILE ?auto_15089 ?auto_15090 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15094 - BLOCK
      ?auto_15095 - BLOCK
    )
    :vars
    (
      ?auto_15098 - BLOCK
      ?auto_15096 - BLOCK
      ?auto_15097 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15094 ?auto_15095 ) ) ( not ( = ?auto_15094 ?auto_15098 ) ) ( not ( = ?auto_15095 ?auto_15098 ) ) ( ON ?auto_15094 ?auto_15096 ) ( not ( = ?auto_15094 ?auto_15096 ) ) ( not ( = ?auto_15095 ?auto_15096 ) ) ( not ( = ?auto_15098 ?auto_15096 ) ) ( not ( = ?auto_15097 ?auto_15098 ) ) ( not ( = ?auto_15097 ?auto_15095 ) ) ( not ( = ?auto_15094 ?auto_15097 ) ) ( not ( = ?auto_15096 ?auto_15097 ) ) ( ON ?auto_15095 ?auto_15094 ) ( ON-TABLE ?auto_15096 ) ( ON ?auto_15098 ?auto_15095 ) ( ON ?auto_15097 ?auto_15098 ) ( CLEAR ?auto_15097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15096 ?auto_15094 ?auto_15095 ?auto_15098 )
      ( MAKE-2PILE ?auto_15094 ?auto_15095 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15110 - BLOCK
    )
    :vars
    (
      ?auto_15112 - BLOCK
      ?auto_15111 - BLOCK
      ?auto_15113 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15112 ?auto_15110 ) ( ON-TABLE ?auto_15110 ) ( not ( = ?auto_15110 ?auto_15112 ) ) ( not ( = ?auto_15110 ?auto_15111 ) ) ( not ( = ?auto_15110 ?auto_15113 ) ) ( not ( = ?auto_15112 ?auto_15111 ) ) ( not ( = ?auto_15112 ?auto_15113 ) ) ( not ( = ?auto_15111 ?auto_15113 ) ) ( ON ?auto_15111 ?auto_15112 ) ( CLEAR ?auto_15111 ) ( HOLDING ?auto_15113 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15113 )
      ( MAKE-1PILE ?auto_15110 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15143 - BLOCK
      ?auto_15144 - BLOCK
      ?auto_15145 - BLOCK
    )
    :vars
    (
      ?auto_15146 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15143 ) ( not ( = ?auto_15143 ?auto_15144 ) ) ( not ( = ?auto_15143 ?auto_15145 ) ) ( not ( = ?auto_15144 ?auto_15145 ) ) ( ON ?auto_15145 ?auto_15146 ) ( not ( = ?auto_15143 ?auto_15146 ) ) ( not ( = ?auto_15144 ?auto_15146 ) ) ( not ( = ?auto_15145 ?auto_15146 ) ) ( CLEAR ?auto_15143 ) ( ON ?auto_15144 ?auto_15145 ) ( CLEAR ?auto_15144 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15146 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15146 ?auto_15145 )
      ( MAKE-3PILE ?auto_15143 ?auto_15144 ?auto_15145 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15147 - BLOCK
      ?auto_15148 - BLOCK
      ?auto_15149 - BLOCK
    )
    :vars
    (
      ?auto_15150 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15147 ?auto_15148 ) ) ( not ( = ?auto_15147 ?auto_15149 ) ) ( not ( = ?auto_15148 ?auto_15149 ) ) ( ON ?auto_15149 ?auto_15150 ) ( not ( = ?auto_15147 ?auto_15150 ) ) ( not ( = ?auto_15148 ?auto_15150 ) ) ( not ( = ?auto_15149 ?auto_15150 ) ) ( ON ?auto_15148 ?auto_15149 ) ( CLEAR ?auto_15148 ) ( ON-TABLE ?auto_15150 ) ( HOLDING ?auto_15147 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15147 )
      ( MAKE-3PILE ?auto_15147 ?auto_15148 ?auto_15149 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15151 - BLOCK
      ?auto_15152 - BLOCK
      ?auto_15153 - BLOCK
    )
    :vars
    (
      ?auto_15154 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15151 ?auto_15152 ) ) ( not ( = ?auto_15151 ?auto_15153 ) ) ( not ( = ?auto_15152 ?auto_15153 ) ) ( ON ?auto_15153 ?auto_15154 ) ( not ( = ?auto_15151 ?auto_15154 ) ) ( not ( = ?auto_15152 ?auto_15154 ) ) ( not ( = ?auto_15153 ?auto_15154 ) ) ( ON ?auto_15152 ?auto_15153 ) ( ON-TABLE ?auto_15154 ) ( ON ?auto_15151 ?auto_15152 ) ( CLEAR ?auto_15151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15154 ?auto_15153 ?auto_15152 )
      ( MAKE-3PILE ?auto_15151 ?auto_15152 ?auto_15153 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15158 - BLOCK
      ?auto_15159 - BLOCK
      ?auto_15160 - BLOCK
    )
    :vars
    (
      ?auto_15161 - BLOCK
      ?auto_15162 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15158 ?auto_15159 ) ) ( not ( = ?auto_15158 ?auto_15160 ) ) ( not ( = ?auto_15159 ?auto_15160 ) ) ( ON ?auto_15160 ?auto_15161 ) ( not ( = ?auto_15158 ?auto_15161 ) ) ( not ( = ?auto_15159 ?auto_15161 ) ) ( not ( = ?auto_15160 ?auto_15161 ) ) ( ON ?auto_15159 ?auto_15160 ) ( CLEAR ?auto_15159 ) ( ON-TABLE ?auto_15161 ) ( ON ?auto_15158 ?auto_15162 ) ( CLEAR ?auto_15158 ) ( HAND-EMPTY ) ( not ( = ?auto_15158 ?auto_15162 ) ) ( not ( = ?auto_15159 ?auto_15162 ) ) ( not ( = ?auto_15160 ?auto_15162 ) ) ( not ( = ?auto_15161 ?auto_15162 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15158 ?auto_15162 )
      ( MAKE-3PILE ?auto_15158 ?auto_15159 ?auto_15160 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15163 - BLOCK
      ?auto_15164 - BLOCK
      ?auto_15165 - BLOCK
    )
    :vars
    (
      ?auto_15167 - BLOCK
      ?auto_15166 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15163 ?auto_15164 ) ) ( not ( = ?auto_15163 ?auto_15165 ) ) ( not ( = ?auto_15164 ?auto_15165 ) ) ( ON ?auto_15165 ?auto_15167 ) ( not ( = ?auto_15163 ?auto_15167 ) ) ( not ( = ?auto_15164 ?auto_15167 ) ) ( not ( = ?auto_15165 ?auto_15167 ) ) ( ON-TABLE ?auto_15167 ) ( ON ?auto_15163 ?auto_15166 ) ( CLEAR ?auto_15163 ) ( not ( = ?auto_15163 ?auto_15166 ) ) ( not ( = ?auto_15164 ?auto_15166 ) ) ( not ( = ?auto_15165 ?auto_15166 ) ) ( not ( = ?auto_15167 ?auto_15166 ) ) ( HOLDING ?auto_15164 ) ( CLEAR ?auto_15165 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15167 ?auto_15165 ?auto_15164 )
      ( MAKE-3PILE ?auto_15163 ?auto_15164 ?auto_15165 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15168 - BLOCK
      ?auto_15169 - BLOCK
      ?auto_15170 - BLOCK
    )
    :vars
    (
      ?auto_15172 - BLOCK
      ?auto_15171 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15168 ?auto_15169 ) ) ( not ( = ?auto_15168 ?auto_15170 ) ) ( not ( = ?auto_15169 ?auto_15170 ) ) ( ON ?auto_15170 ?auto_15172 ) ( not ( = ?auto_15168 ?auto_15172 ) ) ( not ( = ?auto_15169 ?auto_15172 ) ) ( not ( = ?auto_15170 ?auto_15172 ) ) ( ON-TABLE ?auto_15172 ) ( ON ?auto_15168 ?auto_15171 ) ( not ( = ?auto_15168 ?auto_15171 ) ) ( not ( = ?auto_15169 ?auto_15171 ) ) ( not ( = ?auto_15170 ?auto_15171 ) ) ( not ( = ?auto_15172 ?auto_15171 ) ) ( CLEAR ?auto_15170 ) ( ON ?auto_15169 ?auto_15168 ) ( CLEAR ?auto_15169 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15171 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15171 ?auto_15168 )
      ( MAKE-3PILE ?auto_15168 ?auto_15169 ?auto_15170 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15173 - BLOCK
      ?auto_15174 - BLOCK
      ?auto_15175 - BLOCK
    )
    :vars
    (
      ?auto_15176 - BLOCK
      ?auto_15177 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15173 ?auto_15174 ) ) ( not ( = ?auto_15173 ?auto_15175 ) ) ( not ( = ?auto_15174 ?auto_15175 ) ) ( not ( = ?auto_15173 ?auto_15176 ) ) ( not ( = ?auto_15174 ?auto_15176 ) ) ( not ( = ?auto_15175 ?auto_15176 ) ) ( ON-TABLE ?auto_15176 ) ( ON ?auto_15173 ?auto_15177 ) ( not ( = ?auto_15173 ?auto_15177 ) ) ( not ( = ?auto_15174 ?auto_15177 ) ) ( not ( = ?auto_15175 ?auto_15177 ) ) ( not ( = ?auto_15176 ?auto_15177 ) ) ( ON ?auto_15174 ?auto_15173 ) ( CLEAR ?auto_15174 ) ( ON-TABLE ?auto_15177 ) ( HOLDING ?auto_15175 ) ( CLEAR ?auto_15176 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15176 ?auto_15175 )
      ( MAKE-3PILE ?auto_15173 ?auto_15174 ?auto_15175 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15178 - BLOCK
      ?auto_15179 - BLOCK
      ?auto_15180 - BLOCK
    )
    :vars
    (
      ?auto_15181 - BLOCK
      ?auto_15182 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15178 ?auto_15179 ) ) ( not ( = ?auto_15178 ?auto_15180 ) ) ( not ( = ?auto_15179 ?auto_15180 ) ) ( not ( = ?auto_15178 ?auto_15181 ) ) ( not ( = ?auto_15179 ?auto_15181 ) ) ( not ( = ?auto_15180 ?auto_15181 ) ) ( ON-TABLE ?auto_15181 ) ( ON ?auto_15178 ?auto_15182 ) ( not ( = ?auto_15178 ?auto_15182 ) ) ( not ( = ?auto_15179 ?auto_15182 ) ) ( not ( = ?auto_15180 ?auto_15182 ) ) ( not ( = ?auto_15181 ?auto_15182 ) ) ( ON ?auto_15179 ?auto_15178 ) ( ON-TABLE ?auto_15182 ) ( CLEAR ?auto_15181 ) ( ON ?auto_15180 ?auto_15179 ) ( CLEAR ?auto_15180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15182 ?auto_15178 ?auto_15179 )
      ( MAKE-3PILE ?auto_15178 ?auto_15179 ?auto_15180 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15183 - BLOCK
      ?auto_15184 - BLOCK
      ?auto_15185 - BLOCK
    )
    :vars
    (
      ?auto_15186 - BLOCK
      ?auto_15187 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15183 ?auto_15184 ) ) ( not ( = ?auto_15183 ?auto_15185 ) ) ( not ( = ?auto_15184 ?auto_15185 ) ) ( not ( = ?auto_15183 ?auto_15186 ) ) ( not ( = ?auto_15184 ?auto_15186 ) ) ( not ( = ?auto_15185 ?auto_15186 ) ) ( ON ?auto_15183 ?auto_15187 ) ( not ( = ?auto_15183 ?auto_15187 ) ) ( not ( = ?auto_15184 ?auto_15187 ) ) ( not ( = ?auto_15185 ?auto_15187 ) ) ( not ( = ?auto_15186 ?auto_15187 ) ) ( ON ?auto_15184 ?auto_15183 ) ( ON-TABLE ?auto_15187 ) ( ON ?auto_15185 ?auto_15184 ) ( CLEAR ?auto_15185 ) ( HOLDING ?auto_15186 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15186 )
      ( MAKE-3PILE ?auto_15183 ?auto_15184 ?auto_15185 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15188 - BLOCK
      ?auto_15189 - BLOCK
      ?auto_15190 - BLOCK
    )
    :vars
    (
      ?auto_15191 - BLOCK
      ?auto_15192 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15188 ?auto_15189 ) ) ( not ( = ?auto_15188 ?auto_15190 ) ) ( not ( = ?auto_15189 ?auto_15190 ) ) ( not ( = ?auto_15188 ?auto_15191 ) ) ( not ( = ?auto_15189 ?auto_15191 ) ) ( not ( = ?auto_15190 ?auto_15191 ) ) ( ON ?auto_15188 ?auto_15192 ) ( not ( = ?auto_15188 ?auto_15192 ) ) ( not ( = ?auto_15189 ?auto_15192 ) ) ( not ( = ?auto_15190 ?auto_15192 ) ) ( not ( = ?auto_15191 ?auto_15192 ) ) ( ON ?auto_15189 ?auto_15188 ) ( ON-TABLE ?auto_15192 ) ( ON ?auto_15190 ?auto_15189 ) ( ON ?auto_15191 ?auto_15190 ) ( CLEAR ?auto_15191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15192 ?auto_15188 ?auto_15189 ?auto_15190 )
      ( MAKE-3PILE ?auto_15188 ?auto_15189 ?auto_15190 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15201 - BLOCK
      ?auto_15202 - BLOCK
      ?auto_15203 - BLOCK
      ?auto_15204 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_15203 ) ( ON-TABLE ?auto_15201 ) ( ON ?auto_15202 ?auto_15201 ) ( ON ?auto_15203 ?auto_15202 ) ( not ( = ?auto_15201 ?auto_15202 ) ) ( not ( = ?auto_15201 ?auto_15203 ) ) ( not ( = ?auto_15201 ?auto_15204 ) ) ( not ( = ?auto_15202 ?auto_15203 ) ) ( not ( = ?auto_15202 ?auto_15204 ) ) ( not ( = ?auto_15203 ?auto_15204 ) ) ( ON-TABLE ?auto_15204 ) ( CLEAR ?auto_15204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_15204 )
      ( MAKE-4PILE ?auto_15201 ?auto_15202 ?auto_15203 ?auto_15204 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15205 - BLOCK
      ?auto_15206 - BLOCK
      ?auto_15207 - BLOCK
      ?auto_15208 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15205 ) ( ON ?auto_15206 ?auto_15205 ) ( not ( = ?auto_15205 ?auto_15206 ) ) ( not ( = ?auto_15205 ?auto_15207 ) ) ( not ( = ?auto_15205 ?auto_15208 ) ) ( not ( = ?auto_15206 ?auto_15207 ) ) ( not ( = ?auto_15206 ?auto_15208 ) ) ( not ( = ?auto_15207 ?auto_15208 ) ) ( ON-TABLE ?auto_15208 ) ( CLEAR ?auto_15208 ) ( HOLDING ?auto_15207 ) ( CLEAR ?auto_15206 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15205 ?auto_15206 ?auto_15207 )
      ( MAKE-4PILE ?auto_15205 ?auto_15206 ?auto_15207 ?auto_15208 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15209 - BLOCK
      ?auto_15210 - BLOCK
      ?auto_15211 - BLOCK
      ?auto_15212 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15209 ) ( ON ?auto_15210 ?auto_15209 ) ( not ( = ?auto_15209 ?auto_15210 ) ) ( not ( = ?auto_15209 ?auto_15211 ) ) ( not ( = ?auto_15209 ?auto_15212 ) ) ( not ( = ?auto_15210 ?auto_15211 ) ) ( not ( = ?auto_15210 ?auto_15212 ) ) ( not ( = ?auto_15211 ?auto_15212 ) ) ( ON-TABLE ?auto_15212 ) ( CLEAR ?auto_15210 ) ( ON ?auto_15211 ?auto_15212 ) ( CLEAR ?auto_15211 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15212 )
      ( MAKE-4PILE ?auto_15209 ?auto_15210 ?auto_15211 ?auto_15212 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15213 - BLOCK
      ?auto_15214 - BLOCK
      ?auto_15215 - BLOCK
      ?auto_15216 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15213 ) ( not ( = ?auto_15213 ?auto_15214 ) ) ( not ( = ?auto_15213 ?auto_15215 ) ) ( not ( = ?auto_15213 ?auto_15216 ) ) ( not ( = ?auto_15214 ?auto_15215 ) ) ( not ( = ?auto_15214 ?auto_15216 ) ) ( not ( = ?auto_15215 ?auto_15216 ) ) ( ON-TABLE ?auto_15216 ) ( ON ?auto_15215 ?auto_15216 ) ( CLEAR ?auto_15215 ) ( HOLDING ?auto_15214 ) ( CLEAR ?auto_15213 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15213 ?auto_15214 )
      ( MAKE-4PILE ?auto_15213 ?auto_15214 ?auto_15215 ?auto_15216 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15217 - BLOCK
      ?auto_15218 - BLOCK
      ?auto_15219 - BLOCK
      ?auto_15220 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15217 ) ( not ( = ?auto_15217 ?auto_15218 ) ) ( not ( = ?auto_15217 ?auto_15219 ) ) ( not ( = ?auto_15217 ?auto_15220 ) ) ( not ( = ?auto_15218 ?auto_15219 ) ) ( not ( = ?auto_15218 ?auto_15220 ) ) ( not ( = ?auto_15219 ?auto_15220 ) ) ( ON-TABLE ?auto_15220 ) ( ON ?auto_15219 ?auto_15220 ) ( CLEAR ?auto_15217 ) ( ON ?auto_15218 ?auto_15219 ) ( CLEAR ?auto_15218 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15220 ?auto_15219 )
      ( MAKE-4PILE ?auto_15217 ?auto_15218 ?auto_15219 ?auto_15220 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15221 - BLOCK
      ?auto_15222 - BLOCK
      ?auto_15223 - BLOCK
      ?auto_15224 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15221 ?auto_15222 ) ) ( not ( = ?auto_15221 ?auto_15223 ) ) ( not ( = ?auto_15221 ?auto_15224 ) ) ( not ( = ?auto_15222 ?auto_15223 ) ) ( not ( = ?auto_15222 ?auto_15224 ) ) ( not ( = ?auto_15223 ?auto_15224 ) ) ( ON-TABLE ?auto_15224 ) ( ON ?auto_15223 ?auto_15224 ) ( ON ?auto_15222 ?auto_15223 ) ( CLEAR ?auto_15222 ) ( HOLDING ?auto_15221 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15221 )
      ( MAKE-4PILE ?auto_15221 ?auto_15222 ?auto_15223 ?auto_15224 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15225 - BLOCK
      ?auto_15226 - BLOCK
      ?auto_15227 - BLOCK
      ?auto_15228 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15225 ?auto_15226 ) ) ( not ( = ?auto_15225 ?auto_15227 ) ) ( not ( = ?auto_15225 ?auto_15228 ) ) ( not ( = ?auto_15226 ?auto_15227 ) ) ( not ( = ?auto_15226 ?auto_15228 ) ) ( not ( = ?auto_15227 ?auto_15228 ) ) ( ON-TABLE ?auto_15228 ) ( ON ?auto_15227 ?auto_15228 ) ( ON ?auto_15226 ?auto_15227 ) ( ON ?auto_15225 ?auto_15226 ) ( CLEAR ?auto_15225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15228 ?auto_15227 ?auto_15226 )
      ( MAKE-4PILE ?auto_15225 ?auto_15226 ?auto_15227 ?auto_15228 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15233 - BLOCK
      ?auto_15234 - BLOCK
      ?auto_15235 - BLOCK
      ?auto_15236 - BLOCK
    )
    :vars
    (
      ?auto_15237 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15233 ?auto_15234 ) ) ( not ( = ?auto_15233 ?auto_15235 ) ) ( not ( = ?auto_15233 ?auto_15236 ) ) ( not ( = ?auto_15234 ?auto_15235 ) ) ( not ( = ?auto_15234 ?auto_15236 ) ) ( not ( = ?auto_15235 ?auto_15236 ) ) ( ON-TABLE ?auto_15236 ) ( ON ?auto_15235 ?auto_15236 ) ( ON ?auto_15234 ?auto_15235 ) ( CLEAR ?auto_15234 ) ( ON ?auto_15233 ?auto_15237 ) ( CLEAR ?auto_15233 ) ( HAND-EMPTY ) ( not ( = ?auto_15233 ?auto_15237 ) ) ( not ( = ?auto_15234 ?auto_15237 ) ) ( not ( = ?auto_15235 ?auto_15237 ) ) ( not ( = ?auto_15236 ?auto_15237 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15233 ?auto_15237 )
      ( MAKE-4PILE ?auto_15233 ?auto_15234 ?auto_15235 ?auto_15236 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15238 - BLOCK
      ?auto_15239 - BLOCK
      ?auto_15240 - BLOCK
      ?auto_15241 - BLOCK
    )
    :vars
    (
      ?auto_15242 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15238 ?auto_15239 ) ) ( not ( = ?auto_15238 ?auto_15240 ) ) ( not ( = ?auto_15238 ?auto_15241 ) ) ( not ( = ?auto_15239 ?auto_15240 ) ) ( not ( = ?auto_15239 ?auto_15241 ) ) ( not ( = ?auto_15240 ?auto_15241 ) ) ( ON-TABLE ?auto_15241 ) ( ON ?auto_15240 ?auto_15241 ) ( ON ?auto_15238 ?auto_15242 ) ( CLEAR ?auto_15238 ) ( not ( = ?auto_15238 ?auto_15242 ) ) ( not ( = ?auto_15239 ?auto_15242 ) ) ( not ( = ?auto_15240 ?auto_15242 ) ) ( not ( = ?auto_15241 ?auto_15242 ) ) ( HOLDING ?auto_15239 ) ( CLEAR ?auto_15240 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15241 ?auto_15240 ?auto_15239 )
      ( MAKE-4PILE ?auto_15238 ?auto_15239 ?auto_15240 ?auto_15241 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15243 - BLOCK
      ?auto_15244 - BLOCK
      ?auto_15245 - BLOCK
      ?auto_15246 - BLOCK
    )
    :vars
    (
      ?auto_15247 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15243 ?auto_15244 ) ) ( not ( = ?auto_15243 ?auto_15245 ) ) ( not ( = ?auto_15243 ?auto_15246 ) ) ( not ( = ?auto_15244 ?auto_15245 ) ) ( not ( = ?auto_15244 ?auto_15246 ) ) ( not ( = ?auto_15245 ?auto_15246 ) ) ( ON-TABLE ?auto_15246 ) ( ON ?auto_15245 ?auto_15246 ) ( ON ?auto_15243 ?auto_15247 ) ( not ( = ?auto_15243 ?auto_15247 ) ) ( not ( = ?auto_15244 ?auto_15247 ) ) ( not ( = ?auto_15245 ?auto_15247 ) ) ( not ( = ?auto_15246 ?auto_15247 ) ) ( CLEAR ?auto_15245 ) ( ON ?auto_15244 ?auto_15243 ) ( CLEAR ?auto_15244 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15247 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15247 ?auto_15243 )
      ( MAKE-4PILE ?auto_15243 ?auto_15244 ?auto_15245 ?auto_15246 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15248 - BLOCK
      ?auto_15249 - BLOCK
      ?auto_15250 - BLOCK
      ?auto_15251 - BLOCK
    )
    :vars
    (
      ?auto_15252 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15248 ?auto_15249 ) ) ( not ( = ?auto_15248 ?auto_15250 ) ) ( not ( = ?auto_15248 ?auto_15251 ) ) ( not ( = ?auto_15249 ?auto_15250 ) ) ( not ( = ?auto_15249 ?auto_15251 ) ) ( not ( = ?auto_15250 ?auto_15251 ) ) ( ON-TABLE ?auto_15251 ) ( ON ?auto_15248 ?auto_15252 ) ( not ( = ?auto_15248 ?auto_15252 ) ) ( not ( = ?auto_15249 ?auto_15252 ) ) ( not ( = ?auto_15250 ?auto_15252 ) ) ( not ( = ?auto_15251 ?auto_15252 ) ) ( ON ?auto_15249 ?auto_15248 ) ( CLEAR ?auto_15249 ) ( ON-TABLE ?auto_15252 ) ( HOLDING ?auto_15250 ) ( CLEAR ?auto_15251 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15251 ?auto_15250 )
      ( MAKE-4PILE ?auto_15248 ?auto_15249 ?auto_15250 ?auto_15251 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15253 - BLOCK
      ?auto_15254 - BLOCK
      ?auto_15255 - BLOCK
      ?auto_15256 - BLOCK
    )
    :vars
    (
      ?auto_15257 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15253 ?auto_15254 ) ) ( not ( = ?auto_15253 ?auto_15255 ) ) ( not ( = ?auto_15253 ?auto_15256 ) ) ( not ( = ?auto_15254 ?auto_15255 ) ) ( not ( = ?auto_15254 ?auto_15256 ) ) ( not ( = ?auto_15255 ?auto_15256 ) ) ( ON-TABLE ?auto_15256 ) ( ON ?auto_15253 ?auto_15257 ) ( not ( = ?auto_15253 ?auto_15257 ) ) ( not ( = ?auto_15254 ?auto_15257 ) ) ( not ( = ?auto_15255 ?auto_15257 ) ) ( not ( = ?auto_15256 ?auto_15257 ) ) ( ON ?auto_15254 ?auto_15253 ) ( ON-TABLE ?auto_15257 ) ( CLEAR ?auto_15256 ) ( ON ?auto_15255 ?auto_15254 ) ( CLEAR ?auto_15255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15257 ?auto_15253 ?auto_15254 )
      ( MAKE-4PILE ?auto_15253 ?auto_15254 ?auto_15255 ?auto_15256 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15258 - BLOCK
      ?auto_15259 - BLOCK
      ?auto_15260 - BLOCK
      ?auto_15261 - BLOCK
    )
    :vars
    (
      ?auto_15262 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15258 ?auto_15259 ) ) ( not ( = ?auto_15258 ?auto_15260 ) ) ( not ( = ?auto_15258 ?auto_15261 ) ) ( not ( = ?auto_15259 ?auto_15260 ) ) ( not ( = ?auto_15259 ?auto_15261 ) ) ( not ( = ?auto_15260 ?auto_15261 ) ) ( ON ?auto_15258 ?auto_15262 ) ( not ( = ?auto_15258 ?auto_15262 ) ) ( not ( = ?auto_15259 ?auto_15262 ) ) ( not ( = ?auto_15260 ?auto_15262 ) ) ( not ( = ?auto_15261 ?auto_15262 ) ) ( ON ?auto_15259 ?auto_15258 ) ( ON-TABLE ?auto_15262 ) ( ON ?auto_15260 ?auto_15259 ) ( CLEAR ?auto_15260 ) ( HOLDING ?auto_15261 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15261 )
      ( MAKE-4PILE ?auto_15258 ?auto_15259 ?auto_15260 ?auto_15261 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15263 - BLOCK
      ?auto_15264 - BLOCK
      ?auto_15265 - BLOCK
      ?auto_15266 - BLOCK
    )
    :vars
    (
      ?auto_15267 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15263 ?auto_15264 ) ) ( not ( = ?auto_15263 ?auto_15265 ) ) ( not ( = ?auto_15263 ?auto_15266 ) ) ( not ( = ?auto_15264 ?auto_15265 ) ) ( not ( = ?auto_15264 ?auto_15266 ) ) ( not ( = ?auto_15265 ?auto_15266 ) ) ( ON ?auto_15263 ?auto_15267 ) ( not ( = ?auto_15263 ?auto_15267 ) ) ( not ( = ?auto_15264 ?auto_15267 ) ) ( not ( = ?auto_15265 ?auto_15267 ) ) ( not ( = ?auto_15266 ?auto_15267 ) ) ( ON ?auto_15264 ?auto_15263 ) ( ON-TABLE ?auto_15267 ) ( ON ?auto_15265 ?auto_15264 ) ( ON ?auto_15266 ?auto_15265 ) ( CLEAR ?auto_15266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15267 ?auto_15263 ?auto_15264 ?auto_15265 )
      ( MAKE-4PILE ?auto_15263 ?auto_15264 ?auto_15265 ?auto_15266 ) )
  )

)

