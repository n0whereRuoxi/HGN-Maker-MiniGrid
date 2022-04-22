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
      ?auto_15823 - BLOCK
    )
    :vars
    (
      ?auto_15824 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15823 ?auto_15824 ) ( CLEAR ?auto_15823 ) ( HAND-EMPTY ) ( not ( = ?auto_15823 ?auto_15824 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15823 ?auto_15824 )
      ( !PUTDOWN ?auto_15823 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15826 - BLOCK
    )
    :vars
    (
      ?auto_15827 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15826 ?auto_15827 ) ( CLEAR ?auto_15826 ) ( HAND-EMPTY ) ( not ( = ?auto_15826 ?auto_15827 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15826 ?auto_15827 )
      ( !PUTDOWN ?auto_15826 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15830 - BLOCK
      ?auto_15831 - BLOCK
    )
    :vars
    (
      ?auto_15832 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_15830 ) ( ON ?auto_15831 ?auto_15832 ) ( CLEAR ?auto_15831 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15830 ) ( not ( = ?auto_15830 ?auto_15831 ) ) ( not ( = ?auto_15830 ?auto_15832 ) ) ( not ( = ?auto_15831 ?auto_15832 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15831 ?auto_15832 )
      ( !STACK ?auto_15831 ?auto_15830 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15835 - BLOCK
      ?auto_15836 - BLOCK
    )
    :vars
    (
      ?auto_15837 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_15835 ) ( ON ?auto_15836 ?auto_15837 ) ( CLEAR ?auto_15836 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15835 ) ( not ( = ?auto_15835 ?auto_15836 ) ) ( not ( = ?auto_15835 ?auto_15837 ) ) ( not ( = ?auto_15836 ?auto_15837 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15836 ?auto_15837 )
      ( !STACK ?auto_15836 ?auto_15835 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15840 - BLOCK
      ?auto_15841 - BLOCK
    )
    :vars
    (
      ?auto_15842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15841 ?auto_15842 ) ( not ( = ?auto_15840 ?auto_15841 ) ) ( not ( = ?auto_15840 ?auto_15842 ) ) ( not ( = ?auto_15841 ?auto_15842 ) ) ( ON ?auto_15840 ?auto_15841 ) ( CLEAR ?auto_15840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15840 )
      ( MAKE-2PILE ?auto_15840 ?auto_15841 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15845 - BLOCK
      ?auto_15846 - BLOCK
    )
    :vars
    (
      ?auto_15847 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15846 ?auto_15847 ) ( not ( = ?auto_15845 ?auto_15846 ) ) ( not ( = ?auto_15845 ?auto_15847 ) ) ( not ( = ?auto_15846 ?auto_15847 ) ) ( ON ?auto_15845 ?auto_15846 ) ( CLEAR ?auto_15845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15845 )
      ( MAKE-2PILE ?auto_15845 ?auto_15846 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15851 - BLOCK
      ?auto_15852 - BLOCK
      ?auto_15853 - BLOCK
    )
    :vars
    (
      ?auto_15854 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_15852 ) ( ON ?auto_15853 ?auto_15854 ) ( CLEAR ?auto_15853 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15851 ) ( ON ?auto_15852 ?auto_15851 ) ( not ( = ?auto_15851 ?auto_15852 ) ) ( not ( = ?auto_15851 ?auto_15853 ) ) ( not ( = ?auto_15851 ?auto_15854 ) ) ( not ( = ?auto_15852 ?auto_15853 ) ) ( not ( = ?auto_15852 ?auto_15854 ) ) ( not ( = ?auto_15853 ?auto_15854 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15853 ?auto_15854 )
      ( !STACK ?auto_15853 ?auto_15852 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15858 - BLOCK
      ?auto_15859 - BLOCK
      ?auto_15860 - BLOCK
    )
    :vars
    (
      ?auto_15861 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_15859 ) ( ON ?auto_15860 ?auto_15861 ) ( CLEAR ?auto_15860 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15858 ) ( ON ?auto_15859 ?auto_15858 ) ( not ( = ?auto_15858 ?auto_15859 ) ) ( not ( = ?auto_15858 ?auto_15860 ) ) ( not ( = ?auto_15858 ?auto_15861 ) ) ( not ( = ?auto_15859 ?auto_15860 ) ) ( not ( = ?auto_15859 ?auto_15861 ) ) ( not ( = ?auto_15860 ?auto_15861 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15860 ?auto_15861 )
      ( !STACK ?auto_15860 ?auto_15859 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15865 - BLOCK
      ?auto_15866 - BLOCK
      ?auto_15867 - BLOCK
    )
    :vars
    (
      ?auto_15868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15867 ?auto_15868 ) ( ON-TABLE ?auto_15865 ) ( not ( = ?auto_15865 ?auto_15866 ) ) ( not ( = ?auto_15865 ?auto_15867 ) ) ( not ( = ?auto_15865 ?auto_15868 ) ) ( not ( = ?auto_15866 ?auto_15867 ) ) ( not ( = ?auto_15866 ?auto_15868 ) ) ( not ( = ?auto_15867 ?auto_15868 ) ) ( CLEAR ?auto_15865 ) ( ON ?auto_15866 ?auto_15867 ) ( CLEAR ?auto_15866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15865 ?auto_15866 )
      ( MAKE-3PILE ?auto_15865 ?auto_15866 ?auto_15867 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15872 - BLOCK
      ?auto_15873 - BLOCK
      ?auto_15874 - BLOCK
    )
    :vars
    (
      ?auto_15875 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15874 ?auto_15875 ) ( ON-TABLE ?auto_15872 ) ( not ( = ?auto_15872 ?auto_15873 ) ) ( not ( = ?auto_15872 ?auto_15874 ) ) ( not ( = ?auto_15872 ?auto_15875 ) ) ( not ( = ?auto_15873 ?auto_15874 ) ) ( not ( = ?auto_15873 ?auto_15875 ) ) ( not ( = ?auto_15874 ?auto_15875 ) ) ( CLEAR ?auto_15872 ) ( ON ?auto_15873 ?auto_15874 ) ( CLEAR ?auto_15873 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15872 ?auto_15873 )
      ( MAKE-3PILE ?auto_15872 ?auto_15873 ?auto_15874 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15879 - BLOCK
      ?auto_15880 - BLOCK
      ?auto_15881 - BLOCK
    )
    :vars
    (
      ?auto_15882 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15881 ?auto_15882 ) ( not ( = ?auto_15879 ?auto_15880 ) ) ( not ( = ?auto_15879 ?auto_15881 ) ) ( not ( = ?auto_15879 ?auto_15882 ) ) ( not ( = ?auto_15880 ?auto_15881 ) ) ( not ( = ?auto_15880 ?auto_15882 ) ) ( not ( = ?auto_15881 ?auto_15882 ) ) ( ON ?auto_15880 ?auto_15881 ) ( ON ?auto_15879 ?auto_15880 ) ( CLEAR ?auto_15879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15879 )
      ( MAKE-3PILE ?auto_15879 ?auto_15880 ?auto_15881 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15886 - BLOCK
      ?auto_15887 - BLOCK
      ?auto_15888 - BLOCK
    )
    :vars
    (
      ?auto_15889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15888 ?auto_15889 ) ( not ( = ?auto_15886 ?auto_15887 ) ) ( not ( = ?auto_15886 ?auto_15888 ) ) ( not ( = ?auto_15886 ?auto_15889 ) ) ( not ( = ?auto_15887 ?auto_15888 ) ) ( not ( = ?auto_15887 ?auto_15889 ) ) ( not ( = ?auto_15888 ?auto_15889 ) ) ( ON ?auto_15887 ?auto_15888 ) ( ON ?auto_15886 ?auto_15887 ) ( CLEAR ?auto_15886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15886 )
      ( MAKE-3PILE ?auto_15886 ?auto_15887 ?auto_15888 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15894 - BLOCK
      ?auto_15895 - BLOCK
      ?auto_15896 - BLOCK
      ?auto_15897 - BLOCK
    )
    :vars
    (
      ?auto_15898 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_15896 ) ( ON ?auto_15897 ?auto_15898 ) ( CLEAR ?auto_15897 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15894 ) ( ON ?auto_15895 ?auto_15894 ) ( ON ?auto_15896 ?auto_15895 ) ( not ( = ?auto_15894 ?auto_15895 ) ) ( not ( = ?auto_15894 ?auto_15896 ) ) ( not ( = ?auto_15894 ?auto_15897 ) ) ( not ( = ?auto_15894 ?auto_15898 ) ) ( not ( = ?auto_15895 ?auto_15896 ) ) ( not ( = ?auto_15895 ?auto_15897 ) ) ( not ( = ?auto_15895 ?auto_15898 ) ) ( not ( = ?auto_15896 ?auto_15897 ) ) ( not ( = ?auto_15896 ?auto_15898 ) ) ( not ( = ?auto_15897 ?auto_15898 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15897 ?auto_15898 )
      ( !STACK ?auto_15897 ?auto_15896 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15903 - BLOCK
      ?auto_15904 - BLOCK
      ?auto_15905 - BLOCK
      ?auto_15906 - BLOCK
    )
    :vars
    (
      ?auto_15907 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_15905 ) ( ON ?auto_15906 ?auto_15907 ) ( CLEAR ?auto_15906 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15903 ) ( ON ?auto_15904 ?auto_15903 ) ( ON ?auto_15905 ?auto_15904 ) ( not ( = ?auto_15903 ?auto_15904 ) ) ( not ( = ?auto_15903 ?auto_15905 ) ) ( not ( = ?auto_15903 ?auto_15906 ) ) ( not ( = ?auto_15903 ?auto_15907 ) ) ( not ( = ?auto_15904 ?auto_15905 ) ) ( not ( = ?auto_15904 ?auto_15906 ) ) ( not ( = ?auto_15904 ?auto_15907 ) ) ( not ( = ?auto_15905 ?auto_15906 ) ) ( not ( = ?auto_15905 ?auto_15907 ) ) ( not ( = ?auto_15906 ?auto_15907 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15906 ?auto_15907 )
      ( !STACK ?auto_15906 ?auto_15905 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15912 - BLOCK
      ?auto_15913 - BLOCK
      ?auto_15914 - BLOCK
      ?auto_15915 - BLOCK
    )
    :vars
    (
      ?auto_15916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15915 ?auto_15916 ) ( ON-TABLE ?auto_15912 ) ( ON ?auto_15913 ?auto_15912 ) ( not ( = ?auto_15912 ?auto_15913 ) ) ( not ( = ?auto_15912 ?auto_15914 ) ) ( not ( = ?auto_15912 ?auto_15915 ) ) ( not ( = ?auto_15912 ?auto_15916 ) ) ( not ( = ?auto_15913 ?auto_15914 ) ) ( not ( = ?auto_15913 ?auto_15915 ) ) ( not ( = ?auto_15913 ?auto_15916 ) ) ( not ( = ?auto_15914 ?auto_15915 ) ) ( not ( = ?auto_15914 ?auto_15916 ) ) ( not ( = ?auto_15915 ?auto_15916 ) ) ( CLEAR ?auto_15913 ) ( ON ?auto_15914 ?auto_15915 ) ( CLEAR ?auto_15914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15912 ?auto_15913 ?auto_15914 )
      ( MAKE-4PILE ?auto_15912 ?auto_15913 ?auto_15914 ?auto_15915 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15921 - BLOCK
      ?auto_15922 - BLOCK
      ?auto_15923 - BLOCK
      ?auto_15924 - BLOCK
    )
    :vars
    (
      ?auto_15925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15924 ?auto_15925 ) ( ON-TABLE ?auto_15921 ) ( ON ?auto_15922 ?auto_15921 ) ( not ( = ?auto_15921 ?auto_15922 ) ) ( not ( = ?auto_15921 ?auto_15923 ) ) ( not ( = ?auto_15921 ?auto_15924 ) ) ( not ( = ?auto_15921 ?auto_15925 ) ) ( not ( = ?auto_15922 ?auto_15923 ) ) ( not ( = ?auto_15922 ?auto_15924 ) ) ( not ( = ?auto_15922 ?auto_15925 ) ) ( not ( = ?auto_15923 ?auto_15924 ) ) ( not ( = ?auto_15923 ?auto_15925 ) ) ( not ( = ?auto_15924 ?auto_15925 ) ) ( CLEAR ?auto_15922 ) ( ON ?auto_15923 ?auto_15924 ) ( CLEAR ?auto_15923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15921 ?auto_15922 ?auto_15923 )
      ( MAKE-4PILE ?auto_15921 ?auto_15922 ?auto_15923 ?auto_15924 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15930 - BLOCK
      ?auto_15931 - BLOCK
      ?auto_15932 - BLOCK
      ?auto_15933 - BLOCK
    )
    :vars
    (
      ?auto_15934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15933 ?auto_15934 ) ( ON-TABLE ?auto_15930 ) ( not ( = ?auto_15930 ?auto_15931 ) ) ( not ( = ?auto_15930 ?auto_15932 ) ) ( not ( = ?auto_15930 ?auto_15933 ) ) ( not ( = ?auto_15930 ?auto_15934 ) ) ( not ( = ?auto_15931 ?auto_15932 ) ) ( not ( = ?auto_15931 ?auto_15933 ) ) ( not ( = ?auto_15931 ?auto_15934 ) ) ( not ( = ?auto_15932 ?auto_15933 ) ) ( not ( = ?auto_15932 ?auto_15934 ) ) ( not ( = ?auto_15933 ?auto_15934 ) ) ( ON ?auto_15932 ?auto_15933 ) ( CLEAR ?auto_15930 ) ( ON ?auto_15931 ?auto_15932 ) ( CLEAR ?auto_15931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15930 ?auto_15931 )
      ( MAKE-4PILE ?auto_15930 ?auto_15931 ?auto_15932 ?auto_15933 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15939 - BLOCK
      ?auto_15940 - BLOCK
      ?auto_15941 - BLOCK
      ?auto_15942 - BLOCK
    )
    :vars
    (
      ?auto_15943 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15942 ?auto_15943 ) ( ON-TABLE ?auto_15939 ) ( not ( = ?auto_15939 ?auto_15940 ) ) ( not ( = ?auto_15939 ?auto_15941 ) ) ( not ( = ?auto_15939 ?auto_15942 ) ) ( not ( = ?auto_15939 ?auto_15943 ) ) ( not ( = ?auto_15940 ?auto_15941 ) ) ( not ( = ?auto_15940 ?auto_15942 ) ) ( not ( = ?auto_15940 ?auto_15943 ) ) ( not ( = ?auto_15941 ?auto_15942 ) ) ( not ( = ?auto_15941 ?auto_15943 ) ) ( not ( = ?auto_15942 ?auto_15943 ) ) ( ON ?auto_15941 ?auto_15942 ) ( CLEAR ?auto_15939 ) ( ON ?auto_15940 ?auto_15941 ) ( CLEAR ?auto_15940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15939 ?auto_15940 )
      ( MAKE-4PILE ?auto_15939 ?auto_15940 ?auto_15941 ?auto_15942 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15948 - BLOCK
      ?auto_15949 - BLOCK
      ?auto_15950 - BLOCK
      ?auto_15951 - BLOCK
    )
    :vars
    (
      ?auto_15952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15951 ?auto_15952 ) ( not ( = ?auto_15948 ?auto_15949 ) ) ( not ( = ?auto_15948 ?auto_15950 ) ) ( not ( = ?auto_15948 ?auto_15951 ) ) ( not ( = ?auto_15948 ?auto_15952 ) ) ( not ( = ?auto_15949 ?auto_15950 ) ) ( not ( = ?auto_15949 ?auto_15951 ) ) ( not ( = ?auto_15949 ?auto_15952 ) ) ( not ( = ?auto_15950 ?auto_15951 ) ) ( not ( = ?auto_15950 ?auto_15952 ) ) ( not ( = ?auto_15951 ?auto_15952 ) ) ( ON ?auto_15950 ?auto_15951 ) ( ON ?auto_15949 ?auto_15950 ) ( ON ?auto_15948 ?auto_15949 ) ( CLEAR ?auto_15948 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15948 )
      ( MAKE-4PILE ?auto_15948 ?auto_15949 ?auto_15950 ?auto_15951 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15957 - BLOCK
      ?auto_15958 - BLOCK
      ?auto_15959 - BLOCK
      ?auto_15960 - BLOCK
    )
    :vars
    (
      ?auto_15961 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15960 ?auto_15961 ) ( not ( = ?auto_15957 ?auto_15958 ) ) ( not ( = ?auto_15957 ?auto_15959 ) ) ( not ( = ?auto_15957 ?auto_15960 ) ) ( not ( = ?auto_15957 ?auto_15961 ) ) ( not ( = ?auto_15958 ?auto_15959 ) ) ( not ( = ?auto_15958 ?auto_15960 ) ) ( not ( = ?auto_15958 ?auto_15961 ) ) ( not ( = ?auto_15959 ?auto_15960 ) ) ( not ( = ?auto_15959 ?auto_15961 ) ) ( not ( = ?auto_15960 ?auto_15961 ) ) ( ON ?auto_15959 ?auto_15960 ) ( ON ?auto_15958 ?auto_15959 ) ( ON ?auto_15957 ?auto_15958 ) ( CLEAR ?auto_15957 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15957 )
      ( MAKE-4PILE ?auto_15957 ?auto_15958 ?auto_15959 ?auto_15960 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_15967 - BLOCK
      ?auto_15968 - BLOCK
      ?auto_15969 - BLOCK
      ?auto_15970 - BLOCK
      ?auto_15971 - BLOCK
    )
    :vars
    (
      ?auto_15972 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_15970 ) ( ON ?auto_15971 ?auto_15972 ) ( CLEAR ?auto_15971 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15967 ) ( ON ?auto_15968 ?auto_15967 ) ( ON ?auto_15969 ?auto_15968 ) ( ON ?auto_15970 ?auto_15969 ) ( not ( = ?auto_15967 ?auto_15968 ) ) ( not ( = ?auto_15967 ?auto_15969 ) ) ( not ( = ?auto_15967 ?auto_15970 ) ) ( not ( = ?auto_15967 ?auto_15971 ) ) ( not ( = ?auto_15967 ?auto_15972 ) ) ( not ( = ?auto_15968 ?auto_15969 ) ) ( not ( = ?auto_15968 ?auto_15970 ) ) ( not ( = ?auto_15968 ?auto_15971 ) ) ( not ( = ?auto_15968 ?auto_15972 ) ) ( not ( = ?auto_15969 ?auto_15970 ) ) ( not ( = ?auto_15969 ?auto_15971 ) ) ( not ( = ?auto_15969 ?auto_15972 ) ) ( not ( = ?auto_15970 ?auto_15971 ) ) ( not ( = ?auto_15970 ?auto_15972 ) ) ( not ( = ?auto_15971 ?auto_15972 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15971 ?auto_15972 )
      ( !STACK ?auto_15971 ?auto_15970 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_15978 - BLOCK
      ?auto_15979 - BLOCK
      ?auto_15980 - BLOCK
      ?auto_15981 - BLOCK
      ?auto_15982 - BLOCK
    )
    :vars
    (
      ?auto_15983 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_15981 ) ( ON ?auto_15982 ?auto_15983 ) ( CLEAR ?auto_15982 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15978 ) ( ON ?auto_15979 ?auto_15978 ) ( ON ?auto_15980 ?auto_15979 ) ( ON ?auto_15981 ?auto_15980 ) ( not ( = ?auto_15978 ?auto_15979 ) ) ( not ( = ?auto_15978 ?auto_15980 ) ) ( not ( = ?auto_15978 ?auto_15981 ) ) ( not ( = ?auto_15978 ?auto_15982 ) ) ( not ( = ?auto_15978 ?auto_15983 ) ) ( not ( = ?auto_15979 ?auto_15980 ) ) ( not ( = ?auto_15979 ?auto_15981 ) ) ( not ( = ?auto_15979 ?auto_15982 ) ) ( not ( = ?auto_15979 ?auto_15983 ) ) ( not ( = ?auto_15980 ?auto_15981 ) ) ( not ( = ?auto_15980 ?auto_15982 ) ) ( not ( = ?auto_15980 ?auto_15983 ) ) ( not ( = ?auto_15981 ?auto_15982 ) ) ( not ( = ?auto_15981 ?auto_15983 ) ) ( not ( = ?auto_15982 ?auto_15983 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15982 ?auto_15983 )
      ( !STACK ?auto_15982 ?auto_15981 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_15989 - BLOCK
      ?auto_15990 - BLOCK
      ?auto_15991 - BLOCK
      ?auto_15992 - BLOCK
      ?auto_15993 - BLOCK
    )
    :vars
    (
      ?auto_15994 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15993 ?auto_15994 ) ( ON-TABLE ?auto_15989 ) ( ON ?auto_15990 ?auto_15989 ) ( ON ?auto_15991 ?auto_15990 ) ( not ( = ?auto_15989 ?auto_15990 ) ) ( not ( = ?auto_15989 ?auto_15991 ) ) ( not ( = ?auto_15989 ?auto_15992 ) ) ( not ( = ?auto_15989 ?auto_15993 ) ) ( not ( = ?auto_15989 ?auto_15994 ) ) ( not ( = ?auto_15990 ?auto_15991 ) ) ( not ( = ?auto_15990 ?auto_15992 ) ) ( not ( = ?auto_15990 ?auto_15993 ) ) ( not ( = ?auto_15990 ?auto_15994 ) ) ( not ( = ?auto_15991 ?auto_15992 ) ) ( not ( = ?auto_15991 ?auto_15993 ) ) ( not ( = ?auto_15991 ?auto_15994 ) ) ( not ( = ?auto_15992 ?auto_15993 ) ) ( not ( = ?auto_15992 ?auto_15994 ) ) ( not ( = ?auto_15993 ?auto_15994 ) ) ( CLEAR ?auto_15991 ) ( ON ?auto_15992 ?auto_15993 ) ( CLEAR ?auto_15992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15989 ?auto_15990 ?auto_15991 ?auto_15992 )
      ( MAKE-5PILE ?auto_15989 ?auto_15990 ?auto_15991 ?auto_15992 ?auto_15993 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16000 - BLOCK
      ?auto_16001 - BLOCK
      ?auto_16002 - BLOCK
      ?auto_16003 - BLOCK
      ?auto_16004 - BLOCK
    )
    :vars
    (
      ?auto_16005 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16004 ?auto_16005 ) ( ON-TABLE ?auto_16000 ) ( ON ?auto_16001 ?auto_16000 ) ( ON ?auto_16002 ?auto_16001 ) ( not ( = ?auto_16000 ?auto_16001 ) ) ( not ( = ?auto_16000 ?auto_16002 ) ) ( not ( = ?auto_16000 ?auto_16003 ) ) ( not ( = ?auto_16000 ?auto_16004 ) ) ( not ( = ?auto_16000 ?auto_16005 ) ) ( not ( = ?auto_16001 ?auto_16002 ) ) ( not ( = ?auto_16001 ?auto_16003 ) ) ( not ( = ?auto_16001 ?auto_16004 ) ) ( not ( = ?auto_16001 ?auto_16005 ) ) ( not ( = ?auto_16002 ?auto_16003 ) ) ( not ( = ?auto_16002 ?auto_16004 ) ) ( not ( = ?auto_16002 ?auto_16005 ) ) ( not ( = ?auto_16003 ?auto_16004 ) ) ( not ( = ?auto_16003 ?auto_16005 ) ) ( not ( = ?auto_16004 ?auto_16005 ) ) ( CLEAR ?auto_16002 ) ( ON ?auto_16003 ?auto_16004 ) ( CLEAR ?auto_16003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16000 ?auto_16001 ?auto_16002 ?auto_16003 )
      ( MAKE-5PILE ?auto_16000 ?auto_16001 ?auto_16002 ?auto_16003 ?auto_16004 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16011 - BLOCK
      ?auto_16012 - BLOCK
      ?auto_16013 - BLOCK
      ?auto_16014 - BLOCK
      ?auto_16015 - BLOCK
    )
    :vars
    (
      ?auto_16016 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16015 ?auto_16016 ) ( ON-TABLE ?auto_16011 ) ( ON ?auto_16012 ?auto_16011 ) ( not ( = ?auto_16011 ?auto_16012 ) ) ( not ( = ?auto_16011 ?auto_16013 ) ) ( not ( = ?auto_16011 ?auto_16014 ) ) ( not ( = ?auto_16011 ?auto_16015 ) ) ( not ( = ?auto_16011 ?auto_16016 ) ) ( not ( = ?auto_16012 ?auto_16013 ) ) ( not ( = ?auto_16012 ?auto_16014 ) ) ( not ( = ?auto_16012 ?auto_16015 ) ) ( not ( = ?auto_16012 ?auto_16016 ) ) ( not ( = ?auto_16013 ?auto_16014 ) ) ( not ( = ?auto_16013 ?auto_16015 ) ) ( not ( = ?auto_16013 ?auto_16016 ) ) ( not ( = ?auto_16014 ?auto_16015 ) ) ( not ( = ?auto_16014 ?auto_16016 ) ) ( not ( = ?auto_16015 ?auto_16016 ) ) ( ON ?auto_16014 ?auto_16015 ) ( CLEAR ?auto_16012 ) ( ON ?auto_16013 ?auto_16014 ) ( CLEAR ?auto_16013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16011 ?auto_16012 ?auto_16013 )
      ( MAKE-5PILE ?auto_16011 ?auto_16012 ?auto_16013 ?auto_16014 ?auto_16015 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16022 - BLOCK
      ?auto_16023 - BLOCK
      ?auto_16024 - BLOCK
      ?auto_16025 - BLOCK
      ?auto_16026 - BLOCK
    )
    :vars
    (
      ?auto_16027 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16026 ?auto_16027 ) ( ON-TABLE ?auto_16022 ) ( ON ?auto_16023 ?auto_16022 ) ( not ( = ?auto_16022 ?auto_16023 ) ) ( not ( = ?auto_16022 ?auto_16024 ) ) ( not ( = ?auto_16022 ?auto_16025 ) ) ( not ( = ?auto_16022 ?auto_16026 ) ) ( not ( = ?auto_16022 ?auto_16027 ) ) ( not ( = ?auto_16023 ?auto_16024 ) ) ( not ( = ?auto_16023 ?auto_16025 ) ) ( not ( = ?auto_16023 ?auto_16026 ) ) ( not ( = ?auto_16023 ?auto_16027 ) ) ( not ( = ?auto_16024 ?auto_16025 ) ) ( not ( = ?auto_16024 ?auto_16026 ) ) ( not ( = ?auto_16024 ?auto_16027 ) ) ( not ( = ?auto_16025 ?auto_16026 ) ) ( not ( = ?auto_16025 ?auto_16027 ) ) ( not ( = ?auto_16026 ?auto_16027 ) ) ( ON ?auto_16025 ?auto_16026 ) ( CLEAR ?auto_16023 ) ( ON ?auto_16024 ?auto_16025 ) ( CLEAR ?auto_16024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16022 ?auto_16023 ?auto_16024 )
      ( MAKE-5PILE ?auto_16022 ?auto_16023 ?auto_16024 ?auto_16025 ?auto_16026 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16033 - BLOCK
      ?auto_16034 - BLOCK
      ?auto_16035 - BLOCK
      ?auto_16036 - BLOCK
      ?auto_16037 - BLOCK
    )
    :vars
    (
      ?auto_16038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16037 ?auto_16038 ) ( ON-TABLE ?auto_16033 ) ( not ( = ?auto_16033 ?auto_16034 ) ) ( not ( = ?auto_16033 ?auto_16035 ) ) ( not ( = ?auto_16033 ?auto_16036 ) ) ( not ( = ?auto_16033 ?auto_16037 ) ) ( not ( = ?auto_16033 ?auto_16038 ) ) ( not ( = ?auto_16034 ?auto_16035 ) ) ( not ( = ?auto_16034 ?auto_16036 ) ) ( not ( = ?auto_16034 ?auto_16037 ) ) ( not ( = ?auto_16034 ?auto_16038 ) ) ( not ( = ?auto_16035 ?auto_16036 ) ) ( not ( = ?auto_16035 ?auto_16037 ) ) ( not ( = ?auto_16035 ?auto_16038 ) ) ( not ( = ?auto_16036 ?auto_16037 ) ) ( not ( = ?auto_16036 ?auto_16038 ) ) ( not ( = ?auto_16037 ?auto_16038 ) ) ( ON ?auto_16036 ?auto_16037 ) ( ON ?auto_16035 ?auto_16036 ) ( CLEAR ?auto_16033 ) ( ON ?auto_16034 ?auto_16035 ) ( CLEAR ?auto_16034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16033 ?auto_16034 )
      ( MAKE-5PILE ?auto_16033 ?auto_16034 ?auto_16035 ?auto_16036 ?auto_16037 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16044 - BLOCK
      ?auto_16045 - BLOCK
      ?auto_16046 - BLOCK
      ?auto_16047 - BLOCK
      ?auto_16048 - BLOCK
    )
    :vars
    (
      ?auto_16049 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16048 ?auto_16049 ) ( ON-TABLE ?auto_16044 ) ( not ( = ?auto_16044 ?auto_16045 ) ) ( not ( = ?auto_16044 ?auto_16046 ) ) ( not ( = ?auto_16044 ?auto_16047 ) ) ( not ( = ?auto_16044 ?auto_16048 ) ) ( not ( = ?auto_16044 ?auto_16049 ) ) ( not ( = ?auto_16045 ?auto_16046 ) ) ( not ( = ?auto_16045 ?auto_16047 ) ) ( not ( = ?auto_16045 ?auto_16048 ) ) ( not ( = ?auto_16045 ?auto_16049 ) ) ( not ( = ?auto_16046 ?auto_16047 ) ) ( not ( = ?auto_16046 ?auto_16048 ) ) ( not ( = ?auto_16046 ?auto_16049 ) ) ( not ( = ?auto_16047 ?auto_16048 ) ) ( not ( = ?auto_16047 ?auto_16049 ) ) ( not ( = ?auto_16048 ?auto_16049 ) ) ( ON ?auto_16047 ?auto_16048 ) ( ON ?auto_16046 ?auto_16047 ) ( CLEAR ?auto_16044 ) ( ON ?auto_16045 ?auto_16046 ) ( CLEAR ?auto_16045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16044 ?auto_16045 )
      ( MAKE-5PILE ?auto_16044 ?auto_16045 ?auto_16046 ?auto_16047 ?auto_16048 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16055 - BLOCK
      ?auto_16056 - BLOCK
      ?auto_16057 - BLOCK
      ?auto_16058 - BLOCK
      ?auto_16059 - BLOCK
    )
    :vars
    (
      ?auto_16060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16059 ?auto_16060 ) ( not ( = ?auto_16055 ?auto_16056 ) ) ( not ( = ?auto_16055 ?auto_16057 ) ) ( not ( = ?auto_16055 ?auto_16058 ) ) ( not ( = ?auto_16055 ?auto_16059 ) ) ( not ( = ?auto_16055 ?auto_16060 ) ) ( not ( = ?auto_16056 ?auto_16057 ) ) ( not ( = ?auto_16056 ?auto_16058 ) ) ( not ( = ?auto_16056 ?auto_16059 ) ) ( not ( = ?auto_16056 ?auto_16060 ) ) ( not ( = ?auto_16057 ?auto_16058 ) ) ( not ( = ?auto_16057 ?auto_16059 ) ) ( not ( = ?auto_16057 ?auto_16060 ) ) ( not ( = ?auto_16058 ?auto_16059 ) ) ( not ( = ?auto_16058 ?auto_16060 ) ) ( not ( = ?auto_16059 ?auto_16060 ) ) ( ON ?auto_16058 ?auto_16059 ) ( ON ?auto_16057 ?auto_16058 ) ( ON ?auto_16056 ?auto_16057 ) ( ON ?auto_16055 ?auto_16056 ) ( CLEAR ?auto_16055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16055 )
      ( MAKE-5PILE ?auto_16055 ?auto_16056 ?auto_16057 ?auto_16058 ?auto_16059 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16066 - BLOCK
      ?auto_16067 - BLOCK
      ?auto_16068 - BLOCK
      ?auto_16069 - BLOCK
      ?auto_16070 - BLOCK
    )
    :vars
    (
      ?auto_16071 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16070 ?auto_16071 ) ( not ( = ?auto_16066 ?auto_16067 ) ) ( not ( = ?auto_16066 ?auto_16068 ) ) ( not ( = ?auto_16066 ?auto_16069 ) ) ( not ( = ?auto_16066 ?auto_16070 ) ) ( not ( = ?auto_16066 ?auto_16071 ) ) ( not ( = ?auto_16067 ?auto_16068 ) ) ( not ( = ?auto_16067 ?auto_16069 ) ) ( not ( = ?auto_16067 ?auto_16070 ) ) ( not ( = ?auto_16067 ?auto_16071 ) ) ( not ( = ?auto_16068 ?auto_16069 ) ) ( not ( = ?auto_16068 ?auto_16070 ) ) ( not ( = ?auto_16068 ?auto_16071 ) ) ( not ( = ?auto_16069 ?auto_16070 ) ) ( not ( = ?auto_16069 ?auto_16071 ) ) ( not ( = ?auto_16070 ?auto_16071 ) ) ( ON ?auto_16069 ?auto_16070 ) ( ON ?auto_16068 ?auto_16069 ) ( ON ?auto_16067 ?auto_16068 ) ( ON ?auto_16066 ?auto_16067 ) ( CLEAR ?auto_16066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16066 )
      ( MAKE-5PILE ?auto_16066 ?auto_16067 ?auto_16068 ?auto_16069 ?auto_16070 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_16078 - BLOCK
      ?auto_16079 - BLOCK
      ?auto_16080 - BLOCK
      ?auto_16081 - BLOCK
      ?auto_16082 - BLOCK
      ?auto_16083 - BLOCK
    )
    :vars
    (
      ?auto_16084 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_16082 ) ( ON ?auto_16083 ?auto_16084 ) ( CLEAR ?auto_16083 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16078 ) ( ON ?auto_16079 ?auto_16078 ) ( ON ?auto_16080 ?auto_16079 ) ( ON ?auto_16081 ?auto_16080 ) ( ON ?auto_16082 ?auto_16081 ) ( not ( = ?auto_16078 ?auto_16079 ) ) ( not ( = ?auto_16078 ?auto_16080 ) ) ( not ( = ?auto_16078 ?auto_16081 ) ) ( not ( = ?auto_16078 ?auto_16082 ) ) ( not ( = ?auto_16078 ?auto_16083 ) ) ( not ( = ?auto_16078 ?auto_16084 ) ) ( not ( = ?auto_16079 ?auto_16080 ) ) ( not ( = ?auto_16079 ?auto_16081 ) ) ( not ( = ?auto_16079 ?auto_16082 ) ) ( not ( = ?auto_16079 ?auto_16083 ) ) ( not ( = ?auto_16079 ?auto_16084 ) ) ( not ( = ?auto_16080 ?auto_16081 ) ) ( not ( = ?auto_16080 ?auto_16082 ) ) ( not ( = ?auto_16080 ?auto_16083 ) ) ( not ( = ?auto_16080 ?auto_16084 ) ) ( not ( = ?auto_16081 ?auto_16082 ) ) ( not ( = ?auto_16081 ?auto_16083 ) ) ( not ( = ?auto_16081 ?auto_16084 ) ) ( not ( = ?auto_16082 ?auto_16083 ) ) ( not ( = ?auto_16082 ?auto_16084 ) ) ( not ( = ?auto_16083 ?auto_16084 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16083 ?auto_16084 )
      ( !STACK ?auto_16083 ?auto_16082 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_16091 - BLOCK
      ?auto_16092 - BLOCK
      ?auto_16093 - BLOCK
      ?auto_16094 - BLOCK
      ?auto_16095 - BLOCK
      ?auto_16096 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_16095 ) ( ON-TABLE ?auto_16096 ) ( CLEAR ?auto_16096 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16091 ) ( ON ?auto_16092 ?auto_16091 ) ( ON ?auto_16093 ?auto_16092 ) ( ON ?auto_16094 ?auto_16093 ) ( ON ?auto_16095 ?auto_16094 ) ( not ( = ?auto_16091 ?auto_16092 ) ) ( not ( = ?auto_16091 ?auto_16093 ) ) ( not ( = ?auto_16091 ?auto_16094 ) ) ( not ( = ?auto_16091 ?auto_16095 ) ) ( not ( = ?auto_16091 ?auto_16096 ) ) ( not ( = ?auto_16092 ?auto_16093 ) ) ( not ( = ?auto_16092 ?auto_16094 ) ) ( not ( = ?auto_16092 ?auto_16095 ) ) ( not ( = ?auto_16092 ?auto_16096 ) ) ( not ( = ?auto_16093 ?auto_16094 ) ) ( not ( = ?auto_16093 ?auto_16095 ) ) ( not ( = ?auto_16093 ?auto_16096 ) ) ( not ( = ?auto_16094 ?auto_16095 ) ) ( not ( = ?auto_16094 ?auto_16096 ) ) ( not ( = ?auto_16095 ?auto_16096 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_16096 )
      ( !STACK ?auto_16096 ?auto_16095 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_16103 - BLOCK
      ?auto_16104 - BLOCK
      ?auto_16105 - BLOCK
      ?auto_16106 - BLOCK
      ?auto_16107 - BLOCK
      ?auto_16108 - BLOCK
    )
    :vars
    (
      ?auto_16109 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16108 ?auto_16109 ) ( ON-TABLE ?auto_16103 ) ( ON ?auto_16104 ?auto_16103 ) ( ON ?auto_16105 ?auto_16104 ) ( ON ?auto_16106 ?auto_16105 ) ( not ( = ?auto_16103 ?auto_16104 ) ) ( not ( = ?auto_16103 ?auto_16105 ) ) ( not ( = ?auto_16103 ?auto_16106 ) ) ( not ( = ?auto_16103 ?auto_16107 ) ) ( not ( = ?auto_16103 ?auto_16108 ) ) ( not ( = ?auto_16103 ?auto_16109 ) ) ( not ( = ?auto_16104 ?auto_16105 ) ) ( not ( = ?auto_16104 ?auto_16106 ) ) ( not ( = ?auto_16104 ?auto_16107 ) ) ( not ( = ?auto_16104 ?auto_16108 ) ) ( not ( = ?auto_16104 ?auto_16109 ) ) ( not ( = ?auto_16105 ?auto_16106 ) ) ( not ( = ?auto_16105 ?auto_16107 ) ) ( not ( = ?auto_16105 ?auto_16108 ) ) ( not ( = ?auto_16105 ?auto_16109 ) ) ( not ( = ?auto_16106 ?auto_16107 ) ) ( not ( = ?auto_16106 ?auto_16108 ) ) ( not ( = ?auto_16106 ?auto_16109 ) ) ( not ( = ?auto_16107 ?auto_16108 ) ) ( not ( = ?auto_16107 ?auto_16109 ) ) ( not ( = ?auto_16108 ?auto_16109 ) ) ( CLEAR ?auto_16106 ) ( ON ?auto_16107 ?auto_16108 ) ( CLEAR ?auto_16107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_16103 ?auto_16104 ?auto_16105 ?auto_16106 ?auto_16107 )
      ( MAKE-6PILE ?auto_16103 ?auto_16104 ?auto_16105 ?auto_16106 ?auto_16107 ?auto_16108 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_16116 - BLOCK
      ?auto_16117 - BLOCK
      ?auto_16118 - BLOCK
      ?auto_16119 - BLOCK
      ?auto_16120 - BLOCK
      ?auto_16121 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16121 ) ( ON-TABLE ?auto_16116 ) ( ON ?auto_16117 ?auto_16116 ) ( ON ?auto_16118 ?auto_16117 ) ( ON ?auto_16119 ?auto_16118 ) ( not ( = ?auto_16116 ?auto_16117 ) ) ( not ( = ?auto_16116 ?auto_16118 ) ) ( not ( = ?auto_16116 ?auto_16119 ) ) ( not ( = ?auto_16116 ?auto_16120 ) ) ( not ( = ?auto_16116 ?auto_16121 ) ) ( not ( = ?auto_16117 ?auto_16118 ) ) ( not ( = ?auto_16117 ?auto_16119 ) ) ( not ( = ?auto_16117 ?auto_16120 ) ) ( not ( = ?auto_16117 ?auto_16121 ) ) ( not ( = ?auto_16118 ?auto_16119 ) ) ( not ( = ?auto_16118 ?auto_16120 ) ) ( not ( = ?auto_16118 ?auto_16121 ) ) ( not ( = ?auto_16119 ?auto_16120 ) ) ( not ( = ?auto_16119 ?auto_16121 ) ) ( not ( = ?auto_16120 ?auto_16121 ) ) ( CLEAR ?auto_16119 ) ( ON ?auto_16120 ?auto_16121 ) ( CLEAR ?auto_16120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_16116 ?auto_16117 ?auto_16118 ?auto_16119 ?auto_16120 )
      ( MAKE-6PILE ?auto_16116 ?auto_16117 ?auto_16118 ?auto_16119 ?auto_16120 ?auto_16121 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_16128 - BLOCK
      ?auto_16129 - BLOCK
      ?auto_16130 - BLOCK
      ?auto_16131 - BLOCK
      ?auto_16132 - BLOCK
      ?auto_16133 - BLOCK
    )
    :vars
    (
      ?auto_16134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16133 ?auto_16134 ) ( ON-TABLE ?auto_16128 ) ( ON ?auto_16129 ?auto_16128 ) ( ON ?auto_16130 ?auto_16129 ) ( not ( = ?auto_16128 ?auto_16129 ) ) ( not ( = ?auto_16128 ?auto_16130 ) ) ( not ( = ?auto_16128 ?auto_16131 ) ) ( not ( = ?auto_16128 ?auto_16132 ) ) ( not ( = ?auto_16128 ?auto_16133 ) ) ( not ( = ?auto_16128 ?auto_16134 ) ) ( not ( = ?auto_16129 ?auto_16130 ) ) ( not ( = ?auto_16129 ?auto_16131 ) ) ( not ( = ?auto_16129 ?auto_16132 ) ) ( not ( = ?auto_16129 ?auto_16133 ) ) ( not ( = ?auto_16129 ?auto_16134 ) ) ( not ( = ?auto_16130 ?auto_16131 ) ) ( not ( = ?auto_16130 ?auto_16132 ) ) ( not ( = ?auto_16130 ?auto_16133 ) ) ( not ( = ?auto_16130 ?auto_16134 ) ) ( not ( = ?auto_16131 ?auto_16132 ) ) ( not ( = ?auto_16131 ?auto_16133 ) ) ( not ( = ?auto_16131 ?auto_16134 ) ) ( not ( = ?auto_16132 ?auto_16133 ) ) ( not ( = ?auto_16132 ?auto_16134 ) ) ( not ( = ?auto_16133 ?auto_16134 ) ) ( ON ?auto_16132 ?auto_16133 ) ( CLEAR ?auto_16130 ) ( ON ?auto_16131 ?auto_16132 ) ( CLEAR ?auto_16131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16128 ?auto_16129 ?auto_16130 ?auto_16131 )
      ( MAKE-6PILE ?auto_16128 ?auto_16129 ?auto_16130 ?auto_16131 ?auto_16132 ?auto_16133 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_16141 - BLOCK
      ?auto_16142 - BLOCK
      ?auto_16143 - BLOCK
      ?auto_16144 - BLOCK
      ?auto_16145 - BLOCK
      ?auto_16146 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16146 ) ( ON-TABLE ?auto_16141 ) ( ON ?auto_16142 ?auto_16141 ) ( ON ?auto_16143 ?auto_16142 ) ( not ( = ?auto_16141 ?auto_16142 ) ) ( not ( = ?auto_16141 ?auto_16143 ) ) ( not ( = ?auto_16141 ?auto_16144 ) ) ( not ( = ?auto_16141 ?auto_16145 ) ) ( not ( = ?auto_16141 ?auto_16146 ) ) ( not ( = ?auto_16142 ?auto_16143 ) ) ( not ( = ?auto_16142 ?auto_16144 ) ) ( not ( = ?auto_16142 ?auto_16145 ) ) ( not ( = ?auto_16142 ?auto_16146 ) ) ( not ( = ?auto_16143 ?auto_16144 ) ) ( not ( = ?auto_16143 ?auto_16145 ) ) ( not ( = ?auto_16143 ?auto_16146 ) ) ( not ( = ?auto_16144 ?auto_16145 ) ) ( not ( = ?auto_16144 ?auto_16146 ) ) ( not ( = ?auto_16145 ?auto_16146 ) ) ( ON ?auto_16145 ?auto_16146 ) ( CLEAR ?auto_16143 ) ( ON ?auto_16144 ?auto_16145 ) ( CLEAR ?auto_16144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16141 ?auto_16142 ?auto_16143 ?auto_16144 )
      ( MAKE-6PILE ?auto_16141 ?auto_16142 ?auto_16143 ?auto_16144 ?auto_16145 ?auto_16146 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_16153 - BLOCK
      ?auto_16154 - BLOCK
      ?auto_16155 - BLOCK
      ?auto_16156 - BLOCK
      ?auto_16157 - BLOCK
      ?auto_16158 - BLOCK
    )
    :vars
    (
      ?auto_16159 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16158 ?auto_16159 ) ( ON-TABLE ?auto_16153 ) ( ON ?auto_16154 ?auto_16153 ) ( not ( = ?auto_16153 ?auto_16154 ) ) ( not ( = ?auto_16153 ?auto_16155 ) ) ( not ( = ?auto_16153 ?auto_16156 ) ) ( not ( = ?auto_16153 ?auto_16157 ) ) ( not ( = ?auto_16153 ?auto_16158 ) ) ( not ( = ?auto_16153 ?auto_16159 ) ) ( not ( = ?auto_16154 ?auto_16155 ) ) ( not ( = ?auto_16154 ?auto_16156 ) ) ( not ( = ?auto_16154 ?auto_16157 ) ) ( not ( = ?auto_16154 ?auto_16158 ) ) ( not ( = ?auto_16154 ?auto_16159 ) ) ( not ( = ?auto_16155 ?auto_16156 ) ) ( not ( = ?auto_16155 ?auto_16157 ) ) ( not ( = ?auto_16155 ?auto_16158 ) ) ( not ( = ?auto_16155 ?auto_16159 ) ) ( not ( = ?auto_16156 ?auto_16157 ) ) ( not ( = ?auto_16156 ?auto_16158 ) ) ( not ( = ?auto_16156 ?auto_16159 ) ) ( not ( = ?auto_16157 ?auto_16158 ) ) ( not ( = ?auto_16157 ?auto_16159 ) ) ( not ( = ?auto_16158 ?auto_16159 ) ) ( ON ?auto_16157 ?auto_16158 ) ( ON ?auto_16156 ?auto_16157 ) ( CLEAR ?auto_16154 ) ( ON ?auto_16155 ?auto_16156 ) ( CLEAR ?auto_16155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16153 ?auto_16154 ?auto_16155 )
      ( MAKE-6PILE ?auto_16153 ?auto_16154 ?auto_16155 ?auto_16156 ?auto_16157 ?auto_16158 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_16166 - BLOCK
      ?auto_16167 - BLOCK
      ?auto_16168 - BLOCK
      ?auto_16169 - BLOCK
      ?auto_16170 - BLOCK
      ?auto_16171 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16171 ) ( ON-TABLE ?auto_16166 ) ( ON ?auto_16167 ?auto_16166 ) ( not ( = ?auto_16166 ?auto_16167 ) ) ( not ( = ?auto_16166 ?auto_16168 ) ) ( not ( = ?auto_16166 ?auto_16169 ) ) ( not ( = ?auto_16166 ?auto_16170 ) ) ( not ( = ?auto_16166 ?auto_16171 ) ) ( not ( = ?auto_16167 ?auto_16168 ) ) ( not ( = ?auto_16167 ?auto_16169 ) ) ( not ( = ?auto_16167 ?auto_16170 ) ) ( not ( = ?auto_16167 ?auto_16171 ) ) ( not ( = ?auto_16168 ?auto_16169 ) ) ( not ( = ?auto_16168 ?auto_16170 ) ) ( not ( = ?auto_16168 ?auto_16171 ) ) ( not ( = ?auto_16169 ?auto_16170 ) ) ( not ( = ?auto_16169 ?auto_16171 ) ) ( not ( = ?auto_16170 ?auto_16171 ) ) ( ON ?auto_16170 ?auto_16171 ) ( ON ?auto_16169 ?auto_16170 ) ( CLEAR ?auto_16167 ) ( ON ?auto_16168 ?auto_16169 ) ( CLEAR ?auto_16168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16166 ?auto_16167 ?auto_16168 )
      ( MAKE-6PILE ?auto_16166 ?auto_16167 ?auto_16168 ?auto_16169 ?auto_16170 ?auto_16171 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_16178 - BLOCK
      ?auto_16179 - BLOCK
      ?auto_16180 - BLOCK
      ?auto_16181 - BLOCK
      ?auto_16182 - BLOCK
      ?auto_16183 - BLOCK
    )
    :vars
    (
      ?auto_16184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16183 ?auto_16184 ) ( ON-TABLE ?auto_16178 ) ( not ( = ?auto_16178 ?auto_16179 ) ) ( not ( = ?auto_16178 ?auto_16180 ) ) ( not ( = ?auto_16178 ?auto_16181 ) ) ( not ( = ?auto_16178 ?auto_16182 ) ) ( not ( = ?auto_16178 ?auto_16183 ) ) ( not ( = ?auto_16178 ?auto_16184 ) ) ( not ( = ?auto_16179 ?auto_16180 ) ) ( not ( = ?auto_16179 ?auto_16181 ) ) ( not ( = ?auto_16179 ?auto_16182 ) ) ( not ( = ?auto_16179 ?auto_16183 ) ) ( not ( = ?auto_16179 ?auto_16184 ) ) ( not ( = ?auto_16180 ?auto_16181 ) ) ( not ( = ?auto_16180 ?auto_16182 ) ) ( not ( = ?auto_16180 ?auto_16183 ) ) ( not ( = ?auto_16180 ?auto_16184 ) ) ( not ( = ?auto_16181 ?auto_16182 ) ) ( not ( = ?auto_16181 ?auto_16183 ) ) ( not ( = ?auto_16181 ?auto_16184 ) ) ( not ( = ?auto_16182 ?auto_16183 ) ) ( not ( = ?auto_16182 ?auto_16184 ) ) ( not ( = ?auto_16183 ?auto_16184 ) ) ( ON ?auto_16182 ?auto_16183 ) ( ON ?auto_16181 ?auto_16182 ) ( ON ?auto_16180 ?auto_16181 ) ( CLEAR ?auto_16178 ) ( ON ?auto_16179 ?auto_16180 ) ( CLEAR ?auto_16179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16178 ?auto_16179 )
      ( MAKE-6PILE ?auto_16178 ?auto_16179 ?auto_16180 ?auto_16181 ?auto_16182 ?auto_16183 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_16191 - BLOCK
      ?auto_16192 - BLOCK
      ?auto_16193 - BLOCK
      ?auto_16194 - BLOCK
      ?auto_16195 - BLOCK
      ?auto_16196 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16196 ) ( ON-TABLE ?auto_16191 ) ( not ( = ?auto_16191 ?auto_16192 ) ) ( not ( = ?auto_16191 ?auto_16193 ) ) ( not ( = ?auto_16191 ?auto_16194 ) ) ( not ( = ?auto_16191 ?auto_16195 ) ) ( not ( = ?auto_16191 ?auto_16196 ) ) ( not ( = ?auto_16192 ?auto_16193 ) ) ( not ( = ?auto_16192 ?auto_16194 ) ) ( not ( = ?auto_16192 ?auto_16195 ) ) ( not ( = ?auto_16192 ?auto_16196 ) ) ( not ( = ?auto_16193 ?auto_16194 ) ) ( not ( = ?auto_16193 ?auto_16195 ) ) ( not ( = ?auto_16193 ?auto_16196 ) ) ( not ( = ?auto_16194 ?auto_16195 ) ) ( not ( = ?auto_16194 ?auto_16196 ) ) ( not ( = ?auto_16195 ?auto_16196 ) ) ( ON ?auto_16195 ?auto_16196 ) ( ON ?auto_16194 ?auto_16195 ) ( ON ?auto_16193 ?auto_16194 ) ( CLEAR ?auto_16191 ) ( ON ?auto_16192 ?auto_16193 ) ( CLEAR ?auto_16192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16191 ?auto_16192 )
      ( MAKE-6PILE ?auto_16191 ?auto_16192 ?auto_16193 ?auto_16194 ?auto_16195 ?auto_16196 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_16203 - BLOCK
      ?auto_16204 - BLOCK
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
    ( and ( ON ?auto_16208 ?auto_16209 ) ( not ( = ?auto_16203 ?auto_16204 ) ) ( not ( = ?auto_16203 ?auto_16205 ) ) ( not ( = ?auto_16203 ?auto_16206 ) ) ( not ( = ?auto_16203 ?auto_16207 ) ) ( not ( = ?auto_16203 ?auto_16208 ) ) ( not ( = ?auto_16203 ?auto_16209 ) ) ( not ( = ?auto_16204 ?auto_16205 ) ) ( not ( = ?auto_16204 ?auto_16206 ) ) ( not ( = ?auto_16204 ?auto_16207 ) ) ( not ( = ?auto_16204 ?auto_16208 ) ) ( not ( = ?auto_16204 ?auto_16209 ) ) ( not ( = ?auto_16205 ?auto_16206 ) ) ( not ( = ?auto_16205 ?auto_16207 ) ) ( not ( = ?auto_16205 ?auto_16208 ) ) ( not ( = ?auto_16205 ?auto_16209 ) ) ( not ( = ?auto_16206 ?auto_16207 ) ) ( not ( = ?auto_16206 ?auto_16208 ) ) ( not ( = ?auto_16206 ?auto_16209 ) ) ( not ( = ?auto_16207 ?auto_16208 ) ) ( not ( = ?auto_16207 ?auto_16209 ) ) ( not ( = ?auto_16208 ?auto_16209 ) ) ( ON ?auto_16207 ?auto_16208 ) ( ON ?auto_16206 ?auto_16207 ) ( ON ?auto_16205 ?auto_16206 ) ( ON ?auto_16204 ?auto_16205 ) ( ON ?auto_16203 ?auto_16204 ) ( CLEAR ?auto_16203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16203 )
      ( MAKE-6PILE ?auto_16203 ?auto_16204 ?auto_16205 ?auto_16206 ?auto_16207 ?auto_16208 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_16216 - BLOCK
      ?auto_16217 - BLOCK
      ?auto_16218 - BLOCK
      ?auto_16219 - BLOCK
      ?auto_16220 - BLOCK
      ?auto_16221 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16221 ) ( not ( = ?auto_16216 ?auto_16217 ) ) ( not ( = ?auto_16216 ?auto_16218 ) ) ( not ( = ?auto_16216 ?auto_16219 ) ) ( not ( = ?auto_16216 ?auto_16220 ) ) ( not ( = ?auto_16216 ?auto_16221 ) ) ( not ( = ?auto_16217 ?auto_16218 ) ) ( not ( = ?auto_16217 ?auto_16219 ) ) ( not ( = ?auto_16217 ?auto_16220 ) ) ( not ( = ?auto_16217 ?auto_16221 ) ) ( not ( = ?auto_16218 ?auto_16219 ) ) ( not ( = ?auto_16218 ?auto_16220 ) ) ( not ( = ?auto_16218 ?auto_16221 ) ) ( not ( = ?auto_16219 ?auto_16220 ) ) ( not ( = ?auto_16219 ?auto_16221 ) ) ( not ( = ?auto_16220 ?auto_16221 ) ) ( ON ?auto_16220 ?auto_16221 ) ( ON ?auto_16219 ?auto_16220 ) ( ON ?auto_16218 ?auto_16219 ) ( ON ?auto_16217 ?auto_16218 ) ( ON ?auto_16216 ?auto_16217 ) ( CLEAR ?auto_16216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16216 )
      ( MAKE-6PILE ?auto_16216 ?auto_16217 ?auto_16218 ?auto_16219 ?auto_16220 ?auto_16221 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_16228 - BLOCK
      ?auto_16229 - BLOCK
      ?auto_16230 - BLOCK
      ?auto_16231 - BLOCK
      ?auto_16232 - BLOCK
      ?auto_16233 - BLOCK
    )
    :vars
    (
      ?auto_16234 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16228 ?auto_16229 ) ) ( not ( = ?auto_16228 ?auto_16230 ) ) ( not ( = ?auto_16228 ?auto_16231 ) ) ( not ( = ?auto_16228 ?auto_16232 ) ) ( not ( = ?auto_16228 ?auto_16233 ) ) ( not ( = ?auto_16229 ?auto_16230 ) ) ( not ( = ?auto_16229 ?auto_16231 ) ) ( not ( = ?auto_16229 ?auto_16232 ) ) ( not ( = ?auto_16229 ?auto_16233 ) ) ( not ( = ?auto_16230 ?auto_16231 ) ) ( not ( = ?auto_16230 ?auto_16232 ) ) ( not ( = ?auto_16230 ?auto_16233 ) ) ( not ( = ?auto_16231 ?auto_16232 ) ) ( not ( = ?auto_16231 ?auto_16233 ) ) ( not ( = ?auto_16232 ?auto_16233 ) ) ( ON ?auto_16228 ?auto_16234 ) ( not ( = ?auto_16233 ?auto_16234 ) ) ( not ( = ?auto_16232 ?auto_16234 ) ) ( not ( = ?auto_16231 ?auto_16234 ) ) ( not ( = ?auto_16230 ?auto_16234 ) ) ( not ( = ?auto_16229 ?auto_16234 ) ) ( not ( = ?auto_16228 ?auto_16234 ) ) ( ON ?auto_16229 ?auto_16228 ) ( ON ?auto_16230 ?auto_16229 ) ( ON ?auto_16231 ?auto_16230 ) ( ON ?auto_16232 ?auto_16231 ) ( ON ?auto_16233 ?auto_16232 ) ( CLEAR ?auto_16233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_16233 ?auto_16232 ?auto_16231 ?auto_16230 ?auto_16229 ?auto_16228 )
      ( MAKE-6PILE ?auto_16228 ?auto_16229 ?auto_16230 ?auto_16231 ?auto_16232 ?auto_16233 ) )
  )

)

