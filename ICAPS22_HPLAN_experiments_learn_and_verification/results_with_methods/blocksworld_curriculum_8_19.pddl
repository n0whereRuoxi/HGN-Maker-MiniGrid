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
      ?auto_47824 - BLOCK
    )
    :vars
    (
      ?auto_47825 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47824 ?auto_47825 ) ( CLEAR ?auto_47824 ) ( HAND-EMPTY ) ( not ( = ?auto_47824 ?auto_47825 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47824 ?auto_47825 )
      ( !PUTDOWN ?auto_47824 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47827 - BLOCK
    )
    :vars
    (
      ?auto_47828 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47827 ?auto_47828 ) ( CLEAR ?auto_47827 ) ( HAND-EMPTY ) ( not ( = ?auto_47827 ?auto_47828 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47827 ?auto_47828 )
      ( !PUTDOWN ?auto_47827 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47831 - BLOCK
      ?auto_47832 - BLOCK
    )
    :vars
    (
      ?auto_47833 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_47831 ) ( ON ?auto_47832 ?auto_47833 ) ( CLEAR ?auto_47832 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47831 ) ( not ( = ?auto_47831 ?auto_47832 ) ) ( not ( = ?auto_47831 ?auto_47833 ) ) ( not ( = ?auto_47832 ?auto_47833 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47832 ?auto_47833 )
      ( !STACK ?auto_47832 ?auto_47831 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47836 - BLOCK
      ?auto_47837 - BLOCK
    )
    :vars
    (
      ?auto_47838 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_47836 ) ( ON ?auto_47837 ?auto_47838 ) ( CLEAR ?auto_47837 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47836 ) ( not ( = ?auto_47836 ?auto_47837 ) ) ( not ( = ?auto_47836 ?auto_47838 ) ) ( not ( = ?auto_47837 ?auto_47838 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47837 ?auto_47838 )
      ( !STACK ?auto_47837 ?auto_47836 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47841 - BLOCK
      ?auto_47842 - BLOCK
    )
    :vars
    (
      ?auto_47843 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47842 ?auto_47843 ) ( not ( = ?auto_47841 ?auto_47842 ) ) ( not ( = ?auto_47841 ?auto_47843 ) ) ( not ( = ?auto_47842 ?auto_47843 ) ) ( ON ?auto_47841 ?auto_47842 ) ( CLEAR ?auto_47841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47841 )
      ( MAKE-2PILE ?auto_47841 ?auto_47842 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47846 - BLOCK
      ?auto_47847 - BLOCK
    )
    :vars
    (
      ?auto_47848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47847 ?auto_47848 ) ( not ( = ?auto_47846 ?auto_47847 ) ) ( not ( = ?auto_47846 ?auto_47848 ) ) ( not ( = ?auto_47847 ?auto_47848 ) ) ( ON ?auto_47846 ?auto_47847 ) ( CLEAR ?auto_47846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47846 )
      ( MAKE-2PILE ?auto_47846 ?auto_47847 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47852 - BLOCK
      ?auto_47853 - BLOCK
      ?auto_47854 - BLOCK
    )
    :vars
    (
      ?auto_47855 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_47853 ) ( ON ?auto_47854 ?auto_47855 ) ( CLEAR ?auto_47854 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47852 ) ( ON ?auto_47853 ?auto_47852 ) ( not ( = ?auto_47852 ?auto_47853 ) ) ( not ( = ?auto_47852 ?auto_47854 ) ) ( not ( = ?auto_47852 ?auto_47855 ) ) ( not ( = ?auto_47853 ?auto_47854 ) ) ( not ( = ?auto_47853 ?auto_47855 ) ) ( not ( = ?auto_47854 ?auto_47855 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47854 ?auto_47855 )
      ( !STACK ?auto_47854 ?auto_47853 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47859 - BLOCK
      ?auto_47860 - BLOCK
      ?auto_47861 - BLOCK
    )
    :vars
    (
      ?auto_47862 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_47860 ) ( ON ?auto_47861 ?auto_47862 ) ( CLEAR ?auto_47861 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47859 ) ( ON ?auto_47860 ?auto_47859 ) ( not ( = ?auto_47859 ?auto_47860 ) ) ( not ( = ?auto_47859 ?auto_47861 ) ) ( not ( = ?auto_47859 ?auto_47862 ) ) ( not ( = ?auto_47860 ?auto_47861 ) ) ( not ( = ?auto_47860 ?auto_47862 ) ) ( not ( = ?auto_47861 ?auto_47862 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47861 ?auto_47862 )
      ( !STACK ?auto_47861 ?auto_47860 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47866 - BLOCK
      ?auto_47867 - BLOCK
      ?auto_47868 - BLOCK
    )
    :vars
    (
      ?auto_47869 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47868 ?auto_47869 ) ( ON-TABLE ?auto_47866 ) ( not ( = ?auto_47866 ?auto_47867 ) ) ( not ( = ?auto_47866 ?auto_47868 ) ) ( not ( = ?auto_47866 ?auto_47869 ) ) ( not ( = ?auto_47867 ?auto_47868 ) ) ( not ( = ?auto_47867 ?auto_47869 ) ) ( not ( = ?auto_47868 ?auto_47869 ) ) ( CLEAR ?auto_47866 ) ( ON ?auto_47867 ?auto_47868 ) ( CLEAR ?auto_47867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47866 ?auto_47867 )
      ( MAKE-3PILE ?auto_47866 ?auto_47867 ?auto_47868 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47873 - BLOCK
      ?auto_47874 - BLOCK
      ?auto_47875 - BLOCK
    )
    :vars
    (
      ?auto_47876 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47875 ?auto_47876 ) ( ON-TABLE ?auto_47873 ) ( not ( = ?auto_47873 ?auto_47874 ) ) ( not ( = ?auto_47873 ?auto_47875 ) ) ( not ( = ?auto_47873 ?auto_47876 ) ) ( not ( = ?auto_47874 ?auto_47875 ) ) ( not ( = ?auto_47874 ?auto_47876 ) ) ( not ( = ?auto_47875 ?auto_47876 ) ) ( CLEAR ?auto_47873 ) ( ON ?auto_47874 ?auto_47875 ) ( CLEAR ?auto_47874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47873 ?auto_47874 )
      ( MAKE-3PILE ?auto_47873 ?auto_47874 ?auto_47875 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47880 - BLOCK
      ?auto_47881 - BLOCK
      ?auto_47882 - BLOCK
    )
    :vars
    (
      ?auto_47883 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47882 ?auto_47883 ) ( not ( = ?auto_47880 ?auto_47881 ) ) ( not ( = ?auto_47880 ?auto_47882 ) ) ( not ( = ?auto_47880 ?auto_47883 ) ) ( not ( = ?auto_47881 ?auto_47882 ) ) ( not ( = ?auto_47881 ?auto_47883 ) ) ( not ( = ?auto_47882 ?auto_47883 ) ) ( ON ?auto_47881 ?auto_47882 ) ( ON ?auto_47880 ?auto_47881 ) ( CLEAR ?auto_47880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47880 )
      ( MAKE-3PILE ?auto_47880 ?auto_47881 ?auto_47882 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47887 - BLOCK
      ?auto_47888 - BLOCK
      ?auto_47889 - BLOCK
    )
    :vars
    (
      ?auto_47890 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47889 ?auto_47890 ) ( not ( = ?auto_47887 ?auto_47888 ) ) ( not ( = ?auto_47887 ?auto_47889 ) ) ( not ( = ?auto_47887 ?auto_47890 ) ) ( not ( = ?auto_47888 ?auto_47889 ) ) ( not ( = ?auto_47888 ?auto_47890 ) ) ( not ( = ?auto_47889 ?auto_47890 ) ) ( ON ?auto_47888 ?auto_47889 ) ( ON ?auto_47887 ?auto_47888 ) ( CLEAR ?auto_47887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47887 )
      ( MAKE-3PILE ?auto_47887 ?auto_47888 ?auto_47889 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47895 - BLOCK
      ?auto_47896 - BLOCK
      ?auto_47897 - BLOCK
      ?auto_47898 - BLOCK
    )
    :vars
    (
      ?auto_47899 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_47897 ) ( ON ?auto_47898 ?auto_47899 ) ( CLEAR ?auto_47898 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47895 ) ( ON ?auto_47896 ?auto_47895 ) ( ON ?auto_47897 ?auto_47896 ) ( not ( = ?auto_47895 ?auto_47896 ) ) ( not ( = ?auto_47895 ?auto_47897 ) ) ( not ( = ?auto_47895 ?auto_47898 ) ) ( not ( = ?auto_47895 ?auto_47899 ) ) ( not ( = ?auto_47896 ?auto_47897 ) ) ( not ( = ?auto_47896 ?auto_47898 ) ) ( not ( = ?auto_47896 ?auto_47899 ) ) ( not ( = ?auto_47897 ?auto_47898 ) ) ( not ( = ?auto_47897 ?auto_47899 ) ) ( not ( = ?auto_47898 ?auto_47899 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47898 ?auto_47899 )
      ( !STACK ?auto_47898 ?auto_47897 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47904 - BLOCK
      ?auto_47905 - BLOCK
      ?auto_47906 - BLOCK
      ?auto_47907 - BLOCK
    )
    :vars
    (
      ?auto_47908 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_47906 ) ( ON ?auto_47907 ?auto_47908 ) ( CLEAR ?auto_47907 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47904 ) ( ON ?auto_47905 ?auto_47904 ) ( ON ?auto_47906 ?auto_47905 ) ( not ( = ?auto_47904 ?auto_47905 ) ) ( not ( = ?auto_47904 ?auto_47906 ) ) ( not ( = ?auto_47904 ?auto_47907 ) ) ( not ( = ?auto_47904 ?auto_47908 ) ) ( not ( = ?auto_47905 ?auto_47906 ) ) ( not ( = ?auto_47905 ?auto_47907 ) ) ( not ( = ?auto_47905 ?auto_47908 ) ) ( not ( = ?auto_47906 ?auto_47907 ) ) ( not ( = ?auto_47906 ?auto_47908 ) ) ( not ( = ?auto_47907 ?auto_47908 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47907 ?auto_47908 )
      ( !STACK ?auto_47907 ?auto_47906 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47913 - BLOCK
      ?auto_47914 - BLOCK
      ?auto_47915 - BLOCK
      ?auto_47916 - BLOCK
    )
    :vars
    (
      ?auto_47917 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47916 ?auto_47917 ) ( ON-TABLE ?auto_47913 ) ( ON ?auto_47914 ?auto_47913 ) ( not ( = ?auto_47913 ?auto_47914 ) ) ( not ( = ?auto_47913 ?auto_47915 ) ) ( not ( = ?auto_47913 ?auto_47916 ) ) ( not ( = ?auto_47913 ?auto_47917 ) ) ( not ( = ?auto_47914 ?auto_47915 ) ) ( not ( = ?auto_47914 ?auto_47916 ) ) ( not ( = ?auto_47914 ?auto_47917 ) ) ( not ( = ?auto_47915 ?auto_47916 ) ) ( not ( = ?auto_47915 ?auto_47917 ) ) ( not ( = ?auto_47916 ?auto_47917 ) ) ( CLEAR ?auto_47914 ) ( ON ?auto_47915 ?auto_47916 ) ( CLEAR ?auto_47915 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47913 ?auto_47914 ?auto_47915 )
      ( MAKE-4PILE ?auto_47913 ?auto_47914 ?auto_47915 ?auto_47916 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47922 - BLOCK
      ?auto_47923 - BLOCK
      ?auto_47924 - BLOCK
      ?auto_47925 - BLOCK
    )
    :vars
    (
      ?auto_47926 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47925 ?auto_47926 ) ( ON-TABLE ?auto_47922 ) ( ON ?auto_47923 ?auto_47922 ) ( not ( = ?auto_47922 ?auto_47923 ) ) ( not ( = ?auto_47922 ?auto_47924 ) ) ( not ( = ?auto_47922 ?auto_47925 ) ) ( not ( = ?auto_47922 ?auto_47926 ) ) ( not ( = ?auto_47923 ?auto_47924 ) ) ( not ( = ?auto_47923 ?auto_47925 ) ) ( not ( = ?auto_47923 ?auto_47926 ) ) ( not ( = ?auto_47924 ?auto_47925 ) ) ( not ( = ?auto_47924 ?auto_47926 ) ) ( not ( = ?auto_47925 ?auto_47926 ) ) ( CLEAR ?auto_47923 ) ( ON ?auto_47924 ?auto_47925 ) ( CLEAR ?auto_47924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47922 ?auto_47923 ?auto_47924 )
      ( MAKE-4PILE ?auto_47922 ?auto_47923 ?auto_47924 ?auto_47925 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47931 - BLOCK
      ?auto_47932 - BLOCK
      ?auto_47933 - BLOCK
      ?auto_47934 - BLOCK
    )
    :vars
    (
      ?auto_47935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47934 ?auto_47935 ) ( ON-TABLE ?auto_47931 ) ( not ( = ?auto_47931 ?auto_47932 ) ) ( not ( = ?auto_47931 ?auto_47933 ) ) ( not ( = ?auto_47931 ?auto_47934 ) ) ( not ( = ?auto_47931 ?auto_47935 ) ) ( not ( = ?auto_47932 ?auto_47933 ) ) ( not ( = ?auto_47932 ?auto_47934 ) ) ( not ( = ?auto_47932 ?auto_47935 ) ) ( not ( = ?auto_47933 ?auto_47934 ) ) ( not ( = ?auto_47933 ?auto_47935 ) ) ( not ( = ?auto_47934 ?auto_47935 ) ) ( ON ?auto_47933 ?auto_47934 ) ( CLEAR ?auto_47931 ) ( ON ?auto_47932 ?auto_47933 ) ( CLEAR ?auto_47932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47931 ?auto_47932 )
      ( MAKE-4PILE ?auto_47931 ?auto_47932 ?auto_47933 ?auto_47934 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47940 - BLOCK
      ?auto_47941 - BLOCK
      ?auto_47942 - BLOCK
      ?auto_47943 - BLOCK
    )
    :vars
    (
      ?auto_47944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47943 ?auto_47944 ) ( ON-TABLE ?auto_47940 ) ( not ( = ?auto_47940 ?auto_47941 ) ) ( not ( = ?auto_47940 ?auto_47942 ) ) ( not ( = ?auto_47940 ?auto_47943 ) ) ( not ( = ?auto_47940 ?auto_47944 ) ) ( not ( = ?auto_47941 ?auto_47942 ) ) ( not ( = ?auto_47941 ?auto_47943 ) ) ( not ( = ?auto_47941 ?auto_47944 ) ) ( not ( = ?auto_47942 ?auto_47943 ) ) ( not ( = ?auto_47942 ?auto_47944 ) ) ( not ( = ?auto_47943 ?auto_47944 ) ) ( ON ?auto_47942 ?auto_47943 ) ( CLEAR ?auto_47940 ) ( ON ?auto_47941 ?auto_47942 ) ( CLEAR ?auto_47941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47940 ?auto_47941 )
      ( MAKE-4PILE ?auto_47940 ?auto_47941 ?auto_47942 ?auto_47943 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47949 - BLOCK
      ?auto_47950 - BLOCK
      ?auto_47951 - BLOCK
      ?auto_47952 - BLOCK
    )
    :vars
    (
      ?auto_47953 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47952 ?auto_47953 ) ( not ( = ?auto_47949 ?auto_47950 ) ) ( not ( = ?auto_47949 ?auto_47951 ) ) ( not ( = ?auto_47949 ?auto_47952 ) ) ( not ( = ?auto_47949 ?auto_47953 ) ) ( not ( = ?auto_47950 ?auto_47951 ) ) ( not ( = ?auto_47950 ?auto_47952 ) ) ( not ( = ?auto_47950 ?auto_47953 ) ) ( not ( = ?auto_47951 ?auto_47952 ) ) ( not ( = ?auto_47951 ?auto_47953 ) ) ( not ( = ?auto_47952 ?auto_47953 ) ) ( ON ?auto_47951 ?auto_47952 ) ( ON ?auto_47950 ?auto_47951 ) ( ON ?auto_47949 ?auto_47950 ) ( CLEAR ?auto_47949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47949 )
      ( MAKE-4PILE ?auto_47949 ?auto_47950 ?auto_47951 ?auto_47952 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47958 - BLOCK
      ?auto_47959 - BLOCK
      ?auto_47960 - BLOCK
      ?auto_47961 - BLOCK
    )
    :vars
    (
      ?auto_47962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47961 ?auto_47962 ) ( not ( = ?auto_47958 ?auto_47959 ) ) ( not ( = ?auto_47958 ?auto_47960 ) ) ( not ( = ?auto_47958 ?auto_47961 ) ) ( not ( = ?auto_47958 ?auto_47962 ) ) ( not ( = ?auto_47959 ?auto_47960 ) ) ( not ( = ?auto_47959 ?auto_47961 ) ) ( not ( = ?auto_47959 ?auto_47962 ) ) ( not ( = ?auto_47960 ?auto_47961 ) ) ( not ( = ?auto_47960 ?auto_47962 ) ) ( not ( = ?auto_47961 ?auto_47962 ) ) ( ON ?auto_47960 ?auto_47961 ) ( ON ?auto_47959 ?auto_47960 ) ( ON ?auto_47958 ?auto_47959 ) ( CLEAR ?auto_47958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47958 )
      ( MAKE-4PILE ?auto_47958 ?auto_47959 ?auto_47960 ?auto_47961 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47968 - BLOCK
      ?auto_47969 - BLOCK
      ?auto_47970 - BLOCK
      ?auto_47971 - BLOCK
      ?auto_47972 - BLOCK
    )
    :vars
    (
      ?auto_47973 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_47971 ) ( ON ?auto_47972 ?auto_47973 ) ( CLEAR ?auto_47972 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47968 ) ( ON ?auto_47969 ?auto_47968 ) ( ON ?auto_47970 ?auto_47969 ) ( ON ?auto_47971 ?auto_47970 ) ( not ( = ?auto_47968 ?auto_47969 ) ) ( not ( = ?auto_47968 ?auto_47970 ) ) ( not ( = ?auto_47968 ?auto_47971 ) ) ( not ( = ?auto_47968 ?auto_47972 ) ) ( not ( = ?auto_47968 ?auto_47973 ) ) ( not ( = ?auto_47969 ?auto_47970 ) ) ( not ( = ?auto_47969 ?auto_47971 ) ) ( not ( = ?auto_47969 ?auto_47972 ) ) ( not ( = ?auto_47969 ?auto_47973 ) ) ( not ( = ?auto_47970 ?auto_47971 ) ) ( not ( = ?auto_47970 ?auto_47972 ) ) ( not ( = ?auto_47970 ?auto_47973 ) ) ( not ( = ?auto_47971 ?auto_47972 ) ) ( not ( = ?auto_47971 ?auto_47973 ) ) ( not ( = ?auto_47972 ?auto_47973 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47972 ?auto_47973 )
      ( !STACK ?auto_47972 ?auto_47971 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47979 - BLOCK
      ?auto_47980 - BLOCK
      ?auto_47981 - BLOCK
      ?auto_47982 - BLOCK
      ?auto_47983 - BLOCK
    )
    :vars
    (
      ?auto_47984 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_47982 ) ( ON ?auto_47983 ?auto_47984 ) ( CLEAR ?auto_47983 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47979 ) ( ON ?auto_47980 ?auto_47979 ) ( ON ?auto_47981 ?auto_47980 ) ( ON ?auto_47982 ?auto_47981 ) ( not ( = ?auto_47979 ?auto_47980 ) ) ( not ( = ?auto_47979 ?auto_47981 ) ) ( not ( = ?auto_47979 ?auto_47982 ) ) ( not ( = ?auto_47979 ?auto_47983 ) ) ( not ( = ?auto_47979 ?auto_47984 ) ) ( not ( = ?auto_47980 ?auto_47981 ) ) ( not ( = ?auto_47980 ?auto_47982 ) ) ( not ( = ?auto_47980 ?auto_47983 ) ) ( not ( = ?auto_47980 ?auto_47984 ) ) ( not ( = ?auto_47981 ?auto_47982 ) ) ( not ( = ?auto_47981 ?auto_47983 ) ) ( not ( = ?auto_47981 ?auto_47984 ) ) ( not ( = ?auto_47982 ?auto_47983 ) ) ( not ( = ?auto_47982 ?auto_47984 ) ) ( not ( = ?auto_47983 ?auto_47984 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47983 ?auto_47984 )
      ( !STACK ?auto_47983 ?auto_47982 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47990 - BLOCK
      ?auto_47991 - BLOCK
      ?auto_47992 - BLOCK
      ?auto_47993 - BLOCK
      ?auto_47994 - BLOCK
    )
    :vars
    (
      ?auto_47995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47994 ?auto_47995 ) ( ON-TABLE ?auto_47990 ) ( ON ?auto_47991 ?auto_47990 ) ( ON ?auto_47992 ?auto_47991 ) ( not ( = ?auto_47990 ?auto_47991 ) ) ( not ( = ?auto_47990 ?auto_47992 ) ) ( not ( = ?auto_47990 ?auto_47993 ) ) ( not ( = ?auto_47990 ?auto_47994 ) ) ( not ( = ?auto_47990 ?auto_47995 ) ) ( not ( = ?auto_47991 ?auto_47992 ) ) ( not ( = ?auto_47991 ?auto_47993 ) ) ( not ( = ?auto_47991 ?auto_47994 ) ) ( not ( = ?auto_47991 ?auto_47995 ) ) ( not ( = ?auto_47992 ?auto_47993 ) ) ( not ( = ?auto_47992 ?auto_47994 ) ) ( not ( = ?auto_47992 ?auto_47995 ) ) ( not ( = ?auto_47993 ?auto_47994 ) ) ( not ( = ?auto_47993 ?auto_47995 ) ) ( not ( = ?auto_47994 ?auto_47995 ) ) ( CLEAR ?auto_47992 ) ( ON ?auto_47993 ?auto_47994 ) ( CLEAR ?auto_47993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47990 ?auto_47991 ?auto_47992 ?auto_47993 )
      ( MAKE-5PILE ?auto_47990 ?auto_47991 ?auto_47992 ?auto_47993 ?auto_47994 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48001 - BLOCK
      ?auto_48002 - BLOCK
      ?auto_48003 - BLOCK
      ?auto_48004 - BLOCK
      ?auto_48005 - BLOCK
    )
    :vars
    (
      ?auto_48006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48005 ?auto_48006 ) ( ON-TABLE ?auto_48001 ) ( ON ?auto_48002 ?auto_48001 ) ( ON ?auto_48003 ?auto_48002 ) ( not ( = ?auto_48001 ?auto_48002 ) ) ( not ( = ?auto_48001 ?auto_48003 ) ) ( not ( = ?auto_48001 ?auto_48004 ) ) ( not ( = ?auto_48001 ?auto_48005 ) ) ( not ( = ?auto_48001 ?auto_48006 ) ) ( not ( = ?auto_48002 ?auto_48003 ) ) ( not ( = ?auto_48002 ?auto_48004 ) ) ( not ( = ?auto_48002 ?auto_48005 ) ) ( not ( = ?auto_48002 ?auto_48006 ) ) ( not ( = ?auto_48003 ?auto_48004 ) ) ( not ( = ?auto_48003 ?auto_48005 ) ) ( not ( = ?auto_48003 ?auto_48006 ) ) ( not ( = ?auto_48004 ?auto_48005 ) ) ( not ( = ?auto_48004 ?auto_48006 ) ) ( not ( = ?auto_48005 ?auto_48006 ) ) ( CLEAR ?auto_48003 ) ( ON ?auto_48004 ?auto_48005 ) ( CLEAR ?auto_48004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48001 ?auto_48002 ?auto_48003 ?auto_48004 )
      ( MAKE-5PILE ?auto_48001 ?auto_48002 ?auto_48003 ?auto_48004 ?auto_48005 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48012 - BLOCK
      ?auto_48013 - BLOCK
      ?auto_48014 - BLOCK
      ?auto_48015 - BLOCK
      ?auto_48016 - BLOCK
    )
    :vars
    (
      ?auto_48017 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48016 ?auto_48017 ) ( ON-TABLE ?auto_48012 ) ( ON ?auto_48013 ?auto_48012 ) ( not ( = ?auto_48012 ?auto_48013 ) ) ( not ( = ?auto_48012 ?auto_48014 ) ) ( not ( = ?auto_48012 ?auto_48015 ) ) ( not ( = ?auto_48012 ?auto_48016 ) ) ( not ( = ?auto_48012 ?auto_48017 ) ) ( not ( = ?auto_48013 ?auto_48014 ) ) ( not ( = ?auto_48013 ?auto_48015 ) ) ( not ( = ?auto_48013 ?auto_48016 ) ) ( not ( = ?auto_48013 ?auto_48017 ) ) ( not ( = ?auto_48014 ?auto_48015 ) ) ( not ( = ?auto_48014 ?auto_48016 ) ) ( not ( = ?auto_48014 ?auto_48017 ) ) ( not ( = ?auto_48015 ?auto_48016 ) ) ( not ( = ?auto_48015 ?auto_48017 ) ) ( not ( = ?auto_48016 ?auto_48017 ) ) ( ON ?auto_48015 ?auto_48016 ) ( CLEAR ?auto_48013 ) ( ON ?auto_48014 ?auto_48015 ) ( CLEAR ?auto_48014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48012 ?auto_48013 ?auto_48014 )
      ( MAKE-5PILE ?auto_48012 ?auto_48013 ?auto_48014 ?auto_48015 ?auto_48016 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48023 - BLOCK
      ?auto_48024 - BLOCK
      ?auto_48025 - BLOCK
      ?auto_48026 - BLOCK
      ?auto_48027 - BLOCK
    )
    :vars
    (
      ?auto_48028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48027 ?auto_48028 ) ( ON-TABLE ?auto_48023 ) ( ON ?auto_48024 ?auto_48023 ) ( not ( = ?auto_48023 ?auto_48024 ) ) ( not ( = ?auto_48023 ?auto_48025 ) ) ( not ( = ?auto_48023 ?auto_48026 ) ) ( not ( = ?auto_48023 ?auto_48027 ) ) ( not ( = ?auto_48023 ?auto_48028 ) ) ( not ( = ?auto_48024 ?auto_48025 ) ) ( not ( = ?auto_48024 ?auto_48026 ) ) ( not ( = ?auto_48024 ?auto_48027 ) ) ( not ( = ?auto_48024 ?auto_48028 ) ) ( not ( = ?auto_48025 ?auto_48026 ) ) ( not ( = ?auto_48025 ?auto_48027 ) ) ( not ( = ?auto_48025 ?auto_48028 ) ) ( not ( = ?auto_48026 ?auto_48027 ) ) ( not ( = ?auto_48026 ?auto_48028 ) ) ( not ( = ?auto_48027 ?auto_48028 ) ) ( ON ?auto_48026 ?auto_48027 ) ( CLEAR ?auto_48024 ) ( ON ?auto_48025 ?auto_48026 ) ( CLEAR ?auto_48025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48023 ?auto_48024 ?auto_48025 )
      ( MAKE-5PILE ?auto_48023 ?auto_48024 ?auto_48025 ?auto_48026 ?auto_48027 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48034 - BLOCK
      ?auto_48035 - BLOCK
      ?auto_48036 - BLOCK
      ?auto_48037 - BLOCK
      ?auto_48038 - BLOCK
    )
    :vars
    (
      ?auto_48039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48038 ?auto_48039 ) ( ON-TABLE ?auto_48034 ) ( not ( = ?auto_48034 ?auto_48035 ) ) ( not ( = ?auto_48034 ?auto_48036 ) ) ( not ( = ?auto_48034 ?auto_48037 ) ) ( not ( = ?auto_48034 ?auto_48038 ) ) ( not ( = ?auto_48034 ?auto_48039 ) ) ( not ( = ?auto_48035 ?auto_48036 ) ) ( not ( = ?auto_48035 ?auto_48037 ) ) ( not ( = ?auto_48035 ?auto_48038 ) ) ( not ( = ?auto_48035 ?auto_48039 ) ) ( not ( = ?auto_48036 ?auto_48037 ) ) ( not ( = ?auto_48036 ?auto_48038 ) ) ( not ( = ?auto_48036 ?auto_48039 ) ) ( not ( = ?auto_48037 ?auto_48038 ) ) ( not ( = ?auto_48037 ?auto_48039 ) ) ( not ( = ?auto_48038 ?auto_48039 ) ) ( ON ?auto_48037 ?auto_48038 ) ( ON ?auto_48036 ?auto_48037 ) ( CLEAR ?auto_48034 ) ( ON ?auto_48035 ?auto_48036 ) ( CLEAR ?auto_48035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48034 ?auto_48035 )
      ( MAKE-5PILE ?auto_48034 ?auto_48035 ?auto_48036 ?auto_48037 ?auto_48038 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48045 - BLOCK
      ?auto_48046 - BLOCK
      ?auto_48047 - BLOCK
      ?auto_48048 - BLOCK
      ?auto_48049 - BLOCK
    )
    :vars
    (
      ?auto_48050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48049 ?auto_48050 ) ( ON-TABLE ?auto_48045 ) ( not ( = ?auto_48045 ?auto_48046 ) ) ( not ( = ?auto_48045 ?auto_48047 ) ) ( not ( = ?auto_48045 ?auto_48048 ) ) ( not ( = ?auto_48045 ?auto_48049 ) ) ( not ( = ?auto_48045 ?auto_48050 ) ) ( not ( = ?auto_48046 ?auto_48047 ) ) ( not ( = ?auto_48046 ?auto_48048 ) ) ( not ( = ?auto_48046 ?auto_48049 ) ) ( not ( = ?auto_48046 ?auto_48050 ) ) ( not ( = ?auto_48047 ?auto_48048 ) ) ( not ( = ?auto_48047 ?auto_48049 ) ) ( not ( = ?auto_48047 ?auto_48050 ) ) ( not ( = ?auto_48048 ?auto_48049 ) ) ( not ( = ?auto_48048 ?auto_48050 ) ) ( not ( = ?auto_48049 ?auto_48050 ) ) ( ON ?auto_48048 ?auto_48049 ) ( ON ?auto_48047 ?auto_48048 ) ( CLEAR ?auto_48045 ) ( ON ?auto_48046 ?auto_48047 ) ( CLEAR ?auto_48046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48045 ?auto_48046 )
      ( MAKE-5PILE ?auto_48045 ?auto_48046 ?auto_48047 ?auto_48048 ?auto_48049 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48056 - BLOCK
      ?auto_48057 - BLOCK
      ?auto_48058 - BLOCK
      ?auto_48059 - BLOCK
      ?auto_48060 - BLOCK
    )
    :vars
    (
      ?auto_48061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48060 ?auto_48061 ) ( not ( = ?auto_48056 ?auto_48057 ) ) ( not ( = ?auto_48056 ?auto_48058 ) ) ( not ( = ?auto_48056 ?auto_48059 ) ) ( not ( = ?auto_48056 ?auto_48060 ) ) ( not ( = ?auto_48056 ?auto_48061 ) ) ( not ( = ?auto_48057 ?auto_48058 ) ) ( not ( = ?auto_48057 ?auto_48059 ) ) ( not ( = ?auto_48057 ?auto_48060 ) ) ( not ( = ?auto_48057 ?auto_48061 ) ) ( not ( = ?auto_48058 ?auto_48059 ) ) ( not ( = ?auto_48058 ?auto_48060 ) ) ( not ( = ?auto_48058 ?auto_48061 ) ) ( not ( = ?auto_48059 ?auto_48060 ) ) ( not ( = ?auto_48059 ?auto_48061 ) ) ( not ( = ?auto_48060 ?auto_48061 ) ) ( ON ?auto_48059 ?auto_48060 ) ( ON ?auto_48058 ?auto_48059 ) ( ON ?auto_48057 ?auto_48058 ) ( ON ?auto_48056 ?auto_48057 ) ( CLEAR ?auto_48056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48056 )
      ( MAKE-5PILE ?auto_48056 ?auto_48057 ?auto_48058 ?auto_48059 ?auto_48060 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48067 - BLOCK
      ?auto_48068 - BLOCK
      ?auto_48069 - BLOCK
      ?auto_48070 - BLOCK
      ?auto_48071 - BLOCK
    )
    :vars
    (
      ?auto_48072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48071 ?auto_48072 ) ( not ( = ?auto_48067 ?auto_48068 ) ) ( not ( = ?auto_48067 ?auto_48069 ) ) ( not ( = ?auto_48067 ?auto_48070 ) ) ( not ( = ?auto_48067 ?auto_48071 ) ) ( not ( = ?auto_48067 ?auto_48072 ) ) ( not ( = ?auto_48068 ?auto_48069 ) ) ( not ( = ?auto_48068 ?auto_48070 ) ) ( not ( = ?auto_48068 ?auto_48071 ) ) ( not ( = ?auto_48068 ?auto_48072 ) ) ( not ( = ?auto_48069 ?auto_48070 ) ) ( not ( = ?auto_48069 ?auto_48071 ) ) ( not ( = ?auto_48069 ?auto_48072 ) ) ( not ( = ?auto_48070 ?auto_48071 ) ) ( not ( = ?auto_48070 ?auto_48072 ) ) ( not ( = ?auto_48071 ?auto_48072 ) ) ( ON ?auto_48070 ?auto_48071 ) ( ON ?auto_48069 ?auto_48070 ) ( ON ?auto_48068 ?auto_48069 ) ( ON ?auto_48067 ?auto_48068 ) ( CLEAR ?auto_48067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48067 )
      ( MAKE-5PILE ?auto_48067 ?auto_48068 ?auto_48069 ?auto_48070 ?auto_48071 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48079 - BLOCK
      ?auto_48080 - BLOCK
      ?auto_48081 - BLOCK
      ?auto_48082 - BLOCK
      ?auto_48083 - BLOCK
      ?auto_48084 - BLOCK
    )
    :vars
    (
      ?auto_48085 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_48083 ) ( ON ?auto_48084 ?auto_48085 ) ( CLEAR ?auto_48084 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48079 ) ( ON ?auto_48080 ?auto_48079 ) ( ON ?auto_48081 ?auto_48080 ) ( ON ?auto_48082 ?auto_48081 ) ( ON ?auto_48083 ?auto_48082 ) ( not ( = ?auto_48079 ?auto_48080 ) ) ( not ( = ?auto_48079 ?auto_48081 ) ) ( not ( = ?auto_48079 ?auto_48082 ) ) ( not ( = ?auto_48079 ?auto_48083 ) ) ( not ( = ?auto_48079 ?auto_48084 ) ) ( not ( = ?auto_48079 ?auto_48085 ) ) ( not ( = ?auto_48080 ?auto_48081 ) ) ( not ( = ?auto_48080 ?auto_48082 ) ) ( not ( = ?auto_48080 ?auto_48083 ) ) ( not ( = ?auto_48080 ?auto_48084 ) ) ( not ( = ?auto_48080 ?auto_48085 ) ) ( not ( = ?auto_48081 ?auto_48082 ) ) ( not ( = ?auto_48081 ?auto_48083 ) ) ( not ( = ?auto_48081 ?auto_48084 ) ) ( not ( = ?auto_48081 ?auto_48085 ) ) ( not ( = ?auto_48082 ?auto_48083 ) ) ( not ( = ?auto_48082 ?auto_48084 ) ) ( not ( = ?auto_48082 ?auto_48085 ) ) ( not ( = ?auto_48083 ?auto_48084 ) ) ( not ( = ?auto_48083 ?auto_48085 ) ) ( not ( = ?auto_48084 ?auto_48085 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48084 ?auto_48085 )
      ( !STACK ?auto_48084 ?auto_48083 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48092 - BLOCK
      ?auto_48093 - BLOCK
      ?auto_48094 - BLOCK
      ?auto_48095 - BLOCK
      ?auto_48096 - BLOCK
      ?auto_48097 - BLOCK
    )
    :vars
    (
      ?auto_48098 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_48096 ) ( ON ?auto_48097 ?auto_48098 ) ( CLEAR ?auto_48097 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48092 ) ( ON ?auto_48093 ?auto_48092 ) ( ON ?auto_48094 ?auto_48093 ) ( ON ?auto_48095 ?auto_48094 ) ( ON ?auto_48096 ?auto_48095 ) ( not ( = ?auto_48092 ?auto_48093 ) ) ( not ( = ?auto_48092 ?auto_48094 ) ) ( not ( = ?auto_48092 ?auto_48095 ) ) ( not ( = ?auto_48092 ?auto_48096 ) ) ( not ( = ?auto_48092 ?auto_48097 ) ) ( not ( = ?auto_48092 ?auto_48098 ) ) ( not ( = ?auto_48093 ?auto_48094 ) ) ( not ( = ?auto_48093 ?auto_48095 ) ) ( not ( = ?auto_48093 ?auto_48096 ) ) ( not ( = ?auto_48093 ?auto_48097 ) ) ( not ( = ?auto_48093 ?auto_48098 ) ) ( not ( = ?auto_48094 ?auto_48095 ) ) ( not ( = ?auto_48094 ?auto_48096 ) ) ( not ( = ?auto_48094 ?auto_48097 ) ) ( not ( = ?auto_48094 ?auto_48098 ) ) ( not ( = ?auto_48095 ?auto_48096 ) ) ( not ( = ?auto_48095 ?auto_48097 ) ) ( not ( = ?auto_48095 ?auto_48098 ) ) ( not ( = ?auto_48096 ?auto_48097 ) ) ( not ( = ?auto_48096 ?auto_48098 ) ) ( not ( = ?auto_48097 ?auto_48098 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48097 ?auto_48098 )
      ( !STACK ?auto_48097 ?auto_48096 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48105 - BLOCK
      ?auto_48106 - BLOCK
      ?auto_48107 - BLOCK
      ?auto_48108 - BLOCK
      ?auto_48109 - BLOCK
      ?auto_48110 - BLOCK
    )
    :vars
    (
      ?auto_48111 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48110 ?auto_48111 ) ( ON-TABLE ?auto_48105 ) ( ON ?auto_48106 ?auto_48105 ) ( ON ?auto_48107 ?auto_48106 ) ( ON ?auto_48108 ?auto_48107 ) ( not ( = ?auto_48105 ?auto_48106 ) ) ( not ( = ?auto_48105 ?auto_48107 ) ) ( not ( = ?auto_48105 ?auto_48108 ) ) ( not ( = ?auto_48105 ?auto_48109 ) ) ( not ( = ?auto_48105 ?auto_48110 ) ) ( not ( = ?auto_48105 ?auto_48111 ) ) ( not ( = ?auto_48106 ?auto_48107 ) ) ( not ( = ?auto_48106 ?auto_48108 ) ) ( not ( = ?auto_48106 ?auto_48109 ) ) ( not ( = ?auto_48106 ?auto_48110 ) ) ( not ( = ?auto_48106 ?auto_48111 ) ) ( not ( = ?auto_48107 ?auto_48108 ) ) ( not ( = ?auto_48107 ?auto_48109 ) ) ( not ( = ?auto_48107 ?auto_48110 ) ) ( not ( = ?auto_48107 ?auto_48111 ) ) ( not ( = ?auto_48108 ?auto_48109 ) ) ( not ( = ?auto_48108 ?auto_48110 ) ) ( not ( = ?auto_48108 ?auto_48111 ) ) ( not ( = ?auto_48109 ?auto_48110 ) ) ( not ( = ?auto_48109 ?auto_48111 ) ) ( not ( = ?auto_48110 ?auto_48111 ) ) ( CLEAR ?auto_48108 ) ( ON ?auto_48109 ?auto_48110 ) ( CLEAR ?auto_48109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48105 ?auto_48106 ?auto_48107 ?auto_48108 ?auto_48109 )
      ( MAKE-6PILE ?auto_48105 ?auto_48106 ?auto_48107 ?auto_48108 ?auto_48109 ?auto_48110 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48118 - BLOCK
      ?auto_48119 - BLOCK
      ?auto_48120 - BLOCK
      ?auto_48121 - BLOCK
      ?auto_48122 - BLOCK
      ?auto_48123 - BLOCK
    )
    :vars
    (
      ?auto_48124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48123 ?auto_48124 ) ( ON-TABLE ?auto_48118 ) ( ON ?auto_48119 ?auto_48118 ) ( ON ?auto_48120 ?auto_48119 ) ( ON ?auto_48121 ?auto_48120 ) ( not ( = ?auto_48118 ?auto_48119 ) ) ( not ( = ?auto_48118 ?auto_48120 ) ) ( not ( = ?auto_48118 ?auto_48121 ) ) ( not ( = ?auto_48118 ?auto_48122 ) ) ( not ( = ?auto_48118 ?auto_48123 ) ) ( not ( = ?auto_48118 ?auto_48124 ) ) ( not ( = ?auto_48119 ?auto_48120 ) ) ( not ( = ?auto_48119 ?auto_48121 ) ) ( not ( = ?auto_48119 ?auto_48122 ) ) ( not ( = ?auto_48119 ?auto_48123 ) ) ( not ( = ?auto_48119 ?auto_48124 ) ) ( not ( = ?auto_48120 ?auto_48121 ) ) ( not ( = ?auto_48120 ?auto_48122 ) ) ( not ( = ?auto_48120 ?auto_48123 ) ) ( not ( = ?auto_48120 ?auto_48124 ) ) ( not ( = ?auto_48121 ?auto_48122 ) ) ( not ( = ?auto_48121 ?auto_48123 ) ) ( not ( = ?auto_48121 ?auto_48124 ) ) ( not ( = ?auto_48122 ?auto_48123 ) ) ( not ( = ?auto_48122 ?auto_48124 ) ) ( not ( = ?auto_48123 ?auto_48124 ) ) ( CLEAR ?auto_48121 ) ( ON ?auto_48122 ?auto_48123 ) ( CLEAR ?auto_48122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48118 ?auto_48119 ?auto_48120 ?auto_48121 ?auto_48122 )
      ( MAKE-6PILE ?auto_48118 ?auto_48119 ?auto_48120 ?auto_48121 ?auto_48122 ?auto_48123 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48131 - BLOCK
      ?auto_48132 - BLOCK
      ?auto_48133 - BLOCK
      ?auto_48134 - BLOCK
      ?auto_48135 - BLOCK
      ?auto_48136 - BLOCK
    )
    :vars
    (
      ?auto_48137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48136 ?auto_48137 ) ( ON-TABLE ?auto_48131 ) ( ON ?auto_48132 ?auto_48131 ) ( ON ?auto_48133 ?auto_48132 ) ( not ( = ?auto_48131 ?auto_48132 ) ) ( not ( = ?auto_48131 ?auto_48133 ) ) ( not ( = ?auto_48131 ?auto_48134 ) ) ( not ( = ?auto_48131 ?auto_48135 ) ) ( not ( = ?auto_48131 ?auto_48136 ) ) ( not ( = ?auto_48131 ?auto_48137 ) ) ( not ( = ?auto_48132 ?auto_48133 ) ) ( not ( = ?auto_48132 ?auto_48134 ) ) ( not ( = ?auto_48132 ?auto_48135 ) ) ( not ( = ?auto_48132 ?auto_48136 ) ) ( not ( = ?auto_48132 ?auto_48137 ) ) ( not ( = ?auto_48133 ?auto_48134 ) ) ( not ( = ?auto_48133 ?auto_48135 ) ) ( not ( = ?auto_48133 ?auto_48136 ) ) ( not ( = ?auto_48133 ?auto_48137 ) ) ( not ( = ?auto_48134 ?auto_48135 ) ) ( not ( = ?auto_48134 ?auto_48136 ) ) ( not ( = ?auto_48134 ?auto_48137 ) ) ( not ( = ?auto_48135 ?auto_48136 ) ) ( not ( = ?auto_48135 ?auto_48137 ) ) ( not ( = ?auto_48136 ?auto_48137 ) ) ( ON ?auto_48135 ?auto_48136 ) ( CLEAR ?auto_48133 ) ( ON ?auto_48134 ?auto_48135 ) ( CLEAR ?auto_48134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48131 ?auto_48132 ?auto_48133 ?auto_48134 )
      ( MAKE-6PILE ?auto_48131 ?auto_48132 ?auto_48133 ?auto_48134 ?auto_48135 ?auto_48136 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48144 - BLOCK
      ?auto_48145 - BLOCK
      ?auto_48146 - BLOCK
      ?auto_48147 - BLOCK
      ?auto_48148 - BLOCK
      ?auto_48149 - BLOCK
    )
    :vars
    (
      ?auto_48150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48149 ?auto_48150 ) ( ON-TABLE ?auto_48144 ) ( ON ?auto_48145 ?auto_48144 ) ( ON ?auto_48146 ?auto_48145 ) ( not ( = ?auto_48144 ?auto_48145 ) ) ( not ( = ?auto_48144 ?auto_48146 ) ) ( not ( = ?auto_48144 ?auto_48147 ) ) ( not ( = ?auto_48144 ?auto_48148 ) ) ( not ( = ?auto_48144 ?auto_48149 ) ) ( not ( = ?auto_48144 ?auto_48150 ) ) ( not ( = ?auto_48145 ?auto_48146 ) ) ( not ( = ?auto_48145 ?auto_48147 ) ) ( not ( = ?auto_48145 ?auto_48148 ) ) ( not ( = ?auto_48145 ?auto_48149 ) ) ( not ( = ?auto_48145 ?auto_48150 ) ) ( not ( = ?auto_48146 ?auto_48147 ) ) ( not ( = ?auto_48146 ?auto_48148 ) ) ( not ( = ?auto_48146 ?auto_48149 ) ) ( not ( = ?auto_48146 ?auto_48150 ) ) ( not ( = ?auto_48147 ?auto_48148 ) ) ( not ( = ?auto_48147 ?auto_48149 ) ) ( not ( = ?auto_48147 ?auto_48150 ) ) ( not ( = ?auto_48148 ?auto_48149 ) ) ( not ( = ?auto_48148 ?auto_48150 ) ) ( not ( = ?auto_48149 ?auto_48150 ) ) ( ON ?auto_48148 ?auto_48149 ) ( CLEAR ?auto_48146 ) ( ON ?auto_48147 ?auto_48148 ) ( CLEAR ?auto_48147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48144 ?auto_48145 ?auto_48146 ?auto_48147 )
      ( MAKE-6PILE ?auto_48144 ?auto_48145 ?auto_48146 ?auto_48147 ?auto_48148 ?auto_48149 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48157 - BLOCK
      ?auto_48158 - BLOCK
      ?auto_48159 - BLOCK
      ?auto_48160 - BLOCK
      ?auto_48161 - BLOCK
      ?auto_48162 - BLOCK
    )
    :vars
    (
      ?auto_48163 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48162 ?auto_48163 ) ( ON-TABLE ?auto_48157 ) ( ON ?auto_48158 ?auto_48157 ) ( not ( = ?auto_48157 ?auto_48158 ) ) ( not ( = ?auto_48157 ?auto_48159 ) ) ( not ( = ?auto_48157 ?auto_48160 ) ) ( not ( = ?auto_48157 ?auto_48161 ) ) ( not ( = ?auto_48157 ?auto_48162 ) ) ( not ( = ?auto_48157 ?auto_48163 ) ) ( not ( = ?auto_48158 ?auto_48159 ) ) ( not ( = ?auto_48158 ?auto_48160 ) ) ( not ( = ?auto_48158 ?auto_48161 ) ) ( not ( = ?auto_48158 ?auto_48162 ) ) ( not ( = ?auto_48158 ?auto_48163 ) ) ( not ( = ?auto_48159 ?auto_48160 ) ) ( not ( = ?auto_48159 ?auto_48161 ) ) ( not ( = ?auto_48159 ?auto_48162 ) ) ( not ( = ?auto_48159 ?auto_48163 ) ) ( not ( = ?auto_48160 ?auto_48161 ) ) ( not ( = ?auto_48160 ?auto_48162 ) ) ( not ( = ?auto_48160 ?auto_48163 ) ) ( not ( = ?auto_48161 ?auto_48162 ) ) ( not ( = ?auto_48161 ?auto_48163 ) ) ( not ( = ?auto_48162 ?auto_48163 ) ) ( ON ?auto_48161 ?auto_48162 ) ( ON ?auto_48160 ?auto_48161 ) ( CLEAR ?auto_48158 ) ( ON ?auto_48159 ?auto_48160 ) ( CLEAR ?auto_48159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48157 ?auto_48158 ?auto_48159 )
      ( MAKE-6PILE ?auto_48157 ?auto_48158 ?auto_48159 ?auto_48160 ?auto_48161 ?auto_48162 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48170 - BLOCK
      ?auto_48171 - BLOCK
      ?auto_48172 - BLOCK
      ?auto_48173 - BLOCK
      ?auto_48174 - BLOCK
      ?auto_48175 - BLOCK
    )
    :vars
    (
      ?auto_48176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48175 ?auto_48176 ) ( ON-TABLE ?auto_48170 ) ( ON ?auto_48171 ?auto_48170 ) ( not ( = ?auto_48170 ?auto_48171 ) ) ( not ( = ?auto_48170 ?auto_48172 ) ) ( not ( = ?auto_48170 ?auto_48173 ) ) ( not ( = ?auto_48170 ?auto_48174 ) ) ( not ( = ?auto_48170 ?auto_48175 ) ) ( not ( = ?auto_48170 ?auto_48176 ) ) ( not ( = ?auto_48171 ?auto_48172 ) ) ( not ( = ?auto_48171 ?auto_48173 ) ) ( not ( = ?auto_48171 ?auto_48174 ) ) ( not ( = ?auto_48171 ?auto_48175 ) ) ( not ( = ?auto_48171 ?auto_48176 ) ) ( not ( = ?auto_48172 ?auto_48173 ) ) ( not ( = ?auto_48172 ?auto_48174 ) ) ( not ( = ?auto_48172 ?auto_48175 ) ) ( not ( = ?auto_48172 ?auto_48176 ) ) ( not ( = ?auto_48173 ?auto_48174 ) ) ( not ( = ?auto_48173 ?auto_48175 ) ) ( not ( = ?auto_48173 ?auto_48176 ) ) ( not ( = ?auto_48174 ?auto_48175 ) ) ( not ( = ?auto_48174 ?auto_48176 ) ) ( not ( = ?auto_48175 ?auto_48176 ) ) ( ON ?auto_48174 ?auto_48175 ) ( ON ?auto_48173 ?auto_48174 ) ( CLEAR ?auto_48171 ) ( ON ?auto_48172 ?auto_48173 ) ( CLEAR ?auto_48172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48170 ?auto_48171 ?auto_48172 )
      ( MAKE-6PILE ?auto_48170 ?auto_48171 ?auto_48172 ?auto_48173 ?auto_48174 ?auto_48175 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48183 - BLOCK
      ?auto_48184 - BLOCK
      ?auto_48185 - BLOCK
      ?auto_48186 - BLOCK
      ?auto_48187 - BLOCK
      ?auto_48188 - BLOCK
    )
    :vars
    (
      ?auto_48189 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48188 ?auto_48189 ) ( ON-TABLE ?auto_48183 ) ( not ( = ?auto_48183 ?auto_48184 ) ) ( not ( = ?auto_48183 ?auto_48185 ) ) ( not ( = ?auto_48183 ?auto_48186 ) ) ( not ( = ?auto_48183 ?auto_48187 ) ) ( not ( = ?auto_48183 ?auto_48188 ) ) ( not ( = ?auto_48183 ?auto_48189 ) ) ( not ( = ?auto_48184 ?auto_48185 ) ) ( not ( = ?auto_48184 ?auto_48186 ) ) ( not ( = ?auto_48184 ?auto_48187 ) ) ( not ( = ?auto_48184 ?auto_48188 ) ) ( not ( = ?auto_48184 ?auto_48189 ) ) ( not ( = ?auto_48185 ?auto_48186 ) ) ( not ( = ?auto_48185 ?auto_48187 ) ) ( not ( = ?auto_48185 ?auto_48188 ) ) ( not ( = ?auto_48185 ?auto_48189 ) ) ( not ( = ?auto_48186 ?auto_48187 ) ) ( not ( = ?auto_48186 ?auto_48188 ) ) ( not ( = ?auto_48186 ?auto_48189 ) ) ( not ( = ?auto_48187 ?auto_48188 ) ) ( not ( = ?auto_48187 ?auto_48189 ) ) ( not ( = ?auto_48188 ?auto_48189 ) ) ( ON ?auto_48187 ?auto_48188 ) ( ON ?auto_48186 ?auto_48187 ) ( ON ?auto_48185 ?auto_48186 ) ( CLEAR ?auto_48183 ) ( ON ?auto_48184 ?auto_48185 ) ( CLEAR ?auto_48184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48183 ?auto_48184 )
      ( MAKE-6PILE ?auto_48183 ?auto_48184 ?auto_48185 ?auto_48186 ?auto_48187 ?auto_48188 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48196 - BLOCK
      ?auto_48197 - BLOCK
      ?auto_48198 - BLOCK
      ?auto_48199 - BLOCK
      ?auto_48200 - BLOCK
      ?auto_48201 - BLOCK
    )
    :vars
    (
      ?auto_48202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48201 ?auto_48202 ) ( ON-TABLE ?auto_48196 ) ( not ( = ?auto_48196 ?auto_48197 ) ) ( not ( = ?auto_48196 ?auto_48198 ) ) ( not ( = ?auto_48196 ?auto_48199 ) ) ( not ( = ?auto_48196 ?auto_48200 ) ) ( not ( = ?auto_48196 ?auto_48201 ) ) ( not ( = ?auto_48196 ?auto_48202 ) ) ( not ( = ?auto_48197 ?auto_48198 ) ) ( not ( = ?auto_48197 ?auto_48199 ) ) ( not ( = ?auto_48197 ?auto_48200 ) ) ( not ( = ?auto_48197 ?auto_48201 ) ) ( not ( = ?auto_48197 ?auto_48202 ) ) ( not ( = ?auto_48198 ?auto_48199 ) ) ( not ( = ?auto_48198 ?auto_48200 ) ) ( not ( = ?auto_48198 ?auto_48201 ) ) ( not ( = ?auto_48198 ?auto_48202 ) ) ( not ( = ?auto_48199 ?auto_48200 ) ) ( not ( = ?auto_48199 ?auto_48201 ) ) ( not ( = ?auto_48199 ?auto_48202 ) ) ( not ( = ?auto_48200 ?auto_48201 ) ) ( not ( = ?auto_48200 ?auto_48202 ) ) ( not ( = ?auto_48201 ?auto_48202 ) ) ( ON ?auto_48200 ?auto_48201 ) ( ON ?auto_48199 ?auto_48200 ) ( ON ?auto_48198 ?auto_48199 ) ( CLEAR ?auto_48196 ) ( ON ?auto_48197 ?auto_48198 ) ( CLEAR ?auto_48197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48196 ?auto_48197 )
      ( MAKE-6PILE ?auto_48196 ?auto_48197 ?auto_48198 ?auto_48199 ?auto_48200 ?auto_48201 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48209 - BLOCK
      ?auto_48210 - BLOCK
      ?auto_48211 - BLOCK
      ?auto_48212 - BLOCK
      ?auto_48213 - BLOCK
      ?auto_48214 - BLOCK
    )
    :vars
    (
      ?auto_48215 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48214 ?auto_48215 ) ( not ( = ?auto_48209 ?auto_48210 ) ) ( not ( = ?auto_48209 ?auto_48211 ) ) ( not ( = ?auto_48209 ?auto_48212 ) ) ( not ( = ?auto_48209 ?auto_48213 ) ) ( not ( = ?auto_48209 ?auto_48214 ) ) ( not ( = ?auto_48209 ?auto_48215 ) ) ( not ( = ?auto_48210 ?auto_48211 ) ) ( not ( = ?auto_48210 ?auto_48212 ) ) ( not ( = ?auto_48210 ?auto_48213 ) ) ( not ( = ?auto_48210 ?auto_48214 ) ) ( not ( = ?auto_48210 ?auto_48215 ) ) ( not ( = ?auto_48211 ?auto_48212 ) ) ( not ( = ?auto_48211 ?auto_48213 ) ) ( not ( = ?auto_48211 ?auto_48214 ) ) ( not ( = ?auto_48211 ?auto_48215 ) ) ( not ( = ?auto_48212 ?auto_48213 ) ) ( not ( = ?auto_48212 ?auto_48214 ) ) ( not ( = ?auto_48212 ?auto_48215 ) ) ( not ( = ?auto_48213 ?auto_48214 ) ) ( not ( = ?auto_48213 ?auto_48215 ) ) ( not ( = ?auto_48214 ?auto_48215 ) ) ( ON ?auto_48213 ?auto_48214 ) ( ON ?auto_48212 ?auto_48213 ) ( ON ?auto_48211 ?auto_48212 ) ( ON ?auto_48210 ?auto_48211 ) ( ON ?auto_48209 ?auto_48210 ) ( CLEAR ?auto_48209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48209 )
      ( MAKE-6PILE ?auto_48209 ?auto_48210 ?auto_48211 ?auto_48212 ?auto_48213 ?auto_48214 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48222 - BLOCK
      ?auto_48223 - BLOCK
      ?auto_48224 - BLOCK
      ?auto_48225 - BLOCK
      ?auto_48226 - BLOCK
      ?auto_48227 - BLOCK
    )
    :vars
    (
      ?auto_48228 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48227 ?auto_48228 ) ( not ( = ?auto_48222 ?auto_48223 ) ) ( not ( = ?auto_48222 ?auto_48224 ) ) ( not ( = ?auto_48222 ?auto_48225 ) ) ( not ( = ?auto_48222 ?auto_48226 ) ) ( not ( = ?auto_48222 ?auto_48227 ) ) ( not ( = ?auto_48222 ?auto_48228 ) ) ( not ( = ?auto_48223 ?auto_48224 ) ) ( not ( = ?auto_48223 ?auto_48225 ) ) ( not ( = ?auto_48223 ?auto_48226 ) ) ( not ( = ?auto_48223 ?auto_48227 ) ) ( not ( = ?auto_48223 ?auto_48228 ) ) ( not ( = ?auto_48224 ?auto_48225 ) ) ( not ( = ?auto_48224 ?auto_48226 ) ) ( not ( = ?auto_48224 ?auto_48227 ) ) ( not ( = ?auto_48224 ?auto_48228 ) ) ( not ( = ?auto_48225 ?auto_48226 ) ) ( not ( = ?auto_48225 ?auto_48227 ) ) ( not ( = ?auto_48225 ?auto_48228 ) ) ( not ( = ?auto_48226 ?auto_48227 ) ) ( not ( = ?auto_48226 ?auto_48228 ) ) ( not ( = ?auto_48227 ?auto_48228 ) ) ( ON ?auto_48226 ?auto_48227 ) ( ON ?auto_48225 ?auto_48226 ) ( ON ?auto_48224 ?auto_48225 ) ( ON ?auto_48223 ?auto_48224 ) ( ON ?auto_48222 ?auto_48223 ) ( CLEAR ?auto_48222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48222 )
      ( MAKE-6PILE ?auto_48222 ?auto_48223 ?auto_48224 ?auto_48225 ?auto_48226 ?auto_48227 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_48236 - BLOCK
      ?auto_48237 - BLOCK
      ?auto_48238 - BLOCK
      ?auto_48239 - BLOCK
      ?auto_48240 - BLOCK
      ?auto_48241 - BLOCK
      ?auto_48242 - BLOCK
    )
    :vars
    (
      ?auto_48243 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_48241 ) ( ON ?auto_48242 ?auto_48243 ) ( CLEAR ?auto_48242 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48236 ) ( ON ?auto_48237 ?auto_48236 ) ( ON ?auto_48238 ?auto_48237 ) ( ON ?auto_48239 ?auto_48238 ) ( ON ?auto_48240 ?auto_48239 ) ( ON ?auto_48241 ?auto_48240 ) ( not ( = ?auto_48236 ?auto_48237 ) ) ( not ( = ?auto_48236 ?auto_48238 ) ) ( not ( = ?auto_48236 ?auto_48239 ) ) ( not ( = ?auto_48236 ?auto_48240 ) ) ( not ( = ?auto_48236 ?auto_48241 ) ) ( not ( = ?auto_48236 ?auto_48242 ) ) ( not ( = ?auto_48236 ?auto_48243 ) ) ( not ( = ?auto_48237 ?auto_48238 ) ) ( not ( = ?auto_48237 ?auto_48239 ) ) ( not ( = ?auto_48237 ?auto_48240 ) ) ( not ( = ?auto_48237 ?auto_48241 ) ) ( not ( = ?auto_48237 ?auto_48242 ) ) ( not ( = ?auto_48237 ?auto_48243 ) ) ( not ( = ?auto_48238 ?auto_48239 ) ) ( not ( = ?auto_48238 ?auto_48240 ) ) ( not ( = ?auto_48238 ?auto_48241 ) ) ( not ( = ?auto_48238 ?auto_48242 ) ) ( not ( = ?auto_48238 ?auto_48243 ) ) ( not ( = ?auto_48239 ?auto_48240 ) ) ( not ( = ?auto_48239 ?auto_48241 ) ) ( not ( = ?auto_48239 ?auto_48242 ) ) ( not ( = ?auto_48239 ?auto_48243 ) ) ( not ( = ?auto_48240 ?auto_48241 ) ) ( not ( = ?auto_48240 ?auto_48242 ) ) ( not ( = ?auto_48240 ?auto_48243 ) ) ( not ( = ?auto_48241 ?auto_48242 ) ) ( not ( = ?auto_48241 ?auto_48243 ) ) ( not ( = ?auto_48242 ?auto_48243 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48242 ?auto_48243 )
      ( !STACK ?auto_48242 ?auto_48241 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_48251 - BLOCK
      ?auto_48252 - BLOCK
      ?auto_48253 - BLOCK
      ?auto_48254 - BLOCK
      ?auto_48255 - BLOCK
      ?auto_48256 - BLOCK
      ?auto_48257 - BLOCK
    )
    :vars
    (
      ?auto_48258 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_48256 ) ( ON ?auto_48257 ?auto_48258 ) ( CLEAR ?auto_48257 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48251 ) ( ON ?auto_48252 ?auto_48251 ) ( ON ?auto_48253 ?auto_48252 ) ( ON ?auto_48254 ?auto_48253 ) ( ON ?auto_48255 ?auto_48254 ) ( ON ?auto_48256 ?auto_48255 ) ( not ( = ?auto_48251 ?auto_48252 ) ) ( not ( = ?auto_48251 ?auto_48253 ) ) ( not ( = ?auto_48251 ?auto_48254 ) ) ( not ( = ?auto_48251 ?auto_48255 ) ) ( not ( = ?auto_48251 ?auto_48256 ) ) ( not ( = ?auto_48251 ?auto_48257 ) ) ( not ( = ?auto_48251 ?auto_48258 ) ) ( not ( = ?auto_48252 ?auto_48253 ) ) ( not ( = ?auto_48252 ?auto_48254 ) ) ( not ( = ?auto_48252 ?auto_48255 ) ) ( not ( = ?auto_48252 ?auto_48256 ) ) ( not ( = ?auto_48252 ?auto_48257 ) ) ( not ( = ?auto_48252 ?auto_48258 ) ) ( not ( = ?auto_48253 ?auto_48254 ) ) ( not ( = ?auto_48253 ?auto_48255 ) ) ( not ( = ?auto_48253 ?auto_48256 ) ) ( not ( = ?auto_48253 ?auto_48257 ) ) ( not ( = ?auto_48253 ?auto_48258 ) ) ( not ( = ?auto_48254 ?auto_48255 ) ) ( not ( = ?auto_48254 ?auto_48256 ) ) ( not ( = ?auto_48254 ?auto_48257 ) ) ( not ( = ?auto_48254 ?auto_48258 ) ) ( not ( = ?auto_48255 ?auto_48256 ) ) ( not ( = ?auto_48255 ?auto_48257 ) ) ( not ( = ?auto_48255 ?auto_48258 ) ) ( not ( = ?auto_48256 ?auto_48257 ) ) ( not ( = ?auto_48256 ?auto_48258 ) ) ( not ( = ?auto_48257 ?auto_48258 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48257 ?auto_48258 )
      ( !STACK ?auto_48257 ?auto_48256 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_48266 - BLOCK
      ?auto_48267 - BLOCK
      ?auto_48268 - BLOCK
      ?auto_48269 - BLOCK
      ?auto_48270 - BLOCK
      ?auto_48271 - BLOCK
      ?auto_48272 - BLOCK
    )
    :vars
    (
      ?auto_48273 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48272 ?auto_48273 ) ( ON-TABLE ?auto_48266 ) ( ON ?auto_48267 ?auto_48266 ) ( ON ?auto_48268 ?auto_48267 ) ( ON ?auto_48269 ?auto_48268 ) ( ON ?auto_48270 ?auto_48269 ) ( not ( = ?auto_48266 ?auto_48267 ) ) ( not ( = ?auto_48266 ?auto_48268 ) ) ( not ( = ?auto_48266 ?auto_48269 ) ) ( not ( = ?auto_48266 ?auto_48270 ) ) ( not ( = ?auto_48266 ?auto_48271 ) ) ( not ( = ?auto_48266 ?auto_48272 ) ) ( not ( = ?auto_48266 ?auto_48273 ) ) ( not ( = ?auto_48267 ?auto_48268 ) ) ( not ( = ?auto_48267 ?auto_48269 ) ) ( not ( = ?auto_48267 ?auto_48270 ) ) ( not ( = ?auto_48267 ?auto_48271 ) ) ( not ( = ?auto_48267 ?auto_48272 ) ) ( not ( = ?auto_48267 ?auto_48273 ) ) ( not ( = ?auto_48268 ?auto_48269 ) ) ( not ( = ?auto_48268 ?auto_48270 ) ) ( not ( = ?auto_48268 ?auto_48271 ) ) ( not ( = ?auto_48268 ?auto_48272 ) ) ( not ( = ?auto_48268 ?auto_48273 ) ) ( not ( = ?auto_48269 ?auto_48270 ) ) ( not ( = ?auto_48269 ?auto_48271 ) ) ( not ( = ?auto_48269 ?auto_48272 ) ) ( not ( = ?auto_48269 ?auto_48273 ) ) ( not ( = ?auto_48270 ?auto_48271 ) ) ( not ( = ?auto_48270 ?auto_48272 ) ) ( not ( = ?auto_48270 ?auto_48273 ) ) ( not ( = ?auto_48271 ?auto_48272 ) ) ( not ( = ?auto_48271 ?auto_48273 ) ) ( not ( = ?auto_48272 ?auto_48273 ) ) ( CLEAR ?auto_48270 ) ( ON ?auto_48271 ?auto_48272 ) ( CLEAR ?auto_48271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_48266 ?auto_48267 ?auto_48268 ?auto_48269 ?auto_48270 ?auto_48271 )
      ( MAKE-7PILE ?auto_48266 ?auto_48267 ?auto_48268 ?auto_48269 ?auto_48270 ?auto_48271 ?auto_48272 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_48281 - BLOCK
      ?auto_48282 - BLOCK
      ?auto_48283 - BLOCK
      ?auto_48284 - BLOCK
      ?auto_48285 - BLOCK
      ?auto_48286 - BLOCK
      ?auto_48287 - BLOCK
    )
    :vars
    (
      ?auto_48288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48287 ?auto_48288 ) ( ON-TABLE ?auto_48281 ) ( ON ?auto_48282 ?auto_48281 ) ( ON ?auto_48283 ?auto_48282 ) ( ON ?auto_48284 ?auto_48283 ) ( ON ?auto_48285 ?auto_48284 ) ( not ( = ?auto_48281 ?auto_48282 ) ) ( not ( = ?auto_48281 ?auto_48283 ) ) ( not ( = ?auto_48281 ?auto_48284 ) ) ( not ( = ?auto_48281 ?auto_48285 ) ) ( not ( = ?auto_48281 ?auto_48286 ) ) ( not ( = ?auto_48281 ?auto_48287 ) ) ( not ( = ?auto_48281 ?auto_48288 ) ) ( not ( = ?auto_48282 ?auto_48283 ) ) ( not ( = ?auto_48282 ?auto_48284 ) ) ( not ( = ?auto_48282 ?auto_48285 ) ) ( not ( = ?auto_48282 ?auto_48286 ) ) ( not ( = ?auto_48282 ?auto_48287 ) ) ( not ( = ?auto_48282 ?auto_48288 ) ) ( not ( = ?auto_48283 ?auto_48284 ) ) ( not ( = ?auto_48283 ?auto_48285 ) ) ( not ( = ?auto_48283 ?auto_48286 ) ) ( not ( = ?auto_48283 ?auto_48287 ) ) ( not ( = ?auto_48283 ?auto_48288 ) ) ( not ( = ?auto_48284 ?auto_48285 ) ) ( not ( = ?auto_48284 ?auto_48286 ) ) ( not ( = ?auto_48284 ?auto_48287 ) ) ( not ( = ?auto_48284 ?auto_48288 ) ) ( not ( = ?auto_48285 ?auto_48286 ) ) ( not ( = ?auto_48285 ?auto_48287 ) ) ( not ( = ?auto_48285 ?auto_48288 ) ) ( not ( = ?auto_48286 ?auto_48287 ) ) ( not ( = ?auto_48286 ?auto_48288 ) ) ( not ( = ?auto_48287 ?auto_48288 ) ) ( CLEAR ?auto_48285 ) ( ON ?auto_48286 ?auto_48287 ) ( CLEAR ?auto_48286 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_48281 ?auto_48282 ?auto_48283 ?auto_48284 ?auto_48285 ?auto_48286 )
      ( MAKE-7PILE ?auto_48281 ?auto_48282 ?auto_48283 ?auto_48284 ?auto_48285 ?auto_48286 ?auto_48287 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_48296 - BLOCK
      ?auto_48297 - BLOCK
      ?auto_48298 - BLOCK
      ?auto_48299 - BLOCK
      ?auto_48300 - BLOCK
      ?auto_48301 - BLOCK
      ?auto_48302 - BLOCK
    )
    :vars
    (
      ?auto_48303 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48302 ?auto_48303 ) ( ON-TABLE ?auto_48296 ) ( ON ?auto_48297 ?auto_48296 ) ( ON ?auto_48298 ?auto_48297 ) ( ON ?auto_48299 ?auto_48298 ) ( not ( = ?auto_48296 ?auto_48297 ) ) ( not ( = ?auto_48296 ?auto_48298 ) ) ( not ( = ?auto_48296 ?auto_48299 ) ) ( not ( = ?auto_48296 ?auto_48300 ) ) ( not ( = ?auto_48296 ?auto_48301 ) ) ( not ( = ?auto_48296 ?auto_48302 ) ) ( not ( = ?auto_48296 ?auto_48303 ) ) ( not ( = ?auto_48297 ?auto_48298 ) ) ( not ( = ?auto_48297 ?auto_48299 ) ) ( not ( = ?auto_48297 ?auto_48300 ) ) ( not ( = ?auto_48297 ?auto_48301 ) ) ( not ( = ?auto_48297 ?auto_48302 ) ) ( not ( = ?auto_48297 ?auto_48303 ) ) ( not ( = ?auto_48298 ?auto_48299 ) ) ( not ( = ?auto_48298 ?auto_48300 ) ) ( not ( = ?auto_48298 ?auto_48301 ) ) ( not ( = ?auto_48298 ?auto_48302 ) ) ( not ( = ?auto_48298 ?auto_48303 ) ) ( not ( = ?auto_48299 ?auto_48300 ) ) ( not ( = ?auto_48299 ?auto_48301 ) ) ( not ( = ?auto_48299 ?auto_48302 ) ) ( not ( = ?auto_48299 ?auto_48303 ) ) ( not ( = ?auto_48300 ?auto_48301 ) ) ( not ( = ?auto_48300 ?auto_48302 ) ) ( not ( = ?auto_48300 ?auto_48303 ) ) ( not ( = ?auto_48301 ?auto_48302 ) ) ( not ( = ?auto_48301 ?auto_48303 ) ) ( not ( = ?auto_48302 ?auto_48303 ) ) ( ON ?auto_48301 ?auto_48302 ) ( CLEAR ?auto_48299 ) ( ON ?auto_48300 ?auto_48301 ) ( CLEAR ?auto_48300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48296 ?auto_48297 ?auto_48298 ?auto_48299 ?auto_48300 )
      ( MAKE-7PILE ?auto_48296 ?auto_48297 ?auto_48298 ?auto_48299 ?auto_48300 ?auto_48301 ?auto_48302 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_48311 - BLOCK
      ?auto_48312 - BLOCK
      ?auto_48313 - BLOCK
      ?auto_48314 - BLOCK
      ?auto_48315 - BLOCK
      ?auto_48316 - BLOCK
      ?auto_48317 - BLOCK
    )
    :vars
    (
      ?auto_48318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48317 ?auto_48318 ) ( ON-TABLE ?auto_48311 ) ( ON ?auto_48312 ?auto_48311 ) ( ON ?auto_48313 ?auto_48312 ) ( ON ?auto_48314 ?auto_48313 ) ( not ( = ?auto_48311 ?auto_48312 ) ) ( not ( = ?auto_48311 ?auto_48313 ) ) ( not ( = ?auto_48311 ?auto_48314 ) ) ( not ( = ?auto_48311 ?auto_48315 ) ) ( not ( = ?auto_48311 ?auto_48316 ) ) ( not ( = ?auto_48311 ?auto_48317 ) ) ( not ( = ?auto_48311 ?auto_48318 ) ) ( not ( = ?auto_48312 ?auto_48313 ) ) ( not ( = ?auto_48312 ?auto_48314 ) ) ( not ( = ?auto_48312 ?auto_48315 ) ) ( not ( = ?auto_48312 ?auto_48316 ) ) ( not ( = ?auto_48312 ?auto_48317 ) ) ( not ( = ?auto_48312 ?auto_48318 ) ) ( not ( = ?auto_48313 ?auto_48314 ) ) ( not ( = ?auto_48313 ?auto_48315 ) ) ( not ( = ?auto_48313 ?auto_48316 ) ) ( not ( = ?auto_48313 ?auto_48317 ) ) ( not ( = ?auto_48313 ?auto_48318 ) ) ( not ( = ?auto_48314 ?auto_48315 ) ) ( not ( = ?auto_48314 ?auto_48316 ) ) ( not ( = ?auto_48314 ?auto_48317 ) ) ( not ( = ?auto_48314 ?auto_48318 ) ) ( not ( = ?auto_48315 ?auto_48316 ) ) ( not ( = ?auto_48315 ?auto_48317 ) ) ( not ( = ?auto_48315 ?auto_48318 ) ) ( not ( = ?auto_48316 ?auto_48317 ) ) ( not ( = ?auto_48316 ?auto_48318 ) ) ( not ( = ?auto_48317 ?auto_48318 ) ) ( ON ?auto_48316 ?auto_48317 ) ( CLEAR ?auto_48314 ) ( ON ?auto_48315 ?auto_48316 ) ( CLEAR ?auto_48315 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48311 ?auto_48312 ?auto_48313 ?auto_48314 ?auto_48315 )
      ( MAKE-7PILE ?auto_48311 ?auto_48312 ?auto_48313 ?auto_48314 ?auto_48315 ?auto_48316 ?auto_48317 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_48326 - BLOCK
      ?auto_48327 - BLOCK
      ?auto_48328 - BLOCK
      ?auto_48329 - BLOCK
      ?auto_48330 - BLOCK
      ?auto_48331 - BLOCK
      ?auto_48332 - BLOCK
    )
    :vars
    (
      ?auto_48333 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48332 ?auto_48333 ) ( ON-TABLE ?auto_48326 ) ( ON ?auto_48327 ?auto_48326 ) ( ON ?auto_48328 ?auto_48327 ) ( not ( = ?auto_48326 ?auto_48327 ) ) ( not ( = ?auto_48326 ?auto_48328 ) ) ( not ( = ?auto_48326 ?auto_48329 ) ) ( not ( = ?auto_48326 ?auto_48330 ) ) ( not ( = ?auto_48326 ?auto_48331 ) ) ( not ( = ?auto_48326 ?auto_48332 ) ) ( not ( = ?auto_48326 ?auto_48333 ) ) ( not ( = ?auto_48327 ?auto_48328 ) ) ( not ( = ?auto_48327 ?auto_48329 ) ) ( not ( = ?auto_48327 ?auto_48330 ) ) ( not ( = ?auto_48327 ?auto_48331 ) ) ( not ( = ?auto_48327 ?auto_48332 ) ) ( not ( = ?auto_48327 ?auto_48333 ) ) ( not ( = ?auto_48328 ?auto_48329 ) ) ( not ( = ?auto_48328 ?auto_48330 ) ) ( not ( = ?auto_48328 ?auto_48331 ) ) ( not ( = ?auto_48328 ?auto_48332 ) ) ( not ( = ?auto_48328 ?auto_48333 ) ) ( not ( = ?auto_48329 ?auto_48330 ) ) ( not ( = ?auto_48329 ?auto_48331 ) ) ( not ( = ?auto_48329 ?auto_48332 ) ) ( not ( = ?auto_48329 ?auto_48333 ) ) ( not ( = ?auto_48330 ?auto_48331 ) ) ( not ( = ?auto_48330 ?auto_48332 ) ) ( not ( = ?auto_48330 ?auto_48333 ) ) ( not ( = ?auto_48331 ?auto_48332 ) ) ( not ( = ?auto_48331 ?auto_48333 ) ) ( not ( = ?auto_48332 ?auto_48333 ) ) ( ON ?auto_48331 ?auto_48332 ) ( ON ?auto_48330 ?auto_48331 ) ( CLEAR ?auto_48328 ) ( ON ?auto_48329 ?auto_48330 ) ( CLEAR ?auto_48329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48326 ?auto_48327 ?auto_48328 ?auto_48329 )
      ( MAKE-7PILE ?auto_48326 ?auto_48327 ?auto_48328 ?auto_48329 ?auto_48330 ?auto_48331 ?auto_48332 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_48341 - BLOCK
      ?auto_48342 - BLOCK
      ?auto_48343 - BLOCK
      ?auto_48344 - BLOCK
      ?auto_48345 - BLOCK
      ?auto_48346 - BLOCK
      ?auto_48347 - BLOCK
    )
    :vars
    (
      ?auto_48348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48347 ?auto_48348 ) ( ON-TABLE ?auto_48341 ) ( ON ?auto_48342 ?auto_48341 ) ( ON ?auto_48343 ?auto_48342 ) ( not ( = ?auto_48341 ?auto_48342 ) ) ( not ( = ?auto_48341 ?auto_48343 ) ) ( not ( = ?auto_48341 ?auto_48344 ) ) ( not ( = ?auto_48341 ?auto_48345 ) ) ( not ( = ?auto_48341 ?auto_48346 ) ) ( not ( = ?auto_48341 ?auto_48347 ) ) ( not ( = ?auto_48341 ?auto_48348 ) ) ( not ( = ?auto_48342 ?auto_48343 ) ) ( not ( = ?auto_48342 ?auto_48344 ) ) ( not ( = ?auto_48342 ?auto_48345 ) ) ( not ( = ?auto_48342 ?auto_48346 ) ) ( not ( = ?auto_48342 ?auto_48347 ) ) ( not ( = ?auto_48342 ?auto_48348 ) ) ( not ( = ?auto_48343 ?auto_48344 ) ) ( not ( = ?auto_48343 ?auto_48345 ) ) ( not ( = ?auto_48343 ?auto_48346 ) ) ( not ( = ?auto_48343 ?auto_48347 ) ) ( not ( = ?auto_48343 ?auto_48348 ) ) ( not ( = ?auto_48344 ?auto_48345 ) ) ( not ( = ?auto_48344 ?auto_48346 ) ) ( not ( = ?auto_48344 ?auto_48347 ) ) ( not ( = ?auto_48344 ?auto_48348 ) ) ( not ( = ?auto_48345 ?auto_48346 ) ) ( not ( = ?auto_48345 ?auto_48347 ) ) ( not ( = ?auto_48345 ?auto_48348 ) ) ( not ( = ?auto_48346 ?auto_48347 ) ) ( not ( = ?auto_48346 ?auto_48348 ) ) ( not ( = ?auto_48347 ?auto_48348 ) ) ( ON ?auto_48346 ?auto_48347 ) ( ON ?auto_48345 ?auto_48346 ) ( CLEAR ?auto_48343 ) ( ON ?auto_48344 ?auto_48345 ) ( CLEAR ?auto_48344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48341 ?auto_48342 ?auto_48343 ?auto_48344 )
      ( MAKE-7PILE ?auto_48341 ?auto_48342 ?auto_48343 ?auto_48344 ?auto_48345 ?auto_48346 ?auto_48347 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_48356 - BLOCK
      ?auto_48357 - BLOCK
      ?auto_48358 - BLOCK
      ?auto_48359 - BLOCK
      ?auto_48360 - BLOCK
      ?auto_48361 - BLOCK
      ?auto_48362 - BLOCK
    )
    :vars
    (
      ?auto_48363 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48362 ?auto_48363 ) ( ON-TABLE ?auto_48356 ) ( ON ?auto_48357 ?auto_48356 ) ( not ( = ?auto_48356 ?auto_48357 ) ) ( not ( = ?auto_48356 ?auto_48358 ) ) ( not ( = ?auto_48356 ?auto_48359 ) ) ( not ( = ?auto_48356 ?auto_48360 ) ) ( not ( = ?auto_48356 ?auto_48361 ) ) ( not ( = ?auto_48356 ?auto_48362 ) ) ( not ( = ?auto_48356 ?auto_48363 ) ) ( not ( = ?auto_48357 ?auto_48358 ) ) ( not ( = ?auto_48357 ?auto_48359 ) ) ( not ( = ?auto_48357 ?auto_48360 ) ) ( not ( = ?auto_48357 ?auto_48361 ) ) ( not ( = ?auto_48357 ?auto_48362 ) ) ( not ( = ?auto_48357 ?auto_48363 ) ) ( not ( = ?auto_48358 ?auto_48359 ) ) ( not ( = ?auto_48358 ?auto_48360 ) ) ( not ( = ?auto_48358 ?auto_48361 ) ) ( not ( = ?auto_48358 ?auto_48362 ) ) ( not ( = ?auto_48358 ?auto_48363 ) ) ( not ( = ?auto_48359 ?auto_48360 ) ) ( not ( = ?auto_48359 ?auto_48361 ) ) ( not ( = ?auto_48359 ?auto_48362 ) ) ( not ( = ?auto_48359 ?auto_48363 ) ) ( not ( = ?auto_48360 ?auto_48361 ) ) ( not ( = ?auto_48360 ?auto_48362 ) ) ( not ( = ?auto_48360 ?auto_48363 ) ) ( not ( = ?auto_48361 ?auto_48362 ) ) ( not ( = ?auto_48361 ?auto_48363 ) ) ( not ( = ?auto_48362 ?auto_48363 ) ) ( ON ?auto_48361 ?auto_48362 ) ( ON ?auto_48360 ?auto_48361 ) ( ON ?auto_48359 ?auto_48360 ) ( CLEAR ?auto_48357 ) ( ON ?auto_48358 ?auto_48359 ) ( CLEAR ?auto_48358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48356 ?auto_48357 ?auto_48358 )
      ( MAKE-7PILE ?auto_48356 ?auto_48357 ?auto_48358 ?auto_48359 ?auto_48360 ?auto_48361 ?auto_48362 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_48371 - BLOCK
      ?auto_48372 - BLOCK
      ?auto_48373 - BLOCK
      ?auto_48374 - BLOCK
      ?auto_48375 - BLOCK
      ?auto_48376 - BLOCK
      ?auto_48377 - BLOCK
    )
    :vars
    (
      ?auto_48378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48377 ?auto_48378 ) ( ON-TABLE ?auto_48371 ) ( ON ?auto_48372 ?auto_48371 ) ( not ( = ?auto_48371 ?auto_48372 ) ) ( not ( = ?auto_48371 ?auto_48373 ) ) ( not ( = ?auto_48371 ?auto_48374 ) ) ( not ( = ?auto_48371 ?auto_48375 ) ) ( not ( = ?auto_48371 ?auto_48376 ) ) ( not ( = ?auto_48371 ?auto_48377 ) ) ( not ( = ?auto_48371 ?auto_48378 ) ) ( not ( = ?auto_48372 ?auto_48373 ) ) ( not ( = ?auto_48372 ?auto_48374 ) ) ( not ( = ?auto_48372 ?auto_48375 ) ) ( not ( = ?auto_48372 ?auto_48376 ) ) ( not ( = ?auto_48372 ?auto_48377 ) ) ( not ( = ?auto_48372 ?auto_48378 ) ) ( not ( = ?auto_48373 ?auto_48374 ) ) ( not ( = ?auto_48373 ?auto_48375 ) ) ( not ( = ?auto_48373 ?auto_48376 ) ) ( not ( = ?auto_48373 ?auto_48377 ) ) ( not ( = ?auto_48373 ?auto_48378 ) ) ( not ( = ?auto_48374 ?auto_48375 ) ) ( not ( = ?auto_48374 ?auto_48376 ) ) ( not ( = ?auto_48374 ?auto_48377 ) ) ( not ( = ?auto_48374 ?auto_48378 ) ) ( not ( = ?auto_48375 ?auto_48376 ) ) ( not ( = ?auto_48375 ?auto_48377 ) ) ( not ( = ?auto_48375 ?auto_48378 ) ) ( not ( = ?auto_48376 ?auto_48377 ) ) ( not ( = ?auto_48376 ?auto_48378 ) ) ( not ( = ?auto_48377 ?auto_48378 ) ) ( ON ?auto_48376 ?auto_48377 ) ( ON ?auto_48375 ?auto_48376 ) ( ON ?auto_48374 ?auto_48375 ) ( CLEAR ?auto_48372 ) ( ON ?auto_48373 ?auto_48374 ) ( CLEAR ?auto_48373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48371 ?auto_48372 ?auto_48373 )
      ( MAKE-7PILE ?auto_48371 ?auto_48372 ?auto_48373 ?auto_48374 ?auto_48375 ?auto_48376 ?auto_48377 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_48386 - BLOCK
      ?auto_48387 - BLOCK
      ?auto_48388 - BLOCK
      ?auto_48389 - BLOCK
      ?auto_48390 - BLOCK
      ?auto_48391 - BLOCK
      ?auto_48392 - BLOCK
    )
    :vars
    (
      ?auto_48393 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48392 ?auto_48393 ) ( ON-TABLE ?auto_48386 ) ( not ( = ?auto_48386 ?auto_48387 ) ) ( not ( = ?auto_48386 ?auto_48388 ) ) ( not ( = ?auto_48386 ?auto_48389 ) ) ( not ( = ?auto_48386 ?auto_48390 ) ) ( not ( = ?auto_48386 ?auto_48391 ) ) ( not ( = ?auto_48386 ?auto_48392 ) ) ( not ( = ?auto_48386 ?auto_48393 ) ) ( not ( = ?auto_48387 ?auto_48388 ) ) ( not ( = ?auto_48387 ?auto_48389 ) ) ( not ( = ?auto_48387 ?auto_48390 ) ) ( not ( = ?auto_48387 ?auto_48391 ) ) ( not ( = ?auto_48387 ?auto_48392 ) ) ( not ( = ?auto_48387 ?auto_48393 ) ) ( not ( = ?auto_48388 ?auto_48389 ) ) ( not ( = ?auto_48388 ?auto_48390 ) ) ( not ( = ?auto_48388 ?auto_48391 ) ) ( not ( = ?auto_48388 ?auto_48392 ) ) ( not ( = ?auto_48388 ?auto_48393 ) ) ( not ( = ?auto_48389 ?auto_48390 ) ) ( not ( = ?auto_48389 ?auto_48391 ) ) ( not ( = ?auto_48389 ?auto_48392 ) ) ( not ( = ?auto_48389 ?auto_48393 ) ) ( not ( = ?auto_48390 ?auto_48391 ) ) ( not ( = ?auto_48390 ?auto_48392 ) ) ( not ( = ?auto_48390 ?auto_48393 ) ) ( not ( = ?auto_48391 ?auto_48392 ) ) ( not ( = ?auto_48391 ?auto_48393 ) ) ( not ( = ?auto_48392 ?auto_48393 ) ) ( ON ?auto_48391 ?auto_48392 ) ( ON ?auto_48390 ?auto_48391 ) ( ON ?auto_48389 ?auto_48390 ) ( ON ?auto_48388 ?auto_48389 ) ( CLEAR ?auto_48386 ) ( ON ?auto_48387 ?auto_48388 ) ( CLEAR ?auto_48387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48386 ?auto_48387 )
      ( MAKE-7PILE ?auto_48386 ?auto_48387 ?auto_48388 ?auto_48389 ?auto_48390 ?auto_48391 ?auto_48392 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_48401 - BLOCK
      ?auto_48402 - BLOCK
      ?auto_48403 - BLOCK
      ?auto_48404 - BLOCK
      ?auto_48405 - BLOCK
      ?auto_48406 - BLOCK
      ?auto_48407 - BLOCK
    )
    :vars
    (
      ?auto_48408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48407 ?auto_48408 ) ( ON-TABLE ?auto_48401 ) ( not ( = ?auto_48401 ?auto_48402 ) ) ( not ( = ?auto_48401 ?auto_48403 ) ) ( not ( = ?auto_48401 ?auto_48404 ) ) ( not ( = ?auto_48401 ?auto_48405 ) ) ( not ( = ?auto_48401 ?auto_48406 ) ) ( not ( = ?auto_48401 ?auto_48407 ) ) ( not ( = ?auto_48401 ?auto_48408 ) ) ( not ( = ?auto_48402 ?auto_48403 ) ) ( not ( = ?auto_48402 ?auto_48404 ) ) ( not ( = ?auto_48402 ?auto_48405 ) ) ( not ( = ?auto_48402 ?auto_48406 ) ) ( not ( = ?auto_48402 ?auto_48407 ) ) ( not ( = ?auto_48402 ?auto_48408 ) ) ( not ( = ?auto_48403 ?auto_48404 ) ) ( not ( = ?auto_48403 ?auto_48405 ) ) ( not ( = ?auto_48403 ?auto_48406 ) ) ( not ( = ?auto_48403 ?auto_48407 ) ) ( not ( = ?auto_48403 ?auto_48408 ) ) ( not ( = ?auto_48404 ?auto_48405 ) ) ( not ( = ?auto_48404 ?auto_48406 ) ) ( not ( = ?auto_48404 ?auto_48407 ) ) ( not ( = ?auto_48404 ?auto_48408 ) ) ( not ( = ?auto_48405 ?auto_48406 ) ) ( not ( = ?auto_48405 ?auto_48407 ) ) ( not ( = ?auto_48405 ?auto_48408 ) ) ( not ( = ?auto_48406 ?auto_48407 ) ) ( not ( = ?auto_48406 ?auto_48408 ) ) ( not ( = ?auto_48407 ?auto_48408 ) ) ( ON ?auto_48406 ?auto_48407 ) ( ON ?auto_48405 ?auto_48406 ) ( ON ?auto_48404 ?auto_48405 ) ( ON ?auto_48403 ?auto_48404 ) ( CLEAR ?auto_48401 ) ( ON ?auto_48402 ?auto_48403 ) ( CLEAR ?auto_48402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48401 ?auto_48402 )
      ( MAKE-7PILE ?auto_48401 ?auto_48402 ?auto_48403 ?auto_48404 ?auto_48405 ?auto_48406 ?auto_48407 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_48416 - BLOCK
      ?auto_48417 - BLOCK
      ?auto_48418 - BLOCK
      ?auto_48419 - BLOCK
      ?auto_48420 - BLOCK
      ?auto_48421 - BLOCK
      ?auto_48422 - BLOCK
    )
    :vars
    (
      ?auto_48423 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48422 ?auto_48423 ) ( not ( = ?auto_48416 ?auto_48417 ) ) ( not ( = ?auto_48416 ?auto_48418 ) ) ( not ( = ?auto_48416 ?auto_48419 ) ) ( not ( = ?auto_48416 ?auto_48420 ) ) ( not ( = ?auto_48416 ?auto_48421 ) ) ( not ( = ?auto_48416 ?auto_48422 ) ) ( not ( = ?auto_48416 ?auto_48423 ) ) ( not ( = ?auto_48417 ?auto_48418 ) ) ( not ( = ?auto_48417 ?auto_48419 ) ) ( not ( = ?auto_48417 ?auto_48420 ) ) ( not ( = ?auto_48417 ?auto_48421 ) ) ( not ( = ?auto_48417 ?auto_48422 ) ) ( not ( = ?auto_48417 ?auto_48423 ) ) ( not ( = ?auto_48418 ?auto_48419 ) ) ( not ( = ?auto_48418 ?auto_48420 ) ) ( not ( = ?auto_48418 ?auto_48421 ) ) ( not ( = ?auto_48418 ?auto_48422 ) ) ( not ( = ?auto_48418 ?auto_48423 ) ) ( not ( = ?auto_48419 ?auto_48420 ) ) ( not ( = ?auto_48419 ?auto_48421 ) ) ( not ( = ?auto_48419 ?auto_48422 ) ) ( not ( = ?auto_48419 ?auto_48423 ) ) ( not ( = ?auto_48420 ?auto_48421 ) ) ( not ( = ?auto_48420 ?auto_48422 ) ) ( not ( = ?auto_48420 ?auto_48423 ) ) ( not ( = ?auto_48421 ?auto_48422 ) ) ( not ( = ?auto_48421 ?auto_48423 ) ) ( not ( = ?auto_48422 ?auto_48423 ) ) ( ON ?auto_48421 ?auto_48422 ) ( ON ?auto_48420 ?auto_48421 ) ( ON ?auto_48419 ?auto_48420 ) ( ON ?auto_48418 ?auto_48419 ) ( ON ?auto_48417 ?auto_48418 ) ( ON ?auto_48416 ?auto_48417 ) ( CLEAR ?auto_48416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48416 )
      ( MAKE-7PILE ?auto_48416 ?auto_48417 ?auto_48418 ?auto_48419 ?auto_48420 ?auto_48421 ?auto_48422 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_48431 - BLOCK
      ?auto_48432 - BLOCK
      ?auto_48433 - BLOCK
      ?auto_48434 - BLOCK
      ?auto_48435 - BLOCK
      ?auto_48436 - BLOCK
      ?auto_48437 - BLOCK
    )
    :vars
    (
      ?auto_48438 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48437 ?auto_48438 ) ( not ( = ?auto_48431 ?auto_48432 ) ) ( not ( = ?auto_48431 ?auto_48433 ) ) ( not ( = ?auto_48431 ?auto_48434 ) ) ( not ( = ?auto_48431 ?auto_48435 ) ) ( not ( = ?auto_48431 ?auto_48436 ) ) ( not ( = ?auto_48431 ?auto_48437 ) ) ( not ( = ?auto_48431 ?auto_48438 ) ) ( not ( = ?auto_48432 ?auto_48433 ) ) ( not ( = ?auto_48432 ?auto_48434 ) ) ( not ( = ?auto_48432 ?auto_48435 ) ) ( not ( = ?auto_48432 ?auto_48436 ) ) ( not ( = ?auto_48432 ?auto_48437 ) ) ( not ( = ?auto_48432 ?auto_48438 ) ) ( not ( = ?auto_48433 ?auto_48434 ) ) ( not ( = ?auto_48433 ?auto_48435 ) ) ( not ( = ?auto_48433 ?auto_48436 ) ) ( not ( = ?auto_48433 ?auto_48437 ) ) ( not ( = ?auto_48433 ?auto_48438 ) ) ( not ( = ?auto_48434 ?auto_48435 ) ) ( not ( = ?auto_48434 ?auto_48436 ) ) ( not ( = ?auto_48434 ?auto_48437 ) ) ( not ( = ?auto_48434 ?auto_48438 ) ) ( not ( = ?auto_48435 ?auto_48436 ) ) ( not ( = ?auto_48435 ?auto_48437 ) ) ( not ( = ?auto_48435 ?auto_48438 ) ) ( not ( = ?auto_48436 ?auto_48437 ) ) ( not ( = ?auto_48436 ?auto_48438 ) ) ( not ( = ?auto_48437 ?auto_48438 ) ) ( ON ?auto_48436 ?auto_48437 ) ( ON ?auto_48435 ?auto_48436 ) ( ON ?auto_48434 ?auto_48435 ) ( ON ?auto_48433 ?auto_48434 ) ( ON ?auto_48432 ?auto_48433 ) ( ON ?auto_48431 ?auto_48432 ) ( CLEAR ?auto_48431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48431 )
      ( MAKE-7PILE ?auto_48431 ?auto_48432 ?auto_48433 ?auto_48434 ?auto_48435 ?auto_48436 ?auto_48437 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_48447 - BLOCK
      ?auto_48448 - BLOCK
      ?auto_48449 - BLOCK
      ?auto_48450 - BLOCK
      ?auto_48451 - BLOCK
      ?auto_48452 - BLOCK
      ?auto_48453 - BLOCK
      ?auto_48454 - BLOCK
    )
    :vars
    (
      ?auto_48455 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_48453 ) ( ON ?auto_48454 ?auto_48455 ) ( CLEAR ?auto_48454 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48447 ) ( ON ?auto_48448 ?auto_48447 ) ( ON ?auto_48449 ?auto_48448 ) ( ON ?auto_48450 ?auto_48449 ) ( ON ?auto_48451 ?auto_48450 ) ( ON ?auto_48452 ?auto_48451 ) ( ON ?auto_48453 ?auto_48452 ) ( not ( = ?auto_48447 ?auto_48448 ) ) ( not ( = ?auto_48447 ?auto_48449 ) ) ( not ( = ?auto_48447 ?auto_48450 ) ) ( not ( = ?auto_48447 ?auto_48451 ) ) ( not ( = ?auto_48447 ?auto_48452 ) ) ( not ( = ?auto_48447 ?auto_48453 ) ) ( not ( = ?auto_48447 ?auto_48454 ) ) ( not ( = ?auto_48447 ?auto_48455 ) ) ( not ( = ?auto_48448 ?auto_48449 ) ) ( not ( = ?auto_48448 ?auto_48450 ) ) ( not ( = ?auto_48448 ?auto_48451 ) ) ( not ( = ?auto_48448 ?auto_48452 ) ) ( not ( = ?auto_48448 ?auto_48453 ) ) ( not ( = ?auto_48448 ?auto_48454 ) ) ( not ( = ?auto_48448 ?auto_48455 ) ) ( not ( = ?auto_48449 ?auto_48450 ) ) ( not ( = ?auto_48449 ?auto_48451 ) ) ( not ( = ?auto_48449 ?auto_48452 ) ) ( not ( = ?auto_48449 ?auto_48453 ) ) ( not ( = ?auto_48449 ?auto_48454 ) ) ( not ( = ?auto_48449 ?auto_48455 ) ) ( not ( = ?auto_48450 ?auto_48451 ) ) ( not ( = ?auto_48450 ?auto_48452 ) ) ( not ( = ?auto_48450 ?auto_48453 ) ) ( not ( = ?auto_48450 ?auto_48454 ) ) ( not ( = ?auto_48450 ?auto_48455 ) ) ( not ( = ?auto_48451 ?auto_48452 ) ) ( not ( = ?auto_48451 ?auto_48453 ) ) ( not ( = ?auto_48451 ?auto_48454 ) ) ( not ( = ?auto_48451 ?auto_48455 ) ) ( not ( = ?auto_48452 ?auto_48453 ) ) ( not ( = ?auto_48452 ?auto_48454 ) ) ( not ( = ?auto_48452 ?auto_48455 ) ) ( not ( = ?auto_48453 ?auto_48454 ) ) ( not ( = ?auto_48453 ?auto_48455 ) ) ( not ( = ?auto_48454 ?auto_48455 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48454 ?auto_48455 )
      ( !STACK ?auto_48454 ?auto_48453 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_48464 - BLOCK
      ?auto_48465 - BLOCK
      ?auto_48466 - BLOCK
      ?auto_48467 - BLOCK
      ?auto_48468 - BLOCK
      ?auto_48469 - BLOCK
      ?auto_48470 - BLOCK
      ?auto_48471 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_48470 ) ( ON-TABLE ?auto_48471 ) ( CLEAR ?auto_48471 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48464 ) ( ON ?auto_48465 ?auto_48464 ) ( ON ?auto_48466 ?auto_48465 ) ( ON ?auto_48467 ?auto_48466 ) ( ON ?auto_48468 ?auto_48467 ) ( ON ?auto_48469 ?auto_48468 ) ( ON ?auto_48470 ?auto_48469 ) ( not ( = ?auto_48464 ?auto_48465 ) ) ( not ( = ?auto_48464 ?auto_48466 ) ) ( not ( = ?auto_48464 ?auto_48467 ) ) ( not ( = ?auto_48464 ?auto_48468 ) ) ( not ( = ?auto_48464 ?auto_48469 ) ) ( not ( = ?auto_48464 ?auto_48470 ) ) ( not ( = ?auto_48464 ?auto_48471 ) ) ( not ( = ?auto_48465 ?auto_48466 ) ) ( not ( = ?auto_48465 ?auto_48467 ) ) ( not ( = ?auto_48465 ?auto_48468 ) ) ( not ( = ?auto_48465 ?auto_48469 ) ) ( not ( = ?auto_48465 ?auto_48470 ) ) ( not ( = ?auto_48465 ?auto_48471 ) ) ( not ( = ?auto_48466 ?auto_48467 ) ) ( not ( = ?auto_48466 ?auto_48468 ) ) ( not ( = ?auto_48466 ?auto_48469 ) ) ( not ( = ?auto_48466 ?auto_48470 ) ) ( not ( = ?auto_48466 ?auto_48471 ) ) ( not ( = ?auto_48467 ?auto_48468 ) ) ( not ( = ?auto_48467 ?auto_48469 ) ) ( not ( = ?auto_48467 ?auto_48470 ) ) ( not ( = ?auto_48467 ?auto_48471 ) ) ( not ( = ?auto_48468 ?auto_48469 ) ) ( not ( = ?auto_48468 ?auto_48470 ) ) ( not ( = ?auto_48468 ?auto_48471 ) ) ( not ( = ?auto_48469 ?auto_48470 ) ) ( not ( = ?auto_48469 ?auto_48471 ) ) ( not ( = ?auto_48470 ?auto_48471 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_48471 )
      ( !STACK ?auto_48471 ?auto_48470 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_48480 - BLOCK
      ?auto_48481 - BLOCK
      ?auto_48482 - BLOCK
      ?auto_48483 - BLOCK
      ?auto_48484 - BLOCK
      ?auto_48485 - BLOCK
      ?auto_48486 - BLOCK
      ?auto_48487 - BLOCK
    )
    :vars
    (
      ?auto_48488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48487 ?auto_48488 ) ( ON-TABLE ?auto_48480 ) ( ON ?auto_48481 ?auto_48480 ) ( ON ?auto_48482 ?auto_48481 ) ( ON ?auto_48483 ?auto_48482 ) ( ON ?auto_48484 ?auto_48483 ) ( ON ?auto_48485 ?auto_48484 ) ( not ( = ?auto_48480 ?auto_48481 ) ) ( not ( = ?auto_48480 ?auto_48482 ) ) ( not ( = ?auto_48480 ?auto_48483 ) ) ( not ( = ?auto_48480 ?auto_48484 ) ) ( not ( = ?auto_48480 ?auto_48485 ) ) ( not ( = ?auto_48480 ?auto_48486 ) ) ( not ( = ?auto_48480 ?auto_48487 ) ) ( not ( = ?auto_48480 ?auto_48488 ) ) ( not ( = ?auto_48481 ?auto_48482 ) ) ( not ( = ?auto_48481 ?auto_48483 ) ) ( not ( = ?auto_48481 ?auto_48484 ) ) ( not ( = ?auto_48481 ?auto_48485 ) ) ( not ( = ?auto_48481 ?auto_48486 ) ) ( not ( = ?auto_48481 ?auto_48487 ) ) ( not ( = ?auto_48481 ?auto_48488 ) ) ( not ( = ?auto_48482 ?auto_48483 ) ) ( not ( = ?auto_48482 ?auto_48484 ) ) ( not ( = ?auto_48482 ?auto_48485 ) ) ( not ( = ?auto_48482 ?auto_48486 ) ) ( not ( = ?auto_48482 ?auto_48487 ) ) ( not ( = ?auto_48482 ?auto_48488 ) ) ( not ( = ?auto_48483 ?auto_48484 ) ) ( not ( = ?auto_48483 ?auto_48485 ) ) ( not ( = ?auto_48483 ?auto_48486 ) ) ( not ( = ?auto_48483 ?auto_48487 ) ) ( not ( = ?auto_48483 ?auto_48488 ) ) ( not ( = ?auto_48484 ?auto_48485 ) ) ( not ( = ?auto_48484 ?auto_48486 ) ) ( not ( = ?auto_48484 ?auto_48487 ) ) ( not ( = ?auto_48484 ?auto_48488 ) ) ( not ( = ?auto_48485 ?auto_48486 ) ) ( not ( = ?auto_48485 ?auto_48487 ) ) ( not ( = ?auto_48485 ?auto_48488 ) ) ( not ( = ?auto_48486 ?auto_48487 ) ) ( not ( = ?auto_48486 ?auto_48488 ) ) ( not ( = ?auto_48487 ?auto_48488 ) ) ( CLEAR ?auto_48485 ) ( ON ?auto_48486 ?auto_48487 ) ( CLEAR ?auto_48486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_48480 ?auto_48481 ?auto_48482 ?auto_48483 ?auto_48484 ?auto_48485 ?auto_48486 )
      ( MAKE-8PILE ?auto_48480 ?auto_48481 ?auto_48482 ?auto_48483 ?auto_48484 ?auto_48485 ?auto_48486 ?auto_48487 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_48497 - BLOCK
      ?auto_48498 - BLOCK
      ?auto_48499 - BLOCK
      ?auto_48500 - BLOCK
      ?auto_48501 - BLOCK
      ?auto_48502 - BLOCK
      ?auto_48503 - BLOCK
      ?auto_48504 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48504 ) ( ON-TABLE ?auto_48497 ) ( ON ?auto_48498 ?auto_48497 ) ( ON ?auto_48499 ?auto_48498 ) ( ON ?auto_48500 ?auto_48499 ) ( ON ?auto_48501 ?auto_48500 ) ( ON ?auto_48502 ?auto_48501 ) ( not ( = ?auto_48497 ?auto_48498 ) ) ( not ( = ?auto_48497 ?auto_48499 ) ) ( not ( = ?auto_48497 ?auto_48500 ) ) ( not ( = ?auto_48497 ?auto_48501 ) ) ( not ( = ?auto_48497 ?auto_48502 ) ) ( not ( = ?auto_48497 ?auto_48503 ) ) ( not ( = ?auto_48497 ?auto_48504 ) ) ( not ( = ?auto_48498 ?auto_48499 ) ) ( not ( = ?auto_48498 ?auto_48500 ) ) ( not ( = ?auto_48498 ?auto_48501 ) ) ( not ( = ?auto_48498 ?auto_48502 ) ) ( not ( = ?auto_48498 ?auto_48503 ) ) ( not ( = ?auto_48498 ?auto_48504 ) ) ( not ( = ?auto_48499 ?auto_48500 ) ) ( not ( = ?auto_48499 ?auto_48501 ) ) ( not ( = ?auto_48499 ?auto_48502 ) ) ( not ( = ?auto_48499 ?auto_48503 ) ) ( not ( = ?auto_48499 ?auto_48504 ) ) ( not ( = ?auto_48500 ?auto_48501 ) ) ( not ( = ?auto_48500 ?auto_48502 ) ) ( not ( = ?auto_48500 ?auto_48503 ) ) ( not ( = ?auto_48500 ?auto_48504 ) ) ( not ( = ?auto_48501 ?auto_48502 ) ) ( not ( = ?auto_48501 ?auto_48503 ) ) ( not ( = ?auto_48501 ?auto_48504 ) ) ( not ( = ?auto_48502 ?auto_48503 ) ) ( not ( = ?auto_48502 ?auto_48504 ) ) ( not ( = ?auto_48503 ?auto_48504 ) ) ( CLEAR ?auto_48502 ) ( ON ?auto_48503 ?auto_48504 ) ( CLEAR ?auto_48503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_48497 ?auto_48498 ?auto_48499 ?auto_48500 ?auto_48501 ?auto_48502 ?auto_48503 )
      ( MAKE-8PILE ?auto_48497 ?auto_48498 ?auto_48499 ?auto_48500 ?auto_48501 ?auto_48502 ?auto_48503 ?auto_48504 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_48513 - BLOCK
      ?auto_48514 - BLOCK
      ?auto_48515 - BLOCK
      ?auto_48516 - BLOCK
      ?auto_48517 - BLOCK
      ?auto_48518 - BLOCK
      ?auto_48519 - BLOCK
      ?auto_48520 - BLOCK
    )
    :vars
    (
      ?auto_48521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48520 ?auto_48521 ) ( ON-TABLE ?auto_48513 ) ( ON ?auto_48514 ?auto_48513 ) ( ON ?auto_48515 ?auto_48514 ) ( ON ?auto_48516 ?auto_48515 ) ( ON ?auto_48517 ?auto_48516 ) ( not ( = ?auto_48513 ?auto_48514 ) ) ( not ( = ?auto_48513 ?auto_48515 ) ) ( not ( = ?auto_48513 ?auto_48516 ) ) ( not ( = ?auto_48513 ?auto_48517 ) ) ( not ( = ?auto_48513 ?auto_48518 ) ) ( not ( = ?auto_48513 ?auto_48519 ) ) ( not ( = ?auto_48513 ?auto_48520 ) ) ( not ( = ?auto_48513 ?auto_48521 ) ) ( not ( = ?auto_48514 ?auto_48515 ) ) ( not ( = ?auto_48514 ?auto_48516 ) ) ( not ( = ?auto_48514 ?auto_48517 ) ) ( not ( = ?auto_48514 ?auto_48518 ) ) ( not ( = ?auto_48514 ?auto_48519 ) ) ( not ( = ?auto_48514 ?auto_48520 ) ) ( not ( = ?auto_48514 ?auto_48521 ) ) ( not ( = ?auto_48515 ?auto_48516 ) ) ( not ( = ?auto_48515 ?auto_48517 ) ) ( not ( = ?auto_48515 ?auto_48518 ) ) ( not ( = ?auto_48515 ?auto_48519 ) ) ( not ( = ?auto_48515 ?auto_48520 ) ) ( not ( = ?auto_48515 ?auto_48521 ) ) ( not ( = ?auto_48516 ?auto_48517 ) ) ( not ( = ?auto_48516 ?auto_48518 ) ) ( not ( = ?auto_48516 ?auto_48519 ) ) ( not ( = ?auto_48516 ?auto_48520 ) ) ( not ( = ?auto_48516 ?auto_48521 ) ) ( not ( = ?auto_48517 ?auto_48518 ) ) ( not ( = ?auto_48517 ?auto_48519 ) ) ( not ( = ?auto_48517 ?auto_48520 ) ) ( not ( = ?auto_48517 ?auto_48521 ) ) ( not ( = ?auto_48518 ?auto_48519 ) ) ( not ( = ?auto_48518 ?auto_48520 ) ) ( not ( = ?auto_48518 ?auto_48521 ) ) ( not ( = ?auto_48519 ?auto_48520 ) ) ( not ( = ?auto_48519 ?auto_48521 ) ) ( not ( = ?auto_48520 ?auto_48521 ) ) ( ON ?auto_48519 ?auto_48520 ) ( CLEAR ?auto_48517 ) ( ON ?auto_48518 ?auto_48519 ) ( CLEAR ?auto_48518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_48513 ?auto_48514 ?auto_48515 ?auto_48516 ?auto_48517 ?auto_48518 )
      ( MAKE-8PILE ?auto_48513 ?auto_48514 ?auto_48515 ?auto_48516 ?auto_48517 ?auto_48518 ?auto_48519 ?auto_48520 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_48530 - BLOCK
      ?auto_48531 - BLOCK
      ?auto_48532 - BLOCK
      ?auto_48533 - BLOCK
      ?auto_48534 - BLOCK
      ?auto_48535 - BLOCK
      ?auto_48536 - BLOCK
      ?auto_48537 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48537 ) ( ON-TABLE ?auto_48530 ) ( ON ?auto_48531 ?auto_48530 ) ( ON ?auto_48532 ?auto_48531 ) ( ON ?auto_48533 ?auto_48532 ) ( ON ?auto_48534 ?auto_48533 ) ( not ( = ?auto_48530 ?auto_48531 ) ) ( not ( = ?auto_48530 ?auto_48532 ) ) ( not ( = ?auto_48530 ?auto_48533 ) ) ( not ( = ?auto_48530 ?auto_48534 ) ) ( not ( = ?auto_48530 ?auto_48535 ) ) ( not ( = ?auto_48530 ?auto_48536 ) ) ( not ( = ?auto_48530 ?auto_48537 ) ) ( not ( = ?auto_48531 ?auto_48532 ) ) ( not ( = ?auto_48531 ?auto_48533 ) ) ( not ( = ?auto_48531 ?auto_48534 ) ) ( not ( = ?auto_48531 ?auto_48535 ) ) ( not ( = ?auto_48531 ?auto_48536 ) ) ( not ( = ?auto_48531 ?auto_48537 ) ) ( not ( = ?auto_48532 ?auto_48533 ) ) ( not ( = ?auto_48532 ?auto_48534 ) ) ( not ( = ?auto_48532 ?auto_48535 ) ) ( not ( = ?auto_48532 ?auto_48536 ) ) ( not ( = ?auto_48532 ?auto_48537 ) ) ( not ( = ?auto_48533 ?auto_48534 ) ) ( not ( = ?auto_48533 ?auto_48535 ) ) ( not ( = ?auto_48533 ?auto_48536 ) ) ( not ( = ?auto_48533 ?auto_48537 ) ) ( not ( = ?auto_48534 ?auto_48535 ) ) ( not ( = ?auto_48534 ?auto_48536 ) ) ( not ( = ?auto_48534 ?auto_48537 ) ) ( not ( = ?auto_48535 ?auto_48536 ) ) ( not ( = ?auto_48535 ?auto_48537 ) ) ( not ( = ?auto_48536 ?auto_48537 ) ) ( ON ?auto_48536 ?auto_48537 ) ( CLEAR ?auto_48534 ) ( ON ?auto_48535 ?auto_48536 ) ( CLEAR ?auto_48535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_48530 ?auto_48531 ?auto_48532 ?auto_48533 ?auto_48534 ?auto_48535 )
      ( MAKE-8PILE ?auto_48530 ?auto_48531 ?auto_48532 ?auto_48533 ?auto_48534 ?auto_48535 ?auto_48536 ?auto_48537 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_48546 - BLOCK
      ?auto_48547 - BLOCK
      ?auto_48548 - BLOCK
      ?auto_48549 - BLOCK
      ?auto_48550 - BLOCK
      ?auto_48551 - BLOCK
      ?auto_48552 - BLOCK
      ?auto_48553 - BLOCK
    )
    :vars
    (
      ?auto_48554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48553 ?auto_48554 ) ( ON-TABLE ?auto_48546 ) ( ON ?auto_48547 ?auto_48546 ) ( ON ?auto_48548 ?auto_48547 ) ( ON ?auto_48549 ?auto_48548 ) ( not ( = ?auto_48546 ?auto_48547 ) ) ( not ( = ?auto_48546 ?auto_48548 ) ) ( not ( = ?auto_48546 ?auto_48549 ) ) ( not ( = ?auto_48546 ?auto_48550 ) ) ( not ( = ?auto_48546 ?auto_48551 ) ) ( not ( = ?auto_48546 ?auto_48552 ) ) ( not ( = ?auto_48546 ?auto_48553 ) ) ( not ( = ?auto_48546 ?auto_48554 ) ) ( not ( = ?auto_48547 ?auto_48548 ) ) ( not ( = ?auto_48547 ?auto_48549 ) ) ( not ( = ?auto_48547 ?auto_48550 ) ) ( not ( = ?auto_48547 ?auto_48551 ) ) ( not ( = ?auto_48547 ?auto_48552 ) ) ( not ( = ?auto_48547 ?auto_48553 ) ) ( not ( = ?auto_48547 ?auto_48554 ) ) ( not ( = ?auto_48548 ?auto_48549 ) ) ( not ( = ?auto_48548 ?auto_48550 ) ) ( not ( = ?auto_48548 ?auto_48551 ) ) ( not ( = ?auto_48548 ?auto_48552 ) ) ( not ( = ?auto_48548 ?auto_48553 ) ) ( not ( = ?auto_48548 ?auto_48554 ) ) ( not ( = ?auto_48549 ?auto_48550 ) ) ( not ( = ?auto_48549 ?auto_48551 ) ) ( not ( = ?auto_48549 ?auto_48552 ) ) ( not ( = ?auto_48549 ?auto_48553 ) ) ( not ( = ?auto_48549 ?auto_48554 ) ) ( not ( = ?auto_48550 ?auto_48551 ) ) ( not ( = ?auto_48550 ?auto_48552 ) ) ( not ( = ?auto_48550 ?auto_48553 ) ) ( not ( = ?auto_48550 ?auto_48554 ) ) ( not ( = ?auto_48551 ?auto_48552 ) ) ( not ( = ?auto_48551 ?auto_48553 ) ) ( not ( = ?auto_48551 ?auto_48554 ) ) ( not ( = ?auto_48552 ?auto_48553 ) ) ( not ( = ?auto_48552 ?auto_48554 ) ) ( not ( = ?auto_48553 ?auto_48554 ) ) ( ON ?auto_48552 ?auto_48553 ) ( ON ?auto_48551 ?auto_48552 ) ( CLEAR ?auto_48549 ) ( ON ?auto_48550 ?auto_48551 ) ( CLEAR ?auto_48550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48546 ?auto_48547 ?auto_48548 ?auto_48549 ?auto_48550 )
      ( MAKE-8PILE ?auto_48546 ?auto_48547 ?auto_48548 ?auto_48549 ?auto_48550 ?auto_48551 ?auto_48552 ?auto_48553 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_48563 - BLOCK
      ?auto_48564 - BLOCK
      ?auto_48565 - BLOCK
      ?auto_48566 - BLOCK
      ?auto_48567 - BLOCK
      ?auto_48568 - BLOCK
      ?auto_48569 - BLOCK
      ?auto_48570 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48570 ) ( ON-TABLE ?auto_48563 ) ( ON ?auto_48564 ?auto_48563 ) ( ON ?auto_48565 ?auto_48564 ) ( ON ?auto_48566 ?auto_48565 ) ( not ( = ?auto_48563 ?auto_48564 ) ) ( not ( = ?auto_48563 ?auto_48565 ) ) ( not ( = ?auto_48563 ?auto_48566 ) ) ( not ( = ?auto_48563 ?auto_48567 ) ) ( not ( = ?auto_48563 ?auto_48568 ) ) ( not ( = ?auto_48563 ?auto_48569 ) ) ( not ( = ?auto_48563 ?auto_48570 ) ) ( not ( = ?auto_48564 ?auto_48565 ) ) ( not ( = ?auto_48564 ?auto_48566 ) ) ( not ( = ?auto_48564 ?auto_48567 ) ) ( not ( = ?auto_48564 ?auto_48568 ) ) ( not ( = ?auto_48564 ?auto_48569 ) ) ( not ( = ?auto_48564 ?auto_48570 ) ) ( not ( = ?auto_48565 ?auto_48566 ) ) ( not ( = ?auto_48565 ?auto_48567 ) ) ( not ( = ?auto_48565 ?auto_48568 ) ) ( not ( = ?auto_48565 ?auto_48569 ) ) ( not ( = ?auto_48565 ?auto_48570 ) ) ( not ( = ?auto_48566 ?auto_48567 ) ) ( not ( = ?auto_48566 ?auto_48568 ) ) ( not ( = ?auto_48566 ?auto_48569 ) ) ( not ( = ?auto_48566 ?auto_48570 ) ) ( not ( = ?auto_48567 ?auto_48568 ) ) ( not ( = ?auto_48567 ?auto_48569 ) ) ( not ( = ?auto_48567 ?auto_48570 ) ) ( not ( = ?auto_48568 ?auto_48569 ) ) ( not ( = ?auto_48568 ?auto_48570 ) ) ( not ( = ?auto_48569 ?auto_48570 ) ) ( ON ?auto_48569 ?auto_48570 ) ( ON ?auto_48568 ?auto_48569 ) ( CLEAR ?auto_48566 ) ( ON ?auto_48567 ?auto_48568 ) ( CLEAR ?auto_48567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48563 ?auto_48564 ?auto_48565 ?auto_48566 ?auto_48567 )
      ( MAKE-8PILE ?auto_48563 ?auto_48564 ?auto_48565 ?auto_48566 ?auto_48567 ?auto_48568 ?auto_48569 ?auto_48570 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_48579 - BLOCK
      ?auto_48580 - BLOCK
      ?auto_48581 - BLOCK
      ?auto_48582 - BLOCK
      ?auto_48583 - BLOCK
      ?auto_48584 - BLOCK
      ?auto_48585 - BLOCK
      ?auto_48586 - BLOCK
    )
    :vars
    (
      ?auto_48587 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48586 ?auto_48587 ) ( ON-TABLE ?auto_48579 ) ( ON ?auto_48580 ?auto_48579 ) ( ON ?auto_48581 ?auto_48580 ) ( not ( = ?auto_48579 ?auto_48580 ) ) ( not ( = ?auto_48579 ?auto_48581 ) ) ( not ( = ?auto_48579 ?auto_48582 ) ) ( not ( = ?auto_48579 ?auto_48583 ) ) ( not ( = ?auto_48579 ?auto_48584 ) ) ( not ( = ?auto_48579 ?auto_48585 ) ) ( not ( = ?auto_48579 ?auto_48586 ) ) ( not ( = ?auto_48579 ?auto_48587 ) ) ( not ( = ?auto_48580 ?auto_48581 ) ) ( not ( = ?auto_48580 ?auto_48582 ) ) ( not ( = ?auto_48580 ?auto_48583 ) ) ( not ( = ?auto_48580 ?auto_48584 ) ) ( not ( = ?auto_48580 ?auto_48585 ) ) ( not ( = ?auto_48580 ?auto_48586 ) ) ( not ( = ?auto_48580 ?auto_48587 ) ) ( not ( = ?auto_48581 ?auto_48582 ) ) ( not ( = ?auto_48581 ?auto_48583 ) ) ( not ( = ?auto_48581 ?auto_48584 ) ) ( not ( = ?auto_48581 ?auto_48585 ) ) ( not ( = ?auto_48581 ?auto_48586 ) ) ( not ( = ?auto_48581 ?auto_48587 ) ) ( not ( = ?auto_48582 ?auto_48583 ) ) ( not ( = ?auto_48582 ?auto_48584 ) ) ( not ( = ?auto_48582 ?auto_48585 ) ) ( not ( = ?auto_48582 ?auto_48586 ) ) ( not ( = ?auto_48582 ?auto_48587 ) ) ( not ( = ?auto_48583 ?auto_48584 ) ) ( not ( = ?auto_48583 ?auto_48585 ) ) ( not ( = ?auto_48583 ?auto_48586 ) ) ( not ( = ?auto_48583 ?auto_48587 ) ) ( not ( = ?auto_48584 ?auto_48585 ) ) ( not ( = ?auto_48584 ?auto_48586 ) ) ( not ( = ?auto_48584 ?auto_48587 ) ) ( not ( = ?auto_48585 ?auto_48586 ) ) ( not ( = ?auto_48585 ?auto_48587 ) ) ( not ( = ?auto_48586 ?auto_48587 ) ) ( ON ?auto_48585 ?auto_48586 ) ( ON ?auto_48584 ?auto_48585 ) ( ON ?auto_48583 ?auto_48584 ) ( CLEAR ?auto_48581 ) ( ON ?auto_48582 ?auto_48583 ) ( CLEAR ?auto_48582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48579 ?auto_48580 ?auto_48581 ?auto_48582 )
      ( MAKE-8PILE ?auto_48579 ?auto_48580 ?auto_48581 ?auto_48582 ?auto_48583 ?auto_48584 ?auto_48585 ?auto_48586 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_48596 - BLOCK
      ?auto_48597 - BLOCK
      ?auto_48598 - BLOCK
      ?auto_48599 - BLOCK
      ?auto_48600 - BLOCK
      ?auto_48601 - BLOCK
      ?auto_48602 - BLOCK
      ?auto_48603 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48603 ) ( ON-TABLE ?auto_48596 ) ( ON ?auto_48597 ?auto_48596 ) ( ON ?auto_48598 ?auto_48597 ) ( not ( = ?auto_48596 ?auto_48597 ) ) ( not ( = ?auto_48596 ?auto_48598 ) ) ( not ( = ?auto_48596 ?auto_48599 ) ) ( not ( = ?auto_48596 ?auto_48600 ) ) ( not ( = ?auto_48596 ?auto_48601 ) ) ( not ( = ?auto_48596 ?auto_48602 ) ) ( not ( = ?auto_48596 ?auto_48603 ) ) ( not ( = ?auto_48597 ?auto_48598 ) ) ( not ( = ?auto_48597 ?auto_48599 ) ) ( not ( = ?auto_48597 ?auto_48600 ) ) ( not ( = ?auto_48597 ?auto_48601 ) ) ( not ( = ?auto_48597 ?auto_48602 ) ) ( not ( = ?auto_48597 ?auto_48603 ) ) ( not ( = ?auto_48598 ?auto_48599 ) ) ( not ( = ?auto_48598 ?auto_48600 ) ) ( not ( = ?auto_48598 ?auto_48601 ) ) ( not ( = ?auto_48598 ?auto_48602 ) ) ( not ( = ?auto_48598 ?auto_48603 ) ) ( not ( = ?auto_48599 ?auto_48600 ) ) ( not ( = ?auto_48599 ?auto_48601 ) ) ( not ( = ?auto_48599 ?auto_48602 ) ) ( not ( = ?auto_48599 ?auto_48603 ) ) ( not ( = ?auto_48600 ?auto_48601 ) ) ( not ( = ?auto_48600 ?auto_48602 ) ) ( not ( = ?auto_48600 ?auto_48603 ) ) ( not ( = ?auto_48601 ?auto_48602 ) ) ( not ( = ?auto_48601 ?auto_48603 ) ) ( not ( = ?auto_48602 ?auto_48603 ) ) ( ON ?auto_48602 ?auto_48603 ) ( ON ?auto_48601 ?auto_48602 ) ( ON ?auto_48600 ?auto_48601 ) ( CLEAR ?auto_48598 ) ( ON ?auto_48599 ?auto_48600 ) ( CLEAR ?auto_48599 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48596 ?auto_48597 ?auto_48598 ?auto_48599 )
      ( MAKE-8PILE ?auto_48596 ?auto_48597 ?auto_48598 ?auto_48599 ?auto_48600 ?auto_48601 ?auto_48602 ?auto_48603 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_48612 - BLOCK
      ?auto_48613 - BLOCK
      ?auto_48614 - BLOCK
      ?auto_48615 - BLOCK
      ?auto_48616 - BLOCK
      ?auto_48617 - BLOCK
      ?auto_48618 - BLOCK
      ?auto_48619 - BLOCK
    )
    :vars
    (
      ?auto_48620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48619 ?auto_48620 ) ( ON-TABLE ?auto_48612 ) ( ON ?auto_48613 ?auto_48612 ) ( not ( = ?auto_48612 ?auto_48613 ) ) ( not ( = ?auto_48612 ?auto_48614 ) ) ( not ( = ?auto_48612 ?auto_48615 ) ) ( not ( = ?auto_48612 ?auto_48616 ) ) ( not ( = ?auto_48612 ?auto_48617 ) ) ( not ( = ?auto_48612 ?auto_48618 ) ) ( not ( = ?auto_48612 ?auto_48619 ) ) ( not ( = ?auto_48612 ?auto_48620 ) ) ( not ( = ?auto_48613 ?auto_48614 ) ) ( not ( = ?auto_48613 ?auto_48615 ) ) ( not ( = ?auto_48613 ?auto_48616 ) ) ( not ( = ?auto_48613 ?auto_48617 ) ) ( not ( = ?auto_48613 ?auto_48618 ) ) ( not ( = ?auto_48613 ?auto_48619 ) ) ( not ( = ?auto_48613 ?auto_48620 ) ) ( not ( = ?auto_48614 ?auto_48615 ) ) ( not ( = ?auto_48614 ?auto_48616 ) ) ( not ( = ?auto_48614 ?auto_48617 ) ) ( not ( = ?auto_48614 ?auto_48618 ) ) ( not ( = ?auto_48614 ?auto_48619 ) ) ( not ( = ?auto_48614 ?auto_48620 ) ) ( not ( = ?auto_48615 ?auto_48616 ) ) ( not ( = ?auto_48615 ?auto_48617 ) ) ( not ( = ?auto_48615 ?auto_48618 ) ) ( not ( = ?auto_48615 ?auto_48619 ) ) ( not ( = ?auto_48615 ?auto_48620 ) ) ( not ( = ?auto_48616 ?auto_48617 ) ) ( not ( = ?auto_48616 ?auto_48618 ) ) ( not ( = ?auto_48616 ?auto_48619 ) ) ( not ( = ?auto_48616 ?auto_48620 ) ) ( not ( = ?auto_48617 ?auto_48618 ) ) ( not ( = ?auto_48617 ?auto_48619 ) ) ( not ( = ?auto_48617 ?auto_48620 ) ) ( not ( = ?auto_48618 ?auto_48619 ) ) ( not ( = ?auto_48618 ?auto_48620 ) ) ( not ( = ?auto_48619 ?auto_48620 ) ) ( ON ?auto_48618 ?auto_48619 ) ( ON ?auto_48617 ?auto_48618 ) ( ON ?auto_48616 ?auto_48617 ) ( ON ?auto_48615 ?auto_48616 ) ( CLEAR ?auto_48613 ) ( ON ?auto_48614 ?auto_48615 ) ( CLEAR ?auto_48614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48612 ?auto_48613 ?auto_48614 )
      ( MAKE-8PILE ?auto_48612 ?auto_48613 ?auto_48614 ?auto_48615 ?auto_48616 ?auto_48617 ?auto_48618 ?auto_48619 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_48629 - BLOCK
      ?auto_48630 - BLOCK
      ?auto_48631 - BLOCK
      ?auto_48632 - BLOCK
      ?auto_48633 - BLOCK
      ?auto_48634 - BLOCK
      ?auto_48635 - BLOCK
      ?auto_48636 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48636 ) ( ON-TABLE ?auto_48629 ) ( ON ?auto_48630 ?auto_48629 ) ( not ( = ?auto_48629 ?auto_48630 ) ) ( not ( = ?auto_48629 ?auto_48631 ) ) ( not ( = ?auto_48629 ?auto_48632 ) ) ( not ( = ?auto_48629 ?auto_48633 ) ) ( not ( = ?auto_48629 ?auto_48634 ) ) ( not ( = ?auto_48629 ?auto_48635 ) ) ( not ( = ?auto_48629 ?auto_48636 ) ) ( not ( = ?auto_48630 ?auto_48631 ) ) ( not ( = ?auto_48630 ?auto_48632 ) ) ( not ( = ?auto_48630 ?auto_48633 ) ) ( not ( = ?auto_48630 ?auto_48634 ) ) ( not ( = ?auto_48630 ?auto_48635 ) ) ( not ( = ?auto_48630 ?auto_48636 ) ) ( not ( = ?auto_48631 ?auto_48632 ) ) ( not ( = ?auto_48631 ?auto_48633 ) ) ( not ( = ?auto_48631 ?auto_48634 ) ) ( not ( = ?auto_48631 ?auto_48635 ) ) ( not ( = ?auto_48631 ?auto_48636 ) ) ( not ( = ?auto_48632 ?auto_48633 ) ) ( not ( = ?auto_48632 ?auto_48634 ) ) ( not ( = ?auto_48632 ?auto_48635 ) ) ( not ( = ?auto_48632 ?auto_48636 ) ) ( not ( = ?auto_48633 ?auto_48634 ) ) ( not ( = ?auto_48633 ?auto_48635 ) ) ( not ( = ?auto_48633 ?auto_48636 ) ) ( not ( = ?auto_48634 ?auto_48635 ) ) ( not ( = ?auto_48634 ?auto_48636 ) ) ( not ( = ?auto_48635 ?auto_48636 ) ) ( ON ?auto_48635 ?auto_48636 ) ( ON ?auto_48634 ?auto_48635 ) ( ON ?auto_48633 ?auto_48634 ) ( ON ?auto_48632 ?auto_48633 ) ( CLEAR ?auto_48630 ) ( ON ?auto_48631 ?auto_48632 ) ( CLEAR ?auto_48631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48629 ?auto_48630 ?auto_48631 )
      ( MAKE-8PILE ?auto_48629 ?auto_48630 ?auto_48631 ?auto_48632 ?auto_48633 ?auto_48634 ?auto_48635 ?auto_48636 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_48645 - BLOCK
      ?auto_48646 - BLOCK
      ?auto_48647 - BLOCK
      ?auto_48648 - BLOCK
      ?auto_48649 - BLOCK
      ?auto_48650 - BLOCK
      ?auto_48651 - BLOCK
      ?auto_48652 - BLOCK
    )
    :vars
    (
      ?auto_48653 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48652 ?auto_48653 ) ( ON-TABLE ?auto_48645 ) ( not ( = ?auto_48645 ?auto_48646 ) ) ( not ( = ?auto_48645 ?auto_48647 ) ) ( not ( = ?auto_48645 ?auto_48648 ) ) ( not ( = ?auto_48645 ?auto_48649 ) ) ( not ( = ?auto_48645 ?auto_48650 ) ) ( not ( = ?auto_48645 ?auto_48651 ) ) ( not ( = ?auto_48645 ?auto_48652 ) ) ( not ( = ?auto_48645 ?auto_48653 ) ) ( not ( = ?auto_48646 ?auto_48647 ) ) ( not ( = ?auto_48646 ?auto_48648 ) ) ( not ( = ?auto_48646 ?auto_48649 ) ) ( not ( = ?auto_48646 ?auto_48650 ) ) ( not ( = ?auto_48646 ?auto_48651 ) ) ( not ( = ?auto_48646 ?auto_48652 ) ) ( not ( = ?auto_48646 ?auto_48653 ) ) ( not ( = ?auto_48647 ?auto_48648 ) ) ( not ( = ?auto_48647 ?auto_48649 ) ) ( not ( = ?auto_48647 ?auto_48650 ) ) ( not ( = ?auto_48647 ?auto_48651 ) ) ( not ( = ?auto_48647 ?auto_48652 ) ) ( not ( = ?auto_48647 ?auto_48653 ) ) ( not ( = ?auto_48648 ?auto_48649 ) ) ( not ( = ?auto_48648 ?auto_48650 ) ) ( not ( = ?auto_48648 ?auto_48651 ) ) ( not ( = ?auto_48648 ?auto_48652 ) ) ( not ( = ?auto_48648 ?auto_48653 ) ) ( not ( = ?auto_48649 ?auto_48650 ) ) ( not ( = ?auto_48649 ?auto_48651 ) ) ( not ( = ?auto_48649 ?auto_48652 ) ) ( not ( = ?auto_48649 ?auto_48653 ) ) ( not ( = ?auto_48650 ?auto_48651 ) ) ( not ( = ?auto_48650 ?auto_48652 ) ) ( not ( = ?auto_48650 ?auto_48653 ) ) ( not ( = ?auto_48651 ?auto_48652 ) ) ( not ( = ?auto_48651 ?auto_48653 ) ) ( not ( = ?auto_48652 ?auto_48653 ) ) ( ON ?auto_48651 ?auto_48652 ) ( ON ?auto_48650 ?auto_48651 ) ( ON ?auto_48649 ?auto_48650 ) ( ON ?auto_48648 ?auto_48649 ) ( ON ?auto_48647 ?auto_48648 ) ( CLEAR ?auto_48645 ) ( ON ?auto_48646 ?auto_48647 ) ( CLEAR ?auto_48646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48645 ?auto_48646 )
      ( MAKE-8PILE ?auto_48645 ?auto_48646 ?auto_48647 ?auto_48648 ?auto_48649 ?auto_48650 ?auto_48651 ?auto_48652 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_48662 - BLOCK
      ?auto_48663 - BLOCK
      ?auto_48664 - BLOCK
      ?auto_48665 - BLOCK
      ?auto_48666 - BLOCK
      ?auto_48667 - BLOCK
      ?auto_48668 - BLOCK
      ?auto_48669 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48669 ) ( ON-TABLE ?auto_48662 ) ( not ( = ?auto_48662 ?auto_48663 ) ) ( not ( = ?auto_48662 ?auto_48664 ) ) ( not ( = ?auto_48662 ?auto_48665 ) ) ( not ( = ?auto_48662 ?auto_48666 ) ) ( not ( = ?auto_48662 ?auto_48667 ) ) ( not ( = ?auto_48662 ?auto_48668 ) ) ( not ( = ?auto_48662 ?auto_48669 ) ) ( not ( = ?auto_48663 ?auto_48664 ) ) ( not ( = ?auto_48663 ?auto_48665 ) ) ( not ( = ?auto_48663 ?auto_48666 ) ) ( not ( = ?auto_48663 ?auto_48667 ) ) ( not ( = ?auto_48663 ?auto_48668 ) ) ( not ( = ?auto_48663 ?auto_48669 ) ) ( not ( = ?auto_48664 ?auto_48665 ) ) ( not ( = ?auto_48664 ?auto_48666 ) ) ( not ( = ?auto_48664 ?auto_48667 ) ) ( not ( = ?auto_48664 ?auto_48668 ) ) ( not ( = ?auto_48664 ?auto_48669 ) ) ( not ( = ?auto_48665 ?auto_48666 ) ) ( not ( = ?auto_48665 ?auto_48667 ) ) ( not ( = ?auto_48665 ?auto_48668 ) ) ( not ( = ?auto_48665 ?auto_48669 ) ) ( not ( = ?auto_48666 ?auto_48667 ) ) ( not ( = ?auto_48666 ?auto_48668 ) ) ( not ( = ?auto_48666 ?auto_48669 ) ) ( not ( = ?auto_48667 ?auto_48668 ) ) ( not ( = ?auto_48667 ?auto_48669 ) ) ( not ( = ?auto_48668 ?auto_48669 ) ) ( ON ?auto_48668 ?auto_48669 ) ( ON ?auto_48667 ?auto_48668 ) ( ON ?auto_48666 ?auto_48667 ) ( ON ?auto_48665 ?auto_48666 ) ( ON ?auto_48664 ?auto_48665 ) ( CLEAR ?auto_48662 ) ( ON ?auto_48663 ?auto_48664 ) ( CLEAR ?auto_48663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48662 ?auto_48663 )
      ( MAKE-8PILE ?auto_48662 ?auto_48663 ?auto_48664 ?auto_48665 ?auto_48666 ?auto_48667 ?auto_48668 ?auto_48669 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_48678 - BLOCK
      ?auto_48679 - BLOCK
      ?auto_48680 - BLOCK
      ?auto_48681 - BLOCK
      ?auto_48682 - BLOCK
      ?auto_48683 - BLOCK
      ?auto_48684 - BLOCK
      ?auto_48685 - BLOCK
    )
    :vars
    (
      ?auto_48686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48685 ?auto_48686 ) ( not ( = ?auto_48678 ?auto_48679 ) ) ( not ( = ?auto_48678 ?auto_48680 ) ) ( not ( = ?auto_48678 ?auto_48681 ) ) ( not ( = ?auto_48678 ?auto_48682 ) ) ( not ( = ?auto_48678 ?auto_48683 ) ) ( not ( = ?auto_48678 ?auto_48684 ) ) ( not ( = ?auto_48678 ?auto_48685 ) ) ( not ( = ?auto_48678 ?auto_48686 ) ) ( not ( = ?auto_48679 ?auto_48680 ) ) ( not ( = ?auto_48679 ?auto_48681 ) ) ( not ( = ?auto_48679 ?auto_48682 ) ) ( not ( = ?auto_48679 ?auto_48683 ) ) ( not ( = ?auto_48679 ?auto_48684 ) ) ( not ( = ?auto_48679 ?auto_48685 ) ) ( not ( = ?auto_48679 ?auto_48686 ) ) ( not ( = ?auto_48680 ?auto_48681 ) ) ( not ( = ?auto_48680 ?auto_48682 ) ) ( not ( = ?auto_48680 ?auto_48683 ) ) ( not ( = ?auto_48680 ?auto_48684 ) ) ( not ( = ?auto_48680 ?auto_48685 ) ) ( not ( = ?auto_48680 ?auto_48686 ) ) ( not ( = ?auto_48681 ?auto_48682 ) ) ( not ( = ?auto_48681 ?auto_48683 ) ) ( not ( = ?auto_48681 ?auto_48684 ) ) ( not ( = ?auto_48681 ?auto_48685 ) ) ( not ( = ?auto_48681 ?auto_48686 ) ) ( not ( = ?auto_48682 ?auto_48683 ) ) ( not ( = ?auto_48682 ?auto_48684 ) ) ( not ( = ?auto_48682 ?auto_48685 ) ) ( not ( = ?auto_48682 ?auto_48686 ) ) ( not ( = ?auto_48683 ?auto_48684 ) ) ( not ( = ?auto_48683 ?auto_48685 ) ) ( not ( = ?auto_48683 ?auto_48686 ) ) ( not ( = ?auto_48684 ?auto_48685 ) ) ( not ( = ?auto_48684 ?auto_48686 ) ) ( not ( = ?auto_48685 ?auto_48686 ) ) ( ON ?auto_48684 ?auto_48685 ) ( ON ?auto_48683 ?auto_48684 ) ( ON ?auto_48682 ?auto_48683 ) ( ON ?auto_48681 ?auto_48682 ) ( ON ?auto_48680 ?auto_48681 ) ( ON ?auto_48679 ?auto_48680 ) ( ON ?auto_48678 ?auto_48679 ) ( CLEAR ?auto_48678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48678 )
      ( MAKE-8PILE ?auto_48678 ?auto_48679 ?auto_48680 ?auto_48681 ?auto_48682 ?auto_48683 ?auto_48684 ?auto_48685 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_48695 - BLOCK
      ?auto_48696 - BLOCK
      ?auto_48697 - BLOCK
      ?auto_48698 - BLOCK
      ?auto_48699 - BLOCK
      ?auto_48700 - BLOCK
      ?auto_48701 - BLOCK
      ?auto_48702 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48702 ) ( not ( = ?auto_48695 ?auto_48696 ) ) ( not ( = ?auto_48695 ?auto_48697 ) ) ( not ( = ?auto_48695 ?auto_48698 ) ) ( not ( = ?auto_48695 ?auto_48699 ) ) ( not ( = ?auto_48695 ?auto_48700 ) ) ( not ( = ?auto_48695 ?auto_48701 ) ) ( not ( = ?auto_48695 ?auto_48702 ) ) ( not ( = ?auto_48696 ?auto_48697 ) ) ( not ( = ?auto_48696 ?auto_48698 ) ) ( not ( = ?auto_48696 ?auto_48699 ) ) ( not ( = ?auto_48696 ?auto_48700 ) ) ( not ( = ?auto_48696 ?auto_48701 ) ) ( not ( = ?auto_48696 ?auto_48702 ) ) ( not ( = ?auto_48697 ?auto_48698 ) ) ( not ( = ?auto_48697 ?auto_48699 ) ) ( not ( = ?auto_48697 ?auto_48700 ) ) ( not ( = ?auto_48697 ?auto_48701 ) ) ( not ( = ?auto_48697 ?auto_48702 ) ) ( not ( = ?auto_48698 ?auto_48699 ) ) ( not ( = ?auto_48698 ?auto_48700 ) ) ( not ( = ?auto_48698 ?auto_48701 ) ) ( not ( = ?auto_48698 ?auto_48702 ) ) ( not ( = ?auto_48699 ?auto_48700 ) ) ( not ( = ?auto_48699 ?auto_48701 ) ) ( not ( = ?auto_48699 ?auto_48702 ) ) ( not ( = ?auto_48700 ?auto_48701 ) ) ( not ( = ?auto_48700 ?auto_48702 ) ) ( not ( = ?auto_48701 ?auto_48702 ) ) ( ON ?auto_48701 ?auto_48702 ) ( ON ?auto_48700 ?auto_48701 ) ( ON ?auto_48699 ?auto_48700 ) ( ON ?auto_48698 ?auto_48699 ) ( ON ?auto_48697 ?auto_48698 ) ( ON ?auto_48696 ?auto_48697 ) ( ON ?auto_48695 ?auto_48696 ) ( CLEAR ?auto_48695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48695 )
      ( MAKE-8PILE ?auto_48695 ?auto_48696 ?auto_48697 ?auto_48698 ?auto_48699 ?auto_48700 ?auto_48701 ?auto_48702 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_48711 - BLOCK
      ?auto_48712 - BLOCK
      ?auto_48713 - BLOCK
      ?auto_48714 - BLOCK
      ?auto_48715 - BLOCK
      ?auto_48716 - BLOCK
      ?auto_48717 - BLOCK
      ?auto_48718 - BLOCK
    )
    :vars
    (
      ?auto_48719 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48711 ?auto_48712 ) ) ( not ( = ?auto_48711 ?auto_48713 ) ) ( not ( = ?auto_48711 ?auto_48714 ) ) ( not ( = ?auto_48711 ?auto_48715 ) ) ( not ( = ?auto_48711 ?auto_48716 ) ) ( not ( = ?auto_48711 ?auto_48717 ) ) ( not ( = ?auto_48711 ?auto_48718 ) ) ( not ( = ?auto_48712 ?auto_48713 ) ) ( not ( = ?auto_48712 ?auto_48714 ) ) ( not ( = ?auto_48712 ?auto_48715 ) ) ( not ( = ?auto_48712 ?auto_48716 ) ) ( not ( = ?auto_48712 ?auto_48717 ) ) ( not ( = ?auto_48712 ?auto_48718 ) ) ( not ( = ?auto_48713 ?auto_48714 ) ) ( not ( = ?auto_48713 ?auto_48715 ) ) ( not ( = ?auto_48713 ?auto_48716 ) ) ( not ( = ?auto_48713 ?auto_48717 ) ) ( not ( = ?auto_48713 ?auto_48718 ) ) ( not ( = ?auto_48714 ?auto_48715 ) ) ( not ( = ?auto_48714 ?auto_48716 ) ) ( not ( = ?auto_48714 ?auto_48717 ) ) ( not ( = ?auto_48714 ?auto_48718 ) ) ( not ( = ?auto_48715 ?auto_48716 ) ) ( not ( = ?auto_48715 ?auto_48717 ) ) ( not ( = ?auto_48715 ?auto_48718 ) ) ( not ( = ?auto_48716 ?auto_48717 ) ) ( not ( = ?auto_48716 ?auto_48718 ) ) ( not ( = ?auto_48717 ?auto_48718 ) ) ( ON ?auto_48711 ?auto_48719 ) ( not ( = ?auto_48718 ?auto_48719 ) ) ( not ( = ?auto_48717 ?auto_48719 ) ) ( not ( = ?auto_48716 ?auto_48719 ) ) ( not ( = ?auto_48715 ?auto_48719 ) ) ( not ( = ?auto_48714 ?auto_48719 ) ) ( not ( = ?auto_48713 ?auto_48719 ) ) ( not ( = ?auto_48712 ?auto_48719 ) ) ( not ( = ?auto_48711 ?auto_48719 ) ) ( ON ?auto_48712 ?auto_48711 ) ( ON ?auto_48713 ?auto_48712 ) ( ON ?auto_48714 ?auto_48713 ) ( ON ?auto_48715 ?auto_48714 ) ( ON ?auto_48716 ?auto_48715 ) ( ON ?auto_48717 ?auto_48716 ) ( ON ?auto_48718 ?auto_48717 ) ( CLEAR ?auto_48718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_48718 ?auto_48717 ?auto_48716 ?auto_48715 ?auto_48714 ?auto_48713 ?auto_48712 ?auto_48711 )
      ( MAKE-8PILE ?auto_48711 ?auto_48712 ?auto_48713 ?auto_48714 ?auto_48715 ?auto_48716 ?auto_48717 ?auto_48718 ) )
  )

)

