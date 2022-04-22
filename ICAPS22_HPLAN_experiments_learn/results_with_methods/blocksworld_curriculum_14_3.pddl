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
      ?auto_287776 - BLOCK
    )
    :vars
    (
      ?auto_287777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_287776 ?auto_287777 ) ( CLEAR ?auto_287776 ) ( HAND-EMPTY ) ( not ( = ?auto_287776 ?auto_287777 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_287776 ?auto_287777 )
      ( !PUTDOWN ?auto_287776 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_287779 - BLOCK
    )
    :vars
    (
      ?auto_287780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_287779 ?auto_287780 ) ( CLEAR ?auto_287779 ) ( HAND-EMPTY ) ( not ( = ?auto_287779 ?auto_287780 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_287779 ?auto_287780 )
      ( !PUTDOWN ?auto_287779 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_287783 - BLOCK
      ?auto_287784 - BLOCK
    )
    :vars
    (
      ?auto_287785 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_287783 ) ( ON ?auto_287784 ?auto_287785 ) ( CLEAR ?auto_287784 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_287783 ) ( not ( = ?auto_287783 ?auto_287784 ) ) ( not ( = ?auto_287783 ?auto_287785 ) ) ( not ( = ?auto_287784 ?auto_287785 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_287784 ?auto_287785 )
      ( !STACK ?auto_287784 ?auto_287783 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_287788 - BLOCK
      ?auto_287789 - BLOCK
    )
    :vars
    (
      ?auto_287790 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_287788 ) ( ON ?auto_287789 ?auto_287790 ) ( CLEAR ?auto_287789 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_287788 ) ( not ( = ?auto_287788 ?auto_287789 ) ) ( not ( = ?auto_287788 ?auto_287790 ) ) ( not ( = ?auto_287789 ?auto_287790 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_287789 ?auto_287790 )
      ( !STACK ?auto_287789 ?auto_287788 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_287793 - BLOCK
      ?auto_287794 - BLOCK
    )
    :vars
    (
      ?auto_287795 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_287794 ?auto_287795 ) ( not ( = ?auto_287793 ?auto_287794 ) ) ( not ( = ?auto_287793 ?auto_287795 ) ) ( not ( = ?auto_287794 ?auto_287795 ) ) ( ON ?auto_287793 ?auto_287794 ) ( CLEAR ?auto_287793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_287793 )
      ( MAKE-2PILE ?auto_287793 ?auto_287794 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_287798 - BLOCK
      ?auto_287799 - BLOCK
    )
    :vars
    (
      ?auto_287800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_287799 ?auto_287800 ) ( not ( = ?auto_287798 ?auto_287799 ) ) ( not ( = ?auto_287798 ?auto_287800 ) ) ( not ( = ?auto_287799 ?auto_287800 ) ) ( ON ?auto_287798 ?auto_287799 ) ( CLEAR ?auto_287798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_287798 )
      ( MAKE-2PILE ?auto_287798 ?auto_287799 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_287804 - BLOCK
      ?auto_287805 - BLOCK
      ?auto_287806 - BLOCK
    )
    :vars
    (
      ?auto_287807 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_287805 ) ( ON ?auto_287806 ?auto_287807 ) ( CLEAR ?auto_287806 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_287804 ) ( ON ?auto_287805 ?auto_287804 ) ( not ( = ?auto_287804 ?auto_287805 ) ) ( not ( = ?auto_287804 ?auto_287806 ) ) ( not ( = ?auto_287804 ?auto_287807 ) ) ( not ( = ?auto_287805 ?auto_287806 ) ) ( not ( = ?auto_287805 ?auto_287807 ) ) ( not ( = ?auto_287806 ?auto_287807 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_287806 ?auto_287807 )
      ( !STACK ?auto_287806 ?auto_287805 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_287811 - BLOCK
      ?auto_287812 - BLOCK
      ?auto_287813 - BLOCK
    )
    :vars
    (
      ?auto_287814 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_287812 ) ( ON ?auto_287813 ?auto_287814 ) ( CLEAR ?auto_287813 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_287811 ) ( ON ?auto_287812 ?auto_287811 ) ( not ( = ?auto_287811 ?auto_287812 ) ) ( not ( = ?auto_287811 ?auto_287813 ) ) ( not ( = ?auto_287811 ?auto_287814 ) ) ( not ( = ?auto_287812 ?auto_287813 ) ) ( not ( = ?auto_287812 ?auto_287814 ) ) ( not ( = ?auto_287813 ?auto_287814 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_287813 ?auto_287814 )
      ( !STACK ?auto_287813 ?auto_287812 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_287818 - BLOCK
      ?auto_287819 - BLOCK
      ?auto_287820 - BLOCK
    )
    :vars
    (
      ?auto_287821 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_287820 ?auto_287821 ) ( ON-TABLE ?auto_287818 ) ( not ( = ?auto_287818 ?auto_287819 ) ) ( not ( = ?auto_287818 ?auto_287820 ) ) ( not ( = ?auto_287818 ?auto_287821 ) ) ( not ( = ?auto_287819 ?auto_287820 ) ) ( not ( = ?auto_287819 ?auto_287821 ) ) ( not ( = ?auto_287820 ?auto_287821 ) ) ( CLEAR ?auto_287818 ) ( ON ?auto_287819 ?auto_287820 ) ( CLEAR ?auto_287819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_287818 ?auto_287819 )
      ( MAKE-3PILE ?auto_287818 ?auto_287819 ?auto_287820 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_287825 - BLOCK
      ?auto_287826 - BLOCK
      ?auto_287827 - BLOCK
    )
    :vars
    (
      ?auto_287828 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_287827 ?auto_287828 ) ( ON-TABLE ?auto_287825 ) ( not ( = ?auto_287825 ?auto_287826 ) ) ( not ( = ?auto_287825 ?auto_287827 ) ) ( not ( = ?auto_287825 ?auto_287828 ) ) ( not ( = ?auto_287826 ?auto_287827 ) ) ( not ( = ?auto_287826 ?auto_287828 ) ) ( not ( = ?auto_287827 ?auto_287828 ) ) ( CLEAR ?auto_287825 ) ( ON ?auto_287826 ?auto_287827 ) ( CLEAR ?auto_287826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_287825 ?auto_287826 )
      ( MAKE-3PILE ?auto_287825 ?auto_287826 ?auto_287827 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_287832 - BLOCK
      ?auto_287833 - BLOCK
      ?auto_287834 - BLOCK
    )
    :vars
    (
      ?auto_287835 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_287834 ?auto_287835 ) ( not ( = ?auto_287832 ?auto_287833 ) ) ( not ( = ?auto_287832 ?auto_287834 ) ) ( not ( = ?auto_287832 ?auto_287835 ) ) ( not ( = ?auto_287833 ?auto_287834 ) ) ( not ( = ?auto_287833 ?auto_287835 ) ) ( not ( = ?auto_287834 ?auto_287835 ) ) ( ON ?auto_287833 ?auto_287834 ) ( ON ?auto_287832 ?auto_287833 ) ( CLEAR ?auto_287832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_287832 )
      ( MAKE-3PILE ?auto_287832 ?auto_287833 ?auto_287834 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_287839 - BLOCK
      ?auto_287840 - BLOCK
      ?auto_287841 - BLOCK
    )
    :vars
    (
      ?auto_287842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_287841 ?auto_287842 ) ( not ( = ?auto_287839 ?auto_287840 ) ) ( not ( = ?auto_287839 ?auto_287841 ) ) ( not ( = ?auto_287839 ?auto_287842 ) ) ( not ( = ?auto_287840 ?auto_287841 ) ) ( not ( = ?auto_287840 ?auto_287842 ) ) ( not ( = ?auto_287841 ?auto_287842 ) ) ( ON ?auto_287840 ?auto_287841 ) ( ON ?auto_287839 ?auto_287840 ) ( CLEAR ?auto_287839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_287839 )
      ( MAKE-3PILE ?auto_287839 ?auto_287840 ?auto_287841 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_287847 - BLOCK
      ?auto_287848 - BLOCK
      ?auto_287849 - BLOCK
      ?auto_287850 - BLOCK
    )
    :vars
    (
      ?auto_287851 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_287849 ) ( ON ?auto_287850 ?auto_287851 ) ( CLEAR ?auto_287850 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_287847 ) ( ON ?auto_287848 ?auto_287847 ) ( ON ?auto_287849 ?auto_287848 ) ( not ( = ?auto_287847 ?auto_287848 ) ) ( not ( = ?auto_287847 ?auto_287849 ) ) ( not ( = ?auto_287847 ?auto_287850 ) ) ( not ( = ?auto_287847 ?auto_287851 ) ) ( not ( = ?auto_287848 ?auto_287849 ) ) ( not ( = ?auto_287848 ?auto_287850 ) ) ( not ( = ?auto_287848 ?auto_287851 ) ) ( not ( = ?auto_287849 ?auto_287850 ) ) ( not ( = ?auto_287849 ?auto_287851 ) ) ( not ( = ?auto_287850 ?auto_287851 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_287850 ?auto_287851 )
      ( !STACK ?auto_287850 ?auto_287849 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_287856 - BLOCK
      ?auto_287857 - BLOCK
      ?auto_287858 - BLOCK
      ?auto_287859 - BLOCK
    )
    :vars
    (
      ?auto_287860 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_287858 ) ( ON ?auto_287859 ?auto_287860 ) ( CLEAR ?auto_287859 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_287856 ) ( ON ?auto_287857 ?auto_287856 ) ( ON ?auto_287858 ?auto_287857 ) ( not ( = ?auto_287856 ?auto_287857 ) ) ( not ( = ?auto_287856 ?auto_287858 ) ) ( not ( = ?auto_287856 ?auto_287859 ) ) ( not ( = ?auto_287856 ?auto_287860 ) ) ( not ( = ?auto_287857 ?auto_287858 ) ) ( not ( = ?auto_287857 ?auto_287859 ) ) ( not ( = ?auto_287857 ?auto_287860 ) ) ( not ( = ?auto_287858 ?auto_287859 ) ) ( not ( = ?auto_287858 ?auto_287860 ) ) ( not ( = ?auto_287859 ?auto_287860 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_287859 ?auto_287860 )
      ( !STACK ?auto_287859 ?auto_287858 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_287865 - BLOCK
      ?auto_287866 - BLOCK
      ?auto_287867 - BLOCK
      ?auto_287868 - BLOCK
    )
    :vars
    (
      ?auto_287869 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_287868 ?auto_287869 ) ( ON-TABLE ?auto_287865 ) ( ON ?auto_287866 ?auto_287865 ) ( not ( = ?auto_287865 ?auto_287866 ) ) ( not ( = ?auto_287865 ?auto_287867 ) ) ( not ( = ?auto_287865 ?auto_287868 ) ) ( not ( = ?auto_287865 ?auto_287869 ) ) ( not ( = ?auto_287866 ?auto_287867 ) ) ( not ( = ?auto_287866 ?auto_287868 ) ) ( not ( = ?auto_287866 ?auto_287869 ) ) ( not ( = ?auto_287867 ?auto_287868 ) ) ( not ( = ?auto_287867 ?auto_287869 ) ) ( not ( = ?auto_287868 ?auto_287869 ) ) ( CLEAR ?auto_287866 ) ( ON ?auto_287867 ?auto_287868 ) ( CLEAR ?auto_287867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_287865 ?auto_287866 ?auto_287867 )
      ( MAKE-4PILE ?auto_287865 ?auto_287866 ?auto_287867 ?auto_287868 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_287874 - BLOCK
      ?auto_287875 - BLOCK
      ?auto_287876 - BLOCK
      ?auto_287877 - BLOCK
    )
    :vars
    (
      ?auto_287878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_287877 ?auto_287878 ) ( ON-TABLE ?auto_287874 ) ( ON ?auto_287875 ?auto_287874 ) ( not ( = ?auto_287874 ?auto_287875 ) ) ( not ( = ?auto_287874 ?auto_287876 ) ) ( not ( = ?auto_287874 ?auto_287877 ) ) ( not ( = ?auto_287874 ?auto_287878 ) ) ( not ( = ?auto_287875 ?auto_287876 ) ) ( not ( = ?auto_287875 ?auto_287877 ) ) ( not ( = ?auto_287875 ?auto_287878 ) ) ( not ( = ?auto_287876 ?auto_287877 ) ) ( not ( = ?auto_287876 ?auto_287878 ) ) ( not ( = ?auto_287877 ?auto_287878 ) ) ( CLEAR ?auto_287875 ) ( ON ?auto_287876 ?auto_287877 ) ( CLEAR ?auto_287876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_287874 ?auto_287875 ?auto_287876 )
      ( MAKE-4PILE ?auto_287874 ?auto_287875 ?auto_287876 ?auto_287877 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_287883 - BLOCK
      ?auto_287884 - BLOCK
      ?auto_287885 - BLOCK
      ?auto_287886 - BLOCK
    )
    :vars
    (
      ?auto_287887 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_287886 ?auto_287887 ) ( ON-TABLE ?auto_287883 ) ( not ( = ?auto_287883 ?auto_287884 ) ) ( not ( = ?auto_287883 ?auto_287885 ) ) ( not ( = ?auto_287883 ?auto_287886 ) ) ( not ( = ?auto_287883 ?auto_287887 ) ) ( not ( = ?auto_287884 ?auto_287885 ) ) ( not ( = ?auto_287884 ?auto_287886 ) ) ( not ( = ?auto_287884 ?auto_287887 ) ) ( not ( = ?auto_287885 ?auto_287886 ) ) ( not ( = ?auto_287885 ?auto_287887 ) ) ( not ( = ?auto_287886 ?auto_287887 ) ) ( ON ?auto_287885 ?auto_287886 ) ( CLEAR ?auto_287883 ) ( ON ?auto_287884 ?auto_287885 ) ( CLEAR ?auto_287884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_287883 ?auto_287884 )
      ( MAKE-4PILE ?auto_287883 ?auto_287884 ?auto_287885 ?auto_287886 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_287892 - BLOCK
      ?auto_287893 - BLOCK
      ?auto_287894 - BLOCK
      ?auto_287895 - BLOCK
    )
    :vars
    (
      ?auto_287896 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_287895 ?auto_287896 ) ( ON-TABLE ?auto_287892 ) ( not ( = ?auto_287892 ?auto_287893 ) ) ( not ( = ?auto_287892 ?auto_287894 ) ) ( not ( = ?auto_287892 ?auto_287895 ) ) ( not ( = ?auto_287892 ?auto_287896 ) ) ( not ( = ?auto_287893 ?auto_287894 ) ) ( not ( = ?auto_287893 ?auto_287895 ) ) ( not ( = ?auto_287893 ?auto_287896 ) ) ( not ( = ?auto_287894 ?auto_287895 ) ) ( not ( = ?auto_287894 ?auto_287896 ) ) ( not ( = ?auto_287895 ?auto_287896 ) ) ( ON ?auto_287894 ?auto_287895 ) ( CLEAR ?auto_287892 ) ( ON ?auto_287893 ?auto_287894 ) ( CLEAR ?auto_287893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_287892 ?auto_287893 )
      ( MAKE-4PILE ?auto_287892 ?auto_287893 ?auto_287894 ?auto_287895 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_287901 - BLOCK
      ?auto_287902 - BLOCK
      ?auto_287903 - BLOCK
      ?auto_287904 - BLOCK
    )
    :vars
    (
      ?auto_287905 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_287904 ?auto_287905 ) ( not ( = ?auto_287901 ?auto_287902 ) ) ( not ( = ?auto_287901 ?auto_287903 ) ) ( not ( = ?auto_287901 ?auto_287904 ) ) ( not ( = ?auto_287901 ?auto_287905 ) ) ( not ( = ?auto_287902 ?auto_287903 ) ) ( not ( = ?auto_287902 ?auto_287904 ) ) ( not ( = ?auto_287902 ?auto_287905 ) ) ( not ( = ?auto_287903 ?auto_287904 ) ) ( not ( = ?auto_287903 ?auto_287905 ) ) ( not ( = ?auto_287904 ?auto_287905 ) ) ( ON ?auto_287903 ?auto_287904 ) ( ON ?auto_287902 ?auto_287903 ) ( ON ?auto_287901 ?auto_287902 ) ( CLEAR ?auto_287901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_287901 )
      ( MAKE-4PILE ?auto_287901 ?auto_287902 ?auto_287903 ?auto_287904 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_287910 - BLOCK
      ?auto_287911 - BLOCK
      ?auto_287912 - BLOCK
      ?auto_287913 - BLOCK
    )
    :vars
    (
      ?auto_287914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_287913 ?auto_287914 ) ( not ( = ?auto_287910 ?auto_287911 ) ) ( not ( = ?auto_287910 ?auto_287912 ) ) ( not ( = ?auto_287910 ?auto_287913 ) ) ( not ( = ?auto_287910 ?auto_287914 ) ) ( not ( = ?auto_287911 ?auto_287912 ) ) ( not ( = ?auto_287911 ?auto_287913 ) ) ( not ( = ?auto_287911 ?auto_287914 ) ) ( not ( = ?auto_287912 ?auto_287913 ) ) ( not ( = ?auto_287912 ?auto_287914 ) ) ( not ( = ?auto_287913 ?auto_287914 ) ) ( ON ?auto_287912 ?auto_287913 ) ( ON ?auto_287911 ?auto_287912 ) ( ON ?auto_287910 ?auto_287911 ) ( CLEAR ?auto_287910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_287910 )
      ( MAKE-4PILE ?auto_287910 ?auto_287911 ?auto_287912 ?auto_287913 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_287920 - BLOCK
      ?auto_287921 - BLOCK
      ?auto_287922 - BLOCK
      ?auto_287923 - BLOCK
      ?auto_287924 - BLOCK
    )
    :vars
    (
      ?auto_287925 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_287923 ) ( ON ?auto_287924 ?auto_287925 ) ( CLEAR ?auto_287924 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_287920 ) ( ON ?auto_287921 ?auto_287920 ) ( ON ?auto_287922 ?auto_287921 ) ( ON ?auto_287923 ?auto_287922 ) ( not ( = ?auto_287920 ?auto_287921 ) ) ( not ( = ?auto_287920 ?auto_287922 ) ) ( not ( = ?auto_287920 ?auto_287923 ) ) ( not ( = ?auto_287920 ?auto_287924 ) ) ( not ( = ?auto_287920 ?auto_287925 ) ) ( not ( = ?auto_287921 ?auto_287922 ) ) ( not ( = ?auto_287921 ?auto_287923 ) ) ( not ( = ?auto_287921 ?auto_287924 ) ) ( not ( = ?auto_287921 ?auto_287925 ) ) ( not ( = ?auto_287922 ?auto_287923 ) ) ( not ( = ?auto_287922 ?auto_287924 ) ) ( not ( = ?auto_287922 ?auto_287925 ) ) ( not ( = ?auto_287923 ?auto_287924 ) ) ( not ( = ?auto_287923 ?auto_287925 ) ) ( not ( = ?auto_287924 ?auto_287925 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_287924 ?auto_287925 )
      ( !STACK ?auto_287924 ?auto_287923 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_287931 - BLOCK
      ?auto_287932 - BLOCK
      ?auto_287933 - BLOCK
      ?auto_287934 - BLOCK
      ?auto_287935 - BLOCK
    )
    :vars
    (
      ?auto_287936 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_287934 ) ( ON ?auto_287935 ?auto_287936 ) ( CLEAR ?auto_287935 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_287931 ) ( ON ?auto_287932 ?auto_287931 ) ( ON ?auto_287933 ?auto_287932 ) ( ON ?auto_287934 ?auto_287933 ) ( not ( = ?auto_287931 ?auto_287932 ) ) ( not ( = ?auto_287931 ?auto_287933 ) ) ( not ( = ?auto_287931 ?auto_287934 ) ) ( not ( = ?auto_287931 ?auto_287935 ) ) ( not ( = ?auto_287931 ?auto_287936 ) ) ( not ( = ?auto_287932 ?auto_287933 ) ) ( not ( = ?auto_287932 ?auto_287934 ) ) ( not ( = ?auto_287932 ?auto_287935 ) ) ( not ( = ?auto_287932 ?auto_287936 ) ) ( not ( = ?auto_287933 ?auto_287934 ) ) ( not ( = ?auto_287933 ?auto_287935 ) ) ( not ( = ?auto_287933 ?auto_287936 ) ) ( not ( = ?auto_287934 ?auto_287935 ) ) ( not ( = ?auto_287934 ?auto_287936 ) ) ( not ( = ?auto_287935 ?auto_287936 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_287935 ?auto_287936 )
      ( !STACK ?auto_287935 ?auto_287934 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_287942 - BLOCK
      ?auto_287943 - BLOCK
      ?auto_287944 - BLOCK
      ?auto_287945 - BLOCK
      ?auto_287946 - BLOCK
    )
    :vars
    (
      ?auto_287947 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_287946 ?auto_287947 ) ( ON-TABLE ?auto_287942 ) ( ON ?auto_287943 ?auto_287942 ) ( ON ?auto_287944 ?auto_287943 ) ( not ( = ?auto_287942 ?auto_287943 ) ) ( not ( = ?auto_287942 ?auto_287944 ) ) ( not ( = ?auto_287942 ?auto_287945 ) ) ( not ( = ?auto_287942 ?auto_287946 ) ) ( not ( = ?auto_287942 ?auto_287947 ) ) ( not ( = ?auto_287943 ?auto_287944 ) ) ( not ( = ?auto_287943 ?auto_287945 ) ) ( not ( = ?auto_287943 ?auto_287946 ) ) ( not ( = ?auto_287943 ?auto_287947 ) ) ( not ( = ?auto_287944 ?auto_287945 ) ) ( not ( = ?auto_287944 ?auto_287946 ) ) ( not ( = ?auto_287944 ?auto_287947 ) ) ( not ( = ?auto_287945 ?auto_287946 ) ) ( not ( = ?auto_287945 ?auto_287947 ) ) ( not ( = ?auto_287946 ?auto_287947 ) ) ( CLEAR ?auto_287944 ) ( ON ?auto_287945 ?auto_287946 ) ( CLEAR ?auto_287945 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_287942 ?auto_287943 ?auto_287944 ?auto_287945 )
      ( MAKE-5PILE ?auto_287942 ?auto_287943 ?auto_287944 ?auto_287945 ?auto_287946 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_287953 - BLOCK
      ?auto_287954 - BLOCK
      ?auto_287955 - BLOCK
      ?auto_287956 - BLOCK
      ?auto_287957 - BLOCK
    )
    :vars
    (
      ?auto_287958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_287957 ?auto_287958 ) ( ON-TABLE ?auto_287953 ) ( ON ?auto_287954 ?auto_287953 ) ( ON ?auto_287955 ?auto_287954 ) ( not ( = ?auto_287953 ?auto_287954 ) ) ( not ( = ?auto_287953 ?auto_287955 ) ) ( not ( = ?auto_287953 ?auto_287956 ) ) ( not ( = ?auto_287953 ?auto_287957 ) ) ( not ( = ?auto_287953 ?auto_287958 ) ) ( not ( = ?auto_287954 ?auto_287955 ) ) ( not ( = ?auto_287954 ?auto_287956 ) ) ( not ( = ?auto_287954 ?auto_287957 ) ) ( not ( = ?auto_287954 ?auto_287958 ) ) ( not ( = ?auto_287955 ?auto_287956 ) ) ( not ( = ?auto_287955 ?auto_287957 ) ) ( not ( = ?auto_287955 ?auto_287958 ) ) ( not ( = ?auto_287956 ?auto_287957 ) ) ( not ( = ?auto_287956 ?auto_287958 ) ) ( not ( = ?auto_287957 ?auto_287958 ) ) ( CLEAR ?auto_287955 ) ( ON ?auto_287956 ?auto_287957 ) ( CLEAR ?auto_287956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_287953 ?auto_287954 ?auto_287955 ?auto_287956 )
      ( MAKE-5PILE ?auto_287953 ?auto_287954 ?auto_287955 ?auto_287956 ?auto_287957 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_287964 - BLOCK
      ?auto_287965 - BLOCK
      ?auto_287966 - BLOCK
      ?auto_287967 - BLOCK
      ?auto_287968 - BLOCK
    )
    :vars
    (
      ?auto_287969 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_287968 ?auto_287969 ) ( ON-TABLE ?auto_287964 ) ( ON ?auto_287965 ?auto_287964 ) ( not ( = ?auto_287964 ?auto_287965 ) ) ( not ( = ?auto_287964 ?auto_287966 ) ) ( not ( = ?auto_287964 ?auto_287967 ) ) ( not ( = ?auto_287964 ?auto_287968 ) ) ( not ( = ?auto_287964 ?auto_287969 ) ) ( not ( = ?auto_287965 ?auto_287966 ) ) ( not ( = ?auto_287965 ?auto_287967 ) ) ( not ( = ?auto_287965 ?auto_287968 ) ) ( not ( = ?auto_287965 ?auto_287969 ) ) ( not ( = ?auto_287966 ?auto_287967 ) ) ( not ( = ?auto_287966 ?auto_287968 ) ) ( not ( = ?auto_287966 ?auto_287969 ) ) ( not ( = ?auto_287967 ?auto_287968 ) ) ( not ( = ?auto_287967 ?auto_287969 ) ) ( not ( = ?auto_287968 ?auto_287969 ) ) ( ON ?auto_287967 ?auto_287968 ) ( CLEAR ?auto_287965 ) ( ON ?auto_287966 ?auto_287967 ) ( CLEAR ?auto_287966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_287964 ?auto_287965 ?auto_287966 )
      ( MAKE-5PILE ?auto_287964 ?auto_287965 ?auto_287966 ?auto_287967 ?auto_287968 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_287975 - BLOCK
      ?auto_287976 - BLOCK
      ?auto_287977 - BLOCK
      ?auto_287978 - BLOCK
      ?auto_287979 - BLOCK
    )
    :vars
    (
      ?auto_287980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_287979 ?auto_287980 ) ( ON-TABLE ?auto_287975 ) ( ON ?auto_287976 ?auto_287975 ) ( not ( = ?auto_287975 ?auto_287976 ) ) ( not ( = ?auto_287975 ?auto_287977 ) ) ( not ( = ?auto_287975 ?auto_287978 ) ) ( not ( = ?auto_287975 ?auto_287979 ) ) ( not ( = ?auto_287975 ?auto_287980 ) ) ( not ( = ?auto_287976 ?auto_287977 ) ) ( not ( = ?auto_287976 ?auto_287978 ) ) ( not ( = ?auto_287976 ?auto_287979 ) ) ( not ( = ?auto_287976 ?auto_287980 ) ) ( not ( = ?auto_287977 ?auto_287978 ) ) ( not ( = ?auto_287977 ?auto_287979 ) ) ( not ( = ?auto_287977 ?auto_287980 ) ) ( not ( = ?auto_287978 ?auto_287979 ) ) ( not ( = ?auto_287978 ?auto_287980 ) ) ( not ( = ?auto_287979 ?auto_287980 ) ) ( ON ?auto_287978 ?auto_287979 ) ( CLEAR ?auto_287976 ) ( ON ?auto_287977 ?auto_287978 ) ( CLEAR ?auto_287977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_287975 ?auto_287976 ?auto_287977 )
      ( MAKE-5PILE ?auto_287975 ?auto_287976 ?auto_287977 ?auto_287978 ?auto_287979 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_287986 - BLOCK
      ?auto_287987 - BLOCK
      ?auto_287988 - BLOCK
      ?auto_287989 - BLOCK
      ?auto_287990 - BLOCK
    )
    :vars
    (
      ?auto_287991 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_287990 ?auto_287991 ) ( ON-TABLE ?auto_287986 ) ( not ( = ?auto_287986 ?auto_287987 ) ) ( not ( = ?auto_287986 ?auto_287988 ) ) ( not ( = ?auto_287986 ?auto_287989 ) ) ( not ( = ?auto_287986 ?auto_287990 ) ) ( not ( = ?auto_287986 ?auto_287991 ) ) ( not ( = ?auto_287987 ?auto_287988 ) ) ( not ( = ?auto_287987 ?auto_287989 ) ) ( not ( = ?auto_287987 ?auto_287990 ) ) ( not ( = ?auto_287987 ?auto_287991 ) ) ( not ( = ?auto_287988 ?auto_287989 ) ) ( not ( = ?auto_287988 ?auto_287990 ) ) ( not ( = ?auto_287988 ?auto_287991 ) ) ( not ( = ?auto_287989 ?auto_287990 ) ) ( not ( = ?auto_287989 ?auto_287991 ) ) ( not ( = ?auto_287990 ?auto_287991 ) ) ( ON ?auto_287989 ?auto_287990 ) ( ON ?auto_287988 ?auto_287989 ) ( CLEAR ?auto_287986 ) ( ON ?auto_287987 ?auto_287988 ) ( CLEAR ?auto_287987 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_287986 ?auto_287987 )
      ( MAKE-5PILE ?auto_287986 ?auto_287987 ?auto_287988 ?auto_287989 ?auto_287990 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_287997 - BLOCK
      ?auto_287998 - BLOCK
      ?auto_287999 - BLOCK
      ?auto_288000 - BLOCK
      ?auto_288001 - BLOCK
    )
    :vars
    (
      ?auto_288002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288001 ?auto_288002 ) ( ON-TABLE ?auto_287997 ) ( not ( = ?auto_287997 ?auto_287998 ) ) ( not ( = ?auto_287997 ?auto_287999 ) ) ( not ( = ?auto_287997 ?auto_288000 ) ) ( not ( = ?auto_287997 ?auto_288001 ) ) ( not ( = ?auto_287997 ?auto_288002 ) ) ( not ( = ?auto_287998 ?auto_287999 ) ) ( not ( = ?auto_287998 ?auto_288000 ) ) ( not ( = ?auto_287998 ?auto_288001 ) ) ( not ( = ?auto_287998 ?auto_288002 ) ) ( not ( = ?auto_287999 ?auto_288000 ) ) ( not ( = ?auto_287999 ?auto_288001 ) ) ( not ( = ?auto_287999 ?auto_288002 ) ) ( not ( = ?auto_288000 ?auto_288001 ) ) ( not ( = ?auto_288000 ?auto_288002 ) ) ( not ( = ?auto_288001 ?auto_288002 ) ) ( ON ?auto_288000 ?auto_288001 ) ( ON ?auto_287999 ?auto_288000 ) ( CLEAR ?auto_287997 ) ( ON ?auto_287998 ?auto_287999 ) ( CLEAR ?auto_287998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_287997 ?auto_287998 )
      ( MAKE-5PILE ?auto_287997 ?auto_287998 ?auto_287999 ?auto_288000 ?auto_288001 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_288008 - BLOCK
      ?auto_288009 - BLOCK
      ?auto_288010 - BLOCK
      ?auto_288011 - BLOCK
      ?auto_288012 - BLOCK
    )
    :vars
    (
      ?auto_288013 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288012 ?auto_288013 ) ( not ( = ?auto_288008 ?auto_288009 ) ) ( not ( = ?auto_288008 ?auto_288010 ) ) ( not ( = ?auto_288008 ?auto_288011 ) ) ( not ( = ?auto_288008 ?auto_288012 ) ) ( not ( = ?auto_288008 ?auto_288013 ) ) ( not ( = ?auto_288009 ?auto_288010 ) ) ( not ( = ?auto_288009 ?auto_288011 ) ) ( not ( = ?auto_288009 ?auto_288012 ) ) ( not ( = ?auto_288009 ?auto_288013 ) ) ( not ( = ?auto_288010 ?auto_288011 ) ) ( not ( = ?auto_288010 ?auto_288012 ) ) ( not ( = ?auto_288010 ?auto_288013 ) ) ( not ( = ?auto_288011 ?auto_288012 ) ) ( not ( = ?auto_288011 ?auto_288013 ) ) ( not ( = ?auto_288012 ?auto_288013 ) ) ( ON ?auto_288011 ?auto_288012 ) ( ON ?auto_288010 ?auto_288011 ) ( ON ?auto_288009 ?auto_288010 ) ( ON ?auto_288008 ?auto_288009 ) ( CLEAR ?auto_288008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_288008 )
      ( MAKE-5PILE ?auto_288008 ?auto_288009 ?auto_288010 ?auto_288011 ?auto_288012 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_288019 - BLOCK
      ?auto_288020 - BLOCK
      ?auto_288021 - BLOCK
      ?auto_288022 - BLOCK
      ?auto_288023 - BLOCK
    )
    :vars
    (
      ?auto_288024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288023 ?auto_288024 ) ( not ( = ?auto_288019 ?auto_288020 ) ) ( not ( = ?auto_288019 ?auto_288021 ) ) ( not ( = ?auto_288019 ?auto_288022 ) ) ( not ( = ?auto_288019 ?auto_288023 ) ) ( not ( = ?auto_288019 ?auto_288024 ) ) ( not ( = ?auto_288020 ?auto_288021 ) ) ( not ( = ?auto_288020 ?auto_288022 ) ) ( not ( = ?auto_288020 ?auto_288023 ) ) ( not ( = ?auto_288020 ?auto_288024 ) ) ( not ( = ?auto_288021 ?auto_288022 ) ) ( not ( = ?auto_288021 ?auto_288023 ) ) ( not ( = ?auto_288021 ?auto_288024 ) ) ( not ( = ?auto_288022 ?auto_288023 ) ) ( not ( = ?auto_288022 ?auto_288024 ) ) ( not ( = ?auto_288023 ?auto_288024 ) ) ( ON ?auto_288022 ?auto_288023 ) ( ON ?auto_288021 ?auto_288022 ) ( ON ?auto_288020 ?auto_288021 ) ( ON ?auto_288019 ?auto_288020 ) ( CLEAR ?auto_288019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_288019 )
      ( MAKE-5PILE ?auto_288019 ?auto_288020 ?auto_288021 ?auto_288022 ?auto_288023 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_288031 - BLOCK
      ?auto_288032 - BLOCK
      ?auto_288033 - BLOCK
      ?auto_288034 - BLOCK
      ?auto_288035 - BLOCK
      ?auto_288036 - BLOCK
    )
    :vars
    (
      ?auto_288037 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_288035 ) ( ON ?auto_288036 ?auto_288037 ) ( CLEAR ?auto_288036 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_288031 ) ( ON ?auto_288032 ?auto_288031 ) ( ON ?auto_288033 ?auto_288032 ) ( ON ?auto_288034 ?auto_288033 ) ( ON ?auto_288035 ?auto_288034 ) ( not ( = ?auto_288031 ?auto_288032 ) ) ( not ( = ?auto_288031 ?auto_288033 ) ) ( not ( = ?auto_288031 ?auto_288034 ) ) ( not ( = ?auto_288031 ?auto_288035 ) ) ( not ( = ?auto_288031 ?auto_288036 ) ) ( not ( = ?auto_288031 ?auto_288037 ) ) ( not ( = ?auto_288032 ?auto_288033 ) ) ( not ( = ?auto_288032 ?auto_288034 ) ) ( not ( = ?auto_288032 ?auto_288035 ) ) ( not ( = ?auto_288032 ?auto_288036 ) ) ( not ( = ?auto_288032 ?auto_288037 ) ) ( not ( = ?auto_288033 ?auto_288034 ) ) ( not ( = ?auto_288033 ?auto_288035 ) ) ( not ( = ?auto_288033 ?auto_288036 ) ) ( not ( = ?auto_288033 ?auto_288037 ) ) ( not ( = ?auto_288034 ?auto_288035 ) ) ( not ( = ?auto_288034 ?auto_288036 ) ) ( not ( = ?auto_288034 ?auto_288037 ) ) ( not ( = ?auto_288035 ?auto_288036 ) ) ( not ( = ?auto_288035 ?auto_288037 ) ) ( not ( = ?auto_288036 ?auto_288037 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_288036 ?auto_288037 )
      ( !STACK ?auto_288036 ?auto_288035 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_288044 - BLOCK
      ?auto_288045 - BLOCK
      ?auto_288046 - BLOCK
      ?auto_288047 - BLOCK
      ?auto_288048 - BLOCK
      ?auto_288049 - BLOCK
    )
    :vars
    (
      ?auto_288050 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_288048 ) ( ON ?auto_288049 ?auto_288050 ) ( CLEAR ?auto_288049 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_288044 ) ( ON ?auto_288045 ?auto_288044 ) ( ON ?auto_288046 ?auto_288045 ) ( ON ?auto_288047 ?auto_288046 ) ( ON ?auto_288048 ?auto_288047 ) ( not ( = ?auto_288044 ?auto_288045 ) ) ( not ( = ?auto_288044 ?auto_288046 ) ) ( not ( = ?auto_288044 ?auto_288047 ) ) ( not ( = ?auto_288044 ?auto_288048 ) ) ( not ( = ?auto_288044 ?auto_288049 ) ) ( not ( = ?auto_288044 ?auto_288050 ) ) ( not ( = ?auto_288045 ?auto_288046 ) ) ( not ( = ?auto_288045 ?auto_288047 ) ) ( not ( = ?auto_288045 ?auto_288048 ) ) ( not ( = ?auto_288045 ?auto_288049 ) ) ( not ( = ?auto_288045 ?auto_288050 ) ) ( not ( = ?auto_288046 ?auto_288047 ) ) ( not ( = ?auto_288046 ?auto_288048 ) ) ( not ( = ?auto_288046 ?auto_288049 ) ) ( not ( = ?auto_288046 ?auto_288050 ) ) ( not ( = ?auto_288047 ?auto_288048 ) ) ( not ( = ?auto_288047 ?auto_288049 ) ) ( not ( = ?auto_288047 ?auto_288050 ) ) ( not ( = ?auto_288048 ?auto_288049 ) ) ( not ( = ?auto_288048 ?auto_288050 ) ) ( not ( = ?auto_288049 ?auto_288050 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_288049 ?auto_288050 )
      ( !STACK ?auto_288049 ?auto_288048 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_288057 - BLOCK
      ?auto_288058 - BLOCK
      ?auto_288059 - BLOCK
      ?auto_288060 - BLOCK
      ?auto_288061 - BLOCK
      ?auto_288062 - BLOCK
    )
    :vars
    (
      ?auto_288063 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288062 ?auto_288063 ) ( ON-TABLE ?auto_288057 ) ( ON ?auto_288058 ?auto_288057 ) ( ON ?auto_288059 ?auto_288058 ) ( ON ?auto_288060 ?auto_288059 ) ( not ( = ?auto_288057 ?auto_288058 ) ) ( not ( = ?auto_288057 ?auto_288059 ) ) ( not ( = ?auto_288057 ?auto_288060 ) ) ( not ( = ?auto_288057 ?auto_288061 ) ) ( not ( = ?auto_288057 ?auto_288062 ) ) ( not ( = ?auto_288057 ?auto_288063 ) ) ( not ( = ?auto_288058 ?auto_288059 ) ) ( not ( = ?auto_288058 ?auto_288060 ) ) ( not ( = ?auto_288058 ?auto_288061 ) ) ( not ( = ?auto_288058 ?auto_288062 ) ) ( not ( = ?auto_288058 ?auto_288063 ) ) ( not ( = ?auto_288059 ?auto_288060 ) ) ( not ( = ?auto_288059 ?auto_288061 ) ) ( not ( = ?auto_288059 ?auto_288062 ) ) ( not ( = ?auto_288059 ?auto_288063 ) ) ( not ( = ?auto_288060 ?auto_288061 ) ) ( not ( = ?auto_288060 ?auto_288062 ) ) ( not ( = ?auto_288060 ?auto_288063 ) ) ( not ( = ?auto_288061 ?auto_288062 ) ) ( not ( = ?auto_288061 ?auto_288063 ) ) ( not ( = ?auto_288062 ?auto_288063 ) ) ( CLEAR ?auto_288060 ) ( ON ?auto_288061 ?auto_288062 ) ( CLEAR ?auto_288061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_288057 ?auto_288058 ?auto_288059 ?auto_288060 ?auto_288061 )
      ( MAKE-6PILE ?auto_288057 ?auto_288058 ?auto_288059 ?auto_288060 ?auto_288061 ?auto_288062 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_288070 - BLOCK
      ?auto_288071 - BLOCK
      ?auto_288072 - BLOCK
      ?auto_288073 - BLOCK
      ?auto_288074 - BLOCK
      ?auto_288075 - BLOCK
    )
    :vars
    (
      ?auto_288076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288075 ?auto_288076 ) ( ON-TABLE ?auto_288070 ) ( ON ?auto_288071 ?auto_288070 ) ( ON ?auto_288072 ?auto_288071 ) ( ON ?auto_288073 ?auto_288072 ) ( not ( = ?auto_288070 ?auto_288071 ) ) ( not ( = ?auto_288070 ?auto_288072 ) ) ( not ( = ?auto_288070 ?auto_288073 ) ) ( not ( = ?auto_288070 ?auto_288074 ) ) ( not ( = ?auto_288070 ?auto_288075 ) ) ( not ( = ?auto_288070 ?auto_288076 ) ) ( not ( = ?auto_288071 ?auto_288072 ) ) ( not ( = ?auto_288071 ?auto_288073 ) ) ( not ( = ?auto_288071 ?auto_288074 ) ) ( not ( = ?auto_288071 ?auto_288075 ) ) ( not ( = ?auto_288071 ?auto_288076 ) ) ( not ( = ?auto_288072 ?auto_288073 ) ) ( not ( = ?auto_288072 ?auto_288074 ) ) ( not ( = ?auto_288072 ?auto_288075 ) ) ( not ( = ?auto_288072 ?auto_288076 ) ) ( not ( = ?auto_288073 ?auto_288074 ) ) ( not ( = ?auto_288073 ?auto_288075 ) ) ( not ( = ?auto_288073 ?auto_288076 ) ) ( not ( = ?auto_288074 ?auto_288075 ) ) ( not ( = ?auto_288074 ?auto_288076 ) ) ( not ( = ?auto_288075 ?auto_288076 ) ) ( CLEAR ?auto_288073 ) ( ON ?auto_288074 ?auto_288075 ) ( CLEAR ?auto_288074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_288070 ?auto_288071 ?auto_288072 ?auto_288073 ?auto_288074 )
      ( MAKE-6PILE ?auto_288070 ?auto_288071 ?auto_288072 ?auto_288073 ?auto_288074 ?auto_288075 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_288083 - BLOCK
      ?auto_288084 - BLOCK
      ?auto_288085 - BLOCK
      ?auto_288086 - BLOCK
      ?auto_288087 - BLOCK
      ?auto_288088 - BLOCK
    )
    :vars
    (
      ?auto_288089 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288088 ?auto_288089 ) ( ON-TABLE ?auto_288083 ) ( ON ?auto_288084 ?auto_288083 ) ( ON ?auto_288085 ?auto_288084 ) ( not ( = ?auto_288083 ?auto_288084 ) ) ( not ( = ?auto_288083 ?auto_288085 ) ) ( not ( = ?auto_288083 ?auto_288086 ) ) ( not ( = ?auto_288083 ?auto_288087 ) ) ( not ( = ?auto_288083 ?auto_288088 ) ) ( not ( = ?auto_288083 ?auto_288089 ) ) ( not ( = ?auto_288084 ?auto_288085 ) ) ( not ( = ?auto_288084 ?auto_288086 ) ) ( not ( = ?auto_288084 ?auto_288087 ) ) ( not ( = ?auto_288084 ?auto_288088 ) ) ( not ( = ?auto_288084 ?auto_288089 ) ) ( not ( = ?auto_288085 ?auto_288086 ) ) ( not ( = ?auto_288085 ?auto_288087 ) ) ( not ( = ?auto_288085 ?auto_288088 ) ) ( not ( = ?auto_288085 ?auto_288089 ) ) ( not ( = ?auto_288086 ?auto_288087 ) ) ( not ( = ?auto_288086 ?auto_288088 ) ) ( not ( = ?auto_288086 ?auto_288089 ) ) ( not ( = ?auto_288087 ?auto_288088 ) ) ( not ( = ?auto_288087 ?auto_288089 ) ) ( not ( = ?auto_288088 ?auto_288089 ) ) ( ON ?auto_288087 ?auto_288088 ) ( CLEAR ?auto_288085 ) ( ON ?auto_288086 ?auto_288087 ) ( CLEAR ?auto_288086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_288083 ?auto_288084 ?auto_288085 ?auto_288086 )
      ( MAKE-6PILE ?auto_288083 ?auto_288084 ?auto_288085 ?auto_288086 ?auto_288087 ?auto_288088 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_288096 - BLOCK
      ?auto_288097 - BLOCK
      ?auto_288098 - BLOCK
      ?auto_288099 - BLOCK
      ?auto_288100 - BLOCK
      ?auto_288101 - BLOCK
    )
    :vars
    (
      ?auto_288102 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288101 ?auto_288102 ) ( ON-TABLE ?auto_288096 ) ( ON ?auto_288097 ?auto_288096 ) ( ON ?auto_288098 ?auto_288097 ) ( not ( = ?auto_288096 ?auto_288097 ) ) ( not ( = ?auto_288096 ?auto_288098 ) ) ( not ( = ?auto_288096 ?auto_288099 ) ) ( not ( = ?auto_288096 ?auto_288100 ) ) ( not ( = ?auto_288096 ?auto_288101 ) ) ( not ( = ?auto_288096 ?auto_288102 ) ) ( not ( = ?auto_288097 ?auto_288098 ) ) ( not ( = ?auto_288097 ?auto_288099 ) ) ( not ( = ?auto_288097 ?auto_288100 ) ) ( not ( = ?auto_288097 ?auto_288101 ) ) ( not ( = ?auto_288097 ?auto_288102 ) ) ( not ( = ?auto_288098 ?auto_288099 ) ) ( not ( = ?auto_288098 ?auto_288100 ) ) ( not ( = ?auto_288098 ?auto_288101 ) ) ( not ( = ?auto_288098 ?auto_288102 ) ) ( not ( = ?auto_288099 ?auto_288100 ) ) ( not ( = ?auto_288099 ?auto_288101 ) ) ( not ( = ?auto_288099 ?auto_288102 ) ) ( not ( = ?auto_288100 ?auto_288101 ) ) ( not ( = ?auto_288100 ?auto_288102 ) ) ( not ( = ?auto_288101 ?auto_288102 ) ) ( ON ?auto_288100 ?auto_288101 ) ( CLEAR ?auto_288098 ) ( ON ?auto_288099 ?auto_288100 ) ( CLEAR ?auto_288099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_288096 ?auto_288097 ?auto_288098 ?auto_288099 )
      ( MAKE-6PILE ?auto_288096 ?auto_288097 ?auto_288098 ?auto_288099 ?auto_288100 ?auto_288101 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_288109 - BLOCK
      ?auto_288110 - BLOCK
      ?auto_288111 - BLOCK
      ?auto_288112 - BLOCK
      ?auto_288113 - BLOCK
      ?auto_288114 - BLOCK
    )
    :vars
    (
      ?auto_288115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288114 ?auto_288115 ) ( ON-TABLE ?auto_288109 ) ( ON ?auto_288110 ?auto_288109 ) ( not ( = ?auto_288109 ?auto_288110 ) ) ( not ( = ?auto_288109 ?auto_288111 ) ) ( not ( = ?auto_288109 ?auto_288112 ) ) ( not ( = ?auto_288109 ?auto_288113 ) ) ( not ( = ?auto_288109 ?auto_288114 ) ) ( not ( = ?auto_288109 ?auto_288115 ) ) ( not ( = ?auto_288110 ?auto_288111 ) ) ( not ( = ?auto_288110 ?auto_288112 ) ) ( not ( = ?auto_288110 ?auto_288113 ) ) ( not ( = ?auto_288110 ?auto_288114 ) ) ( not ( = ?auto_288110 ?auto_288115 ) ) ( not ( = ?auto_288111 ?auto_288112 ) ) ( not ( = ?auto_288111 ?auto_288113 ) ) ( not ( = ?auto_288111 ?auto_288114 ) ) ( not ( = ?auto_288111 ?auto_288115 ) ) ( not ( = ?auto_288112 ?auto_288113 ) ) ( not ( = ?auto_288112 ?auto_288114 ) ) ( not ( = ?auto_288112 ?auto_288115 ) ) ( not ( = ?auto_288113 ?auto_288114 ) ) ( not ( = ?auto_288113 ?auto_288115 ) ) ( not ( = ?auto_288114 ?auto_288115 ) ) ( ON ?auto_288113 ?auto_288114 ) ( ON ?auto_288112 ?auto_288113 ) ( CLEAR ?auto_288110 ) ( ON ?auto_288111 ?auto_288112 ) ( CLEAR ?auto_288111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_288109 ?auto_288110 ?auto_288111 )
      ( MAKE-6PILE ?auto_288109 ?auto_288110 ?auto_288111 ?auto_288112 ?auto_288113 ?auto_288114 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_288122 - BLOCK
      ?auto_288123 - BLOCK
      ?auto_288124 - BLOCK
      ?auto_288125 - BLOCK
      ?auto_288126 - BLOCK
      ?auto_288127 - BLOCK
    )
    :vars
    (
      ?auto_288128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288127 ?auto_288128 ) ( ON-TABLE ?auto_288122 ) ( ON ?auto_288123 ?auto_288122 ) ( not ( = ?auto_288122 ?auto_288123 ) ) ( not ( = ?auto_288122 ?auto_288124 ) ) ( not ( = ?auto_288122 ?auto_288125 ) ) ( not ( = ?auto_288122 ?auto_288126 ) ) ( not ( = ?auto_288122 ?auto_288127 ) ) ( not ( = ?auto_288122 ?auto_288128 ) ) ( not ( = ?auto_288123 ?auto_288124 ) ) ( not ( = ?auto_288123 ?auto_288125 ) ) ( not ( = ?auto_288123 ?auto_288126 ) ) ( not ( = ?auto_288123 ?auto_288127 ) ) ( not ( = ?auto_288123 ?auto_288128 ) ) ( not ( = ?auto_288124 ?auto_288125 ) ) ( not ( = ?auto_288124 ?auto_288126 ) ) ( not ( = ?auto_288124 ?auto_288127 ) ) ( not ( = ?auto_288124 ?auto_288128 ) ) ( not ( = ?auto_288125 ?auto_288126 ) ) ( not ( = ?auto_288125 ?auto_288127 ) ) ( not ( = ?auto_288125 ?auto_288128 ) ) ( not ( = ?auto_288126 ?auto_288127 ) ) ( not ( = ?auto_288126 ?auto_288128 ) ) ( not ( = ?auto_288127 ?auto_288128 ) ) ( ON ?auto_288126 ?auto_288127 ) ( ON ?auto_288125 ?auto_288126 ) ( CLEAR ?auto_288123 ) ( ON ?auto_288124 ?auto_288125 ) ( CLEAR ?auto_288124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_288122 ?auto_288123 ?auto_288124 )
      ( MAKE-6PILE ?auto_288122 ?auto_288123 ?auto_288124 ?auto_288125 ?auto_288126 ?auto_288127 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_288135 - BLOCK
      ?auto_288136 - BLOCK
      ?auto_288137 - BLOCK
      ?auto_288138 - BLOCK
      ?auto_288139 - BLOCK
      ?auto_288140 - BLOCK
    )
    :vars
    (
      ?auto_288141 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288140 ?auto_288141 ) ( ON-TABLE ?auto_288135 ) ( not ( = ?auto_288135 ?auto_288136 ) ) ( not ( = ?auto_288135 ?auto_288137 ) ) ( not ( = ?auto_288135 ?auto_288138 ) ) ( not ( = ?auto_288135 ?auto_288139 ) ) ( not ( = ?auto_288135 ?auto_288140 ) ) ( not ( = ?auto_288135 ?auto_288141 ) ) ( not ( = ?auto_288136 ?auto_288137 ) ) ( not ( = ?auto_288136 ?auto_288138 ) ) ( not ( = ?auto_288136 ?auto_288139 ) ) ( not ( = ?auto_288136 ?auto_288140 ) ) ( not ( = ?auto_288136 ?auto_288141 ) ) ( not ( = ?auto_288137 ?auto_288138 ) ) ( not ( = ?auto_288137 ?auto_288139 ) ) ( not ( = ?auto_288137 ?auto_288140 ) ) ( not ( = ?auto_288137 ?auto_288141 ) ) ( not ( = ?auto_288138 ?auto_288139 ) ) ( not ( = ?auto_288138 ?auto_288140 ) ) ( not ( = ?auto_288138 ?auto_288141 ) ) ( not ( = ?auto_288139 ?auto_288140 ) ) ( not ( = ?auto_288139 ?auto_288141 ) ) ( not ( = ?auto_288140 ?auto_288141 ) ) ( ON ?auto_288139 ?auto_288140 ) ( ON ?auto_288138 ?auto_288139 ) ( ON ?auto_288137 ?auto_288138 ) ( CLEAR ?auto_288135 ) ( ON ?auto_288136 ?auto_288137 ) ( CLEAR ?auto_288136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_288135 ?auto_288136 )
      ( MAKE-6PILE ?auto_288135 ?auto_288136 ?auto_288137 ?auto_288138 ?auto_288139 ?auto_288140 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_288148 - BLOCK
      ?auto_288149 - BLOCK
      ?auto_288150 - BLOCK
      ?auto_288151 - BLOCK
      ?auto_288152 - BLOCK
      ?auto_288153 - BLOCK
    )
    :vars
    (
      ?auto_288154 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288153 ?auto_288154 ) ( ON-TABLE ?auto_288148 ) ( not ( = ?auto_288148 ?auto_288149 ) ) ( not ( = ?auto_288148 ?auto_288150 ) ) ( not ( = ?auto_288148 ?auto_288151 ) ) ( not ( = ?auto_288148 ?auto_288152 ) ) ( not ( = ?auto_288148 ?auto_288153 ) ) ( not ( = ?auto_288148 ?auto_288154 ) ) ( not ( = ?auto_288149 ?auto_288150 ) ) ( not ( = ?auto_288149 ?auto_288151 ) ) ( not ( = ?auto_288149 ?auto_288152 ) ) ( not ( = ?auto_288149 ?auto_288153 ) ) ( not ( = ?auto_288149 ?auto_288154 ) ) ( not ( = ?auto_288150 ?auto_288151 ) ) ( not ( = ?auto_288150 ?auto_288152 ) ) ( not ( = ?auto_288150 ?auto_288153 ) ) ( not ( = ?auto_288150 ?auto_288154 ) ) ( not ( = ?auto_288151 ?auto_288152 ) ) ( not ( = ?auto_288151 ?auto_288153 ) ) ( not ( = ?auto_288151 ?auto_288154 ) ) ( not ( = ?auto_288152 ?auto_288153 ) ) ( not ( = ?auto_288152 ?auto_288154 ) ) ( not ( = ?auto_288153 ?auto_288154 ) ) ( ON ?auto_288152 ?auto_288153 ) ( ON ?auto_288151 ?auto_288152 ) ( ON ?auto_288150 ?auto_288151 ) ( CLEAR ?auto_288148 ) ( ON ?auto_288149 ?auto_288150 ) ( CLEAR ?auto_288149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_288148 ?auto_288149 )
      ( MAKE-6PILE ?auto_288148 ?auto_288149 ?auto_288150 ?auto_288151 ?auto_288152 ?auto_288153 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_288161 - BLOCK
      ?auto_288162 - BLOCK
      ?auto_288163 - BLOCK
      ?auto_288164 - BLOCK
      ?auto_288165 - BLOCK
      ?auto_288166 - BLOCK
    )
    :vars
    (
      ?auto_288167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288166 ?auto_288167 ) ( not ( = ?auto_288161 ?auto_288162 ) ) ( not ( = ?auto_288161 ?auto_288163 ) ) ( not ( = ?auto_288161 ?auto_288164 ) ) ( not ( = ?auto_288161 ?auto_288165 ) ) ( not ( = ?auto_288161 ?auto_288166 ) ) ( not ( = ?auto_288161 ?auto_288167 ) ) ( not ( = ?auto_288162 ?auto_288163 ) ) ( not ( = ?auto_288162 ?auto_288164 ) ) ( not ( = ?auto_288162 ?auto_288165 ) ) ( not ( = ?auto_288162 ?auto_288166 ) ) ( not ( = ?auto_288162 ?auto_288167 ) ) ( not ( = ?auto_288163 ?auto_288164 ) ) ( not ( = ?auto_288163 ?auto_288165 ) ) ( not ( = ?auto_288163 ?auto_288166 ) ) ( not ( = ?auto_288163 ?auto_288167 ) ) ( not ( = ?auto_288164 ?auto_288165 ) ) ( not ( = ?auto_288164 ?auto_288166 ) ) ( not ( = ?auto_288164 ?auto_288167 ) ) ( not ( = ?auto_288165 ?auto_288166 ) ) ( not ( = ?auto_288165 ?auto_288167 ) ) ( not ( = ?auto_288166 ?auto_288167 ) ) ( ON ?auto_288165 ?auto_288166 ) ( ON ?auto_288164 ?auto_288165 ) ( ON ?auto_288163 ?auto_288164 ) ( ON ?auto_288162 ?auto_288163 ) ( ON ?auto_288161 ?auto_288162 ) ( CLEAR ?auto_288161 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_288161 )
      ( MAKE-6PILE ?auto_288161 ?auto_288162 ?auto_288163 ?auto_288164 ?auto_288165 ?auto_288166 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_288174 - BLOCK
      ?auto_288175 - BLOCK
      ?auto_288176 - BLOCK
      ?auto_288177 - BLOCK
      ?auto_288178 - BLOCK
      ?auto_288179 - BLOCK
    )
    :vars
    (
      ?auto_288180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288179 ?auto_288180 ) ( not ( = ?auto_288174 ?auto_288175 ) ) ( not ( = ?auto_288174 ?auto_288176 ) ) ( not ( = ?auto_288174 ?auto_288177 ) ) ( not ( = ?auto_288174 ?auto_288178 ) ) ( not ( = ?auto_288174 ?auto_288179 ) ) ( not ( = ?auto_288174 ?auto_288180 ) ) ( not ( = ?auto_288175 ?auto_288176 ) ) ( not ( = ?auto_288175 ?auto_288177 ) ) ( not ( = ?auto_288175 ?auto_288178 ) ) ( not ( = ?auto_288175 ?auto_288179 ) ) ( not ( = ?auto_288175 ?auto_288180 ) ) ( not ( = ?auto_288176 ?auto_288177 ) ) ( not ( = ?auto_288176 ?auto_288178 ) ) ( not ( = ?auto_288176 ?auto_288179 ) ) ( not ( = ?auto_288176 ?auto_288180 ) ) ( not ( = ?auto_288177 ?auto_288178 ) ) ( not ( = ?auto_288177 ?auto_288179 ) ) ( not ( = ?auto_288177 ?auto_288180 ) ) ( not ( = ?auto_288178 ?auto_288179 ) ) ( not ( = ?auto_288178 ?auto_288180 ) ) ( not ( = ?auto_288179 ?auto_288180 ) ) ( ON ?auto_288178 ?auto_288179 ) ( ON ?auto_288177 ?auto_288178 ) ( ON ?auto_288176 ?auto_288177 ) ( ON ?auto_288175 ?auto_288176 ) ( ON ?auto_288174 ?auto_288175 ) ( CLEAR ?auto_288174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_288174 )
      ( MAKE-6PILE ?auto_288174 ?auto_288175 ?auto_288176 ?auto_288177 ?auto_288178 ?auto_288179 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_288188 - BLOCK
      ?auto_288189 - BLOCK
      ?auto_288190 - BLOCK
      ?auto_288191 - BLOCK
      ?auto_288192 - BLOCK
      ?auto_288193 - BLOCK
      ?auto_288194 - BLOCK
    )
    :vars
    (
      ?auto_288195 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_288193 ) ( ON ?auto_288194 ?auto_288195 ) ( CLEAR ?auto_288194 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_288188 ) ( ON ?auto_288189 ?auto_288188 ) ( ON ?auto_288190 ?auto_288189 ) ( ON ?auto_288191 ?auto_288190 ) ( ON ?auto_288192 ?auto_288191 ) ( ON ?auto_288193 ?auto_288192 ) ( not ( = ?auto_288188 ?auto_288189 ) ) ( not ( = ?auto_288188 ?auto_288190 ) ) ( not ( = ?auto_288188 ?auto_288191 ) ) ( not ( = ?auto_288188 ?auto_288192 ) ) ( not ( = ?auto_288188 ?auto_288193 ) ) ( not ( = ?auto_288188 ?auto_288194 ) ) ( not ( = ?auto_288188 ?auto_288195 ) ) ( not ( = ?auto_288189 ?auto_288190 ) ) ( not ( = ?auto_288189 ?auto_288191 ) ) ( not ( = ?auto_288189 ?auto_288192 ) ) ( not ( = ?auto_288189 ?auto_288193 ) ) ( not ( = ?auto_288189 ?auto_288194 ) ) ( not ( = ?auto_288189 ?auto_288195 ) ) ( not ( = ?auto_288190 ?auto_288191 ) ) ( not ( = ?auto_288190 ?auto_288192 ) ) ( not ( = ?auto_288190 ?auto_288193 ) ) ( not ( = ?auto_288190 ?auto_288194 ) ) ( not ( = ?auto_288190 ?auto_288195 ) ) ( not ( = ?auto_288191 ?auto_288192 ) ) ( not ( = ?auto_288191 ?auto_288193 ) ) ( not ( = ?auto_288191 ?auto_288194 ) ) ( not ( = ?auto_288191 ?auto_288195 ) ) ( not ( = ?auto_288192 ?auto_288193 ) ) ( not ( = ?auto_288192 ?auto_288194 ) ) ( not ( = ?auto_288192 ?auto_288195 ) ) ( not ( = ?auto_288193 ?auto_288194 ) ) ( not ( = ?auto_288193 ?auto_288195 ) ) ( not ( = ?auto_288194 ?auto_288195 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_288194 ?auto_288195 )
      ( !STACK ?auto_288194 ?auto_288193 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_288203 - BLOCK
      ?auto_288204 - BLOCK
      ?auto_288205 - BLOCK
      ?auto_288206 - BLOCK
      ?auto_288207 - BLOCK
      ?auto_288208 - BLOCK
      ?auto_288209 - BLOCK
    )
    :vars
    (
      ?auto_288210 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_288208 ) ( ON ?auto_288209 ?auto_288210 ) ( CLEAR ?auto_288209 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_288203 ) ( ON ?auto_288204 ?auto_288203 ) ( ON ?auto_288205 ?auto_288204 ) ( ON ?auto_288206 ?auto_288205 ) ( ON ?auto_288207 ?auto_288206 ) ( ON ?auto_288208 ?auto_288207 ) ( not ( = ?auto_288203 ?auto_288204 ) ) ( not ( = ?auto_288203 ?auto_288205 ) ) ( not ( = ?auto_288203 ?auto_288206 ) ) ( not ( = ?auto_288203 ?auto_288207 ) ) ( not ( = ?auto_288203 ?auto_288208 ) ) ( not ( = ?auto_288203 ?auto_288209 ) ) ( not ( = ?auto_288203 ?auto_288210 ) ) ( not ( = ?auto_288204 ?auto_288205 ) ) ( not ( = ?auto_288204 ?auto_288206 ) ) ( not ( = ?auto_288204 ?auto_288207 ) ) ( not ( = ?auto_288204 ?auto_288208 ) ) ( not ( = ?auto_288204 ?auto_288209 ) ) ( not ( = ?auto_288204 ?auto_288210 ) ) ( not ( = ?auto_288205 ?auto_288206 ) ) ( not ( = ?auto_288205 ?auto_288207 ) ) ( not ( = ?auto_288205 ?auto_288208 ) ) ( not ( = ?auto_288205 ?auto_288209 ) ) ( not ( = ?auto_288205 ?auto_288210 ) ) ( not ( = ?auto_288206 ?auto_288207 ) ) ( not ( = ?auto_288206 ?auto_288208 ) ) ( not ( = ?auto_288206 ?auto_288209 ) ) ( not ( = ?auto_288206 ?auto_288210 ) ) ( not ( = ?auto_288207 ?auto_288208 ) ) ( not ( = ?auto_288207 ?auto_288209 ) ) ( not ( = ?auto_288207 ?auto_288210 ) ) ( not ( = ?auto_288208 ?auto_288209 ) ) ( not ( = ?auto_288208 ?auto_288210 ) ) ( not ( = ?auto_288209 ?auto_288210 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_288209 ?auto_288210 )
      ( !STACK ?auto_288209 ?auto_288208 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_288218 - BLOCK
      ?auto_288219 - BLOCK
      ?auto_288220 - BLOCK
      ?auto_288221 - BLOCK
      ?auto_288222 - BLOCK
      ?auto_288223 - BLOCK
      ?auto_288224 - BLOCK
    )
    :vars
    (
      ?auto_288225 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288224 ?auto_288225 ) ( ON-TABLE ?auto_288218 ) ( ON ?auto_288219 ?auto_288218 ) ( ON ?auto_288220 ?auto_288219 ) ( ON ?auto_288221 ?auto_288220 ) ( ON ?auto_288222 ?auto_288221 ) ( not ( = ?auto_288218 ?auto_288219 ) ) ( not ( = ?auto_288218 ?auto_288220 ) ) ( not ( = ?auto_288218 ?auto_288221 ) ) ( not ( = ?auto_288218 ?auto_288222 ) ) ( not ( = ?auto_288218 ?auto_288223 ) ) ( not ( = ?auto_288218 ?auto_288224 ) ) ( not ( = ?auto_288218 ?auto_288225 ) ) ( not ( = ?auto_288219 ?auto_288220 ) ) ( not ( = ?auto_288219 ?auto_288221 ) ) ( not ( = ?auto_288219 ?auto_288222 ) ) ( not ( = ?auto_288219 ?auto_288223 ) ) ( not ( = ?auto_288219 ?auto_288224 ) ) ( not ( = ?auto_288219 ?auto_288225 ) ) ( not ( = ?auto_288220 ?auto_288221 ) ) ( not ( = ?auto_288220 ?auto_288222 ) ) ( not ( = ?auto_288220 ?auto_288223 ) ) ( not ( = ?auto_288220 ?auto_288224 ) ) ( not ( = ?auto_288220 ?auto_288225 ) ) ( not ( = ?auto_288221 ?auto_288222 ) ) ( not ( = ?auto_288221 ?auto_288223 ) ) ( not ( = ?auto_288221 ?auto_288224 ) ) ( not ( = ?auto_288221 ?auto_288225 ) ) ( not ( = ?auto_288222 ?auto_288223 ) ) ( not ( = ?auto_288222 ?auto_288224 ) ) ( not ( = ?auto_288222 ?auto_288225 ) ) ( not ( = ?auto_288223 ?auto_288224 ) ) ( not ( = ?auto_288223 ?auto_288225 ) ) ( not ( = ?auto_288224 ?auto_288225 ) ) ( CLEAR ?auto_288222 ) ( ON ?auto_288223 ?auto_288224 ) ( CLEAR ?auto_288223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_288218 ?auto_288219 ?auto_288220 ?auto_288221 ?auto_288222 ?auto_288223 )
      ( MAKE-7PILE ?auto_288218 ?auto_288219 ?auto_288220 ?auto_288221 ?auto_288222 ?auto_288223 ?auto_288224 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_288233 - BLOCK
      ?auto_288234 - BLOCK
      ?auto_288235 - BLOCK
      ?auto_288236 - BLOCK
      ?auto_288237 - BLOCK
      ?auto_288238 - BLOCK
      ?auto_288239 - BLOCK
    )
    :vars
    (
      ?auto_288240 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288239 ?auto_288240 ) ( ON-TABLE ?auto_288233 ) ( ON ?auto_288234 ?auto_288233 ) ( ON ?auto_288235 ?auto_288234 ) ( ON ?auto_288236 ?auto_288235 ) ( ON ?auto_288237 ?auto_288236 ) ( not ( = ?auto_288233 ?auto_288234 ) ) ( not ( = ?auto_288233 ?auto_288235 ) ) ( not ( = ?auto_288233 ?auto_288236 ) ) ( not ( = ?auto_288233 ?auto_288237 ) ) ( not ( = ?auto_288233 ?auto_288238 ) ) ( not ( = ?auto_288233 ?auto_288239 ) ) ( not ( = ?auto_288233 ?auto_288240 ) ) ( not ( = ?auto_288234 ?auto_288235 ) ) ( not ( = ?auto_288234 ?auto_288236 ) ) ( not ( = ?auto_288234 ?auto_288237 ) ) ( not ( = ?auto_288234 ?auto_288238 ) ) ( not ( = ?auto_288234 ?auto_288239 ) ) ( not ( = ?auto_288234 ?auto_288240 ) ) ( not ( = ?auto_288235 ?auto_288236 ) ) ( not ( = ?auto_288235 ?auto_288237 ) ) ( not ( = ?auto_288235 ?auto_288238 ) ) ( not ( = ?auto_288235 ?auto_288239 ) ) ( not ( = ?auto_288235 ?auto_288240 ) ) ( not ( = ?auto_288236 ?auto_288237 ) ) ( not ( = ?auto_288236 ?auto_288238 ) ) ( not ( = ?auto_288236 ?auto_288239 ) ) ( not ( = ?auto_288236 ?auto_288240 ) ) ( not ( = ?auto_288237 ?auto_288238 ) ) ( not ( = ?auto_288237 ?auto_288239 ) ) ( not ( = ?auto_288237 ?auto_288240 ) ) ( not ( = ?auto_288238 ?auto_288239 ) ) ( not ( = ?auto_288238 ?auto_288240 ) ) ( not ( = ?auto_288239 ?auto_288240 ) ) ( CLEAR ?auto_288237 ) ( ON ?auto_288238 ?auto_288239 ) ( CLEAR ?auto_288238 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_288233 ?auto_288234 ?auto_288235 ?auto_288236 ?auto_288237 ?auto_288238 )
      ( MAKE-7PILE ?auto_288233 ?auto_288234 ?auto_288235 ?auto_288236 ?auto_288237 ?auto_288238 ?auto_288239 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_288248 - BLOCK
      ?auto_288249 - BLOCK
      ?auto_288250 - BLOCK
      ?auto_288251 - BLOCK
      ?auto_288252 - BLOCK
      ?auto_288253 - BLOCK
      ?auto_288254 - BLOCK
    )
    :vars
    (
      ?auto_288255 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288254 ?auto_288255 ) ( ON-TABLE ?auto_288248 ) ( ON ?auto_288249 ?auto_288248 ) ( ON ?auto_288250 ?auto_288249 ) ( ON ?auto_288251 ?auto_288250 ) ( not ( = ?auto_288248 ?auto_288249 ) ) ( not ( = ?auto_288248 ?auto_288250 ) ) ( not ( = ?auto_288248 ?auto_288251 ) ) ( not ( = ?auto_288248 ?auto_288252 ) ) ( not ( = ?auto_288248 ?auto_288253 ) ) ( not ( = ?auto_288248 ?auto_288254 ) ) ( not ( = ?auto_288248 ?auto_288255 ) ) ( not ( = ?auto_288249 ?auto_288250 ) ) ( not ( = ?auto_288249 ?auto_288251 ) ) ( not ( = ?auto_288249 ?auto_288252 ) ) ( not ( = ?auto_288249 ?auto_288253 ) ) ( not ( = ?auto_288249 ?auto_288254 ) ) ( not ( = ?auto_288249 ?auto_288255 ) ) ( not ( = ?auto_288250 ?auto_288251 ) ) ( not ( = ?auto_288250 ?auto_288252 ) ) ( not ( = ?auto_288250 ?auto_288253 ) ) ( not ( = ?auto_288250 ?auto_288254 ) ) ( not ( = ?auto_288250 ?auto_288255 ) ) ( not ( = ?auto_288251 ?auto_288252 ) ) ( not ( = ?auto_288251 ?auto_288253 ) ) ( not ( = ?auto_288251 ?auto_288254 ) ) ( not ( = ?auto_288251 ?auto_288255 ) ) ( not ( = ?auto_288252 ?auto_288253 ) ) ( not ( = ?auto_288252 ?auto_288254 ) ) ( not ( = ?auto_288252 ?auto_288255 ) ) ( not ( = ?auto_288253 ?auto_288254 ) ) ( not ( = ?auto_288253 ?auto_288255 ) ) ( not ( = ?auto_288254 ?auto_288255 ) ) ( ON ?auto_288253 ?auto_288254 ) ( CLEAR ?auto_288251 ) ( ON ?auto_288252 ?auto_288253 ) ( CLEAR ?auto_288252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_288248 ?auto_288249 ?auto_288250 ?auto_288251 ?auto_288252 )
      ( MAKE-7PILE ?auto_288248 ?auto_288249 ?auto_288250 ?auto_288251 ?auto_288252 ?auto_288253 ?auto_288254 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_288263 - BLOCK
      ?auto_288264 - BLOCK
      ?auto_288265 - BLOCK
      ?auto_288266 - BLOCK
      ?auto_288267 - BLOCK
      ?auto_288268 - BLOCK
      ?auto_288269 - BLOCK
    )
    :vars
    (
      ?auto_288270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288269 ?auto_288270 ) ( ON-TABLE ?auto_288263 ) ( ON ?auto_288264 ?auto_288263 ) ( ON ?auto_288265 ?auto_288264 ) ( ON ?auto_288266 ?auto_288265 ) ( not ( = ?auto_288263 ?auto_288264 ) ) ( not ( = ?auto_288263 ?auto_288265 ) ) ( not ( = ?auto_288263 ?auto_288266 ) ) ( not ( = ?auto_288263 ?auto_288267 ) ) ( not ( = ?auto_288263 ?auto_288268 ) ) ( not ( = ?auto_288263 ?auto_288269 ) ) ( not ( = ?auto_288263 ?auto_288270 ) ) ( not ( = ?auto_288264 ?auto_288265 ) ) ( not ( = ?auto_288264 ?auto_288266 ) ) ( not ( = ?auto_288264 ?auto_288267 ) ) ( not ( = ?auto_288264 ?auto_288268 ) ) ( not ( = ?auto_288264 ?auto_288269 ) ) ( not ( = ?auto_288264 ?auto_288270 ) ) ( not ( = ?auto_288265 ?auto_288266 ) ) ( not ( = ?auto_288265 ?auto_288267 ) ) ( not ( = ?auto_288265 ?auto_288268 ) ) ( not ( = ?auto_288265 ?auto_288269 ) ) ( not ( = ?auto_288265 ?auto_288270 ) ) ( not ( = ?auto_288266 ?auto_288267 ) ) ( not ( = ?auto_288266 ?auto_288268 ) ) ( not ( = ?auto_288266 ?auto_288269 ) ) ( not ( = ?auto_288266 ?auto_288270 ) ) ( not ( = ?auto_288267 ?auto_288268 ) ) ( not ( = ?auto_288267 ?auto_288269 ) ) ( not ( = ?auto_288267 ?auto_288270 ) ) ( not ( = ?auto_288268 ?auto_288269 ) ) ( not ( = ?auto_288268 ?auto_288270 ) ) ( not ( = ?auto_288269 ?auto_288270 ) ) ( ON ?auto_288268 ?auto_288269 ) ( CLEAR ?auto_288266 ) ( ON ?auto_288267 ?auto_288268 ) ( CLEAR ?auto_288267 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_288263 ?auto_288264 ?auto_288265 ?auto_288266 ?auto_288267 )
      ( MAKE-7PILE ?auto_288263 ?auto_288264 ?auto_288265 ?auto_288266 ?auto_288267 ?auto_288268 ?auto_288269 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_288278 - BLOCK
      ?auto_288279 - BLOCK
      ?auto_288280 - BLOCK
      ?auto_288281 - BLOCK
      ?auto_288282 - BLOCK
      ?auto_288283 - BLOCK
      ?auto_288284 - BLOCK
    )
    :vars
    (
      ?auto_288285 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288284 ?auto_288285 ) ( ON-TABLE ?auto_288278 ) ( ON ?auto_288279 ?auto_288278 ) ( ON ?auto_288280 ?auto_288279 ) ( not ( = ?auto_288278 ?auto_288279 ) ) ( not ( = ?auto_288278 ?auto_288280 ) ) ( not ( = ?auto_288278 ?auto_288281 ) ) ( not ( = ?auto_288278 ?auto_288282 ) ) ( not ( = ?auto_288278 ?auto_288283 ) ) ( not ( = ?auto_288278 ?auto_288284 ) ) ( not ( = ?auto_288278 ?auto_288285 ) ) ( not ( = ?auto_288279 ?auto_288280 ) ) ( not ( = ?auto_288279 ?auto_288281 ) ) ( not ( = ?auto_288279 ?auto_288282 ) ) ( not ( = ?auto_288279 ?auto_288283 ) ) ( not ( = ?auto_288279 ?auto_288284 ) ) ( not ( = ?auto_288279 ?auto_288285 ) ) ( not ( = ?auto_288280 ?auto_288281 ) ) ( not ( = ?auto_288280 ?auto_288282 ) ) ( not ( = ?auto_288280 ?auto_288283 ) ) ( not ( = ?auto_288280 ?auto_288284 ) ) ( not ( = ?auto_288280 ?auto_288285 ) ) ( not ( = ?auto_288281 ?auto_288282 ) ) ( not ( = ?auto_288281 ?auto_288283 ) ) ( not ( = ?auto_288281 ?auto_288284 ) ) ( not ( = ?auto_288281 ?auto_288285 ) ) ( not ( = ?auto_288282 ?auto_288283 ) ) ( not ( = ?auto_288282 ?auto_288284 ) ) ( not ( = ?auto_288282 ?auto_288285 ) ) ( not ( = ?auto_288283 ?auto_288284 ) ) ( not ( = ?auto_288283 ?auto_288285 ) ) ( not ( = ?auto_288284 ?auto_288285 ) ) ( ON ?auto_288283 ?auto_288284 ) ( ON ?auto_288282 ?auto_288283 ) ( CLEAR ?auto_288280 ) ( ON ?auto_288281 ?auto_288282 ) ( CLEAR ?auto_288281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_288278 ?auto_288279 ?auto_288280 ?auto_288281 )
      ( MAKE-7PILE ?auto_288278 ?auto_288279 ?auto_288280 ?auto_288281 ?auto_288282 ?auto_288283 ?auto_288284 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_288293 - BLOCK
      ?auto_288294 - BLOCK
      ?auto_288295 - BLOCK
      ?auto_288296 - BLOCK
      ?auto_288297 - BLOCK
      ?auto_288298 - BLOCK
      ?auto_288299 - BLOCK
    )
    :vars
    (
      ?auto_288300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288299 ?auto_288300 ) ( ON-TABLE ?auto_288293 ) ( ON ?auto_288294 ?auto_288293 ) ( ON ?auto_288295 ?auto_288294 ) ( not ( = ?auto_288293 ?auto_288294 ) ) ( not ( = ?auto_288293 ?auto_288295 ) ) ( not ( = ?auto_288293 ?auto_288296 ) ) ( not ( = ?auto_288293 ?auto_288297 ) ) ( not ( = ?auto_288293 ?auto_288298 ) ) ( not ( = ?auto_288293 ?auto_288299 ) ) ( not ( = ?auto_288293 ?auto_288300 ) ) ( not ( = ?auto_288294 ?auto_288295 ) ) ( not ( = ?auto_288294 ?auto_288296 ) ) ( not ( = ?auto_288294 ?auto_288297 ) ) ( not ( = ?auto_288294 ?auto_288298 ) ) ( not ( = ?auto_288294 ?auto_288299 ) ) ( not ( = ?auto_288294 ?auto_288300 ) ) ( not ( = ?auto_288295 ?auto_288296 ) ) ( not ( = ?auto_288295 ?auto_288297 ) ) ( not ( = ?auto_288295 ?auto_288298 ) ) ( not ( = ?auto_288295 ?auto_288299 ) ) ( not ( = ?auto_288295 ?auto_288300 ) ) ( not ( = ?auto_288296 ?auto_288297 ) ) ( not ( = ?auto_288296 ?auto_288298 ) ) ( not ( = ?auto_288296 ?auto_288299 ) ) ( not ( = ?auto_288296 ?auto_288300 ) ) ( not ( = ?auto_288297 ?auto_288298 ) ) ( not ( = ?auto_288297 ?auto_288299 ) ) ( not ( = ?auto_288297 ?auto_288300 ) ) ( not ( = ?auto_288298 ?auto_288299 ) ) ( not ( = ?auto_288298 ?auto_288300 ) ) ( not ( = ?auto_288299 ?auto_288300 ) ) ( ON ?auto_288298 ?auto_288299 ) ( ON ?auto_288297 ?auto_288298 ) ( CLEAR ?auto_288295 ) ( ON ?auto_288296 ?auto_288297 ) ( CLEAR ?auto_288296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_288293 ?auto_288294 ?auto_288295 ?auto_288296 )
      ( MAKE-7PILE ?auto_288293 ?auto_288294 ?auto_288295 ?auto_288296 ?auto_288297 ?auto_288298 ?auto_288299 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_288308 - BLOCK
      ?auto_288309 - BLOCK
      ?auto_288310 - BLOCK
      ?auto_288311 - BLOCK
      ?auto_288312 - BLOCK
      ?auto_288313 - BLOCK
      ?auto_288314 - BLOCK
    )
    :vars
    (
      ?auto_288315 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288314 ?auto_288315 ) ( ON-TABLE ?auto_288308 ) ( ON ?auto_288309 ?auto_288308 ) ( not ( = ?auto_288308 ?auto_288309 ) ) ( not ( = ?auto_288308 ?auto_288310 ) ) ( not ( = ?auto_288308 ?auto_288311 ) ) ( not ( = ?auto_288308 ?auto_288312 ) ) ( not ( = ?auto_288308 ?auto_288313 ) ) ( not ( = ?auto_288308 ?auto_288314 ) ) ( not ( = ?auto_288308 ?auto_288315 ) ) ( not ( = ?auto_288309 ?auto_288310 ) ) ( not ( = ?auto_288309 ?auto_288311 ) ) ( not ( = ?auto_288309 ?auto_288312 ) ) ( not ( = ?auto_288309 ?auto_288313 ) ) ( not ( = ?auto_288309 ?auto_288314 ) ) ( not ( = ?auto_288309 ?auto_288315 ) ) ( not ( = ?auto_288310 ?auto_288311 ) ) ( not ( = ?auto_288310 ?auto_288312 ) ) ( not ( = ?auto_288310 ?auto_288313 ) ) ( not ( = ?auto_288310 ?auto_288314 ) ) ( not ( = ?auto_288310 ?auto_288315 ) ) ( not ( = ?auto_288311 ?auto_288312 ) ) ( not ( = ?auto_288311 ?auto_288313 ) ) ( not ( = ?auto_288311 ?auto_288314 ) ) ( not ( = ?auto_288311 ?auto_288315 ) ) ( not ( = ?auto_288312 ?auto_288313 ) ) ( not ( = ?auto_288312 ?auto_288314 ) ) ( not ( = ?auto_288312 ?auto_288315 ) ) ( not ( = ?auto_288313 ?auto_288314 ) ) ( not ( = ?auto_288313 ?auto_288315 ) ) ( not ( = ?auto_288314 ?auto_288315 ) ) ( ON ?auto_288313 ?auto_288314 ) ( ON ?auto_288312 ?auto_288313 ) ( ON ?auto_288311 ?auto_288312 ) ( CLEAR ?auto_288309 ) ( ON ?auto_288310 ?auto_288311 ) ( CLEAR ?auto_288310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_288308 ?auto_288309 ?auto_288310 )
      ( MAKE-7PILE ?auto_288308 ?auto_288309 ?auto_288310 ?auto_288311 ?auto_288312 ?auto_288313 ?auto_288314 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_288323 - BLOCK
      ?auto_288324 - BLOCK
      ?auto_288325 - BLOCK
      ?auto_288326 - BLOCK
      ?auto_288327 - BLOCK
      ?auto_288328 - BLOCK
      ?auto_288329 - BLOCK
    )
    :vars
    (
      ?auto_288330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288329 ?auto_288330 ) ( ON-TABLE ?auto_288323 ) ( ON ?auto_288324 ?auto_288323 ) ( not ( = ?auto_288323 ?auto_288324 ) ) ( not ( = ?auto_288323 ?auto_288325 ) ) ( not ( = ?auto_288323 ?auto_288326 ) ) ( not ( = ?auto_288323 ?auto_288327 ) ) ( not ( = ?auto_288323 ?auto_288328 ) ) ( not ( = ?auto_288323 ?auto_288329 ) ) ( not ( = ?auto_288323 ?auto_288330 ) ) ( not ( = ?auto_288324 ?auto_288325 ) ) ( not ( = ?auto_288324 ?auto_288326 ) ) ( not ( = ?auto_288324 ?auto_288327 ) ) ( not ( = ?auto_288324 ?auto_288328 ) ) ( not ( = ?auto_288324 ?auto_288329 ) ) ( not ( = ?auto_288324 ?auto_288330 ) ) ( not ( = ?auto_288325 ?auto_288326 ) ) ( not ( = ?auto_288325 ?auto_288327 ) ) ( not ( = ?auto_288325 ?auto_288328 ) ) ( not ( = ?auto_288325 ?auto_288329 ) ) ( not ( = ?auto_288325 ?auto_288330 ) ) ( not ( = ?auto_288326 ?auto_288327 ) ) ( not ( = ?auto_288326 ?auto_288328 ) ) ( not ( = ?auto_288326 ?auto_288329 ) ) ( not ( = ?auto_288326 ?auto_288330 ) ) ( not ( = ?auto_288327 ?auto_288328 ) ) ( not ( = ?auto_288327 ?auto_288329 ) ) ( not ( = ?auto_288327 ?auto_288330 ) ) ( not ( = ?auto_288328 ?auto_288329 ) ) ( not ( = ?auto_288328 ?auto_288330 ) ) ( not ( = ?auto_288329 ?auto_288330 ) ) ( ON ?auto_288328 ?auto_288329 ) ( ON ?auto_288327 ?auto_288328 ) ( ON ?auto_288326 ?auto_288327 ) ( CLEAR ?auto_288324 ) ( ON ?auto_288325 ?auto_288326 ) ( CLEAR ?auto_288325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_288323 ?auto_288324 ?auto_288325 )
      ( MAKE-7PILE ?auto_288323 ?auto_288324 ?auto_288325 ?auto_288326 ?auto_288327 ?auto_288328 ?auto_288329 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_288338 - BLOCK
      ?auto_288339 - BLOCK
      ?auto_288340 - BLOCK
      ?auto_288341 - BLOCK
      ?auto_288342 - BLOCK
      ?auto_288343 - BLOCK
      ?auto_288344 - BLOCK
    )
    :vars
    (
      ?auto_288345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288344 ?auto_288345 ) ( ON-TABLE ?auto_288338 ) ( not ( = ?auto_288338 ?auto_288339 ) ) ( not ( = ?auto_288338 ?auto_288340 ) ) ( not ( = ?auto_288338 ?auto_288341 ) ) ( not ( = ?auto_288338 ?auto_288342 ) ) ( not ( = ?auto_288338 ?auto_288343 ) ) ( not ( = ?auto_288338 ?auto_288344 ) ) ( not ( = ?auto_288338 ?auto_288345 ) ) ( not ( = ?auto_288339 ?auto_288340 ) ) ( not ( = ?auto_288339 ?auto_288341 ) ) ( not ( = ?auto_288339 ?auto_288342 ) ) ( not ( = ?auto_288339 ?auto_288343 ) ) ( not ( = ?auto_288339 ?auto_288344 ) ) ( not ( = ?auto_288339 ?auto_288345 ) ) ( not ( = ?auto_288340 ?auto_288341 ) ) ( not ( = ?auto_288340 ?auto_288342 ) ) ( not ( = ?auto_288340 ?auto_288343 ) ) ( not ( = ?auto_288340 ?auto_288344 ) ) ( not ( = ?auto_288340 ?auto_288345 ) ) ( not ( = ?auto_288341 ?auto_288342 ) ) ( not ( = ?auto_288341 ?auto_288343 ) ) ( not ( = ?auto_288341 ?auto_288344 ) ) ( not ( = ?auto_288341 ?auto_288345 ) ) ( not ( = ?auto_288342 ?auto_288343 ) ) ( not ( = ?auto_288342 ?auto_288344 ) ) ( not ( = ?auto_288342 ?auto_288345 ) ) ( not ( = ?auto_288343 ?auto_288344 ) ) ( not ( = ?auto_288343 ?auto_288345 ) ) ( not ( = ?auto_288344 ?auto_288345 ) ) ( ON ?auto_288343 ?auto_288344 ) ( ON ?auto_288342 ?auto_288343 ) ( ON ?auto_288341 ?auto_288342 ) ( ON ?auto_288340 ?auto_288341 ) ( CLEAR ?auto_288338 ) ( ON ?auto_288339 ?auto_288340 ) ( CLEAR ?auto_288339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_288338 ?auto_288339 )
      ( MAKE-7PILE ?auto_288338 ?auto_288339 ?auto_288340 ?auto_288341 ?auto_288342 ?auto_288343 ?auto_288344 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_288353 - BLOCK
      ?auto_288354 - BLOCK
      ?auto_288355 - BLOCK
      ?auto_288356 - BLOCK
      ?auto_288357 - BLOCK
      ?auto_288358 - BLOCK
      ?auto_288359 - BLOCK
    )
    :vars
    (
      ?auto_288360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288359 ?auto_288360 ) ( ON-TABLE ?auto_288353 ) ( not ( = ?auto_288353 ?auto_288354 ) ) ( not ( = ?auto_288353 ?auto_288355 ) ) ( not ( = ?auto_288353 ?auto_288356 ) ) ( not ( = ?auto_288353 ?auto_288357 ) ) ( not ( = ?auto_288353 ?auto_288358 ) ) ( not ( = ?auto_288353 ?auto_288359 ) ) ( not ( = ?auto_288353 ?auto_288360 ) ) ( not ( = ?auto_288354 ?auto_288355 ) ) ( not ( = ?auto_288354 ?auto_288356 ) ) ( not ( = ?auto_288354 ?auto_288357 ) ) ( not ( = ?auto_288354 ?auto_288358 ) ) ( not ( = ?auto_288354 ?auto_288359 ) ) ( not ( = ?auto_288354 ?auto_288360 ) ) ( not ( = ?auto_288355 ?auto_288356 ) ) ( not ( = ?auto_288355 ?auto_288357 ) ) ( not ( = ?auto_288355 ?auto_288358 ) ) ( not ( = ?auto_288355 ?auto_288359 ) ) ( not ( = ?auto_288355 ?auto_288360 ) ) ( not ( = ?auto_288356 ?auto_288357 ) ) ( not ( = ?auto_288356 ?auto_288358 ) ) ( not ( = ?auto_288356 ?auto_288359 ) ) ( not ( = ?auto_288356 ?auto_288360 ) ) ( not ( = ?auto_288357 ?auto_288358 ) ) ( not ( = ?auto_288357 ?auto_288359 ) ) ( not ( = ?auto_288357 ?auto_288360 ) ) ( not ( = ?auto_288358 ?auto_288359 ) ) ( not ( = ?auto_288358 ?auto_288360 ) ) ( not ( = ?auto_288359 ?auto_288360 ) ) ( ON ?auto_288358 ?auto_288359 ) ( ON ?auto_288357 ?auto_288358 ) ( ON ?auto_288356 ?auto_288357 ) ( ON ?auto_288355 ?auto_288356 ) ( CLEAR ?auto_288353 ) ( ON ?auto_288354 ?auto_288355 ) ( CLEAR ?auto_288354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_288353 ?auto_288354 )
      ( MAKE-7PILE ?auto_288353 ?auto_288354 ?auto_288355 ?auto_288356 ?auto_288357 ?auto_288358 ?auto_288359 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_288368 - BLOCK
      ?auto_288369 - BLOCK
      ?auto_288370 - BLOCK
      ?auto_288371 - BLOCK
      ?auto_288372 - BLOCK
      ?auto_288373 - BLOCK
      ?auto_288374 - BLOCK
    )
    :vars
    (
      ?auto_288375 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288374 ?auto_288375 ) ( not ( = ?auto_288368 ?auto_288369 ) ) ( not ( = ?auto_288368 ?auto_288370 ) ) ( not ( = ?auto_288368 ?auto_288371 ) ) ( not ( = ?auto_288368 ?auto_288372 ) ) ( not ( = ?auto_288368 ?auto_288373 ) ) ( not ( = ?auto_288368 ?auto_288374 ) ) ( not ( = ?auto_288368 ?auto_288375 ) ) ( not ( = ?auto_288369 ?auto_288370 ) ) ( not ( = ?auto_288369 ?auto_288371 ) ) ( not ( = ?auto_288369 ?auto_288372 ) ) ( not ( = ?auto_288369 ?auto_288373 ) ) ( not ( = ?auto_288369 ?auto_288374 ) ) ( not ( = ?auto_288369 ?auto_288375 ) ) ( not ( = ?auto_288370 ?auto_288371 ) ) ( not ( = ?auto_288370 ?auto_288372 ) ) ( not ( = ?auto_288370 ?auto_288373 ) ) ( not ( = ?auto_288370 ?auto_288374 ) ) ( not ( = ?auto_288370 ?auto_288375 ) ) ( not ( = ?auto_288371 ?auto_288372 ) ) ( not ( = ?auto_288371 ?auto_288373 ) ) ( not ( = ?auto_288371 ?auto_288374 ) ) ( not ( = ?auto_288371 ?auto_288375 ) ) ( not ( = ?auto_288372 ?auto_288373 ) ) ( not ( = ?auto_288372 ?auto_288374 ) ) ( not ( = ?auto_288372 ?auto_288375 ) ) ( not ( = ?auto_288373 ?auto_288374 ) ) ( not ( = ?auto_288373 ?auto_288375 ) ) ( not ( = ?auto_288374 ?auto_288375 ) ) ( ON ?auto_288373 ?auto_288374 ) ( ON ?auto_288372 ?auto_288373 ) ( ON ?auto_288371 ?auto_288372 ) ( ON ?auto_288370 ?auto_288371 ) ( ON ?auto_288369 ?auto_288370 ) ( ON ?auto_288368 ?auto_288369 ) ( CLEAR ?auto_288368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_288368 )
      ( MAKE-7PILE ?auto_288368 ?auto_288369 ?auto_288370 ?auto_288371 ?auto_288372 ?auto_288373 ?auto_288374 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_288383 - BLOCK
      ?auto_288384 - BLOCK
      ?auto_288385 - BLOCK
      ?auto_288386 - BLOCK
      ?auto_288387 - BLOCK
      ?auto_288388 - BLOCK
      ?auto_288389 - BLOCK
    )
    :vars
    (
      ?auto_288390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288389 ?auto_288390 ) ( not ( = ?auto_288383 ?auto_288384 ) ) ( not ( = ?auto_288383 ?auto_288385 ) ) ( not ( = ?auto_288383 ?auto_288386 ) ) ( not ( = ?auto_288383 ?auto_288387 ) ) ( not ( = ?auto_288383 ?auto_288388 ) ) ( not ( = ?auto_288383 ?auto_288389 ) ) ( not ( = ?auto_288383 ?auto_288390 ) ) ( not ( = ?auto_288384 ?auto_288385 ) ) ( not ( = ?auto_288384 ?auto_288386 ) ) ( not ( = ?auto_288384 ?auto_288387 ) ) ( not ( = ?auto_288384 ?auto_288388 ) ) ( not ( = ?auto_288384 ?auto_288389 ) ) ( not ( = ?auto_288384 ?auto_288390 ) ) ( not ( = ?auto_288385 ?auto_288386 ) ) ( not ( = ?auto_288385 ?auto_288387 ) ) ( not ( = ?auto_288385 ?auto_288388 ) ) ( not ( = ?auto_288385 ?auto_288389 ) ) ( not ( = ?auto_288385 ?auto_288390 ) ) ( not ( = ?auto_288386 ?auto_288387 ) ) ( not ( = ?auto_288386 ?auto_288388 ) ) ( not ( = ?auto_288386 ?auto_288389 ) ) ( not ( = ?auto_288386 ?auto_288390 ) ) ( not ( = ?auto_288387 ?auto_288388 ) ) ( not ( = ?auto_288387 ?auto_288389 ) ) ( not ( = ?auto_288387 ?auto_288390 ) ) ( not ( = ?auto_288388 ?auto_288389 ) ) ( not ( = ?auto_288388 ?auto_288390 ) ) ( not ( = ?auto_288389 ?auto_288390 ) ) ( ON ?auto_288388 ?auto_288389 ) ( ON ?auto_288387 ?auto_288388 ) ( ON ?auto_288386 ?auto_288387 ) ( ON ?auto_288385 ?auto_288386 ) ( ON ?auto_288384 ?auto_288385 ) ( ON ?auto_288383 ?auto_288384 ) ( CLEAR ?auto_288383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_288383 )
      ( MAKE-7PILE ?auto_288383 ?auto_288384 ?auto_288385 ?auto_288386 ?auto_288387 ?auto_288388 ?auto_288389 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_288399 - BLOCK
      ?auto_288400 - BLOCK
      ?auto_288401 - BLOCK
      ?auto_288402 - BLOCK
      ?auto_288403 - BLOCK
      ?auto_288404 - BLOCK
      ?auto_288405 - BLOCK
      ?auto_288406 - BLOCK
    )
    :vars
    (
      ?auto_288407 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_288405 ) ( ON ?auto_288406 ?auto_288407 ) ( CLEAR ?auto_288406 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_288399 ) ( ON ?auto_288400 ?auto_288399 ) ( ON ?auto_288401 ?auto_288400 ) ( ON ?auto_288402 ?auto_288401 ) ( ON ?auto_288403 ?auto_288402 ) ( ON ?auto_288404 ?auto_288403 ) ( ON ?auto_288405 ?auto_288404 ) ( not ( = ?auto_288399 ?auto_288400 ) ) ( not ( = ?auto_288399 ?auto_288401 ) ) ( not ( = ?auto_288399 ?auto_288402 ) ) ( not ( = ?auto_288399 ?auto_288403 ) ) ( not ( = ?auto_288399 ?auto_288404 ) ) ( not ( = ?auto_288399 ?auto_288405 ) ) ( not ( = ?auto_288399 ?auto_288406 ) ) ( not ( = ?auto_288399 ?auto_288407 ) ) ( not ( = ?auto_288400 ?auto_288401 ) ) ( not ( = ?auto_288400 ?auto_288402 ) ) ( not ( = ?auto_288400 ?auto_288403 ) ) ( not ( = ?auto_288400 ?auto_288404 ) ) ( not ( = ?auto_288400 ?auto_288405 ) ) ( not ( = ?auto_288400 ?auto_288406 ) ) ( not ( = ?auto_288400 ?auto_288407 ) ) ( not ( = ?auto_288401 ?auto_288402 ) ) ( not ( = ?auto_288401 ?auto_288403 ) ) ( not ( = ?auto_288401 ?auto_288404 ) ) ( not ( = ?auto_288401 ?auto_288405 ) ) ( not ( = ?auto_288401 ?auto_288406 ) ) ( not ( = ?auto_288401 ?auto_288407 ) ) ( not ( = ?auto_288402 ?auto_288403 ) ) ( not ( = ?auto_288402 ?auto_288404 ) ) ( not ( = ?auto_288402 ?auto_288405 ) ) ( not ( = ?auto_288402 ?auto_288406 ) ) ( not ( = ?auto_288402 ?auto_288407 ) ) ( not ( = ?auto_288403 ?auto_288404 ) ) ( not ( = ?auto_288403 ?auto_288405 ) ) ( not ( = ?auto_288403 ?auto_288406 ) ) ( not ( = ?auto_288403 ?auto_288407 ) ) ( not ( = ?auto_288404 ?auto_288405 ) ) ( not ( = ?auto_288404 ?auto_288406 ) ) ( not ( = ?auto_288404 ?auto_288407 ) ) ( not ( = ?auto_288405 ?auto_288406 ) ) ( not ( = ?auto_288405 ?auto_288407 ) ) ( not ( = ?auto_288406 ?auto_288407 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_288406 ?auto_288407 )
      ( !STACK ?auto_288406 ?auto_288405 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_288416 - BLOCK
      ?auto_288417 - BLOCK
      ?auto_288418 - BLOCK
      ?auto_288419 - BLOCK
      ?auto_288420 - BLOCK
      ?auto_288421 - BLOCK
      ?auto_288422 - BLOCK
      ?auto_288423 - BLOCK
    )
    :vars
    (
      ?auto_288424 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_288422 ) ( ON ?auto_288423 ?auto_288424 ) ( CLEAR ?auto_288423 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_288416 ) ( ON ?auto_288417 ?auto_288416 ) ( ON ?auto_288418 ?auto_288417 ) ( ON ?auto_288419 ?auto_288418 ) ( ON ?auto_288420 ?auto_288419 ) ( ON ?auto_288421 ?auto_288420 ) ( ON ?auto_288422 ?auto_288421 ) ( not ( = ?auto_288416 ?auto_288417 ) ) ( not ( = ?auto_288416 ?auto_288418 ) ) ( not ( = ?auto_288416 ?auto_288419 ) ) ( not ( = ?auto_288416 ?auto_288420 ) ) ( not ( = ?auto_288416 ?auto_288421 ) ) ( not ( = ?auto_288416 ?auto_288422 ) ) ( not ( = ?auto_288416 ?auto_288423 ) ) ( not ( = ?auto_288416 ?auto_288424 ) ) ( not ( = ?auto_288417 ?auto_288418 ) ) ( not ( = ?auto_288417 ?auto_288419 ) ) ( not ( = ?auto_288417 ?auto_288420 ) ) ( not ( = ?auto_288417 ?auto_288421 ) ) ( not ( = ?auto_288417 ?auto_288422 ) ) ( not ( = ?auto_288417 ?auto_288423 ) ) ( not ( = ?auto_288417 ?auto_288424 ) ) ( not ( = ?auto_288418 ?auto_288419 ) ) ( not ( = ?auto_288418 ?auto_288420 ) ) ( not ( = ?auto_288418 ?auto_288421 ) ) ( not ( = ?auto_288418 ?auto_288422 ) ) ( not ( = ?auto_288418 ?auto_288423 ) ) ( not ( = ?auto_288418 ?auto_288424 ) ) ( not ( = ?auto_288419 ?auto_288420 ) ) ( not ( = ?auto_288419 ?auto_288421 ) ) ( not ( = ?auto_288419 ?auto_288422 ) ) ( not ( = ?auto_288419 ?auto_288423 ) ) ( not ( = ?auto_288419 ?auto_288424 ) ) ( not ( = ?auto_288420 ?auto_288421 ) ) ( not ( = ?auto_288420 ?auto_288422 ) ) ( not ( = ?auto_288420 ?auto_288423 ) ) ( not ( = ?auto_288420 ?auto_288424 ) ) ( not ( = ?auto_288421 ?auto_288422 ) ) ( not ( = ?auto_288421 ?auto_288423 ) ) ( not ( = ?auto_288421 ?auto_288424 ) ) ( not ( = ?auto_288422 ?auto_288423 ) ) ( not ( = ?auto_288422 ?auto_288424 ) ) ( not ( = ?auto_288423 ?auto_288424 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_288423 ?auto_288424 )
      ( !STACK ?auto_288423 ?auto_288422 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_288433 - BLOCK
      ?auto_288434 - BLOCK
      ?auto_288435 - BLOCK
      ?auto_288436 - BLOCK
      ?auto_288437 - BLOCK
      ?auto_288438 - BLOCK
      ?auto_288439 - BLOCK
      ?auto_288440 - BLOCK
    )
    :vars
    (
      ?auto_288441 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288440 ?auto_288441 ) ( ON-TABLE ?auto_288433 ) ( ON ?auto_288434 ?auto_288433 ) ( ON ?auto_288435 ?auto_288434 ) ( ON ?auto_288436 ?auto_288435 ) ( ON ?auto_288437 ?auto_288436 ) ( ON ?auto_288438 ?auto_288437 ) ( not ( = ?auto_288433 ?auto_288434 ) ) ( not ( = ?auto_288433 ?auto_288435 ) ) ( not ( = ?auto_288433 ?auto_288436 ) ) ( not ( = ?auto_288433 ?auto_288437 ) ) ( not ( = ?auto_288433 ?auto_288438 ) ) ( not ( = ?auto_288433 ?auto_288439 ) ) ( not ( = ?auto_288433 ?auto_288440 ) ) ( not ( = ?auto_288433 ?auto_288441 ) ) ( not ( = ?auto_288434 ?auto_288435 ) ) ( not ( = ?auto_288434 ?auto_288436 ) ) ( not ( = ?auto_288434 ?auto_288437 ) ) ( not ( = ?auto_288434 ?auto_288438 ) ) ( not ( = ?auto_288434 ?auto_288439 ) ) ( not ( = ?auto_288434 ?auto_288440 ) ) ( not ( = ?auto_288434 ?auto_288441 ) ) ( not ( = ?auto_288435 ?auto_288436 ) ) ( not ( = ?auto_288435 ?auto_288437 ) ) ( not ( = ?auto_288435 ?auto_288438 ) ) ( not ( = ?auto_288435 ?auto_288439 ) ) ( not ( = ?auto_288435 ?auto_288440 ) ) ( not ( = ?auto_288435 ?auto_288441 ) ) ( not ( = ?auto_288436 ?auto_288437 ) ) ( not ( = ?auto_288436 ?auto_288438 ) ) ( not ( = ?auto_288436 ?auto_288439 ) ) ( not ( = ?auto_288436 ?auto_288440 ) ) ( not ( = ?auto_288436 ?auto_288441 ) ) ( not ( = ?auto_288437 ?auto_288438 ) ) ( not ( = ?auto_288437 ?auto_288439 ) ) ( not ( = ?auto_288437 ?auto_288440 ) ) ( not ( = ?auto_288437 ?auto_288441 ) ) ( not ( = ?auto_288438 ?auto_288439 ) ) ( not ( = ?auto_288438 ?auto_288440 ) ) ( not ( = ?auto_288438 ?auto_288441 ) ) ( not ( = ?auto_288439 ?auto_288440 ) ) ( not ( = ?auto_288439 ?auto_288441 ) ) ( not ( = ?auto_288440 ?auto_288441 ) ) ( CLEAR ?auto_288438 ) ( ON ?auto_288439 ?auto_288440 ) ( CLEAR ?auto_288439 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_288433 ?auto_288434 ?auto_288435 ?auto_288436 ?auto_288437 ?auto_288438 ?auto_288439 )
      ( MAKE-8PILE ?auto_288433 ?auto_288434 ?auto_288435 ?auto_288436 ?auto_288437 ?auto_288438 ?auto_288439 ?auto_288440 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_288450 - BLOCK
      ?auto_288451 - BLOCK
      ?auto_288452 - BLOCK
      ?auto_288453 - BLOCK
      ?auto_288454 - BLOCK
      ?auto_288455 - BLOCK
      ?auto_288456 - BLOCK
      ?auto_288457 - BLOCK
    )
    :vars
    (
      ?auto_288458 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288457 ?auto_288458 ) ( ON-TABLE ?auto_288450 ) ( ON ?auto_288451 ?auto_288450 ) ( ON ?auto_288452 ?auto_288451 ) ( ON ?auto_288453 ?auto_288452 ) ( ON ?auto_288454 ?auto_288453 ) ( ON ?auto_288455 ?auto_288454 ) ( not ( = ?auto_288450 ?auto_288451 ) ) ( not ( = ?auto_288450 ?auto_288452 ) ) ( not ( = ?auto_288450 ?auto_288453 ) ) ( not ( = ?auto_288450 ?auto_288454 ) ) ( not ( = ?auto_288450 ?auto_288455 ) ) ( not ( = ?auto_288450 ?auto_288456 ) ) ( not ( = ?auto_288450 ?auto_288457 ) ) ( not ( = ?auto_288450 ?auto_288458 ) ) ( not ( = ?auto_288451 ?auto_288452 ) ) ( not ( = ?auto_288451 ?auto_288453 ) ) ( not ( = ?auto_288451 ?auto_288454 ) ) ( not ( = ?auto_288451 ?auto_288455 ) ) ( not ( = ?auto_288451 ?auto_288456 ) ) ( not ( = ?auto_288451 ?auto_288457 ) ) ( not ( = ?auto_288451 ?auto_288458 ) ) ( not ( = ?auto_288452 ?auto_288453 ) ) ( not ( = ?auto_288452 ?auto_288454 ) ) ( not ( = ?auto_288452 ?auto_288455 ) ) ( not ( = ?auto_288452 ?auto_288456 ) ) ( not ( = ?auto_288452 ?auto_288457 ) ) ( not ( = ?auto_288452 ?auto_288458 ) ) ( not ( = ?auto_288453 ?auto_288454 ) ) ( not ( = ?auto_288453 ?auto_288455 ) ) ( not ( = ?auto_288453 ?auto_288456 ) ) ( not ( = ?auto_288453 ?auto_288457 ) ) ( not ( = ?auto_288453 ?auto_288458 ) ) ( not ( = ?auto_288454 ?auto_288455 ) ) ( not ( = ?auto_288454 ?auto_288456 ) ) ( not ( = ?auto_288454 ?auto_288457 ) ) ( not ( = ?auto_288454 ?auto_288458 ) ) ( not ( = ?auto_288455 ?auto_288456 ) ) ( not ( = ?auto_288455 ?auto_288457 ) ) ( not ( = ?auto_288455 ?auto_288458 ) ) ( not ( = ?auto_288456 ?auto_288457 ) ) ( not ( = ?auto_288456 ?auto_288458 ) ) ( not ( = ?auto_288457 ?auto_288458 ) ) ( CLEAR ?auto_288455 ) ( ON ?auto_288456 ?auto_288457 ) ( CLEAR ?auto_288456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_288450 ?auto_288451 ?auto_288452 ?auto_288453 ?auto_288454 ?auto_288455 ?auto_288456 )
      ( MAKE-8PILE ?auto_288450 ?auto_288451 ?auto_288452 ?auto_288453 ?auto_288454 ?auto_288455 ?auto_288456 ?auto_288457 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_288467 - BLOCK
      ?auto_288468 - BLOCK
      ?auto_288469 - BLOCK
      ?auto_288470 - BLOCK
      ?auto_288471 - BLOCK
      ?auto_288472 - BLOCK
      ?auto_288473 - BLOCK
      ?auto_288474 - BLOCK
    )
    :vars
    (
      ?auto_288475 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288474 ?auto_288475 ) ( ON-TABLE ?auto_288467 ) ( ON ?auto_288468 ?auto_288467 ) ( ON ?auto_288469 ?auto_288468 ) ( ON ?auto_288470 ?auto_288469 ) ( ON ?auto_288471 ?auto_288470 ) ( not ( = ?auto_288467 ?auto_288468 ) ) ( not ( = ?auto_288467 ?auto_288469 ) ) ( not ( = ?auto_288467 ?auto_288470 ) ) ( not ( = ?auto_288467 ?auto_288471 ) ) ( not ( = ?auto_288467 ?auto_288472 ) ) ( not ( = ?auto_288467 ?auto_288473 ) ) ( not ( = ?auto_288467 ?auto_288474 ) ) ( not ( = ?auto_288467 ?auto_288475 ) ) ( not ( = ?auto_288468 ?auto_288469 ) ) ( not ( = ?auto_288468 ?auto_288470 ) ) ( not ( = ?auto_288468 ?auto_288471 ) ) ( not ( = ?auto_288468 ?auto_288472 ) ) ( not ( = ?auto_288468 ?auto_288473 ) ) ( not ( = ?auto_288468 ?auto_288474 ) ) ( not ( = ?auto_288468 ?auto_288475 ) ) ( not ( = ?auto_288469 ?auto_288470 ) ) ( not ( = ?auto_288469 ?auto_288471 ) ) ( not ( = ?auto_288469 ?auto_288472 ) ) ( not ( = ?auto_288469 ?auto_288473 ) ) ( not ( = ?auto_288469 ?auto_288474 ) ) ( not ( = ?auto_288469 ?auto_288475 ) ) ( not ( = ?auto_288470 ?auto_288471 ) ) ( not ( = ?auto_288470 ?auto_288472 ) ) ( not ( = ?auto_288470 ?auto_288473 ) ) ( not ( = ?auto_288470 ?auto_288474 ) ) ( not ( = ?auto_288470 ?auto_288475 ) ) ( not ( = ?auto_288471 ?auto_288472 ) ) ( not ( = ?auto_288471 ?auto_288473 ) ) ( not ( = ?auto_288471 ?auto_288474 ) ) ( not ( = ?auto_288471 ?auto_288475 ) ) ( not ( = ?auto_288472 ?auto_288473 ) ) ( not ( = ?auto_288472 ?auto_288474 ) ) ( not ( = ?auto_288472 ?auto_288475 ) ) ( not ( = ?auto_288473 ?auto_288474 ) ) ( not ( = ?auto_288473 ?auto_288475 ) ) ( not ( = ?auto_288474 ?auto_288475 ) ) ( ON ?auto_288473 ?auto_288474 ) ( CLEAR ?auto_288471 ) ( ON ?auto_288472 ?auto_288473 ) ( CLEAR ?auto_288472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_288467 ?auto_288468 ?auto_288469 ?auto_288470 ?auto_288471 ?auto_288472 )
      ( MAKE-8PILE ?auto_288467 ?auto_288468 ?auto_288469 ?auto_288470 ?auto_288471 ?auto_288472 ?auto_288473 ?auto_288474 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_288484 - BLOCK
      ?auto_288485 - BLOCK
      ?auto_288486 - BLOCK
      ?auto_288487 - BLOCK
      ?auto_288488 - BLOCK
      ?auto_288489 - BLOCK
      ?auto_288490 - BLOCK
      ?auto_288491 - BLOCK
    )
    :vars
    (
      ?auto_288492 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288491 ?auto_288492 ) ( ON-TABLE ?auto_288484 ) ( ON ?auto_288485 ?auto_288484 ) ( ON ?auto_288486 ?auto_288485 ) ( ON ?auto_288487 ?auto_288486 ) ( ON ?auto_288488 ?auto_288487 ) ( not ( = ?auto_288484 ?auto_288485 ) ) ( not ( = ?auto_288484 ?auto_288486 ) ) ( not ( = ?auto_288484 ?auto_288487 ) ) ( not ( = ?auto_288484 ?auto_288488 ) ) ( not ( = ?auto_288484 ?auto_288489 ) ) ( not ( = ?auto_288484 ?auto_288490 ) ) ( not ( = ?auto_288484 ?auto_288491 ) ) ( not ( = ?auto_288484 ?auto_288492 ) ) ( not ( = ?auto_288485 ?auto_288486 ) ) ( not ( = ?auto_288485 ?auto_288487 ) ) ( not ( = ?auto_288485 ?auto_288488 ) ) ( not ( = ?auto_288485 ?auto_288489 ) ) ( not ( = ?auto_288485 ?auto_288490 ) ) ( not ( = ?auto_288485 ?auto_288491 ) ) ( not ( = ?auto_288485 ?auto_288492 ) ) ( not ( = ?auto_288486 ?auto_288487 ) ) ( not ( = ?auto_288486 ?auto_288488 ) ) ( not ( = ?auto_288486 ?auto_288489 ) ) ( not ( = ?auto_288486 ?auto_288490 ) ) ( not ( = ?auto_288486 ?auto_288491 ) ) ( not ( = ?auto_288486 ?auto_288492 ) ) ( not ( = ?auto_288487 ?auto_288488 ) ) ( not ( = ?auto_288487 ?auto_288489 ) ) ( not ( = ?auto_288487 ?auto_288490 ) ) ( not ( = ?auto_288487 ?auto_288491 ) ) ( not ( = ?auto_288487 ?auto_288492 ) ) ( not ( = ?auto_288488 ?auto_288489 ) ) ( not ( = ?auto_288488 ?auto_288490 ) ) ( not ( = ?auto_288488 ?auto_288491 ) ) ( not ( = ?auto_288488 ?auto_288492 ) ) ( not ( = ?auto_288489 ?auto_288490 ) ) ( not ( = ?auto_288489 ?auto_288491 ) ) ( not ( = ?auto_288489 ?auto_288492 ) ) ( not ( = ?auto_288490 ?auto_288491 ) ) ( not ( = ?auto_288490 ?auto_288492 ) ) ( not ( = ?auto_288491 ?auto_288492 ) ) ( ON ?auto_288490 ?auto_288491 ) ( CLEAR ?auto_288488 ) ( ON ?auto_288489 ?auto_288490 ) ( CLEAR ?auto_288489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_288484 ?auto_288485 ?auto_288486 ?auto_288487 ?auto_288488 ?auto_288489 )
      ( MAKE-8PILE ?auto_288484 ?auto_288485 ?auto_288486 ?auto_288487 ?auto_288488 ?auto_288489 ?auto_288490 ?auto_288491 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_288501 - BLOCK
      ?auto_288502 - BLOCK
      ?auto_288503 - BLOCK
      ?auto_288504 - BLOCK
      ?auto_288505 - BLOCK
      ?auto_288506 - BLOCK
      ?auto_288507 - BLOCK
      ?auto_288508 - BLOCK
    )
    :vars
    (
      ?auto_288509 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288508 ?auto_288509 ) ( ON-TABLE ?auto_288501 ) ( ON ?auto_288502 ?auto_288501 ) ( ON ?auto_288503 ?auto_288502 ) ( ON ?auto_288504 ?auto_288503 ) ( not ( = ?auto_288501 ?auto_288502 ) ) ( not ( = ?auto_288501 ?auto_288503 ) ) ( not ( = ?auto_288501 ?auto_288504 ) ) ( not ( = ?auto_288501 ?auto_288505 ) ) ( not ( = ?auto_288501 ?auto_288506 ) ) ( not ( = ?auto_288501 ?auto_288507 ) ) ( not ( = ?auto_288501 ?auto_288508 ) ) ( not ( = ?auto_288501 ?auto_288509 ) ) ( not ( = ?auto_288502 ?auto_288503 ) ) ( not ( = ?auto_288502 ?auto_288504 ) ) ( not ( = ?auto_288502 ?auto_288505 ) ) ( not ( = ?auto_288502 ?auto_288506 ) ) ( not ( = ?auto_288502 ?auto_288507 ) ) ( not ( = ?auto_288502 ?auto_288508 ) ) ( not ( = ?auto_288502 ?auto_288509 ) ) ( not ( = ?auto_288503 ?auto_288504 ) ) ( not ( = ?auto_288503 ?auto_288505 ) ) ( not ( = ?auto_288503 ?auto_288506 ) ) ( not ( = ?auto_288503 ?auto_288507 ) ) ( not ( = ?auto_288503 ?auto_288508 ) ) ( not ( = ?auto_288503 ?auto_288509 ) ) ( not ( = ?auto_288504 ?auto_288505 ) ) ( not ( = ?auto_288504 ?auto_288506 ) ) ( not ( = ?auto_288504 ?auto_288507 ) ) ( not ( = ?auto_288504 ?auto_288508 ) ) ( not ( = ?auto_288504 ?auto_288509 ) ) ( not ( = ?auto_288505 ?auto_288506 ) ) ( not ( = ?auto_288505 ?auto_288507 ) ) ( not ( = ?auto_288505 ?auto_288508 ) ) ( not ( = ?auto_288505 ?auto_288509 ) ) ( not ( = ?auto_288506 ?auto_288507 ) ) ( not ( = ?auto_288506 ?auto_288508 ) ) ( not ( = ?auto_288506 ?auto_288509 ) ) ( not ( = ?auto_288507 ?auto_288508 ) ) ( not ( = ?auto_288507 ?auto_288509 ) ) ( not ( = ?auto_288508 ?auto_288509 ) ) ( ON ?auto_288507 ?auto_288508 ) ( ON ?auto_288506 ?auto_288507 ) ( CLEAR ?auto_288504 ) ( ON ?auto_288505 ?auto_288506 ) ( CLEAR ?auto_288505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_288501 ?auto_288502 ?auto_288503 ?auto_288504 ?auto_288505 )
      ( MAKE-8PILE ?auto_288501 ?auto_288502 ?auto_288503 ?auto_288504 ?auto_288505 ?auto_288506 ?auto_288507 ?auto_288508 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_288518 - BLOCK
      ?auto_288519 - BLOCK
      ?auto_288520 - BLOCK
      ?auto_288521 - BLOCK
      ?auto_288522 - BLOCK
      ?auto_288523 - BLOCK
      ?auto_288524 - BLOCK
      ?auto_288525 - BLOCK
    )
    :vars
    (
      ?auto_288526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288525 ?auto_288526 ) ( ON-TABLE ?auto_288518 ) ( ON ?auto_288519 ?auto_288518 ) ( ON ?auto_288520 ?auto_288519 ) ( ON ?auto_288521 ?auto_288520 ) ( not ( = ?auto_288518 ?auto_288519 ) ) ( not ( = ?auto_288518 ?auto_288520 ) ) ( not ( = ?auto_288518 ?auto_288521 ) ) ( not ( = ?auto_288518 ?auto_288522 ) ) ( not ( = ?auto_288518 ?auto_288523 ) ) ( not ( = ?auto_288518 ?auto_288524 ) ) ( not ( = ?auto_288518 ?auto_288525 ) ) ( not ( = ?auto_288518 ?auto_288526 ) ) ( not ( = ?auto_288519 ?auto_288520 ) ) ( not ( = ?auto_288519 ?auto_288521 ) ) ( not ( = ?auto_288519 ?auto_288522 ) ) ( not ( = ?auto_288519 ?auto_288523 ) ) ( not ( = ?auto_288519 ?auto_288524 ) ) ( not ( = ?auto_288519 ?auto_288525 ) ) ( not ( = ?auto_288519 ?auto_288526 ) ) ( not ( = ?auto_288520 ?auto_288521 ) ) ( not ( = ?auto_288520 ?auto_288522 ) ) ( not ( = ?auto_288520 ?auto_288523 ) ) ( not ( = ?auto_288520 ?auto_288524 ) ) ( not ( = ?auto_288520 ?auto_288525 ) ) ( not ( = ?auto_288520 ?auto_288526 ) ) ( not ( = ?auto_288521 ?auto_288522 ) ) ( not ( = ?auto_288521 ?auto_288523 ) ) ( not ( = ?auto_288521 ?auto_288524 ) ) ( not ( = ?auto_288521 ?auto_288525 ) ) ( not ( = ?auto_288521 ?auto_288526 ) ) ( not ( = ?auto_288522 ?auto_288523 ) ) ( not ( = ?auto_288522 ?auto_288524 ) ) ( not ( = ?auto_288522 ?auto_288525 ) ) ( not ( = ?auto_288522 ?auto_288526 ) ) ( not ( = ?auto_288523 ?auto_288524 ) ) ( not ( = ?auto_288523 ?auto_288525 ) ) ( not ( = ?auto_288523 ?auto_288526 ) ) ( not ( = ?auto_288524 ?auto_288525 ) ) ( not ( = ?auto_288524 ?auto_288526 ) ) ( not ( = ?auto_288525 ?auto_288526 ) ) ( ON ?auto_288524 ?auto_288525 ) ( ON ?auto_288523 ?auto_288524 ) ( CLEAR ?auto_288521 ) ( ON ?auto_288522 ?auto_288523 ) ( CLEAR ?auto_288522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_288518 ?auto_288519 ?auto_288520 ?auto_288521 ?auto_288522 )
      ( MAKE-8PILE ?auto_288518 ?auto_288519 ?auto_288520 ?auto_288521 ?auto_288522 ?auto_288523 ?auto_288524 ?auto_288525 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_288535 - BLOCK
      ?auto_288536 - BLOCK
      ?auto_288537 - BLOCK
      ?auto_288538 - BLOCK
      ?auto_288539 - BLOCK
      ?auto_288540 - BLOCK
      ?auto_288541 - BLOCK
      ?auto_288542 - BLOCK
    )
    :vars
    (
      ?auto_288543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288542 ?auto_288543 ) ( ON-TABLE ?auto_288535 ) ( ON ?auto_288536 ?auto_288535 ) ( ON ?auto_288537 ?auto_288536 ) ( not ( = ?auto_288535 ?auto_288536 ) ) ( not ( = ?auto_288535 ?auto_288537 ) ) ( not ( = ?auto_288535 ?auto_288538 ) ) ( not ( = ?auto_288535 ?auto_288539 ) ) ( not ( = ?auto_288535 ?auto_288540 ) ) ( not ( = ?auto_288535 ?auto_288541 ) ) ( not ( = ?auto_288535 ?auto_288542 ) ) ( not ( = ?auto_288535 ?auto_288543 ) ) ( not ( = ?auto_288536 ?auto_288537 ) ) ( not ( = ?auto_288536 ?auto_288538 ) ) ( not ( = ?auto_288536 ?auto_288539 ) ) ( not ( = ?auto_288536 ?auto_288540 ) ) ( not ( = ?auto_288536 ?auto_288541 ) ) ( not ( = ?auto_288536 ?auto_288542 ) ) ( not ( = ?auto_288536 ?auto_288543 ) ) ( not ( = ?auto_288537 ?auto_288538 ) ) ( not ( = ?auto_288537 ?auto_288539 ) ) ( not ( = ?auto_288537 ?auto_288540 ) ) ( not ( = ?auto_288537 ?auto_288541 ) ) ( not ( = ?auto_288537 ?auto_288542 ) ) ( not ( = ?auto_288537 ?auto_288543 ) ) ( not ( = ?auto_288538 ?auto_288539 ) ) ( not ( = ?auto_288538 ?auto_288540 ) ) ( not ( = ?auto_288538 ?auto_288541 ) ) ( not ( = ?auto_288538 ?auto_288542 ) ) ( not ( = ?auto_288538 ?auto_288543 ) ) ( not ( = ?auto_288539 ?auto_288540 ) ) ( not ( = ?auto_288539 ?auto_288541 ) ) ( not ( = ?auto_288539 ?auto_288542 ) ) ( not ( = ?auto_288539 ?auto_288543 ) ) ( not ( = ?auto_288540 ?auto_288541 ) ) ( not ( = ?auto_288540 ?auto_288542 ) ) ( not ( = ?auto_288540 ?auto_288543 ) ) ( not ( = ?auto_288541 ?auto_288542 ) ) ( not ( = ?auto_288541 ?auto_288543 ) ) ( not ( = ?auto_288542 ?auto_288543 ) ) ( ON ?auto_288541 ?auto_288542 ) ( ON ?auto_288540 ?auto_288541 ) ( ON ?auto_288539 ?auto_288540 ) ( CLEAR ?auto_288537 ) ( ON ?auto_288538 ?auto_288539 ) ( CLEAR ?auto_288538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_288535 ?auto_288536 ?auto_288537 ?auto_288538 )
      ( MAKE-8PILE ?auto_288535 ?auto_288536 ?auto_288537 ?auto_288538 ?auto_288539 ?auto_288540 ?auto_288541 ?auto_288542 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_288552 - BLOCK
      ?auto_288553 - BLOCK
      ?auto_288554 - BLOCK
      ?auto_288555 - BLOCK
      ?auto_288556 - BLOCK
      ?auto_288557 - BLOCK
      ?auto_288558 - BLOCK
      ?auto_288559 - BLOCK
    )
    :vars
    (
      ?auto_288560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288559 ?auto_288560 ) ( ON-TABLE ?auto_288552 ) ( ON ?auto_288553 ?auto_288552 ) ( ON ?auto_288554 ?auto_288553 ) ( not ( = ?auto_288552 ?auto_288553 ) ) ( not ( = ?auto_288552 ?auto_288554 ) ) ( not ( = ?auto_288552 ?auto_288555 ) ) ( not ( = ?auto_288552 ?auto_288556 ) ) ( not ( = ?auto_288552 ?auto_288557 ) ) ( not ( = ?auto_288552 ?auto_288558 ) ) ( not ( = ?auto_288552 ?auto_288559 ) ) ( not ( = ?auto_288552 ?auto_288560 ) ) ( not ( = ?auto_288553 ?auto_288554 ) ) ( not ( = ?auto_288553 ?auto_288555 ) ) ( not ( = ?auto_288553 ?auto_288556 ) ) ( not ( = ?auto_288553 ?auto_288557 ) ) ( not ( = ?auto_288553 ?auto_288558 ) ) ( not ( = ?auto_288553 ?auto_288559 ) ) ( not ( = ?auto_288553 ?auto_288560 ) ) ( not ( = ?auto_288554 ?auto_288555 ) ) ( not ( = ?auto_288554 ?auto_288556 ) ) ( not ( = ?auto_288554 ?auto_288557 ) ) ( not ( = ?auto_288554 ?auto_288558 ) ) ( not ( = ?auto_288554 ?auto_288559 ) ) ( not ( = ?auto_288554 ?auto_288560 ) ) ( not ( = ?auto_288555 ?auto_288556 ) ) ( not ( = ?auto_288555 ?auto_288557 ) ) ( not ( = ?auto_288555 ?auto_288558 ) ) ( not ( = ?auto_288555 ?auto_288559 ) ) ( not ( = ?auto_288555 ?auto_288560 ) ) ( not ( = ?auto_288556 ?auto_288557 ) ) ( not ( = ?auto_288556 ?auto_288558 ) ) ( not ( = ?auto_288556 ?auto_288559 ) ) ( not ( = ?auto_288556 ?auto_288560 ) ) ( not ( = ?auto_288557 ?auto_288558 ) ) ( not ( = ?auto_288557 ?auto_288559 ) ) ( not ( = ?auto_288557 ?auto_288560 ) ) ( not ( = ?auto_288558 ?auto_288559 ) ) ( not ( = ?auto_288558 ?auto_288560 ) ) ( not ( = ?auto_288559 ?auto_288560 ) ) ( ON ?auto_288558 ?auto_288559 ) ( ON ?auto_288557 ?auto_288558 ) ( ON ?auto_288556 ?auto_288557 ) ( CLEAR ?auto_288554 ) ( ON ?auto_288555 ?auto_288556 ) ( CLEAR ?auto_288555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_288552 ?auto_288553 ?auto_288554 ?auto_288555 )
      ( MAKE-8PILE ?auto_288552 ?auto_288553 ?auto_288554 ?auto_288555 ?auto_288556 ?auto_288557 ?auto_288558 ?auto_288559 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_288569 - BLOCK
      ?auto_288570 - BLOCK
      ?auto_288571 - BLOCK
      ?auto_288572 - BLOCK
      ?auto_288573 - BLOCK
      ?auto_288574 - BLOCK
      ?auto_288575 - BLOCK
      ?auto_288576 - BLOCK
    )
    :vars
    (
      ?auto_288577 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288576 ?auto_288577 ) ( ON-TABLE ?auto_288569 ) ( ON ?auto_288570 ?auto_288569 ) ( not ( = ?auto_288569 ?auto_288570 ) ) ( not ( = ?auto_288569 ?auto_288571 ) ) ( not ( = ?auto_288569 ?auto_288572 ) ) ( not ( = ?auto_288569 ?auto_288573 ) ) ( not ( = ?auto_288569 ?auto_288574 ) ) ( not ( = ?auto_288569 ?auto_288575 ) ) ( not ( = ?auto_288569 ?auto_288576 ) ) ( not ( = ?auto_288569 ?auto_288577 ) ) ( not ( = ?auto_288570 ?auto_288571 ) ) ( not ( = ?auto_288570 ?auto_288572 ) ) ( not ( = ?auto_288570 ?auto_288573 ) ) ( not ( = ?auto_288570 ?auto_288574 ) ) ( not ( = ?auto_288570 ?auto_288575 ) ) ( not ( = ?auto_288570 ?auto_288576 ) ) ( not ( = ?auto_288570 ?auto_288577 ) ) ( not ( = ?auto_288571 ?auto_288572 ) ) ( not ( = ?auto_288571 ?auto_288573 ) ) ( not ( = ?auto_288571 ?auto_288574 ) ) ( not ( = ?auto_288571 ?auto_288575 ) ) ( not ( = ?auto_288571 ?auto_288576 ) ) ( not ( = ?auto_288571 ?auto_288577 ) ) ( not ( = ?auto_288572 ?auto_288573 ) ) ( not ( = ?auto_288572 ?auto_288574 ) ) ( not ( = ?auto_288572 ?auto_288575 ) ) ( not ( = ?auto_288572 ?auto_288576 ) ) ( not ( = ?auto_288572 ?auto_288577 ) ) ( not ( = ?auto_288573 ?auto_288574 ) ) ( not ( = ?auto_288573 ?auto_288575 ) ) ( not ( = ?auto_288573 ?auto_288576 ) ) ( not ( = ?auto_288573 ?auto_288577 ) ) ( not ( = ?auto_288574 ?auto_288575 ) ) ( not ( = ?auto_288574 ?auto_288576 ) ) ( not ( = ?auto_288574 ?auto_288577 ) ) ( not ( = ?auto_288575 ?auto_288576 ) ) ( not ( = ?auto_288575 ?auto_288577 ) ) ( not ( = ?auto_288576 ?auto_288577 ) ) ( ON ?auto_288575 ?auto_288576 ) ( ON ?auto_288574 ?auto_288575 ) ( ON ?auto_288573 ?auto_288574 ) ( ON ?auto_288572 ?auto_288573 ) ( CLEAR ?auto_288570 ) ( ON ?auto_288571 ?auto_288572 ) ( CLEAR ?auto_288571 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_288569 ?auto_288570 ?auto_288571 )
      ( MAKE-8PILE ?auto_288569 ?auto_288570 ?auto_288571 ?auto_288572 ?auto_288573 ?auto_288574 ?auto_288575 ?auto_288576 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_288586 - BLOCK
      ?auto_288587 - BLOCK
      ?auto_288588 - BLOCK
      ?auto_288589 - BLOCK
      ?auto_288590 - BLOCK
      ?auto_288591 - BLOCK
      ?auto_288592 - BLOCK
      ?auto_288593 - BLOCK
    )
    :vars
    (
      ?auto_288594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288593 ?auto_288594 ) ( ON-TABLE ?auto_288586 ) ( ON ?auto_288587 ?auto_288586 ) ( not ( = ?auto_288586 ?auto_288587 ) ) ( not ( = ?auto_288586 ?auto_288588 ) ) ( not ( = ?auto_288586 ?auto_288589 ) ) ( not ( = ?auto_288586 ?auto_288590 ) ) ( not ( = ?auto_288586 ?auto_288591 ) ) ( not ( = ?auto_288586 ?auto_288592 ) ) ( not ( = ?auto_288586 ?auto_288593 ) ) ( not ( = ?auto_288586 ?auto_288594 ) ) ( not ( = ?auto_288587 ?auto_288588 ) ) ( not ( = ?auto_288587 ?auto_288589 ) ) ( not ( = ?auto_288587 ?auto_288590 ) ) ( not ( = ?auto_288587 ?auto_288591 ) ) ( not ( = ?auto_288587 ?auto_288592 ) ) ( not ( = ?auto_288587 ?auto_288593 ) ) ( not ( = ?auto_288587 ?auto_288594 ) ) ( not ( = ?auto_288588 ?auto_288589 ) ) ( not ( = ?auto_288588 ?auto_288590 ) ) ( not ( = ?auto_288588 ?auto_288591 ) ) ( not ( = ?auto_288588 ?auto_288592 ) ) ( not ( = ?auto_288588 ?auto_288593 ) ) ( not ( = ?auto_288588 ?auto_288594 ) ) ( not ( = ?auto_288589 ?auto_288590 ) ) ( not ( = ?auto_288589 ?auto_288591 ) ) ( not ( = ?auto_288589 ?auto_288592 ) ) ( not ( = ?auto_288589 ?auto_288593 ) ) ( not ( = ?auto_288589 ?auto_288594 ) ) ( not ( = ?auto_288590 ?auto_288591 ) ) ( not ( = ?auto_288590 ?auto_288592 ) ) ( not ( = ?auto_288590 ?auto_288593 ) ) ( not ( = ?auto_288590 ?auto_288594 ) ) ( not ( = ?auto_288591 ?auto_288592 ) ) ( not ( = ?auto_288591 ?auto_288593 ) ) ( not ( = ?auto_288591 ?auto_288594 ) ) ( not ( = ?auto_288592 ?auto_288593 ) ) ( not ( = ?auto_288592 ?auto_288594 ) ) ( not ( = ?auto_288593 ?auto_288594 ) ) ( ON ?auto_288592 ?auto_288593 ) ( ON ?auto_288591 ?auto_288592 ) ( ON ?auto_288590 ?auto_288591 ) ( ON ?auto_288589 ?auto_288590 ) ( CLEAR ?auto_288587 ) ( ON ?auto_288588 ?auto_288589 ) ( CLEAR ?auto_288588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_288586 ?auto_288587 ?auto_288588 )
      ( MAKE-8PILE ?auto_288586 ?auto_288587 ?auto_288588 ?auto_288589 ?auto_288590 ?auto_288591 ?auto_288592 ?auto_288593 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_288603 - BLOCK
      ?auto_288604 - BLOCK
      ?auto_288605 - BLOCK
      ?auto_288606 - BLOCK
      ?auto_288607 - BLOCK
      ?auto_288608 - BLOCK
      ?auto_288609 - BLOCK
      ?auto_288610 - BLOCK
    )
    :vars
    (
      ?auto_288611 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288610 ?auto_288611 ) ( ON-TABLE ?auto_288603 ) ( not ( = ?auto_288603 ?auto_288604 ) ) ( not ( = ?auto_288603 ?auto_288605 ) ) ( not ( = ?auto_288603 ?auto_288606 ) ) ( not ( = ?auto_288603 ?auto_288607 ) ) ( not ( = ?auto_288603 ?auto_288608 ) ) ( not ( = ?auto_288603 ?auto_288609 ) ) ( not ( = ?auto_288603 ?auto_288610 ) ) ( not ( = ?auto_288603 ?auto_288611 ) ) ( not ( = ?auto_288604 ?auto_288605 ) ) ( not ( = ?auto_288604 ?auto_288606 ) ) ( not ( = ?auto_288604 ?auto_288607 ) ) ( not ( = ?auto_288604 ?auto_288608 ) ) ( not ( = ?auto_288604 ?auto_288609 ) ) ( not ( = ?auto_288604 ?auto_288610 ) ) ( not ( = ?auto_288604 ?auto_288611 ) ) ( not ( = ?auto_288605 ?auto_288606 ) ) ( not ( = ?auto_288605 ?auto_288607 ) ) ( not ( = ?auto_288605 ?auto_288608 ) ) ( not ( = ?auto_288605 ?auto_288609 ) ) ( not ( = ?auto_288605 ?auto_288610 ) ) ( not ( = ?auto_288605 ?auto_288611 ) ) ( not ( = ?auto_288606 ?auto_288607 ) ) ( not ( = ?auto_288606 ?auto_288608 ) ) ( not ( = ?auto_288606 ?auto_288609 ) ) ( not ( = ?auto_288606 ?auto_288610 ) ) ( not ( = ?auto_288606 ?auto_288611 ) ) ( not ( = ?auto_288607 ?auto_288608 ) ) ( not ( = ?auto_288607 ?auto_288609 ) ) ( not ( = ?auto_288607 ?auto_288610 ) ) ( not ( = ?auto_288607 ?auto_288611 ) ) ( not ( = ?auto_288608 ?auto_288609 ) ) ( not ( = ?auto_288608 ?auto_288610 ) ) ( not ( = ?auto_288608 ?auto_288611 ) ) ( not ( = ?auto_288609 ?auto_288610 ) ) ( not ( = ?auto_288609 ?auto_288611 ) ) ( not ( = ?auto_288610 ?auto_288611 ) ) ( ON ?auto_288609 ?auto_288610 ) ( ON ?auto_288608 ?auto_288609 ) ( ON ?auto_288607 ?auto_288608 ) ( ON ?auto_288606 ?auto_288607 ) ( ON ?auto_288605 ?auto_288606 ) ( CLEAR ?auto_288603 ) ( ON ?auto_288604 ?auto_288605 ) ( CLEAR ?auto_288604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_288603 ?auto_288604 )
      ( MAKE-8PILE ?auto_288603 ?auto_288604 ?auto_288605 ?auto_288606 ?auto_288607 ?auto_288608 ?auto_288609 ?auto_288610 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_288620 - BLOCK
      ?auto_288621 - BLOCK
      ?auto_288622 - BLOCK
      ?auto_288623 - BLOCK
      ?auto_288624 - BLOCK
      ?auto_288625 - BLOCK
      ?auto_288626 - BLOCK
      ?auto_288627 - BLOCK
    )
    :vars
    (
      ?auto_288628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288627 ?auto_288628 ) ( ON-TABLE ?auto_288620 ) ( not ( = ?auto_288620 ?auto_288621 ) ) ( not ( = ?auto_288620 ?auto_288622 ) ) ( not ( = ?auto_288620 ?auto_288623 ) ) ( not ( = ?auto_288620 ?auto_288624 ) ) ( not ( = ?auto_288620 ?auto_288625 ) ) ( not ( = ?auto_288620 ?auto_288626 ) ) ( not ( = ?auto_288620 ?auto_288627 ) ) ( not ( = ?auto_288620 ?auto_288628 ) ) ( not ( = ?auto_288621 ?auto_288622 ) ) ( not ( = ?auto_288621 ?auto_288623 ) ) ( not ( = ?auto_288621 ?auto_288624 ) ) ( not ( = ?auto_288621 ?auto_288625 ) ) ( not ( = ?auto_288621 ?auto_288626 ) ) ( not ( = ?auto_288621 ?auto_288627 ) ) ( not ( = ?auto_288621 ?auto_288628 ) ) ( not ( = ?auto_288622 ?auto_288623 ) ) ( not ( = ?auto_288622 ?auto_288624 ) ) ( not ( = ?auto_288622 ?auto_288625 ) ) ( not ( = ?auto_288622 ?auto_288626 ) ) ( not ( = ?auto_288622 ?auto_288627 ) ) ( not ( = ?auto_288622 ?auto_288628 ) ) ( not ( = ?auto_288623 ?auto_288624 ) ) ( not ( = ?auto_288623 ?auto_288625 ) ) ( not ( = ?auto_288623 ?auto_288626 ) ) ( not ( = ?auto_288623 ?auto_288627 ) ) ( not ( = ?auto_288623 ?auto_288628 ) ) ( not ( = ?auto_288624 ?auto_288625 ) ) ( not ( = ?auto_288624 ?auto_288626 ) ) ( not ( = ?auto_288624 ?auto_288627 ) ) ( not ( = ?auto_288624 ?auto_288628 ) ) ( not ( = ?auto_288625 ?auto_288626 ) ) ( not ( = ?auto_288625 ?auto_288627 ) ) ( not ( = ?auto_288625 ?auto_288628 ) ) ( not ( = ?auto_288626 ?auto_288627 ) ) ( not ( = ?auto_288626 ?auto_288628 ) ) ( not ( = ?auto_288627 ?auto_288628 ) ) ( ON ?auto_288626 ?auto_288627 ) ( ON ?auto_288625 ?auto_288626 ) ( ON ?auto_288624 ?auto_288625 ) ( ON ?auto_288623 ?auto_288624 ) ( ON ?auto_288622 ?auto_288623 ) ( CLEAR ?auto_288620 ) ( ON ?auto_288621 ?auto_288622 ) ( CLEAR ?auto_288621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_288620 ?auto_288621 )
      ( MAKE-8PILE ?auto_288620 ?auto_288621 ?auto_288622 ?auto_288623 ?auto_288624 ?auto_288625 ?auto_288626 ?auto_288627 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_288637 - BLOCK
      ?auto_288638 - BLOCK
      ?auto_288639 - BLOCK
      ?auto_288640 - BLOCK
      ?auto_288641 - BLOCK
      ?auto_288642 - BLOCK
      ?auto_288643 - BLOCK
      ?auto_288644 - BLOCK
    )
    :vars
    (
      ?auto_288645 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288644 ?auto_288645 ) ( not ( = ?auto_288637 ?auto_288638 ) ) ( not ( = ?auto_288637 ?auto_288639 ) ) ( not ( = ?auto_288637 ?auto_288640 ) ) ( not ( = ?auto_288637 ?auto_288641 ) ) ( not ( = ?auto_288637 ?auto_288642 ) ) ( not ( = ?auto_288637 ?auto_288643 ) ) ( not ( = ?auto_288637 ?auto_288644 ) ) ( not ( = ?auto_288637 ?auto_288645 ) ) ( not ( = ?auto_288638 ?auto_288639 ) ) ( not ( = ?auto_288638 ?auto_288640 ) ) ( not ( = ?auto_288638 ?auto_288641 ) ) ( not ( = ?auto_288638 ?auto_288642 ) ) ( not ( = ?auto_288638 ?auto_288643 ) ) ( not ( = ?auto_288638 ?auto_288644 ) ) ( not ( = ?auto_288638 ?auto_288645 ) ) ( not ( = ?auto_288639 ?auto_288640 ) ) ( not ( = ?auto_288639 ?auto_288641 ) ) ( not ( = ?auto_288639 ?auto_288642 ) ) ( not ( = ?auto_288639 ?auto_288643 ) ) ( not ( = ?auto_288639 ?auto_288644 ) ) ( not ( = ?auto_288639 ?auto_288645 ) ) ( not ( = ?auto_288640 ?auto_288641 ) ) ( not ( = ?auto_288640 ?auto_288642 ) ) ( not ( = ?auto_288640 ?auto_288643 ) ) ( not ( = ?auto_288640 ?auto_288644 ) ) ( not ( = ?auto_288640 ?auto_288645 ) ) ( not ( = ?auto_288641 ?auto_288642 ) ) ( not ( = ?auto_288641 ?auto_288643 ) ) ( not ( = ?auto_288641 ?auto_288644 ) ) ( not ( = ?auto_288641 ?auto_288645 ) ) ( not ( = ?auto_288642 ?auto_288643 ) ) ( not ( = ?auto_288642 ?auto_288644 ) ) ( not ( = ?auto_288642 ?auto_288645 ) ) ( not ( = ?auto_288643 ?auto_288644 ) ) ( not ( = ?auto_288643 ?auto_288645 ) ) ( not ( = ?auto_288644 ?auto_288645 ) ) ( ON ?auto_288643 ?auto_288644 ) ( ON ?auto_288642 ?auto_288643 ) ( ON ?auto_288641 ?auto_288642 ) ( ON ?auto_288640 ?auto_288641 ) ( ON ?auto_288639 ?auto_288640 ) ( ON ?auto_288638 ?auto_288639 ) ( ON ?auto_288637 ?auto_288638 ) ( CLEAR ?auto_288637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_288637 )
      ( MAKE-8PILE ?auto_288637 ?auto_288638 ?auto_288639 ?auto_288640 ?auto_288641 ?auto_288642 ?auto_288643 ?auto_288644 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_288654 - BLOCK
      ?auto_288655 - BLOCK
      ?auto_288656 - BLOCK
      ?auto_288657 - BLOCK
      ?auto_288658 - BLOCK
      ?auto_288659 - BLOCK
      ?auto_288660 - BLOCK
      ?auto_288661 - BLOCK
    )
    :vars
    (
      ?auto_288662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288661 ?auto_288662 ) ( not ( = ?auto_288654 ?auto_288655 ) ) ( not ( = ?auto_288654 ?auto_288656 ) ) ( not ( = ?auto_288654 ?auto_288657 ) ) ( not ( = ?auto_288654 ?auto_288658 ) ) ( not ( = ?auto_288654 ?auto_288659 ) ) ( not ( = ?auto_288654 ?auto_288660 ) ) ( not ( = ?auto_288654 ?auto_288661 ) ) ( not ( = ?auto_288654 ?auto_288662 ) ) ( not ( = ?auto_288655 ?auto_288656 ) ) ( not ( = ?auto_288655 ?auto_288657 ) ) ( not ( = ?auto_288655 ?auto_288658 ) ) ( not ( = ?auto_288655 ?auto_288659 ) ) ( not ( = ?auto_288655 ?auto_288660 ) ) ( not ( = ?auto_288655 ?auto_288661 ) ) ( not ( = ?auto_288655 ?auto_288662 ) ) ( not ( = ?auto_288656 ?auto_288657 ) ) ( not ( = ?auto_288656 ?auto_288658 ) ) ( not ( = ?auto_288656 ?auto_288659 ) ) ( not ( = ?auto_288656 ?auto_288660 ) ) ( not ( = ?auto_288656 ?auto_288661 ) ) ( not ( = ?auto_288656 ?auto_288662 ) ) ( not ( = ?auto_288657 ?auto_288658 ) ) ( not ( = ?auto_288657 ?auto_288659 ) ) ( not ( = ?auto_288657 ?auto_288660 ) ) ( not ( = ?auto_288657 ?auto_288661 ) ) ( not ( = ?auto_288657 ?auto_288662 ) ) ( not ( = ?auto_288658 ?auto_288659 ) ) ( not ( = ?auto_288658 ?auto_288660 ) ) ( not ( = ?auto_288658 ?auto_288661 ) ) ( not ( = ?auto_288658 ?auto_288662 ) ) ( not ( = ?auto_288659 ?auto_288660 ) ) ( not ( = ?auto_288659 ?auto_288661 ) ) ( not ( = ?auto_288659 ?auto_288662 ) ) ( not ( = ?auto_288660 ?auto_288661 ) ) ( not ( = ?auto_288660 ?auto_288662 ) ) ( not ( = ?auto_288661 ?auto_288662 ) ) ( ON ?auto_288660 ?auto_288661 ) ( ON ?auto_288659 ?auto_288660 ) ( ON ?auto_288658 ?auto_288659 ) ( ON ?auto_288657 ?auto_288658 ) ( ON ?auto_288656 ?auto_288657 ) ( ON ?auto_288655 ?auto_288656 ) ( ON ?auto_288654 ?auto_288655 ) ( CLEAR ?auto_288654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_288654 )
      ( MAKE-8PILE ?auto_288654 ?auto_288655 ?auto_288656 ?auto_288657 ?auto_288658 ?auto_288659 ?auto_288660 ?auto_288661 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_288672 - BLOCK
      ?auto_288673 - BLOCK
      ?auto_288674 - BLOCK
      ?auto_288675 - BLOCK
      ?auto_288676 - BLOCK
      ?auto_288677 - BLOCK
      ?auto_288678 - BLOCK
      ?auto_288679 - BLOCK
      ?auto_288680 - BLOCK
    )
    :vars
    (
      ?auto_288681 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_288679 ) ( ON ?auto_288680 ?auto_288681 ) ( CLEAR ?auto_288680 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_288672 ) ( ON ?auto_288673 ?auto_288672 ) ( ON ?auto_288674 ?auto_288673 ) ( ON ?auto_288675 ?auto_288674 ) ( ON ?auto_288676 ?auto_288675 ) ( ON ?auto_288677 ?auto_288676 ) ( ON ?auto_288678 ?auto_288677 ) ( ON ?auto_288679 ?auto_288678 ) ( not ( = ?auto_288672 ?auto_288673 ) ) ( not ( = ?auto_288672 ?auto_288674 ) ) ( not ( = ?auto_288672 ?auto_288675 ) ) ( not ( = ?auto_288672 ?auto_288676 ) ) ( not ( = ?auto_288672 ?auto_288677 ) ) ( not ( = ?auto_288672 ?auto_288678 ) ) ( not ( = ?auto_288672 ?auto_288679 ) ) ( not ( = ?auto_288672 ?auto_288680 ) ) ( not ( = ?auto_288672 ?auto_288681 ) ) ( not ( = ?auto_288673 ?auto_288674 ) ) ( not ( = ?auto_288673 ?auto_288675 ) ) ( not ( = ?auto_288673 ?auto_288676 ) ) ( not ( = ?auto_288673 ?auto_288677 ) ) ( not ( = ?auto_288673 ?auto_288678 ) ) ( not ( = ?auto_288673 ?auto_288679 ) ) ( not ( = ?auto_288673 ?auto_288680 ) ) ( not ( = ?auto_288673 ?auto_288681 ) ) ( not ( = ?auto_288674 ?auto_288675 ) ) ( not ( = ?auto_288674 ?auto_288676 ) ) ( not ( = ?auto_288674 ?auto_288677 ) ) ( not ( = ?auto_288674 ?auto_288678 ) ) ( not ( = ?auto_288674 ?auto_288679 ) ) ( not ( = ?auto_288674 ?auto_288680 ) ) ( not ( = ?auto_288674 ?auto_288681 ) ) ( not ( = ?auto_288675 ?auto_288676 ) ) ( not ( = ?auto_288675 ?auto_288677 ) ) ( not ( = ?auto_288675 ?auto_288678 ) ) ( not ( = ?auto_288675 ?auto_288679 ) ) ( not ( = ?auto_288675 ?auto_288680 ) ) ( not ( = ?auto_288675 ?auto_288681 ) ) ( not ( = ?auto_288676 ?auto_288677 ) ) ( not ( = ?auto_288676 ?auto_288678 ) ) ( not ( = ?auto_288676 ?auto_288679 ) ) ( not ( = ?auto_288676 ?auto_288680 ) ) ( not ( = ?auto_288676 ?auto_288681 ) ) ( not ( = ?auto_288677 ?auto_288678 ) ) ( not ( = ?auto_288677 ?auto_288679 ) ) ( not ( = ?auto_288677 ?auto_288680 ) ) ( not ( = ?auto_288677 ?auto_288681 ) ) ( not ( = ?auto_288678 ?auto_288679 ) ) ( not ( = ?auto_288678 ?auto_288680 ) ) ( not ( = ?auto_288678 ?auto_288681 ) ) ( not ( = ?auto_288679 ?auto_288680 ) ) ( not ( = ?auto_288679 ?auto_288681 ) ) ( not ( = ?auto_288680 ?auto_288681 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_288680 ?auto_288681 )
      ( !STACK ?auto_288680 ?auto_288679 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_288691 - BLOCK
      ?auto_288692 - BLOCK
      ?auto_288693 - BLOCK
      ?auto_288694 - BLOCK
      ?auto_288695 - BLOCK
      ?auto_288696 - BLOCK
      ?auto_288697 - BLOCK
      ?auto_288698 - BLOCK
      ?auto_288699 - BLOCK
    )
    :vars
    (
      ?auto_288700 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_288698 ) ( ON ?auto_288699 ?auto_288700 ) ( CLEAR ?auto_288699 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_288691 ) ( ON ?auto_288692 ?auto_288691 ) ( ON ?auto_288693 ?auto_288692 ) ( ON ?auto_288694 ?auto_288693 ) ( ON ?auto_288695 ?auto_288694 ) ( ON ?auto_288696 ?auto_288695 ) ( ON ?auto_288697 ?auto_288696 ) ( ON ?auto_288698 ?auto_288697 ) ( not ( = ?auto_288691 ?auto_288692 ) ) ( not ( = ?auto_288691 ?auto_288693 ) ) ( not ( = ?auto_288691 ?auto_288694 ) ) ( not ( = ?auto_288691 ?auto_288695 ) ) ( not ( = ?auto_288691 ?auto_288696 ) ) ( not ( = ?auto_288691 ?auto_288697 ) ) ( not ( = ?auto_288691 ?auto_288698 ) ) ( not ( = ?auto_288691 ?auto_288699 ) ) ( not ( = ?auto_288691 ?auto_288700 ) ) ( not ( = ?auto_288692 ?auto_288693 ) ) ( not ( = ?auto_288692 ?auto_288694 ) ) ( not ( = ?auto_288692 ?auto_288695 ) ) ( not ( = ?auto_288692 ?auto_288696 ) ) ( not ( = ?auto_288692 ?auto_288697 ) ) ( not ( = ?auto_288692 ?auto_288698 ) ) ( not ( = ?auto_288692 ?auto_288699 ) ) ( not ( = ?auto_288692 ?auto_288700 ) ) ( not ( = ?auto_288693 ?auto_288694 ) ) ( not ( = ?auto_288693 ?auto_288695 ) ) ( not ( = ?auto_288693 ?auto_288696 ) ) ( not ( = ?auto_288693 ?auto_288697 ) ) ( not ( = ?auto_288693 ?auto_288698 ) ) ( not ( = ?auto_288693 ?auto_288699 ) ) ( not ( = ?auto_288693 ?auto_288700 ) ) ( not ( = ?auto_288694 ?auto_288695 ) ) ( not ( = ?auto_288694 ?auto_288696 ) ) ( not ( = ?auto_288694 ?auto_288697 ) ) ( not ( = ?auto_288694 ?auto_288698 ) ) ( not ( = ?auto_288694 ?auto_288699 ) ) ( not ( = ?auto_288694 ?auto_288700 ) ) ( not ( = ?auto_288695 ?auto_288696 ) ) ( not ( = ?auto_288695 ?auto_288697 ) ) ( not ( = ?auto_288695 ?auto_288698 ) ) ( not ( = ?auto_288695 ?auto_288699 ) ) ( not ( = ?auto_288695 ?auto_288700 ) ) ( not ( = ?auto_288696 ?auto_288697 ) ) ( not ( = ?auto_288696 ?auto_288698 ) ) ( not ( = ?auto_288696 ?auto_288699 ) ) ( not ( = ?auto_288696 ?auto_288700 ) ) ( not ( = ?auto_288697 ?auto_288698 ) ) ( not ( = ?auto_288697 ?auto_288699 ) ) ( not ( = ?auto_288697 ?auto_288700 ) ) ( not ( = ?auto_288698 ?auto_288699 ) ) ( not ( = ?auto_288698 ?auto_288700 ) ) ( not ( = ?auto_288699 ?auto_288700 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_288699 ?auto_288700 )
      ( !STACK ?auto_288699 ?auto_288698 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_288710 - BLOCK
      ?auto_288711 - BLOCK
      ?auto_288712 - BLOCK
      ?auto_288713 - BLOCK
      ?auto_288714 - BLOCK
      ?auto_288715 - BLOCK
      ?auto_288716 - BLOCK
      ?auto_288717 - BLOCK
      ?auto_288718 - BLOCK
    )
    :vars
    (
      ?auto_288719 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288718 ?auto_288719 ) ( ON-TABLE ?auto_288710 ) ( ON ?auto_288711 ?auto_288710 ) ( ON ?auto_288712 ?auto_288711 ) ( ON ?auto_288713 ?auto_288712 ) ( ON ?auto_288714 ?auto_288713 ) ( ON ?auto_288715 ?auto_288714 ) ( ON ?auto_288716 ?auto_288715 ) ( not ( = ?auto_288710 ?auto_288711 ) ) ( not ( = ?auto_288710 ?auto_288712 ) ) ( not ( = ?auto_288710 ?auto_288713 ) ) ( not ( = ?auto_288710 ?auto_288714 ) ) ( not ( = ?auto_288710 ?auto_288715 ) ) ( not ( = ?auto_288710 ?auto_288716 ) ) ( not ( = ?auto_288710 ?auto_288717 ) ) ( not ( = ?auto_288710 ?auto_288718 ) ) ( not ( = ?auto_288710 ?auto_288719 ) ) ( not ( = ?auto_288711 ?auto_288712 ) ) ( not ( = ?auto_288711 ?auto_288713 ) ) ( not ( = ?auto_288711 ?auto_288714 ) ) ( not ( = ?auto_288711 ?auto_288715 ) ) ( not ( = ?auto_288711 ?auto_288716 ) ) ( not ( = ?auto_288711 ?auto_288717 ) ) ( not ( = ?auto_288711 ?auto_288718 ) ) ( not ( = ?auto_288711 ?auto_288719 ) ) ( not ( = ?auto_288712 ?auto_288713 ) ) ( not ( = ?auto_288712 ?auto_288714 ) ) ( not ( = ?auto_288712 ?auto_288715 ) ) ( not ( = ?auto_288712 ?auto_288716 ) ) ( not ( = ?auto_288712 ?auto_288717 ) ) ( not ( = ?auto_288712 ?auto_288718 ) ) ( not ( = ?auto_288712 ?auto_288719 ) ) ( not ( = ?auto_288713 ?auto_288714 ) ) ( not ( = ?auto_288713 ?auto_288715 ) ) ( not ( = ?auto_288713 ?auto_288716 ) ) ( not ( = ?auto_288713 ?auto_288717 ) ) ( not ( = ?auto_288713 ?auto_288718 ) ) ( not ( = ?auto_288713 ?auto_288719 ) ) ( not ( = ?auto_288714 ?auto_288715 ) ) ( not ( = ?auto_288714 ?auto_288716 ) ) ( not ( = ?auto_288714 ?auto_288717 ) ) ( not ( = ?auto_288714 ?auto_288718 ) ) ( not ( = ?auto_288714 ?auto_288719 ) ) ( not ( = ?auto_288715 ?auto_288716 ) ) ( not ( = ?auto_288715 ?auto_288717 ) ) ( not ( = ?auto_288715 ?auto_288718 ) ) ( not ( = ?auto_288715 ?auto_288719 ) ) ( not ( = ?auto_288716 ?auto_288717 ) ) ( not ( = ?auto_288716 ?auto_288718 ) ) ( not ( = ?auto_288716 ?auto_288719 ) ) ( not ( = ?auto_288717 ?auto_288718 ) ) ( not ( = ?auto_288717 ?auto_288719 ) ) ( not ( = ?auto_288718 ?auto_288719 ) ) ( CLEAR ?auto_288716 ) ( ON ?auto_288717 ?auto_288718 ) ( CLEAR ?auto_288717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_288710 ?auto_288711 ?auto_288712 ?auto_288713 ?auto_288714 ?auto_288715 ?auto_288716 ?auto_288717 )
      ( MAKE-9PILE ?auto_288710 ?auto_288711 ?auto_288712 ?auto_288713 ?auto_288714 ?auto_288715 ?auto_288716 ?auto_288717 ?auto_288718 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_288729 - BLOCK
      ?auto_288730 - BLOCK
      ?auto_288731 - BLOCK
      ?auto_288732 - BLOCK
      ?auto_288733 - BLOCK
      ?auto_288734 - BLOCK
      ?auto_288735 - BLOCK
      ?auto_288736 - BLOCK
      ?auto_288737 - BLOCK
    )
    :vars
    (
      ?auto_288738 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288737 ?auto_288738 ) ( ON-TABLE ?auto_288729 ) ( ON ?auto_288730 ?auto_288729 ) ( ON ?auto_288731 ?auto_288730 ) ( ON ?auto_288732 ?auto_288731 ) ( ON ?auto_288733 ?auto_288732 ) ( ON ?auto_288734 ?auto_288733 ) ( ON ?auto_288735 ?auto_288734 ) ( not ( = ?auto_288729 ?auto_288730 ) ) ( not ( = ?auto_288729 ?auto_288731 ) ) ( not ( = ?auto_288729 ?auto_288732 ) ) ( not ( = ?auto_288729 ?auto_288733 ) ) ( not ( = ?auto_288729 ?auto_288734 ) ) ( not ( = ?auto_288729 ?auto_288735 ) ) ( not ( = ?auto_288729 ?auto_288736 ) ) ( not ( = ?auto_288729 ?auto_288737 ) ) ( not ( = ?auto_288729 ?auto_288738 ) ) ( not ( = ?auto_288730 ?auto_288731 ) ) ( not ( = ?auto_288730 ?auto_288732 ) ) ( not ( = ?auto_288730 ?auto_288733 ) ) ( not ( = ?auto_288730 ?auto_288734 ) ) ( not ( = ?auto_288730 ?auto_288735 ) ) ( not ( = ?auto_288730 ?auto_288736 ) ) ( not ( = ?auto_288730 ?auto_288737 ) ) ( not ( = ?auto_288730 ?auto_288738 ) ) ( not ( = ?auto_288731 ?auto_288732 ) ) ( not ( = ?auto_288731 ?auto_288733 ) ) ( not ( = ?auto_288731 ?auto_288734 ) ) ( not ( = ?auto_288731 ?auto_288735 ) ) ( not ( = ?auto_288731 ?auto_288736 ) ) ( not ( = ?auto_288731 ?auto_288737 ) ) ( not ( = ?auto_288731 ?auto_288738 ) ) ( not ( = ?auto_288732 ?auto_288733 ) ) ( not ( = ?auto_288732 ?auto_288734 ) ) ( not ( = ?auto_288732 ?auto_288735 ) ) ( not ( = ?auto_288732 ?auto_288736 ) ) ( not ( = ?auto_288732 ?auto_288737 ) ) ( not ( = ?auto_288732 ?auto_288738 ) ) ( not ( = ?auto_288733 ?auto_288734 ) ) ( not ( = ?auto_288733 ?auto_288735 ) ) ( not ( = ?auto_288733 ?auto_288736 ) ) ( not ( = ?auto_288733 ?auto_288737 ) ) ( not ( = ?auto_288733 ?auto_288738 ) ) ( not ( = ?auto_288734 ?auto_288735 ) ) ( not ( = ?auto_288734 ?auto_288736 ) ) ( not ( = ?auto_288734 ?auto_288737 ) ) ( not ( = ?auto_288734 ?auto_288738 ) ) ( not ( = ?auto_288735 ?auto_288736 ) ) ( not ( = ?auto_288735 ?auto_288737 ) ) ( not ( = ?auto_288735 ?auto_288738 ) ) ( not ( = ?auto_288736 ?auto_288737 ) ) ( not ( = ?auto_288736 ?auto_288738 ) ) ( not ( = ?auto_288737 ?auto_288738 ) ) ( CLEAR ?auto_288735 ) ( ON ?auto_288736 ?auto_288737 ) ( CLEAR ?auto_288736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_288729 ?auto_288730 ?auto_288731 ?auto_288732 ?auto_288733 ?auto_288734 ?auto_288735 ?auto_288736 )
      ( MAKE-9PILE ?auto_288729 ?auto_288730 ?auto_288731 ?auto_288732 ?auto_288733 ?auto_288734 ?auto_288735 ?auto_288736 ?auto_288737 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_288748 - BLOCK
      ?auto_288749 - BLOCK
      ?auto_288750 - BLOCK
      ?auto_288751 - BLOCK
      ?auto_288752 - BLOCK
      ?auto_288753 - BLOCK
      ?auto_288754 - BLOCK
      ?auto_288755 - BLOCK
      ?auto_288756 - BLOCK
    )
    :vars
    (
      ?auto_288757 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288756 ?auto_288757 ) ( ON-TABLE ?auto_288748 ) ( ON ?auto_288749 ?auto_288748 ) ( ON ?auto_288750 ?auto_288749 ) ( ON ?auto_288751 ?auto_288750 ) ( ON ?auto_288752 ?auto_288751 ) ( ON ?auto_288753 ?auto_288752 ) ( not ( = ?auto_288748 ?auto_288749 ) ) ( not ( = ?auto_288748 ?auto_288750 ) ) ( not ( = ?auto_288748 ?auto_288751 ) ) ( not ( = ?auto_288748 ?auto_288752 ) ) ( not ( = ?auto_288748 ?auto_288753 ) ) ( not ( = ?auto_288748 ?auto_288754 ) ) ( not ( = ?auto_288748 ?auto_288755 ) ) ( not ( = ?auto_288748 ?auto_288756 ) ) ( not ( = ?auto_288748 ?auto_288757 ) ) ( not ( = ?auto_288749 ?auto_288750 ) ) ( not ( = ?auto_288749 ?auto_288751 ) ) ( not ( = ?auto_288749 ?auto_288752 ) ) ( not ( = ?auto_288749 ?auto_288753 ) ) ( not ( = ?auto_288749 ?auto_288754 ) ) ( not ( = ?auto_288749 ?auto_288755 ) ) ( not ( = ?auto_288749 ?auto_288756 ) ) ( not ( = ?auto_288749 ?auto_288757 ) ) ( not ( = ?auto_288750 ?auto_288751 ) ) ( not ( = ?auto_288750 ?auto_288752 ) ) ( not ( = ?auto_288750 ?auto_288753 ) ) ( not ( = ?auto_288750 ?auto_288754 ) ) ( not ( = ?auto_288750 ?auto_288755 ) ) ( not ( = ?auto_288750 ?auto_288756 ) ) ( not ( = ?auto_288750 ?auto_288757 ) ) ( not ( = ?auto_288751 ?auto_288752 ) ) ( not ( = ?auto_288751 ?auto_288753 ) ) ( not ( = ?auto_288751 ?auto_288754 ) ) ( not ( = ?auto_288751 ?auto_288755 ) ) ( not ( = ?auto_288751 ?auto_288756 ) ) ( not ( = ?auto_288751 ?auto_288757 ) ) ( not ( = ?auto_288752 ?auto_288753 ) ) ( not ( = ?auto_288752 ?auto_288754 ) ) ( not ( = ?auto_288752 ?auto_288755 ) ) ( not ( = ?auto_288752 ?auto_288756 ) ) ( not ( = ?auto_288752 ?auto_288757 ) ) ( not ( = ?auto_288753 ?auto_288754 ) ) ( not ( = ?auto_288753 ?auto_288755 ) ) ( not ( = ?auto_288753 ?auto_288756 ) ) ( not ( = ?auto_288753 ?auto_288757 ) ) ( not ( = ?auto_288754 ?auto_288755 ) ) ( not ( = ?auto_288754 ?auto_288756 ) ) ( not ( = ?auto_288754 ?auto_288757 ) ) ( not ( = ?auto_288755 ?auto_288756 ) ) ( not ( = ?auto_288755 ?auto_288757 ) ) ( not ( = ?auto_288756 ?auto_288757 ) ) ( ON ?auto_288755 ?auto_288756 ) ( CLEAR ?auto_288753 ) ( ON ?auto_288754 ?auto_288755 ) ( CLEAR ?auto_288754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_288748 ?auto_288749 ?auto_288750 ?auto_288751 ?auto_288752 ?auto_288753 ?auto_288754 )
      ( MAKE-9PILE ?auto_288748 ?auto_288749 ?auto_288750 ?auto_288751 ?auto_288752 ?auto_288753 ?auto_288754 ?auto_288755 ?auto_288756 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_288767 - BLOCK
      ?auto_288768 - BLOCK
      ?auto_288769 - BLOCK
      ?auto_288770 - BLOCK
      ?auto_288771 - BLOCK
      ?auto_288772 - BLOCK
      ?auto_288773 - BLOCK
      ?auto_288774 - BLOCK
      ?auto_288775 - BLOCK
    )
    :vars
    (
      ?auto_288776 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288775 ?auto_288776 ) ( ON-TABLE ?auto_288767 ) ( ON ?auto_288768 ?auto_288767 ) ( ON ?auto_288769 ?auto_288768 ) ( ON ?auto_288770 ?auto_288769 ) ( ON ?auto_288771 ?auto_288770 ) ( ON ?auto_288772 ?auto_288771 ) ( not ( = ?auto_288767 ?auto_288768 ) ) ( not ( = ?auto_288767 ?auto_288769 ) ) ( not ( = ?auto_288767 ?auto_288770 ) ) ( not ( = ?auto_288767 ?auto_288771 ) ) ( not ( = ?auto_288767 ?auto_288772 ) ) ( not ( = ?auto_288767 ?auto_288773 ) ) ( not ( = ?auto_288767 ?auto_288774 ) ) ( not ( = ?auto_288767 ?auto_288775 ) ) ( not ( = ?auto_288767 ?auto_288776 ) ) ( not ( = ?auto_288768 ?auto_288769 ) ) ( not ( = ?auto_288768 ?auto_288770 ) ) ( not ( = ?auto_288768 ?auto_288771 ) ) ( not ( = ?auto_288768 ?auto_288772 ) ) ( not ( = ?auto_288768 ?auto_288773 ) ) ( not ( = ?auto_288768 ?auto_288774 ) ) ( not ( = ?auto_288768 ?auto_288775 ) ) ( not ( = ?auto_288768 ?auto_288776 ) ) ( not ( = ?auto_288769 ?auto_288770 ) ) ( not ( = ?auto_288769 ?auto_288771 ) ) ( not ( = ?auto_288769 ?auto_288772 ) ) ( not ( = ?auto_288769 ?auto_288773 ) ) ( not ( = ?auto_288769 ?auto_288774 ) ) ( not ( = ?auto_288769 ?auto_288775 ) ) ( not ( = ?auto_288769 ?auto_288776 ) ) ( not ( = ?auto_288770 ?auto_288771 ) ) ( not ( = ?auto_288770 ?auto_288772 ) ) ( not ( = ?auto_288770 ?auto_288773 ) ) ( not ( = ?auto_288770 ?auto_288774 ) ) ( not ( = ?auto_288770 ?auto_288775 ) ) ( not ( = ?auto_288770 ?auto_288776 ) ) ( not ( = ?auto_288771 ?auto_288772 ) ) ( not ( = ?auto_288771 ?auto_288773 ) ) ( not ( = ?auto_288771 ?auto_288774 ) ) ( not ( = ?auto_288771 ?auto_288775 ) ) ( not ( = ?auto_288771 ?auto_288776 ) ) ( not ( = ?auto_288772 ?auto_288773 ) ) ( not ( = ?auto_288772 ?auto_288774 ) ) ( not ( = ?auto_288772 ?auto_288775 ) ) ( not ( = ?auto_288772 ?auto_288776 ) ) ( not ( = ?auto_288773 ?auto_288774 ) ) ( not ( = ?auto_288773 ?auto_288775 ) ) ( not ( = ?auto_288773 ?auto_288776 ) ) ( not ( = ?auto_288774 ?auto_288775 ) ) ( not ( = ?auto_288774 ?auto_288776 ) ) ( not ( = ?auto_288775 ?auto_288776 ) ) ( ON ?auto_288774 ?auto_288775 ) ( CLEAR ?auto_288772 ) ( ON ?auto_288773 ?auto_288774 ) ( CLEAR ?auto_288773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_288767 ?auto_288768 ?auto_288769 ?auto_288770 ?auto_288771 ?auto_288772 ?auto_288773 )
      ( MAKE-9PILE ?auto_288767 ?auto_288768 ?auto_288769 ?auto_288770 ?auto_288771 ?auto_288772 ?auto_288773 ?auto_288774 ?auto_288775 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_288786 - BLOCK
      ?auto_288787 - BLOCK
      ?auto_288788 - BLOCK
      ?auto_288789 - BLOCK
      ?auto_288790 - BLOCK
      ?auto_288791 - BLOCK
      ?auto_288792 - BLOCK
      ?auto_288793 - BLOCK
      ?auto_288794 - BLOCK
    )
    :vars
    (
      ?auto_288795 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288794 ?auto_288795 ) ( ON-TABLE ?auto_288786 ) ( ON ?auto_288787 ?auto_288786 ) ( ON ?auto_288788 ?auto_288787 ) ( ON ?auto_288789 ?auto_288788 ) ( ON ?auto_288790 ?auto_288789 ) ( not ( = ?auto_288786 ?auto_288787 ) ) ( not ( = ?auto_288786 ?auto_288788 ) ) ( not ( = ?auto_288786 ?auto_288789 ) ) ( not ( = ?auto_288786 ?auto_288790 ) ) ( not ( = ?auto_288786 ?auto_288791 ) ) ( not ( = ?auto_288786 ?auto_288792 ) ) ( not ( = ?auto_288786 ?auto_288793 ) ) ( not ( = ?auto_288786 ?auto_288794 ) ) ( not ( = ?auto_288786 ?auto_288795 ) ) ( not ( = ?auto_288787 ?auto_288788 ) ) ( not ( = ?auto_288787 ?auto_288789 ) ) ( not ( = ?auto_288787 ?auto_288790 ) ) ( not ( = ?auto_288787 ?auto_288791 ) ) ( not ( = ?auto_288787 ?auto_288792 ) ) ( not ( = ?auto_288787 ?auto_288793 ) ) ( not ( = ?auto_288787 ?auto_288794 ) ) ( not ( = ?auto_288787 ?auto_288795 ) ) ( not ( = ?auto_288788 ?auto_288789 ) ) ( not ( = ?auto_288788 ?auto_288790 ) ) ( not ( = ?auto_288788 ?auto_288791 ) ) ( not ( = ?auto_288788 ?auto_288792 ) ) ( not ( = ?auto_288788 ?auto_288793 ) ) ( not ( = ?auto_288788 ?auto_288794 ) ) ( not ( = ?auto_288788 ?auto_288795 ) ) ( not ( = ?auto_288789 ?auto_288790 ) ) ( not ( = ?auto_288789 ?auto_288791 ) ) ( not ( = ?auto_288789 ?auto_288792 ) ) ( not ( = ?auto_288789 ?auto_288793 ) ) ( not ( = ?auto_288789 ?auto_288794 ) ) ( not ( = ?auto_288789 ?auto_288795 ) ) ( not ( = ?auto_288790 ?auto_288791 ) ) ( not ( = ?auto_288790 ?auto_288792 ) ) ( not ( = ?auto_288790 ?auto_288793 ) ) ( not ( = ?auto_288790 ?auto_288794 ) ) ( not ( = ?auto_288790 ?auto_288795 ) ) ( not ( = ?auto_288791 ?auto_288792 ) ) ( not ( = ?auto_288791 ?auto_288793 ) ) ( not ( = ?auto_288791 ?auto_288794 ) ) ( not ( = ?auto_288791 ?auto_288795 ) ) ( not ( = ?auto_288792 ?auto_288793 ) ) ( not ( = ?auto_288792 ?auto_288794 ) ) ( not ( = ?auto_288792 ?auto_288795 ) ) ( not ( = ?auto_288793 ?auto_288794 ) ) ( not ( = ?auto_288793 ?auto_288795 ) ) ( not ( = ?auto_288794 ?auto_288795 ) ) ( ON ?auto_288793 ?auto_288794 ) ( ON ?auto_288792 ?auto_288793 ) ( CLEAR ?auto_288790 ) ( ON ?auto_288791 ?auto_288792 ) ( CLEAR ?auto_288791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_288786 ?auto_288787 ?auto_288788 ?auto_288789 ?auto_288790 ?auto_288791 )
      ( MAKE-9PILE ?auto_288786 ?auto_288787 ?auto_288788 ?auto_288789 ?auto_288790 ?auto_288791 ?auto_288792 ?auto_288793 ?auto_288794 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_288805 - BLOCK
      ?auto_288806 - BLOCK
      ?auto_288807 - BLOCK
      ?auto_288808 - BLOCK
      ?auto_288809 - BLOCK
      ?auto_288810 - BLOCK
      ?auto_288811 - BLOCK
      ?auto_288812 - BLOCK
      ?auto_288813 - BLOCK
    )
    :vars
    (
      ?auto_288814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288813 ?auto_288814 ) ( ON-TABLE ?auto_288805 ) ( ON ?auto_288806 ?auto_288805 ) ( ON ?auto_288807 ?auto_288806 ) ( ON ?auto_288808 ?auto_288807 ) ( ON ?auto_288809 ?auto_288808 ) ( not ( = ?auto_288805 ?auto_288806 ) ) ( not ( = ?auto_288805 ?auto_288807 ) ) ( not ( = ?auto_288805 ?auto_288808 ) ) ( not ( = ?auto_288805 ?auto_288809 ) ) ( not ( = ?auto_288805 ?auto_288810 ) ) ( not ( = ?auto_288805 ?auto_288811 ) ) ( not ( = ?auto_288805 ?auto_288812 ) ) ( not ( = ?auto_288805 ?auto_288813 ) ) ( not ( = ?auto_288805 ?auto_288814 ) ) ( not ( = ?auto_288806 ?auto_288807 ) ) ( not ( = ?auto_288806 ?auto_288808 ) ) ( not ( = ?auto_288806 ?auto_288809 ) ) ( not ( = ?auto_288806 ?auto_288810 ) ) ( not ( = ?auto_288806 ?auto_288811 ) ) ( not ( = ?auto_288806 ?auto_288812 ) ) ( not ( = ?auto_288806 ?auto_288813 ) ) ( not ( = ?auto_288806 ?auto_288814 ) ) ( not ( = ?auto_288807 ?auto_288808 ) ) ( not ( = ?auto_288807 ?auto_288809 ) ) ( not ( = ?auto_288807 ?auto_288810 ) ) ( not ( = ?auto_288807 ?auto_288811 ) ) ( not ( = ?auto_288807 ?auto_288812 ) ) ( not ( = ?auto_288807 ?auto_288813 ) ) ( not ( = ?auto_288807 ?auto_288814 ) ) ( not ( = ?auto_288808 ?auto_288809 ) ) ( not ( = ?auto_288808 ?auto_288810 ) ) ( not ( = ?auto_288808 ?auto_288811 ) ) ( not ( = ?auto_288808 ?auto_288812 ) ) ( not ( = ?auto_288808 ?auto_288813 ) ) ( not ( = ?auto_288808 ?auto_288814 ) ) ( not ( = ?auto_288809 ?auto_288810 ) ) ( not ( = ?auto_288809 ?auto_288811 ) ) ( not ( = ?auto_288809 ?auto_288812 ) ) ( not ( = ?auto_288809 ?auto_288813 ) ) ( not ( = ?auto_288809 ?auto_288814 ) ) ( not ( = ?auto_288810 ?auto_288811 ) ) ( not ( = ?auto_288810 ?auto_288812 ) ) ( not ( = ?auto_288810 ?auto_288813 ) ) ( not ( = ?auto_288810 ?auto_288814 ) ) ( not ( = ?auto_288811 ?auto_288812 ) ) ( not ( = ?auto_288811 ?auto_288813 ) ) ( not ( = ?auto_288811 ?auto_288814 ) ) ( not ( = ?auto_288812 ?auto_288813 ) ) ( not ( = ?auto_288812 ?auto_288814 ) ) ( not ( = ?auto_288813 ?auto_288814 ) ) ( ON ?auto_288812 ?auto_288813 ) ( ON ?auto_288811 ?auto_288812 ) ( CLEAR ?auto_288809 ) ( ON ?auto_288810 ?auto_288811 ) ( CLEAR ?auto_288810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_288805 ?auto_288806 ?auto_288807 ?auto_288808 ?auto_288809 ?auto_288810 )
      ( MAKE-9PILE ?auto_288805 ?auto_288806 ?auto_288807 ?auto_288808 ?auto_288809 ?auto_288810 ?auto_288811 ?auto_288812 ?auto_288813 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_288824 - BLOCK
      ?auto_288825 - BLOCK
      ?auto_288826 - BLOCK
      ?auto_288827 - BLOCK
      ?auto_288828 - BLOCK
      ?auto_288829 - BLOCK
      ?auto_288830 - BLOCK
      ?auto_288831 - BLOCK
      ?auto_288832 - BLOCK
    )
    :vars
    (
      ?auto_288833 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288832 ?auto_288833 ) ( ON-TABLE ?auto_288824 ) ( ON ?auto_288825 ?auto_288824 ) ( ON ?auto_288826 ?auto_288825 ) ( ON ?auto_288827 ?auto_288826 ) ( not ( = ?auto_288824 ?auto_288825 ) ) ( not ( = ?auto_288824 ?auto_288826 ) ) ( not ( = ?auto_288824 ?auto_288827 ) ) ( not ( = ?auto_288824 ?auto_288828 ) ) ( not ( = ?auto_288824 ?auto_288829 ) ) ( not ( = ?auto_288824 ?auto_288830 ) ) ( not ( = ?auto_288824 ?auto_288831 ) ) ( not ( = ?auto_288824 ?auto_288832 ) ) ( not ( = ?auto_288824 ?auto_288833 ) ) ( not ( = ?auto_288825 ?auto_288826 ) ) ( not ( = ?auto_288825 ?auto_288827 ) ) ( not ( = ?auto_288825 ?auto_288828 ) ) ( not ( = ?auto_288825 ?auto_288829 ) ) ( not ( = ?auto_288825 ?auto_288830 ) ) ( not ( = ?auto_288825 ?auto_288831 ) ) ( not ( = ?auto_288825 ?auto_288832 ) ) ( not ( = ?auto_288825 ?auto_288833 ) ) ( not ( = ?auto_288826 ?auto_288827 ) ) ( not ( = ?auto_288826 ?auto_288828 ) ) ( not ( = ?auto_288826 ?auto_288829 ) ) ( not ( = ?auto_288826 ?auto_288830 ) ) ( not ( = ?auto_288826 ?auto_288831 ) ) ( not ( = ?auto_288826 ?auto_288832 ) ) ( not ( = ?auto_288826 ?auto_288833 ) ) ( not ( = ?auto_288827 ?auto_288828 ) ) ( not ( = ?auto_288827 ?auto_288829 ) ) ( not ( = ?auto_288827 ?auto_288830 ) ) ( not ( = ?auto_288827 ?auto_288831 ) ) ( not ( = ?auto_288827 ?auto_288832 ) ) ( not ( = ?auto_288827 ?auto_288833 ) ) ( not ( = ?auto_288828 ?auto_288829 ) ) ( not ( = ?auto_288828 ?auto_288830 ) ) ( not ( = ?auto_288828 ?auto_288831 ) ) ( not ( = ?auto_288828 ?auto_288832 ) ) ( not ( = ?auto_288828 ?auto_288833 ) ) ( not ( = ?auto_288829 ?auto_288830 ) ) ( not ( = ?auto_288829 ?auto_288831 ) ) ( not ( = ?auto_288829 ?auto_288832 ) ) ( not ( = ?auto_288829 ?auto_288833 ) ) ( not ( = ?auto_288830 ?auto_288831 ) ) ( not ( = ?auto_288830 ?auto_288832 ) ) ( not ( = ?auto_288830 ?auto_288833 ) ) ( not ( = ?auto_288831 ?auto_288832 ) ) ( not ( = ?auto_288831 ?auto_288833 ) ) ( not ( = ?auto_288832 ?auto_288833 ) ) ( ON ?auto_288831 ?auto_288832 ) ( ON ?auto_288830 ?auto_288831 ) ( ON ?auto_288829 ?auto_288830 ) ( CLEAR ?auto_288827 ) ( ON ?auto_288828 ?auto_288829 ) ( CLEAR ?auto_288828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_288824 ?auto_288825 ?auto_288826 ?auto_288827 ?auto_288828 )
      ( MAKE-9PILE ?auto_288824 ?auto_288825 ?auto_288826 ?auto_288827 ?auto_288828 ?auto_288829 ?auto_288830 ?auto_288831 ?auto_288832 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_288843 - BLOCK
      ?auto_288844 - BLOCK
      ?auto_288845 - BLOCK
      ?auto_288846 - BLOCK
      ?auto_288847 - BLOCK
      ?auto_288848 - BLOCK
      ?auto_288849 - BLOCK
      ?auto_288850 - BLOCK
      ?auto_288851 - BLOCK
    )
    :vars
    (
      ?auto_288852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288851 ?auto_288852 ) ( ON-TABLE ?auto_288843 ) ( ON ?auto_288844 ?auto_288843 ) ( ON ?auto_288845 ?auto_288844 ) ( ON ?auto_288846 ?auto_288845 ) ( not ( = ?auto_288843 ?auto_288844 ) ) ( not ( = ?auto_288843 ?auto_288845 ) ) ( not ( = ?auto_288843 ?auto_288846 ) ) ( not ( = ?auto_288843 ?auto_288847 ) ) ( not ( = ?auto_288843 ?auto_288848 ) ) ( not ( = ?auto_288843 ?auto_288849 ) ) ( not ( = ?auto_288843 ?auto_288850 ) ) ( not ( = ?auto_288843 ?auto_288851 ) ) ( not ( = ?auto_288843 ?auto_288852 ) ) ( not ( = ?auto_288844 ?auto_288845 ) ) ( not ( = ?auto_288844 ?auto_288846 ) ) ( not ( = ?auto_288844 ?auto_288847 ) ) ( not ( = ?auto_288844 ?auto_288848 ) ) ( not ( = ?auto_288844 ?auto_288849 ) ) ( not ( = ?auto_288844 ?auto_288850 ) ) ( not ( = ?auto_288844 ?auto_288851 ) ) ( not ( = ?auto_288844 ?auto_288852 ) ) ( not ( = ?auto_288845 ?auto_288846 ) ) ( not ( = ?auto_288845 ?auto_288847 ) ) ( not ( = ?auto_288845 ?auto_288848 ) ) ( not ( = ?auto_288845 ?auto_288849 ) ) ( not ( = ?auto_288845 ?auto_288850 ) ) ( not ( = ?auto_288845 ?auto_288851 ) ) ( not ( = ?auto_288845 ?auto_288852 ) ) ( not ( = ?auto_288846 ?auto_288847 ) ) ( not ( = ?auto_288846 ?auto_288848 ) ) ( not ( = ?auto_288846 ?auto_288849 ) ) ( not ( = ?auto_288846 ?auto_288850 ) ) ( not ( = ?auto_288846 ?auto_288851 ) ) ( not ( = ?auto_288846 ?auto_288852 ) ) ( not ( = ?auto_288847 ?auto_288848 ) ) ( not ( = ?auto_288847 ?auto_288849 ) ) ( not ( = ?auto_288847 ?auto_288850 ) ) ( not ( = ?auto_288847 ?auto_288851 ) ) ( not ( = ?auto_288847 ?auto_288852 ) ) ( not ( = ?auto_288848 ?auto_288849 ) ) ( not ( = ?auto_288848 ?auto_288850 ) ) ( not ( = ?auto_288848 ?auto_288851 ) ) ( not ( = ?auto_288848 ?auto_288852 ) ) ( not ( = ?auto_288849 ?auto_288850 ) ) ( not ( = ?auto_288849 ?auto_288851 ) ) ( not ( = ?auto_288849 ?auto_288852 ) ) ( not ( = ?auto_288850 ?auto_288851 ) ) ( not ( = ?auto_288850 ?auto_288852 ) ) ( not ( = ?auto_288851 ?auto_288852 ) ) ( ON ?auto_288850 ?auto_288851 ) ( ON ?auto_288849 ?auto_288850 ) ( ON ?auto_288848 ?auto_288849 ) ( CLEAR ?auto_288846 ) ( ON ?auto_288847 ?auto_288848 ) ( CLEAR ?auto_288847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_288843 ?auto_288844 ?auto_288845 ?auto_288846 ?auto_288847 )
      ( MAKE-9PILE ?auto_288843 ?auto_288844 ?auto_288845 ?auto_288846 ?auto_288847 ?auto_288848 ?auto_288849 ?auto_288850 ?auto_288851 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_288862 - BLOCK
      ?auto_288863 - BLOCK
      ?auto_288864 - BLOCK
      ?auto_288865 - BLOCK
      ?auto_288866 - BLOCK
      ?auto_288867 - BLOCK
      ?auto_288868 - BLOCK
      ?auto_288869 - BLOCK
      ?auto_288870 - BLOCK
    )
    :vars
    (
      ?auto_288871 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288870 ?auto_288871 ) ( ON-TABLE ?auto_288862 ) ( ON ?auto_288863 ?auto_288862 ) ( ON ?auto_288864 ?auto_288863 ) ( not ( = ?auto_288862 ?auto_288863 ) ) ( not ( = ?auto_288862 ?auto_288864 ) ) ( not ( = ?auto_288862 ?auto_288865 ) ) ( not ( = ?auto_288862 ?auto_288866 ) ) ( not ( = ?auto_288862 ?auto_288867 ) ) ( not ( = ?auto_288862 ?auto_288868 ) ) ( not ( = ?auto_288862 ?auto_288869 ) ) ( not ( = ?auto_288862 ?auto_288870 ) ) ( not ( = ?auto_288862 ?auto_288871 ) ) ( not ( = ?auto_288863 ?auto_288864 ) ) ( not ( = ?auto_288863 ?auto_288865 ) ) ( not ( = ?auto_288863 ?auto_288866 ) ) ( not ( = ?auto_288863 ?auto_288867 ) ) ( not ( = ?auto_288863 ?auto_288868 ) ) ( not ( = ?auto_288863 ?auto_288869 ) ) ( not ( = ?auto_288863 ?auto_288870 ) ) ( not ( = ?auto_288863 ?auto_288871 ) ) ( not ( = ?auto_288864 ?auto_288865 ) ) ( not ( = ?auto_288864 ?auto_288866 ) ) ( not ( = ?auto_288864 ?auto_288867 ) ) ( not ( = ?auto_288864 ?auto_288868 ) ) ( not ( = ?auto_288864 ?auto_288869 ) ) ( not ( = ?auto_288864 ?auto_288870 ) ) ( not ( = ?auto_288864 ?auto_288871 ) ) ( not ( = ?auto_288865 ?auto_288866 ) ) ( not ( = ?auto_288865 ?auto_288867 ) ) ( not ( = ?auto_288865 ?auto_288868 ) ) ( not ( = ?auto_288865 ?auto_288869 ) ) ( not ( = ?auto_288865 ?auto_288870 ) ) ( not ( = ?auto_288865 ?auto_288871 ) ) ( not ( = ?auto_288866 ?auto_288867 ) ) ( not ( = ?auto_288866 ?auto_288868 ) ) ( not ( = ?auto_288866 ?auto_288869 ) ) ( not ( = ?auto_288866 ?auto_288870 ) ) ( not ( = ?auto_288866 ?auto_288871 ) ) ( not ( = ?auto_288867 ?auto_288868 ) ) ( not ( = ?auto_288867 ?auto_288869 ) ) ( not ( = ?auto_288867 ?auto_288870 ) ) ( not ( = ?auto_288867 ?auto_288871 ) ) ( not ( = ?auto_288868 ?auto_288869 ) ) ( not ( = ?auto_288868 ?auto_288870 ) ) ( not ( = ?auto_288868 ?auto_288871 ) ) ( not ( = ?auto_288869 ?auto_288870 ) ) ( not ( = ?auto_288869 ?auto_288871 ) ) ( not ( = ?auto_288870 ?auto_288871 ) ) ( ON ?auto_288869 ?auto_288870 ) ( ON ?auto_288868 ?auto_288869 ) ( ON ?auto_288867 ?auto_288868 ) ( ON ?auto_288866 ?auto_288867 ) ( CLEAR ?auto_288864 ) ( ON ?auto_288865 ?auto_288866 ) ( CLEAR ?auto_288865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_288862 ?auto_288863 ?auto_288864 ?auto_288865 )
      ( MAKE-9PILE ?auto_288862 ?auto_288863 ?auto_288864 ?auto_288865 ?auto_288866 ?auto_288867 ?auto_288868 ?auto_288869 ?auto_288870 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_288881 - BLOCK
      ?auto_288882 - BLOCK
      ?auto_288883 - BLOCK
      ?auto_288884 - BLOCK
      ?auto_288885 - BLOCK
      ?auto_288886 - BLOCK
      ?auto_288887 - BLOCK
      ?auto_288888 - BLOCK
      ?auto_288889 - BLOCK
    )
    :vars
    (
      ?auto_288890 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288889 ?auto_288890 ) ( ON-TABLE ?auto_288881 ) ( ON ?auto_288882 ?auto_288881 ) ( ON ?auto_288883 ?auto_288882 ) ( not ( = ?auto_288881 ?auto_288882 ) ) ( not ( = ?auto_288881 ?auto_288883 ) ) ( not ( = ?auto_288881 ?auto_288884 ) ) ( not ( = ?auto_288881 ?auto_288885 ) ) ( not ( = ?auto_288881 ?auto_288886 ) ) ( not ( = ?auto_288881 ?auto_288887 ) ) ( not ( = ?auto_288881 ?auto_288888 ) ) ( not ( = ?auto_288881 ?auto_288889 ) ) ( not ( = ?auto_288881 ?auto_288890 ) ) ( not ( = ?auto_288882 ?auto_288883 ) ) ( not ( = ?auto_288882 ?auto_288884 ) ) ( not ( = ?auto_288882 ?auto_288885 ) ) ( not ( = ?auto_288882 ?auto_288886 ) ) ( not ( = ?auto_288882 ?auto_288887 ) ) ( not ( = ?auto_288882 ?auto_288888 ) ) ( not ( = ?auto_288882 ?auto_288889 ) ) ( not ( = ?auto_288882 ?auto_288890 ) ) ( not ( = ?auto_288883 ?auto_288884 ) ) ( not ( = ?auto_288883 ?auto_288885 ) ) ( not ( = ?auto_288883 ?auto_288886 ) ) ( not ( = ?auto_288883 ?auto_288887 ) ) ( not ( = ?auto_288883 ?auto_288888 ) ) ( not ( = ?auto_288883 ?auto_288889 ) ) ( not ( = ?auto_288883 ?auto_288890 ) ) ( not ( = ?auto_288884 ?auto_288885 ) ) ( not ( = ?auto_288884 ?auto_288886 ) ) ( not ( = ?auto_288884 ?auto_288887 ) ) ( not ( = ?auto_288884 ?auto_288888 ) ) ( not ( = ?auto_288884 ?auto_288889 ) ) ( not ( = ?auto_288884 ?auto_288890 ) ) ( not ( = ?auto_288885 ?auto_288886 ) ) ( not ( = ?auto_288885 ?auto_288887 ) ) ( not ( = ?auto_288885 ?auto_288888 ) ) ( not ( = ?auto_288885 ?auto_288889 ) ) ( not ( = ?auto_288885 ?auto_288890 ) ) ( not ( = ?auto_288886 ?auto_288887 ) ) ( not ( = ?auto_288886 ?auto_288888 ) ) ( not ( = ?auto_288886 ?auto_288889 ) ) ( not ( = ?auto_288886 ?auto_288890 ) ) ( not ( = ?auto_288887 ?auto_288888 ) ) ( not ( = ?auto_288887 ?auto_288889 ) ) ( not ( = ?auto_288887 ?auto_288890 ) ) ( not ( = ?auto_288888 ?auto_288889 ) ) ( not ( = ?auto_288888 ?auto_288890 ) ) ( not ( = ?auto_288889 ?auto_288890 ) ) ( ON ?auto_288888 ?auto_288889 ) ( ON ?auto_288887 ?auto_288888 ) ( ON ?auto_288886 ?auto_288887 ) ( ON ?auto_288885 ?auto_288886 ) ( CLEAR ?auto_288883 ) ( ON ?auto_288884 ?auto_288885 ) ( CLEAR ?auto_288884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_288881 ?auto_288882 ?auto_288883 ?auto_288884 )
      ( MAKE-9PILE ?auto_288881 ?auto_288882 ?auto_288883 ?auto_288884 ?auto_288885 ?auto_288886 ?auto_288887 ?auto_288888 ?auto_288889 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_288900 - BLOCK
      ?auto_288901 - BLOCK
      ?auto_288902 - BLOCK
      ?auto_288903 - BLOCK
      ?auto_288904 - BLOCK
      ?auto_288905 - BLOCK
      ?auto_288906 - BLOCK
      ?auto_288907 - BLOCK
      ?auto_288908 - BLOCK
    )
    :vars
    (
      ?auto_288909 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288908 ?auto_288909 ) ( ON-TABLE ?auto_288900 ) ( ON ?auto_288901 ?auto_288900 ) ( not ( = ?auto_288900 ?auto_288901 ) ) ( not ( = ?auto_288900 ?auto_288902 ) ) ( not ( = ?auto_288900 ?auto_288903 ) ) ( not ( = ?auto_288900 ?auto_288904 ) ) ( not ( = ?auto_288900 ?auto_288905 ) ) ( not ( = ?auto_288900 ?auto_288906 ) ) ( not ( = ?auto_288900 ?auto_288907 ) ) ( not ( = ?auto_288900 ?auto_288908 ) ) ( not ( = ?auto_288900 ?auto_288909 ) ) ( not ( = ?auto_288901 ?auto_288902 ) ) ( not ( = ?auto_288901 ?auto_288903 ) ) ( not ( = ?auto_288901 ?auto_288904 ) ) ( not ( = ?auto_288901 ?auto_288905 ) ) ( not ( = ?auto_288901 ?auto_288906 ) ) ( not ( = ?auto_288901 ?auto_288907 ) ) ( not ( = ?auto_288901 ?auto_288908 ) ) ( not ( = ?auto_288901 ?auto_288909 ) ) ( not ( = ?auto_288902 ?auto_288903 ) ) ( not ( = ?auto_288902 ?auto_288904 ) ) ( not ( = ?auto_288902 ?auto_288905 ) ) ( not ( = ?auto_288902 ?auto_288906 ) ) ( not ( = ?auto_288902 ?auto_288907 ) ) ( not ( = ?auto_288902 ?auto_288908 ) ) ( not ( = ?auto_288902 ?auto_288909 ) ) ( not ( = ?auto_288903 ?auto_288904 ) ) ( not ( = ?auto_288903 ?auto_288905 ) ) ( not ( = ?auto_288903 ?auto_288906 ) ) ( not ( = ?auto_288903 ?auto_288907 ) ) ( not ( = ?auto_288903 ?auto_288908 ) ) ( not ( = ?auto_288903 ?auto_288909 ) ) ( not ( = ?auto_288904 ?auto_288905 ) ) ( not ( = ?auto_288904 ?auto_288906 ) ) ( not ( = ?auto_288904 ?auto_288907 ) ) ( not ( = ?auto_288904 ?auto_288908 ) ) ( not ( = ?auto_288904 ?auto_288909 ) ) ( not ( = ?auto_288905 ?auto_288906 ) ) ( not ( = ?auto_288905 ?auto_288907 ) ) ( not ( = ?auto_288905 ?auto_288908 ) ) ( not ( = ?auto_288905 ?auto_288909 ) ) ( not ( = ?auto_288906 ?auto_288907 ) ) ( not ( = ?auto_288906 ?auto_288908 ) ) ( not ( = ?auto_288906 ?auto_288909 ) ) ( not ( = ?auto_288907 ?auto_288908 ) ) ( not ( = ?auto_288907 ?auto_288909 ) ) ( not ( = ?auto_288908 ?auto_288909 ) ) ( ON ?auto_288907 ?auto_288908 ) ( ON ?auto_288906 ?auto_288907 ) ( ON ?auto_288905 ?auto_288906 ) ( ON ?auto_288904 ?auto_288905 ) ( ON ?auto_288903 ?auto_288904 ) ( CLEAR ?auto_288901 ) ( ON ?auto_288902 ?auto_288903 ) ( CLEAR ?auto_288902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_288900 ?auto_288901 ?auto_288902 )
      ( MAKE-9PILE ?auto_288900 ?auto_288901 ?auto_288902 ?auto_288903 ?auto_288904 ?auto_288905 ?auto_288906 ?auto_288907 ?auto_288908 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_288919 - BLOCK
      ?auto_288920 - BLOCK
      ?auto_288921 - BLOCK
      ?auto_288922 - BLOCK
      ?auto_288923 - BLOCK
      ?auto_288924 - BLOCK
      ?auto_288925 - BLOCK
      ?auto_288926 - BLOCK
      ?auto_288927 - BLOCK
    )
    :vars
    (
      ?auto_288928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288927 ?auto_288928 ) ( ON-TABLE ?auto_288919 ) ( ON ?auto_288920 ?auto_288919 ) ( not ( = ?auto_288919 ?auto_288920 ) ) ( not ( = ?auto_288919 ?auto_288921 ) ) ( not ( = ?auto_288919 ?auto_288922 ) ) ( not ( = ?auto_288919 ?auto_288923 ) ) ( not ( = ?auto_288919 ?auto_288924 ) ) ( not ( = ?auto_288919 ?auto_288925 ) ) ( not ( = ?auto_288919 ?auto_288926 ) ) ( not ( = ?auto_288919 ?auto_288927 ) ) ( not ( = ?auto_288919 ?auto_288928 ) ) ( not ( = ?auto_288920 ?auto_288921 ) ) ( not ( = ?auto_288920 ?auto_288922 ) ) ( not ( = ?auto_288920 ?auto_288923 ) ) ( not ( = ?auto_288920 ?auto_288924 ) ) ( not ( = ?auto_288920 ?auto_288925 ) ) ( not ( = ?auto_288920 ?auto_288926 ) ) ( not ( = ?auto_288920 ?auto_288927 ) ) ( not ( = ?auto_288920 ?auto_288928 ) ) ( not ( = ?auto_288921 ?auto_288922 ) ) ( not ( = ?auto_288921 ?auto_288923 ) ) ( not ( = ?auto_288921 ?auto_288924 ) ) ( not ( = ?auto_288921 ?auto_288925 ) ) ( not ( = ?auto_288921 ?auto_288926 ) ) ( not ( = ?auto_288921 ?auto_288927 ) ) ( not ( = ?auto_288921 ?auto_288928 ) ) ( not ( = ?auto_288922 ?auto_288923 ) ) ( not ( = ?auto_288922 ?auto_288924 ) ) ( not ( = ?auto_288922 ?auto_288925 ) ) ( not ( = ?auto_288922 ?auto_288926 ) ) ( not ( = ?auto_288922 ?auto_288927 ) ) ( not ( = ?auto_288922 ?auto_288928 ) ) ( not ( = ?auto_288923 ?auto_288924 ) ) ( not ( = ?auto_288923 ?auto_288925 ) ) ( not ( = ?auto_288923 ?auto_288926 ) ) ( not ( = ?auto_288923 ?auto_288927 ) ) ( not ( = ?auto_288923 ?auto_288928 ) ) ( not ( = ?auto_288924 ?auto_288925 ) ) ( not ( = ?auto_288924 ?auto_288926 ) ) ( not ( = ?auto_288924 ?auto_288927 ) ) ( not ( = ?auto_288924 ?auto_288928 ) ) ( not ( = ?auto_288925 ?auto_288926 ) ) ( not ( = ?auto_288925 ?auto_288927 ) ) ( not ( = ?auto_288925 ?auto_288928 ) ) ( not ( = ?auto_288926 ?auto_288927 ) ) ( not ( = ?auto_288926 ?auto_288928 ) ) ( not ( = ?auto_288927 ?auto_288928 ) ) ( ON ?auto_288926 ?auto_288927 ) ( ON ?auto_288925 ?auto_288926 ) ( ON ?auto_288924 ?auto_288925 ) ( ON ?auto_288923 ?auto_288924 ) ( ON ?auto_288922 ?auto_288923 ) ( CLEAR ?auto_288920 ) ( ON ?auto_288921 ?auto_288922 ) ( CLEAR ?auto_288921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_288919 ?auto_288920 ?auto_288921 )
      ( MAKE-9PILE ?auto_288919 ?auto_288920 ?auto_288921 ?auto_288922 ?auto_288923 ?auto_288924 ?auto_288925 ?auto_288926 ?auto_288927 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_288938 - BLOCK
      ?auto_288939 - BLOCK
      ?auto_288940 - BLOCK
      ?auto_288941 - BLOCK
      ?auto_288942 - BLOCK
      ?auto_288943 - BLOCK
      ?auto_288944 - BLOCK
      ?auto_288945 - BLOCK
      ?auto_288946 - BLOCK
    )
    :vars
    (
      ?auto_288947 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288946 ?auto_288947 ) ( ON-TABLE ?auto_288938 ) ( not ( = ?auto_288938 ?auto_288939 ) ) ( not ( = ?auto_288938 ?auto_288940 ) ) ( not ( = ?auto_288938 ?auto_288941 ) ) ( not ( = ?auto_288938 ?auto_288942 ) ) ( not ( = ?auto_288938 ?auto_288943 ) ) ( not ( = ?auto_288938 ?auto_288944 ) ) ( not ( = ?auto_288938 ?auto_288945 ) ) ( not ( = ?auto_288938 ?auto_288946 ) ) ( not ( = ?auto_288938 ?auto_288947 ) ) ( not ( = ?auto_288939 ?auto_288940 ) ) ( not ( = ?auto_288939 ?auto_288941 ) ) ( not ( = ?auto_288939 ?auto_288942 ) ) ( not ( = ?auto_288939 ?auto_288943 ) ) ( not ( = ?auto_288939 ?auto_288944 ) ) ( not ( = ?auto_288939 ?auto_288945 ) ) ( not ( = ?auto_288939 ?auto_288946 ) ) ( not ( = ?auto_288939 ?auto_288947 ) ) ( not ( = ?auto_288940 ?auto_288941 ) ) ( not ( = ?auto_288940 ?auto_288942 ) ) ( not ( = ?auto_288940 ?auto_288943 ) ) ( not ( = ?auto_288940 ?auto_288944 ) ) ( not ( = ?auto_288940 ?auto_288945 ) ) ( not ( = ?auto_288940 ?auto_288946 ) ) ( not ( = ?auto_288940 ?auto_288947 ) ) ( not ( = ?auto_288941 ?auto_288942 ) ) ( not ( = ?auto_288941 ?auto_288943 ) ) ( not ( = ?auto_288941 ?auto_288944 ) ) ( not ( = ?auto_288941 ?auto_288945 ) ) ( not ( = ?auto_288941 ?auto_288946 ) ) ( not ( = ?auto_288941 ?auto_288947 ) ) ( not ( = ?auto_288942 ?auto_288943 ) ) ( not ( = ?auto_288942 ?auto_288944 ) ) ( not ( = ?auto_288942 ?auto_288945 ) ) ( not ( = ?auto_288942 ?auto_288946 ) ) ( not ( = ?auto_288942 ?auto_288947 ) ) ( not ( = ?auto_288943 ?auto_288944 ) ) ( not ( = ?auto_288943 ?auto_288945 ) ) ( not ( = ?auto_288943 ?auto_288946 ) ) ( not ( = ?auto_288943 ?auto_288947 ) ) ( not ( = ?auto_288944 ?auto_288945 ) ) ( not ( = ?auto_288944 ?auto_288946 ) ) ( not ( = ?auto_288944 ?auto_288947 ) ) ( not ( = ?auto_288945 ?auto_288946 ) ) ( not ( = ?auto_288945 ?auto_288947 ) ) ( not ( = ?auto_288946 ?auto_288947 ) ) ( ON ?auto_288945 ?auto_288946 ) ( ON ?auto_288944 ?auto_288945 ) ( ON ?auto_288943 ?auto_288944 ) ( ON ?auto_288942 ?auto_288943 ) ( ON ?auto_288941 ?auto_288942 ) ( ON ?auto_288940 ?auto_288941 ) ( CLEAR ?auto_288938 ) ( ON ?auto_288939 ?auto_288940 ) ( CLEAR ?auto_288939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_288938 ?auto_288939 )
      ( MAKE-9PILE ?auto_288938 ?auto_288939 ?auto_288940 ?auto_288941 ?auto_288942 ?auto_288943 ?auto_288944 ?auto_288945 ?auto_288946 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_288957 - BLOCK
      ?auto_288958 - BLOCK
      ?auto_288959 - BLOCK
      ?auto_288960 - BLOCK
      ?auto_288961 - BLOCK
      ?auto_288962 - BLOCK
      ?auto_288963 - BLOCK
      ?auto_288964 - BLOCK
      ?auto_288965 - BLOCK
    )
    :vars
    (
      ?auto_288966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288965 ?auto_288966 ) ( ON-TABLE ?auto_288957 ) ( not ( = ?auto_288957 ?auto_288958 ) ) ( not ( = ?auto_288957 ?auto_288959 ) ) ( not ( = ?auto_288957 ?auto_288960 ) ) ( not ( = ?auto_288957 ?auto_288961 ) ) ( not ( = ?auto_288957 ?auto_288962 ) ) ( not ( = ?auto_288957 ?auto_288963 ) ) ( not ( = ?auto_288957 ?auto_288964 ) ) ( not ( = ?auto_288957 ?auto_288965 ) ) ( not ( = ?auto_288957 ?auto_288966 ) ) ( not ( = ?auto_288958 ?auto_288959 ) ) ( not ( = ?auto_288958 ?auto_288960 ) ) ( not ( = ?auto_288958 ?auto_288961 ) ) ( not ( = ?auto_288958 ?auto_288962 ) ) ( not ( = ?auto_288958 ?auto_288963 ) ) ( not ( = ?auto_288958 ?auto_288964 ) ) ( not ( = ?auto_288958 ?auto_288965 ) ) ( not ( = ?auto_288958 ?auto_288966 ) ) ( not ( = ?auto_288959 ?auto_288960 ) ) ( not ( = ?auto_288959 ?auto_288961 ) ) ( not ( = ?auto_288959 ?auto_288962 ) ) ( not ( = ?auto_288959 ?auto_288963 ) ) ( not ( = ?auto_288959 ?auto_288964 ) ) ( not ( = ?auto_288959 ?auto_288965 ) ) ( not ( = ?auto_288959 ?auto_288966 ) ) ( not ( = ?auto_288960 ?auto_288961 ) ) ( not ( = ?auto_288960 ?auto_288962 ) ) ( not ( = ?auto_288960 ?auto_288963 ) ) ( not ( = ?auto_288960 ?auto_288964 ) ) ( not ( = ?auto_288960 ?auto_288965 ) ) ( not ( = ?auto_288960 ?auto_288966 ) ) ( not ( = ?auto_288961 ?auto_288962 ) ) ( not ( = ?auto_288961 ?auto_288963 ) ) ( not ( = ?auto_288961 ?auto_288964 ) ) ( not ( = ?auto_288961 ?auto_288965 ) ) ( not ( = ?auto_288961 ?auto_288966 ) ) ( not ( = ?auto_288962 ?auto_288963 ) ) ( not ( = ?auto_288962 ?auto_288964 ) ) ( not ( = ?auto_288962 ?auto_288965 ) ) ( not ( = ?auto_288962 ?auto_288966 ) ) ( not ( = ?auto_288963 ?auto_288964 ) ) ( not ( = ?auto_288963 ?auto_288965 ) ) ( not ( = ?auto_288963 ?auto_288966 ) ) ( not ( = ?auto_288964 ?auto_288965 ) ) ( not ( = ?auto_288964 ?auto_288966 ) ) ( not ( = ?auto_288965 ?auto_288966 ) ) ( ON ?auto_288964 ?auto_288965 ) ( ON ?auto_288963 ?auto_288964 ) ( ON ?auto_288962 ?auto_288963 ) ( ON ?auto_288961 ?auto_288962 ) ( ON ?auto_288960 ?auto_288961 ) ( ON ?auto_288959 ?auto_288960 ) ( CLEAR ?auto_288957 ) ( ON ?auto_288958 ?auto_288959 ) ( CLEAR ?auto_288958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_288957 ?auto_288958 )
      ( MAKE-9PILE ?auto_288957 ?auto_288958 ?auto_288959 ?auto_288960 ?auto_288961 ?auto_288962 ?auto_288963 ?auto_288964 ?auto_288965 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_288976 - BLOCK
      ?auto_288977 - BLOCK
      ?auto_288978 - BLOCK
      ?auto_288979 - BLOCK
      ?auto_288980 - BLOCK
      ?auto_288981 - BLOCK
      ?auto_288982 - BLOCK
      ?auto_288983 - BLOCK
      ?auto_288984 - BLOCK
    )
    :vars
    (
      ?auto_288985 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288984 ?auto_288985 ) ( not ( = ?auto_288976 ?auto_288977 ) ) ( not ( = ?auto_288976 ?auto_288978 ) ) ( not ( = ?auto_288976 ?auto_288979 ) ) ( not ( = ?auto_288976 ?auto_288980 ) ) ( not ( = ?auto_288976 ?auto_288981 ) ) ( not ( = ?auto_288976 ?auto_288982 ) ) ( not ( = ?auto_288976 ?auto_288983 ) ) ( not ( = ?auto_288976 ?auto_288984 ) ) ( not ( = ?auto_288976 ?auto_288985 ) ) ( not ( = ?auto_288977 ?auto_288978 ) ) ( not ( = ?auto_288977 ?auto_288979 ) ) ( not ( = ?auto_288977 ?auto_288980 ) ) ( not ( = ?auto_288977 ?auto_288981 ) ) ( not ( = ?auto_288977 ?auto_288982 ) ) ( not ( = ?auto_288977 ?auto_288983 ) ) ( not ( = ?auto_288977 ?auto_288984 ) ) ( not ( = ?auto_288977 ?auto_288985 ) ) ( not ( = ?auto_288978 ?auto_288979 ) ) ( not ( = ?auto_288978 ?auto_288980 ) ) ( not ( = ?auto_288978 ?auto_288981 ) ) ( not ( = ?auto_288978 ?auto_288982 ) ) ( not ( = ?auto_288978 ?auto_288983 ) ) ( not ( = ?auto_288978 ?auto_288984 ) ) ( not ( = ?auto_288978 ?auto_288985 ) ) ( not ( = ?auto_288979 ?auto_288980 ) ) ( not ( = ?auto_288979 ?auto_288981 ) ) ( not ( = ?auto_288979 ?auto_288982 ) ) ( not ( = ?auto_288979 ?auto_288983 ) ) ( not ( = ?auto_288979 ?auto_288984 ) ) ( not ( = ?auto_288979 ?auto_288985 ) ) ( not ( = ?auto_288980 ?auto_288981 ) ) ( not ( = ?auto_288980 ?auto_288982 ) ) ( not ( = ?auto_288980 ?auto_288983 ) ) ( not ( = ?auto_288980 ?auto_288984 ) ) ( not ( = ?auto_288980 ?auto_288985 ) ) ( not ( = ?auto_288981 ?auto_288982 ) ) ( not ( = ?auto_288981 ?auto_288983 ) ) ( not ( = ?auto_288981 ?auto_288984 ) ) ( not ( = ?auto_288981 ?auto_288985 ) ) ( not ( = ?auto_288982 ?auto_288983 ) ) ( not ( = ?auto_288982 ?auto_288984 ) ) ( not ( = ?auto_288982 ?auto_288985 ) ) ( not ( = ?auto_288983 ?auto_288984 ) ) ( not ( = ?auto_288983 ?auto_288985 ) ) ( not ( = ?auto_288984 ?auto_288985 ) ) ( ON ?auto_288983 ?auto_288984 ) ( ON ?auto_288982 ?auto_288983 ) ( ON ?auto_288981 ?auto_288982 ) ( ON ?auto_288980 ?auto_288981 ) ( ON ?auto_288979 ?auto_288980 ) ( ON ?auto_288978 ?auto_288979 ) ( ON ?auto_288977 ?auto_288978 ) ( ON ?auto_288976 ?auto_288977 ) ( CLEAR ?auto_288976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_288976 )
      ( MAKE-9PILE ?auto_288976 ?auto_288977 ?auto_288978 ?auto_288979 ?auto_288980 ?auto_288981 ?auto_288982 ?auto_288983 ?auto_288984 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_288995 - BLOCK
      ?auto_288996 - BLOCK
      ?auto_288997 - BLOCK
      ?auto_288998 - BLOCK
      ?auto_288999 - BLOCK
      ?auto_289000 - BLOCK
      ?auto_289001 - BLOCK
      ?auto_289002 - BLOCK
      ?auto_289003 - BLOCK
    )
    :vars
    (
      ?auto_289004 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289003 ?auto_289004 ) ( not ( = ?auto_288995 ?auto_288996 ) ) ( not ( = ?auto_288995 ?auto_288997 ) ) ( not ( = ?auto_288995 ?auto_288998 ) ) ( not ( = ?auto_288995 ?auto_288999 ) ) ( not ( = ?auto_288995 ?auto_289000 ) ) ( not ( = ?auto_288995 ?auto_289001 ) ) ( not ( = ?auto_288995 ?auto_289002 ) ) ( not ( = ?auto_288995 ?auto_289003 ) ) ( not ( = ?auto_288995 ?auto_289004 ) ) ( not ( = ?auto_288996 ?auto_288997 ) ) ( not ( = ?auto_288996 ?auto_288998 ) ) ( not ( = ?auto_288996 ?auto_288999 ) ) ( not ( = ?auto_288996 ?auto_289000 ) ) ( not ( = ?auto_288996 ?auto_289001 ) ) ( not ( = ?auto_288996 ?auto_289002 ) ) ( not ( = ?auto_288996 ?auto_289003 ) ) ( not ( = ?auto_288996 ?auto_289004 ) ) ( not ( = ?auto_288997 ?auto_288998 ) ) ( not ( = ?auto_288997 ?auto_288999 ) ) ( not ( = ?auto_288997 ?auto_289000 ) ) ( not ( = ?auto_288997 ?auto_289001 ) ) ( not ( = ?auto_288997 ?auto_289002 ) ) ( not ( = ?auto_288997 ?auto_289003 ) ) ( not ( = ?auto_288997 ?auto_289004 ) ) ( not ( = ?auto_288998 ?auto_288999 ) ) ( not ( = ?auto_288998 ?auto_289000 ) ) ( not ( = ?auto_288998 ?auto_289001 ) ) ( not ( = ?auto_288998 ?auto_289002 ) ) ( not ( = ?auto_288998 ?auto_289003 ) ) ( not ( = ?auto_288998 ?auto_289004 ) ) ( not ( = ?auto_288999 ?auto_289000 ) ) ( not ( = ?auto_288999 ?auto_289001 ) ) ( not ( = ?auto_288999 ?auto_289002 ) ) ( not ( = ?auto_288999 ?auto_289003 ) ) ( not ( = ?auto_288999 ?auto_289004 ) ) ( not ( = ?auto_289000 ?auto_289001 ) ) ( not ( = ?auto_289000 ?auto_289002 ) ) ( not ( = ?auto_289000 ?auto_289003 ) ) ( not ( = ?auto_289000 ?auto_289004 ) ) ( not ( = ?auto_289001 ?auto_289002 ) ) ( not ( = ?auto_289001 ?auto_289003 ) ) ( not ( = ?auto_289001 ?auto_289004 ) ) ( not ( = ?auto_289002 ?auto_289003 ) ) ( not ( = ?auto_289002 ?auto_289004 ) ) ( not ( = ?auto_289003 ?auto_289004 ) ) ( ON ?auto_289002 ?auto_289003 ) ( ON ?auto_289001 ?auto_289002 ) ( ON ?auto_289000 ?auto_289001 ) ( ON ?auto_288999 ?auto_289000 ) ( ON ?auto_288998 ?auto_288999 ) ( ON ?auto_288997 ?auto_288998 ) ( ON ?auto_288996 ?auto_288997 ) ( ON ?auto_288995 ?auto_288996 ) ( CLEAR ?auto_288995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_288995 )
      ( MAKE-9PILE ?auto_288995 ?auto_288996 ?auto_288997 ?auto_288998 ?auto_288999 ?auto_289000 ?auto_289001 ?auto_289002 ?auto_289003 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_289015 - BLOCK
      ?auto_289016 - BLOCK
      ?auto_289017 - BLOCK
      ?auto_289018 - BLOCK
      ?auto_289019 - BLOCK
      ?auto_289020 - BLOCK
      ?auto_289021 - BLOCK
      ?auto_289022 - BLOCK
      ?auto_289023 - BLOCK
      ?auto_289024 - BLOCK
    )
    :vars
    (
      ?auto_289025 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_289023 ) ( ON ?auto_289024 ?auto_289025 ) ( CLEAR ?auto_289024 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_289015 ) ( ON ?auto_289016 ?auto_289015 ) ( ON ?auto_289017 ?auto_289016 ) ( ON ?auto_289018 ?auto_289017 ) ( ON ?auto_289019 ?auto_289018 ) ( ON ?auto_289020 ?auto_289019 ) ( ON ?auto_289021 ?auto_289020 ) ( ON ?auto_289022 ?auto_289021 ) ( ON ?auto_289023 ?auto_289022 ) ( not ( = ?auto_289015 ?auto_289016 ) ) ( not ( = ?auto_289015 ?auto_289017 ) ) ( not ( = ?auto_289015 ?auto_289018 ) ) ( not ( = ?auto_289015 ?auto_289019 ) ) ( not ( = ?auto_289015 ?auto_289020 ) ) ( not ( = ?auto_289015 ?auto_289021 ) ) ( not ( = ?auto_289015 ?auto_289022 ) ) ( not ( = ?auto_289015 ?auto_289023 ) ) ( not ( = ?auto_289015 ?auto_289024 ) ) ( not ( = ?auto_289015 ?auto_289025 ) ) ( not ( = ?auto_289016 ?auto_289017 ) ) ( not ( = ?auto_289016 ?auto_289018 ) ) ( not ( = ?auto_289016 ?auto_289019 ) ) ( not ( = ?auto_289016 ?auto_289020 ) ) ( not ( = ?auto_289016 ?auto_289021 ) ) ( not ( = ?auto_289016 ?auto_289022 ) ) ( not ( = ?auto_289016 ?auto_289023 ) ) ( not ( = ?auto_289016 ?auto_289024 ) ) ( not ( = ?auto_289016 ?auto_289025 ) ) ( not ( = ?auto_289017 ?auto_289018 ) ) ( not ( = ?auto_289017 ?auto_289019 ) ) ( not ( = ?auto_289017 ?auto_289020 ) ) ( not ( = ?auto_289017 ?auto_289021 ) ) ( not ( = ?auto_289017 ?auto_289022 ) ) ( not ( = ?auto_289017 ?auto_289023 ) ) ( not ( = ?auto_289017 ?auto_289024 ) ) ( not ( = ?auto_289017 ?auto_289025 ) ) ( not ( = ?auto_289018 ?auto_289019 ) ) ( not ( = ?auto_289018 ?auto_289020 ) ) ( not ( = ?auto_289018 ?auto_289021 ) ) ( not ( = ?auto_289018 ?auto_289022 ) ) ( not ( = ?auto_289018 ?auto_289023 ) ) ( not ( = ?auto_289018 ?auto_289024 ) ) ( not ( = ?auto_289018 ?auto_289025 ) ) ( not ( = ?auto_289019 ?auto_289020 ) ) ( not ( = ?auto_289019 ?auto_289021 ) ) ( not ( = ?auto_289019 ?auto_289022 ) ) ( not ( = ?auto_289019 ?auto_289023 ) ) ( not ( = ?auto_289019 ?auto_289024 ) ) ( not ( = ?auto_289019 ?auto_289025 ) ) ( not ( = ?auto_289020 ?auto_289021 ) ) ( not ( = ?auto_289020 ?auto_289022 ) ) ( not ( = ?auto_289020 ?auto_289023 ) ) ( not ( = ?auto_289020 ?auto_289024 ) ) ( not ( = ?auto_289020 ?auto_289025 ) ) ( not ( = ?auto_289021 ?auto_289022 ) ) ( not ( = ?auto_289021 ?auto_289023 ) ) ( not ( = ?auto_289021 ?auto_289024 ) ) ( not ( = ?auto_289021 ?auto_289025 ) ) ( not ( = ?auto_289022 ?auto_289023 ) ) ( not ( = ?auto_289022 ?auto_289024 ) ) ( not ( = ?auto_289022 ?auto_289025 ) ) ( not ( = ?auto_289023 ?auto_289024 ) ) ( not ( = ?auto_289023 ?auto_289025 ) ) ( not ( = ?auto_289024 ?auto_289025 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_289024 ?auto_289025 )
      ( !STACK ?auto_289024 ?auto_289023 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_289036 - BLOCK
      ?auto_289037 - BLOCK
      ?auto_289038 - BLOCK
      ?auto_289039 - BLOCK
      ?auto_289040 - BLOCK
      ?auto_289041 - BLOCK
      ?auto_289042 - BLOCK
      ?auto_289043 - BLOCK
      ?auto_289044 - BLOCK
      ?auto_289045 - BLOCK
    )
    :vars
    (
      ?auto_289046 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_289044 ) ( ON ?auto_289045 ?auto_289046 ) ( CLEAR ?auto_289045 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_289036 ) ( ON ?auto_289037 ?auto_289036 ) ( ON ?auto_289038 ?auto_289037 ) ( ON ?auto_289039 ?auto_289038 ) ( ON ?auto_289040 ?auto_289039 ) ( ON ?auto_289041 ?auto_289040 ) ( ON ?auto_289042 ?auto_289041 ) ( ON ?auto_289043 ?auto_289042 ) ( ON ?auto_289044 ?auto_289043 ) ( not ( = ?auto_289036 ?auto_289037 ) ) ( not ( = ?auto_289036 ?auto_289038 ) ) ( not ( = ?auto_289036 ?auto_289039 ) ) ( not ( = ?auto_289036 ?auto_289040 ) ) ( not ( = ?auto_289036 ?auto_289041 ) ) ( not ( = ?auto_289036 ?auto_289042 ) ) ( not ( = ?auto_289036 ?auto_289043 ) ) ( not ( = ?auto_289036 ?auto_289044 ) ) ( not ( = ?auto_289036 ?auto_289045 ) ) ( not ( = ?auto_289036 ?auto_289046 ) ) ( not ( = ?auto_289037 ?auto_289038 ) ) ( not ( = ?auto_289037 ?auto_289039 ) ) ( not ( = ?auto_289037 ?auto_289040 ) ) ( not ( = ?auto_289037 ?auto_289041 ) ) ( not ( = ?auto_289037 ?auto_289042 ) ) ( not ( = ?auto_289037 ?auto_289043 ) ) ( not ( = ?auto_289037 ?auto_289044 ) ) ( not ( = ?auto_289037 ?auto_289045 ) ) ( not ( = ?auto_289037 ?auto_289046 ) ) ( not ( = ?auto_289038 ?auto_289039 ) ) ( not ( = ?auto_289038 ?auto_289040 ) ) ( not ( = ?auto_289038 ?auto_289041 ) ) ( not ( = ?auto_289038 ?auto_289042 ) ) ( not ( = ?auto_289038 ?auto_289043 ) ) ( not ( = ?auto_289038 ?auto_289044 ) ) ( not ( = ?auto_289038 ?auto_289045 ) ) ( not ( = ?auto_289038 ?auto_289046 ) ) ( not ( = ?auto_289039 ?auto_289040 ) ) ( not ( = ?auto_289039 ?auto_289041 ) ) ( not ( = ?auto_289039 ?auto_289042 ) ) ( not ( = ?auto_289039 ?auto_289043 ) ) ( not ( = ?auto_289039 ?auto_289044 ) ) ( not ( = ?auto_289039 ?auto_289045 ) ) ( not ( = ?auto_289039 ?auto_289046 ) ) ( not ( = ?auto_289040 ?auto_289041 ) ) ( not ( = ?auto_289040 ?auto_289042 ) ) ( not ( = ?auto_289040 ?auto_289043 ) ) ( not ( = ?auto_289040 ?auto_289044 ) ) ( not ( = ?auto_289040 ?auto_289045 ) ) ( not ( = ?auto_289040 ?auto_289046 ) ) ( not ( = ?auto_289041 ?auto_289042 ) ) ( not ( = ?auto_289041 ?auto_289043 ) ) ( not ( = ?auto_289041 ?auto_289044 ) ) ( not ( = ?auto_289041 ?auto_289045 ) ) ( not ( = ?auto_289041 ?auto_289046 ) ) ( not ( = ?auto_289042 ?auto_289043 ) ) ( not ( = ?auto_289042 ?auto_289044 ) ) ( not ( = ?auto_289042 ?auto_289045 ) ) ( not ( = ?auto_289042 ?auto_289046 ) ) ( not ( = ?auto_289043 ?auto_289044 ) ) ( not ( = ?auto_289043 ?auto_289045 ) ) ( not ( = ?auto_289043 ?auto_289046 ) ) ( not ( = ?auto_289044 ?auto_289045 ) ) ( not ( = ?auto_289044 ?auto_289046 ) ) ( not ( = ?auto_289045 ?auto_289046 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_289045 ?auto_289046 )
      ( !STACK ?auto_289045 ?auto_289044 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_289057 - BLOCK
      ?auto_289058 - BLOCK
      ?auto_289059 - BLOCK
      ?auto_289060 - BLOCK
      ?auto_289061 - BLOCK
      ?auto_289062 - BLOCK
      ?auto_289063 - BLOCK
      ?auto_289064 - BLOCK
      ?auto_289065 - BLOCK
      ?auto_289066 - BLOCK
    )
    :vars
    (
      ?auto_289067 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289066 ?auto_289067 ) ( ON-TABLE ?auto_289057 ) ( ON ?auto_289058 ?auto_289057 ) ( ON ?auto_289059 ?auto_289058 ) ( ON ?auto_289060 ?auto_289059 ) ( ON ?auto_289061 ?auto_289060 ) ( ON ?auto_289062 ?auto_289061 ) ( ON ?auto_289063 ?auto_289062 ) ( ON ?auto_289064 ?auto_289063 ) ( not ( = ?auto_289057 ?auto_289058 ) ) ( not ( = ?auto_289057 ?auto_289059 ) ) ( not ( = ?auto_289057 ?auto_289060 ) ) ( not ( = ?auto_289057 ?auto_289061 ) ) ( not ( = ?auto_289057 ?auto_289062 ) ) ( not ( = ?auto_289057 ?auto_289063 ) ) ( not ( = ?auto_289057 ?auto_289064 ) ) ( not ( = ?auto_289057 ?auto_289065 ) ) ( not ( = ?auto_289057 ?auto_289066 ) ) ( not ( = ?auto_289057 ?auto_289067 ) ) ( not ( = ?auto_289058 ?auto_289059 ) ) ( not ( = ?auto_289058 ?auto_289060 ) ) ( not ( = ?auto_289058 ?auto_289061 ) ) ( not ( = ?auto_289058 ?auto_289062 ) ) ( not ( = ?auto_289058 ?auto_289063 ) ) ( not ( = ?auto_289058 ?auto_289064 ) ) ( not ( = ?auto_289058 ?auto_289065 ) ) ( not ( = ?auto_289058 ?auto_289066 ) ) ( not ( = ?auto_289058 ?auto_289067 ) ) ( not ( = ?auto_289059 ?auto_289060 ) ) ( not ( = ?auto_289059 ?auto_289061 ) ) ( not ( = ?auto_289059 ?auto_289062 ) ) ( not ( = ?auto_289059 ?auto_289063 ) ) ( not ( = ?auto_289059 ?auto_289064 ) ) ( not ( = ?auto_289059 ?auto_289065 ) ) ( not ( = ?auto_289059 ?auto_289066 ) ) ( not ( = ?auto_289059 ?auto_289067 ) ) ( not ( = ?auto_289060 ?auto_289061 ) ) ( not ( = ?auto_289060 ?auto_289062 ) ) ( not ( = ?auto_289060 ?auto_289063 ) ) ( not ( = ?auto_289060 ?auto_289064 ) ) ( not ( = ?auto_289060 ?auto_289065 ) ) ( not ( = ?auto_289060 ?auto_289066 ) ) ( not ( = ?auto_289060 ?auto_289067 ) ) ( not ( = ?auto_289061 ?auto_289062 ) ) ( not ( = ?auto_289061 ?auto_289063 ) ) ( not ( = ?auto_289061 ?auto_289064 ) ) ( not ( = ?auto_289061 ?auto_289065 ) ) ( not ( = ?auto_289061 ?auto_289066 ) ) ( not ( = ?auto_289061 ?auto_289067 ) ) ( not ( = ?auto_289062 ?auto_289063 ) ) ( not ( = ?auto_289062 ?auto_289064 ) ) ( not ( = ?auto_289062 ?auto_289065 ) ) ( not ( = ?auto_289062 ?auto_289066 ) ) ( not ( = ?auto_289062 ?auto_289067 ) ) ( not ( = ?auto_289063 ?auto_289064 ) ) ( not ( = ?auto_289063 ?auto_289065 ) ) ( not ( = ?auto_289063 ?auto_289066 ) ) ( not ( = ?auto_289063 ?auto_289067 ) ) ( not ( = ?auto_289064 ?auto_289065 ) ) ( not ( = ?auto_289064 ?auto_289066 ) ) ( not ( = ?auto_289064 ?auto_289067 ) ) ( not ( = ?auto_289065 ?auto_289066 ) ) ( not ( = ?auto_289065 ?auto_289067 ) ) ( not ( = ?auto_289066 ?auto_289067 ) ) ( CLEAR ?auto_289064 ) ( ON ?auto_289065 ?auto_289066 ) ( CLEAR ?auto_289065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_289057 ?auto_289058 ?auto_289059 ?auto_289060 ?auto_289061 ?auto_289062 ?auto_289063 ?auto_289064 ?auto_289065 )
      ( MAKE-10PILE ?auto_289057 ?auto_289058 ?auto_289059 ?auto_289060 ?auto_289061 ?auto_289062 ?auto_289063 ?auto_289064 ?auto_289065 ?auto_289066 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_289078 - BLOCK
      ?auto_289079 - BLOCK
      ?auto_289080 - BLOCK
      ?auto_289081 - BLOCK
      ?auto_289082 - BLOCK
      ?auto_289083 - BLOCK
      ?auto_289084 - BLOCK
      ?auto_289085 - BLOCK
      ?auto_289086 - BLOCK
      ?auto_289087 - BLOCK
    )
    :vars
    (
      ?auto_289088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289087 ?auto_289088 ) ( ON-TABLE ?auto_289078 ) ( ON ?auto_289079 ?auto_289078 ) ( ON ?auto_289080 ?auto_289079 ) ( ON ?auto_289081 ?auto_289080 ) ( ON ?auto_289082 ?auto_289081 ) ( ON ?auto_289083 ?auto_289082 ) ( ON ?auto_289084 ?auto_289083 ) ( ON ?auto_289085 ?auto_289084 ) ( not ( = ?auto_289078 ?auto_289079 ) ) ( not ( = ?auto_289078 ?auto_289080 ) ) ( not ( = ?auto_289078 ?auto_289081 ) ) ( not ( = ?auto_289078 ?auto_289082 ) ) ( not ( = ?auto_289078 ?auto_289083 ) ) ( not ( = ?auto_289078 ?auto_289084 ) ) ( not ( = ?auto_289078 ?auto_289085 ) ) ( not ( = ?auto_289078 ?auto_289086 ) ) ( not ( = ?auto_289078 ?auto_289087 ) ) ( not ( = ?auto_289078 ?auto_289088 ) ) ( not ( = ?auto_289079 ?auto_289080 ) ) ( not ( = ?auto_289079 ?auto_289081 ) ) ( not ( = ?auto_289079 ?auto_289082 ) ) ( not ( = ?auto_289079 ?auto_289083 ) ) ( not ( = ?auto_289079 ?auto_289084 ) ) ( not ( = ?auto_289079 ?auto_289085 ) ) ( not ( = ?auto_289079 ?auto_289086 ) ) ( not ( = ?auto_289079 ?auto_289087 ) ) ( not ( = ?auto_289079 ?auto_289088 ) ) ( not ( = ?auto_289080 ?auto_289081 ) ) ( not ( = ?auto_289080 ?auto_289082 ) ) ( not ( = ?auto_289080 ?auto_289083 ) ) ( not ( = ?auto_289080 ?auto_289084 ) ) ( not ( = ?auto_289080 ?auto_289085 ) ) ( not ( = ?auto_289080 ?auto_289086 ) ) ( not ( = ?auto_289080 ?auto_289087 ) ) ( not ( = ?auto_289080 ?auto_289088 ) ) ( not ( = ?auto_289081 ?auto_289082 ) ) ( not ( = ?auto_289081 ?auto_289083 ) ) ( not ( = ?auto_289081 ?auto_289084 ) ) ( not ( = ?auto_289081 ?auto_289085 ) ) ( not ( = ?auto_289081 ?auto_289086 ) ) ( not ( = ?auto_289081 ?auto_289087 ) ) ( not ( = ?auto_289081 ?auto_289088 ) ) ( not ( = ?auto_289082 ?auto_289083 ) ) ( not ( = ?auto_289082 ?auto_289084 ) ) ( not ( = ?auto_289082 ?auto_289085 ) ) ( not ( = ?auto_289082 ?auto_289086 ) ) ( not ( = ?auto_289082 ?auto_289087 ) ) ( not ( = ?auto_289082 ?auto_289088 ) ) ( not ( = ?auto_289083 ?auto_289084 ) ) ( not ( = ?auto_289083 ?auto_289085 ) ) ( not ( = ?auto_289083 ?auto_289086 ) ) ( not ( = ?auto_289083 ?auto_289087 ) ) ( not ( = ?auto_289083 ?auto_289088 ) ) ( not ( = ?auto_289084 ?auto_289085 ) ) ( not ( = ?auto_289084 ?auto_289086 ) ) ( not ( = ?auto_289084 ?auto_289087 ) ) ( not ( = ?auto_289084 ?auto_289088 ) ) ( not ( = ?auto_289085 ?auto_289086 ) ) ( not ( = ?auto_289085 ?auto_289087 ) ) ( not ( = ?auto_289085 ?auto_289088 ) ) ( not ( = ?auto_289086 ?auto_289087 ) ) ( not ( = ?auto_289086 ?auto_289088 ) ) ( not ( = ?auto_289087 ?auto_289088 ) ) ( CLEAR ?auto_289085 ) ( ON ?auto_289086 ?auto_289087 ) ( CLEAR ?auto_289086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_289078 ?auto_289079 ?auto_289080 ?auto_289081 ?auto_289082 ?auto_289083 ?auto_289084 ?auto_289085 ?auto_289086 )
      ( MAKE-10PILE ?auto_289078 ?auto_289079 ?auto_289080 ?auto_289081 ?auto_289082 ?auto_289083 ?auto_289084 ?auto_289085 ?auto_289086 ?auto_289087 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_289099 - BLOCK
      ?auto_289100 - BLOCK
      ?auto_289101 - BLOCK
      ?auto_289102 - BLOCK
      ?auto_289103 - BLOCK
      ?auto_289104 - BLOCK
      ?auto_289105 - BLOCK
      ?auto_289106 - BLOCK
      ?auto_289107 - BLOCK
      ?auto_289108 - BLOCK
    )
    :vars
    (
      ?auto_289109 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289108 ?auto_289109 ) ( ON-TABLE ?auto_289099 ) ( ON ?auto_289100 ?auto_289099 ) ( ON ?auto_289101 ?auto_289100 ) ( ON ?auto_289102 ?auto_289101 ) ( ON ?auto_289103 ?auto_289102 ) ( ON ?auto_289104 ?auto_289103 ) ( ON ?auto_289105 ?auto_289104 ) ( not ( = ?auto_289099 ?auto_289100 ) ) ( not ( = ?auto_289099 ?auto_289101 ) ) ( not ( = ?auto_289099 ?auto_289102 ) ) ( not ( = ?auto_289099 ?auto_289103 ) ) ( not ( = ?auto_289099 ?auto_289104 ) ) ( not ( = ?auto_289099 ?auto_289105 ) ) ( not ( = ?auto_289099 ?auto_289106 ) ) ( not ( = ?auto_289099 ?auto_289107 ) ) ( not ( = ?auto_289099 ?auto_289108 ) ) ( not ( = ?auto_289099 ?auto_289109 ) ) ( not ( = ?auto_289100 ?auto_289101 ) ) ( not ( = ?auto_289100 ?auto_289102 ) ) ( not ( = ?auto_289100 ?auto_289103 ) ) ( not ( = ?auto_289100 ?auto_289104 ) ) ( not ( = ?auto_289100 ?auto_289105 ) ) ( not ( = ?auto_289100 ?auto_289106 ) ) ( not ( = ?auto_289100 ?auto_289107 ) ) ( not ( = ?auto_289100 ?auto_289108 ) ) ( not ( = ?auto_289100 ?auto_289109 ) ) ( not ( = ?auto_289101 ?auto_289102 ) ) ( not ( = ?auto_289101 ?auto_289103 ) ) ( not ( = ?auto_289101 ?auto_289104 ) ) ( not ( = ?auto_289101 ?auto_289105 ) ) ( not ( = ?auto_289101 ?auto_289106 ) ) ( not ( = ?auto_289101 ?auto_289107 ) ) ( not ( = ?auto_289101 ?auto_289108 ) ) ( not ( = ?auto_289101 ?auto_289109 ) ) ( not ( = ?auto_289102 ?auto_289103 ) ) ( not ( = ?auto_289102 ?auto_289104 ) ) ( not ( = ?auto_289102 ?auto_289105 ) ) ( not ( = ?auto_289102 ?auto_289106 ) ) ( not ( = ?auto_289102 ?auto_289107 ) ) ( not ( = ?auto_289102 ?auto_289108 ) ) ( not ( = ?auto_289102 ?auto_289109 ) ) ( not ( = ?auto_289103 ?auto_289104 ) ) ( not ( = ?auto_289103 ?auto_289105 ) ) ( not ( = ?auto_289103 ?auto_289106 ) ) ( not ( = ?auto_289103 ?auto_289107 ) ) ( not ( = ?auto_289103 ?auto_289108 ) ) ( not ( = ?auto_289103 ?auto_289109 ) ) ( not ( = ?auto_289104 ?auto_289105 ) ) ( not ( = ?auto_289104 ?auto_289106 ) ) ( not ( = ?auto_289104 ?auto_289107 ) ) ( not ( = ?auto_289104 ?auto_289108 ) ) ( not ( = ?auto_289104 ?auto_289109 ) ) ( not ( = ?auto_289105 ?auto_289106 ) ) ( not ( = ?auto_289105 ?auto_289107 ) ) ( not ( = ?auto_289105 ?auto_289108 ) ) ( not ( = ?auto_289105 ?auto_289109 ) ) ( not ( = ?auto_289106 ?auto_289107 ) ) ( not ( = ?auto_289106 ?auto_289108 ) ) ( not ( = ?auto_289106 ?auto_289109 ) ) ( not ( = ?auto_289107 ?auto_289108 ) ) ( not ( = ?auto_289107 ?auto_289109 ) ) ( not ( = ?auto_289108 ?auto_289109 ) ) ( ON ?auto_289107 ?auto_289108 ) ( CLEAR ?auto_289105 ) ( ON ?auto_289106 ?auto_289107 ) ( CLEAR ?auto_289106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_289099 ?auto_289100 ?auto_289101 ?auto_289102 ?auto_289103 ?auto_289104 ?auto_289105 ?auto_289106 )
      ( MAKE-10PILE ?auto_289099 ?auto_289100 ?auto_289101 ?auto_289102 ?auto_289103 ?auto_289104 ?auto_289105 ?auto_289106 ?auto_289107 ?auto_289108 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_289120 - BLOCK
      ?auto_289121 - BLOCK
      ?auto_289122 - BLOCK
      ?auto_289123 - BLOCK
      ?auto_289124 - BLOCK
      ?auto_289125 - BLOCK
      ?auto_289126 - BLOCK
      ?auto_289127 - BLOCK
      ?auto_289128 - BLOCK
      ?auto_289129 - BLOCK
    )
    :vars
    (
      ?auto_289130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289129 ?auto_289130 ) ( ON-TABLE ?auto_289120 ) ( ON ?auto_289121 ?auto_289120 ) ( ON ?auto_289122 ?auto_289121 ) ( ON ?auto_289123 ?auto_289122 ) ( ON ?auto_289124 ?auto_289123 ) ( ON ?auto_289125 ?auto_289124 ) ( ON ?auto_289126 ?auto_289125 ) ( not ( = ?auto_289120 ?auto_289121 ) ) ( not ( = ?auto_289120 ?auto_289122 ) ) ( not ( = ?auto_289120 ?auto_289123 ) ) ( not ( = ?auto_289120 ?auto_289124 ) ) ( not ( = ?auto_289120 ?auto_289125 ) ) ( not ( = ?auto_289120 ?auto_289126 ) ) ( not ( = ?auto_289120 ?auto_289127 ) ) ( not ( = ?auto_289120 ?auto_289128 ) ) ( not ( = ?auto_289120 ?auto_289129 ) ) ( not ( = ?auto_289120 ?auto_289130 ) ) ( not ( = ?auto_289121 ?auto_289122 ) ) ( not ( = ?auto_289121 ?auto_289123 ) ) ( not ( = ?auto_289121 ?auto_289124 ) ) ( not ( = ?auto_289121 ?auto_289125 ) ) ( not ( = ?auto_289121 ?auto_289126 ) ) ( not ( = ?auto_289121 ?auto_289127 ) ) ( not ( = ?auto_289121 ?auto_289128 ) ) ( not ( = ?auto_289121 ?auto_289129 ) ) ( not ( = ?auto_289121 ?auto_289130 ) ) ( not ( = ?auto_289122 ?auto_289123 ) ) ( not ( = ?auto_289122 ?auto_289124 ) ) ( not ( = ?auto_289122 ?auto_289125 ) ) ( not ( = ?auto_289122 ?auto_289126 ) ) ( not ( = ?auto_289122 ?auto_289127 ) ) ( not ( = ?auto_289122 ?auto_289128 ) ) ( not ( = ?auto_289122 ?auto_289129 ) ) ( not ( = ?auto_289122 ?auto_289130 ) ) ( not ( = ?auto_289123 ?auto_289124 ) ) ( not ( = ?auto_289123 ?auto_289125 ) ) ( not ( = ?auto_289123 ?auto_289126 ) ) ( not ( = ?auto_289123 ?auto_289127 ) ) ( not ( = ?auto_289123 ?auto_289128 ) ) ( not ( = ?auto_289123 ?auto_289129 ) ) ( not ( = ?auto_289123 ?auto_289130 ) ) ( not ( = ?auto_289124 ?auto_289125 ) ) ( not ( = ?auto_289124 ?auto_289126 ) ) ( not ( = ?auto_289124 ?auto_289127 ) ) ( not ( = ?auto_289124 ?auto_289128 ) ) ( not ( = ?auto_289124 ?auto_289129 ) ) ( not ( = ?auto_289124 ?auto_289130 ) ) ( not ( = ?auto_289125 ?auto_289126 ) ) ( not ( = ?auto_289125 ?auto_289127 ) ) ( not ( = ?auto_289125 ?auto_289128 ) ) ( not ( = ?auto_289125 ?auto_289129 ) ) ( not ( = ?auto_289125 ?auto_289130 ) ) ( not ( = ?auto_289126 ?auto_289127 ) ) ( not ( = ?auto_289126 ?auto_289128 ) ) ( not ( = ?auto_289126 ?auto_289129 ) ) ( not ( = ?auto_289126 ?auto_289130 ) ) ( not ( = ?auto_289127 ?auto_289128 ) ) ( not ( = ?auto_289127 ?auto_289129 ) ) ( not ( = ?auto_289127 ?auto_289130 ) ) ( not ( = ?auto_289128 ?auto_289129 ) ) ( not ( = ?auto_289128 ?auto_289130 ) ) ( not ( = ?auto_289129 ?auto_289130 ) ) ( ON ?auto_289128 ?auto_289129 ) ( CLEAR ?auto_289126 ) ( ON ?auto_289127 ?auto_289128 ) ( CLEAR ?auto_289127 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_289120 ?auto_289121 ?auto_289122 ?auto_289123 ?auto_289124 ?auto_289125 ?auto_289126 ?auto_289127 )
      ( MAKE-10PILE ?auto_289120 ?auto_289121 ?auto_289122 ?auto_289123 ?auto_289124 ?auto_289125 ?auto_289126 ?auto_289127 ?auto_289128 ?auto_289129 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_289141 - BLOCK
      ?auto_289142 - BLOCK
      ?auto_289143 - BLOCK
      ?auto_289144 - BLOCK
      ?auto_289145 - BLOCK
      ?auto_289146 - BLOCK
      ?auto_289147 - BLOCK
      ?auto_289148 - BLOCK
      ?auto_289149 - BLOCK
      ?auto_289150 - BLOCK
    )
    :vars
    (
      ?auto_289151 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289150 ?auto_289151 ) ( ON-TABLE ?auto_289141 ) ( ON ?auto_289142 ?auto_289141 ) ( ON ?auto_289143 ?auto_289142 ) ( ON ?auto_289144 ?auto_289143 ) ( ON ?auto_289145 ?auto_289144 ) ( ON ?auto_289146 ?auto_289145 ) ( not ( = ?auto_289141 ?auto_289142 ) ) ( not ( = ?auto_289141 ?auto_289143 ) ) ( not ( = ?auto_289141 ?auto_289144 ) ) ( not ( = ?auto_289141 ?auto_289145 ) ) ( not ( = ?auto_289141 ?auto_289146 ) ) ( not ( = ?auto_289141 ?auto_289147 ) ) ( not ( = ?auto_289141 ?auto_289148 ) ) ( not ( = ?auto_289141 ?auto_289149 ) ) ( not ( = ?auto_289141 ?auto_289150 ) ) ( not ( = ?auto_289141 ?auto_289151 ) ) ( not ( = ?auto_289142 ?auto_289143 ) ) ( not ( = ?auto_289142 ?auto_289144 ) ) ( not ( = ?auto_289142 ?auto_289145 ) ) ( not ( = ?auto_289142 ?auto_289146 ) ) ( not ( = ?auto_289142 ?auto_289147 ) ) ( not ( = ?auto_289142 ?auto_289148 ) ) ( not ( = ?auto_289142 ?auto_289149 ) ) ( not ( = ?auto_289142 ?auto_289150 ) ) ( not ( = ?auto_289142 ?auto_289151 ) ) ( not ( = ?auto_289143 ?auto_289144 ) ) ( not ( = ?auto_289143 ?auto_289145 ) ) ( not ( = ?auto_289143 ?auto_289146 ) ) ( not ( = ?auto_289143 ?auto_289147 ) ) ( not ( = ?auto_289143 ?auto_289148 ) ) ( not ( = ?auto_289143 ?auto_289149 ) ) ( not ( = ?auto_289143 ?auto_289150 ) ) ( not ( = ?auto_289143 ?auto_289151 ) ) ( not ( = ?auto_289144 ?auto_289145 ) ) ( not ( = ?auto_289144 ?auto_289146 ) ) ( not ( = ?auto_289144 ?auto_289147 ) ) ( not ( = ?auto_289144 ?auto_289148 ) ) ( not ( = ?auto_289144 ?auto_289149 ) ) ( not ( = ?auto_289144 ?auto_289150 ) ) ( not ( = ?auto_289144 ?auto_289151 ) ) ( not ( = ?auto_289145 ?auto_289146 ) ) ( not ( = ?auto_289145 ?auto_289147 ) ) ( not ( = ?auto_289145 ?auto_289148 ) ) ( not ( = ?auto_289145 ?auto_289149 ) ) ( not ( = ?auto_289145 ?auto_289150 ) ) ( not ( = ?auto_289145 ?auto_289151 ) ) ( not ( = ?auto_289146 ?auto_289147 ) ) ( not ( = ?auto_289146 ?auto_289148 ) ) ( not ( = ?auto_289146 ?auto_289149 ) ) ( not ( = ?auto_289146 ?auto_289150 ) ) ( not ( = ?auto_289146 ?auto_289151 ) ) ( not ( = ?auto_289147 ?auto_289148 ) ) ( not ( = ?auto_289147 ?auto_289149 ) ) ( not ( = ?auto_289147 ?auto_289150 ) ) ( not ( = ?auto_289147 ?auto_289151 ) ) ( not ( = ?auto_289148 ?auto_289149 ) ) ( not ( = ?auto_289148 ?auto_289150 ) ) ( not ( = ?auto_289148 ?auto_289151 ) ) ( not ( = ?auto_289149 ?auto_289150 ) ) ( not ( = ?auto_289149 ?auto_289151 ) ) ( not ( = ?auto_289150 ?auto_289151 ) ) ( ON ?auto_289149 ?auto_289150 ) ( ON ?auto_289148 ?auto_289149 ) ( CLEAR ?auto_289146 ) ( ON ?auto_289147 ?auto_289148 ) ( CLEAR ?auto_289147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_289141 ?auto_289142 ?auto_289143 ?auto_289144 ?auto_289145 ?auto_289146 ?auto_289147 )
      ( MAKE-10PILE ?auto_289141 ?auto_289142 ?auto_289143 ?auto_289144 ?auto_289145 ?auto_289146 ?auto_289147 ?auto_289148 ?auto_289149 ?auto_289150 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_289162 - BLOCK
      ?auto_289163 - BLOCK
      ?auto_289164 - BLOCK
      ?auto_289165 - BLOCK
      ?auto_289166 - BLOCK
      ?auto_289167 - BLOCK
      ?auto_289168 - BLOCK
      ?auto_289169 - BLOCK
      ?auto_289170 - BLOCK
      ?auto_289171 - BLOCK
    )
    :vars
    (
      ?auto_289172 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289171 ?auto_289172 ) ( ON-TABLE ?auto_289162 ) ( ON ?auto_289163 ?auto_289162 ) ( ON ?auto_289164 ?auto_289163 ) ( ON ?auto_289165 ?auto_289164 ) ( ON ?auto_289166 ?auto_289165 ) ( ON ?auto_289167 ?auto_289166 ) ( not ( = ?auto_289162 ?auto_289163 ) ) ( not ( = ?auto_289162 ?auto_289164 ) ) ( not ( = ?auto_289162 ?auto_289165 ) ) ( not ( = ?auto_289162 ?auto_289166 ) ) ( not ( = ?auto_289162 ?auto_289167 ) ) ( not ( = ?auto_289162 ?auto_289168 ) ) ( not ( = ?auto_289162 ?auto_289169 ) ) ( not ( = ?auto_289162 ?auto_289170 ) ) ( not ( = ?auto_289162 ?auto_289171 ) ) ( not ( = ?auto_289162 ?auto_289172 ) ) ( not ( = ?auto_289163 ?auto_289164 ) ) ( not ( = ?auto_289163 ?auto_289165 ) ) ( not ( = ?auto_289163 ?auto_289166 ) ) ( not ( = ?auto_289163 ?auto_289167 ) ) ( not ( = ?auto_289163 ?auto_289168 ) ) ( not ( = ?auto_289163 ?auto_289169 ) ) ( not ( = ?auto_289163 ?auto_289170 ) ) ( not ( = ?auto_289163 ?auto_289171 ) ) ( not ( = ?auto_289163 ?auto_289172 ) ) ( not ( = ?auto_289164 ?auto_289165 ) ) ( not ( = ?auto_289164 ?auto_289166 ) ) ( not ( = ?auto_289164 ?auto_289167 ) ) ( not ( = ?auto_289164 ?auto_289168 ) ) ( not ( = ?auto_289164 ?auto_289169 ) ) ( not ( = ?auto_289164 ?auto_289170 ) ) ( not ( = ?auto_289164 ?auto_289171 ) ) ( not ( = ?auto_289164 ?auto_289172 ) ) ( not ( = ?auto_289165 ?auto_289166 ) ) ( not ( = ?auto_289165 ?auto_289167 ) ) ( not ( = ?auto_289165 ?auto_289168 ) ) ( not ( = ?auto_289165 ?auto_289169 ) ) ( not ( = ?auto_289165 ?auto_289170 ) ) ( not ( = ?auto_289165 ?auto_289171 ) ) ( not ( = ?auto_289165 ?auto_289172 ) ) ( not ( = ?auto_289166 ?auto_289167 ) ) ( not ( = ?auto_289166 ?auto_289168 ) ) ( not ( = ?auto_289166 ?auto_289169 ) ) ( not ( = ?auto_289166 ?auto_289170 ) ) ( not ( = ?auto_289166 ?auto_289171 ) ) ( not ( = ?auto_289166 ?auto_289172 ) ) ( not ( = ?auto_289167 ?auto_289168 ) ) ( not ( = ?auto_289167 ?auto_289169 ) ) ( not ( = ?auto_289167 ?auto_289170 ) ) ( not ( = ?auto_289167 ?auto_289171 ) ) ( not ( = ?auto_289167 ?auto_289172 ) ) ( not ( = ?auto_289168 ?auto_289169 ) ) ( not ( = ?auto_289168 ?auto_289170 ) ) ( not ( = ?auto_289168 ?auto_289171 ) ) ( not ( = ?auto_289168 ?auto_289172 ) ) ( not ( = ?auto_289169 ?auto_289170 ) ) ( not ( = ?auto_289169 ?auto_289171 ) ) ( not ( = ?auto_289169 ?auto_289172 ) ) ( not ( = ?auto_289170 ?auto_289171 ) ) ( not ( = ?auto_289170 ?auto_289172 ) ) ( not ( = ?auto_289171 ?auto_289172 ) ) ( ON ?auto_289170 ?auto_289171 ) ( ON ?auto_289169 ?auto_289170 ) ( CLEAR ?auto_289167 ) ( ON ?auto_289168 ?auto_289169 ) ( CLEAR ?auto_289168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_289162 ?auto_289163 ?auto_289164 ?auto_289165 ?auto_289166 ?auto_289167 ?auto_289168 )
      ( MAKE-10PILE ?auto_289162 ?auto_289163 ?auto_289164 ?auto_289165 ?auto_289166 ?auto_289167 ?auto_289168 ?auto_289169 ?auto_289170 ?auto_289171 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_289183 - BLOCK
      ?auto_289184 - BLOCK
      ?auto_289185 - BLOCK
      ?auto_289186 - BLOCK
      ?auto_289187 - BLOCK
      ?auto_289188 - BLOCK
      ?auto_289189 - BLOCK
      ?auto_289190 - BLOCK
      ?auto_289191 - BLOCK
      ?auto_289192 - BLOCK
    )
    :vars
    (
      ?auto_289193 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289192 ?auto_289193 ) ( ON-TABLE ?auto_289183 ) ( ON ?auto_289184 ?auto_289183 ) ( ON ?auto_289185 ?auto_289184 ) ( ON ?auto_289186 ?auto_289185 ) ( ON ?auto_289187 ?auto_289186 ) ( not ( = ?auto_289183 ?auto_289184 ) ) ( not ( = ?auto_289183 ?auto_289185 ) ) ( not ( = ?auto_289183 ?auto_289186 ) ) ( not ( = ?auto_289183 ?auto_289187 ) ) ( not ( = ?auto_289183 ?auto_289188 ) ) ( not ( = ?auto_289183 ?auto_289189 ) ) ( not ( = ?auto_289183 ?auto_289190 ) ) ( not ( = ?auto_289183 ?auto_289191 ) ) ( not ( = ?auto_289183 ?auto_289192 ) ) ( not ( = ?auto_289183 ?auto_289193 ) ) ( not ( = ?auto_289184 ?auto_289185 ) ) ( not ( = ?auto_289184 ?auto_289186 ) ) ( not ( = ?auto_289184 ?auto_289187 ) ) ( not ( = ?auto_289184 ?auto_289188 ) ) ( not ( = ?auto_289184 ?auto_289189 ) ) ( not ( = ?auto_289184 ?auto_289190 ) ) ( not ( = ?auto_289184 ?auto_289191 ) ) ( not ( = ?auto_289184 ?auto_289192 ) ) ( not ( = ?auto_289184 ?auto_289193 ) ) ( not ( = ?auto_289185 ?auto_289186 ) ) ( not ( = ?auto_289185 ?auto_289187 ) ) ( not ( = ?auto_289185 ?auto_289188 ) ) ( not ( = ?auto_289185 ?auto_289189 ) ) ( not ( = ?auto_289185 ?auto_289190 ) ) ( not ( = ?auto_289185 ?auto_289191 ) ) ( not ( = ?auto_289185 ?auto_289192 ) ) ( not ( = ?auto_289185 ?auto_289193 ) ) ( not ( = ?auto_289186 ?auto_289187 ) ) ( not ( = ?auto_289186 ?auto_289188 ) ) ( not ( = ?auto_289186 ?auto_289189 ) ) ( not ( = ?auto_289186 ?auto_289190 ) ) ( not ( = ?auto_289186 ?auto_289191 ) ) ( not ( = ?auto_289186 ?auto_289192 ) ) ( not ( = ?auto_289186 ?auto_289193 ) ) ( not ( = ?auto_289187 ?auto_289188 ) ) ( not ( = ?auto_289187 ?auto_289189 ) ) ( not ( = ?auto_289187 ?auto_289190 ) ) ( not ( = ?auto_289187 ?auto_289191 ) ) ( not ( = ?auto_289187 ?auto_289192 ) ) ( not ( = ?auto_289187 ?auto_289193 ) ) ( not ( = ?auto_289188 ?auto_289189 ) ) ( not ( = ?auto_289188 ?auto_289190 ) ) ( not ( = ?auto_289188 ?auto_289191 ) ) ( not ( = ?auto_289188 ?auto_289192 ) ) ( not ( = ?auto_289188 ?auto_289193 ) ) ( not ( = ?auto_289189 ?auto_289190 ) ) ( not ( = ?auto_289189 ?auto_289191 ) ) ( not ( = ?auto_289189 ?auto_289192 ) ) ( not ( = ?auto_289189 ?auto_289193 ) ) ( not ( = ?auto_289190 ?auto_289191 ) ) ( not ( = ?auto_289190 ?auto_289192 ) ) ( not ( = ?auto_289190 ?auto_289193 ) ) ( not ( = ?auto_289191 ?auto_289192 ) ) ( not ( = ?auto_289191 ?auto_289193 ) ) ( not ( = ?auto_289192 ?auto_289193 ) ) ( ON ?auto_289191 ?auto_289192 ) ( ON ?auto_289190 ?auto_289191 ) ( ON ?auto_289189 ?auto_289190 ) ( CLEAR ?auto_289187 ) ( ON ?auto_289188 ?auto_289189 ) ( CLEAR ?auto_289188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_289183 ?auto_289184 ?auto_289185 ?auto_289186 ?auto_289187 ?auto_289188 )
      ( MAKE-10PILE ?auto_289183 ?auto_289184 ?auto_289185 ?auto_289186 ?auto_289187 ?auto_289188 ?auto_289189 ?auto_289190 ?auto_289191 ?auto_289192 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_289204 - BLOCK
      ?auto_289205 - BLOCK
      ?auto_289206 - BLOCK
      ?auto_289207 - BLOCK
      ?auto_289208 - BLOCK
      ?auto_289209 - BLOCK
      ?auto_289210 - BLOCK
      ?auto_289211 - BLOCK
      ?auto_289212 - BLOCK
      ?auto_289213 - BLOCK
    )
    :vars
    (
      ?auto_289214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289213 ?auto_289214 ) ( ON-TABLE ?auto_289204 ) ( ON ?auto_289205 ?auto_289204 ) ( ON ?auto_289206 ?auto_289205 ) ( ON ?auto_289207 ?auto_289206 ) ( ON ?auto_289208 ?auto_289207 ) ( not ( = ?auto_289204 ?auto_289205 ) ) ( not ( = ?auto_289204 ?auto_289206 ) ) ( not ( = ?auto_289204 ?auto_289207 ) ) ( not ( = ?auto_289204 ?auto_289208 ) ) ( not ( = ?auto_289204 ?auto_289209 ) ) ( not ( = ?auto_289204 ?auto_289210 ) ) ( not ( = ?auto_289204 ?auto_289211 ) ) ( not ( = ?auto_289204 ?auto_289212 ) ) ( not ( = ?auto_289204 ?auto_289213 ) ) ( not ( = ?auto_289204 ?auto_289214 ) ) ( not ( = ?auto_289205 ?auto_289206 ) ) ( not ( = ?auto_289205 ?auto_289207 ) ) ( not ( = ?auto_289205 ?auto_289208 ) ) ( not ( = ?auto_289205 ?auto_289209 ) ) ( not ( = ?auto_289205 ?auto_289210 ) ) ( not ( = ?auto_289205 ?auto_289211 ) ) ( not ( = ?auto_289205 ?auto_289212 ) ) ( not ( = ?auto_289205 ?auto_289213 ) ) ( not ( = ?auto_289205 ?auto_289214 ) ) ( not ( = ?auto_289206 ?auto_289207 ) ) ( not ( = ?auto_289206 ?auto_289208 ) ) ( not ( = ?auto_289206 ?auto_289209 ) ) ( not ( = ?auto_289206 ?auto_289210 ) ) ( not ( = ?auto_289206 ?auto_289211 ) ) ( not ( = ?auto_289206 ?auto_289212 ) ) ( not ( = ?auto_289206 ?auto_289213 ) ) ( not ( = ?auto_289206 ?auto_289214 ) ) ( not ( = ?auto_289207 ?auto_289208 ) ) ( not ( = ?auto_289207 ?auto_289209 ) ) ( not ( = ?auto_289207 ?auto_289210 ) ) ( not ( = ?auto_289207 ?auto_289211 ) ) ( not ( = ?auto_289207 ?auto_289212 ) ) ( not ( = ?auto_289207 ?auto_289213 ) ) ( not ( = ?auto_289207 ?auto_289214 ) ) ( not ( = ?auto_289208 ?auto_289209 ) ) ( not ( = ?auto_289208 ?auto_289210 ) ) ( not ( = ?auto_289208 ?auto_289211 ) ) ( not ( = ?auto_289208 ?auto_289212 ) ) ( not ( = ?auto_289208 ?auto_289213 ) ) ( not ( = ?auto_289208 ?auto_289214 ) ) ( not ( = ?auto_289209 ?auto_289210 ) ) ( not ( = ?auto_289209 ?auto_289211 ) ) ( not ( = ?auto_289209 ?auto_289212 ) ) ( not ( = ?auto_289209 ?auto_289213 ) ) ( not ( = ?auto_289209 ?auto_289214 ) ) ( not ( = ?auto_289210 ?auto_289211 ) ) ( not ( = ?auto_289210 ?auto_289212 ) ) ( not ( = ?auto_289210 ?auto_289213 ) ) ( not ( = ?auto_289210 ?auto_289214 ) ) ( not ( = ?auto_289211 ?auto_289212 ) ) ( not ( = ?auto_289211 ?auto_289213 ) ) ( not ( = ?auto_289211 ?auto_289214 ) ) ( not ( = ?auto_289212 ?auto_289213 ) ) ( not ( = ?auto_289212 ?auto_289214 ) ) ( not ( = ?auto_289213 ?auto_289214 ) ) ( ON ?auto_289212 ?auto_289213 ) ( ON ?auto_289211 ?auto_289212 ) ( ON ?auto_289210 ?auto_289211 ) ( CLEAR ?auto_289208 ) ( ON ?auto_289209 ?auto_289210 ) ( CLEAR ?auto_289209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_289204 ?auto_289205 ?auto_289206 ?auto_289207 ?auto_289208 ?auto_289209 )
      ( MAKE-10PILE ?auto_289204 ?auto_289205 ?auto_289206 ?auto_289207 ?auto_289208 ?auto_289209 ?auto_289210 ?auto_289211 ?auto_289212 ?auto_289213 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_289225 - BLOCK
      ?auto_289226 - BLOCK
      ?auto_289227 - BLOCK
      ?auto_289228 - BLOCK
      ?auto_289229 - BLOCK
      ?auto_289230 - BLOCK
      ?auto_289231 - BLOCK
      ?auto_289232 - BLOCK
      ?auto_289233 - BLOCK
      ?auto_289234 - BLOCK
    )
    :vars
    (
      ?auto_289235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289234 ?auto_289235 ) ( ON-TABLE ?auto_289225 ) ( ON ?auto_289226 ?auto_289225 ) ( ON ?auto_289227 ?auto_289226 ) ( ON ?auto_289228 ?auto_289227 ) ( not ( = ?auto_289225 ?auto_289226 ) ) ( not ( = ?auto_289225 ?auto_289227 ) ) ( not ( = ?auto_289225 ?auto_289228 ) ) ( not ( = ?auto_289225 ?auto_289229 ) ) ( not ( = ?auto_289225 ?auto_289230 ) ) ( not ( = ?auto_289225 ?auto_289231 ) ) ( not ( = ?auto_289225 ?auto_289232 ) ) ( not ( = ?auto_289225 ?auto_289233 ) ) ( not ( = ?auto_289225 ?auto_289234 ) ) ( not ( = ?auto_289225 ?auto_289235 ) ) ( not ( = ?auto_289226 ?auto_289227 ) ) ( not ( = ?auto_289226 ?auto_289228 ) ) ( not ( = ?auto_289226 ?auto_289229 ) ) ( not ( = ?auto_289226 ?auto_289230 ) ) ( not ( = ?auto_289226 ?auto_289231 ) ) ( not ( = ?auto_289226 ?auto_289232 ) ) ( not ( = ?auto_289226 ?auto_289233 ) ) ( not ( = ?auto_289226 ?auto_289234 ) ) ( not ( = ?auto_289226 ?auto_289235 ) ) ( not ( = ?auto_289227 ?auto_289228 ) ) ( not ( = ?auto_289227 ?auto_289229 ) ) ( not ( = ?auto_289227 ?auto_289230 ) ) ( not ( = ?auto_289227 ?auto_289231 ) ) ( not ( = ?auto_289227 ?auto_289232 ) ) ( not ( = ?auto_289227 ?auto_289233 ) ) ( not ( = ?auto_289227 ?auto_289234 ) ) ( not ( = ?auto_289227 ?auto_289235 ) ) ( not ( = ?auto_289228 ?auto_289229 ) ) ( not ( = ?auto_289228 ?auto_289230 ) ) ( not ( = ?auto_289228 ?auto_289231 ) ) ( not ( = ?auto_289228 ?auto_289232 ) ) ( not ( = ?auto_289228 ?auto_289233 ) ) ( not ( = ?auto_289228 ?auto_289234 ) ) ( not ( = ?auto_289228 ?auto_289235 ) ) ( not ( = ?auto_289229 ?auto_289230 ) ) ( not ( = ?auto_289229 ?auto_289231 ) ) ( not ( = ?auto_289229 ?auto_289232 ) ) ( not ( = ?auto_289229 ?auto_289233 ) ) ( not ( = ?auto_289229 ?auto_289234 ) ) ( not ( = ?auto_289229 ?auto_289235 ) ) ( not ( = ?auto_289230 ?auto_289231 ) ) ( not ( = ?auto_289230 ?auto_289232 ) ) ( not ( = ?auto_289230 ?auto_289233 ) ) ( not ( = ?auto_289230 ?auto_289234 ) ) ( not ( = ?auto_289230 ?auto_289235 ) ) ( not ( = ?auto_289231 ?auto_289232 ) ) ( not ( = ?auto_289231 ?auto_289233 ) ) ( not ( = ?auto_289231 ?auto_289234 ) ) ( not ( = ?auto_289231 ?auto_289235 ) ) ( not ( = ?auto_289232 ?auto_289233 ) ) ( not ( = ?auto_289232 ?auto_289234 ) ) ( not ( = ?auto_289232 ?auto_289235 ) ) ( not ( = ?auto_289233 ?auto_289234 ) ) ( not ( = ?auto_289233 ?auto_289235 ) ) ( not ( = ?auto_289234 ?auto_289235 ) ) ( ON ?auto_289233 ?auto_289234 ) ( ON ?auto_289232 ?auto_289233 ) ( ON ?auto_289231 ?auto_289232 ) ( ON ?auto_289230 ?auto_289231 ) ( CLEAR ?auto_289228 ) ( ON ?auto_289229 ?auto_289230 ) ( CLEAR ?auto_289229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_289225 ?auto_289226 ?auto_289227 ?auto_289228 ?auto_289229 )
      ( MAKE-10PILE ?auto_289225 ?auto_289226 ?auto_289227 ?auto_289228 ?auto_289229 ?auto_289230 ?auto_289231 ?auto_289232 ?auto_289233 ?auto_289234 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_289246 - BLOCK
      ?auto_289247 - BLOCK
      ?auto_289248 - BLOCK
      ?auto_289249 - BLOCK
      ?auto_289250 - BLOCK
      ?auto_289251 - BLOCK
      ?auto_289252 - BLOCK
      ?auto_289253 - BLOCK
      ?auto_289254 - BLOCK
      ?auto_289255 - BLOCK
    )
    :vars
    (
      ?auto_289256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289255 ?auto_289256 ) ( ON-TABLE ?auto_289246 ) ( ON ?auto_289247 ?auto_289246 ) ( ON ?auto_289248 ?auto_289247 ) ( ON ?auto_289249 ?auto_289248 ) ( not ( = ?auto_289246 ?auto_289247 ) ) ( not ( = ?auto_289246 ?auto_289248 ) ) ( not ( = ?auto_289246 ?auto_289249 ) ) ( not ( = ?auto_289246 ?auto_289250 ) ) ( not ( = ?auto_289246 ?auto_289251 ) ) ( not ( = ?auto_289246 ?auto_289252 ) ) ( not ( = ?auto_289246 ?auto_289253 ) ) ( not ( = ?auto_289246 ?auto_289254 ) ) ( not ( = ?auto_289246 ?auto_289255 ) ) ( not ( = ?auto_289246 ?auto_289256 ) ) ( not ( = ?auto_289247 ?auto_289248 ) ) ( not ( = ?auto_289247 ?auto_289249 ) ) ( not ( = ?auto_289247 ?auto_289250 ) ) ( not ( = ?auto_289247 ?auto_289251 ) ) ( not ( = ?auto_289247 ?auto_289252 ) ) ( not ( = ?auto_289247 ?auto_289253 ) ) ( not ( = ?auto_289247 ?auto_289254 ) ) ( not ( = ?auto_289247 ?auto_289255 ) ) ( not ( = ?auto_289247 ?auto_289256 ) ) ( not ( = ?auto_289248 ?auto_289249 ) ) ( not ( = ?auto_289248 ?auto_289250 ) ) ( not ( = ?auto_289248 ?auto_289251 ) ) ( not ( = ?auto_289248 ?auto_289252 ) ) ( not ( = ?auto_289248 ?auto_289253 ) ) ( not ( = ?auto_289248 ?auto_289254 ) ) ( not ( = ?auto_289248 ?auto_289255 ) ) ( not ( = ?auto_289248 ?auto_289256 ) ) ( not ( = ?auto_289249 ?auto_289250 ) ) ( not ( = ?auto_289249 ?auto_289251 ) ) ( not ( = ?auto_289249 ?auto_289252 ) ) ( not ( = ?auto_289249 ?auto_289253 ) ) ( not ( = ?auto_289249 ?auto_289254 ) ) ( not ( = ?auto_289249 ?auto_289255 ) ) ( not ( = ?auto_289249 ?auto_289256 ) ) ( not ( = ?auto_289250 ?auto_289251 ) ) ( not ( = ?auto_289250 ?auto_289252 ) ) ( not ( = ?auto_289250 ?auto_289253 ) ) ( not ( = ?auto_289250 ?auto_289254 ) ) ( not ( = ?auto_289250 ?auto_289255 ) ) ( not ( = ?auto_289250 ?auto_289256 ) ) ( not ( = ?auto_289251 ?auto_289252 ) ) ( not ( = ?auto_289251 ?auto_289253 ) ) ( not ( = ?auto_289251 ?auto_289254 ) ) ( not ( = ?auto_289251 ?auto_289255 ) ) ( not ( = ?auto_289251 ?auto_289256 ) ) ( not ( = ?auto_289252 ?auto_289253 ) ) ( not ( = ?auto_289252 ?auto_289254 ) ) ( not ( = ?auto_289252 ?auto_289255 ) ) ( not ( = ?auto_289252 ?auto_289256 ) ) ( not ( = ?auto_289253 ?auto_289254 ) ) ( not ( = ?auto_289253 ?auto_289255 ) ) ( not ( = ?auto_289253 ?auto_289256 ) ) ( not ( = ?auto_289254 ?auto_289255 ) ) ( not ( = ?auto_289254 ?auto_289256 ) ) ( not ( = ?auto_289255 ?auto_289256 ) ) ( ON ?auto_289254 ?auto_289255 ) ( ON ?auto_289253 ?auto_289254 ) ( ON ?auto_289252 ?auto_289253 ) ( ON ?auto_289251 ?auto_289252 ) ( CLEAR ?auto_289249 ) ( ON ?auto_289250 ?auto_289251 ) ( CLEAR ?auto_289250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_289246 ?auto_289247 ?auto_289248 ?auto_289249 ?auto_289250 )
      ( MAKE-10PILE ?auto_289246 ?auto_289247 ?auto_289248 ?auto_289249 ?auto_289250 ?auto_289251 ?auto_289252 ?auto_289253 ?auto_289254 ?auto_289255 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_289267 - BLOCK
      ?auto_289268 - BLOCK
      ?auto_289269 - BLOCK
      ?auto_289270 - BLOCK
      ?auto_289271 - BLOCK
      ?auto_289272 - BLOCK
      ?auto_289273 - BLOCK
      ?auto_289274 - BLOCK
      ?auto_289275 - BLOCK
      ?auto_289276 - BLOCK
    )
    :vars
    (
      ?auto_289277 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289276 ?auto_289277 ) ( ON-TABLE ?auto_289267 ) ( ON ?auto_289268 ?auto_289267 ) ( ON ?auto_289269 ?auto_289268 ) ( not ( = ?auto_289267 ?auto_289268 ) ) ( not ( = ?auto_289267 ?auto_289269 ) ) ( not ( = ?auto_289267 ?auto_289270 ) ) ( not ( = ?auto_289267 ?auto_289271 ) ) ( not ( = ?auto_289267 ?auto_289272 ) ) ( not ( = ?auto_289267 ?auto_289273 ) ) ( not ( = ?auto_289267 ?auto_289274 ) ) ( not ( = ?auto_289267 ?auto_289275 ) ) ( not ( = ?auto_289267 ?auto_289276 ) ) ( not ( = ?auto_289267 ?auto_289277 ) ) ( not ( = ?auto_289268 ?auto_289269 ) ) ( not ( = ?auto_289268 ?auto_289270 ) ) ( not ( = ?auto_289268 ?auto_289271 ) ) ( not ( = ?auto_289268 ?auto_289272 ) ) ( not ( = ?auto_289268 ?auto_289273 ) ) ( not ( = ?auto_289268 ?auto_289274 ) ) ( not ( = ?auto_289268 ?auto_289275 ) ) ( not ( = ?auto_289268 ?auto_289276 ) ) ( not ( = ?auto_289268 ?auto_289277 ) ) ( not ( = ?auto_289269 ?auto_289270 ) ) ( not ( = ?auto_289269 ?auto_289271 ) ) ( not ( = ?auto_289269 ?auto_289272 ) ) ( not ( = ?auto_289269 ?auto_289273 ) ) ( not ( = ?auto_289269 ?auto_289274 ) ) ( not ( = ?auto_289269 ?auto_289275 ) ) ( not ( = ?auto_289269 ?auto_289276 ) ) ( not ( = ?auto_289269 ?auto_289277 ) ) ( not ( = ?auto_289270 ?auto_289271 ) ) ( not ( = ?auto_289270 ?auto_289272 ) ) ( not ( = ?auto_289270 ?auto_289273 ) ) ( not ( = ?auto_289270 ?auto_289274 ) ) ( not ( = ?auto_289270 ?auto_289275 ) ) ( not ( = ?auto_289270 ?auto_289276 ) ) ( not ( = ?auto_289270 ?auto_289277 ) ) ( not ( = ?auto_289271 ?auto_289272 ) ) ( not ( = ?auto_289271 ?auto_289273 ) ) ( not ( = ?auto_289271 ?auto_289274 ) ) ( not ( = ?auto_289271 ?auto_289275 ) ) ( not ( = ?auto_289271 ?auto_289276 ) ) ( not ( = ?auto_289271 ?auto_289277 ) ) ( not ( = ?auto_289272 ?auto_289273 ) ) ( not ( = ?auto_289272 ?auto_289274 ) ) ( not ( = ?auto_289272 ?auto_289275 ) ) ( not ( = ?auto_289272 ?auto_289276 ) ) ( not ( = ?auto_289272 ?auto_289277 ) ) ( not ( = ?auto_289273 ?auto_289274 ) ) ( not ( = ?auto_289273 ?auto_289275 ) ) ( not ( = ?auto_289273 ?auto_289276 ) ) ( not ( = ?auto_289273 ?auto_289277 ) ) ( not ( = ?auto_289274 ?auto_289275 ) ) ( not ( = ?auto_289274 ?auto_289276 ) ) ( not ( = ?auto_289274 ?auto_289277 ) ) ( not ( = ?auto_289275 ?auto_289276 ) ) ( not ( = ?auto_289275 ?auto_289277 ) ) ( not ( = ?auto_289276 ?auto_289277 ) ) ( ON ?auto_289275 ?auto_289276 ) ( ON ?auto_289274 ?auto_289275 ) ( ON ?auto_289273 ?auto_289274 ) ( ON ?auto_289272 ?auto_289273 ) ( ON ?auto_289271 ?auto_289272 ) ( CLEAR ?auto_289269 ) ( ON ?auto_289270 ?auto_289271 ) ( CLEAR ?auto_289270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_289267 ?auto_289268 ?auto_289269 ?auto_289270 )
      ( MAKE-10PILE ?auto_289267 ?auto_289268 ?auto_289269 ?auto_289270 ?auto_289271 ?auto_289272 ?auto_289273 ?auto_289274 ?auto_289275 ?auto_289276 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_289288 - BLOCK
      ?auto_289289 - BLOCK
      ?auto_289290 - BLOCK
      ?auto_289291 - BLOCK
      ?auto_289292 - BLOCK
      ?auto_289293 - BLOCK
      ?auto_289294 - BLOCK
      ?auto_289295 - BLOCK
      ?auto_289296 - BLOCK
      ?auto_289297 - BLOCK
    )
    :vars
    (
      ?auto_289298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289297 ?auto_289298 ) ( ON-TABLE ?auto_289288 ) ( ON ?auto_289289 ?auto_289288 ) ( ON ?auto_289290 ?auto_289289 ) ( not ( = ?auto_289288 ?auto_289289 ) ) ( not ( = ?auto_289288 ?auto_289290 ) ) ( not ( = ?auto_289288 ?auto_289291 ) ) ( not ( = ?auto_289288 ?auto_289292 ) ) ( not ( = ?auto_289288 ?auto_289293 ) ) ( not ( = ?auto_289288 ?auto_289294 ) ) ( not ( = ?auto_289288 ?auto_289295 ) ) ( not ( = ?auto_289288 ?auto_289296 ) ) ( not ( = ?auto_289288 ?auto_289297 ) ) ( not ( = ?auto_289288 ?auto_289298 ) ) ( not ( = ?auto_289289 ?auto_289290 ) ) ( not ( = ?auto_289289 ?auto_289291 ) ) ( not ( = ?auto_289289 ?auto_289292 ) ) ( not ( = ?auto_289289 ?auto_289293 ) ) ( not ( = ?auto_289289 ?auto_289294 ) ) ( not ( = ?auto_289289 ?auto_289295 ) ) ( not ( = ?auto_289289 ?auto_289296 ) ) ( not ( = ?auto_289289 ?auto_289297 ) ) ( not ( = ?auto_289289 ?auto_289298 ) ) ( not ( = ?auto_289290 ?auto_289291 ) ) ( not ( = ?auto_289290 ?auto_289292 ) ) ( not ( = ?auto_289290 ?auto_289293 ) ) ( not ( = ?auto_289290 ?auto_289294 ) ) ( not ( = ?auto_289290 ?auto_289295 ) ) ( not ( = ?auto_289290 ?auto_289296 ) ) ( not ( = ?auto_289290 ?auto_289297 ) ) ( not ( = ?auto_289290 ?auto_289298 ) ) ( not ( = ?auto_289291 ?auto_289292 ) ) ( not ( = ?auto_289291 ?auto_289293 ) ) ( not ( = ?auto_289291 ?auto_289294 ) ) ( not ( = ?auto_289291 ?auto_289295 ) ) ( not ( = ?auto_289291 ?auto_289296 ) ) ( not ( = ?auto_289291 ?auto_289297 ) ) ( not ( = ?auto_289291 ?auto_289298 ) ) ( not ( = ?auto_289292 ?auto_289293 ) ) ( not ( = ?auto_289292 ?auto_289294 ) ) ( not ( = ?auto_289292 ?auto_289295 ) ) ( not ( = ?auto_289292 ?auto_289296 ) ) ( not ( = ?auto_289292 ?auto_289297 ) ) ( not ( = ?auto_289292 ?auto_289298 ) ) ( not ( = ?auto_289293 ?auto_289294 ) ) ( not ( = ?auto_289293 ?auto_289295 ) ) ( not ( = ?auto_289293 ?auto_289296 ) ) ( not ( = ?auto_289293 ?auto_289297 ) ) ( not ( = ?auto_289293 ?auto_289298 ) ) ( not ( = ?auto_289294 ?auto_289295 ) ) ( not ( = ?auto_289294 ?auto_289296 ) ) ( not ( = ?auto_289294 ?auto_289297 ) ) ( not ( = ?auto_289294 ?auto_289298 ) ) ( not ( = ?auto_289295 ?auto_289296 ) ) ( not ( = ?auto_289295 ?auto_289297 ) ) ( not ( = ?auto_289295 ?auto_289298 ) ) ( not ( = ?auto_289296 ?auto_289297 ) ) ( not ( = ?auto_289296 ?auto_289298 ) ) ( not ( = ?auto_289297 ?auto_289298 ) ) ( ON ?auto_289296 ?auto_289297 ) ( ON ?auto_289295 ?auto_289296 ) ( ON ?auto_289294 ?auto_289295 ) ( ON ?auto_289293 ?auto_289294 ) ( ON ?auto_289292 ?auto_289293 ) ( CLEAR ?auto_289290 ) ( ON ?auto_289291 ?auto_289292 ) ( CLEAR ?auto_289291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_289288 ?auto_289289 ?auto_289290 ?auto_289291 )
      ( MAKE-10PILE ?auto_289288 ?auto_289289 ?auto_289290 ?auto_289291 ?auto_289292 ?auto_289293 ?auto_289294 ?auto_289295 ?auto_289296 ?auto_289297 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_289309 - BLOCK
      ?auto_289310 - BLOCK
      ?auto_289311 - BLOCK
      ?auto_289312 - BLOCK
      ?auto_289313 - BLOCK
      ?auto_289314 - BLOCK
      ?auto_289315 - BLOCK
      ?auto_289316 - BLOCK
      ?auto_289317 - BLOCK
      ?auto_289318 - BLOCK
    )
    :vars
    (
      ?auto_289319 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289318 ?auto_289319 ) ( ON-TABLE ?auto_289309 ) ( ON ?auto_289310 ?auto_289309 ) ( not ( = ?auto_289309 ?auto_289310 ) ) ( not ( = ?auto_289309 ?auto_289311 ) ) ( not ( = ?auto_289309 ?auto_289312 ) ) ( not ( = ?auto_289309 ?auto_289313 ) ) ( not ( = ?auto_289309 ?auto_289314 ) ) ( not ( = ?auto_289309 ?auto_289315 ) ) ( not ( = ?auto_289309 ?auto_289316 ) ) ( not ( = ?auto_289309 ?auto_289317 ) ) ( not ( = ?auto_289309 ?auto_289318 ) ) ( not ( = ?auto_289309 ?auto_289319 ) ) ( not ( = ?auto_289310 ?auto_289311 ) ) ( not ( = ?auto_289310 ?auto_289312 ) ) ( not ( = ?auto_289310 ?auto_289313 ) ) ( not ( = ?auto_289310 ?auto_289314 ) ) ( not ( = ?auto_289310 ?auto_289315 ) ) ( not ( = ?auto_289310 ?auto_289316 ) ) ( not ( = ?auto_289310 ?auto_289317 ) ) ( not ( = ?auto_289310 ?auto_289318 ) ) ( not ( = ?auto_289310 ?auto_289319 ) ) ( not ( = ?auto_289311 ?auto_289312 ) ) ( not ( = ?auto_289311 ?auto_289313 ) ) ( not ( = ?auto_289311 ?auto_289314 ) ) ( not ( = ?auto_289311 ?auto_289315 ) ) ( not ( = ?auto_289311 ?auto_289316 ) ) ( not ( = ?auto_289311 ?auto_289317 ) ) ( not ( = ?auto_289311 ?auto_289318 ) ) ( not ( = ?auto_289311 ?auto_289319 ) ) ( not ( = ?auto_289312 ?auto_289313 ) ) ( not ( = ?auto_289312 ?auto_289314 ) ) ( not ( = ?auto_289312 ?auto_289315 ) ) ( not ( = ?auto_289312 ?auto_289316 ) ) ( not ( = ?auto_289312 ?auto_289317 ) ) ( not ( = ?auto_289312 ?auto_289318 ) ) ( not ( = ?auto_289312 ?auto_289319 ) ) ( not ( = ?auto_289313 ?auto_289314 ) ) ( not ( = ?auto_289313 ?auto_289315 ) ) ( not ( = ?auto_289313 ?auto_289316 ) ) ( not ( = ?auto_289313 ?auto_289317 ) ) ( not ( = ?auto_289313 ?auto_289318 ) ) ( not ( = ?auto_289313 ?auto_289319 ) ) ( not ( = ?auto_289314 ?auto_289315 ) ) ( not ( = ?auto_289314 ?auto_289316 ) ) ( not ( = ?auto_289314 ?auto_289317 ) ) ( not ( = ?auto_289314 ?auto_289318 ) ) ( not ( = ?auto_289314 ?auto_289319 ) ) ( not ( = ?auto_289315 ?auto_289316 ) ) ( not ( = ?auto_289315 ?auto_289317 ) ) ( not ( = ?auto_289315 ?auto_289318 ) ) ( not ( = ?auto_289315 ?auto_289319 ) ) ( not ( = ?auto_289316 ?auto_289317 ) ) ( not ( = ?auto_289316 ?auto_289318 ) ) ( not ( = ?auto_289316 ?auto_289319 ) ) ( not ( = ?auto_289317 ?auto_289318 ) ) ( not ( = ?auto_289317 ?auto_289319 ) ) ( not ( = ?auto_289318 ?auto_289319 ) ) ( ON ?auto_289317 ?auto_289318 ) ( ON ?auto_289316 ?auto_289317 ) ( ON ?auto_289315 ?auto_289316 ) ( ON ?auto_289314 ?auto_289315 ) ( ON ?auto_289313 ?auto_289314 ) ( ON ?auto_289312 ?auto_289313 ) ( CLEAR ?auto_289310 ) ( ON ?auto_289311 ?auto_289312 ) ( CLEAR ?auto_289311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_289309 ?auto_289310 ?auto_289311 )
      ( MAKE-10PILE ?auto_289309 ?auto_289310 ?auto_289311 ?auto_289312 ?auto_289313 ?auto_289314 ?auto_289315 ?auto_289316 ?auto_289317 ?auto_289318 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_289330 - BLOCK
      ?auto_289331 - BLOCK
      ?auto_289332 - BLOCK
      ?auto_289333 - BLOCK
      ?auto_289334 - BLOCK
      ?auto_289335 - BLOCK
      ?auto_289336 - BLOCK
      ?auto_289337 - BLOCK
      ?auto_289338 - BLOCK
      ?auto_289339 - BLOCK
    )
    :vars
    (
      ?auto_289340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289339 ?auto_289340 ) ( ON-TABLE ?auto_289330 ) ( ON ?auto_289331 ?auto_289330 ) ( not ( = ?auto_289330 ?auto_289331 ) ) ( not ( = ?auto_289330 ?auto_289332 ) ) ( not ( = ?auto_289330 ?auto_289333 ) ) ( not ( = ?auto_289330 ?auto_289334 ) ) ( not ( = ?auto_289330 ?auto_289335 ) ) ( not ( = ?auto_289330 ?auto_289336 ) ) ( not ( = ?auto_289330 ?auto_289337 ) ) ( not ( = ?auto_289330 ?auto_289338 ) ) ( not ( = ?auto_289330 ?auto_289339 ) ) ( not ( = ?auto_289330 ?auto_289340 ) ) ( not ( = ?auto_289331 ?auto_289332 ) ) ( not ( = ?auto_289331 ?auto_289333 ) ) ( not ( = ?auto_289331 ?auto_289334 ) ) ( not ( = ?auto_289331 ?auto_289335 ) ) ( not ( = ?auto_289331 ?auto_289336 ) ) ( not ( = ?auto_289331 ?auto_289337 ) ) ( not ( = ?auto_289331 ?auto_289338 ) ) ( not ( = ?auto_289331 ?auto_289339 ) ) ( not ( = ?auto_289331 ?auto_289340 ) ) ( not ( = ?auto_289332 ?auto_289333 ) ) ( not ( = ?auto_289332 ?auto_289334 ) ) ( not ( = ?auto_289332 ?auto_289335 ) ) ( not ( = ?auto_289332 ?auto_289336 ) ) ( not ( = ?auto_289332 ?auto_289337 ) ) ( not ( = ?auto_289332 ?auto_289338 ) ) ( not ( = ?auto_289332 ?auto_289339 ) ) ( not ( = ?auto_289332 ?auto_289340 ) ) ( not ( = ?auto_289333 ?auto_289334 ) ) ( not ( = ?auto_289333 ?auto_289335 ) ) ( not ( = ?auto_289333 ?auto_289336 ) ) ( not ( = ?auto_289333 ?auto_289337 ) ) ( not ( = ?auto_289333 ?auto_289338 ) ) ( not ( = ?auto_289333 ?auto_289339 ) ) ( not ( = ?auto_289333 ?auto_289340 ) ) ( not ( = ?auto_289334 ?auto_289335 ) ) ( not ( = ?auto_289334 ?auto_289336 ) ) ( not ( = ?auto_289334 ?auto_289337 ) ) ( not ( = ?auto_289334 ?auto_289338 ) ) ( not ( = ?auto_289334 ?auto_289339 ) ) ( not ( = ?auto_289334 ?auto_289340 ) ) ( not ( = ?auto_289335 ?auto_289336 ) ) ( not ( = ?auto_289335 ?auto_289337 ) ) ( not ( = ?auto_289335 ?auto_289338 ) ) ( not ( = ?auto_289335 ?auto_289339 ) ) ( not ( = ?auto_289335 ?auto_289340 ) ) ( not ( = ?auto_289336 ?auto_289337 ) ) ( not ( = ?auto_289336 ?auto_289338 ) ) ( not ( = ?auto_289336 ?auto_289339 ) ) ( not ( = ?auto_289336 ?auto_289340 ) ) ( not ( = ?auto_289337 ?auto_289338 ) ) ( not ( = ?auto_289337 ?auto_289339 ) ) ( not ( = ?auto_289337 ?auto_289340 ) ) ( not ( = ?auto_289338 ?auto_289339 ) ) ( not ( = ?auto_289338 ?auto_289340 ) ) ( not ( = ?auto_289339 ?auto_289340 ) ) ( ON ?auto_289338 ?auto_289339 ) ( ON ?auto_289337 ?auto_289338 ) ( ON ?auto_289336 ?auto_289337 ) ( ON ?auto_289335 ?auto_289336 ) ( ON ?auto_289334 ?auto_289335 ) ( ON ?auto_289333 ?auto_289334 ) ( CLEAR ?auto_289331 ) ( ON ?auto_289332 ?auto_289333 ) ( CLEAR ?auto_289332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_289330 ?auto_289331 ?auto_289332 )
      ( MAKE-10PILE ?auto_289330 ?auto_289331 ?auto_289332 ?auto_289333 ?auto_289334 ?auto_289335 ?auto_289336 ?auto_289337 ?auto_289338 ?auto_289339 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_289351 - BLOCK
      ?auto_289352 - BLOCK
      ?auto_289353 - BLOCK
      ?auto_289354 - BLOCK
      ?auto_289355 - BLOCK
      ?auto_289356 - BLOCK
      ?auto_289357 - BLOCK
      ?auto_289358 - BLOCK
      ?auto_289359 - BLOCK
      ?auto_289360 - BLOCK
    )
    :vars
    (
      ?auto_289361 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289360 ?auto_289361 ) ( ON-TABLE ?auto_289351 ) ( not ( = ?auto_289351 ?auto_289352 ) ) ( not ( = ?auto_289351 ?auto_289353 ) ) ( not ( = ?auto_289351 ?auto_289354 ) ) ( not ( = ?auto_289351 ?auto_289355 ) ) ( not ( = ?auto_289351 ?auto_289356 ) ) ( not ( = ?auto_289351 ?auto_289357 ) ) ( not ( = ?auto_289351 ?auto_289358 ) ) ( not ( = ?auto_289351 ?auto_289359 ) ) ( not ( = ?auto_289351 ?auto_289360 ) ) ( not ( = ?auto_289351 ?auto_289361 ) ) ( not ( = ?auto_289352 ?auto_289353 ) ) ( not ( = ?auto_289352 ?auto_289354 ) ) ( not ( = ?auto_289352 ?auto_289355 ) ) ( not ( = ?auto_289352 ?auto_289356 ) ) ( not ( = ?auto_289352 ?auto_289357 ) ) ( not ( = ?auto_289352 ?auto_289358 ) ) ( not ( = ?auto_289352 ?auto_289359 ) ) ( not ( = ?auto_289352 ?auto_289360 ) ) ( not ( = ?auto_289352 ?auto_289361 ) ) ( not ( = ?auto_289353 ?auto_289354 ) ) ( not ( = ?auto_289353 ?auto_289355 ) ) ( not ( = ?auto_289353 ?auto_289356 ) ) ( not ( = ?auto_289353 ?auto_289357 ) ) ( not ( = ?auto_289353 ?auto_289358 ) ) ( not ( = ?auto_289353 ?auto_289359 ) ) ( not ( = ?auto_289353 ?auto_289360 ) ) ( not ( = ?auto_289353 ?auto_289361 ) ) ( not ( = ?auto_289354 ?auto_289355 ) ) ( not ( = ?auto_289354 ?auto_289356 ) ) ( not ( = ?auto_289354 ?auto_289357 ) ) ( not ( = ?auto_289354 ?auto_289358 ) ) ( not ( = ?auto_289354 ?auto_289359 ) ) ( not ( = ?auto_289354 ?auto_289360 ) ) ( not ( = ?auto_289354 ?auto_289361 ) ) ( not ( = ?auto_289355 ?auto_289356 ) ) ( not ( = ?auto_289355 ?auto_289357 ) ) ( not ( = ?auto_289355 ?auto_289358 ) ) ( not ( = ?auto_289355 ?auto_289359 ) ) ( not ( = ?auto_289355 ?auto_289360 ) ) ( not ( = ?auto_289355 ?auto_289361 ) ) ( not ( = ?auto_289356 ?auto_289357 ) ) ( not ( = ?auto_289356 ?auto_289358 ) ) ( not ( = ?auto_289356 ?auto_289359 ) ) ( not ( = ?auto_289356 ?auto_289360 ) ) ( not ( = ?auto_289356 ?auto_289361 ) ) ( not ( = ?auto_289357 ?auto_289358 ) ) ( not ( = ?auto_289357 ?auto_289359 ) ) ( not ( = ?auto_289357 ?auto_289360 ) ) ( not ( = ?auto_289357 ?auto_289361 ) ) ( not ( = ?auto_289358 ?auto_289359 ) ) ( not ( = ?auto_289358 ?auto_289360 ) ) ( not ( = ?auto_289358 ?auto_289361 ) ) ( not ( = ?auto_289359 ?auto_289360 ) ) ( not ( = ?auto_289359 ?auto_289361 ) ) ( not ( = ?auto_289360 ?auto_289361 ) ) ( ON ?auto_289359 ?auto_289360 ) ( ON ?auto_289358 ?auto_289359 ) ( ON ?auto_289357 ?auto_289358 ) ( ON ?auto_289356 ?auto_289357 ) ( ON ?auto_289355 ?auto_289356 ) ( ON ?auto_289354 ?auto_289355 ) ( ON ?auto_289353 ?auto_289354 ) ( CLEAR ?auto_289351 ) ( ON ?auto_289352 ?auto_289353 ) ( CLEAR ?auto_289352 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_289351 ?auto_289352 )
      ( MAKE-10PILE ?auto_289351 ?auto_289352 ?auto_289353 ?auto_289354 ?auto_289355 ?auto_289356 ?auto_289357 ?auto_289358 ?auto_289359 ?auto_289360 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_289372 - BLOCK
      ?auto_289373 - BLOCK
      ?auto_289374 - BLOCK
      ?auto_289375 - BLOCK
      ?auto_289376 - BLOCK
      ?auto_289377 - BLOCK
      ?auto_289378 - BLOCK
      ?auto_289379 - BLOCK
      ?auto_289380 - BLOCK
      ?auto_289381 - BLOCK
    )
    :vars
    (
      ?auto_289382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289381 ?auto_289382 ) ( ON-TABLE ?auto_289372 ) ( not ( = ?auto_289372 ?auto_289373 ) ) ( not ( = ?auto_289372 ?auto_289374 ) ) ( not ( = ?auto_289372 ?auto_289375 ) ) ( not ( = ?auto_289372 ?auto_289376 ) ) ( not ( = ?auto_289372 ?auto_289377 ) ) ( not ( = ?auto_289372 ?auto_289378 ) ) ( not ( = ?auto_289372 ?auto_289379 ) ) ( not ( = ?auto_289372 ?auto_289380 ) ) ( not ( = ?auto_289372 ?auto_289381 ) ) ( not ( = ?auto_289372 ?auto_289382 ) ) ( not ( = ?auto_289373 ?auto_289374 ) ) ( not ( = ?auto_289373 ?auto_289375 ) ) ( not ( = ?auto_289373 ?auto_289376 ) ) ( not ( = ?auto_289373 ?auto_289377 ) ) ( not ( = ?auto_289373 ?auto_289378 ) ) ( not ( = ?auto_289373 ?auto_289379 ) ) ( not ( = ?auto_289373 ?auto_289380 ) ) ( not ( = ?auto_289373 ?auto_289381 ) ) ( not ( = ?auto_289373 ?auto_289382 ) ) ( not ( = ?auto_289374 ?auto_289375 ) ) ( not ( = ?auto_289374 ?auto_289376 ) ) ( not ( = ?auto_289374 ?auto_289377 ) ) ( not ( = ?auto_289374 ?auto_289378 ) ) ( not ( = ?auto_289374 ?auto_289379 ) ) ( not ( = ?auto_289374 ?auto_289380 ) ) ( not ( = ?auto_289374 ?auto_289381 ) ) ( not ( = ?auto_289374 ?auto_289382 ) ) ( not ( = ?auto_289375 ?auto_289376 ) ) ( not ( = ?auto_289375 ?auto_289377 ) ) ( not ( = ?auto_289375 ?auto_289378 ) ) ( not ( = ?auto_289375 ?auto_289379 ) ) ( not ( = ?auto_289375 ?auto_289380 ) ) ( not ( = ?auto_289375 ?auto_289381 ) ) ( not ( = ?auto_289375 ?auto_289382 ) ) ( not ( = ?auto_289376 ?auto_289377 ) ) ( not ( = ?auto_289376 ?auto_289378 ) ) ( not ( = ?auto_289376 ?auto_289379 ) ) ( not ( = ?auto_289376 ?auto_289380 ) ) ( not ( = ?auto_289376 ?auto_289381 ) ) ( not ( = ?auto_289376 ?auto_289382 ) ) ( not ( = ?auto_289377 ?auto_289378 ) ) ( not ( = ?auto_289377 ?auto_289379 ) ) ( not ( = ?auto_289377 ?auto_289380 ) ) ( not ( = ?auto_289377 ?auto_289381 ) ) ( not ( = ?auto_289377 ?auto_289382 ) ) ( not ( = ?auto_289378 ?auto_289379 ) ) ( not ( = ?auto_289378 ?auto_289380 ) ) ( not ( = ?auto_289378 ?auto_289381 ) ) ( not ( = ?auto_289378 ?auto_289382 ) ) ( not ( = ?auto_289379 ?auto_289380 ) ) ( not ( = ?auto_289379 ?auto_289381 ) ) ( not ( = ?auto_289379 ?auto_289382 ) ) ( not ( = ?auto_289380 ?auto_289381 ) ) ( not ( = ?auto_289380 ?auto_289382 ) ) ( not ( = ?auto_289381 ?auto_289382 ) ) ( ON ?auto_289380 ?auto_289381 ) ( ON ?auto_289379 ?auto_289380 ) ( ON ?auto_289378 ?auto_289379 ) ( ON ?auto_289377 ?auto_289378 ) ( ON ?auto_289376 ?auto_289377 ) ( ON ?auto_289375 ?auto_289376 ) ( ON ?auto_289374 ?auto_289375 ) ( CLEAR ?auto_289372 ) ( ON ?auto_289373 ?auto_289374 ) ( CLEAR ?auto_289373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_289372 ?auto_289373 )
      ( MAKE-10PILE ?auto_289372 ?auto_289373 ?auto_289374 ?auto_289375 ?auto_289376 ?auto_289377 ?auto_289378 ?auto_289379 ?auto_289380 ?auto_289381 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_289393 - BLOCK
      ?auto_289394 - BLOCK
      ?auto_289395 - BLOCK
      ?auto_289396 - BLOCK
      ?auto_289397 - BLOCK
      ?auto_289398 - BLOCK
      ?auto_289399 - BLOCK
      ?auto_289400 - BLOCK
      ?auto_289401 - BLOCK
      ?auto_289402 - BLOCK
    )
    :vars
    (
      ?auto_289403 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289402 ?auto_289403 ) ( not ( = ?auto_289393 ?auto_289394 ) ) ( not ( = ?auto_289393 ?auto_289395 ) ) ( not ( = ?auto_289393 ?auto_289396 ) ) ( not ( = ?auto_289393 ?auto_289397 ) ) ( not ( = ?auto_289393 ?auto_289398 ) ) ( not ( = ?auto_289393 ?auto_289399 ) ) ( not ( = ?auto_289393 ?auto_289400 ) ) ( not ( = ?auto_289393 ?auto_289401 ) ) ( not ( = ?auto_289393 ?auto_289402 ) ) ( not ( = ?auto_289393 ?auto_289403 ) ) ( not ( = ?auto_289394 ?auto_289395 ) ) ( not ( = ?auto_289394 ?auto_289396 ) ) ( not ( = ?auto_289394 ?auto_289397 ) ) ( not ( = ?auto_289394 ?auto_289398 ) ) ( not ( = ?auto_289394 ?auto_289399 ) ) ( not ( = ?auto_289394 ?auto_289400 ) ) ( not ( = ?auto_289394 ?auto_289401 ) ) ( not ( = ?auto_289394 ?auto_289402 ) ) ( not ( = ?auto_289394 ?auto_289403 ) ) ( not ( = ?auto_289395 ?auto_289396 ) ) ( not ( = ?auto_289395 ?auto_289397 ) ) ( not ( = ?auto_289395 ?auto_289398 ) ) ( not ( = ?auto_289395 ?auto_289399 ) ) ( not ( = ?auto_289395 ?auto_289400 ) ) ( not ( = ?auto_289395 ?auto_289401 ) ) ( not ( = ?auto_289395 ?auto_289402 ) ) ( not ( = ?auto_289395 ?auto_289403 ) ) ( not ( = ?auto_289396 ?auto_289397 ) ) ( not ( = ?auto_289396 ?auto_289398 ) ) ( not ( = ?auto_289396 ?auto_289399 ) ) ( not ( = ?auto_289396 ?auto_289400 ) ) ( not ( = ?auto_289396 ?auto_289401 ) ) ( not ( = ?auto_289396 ?auto_289402 ) ) ( not ( = ?auto_289396 ?auto_289403 ) ) ( not ( = ?auto_289397 ?auto_289398 ) ) ( not ( = ?auto_289397 ?auto_289399 ) ) ( not ( = ?auto_289397 ?auto_289400 ) ) ( not ( = ?auto_289397 ?auto_289401 ) ) ( not ( = ?auto_289397 ?auto_289402 ) ) ( not ( = ?auto_289397 ?auto_289403 ) ) ( not ( = ?auto_289398 ?auto_289399 ) ) ( not ( = ?auto_289398 ?auto_289400 ) ) ( not ( = ?auto_289398 ?auto_289401 ) ) ( not ( = ?auto_289398 ?auto_289402 ) ) ( not ( = ?auto_289398 ?auto_289403 ) ) ( not ( = ?auto_289399 ?auto_289400 ) ) ( not ( = ?auto_289399 ?auto_289401 ) ) ( not ( = ?auto_289399 ?auto_289402 ) ) ( not ( = ?auto_289399 ?auto_289403 ) ) ( not ( = ?auto_289400 ?auto_289401 ) ) ( not ( = ?auto_289400 ?auto_289402 ) ) ( not ( = ?auto_289400 ?auto_289403 ) ) ( not ( = ?auto_289401 ?auto_289402 ) ) ( not ( = ?auto_289401 ?auto_289403 ) ) ( not ( = ?auto_289402 ?auto_289403 ) ) ( ON ?auto_289401 ?auto_289402 ) ( ON ?auto_289400 ?auto_289401 ) ( ON ?auto_289399 ?auto_289400 ) ( ON ?auto_289398 ?auto_289399 ) ( ON ?auto_289397 ?auto_289398 ) ( ON ?auto_289396 ?auto_289397 ) ( ON ?auto_289395 ?auto_289396 ) ( ON ?auto_289394 ?auto_289395 ) ( ON ?auto_289393 ?auto_289394 ) ( CLEAR ?auto_289393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_289393 )
      ( MAKE-10PILE ?auto_289393 ?auto_289394 ?auto_289395 ?auto_289396 ?auto_289397 ?auto_289398 ?auto_289399 ?auto_289400 ?auto_289401 ?auto_289402 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_289414 - BLOCK
      ?auto_289415 - BLOCK
      ?auto_289416 - BLOCK
      ?auto_289417 - BLOCK
      ?auto_289418 - BLOCK
      ?auto_289419 - BLOCK
      ?auto_289420 - BLOCK
      ?auto_289421 - BLOCK
      ?auto_289422 - BLOCK
      ?auto_289423 - BLOCK
    )
    :vars
    (
      ?auto_289424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289423 ?auto_289424 ) ( not ( = ?auto_289414 ?auto_289415 ) ) ( not ( = ?auto_289414 ?auto_289416 ) ) ( not ( = ?auto_289414 ?auto_289417 ) ) ( not ( = ?auto_289414 ?auto_289418 ) ) ( not ( = ?auto_289414 ?auto_289419 ) ) ( not ( = ?auto_289414 ?auto_289420 ) ) ( not ( = ?auto_289414 ?auto_289421 ) ) ( not ( = ?auto_289414 ?auto_289422 ) ) ( not ( = ?auto_289414 ?auto_289423 ) ) ( not ( = ?auto_289414 ?auto_289424 ) ) ( not ( = ?auto_289415 ?auto_289416 ) ) ( not ( = ?auto_289415 ?auto_289417 ) ) ( not ( = ?auto_289415 ?auto_289418 ) ) ( not ( = ?auto_289415 ?auto_289419 ) ) ( not ( = ?auto_289415 ?auto_289420 ) ) ( not ( = ?auto_289415 ?auto_289421 ) ) ( not ( = ?auto_289415 ?auto_289422 ) ) ( not ( = ?auto_289415 ?auto_289423 ) ) ( not ( = ?auto_289415 ?auto_289424 ) ) ( not ( = ?auto_289416 ?auto_289417 ) ) ( not ( = ?auto_289416 ?auto_289418 ) ) ( not ( = ?auto_289416 ?auto_289419 ) ) ( not ( = ?auto_289416 ?auto_289420 ) ) ( not ( = ?auto_289416 ?auto_289421 ) ) ( not ( = ?auto_289416 ?auto_289422 ) ) ( not ( = ?auto_289416 ?auto_289423 ) ) ( not ( = ?auto_289416 ?auto_289424 ) ) ( not ( = ?auto_289417 ?auto_289418 ) ) ( not ( = ?auto_289417 ?auto_289419 ) ) ( not ( = ?auto_289417 ?auto_289420 ) ) ( not ( = ?auto_289417 ?auto_289421 ) ) ( not ( = ?auto_289417 ?auto_289422 ) ) ( not ( = ?auto_289417 ?auto_289423 ) ) ( not ( = ?auto_289417 ?auto_289424 ) ) ( not ( = ?auto_289418 ?auto_289419 ) ) ( not ( = ?auto_289418 ?auto_289420 ) ) ( not ( = ?auto_289418 ?auto_289421 ) ) ( not ( = ?auto_289418 ?auto_289422 ) ) ( not ( = ?auto_289418 ?auto_289423 ) ) ( not ( = ?auto_289418 ?auto_289424 ) ) ( not ( = ?auto_289419 ?auto_289420 ) ) ( not ( = ?auto_289419 ?auto_289421 ) ) ( not ( = ?auto_289419 ?auto_289422 ) ) ( not ( = ?auto_289419 ?auto_289423 ) ) ( not ( = ?auto_289419 ?auto_289424 ) ) ( not ( = ?auto_289420 ?auto_289421 ) ) ( not ( = ?auto_289420 ?auto_289422 ) ) ( not ( = ?auto_289420 ?auto_289423 ) ) ( not ( = ?auto_289420 ?auto_289424 ) ) ( not ( = ?auto_289421 ?auto_289422 ) ) ( not ( = ?auto_289421 ?auto_289423 ) ) ( not ( = ?auto_289421 ?auto_289424 ) ) ( not ( = ?auto_289422 ?auto_289423 ) ) ( not ( = ?auto_289422 ?auto_289424 ) ) ( not ( = ?auto_289423 ?auto_289424 ) ) ( ON ?auto_289422 ?auto_289423 ) ( ON ?auto_289421 ?auto_289422 ) ( ON ?auto_289420 ?auto_289421 ) ( ON ?auto_289419 ?auto_289420 ) ( ON ?auto_289418 ?auto_289419 ) ( ON ?auto_289417 ?auto_289418 ) ( ON ?auto_289416 ?auto_289417 ) ( ON ?auto_289415 ?auto_289416 ) ( ON ?auto_289414 ?auto_289415 ) ( CLEAR ?auto_289414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_289414 )
      ( MAKE-10PILE ?auto_289414 ?auto_289415 ?auto_289416 ?auto_289417 ?auto_289418 ?auto_289419 ?auto_289420 ?auto_289421 ?auto_289422 ?auto_289423 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_289436 - BLOCK
      ?auto_289437 - BLOCK
      ?auto_289438 - BLOCK
      ?auto_289439 - BLOCK
      ?auto_289440 - BLOCK
      ?auto_289441 - BLOCK
      ?auto_289442 - BLOCK
      ?auto_289443 - BLOCK
      ?auto_289444 - BLOCK
      ?auto_289445 - BLOCK
      ?auto_289446 - BLOCK
    )
    :vars
    (
      ?auto_289447 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_289445 ) ( ON ?auto_289446 ?auto_289447 ) ( CLEAR ?auto_289446 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_289436 ) ( ON ?auto_289437 ?auto_289436 ) ( ON ?auto_289438 ?auto_289437 ) ( ON ?auto_289439 ?auto_289438 ) ( ON ?auto_289440 ?auto_289439 ) ( ON ?auto_289441 ?auto_289440 ) ( ON ?auto_289442 ?auto_289441 ) ( ON ?auto_289443 ?auto_289442 ) ( ON ?auto_289444 ?auto_289443 ) ( ON ?auto_289445 ?auto_289444 ) ( not ( = ?auto_289436 ?auto_289437 ) ) ( not ( = ?auto_289436 ?auto_289438 ) ) ( not ( = ?auto_289436 ?auto_289439 ) ) ( not ( = ?auto_289436 ?auto_289440 ) ) ( not ( = ?auto_289436 ?auto_289441 ) ) ( not ( = ?auto_289436 ?auto_289442 ) ) ( not ( = ?auto_289436 ?auto_289443 ) ) ( not ( = ?auto_289436 ?auto_289444 ) ) ( not ( = ?auto_289436 ?auto_289445 ) ) ( not ( = ?auto_289436 ?auto_289446 ) ) ( not ( = ?auto_289436 ?auto_289447 ) ) ( not ( = ?auto_289437 ?auto_289438 ) ) ( not ( = ?auto_289437 ?auto_289439 ) ) ( not ( = ?auto_289437 ?auto_289440 ) ) ( not ( = ?auto_289437 ?auto_289441 ) ) ( not ( = ?auto_289437 ?auto_289442 ) ) ( not ( = ?auto_289437 ?auto_289443 ) ) ( not ( = ?auto_289437 ?auto_289444 ) ) ( not ( = ?auto_289437 ?auto_289445 ) ) ( not ( = ?auto_289437 ?auto_289446 ) ) ( not ( = ?auto_289437 ?auto_289447 ) ) ( not ( = ?auto_289438 ?auto_289439 ) ) ( not ( = ?auto_289438 ?auto_289440 ) ) ( not ( = ?auto_289438 ?auto_289441 ) ) ( not ( = ?auto_289438 ?auto_289442 ) ) ( not ( = ?auto_289438 ?auto_289443 ) ) ( not ( = ?auto_289438 ?auto_289444 ) ) ( not ( = ?auto_289438 ?auto_289445 ) ) ( not ( = ?auto_289438 ?auto_289446 ) ) ( not ( = ?auto_289438 ?auto_289447 ) ) ( not ( = ?auto_289439 ?auto_289440 ) ) ( not ( = ?auto_289439 ?auto_289441 ) ) ( not ( = ?auto_289439 ?auto_289442 ) ) ( not ( = ?auto_289439 ?auto_289443 ) ) ( not ( = ?auto_289439 ?auto_289444 ) ) ( not ( = ?auto_289439 ?auto_289445 ) ) ( not ( = ?auto_289439 ?auto_289446 ) ) ( not ( = ?auto_289439 ?auto_289447 ) ) ( not ( = ?auto_289440 ?auto_289441 ) ) ( not ( = ?auto_289440 ?auto_289442 ) ) ( not ( = ?auto_289440 ?auto_289443 ) ) ( not ( = ?auto_289440 ?auto_289444 ) ) ( not ( = ?auto_289440 ?auto_289445 ) ) ( not ( = ?auto_289440 ?auto_289446 ) ) ( not ( = ?auto_289440 ?auto_289447 ) ) ( not ( = ?auto_289441 ?auto_289442 ) ) ( not ( = ?auto_289441 ?auto_289443 ) ) ( not ( = ?auto_289441 ?auto_289444 ) ) ( not ( = ?auto_289441 ?auto_289445 ) ) ( not ( = ?auto_289441 ?auto_289446 ) ) ( not ( = ?auto_289441 ?auto_289447 ) ) ( not ( = ?auto_289442 ?auto_289443 ) ) ( not ( = ?auto_289442 ?auto_289444 ) ) ( not ( = ?auto_289442 ?auto_289445 ) ) ( not ( = ?auto_289442 ?auto_289446 ) ) ( not ( = ?auto_289442 ?auto_289447 ) ) ( not ( = ?auto_289443 ?auto_289444 ) ) ( not ( = ?auto_289443 ?auto_289445 ) ) ( not ( = ?auto_289443 ?auto_289446 ) ) ( not ( = ?auto_289443 ?auto_289447 ) ) ( not ( = ?auto_289444 ?auto_289445 ) ) ( not ( = ?auto_289444 ?auto_289446 ) ) ( not ( = ?auto_289444 ?auto_289447 ) ) ( not ( = ?auto_289445 ?auto_289446 ) ) ( not ( = ?auto_289445 ?auto_289447 ) ) ( not ( = ?auto_289446 ?auto_289447 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_289446 ?auto_289447 )
      ( !STACK ?auto_289446 ?auto_289445 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_289459 - BLOCK
      ?auto_289460 - BLOCK
      ?auto_289461 - BLOCK
      ?auto_289462 - BLOCK
      ?auto_289463 - BLOCK
      ?auto_289464 - BLOCK
      ?auto_289465 - BLOCK
      ?auto_289466 - BLOCK
      ?auto_289467 - BLOCK
      ?auto_289468 - BLOCK
      ?auto_289469 - BLOCK
    )
    :vars
    (
      ?auto_289470 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_289468 ) ( ON ?auto_289469 ?auto_289470 ) ( CLEAR ?auto_289469 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_289459 ) ( ON ?auto_289460 ?auto_289459 ) ( ON ?auto_289461 ?auto_289460 ) ( ON ?auto_289462 ?auto_289461 ) ( ON ?auto_289463 ?auto_289462 ) ( ON ?auto_289464 ?auto_289463 ) ( ON ?auto_289465 ?auto_289464 ) ( ON ?auto_289466 ?auto_289465 ) ( ON ?auto_289467 ?auto_289466 ) ( ON ?auto_289468 ?auto_289467 ) ( not ( = ?auto_289459 ?auto_289460 ) ) ( not ( = ?auto_289459 ?auto_289461 ) ) ( not ( = ?auto_289459 ?auto_289462 ) ) ( not ( = ?auto_289459 ?auto_289463 ) ) ( not ( = ?auto_289459 ?auto_289464 ) ) ( not ( = ?auto_289459 ?auto_289465 ) ) ( not ( = ?auto_289459 ?auto_289466 ) ) ( not ( = ?auto_289459 ?auto_289467 ) ) ( not ( = ?auto_289459 ?auto_289468 ) ) ( not ( = ?auto_289459 ?auto_289469 ) ) ( not ( = ?auto_289459 ?auto_289470 ) ) ( not ( = ?auto_289460 ?auto_289461 ) ) ( not ( = ?auto_289460 ?auto_289462 ) ) ( not ( = ?auto_289460 ?auto_289463 ) ) ( not ( = ?auto_289460 ?auto_289464 ) ) ( not ( = ?auto_289460 ?auto_289465 ) ) ( not ( = ?auto_289460 ?auto_289466 ) ) ( not ( = ?auto_289460 ?auto_289467 ) ) ( not ( = ?auto_289460 ?auto_289468 ) ) ( not ( = ?auto_289460 ?auto_289469 ) ) ( not ( = ?auto_289460 ?auto_289470 ) ) ( not ( = ?auto_289461 ?auto_289462 ) ) ( not ( = ?auto_289461 ?auto_289463 ) ) ( not ( = ?auto_289461 ?auto_289464 ) ) ( not ( = ?auto_289461 ?auto_289465 ) ) ( not ( = ?auto_289461 ?auto_289466 ) ) ( not ( = ?auto_289461 ?auto_289467 ) ) ( not ( = ?auto_289461 ?auto_289468 ) ) ( not ( = ?auto_289461 ?auto_289469 ) ) ( not ( = ?auto_289461 ?auto_289470 ) ) ( not ( = ?auto_289462 ?auto_289463 ) ) ( not ( = ?auto_289462 ?auto_289464 ) ) ( not ( = ?auto_289462 ?auto_289465 ) ) ( not ( = ?auto_289462 ?auto_289466 ) ) ( not ( = ?auto_289462 ?auto_289467 ) ) ( not ( = ?auto_289462 ?auto_289468 ) ) ( not ( = ?auto_289462 ?auto_289469 ) ) ( not ( = ?auto_289462 ?auto_289470 ) ) ( not ( = ?auto_289463 ?auto_289464 ) ) ( not ( = ?auto_289463 ?auto_289465 ) ) ( not ( = ?auto_289463 ?auto_289466 ) ) ( not ( = ?auto_289463 ?auto_289467 ) ) ( not ( = ?auto_289463 ?auto_289468 ) ) ( not ( = ?auto_289463 ?auto_289469 ) ) ( not ( = ?auto_289463 ?auto_289470 ) ) ( not ( = ?auto_289464 ?auto_289465 ) ) ( not ( = ?auto_289464 ?auto_289466 ) ) ( not ( = ?auto_289464 ?auto_289467 ) ) ( not ( = ?auto_289464 ?auto_289468 ) ) ( not ( = ?auto_289464 ?auto_289469 ) ) ( not ( = ?auto_289464 ?auto_289470 ) ) ( not ( = ?auto_289465 ?auto_289466 ) ) ( not ( = ?auto_289465 ?auto_289467 ) ) ( not ( = ?auto_289465 ?auto_289468 ) ) ( not ( = ?auto_289465 ?auto_289469 ) ) ( not ( = ?auto_289465 ?auto_289470 ) ) ( not ( = ?auto_289466 ?auto_289467 ) ) ( not ( = ?auto_289466 ?auto_289468 ) ) ( not ( = ?auto_289466 ?auto_289469 ) ) ( not ( = ?auto_289466 ?auto_289470 ) ) ( not ( = ?auto_289467 ?auto_289468 ) ) ( not ( = ?auto_289467 ?auto_289469 ) ) ( not ( = ?auto_289467 ?auto_289470 ) ) ( not ( = ?auto_289468 ?auto_289469 ) ) ( not ( = ?auto_289468 ?auto_289470 ) ) ( not ( = ?auto_289469 ?auto_289470 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_289469 ?auto_289470 )
      ( !STACK ?auto_289469 ?auto_289468 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_289482 - BLOCK
      ?auto_289483 - BLOCK
      ?auto_289484 - BLOCK
      ?auto_289485 - BLOCK
      ?auto_289486 - BLOCK
      ?auto_289487 - BLOCK
      ?auto_289488 - BLOCK
      ?auto_289489 - BLOCK
      ?auto_289490 - BLOCK
      ?auto_289491 - BLOCK
      ?auto_289492 - BLOCK
    )
    :vars
    (
      ?auto_289493 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289492 ?auto_289493 ) ( ON-TABLE ?auto_289482 ) ( ON ?auto_289483 ?auto_289482 ) ( ON ?auto_289484 ?auto_289483 ) ( ON ?auto_289485 ?auto_289484 ) ( ON ?auto_289486 ?auto_289485 ) ( ON ?auto_289487 ?auto_289486 ) ( ON ?auto_289488 ?auto_289487 ) ( ON ?auto_289489 ?auto_289488 ) ( ON ?auto_289490 ?auto_289489 ) ( not ( = ?auto_289482 ?auto_289483 ) ) ( not ( = ?auto_289482 ?auto_289484 ) ) ( not ( = ?auto_289482 ?auto_289485 ) ) ( not ( = ?auto_289482 ?auto_289486 ) ) ( not ( = ?auto_289482 ?auto_289487 ) ) ( not ( = ?auto_289482 ?auto_289488 ) ) ( not ( = ?auto_289482 ?auto_289489 ) ) ( not ( = ?auto_289482 ?auto_289490 ) ) ( not ( = ?auto_289482 ?auto_289491 ) ) ( not ( = ?auto_289482 ?auto_289492 ) ) ( not ( = ?auto_289482 ?auto_289493 ) ) ( not ( = ?auto_289483 ?auto_289484 ) ) ( not ( = ?auto_289483 ?auto_289485 ) ) ( not ( = ?auto_289483 ?auto_289486 ) ) ( not ( = ?auto_289483 ?auto_289487 ) ) ( not ( = ?auto_289483 ?auto_289488 ) ) ( not ( = ?auto_289483 ?auto_289489 ) ) ( not ( = ?auto_289483 ?auto_289490 ) ) ( not ( = ?auto_289483 ?auto_289491 ) ) ( not ( = ?auto_289483 ?auto_289492 ) ) ( not ( = ?auto_289483 ?auto_289493 ) ) ( not ( = ?auto_289484 ?auto_289485 ) ) ( not ( = ?auto_289484 ?auto_289486 ) ) ( not ( = ?auto_289484 ?auto_289487 ) ) ( not ( = ?auto_289484 ?auto_289488 ) ) ( not ( = ?auto_289484 ?auto_289489 ) ) ( not ( = ?auto_289484 ?auto_289490 ) ) ( not ( = ?auto_289484 ?auto_289491 ) ) ( not ( = ?auto_289484 ?auto_289492 ) ) ( not ( = ?auto_289484 ?auto_289493 ) ) ( not ( = ?auto_289485 ?auto_289486 ) ) ( not ( = ?auto_289485 ?auto_289487 ) ) ( not ( = ?auto_289485 ?auto_289488 ) ) ( not ( = ?auto_289485 ?auto_289489 ) ) ( not ( = ?auto_289485 ?auto_289490 ) ) ( not ( = ?auto_289485 ?auto_289491 ) ) ( not ( = ?auto_289485 ?auto_289492 ) ) ( not ( = ?auto_289485 ?auto_289493 ) ) ( not ( = ?auto_289486 ?auto_289487 ) ) ( not ( = ?auto_289486 ?auto_289488 ) ) ( not ( = ?auto_289486 ?auto_289489 ) ) ( not ( = ?auto_289486 ?auto_289490 ) ) ( not ( = ?auto_289486 ?auto_289491 ) ) ( not ( = ?auto_289486 ?auto_289492 ) ) ( not ( = ?auto_289486 ?auto_289493 ) ) ( not ( = ?auto_289487 ?auto_289488 ) ) ( not ( = ?auto_289487 ?auto_289489 ) ) ( not ( = ?auto_289487 ?auto_289490 ) ) ( not ( = ?auto_289487 ?auto_289491 ) ) ( not ( = ?auto_289487 ?auto_289492 ) ) ( not ( = ?auto_289487 ?auto_289493 ) ) ( not ( = ?auto_289488 ?auto_289489 ) ) ( not ( = ?auto_289488 ?auto_289490 ) ) ( not ( = ?auto_289488 ?auto_289491 ) ) ( not ( = ?auto_289488 ?auto_289492 ) ) ( not ( = ?auto_289488 ?auto_289493 ) ) ( not ( = ?auto_289489 ?auto_289490 ) ) ( not ( = ?auto_289489 ?auto_289491 ) ) ( not ( = ?auto_289489 ?auto_289492 ) ) ( not ( = ?auto_289489 ?auto_289493 ) ) ( not ( = ?auto_289490 ?auto_289491 ) ) ( not ( = ?auto_289490 ?auto_289492 ) ) ( not ( = ?auto_289490 ?auto_289493 ) ) ( not ( = ?auto_289491 ?auto_289492 ) ) ( not ( = ?auto_289491 ?auto_289493 ) ) ( not ( = ?auto_289492 ?auto_289493 ) ) ( CLEAR ?auto_289490 ) ( ON ?auto_289491 ?auto_289492 ) ( CLEAR ?auto_289491 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_289482 ?auto_289483 ?auto_289484 ?auto_289485 ?auto_289486 ?auto_289487 ?auto_289488 ?auto_289489 ?auto_289490 ?auto_289491 )
      ( MAKE-11PILE ?auto_289482 ?auto_289483 ?auto_289484 ?auto_289485 ?auto_289486 ?auto_289487 ?auto_289488 ?auto_289489 ?auto_289490 ?auto_289491 ?auto_289492 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_289505 - BLOCK
      ?auto_289506 - BLOCK
      ?auto_289507 - BLOCK
      ?auto_289508 - BLOCK
      ?auto_289509 - BLOCK
      ?auto_289510 - BLOCK
      ?auto_289511 - BLOCK
      ?auto_289512 - BLOCK
      ?auto_289513 - BLOCK
      ?auto_289514 - BLOCK
      ?auto_289515 - BLOCK
    )
    :vars
    (
      ?auto_289516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289515 ?auto_289516 ) ( ON-TABLE ?auto_289505 ) ( ON ?auto_289506 ?auto_289505 ) ( ON ?auto_289507 ?auto_289506 ) ( ON ?auto_289508 ?auto_289507 ) ( ON ?auto_289509 ?auto_289508 ) ( ON ?auto_289510 ?auto_289509 ) ( ON ?auto_289511 ?auto_289510 ) ( ON ?auto_289512 ?auto_289511 ) ( ON ?auto_289513 ?auto_289512 ) ( not ( = ?auto_289505 ?auto_289506 ) ) ( not ( = ?auto_289505 ?auto_289507 ) ) ( not ( = ?auto_289505 ?auto_289508 ) ) ( not ( = ?auto_289505 ?auto_289509 ) ) ( not ( = ?auto_289505 ?auto_289510 ) ) ( not ( = ?auto_289505 ?auto_289511 ) ) ( not ( = ?auto_289505 ?auto_289512 ) ) ( not ( = ?auto_289505 ?auto_289513 ) ) ( not ( = ?auto_289505 ?auto_289514 ) ) ( not ( = ?auto_289505 ?auto_289515 ) ) ( not ( = ?auto_289505 ?auto_289516 ) ) ( not ( = ?auto_289506 ?auto_289507 ) ) ( not ( = ?auto_289506 ?auto_289508 ) ) ( not ( = ?auto_289506 ?auto_289509 ) ) ( not ( = ?auto_289506 ?auto_289510 ) ) ( not ( = ?auto_289506 ?auto_289511 ) ) ( not ( = ?auto_289506 ?auto_289512 ) ) ( not ( = ?auto_289506 ?auto_289513 ) ) ( not ( = ?auto_289506 ?auto_289514 ) ) ( not ( = ?auto_289506 ?auto_289515 ) ) ( not ( = ?auto_289506 ?auto_289516 ) ) ( not ( = ?auto_289507 ?auto_289508 ) ) ( not ( = ?auto_289507 ?auto_289509 ) ) ( not ( = ?auto_289507 ?auto_289510 ) ) ( not ( = ?auto_289507 ?auto_289511 ) ) ( not ( = ?auto_289507 ?auto_289512 ) ) ( not ( = ?auto_289507 ?auto_289513 ) ) ( not ( = ?auto_289507 ?auto_289514 ) ) ( not ( = ?auto_289507 ?auto_289515 ) ) ( not ( = ?auto_289507 ?auto_289516 ) ) ( not ( = ?auto_289508 ?auto_289509 ) ) ( not ( = ?auto_289508 ?auto_289510 ) ) ( not ( = ?auto_289508 ?auto_289511 ) ) ( not ( = ?auto_289508 ?auto_289512 ) ) ( not ( = ?auto_289508 ?auto_289513 ) ) ( not ( = ?auto_289508 ?auto_289514 ) ) ( not ( = ?auto_289508 ?auto_289515 ) ) ( not ( = ?auto_289508 ?auto_289516 ) ) ( not ( = ?auto_289509 ?auto_289510 ) ) ( not ( = ?auto_289509 ?auto_289511 ) ) ( not ( = ?auto_289509 ?auto_289512 ) ) ( not ( = ?auto_289509 ?auto_289513 ) ) ( not ( = ?auto_289509 ?auto_289514 ) ) ( not ( = ?auto_289509 ?auto_289515 ) ) ( not ( = ?auto_289509 ?auto_289516 ) ) ( not ( = ?auto_289510 ?auto_289511 ) ) ( not ( = ?auto_289510 ?auto_289512 ) ) ( not ( = ?auto_289510 ?auto_289513 ) ) ( not ( = ?auto_289510 ?auto_289514 ) ) ( not ( = ?auto_289510 ?auto_289515 ) ) ( not ( = ?auto_289510 ?auto_289516 ) ) ( not ( = ?auto_289511 ?auto_289512 ) ) ( not ( = ?auto_289511 ?auto_289513 ) ) ( not ( = ?auto_289511 ?auto_289514 ) ) ( not ( = ?auto_289511 ?auto_289515 ) ) ( not ( = ?auto_289511 ?auto_289516 ) ) ( not ( = ?auto_289512 ?auto_289513 ) ) ( not ( = ?auto_289512 ?auto_289514 ) ) ( not ( = ?auto_289512 ?auto_289515 ) ) ( not ( = ?auto_289512 ?auto_289516 ) ) ( not ( = ?auto_289513 ?auto_289514 ) ) ( not ( = ?auto_289513 ?auto_289515 ) ) ( not ( = ?auto_289513 ?auto_289516 ) ) ( not ( = ?auto_289514 ?auto_289515 ) ) ( not ( = ?auto_289514 ?auto_289516 ) ) ( not ( = ?auto_289515 ?auto_289516 ) ) ( CLEAR ?auto_289513 ) ( ON ?auto_289514 ?auto_289515 ) ( CLEAR ?auto_289514 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_289505 ?auto_289506 ?auto_289507 ?auto_289508 ?auto_289509 ?auto_289510 ?auto_289511 ?auto_289512 ?auto_289513 ?auto_289514 )
      ( MAKE-11PILE ?auto_289505 ?auto_289506 ?auto_289507 ?auto_289508 ?auto_289509 ?auto_289510 ?auto_289511 ?auto_289512 ?auto_289513 ?auto_289514 ?auto_289515 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_289528 - BLOCK
      ?auto_289529 - BLOCK
      ?auto_289530 - BLOCK
      ?auto_289531 - BLOCK
      ?auto_289532 - BLOCK
      ?auto_289533 - BLOCK
      ?auto_289534 - BLOCK
      ?auto_289535 - BLOCK
      ?auto_289536 - BLOCK
      ?auto_289537 - BLOCK
      ?auto_289538 - BLOCK
    )
    :vars
    (
      ?auto_289539 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289538 ?auto_289539 ) ( ON-TABLE ?auto_289528 ) ( ON ?auto_289529 ?auto_289528 ) ( ON ?auto_289530 ?auto_289529 ) ( ON ?auto_289531 ?auto_289530 ) ( ON ?auto_289532 ?auto_289531 ) ( ON ?auto_289533 ?auto_289532 ) ( ON ?auto_289534 ?auto_289533 ) ( ON ?auto_289535 ?auto_289534 ) ( not ( = ?auto_289528 ?auto_289529 ) ) ( not ( = ?auto_289528 ?auto_289530 ) ) ( not ( = ?auto_289528 ?auto_289531 ) ) ( not ( = ?auto_289528 ?auto_289532 ) ) ( not ( = ?auto_289528 ?auto_289533 ) ) ( not ( = ?auto_289528 ?auto_289534 ) ) ( not ( = ?auto_289528 ?auto_289535 ) ) ( not ( = ?auto_289528 ?auto_289536 ) ) ( not ( = ?auto_289528 ?auto_289537 ) ) ( not ( = ?auto_289528 ?auto_289538 ) ) ( not ( = ?auto_289528 ?auto_289539 ) ) ( not ( = ?auto_289529 ?auto_289530 ) ) ( not ( = ?auto_289529 ?auto_289531 ) ) ( not ( = ?auto_289529 ?auto_289532 ) ) ( not ( = ?auto_289529 ?auto_289533 ) ) ( not ( = ?auto_289529 ?auto_289534 ) ) ( not ( = ?auto_289529 ?auto_289535 ) ) ( not ( = ?auto_289529 ?auto_289536 ) ) ( not ( = ?auto_289529 ?auto_289537 ) ) ( not ( = ?auto_289529 ?auto_289538 ) ) ( not ( = ?auto_289529 ?auto_289539 ) ) ( not ( = ?auto_289530 ?auto_289531 ) ) ( not ( = ?auto_289530 ?auto_289532 ) ) ( not ( = ?auto_289530 ?auto_289533 ) ) ( not ( = ?auto_289530 ?auto_289534 ) ) ( not ( = ?auto_289530 ?auto_289535 ) ) ( not ( = ?auto_289530 ?auto_289536 ) ) ( not ( = ?auto_289530 ?auto_289537 ) ) ( not ( = ?auto_289530 ?auto_289538 ) ) ( not ( = ?auto_289530 ?auto_289539 ) ) ( not ( = ?auto_289531 ?auto_289532 ) ) ( not ( = ?auto_289531 ?auto_289533 ) ) ( not ( = ?auto_289531 ?auto_289534 ) ) ( not ( = ?auto_289531 ?auto_289535 ) ) ( not ( = ?auto_289531 ?auto_289536 ) ) ( not ( = ?auto_289531 ?auto_289537 ) ) ( not ( = ?auto_289531 ?auto_289538 ) ) ( not ( = ?auto_289531 ?auto_289539 ) ) ( not ( = ?auto_289532 ?auto_289533 ) ) ( not ( = ?auto_289532 ?auto_289534 ) ) ( not ( = ?auto_289532 ?auto_289535 ) ) ( not ( = ?auto_289532 ?auto_289536 ) ) ( not ( = ?auto_289532 ?auto_289537 ) ) ( not ( = ?auto_289532 ?auto_289538 ) ) ( not ( = ?auto_289532 ?auto_289539 ) ) ( not ( = ?auto_289533 ?auto_289534 ) ) ( not ( = ?auto_289533 ?auto_289535 ) ) ( not ( = ?auto_289533 ?auto_289536 ) ) ( not ( = ?auto_289533 ?auto_289537 ) ) ( not ( = ?auto_289533 ?auto_289538 ) ) ( not ( = ?auto_289533 ?auto_289539 ) ) ( not ( = ?auto_289534 ?auto_289535 ) ) ( not ( = ?auto_289534 ?auto_289536 ) ) ( not ( = ?auto_289534 ?auto_289537 ) ) ( not ( = ?auto_289534 ?auto_289538 ) ) ( not ( = ?auto_289534 ?auto_289539 ) ) ( not ( = ?auto_289535 ?auto_289536 ) ) ( not ( = ?auto_289535 ?auto_289537 ) ) ( not ( = ?auto_289535 ?auto_289538 ) ) ( not ( = ?auto_289535 ?auto_289539 ) ) ( not ( = ?auto_289536 ?auto_289537 ) ) ( not ( = ?auto_289536 ?auto_289538 ) ) ( not ( = ?auto_289536 ?auto_289539 ) ) ( not ( = ?auto_289537 ?auto_289538 ) ) ( not ( = ?auto_289537 ?auto_289539 ) ) ( not ( = ?auto_289538 ?auto_289539 ) ) ( ON ?auto_289537 ?auto_289538 ) ( CLEAR ?auto_289535 ) ( ON ?auto_289536 ?auto_289537 ) ( CLEAR ?auto_289536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_289528 ?auto_289529 ?auto_289530 ?auto_289531 ?auto_289532 ?auto_289533 ?auto_289534 ?auto_289535 ?auto_289536 )
      ( MAKE-11PILE ?auto_289528 ?auto_289529 ?auto_289530 ?auto_289531 ?auto_289532 ?auto_289533 ?auto_289534 ?auto_289535 ?auto_289536 ?auto_289537 ?auto_289538 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_289551 - BLOCK
      ?auto_289552 - BLOCK
      ?auto_289553 - BLOCK
      ?auto_289554 - BLOCK
      ?auto_289555 - BLOCK
      ?auto_289556 - BLOCK
      ?auto_289557 - BLOCK
      ?auto_289558 - BLOCK
      ?auto_289559 - BLOCK
      ?auto_289560 - BLOCK
      ?auto_289561 - BLOCK
    )
    :vars
    (
      ?auto_289562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289561 ?auto_289562 ) ( ON-TABLE ?auto_289551 ) ( ON ?auto_289552 ?auto_289551 ) ( ON ?auto_289553 ?auto_289552 ) ( ON ?auto_289554 ?auto_289553 ) ( ON ?auto_289555 ?auto_289554 ) ( ON ?auto_289556 ?auto_289555 ) ( ON ?auto_289557 ?auto_289556 ) ( ON ?auto_289558 ?auto_289557 ) ( not ( = ?auto_289551 ?auto_289552 ) ) ( not ( = ?auto_289551 ?auto_289553 ) ) ( not ( = ?auto_289551 ?auto_289554 ) ) ( not ( = ?auto_289551 ?auto_289555 ) ) ( not ( = ?auto_289551 ?auto_289556 ) ) ( not ( = ?auto_289551 ?auto_289557 ) ) ( not ( = ?auto_289551 ?auto_289558 ) ) ( not ( = ?auto_289551 ?auto_289559 ) ) ( not ( = ?auto_289551 ?auto_289560 ) ) ( not ( = ?auto_289551 ?auto_289561 ) ) ( not ( = ?auto_289551 ?auto_289562 ) ) ( not ( = ?auto_289552 ?auto_289553 ) ) ( not ( = ?auto_289552 ?auto_289554 ) ) ( not ( = ?auto_289552 ?auto_289555 ) ) ( not ( = ?auto_289552 ?auto_289556 ) ) ( not ( = ?auto_289552 ?auto_289557 ) ) ( not ( = ?auto_289552 ?auto_289558 ) ) ( not ( = ?auto_289552 ?auto_289559 ) ) ( not ( = ?auto_289552 ?auto_289560 ) ) ( not ( = ?auto_289552 ?auto_289561 ) ) ( not ( = ?auto_289552 ?auto_289562 ) ) ( not ( = ?auto_289553 ?auto_289554 ) ) ( not ( = ?auto_289553 ?auto_289555 ) ) ( not ( = ?auto_289553 ?auto_289556 ) ) ( not ( = ?auto_289553 ?auto_289557 ) ) ( not ( = ?auto_289553 ?auto_289558 ) ) ( not ( = ?auto_289553 ?auto_289559 ) ) ( not ( = ?auto_289553 ?auto_289560 ) ) ( not ( = ?auto_289553 ?auto_289561 ) ) ( not ( = ?auto_289553 ?auto_289562 ) ) ( not ( = ?auto_289554 ?auto_289555 ) ) ( not ( = ?auto_289554 ?auto_289556 ) ) ( not ( = ?auto_289554 ?auto_289557 ) ) ( not ( = ?auto_289554 ?auto_289558 ) ) ( not ( = ?auto_289554 ?auto_289559 ) ) ( not ( = ?auto_289554 ?auto_289560 ) ) ( not ( = ?auto_289554 ?auto_289561 ) ) ( not ( = ?auto_289554 ?auto_289562 ) ) ( not ( = ?auto_289555 ?auto_289556 ) ) ( not ( = ?auto_289555 ?auto_289557 ) ) ( not ( = ?auto_289555 ?auto_289558 ) ) ( not ( = ?auto_289555 ?auto_289559 ) ) ( not ( = ?auto_289555 ?auto_289560 ) ) ( not ( = ?auto_289555 ?auto_289561 ) ) ( not ( = ?auto_289555 ?auto_289562 ) ) ( not ( = ?auto_289556 ?auto_289557 ) ) ( not ( = ?auto_289556 ?auto_289558 ) ) ( not ( = ?auto_289556 ?auto_289559 ) ) ( not ( = ?auto_289556 ?auto_289560 ) ) ( not ( = ?auto_289556 ?auto_289561 ) ) ( not ( = ?auto_289556 ?auto_289562 ) ) ( not ( = ?auto_289557 ?auto_289558 ) ) ( not ( = ?auto_289557 ?auto_289559 ) ) ( not ( = ?auto_289557 ?auto_289560 ) ) ( not ( = ?auto_289557 ?auto_289561 ) ) ( not ( = ?auto_289557 ?auto_289562 ) ) ( not ( = ?auto_289558 ?auto_289559 ) ) ( not ( = ?auto_289558 ?auto_289560 ) ) ( not ( = ?auto_289558 ?auto_289561 ) ) ( not ( = ?auto_289558 ?auto_289562 ) ) ( not ( = ?auto_289559 ?auto_289560 ) ) ( not ( = ?auto_289559 ?auto_289561 ) ) ( not ( = ?auto_289559 ?auto_289562 ) ) ( not ( = ?auto_289560 ?auto_289561 ) ) ( not ( = ?auto_289560 ?auto_289562 ) ) ( not ( = ?auto_289561 ?auto_289562 ) ) ( ON ?auto_289560 ?auto_289561 ) ( CLEAR ?auto_289558 ) ( ON ?auto_289559 ?auto_289560 ) ( CLEAR ?auto_289559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_289551 ?auto_289552 ?auto_289553 ?auto_289554 ?auto_289555 ?auto_289556 ?auto_289557 ?auto_289558 ?auto_289559 )
      ( MAKE-11PILE ?auto_289551 ?auto_289552 ?auto_289553 ?auto_289554 ?auto_289555 ?auto_289556 ?auto_289557 ?auto_289558 ?auto_289559 ?auto_289560 ?auto_289561 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_289574 - BLOCK
      ?auto_289575 - BLOCK
      ?auto_289576 - BLOCK
      ?auto_289577 - BLOCK
      ?auto_289578 - BLOCK
      ?auto_289579 - BLOCK
      ?auto_289580 - BLOCK
      ?auto_289581 - BLOCK
      ?auto_289582 - BLOCK
      ?auto_289583 - BLOCK
      ?auto_289584 - BLOCK
    )
    :vars
    (
      ?auto_289585 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289584 ?auto_289585 ) ( ON-TABLE ?auto_289574 ) ( ON ?auto_289575 ?auto_289574 ) ( ON ?auto_289576 ?auto_289575 ) ( ON ?auto_289577 ?auto_289576 ) ( ON ?auto_289578 ?auto_289577 ) ( ON ?auto_289579 ?auto_289578 ) ( ON ?auto_289580 ?auto_289579 ) ( not ( = ?auto_289574 ?auto_289575 ) ) ( not ( = ?auto_289574 ?auto_289576 ) ) ( not ( = ?auto_289574 ?auto_289577 ) ) ( not ( = ?auto_289574 ?auto_289578 ) ) ( not ( = ?auto_289574 ?auto_289579 ) ) ( not ( = ?auto_289574 ?auto_289580 ) ) ( not ( = ?auto_289574 ?auto_289581 ) ) ( not ( = ?auto_289574 ?auto_289582 ) ) ( not ( = ?auto_289574 ?auto_289583 ) ) ( not ( = ?auto_289574 ?auto_289584 ) ) ( not ( = ?auto_289574 ?auto_289585 ) ) ( not ( = ?auto_289575 ?auto_289576 ) ) ( not ( = ?auto_289575 ?auto_289577 ) ) ( not ( = ?auto_289575 ?auto_289578 ) ) ( not ( = ?auto_289575 ?auto_289579 ) ) ( not ( = ?auto_289575 ?auto_289580 ) ) ( not ( = ?auto_289575 ?auto_289581 ) ) ( not ( = ?auto_289575 ?auto_289582 ) ) ( not ( = ?auto_289575 ?auto_289583 ) ) ( not ( = ?auto_289575 ?auto_289584 ) ) ( not ( = ?auto_289575 ?auto_289585 ) ) ( not ( = ?auto_289576 ?auto_289577 ) ) ( not ( = ?auto_289576 ?auto_289578 ) ) ( not ( = ?auto_289576 ?auto_289579 ) ) ( not ( = ?auto_289576 ?auto_289580 ) ) ( not ( = ?auto_289576 ?auto_289581 ) ) ( not ( = ?auto_289576 ?auto_289582 ) ) ( not ( = ?auto_289576 ?auto_289583 ) ) ( not ( = ?auto_289576 ?auto_289584 ) ) ( not ( = ?auto_289576 ?auto_289585 ) ) ( not ( = ?auto_289577 ?auto_289578 ) ) ( not ( = ?auto_289577 ?auto_289579 ) ) ( not ( = ?auto_289577 ?auto_289580 ) ) ( not ( = ?auto_289577 ?auto_289581 ) ) ( not ( = ?auto_289577 ?auto_289582 ) ) ( not ( = ?auto_289577 ?auto_289583 ) ) ( not ( = ?auto_289577 ?auto_289584 ) ) ( not ( = ?auto_289577 ?auto_289585 ) ) ( not ( = ?auto_289578 ?auto_289579 ) ) ( not ( = ?auto_289578 ?auto_289580 ) ) ( not ( = ?auto_289578 ?auto_289581 ) ) ( not ( = ?auto_289578 ?auto_289582 ) ) ( not ( = ?auto_289578 ?auto_289583 ) ) ( not ( = ?auto_289578 ?auto_289584 ) ) ( not ( = ?auto_289578 ?auto_289585 ) ) ( not ( = ?auto_289579 ?auto_289580 ) ) ( not ( = ?auto_289579 ?auto_289581 ) ) ( not ( = ?auto_289579 ?auto_289582 ) ) ( not ( = ?auto_289579 ?auto_289583 ) ) ( not ( = ?auto_289579 ?auto_289584 ) ) ( not ( = ?auto_289579 ?auto_289585 ) ) ( not ( = ?auto_289580 ?auto_289581 ) ) ( not ( = ?auto_289580 ?auto_289582 ) ) ( not ( = ?auto_289580 ?auto_289583 ) ) ( not ( = ?auto_289580 ?auto_289584 ) ) ( not ( = ?auto_289580 ?auto_289585 ) ) ( not ( = ?auto_289581 ?auto_289582 ) ) ( not ( = ?auto_289581 ?auto_289583 ) ) ( not ( = ?auto_289581 ?auto_289584 ) ) ( not ( = ?auto_289581 ?auto_289585 ) ) ( not ( = ?auto_289582 ?auto_289583 ) ) ( not ( = ?auto_289582 ?auto_289584 ) ) ( not ( = ?auto_289582 ?auto_289585 ) ) ( not ( = ?auto_289583 ?auto_289584 ) ) ( not ( = ?auto_289583 ?auto_289585 ) ) ( not ( = ?auto_289584 ?auto_289585 ) ) ( ON ?auto_289583 ?auto_289584 ) ( ON ?auto_289582 ?auto_289583 ) ( CLEAR ?auto_289580 ) ( ON ?auto_289581 ?auto_289582 ) ( CLEAR ?auto_289581 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_289574 ?auto_289575 ?auto_289576 ?auto_289577 ?auto_289578 ?auto_289579 ?auto_289580 ?auto_289581 )
      ( MAKE-11PILE ?auto_289574 ?auto_289575 ?auto_289576 ?auto_289577 ?auto_289578 ?auto_289579 ?auto_289580 ?auto_289581 ?auto_289582 ?auto_289583 ?auto_289584 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_289597 - BLOCK
      ?auto_289598 - BLOCK
      ?auto_289599 - BLOCK
      ?auto_289600 - BLOCK
      ?auto_289601 - BLOCK
      ?auto_289602 - BLOCK
      ?auto_289603 - BLOCK
      ?auto_289604 - BLOCK
      ?auto_289605 - BLOCK
      ?auto_289606 - BLOCK
      ?auto_289607 - BLOCK
    )
    :vars
    (
      ?auto_289608 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289607 ?auto_289608 ) ( ON-TABLE ?auto_289597 ) ( ON ?auto_289598 ?auto_289597 ) ( ON ?auto_289599 ?auto_289598 ) ( ON ?auto_289600 ?auto_289599 ) ( ON ?auto_289601 ?auto_289600 ) ( ON ?auto_289602 ?auto_289601 ) ( ON ?auto_289603 ?auto_289602 ) ( not ( = ?auto_289597 ?auto_289598 ) ) ( not ( = ?auto_289597 ?auto_289599 ) ) ( not ( = ?auto_289597 ?auto_289600 ) ) ( not ( = ?auto_289597 ?auto_289601 ) ) ( not ( = ?auto_289597 ?auto_289602 ) ) ( not ( = ?auto_289597 ?auto_289603 ) ) ( not ( = ?auto_289597 ?auto_289604 ) ) ( not ( = ?auto_289597 ?auto_289605 ) ) ( not ( = ?auto_289597 ?auto_289606 ) ) ( not ( = ?auto_289597 ?auto_289607 ) ) ( not ( = ?auto_289597 ?auto_289608 ) ) ( not ( = ?auto_289598 ?auto_289599 ) ) ( not ( = ?auto_289598 ?auto_289600 ) ) ( not ( = ?auto_289598 ?auto_289601 ) ) ( not ( = ?auto_289598 ?auto_289602 ) ) ( not ( = ?auto_289598 ?auto_289603 ) ) ( not ( = ?auto_289598 ?auto_289604 ) ) ( not ( = ?auto_289598 ?auto_289605 ) ) ( not ( = ?auto_289598 ?auto_289606 ) ) ( not ( = ?auto_289598 ?auto_289607 ) ) ( not ( = ?auto_289598 ?auto_289608 ) ) ( not ( = ?auto_289599 ?auto_289600 ) ) ( not ( = ?auto_289599 ?auto_289601 ) ) ( not ( = ?auto_289599 ?auto_289602 ) ) ( not ( = ?auto_289599 ?auto_289603 ) ) ( not ( = ?auto_289599 ?auto_289604 ) ) ( not ( = ?auto_289599 ?auto_289605 ) ) ( not ( = ?auto_289599 ?auto_289606 ) ) ( not ( = ?auto_289599 ?auto_289607 ) ) ( not ( = ?auto_289599 ?auto_289608 ) ) ( not ( = ?auto_289600 ?auto_289601 ) ) ( not ( = ?auto_289600 ?auto_289602 ) ) ( not ( = ?auto_289600 ?auto_289603 ) ) ( not ( = ?auto_289600 ?auto_289604 ) ) ( not ( = ?auto_289600 ?auto_289605 ) ) ( not ( = ?auto_289600 ?auto_289606 ) ) ( not ( = ?auto_289600 ?auto_289607 ) ) ( not ( = ?auto_289600 ?auto_289608 ) ) ( not ( = ?auto_289601 ?auto_289602 ) ) ( not ( = ?auto_289601 ?auto_289603 ) ) ( not ( = ?auto_289601 ?auto_289604 ) ) ( not ( = ?auto_289601 ?auto_289605 ) ) ( not ( = ?auto_289601 ?auto_289606 ) ) ( not ( = ?auto_289601 ?auto_289607 ) ) ( not ( = ?auto_289601 ?auto_289608 ) ) ( not ( = ?auto_289602 ?auto_289603 ) ) ( not ( = ?auto_289602 ?auto_289604 ) ) ( not ( = ?auto_289602 ?auto_289605 ) ) ( not ( = ?auto_289602 ?auto_289606 ) ) ( not ( = ?auto_289602 ?auto_289607 ) ) ( not ( = ?auto_289602 ?auto_289608 ) ) ( not ( = ?auto_289603 ?auto_289604 ) ) ( not ( = ?auto_289603 ?auto_289605 ) ) ( not ( = ?auto_289603 ?auto_289606 ) ) ( not ( = ?auto_289603 ?auto_289607 ) ) ( not ( = ?auto_289603 ?auto_289608 ) ) ( not ( = ?auto_289604 ?auto_289605 ) ) ( not ( = ?auto_289604 ?auto_289606 ) ) ( not ( = ?auto_289604 ?auto_289607 ) ) ( not ( = ?auto_289604 ?auto_289608 ) ) ( not ( = ?auto_289605 ?auto_289606 ) ) ( not ( = ?auto_289605 ?auto_289607 ) ) ( not ( = ?auto_289605 ?auto_289608 ) ) ( not ( = ?auto_289606 ?auto_289607 ) ) ( not ( = ?auto_289606 ?auto_289608 ) ) ( not ( = ?auto_289607 ?auto_289608 ) ) ( ON ?auto_289606 ?auto_289607 ) ( ON ?auto_289605 ?auto_289606 ) ( CLEAR ?auto_289603 ) ( ON ?auto_289604 ?auto_289605 ) ( CLEAR ?auto_289604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_289597 ?auto_289598 ?auto_289599 ?auto_289600 ?auto_289601 ?auto_289602 ?auto_289603 ?auto_289604 )
      ( MAKE-11PILE ?auto_289597 ?auto_289598 ?auto_289599 ?auto_289600 ?auto_289601 ?auto_289602 ?auto_289603 ?auto_289604 ?auto_289605 ?auto_289606 ?auto_289607 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_289620 - BLOCK
      ?auto_289621 - BLOCK
      ?auto_289622 - BLOCK
      ?auto_289623 - BLOCK
      ?auto_289624 - BLOCK
      ?auto_289625 - BLOCK
      ?auto_289626 - BLOCK
      ?auto_289627 - BLOCK
      ?auto_289628 - BLOCK
      ?auto_289629 - BLOCK
      ?auto_289630 - BLOCK
    )
    :vars
    (
      ?auto_289631 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289630 ?auto_289631 ) ( ON-TABLE ?auto_289620 ) ( ON ?auto_289621 ?auto_289620 ) ( ON ?auto_289622 ?auto_289621 ) ( ON ?auto_289623 ?auto_289622 ) ( ON ?auto_289624 ?auto_289623 ) ( ON ?auto_289625 ?auto_289624 ) ( not ( = ?auto_289620 ?auto_289621 ) ) ( not ( = ?auto_289620 ?auto_289622 ) ) ( not ( = ?auto_289620 ?auto_289623 ) ) ( not ( = ?auto_289620 ?auto_289624 ) ) ( not ( = ?auto_289620 ?auto_289625 ) ) ( not ( = ?auto_289620 ?auto_289626 ) ) ( not ( = ?auto_289620 ?auto_289627 ) ) ( not ( = ?auto_289620 ?auto_289628 ) ) ( not ( = ?auto_289620 ?auto_289629 ) ) ( not ( = ?auto_289620 ?auto_289630 ) ) ( not ( = ?auto_289620 ?auto_289631 ) ) ( not ( = ?auto_289621 ?auto_289622 ) ) ( not ( = ?auto_289621 ?auto_289623 ) ) ( not ( = ?auto_289621 ?auto_289624 ) ) ( not ( = ?auto_289621 ?auto_289625 ) ) ( not ( = ?auto_289621 ?auto_289626 ) ) ( not ( = ?auto_289621 ?auto_289627 ) ) ( not ( = ?auto_289621 ?auto_289628 ) ) ( not ( = ?auto_289621 ?auto_289629 ) ) ( not ( = ?auto_289621 ?auto_289630 ) ) ( not ( = ?auto_289621 ?auto_289631 ) ) ( not ( = ?auto_289622 ?auto_289623 ) ) ( not ( = ?auto_289622 ?auto_289624 ) ) ( not ( = ?auto_289622 ?auto_289625 ) ) ( not ( = ?auto_289622 ?auto_289626 ) ) ( not ( = ?auto_289622 ?auto_289627 ) ) ( not ( = ?auto_289622 ?auto_289628 ) ) ( not ( = ?auto_289622 ?auto_289629 ) ) ( not ( = ?auto_289622 ?auto_289630 ) ) ( not ( = ?auto_289622 ?auto_289631 ) ) ( not ( = ?auto_289623 ?auto_289624 ) ) ( not ( = ?auto_289623 ?auto_289625 ) ) ( not ( = ?auto_289623 ?auto_289626 ) ) ( not ( = ?auto_289623 ?auto_289627 ) ) ( not ( = ?auto_289623 ?auto_289628 ) ) ( not ( = ?auto_289623 ?auto_289629 ) ) ( not ( = ?auto_289623 ?auto_289630 ) ) ( not ( = ?auto_289623 ?auto_289631 ) ) ( not ( = ?auto_289624 ?auto_289625 ) ) ( not ( = ?auto_289624 ?auto_289626 ) ) ( not ( = ?auto_289624 ?auto_289627 ) ) ( not ( = ?auto_289624 ?auto_289628 ) ) ( not ( = ?auto_289624 ?auto_289629 ) ) ( not ( = ?auto_289624 ?auto_289630 ) ) ( not ( = ?auto_289624 ?auto_289631 ) ) ( not ( = ?auto_289625 ?auto_289626 ) ) ( not ( = ?auto_289625 ?auto_289627 ) ) ( not ( = ?auto_289625 ?auto_289628 ) ) ( not ( = ?auto_289625 ?auto_289629 ) ) ( not ( = ?auto_289625 ?auto_289630 ) ) ( not ( = ?auto_289625 ?auto_289631 ) ) ( not ( = ?auto_289626 ?auto_289627 ) ) ( not ( = ?auto_289626 ?auto_289628 ) ) ( not ( = ?auto_289626 ?auto_289629 ) ) ( not ( = ?auto_289626 ?auto_289630 ) ) ( not ( = ?auto_289626 ?auto_289631 ) ) ( not ( = ?auto_289627 ?auto_289628 ) ) ( not ( = ?auto_289627 ?auto_289629 ) ) ( not ( = ?auto_289627 ?auto_289630 ) ) ( not ( = ?auto_289627 ?auto_289631 ) ) ( not ( = ?auto_289628 ?auto_289629 ) ) ( not ( = ?auto_289628 ?auto_289630 ) ) ( not ( = ?auto_289628 ?auto_289631 ) ) ( not ( = ?auto_289629 ?auto_289630 ) ) ( not ( = ?auto_289629 ?auto_289631 ) ) ( not ( = ?auto_289630 ?auto_289631 ) ) ( ON ?auto_289629 ?auto_289630 ) ( ON ?auto_289628 ?auto_289629 ) ( ON ?auto_289627 ?auto_289628 ) ( CLEAR ?auto_289625 ) ( ON ?auto_289626 ?auto_289627 ) ( CLEAR ?auto_289626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_289620 ?auto_289621 ?auto_289622 ?auto_289623 ?auto_289624 ?auto_289625 ?auto_289626 )
      ( MAKE-11PILE ?auto_289620 ?auto_289621 ?auto_289622 ?auto_289623 ?auto_289624 ?auto_289625 ?auto_289626 ?auto_289627 ?auto_289628 ?auto_289629 ?auto_289630 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_289643 - BLOCK
      ?auto_289644 - BLOCK
      ?auto_289645 - BLOCK
      ?auto_289646 - BLOCK
      ?auto_289647 - BLOCK
      ?auto_289648 - BLOCK
      ?auto_289649 - BLOCK
      ?auto_289650 - BLOCK
      ?auto_289651 - BLOCK
      ?auto_289652 - BLOCK
      ?auto_289653 - BLOCK
    )
    :vars
    (
      ?auto_289654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289653 ?auto_289654 ) ( ON-TABLE ?auto_289643 ) ( ON ?auto_289644 ?auto_289643 ) ( ON ?auto_289645 ?auto_289644 ) ( ON ?auto_289646 ?auto_289645 ) ( ON ?auto_289647 ?auto_289646 ) ( ON ?auto_289648 ?auto_289647 ) ( not ( = ?auto_289643 ?auto_289644 ) ) ( not ( = ?auto_289643 ?auto_289645 ) ) ( not ( = ?auto_289643 ?auto_289646 ) ) ( not ( = ?auto_289643 ?auto_289647 ) ) ( not ( = ?auto_289643 ?auto_289648 ) ) ( not ( = ?auto_289643 ?auto_289649 ) ) ( not ( = ?auto_289643 ?auto_289650 ) ) ( not ( = ?auto_289643 ?auto_289651 ) ) ( not ( = ?auto_289643 ?auto_289652 ) ) ( not ( = ?auto_289643 ?auto_289653 ) ) ( not ( = ?auto_289643 ?auto_289654 ) ) ( not ( = ?auto_289644 ?auto_289645 ) ) ( not ( = ?auto_289644 ?auto_289646 ) ) ( not ( = ?auto_289644 ?auto_289647 ) ) ( not ( = ?auto_289644 ?auto_289648 ) ) ( not ( = ?auto_289644 ?auto_289649 ) ) ( not ( = ?auto_289644 ?auto_289650 ) ) ( not ( = ?auto_289644 ?auto_289651 ) ) ( not ( = ?auto_289644 ?auto_289652 ) ) ( not ( = ?auto_289644 ?auto_289653 ) ) ( not ( = ?auto_289644 ?auto_289654 ) ) ( not ( = ?auto_289645 ?auto_289646 ) ) ( not ( = ?auto_289645 ?auto_289647 ) ) ( not ( = ?auto_289645 ?auto_289648 ) ) ( not ( = ?auto_289645 ?auto_289649 ) ) ( not ( = ?auto_289645 ?auto_289650 ) ) ( not ( = ?auto_289645 ?auto_289651 ) ) ( not ( = ?auto_289645 ?auto_289652 ) ) ( not ( = ?auto_289645 ?auto_289653 ) ) ( not ( = ?auto_289645 ?auto_289654 ) ) ( not ( = ?auto_289646 ?auto_289647 ) ) ( not ( = ?auto_289646 ?auto_289648 ) ) ( not ( = ?auto_289646 ?auto_289649 ) ) ( not ( = ?auto_289646 ?auto_289650 ) ) ( not ( = ?auto_289646 ?auto_289651 ) ) ( not ( = ?auto_289646 ?auto_289652 ) ) ( not ( = ?auto_289646 ?auto_289653 ) ) ( not ( = ?auto_289646 ?auto_289654 ) ) ( not ( = ?auto_289647 ?auto_289648 ) ) ( not ( = ?auto_289647 ?auto_289649 ) ) ( not ( = ?auto_289647 ?auto_289650 ) ) ( not ( = ?auto_289647 ?auto_289651 ) ) ( not ( = ?auto_289647 ?auto_289652 ) ) ( not ( = ?auto_289647 ?auto_289653 ) ) ( not ( = ?auto_289647 ?auto_289654 ) ) ( not ( = ?auto_289648 ?auto_289649 ) ) ( not ( = ?auto_289648 ?auto_289650 ) ) ( not ( = ?auto_289648 ?auto_289651 ) ) ( not ( = ?auto_289648 ?auto_289652 ) ) ( not ( = ?auto_289648 ?auto_289653 ) ) ( not ( = ?auto_289648 ?auto_289654 ) ) ( not ( = ?auto_289649 ?auto_289650 ) ) ( not ( = ?auto_289649 ?auto_289651 ) ) ( not ( = ?auto_289649 ?auto_289652 ) ) ( not ( = ?auto_289649 ?auto_289653 ) ) ( not ( = ?auto_289649 ?auto_289654 ) ) ( not ( = ?auto_289650 ?auto_289651 ) ) ( not ( = ?auto_289650 ?auto_289652 ) ) ( not ( = ?auto_289650 ?auto_289653 ) ) ( not ( = ?auto_289650 ?auto_289654 ) ) ( not ( = ?auto_289651 ?auto_289652 ) ) ( not ( = ?auto_289651 ?auto_289653 ) ) ( not ( = ?auto_289651 ?auto_289654 ) ) ( not ( = ?auto_289652 ?auto_289653 ) ) ( not ( = ?auto_289652 ?auto_289654 ) ) ( not ( = ?auto_289653 ?auto_289654 ) ) ( ON ?auto_289652 ?auto_289653 ) ( ON ?auto_289651 ?auto_289652 ) ( ON ?auto_289650 ?auto_289651 ) ( CLEAR ?auto_289648 ) ( ON ?auto_289649 ?auto_289650 ) ( CLEAR ?auto_289649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_289643 ?auto_289644 ?auto_289645 ?auto_289646 ?auto_289647 ?auto_289648 ?auto_289649 )
      ( MAKE-11PILE ?auto_289643 ?auto_289644 ?auto_289645 ?auto_289646 ?auto_289647 ?auto_289648 ?auto_289649 ?auto_289650 ?auto_289651 ?auto_289652 ?auto_289653 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_289666 - BLOCK
      ?auto_289667 - BLOCK
      ?auto_289668 - BLOCK
      ?auto_289669 - BLOCK
      ?auto_289670 - BLOCK
      ?auto_289671 - BLOCK
      ?auto_289672 - BLOCK
      ?auto_289673 - BLOCK
      ?auto_289674 - BLOCK
      ?auto_289675 - BLOCK
      ?auto_289676 - BLOCK
    )
    :vars
    (
      ?auto_289677 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289676 ?auto_289677 ) ( ON-TABLE ?auto_289666 ) ( ON ?auto_289667 ?auto_289666 ) ( ON ?auto_289668 ?auto_289667 ) ( ON ?auto_289669 ?auto_289668 ) ( ON ?auto_289670 ?auto_289669 ) ( not ( = ?auto_289666 ?auto_289667 ) ) ( not ( = ?auto_289666 ?auto_289668 ) ) ( not ( = ?auto_289666 ?auto_289669 ) ) ( not ( = ?auto_289666 ?auto_289670 ) ) ( not ( = ?auto_289666 ?auto_289671 ) ) ( not ( = ?auto_289666 ?auto_289672 ) ) ( not ( = ?auto_289666 ?auto_289673 ) ) ( not ( = ?auto_289666 ?auto_289674 ) ) ( not ( = ?auto_289666 ?auto_289675 ) ) ( not ( = ?auto_289666 ?auto_289676 ) ) ( not ( = ?auto_289666 ?auto_289677 ) ) ( not ( = ?auto_289667 ?auto_289668 ) ) ( not ( = ?auto_289667 ?auto_289669 ) ) ( not ( = ?auto_289667 ?auto_289670 ) ) ( not ( = ?auto_289667 ?auto_289671 ) ) ( not ( = ?auto_289667 ?auto_289672 ) ) ( not ( = ?auto_289667 ?auto_289673 ) ) ( not ( = ?auto_289667 ?auto_289674 ) ) ( not ( = ?auto_289667 ?auto_289675 ) ) ( not ( = ?auto_289667 ?auto_289676 ) ) ( not ( = ?auto_289667 ?auto_289677 ) ) ( not ( = ?auto_289668 ?auto_289669 ) ) ( not ( = ?auto_289668 ?auto_289670 ) ) ( not ( = ?auto_289668 ?auto_289671 ) ) ( not ( = ?auto_289668 ?auto_289672 ) ) ( not ( = ?auto_289668 ?auto_289673 ) ) ( not ( = ?auto_289668 ?auto_289674 ) ) ( not ( = ?auto_289668 ?auto_289675 ) ) ( not ( = ?auto_289668 ?auto_289676 ) ) ( not ( = ?auto_289668 ?auto_289677 ) ) ( not ( = ?auto_289669 ?auto_289670 ) ) ( not ( = ?auto_289669 ?auto_289671 ) ) ( not ( = ?auto_289669 ?auto_289672 ) ) ( not ( = ?auto_289669 ?auto_289673 ) ) ( not ( = ?auto_289669 ?auto_289674 ) ) ( not ( = ?auto_289669 ?auto_289675 ) ) ( not ( = ?auto_289669 ?auto_289676 ) ) ( not ( = ?auto_289669 ?auto_289677 ) ) ( not ( = ?auto_289670 ?auto_289671 ) ) ( not ( = ?auto_289670 ?auto_289672 ) ) ( not ( = ?auto_289670 ?auto_289673 ) ) ( not ( = ?auto_289670 ?auto_289674 ) ) ( not ( = ?auto_289670 ?auto_289675 ) ) ( not ( = ?auto_289670 ?auto_289676 ) ) ( not ( = ?auto_289670 ?auto_289677 ) ) ( not ( = ?auto_289671 ?auto_289672 ) ) ( not ( = ?auto_289671 ?auto_289673 ) ) ( not ( = ?auto_289671 ?auto_289674 ) ) ( not ( = ?auto_289671 ?auto_289675 ) ) ( not ( = ?auto_289671 ?auto_289676 ) ) ( not ( = ?auto_289671 ?auto_289677 ) ) ( not ( = ?auto_289672 ?auto_289673 ) ) ( not ( = ?auto_289672 ?auto_289674 ) ) ( not ( = ?auto_289672 ?auto_289675 ) ) ( not ( = ?auto_289672 ?auto_289676 ) ) ( not ( = ?auto_289672 ?auto_289677 ) ) ( not ( = ?auto_289673 ?auto_289674 ) ) ( not ( = ?auto_289673 ?auto_289675 ) ) ( not ( = ?auto_289673 ?auto_289676 ) ) ( not ( = ?auto_289673 ?auto_289677 ) ) ( not ( = ?auto_289674 ?auto_289675 ) ) ( not ( = ?auto_289674 ?auto_289676 ) ) ( not ( = ?auto_289674 ?auto_289677 ) ) ( not ( = ?auto_289675 ?auto_289676 ) ) ( not ( = ?auto_289675 ?auto_289677 ) ) ( not ( = ?auto_289676 ?auto_289677 ) ) ( ON ?auto_289675 ?auto_289676 ) ( ON ?auto_289674 ?auto_289675 ) ( ON ?auto_289673 ?auto_289674 ) ( ON ?auto_289672 ?auto_289673 ) ( CLEAR ?auto_289670 ) ( ON ?auto_289671 ?auto_289672 ) ( CLEAR ?auto_289671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_289666 ?auto_289667 ?auto_289668 ?auto_289669 ?auto_289670 ?auto_289671 )
      ( MAKE-11PILE ?auto_289666 ?auto_289667 ?auto_289668 ?auto_289669 ?auto_289670 ?auto_289671 ?auto_289672 ?auto_289673 ?auto_289674 ?auto_289675 ?auto_289676 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_289689 - BLOCK
      ?auto_289690 - BLOCK
      ?auto_289691 - BLOCK
      ?auto_289692 - BLOCK
      ?auto_289693 - BLOCK
      ?auto_289694 - BLOCK
      ?auto_289695 - BLOCK
      ?auto_289696 - BLOCK
      ?auto_289697 - BLOCK
      ?auto_289698 - BLOCK
      ?auto_289699 - BLOCK
    )
    :vars
    (
      ?auto_289700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289699 ?auto_289700 ) ( ON-TABLE ?auto_289689 ) ( ON ?auto_289690 ?auto_289689 ) ( ON ?auto_289691 ?auto_289690 ) ( ON ?auto_289692 ?auto_289691 ) ( ON ?auto_289693 ?auto_289692 ) ( not ( = ?auto_289689 ?auto_289690 ) ) ( not ( = ?auto_289689 ?auto_289691 ) ) ( not ( = ?auto_289689 ?auto_289692 ) ) ( not ( = ?auto_289689 ?auto_289693 ) ) ( not ( = ?auto_289689 ?auto_289694 ) ) ( not ( = ?auto_289689 ?auto_289695 ) ) ( not ( = ?auto_289689 ?auto_289696 ) ) ( not ( = ?auto_289689 ?auto_289697 ) ) ( not ( = ?auto_289689 ?auto_289698 ) ) ( not ( = ?auto_289689 ?auto_289699 ) ) ( not ( = ?auto_289689 ?auto_289700 ) ) ( not ( = ?auto_289690 ?auto_289691 ) ) ( not ( = ?auto_289690 ?auto_289692 ) ) ( not ( = ?auto_289690 ?auto_289693 ) ) ( not ( = ?auto_289690 ?auto_289694 ) ) ( not ( = ?auto_289690 ?auto_289695 ) ) ( not ( = ?auto_289690 ?auto_289696 ) ) ( not ( = ?auto_289690 ?auto_289697 ) ) ( not ( = ?auto_289690 ?auto_289698 ) ) ( not ( = ?auto_289690 ?auto_289699 ) ) ( not ( = ?auto_289690 ?auto_289700 ) ) ( not ( = ?auto_289691 ?auto_289692 ) ) ( not ( = ?auto_289691 ?auto_289693 ) ) ( not ( = ?auto_289691 ?auto_289694 ) ) ( not ( = ?auto_289691 ?auto_289695 ) ) ( not ( = ?auto_289691 ?auto_289696 ) ) ( not ( = ?auto_289691 ?auto_289697 ) ) ( not ( = ?auto_289691 ?auto_289698 ) ) ( not ( = ?auto_289691 ?auto_289699 ) ) ( not ( = ?auto_289691 ?auto_289700 ) ) ( not ( = ?auto_289692 ?auto_289693 ) ) ( not ( = ?auto_289692 ?auto_289694 ) ) ( not ( = ?auto_289692 ?auto_289695 ) ) ( not ( = ?auto_289692 ?auto_289696 ) ) ( not ( = ?auto_289692 ?auto_289697 ) ) ( not ( = ?auto_289692 ?auto_289698 ) ) ( not ( = ?auto_289692 ?auto_289699 ) ) ( not ( = ?auto_289692 ?auto_289700 ) ) ( not ( = ?auto_289693 ?auto_289694 ) ) ( not ( = ?auto_289693 ?auto_289695 ) ) ( not ( = ?auto_289693 ?auto_289696 ) ) ( not ( = ?auto_289693 ?auto_289697 ) ) ( not ( = ?auto_289693 ?auto_289698 ) ) ( not ( = ?auto_289693 ?auto_289699 ) ) ( not ( = ?auto_289693 ?auto_289700 ) ) ( not ( = ?auto_289694 ?auto_289695 ) ) ( not ( = ?auto_289694 ?auto_289696 ) ) ( not ( = ?auto_289694 ?auto_289697 ) ) ( not ( = ?auto_289694 ?auto_289698 ) ) ( not ( = ?auto_289694 ?auto_289699 ) ) ( not ( = ?auto_289694 ?auto_289700 ) ) ( not ( = ?auto_289695 ?auto_289696 ) ) ( not ( = ?auto_289695 ?auto_289697 ) ) ( not ( = ?auto_289695 ?auto_289698 ) ) ( not ( = ?auto_289695 ?auto_289699 ) ) ( not ( = ?auto_289695 ?auto_289700 ) ) ( not ( = ?auto_289696 ?auto_289697 ) ) ( not ( = ?auto_289696 ?auto_289698 ) ) ( not ( = ?auto_289696 ?auto_289699 ) ) ( not ( = ?auto_289696 ?auto_289700 ) ) ( not ( = ?auto_289697 ?auto_289698 ) ) ( not ( = ?auto_289697 ?auto_289699 ) ) ( not ( = ?auto_289697 ?auto_289700 ) ) ( not ( = ?auto_289698 ?auto_289699 ) ) ( not ( = ?auto_289698 ?auto_289700 ) ) ( not ( = ?auto_289699 ?auto_289700 ) ) ( ON ?auto_289698 ?auto_289699 ) ( ON ?auto_289697 ?auto_289698 ) ( ON ?auto_289696 ?auto_289697 ) ( ON ?auto_289695 ?auto_289696 ) ( CLEAR ?auto_289693 ) ( ON ?auto_289694 ?auto_289695 ) ( CLEAR ?auto_289694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_289689 ?auto_289690 ?auto_289691 ?auto_289692 ?auto_289693 ?auto_289694 )
      ( MAKE-11PILE ?auto_289689 ?auto_289690 ?auto_289691 ?auto_289692 ?auto_289693 ?auto_289694 ?auto_289695 ?auto_289696 ?auto_289697 ?auto_289698 ?auto_289699 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_289712 - BLOCK
      ?auto_289713 - BLOCK
      ?auto_289714 - BLOCK
      ?auto_289715 - BLOCK
      ?auto_289716 - BLOCK
      ?auto_289717 - BLOCK
      ?auto_289718 - BLOCK
      ?auto_289719 - BLOCK
      ?auto_289720 - BLOCK
      ?auto_289721 - BLOCK
      ?auto_289722 - BLOCK
    )
    :vars
    (
      ?auto_289723 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289722 ?auto_289723 ) ( ON-TABLE ?auto_289712 ) ( ON ?auto_289713 ?auto_289712 ) ( ON ?auto_289714 ?auto_289713 ) ( ON ?auto_289715 ?auto_289714 ) ( not ( = ?auto_289712 ?auto_289713 ) ) ( not ( = ?auto_289712 ?auto_289714 ) ) ( not ( = ?auto_289712 ?auto_289715 ) ) ( not ( = ?auto_289712 ?auto_289716 ) ) ( not ( = ?auto_289712 ?auto_289717 ) ) ( not ( = ?auto_289712 ?auto_289718 ) ) ( not ( = ?auto_289712 ?auto_289719 ) ) ( not ( = ?auto_289712 ?auto_289720 ) ) ( not ( = ?auto_289712 ?auto_289721 ) ) ( not ( = ?auto_289712 ?auto_289722 ) ) ( not ( = ?auto_289712 ?auto_289723 ) ) ( not ( = ?auto_289713 ?auto_289714 ) ) ( not ( = ?auto_289713 ?auto_289715 ) ) ( not ( = ?auto_289713 ?auto_289716 ) ) ( not ( = ?auto_289713 ?auto_289717 ) ) ( not ( = ?auto_289713 ?auto_289718 ) ) ( not ( = ?auto_289713 ?auto_289719 ) ) ( not ( = ?auto_289713 ?auto_289720 ) ) ( not ( = ?auto_289713 ?auto_289721 ) ) ( not ( = ?auto_289713 ?auto_289722 ) ) ( not ( = ?auto_289713 ?auto_289723 ) ) ( not ( = ?auto_289714 ?auto_289715 ) ) ( not ( = ?auto_289714 ?auto_289716 ) ) ( not ( = ?auto_289714 ?auto_289717 ) ) ( not ( = ?auto_289714 ?auto_289718 ) ) ( not ( = ?auto_289714 ?auto_289719 ) ) ( not ( = ?auto_289714 ?auto_289720 ) ) ( not ( = ?auto_289714 ?auto_289721 ) ) ( not ( = ?auto_289714 ?auto_289722 ) ) ( not ( = ?auto_289714 ?auto_289723 ) ) ( not ( = ?auto_289715 ?auto_289716 ) ) ( not ( = ?auto_289715 ?auto_289717 ) ) ( not ( = ?auto_289715 ?auto_289718 ) ) ( not ( = ?auto_289715 ?auto_289719 ) ) ( not ( = ?auto_289715 ?auto_289720 ) ) ( not ( = ?auto_289715 ?auto_289721 ) ) ( not ( = ?auto_289715 ?auto_289722 ) ) ( not ( = ?auto_289715 ?auto_289723 ) ) ( not ( = ?auto_289716 ?auto_289717 ) ) ( not ( = ?auto_289716 ?auto_289718 ) ) ( not ( = ?auto_289716 ?auto_289719 ) ) ( not ( = ?auto_289716 ?auto_289720 ) ) ( not ( = ?auto_289716 ?auto_289721 ) ) ( not ( = ?auto_289716 ?auto_289722 ) ) ( not ( = ?auto_289716 ?auto_289723 ) ) ( not ( = ?auto_289717 ?auto_289718 ) ) ( not ( = ?auto_289717 ?auto_289719 ) ) ( not ( = ?auto_289717 ?auto_289720 ) ) ( not ( = ?auto_289717 ?auto_289721 ) ) ( not ( = ?auto_289717 ?auto_289722 ) ) ( not ( = ?auto_289717 ?auto_289723 ) ) ( not ( = ?auto_289718 ?auto_289719 ) ) ( not ( = ?auto_289718 ?auto_289720 ) ) ( not ( = ?auto_289718 ?auto_289721 ) ) ( not ( = ?auto_289718 ?auto_289722 ) ) ( not ( = ?auto_289718 ?auto_289723 ) ) ( not ( = ?auto_289719 ?auto_289720 ) ) ( not ( = ?auto_289719 ?auto_289721 ) ) ( not ( = ?auto_289719 ?auto_289722 ) ) ( not ( = ?auto_289719 ?auto_289723 ) ) ( not ( = ?auto_289720 ?auto_289721 ) ) ( not ( = ?auto_289720 ?auto_289722 ) ) ( not ( = ?auto_289720 ?auto_289723 ) ) ( not ( = ?auto_289721 ?auto_289722 ) ) ( not ( = ?auto_289721 ?auto_289723 ) ) ( not ( = ?auto_289722 ?auto_289723 ) ) ( ON ?auto_289721 ?auto_289722 ) ( ON ?auto_289720 ?auto_289721 ) ( ON ?auto_289719 ?auto_289720 ) ( ON ?auto_289718 ?auto_289719 ) ( ON ?auto_289717 ?auto_289718 ) ( CLEAR ?auto_289715 ) ( ON ?auto_289716 ?auto_289717 ) ( CLEAR ?auto_289716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_289712 ?auto_289713 ?auto_289714 ?auto_289715 ?auto_289716 )
      ( MAKE-11PILE ?auto_289712 ?auto_289713 ?auto_289714 ?auto_289715 ?auto_289716 ?auto_289717 ?auto_289718 ?auto_289719 ?auto_289720 ?auto_289721 ?auto_289722 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_289735 - BLOCK
      ?auto_289736 - BLOCK
      ?auto_289737 - BLOCK
      ?auto_289738 - BLOCK
      ?auto_289739 - BLOCK
      ?auto_289740 - BLOCK
      ?auto_289741 - BLOCK
      ?auto_289742 - BLOCK
      ?auto_289743 - BLOCK
      ?auto_289744 - BLOCK
      ?auto_289745 - BLOCK
    )
    :vars
    (
      ?auto_289746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289745 ?auto_289746 ) ( ON-TABLE ?auto_289735 ) ( ON ?auto_289736 ?auto_289735 ) ( ON ?auto_289737 ?auto_289736 ) ( ON ?auto_289738 ?auto_289737 ) ( not ( = ?auto_289735 ?auto_289736 ) ) ( not ( = ?auto_289735 ?auto_289737 ) ) ( not ( = ?auto_289735 ?auto_289738 ) ) ( not ( = ?auto_289735 ?auto_289739 ) ) ( not ( = ?auto_289735 ?auto_289740 ) ) ( not ( = ?auto_289735 ?auto_289741 ) ) ( not ( = ?auto_289735 ?auto_289742 ) ) ( not ( = ?auto_289735 ?auto_289743 ) ) ( not ( = ?auto_289735 ?auto_289744 ) ) ( not ( = ?auto_289735 ?auto_289745 ) ) ( not ( = ?auto_289735 ?auto_289746 ) ) ( not ( = ?auto_289736 ?auto_289737 ) ) ( not ( = ?auto_289736 ?auto_289738 ) ) ( not ( = ?auto_289736 ?auto_289739 ) ) ( not ( = ?auto_289736 ?auto_289740 ) ) ( not ( = ?auto_289736 ?auto_289741 ) ) ( not ( = ?auto_289736 ?auto_289742 ) ) ( not ( = ?auto_289736 ?auto_289743 ) ) ( not ( = ?auto_289736 ?auto_289744 ) ) ( not ( = ?auto_289736 ?auto_289745 ) ) ( not ( = ?auto_289736 ?auto_289746 ) ) ( not ( = ?auto_289737 ?auto_289738 ) ) ( not ( = ?auto_289737 ?auto_289739 ) ) ( not ( = ?auto_289737 ?auto_289740 ) ) ( not ( = ?auto_289737 ?auto_289741 ) ) ( not ( = ?auto_289737 ?auto_289742 ) ) ( not ( = ?auto_289737 ?auto_289743 ) ) ( not ( = ?auto_289737 ?auto_289744 ) ) ( not ( = ?auto_289737 ?auto_289745 ) ) ( not ( = ?auto_289737 ?auto_289746 ) ) ( not ( = ?auto_289738 ?auto_289739 ) ) ( not ( = ?auto_289738 ?auto_289740 ) ) ( not ( = ?auto_289738 ?auto_289741 ) ) ( not ( = ?auto_289738 ?auto_289742 ) ) ( not ( = ?auto_289738 ?auto_289743 ) ) ( not ( = ?auto_289738 ?auto_289744 ) ) ( not ( = ?auto_289738 ?auto_289745 ) ) ( not ( = ?auto_289738 ?auto_289746 ) ) ( not ( = ?auto_289739 ?auto_289740 ) ) ( not ( = ?auto_289739 ?auto_289741 ) ) ( not ( = ?auto_289739 ?auto_289742 ) ) ( not ( = ?auto_289739 ?auto_289743 ) ) ( not ( = ?auto_289739 ?auto_289744 ) ) ( not ( = ?auto_289739 ?auto_289745 ) ) ( not ( = ?auto_289739 ?auto_289746 ) ) ( not ( = ?auto_289740 ?auto_289741 ) ) ( not ( = ?auto_289740 ?auto_289742 ) ) ( not ( = ?auto_289740 ?auto_289743 ) ) ( not ( = ?auto_289740 ?auto_289744 ) ) ( not ( = ?auto_289740 ?auto_289745 ) ) ( not ( = ?auto_289740 ?auto_289746 ) ) ( not ( = ?auto_289741 ?auto_289742 ) ) ( not ( = ?auto_289741 ?auto_289743 ) ) ( not ( = ?auto_289741 ?auto_289744 ) ) ( not ( = ?auto_289741 ?auto_289745 ) ) ( not ( = ?auto_289741 ?auto_289746 ) ) ( not ( = ?auto_289742 ?auto_289743 ) ) ( not ( = ?auto_289742 ?auto_289744 ) ) ( not ( = ?auto_289742 ?auto_289745 ) ) ( not ( = ?auto_289742 ?auto_289746 ) ) ( not ( = ?auto_289743 ?auto_289744 ) ) ( not ( = ?auto_289743 ?auto_289745 ) ) ( not ( = ?auto_289743 ?auto_289746 ) ) ( not ( = ?auto_289744 ?auto_289745 ) ) ( not ( = ?auto_289744 ?auto_289746 ) ) ( not ( = ?auto_289745 ?auto_289746 ) ) ( ON ?auto_289744 ?auto_289745 ) ( ON ?auto_289743 ?auto_289744 ) ( ON ?auto_289742 ?auto_289743 ) ( ON ?auto_289741 ?auto_289742 ) ( ON ?auto_289740 ?auto_289741 ) ( CLEAR ?auto_289738 ) ( ON ?auto_289739 ?auto_289740 ) ( CLEAR ?auto_289739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_289735 ?auto_289736 ?auto_289737 ?auto_289738 ?auto_289739 )
      ( MAKE-11PILE ?auto_289735 ?auto_289736 ?auto_289737 ?auto_289738 ?auto_289739 ?auto_289740 ?auto_289741 ?auto_289742 ?auto_289743 ?auto_289744 ?auto_289745 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_289758 - BLOCK
      ?auto_289759 - BLOCK
      ?auto_289760 - BLOCK
      ?auto_289761 - BLOCK
      ?auto_289762 - BLOCK
      ?auto_289763 - BLOCK
      ?auto_289764 - BLOCK
      ?auto_289765 - BLOCK
      ?auto_289766 - BLOCK
      ?auto_289767 - BLOCK
      ?auto_289768 - BLOCK
    )
    :vars
    (
      ?auto_289769 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289768 ?auto_289769 ) ( ON-TABLE ?auto_289758 ) ( ON ?auto_289759 ?auto_289758 ) ( ON ?auto_289760 ?auto_289759 ) ( not ( = ?auto_289758 ?auto_289759 ) ) ( not ( = ?auto_289758 ?auto_289760 ) ) ( not ( = ?auto_289758 ?auto_289761 ) ) ( not ( = ?auto_289758 ?auto_289762 ) ) ( not ( = ?auto_289758 ?auto_289763 ) ) ( not ( = ?auto_289758 ?auto_289764 ) ) ( not ( = ?auto_289758 ?auto_289765 ) ) ( not ( = ?auto_289758 ?auto_289766 ) ) ( not ( = ?auto_289758 ?auto_289767 ) ) ( not ( = ?auto_289758 ?auto_289768 ) ) ( not ( = ?auto_289758 ?auto_289769 ) ) ( not ( = ?auto_289759 ?auto_289760 ) ) ( not ( = ?auto_289759 ?auto_289761 ) ) ( not ( = ?auto_289759 ?auto_289762 ) ) ( not ( = ?auto_289759 ?auto_289763 ) ) ( not ( = ?auto_289759 ?auto_289764 ) ) ( not ( = ?auto_289759 ?auto_289765 ) ) ( not ( = ?auto_289759 ?auto_289766 ) ) ( not ( = ?auto_289759 ?auto_289767 ) ) ( not ( = ?auto_289759 ?auto_289768 ) ) ( not ( = ?auto_289759 ?auto_289769 ) ) ( not ( = ?auto_289760 ?auto_289761 ) ) ( not ( = ?auto_289760 ?auto_289762 ) ) ( not ( = ?auto_289760 ?auto_289763 ) ) ( not ( = ?auto_289760 ?auto_289764 ) ) ( not ( = ?auto_289760 ?auto_289765 ) ) ( not ( = ?auto_289760 ?auto_289766 ) ) ( not ( = ?auto_289760 ?auto_289767 ) ) ( not ( = ?auto_289760 ?auto_289768 ) ) ( not ( = ?auto_289760 ?auto_289769 ) ) ( not ( = ?auto_289761 ?auto_289762 ) ) ( not ( = ?auto_289761 ?auto_289763 ) ) ( not ( = ?auto_289761 ?auto_289764 ) ) ( not ( = ?auto_289761 ?auto_289765 ) ) ( not ( = ?auto_289761 ?auto_289766 ) ) ( not ( = ?auto_289761 ?auto_289767 ) ) ( not ( = ?auto_289761 ?auto_289768 ) ) ( not ( = ?auto_289761 ?auto_289769 ) ) ( not ( = ?auto_289762 ?auto_289763 ) ) ( not ( = ?auto_289762 ?auto_289764 ) ) ( not ( = ?auto_289762 ?auto_289765 ) ) ( not ( = ?auto_289762 ?auto_289766 ) ) ( not ( = ?auto_289762 ?auto_289767 ) ) ( not ( = ?auto_289762 ?auto_289768 ) ) ( not ( = ?auto_289762 ?auto_289769 ) ) ( not ( = ?auto_289763 ?auto_289764 ) ) ( not ( = ?auto_289763 ?auto_289765 ) ) ( not ( = ?auto_289763 ?auto_289766 ) ) ( not ( = ?auto_289763 ?auto_289767 ) ) ( not ( = ?auto_289763 ?auto_289768 ) ) ( not ( = ?auto_289763 ?auto_289769 ) ) ( not ( = ?auto_289764 ?auto_289765 ) ) ( not ( = ?auto_289764 ?auto_289766 ) ) ( not ( = ?auto_289764 ?auto_289767 ) ) ( not ( = ?auto_289764 ?auto_289768 ) ) ( not ( = ?auto_289764 ?auto_289769 ) ) ( not ( = ?auto_289765 ?auto_289766 ) ) ( not ( = ?auto_289765 ?auto_289767 ) ) ( not ( = ?auto_289765 ?auto_289768 ) ) ( not ( = ?auto_289765 ?auto_289769 ) ) ( not ( = ?auto_289766 ?auto_289767 ) ) ( not ( = ?auto_289766 ?auto_289768 ) ) ( not ( = ?auto_289766 ?auto_289769 ) ) ( not ( = ?auto_289767 ?auto_289768 ) ) ( not ( = ?auto_289767 ?auto_289769 ) ) ( not ( = ?auto_289768 ?auto_289769 ) ) ( ON ?auto_289767 ?auto_289768 ) ( ON ?auto_289766 ?auto_289767 ) ( ON ?auto_289765 ?auto_289766 ) ( ON ?auto_289764 ?auto_289765 ) ( ON ?auto_289763 ?auto_289764 ) ( ON ?auto_289762 ?auto_289763 ) ( CLEAR ?auto_289760 ) ( ON ?auto_289761 ?auto_289762 ) ( CLEAR ?auto_289761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_289758 ?auto_289759 ?auto_289760 ?auto_289761 )
      ( MAKE-11PILE ?auto_289758 ?auto_289759 ?auto_289760 ?auto_289761 ?auto_289762 ?auto_289763 ?auto_289764 ?auto_289765 ?auto_289766 ?auto_289767 ?auto_289768 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_289781 - BLOCK
      ?auto_289782 - BLOCK
      ?auto_289783 - BLOCK
      ?auto_289784 - BLOCK
      ?auto_289785 - BLOCK
      ?auto_289786 - BLOCK
      ?auto_289787 - BLOCK
      ?auto_289788 - BLOCK
      ?auto_289789 - BLOCK
      ?auto_289790 - BLOCK
      ?auto_289791 - BLOCK
    )
    :vars
    (
      ?auto_289792 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289791 ?auto_289792 ) ( ON-TABLE ?auto_289781 ) ( ON ?auto_289782 ?auto_289781 ) ( ON ?auto_289783 ?auto_289782 ) ( not ( = ?auto_289781 ?auto_289782 ) ) ( not ( = ?auto_289781 ?auto_289783 ) ) ( not ( = ?auto_289781 ?auto_289784 ) ) ( not ( = ?auto_289781 ?auto_289785 ) ) ( not ( = ?auto_289781 ?auto_289786 ) ) ( not ( = ?auto_289781 ?auto_289787 ) ) ( not ( = ?auto_289781 ?auto_289788 ) ) ( not ( = ?auto_289781 ?auto_289789 ) ) ( not ( = ?auto_289781 ?auto_289790 ) ) ( not ( = ?auto_289781 ?auto_289791 ) ) ( not ( = ?auto_289781 ?auto_289792 ) ) ( not ( = ?auto_289782 ?auto_289783 ) ) ( not ( = ?auto_289782 ?auto_289784 ) ) ( not ( = ?auto_289782 ?auto_289785 ) ) ( not ( = ?auto_289782 ?auto_289786 ) ) ( not ( = ?auto_289782 ?auto_289787 ) ) ( not ( = ?auto_289782 ?auto_289788 ) ) ( not ( = ?auto_289782 ?auto_289789 ) ) ( not ( = ?auto_289782 ?auto_289790 ) ) ( not ( = ?auto_289782 ?auto_289791 ) ) ( not ( = ?auto_289782 ?auto_289792 ) ) ( not ( = ?auto_289783 ?auto_289784 ) ) ( not ( = ?auto_289783 ?auto_289785 ) ) ( not ( = ?auto_289783 ?auto_289786 ) ) ( not ( = ?auto_289783 ?auto_289787 ) ) ( not ( = ?auto_289783 ?auto_289788 ) ) ( not ( = ?auto_289783 ?auto_289789 ) ) ( not ( = ?auto_289783 ?auto_289790 ) ) ( not ( = ?auto_289783 ?auto_289791 ) ) ( not ( = ?auto_289783 ?auto_289792 ) ) ( not ( = ?auto_289784 ?auto_289785 ) ) ( not ( = ?auto_289784 ?auto_289786 ) ) ( not ( = ?auto_289784 ?auto_289787 ) ) ( not ( = ?auto_289784 ?auto_289788 ) ) ( not ( = ?auto_289784 ?auto_289789 ) ) ( not ( = ?auto_289784 ?auto_289790 ) ) ( not ( = ?auto_289784 ?auto_289791 ) ) ( not ( = ?auto_289784 ?auto_289792 ) ) ( not ( = ?auto_289785 ?auto_289786 ) ) ( not ( = ?auto_289785 ?auto_289787 ) ) ( not ( = ?auto_289785 ?auto_289788 ) ) ( not ( = ?auto_289785 ?auto_289789 ) ) ( not ( = ?auto_289785 ?auto_289790 ) ) ( not ( = ?auto_289785 ?auto_289791 ) ) ( not ( = ?auto_289785 ?auto_289792 ) ) ( not ( = ?auto_289786 ?auto_289787 ) ) ( not ( = ?auto_289786 ?auto_289788 ) ) ( not ( = ?auto_289786 ?auto_289789 ) ) ( not ( = ?auto_289786 ?auto_289790 ) ) ( not ( = ?auto_289786 ?auto_289791 ) ) ( not ( = ?auto_289786 ?auto_289792 ) ) ( not ( = ?auto_289787 ?auto_289788 ) ) ( not ( = ?auto_289787 ?auto_289789 ) ) ( not ( = ?auto_289787 ?auto_289790 ) ) ( not ( = ?auto_289787 ?auto_289791 ) ) ( not ( = ?auto_289787 ?auto_289792 ) ) ( not ( = ?auto_289788 ?auto_289789 ) ) ( not ( = ?auto_289788 ?auto_289790 ) ) ( not ( = ?auto_289788 ?auto_289791 ) ) ( not ( = ?auto_289788 ?auto_289792 ) ) ( not ( = ?auto_289789 ?auto_289790 ) ) ( not ( = ?auto_289789 ?auto_289791 ) ) ( not ( = ?auto_289789 ?auto_289792 ) ) ( not ( = ?auto_289790 ?auto_289791 ) ) ( not ( = ?auto_289790 ?auto_289792 ) ) ( not ( = ?auto_289791 ?auto_289792 ) ) ( ON ?auto_289790 ?auto_289791 ) ( ON ?auto_289789 ?auto_289790 ) ( ON ?auto_289788 ?auto_289789 ) ( ON ?auto_289787 ?auto_289788 ) ( ON ?auto_289786 ?auto_289787 ) ( ON ?auto_289785 ?auto_289786 ) ( CLEAR ?auto_289783 ) ( ON ?auto_289784 ?auto_289785 ) ( CLEAR ?auto_289784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_289781 ?auto_289782 ?auto_289783 ?auto_289784 )
      ( MAKE-11PILE ?auto_289781 ?auto_289782 ?auto_289783 ?auto_289784 ?auto_289785 ?auto_289786 ?auto_289787 ?auto_289788 ?auto_289789 ?auto_289790 ?auto_289791 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_289804 - BLOCK
      ?auto_289805 - BLOCK
      ?auto_289806 - BLOCK
      ?auto_289807 - BLOCK
      ?auto_289808 - BLOCK
      ?auto_289809 - BLOCK
      ?auto_289810 - BLOCK
      ?auto_289811 - BLOCK
      ?auto_289812 - BLOCK
      ?auto_289813 - BLOCK
      ?auto_289814 - BLOCK
    )
    :vars
    (
      ?auto_289815 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289814 ?auto_289815 ) ( ON-TABLE ?auto_289804 ) ( ON ?auto_289805 ?auto_289804 ) ( not ( = ?auto_289804 ?auto_289805 ) ) ( not ( = ?auto_289804 ?auto_289806 ) ) ( not ( = ?auto_289804 ?auto_289807 ) ) ( not ( = ?auto_289804 ?auto_289808 ) ) ( not ( = ?auto_289804 ?auto_289809 ) ) ( not ( = ?auto_289804 ?auto_289810 ) ) ( not ( = ?auto_289804 ?auto_289811 ) ) ( not ( = ?auto_289804 ?auto_289812 ) ) ( not ( = ?auto_289804 ?auto_289813 ) ) ( not ( = ?auto_289804 ?auto_289814 ) ) ( not ( = ?auto_289804 ?auto_289815 ) ) ( not ( = ?auto_289805 ?auto_289806 ) ) ( not ( = ?auto_289805 ?auto_289807 ) ) ( not ( = ?auto_289805 ?auto_289808 ) ) ( not ( = ?auto_289805 ?auto_289809 ) ) ( not ( = ?auto_289805 ?auto_289810 ) ) ( not ( = ?auto_289805 ?auto_289811 ) ) ( not ( = ?auto_289805 ?auto_289812 ) ) ( not ( = ?auto_289805 ?auto_289813 ) ) ( not ( = ?auto_289805 ?auto_289814 ) ) ( not ( = ?auto_289805 ?auto_289815 ) ) ( not ( = ?auto_289806 ?auto_289807 ) ) ( not ( = ?auto_289806 ?auto_289808 ) ) ( not ( = ?auto_289806 ?auto_289809 ) ) ( not ( = ?auto_289806 ?auto_289810 ) ) ( not ( = ?auto_289806 ?auto_289811 ) ) ( not ( = ?auto_289806 ?auto_289812 ) ) ( not ( = ?auto_289806 ?auto_289813 ) ) ( not ( = ?auto_289806 ?auto_289814 ) ) ( not ( = ?auto_289806 ?auto_289815 ) ) ( not ( = ?auto_289807 ?auto_289808 ) ) ( not ( = ?auto_289807 ?auto_289809 ) ) ( not ( = ?auto_289807 ?auto_289810 ) ) ( not ( = ?auto_289807 ?auto_289811 ) ) ( not ( = ?auto_289807 ?auto_289812 ) ) ( not ( = ?auto_289807 ?auto_289813 ) ) ( not ( = ?auto_289807 ?auto_289814 ) ) ( not ( = ?auto_289807 ?auto_289815 ) ) ( not ( = ?auto_289808 ?auto_289809 ) ) ( not ( = ?auto_289808 ?auto_289810 ) ) ( not ( = ?auto_289808 ?auto_289811 ) ) ( not ( = ?auto_289808 ?auto_289812 ) ) ( not ( = ?auto_289808 ?auto_289813 ) ) ( not ( = ?auto_289808 ?auto_289814 ) ) ( not ( = ?auto_289808 ?auto_289815 ) ) ( not ( = ?auto_289809 ?auto_289810 ) ) ( not ( = ?auto_289809 ?auto_289811 ) ) ( not ( = ?auto_289809 ?auto_289812 ) ) ( not ( = ?auto_289809 ?auto_289813 ) ) ( not ( = ?auto_289809 ?auto_289814 ) ) ( not ( = ?auto_289809 ?auto_289815 ) ) ( not ( = ?auto_289810 ?auto_289811 ) ) ( not ( = ?auto_289810 ?auto_289812 ) ) ( not ( = ?auto_289810 ?auto_289813 ) ) ( not ( = ?auto_289810 ?auto_289814 ) ) ( not ( = ?auto_289810 ?auto_289815 ) ) ( not ( = ?auto_289811 ?auto_289812 ) ) ( not ( = ?auto_289811 ?auto_289813 ) ) ( not ( = ?auto_289811 ?auto_289814 ) ) ( not ( = ?auto_289811 ?auto_289815 ) ) ( not ( = ?auto_289812 ?auto_289813 ) ) ( not ( = ?auto_289812 ?auto_289814 ) ) ( not ( = ?auto_289812 ?auto_289815 ) ) ( not ( = ?auto_289813 ?auto_289814 ) ) ( not ( = ?auto_289813 ?auto_289815 ) ) ( not ( = ?auto_289814 ?auto_289815 ) ) ( ON ?auto_289813 ?auto_289814 ) ( ON ?auto_289812 ?auto_289813 ) ( ON ?auto_289811 ?auto_289812 ) ( ON ?auto_289810 ?auto_289811 ) ( ON ?auto_289809 ?auto_289810 ) ( ON ?auto_289808 ?auto_289809 ) ( ON ?auto_289807 ?auto_289808 ) ( CLEAR ?auto_289805 ) ( ON ?auto_289806 ?auto_289807 ) ( CLEAR ?auto_289806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_289804 ?auto_289805 ?auto_289806 )
      ( MAKE-11PILE ?auto_289804 ?auto_289805 ?auto_289806 ?auto_289807 ?auto_289808 ?auto_289809 ?auto_289810 ?auto_289811 ?auto_289812 ?auto_289813 ?auto_289814 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_289827 - BLOCK
      ?auto_289828 - BLOCK
      ?auto_289829 - BLOCK
      ?auto_289830 - BLOCK
      ?auto_289831 - BLOCK
      ?auto_289832 - BLOCK
      ?auto_289833 - BLOCK
      ?auto_289834 - BLOCK
      ?auto_289835 - BLOCK
      ?auto_289836 - BLOCK
      ?auto_289837 - BLOCK
    )
    :vars
    (
      ?auto_289838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289837 ?auto_289838 ) ( ON-TABLE ?auto_289827 ) ( ON ?auto_289828 ?auto_289827 ) ( not ( = ?auto_289827 ?auto_289828 ) ) ( not ( = ?auto_289827 ?auto_289829 ) ) ( not ( = ?auto_289827 ?auto_289830 ) ) ( not ( = ?auto_289827 ?auto_289831 ) ) ( not ( = ?auto_289827 ?auto_289832 ) ) ( not ( = ?auto_289827 ?auto_289833 ) ) ( not ( = ?auto_289827 ?auto_289834 ) ) ( not ( = ?auto_289827 ?auto_289835 ) ) ( not ( = ?auto_289827 ?auto_289836 ) ) ( not ( = ?auto_289827 ?auto_289837 ) ) ( not ( = ?auto_289827 ?auto_289838 ) ) ( not ( = ?auto_289828 ?auto_289829 ) ) ( not ( = ?auto_289828 ?auto_289830 ) ) ( not ( = ?auto_289828 ?auto_289831 ) ) ( not ( = ?auto_289828 ?auto_289832 ) ) ( not ( = ?auto_289828 ?auto_289833 ) ) ( not ( = ?auto_289828 ?auto_289834 ) ) ( not ( = ?auto_289828 ?auto_289835 ) ) ( not ( = ?auto_289828 ?auto_289836 ) ) ( not ( = ?auto_289828 ?auto_289837 ) ) ( not ( = ?auto_289828 ?auto_289838 ) ) ( not ( = ?auto_289829 ?auto_289830 ) ) ( not ( = ?auto_289829 ?auto_289831 ) ) ( not ( = ?auto_289829 ?auto_289832 ) ) ( not ( = ?auto_289829 ?auto_289833 ) ) ( not ( = ?auto_289829 ?auto_289834 ) ) ( not ( = ?auto_289829 ?auto_289835 ) ) ( not ( = ?auto_289829 ?auto_289836 ) ) ( not ( = ?auto_289829 ?auto_289837 ) ) ( not ( = ?auto_289829 ?auto_289838 ) ) ( not ( = ?auto_289830 ?auto_289831 ) ) ( not ( = ?auto_289830 ?auto_289832 ) ) ( not ( = ?auto_289830 ?auto_289833 ) ) ( not ( = ?auto_289830 ?auto_289834 ) ) ( not ( = ?auto_289830 ?auto_289835 ) ) ( not ( = ?auto_289830 ?auto_289836 ) ) ( not ( = ?auto_289830 ?auto_289837 ) ) ( not ( = ?auto_289830 ?auto_289838 ) ) ( not ( = ?auto_289831 ?auto_289832 ) ) ( not ( = ?auto_289831 ?auto_289833 ) ) ( not ( = ?auto_289831 ?auto_289834 ) ) ( not ( = ?auto_289831 ?auto_289835 ) ) ( not ( = ?auto_289831 ?auto_289836 ) ) ( not ( = ?auto_289831 ?auto_289837 ) ) ( not ( = ?auto_289831 ?auto_289838 ) ) ( not ( = ?auto_289832 ?auto_289833 ) ) ( not ( = ?auto_289832 ?auto_289834 ) ) ( not ( = ?auto_289832 ?auto_289835 ) ) ( not ( = ?auto_289832 ?auto_289836 ) ) ( not ( = ?auto_289832 ?auto_289837 ) ) ( not ( = ?auto_289832 ?auto_289838 ) ) ( not ( = ?auto_289833 ?auto_289834 ) ) ( not ( = ?auto_289833 ?auto_289835 ) ) ( not ( = ?auto_289833 ?auto_289836 ) ) ( not ( = ?auto_289833 ?auto_289837 ) ) ( not ( = ?auto_289833 ?auto_289838 ) ) ( not ( = ?auto_289834 ?auto_289835 ) ) ( not ( = ?auto_289834 ?auto_289836 ) ) ( not ( = ?auto_289834 ?auto_289837 ) ) ( not ( = ?auto_289834 ?auto_289838 ) ) ( not ( = ?auto_289835 ?auto_289836 ) ) ( not ( = ?auto_289835 ?auto_289837 ) ) ( not ( = ?auto_289835 ?auto_289838 ) ) ( not ( = ?auto_289836 ?auto_289837 ) ) ( not ( = ?auto_289836 ?auto_289838 ) ) ( not ( = ?auto_289837 ?auto_289838 ) ) ( ON ?auto_289836 ?auto_289837 ) ( ON ?auto_289835 ?auto_289836 ) ( ON ?auto_289834 ?auto_289835 ) ( ON ?auto_289833 ?auto_289834 ) ( ON ?auto_289832 ?auto_289833 ) ( ON ?auto_289831 ?auto_289832 ) ( ON ?auto_289830 ?auto_289831 ) ( CLEAR ?auto_289828 ) ( ON ?auto_289829 ?auto_289830 ) ( CLEAR ?auto_289829 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_289827 ?auto_289828 ?auto_289829 )
      ( MAKE-11PILE ?auto_289827 ?auto_289828 ?auto_289829 ?auto_289830 ?auto_289831 ?auto_289832 ?auto_289833 ?auto_289834 ?auto_289835 ?auto_289836 ?auto_289837 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_289850 - BLOCK
      ?auto_289851 - BLOCK
      ?auto_289852 - BLOCK
      ?auto_289853 - BLOCK
      ?auto_289854 - BLOCK
      ?auto_289855 - BLOCK
      ?auto_289856 - BLOCK
      ?auto_289857 - BLOCK
      ?auto_289858 - BLOCK
      ?auto_289859 - BLOCK
      ?auto_289860 - BLOCK
    )
    :vars
    (
      ?auto_289861 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289860 ?auto_289861 ) ( ON-TABLE ?auto_289850 ) ( not ( = ?auto_289850 ?auto_289851 ) ) ( not ( = ?auto_289850 ?auto_289852 ) ) ( not ( = ?auto_289850 ?auto_289853 ) ) ( not ( = ?auto_289850 ?auto_289854 ) ) ( not ( = ?auto_289850 ?auto_289855 ) ) ( not ( = ?auto_289850 ?auto_289856 ) ) ( not ( = ?auto_289850 ?auto_289857 ) ) ( not ( = ?auto_289850 ?auto_289858 ) ) ( not ( = ?auto_289850 ?auto_289859 ) ) ( not ( = ?auto_289850 ?auto_289860 ) ) ( not ( = ?auto_289850 ?auto_289861 ) ) ( not ( = ?auto_289851 ?auto_289852 ) ) ( not ( = ?auto_289851 ?auto_289853 ) ) ( not ( = ?auto_289851 ?auto_289854 ) ) ( not ( = ?auto_289851 ?auto_289855 ) ) ( not ( = ?auto_289851 ?auto_289856 ) ) ( not ( = ?auto_289851 ?auto_289857 ) ) ( not ( = ?auto_289851 ?auto_289858 ) ) ( not ( = ?auto_289851 ?auto_289859 ) ) ( not ( = ?auto_289851 ?auto_289860 ) ) ( not ( = ?auto_289851 ?auto_289861 ) ) ( not ( = ?auto_289852 ?auto_289853 ) ) ( not ( = ?auto_289852 ?auto_289854 ) ) ( not ( = ?auto_289852 ?auto_289855 ) ) ( not ( = ?auto_289852 ?auto_289856 ) ) ( not ( = ?auto_289852 ?auto_289857 ) ) ( not ( = ?auto_289852 ?auto_289858 ) ) ( not ( = ?auto_289852 ?auto_289859 ) ) ( not ( = ?auto_289852 ?auto_289860 ) ) ( not ( = ?auto_289852 ?auto_289861 ) ) ( not ( = ?auto_289853 ?auto_289854 ) ) ( not ( = ?auto_289853 ?auto_289855 ) ) ( not ( = ?auto_289853 ?auto_289856 ) ) ( not ( = ?auto_289853 ?auto_289857 ) ) ( not ( = ?auto_289853 ?auto_289858 ) ) ( not ( = ?auto_289853 ?auto_289859 ) ) ( not ( = ?auto_289853 ?auto_289860 ) ) ( not ( = ?auto_289853 ?auto_289861 ) ) ( not ( = ?auto_289854 ?auto_289855 ) ) ( not ( = ?auto_289854 ?auto_289856 ) ) ( not ( = ?auto_289854 ?auto_289857 ) ) ( not ( = ?auto_289854 ?auto_289858 ) ) ( not ( = ?auto_289854 ?auto_289859 ) ) ( not ( = ?auto_289854 ?auto_289860 ) ) ( not ( = ?auto_289854 ?auto_289861 ) ) ( not ( = ?auto_289855 ?auto_289856 ) ) ( not ( = ?auto_289855 ?auto_289857 ) ) ( not ( = ?auto_289855 ?auto_289858 ) ) ( not ( = ?auto_289855 ?auto_289859 ) ) ( not ( = ?auto_289855 ?auto_289860 ) ) ( not ( = ?auto_289855 ?auto_289861 ) ) ( not ( = ?auto_289856 ?auto_289857 ) ) ( not ( = ?auto_289856 ?auto_289858 ) ) ( not ( = ?auto_289856 ?auto_289859 ) ) ( not ( = ?auto_289856 ?auto_289860 ) ) ( not ( = ?auto_289856 ?auto_289861 ) ) ( not ( = ?auto_289857 ?auto_289858 ) ) ( not ( = ?auto_289857 ?auto_289859 ) ) ( not ( = ?auto_289857 ?auto_289860 ) ) ( not ( = ?auto_289857 ?auto_289861 ) ) ( not ( = ?auto_289858 ?auto_289859 ) ) ( not ( = ?auto_289858 ?auto_289860 ) ) ( not ( = ?auto_289858 ?auto_289861 ) ) ( not ( = ?auto_289859 ?auto_289860 ) ) ( not ( = ?auto_289859 ?auto_289861 ) ) ( not ( = ?auto_289860 ?auto_289861 ) ) ( ON ?auto_289859 ?auto_289860 ) ( ON ?auto_289858 ?auto_289859 ) ( ON ?auto_289857 ?auto_289858 ) ( ON ?auto_289856 ?auto_289857 ) ( ON ?auto_289855 ?auto_289856 ) ( ON ?auto_289854 ?auto_289855 ) ( ON ?auto_289853 ?auto_289854 ) ( ON ?auto_289852 ?auto_289853 ) ( CLEAR ?auto_289850 ) ( ON ?auto_289851 ?auto_289852 ) ( CLEAR ?auto_289851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_289850 ?auto_289851 )
      ( MAKE-11PILE ?auto_289850 ?auto_289851 ?auto_289852 ?auto_289853 ?auto_289854 ?auto_289855 ?auto_289856 ?auto_289857 ?auto_289858 ?auto_289859 ?auto_289860 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_289873 - BLOCK
      ?auto_289874 - BLOCK
      ?auto_289875 - BLOCK
      ?auto_289876 - BLOCK
      ?auto_289877 - BLOCK
      ?auto_289878 - BLOCK
      ?auto_289879 - BLOCK
      ?auto_289880 - BLOCK
      ?auto_289881 - BLOCK
      ?auto_289882 - BLOCK
      ?auto_289883 - BLOCK
    )
    :vars
    (
      ?auto_289884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289883 ?auto_289884 ) ( ON-TABLE ?auto_289873 ) ( not ( = ?auto_289873 ?auto_289874 ) ) ( not ( = ?auto_289873 ?auto_289875 ) ) ( not ( = ?auto_289873 ?auto_289876 ) ) ( not ( = ?auto_289873 ?auto_289877 ) ) ( not ( = ?auto_289873 ?auto_289878 ) ) ( not ( = ?auto_289873 ?auto_289879 ) ) ( not ( = ?auto_289873 ?auto_289880 ) ) ( not ( = ?auto_289873 ?auto_289881 ) ) ( not ( = ?auto_289873 ?auto_289882 ) ) ( not ( = ?auto_289873 ?auto_289883 ) ) ( not ( = ?auto_289873 ?auto_289884 ) ) ( not ( = ?auto_289874 ?auto_289875 ) ) ( not ( = ?auto_289874 ?auto_289876 ) ) ( not ( = ?auto_289874 ?auto_289877 ) ) ( not ( = ?auto_289874 ?auto_289878 ) ) ( not ( = ?auto_289874 ?auto_289879 ) ) ( not ( = ?auto_289874 ?auto_289880 ) ) ( not ( = ?auto_289874 ?auto_289881 ) ) ( not ( = ?auto_289874 ?auto_289882 ) ) ( not ( = ?auto_289874 ?auto_289883 ) ) ( not ( = ?auto_289874 ?auto_289884 ) ) ( not ( = ?auto_289875 ?auto_289876 ) ) ( not ( = ?auto_289875 ?auto_289877 ) ) ( not ( = ?auto_289875 ?auto_289878 ) ) ( not ( = ?auto_289875 ?auto_289879 ) ) ( not ( = ?auto_289875 ?auto_289880 ) ) ( not ( = ?auto_289875 ?auto_289881 ) ) ( not ( = ?auto_289875 ?auto_289882 ) ) ( not ( = ?auto_289875 ?auto_289883 ) ) ( not ( = ?auto_289875 ?auto_289884 ) ) ( not ( = ?auto_289876 ?auto_289877 ) ) ( not ( = ?auto_289876 ?auto_289878 ) ) ( not ( = ?auto_289876 ?auto_289879 ) ) ( not ( = ?auto_289876 ?auto_289880 ) ) ( not ( = ?auto_289876 ?auto_289881 ) ) ( not ( = ?auto_289876 ?auto_289882 ) ) ( not ( = ?auto_289876 ?auto_289883 ) ) ( not ( = ?auto_289876 ?auto_289884 ) ) ( not ( = ?auto_289877 ?auto_289878 ) ) ( not ( = ?auto_289877 ?auto_289879 ) ) ( not ( = ?auto_289877 ?auto_289880 ) ) ( not ( = ?auto_289877 ?auto_289881 ) ) ( not ( = ?auto_289877 ?auto_289882 ) ) ( not ( = ?auto_289877 ?auto_289883 ) ) ( not ( = ?auto_289877 ?auto_289884 ) ) ( not ( = ?auto_289878 ?auto_289879 ) ) ( not ( = ?auto_289878 ?auto_289880 ) ) ( not ( = ?auto_289878 ?auto_289881 ) ) ( not ( = ?auto_289878 ?auto_289882 ) ) ( not ( = ?auto_289878 ?auto_289883 ) ) ( not ( = ?auto_289878 ?auto_289884 ) ) ( not ( = ?auto_289879 ?auto_289880 ) ) ( not ( = ?auto_289879 ?auto_289881 ) ) ( not ( = ?auto_289879 ?auto_289882 ) ) ( not ( = ?auto_289879 ?auto_289883 ) ) ( not ( = ?auto_289879 ?auto_289884 ) ) ( not ( = ?auto_289880 ?auto_289881 ) ) ( not ( = ?auto_289880 ?auto_289882 ) ) ( not ( = ?auto_289880 ?auto_289883 ) ) ( not ( = ?auto_289880 ?auto_289884 ) ) ( not ( = ?auto_289881 ?auto_289882 ) ) ( not ( = ?auto_289881 ?auto_289883 ) ) ( not ( = ?auto_289881 ?auto_289884 ) ) ( not ( = ?auto_289882 ?auto_289883 ) ) ( not ( = ?auto_289882 ?auto_289884 ) ) ( not ( = ?auto_289883 ?auto_289884 ) ) ( ON ?auto_289882 ?auto_289883 ) ( ON ?auto_289881 ?auto_289882 ) ( ON ?auto_289880 ?auto_289881 ) ( ON ?auto_289879 ?auto_289880 ) ( ON ?auto_289878 ?auto_289879 ) ( ON ?auto_289877 ?auto_289878 ) ( ON ?auto_289876 ?auto_289877 ) ( ON ?auto_289875 ?auto_289876 ) ( CLEAR ?auto_289873 ) ( ON ?auto_289874 ?auto_289875 ) ( CLEAR ?auto_289874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_289873 ?auto_289874 )
      ( MAKE-11PILE ?auto_289873 ?auto_289874 ?auto_289875 ?auto_289876 ?auto_289877 ?auto_289878 ?auto_289879 ?auto_289880 ?auto_289881 ?auto_289882 ?auto_289883 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_289896 - BLOCK
      ?auto_289897 - BLOCK
      ?auto_289898 - BLOCK
      ?auto_289899 - BLOCK
      ?auto_289900 - BLOCK
      ?auto_289901 - BLOCK
      ?auto_289902 - BLOCK
      ?auto_289903 - BLOCK
      ?auto_289904 - BLOCK
      ?auto_289905 - BLOCK
      ?auto_289906 - BLOCK
    )
    :vars
    (
      ?auto_289907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289906 ?auto_289907 ) ( not ( = ?auto_289896 ?auto_289897 ) ) ( not ( = ?auto_289896 ?auto_289898 ) ) ( not ( = ?auto_289896 ?auto_289899 ) ) ( not ( = ?auto_289896 ?auto_289900 ) ) ( not ( = ?auto_289896 ?auto_289901 ) ) ( not ( = ?auto_289896 ?auto_289902 ) ) ( not ( = ?auto_289896 ?auto_289903 ) ) ( not ( = ?auto_289896 ?auto_289904 ) ) ( not ( = ?auto_289896 ?auto_289905 ) ) ( not ( = ?auto_289896 ?auto_289906 ) ) ( not ( = ?auto_289896 ?auto_289907 ) ) ( not ( = ?auto_289897 ?auto_289898 ) ) ( not ( = ?auto_289897 ?auto_289899 ) ) ( not ( = ?auto_289897 ?auto_289900 ) ) ( not ( = ?auto_289897 ?auto_289901 ) ) ( not ( = ?auto_289897 ?auto_289902 ) ) ( not ( = ?auto_289897 ?auto_289903 ) ) ( not ( = ?auto_289897 ?auto_289904 ) ) ( not ( = ?auto_289897 ?auto_289905 ) ) ( not ( = ?auto_289897 ?auto_289906 ) ) ( not ( = ?auto_289897 ?auto_289907 ) ) ( not ( = ?auto_289898 ?auto_289899 ) ) ( not ( = ?auto_289898 ?auto_289900 ) ) ( not ( = ?auto_289898 ?auto_289901 ) ) ( not ( = ?auto_289898 ?auto_289902 ) ) ( not ( = ?auto_289898 ?auto_289903 ) ) ( not ( = ?auto_289898 ?auto_289904 ) ) ( not ( = ?auto_289898 ?auto_289905 ) ) ( not ( = ?auto_289898 ?auto_289906 ) ) ( not ( = ?auto_289898 ?auto_289907 ) ) ( not ( = ?auto_289899 ?auto_289900 ) ) ( not ( = ?auto_289899 ?auto_289901 ) ) ( not ( = ?auto_289899 ?auto_289902 ) ) ( not ( = ?auto_289899 ?auto_289903 ) ) ( not ( = ?auto_289899 ?auto_289904 ) ) ( not ( = ?auto_289899 ?auto_289905 ) ) ( not ( = ?auto_289899 ?auto_289906 ) ) ( not ( = ?auto_289899 ?auto_289907 ) ) ( not ( = ?auto_289900 ?auto_289901 ) ) ( not ( = ?auto_289900 ?auto_289902 ) ) ( not ( = ?auto_289900 ?auto_289903 ) ) ( not ( = ?auto_289900 ?auto_289904 ) ) ( not ( = ?auto_289900 ?auto_289905 ) ) ( not ( = ?auto_289900 ?auto_289906 ) ) ( not ( = ?auto_289900 ?auto_289907 ) ) ( not ( = ?auto_289901 ?auto_289902 ) ) ( not ( = ?auto_289901 ?auto_289903 ) ) ( not ( = ?auto_289901 ?auto_289904 ) ) ( not ( = ?auto_289901 ?auto_289905 ) ) ( not ( = ?auto_289901 ?auto_289906 ) ) ( not ( = ?auto_289901 ?auto_289907 ) ) ( not ( = ?auto_289902 ?auto_289903 ) ) ( not ( = ?auto_289902 ?auto_289904 ) ) ( not ( = ?auto_289902 ?auto_289905 ) ) ( not ( = ?auto_289902 ?auto_289906 ) ) ( not ( = ?auto_289902 ?auto_289907 ) ) ( not ( = ?auto_289903 ?auto_289904 ) ) ( not ( = ?auto_289903 ?auto_289905 ) ) ( not ( = ?auto_289903 ?auto_289906 ) ) ( not ( = ?auto_289903 ?auto_289907 ) ) ( not ( = ?auto_289904 ?auto_289905 ) ) ( not ( = ?auto_289904 ?auto_289906 ) ) ( not ( = ?auto_289904 ?auto_289907 ) ) ( not ( = ?auto_289905 ?auto_289906 ) ) ( not ( = ?auto_289905 ?auto_289907 ) ) ( not ( = ?auto_289906 ?auto_289907 ) ) ( ON ?auto_289905 ?auto_289906 ) ( ON ?auto_289904 ?auto_289905 ) ( ON ?auto_289903 ?auto_289904 ) ( ON ?auto_289902 ?auto_289903 ) ( ON ?auto_289901 ?auto_289902 ) ( ON ?auto_289900 ?auto_289901 ) ( ON ?auto_289899 ?auto_289900 ) ( ON ?auto_289898 ?auto_289899 ) ( ON ?auto_289897 ?auto_289898 ) ( ON ?auto_289896 ?auto_289897 ) ( CLEAR ?auto_289896 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_289896 )
      ( MAKE-11PILE ?auto_289896 ?auto_289897 ?auto_289898 ?auto_289899 ?auto_289900 ?auto_289901 ?auto_289902 ?auto_289903 ?auto_289904 ?auto_289905 ?auto_289906 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_289919 - BLOCK
      ?auto_289920 - BLOCK
      ?auto_289921 - BLOCK
      ?auto_289922 - BLOCK
      ?auto_289923 - BLOCK
      ?auto_289924 - BLOCK
      ?auto_289925 - BLOCK
      ?auto_289926 - BLOCK
      ?auto_289927 - BLOCK
      ?auto_289928 - BLOCK
      ?auto_289929 - BLOCK
    )
    :vars
    (
      ?auto_289930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289929 ?auto_289930 ) ( not ( = ?auto_289919 ?auto_289920 ) ) ( not ( = ?auto_289919 ?auto_289921 ) ) ( not ( = ?auto_289919 ?auto_289922 ) ) ( not ( = ?auto_289919 ?auto_289923 ) ) ( not ( = ?auto_289919 ?auto_289924 ) ) ( not ( = ?auto_289919 ?auto_289925 ) ) ( not ( = ?auto_289919 ?auto_289926 ) ) ( not ( = ?auto_289919 ?auto_289927 ) ) ( not ( = ?auto_289919 ?auto_289928 ) ) ( not ( = ?auto_289919 ?auto_289929 ) ) ( not ( = ?auto_289919 ?auto_289930 ) ) ( not ( = ?auto_289920 ?auto_289921 ) ) ( not ( = ?auto_289920 ?auto_289922 ) ) ( not ( = ?auto_289920 ?auto_289923 ) ) ( not ( = ?auto_289920 ?auto_289924 ) ) ( not ( = ?auto_289920 ?auto_289925 ) ) ( not ( = ?auto_289920 ?auto_289926 ) ) ( not ( = ?auto_289920 ?auto_289927 ) ) ( not ( = ?auto_289920 ?auto_289928 ) ) ( not ( = ?auto_289920 ?auto_289929 ) ) ( not ( = ?auto_289920 ?auto_289930 ) ) ( not ( = ?auto_289921 ?auto_289922 ) ) ( not ( = ?auto_289921 ?auto_289923 ) ) ( not ( = ?auto_289921 ?auto_289924 ) ) ( not ( = ?auto_289921 ?auto_289925 ) ) ( not ( = ?auto_289921 ?auto_289926 ) ) ( not ( = ?auto_289921 ?auto_289927 ) ) ( not ( = ?auto_289921 ?auto_289928 ) ) ( not ( = ?auto_289921 ?auto_289929 ) ) ( not ( = ?auto_289921 ?auto_289930 ) ) ( not ( = ?auto_289922 ?auto_289923 ) ) ( not ( = ?auto_289922 ?auto_289924 ) ) ( not ( = ?auto_289922 ?auto_289925 ) ) ( not ( = ?auto_289922 ?auto_289926 ) ) ( not ( = ?auto_289922 ?auto_289927 ) ) ( not ( = ?auto_289922 ?auto_289928 ) ) ( not ( = ?auto_289922 ?auto_289929 ) ) ( not ( = ?auto_289922 ?auto_289930 ) ) ( not ( = ?auto_289923 ?auto_289924 ) ) ( not ( = ?auto_289923 ?auto_289925 ) ) ( not ( = ?auto_289923 ?auto_289926 ) ) ( not ( = ?auto_289923 ?auto_289927 ) ) ( not ( = ?auto_289923 ?auto_289928 ) ) ( not ( = ?auto_289923 ?auto_289929 ) ) ( not ( = ?auto_289923 ?auto_289930 ) ) ( not ( = ?auto_289924 ?auto_289925 ) ) ( not ( = ?auto_289924 ?auto_289926 ) ) ( not ( = ?auto_289924 ?auto_289927 ) ) ( not ( = ?auto_289924 ?auto_289928 ) ) ( not ( = ?auto_289924 ?auto_289929 ) ) ( not ( = ?auto_289924 ?auto_289930 ) ) ( not ( = ?auto_289925 ?auto_289926 ) ) ( not ( = ?auto_289925 ?auto_289927 ) ) ( not ( = ?auto_289925 ?auto_289928 ) ) ( not ( = ?auto_289925 ?auto_289929 ) ) ( not ( = ?auto_289925 ?auto_289930 ) ) ( not ( = ?auto_289926 ?auto_289927 ) ) ( not ( = ?auto_289926 ?auto_289928 ) ) ( not ( = ?auto_289926 ?auto_289929 ) ) ( not ( = ?auto_289926 ?auto_289930 ) ) ( not ( = ?auto_289927 ?auto_289928 ) ) ( not ( = ?auto_289927 ?auto_289929 ) ) ( not ( = ?auto_289927 ?auto_289930 ) ) ( not ( = ?auto_289928 ?auto_289929 ) ) ( not ( = ?auto_289928 ?auto_289930 ) ) ( not ( = ?auto_289929 ?auto_289930 ) ) ( ON ?auto_289928 ?auto_289929 ) ( ON ?auto_289927 ?auto_289928 ) ( ON ?auto_289926 ?auto_289927 ) ( ON ?auto_289925 ?auto_289926 ) ( ON ?auto_289924 ?auto_289925 ) ( ON ?auto_289923 ?auto_289924 ) ( ON ?auto_289922 ?auto_289923 ) ( ON ?auto_289921 ?auto_289922 ) ( ON ?auto_289920 ?auto_289921 ) ( ON ?auto_289919 ?auto_289920 ) ( CLEAR ?auto_289919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_289919 )
      ( MAKE-11PILE ?auto_289919 ?auto_289920 ?auto_289921 ?auto_289922 ?auto_289923 ?auto_289924 ?auto_289925 ?auto_289926 ?auto_289927 ?auto_289928 ?auto_289929 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_289943 - BLOCK
      ?auto_289944 - BLOCK
      ?auto_289945 - BLOCK
      ?auto_289946 - BLOCK
      ?auto_289947 - BLOCK
      ?auto_289948 - BLOCK
      ?auto_289949 - BLOCK
      ?auto_289950 - BLOCK
      ?auto_289951 - BLOCK
      ?auto_289952 - BLOCK
      ?auto_289953 - BLOCK
      ?auto_289954 - BLOCK
    )
    :vars
    (
      ?auto_289955 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_289953 ) ( ON ?auto_289954 ?auto_289955 ) ( CLEAR ?auto_289954 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_289943 ) ( ON ?auto_289944 ?auto_289943 ) ( ON ?auto_289945 ?auto_289944 ) ( ON ?auto_289946 ?auto_289945 ) ( ON ?auto_289947 ?auto_289946 ) ( ON ?auto_289948 ?auto_289947 ) ( ON ?auto_289949 ?auto_289948 ) ( ON ?auto_289950 ?auto_289949 ) ( ON ?auto_289951 ?auto_289950 ) ( ON ?auto_289952 ?auto_289951 ) ( ON ?auto_289953 ?auto_289952 ) ( not ( = ?auto_289943 ?auto_289944 ) ) ( not ( = ?auto_289943 ?auto_289945 ) ) ( not ( = ?auto_289943 ?auto_289946 ) ) ( not ( = ?auto_289943 ?auto_289947 ) ) ( not ( = ?auto_289943 ?auto_289948 ) ) ( not ( = ?auto_289943 ?auto_289949 ) ) ( not ( = ?auto_289943 ?auto_289950 ) ) ( not ( = ?auto_289943 ?auto_289951 ) ) ( not ( = ?auto_289943 ?auto_289952 ) ) ( not ( = ?auto_289943 ?auto_289953 ) ) ( not ( = ?auto_289943 ?auto_289954 ) ) ( not ( = ?auto_289943 ?auto_289955 ) ) ( not ( = ?auto_289944 ?auto_289945 ) ) ( not ( = ?auto_289944 ?auto_289946 ) ) ( not ( = ?auto_289944 ?auto_289947 ) ) ( not ( = ?auto_289944 ?auto_289948 ) ) ( not ( = ?auto_289944 ?auto_289949 ) ) ( not ( = ?auto_289944 ?auto_289950 ) ) ( not ( = ?auto_289944 ?auto_289951 ) ) ( not ( = ?auto_289944 ?auto_289952 ) ) ( not ( = ?auto_289944 ?auto_289953 ) ) ( not ( = ?auto_289944 ?auto_289954 ) ) ( not ( = ?auto_289944 ?auto_289955 ) ) ( not ( = ?auto_289945 ?auto_289946 ) ) ( not ( = ?auto_289945 ?auto_289947 ) ) ( not ( = ?auto_289945 ?auto_289948 ) ) ( not ( = ?auto_289945 ?auto_289949 ) ) ( not ( = ?auto_289945 ?auto_289950 ) ) ( not ( = ?auto_289945 ?auto_289951 ) ) ( not ( = ?auto_289945 ?auto_289952 ) ) ( not ( = ?auto_289945 ?auto_289953 ) ) ( not ( = ?auto_289945 ?auto_289954 ) ) ( not ( = ?auto_289945 ?auto_289955 ) ) ( not ( = ?auto_289946 ?auto_289947 ) ) ( not ( = ?auto_289946 ?auto_289948 ) ) ( not ( = ?auto_289946 ?auto_289949 ) ) ( not ( = ?auto_289946 ?auto_289950 ) ) ( not ( = ?auto_289946 ?auto_289951 ) ) ( not ( = ?auto_289946 ?auto_289952 ) ) ( not ( = ?auto_289946 ?auto_289953 ) ) ( not ( = ?auto_289946 ?auto_289954 ) ) ( not ( = ?auto_289946 ?auto_289955 ) ) ( not ( = ?auto_289947 ?auto_289948 ) ) ( not ( = ?auto_289947 ?auto_289949 ) ) ( not ( = ?auto_289947 ?auto_289950 ) ) ( not ( = ?auto_289947 ?auto_289951 ) ) ( not ( = ?auto_289947 ?auto_289952 ) ) ( not ( = ?auto_289947 ?auto_289953 ) ) ( not ( = ?auto_289947 ?auto_289954 ) ) ( not ( = ?auto_289947 ?auto_289955 ) ) ( not ( = ?auto_289948 ?auto_289949 ) ) ( not ( = ?auto_289948 ?auto_289950 ) ) ( not ( = ?auto_289948 ?auto_289951 ) ) ( not ( = ?auto_289948 ?auto_289952 ) ) ( not ( = ?auto_289948 ?auto_289953 ) ) ( not ( = ?auto_289948 ?auto_289954 ) ) ( not ( = ?auto_289948 ?auto_289955 ) ) ( not ( = ?auto_289949 ?auto_289950 ) ) ( not ( = ?auto_289949 ?auto_289951 ) ) ( not ( = ?auto_289949 ?auto_289952 ) ) ( not ( = ?auto_289949 ?auto_289953 ) ) ( not ( = ?auto_289949 ?auto_289954 ) ) ( not ( = ?auto_289949 ?auto_289955 ) ) ( not ( = ?auto_289950 ?auto_289951 ) ) ( not ( = ?auto_289950 ?auto_289952 ) ) ( not ( = ?auto_289950 ?auto_289953 ) ) ( not ( = ?auto_289950 ?auto_289954 ) ) ( not ( = ?auto_289950 ?auto_289955 ) ) ( not ( = ?auto_289951 ?auto_289952 ) ) ( not ( = ?auto_289951 ?auto_289953 ) ) ( not ( = ?auto_289951 ?auto_289954 ) ) ( not ( = ?auto_289951 ?auto_289955 ) ) ( not ( = ?auto_289952 ?auto_289953 ) ) ( not ( = ?auto_289952 ?auto_289954 ) ) ( not ( = ?auto_289952 ?auto_289955 ) ) ( not ( = ?auto_289953 ?auto_289954 ) ) ( not ( = ?auto_289953 ?auto_289955 ) ) ( not ( = ?auto_289954 ?auto_289955 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_289954 ?auto_289955 )
      ( !STACK ?auto_289954 ?auto_289953 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_289968 - BLOCK
      ?auto_289969 - BLOCK
      ?auto_289970 - BLOCK
      ?auto_289971 - BLOCK
      ?auto_289972 - BLOCK
      ?auto_289973 - BLOCK
      ?auto_289974 - BLOCK
      ?auto_289975 - BLOCK
      ?auto_289976 - BLOCK
      ?auto_289977 - BLOCK
      ?auto_289978 - BLOCK
      ?auto_289979 - BLOCK
    )
    :vars
    (
      ?auto_289980 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_289978 ) ( ON ?auto_289979 ?auto_289980 ) ( CLEAR ?auto_289979 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_289968 ) ( ON ?auto_289969 ?auto_289968 ) ( ON ?auto_289970 ?auto_289969 ) ( ON ?auto_289971 ?auto_289970 ) ( ON ?auto_289972 ?auto_289971 ) ( ON ?auto_289973 ?auto_289972 ) ( ON ?auto_289974 ?auto_289973 ) ( ON ?auto_289975 ?auto_289974 ) ( ON ?auto_289976 ?auto_289975 ) ( ON ?auto_289977 ?auto_289976 ) ( ON ?auto_289978 ?auto_289977 ) ( not ( = ?auto_289968 ?auto_289969 ) ) ( not ( = ?auto_289968 ?auto_289970 ) ) ( not ( = ?auto_289968 ?auto_289971 ) ) ( not ( = ?auto_289968 ?auto_289972 ) ) ( not ( = ?auto_289968 ?auto_289973 ) ) ( not ( = ?auto_289968 ?auto_289974 ) ) ( not ( = ?auto_289968 ?auto_289975 ) ) ( not ( = ?auto_289968 ?auto_289976 ) ) ( not ( = ?auto_289968 ?auto_289977 ) ) ( not ( = ?auto_289968 ?auto_289978 ) ) ( not ( = ?auto_289968 ?auto_289979 ) ) ( not ( = ?auto_289968 ?auto_289980 ) ) ( not ( = ?auto_289969 ?auto_289970 ) ) ( not ( = ?auto_289969 ?auto_289971 ) ) ( not ( = ?auto_289969 ?auto_289972 ) ) ( not ( = ?auto_289969 ?auto_289973 ) ) ( not ( = ?auto_289969 ?auto_289974 ) ) ( not ( = ?auto_289969 ?auto_289975 ) ) ( not ( = ?auto_289969 ?auto_289976 ) ) ( not ( = ?auto_289969 ?auto_289977 ) ) ( not ( = ?auto_289969 ?auto_289978 ) ) ( not ( = ?auto_289969 ?auto_289979 ) ) ( not ( = ?auto_289969 ?auto_289980 ) ) ( not ( = ?auto_289970 ?auto_289971 ) ) ( not ( = ?auto_289970 ?auto_289972 ) ) ( not ( = ?auto_289970 ?auto_289973 ) ) ( not ( = ?auto_289970 ?auto_289974 ) ) ( not ( = ?auto_289970 ?auto_289975 ) ) ( not ( = ?auto_289970 ?auto_289976 ) ) ( not ( = ?auto_289970 ?auto_289977 ) ) ( not ( = ?auto_289970 ?auto_289978 ) ) ( not ( = ?auto_289970 ?auto_289979 ) ) ( not ( = ?auto_289970 ?auto_289980 ) ) ( not ( = ?auto_289971 ?auto_289972 ) ) ( not ( = ?auto_289971 ?auto_289973 ) ) ( not ( = ?auto_289971 ?auto_289974 ) ) ( not ( = ?auto_289971 ?auto_289975 ) ) ( not ( = ?auto_289971 ?auto_289976 ) ) ( not ( = ?auto_289971 ?auto_289977 ) ) ( not ( = ?auto_289971 ?auto_289978 ) ) ( not ( = ?auto_289971 ?auto_289979 ) ) ( not ( = ?auto_289971 ?auto_289980 ) ) ( not ( = ?auto_289972 ?auto_289973 ) ) ( not ( = ?auto_289972 ?auto_289974 ) ) ( not ( = ?auto_289972 ?auto_289975 ) ) ( not ( = ?auto_289972 ?auto_289976 ) ) ( not ( = ?auto_289972 ?auto_289977 ) ) ( not ( = ?auto_289972 ?auto_289978 ) ) ( not ( = ?auto_289972 ?auto_289979 ) ) ( not ( = ?auto_289972 ?auto_289980 ) ) ( not ( = ?auto_289973 ?auto_289974 ) ) ( not ( = ?auto_289973 ?auto_289975 ) ) ( not ( = ?auto_289973 ?auto_289976 ) ) ( not ( = ?auto_289973 ?auto_289977 ) ) ( not ( = ?auto_289973 ?auto_289978 ) ) ( not ( = ?auto_289973 ?auto_289979 ) ) ( not ( = ?auto_289973 ?auto_289980 ) ) ( not ( = ?auto_289974 ?auto_289975 ) ) ( not ( = ?auto_289974 ?auto_289976 ) ) ( not ( = ?auto_289974 ?auto_289977 ) ) ( not ( = ?auto_289974 ?auto_289978 ) ) ( not ( = ?auto_289974 ?auto_289979 ) ) ( not ( = ?auto_289974 ?auto_289980 ) ) ( not ( = ?auto_289975 ?auto_289976 ) ) ( not ( = ?auto_289975 ?auto_289977 ) ) ( not ( = ?auto_289975 ?auto_289978 ) ) ( not ( = ?auto_289975 ?auto_289979 ) ) ( not ( = ?auto_289975 ?auto_289980 ) ) ( not ( = ?auto_289976 ?auto_289977 ) ) ( not ( = ?auto_289976 ?auto_289978 ) ) ( not ( = ?auto_289976 ?auto_289979 ) ) ( not ( = ?auto_289976 ?auto_289980 ) ) ( not ( = ?auto_289977 ?auto_289978 ) ) ( not ( = ?auto_289977 ?auto_289979 ) ) ( not ( = ?auto_289977 ?auto_289980 ) ) ( not ( = ?auto_289978 ?auto_289979 ) ) ( not ( = ?auto_289978 ?auto_289980 ) ) ( not ( = ?auto_289979 ?auto_289980 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_289979 ?auto_289980 )
      ( !STACK ?auto_289979 ?auto_289978 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_289993 - BLOCK
      ?auto_289994 - BLOCK
      ?auto_289995 - BLOCK
      ?auto_289996 - BLOCK
      ?auto_289997 - BLOCK
      ?auto_289998 - BLOCK
      ?auto_289999 - BLOCK
      ?auto_290000 - BLOCK
      ?auto_290001 - BLOCK
      ?auto_290002 - BLOCK
      ?auto_290003 - BLOCK
      ?auto_290004 - BLOCK
    )
    :vars
    (
      ?auto_290005 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290004 ?auto_290005 ) ( ON-TABLE ?auto_289993 ) ( ON ?auto_289994 ?auto_289993 ) ( ON ?auto_289995 ?auto_289994 ) ( ON ?auto_289996 ?auto_289995 ) ( ON ?auto_289997 ?auto_289996 ) ( ON ?auto_289998 ?auto_289997 ) ( ON ?auto_289999 ?auto_289998 ) ( ON ?auto_290000 ?auto_289999 ) ( ON ?auto_290001 ?auto_290000 ) ( ON ?auto_290002 ?auto_290001 ) ( not ( = ?auto_289993 ?auto_289994 ) ) ( not ( = ?auto_289993 ?auto_289995 ) ) ( not ( = ?auto_289993 ?auto_289996 ) ) ( not ( = ?auto_289993 ?auto_289997 ) ) ( not ( = ?auto_289993 ?auto_289998 ) ) ( not ( = ?auto_289993 ?auto_289999 ) ) ( not ( = ?auto_289993 ?auto_290000 ) ) ( not ( = ?auto_289993 ?auto_290001 ) ) ( not ( = ?auto_289993 ?auto_290002 ) ) ( not ( = ?auto_289993 ?auto_290003 ) ) ( not ( = ?auto_289993 ?auto_290004 ) ) ( not ( = ?auto_289993 ?auto_290005 ) ) ( not ( = ?auto_289994 ?auto_289995 ) ) ( not ( = ?auto_289994 ?auto_289996 ) ) ( not ( = ?auto_289994 ?auto_289997 ) ) ( not ( = ?auto_289994 ?auto_289998 ) ) ( not ( = ?auto_289994 ?auto_289999 ) ) ( not ( = ?auto_289994 ?auto_290000 ) ) ( not ( = ?auto_289994 ?auto_290001 ) ) ( not ( = ?auto_289994 ?auto_290002 ) ) ( not ( = ?auto_289994 ?auto_290003 ) ) ( not ( = ?auto_289994 ?auto_290004 ) ) ( not ( = ?auto_289994 ?auto_290005 ) ) ( not ( = ?auto_289995 ?auto_289996 ) ) ( not ( = ?auto_289995 ?auto_289997 ) ) ( not ( = ?auto_289995 ?auto_289998 ) ) ( not ( = ?auto_289995 ?auto_289999 ) ) ( not ( = ?auto_289995 ?auto_290000 ) ) ( not ( = ?auto_289995 ?auto_290001 ) ) ( not ( = ?auto_289995 ?auto_290002 ) ) ( not ( = ?auto_289995 ?auto_290003 ) ) ( not ( = ?auto_289995 ?auto_290004 ) ) ( not ( = ?auto_289995 ?auto_290005 ) ) ( not ( = ?auto_289996 ?auto_289997 ) ) ( not ( = ?auto_289996 ?auto_289998 ) ) ( not ( = ?auto_289996 ?auto_289999 ) ) ( not ( = ?auto_289996 ?auto_290000 ) ) ( not ( = ?auto_289996 ?auto_290001 ) ) ( not ( = ?auto_289996 ?auto_290002 ) ) ( not ( = ?auto_289996 ?auto_290003 ) ) ( not ( = ?auto_289996 ?auto_290004 ) ) ( not ( = ?auto_289996 ?auto_290005 ) ) ( not ( = ?auto_289997 ?auto_289998 ) ) ( not ( = ?auto_289997 ?auto_289999 ) ) ( not ( = ?auto_289997 ?auto_290000 ) ) ( not ( = ?auto_289997 ?auto_290001 ) ) ( not ( = ?auto_289997 ?auto_290002 ) ) ( not ( = ?auto_289997 ?auto_290003 ) ) ( not ( = ?auto_289997 ?auto_290004 ) ) ( not ( = ?auto_289997 ?auto_290005 ) ) ( not ( = ?auto_289998 ?auto_289999 ) ) ( not ( = ?auto_289998 ?auto_290000 ) ) ( not ( = ?auto_289998 ?auto_290001 ) ) ( not ( = ?auto_289998 ?auto_290002 ) ) ( not ( = ?auto_289998 ?auto_290003 ) ) ( not ( = ?auto_289998 ?auto_290004 ) ) ( not ( = ?auto_289998 ?auto_290005 ) ) ( not ( = ?auto_289999 ?auto_290000 ) ) ( not ( = ?auto_289999 ?auto_290001 ) ) ( not ( = ?auto_289999 ?auto_290002 ) ) ( not ( = ?auto_289999 ?auto_290003 ) ) ( not ( = ?auto_289999 ?auto_290004 ) ) ( not ( = ?auto_289999 ?auto_290005 ) ) ( not ( = ?auto_290000 ?auto_290001 ) ) ( not ( = ?auto_290000 ?auto_290002 ) ) ( not ( = ?auto_290000 ?auto_290003 ) ) ( not ( = ?auto_290000 ?auto_290004 ) ) ( not ( = ?auto_290000 ?auto_290005 ) ) ( not ( = ?auto_290001 ?auto_290002 ) ) ( not ( = ?auto_290001 ?auto_290003 ) ) ( not ( = ?auto_290001 ?auto_290004 ) ) ( not ( = ?auto_290001 ?auto_290005 ) ) ( not ( = ?auto_290002 ?auto_290003 ) ) ( not ( = ?auto_290002 ?auto_290004 ) ) ( not ( = ?auto_290002 ?auto_290005 ) ) ( not ( = ?auto_290003 ?auto_290004 ) ) ( not ( = ?auto_290003 ?auto_290005 ) ) ( not ( = ?auto_290004 ?auto_290005 ) ) ( CLEAR ?auto_290002 ) ( ON ?auto_290003 ?auto_290004 ) ( CLEAR ?auto_290003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_289993 ?auto_289994 ?auto_289995 ?auto_289996 ?auto_289997 ?auto_289998 ?auto_289999 ?auto_290000 ?auto_290001 ?auto_290002 ?auto_290003 )
      ( MAKE-12PILE ?auto_289993 ?auto_289994 ?auto_289995 ?auto_289996 ?auto_289997 ?auto_289998 ?auto_289999 ?auto_290000 ?auto_290001 ?auto_290002 ?auto_290003 ?auto_290004 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_290018 - BLOCK
      ?auto_290019 - BLOCK
      ?auto_290020 - BLOCK
      ?auto_290021 - BLOCK
      ?auto_290022 - BLOCK
      ?auto_290023 - BLOCK
      ?auto_290024 - BLOCK
      ?auto_290025 - BLOCK
      ?auto_290026 - BLOCK
      ?auto_290027 - BLOCK
      ?auto_290028 - BLOCK
      ?auto_290029 - BLOCK
    )
    :vars
    (
      ?auto_290030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290029 ?auto_290030 ) ( ON-TABLE ?auto_290018 ) ( ON ?auto_290019 ?auto_290018 ) ( ON ?auto_290020 ?auto_290019 ) ( ON ?auto_290021 ?auto_290020 ) ( ON ?auto_290022 ?auto_290021 ) ( ON ?auto_290023 ?auto_290022 ) ( ON ?auto_290024 ?auto_290023 ) ( ON ?auto_290025 ?auto_290024 ) ( ON ?auto_290026 ?auto_290025 ) ( ON ?auto_290027 ?auto_290026 ) ( not ( = ?auto_290018 ?auto_290019 ) ) ( not ( = ?auto_290018 ?auto_290020 ) ) ( not ( = ?auto_290018 ?auto_290021 ) ) ( not ( = ?auto_290018 ?auto_290022 ) ) ( not ( = ?auto_290018 ?auto_290023 ) ) ( not ( = ?auto_290018 ?auto_290024 ) ) ( not ( = ?auto_290018 ?auto_290025 ) ) ( not ( = ?auto_290018 ?auto_290026 ) ) ( not ( = ?auto_290018 ?auto_290027 ) ) ( not ( = ?auto_290018 ?auto_290028 ) ) ( not ( = ?auto_290018 ?auto_290029 ) ) ( not ( = ?auto_290018 ?auto_290030 ) ) ( not ( = ?auto_290019 ?auto_290020 ) ) ( not ( = ?auto_290019 ?auto_290021 ) ) ( not ( = ?auto_290019 ?auto_290022 ) ) ( not ( = ?auto_290019 ?auto_290023 ) ) ( not ( = ?auto_290019 ?auto_290024 ) ) ( not ( = ?auto_290019 ?auto_290025 ) ) ( not ( = ?auto_290019 ?auto_290026 ) ) ( not ( = ?auto_290019 ?auto_290027 ) ) ( not ( = ?auto_290019 ?auto_290028 ) ) ( not ( = ?auto_290019 ?auto_290029 ) ) ( not ( = ?auto_290019 ?auto_290030 ) ) ( not ( = ?auto_290020 ?auto_290021 ) ) ( not ( = ?auto_290020 ?auto_290022 ) ) ( not ( = ?auto_290020 ?auto_290023 ) ) ( not ( = ?auto_290020 ?auto_290024 ) ) ( not ( = ?auto_290020 ?auto_290025 ) ) ( not ( = ?auto_290020 ?auto_290026 ) ) ( not ( = ?auto_290020 ?auto_290027 ) ) ( not ( = ?auto_290020 ?auto_290028 ) ) ( not ( = ?auto_290020 ?auto_290029 ) ) ( not ( = ?auto_290020 ?auto_290030 ) ) ( not ( = ?auto_290021 ?auto_290022 ) ) ( not ( = ?auto_290021 ?auto_290023 ) ) ( not ( = ?auto_290021 ?auto_290024 ) ) ( not ( = ?auto_290021 ?auto_290025 ) ) ( not ( = ?auto_290021 ?auto_290026 ) ) ( not ( = ?auto_290021 ?auto_290027 ) ) ( not ( = ?auto_290021 ?auto_290028 ) ) ( not ( = ?auto_290021 ?auto_290029 ) ) ( not ( = ?auto_290021 ?auto_290030 ) ) ( not ( = ?auto_290022 ?auto_290023 ) ) ( not ( = ?auto_290022 ?auto_290024 ) ) ( not ( = ?auto_290022 ?auto_290025 ) ) ( not ( = ?auto_290022 ?auto_290026 ) ) ( not ( = ?auto_290022 ?auto_290027 ) ) ( not ( = ?auto_290022 ?auto_290028 ) ) ( not ( = ?auto_290022 ?auto_290029 ) ) ( not ( = ?auto_290022 ?auto_290030 ) ) ( not ( = ?auto_290023 ?auto_290024 ) ) ( not ( = ?auto_290023 ?auto_290025 ) ) ( not ( = ?auto_290023 ?auto_290026 ) ) ( not ( = ?auto_290023 ?auto_290027 ) ) ( not ( = ?auto_290023 ?auto_290028 ) ) ( not ( = ?auto_290023 ?auto_290029 ) ) ( not ( = ?auto_290023 ?auto_290030 ) ) ( not ( = ?auto_290024 ?auto_290025 ) ) ( not ( = ?auto_290024 ?auto_290026 ) ) ( not ( = ?auto_290024 ?auto_290027 ) ) ( not ( = ?auto_290024 ?auto_290028 ) ) ( not ( = ?auto_290024 ?auto_290029 ) ) ( not ( = ?auto_290024 ?auto_290030 ) ) ( not ( = ?auto_290025 ?auto_290026 ) ) ( not ( = ?auto_290025 ?auto_290027 ) ) ( not ( = ?auto_290025 ?auto_290028 ) ) ( not ( = ?auto_290025 ?auto_290029 ) ) ( not ( = ?auto_290025 ?auto_290030 ) ) ( not ( = ?auto_290026 ?auto_290027 ) ) ( not ( = ?auto_290026 ?auto_290028 ) ) ( not ( = ?auto_290026 ?auto_290029 ) ) ( not ( = ?auto_290026 ?auto_290030 ) ) ( not ( = ?auto_290027 ?auto_290028 ) ) ( not ( = ?auto_290027 ?auto_290029 ) ) ( not ( = ?auto_290027 ?auto_290030 ) ) ( not ( = ?auto_290028 ?auto_290029 ) ) ( not ( = ?auto_290028 ?auto_290030 ) ) ( not ( = ?auto_290029 ?auto_290030 ) ) ( CLEAR ?auto_290027 ) ( ON ?auto_290028 ?auto_290029 ) ( CLEAR ?auto_290028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_290018 ?auto_290019 ?auto_290020 ?auto_290021 ?auto_290022 ?auto_290023 ?auto_290024 ?auto_290025 ?auto_290026 ?auto_290027 ?auto_290028 )
      ( MAKE-12PILE ?auto_290018 ?auto_290019 ?auto_290020 ?auto_290021 ?auto_290022 ?auto_290023 ?auto_290024 ?auto_290025 ?auto_290026 ?auto_290027 ?auto_290028 ?auto_290029 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_290043 - BLOCK
      ?auto_290044 - BLOCK
      ?auto_290045 - BLOCK
      ?auto_290046 - BLOCK
      ?auto_290047 - BLOCK
      ?auto_290048 - BLOCK
      ?auto_290049 - BLOCK
      ?auto_290050 - BLOCK
      ?auto_290051 - BLOCK
      ?auto_290052 - BLOCK
      ?auto_290053 - BLOCK
      ?auto_290054 - BLOCK
    )
    :vars
    (
      ?auto_290055 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290054 ?auto_290055 ) ( ON-TABLE ?auto_290043 ) ( ON ?auto_290044 ?auto_290043 ) ( ON ?auto_290045 ?auto_290044 ) ( ON ?auto_290046 ?auto_290045 ) ( ON ?auto_290047 ?auto_290046 ) ( ON ?auto_290048 ?auto_290047 ) ( ON ?auto_290049 ?auto_290048 ) ( ON ?auto_290050 ?auto_290049 ) ( ON ?auto_290051 ?auto_290050 ) ( not ( = ?auto_290043 ?auto_290044 ) ) ( not ( = ?auto_290043 ?auto_290045 ) ) ( not ( = ?auto_290043 ?auto_290046 ) ) ( not ( = ?auto_290043 ?auto_290047 ) ) ( not ( = ?auto_290043 ?auto_290048 ) ) ( not ( = ?auto_290043 ?auto_290049 ) ) ( not ( = ?auto_290043 ?auto_290050 ) ) ( not ( = ?auto_290043 ?auto_290051 ) ) ( not ( = ?auto_290043 ?auto_290052 ) ) ( not ( = ?auto_290043 ?auto_290053 ) ) ( not ( = ?auto_290043 ?auto_290054 ) ) ( not ( = ?auto_290043 ?auto_290055 ) ) ( not ( = ?auto_290044 ?auto_290045 ) ) ( not ( = ?auto_290044 ?auto_290046 ) ) ( not ( = ?auto_290044 ?auto_290047 ) ) ( not ( = ?auto_290044 ?auto_290048 ) ) ( not ( = ?auto_290044 ?auto_290049 ) ) ( not ( = ?auto_290044 ?auto_290050 ) ) ( not ( = ?auto_290044 ?auto_290051 ) ) ( not ( = ?auto_290044 ?auto_290052 ) ) ( not ( = ?auto_290044 ?auto_290053 ) ) ( not ( = ?auto_290044 ?auto_290054 ) ) ( not ( = ?auto_290044 ?auto_290055 ) ) ( not ( = ?auto_290045 ?auto_290046 ) ) ( not ( = ?auto_290045 ?auto_290047 ) ) ( not ( = ?auto_290045 ?auto_290048 ) ) ( not ( = ?auto_290045 ?auto_290049 ) ) ( not ( = ?auto_290045 ?auto_290050 ) ) ( not ( = ?auto_290045 ?auto_290051 ) ) ( not ( = ?auto_290045 ?auto_290052 ) ) ( not ( = ?auto_290045 ?auto_290053 ) ) ( not ( = ?auto_290045 ?auto_290054 ) ) ( not ( = ?auto_290045 ?auto_290055 ) ) ( not ( = ?auto_290046 ?auto_290047 ) ) ( not ( = ?auto_290046 ?auto_290048 ) ) ( not ( = ?auto_290046 ?auto_290049 ) ) ( not ( = ?auto_290046 ?auto_290050 ) ) ( not ( = ?auto_290046 ?auto_290051 ) ) ( not ( = ?auto_290046 ?auto_290052 ) ) ( not ( = ?auto_290046 ?auto_290053 ) ) ( not ( = ?auto_290046 ?auto_290054 ) ) ( not ( = ?auto_290046 ?auto_290055 ) ) ( not ( = ?auto_290047 ?auto_290048 ) ) ( not ( = ?auto_290047 ?auto_290049 ) ) ( not ( = ?auto_290047 ?auto_290050 ) ) ( not ( = ?auto_290047 ?auto_290051 ) ) ( not ( = ?auto_290047 ?auto_290052 ) ) ( not ( = ?auto_290047 ?auto_290053 ) ) ( not ( = ?auto_290047 ?auto_290054 ) ) ( not ( = ?auto_290047 ?auto_290055 ) ) ( not ( = ?auto_290048 ?auto_290049 ) ) ( not ( = ?auto_290048 ?auto_290050 ) ) ( not ( = ?auto_290048 ?auto_290051 ) ) ( not ( = ?auto_290048 ?auto_290052 ) ) ( not ( = ?auto_290048 ?auto_290053 ) ) ( not ( = ?auto_290048 ?auto_290054 ) ) ( not ( = ?auto_290048 ?auto_290055 ) ) ( not ( = ?auto_290049 ?auto_290050 ) ) ( not ( = ?auto_290049 ?auto_290051 ) ) ( not ( = ?auto_290049 ?auto_290052 ) ) ( not ( = ?auto_290049 ?auto_290053 ) ) ( not ( = ?auto_290049 ?auto_290054 ) ) ( not ( = ?auto_290049 ?auto_290055 ) ) ( not ( = ?auto_290050 ?auto_290051 ) ) ( not ( = ?auto_290050 ?auto_290052 ) ) ( not ( = ?auto_290050 ?auto_290053 ) ) ( not ( = ?auto_290050 ?auto_290054 ) ) ( not ( = ?auto_290050 ?auto_290055 ) ) ( not ( = ?auto_290051 ?auto_290052 ) ) ( not ( = ?auto_290051 ?auto_290053 ) ) ( not ( = ?auto_290051 ?auto_290054 ) ) ( not ( = ?auto_290051 ?auto_290055 ) ) ( not ( = ?auto_290052 ?auto_290053 ) ) ( not ( = ?auto_290052 ?auto_290054 ) ) ( not ( = ?auto_290052 ?auto_290055 ) ) ( not ( = ?auto_290053 ?auto_290054 ) ) ( not ( = ?auto_290053 ?auto_290055 ) ) ( not ( = ?auto_290054 ?auto_290055 ) ) ( ON ?auto_290053 ?auto_290054 ) ( CLEAR ?auto_290051 ) ( ON ?auto_290052 ?auto_290053 ) ( CLEAR ?auto_290052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_290043 ?auto_290044 ?auto_290045 ?auto_290046 ?auto_290047 ?auto_290048 ?auto_290049 ?auto_290050 ?auto_290051 ?auto_290052 )
      ( MAKE-12PILE ?auto_290043 ?auto_290044 ?auto_290045 ?auto_290046 ?auto_290047 ?auto_290048 ?auto_290049 ?auto_290050 ?auto_290051 ?auto_290052 ?auto_290053 ?auto_290054 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_290068 - BLOCK
      ?auto_290069 - BLOCK
      ?auto_290070 - BLOCK
      ?auto_290071 - BLOCK
      ?auto_290072 - BLOCK
      ?auto_290073 - BLOCK
      ?auto_290074 - BLOCK
      ?auto_290075 - BLOCK
      ?auto_290076 - BLOCK
      ?auto_290077 - BLOCK
      ?auto_290078 - BLOCK
      ?auto_290079 - BLOCK
    )
    :vars
    (
      ?auto_290080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290079 ?auto_290080 ) ( ON-TABLE ?auto_290068 ) ( ON ?auto_290069 ?auto_290068 ) ( ON ?auto_290070 ?auto_290069 ) ( ON ?auto_290071 ?auto_290070 ) ( ON ?auto_290072 ?auto_290071 ) ( ON ?auto_290073 ?auto_290072 ) ( ON ?auto_290074 ?auto_290073 ) ( ON ?auto_290075 ?auto_290074 ) ( ON ?auto_290076 ?auto_290075 ) ( not ( = ?auto_290068 ?auto_290069 ) ) ( not ( = ?auto_290068 ?auto_290070 ) ) ( not ( = ?auto_290068 ?auto_290071 ) ) ( not ( = ?auto_290068 ?auto_290072 ) ) ( not ( = ?auto_290068 ?auto_290073 ) ) ( not ( = ?auto_290068 ?auto_290074 ) ) ( not ( = ?auto_290068 ?auto_290075 ) ) ( not ( = ?auto_290068 ?auto_290076 ) ) ( not ( = ?auto_290068 ?auto_290077 ) ) ( not ( = ?auto_290068 ?auto_290078 ) ) ( not ( = ?auto_290068 ?auto_290079 ) ) ( not ( = ?auto_290068 ?auto_290080 ) ) ( not ( = ?auto_290069 ?auto_290070 ) ) ( not ( = ?auto_290069 ?auto_290071 ) ) ( not ( = ?auto_290069 ?auto_290072 ) ) ( not ( = ?auto_290069 ?auto_290073 ) ) ( not ( = ?auto_290069 ?auto_290074 ) ) ( not ( = ?auto_290069 ?auto_290075 ) ) ( not ( = ?auto_290069 ?auto_290076 ) ) ( not ( = ?auto_290069 ?auto_290077 ) ) ( not ( = ?auto_290069 ?auto_290078 ) ) ( not ( = ?auto_290069 ?auto_290079 ) ) ( not ( = ?auto_290069 ?auto_290080 ) ) ( not ( = ?auto_290070 ?auto_290071 ) ) ( not ( = ?auto_290070 ?auto_290072 ) ) ( not ( = ?auto_290070 ?auto_290073 ) ) ( not ( = ?auto_290070 ?auto_290074 ) ) ( not ( = ?auto_290070 ?auto_290075 ) ) ( not ( = ?auto_290070 ?auto_290076 ) ) ( not ( = ?auto_290070 ?auto_290077 ) ) ( not ( = ?auto_290070 ?auto_290078 ) ) ( not ( = ?auto_290070 ?auto_290079 ) ) ( not ( = ?auto_290070 ?auto_290080 ) ) ( not ( = ?auto_290071 ?auto_290072 ) ) ( not ( = ?auto_290071 ?auto_290073 ) ) ( not ( = ?auto_290071 ?auto_290074 ) ) ( not ( = ?auto_290071 ?auto_290075 ) ) ( not ( = ?auto_290071 ?auto_290076 ) ) ( not ( = ?auto_290071 ?auto_290077 ) ) ( not ( = ?auto_290071 ?auto_290078 ) ) ( not ( = ?auto_290071 ?auto_290079 ) ) ( not ( = ?auto_290071 ?auto_290080 ) ) ( not ( = ?auto_290072 ?auto_290073 ) ) ( not ( = ?auto_290072 ?auto_290074 ) ) ( not ( = ?auto_290072 ?auto_290075 ) ) ( not ( = ?auto_290072 ?auto_290076 ) ) ( not ( = ?auto_290072 ?auto_290077 ) ) ( not ( = ?auto_290072 ?auto_290078 ) ) ( not ( = ?auto_290072 ?auto_290079 ) ) ( not ( = ?auto_290072 ?auto_290080 ) ) ( not ( = ?auto_290073 ?auto_290074 ) ) ( not ( = ?auto_290073 ?auto_290075 ) ) ( not ( = ?auto_290073 ?auto_290076 ) ) ( not ( = ?auto_290073 ?auto_290077 ) ) ( not ( = ?auto_290073 ?auto_290078 ) ) ( not ( = ?auto_290073 ?auto_290079 ) ) ( not ( = ?auto_290073 ?auto_290080 ) ) ( not ( = ?auto_290074 ?auto_290075 ) ) ( not ( = ?auto_290074 ?auto_290076 ) ) ( not ( = ?auto_290074 ?auto_290077 ) ) ( not ( = ?auto_290074 ?auto_290078 ) ) ( not ( = ?auto_290074 ?auto_290079 ) ) ( not ( = ?auto_290074 ?auto_290080 ) ) ( not ( = ?auto_290075 ?auto_290076 ) ) ( not ( = ?auto_290075 ?auto_290077 ) ) ( not ( = ?auto_290075 ?auto_290078 ) ) ( not ( = ?auto_290075 ?auto_290079 ) ) ( not ( = ?auto_290075 ?auto_290080 ) ) ( not ( = ?auto_290076 ?auto_290077 ) ) ( not ( = ?auto_290076 ?auto_290078 ) ) ( not ( = ?auto_290076 ?auto_290079 ) ) ( not ( = ?auto_290076 ?auto_290080 ) ) ( not ( = ?auto_290077 ?auto_290078 ) ) ( not ( = ?auto_290077 ?auto_290079 ) ) ( not ( = ?auto_290077 ?auto_290080 ) ) ( not ( = ?auto_290078 ?auto_290079 ) ) ( not ( = ?auto_290078 ?auto_290080 ) ) ( not ( = ?auto_290079 ?auto_290080 ) ) ( ON ?auto_290078 ?auto_290079 ) ( CLEAR ?auto_290076 ) ( ON ?auto_290077 ?auto_290078 ) ( CLEAR ?auto_290077 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_290068 ?auto_290069 ?auto_290070 ?auto_290071 ?auto_290072 ?auto_290073 ?auto_290074 ?auto_290075 ?auto_290076 ?auto_290077 )
      ( MAKE-12PILE ?auto_290068 ?auto_290069 ?auto_290070 ?auto_290071 ?auto_290072 ?auto_290073 ?auto_290074 ?auto_290075 ?auto_290076 ?auto_290077 ?auto_290078 ?auto_290079 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_290093 - BLOCK
      ?auto_290094 - BLOCK
      ?auto_290095 - BLOCK
      ?auto_290096 - BLOCK
      ?auto_290097 - BLOCK
      ?auto_290098 - BLOCK
      ?auto_290099 - BLOCK
      ?auto_290100 - BLOCK
      ?auto_290101 - BLOCK
      ?auto_290102 - BLOCK
      ?auto_290103 - BLOCK
      ?auto_290104 - BLOCK
    )
    :vars
    (
      ?auto_290105 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290104 ?auto_290105 ) ( ON-TABLE ?auto_290093 ) ( ON ?auto_290094 ?auto_290093 ) ( ON ?auto_290095 ?auto_290094 ) ( ON ?auto_290096 ?auto_290095 ) ( ON ?auto_290097 ?auto_290096 ) ( ON ?auto_290098 ?auto_290097 ) ( ON ?auto_290099 ?auto_290098 ) ( ON ?auto_290100 ?auto_290099 ) ( not ( = ?auto_290093 ?auto_290094 ) ) ( not ( = ?auto_290093 ?auto_290095 ) ) ( not ( = ?auto_290093 ?auto_290096 ) ) ( not ( = ?auto_290093 ?auto_290097 ) ) ( not ( = ?auto_290093 ?auto_290098 ) ) ( not ( = ?auto_290093 ?auto_290099 ) ) ( not ( = ?auto_290093 ?auto_290100 ) ) ( not ( = ?auto_290093 ?auto_290101 ) ) ( not ( = ?auto_290093 ?auto_290102 ) ) ( not ( = ?auto_290093 ?auto_290103 ) ) ( not ( = ?auto_290093 ?auto_290104 ) ) ( not ( = ?auto_290093 ?auto_290105 ) ) ( not ( = ?auto_290094 ?auto_290095 ) ) ( not ( = ?auto_290094 ?auto_290096 ) ) ( not ( = ?auto_290094 ?auto_290097 ) ) ( not ( = ?auto_290094 ?auto_290098 ) ) ( not ( = ?auto_290094 ?auto_290099 ) ) ( not ( = ?auto_290094 ?auto_290100 ) ) ( not ( = ?auto_290094 ?auto_290101 ) ) ( not ( = ?auto_290094 ?auto_290102 ) ) ( not ( = ?auto_290094 ?auto_290103 ) ) ( not ( = ?auto_290094 ?auto_290104 ) ) ( not ( = ?auto_290094 ?auto_290105 ) ) ( not ( = ?auto_290095 ?auto_290096 ) ) ( not ( = ?auto_290095 ?auto_290097 ) ) ( not ( = ?auto_290095 ?auto_290098 ) ) ( not ( = ?auto_290095 ?auto_290099 ) ) ( not ( = ?auto_290095 ?auto_290100 ) ) ( not ( = ?auto_290095 ?auto_290101 ) ) ( not ( = ?auto_290095 ?auto_290102 ) ) ( not ( = ?auto_290095 ?auto_290103 ) ) ( not ( = ?auto_290095 ?auto_290104 ) ) ( not ( = ?auto_290095 ?auto_290105 ) ) ( not ( = ?auto_290096 ?auto_290097 ) ) ( not ( = ?auto_290096 ?auto_290098 ) ) ( not ( = ?auto_290096 ?auto_290099 ) ) ( not ( = ?auto_290096 ?auto_290100 ) ) ( not ( = ?auto_290096 ?auto_290101 ) ) ( not ( = ?auto_290096 ?auto_290102 ) ) ( not ( = ?auto_290096 ?auto_290103 ) ) ( not ( = ?auto_290096 ?auto_290104 ) ) ( not ( = ?auto_290096 ?auto_290105 ) ) ( not ( = ?auto_290097 ?auto_290098 ) ) ( not ( = ?auto_290097 ?auto_290099 ) ) ( not ( = ?auto_290097 ?auto_290100 ) ) ( not ( = ?auto_290097 ?auto_290101 ) ) ( not ( = ?auto_290097 ?auto_290102 ) ) ( not ( = ?auto_290097 ?auto_290103 ) ) ( not ( = ?auto_290097 ?auto_290104 ) ) ( not ( = ?auto_290097 ?auto_290105 ) ) ( not ( = ?auto_290098 ?auto_290099 ) ) ( not ( = ?auto_290098 ?auto_290100 ) ) ( not ( = ?auto_290098 ?auto_290101 ) ) ( not ( = ?auto_290098 ?auto_290102 ) ) ( not ( = ?auto_290098 ?auto_290103 ) ) ( not ( = ?auto_290098 ?auto_290104 ) ) ( not ( = ?auto_290098 ?auto_290105 ) ) ( not ( = ?auto_290099 ?auto_290100 ) ) ( not ( = ?auto_290099 ?auto_290101 ) ) ( not ( = ?auto_290099 ?auto_290102 ) ) ( not ( = ?auto_290099 ?auto_290103 ) ) ( not ( = ?auto_290099 ?auto_290104 ) ) ( not ( = ?auto_290099 ?auto_290105 ) ) ( not ( = ?auto_290100 ?auto_290101 ) ) ( not ( = ?auto_290100 ?auto_290102 ) ) ( not ( = ?auto_290100 ?auto_290103 ) ) ( not ( = ?auto_290100 ?auto_290104 ) ) ( not ( = ?auto_290100 ?auto_290105 ) ) ( not ( = ?auto_290101 ?auto_290102 ) ) ( not ( = ?auto_290101 ?auto_290103 ) ) ( not ( = ?auto_290101 ?auto_290104 ) ) ( not ( = ?auto_290101 ?auto_290105 ) ) ( not ( = ?auto_290102 ?auto_290103 ) ) ( not ( = ?auto_290102 ?auto_290104 ) ) ( not ( = ?auto_290102 ?auto_290105 ) ) ( not ( = ?auto_290103 ?auto_290104 ) ) ( not ( = ?auto_290103 ?auto_290105 ) ) ( not ( = ?auto_290104 ?auto_290105 ) ) ( ON ?auto_290103 ?auto_290104 ) ( ON ?auto_290102 ?auto_290103 ) ( CLEAR ?auto_290100 ) ( ON ?auto_290101 ?auto_290102 ) ( CLEAR ?auto_290101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_290093 ?auto_290094 ?auto_290095 ?auto_290096 ?auto_290097 ?auto_290098 ?auto_290099 ?auto_290100 ?auto_290101 )
      ( MAKE-12PILE ?auto_290093 ?auto_290094 ?auto_290095 ?auto_290096 ?auto_290097 ?auto_290098 ?auto_290099 ?auto_290100 ?auto_290101 ?auto_290102 ?auto_290103 ?auto_290104 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_290118 - BLOCK
      ?auto_290119 - BLOCK
      ?auto_290120 - BLOCK
      ?auto_290121 - BLOCK
      ?auto_290122 - BLOCK
      ?auto_290123 - BLOCK
      ?auto_290124 - BLOCK
      ?auto_290125 - BLOCK
      ?auto_290126 - BLOCK
      ?auto_290127 - BLOCK
      ?auto_290128 - BLOCK
      ?auto_290129 - BLOCK
    )
    :vars
    (
      ?auto_290130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290129 ?auto_290130 ) ( ON-TABLE ?auto_290118 ) ( ON ?auto_290119 ?auto_290118 ) ( ON ?auto_290120 ?auto_290119 ) ( ON ?auto_290121 ?auto_290120 ) ( ON ?auto_290122 ?auto_290121 ) ( ON ?auto_290123 ?auto_290122 ) ( ON ?auto_290124 ?auto_290123 ) ( ON ?auto_290125 ?auto_290124 ) ( not ( = ?auto_290118 ?auto_290119 ) ) ( not ( = ?auto_290118 ?auto_290120 ) ) ( not ( = ?auto_290118 ?auto_290121 ) ) ( not ( = ?auto_290118 ?auto_290122 ) ) ( not ( = ?auto_290118 ?auto_290123 ) ) ( not ( = ?auto_290118 ?auto_290124 ) ) ( not ( = ?auto_290118 ?auto_290125 ) ) ( not ( = ?auto_290118 ?auto_290126 ) ) ( not ( = ?auto_290118 ?auto_290127 ) ) ( not ( = ?auto_290118 ?auto_290128 ) ) ( not ( = ?auto_290118 ?auto_290129 ) ) ( not ( = ?auto_290118 ?auto_290130 ) ) ( not ( = ?auto_290119 ?auto_290120 ) ) ( not ( = ?auto_290119 ?auto_290121 ) ) ( not ( = ?auto_290119 ?auto_290122 ) ) ( not ( = ?auto_290119 ?auto_290123 ) ) ( not ( = ?auto_290119 ?auto_290124 ) ) ( not ( = ?auto_290119 ?auto_290125 ) ) ( not ( = ?auto_290119 ?auto_290126 ) ) ( not ( = ?auto_290119 ?auto_290127 ) ) ( not ( = ?auto_290119 ?auto_290128 ) ) ( not ( = ?auto_290119 ?auto_290129 ) ) ( not ( = ?auto_290119 ?auto_290130 ) ) ( not ( = ?auto_290120 ?auto_290121 ) ) ( not ( = ?auto_290120 ?auto_290122 ) ) ( not ( = ?auto_290120 ?auto_290123 ) ) ( not ( = ?auto_290120 ?auto_290124 ) ) ( not ( = ?auto_290120 ?auto_290125 ) ) ( not ( = ?auto_290120 ?auto_290126 ) ) ( not ( = ?auto_290120 ?auto_290127 ) ) ( not ( = ?auto_290120 ?auto_290128 ) ) ( not ( = ?auto_290120 ?auto_290129 ) ) ( not ( = ?auto_290120 ?auto_290130 ) ) ( not ( = ?auto_290121 ?auto_290122 ) ) ( not ( = ?auto_290121 ?auto_290123 ) ) ( not ( = ?auto_290121 ?auto_290124 ) ) ( not ( = ?auto_290121 ?auto_290125 ) ) ( not ( = ?auto_290121 ?auto_290126 ) ) ( not ( = ?auto_290121 ?auto_290127 ) ) ( not ( = ?auto_290121 ?auto_290128 ) ) ( not ( = ?auto_290121 ?auto_290129 ) ) ( not ( = ?auto_290121 ?auto_290130 ) ) ( not ( = ?auto_290122 ?auto_290123 ) ) ( not ( = ?auto_290122 ?auto_290124 ) ) ( not ( = ?auto_290122 ?auto_290125 ) ) ( not ( = ?auto_290122 ?auto_290126 ) ) ( not ( = ?auto_290122 ?auto_290127 ) ) ( not ( = ?auto_290122 ?auto_290128 ) ) ( not ( = ?auto_290122 ?auto_290129 ) ) ( not ( = ?auto_290122 ?auto_290130 ) ) ( not ( = ?auto_290123 ?auto_290124 ) ) ( not ( = ?auto_290123 ?auto_290125 ) ) ( not ( = ?auto_290123 ?auto_290126 ) ) ( not ( = ?auto_290123 ?auto_290127 ) ) ( not ( = ?auto_290123 ?auto_290128 ) ) ( not ( = ?auto_290123 ?auto_290129 ) ) ( not ( = ?auto_290123 ?auto_290130 ) ) ( not ( = ?auto_290124 ?auto_290125 ) ) ( not ( = ?auto_290124 ?auto_290126 ) ) ( not ( = ?auto_290124 ?auto_290127 ) ) ( not ( = ?auto_290124 ?auto_290128 ) ) ( not ( = ?auto_290124 ?auto_290129 ) ) ( not ( = ?auto_290124 ?auto_290130 ) ) ( not ( = ?auto_290125 ?auto_290126 ) ) ( not ( = ?auto_290125 ?auto_290127 ) ) ( not ( = ?auto_290125 ?auto_290128 ) ) ( not ( = ?auto_290125 ?auto_290129 ) ) ( not ( = ?auto_290125 ?auto_290130 ) ) ( not ( = ?auto_290126 ?auto_290127 ) ) ( not ( = ?auto_290126 ?auto_290128 ) ) ( not ( = ?auto_290126 ?auto_290129 ) ) ( not ( = ?auto_290126 ?auto_290130 ) ) ( not ( = ?auto_290127 ?auto_290128 ) ) ( not ( = ?auto_290127 ?auto_290129 ) ) ( not ( = ?auto_290127 ?auto_290130 ) ) ( not ( = ?auto_290128 ?auto_290129 ) ) ( not ( = ?auto_290128 ?auto_290130 ) ) ( not ( = ?auto_290129 ?auto_290130 ) ) ( ON ?auto_290128 ?auto_290129 ) ( ON ?auto_290127 ?auto_290128 ) ( CLEAR ?auto_290125 ) ( ON ?auto_290126 ?auto_290127 ) ( CLEAR ?auto_290126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_290118 ?auto_290119 ?auto_290120 ?auto_290121 ?auto_290122 ?auto_290123 ?auto_290124 ?auto_290125 ?auto_290126 )
      ( MAKE-12PILE ?auto_290118 ?auto_290119 ?auto_290120 ?auto_290121 ?auto_290122 ?auto_290123 ?auto_290124 ?auto_290125 ?auto_290126 ?auto_290127 ?auto_290128 ?auto_290129 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_290143 - BLOCK
      ?auto_290144 - BLOCK
      ?auto_290145 - BLOCK
      ?auto_290146 - BLOCK
      ?auto_290147 - BLOCK
      ?auto_290148 - BLOCK
      ?auto_290149 - BLOCK
      ?auto_290150 - BLOCK
      ?auto_290151 - BLOCK
      ?auto_290152 - BLOCK
      ?auto_290153 - BLOCK
      ?auto_290154 - BLOCK
    )
    :vars
    (
      ?auto_290155 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290154 ?auto_290155 ) ( ON-TABLE ?auto_290143 ) ( ON ?auto_290144 ?auto_290143 ) ( ON ?auto_290145 ?auto_290144 ) ( ON ?auto_290146 ?auto_290145 ) ( ON ?auto_290147 ?auto_290146 ) ( ON ?auto_290148 ?auto_290147 ) ( ON ?auto_290149 ?auto_290148 ) ( not ( = ?auto_290143 ?auto_290144 ) ) ( not ( = ?auto_290143 ?auto_290145 ) ) ( not ( = ?auto_290143 ?auto_290146 ) ) ( not ( = ?auto_290143 ?auto_290147 ) ) ( not ( = ?auto_290143 ?auto_290148 ) ) ( not ( = ?auto_290143 ?auto_290149 ) ) ( not ( = ?auto_290143 ?auto_290150 ) ) ( not ( = ?auto_290143 ?auto_290151 ) ) ( not ( = ?auto_290143 ?auto_290152 ) ) ( not ( = ?auto_290143 ?auto_290153 ) ) ( not ( = ?auto_290143 ?auto_290154 ) ) ( not ( = ?auto_290143 ?auto_290155 ) ) ( not ( = ?auto_290144 ?auto_290145 ) ) ( not ( = ?auto_290144 ?auto_290146 ) ) ( not ( = ?auto_290144 ?auto_290147 ) ) ( not ( = ?auto_290144 ?auto_290148 ) ) ( not ( = ?auto_290144 ?auto_290149 ) ) ( not ( = ?auto_290144 ?auto_290150 ) ) ( not ( = ?auto_290144 ?auto_290151 ) ) ( not ( = ?auto_290144 ?auto_290152 ) ) ( not ( = ?auto_290144 ?auto_290153 ) ) ( not ( = ?auto_290144 ?auto_290154 ) ) ( not ( = ?auto_290144 ?auto_290155 ) ) ( not ( = ?auto_290145 ?auto_290146 ) ) ( not ( = ?auto_290145 ?auto_290147 ) ) ( not ( = ?auto_290145 ?auto_290148 ) ) ( not ( = ?auto_290145 ?auto_290149 ) ) ( not ( = ?auto_290145 ?auto_290150 ) ) ( not ( = ?auto_290145 ?auto_290151 ) ) ( not ( = ?auto_290145 ?auto_290152 ) ) ( not ( = ?auto_290145 ?auto_290153 ) ) ( not ( = ?auto_290145 ?auto_290154 ) ) ( not ( = ?auto_290145 ?auto_290155 ) ) ( not ( = ?auto_290146 ?auto_290147 ) ) ( not ( = ?auto_290146 ?auto_290148 ) ) ( not ( = ?auto_290146 ?auto_290149 ) ) ( not ( = ?auto_290146 ?auto_290150 ) ) ( not ( = ?auto_290146 ?auto_290151 ) ) ( not ( = ?auto_290146 ?auto_290152 ) ) ( not ( = ?auto_290146 ?auto_290153 ) ) ( not ( = ?auto_290146 ?auto_290154 ) ) ( not ( = ?auto_290146 ?auto_290155 ) ) ( not ( = ?auto_290147 ?auto_290148 ) ) ( not ( = ?auto_290147 ?auto_290149 ) ) ( not ( = ?auto_290147 ?auto_290150 ) ) ( not ( = ?auto_290147 ?auto_290151 ) ) ( not ( = ?auto_290147 ?auto_290152 ) ) ( not ( = ?auto_290147 ?auto_290153 ) ) ( not ( = ?auto_290147 ?auto_290154 ) ) ( not ( = ?auto_290147 ?auto_290155 ) ) ( not ( = ?auto_290148 ?auto_290149 ) ) ( not ( = ?auto_290148 ?auto_290150 ) ) ( not ( = ?auto_290148 ?auto_290151 ) ) ( not ( = ?auto_290148 ?auto_290152 ) ) ( not ( = ?auto_290148 ?auto_290153 ) ) ( not ( = ?auto_290148 ?auto_290154 ) ) ( not ( = ?auto_290148 ?auto_290155 ) ) ( not ( = ?auto_290149 ?auto_290150 ) ) ( not ( = ?auto_290149 ?auto_290151 ) ) ( not ( = ?auto_290149 ?auto_290152 ) ) ( not ( = ?auto_290149 ?auto_290153 ) ) ( not ( = ?auto_290149 ?auto_290154 ) ) ( not ( = ?auto_290149 ?auto_290155 ) ) ( not ( = ?auto_290150 ?auto_290151 ) ) ( not ( = ?auto_290150 ?auto_290152 ) ) ( not ( = ?auto_290150 ?auto_290153 ) ) ( not ( = ?auto_290150 ?auto_290154 ) ) ( not ( = ?auto_290150 ?auto_290155 ) ) ( not ( = ?auto_290151 ?auto_290152 ) ) ( not ( = ?auto_290151 ?auto_290153 ) ) ( not ( = ?auto_290151 ?auto_290154 ) ) ( not ( = ?auto_290151 ?auto_290155 ) ) ( not ( = ?auto_290152 ?auto_290153 ) ) ( not ( = ?auto_290152 ?auto_290154 ) ) ( not ( = ?auto_290152 ?auto_290155 ) ) ( not ( = ?auto_290153 ?auto_290154 ) ) ( not ( = ?auto_290153 ?auto_290155 ) ) ( not ( = ?auto_290154 ?auto_290155 ) ) ( ON ?auto_290153 ?auto_290154 ) ( ON ?auto_290152 ?auto_290153 ) ( ON ?auto_290151 ?auto_290152 ) ( CLEAR ?auto_290149 ) ( ON ?auto_290150 ?auto_290151 ) ( CLEAR ?auto_290150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_290143 ?auto_290144 ?auto_290145 ?auto_290146 ?auto_290147 ?auto_290148 ?auto_290149 ?auto_290150 )
      ( MAKE-12PILE ?auto_290143 ?auto_290144 ?auto_290145 ?auto_290146 ?auto_290147 ?auto_290148 ?auto_290149 ?auto_290150 ?auto_290151 ?auto_290152 ?auto_290153 ?auto_290154 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_290168 - BLOCK
      ?auto_290169 - BLOCK
      ?auto_290170 - BLOCK
      ?auto_290171 - BLOCK
      ?auto_290172 - BLOCK
      ?auto_290173 - BLOCK
      ?auto_290174 - BLOCK
      ?auto_290175 - BLOCK
      ?auto_290176 - BLOCK
      ?auto_290177 - BLOCK
      ?auto_290178 - BLOCK
      ?auto_290179 - BLOCK
    )
    :vars
    (
      ?auto_290180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290179 ?auto_290180 ) ( ON-TABLE ?auto_290168 ) ( ON ?auto_290169 ?auto_290168 ) ( ON ?auto_290170 ?auto_290169 ) ( ON ?auto_290171 ?auto_290170 ) ( ON ?auto_290172 ?auto_290171 ) ( ON ?auto_290173 ?auto_290172 ) ( ON ?auto_290174 ?auto_290173 ) ( not ( = ?auto_290168 ?auto_290169 ) ) ( not ( = ?auto_290168 ?auto_290170 ) ) ( not ( = ?auto_290168 ?auto_290171 ) ) ( not ( = ?auto_290168 ?auto_290172 ) ) ( not ( = ?auto_290168 ?auto_290173 ) ) ( not ( = ?auto_290168 ?auto_290174 ) ) ( not ( = ?auto_290168 ?auto_290175 ) ) ( not ( = ?auto_290168 ?auto_290176 ) ) ( not ( = ?auto_290168 ?auto_290177 ) ) ( not ( = ?auto_290168 ?auto_290178 ) ) ( not ( = ?auto_290168 ?auto_290179 ) ) ( not ( = ?auto_290168 ?auto_290180 ) ) ( not ( = ?auto_290169 ?auto_290170 ) ) ( not ( = ?auto_290169 ?auto_290171 ) ) ( not ( = ?auto_290169 ?auto_290172 ) ) ( not ( = ?auto_290169 ?auto_290173 ) ) ( not ( = ?auto_290169 ?auto_290174 ) ) ( not ( = ?auto_290169 ?auto_290175 ) ) ( not ( = ?auto_290169 ?auto_290176 ) ) ( not ( = ?auto_290169 ?auto_290177 ) ) ( not ( = ?auto_290169 ?auto_290178 ) ) ( not ( = ?auto_290169 ?auto_290179 ) ) ( not ( = ?auto_290169 ?auto_290180 ) ) ( not ( = ?auto_290170 ?auto_290171 ) ) ( not ( = ?auto_290170 ?auto_290172 ) ) ( not ( = ?auto_290170 ?auto_290173 ) ) ( not ( = ?auto_290170 ?auto_290174 ) ) ( not ( = ?auto_290170 ?auto_290175 ) ) ( not ( = ?auto_290170 ?auto_290176 ) ) ( not ( = ?auto_290170 ?auto_290177 ) ) ( not ( = ?auto_290170 ?auto_290178 ) ) ( not ( = ?auto_290170 ?auto_290179 ) ) ( not ( = ?auto_290170 ?auto_290180 ) ) ( not ( = ?auto_290171 ?auto_290172 ) ) ( not ( = ?auto_290171 ?auto_290173 ) ) ( not ( = ?auto_290171 ?auto_290174 ) ) ( not ( = ?auto_290171 ?auto_290175 ) ) ( not ( = ?auto_290171 ?auto_290176 ) ) ( not ( = ?auto_290171 ?auto_290177 ) ) ( not ( = ?auto_290171 ?auto_290178 ) ) ( not ( = ?auto_290171 ?auto_290179 ) ) ( not ( = ?auto_290171 ?auto_290180 ) ) ( not ( = ?auto_290172 ?auto_290173 ) ) ( not ( = ?auto_290172 ?auto_290174 ) ) ( not ( = ?auto_290172 ?auto_290175 ) ) ( not ( = ?auto_290172 ?auto_290176 ) ) ( not ( = ?auto_290172 ?auto_290177 ) ) ( not ( = ?auto_290172 ?auto_290178 ) ) ( not ( = ?auto_290172 ?auto_290179 ) ) ( not ( = ?auto_290172 ?auto_290180 ) ) ( not ( = ?auto_290173 ?auto_290174 ) ) ( not ( = ?auto_290173 ?auto_290175 ) ) ( not ( = ?auto_290173 ?auto_290176 ) ) ( not ( = ?auto_290173 ?auto_290177 ) ) ( not ( = ?auto_290173 ?auto_290178 ) ) ( not ( = ?auto_290173 ?auto_290179 ) ) ( not ( = ?auto_290173 ?auto_290180 ) ) ( not ( = ?auto_290174 ?auto_290175 ) ) ( not ( = ?auto_290174 ?auto_290176 ) ) ( not ( = ?auto_290174 ?auto_290177 ) ) ( not ( = ?auto_290174 ?auto_290178 ) ) ( not ( = ?auto_290174 ?auto_290179 ) ) ( not ( = ?auto_290174 ?auto_290180 ) ) ( not ( = ?auto_290175 ?auto_290176 ) ) ( not ( = ?auto_290175 ?auto_290177 ) ) ( not ( = ?auto_290175 ?auto_290178 ) ) ( not ( = ?auto_290175 ?auto_290179 ) ) ( not ( = ?auto_290175 ?auto_290180 ) ) ( not ( = ?auto_290176 ?auto_290177 ) ) ( not ( = ?auto_290176 ?auto_290178 ) ) ( not ( = ?auto_290176 ?auto_290179 ) ) ( not ( = ?auto_290176 ?auto_290180 ) ) ( not ( = ?auto_290177 ?auto_290178 ) ) ( not ( = ?auto_290177 ?auto_290179 ) ) ( not ( = ?auto_290177 ?auto_290180 ) ) ( not ( = ?auto_290178 ?auto_290179 ) ) ( not ( = ?auto_290178 ?auto_290180 ) ) ( not ( = ?auto_290179 ?auto_290180 ) ) ( ON ?auto_290178 ?auto_290179 ) ( ON ?auto_290177 ?auto_290178 ) ( ON ?auto_290176 ?auto_290177 ) ( CLEAR ?auto_290174 ) ( ON ?auto_290175 ?auto_290176 ) ( CLEAR ?auto_290175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_290168 ?auto_290169 ?auto_290170 ?auto_290171 ?auto_290172 ?auto_290173 ?auto_290174 ?auto_290175 )
      ( MAKE-12PILE ?auto_290168 ?auto_290169 ?auto_290170 ?auto_290171 ?auto_290172 ?auto_290173 ?auto_290174 ?auto_290175 ?auto_290176 ?auto_290177 ?auto_290178 ?auto_290179 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_290193 - BLOCK
      ?auto_290194 - BLOCK
      ?auto_290195 - BLOCK
      ?auto_290196 - BLOCK
      ?auto_290197 - BLOCK
      ?auto_290198 - BLOCK
      ?auto_290199 - BLOCK
      ?auto_290200 - BLOCK
      ?auto_290201 - BLOCK
      ?auto_290202 - BLOCK
      ?auto_290203 - BLOCK
      ?auto_290204 - BLOCK
    )
    :vars
    (
      ?auto_290205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290204 ?auto_290205 ) ( ON-TABLE ?auto_290193 ) ( ON ?auto_290194 ?auto_290193 ) ( ON ?auto_290195 ?auto_290194 ) ( ON ?auto_290196 ?auto_290195 ) ( ON ?auto_290197 ?auto_290196 ) ( ON ?auto_290198 ?auto_290197 ) ( not ( = ?auto_290193 ?auto_290194 ) ) ( not ( = ?auto_290193 ?auto_290195 ) ) ( not ( = ?auto_290193 ?auto_290196 ) ) ( not ( = ?auto_290193 ?auto_290197 ) ) ( not ( = ?auto_290193 ?auto_290198 ) ) ( not ( = ?auto_290193 ?auto_290199 ) ) ( not ( = ?auto_290193 ?auto_290200 ) ) ( not ( = ?auto_290193 ?auto_290201 ) ) ( not ( = ?auto_290193 ?auto_290202 ) ) ( not ( = ?auto_290193 ?auto_290203 ) ) ( not ( = ?auto_290193 ?auto_290204 ) ) ( not ( = ?auto_290193 ?auto_290205 ) ) ( not ( = ?auto_290194 ?auto_290195 ) ) ( not ( = ?auto_290194 ?auto_290196 ) ) ( not ( = ?auto_290194 ?auto_290197 ) ) ( not ( = ?auto_290194 ?auto_290198 ) ) ( not ( = ?auto_290194 ?auto_290199 ) ) ( not ( = ?auto_290194 ?auto_290200 ) ) ( not ( = ?auto_290194 ?auto_290201 ) ) ( not ( = ?auto_290194 ?auto_290202 ) ) ( not ( = ?auto_290194 ?auto_290203 ) ) ( not ( = ?auto_290194 ?auto_290204 ) ) ( not ( = ?auto_290194 ?auto_290205 ) ) ( not ( = ?auto_290195 ?auto_290196 ) ) ( not ( = ?auto_290195 ?auto_290197 ) ) ( not ( = ?auto_290195 ?auto_290198 ) ) ( not ( = ?auto_290195 ?auto_290199 ) ) ( not ( = ?auto_290195 ?auto_290200 ) ) ( not ( = ?auto_290195 ?auto_290201 ) ) ( not ( = ?auto_290195 ?auto_290202 ) ) ( not ( = ?auto_290195 ?auto_290203 ) ) ( not ( = ?auto_290195 ?auto_290204 ) ) ( not ( = ?auto_290195 ?auto_290205 ) ) ( not ( = ?auto_290196 ?auto_290197 ) ) ( not ( = ?auto_290196 ?auto_290198 ) ) ( not ( = ?auto_290196 ?auto_290199 ) ) ( not ( = ?auto_290196 ?auto_290200 ) ) ( not ( = ?auto_290196 ?auto_290201 ) ) ( not ( = ?auto_290196 ?auto_290202 ) ) ( not ( = ?auto_290196 ?auto_290203 ) ) ( not ( = ?auto_290196 ?auto_290204 ) ) ( not ( = ?auto_290196 ?auto_290205 ) ) ( not ( = ?auto_290197 ?auto_290198 ) ) ( not ( = ?auto_290197 ?auto_290199 ) ) ( not ( = ?auto_290197 ?auto_290200 ) ) ( not ( = ?auto_290197 ?auto_290201 ) ) ( not ( = ?auto_290197 ?auto_290202 ) ) ( not ( = ?auto_290197 ?auto_290203 ) ) ( not ( = ?auto_290197 ?auto_290204 ) ) ( not ( = ?auto_290197 ?auto_290205 ) ) ( not ( = ?auto_290198 ?auto_290199 ) ) ( not ( = ?auto_290198 ?auto_290200 ) ) ( not ( = ?auto_290198 ?auto_290201 ) ) ( not ( = ?auto_290198 ?auto_290202 ) ) ( not ( = ?auto_290198 ?auto_290203 ) ) ( not ( = ?auto_290198 ?auto_290204 ) ) ( not ( = ?auto_290198 ?auto_290205 ) ) ( not ( = ?auto_290199 ?auto_290200 ) ) ( not ( = ?auto_290199 ?auto_290201 ) ) ( not ( = ?auto_290199 ?auto_290202 ) ) ( not ( = ?auto_290199 ?auto_290203 ) ) ( not ( = ?auto_290199 ?auto_290204 ) ) ( not ( = ?auto_290199 ?auto_290205 ) ) ( not ( = ?auto_290200 ?auto_290201 ) ) ( not ( = ?auto_290200 ?auto_290202 ) ) ( not ( = ?auto_290200 ?auto_290203 ) ) ( not ( = ?auto_290200 ?auto_290204 ) ) ( not ( = ?auto_290200 ?auto_290205 ) ) ( not ( = ?auto_290201 ?auto_290202 ) ) ( not ( = ?auto_290201 ?auto_290203 ) ) ( not ( = ?auto_290201 ?auto_290204 ) ) ( not ( = ?auto_290201 ?auto_290205 ) ) ( not ( = ?auto_290202 ?auto_290203 ) ) ( not ( = ?auto_290202 ?auto_290204 ) ) ( not ( = ?auto_290202 ?auto_290205 ) ) ( not ( = ?auto_290203 ?auto_290204 ) ) ( not ( = ?auto_290203 ?auto_290205 ) ) ( not ( = ?auto_290204 ?auto_290205 ) ) ( ON ?auto_290203 ?auto_290204 ) ( ON ?auto_290202 ?auto_290203 ) ( ON ?auto_290201 ?auto_290202 ) ( ON ?auto_290200 ?auto_290201 ) ( CLEAR ?auto_290198 ) ( ON ?auto_290199 ?auto_290200 ) ( CLEAR ?auto_290199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_290193 ?auto_290194 ?auto_290195 ?auto_290196 ?auto_290197 ?auto_290198 ?auto_290199 )
      ( MAKE-12PILE ?auto_290193 ?auto_290194 ?auto_290195 ?auto_290196 ?auto_290197 ?auto_290198 ?auto_290199 ?auto_290200 ?auto_290201 ?auto_290202 ?auto_290203 ?auto_290204 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_290218 - BLOCK
      ?auto_290219 - BLOCK
      ?auto_290220 - BLOCK
      ?auto_290221 - BLOCK
      ?auto_290222 - BLOCK
      ?auto_290223 - BLOCK
      ?auto_290224 - BLOCK
      ?auto_290225 - BLOCK
      ?auto_290226 - BLOCK
      ?auto_290227 - BLOCK
      ?auto_290228 - BLOCK
      ?auto_290229 - BLOCK
    )
    :vars
    (
      ?auto_290230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290229 ?auto_290230 ) ( ON-TABLE ?auto_290218 ) ( ON ?auto_290219 ?auto_290218 ) ( ON ?auto_290220 ?auto_290219 ) ( ON ?auto_290221 ?auto_290220 ) ( ON ?auto_290222 ?auto_290221 ) ( ON ?auto_290223 ?auto_290222 ) ( not ( = ?auto_290218 ?auto_290219 ) ) ( not ( = ?auto_290218 ?auto_290220 ) ) ( not ( = ?auto_290218 ?auto_290221 ) ) ( not ( = ?auto_290218 ?auto_290222 ) ) ( not ( = ?auto_290218 ?auto_290223 ) ) ( not ( = ?auto_290218 ?auto_290224 ) ) ( not ( = ?auto_290218 ?auto_290225 ) ) ( not ( = ?auto_290218 ?auto_290226 ) ) ( not ( = ?auto_290218 ?auto_290227 ) ) ( not ( = ?auto_290218 ?auto_290228 ) ) ( not ( = ?auto_290218 ?auto_290229 ) ) ( not ( = ?auto_290218 ?auto_290230 ) ) ( not ( = ?auto_290219 ?auto_290220 ) ) ( not ( = ?auto_290219 ?auto_290221 ) ) ( not ( = ?auto_290219 ?auto_290222 ) ) ( not ( = ?auto_290219 ?auto_290223 ) ) ( not ( = ?auto_290219 ?auto_290224 ) ) ( not ( = ?auto_290219 ?auto_290225 ) ) ( not ( = ?auto_290219 ?auto_290226 ) ) ( not ( = ?auto_290219 ?auto_290227 ) ) ( not ( = ?auto_290219 ?auto_290228 ) ) ( not ( = ?auto_290219 ?auto_290229 ) ) ( not ( = ?auto_290219 ?auto_290230 ) ) ( not ( = ?auto_290220 ?auto_290221 ) ) ( not ( = ?auto_290220 ?auto_290222 ) ) ( not ( = ?auto_290220 ?auto_290223 ) ) ( not ( = ?auto_290220 ?auto_290224 ) ) ( not ( = ?auto_290220 ?auto_290225 ) ) ( not ( = ?auto_290220 ?auto_290226 ) ) ( not ( = ?auto_290220 ?auto_290227 ) ) ( not ( = ?auto_290220 ?auto_290228 ) ) ( not ( = ?auto_290220 ?auto_290229 ) ) ( not ( = ?auto_290220 ?auto_290230 ) ) ( not ( = ?auto_290221 ?auto_290222 ) ) ( not ( = ?auto_290221 ?auto_290223 ) ) ( not ( = ?auto_290221 ?auto_290224 ) ) ( not ( = ?auto_290221 ?auto_290225 ) ) ( not ( = ?auto_290221 ?auto_290226 ) ) ( not ( = ?auto_290221 ?auto_290227 ) ) ( not ( = ?auto_290221 ?auto_290228 ) ) ( not ( = ?auto_290221 ?auto_290229 ) ) ( not ( = ?auto_290221 ?auto_290230 ) ) ( not ( = ?auto_290222 ?auto_290223 ) ) ( not ( = ?auto_290222 ?auto_290224 ) ) ( not ( = ?auto_290222 ?auto_290225 ) ) ( not ( = ?auto_290222 ?auto_290226 ) ) ( not ( = ?auto_290222 ?auto_290227 ) ) ( not ( = ?auto_290222 ?auto_290228 ) ) ( not ( = ?auto_290222 ?auto_290229 ) ) ( not ( = ?auto_290222 ?auto_290230 ) ) ( not ( = ?auto_290223 ?auto_290224 ) ) ( not ( = ?auto_290223 ?auto_290225 ) ) ( not ( = ?auto_290223 ?auto_290226 ) ) ( not ( = ?auto_290223 ?auto_290227 ) ) ( not ( = ?auto_290223 ?auto_290228 ) ) ( not ( = ?auto_290223 ?auto_290229 ) ) ( not ( = ?auto_290223 ?auto_290230 ) ) ( not ( = ?auto_290224 ?auto_290225 ) ) ( not ( = ?auto_290224 ?auto_290226 ) ) ( not ( = ?auto_290224 ?auto_290227 ) ) ( not ( = ?auto_290224 ?auto_290228 ) ) ( not ( = ?auto_290224 ?auto_290229 ) ) ( not ( = ?auto_290224 ?auto_290230 ) ) ( not ( = ?auto_290225 ?auto_290226 ) ) ( not ( = ?auto_290225 ?auto_290227 ) ) ( not ( = ?auto_290225 ?auto_290228 ) ) ( not ( = ?auto_290225 ?auto_290229 ) ) ( not ( = ?auto_290225 ?auto_290230 ) ) ( not ( = ?auto_290226 ?auto_290227 ) ) ( not ( = ?auto_290226 ?auto_290228 ) ) ( not ( = ?auto_290226 ?auto_290229 ) ) ( not ( = ?auto_290226 ?auto_290230 ) ) ( not ( = ?auto_290227 ?auto_290228 ) ) ( not ( = ?auto_290227 ?auto_290229 ) ) ( not ( = ?auto_290227 ?auto_290230 ) ) ( not ( = ?auto_290228 ?auto_290229 ) ) ( not ( = ?auto_290228 ?auto_290230 ) ) ( not ( = ?auto_290229 ?auto_290230 ) ) ( ON ?auto_290228 ?auto_290229 ) ( ON ?auto_290227 ?auto_290228 ) ( ON ?auto_290226 ?auto_290227 ) ( ON ?auto_290225 ?auto_290226 ) ( CLEAR ?auto_290223 ) ( ON ?auto_290224 ?auto_290225 ) ( CLEAR ?auto_290224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_290218 ?auto_290219 ?auto_290220 ?auto_290221 ?auto_290222 ?auto_290223 ?auto_290224 )
      ( MAKE-12PILE ?auto_290218 ?auto_290219 ?auto_290220 ?auto_290221 ?auto_290222 ?auto_290223 ?auto_290224 ?auto_290225 ?auto_290226 ?auto_290227 ?auto_290228 ?auto_290229 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_290243 - BLOCK
      ?auto_290244 - BLOCK
      ?auto_290245 - BLOCK
      ?auto_290246 - BLOCK
      ?auto_290247 - BLOCK
      ?auto_290248 - BLOCK
      ?auto_290249 - BLOCK
      ?auto_290250 - BLOCK
      ?auto_290251 - BLOCK
      ?auto_290252 - BLOCK
      ?auto_290253 - BLOCK
      ?auto_290254 - BLOCK
    )
    :vars
    (
      ?auto_290255 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290254 ?auto_290255 ) ( ON-TABLE ?auto_290243 ) ( ON ?auto_290244 ?auto_290243 ) ( ON ?auto_290245 ?auto_290244 ) ( ON ?auto_290246 ?auto_290245 ) ( ON ?auto_290247 ?auto_290246 ) ( not ( = ?auto_290243 ?auto_290244 ) ) ( not ( = ?auto_290243 ?auto_290245 ) ) ( not ( = ?auto_290243 ?auto_290246 ) ) ( not ( = ?auto_290243 ?auto_290247 ) ) ( not ( = ?auto_290243 ?auto_290248 ) ) ( not ( = ?auto_290243 ?auto_290249 ) ) ( not ( = ?auto_290243 ?auto_290250 ) ) ( not ( = ?auto_290243 ?auto_290251 ) ) ( not ( = ?auto_290243 ?auto_290252 ) ) ( not ( = ?auto_290243 ?auto_290253 ) ) ( not ( = ?auto_290243 ?auto_290254 ) ) ( not ( = ?auto_290243 ?auto_290255 ) ) ( not ( = ?auto_290244 ?auto_290245 ) ) ( not ( = ?auto_290244 ?auto_290246 ) ) ( not ( = ?auto_290244 ?auto_290247 ) ) ( not ( = ?auto_290244 ?auto_290248 ) ) ( not ( = ?auto_290244 ?auto_290249 ) ) ( not ( = ?auto_290244 ?auto_290250 ) ) ( not ( = ?auto_290244 ?auto_290251 ) ) ( not ( = ?auto_290244 ?auto_290252 ) ) ( not ( = ?auto_290244 ?auto_290253 ) ) ( not ( = ?auto_290244 ?auto_290254 ) ) ( not ( = ?auto_290244 ?auto_290255 ) ) ( not ( = ?auto_290245 ?auto_290246 ) ) ( not ( = ?auto_290245 ?auto_290247 ) ) ( not ( = ?auto_290245 ?auto_290248 ) ) ( not ( = ?auto_290245 ?auto_290249 ) ) ( not ( = ?auto_290245 ?auto_290250 ) ) ( not ( = ?auto_290245 ?auto_290251 ) ) ( not ( = ?auto_290245 ?auto_290252 ) ) ( not ( = ?auto_290245 ?auto_290253 ) ) ( not ( = ?auto_290245 ?auto_290254 ) ) ( not ( = ?auto_290245 ?auto_290255 ) ) ( not ( = ?auto_290246 ?auto_290247 ) ) ( not ( = ?auto_290246 ?auto_290248 ) ) ( not ( = ?auto_290246 ?auto_290249 ) ) ( not ( = ?auto_290246 ?auto_290250 ) ) ( not ( = ?auto_290246 ?auto_290251 ) ) ( not ( = ?auto_290246 ?auto_290252 ) ) ( not ( = ?auto_290246 ?auto_290253 ) ) ( not ( = ?auto_290246 ?auto_290254 ) ) ( not ( = ?auto_290246 ?auto_290255 ) ) ( not ( = ?auto_290247 ?auto_290248 ) ) ( not ( = ?auto_290247 ?auto_290249 ) ) ( not ( = ?auto_290247 ?auto_290250 ) ) ( not ( = ?auto_290247 ?auto_290251 ) ) ( not ( = ?auto_290247 ?auto_290252 ) ) ( not ( = ?auto_290247 ?auto_290253 ) ) ( not ( = ?auto_290247 ?auto_290254 ) ) ( not ( = ?auto_290247 ?auto_290255 ) ) ( not ( = ?auto_290248 ?auto_290249 ) ) ( not ( = ?auto_290248 ?auto_290250 ) ) ( not ( = ?auto_290248 ?auto_290251 ) ) ( not ( = ?auto_290248 ?auto_290252 ) ) ( not ( = ?auto_290248 ?auto_290253 ) ) ( not ( = ?auto_290248 ?auto_290254 ) ) ( not ( = ?auto_290248 ?auto_290255 ) ) ( not ( = ?auto_290249 ?auto_290250 ) ) ( not ( = ?auto_290249 ?auto_290251 ) ) ( not ( = ?auto_290249 ?auto_290252 ) ) ( not ( = ?auto_290249 ?auto_290253 ) ) ( not ( = ?auto_290249 ?auto_290254 ) ) ( not ( = ?auto_290249 ?auto_290255 ) ) ( not ( = ?auto_290250 ?auto_290251 ) ) ( not ( = ?auto_290250 ?auto_290252 ) ) ( not ( = ?auto_290250 ?auto_290253 ) ) ( not ( = ?auto_290250 ?auto_290254 ) ) ( not ( = ?auto_290250 ?auto_290255 ) ) ( not ( = ?auto_290251 ?auto_290252 ) ) ( not ( = ?auto_290251 ?auto_290253 ) ) ( not ( = ?auto_290251 ?auto_290254 ) ) ( not ( = ?auto_290251 ?auto_290255 ) ) ( not ( = ?auto_290252 ?auto_290253 ) ) ( not ( = ?auto_290252 ?auto_290254 ) ) ( not ( = ?auto_290252 ?auto_290255 ) ) ( not ( = ?auto_290253 ?auto_290254 ) ) ( not ( = ?auto_290253 ?auto_290255 ) ) ( not ( = ?auto_290254 ?auto_290255 ) ) ( ON ?auto_290253 ?auto_290254 ) ( ON ?auto_290252 ?auto_290253 ) ( ON ?auto_290251 ?auto_290252 ) ( ON ?auto_290250 ?auto_290251 ) ( ON ?auto_290249 ?auto_290250 ) ( CLEAR ?auto_290247 ) ( ON ?auto_290248 ?auto_290249 ) ( CLEAR ?auto_290248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_290243 ?auto_290244 ?auto_290245 ?auto_290246 ?auto_290247 ?auto_290248 )
      ( MAKE-12PILE ?auto_290243 ?auto_290244 ?auto_290245 ?auto_290246 ?auto_290247 ?auto_290248 ?auto_290249 ?auto_290250 ?auto_290251 ?auto_290252 ?auto_290253 ?auto_290254 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_290268 - BLOCK
      ?auto_290269 - BLOCK
      ?auto_290270 - BLOCK
      ?auto_290271 - BLOCK
      ?auto_290272 - BLOCK
      ?auto_290273 - BLOCK
      ?auto_290274 - BLOCK
      ?auto_290275 - BLOCK
      ?auto_290276 - BLOCK
      ?auto_290277 - BLOCK
      ?auto_290278 - BLOCK
      ?auto_290279 - BLOCK
    )
    :vars
    (
      ?auto_290280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290279 ?auto_290280 ) ( ON-TABLE ?auto_290268 ) ( ON ?auto_290269 ?auto_290268 ) ( ON ?auto_290270 ?auto_290269 ) ( ON ?auto_290271 ?auto_290270 ) ( ON ?auto_290272 ?auto_290271 ) ( not ( = ?auto_290268 ?auto_290269 ) ) ( not ( = ?auto_290268 ?auto_290270 ) ) ( not ( = ?auto_290268 ?auto_290271 ) ) ( not ( = ?auto_290268 ?auto_290272 ) ) ( not ( = ?auto_290268 ?auto_290273 ) ) ( not ( = ?auto_290268 ?auto_290274 ) ) ( not ( = ?auto_290268 ?auto_290275 ) ) ( not ( = ?auto_290268 ?auto_290276 ) ) ( not ( = ?auto_290268 ?auto_290277 ) ) ( not ( = ?auto_290268 ?auto_290278 ) ) ( not ( = ?auto_290268 ?auto_290279 ) ) ( not ( = ?auto_290268 ?auto_290280 ) ) ( not ( = ?auto_290269 ?auto_290270 ) ) ( not ( = ?auto_290269 ?auto_290271 ) ) ( not ( = ?auto_290269 ?auto_290272 ) ) ( not ( = ?auto_290269 ?auto_290273 ) ) ( not ( = ?auto_290269 ?auto_290274 ) ) ( not ( = ?auto_290269 ?auto_290275 ) ) ( not ( = ?auto_290269 ?auto_290276 ) ) ( not ( = ?auto_290269 ?auto_290277 ) ) ( not ( = ?auto_290269 ?auto_290278 ) ) ( not ( = ?auto_290269 ?auto_290279 ) ) ( not ( = ?auto_290269 ?auto_290280 ) ) ( not ( = ?auto_290270 ?auto_290271 ) ) ( not ( = ?auto_290270 ?auto_290272 ) ) ( not ( = ?auto_290270 ?auto_290273 ) ) ( not ( = ?auto_290270 ?auto_290274 ) ) ( not ( = ?auto_290270 ?auto_290275 ) ) ( not ( = ?auto_290270 ?auto_290276 ) ) ( not ( = ?auto_290270 ?auto_290277 ) ) ( not ( = ?auto_290270 ?auto_290278 ) ) ( not ( = ?auto_290270 ?auto_290279 ) ) ( not ( = ?auto_290270 ?auto_290280 ) ) ( not ( = ?auto_290271 ?auto_290272 ) ) ( not ( = ?auto_290271 ?auto_290273 ) ) ( not ( = ?auto_290271 ?auto_290274 ) ) ( not ( = ?auto_290271 ?auto_290275 ) ) ( not ( = ?auto_290271 ?auto_290276 ) ) ( not ( = ?auto_290271 ?auto_290277 ) ) ( not ( = ?auto_290271 ?auto_290278 ) ) ( not ( = ?auto_290271 ?auto_290279 ) ) ( not ( = ?auto_290271 ?auto_290280 ) ) ( not ( = ?auto_290272 ?auto_290273 ) ) ( not ( = ?auto_290272 ?auto_290274 ) ) ( not ( = ?auto_290272 ?auto_290275 ) ) ( not ( = ?auto_290272 ?auto_290276 ) ) ( not ( = ?auto_290272 ?auto_290277 ) ) ( not ( = ?auto_290272 ?auto_290278 ) ) ( not ( = ?auto_290272 ?auto_290279 ) ) ( not ( = ?auto_290272 ?auto_290280 ) ) ( not ( = ?auto_290273 ?auto_290274 ) ) ( not ( = ?auto_290273 ?auto_290275 ) ) ( not ( = ?auto_290273 ?auto_290276 ) ) ( not ( = ?auto_290273 ?auto_290277 ) ) ( not ( = ?auto_290273 ?auto_290278 ) ) ( not ( = ?auto_290273 ?auto_290279 ) ) ( not ( = ?auto_290273 ?auto_290280 ) ) ( not ( = ?auto_290274 ?auto_290275 ) ) ( not ( = ?auto_290274 ?auto_290276 ) ) ( not ( = ?auto_290274 ?auto_290277 ) ) ( not ( = ?auto_290274 ?auto_290278 ) ) ( not ( = ?auto_290274 ?auto_290279 ) ) ( not ( = ?auto_290274 ?auto_290280 ) ) ( not ( = ?auto_290275 ?auto_290276 ) ) ( not ( = ?auto_290275 ?auto_290277 ) ) ( not ( = ?auto_290275 ?auto_290278 ) ) ( not ( = ?auto_290275 ?auto_290279 ) ) ( not ( = ?auto_290275 ?auto_290280 ) ) ( not ( = ?auto_290276 ?auto_290277 ) ) ( not ( = ?auto_290276 ?auto_290278 ) ) ( not ( = ?auto_290276 ?auto_290279 ) ) ( not ( = ?auto_290276 ?auto_290280 ) ) ( not ( = ?auto_290277 ?auto_290278 ) ) ( not ( = ?auto_290277 ?auto_290279 ) ) ( not ( = ?auto_290277 ?auto_290280 ) ) ( not ( = ?auto_290278 ?auto_290279 ) ) ( not ( = ?auto_290278 ?auto_290280 ) ) ( not ( = ?auto_290279 ?auto_290280 ) ) ( ON ?auto_290278 ?auto_290279 ) ( ON ?auto_290277 ?auto_290278 ) ( ON ?auto_290276 ?auto_290277 ) ( ON ?auto_290275 ?auto_290276 ) ( ON ?auto_290274 ?auto_290275 ) ( CLEAR ?auto_290272 ) ( ON ?auto_290273 ?auto_290274 ) ( CLEAR ?auto_290273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_290268 ?auto_290269 ?auto_290270 ?auto_290271 ?auto_290272 ?auto_290273 )
      ( MAKE-12PILE ?auto_290268 ?auto_290269 ?auto_290270 ?auto_290271 ?auto_290272 ?auto_290273 ?auto_290274 ?auto_290275 ?auto_290276 ?auto_290277 ?auto_290278 ?auto_290279 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_290293 - BLOCK
      ?auto_290294 - BLOCK
      ?auto_290295 - BLOCK
      ?auto_290296 - BLOCK
      ?auto_290297 - BLOCK
      ?auto_290298 - BLOCK
      ?auto_290299 - BLOCK
      ?auto_290300 - BLOCK
      ?auto_290301 - BLOCK
      ?auto_290302 - BLOCK
      ?auto_290303 - BLOCK
      ?auto_290304 - BLOCK
    )
    :vars
    (
      ?auto_290305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290304 ?auto_290305 ) ( ON-TABLE ?auto_290293 ) ( ON ?auto_290294 ?auto_290293 ) ( ON ?auto_290295 ?auto_290294 ) ( ON ?auto_290296 ?auto_290295 ) ( not ( = ?auto_290293 ?auto_290294 ) ) ( not ( = ?auto_290293 ?auto_290295 ) ) ( not ( = ?auto_290293 ?auto_290296 ) ) ( not ( = ?auto_290293 ?auto_290297 ) ) ( not ( = ?auto_290293 ?auto_290298 ) ) ( not ( = ?auto_290293 ?auto_290299 ) ) ( not ( = ?auto_290293 ?auto_290300 ) ) ( not ( = ?auto_290293 ?auto_290301 ) ) ( not ( = ?auto_290293 ?auto_290302 ) ) ( not ( = ?auto_290293 ?auto_290303 ) ) ( not ( = ?auto_290293 ?auto_290304 ) ) ( not ( = ?auto_290293 ?auto_290305 ) ) ( not ( = ?auto_290294 ?auto_290295 ) ) ( not ( = ?auto_290294 ?auto_290296 ) ) ( not ( = ?auto_290294 ?auto_290297 ) ) ( not ( = ?auto_290294 ?auto_290298 ) ) ( not ( = ?auto_290294 ?auto_290299 ) ) ( not ( = ?auto_290294 ?auto_290300 ) ) ( not ( = ?auto_290294 ?auto_290301 ) ) ( not ( = ?auto_290294 ?auto_290302 ) ) ( not ( = ?auto_290294 ?auto_290303 ) ) ( not ( = ?auto_290294 ?auto_290304 ) ) ( not ( = ?auto_290294 ?auto_290305 ) ) ( not ( = ?auto_290295 ?auto_290296 ) ) ( not ( = ?auto_290295 ?auto_290297 ) ) ( not ( = ?auto_290295 ?auto_290298 ) ) ( not ( = ?auto_290295 ?auto_290299 ) ) ( not ( = ?auto_290295 ?auto_290300 ) ) ( not ( = ?auto_290295 ?auto_290301 ) ) ( not ( = ?auto_290295 ?auto_290302 ) ) ( not ( = ?auto_290295 ?auto_290303 ) ) ( not ( = ?auto_290295 ?auto_290304 ) ) ( not ( = ?auto_290295 ?auto_290305 ) ) ( not ( = ?auto_290296 ?auto_290297 ) ) ( not ( = ?auto_290296 ?auto_290298 ) ) ( not ( = ?auto_290296 ?auto_290299 ) ) ( not ( = ?auto_290296 ?auto_290300 ) ) ( not ( = ?auto_290296 ?auto_290301 ) ) ( not ( = ?auto_290296 ?auto_290302 ) ) ( not ( = ?auto_290296 ?auto_290303 ) ) ( not ( = ?auto_290296 ?auto_290304 ) ) ( not ( = ?auto_290296 ?auto_290305 ) ) ( not ( = ?auto_290297 ?auto_290298 ) ) ( not ( = ?auto_290297 ?auto_290299 ) ) ( not ( = ?auto_290297 ?auto_290300 ) ) ( not ( = ?auto_290297 ?auto_290301 ) ) ( not ( = ?auto_290297 ?auto_290302 ) ) ( not ( = ?auto_290297 ?auto_290303 ) ) ( not ( = ?auto_290297 ?auto_290304 ) ) ( not ( = ?auto_290297 ?auto_290305 ) ) ( not ( = ?auto_290298 ?auto_290299 ) ) ( not ( = ?auto_290298 ?auto_290300 ) ) ( not ( = ?auto_290298 ?auto_290301 ) ) ( not ( = ?auto_290298 ?auto_290302 ) ) ( not ( = ?auto_290298 ?auto_290303 ) ) ( not ( = ?auto_290298 ?auto_290304 ) ) ( not ( = ?auto_290298 ?auto_290305 ) ) ( not ( = ?auto_290299 ?auto_290300 ) ) ( not ( = ?auto_290299 ?auto_290301 ) ) ( not ( = ?auto_290299 ?auto_290302 ) ) ( not ( = ?auto_290299 ?auto_290303 ) ) ( not ( = ?auto_290299 ?auto_290304 ) ) ( not ( = ?auto_290299 ?auto_290305 ) ) ( not ( = ?auto_290300 ?auto_290301 ) ) ( not ( = ?auto_290300 ?auto_290302 ) ) ( not ( = ?auto_290300 ?auto_290303 ) ) ( not ( = ?auto_290300 ?auto_290304 ) ) ( not ( = ?auto_290300 ?auto_290305 ) ) ( not ( = ?auto_290301 ?auto_290302 ) ) ( not ( = ?auto_290301 ?auto_290303 ) ) ( not ( = ?auto_290301 ?auto_290304 ) ) ( not ( = ?auto_290301 ?auto_290305 ) ) ( not ( = ?auto_290302 ?auto_290303 ) ) ( not ( = ?auto_290302 ?auto_290304 ) ) ( not ( = ?auto_290302 ?auto_290305 ) ) ( not ( = ?auto_290303 ?auto_290304 ) ) ( not ( = ?auto_290303 ?auto_290305 ) ) ( not ( = ?auto_290304 ?auto_290305 ) ) ( ON ?auto_290303 ?auto_290304 ) ( ON ?auto_290302 ?auto_290303 ) ( ON ?auto_290301 ?auto_290302 ) ( ON ?auto_290300 ?auto_290301 ) ( ON ?auto_290299 ?auto_290300 ) ( ON ?auto_290298 ?auto_290299 ) ( CLEAR ?auto_290296 ) ( ON ?auto_290297 ?auto_290298 ) ( CLEAR ?auto_290297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_290293 ?auto_290294 ?auto_290295 ?auto_290296 ?auto_290297 )
      ( MAKE-12PILE ?auto_290293 ?auto_290294 ?auto_290295 ?auto_290296 ?auto_290297 ?auto_290298 ?auto_290299 ?auto_290300 ?auto_290301 ?auto_290302 ?auto_290303 ?auto_290304 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_290318 - BLOCK
      ?auto_290319 - BLOCK
      ?auto_290320 - BLOCK
      ?auto_290321 - BLOCK
      ?auto_290322 - BLOCK
      ?auto_290323 - BLOCK
      ?auto_290324 - BLOCK
      ?auto_290325 - BLOCK
      ?auto_290326 - BLOCK
      ?auto_290327 - BLOCK
      ?auto_290328 - BLOCK
      ?auto_290329 - BLOCK
    )
    :vars
    (
      ?auto_290330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290329 ?auto_290330 ) ( ON-TABLE ?auto_290318 ) ( ON ?auto_290319 ?auto_290318 ) ( ON ?auto_290320 ?auto_290319 ) ( ON ?auto_290321 ?auto_290320 ) ( not ( = ?auto_290318 ?auto_290319 ) ) ( not ( = ?auto_290318 ?auto_290320 ) ) ( not ( = ?auto_290318 ?auto_290321 ) ) ( not ( = ?auto_290318 ?auto_290322 ) ) ( not ( = ?auto_290318 ?auto_290323 ) ) ( not ( = ?auto_290318 ?auto_290324 ) ) ( not ( = ?auto_290318 ?auto_290325 ) ) ( not ( = ?auto_290318 ?auto_290326 ) ) ( not ( = ?auto_290318 ?auto_290327 ) ) ( not ( = ?auto_290318 ?auto_290328 ) ) ( not ( = ?auto_290318 ?auto_290329 ) ) ( not ( = ?auto_290318 ?auto_290330 ) ) ( not ( = ?auto_290319 ?auto_290320 ) ) ( not ( = ?auto_290319 ?auto_290321 ) ) ( not ( = ?auto_290319 ?auto_290322 ) ) ( not ( = ?auto_290319 ?auto_290323 ) ) ( not ( = ?auto_290319 ?auto_290324 ) ) ( not ( = ?auto_290319 ?auto_290325 ) ) ( not ( = ?auto_290319 ?auto_290326 ) ) ( not ( = ?auto_290319 ?auto_290327 ) ) ( not ( = ?auto_290319 ?auto_290328 ) ) ( not ( = ?auto_290319 ?auto_290329 ) ) ( not ( = ?auto_290319 ?auto_290330 ) ) ( not ( = ?auto_290320 ?auto_290321 ) ) ( not ( = ?auto_290320 ?auto_290322 ) ) ( not ( = ?auto_290320 ?auto_290323 ) ) ( not ( = ?auto_290320 ?auto_290324 ) ) ( not ( = ?auto_290320 ?auto_290325 ) ) ( not ( = ?auto_290320 ?auto_290326 ) ) ( not ( = ?auto_290320 ?auto_290327 ) ) ( not ( = ?auto_290320 ?auto_290328 ) ) ( not ( = ?auto_290320 ?auto_290329 ) ) ( not ( = ?auto_290320 ?auto_290330 ) ) ( not ( = ?auto_290321 ?auto_290322 ) ) ( not ( = ?auto_290321 ?auto_290323 ) ) ( not ( = ?auto_290321 ?auto_290324 ) ) ( not ( = ?auto_290321 ?auto_290325 ) ) ( not ( = ?auto_290321 ?auto_290326 ) ) ( not ( = ?auto_290321 ?auto_290327 ) ) ( not ( = ?auto_290321 ?auto_290328 ) ) ( not ( = ?auto_290321 ?auto_290329 ) ) ( not ( = ?auto_290321 ?auto_290330 ) ) ( not ( = ?auto_290322 ?auto_290323 ) ) ( not ( = ?auto_290322 ?auto_290324 ) ) ( not ( = ?auto_290322 ?auto_290325 ) ) ( not ( = ?auto_290322 ?auto_290326 ) ) ( not ( = ?auto_290322 ?auto_290327 ) ) ( not ( = ?auto_290322 ?auto_290328 ) ) ( not ( = ?auto_290322 ?auto_290329 ) ) ( not ( = ?auto_290322 ?auto_290330 ) ) ( not ( = ?auto_290323 ?auto_290324 ) ) ( not ( = ?auto_290323 ?auto_290325 ) ) ( not ( = ?auto_290323 ?auto_290326 ) ) ( not ( = ?auto_290323 ?auto_290327 ) ) ( not ( = ?auto_290323 ?auto_290328 ) ) ( not ( = ?auto_290323 ?auto_290329 ) ) ( not ( = ?auto_290323 ?auto_290330 ) ) ( not ( = ?auto_290324 ?auto_290325 ) ) ( not ( = ?auto_290324 ?auto_290326 ) ) ( not ( = ?auto_290324 ?auto_290327 ) ) ( not ( = ?auto_290324 ?auto_290328 ) ) ( not ( = ?auto_290324 ?auto_290329 ) ) ( not ( = ?auto_290324 ?auto_290330 ) ) ( not ( = ?auto_290325 ?auto_290326 ) ) ( not ( = ?auto_290325 ?auto_290327 ) ) ( not ( = ?auto_290325 ?auto_290328 ) ) ( not ( = ?auto_290325 ?auto_290329 ) ) ( not ( = ?auto_290325 ?auto_290330 ) ) ( not ( = ?auto_290326 ?auto_290327 ) ) ( not ( = ?auto_290326 ?auto_290328 ) ) ( not ( = ?auto_290326 ?auto_290329 ) ) ( not ( = ?auto_290326 ?auto_290330 ) ) ( not ( = ?auto_290327 ?auto_290328 ) ) ( not ( = ?auto_290327 ?auto_290329 ) ) ( not ( = ?auto_290327 ?auto_290330 ) ) ( not ( = ?auto_290328 ?auto_290329 ) ) ( not ( = ?auto_290328 ?auto_290330 ) ) ( not ( = ?auto_290329 ?auto_290330 ) ) ( ON ?auto_290328 ?auto_290329 ) ( ON ?auto_290327 ?auto_290328 ) ( ON ?auto_290326 ?auto_290327 ) ( ON ?auto_290325 ?auto_290326 ) ( ON ?auto_290324 ?auto_290325 ) ( ON ?auto_290323 ?auto_290324 ) ( CLEAR ?auto_290321 ) ( ON ?auto_290322 ?auto_290323 ) ( CLEAR ?auto_290322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_290318 ?auto_290319 ?auto_290320 ?auto_290321 ?auto_290322 )
      ( MAKE-12PILE ?auto_290318 ?auto_290319 ?auto_290320 ?auto_290321 ?auto_290322 ?auto_290323 ?auto_290324 ?auto_290325 ?auto_290326 ?auto_290327 ?auto_290328 ?auto_290329 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_290343 - BLOCK
      ?auto_290344 - BLOCK
      ?auto_290345 - BLOCK
      ?auto_290346 - BLOCK
      ?auto_290347 - BLOCK
      ?auto_290348 - BLOCK
      ?auto_290349 - BLOCK
      ?auto_290350 - BLOCK
      ?auto_290351 - BLOCK
      ?auto_290352 - BLOCK
      ?auto_290353 - BLOCK
      ?auto_290354 - BLOCK
    )
    :vars
    (
      ?auto_290355 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290354 ?auto_290355 ) ( ON-TABLE ?auto_290343 ) ( ON ?auto_290344 ?auto_290343 ) ( ON ?auto_290345 ?auto_290344 ) ( not ( = ?auto_290343 ?auto_290344 ) ) ( not ( = ?auto_290343 ?auto_290345 ) ) ( not ( = ?auto_290343 ?auto_290346 ) ) ( not ( = ?auto_290343 ?auto_290347 ) ) ( not ( = ?auto_290343 ?auto_290348 ) ) ( not ( = ?auto_290343 ?auto_290349 ) ) ( not ( = ?auto_290343 ?auto_290350 ) ) ( not ( = ?auto_290343 ?auto_290351 ) ) ( not ( = ?auto_290343 ?auto_290352 ) ) ( not ( = ?auto_290343 ?auto_290353 ) ) ( not ( = ?auto_290343 ?auto_290354 ) ) ( not ( = ?auto_290343 ?auto_290355 ) ) ( not ( = ?auto_290344 ?auto_290345 ) ) ( not ( = ?auto_290344 ?auto_290346 ) ) ( not ( = ?auto_290344 ?auto_290347 ) ) ( not ( = ?auto_290344 ?auto_290348 ) ) ( not ( = ?auto_290344 ?auto_290349 ) ) ( not ( = ?auto_290344 ?auto_290350 ) ) ( not ( = ?auto_290344 ?auto_290351 ) ) ( not ( = ?auto_290344 ?auto_290352 ) ) ( not ( = ?auto_290344 ?auto_290353 ) ) ( not ( = ?auto_290344 ?auto_290354 ) ) ( not ( = ?auto_290344 ?auto_290355 ) ) ( not ( = ?auto_290345 ?auto_290346 ) ) ( not ( = ?auto_290345 ?auto_290347 ) ) ( not ( = ?auto_290345 ?auto_290348 ) ) ( not ( = ?auto_290345 ?auto_290349 ) ) ( not ( = ?auto_290345 ?auto_290350 ) ) ( not ( = ?auto_290345 ?auto_290351 ) ) ( not ( = ?auto_290345 ?auto_290352 ) ) ( not ( = ?auto_290345 ?auto_290353 ) ) ( not ( = ?auto_290345 ?auto_290354 ) ) ( not ( = ?auto_290345 ?auto_290355 ) ) ( not ( = ?auto_290346 ?auto_290347 ) ) ( not ( = ?auto_290346 ?auto_290348 ) ) ( not ( = ?auto_290346 ?auto_290349 ) ) ( not ( = ?auto_290346 ?auto_290350 ) ) ( not ( = ?auto_290346 ?auto_290351 ) ) ( not ( = ?auto_290346 ?auto_290352 ) ) ( not ( = ?auto_290346 ?auto_290353 ) ) ( not ( = ?auto_290346 ?auto_290354 ) ) ( not ( = ?auto_290346 ?auto_290355 ) ) ( not ( = ?auto_290347 ?auto_290348 ) ) ( not ( = ?auto_290347 ?auto_290349 ) ) ( not ( = ?auto_290347 ?auto_290350 ) ) ( not ( = ?auto_290347 ?auto_290351 ) ) ( not ( = ?auto_290347 ?auto_290352 ) ) ( not ( = ?auto_290347 ?auto_290353 ) ) ( not ( = ?auto_290347 ?auto_290354 ) ) ( not ( = ?auto_290347 ?auto_290355 ) ) ( not ( = ?auto_290348 ?auto_290349 ) ) ( not ( = ?auto_290348 ?auto_290350 ) ) ( not ( = ?auto_290348 ?auto_290351 ) ) ( not ( = ?auto_290348 ?auto_290352 ) ) ( not ( = ?auto_290348 ?auto_290353 ) ) ( not ( = ?auto_290348 ?auto_290354 ) ) ( not ( = ?auto_290348 ?auto_290355 ) ) ( not ( = ?auto_290349 ?auto_290350 ) ) ( not ( = ?auto_290349 ?auto_290351 ) ) ( not ( = ?auto_290349 ?auto_290352 ) ) ( not ( = ?auto_290349 ?auto_290353 ) ) ( not ( = ?auto_290349 ?auto_290354 ) ) ( not ( = ?auto_290349 ?auto_290355 ) ) ( not ( = ?auto_290350 ?auto_290351 ) ) ( not ( = ?auto_290350 ?auto_290352 ) ) ( not ( = ?auto_290350 ?auto_290353 ) ) ( not ( = ?auto_290350 ?auto_290354 ) ) ( not ( = ?auto_290350 ?auto_290355 ) ) ( not ( = ?auto_290351 ?auto_290352 ) ) ( not ( = ?auto_290351 ?auto_290353 ) ) ( not ( = ?auto_290351 ?auto_290354 ) ) ( not ( = ?auto_290351 ?auto_290355 ) ) ( not ( = ?auto_290352 ?auto_290353 ) ) ( not ( = ?auto_290352 ?auto_290354 ) ) ( not ( = ?auto_290352 ?auto_290355 ) ) ( not ( = ?auto_290353 ?auto_290354 ) ) ( not ( = ?auto_290353 ?auto_290355 ) ) ( not ( = ?auto_290354 ?auto_290355 ) ) ( ON ?auto_290353 ?auto_290354 ) ( ON ?auto_290352 ?auto_290353 ) ( ON ?auto_290351 ?auto_290352 ) ( ON ?auto_290350 ?auto_290351 ) ( ON ?auto_290349 ?auto_290350 ) ( ON ?auto_290348 ?auto_290349 ) ( ON ?auto_290347 ?auto_290348 ) ( CLEAR ?auto_290345 ) ( ON ?auto_290346 ?auto_290347 ) ( CLEAR ?auto_290346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_290343 ?auto_290344 ?auto_290345 ?auto_290346 )
      ( MAKE-12PILE ?auto_290343 ?auto_290344 ?auto_290345 ?auto_290346 ?auto_290347 ?auto_290348 ?auto_290349 ?auto_290350 ?auto_290351 ?auto_290352 ?auto_290353 ?auto_290354 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_290368 - BLOCK
      ?auto_290369 - BLOCK
      ?auto_290370 - BLOCK
      ?auto_290371 - BLOCK
      ?auto_290372 - BLOCK
      ?auto_290373 - BLOCK
      ?auto_290374 - BLOCK
      ?auto_290375 - BLOCK
      ?auto_290376 - BLOCK
      ?auto_290377 - BLOCK
      ?auto_290378 - BLOCK
      ?auto_290379 - BLOCK
    )
    :vars
    (
      ?auto_290380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290379 ?auto_290380 ) ( ON-TABLE ?auto_290368 ) ( ON ?auto_290369 ?auto_290368 ) ( ON ?auto_290370 ?auto_290369 ) ( not ( = ?auto_290368 ?auto_290369 ) ) ( not ( = ?auto_290368 ?auto_290370 ) ) ( not ( = ?auto_290368 ?auto_290371 ) ) ( not ( = ?auto_290368 ?auto_290372 ) ) ( not ( = ?auto_290368 ?auto_290373 ) ) ( not ( = ?auto_290368 ?auto_290374 ) ) ( not ( = ?auto_290368 ?auto_290375 ) ) ( not ( = ?auto_290368 ?auto_290376 ) ) ( not ( = ?auto_290368 ?auto_290377 ) ) ( not ( = ?auto_290368 ?auto_290378 ) ) ( not ( = ?auto_290368 ?auto_290379 ) ) ( not ( = ?auto_290368 ?auto_290380 ) ) ( not ( = ?auto_290369 ?auto_290370 ) ) ( not ( = ?auto_290369 ?auto_290371 ) ) ( not ( = ?auto_290369 ?auto_290372 ) ) ( not ( = ?auto_290369 ?auto_290373 ) ) ( not ( = ?auto_290369 ?auto_290374 ) ) ( not ( = ?auto_290369 ?auto_290375 ) ) ( not ( = ?auto_290369 ?auto_290376 ) ) ( not ( = ?auto_290369 ?auto_290377 ) ) ( not ( = ?auto_290369 ?auto_290378 ) ) ( not ( = ?auto_290369 ?auto_290379 ) ) ( not ( = ?auto_290369 ?auto_290380 ) ) ( not ( = ?auto_290370 ?auto_290371 ) ) ( not ( = ?auto_290370 ?auto_290372 ) ) ( not ( = ?auto_290370 ?auto_290373 ) ) ( not ( = ?auto_290370 ?auto_290374 ) ) ( not ( = ?auto_290370 ?auto_290375 ) ) ( not ( = ?auto_290370 ?auto_290376 ) ) ( not ( = ?auto_290370 ?auto_290377 ) ) ( not ( = ?auto_290370 ?auto_290378 ) ) ( not ( = ?auto_290370 ?auto_290379 ) ) ( not ( = ?auto_290370 ?auto_290380 ) ) ( not ( = ?auto_290371 ?auto_290372 ) ) ( not ( = ?auto_290371 ?auto_290373 ) ) ( not ( = ?auto_290371 ?auto_290374 ) ) ( not ( = ?auto_290371 ?auto_290375 ) ) ( not ( = ?auto_290371 ?auto_290376 ) ) ( not ( = ?auto_290371 ?auto_290377 ) ) ( not ( = ?auto_290371 ?auto_290378 ) ) ( not ( = ?auto_290371 ?auto_290379 ) ) ( not ( = ?auto_290371 ?auto_290380 ) ) ( not ( = ?auto_290372 ?auto_290373 ) ) ( not ( = ?auto_290372 ?auto_290374 ) ) ( not ( = ?auto_290372 ?auto_290375 ) ) ( not ( = ?auto_290372 ?auto_290376 ) ) ( not ( = ?auto_290372 ?auto_290377 ) ) ( not ( = ?auto_290372 ?auto_290378 ) ) ( not ( = ?auto_290372 ?auto_290379 ) ) ( not ( = ?auto_290372 ?auto_290380 ) ) ( not ( = ?auto_290373 ?auto_290374 ) ) ( not ( = ?auto_290373 ?auto_290375 ) ) ( not ( = ?auto_290373 ?auto_290376 ) ) ( not ( = ?auto_290373 ?auto_290377 ) ) ( not ( = ?auto_290373 ?auto_290378 ) ) ( not ( = ?auto_290373 ?auto_290379 ) ) ( not ( = ?auto_290373 ?auto_290380 ) ) ( not ( = ?auto_290374 ?auto_290375 ) ) ( not ( = ?auto_290374 ?auto_290376 ) ) ( not ( = ?auto_290374 ?auto_290377 ) ) ( not ( = ?auto_290374 ?auto_290378 ) ) ( not ( = ?auto_290374 ?auto_290379 ) ) ( not ( = ?auto_290374 ?auto_290380 ) ) ( not ( = ?auto_290375 ?auto_290376 ) ) ( not ( = ?auto_290375 ?auto_290377 ) ) ( not ( = ?auto_290375 ?auto_290378 ) ) ( not ( = ?auto_290375 ?auto_290379 ) ) ( not ( = ?auto_290375 ?auto_290380 ) ) ( not ( = ?auto_290376 ?auto_290377 ) ) ( not ( = ?auto_290376 ?auto_290378 ) ) ( not ( = ?auto_290376 ?auto_290379 ) ) ( not ( = ?auto_290376 ?auto_290380 ) ) ( not ( = ?auto_290377 ?auto_290378 ) ) ( not ( = ?auto_290377 ?auto_290379 ) ) ( not ( = ?auto_290377 ?auto_290380 ) ) ( not ( = ?auto_290378 ?auto_290379 ) ) ( not ( = ?auto_290378 ?auto_290380 ) ) ( not ( = ?auto_290379 ?auto_290380 ) ) ( ON ?auto_290378 ?auto_290379 ) ( ON ?auto_290377 ?auto_290378 ) ( ON ?auto_290376 ?auto_290377 ) ( ON ?auto_290375 ?auto_290376 ) ( ON ?auto_290374 ?auto_290375 ) ( ON ?auto_290373 ?auto_290374 ) ( ON ?auto_290372 ?auto_290373 ) ( CLEAR ?auto_290370 ) ( ON ?auto_290371 ?auto_290372 ) ( CLEAR ?auto_290371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_290368 ?auto_290369 ?auto_290370 ?auto_290371 )
      ( MAKE-12PILE ?auto_290368 ?auto_290369 ?auto_290370 ?auto_290371 ?auto_290372 ?auto_290373 ?auto_290374 ?auto_290375 ?auto_290376 ?auto_290377 ?auto_290378 ?auto_290379 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_290393 - BLOCK
      ?auto_290394 - BLOCK
      ?auto_290395 - BLOCK
      ?auto_290396 - BLOCK
      ?auto_290397 - BLOCK
      ?auto_290398 - BLOCK
      ?auto_290399 - BLOCK
      ?auto_290400 - BLOCK
      ?auto_290401 - BLOCK
      ?auto_290402 - BLOCK
      ?auto_290403 - BLOCK
      ?auto_290404 - BLOCK
    )
    :vars
    (
      ?auto_290405 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290404 ?auto_290405 ) ( ON-TABLE ?auto_290393 ) ( ON ?auto_290394 ?auto_290393 ) ( not ( = ?auto_290393 ?auto_290394 ) ) ( not ( = ?auto_290393 ?auto_290395 ) ) ( not ( = ?auto_290393 ?auto_290396 ) ) ( not ( = ?auto_290393 ?auto_290397 ) ) ( not ( = ?auto_290393 ?auto_290398 ) ) ( not ( = ?auto_290393 ?auto_290399 ) ) ( not ( = ?auto_290393 ?auto_290400 ) ) ( not ( = ?auto_290393 ?auto_290401 ) ) ( not ( = ?auto_290393 ?auto_290402 ) ) ( not ( = ?auto_290393 ?auto_290403 ) ) ( not ( = ?auto_290393 ?auto_290404 ) ) ( not ( = ?auto_290393 ?auto_290405 ) ) ( not ( = ?auto_290394 ?auto_290395 ) ) ( not ( = ?auto_290394 ?auto_290396 ) ) ( not ( = ?auto_290394 ?auto_290397 ) ) ( not ( = ?auto_290394 ?auto_290398 ) ) ( not ( = ?auto_290394 ?auto_290399 ) ) ( not ( = ?auto_290394 ?auto_290400 ) ) ( not ( = ?auto_290394 ?auto_290401 ) ) ( not ( = ?auto_290394 ?auto_290402 ) ) ( not ( = ?auto_290394 ?auto_290403 ) ) ( not ( = ?auto_290394 ?auto_290404 ) ) ( not ( = ?auto_290394 ?auto_290405 ) ) ( not ( = ?auto_290395 ?auto_290396 ) ) ( not ( = ?auto_290395 ?auto_290397 ) ) ( not ( = ?auto_290395 ?auto_290398 ) ) ( not ( = ?auto_290395 ?auto_290399 ) ) ( not ( = ?auto_290395 ?auto_290400 ) ) ( not ( = ?auto_290395 ?auto_290401 ) ) ( not ( = ?auto_290395 ?auto_290402 ) ) ( not ( = ?auto_290395 ?auto_290403 ) ) ( not ( = ?auto_290395 ?auto_290404 ) ) ( not ( = ?auto_290395 ?auto_290405 ) ) ( not ( = ?auto_290396 ?auto_290397 ) ) ( not ( = ?auto_290396 ?auto_290398 ) ) ( not ( = ?auto_290396 ?auto_290399 ) ) ( not ( = ?auto_290396 ?auto_290400 ) ) ( not ( = ?auto_290396 ?auto_290401 ) ) ( not ( = ?auto_290396 ?auto_290402 ) ) ( not ( = ?auto_290396 ?auto_290403 ) ) ( not ( = ?auto_290396 ?auto_290404 ) ) ( not ( = ?auto_290396 ?auto_290405 ) ) ( not ( = ?auto_290397 ?auto_290398 ) ) ( not ( = ?auto_290397 ?auto_290399 ) ) ( not ( = ?auto_290397 ?auto_290400 ) ) ( not ( = ?auto_290397 ?auto_290401 ) ) ( not ( = ?auto_290397 ?auto_290402 ) ) ( not ( = ?auto_290397 ?auto_290403 ) ) ( not ( = ?auto_290397 ?auto_290404 ) ) ( not ( = ?auto_290397 ?auto_290405 ) ) ( not ( = ?auto_290398 ?auto_290399 ) ) ( not ( = ?auto_290398 ?auto_290400 ) ) ( not ( = ?auto_290398 ?auto_290401 ) ) ( not ( = ?auto_290398 ?auto_290402 ) ) ( not ( = ?auto_290398 ?auto_290403 ) ) ( not ( = ?auto_290398 ?auto_290404 ) ) ( not ( = ?auto_290398 ?auto_290405 ) ) ( not ( = ?auto_290399 ?auto_290400 ) ) ( not ( = ?auto_290399 ?auto_290401 ) ) ( not ( = ?auto_290399 ?auto_290402 ) ) ( not ( = ?auto_290399 ?auto_290403 ) ) ( not ( = ?auto_290399 ?auto_290404 ) ) ( not ( = ?auto_290399 ?auto_290405 ) ) ( not ( = ?auto_290400 ?auto_290401 ) ) ( not ( = ?auto_290400 ?auto_290402 ) ) ( not ( = ?auto_290400 ?auto_290403 ) ) ( not ( = ?auto_290400 ?auto_290404 ) ) ( not ( = ?auto_290400 ?auto_290405 ) ) ( not ( = ?auto_290401 ?auto_290402 ) ) ( not ( = ?auto_290401 ?auto_290403 ) ) ( not ( = ?auto_290401 ?auto_290404 ) ) ( not ( = ?auto_290401 ?auto_290405 ) ) ( not ( = ?auto_290402 ?auto_290403 ) ) ( not ( = ?auto_290402 ?auto_290404 ) ) ( not ( = ?auto_290402 ?auto_290405 ) ) ( not ( = ?auto_290403 ?auto_290404 ) ) ( not ( = ?auto_290403 ?auto_290405 ) ) ( not ( = ?auto_290404 ?auto_290405 ) ) ( ON ?auto_290403 ?auto_290404 ) ( ON ?auto_290402 ?auto_290403 ) ( ON ?auto_290401 ?auto_290402 ) ( ON ?auto_290400 ?auto_290401 ) ( ON ?auto_290399 ?auto_290400 ) ( ON ?auto_290398 ?auto_290399 ) ( ON ?auto_290397 ?auto_290398 ) ( ON ?auto_290396 ?auto_290397 ) ( CLEAR ?auto_290394 ) ( ON ?auto_290395 ?auto_290396 ) ( CLEAR ?auto_290395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_290393 ?auto_290394 ?auto_290395 )
      ( MAKE-12PILE ?auto_290393 ?auto_290394 ?auto_290395 ?auto_290396 ?auto_290397 ?auto_290398 ?auto_290399 ?auto_290400 ?auto_290401 ?auto_290402 ?auto_290403 ?auto_290404 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_290418 - BLOCK
      ?auto_290419 - BLOCK
      ?auto_290420 - BLOCK
      ?auto_290421 - BLOCK
      ?auto_290422 - BLOCK
      ?auto_290423 - BLOCK
      ?auto_290424 - BLOCK
      ?auto_290425 - BLOCK
      ?auto_290426 - BLOCK
      ?auto_290427 - BLOCK
      ?auto_290428 - BLOCK
      ?auto_290429 - BLOCK
    )
    :vars
    (
      ?auto_290430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290429 ?auto_290430 ) ( ON-TABLE ?auto_290418 ) ( ON ?auto_290419 ?auto_290418 ) ( not ( = ?auto_290418 ?auto_290419 ) ) ( not ( = ?auto_290418 ?auto_290420 ) ) ( not ( = ?auto_290418 ?auto_290421 ) ) ( not ( = ?auto_290418 ?auto_290422 ) ) ( not ( = ?auto_290418 ?auto_290423 ) ) ( not ( = ?auto_290418 ?auto_290424 ) ) ( not ( = ?auto_290418 ?auto_290425 ) ) ( not ( = ?auto_290418 ?auto_290426 ) ) ( not ( = ?auto_290418 ?auto_290427 ) ) ( not ( = ?auto_290418 ?auto_290428 ) ) ( not ( = ?auto_290418 ?auto_290429 ) ) ( not ( = ?auto_290418 ?auto_290430 ) ) ( not ( = ?auto_290419 ?auto_290420 ) ) ( not ( = ?auto_290419 ?auto_290421 ) ) ( not ( = ?auto_290419 ?auto_290422 ) ) ( not ( = ?auto_290419 ?auto_290423 ) ) ( not ( = ?auto_290419 ?auto_290424 ) ) ( not ( = ?auto_290419 ?auto_290425 ) ) ( not ( = ?auto_290419 ?auto_290426 ) ) ( not ( = ?auto_290419 ?auto_290427 ) ) ( not ( = ?auto_290419 ?auto_290428 ) ) ( not ( = ?auto_290419 ?auto_290429 ) ) ( not ( = ?auto_290419 ?auto_290430 ) ) ( not ( = ?auto_290420 ?auto_290421 ) ) ( not ( = ?auto_290420 ?auto_290422 ) ) ( not ( = ?auto_290420 ?auto_290423 ) ) ( not ( = ?auto_290420 ?auto_290424 ) ) ( not ( = ?auto_290420 ?auto_290425 ) ) ( not ( = ?auto_290420 ?auto_290426 ) ) ( not ( = ?auto_290420 ?auto_290427 ) ) ( not ( = ?auto_290420 ?auto_290428 ) ) ( not ( = ?auto_290420 ?auto_290429 ) ) ( not ( = ?auto_290420 ?auto_290430 ) ) ( not ( = ?auto_290421 ?auto_290422 ) ) ( not ( = ?auto_290421 ?auto_290423 ) ) ( not ( = ?auto_290421 ?auto_290424 ) ) ( not ( = ?auto_290421 ?auto_290425 ) ) ( not ( = ?auto_290421 ?auto_290426 ) ) ( not ( = ?auto_290421 ?auto_290427 ) ) ( not ( = ?auto_290421 ?auto_290428 ) ) ( not ( = ?auto_290421 ?auto_290429 ) ) ( not ( = ?auto_290421 ?auto_290430 ) ) ( not ( = ?auto_290422 ?auto_290423 ) ) ( not ( = ?auto_290422 ?auto_290424 ) ) ( not ( = ?auto_290422 ?auto_290425 ) ) ( not ( = ?auto_290422 ?auto_290426 ) ) ( not ( = ?auto_290422 ?auto_290427 ) ) ( not ( = ?auto_290422 ?auto_290428 ) ) ( not ( = ?auto_290422 ?auto_290429 ) ) ( not ( = ?auto_290422 ?auto_290430 ) ) ( not ( = ?auto_290423 ?auto_290424 ) ) ( not ( = ?auto_290423 ?auto_290425 ) ) ( not ( = ?auto_290423 ?auto_290426 ) ) ( not ( = ?auto_290423 ?auto_290427 ) ) ( not ( = ?auto_290423 ?auto_290428 ) ) ( not ( = ?auto_290423 ?auto_290429 ) ) ( not ( = ?auto_290423 ?auto_290430 ) ) ( not ( = ?auto_290424 ?auto_290425 ) ) ( not ( = ?auto_290424 ?auto_290426 ) ) ( not ( = ?auto_290424 ?auto_290427 ) ) ( not ( = ?auto_290424 ?auto_290428 ) ) ( not ( = ?auto_290424 ?auto_290429 ) ) ( not ( = ?auto_290424 ?auto_290430 ) ) ( not ( = ?auto_290425 ?auto_290426 ) ) ( not ( = ?auto_290425 ?auto_290427 ) ) ( not ( = ?auto_290425 ?auto_290428 ) ) ( not ( = ?auto_290425 ?auto_290429 ) ) ( not ( = ?auto_290425 ?auto_290430 ) ) ( not ( = ?auto_290426 ?auto_290427 ) ) ( not ( = ?auto_290426 ?auto_290428 ) ) ( not ( = ?auto_290426 ?auto_290429 ) ) ( not ( = ?auto_290426 ?auto_290430 ) ) ( not ( = ?auto_290427 ?auto_290428 ) ) ( not ( = ?auto_290427 ?auto_290429 ) ) ( not ( = ?auto_290427 ?auto_290430 ) ) ( not ( = ?auto_290428 ?auto_290429 ) ) ( not ( = ?auto_290428 ?auto_290430 ) ) ( not ( = ?auto_290429 ?auto_290430 ) ) ( ON ?auto_290428 ?auto_290429 ) ( ON ?auto_290427 ?auto_290428 ) ( ON ?auto_290426 ?auto_290427 ) ( ON ?auto_290425 ?auto_290426 ) ( ON ?auto_290424 ?auto_290425 ) ( ON ?auto_290423 ?auto_290424 ) ( ON ?auto_290422 ?auto_290423 ) ( ON ?auto_290421 ?auto_290422 ) ( CLEAR ?auto_290419 ) ( ON ?auto_290420 ?auto_290421 ) ( CLEAR ?auto_290420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_290418 ?auto_290419 ?auto_290420 )
      ( MAKE-12PILE ?auto_290418 ?auto_290419 ?auto_290420 ?auto_290421 ?auto_290422 ?auto_290423 ?auto_290424 ?auto_290425 ?auto_290426 ?auto_290427 ?auto_290428 ?auto_290429 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_290443 - BLOCK
      ?auto_290444 - BLOCK
      ?auto_290445 - BLOCK
      ?auto_290446 - BLOCK
      ?auto_290447 - BLOCK
      ?auto_290448 - BLOCK
      ?auto_290449 - BLOCK
      ?auto_290450 - BLOCK
      ?auto_290451 - BLOCK
      ?auto_290452 - BLOCK
      ?auto_290453 - BLOCK
      ?auto_290454 - BLOCK
    )
    :vars
    (
      ?auto_290455 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290454 ?auto_290455 ) ( ON-TABLE ?auto_290443 ) ( not ( = ?auto_290443 ?auto_290444 ) ) ( not ( = ?auto_290443 ?auto_290445 ) ) ( not ( = ?auto_290443 ?auto_290446 ) ) ( not ( = ?auto_290443 ?auto_290447 ) ) ( not ( = ?auto_290443 ?auto_290448 ) ) ( not ( = ?auto_290443 ?auto_290449 ) ) ( not ( = ?auto_290443 ?auto_290450 ) ) ( not ( = ?auto_290443 ?auto_290451 ) ) ( not ( = ?auto_290443 ?auto_290452 ) ) ( not ( = ?auto_290443 ?auto_290453 ) ) ( not ( = ?auto_290443 ?auto_290454 ) ) ( not ( = ?auto_290443 ?auto_290455 ) ) ( not ( = ?auto_290444 ?auto_290445 ) ) ( not ( = ?auto_290444 ?auto_290446 ) ) ( not ( = ?auto_290444 ?auto_290447 ) ) ( not ( = ?auto_290444 ?auto_290448 ) ) ( not ( = ?auto_290444 ?auto_290449 ) ) ( not ( = ?auto_290444 ?auto_290450 ) ) ( not ( = ?auto_290444 ?auto_290451 ) ) ( not ( = ?auto_290444 ?auto_290452 ) ) ( not ( = ?auto_290444 ?auto_290453 ) ) ( not ( = ?auto_290444 ?auto_290454 ) ) ( not ( = ?auto_290444 ?auto_290455 ) ) ( not ( = ?auto_290445 ?auto_290446 ) ) ( not ( = ?auto_290445 ?auto_290447 ) ) ( not ( = ?auto_290445 ?auto_290448 ) ) ( not ( = ?auto_290445 ?auto_290449 ) ) ( not ( = ?auto_290445 ?auto_290450 ) ) ( not ( = ?auto_290445 ?auto_290451 ) ) ( not ( = ?auto_290445 ?auto_290452 ) ) ( not ( = ?auto_290445 ?auto_290453 ) ) ( not ( = ?auto_290445 ?auto_290454 ) ) ( not ( = ?auto_290445 ?auto_290455 ) ) ( not ( = ?auto_290446 ?auto_290447 ) ) ( not ( = ?auto_290446 ?auto_290448 ) ) ( not ( = ?auto_290446 ?auto_290449 ) ) ( not ( = ?auto_290446 ?auto_290450 ) ) ( not ( = ?auto_290446 ?auto_290451 ) ) ( not ( = ?auto_290446 ?auto_290452 ) ) ( not ( = ?auto_290446 ?auto_290453 ) ) ( not ( = ?auto_290446 ?auto_290454 ) ) ( not ( = ?auto_290446 ?auto_290455 ) ) ( not ( = ?auto_290447 ?auto_290448 ) ) ( not ( = ?auto_290447 ?auto_290449 ) ) ( not ( = ?auto_290447 ?auto_290450 ) ) ( not ( = ?auto_290447 ?auto_290451 ) ) ( not ( = ?auto_290447 ?auto_290452 ) ) ( not ( = ?auto_290447 ?auto_290453 ) ) ( not ( = ?auto_290447 ?auto_290454 ) ) ( not ( = ?auto_290447 ?auto_290455 ) ) ( not ( = ?auto_290448 ?auto_290449 ) ) ( not ( = ?auto_290448 ?auto_290450 ) ) ( not ( = ?auto_290448 ?auto_290451 ) ) ( not ( = ?auto_290448 ?auto_290452 ) ) ( not ( = ?auto_290448 ?auto_290453 ) ) ( not ( = ?auto_290448 ?auto_290454 ) ) ( not ( = ?auto_290448 ?auto_290455 ) ) ( not ( = ?auto_290449 ?auto_290450 ) ) ( not ( = ?auto_290449 ?auto_290451 ) ) ( not ( = ?auto_290449 ?auto_290452 ) ) ( not ( = ?auto_290449 ?auto_290453 ) ) ( not ( = ?auto_290449 ?auto_290454 ) ) ( not ( = ?auto_290449 ?auto_290455 ) ) ( not ( = ?auto_290450 ?auto_290451 ) ) ( not ( = ?auto_290450 ?auto_290452 ) ) ( not ( = ?auto_290450 ?auto_290453 ) ) ( not ( = ?auto_290450 ?auto_290454 ) ) ( not ( = ?auto_290450 ?auto_290455 ) ) ( not ( = ?auto_290451 ?auto_290452 ) ) ( not ( = ?auto_290451 ?auto_290453 ) ) ( not ( = ?auto_290451 ?auto_290454 ) ) ( not ( = ?auto_290451 ?auto_290455 ) ) ( not ( = ?auto_290452 ?auto_290453 ) ) ( not ( = ?auto_290452 ?auto_290454 ) ) ( not ( = ?auto_290452 ?auto_290455 ) ) ( not ( = ?auto_290453 ?auto_290454 ) ) ( not ( = ?auto_290453 ?auto_290455 ) ) ( not ( = ?auto_290454 ?auto_290455 ) ) ( ON ?auto_290453 ?auto_290454 ) ( ON ?auto_290452 ?auto_290453 ) ( ON ?auto_290451 ?auto_290452 ) ( ON ?auto_290450 ?auto_290451 ) ( ON ?auto_290449 ?auto_290450 ) ( ON ?auto_290448 ?auto_290449 ) ( ON ?auto_290447 ?auto_290448 ) ( ON ?auto_290446 ?auto_290447 ) ( ON ?auto_290445 ?auto_290446 ) ( CLEAR ?auto_290443 ) ( ON ?auto_290444 ?auto_290445 ) ( CLEAR ?auto_290444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_290443 ?auto_290444 )
      ( MAKE-12PILE ?auto_290443 ?auto_290444 ?auto_290445 ?auto_290446 ?auto_290447 ?auto_290448 ?auto_290449 ?auto_290450 ?auto_290451 ?auto_290452 ?auto_290453 ?auto_290454 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_290468 - BLOCK
      ?auto_290469 - BLOCK
      ?auto_290470 - BLOCK
      ?auto_290471 - BLOCK
      ?auto_290472 - BLOCK
      ?auto_290473 - BLOCK
      ?auto_290474 - BLOCK
      ?auto_290475 - BLOCK
      ?auto_290476 - BLOCK
      ?auto_290477 - BLOCK
      ?auto_290478 - BLOCK
      ?auto_290479 - BLOCK
    )
    :vars
    (
      ?auto_290480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290479 ?auto_290480 ) ( ON-TABLE ?auto_290468 ) ( not ( = ?auto_290468 ?auto_290469 ) ) ( not ( = ?auto_290468 ?auto_290470 ) ) ( not ( = ?auto_290468 ?auto_290471 ) ) ( not ( = ?auto_290468 ?auto_290472 ) ) ( not ( = ?auto_290468 ?auto_290473 ) ) ( not ( = ?auto_290468 ?auto_290474 ) ) ( not ( = ?auto_290468 ?auto_290475 ) ) ( not ( = ?auto_290468 ?auto_290476 ) ) ( not ( = ?auto_290468 ?auto_290477 ) ) ( not ( = ?auto_290468 ?auto_290478 ) ) ( not ( = ?auto_290468 ?auto_290479 ) ) ( not ( = ?auto_290468 ?auto_290480 ) ) ( not ( = ?auto_290469 ?auto_290470 ) ) ( not ( = ?auto_290469 ?auto_290471 ) ) ( not ( = ?auto_290469 ?auto_290472 ) ) ( not ( = ?auto_290469 ?auto_290473 ) ) ( not ( = ?auto_290469 ?auto_290474 ) ) ( not ( = ?auto_290469 ?auto_290475 ) ) ( not ( = ?auto_290469 ?auto_290476 ) ) ( not ( = ?auto_290469 ?auto_290477 ) ) ( not ( = ?auto_290469 ?auto_290478 ) ) ( not ( = ?auto_290469 ?auto_290479 ) ) ( not ( = ?auto_290469 ?auto_290480 ) ) ( not ( = ?auto_290470 ?auto_290471 ) ) ( not ( = ?auto_290470 ?auto_290472 ) ) ( not ( = ?auto_290470 ?auto_290473 ) ) ( not ( = ?auto_290470 ?auto_290474 ) ) ( not ( = ?auto_290470 ?auto_290475 ) ) ( not ( = ?auto_290470 ?auto_290476 ) ) ( not ( = ?auto_290470 ?auto_290477 ) ) ( not ( = ?auto_290470 ?auto_290478 ) ) ( not ( = ?auto_290470 ?auto_290479 ) ) ( not ( = ?auto_290470 ?auto_290480 ) ) ( not ( = ?auto_290471 ?auto_290472 ) ) ( not ( = ?auto_290471 ?auto_290473 ) ) ( not ( = ?auto_290471 ?auto_290474 ) ) ( not ( = ?auto_290471 ?auto_290475 ) ) ( not ( = ?auto_290471 ?auto_290476 ) ) ( not ( = ?auto_290471 ?auto_290477 ) ) ( not ( = ?auto_290471 ?auto_290478 ) ) ( not ( = ?auto_290471 ?auto_290479 ) ) ( not ( = ?auto_290471 ?auto_290480 ) ) ( not ( = ?auto_290472 ?auto_290473 ) ) ( not ( = ?auto_290472 ?auto_290474 ) ) ( not ( = ?auto_290472 ?auto_290475 ) ) ( not ( = ?auto_290472 ?auto_290476 ) ) ( not ( = ?auto_290472 ?auto_290477 ) ) ( not ( = ?auto_290472 ?auto_290478 ) ) ( not ( = ?auto_290472 ?auto_290479 ) ) ( not ( = ?auto_290472 ?auto_290480 ) ) ( not ( = ?auto_290473 ?auto_290474 ) ) ( not ( = ?auto_290473 ?auto_290475 ) ) ( not ( = ?auto_290473 ?auto_290476 ) ) ( not ( = ?auto_290473 ?auto_290477 ) ) ( not ( = ?auto_290473 ?auto_290478 ) ) ( not ( = ?auto_290473 ?auto_290479 ) ) ( not ( = ?auto_290473 ?auto_290480 ) ) ( not ( = ?auto_290474 ?auto_290475 ) ) ( not ( = ?auto_290474 ?auto_290476 ) ) ( not ( = ?auto_290474 ?auto_290477 ) ) ( not ( = ?auto_290474 ?auto_290478 ) ) ( not ( = ?auto_290474 ?auto_290479 ) ) ( not ( = ?auto_290474 ?auto_290480 ) ) ( not ( = ?auto_290475 ?auto_290476 ) ) ( not ( = ?auto_290475 ?auto_290477 ) ) ( not ( = ?auto_290475 ?auto_290478 ) ) ( not ( = ?auto_290475 ?auto_290479 ) ) ( not ( = ?auto_290475 ?auto_290480 ) ) ( not ( = ?auto_290476 ?auto_290477 ) ) ( not ( = ?auto_290476 ?auto_290478 ) ) ( not ( = ?auto_290476 ?auto_290479 ) ) ( not ( = ?auto_290476 ?auto_290480 ) ) ( not ( = ?auto_290477 ?auto_290478 ) ) ( not ( = ?auto_290477 ?auto_290479 ) ) ( not ( = ?auto_290477 ?auto_290480 ) ) ( not ( = ?auto_290478 ?auto_290479 ) ) ( not ( = ?auto_290478 ?auto_290480 ) ) ( not ( = ?auto_290479 ?auto_290480 ) ) ( ON ?auto_290478 ?auto_290479 ) ( ON ?auto_290477 ?auto_290478 ) ( ON ?auto_290476 ?auto_290477 ) ( ON ?auto_290475 ?auto_290476 ) ( ON ?auto_290474 ?auto_290475 ) ( ON ?auto_290473 ?auto_290474 ) ( ON ?auto_290472 ?auto_290473 ) ( ON ?auto_290471 ?auto_290472 ) ( ON ?auto_290470 ?auto_290471 ) ( CLEAR ?auto_290468 ) ( ON ?auto_290469 ?auto_290470 ) ( CLEAR ?auto_290469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_290468 ?auto_290469 )
      ( MAKE-12PILE ?auto_290468 ?auto_290469 ?auto_290470 ?auto_290471 ?auto_290472 ?auto_290473 ?auto_290474 ?auto_290475 ?auto_290476 ?auto_290477 ?auto_290478 ?auto_290479 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_290493 - BLOCK
      ?auto_290494 - BLOCK
      ?auto_290495 - BLOCK
      ?auto_290496 - BLOCK
      ?auto_290497 - BLOCK
      ?auto_290498 - BLOCK
      ?auto_290499 - BLOCK
      ?auto_290500 - BLOCK
      ?auto_290501 - BLOCK
      ?auto_290502 - BLOCK
      ?auto_290503 - BLOCK
      ?auto_290504 - BLOCK
    )
    :vars
    (
      ?auto_290505 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290504 ?auto_290505 ) ( not ( = ?auto_290493 ?auto_290494 ) ) ( not ( = ?auto_290493 ?auto_290495 ) ) ( not ( = ?auto_290493 ?auto_290496 ) ) ( not ( = ?auto_290493 ?auto_290497 ) ) ( not ( = ?auto_290493 ?auto_290498 ) ) ( not ( = ?auto_290493 ?auto_290499 ) ) ( not ( = ?auto_290493 ?auto_290500 ) ) ( not ( = ?auto_290493 ?auto_290501 ) ) ( not ( = ?auto_290493 ?auto_290502 ) ) ( not ( = ?auto_290493 ?auto_290503 ) ) ( not ( = ?auto_290493 ?auto_290504 ) ) ( not ( = ?auto_290493 ?auto_290505 ) ) ( not ( = ?auto_290494 ?auto_290495 ) ) ( not ( = ?auto_290494 ?auto_290496 ) ) ( not ( = ?auto_290494 ?auto_290497 ) ) ( not ( = ?auto_290494 ?auto_290498 ) ) ( not ( = ?auto_290494 ?auto_290499 ) ) ( not ( = ?auto_290494 ?auto_290500 ) ) ( not ( = ?auto_290494 ?auto_290501 ) ) ( not ( = ?auto_290494 ?auto_290502 ) ) ( not ( = ?auto_290494 ?auto_290503 ) ) ( not ( = ?auto_290494 ?auto_290504 ) ) ( not ( = ?auto_290494 ?auto_290505 ) ) ( not ( = ?auto_290495 ?auto_290496 ) ) ( not ( = ?auto_290495 ?auto_290497 ) ) ( not ( = ?auto_290495 ?auto_290498 ) ) ( not ( = ?auto_290495 ?auto_290499 ) ) ( not ( = ?auto_290495 ?auto_290500 ) ) ( not ( = ?auto_290495 ?auto_290501 ) ) ( not ( = ?auto_290495 ?auto_290502 ) ) ( not ( = ?auto_290495 ?auto_290503 ) ) ( not ( = ?auto_290495 ?auto_290504 ) ) ( not ( = ?auto_290495 ?auto_290505 ) ) ( not ( = ?auto_290496 ?auto_290497 ) ) ( not ( = ?auto_290496 ?auto_290498 ) ) ( not ( = ?auto_290496 ?auto_290499 ) ) ( not ( = ?auto_290496 ?auto_290500 ) ) ( not ( = ?auto_290496 ?auto_290501 ) ) ( not ( = ?auto_290496 ?auto_290502 ) ) ( not ( = ?auto_290496 ?auto_290503 ) ) ( not ( = ?auto_290496 ?auto_290504 ) ) ( not ( = ?auto_290496 ?auto_290505 ) ) ( not ( = ?auto_290497 ?auto_290498 ) ) ( not ( = ?auto_290497 ?auto_290499 ) ) ( not ( = ?auto_290497 ?auto_290500 ) ) ( not ( = ?auto_290497 ?auto_290501 ) ) ( not ( = ?auto_290497 ?auto_290502 ) ) ( not ( = ?auto_290497 ?auto_290503 ) ) ( not ( = ?auto_290497 ?auto_290504 ) ) ( not ( = ?auto_290497 ?auto_290505 ) ) ( not ( = ?auto_290498 ?auto_290499 ) ) ( not ( = ?auto_290498 ?auto_290500 ) ) ( not ( = ?auto_290498 ?auto_290501 ) ) ( not ( = ?auto_290498 ?auto_290502 ) ) ( not ( = ?auto_290498 ?auto_290503 ) ) ( not ( = ?auto_290498 ?auto_290504 ) ) ( not ( = ?auto_290498 ?auto_290505 ) ) ( not ( = ?auto_290499 ?auto_290500 ) ) ( not ( = ?auto_290499 ?auto_290501 ) ) ( not ( = ?auto_290499 ?auto_290502 ) ) ( not ( = ?auto_290499 ?auto_290503 ) ) ( not ( = ?auto_290499 ?auto_290504 ) ) ( not ( = ?auto_290499 ?auto_290505 ) ) ( not ( = ?auto_290500 ?auto_290501 ) ) ( not ( = ?auto_290500 ?auto_290502 ) ) ( not ( = ?auto_290500 ?auto_290503 ) ) ( not ( = ?auto_290500 ?auto_290504 ) ) ( not ( = ?auto_290500 ?auto_290505 ) ) ( not ( = ?auto_290501 ?auto_290502 ) ) ( not ( = ?auto_290501 ?auto_290503 ) ) ( not ( = ?auto_290501 ?auto_290504 ) ) ( not ( = ?auto_290501 ?auto_290505 ) ) ( not ( = ?auto_290502 ?auto_290503 ) ) ( not ( = ?auto_290502 ?auto_290504 ) ) ( not ( = ?auto_290502 ?auto_290505 ) ) ( not ( = ?auto_290503 ?auto_290504 ) ) ( not ( = ?auto_290503 ?auto_290505 ) ) ( not ( = ?auto_290504 ?auto_290505 ) ) ( ON ?auto_290503 ?auto_290504 ) ( ON ?auto_290502 ?auto_290503 ) ( ON ?auto_290501 ?auto_290502 ) ( ON ?auto_290500 ?auto_290501 ) ( ON ?auto_290499 ?auto_290500 ) ( ON ?auto_290498 ?auto_290499 ) ( ON ?auto_290497 ?auto_290498 ) ( ON ?auto_290496 ?auto_290497 ) ( ON ?auto_290495 ?auto_290496 ) ( ON ?auto_290494 ?auto_290495 ) ( ON ?auto_290493 ?auto_290494 ) ( CLEAR ?auto_290493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_290493 )
      ( MAKE-12PILE ?auto_290493 ?auto_290494 ?auto_290495 ?auto_290496 ?auto_290497 ?auto_290498 ?auto_290499 ?auto_290500 ?auto_290501 ?auto_290502 ?auto_290503 ?auto_290504 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_290518 - BLOCK
      ?auto_290519 - BLOCK
      ?auto_290520 - BLOCK
      ?auto_290521 - BLOCK
      ?auto_290522 - BLOCK
      ?auto_290523 - BLOCK
      ?auto_290524 - BLOCK
      ?auto_290525 - BLOCK
      ?auto_290526 - BLOCK
      ?auto_290527 - BLOCK
      ?auto_290528 - BLOCK
      ?auto_290529 - BLOCK
    )
    :vars
    (
      ?auto_290530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290529 ?auto_290530 ) ( not ( = ?auto_290518 ?auto_290519 ) ) ( not ( = ?auto_290518 ?auto_290520 ) ) ( not ( = ?auto_290518 ?auto_290521 ) ) ( not ( = ?auto_290518 ?auto_290522 ) ) ( not ( = ?auto_290518 ?auto_290523 ) ) ( not ( = ?auto_290518 ?auto_290524 ) ) ( not ( = ?auto_290518 ?auto_290525 ) ) ( not ( = ?auto_290518 ?auto_290526 ) ) ( not ( = ?auto_290518 ?auto_290527 ) ) ( not ( = ?auto_290518 ?auto_290528 ) ) ( not ( = ?auto_290518 ?auto_290529 ) ) ( not ( = ?auto_290518 ?auto_290530 ) ) ( not ( = ?auto_290519 ?auto_290520 ) ) ( not ( = ?auto_290519 ?auto_290521 ) ) ( not ( = ?auto_290519 ?auto_290522 ) ) ( not ( = ?auto_290519 ?auto_290523 ) ) ( not ( = ?auto_290519 ?auto_290524 ) ) ( not ( = ?auto_290519 ?auto_290525 ) ) ( not ( = ?auto_290519 ?auto_290526 ) ) ( not ( = ?auto_290519 ?auto_290527 ) ) ( not ( = ?auto_290519 ?auto_290528 ) ) ( not ( = ?auto_290519 ?auto_290529 ) ) ( not ( = ?auto_290519 ?auto_290530 ) ) ( not ( = ?auto_290520 ?auto_290521 ) ) ( not ( = ?auto_290520 ?auto_290522 ) ) ( not ( = ?auto_290520 ?auto_290523 ) ) ( not ( = ?auto_290520 ?auto_290524 ) ) ( not ( = ?auto_290520 ?auto_290525 ) ) ( not ( = ?auto_290520 ?auto_290526 ) ) ( not ( = ?auto_290520 ?auto_290527 ) ) ( not ( = ?auto_290520 ?auto_290528 ) ) ( not ( = ?auto_290520 ?auto_290529 ) ) ( not ( = ?auto_290520 ?auto_290530 ) ) ( not ( = ?auto_290521 ?auto_290522 ) ) ( not ( = ?auto_290521 ?auto_290523 ) ) ( not ( = ?auto_290521 ?auto_290524 ) ) ( not ( = ?auto_290521 ?auto_290525 ) ) ( not ( = ?auto_290521 ?auto_290526 ) ) ( not ( = ?auto_290521 ?auto_290527 ) ) ( not ( = ?auto_290521 ?auto_290528 ) ) ( not ( = ?auto_290521 ?auto_290529 ) ) ( not ( = ?auto_290521 ?auto_290530 ) ) ( not ( = ?auto_290522 ?auto_290523 ) ) ( not ( = ?auto_290522 ?auto_290524 ) ) ( not ( = ?auto_290522 ?auto_290525 ) ) ( not ( = ?auto_290522 ?auto_290526 ) ) ( not ( = ?auto_290522 ?auto_290527 ) ) ( not ( = ?auto_290522 ?auto_290528 ) ) ( not ( = ?auto_290522 ?auto_290529 ) ) ( not ( = ?auto_290522 ?auto_290530 ) ) ( not ( = ?auto_290523 ?auto_290524 ) ) ( not ( = ?auto_290523 ?auto_290525 ) ) ( not ( = ?auto_290523 ?auto_290526 ) ) ( not ( = ?auto_290523 ?auto_290527 ) ) ( not ( = ?auto_290523 ?auto_290528 ) ) ( not ( = ?auto_290523 ?auto_290529 ) ) ( not ( = ?auto_290523 ?auto_290530 ) ) ( not ( = ?auto_290524 ?auto_290525 ) ) ( not ( = ?auto_290524 ?auto_290526 ) ) ( not ( = ?auto_290524 ?auto_290527 ) ) ( not ( = ?auto_290524 ?auto_290528 ) ) ( not ( = ?auto_290524 ?auto_290529 ) ) ( not ( = ?auto_290524 ?auto_290530 ) ) ( not ( = ?auto_290525 ?auto_290526 ) ) ( not ( = ?auto_290525 ?auto_290527 ) ) ( not ( = ?auto_290525 ?auto_290528 ) ) ( not ( = ?auto_290525 ?auto_290529 ) ) ( not ( = ?auto_290525 ?auto_290530 ) ) ( not ( = ?auto_290526 ?auto_290527 ) ) ( not ( = ?auto_290526 ?auto_290528 ) ) ( not ( = ?auto_290526 ?auto_290529 ) ) ( not ( = ?auto_290526 ?auto_290530 ) ) ( not ( = ?auto_290527 ?auto_290528 ) ) ( not ( = ?auto_290527 ?auto_290529 ) ) ( not ( = ?auto_290527 ?auto_290530 ) ) ( not ( = ?auto_290528 ?auto_290529 ) ) ( not ( = ?auto_290528 ?auto_290530 ) ) ( not ( = ?auto_290529 ?auto_290530 ) ) ( ON ?auto_290528 ?auto_290529 ) ( ON ?auto_290527 ?auto_290528 ) ( ON ?auto_290526 ?auto_290527 ) ( ON ?auto_290525 ?auto_290526 ) ( ON ?auto_290524 ?auto_290525 ) ( ON ?auto_290523 ?auto_290524 ) ( ON ?auto_290522 ?auto_290523 ) ( ON ?auto_290521 ?auto_290522 ) ( ON ?auto_290520 ?auto_290521 ) ( ON ?auto_290519 ?auto_290520 ) ( ON ?auto_290518 ?auto_290519 ) ( CLEAR ?auto_290518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_290518 )
      ( MAKE-12PILE ?auto_290518 ?auto_290519 ?auto_290520 ?auto_290521 ?auto_290522 ?auto_290523 ?auto_290524 ?auto_290525 ?auto_290526 ?auto_290527 ?auto_290528 ?auto_290529 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_290544 - BLOCK
      ?auto_290545 - BLOCK
      ?auto_290546 - BLOCK
      ?auto_290547 - BLOCK
      ?auto_290548 - BLOCK
      ?auto_290549 - BLOCK
      ?auto_290550 - BLOCK
      ?auto_290551 - BLOCK
      ?auto_290552 - BLOCK
      ?auto_290553 - BLOCK
      ?auto_290554 - BLOCK
      ?auto_290555 - BLOCK
      ?auto_290556 - BLOCK
    )
    :vars
    (
      ?auto_290557 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_290555 ) ( ON ?auto_290556 ?auto_290557 ) ( CLEAR ?auto_290556 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_290544 ) ( ON ?auto_290545 ?auto_290544 ) ( ON ?auto_290546 ?auto_290545 ) ( ON ?auto_290547 ?auto_290546 ) ( ON ?auto_290548 ?auto_290547 ) ( ON ?auto_290549 ?auto_290548 ) ( ON ?auto_290550 ?auto_290549 ) ( ON ?auto_290551 ?auto_290550 ) ( ON ?auto_290552 ?auto_290551 ) ( ON ?auto_290553 ?auto_290552 ) ( ON ?auto_290554 ?auto_290553 ) ( ON ?auto_290555 ?auto_290554 ) ( not ( = ?auto_290544 ?auto_290545 ) ) ( not ( = ?auto_290544 ?auto_290546 ) ) ( not ( = ?auto_290544 ?auto_290547 ) ) ( not ( = ?auto_290544 ?auto_290548 ) ) ( not ( = ?auto_290544 ?auto_290549 ) ) ( not ( = ?auto_290544 ?auto_290550 ) ) ( not ( = ?auto_290544 ?auto_290551 ) ) ( not ( = ?auto_290544 ?auto_290552 ) ) ( not ( = ?auto_290544 ?auto_290553 ) ) ( not ( = ?auto_290544 ?auto_290554 ) ) ( not ( = ?auto_290544 ?auto_290555 ) ) ( not ( = ?auto_290544 ?auto_290556 ) ) ( not ( = ?auto_290544 ?auto_290557 ) ) ( not ( = ?auto_290545 ?auto_290546 ) ) ( not ( = ?auto_290545 ?auto_290547 ) ) ( not ( = ?auto_290545 ?auto_290548 ) ) ( not ( = ?auto_290545 ?auto_290549 ) ) ( not ( = ?auto_290545 ?auto_290550 ) ) ( not ( = ?auto_290545 ?auto_290551 ) ) ( not ( = ?auto_290545 ?auto_290552 ) ) ( not ( = ?auto_290545 ?auto_290553 ) ) ( not ( = ?auto_290545 ?auto_290554 ) ) ( not ( = ?auto_290545 ?auto_290555 ) ) ( not ( = ?auto_290545 ?auto_290556 ) ) ( not ( = ?auto_290545 ?auto_290557 ) ) ( not ( = ?auto_290546 ?auto_290547 ) ) ( not ( = ?auto_290546 ?auto_290548 ) ) ( not ( = ?auto_290546 ?auto_290549 ) ) ( not ( = ?auto_290546 ?auto_290550 ) ) ( not ( = ?auto_290546 ?auto_290551 ) ) ( not ( = ?auto_290546 ?auto_290552 ) ) ( not ( = ?auto_290546 ?auto_290553 ) ) ( not ( = ?auto_290546 ?auto_290554 ) ) ( not ( = ?auto_290546 ?auto_290555 ) ) ( not ( = ?auto_290546 ?auto_290556 ) ) ( not ( = ?auto_290546 ?auto_290557 ) ) ( not ( = ?auto_290547 ?auto_290548 ) ) ( not ( = ?auto_290547 ?auto_290549 ) ) ( not ( = ?auto_290547 ?auto_290550 ) ) ( not ( = ?auto_290547 ?auto_290551 ) ) ( not ( = ?auto_290547 ?auto_290552 ) ) ( not ( = ?auto_290547 ?auto_290553 ) ) ( not ( = ?auto_290547 ?auto_290554 ) ) ( not ( = ?auto_290547 ?auto_290555 ) ) ( not ( = ?auto_290547 ?auto_290556 ) ) ( not ( = ?auto_290547 ?auto_290557 ) ) ( not ( = ?auto_290548 ?auto_290549 ) ) ( not ( = ?auto_290548 ?auto_290550 ) ) ( not ( = ?auto_290548 ?auto_290551 ) ) ( not ( = ?auto_290548 ?auto_290552 ) ) ( not ( = ?auto_290548 ?auto_290553 ) ) ( not ( = ?auto_290548 ?auto_290554 ) ) ( not ( = ?auto_290548 ?auto_290555 ) ) ( not ( = ?auto_290548 ?auto_290556 ) ) ( not ( = ?auto_290548 ?auto_290557 ) ) ( not ( = ?auto_290549 ?auto_290550 ) ) ( not ( = ?auto_290549 ?auto_290551 ) ) ( not ( = ?auto_290549 ?auto_290552 ) ) ( not ( = ?auto_290549 ?auto_290553 ) ) ( not ( = ?auto_290549 ?auto_290554 ) ) ( not ( = ?auto_290549 ?auto_290555 ) ) ( not ( = ?auto_290549 ?auto_290556 ) ) ( not ( = ?auto_290549 ?auto_290557 ) ) ( not ( = ?auto_290550 ?auto_290551 ) ) ( not ( = ?auto_290550 ?auto_290552 ) ) ( not ( = ?auto_290550 ?auto_290553 ) ) ( not ( = ?auto_290550 ?auto_290554 ) ) ( not ( = ?auto_290550 ?auto_290555 ) ) ( not ( = ?auto_290550 ?auto_290556 ) ) ( not ( = ?auto_290550 ?auto_290557 ) ) ( not ( = ?auto_290551 ?auto_290552 ) ) ( not ( = ?auto_290551 ?auto_290553 ) ) ( not ( = ?auto_290551 ?auto_290554 ) ) ( not ( = ?auto_290551 ?auto_290555 ) ) ( not ( = ?auto_290551 ?auto_290556 ) ) ( not ( = ?auto_290551 ?auto_290557 ) ) ( not ( = ?auto_290552 ?auto_290553 ) ) ( not ( = ?auto_290552 ?auto_290554 ) ) ( not ( = ?auto_290552 ?auto_290555 ) ) ( not ( = ?auto_290552 ?auto_290556 ) ) ( not ( = ?auto_290552 ?auto_290557 ) ) ( not ( = ?auto_290553 ?auto_290554 ) ) ( not ( = ?auto_290553 ?auto_290555 ) ) ( not ( = ?auto_290553 ?auto_290556 ) ) ( not ( = ?auto_290553 ?auto_290557 ) ) ( not ( = ?auto_290554 ?auto_290555 ) ) ( not ( = ?auto_290554 ?auto_290556 ) ) ( not ( = ?auto_290554 ?auto_290557 ) ) ( not ( = ?auto_290555 ?auto_290556 ) ) ( not ( = ?auto_290555 ?auto_290557 ) ) ( not ( = ?auto_290556 ?auto_290557 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_290556 ?auto_290557 )
      ( !STACK ?auto_290556 ?auto_290555 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_290571 - BLOCK
      ?auto_290572 - BLOCK
      ?auto_290573 - BLOCK
      ?auto_290574 - BLOCK
      ?auto_290575 - BLOCK
      ?auto_290576 - BLOCK
      ?auto_290577 - BLOCK
      ?auto_290578 - BLOCK
      ?auto_290579 - BLOCK
      ?auto_290580 - BLOCK
      ?auto_290581 - BLOCK
      ?auto_290582 - BLOCK
      ?auto_290583 - BLOCK
    )
    :vars
    (
      ?auto_290584 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_290582 ) ( ON ?auto_290583 ?auto_290584 ) ( CLEAR ?auto_290583 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_290571 ) ( ON ?auto_290572 ?auto_290571 ) ( ON ?auto_290573 ?auto_290572 ) ( ON ?auto_290574 ?auto_290573 ) ( ON ?auto_290575 ?auto_290574 ) ( ON ?auto_290576 ?auto_290575 ) ( ON ?auto_290577 ?auto_290576 ) ( ON ?auto_290578 ?auto_290577 ) ( ON ?auto_290579 ?auto_290578 ) ( ON ?auto_290580 ?auto_290579 ) ( ON ?auto_290581 ?auto_290580 ) ( ON ?auto_290582 ?auto_290581 ) ( not ( = ?auto_290571 ?auto_290572 ) ) ( not ( = ?auto_290571 ?auto_290573 ) ) ( not ( = ?auto_290571 ?auto_290574 ) ) ( not ( = ?auto_290571 ?auto_290575 ) ) ( not ( = ?auto_290571 ?auto_290576 ) ) ( not ( = ?auto_290571 ?auto_290577 ) ) ( not ( = ?auto_290571 ?auto_290578 ) ) ( not ( = ?auto_290571 ?auto_290579 ) ) ( not ( = ?auto_290571 ?auto_290580 ) ) ( not ( = ?auto_290571 ?auto_290581 ) ) ( not ( = ?auto_290571 ?auto_290582 ) ) ( not ( = ?auto_290571 ?auto_290583 ) ) ( not ( = ?auto_290571 ?auto_290584 ) ) ( not ( = ?auto_290572 ?auto_290573 ) ) ( not ( = ?auto_290572 ?auto_290574 ) ) ( not ( = ?auto_290572 ?auto_290575 ) ) ( not ( = ?auto_290572 ?auto_290576 ) ) ( not ( = ?auto_290572 ?auto_290577 ) ) ( not ( = ?auto_290572 ?auto_290578 ) ) ( not ( = ?auto_290572 ?auto_290579 ) ) ( not ( = ?auto_290572 ?auto_290580 ) ) ( not ( = ?auto_290572 ?auto_290581 ) ) ( not ( = ?auto_290572 ?auto_290582 ) ) ( not ( = ?auto_290572 ?auto_290583 ) ) ( not ( = ?auto_290572 ?auto_290584 ) ) ( not ( = ?auto_290573 ?auto_290574 ) ) ( not ( = ?auto_290573 ?auto_290575 ) ) ( not ( = ?auto_290573 ?auto_290576 ) ) ( not ( = ?auto_290573 ?auto_290577 ) ) ( not ( = ?auto_290573 ?auto_290578 ) ) ( not ( = ?auto_290573 ?auto_290579 ) ) ( not ( = ?auto_290573 ?auto_290580 ) ) ( not ( = ?auto_290573 ?auto_290581 ) ) ( not ( = ?auto_290573 ?auto_290582 ) ) ( not ( = ?auto_290573 ?auto_290583 ) ) ( not ( = ?auto_290573 ?auto_290584 ) ) ( not ( = ?auto_290574 ?auto_290575 ) ) ( not ( = ?auto_290574 ?auto_290576 ) ) ( not ( = ?auto_290574 ?auto_290577 ) ) ( not ( = ?auto_290574 ?auto_290578 ) ) ( not ( = ?auto_290574 ?auto_290579 ) ) ( not ( = ?auto_290574 ?auto_290580 ) ) ( not ( = ?auto_290574 ?auto_290581 ) ) ( not ( = ?auto_290574 ?auto_290582 ) ) ( not ( = ?auto_290574 ?auto_290583 ) ) ( not ( = ?auto_290574 ?auto_290584 ) ) ( not ( = ?auto_290575 ?auto_290576 ) ) ( not ( = ?auto_290575 ?auto_290577 ) ) ( not ( = ?auto_290575 ?auto_290578 ) ) ( not ( = ?auto_290575 ?auto_290579 ) ) ( not ( = ?auto_290575 ?auto_290580 ) ) ( not ( = ?auto_290575 ?auto_290581 ) ) ( not ( = ?auto_290575 ?auto_290582 ) ) ( not ( = ?auto_290575 ?auto_290583 ) ) ( not ( = ?auto_290575 ?auto_290584 ) ) ( not ( = ?auto_290576 ?auto_290577 ) ) ( not ( = ?auto_290576 ?auto_290578 ) ) ( not ( = ?auto_290576 ?auto_290579 ) ) ( not ( = ?auto_290576 ?auto_290580 ) ) ( not ( = ?auto_290576 ?auto_290581 ) ) ( not ( = ?auto_290576 ?auto_290582 ) ) ( not ( = ?auto_290576 ?auto_290583 ) ) ( not ( = ?auto_290576 ?auto_290584 ) ) ( not ( = ?auto_290577 ?auto_290578 ) ) ( not ( = ?auto_290577 ?auto_290579 ) ) ( not ( = ?auto_290577 ?auto_290580 ) ) ( not ( = ?auto_290577 ?auto_290581 ) ) ( not ( = ?auto_290577 ?auto_290582 ) ) ( not ( = ?auto_290577 ?auto_290583 ) ) ( not ( = ?auto_290577 ?auto_290584 ) ) ( not ( = ?auto_290578 ?auto_290579 ) ) ( not ( = ?auto_290578 ?auto_290580 ) ) ( not ( = ?auto_290578 ?auto_290581 ) ) ( not ( = ?auto_290578 ?auto_290582 ) ) ( not ( = ?auto_290578 ?auto_290583 ) ) ( not ( = ?auto_290578 ?auto_290584 ) ) ( not ( = ?auto_290579 ?auto_290580 ) ) ( not ( = ?auto_290579 ?auto_290581 ) ) ( not ( = ?auto_290579 ?auto_290582 ) ) ( not ( = ?auto_290579 ?auto_290583 ) ) ( not ( = ?auto_290579 ?auto_290584 ) ) ( not ( = ?auto_290580 ?auto_290581 ) ) ( not ( = ?auto_290580 ?auto_290582 ) ) ( not ( = ?auto_290580 ?auto_290583 ) ) ( not ( = ?auto_290580 ?auto_290584 ) ) ( not ( = ?auto_290581 ?auto_290582 ) ) ( not ( = ?auto_290581 ?auto_290583 ) ) ( not ( = ?auto_290581 ?auto_290584 ) ) ( not ( = ?auto_290582 ?auto_290583 ) ) ( not ( = ?auto_290582 ?auto_290584 ) ) ( not ( = ?auto_290583 ?auto_290584 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_290583 ?auto_290584 )
      ( !STACK ?auto_290583 ?auto_290582 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_290598 - BLOCK
      ?auto_290599 - BLOCK
      ?auto_290600 - BLOCK
      ?auto_290601 - BLOCK
      ?auto_290602 - BLOCK
      ?auto_290603 - BLOCK
      ?auto_290604 - BLOCK
      ?auto_290605 - BLOCK
      ?auto_290606 - BLOCK
      ?auto_290607 - BLOCK
      ?auto_290608 - BLOCK
      ?auto_290609 - BLOCK
      ?auto_290610 - BLOCK
    )
    :vars
    (
      ?auto_290611 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290610 ?auto_290611 ) ( ON-TABLE ?auto_290598 ) ( ON ?auto_290599 ?auto_290598 ) ( ON ?auto_290600 ?auto_290599 ) ( ON ?auto_290601 ?auto_290600 ) ( ON ?auto_290602 ?auto_290601 ) ( ON ?auto_290603 ?auto_290602 ) ( ON ?auto_290604 ?auto_290603 ) ( ON ?auto_290605 ?auto_290604 ) ( ON ?auto_290606 ?auto_290605 ) ( ON ?auto_290607 ?auto_290606 ) ( ON ?auto_290608 ?auto_290607 ) ( not ( = ?auto_290598 ?auto_290599 ) ) ( not ( = ?auto_290598 ?auto_290600 ) ) ( not ( = ?auto_290598 ?auto_290601 ) ) ( not ( = ?auto_290598 ?auto_290602 ) ) ( not ( = ?auto_290598 ?auto_290603 ) ) ( not ( = ?auto_290598 ?auto_290604 ) ) ( not ( = ?auto_290598 ?auto_290605 ) ) ( not ( = ?auto_290598 ?auto_290606 ) ) ( not ( = ?auto_290598 ?auto_290607 ) ) ( not ( = ?auto_290598 ?auto_290608 ) ) ( not ( = ?auto_290598 ?auto_290609 ) ) ( not ( = ?auto_290598 ?auto_290610 ) ) ( not ( = ?auto_290598 ?auto_290611 ) ) ( not ( = ?auto_290599 ?auto_290600 ) ) ( not ( = ?auto_290599 ?auto_290601 ) ) ( not ( = ?auto_290599 ?auto_290602 ) ) ( not ( = ?auto_290599 ?auto_290603 ) ) ( not ( = ?auto_290599 ?auto_290604 ) ) ( not ( = ?auto_290599 ?auto_290605 ) ) ( not ( = ?auto_290599 ?auto_290606 ) ) ( not ( = ?auto_290599 ?auto_290607 ) ) ( not ( = ?auto_290599 ?auto_290608 ) ) ( not ( = ?auto_290599 ?auto_290609 ) ) ( not ( = ?auto_290599 ?auto_290610 ) ) ( not ( = ?auto_290599 ?auto_290611 ) ) ( not ( = ?auto_290600 ?auto_290601 ) ) ( not ( = ?auto_290600 ?auto_290602 ) ) ( not ( = ?auto_290600 ?auto_290603 ) ) ( not ( = ?auto_290600 ?auto_290604 ) ) ( not ( = ?auto_290600 ?auto_290605 ) ) ( not ( = ?auto_290600 ?auto_290606 ) ) ( not ( = ?auto_290600 ?auto_290607 ) ) ( not ( = ?auto_290600 ?auto_290608 ) ) ( not ( = ?auto_290600 ?auto_290609 ) ) ( not ( = ?auto_290600 ?auto_290610 ) ) ( not ( = ?auto_290600 ?auto_290611 ) ) ( not ( = ?auto_290601 ?auto_290602 ) ) ( not ( = ?auto_290601 ?auto_290603 ) ) ( not ( = ?auto_290601 ?auto_290604 ) ) ( not ( = ?auto_290601 ?auto_290605 ) ) ( not ( = ?auto_290601 ?auto_290606 ) ) ( not ( = ?auto_290601 ?auto_290607 ) ) ( not ( = ?auto_290601 ?auto_290608 ) ) ( not ( = ?auto_290601 ?auto_290609 ) ) ( not ( = ?auto_290601 ?auto_290610 ) ) ( not ( = ?auto_290601 ?auto_290611 ) ) ( not ( = ?auto_290602 ?auto_290603 ) ) ( not ( = ?auto_290602 ?auto_290604 ) ) ( not ( = ?auto_290602 ?auto_290605 ) ) ( not ( = ?auto_290602 ?auto_290606 ) ) ( not ( = ?auto_290602 ?auto_290607 ) ) ( not ( = ?auto_290602 ?auto_290608 ) ) ( not ( = ?auto_290602 ?auto_290609 ) ) ( not ( = ?auto_290602 ?auto_290610 ) ) ( not ( = ?auto_290602 ?auto_290611 ) ) ( not ( = ?auto_290603 ?auto_290604 ) ) ( not ( = ?auto_290603 ?auto_290605 ) ) ( not ( = ?auto_290603 ?auto_290606 ) ) ( not ( = ?auto_290603 ?auto_290607 ) ) ( not ( = ?auto_290603 ?auto_290608 ) ) ( not ( = ?auto_290603 ?auto_290609 ) ) ( not ( = ?auto_290603 ?auto_290610 ) ) ( not ( = ?auto_290603 ?auto_290611 ) ) ( not ( = ?auto_290604 ?auto_290605 ) ) ( not ( = ?auto_290604 ?auto_290606 ) ) ( not ( = ?auto_290604 ?auto_290607 ) ) ( not ( = ?auto_290604 ?auto_290608 ) ) ( not ( = ?auto_290604 ?auto_290609 ) ) ( not ( = ?auto_290604 ?auto_290610 ) ) ( not ( = ?auto_290604 ?auto_290611 ) ) ( not ( = ?auto_290605 ?auto_290606 ) ) ( not ( = ?auto_290605 ?auto_290607 ) ) ( not ( = ?auto_290605 ?auto_290608 ) ) ( not ( = ?auto_290605 ?auto_290609 ) ) ( not ( = ?auto_290605 ?auto_290610 ) ) ( not ( = ?auto_290605 ?auto_290611 ) ) ( not ( = ?auto_290606 ?auto_290607 ) ) ( not ( = ?auto_290606 ?auto_290608 ) ) ( not ( = ?auto_290606 ?auto_290609 ) ) ( not ( = ?auto_290606 ?auto_290610 ) ) ( not ( = ?auto_290606 ?auto_290611 ) ) ( not ( = ?auto_290607 ?auto_290608 ) ) ( not ( = ?auto_290607 ?auto_290609 ) ) ( not ( = ?auto_290607 ?auto_290610 ) ) ( not ( = ?auto_290607 ?auto_290611 ) ) ( not ( = ?auto_290608 ?auto_290609 ) ) ( not ( = ?auto_290608 ?auto_290610 ) ) ( not ( = ?auto_290608 ?auto_290611 ) ) ( not ( = ?auto_290609 ?auto_290610 ) ) ( not ( = ?auto_290609 ?auto_290611 ) ) ( not ( = ?auto_290610 ?auto_290611 ) ) ( CLEAR ?auto_290608 ) ( ON ?auto_290609 ?auto_290610 ) ( CLEAR ?auto_290609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_290598 ?auto_290599 ?auto_290600 ?auto_290601 ?auto_290602 ?auto_290603 ?auto_290604 ?auto_290605 ?auto_290606 ?auto_290607 ?auto_290608 ?auto_290609 )
      ( MAKE-13PILE ?auto_290598 ?auto_290599 ?auto_290600 ?auto_290601 ?auto_290602 ?auto_290603 ?auto_290604 ?auto_290605 ?auto_290606 ?auto_290607 ?auto_290608 ?auto_290609 ?auto_290610 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_290625 - BLOCK
      ?auto_290626 - BLOCK
      ?auto_290627 - BLOCK
      ?auto_290628 - BLOCK
      ?auto_290629 - BLOCK
      ?auto_290630 - BLOCK
      ?auto_290631 - BLOCK
      ?auto_290632 - BLOCK
      ?auto_290633 - BLOCK
      ?auto_290634 - BLOCK
      ?auto_290635 - BLOCK
      ?auto_290636 - BLOCK
      ?auto_290637 - BLOCK
    )
    :vars
    (
      ?auto_290638 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290637 ?auto_290638 ) ( ON-TABLE ?auto_290625 ) ( ON ?auto_290626 ?auto_290625 ) ( ON ?auto_290627 ?auto_290626 ) ( ON ?auto_290628 ?auto_290627 ) ( ON ?auto_290629 ?auto_290628 ) ( ON ?auto_290630 ?auto_290629 ) ( ON ?auto_290631 ?auto_290630 ) ( ON ?auto_290632 ?auto_290631 ) ( ON ?auto_290633 ?auto_290632 ) ( ON ?auto_290634 ?auto_290633 ) ( ON ?auto_290635 ?auto_290634 ) ( not ( = ?auto_290625 ?auto_290626 ) ) ( not ( = ?auto_290625 ?auto_290627 ) ) ( not ( = ?auto_290625 ?auto_290628 ) ) ( not ( = ?auto_290625 ?auto_290629 ) ) ( not ( = ?auto_290625 ?auto_290630 ) ) ( not ( = ?auto_290625 ?auto_290631 ) ) ( not ( = ?auto_290625 ?auto_290632 ) ) ( not ( = ?auto_290625 ?auto_290633 ) ) ( not ( = ?auto_290625 ?auto_290634 ) ) ( not ( = ?auto_290625 ?auto_290635 ) ) ( not ( = ?auto_290625 ?auto_290636 ) ) ( not ( = ?auto_290625 ?auto_290637 ) ) ( not ( = ?auto_290625 ?auto_290638 ) ) ( not ( = ?auto_290626 ?auto_290627 ) ) ( not ( = ?auto_290626 ?auto_290628 ) ) ( not ( = ?auto_290626 ?auto_290629 ) ) ( not ( = ?auto_290626 ?auto_290630 ) ) ( not ( = ?auto_290626 ?auto_290631 ) ) ( not ( = ?auto_290626 ?auto_290632 ) ) ( not ( = ?auto_290626 ?auto_290633 ) ) ( not ( = ?auto_290626 ?auto_290634 ) ) ( not ( = ?auto_290626 ?auto_290635 ) ) ( not ( = ?auto_290626 ?auto_290636 ) ) ( not ( = ?auto_290626 ?auto_290637 ) ) ( not ( = ?auto_290626 ?auto_290638 ) ) ( not ( = ?auto_290627 ?auto_290628 ) ) ( not ( = ?auto_290627 ?auto_290629 ) ) ( not ( = ?auto_290627 ?auto_290630 ) ) ( not ( = ?auto_290627 ?auto_290631 ) ) ( not ( = ?auto_290627 ?auto_290632 ) ) ( not ( = ?auto_290627 ?auto_290633 ) ) ( not ( = ?auto_290627 ?auto_290634 ) ) ( not ( = ?auto_290627 ?auto_290635 ) ) ( not ( = ?auto_290627 ?auto_290636 ) ) ( not ( = ?auto_290627 ?auto_290637 ) ) ( not ( = ?auto_290627 ?auto_290638 ) ) ( not ( = ?auto_290628 ?auto_290629 ) ) ( not ( = ?auto_290628 ?auto_290630 ) ) ( not ( = ?auto_290628 ?auto_290631 ) ) ( not ( = ?auto_290628 ?auto_290632 ) ) ( not ( = ?auto_290628 ?auto_290633 ) ) ( not ( = ?auto_290628 ?auto_290634 ) ) ( not ( = ?auto_290628 ?auto_290635 ) ) ( not ( = ?auto_290628 ?auto_290636 ) ) ( not ( = ?auto_290628 ?auto_290637 ) ) ( not ( = ?auto_290628 ?auto_290638 ) ) ( not ( = ?auto_290629 ?auto_290630 ) ) ( not ( = ?auto_290629 ?auto_290631 ) ) ( not ( = ?auto_290629 ?auto_290632 ) ) ( not ( = ?auto_290629 ?auto_290633 ) ) ( not ( = ?auto_290629 ?auto_290634 ) ) ( not ( = ?auto_290629 ?auto_290635 ) ) ( not ( = ?auto_290629 ?auto_290636 ) ) ( not ( = ?auto_290629 ?auto_290637 ) ) ( not ( = ?auto_290629 ?auto_290638 ) ) ( not ( = ?auto_290630 ?auto_290631 ) ) ( not ( = ?auto_290630 ?auto_290632 ) ) ( not ( = ?auto_290630 ?auto_290633 ) ) ( not ( = ?auto_290630 ?auto_290634 ) ) ( not ( = ?auto_290630 ?auto_290635 ) ) ( not ( = ?auto_290630 ?auto_290636 ) ) ( not ( = ?auto_290630 ?auto_290637 ) ) ( not ( = ?auto_290630 ?auto_290638 ) ) ( not ( = ?auto_290631 ?auto_290632 ) ) ( not ( = ?auto_290631 ?auto_290633 ) ) ( not ( = ?auto_290631 ?auto_290634 ) ) ( not ( = ?auto_290631 ?auto_290635 ) ) ( not ( = ?auto_290631 ?auto_290636 ) ) ( not ( = ?auto_290631 ?auto_290637 ) ) ( not ( = ?auto_290631 ?auto_290638 ) ) ( not ( = ?auto_290632 ?auto_290633 ) ) ( not ( = ?auto_290632 ?auto_290634 ) ) ( not ( = ?auto_290632 ?auto_290635 ) ) ( not ( = ?auto_290632 ?auto_290636 ) ) ( not ( = ?auto_290632 ?auto_290637 ) ) ( not ( = ?auto_290632 ?auto_290638 ) ) ( not ( = ?auto_290633 ?auto_290634 ) ) ( not ( = ?auto_290633 ?auto_290635 ) ) ( not ( = ?auto_290633 ?auto_290636 ) ) ( not ( = ?auto_290633 ?auto_290637 ) ) ( not ( = ?auto_290633 ?auto_290638 ) ) ( not ( = ?auto_290634 ?auto_290635 ) ) ( not ( = ?auto_290634 ?auto_290636 ) ) ( not ( = ?auto_290634 ?auto_290637 ) ) ( not ( = ?auto_290634 ?auto_290638 ) ) ( not ( = ?auto_290635 ?auto_290636 ) ) ( not ( = ?auto_290635 ?auto_290637 ) ) ( not ( = ?auto_290635 ?auto_290638 ) ) ( not ( = ?auto_290636 ?auto_290637 ) ) ( not ( = ?auto_290636 ?auto_290638 ) ) ( not ( = ?auto_290637 ?auto_290638 ) ) ( CLEAR ?auto_290635 ) ( ON ?auto_290636 ?auto_290637 ) ( CLEAR ?auto_290636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_290625 ?auto_290626 ?auto_290627 ?auto_290628 ?auto_290629 ?auto_290630 ?auto_290631 ?auto_290632 ?auto_290633 ?auto_290634 ?auto_290635 ?auto_290636 )
      ( MAKE-13PILE ?auto_290625 ?auto_290626 ?auto_290627 ?auto_290628 ?auto_290629 ?auto_290630 ?auto_290631 ?auto_290632 ?auto_290633 ?auto_290634 ?auto_290635 ?auto_290636 ?auto_290637 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_290652 - BLOCK
      ?auto_290653 - BLOCK
      ?auto_290654 - BLOCK
      ?auto_290655 - BLOCK
      ?auto_290656 - BLOCK
      ?auto_290657 - BLOCK
      ?auto_290658 - BLOCK
      ?auto_290659 - BLOCK
      ?auto_290660 - BLOCK
      ?auto_290661 - BLOCK
      ?auto_290662 - BLOCK
      ?auto_290663 - BLOCK
      ?auto_290664 - BLOCK
    )
    :vars
    (
      ?auto_290665 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290664 ?auto_290665 ) ( ON-TABLE ?auto_290652 ) ( ON ?auto_290653 ?auto_290652 ) ( ON ?auto_290654 ?auto_290653 ) ( ON ?auto_290655 ?auto_290654 ) ( ON ?auto_290656 ?auto_290655 ) ( ON ?auto_290657 ?auto_290656 ) ( ON ?auto_290658 ?auto_290657 ) ( ON ?auto_290659 ?auto_290658 ) ( ON ?auto_290660 ?auto_290659 ) ( ON ?auto_290661 ?auto_290660 ) ( not ( = ?auto_290652 ?auto_290653 ) ) ( not ( = ?auto_290652 ?auto_290654 ) ) ( not ( = ?auto_290652 ?auto_290655 ) ) ( not ( = ?auto_290652 ?auto_290656 ) ) ( not ( = ?auto_290652 ?auto_290657 ) ) ( not ( = ?auto_290652 ?auto_290658 ) ) ( not ( = ?auto_290652 ?auto_290659 ) ) ( not ( = ?auto_290652 ?auto_290660 ) ) ( not ( = ?auto_290652 ?auto_290661 ) ) ( not ( = ?auto_290652 ?auto_290662 ) ) ( not ( = ?auto_290652 ?auto_290663 ) ) ( not ( = ?auto_290652 ?auto_290664 ) ) ( not ( = ?auto_290652 ?auto_290665 ) ) ( not ( = ?auto_290653 ?auto_290654 ) ) ( not ( = ?auto_290653 ?auto_290655 ) ) ( not ( = ?auto_290653 ?auto_290656 ) ) ( not ( = ?auto_290653 ?auto_290657 ) ) ( not ( = ?auto_290653 ?auto_290658 ) ) ( not ( = ?auto_290653 ?auto_290659 ) ) ( not ( = ?auto_290653 ?auto_290660 ) ) ( not ( = ?auto_290653 ?auto_290661 ) ) ( not ( = ?auto_290653 ?auto_290662 ) ) ( not ( = ?auto_290653 ?auto_290663 ) ) ( not ( = ?auto_290653 ?auto_290664 ) ) ( not ( = ?auto_290653 ?auto_290665 ) ) ( not ( = ?auto_290654 ?auto_290655 ) ) ( not ( = ?auto_290654 ?auto_290656 ) ) ( not ( = ?auto_290654 ?auto_290657 ) ) ( not ( = ?auto_290654 ?auto_290658 ) ) ( not ( = ?auto_290654 ?auto_290659 ) ) ( not ( = ?auto_290654 ?auto_290660 ) ) ( not ( = ?auto_290654 ?auto_290661 ) ) ( not ( = ?auto_290654 ?auto_290662 ) ) ( not ( = ?auto_290654 ?auto_290663 ) ) ( not ( = ?auto_290654 ?auto_290664 ) ) ( not ( = ?auto_290654 ?auto_290665 ) ) ( not ( = ?auto_290655 ?auto_290656 ) ) ( not ( = ?auto_290655 ?auto_290657 ) ) ( not ( = ?auto_290655 ?auto_290658 ) ) ( not ( = ?auto_290655 ?auto_290659 ) ) ( not ( = ?auto_290655 ?auto_290660 ) ) ( not ( = ?auto_290655 ?auto_290661 ) ) ( not ( = ?auto_290655 ?auto_290662 ) ) ( not ( = ?auto_290655 ?auto_290663 ) ) ( not ( = ?auto_290655 ?auto_290664 ) ) ( not ( = ?auto_290655 ?auto_290665 ) ) ( not ( = ?auto_290656 ?auto_290657 ) ) ( not ( = ?auto_290656 ?auto_290658 ) ) ( not ( = ?auto_290656 ?auto_290659 ) ) ( not ( = ?auto_290656 ?auto_290660 ) ) ( not ( = ?auto_290656 ?auto_290661 ) ) ( not ( = ?auto_290656 ?auto_290662 ) ) ( not ( = ?auto_290656 ?auto_290663 ) ) ( not ( = ?auto_290656 ?auto_290664 ) ) ( not ( = ?auto_290656 ?auto_290665 ) ) ( not ( = ?auto_290657 ?auto_290658 ) ) ( not ( = ?auto_290657 ?auto_290659 ) ) ( not ( = ?auto_290657 ?auto_290660 ) ) ( not ( = ?auto_290657 ?auto_290661 ) ) ( not ( = ?auto_290657 ?auto_290662 ) ) ( not ( = ?auto_290657 ?auto_290663 ) ) ( not ( = ?auto_290657 ?auto_290664 ) ) ( not ( = ?auto_290657 ?auto_290665 ) ) ( not ( = ?auto_290658 ?auto_290659 ) ) ( not ( = ?auto_290658 ?auto_290660 ) ) ( not ( = ?auto_290658 ?auto_290661 ) ) ( not ( = ?auto_290658 ?auto_290662 ) ) ( not ( = ?auto_290658 ?auto_290663 ) ) ( not ( = ?auto_290658 ?auto_290664 ) ) ( not ( = ?auto_290658 ?auto_290665 ) ) ( not ( = ?auto_290659 ?auto_290660 ) ) ( not ( = ?auto_290659 ?auto_290661 ) ) ( not ( = ?auto_290659 ?auto_290662 ) ) ( not ( = ?auto_290659 ?auto_290663 ) ) ( not ( = ?auto_290659 ?auto_290664 ) ) ( not ( = ?auto_290659 ?auto_290665 ) ) ( not ( = ?auto_290660 ?auto_290661 ) ) ( not ( = ?auto_290660 ?auto_290662 ) ) ( not ( = ?auto_290660 ?auto_290663 ) ) ( not ( = ?auto_290660 ?auto_290664 ) ) ( not ( = ?auto_290660 ?auto_290665 ) ) ( not ( = ?auto_290661 ?auto_290662 ) ) ( not ( = ?auto_290661 ?auto_290663 ) ) ( not ( = ?auto_290661 ?auto_290664 ) ) ( not ( = ?auto_290661 ?auto_290665 ) ) ( not ( = ?auto_290662 ?auto_290663 ) ) ( not ( = ?auto_290662 ?auto_290664 ) ) ( not ( = ?auto_290662 ?auto_290665 ) ) ( not ( = ?auto_290663 ?auto_290664 ) ) ( not ( = ?auto_290663 ?auto_290665 ) ) ( not ( = ?auto_290664 ?auto_290665 ) ) ( ON ?auto_290663 ?auto_290664 ) ( CLEAR ?auto_290661 ) ( ON ?auto_290662 ?auto_290663 ) ( CLEAR ?auto_290662 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_290652 ?auto_290653 ?auto_290654 ?auto_290655 ?auto_290656 ?auto_290657 ?auto_290658 ?auto_290659 ?auto_290660 ?auto_290661 ?auto_290662 )
      ( MAKE-13PILE ?auto_290652 ?auto_290653 ?auto_290654 ?auto_290655 ?auto_290656 ?auto_290657 ?auto_290658 ?auto_290659 ?auto_290660 ?auto_290661 ?auto_290662 ?auto_290663 ?auto_290664 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_290679 - BLOCK
      ?auto_290680 - BLOCK
      ?auto_290681 - BLOCK
      ?auto_290682 - BLOCK
      ?auto_290683 - BLOCK
      ?auto_290684 - BLOCK
      ?auto_290685 - BLOCK
      ?auto_290686 - BLOCK
      ?auto_290687 - BLOCK
      ?auto_290688 - BLOCK
      ?auto_290689 - BLOCK
      ?auto_290690 - BLOCK
      ?auto_290691 - BLOCK
    )
    :vars
    (
      ?auto_290692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290691 ?auto_290692 ) ( ON-TABLE ?auto_290679 ) ( ON ?auto_290680 ?auto_290679 ) ( ON ?auto_290681 ?auto_290680 ) ( ON ?auto_290682 ?auto_290681 ) ( ON ?auto_290683 ?auto_290682 ) ( ON ?auto_290684 ?auto_290683 ) ( ON ?auto_290685 ?auto_290684 ) ( ON ?auto_290686 ?auto_290685 ) ( ON ?auto_290687 ?auto_290686 ) ( ON ?auto_290688 ?auto_290687 ) ( not ( = ?auto_290679 ?auto_290680 ) ) ( not ( = ?auto_290679 ?auto_290681 ) ) ( not ( = ?auto_290679 ?auto_290682 ) ) ( not ( = ?auto_290679 ?auto_290683 ) ) ( not ( = ?auto_290679 ?auto_290684 ) ) ( not ( = ?auto_290679 ?auto_290685 ) ) ( not ( = ?auto_290679 ?auto_290686 ) ) ( not ( = ?auto_290679 ?auto_290687 ) ) ( not ( = ?auto_290679 ?auto_290688 ) ) ( not ( = ?auto_290679 ?auto_290689 ) ) ( not ( = ?auto_290679 ?auto_290690 ) ) ( not ( = ?auto_290679 ?auto_290691 ) ) ( not ( = ?auto_290679 ?auto_290692 ) ) ( not ( = ?auto_290680 ?auto_290681 ) ) ( not ( = ?auto_290680 ?auto_290682 ) ) ( not ( = ?auto_290680 ?auto_290683 ) ) ( not ( = ?auto_290680 ?auto_290684 ) ) ( not ( = ?auto_290680 ?auto_290685 ) ) ( not ( = ?auto_290680 ?auto_290686 ) ) ( not ( = ?auto_290680 ?auto_290687 ) ) ( not ( = ?auto_290680 ?auto_290688 ) ) ( not ( = ?auto_290680 ?auto_290689 ) ) ( not ( = ?auto_290680 ?auto_290690 ) ) ( not ( = ?auto_290680 ?auto_290691 ) ) ( not ( = ?auto_290680 ?auto_290692 ) ) ( not ( = ?auto_290681 ?auto_290682 ) ) ( not ( = ?auto_290681 ?auto_290683 ) ) ( not ( = ?auto_290681 ?auto_290684 ) ) ( not ( = ?auto_290681 ?auto_290685 ) ) ( not ( = ?auto_290681 ?auto_290686 ) ) ( not ( = ?auto_290681 ?auto_290687 ) ) ( not ( = ?auto_290681 ?auto_290688 ) ) ( not ( = ?auto_290681 ?auto_290689 ) ) ( not ( = ?auto_290681 ?auto_290690 ) ) ( not ( = ?auto_290681 ?auto_290691 ) ) ( not ( = ?auto_290681 ?auto_290692 ) ) ( not ( = ?auto_290682 ?auto_290683 ) ) ( not ( = ?auto_290682 ?auto_290684 ) ) ( not ( = ?auto_290682 ?auto_290685 ) ) ( not ( = ?auto_290682 ?auto_290686 ) ) ( not ( = ?auto_290682 ?auto_290687 ) ) ( not ( = ?auto_290682 ?auto_290688 ) ) ( not ( = ?auto_290682 ?auto_290689 ) ) ( not ( = ?auto_290682 ?auto_290690 ) ) ( not ( = ?auto_290682 ?auto_290691 ) ) ( not ( = ?auto_290682 ?auto_290692 ) ) ( not ( = ?auto_290683 ?auto_290684 ) ) ( not ( = ?auto_290683 ?auto_290685 ) ) ( not ( = ?auto_290683 ?auto_290686 ) ) ( not ( = ?auto_290683 ?auto_290687 ) ) ( not ( = ?auto_290683 ?auto_290688 ) ) ( not ( = ?auto_290683 ?auto_290689 ) ) ( not ( = ?auto_290683 ?auto_290690 ) ) ( not ( = ?auto_290683 ?auto_290691 ) ) ( not ( = ?auto_290683 ?auto_290692 ) ) ( not ( = ?auto_290684 ?auto_290685 ) ) ( not ( = ?auto_290684 ?auto_290686 ) ) ( not ( = ?auto_290684 ?auto_290687 ) ) ( not ( = ?auto_290684 ?auto_290688 ) ) ( not ( = ?auto_290684 ?auto_290689 ) ) ( not ( = ?auto_290684 ?auto_290690 ) ) ( not ( = ?auto_290684 ?auto_290691 ) ) ( not ( = ?auto_290684 ?auto_290692 ) ) ( not ( = ?auto_290685 ?auto_290686 ) ) ( not ( = ?auto_290685 ?auto_290687 ) ) ( not ( = ?auto_290685 ?auto_290688 ) ) ( not ( = ?auto_290685 ?auto_290689 ) ) ( not ( = ?auto_290685 ?auto_290690 ) ) ( not ( = ?auto_290685 ?auto_290691 ) ) ( not ( = ?auto_290685 ?auto_290692 ) ) ( not ( = ?auto_290686 ?auto_290687 ) ) ( not ( = ?auto_290686 ?auto_290688 ) ) ( not ( = ?auto_290686 ?auto_290689 ) ) ( not ( = ?auto_290686 ?auto_290690 ) ) ( not ( = ?auto_290686 ?auto_290691 ) ) ( not ( = ?auto_290686 ?auto_290692 ) ) ( not ( = ?auto_290687 ?auto_290688 ) ) ( not ( = ?auto_290687 ?auto_290689 ) ) ( not ( = ?auto_290687 ?auto_290690 ) ) ( not ( = ?auto_290687 ?auto_290691 ) ) ( not ( = ?auto_290687 ?auto_290692 ) ) ( not ( = ?auto_290688 ?auto_290689 ) ) ( not ( = ?auto_290688 ?auto_290690 ) ) ( not ( = ?auto_290688 ?auto_290691 ) ) ( not ( = ?auto_290688 ?auto_290692 ) ) ( not ( = ?auto_290689 ?auto_290690 ) ) ( not ( = ?auto_290689 ?auto_290691 ) ) ( not ( = ?auto_290689 ?auto_290692 ) ) ( not ( = ?auto_290690 ?auto_290691 ) ) ( not ( = ?auto_290690 ?auto_290692 ) ) ( not ( = ?auto_290691 ?auto_290692 ) ) ( ON ?auto_290690 ?auto_290691 ) ( CLEAR ?auto_290688 ) ( ON ?auto_290689 ?auto_290690 ) ( CLEAR ?auto_290689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_290679 ?auto_290680 ?auto_290681 ?auto_290682 ?auto_290683 ?auto_290684 ?auto_290685 ?auto_290686 ?auto_290687 ?auto_290688 ?auto_290689 )
      ( MAKE-13PILE ?auto_290679 ?auto_290680 ?auto_290681 ?auto_290682 ?auto_290683 ?auto_290684 ?auto_290685 ?auto_290686 ?auto_290687 ?auto_290688 ?auto_290689 ?auto_290690 ?auto_290691 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_290706 - BLOCK
      ?auto_290707 - BLOCK
      ?auto_290708 - BLOCK
      ?auto_290709 - BLOCK
      ?auto_290710 - BLOCK
      ?auto_290711 - BLOCK
      ?auto_290712 - BLOCK
      ?auto_290713 - BLOCK
      ?auto_290714 - BLOCK
      ?auto_290715 - BLOCK
      ?auto_290716 - BLOCK
      ?auto_290717 - BLOCK
      ?auto_290718 - BLOCK
    )
    :vars
    (
      ?auto_290719 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290718 ?auto_290719 ) ( ON-TABLE ?auto_290706 ) ( ON ?auto_290707 ?auto_290706 ) ( ON ?auto_290708 ?auto_290707 ) ( ON ?auto_290709 ?auto_290708 ) ( ON ?auto_290710 ?auto_290709 ) ( ON ?auto_290711 ?auto_290710 ) ( ON ?auto_290712 ?auto_290711 ) ( ON ?auto_290713 ?auto_290712 ) ( ON ?auto_290714 ?auto_290713 ) ( not ( = ?auto_290706 ?auto_290707 ) ) ( not ( = ?auto_290706 ?auto_290708 ) ) ( not ( = ?auto_290706 ?auto_290709 ) ) ( not ( = ?auto_290706 ?auto_290710 ) ) ( not ( = ?auto_290706 ?auto_290711 ) ) ( not ( = ?auto_290706 ?auto_290712 ) ) ( not ( = ?auto_290706 ?auto_290713 ) ) ( not ( = ?auto_290706 ?auto_290714 ) ) ( not ( = ?auto_290706 ?auto_290715 ) ) ( not ( = ?auto_290706 ?auto_290716 ) ) ( not ( = ?auto_290706 ?auto_290717 ) ) ( not ( = ?auto_290706 ?auto_290718 ) ) ( not ( = ?auto_290706 ?auto_290719 ) ) ( not ( = ?auto_290707 ?auto_290708 ) ) ( not ( = ?auto_290707 ?auto_290709 ) ) ( not ( = ?auto_290707 ?auto_290710 ) ) ( not ( = ?auto_290707 ?auto_290711 ) ) ( not ( = ?auto_290707 ?auto_290712 ) ) ( not ( = ?auto_290707 ?auto_290713 ) ) ( not ( = ?auto_290707 ?auto_290714 ) ) ( not ( = ?auto_290707 ?auto_290715 ) ) ( not ( = ?auto_290707 ?auto_290716 ) ) ( not ( = ?auto_290707 ?auto_290717 ) ) ( not ( = ?auto_290707 ?auto_290718 ) ) ( not ( = ?auto_290707 ?auto_290719 ) ) ( not ( = ?auto_290708 ?auto_290709 ) ) ( not ( = ?auto_290708 ?auto_290710 ) ) ( not ( = ?auto_290708 ?auto_290711 ) ) ( not ( = ?auto_290708 ?auto_290712 ) ) ( not ( = ?auto_290708 ?auto_290713 ) ) ( not ( = ?auto_290708 ?auto_290714 ) ) ( not ( = ?auto_290708 ?auto_290715 ) ) ( not ( = ?auto_290708 ?auto_290716 ) ) ( not ( = ?auto_290708 ?auto_290717 ) ) ( not ( = ?auto_290708 ?auto_290718 ) ) ( not ( = ?auto_290708 ?auto_290719 ) ) ( not ( = ?auto_290709 ?auto_290710 ) ) ( not ( = ?auto_290709 ?auto_290711 ) ) ( not ( = ?auto_290709 ?auto_290712 ) ) ( not ( = ?auto_290709 ?auto_290713 ) ) ( not ( = ?auto_290709 ?auto_290714 ) ) ( not ( = ?auto_290709 ?auto_290715 ) ) ( not ( = ?auto_290709 ?auto_290716 ) ) ( not ( = ?auto_290709 ?auto_290717 ) ) ( not ( = ?auto_290709 ?auto_290718 ) ) ( not ( = ?auto_290709 ?auto_290719 ) ) ( not ( = ?auto_290710 ?auto_290711 ) ) ( not ( = ?auto_290710 ?auto_290712 ) ) ( not ( = ?auto_290710 ?auto_290713 ) ) ( not ( = ?auto_290710 ?auto_290714 ) ) ( not ( = ?auto_290710 ?auto_290715 ) ) ( not ( = ?auto_290710 ?auto_290716 ) ) ( not ( = ?auto_290710 ?auto_290717 ) ) ( not ( = ?auto_290710 ?auto_290718 ) ) ( not ( = ?auto_290710 ?auto_290719 ) ) ( not ( = ?auto_290711 ?auto_290712 ) ) ( not ( = ?auto_290711 ?auto_290713 ) ) ( not ( = ?auto_290711 ?auto_290714 ) ) ( not ( = ?auto_290711 ?auto_290715 ) ) ( not ( = ?auto_290711 ?auto_290716 ) ) ( not ( = ?auto_290711 ?auto_290717 ) ) ( not ( = ?auto_290711 ?auto_290718 ) ) ( not ( = ?auto_290711 ?auto_290719 ) ) ( not ( = ?auto_290712 ?auto_290713 ) ) ( not ( = ?auto_290712 ?auto_290714 ) ) ( not ( = ?auto_290712 ?auto_290715 ) ) ( not ( = ?auto_290712 ?auto_290716 ) ) ( not ( = ?auto_290712 ?auto_290717 ) ) ( not ( = ?auto_290712 ?auto_290718 ) ) ( not ( = ?auto_290712 ?auto_290719 ) ) ( not ( = ?auto_290713 ?auto_290714 ) ) ( not ( = ?auto_290713 ?auto_290715 ) ) ( not ( = ?auto_290713 ?auto_290716 ) ) ( not ( = ?auto_290713 ?auto_290717 ) ) ( not ( = ?auto_290713 ?auto_290718 ) ) ( not ( = ?auto_290713 ?auto_290719 ) ) ( not ( = ?auto_290714 ?auto_290715 ) ) ( not ( = ?auto_290714 ?auto_290716 ) ) ( not ( = ?auto_290714 ?auto_290717 ) ) ( not ( = ?auto_290714 ?auto_290718 ) ) ( not ( = ?auto_290714 ?auto_290719 ) ) ( not ( = ?auto_290715 ?auto_290716 ) ) ( not ( = ?auto_290715 ?auto_290717 ) ) ( not ( = ?auto_290715 ?auto_290718 ) ) ( not ( = ?auto_290715 ?auto_290719 ) ) ( not ( = ?auto_290716 ?auto_290717 ) ) ( not ( = ?auto_290716 ?auto_290718 ) ) ( not ( = ?auto_290716 ?auto_290719 ) ) ( not ( = ?auto_290717 ?auto_290718 ) ) ( not ( = ?auto_290717 ?auto_290719 ) ) ( not ( = ?auto_290718 ?auto_290719 ) ) ( ON ?auto_290717 ?auto_290718 ) ( ON ?auto_290716 ?auto_290717 ) ( CLEAR ?auto_290714 ) ( ON ?auto_290715 ?auto_290716 ) ( CLEAR ?auto_290715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_290706 ?auto_290707 ?auto_290708 ?auto_290709 ?auto_290710 ?auto_290711 ?auto_290712 ?auto_290713 ?auto_290714 ?auto_290715 )
      ( MAKE-13PILE ?auto_290706 ?auto_290707 ?auto_290708 ?auto_290709 ?auto_290710 ?auto_290711 ?auto_290712 ?auto_290713 ?auto_290714 ?auto_290715 ?auto_290716 ?auto_290717 ?auto_290718 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_290733 - BLOCK
      ?auto_290734 - BLOCK
      ?auto_290735 - BLOCK
      ?auto_290736 - BLOCK
      ?auto_290737 - BLOCK
      ?auto_290738 - BLOCK
      ?auto_290739 - BLOCK
      ?auto_290740 - BLOCK
      ?auto_290741 - BLOCK
      ?auto_290742 - BLOCK
      ?auto_290743 - BLOCK
      ?auto_290744 - BLOCK
      ?auto_290745 - BLOCK
    )
    :vars
    (
      ?auto_290746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290745 ?auto_290746 ) ( ON-TABLE ?auto_290733 ) ( ON ?auto_290734 ?auto_290733 ) ( ON ?auto_290735 ?auto_290734 ) ( ON ?auto_290736 ?auto_290735 ) ( ON ?auto_290737 ?auto_290736 ) ( ON ?auto_290738 ?auto_290737 ) ( ON ?auto_290739 ?auto_290738 ) ( ON ?auto_290740 ?auto_290739 ) ( ON ?auto_290741 ?auto_290740 ) ( not ( = ?auto_290733 ?auto_290734 ) ) ( not ( = ?auto_290733 ?auto_290735 ) ) ( not ( = ?auto_290733 ?auto_290736 ) ) ( not ( = ?auto_290733 ?auto_290737 ) ) ( not ( = ?auto_290733 ?auto_290738 ) ) ( not ( = ?auto_290733 ?auto_290739 ) ) ( not ( = ?auto_290733 ?auto_290740 ) ) ( not ( = ?auto_290733 ?auto_290741 ) ) ( not ( = ?auto_290733 ?auto_290742 ) ) ( not ( = ?auto_290733 ?auto_290743 ) ) ( not ( = ?auto_290733 ?auto_290744 ) ) ( not ( = ?auto_290733 ?auto_290745 ) ) ( not ( = ?auto_290733 ?auto_290746 ) ) ( not ( = ?auto_290734 ?auto_290735 ) ) ( not ( = ?auto_290734 ?auto_290736 ) ) ( not ( = ?auto_290734 ?auto_290737 ) ) ( not ( = ?auto_290734 ?auto_290738 ) ) ( not ( = ?auto_290734 ?auto_290739 ) ) ( not ( = ?auto_290734 ?auto_290740 ) ) ( not ( = ?auto_290734 ?auto_290741 ) ) ( not ( = ?auto_290734 ?auto_290742 ) ) ( not ( = ?auto_290734 ?auto_290743 ) ) ( not ( = ?auto_290734 ?auto_290744 ) ) ( not ( = ?auto_290734 ?auto_290745 ) ) ( not ( = ?auto_290734 ?auto_290746 ) ) ( not ( = ?auto_290735 ?auto_290736 ) ) ( not ( = ?auto_290735 ?auto_290737 ) ) ( not ( = ?auto_290735 ?auto_290738 ) ) ( not ( = ?auto_290735 ?auto_290739 ) ) ( not ( = ?auto_290735 ?auto_290740 ) ) ( not ( = ?auto_290735 ?auto_290741 ) ) ( not ( = ?auto_290735 ?auto_290742 ) ) ( not ( = ?auto_290735 ?auto_290743 ) ) ( not ( = ?auto_290735 ?auto_290744 ) ) ( not ( = ?auto_290735 ?auto_290745 ) ) ( not ( = ?auto_290735 ?auto_290746 ) ) ( not ( = ?auto_290736 ?auto_290737 ) ) ( not ( = ?auto_290736 ?auto_290738 ) ) ( not ( = ?auto_290736 ?auto_290739 ) ) ( not ( = ?auto_290736 ?auto_290740 ) ) ( not ( = ?auto_290736 ?auto_290741 ) ) ( not ( = ?auto_290736 ?auto_290742 ) ) ( not ( = ?auto_290736 ?auto_290743 ) ) ( not ( = ?auto_290736 ?auto_290744 ) ) ( not ( = ?auto_290736 ?auto_290745 ) ) ( not ( = ?auto_290736 ?auto_290746 ) ) ( not ( = ?auto_290737 ?auto_290738 ) ) ( not ( = ?auto_290737 ?auto_290739 ) ) ( not ( = ?auto_290737 ?auto_290740 ) ) ( not ( = ?auto_290737 ?auto_290741 ) ) ( not ( = ?auto_290737 ?auto_290742 ) ) ( not ( = ?auto_290737 ?auto_290743 ) ) ( not ( = ?auto_290737 ?auto_290744 ) ) ( not ( = ?auto_290737 ?auto_290745 ) ) ( not ( = ?auto_290737 ?auto_290746 ) ) ( not ( = ?auto_290738 ?auto_290739 ) ) ( not ( = ?auto_290738 ?auto_290740 ) ) ( not ( = ?auto_290738 ?auto_290741 ) ) ( not ( = ?auto_290738 ?auto_290742 ) ) ( not ( = ?auto_290738 ?auto_290743 ) ) ( not ( = ?auto_290738 ?auto_290744 ) ) ( not ( = ?auto_290738 ?auto_290745 ) ) ( not ( = ?auto_290738 ?auto_290746 ) ) ( not ( = ?auto_290739 ?auto_290740 ) ) ( not ( = ?auto_290739 ?auto_290741 ) ) ( not ( = ?auto_290739 ?auto_290742 ) ) ( not ( = ?auto_290739 ?auto_290743 ) ) ( not ( = ?auto_290739 ?auto_290744 ) ) ( not ( = ?auto_290739 ?auto_290745 ) ) ( not ( = ?auto_290739 ?auto_290746 ) ) ( not ( = ?auto_290740 ?auto_290741 ) ) ( not ( = ?auto_290740 ?auto_290742 ) ) ( not ( = ?auto_290740 ?auto_290743 ) ) ( not ( = ?auto_290740 ?auto_290744 ) ) ( not ( = ?auto_290740 ?auto_290745 ) ) ( not ( = ?auto_290740 ?auto_290746 ) ) ( not ( = ?auto_290741 ?auto_290742 ) ) ( not ( = ?auto_290741 ?auto_290743 ) ) ( not ( = ?auto_290741 ?auto_290744 ) ) ( not ( = ?auto_290741 ?auto_290745 ) ) ( not ( = ?auto_290741 ?auto_290746 ) ) ( not ( = ?auto_290742 ?auto_290743 ) ) ( not ( = ?auto_290742 ?auto_290744 ) ) ( not ( = ?auto_290742 ?auto_290745 ) ) ( not ( = ?auto_290742 ?auto_290746 ) ) ( not ( = ?auto_290743 ?auto_290744 ) ) ( not ( = ?auto_290743 ?auto_290745 ) ) ( not ( = ?auto_290743 ?auto_290746 ) ) ( not ( = ?auto_290744 ?auto_290745 ) ) ( not ( = ?auto_290744 ?auto_290746 ) ) ( not ( = ?auto_290745 ?auto_290746 ) ) ( ON ?auto_290744 ?auto_290745 ) ( ON ?auto_290743 ?auto_290744 ) ( CLEAR ?auto_290741 ) ( ON ?auto_290742 ?auto_290743 ) ( CLEAR ?auto_290742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_290733 ?auto_290734 ?auto_290735 ?auto_290736 ?auto_290737 ?auto_290738 ?auto_290739 ?auto_290740 ?auto_290741 ?auto_290742 )
      ( MAKE-13PILE ?auto_290733 ?auto_290734 ?auto_290735 ?auto_290736 ?auto_290737 ?auto_290738 ?auto_290739 ?auto_290740 ?auto_290741 ?auto_290742 ?auto_290743 ?auto_290744 ?auto_290745 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_290760 - BLOCK
      ?auto_290761 - BLOCK
      ?auto_290762 - BLOCK
      ?auto_290763 - BLOCK
      ?auto_290764 - BLOCK
      ?auto_290765 - BLOCK
      ?auto_290766 - BLOCK
      ?auto_290767 - BLOCK
      ?auto_290768 - BLOCK
      ?auto_290769 - BLOCK
      ?auto_290770 - BLOCK
      ?auto_290771 - BLOCK
      ?auto_290772 - BLOCK
    )
    :vars
    (
      ?auto_290773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290772 ?auto_290773 ) ( ON-TABLE ?auto_290760 ) ( ON ?auto_290761 ?auto_290760 ) ( ON ?auto_290762 ?auto_290761 ) ( ON ?auto_290763 ?auto_290762 ) ( ON ?auto_290764 ?auto_290763 ) ( ON ?auto_290765 ?auto_290764 ) ( ON ?auto_290766 ?auto_290765 ) ( ON ?auto_290767 ?auto_290766 ) ( not ( = ?auto_290760 ?auto_290761 ) ) ( not ( = ?auto_290760 ?auto_290762 ) ) ( not ( = ?auto_290760 ?auto_290763 ) ) ( not ( = ?auto_290760 ?auto_290764 ) ) ( not ( = ?auto_290760 ?auto_290765 ) ) ( not ( = ?auto_290760 ?auto_290766 ) ) ( not ( = ?auto_290760 ?auto_290767 ) ) ( not ( = ?auto_290760 ?auto_290768 ) ) ( not ( = ?auto_290760 ?auto_290769 ) ) ( not ( = ?auto_290760 ?auto_290770 ) ) ( not ( = ?auto_290760 ?auto_290771 ) ) ( not ( = ?auto_290760 ?auto_290772 ) ) ( not ( = ?auto_290760 ?auto_290773 ) ) ( not ( = ?auto_290761 ?auto_290762 ) ) ( not ( = ?auto_290761 ?auto_290763 ) ) ( not ( = ?auto_290761 ?auto_290764 ) ) ( not ( = ?auto_290761 ?auto_290765 ) ) ( not ( = ?auto_290761 ?auto_290766 ) ) ( not ( = ?auto_290761 ?auto_290767 ) ) ( not ( = ?auto_290761 ?auto_290768 ) ) ( not ( = ?auto_290761 ?auto_290769 ) ) ( not ( = ?auto_290761 ?auto_290770 ) ) ( not ( = ?auto_290761 ?auto_290771 ) ) ( not ( = ?auto_290761 ?auto_290772 ) ) ( not ( = ?auto_290761 ?auto_290773 ) ) ( not ( = ?auto_290762 ?auto_290763 ) ) ( not ( = ?auto_290762 ?auto_290764 ) ) ( not ( = ?auto_290762 ?auto_290765 ) ) ( not ( = ?auto_290762 ?auto_290766 ) ) ( not ( = ?auto_290762 ?auto_290767 ) ) ( not ( = ?auto_290762 ?auto_290768 ) ) ( not ( = ?auto_290762 ?auto_290769 ) ) ( not ( = ?auto_290762 ?auto_290770 ) ) ( not ( = ?auto_290762 ?auto_290771 ) ) ( not ( = ?auto_290762 ?auto_290772 ) ) ( not ( = ?auto_290762 ?auto_290773 ) ) ( not ( = ?auto_290763 ?auto_290764 ) ) ( not ( = ?auto_290763 ?auto_290765 ) ) ( not ( = ?auto_290763 ?auto_290766 ) ) ( not ( = ?auto_290763 ?auto_290767 ) ) ( not ( = ?auto_290763 ?auto_290768 ) ) ( not ( = ?auto_290763 ?auto_290769 ) ) ( not ( = ?auto_290763 ?auto_290770 ) ) ( not ( = ?auto_290763 ?auto_290771 ) ) ( not ( = ?auto_290763 ?auto_290772 ) ) ( not ( = ?auto_290763 ?auto_290773 ) ) ( not ( = ?auto_290764 ?auto_290765 ) ) ( not ( = ?auto_290764 ?auto_290766 ) ) ( not ( = ?auto_290764 ?auto_290767 ) ) ( not ( = ?auto_290764 ?auto_290768 ) ) ( not ( = ?auto_290764 ?auto_290769 ) ) ( not ( = ?auto_290764 ?auto_290770 ) ) ( not ( = ?auto_290764 ?auto_290771 ) ) ( not ( = ?auto_290764 ?auto_290772 ) ) ( not ( = ?auto_290764 ?auto_290773 ) ) ( not ( = ?auto_290765 ?auto_290766 ) ) ( not ( = ?auto_290765 ?auto_290767 ) ) ( not ( = ?auto_290765 ?auto_290768 ) ) ( not ( = ?auto_290765 ?auto_290769 ) ) ( not ( = ?auto_290765 ?auto_290770 ) ) ( not ( = ?auto_290765 ?auto_290771 ) ) ( not ( = ?auto_290765 ?auto_290772 ) ) ( not ( = ?auto_290765 ?auto_290773 ) ) ( not ( = ?auto_290766 ?auto_290767 ) ) ( not ( = ?auto_290766 ?auto_290768 ) ) ( not ( = ?auto_290766 ?auto_290769 ) ) ( not ( = ?auto_290766 ?auto_290770 ) ) ( not ( = ?auto_290766 ?auto_290771 ) ) ( not ( = ?auto_290766 ?auto_290772 ) ) ( not ( = ?auto_290766 ?auto_290773 ) ) ( not ( = ?auto_290767 ?auto_290768 ) ) ( not ( = ?auto_290767 ?auto_290769 ) ) ( not ( = ?auto_290767 ?auto_290770 ) ) ( not ( = ?auto_290767 ?auto_290771 ) ) ( not ( = ?auto_290767 ?auto_290772 ) ) ( not ( = ?auto_290767 ?auto_290773 ) ) ( not ( = ?auto_290768 ?auto_290769 ) ) ( not ( = ?auto_290768 ?auto_290770 ) ) ( not ( = ?auto_290768 ?auto_290771 ) ) ( not ( = ?auto_290768 ?auto_290772 ) ) ( not ( = ?auto_290768 ?auto_290773 ) ) ( not ( = ?auto_290769 ?auto_290770 ) ) ( not ( = ?auto_290769 ?auto_290771 ) ) ( not ( = ?auto_290769 ?auto_290772 ) ) ( not ( = ?auto_290769 ?auto_290773 ) ) ( not ( = ?auto_290770 ?auto_290771 ) ) ( not ( = ?auto_290770 ?auto_290772 ) ) ( not ( = ?auto_290770 ?auto_290773 ) ) ( not ( = ?auto_290771 ?auto_290772 ) ) ( not ( = ?auto_290771 ?auto_290773 ) ) ( not ( = ?auto_290772 ?auto_290773 ) ) ( ON ?auto_290771 ?auto_290772 ) ( ON ?auto_290770 ?auto_290771 ) ( ON ?auto_290769 ?auto_290770 ) ( CLEAR ?auto_290767 ) ( ON ?auto_290768 ?auto_290769 ) ( CLEAR ?auto_290768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_290760 ?auto_290761 ?auto_290762 ?auto_290763 ?auto_290764 ?auto_290765 ?auto_290766 ?auto_290767 ?auto_290768 )
      ( MAKE-13PILE ?auto_290760 ?auto_290761 ?auto_290762 ?auto_290763 ?auto_290764 ?auto_290765 ?auto_290766 ?auto_290767 ?auto_290768 ?auto_290769 ?auto_290770 ?auto_290771 ?auto_290772 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_290787 - BLOCK
      ?auto_290788 - BLOCK
      ?auto_290789 - BLOCK
      ?auto_290790 - BLOCK
      ?auto_290791 - BLOCK
      ?auto_290792 - BLOCK
      ?auto_290793 - BLOCK
      ?auto_290794 - BLOCK
      ?auto_290795 - BLOCK
      ?auto_290796 - BLOCK
      ?auto_290797 - BLOCK
      ?auto_290798 - BLOCK
      ?auto_290799 - BLOCK
    )
    :vars
    (
      ?auto_290800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290799 ?auto_290800 ) ( ON-TABLE ?auto_290787 ) ( ON ?auto_290788 ?auto_290787 ) ( ON ?auto_290789 ?auto_290788 ) ( ON ?auto_290790 ?auto_290789 ) ( ON ?auto_290791 ?auto_290790 ) ( ON ?auto_290792 ?auto_290791 ) ( ON ?auto_290793 ?auto_290792 ) ( ON ?auto_290794 ?auto_290793 ) ( not ( = ?auto_290787 ?auto_290788 ) ) ( not ( = ?auto_290787 ?auto_290789 ) ) ( not ( = ?auto_290787 ?auto_290790 ) ) ( not ( = ?auto_290787 ?auto_290791 ) ) ( not ( = ?auto_290787 ?auto_290792 ) ) ( not ( = ?auto_290787 ?auto_290793 ) ) ( not ( = ?auto_290787 ?auto_290794 ) ) ( not ( = ?auto_290787 ?auto_290795 ) ) ( not ( = ?auto_290787 ?auto_290796 ) ) ( not ( = ?auto_290787 ?auto_290797 ) ) ( not ( = ?auto_290787 ?auto_290798 ) ) ( not ( = ?auto_290787 ?auto_290799 ) ) ( not ( = ?auto_290787 ?auto_290800 ) ) ( not ( = ?auto_290788 ?auto_290789 ) ) ( not ( = ?auto_290788 ?auto_290790 ) ) ( not ( = ?auto_290788 ?auto_290791 ) ) ( not ( = ?auto_290788 ?auto_290792 ) ) ( not ( = ?auto_290788 ?auto_290793 ) ) ( not ( = ?auto_290788 ?auto_290794 ) ) ( not ( = ?auto_290788 ?auto_290795 ) ) ( not ( = ?auto_290788 ?auto_290796 ) ) ( not ( = ?auto_290788 ?auto_290797 ) ) ( not ( = ?auto_290788 ?auto_290798 ) ) ( not ( = ?auto_290788 ?auto_290799 ) ) ( not ( = ?auto_290788 ?auto_290800 ) ) ( not ( = ?auto_290789 ?auto_290790 ) ) ( not ( = ?auto_290789 ?auto_290791 ) ) ( not ( = ?auto_290789 ?auto_290792 ) ) ( not ( = ?auto_290789 ?auto_290793 ) ) ( not ( = ?auto_290789 ?auto_290794 ) ) ( not ( = ?auto_290789 ?auto_290795 ) ) ( not ( = ?auto_290789 ?auto_290796 ) ) ( not ( = ?auto_290789 ?auto_290797 ) ) ( not ( = ?auto_290789 ?auto_290798 ) ) ( not ( = ?auto_290789 ?auto_290799 ) ) ( not ( = ?auto_290789 ?auto_290800 ) ) ( not ( = ?auto_290790 ?auto_290791 ) ) ( not ( = ?auto_290790 ?auto_290792 ) ) ( not ( = ?auto_290790 ?auto_290793 ) ) ( not ( = ?auto_290790 ?auto_290794 ) ) ( not ( = ?auto_290790 ?auto_290795 ) ) ( not ( = ?auto_290790 ?auto_290796 ) ) ( not ( = ?auto_290790 ?auto_290797 ) ) ( not ( = ?auto_290790 ?auto_290798 ) ) ( not ( = ?auto_290790 ?auto_290799 ) ) ( not ( = ?auto_290790 ?auto_290800 ) ) ( not ( = ?auto_290791 ?auto_290792 ) ) ( not ( = ?auto_290791 ?auto_290793 ) ) ( not ( = ?auto_290791 ?auto_290794 ) ) ( not ( = ?auto_290791 ?auto_290795 ) ) ( not ( = ?auto_290791 ?auto_290796 ) ) ( not ( = ?auto_290791 ?auto_290797 ) ) ( not ( = ?auto_290791 ?auto_290798 ) ) ( not ( = ?auto_290791 ?auto_290799 ) ) ( not ( = ?auto_290791 ?auto_290800 ) ) ( not ( = ?auto_290792 ?auto_290793 ) ) ( not ( = ?auto_290792 ?auto_290794 ) ) ( not ( = ?auto_290792 ?auto_290795 ) ) ( not ( = ?auto_290792 ?auto_290796 ) ) ( not ( = ?auto_290792 ?auto_290797 ) ) ( not ( = ?auto_290792 ?auto_290798 ) ) ( not ( = ?auto_290792 ?auto_290799 ) ) ( not ( = ?auto_290792 ?auto_290800 ) ) ( not ( = ?auto_290793 ?auto_290794 ) ) ( not ( = ?auto_290793 ?auto_290795 ) ) ( not ( = ?auto_290793 ?auto_290796 ) ) ( not ( = ?auto_290793 ?auto_290797 ) ) ( not ( = ?auto_290793 ?auto_290798 ) ) ( not ( = ?auto_290793 ?auto_290799 ) ) ( not ( = ?auto_290793 ?auto_290800 ) ) ( not ( = ?auto_290794 ?auto_290795 ) ) ( not ( = ?auto_290794 ?auto_290796 ) ) ( not ( = ?auto_290794 ?auto_290797 ) ) ( not ( = ?auto_290794 ?auto_290798 ) ) ( not ( = ?auto_290794 ?auto_290799 ) ) ( not ( = ?auto_290794 ?auto_290800 ) ) ( not ( = ?auto_290795 ?auto_290796 ) ) ( not ( = ?auto_290795 ?auto_290797 ) ) ( not ( = ?auto_290795 ?auto_290798 ) ) ( not ( = ?auto_290795 ?auto_290799 ) ) ( not ( = ?auto_290795 ?auto_290800 ) ) ( not ( = ?auto_290796 ?auto_290797 ) ) ( not ( = ?auto_290796 ?auto_290798 ) ) ( not ( = ?auto_290796 ?auto_290799 ) ) ( not ( = ?auto_290796 ?auto_290800 ) ) ( not ( = ?auto_290797 ?auto_290798 ) ) ( not ( = ?auto_290797 ?auto_290799 ) ) ( not ( = ?auto_290797 ?auto_290800 ) ) ( not ( = ?auto_290798 ?auto_290799 ) ) ( not ( = ?auto_290798 ?auto_290800 ) ) ( not ( = ?auto_290799 ?auto_290800 ) ) ( ON ?auto_290798 ?auto_290799 ) ( ON ?auto_290797 ?auto_290798 ) ( ON ?auto_290796 ?auto_290797 ) ( CLEAR ?auto_290794 ) ( ON ?auto_290795 ?auto_290796 ) ( CLEAR ?auto_290795 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_290787 ?auto_290788 ?auto_290789 ?auto_290790 ?auto_290791 ?auto_290792 ?auto_290793 ?auto_290794 ?auto_290795 )
      ( MAKE-13PILE ?auto_290787 ?auto_290788 ?auto_290789 ?auto_290790 ?auto_290791 ?auto_290792 ?auto_290793 ?auto_290794 ?auto_290795 ?auto_290796 ?auto_290797 ?auto_290798 ?auto_290799 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_290814 - BLOCK
      ?auto_290815 - BLOCK
      ?auto_290816 - BLOCK
      ?auto_290817 - BLOCK
      ?auto_290818 - BLOCK
      ?auto_290819 - BLOCK
      ?auto_290820 - BLOCK
      ?auto_290821 - BLOCK
      ?auto_290822 - BLOCK
      ?auto_290823 - BLOCK
      ?auto_290824 - BLOCK
      ?auto_290825 - BLOCK
      ?auto_290826 - BLOCK
    )
    :vars
    (
      ?auto_290827 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290826 ?auto_290827 ) ( ON-TABLE ?auto_290814 ) ( ON ?auto_290815 ?auto_290814 ) ( ON ?auto_290816 ?auto_290815 ) ( ON ?auto_290817 ?auto_290816 ) ( ON ?auto_290818 ?auto_290817 ) ( ON ?auto_290819 ?auto_290818 ) ( ON ?auto_290820 ?auto_290819 ) ( not ( = ?auto_290814 ?auto_290815 ) ) ( not ( = ?auto_290814 ?auto_290816 ) ) ( not ( = ?auto_290814 ?auto_290817 ) ) ( not ( = ?auto_290814 ?auto_290818 ) ) ( not ( = ?auto_290814 ?auto_290819 ) ) ( not ( = ?auto_290814 ?auto_290820 ) ) ( not ( = ?auto_290814 ?auto_290821 ) ) ( not ( = ?auto_290814 ?auto_290822 ) ) ( not ( = ?auto_290814 ?auto_290823 ) ) ( not ( = ?auto_290814 ?auto_290824 ) ) ( not ( = ?auto_290814 ?auto_290825 ) ) ( not ( = ?auto_290814 ?auto_290826 ) ) ( not ( = ?auto_290814 ?auto_290827 ) ) ( not ( = ?auto_290815 ?auto_290816 ) ) ( not ( = ?auto_290815 ?auto_290817 ) ) ( not ( = ?auto_290815 ?auto_290818 ) ) ( not ( = ?auto_290815 ?auto_290819 ) ) ( not ( = ?auto_290815 ?auto_290820 ) ) ( not ( = ?auto_290815 ?auto_290821 ) ) ( not ( = ?auto_290815 ?auto_290822 ) ) ( not ( = ?auto_290815 ?auto_290823 ) ) ( not ( = ?auto_290815 ?auto_290824 ) ) ( not ( = ?auto_290815 ?auto_290825 ) ) ( not ( = ?auto_290815 ?auto_290826 ) ) ( not ( = ?auto_290815 ?auto_290827 ) ) ( not ( = ?auto_290816 ?auto_290817 ) ) ( not ( = ?auto_290816 ?auto_290818 ) ) ( not ( = ?auto_290816 ?auto_290819 ) ) ( not ( = ?auto_290816 ?auto_290820 ) ) ( not ( = ?auto_290816 ?auto_290821 ) ) ( not ( = ?auto_290816 ?auto_290822 ) ) ( not ( = ?auto_290816 ?auto_290823 ) ) ( not ( = ?auto_290816 ?auto_290824 ) ) ( not ( = ?auto_290816 ?auto_290825 ) ) ( not ( = ?auto_290816 ?auto_290826 ) ) ( not ( = ?auto_290816 ?auto_290827 ) ) ( not ( = ?auto_290817 ?auto_290818 ) ) ( not ( = ?auto_290817 ?auto_290819 ) ) ( not ( = ?auto_290817 ?auto_290820 ) ) ( not ( = ?auto_290817 ?auto_290821 ) ) ( not ( = ?auto_290817 ?auto_290822 ) ) ( not ( = ?auto_290817 ?auto_290823 ) ) ( not ( = ?auto_290817 ?auto_290824 ) ) ( not ( = ?auto_290817 ?auto_290825 ) ) ( not ( = ?auto_290817 ?auto_290826 ) ) ( not ( = ?auto_290817 ?auto_290827 ) ) ( not ( = ?auto_290818 ?auto_290819 ) ) ( not ( = ?auto_290818 ?auto_290820 ) ) ( not ( = ?auto_290818 ?auto_290821 ) ) ( not ( = ?auto_290818 ?auto_290822 ) ) ( not ( = ?auto_290818 ?auto_290823 ) ) ( not ( = ?auto_290818 ?auto_290824 ) ) ( not ( = ?auto_290818 ?auto_290825 ) ) ( not ( = ?auto_290818 ?auto_290826 ) ) ( not ( = ?auto_290818 ?auto_290827 ) ) ( not ( = ?auto_290819 ?auto_290820 ) ) ( not ( = ?auto_290819 ?auto_290821 ) ) ( not ( = ?auto_290819 ?auto_290822 ) ) ( not ( = ?auto_290819 ?auto_290823 ) ) ( not ( = ?auto_290819 ?auto_290824 ) ) ( not ( = ?auto_290819 ?auto_290825 ) ) ( not ( = ?auto_290819 ?auto_290826 ) ) ( not ( = ?auto_290819 ?auto_290827 ) ) ( not ( = ?auto_290820 ?auto_290821 ) ) ( not ( = ?auto_290820 ?auto_290822 ) ) ( not ( = ?auto_290820 ?auto_290823 ) ) ( not ( = ?auto_290820 ?auto_290824 ) ) ( not ( = ?auto_290820 ?auto_290825 ) ) ( not ( = ?auto_290820 ?auto_290826 ) ) ( not ( = ?auto_290820 ?auto_290827 ) ) ( not ( = ?auto_290821 ?auto_290822 ) ) ( not ( = ?auto_290821 ?auto_290823 ) ) ( not ( = ?auto_290821 ?auto_290824 ) ) ( not ( = ?auto_290821 ?auto_290825 ) ) ( not ( = ?auto_290821 ?auto_290826 ) ) ( not ( = ?auto_290821 ?auto_290827 ) ) ( not ( = ?auto_290822 ?auto_290823 ) ) ( not ( = ?auto_290822 ?auto_290824 ) ) ( not ( = ?auto_290822 ?auto_290825 ) ) ( not ( = ?auto_290822 ?auto_290826 ) ) ( not ( = ?auto_290822 ?auto_290827 ) ) ( not ( = ?auto_290823 ?auto_290824 ) ) ( not ( = ?auto_290823 ?auto_290825 ) ) ( not ( = ?auto_290823 ?auto_290826 ) ) ( not ( = ?auto_290823 ?auto_290827 ) ) ( not ( = ?auto_290824 ?auto_290825 ) ) ( not ( = ?auto_290824 ?auto_290826 ) ) ( not ( = ?auto_290824 ?auto_290827 ) ) ( not ( = ?auto_290825 ?auto_290826 ) ) ( not ( = ?auto_290825 ?auto_290827 ) ) ( not ( = ?auto_290826 ?auto_290827 ) ) ( ON ?auto_290825 ?auto_290826 ) ( ON ?auto_290824 ?auto_290825 ) ( ON ?auto_290823 ?auto_290824 ) ( ON ?auto_290822 ?auto_290823 ) ( CLEAR ?auto_290820 ) ( ON ?auto_290821 ?auto_290822 ) ( CLEAR ?auto_290821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_290814 ?auto_290815 ?auto_290816 ?auto_290817 ?auto_290818 ?auto_290819 ?auto_290820 ?auto_290821 )
      ( MAKE-13PILE ?auto_290814 ?auto_290815 ?auto_290816 ?auto_290817 ?auto_290818 ?auto_290819 ?auto_290820 ?auto_290821 ?auto_290822 ?auto_290823 ?auto_290824 ?auto_290825 ?auto_290826 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_290841 - BLOCK
      ?auto_290842 - BLOCK
      ?auto_290843 - BLOCK
      ?auto_290844 - BLOCK
      ?auto_290845 - BLOCK
      ?auto_290846 - BLOCK
      ?auto_290847 - BLOCK
      ?auto_290848 - BLOCK
      ?auto_290849 - BLOCK
      ?auto_290850 - BLOCK
      ?auto_290851 - BLOCK
      ?auto_290852 - BLOCK
      ?auto_290853 - BLOCK
    )
    :vars
    (
      ?auto_290854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290853 ?auto_290854 ) ( ON-TABLE ?auto_290841 ) ( ON ?auto_290842 ?auto_290841 ) ( ON ?auto_290843 ?auto_290842 ) ( ON ?auto_290844 ?auto_290843 ) ( ON ?auto_290845 ?auto_290844 ) ( ON ?auto_290846 ?auto_290845 ) ( ON ?auto_290847 ?auto_290846 ) ( not ( = ?auto_290841 ?auto_290842 ) ) ( not ( = ?auto_290841 ?auto_290843 ) ) ( not ( = ?auto_290841 ?auto_290844 ) ) ( not ( = ?auto_290841 ?auto_290845 ) ) ( not ( = ?auto_290841 ?auto_290846 ) ) ( not ( = ?auto_290841 ?auto_290847 ) ) ( not ( = ?auto_290841 ?auto_290848 ) ) ( not ( = ?auto_290841 ?auto_290849 ) ) ( not ( = ?auto_290841 ?auto_290850 ) ) ( not ( = ?auto_290841 ?auto_290851 ) ) ( not ( = ?auto_290841 ?auto_290852 ) ) ( not ( = ?auto_290841 ?auto_290853 ) ) ( not ( = ?auto_290841 ?auto_290854 ) ) ( not ( = ?auto_290842 ?auto_290843 ) ) ( not ( = ?auto_290842 ?auto_290844 ) ) ( not ( = ?auto_290842 ?auto_290845 ) ) ( not ( = ?auto_290842 ?auto_290846 ) ) ( not ( = ?auto_290842 ?auto_290847 ) ) ( not ( = ?auto_290842 ?auto_290848 ) ) ( not ( = ?auto_290842 ?auto_290849 ) ) ( not ( = ?auto_290842 ?auto_290850 ) ) ( not ( = ?auto_290842 ?auto_290851 ) ) ( not ( = ?auto_290842 ?auto_290852 ) ) ( not ( = ?auto_290842 ?auto_290853 ) ) ( not ( = ?auto_290842 ?auto_290854 ) ) ( not ( = ?auto_290843 ?auto_290844 ) ) ( not ( = ?auto_290843 ?auto_290845 ) ) ( not ( = ?auto_290843 ?auto_290846 ) ) ( not ( = ?auto_290843 ?auto_290847 ) ) ( not ( = ?auto_290843 ?auto_290848 ) ) ( not ( = ?auto_290843 ?auto_290849 ) ) ( not ( = ?auto_290843 ?auto_290850 ) ) ( not ( = ?auto_290843 ?auto_290851 ) ) ( not ( = ?auto_290843 ?auto_290852 ) ) ( not ( = ?auto_290843 ?auto_290853 ) ) ( not ( = ?auto_290843 ?auto_290854 ) ) ( not ( = ?auto_290844 ?auto_290845 ) ) ( not ( = ?auto_290844 ?auto_290846 ) ) ( not ( = ?auto_290844 ?auto_290847 ) ) ( not ( = ?auto_290844 ?auto_290848 ) ) ( not ( = ?auto_290844 ?auto_290849 ) ) ( not ( = ?auto_290844 ?auto_290850 ) ) ( not ( = ?auto_290844 ?auto_290851 ) ) ( not ( = ?auto_290844 ?auto_290852 ) ) ( not ( = ?auto_290844 ?auto_290853 ) ) ( not ( = ?auto_290844 ?auto_290854 ) ) ( not ( = ?auto_290845 ?auto_290846 ) ) ( not ( = ?auto_290845 ?auto_290847 ) ) ( not ( = ?auto_290845 ?auto_290848 ) ) ( not ( = ?auto_290845 ?auto_290849 ) ) ( not ( = ?auto_290845 ?auto_290850 ) ) ( not ( = ?auto_290845 ?auto_290851 ) ) ( not ( = ?auto_290845 ?auto_290852 ) ) ( not ( = ?auto_290845 ?auto_290853 ) ) ( not ( = ?auto_290845 ?auto_290854 ) ) ( not ( = ?auto_290846 ?auto_290847 ) ) ( not ( = ?auto_290846 ?auto_290848 ) ) ( not ( = ?auto_290846 ?auto_290849 ) ) ( not ( = ?auto_290846 ?auto_290850 ) ) ( not ( = ?auto_290846 ?auto_290851 ) ) ( not ( = ?auto_290846 ?auto_290852 ) ) ( not ( = ?auto_290846 ?auto_290853 ) ) ( not ( = ?auto_290846 ?auto_290854 ) ) ( not ( = ?auto_290847 ?auto_290848 ) ) ( not ( = ?auto_290847 ?auto_290849 ) ) ( not ( = ?auto_290847 ?auto_290850 ) ) ( not ( = ?auto_290847 ?auto_290851 ) ) ( not ( = ?auto_290847 ?auto_290852 ) ) ( not ( = ?auto_290847 ?auto_290853 ) ) ( not ( = ?auto_290847 ?auto_290854 ) ) ( not ( = ?auto_290848 ?auto_290849 ) ) ( not ( = ?auto_290848 ?auto_290850 ) ) ( not ( = ?auto_290848 ?auto_290851 ) ) ( not ( = ?auto_290848 ?auto_290852 ) ) ( not ( = ?auto_290848 ?auto_290853 ) ) ( not ( = ?auto_290848 ?auto_290854 ) ) ( not ( = ?auto_290849 ?auto_290850 ) ) ( not ( = ?auto_290849 ?auto_290851 ) ) ( not ( = ?auto_290849 ?auto_290852 ) ) ( not ( = ?auto_290849 ?auto_290853 ) ) ( not ( = ?auto_290849 ?auto_290854 ) ) ( not ( = ?auto_290850 ?auto_290851 ) ) ( not ( = ?auto_290850 ?auto_290852 ) ) ( not ( = ?auto_290850 ?auto_290853 ) ) ( not ( = ?auto_290850 ?auto_290854 ) ) ( not ( = ?auto_290851 ?auto_290852 ) ) ( not ( = ?auto_290851 ?auto_290853 ) ) ( not ( = ?auto_290851 ?auto_290854 ) ) ( not ( = ?auto_290852 ?auto_290853 ) ) ( not ( = ?auto_290852 ?auto_290854 ) ) ( not ( = ?auto_290853 ?auto_290854 ) ) ( ON ?auto_290852 ?auto_290853 ) ( ON ?auto_290851 ?auto_290852 ) ( ON ?auto_290850 ?auto_290851 ) ( ON ?auto_290849 ?auto_290850 ) ( CLEAR ?auto_290847 ) ( ON ?auto_290848 ?auto_290849 ) ( CLEAR ?auto_290848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_290841 ?auto_290842 ?auto_290843 ?auto_290844 ?auto_290845 ?auto_290846 ?auto_290847 ?auto_290848 )
      ( MAKE-13PILE ?auto_290841 ?auto_290842 ?auto_290843 ?auto_290844 ?auto_290845 ?auto_290846 ?auto_290847 ?auto_290848 ?auto_290849 ?auto_290850 ?auto_290851 ?auto_290852 ?auto_290853 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_290868 - BLOCK
      ?auto_290869 - BLOCK
      ?auto_290870 - BLOCK
      ?auto_290871 - BLOCK
      ?auto_290872 - BLOCK
      ?auto_290873 - BLOCK
      ?auto_290874 - BLOCK
      ?auto_290875 - BLOCK
      ?auto_290876 - BLOCK
      ?auto_290877 - BLOCK
      ?auto_290878 - BLOCK
      ?auto_290879 - BLOCK
      ?auto_290880 - BLOCK
    )
    :vars
    (
      ?auto_290881 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290880 ?auto_290881 ) ( ON-TABLE ?auto_290868 ) ( ON ?auto_290869 ?auto_290868 ) ( ON ?auto_290870 ?auto_290869 ) ( ON ?auto_290871 ?auto_290870 ) ( ON ?auto_290872 ?auto_290871 ) ( ON ?auto_290873 ?auto_290872 ) ( not ( = ?auto_290868 ?auto_290869 ) ) ( not ( = ?auto_290868 ?auto_290870 ) ) ( not ( = ?auto_290868 ?auto_290871 ) ) ( not ( = ?auto_290868 ?auto_290872 ) ) ( not ( = ?auto_290868 ?auto_290873 ) ) ( not ( = ?auto_290868 ?auto_290874 ) ) ( not ( = ?auto_290868 ?auto_290875 ) ) ( not ( = ?auto_290868 ?auto_290876 ) ) ( not ( = ?auto_290868 ?auto_290877 ) ) ( not ( = ?auto_290868 ?auto_290878 ) ) ( not ( = ?auto_290868 ?auto_290879 ) ) ( not ( = ?auto_290868 ?auto_290880 ) ) ( not ( = ?auto_290868 ?auto_290881 ) ) ( not ( = ?auto_290869 ?auto_290870 ) ) ( not ( = ?auto_290869 ?auto_290871 ) ) ( not ( = ?auto_290869 ?auto_290872 ) ) ( not ( = ?auto_290869 ?auto_290873 ) ) ( not ( = ?auto_290869 ?auto_290874 ) ) ( not ( = ?auto_290869 ?auto_290875 ) ) ( not ( = ?auto_290869 ?auto_290876 ) ) ( not ( = ?auto_290869 ?auto_290877 ) ) ( not ( = ?auto_290869 ?auto_290878 ) ) ( not ( = ?auto_290869 ?auto_290879 ) ) ( not ( = ?auto_290869 ?auto_290880 ) ) ( not ( = ?auto_290869 ?auto_290881 ) ) ( not ( = ?auto_290870 ?auto_290871 ) ) ( not ( = ?auto_290870 ?auto_290872 ) ) ( not ( = ?auto_290870 ?auto_290873 ) ) ( not ( = ?auto_290870 ?auto_290874 ) ) ( not ( = ?auto_290870 ?auto_290875 ) ) ( not ( = ?auto_290870 ?auto_290876 ) ) ( not ( = ?auto_290870 ?auto_290877 ) ) ( not ( = ?auto_290870 ?auto_290878 ) ) ( not ( = ?auto_290870 ?auto_290879 ) ) ( not ( = ?auto_290870 ?auto_290880 ) ) ( not ( = ?auto_290870 ?auto_290881 ) ) ( not ( = ?auto_290871 ?auto_290872 ) ) ( not ( = ?auto_290871 ?auto_290873 ) ) ( not ( = ?auto_290871 ?auto_290874 ) ) ( not ( = ?auto_290871 ?auto_290875 ) ) ( not ( = ?auto_290871 ?auto_290876 ) ) ( not ( = ?auto_290871 ?auto_290877 ) ) ( not ( = ?auto_290871 ?auto_290878 ) ) ( not ( = ?auto_290871 ?auto_290879 ) ) ( not ( = ?auto_290871 ?auto_290880 ) ) ( not ( = ?auto_290871 ?auto_290881 ) ) ( not ( = ?auto_290872 ?auto_290873 ) ) ( not ( = ?auto_290872 ?auto_290874 ) ) ( not ( = ?auto_290872 ?auto_290875 ) ) ( not ( = ?auto_290872 ?auto_290876 ) ) ( not ( = ?auto_290872 ?auto_290877 ) ) ( not ( = ?auto_290872 ?auto_290878 ) ) ( not ( = ?auto_290872 ?auto_290879 ) ) ( not ( = ?auto_290872 ?auto_290880 ) ) ( not ( = ?auto_290872 ?auto_290881 ) ) ( not ( = ?auto_290873 ?auto_290874 ) ) ( not ( = ?auto_290873 ?auto_290875 ) ) ( not ( = ?auto_290873 ?auto_290876 ) ) ( not ( = ?auto_290873 ?auto_290877 ) ) ( not ( = ?auto_290873 ?auto_290878 ) ) ( not ( = ?auto_290873 ?auto_290879 ) ) ( not ( = ?auto_290873 ?auto_290880 ) ) ( not ( = ?auto_290873 ?auto_290881 ) ) ( not ( = ?auto_290874 ?auto_290875 ) ) ( not ( = ?auto_290874 ?auto_290876 ) ) ( not ( = ?auto_290874 ?auto_290877 ) ) ( not ( = ?auto_290874 ?auto_290878 ) ) ( not ( = ?auto_290874 ?auto_290879 ) ) ( not ( = ?auto_290874 ?auto_290880 ) ) ( not ( = ?auto_290874 ?auto_290881 ) ) ( not ( = ?auto_290875 ?auto_290876 ) ) ( not ( = ?auto_290875 ?auto_290877 ) ) ( not ( = ?auto_290875 ?auto_290878 ) ) ( not ( = ?auto_290875 ?auto_290879 ) ) ( not ( = ?auto_290875 ?auto_290880 ) ) ( not ( = ?auto_290875 ?auto_290881 ) ) ( not ( = ?auto_290876 ?auto_290877 ) ) ( not ( = ?auto_290876 ?auto_290878 ) ) ( not ( = ?auto_290876 ?auto_290879 ) ) ( not ( = ?auto_290876 ?auto_290880 ) ) ( not ( = ?auto_290876 ?auto_290881 ) ) ( not ( = ?auto_290877 ?auto_290878 ) ) ( not ( = ?auto_290877 ?auto_290879 ) ) ( not ( = ?auto_290877 ?auto_290880 ) ) ( not ( = ?auto_290877 ?auto_290881 ) ) ( not ( = ?auto_290878 ?auto_290879 ) ) ( not ( = ?auto_290878 ?auto_290880 ) ) ( not ( = ?auto_290878 ?auto_290881 ) ) ( not ( = ?auto_290879 ?auto_290880 ) ) ( not ( = ?auto_290879 ?auto_290881 ) ) ( not ( = ?auto_290880 ?auto_290881 ) ) ( ON ?auto_290879 ?auto_290880 ) ( ON ?auto_290878 ?auto_290879 ) ( ON ?auto_290877 ?auto_290878 ) ( ON ?auto_290876 ?auto_290877 ) ( ON ?auto_290875 ?auto_290876 ) ( CLEAR ?auto_290873 ) ( ON ?auto_290874 ?auto_290875 ) ( CLEAR ?auto_290874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_290868 ?auto_290869 ?auto_290870 ?auto_290871 ?auto_290872 ?auto_290873 ?auto_290874 )
      ( MAKE-13PILE ?auto_290868 ?auto_290869 ?auto_290870 ?auto_290871 ?auto_290872 ?auto_290873 ?auto_290874 ?auto_290875 ?auto_290876 ?auto_290877 ?auto_290878 ?auto_290879 ?auto_290880 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_290895 - BLOCK
      ?auto_290896 - BLOCK
      ?auto_290897 - BLOCK
      ?auto_290898 - BLOCK
      ?auto_290899 - BLOCK
      ?auto_290900 - BLOCK
      ?auto_290901 - BLOCK
      ?auto_290902 - BLOCK
      ?auto_290903 - BLOCK
      ?auto_290904 - BLOCK
      ?auto_290905 - BLOCK
      ?auto_290906 - BLOCK
      ?auto_290907 - BLOCK
    )
    :vars
    (
      ?auto_290908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290907 ?auto_290908 ) ( ON-TABLE ?auto_290895 ) ( ON ?auto_290896 ?auto_290895 ) ( ON ?auto_290897 ?auto_290896 ) ( ON ?auto_290898 ?auto_290897 ) ( ON ?auto_290899 ?auto_290898 ) ( ON ?auto_290900 ?auto_290899 ) ( not ( = ?auto_290895 ?auto_290896 ) ) ( not ( = ?auto_290895 ?auto_290897 ) ) ( not ( = ?auto_290895 ?auto_290898 ) ) ( not ( = ?auto_290895 ?auto_290899 ) ) ( not ( = ?auto_290895 ?auto_290900 ) ) ( not ( = ?auto_290895 ?auto_290901 ) ) ( not ( = ?auto_290895 ?auto_290902 ) ) ( not ( = ?auto_290895 ?auto_290903 ) ) ( not ( = ?auto_290895 ?auto_290904 ) ) ( not ( = ?auto_290895 ?auto_290905 ) ) ( not ( = ?auto_290895 ?auto_290906 ) ) ( not ( = ?auto_290895 ?auto_290907 ) ) ( not ( = ?auto_290895 ?auto_290908 ) ) ( not ( = ?auto_290896 ?auto_290897 ) ) ( not ( = ?auto_290896 ?auto_290898 ) ) ( not ( = ?auto_290896 ?auto_290899 ) ) ( not ( = ?auto_290896 ?auto_290900 ) ) ( not ( = ?auto_290896 ?auto_290901 ) ) ( not ( = ?auto_290896 ?auto_290902 ) ) ( not ( = ?auto_290896 ?auto_290903 ) ) ( not ( = ?auto_290896 ?auto_290904 ) ) ( not ( = ?auto_290896 ?auto_290905 ) ) ( not ( = ?auto_290896 ?auto_290906 ) ) ( not ( = ?auto_290896 ?auto_290907 ) ) ( not ( = ?auto_290896 ?auto_290908 ) ) ( not ( = ?auto_290897 ?auto_290898 ) ) ( not ( = ?auto_290897 ?auto_290899 ) ) ( not ( = ?auto_290897 ?auto_290900 ) ) ( not ( = ?auto_290897 ?auto_290901 ) ) ( not ( = ?auto_290897 ?auto_290902 ) ) ( not ( = ?auto_290897 ?auto_290903 ) ) ( not ( = ?auto_290897 ?auto_290904 ) ) ( not ( = ?auto_290897 ?auto_290905 ) ) ( not ( = ?auto_290897 ?auto_290906 ) ) ( not ( = ?auto_290897 ?auto_290907 ) ) ( not ( = ?auto_290897 ?auto_290908 ) ) ( not ( = ?auto_290898 ?auto_290899 ) ) ( not ( = ?auto_290898 ?auto_290900 ) ) ( not ( = ?auto_290898 ?auto_290901 ) ) ( not ( = ?auto_290898 ?auto_290902 ) ) ( not ( = ?auto_290898 ?auto_290903 ) ) ( not ( = ?auto_290898 ?auto_290904 ) ) ( not ( = ?auto_290898 ?auto_290905 ) ) ( not ( = ?auto_290898 ?auto_290906 ) ) ( not ( = ?auto_290898 ?auto_290907 ) ) ( not ( = ?auto_290898 ?auto_290908 ) ) ( not ( = ?auto_290899 ?auto_290900 ) ) ( not ( = ?auto_290899 ?auto_290901 ) ) ( not ( = ?auto_290899 ?auto_290902 ) ) ( not ( = ?auto_290899 ?auto_290903 ) ) ( not ( = ?auto_290899 ?auto_290904 ) ) ( not ( = ?auto_290899 ?auto_290905 ) ) ( not ( = ?auto_290899 ?auto_290906 ) ) ( not ( = ?auto_290899 ?auto_290907 ) ) ( not ( = ?auto_290899 ?auto_290908 ) ) ( not ( = ?auto_290900 ?auto_290901 ) ) ( not ( = ?auto_290900 ?auto_290902 ) ) ( not ( = ?auto_290900 ?auto_290903 ) ) ( not ( = ?auto_290900 ?auto_290904 ) ) ( not ( = ?auto_290900 ?auto_290905 ) ) ( not ( = ?auto_290900 ?auto_290906 ) ) ( not ( = ?auto_290900 ?auto_290907 ) ) ( not ( = ?auto_290900 ?auto_290908 ) ) ( not ( = ?auto_290901 ?auto_290902 ) ) ( not ( = ?auto_290901 ?auto_290903 ) ) ( not ( = ?auto_290901 ?auto_290904 ) ) ( not ( = ?auto_290901 ?auto_290905 ) ) ( not ( = ?auto_290901 ?auto_290906 ) ) ( not ( = ?auto_290901 ?auto_290907 ) ) ( not ( = ?auto_290901 ?auto_290908 ) ) ( not ( = ?auto_290902 ?auto_290903 ) ) ( not ( = ?auto_290902 ?auto_290904 ) ) ( not ( = ?auto_290902 ?auto_290905 ) ) ( not ( = ?auto_290902 ?auto_290906 ) ) ( not ( = ?auto_290902 ?auto_290907 ) ) ( not ( = ?auto_290902 ?auto_290908 ) ) ( not ( = ?auto_290903 ?auto_290904 ) ) ( not ( = ?auto_290903 ?auto_290905 ) ) ( not ( = ?auto_290903 ?auto_290906 ) ) ( not ( = ?auto_290903 ?auto_290907 ) ) ( not ( = ?auto_290903 ?auto_290908 ) ) ( not ( = ?auto_290904 ?auto_290905 ) ) ( not ( = ?auto_290904 ?auto_290906 ) ) ( not ( = ?auto_290904 ?auto_290907 ) ) ( not ( = ?auto_290904 ?auto_290908 ) ) ( not ( = ?auto_290905 ?auto_290906 ) ) ( not ( = ?auto_290905 ?auto_290907 ) ) ( not ( = ?auto_290905 ?auto_290908 ) ) ( not ( = ?auto_290906 ?auto_290907 ) ) ( not ( = ?auto_290906 ?auto_290908 ) ) ( not ( = ?auto_290907 ?auto_290908 ) ) ( ON ?auto_290906 ?auto_290907 ) ( ON ?auto_290905 ?auto_290906 ) ( ON ?auto_290904 ?auto_290905 ) ( ON ?auto_290903 ?auto_290904 ) ( ON ?auto_290902 ?auto_290903 ) ( CLEAR ?auto_290900 ) ( ON ?auto_290901 ?auto_290902 ) ( CLEAR ?auto_290901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_290895 ?auto_290896 ?auto_290897 ?auto_290898 ?auto_290899 ?auto_290900 ?auto_290901 )
      ( MAKE-13PILE ?auto_290895 ?auto_290896 ?auto_290897 ?auto_290898 ?auto_290899 ?auto_290900 ?auto_290901 ?auto_290902 ?auto_290903 ?auto_290904 ?auto_290905 ?auto_290906 ?auto_290907 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_290922 - BLOCK
      ?auto_290923 - BLOCK
      ?auto_290924 - BLOCK
      ?auto_290925 - BLOCK
      ?auto_290926 - BLOCK
      ?auto_290927 - BLOCK
      ?auto_290928 - BLOCK
      ?auto_290929 - BLOCK
      ?auto_290930 - BLOCK
      ?auto_290931 - BLOCK
      ?auto_290932 - BLOCK
      ?auto_290933 - BLOCK
      ?auto_290934 - BLOCK
    )
    :vars
    (
      ?auto_290935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290934 ?auto_290935 ) ( ON-TABLE ?auto_290922 ) ( ON ?auto_290923 ?auto_290922 ) ( ON ?auto_290924 ?auto_290923 ) ( ON ?auto_290925 ?auto_290924 ) ( ON ?auto_290926 ?auto_290925 ) ( not ( = ?auto_290922 ?auto_290923 ) ) ( not ( = ?auto_290922 ?auto_290924 ) ) ( not ( = ?auto_290922 ?auto_290925 ) ) ( not ( = ?auto_290922 ?auto_290926 ) ) ( not ( = ?auto_290922 ?auto_290927 ) ) ( not ( = ?auto_290922 ?auto_290928 ) ) ( not ( = ?auto_290922 ?auto_290929 ) ) ( not ( = ?auto_290922 ?auto_290930 ) ) ( not ( = ?auto_290922 ?auto_290931 ) ) ( not ( = ?auto_290922 ?auto_290932 ) ) ( not ( = ?auto_290922 ?auto_290933 ) ) ( not ( = ?auto_290922 ?auto_290934 ) ) ( not ( = ?auto_290922 ?auto_290935 ) ) ( not ( = ?auto_290923 ?auto_290924 ) ) ( not ( = ?auto_290923 ?auto_290925 ) ) ( not ( = ?auto_290923 ?auto_290926 ) ) ( not ( = ?auto_290923 ?auto_290927 ) ) ( not ( = ?auto_290923 ?auto_290928 ) ) ( not ( = ?auto_290923 ?auto_290929 ) ) ( not ( = ?auto_290923 ?auto_290930 ) ) ( not ( = ?auto_290923 ?auto_290931 ) ) ( not ( = ?auto_290923 ?auto_290932 ) ) ( not ( = ?auto_290923 ?auto_290933 ) ) ( not ( = ?auto_290923 ?auto_290934 ) ) ( not ( = ?auto_290923 ?auto_290935 ) ) ( not ( = ?auto_290924 ?auto_290925 ) ) ( not ( = ?auto_290924 ?auto_290926 ) ) ( not ( = ?auto_290924 ?auto_290927 ) ) ( not ( = ?auto_290924 ?auto_290928 ) ) ( not ( = ?auto_290924 ?auto_290929 ) ) ( not ( = ?auto_290924 ?auto_290930 ) ) ( not ( = ?auto_290924 ?auto_290931 ) ) ( not ( = ?auto_290924 ?auto_290932 ) ) ( not ( = ?auto_290924 ?auto_290933 ) ) ( not ( = ?auto_290924 ?auto_290934 ) ) ( not ( = ?auto_290924 ?auto_290935 ) ) ( not ( = ?auto_290925 ?auto_290926 ) ) ( not ( = ?auto_290925 ?auto_290927 ) ) ( not ( = ?auto_290925 ?auto_290928 ) ) ( not ( = ?auto_290925 ?auto_290929 ) ) ( not ( = ?auto_290925 ?auto_290930 ) ) ( not ( = ?auto_290925 ?auto_290931 ) ) ( not ( = ?auto_290925 ?auto_290932 ) ) ( not ( = ?auto_290925 ?auto_290933 ) ) ( not ( = ?auto_290925 ?auto_290934 ) ) ( not ( = ?auto_290925 ?auto_290935 ) ) ( not ( = ?auto_290926 ?auto_290927 ) ) ( not ( = ?auto_290926 ?auto_290928 ) ) ( not ( = ?auto_290926 ?auto_290929 ) ) ( not ( = ?auto_290926 ?auto_290930 ) ) ( not ( = ?auto_290926 ?auto_290931 ) ) ( not ( = ?auto_290926 ?auto_290932 ) ) ( not ( = ?auto_290926 ?auto_290933 ) ) ( not ( = ?auto_290926 ?auto_290934 ) ) ( not ( = ?auto_290926 ?auto_290935 ) ) ( not ( = ?auto_290927 ?auto_290928 ) ) ( not ( = ?auto_290927 ?auto_290929 ) ) ( not ( = ?auto_290927 ?auto_290930 ) ) ( not ( = ?auto_290927 ?auto_290931 ) ) ( not ( = ?auto_290927 ?auto_290932 ) ) ( not ( = ?auto_290927 ?auto_290933 ) ) ( not ( = ?auto_290927 ?auto_290934 ) ) ( not ( = ?auto_290927 ?auto_290935 ) ) ( not ( = ?auto_290928 ?auto_290929 ) ) ( not ( = ?auto_290928 ?auto_290930 ) ) ( not ( = ?auto_290928 ?auto_290931 ) ) ( not ( = ?auto_290928 ?auto_290932 ) ) ( not ( = ?auto_290928 ?auto_290933 ) ) ( not ( = ?auto_290928 ?auto_290934 ) ) ( not ( = ?auto_290928 ?auto_290935 ) ) ( not ( = ?auto_290929 ?auto_290930 ) ) ( not ( = ?auto_290929 ?auto_290931 ) ) ( not ( = ?auto_290929 ?auto_290932 ) ) ( not ( = ?auto_290929 ?auto_290933 ) ) ( not ( = ?auto_290929 ?auto_290934 ) ) ( not ( = ?auto_290929 ?auto_290935 ) ) ( not ( = ?auto_290930 ?auto_290931 ) ) ( not ( = ?auto_290930 ?auto_290932 ) ) ( not ( = ?auto_290930 ?auto_290933 ) ) ( not ( = ?auto_290930 ?auto_290934 ) ) ( not ( = ?auto_290930 ?auto_290935 ) ) ( not ( = ?auto_290931 ?auto_290932 ) ) ( not ( = ?auto_290931 ?auto_290933 ) ) ( not ( = ?auto_290931 ?auto_290934 ) ) ( not ( = ?auto_290931 ?auto_290935 ) ) ( not ( = ?auto_290932 ?auto_290933 ) ) ( not ( = ?auto_290932 ?auto_290934 ) ) ( not ( = ?auto_290932 ?auto_290935 ) ) ( not ( = ?auto_290933 ?auto_290934 ) ) ( not ( = ?auto_290933 ?auto_290935 ) ) ( not ( = ?auto_290934 ?auto_290935 ) ) ( ON ?auto_290933 ?auto_290934 ) ( ON ?auto_290932 ?auto_290933 ) ( ON ?auto_290931 ?auto_290932 ) ( ON ?auto_290930 ?auto_290931 ) ( ON ?auto_290929 ?auto_290930 ) ( ON ?auto_290928 ?auto_290929 ) ( CLEAR ?auto_290926 ) ( ON ?auto_290927 ?auto_290928 ) ( CLEAR ?auto_290927 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_290922 ?auto_290923 ?auto_290924 ?auto_290925 ?auto_290926 ?auto_290927 )
      ( MAKE-13PILE ?auto_290922 ?auto_290923 ?auto_290924 ?auto_290925 ?auto_290926 ?auto_290927 ?auto_290928 ?auto_290929 ?auto_290930 ?auto_290931 ?auto_290932 ?auto_290933 ?auto_290934 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_290949 - BLOCK
      ?auto_290950 - BLOCK
      ?auto_290951 - BLOCK
      ?auto_290952 - BLOCK
      ?auto_290953 - BLOCK
      ?auto_290954 - BLOCK
      ?auto_290955 - BLOCK
      ?auto_290956 - BLOCK
      ?auto_290957 - BLOCK
      ?auto_290958 - BLOCK
      ?auto_290959 - BLOCK
      ?auto_290960 - BLOCK
      ?auto_290961 - BLOCK
    )
    :vars
    (
      ?auto_290962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290961 ?auto_290962 ) ( ON-TABLE ?auto_290949 ) ( ON ?auto_290950 ?auto_290949 ) ( ON ?auto_290951 ?auto_290950 ) ( ON ?auto_290952 ?auto_290951 ) ( ON ?auto_290953 ?auto_290952 ) ( not ( = ?auto_290949 ?auto_290950 ) ) ( not ( = ?auto_290949 ?auto_290951 ) ) ( not ( = ?auto_290949 ?auto_290952 ) ) ( not ( = ?auto_290949 ?auto_290953 ) ) ( not ( = ?auto_290949 ?auto_290954 ) ) ( not ( = ?auto_290949 ?auto_290955 ) ) ( not ( = ?auto_290949 ?auto_290956 ) ) ( not ( = ?auto_290949 ?auto_290957 ) ) ( not ( = ?auto_290949 ?auto_290958 ) ) ( not ( = ?auto_290949 ?auto_290959 ) ) ( not ( = ?auto_290949 ?auto_290960 ) ) ( not ( = ?auto_290949 ?auto_290961 ) ) ( not ( = ?auto_290949 ?auto_290962 ) ) ( not ( = ?auto_290950 ?auto_290951 ) ) ( not ( = ?auto_290950 ?auto_290952 ) ) ( not ( = ?auto_290950 ?auto_290953 ) ) ( not ( = ?auto_290950 ?auto_290954 ) ) ( not ( = ?auto_290950 ?auto_290955 ) ) ( not ( = ?auto_290950 ?auto_290956 ) ) ( not ( = ?auto_290950 ?auto_290957 ) ) ( not ( = ?auto_290950 ?auto_290958 ) ) ( not ( = ?auto_290950 ?auto_290959 ) ) ( not ( = ?auto_290950 ?auto_290960 ) ) ( not ( = ?auto_290950 ?auto_290961 ) ) ( not ( = ?auto_290950 ?auto_290962 ) ) ( not ( = ?auto_290951 ?auto_290952 ) ) ( not ( = ?auto_290951 ?auto_290953 ) ) ( not ( = ?auto_290951 ?auto_290954 ) ) ( not ( = ?auto_290951 ?auto_290955 ) ) ( not ( = ?auto_290951 ?auto_290956 ) ) ( not ( = ?auto_290951 ?auto_290957 ) ) ( not ( = ?auto_290951 ?auto_290958 ) ) ( not ( = ?auto_290951 ?auto_290959 ) ) ( not ( = ?auto_290951 ?auto_290960 ) ) ( not ( = ?auto_290951 ?auto_290961 ) ) ( not ( = ?auto_290951 ?auto_290962 ) ) ( not ( = ?auto_290952 ?auto_290953 ) ) ( not ( = ?auto_290952 ?auto_290954 ) ) ( not ( = ?auto_290952 ?auto_290955 ) ) ( not ( = ?auto_290952 ?auto_290956 ) ) ( not ( = ?auto_290952 ?auto_290957 ) ) ( not ( = ?auto_290952 ?auto_290958 ) ) ( not ( = ?auto_290952 ?auto_290959 ) ) ( not ( = ?auto_290952 ?auto_290960 ) ) ( not ( = ?auto_290952 ?auto_290961 ) ) ( not ( = ?auto_290952 ?auto_290962 ) ) ( not ( = ?auto_290953 ?auto_290954 ) ) ( not ( = ?auto_290953 ?auto_290955 ) ) ( not ( = ?auto_290953 ?auto_290956 ) ) ( not ( = ?auto_290953 ?auto_290957 ) ) ( not ( = ?auto_290953 ?auto_290958 ) ) ( not ( = ?auto_290953 ?auto_290959 ) ) ( not ( = ?auto_290953 ?auto_290960 ) ) ( not ( = ?auto_290953 ?auto_290961 ) ) ( not ( = ?auto_290953 ?auto_290962 ) ) ( not ( = ?auto_290954 ?auto_290955 ) ) ( not ( = ?auto_290954 ?auto_290956 ) ) ( not ( = ?auto_290954 ?auto_290957 ) ) ( not ( = ?auto_290954 ?auto_290958 ) ) ( not ( = ?auto_290954 ?auto_290959 ) ) ( not ( = ?auto_290954 ?auto_290960 ) ) ( not ( = ?auto_290954 ?auto_290961 ) ) ( not ( = ?auto_290954 ?auto_290962 ) ) ( not ( = ?auto_290955 ?auto_290956 ) ) ( not ( = ?auto_290955 ?auto_290957 ) ) ( not ( = ?auto_290955 ?auto_290958 ) ) ( not ( = ?auto_290955 ?auto_290959 ) ) ( not ( = ?auto_290955 ?auto_290960 ) ) ( not ( = ?auto_290955 ?auto_290961 ) ) ( not ( = ?auto_290955 ?auto_290962 ) ) ( not ( = ?auto_290956 ?auto_290957 ) ) ( not ( = ?auto_290956 ?auto_290958 ) ) ( not ( = ?auto_290956 ?auto_290959 ) ) ( not ( = ?auto_290956 ?auto_290960 ) ) ( not ( = ?auto_290956 ?auto_290961 ) ) ( not ( = ?auto_290956 ?auto_290962 ) ) ( not ( = ?auto_290957 ?auto_290958 ) ) ( not ( = ?auto_290957 ?auto_290959 ) ) ( not ( = ?auto_290957 ?auto_290960 ) ) ( not ( = ?auto_290957 ?auto_290961 ) ) ( not ( = ?auto_290957 ?auto_290962 ) ) ( not ( = ?auto_290958 ?auto_290959 ) ) ( not ( = ?auto_290958 ?auto_290960 ) ) ( not ( = ?auto_290958 ?auto_290961 ) ) ( not ( = ?auto_290958 ?auto_290962 ) ) ( not ( = ?auto_290959 ?auto_290960 ) ) ( not ( = ?auto_290959 ?auto_290961 ) ) ( not ( = ?auto_290959 ?auto_290962 ) ) ( not ( = ?auto_290960 ?auto_290961 ) ) ( not ( = ?auto_290960 ?auto_290962 ) ) ( not ( = ?auto_290961 ?auto_290962 ) ) ( ON ?auto_290960 ?auto_290961 ) ( ON ?auto_290959 ?auto_290960 ) ( ON ?auto_290958 ?auto_290959 ) ( ON ?auto_290957 ?auto_290958 ) ( ON ?auto_290956 ?auto_290957 ) ( ON ?auto_290955 ?auto_290956 ) ( CLEAR ?auto_290953 ) ( ON ?auto_290954 ?auto_290955 ) ( CLEAR ?auto_290954 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_290949 ?auto_290950 ?auto_290951 ?auto_290952 ?auto_290953 ?auto_290954 )
      ( MAKE-13PILE ?auto_290949 ?auto_290950 ?auto_290951 ?auto_290952 ?auto_290953 ?auto_290954 ?auto_290955 ?auto_290956 ?auto_290957 ?auto_290958 ?auto_290959 ?auto_290960 ?auto_290961 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_290976 - BLOCK
      ?auto_290977 - BLOCK
      ?auto_290978 - BLOCK
      ?auto_290979 - BLOCK
      ?auto_290980 - BLOCK
      ?auto_290981 - BLOCK
      ?auto_290982 - BLOCK
      ?auto_290983 - BLOCK
      ?auto_290984 - BLOCK
      ?auto_290985 - BLOCK
      ?auto_290986 - BLOCK
      ?auto_290987 - BLOCK
      ?auto_290988 - BLOCK
    )
    :vars
    (
      ?auto_290989 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290988 ?auto_290989 ) ( ON-TABLE ?auto_290976 ) ( ON ?auto_290977 ?auto_290976 ) ( ON ?auto_290978 ?auto_290977 ) ( ON ?auto_290979 ?auto_290978 ) ( not ( = ?auto_290976 ?auto_290977 ) ) ( not ( = ?auto_290976 ?auto_290978 ) ) ( not ( = ?auto_290976 ?auto_290979 ) ) ( not ( = ?auto_290976 ?auto_290980 ) ) ( not ( = ?auto_290976 ?auto_290981 ) ) ( not ( = ?auto_290976 ?auto_290982 ) ) ( not ( = ?auto_290976 ?auto_290983 ) ) ( not ( = ?auto_290976 ?auto_290984 ) ) ( not ( = ?auto_290976 ?auto_290985 ) ) ( not ( = ?auto_290976 ?auto_290986 ) ) ( not ( = ?auto_290976 ?auto_290987 ) ) ( not ( = ?auto_290976 ?auto_290988 ) ) ( not ( = ?auto_290976 ?auto_290989 ) ) ( not ( = ?auto_290977 ?auto_290978 ) ) ( not ( = ?auto_290977 ?auto_290979 ) ) ( not ( = ?auto_290977 ?auto_290980 ) ) ( not ( = ?auto_290977 ?auto_290981 ) ) ( not ( = ?auto_290977 ?auto_290982 ) ) ( not ( = ?auto_290977 ?auto_290983 ) ) ( not ( = ?auto_290977 ?auto_290984 ) ) ( not ( = ?auto_290977 ?auto_290985 ) ) ( not ( = ?auto_290977 ?auto_290986 ) ) ( not ( = ?auto_290977 ?auto_290987 ) ) ( not ( = ?auto_290977 ?auto_290988 ) ) ( not ( = ?auto_290977 ?auto_290989 ) ) ( not ( = ?auto_290978 ?auto_290979 ) ) ( not ( = ?auto_290978 ?auto_290980 ) ) ( not ( = ?auto_290978 ?auto_290981 ) ) ( not ( = ?auto_290978 ?auto_290982 ) ) ( not ( = ?auto_290978 ?auto_290983 ) ) ( not ( = ?auto_290978 ?auto_290984 ) ) ( not ( = ?auto_290978 ?auto_290985 ) ) ( not ( = ?auto_290978 ?auto_290986 ) ) ( not ( = ?auto_290978 ?auto_290987 ) ) ( not ( = ?auto_290978 ?auto_290988 ) ) ( not ( = ?auto_290978 ?auto_290989 ) ) ( not ( = ?auto_290979 ?auto_290980 ) ) ( not ( = ?auto_290979 ?auto_290981 ) ) ( not ( = ?auto_290979 ?auto_290982 ) ) ( not ( = ?auto_290979 ?auto_290983 ) ) ( not ( = ?auto_290979 ?auto_290984 ) ) ( not ( = ?auto_290979 ?auto_290985 ) ) ( not ( = ?auto_290979 ?auto_290986 ) ) ( not ( = ?auto_290979 ?auto_290987 ) ) ( not ( = ?auto_290979 ?auto_290988 ) ) ( not ( = ?auto_290979 ?auto_290989 ) ) ( not ( = ?auto_290980 ?auto_290981 ) ) ( not ( = ?auto_290980 ?auto_290982 ) ) ( not ( = ?auto_290980 ?auto_290983 ) ) ( not ( = ?auto_290980 ?auto_290984 ) ) ( not ( = ?auto_290980 ?auto_290985 ) ) ( not ( = ?auto_290980 ?auto_290986 ) ) ( not ( = ?auto_290980 ?auto_290987 ) ) ( not ( = ?auto_290980 ?auto_290988 ) ) ( not ( = ?auto_290980 ?auto_290989 ) ) ( not ( = ?auto_290981 ?auto_290982 ) ) ( not ( = ?auto_290981 ?auto_290983 ) ) ( not ( = ?auto_290981 ?auto_290984 ) ) ( not ( = ?auto_290981 ?auto_290985 ) ) ( not ( = ?auto_290981 ?auto_290986 ) ) ( not ( = ?auto_290981 ?auto_290987 ) ) ( not ( = ?auto_290981 ?auto_290988 ) ) ( not ( = ?auto_290981 ?auto_290989 ) ) ( not ( = ?auto_290982 ?auto_290983 ) ) ( not ( = ?auto_290982 ?auto_290984 ) ) ( not ( = ?auto_290982 ?auto_290985 ) ) ( not ( = ?auto_290982 ?auto_290986 ) ) ( not ( = ?auto_290982 ?auto_290987 ) ) ( not ( = ?auto_290982 ?auto_290988 ) ) ( not ( = ?auto_290982 ?auto_290989 ) ) ( not ( = ?auto_290983 ?auto_290984 ) ) ( not ( = ?auto_290983 ?auto_290985 ) ) ( not ( = ?auto_290983 ?auto_290986 ) ) ( not ( = ?auto_290983 ?auto_290987 ) ) ( not ( = ?auto_290983 ?auto_290988 ) ) ( not ( = ?auto_290983 ?auto_290989 ) ) ( not ( = ?auto_290984 ?auto_290985 ) ) ( not ( = ?auto_290984 ?auto_290986 ) ) ( not ( = ?auto_290984 ?auto_290987 ) ) ( not ( = ?auto_290984 ?auto_290988 ) ) ( not ( = ?auto_290984 ?auto_290989 ) ) ( not ( = ?auto_290985 ?auto_290986 ) ) ( not ( = ?auto_290985 ?auto_290987 ) ) ( not ( = ?auto_290985 ?auto_290988 ) ) ( not ( = ?auto_290985 ?auto_290989 ) ) ( not ( = ?auto_290986 ?auto_290987 ) ) ( not ( = ?auto_290986 ?auto_290988 ) ) ( not ( = ?auto_290986 ?auto_290989 ) ) ( not ( = ?auto_290987 ?auto_290988 ) ) ( not ( = ?auto_290987 ?auto_290989 ) ) ( not ( = ?auto_290988 ?auto_290989 ) ) ( ON ?auto_290987 ?auto_290988 ) ( ON ?auto_290986 ?auto_290987 ) ( ON ?auto_290985 ?auto_290986 ) ( ON ?auto_290984 ?auto_290985 ) ( ON ?auto_290983 ?auto_290984 ) ( ON ?auto_290982 ?auto_290983 ) ( ON ?auto_290981 ?auto_290982 ) ( CLEAR ?auto_290979 ) ( ON ?auto_290980 ?auto_290981 ) ( CLEAR ?auto_290980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_290976 ?auto_290977 ?auto_290978 ?auto_290979 ?auto_290980 )
      ( MAKE-13PILE ?auto_290976 ?auto_290977 ?auto_290978 ?auto_290979 ?auto_290980 ?auto_290981 ?auto_290982 ?auto_290983 ?auto_290984 ?auto_290985 ?auto_290986 ?auto_290987 ?auto_290988 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_291003 - BLOCK
      ?auto_291004 - BLOCK
      ?auto_291005 - BLOCK
      ?auto_291006 - BLOCK
      ?auto_291007 - BLOCK
      ?auto_291008 - BLOCK
      ?auto_291009 - BLOCK
      ?auto_291010 - BLOCK
      ?auto_291011 - BLOCK
      ?auto_291012 - BLOCK
      ?auto_291013 - BLOCK
      ?auto_291014 - BLOCK
      ?auto_291015 - BLOCK
    )
    :vars
    (
      ?auto_291016 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_291015 ?auto_291016 ) ( ON-TABLE ?auto_291003 ) ( ON ?auto_291004 ?auto_291003 ) ( ON ?auto_291005 ?auto_291004 ) ( ON ?auto_291006 ?auto_291005 ) ( not ( = ?auto_291003 ?auto_291004 ) ) ( not ( = ?auto_291003 ?auto_291005 ) ) ( not ( = ?auto_291003 ?auto_291006 ) ) ( not ( = ?auto_291003 ?auto_291007 ) ) ( not ( = ?auto_291003 ?auto_291008 ) ) ( not ( = ?auto_291003 ?auto_291009 ) ) ( not ( = ?auto_291003 ?auto_291010 ) ) ( not ( = ?auto_291003 ?auto_291011 ) ) ( not ( = ?auto_291003 ?auto_291012 ) ) ( not ( = ?auto_291003 ?auto_291013 ) ) ( not ( = ?auto_291003 ?auto_291014 ) ) ( not ( = ?auto_291003 ?auto_291015 ) ) ( not ( = ?auto_291003 ?auto_291016 ) ) ( not ( = ?auto_291004 ?auto_291005 ) ) ( not ( = ?auto_291004 ?auto_291006 ) ) ( not ( = ?auto_291004 ?auto_291007 ) ) ( not ( = ?auto_291004 ?auto_291008 ) ) ( not ( = ?auto_291004 ?auto_291009 ) ) ( not ( = ?auto_291004 ?auto_291010 ) ) ( not ( = ?auto_291004 ?auto_291011 ) ) ( not ( = ?auto_291004 ?auto_291012 ) ) ( not ( = ?auto_291004 ?auto_291013 ) ) ( not ( = ?auto_291004 ?auto_291014 ) ) ( not ( = ?auto_291004 ?auto_291015 ) ) ( not ( = ?auto_291004 ?auto_291016 ) ) ( not ( = ?auto_291005 ?auto_291006 ) ) ( not ( = ?auto_291005 ?auto_291007 ) ) ( not ( = ?auto_291005 ?auto_291008 ) ) ( not ( = ?auto_291005 ?auto_291009 ) ) ( not ( = ?auto_291005 ?auto_291010 ) ) ( not ( = ?auto_291005 ?auto_291011 ) ) ( not ( = ?auto_291005 ?auto_291012 ) ) ( not ( = ?auto_291005 ?auto_291013 ) ) ( not ( = ?auto_291005 ?auto_291014 ) ) ( not ( = ?auto_291005 ?auto_291015 ) ) ( not ( = ?auto_291005 ?auto_291016 ) ) ( not ( = ?auto_291006 ?auto_291007 ) ) ( not ( = ?auto_291006 ?auto_291008 ) ) ( not ( = ?auto_291006 ?auto_291009 ) ) ( not ( = ?auto_291006 ?auto_291010 ) ) ( not ( = ?auto_291006 ?auto_291011 ) ) ( not ( = ?auto_291006 ?auto_291012 ) ) ( not ( = ?auto_291006 ?auto_291013 ) ) ( not ( = ?auto_291006 ?auto_291014 ) ) ( not ( = ?auto_291006 ?auto_291015 ) ) ( not ( = ?auto_291006 ?auto_291016 ) ) ( not ( = ?auto_291007 ?auto_291008 ) ) ( not ( = ?auto_291007 ?auto_291009 ) ) ( not ( = ?auto_291007 ?auto_291010 ) ) ( not ( = ?auto_291007 ?auto_291011 ) ) ( not ( = ?auto_291007 ?auto_291012 ) ) ( not ( = ?auto_291007 ?auto_291013 ) ) ( not ( = ?auto_291007 ?auto_291014 ) ) ( not ( = ?auto_291007 ?auto_291015 ) ) ( not ( = ?auto_291007 ?auto_291016 ) ) ( not ( = ?auto_291008 ?auto_291009 ) ) ( not ( = ?auto_291008 ?auto_291010 ) ) ( not ( = ?auto_291008 ?auto_291011 ) ) ( not ( = ?auto_291008 ?auto_291012 ) ) ( not ( = ?auto_291008 ?auto_291013 ) ) ( not ( = ?auto_291008 ?auto_291014 ) ) ( not ( = ?auto_291008 ?auto_291015 ) ) ( not ( = ?auto_291008 ?auto_291016 ) ) ( not ( = ?auto_291009 ?auto_291010 ) ) ( not ( = ?auto_291009 ?auto_291011 ) ) ( not ( = ?auto_291009 ?auto_291012 ) ) ( not ( = ?auto_291009 ?auto_291013 ) ) ( not ( = ?auto_291009 ?auto_291014 ) ) ( not ( = ?auto_291009 ?auto_291015 ) ) ( not ( = ?auto_291009 ?auto_291016 ) ) ( not ( = ?auto_291010 ?auto_291011 ) ) ( not ( = ?auto_291010 ?auto_291012 ) ) ( not ( = ?auto_291010 ?auto_291013 ) ) ( not ( = ?auto_291010 ?auto_291014 ) ) ( not ( = ?auto_291010 ?auto_291015 ) ) ( not ( = ?auto_291010 ?auto_291016 ) ) ( not ( = ?auto_291011 ?auto_291012 ) ) ( not ( = ?auto_291011 ?auto_291013 ) ) ( not ( = ?auto_291011 ?auto_291014 ) ) ( not ( = ?auto_291011 ?auto_291015 ) ) ( not ( = ?auto_291011 ?auto_291016 ) ) ( not ( = ?auto_291012 ?auto_291013 ) ) ( not ( = ?auto_291012 ?auto_291014 ) ) ( not ( = ?auto_291012 ?auto_291015 ) ) ( not ( = ?auto_291012 ?auto_291016 ) ) ( not ( = ?auto_291013 ?auto_291014 ) ) ( not ( = ?auto_291013 ?auto_291015 ) ) ( not ( = ?auto_291013 ?auto_291016 ) ) ( not ( = ?auto_291014 ?auto_291015 ) ) ( not ( = ?auto_291014 ?auto_291016 ) ) ( not ( = ?auto_291015 ?auto_291016 ) ) ( ON ?auto_291014 ?auto_291015 ) ( ON ?auto_291013 ?auto_291014 ) ( ON ?auto_291012 ?auto_291013 ) ( ON ?auto_291011 ?auto_291012 ) ( ON ?auto_291010 ?auto_291011 ) ( ON ?auto_291009 ?auto_291010 ) ( ON ?auto_291008 ?auto_291009 ) ( CLEAR ?auto_291006 ) ( ON ?auto_291007 ?auto_291008 ) ( CLEAR ?auto_291007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_291003 ?auto_291004 ?auto_291005 ?auto_291006 ?auto_291007 )
      ( MAKE-13PILE ?auto_291003 ?auto_291004 ?auto_291005 ?auto_291006 ?auto_291007 ?auto_291008 ?auto_291009 ?auto_291010 ?auto_291011 ?auto_291012 ?auto_291013 ?auto_291014 ?auto_291015 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_291030 - BLOCK
      ?auto_291031 - BLOCK
      ?auto_291032 - BLOCK
      ?auto_291033 - BLOCK
      ?auto_291034 - BLOCK
      ?auto_291035 - BLOCK
      ?auto_291036 - BLOCK
      ?auto_291037 - BLOCK
      ?auto_291038 - BLOCK
      ?auto_291039 - BLOCK
      ?auto_291040 - BLOCK
      ?auto_291041 - BLOCK
      ?auto_291042 - BLOCK
    )
    :vars
    (
      ?auto_291043 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_291042 ?auto_291043 ) ( ON-TABLE ?auto_291030 ) ( ON ?auto_291031 ?auto_291030 ) ( ON ?auto_291032 ?auto_291031 ) ( not ( = ?auto_291030 ?auto_291031 ) ) ( not ( = ?auto_291030 ?auto_291032 ) ) ( not ( = ?auto_291030 ?auto_291033 ) ) ( not ( = ?auto_291030 ?auto_291034 ) ) ( not ( = ?auto_291030 ?auto_291035 ) ) ( not ( = ?auto_291030 ?auto_291036 ) ) ( not ( = ?auto_291030 ?auto_291037 ) ) ( not ( = ?auto_291030 ?auto_291038 ) ) ( not ( = ?auto_291030 ?auto_291039 ) ) ( not ( = ?auto_291030 ?auto_291040 ) ) ( not ( = ?auto_291030 ?auto_291041 ) ) ( not ( = ?auto_291030 ?auto_291042 ) ) ( not ( = ?auto_291030 ?auto_291043 ) ) ( not ( = ?auto_291031 ?auto_291032 ) ) ( not ( = ?auto_291031 ?auto_291033 ) ) ( not ( = ?auto_291031 ?auto_291034 ) ) ( not ( = ?auto_291031 ?auto_291035 ) ) ( not ( = ?auto_291031 ?auto_291036 ) ) ( not ( = ?auto_291031 ?auto_291037 ) ) ( not ( = ?auto_291031 ?auto_291038 ) ) ( not ( = ?auto_291031 ?auto_291039 ) ) ( not ( = ?auto_291031 ?auto_291040 ) ) ( not ( = ?auto_291031 ?auto_291041 ) ) ( not ( = ?auto_291031 ?auto_291042 ) ) ( not ( = ?auto_291031 ?auto_291043 ) ) ( not ( = ?auto_291032 ?auto_291033 ) ) ( not ( = ?auto_291032 ?auto_291034 ) ) ( not ( = ?auto_291032 ?auto_291035 ) ) ( not ( = ?auto_291032 ?auto_291036 ) ) ( not ( = ?auto_291032 ?auto_291037 ) ) ( not ( = ?auto_291032 ?auto_291038 ) ) ( not ( = ?auto_291032 ?auto_291039 ) ) ( not ( = ?auto_291032 ?auto_291040 ) ) ( not ( = ?auto_291032 ?auto_291041 ) ) ( not ( = ?auto_291032 ?auto_291042 ) ) ( not ( = ?auto_291032 ?auto_291043 ) ) ( not ( = ?auto_291033 ?auto_291034 ) ) ( not ( = ?auto_291033 ?auto_291035 ) ) ( not ( = ?auto_291033 ?auto_291036 ) ) ( not ( = ?auto_291033 ?auto_291037 ) ) ( not ( = ?auto_291033 ?auto_291038 ) ) ( not ( = ?auto_291033 ?auto_291039 ) ) ( not ( = ?auto_291033 ?auto_291040 ) ) ( not ( = ?auto_291033 ?auto_291041 ) ) ( not ( = ?auto_291033 ?auto_291042 ) ) ( not ( = ?auto_291033 ?auto_291043 ) ) ( not ( = ?auto_291034 ?auto_291035 ) ) ( not ( = ?auto_291034 ?auto_291036 ) ) ( not ( = ?auto_291034 ?auto_291037 ) ) ( not ( = ?auto_291034 ?auto_291038 ) ) ( not ( = ?auto_291034 ?auto_291039 ) ) ( not ( = ?auto_291034 ?auto_291040 ) ) ( not ( = ?auto_291034 ?auto_291041 ) ) ( not ( = ?auto_291034 ?auto_291042 ) ) ( not ( = ?auto_291034 ?auto_291043 ) ) ( not ( = ?auto_291035 ?auto_291036 ) ) ( not ( = ?auto_291035 ?auto_291037 ) ) ( not ( = ?auto_291035 ?auto_291038 ) ) ( not ( = ?auto_291035 ?auto_291039 ) ) ( not ( = ?auto_291035 ?auto_291040 ) ) ( not ( = ?auto_291035 ?auto_291041 ) ) ( not ( = ?auto_291035 ?auto_291042 ) ) ( not ( = ?auto_291035 ?auto_291043 ) ) ( not ( = ?auto_291036 ?auto_291037 ) ) ( not ( = ?auto_291036 ?auto_291038 ) ) ( not ( = ?auto_291036 ?auto_291039 ) ) ( not ( = ?auto_291036 ?auto_291040 ) ) ( not ( = ?auto_291036 ?auto_291041 ) ) ( not ( = ?auto_291036 ?auto_291042 ) ) ( not ( = ?auto_291036 ?auto_291043 ) ) ( not ( = ?auto_291037 ?auto_291038 ) ) ( not ( = ?auto_291037 ?auto_291039 ) ) ( not ( = ?auto_291037 ?auto_291040 ) ) ( not ( = ?auto_291037 ?auto_291041 ) ) ( not ( = ?auto_291037 ?auto_291042 ) ) ( not ( = ?auto_291037 ?auto_291043 ) ) ( not ( = ?auto_291038 ?auto_291039 ) ) ( not ( = ?auto_291038 ?auto_291040 ) ) ( not ( = ?auto_291038 ?auto_291041 ) ) ( not ( = ?auto_291038 ?auto_291042 ) ) ( not ( = ?auto_291038 ?auto_291043 ) ) ( not ( = ?auto_291039 ?auto_291040 ) ) ( not ( = ?auto_291039 ?auto_291041 ) ) ( not ( = ?auto_291039 ?auto_291042 ) ) ( not ( = ?auto_291039 ?auto_291043 ) ) ( not ( = ?auto_291040 ?auto_291041 ) ) ( not ( = ?auto_291040 ?auto_291042 ) ) ( not ( = ?auto_291040 ?auto_291043 ) ) ( not ( = ?auto_291041 ?auto_291042 ) ) ( not ( = ?auto_291041 ?auto_291043 ) ) ( not ( = ?auto_291042 ?auto_291043 ) ) ( ON ?auto_291041 ?auto_291042 ) ( ON ?auto_291040 ?auto_291041 ) ( ON ?auto_291039 ?auto_291040 ) ( ON ?auto_291038 ?auto_291039 ) ( ON ?auto_291037 ?auto_291038 ) ( ON ?auto_291036 ?auto_291037 ) ( ON ?auto_291035 ?auto_291036 ) ( ON ?auto_291034 ?auto_291035 ) ( CLEAR ?auto_291032 ) ( ON ?auto_291033 ?auto_291034 ) ( CLEAR ?auto_291033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_291030 ?auto_291031 ?auto_291032 ?auto_291033 )
      ( MAKE-13PILE ?auto_291030 ?auto_291031 ?auto_291032 ?auto_291033 ?auto_291034 ?auto_291035 ?auto_291036 ?auto_291037 ?auto_291038 ?auto_291039 ?auto_291040 ?auto_291041 ?auto_291042 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_291057 - BLOCK
      ?auto_291058 - BLOCK
      ?auto_291059 - BLOCK
      ?auto_291060 - BLOCK
      ?auto_291061 - BLOCK
      ?auto_291062 - BLOCK
      ?auto_291063 - BLOCK
      ?auto_291064 - BLOCK
      ?auto_291065 - BLOCK
      ?auto_291066 - BLOCK
      ?auto_291067 - BLOCK
      ?auto_291068 - BLOCK
      ?auto_291069 - BLOCK
    )
    :vars
    (
      ?auto_291070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_291069 ?auto_291070 ) ( ON-TABLE ?auto_291057 ) ( ON ?auto_291058 ?auto_291057 ) ( ON ?auto_291059 ?auto_291058 ) ( not ( = ?auto_291057 ?auto_291058 ) ) ( not ( = ?auto_291057 ?auto_291059 ) ) ( not ( = ?auto_291057 ?auto_291060 ) ) ( not ( = ?auto_291057 ?auto_291061 ) ) ( not ( = ?auto_291057 ?auto_291062 ) ) ( not ( = ?auto_291057 ?auto_291063 ) ) ( not ( = ?auto_291057 ?auto_291064 ) ) ( not ( = ?auto_291057 ?auto_291065 ) ) ( not ( = ?auto_291057 ?auto_291066 ) ) ( not ( = ?auto_291057 ?auto_291067 ) ) ( not ( = ?auto_291057 ?auto_291068 ) ) ( not ( = ?auto_291057 ?auto_291069 ) ) ( not ( = ?auto_291057 ?auto_291070 ) ) ( not ( = ?auto_291058 ?auto_291059 ) ) ( not ( = ?auto_291058 ?auto_291060 ) ) ( not ( = ?auto_291058 ?auto_291061 ) ) ( not ( = ?auto_291058 ?auto_291062 ) ) ( not ( = ?auto_291058 ?auto_291063 ) ) ( not ( = ?auto_291058 ?auto_291064 ) ) ( not ( = ?auto_291058 ?auto_291065 ) ) ( not ( = ?auto_291058 ?auto_291066 ) ) ( not ( = ?auto_291058 ?auto_291067 ) ) ( not ( = ?auto_291058 ?auto_291068 ) ) ( not ( = ?auto_291058 ?auto_291069 ) ) ( not ( = ?auto_291058 ?auto_291070 ) ) ( not ( = ?auto_291059 ?auto_291060 ) ) ( not ( = ?auto_291059 ?auto_291061 ) ) ( not ( = ?auto_291059 ?auto_291062 ) ) ( not ( = ?auto_291059 ?auto_291063 ) ) ( not ( = ?auto_291059 ?auto_291064 ) ) ( not ( = ?auto_291059 ?auto_291065 ) ) ( not ( = ?auto_291059 ?auto_291066 ) ) ( not ( = ?auto_291059 ?auto_291067 ) ) ( not ( = ?auto_291059 ?auto_291068 ) ) ( not ( = ?auto_291059 ?auto_291069 ) ) ( not ( = ?auto_291059 ?auto_291070 ) ) ( not ( = ?auto_291060 ?auto_291061 ) ) ( not ( = ?auto_291060 ?auto_291062 ) ) ( not ( = ?auto_291060 ?auto_291063 ) ) ( not ( = ?auto_291060 ?auto_291064 ) ) ( not ( = ?auto_291060 ?auto_291065 ) ) ( not ( = ?auto_291060 ?auto_291066 ) ) ( not ( = ?auto_291060 ?auto_291067 ) ) ( not ( = ?auto_291060 ?auto_291068 ) ) ( not ( = ?auto_291060 ?auto_291069 ) ) ( not ( = ?auto_291060 ?auto_291070 ) ) ( not ( = ?auto_291061 ?auto_291062 ) ) ( not ( = ?auto_291061 ?auto_291063 ) ) ( not ( = ?auto_291061 ?auto_291064 ) ) ( not ( = ?auto_291061 ?auto_291065 ) ) ( not ( = ?auto_291061 ?auto_291066 ) ) ( not ( = ?auto_291061 ?auto_291067 ) ) ( not ( = ?auto_291061 ?auto_291068 ) ) ( not ( = ?auto_291061 ?auto_291069 ) ) ( not ( = ?auto_291061 ?auto_291070 ) ) ( not ( = ?auto_291062 ?auto_291063 ) ) ( not ( = ?auto_291062 ?auto_291064 ) ) ( not ( = ?auto_291062 ?auto_291065 ) ) ( not ( = ?auto_291062 ?auto_291066 ) ) ( not ( = ?auto_291062 ?auto_291067 ) ) ( not ( = ?auto_291062 ?auto_291068 ) ) ( not ( = ?auto_291062 ?auto_291069 ) ) ( not ( = ?auto_291062 ?auto_291070 ) ) ( not ( = ?auto_291063 ?auto_291064 ) ) ( not ( = ?auto_291063 ?auto_291065 ) ) ( not ( = ?auto_291063 ?auto_291066 ) ) ( not ( = ?auto_291063 ?auto_291067 ) ) ( not ( = ?auto_291063 ?auto_291068 ) ) ( not ( = ?auto_291063 ?auto_291069 ) ) ( not ( = ?auto_291063 ?auto_291070 ) ) ( not ( = ?auto_291064 ?auto_291065 ) ) ( not ( = ?auto_291064 ?auto_291066 ) ) ( not ( = ?auto_291064 ?auto_291067 ) ) ( not ( = ?auto_291064 ?auto_291068 ) ) ( not ( = ?auto_291064 ?auto_291069 ) ) ( not ( = ?auto_291064 ?auto_291070 ) ) ( not ( = ?auto_291065 ?auto_291066 ) ) ( not ( = ?auto_291065 ?auto_291067 ) ) ( not ( = ?auto_291065 ?auto_291068 ) ) ( not ( = ?auto_291065 ?auto_291069 ) ) ( not ( = ?auto_291065 ?auto_291070 ) ) ( not ( = ?auto_291066 ?auto_291067 ) ) ( not ( = ?auto_291066 ?auto_291068 ) ) ( not ( = ?auto_291066 ?auto_291069 ) ) ( not ( = ?auto_291066 ?auto_291070 ) ) ( not ( = ?auto_291067 ?auto_291068 ) ) ( not ( = ?auto_291067 ?auto_291069 ) ) ( not ( = ?auto_291067 ?auto_291070 ) ) ( not ( = ?auto_291068 ?auto_291069 ) ) ( not ( = ?auto_291068 ?auto_291070 ) ) ( not ( = ?auto_291069 ?auto_291070 ) ) ( ON ?auto_291068 ?auto_291069 ) ( ON ?auto_291067 ?auto_291068 ) ( ON ?auto_291066 ?auto_291067 ) ( ON ?auto_291065 ?auto_291066 ) ( ON ?auto_291064 ?auto_291065 ) ( ON ?auto_291063 ?auto_291064 ) ( ON ?auto_291062 ?auto_291063 ) ( ON ?auto_291061 ?auto_291062 ) ( CLEAR ?auto_291059 ) ( ON ?auto_291060 ?auto_291061 ) ( CLEAR ?auto_291060 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_291057 ?auto_291058 ?auto_291059 ?auto_291060 )
      ( MAKE-13PILE ?auto_291057 ?auto_291058 ?auto_291059 ?auto_291060 ?auto_291061 ?auto_291062 ?auto_291063 ?auto_291064 ?auto_291065 ?auto_291066 ?auto_291067 ?auto_291068 ?auto_291069 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_291084 - BLOCK
      ?auto_291085 - BLOCK
      ?auto_291086 - BLOCK
      ?auto_291087 - BLOCK
      ?auto_291088 - BLOCK
      ?auto_291089 - BLOCK
      ?auto_291090 - BLOCK
      ?auto_291091 - BLOCK
      ?auto_291092 - BLOCK
      ?auto_291093 - BLOCK
      ?auto_291094 - BLOCK
      ?auto_291095 - BLOCK
      ?auto_291096 - BLOCK
    )
    :vars
    (
      ?auto_291097 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_291096 ?auto_291097 ) ( ON-TABLE ?auto_291084 ) ( ON ?auto_291085 ?auto_291084 ) ( not ( = ?auto_291084 ?auto_291085 ) ) ( not ( = ?auto_291084 ?auto_291086 ) ) ( not ( = ?auto_291084 ?auto_291087 ) ) ( not ( = ?auto_291084 ?auto_291088 ) ) ( not ( = ?auto_291084 ?auto_291089 ) ) ( not ( = ?auto_291084 ?auto_291090 ) ) ( not ( = ?auto_291084 ?auto_291091 ) ) ( not ( = ?auto_291084 ?auto_291092 ) ) ( not ( = ?auto_291084 ?auto_291093 ) ) ( not ( = ?auto_291084 ?auto_291094 ) ) ( not ( = ?auto_291084 ?auto_291095 ) ) ( not ( = ?auto_291084 ?auto_291096 ) ) ( not ( = ?auto_291084 ?auto_291097 ) ) ( not ( = ?auto_291085 ?auto_291086 ) ) ( not ( = ?auto_291085 ?auto_291087 ) ) ( not ( = ?auto_291085 ?auto_291088 ) ) ( not ( = ?auto_291085 ?auto_291089 ) ) ( not ( = ?auto_291085 ?auto_291090 ) ) ( not ( = ?auto_291085 ?auto_291091 ) ) ( not ( = ?auto_291085 ?auto_291092 ) ) ( not ( = ?auto_291085 ?auto_291093 ) ) ( not ( = ?auto_291085 ?auto_291094 ) ) ( not ( = ?auto_291085 ?auto_291095 ) ) ( not ( = ?auto_291085 ?auto_291096 ) ) ( not ( = ?auto_291085 ?auto_291097 ) ) ( not ( = ?auto_291086 ?auto_291087 ) ) ( not ( = ?auto_291086 ?auto_291088 ) ) ( not ( = ?auto_291086 ?auto_291089 ) ) ( not ( = ?auto_291086 ?auto_291090 ) ) ( not ( = ?auto_291086 ?auto_291091 ) ) ( not ( = ?auto_291086 ?auto_291092 ) ) ( not ( = ?auto_291086 ?auto_291093 ) ) ( not ( = ?auto_291086 ?auto_291094 ) ) ( not ( = ?auto_291086 ?auto_291095 ) ) ( not ( = ?auto_291086 ?auto_291096 ) ) ( not ( = ?auto_291086 ?auto_291097 ) ) ( not ( = ?auto_291087 ?auto_291088 ) ) ( not ( = ?auto_291087 ?auto_291089 ) ) ( not ( = ?auto_291087 ?auto_291090 ) ) ( not ( = ?auto_291087 ?auto_291091 ) ) ( not ( = ?auto_291087 ?auto_291092 ) ) ( not ( = ?auto_291087 ?auto_291093 ) ) ( not ( = ?auto_291087 ?auto_291094 ) ) ( not ( = ?auto_291087 ?auto_291095 ) ) ( not ( = ?auto_291087 ?auto_291096 ) ) ( not ( = ?auto_291087 ?auto_291097 ) ) ( not ( = ?auto_291088 ?auto_291089 ) ) ( not ( = ?auto_291088 ?auto_291090 ) ) ( not ( = ?auto_291088 ?auto_291091 ) ) ( not ( = ?auto_291088 ?auto_291092 ) ) ( not ( = ?auto_291088 ?auto_291093 ) ) ( not ( = ?auto_291088 ?auto_291094 ) ) ( not ( = ?auto_291088 ?auto_291095 ) ) ( not ( = ?auto_291088 ?auto_291096 ) ) ( not ( = ?auto_291088 ?auto_291097 ) ) ( not ( = ?auto_291089 ?auto_291090 ) ) ( not ( = ?auto_291089 ?auto_291091 ) ) ( not ( = ?auto_291089 ?auto_291092 ) ) ( not ( = ?auto_291089 ?auto_291093 ) ) ( not ( = ?auto_291089 ?auto_291094 ) ) ( not ( = ?auto_291089 ?auto_291095 ) ) ( not ( = ?auto_291089 ?auto_291096 ) ) ( not ( = ?auto_291089 ?auto_291097 ) ) ( not ( = ?auto_291090 ?auto_291091 ) ) ( not ( = ?auto_291090 ?auto_291092 ) ) ( not ( = ?auto_291090 ?auto_291093 ) ) ( not ( = ?auto_291090 ?auto_291094 ) ) ( not ( = ?auto_291090 ?auto_291095 ) ) ( not ( = ?auto_291090 ?auto_291096 ) ) ( not ( = ?auto_291090 ?auto_291097 ) ) ( not ( = ?auto_291091 ?auto_291092 ) ) ( not ( = ?auto_291091 ?auto_291093 ) ) ( not ( = ?auto_291091 ?auto_291094 ) ) ( not ( = ?auto_291091 ?auto_291095 ) ) ( not ( = ?auto_291091 ?auto_291096 ) ) ( not ( = ?auto_291091 ?auto_291097 ) ) ( not ( = ?auto_291092 ?auto_291093 ) ) ( not ( = ?auto_291092 ?auto_291094 ) ) ( not ( = ?auto_291092 ?auto_291095 ) ) ( not ( = ?auto_291092 ?auto_291096 ) ) ( not ( = ?auto_291092 ?auto_291097 ) ) ( not ( = ?auto_291093 ?auto_291094 ) ) ( not ( = ?auto_291093 ?auto_291095 ) ) ( not ( = ?auto_291093 ?auto_291096 ) ) ( not ( = ?auto_291093 ?auto_291097 ) ) ( not ( = ?auto_291094 ?auto_291095 ) ) ( not ( = ?auto_291094 ?auto_291096 ) ) ( not ( = ?auto_291094 ?auto_291097 ) ) ( not ( = ?auto_291095 ?auto_291096 ) ) ( not ( = ?auto_291095 ?auto_291097 ) ) ( not ( = ?auto_291096 ?auto_291097 ) ) ( ON ?auto_291095 ?auto_291096 ) ( ON ?auto_291094 ?auto_291095 ) ( ON ?auto_291093 ?auto_291094 ) ( ON ?auto_291092 ?auto_291093 ) ( ON ?auto_291091 ?auto_291092 ) ( ON ?auto_291090 ?auto_291091 ) ( ON ?auto_291089 ?auto_291090 ) ( ON ?auto_291088 ?auto_291089 ) ( ON ?auto_291087 ?auto_291088 ) ( CLEAR ?auto_291085 ) ( ON ?auto_291086 ?auto_291087 ) ( CLEAR ?auto_291086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_291084 ?auto_291085 ?auto_291086 )
      ( MAKE-13PILE ?auto_291084 ?auto_291085 ?auto_291086 ?auto_291087 ?auto_291088 ?auto_291089 ?auto_291090 ?auto_291091 ?auto_291092 ?auto_291093 ?auto_291094 ?auto_291095 ?auto_291096 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_291111 - BLOCK
      ?auto_291112 - BLOCK
      ?auto_291113 - BLOCK
      ?auto_291114 - BLOCK
      ?auto_291115 - BLOCK
      ?auto_291116 - BLOCK
      ?auto_291117 - BLOCK
      ?auto_291118 - BLOCK
      ?auto_291119 - BLOCK
      ?auto_291120 - BLOCK
      ?auto_291121 - BLOCK
      ?auto_291122 - BLOCK
      ?auto_291123 - BLOCK
    )
    :vars
    (
      ?auto_291124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_291123 ?auto_291124 ) ( ON-TABLE ?auto_291111 ) ( ON ?auto_291112 ?auto_291111 ) ( not ( = ?auto_291111 ?auto_291112 ) ) ( not ( = ?auto_291111 ?auto_291113 ) ) ( not ( = ?auto_291111 ?auto_291114 ) ) ( not ( = ?auto_291111 ?auto_291115 ) ) ( not ( = ?auto_291111 ?auto_291116 ) ) ( not ( = ?auto_291111 ?auto_291117 ) ) ( not ( = ?auto_291111 ?auto_291118 ) ) ( not ( = ?auto_291111 ?auto_291119 ) ) ( not ( = ?auto_291111 ?auto_291120 ) ) ( not ( = ?auto_291111 ?auto_291121 ) ) ( not ( = ?auto_291111 ?auto_291122 ) ) ( not ( = ?auto_291111 ?auto_291123 ) ) ( not ( = ?auto_291111 ?auto_291124 ) ) ( not ( = ?auto_291112 ?auto_291113 ) ) ( not ( = ?auto_291112 ?auto_291114 ) ) ( not ( = ?auto_291112 ?auto_291115 ) ) ( not ( = ?auto_291112 ?auto_291116 ) ) ( not ( = ?auto_291112 ?auto_291117 ) ) ( not ( = ?auto_291112 ?auto_291118 ) ) ( not ( = ?auto_291112 ?auto_291119 ) ) ( not ( = ?auto_291112 ?auto_291120 ) ) ( not ( = ?auto_291112 ?auto_291121 ) ) ( not ( = ?auto_291112 ?auto_291122 ) ) ( not ( = ?auto_291112 ?auto_291123 ) ) ( not ( = ?auto_291112 ?auto_291124 ) ) ( not ( = ?auto_291113 ?auto_291114 ) ) ( not ( = ?auto_291113 ?auto_291115 ) ) ( not ( = ?auto_291113 ?auto_291116 ) ) ( not ( = ?auto_291113 ?auto_291117 ) ) ( not ( = ?auto_291113 ?auto_291118 ) ) ( not ( = ?auto_291113 ?auto_291119 ) ) ( not ( = ?auto_291113 ?auto_291120 ) ) ( not ( = ?auto_291113 ?auto_291121 ) ) ( not ( = ?auto_291113 ?auto_291122 ) ) ( not ( = ?auto_291113 ?auto_291123 ) ) ( not ( = ?auto_291113 ?auto_291124 ) ) ( not ( = ?auto_291114 ?auto_291115 ) ) ( not ( = ?auto_291114 ?auto_291116 ) ) ( not ( = ?auto_291114 ?auto_291117 ) ) ( not ( = ?auto_291114 ?auto_291118 ) ) ( not ( = ?auto_291114 ?auto_291119 ) ) ( not ( = ?auto_291114 ?auto_291120 ) ) ( not ( = ?auto_291114 ?auto_291121 ) ) ( not ( = ?auto_291114 ?auto_291122 ) ) ( not ( = ?auto_291114 ?auto_291123 ) ) ( not ( = ?auto_291114 ?auto_291124 ) ) ( not ( = ?auto_291115 ?auto_291116 ) ) ( not ( = ?auto_291115 ?auto_291117 ) ) ( not ( = ?auto_291115 ?auto_291118 ) ) ( not ( = ?auto_291115 ?auto_291119 ) ) ( not ( = ?auto_291115 ?auto_291120 ) ) ( not ( = ?auto_291115 ?auto_291121 ) ) ( not ( = ?auto_291115 ?auto_291122 ) ) ( not ( = ?auto_291115 ?auto_291123 ) ) ( not ( = ?auto_291115 ?auto_291124 ) ) ( not ( = ?auto_291116 ?auto_291117 ) ) ( not ( = ?auto_291116 ?auto_291118 ) ) ( not ( = ?auto_291116 ?auto_291119 ) ) ( not ( = ?auto_291116 ?auto_291120 ) ) ( not ( = ?auto_291116 ?auto_291121 ) ) ( not ( = ?auto_291116 ?auto_291122 ) ) ( not ( = ?auto_291116 ?auto_291123 ) ) ( not ( = ?auto_291116 ?auto_291124 ) ) ( not ( = ?auto_291117 ?auto_291118 ) ) ( not ( = ?auto_291117 ?auto_291119 ) ) ( not ( = ?auto_291117 ?auto_291120 ) ) ( not ( = ?auto_291117 ?auto_291121 ) ) ( not ( = ?auto_291117 ?auto_291122 ) ) ( not ( = ?auto_291117 ?auto_291123 ) ) ( not ( = ?auto_291117 ?auto_291124 ) ) ( not ( = ?auto_291118 ?auto_291119 ) ) ( not ( = ?auto_291118 ?auto_291120 ) ) ( not ( = ?auto_291118 ?auto_291121 ) ) ( not ( = ?auto_291118 ?auto_291122 ) ) ( not ( = ?auto_291118 ?auto_291123 ) ) ( not ( = ?auto_291118 ?auto_291124 ) ) ( not ( = ?auto_291119 ?auto_291120 ) ) ( not ( = ?auto_291119 ?auto_291121 ) ) ( not ( = ?auto_291119 ?auto_291122 ) ) ( not ( = ?auto_291119 ?auto_291123 ) ) ( not ( = ?auto_291119 ?auto_291124 ) ) ( not ( = ?auto_291120 ?auto_291121 ) ) ( not ( = ?auto_291120 ?auto_291122 ) ) ( not ( = ?auto_291120 ?auto_291123 ) ) ( not ( = ?auto_291120 ?auto_291124 ) ) ( not ( = ?auto_291121 ?auto_291122 ) ) ( not ( = ?auto_291121 ?auto_291123 ) ) ( not ( = ?auto_291121 ?auto_291124 ) ) ( not ( = ?auto_291122 ?auto_291123 ) ) ( not ( = ?auto_291122 ?auto_291124 ) ) ( not ( = ?auto_291123 ?auto_291124 ) ) ( ON ?auto_291122 ?auto_291123 ) ( ON ?auto_291121 ?auto_291122 ) ( ON ?auto_291120 ?auto_291121 ) ( ON ?auto_291119 ?auto_291120 ) ( ON ?auto_291118 ?auto_291119 ) ( ON ?auto_291117 ?auto_291118 ) ( ON ?auto_291116 ?auto_291117 ) ( ON ?auto_291115 ?auto_291116 ) ( ON ?auto_291114 ?auto_291115 ) ( CLEAR ?auto_291112 ) ( ON ?auto_291113 ?auto_291114 ) ( CLEAR ?auto_291113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_291111 ?auto_291112 ?auto_291113 )
      ( MAKE-13PILE ?auto_291111 ?auto_291112 ?auto_291113 ?auto_291114 ?auto_291115 ?auto_291116 ?auto_291117 ?auto_291118 ?auto_291119 ?auto_291120 ?auto_291121 ?auto_291122 ?auto_291123 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_291138 - BLOCK
      ?auto_291139 - BLOCK
      ?auto_291140 - BLOCK
      ?auto_291141 - BLOCK
      ?auto_291142 - BLOCK
      ?auto_291143 - BLOCK
      ?auto_291144 - BLOCK
      ?auto_291145 - BLOCK
      ?auto_291146 - BLOCK
      ?auto_291147 - BLOCK
      ?auto_291148 - BLOCK
      ?auto_291149 - BLOCK
      ?auto_291150 - BLOCK
    )
    :vars
    (
      ?auto_291151 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_291150 ?auto_291151 ) ( ON-TABLE ?auto_291138 ) ( not ( = ?auto_291138 ?auto_291139 ) ) ( not ( = ?auto_291138 ?auto_291140 ) ) ( not ( = ?auto_291138 ?auto_291141 ) ) ( not ( = ?auto_291138 ?auto_291142 ) ) ( not ( = ?auto_291138 ?auto_291143 ) ) ( not ( = ?auto_291138 ?auto_291144 ) ) ( not ( = ?auto_291138 ?auto_291145 ) ) ( not ( = ?auto_291138 ?auto_291146 ) ) ( not ( = ?auto_291138 ?auto_291147 ) ) ( not ( = ?auto_291138 ?auto_291148 ) ) ( not ( = ?auto_291138 ?auto_291149 ) ) ( not ( = ?auto_291138 ?auto_291150 ) ) ( not ( = ?auto_291138 ?auto_291151 ) ) ( not ( = ?auto_291139 ?auto_291140 ) ) ( not ( = ?auto_291139 ?auto_291141 ) ) ( not ( = ?auto_291139 ?auto_291142 ) ) ( not ( = ?auto_291139 ?auto_291143 ) ) ( not ( = ?auto_291139 ?auto_291144 ) ) ( not ( = ?auto_291139 ?auto_291145 ) ) ( not ( = ?auto_291139 ?auto_291146 ) ) ( not ( = ?auto_291139 ?auto_291147 ) ) ( not ( = ?auto_291139 ?auto_291148 ) ) ( not ( = ?auto_291139 ?auto_291149 ) ) ( not ( = ?auto_291139 ?auto_291150 ) ) ( not ( = ?auto_291139 ?auto_291151 ) ) ( not ( = ?auto_291140 ?auto_291141 ) ) ( not ( = ?auto_291140 ?auto_291142 ) ) ( not ( = ?auto_291140 ?auto_291143 ) ) ( not ( = ?auto_291140 ?auto_291144 ) ) ( not ( = ?auto_291140 ?auto_291145 ) ) ( not ( = ?auto_291140 ?auto_291146 ) ) ( not ( = ?auto_291140 ?auto_291147 ) ) ( not ( = ?auto_291140 ?auto_291148 ) ) ( not ( = ?auto_291140 ?auto_291149 ) ) ( not ( = ?auto_291140 ?auto_291150 ) ) ( not ( = ?auto_291140 ?auto_291151 ) ) ( not ( = ?auto_291141 ?auto_291142 ) ) ( not ( = ?auto_291141 ?auto_291143 ) ) ( not ( = ?auto_291141 ?auto_291144 ) ) ( not ( = ?auto_291141 ?auto_291145 ) ) ( not ( = ?auto_291141 ?auto_291146 ) ) ( not ( = ?auto_291141 ?auto_291147 ) ) ( not ( = ?auto_291141 ?auto_291148 ) ) ( not ( = ?auto_291141 ?auto_291149 ) ) ( not ( = ?auto_291141 ?auto_291150 ) ) ( not ( = ?auto_291141 ?auto_291151 ) ) ( not ( = ?auto_291142 ?auto_291143 ) ) ( not ( = ?auto_291142 ?auto_291144 ) ) ( not ( = ?auto_291142 ?auto_291145 ) ) ( not ( = ?auto_291142 ?auto_291146 ) ) ( not ( = ?auto_291142 ?auto_291147 ) ) ( not ( = ?auto_291142 ?auto_291148 ) ) ( not ( = ?auto_291142 ?auto_291149 ) ) ( not ( = ?auto_291142 ?auto_291150 ) ) ( not ( = ?auto_291142 ?auto_291151 ) ) ( not ( = ?auto_291143 ?auto_291144 ) ) ( not ( = ?auto_291143 ?auto_291145 ) ) ( not ( = ?auto_291143 ?auto_291146 ) ) ( not ( = ?auto_291143 ?auto_291147 ) ) ( not ( = ?auto_291143 ?auto_291148 ) ) ( not ( = ?auto_291143 ?auto_291149 ) ) ( not ( = ?auto_291143 ?auto_291150 ) ) ( not ( = ?auto_291143 ?auto_291151 ) ) ( not ( = ?auto_291144 ?auto_291145 ) ) ( not ( = ?auto_291144 ?auto_291146 ) ) ( not ( = ?auto_291144 ?auto_291147 ) ) ( not ( = ?auto_291144 ?auto_291148 ) ) ( not ( = ?auto_291144 ?auto_291149 ) ) ( not ( = ?auto_291144 ?auto_291150 ) ) ( not ( = ?auto_291144 ?auto_291151 ) ) ( not ( = ?auto_291145 ?auto_291146 ) ) ( not ( = ?auto_291145 ?auto_291147 ) ) ( not ( = ?auto_291145 ?auto_291148 ) ) ( not ( = ?auto_291145 ?auto_291149 ) ) ( not ( = ?auto_291145 ?auto_291150 ) ) ( not ( = ?auto_291145 ?auto_291151 ) ) ( not ( = ?auto_291146 ?auto_291147 ) ) ( not ( = ?auto_291146 ?auto_291148 ) ) ( not ( = ?auto_291146 ?auto_291149 ) ) ( not ( = ?auto_291146 ?auto_291150 ) ) ( not ( = ?auto_291146 ?auto_291151 ) ) ( not ( = ?auto_291147 ?auto_291148 ) ) ( not ( = ?auto_291147 ?auto_291149 ) ) ( not ( = ?auto_291147 ?auto_291150 ) ) ( not ( = ?auto_291147 ?auto_291151 ) ) ( not ( = ?auto_291148 ?auto_291149 ) ) ( not ( = ?auto_291148 ?auto_291150 ) ) ( not ( = ?auto_291148 ?auto_291151 ) ) ( not ( = ?auto_291149 ?auto_291150 ) ) ( not ( = ?auto_291149 ?auto_291151 ) ) ( not ( = ?auto_291150 ?auto_291151 ) ) ( ON ?auto_291149 ?auto_291150 ) ( ON ?auto_291148 ?auto_291149 ) ( ON ?auto_291147 ?auto_291148 ) ( ON ?auto_291146 ?auto_291147 ) ( ON ?auto_291145 ?auto_291146 ) ( ON ?auto_291144 ?auto_291145 ) ( ON ?auto_291143 ?auto_291144 ) ( ON ?auto_291142 ?auto_291143 ) ( ON ?auto_291141 ?auto_291142 ) ( ON ?auto_291140 ?auto_291141 ) ( CLEAR ?auto_291138 ) ( ON ?auto_291139 ?auto_291140 ) ( CLEAR ?auto_291139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_291138 ?auto_291139 )
      ( MAKE-13PILE ?auto_291138 ?auto_291139 ?auto_291140 ?auto_291141 ?auto_291142 ?auto_291143 ?auto_291144 ?auto_291145 ?auto_291146 ?auto_291147 ?auto_291148 ?auto_291149 ?auto_291150 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_291165 - BLOCK
      ?auto_291166 - BLOCK
      ?auto_291167 - BLOCK
      ?auto_291168 - BLOCK
      ?auto_291169 - BLOCK
      ?auto_291170 - BLOCK
      ?auto_291171 - BLOCK
      ?auto_291172 - BLOCK
      ?auto_291173 - BLOCK
      ?auto_291174 - BLOCK
      ?auto_291175 - BLOCK
      ?auto_291176 - BLOCK
      ?auto_291177 - BLOCK
    )
    :vars
    (
      ?auto_291178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_291177 ?auto_291178 ) ( ON-TABLE ?auto_291165 ) ( not ( = ?auto_291165 ?auto_291166 ) ) ( not ( = ?auto_291165 ?auto_291167 ) ) ( not ( = ?auto_291165 ?auto_291168 ) ) ( not ( = ?auto_291165 ?auto_291169 ) ) ( not ( = ?auto_291165 ?auto_291170 ) ) ( not ( = ?auto_291165 ?auto_291171 ) ) ( not ( = ?auto_291165 ?auto_291172 ) ) ( not ( = ?auto_291165 ?auto_291173 ) ) ( not ( = ?auto_291165 ?auto_291174 ) ) ( not ( = ?auto_291165 ?auto_291175 ) ) ( not ( = ?auto_291165 ?auto_291176 ) ) ( not ( = ?auto_291165 ?auto_291177 ) ) ( not ( = ?auto_291165 ?auto_291178 ) ) ( not ( = ?auto_291166 ?auto_291167 ) ) ( not ( = ?auto_291166 ?auto_291168 ) ) ( not ( = ?auto_291166 ?auto_291169 ) ) ( not ( = ?auto_291166 ?auto_291170 ) ) ( not ( = ?auto_291166 ?auto_291171 ) ) ( not ( = ?auto_291166 ?auto_291172 ) ) ( not ( = ?auto_291166 ?auto_291173 ) ) ( not ( = ?auto_291166 ?auto_291174 ) ) ( not ( = ?auto_291166 ?auto_291175 ) ) ( not ( = ?auto_291166 ?auto_291176 ) ) ( not ( = ?auto_291166 ?auto_291177 ) ) ( not ( = ?auto_291166 ?auto_291178 ) ) ( not ( = ?auto_291167 ?auto_291168 ) ) ( not ( = ?auto_291167 ?auto_291169 ) ) ( not ( = ?auto_291167 ?auto_291170 ) ) ( not ( = ?auto_291167 ?auto_291171 ) ) ( not ( = ?auto_291167 ?auto_291172 ) ) ( not ( = ?auto_291167 ?auto_291173 ) ) ( not ( = ?auto_291167 ?auto_291174 ) ) ( not ( = ?auto_291167 ?auto_291175 ) ) ( not ( = ?auto_291167 ?auto_291176 ) ) ( not ( = ?auto_291167 ?auto_291177 ) ) ( not ( = ?auto_291167 ?auto_291178 ) ) ( not ( = ?auto_291168 ?auto_291169 ) ) ( not ( = ?auto_291168 ?auto_291170 ) ) ( not ( = ?auto_291168 ?auto_291171 ) ) ( not ( = ?auto_291168 ?auto_291172 ) ) ( not ( = ?auto_291168 ?auto_291173 ) ) ( not ( = ?auto_291168 ?auto_291174 ) ) ( not ( = ?auto_291168 ?auto_291175 ) ) ( not ( = ?auto_291168 ?auto_291176 ) ) ( not ( = ?auto_291168 ?auto_291177 ) ) ( not ( = ?auto_291168 ?auto_291178 ) ) ( not ( = ?auto_291169 ?auto_291170 ) ) ( not ( = ?auto_291169 ?auto_291171 ) ) ( not ( = ?auto_291169 ?auto_291172 ) ) ( not ( = ?auto_291169 ?auto_291173 ) ) ( not ( = ?auto_291169 ?auto_291174 ) ) ( not ( = ?auto_291169 ?auto_291175 ) ) ( not ( = ?auto_291169 ?auto_291176 ) ) ( not ( = ?auto_291169 ?auto_291177 ) ) ( not ( = ?auto_291169 ?auto_291178 ) ) ( not ( = ?auto_291170 ?auto_291171 ) ) ( not ( = ?auto_291170 ?auto_291172 ) ) ( not ( = ?auto_291170 ?auto_291173 ) ) ( not ( = ?auto_291170 ?auto_291174 ) ) ( not ( = ?auto_291170 ?auto_291175 ) ) ( not ( = ?auto_291170 ?auto_291176 ) ) ( not ( = ?auto_291170 ?auto_291177 ) ) ( not ( = ?auto_291170 ?auto_291178 ) ) ( not ( = ?auto_291171 ?auto_291172 ) ) ( not ( = ?auto_291171 ?auto_291173 ) ) ( not ( = ?auto_291171 ?auto_291174 ) ) ( not ( = ?auto_291171 ?auto_291175 ) ) ( not ( = ?auto_291171 ?auto_291176 ) ) ( not ( = ?auto_291171 ?auto_291177 ) ) ( not ( = ?auto_291171 ?auto_291178 ) ) ( not ( = ?auto_291172 ?auto_291173 ) ) ( not ( = ?auto_291172 ?auto_291174 ) ) ( not ( = ?auto_291172 ?auto_291175 ) ) ( not ( = ?auto_291172 ?auto_291176 ) ) ( not ( = ?auto_291172 ?auto_291177 ) ) ( not ( = ?auto_291172 ?auto_291178 ) ) ( not ( = ?auto_291173 ?auto_291174 ) ) ( not ( = ?auto_291173 ?auto_291175 ) ) ( not ( = ?auto_291173 ?auto_291176 ) ) ( not ( = ?auto_291173 ?auto_291177 ) ) ( not ( = ?auto_291173 ?auto_291178 ) ) ( not ( = ?auto_291174 ?auto_291175 ) ) ( not ( = ?auto_291174 ?auto_291176 ) ) ( not ( = ?auto_291174 ?auto_291177 ) ) ( not ( = ?auto_291174 ?auto_291178 ) ) ( not ( = ?auto_291175 ?auto_291176 ) ) ( not ( = ?auto_291175 ?auto_291177 ) ) ( not ( = ?auto_291175 ?auto_291178 ) ) ( not ( = ?auto_291176 ?auto_291177 ) ) ( not ( = ?auto_291176 ?auto_291178 ) ) ( not ( = ?auto_291177 ?auto_291178 ) ) ( ON ?auto_291176 ?auto_291177 ) ( ON ?auto_291175 ?auto_291176 ) ( ON ?auto_291174 ?auto_291175 ) ( ON ?auto_291173 ?auto_291174 ) ( ON ?auto_291172 ?auto_291173 ) ( ON ?auto_291171 ?auto_291172 ) ( ON ?auto_291170 ?auto_291171 ) ( ON ?auto_291169 ?auto_291170 ) ( ON ?auto_291168 ?auto_291169 ) ( ON ?auto_291167 ?auto_291168 ) ( CLEAR ?auto_291165 ) ( ON ?auto_291166 ?auto_291167 ) ( CLEAR ?auto_291166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_291165 ?auto_291166 )
      ( MAKE-13PILE ?auto_291165 ?auto_291166 ?auto_291167 ?auto_291168 ?auto_291169 ?auto_291170 ?auto_291171 ?auto_291172 ?auto_291173 ?auto_291174 ?auto_291175 ?auto_291176 ?auto_291177 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_291192 - BLOCK
      ?auto_291193 - BLOCK
      ?auto_291194 - BLOCK
      ?auto_291195 - BLOCK
      ?auto_291196 - BLOCK
      ?auto_291197 - BLOCK
      ?auto_291198 - BLOCK
      ?auto_291199 - BLOCK
      ?auto_291200 - BLOCK
      ?auto_291201 - BLOCK
      ?auto_291202 - BLOCK
      ?auto_291203 - BLOCK
      ?auto_291204 - BLOCK
    )
    :vars
    (
      ?auto_291205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_291204 ?auto_291205 ) ( not ( = ?auto_291192 ?auto_291193 ) ) ( not ( = ?auto_291192 ?auto_291194 ) ) ( not ( = ?auto_291192 ?auto_291195 ) ) ( not ( = ?auto_291192 ?auto_291196 ) ) ( not ( = ?auto_291192 ?auto_291197 ) ) ( not ( = ?auto_291192 ?auto_291198 ) ) ( not ( = ?auto_291192 ?auto_291199 ) ) ( not ( = ?auto_291192 ?auto_291200 ) ) ( not ( = ?auto_291192 ?auto_291201 ) ) ( not ( = ?auto_291192 ?auto_291202 ) ) ( not ( = ?auto_291192 ?auto_291203 ) ) ( not ( = ?auto_291192 ?auto_291204 ) ) ( not ( = ?auto_291192 ?auto_291205 ) ) ( not ( = ?auto_291193 ?auto_291194 ) ) ( not ( = ?auto_291193 ?auto_291195 ) ) ( not ( = ?auto_291193 ?auto_291196 ) ) ( not ( = ?auto_291193 ?auto_291197 ) ) ( not ( = ?auto_291193 ?auto_291198 ) ) ( not ( = ?auto_291193 ?auto_291199 ) ) ( not ( = ?auto_291193 ?auto_291200 ) ) ( not ( = ?auto_291193 ?auto_291201 ) ) ( not ( = ?auto_291193 ?auto_291202 ) ) ( not ( = ?auto_291193 ?auto_291203 ) ) ( not ( = ?auto_291193 ?auto_291204 ) ) ( not ( = ?auto_291193 ?auto_291205 ) ) ( not ( = ?auto_291194 ?auto_291195 ) ) ( not ( = ?auto_291194 ?auto_291196 ) ) ( not ( = ?auto_291194 ?auto_291197 ) ) ( not ( = ?auto_291194 ?auto_291198 ) ) ( not ( = ?auto_291194 ?auto_291199 ) ) ( not ( = ?auto_291194 ?auto_291200 ) ) ( not ( = ?auto_291194 ?auto_291201 ) ) ( not ( = ?auto_291194 ?auto_291202 ) ) ( not ( = ?auto_291194 ?auto_291203 ) ) ( not ( = ?auto_291194 ?auto_291204 ) ) ( not ( = ?auto_291194 ?auto_291205 ) ) ( not ( = ?auto_291195 ?auto_291196 ) ) ( not ( = ?auto_291195 ?auto_291197 ) ) ( not ( = ?auto_291195 ?auto_291198 ) ) ( not ( = ?auto_291195 ?auto_291199 ) ) ( not ( = ?auto_291195 ?auto_291200 ) ) ( not ( = ?auto_291195 ?auto_291201 ) ) ( not ( = ?auto_291195 ?auto_291202 ) ) ( not ( = ?auto_291195 ?auto_291203 ) ) ( not ( = ?auto_291195 ?auto_291204 ) ) ( not ( = ?auto_291195 ?auto_291205 ) ) ( not ( = ?auto_291196 ?auto_291197 ) ) ( not ( = ?auto_291196 ?auto_291198 ) ) ( not ( = ?auto_291196 ?auto_291199 ) ) ( not ( = ?auto_291196 ?auto_291200 ) ) ( not ( = ?auto_291196 ?auto_291201 ) ) ( not ( = ?auto_291196 ?auto_291202 ) ) ( not ( = ?auto_291196 ?auto_291203 ) ) ( not ( = ?auto_291196 ?auto_291204 ) ) ( not ( = ?auto_291196 ?auto_291205 ) ) ( not ( = ?auto_291197 ?auto_291198 ) ) ( not ( = ?auto_291197 ?auto_291199 ) ) ( not ( = ?auto_291197 ?auto_291200 ) ) ( not ( = ?auto_291197 ?auto_291201 ) ) ( not ( = ?auto_291197 ?auto_291202 ) ) ( not ( = ?auto_291197 ?auto_291203 ) ) ( not ( = ?auto_291197 ?auto_291204 ) ) ( not ( = ?auto_291197 ?auto_291205 ) ) ( not ( = ?auto_291198 ?auto_291199 ) ) ( not ( = ?auto_291198 ?auto_291200 ) ) ( not ( = ?auto_291198 ?auto_291201 ) ) ( not ( = ?auto_291198 ?auto_291202 ) ) ( not ( = ?auto_291198 ?auto_291203 ) ) ( not ( = ?auto_291198 ?auto_291204 ) ) ( not ( = ?auto_291198 ?auto_291205 ) ) ( not ( = ?auto_291199 ?auto_291200 ) ) ( not ( = ?auto_291199 ?auto_291201 ) ) ( not ( = ?auto_291199 ?auto_291202 ) ) ( not ( = ?auto_291199 ?auto_291203 ) ) ( not ( = ?auto_291199 ?auto_291204 ) ) ( not ( = ?auto_291199 ?auto_291205 ) ) ( not ( = ?auto_291200 ?auto_291201 ) ) ( not ( = ?auto_291200 ?auto_291202 ) ) ( not ( = ?auto_291200 ?auto_291203 ) ) ( not ( = ?auto_291200 ?auto_291204 ) ) ( not ( = ?auto_291200 ?auto_291205 ) ) ( not ( = ?auto_291201 ?auto_291202 ) ) ( not ( = ?auto_291201 ?auto_291203 ) ) ( not ( = ?auto_291201 ?auto_291204 ) ) ( not ( = ?auto_291201 ?auto_291205 ) ) ( not ( = ?auto_291202 ?auto_291203 ) ) ( not ( = ?auto_291202 ?auto_291204 ) ) ( not ( = ?auto_291202 ?auto_291205 ) ) ( not ( = ?auto_291203 ?auto_291204 ) ) ( not ( = ?auto_291203 ?auto_291205 ) ) ( not ( = ?auto_291204 ?auto_291205 ) ) ( ON ?auto_291203 ?auto_291204 ) ( ON ?auto_291202 ?auto_291203 ) ( ON ?auto_291201 ?auto_291202 ) ( ON ?auto_291200 ?auto_291201 ) ( ON ?auto_291199 ?auto_291200 ) ( ON ?auto_291198 ?auto_291199 ) ( ON ?auto_291197 ?auto_291198 ) ( ON ?auto_291196 ?auto_291197 ) ( ON ?auto_291195 ?auto_291196 ) ( ON ?auto_291194 ?auto_291195 ) ( ON ?auto_291193 ?auto_291194 ) ( ON ?auto_291192 ?auto_291193 ) ( CLEAR ?auto_291192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_291192 )
      ( MAKE-13PILE ?auto_291192 ?auto_291193 ?auto_291194 ?auto_291195 ?auto_291196 ?auto_291197 ?auto_291198 ?auto_291199 ?auto_291200 ?auto_291201 ?auto_291202 ?auto_291203 ?auto_291204 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_291219 - BLOCK
      ?auto_291220 - BLOCK
      ?auto_291221 - BLOCK
      ?auto_291222 - BLOCK
      ?auto_291223 - BLOCK
      ?auto_291224 - BLOCK
      ?auto_291225 - BLOCK
      ?auto_291226 - BLOCK
      ?auto_291227 - BLOCK
      ?auto_291228 - BLOCK
      ?auto_291229 - BLOCK
      ?auto_291230 - BLOCK
      ?auto_291231 - BLOCK
    )
    :vars
    (
      ?auto_291232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_291231 ?auto_291232 ) ( not ( = ?auto_291219 ?auto_291220 ) ) ( not ( = ?auto_291219 ?auto_291221 ) ) ( not ( = ?auto_291219 ?auto_291222 ) ) ( not ( = ?auto_291219 ?auto_291223 ) ) ( not ( = ?auto_291219 ?auto_291224 ) ) ( not ( = ?auto_291219 ?auto_291225 ) ) ( not ( = ?auto_291219 ?auto_291226 ) ) ( not ( = ?auto_291219 ?auto_291227 ) ) ( not ( = ?auto_291219 ?auto_291228 ) ) ( not ( = ?auto_291219 ?auto_291229 ) ) ( not ( = ?auto_291219 ?auto_291230 ) ) ( not ( = ?auto_291219 ?auto_291231 ) ) ( not ( = ?auto_291219 ?auto_291232 ) ) ( not ( = ?auto_291220 ?auto_291221 ) ) ( not ( = ?auto_291220 ?auto_291222 ) ) ( not ( = ?auto_291220 ?auto_291223 ) ) ( not ( = ?auto_291220 ?auto_291224 ) ) ( not ( = ?auto_291220 ?auto_291225 ) ) ( not ( = ?auto_291220 ?auto_291226 ) ) ( not ( = ?auto_291220 ?auto_291227 ) ) ( not ( = ?auto_291220 ?auto_291228 ) ) ( not ( = ?auto_291220 ?auto_291229 ) ) ( not ( = ?auto_291220 ?auto_291230 ) ) ( not ( = ?auto_291220 ?auto_291231 ) ) ( not ( = ?auto_291220 ?auto_291232 ) ) ( not ( = ?auto_291221 ?auto_291222 ) ) ( not ( = ?auto_291221 ?auto_291223 ) ) ( not ( = ?auto_291221 ?auto_291224 ) ) ( not ( = ?auto_291221 ?auto_291225 ) ) ( not ( = ?auto_291221 ?auto_291226 ) ) ( not ( = ?auto_291221 ?auto_291227 ) ) ( not ( = ?auto_291221 ?auto_291228 ) ) ( not ( = ?auto_291221 ?auto_291229 ) ) ( not ( = ?auto_291221 ?auto_291230 ) ) ( not ( = ?auto_291221 ?auto_291231 ) ) ( not ( = ?auto_291221 ?auto_291232 ) ) ( not ( = ?auto_291222 ?auto_291223 ) ) ( not ( = ?auto_291222 ?auto_291224 ) ) ( not ( = ?auto_291222 ?auto_291225 ) ) ( not ( = ?auto_291222 ?auto_291226 ) ) ( not ( = ?auto_291222 ?auto_291227 ) ) ( not ( = ?auto_291222 ?auto_291228 ) ) ( not ( = ?auto_291222 ?auto_291229 ) ) ( not ( = ?auto_291222 ?auto_291230 ) ) ( not ( = ?auto_291222 ?auto_291231 ) ) ( not ( = ?auto_291222 ?auto_291232 ) ) ( not ( = ?auto_291223 ?auto_291224 ) ) ( not ( = ?auto_291223 ?auto_291225 ) ) ( not ( = ?auto_291223 ?auto_291226 ) ) ( not ( = ?auto_291223 ?auto_291227 ) ) ( not ( = ?auto_291223 ?auto_291228 ) ) ( not ( = ?auto_291223 ?auto_291229 ) ) ( not ( = ?auto_291223 ?auto_291230 ) ) ( not ( = ?auto_291223 ?auto_291231 ) ) ( not ( = ?auto_291223 ?auto_291232 ) ) ( not ( = ?auto_291224 ?auto_291225 ) ) ( not ( = ?auto_291224 ?auto_291226 ) ) ( not ( = ?auto_291224 ?auto_291227 ) ) ( not ( = ?auto_291224 ?auto_291228 ) ) ( not ( = ?auto_291224 ?auto_291229 ) ) ( not ( = ?auto_291224 ?auto_291230 ) ) ( not ( = ?auto_291224 ?auto_291231 ) ) ( not ( = ?auto_291224 ?auto_291232 ) ) ( not ( = ?auto_291225 ?auto_291226 ) ) ( not ( = ?auto_291225 ?auto_291227 ) ) ( not ( = ?auto_291225 ?auto_291228 ) ) ( not ( = ?auto_291225 ?auto_291229 ) ) ( not ( = ?auto_291225 ?auto_291230 ) ) ( not ( = ?auto_291225 ?auto_291231 ) ) ( not ( = ?auto_291225 ?auto_291232 ) ) ( not ( = ?auto_291226 ?auto_291227 ) ) ( not ( = ?auto_291226 ?auto_291228 ) ) ( not ( = ?auto_291226 ?auto_291229 ) ) ( not ( = ?auto_291226 ?auto_291230 ) ) ( not ( = ?auto_291226 ?auto_291231 ) ) ( not ( = ?auto_291226 ?auto_291232 ) ) ( not ( = ?auto_291227 ?auto_291228 ) ) ( not ( = ?auto_291227 ?auto_291229 ) ) ( not ( = ?auto_291227 ?auto_291230 ) ) ( not ( = ?auto_291227 ?auto_291231 ) ) ( not ( = ?auto_291227 ?auto_291232 ) ) ( not ( = ?auto_291228 ?auto_291229 ) ) ( not ( = ?auto_291228 ?auto_291230 ) ) ( not ( = ?auto_291228 ?auto_291231 ) ) ( not ( = ?auto_291228 ?auto_291232 ) ) ( not ( = ?auto_291229 ?auto_291230 ) ) ( not ( = ?auto_291229 ?auto_291231 ) ) ( not ( = ?auto_291229 ?auto_291232 ) ) ( not ( = ?auto_291230 ?auto_291231 ) ) ( not ( = ?auto_291230 ?auto_291232 ) ) ( not ( = ?auto_291231 ?auto_291232 ) ) ( ON ?auto_291230 ?auto_291231 ) ( ON ?auto_291229 ?auto_291230 ) ( ON ?auto_291228 ?auto_291229 ) ( ON ?auto_291227 ?auto_291228 ) ( ON ?auto_291226 ?auto_291227 ) ( ON ?auto_291225 ?auto_291226 ) ( ON ?auto_291224 ?auto_291225 ) ( ON ?auto_291223 ?auto_291224 ) ( ON ?auto_291222 ?auto_291223 ) ( ON ?auto_291221 ?auto_291222 ) ( ON ?auto_291220 ?auto_291221 ) ( ON ?auto_291219 ?auto_291220 ) ( CLEAR ?auto_291219 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_291219 )
      ( MAKE-13PILE ?auto_291219 ?auto_291220 ?auto_291221 ?auto_291222 ?auto_291223 ?auto_291224 ?auto_291225 ?auto_291226 ?auto_291227 ?auto_291228 ?auto_291229 ?auto_291230 ?auto_291231 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291247 - BLOCK
      ?auto_291248 - BLOCK
      ?auto_291249 - BLOCK
      ?auto_291250 - BLOCK
      ?auto_291251 - BLOCK
      ?auto_291252 - BLOCK
      ?auto_291253 - BLOCK
      ?auto_291254 - BLOCK
      ?auto_291255 - BLOCK
      ?auto_291256 - BLOCK
      ?auto_291257 - BLOCK
      ?auto_291258 - BLOCK
      ?auto_291259 - BLOCK
      ?auto_291260 - BLOCK
    )
    :vars
    (
      ?auto_291261 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_291259 ) ( ON ?auto_291260 ?auto_291261 ) ( CLEAR ?auto_291260 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_291247 ) ( ON ?auto_291248 ?auto_291247 ) ( ON ?auto_291249 ?auto_291248 ) ( ON ?auto_291250 ?auto_291249 ) ( ON ?auto_291251 ?auto_291250 ) ( ON ?auto_291252 ?auto_291251 ) ( ON ?auto_291253 ?auto_291252 ) ( ON ?auto_291254 ?auto_291253 ) ( ON ?auto_291255 ?auto_291254 ) ( ON ?auto_291256 ?auto_291255 ) ( ON ?auto_291257 ?auto_291256 ) ( ON ?auto_291258 ?auto_291257 ) ( ON ?auto_291259 ?auto_291258 ) ( not ( = ?auto_291247 ?auto_291248 ) ) ( not ( = ?auto_291247 ?auto_291249 ) ) ( not ( = ?auto_291247 ?auto_291250 ) ) ( not ( = ?auto_291247 ?auto_291251 ) ) ( not ( = ?auto_291247 ?auto_291252 ) ) ( not ( = ?auto_291247 ?auto_291253 ) ) ( not ( = ?auto_291247 ?auto_291254 ) ) ( not ( = ?auto_291247 ?auto_291255 ) ) ( not ( = ?auto_291247 ?auto_291256 ) ) ( not ( = ?auto_291247 ?auto_291257 ) ) ( not ( = ?auto_291247 ?auto_291258 ) ) ( not ( = ?auto_291247 ?auto_291259 ) ) ( not ( = ?auto_291247 ?auto_291260 ) ) ( not ( = ?auto_291247 ?auto_291261 ) ) ( not ( = ?auto_291248 ?auto_291249 ) ) ( not ( = ?auto_291248 ?auto_291250 ) ) ( not ( = ?auto_291248 ?auto_291251 ) ) ( not ( = ?auto_291248 ?auto_291252 ) ) ( not ( = ?auto_291248 ?auto_291253 ) ) ( not ( = ?auto_291248 ?auto_291254 ) ) ( not ( = ?auto_291248 ?auto_291255 ) ) ( not ( = ?auto_291248 ?auto_291256 ) ) ( not ( = ?auto_291248 ?auto_291257 ) ) ( not ( = ?auto_291248 ?auto_291258 ) ) ( not ( = ?auto_291248 ?auto_291259 ) ) ( not ( = ?auto_291248 ?auto_291260 ) ) ( not ( = ?auto_291248 ?auto_291261 ) ) ( not ( = ?auto_291249 ?auto_291250 ) ) ( not ( = ?auto_291249 ?auto_291251 ) ) ( not ( = ?auto_291249 ?auto_291252 ) ) ( not ( = ?auto_291249 ?auto_291253 ) ) ( not ( = ?auto_291249 ?auto_291254 ) ) ( not ( = ?auto_291249 ?auto_291255 ) ) ( not ( = ?auto_291249 ?auto_291256 ) ) ( not ( = ?auto_291249 ?auto_291257 ) ) ( not ( = ?auto_291249 ?auto_291258 ) ) ( not ( = ?auto_291249 ?auto_291259 ) ) ( not ( = ?auto_291249 ?auto_291260 ) ) ( not ( = ?auto_291249 ?auto_291261 ) ) ( not ( = ?auto_291250 ?auto_291251 ) ) ( not ( = ?auto_291250 ?auto_291252 ) ) ( not ( = ?auto_291250 ?auto_291253 ) ) ( not ( = ?auto_291250 ?auto_291254 ) ) ( not ( = ?auto_291250 ?auto_291255 ) ) ( not ( = ?auto_291250 ?auto_291256 ) ) ( not ( = ?auto_291250 ?auto_291257 ) ) ( not ( = ?auto_291250 ?auto_291258 ) ) ( not ( = ?auto_291250 ?auto_291259 ) ) ( not ( = ?auto_291250 ?auto_291260 ) ) ( not ( = ?auto_291250 ?auto_291261 ) ) ( not ( = ?auto_291251 ?auto_291252 ) ) ( not ( = ?auto_291251 ?auto_291253 ) ) ( not ( = ?auto_291251 ?auto_291254 ) ) ( not ( = ?auto_291251 ?auto_291255 ) ) ( not ( = ?auto_291251 ?auto_291256 ) ) ( not ( = ?auto_291251 ?auto_291257 ) ) ( not ( = ?auto_291251 ?auto_291258 ) ) ( not ( = ?auto_291251 ?auto_291259 ) ) ( not ( = ?auto_291251 ?auto_291260 ) ) ( not ( = ?auto_291251 ?auto_291261 ) ) ( not ( = ?auto_291252 ?auto_291253 ) ) ( not ( = ?auto_291252 ?auto_291254 ) ) ( not ( = ?auto_291252 ?auto_291255 ) ) ( not ( = ?auto_291252 ?auto_291256 ) ) ( not ( = ?auto_291252 ?auto_291257 ) ) ( not ( = ?auto_291252 ?auto_291258 ) ) ( not ( = ?auto_291252 ?auto_291259 ) ) ( not ( = ?auto_291252 ?auto_291260 ) ) ( not ( = ?auto_291252 ?auto_291261 ) ) ( not ( = ?auto_291253 ?auto_291254 ) ) ( not ( = ?auto_291253 ?auto_291255 ) ) ( not ( = ?auto_291253 ?auto_291256 ) ) ( not ( = ?auto_291253 ?auto_291257 ) ) ( not ( = ?auto_291253 ?auto_291258 ) ) ( not ( = ?auto_291253 ?auto_291259 ) ) ( not ( = ?auto_291253 ?auto_291260 ) ) ( not ( = ?auto_291253 ?auto_291261 ) ) ( not ( = ?auto_291254 ?auto_291255 ) ) ( not ( = ?auto_291254 ?auto_291256 ) ) ( not ( = ?auto_291254 ?auto_291257 ) ) ( not ( = ?auto_291254 ?auto_291258 ) ) ( not ( = ?auto_291254 ?auto_291259 ) ) ( not ( = ?auto_291254 ?auto_291260 ) ) ( not ( = ?auto_291254 ?auto_291261 ) ) ( not ( = ?auto_291255 ?auto_291256 ) ) ( not ( = ?auto_291255 ?auto_291257 ) ) ( not ( = ?auto_291255 ?auto_291258 ) ) ( not ( = ?auto_291255 ?auto_291259 ) ) ( not ( = ?auto_291255 ?auto_291260 ) ) ( not ( = ?auto_291255 ?auto_291261 ) ) ( not ( = ?auto_291256 ?auto_291257 ) ) ( not ( = ?auto_291256 ?auto_291258 ) ) ( not ( = ?auto_291256 ?auto_291259 ) ) ( not ( = ?auto_291256 ?auto_291260 ) ) ( not ( = ?auto_291256 ?auto_291261 ) ) ( not ( = ?auto_291257 ?auto_291258 ) ) ( not ( = ?auto_291257 ?auto_291259 ) ) ( not ( = ?auto_291257 ?auto_291260 ) ) ( not ( = ?auto_291257 ?auto_291261 ) ) ( not ( = ?auto_291258 ?auto_291259 ) ) ( not ( = ?auto_291258 ?auto_291260 ) ) ( not ( = ?auto_291258 ?auto_291261 ) ) ( not ( = ?auto_291259 ?auto_291260 ) ) ( not ( = ?auto_291259 ?auto_291261 ) ) ( not ( = ?auto_291260 ?auto_291261 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_291260 ?auto_291261 )
      ( !STACK ?auto_291260 ?auto_291259 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291276 - BLOCK
      ?auto_291277 - BLOCK
      ?auto_291278 - BLOCK
      ?auto_291279 - BLOCK
      ?auto_291280 - BLOCK
      ?auto_291281 - BLOCK
      ?auto_291282 - BLOCK
      ?auto_291283 - BLOCK
      ?auto_291284 - BLOCK
      ?auto_291285 - BLOCK
      ?auto_291286 - BLOCK
      ?auto_291287 - BLOCK
      ?auto_291288 - BLOCK
      ?auto_291289 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_291288 ) ( ON-TABLE ?auto_291289 ) ( CLEAR ?auto_291289 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_291276 ) ( ON ?auto_291277 ?auto_291276 ) ( ON ?auto_291278 ?auto_291277 ) ( ON ?auto_291279 ?auto_291278 ) ( ON ?auto_291280 ?auto_291279 ) ( ON ?auto_291281 ?auto_291280 ) ( ON ?auto_291282 ?auto_291281 ) ( ON ?auto_291283 ?auto_291282 ) ( ON ?auto_291284 ?auto_291283 ) ( ON ?auto_291285 ?auto_291284 ) ( ON ?auto_291286 ?auto_291285 ) ( ON ?auto_291287 ?auto_291286 ) ( ON ?auto_291288 ?auto_291287 ) ( not ( = ?auto_291276 ?auto_291277 ) ) ( not ( = ?auto_291276 ?auto_291278 ) ) ( not ( = ?auto_291276 ?auto_291279 ) ) ( not ( = ?auto_291276 ?auto_291280 ) ) ( not ( = ?auto_291276 ?auto_291281 ) ) ( not ( = ?auto_291276 ?auto_291282 ) ) ( not ( = ?auto_291276 ?auto_291283 ) ) ( not ( = ?auto_291276 ?auto_291284 ) ) ( not ( = ?auto_291276 ?auto_291285 ) ) ( not ( = ?auto_291276 ?auto_291286 ) ) ( not ( = ?auto_291276 ?auto_291287 ) ) ( not ( = ?auto_291276 ?auto_291288 ) ) ( not ( = ?auto_291276 ?auto_291289 ) ) ( not ( = ?auto_291277 ?auto_291278 ) ) ( not ( = ?auto_291277 ?auto_291279 ) ) ( not ( = ?auto_291277 ?auto_291280 ) ) ( not ( = ?auto_291277 ?auto_291281 ) ) ( not ( = ?auto_291277 ?auto_291282 ) ) ( not ( = ?auto_291277 ?auto_291283 ) ) ( not ( = ?auto_291277 ?auto_291284 ) ) ( not ( = ?auto_291277 ?auto_291285 ) ) ( not ( = ?auto_291277 ?auto_291286 ) ) ( not ( = ?auto_291277 ?auto_291287 ) ) ( not ( = ?auto_291277 ?auto_291288 ) ) ( not ( = ?auto_291277 ?auto_291289 ) ) ( not ( = ?auto_291278 ?auto_291279 ) ) ( not ( = ?auto_291278 ?auto_291280 ) ) ( not ( = ?auto_291278 ?auto_291281 ) ) ( not ( = ?auto_291278 ?auto_291282 ) ) ( not ( = ?auto_291278 ?auto_291283 ) ) ( not ( = ?auto_291278 ?auto_291284 ) ) ( not ( = ?auto_291278 ?auto_291285 ) ) ( not ( = ?auto_291278 ?auto_291286 ) ) ( not ( = ?auto_291278 ?auto_291287 ) ) ( not ( = ?auto_291278 ?auto_291288 ) ) ( not ( = ?auto_291278 ?auto_291289 ) ) ( not ( = ?auto_291279 ?auto_291280 ) ) ( not ( = ?auto_291279 ?auto_291281 ) ) ( not ( = ?auto_291279 ?auto_291282 ) ) ( not ( = ?auto_291279 ?auto_291283 ) ) ( not ( = ?auto_291279 ?auto_291284 ) ) ( not ( = ?auto_291279 ?auto_291285 ) ) ( not ( = ?auto_291279 ?auto_291286 ) ) ( not ( = ?auto_291279 ?auto_291287 ) ) ( not ( = ?auto_291279 ?auto_291288 ) ) ( not ( = ?auto_291279 ?auto_291289 ) ) ( not ( = ?auto_291280 ?auto_291281 ) ) ( not ( = ?auto_291280 ?auto_291282 ) ) ( not ( = ?auto_291280 ?auto_291283 ) ) ( not ( = ?auto_291280 ?auto_291284 ) ) ( not ( = ?auto_291280 ?auto_291285 ) ) ( not ( = ?auto_291280 ?auto_291286 ) ) ( not ( = ?auto_291280 ?auto_291287 ) ) ( not ( = ?auto_291280 ?auto_291288 ) ) ( not ( = ?auto_291280 ?auto_291289 ) ) ( not ( = ?auto_291281 ?auto_291282 ) ) ( not ( = ?auto_291281 ?auto_291283 ) ) ( not ( = ?auto_291281 ?auto_291284 ) ) ( not ( = ?auto_291281 ?auto_291285 ) ) ( not ( = ?auto_291281 ?auto_291286 ) ) ( not ( = ?auto_291281 ?auto_291287 ) ) ( not ( = ?auto_291281 ?auto_291288 ) ) ( not ( = ?auto_291281 ?auto_291289 ) ) ( not ( = ?auto_291282 ?auto_291283 ) ) ( not ( = ?auto_291282 ?auto_291284 ) ) ( not ( = ?auto_291282 ?auto_291285 ) ) ( not ( = ?auto_291282 ?auto_291286 ) ) ( not ( = ?auto_291282 ?auto_291287 ) ) ( not ( = ?auto_291282 ?auto_291288 ) ) ( not ( = ?auto_291282 ?auto_291289 ) ) ( not ( = ?auto_291283 ?auto_291284 ) ) ( not ( = ?auto_291283 ?auto_291285 ) ) ( not ( = ?auto_291283 ?auto_291286 ) ) ( not ( = ?auto_291283 ?auto_291287 ) ) ( not ( = ?auto_291283 ?auto_291288 ) ) ( not ( = ?auto_291283 ?auto_291289 ) ) ( not ( = ?auto_291284 ?auto_291285 ) ) ( not ( = ?auto_291284 ?auto_291286 ) ) ( not ( = ?auto_291284 ?auto_291287 ) ) ( not ( = ?auto_291284 ?auto_291288 ) ) ( not ( = ?auto_291284 ?auto_291289 ) ) ( not ( = ?auto_291285 ?auto_291286 ) ) ( not ( = ?auto_291285 ?auto_291287 ) ) ( not ( = ?auto_291285 ?auto_291288 ) ) ( not ( = ?auto_291285 ?auto_291289 ) ) ( not ( = ?auto_291286 ?auto_291287 ) ) ( not ( = ?auto_291286 ?auto_291288 ) ) ( not ( = ?auto_291286 ?auto_291289 ) ) ( not ( = ?auto_291287 ?auto_291288 ) ) ( not ( = ?auto_291287 ?auto_291289 ) ) ( not ( = ?auto_291288 ?auto_291289 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_291289 )
      ( !STACK ?auto_291289 ?auto_291288 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291304 - BLOCK
      ?auto_291305 - BLOCK
      ?auto_291306 - BLOCK
      ?auto_291307 - BLOCK
      ?auto_291308 - BLOCK
      ?auto_291309 - BLOCK
      ?auto_291310 - BLOCK
      ?auto_291311 - BLOCK
      ?auto_291312 - BLOCK
      ?auto_291313 - BLOCK
      ?auto_291314 - BLOCK
      ?auto_291315 - BLOCK
      ?auto_291316 - BLOCK
      ?auto_291317 - BLOCK
    )
    :vars
    (
      ?auto_291318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_291317 ?auto_291318 ) ( ON-TABLE ?auto_291304 ) ( ON ?auto_291305 ?auto_291304 ) ( ON ?auto_291306 ?auto_291305 ) ( ON ?auto_291307 ?auto_291306 ) ( ON ?auto_291308 ?auto_291307 ) ( ON ?auto_291309 ?auto_291308 ) ( ON ?auto_291310 ?auto_291309 ) ( ON ?auto_291311 ?auto_291310 ) ( ON ?auto_291312 ?auto_291311 ) ( ON ?auto_291313 ?auto_291312 ) ( ON ?auto_291314 ?auto_291313 ) ( ON ?auto_291315 ?auto_291314 ) ( not ( = ?auto_291304 ?auto_291305 ) ) ( not ( = ?auto_291304 ?auto_291306 ) ) ( not ( = ?auto_291304 ?auto_291307 ) ) ( not ( = ?auto_291304 ?auto_291308 ) ) ( not ( = ?auto_291304 ?auto_291309 ) ) ( not ( = ?auto_291304 ?auto_291310 ) ) ( not ( = ?auto_291304 ?auto_291311 ) ) ( not ( = ?auto_291304 ?auto_291312 ) ) ( not ( = ?auto_291304 ?auto_291313 ) ) ( not ( = ?auto_291304 ?auto_291314 ) ) ( not ( = ?auto_291304 ?auto_291315 ) ) ( not ( = ?auto_291304 ?auto_291316 ) ) ( not ( = ?auto_291304 ?auto_291317 ) ) ( not ( = ?auto_291304 ?auto_291318 ) ) ( not ( = ?auto_291305 ?auto_291306 ) ) ( not ( = ?auto_291305 ?auto_291307 ) ) ( not ( = ?auto_291305 ?auto_291308 ) ) ( not ( = ?auto_291305 ?auto_291309 ) ) ( not ( = ?auto_291305 ?auto_291310 ) ) ( not ( = ?auto_291305 ?auto_291311 ) ) ( not ( = ?auto_291305 ?auto_291312 ) ) ( not ( = ?auto_291305 ?auto_291313 ) ) ( not ( = ?auto_291305 ?auto_291314 ) ) ( not ( = ?auto_291305 ?auto_291315 ) ) ( not ( = ?auto_291305 ?auto_291316 ) ) ( not ( = ?auto_291305 ?auto_291317 ) ) ( not ( = ?auto_291305 ?auto_291318 ) ) ( not ( = ?auto_291306 ?auto_291307 ) ) ( not ( = ?auto_291306 ?auto_291308 ) ) ( not ( = ?auto_291306 ?auto_291309 ) ) ( not ( = ?auto_291306 ?auto_291310 ) ) ( not ( = ?auto_291306 ?auto_291311 ) ) ( not ( = ?auto_291306 ?auto_291312 ) ) ( not ( = ?auto_291306 ?auto_291313 ) ) ( not ( = ?auto_291306 ?auto_291314 ) ) ( not ( = ?auto_291306 ?auto_291315 ) ) ( not ( = ?auto_291306 ?auto_291316 ) ) ( not ( = ?auto_291306 ?auto_291317 ) ) ( not ( = ?auto_291306 ?auto_291318 ) ) ( not ( = ?auto_291307 ?auto_291308 ) ) ( not ( = ?auto_291307 ?auto_291309 ) ) ( not ( = ?auto_291307 ?auto_291310 ) ) ( not ( = ?auto_291307 ?auto_291311 ) ) ( not ( = ?auto_291307 ?auto_291312 ) ) ( not ( = ?auto_291307 ?auto_291313 ) ) ( not ( = ?auto_291307 ?auto_291314 ) ) ( not ( = ?auto_291307 ?auto_291315 ) ) ( not ( = ?auto_291307 ?auto_291316 ) ) ( not ( = ?auto_291307 ?auto_291317 ) ) ( not ( = ?auto_291307 ?auto_291318 ) ) ( not ( = ?auto_291308 ?auto_291309 ) ) ( not ( = ?auto_291308 ?auto_291310 ) ) ( not ( = ?auto_291308 ?auto_291311 ) ) ( not ( = ?auto_291308 ?auto_291312 ) ) ( not ( = ?auto_291308 ?auto_291313 ) ) ( not ( = ?auto_291308 ?auto_291314 ) ) ( not ( = ?auto_291308 ?auto_291315 ) ) ( not ( = ?auto_291308 ?auto_291316 ) ) ( not ( = ?auto_291308 ?auto_291317 ) ) ( not ( = ?auto_291308 ?auto_291318 ) ) ( not ( = ?auto_291309 ?auto_291310 ) ) ( not ( = ?auto_291309 ?auto_291311 ) ) ( not ( = ?auto_291309 ?auto_291312 ) ) ( not ( = ?auto_291309 ?auto_291313 ) ) ( not ( = ?auto_291309 ?auto_291314 ) ) ( not ( = ?auto_291309 ?auto_291315 ) ) ( not ( = ?auto_291309 ?auto_291316 ) ) ( not ( = ?auto_291309 ?auto_291317 ) ) ( not ( = ?auto_291309 ?auto_291318 ) ) ( not ( = ?auto_291310 ?auto_291311 ) ) ( not ( = ?auto_291310 ?auto_291312 ) ) ( not ( = ?auto_291310 ?auto_291313 ) ) ( not ( = ?auto_291310 ?auto_291314 ) ) ( not ( = ?auto_291310 ?auto_291315 ) ) ( not ( = ?auto_291310 ?auto_291316 ) ) ( not ( = ?auto_291310 ?auto_291317 ) ) ( not ( = ?auto_291310 ?auto_291318 ) ) ( not ( = ?auto_291311 ?auto_291312 ) ) ( not ( = ?auto_291311 ?auto_291313 ) ) ( not ( = ?auto_291311 ?auto_291314 ) ) ( not ( = ?auto_291311 ?auto_291315 ) ) ( not ( = ?auto_291311 ?auto_291316 ) ) ( not ( = ?auto_291311 ?auto_291317 ) ) ( not ( = ?auto_291311 ?auto_291318 ) ) ( not ( = ?auto_291312 ?auto_291313 ) ) ( not ( = ?auto_291312 ?auto_291314 ) ) ( not ( = ?auto_291312 ?auto_291315 ) ) ( not ( = ?auto_291312 ?auto_291316 ) ) ( not ( = ?auto_291312 ?auto_291317 ) ) ( not ( = ?auto_291312 ?auto_291318 ) ) ( not ( = ?auto_291313 ?auto_291314 ) ) ( not ( = ?auto_291313 ?auto_291315 ) ) ( not ( = ?auto_291313 ?auto_291316 ) ) ( not ( = ?auto_291313 ?auto_291317 ) ) ( not ( = ?auto_291313 ?auto_291318 ) ) ( not ( = ?auto_291314 ?auto_291315 ) ) ( not ( = ?auto_291314 ?auto_291316 ) ) ( not ( = ?auto_291314 ?auto_291317 ) ) ( not ( = ?auto_291314 ?auto_291318 ) ) ( not ( = ?auto_291315 ?auto_291316 ) ) ( not ( = ?auto_291315 ?auto_291317 ) ) ( not ( = ?auto_291315 ?auto_291318 ) ) ( not ( = ?auto_291316 ?auto_291317 ) ) ( not ( = ?auto_291316 ?auto_291318 ) ) ( not ( = ?auto_291317 ?auto_291318 ) ) ( CLEAR ?auto_291315 ) ( ON ?auto_291316 ?auto_291317 ) ( CLEAR ?auto_291316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_291304 ?auto_291305 ?auto_291306 ?auto_291307 ?auto_291308 ?auto_291309 ?auto_291310 ?auto_291311 ?auto_291312 ?auto_291313 ?auto_291314 ?auto_291315 ?auto_291316 )
      ( MAKE-14PILE ?auto_291304 ?auto_291305 ?auto_291306 ?auto_291307 ?auto_291308 ?auto_291309 ?auto_291310 ?auto_291311 ?auto_291312 ?auto_291313 ?auto_291314 ?auto_291315 ?auto_291316 ?auto_291317 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291333 - BLOCK
      ?auto_291334 - BLOCK
      ?auto_291335 - BLOCK
      ?auto_291336 - BLOCK
      ?auto_291337 - BLOCK
      ?auto_291338 - BLOCK
      ?auto_291339 - BLOCK
      ?auto_291340 - BLOCK
      ?auto_291341 - BLOCK
      ?auto_291342 - BLOCK
      ?auto_291343 - BLOCK
      ?auto_291344 - BLOCK
      ?auto_291345 - BLOCK
      ?auto_291346 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_291346 ) ( ON-TABLE ?auto_291333 ) ( ON ?auto_291334 ?auto_291333 ) ( ON ?auto_291335 ?auto_291334 ) ( ON ?auto_291336 ?auto_291335 ) ( ON ?auto_291337 ?auto_291336 ) ( ON ?auto_291338 ?auto_291337 ) ( ON ?auto_291339 ?auto_291338 ) ( ON ?auto_291340 ?auto_291339 ) ( ON ?auto_291341 ?auto_291340 ) ( ON ?auto_291342 ?auto_291341 ) ( ON ?auto_291343 ?auto_291342 ) ( ON ?auto_291344 ?auto_291343 ) ( not ( = ?auto_291333 ?auto_291334 ) ) ( not ( = ?auto_291333 ?auto_291335 ) ) ( not ( = ?auto_291333 ?auto_291336 ) ) ( not ( = ?auto_291333 ?auto_291337 ) ) ( not ( = ?auto_291333 ?auto_291338 ) ) ( not ( = ?auto_291333 ?auto_291339 ) ) ( not ( = ?auto_291333 ?auto_291340 ) ) ( not ( = ?auto_291333 ?auto_291341 ) ) ( not ( = ?auto_291333 ?auto_291342 ) ) ( not ( = ?auto_291333 ?auto_291343 ) ) ( not ( = ?auto_291333 ?auto_291344 ) ) ( not ( = ?auto_291333 ?auto_291345 ) ) ( not ( = ?auto_291333 ?auto_291346 ) ) ( not ( = ?auto_291334 ?auto_291335 ) ) ( not ( = ?auto_291334 ?auto_291336 ) ) ( not ( = ?auto_291334 ?auto_291337 ) ) ( not ( = ?auto_291334 ?auto_291338 ) ) ( not ( = ?auto_291334 ?auto_291339 ) ) ( not ( = ?auto_291334 ?auto_291340 ) ) ( not ( = ?auto_291334 ?auto_291341 ) ) ( not ( = ?auto_291334 ?auto_291342 ) ) ( not ( = ?auto_291334 ?auto_291343 ) ) ( not ( = ?auto_291334 ?auto_291344 ) ) ( not ( = ?auto_291334 ?auto_291345 ) ) ( not ( = ?auto_291334 ?auto_291346 ) ) ( not ( = ?auto_291335 ?auto_291336 ) ) ( not ( = ?auto_291335 ?auto_291337 ) ) ( not ( = ?auto_291335 ?auto_291338 ) ) ( not ( = ?auto_291335 ?auto_291339 ) ) ( not ( = ?auto_291335 ?auto_291340 ) ) ( not ( = ?auto_291335 ?auto_291341 ) ) ( not ( = ?auto_291335 ?auto_291342 ) ) ( not ( = ?auto_291335 ?auto_291343 ) ) ( not ( = ?auto_291335 ?auto_291344 ) ) ( not ( = ?auto_291335 ?auto_291345 ) ) ( not ( = ?auto_291335 ?auto_291346 ) ) ( not ( = ?auto_291336 ?auto_291337 ) ) ( not ( = ?auto_291336 ?auto_291338 ) ) ( not ( = ?auto_291336 ?auto_291339 ) ) ( not ( = ?auto_291336 ?auto_291340 ) ) ( not ( = ?auto_291336 ?auto_291341 ) ) ( not ( = ?auto_291336 ?auto_291342 ) ) ( not ( = ?auto_291336 ?auto_291343 ) ) ( not ( = ?auto_291336 ?auto_291344 ) ) ( not ( = ?auto_291336 ?auto_291345 ) ) ( not ( = ?auto_291336 ?auto_291346 ) ) ( not ( = ?auto_291337 ?auto_291338 ) ) ( not ( = ?auto_291337 ?auto_291339 ) ) ( not ( = ?auto_291337 ?auto_291340 ) ) ( not ( = ?auto_291337 ?auto_291341 ) ) ( not ( = ?auto_291337 ?auto_291342 ) ) ( not ( = ?auto_291337 ?auto_291343 ) ) ( not ( = ?auto_291337 ?auto_291344 ) ) ( not ( = ?auto_291337 ?auto_291345 ) ) ( not ( = ?auto_291337 ?auto_291346 ) ) ( not ( = ?auto_291338 ?auto_291339 ) ) ( not ( = ?auto_291338 ?auto_291340 ) ) ( not ( = ?auto_291338 ?auto_291341 ) ) ( not ( = ?auto_291338 ?auto_291342 ) ) ( not ( = ?auto_291338 ?auto_291343 ) ) ( not ( = ?auto_291338 ?auto_291344 ) ) ( not ( = ?auto_291338 ?auto_291345 ) ) ( not ( = ?auto_291338 ?auto_291346 ) ) ( not ( = ?auto_291339 ?auto_291340 ) ) ( not ( = ?auto_291339 ?auto_291341 ) ) ( not ( = ?auto_291339 ?auto_291342 ) ) ( not ( = ?auto_291339 ?auto_291343 ) ) ( not ( = ?auto_291339 ?auto_291344 ) ) ( not ( = ?auto_291339 ?auto_291345 ) ) ( not ( = ?auto_291339 ?auto_291346 ) ) ( not ( = ?auto_291340 ?auto_291341 ) ) ( not ( = ?auto_291340 ?auto_291342 ) ) ( not ( = ?auto_291340 ?auto_291343 ) ) ( not ( = ?auto_291340 ?auto_291344 ) ) ( not ( = ?auto_291340 ?auto_291345 ) ) ( not ( = ?auto_291340 ?auto_291346 ) ) ( not ( = ?auto_291341 ?auto_291342 ) ) ( not ( = ?auto_291341 ?auto_291343 ) ) ( not ( = ?auto_291341 ?auto_291344 ) ) ( not ( = ?auto_291341 ?auto_291345 ) ) ( not ( = ?auto_291341 ?auto_291346 ) ) ( not ( = ?auto_291342 ?auto_291343 ) ) ( not ( = ?auto_291342 ?auto_291344 ) ) ( not ( = ?auto_291342 ?auto_291345 ) ) ( not ( = ?auto_291342 ?auto_291346 ) ) ( not ( = ?auto_291343 ?auto_291344 ) ) ( not ( = ?auto_291343 ?auto_291345 ) ) ( not ( = ?auto_291343 ?auto_291346 ) ) ( not ( = ?auto_291344 ?auto_291345 ) ) ( not ( = ?auto_291344 ?auto_291346 ) ) ( not ( = ?auto_291345 ?auto_291346 ) ) ( CLEAR ?auto_291344 ) ( ON ?auto_291345 ?auto_291346 ) ( CLEAR ?auto_291345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_291333 ?auto_291334 ?auto_291335 ?auto_291336 ?auto_291337 ?auto_291338 ?auto_291339 ?auto_291340 ?auto_291341 ?auto_291342 ?auto_291343 ?auto_291344 ?auto_291345 )
      ( MAKE-14PILE ?auto_291333 ?auto_291334 ?auto_291335 ?auto_291336 ?auto_291337 ?auto_291338 ?auto_291339 ?auto_291340 ?auto_291341 ?auto_291342 ?auto_291343 ?auto_291344 ?auto_291345 ?auto_291346 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291361 - BLOCK
      ?auto_291362 - BLOCK
      ?auto_291363 - BLOCK
      ?auto_291364 - BLOCK
      ?auto_291365 - BLOCK
      ?auto_291366 - BLOCK
      ?auto_291367 - BLOCK
      ?auto_291368 - BLOCK
      ?auto_291369 - BLOCK
      ?auto_291370 - BLOCK
      ?auto_291371 - BLOCK
      ?auto_291372 - BLOCK
      ?auto_291373 - BLOCK
      ?auto_291374 - BLOCK
    )
    :vars
    (
      ?auto_291375 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_291374 ?auto_291375 ) ( ON-TABLE ?auto_291361 ) ( ON ?auto_291362 ?auto_291361 ) ( ON ?auto_291363 ?auto_291362 ) ( ON ?auto_291364 ?auto_291363 ) ( ON ?auto_291365 ?auto_291364 ) ( ON ?auto_291366 ?auto_291365 ) ( ON ?auto_291367 ?auto_291366 ) ( ON ?auto_291368 ?auto_291367 ) ( ON ?auto_291369 ?auto_291368 ) ( ON ?auto_291370 ?auto_291369 ) ( ON ?auto_291371 ?auto_291370 ) ( not ( = ?auto_291361 ?auto_291362 ) ) ( not ( = ?auto_291361 ?auto_291363 ) ) ( not ( = ?auto_291361 ?auto_291364 ) ) ( not ( = ?auto_291361 ?auto_291365 ) ) ( not ( = ?auto_291361 ?auto_291366 ) ) ( not ( = ?auto_291361 ?auto_291367 ) ) ( not ( = ?auto_291361 ?auto_291368 ) ) ( not ( = ?auto_291361 ?auto_291369 ) ) ( not ( = ?auto_291361 ?auto_291370 ) ) ( not ( = ?auto_291361 ?auto_291371 ) ) ( not ( = ?auto_291361 ?auto_291372 ) ) ( not ( = ?auto_291361 ?auto_291373 ) ) ( not ( = ?auto_291361 ?auto_291374 ) ) ( not ( = ?auto_291361 ?auto_291375 ) ) ( not ( = ?auto_291362 ?auto_291363 ) ) ( not ( = ?auto_291362 ?auto_291364 ) ) ( not ( = ?auto_291362 ?auto_291365 ) ) ( not ( = ?auto_291362 ?auto_291366 ) ) ( not ( = ?auto_291362 ?auto_291367 ) ) ( not ( = ?auto_291362 ?auto_291368 ) ) ( not ( = ?auto_291362 ?auto_291369 ) ) ( not ( = ?auto_291362 ?auto_291370 ) ) ( not ( = ?auto_291362 ?auto_291371 ) ) ( not ( = ?auto_291362 ?auto_291372 ) ) ( not ( = ?auto_291362 ?auto_291373 ) ) ( not ( = ?auto_291362 ?auto_291374 ) ) ( not ( = ?auto_291362 ?auto_291375 ) ) ( not ( = ?auto_291363 ?auto_291364 ) ) ( not ( = ?auto_291363 ?auto_291365 ) ) ( not ( = ?auto_291363 ?auto_291366 ) ) ( not ( = ?auto_291363 ?auto_291367 ) ) ( not ( = ?auto_291363 ?auto_291368 ) ) ( not ( = ?auto_291363 ?auto_291369 ) ) ( not ( = ?auto_291363 ?auto_291370 ) ) ( not ( = ?auto_291363 ?auto_291371 ) ) ( not ( = ?auto_291363 ?auto_291372 ) ) ( not ( = ?auto_291363 ?auto_291373 ) ) ( not ( = ?auto_291363 ?auto_291374 ) ) ( not ( = ?auto_291363 ?auto_291375 ) ) ( not ( = ?auto_291364 ?auto_291365 ) ) ( not ( = ?auto_291364 ?auto_291366 ) ) ( not ( = ?auto_291364 ?auto_291367 ) ) ( not ( = ?auto_291364 ?auto_291368 ) ) ( not ( = ?auto_291364 ?auto_291369 ) ) ( not ( = ?auto_291364 ?auto_291370 ) ) ( not ( = ?auto_291364 ?auto_291371 ) ) ( not ( = ?auto_291364 ?auto_291372 ) ) ( not ( = ?auto_291364 ?auto_291373 ) ) ( not ( = ?auto_291364 ?auto_291374 ) ) ( not ( = ?auto_291364 ?auto_291375 ) ) ( not ( = ?auto_291365 ?auto_291366 ) ) ( not ( = ?auto_291365 ?auto_291367 ) ) ( not ( = ?auto_291365 ?auto_291368 ) ) ( not ( = ?auto_291365 ?auto_291369 ) ) ( not ( = ?auto_291365 ?auto_291370 ) ) ( not ( = ?auto_291365 ?auto_291371 ) ) ( not ( = ?auto_291365 ?auto_291372 ) ) ( not ( = ?auto_291365 ?auto_291373 ) ) ( not ( = ?auto_291365 ?auto_291374 ) ) ( not ( = ?auto_291365 ?auto_291375 ) ) ( not ( = ?auto_291366 ?auto_291367 ) ) ( not ( = ?auto_291366 ?auto_291368 ) ) ( not ( = ?auto_291366 ?auto_291369 ) ) ( not ( = ?auto_291366 ?auto_291370 ) ) ( not ( = ?auto_291366 ?auto_291371 ) ) ( not ( = ?auto_291366 ?auto_291372 ) ) ( not ( = ?auto_291366 ?auto_291373 ) ) ( not ( = ?auto_291366 ?auto_291374 ) ) ( not ( = ?auto_291366 ?auto_291375 ) ) ( not ( = ?auto_291367 ?auto_291368 ) ) ( not ( = ?auto_291367 ?auto_291369 ) ) ( not ( = ?auto_291367 ?auto_291370 ) ) ( not ( = ?auto_291367 ?auto_291371 ) ) ( not ( = ?auto_291367 ?auto_291372 ) ) ( not ( = ?auto_291367 ?auto_291373 ) ) ( not ( = ?auto_291367 ?auto_291374 ) ) ( not ( = ?auto_291367 ?auto_291375 ) ) ( not ( = ?auto_291368 ?auto_291369 ) ) ( not ( = ?auto_291368 ?auto_291370 ) ) ( not ( = ?auto_291368 ?auto_291371 ) ) ( not ( = ?auto_291368 ?auto_291372 ) ) ( not ( = ?auto_291368 ?auto_291373 ) ) ( not ( = ?auto_291368 ?auto_291374 ) ) ( not ( = ?auto_291368 ?auto_291375 ) ) ( not ( = ?auto_291369 ?auto_291370 ) ) ( not ( = ?auto_291369 ?auto_291371 ) ) ( not ( = ?auto_291369 ?auto_291372 ) ) ( not ( = ?auto_291369 ?auto_291373 ) ) ( not ( = ?auto_291369 ?auto_291374 ) ) ( not ( = ?auto_291369 ?auto_291375 ) ) ( not ( = ?auto_291370 ?auto_291371 ) ) ( not ( = ?auto_291370 ?auto_291372 ) ) ( not ( = ?auto_291370 ?auto_291373 ) ) ( not ( = ?auto_291370 ?auto_291374 ) ) ( not ( = ?auto_291370 ?auto_291375 ) ) ( not ( = ?auto_291371 ?auto_291372 ) ) ( not ( = ?auto_291371 ?auto_291373 ) ) ( not ( = ?auto_291371 ?auto_291374 ) ) ( not ( = ?auto_291371 ?auto_291375 ) ) ( not ( = ?auto_291372 ?auto_291373 ) ) ( not ( = ?auto_291372 ?auto_291374 ) ) ( not ( = ?auto_291372 ?auto_291375 ) ) ( not ( = ?auto_291373 ?auto_291374 ) ) ( not ( = ?auto_291373 ?auto_291375 ) ) ( not ( = ?auto_291374 ?auto_291375 ) ) ( ON ?auto_291373 ?auto_291374 ) ( CLEAR ?auto_291371 ) ( ON ?auto_291372 ?auto_291373 ) ( CLEAR ?auto_291372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_291361 ?auto_291362 ?auto_291363 ?auto_291364 ?auto_291365 ?auto_291366 ?auto_291367 ?auto_291368 ?auto_291369 ?auto_291370 ?auto_291371 ?auto_291372 )
      ( MAKE-14PILE ?auto_291361 ?auto_291362 ?auto_291363 ?auto_291364 ?auto_291365 ?auto_291366 ?auto_291367 ?auto_291368 ?auto_291369 ?auto_291370 ?auto_291371 ?auto_291372 ?auto_291373 ?auto_291374 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291390 - BLOCK
      ?auto_291391 - BLOCK
      ?auto_291392 - BLOCK
      ?auto_291393 - BLOCK
      ?auto_291394 - BLOCK
      ?auto_291395 - BLOCK
      ?auto_291396 - BLOCK
      ?auto_291397 - BLOCK
      ?auto_291398 - BLOCK
      ?auto_291399 - BLOCK
      ?auto_291400 - BLOCK
      ?auto_291401 - BLOCK
      ?auto_291402 - BLOCK
      ?auto_291403 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_291403 ) ( ON-TABLE ?auto_291390 ) ( ON ?auto_291391 ?auto_291390 ) ( ON ?auto_291392 ?auto_291391 ) ( ON ?auto_291393 ?auto_291392 ) ( ON ?auto_291394 ?auto_291393 ) ( ON ?auto_291395 ?auto_291394 ) ( ON ?auto_291396 ?auto_291395 ) ( ON ?auto_291397 ?auto_291396 ) ( ON ?auto_291398 ?auto_291397 ) ( ON ?auto_291399 ?auto_291398 ) ( ON ?auto_291400 ?auto_291399 ) ( not ( = ?auto_291390 ?auto_291391 ) ) ( not ( = ?auto_291390 ?auto_291392 ) ) ( not ( = ?auto_291390 ?auto_291393 ) ) ( not ( = ?auto_291390 ?auto_291394 ) ) ( not ( = ?auto_291390 ?auto_291395 ) ) ( not ( = ?auto_291390 ?auto_291396 ) ) ( not ( = ?auto_291390 ?auto_291397 ) ) ( not ( = ?auto_291390 ?auto_291398 ) ) ( not ( = ?auto_291390 ?auto_291399 ) ) ( not ( = ?auto_291390 ?auto_291400 ) ) ( not ( = ?auto_291390 ?auto_291401 ) ) ( not ( = ?auto_291390 ?auto_291402 ) ) ( not ( = ?auto_291390 ?auto_291403 ) ) ( not ( = ?auto_291391 ?auto_291392 ) ) ( not ( = ?auto_291391 ?auto_291393 ) ) ( not ( = ?auto_291391 ?auto_291394 ) ) ( not ( = ?auto_291391 ?auto_291395 ) ) ( not ( = ?auto_291391 ?auto_291396 ) ) ( not ( = ?auto_291391 ?auto_291397 ) ) ( not ( = ?auto_291391 ?auto_291398 ) ) ( not ( = ?auto_291391 ?auto_291399 ) ) ( not ( = ?auto_291391 ?auto_291400 ) ) ( not ( = ?auto_291391 ?auto_291401 ) ) ( not ( = ?auto_291391 ?auto_291402 ) ) ( not ( = ?auto_291391 ?auto_291403 ) ) ( not ( = ?auto_291392 ?auto_291393 ) ) ( not ( = ?auto_291392 ?auto_291394 ) ) ( not ( = ?auto_291392 ?auto_291395 ) ) ( not ( = ?auto_291392 ?auto_291396 ) ) ( not ( = ?auto_291392 ?auto_291397 ) ) ( not ( = ?auto_291392 ?auto_291398 ) ) ( not ( = ?auto_291392 ?auto_291399 ) ) ( not ( = ?auto_291392 ?auto_291400 ) ) ( not ( = ?auto_291392 ?auto_291401 ) ) ( not ( = ?auto_291392 ?auto_291402 ) ) ( not ( = ?auto_291392 ?auto_291403 ) ) ( not ( = ?auto_291393 ?auto_291394 ) ) ( not ( = ?auto_291393 ?auto_291395 ) ) ( not ( = ?auto_291393 ?auto_291396 ) ) ( not ( = ?auto_291393 ?auto_291397 ) ) ( not ( = ?auto_291393 ?auto_291398 ) ) ( not ( = ?auto_291393 ?auto_291399 ) ) ( not ( = ?auto_291393 ?auto_291400 ) ) ( not ( = ?auto_291393 ?auto_291401 ) ) ( not ( = ?auto_291393 ?auto_291402 ) ) ( not ( = ?auto_291393 ?auto_291403 ) ) ( not ( = ?auto_291394 ?auto_291395 ) ) ( not ( = ?auto_291394 ?auto_291396 ) ) ( not ( = ?auto_291394 ?auto_291397 ) ) ( not ( = ?auto_291394 ?auto_291398 ) ) ( not ( = ?auto_291394 ?auto_291399 ) ) ( not ( = ?auto_291394 ?auto_291400 ) ) ( not ( = ?auto_291394 ?auto_291401 ) ) ( not ( = ?auto_291394 ?auto_291402 ) ) ( not ( = ?auto_291394 ?auto_291403 ) ) ( not ( = ?auto_291395 ?auto_291396 ) ) ( not ( = ?auto_291395 ?auto_291397 ) ) ( not ( = ?auto_291395 ?auto_291398 ) ) ( not ( = ?auto_291395 ?auto_291399 ) ) ( not ( = ?auto_291395 ?auto_291400 ) ) ( not ( = ?auto_291395 ?auto_291401 ) ) ( not ( = ?auto_291395 ?auto_291402 ) ) ( not ( = ?auto_291395 ?auto_291403 ) ) ( not ( = ?auto_291396 ?auto_291397 ) ) ( not ( = ?auto_291396 ?auto_291398 ) ) ( not ( = ?auto_291396 ?auto_291399 ) ) ( not ( = ?auto_291396 ?auto_291400 ) ) ( not ( = ?auto_291396 ?auto_291401 ) ) ( not ( = ?auto_291396 ?auto_291402 ) ) ( not ( = ?auto_291396 ?auto_291403 ) ) ( not ( = ?auto_291397 ?auto_291398 ) ) ( not ( = ?auto_291397 ?auto_291399 ) ) ( not ( = ?auto_291397 ?auto_291400 ) ) ( not ( = ?auto_291397 ?auto_291401 ) ) ( not ( = ?auto_291397 ?auto_291402 ) ) ( not ( = ?auto_291397 ?auto_291403 ) ) ( not ( = ?auto_291398 ?auto_291399 ) ) ( not ( = ?auto_291398 ?auto_291400 ) ) ( not ( = ?auto_291398 ?auto_291401 ) ) ( not ( = ?auto_291398 ?auto_291402 ) ) ( not ( = ?auto_291398 ?auto_291403 ) ) ( not ( = ?auto_291399 ?auto_291400 ) ) ( not ( = ?auto_291399 ?auto_291401 ) ) ( not ( = ?auto_291399 ?auto_291402 ) ) ( not ( = ?auto_291399 ?auto_291403 ) ) ( not ( = ?auto_291400 ?auto_291401 ) ) ( not ( = ?auto_291400 ?auto_291402 ) ) ( not ( = ?auto_291400 ?auto_291403 ) ) ( not ( = ?auto_291401 ?auto_291402 ) ) ( not ( = ?auto_291401 ?auto_291403 ) ) ( not ( = ?auto_291402 ?auto_291403 ) ) ( ON ?auto_291402 ?auto_291403 ) ( CLEAR ?auto_291400 ) ( ON ?auto_291401 ?auto_291402 ) ( CLEAR ?auto_291401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_291390 ?auto_291391 ?auto_291392 ?auto_291393 ?auto_291394 ?auto_291395 ?auto_291396 ?auto_291397 ?auto_291398 ?auto_291399 ?auto_291400 ?auto_291401 )
      ( MAKE-14PILE ?auto_291390 ?auto_291391 ?auto_291392 ?auto_291393 ?auto_291394 ?auto_291395 ?auto_291396 ?auto_291397 ?auto_291398 ?auto_291399 ?auto_291400 ?auto_291401 ?auto_291402 ?auto_291403 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291418 - BLOCK
      ?auto_291419 - BLOCK
      ?auto_291420 - BLOCK
      ?auto_291421 - BLOCK
      ?auto_291422 - BLOCK
      ?auto_291423 - BLOCK
      ?auto_291424 - BLOCK
      ?auto_291425 - BLOCK
      ?auto_291426 - BLOCK
      ?auto_291427 - BLOCK
      ?auto_291428 - BLOCK
      ?auto_291429 - BLOCK
      ?auto_291430 - BLOCK
      ?auto_291431 - BLOCK
    )
    :vars
    (
      ?auto_291432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_291431 ?auto_291432 ) ( ON-TABLE ?auto_291418 ) ( ON ?auto_291419 ?auto_291418 ) ( ON ?auto_291420 ?auto_291419 ) ( ON ?auto_291421 ?auto_291420 ) ( ON ?auto_291422 ?auto_291421 ) ( ON ?auto_291423 ?auto_291422 ) ( ON ?auto_291424 ?auto_291423 ) ( ON ?auto_291425 ?auto_291424 ) ( ON ?auto_291426 ?auto_291425 ) ( ON ?auto_291427 ?auto_291426 ) ( not ( = ?auto_291418 ?auto_291419 ) ) ( not ( = ?auto_291418 ?auto_291420 ) ) ( not ( = ?auto_291418 ?auto_291421 ) ) ( not ( = ?auto_291418 ?auto_291422 ) ) ( not ( = ?auto_291418 ?auto_291423 ) ) ( not ( = ?auto_291418 ?auto_291424 ) ) ( not ( = ?auto_291418 ?auto_291425 ) ) ( not ( = ?auto_291418 ?auto_291426 ) ) ( not ( = ?auto_291418 ?auto_291427 ) ) ( not ( = ?auto_291418 ?auto_291428 ) ) ( not ( = ?auto_291418 ?auto_291429 ) ) ( not ( = ?auto_291418 ?auto_291430 ) ) ( not ( = ?auto_291418 ?auto_291431 ) ) ( not ( = ?auto_291418 ?auto_291432 ) ) ( not ( = ?auto_291419 ?auto_291420 ) ) ( not ( = ?auto_291419 ?auto_291421 ) ) ( not ( = ?auto_291419 ?auto_291422 ) ) ( not ( = ?auto_291419 ?auto_291423 ) ) ( not ( = ?auto_291419 ?auto_291424 ) ) ( not ( = ?auto_291419 ?auto_291425 ) ) ( not ( = ?auto_291419 ?auto_291426 ) ) ( not ( = ?auto_291419 ?auto_291427 ) ) ( not ( = ?auto_291419 ?auto_291428 ) ) ( not ( = ?auto_291419 ?auto_291429 ) ) ( not ( = ?auto_291419 ?auto_291430 ) ) ( not ( = ?auto_291419 ?auto_291431 ) ) ( not ( = ?auto_291419 ?auto_291432 ) ) ( not ( = ?auto_291420 ?auto_291421 ) ) ( not ( = ?auto_291420 ?auto_291422 ) ) ( not ( = ?auto_291420 ?auto_291423 ) ) ( not ( = ?auto_291420 ?auto_291424 ) ) ( not ( = ?auto_291420 ?auto_291425 ) ) ( not ( = ?auto_291420 ?auto_291426 ) ) ( not ( = ?auto_291420 ?auto_291427 ) ) ( not ( = ?auto_291420 ?auto_291428 ) ) ( not ( = ?auto_291420 ?auto_291429 ) ) ( not ( = ?auto_291420 ?auto_291430 ) ) ( not ( = ?auto_291420 ?auto_291431 ) ) ( not ( = ?auto_291420 ?auto_291432 ) ) ( not ( = ?auto_291421 ?auto_291422 ) ) ( not ( = ?auto_291421 ?auto_291423 ) ) ( not ( = ?auto_291421 ?auto_291424 ) ) ( not ( = ?auto_291421 ?auto_291425 ) ) ( not ( = ?auto_291421 ?auto_291426 ) ) ( not ( = ?auto_291421 ?auto_291427 ) ) ( not ( = ?auto_291421 ?auto_291428 ) ) ( not ( = ?auto_291421 ?auto_291429 ) ) ( not ( = ?auto_291421 ?auto_291430 ) ) ( not ( = ?auto_291421 ?auto_291431 ) ) ( not ( = ?auto_291421 ?auto_291432 ) ) ( not ( = ?auto_291422 ?auto_291423 ) ) ( not ( = ?auto_291422 ?auto_291424 ) ) ( not ( = ?auto_291422 ?auto_291425 ) ) ( not ( = ?auto_291422 ?auto_291426 ) ) ( not ( = ?auto_291422 ?auto_291427 ) ) ( not ( = ?auto_291422 ?auto_291428 ) ) ( not ( = ?auto_291422 ?auto_291429 ) ) ( not ( = ?auto_291422 ?auto_291430 ) ) ( not ( = ?auto_291422 ?auto_291431 ) ) ( not ( = ?auto_291422 ?auto_291432 ) ) ( not ( = ?auto_291423 ?auto_291424 ) ) ( not ( = ?auto_291423 ?auto_291425 ) ) ( not ( = ?auto_291423 ?auto_291426 ) ) ( not ( = ?auto_291423 ?auto_291427 ) ) ( not ( = ?auto_291423 ?auto_291428 ) ) ( not ( = ?auto_291423 ?auto_291429 ) ) ( not ( = ?auto_291423 ?auto_291430 ) ) ( not ( = ?auto_291423 ?auto_291431 ) ) ( not ( = ?auto_291423 ?auto_291432 ) ) ( not ( = ?auto_291424 ?auto_291425 ) ) ( not ( = ?auto_291424 ?auto_291426 ) ) ( not ( = ?auto_291424 ?auto_291427 ) ) ( not ( = ?auto_291424 ?auto_291428 ) ) ( not ( = ?auto_291424 ?auto_291429 ) ) ( not ( = ?auto_291424 ?auto_291430 ) ) ( not ( = ?auto_291424 ?auto_291431 ) ) ( not ( = ?auto_291424 ?auto_291432 ) ) ( not ( = ?auto_291425 ?auto_291426 ) ) ( not ( = ?auto_291425 ?auto_291427 ) ) ( not ( = ?auto_291425 ?auto_291428 ) ) ( not ( = ?auto_291425 ?auto_291429 ) ) ( not ( = ?auto_291425 ?auto_291430 ) ) ( not ( = ?auto_291425 ?auto_291431 ) ) ( not ( = ?auto_291425 ?auto_291432 ) ) ( not ( = ?auto_291426 ?auto_291427 ) ) ( not ( = ?auto_291426 ?auto_291428 ) ) ( not ( = ?auto_291426 ?auto_291429 ) ) ( not ( = ?auto_291426 ?auto_291430 ) ) ( not ( = ?auto_291426 ?auto_291431 ) ) ( not ( = ?auto_291426 ?auto_291432 ) ) ( not ( = ?auto_291427 ?auto_291428 ) ) ( not ( = ?auto_291427 ?auto_291429 ) ) ( not ( = ?auto_291427 ?auto_291430 ) ) ( not ( = ?auto_291427 ?auto_291431 ) ) ( not ( = ?auto_291427 ?auto_291432 ) ) ( not ( = ?auto_291428 ?auto_291429 ) ) ( not ( = ?auto_291428 ?auto_291430 ) ) ( not ( = ?auto_291428 ?auto_291431 ) ) ( not ( = ?auto_291428 ?auto_291432 ) ) ( not ( = ?auto_291429 ?auto_291430 ) ) ( not ( = ?auto_291429 ?auto_291431 ) ) ( not ( = ?auto_291429 ?auto_291432 ) ) ( not ( = ?auto_291430 ?auto_291431 ) ) ( not ( = ?auto_291430 ?auto_291432 ) ) ( not ( = ?auto_291431 ?auto_291432 ) ) ( ON ?auto_291430 ?auto_291431 ) ( ON ?auto_291429 ?auto_291430 ) ( CLEAR ?auto_291427 ) ( ON ?auto_291428 ?auto_291429 ) ( CLEAR ?auto_291428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_291418 ?auto_291419 ?auto_291420 ?auto_291421 ?auto_291422 ?auto_291423 ?auto_291424 ?auto_291425 ?auto_291426 ?auto_291427 ?auto_291428 )
      ( MAKE-14PILE ?auto_291418 ?auto_291419 ?auto_291420 ?auto_291421 ?auto_291422 ?auto_291423 ?auto_291424 ?auto_291425 ?auto_291426 ?auto_291427 ?auto_291428 ?auto_291429 ?auto_291430 ?auto_291431 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291447 - BLOCK
      ?auto_291448 - BLOCK
      ?auto_291449 - BLOCK
      ?auto_291450 - BLOCK
      ?auto_291451 - BLOCK
      ?auto_291452 - BLOCK
      ?auto_291453 - BLOCK
      ?auto_291454 - BLOCK
      ?auto_291455 - BLOCK
      ?auto_291456 - BLOCK
      ?auto_291457 - BLOCK
      ?auto_291458 - BLOCK
      ?auto_291459 - BLOCK
      ?auto_291460 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_291460 ) ( ON-TABLE ?auto_291447 ) ( ON ?auto_291448 ?auto_291447 ) ( ON ?auto_291449 ?auto_291448 ) ( ON ?auto_291450 ?auto_291449 ) ( ON ?auto_291451 ?auto_291450 ) ( ON ?auto_291452 ?auto_291451 ) ( ON ?auto_291453 ?auto_291452 ) ( ON ?auto_291454 ?auto_291453 ) ( ON ?auto_291455 ?auto_291454 ) ( ON ?auto_291456 ?auto_291455 ) ( not ( = ?auto_291447 ?auto_291448 ) ) ( not ( = ?auto_291447 ?auto_291449 ) ) ( not ( = ?auto_291447 ?auto_291450 ) ) ( not ( = ?auto_291447 ?auto_291451 ) ) ( not ( = ?auto_291447 ?auto_291452 ) ) ( not ( = ?auto_291447 ?auto_291453 ) ) ( not ( = ?auto_291447 ?auto_291454 ) ) ( not ( = ?auto_291447 ?auto_291455 ) ) ( not ( = ?auto_291447 ?auto_291456 ) ) ( not ( = ?auto_291447 ?auto_291457 ) ) ( not ( = ?auto_291447 ?auto_291458 ) ) ( not ( = ?auto_291447 ?auto_291459 ) ) ( not ( = ?auto_291447 ?auto_291460 ) ) ( not ( = ?auto_291448 ?auto_291449 ) ) ( not ( = ?auto_291448 ?auto_291450 ) ) ( not ( = ?auto_291448 ?auto_291451 ) ) ( not ( = ?auto_291448 ?auto_291452 ) ) ( not ( = ?auto_291448 ?auto_291453 ) ) ( not ( = ?auto_291448 ?auto_291454 ) ) ( not ( = ?auto_291448 ?auto_291455 ) ) ( not ( = ?auto_291448 ?auto_291456 ) ) ( not ( = ?auto_291448 ?auto_291457 ) ) ( not ( = ?auto_291448 ?auto_291458 ) ) ( not ( = ?auto_291448 ?auto_291459 ) ) ( not ( = ?auto_291448 ?auto_291460 ) ) ( not ( = ?auto_291449 ?auto_291450 ) ) ( not ( = ?auto_291449 ?auto_291451 ) ) ( not ( = ?auto_291449 ?auto_291452 ) ) ( not ( = ?auto_291449 ?auto_291453 ) ) ( not ( = ?auto_291449 ?auto_291454 ) ) ( not ( = ?auto_291449 ?auto_291455 ) ) ( not ( = ?auto_291449 ?auto_291456 ) ) ( not ( = ?auto_291449 ?auto_291457 ) ) ( not ( = ?auto_291449 ?auto_291458 ) ) ( not ( = ?auto_291449 ?auto_291459 ) ) ( not ( = ?auto_291449 ?auto_291460 ) ) ( not ( = ?auto_291450 ?auto_291451 ) ) ( not ( = ?auto_291450 ?auto_291452 ) ) ( not ( = ?auto_291450 ?auto_291453 ) ) ( not ( = ?auto_291450 ?auto_291454 ) ) ( not ( = ?auto_291450 ?auto_291455 ) ) ( not ( = ?auto_291450 ?auto_291456 ) ) ( not ( = ?auto_291450 ?auto_291457 ) ) ( not ( = ?auto_291450 ?auto_291458 ) ) ( not ( = ?auto_291450 ?auto_291459 ) ) ( not ( = ?auto_291450 ?auto_291460 ) ) ( not ( = ?auto_291451 ?auto_291452 ) ) ( not ( = ?auto_291451 ?auto_291453 ) ) ( not ( = ?auto_291451 ?auto_291454 ) ) ( not ( = ?auto_291451 ?auto_291455 ) ) ( not ( = ?auto_291451 ?auto_291456 ) ) ( not ( = ?auto_291451 ?auto_291457 ) ) ( not ( = ?auto_291451 ?auto_291458 ) ) ( not ( = ?auto_291451 ?auto_291459 ) ) ( not ( = ?auto_291451 ?auto_291460 ) ) ( not ( = ?auto_291452 ?auto_291453 ) ) ( not ( = ?auto_291452 ?auto_291454 ) ) ( not ( = ?auto_291452 ?auto_291455 ) ) ( not ( = ?auto_291452 ?auto_291456 ) ) ( not ( = ?auto_291452 ?auto_291457 ) ) ( not ( = ?auto_291452 ?auto_291458 ) ) ( not ( = ?auto_291452 ?auto_291459 ) ) ( not ( = ?auto_291452 ?auto_291460 ) ) ( not ( = ?auto_291453 ?auto_291454 ) ) ( not ( = ?auto_291453 ?auto_291455 ) ) ( not ( = ?auto_291453 ?auto_291456 ) ) ( not ( = ?auto_291453 ?auto_291457 ) ) ( not ( = ?auto_291453 ?auto_291458 ) ) ( not ( = ?auto_291453 ?auto_291459 ) ) ( not ( = ?auto_291453 ?auto_291460 ) ) ( not ( = ?auto_291454 ?auto_291455 ) ) ( not ( = ?auto_291454 ?auto_291456 ) ) ( not ( = ?auto_291454 ?auto_291457 ) ) ( not ( = ?auto_291454 ?auto_291458 ) ) ( not ( = ?auto_291454 ?auto_291459 ) ) ( not ( = ?auto_291454 ?auto_291460 ) ) ( not ( = ?auto_291455 ?auto_291456 ) ) ( not ( = ?auto_291455 ?auto_291457 ) ) ( not ( = ?auto_291455 ?auto_291458 ) ) ( not ( = ?auto_291455 ?auto_291459 ) ) ( not ( = ?auto_291455 ?auto_291460 ) ) ( not ( = ?auto_291456 ?auto_291457 ) ) ( not ( = ?auto_291456 ?auto_291458 ) ) ( not ( = ?auto_291456 ?auto_291459 ) ) ( not ( = ?auto_291456 ?auto_291460 ) ) ( not ( = ?auto_291457 ?auto_291458 ) ) ( not ( = ?auto_291457 ?auto_291459 ) ) ( not ( = ?auto_291457 ?auto_291460 ) ) ( not ( = ?auto_291458 ?auto_291459 ) ) ( not ( = ?auto_291458 ?auto_291460 ) ) ( not ( = ?auto_291459 ?auto_291460 ) ) ( ON ?auto_291459 ?auto_291460 ) ( ON ?auto_291458 ?auto_291459 ) ( CLEAR ?auto_291456 ) ( ON ?auto_291457 ?auto_291458 ) ( CLEAR ?auto_291457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_291447 ?auto_291448 ?auto_291449 ?auto_291450 ?auto_291451 ?auto_291452 ?auto_291453 ?auto_291454 ?auto_291455 ?auto_291456 ?auto_291457 )
      ( MAKE-14PILE ?auto_291447 ?auto_291448 ?auto_291449 ?auto_291450 ?auto_291451 ?auto_291452 ?auto_291453 ?auto_291454 ?auto_291455 ?auto_291456 ?auto_291457 ?auto_291458 ?auto_291459 ?auto_291460 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291475 - BLOCK
      ?auto_291476 - BLOCK
      ?auto_291477 - BLOCK
      ?auto_291478 - BLOCK
      ?auto_291479 - BLOCK
      ?auto_291480 - BLOCK
      ?auto_291481 - BLOCK
      ?auto_291482 - BLOCK
      ?auto_291483 - BLOCK
      ?auto_291484 - BLOCK
      ?auto_291485 - BLOCK
      ?auto_291486 - BLOCK
      ?auto_291487 - BLOCK
      ?auto_291488 - BLOCK
    )
    :vars
    (
      ?auto_291489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_291488 ?auto_291489 ) ( ON-TABLE ?auto_291475 ) ( ON ?auto_291476 ?auto_291475 ) ( ON ?auto_291477 ?auto_291476 ) ( ON ?auto_291478 ?auto_291477 ) ( ON ?auto_291479 ?auto_291478 ) ( ON ?auto_291480 ?auto_291479 ) ( ON ?auto_291481 ?auto_291480 ) ( ON ?auto_291482 ?auto_291481 ) ( ON ?auto_291483 ?auto_291482 ) ( not ( = ?auto_291475 ?auto_291476 ) ) ( not ( = ?auto_291475 ?auto_291477 ) ) ( not ( = ?auto_291475 ?auto_291478 ) ) ( not ( = ?auto_291475 ?auto_291479 ) ) ( not ( = ?auto_291475 ?auto_291480 ) ) ( not ( = ?auto_291475 ?auto_291481 ) ) ( not ( = ?auto_291475 ?auto_291482 ) ) ( not ( = ?auto_291475 ?auto_291483 ) ) ( not ( = ?auto_291475 ?auto_291484 ) ) ( not ( = ?auto_291475 ?auto_291485 ) ) ( not ( = ?auto_291475 ?auto_291486 ) ) ( not ( = ?auto_291475 ?auto_291487 ) ) ( not ( = ?auto_291475 ?auto_291488 ) ) ( not ( = ?auto_291475 ?auto_291489 ) ) ( not ( = ?auto_291476 ?auto_291477 ) ) ( not ( = ?auto_291476 ?auto_291478 ) ) ( not ( = ?auto_291476 ?auto_291479 ) ) ( not ( = ?auto_291476 ?auto_291480 ) ) ( not ( = ?auto_291476 ?auto_291481 ) ) ( not ( = ?auto_291476 ?auto_291482 ) ) ( not ( = ?auto_291476 ?auto_291483 ) ) ( not ( = ?auto_291476 ?auto_291484 ) ) ( not ( = ?auto_291476 ?auto_291485 ) ) ( not ( = ?auto_291476 ?auto_291486 ) ) ( not ( = ?auto_291476 ?auto_291487 ) ) ( not ( = ?auto_291476 ?auto_291488 ) ) ( not ( = ?auto_291476 ?auto_291489 ) ) ( not ( = ?auto_291477 ?auto_291478 ) ) ( not ( = ?auto_291477 ?auto_291479 ) ) ( not ( = ?auto_291477 ?auto_291480 ) ) ( not ( = ?auto_291477 ?auto_291481 ) ) ( not ( = ?auto_291477 ?auto_291482 ) ) ( not ( = ?auto_291477 ?auto_291483 ) ) ( not ( = ?auto_291477 ?auto_291484 ) ) ( not ( = ?auto_291477 ?auto_291485 ) ) ( not ( = ?auto_291477 ?auto_291486 ) ) ( not ( = ?auto_291477 ?auto_291487 ) ) ( not ( = ?auto_291477 ?auto_291488 ) ) ( not ( = ?auto_291477 ?auto_291489 ) ) ( not ( = ?auto_291478 ?auto_291479 ) ) ( not ( = ?auto_291478 ?auto_291480 ) ) ( not ( = ?auto_291478 ?auto_291481 ) ) ( not ( = ?auto_291478 ?auto_291482 ) ) ( not ( = ?auto_291478 ?auto_291483 ) ) ( not ( = ?auto_291478 ?auto_291484 ) ) ( not ( = ?auto_291478 ?auto_291485 ) ) ( not ( = ?auto_291478 ?auto_291486 ) ) ( not ( = ?auto_291478 ?auto_291487 ) ) ( not ( = ?auto_291478 ?auto_291488 ) ) ( not ( = ?auto_291478 ?auto_291489 ) ) ( not ( = ?auto_291479 ?auto_291480 ) ) ( not ( = ?auto_291479 ?auto_291481 ) ) ( not ( = ?auto_291479 ?auto_291482 ) ) ( not ( = ?auto_291479 ?auto_291483 ) ) ( not ( = ?auto_291479 ?auto_291484 ) ) ( not ( = ?auto_291479 ?auto_291485 ) ) ( not ( = ?auto_291479 ?auto_291486 ) ) ( not ( = ?auto_291479 ?auto_291487 ) ) ( not ( = ?auto_291479 ?auto_291488 ) ) ( not ( = ?auto_291479 ?auto_291489 ) ) ( not ( = ?auto_291480 ?auto_291481 ) ) ( not ( = ?auto_291480 ?auto_291482 ) ) ( not ( = ?auto_291480 ?auto_291483 ) ) ( not ( = ?auto_291480 ?auto_291484 ) ) ( not ( = ?auto_291480 ?auto_291485 ) ) ( not ( = ?auto_291480 ?auto_291486 ) ) ( not ( = ?auto_291480 ?auto_291487 ) ) ( not ( = ?auto_291480 ?auto_291488 ) ) ( not ( = ?auto_291480 ?auto_291489 ) ) ( not ( = ?auto_291481 ?auto_291482 ) ) ( not ( = ?auto_291481 ?auto_291483 ) ) ( not ( = ?auto_291481 ?auto_291484 ) ) ( not ( = ?auto_291481 ?auto_291485 ) ) ( not ( = ?auto_291481 ?auto_291486 ) ) ( not ( = ?auto_291481 ?auto_291487 ) ) ( not ( = ?auto_291481 ?auto_291488 ) ) ( not ( = ?auto_291481 ?auto_291489 ) ) ( not ( = ?auto_291482 ?auto_291483 ) ) ( not ( = ?auto_291482 ?auto_291484 ) ) ( not ( = ?auto_291482 ?auto_291485 ) ) ( not ( = ?auto_291482 ?auto_291486 ) ) ( not ( = ?auto_291482 ?auto_291487 ) ) ( not ( = ?auto_291482 ?auto_291488 ) ) ( not ( = ?auto_291482 ?auto_291489 ) ) ( not ( = ?auto_291483 ?auto_291484 ) ) ( not ( = ?auto_291483 ?auto_291485 ) ) ( not ( = ?auto_291483 ?auto_291486 ) ) ( not ( = ?auto_291483 ?auto_291487 ) ) ( not ( = ?auto_291483 ?auto_291488 ) ) ( not ( = ?auto_291483 ?auto_291489 ) ) ( not ( = ?auto_291484 ?auto_291485 ) ) ( not ( = ?auto_291484 ?auto_291486 ) ) ( not ( = ?auto_291484 ?auto_291487 ) ) ( not ( = ?auto_291484 ?auto_291488 ) ) ( not ( = ?auto_291484 ?auto_291489 ) ) ( not ( = ?auto_291485 ?auto_291486 ) ) ( not ( = ?auto_291485 ?auto_291487 ) ) ( not ( = ?auto_291485 ?auto_291488 ) ) ( not ( = ?auto_291485 ?auto_291489 ) ) ( not ( = ?auto_291486 ?auto_291487 ) ) ( not ( = ?auto_291486 ?auto_291488 ) ) ( not ( = ?auto_291486 ?auto_291489 ) ) ( not ( = ?auto_291487 ?auto_291488 ) ) ( not ( = ?auto_291487 ?auto_291489 ) ) ( not ( = ?auto_291488 ?auto_291489 ) ) ( ON ?auto_291487 ?auto_291488 ) ( ON ?auto_291486 ?auto_291487 ) ( ON ?auto_291485 ?auto_291486 ) ( CLEAR ?auto_291483 ) ( ON ?auto_291484 ?auto_291485 ) ( CLEAR ?auto_291484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_291475 ?auto_291476 ?auto_291477 ?auto_291478 ?auto_291479 ?auto_291480 ?auto_291481 ?auto_291482 ?auto_291483 ?auto_291484 )
      ( MAKE-14PILE ?auto_291475 ?auto_291476 ?auto_291477 ?auto_291478 ?auto_291479 ?auto_291480 ?auto_291481 ?auto_291482 ?auto_291483 ?auto_291484 ?auto_291485 ?auto_291486 ?auto_291487 ?auto_291488 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291504 - BLOCK
      ?auto_291505 - BLOCK
      ?auto_291506 - BLOCK
      ?auto_291507 - BLOCK
      ?auto_291508 - BLOCK
      ?auto_291509 - BLOCK
      ?auto_291510 - BLOCK
      ?auto_291511 - BLOCK
      ?auto_291512 - BLOCK
      ?auto_291513 - BLOCK
      ?auto_291514 - BLOCK
      ?auto_291515 - BLOCK
      ?auto_291516 - BLOCK
      ?auto_291517 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_291517 ) ( ON-TABLE ?auto_291504 ) ( ON ?auto_291505 ?auto_291504 ) ( ON ?auto_291506 ?auto_291505 ) ( ON ?auto_291507 ?auto_291506 ) ( ON ?auto_291508 ?auto_291507 ) ( ON ?auto_291509 ?auto_291508 ) ( ON ?auto_291510 ?auto_291509 ) ( ON ?auto_291511 ?auto_291510 ) ( ON ?auto_291512 ?auto_291511 ) ( not ( = ?auto_291504 ?auto_291505 ) ) ( not ( = ?auto_291504 ?auto_291506 ) ) ( not ( = ?auto_291504 ?auto_291507 ) ) ( not ( = ?auto_291504 ?auto_291508 ) ) ( not ( = ?auto_291504 ?auto_291509 ) ) ( not ( = ?auto_291504 ?auto_291510 ) ) ( not ( = ?auto_291504 ?auto_291511 ) ) ( not ( = ?auto_291504 ?auto_291512 ) ) ( not ( = ?auto_291504 ?auto_291513 ) ) ( not ( = ?auto_291504 ?auto_291514 ) ) ( not ( = ?auto_291504 ?auto_291515 ) ) ( not ( = ?auto_291504 ?auto_291516 ) ) ( not ( = ?auto_291504 ?auto_291517 ) ) ( not ( = ?auto_291505 ?auto_291506 ) ) ( not ( = ?auto_291505 ?auto_291507 ) ) ( not ( = ?auto_291505 ?auto_291508 ) ) ( not ( = ?auto_291505 ?auto_291509 ) ) ( not ( = ?auto_291505 ?auto_291510 ) ) ( not ( = ?auto_291505 ?auto_291511 ) ) ( not ( = ?auto_291505 ?auto_291512 ) ) ( not ( = ?auto_291505 ?auto_291513 ) ) ( not ( = ?auto_291505 ?auto_291514 ) ) ( not ( = ?auto_291505 ?auto_291515 ) ) ( not ( = ?auto_291505 ?auto_291516 ) ) ( not ( = ?auto_291505 ?auto_291517 ) ) ( not ( = ?auto_291506 ?auto_291507 ) ) ( not ( = ?auto_291506 ?auto_291508 ) ) ( not ( = ?auto_291506 ?auto_291509 ) ) ( not ( = ?auto_291506 ?auto_291510 ) ) ( not ( = ?auto_291506 ?auto_291511 ) ) ( not ( = ?auto_291506 ?auto_291512 ) ) ( not ( = ?auto_291506 ?auto_291513 ) ) ( not ( = ?auto_291506 ?auto_291514 ) ) ( not ( = ?auto_291506 ?auto_291515 ) ) ( not ( = ?auto_291506 ?auto_291516 ) ) ( not ( = ?auto_291506 ?auto_291517 ) ) ( not ( = ?auto_291507 ?auto_291508 ) ) ( not ( = ?auto_291507 ?auto_291509 ) ) ( not ( = ?auto_291507 ?auto_291510 ) ) ( not ( = ?auto_291507 ?auto_291511 ) ) ( not ( = ?auto_291507 ?auto_291512 ) ) ( not ( = ?auto_291507 ?auto_291513 ) ) ( not ( = ?auto_291507 ?auto_291514 ) ) ( not ( = ?auto_291507 ?auto_291515 ) ) ( not ( = ?auto_291507 ?auto_291516 ) ) ( not ( = ?auto_291507 ?auto_291517 ) ) ( not ( = ?auto_291508 ?auto_291509 ) ) ( not ( = ?auto_291508 ?auto_291510 ) ) ( not ( = ?auto_291508 ?auto_291511 ) ) ( not ( = ?auto_291508 ?auto_291512 ) ) ( not ( = ?auto_291508 ?auto_291513 ) ) ( not ( = ?auto_291508 ?auto_291514 ) ) ( not ( = ?auto_291508 ?auto_291515 ) ) ( not ( = ?auto_291508 ?auto_291516 ) ) ( not ( = ?auto_291508 ?auto_291517 ) ) ( not ( = ?auto_291509 ?auto_291510 ) ) ( not ( = ?auto_291509 ?auto_291511 ) ) ( not ( = ?auto_291509 ?auto_291512 ) ) ( not ( = ?auto_291509 ?auto_291513 ) ) ( not ( = ?auto_291509 ?auto_291514 ) ) ( not ( = ?auto_291509 ?auto_291515 ) ) ( not ( = ?auto_291509 ?auto_291516 ) ) ( not ( = ?auto_291509 ?auto_291517 ) ) ( not ( = ?auto_291510 ?auto_291511 ) ) ( not ( = ?auto_291510 ?auto_291512 ) ) ( not ( = ?auto_291510 ?auto_291513 ) ) ( not ( = ?auto_291510 ?auto_291514 ) ) ( not ( = ?auto_291510 ?auto_291515 ) ) ( not ( = ?auto_291510 ?auto_291516 ) ) ( not ( = ?auto_291510 ?auto_291517 ) ) ( not ( = ?auto_291511 ?auto_291512 ) ) ( not ( = ?auto_291511 ?auto_291513 ) ) ( not ( = ?auto_291511 ?auto_291514 ) ) ( not ( = ?auto_291511 ?auto_291515 ) ) ( not ( = ?auto_291511 ?auto_291516 ) ) ( not ( = ?auto_291511 ?auto_291517 ) ) ( not ( = ?auto_291512 ?auto_291513 ) ) ( not ( = ?auto_291512 ?auto_291514 ) ) ( not ( = ?auto_291512 ?auto_291515 ) ) ( not ( = ?auto_291512 ?auto_291516 ) ) ( not ( = ?auto_291512 ?auto_291517 ) ) ( not ( = ?auto_291513 ?auto_291514 ) ) ( not ( = ?auto_291513 ?auto_291515 ) ) ( not ( = ?auto_291513 ?auto_291516 ) ) ( not ( = ?auto_291513 ?auto_291517 ) ) ( not ( = ?auto_291514 ?auto_291515 ) ) ( not ( = ?auto_291514 ?auto_291516 ) ) ( not ( = ?auto_291514 ?auto_291517 ) ) ( not ( = ?auto_291515 ?auto_291516 ) ) ( not ( = ?auto_291515 ?auto_291517 ) ) ( not ( = ?auto_291516 ?auto_291517 ) ) ( ON ?auto_291516 ?auto_291517 ) ( ON ?auto_291515 ?auto_291516 ) ( ON ?auto_291514 ?auto_291515 ) ( CLEAR ?auto_291512 ) ( ON ?auto_291513 ?auto_291514 ) ( CLEAR ?auto_291513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_291504 ?auto_291505 ?auto_291506 ?auto_291507 ?auto_291508 ?auto_291509 ?auto_291510 ?auto_291511 ?auto_291512 ?auto_291513 )
      ( MAKE-14PILE ?auto_291504 ?auto_291505 ?auto_291506 ?auto_291507 ?auto_291508 ?auto_291509 ?auto_291510 ?auto_291511 ?auto_291512 ?auto_291513 ?auto_291514 ?auto_291515 ?auto_291516 ?auto_291517 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291532 - BLOCK
      ?auto_291533 - BLOCK
      ?auto_291534 - BLOCK
      ?auto_291535 - BLOCK
      ?auto_291536 - BLOCK
      ?auto_291537 - BLOCK
      ?auto_291538 - BLOCK
      ?auto_291539 - BLOCK
      ?auto_291540 - BLOCK
      ?auto_291541 - BLOCK
      ?auto_291542 - BLOCK
      ?auto_291543 - BLOCK
      ?auto_291544 - BLOCK
      ?auto_291545 - BLOCK
    )
    :vars
    (
      ?auto_291546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_291545 ?auto_291546 ) ( ON-TABLE ?auto_291532 ) ( ON ?auto_291533 ?auto_291532 ) ( ON ?auto_291534 ?auto_291533 ) ( ON ?auto_291535 ?auto_291534 ) ( ON ?auto_291536 ?auto_291535 ) ( ON ?auto_291537 ?auto_291536 ) ( ON ?auto_291538 ?auto_291537 ) ( ON ?auto_291539 ?auto_291538 ) ( not ( = ?auto_291532 ?auto_291533 ) ) ( not ( = ?auto_291532 ?auto_291534 ) ) ( not ( = ?auto_291532 ?auto_291535 ) ) ( not ( = ?auto_291532 ?auto_291536 ) ) ( not ( = ?auto_291532 ?auto_291537 ) ) ( not ( = ?auto_291532 ?auto_291538 ) ) ( not ( = ?auto_291532 ?auto_291539 ) ) ( not ( = ?auto_291532 ?auto_291540 ) ) ( not ( = ?auto_291532 ?auto_291541 ) ) ( not ( = ?auto_291532 ?auto_291542 ) ) ( not ( = ?auto_291532 ?auto_291543 ) ) ( not ( = ?auto_291532 ?auto_291544 ) ) ( not ( = ?auto_291532 ?auto_291545 ) ) ( not ( = ?auto_291532 ?auto_291546 ) ) ( not ( = ?auto_291533 ?auto_291534 ) ) ( not ( = ?auto_291533 ?auto_291535 ) ) ( not ( = ?auto_291533 ?auto_291536 ) ) ( not ( = ?auto_291533 ?auto_291537 ) ) ( not ( = ?auto_291533 ?auto_291538 ) ) ( not ( = ?auto_291533 ?auto_291539 ) ) ( not ( = ?auto_291533 ?auto_291540 ) ) ( not ( = ?auto_291533 ?auto_291541 ) ) ( not ( = ?auto_291533 ?auto_291542 ) ) ( not ( = ?auto_291533 ?auto_291543 ) ) ( not ( = ?auto_291533 ?auto_291544 ) ) ( not ( = ?auto_291533 ?auto_291545 ) ) ( not ( = ?auto_291533 ?auto_291546 ) ) ( not ( = ?auto_291534 ?auto_291535 ) ) ( not ( = ?auto_291534 ?auto_291536 ) ) ( not ( = ?auto_291534 ?auto_291537 ) ) ( not ( = ?auto_291534 ?auto_291538 ) ) ( not ( = ?auto_291534 ?auto_291539 ) ) ( not ( = ?auto_291534 ?auto_291540 ) ) ( not ( = ?auto_291534 ?auto_291541 ) ) ( not ( = ?auto_291534 ?auto_291542 ) ) ( not ( = ?auto_291534 ?auto_291543 ) ) ( not ( = ?auto_291534 ?auto_291544 ) ) ( not ( = ?auto_291534 ?auto_291545 ) ) ( not ( = ?auto_291534 ?auto_291546 ) ) ( not ( = ?auto_291535 ?auto_291536 ) ) ( not ( = ?auto_291535 ?auto_291537 ) ) ( not ( = ?auto_291535 ?auto_291538 ) ) ( not ( = ?auto_291535 ?auto_291539 ) ) ( not ( = ?auto_291535 ?auto_291540 ) ) ( not ( = ?auto_291535 ?auto_291541 ) ) ( not ( = ?auto_291535 ?auto_291542 ) ) ( not ( = ?auto_291535 ?auto_291543 ) ) ( not ( = ?auto_291535 ?auto_291544 ) ) ( not ( = ?auto_291535 ?auto_291545 ) ) ( not ( = ?auto_291535 ?auto_291546 ) ) ( not ( = ?auto_291536 ?auto_291537 ) ) ( not ( = ?auto_291536 ?auto_291538 ) ) ( not ( = ?auto_291536 ?auto_291539 ) ) ( not ( = ?auto_291536 ?auto_291540 ) ) ( not ( = ?auto_291536 ?auto_291541 ) ) ( not ( = ?auto_291536 ?auto_291542 ) ) ( not ( = ?auto_291536 ?auto_291543 ) ) ( not ( = ?auto_291536 ?auto_291544 ) ) ( not ( = ?auto_291536 ?auto_291545 ) ) ( not ( = ?auto_291536 ?auto_291546 ) ) ( not ( = ?auto_291537 ?auto_291538 ) ) ( not ( = ?auto_291537 ?auto_291539 ) ) ( not ( = ?auto_291537 ?auto_291540 ) ) ( not ( = ?auto_291537 ?auto_291541 ) ) ( not ( = ?auto_291537 ?auto_291542 ) ) ( not ( = ?auto_291537 ?auto_291543 ) ) ( not ( = ?auto_291537 ?auto_291544 ) ) ( not ( = ?auto_291537 ?auto_291545 ) ) ( not ( = ?auto_291537 ?auto_291546 ) ) ( not ( = ?auto_291538 ?auto_291539 ) ) ( not ( = ?auto_291538 ?auto_291540 ) ) ( not ( = ?auto_291538 ?auto_291541 ) ) ( not ( = ?auto_291538 ?auto_291542 ) ) ( not ( = ?auto_291538 ?auto_291543 ) ) ( not ( = ?auto_291538 ?auto_291544 ) ) ( not ( = ?auto_291538 ?auto_291545 ) ) ( not ( = ?auto_291538 ?auto_291546 ) ) ( not ( = ?auto_291539 ?auto_291540 ) ) ( not ( = ?auto_291539 ?auto_291541 ) ) ( not ( = ?auto_291539 ?auto_291542 ) ) ( not ( = ?auto_291539 ?auto_291543 ) ) ( not ( = ?auto_291539 ?auto_291544 ) ) ( not ( = ?auto_291539 ?auto_291545 ) ) ( not ( = ?auto_291539 ?auto_291546 ) ) ( not ( = ?auto_291540 ?auto_291541 ) ) ( not ( = ?auto_291540 ?auto_291542 ) ) ( not ( = ?auto_291540 ?auto_291543 ) ) ( not ( = ?auto_291540 ?auto_291544 ) ) ( not ( = ?auto_291540 ?auto_291545 ) ) ( not ( = ?auto_291540 ?auto_291546 ) ) ( not ( = ?auto_291541 ?auto_291542 ) ) ( not ( = ?auto_291541 ?auto_291543 ) ) ( not ( = ?auto_291541 ?auto_291544 ) ) ( not ( = ?auto_291541 ?auto_291545 ) ) ( not ( = ?auto_291541 ?auto_291546 ) ) ( not ( = ?auto_291542 ?auto_291543 ) ) ( not ( = ?auto_291542 ?auto_291544 ) ) ( not ( = ?auto_291542 ?auto_291545 ) ) ( not ( = ?auto_291542 ?auto_291546 ) ) ( not ( = ?auto_291543 ?auto_291544 ) ) ( not ( = ?auto_291543 ?auto_291545 ) ) ( not ( = ?auto_291543 ?auto_291546 ) ) ( not ( = ?auto_291544 ?auto_291545 ) ) ( not ( = ?auto_291544 ?auto_291546 ) ) ( not ( = ?auto_291545 ?auto_291546 ) ) ( ON ?auto_291544 ?auto_291545 ) ( ON ?auto_291543 ?auto_291544 ) ( ON ?auto_291542 ?auto_291543 ) ( ON ?auto_291541 ?auto_291542 ) ( CLEAR ?auto_291539 ) ( ON ?auto_291540 ?auto_291541 ) ( CLEAR ?auto_291540 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_291532 ?auto_291533 ?auto_291534 ?auto_291535 ?auto_291536 ?auto_291537 ?auto_291538 ?auto_291539 ?auto_291540 )
      ( MAKE-14PILE ?auto_291532 ?auto_291533 ?auto_291534 ?auto_291535 ?auto_291536 ?auto_291537 ?auto_291538 ?auto_291539 ?auto_291540 ?auto_291541 ?auto_291542 ?auto_291543 ?auto_291544 ?auto_291545 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291561 - BLOCK
      ?auto_291562 - BLOCK
      ?auto_291563 - BLOCK
      ?auto_291564 - BLOCK
      ?auto_291565 - BLOCK
      ?auto_291566 - BLOCK
      ?auto_291567 - BLOCK
      ?auto_291568 - BLOCK
      ?auto_291569 - BLOCK
      ?auto_291570 - BLOCK
      ?auto_291571 - BLOCK
      ?auto_291572 - BLOCK
      ?auto_291573 - BLOCK
      ?auto_291574 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_291574 ) ( ON-TABLE ?auto_291561 ) ( ON ?auto_291562 ?auto_291561 ) ( ON ?auto_291563 ?auto_291562 ) ( ON ?auto_291564 ?auto_291563 ) ( ON ?auto_291565 ?auto_291564 ) ( ON ?auto_291566 ?auto_291565 ) ( ON ?auto_291567 ?auto_291566 ) ( ON ?auto_291568 ?auto_291567 ) ( not ( = ?auto_291561 ?auto_291562 ) ) ( not ( = ?auto_291561 ?auto_291563 ) ) ( not ( = ?auto_291561 ?auto_291564 ) ) ( not ( = ?auto_291561 ?auto_291565 ) ) ( not ( = ?auto_291561 ?auto_291566 ) ) ( not ( = ?auto_291561 ?auto_291567 ) ) ( not ( = ?auto_291561 ?auto_291568 ) ) ( not ( = ?auto_291561 ?auto_291569 ) ) ( not ( = ?auto_291561 ?auto_291570 ) ) ( not ( = ?auto_291561 ?auto_291571 ) ) ( not ( = ?auto_291561 ?auto_291572 ) ) ( not ( = ?auto_291561 ?auto_291573 ) ) ( not ( = ?auto_291561 ?auto_291574 ) ) ( not ( = ?auto_291562 ?auto_291563 ) ) ( not ( = ?auto_291562 ?auto_291564 ) ) ( not ( = ?auto_291562 ?auto_291565 ) ) ( not ( = ?auto_291562 ?auto_291566 ) ) ( not ( = ?auto_291562 ?auto_291567 ) ) ( not ( = ?auto_291562 ?auto_291568 ) ) ( not ( = ?auto_291562 ?auto_291569 ) ) ( not ( = ?auto_291562 ?auto_291570 ) ) ( not ( = ?auto_291562 ?auto_291571 ) ) ( not ( = ?auto_291562 ?auto_291572 ) ) ( not ( = ?auto_291562 ?auto_291573 ) ) ( not ( = ?auto_291562 ?auto_291574 ) ) ( not ( = ?auto_291563 ?auto_291564 ) ) ( not ( = ?auto_291563 ?auto_291565 ) ) ( not ( = ?auto_291563 ?auto_291566 ) ) ( not ( = ?auto_291563 ?auto_291567 ) ) ( not ( = ?auto_291563 ?auto_291568 ) ) ( not ( = ?auto_291563 ?auto_291569 ) ) ( not ( = ?auto_291563 ?auto_291570 ) ) ( not ( = ?auto_291563 ?auto_291571 ) ) ( not ( = ?auto_291563 ?auto_291572 ) ) ( not ( = ?auto_291563 ?auto_291573 ) ) ( not ( = ?auto_291563 ?auto_291574 ) ) ( not ( = ?auto_291564 ?auto_291565 ) ) ( not ( = ?auto_291564 ?auto_291566 ) ) ( not ( = ?auto_291564 ?auto_291567 ) ) ( not ( = ?auto_291564 ?auto_291568 ) ) ( not ( = ?auto_291564 ?auto_291569 ) ) ( not ( = ?auto_291564 ?auto_291570 ) ) ( not ( = ?auto_291564 ?auto_291571 ) ) ( not ( = ?auto_291564 ?auto_291572 ) ) ( not ( = ?auto_291564 ?auto_291573 ) ) ( not ( = ?auto_291564 ?auto_291574 ) ) ( not ( = ?auto_291565 ?auto_291566 ) ) ( not ( = ?auto_291565 ?auto_291567 ) ) ( not ( = ?auto_291565 ?auto_291568 ) ) ( not ( = ?auto_291565 ?auto_291569 ) ) ( not ( = ?auto_291565 ?auto_291570 ) ) ( not ( = ?auto_291565 ?auto_291571 ) ) ( not ( = ?auto_291565 ?auto_291572 ) ) ( not ( = ?auto_291565 ?auto_291573 ) ) ( not ( = ?auto_291565 ?auto_291574 ) ) ( not ( = ?auto_291566 ?auto_291567 ) ) ( not ( = ?auto_291566 ?auto_291568 ) ) ( not ( = ?auto_291566 ?auto_291569 ) ) ( not ( = ?auto_291566 ?auto_291570 ) ) ( not ( = ?auto_291566 ?auto_291571 ) ) ( not ( = ?auto_291566 ?auto_291572 ) ) ( not ( = ?auto_291566 ?auto_291573 ) ) ( not ( = ?auto_291566 ?auto_291574 ) ) ( not ( = ?auto_291567 ?auto_291568 ) ) ( not ( = ?auto_291567 ?auto_291569 ) ) ( not ( = ?auto_291567 ?auto_291570 ) ) ( not ( = ?auto_291567 ?auto_291571 ) ) ( not ( = ?auto_291567 ?auto_291572 ) ) ( not ( = ?auto_291567 ?auto_291573 ) ) ( not ( = ?auto_291567 ?auto_291574 ) ) ( not ( = ?auto_291568 ?auto_291569 ) ) ( not ( = ?auto_291568 ?auto_291570 ) ) ( not ( = ?auto_291568 ?auto_291571 ) ) ( not ( = ?auto_291568 ?auto_291572 ) ) ( not ( = ?auto_291568 ?auto_291573 ) ) ( not ( = ?auto_291568 ?auto_291574 ) ) ( not ( = ?auto_291569 ?auto_291570 ) ) ( not ( = ?auto_291569 ?auto_291571 ) ) ( not ( = ?auto_291569 ?auto_291572 ) ) ( not ( = ?auto_291569 ?auto_291573 ) ) ( not ( = ?auto_291569 ?auto_291574 ) ) ( not ( = ?auto_291570 ?auto_291571 ) ) ( not ( = ?auto_291570 ?auto_291572 ) ) ( not ( = ?auto_291570 ?auto_291573 ) ) ( not ( = ?auto_291570 ?auto_291574 ) ) ( not ( = ?auto_291571 ?auto_291572 ) ) ( not ( = ?auto_291571 ?auto_291573 ) ) ( not ( = ?auto_291571 ?auto_291574 ) ) ( not ( = ?auto_291572 ?auto_291573 ) ) ( not ( = ?auto_291572 ?auto_291574 ) ) ( not ( = ?auto_291573 ?auto_291574 ) ) ( ON ?auto_291573 ?auto_291574 ) ( ON ?auto_291572 ?auto_291573 ) ( ON ?auto_291571 ?auto_291572 ) ( ON ?auto_291570 ?auto_291571 ) ( CLEAR ?auto_291568 ) ( ON ?auto_291569 ?auto_291570 ) ( CLEAR ?auto_291569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_291561 ?auto_291562 ?auto_291563 ?auto_291564 ?auto_291565 ?auto_291566 ?auto_291567 ?auto_291568 ?auto_291569 )
      ( MAKE-14PILE ?auto_291561 ?auto_291562 ?auto_291563 ?auto_291564 ?auto_291565 ?auto_291566 ?auto_291567 ?auto_291568 ?auto_291569 ?auto_291570 ?auto_291571 ?auto_291572 ?auto_291573 ?auto_291574 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291589 - BLOCK
      ?auto_291590 - BLOCK
      ?auto_291591 - BLOCK
      ?auto_291592 - BLOCK
      ?auto_291593 - BLOCK
      ?auto_291594 - BLOCK
      ?auto_291595 - BLOCK
      ?auto_291596 - BLOCK
      ?auto_291597 - BLOCK
      ?auto_291598 - BLOCK
      ?auto_291599 - BLOCK
      ?auto_291600 - BLOCK
      ?auto_291601 - BLOCK
      ?auto_291602 - BLOCK
    )
    :vars
    (
      ?auto_291603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_291602 ?auto_291603 ) ( ON-TABLE ?auto_291589 ) ( ON ?auto_291590 ?auto_291589 ) ( ON ?auto_291591 ?auto_291590 ) ( ON ?auto_291592 ?auto_291591 ) ( ON ?auto_291593 ?auto_291592 ) ( ON ?auto_291594 ?auto_291593 ) ( ON ?auto_291595 ?auto_291594 ) ( not ( = ?auto_291589 ?auto_291590 ) ) ( not ( = ?auto_291589 ?auto_291591 ) ) ( not ( = ?auto_291589 ?auto_291592 ) ) ( not ( = ?auto_291589 ?auto_291593 ) ) ( not ( = ?auto_291589 ?auto_291594 ) ) ( not ( = ?auto_291589 ?auto_291595 ) ) ( not ( = ?auto_291589 ?auto_291596 ) ) ( not ( = ?auto_291589 ?auto_291597 ) ) ( not ( = ?auto_291589 ?auto_291598 ) ) ( not ( = ?auto_291589 ?auto_291599 ) ) ( not ( = ?auto_291589 ?auto_291600 ) ) ( not ( = ?auto_291589 ?auto_291601 ) ) ( not ( = ?auto_291589 ?auto_291602 ) ) ( not ( = ?auto_291589 ?auto_291603 ) ) ( not ( = ?auto_291590 ?auto_291591 ) ) ( not ( = ?auto_291590 ?auto_291592 ) ) ( not ( = ?auto_291590 ?auto_291593 ) ) ( not ( = ?auto_291590 ?auto_291594 ) ) ( not ( = ?auto_291590 ?auto_291595 ) ) ( not ( = ?auto_291590 ?auto_291596 ) ) ( not ( = ?auto_291590 ?auto_291597 ) ) ( not ( = ?auto_291590 ?auto_291598 ) ) ( not ( = ?auto_291590 ?auto_291599 ) ) ( not ( = ?auto_291590 ?auto_291600 ) ) ( not ( = ?auto_291590 ?auto_291601 ) ) ( not ( = ?auto_291590 ?auto_291602 ) ) ( not ( = ?auto_291590 ?auto_291603 ) ) ( not ( = ?auto_291591 ?auto_291592 ) ) ( not ( = ?auto_291591 ?auto_291593 ) ) ( not ( = ?auto_291591 ?auto_291594 ) ) ( not ( = ?auto_291591 ?auto_291595 ) ) ( not ( = ?auto_291591 ?auto_291596 ) ) ( not ( = ?auto_291591 ?auto_291597 ) ) ( not ( = ?auto_291591 ?auto_291598 ) ) ( not ( = ?auto_291591 ?auto_291599 ) ) ( not ( = ?auto_291591 ?auto_291600 ) ) ( not ( = ?auto_291591 ?auto_291601 ) ) ( not ( = ?auto_291591 ?auto_291602 ) ) ( not ( = ?auto_291591 ?auto_291603 ) ) ( not ( = ?auto_291592 ?auto_291593 ) ) ( not ( = ?auto_291592 ?auto_291594 ) ) ( not ( = ?auto_291592 ?auto_291595 ) ) ( not ( = ?auto_291592 ?auto_291596 ) ) ( not ( = ?auto_291592 ?auto_291597 ) ) ( not ( = ?auto_291592 ?auto_291598 ) ) ( not ( = ?auto_291592 ?auto_291599 ) ) ( not ( = ?auto_291592 ?auto_291600 ) ) ( not ( = ?auto_291592 ?auto_291601 ) ) ( not ( = ?auto_291592 ?auto_291602 ) ) ( not ( = ?auto_291592 ?auto_291603 ) ) ( not ( = ?auto_291593 ?auto_291594 ) ) ( not ( = ?auto_291593 ?auto_291595 ) ) ( not ( = ?auto_291593 ?auto_291596 ) ) ( not ( = ?auto_291593 ?auto_291597 ) ) ( not ( = ?auto_291593 ?auto_291598 ) ) ( not ( = ?auto_291593 ?auto_291599 ) ) ( not ( = ?auto_291593 ?auto_291600 ) ) ( not ( = ?auto_291593 ?auto_291601 ) ) ( not ( = ?auto_291593 ?auto_291602 ) ) ( not ( = ?auto_291593 ?auto_291603 ) ) ( not ( = ?auto_291594 ?auto_291595 ) ) ( not ( = ?auto_291594 ?auto_291596 ) ) ( not ( = ?auto_291594 ?auto_291597 ) ) ( not ( = ?auto_291594 ?auto_291598 ) ) ( not ( = ?auto_291594 ?auto_291599 ) ) ( not ( = ?auto_291594 ?auto_291600 ) ) ( not ( = ?auto_291594 ?auto_291601 ) ) ( not ( = ?auto_291594 ?auto_291602 ) ) ( not ( = ?auto_291594 ?auto_291603 ) ) ( not ( = ?auto_291595 ?auto_291596 ) ) ( not ( = ?auto_291595 ?auto_291597 ) ) ( not ( = ?auto_291595 ?auto_291598 ) ) ( not ( = ?auto_291595 ?auto_291599 ) ) ( not ( = ?auto_291595 ?auto_291600 ) ) ( not ( = ?auto_291595 ?auto_291601 ) ) ( not ( = ?auto_291595 ?auto_291602 ) ) ( not ( = ?auto_291595 ?auto_291603 ) ) ( not ( = ?auto_291596 ?auto_291597 ) ) ( not ( = ?auto_291596 ?auto_291598 ) ) ( not ( = ?auto_291596 ?auto_291599 ) ) ( not ( = ?auto_291596 ?auto_291600 ) ) ( not ( = ?auto_291596 ?auto_291601 ) ) ( not ( = ?auto_291596 ?auto_291602 ) ) ( not ( = ?auto_291596 ?auto_291603 ) ) ( not ( = ?auto_291597 ?auto_291598 ) ) ( not ( = ?auto_291597 ?auto_291599 ) ) ( not ( = ?auto_291597 ?auto_291600 ) ) ( not ( = ?auto_291597 ?auto_291601 ) ) ( not ( = ?auto_291597 ?auto_291602 ) ) ( not ( = ?auto_291597 ?auto_291603 ) ) ( not ( = ?auto_291598 ?auto_291599 ) ) ( not ( = ?auto_291598 ?auto_291600 ) ) ( not ( = ?auto_291598 ?auto_291601 ) ) ( not ( = ?auto_291598 ?auto_291602 ) ) ( not ( = ?auto_291598 ?auto_291603 ) ) ( not ( = ?auto_291599 ?auto_291600 ) ) ( not ( = ?auto_291599 ?auto_291601 ) ) ( not ( = ?auto_291599 ?auto_291602 ) ) ( not ( = ?auto_291599 ?auto_291603 ) ) ( not ( = ?auto_291600 ?auto_291601 ) ) ( not ( = ?auto_291600 ?auto_291602 ) ) ( not ( = ?auto_291600 ?auto_291603 ) ) ( not ( = ?auto_291601 ?auto_291602 ) ) ( not ( = ?auto_291601 ?auto_291603 ) ) ( not ( = ?auto_291602 ?auto_291603 ) ) ( ON ?auto_291601 ?auto_291602 ) ( ON ?auto_291600 ?auto_291601 ) ( ON ?auto_291599 ?auto_291600 ) ( ON ?auto_291598 ?auto_291599 ) ( ON ?auto_291597 ?auto_291598 ) ( CLEAR ?auto_291595 ) ( ON ?auto_291596 ?auto_291597 ) ( CLEAR ?auto_291596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_291589 ?auto_291590 ?auto_291591 ?auto_291592 ?auto_291593 ?auto_291594 ?auto_291595 ?auto_291596 )
      ( MAKE-14PILE ?auto_291589 ?auto_291590 ?auto_291591 ?auto_291592 ?auto_291593 ?auto_291594 ?auto_291595 ?auto_291596 ?auto_291597 ?auto_291598 ?auto_291599 ?auto_291600 ?auto_291601 ?auto_291602 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291618 - BLOCK
      ?auto_291619 - BLOCK
      ?auto_291620 - BLOCK
      ?auto_291621 - BLOCK
      ?auto_291622 - BLOCK
      ?auto_291623 - BLOCK
      ?auto_291624 - BLOCK
      ?auto_291625 - BLOCK
      ?auto_291626 - BLOCK
      ?auto_291627 - BLOCK
      ?auto_291628 - BLOCK
      ?auto_291629 - BLOCK
      ?auto_291630 - BLOCK
      ?auto_291631 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_291631 ) ( ON-TABLE ?auto_291618 ) ( ON ?auto_291619 ?auto_291618 ) ( ON ?auto_291620 ?auto_291619 ) ( ON ?auto_291621 ?auto_291620 ) ( ON ?auto_291622 ?auto_291621 ) ( ON ?auto_291623 ?auto_291622 ) ( ON ?auto_291624 ?auto_291623 ) ( not ( = ?auto_291618 ?auto_291619 ) ) ( not ( = ?auto_291618 ?auto_291620 ) ) ( not ( = ?auto_291618 ?auto_291621 ) ) ( not ( = ?auto_291618 ?auto_291622 ) ) ( not ( = ?auto_291618 ?auto_291623 ) ) ( not ( = ?auto_291618 ?auto_291624 ) ) ( not ( = ?auto_291618 ?auto_291625 ) ) ( not ( = ?auto_291618 ?auto_291626 ) ) ( not ( = ?auto_291618 ?auto_291627 ) ) ( not ( = ?auto_291618 ?auto_291628 ) ) ( not ( = ?auto_291618 ?auto_291629 ) ) ( not ( = ?auto_291618 ?auto_291630 ) ) ( not ( = ?auto_291618 ?auto_291631 ) ) ( not ( = ?auto_291619 ?auto_291620 ) ) ( not ( = ?auto_291619 ?auto_291621 ) ) ( not ( = ?auto_291619 ?auto_291622 ) ) ( not ( = ?auto_291619 ?auto_291623 ) ) ( not ( = ?auto_291619 ?auto_291624 ) ) ( not ( = ?auto_291619 ?auto_291625 ) ) ( not ( = ?auto_291619 ?auto_291626 ) ) ( not ( = ?auto_291619 ?auto_291627 ) ) ( not ( = ?auto_291619 ?auto_291628 ) ) ( not ( = ?auto_291619 ?auto_291629 ) ) ( not ( = ?auto_291619 ?auto_291630 ) ) ( not ( = ?auto_291619 ?auto_291631 ) ) ( not ( = ?auto_291620 ?auto_291621 ) ) ( not ( = ?auto_291620 ?auto_291622 ) ) ( not ( = ?auto_291620 ?auto_291623 ) ) ( not ( = ?auto_291620 ?auto_291624 ) ) ( not ( = ?auto_291620 ?auto_291625 ) ) ( not ( = ?auto_291620 ?auto_291626 ) ) ( not ( = ?auto_291620 ?auto_291627 ) ) ( not ( = ?auto_291620 ?auto_291628 ) ) ( not ( = ?auto_291620 ?auto_291629 ) ) ( not ( = ?auto_291620 ?auto_291630 ) ) ( not ( = ?auto_291620 ?auto_291631 ) ) ( not ( = ?auto_291621 ?auto_291622 ) ) ( not ( = ?auto_291621 ?auto_291623 ) ) ( not ( = ?auto_291621 ?auto_291624 ) ) ( not ( = ?auto_291621 ?auto_291625 ) ) ( not ( = ?auto_291621 ?auto_291626 ) ) ( not ( = ?auto_291621 ?auto_291627 ) ) ( not ( = ?auto_291621 ?auto_291628 ) ) ( not ( = ?auto_291621 ?auto_291629 ) ) ( not ( = ?auto_291621 ?auto_291630 ) ) ( not ( = ?auto_291621 ?auto_291631 ) ) ( not ( = ?auto_291622 ?auto_291623 ) ) ( not ( = ?auto_291622 ?auto_291624 ) ) ( not ( = ?auto_291622 ?auto_291625 ) ) ( not ( = ?auto_291622 ?auto_291626 ) ) ( not ( = ?auto_291622 ?auto_291627 ) ) ( not ( = ?auto_291622 ?auto_291628 ) ) ( not ( = ?auto_291622 ?auto_291629 ) ) ( not ( = ?auto_291622 ?auto_291630 ) ) ( not ( = ?auto_291622 ?auto_291631 ) ) ( not ( = ?auto_291623 ?auto_291624 ) ) ( not ( = ?auto_291623 ?auto_291625 ) ) ( not ( = ?auto_291623 ?auto_291626 ) ) ( not ( = ?auto_291623 ?auto_291627 ) ) ( not ( = ?auto_291623 ?auto_291628 ) ) ( not ( = ?auto_291623 ?auto_291629 ) ) ( not ( = ?auto_291623 ?auto_291630 ) ) ( not ( = ?auto_291623 ?auto_291631 ) ) ( not ( = ?auto_291624 ?auto_291625 ) ) ( not ( = ?auto_291624 ?auto_291626 ) ) ( not ( = ?auto_291624 ?auto_291627 ) ) ( not ( = ?auto_291624 ?auto_291628 ) ) ( not ( = ?auto_291624 ?auto_291629 ) ) ( not ( = ?auto_291624 ?auto_291630 ) ) ( not ( = ?auto_291624 ?auto_291631 ) ) ( not ( = ?auto_291625 ?auto_291626 ) ) ( not ( = ?auto_291625 ?auto_291627 ) ) ( not ( = ?auto_291625 ?auto_291628 ) ) ( not ( = ?auto_291625 ?auto_291629 ) ) ( not ( = ?auto_291625 ?auto_291630 ) ) ( not ( = ?auto_291625 ?auto_291631 ) ) ( not ( = ?auto_291626 ?auto_291627 ) ) ( not ( = ?auto_291626 ?auto_291628 ) ) ( not ( = ?auto_291626 ?auto_291629 ) ) ( not ( = ?auto_291626 ?auto_291630 ) ) ( not ( = ?auto_291626 ?auto_291631 ) ) ( not ( = ?auto_291627 ?auto_291628 ) ) ( not ( = ?auto_291627 ?auto_291629 ) ) ( not ( = ?auto_291627 ?auto_291630 ) ) ( not ( = ?auto_291627 ?auto_291631 ) ) ( not ( = ?auto_291628 ?auto_291629 ) ) ( not ( = ?auto_291628 ?auto_291630 ) ) ( not ( = ?auto_291628 ?auto_291631 ) ) ( not ( = ?auto_291629 ?auto_291630 ) ) ( not ( = ?auto_291629 ?auto_291631 ) ) ( not ( = ?auto_291630 ?auto_291631 ) ) ( ON ?auto_291630 ?auto_291631 ) ( ON ?auto_291629 ?auto_291630 ) ( ON ?auto_291628 ?auto_291629 ) ( ON ?auto_291627 ?auto_291628 ) ( ON ?auto_291626 ?auto_291627 ) ( CLEAR ?auto_291624 ) ( ON ?auto_291625 ?auto_291626 ) ( CLEAR ?auto_291625 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_291618 ?auto_291619 ?auto_291620 ?auto_291621 ?auto_291622 ?auto_291623 ?auto_291624 ?auto_291625 )
      ( MAKE-14PILE ?auto_291618 ?auto_291619 ?auto_291620 ?auto_291621 ?auto_291622 ?auto_291623 ?auto_291624 ?auto_291625 ?auto_291626 ?auto_291627 ?auto_291628 ?auto_291629 ?auto_291630 ?auto_291631 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291646 - BLOCK
      ?auto_291647 - BLOCK
      ?auto_291648 - BLOCK
      ?auto_291649 - BLOCK
      ?auto_291650 - BLOCK
      ?auto_291651 - BLOCK
      ?auto_291652 - BLOCK
      ?auto_291653 - BLOCK
      ?auto_291654 - BLOCK
      ?auto_291655 - BLOCK
      ?auto_291656 - BLOCK
      ?auto_291657 - BLOCK
      ?auto_291658 - BLOCK
      ?auto_291659 - BLOCK
    )
    :vars
    (
      ?auto_291660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_291659 ?auto_291660 ) ( ON-TABLE ?auto_291646 ) ( ON ?auto_291647 ?auto_291646 ) ( ON ?auto_291648 ?auto_291647 ) ( ON ?auto_291649 ?auto_291648 ) ( ON ?auto_291650 ?auto_291649 ) ( ON ?auto_291651 ?auto_291650 ) ( not ( = ?auto_291646 ?auto_291647 ) ) ( not ( = ?auto_291646 ?auto_291648 ) ) ( not ( = ?auto_291646 ?auto_291649 ) ) ( not ( = ?auto_291646 ?auto_291650 ) ) ( not ( = ?auto_291646 ?auto_291651 ) ) ( not ( = ?auto_291646 ?auto_291652 ) ) ( not ( = ?auto_291646 ?auto_291653 ) ) ( not ( = ?auto_291646 ?auto_291654 ) ) ( not ( = ?auto_291646 ?auto_291655 ) ) ( not ( = ?auto_291646 ?auto_291656 ) ) ( not ( = ?auto_291646 ?auto_291657 ) ) ( not ( = ?auto_291646 ?auto_291658 ) ) ( not ( = ?auto_291646 ?auto_291659 ) ) ( not ( = ?auto_291646 ?auto_291660 ) ) ( not ( = ?auto_291647 ?auto_291648 ) ) ( not ( = ?auto_291647 ?auto_291649 ) ) ( not ( = ?auto_291647 ?auto_291650 ) ) ( not ( = ?auto_291647 ?auto_291651 ) ) ( not ( = ?auto_291647 ?auto_291652 ) ) ( not ( = ?auto_291647 ?auto_291653 ) ) ( not ( = ?auto_291647 ?auto_291654 ) ) ( not ( = ?auto_291647 ?auto_291655 ) ) ( not ( = ?auto_291647 ?auto_291656 ) ) ( not ( = ?auto_291647 ?auto_291657 ) ) ( not ( = ?auto_291647 ?auto_291658 ) ) ( not ( = ?auto_291647 ?auto_291659 ) ) ( not ( = ?auto_291647 ?auto_291660 ) ) ( not ( = ?auto_291648 ?auto_291649 ) ) ( not ( = ?auto_291648 ?auto_291650 ) ) ( not ( = ?auto_291648 ?auto_291651 ) ) ( not ( = ?auto_291648 ?auto_291652 ) ) ( not ( = ?auto_291648 ?auto_291653 ) ) ( not ( = ?auto_291648 ?auto_291654 ) ) ( not ( = ?auto_291648 ?auto_291655 ) ) ( not ( = ?auto_291648 ?auto_291656 ) ) ( not ( = ?auto_291648 ?auto_291657 ) ) ( not ( = ?auto_291648 ?auto_291658 ) ) ( not ( = ?auto_291648 ?auto_291659 ) ) ( not ( = ?auto_291648 ?auto_291660 ) ) ( not ( = ?auto_291649 ?auto_291650 ) ) ( not ( = ?auto_291649 ?auto_291651 ) ) ( not ( = ?auto_291649 ?auto_291652 ) ) ( not ( = ?auto_291649 ?auto_291653 ) ) ( not ( = ?auto_291649 ?auto_291654 ) ) ( not ( = ?auto_291649 ?auto_291655 ) ) ( not ( = ?auto_291649 ?auto_291656 ) ) ( not ( = ?auto_291649 ?auto_291657 ) ) ( not ( = ?auto_291649 ?auto_291658 ) ) ( not ( = ?auto_291649 ?auto_291659 ) ) ( not ( = ?auto_291649 ?auto_291660 ) ) ( not ( = ?auto_291650 ?auto_291651 ) ) ( not ( = ?auto_291650 ?auto_291652 ) ) ( not ( = ?auto_291650 ?auto_291653 ) ) ( not ( = ?auto_291650 ?auto_291654 ) ) ( not ( = ?auto_291650 ?auto_291655 ) ) ( not ( = ?auto_291650 ?auto_291656 ) ) ( not ( = ?auto_291650 ?auto_291657 ) ) ( not ( = ?auto_291650 ?auto_291658 ) ) ( not ( = ?auto_291650 ?auto_291659 ) ) ( not ( = ?auto_291650 ?auto_291660 ) ) ( not ( = ?auto_291651 ?auto_291652 ) ) ( not ( = ?auto_291651 ?auto_291653 ) ) ( not ( = ?auto_291651 ?auto_291654 ) ) ( not ( = ?auto_291651 ?auto_291655 ) ) ( not ( = ?auto_291651 ?auto_291656 ) ) ( not ( = ?auto_291651 ?auto_291657 ) ) ( not ( = ?auto_291651 ?auto_291658 ) ) ( not ( = ?auto_291651 ?auto_291659 ) ) ( not ( = ?auto_291651 ?auto_291660 ) ) ( not ( = ?auto_291652 ?auto_291653 ) ) ( not ( = ?auto_291652 ?auto_291654 ) ) ( not ( = ?auto_291652 ?auto_291655 ) ) ( not ( = ?auto_291652 ?auto_291656 ) ) ( not ( = ?auto_291652 ?auto_291657 ) ) ( not ( = ?auto_291652 ?auto_291658 ) ) ( not ( = ?auto_291652 ?auto_291659 ) ) ( not ( = ?auto_291652 ?auto_291660 ) ) ( not ( = ?auto_291653 ?auto_291654 ) ) ( not ( = ?auto_291653 ?auto_291655 ) ) ( not ( = ?auto_291653 ?auto_291656 ) ) ( not ( = ?auto_291653 ?auto_291657 ) ) ( not ( = ?auto_291653 ?auto_291658 ) ) ( not ( = ?auto_291653 ?auto_291659 ) ) ( not ( = ?auto_291653 ?auto_291660 ) ) ( not ( = ?auto_291654 ?auto_291655 ) ) ( not ( = ?auto_291654 ?auto_291656 ) ) ( not ( = ?auto_291654 ?auto_291657 ) ) ( not ( = ?auto_291654 ?auto_291658 ) ) ( not ( = ?auto_291654 ?auto_291659 ) ) ( not ( = ?auto_291654 ?auto_291660 ) ) ( not ( = ?auto_291655 ?auto_291656 ) ) ( not ( = ?auto_291655 ?auto_291657 ) ) ( not ( = ?auto_291655 ?auto_291658 ) ) ( not ( = ?auto_291655 ?auto_291659 ) ) ( not ( = ?auto_291655 ?auto_291660 ) ) ( not ( = ?auto_291656 ?auto_291657 ) ) ( not ( = ?auto_291656 ?auto_291658 ) ) ( not ( = ?auto_291656 ?auto_291659 ) ) ( not ( = ?auto_291656 ?auto_291660 ) ) ( not ( = ?auto_291657 ?auto_291658 ) ) ( not ( = ?auto_291657 ?auto_291659 ) ) ( not ( = ?auto_291657 ?auto_291660 ) ) ( not ( = ?auto_291658 ?auto_291659 ) ) ( not ( = ?auto_291658 ?auto_291660 ) ) ( not ( = ?auto_291659 ?auto_291660 ) ) ( ON ?auto_291658 ?auto_291659 ) ( ON ?auto_291657 ?auto_291658 ) ( ON ?auto_291656 ?auto_291657 ) ( ON ?auto_291655 ?auto_291656 ) ( ON ?auto_291654 ?auto_291655 ) ( ON ?auto_291653 ?auto_291654 ) ( CLEAR ?auto_291651 ) ( ON ?auto_291652 ?auto_291653 ) ( CLEAR ?auto_291652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_291646 ?auto_291647 ?auto_291648 ?auto_291649 ?auto_291650 ?auto_291651 ?auto_291652 )
      ( MAKE-14PILE ?auto_291646 ?auto_291647 ?auto_291648 ?auto_291649 ?auto_291650 ?auto_291651 ?auto_291652 ?auto_291653 ?auto_291654 ?auto_291655 ?auto_291656 ?auto_291657 ?auto_291658 ?auto_291659 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291675 - BLOCK
      ?auto_291676 - BLOCK
      ?auto_291677 - BLOCK
      ?auto_291678 - BLOCK
      ?auto_291679 - BLOCK
      ?auto_291680 - BLOCK
      ?auto_291681 - BLOCK
      ?auto_291682 - BLOCK
      ?auto_291683 - BLOCK
      ?auto_291684 - BLOCK
      ?auto_291685 - BLOCK
      ?auto_291686 - BLOCK
      ?auto_291687 - BLOCK
      ?auto_291688 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_291688 ) ( ON-TABLE ?auto_291675 ) ( ON ?auto_291676 ?auto_291675 ) ( ON ?auto_291677 ?auto_291676 ) ( ON ?auto_291678 ?auto_291677 ) ( ON ?auto_291679 ?auto_291678 ) ( ON ?auto_291680 ?auto_291679 ) ( not ( = ?auto_291675 ?auto_291676 ) ) ( not ( = ?auto_291675 ?auto_291677 ) ) ( not ( = ?auto_291675 ?auto_291678 ) ) ( not ( = ?auto_291675 ?auto_291679 ) ) ( not ( = ?auto_291675 ?auto_291680 ) ) ( not ( = ?auto_291675 ?auto_291681 ) ) ( not ( = ?auto_291675 ?auto_291682 ) ) ( not ( = ?auto_291675 ?auto_291683 ) ) ( not ( = ?auto_291675 ?auto_291684 ) ) ( not ( = ?auto_291675 ?auto_291685 ) ) ( not ( = ?auto_291675 ?auto_291686 ) ) ( not ( = ?auto_291675 ?auto_291687 ) ) ( not ( = ?auto_291675 ?auto_291688 ) ) ( not ( = ?auto_291676 ?auto_291677 ) ) ( not ( = ?auto_291676 ?auto_291678 ) ) ( not ( = ?auto_291676 ?auto_291679 ) ) ( not ( = ?auto_291676 ?auto_291680 ) ) ( not ( = ?auto_291676 ?auto_291681 ) ) ( not ( = ?auto_291676 ?auto_291682 ) ) ( not ( = ?auto_291676 ?auto_291683 ) ) ( not ( = ?auto_291676 ?auto_291684 ) ) ( not ( = ?auto_291676 ?auto_291685 ) ) ( not ( = ?auto_291676 ?auto_291686 ) ) ( not ( = ?auto_291676 ?auto_291687 ) ) ( not ( = ?auto_291676 ?auto_291688 ) ) ( not ( = ?auto_291677 ?auto_291678 ) ) ( not ( = ?auto_291677 ?auto_291679 ) ) ( not ( = ?auto_291677 ?auto_291680 ) ) ( not ( = ?auto_291677 ?auto_291681 ) ) ( not ( = ?auto_291677 ?auto_291682 ) ) ( not ( = ?auto_291677 ?auto_291683 ) ) ( not ( = ?auto_291677 ?auto_291684 ) ) ( not ( = ?auto_291677 ?auto_291685 ) ) ( not ( = ?auto_291677 ?auto_291686 ) ) ( not ( = ?auto_291677 ?auto_291687 ) ) ( not ( = ?auto_291677 ?auto_291688 ) ) ( not ( = ?auto_291678 ?auto_291679 ) ) ( not ( = ?auto_291678 ?auto_291680 ) ) ( not ( = ?auto_291678 ?auto_291681 ) ) ( not ( = ?auto_291678 ?auto_291682 ) ) ( not ( = ?auto_291678 ?auto_291683 ) ) ( not ( = ?auto_291678 ?auto_291684 ) ) ( not ( = ?auto_291678 ?auto_291685 ) ) ( not ( = ?auto_291678 ?auto_291686 ) ) ( not ( = ?auto_291678 ?auto_291687 ) ) ( not ( = ?auto_291678 ?auto_291688 ) ) ( not ( = ?auto_291679 ?auto_291680 ) ) ( not ( = ?auto_291679 ?auto_291681 ) ) ( not ( = ?auto_291679 ?auto_291682 ) ) ( not ( = ?auto_291679 ?auto_291683 ) ) ( not ( = ?auto_291679 ?auto_291684 ) ) ( not ( = ?auto_291679 ?auto_291685 ) ) ( not ( = ?auto_291679 ?auto_291686 ) ) ( not ( = ?auto_291679 ?auto_291687 ) ) ( not ( = ?auto_291679 ?auto_291688 ) ) ( not ( = ?auto_291680 ?auto_291681 ) ) ( not ( = ?auto_291680 ?auto_291682 ) ) ( not ( = ?auto_291680 ?auto_291683 ) ) ( not ( = ?auto_291680 ?auto_291684 ) ) ( not ( = ?auto_291680 ?auto_291685 ) ) ( not ( = ?auto_291680 ?auto_291686 ) ) ( not ( = ?auto_291680 ?auto_291687 ) ) ( not ( = ?auto_291680 ?auto_291688 ) ) ( not ( = ?auto_291681 ?auto_291682 ) ) ( not ( = ?auto_291681 ?auto_291683 ) ) ( not ( = ?auto_291681 ?auto_291684 ) ) ( not ( = ?auto_291681 ?auto_291685 ) ) ( not ( = ?auto_291681 ?auto_291686 ) ) ( not ( = ?auto_291681 ?auto_291687 ) ) ( not ( = ?auto_291681 ?auto_291688 ) ) ( not ( = ?auto_291682 ?auto_291683 ) ) ( not ( = ?auto_291682 ?auto_291684 ) ) ( not ( = ?auto_291682 ?auto_291685 ) ) ( not ( = ?auto_291682 ?auto_291686 ) ) ( not ( = ?auto_291682 ?auto_291687 ) ) ( not ( = ?auto_291682 ?auto_291688 ) ) ( not ( = ?auto_291683 ?auto_291684 ) ) ( not ( = ?auto_291683 ?auto_291685 ) ) ( not ( = ?auto_291683 ?auto_291686 ) ) ( not ( = ?auto_291683 ?auto_291687 ) ) ( not ( = ?auto_291683 ?auto_291688 ) ) ( not ( = ?auto_291684 ?auto_291685 ) ) ( not ( = ?auto_291684 ?auto_291686 ) ) ( not ( = ?auto_291684 ?auto_291687 ) ) ( not ( = ?auto_291684 ?auto_291688 ) ) ( not ( = ?auto_291685 ?auto_291686 ) ) ( not ( = ?auto_291685 ?auto_291687 ) ) ( not ( = ?auto_291685 ?auto_291688 ) ) ( not ( = ?auto_291686 ?auto_291687 ) ) ( not ( = ?auto_291686 ?auto_291688 ) ) ( not ( = ?auto_291687 ?auto_291688 ) ) ( ON ?auto_291687 ?auto_291688 ) ( ON ?auto_291686 ?auto_291687 ) ( ON ?auto_291685 ?auto_291686 ) ( ON ?auto_291684 ?auto_291685 ) ( ON ?auto_291683 ?auto_291684 ) ( ON ?auto_291682 ?auto_291683 ) ( CLEAR ?auto_291680 ) ( ON ?auto_291681 ?auto_291682 ) ( CLEAR ?auto_291681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_291675 ?auto_291676 ?auto_291677 ?auto_291678 ?auto_291679 ?auto_291680 ?auto_291681 )
      ( MAKE-14PILE ?auto_291675 ?auto_291676 ?auto_291677 ?auto_291678 ?auto_291679 ?auto_291680 ?auto_291681 ?auto_291682 ?auto_291683 ?auto_291684 ?auto_291685 ?auto_291686 ?auto_291687 ?auto_291688 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291703 - BLOCK
      ?auto_291704 - BLOCK
      ?auto_291705 - BLOCK
      ?auto_291706 - BLOCK
      ?auto_291707 - BLOCK
      ?auto_291708 - BLOCK
      ?auto_291709 - BLOCK
      ?auto_291710 - BLOCK
      ?auto_291711 - BLOCK
      ?auto_291712 - BLOCK
      ?auto_291713 - BLOCK
      ?auto_291714 - BLOCK
      ?auto_291715 - BLOCK
      ?auto_291716 - BLOCK
    )
    :vars
    (
      ?auto_291717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_291716 ?auto_291717 ) ( ON-TABLE ?auto_291703 ) ( ON ?auto_291704 ?auto_291703 ) ( ON ?auto_291705 ?auto_291704 ) ( ON ?auto_291706 ?auto_291705 ) ( ON ?auto_291707 ?auto_291706 ) ( not ( = ?auto_291703 ?auto_291704 ) ) ( not ( = ?auto_291703 ?auto_291705 ) ) ( not ( = ?auto_291703 ?auto_291706 ) ) ( not ( = ?auto_291703 ?auto_291707 ) ) ( not ( = ?auto_291703 ?auto_291708 ) ) ( not ( = ?auto_291703 ?auto_291709 ) ) ( not ( = ?auto_291703 ?auto_291710 ) ) ( not ( = ?auto_291703 ?auto_291711 ) ) ( not ( = ?auto_291703 ?auto_291712 ) ) ( not ( = ?auto_291703 ?auto_291713 ) ) ( not ( = ?auto_291703 ?auto_291714 ) ) ( not ( = ?auto_291703 ?auto_291715 ) ) ( not ( = ?auto_291703 ?auto_291716 ) ) ( not ( = ?auto_291703 ?auto_291717 ) ) ( not ( = ?auto_291704 ?auto_291705 ) ) ( not ( = ?auto_291704 ?auto_291706 ) ) ( not ( = ?auto_291704 ?auto_291707 ) ) ( not ( = ?auto_291704 ?auto_291708 ) ) ( not ( = ?auto_291704 ?auto_291709 ) ) ( not ( = ?auto_291704 ?auto_291710 ) ) ( not ( = ?auto_291704 ?auto_291711 ) ) ( not ( = ?auto_291704 ?auto_291712 ) ) ( not ( = ?auto_291704 ?auto_291713 ) ) ( not ( = ?auto_291704 ?auto_291714 ) ) ( not ( = ?auto_291704 ?auto_291715 ) ) ( not ( = ?auto_291704 ?auto_291716 ) ) ( not ( = ?auto_291704 ?auto_291717 ) ) ( not ( = ?auto_291705 ?auto_291706 ) ) ( not ( = ?auto_291705 ?auto_291707 ) ) ( not ( = ?auto_291705 ?auto_291708 ) ) ( not ( = ?auto_291705 ?auto_291709 ) ) ( not ( = ?auto_291705 ?auto_291710 ) ) ( not ( = ?auto_291705 ?auto_291711 ) ) ( not ( = ?auto_291705 ?auto_291712 ) ) ( not ( = ?auto_291705 ?auto_291713 ) ) ( not ( = ?auto_291705 ?auto_291714 ) ) ( not ( = ?auto_291705 ?auto_291715 ) ) ( not ( = ?auto_291705 ?auto_291716 ) ) ( not ( = ?auto_291705 ?auto_291717 ) ) ( not ( = ?auto_291706 ?auto_291707 ) ) ( not ( = ?auto_291706 ?auto_291708 ) ) ( not ( = ?auto_291706 ?auto_291709 ) ) ( not ( = ?auto_291706 ?auto_291710 ) ) ( not ( = ?auto_291706 ?auto_291711 ) ) ( not ( = ?auto_291706 ?auto_291712 ) ) ( not ( = ?auto_291706 ?auto_291713 ) ) ( not ( = ?auto_291706 ?auto_291714 ) ) ( not ( = ?auto_291706 ?auto_291715 ) ) ( not ( = ?auto_291706 ?auto_291716 ) ) ( not ( = ?auto_291706 ?auto_291717 ) ) ( not ( = ?auto_291707 ?auto_291708 ) ) ( not ( = ?auto_291707 ?auto_291709 ) ) ( not ( = ?auto_291707 ?auto_291710 ) ) ( not ( = ?auto_291707 ?auto_291711 ) ) ( not ( = ?auto_291707 ?auto_291712 ) ) ( not ( = ?auto_291707 ?auto_291713 ) ) ( not ( = ?auto_291707 ?auto_291714 ) ) ( not ( = ?auto_291707 ?auto_291715 ) ) ( not ( = ?auto_291707 ?auto_291716 ) ) ( not ( = ?auto_291707 ?auto_291717 ) ) ( not ( = ?auto_291708 ?auto_291709 ) ) ( not ( = ?auto_291708 ?auto_291710 ) ) ( not ( = ?auto_291708 ?auto_291711 ) ) ( not ( = ?auto_291708 ?auto_291712 ) ) ( not ( = ?auto_291708 ?auto_291713 ) ) ( not ( = ?auto_291708 ?auto_291714 ) ) ( not ( = ?auto_291708 ?auto_291715 ) ) ( not ( = ?auto_291708 ?auto_291716 ) ) ( not ( = ?auto_291708 ?auto_291717 ) ) ( not ( = ?auto_291709 ?auto_291710 ) ) ( not ( = ?auto_291709 ?auto_291711 ) ) ( not ( = ?auto_291709 ?auto_291712 ) ) ( not ( = ?auto_291709 ?auto_291713 ) ) ( not ( = ?auto_291709 ?auto_291714 ) ) ( not ( = ?auto_291709 ?auto_291715 ) ) ( not ( = ?auto_291709 ?auto_291716 ) ) ( not ( = ?auto_291709 ?auto_291717 ) ) ( not ( = ?auto_291710 ?auto_291711 ) ) ( not ( = ?auto_291710 ?auto_291712 ) ) ( not ( = ?auto_291710 ?auto_291713 ) ) ( not ( = ?auto_291710 ?auto_291714 ) ) ( not ( = ?auto_291710 ?auto_291715 ) ) ( not ( = ?auto_291710 ?auto_291716 ) ) ( not ( = ?auto_291710 ?auto_291717 ) ) ( not ( = ?auto_291711 ?auto_291712 ) ) ( not ( = ?auto_291711 ?auto_291713 ) ) ( not ( = ?auto_291711 ?auto_291714 ) ) ( not ( = ?auto_291711 ?auto_291715 ) ) ( not ( = ?auto_291711 ?auto_291716 ) ) ( not ( = ?auto_291711 ?auto_291717 ) ) ( not ( = ?auto_291712 ?auto_291713 ) ) ( not ( = ?auto_291712 ?auto_291714 ) ) ( not ( = ?auto_291712 ?auto_291715 ) ) ( not ( = ?auto_291712 ?auto_291716 ) ) ( not ( = ?auto_291712 ?auto_291717 ) ) ( not ( = ?auto_291713 ?auto_291714 ) ) ( not ( = ?auto_291713 ?auto_291715 ) ) ( not ( = ?auto_291713 ?auto_291716 ) ) ( not ( = ?auto_291713 ?auto_291717 ) ) ( not ( = ?auto_291714 ?auto_291715 ) ) ( not ( = ?auto_291714 ?auto_291716 ) ) ( not ( = ?auto_291714 ?auto_291717 ) ) ( not ( = ?auto_291715 ?auto_291716 ) ) ( not ( = ?auto_291715 ?auto_291717 ) ) ( not ( = ?auto_291716 ?auto_291717 ) ) ( ON ?auto_291715 ?auto_291716 ) ( ON ?auto_291714 ?auto_291715 ) ( ON ?auto_291713 ?auto_291714 ) ( ON ?auto_291712 ?auto_291713 ) ( ON ?auto_291711 ?auto_291712 ) ( ON ?auto_291710 ?auto_291711 ) ( ON ?auto_291709 ?auto_291710 ) ( CLEAR ?auto_291707 ) ( ON ?auto_291708 ?auto_291709 ) ( CLEAR ?auto_291708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_291703 ?auto_291704 ?auto_291705 ?auto_291706 ?auto_291707 ?auto_291708 )
      ( MAKE-14PILE ?auto_291703 ?auto_291704 ?auto_291705 ?auto_291706 ?auto_291707 ?auto_291708 ?auto_291709 ?auto_291710 ?auto_291711 ?auto_291712 ?auto_291713 ?auto_291714 ?auto_291715 ?auto_291716 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291732 - BLOCK
      ?auto_291733 - BLOCK
      ?auto_291734 - BLOCK
      ?auto_291735 - BLOCK
      ?auto_291736 - BLOCK
      ?auto_291737 - BLOCK
      ?auto_291738 - BLOCK
      ?auto_291739 - BLOCK
      ?auto_291740 - BLOCK
      ?auto_291741 - BLOCK
      ?auto_291742 - BLOCK
      ?auto_291743 - BLOCK
      ?auto_291744 - BLOCK
      ?auto_291745 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_291745 ) ( ON-TABLE ?auto_291732 ) ( ON ?auto_291733 ?auto_291732 ) ( ON ?auto_291734 ?auto_291733 ) ( ON ?auto_291735 ?auto_291734 ) ( ON ?auto_291736 ?auto_291735 ) ( not ( = ?auto_291732 ?auto_291733 ) ) ( not ( = ?auto_291732 ?auto_291734 ) ) ( not ( = ?auto_291732 ?auto_291735 ) ) ( not ( = ?auto_291732 ?auto_291736 ) ) ( not ( = ?auto_291732 ?auto_291737 ) ) ( not ( = ?auto_291732 ?auto_291738 ) ) ( not ( = ?auto_291732 ?auto_291739 ) ) ( not ( = ?auto_291732 ?auto_291740 ) ) ( not ( = ?auto_291732 ?auto_291741 ) ) ( not ( = ?auto_291732 ?auto_291742 ) ) ( not ( = ?auto_291732 ?auto_291743 ) ) ( not ( = ?auto_291732 ?auto_291744 ) ) ( not ( = ?auto_291732 ?auto_291745 ) ) ( not ( = ?auto_291733 ?auto_291734 ) ) ( not ( = ?auto_291733 ?auto_291735 ) ) ( not ( = ?auto_291733 ?auto_291736 ) ) ( not ( = ?auto_291733 ?auto_291737 ) ) ( not ( = ?auto_291733 ?auto_291738 ) ) ( not ( = ?auto_291733 ?auto_291739 ) ) ( not ( = ?auto_291733 ?auto_291740 ) ) ( not ( = ?auto_291733 ?auto_291741 ) ) ( not ( = ?auto_291733 ?auto_291742 ) ) ( not ( = ?auto_291733 ?auto_291743 ) ) ( not ( = ?auto_291733 ?auto_291744 ) ) ( not ( = ?auto_291733 ?auto_291745 ) ) ( not ( = ?auto_291734 ?auto_291735 ) ) ( not ( = ?auto_291734 ?auto_291736 ) ) ( not ( = ?auto_291734 ?auto_291737 ) ) ( not ( = ?auto_291734 ?auto_291738 ) ) ( not ( = ?auto_291734 ?auto_291739 ) ) ( not ( = ?auto_291734 ?auto_291740 ) ) ( not ( = ?auto_291734 ?auto_291741 ) ) ( not ( = ?auto_291734 ?auto_291742 ) ) ( not ( = ?auto_291734 ?auto_291743 ) ) ( not ( = ?auto_291734 ?auto_291744 ) ) ( not ( = ?auto_291734 ?auto_291745 ) ) ( not ( = ?auto_291735 ?auto_291736 ) ) ( not ( = ?auto_291735 ?auto_291737 ) ) ( not ( = ?auto_291735 ?auto_291738 ) ) ( not ( = ?auto_291735 ?auto_291739 ) ) ( not ( = ?auto_291735 ?auto_291740 ) ) ( not ( = ?auto_291735 ?auto_291741 ) ) ( not ( = ?auto_291735 ?auto_291742 ) ) ( not ( = ?auto_291735 ?auto_291743 ) ) ( not ( = ?auto_291735 ?auto_291744 ) ) ( not ( = ?auto_291735 ?auto_291745 ) ) ( not ( = ?auto_291736 ?auto_291737 ) ) ( not ( = ?auto_291736 ?auto_291738 ) ) ( not ( = ?auto_291736 ?auto_291739 ) ) ( not ( = ?auto_291736 ?auto_291740 ) ) ( not ( = ?auto_291736 ?auto_291741 ) ) ( not ( = ?auto_291736 ?auto_291742 ) ) ( not ( = ?auto_291736 ?auto_291743 ) ) ( not ( = ?auto_291736 ?auto_291744 ) ) ( not ( = ?auto_291736 ?auto_291745 ) ) ( not ( = ?auto_291737 ?auto_291738 ) ) ( not ( = ?auto_291737 ?auto_291739 ) ) ( not ( = ?auto_291737 ?auto_291740 ) ) ( not ( = ?auto_291737 ?auto_291741 ) ) ( not ( = ?auto_291737 ?auto_291742 ) ) ( not ( = ?auto_291737 ?auto_291743 ) ) ( not ( = ?auto_291737 ?auto_291744 ) ) ( not ( = ?auto_291737 ?auto_291745 ) ) ( not ( = ?auto_291738 ?auto_291739 ) ) ( not ( = ?auto_291738 ?auto_291740 ) ) ( not ( = ?auto_291738 ?auto_291741 ) ) ( not ( = ?auto_291738 ?auto_291742 ) ) ( not ( = ?auto_291738 ?auto_291743 ) ) ( not ( = ?auto_291738 ?auto_291744 ) ) ( not ( = ?auto_291738 ?auto_291745 ) ) ( not ( = ?auto_291739 ?auto_291740 ) ) ( not ( = ?auto_291739 ?auto_291741 ) ) ( not ( = ?auto_291739 ?auto_291742 ) ) ( not ( = ?auto_291739 ?auto_291743 ) ) ( not ( = ?auto_291739 ?auto_291744 ) ) ( not ( = ?auto_291739 ?auto_291745 ) ) ( not ( = ?auto_291740 ?auto_291741 ) ) ( not ( = ?auto_291740 ?auto_291742 ) ) ( not ( = ?auto_291740 ?auto_291743 ) ) ( not ( = ?auto_291740 ?auto_291744 ) ) ( not ( = ?auto_291740 ?auto_291745 ) ) ( not ( = ?auto_291741 ?auto_291742 ) ) ( not ( = ?auto_291741 ?auto_291743 ) ) ( not ( = ?auto_291741 ?auto_291744 ) ) ( not ( = ?auto_291741 ?auto_291745 ) ) ( not ( = ?auto_291742 ?auto_291743 ) ) ( not ( = ?auto_291742 ?auto_291744 ) ) ( not ( = ?auto_291742 ?auto_291745 ) ) ( not ( = ?auto_291743 ?auto_291744 ) ) ( not ( = ?auto_291743 ?auto_291745 ) ) ( not ( = ?auto_291744 ?auto_291745 ) ) ( ON ?auto_291744 ?auto_291745 ) ( ON ?auto_291743 ?auto_291744 ) ( ON ?auto_291742 ?auto_291743 ) ( ON ?auto_291741 ?auto_291742 ) ( ON ?auto_291740 ?auto_291741 ) ( ON ?auto_291739 ?auto_291740 ) ( ON ?auto_291738 ?auto_291739 ) ( CLEAR ?auto_291736 ) ( ON ?auto_291737 ?auto_291738 ) ( CLEAR ?auto_291737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_291732 ?auto_291733 ?auto_291734 ?auto_291735 ?auto_291736 ?auto_291737 )
      ( MAKE-14PILE ?auto_291732 ?auto_291733 ?auto_291734 ?auto_291735 ?auto_291736 ?auto_291737 ?auto_291738 ?auto_291739 ?auto_291740 ?auto_291741 ?auto_291742 ?auto_291743 ?auto_291744 ?auto_291745 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291760 - BLOCK
      ?auto_291761 - BLOCK
      ?auto_291762 - BLOCK
      ?auto_291763 - BLOCK
      ?auto_291764 - BLOCK
      ?auto_291765 - BLOCK
      ?auto_291766 - BLOCK
      ?auto_291767 - BLOCK
      ?auto_291768 - BLOCK
      ?auto_291769 - BLOCK
      ?auto_291770 - BLOCK
      ?auto_291771 - BLOCK
      ?auto_291772 - BLOCK
      ?auto_291773 - BLOCK
    )
    :vars
    (
      ?auto_291774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_291773 ?auto_291774 ) ( ON-TABLE ?auto_291760 ) ( ON ?auto_291761 ?auto_291760 ) ( ON ?auto_291762 ?auto_291761 ) ( ON ?auto_291763 ?auto_291762 ) ( not ( = ?auto_291760 ?auto_291761 ) ) ( not ( = ?auto_291760 ?auto_291762 ) ) ( not ( = ?auto_291760 ?auto_291763 ) ) ( not ( = ?auto_291760 ?auto_291764 ) ) ( not ( = ?auto_291760 ?auto_291765 ) ) ( not ( = ?auto_291760 ?auto_291766 ) ) ( not ( = ?auto_291760 ?auto_291767 ) ) ( not ( = ?auto_291760 ?auto_291768 ) ) ( not ( = ?auto_291760 ?auto_291769 ) ) ( not ( = ?auto_291760 ?auto_291770 ) ) ( not ( = ?auto_291760 ?auto_291771 ) ) ( not ( = ?auto_291760 ?auto_291772 ) ) ( not ( = ?auto_291760 ?auto_291773 ) ) ( not ( = ?auto_291760 ?auto_291774 ) ) ( not ( = ?auto_291761 ?auto_291762 ) ) ( not ( = ?auto_291761 ?auto_291763 ) ) ( not ( = ?auto_291761 ?auto_291764 ) ) ( not ( = ?auto_291761 ?auto_291765 ) ) ( not ( = ?auto_291761 ?auto_291766 ) ) ( not ( = ?auto_291761 ?auto_291767 ) ) ( not ( = ?auto_291761 ?auto_291768 ) ) ( not ( = ?auto_291761 ?auto_291769 ) ) ( not ( = ?auto_291761 ?auto_291770 ) ) ( not ( = ?auto_291761 ?auto_291771 ) ) ( not ( = ?auto_291761 ?auto_291772 ) ) ( not ( = ?auto_291761 ?auto_291773 ) ) ( not ( = ?auto_291761 ?auto_291774 ) ) ( not ( = ?auto_291762 ?auto_291763 ) ) ( not ( = ?auto_291762 ?auto_291764 ) ) ( not ( = ?auto_291762 ?auto_291765 ) ) ( not ( = ?auto_291762 ?auto_291766 ) ) ( not ( = ?auto_291762 ?auto_291767 ) ) ( not ( = ?auto_291762 ?auto_291768 ) ) ( not ( = ?auto_291762 ?auto_291769 ) ) ( not ( = ?auto_291762 ?auto_291770 ) ) ( not ( = ?auto_291762 ?auto_291771 ) ) ( not ( = ?auto_291762 ?auto_291772 ) ) ( not ( = ?auto_291762 ?auto_291773 ) ) ( not ( = ?auto_291762 ?auto_291774 ) ) ( not ( = ?auto_291763 ?auto_291764 ) ) ( not ( = ?auto_291763 ?auto_291765 ) ) ( not ( = ?auto_291763 ?auto_291766 ) ) ( not ( = ?auto_291763 ?auto_291767 ) ) ( not ( = ?auto_291763 ?auto_291768 ) ) ( not ( = ?auto_291763 ?auto_291769 ) ) ( not ( = ?auto_291763 ?auto_291770 ) ) ( not ( = ?auto_291763 ?auto_291771 ) ) ( not ( = ?auto_291763 ?auto_291772 ) ) ( not ( = ?auto_291763 ?auto_291773 ) ) ( not ( = ?auto_291763 ?auto_291774 ) ) ( not ( = ?auto_291764 ?auto_291765 ) ) ( not ( = ?auto_291764 ?auto_291766 ) ) ( not ( = ?auto_291764 ?auto_291767 ) ) ( not ( = ?auto_291764 ?auto_291768 ) ) ( not ( = ?auto_291764 ?auto_291769 ) ) ( not ( = ?auto_291764 ?auto_291770 ) ) ( not ( = ?auto_291764 ?auto_291771 ) ) ( not ( = ?auto_291764 ?auto_291772 ) ) ( not ( = ?auto_291764 ?auto_291773 ) ) ( not ( = ?auto_291764 ?auto_291774 ) ) ( not ( = ?auto_291765 ?auto_291766 ) ) ( not ( = ?auto_291765 ?auto_291767 ) ) ( not ( = ?auto_291765 ?auto_291768 ) ) ( not ( = ?auto_291765 ?auto_291769 ) ) ( not ( = ?auto_291765 ?auto_291770 ) ) ( not ( = ?auto_291765 ?auto_291771 ) ) ( not ( = ?auto_291765 ?auto_291772 ) ) ( not ( = ?auto_291765 ?auto_291773 ) ) ( not ( = ?auto_291765 ?auto_291774 ) ) ( not ( = ?auto_291766 ?auto_291767 ) ) ( not ( = ?auto_291766 ?auto_291768 ) ) ( not ( = ?auto_291766 ?auto_291769 ) ) ( not ( = ?auto_291766 ?auto_291770 ) ) ( not ( = ?auto_291766 ?auto_291771 ) ) ( not ( = ?auto_291766 ?auto_291772 ) ) ( not ( = ?auto_291766 ?auto_291773 ) ) ( not ( = ?auto_291766 ?auto_291774 ) ) ( not ( = ?auto_291767 ?auto_291768 ) ) ( not ( = ?auto_291767 ?auto_291769 ) ) ( not ( = ?auto_291767 ?auto_291770 ) ) ( not ( = ?auto_291767 ?auto_291771 ) ) ( not ( = ?auto_291767 ?auto_291772 ) ) ( not ( = ?auto_291767 ?auto_291773 ) ) ( not ( = ?auto_291767 ?auto_291774 ) ) ( not ( = ?auto_291768 ?auto_291769 ) ) ( not ( = ?auto_291768 ?auto_291770 ) ) ( not ( = ?auto_291768 ?auto_291771 ) ) ( not ( = ?auto_291768 ?auto_291772 ) ) ( not ( = ?auto_291768 ?auto_291773 ) ) ( not ( = ?auto_291768 ?auto_291774 ) ) ( not ( = ?auto_291769 ?auto_291770 ) ) ( not ( = ?auto_291769 ?auto_291771 ) ) ( not ( = ?auto_291769 ?auto_291772 ) ) ( not ( = ?auto_291769 ?auto_291773 ) ) ( not ( = ?auto_291769 ?auto_291774 ) ) ( not ( = ?auto_291770 ?auto_291771 ) ) ( not ( = ?auto_291770 ?auto_291772 ) ) ( not ( = ?auto_291770 ?auto_291773 ) ) ( not ( = ?auto_291770 ?auto_291774 ) ) ( not ( = ?auto_291771 ?auto_291772 ) ) ( not ( = ?auto_291771 ?auto_291773 ) ) ( not ( = ?auto_291771 ?auto_291774 ) ) ( not ( = ?auto_291772 ?auto_291773 ) ) ( not ( = ?auto_291772 ?auto_291774 ) ) ( not ( = ?auto_291773 ?auto_291774 ) ) ( ON ?auto_291772 ?auto_291773 ) ( ON ?auto_291771 ?auto_291772 ) ( ON ?auto_291770 ?auto_291771 ) ( ON ?auto_291769 ?auto_291770 ) ( ON ?auto_291768 ?auto_291769 ) ( ON ?auto_291767 ?auto_291768 ) ( ON ?auto_291766 ?auto_291767 ) ( ON ?auto_291765 ?auto_291766 ) ( CLEAR ?auto_291763 ) ( ON ?auto_291764 ?auto_291765 ) ( CLEAR ?auto_291764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_291760 ?auto_291761 ?auto_291762 ?auto_291763 ?auto_291764 )
      ( MAKE-14PILE ?auto_291760 ?auto_291761 ?auto_291762 ?auto_291763 ?auto_291764 ?auto_291765 ?auto_291766 ?auto_291767 ?auto_291768 ?auto_291769 ?auto_291770 ?auto_291771 ?auto_291772 ?auto_291773 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291789 - BLOCK
      ?auto_291790 - BLOCK
      ?auto_291791 - BLOCK
      ?auto_291792 - BLOCK
      ?auto_291793 - BLOCK
      ?auto_291794 - BLOCK
      ?auto_291795 - BLOCK
      ?auto_291796 - BLOCK
      ?auto_291797 - BLOCK
      ?auto_291798 - BLOCK
      ?auto_291799 - BLOCK
      ?auto_291800 - BLOCK
      ?auto_291801 - BLOCK
      ?auto_291802 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_291802 ) ( ON-TABLE ?auto_291789 ) ( ON ?auto_291790 ?auto_291789 ) ( ON ?auto_291791 ?auto_291790 ) ( ON ?auto_291792 ?auto_291791 ) ( not ( = ?auto_291789 ?auto_291790 ) ) ( not ( = ?auto_291789 ?auto_291791 ) ) ( not ( = ?auto_291789 ?auto_291792 ) ) ( not ( = ?auto_291789 ?auto_291793 ) ) ( not ( = ?auto_291789 ?auto_291794 ) ) ( not ( = ?auto_291789 ?auto_291795 ) ) ( not ( = ?auto_291789 ?auto_291796 ) ) ( not ( = ?auto_291789 ?auto_291797 ) ) ( not ( = ?auto_291789 ?auto_291798 ) ) ( not ( = ?auto_291789 ?auto_291799 ) ) ( not ( = ?auto_291789 ?auto_291800 ) ) ( not ( = ?auto_291789 ?auto_291801 ) ) ( not ( = ?auto_291789 ?auto_291802 ) ) ( not ( = ?auto_291790 ?auto_291791 ) ) ( not ( = ?auto_291790 ?auto_291792 ) ) ( not ( = ?auto_291790 ?auto_291793 ) ) ( not ( = ?auto_291790 ?auto_291794 ) ) ( not ( = ?auto_291790 ?auto_291795 ) ) ( not ( = ?auto_291790 ?auto_291796 ) ) ( not ( = ?auto_291790 ?auto_291797 ) ) ( not ( = ?auto_291790 ?auto_291798 ) ) ( not ( = ?auto_291790 ?auto_291799 ) ) ( not ( = ?auto_291790 ?auto_291800 ) ) ( not ( = ?auto_291790 ?auto_291801 ) ) ( not ( = ?auto_291790 ?auto_291802 ) ) ( not ( = ?auto_291791 ?auto_291792 ) ) ( not ( = ?auto_291791 ?auto_291793 ) ) ( not ( = ?auto_291791 ?auto_291794 ) ) ( not ( = ?auto_291791 ?auto_291795 ) ) ( not ( = ?auto_291791 ?auto_291796 ) ) ( not ( = ?auto_291791 ?auto_291797 ) ) ( not ( = ?auto_291791 ?auto_291798 ) ) ( not ( = ?auto_291791 ?auto_291799 ) ) ( not ( = ?auto_291791 ?auto_291800 ) ) ( not ( = ?auto_291791 ?auto_291801 ) ) ( not ( = ?auto_291791 ?auto_291802 ) ) ( not ( = ?auto_291792 ?auto_291793 ) ) ( not ( = ?auto_291792 ?auto_291794 ) ) ( not ( = ?auto_291792 ?auto_291795 ) ) ( not ( = ?auto_291792 ?auto_291796 ) ) ( not ( = ?auto_291792 ?auto_291797 ) ) ( not ( = ?auto_291792 ?auto_291798 ) ) ( not ( = ?auto_291792 ?auto_291799 ) ) ( not ( = ?auto_291792 ?auto_291800 ) ) ( not ( = ?auto_291792 ?auto_291801 ) ) ( not ( = ?auto_291792 ?auto_291802 ) ) ( not ( = ?auto_291793 ?auto_291794 ) ) ( not ( = ?auto_291793 ?auto_291795 ) ) ( not ( = ?auto_291793 ?auto_291796 ) ) ( not ( = ?auto_291793 ?auto_291797 ) ) ( not ( = ?auto_291793 ?auto_291798 ) ) ( not ( = ?auto_291793 ?auto_291799 ) ) ( not ( = ?auto_291793 ?auto_291800 ) ) ( not ( = ?auto_291793 ?auto_291801 ) ) ( not ( = ?auto_291793 ?auto_291802 ) ) ( not ( = ?auto_291794 ?auto_291795 ) ) ( not ( = ?auto_291794 ?auto_291796 ) ) ( not ( = ?auto_291794 ?auto_291797 ) ) ( not ( = ?auto_291794 ?auto_291798 ) ) ( not ( = ?auto_291794 ?auto_291799 ) ) ( not ( = ?auto_291794 ?auto_291800 ) ) ( not ( = ?auto_291794 ?auto_291801 ) ) ( not ( = ?auto_291794 ?auto_291802 ) ) ( not ( = ?auto_291795 ?auto_291796 ) ) ( not ( = ?auto_291795 ?auto_291797 ) ) ( not ( = ?auto_291795 ?auto_291798 ) ) ( not ( = ?auto_291795 ?auto_291799 ) ) ( not ( = ?auto_291795 ?auto_291800 ) ) ( not ( = ?auto_291795 ?auto_291801 ) ) ( not ( = ?auto_291795 ?auto_291802 ) ) ( not ( = ?auto_291796 ?auto_291797 ) ) ( not ( = ?auto_291796 ?auto_291798 ) ) ( not ( = ?auto_291796 ?auto_291799 ) ) ( not ( = ?auto_291796 ?auto_291800 ) ) ( not ( = ?auto_291796 ?auto_291801 ) ) ( not ( = ?auto_291796 ?auto_291802 ) ) ( not ( = ?auto_291797 ?auto_291798 ) ) ( not ( = ?auto_291797 ?auto_291799 ) ) ( not ( = ?auto_291797 ?auto_291800 ) ) ( not ( = ?auto_291797 ?auto_291801 ) ) ( not ( = ?auto_291797 ?auto_291802 ) ) ( not ( = ?auto_291798 ?auto_291799 ) ) ( not ( = ?auto_291798 ?auto_291800 ) ) ( not ( = ?auto_291798 ?auto_291801 ) ) ( not ( = ?auto_291798 ?auto_291802 ) ) ( not ( = ?auto_291799 ?auto_291800 ) ) ( not ( = ?auto_291799 ?auto_291801 ) ) ( not ( = ?auto_291799 ?auto_291802 ) ) ( not ( = ?auto_291800 ?auto_291801 ) ) ( not ( = ?auto_291800 ?auto_291802 ) ) ( not ( = ?auto_291801 ?auto_291802 ) ) ( ON ?auto_291801 ?auto_291802 ) ( ON ?auto_291800 ?auto_291801 ) ( ON ?auto_291799 ?auto_291800 ) ( ON ?auto_291798 ?auto_291799 ) ( ON ?auto_291797 ?auto_291798 ) ( ON ?auto_291796 ?auto_291797 ) ( ON ?auto_291795 ?auto_291796 ) ( ON ?auto_291794 ?auto_291795 ) ( CLEAR ?auto_291792 ) ( ON ?auto_291793 ?auto_291794 ) ( CLEAR ?auto_291793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_291789 ?auto_291790 ?auto_291791 ?auto_291792 ?auto_291793 )
      ( MAKE-14PILE ?auto_291789 ?auto_291790 ?auto_291791 ?auto_291792 ?auto_291793 ?auto_291794 ?auto_291795 ?auto_291796 ?auto_291797 ?auto_291798 ?auto_291799 ?auto_291800 ?auto_291801 ?auto_291802 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291817 - BLOCK
      ?auto_291818 - BLOCK
      ?auto_291819 - BLOCK
      ?auto_291820 - BLOCK
      ?auto_291821 - BLOCK
      ?auto_291822 - BLOCK
      ?auto_291823 - BLOCK
      ?auto_291824 - BLOCK
      ?auto_291825 - BLOCK
      ?auto_291826 - BLOCK
      ?auto_291827 - BLOCK
      ?auto_291828 - BLOCK
      ?auto_291829 - BLOCK
      ?auto_291830 - BLOCK
    )
    :vars
    (
      ?auto_291831 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_291830 ?auto_291831 ) ( ON-TABLE ?auto_291817 ) ( ON ?auto_291818 ?auto_291817 ) ( ON ?auto_291819 ?auto_291818 ) ( not ( = ?auto_291817 ?auto_291818 ) ) ( not ( = ?auto_291817 ?auto_291819 ) ) ( not ( = ?auto_291817 ?auto_291820 ) ) ( not ( = ?auto_291817 ?auto_291821 ) ) ( not ( = ?auto_291817 ?auto_291822 ) ) ( not ( = ?auto_291817 ?auto_291823 ) ) ( not ( = ?auto_291817 ?auto_291824 ) ) ( not ( = ?auto_291817 ?auto_291825 ) ) ( not ( = ?auto_291817 ?auto_291826 ) ) ( not ( = ?auto_291817 ?auto_291827 ) ) ( not ( = ?auto_291817 ?auto_291828 ) ) ( not ( = ?auto_291817 ?auto_291829 ) ) ( not ( = ?auto_291817 ?auto_291830 ) ) ( not ( = ?auto_291817 ?auto_291831 ) ) ( not ( = ?auto_291818 ?auto_291819 ) ) ( not ( = ?auto_291818 ?auto_291820 ) ) ( not ( = ?auto_291818 ?auto_291821 ) ) ( not ( = ?auto_291818 ?auto_291822 ) ) ( not ( = ?auto_291818 ?auto_291823 ) ) ( not ( = ?auto_291818 ?auto_291824 ) ) ( not ( = ?auto_291818 ?auto_291825 ) ) ( not ( = ?auto_291818 ?auto_291826 ) ) ( not ( = ?auto_291818 ?auto_291827 ) ) ( not ( = ?auto_291818 ?auto_291828 ) ) ( not ( = ?auto_291818 ?auto_291829 ) ) ( not ( = ?auto_291818 ?auto_291830 ) ) ( not ( = ?auto_291818 ?auto_291831 ) ) ( not ( = ?auto_291819 ?auto_291820 ) ) ( not ( = ?auto_291819 ?auto_291821 ) ) ( not ( = ?auto_291819 ?auto_291822 ) ) ( not ( = ?auto_291819 ?auto_291823 ) ) ( not ( = ?auto_291819 ?auto_291824 ) ) ( not ( = ?auto_291819 ?auto_291825 ) ) ( not ( = ?auto_291819 ?auto_291826 ) ) ( not ( = ?auto_291819 ?auto_291827 ) ) ( not ( = ?auto_291819 ?auto_291828 ) ) ( not ( = ?auto_291819 ?auto_291829 ) ) ( not ( = ?auto_291819 ?auto_291830 ) ) ( not ( = ?auto_291819 ?auto_291831 ) ) ( not ( = ?auto_291820 ?auto_291821 ) ) ( not ( = ?auto_291820 ?auto_291822 ) ) ( not ( = ?auto_291820 ?auto_291823 ) ) ( not ( = ?auto_291820 ?auto_291824 ) ) ( not ( = ?auto_291820 ?auto_291825 ) ) ( not ( = ?auto_291820 ?auto_291826 ) ) ( not ( = ?auto_291820 ?auto_291827 ) ) ( not ( = ?auto_291820 ?auto_291828 ) ) ( not ( = ?auto_291820 ?auto_291829 ) ) ( not ( = ?auto_291820 ?auto_291830 ) ) ( not ( = ?auto_291820 ?auto_291831 ) ) ( not ( = ?auto_291821 ?auto_291822 ) ) ( not ( = ?auto_291821 ?auto_291823 ) ) ( not ( = ?auto_291821 ?auto_291824 ) ) ( not ( = ?auto_291821 ?auto_291825 ) ) ( not ( = ?auto_291821 ?auto_291826 ) ) ( not ( = ?auto_291821 ?auto_291827 ) ) ( not ( = ?auto_291821 ?auto_291828 ) ) ( not ( = ?auto_291821 ?auto_291829 ) ) ( not ( = ?auto_291821 ?auto_291830 ) ) ( not ( = ?auto_291821 ?auto_291831 ) ) ( not ( = ?auto_291822 ?auto_291823 ) ) ( not ( = ?auto_291822 ?auto_291824 ) ) ( not ( = ?auto_291822 ?auto_291825 ) ) ( not ( = ?auto_291822 ?auto_291826 ) ) ( not ( = ?auto_291822 ?auto_291827 ) ) ( not ( = ?auto_291822 ?auto_291828 ) ) ( not ( = ?auto_291822 ?auto_291829 ) ) ( not ( = ?auto_291822 ?auto_291830 ) ) ( not ( = ?auto_291822 ?auto_291831 ) ) ( not ( = ?auto_291823 ?auto_291824 ) ) ( not ( = ?auto_291823 ?auto_291825 ) ) ( not ( = ?auto_291823 ?auto_291826 ) ) ( not ( = ?auto_291823 ?auto_291827 ) ) ( not ( = ?auto_291823 ?auto_291828 ) ) ( not ( = ?auto_291823 ?auto_291829 ) ) ( not ( = ?auto_291823 ?auto_291830 ) ) ( not ( = ?auto_291823 ?auto_291831 ) ) ( not ( = ?auto_291824 ?auto_291825 ) ) ( not ( = ?auto_291824 ?auto_291826 ) ) ( not ( = ?auto_291824 ?auto_291827 ) ) ( not ( = ?auto_291824 ?auto_291828 ) ) ( not ( = ?auto_291824 ?auto_291829 ) ) ( not ( = ?auto_291824 ?auto_291830 ) ) ( not ( = ?auto_291824 ?auto_291831 ) ) ( not ( = ?auto_291825 ?auto_291826 ) ) ( not ( = ?auto_291825 ?auto_291827 ) ) ( not ( = ?auto_291825 ?auto_291828 ) ) ( not ( = ?auto_291825 ?auto_291829 ) ) ( not ( = ?auto_291825 ?auto_291830 ) ) ( not ( = ?auto_291825 ?auto_291831 ) ) ( not ( = ?auto_291826 ?auto_291827 ) ) ( not ( = ?auto_291826 ?auto_291828 ) ) ( not ( = ?auto_291826 ?auto_291829 ) ) ( not ( = ?auto_291826 ?auto_291830 ) ) ( not ( = ?auto_291826 ?auto_291831 ) ) ( not ( = ?auto_291827 ?auto_291828 ) ) ( not ( = ?auto_291827 ?auto_291829 ) ) ( not ( = ?auto_291827 ?auto_291830 ) ) ( not ( = ?auto_291827 ?auto_291831 ) ) ( not ( = ?auto_291828 ?auto_291829 ) ) ( not ( = ?auto_291828 ?auto_291830 ) ) ( not ( = ?auto_291828 ?auto_291831 ) ) ( not ( = ?auto_291829 ?auto_291830 ) ) ( not ( = ?auto_291829 ?auto_291831 ) ) ( not ( = ?auto_291830 ?auto_291831 ) ) ( ON ?auto_291829 ?auto_291830 ) ( ON ?auto_291828 ?auto_291829 ) ( ON ?auto_291827 ?auto_291828 ) ( ON ?auto_291826 ?auto_291827 ) ( ON ?auto_291825 ?auto_291826 ) ( ON ?auto_291824 ?auto_291825 ) ( ON ?auto_291823 ?auto_291824 ) ( ON ?auto_291822 ?auto_291823 ) ( ON ?auto_291821 ?auto_291822 ) ( CLEAR ?auto_291819 ) ( ON ?auto_291820 ?auto_291821 ) ( CLEAR ?auto_291820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_291817 ?auto_291818 ?auto_291819 ?auto_291820 )
      ( MAKE-14PILE ?auto_291817 ?auto_291818 ?auto_291819 ?auto_291820 ?auto_291821 ?auto_291822 ?auto_291823 ?auto_291824 ?auto_291825 ?auto_291826 ?auto_291827 ?auto_291828 ?auto_291829 ?auto_291830 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291846 - BLOCK
      ?auto_291847 - BLOCK
      ?auto_291848 - BLOCK
      ?auto_291849 - BLOCK
      ?auto_291850 - BLOCK
      ?auto_291851 - BLOCK
      ?auto_291852 - BLOCK
      ?auto_291853 - BLOCK
      ?auto_291854 - BLOCK
      ?auto_291855 - BLOCK
      ?auto_291856 - BLOCK
      ?auto_291857 - BLOCK
      ?auto_291858 - BLOCK
      ?auto_291859 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_291859 ) ( ON-TABLE ?auto_291846 ) ( ON ?auto_291847 ?auto_291846 ) ( ON ?auto_291848 ?auto_291847 ) ( not ( = ?auto_291846 ?auto_291847 ) ) ( not ( = ?auto_291846 ?auto_291848 ) ) ( not ( = ?auto_291846 ?auto_291849 ) ) ( not ( = ?auto_291846 ?auto_291850 ) ) ( not ( = ?auto_291846 ?auto_291851 ) ) ( not ( = ?auto_291846 ?auto_291852 ) ) ( not ( = ?auto_291846 ?auto_291853 ) ) ( not ( = ?auto_291846 ?auto_291854 ) ) ( not ( = ?auto_291846 ?auto_291855 ) ) ( not ( = ?auto_291846 ?auto_291856 ) ) ( not ( = ?auto_291846 ?auto_291857 ) ) ( not ( = ?auto_291846 ?auto_291858 ) ) ( not ( = ?auto_291846 ?auto_291859 ) ) ( not ( = ?auto_291847 ?auto_291848 ) ) ( not ( = ?auto_291847 ?auto_291849 ) ) ( not ( = ?auto_291847 ?auto_291850 ) ) ( not ( = ?auto_291847 ?auto_291851 ) ) ( not ( = ?auto_291847 ?auto_291852 ) ) ( not ( = ?auto_291847 ?auto_291853 ) ) ( not ( = ?auto_291847 ?auto_291854 ) ) ( not ( = ?auto_291847 ?auto_291855 ) ) ( not ( = ?auto_291847 ?auto_291856 ) ) ( not ( = ?auto_291847 ?auto_291857 ) ) ( not ( = ?auto_291847 ?auto_291858 ) ) ( not ( = ?auto_291847 ?auto_291859 ) ) ( not ( = ?auto_291848 ?auto_291849 ) ) ( not ( = ?auto_291848 ?auto_291850 ) ) ( not ( = ?auto_291848 ?auto_291851 ) ) ( not ( = ?auto_291848 ?auto_291852 ) ) ( not ( = ?auto_291848 ?auto_291853 ) ) ( not ( = ?auto_291848 ?auto_291854 ) ) ( not ( = ?auto_291848 ?auto_291855 ) ) ( not ( = ?auto_291848 ?auto_291856 ) ) ( not ( = ?auto_291848 ?auto_291857 ) ) ( not ( = ?auto_291848 ?auto_291858 ) ) ( not ( = ?auto_291848 ?auto_291859 ) ) ( not ( = ?auto_291849 ?auto_291850 ) ) ( not ( = ?auto_291849 ?auto_291851 ) ) ( not ( = ?auto_291849 ?auto_291852 ) ) ( not ( = ?auto_291849 ?auto_291853 ) ) ( not ( = ?auto_291849 ?auto_291854 ) ) ( not ( = ?auto_291849 ?auto_291855 ) ) ( not ( = ?auto_291849 ?auto_291856 ) ) ( not ( = ?auto_291849 ?auto_291857 ) ) ( not ( = ?auto_291849 ?auto_291858 ) ) ( not ( = ?auto_291849 ?auto_291859 ) ) ( not ( = ?auto_291850 ?auto_291851 ) ) ( not ( = ?auto_291850 ?auto_291852 ) ) ( not ( = ?auto_291850 ?auto_291853 ) ) ( not ( = ?auto_291850 ?auto_291854 ) ) ( not ( = ?auto_291850 ?auto_291855 ) ) ( not ( = ?auto_291850 ?auto_291856 ) ) ( not ( = ?auto_291850 ?auto_291857 ) ) ( not ( = ?auto_291850 ?auto_291858 ) ) ( not ( = ?auto_291850 ?auto_291859 ) ) ( not ( = ?auto_291851 ?auto_291852 ) ) ( not ( = ?auto_291851 ?auto_291853 ) ) ( not ( = ?auto_291851 ?auto_291854 ) ) ( not ( = ?auto_291851 ?auto_291855 ) ) ( not ( = ?auto_291851 ?auto_291856 ) ) ( not ( = ?auto_291851 ?auto_291857 ) ) ( not ( = ?auto_291851 ?auto_291858 ) ) ( not ( = ?auto_291851 ?auto_291859 ) ) ( not ( = ?auto_291852 ?auto_291853 ) ) ( not ( = ?auto_291852 ?auto_291854 ) ) ( not ( = ?auto_291852 ?auto_291855 ) ) ( not ( = ?auto_291852 ?auto_291856 ) ) ( not ( = ?auto_291852 ?auto_291857 ) ) ( not ( = ?auto_291852 ?auto_291858 ) ) ( not ( = ?auto_291852 ?auto_291859 ) ) ( not ( = ?auto_291853 ?auto_291854 ) ) ( not ( = ?auto_291853 ?auto_291855 ) ) ( not ( = ?auto_291853 ?auto_291856 ) ) ( not ( = ?auto_291853 ?auto_291857 ) ) ( not ( = ?auto_291853 ?auto_291858 ) ) ( not ( = ?auto_291853 ?auto_291859 ) ) ( not ( = ?auto_291854 ?auto_291855 ) ) ( not ( = ?auto_291854 ?auto_291856 ) ) ( not ( = ?auto_291854 ?auto_291857 ) ) ( not ( = ?auto_291854 ?auto_291858 ) ) ( not ( = ?auto_291854 ?auto_291859 ) ) ( not ( = ?auto_291855 ?auto_291856 ) ) ( not ( = ?auto_291855 ?auto_291857 ) ) ( not ( = ?auto_291855 ?auto_291858 ) ) ( not ( = ?auto_291855 ?auto_291859 ) ) ( not ( = ?auto_291856 ?auto_291857 ) ) ( not ( = ?auto_291856 ?auto_291858 ) ) ( not ( = ?auto_291856 ?auto_291859 ) ) ( not ( = ?auto_291857 ?auto_291858 ) ) ( not ( = ?auto_291857 ?auto_291859 ) ) ( not ( = ?auto_291858 ?auto_291859 ) ) ( ON ?auto_291858 ?auto_291859 ) ( ON ?auto_291857 ?auto_291858 ) ( ON ?auto_291856 ?auto_291857 ) ( ON ?auto_291855 ?auto_291856 ) ( ON ?auto_291854 ?auto_291855 ) ( ON ?auto_291853 ?auto_291854 ) ( ON ?auto_291852 ?auto_291853 ) ( ON ?auto_291851 ?auto_291852 ) ( ON ?auto_291850 ?auto_291851 ) ( CLEAR ?auto_291848 ) ( ON ?auto_291849 ?auto_291850 ) ( CLEAR ?auto_291849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_291846 ?auto_291847 ?auto_291848 ?auto_291849 )
      ( MAKE-14PILE ?auto_291846 ?auto_291847 ?auto_291848 ?auto_291849 ?auto_291850 ?auto_291851 ?auto_291852 ?auto_291853 ?auto_291854 ?auto_291855 ?auto_291856 ?auto_291857 ?auto_291858 ?auto_291859 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291874 - BLOCK
      ?auto_291875 - BLOCK
      ?auto_291876 - BLOCK
      ?auto_291877 - BLOCK
      ?auto_291878 - BLOCK
      ?auto_291879 - BLOCK
      ?auto_291880 - BLOCK
      ?auto_291881 - BLOCK
      ?auto_291882 - BLOCK
      ?auto_291883 - BLOCK
      ?auto_291884 - BLOCK
      ?auto_291885 - BLOCK
      ?auto_291886 - BLOCK
      ?auto_291887 - BLOCK
    )
    :vars
    (
      ?auto_291888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_291887 ?auto_291888 ) ( ON-TABLE ?auto_291874 ) ( ON ?auto_291875 ?auto_291874 ) ( not ( = ?auto_291874 ?auto_291875 ) ) ( not ( = ?auto_291874 ?auto_291876 ) ) ( not ( = ?auto_291874 ?auto_291877 ) ) ( not ( = ?auto_291874 ?auto_291878 ) ) ( not ( = ?auto_291874 ?auto_291879 ) ) ( not ( = ?auto_291874 ?auto_291880 ) ) ( not ( = ?auto_291874 ?auto_291881 ) ) ( not ( = ?auto_291874 ?auto_291882 ) ) ( not ( = ?auto_291874 ?auto_291883 ) ) ( not ( = ?auto_291874 ?auto_291884 ) ) ( not ( = ?auto_291874 ?auto_291885 ) ) ( not ( = ?auto_291874 ?auto_291886 ) ) ( not ( = ?auto_291874 ?auto_291887 ) ) ( not ( = ?auto_291874 ?auto_291888 ) ) ( not ( = ?auto_291875 ?auto_291876 ) ) ( not ( = ?auto_291875 ?auto_291877 ) ) ( not ( = ?auto_291875 ?auto_291878 ) ) ( not ( = ?auto_291875 ?auto_291879 ) ) ( not ( = ?auto_291875 ?auto_291880 ) ) ( not ( = ?auto_291875 ?auto_291881 ) ) ( not ( = ?auto_291875 ?auto_291882 ) ) ( not ( = ?auto_291875 ?auto_291883 ) ) ( not ( = ?auto_291875 ?auto_291884 ) ) ( not ( = ?auto_291875 ?auto_291885 ) ) ( not ( = ?auto_291875 ?auto_291886 ) ) ( not ( = ?auto_291875 ?auto_291887 ) ) ( not ( = ?auto_291875 ?auto_291888 ) ) ( not ( = ?auto_291876 ?auto_291877 ) ) ( not ( = ?auto_291876 ?auto_291878 ) ) ( not ( = ?auto_291876 ?auto_291879 ) ) ( not ( = ?auto_291876 ?auto_291880 ) ) ( not ( = ?auto_291876 ?auto_291881 ) ) ( not ( = ?auto_291876 ?auto_291882 ) ) ( not ( = ?auto_291876 ?auto_291883 ) ) ( not ( = ?auto_291876 ?auto_291884 ) ) ( not ( = ?auto_291876 ?auto_291885 ) ) ( not ( = ?auto_291876 ?auto_291886 ) ) ( not ( = ?auto_291876 ?auto_291887 ) ) ( not ( = ?auto_291876 ?auto_291888 ) ) ( not ( = ?auto_291877 ?auto_291878 ) ) ( not ( = ?auto_291877 ?auto_291879 ) ) ( not ( = ?auto_291877 ?auto_291880 ) ) ( not ( = ?auto_291877 ?auto_291881 ) ) ( not ( = ?auto_291877 ?auto_291882 ) ) ( not ( = ?auto_291877 ?auto_291883 ) ) ( not ( = ?auto_291877 ?auto_291884 ) ) ( not ( = ?auto_291877 ?auto_291885 ) ) ( not ( = ?auto_291877 ?auto_291886 ) ) ( not ( = ?auto_291877 ?auto_291887 ) ) ( not ( = ?auto_291877 ?auto_291888 ) ) ( not ( = ?auto_291878 ?auto_291879 ) ) ( not ( = ?auto_291878 ?auto_291880 ) ) ( not ( = ?auto_291878 ?auto_291881 ) ) ( not ( = ?auto_291878 ?auto_291882 ) ) ( not ( = ?auto_291878 ?auto_291883 ) ) ( not ( = ?auto_291878 ?auto_291884 ) ) ( not ( = ?auto_291878 ?auto_291885 ) ) ( not ( = ?auto_291878 ?auto_291886 ) ) ( not ( = ?auto_291878 ?auto_291887 ) ) ( not ( = ?auto_291878 ?auto_291888 ) ) ( not ( = ?auto_291879 ?auto_291880 ) ) ( not ( = ?auto_291879 ?auto_291881 ) ) ( not ( = ?auto_291879 ?auto_291882 ) ) ( not ( = ?auto_291879 ?auto_291883 ) ) ( not ( = ?auto_291879 ?auto_291884 ) ) ( not ( = ?auto_291879 ?auto_291885 ) ) ( not ( = ?auto_291879 ?auto_291886 ) ) ( not ( = ?auto_291879 ?auto_291887 ) ) ( not ( = ?auto_291879 ?auto_291888 ) ) ( not ( = ?auto_291880 ?auto_291881 ) ) ( not ( = ?auto_291880 ?auto_291882 ) ) ( not ( = ?auto_291880 ?auto_291883 ) ) ( not ( = ?auto_291880 ?auto_291884 ) ) ( not ( = ?auto_291880 ?auto_291885 ) ) ( not ( = ?auto_291880 ?auto_291886 ) ) ( not ( = ?auto_291880 ?auto_291887 ) ) ( not ( = ?auto_291880 ?auto_291888 ) ) ( not ( = ?auto_291881 ?auto_291882 ) ) ( not ( = ?auto_291881 ?auto_291883 ) ) ( not ( = ?auto_291881 ?auto_291884 ) ) ( not ( = ?auto_291881 ?auto_291885 ) ) ( not ( = ?auto_291881 ?auto_291886 ) ) ( not ( = ?auto_291881 ?auto_291887 ) ) ( not ( = ?auto_291881 ?auto_291888 ) ) ( not ( = ?auto_291882 ?auto_291883 ) ) ( not ( = ?auto_291882 ?auto_291884 ) ) ( not ( = ?auto_291882 ?auto_291885 ) ) ( not ( = ?auto_291882 ?auto_291886 ) ) ( not ( = ?auto_291882 ?auto_291887 ) ) ( not ( = ?auto_291882 ?auto_291888 ) ) ( not ( = ?auto_291883 ?auto_291884 ) ) ( not ( = ?auto_291883 ?auto_291885 ) ) ( not ( = ?auto_291883 ?auto_291886 ) ) ( not ( = ?auto_291883 ?auto_291887 ) ) ( not ( = ?auto_291883 ?auto_291888 ) ) ( not ( = ?auto_291884 ?auto_291885 ) ) ( not ( = ?auto_291884 ?auto_291886 ) ) ( not ( = ?auto_291884 ?auto_291887 ) ) ( not ( = ?auto_291884 ?auto_291888 ) ) ( not ( = ?auto_291885 ?auto_291886 ) ) ( not ( = ?auto_291885 ?auto_291887 ) ) ( not ( = ?auto_291885 ?auto_291888 ) ) ( not ( = ?auto_291886 ?auto_291887 ) ) ( not ( = ?auto_291886 ?auto_291888 ) ) ( not ( = ?auto_291887 ?auto_291888 ) ) ( ON ?auto_291886 ?auto_291887 ) ( ON ?auto_291885 ?auto_291886 ) ( ON ?auto_291884 ?auto_291885 ) ( ON ?auto_291883 ?auto_291884 ) ( ON ?auto_291882 ?auto_291883 ) ( ON ?auto_291881 ?auto_291882 ) ( ON ?auto_291880 ?auto_291881 ) ( ON ?auto_291879 ?auto_291880 ) ( ON ?auto_291878 ?auto_291879 ) ( ON ?auto_291877 ?auto_291878 ) ( CLEAR ?auto_291875 ) ( ON ?auto_291876 ?auto_291877 ) ( CLEAR ?auto_291876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_291874 ?auto_291875 ?auto_291876 )
      ( MAKE-14PILE ?auto_291874 ?auto_291875 ?auto_291876 ?auto_291877 ?auto_291878 ?auto_291879 ?auto_291880 ?auto_291881 ?auto_291882 ?auto_291883 ?auto_291884 ?auto_291885 ?auto_291886 ?auto_291887 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291903 - BLOCK
      ?auto_291904 - BLOCK
      ?auto_291905 - BLOCK
      ?auto_291906 - BLOCK
      ?auto_291907 - BLOCK
      ?auto_291908 - BLOCK
      ?auto_291909 - BLOCK
      ?auto_291910 - BLOCK
      ?auto_291911 - BLOCK
      ?auto_291912 - BLOCK
      ?auto_291913 - BLOCK
      ?auto_291914 - BLOCK
      ?auto_291915 - BLOCK
      ?auto_291916 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_291916 ) ( ON-TABLE ?auto_291903 ) ( ON ?auto_291904 ?auto_291903 ) ( not ( = ?auto_291903 ?auto_291904 ) ) ( not ( = ?auto_291903 ?auto_291905 ) ) ( not ( = ?auto_291903 ?auto_291906 ) ) ( not ( = ?auto_291903 ?auto_291907 ) ) ( not ( = ?auto_291903 ?auto_291908 ) ) ( not ( = ?auto_291903 ?auto_291909 ) ) ( not ( = ?auto_291903 ?auto_291910 ) ) ( not ( = ?auto_291903 ?auto_291911 ) ) ( not ( = ?auto_291903 ?auto_291912 ) ) ( not ( = ?auto_291903 ?auto_291913 ) ) ( not ( = ?auto_291903 ?auto_291914 ) ) ( not ( = ?auto_291903 ?auto_291915 ) ) ( not ( = ?auto_291903 ?auto_291916 ) ) ( not ( = ?auto_291904 ?auto_291905 ) ) ( not ( = ?auto_291904 ?auto_291906 ) ) ( not ( = ?auto_291904 ?auto_291907 ) ) ( not ( = ?auto_291904 ?auto_291908 ) ) ( not ( = ?auto_291904 ?auto_291909 ) ) ( not ( = ?auto_291904 ?auto_291910 ) ) ( not ( = ?auto_291904 ?auto_291911 ) ) ( not ( = ?auto_291904 ?auto_291912 ) ) ( not ( = ?auto_291904 ?auto_291913 ) ) ( not ( = ?auto_291904 ?auto_291914 ) ) ( not ( = ?auto_291904 ?auto_291915 ) ) ( not ( = ?auto_291904 ?auto_291916 ) ) ( not ( = ?auto_291905 ?auto_291906 ) ) ( not ( = ?auto_291905 ?auto_291907 ) ) ( not ( = ?auto_291905 ?auto_291908 ) ) ( not ( = ?auto_291905 ?auto_291909 ) ) ( not ( = ?auto_291905 ?auto_291910 ) ) ( not ( = ?auto_291905 ?auto_291911 ) ) ( not ( = ?auto_291905 ?auto_291912 ) ) ( not ( = ?auto_291905 ?auto_291913 ) ) ( not ( = ?auto_291905 ?auto_291914 ) ) ( not ( = ?auto_291905 ?auto_291915 ) ) ( not ( = ?auto_291905 ?auto_291916 ) ) ( not ( = ?auto_291906 ?auto_291907 ) ) ( not ( = ?auto_291906 ?auto_291908 ) ) ( not ( = ?auto_291906 ?auto_291909 ) ) ( not ( = ?auto_291906 ?auto_291910 ) ) ( not ( = ?auto_291906 ?auto_291911 ) ) ( not ( = ?auto_291906 ?auto_291912 ) ) ( not ( = ?auto_291906 ?auto_291913 ) ) ( not ( = ?auto_291906 ?auto_291914 ) ) ( not ( = ?auto_291906 ?auto_291915 ) ) ( not ( = ?auto_291906 ?auto_291916 ) ) ( not ( = ?auto_291907 ?auto_291908 ) ) ( not ( = ?auto_291907 ?auto_291909 ) ) ( not ( = ?auto_291907 ?auto_291910 ) ) ( not ( = ?auto_291907 ?auto_291911 ) ) ( not ( = ?auto_291907 ?auto_291912 ) ) ( not ( = ?auto_291907 ?auto_291913 ) ) ( not ( = ?auto_291907 ?auto_291914 ) ) ( not ( = ?auto_291907 ?auto_291915 ) ) ( not ( = ?auto_291907 ?auto_291916 ) ) ( not ( = ?auto_291908 ?auto_291909 ) ) ( not ( = ?auto_291908 ?auto_291910 ) ) ( not ( = ?auto_291908 ?auto_291911 ) ) ( not ( = ?auto_291908 ?auto_291912 ) ) ( not ( = ?auto_291908 ?auto_291913 ) ) ( not ( = ?auto_291908 ?auto_291914 ) ) ( not ( = ?auto_291908 ?auto_291915 ) ) ( not ( = ?auto_291908 ?auto_291916 ) ) ( not ( = ?auto_291909 ?auto_291910 ) ) ( not ( = ?auto_291909 ?auto_291911 ) ) ( not ( = ?auto_291909 ?auto_291912 ) ) ( not ( = ?auto_291909 ?auto_291913 ) ) ( not ( = ?auto_291909 ?auto_291914 ) ) ( not ( = ?auto_291909 ?auto_291915 ) ) ( not ( = ?auto_291909 ?auto_291916 ) ) ( not ( = ?auto_291910 ?auto_291911 ) ) ( not ( = ?auto_291910 ?auto_291912 ) ) ( not ( = ?auto_291910 ?auto_291913 ) ) ( not ( = ?auto_291910 ?auto_291914 ) ) ( not ( = ?auto_291910 ?auto_291915 ) ) ( not ( = ?auto_291910 ?auto_291916 ) ) ( not ( = ?auto_291911 ?auto_291912 ) ) ( not ( = ?auto_291911 ?auto_291913 ) ) ( not ( = ?auto_291911 ?auto_291914 ) ) ( not ( = ?auto_291911 ?auto_291915 ) ) ( not ( = ?auto_291911 ?auto_291916 ) ) ( not ( = ?auto_291912 ?auto_291913 ) ) ( not ( = ?auto_291912 ?auto_291914 ) ) ( not ( = ?auto_291912 ?auto_291915 ) ) ( not ( = ?auto_291912 ?auto_291916 ) ) ( not ( = ?auto_291913 ?auto_291914 ) ) ( not ( = ?auto_291913 ?auto_291915 ) ) ( not ( = ?auto_291913 ?auto_291916 ) ) ( not ( = ?auto_291914 ?auto_291915 ) ) ( not ( = ?auto_291914 ?auto_291916 ) ) ( not ( = ?auto_291915 ?auto_291916 ) ) ( ON ?auto_291915 ?auto_291916 ) ( ON ?auto_291914 ?auto_291915 ) ( ON ?auto_291913 ?auto_291914 ) ( ON ?auto_291912 ?auto_291913 ) ( ON ?auto_291911 ?auto_291912 ) ( ON ?auto_291910 ?auto_291911 ) ( ON ?auto_291909 ?auto_291910 ) ( ON ?auto_291908 ?auto_291909 ) ( ON ?auto_291907 ?auto_291908 ) ( ON ?auto_291906 ?auto_291907 ) ( CLEAR ?auto_291904 ) ( ON ?auto_291905 ?auto_291906 ) ( CLEAR ?auto_291905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_291903 ?auto_291904 ?auto_291905 )
      ( MAKE-14PILE ?auto_291903 ?auto_291904 ?auto_291905 ?auto_291906 ?auto_291907 ?auto_291908 ?auto_291909 ?auto_291910 ?auto_291911 ?auto_291912 ?auto_291913 ?auto_291914 ?auto_291915 ?auto_291916 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291931 - BLOCK
      ?auto_291932 - BLOCK
      ?auto_291933 - BLOCK
      ?auto_291934 - BLOCK
      ?auto_291935 - BLOCK
      ?auto_291936 - BLOCK
      ?auto_291937 - BLOCK
      ?auto_291938 - BLOCK
      ?auto_291939 - BLOCK
      ?auto_291940 - BLOCK
      ?auto_291941 - BLOCK
      ?auto_291942 - BLOCK
      ?auto_291943 - BLOCK
      ?auto_291944 - BLOCK
    )
    :vars
    (
      ?auto_291945 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_291944 ?auto_291945 ) ( ON-TABLE ?auto_291931 ) ( not ( = ?auto_291931 ?auto_291932 ) ) ( not ( = ?auto_291931 ?auto_291933 ) ) ( not ( = ?auto_291931 ?auto_291934 ) ) ( not ( = ?auto_291931 ?auto_291935 ) ) ( not ( = ?auto_291931 ?auto_291936 ) ) ( not ( = ?auto_291931 ?auto_291937 ) ) ( not ( = ?auto_291931 ?auto_291938 ) ) ( not ( = ?auto_291931 ?auto_291939 ) ) ( not ( = ?auto_291931 ?auto_291940 ) ) ( not ( = ?auto_291931 ?auto_291941 ) ) ( not ( = ?auto_291931 ?auto_291942 ) ) ( not ( = ?auto_291931 ?auto_291943 ) ) ( not ( = ?auto_291931 ?auto_291944 ) ) ( not ( = ?auto_291931 ?auto_291945 ) ) ( not ( = ?auto_291932 ?auto_291933 ) ) ( not ( = ?auto_291932 ?auto_291934 ) ) ( not ( = ?auto_291932 ?auto_291935 ) ) ( not ( = ?auto_291932 ?auto_291936 ) ) ( not ( = ?auto_291932 ?auto_291937 ) ) ( not ( = ?auto_291932 ?auto_291938 ) ) ( not ( = ?auto_291932 ?auto_291939 ) ) ( not ( = ?auto_291932 ?auto_291940 ) ) ( not ( = ?auto_291932 ?auto_291941 ) ) ( not ( = ?auto_291932 ?auto_291942 ) ) ( not ( = ?auto_291932 ?auto_291943 ) ) ( not ( = ?auto_291932 ?auto_291944 ) ) ( not ( = ?auto_291932 ?auto_291945 ) ) ( not ( = ?auto_291933 ?auto_291934 ) ) ( not ( = ?auto_291933 ?auto_291935 ) ) ( not ( = ?auto_291933 ?auto_291936 ) ) ( not ( = ?auto_291933 ?auto_291937 ) ) ( not ( = ?auto_291933 ?auto_291938 ) ) ( not ( = ?auto_291933 ?auto_291939 ) ) ( not ( = ?auto_291933 ?auto_291940 ) ) ( not ( = ?auto_291933 ?auto_291941 ) ) ( not ( = ?auto_291933 ?auto_291942 ) ) ( not ( = ?auto_291933 ?auto_291943 ) ) ( not ( = ?auto_291933 ?auto_291944 ) ) ( not ( = ?auto_291933 ?auto_291945 ) ) ( not ( = ?auto_291934 ?auto_291935 ) ) ( not ( = ?auto_291934 ?auto_291936 ) ) ( not ( = ?auto_291934 ?auto_291937 ) ) ( not ( = ?auto_291934 ?auto_291938 ) ) ( not ( = ?auto_291934 ?auto_291939 ) ) ( not ( = ?auto_291934 ?auto_291940 ) ) ( not ( = ?auto_291934 ?auto_291941 ) ) ( not ( = ?auto_291934 ?auto_291942 ) ) ( not ( = ?auto_291934 ?auto_291943 ) ) ( not ( = ?auto_291934 ?auto_291944 ) ) ( not ( = ?auto_291934 ?auto_291945 ) ) ( not ( = ?auto_291935 ?auto_291936 ) ) ( not ( = ?auto_291935 ?auto_291937 ) ) ( not ( = ?auto_291935 ?auto_291938 ) ) ( not ( = ?auto_291935 ?auto_291939 ) ) ( not ( = ?auto_291935 ?auto_291940 ) ) ( not ( = ?auto_291935 ?auto_291941 ) ) ( not ( = ?auto_291935 ?auto_291942 ) ) ( not ( = ?auto_291935 ?auto_291943 ) ) ( not ( = ?auto_291935 ?auto_291944 ) ) ( not ( = ?auto_291935 ?auto_291945 ) ) ( not ( = ?auto_291936 ?auto_291937 ) ) ( not ( = ?auto_291936 ?auto_291938 ) ) ( not ( = ?auto_291936 ?auto_291939 ) ) ( not ( = ?auto_291936 ?auto_291940 ) ) ( not ( = ?auto_291936 ?auto_291941 ) ) ( not ( = ?auto_291936 ?auto_291942 ) ) ( not ( = ?auto_291936 ?auto_291943 ) ) ( not ( = ?auto_291936 ?auto_291944 ) ) ( not ( = ?auto_291936 ?auto_291945 ) ) ( not ( = ?auto_291937 ?auto_291938 ) ) ( not ( = ?auto_291937 ?auto_291939 ) ) ( not ( = ?auto_291937 ?auto_291940 ) ) ( not ( = ?auto_291937 ?auto_291941 ) ) ( not ( = ?auto_291937 ?auto_291942 ) ) ( not ( = ?auto_291937 ?auto_291943 ) ) ( not ( = ?auto_291937 ?auto_291944 ) ) ( not ( = ?auto_291937 ?auto_291945 ) ) ( not ( = ?auto_291938 ?auto_291939 ) ) ( not ( = ?auto_291938 ?auto_291940 ) ) ( not ( = ?auto_291938 ?auto_291941 ) ) ( not ( = ?auto_291938 ?auto_291942 ) ) ( not ( = ?auto_291938 ?auto_291943 ) ) ( not ( = ?auto_291938 ?auto_291944 ) ) ( not ( = ?auto_291938 ?auto_291945 ) ) ( not ( = ?auto_291939 ?auto_291940 ) ) ( not ( = ?auto_291939 ?auto_291941 ) ) ( not ( = ?auto_291939 ?auto_291942 ) ) ( not ( = ?auto_291939 ?auto_291943 ) ) ( not ( = ?auto_291939 ?auto_291944 ) ) ( not ( = ?auto_291939 ?auto_291945 ) ) ( not ( = ?auto_291940 ?auto_291941 ) ) ( not ( = ?auto_291940 ?auto_291942 ) ) ( not ( = ?auto_291940 ?auto_291943 ) ) ( not ( = ?auto_291940 ?auto_291944 ) ) ( not ( = ?auto_291940 ?auto_291945 ) ) ( not ( = ?auto_291941 ?auto_291942 ) ) ( not ( = ?auto_291941 ?auto_291943 ) ) ( not ( = ?auto_291941 ?auto_291944 ) ) ( not ( = ?auto_291941 ?auto_291945 ) ) ( not ( = ?auto_291942 ?auto_291943 ) ) ( not ( = ?auto_291942 ?auto_291944 ) ) ( not ( = ?auto_291942 ?auto_291945 ) ) ( not ( = ?auto_291943 ?auto_291944 ) ) ( not ( = ?auto_291943 ?auto_291945 ) ) ( not ( = ?auto_291944 ?auto_291945 ) ) ( ON ?auto_291943 ?auto_291944 ) ( ON ?auto_291942 ?auto_291943 ) ( ON ?auto_291941 ?auto_291942 ) ( ON ?auto_291940 ?auto_291941 ) ( ON ?auto_291939 ?auto_291940 ) ( ON ?auto_291938 ?auto_291939 ) ( ON ?auto_291937 ?auto_291938 ) ( ON ?auto_291936 ?auto_291937 ) ( ON ?auto_291935 ?auto_291936 ) ( ON ?auto_291934 ?auto_291935 ) ( ON ?auto_291933 ?auto_291934 ) ( CLEAR ?auto_291931 ) ( ON ?auto_291932 ?auto_291933 ) ( CLEAR ?auto_291932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_291931 ?auto_291932 )
      ( MAKE-14PILE ?auto_291931 ?auto_291932 ?auto_291933 ?auto_291934 ?auto_291935 ?auto_291936 ?auto_291937 ?auto_291938 ?auto_291939 ?auto_291940 ?auto_291941 ?auto_291942 ?auto_291943 ?auto_291944 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291960 - BLOCK
      ?auto_291961 - BLOCK
      ?auto_291962 - BLOCK
      ?auto_291963 - BLOCK
      ?auto_291964 - BLOCK
      ?auto_291965 - BLOCK
      ?auto_291966 - BLOCK
      ?auto_291967 - BLOCK
      ?auto_291968 - BLOCK
      ?auto_291969 - BLOCK
      ?auto_291970 - BLOCK
      ?auto_291971 - BLOCK
      ?auto_291972 - BLOCK
      ?auto_291973 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_291973 ) ( ON-TABLE ?auto_291960 ) ( not ( = ?auto_291960 ?auto_291961 ) ) ( not ( = ?auto_291960 ?auto_291962 ) ) ( not ( = ?auto_291960 ?auto_291963 ) ) ( not ( = ?auto_291960 ?auto_291964 ) ) ( not ( = ?auto_291960 ?auto_291965 ) ) ( not ( = ?auto_291960 ?auto_291966 ) ) ( not ( = ?auto_291960 ?auto_291967 ) ) ( not ( = ?auto_291960 ?auto_291968 ) ) ( not ( = ?auto_291960 ?auto_291969 ) ) ( not ( = ?auto_291960 ?auto_291970 ) ) ( not ( = ?auto_291960 ?auto_291971 ) ) ( not ( = ?auto_291960 ?auto_291972 ) ) ( not ( = ?auto_291960 ?auto_291973 ) ) ( not ( = ?auto_291961 ?auto_291962 ) ) ( not ( = ?auto_291961 ?auto_291963 ) ) ( not ( = ?auto_291961 ?auto_291964 ) ) ( not ( = ?auto_291961 ?auto_291965 ) ) ( not ( = ?auto_291961 ?auto_291966 ) ) ( not ( = ?auto_291961 ?auto_291967 ) ) ( not ( = ?auto_291961 ?auto_291968 ) ) ( not ( = ?auto_291961 ?auto_291969 ) ) ( not ( = ?auto_291961 ?auto_291970 ) ) ( not ( = ?auto_291961 ?auto_291971 ) ) ( not ( = ?auto_291961 ?auto_291972 ) ) ( not ( = ?auto_291961 ?auto_291973 ) ) ( not ( = ?auto_291962 ?auto_291963 ) ) ( not ( = ?auto_291962 ?auto_291964 ) ) ( not ( = ?auto_291962 ?auto_291965 ) ) ( not ( = ?auto_291962 ?auto_291966 ) ) ( not ( = ?auto_291962 ?auto_291967 ) ) ( not ( = ?auto_291962 ?auto_291968 ) ) ( not ( = ?auto_291962 ?auto_291969 ) ) ( not ( = ?auto_291962 ?auto_291970 ) ) ( not ( = ?auto_291962 ?auto_291971 ) ) ( not ( = ?auto_291962 ?auto_291972 ) ) ( not ( = ?auto_291962 ?auto_291973 ) ) ( not ( = ?auto_291963 ?auto_291964 ) ) ( not ( = ?auto_291963 ?auto_291965 ) ) ( not ( = ?auto_291963 ?auto_291966 ) ) ( not ( = ?auto_291963 ?auto_291967 ) ) ( not ( = ?auto_291963 ?auto_291968 ) ) ( not ( = ?auto_291963 ?auto_291969 ) ) ( not ( = ?auto_291963 ?auto_291970 ) ) ( not ( = ?auto_291963 ?auto_291971 ) ) ( not ( = ?auto_291963 ?auto_291972 ) ) ( not ( = ?auto_291963 ?auto_291973 ) ) ( not ( = ?auto_291964 ?auto_291965 ) ) ( not ( = ?auto_291964 ?auto_291966 ) ) ( not ( = ?auto_291964 ?auto_291967 ) ) ( not ( = ?auto_291964 ?auto_291968 ) ) ( not ( = ?auto_291964 ?auto_291969 ) ) ( not ( = ?auto_291964 ?auto_291970 ) ) ( not ( = ?auto_291964 ?auto_291971 ) ) ( not ( = ?auto_291964 ?auto_291972 ) ) ( not ( = ?auto_291964 ?auto_291973 ) ) ( not ( = ?auto_291965 ?auto_291966 ) ) ( not ( = ?auto_291965 ?auto_291967 ) ) ( not ( = ?auto_291965 ?auto_291968 ) ) ( not ( = ?auto_291965 ?auto_291969 ) ) ( not ( = ?auto_291965 ?auto_291970 ) ) ( not ( = ?auto_291965 ?auto_291971 ) ) ( not ( = ?auto_291965 ?auto_291972 ) ) ( not ( = ?auto_291965 ?auto_291973 ) ) ( not ( = ?auto_291966 ?auto_291967 ) ) ( not ( = ?auto_291966 ?auto_291968 ) ) ( not ( = ?auto_291966 ?auto_291969 ) ) ( not ( = ?auto_291966 ?auto_291970 ) ) ( not ( = ?auto_291966 ?auto_291971 ) ) ( not ( = ?auto_291966 ?auto_291972 ) ) ( not ( = ?auto_291966 ?auto_291973 ) ) ( not ( = ?auto_291967 ?auto_291968 ) ) ( not ( = ?auto_291967 ?auto_291969 ) ) ( not ( = ?auto_291967 ?auto_291970 ) ) ( not ( = ?auto_291967 ?auto_291971 ) ) ( not ( = ?auto_291967 ?auto_291972 ) ) ( not ( = ?auto_291967 ?auto_291973 ) ) ( not ( = ?auto_291968 ?auto_291969 ) ) ( not ( = ?auto_291968 ?auto_291970 ) ) ( not ( = ?auto_291968 ?auto_291971 ) ) ( not ( = ?auto_291968 ?auto_291972 ) ) ( not ( = ?auto_291968 ?auto_291973 ) ) ( not ( = ?auto_291969 ?auto_291970 ) ) ( not ( = ?auto_291969 ?auto_291971 ) ) ( not ( = ?auto_291969 ?auto_291972 ) ) ( not ( = ?auto_291969 ?auto_291973 ) ) ( not ( = ?auto_291970 ?auto_291971 ) ) ( not ( = ?auto_291970 ?auto_291972 ) ) ( not ( = ?auto_291970 ?auto_291973 ) ) ( not ( = ?auto_291971 ?auto_291972 ) ) ( not ( = ?auto_291971 ?auto_291973 ) ) ( not ( = ?auto_291972 ?auto_291973 ) ) ( ON ?auto_291972 ?auto_291973 ) ( ON ?auto_291971 ?auto_291972 ) ( ON ?auto_291970 ?auto_291971 ) ( ON ?auto_291969 ?auto_291970 ) ( ON ?auto_291968 ?auto_291969 ) ( ON ?auto_291967 ?auto_291968 ) ( ON ?auto_291966 ?auto_291967 ) ( ON ?auto_291965 ?auto_291966 ) ( ON ?auto_291964 ?auto_291965 ) ( ON ?auto_291963 ?auto_291964 ) ( ON ?auto_291962 ?auto_291963 ) ( CLEAR ?auto_291960 ) ( ON ?auto_291961 ?auto_291962 ) ( CLEAR ?auto_291961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_291960 ?auto_291961 )
      ( MAKE-14PILE ?auto_291960 ?auto_291961 ?auto_291962 ?auto_291963 ?auto_291964 ?auto_291965 ?auto_291966 ?auto_291967 ?auto_291968 ?auto_291969 ?auto_291970 ?auto_291971 ?auto_291972 ?auto_291973 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291988 - BLOCK
      ?auto_291989 - BLOCK
      ?auto_291990 - BLOCK
      ?auto_291991 - BLOCK
      ?auto_291992 - BLOCK
      ?auto_291993 - BLOCK
      ?auto_291994 - BLOCK
      ?auto_291995 - BLOCK
      ?auto_291996 - BLOCK
      ?auto_291997 - BLOCK
      ?auto_291998 - BLOCK
      ?auto_291999 - BLOCK
      ?auto_292000 - BLOCK
      ?auto_292001 - BLOCK
    )
    :vars
    (
      ?auto_292002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_292001 ?auto_292002 ) ( not ( = ?auto_291988 ?auto_291989 ) ) ( not ( = ?auto_291988 ?auto_291990 ) ) ( not ( = ?auto_291988 ?auto_291991 ) ) ( not ( = ?auto_291988 ?auto_291992 ) ) ( not ( = ?auto_291988 ?auto_291993 ) ) ( not ( = ?auto_291988 ?auto_291994 ) ) ( not ( = ?auto_291988 ?auto_291995 ) ) ( not ( = ?auto_291988 ?auto_291996 ) ) ( not ( = ?auto_291988 ?auto_291997 ) ) ( not ( = ?auto_291988 ?auto_291998 ) ) ( not ( = ?auto_291988 ?auto_291999 ) ) ( not ( = ?auto_291988 ?auto_292000 ) ) ( not ( = ?auto_291988 ?auto_292001 ) ) ( not ( = ?auto_291988 ?auto_292002 ) ) ( not ( = ?auto_291989 ?auto_291990 ) ) ( not ( = ?auto_291989 ?auto_291991 ) ) ( not ( = ?auto_291989 ?auto_291992 ) ) ( not ( = ?auto_291989 ?auto_291993 ) ) ( not ( = ?auto_291989 ?auto_291994 ) ) ( not ( = ?auto_291989 ?auto_291995 ) ) ( not ( = ?auto_291989 ?auto_291996 ) ) ( not ( = ?auto_291989 ?auto_291997 ) ) ( not ( = ?auto_291989 ?auto_291998 ) ) ( not ( = ?auto_291989 ?auto_291999 ) ) ( not ( = ?auto_291989 ?auto_292000 ) ) ( not ( = ?auto_291989 ?auto_292001 ) ) ( not ( = ?auto_291989 ?auto_292002 ) ) ( not ( = ?auto_291990 ?auto_291991 ) ) ( not ( = ?auto_291990 ?auto_291992 ) ) ( not ( = ?auto_291990 ?auto_291993 ) ) ( not ( = ?auto_291990 ?auto_291994 ) ) ( not ( = ?auto_291990 ?auto_291995 ) ) ( not ( = ?auto_291990 ?auto_291996 ) ) ( not ( = ?auto_291990 ?auto_291997 ) ) ( not ( = ?auto_291990 ?auto_291998 ) ) ( not ( = ?auto_291990 ?auto_291999 ) ) ( not ( = ?auto_291990 ?auto_292000 ) ) ( not ( = ?auto_291990 ?auto_292001 ) ) ( not ( = ?auto_291990 ?auto_292002 ) ) ( not ( = ?auto_291991 ?auto_291992 ) ) ( not ( = ?auto_291991 ?auto_291993 ) ) ( not ( = ?auto_291991 ?auto_291994 ) ) ( not ( = ?auto_291991 ?auto_291995 ) ) ( not ( = ?auto_291991 ?auto_291996 ) ) ( not ( = ?auto_291991 ?auto_291997 ) ) ( not ( = ?auto_291991 ?auto_291998 ) ) ( not ( = ?auto_291991 ?auto_291999 ) ) ( not ( = ?auto_291991 ?auto_292000 ) ) ( not ( = ?auto_291991 ?auto_292001 ) ) ( not ( = ?auto_291991 ?auto_292002 ) ) ( not ( = ?auto_291992 ?auto_291993 ) ) ( not ( = ?auto_291992 ?auto_291994 ) ) ( not ( = ?auto_291992 ?auto_291995 ) ) ( not ( = ?auto_291992 ?auto_291996 ) ) ( not ( = ?auto_291992 ?auto_291997 ) ) ( not ( = ?auto_291992 ?auto_291998 ) ) ( not ( = ?auto_291992 ?auto_291999 ) ) ( not ( = ?auto_291992 ?auto_292000 ) ) ( not ( = ?auto_291992 ?auto_292001 ) ) ( not ( = ?auto_291992 ?auto_292002 ) ) ( not ( = ?auto_291993 ?auto_291994 ) ) ( not ( = ?auto_291993 ?auto_291995 ) ) ( not ( = ?auto_291993 ?auto_291996 ) ) ( not ( = ?auto_291993 ?auto_291997 ) ) ( not ( = ?auto_291993 ?auto_291998 ) ) ( not ( = ?auto_291993 ?auto_291999 ) ) ( not ( = ?auto_291993 ?auto_292000 ) ) ( not ( = ?auto_291993 ?auto_292001 ) ) ( not ( = ?auto_291993 ?auto_292002 ) ) ( not ( = ?auto_291994 ?auto_291995 ) ) ( not ( = ?auto_291994 ?auto_291996 ) ) ( not ( = ?auto_291994 ?auto_291997 ) ) ( not ( = ?auto_291994 ?auto_291998 ) ) ( not ( = ?auto_291994 ?auto_291999 ) ) ( not ( = ?auto_291994 ?auto_292000 ) ) ( not ( = ?auto_291994 ?auto_292001 ) ) ( not ( = ?auto_291994 ?auto_292002 ) ) ( not ( = ?auto_291995 ?auto_291996 ) ) ( not ( = ?auto_291995 ?auto_291997 ) ) ( not ( = ?auto_291995 ?auto_291998 ) ) ( not ( = ?auto_291995 ?auto_291999 ) ) ( not ( = ?auto_291995 ?auto_292000 ) ) ( not ( = ?auto_291995 ?auto_292001 ) ) ( not ( = ?auto_291995 ?auto_292002 ) ) ( not ( = ?auto_291996 ?auto_291997 ) ) ( not ( = ?auto_291996 ?auto_291998 ) ) ( not ( = ?auto_291996 ?auto_291999 ) ) ( not ( = ?auto_291996 ?auto_292000 ) ) ( not ( = ?auto_291996 ?auto_292001 ) ) ( not ( = ?auto_291996 ?auto_292002 ) ) ( not ( = ?auto_291997 ?auto_291998 ) ) ( not ( = ?auto_291997 ?auto_291999 ) ) ( not ( = ?auto_291997 ?auto_292000 ) ) ( not ( = ?auto_291997 ?auto_292001 ) ) ( not ( = ?auto_291997 ?auto_292002 ) ) ( not ( = ?auto_291998 ?auto_291999 ) ) ( not ( = ?auto_291998 ?auto_292000 ) ) ( not ( = ?auto_291998 ?auto_292001 ) ) ( not ( = ?auto_291998 ?auto_292002 ) ) ( not ( = ?auto_291999 ?auto_292000 ) ) ( not ( = ?auto_291999 ?auto_292001 ) ) ( not ( = ?auto_291999 ?auto_292002 ) ) ( not ( = ?auto_292000 ?auto_292001 ) ) ( not ( = ?auto_292000 ?auto_292002 ) ) ( not ( = ?auto_292001 ?auto_292002 ) ) ( ON ?auto_292000 ?auto_292001 ) ( ON ?auto_291999 ?auto_292000 ) ( ON ?auto_291998 ?auto_291999 ) ( ON ?auto_291997 ?auto_291998 ) ( ON ?auto_291996 ?auto_291997 ) ( ON ?auto_291995 ?auto_291996 ) ( ON ?auto_291994 ?auto_291995 ) ( ON ?auto_291993 ?auto_291994 ) ( ON ?auto_291992 ?auto_291993 ) ( ON ?auto_291991 ?auto_291992 ) ( ON ?auto_291990 ?auto_291991 ) ( ON ?auto_291989 ?auto_291990 ) ( ON ?auto_291988 ?auto_291989 ) ( CLEAR ?auto_291988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_291988 )
      ( MAKE-14PILE ?auto_291988 ?auto_291989 ?auto_291990 ?auto_291991 ?auto_291992 ?auto_291993 ?auto_291994 ?auto_291995 ?auto_291996 ?auto_291997 ?auto_291998 ?auto_291999 ?auto_292000 ?auto_292001 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_292017 - BLOCK
      ?auto_292018 - BLOCK
      ?auto_292019 - BLOCK
      ?auto_292020 - BLOCK
      ?auto_292021 - BLOCK
      ?auto_292022 - BLOCK
      ?auto_292023 - BLOCK
      ?auto_292024 - BLOCK
      ?auto_292025 - BLOCK
      ?auto_292026 - BLOCK
      ?auto_292027 - BLOCK
      ?auto_292028 - BLOCK
      ?auto_292029 - BLOCK
      ?auto_292030 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_292030 ) ( not ( = ?auto_292017 ?auto_292018 ) ) ( not ( = ?auto_292017 ?auto_292019 ) ) ( not ( = ?auto_292017 ?auto_292020 ) ) ( not ( = ?auto_292017 ?auto_292021 ) ) ( not ( = ?auto_292017 ?auto_292022 ) ) ( not ( = ?auto_292017 ?auto_292023 ) ) ( not ( = ?auto_292017 ?auto_292024 ) ) ( not ( = ?auto_292017 ?auto_292025 ) ) ( not ( = ?auto_292017 ?auto_292026 ) ) ( not ( = ?auto_292017 ?auto_292027 ) ) ( not ( = ?auto_292017 ?auto_292028 ) ) ( not ( = ?auto_292017 ?auto_292029 ) ) ( not ( = ?auto_292017 ?auto_292030 ) ) ( not ( = ?auto_292018 ?auto_292019 ) ) ( not ( = ?auto_292018 ?auto_292020 ) ) ( not ( = ?auto_292018 ?auto_292021 ) ) ( not ( = ?auto_292018 ?auto_292022 ) ) ( not ( = ?auto_292018 ?auto_292023 ) ) ( not ( = ?auto_292018 ?auto_292024 ) ) ( not ( = ?auto_292018 ?auto_292025 ) ) ( not ( = ?auto_292018 ?auto_292026 ) ) ( not ( = ?auto_292018 ?auto_292027 ) ) ( not ( = ?auto_292018 ?auto_292028 ) ) ( not ( = ?auto_292018 ?auto_292029 ) ) ( not ( = ?auto_292018 ?auto_292030 ) ) ( not ( = ?auto_292019 ?auto_292020 ) ) ( not ( = ?auto_292019 ?auto_292021 ) ) ( not ( = ?auto_292019 ?auto_292022 ) ) ( not ( = ?auto_292019 ?auto_292023 ) ) ( not ( = ?auto_292019 ?auto_292024 ) ) ( not ( = ?auto_292019 ?auto_292025 ) ) ( not ( = ?auto_292019 ?auto_292026 ) ) ( not ( = ?auto_292019 ?auto_292027 ) ) ( not ( = ?auto_292019 ?auto_292028 ) ) ( not ( = ?auto_292019 ?auto_292029 ) ) ( not ( = ?auto_292019 ?auto_292030 ) ) ( not ( = ?auto_292020 ?auto_292021 ) ) ( not ( = ?auto_292020 ?auto_292022 ) ) ( not ( = ?auto_292020 ?auto_292023 ) ) ( not ( = ?auto_292020 ?auto_292024 ) ) ( not ( = ?auto_292020 ?auto_292025 ) ) ( not ( = ?auto_292020 ?auto_292026 ) ) ( not ( = ?auto_292020 ?auto_292027 ) ) ( not ( = ?auto_292020 ?auto_292028 ) ) ( not ( = ?auto_292020 ?auto_292029 ) ) ( not ( = ?auto_292020 ?auto_292030 ) ) ( not ( = ?auto_292021 ?auto_292022 ) ) ( not ( = ?auto_292021 ?auto_292023 ) ) ( not ( = ?auto_292021 ?auto_292024 ) ) ( not ( = ?auto_292021 ?auto_292025 ) ) ( not ( = ?auto_292021 ?auto_292026 ) ) ( not ( = ?auto_292021 ?auto_292027 ) ) ( not ( = ?auto_292021 ?auto_292028 ) ) ( not ( = ?auto_292021 ?auto_292029 ) ) ( not ( = ?auto_292021 ?auto_292030 ) ) ( not ( = ?auto_292022 ?auto_292023 ) ) ( not ( = ?auto_292022 ?auto_292024 ) ) ( not ( = ?auto_292022 ?auto_292025 ) ) ( not ( = ?auto_292022 ?auto_292026 ) ) ( not ( = ?auto_292022 ?auto_292027 ) ) ( not ( = ?auto_292022 ?auto_292028 ) ) ( not ( = ?auto_292022 ?auto_292029 ) ) ( not ( = ?auto_292022 ?auto_292030 ) ) ( not ( = ?auto_292023 ?auto_292024 ) ) ( not ( = ?auto_292023 ?auto_292025 ) ) ( not ( = ?auto_292023 ?auto_292026 ) ) ( not ( = ?auto_292023 ?auto_292027 ) ) ( not ( = ?auto_292023 ?auto_292028 ) ) ( not ( = ?auto_292023 ?auto_292029 ) ) ( not ( = ?auto_292023 ?auto_292030 ) ) ( not ( = ?auto_292024 ?auto_292025 ) ) ( not ( = ?auto_292024 ?auto_292026 ) ) ( not ( = ?auto_292024 ?auto_292027 ) ) ( not ( = ?auto_292024 ?auto_292028 ) ) ( not ( = ?auto_292024 ?auto_292029 ) ) ( not ( = ?auto_292024 ?auto_292030 ) ) ( not ( = ?auto_292025 ?auto_292026 ) ) ( not ( = ?auto_292025 ?auto_292027 ) ) ( not ( = ?auto_292025 ?auto_292028 ) ) ( not ( = ?auto_292025 ?auto_292029 ) ) ( not ( = ?auto_292025 ?auto_292030 ) ) ( not ( = ?auto_292026 ?auto_292027 ) ) ( not ( = ?auto_292026 ?auto_292028 ) ) ( not ( = ?auto_292026 ?auto_292029 ) ) ( not ( = ?auto_292026 ?auto_292030 ) ) ( not ( = ?auto_292027 ?auto_292028 ) ) ( not ( = ?auto_292027 ?auto_292029 ) ) ( not ( = ?auto_292027 ?auto_292030 ) ) ( not ( = ?auto_292028 ?auto_292029 ) ) ( not ( = ?auto_292028 ?auto_292030 ) ) ( not ( = ?auto_292029 ?auto_292030 ) ) ( ON ?auto_292029 ?auto_292030 ) ( ON ?auto_292028 ?auto_292029 ) ( ON ?auto_292027 ?auto_292028 ) ( ON ?auto_292026 ?auto_292027 ) ( ON ?auto_292025 ?auto_292026 ) ( ON ?auto_292024 ?auto_292025 ) ( ON ?auto_292023 ?auto_292024 ) ( ON ?auto_292022 ?auto_292023 ) ( ON ?auto_292021 ?auto_292022 ) ( ON ?auto_292020 ?auto_292021 ) ( ON ?auto_292019 ?auto_292020 ) ( ON ?auto_292018 ?auto_292019 ) ( ON ?auto_292017 ?auto_292018 ) ( CLEAR ?auto_292017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_292017 )
      ( MAKE-14PILE ?auto_292017 ?auto_292018 ?auto_292019 ?auto_292020 ?auto_292021 ?auto_292022 ?auto_292023 ?auto_292024 ?auto_292025 ?auto_292026 ?auto_292027 ?auto_292028 ?auto_292029 ?auto_292030 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_292045 - BLOCK
      ?auto_292046 - BLOCK
      ?auto_292047 - BLOCK
      ?auto_292048 - BLOCK
      ?auto_292049 - BLOCK
      ?auto_292050 - BLOCK
      ?auto_292051 - BLOCK
      ?auto_292052 - BLOCK
      ?auto_292053 - BLOCK
      ?auto_292054 - BLOCK
      ?auto_292055 - BLOCK
      ?auto_292056 - BLOCK
      ?auto_292057 - BLOCK
      ?auto_292058 - BLOCK
    )
    :vars
    (
      ?auto_292059 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_292045 ?auto_292046 ) ) ( not ( = ?auto_292045 ?auto_292047 ) ) ( not ( = ?auto_292045 ?auto_292048 ) ) ( not ( = ?auto_292045 ?auto_292049 ) ) ( not ( = ?auto_292045 ?auto_292050 ) ) ( not ( = ?auto_292045 ?auto_292051 ) ) ( not ( = ?auto_292045 ?auto_292052 ) ) ( not ( = ?auto_292045 ?auto_292053 ) ) ( not ( = ?auto_292045 ?auto_292054 ) ) ( not ( = ?auto_292045 ?auto_292055 ) ) ( not ( = ?auto_292045 ?auto_292056 ) ) ( not ( = ?auto_292045 ?auto_292057 ) ) ( not ( = ?auto_292045 ?auto_292058 ) ) ( not ( = ?auto_292046 ?auto_292047 ) ) ( not ( = ?auto_292046 ?auto_292048 ) ) ( not ( = ?auto_292046 ?auto_292049 ) ) ( not ( = ?auto_292046 ?auto_292050 ) ) ( not ( = ?auto_292046 ?auto_292051 ) ) ( not ( = ?auto_292046 ?auto_292052 ) ) ( not ( = ?auto_292046 ?auto_292053 ) ) ( not ( = ?auto_292046 ?auto_292054 ) ) ( not ( = ?auto_292046 ?auto_292055 ) ) ( not ( = ?auto_292046 ?auto_292056 ) ) ( not ( = ?auto_292046 ?auto_292057 ) ) ( not ( = ?auto_292046 ?auto_292058 ) ) ( not ( = ?auto_292047 ?auto_292048 ) ) ( not ( = ?auto_292047 ?auto_292049 ) ) ( not ( = ?auto_292047 ?auto_292050 ) ) ( not ( = ?auto_292047 ?auto_292051 ) ) ( not ( = ?auto_292047 ?auto_292052 ) ) ( not ( = ?auto_292047 ?auto_292053 ) ) ( not ( = ?auto_292047 ?auto_292054 ) ) ( not ( = ?auto_292047 ?auto_292055 ) ) ( not ( = ?auto_292047 ?auto_292056 ) ) ( not ( = ?auto_292047 ?auto_292057 ) ) ( not ( = ?auto_292047 ?auto_292058 ) ) ( not ( = ?auto_292048 ?auto_292049 ) ) ( not ( = ?auto_292048 ?auto_292050 ) ) ( not ( = ?auto_292048 ?auto_292051 ) ) ( not ( = ?auto_292048 ?auto_292052 ) ) ( not ( = ?auto_292048 ?auto_292053 ) ) ( not ( = ?auto_292048 ?auto_292054 ) ) ( not ( = ?auto_292048 ?auto_292055 ) ) ( not ( = ?auto_292048 ?auto_292056 ) ) ( not ( = ?auto_292048 ?auto_292057 ) ) ( not ( = ?auto_292048 ?auto_292058 ) ) ( not ( = ?auto_292049 ?auto_292050 ) ) ( not ( = ?auto_292049 ?auto_292051 ) ) ( not ( = ?auto_292049 ?auto_292052 ) ) ( not ( = ?auto_292049 ?auto_292053 ) ) ( not ( = ?auto_292049 ?auto_292054 ) ) ( not ( = ?auto_292049 ?auto_292055 ) ) ( not ( = ?auto_292049 ?auto_292056 ) ) ( not ( = ?auto_292049 ?auto_292057 ) ) ( not ( = ?auto_292049 ?auto_292058 ) ) ( not ( = ?auto_292050 ?auto_292051 ) ) ( not ( = ?auto_292050 ?auto_292052 ) ) ( not ( = ?auto_292050 ?auto_292053 ) ) ( not ( = ?auto_292050 ?auto_292054 ) ) ( not ( = ?auto_292050 ?auto_292055 ) ) ( not ( = ?auto_292050 ?auto_292056 ) ) ( not ( = ?auto_292050 ?auto_292057 ) ) ( not ( = ?auto_292050 ?auto_292058 ) ) ( not ( = ?auto_292051 ?auto_292052 ) ) ( not ( = ?auto_292051 ?auto_292053 ) ) ( not ( = ?auto_292051 ?auto_292054 ) ) ( not ( = ?auto_292051 ?auto_292055 ) ) ( not ( = ?auto_292051 ?auto_292056 ) ) ( not ( = ?auto_292051 ?auto_292057 ) ) ( not ( = ?auto_292051 ?auto_292058 ) ) ( not ( = ?auto_292052 ?auto_292053 ) ) ( not ( = ?auto_292052 ?auto_292054 ) ) ( not ( = ?auto_292052 ?auto_292055 ) ) ( not ( = ?auto_292052 ?auto_292056 ) ) ( not ( = ?auto_292052 ?auto_292057 ) ) ( not ( = ?auto_292052 ?auto_292058 ) ) ( not ( = ?auto_292053 ?auto_292054 ) ) ( not ( = ?auto_292053 ?auto_292055 ) ) ( not ( = ?auto_292053 ?auto_292056 ) ) ( not ( = ?auto_292053 ?auto_292057 ) ) ( not ( = ?auto_292053 ?auto_292058 ) ) ( not ( = ?auto_292054 ?auto_292055 ) ) ( not ( = ?auto_292054 ?auto_292056 ) ) ( not ( = ?auto_292054 ?auto_292057 ) ) ( not ( = ?auto_292054 ?auto_292058 ) ) ( not ( = ?auto_292055 ?auto_292056 ) ) ( not ( = ?auto_292055 ?auto_292057 ) ) ( not ( = ?auto_292055 ?auto_292058 ) ) ( not ( = ?auto_292056 ?auto_292057 ) ) ( not ( = ?auto_292056 ?auto_292058 ) ) ( not ( = ?auto_292057 ?auto_292058 ) ) ( ON ?auto_292045 ?auto_292059 ) ( not ( = ?auto_292058 ?auto_292059 ) ) ( not ( = ?auto_292057 ?auto_292059 ) ) ( not ( = ?auto_292056 ?auto_292059 ) ) ( not ( = ?auto_292055 ?auto_292059 ) ) ( not ( = ?auto_292054 ?auto_292059 ) ) ( not ( = ?auto_292053 ?auto_292059 ) ) ( not ( = ?auto_292052 ?auto_292059 ) ) ( not ( = ?auto_292051 ?auto_292059 ) ) ( not ( = ?auto_292050 ?auto_292059 ) ) ( not ( = ?auto_292049 ?auto_292059 ) ) ( not ( = ?auto_292048 ?auto_292059 ) ) ( not ( = ?auto_292047 ?auto_292059 ) ) ( not ( = ?auto_292046 ?auto_292059 ) ) ( not ( = ?auto_292045 ?auto_292059 ) ) ( ON ?auto_292046 ?auto_292045 ) ( ON ?auto_292047 ?auto_292046 ) ( ON ?auto_292048 ?auto_292047 ) ( ON ?auto_292049 ?auto_292048 ) ( ON ?auto_292050 ?auto_292049 ) ( ON ?auto_292051 ?auto_292050 ) ( ON ?auto_292052 ?auto_292051 ) ( ON ?auto_292053 ?auto_292052 ) ( ON ?auto_292054 ?auto_292053 ) ( ON ?auto_292055 ?auto_292054 ) ( ON ?auto_292056 ?auto_292055 ) ( ON ?auto_292057 ?auto_292056 ) ( ON ?auto_292058 ?auto_292057 ) ( CLEAR ?auto_292058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_292058 ?auto_292057 ?auto_292056 ?auto_292055 ?auto_292054 ?auto_292053 ?auto_292052 ?auto_292051 ?auto_292050 ?auto_292049 ?auto_292048 ?auto_292047 ?auto_292046 ?auto_292045 )
      ( MAKE-14PILE ?auto_292045 ?auto_292046 ?auto_292047 ?auto_292048 ?auto_292049 ?auto_292050 ?auto_292051 ?auto_292052 ?auto_292053 ?auto_292054 ?auto_292055 ?auto_292056 ?auto_292057 ?auto_292058 ) )
  )

)

