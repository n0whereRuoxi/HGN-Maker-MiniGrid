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
      ?auto_56864 - BLOCK
      ?auto_56865 - BLOCK
      ?auto_56866 - BLOCK
      ?auto_56867 - BLOCK
      ?auto_56868 - BLOCK
      ?auto_56869 - BLOCK
    )
    :vars
    (
      ?auto_56870 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56870 ?auto_56869 ) ( CLEAR ?auto_56870 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_56864 ) ( ON ?auto_56865 ?auto_56864 ) ( ON ?auto_56866 ?auto_56865 ) ( ON ?auto_56867 ?auto_56866 ) ( ON ?auto_56868 ?auto_56867 ) ( ON ?auto_56869 ?auto_56868 ) ( not ( = ?auto_56864 ?auto_56865 ) ) ( not ( = ?auto_56864 ?auto_56866 ) ) ( not ( = ?auto_56864 ?auto_56867 ) ) ( not ( = ?auto_56864 ?auto_56868 ) ) ( not ( = ?auto_56864 ?auto_56869 ) ) ( not ( = ?auto_56864 ?auto_56870 ) ) ( not ( = ?auto_56865 ?auto_56866 ) ) ( not ( = ?auto_56865 ?auto_56867 ) ) ( not ( = ?auto_56865 ?auto_56868 ) ) ( not ( = ?auto_56865 ?auto_56869 ) ) ( not ( = ?auto_56865 ?auto_56870 ) ) ( not ( = ?auto_56866 ?auto_56867 ) ) ( not ( = ?auto_56866 ?auto_56868 ) ) ( not ( = ?auto_56866 ?auto_56869 ) ) ( not ( = ?auto_56866 ?auto_56870 ) ) ( not ( = ?auto_56867 ?auto_56868 ) ) ( not ( = ?auto_56867 ?auto_56869 ) ) ( not ( = ?auto_56867 ?auto_56870 ) ) ( not ( = ?auto_56868 ?auto_56869 ) ) ( not ( = ?auto_56868 ?auto_56870 ) ) ( not ( = ?auto_56869 ?auto_56870 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_56870 ?auto_56869 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_56872 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_56872 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_56872 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_56873 - BLOCK
    )
    :vars
    (
      ?auto_56874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56873 ?auto_56874 ) ( CLEAR ?auto_56873 ) ( HAND-EMPTY ) ( not ( = ?auto_56873 ?auto_56874 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_56873 ?auto_56874 )
      ( MAKE-1PILE ?auto_56873 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56880 - BLOCK
      ?auto_56881 - BLOCK
      ?auto_56882 - BLOCK
      ?auto_56883 - BLOCK
      ?auto_56884 - BLOCK
    )
    :vars
    (
      ?auto_56885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56885 ?auto_56884 ) ( CLEAR ?auto_56885 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_56880 ) ( ON ?auto_56881 ?auto_56880 ) ( ON ?auto_56882 ?auto_56881 ) ( ON ?auto_56883 ?auto_56882 ) ( ON ?auto_56884 ?auto_56883 ) ( not ( = ?auto_56880 ?auto_56881 ) ) ( not ( = ?auto_56880 ?auto_56882 ) ) ( not ( = ?auto_56880 ?auto_56883 ) ) ( not ( = ?auto_56880 ?auto_56884 ) ) ( not ( = ?auto_56880 ?auto_56885 ) ) ( not ( = ?auto_56881 ?auto_56882 ) ) ( not ( = ?auto_56881 ?auto_56883 ) ) ( not ( = ?auto_56881 ?auto_56884 ) ) ( not ( = ?auto_56881 ?auto_56885 ) ) ( not ( = ?auto_56882 ?auto_56883 ) ) ( not ( = ?auto_56882 ?auto_56884 ) ) ( not ( = ?auto_56882 ?auto_56885 ) ) ( not ( = ?auto_56883 ?auto_56884 ) ) ( not ( = ?auto_56883 ?auto_56885 ) ) ( not ( = ?auto_56884 ?auto_56885 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_56885 ?auto_56884 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56886 - BLOCK
      ?auto_56887 - BLOCK
      ?auto_56888 - BLOCK
      ?auto_56889 - BLOCK
      ?auto_56890 - BLOCK
    )
    :vars
    (
      ?auto_56891 - BLOCK
      ?auto_56892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56891 ?auto_56890 ) ( CLEAR ?auto_56891 ) ( ON-TABLE ?auto_56886 ) ( ON ?auto_56887 ?auto_56886 ) ( ON ?auto_56888 ?auto_56887 ) ( ON ?auto_56889 ?auto_56888 ) ( ON ?auto_56890 ?auto_56889 ) ( not ( = ?auto_56886 ?auto_56887 ) ) ( not ( = ?auto_56886 ?auto_56888 ) ) ( not ( = ?auto_56886 ?auto_56889 ) ) ( not ( = ?auto_56886 ?auto_56890 ) ) ( not ( = ?auto_56886 ?auto_56891 ) ) ( not ( = ?auto_56887 ?auto_56888 ) ) ( not ( = ?auto_56887 ?auto_56889 ) ) ( not ( = ?auto_56887 ?auto_56890 ) ) ( not ( = ?auto_56887 ?auto_56891 ) ) ( not ( = ?auto_56888 ?auto_56889 ) ) ( not ( = ?auto_56888 ?auto_56890 ) ) ( not ( = ?auto_56888 ?auto_56891 ) ) ( not ( = ?auto_56889 ?auto_56890 ) ) ( not ( = ?auto_56889 ?auto_56891 ) ) ( not ( = ?auto_56890 ?auto_56891 ) ) ( HOLDING ?auto_56892 ) ( not ( = ?auto_56886 ?auto_56892 ) ) ( not ( = ?auto_56887 ?auto_56892 ) ) ( not ( = ?auto_56888 ?auto_56892 ) ) ( not ( = ?auto_56889 ?auto_56892 ) ) ( not ( = ?auto_56890 ?auto_56892 ) ) ( not ( = ?auto_56891 ?auto_56892 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_56892 )
      ( MAKE-5PILE ?auto_56886 ?auto_56887 ?auto_56888 ?auto_56889 ?auto_56890 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56893 - BLOCK
      ?auto_56894 - BLOCK
      ?auto_56895 - BLOCK
      ?auto_56896 - BLOCK
      ?auto_56897 - BLOCK
    )
    :vars
    (
      ?auto_56899 - BLOCK
      ?auto_56898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56899 ?auto_56897 ) ( ON-TABLE ?auto_56893 ) ( ON ?auto_56894 ?auto_56893 ) ( ON ?auto_56895 ?auto_56894 ) ( ON ?auto_56896 ?auto_56895 ) ( ON ?auto_56897 ?auto_56896 ) ( not ( = ?auto_56893 ?auto_56894 ) ) ( not ( = ?auto_56893 ?auto_56895 ) ) ( not ( = ?auto_56893 ?auto_56896 ) ) ( not ( = ?auto_56893 ?auto_56897 ) ) ( not ( = ?auto_56893 ?auto_56899 ) ) ( not ( = ?auto_56894 ?auto_56895 ) ) ( not ( = ?auto_56894 ?auto_56896 ) ) ( not ( = ?auto_56894 ?auto_56897 ) ) ( not ( = ?auto_56894 ?auto_56899 ) ) ( not ( = ?auto_56895 ?auto_56896 ) ) ( not ( = ?auto_56895 ?auto_56897 ) ) ( not ( = ?auto_56895 ?auto_56899 ) ) ( not ( = ?auto_56896 ?auto_56897 ) ) ( not ( = ?auto_56896 ?auto_56899 ) ) ( not ( = ?auto_56897 ?auto_56899 ) ) ( not ( = ?auto_56893 ?auto_56898 ) ) ( not ( = ?auto_56894 ?auto_56898 ) ) ( not ( = ?auto_56895 ?auto_56898 ) ) ( not ( = ?auto_56896 ?auto_56898 ) ) ( not ( = ?auto_56897 ?auto_56898 ) ) ( not ( = ?auto_56899 ?auto_56898 ) ) ( ON ?auto_56898 ?auto_56899 ) ( CLEAR ?auto_56898 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_56893 ?auto_56894 ?auto_56895 ?auto_56896 ?auto_56897 ?auto_56899 )
      ( MAKE-5PILE ?auto_56893 ?auto_56894 ?auto_56895 ?auto_56896 ?auto_56897 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56902 - BLOCK
      ?auto_56903 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_56903 ) ( CLEAR ?auto_56902 ) ( ON-TABLE ?auto_56902 ) ( not ( = ?auto_56902 ?auto_56903 ) ) )
    :subtasks
    ( ( !STACK ?auto_56903 ?auto_56902 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56904 - BLOCK
      ?auto_56905 - BLOCK
    )
    :vars
    (
      ?auto_56906 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_56904 ) ( ON-TABLE ?auto_56904 ) ( not ( = ?auto_56904 ?auto_56905 ) ) ( ON ?auto_56905 ?auto_56906 ) ( CLEAR ?auto_56905 ) ( HAND-EMPTY ) ( not ( = ?auto_56904 ?auto_56906 ) ) ( not ( = ?auto_56905 ?auto_56906 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_56905 ?auto_56906 )
      ( MAKE-2PILE ?auto_56904 ?auto_56905 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56907 - BLOCK
      ?auto_56908 - BLOCK
    )
    :vars
    (
      ?auto_56909 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56907 ?auto_56908 ) ) ( ON ?auto_56908 ?auto_56909 ) ( CLEAR ?auto_56908 ) ( not ( = ?auto_56907 ?auto_56909 ) ) ( not ( = ?auto_56908 ?auto_56909 ) ) ( HOLDING ?auto_56907 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_56907 )
      ( MAKE-2PILE ?auto_56907 ?auto_56908 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56910 - BLOCK
      ?auto_56911 - BLOCK
    )
    :vars
    (
      ?auto_56912 - BLOCK
      ?auto_56916 - BLOCK
      ?auto_56914 - BLOCK
      ?auto_56915 - BLOCK
      ?auto_56913 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56910 ?auto_56911 ) ) ( ON ?auto_56911 ?auto_56912 ) ( not ( = ?auto_56910 ?auto_56912 ) ) ( not ( = ?auto_56911 ?auto_56912 ) ) ( ON ?auto_56910 ?auto_56911 ) ( CLEAR ?auto_56910 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_56916 ) ( ON ?auto_56914 ?auto_56916 ) ( ON ?auto_56915 ?auto_56914 ) ( ON ?auto_56913 ?auto_56915 ) ( ON ?auto_56912 ?auto_56913 ) ( not ( = ?auto_56916 ?auto_56914 ) ) ( not ( = ?auto_56916 ?auto_56915 ) ) ( not ( = ?auto_56916 ?auto_56913 ) ) ( not ( = ?auto_56916 ?auto_56912 ) ) ( not ( = ?auto_56916 ?auto_56911 ) ) ( not ( = ?auto_56916 ?auto_56910 ) ) ( not ( = ?auto_56914 ?auto_56915 ) ) ( not ( = ?auto_56914 ?auto_56913 ) ) ( not ( = ?auto_56914 ?auto_56912 ) ) ( not ( = ?auto_56914 ?auto_56911 ) ) ( not ( = ?auto_56914 ?auto_56910 ) ) ( not ( = ?auto_56915 ?auto_56913 ) ) ( not ( = ?auto_56915 ?auto_56912 ) ) ( not ( = ?auto_56915 ?auto_56911 ) ) ( not ( = ?auto_56915 ?auto_56910 ) ) ( not ( = ?auto_56913 ?auto_56912 ) ) ( not ( = ?auto_56913 ?auto_56911 ) ) ( not ( = ?auto_56913 ?auto_56910 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_56916 ?auto_56914 ?auto_56915 ?auto_56913 ?auto_56912 ?auto_56911 )
      ( MAKE-2PILE ?auto_56910 ?auto_56911 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_56921 - BLOCK
      ?auto_56922 - BLOCK
      ?auto_56923 - BLOCK
      ?auto_56924 - BLOCK
    )
    :vars
    (
      ?auto_56925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56925 ?auto_56924 ) ( CLEAR ?auto_56925 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_56921 ) ( ON ?auto_56922 ?auto_56921 ) ( ON ?auto_56923 ?auto_56922 ) ( ON ?auto_56924 ?auto_56923 ) ( not ( = ?auto_56921 ?auto_56922 ) ) ( not ( = ?auto_56921 ?auto_56923 ) ) ( not ( = ?auto_56921 ?auto_56924 ) ) ( not ( = ?auto_56921 ?auto_56925 ) ) ( not ( = ?auto_56922 ?auto_56923 ) ) ( not ( = ?auto_56922 ?auto_56924 ) ) ( not ( = ?auto_56922 ?auto_56925 ) ) ( not ( = ?auto_56923 ?auto_56924 ) ) ( not ( = ?auto_56923 ?auto_56925 ) ) ( not ( = ?auto_56924 ?auto_56925 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_56925 ?auto_56924 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_56926 - BLOCK
      ?auto_56927 - BLOCK
      ?auto_56928 - BLOCK
      ?auto_56929 - BLOCK
    )
    :vars
    (
      ?auto_56930 - BLOCK
      ?auto_56931 - BLOCK
      ?auto_56932 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56930 ?auto_56929 ) ( CLEAR ?auto_56930 ) ( ON-TABLE ?auto_56926 ) ( ON ?auto_56927 ?auto_56926 ) ( ON ?auto_56928 ?auto_56927 ) ( ON ?auto_56929 ?auto_56928 ) ( not ( = ?auto_56926 ?auto_56927 ) ) ( not ( = ?auto_56926 ?auto_56928 ) ) ( not ( = ?auto_56926 ?auto_56929 ) ) ( not ( = ?auto_56926 ?auto_56930 ) ) ( not ( = ?auto_56927 ?auto_56928 ) ) ( not ( = ?auto_56927 ?auto_56929 ) ) ( not ( = ?auto_56927 ?auto_56930 ) ) ( not ( = ?auto_56928 ?auto_56929 ) ) ( not ( = ?auto_56928 ?auto_56930 ) ) ( not ( = ?auto_56929 ?auto_56930 ) ) ( HOLDING ?auto_56931 ) ( CLEAR ?auto_56932 ) ( not ( = ?auto_56926 ?auto_56931 ) ) ( not ( = ?auto_56926 ?auto_56932 ) ) ( not ( = ?auto_56927 ?auto_56931 ) ) ( not ( = ?auto_56927 ?auto_56932 ) ) ( not ( = ?auto_56928 ?auto_56931 ) ) ( not ( = ?auto_56928 ?auto_56932 ) ) ( not ( = ?auto_56929 ?auto_56931 ) ) ( not ( = ?auto_56929 ?auto_56932 ) ) ( not ( = ?auto_56930 ?auto_56931 ) ) ( not ( = ?auto_56930 ?auto_56932 ) ) ( not ( = ?auto_56931 ?auto_56932 ) ) )
    :subtasks
    ( ( !STACK ?auto_56931 ?auto_56932 )
      ( MAKE-4PILE ?auto_56926 ?auto_56927 ?auto_56928 ?auto_56929 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57532 - BLOCK
      ?auto_57533 - BLOCK
      ?auto_57534 - BLOCK
      ?auto_57535 - BLOCK
    )
    :vars
    (
      ?auto_57536 - BLOCK
      ?auto_57537 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57536 ?auto_57535 ) ( ON-TABLE ?auto_57532 ) ( ON ?auto_57533 ?auto_57532 ) ( ON ?auto_57534 ?auto_57533 ) ( ON ?auto_57535 ?auto_57534 ) ( not ( = ?auto_57532 ?auto_57533 ) ) ( not ( = ?auto_57532 ?auto_57534 ) ) ( not ( = ?auto_57532 ?auto_57535 ) ) ( not ( = ?auto_57532 ?auto_57536 ) ) ( not ( = ?auto_57533 ?auto_57534 ) ) ( not ( = ?auto_57533 ?auto_57535 ) ) ( not ( = ?auto_57533 ?auto_57536 ) ) ( not ( = ?auto_57534 ?auto_57535 ) ) ( not ( = ?auto_57534 ?auto_57536 ) ) ( not ( = ?auto_57535 ?auto_57536 ) ) ( not ( = ?auto_57532 ?auto_57537 ) ) ( not ( = ?auto_57533 ?auto_57537 ) ) ( not ( = ?auto_57534 ?auto_57537 ) ) ( not ( = ?auto_57535 ?auto_57537 ) ) ( not ( = ?auto_57536 ?auto_57537 ) ) ( ON ?auto_57537 ?auto_57536 ) ( CLEAR ?auto_57537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_57532 ?auto_57533 ?auto_57534 ?auto_57535 ?auto_57536 )
      ( MAKE-4PILE ?auto_57532 ?auto_57533 ?auto_57534 ?auto_57535 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_56940 - BLOCK
      ?auto_56941 - BLOCK
      ?auto_56942 - BLOCK
      ?auto_56943 - BLOCK
    )
    :vars
    (
      ?auto_56946 - BLOCK
      ?auto_56944 - BLOCK
      ?auto_56945 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56946 ?auto_56943 ) ( ON-TABLE ?auto_56940 ) ( ON ?auto_56941 ?auto_56940 ) ( ON ?auto_56942 ?auto_56941 ) ( ON ?auto_56943 ?auto_56942 ) ( not ( = ?auto_56940 ?auto_56941 ) ) ( not ( = ?auto_56940 ?auto_56942 ) ) ( not ( = ?auto_56940 ?auto_56943 ) ) ( not ( = ?auto_56940 ?auto_56946 ) ) ( not ( = ?auto_56941 ?auto_56942 ) ) ( not ( = ?auto_56941 ?auto_56943 ) ) ( not ( = ?auto_56941 ?auto_56946 ) ) ( not ( = ?auto_56942 ?auto_56943 ) ) ( not ( = ?auto_56942 ?auto_56946 ) ) ( not ( = ?auto_56943 ?auto_56946 ) ) ( not ( = ?auto_56940 ?auto_56944 ) ) ( not ( = ?auto_56940 ?auto_56945 ) ) ( not ( = ?auto_56941 ?auto_56944 ) ) ( not ( = ?auto_56941 ?auto_56945 ) ) ( not ( = ?auto_56942 ?auto_56944 ) ) ( not ( = ?auto_56942 ?auto_56945 ) ) ( not ( = ?auto_56943 ?auto_56944 ) ) ( not ( = ?auto_56943 ?auto_56945 ) ) ( not ( = ?auto_56946 ?auto_56944 ) ) ( not ( = ?auto_56946 ?auto_56945 ) ) ( not ( = ?auto_56944 ?auto_56945 ) ) ( ON ?auto_56944 ?auto_56946 ) ( CLEAR ?auto_56944 ) ( HOLDING ?auto_56945 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_56945 )
      ( MAKE-4PILE ?auto_56940 ?auto_56941 ?auto_56942 ?auto_56943 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_56947 - BLOCK
      ?auto_56948 - BLOCK
      ?auto_56949 - BLOCK
      ?auto_56950 - BLOCK
    )
    :vars
    (
      ?auto_56952 - BLOCK
      ?auto_56953 - BLOCK
      ?auto_56951 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56952 ?auto_56950 ) ( ON-TABLE ?auto_56947 ) ( ON ?auto_56948 ?auto_56947 ) ( ON ?auto_56949 ?auto_56948 ) ( ON ?auto_56950 ?auto_56949 ) ( not ( = ?auto_56947 ?auto_56948 ) ) ( not ( = ?auto_56947 ?auto_56949 ) ) ( not ( = ?auto_56947 ?auto_56950 ) ) ( not ( = ?auto_56947 ?auto_56952 ) ) ( not ( = ?auto_56948 ?auto_56949 ) ) ( not ( = ?auto_56948 ?auto_56950 ) ) ( not ( = ?auto_56948 ?auto_56952 ) ) ( not ( = ?auto_56949 ?auto_56950 ) ) ( not ( = ?auto_56949 ?auto_56952 ) ) ( not ( = ?auto_56950 ?auto_56952 ) ) ( not ( = ?auto_56947 ?auto_56953 ) ) ( not ( = ?auto_56947 ?auto_56951 ) ) ( not ( = ?auto_56948 ?auto_56953 ) ) ( not ( = ?auto_56948 ?auto_56951 ) ) ( not ( = ?auto_56949 ?auto_56953 ) ) ( not ( = ?auto_56949 ?auto_56951 ) ) ( not ( = ?auto_56950 ?auto_56953 ) ) ( not ( = ?auto_56950 ?auto_56951 ) ) ( not ( = ?auto_56952 ?auto_56953 ) ) ( not ( = ?auto_56952 ?auto_56951 ) ) ( not ( = ?auto_56953 ?auto_56951 ) ) ( ON ?auto_56953 ?auto_56952 ) ( ON ?auto_56951 ?auto_56953 ) ( CLEAR ?auto_56951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_56947 ?auto_56948 ?auto_56949 ?auto_56950 ?auto_56952 ?auto_56953 )
      ( MAKE-4PILE ?auto_56947 ?auto_56948 ?auto_56949 ?auto_56950 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56957 - BLOCK
      ?auto_56958 - BLOCK
      ?auto_56959 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_56959 ) ( CLEAR ?auto_56958 ) ( ON-TABLE ?auto_56957 ) ( ON ?auto_56958 ?auto_56957 ) ( not ( = ?auto_56957 ?auto_56958 ) ) ( not ( = ?auto_56957 ?auto_56959 ) ) ( not ( = ?auto_56958 ?auto_56959 ) ) )
    :subtasks
    ( ( !STACK ?auto_56959 ?auto_56958 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56960 - BLOCK
      ?auto_56961 - BLOCK
      ?auto_56962 - BLOCK
    )
    :vars
    (
      ?auto_56963 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_56961 ) ( ON-TABLE ?auto_56960 ) ( ON ?auto_56961 ?auto_56960 ) ( not ( = ?auto_56960 ?auto_56961 ) ) ( not ( = ?auto_56960 ?auto_56962 ) ) ( not ( = ?auto_56961 ?auto_56962 ) ) ( ON ?auto_56962 ?auto_56963 ) ( CLEAR ?auto_56962 ) ( HAND-EMPTY ) ( not ( = ?auto_56960 ?auto_56963 ) ) ( not ( = ?auto_56961 ?auto_56963 ) ) ( not ( = ?auto_56962 ?auto_56963 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_56962 ?auto_56963 )
      ( MAKE-3PILE ?auto_56960 ?auto_56961 ?auto_56962 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56964 - BLOCK
      ?auto_56965 - BLOCK
      ?auto_56966 - BLOCK
    )
    :vars
    (
      ?auto_56967 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56964 ) ( not ( = ?auto_56964 ?auto_56965 ) ) ( not ( = ?auto_56964 ?auto_56966 ) ) ( not ( = ?auto_56965 ?auto_56966 ) ) ( ON ?auto_56966 ?auto_56967 ) ( CLEAR ?auto_56966 ) ( not ( = ?auto_56964 ?auto_56967 ) ) ( not ( = ?auto_56965 ?auto_56967 ) ) ( not ( = ?auto_56966 ?auto_56967 ) ) ( HOLDING ?auto_56965 ) ( CLEAR ?auto_56964 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56964 ?auto_56965 )
      ( MAKE-3PILE ?auto_56964 ?auto_56965 ?auto_56966 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56968 - BLOCK
      ?auto_56969 - BLOCK
      ?auto_56970 - BLOCK
    )
    :vars
    (
      ?auto_56971 - BLOCK
      ?auto_56974 - BLOCK
      ?auto_56973 - BLOCK
      ?auto_56972 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56968 ) ( not ( = ?auto_56968 ?auto_56969 ) ) ( not ( = ?auto_56968 ?auto_56970 ) ) ( not ( = ?auto_56969 ?auto_56970 ) ) ( ON ?auto_56970 ?auto_56971 ) ( not ( = ?auto_56968 ?auto_56971 ) ) ( not ( = ?auto_56969 ?auto_56971 ) ) ( not ( = ?auto_56970 ?auto_56971 ) ) ( CLEAR ?auto_56968 ) ( ON ?auto_56969 ?auto_56970 ) ( CLEAR ?auto_56969 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_56974 ) ( ON ?auto_56973 ?auto_56974 ) ( ON ?auto_56972 ?auto_56973 ) ( ON ?auto_56971 ?auto_56972 ) ( not ( = ?auto_56974 ?auto_56973 ) ) ( not ( = ?auto_56974 ?auto_56972 ) ) ( not ( = ?auto_56974 ?auto_56971 ) ) ( not ( = ?auto_56974 ?auto_56970 ) ) ( not ( = ?auto_56974 ?auto_56969 ) ) ( not ( = ?auto_56973 ?auto_56972 ) ) ( not ( = ?auto_56973 ?auto_56971 ) ) ( not ( = ?auto_56973 ?auto_56970 ) ) ( not ( = ?auto_56973 ?auto_56969 ) ) ( not ( = ?auto_56972 ?auto_56971 ) ) ( not ( = ?auto_56972 ?auto_56970 ) ) ( not ( = ?auto_56972 ?auto_56969 ) ) ( not ( = ?auto_56968 ?auto_56974 ) ) ( not ( = ?auto_56968 ?auto_56973 ) ) ( not ( = ?auto_56968 ?auto_56972 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56974 ?auto_56973 ?auto_56972 ?auto_56971 ?auto_56970 )
      ( MAKE-3PILE ?auto_56968 ?auto_56969 ?auto_56970 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56975 - BLOCK
      ?auto_56976 - BLOCK
      ?auto_56977 - BLOCK
    )
    :vars
    (
      ?auto_56980 - BLOCK
      ?auto_56981 - BLOCK
      ?auto_56979 - BLOCK
      ?auto_56978 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56975 ?auto_56976 ) ) ( not ( = ?auto_56975 ?auto_56977 ) ) ( not ( = ?auto_56976 ?auto_56977 ) ) ( ON ?auto_56977 ?auto_56980 ) ( not ( = ?auto_56975 ?auto_56980 ) ) ( not ( = ?auto_56976 ?auto_56980 ) ) ( not ( = ?auto_56977 ?auto_56980 ) ) ( ON ?auto_56976 ?auto_56977 ) ( CLEAR ?auto_56976 ) ( ON-TABLE ?auto_56981 ) ( ON ?auto_56979 ?auto_56981 ) ( ON ?auto_56978 ?auto_56979 ) ( ON ?auto_56980 ?auto_56978 ) ( not ( = ?auto_56981 ?auto_56979 ) ) ( not ( = ?auto_56981 ?auto_56978 ) ) ( not ( = ?auto_56981 ?auto_56980 ) ) ( not ( = ?auto_56981 ?auto_56977 ) ) ( not ( = ?auto_56981 ?auto_56976 ) ) ( not ( = ?auto_56979 ?auto_56978 ) ) ( not ( = ?auto_56979 ?auto_56980 ) ) ( not ( = ?auto_56979 ?auto_56977 ) ) ( not ( = ?auto_56979 ?auto_56976 ) ) ( not ( = ?auto_56978 ?auto_56980 ) ) ( not ( = ?auto_56978 ?auto_56977 ) ) ( not ( = ?auto_56978 ?auto_56976 ) ) ( not ( = ?auto_56975 ?auto_56981 ) ) ( not ( = ?auto_56975 ?auto_56979 ) ) ( not ( = ?auto_56975 ?auto_56978 ) ) ( HOLDING ?auto_56975 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_56975 )
      ( MAKE-3PILE ?auto_56975 ?auto_56976 ?auto_56977 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56982 - BLOCK
      ?auto_56983 - BLOCK
      ?auto_56984 - BLOCK
    )
    :vars
    (
      ?auto_56988 - BLOCK
      ?auto_56986 - BLOCK
      ?auto_56985 - BLOCK
      ?auto_56987 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56982 ?auto_56983 ) ) ( not ( = ?auto_56982 ?auto_56984 ) ) ( not ( = ?auto_56983 ?auto_56984 ) ) ( ON ?auto_56984 ?auto_56988 ) ( not ( = ?auto_56982 ?auto_56988 ) ) ( not ( = ?auto_56983 ?auto_56988 ) ) ( not ( = ?auto_56984 ?auto_56988 ) ) ( ON ?auto_56983 ?auto_56984 ) ( ON-TABLE ?auto_56986 ) ( ON ?auto_56985 ?auto_56986 ) ( ON ?auto_56987 ?auto_56985 ) ( ON ?auto_56988 ?auto_56987 ) ( not ( = ?auto_56986 ?auto_56985 ) ) ( not ( = ?auto_56986 ?auto_56987 ) ) ( not ( = ?auto_56986 ?auto_56988 ) ) ( not ( = ?auto_56986 ?auto_56984 ) ) ( not ( = ?auto_56986 ?auto_56983 ) ) ( not ( = ?auto_56985 ?auto_56987 ) ) ( not ( = ?auto_56985 ?auto_56988 ) ) ( not ( = ?auto_56985 ?auto_56984 ) ) ( not ( = ?auto_56985 ?auto_56983 ) ) ( not ( = ?auto_56987 ?auto_56988 ) ) ( not ( = ?auto_56987 ?auto_56984 ) ) ( not ( = ?auto_56987 ?auto_56983 ) ) ( not ( = ?auto_56982 ?auto_56986 ) ) ( not ( = ?auto_56982 ?auto_56985 ) ) ( not ( = ?auto_56982 ?auto_56987 ) ) ( ON ?auto_56982 ?auto_56983 ) ( CLEAR ?auto_56982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_56986 ?auto_56985 ?auto_56987 ?auto_56988 ?auto_56984 ?auto_56983 )
      ( MAKE-3PILE ?auto_56982 ?auto_56983 ?auto_56984 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56992 - BLOCK
      ?auto_56993 - BLOCK
      ?auto_56994 - BLOCK
    )
    :vars
    (
      ?auto_56995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56995 ?auto_56994 ) ( CLEAR ?auto_56995 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_56992 ) ( ON ?auto_56993 ?auto_56992 ) ( ON ?auto_56994 ?auto_56993 ) ( not ( = ?auto_56992 ?auto_56993 ) ) ( not ( = ?auto_56992 ?auto_56994 ) ) ( not ( = ?auto_56992 ?auto_56995 ) ) ( not ( = ?auto_56993 ?auto_56994 ) ) ( not ( = ?auto_56993 ?auto_56995 ) ) ( not ( = ?auto_56994 ?auto_56995 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_56995 ?auto_56994 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56996 - BLOCK
      ?auto_56997 - BLOCK
      ?auto_56998 - BLOCK
    )
    :vars
    (
      ?auto_56999 - BLOCK
      ?auto_57000 - BLOCK
      ?auto_57001 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56999 ?auto_56998 ) ( CLEAR ?auto_56999 ) ( ON-TABLE ?auto_56996 ) ( ON ?auto_56997 ?auto_56996 ) ( ON ?auto_56998 ?auto_56997 ) ( not ( = ?auto_56996 ?auto_56997 ) ) ( not ( = ?auto_56996 ?auto_56998 ) ) ( not ( = ?auto_56996 ?auto_56999 ) ) ( not ( = ?auto_56997 ?auto_56998 ) ) ( not ( = ?auto_56997 ?auto_56999 ) ) ( not ( = ?auto_56998 ?auto_56999 ) ) ( HOLDING ?auto_57000 ) ( CLEAR ?auto_57001 ) ( not ( = ?auto_56996 ?auto_57000 ) ) ( not ( = ?auto_56996 ?auto_57001 ) ) ( not ( = ?auto_56997 ?auto_57000 ) ) ( not ( = ?auto_56997 ?auto_57001 ) ) ( not ( = ?auto_56998 ?auto_57000 ) ) ( not ( = ?auto_56998 ?auto_57001 ) ) ( not ( = ?auto_56999 ?auto_57000 ) ) ( not ( = ?auto_56999 ?auto_57001 ) ) ( not ( = ?auto_57000 ?auto_57001 ) ) )
    :subtasks
    ( ( !STACK ?auto_57000 ?auto_57001 )
      ( MAKE-3PILE ?auto_56996 ?auto_56997 ?auto_56998 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_57002 - BLOCK
      ?auto_57003 - BLOCK
      ?auto_57004 - BLOCK
    )
    :vars
    (
      ?auto_57006 - BLOCK
      ?auto_57005 - BLOCK
      ?auto_57007 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57006 ?auto_57004 ) ( ON-TABLE ?auto_57002 ) ( ON ?auto_57003 ?auto_57002 ) ( ON ?auto_57004 ?auto_57003 ) ( not ( = ?auto_57002 ?auto_57003 ) ) ( not ( = ?auto_57002 ?auto_57004 ) ) ( not ( = ?auto_57002 ?auto_57006 ) ) ( not ( = ?auto_57003 ?auto_57004 ) ) ( not ( = ?auto_57003 ?auto_57006 ) ) ( not ( = ?auto_57004 ?auto_57006 ) ) ( CLEAR ?auto_57005 ) ( not ( = ?auto_57002 ?auto_57007 ) ) ( not ( = ?auto_57002 ?auto_57005 ) ) ( not ( = ?auto_57003 ?auto_57007 ) ) ( not ( = ?auto_57003 ?auto_57005 ) ) ( not ( = ?auto_57004 ?auto_57007 ) ) ( not ( = ?auto_57004 ?auto_57005 ) ) ( not ( = ?auto_57006 ?auto_57007 ) ) ( not ( = ?auto_57006 ?auto_57005 ) ) ( not ( = ?auto_57007 ?auto_57005 ) ) ( ON ?auto_57007 ?auto_57006 ) ( CLEAR ?auto_57007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57002 ?auto_57003 ?auto_57004 ?auto_57006 )
      ( MAKE-3PILE ?auto_57002 ?auto_57003 ?auto_57004 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_57008 - BLOCK
      ?auto_57009 - BLOCK
      ?auto_57010 - BLOCK
    )
    :vars
    (
      ?auto_57012 - BLOCK
      ?auto_57011 - BLOCK
      ?auto_57013 - BLOCK
      ?auto_57014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57012 ?auto_57010 ) ( ON-TABLE ?auto_57008 ) ( ON ?auto_57009 ?auto_57008 ) ( ON ?auto_57010 ?auto_57009 ) ( not ( = ?auto_57008 ?auto_57009 ) ) ( not ( = ?auto_57008 ?auto_57010 ) ) ( not ( = ?auto_57008 ?auto_57012 ) ) ( not ( = ?auto_57009 ?auto_57010 ) ) ( not ( = ?auto_57009 ?auto_57012 ) ) ( not ( = ?auto_57010 ?auto_57012 ) ) ( not ( = ?auto_57008 ?auto_57011 ) ) ( not ( = ?auto_57008 ?auto_57013 ) ) ( not ( = ?auto_57009 ?auto_57011 ) ) ( not ( = ?auto_57009 ?auto_57013 ) ) ( not ( = ?auto_57010 ?auto_57011 ) ) ( not ( = ?auto_57010 ?auto_57013 ) ) ( not ( = ?auto_57012 ?auto_57011 ) ) ( not ( = ?auto_57012 ?auto_57013 ) ) ( not ( = ?auto_57011 ?auto_57013 ) ) ( ON ?auto_57011 ?auto_57012 ) ( CLEAR ?auto_57011 ) ( HOLDING ?auto_57013 ) ( CLEAR ?auto_57014 ) ( ON-TABLE ?auto_57014 ) ( not ( = ?auto_57014 ?auto_57013 ) ) ( not ( = ?auto_57008 ?auto_57014 ) ) ( not ( = ?auto_57009 ?auto_57014 ) ) ( not ( = ?auto_57010 ?auto_57014 ) ) ( not ( = ?auto_57012 ?auto_57014 ) ) ( not ( = ?auto_57011 ?auto_57014 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57014 ?auto_57013 )
      ( MAKE-3PILE ?auto_57008 ?auto_57009 ?auto_57010 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_57706 - BLOCK
      ?auto_57707 - BLOCK
      ?auto_57708 - BLOCK
    )
    :vars
    (
      ?auto_57710 - BLOCK
      ?auto_57711 - BLOCK
      ?auto_57709 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57710 ?auto_57708 ) ( ON-TABLE ?auto_57706 ) ( ON ?auto_57707 ?auto_57706 ) ( ON ?auto_57708 ?auto_57707 ) ( not ( = ?auto_57706 ?auto_57707 ) ) ( not ( = ?auto_57706 ?auto_57708 ) ) ( not ( = ?auto_57706 ?auto_57710 ) ) ( not ( = ?auto_57707 ?auto_57708 ) ) ( not ( = ?auto_57707 ?auto_57710 ) ) ( not ( = ?auto_57708 ?auto_57710 ) ) ( not ( = ?auto_57706 ?auto_57711 ) ) ( not ( = ?auto_57706 ?auto_57709 ) ) ( not ( = ?auto_57707 ?auto_57711 ) ) ( not ( = ?auto_57707 ?auto_57709 ) ) ( not ( = ?auto_57708 ?auto_57711 ) ) ( not ( = ?auto_57708 ?auto_57709 ) ) ( not ( = ?auto_57710 ?auto_57711 ) ) ( not ( = ?auto_57710 ?auto_57709 ) ) ( not ( = ?auto_57711 ?auto_57709 ) ) ( ON ?auto_57711 ?auto_57710 ) ( ON ?auto_57709 ?auto_57711 ) ( CLEAR ?auto_57709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_57706 ?auto_57707 ?auto_57708 ?auto_57710 ?auto_57711 )
      ( MAKE-3PILE ?auto_57706 ?auto_57707 ?auto_57708 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_57022 - BLOCK
      ?auto_57023 - BLOCK
      ?auto_57024 - BLOCK
    )
    :vars
    (
      ?auto_57026 - BLOCK
      ?auto_57027 - BLOCK
      ?auto_57028 - BLOCK
      ?auto_57025 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57026 ?auto_57024 ) ( ON-TABLE ?auto_57022 ) ( ON ?auto_57023 ?auto_57022 ) ( ON ?auto_57024 ?auto_57023 ) ( not ( = ?auto_57022 ?auto_57023 ) ) ( not ( = ?auto_57022 ?auto_57024 ) ) ( not ( = ?auto_57022 ?auto_57026 ) ) ( not ( = ?auto_57023 ?auto_57024 ) ) ( not ( = ?auto_57023 ?auto_57026 ) ) ( not ( = ?auto_57024 ?auto_57026 ) ) ( not ( = ?auto_57022 ?auto_57027 ) ) ( not ( = ?auto_57022 ?auto_57028 ) ) ( not ( = ?auto_57023 ?auto_57027 ) ) ( not ( = ?auto_57023 ?auto_57028 ) ) ( not ( = ?auto_57024 ?auto_57027 ) ) ( not ( = ?auto_57024 ?auto_57028 ) ) ( not ( = ?auto_57026 ?auto_57027 ) ) ( not ( = ?auto_57026 ?auto_57028 ) ) ( not ( = ?auto_57027 ?auto_57028 ) ) ( ON ?auto_57027 ?auto_57026 ) ( not ( = ?auto_57025 ?auto_57028 ) ) ( not ( = ?auto_57022 ?auto_57025 ) ) ( not ( = ?auto_57023 ?auto_57025 ) ) ( not ( = ?auto_57024 ?auto_57025 ) ) ( not ( = ?auto_57026 ?auto_57025 ) ) ( not ( = ?auto_57027 ?auto_57025 ) ) ( ON ?auto_57028 ?auto_57027 ) ( CLEAR ?auto_57028 ) ( HOLDING ?auto_57025 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_57025 )
      ( MAKE-3PILE ?auto_57022 ?auto_57023 ?auto_57024 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_57029 - BLOCK
      ?auto_57030 - BLOCK
      ?auto_57031 - BLOCK
    )
    :vars
    (
      ?auto_57033 - BLOCK
      ?auto_57035 - BLOCK
      ?auto_57032 - BLOCK
      ?auto_57034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57033 ?auto_57031 ) ( ON-TABLE ?auto_57029 ) ( ON ?auto_57030 ?auto_57029 ) ( ON ?auto_57031 ?auto_57030 ) ( not ( = ?auto_57029 ?auto_57030 ) ) ( not ( = ?auto_57029 ?auto_57031 ) ) ( not ( = ?auto_57029 ?auto_57033 ) ) ( not ( = ?auto_57030 ?auto_57031 ) ) ( not ( = ?auto_57030 ?auto_57033 ) ) ( not ( = ?auto_57031 ?auto_57033 ) ) ( not ( = ?auto_57029 ?auto_57035 ) ) ( not ( = ?auto_57029 ?auto_57032 ) ) ( not ( = ?auto_57030 ?auto_57035 ) ) ( not ( = ?auto_57030 ?auto_57032 ) ) ( not ( = ?auto_57031 ?auto_57035 ) ) ( not ( = ?auto_57031 ?auto_57032 ) ) ( not ( = ?auto_57033 ?auto_57035 ) ) ( not ( = ?auto_57033 ?auto_57032 ) ) ( not ( = ?auto_57035 ?auto_57032 ) ) ( ON ?auto_57035 ?auto_57033 ) ( not ( = ?auto_57034 ?auto_57032 ) ) ( not ( = ?auto_57029 ?auto_57034 ) ) ( not ( = ?auto_57030 ?auto_57034 ) ) ( not ( = ?auto_57031 ?auto_57034 ) ) ( not ( = ?auto_57033 ?auto_57034 ) ) ( not ( = ?auto_57035 ?auto_57034 ) ) ( ON ?auto_57032 ?auto_57035 ) ( ON ?auto_57034 ?auto_57032 ) ( CLEAR ?auto_57034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_57029 ?auto_57030 ?auto_57031 ?auto_57033 ?auto_57035 ?auto_57032 )
      ( MAKE-3PILE ?auto_57029 ?auto_57030 ?auto_57031 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57040 - BLOCK
      ?auto_57041 - BLOCK
      ?auto_57042 - BLOCK
      ?auto_57043 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_57043 ) ( CLEAR ?auto_57042 ) ( ON-TABLE ?auto_57040 ) ( ON ?auto_57041 ?auto_57040 ) ( ON ?auto_57042 ?auto_57041 ) ( not ( = ?auto_57040 ?auto_57041 ) ) ( not ( = ?auto_57040 ?auto_57042 ) ) ( not ( = ?auto_57040 ?auto_57043 ) ) ( not ( = ?auto_57041 ?auto_57042 ) ) ( not ( = ?auto_57041 ?auto_57043 ) ) ( not ( = ?auto_57042 ?auto_57043 ) ) )
    :subtasks
    ( ( !STACK ?auto_57043 ?auto_57042 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57044 - BLOCK
      ?auto_57045 - BLOCK
      ?auto_57046 - BLOCK
      ?auto_57047 - BLOCK
    )
    :vars
    (
      ?auto_57048 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_57046 ) ( ON-TABLE ?auto_57044 ) ( ON ?auto_57045 ?auto_57044 ) ( ON ?auto_57046 ?auto_57045 ) ( not ( = ?auto_57044 ?auto_57045 ) ) ( not ( = ?auto_57044 ?auto_57046 ) ) ( not ( = ?auto_57044 ?auto_57047 ) ) ( not ( = ?auto_57045 ?auto_57046 ) ) ( not ( = ?auto_57045 ?auto_57047 ) ) ( not ( = ?auto_57046 ?auto_57047 ) ) ( ON ?auto_57047 ?auto_57048 ) ( CLEAR ?auto_57047 ) ( HAND-EMPTY ) ( not ( = ?auto_57044 ?auto_57048 ) ) ( not ( = ?auto_57045 ?auto_57048 ) ) ( not ( = ?auto_57046 ?auto_57048 ) ) ( not ( = ?auto_57047 ?auto_57048 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_57047 ?auto_57048 )
      ( MAKE-4PILE ?auto_57044 ?auto_57045 ?auto_57046 ?auto_57047 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57049 - BLOCK
      ?auto_57050 - BLOCK
      ?auto_57051 - BLOCK
      ?auto_57052 - BLOCK
    )
    :vars
    (
      ?auto_57053 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57049 ) ( ON ?auto_57050 ?auto_57049 ) ( not ( = ?auto_57049 ?auto_57050 ) ) ( not ( = ?auto_57049 ?auto_57051 ) ) ( not ( = ?auto_57049 ?auto_57052 ) ) ( not ( = ?auto_57050 ?auto_57051 ) ) ( not ( = ?auto_57050 ?auto_57052 ) ) ( not ( = ?auto_57051 ?auto_57052 ) ) ( ON ?auto_57052 ?auto_57053 ) ( CLEAR ?auto_57052 ) ( not ( = ?auto_57049 ?auto_57053 ) ) ( not ( = ?auto_57050 ?auto_57053 ) ) ( not ( = ?auto_57051 ?auto_57053 ) ) ( not ( = ?auto_57052 ?auto_57053 ) ) ( HOLDING ?auto_57051 ) ( CLEAR ?auto_57050 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57049 ?auto_57050 ?auto_57051 )
      ( MAKE-4PILE ?auto_57049 ?auto_57050 ?auto_57051 ?auto_57052 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57054 - BLOCK
      ?auto_57055 - BLOCK
      ?auto_57056 - BLOCK
      ?auto_57057 - BLOCK
    )
    :vars
    (
      ?auto_57058 - BLOCK
      ?auto_57060 - BLOCK
      ?auto_57059 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57054 ) ( ON ?auto_57055 ?auto_57054 ) ( not ( = ?auto_57054 ?auto_57055 ) ) ( not ( = ?auto_57054 ?auto_57056 ) ) ( not ( = ?auto_57054 ?auto_57057 ) ) ( not ( = ?auto_57055 ?auto_57056 ) ) ( not ( = ?auto_57055 ?auto_57057 ) ) ( not ( = ?auto_57056 ?auto_57057 ) ) ( ON ?auto_57057 ?auto_57058 ) ( not ( = ?auto_57054 ?auto_57058 ) ) ( not ( = ?auto_57055 ?auto_57058 ) ) ( not ( = ?auto_57056 ?auto_57058 ) ) ( not ( = ?auto_57057 ?auto_57058 ) ) ( CLEAR ?auto_57055 ) ( ON ?auto_57056 ?auto_57057 ) ( CLEAR ?auto_57056 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_57060 ) ( ON ?auto_57059 ?auto_57060 ) ( ON ?auto_57058 ?auto_57059 ) ( not ( = ?auto_57060 ?auto_57059 ) ) ( not ( = ?auto_57060 ?auto_57058 ) ) ( not ( = ?auto_57060 ?auto_57057 ) ) ( not ( = ?auto_57060 ?auto_57056 ) ) ( not ( = ?auto_57059 ?auto_57058 ) ) ( not ( = ?auto_57059 ?auto_57057 ) ) ( not ( = ?auto_57059 ?auto_57056 ) ) ( not ( = ?auto_57054 ?auto_57060 ) ) ( not ( = ?auto_57054 ?auto_57059 ) ) ( not ( = ?auto_57055 ?auto_57060 ) ) ( not ( = ?auto_57055 ?auto_57059 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57060 ?auto_57059 ?auto_57058 ?auto_57057 )
      ( MAKE-4PILE ?auto_57054 ?auto_57055 ?auto_57056 ?auto_57057 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57061 - BLOCK
      ?auto_57062 - BLOCK
      ?auto_57063 - BLOCK
      ?auto_57064 - BLOCK
    )
    :vars
    (
      ?auto_57067 - BLOCK
      ?auto_57065 - BLOCK
      ?auto_57066 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57061 ) ( not ( = ?auto_57061 ?auto_57062 ) ) ( not ( = ?auto_57061 ?auto_57063 ) ) ( not ( = ?auto_57061 ?auto_57064 ) ) ( not ( = ?auto_57062 ?auto_57063 ) ) ( not ( = ?auto_57062 ?auto_57064 ) ) ( not ( = ?auto_57063 ?auto_57064 ) ) ( ON ?auto_57064 ?auto_57067 ) ( not ( = ?auto_57061 ?auto_57067 ) ) ( not ( = ?auto_57062 ?auto_57067 ) ) ( not ( = ?auto_57063 ?auto_57067 ) ) ( not ( = ?auto_57064 ?auto_57067 ) ) ( ON ?auto_57063 ?auto_57064 ) ( CLEAR ?auto_57063 ) ( ON-TABLE ?auto_57065 ) ( ON ?auto_57066 ?auto_57065 ) ( ON ?auto_57067 ?auto_57066 ) ( not ( = ?auto_57065 ?auto_57066 ) ) ( not ( = ?auto_57065 ?auto_57067 ) ) ( not ( = ?auto_57065 ?auto_57064 ) ) ( not ( = ?auto_57065 ?auto_57063 ) ) ( not ( = ?auto_57066 ?auto_57067 ) ) ( not ( = ?auto_57066 ?auto_57064 ) ) ( not ( = ?auto_57066 ?auto_57063 ) ) ( not ( = ?auto_57061 ?auto_57065 ) ) ( not ( = ?auto_57061 ?auto_57066 ) ) ( not ( = ?auto_57062 ?auto_57065 ) ) ( not ( = ?auto_57062 ?auto_57066 ) ) ( HOLDING ?auto_57062 ) ( CLEAR ?auto_57061 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57061 ?auto_57062 )
      ( MAKE-4PILE ?auto_57061 ?auto_57062 ?auto_57063 ?auto_57064 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57068 - BLOCK
      ?auto_57069 - BLOCK
      ?auto_57070 - BLOCK
      ?auto_57071 - BLOCK
    )
    :vars
    (
      ?auto_57072 - BLOCK
      ?auto_57074 - BLOCK
      ?auto_57073 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57068 ) ( not ( = ?auto_57068 ?auto_57069 ) ) ( not ( = ?auto_57068 ?auto_57070 ) ) ( not ( = ?auto_57068 ?auto_57071 ) ) ( not ( = ?auto_57069 ?auto_57070 ) ) ( not ( = ?auto_57069 ?auto_57071 ) ) ( not ( = ?auto_57070 ?auto_57071 ) ) ( ON ?auto_57071 ?auto_57072 ) ( not ( = ?auto_57068 ?auto_57072 ) ) ( not ( = ?auto_57069 ?auto_57072 ) ) ( not ( = ?auto_57070 ?auto_57072 ) ) ( not ( = ?auto_57071 ?auto_57072 ) ) ( ON ?auto_57070 ?auto_57071 ) ( ON-TABLE ?auto_57074 ) ( ON ?auto_57073 ?auto_57074 ) ( ON ?auto_57072 ?auto_57073 ) ( not ( = ?auto_57074 ?auto_57073 ) ) ( not ( = ?auto_57074 ?auto_57072 ) ) ( not ( = ?auto_57074 ?auto_57071 ) ) ( not ( = ?auto_57074 ?auto_57070 ) ) ( not ( = ?auto_57073 ?auto_57072 ) ) ( not ( = ?auto_57073 ?auto_57071 ) ) ( not ( = ?auto_57073 ?auto_57070 ) ) ( not ( = ?auto_57068 ?auto_57074 ) ) ( not ( = ?auto_57068 ?auto_57073 ) ) ( not ( = ?auto_57069 ?auto_57074 ) ) ( not ( = ?auto_57069 ?auto_57073 ) ) ( CLEAR ?auto_57068 ) ( ON ?auto_57069 ?auto_57070 ) ( CLEAR ?auto_57069 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_57074 ?auto_57073 ?auto_57072 ?auto_57071 ?auto_57070 )
      ( MAKE-4PILE ?auto_57068 ?auto_57069 ?auto_57070 ?auto_57071 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57075 - BLOCK
      ?auto_57076 - BLOCK
      ?auto_57077 - BLOCK
      ?auto_57078 - BLOCK
    )
    :vars
    (
      ?auto_57080 - BLOCK
      ?auto_57081 - BLOCK
      ?auto_57079 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57075 ?auto_57076 ) ) ( not ( = ?auto_57075 ?auto_57077 ) ) ( not ( = ?auto_57075 ?auto_57078 ) ) ( not ( = ?auto_57076 ?auto_57077 ) ) ( not ( = ?auto_57076 ?auto_57078 ) ) ( not ( = ?auto_57077 ?auto_57078 ) ) ( ON ?auto_57078 ?auto_57080 ) ( not ( = ?auto_57075 ?auto_57080 ) ) ( not ( = ?auto_57076 ?auto_57080 ) ) ( not ( = ?auto_57077 ?auto_57080 ) ) ( not ( = ?auto_57078 ?auto_57080 ) ) ( ON ?auto_57077 ?auto_57078 ) ( ON-TABLE ?auto_57081 ) ( ON ?auto_57079 ?auto_57081 ) ( ON ?auto_57080 ?auto_57079 ) ( not ( = ?auto_57081 ?auto_57079 ) ) ( not ( = ?auto_57081 ?auto_57080 ) ) ( not ( = ?auto_57081 ?auto_57078 ) ) ( not ( = ?auto_57081 ?auto_57077 ) ) ( not ( = ?auto_57079 ?auto_57080 ) ) ( not ( = ?auto_57079 ?auto_57078 ) ) ( not ( = ?auto_57079 ?auto_57077 ) ) ( not ( = ?auto_57075 ?auto_57081 ) ) ( not ( = ?auto_57075 ?auto_57079 ) ) ( not ( = ?auto_57076 ?auto_57081 ) ) ( not ( = ?auto_57076 ?auto_57079 ) ) ( ON ?auto_57076 ?auto_57077 ) ( CLEAR ?auto_57076 ) ( HOLDING ?auto_57075 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_57075 )
      ( MAKE-4PILE ?auto_57075 ?auto_57076 ?auto_57077 ?auto_57078 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57082 - BLOCK
      ?auto_57083 - BLOCK
      ?auto_57084 - BLOCK
      ?auto_57085 - BLOCK
    )
    :vars
    (
      ?auto_57088 - BLOCK
      ?auto_57086 - BLOCK
      ?auto_57087 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57082 ?auto_57083 ) ) ( not ( = ?auto_57082 ?auto_57084 ) ) ( not ( = ?auto_57082 ?auto_57085 ) ) ( not ( = ?auto_57083 ?auto_57084 ) ) ( not ( = ?auto_57083 ?auto_57085 ) ) ( not ( = ?auto_57084 ?auto_57085 ) ) ( ON ?auto_57085 ?auto_57088 ) ( not ( = ?auto_57082 ?auto_57088 ) ) ( not ( = ?auto_57083 ?auto_57088 ) ) ( not ( = ?auto_57084 ?auto_57088 ) ) ( not ( = ?auto_57085 ?auto_57088 ) ) ( ON ?auto_57084 ?auto_57085 ) ( ON-TABLE ?auto_57086 ) ( ON ?auto_57087 ?auto_57086 ) ( ON ?auto_57088 ?auto_57087 ) ( not ( = ?auto_57086 ?auto_57087 ) ) ( not ( = ?auto_57086 ?auto_57088 ) ) ( not ( = ?auto_57086 ?auto_57085 ) ) ( not ( = ?auto_57086 ?auto_57084 ) ) ( not ( = ?auto_57087 ?auto_57088 ) ) ( not ( = ?auto_57087 ?auto_57085 ) ) ( not ( = ?auto_57087 ?auto_57084 ) ) ( not ( = ?auto_57082 ?auto_57086 ) ) ( not ( = ?auto_57082 ?auto_57087 ) ) ( not ( = ?auto_57083 ?auto_57086 ) ) ( not ( = ?auto_57083 ?auto_57087 ) ) ( ON ?auto_57083 ?auto_57084 ) ( ON ?auto_57082 ?auto_57083 ) ( CLEAR ?auto_57082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_57086 ?auto_57087 ?auto_57088 ?auto_57085 ?auto_57084 ?auto_57083 )
      ( MAKE-4PILE ?auto_57082 ?auto_57083 ?auto_57084 ?auto_57085 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_57091 - BLOCK
      ?auto_57092 - BLOCK
    )
    :vars
    (
      ?auto_57093 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57093 ?auto_57092 ) ( CLEAR ?auto_57093 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_57091 ) ( ON ?auto_57092 ?auto_57091 ) ( not ( = ?auto_57091 ?auto_57092 ) ) ( not ( = ?auto_57091 ?auto_57093 ) ) ( not ( = ?auto_57092 ?auto_57093 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_57093 ?auto_57092 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_57094 - BLOCK
      ?auto_57095 - BLOCK
    )
    :vars
    (
      ?auto_57096 - BLOCK
      ?auto_57097 - BLOCK
      ?auto_57098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57096 ?auto_57095 ) ( CLEAR ?auto_57096 ) ( ON-TABLE ?auto_57094 ) ( ON ?auto_57095 ?auto_57094 ) ( not ( = ?auto_57094 ?auto_57095 ) ) ( not ( = ?auto_57094 ?auto_57096 ) ) ( not ( = ?auto_57095 ?auto_57096 ) ) ( HOLDING ?auto_57097 ) ( CLEAR ?auto_57098 ) ( not ( = ?auto_57094 ?auto_57097 ) ) ( not ( = ?auto_57094 ?auto_57098 ) ) ( not ( = ?auto_57095 ?auto_57097 ) ) ( not ( = ?auto_57095 ?auto_57098 ) ) ( not ( = ?auto_57096 ?auto_57097 ) ) ( not ( = ?auto_57096 ?auto_57098 ) ) ( not ( = ?auto_57097 ?auto_57098 ) ) )
    :subtasks
    ( ( !STACK ?auto_57097 ?auto_57098 )
      ( MAKE-2PILE ?auto_57094 ?auto_57095 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_57099 - BLOCK
      ?auto_57100 - BLOCK
    )
    :vars
    (
      ?auto_57101 - BLOCK
      ?auto_57103 - BLOCK
      ?auto_57102 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57101 ?auto_57100 ) ( ON-TABLE ?auto_57099 ) ( ON ?auto_57100 ?auto_57099 ) ( not ( = ?auto_57099 ?auto_57100 ) ) ( not ( = ?auto_57099 ?auto_57101 ) ) ( not ( = ?auto_57100 ?auto_57101 ) ) ( CLEAR ?auto_57103 ) ( not ( = ?auto_57099 ?auto_57102 ) ) ( not ( = ?auto_57099 ?auto_57103 ) ) ( not ( = ?auto_57100 ?auto_57102 ) ) ( not ( = ?auto_57100 ?auto_57103 ) ) ( not ( = ?auto_57101 ?auto_57102 ) ) ( not ( = ?auto_57101 ?auto_57103 ) ) ( not ( = ?auto_57102 ?auto_57103 ) ) ( ON ?auto_57102 ?auto_57101 ) ( CLEAR ?auto_57102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57099 ?auto_57100 ?auto_57101 )
      ( MAKE-2PILE ?auto_57099 ?auto_57100 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_57104 - BLOCK
      ?auto_57105 - BLOCK
    )
    :vars
    (
      ?auto_57108 - BLOCK
      ?auto_57107 - BLOCK
      ?auto_57106 - BLOCK
      ?auto_57110 - BLOCK
      ?auto_57109 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57108 ?auto_57105 ) ( ON-TABLE ?auto_57104 ) ( ON ?auto_57105 ?auto_57104 ) ( not ( = ?auto_57104 ?auto_57105 ) ) ( not ( = ?auto_57104 ?auto_57108 ) ) ( not ( = ?auto_57105 ?auto_57108 ) ) ( not ( = ?auto_57104 ?auto_57107 ) ) ( not ( = ?auto_57104 ?auto_57106 ) ) ( not ( = ?auto_57105 ?auto_57107 ) ) ( not ( = ?auto_57105 ?auto_57106 ) ) ( not ( = ?auto_57108 ?auto_57107 ) ) ( not ( = ?auto_57108 ?auto_57106 ) ) ( not ( = ?auto_57107 ?auto_57106 ) ) ( ON ?auto_57107 ?auto_57108 ) ( CLEAR ?auto_57107 ) ( HOLDING ?auto_57106 ) ( CLEAR ?auto_57110 ) ( ON-TABLE ?auto_57109 ) ( ON ?auto_57110 ?auto_57109 ) ( not ( = ?auto_57109 ?auto_57110 ) ) ( not ( = ?auto_57109 ?auto_57106 ) ) ( not ( = ?auto_57110 ?auto_57106 ) ) ( not ( = ?auto_57104 ?auto_57110 ) ) ( not ( = ?auto_57104 ?auto_57109 ) ) ( not ( = ?auto_57105 ?auto_57110 ) ) ( not ( = ?auto_57105 ?auto_57109 ) ) ( not ( = ?auto_57108 ?auto_57110 ) ) ( not ( = ?auto_57108 ?auto_57109 ) ) ( not ( = ?auto_57107 ?auto_57110 ) ) ( not ( = ?auto_57107 ?auto_57109 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57109 ?auto_57110 ?auto_57106 )
      ( MAKE-2PILE ?auto_57104 ?auto_57105 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_57111 - BLOCK
      ?auto_57112 - BLOCK
    )
    :vars
    (
      ?auto_57113 - BLOCK
      ?auto_57114 - BLOCK
      ?auto_57117 - BLOCK
      ?auto_57115 - BLOCK
      ?auto_57116 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57113 ?auto_57112 ) ( ON-TABLE ?auto_57111 ) ( ON ?auto_57112 ?auto_57111 ) ( not ( = ?auto_57111 ?auto_57112 ) ) ( not ( = ?auto_57111 ?auto_57113 ) ) ( not ( = ?auto_57112 ?auto_57113 ) ) ( not ( = ?auto_57111 ?auto_57114 ) ) ( not ( = ?auto_57111 ?auto_57117 ) ) ( not ( = ?auto_57112 ?auto_57114 ) ) ( not ( = ?auto_57112 ?auto_57117 ) ) ( not ( = ?auto_57113 ?auto_57114 ) ) ( not ( = ?auto_57113 ?auto_57117 ) ) ( not ( = ?auto_57114 ?auto_57117 ) ) ( ON ?auto_57114 ?auto_57113 ) ( CLEAR ?auto_57115 ) ( ON-TABLE ?auto_57116 ) ( ON ?auto_57115 ?auto_57116 ) ( not ( = ?auto_57116 ?auto_57115 ) ) ( not ( = ?auto_57116 ?auto_57117 ) ) ( not ( = ?auto_57115 ?auto_57117 ) ) ( not ( = ?auto_57111 ?auto_57115 ) ) ( not ( = ?auto_57111 ?auto_57116 ) ) ( not ( = ?auto_57112 ?auto_57115 ) ) ( not ( = ?auto_57112 ?auto_57116 ) ) ( not ( = ?auto_57113 ?auto_57115 ) ) ( not ( = ?auto_57113 ?auto_57116 ) ) ( not ( = ?auto_57114 ?auto_57115 ) ) ( not ( = ?auto_57114 ?auto_57116 ) ) ( ON ?auto_57117 ?auto_57114 ) ( CLEAR ?auto_57117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57111 ?auto_57112 ?auto_57113 ?auto_57114 )
      ( MAKE-2PILE ?auto_57111 ?auto_57112 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_57118 - BLOCK
      ?auto_57119 - BLOCK
    )
    :vars
    (
      ?auto_57124 - BLOCK
      ?auto_57122 - BLOCK
      ?auto_57120 - BLOCK
      ?auto_57121 - BLOCK
      ?auto_57123 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57124 ?auto_57119 ) ( ON-TABLE ?auto_57118 ) ( ON ?auto_57119 ?auto_57118 ) ( not ( = ?auto_57118 ?auto_57119 ) ) ( not ( = ?auto_57118 ?auto_57124 ) ) ( not ( = ?auto_57119 ?auto_57124 ) ) ( not ( = ?auto_57118 ?auto_57122 ) ) ( not ( = ?auto_57118 ?auto_57120 ) ) ( not ( = ?auto_57119 ?auto_57122 ) ) ( not ( = ?auto_57119 ?auto_57120 ) ) ( not ( = ?auto_57124 ?auto_57122 ) ) ( not ( = ?auto_57124 ?auto_57120 ) ) ( not ( = ?auto_57122 ?auto_57120 ) ) ( ON ?auto_57122 ?auto_57124 ) ( ON-TABLE ?auto_57121 ) ( not ( = ?auto_57121 ?auto_57123 ) ) ( not ( = ?auto_57121 ?auto_57120 ) ) ( not ( = ?auto_57123 ?auto_57120 ) ) ( not ( = ?auto_57118 ?auto_57123 ) ) ( not ( = ?auto_57118 ?auto_57121 ) ) ( not ( = ?auto_57119 ?auto_57123 ) ) ( not ( = ?auto_57119 ?auto_57121 ) ) ( not ( = ?auto_57124 ?auto_57123 ) ) ( not ( = ?auto_57124 ?auto_57121 ) ) ( not ( = ?auto_57122 ?auto_57123 ) ) ( not ( = ?auto_57122 ?auto_57121 ) ) ( ON ?auto_57120 ?auto_57122 ) ( CLEAR ?auto_57120 ) ( HOLDING ?auto_57123 ) ( CLEAR ?auto_57121 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57121 ?auto_57123 )
      ( MAKE-2PILE ?auto_57118 ?auto_57119 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_57896 - BLOCK
      ?auto_57897 - BLOCK
    )
    :vars
    (
      ?auto_57899 - BLOCK
      ?auto_57898 - BLOCK
      ?auto_57901 - BLOCK
      ?auto_57900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57899 ?auto_57897 ) ( ON-TABLE ?auto_57896 ) ( ON ?auto_57897 ?auto_57896 ) ( not ( = ?auto_57896 ?auto_57897 ) ) ( not ( = ?auto_57896 ?auto_57899 ) ) ( not ( = ?auto_57897 ?auto_57899 ) ) ( not ( = ?auto_57896 ?auto_57898 ) ) ( not ( = ?auto_57896 ?auto_57901 ) ) ( not ( = ?auto_57897 ?auto_57898 ) ) ( not ( = ?auto_57897 ?auto_57901 ) ) ( not ( = ?auto_57899 ?auto_57898 ) ) ( not ( = ?auto_57899 ?auto_57901 ) ) ( not ( = ?auto_57898 ?auto_57901 ) ) ( ON ?auto_57898 ?auto_57899 ) ( not ( = ?auto_57900 ?auto_57901 ) ) ( not ( = ?auto_57896 ?auto_57900 ) ) ( not ( = ?auto_57897 ?auto_57900 ) ) ( not ( = ?auto_57899 ?auto_57900 ) ) ( not ( = ?auto_57898 ?auto_57900 ) ) ( ON ?auto_57901 ?auto_57898 ) ( ON ?auto_57900 ?auto_57901 ) ( CLEAR ?auto_57900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_57896 ?auto_57897 ?auto_57899 ?auto_57898 ?auto_57901 )
      ( MAKE-2PILE ?auto_57896 ?auto_57897 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_57132 - BLOCK
      ?auto_57133 - BLOCK
    )
    :vars
    (
      ?auto_57135 - BLOCK
      ?auto_57134 - BLOCK
      ?auto_57138 - BLOCK
      ?auto_57136 - BLOCK
      ?auto_57137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57135 ?auto_57133 ) ( ON-TABLE ?auto_57132 ) ( ON ?auto_57133 ?auto_57132 ) ( not ( = ?auto_57132 ?auto_57133 ) ) ( not ( = ?auto_57132 ?auto_57135 ) ) ( not ( = ?auto_57133 ?auto_57135 ) ) ( not ( = ?auto_57132 ?auto_57134 ) ) ( not ( = ?auto_57132 ?auto_57138 ) ) ( not ( = ?auto_57133 ?auto_57134 ) ) ( not ( = ?auto_57133 ?auto_57138 ) ) ( not ( = ?auto_57135 ?auto_57134 ) ) ( not ( = ?auto_57135 ?auto_57138 ) ) ( not ( = ?auto_57134 ?auto_57138 ) ) ( ON ?auto_57134 ?auto_57135 ) ( not ( = ?auto_57136 ?auto_57137 ) ) ( not ( = ?auto_57136 ?auto_57138 ) ) ( not ( = ?auto_57137 ?auto_57138 ) ) ( not ( = ?auto_57132 ?auto_57137 ) ) ( not ( = ?auto_57132 ?auto_57136 ) ) ( not ( = ?auto_57133 ?auto_57137 ) ) ( not ( = ?auto_57133 ?auto_57136 ) ) ( not ( = ?auto_57135 ?auto_57137 ) ) ( not ( = ?auto_57135 ?auto_57136 ) ) ( not ( = ?auto_57134 ?auto_57137 ) ) ( not ( = ?auto_57134 ?auto_57136 ) ) ( ON ?auto_57138 ?auto_57134 ) ( ON ?auto_57137 ?auto_57138 ) ( CLEAR ?auto_57137 ) ( HOLDING ?auto_57136 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_57136 )
      ( MAKE-2PILE ?auto_57132 ?auto_57133 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_57139 - BLOCK
      ?auto_57140 - BLOCK
    )
    :vars
    (
      ?auto_57142 - BLOCK
      ?auto_57141 - BLOCK
      ?auto_57143 - BLOCK
      ?auto_57145 - BLOCK
      ?auto_57144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57142 ?auto_57140 ) ( ON-TABLE ?auto_57139 ) ( ON ?auto_57140 ?auto_57139 ) ( not ( = ?auto_57139 ?auto_57140 ) ) ( not ( = ?auto_57139 ?auto_57142 ) ) ( not ( = ?auto_57140 ?auto_57142 ) ) ( not ( = ?auto_57139 ?auto_57141 ) ) ( not ( = ?auto_57139 ?auto_57143 ) ) ( not ( = ?auto_57140 ?auto_57141 ) ) ( not ( = ?auto_57140 ?auto_57143 ) ) ( not ( = ?auto_57142 ?auto_57141 ) ) ( not ( = ?auto_57142 ?auto_57143 ) ) ( not ( = ?auto_57141 ?auto_57143 ) ) ( ON ?auto_57141 ?auto_57142 ) ( not ( = ?auto_57145 ?auto_57144 ) ) ( not ( = ?auto_57145 ?auto_57143 ) ) ( not ( = ?auto_57144 ?auto_57143 ) ) ( not ( = ?auto_57139 ?auto_57144 ) ) ( not ( = ?auto_57139 ?auto_57145 ) ) ( not ( = ?auto_57140 ?auto_57144 ) ) ( not ( = ?auto_57140 ?auto_57145 ) ) ( not ( = ?auto_57142 ?auto_57144 ) ) ( not ( = ?auto_57142 ?auto_57145 ) ) ( not ( = ?auto_57141 ?auto_57144 ) ) ( not ( = ?auto_57141 ?auto_57145 ) ) ( ON ?auto_57143 ?auto_57141 ) ( ON ?auto_57144 ?auto_57143 ) ( ON ?auto_57145 ?auto_57144 ) ( CLEAR ?auto_57145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_57139 ?auto_57140 ?auto_57142 ?auto_57141 ?auto_57143 ?auto_57144 )
      ( MAKE-2PILE ?auto_57139 ?auto_57140 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57151 - BLOCK
      ?auto_57152 - BLOCK
      ?auto_57153 - BLOCK
      ?auto_57154 - BLOCK
      ?auto_57155 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_57155 ) ( CLEAR ?auto_57154 ) ( ON-TABLE ?auto_57151 ) ( ON ?auto_57152 ?auto_57151 ) ( ON ?auto_57153 ?auto_57152 ) ( ON ?auto_57154 ?auto_57153 ) ( not ( = ?auto_57151 ?auto_57152 ) ) ( not ( = ?auto_57151 ?auto_57153 ) ) ( not ( = ?auto_57151 ?auto_57154 ) ) ( not ( = ?auto_57151 ?auto_57155 ) ) ( not ( = ?auto_57152 ?auto_57153 ) ) ( not ( = ?auto_57152 ?auto_57154 ) ) ( not ( = ?auto_57152 ?auto_57155 ) ) ( not ( = ?auto_57153 ?auto_57154 ) ) ( not ( = ?auto_57153 ?auto_57155 ) ) ( not ( = ?auto_57154 ?auto_57155 ) ) )
    :subtasks
    ( ( !STACK ?auto_57155 ?auto_57154 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57156 - BLOCK
      ?auto_57157 - BLOCK
      ?auto_57158 - BLOCK
      ?auto_57159 - BLOCK
      ?auto_57160 - BLOCK
    )
    :vars
    (
      ?auto_57161 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_57159 ) ( ON-TABLE ?auto_57156 ) ( ON ?auto_57157 ?auto_57156 ) ( ON ?auto_57158 ?auto_57157 ) ( ON ?auto_57159 ?auto_57158 ) ( not ( = ?auto_57156 ?auto_57157 ) ) ( not ( = ?auto_57156 ?auto_57158 ) ) ( not ( = ?auto_57156 ?auto_57159 ) ) ( not ( = ?auto_57156 ?auto_57160 ) ) ( not ( = ?auto_57157 ?auto_57158 ) ) ( not ( = ?auto_57157 ?auto_57159 ) ) ( not ( = ?auto_57157 ?auto_57160 ) ) ( not ( = ?auto_57158 ?auto_57159 ) ) ( not ( = ?auto_57158 ?auto_57160 ) ) ( not ( = ?auto_57159 ?auto_57160 ) ) ( ON ?auto_57160 ?auto_57161 ) ( CLEAR ?auto_57160 ) ( HAND-EMPTY ) ( not ( = ?auto_57156 ?auto_57161 ) ) ( not ( = ?auto_57157 ?auto_57161 ) ) ( not ( = ?auto_57158 ?auto_57161 ) ) ( not ( = ?auto_57159 ?auto_57161 ) ) ( not ( = ?auto_57160 ?auto_57161 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_57160 ?auto_57161 )
      ( MAKE-5PILE ?auto_57156 ?auto_57157 ?auto_57158 ?auto_57159 ?auto_57160 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57162 - BLOCK
      ?auto_57163 - BLOCK
      ?auto_57164 - BLOCK
      ?auto_57165 - BLOCK
      ?auto_57166 - BLOCK
    )
    :vars
    (
      ?auto_57167 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57162 ) ( ON ?auto_57163 ?auto_57162 ) ( ON ?auto_57164 ?auto_57163 ) ( not ( = ?auto_57162 ?auto_57163 ) ) ( not ( = ?auto_57162 ?auto_57164 ) ) ( not ( = ?auto_57162 ?auto_57165 ) ) ( not ( = ?auto_57162 ?auto_57166 ) ) ( not ( = ?auto_57163 ?auto_57164 ) ) ( not ( = ?auto_57163 ?auto_57165 ) ) ( not ( = ?auto_57163 ?auto_57166 ) ) ( not ( = ?auto_57164 ?auto_57165 ) ) ( not ( = ?auto_57164 ?auto_57166 ) ) ( not ( = ?auto_57165 ?auto_57166 ) ) ( ON ?auto_57166 ?auto_57167 ) ( CLEAR ?auto_57166 ) ( not ( = ?auto_57162 ?auto_57167 ) ) ( not ( = ?auto_57163 ?auto_57167 ) ) ( not ( = ?auto_57164 ?auto_57167 ) ) ( not ( = ?auto_57165 ?auto_57167 ) ) ( not ( = ?auto_57166 ?auto_57167 ) ) ( HOLDING ?auto_57165 ) ( CLEAR ?auto_57164 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57162 ?auto_57163 ?auto_57164 ?auto_57165 )
      ( MAKE-5PILE ?auto_57162 ?auto_57163 ?auto_57164 ?auto_57165 ?auto_57166 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57168 - BLOCK
      ?auto_57169 - BLOCK
      ?auto_57170 - BLOCK
      ?auto_57171 - BLOCK
      ?auto_57172 - BLOCK
    )
    :vars
    (
      ?auto_57173 - BLOCK
      ?auto_57174 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57168 ) ( ON ?auto_57169 ?auto_57168 ) ( ON ?auto_57170 ?auto_57169 ) ( not ( = ?auto_57168 ?auto_57169 ) ) ( not ( = ?auto_57168 ?auto_57170 ) ) ( not ( = ?auto_57168 ?auto_57171 ) ) ( not ( = ?auto_57168 ?auto_57172 ) ) ( not ( = ?auto_57169 ?auto_57170 ) ) ( not ( = ?auto_57169 ?auto_57171 ) ) ( not ( = ?auto_57169 ?auto_57172 ) ) ( not ( = ?auto_57170 ?auto_57171 ) ) ( not ( = ?auto_57170 ?auto_57172 ) ) ( not ( = ?auto_57171 ?auto_57172 ) ) ( ON ?auto_57172 ?auto_57173 ) ( not ( = ?auto_57168 ?auto_57173 ) ) ( not ( = ?auto_57169 ?auto_57173 ) ) ( not ( = ?auto_57170 ?auto_57173 ) ) ( not ( = ?auto_57171 ?auto_57173 ) ) ( not ( = ?auto_57172 ?auto_57173 ) ) ( CLEAR ?auto_57170 ) ( ON ?auto_57171 ?auto_57172 ) ( CLEAR ?auto_57171 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_57174 ) ( ON ?auto_57173 ?auto_57174 ) ( not ( = ?auto_57174 ?auto_57173 ) ) ( not ( = ?auto_57174 ?auto_57172 ) ) ( not ( = ?auto_57174 ?auto_57171 ) ) ( not ( = ?auto_57168 ?auto_57174 ) ) ( not ( = ?auto_57169 ?auto_57174 ) ) ( not ( = ?auto_57170 ?auto_57174 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57174 ?auto_57173 ?auto_57172 )
      ( MAKE-5PILE ?auto_57168 ?auto_57169 ?auto_57170 ?auto_57171 ?auto_57172 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57175 - BLOCK
      ?auto_57176 - BLOCK
      ?auto_57177 - BLOCK
      ?auto_57178 - BLOCK
      ?auto_57179 - BLOCK
    )
    :vars
    (
      ?auto_57180 - BLOCK
      ?auto_57181 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57175 ) ( ON ?auto_57176 ?auto_57175 ) ( not ( = ?auto_57175 ?auto_57176 ) ) ( not ( = ?auto_57175 ?auto_57177 ) ) ( not ( = ?auto_57175 ?auto_57178 ) ) ( not ( = ?auto_57175 ?auto_57179 ) ) ( not ( = ?auto_57176 ?auto_57177 ) ) ( not ( = ?auto_57176 ?auto_57178 ) ) ( not ( = ?auto_57176 ?auto_57179 ) ) ( not ( = ?auto_57177 ?auto_57178 ) ) ( not ( = ?auto_57177 ?auto_57179 ) ) ( not ( = ?auto_57178 ?auto_57179 ) ) ( ON ?auto_57179 ?auto_57180 ) ( not ( = ?auto_57175 ?auto_57180 ) ) ( not ( = ?auto_57176 ?auto_57180 ) ) ( not ( = ?auto_57177 ?auto_57180 ) ) ( not ( = ?auto_57178 ?auto_57180 ) ) ( not ( = ?auto_57179 ?auto_57180 ) ) ( ON ?auto_57178 ?auto_57179 ) ( CLEAR ?auto_57178 ) ( ON-TABLE ?auto_57181 ) ( ON ?auto_57180 ?auto_57181 ) ( not ( = ?auto_57181 ?auto_57180 ) ) ( not ( = ?auto_57181 ?auto_57179 ) ) ( not ( = ?auto_57181 ?auto_57178 ) ) ( not ( = ?auto_57175 ?auto_57181 ) ) ( not ( = ?auto_57176 ?auto_57181 ) ) ( not ( = ?auto_57177 ?auto_57181 ) ) ( HOLDING ?auto_57177 ) ( CLEAR ?auto_57176 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57175 ?auto_57176 ?auto_57177 )
      ( MAKE-5PILE ?auto_57175 ?auto_57176 ?auto_57177 ?auto_57178 ?auto_57179 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57182 - BLOCK
      ?auto_57183 - BLOCK
      ?auto_57184 - BLOCK
      ?auto_57185 - BLOCK
      ?auto_57186 - BLOCK
    )
    :vars
    (
      ?auto_57188 - BLOCK
      ?auto_57187 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57182 ) ( ON ?auto_57183 ?auto_57182 ) ( not ( = ?auto_57182 ?auto_57183 ) ) ( not ( = ?auto_57182 ?auto_57184 ) ) ( not ( = ?auto_57182 ?auto_57185 ) ) ( not ( = ?auto_57182 ?auto_57186 ) ) ( not ( = ?auto_57183 ?auto_57184 ) ) ( not ( = ?auto_57183 ?auto_57185 ) ) ( not ( = ?auto_57183 ?auto_57186 ) ) ( not ( = ?auto_57184 ?auto_57185 ) ) ( not ( = ?auto_57184 ?auto_57186 ) ) ( not ( = ?auto_57185 ?auto_57186 ) ) ( ON ?auto_57186 ?auto_57188 ) ( not ( = ?auto_57182 ?auto_57188 ) ) ( not ( = ?auto_57183 ?auto_57188 ) ) ( not ( = ?auto_57184 ?auto_57188 ) ) ( not ( = ?auto_57185 ?auto_57188 ) ) ( not ( = ?auto_57186 ?auto_57188 ) ) ( ON ?auto_57185 ?auto_57186 ) ( ON-TABLE ?auto_57187 ) ( ON ?auto_57188 ?auto_57187 ) ( not ( = ?auto_57187 ?auto_57188 ) ) ( not ( = ?auto_57187 ?auto_57186 ) ) ( not ( = ?auto_57187 ?auto_57185 ) ) ( not ( = ?auto_57182 ?auto_57187 ) ) ( not ( = ?auto_57183 ?auto_57187 ) ) ( not ( = ?auto_57184 ?auto_57187 ) ) ( CLEAR ?auto_57183 ) ( ON ?auto_57184 ?auto_57185 ) ( CLEAR ?auto_57184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57187 ?auto_57188 ?auto_57186 ?auto_57185 )
      ( MAKE-5PILE ?auto_57182 ?auto_57183 ?auto_57184 ?auto_57185 ?auto_57186 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57189 - BLOCK
      ?auto_57190 - BLOCK
      ?auto_57191 - BLOCK
      ?auto_57192 - BLOCK
      ?auto_57193 - BLOCK
    )
    :vars
    (
      ?auto_57194 - BLOCK
      ?auto_57195 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57189 ) ( not ( = ?auto_57189 ?auto_57190 ) ) ( not ( = ?auto_57189 ?auto_57191 ) ) ( not ( = ?auto_57189 ?auto_57192 ) ) ( not ( = ?auto_57189 ?auto_57193 ) ) ( not ( = ?auto_57190 ?auto_57191 ) ) ( not ( = ?auto_57190 ?auto_57192 ) ) ( not ( = ?auto_57190 ?auto_57193 ) ) ( not ( = ?auto_57191 ?auto_57192 ) ) ( not ( = ?auto_57191 ?auto_57193 ) ) ( not ( = ?auto_57192 ?auto_57193 ) ) ( ON ?auto_57193 ?auto_57194 ) ( not ( = ?auto_57189 ?auto_57194 ) ) ( not ( = ?auto_57190 ?auto_57194 ) ) ( not ( = ?auto_57191 ?auto_57194 ) ) ( not ( = ?auto_57192 ?auto_57194 ) ) ( not ( = ?auto_57193 ?auto_57194 ) ) ( ON ?auto_57192 ?auto_57193 ) ( ON-TABLE ?auto_57195 ) ( ON ?auto_57194 ?auto_57195 ) ( not ( = ?auto_57195 ?auto_57194 ) ) ( not ( = ?auto_57195 ?auto_57193 ) ) ( not ( = ?auto_57195 ?auto_57192 ) ) ( not ( = ?auto_57189 ?auto_57195 ) ) ( not ( = ?auto_57190 ?auto_57195 ) ) ( not ( = ?auto_57191 ?auto_57195 ) ) ( ON ?auto_57191 ?auto_57192 ) ( CLEAR ?auto_57191 ) ( HOLDING ?auto_57190 ) ( CLEAR ?auto_57189 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57189 ?auto_57190 )
      ( MAKE-5PILE ?auto_57189 ?auto_57190 ?auto_57191 ?auto_57192 ?auto_57193 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57196 - BLOCK
      ?auto_57197 - BLOCK
      ?auto_57198 - BLOCK
      ?auto_57199 - BLOCK
      ?auto_57200 - BLOCK
    )
    :vars
    (
      ?auto_57202 - BLOCK
      ?auto_57201 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57196 ) ( not ( = ?auto_57196 ?auto_57197 ) ) ( not ( = ?auto_57196 ?auto_57198 ) ) ( not ( = ?auto_57196 ?auto_57199 ) ) ( not ( = ?auto_57196 ?auto_57200 ) ) ( not ( = ?auto_57197 ?auto_57198 ) ) ( not ( = ?auto_57197 ?auto_57199 ) ) ( not ( = ?auto_57197 ?auto_57200 ) ) ( not ( = ?auto_57198 ?auto_57199 ) ) ( not ( = ?auto_57198 ?auto_57200 ) ) ( not ( = ?auto_57199 ?auto_57200 ) ) ( ON ?auto_57200 ?auto_57202 ) ( not ( = ?auto_57196 ?auto_57202 ) ) ( not ( = ?auto_57197 ?auto_57202 ) ) ( not ( = ?auto_57198 ?auto_57202 ) ) ( not ( = ?auto_57199 ?auto_57202 ) ) ( not ( = ?auto_57200 ?auto_57202 ) ) ( ON ?auto_57199 ?auto_57200 ) ( ON-TABLE ?auto_57201 ) ( ON ?auto_57202 ?auto_57201 ) ( not ( = ?auto_57201 ?auto_57202 ) ) ( not ( = ?auto_57201 ?auto_57200 ) ) ( not ( = ?auto_57201 ?auto_57199 ) ) ( not ( = ?auto_57196 ?auto_57201 ) ) ( not ( = ?auto_57197 ?auto_57201 ) ) ( not ( = ?auto_57198 ?auto_57201 ) ) ( ON ?auto_57198 ?auto_57199 ) ( CLEAR ?auto_57196 ) ( ON ?auto_57197 ?auto_57198 ) ( CLEAR ?auto_57197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_57201 ?auto_57202 ?auto_57200 ?auto_57199 ?auto_57198 )
      ( MAKE-5PILE ?auto_57196 ?auto_57197 ?auto_57198 ?auto_57199 ?auto_57200 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57203 - BLOCK
      ?auto_57204 - BLOCK
      ?auto_57205 - BLOCK
      ?auto_57206 - BLOCK
      ?auto_57207 - BLOCK
    )
    :vars
    (
      ?auto_57208 - BLOCK
      ?auto_57209 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57203 ?auto_57204 ) ) ( not ( = ?auto_57203 ?auto_57205 ) ) ( not ( = ?auto_57203 ?auto_57206 ) ) ( not ( = ?auto_57203 ?auto_57207 ) ) ( not ( = ?auto_57204 ?auto_57205 ) ) ( not ( = ?auto_57204 ?auto_57206 ) ) ( not ( = ?auto_57204 ?auto_57207 ) ) ( not ( = ?auto_57205 ?auto_57206 ) ) ( not ( = ?auto_57205 ?auto_57207 ) ) ( not ( = ?auto_57206 ?auto_57207 ) ) ( ON ?auto_57207 ?auto_57208 ) ( not ( = ?auto_57203 ?auto_57208 ) ) ( not ( = ?auto_57204 ?auto_57208 ) ) ( not ( = ?auto_57205 ?auto_57208 ) ) ( not ( = ?auto_57206 ?auto_57208 ) ) ( not ( = ?auto_57207 ?auto_57208 ) ) ( ON ?auto_57206 ?auto_57207 ) ( ON-TABLE ?auto_57209 ) ( ON ?auto_57208 ?auto_57209 ) ( not ( = ?auto_57209 ?auto_57208 ) ) ( not ( = ?auto_57209 ?auto_57207 ) ) ( not ( = ?auto_57209 ?auto_57206 ) ) ( not ( = ?auto_57203 ?auto_57209 ) ) ( not ( = ?auto_57204 ?auto_57209 ) ) ( not ( = ?auto_57205 ?auto_57209 ) ) ( ON ?auto_57205 ?auto_57206 ) ( ON ?auto_57204 ?auto_57205 ) ( CLEAR ?auto_57204 ) ( HOLDING ?auto_57203 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_57203 )
      ( MAKE-5PILE ?auto_57203 ?auto_57204 ?auto_57205 ?auto_57206 ?auto_57207 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57210 - BLOCK
      ?auto_57211 - BLOCK
      ?auto_57212 - BLOCK
      ?auto_57213 - BLOCK
      ?auto_57214 - BLOCK
    )
    :vars
    (
      ?auto_57215 - BLOCK
      ?auto_57216 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57210 ?auto_57211 ) ) ( not ( = ?auto_57210 ?auto_57212 ) ) ( not ( = ?auto_57210 ?auto_57213 ) ) ( not ( = ?auto_57210 ?auto_57214 ) ) ( not ( = ?auto_57211 ?auto_57212 ) ) ( not ( = ?auto_57211 ?auto_57213 ) ) ( not ( = ?auto_57211 ?auto_57214 ) ) ( not ( = ?auto_57212 ?auto_57213 ) ) ( not ( = ?auto_57212 ?auto_57214 ) ) ( not ( = ?auto_57213 ?auto_57214 ) ) ( ON ?auto_57214 ?auto_57215 ) ( not ( = ?auto_57210 ?auto_57215 ) ) ( not ( = ?auto_57211 ?auto_57215 ) ) ( not ( = ?auto_57212 ?auto_57215 ) ) ( not ( = ?auto_57213 ?auto_57215 ) ) ( not ( = ?auto_57214 ?auto_57215 ) ) ( ON ?auto_57213 ?auto_57214 ) ( ON-TABLE ?auto_57216 ) ( ON ?auto_57215 ?auto_57216 ) ( not ( = ?auto_57216 ?auto_57215 ) ) ( not ( = ?auto_57216 ?auto_57214 ) ) ( not ( = ?auto_57216 ?auto_57213 ) ) ( not ( = ?auto_57210 ?auto_57216 ) ) ( not ( = ?auto_57211 ?auto_57216 ) ) ( not ( = ?auto_57212 ?auto_57216 ) ) ( ON ?auto_57212 ?auto_57213 ) ( ON ?auto_57211 ?auto_57212 ) ( ON ?auto_57210 ?auto_57211 ) ( CLEAR ?auto_57210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_57216 ?auto_57215 ?auto_57214 ?auto_57213 ?auto_57212 ?auto_57211 )
      ( MAKE-5PILE ?auto_57210 ?auto_57211 ?auto_57212 ?auto_57213 ?auto_57214 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57218 - BLOCK
    )
    :vars
    (
      ?auto_57219 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57219 ?auto_57218 ) ( CLEAR ?auto_57219 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_57218 ) ( not ( = ?auto_57218 ?auto_57219 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_57219 ?auto_57218 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57220 - BLOCK
    )
    :vars
    (
      ?auto_57221 - BLOCK
      ?auto_57222 - BLOCK
      ?auto_57223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57221 ?auto_57220 ) ( CLEAR ?auto_57221 ) ( ON-TABLE ?auto_57220 ) ( not ( = ?auto_57220 ?auto_57221 ) ) ( HOLDING ?auto_57222 ) ( CLEAR ?auto_57223 ) ( not ( = ?auto_57220 ?auto_57222 ) ) ( not ( = ?auto_57220 ?auto_57223 ) ) ( not ( = ?auto_57221 ?auto_57222 ) ) ( not ( = ?auto_57221 ?auto_57223 ) ) ( not ( = ?auto_57222 ?auto_57223 ) ) )
    :subtasks
    ( ( !STACK ?auto_57222 ?auto_57223 )
      ( MAKE-1PILE ?auto_57220 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57224 - BLOCK
    )
    :vars
    (
      ?auto_57227 - BLOCK
      ?auto_57226 - BLOCK
      ?auto_57225 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57227 ?auto_57224 ) ( ON-TABLE ?auto_57224 ) ( not ( = ?auto_57224 ?auto_57227 ) ) ( CLEAR ?auto_57226 ) ( not ( = ?auto_57224 ?auto_57225 ) ) ( not ( = ?auto_57224 ?auto_57226 ) ) ( not ( = ?auto_57227 ?auto_57225 ) ) ( not ( = ?auto_57227 ?auto_57226 ) ) ( not ( = ?auto_57225 ?auto_57226 ) ) ( ON ?auto_57225 ?auto_57227 ) ( CLEAR ?auto_57225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57224 ?auto_57227 )
      ( MAKE-1PILE ?auto_57224 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57228 - BLOCK
    )
    :vars
    (
      ?auto_57229 - BLOCK
      ?auto_57230 - BLOCK
      ?auto_57231 - BLOCK
      ?auto_57233 - BLOCK
      ?auto_57234 - BLOCK
      ?auto_57232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57229 ?auto_57228 ) ( ON-TABLE ?auto_57228 ) ( not ( = ?auto_57228 ?auto_57229 ) ) ( not ( = ?auto_57228 ?auto_57230 ) ) ( not ( = ?auto_57228 ?auto_57231 ) ) ( not ( = ?auto_57229 ?auto_57230 ) ) ( not ( = ?auto_57229 ?auto_57231 ) ) ( not ( = ?auto_57230 ?auto_57231 ) ) ( ON ?auto_57230 ?auto_57229 ) ( CLEAR ?auto_57230 ) ( HOLDING ?auto_57231 ) ( CLEAR ?auto_57233 ) ( ON-TABLE ?auto_57234 ) ( ON ?auto_57232 ?auto_57234 ) ( ON ?auto_57233 ?auto_57232 ) ( not ( = ?auto_57234 ?auto_57232 ) ) ( not ( = ?auto_57234 ?auto_57233 ) ) ( not ( = ?auto_57234 ?auto_57231 ) ) ( not ( = ?auto_57232 ?auto_57233 ) ) ( not ( = ?auto_57232 ?auto_57231 ) ) ( not ( = ?auto_57233 ?auto_57231 ) ) ( not ( = ?auto_57228 ?auto_57233 ) ) ( not ( = ?auto_57228 ?auto_57234 ) ) ( not ( = ?auto_57228 ?auto_57232 ) ) ( not ( = ?auto_57229 ?auto_57233 ) ) ( not ( = ?auto_57229 ?auto_57234 ) ) ( not ( = ?auto_57229 ?auto_57232 ) ) ( not ( = ?auto_57230 ?auto_57233 ) ) ( not ( = ?auto_57230 ?auto_57234 ) ) ( not ( = ?auto_57230 ?auto_57232 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57234 ?auto_57232 ?auto_57233 ?auto_57231 )
      ( MAKE-1PILE ?auto_57228 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57235 - BLOCK
    )
    :vars
    (
      ?auto_57237 - BLOCK
      ?auto_57238 - BLOCK
      ?auto_57239 - BLOCK
      ?auto_57236 - BLOCK
      ?auto_57240 - BLOCK
      ?auto_57241 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57237 ?auto_57235 ) ( ON-TABLE ?auto_57235 ) ( not ( = ?auto_57235 ?auto_57237 ) ) ( not ( = ?auto_57235 ?auto_57238 ) ) ( not ( = ?auto_57235 ?auto_57239 ) ) ( not ( = ?auto_57237 ?auto_57238 ) ) ( not ( = ?auto_57237 ?auto_57239 ) ) ( not ( = ?auto_57238 ?auto_57239 ) ) ( ON ?auto_57238 ?auto_57237 ) ( CLEAR ?auto_57236 ) ( ON-TABLE ?auto_57240 ) ( ON ?auto_57241 ?auto_57240 ) ( ON ?auto_57236 ?auto_57241 ) ( not ( = ?auto_57240 ?auto_57241 ) ) ( not ( = ?auto_57240 ?auto_57236 ) ) ( not ( = ?auto_57240 ?auto_57239 ) ) ( not ( = ?auto_57241 ?auto_57236 ) ) ( not ( = ?auto_57241 ?auto_57239 ) ) ( not ( = ?auto_57236 ?auto_57239 ) ) ( not ( = ?auto_57235 ?auto_57236 ) ) ( not ( = ?auto_57235 ?auto_57240 ) ) ( not ( = ?auto_57235 ?auto_57241 ) ) ( not ( = ?auto_57237 ?auto_57236 ) ) ( not ( = ?auto_57237 ?auto_57240 ) ) ( not ( = ?auto_57237 ?auto_57241 ) ) ( not ( = ?auto_57238 ?auto_57236 ) ) ( not ( = ?auto_57238 ?auto_57240 ) ) ( not ( = ?auto_57238 ?auto_57241 ) ) ( ON ?auto_57239 ?auto_57238 ) ( CLEAR ?auto_57239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57235 ?auto_57237 ?auto_57238 )
      ( MAKE-1PILE ?auto_57235 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57242 - BLOCK
    )
    :vars
    (
      ?auto_57246 - BLOCK
      ?auto_57245 - BLOCK
      ?auto_57244 - BLOCK
      ?auto_57248 - BLOCK
      ?auto_57247 - BLOCK
      ?auto_57243 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57246 ?auto_57242 ) ( ON-TABLE ?auto_57242 ) ( not ( = ?auto_57242 ?auto_57246 ) ) ( not ( = ?auto_57242 ?auto_57245 ) ) ( not ( = ?auto_57242 ?auto_57244 ) ) ( not ( = ?auto_57246 ?auto_57245 ) ) ( not ( = ?auto_57246 ?auto_57244 ) ) ( not ( = ?auto_57245 ?auto_57244 ) ) ( ON ?auto_57245 ?auto_57246 ) ( ON-TABLE ?auto_57248 ) ( ON ?auto_57247 ?auto_57248 ) ( not ( = ?auto_57248 ?auto_57247 ) ) ( not ( = ?auto_57248 ?auto_57243 ) ) ( not ( = ?auto_57248 ?auto_57244 ) ) ( not ( = ?auto_57247 ?auto_57243 ) ) ( not ( = ?auto_57247 ?auto_57244 ) ) ( not ( = ?auto_57243 ?auto_57244 ) ) ( not ( = ?auto_57242 ?auto_57243 ) ) ( not ( = ?auto_57242 ?auto_57248 ) ) ( not ( = ?auto_57242 ?auto_57247 ) ) ( not ( = ?auto_57246 ?auto_57243 ) ) ( not ( = ?auto_57246 ?auto_57248 ) ) ( not ( = ?auto_57246 ?auto_57247 ) ) ( not ( = ?auto_57245 ?auto_57243 ) ) ( not ( = ?auto_57245 ?auto_57248 ) ) ( not ( = ?auto_57245 ?auto_57247 ) ) ( ON ?auto_57244 ?auto_57245 ) ( CLEAR ?auto_57244 ) ( HOLDING ?auto_57243 ) ( CLEAR ?auto_57247 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57248 ?auto_57247 ?auto_57243 )
      ( MAKE-1PILE ?auto_57242 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57249 - BLOCK
    )
    :vars
    (
      ?auto_57252 - BLOCK
      ?auto_57255 - BLOCK
      ?auto_57253 - BLOCK
      ?auto_57254 - BLOCK
      ?auto_57250 - BLOCK
      ?auto_57251 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57252 ?auto_57249 ) ( ON-TABLE ?auto_57249 ) ( not ( = ?auto_57249 ?auto_57252 ) ) ( not ( = ?auto_57249 ?auto_57255 ) ) ( not ( = ?auto_57249 ?auto_57253 ) ) ( not ( = ?auto_57252 ?auto_57255 ) ) ( not ( = ?auto_57252 ?auto_57253 ) ) ( not ( = ?auto_57255 ?auto_57253 ) ) ( ON ?auto_57255 ?auto_57252 ) ( ON-TABLE ?auto_57254 ) ( ON ?auto_57250 ?auto_57254 ) ( not ( = ?auto_57254 ?auto_57250 ) ) ( not ( = ?auto_57254 ?auto_57251 ) ) ( not ( = ?auto_57254 ?auto_57253 ) ) ( not ( = ?auto_57250 ?auto_57251 ) ) ( not ( = ?auto_57250 ?auto_57253 ) ) ( not ( = ?auto_57251 ?auto_57253 ) ) ( not ( = ?auto_57249 ?auto_57251 ) ) ( not ( = ?auto_57249 ?auto_57254 ) ) ( not ( = ?auto_57249 ?auto_57250 ) ) ( not ( = ?auto_57252 ?auto_57251 ) ) ( not ( = ?auto_57252 ?auto_57254 ) ) ( not ( = ?auto_57252 ?auto_57250 ) ) ( not ( = ?auto_57255 ?auto_57251 ) ) ( not ( = ?auto_57255 ?auto_57254 ) ) ( not ( = ?auto_57255 ?auto_57250 ) ) ( ON ?auto_57253 ?auto_57255 ) ( CLEAR ?auto_57250 ) ( ON ?auto_57251 ?auto_57253 ) ( CLEAR ?auto_57251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57249 ?auto_57252 ?auto_57255 ?auto_57253 )
      ( MAKE-1PILE ?auto_57249 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57256 - BLOCK
    )
    :vars
    (
      ?auto_57261 - BLOCK
      ?auto_57258 - BLOCK
      ?auto_57259 - BLOCK
      ?auto_57257 - BLOCK
      ?auto_57260 - BLOCK
      ?auto_57262 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57261 ?auto_57256 ) ( ON-TABLE ?auto_57256 ) ( not ( = ?auto_57256 ?auto_57261 ) ) ( not ( = ?auto_57256 ?auto_57258 ) ) ( not ( = ?auto_57256 ?auto_57259 ) ) ( not ( = ?auto_57261 ?auto_57258 ) ) ( not ( = ?auto_57261 ?auto_57259 ) ) ( not ( = ?auto_57258 ?auto_57259 ) ) ( ON ?auto_57258 ?auto_57261 ) ( ON-TABLE ?auto_57257 ) ( not ( = ?auto_57257 ?auto_57260 ) ) ( not ( = ?auto_57257 ?auto_57262 ) ) ( not ( = ?auto_57257 ?auto_57259 ) ) ( not ( = ?auto_57260 ?auto_57262 ) ) ( not ( = ?auto_57260 ?auto_57259 ) ) ( not ( = ?auto_57262 ?auto_57259 ) ) ( not ( = ?auto_57256 ?auto_57262 ) ) ( not ( = ?auto_57256 ?auto_57257 ) ) ( not ( = ?auto_57256 ?auto_57260 ) ) ( not ( = ?auto_57261 ?auto_57262 ) ) ( not ( = ?auto_57261 ?auto_57257 ) ) ( not ( = ?auto_57261 ?auto_57260 ) ) ( not ( = ?auto_57258 ?auto_57262 ) ) ( not ( = ?auto_57258 ?auto_57257 ) ) ( not ( = ?auto_57258 ?auto_57260 ) ) ( ON ?auto_57259 ?auto_57258 ) ( ON ?auto_57262 ?auto_57259 ) ( CLEAR ?auto_57262 ) ( HOLDING ?auto_57260 ) ( CLEAR ?auto_57257 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57257 ?auto_57260 )
      ( MAKE-1PILE ?auto_57256 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58109 - BLOCK
    )
    :vars
    (
      ?auto_58110 - BLOCK
      ?auto_58113 - BLOCK
      ?auto_58114 - BLOCK
      ?auto_58112 - BLOCK
      ?auto_58111 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58110 ?auto_58109 ) ( ON-TABLE ?auto_58109 ) ( not ( = ?auto_58109 ?auto_58110 ) ) ( not ( = ?auto_58109 ?auto_58113 ) ) ( not ( = ?auto_58109 ?auto_58114 ) ) ( not ( = ?auto_58110 ?auto_58113 ) ) ( not ( = ?auto_58110 ?auto_58114 ) ) ( not ( = ?auto_58113 ?auto_58114 ) ) ( ON ?auto_58113 ?auto_58110 ) ( not ( = ?auto_58112 ?auto_58111 ) ) ( not ( = ?auto_58112 ?auto_58114 ) ) ( not ( = ?auto_58111 ?auto_58114 ) ) ( not ( = ?auto_58109 ?auto_58111 ) ) ( not ( = ?auto_58109 ?auto_58112 ) ) ( not ( = ?auto_58110 ?auto_58111 ) ) ( not ( = ?auto_58110 ?auto_58112 ) ) ( not ( = ?auto_58113 ?auto_58111 ) ) ( not ( = ?auto_58113 ?auto_58112 ) ) ( ON ?auto_58114 ?auto_58113 ) ( ON ?auto_58111 ?auto_58114 ) ( ON ?auto_58112 ?auto_58111 ) ( CLEAR ?auto_58112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58109 ?auto_58110 ?auto_58113 ?auto_58114 ?auto_58111 )
      ( MAKE-1PILE ?auto_58109 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57270 - BLOCK
    )
    :vars
    (
      ?auto_57276 - BLOCK
      ?auto_57273 - BLOCK
      ?auto_57275 - BLOCK
      ?auto_57274 - BLOCK
      ?auto_57271 - BLOCK
      ?auto_57272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57276 ?auto_57270 ) ( ON-TABLE ?auto_57270 ) ( not ( = ?auto_57270 ?auto_57276 ) ) ( not ( = ?auto_57270 ?auto_57273 ) ) ( not ( = ?auto_57270 ?auto_57275 ) ) ( not ( = ?auto_57276 ?auto_57273 ) ) ( not ( = ?auto_57276 ?auto_57275 ) ) ( not ( = ?auto_57273 ?auto_57275 ) ) ( ON ?auto_57273 ?auto_57276 ) ( not ( = ?auto_57274 ?auto_57271 ) ) ( not ( = ?auto_57274 ?auto_57272 ) ) ( not ( = ?auto_57274 ?auto_57275 ) ) ( not ( = ?auto_57271 ?auto_57272 ) ) ( not ( = ?auto_57271 ?auto_57275 ) ) ( not ( = ?auto_57272 ?auto_57275 ) ) ( not ( = ?auto_57270 ?auto_57272 ) ) ( not ( = ?auto_57270 ?auto_57274 ) ) ( not ( = ?auto_57270 ?auto_57271 ) ) ( not ( = ?auto_57276 ?auto_57272 ) ) ( not ( = ?auto_57276 ?auto_57274 ) ) ( not ( = ?auto_57276 ?auto_57271 ) ) ( not ( = ?auto_57273 ?auto_57272 ) ) ( not ( = ?auto_57273 ?auto_57274 ) ) ( not ( = ?auto_57273 ?auto_57271 ) ) ( ON ?auto_57275 ?auto_57273 ) ( ON ?auto_57272 ?auto_57275 ) ( ON ?auto_57271 ?auto_57272 ) ( CLEAR ?auto_57271 ) ( HOLDING ?auto_57274 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_57274 )
      ( MAKE-1PILE ?auto_57270 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57277 - BLOCK
    )
    :vars
    (
      ?auto_57283 - BLOCK
      ?auto_57279 - BLOCK
      ?auto_57278 - BLOCK
      ?auto_57280 - BLOCK
      ?auto_57281 - BLOCK
      ?auto_57282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57283 ?auto_57277 ) ( ON-TABLE ?auto_57277 ) ( not ( = ?auto_57277 ?auto_57283 ) ) ( not ( = ?auto_57277 ?auto_57279 ) ) ( not ( = ?auto_57277 ?auto_57278 ) ) ( not ( = ?auto_57283 ?auto_57279 ) ) ( not ( = ?auto_57283 ?auto_57278 ) ) ( not ( = ?auto_57279 ?auto_57278 ) ) ( ON ?auto_57279 ?auto_57283 ) ( not ( = ?auto_57280 ?auto_57281 ) ) ( not ( = ?auto_57280 ?auto_57282 ) ) ( not ( = ?auto_57280 ?auto_57278 ) ) ( not ( = ?auto_57281 ?auto_57282 ) ) ( not ( = ?auto_57281 ?auto_57278 ) ) ( not ( = ?auto_57282 ?auto_57278 ) ) ( not ( = ?auto_57277 ?auto_57282 ) ) ( not ( = ?auto_57277 ?auto_57280 ) ) ( not ( = ?auto_57277 ?auto_57281 ) ) ( not ( = ?auto_57283 ?auto_57282 ) ) ( not ( = ?auto_57283 ?auto_57280 ) ) ( not ( = ?auto_57283 ?auto_57281 ) ) ( not ( = ?auto_57279 ?auto_57282 ) ) ( not ( = ?auto_57279 ?auto_57280 ) ) ( not ( = ?auto_57279 ?auto_57281 ) ) ( ON ?auto_57278 ?auto_57279 ) ( ON ?auto_57282 ?auto_57278 ) ( ON ?auto_57281 ?auto_57282 ) ( ON ?auto_57280 ?auto_57281 ) ( CLEAR ?auto_57280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_57277 ?auto_57283 ?auto_57279 ?auto_57278 ?auto_57282 ?auto_57281 )
      ( MAKE-1PILE ?auto_57277 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57290 - BLOCK
      ?auto_57291 - BLOCK
      ?auto_57292 - BLOCK
      ?auto_57293 - BLOCK
      ?auto_57294 - BLOCK
      ?auto_57295 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_57295 ) ( CLEAR ?auto_57294 ) ( ON-TABLE ?auto_57290 ) ( ON ?auto_57291 ?auto_57290 ) ( ON ?auto_57292 ?auto_57291 ) ( ON ?auto_57293 ?auto_57292 ) ( ON ?auto_57294 ?auto_57293 ) ( not ( = ?auto_57290 ?auto_57291 ) ) ( not ( = ?auto_57290 ?auto_57292 ) ) ( not ( = ?auto_57290 ?auto_57293 ) ) ( not ( = ?auto_57290 ?auto_57294 ) ) ( not ( = ?auto_57290 ?auto_57295 ) ) ( not ( = ?auto_57291 ?auto_57292 ) ) ( not ( = ?auto_57291 ?auto_57293 ) ) ( not ( = ?auto_57291 ?auto_57294 ) ) ( not ( = ?auto_57291 ?auto_57295 ) ) ( not ( = ?auto_57292 ?auto_57293 ) ) ( not ( = ?auto_57292 ?auto_57294 ) ) ( not ( = ?auto_57292 ?auto_57295 ) ) ( not ( = ?auto_57293 ?auto_57294 ) ) ( not ( = ?auto_57293 ?auto_57295 ) ) ( not ( = ?auto_57294 ?auto_57295 ) ) )
    :subtasks
    ( ( !STACK ?auto_57295 ?auto_57294 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57296 - BLOCK
      ?auto_57297 - BLOCK
      ?auto_57298 - BLOCK
      ?auto_57299 - BLOCK
      ?auto_57300 - BLOCK
      ?auto_57301 - BLOCK
    )
    :vars
    (
      ?auto_57302 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_57300 ) ( ON-TABLE ?auto_57296 ) ( ON ?auto_57297 ?auto_57296 ) ( ON ?auto_57298 ?auto_57297 ) ( ON ?auto_57299 ?auto_57298 ) ( ON ?auto_57300 ?auto_57299 ) ( not ( = ?auto_57296 ?auto_57297 ) ) ( not ( = ?auto_57296 ?auto_57298 ) ) ( not ( = ?auto_57296 ?auto_57299 ) ) ( not ( = ?auto_57296 ?auto_57300 ) ) ( not ( = ?auto_57296 ?auto_57301 ) ) ( not ( = ?auto_57297 ?auto_57298 ) ) ( not ( = ?auto_57297 ?auto_57299 ) ) ( not ( = ?auto_57297 ?auto_57300 ) ) ( not ( = ?auto_57297 ?auto_57301 ) ) ( not ( = ?auto_57298 ?auto_57299 ) ) ( not ( = ?auto_57298 ?auto_57300 ) ) ( not ( = ?auto_57298 ?auto_57301 ) ) ( not ( = ?auto_57299 ?auto_57300 ) ) ( not ( = ?auto_57299 ?auto_57301 ) ) ( not ( = ?auto_57300 ?auto_57301 ) ) ( ON ?auto_57301 ?auto_57302 ) ( CLEAR ?auto_57301 ) ( HAND-EMPTY ) ( not ( = ?auto_57296 ?auto_57302 ) ) ( not ( = ?auto_57297 ?auto_57302 ) ) ( not ( = ?auto_57298 ?auto_57302 ) ) ( not ( = ?auto_57299 ?auto_57302 ) ) ( not ( = ?auto_57300 ?auto_57302 ) ) ( not ( = ?auto_57301 ?auto_57302 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_57301 ?auto_57302 )
      ( MAKE-6PILE ?auto_57296 ?auto_57297 ?auto_57298 ?auto_57299 ?auto_57300 ?auto_57301 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57303 - BLOCK
      ?auto_57304 - BLOCK
      ?auto_57305 - BLOCK
      ?auto_57306 - BLOCK
      ?auto_57307 - BLOCK
      ?auto_57308 - BLOCK
    )
    :vars
    (
      ?auto_57309 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57303 ) ( ON ?auto_57304 ?auto_57303 ) ( ON ?auto_57305 ?auto_57304 ) ( ON ?auto_57306 ?auto_57305 ) ( not ( = ?auto_57303 ?auto_57304 ) ) ( not ( = ?auto_57303 ?auto_57305 ) ) ( not ( = ?auto_57303 ?auto_57306 ) ) ( not ( = ?auto_57303 ?auto_57307 ) ) ( not ( = ?auto_57303 ?auto_57308 ) ) ( not ( = ?auto_57304 ?auto_57305 ) ) ( not ( = ?auto_57304 ?auto_57306 ) ) ( not ( = ?auto_57304 ?auto_57307 ) ) ( not ( = ?auto_57304 ?auto_57308 ) ) ( not ( = ?auto_57305 ?auto_57306 ) ) ( not ( = ?auto_57305 ?auto_57307 ) ) ( not ( = ?auto_57305 ?auto_57308 ) ) ( not ( = ?auto_57306 ?auto_57307 ) ) ( not ( = ?auto_57306 ?auto_57308 ) ) ( not ( = ?auto_57307 ?auto_57308 ) ) ( ON ?auto_57308 ?auto_57309 ) ( CLEAR ?auto_57308 ) ( not ( = ?auto_57303 ?auto_57309 ) ) ( not ( = ?auto_57304 ?auto_57309 ) ) ( not ( = ?auto_57305 ?auto_57309 ) ) ( not ( = ?auto_57306 ?auto_57309 ) ) ( not ( = ?auto_57307 ?auto_57309 ) ) ( not ( = ?auto_57308 ?auto_57309 ) ) ( HOLDING ?auto_57307 ) ( CLEAR ?auto_57306 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_57303 ?auto_57304 ?auto_57305 ?auto_57306 ?auto_57307 )
      ( MAKE-6PILE ?auto_57303 ?auto_57304 ?auto_57305 ?auto_57306 ?auto_57307 ?auto_57308 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57310 - BLOCK
      ?auto_57311 - BLOCK
      ?auto_57312 - BLOCK
      ?auto_57313 - BLOCK
      ?auto_57314 - BLOCK
      ?auto_57315 - BLOCK
    )
    :vars
    (
      ?auto_57316 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57310 ) ( ON ?auto_57311 ?auto_57310 ) ( ON ?auto_57312 ?auto_57311 ) ( ON ?auto_57313 ?auto_57312 ) ( not ( = ?auto_57310 ?auto_57311 ) ) ( not ( = ?auto_57310 ?auto_57312 ) ) ( not ( = ?auto_57310 ?auto_57313 ) ) ( not ( = ?auto_57310 ?auto_57314 ) ) ( not ( = ?auto_57310 ?auto_57315 ) ) ( not ( = ?auto_57311 ?auto_57312 ) ) ( not ( = ?auto_57311 ?auto_57313 ) ) ( not ( = ?auto_57311 ?auto_57314 ) ) ( not ( = ?auto_57311 ?auto_57315 ) ) ( not ( = ?auto_57312 ?auto_57313 ) ) ( not ( = ?auto_57312 ?auto_57314 ) ) ( not ( = ?auto_57312 ?auto_57315 ) ) ( not ( = ?auto_57313 ?auto_57314 ) ) ( not ( = ?auto_57313 ?auto_57315 ) ) ( not ( = ?auto_57314 ?auto_57315 ) ) ( ON ?auto_57315 ?auto_57316 ) ( not ( = ?auto_57310 ?auto_57316 ) ) ( not ( = ?auto_57311 ?auto_57316 ) ) ( not ( = ?auto_57312 ?auto_57316 ) ) ( not ( = ?auto_57313 ?auto_57316 ) ) ( not ( = ?auto_57314 ?auto_57316 ) ) ( not ( = ?auto_57315 ?auto_57316 ) ) ( CLEAR ?auto_57313 ) ( ON ?auto_57314 ?auto_57315 ) ( CLEAR ?auto_57314 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_57316 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57316 ?auto_57315 )
      ( MAKE-6PILE ?auto_57310 ?auto_57311 ?auto_57312 ?auto_57313 ?auto_57314 ?auto_57315 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57317 - BLOCK
      ?auto_57318 - BLOCK
      ?auto_57319 - BLOCK
      ?auto_57320 - BLOCK
      ?auto_57321 - BLOCK
      ?auto_57322 - BLOCK
    )
    :vars
    (
      ?auto_57323 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57317 ) ( ON ?auto_57318 ?auto_57317 ) ( ON ?auto_57319 ?auto_57318 ) ( not ( = ?auto_57317 ?auto_57318 ) ) ( not ( = ?auto_57317 ?auto_57319 ) ) ( not ( = ?auto_57317 ?auto_57320 ) ) ( not ( = ?auto_57317 ?auto_57321 ) ) ( not ( = ?auto_57317 ?auto_57322 ) ) ( not ( = ?auto_57318 ?auto_57319 ) ) ( not ( = ?auto_57318 ?auto_57320 ) ) ( not ( = ?auto_57318 ?auto_57321 ) ) ( not ( = ?auto_57318 ?auto_57322 ) ) ( not ( = ?auto_57319 ?auto_57320 ) ) ( not ( = ?auto_57319 ?auto_57321 ) ) ( not ( = ?auto_57319 ?auto_57322 ) ) ( not ( = ?auto_57320 ?auto_57321 ) ) ( not ( = ?auto_57320 ?auto_57322 ) ) ( not ( = ?auto_57321 ?auto_57322 ) ) ( ON ?auto_57322 ?auto_57323 ) ( not ( = ?auto_57317 ?auto_57323 ) ) ( not ( = ?auto_57318 ?auto_57323 ) ) ( not ( = ?auto_57319 ?auto_57323 ) ) ( not ( = ?auto_57320 ?auto_57323 ) ) ( not ( = ?auto_57321 ?auto_57323 ) ) ( not ( = ?auto_57322 ?auto_57323 ) ) ( ON ?auto_57321 ?auto_57322 ) ( CLEAR ?auto_57321 ) ( ON-TABLE ?auto_57323 ) ( HOLDING ?auto_57320 ) ( CLEAR ?auto_57319 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57317 ?auto_57318 ?auto_57319 ?auto_57320 )
      ( MAKE-6PILE ?auto_57317 ?auto_57318 ?auto_57319 ?auto_57320 ?auto_57321 ?auto_57322 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57324 - BLOCK
      ?auto_57325 - BLOCK
      ?auto_57326 - BLOCK
      ?auto_57327 - BLOCK
      ?auto_57328 - BLOCK
      ?auto_57329 - BLOCK
    )
    :vars
    (
      ?auto_57330 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57324 ) ( ON ?auto_57325 ?auto_57324 ) ( ON ?auto_57326 ?auto_57325 ) ( not ( = ?auto_57324 ?auto_57325 ) ) ( not ( = ?auto_57324 ?auto_57326 ) ) ( not ( = ?auto_57324 ?auto_57327 ) ) ( not ( = ?auto_57324 ?auto_57328 ) ) ( not ( = ?auto_57324 ?auto_57329 ) ) ( not ( = ?auto_57325 ?auto_57326 ) ) ( not ( = ?auto_57325 ?auto_57327 ) ) ( not ( = ?auto_57325 ?auto_57328 ) ) ( not ( = ?auto_57325 ?auto_57329 ) ) ( not ( = ?auto_57326 ?auto_57327 ) ) ( not ( = ?auto_57326 ?auto_57328 ) ) ( not ( = ?auto_57326 ?auto_57329 ) ) ( not ( = ?auto_57327 ?auto_57328 ) ) ( not ( = ?auto_57327 ?auto_57329 ) ) ( not ( = ?auto_57328 ?auto_57329 ) ) ( ON ?auto_57329 ?auto_57330 ) ( not ( = ?auto_57324 ?auto_57330 ) ) ( not ( = ?auto_57325 ?auto_57330 ) ) ( not ( = ?auto_57326 ?auto_57330 ) ) ( not ( = ?auto_57327 ?auto_57330 ) ) ( not ( = ?auto_57328 ?auto_57330 ) ) ( not ( = ?auto_57329 ?auto_57330 ) ) ( ON ?auto_57328 ?auto_57329 ) ( ON-TABLE ?auto_57330 ) ( CLEAR ?auto_57326 ) ( ON ?auto_57327 ?auto_57328 ) ( CLEAR ?auto_57327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57330 ?auto_57329 ?auto_57328 )
      ( MAKE-6PILE ?auto_57324 ?auto_57325 ?auto_57326 ?auto_57327 ?auto_57328 ?auto_57329 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57331 - BLOCK
      ?auto_57332 - BLOCK
      ?auto_57333 - BLOCK
      ?auto_57334 - BLOCK
      ?auto_57335 - BLOCK
      ?auto_57336 - BLOCK
    )
    :vars
    (
      ?auto_57337 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57331 ) ( ON ?auto_57332 ?auto_57331 ) ( not ( = ?auto_57331 ?auto_57332 ) ) ( not ( = ?auto_57331 ?auto_57333 ) ) ( not ( = ?auto_57331 ?auto_57334 ) ) ( not ( = ?auto_57331 ?auto_57335 ) ) ( not ( = ?auto_57331 ?auto_57336 ) ) ( not ( = ?auto_57332 ?auto_57333 ) ) ( not ( = ?auto_57332 ?auto_57334 ) ) ( not ( = ?auto_57332 ?auto_57335 ) ) ( not ( = ?auto_57332 ?auto_57336 ) ) ( not ( = ?auto_57333 ?auto_57334 ) ) ( not ( = ?auto_57333 ?auto_57335 ) ) ( not ( = ?auto_57333 ?auto_57336 ) ) ( not ( = ?auto_57334 ?auto_57335 ) ) ( not ( = ?auto_57334 ?auto_57336 ) ) ( not ( = ?auto_57335 ?auto_57336 ) ) ( ON ?auto_57336 ?auto_57337 ) ( not ( = ?auto_57331 ?auto_57337 ) ) ( not ( = ?auto_57332 ?auto_57337 ) ) ( not ( = ?auto_57333 ?auto_57337 ) ) ( not ( = ?auto_57334 ?auto_57337 ) ) ( not ( = ?auto_57335 ?auto_57337 ) ) ( not ( = ?auto_57336 ?auto_57337 ) ) ( ON ?auto_57335 ?auto_57336 ) ( ON-TABLE ?auto_57337 ) ( ON ?auto_57334 ?auto_57335 ) ( CLEAR ?auto_57334 ) ( HOLDING ?auto_57333 ) ( CLEAR ?auto_57332 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57331 ?auto_57332 ?auto_57333 )
      ( MAKE-6PILE ?auto_57331 ?auto_57332 ?auto_57333 ?auto_57334 ?auto_57335 ?auto_57336 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57338 - BLOCK
      ?auto_57339 - BLOCK
      ?auto_57340 - BLOCK
      ?auto_57341 - BLOCK
      ?auto_57342 - BLOCK
      ?auto_57343 - BLOCK
    )
    :vars
    (
      ?auto_57344 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57338 ) ( ON ?auto_57339 ?auto_57338 ) ( not ( = ?auto_57338 ?auto_57339 ) ) ( not ( = ?auto_57338 ?auto_57340 ) ) ( not ( = ?auto_57338 ?auto_57341 ) ) ( not ( = ?auto_57338 ?auto_57342 ) ) ( not ( = ?auto_57338 ?auto_57343 ) ) ( not ( = ?auto_57339 ?auto_57340 ) ) ( not ( = ?auto_57339 ?auto_57341 ) ) ( not ( = ?auto_57339 ?auto_57342 ) ) ( not ( = ?auto_57339 ?auto_57343 ) ) ( not ( = ?auto_57340 ?auto_57341 ) ) ( not ( = ?auto_57340 ?auto_57342 ) ) ( not ( = ?auto_57340 ?auto_57343 ) ) ( not ( = ?auto_57341 ?auto_57342 ) ) ( not ( = ?auto_57341 ?auto_57343 ) ) ( not ( = ?auto_57342 ?auto_57343 ) ) ( ON ?auto_57343 ?auto_57344 ) ( not ( = ?auto_57338 ?auto_57344 ) ) ( not ( = ?auto_57339 ?auto_57344 ) ) ( not ( = ?auto_57340 ?auto_57344 ) ) ( not ( = ?auto_57341 ?auto_57344 ) ) ( not ( = ?auto_57342 ?auto_57344 ) ) ( not ( = ?auto_57343 ?auto_57344 ) ) ( ON ?auto_57342 ?auto_57343 ) ( ON-TABLE ?auto_57344 ) ( ON ?auto_57341 ?auto_57342 ) ( CLEAR ?auto_57339 ) ( ON ?auto_57340 ?auto_57341 ) ( CLEAR ?auto_57340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57344 ?auto_57343 ?auto_57342 ?auto_57341 )
      ( MAKE-6PILE ?auto_57338 ?auto_57339 ?auto_57340 ?auto_57341 ?auto_57342 ?auto_57343 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57345 - BLOCK
      ?auto_57346 - BLOCK
      ?auto_57347 - BLOCK
      ?auto_57348 - BLOCK
      ?auto_57349 - BLOCK
      ?auto_57350 - BLOCK
    )
    :vars
    (
      ?auto_57351 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57345 ) ( not ( = ?auto_57345 ?auto_57346 ) ) ( not ( = ?auto_57345 ?auto_57347 ) ) ( not ( = ?auto_57345 ?auto_57348 ) ) ( not ( = ?auto_57345 ?auto_57349 ) ) ( not ( = ?auto_57345 ?auto_57350 ) ) ( not ( = ?auto_57346 ?auto_57347 ) ) ( not ( = ?auto_57346 ?auto_57348 ) ) ( not ( = ?auto_57346 ?auto_57349 ) ) ( not ( = ?auto_57346 ?auto_57350 ) ) ( not ( = ?auto_57347 ?auto_57348 ) ) ( not ( = ?auto_57347 ?auto_57349 ) ) ( not ( = ?auto_57347 ?auto_57350 ) ) ( not ( = ?auto_57348 ?auto_57349 ) ) ( not ( = ?auto_57348 ?auto_57350 ) ) ( not ( = ?auto_57349 ?auto_57350 ) ) ( ON ?auto_57350 ?auto_57351 ) ( not ( = ?auto_57345 ?auto_57351 ) ) ( not ( = ?auto_57346 ?auto_57351 ) ) ( not ( = ?auto_57347 ?auto_57351 ) ) ( not ( = ?auto_57348 ?auto_57351 ) ) ( not ( = ?auto_57349 ?auto_57351 ) ) ( not ( = ?auto_57350 ?auto_57351 ) ) ( ON ?auto_57349 ?auto_57350 ) ( ON-TABLE ?auto_57351 ) ( ON ?auto_57348 ?auto_57349 ) ( ON ?auto_57347 ?auto_57348 ) ( CLEAR ?auto_57347 ) ( HOLDING ?auto_57346 ) ( CLEAR ?auto_57345 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57345 ?auto_57346 )
      ( MAKE-6PILE ?auto_57345 ?auto_57346 ?auto_57347 ?auto_57348 ?auto_57349 ?auto_57350 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57352 - BLOCK
      ?auto_57353 - BLOCK
      ?auto_57354 - BLOCK
      ?auto_57355 - BLOCK
      ?auto_57356 - BLOCK
      ?auto_57357 - BLOCK
    )
    :vars
    (
      ?auto_57358 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57352 ) ( not ( = ?auto_57352 ?auto_57353 ) ) ( not ( = ?auto_57352 ?auto_57354 ) ) ( not ( = ?auto_57352 ?auto_57355 ) ) ( not ( = ?auto_57352 ?auto_57356 ) ) ( not ( = ?auto_57352 ?auto_57357 ) ) ( not ( = ?auto_57353 ?auto_57354 ) ) ( not ( = ?auto_57353 ?auto_57355 ) ) ( not ( = ?auto_57353 ?auto_57356 ) ) ( not ( = ?auto_57353 ?auto_57357 ) ) ( not ( = ?auto_57354 ?auto_57355 ) ) ( not ( = ?auto_57354 ?auto_57356 ) ) ( not ( = ?auto_57354 ?auto_57357 ) ) ( not ( = ?auto_57355 ?auto_57356 ) ) ( not ( = ?auto_57355 ?auto_57357 ) ) ( not ( = ?auto_57356 ?auto_57357 ) ) ( ON ?auto_57357 ?auto_57358 ) ( not ( = ?auto_57352 ?auto_57358 ) ) ( not ( = ?auto_57353 ?auto_57358 ) ) ( not ( = ?auto_57354 ?auto_57358 ) ) ( not ( = ?auto_57355 ?auto_57358 ) ) ( not ( = ?auto_57356 ?auto_57358 ) ) ( not ( = ?auto_57357 ?auto_57358 ) ) ( ON ?auto_57356 ?auto_57357 ) ( ON-TABLE ?auto_57358 ) ( ON ?auto_57355 ?auto_57356 ) ( ON ?auto_57354 ?auto_57355 ) ( CLEAR ?auto_57352 ) ( ON ?auto_57353 ?auto_57354 ) ( CLEAR ?auto_57353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_57358 ?auto_57357 ?auto_57356 ?auto_57355 ?auto_57354 )
      ( MAKE-6PILE ?auto_57352 ?auto_57353 ?auto_57354 ?auto_57355 ?auto_57356 ?auto_57357 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57359 - BLOCK
      ?auto_57360 - BLOCK
      ?auto_57361 - BLOCK
      ?auto_57362 - BLOCK
      ?auto_57363 - BLOCK
      ?auto_57364 - BLOCK
    )
    :vars
    (
      ?auto_57365 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57359 ?auto_57360 ) ) ( not ( = ?auto_57359 ?auto_57361 ) ) ( not ( = ?auto_57359 ?auto_57362 ) ) ( not ( = ?auto_57359 ?auto_57363 ) ) ( not ( = ?auto_57359 ?auto_57364 ) ) ( not ( = ?auto_57360 ?auto_57361 ) ) ( not ( = ?auto_57360 ?auto_57362 ) ) ( not ( = ?auto_57360 ?auto_57363 ) ) ( not ( = ?auto_57360 ?auto_57364 ) ) ( not ( = ?auto_57361 ?auto_57362 ) ) ( not ( = ?auto_57361 ?auto_57363 ) ) ( not ( = ?auto_57361 ?auto_57364 ) ) ( not ( = ?auto_57362 ?auto_57363 ) ) ( not ( = ?auto_57362 ?auto_57364 ) ) ( not ( = ?auto_57363 ?auto_57364 ) ) ( ON ?auto_57364 ?auto_57365 ) ( not ( = ?auto_57359 ?auto_57365 ) ) ( not ( = ?auto_57360 ?auto_57365 ) ) ( not ( = ?auto_57361 ?auto_57365 ) ) ( not ( = ?auto_57362 ?auto_57365 ) ) ( not ( = ?auto_57363 ?auto_57365 ) ) ( not ( = ?auto_57364 ?auto_57365 ) ) ( ON ?auto_57363 ?auto_57364 ) ( ON-TABLE ?auto_57365 ) ( ON ?auto_57362 ?auto_57363 ) ( ON ?auto_57361 ?auto_57362 ) ( ON ?auto_57360 ?auto_57361 ) ( CLEAR ?auto_57360 ) ( HOLDING ?auto_57359 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_57359 )
      ( MAKE-6PILE ?auto_57359 ?auto_57360 ?auto_57361 ?auto_57362 ?auto_57363 ?auto_57364 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57366 - BLOCK
      ?auto_57367 - BLOCK
      ?auto_57368 - BLOCK
      ?auto_57369 - BLOCK
      ?auto_57370 - BLOCK
      ?auto_57371 - BLOCK
    )
    :vars
    (
      ?auto_57372 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57366 ?auto_57367 ) ) ( not ( = ?auto_57366 ?auto_57368 ) ) ( not ( = ?auto_57366 ?auto_57369 ) ) ( not ( = ?auto_57366 ?auto_57370 ) ) ( not ( = ?auto_57366 ?auto_57371 ) ) ( not ( = ?auto_57367 ?auto_57368 ) ) ( not ( = ?auto_57367 ?auto_57369 ) ) ( not ( = ?auto_57367 ?auto_57370 ) ) ( not ( = ?auto_57367 ?auto_57371 ) ) ( not ( = ?auto_57368 ?auto_57369 ) ) ( not ( = ?auto_57368 ?auto_57370 ) ) ( not ( = ?auto_57368 ?auto_57371 ) ) ( not ( = ?auto_57369 ?auto_57370 ) ) ( not ( = ?auto_57369 ?auto_57371 ) ) ( not ( = ?auto_57370 ?auto_57371 ) ) ( ON ?auto_57371 ?auto_57372 ) ( not ( = ?auto_57366 ?auto_57372 ) ) ( not ( = ?auto_57367 ?auto_57372 ) ) ( not ( = ?auto_57368 ?auto_57372 ) ) ( not ( = ?auto_57369 ?auto_57372 ) ) ( not ( = ?auto_57370 ?auto_57372 ) ) ( not ( = ?auto_57371 ?auto_57372 ) ) ( ON ?auto_57370 ?auto_57371 ) ( ON-TABLE ?auto_57372 ) ( ON ?auto_57369 ?auto_57370 ) ( ON ?auto_57368 ?auto_57369 ) ( ON ?auto_57367 ?auto_57368 ) ( ON ?auto_57366 ?auto_57367 ) ( CLEAR ?auto_57366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_57372 ?auto_57371 ?auto_57370 ?auto_57369 ?auto_57368 ?auto_57367 )
      ( MAKE-6PILE ?auto_57366 ?auto_57367 ?auto_57368 ?auto_57369 ?auto_57370 ?auto_57371 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57453 - BLOCK
    )
    :vars
    (
      ?auto_57454 - BLOCK
      ?auto_57455 - BLOCK
      ?auto_57456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57453 ?auto_57454 ) ( CLEAR ?auto_57453 ) ( not ( = ?auto_57453 ?auto_57454 ) ) ( HOLDING ?auto_57455 ) ( CLEAR ?auto_57456 ) ( not ( = ?auto_57453 ?auto_57455 ) ) ( not ( = ?auto_57453 ?auto_57456 ) ) ( not ( = ?auto_57454 ?auto_57455 ) ) ( not ( = ?auto_57454 ?auto_57456 ) ) ( not ( = ?auto_57455 ?auto_57456 ) ) )
    :subtasks
    ( ( !STACK ?auto_57455 ?auto_57456 )
      ( MAKE-1PILE ?auto_57453 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57457 - BLOCK
    )
    :vars
    (
      ?auto_57460 - BLOCK
      ?auto_57458 - BLOCK
      ?auto_57459 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57457 ?auto_57460 ) ( not ( = ?auto_57457 ?auto_57460 ) ) ( CLEAR ?auto_57458 ) ( not ( = ?auto_57457 ?auto_57459 ) ) ( not ( = ?auto_57457 ?auto_57458 ) ) ( not ( = ?auto_57460 ?auto_57459 ) ) ( not ( = ?auto_57460 ?auto_57458 ) ) ( not ( = ?auto_57459 ?auto_57458 ) ) ( ON ?auto_57459 ?auto_57457 ) ( CLEAR ?auto_57459 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_57460 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57460 ?auto_57457 )
      ( MAKE-1PILE ?auto_57457 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57461 - BLOCK
    )
    :vars
    (
      ?auto_57464 - BLOCK
      ?auto_57462 - BLOCK
      ?auto_57463 - BLOCK
      ?auto_57466 - BLOCK
      ?auto_57467 - BLOCK
      ?auto_57465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57461 ?auto_57464 ) ( not ( = ?auto_57461 ?auto_57464 ) ) ( not ( = ?auto_57461 ?auto_57462 ) ) ( not ( = ?auto_57461 ?auto_57463 ) ) ( not ( = ?auto_57464 ?auto_57462 ) ) ( not ( = ?auto_57464 ?auto_57463 ) ) ( not ( = ?auto_57462 ?auto_57463 ) ) ( ON ?auto_57462 ?auto_57461 ) ( CLEAR ?auto_57462 ) ( ON-TABLE ?auto_57464 ) ( HOLDING ?auto_57463 ) ( CLEAR ?auto_57466 ) ( ON-TABLE ?auto_57467 ) ( ON ?auto_57465 ?auto_57467 ) ( ON ?auto_57466 ?auto_57465 ) ( not ( = ?auto_57467 ?auto_57465 ) ) ( not ( = ?auto_57467 ?auto_57466 ) ) ( not ( = ?auto_57467 ?auto_57463 ) ) ( not ( = ?auto_57465 ?auto_57466 ) ) ( not ( = ?auto_57465 ?auto_57463 ) ) ( not ( = ?auto_57466 ?auto_57463 ) ) ( not ( = ?auto_57461 ?auto_57466 ) ) ( not ( = ?auto_57461 ?auto_57467 ) ) ( not ( = ?auto_57461 ?auto_57465 ) ) ( not ( = ?auto_57464 ?auto_57466 ) ) ( not ( = ?auto_57464 ?auto_57467 ) ) ( not ( = ?auto_57464 ?auto_57465 ) ) ( not ( = ?auto_57462 ?auto_57466 ) ) ( not ( = ?auto_57462 ?auto_57467 ) ) ( not ( = ?auto_57462 ?auto_57465 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57467 ?auto_57465 ?auto_57466 ?auto_57463 )
      ( MAKE-1PILE ?auto_57461 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57468 - BLOCK
    )
    :vars
    (
      ?auto_57474 - BLOCK
      ?auto_57472 - BLOCK
      ?auto_57470 - BLOCK
      ?auto_57473 - BLOCK
      ?auto_57471 - BLOCK
      ?auto_57469 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57468 ?auto_57474 ) ( not ( = ?auto_57468 ?auto_57474 ) ) ( not ( = ?auto_57468 ?auto_57472 ) ) ( not ( = ?auto_57468 ?auto_57470 ) ) ( not ( = ?auto_57474 ?auto_57472 ) ) ( not ( = ?auto_57474 ?auto_57470 ) ) ( not ( = ?auto_57472 ?auto_57470 ) ) ( ON ?auto_57472 ?auto_57468 ) ( ON-TABLE ?auto_57474 ) ( CLEAR ?auto_57473 ) ( ON-TABLE ?auto_57471 ) ( ON ?auto_57469 ?auto_57471 ) ( ON ?auto_57473 ?auto_57469 ) ( not ( = ?auto_57471 ?auto_57469 ) ) ( not ( = ?auto_57471 ?auto_57473 ) ) ( not ( = ?auto_57471 ?auto_57470 ) ) ( not ( = ?auto_57469 ?auto_57473 ) ) ( not ( = ?auto_57469 ?auto_57470 ) ) ( not ( = ?auto_57473 ?auto_57470 ) ) ( not ( = ?auto_57468 ?auto_57473 ) ) ( not ( = ?auto_57468 ?auto_57471 ) ) ( not ( = ?auto_57468 ?auto_57469 ) ) ( not ( = ?auto_57474 ?auto_57473 ) ) ( not ( = ?auto_57474 ?auto_57471 ) ) ( not ( = ?auto_57474 ?auto_57469 ) ) ( not ( = ?auto_57472 ?auto_57473 ) ) ( not ( = ?auto_57472 ?auto_57471 ) ) ( not ( = ?auto_57472 ?auto_57469 ) ) ( ON ?auto_57470 ?auto_57472 ) ( CLEAR ?auto_57470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57474 ?auto_57468 ?auto_57472 )
      ( MAKE-1PILE ?auto_57468 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57475 - BLOCK
    )
    :vars
    (
      ?auto_57477 - BLOCK
      ?auto_57479 - BLOCK
      ?auto_57476 - BLOCK
      ?auto_57480 - BLOCK
      ?auto_57478 - BLOCK
      ?auto_57481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57475 ?auto_57477 ) ( not ( = ?auto_57475 ?auto_57477 ) ) ( not ( = ?auto_57475 ?auto_57479 ) ) ( not ( = ?auto_57475 ?auto_57476 ) ) ( not ( = ?auto_57477 ?auto_57479 ) ) ( not ( = ?auto_57477 ?auto_57476 ) ) ( not ( = ?auto_57479 ?auto_57476 ) ) ( ON ?auto_57479 ?auto_57475 ) ( ON-TABLE ?auto_57477 ) ( ON-TABLE ?auto_57480 ) ( ON ?auto_57478 ?auto_57480 ) ( not ( = ?auto_57480 ?auto_57478 ) ) ( not ( = ?auto_57480 ?auto_57481 ) ) ( not ( = ?auto_57480 ?auto_57476 ) ) ( not ( = ?auto_57478 ?auto_57481 ) ) ( not ( = ?auto_57478 ?auto_57476 ) ) ( not ( = ?auto_57481 ?auto_57476 ) ) ( not ( = ?auto_57475 ?auto_57481 ) ) ( not ( = ?auto_57475 ?auto_57480 ) ) ( not ( = ?auto_57475 ?auto_57478 ) ) ( not ( = ?auto_57477 ?auto_57481 ) ) ( not ( = ?auto_57477 ?auto_57480 ) ) ( not ( = ?auto_57477 ?auto_57478 ) ) ( not ( = ?auto_57479 ?auto_57481 ) ) ( not ( = ?auto_57479 ?auto_57480 ) ) ( not ( = ?auto_57479 ?auto_57478 ) ) ( ON ?auto_57476 ?auto_57479 ) ( CLEAR ?auto_57476 ) ( HOLDING ?auto_57481 ) ( CLEAR ?auto_57478 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57480 ?auto_57478 ?auto_57481 )
      ( MAKE-1PILE ?auto_57475 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57482 - BLOCK
    )
    :vars
    (
      ?auto_57486 - BLOCK
      ?auto_57484 - BLOCK
      ?auto_57483 - BLOCK
      ?auto_57488 - BLOCK
      ?auto_57487 - BLOCK
      ?auto_57485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57482 ?auto_57486 ) ( not ( = ?auto_57482 ?auto_57486 ) ) ( not ( = ?auto_57482 ?auto_57484 ) ) ( not ( = ?auto_57482 ?auto_57483 ) ) ( not ( = ?auto_57486 ?auto_57484 ) ) ( not ( = ?auto_57486 ?auto_57483 ) ) ( not ( = ?auto_57484 ?auto_57483 ) ) ( ON ?auto_57484 ?auto_57482 ) ( ON-TABLE ?auto_57486 ) ( ON-TABLE ?auto_57488 ) ( ON ?auto_57487 ?auto_57488 ) ( not ( = ?auto_57488 ?auto_57487 ) ) ( not ( = ?auto_57488 ?auto_57485 ) ) ( not ( = ?auto_57488 ?auto_57483 ) ) ( not ( = ?auto_57487 ?auto_57485 ) ) ( not ( = ?auto_57487 ?auto_57483 ) ) ( not ( = ?auto_57485 ?auto_57483 ) ) ( not ( = ?auto_57482 ?auto_57485 ) ) ( not ( = ?auto_57482 ?auto_57488 ) ) ( not ( = ?auto_57482 ?auto_57487 ) ) ( not ( = ?auto_57486 ?auto_57485 ) ) ( not ( = ?auto_57486 ?auto_57488 ) ) ( not ( = ?auto_57486 ?auto_57487 ) ) ( not ( = ?auto_57484 ?auto_57485 ) ) ( not ( = ?auto_57484 ?auto_57488 ) ) ( not ( = ?auto_57484 ?auto_57487 ) ) ( ON ?auto_57483 ?auto_57484 ) ( CLEAR ?auto_57487 ) ( ON ?auto_57485 ?auto_57483 ) ( CLEAR ?auto_57485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57486 ?auto_57482 ?auto_57484 ?auto_57483 )
      ( MAKE-1PILE ?auto_57482 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57489 - BLOCK
    )
    :vars
    (
      ?auto_57495 - BLOCK
      ?auto_57491 - BLOCK
      ?auto_57493 - BLOCK
      ?auto_57494 - BLOCK
      ?auto_57492 - BLOCK
      ?auto_57490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57489 ?auto_57495 ) ( not ( = ?auto_57489 ?auto_57495 ) ) ( not ( = ?auto_57489 ?auto_57491 ) ) ( not ( = ?auto_57489 ?auto_57493 ) ) ( not ( = ?auto_57495 ?auto_57491 ) ) ( not ( = ?auto_57495 ?auto_57493 ) ) ( not ( = ?auto_57491 ?auto_57493 ) ) ( ON ?auto_57491 ?auto_57489 ) ( ON-TABLE ?auto_57495 ) ( ON-TABLE ?auto_57494 ) ( not ( = ?auto_57494 ?auto_57492 ) ) ( not ( = ?auto_57494 ?auto_57490 ) ) ( not ( = ?auto_57494 ?auto_57493 ) ) ( not ( = ?auto_57492 ?auto_57490 ) ) ( not ( = ?auto_57492 ?auto_57493 ) ) ( not ( = ?auto_57490 ?auto_57493 ) ) ( not ( = ?auto_57489 ?auto_57490 ) ) ( not ( = ?auto_57489 ?auto_57494 ) ) ( not ( = ?auto_57489 ?auto_57492 ) ) ( not ( = ?auto_57495 ?auto_57490 ) ) ( not ( = ?auto_57495 ?auto_57494 ) ) ( not ( = ?auto_57495 ?auto_57492 ) ) ( not ( = ?auto_57491 ?auto_57490 ) ) ( not ( = ?auto_57491 ?auto_57494 ) ) ( not ( = ?auto_57491 ?auto_57492 ) ) ( ON ?auto_57493 ?auto_57491 ) ( ON ?auto_57490 ?auto_57493 ) ( CLEAR ?auto_57490 ) ( HOLDING ?auto_57492 ) ( CLEAR ?auto_57494 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57494 ?auto_57492 )
      ( MAKE-1PILE ?auto_57489 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57496 - BLOCK
    )
    :vars
    (
      ?auto_57499 - BLOCK
      ?auto_57498 - BLOCK
      ?auto_57502 - BLOCK
      ?auto_57497 - BLOCK
      ?auto_57500 - BLOCK
      ?auto_57501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57496 ?auto_57499 ) ( not ( = ?auto_57496 ?auto_57499 ) ) ( not ( = ?auto_57496 ?auto_57498 ) ) ( not ( = ?auto_57496 ?auto_57502 ) ) ( not ( = ?auto_57499 ?auto_57498 ) ) ( not ( = ?auto_57499 ?auto_57502 ) ) ( not ( = ?auto_57498 ?auto_57502 ) ) ( ON ?auto_57498 ?auto_57496 ) ( ON-TABLE ?auto_57499 ) ( ON-TABLE ?auto_57497 ) ( not ( = ?auto_57497 ?auto_57500 ) ) ( not ( = ?auto_57497 ?auto_57501 ) ) ( not ( = ?auto_57497 ?auto_57502 ) ) ( not ( = ?auto_57500 ?auto_57501 ) ) ( not ( = ?auto_57500 ?auto_57502 ) ) ( not ( = ?auto_57501 ?auto_57502 ) ) ( not ( = ?auto_57496 ?auto_57501 ) ) ( not ( = ?auto_57496 ?auto_57497 ) ) ( not ( = ?auto_57496 ?auto_57500 ) ) ( not ( = ?auto_57499 ?auto_57501 ) ) ( not ( = ?auto_57499 ?auto_57497 ) ) ( not ( = ?auto_57499 ?auto_57500 ) ) ( not ( = ?auto_57498 ?auto_57501 ) ) ( not ( = ?auto_57498 ?auto_57497 ) ) ( not ( = ?auto_57498 ?auto_57500 ) ) ( ON ?auto_57502 ?auto_57498 ) ( ON ?auto_57501 ?auto_57502 ) ( CLEAR ?auto_57497 ) ( ON ?auto_57500 ?auto_57501 ) ( CLEAR ?auto_57500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_57499 ?auto_57496 ?auto_57498 ?auto_57502 ?auto_57501 )
      ( MAKE-1PILE ?auto_57496 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57503 - BLOCK
    )
    :vars
    (
      ?auto_57506 - BLOCK
      ?auto_57509 - BLOCK
      ?auto_57508 - BLOCK
      ?auto_57504 - BLOCK
      ?auto_57505 - BLOCK
      ?auto_57507 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57503 ?auto_57506 ) ( not ( = ?auto_57503 ?auto_57506 ) ) ( not ( = ?auto_57503 ?auto_57509 ) ) ( not ( = ?auto_57503 ?auto_57508 ) ) ( not ( = ?auto_57506 ?auto_57509 ) ) ( not ( = ?auto_57506 ?auto_57508 ) ) ( not ( = ?auto_57509 ?auto_57508 ) ) ( ON ?auto_57509 ?auto_57503 ) ( ON-TABLE ?auto_57506 ) ( not ( = ?auto_57504 ?auto_57505 ) ) ( not ( = ?auto_57504 ?auto_57507 ) ) ( not ( = ?auto_57504 ?auto_57508 ) ) ( not ( = ?auto_57505 ?auto_57507 ) ) ( not ( = ?auto_57505 ?auto_57508 ) ) ( not ( = ?auto_57507 ?auto_57508 ) ) ( not ( = ?auto_57503 ?auto_57507 ) ) ( not ( = ?auto_57503 ?auto_57504 ) ) ( not ( = ?auto_57503 ?auto_57505 ) ) ( not ( = ?auto_57506 ?auto_57507 ) ) ( not ( = ?auto_57506 ?auto_57504 ) ) ( not ( = ?auto_57506 ?auto_57505 ) ) ( not ( = ?auto_57509 ?auto_57507 ) ) ( not ( = ?auto_57509 ?auto_57504 ) ) ( not ( = ?auto_57509 ?auto_57505 ) ) ( ON ?auto_57508 ?auto_57509 ) ( ON ?auto_57507 ?auto_57508 ) ( ON ?auto_57505 ?auto_57507 ) ( CLEAR ?auto_57505 ) ( HOLDING ?auto_57504 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_57504 )
      ( MAKE-1PILE ?auto_57503 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57510 - BLOCK
    )
    :vars
    (
      ?auto_57514 - BLOCK
      ?auto_57513 - BLOCK
      ?auto_57516 - BLOCK
      ?auto_57511 - BLOCK
      ?auto_57512 - BLOCK
      ?auto_57515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57510 ?auto_57514 ) ( not ( = ?auto_57510 ?auto_57514 ) ) ( not ( = ?auto_57510 ?auto_57513 ) ) ( not ( = ?auto_57510 ?auto_57516 ) ) ( not ( = ?auto_57514 ?auto_57513 ) ) ( not ( = ?auto_57514 ?auto_57516 ) ) ( not ( = ?auto_57513 ?auto_57516 ) ) ( ON ?auto_57513 ?auto_57510 ) ( ON-TABLE ?auto_57514 ) ( not ( = ?auto_57511 ?auto_57512 ) ) ( not ( = ?auto_57511 ?auto_57515 ) ) ( not ( = ?auto_57511 ?auto_57516 ) ) ( not ( = ?auto_57512 ?auto_57515 ) ) ( not ( = ?auto_57512 ?auto_57516 ) ) ( not ( = ?auto_57515 ?auto_57516 ) ) ( not ( = ?auto_57510 ?auto_57515 ) ) ( not ( = ?auto_57510 ?auto_57511 ) ) ( not ( = ?auto_57510 ?auto_57512 ) ) ( not ( = ?auto_57514 ?auto_57515 ) ) ( not ( = ?auto_57514 ?auto_57511 ) ) ( not ( = ?auto_57514 ?auto_57512 ) ) ( not ( = ?auto_57513 ?auto_57515 ) ) ( not ( = ?auto_57513 ?auto_57511 ) ) ( not ( = ?auto_57513 ?auto_57512 ) ) ( ON ?auto_57516 ?auto_57513 ) ( ON ?auto_57515 ?auto_57516 ) ( ON ?auto_57512 ?auto_57515 ) ( ON ?auto_57511 ?auto_57512 ) ( CLEAR ?auto_57511 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_57514 ?auto_57510 ?auto_57513 ?auto_57516 ?auto_57515 ?auto_57512 )
      ( MAKE-1PILE ?auto_57510 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57526 - BLOCK
      ?auto_57527 - BLOCK
      ?auto_57528 - BLOCK
      ?auto_57529 - BLOCK
    )
    :vars
    (
      ?auto_57530 - BLOCK
      ?auto_57531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57530 ?auto_57529 ) ( CLEAR ?auto_57530 ) ( ON-TABLE ?auto_57526 ) ( ON ?auto_57527 ?auto_57526 ) ( ON ?auto_57528 ?auto_57527 ) ( ON ?auto_57529 ?auto_57528 ) ( not ( = ?auto_57526 ?auto_57527 ) ) ( not ( = ?auto_57526 ?auto_57528 ) ) ( not ( = ?auto_57526 ?auto_57529 ) ) ( not ( = ?auto_57526 ?auto_57530 ) ) ( not ( = ?auto_57527 ?auto_57528 ) ) ( not ( = ?auto_57527 ?auto_57529 ) ) ( not ( = ?auto_57527 ?auto_57530 ) ) ( not ( = ?auto_57528 ?auto_57529 ) ) ( not ( = ?auto_57528 ?auto_57530 ) ) ( not ( = ?auto_57529 ?auto_57530 ) ) ( HOLDING ?auto_57531 ) ( not ( = ?auto_57526 ?auto_57531 ) ) ( not ( = ?auto_57527 ?auto_57531 ) ) ( not ( = ?auto_57528 ?auto_57531 ) ) ( not ( = ?auto_57529 ?auto_57531 ) ) ( not ( = ?auto_57530 ?auto_57531 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_57531 )
      ( MAKE-4PILE ?auto_57526 ?auto_57527 ?auto_57528 ?auto_57529 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_57599 - BLOCK
      ?auto_57600 - BLOCK
    )
    :vars
    (
      ?auto_57601 - BLOCK
      ?auto_57602 - BLOCK
      ?auto_57604 - BLOCK
      ?auto_57603 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57599 ?auto_57600 ) ) ( ON ?auto_57600 ?auto_57601 ) ( not ( = ?auto_57599 ?auto_57601 ) ) ( not ( = ?auto_57600 ?auto_57601 ) ) ( ON ?auto_57599 ?auto_57600 ) ( CLEAR ?auto_57599 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_57602 ) ( ON ?auto_57604 ?auto_57602 ) ( ON ?auto_57603 ?auto_57604 ) ( ON ?auto_57601 ?auto_57603 ) ( not ( = ?auto_57602 ?auto_57604 ) ) ( not ( = ?auto_57602 ?auto_57603 ) ) ( not ( = ?auto_57602 ?auto_57601 ) ) ( not ( = ?auto_57602 ?auto_57600 ) ) ( not ( = ?auto_57602 ?auto_57599 ) ) ( not ( = ?auto_57604 ?auto_57603 ) ) ( not ( = ?auto_57604 ?auto_57601 ) ) ( not ( = ?auto_57604 ?auto_57600 ) ) ( not ( = ?auto_57604 ?auto_57599 ) ) ( not ( = ?auto_57603 ?auto_57601 ) ) ( not ( = ?auto_57603 ?auto_57600 ) ) ( not ( = ?auto_57603 ?auto_57599 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_57602 ?auto_57604 ?auto_57603 ?auto_57601 ?auto_57600 )
      ( MAKE-2PILE ?auto_57599 ?auto_57600 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_57607 - BLOCK
      ?auto_57608 - BLOCK
    )
    :vars
    (
      ?auto_57609 - BLOCK
      ?auto_57610 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57607 ?auto_57608 ) ) ( ON ?auto_57608 ?auto_57609 ) ( CLEAR ?auto_57608 ) ( not ( = ?auto_57607 ?auto_57609 ) ) ( not ( = ?auto_57608 ?auto_57609 ) ) ( ON ?auto_57607 ?auto_57610 ) ( CLEAR ?auto_57607 ) ( HAND-EMPTY ) ( not ( = ?auto_57607 ?auto_57610 ) ) ( not ( = ?auto_57608 ?auto_57610 ) ) ( not ( = ?auto_57609 ?auto_57610 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_57607 ?auto_57610 )
      ( MAKE-2PILE ?auto_57607 ?auto_57608 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_57611 - BLOCK
      ?auto_57612 - BLOCK
    )
    :vars
    (
      ?auto_57613 - BLOCK
      ?auto_57614 - BLOCK
      ?auto_57617 - BLOCK
      ?auto_57615 - BLOCK
      ?auto_57616 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57611 ?auto_57612 ) ) ( not ( = ?auto_57611 ?auto_57613 ) ) ( not ( = ?auto_57612 ?auto_57613 ) ) ( ON ?auto_57611 ?auto_57614 ) ( CLEAR ?auto_57611 ) ( not ( = ?auto_57611 ?auto_57614 ) ) ( not ( = ?auto_57612 ?auto_57614 ) ) ( not ( = ?auto_57613 ?auto_57614 ) ) ( HOLDING ?auto_57612 ) ( CLEAR ?auto_57613 ) ( ON-TABLE ?auto_57617 ) ( ON ?auto_57615 ?auto_57617 ) ( ON ?auto_57616 ?auto_57615 ) ( ON ?auto_57613 ?auto_57616 ) ( not ( = ?auto_57617 ?auto_57615 ) ) ( not ( = ?auto_57617 ?auto_57616 ) ) ( not ( = ?auto_57617 ?auto_57613 ) ) ( not ( = ?auto_57617 ?auto_57612 ) ) ( not ( = ?auto_57615 ?auto_57616 ) ) ( not ( = ?auto_57615 ?auto_57613 ) ) ( not ( = ?auto_57615 ?auto_57612 ) ) ( not ( = ?auto_57616 ?auto_57613 ) ) ( not ( = ?auto_57616 ?auto_57612 ) ) ( not ( = ?auto_57611 ?auto_57617 ) ) ( not ( = ?auto_57611 ?auto_57615 ) ) ( not ( = ?auto_57611 ?auto_57616 ) ) ( not ( = ?auto_57614 ?auto_57617 ) ) ( not ( = ?auto_57614 ?auto_57615 ) ) ( not ( = ?auto_57614 ?auto_57616 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_57617 ?auto_57615 ?auto_57616 ?auto_57613 ?auto_57612 )
      ( MAKE-2PILE ?auto_57611 ?auto_57612 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_57618 - BLOCK
      ?auto_57619 - BLOCK
    )
    :vars
    (
      ?auto_57624 - BLOCK
      ?auto_57623 - BLOCK
      ?auto_57620 - BLOCK
      ?auto_57621 - BLOCK
      ?auto_57622 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57618 ?auto_57619 ) ) ( not ( = ?auto_57618 ?auto_57624 ) ) ( not ( = ?auto_57619 ?auto_57624 ) ) ( ON ?auto_57618 ?auto_57623 ) ( not ( = ?auto_57618 ?auto_57623 ) ) ( not ( = ?auto_57619 ?auto_57623 ) ) ( not ( = ?auto_57624 ?auto_57623 ) ) ( CLEAR ?auto_57624 ) ( ON-TABLE ?auto_57620 ) ( ON ?auto_57621 ?auto_57620 ) ( ON ?auto_57622 ?auto_57621 ) ( ON ?auto_57624 ?auto_57622 ) ( not ( = ?auto_57620 ?auto_57621 ) ) ( not ( = ?auto_57620 ?auto_57622 ) ) ( not ( = ?auto_57620 ?auto_57624 ) ) ( not ( = ?auto_57620 ?auto_57619 ) ) ( not ( = ?auto_57621 ?auto_57622 ) ) ( not ( = ?auto_57621 ?auto_57624 ) ) ( not ( = ?auto_57621 ?auto_57619 ) ) ( not ( = ?auto_57622 ?auto_57624 ) ) ( not ( = ?auto_57622 ?auto_57619 ) ) ( not ( = ?auto_57618 ?auto_57620 ) ) ( not ( = ?auto_57618 ?auto_57621 ) ) ( not ( = ?auto_57618 ?auto_57622 ) ) ( not ( = ?auto_57623 ?auto_57620 ) ) ( not ( = ?auto_57623 ?auto_57621 ) ) ( not ( = ?auto_57623 ?auto_57622 ) ) ( ON ?auto_57619 ?auto_57618 ) ( CLEAR ?auto_57619 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_57623 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57623 ?auto_57618 )
      ( MAKE-2PILE ?auto_57618 ?auto_57619 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_57625 - BLOCK
      ?auto_57626 - BLOCK
    )
    :vars
    (
      ?auto_57631 - BLOCK
      ?auto_57628 - BLOCK
      ?auto_57630 - BLOCK
      ?auto_57629 - BLOCK
      ?auto_57627 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57625 ?auto_57626 ) ) ( not ( = ?auto_57625 ?auto_57631 ) ) ( not ( = ?auto_57626 ?auto_57631 ) ) ( ON ?auto_57625 ?auto_57628 ) ( not ( = ?auto_57625 ?auto_57628 ) ) ( not ( = ?auto_57626 ?auto_57628 ) ) ( not ( = ?auto_57631 ?auto_57628 ) ) ( ON-TABLE ?auto_57630 ) ( ON ?auto_57629 ?auto_57630 ) ( ON ?auto_57627 ?auto_57629 ) ( not ( = ?auto_57630 ?auto_57629 ) ) ( not ( = ?auto_57630 ?auto_57627 ) ) ( not ( = ?auto_57630 ?auto_57631 ) ) ( not ( = ?auto_57630 ?auto_57626 ) ) ( not ( = ?auto_57629 ?auto_57627 ) ) ( not ( = ?auto_57629 ?auto_57631 ) ) ( not ( = ?auto_57629 ?auto_57626 ) ) ( not ( = ?auto_57627 ?auto_57631 ) ) ( not ( = ?auto_57627 ?auto_57626 ) ) ( not ( = ?auto_57625 ?auto_57630 ) ) ( not ( = ?auto_57625 ?auto_57629 ) ) ( not ( = ?auto_57625 ?auto_57627 ) ) ( not ( = ?auto_57628 ?auto_57630 ) ) ( not ( = ?auto_57628 ?auto_57629 ) ) ( not ( = ?auto_57628 ?auto_57627 ) ) ( ON ?auto_57626 ?auto_57625 ) ( CLEAR ?auto_57626 ) ( ON-TABLE ?auto_57628 ) ( HOLDING ?auto_57631 ) ( CLEAR ?auto_57627 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57630 ?auto_57629 ?auto_57627 ?auto_57631 )
      ( MAKE-2PILE ?auto_57625 ?auto_57626 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_57632 - BLOCK
      ?auto_57633 - BLOCK
    )
    :vars
    (
      ?auto_57634 - BLOCK
      ?auto_57636 - BLOCK
      ?auto_57635 - BLOCK
      ?auto_57638 - BLOCK
      ?auto_57637 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57632 ?auto_57633 ) ) ( not ( = ?auto_57632 ?auto_57634 ) ) ( not ( = ?auto_57633 ?auto_57634 ) ) ( ON ?auto_57632 ?auto_57636 ) ( not ( = ?auto_57632 ?auto_57636 ) ) ( not ( = ?auto_57633 ?auto_57636 ) ) ( not ( = ?auto_57634 ?auto_57636 ) ) ( ON-TABLE ?auto_57635 ) ( ON ?auto_57638 ?auto_57635 ) ( ON ?auto_57637 ?auto_57638 ) ( not ( = ?auto_57635 ?auto_57638 ) ) ( not ( = ?auto_57635 ?auto_57637 ) ) ( not ( = ?auto_57635 ?auto_57634 ) ) ( not ( = ?auto_57635 ?auto_57633 ) ) ( not ( = ?auto_57638 ?auto_57637 ) ) ( not ( = ?auto_57638 ?auto_57634 ) ) ( not ( = ?auto_57638 ?auto_57633 ) ) ( not ( = ?auto_57637 ?auto_57634 ) ) ( not ( = ?auto_57637 ?auto_57633 ) ) ( not ( = ?auto_57632 ?auto_57635 ) ) ( not ( = ?auto_57632 ?auto_57638 ) ) ( not ( = ?auto_57632 ?auto_57637 ) ) ( not ( = ?auto_57636 ?auto_57635 ) ) ( not ( = ?auto_57636 ?auto_57638 ) ) ( not ( = ?auto_57636 ?auto_57637 ) ) ( ON ?auto_57633 ?auto_57632 ) ( ON-TABLE ?auto_57636 ) ( CLEAR ?auto_57637 ) ( ON ?auto_57634 ?auto_57633 ) ( CLEAR ?auto_57634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57636 ?auto_57632 ?auto_57633 )
      ( MAKE-2PILE ?auto_57632 ?auto_57633 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_57639 - BLOCK
      ?auto_57640 - BLOCK
    )
    :vars
    (
      ?auto_57644 - BLOCK
      ?auto_57643 - BLOCK
      ?auto_57645 - BLOCK
      ?auto_57642 - BLOCK
      ?auto_57641 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57639 ?auto_57640 ) ) ( not ( = ?auto_57639 ?auto_57644 ) ) ( not ( = ?auto_57640 ?auto_57644 ) ) ( ON ?auto_57639 ?auto_57643 ) ( not ( = ?auto_57639 ?auto_57643 ) ) ( not ( = ?auto_57640 ?auto_57643 ) ) ( not ( = ?auto_57644 ?auto_57643 ) ) ( ON-TABLE ?auto_57645 ) ( ON ?auto_57642 ?auto_57645 ) ( not ( = ?auto_57645 ?auto_57642 ) ) ( not ( = ?auto_57645 ?auto_57641 ) ) ( not ( = ?auto_57645 ?auto_57644 ) ) ( not ( = ?auto_57645 ?auto_57640 ) ) ( not ( = ?auto_57642 ?auto_57641 ) ) ( not ( = ?auto_57642 ?auto_57644 ) ) ( not ( = ?auto_57642 ?auto_57640 ) ) ( not ( = ?auto_57641 ?auto_57644 ) ) ( not ( = ?auto_57641 ?auto_57640 ) ) ( not ( = ?auto_57639 ?auto_57645 ) ) ( not ( = ?auto_57639 ?auto_57642 ) ) ( not ( = ?auto_57639 ?auto_57641 ) ) ( not ( = ?auto_57643 ?auto_57645 ) ) ( not ( = ?auto_57643 ?auto_57642 ) ) ( not ( = ?auto_57643 ?auto_57641 ) ) ( ON ?auto_57640 ?auto_57639 ) ( ON-TABLE ?auto_57643 ) ( ON ?auto_57644 ?auto_57640 ) ( CLEAR ?auto_57644 ) ( HOLDING ?auto_57641 ) ( CLEAR ?auto_57642 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57645 ?auto_57642 ?auto_57641 )
      ( MAKE-2PILE ?auto_57639 ?auto_57640 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_57646 - BLOCK
      ?auto_57647 - BLOCK
    )
    :vars
    (
      ?auto_57652 - BLOCK
      ?auto_57648 - BLOCK
      ?auto_57649 - BLOCK
      ?auto_57651 - BLOCK
      ?auto_57650 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57646 ?auto_57647 ) ) ( not ( = ?auto_57646 ?auto_57652 ) ) ( not ( = ?auto_57647 ?auto_57652 ) ) ( ON ?auto_57646 ?auto_57648 ) ( not ( = ?auto_57646 ?auto_57648 ) ) ( not ( = ?auto_57647 ?auto_57648 ) ) ( not ( = ?auto_57652 ?auto_57648 ) ) ( ON-TABLE ?auto_57649 ) ( ON ?auto_57651 ?auto_57649 ) ( not ( = ?auto_57649 ?auto_57651 ) ) ( not ( = ?auto_57649 ?auto_57650 ) ) ( not ( = ?auto_57649 ?auto_57652 ) ) ( not ( = ?auto_57649 ?auto_57647 ) ) ( not ( = ?auto_57651 ?auto_57650 ) ) ( not ( = ?auto_57651 ?auto_57652 ) ) ( not ( = ?auto_57651 ?auto_57647 ) ) ( not ( = ?auto_57650 ?auto_57652 ) ) ( not ( = ?auto_57650 ?auto_57647 ) ) ( not ( = ?auto_57646 ?auto_57649 ) ) ( not ( = ?auto_57646 ?auto_57651 ) ) ( not ( = ?auto_57646 ?auto_57650 ) ) ( not ( = ?auto_57648 ?auto_57649 ) ) ( not ( = ?auto_57648 ?auto_57651 ) ) ( not ( = ?auto_57648 ?auto_57650 ) ) ( ON ?auto_57647 ?auto_57646 ) ( ON-TABLE ?auto_57648 ) ( ON ?auto_57652 ?auto_57647 ) ( CLEAR ?auto_57651 ) ( ON ?auto_57650 ?auto_57652 ) ( CLEAR ?auto_57650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57648 ?auto_57646 ?auto_57647 ?auto_57652 )
      ( MAKE-2PILE ?auto_57646 ?auto_57647 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_57653 - BLOCK
      ?auto_57654 - BLOCK
    )
    :vars
    (
      ?auto_57658 - BLOCK
      ?auto_57657 - BLOCK
      ?auto_57659 - BLOCK
      ?auto_57655 - BLOCK
      ?auto_57656 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57653 ?auto_57654 ) ) ( not ( = ?auto_57653 ?auto_57658 ) ) ( not ( = ?auto_57654 ?auto_57658 ) ) ( ON ?auto_57653 ?auto_57657 ) ( not ( = ?auto_57653 ?auto_57657 ) ) ( not ( = ?auto_57654 ?auto_57657 ) ) ( not ( = ?auto_57658 ?auto_57657 ) ) ( ON-TABLE ?auto_57659 ) ( not ( = ?auto_57659 ?auto_57655 ) ) ( not ( = ?auto_57659 ?auto_57656 ) ) ( not ( = ?auto_57659 ?auto_57658 ) ) ( not ( = ?auto_57659 ?auto_57654 ) ) ( not ( = ?auto_57655 ?auto_57656 ) ) ( not ( = ?auto_57655 ?auto_57658 ) ) ( not ( = ?auto_57655 ?auto_57654 ) ) ( not ( = ?auto_57656 ?auto_57658 ) ) ( not ( = ?auto_57656 ?auto_57654 ) ) ( not ( = ?auto_57653 ?auto_57659 ) ) ( not ( = ?auto_57653 ?auto_57655 ) ) ( not ( = ?auto_57653 ?auto_57656 ) ) ( not ( = ?auto_57657 ?auto_57659 ) ) ( not ( = ?auto_57657 ?auto_57655 ) ) ( not ( = ?auto_57657 ?auto_57656 ) ) ( ON ?auto_57654 ?auto_57653 ) ( ON-TABLE ?auto_57657 ) ( ON ?auto_57658 ?auto_57654 ) ( ON ?auto_57656 ?auto_57658 ) ( CLEAR ?auto_57656 ) ( HOLDING ?auto_57655 ) ( CLEAR ?auto_57659 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57659 ?auto_57655 )
      ( MAKE-2PILE ?auto_57653 ?auto_57654 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_57660 - BLOCK
      ?auto_57661 - BLOCK
    )
    :vars
    (
      ?auto_57663 - BLOCK
      ?auto_57662 - BLOCK
      ?auto_57665 - BLOCK
      ?auto_57664 - BLOCK
      ?auto_57666 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57660 ?auto_57661 ) ) ( not ( = ?auto_57660 ?auto_57663 ) ) ( not ( = ?auto_57661 ?auto_57663 ) ) ( ON ?auto_57660 ?auto_57662 ) ( not ( = ?auto_57660 ?auto_57662 ) ) ( not ( = ?auto_57661 ?auto_57662 ) ) ( not ( = ?auto_57663 ?auto_57662 ) ) ( ON-TABLE ?auto_57665 ) ( not ( = ?auto_57665 ?auto_57664 ) ) ( not ( = ?auto_57665 ?auto_57666 ) ) ( not ( = ?auto_57665 ?auto_57663 ) ) ( not ( = ?auto_57665 ?auto_57661 ) ) ( not ( = ?auto_57664 ?auto_57666 ) ) ( not ( = ?auto_57664 ?auto_57663 ) ) ( not ( = ?auto_57664 ?auto_57661 ) ) ( not ( = ?auto_57666 ?auto_57663 ) ) ( not ( = ?auto_57666 ?auto_57661 ) ) ( not ( = ?auto_57660 ?auto_57665 ) ) ( not ( = ?auto_57660 ?auto_57664 ) ) ( not ( = ?auto_57660 ?auto_57666 ) ) ( not ( = ?auto_57662 ?auto_57665 ) ) ( not ( = ?auto_57662 ?auto_57664 ) ) ( not ( = ?auto_57662 ?auto_57666 ) ) ( ON ?auto_57661 ?auto_57660 ) ( ON-TABLE ?auto_57662 ) ( ON ?auto_57663 ?auto_57661 ) ( ON ?auto_57666 ?auto_57663 ) ( CLEAR ?auto_57665 ) ( ON ?auto_57664 ?auto_57666 ) ( CLEAR ?auto_57664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_57662 ?auto_57660 ?auto_57661 ?auto_57663 ?auto_57666 )
      ( MAKE-2PILE ?auto_57660 ?auto_57661 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_57667 - BLOCK
      ?auto_57668 - BLOCK
    )
    :vars
    (
      ?auto_57669 - BLOCK
      ?auto_57670 - BLOCK
      ?auto_57672 - BLOCK
      ?auto_57673 - BLOCK
      ?auto_57671 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57667 ?auto_57668 ) ) ( not ( = ?auto_57667 ?auto_57669 ) ) ( not ( = ?auto_57668 ?auto_57669 ) ) ( ON ?auto_57667 ?auto_57670 ) ( not ( = ?auto_57667 ?auto_57670 ) ) ( not ( = ?auto_57668 ?auto_57670 ) ) ( not ( = ?auto_57669 ?auto_57670 ) ) ( not ( = ?auto_57672 ?auto_57673 ) ) ( not ( = ?auto_57672 ?auto_57671 ) ) ( not ( = ?auto_57672 ?auto_57669 ) ) ( not ( = ?auto_57672 ?auto_57668 ) ) ( not ( = ?auto_57673 ?auto_57671 ) ) ( not ( = ?auto_57673 ?auto_57669 ) ) ( not ( = ?auto_57673 ?auto_57668 ) ) ( not ( = ?auto_57671 ?auto_57669 ) ) ( not ( = ?auto_57671 ?auto_57668 ) ) ( not ( = ?auto_57667 ?auto_57672 ) ) ( not ( = ?auto_57667 ?auto_57673 ) ) ( not ( = ?auto_57667 ?auto_57671 ) ) ( not ( = ?auto_57670 ?auto_57672 ) ) ( not ( = ?auto_57670 ?auto_57673 ) ) ( not ( = ?auto_57670 ?auto_57671 ) ) ( ON ?auto_57668 ?auto_57667 ) ( ON-TABLE ?auto_57670 ) ( ON ?auto_57669 ?auto_57668 ) ( ON ?auto_57671 ?auto_57669 ) ( ON ?auto_57673 ?auto_57671 ) ( CLEAR ?auto_57673 ) ( HOLDING ?auto_57672 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_57672 )
      ( MAKE-2PILE ?auto_57667 ?auto_57668 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_57674 - BLOCK
      ?auto_57675 - BLOCK
    )
    :vars
    (
      ?auto_57680 - BLOCK
      ?auto_57676 - BLOCK
      ?auto_57678 - BLOCK
      ?auto_57679 - BLOCK
      ?auto_57677 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57674 ?auto_57675 ) ) ( not ( = ?auto_57674 ?auto_57680 ) ) ( not ( = ?auto_57675 ?auto_57680 ) ) ( ON ?auto_57674 ?auto_57676 ) ( not ( = ?auto_57674 ?auto_57676 ) ) ( not ( = ?auto_57675 ?auto_57676 ) ) ( not ( = ?auto_57680 ?auto_57676 ) ) ( not ( = ?auto_57678 ?auto_57679 ) ) ( not ( = ?auto_57678 ?auto_57677 ) ) ( not ( = ?auto_57678 ?auto_57680 ) ) ( not ( = ?auto_57678 ?auto_57675 ) ) ( not ( = ?auto_57679 ?auto_57677 ) ) ( not ( = ?auto_57679 ?auto_57680 ) ) ( not ( = ?auto_57679 ?auto_57675 ) ) ( not ( = ?auto_57677 ?auto_57680 ) ) ( not ( = ?auto_57677 ?auto_57675 ) ) ( not ( = ?auto_57674 ?auto_57678 ) ) ( not ( = ?auto_57674 ?auto_57679 ) ) ( not ( = ?auto_57674 ?auto_57677 ) ) ( not ( = ?auto_57676 ?auto_57678 ) ) ( not ( = ?auto_57676 ?auto_57679 ) ) ( not ( = ?auto_57676 ?auto_57677 ) ) ( ON ?auto_57675 ?auto_57674 ) ( ON-TABLE ?auto_57676 ) ( ON ?auto_57680 ?auto_57675 ) ( ON ?auto_57677 ?auto_57680 ) ( ON ?auto_57679 ?auto_57677 ) ( ON ?auto_57678 ?auto_57679 ) ( CLEAR ?auto_57678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_57676 ?auto_57674 ?auto_57675 ?auto_57680 ?auto_57677 ?auto_57679 )
      ( MAKE-2PILE ?auto_57674 ?auto_57675 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_57700 - BLOCK
      ?auto_57701 - BLOCK
      ?auto_57702 - BLOCK
    )
    :vars
    (
      ?auto_57704 - BLOCK
      ?auto_57703 - BLOCK
      ?auto_57705 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57704 ?auto_57702 ) ( ON-TABLE ?auto_57700 ) ( ON ?auto_57701 ?auto_57700 ) ( ON ?auto_57702 ?auto_57701 ) ( not ( = ?auto_57700 ?auto_57701 ) ) ( not ( = ?auto_57700 ?auto_57702 ) ) ( not ( = ?auto_57700 ?auto_57704 ) ) ( not ( = ?auto_57701 ?auto_57702 ) ) ( not ( = ?auto_57701 ?auto_57704 ) ) ( not ( = ?auto_57702 ?auto_57704 ) ) ( not ( = ?auto_57700 ?auto_57703 ) ) ( not ( = ?auto_57700 ?auto_57705 ) ) ( not ( = ?auto_57701 ?auto_57703 ) ) ( not ( = ?auto_57701 ?auto_57705 ) ) ( not ( = ?auto_57702 ?auto_57703 ) ) ( not ( = ?auto_57702 ?auto_57705 ) ) ( not ( = ?auto_57704 ?auto_57703 ) ) ( not ( = ?auto_57704 ?auto_57705 ) ) ( not ( = ?auto_57703 ?auto_57705 ) ) ( ON ?auto_57703 ?auto_57704 ) ( CLEAR ?auto_57703 ) ( HOLDING ?auto_57705 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_57705 )
      ( MAKE-3PILE ?auto_57700 ?auto_57701 ?auto_57702 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_57765 - BLOCK
      ?auto_57766 - BLOCK
      ?auto_57767 - BLOCK
    )
    :vars
    (
      ?auto_57768 - BLOCK
      ?auto_57769 - BLOCK
      ?auto_57770 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57765 ) ( not ( = ?auto_57765 ?auto_57766 ) ) ( not ( = ?auto_57765 ?auto_57767 ) ) ( not ( = ?auto_57766 ?auto_57767 ) ) ( ON ?auto_57767 ?auto_57768 ) ( not ( = ?auto_57765 ?auto_57768 ) ) ( not ( = ?auto_57766 ?auto_57768 ) ) ( not ( = ?auto_57767 ?auto_57768 ) ) ( CLEAR ?auto_57765 ) ( ON ?auto_57766 ?auto_57767 ) ( CLEAR ?auto_57766 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_57769 ) ( ON ?auto_57770 ?auto_57769 ) ( ON ?auto_57768 ?auto_57770 ) ( not ( = ?auto_57769 ?auto_57770 ) ) ( not ( = ?auto_57769 ?auto_57768 ) ) ( not ( = ?auto_57769 ?auto_57767 ) ) ( not ( = ?auto_57769 ?auto_57766 ) ) ( not ( = ?auto_57770 ?auto_57768 ) ) ( not ( = ?auto_57770 ?auto_57767 ) ) ( not ( = ?auto_57770 ?auto_57766 ) ) ( not ( = ?auto_57765 ?auto_57769 ) ) ( not ( = ?auto_57765 ?auto_57770 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57769 ?auto_57770 ?auto_57768 ?auto_57767 )
      ( MAKE-3PILE ?auto_57765 ?auto_57766 ?auto_57767 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_57771 - BLOCK
      ?auto_57772 - BLOCK
      ?auto_57773 - BLOCK
    )
    :vars
    (
      ?auto_57775 - BLOCK
      ?auto_57774 - BLOCK
      ?auto_57776 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57771 ?auto_57772 ) ) ( not ( = ?auto_57771 ?auto_57773 ) ) ( not ( = ?auto_57772 ?auto_57773 ) ) ( ON ?auto_57773 ?auto_57775 ) ( not ( = ?auto_57771 ?auto_57775 ) ) ( not ( = ?auto_57772 ?auto_57775 ) ) ( not ( = ?auto_57773 ?auto_57775 ) ) ( ON ?auto_57772 ?auto_57773 ) ( CLEAR ?auto_57772 ) ( ON-TABLE ?auto_57774 ) ( ON ?auto_57776 ?auto_57774 ) ( ON ?auto_57775 ?auto_57776 ) ( not ( = ?auto_57774 ?auto_57776 ) ) ( not ( = ?auto_57774 ?auto_57775 ) ) ( not ( = ?auto_57774 ?auto_57773 ) ) ( not ( = ?auto_57774 ?auto_57772 ) ) ( not ( = ?auto_57776 ?auto_57775 ) ) ( not ( = ?auto_57776 ?auto_57773 ) ) ( not ( = ?auto_57776 ?auto_57772 ) ) ( not ( = ?auto_57771 ?auto_57774 ) ) ( not ( = ?auto_57771 ?auto_57776 ) ) ( HOLDING ?auto_57771 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_57771 )
      ( MAKE-3PILE ?auto_57771 ?auto_57772 ?auto_57773 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_57777 - BLOCK
      ?auto_57778 - BLOCK
      ?auto_57779 - BLOCK
    )
    :vars
    (
      ?auto_57780 - BLOCK
      ?auto_57781 - BLOCK
      ?auto_57782 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57777 ?auto_57778 ) ) ( not ( = ?auto_57777 ?auto_57779 ) ) ( not ( = ?auto_57778 ?auto_57779 ) ) ( ON ?auto_57779 ?auto_57780 ) ( not ( = ?auto_57777 ?auto_57780 ) ) ( not ( = ?auto_57778 ?auto_57780 ) ) ( not ( = ?auto_57779 ?auto_57780 ) ) ( ON ?auto_57778 ?auto_57779 ) ( ON-TABLE ?auto_57781 ) ( ON ?auto_57782 ?auto_57781 ) ( ON ?auto_57780 ?auto_57782 ) ( not ( = ?auto_57781 ?auto_57782 ) ) ( not ( = ?auto_57781 ?auto_57780 ) ) ( not ( = ?auto_57781 ?auto_57779 ) ) ( not ( = ?auto_57781 ?auto_57778 ) ) ( not ( = ?auto_57782 ?auto_57780 ) ) ( not ( = ?auto_57782 ?auto_57779 ) ) ( not ( = ?auto_57782 ?auto_57778 ) ) ( not ( = ?auto_57777 ?auto_57781 ) ) ( not ( = ?auto_57777 ?auto_57782 ) ) ( ON ?auto_57777 ?auto_57778 ) ( CLEAR ?auto_57777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_57781 ?auto_57782 ?auto_57780 ?auto_57779 ?auto_57778 )
      ( MAKE-3PILE ?auto_57777 ?auto_57778 ?auto_57779 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_57786 - BLOCK
      ?auto_57787 - BLOCK
      ?auto_57788 - BLOCK
    )
    :vars
    (
      ?auto_57789 - BLOCK
      ?auto_57791 - BLOCK
      ?auto_57790 - BLOCK
      ?auto_57792 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57786 ?auto_57787 ) ) ( not ( = ?auto_57786 ?auto_57788 ) ) ( not ( = ?auto_57787 ?auto_57788 ) ) ( ON ?auto_57788 ?auto_57789 ) ( not ( = ?auto_57786 ?auto_57789 ) ) ( not ( = ?auto_57787 ?auto_57789 ) ) ( not ( = ?auto_57788 ?auto_57789 ) ) ( ON ?auto_57787 ?auto_57788 ) ( CLEAR ?auto_57787 ) ( ON-TABLE ?auto_57791 ) ( ON ?auto_57790 ?auto_57791 ) ( ON ?auto_57789 ?auto_57790 ) ( not ( = ?auto_57791 ?auto_57790 ) ) ( not ( = ?auto_57791 ?auto_57789 ) ) ( not ( = ?auto_57791 ?auto_57788 ) ) ( not ( = ?auto_57791 ?auto_57787 ) ) ( not ( = ?auto_57790 ?auto_57789 ) ) ( not ( = ?auto_57790 ?auto_57788 ) ) ( not ( = ?auto_57790 ?auto_57787 ) ) ( not ( = ?auto_57786 ?auto_57791 ) ) ( not ( = ?auto_57786 ?auto_57790 ) ) ( ON ?auto_57786 ?auto_57792 ) ( CLEAR ?auto_57786 ) ( HAND-EMPTY ) ( not ( = ?auto_57786 ?auto_57792 ) ) ( not ( = ?auto_57787 ?auto_57792 ) ) ( not ( = ?auto_57788 ?auto_57792 ) ) ( not ( = ?auto_57789 ?auto_57792 ) ) ( not ( = ?auto_57791 ?auto_57792 ) ) ( not ( = ?auto_57790 ?auto_57792 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_57786 ?auto_57792 )
      ( MAKE-3PILE ?auto_57786 ?auto_57787 ?auto_57788 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_57793 - BLOCK
      ?auto_57794 - BLOCK
      ?auto_57795 - BLOCK
    )
    :vars
    (
      ?auto_57798 - BLOCK
      ?auto_57796 - BLOCK
      ?auto_57797 - BLOCK
      ?auto_57799 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57793 ?auto_57794 ) ) ( not ( = ?auto_57793 ?auto_57795 ) ) ( not ( = ?auto_57794 ?auto_57795 ) ) ( ON ?auto_57795 ?auto_57798 ) ( not ( = ?auto_57793 ?auto_57798 ) ) ( not ( = ?auto_57794 ?auto_57798 ) ) ( not ( = ?auto_57795 ?auto_57798 ) ) ( ON-TABLE ?auto_57796 ) ( ON ?auto_57797 ?auto_57796 ) ( ON ?auto_57798 ?auto_57797 ) ( not ( = ?auto_57796 ?auto_57797 ) ) ( not ( = ?auto_57796 ?auto_57798 ) ) ( not ( = ?auto_57796 ?auto_57795 ) ) ( not ( = ?auto_57796 ?auto_57794 ) ) ( not ( = ?auto_57797 ?auto_57798 ) ) ( not ( = ?auto_57797 ?auto_57795 ) ) ( not ( = ?auto_57797 ?auto_57794 ) ) ( not ( = ?auto_57793 ?auto_57796 ) ) ( not ( = ?auto_57793 ?auto_57797 ) ) ( ON ?auto_57793 ?auto_57799 ) ( CLEAR ?auto_57793 ) ( not ( = ?auto_57793 ?auto_57799 ) ) ( not ( = ?auto_57794 ?auto_57799 ) ) ( not ( = ?auto_57795 ?auto_57799 ) ) ( not ( = ?auto_57798 ?auto_57799 ) ) ( not ( = ?auto_57796 ?auto_57799 ) ) ( not ( = ?auto_57797 ?auto_57799 ) ) ( HOLDING ?auto_57794 ) ( CLEAR ?auto_57795 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_57796 ?auto_57797 ?auto_57798 ?auto_57795 ?auto_57794 )
      ( MAKE-3PILE ?auto_57793 ?auto_57794 ?auto_57795 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_57800 - BLOCK
      ?auto_57801 - BLOCK
      ?auto_57802 - BLOCK
    )
    :vars
    (
      ?auto_57803 - BLOCK
      ?auto_57804 - BLOCK
      ?auto_57805 - BLOCK
      ?auto_57806 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57800 ?auto_57801 ) ) ( not ( = ?auto_57800 ?auto_57802 ) ) ( not ( = ?auto_57801 ?auto_57802 ) ) ( ON ?auto_57802 ?auto_57803 ) ( not ( = ?auto_57800 ?auto_57803 ) ) ( not ( = ?auto_57801 ?auto_57803 ) ) ( not ( = ?auto_57802 ?auto_57803 ) ) ( ON-TABLE ?auto_57804 ) ( ON ?auto_57805 ?auto_57804 ) ( ON ?auto_57803 ?auto_57805 ) ( not ( = ?auto_57804 ?auto_57805 ) ) ( not ( = ?auto_57804 ?auto_57803 ) ) ( not ( = ?auto_57804 ?auto_57802 ) ) ( not ( = ?auto_57804 ?auto_57801 ) ) ( not ( = ?auto_57805 ?auto_57803 ) ) ( not ( = ?auto_57805 ?auto_57802 ) ) ( not ( = ?auto_57805 ?auto_57801 ) ) ( not ( = ?auto_57800 ?auto_57804 ) ) ( not ( = ?auto_57800 ?auto_57805 ) ) ( ON ?auto_57800 ?auto_57806 ) ( not ( = ?auto_57800 ?auto_57806 ) ) ( not ( = ?auto_57801 ?auto_57806 ) ) ( not ( = ?auto_57802 ?auto_57806 ) ) ( not ( = ?auto_57803 ?auto_57806 ) ) ( not ( = ?auto_57804 ?auto_57806 ) ) ( not ( = ?auto_57805 ?auto_57806 ) ) ( CLEAR ?auto_57802 ) ( ON ?auto_57801 ?auto_57800 ) ( CLEAR ?auto_57801 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_57806 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57806 ?auto_57800 )
      ( MAKE-3PILE ?auto_57800 ?auto_57801 ?auto_57802 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_57807 - BLOCK
      ?auto_57808 - BLOCK
      ?auto_57809 - BLOCK
    )
    :vars
    (
      ?auto_57810 - BLOCK
      ?auto_57811 - BLOCK
      ?auto_57813 - BLOCK
      ?auto_57812 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57807 ?auto_57808 ) ) ( not ( = ?auto_57807 ?auto_57809 ) ) ( not ( = ?auto_57808 ?auto_57809 ) ) ( not ( = ?auto_57807 ?auto_57810 ) ) ( not ( = ?auto_57808 ?auto_57810 ) ) ( not ( = ?auto_57809 ?auto_57810 ) ) ( ON-TABLE ?auto_57811 ) ( ON ?auto_57813 ?auto_57811 ) ( ON ?auto_57810 ?auto_57813 ) ( not ( = ?auto_57811 ?auto_57813 ) ) ( not ( = ?auto_57811 ?auto_57810 ) ) ( not ( = ?auto_57811 ?auto_57809 ) ) ( not ( = ?auto_57811 ?auto_57808 ) ) ( not ( = ?auto_57813 ?auto_57810 ) ) ( not ( = ?auto_57813 ?auto_57809 ) ) ( not ( = ?auto_57813 ?auto_57808 ) ) ( not ( = ?auto_57807 ?auto_57811 ) ) ( not ( = ?auto_57807 ?auto_57813 ) ) ( ON ?auto_57807 ?auto_57812 ) ( not ( = ?auto_57807 ?auto_57812 ) ) ( not ( = ?auto_57808 ?auto_57812 ) ) ( not ( = ?auto_57809 ?auto_57812 ) ) ( not ( = ?auto_57810 ?auto_57812 ) ) ( not ( = ?auto_57811 ?auto_57812 ) ) ( not ( = ?auto_57813 ?auto_57812 ) ) ( ON ?auto_57808 ?auto_57807 ) ( CLEAR ?auto_57808 ) ( ON-TABLE ?auto_57812 ) ( HOLDING ?auto_57809 ) ( CLEAR ?auto_57810 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57811 ?auto_57813 ?auto_57810 ?auto_57809 )
      ( MAKE-3PILE ?auto_57807 ?auto_57808 ?auto_57809 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_57814 - BLOCK
      ?auto_57815 - BLOCK
      ?auto_57816 - BLOCK
    )
    :vars
    (
      ?auto_57819 - BLOCK
      ?auto_57818 - BLOCK
      ?auto_57817 - BLOCK
      ?auto_57820 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57814 ?auto_57815 ) ) ( not ( = ?auto_57814 ?auto_57816 ) ) ( not ( = ?auto_57815 ?auto_57816 ) ) ( not ( = ?auto_57814 ?auto_57819 ) ) ( not ( = ?auto_57815 ?auto_57819 ) ) ( not ( = ?auto_57816 ?auto_57819 ) ) ( ON-TABLE ?auto_57818 ) ( ON ?auto_57817 ?auto_57818 ) ( ON ?auto_57819 ?auto_57817 ) ( not ( = ?auto_57818 ?auto_57817 ) ) ( not ( = ?auto_57818 ?auto_57819 ) ) ( not ( = ?auto_57818 ?auto_57816 ) ) ( not ( = ?auto_57818 ?auto_57815 ) ) ( not ( = ?auto_57817 ?auto_57819 ) ) ( not ( = ?auto_57817 ?auto_57816 ) ) ( not ( = ?auto_57817 ?auto_57815 ) ) ( not ( = ?auto_57814 ?auto_57818 ) ) ( not ( = ?auto_57814 ?auto_57817 ) ) ( ON ?auto_57814 ?auto_57820 ) ( not ( = ?auto_57814 ?auto_57820 ) ) ( not ( = ?auto_57815 ?auto_57820 ) ) ( not ( = ?auto_57816 ?auto_57820 ) ) ( not ( = ?auto_57819 ?auto_57820 ) ) ( not ( = ?auto_57818 ?auto_57820 ) ) ( not ( = ?auto_57817 ?auto_57820 ) ) ( ON ?auto_57815 ?auto_57814 ) ( ON-TABLE ?auto_57820 ) ( CLEAR ?auto_57819 ) ( ON ?auto_57816 ?auto_57815 ) ( CLEAR ?auto_57816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57820 ?auto_57814 ?auto_57815 )
      ( MAKE-3PILE ?auto_57814 ?auto_57815 ?auto_57816 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_57821 - BLOCK
      ?auto_57822 - BLOCK
      ?auto_57823 - BLOCK
    )
    :vars
    (
      ?auto_57826 - BLOCK
      ?auto_57825 - BLOCK
      ?auto_57827 - BLOCK
      ?auto_57824 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57821 ?auto_57822 ) ) ( not ( = ?auto_57821 ?auto_57823 ) ) ( not ( = ?auto_57822 ?auto_57823 ) ) ( not ( = ?auto_57821 ?auto_57826 ) ) ( not ( = ?auto_57822 ?auto_57826 ) ) ( not ( = ?auto_57823 ?auto_57826 ) ) ( ON-TABLE ?auto_57825 ) ( ON ?auto_57827 ?auto_57825 ) ( not ( = ?auto_57825 ?auto_57827 ) ) ( not ( = ?auto_57825 ?auto_57826 ) ) ( not ( = ?auto_57825 ?auto_57823 ) ) ( not ( = ?auto_57825 ?auto_57822 ) ) ( not ( = ?auto_57827 ?auto_57826 ) ) ( not ( = ?auto_57827 ?auto_57823 ) ) ( not ( = ?auto_57827 ?auto_57822 ) ) ( not ( = ?auto_57821 ?auto_57825 ) ) ( not ( = ?auto_57821 ?auto_57827 ) ) ( ON ?auto_57821 ?auto_57824 ) ( not ( = ?auto_57821 ?auto_57824 ) ) ( not ( = ?auto_57822 ?auto_57824 ) ) ( not ( = ?auto_57823 ?auto_57824 ) ) ( not ( = ?auto_57826 ?auto_57824 ) ) ( not ( = ?auto_57825 ?auto_57824 ) ) ( not ( = ?auto_57827 ?auto_57824 ) ) ( ON ?auto_57822 ?auto_57821 ) ( ON-TABLE ?auto_57824 ) ( ON ?auto_57823 ?auto_57822 ) ( CLEAR ?auto_57823 ) ( HOLDING ?auto_57826 ) ( CLEAR ?auto_57827 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57825 ?auto_57827 ?auto_57826 )
      ( MAKE-3PILE ?auto_57821 ?auto_57822 ?auto_57823 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_57828 - BLOCK
      ?auto_57829 - BLOCK
      ?auto_57830 - BLOCK
    )
    :vars
    (
      ?auto_57832 - BLOCK
      ?auto_57833 - BLOCK
      ?auto_57831 - BLOCK
      ?auto_57834 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57828 ?auto_57829 ) ) ( not ( = ?auto_57828 ?auto_57830 ) ) ( not ( = ?auto_57829 ?auto_57830 ) ) ( not ( = ?auto_57828 ?auto_57832 ) ) ( not ( = ?auto_57829 ?auto_57832 ) ) ( not ( = ?auto_57830 ?auto_57832 ) ) ( ON-TABLE ?auto_57833 ) ( ON ?auto_57831 ?auto_57833 ) ( not ( = ?auto_57833 ?auto_57831 ) ) ( not ( = ?auto_57833 ?auto_57832 ) ) ( not ( = ?auto_57833 ?auto_57830 ) ) ( not ( = ?auto_57833 ?auto_57829 ) ) ( not ( = ?auto_57831 ?auto_57832 ) ) ( not ( = ?auto_57831 ?auto_57830 ) ) ( not ( = ?auto_57831 ?auto_57829 ) ) ( not ( = ?auto_57828 ?auto_57833 ) ) ( not ( = ?auto_57828 ?auto_57831 ) ) ( ON ?auto_57828 ?auto_57834 ) ( not ( = ?auto_57828 ?auto_57834 ) ) ( not ( = ?auto_57829 ?auto_57834 ) ) ( not ( = ?auto_57830 ?auto_57834 ) ) ( not ( = ?auto_57832 ?auto_57834 ) ) ( not ( = ?auto_57833 ?auto_57834 ) ) ( not ( = ?auto_57831 ?auto_57834 ) ) ( ON ?auto_57829 ?auto_57828 ) ( ON-TABLE ?auto_57834 ) ( ON ?auto_57830 ?auto_57829 ) ( CLEAR ?auto_57831 ) ( ON ?auto_57832 ?auto_57830 ) ( CLEAR ?auto_57832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57834 ?auto_57828 ?auto_57829 ?auto_57830 )
      ( MAKE-3PILE ?auto_57828 ?auto_57829 ?auto_57830 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_57835 - BLOCK
      ?auto_57836 - BLOCK
      ?auto_57837 - BLOCK
    )
    :vars
    (
      ?auto_57838 - BLOCK
      ?auto_57841 - BLOCK
      ?auto_57839 - BLOCK
      ?auto_57840 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57835 ?auto_57836 ) ) ( not ( = ?auto_57835 ?auto_57837 ) ) ( not ( = ?auto_57836 ?auto_57837 ) ) ( not ( = ?auto_57835 ?auto_57838 ) ) ( not ( = ?auto_57836 ?auto_57838 ) ) ( not ( = ?auto_57837 ?auto_57838 ) ) ( ON-TABLE ?auto_57841 ) ( not ( = ?auto_57841 ?auto_57839 ) ) ( not ( = ?auto_57841 ?auto_57838 ) ) ( not ( = ?auto_57841 ?auto_57837 ) ) ( not ( = ?auto_57841 ?auto_57836 ) ) ( not ( = ?auto_57839 ?auto_57838 ) ) ( not ( = ?auto_57839 ?auto_57837 ) ) ( not ( = ?auto_57839 ?auto_57836 ) ) ( not ( = ?auto_57835 ?auto_57841 ) ) ( not ( = ?auto_57835 ?auto_57839 ) ) ( ON ?auto_57835 ?auto_57840 ) ( not ( = ?auto_57835 ?auto_57840 ) ) ( not ( = ?auto_57836 ?auto_57840 ) ) ( not ( = ?auto_57837 ?auto_57840 ) ) ( not ( = ?auto_57838 ?auto_57840 ) ) ( not ( = ?auto_57841 ?auto_57840 ) ) ( not ( = ?auto_57839 ?auto_57840 ) ) ( ON ?auto_57836 ?auto_57835 ) ( ON-TABLE ?auto_57840 ) ( ON ?auto_57837 ?auto_57836 ) ( ON ?auto_57838 ?auto_57837 ) ( CLEAR ?auto_57838 ) ( HOLDING ?auto_57839 ) ( CLEAR ?auto_57841 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57841 ?auto_57839 )
      ( MAKE-3PILE ?auto_57835 ?auto_57836 ?auto_57837 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_57842 - BLOCK
      ?auto_57843 - BLOCK
      ?auto_57844 - BLOCK
    )
    :vars
    (
      ?auto_57845 - BLOCK
      ?auto_57847 - BLOCK
      ?auto_57848 - BLOCK
      ?auto_57846 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57842 ?auto_57843 ) ) ( not ( = ?auto_57842 ?auto_57844 ) ) ( not ( = ?auto_57843 ?auto_57844 ) ) ( not ( = ?auto_57842 ?auto_57845 ) ) ( not ( = ?auto_57843 ?auto_57845 ) ) ( not ( = ?auto_57844 ?auto_57845 ) ) ( ON-TABLE ?auto_57847 ) ( not ( = ?auto_57847 ?auto_57848 ) ) ( not ( = ?auto_57847 ?auto_57845 ) ) ( not ( = ?auto_57847 ?auto_57844 ) ) ( not ( = ?auto_57847 ?auto_57843 ) ) ( not ( = ?auto_57848 ?auto_57845 ) ) ( not ( = ?auto_57848 ?auto_57844 ) ) ( not ( = ?auto_57848 ?auto_57843 ) ) ( not ( = ?auto_57842 ?auto_57847 ) ) ( not ( = ?auto_57842 ?auto_57848 ) ) ( ON ?auto_57842 ?auto_57846 ) ( not ( = ?auto_57842 ?auto_57846 ) ) ( not ( = ?auto_57843 ?auto_57846 ) ) ( not ( = ?auto_57844 ?auto_57846 ) ) ( not ( = ?auto_57845 ?auto_57846 ) ) ( not ( = ?auto_57847 ?auto_57846 ) ) ( not ( = ?auto_57848 ?auto_57846 ) ) ( ON ?auto_57843 ?auto_57842 ) ( ON-TABLE ?auto_57846 ) ( ON ?auto_57844 ?auto_57843 ) ( ON ?auto_57845 ?auto_57844 ) ( CLEAR ?auto_57847 ) ( ON ?auto_57848 ?auto_57845 ) ( CLEAR ?auto_57848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_57846 ?auto_57842 ?auto_57843 ?auto_57844 ?auto_57845 )
      ( MAKE-3PILE ?auto_57842 ?auto_57843 ?auto_57844 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_57849 - BLOCK
      ?auto_57850 - BLOCK
      ?auto_57851 - BLOCK
    )
    :vars
    (
      ?auto_57852 - BLOCK
      ?auto_57854 - BLOCK
      ?auto_57855 - BLOCK
      ?auto_57853 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57849 ?auto_57850 ) ) ( not ( = ?auto_57849 ?auto_57851 ) ) ( not ( = ?auto_57850 ?auto_57851 ) ) ( not ( = ?auto_57849 ?auto_57852 ) ) ( not ( = ?auto_57850 ?auto_57852 ) ) ( not ( = ?auto_57851 ?auto_57852 ) ) ( not ( = ?auto_57854 ?auto_57855 ) ) ( not ( = ?auto_57854 ?auto_57852 ) ) ( not ( = ?auto_57854 ?auto_57851 ) ) ( not ( = ?auto_57854 ?auto_57850 ) ) ( not ( = ?auto_57855 ?auto_57852 ) ) ( not ( = ?auto_57855 ?auto_57851 ) ) ( not ( = ?auto_57855 ?auto_57850 ) ) ( not ( = ?auto_57849 ?auto_57854 ) ) ( not ( = ?auto_57849 ?auto_57855 ) ) ( ON ?auto_57849 ?auto_57853 ) ( not ( = ?auto_57849 ?auto_57853 ) ) ( not ( = ?auto_57850 ?auto_57853 ) ) ( not ( = ?auto_57851 ?auto_57853 ) ) ( not ( = ?auto_57852 ?auto_57853 ) ) ( not ( = ?auto_57854 ?auto_57853 ) ) ( not ( = ?auto_57855 ?auto_57853 ) ) ( ON ?auto_57850 ?auto_57849 ) ( ON-TABLE ?auto_57853 ) ( ON ?auto_57851 ?auto_57850 ) ( ON ?auto_57852 ?auto_57851 ) ( ON ?auto_57855 ?auto_57852 ) ( CLEAR ?auto_57855 ) ( HOLDING ?auto_57854 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_57854 )
      ( MAKE-3PILE ?auto_57849 ?auto_57850 ?auto_57851 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_57856 - BLOCK
      ?auto_57857 - BLOCK
      ?auto_57858 - BLOCK
    )
    :vars
    (
      ?auto_57861 - BLOCK
      ?auto_57860 - BLOCK
      ?auto_57862 - BLOCK
      ?auto_57859 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57856 ?auto_57857 ) ) ( not ( = ?auto_57856 ?auto_57858 ) ) ( not ( = ?auto_57857 ?auto_57858 ) ) ( not ( = ?auto_57856 ?auto_57861 ) ) ( not ( = ?auto_57857 ?auto_57861 ) ) ( not ( = ?auto_57858 ?auto_57861 ) ) ( not ( = ?auto_57860 ?auto_57862 ) ) ( not ( = ?auto_57860 ?auto_57861 ) ) ( not ( = ?auto_57860 ?auto_57858 ) ) ( not ( = ?auto_57860 ?auto_57857 ) ) ( not ( = ?auto_57862 ?auto_57861 ) ) ( not ( = ?auto_57862 ?auto_57858 ) ) ( not ( = ?auto_57862 ?auto_57857 ) ) ( not ( = ?auto_57856 ?auto_57860 ) ) ( not ( = ?auto_57856 ?auto_57862 ) ) ( ON ?auto_57856 ?auto_57859 ) ( not ( = ?auto_57856 ?auto_57859 ) ) ( not ( = ?auto_57857 ?auto_57859 ) ) ( not ( = ?auto_57858 ?auto_57859 ) ) ( not ( = ?auto_57861 ?auto_57859 ) ) ( not ( = ?auto_57860 ?auto_57859 ) ) ( not ( = ?auto_57862 ?auto_57859 ) ) ( ON ?auto_57857 ?auto_57856 ) ( ON-TABLE ?auto_57859 ) ( ON ?auto_57858 ?auto_57857 ) ( ON ?auto_57861 ?auto_57858 ) ( ON ?auto_57862 ?auto_57861 ) ( ON ?auto_57860 ?auto_57862 ) ( CLEAR ?auto_57860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_57859 ?auto_57856 ?auto_57857 ?auto_57858 ?auto_57861 ?auto_57862 )
      ( MAKE-3PILE ?auto_57856 ?auto_57857 ?auto_57858 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_57878 - BLOCK
      ?auto_57879 - BLOCK
    )
    :vars
    (
      ?auto_57881 - BLOCK
      ?auto_57882 - BLOCK
      ?auto_57880 - BLOCK
      ?auto_57883 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57881 ?auto_57879 ) ( ON-TABLE ?auto_57878 ) ( ON ?auto_57879 ?auto_57878 ) ( not ( = ?auto_57878 ?auto_57879 ) ) ( not ( = ?auto_57878 ?auto_57881 ) ) ( not ( = ?auto_57879 ?auto_57881 ) ) ( not ( = ?auto_57878 ?auto_57882 ) ) ( not ( = ?auto_57878 ?auto_57880 ) ) ( not ( = ?auto_57879 ?auto_57882 ) ) ( not ( = ?auto_57879 ?auto_57880 ) ) ( not ( = ?auto_57881 ?auto_57882 ) ) ( not ( = ?auto_57881 ?auto_57880 ) ) ( not ( = ?auto_57882 ?auto_57880 ) ) ( ON ?auto_57882 ?auto_57881 ) ( CLEAR ?auto_57882 ) ( HOLDING ?auto_57880 ) ( CLEAR ?auto_57883 ) ( ON-TABLE ?auto_57883 ) ( not ( = ?auto_57883 ?auto_57880 ) ) ( not ( = ?auto_57878 ?auto_57883 ) ) ( not ( = ?auto_57879 ?auto_57883 ) ) ( not ( = ?auto_57881 ?auto_57883 ) ) ( not ( = ?auto_57882 ?auto_57883 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57883 ?auto_57880 )
      ( MAKE-2PILE ?auto_57878 ?auto_57879 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_57884 - BLOCK
      ?auto_57885 - BLOCK
    )
    :vars
    (
      ?auto_57887 - BLOCK
      ?auto_57886 - BLOCK
      ?auto_57889 - BLOCK
      ?auto_57888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57887 ?auto_57885 ) ( ON-TABLE ?auto_57884 ) ( ON ?auto_57885 ?auto_57884 ) ( not ( = ?auto_57884 ?auto_57885 ) ) ( not ( = ?auto_57884 ?auto_57887 ) ) ( not ( = ?auto_57885 ?auto_57887 ) ) ( not ( = ?auto_57884 ?auto_57886 ) ) ( not ( = ?auto_57884 ?auto_57889 ) ) ( not ( = ?auto_57885 ?auto_57886 ) ) ( not ( = ?auto_57885 ?auto_57889 ) ) ( not ( = ?auto_57887 ?auto_57886 ) ) ( not ( = ?auto_57887 ?auto_57889 ) ) ( not ( = ?auto_57886 ?auto_57889 ) ) ( ON ?auto_57886 ?auto_57887 ) ( CLEAR ?auto_57888 ) ( ON-TABLE ?auto_57888 ) ( not ( = ?auto_57888 ?auto_57889 ) ) ( not ( = ?auto_57884 ?auto_57888 ) ) ( not ( = ?auto_57885 ?auto_57888 ) ) ( not ( = ?auto_57887 ?auto_57888 ) ) ( not ( = ?auto_57886 ?auto_57888 ) ) ( ON ?auto_57889 ?auto_57886 ) ( CLEAR ?auto_57889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57884 ?auto_57885 ?auto_57887 ?auto_57886 )
      ( MAKE-2PILE ?auto_57884 ?auto_57885 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_57890 - BLOCK
      ?auto_57891 - BLOCK
    )
    :vars
    (
      ?auto_57893 - BLOCK
      ?auto_57894 - BLOCK
      ?auto_57892 - BLOCK
      ?auto_57895 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57893 ?auto_57891 ) ( ON-TABLE ?auto_57890 ) ( ON ?auto_57891 ?auto_57890 ) ( not ( = ?auto_57890 ?auto_57891 ) ) ( not ( = ?auto_57890 ?auto_57893 ) ) ( not ( = ?auto_57891 ?auto_57893 ) ) ( not ( = ?auto_57890 ?auto_57894 ) ) ( not ( = ?auto_57890 ?auto_57892 ) ) ( not ( = ?auto_57891 ?auto_57894 ) ) ( not ( = ?auto_57891 ?auto_57892 ) ) ( not ( = ?auto_57893 ?auto_57894 ) ) ( not ( = ?auto_57893 ?auto_57892 ) ) ( not ( = ?auto_57894 ?auto_57892 ) ) ( ON ?auto_57894 ?auto_57893 ) ( not ( = ?auto_57895 ?auto_57892 ) ) ( not ( = ?auto_57890 ?auto_57895 ) ) ( not ( = ?auto_57891 ?auto_57895 ) ) ( not ( = ?auto_57893 ?auto_57895 ) ) ( not ( = ?auto_57894 ?auto_57895 ) ) ( ON ?auto_57892 ?auto_57894 ) ( CLEAR ?auto_57892 ) ( HOLDING ?auto_57895 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_57895 )
      ( MAKE-2PILE ?auto_57890 ?auto_57891 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_57904 - BLOCK
      ?auto_57905 - BLOCK
    )
    :vars
    (
      ?auto_57906 - BLOCK
      ?auto_57908 - BLOCK
      ?auto_57909 - BLOCK
      ?auto_57907 - BLOCK
      ?auto_57910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57906 ?auto_57905 ) ( ON-TABLE ?auto_57904 ) ( ON ?auto_57905 ?auto_57904 ) ( not ( = ?auto_57904 ?auto_57905 ) ) ( not ( = ?auto_57904 ?auto_57906 ) ) ( not ( = ?auto_57905 ?auto_57906 ) ) ( not ( = ?auto_57904 ?auto_57908 ) ) ( not ( = ?auto_57904 ?auto_57909 ) ) ( not ( = ?auto_57905 ?auto_57908 ) ) ( not ( = ?auto_57905 ?auto_57909 ) ) ( not ( = ?auto_57906 ?auto_57908 ) ) ( not ( = ?auto_57906 ?auto_57909 ) ) ( not ( = ?auto_57908 ?auto_57909 ) ) ( ON ?auto_57908 ?auto_57906 ) ( not ( = ?auto_57907 ?auto_57909 ) ) ( not ( = ?auto_57904 ?auto_57907 ) ) ( not ( = ?auto_57905 ?auto_57907 ) ) ( not ( = ?auto_57906 ?auto_57907 ) ) ( not ( = ?auto_57908 ?auto_57907 ) ) ( ON ?auto_57909 ?auto_57908 ) ( CLEAR ?auto_57909 ) ( ON ?auto_57907 ?auto_57910 ) ( CLEAR ?auto_57907 ) ( HAND-EMPTY ) ( not ( = ?auto_57904 ?auto_57910 ) ) ( not ( = ?auto_57905 ?auto_57910 ) ) ( not ( = ?auto_57906 ?auto_57910 ) ) ( not ( = ?auto_57908 ?auto_57910 ) ) ( not ( = ?auto_57909 ?auto_57910 ) ) ( not ( = ?auto_57907 ?auto_57910 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_57907 ?auto_57910 )
      ( MAKE-2PILE ?auto_57904 ?auto_57905 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_57911 - BLOCK
      ?auto_57912 - BLOCK
    )
    :vars
    (
      ?auto_57916 - BLOCK
      ?auto_57917 - BLOCK
      ?auto_57915 - BLOCK
      ?auto_57914 - BLOCK
      ?auto_57913 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57916 ?auto_57912 ) ( ON-TABLE ?auto_57911 ) ( ON ?auto_57912 ?auto_57911 ) ( not ( = ?auto_57911 ?auto_57912 ) ) ( not ( = ?auto_57911 ?auto_57916 ) ) ( not ( = ?auto_57912 ?auto_57916 ) ) ( not ( = ?auto_57911 ?auto_57917 ) ) ( not ( = ?auto_57911 ?auto_57915 ) ) ( not ( = ?auto_57912 ?auto_57917 ) ) ( not ( = ?auto_57912 ?auto_57915 ) ) ( not ( = ?auto_57916 ?auto_57917 ) ) ( not ( = ?auto_57916 ?auto_57915 ) ) ( not ( = ?auto_57917 ?auto_57915 ) ) ( ON ?auto_57917 ?auto_57916 ) ( not ( = ?auto_57914 ?auto_57915 ) ) ( not ( = ?auto_57911 ?auto_57914 ) ) ( not ( = ?auto_57912 ?auto_57914 ) ) ( not ( = ?auto_57916 ?auto_57914 ) ) ( not ( = ?auto_57917 ?auto_57914 ) ) ( ON ?auto_57914 ?auto_57913 ) ( CLEAR ?auto_57914 ) ( not ( = ?auto_57911 ?auto_57913 ) ) ( not ( = ?auto_57912 ?auto_57913 ) ) ( not ( = ?auto_57916 ?auto_57913 ) ) ( not ( = ?auto_57917 ?auto_57913 ) ) ( not ( = ?auto_57915 ?auto_57913 ) ) ( not ( = ?auto_57914 ?auto_57913 ) ) ( HOLDING ?auto_57915 ) ( CLEAR ?auto_57917 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_57911 ?auto_57912 ?auto_57916 ?auto_57917 ?auto_57915 )
      ( MAKE-2PILE ?auto_57911 ?auto_57912 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57957 - BLOCK
      ?auto_57958 - BLOCK
      ?auto_57959 - BLOCK
      ?auto_57960 - BLOCK
    )
    :vars
    (
      ?auto_57961 - BLOCK
      ?auto_57962 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57957 ) ( ON ?auto_57958 ?auto_57957 ) ( not ( = ?auto_57957 ?auto_57958 ) ) ( not ( = ?auto_57957 ?auto_57959 ) ) ( not ( = ?auto_57957 ?auto_57960 ) ) ( not ( = ?auto_57958 ?auto_57959 ) ) ( not ( = ?auto_57958 ?auto_57960 ) ) ( not ( = ?auto_57959 ?auto_57960 ) ) ( ON ?auto_57960 ?auto_57961 ) ( not ( = ?auto_57957 ?auto_57961 ) ) ( not ( = ?auto_57958 ?auto_57961 ) ) ( not ( = ?auto_57959 ?auto_57961 ) ) ( not ( = ?auto_57960 ?auto_57961 ) ) ( CLEAR ?auto_57958 ) ( ON ?auto_57959 ?auto_57960 ) ( CLEAR ?auto_57959 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_57962 ) ( ON ?auto_57961 ?auto_57962 ) ( not ( = ?auto_57962 ?auto_57961 ) ) ( not ( = ?auto_57962 ?auto_57960 ) ) ( not ( = ?auto_57962 ?auto_57959 ) ) ( not ( = ?auto_57957 ?auto_57962 ) ) ( not ( = ?auto_57958 ?auto_57962 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57962 ?auto_57961 ?auto_57960 )
      ( MAKE-4PILE ?auto_57957 ?auto_57958 ?auto_57959 ?auto_57960 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57963 - BLOCK
      ?auto_57964 - BLOCK
      ?auto_57965 - BLOCK
      ?auto_57966 - BLOCK
    )
    :vars
    (
      ?auto_57968 - BLOCK
      ?auto_57967 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57963 ) ( not ( = ?auto_57963 ?auto_57964 ) ) ( not ( = ?auto_57963 ?auto_57965 ) ) ( not ( = ?auto_57963 ?auto_57966 ) ) ( not ( = ?auto_57964 ?auto_57965 ) ) ( not ( = ?auto_57964 ?auto_57966 ) ) ( not ( = ?auto_57965 ?auto_57966 ) ) ( ON ?auto_57966 ?auto_57968 ) ( not ( = ?auto_57963 ?auto_57968 ) ) ( not ( = ?auto_57964 ?auto_57968 ) ) ( not ( = ?auto_57965 ?auto_57968 ) ) ( not ( = ?auto_57966 ?auto_57968 ) ) ( ON ?auto_57965 ?auto_57966 ) ( CLEAR ?auto_57965 ) ( ON-TABLE ?auto_57967 ) ( ON ?auto_57968 ?auto_57967 ) ( not ( = ?auto_57967 ?auto_57968 ) ) ( not ( = ?auto_57967 ?auto_57966 ) ) ( not ( = ?auto_57967 ?auto_57965 ) ) ( not ( = ?auto_57963 ?auto_57967 ) ) ( not ( = ?auto_57964 ?auto_57967 ) ) ( HOLDING ?auto_57964 ) ( CLEAR ?auto_57963 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57963 ?auto_57964 )
      ( MAKE-4PILE ?auto_57963 ?auto_57964 ?auto_57965 ?auto_57966 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57969 - BLOCK
      ?auto_57970 - BLOCK
      ?auto_57971 - BLOCK
      ?auto_57972 - BLOCK
    )
    :vars
    (
      ?auto_57974 - BLOCK
      ?auto_57973 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57969 ) ( not ( = ?auto_57969 ?auto_57970 ) ) ( not ( = ?auto_57969 ?auto_57971 ) ) ( not ( = ?auto_57969 ?auto_57972 ) ) ( not ( = ?auto_57970 ?auto_57971 ) ) ( not ( = ?auto_57970 ?auto_57972 ) ) ( not ( = ?auto_57971 ?auto_57972 ) ) ( ON ?auto_57972 ?auto_57974 ) ( not ( = ?auto_57969 ?auto_57974 ) ) ( not ( = ?auto_57970 ?auto_57974 ) ) ( not ( = ?auto_57971 ?auto_57974 ) ) ( not ( = ?auto_57972 ?auto_57974 ) ) ( ON ?auto_57971 ?auto_57972 ) ( ON-TABLE ?auto_57973 ) ( ON ?auto_57974 ?auto_57973 ) ( not ( = ?auto_57973 ?auto_57974 ) ) ( not ( = ?auto_57973 ?auto_57972 ) ) ( not ( = ?auto_57973 ?auto_57971 ) ) ( not ( = ?auto_57969 ?auto_57973 ) ) ( not ( = ?auto_57970 ?auto_57973 ) ) ( CLEAR ?auto_57969 ) ( ON ?auto_57970 ?auto_57971 ) ( CLEAR ?auto_57970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57973 ?auto_57974 ?auto_57972 ?auto_57971 )
      ( MAKE-4PILE ?auto_57969 ?auto_57970 ?auto_57971 ?auto_57972 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57975 - BLOCK
      ?auto_57976 - BLOCK
      ?auto_57977 - BLOCK
      ?auto_57978 - BLOCK
    )
    :vars
    (
      ?auto_57979 - BLOCK
      ?auto_57980 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57975 ?auto_57976 ) ) ( not ( = ?auto_57975 ?auto_57977 ) ) ( not ( = ?auto_57975 ?auto_57978 ) ) ( not ( = ?auto_57976 ?auto_57977 ) ) ( not ( = ?auto_57976 ?auto_57978 ) ) ( not ( = ?auto_57977 ?auto_57978 ) ) ( ON ?auto_57978 ?auto_57979 ) ( not ( = ?auto_57975 ?auto_57979 ) ) ( not ( = ?auto_57976 ?auto_57979 ) ) ( not ( = ?auto_57977 ?auto_57979 ) ) ( not ( = ?auto_57978 ?auto_57979 ) ) ( ON ?auto_57977 ?auto_57978 ) ( ON-TABLE ?auto_57980 ) ( ON ?auto_57979 ?auto_57980 ) ( not ( = ?auto_57980 ?auto_57979 ) ) ( not ( = ?auto_57980 ?auto_57978 ) ) ( not ( = ?auto_57980 ?auto_57977 ) ) ( not ( = ?auto_57975 ?auto_57980 ) ) ( not ( = ?auto_57976 ?auto_57980 ) ) ( ON ?auto_57976 ?auto_57977 ) ( CLEAR ?auto_57976 ) ( HOLDING ?auto_57975 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_57975 )
      ( MAKE-4PILE ?auto_57975 ?auto_57976 ?auto_57977 ?auto_57978 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57981 - BLOCK
      ?auto_57982 - BLOCK
      ?auto_57983 - BLOCK
      ?auto_57984 - BLOCK
    )
    :vars
    (
      ?auto_57986 - BLOCK
      ?auto_57985 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57981 ?auto_57982 ) ) ( not ( = ?auto_57981 ?auto_57983 ) ) ( not ( = ?auto_57981 ?auto_57984 ) ) ( not ( = ?auto_57982 ?auto_57983 ) ) ( not ( = ?auto_57982 ?auto_57984 ) ) ( not ( = ?auto_57983 ?auto_57984 ) ) ( ON ?auto_57984 ?auto_57986 ) ( not ( = ?auto_57981 ?auto_57986 ) ) ( not ( = ?auto_57982 ?auto_57986 ) ) ( not ( = ?auto_57983 ?auto_57986 ) ) ( not ( = ?auto_57984 ?auto_57986 ) ) ( ON ?auto_57983 ?auto_57984 ) ( ON-TABLE ?auto_57985 ) ( ON ?auto_57986 ?auto_57985 ) ( not ( = ?auto_57985 ?auto_57986 ) ) ( not ( = ?auto_57985 ?auto_57984 ) ) ( not ( = ?auto_57985 ?auto_57983 ) ) ( not ( = ?auto_57981 ?auto_57985 ) ) ( not ( = ?auto_57982 ?auto_57985 ) ) ( ON ?auto_57982 ?auto_57983 ) ( ON ?auto_57981 ?auto_57982 ) ( CLEAR ?auto_57981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_57985 ?auto_57986 ?auto_57984 ?auto_57983 ?auto_57982 )
      ( MAKE-4PILE ?auto_57981 ?auto_57982 ?auto_57983 ?auto_57984 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57991 - BLOCK
      ?auto_57992 - BLOCK
      ?auto_57993 - BLOCK
      ?auto_57994 - BLOCK
    )
    :vars
    (
      ?auto_57996 - BLOCK
      ?auto_57995 - BLOCK
      ?auto_57997 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57991 ?auto_57992 ) ) ( not ( = ?auto_57991 ?auto_57993 ) ) ( not ( = ?auto_57991 ?auto_57994 ) ) ( not ( = ?auto_57992 ?auto_57993 ) ) ( not ( = ?auto_57992 ?auto_57994 ) ) ( not ( = ?auto_57993 ?auto_57994 ) ) ( ON ?auto_57994 ?auto_57996 ) ( not ( = ?auto_57991 ?auto_57996 ) ) ( not ( = ?auto_57992 ?auto_57996 ) ) ( not ( = ?auto_57993 ?auto_57996 ) ) ( not ( = ?auto_57994 ?auto_57996 ) ) ( ON ?auto_57993 ?auto_57994 ) ( ON-TABLE ?auto_57995 ) ( ON ?auto_57996 ?auto_57995 ) ( not ( = ?auto_57995 ?auto_57996 ) ) ( not ( = ?auto_57995 ?auto_57994 ) ) ( not ( = ?auto_57995 ?auto_57993 ) ) ( not ( = ?auto_57991 ?auto_57995 ) ) ( not ( = ?auto_57992 ?auto_57995 ) ) ( ON ?auto_57992 ?auto_57993 ) ( CLEAR ?auto_57992 ) ( ON ?auto_57991 ?auto_57997 ) ( CLEAR ?auto_57991 ) ( HAND-EMPTY ) ( not ( = ?auto_57991 ?auto_57997 ) ) ( not ( = ?auto_57992 ?auto_57997 ) ) ( not ( = ?auto_57993 ?auto_57997 ) ) ( not ( = ?auto_57994 ?auto_57997 ) ) ( not ( = ?auto_57996 ?auto_57997 ) ) ( not ( = ?auto_57995 ?auto_57997 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_57991 ?auto_57997 )
      ( MAKE-4PILE ?auto_57991 ?auto_57992 ?auto_57993 ?auto_57994 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57998 - BLOCK
      ?auto_57999 - BLOCK
      ?auto_58000 - BLOCK
      ?auto_58001 - BLOCK
    )
    :vars
    (
      ?auto_58002 - BLOCK
      ?auto_58004 - BLOCK
      ?auto_58003 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57998 ?auto_57999 ) ) ( not ( = ?auto_57998 ?auto_58000 ) ) ( not ( = ?auto_57998 ?auto_58001 ) ) ( not ( = ?auto_57999 ?auto_58000 ) ) ( not ( = ?auto_57999 ?auto_58001 ) ) ( not ( = ?auto_58000 ?auto_58001 ) ) ( ON ?auto_58001 ?auto_58002 ) ( not ( = ?auto_57998 ?auto_58002 ) ) ( not ( = ?auto_57999 ?auto_58002 ) ) ( not ( = ?auto_58000 ?auto_58002 ) ) ( not ( = ?auto_58001 ?auto_58002 ) ) ( ON ?auto_58000 ?auto_58001 ) ( ON-TABLE ?auto_58004 ) ( ON ?auto_58002 ?auto_58004 ) ( not ( = ?auto_58004 ?auto_58002 ) ) ( not ( = ?auto_58004 ?auto_58001 ) ) ( not ( = ?auto_58004 ?auto_58000 ) ) ( not ( = ?auto_57998 ?auto_58004 ) ) ( not ( = ?auto_57999 ?auto_58004 ) ) ( ON ?auto_57998 ?auto_58003 ) ( CLEAR ?auto_57998 ) ( not ( = ?auto_57998 ?auto_58003 ) ) ( not ( = ?auto_57999 ?auto_58003 ) ) ( not ( = ?auto_58000 ?auto_58003 ) ) ( not ( = ?auto_58001 ?auto_58003 ) ) ( not ( = ?auto_58002 ?auto_58003 ) ) ( not ( = ?auto_58004 ?auto_58003 ) ) ( HOLDING ?auto_57999 ) ( CLEAR ?auto_58000 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58004 ?auto_58002 ?auto_58001 ?auto_58000 ?auto_57999 )
      ( MAKE-4PILE ?auto_57998 ?auto_57999 ?auto_58000 ?auto_58001 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58005 - BLOCK
      ?auto_58006 - BLOCK
      ?auto_58007 - BLOCK
      ?auto_58008 - BLOCK
    )
    :vars
    (
      ?auto_58009 - BLOCK
      ?auto_58010 - BLOCK
      ?auto_58011 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58005 ?auto_58006 ) ) ( not ( = ?auto_58005 ?auto_58007 ) ) ( not ( = ?auto_58005 ?auto_58008 ) ) ( not ( = ?auto_58006 ?auto_58007 ) ) ( not ( = ?auto_58006 ?auto_58008 ) ) ( not ( = ?auto_58007 ?auto_58008 ) ) ( ON ?auto_58008 ?auto_58009 ) ( not ( = ?auto_58005 ?auto_58009 ) ) ( not ( = ?auto_58006 ?auto_58009 ) ) ( not ( = ?auto_58007 ?auto_58009 ) ) ( not ( = ?auto_58008 ?auto_58009 ) ) ( ON ?auto_58007 ?auto_58008 ) ( ON-TABLE ?auto_58010 ) ( ON ?auto_58009 ?auto_58010 ) ( not ( = ?auto_58010 ?auto_58009 ) ) ( not ( = ?auto_58010 ?auto_58008 ) ) ( not ( = ?auto_58010 ?auto_58007 ) ) ( not ( = ?auto_58005 ?auto_58010 ) ) ( not ( = ?auto_58006 ?auto_58010 ) ) ( ON ?auto_58005 ?auto_58011 ) ( not ( = ?auto_58005 ?auto_58011 ) ) ( not ( = ?auto_58006 ?auto_58011 ) ) ( not ( = ?auto_58007 ?auto_58011 ) ) ( not ( = ?auto_58008 ?auto_58011 ) ) ( not ( = ?auto_58009 ?auto_58011 ) ) ( not ( = ?auto_58010 ?auto_58011 ) ) ( CLEAR ?auto_58007 ) ( ON ?auto_58006 ?auto_58005 ) ( CLEAR ?auto_58006 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_58011 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58011 ?auto_58005 )
      ( MAKE-4PILE ?auto_58005 ?auto_58006 ?auto_58007 ?auto_58008 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58012 - BLOCK
      ?auto_58013 - BLOCK
      ?auto_58014 - BLOCK
      ?auto_58015 - BLOCK
    )
    :vars
    (
      ?auto_58017 - BLOCK
      ?auto_58018 - BLOCK
      ?auto_58016 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58012 ?auto_58013 ) ) ( not ( = ?auto_58012 ?auto_58014 ) ) ( not ( = ?auto_58012 ?auto_58015 ) ) ( not ( = ?auto_58013 ?auto_58014 ) ) ( not ( = ?auto_58013 ?auto_58015 ) ) ( not ( = ?auto_58014 ?auto_58015 ) ) ( ON ?auto_58015 ?auto_58017 ) ( not ( = ?auto_58012 ?auto_58017 ) ) ( not ( = ?auto_58013 ?auto_58017 ) ) ( not ( = ?auto_58014 ?auto_58017 ) ) ( not ( = ?auto_58015 ?auto_58017 ) ) ( ON-TABLE ?auto_58018 ) ( ON ?auto_58017 ?auto_58018 ) ( not ( = ?auto_58018 ?auto_58017 ) ) ( not ( = ?auto_58018 ?auto_58015 ) ) ( not ( = ?auto_58018 ?auto_58014 ) ) ( not ( = ?auto_58012 ?auto_58018 ) ) ( not ( = ?auto_58013 ?auto_58018 ) ) ( ON ?auto_58012 ?auto_58016 ) ( not ( = ?auto_58012 ?auto_58016 ) ) ( not ( = ?auto_58013 ?auto_58016 ) ) ( not ( = ?auto_58014 ?auto_58016 ) ) ( not ( = ?auto_58015 ?auto_58016 ) ) ( not ( = ?auto_58017 ?auto_58016 ) ) ( not ( = ?auto_58018 ?auto_58016 ) ) ( ON ?auto_58013 ?auto_58012 ) ( CLEAR ?auto_58013 ) ( ON-TABLE ?auto_58016 ) ( HOLDING ?auto_58014 ) ( CLEAR ?auto_58015 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58018 ?auto_58017 ?auto_58015 ?auto_58014 )
      ( MAKE-4PILE ?auto_58012 ?auto_58013 ?auto_58014 ?auto_58015 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58019 - BLOCK
      ?auto_58020 - BLOCK
      ?auto_58021 - BLOCK
      ?auto_58022 - BLOCK
    )
    :vars
    (
      ?auto_58023 - BLOCK
      ?auto_58025 - BLOCK
      ?auto_58024 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58019 ?auto_58020 ) ) ( not ( = ?auto_58019 ?auto_58021 ) ) ( not ( = ?auto_58019 ?auto_58022 ) ) ( not ( = ?auto_58020 ?auto_58021 ) ) ( not ( = ?auto_58020 ?auto_58022 ) ) ( not ( = ?auto_58021 ?auto_58022 ) ) ( ON ?auto_58022 ?auto_58023 ) ( not ( = ?auto_58019 ?auto_58023 ) ) ( not ( = ?auto_58020 ?auto_58023 ) ) ( not ( = ?auto_58021 ?auto_58023 ) ) ( not ( = ?auto_58022 ?auto_58023 ) ) ( ON-TABLE ?auto_58025 ) ( ON ?auto_58023 ?auto_58025 ) ( not ( = ?auto_58025 ?auto_58023 ) ) ( not ( = ?auto_58025 ?auto_58022 ) ) ( not ( = ?auto_58025 ?auto_58021 ) ) ( not ( = ?auto_58019 ?auto_58025 ) ) ( not ( = ?auto_58020 ?auto_58025 ) ) ( ON ?auto_58019 ?auto_58024 ) ( not ( = ?auto_58019 ?auto_58024 ) ) ( not ( = ?auto_58020 ?auto_58024 ) ) ( not ( = ?auto_58021 ?auto_58024 ) ) ( not ( = ?auto_58022 ?auto_58024 ) ) ( not ( = ?auto_58023 ?auto_58024 ) ) ( not ( = ?auto_58025 ?auto_58024 ) ) ( ON ?auto_58020 ?auto_58019 ) ( ON-TABLE ?auto_58024 ) ( CLEAR ?auto_58022 ) ( ON ?auto_58021 ?auto_58020 ) ( CLEAR ?auto_58021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58024 ?auto_58019 ?auto_58020 )
      ( MAKE-4PILE ?auto_58019 ?auto_58020 ?auto_58021 ?auto_58022 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58026 - BLOCK
      ?auto_58027 - BLOCK
      ?auto_58028 - BLOCK
      ?auto_58029 - BLOCK
    )
    :vars
    (
      ?auto_58030 - BLOCK
      ?auto_58032 - BLOCK
      ?auto_58031 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58026 ?auto_58027 ) ) ( not ( = ?auto_58026 ?auto_58028 ) ) ( not ( = ?auto_58026 ?auto_58029 ) ) ( not ( = ?auto_58027 ?auto_58028 ) ) ( not ( = ?auto_58027 ?auto_58029 ) ) ( not ( = ?auto_58028 ?auto_58029 ) ) ( not ( = ?auto_58026 ?auto_58030 ) ) ( not ( = ?auto_58027 ?auto_58030 ) ) ( not ( = ?auto_58028 ?auto_58030 ) ) ( not ( = ?auto_58029 ?auto_58030 ) ) ( ON-TABLE ?auto_58032 ) ( ON ?auto_58030 ?auto_58032 ) ( not ( = ?auto_58032 ?auto_58030 ) ) ( not ( = ?auto_58032 ?auto_58029 ) ) ( not ( = ?auto_58032 ?auto_58028 ) ) ( not ( = ?auto_58026 ?auto_58032 ) ) ( not ( = ?auto_58027 ?auto_58032 ) ) ( ON ?auto_58026 ?auto_58031 ) ( not ( = ?auto_58026 ?auto_58031 ) ) ( not ( = ?auto_58027 ?auto_58031 ) ) ( not ( = ?auto_58028 ?auto_58031 ) ) ( not ( = ?auto_58029 ?auto_58031 ) ) ( not ( = ?auto_58030 ?auto_58031 ) ) ( not ( = ?auto_58032 ?auto_58031 ) ) ( ON ?auto_58027 ?auto_58026 ) ( ON-TABLE ?auto_58031 ) ( ON ?auto_58028 ?auto_58027 ) ( CLEAR ?auto_58028 ) ( HOLDING ?auto_58029 ) ( CLEAR ?auto_58030 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58032 ?auto_58030 ?auto_58029 )
      ( MAKE-4PILE ?auto_58026 ?auto_58027 ?auto_58028 ?auto_58029 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58033 - BLOCK
      ?auto_58034 - BLOCK
      ?auto_58035 - BLOCK
      ?auto_58036 - BLOCK
    )
    :vars
    (
      ?auto_58037 - BLOCK
      ?auto_58038 - BLOCK
      ?auto_58039 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58033 ?auto_58034 ) ) ( not ( = ?auto_58033 ?auto_58035 ) ) ( not ( = ?auto_58033 ?auto_58036 ) ) ( not ( = ?auto_58034 ?auto_58035 ) ) ( not ( = ?auto_58034 ?auto_58036 ) ) ( not ( = ?auto_58035 ?auto_58036 ) ) ( not ( = ?auto_58033 ?auto_58037 ) ) ( not ( = ?auto_58034 ?auto_58037 ) ) ( not ( = ?auto_58035 ?auto_58037 ) ) ( not ( = ?auto_58036 ?auto_58037 ) ) ( ON-TABLE ?auto_58038 ) ( ON ?auto_58037 ?auto_58038 ) ( not ( = ?auto_58038 ?auto_58037 ) ) ( not ( = ?auto_58038 ?auto_58036 ) ) ( not ( = ?auto_58038 ?auto_58035 ) ) ( not ( = ?auto_58033 ?auto_58038 ) ) ( not ( = ?auto_58034 ?auto_58038 ) ) ( ON ?auto_58033 ?auto_58039 ) ( not ( = ?auto_58033 ?auto_58039 ) ) ( not ( = ?auto_58034 ?auto_58039 ) ) ( not ( = ?auto_58035 ?auto_58039 ) ) ( not ( = ?auto_58036 ?auto_58039 ) ) ( not ( = ?auto_58037 ?auto_58039 ) ) ( not ( = ?auto_58038 ?auto_58039 ) ) ( ON ?auto_58034 ?auto_58033 ) ( ON-TABLE ?auto_58039 ) ( ON ?auto_58035 ?auto_58034 ) ( CLEAR ?auto_58037 ) ( ON ?auto_58036 ?auto_58035 ) ( CLEAR ?auto_58036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58039 ?auto_58033 ?auto_58034 ?auto_58035 )
      ( MAKE-4PILE ?auto_58033 ?auto_58034 ?auto_58035 ?auto_58036 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58040 - BLOCK
      ?auto_58041 - BLOCK
      ?auto_58042 - BLOCK
      ?auto_58043 - BLOCK
    )
    :vars
    (
      ?auto_58044 - BLOCK
      ?auto_58046 - BLOCK
      ?auto_58045 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58040 ?auto_58041 ) ) ( not ( = ?auto_58040 ?auto_58042 ) ) ( not ( = ?auto_58040 ?auto_58043 ) ) ( not ( = ?auto_58041 ?auto_58042 ) ) ( not ( = ?auto_58041 ?auto_58043 ) ) ( not ( = ?auto_58042 ?auto_58043 ) ) ( not ( = ?auto_58040 ?auto_58044 ) ) ( not ( = ?auto_58041 ?auto_58044 ) ) ( not ( = ?auto_58042 ?auto_58044 ) ) ( not ( = ?auto_58043 ?auto_58044 ) ) ( ON-TABLE ?auto_58046 ) ( not ( = ?auto_58046 ?auto_58044 ) ) ( not ( = ?auto_58046 ?auto_58043 ) ) ( not ( = ?auto_58046 ?auto_58042 ) ) ( not ( = ?auto_58040 ?auto_58046 ) ) ( not ( = ?auto_58041 ?auto_58046 ) ) ( ON ?auto_58040 ?auto_58045 ) ( not ( = ?auto_58040 ?auto_58045 ) ) ( not ( = ?auto_58041 ?auto_58045 ) ) ( not ( = ?auto_58042 ?auto_58045 ) ) ( not ( = ?auto_58043 ?auto_58045 ) ) ( not ( = ?auto_58044 ?auto_58045 ) ) ( not ( = ?auto_58046 ?auto_58045 ) ) ( ON ?auto_58041 ?auto_58040 ) ( ON-TABLE ?auto_58045 ) ( ON ?auto_58042 ?auto_58041 ) ( ON ?auto_58043 ?auto_58042 ) ( CLEAR ?auto_58043 ) ( HOLDING ?auto_58044 ) ( CLEAR ?auto_58046 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58046 ?auto_58044 )
      ( MAKE-4PILE ?auto_58040 ?auto_58041 ?auto_58042 ?auto_58043 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58047 - BLOCK
      ?auto_58048 - BLOCK
      ?auto_58049 - BLOCK
      ?auto_58050 - BLOCK
    )
    :vars
    (
      ?auto_58051 - BLOCK
      ?auto_58052 - BLOCK
      ?auto_58053 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58047 ?auto_58048 ) ) ( not ( = ?auto_58047 ?auto_58049 ) ) ( not ( = ?auto_58047 ?auto_58050 ) ) ( not ( = ?auto_58048 ?auto_58049 ) ) ( not ( = ?auto_58048 ?auto_58050 ) ) ( not ( = ?auto_58049 ?auto_58050 ) ) ( not ( = ?auto_58047 ?auto_58051 ) ) ( not ( = ?auto_58048 ?auto_58051 ) ) ( not ( = ?auto_58049 ?auto_58051 ) ) ( not ( = ?auto_58050 ?auto_58051 ) ) ( ON-TABLE ?auto_58052 ) ( not ( = ?auto_58052 ?auto_58051 ) ) ( not ( = ?auto_58052 ?auto_58050 ) ) ( not ( = ?auto_58052 ?auto_58049 ) ) ( not ( = ?auto_58047 ?auto_58052 ) ) ( not ( = ?auto_58048 ?auto_58052 ) ) ( ON ?auto_58047 ?auto_58053 ) ( not ( = ?auto_58047 ?auto_58053 ) ) ( not ( = ?auto_58048 ?auto_58053 ) ) ( not ( = ?auto_58049 ?auto_58053 ) ) ( not ( = ?auto_58050 ?auto_58053 ) ) ( not ( = ?auto_58051 ?auto_58053 ) ) ( not ( = ?auto_58052 ?auto_58053 ) ) ( ON ?auto_58048 ?auto_58047 ) ( ON-TABLE ?auto_58053 ) ( ON ?auto_58049 ?auto_58048 ) ( ON ?auto_58050 ?auto_58049 ) ( CLEAR ?auto_58052 ) ( ON ?auto_58051 ?auto_58050 ) ( CLEAR ?auto_58051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58053 ?auto_58047 ?auto_58048 ?auto_58049 ?auto_58050 )
      ( MAKE-4PILE ?auto_58047 ?auto_58048 ?auto_58049 ?auto_58050 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58054 - BLOCK
      ?auto_58055 - BLOCK
      ?auto_58056 - BLOCK
      ?auto_58057 - BLOCK
    )
    :vars
    (
      ?auto_58059 - BLOCK
      ?auto_58058 - BLOCK
      ?auto_58060 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58054 ?auto_58055 ) ) ( not ( = ?auto_58054 ?auto_58056 ) ) ( not ( = ?auto_58054 ?auto_58057 ) ) ( not ( = ?auto_58055 ?auto_58056 ) ) ( not ( = ?auto_58055 ?auto_58057 ) ) ( not ( = ?auto_58056 ?auto_58057 ) ) ( not ( = ?auto_58054 ?auto_58059 ) ) ( not ( = ?auto_58055 ?auto_58059 ) ) ( not ( = ?auto_58056 ?auto_58059 ) ) ( not ( = ?auto_58057 ?auto_58059 ) ) ( not ( = ?auto_58058 ?auto_58059 ) ) ( not ( = ?auto_58058 ?auto_58057 ) ) ( not ( = ?auto_58058 ?auto_58056 ) ) ( not ( = ?auto_58054 ?auto_58058 ) ) ( not ( = ?auto_58055 ?auto_58058 ) ) ( ON ?auto_58054 ?auto_58060 ) ( not ( = ?auto_58054 ?auto_58060 ) ) ( not ( = ?auto_58055 ?auto_58060 ) ) ( not ( = ?auto_58056 ?auto_58060 ) ) ( not ( = ?auto_58057 ?auto_58060 ) ) ( not ( = ?auto_58059 ?auto_58060 ) ) ( not ( = ?auto_58058 ?auto_58060 ) ) ( ON ?auto_58055 ?auto_58054 ) ( ON-TABLE ?auto_58060 ) ( ON ?auto_58056 ?auto_58055 ) ( ON ?auto_58057 ?auto_58056 ) ( ON ?auto_58059 ?auto_58057 ) ( CLEAR ?auto_58059 ) ( HOLDING ?auto_58058 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_58058 )
      ( MAKE-4PILE ?auto_58054 ?auto_58055 ?auto_58056 ?auto_58057 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58061 - BLOCK
      ?auto_58062 - BLOCK
      ?auto_58063 - BLOCK
      ?auto_58064 - BLOCK
    )
    :vars
    (
      ?auto_58065 - BLOCK
      ?auto_58066 - BLOCK
      ?auto_58067 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58061 ?auto_58062 ) ) ( not ( = ?auto_58061 ?auto_58063 ) ) ( not ( = ?auto_58061 ?auto_58064 ) ) ( not ( = ?auto_58062 ?auto_58063 ) ) ( not ( = ?auto_58062 ?auto_58064 ) ) ( not ( = ?auto_58063 ?auto_58064 ) ) ( not ( = ?auto_58061 ?auto_58065 ) ) ( not ( = ?auto_58062 ?auto_58065 ) ) ( not ( = ?auto_58063 ?auto_58065 ) ) ( not ( = ?auto_58064 ?auto_58065 ) ) ( not ( = ?auto_58066 ?auto_58065 ) ) ( not ( = ?auto_58066 ?auto_58064 ) ) ( not ( = ?auto_58066 ?auto_58063 ) ) ( not ( = ?auto_58061 ?auto_58066 ) ) ( not ( = ?auto_58062 ?auto_58066 ) ) ( ON ?auto_58061 ?auto_58067 ) ( not ( = ?auto_58061 ?auto_58067 ) ) ( not ( = ?auto_58062 ?auto_58067 ) ) ( not ( = ?auto_58063 ?auto_58067 ) ) ( not ( = ?auto_58064 ?auto_58067 ) ) ( not ( = ?auto_58065 ?auto_58067 ) ) ( not ( = ?auto_58066 ?auto_58067 ) ) ( ON ?auto_58062 ?auto_58061 ) ( ON-TABLE ?auto_58067 ) ( ON ?auto_58063 ?auto_58062 ) ( ON ?auto_58064 ?auto_58063 ) ( ON ?auto_58065 ?auto_58064 ) ( ON ?auto_58066 ?auto_58065 ) ( CLEAR ?auto_58066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_58067 ?auto_58061 ?auto_58062 ?auto_58063 ?auto_58064 ?auto_58065 )
      ( MAKE-4PILE ?auto_58061 ?auto_58062 ?auto_58063 ?auto_58064 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58079 - BLOCK
    )
    :vars
    (
      ?auto_58081 - BLOCK
      ?auto_58080 - BLOCK
      ?auto_58082 - BLOCK
      ?auto_58083 - BLOCK
      ?auto_58084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58081 ?auto_58079 ) ( ON-TABLE ?auto_58079 ) ( not ( = ?auto_58079 ?auto_58081 ) ) ( not ( = ?auto_58079 ?auto_58080 ) ) ( not ( = ?auto_58079 ?auto_58082 ) ) ( not ( = ?auto_58081 ?auto_58080 ) ) ( not ( = ?auto_58081 ?auto_58082 ) ) ( not ( = ?auto_58080 ?auto_58082 ) ) ( ON ?auto_58080 ?auto_58081 ) ( CLEAR ?auto_58080 ) ( HOLDING ?auto_58082 ) ( CLEAR ?auto_58083 ) ( ON-TABLE ?auto_58084 ) ( ON ?auto_58083 ?auto_58084 ) ( not ( = ?auto_58084 ?auto_58083 ) ) ( not ( = ?auto_58084 ?auto_58082 ) ) ( not ( = ?auto_58083 ?auto_58082 ) ) ( not ( = ?auto_58079 ?auto_58083 ) ) ( not ( = ?auto_58079 ?auto_58084 ) ) ( not ( = ?auto_58081 ?auto_58083 ) ) ( not ( = ?auto_58081 ?auto_58084 ) ) ( not ( = ?auto_58080 ?auto_58083 ) ) ( not ( = ?auto_58080 ?auto_58084 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58084 ?auto_58083 ?auto_58082 )
      ( MAKE-1PILE ?auto_58079 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58085 - BLOCK
    )
    :vars
    (
      ?auto_58090 - BLOCK
      ?auto_58086 - BLOCK
      ?auto_58087 - BLOCK
      ?auto_58089 - BLOCK
      ?auto_58088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58090 ?auto_58085 ) ( ON-TABLE ?auto_58085 ) ( not ( = ?auto_58085 ?auto_58090 ) ) ( not ( = ?auto_58085 ?auto_58086 ) ) ( not ( = ?auto_58085 ?auto_58087 ) ) ( not ( = ?auto_58090 ?auto_58086 ) ) ( not ( = ?auto_58090 ?auto_58087 ) ) ( not ( = ?auto_58086 ?auto_58087 ) ) ( ON ?auto_58086 ?auto_58090 ) ( CLEAR ?auto_58089 ) ( ON-TABLE ?auto_58088 ) ( ON ?auto_58089 ?auto_58088 ) ( not ( = ?auto_58088 ?auto_58089 ) ) ( not ( = ?auto_58088 ?auto_58087 ) ) ( not ( = ?auto_58089 ?auto_58087 ) ) ( not ( = ?auto_58085 ?auto_58089 ) ) ( not ( = ?auto_58085 ?auto_58088 ) ) ( not ( = ?auto_58090 ?auto_58089 ) ) ( not ( = ?auto_58090 ?auto_58088 ) ) ( not ( = ?auto_58086 ?auto_58089 ) ) ( not ( = ?auto_58086 ?auto_58088 ) ) ( ON ?auto_58087 ?auto_58086 ) ( CLEAR ?auto_58087 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58085 ?auto_58090 ?auto_58086 )
      ( MAKE-1PILE ?auto_58085 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58091 - BLOCK
    )
    :vars
    (
      ?auto_58092 - BLOCK
      ?auto_58093 - BLOCK
      ?auto_58095 - BLOCK
      ?auto_58094 - BLOCK
      ?auto_58096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58092 ?auto_58091 ) ( ON-TABLE ?auto_58091 ) ( not ( = ?auto_58091 ?auto_58092 ) ) ( not ( = ?auto_58091 ?auto_58093 ) ) ( not ( = ?auto_58091 ?auto_58095 ) ) ( not ( = ?auto_58092 ?auto_58093 ) ) ( not ( = ?auto_58092 ?auto_58095 ) ) ( not ( = ?auto_58093 ?auto_58095 ) ) ( ON ?auto_58093 ?auto_58092 ) ( ON-TABLE ?auto_58094 ) ( not ( = ?auto_58094 ?auto_58096 ) ) ( not ( = ?auto_58094 ?auto_58095 ) ) ( not ( = ?auto_58096 ?auto_58095 ) ) ( not ( = ?auto_58091 ?auto_58096 ) ) ( not ( = ?auto_58091 ?auto_58094 ) ) ( not ( = ?auto_58092 ?auto_58096 ) ) ( not ( = ?auto_58092 ?auto_58094 ) ) ( not ( = ?auto_58093 ?auto_58096 ) ) ( not ( = ?auto_58093 ?auto_58094 ) ) ( ON ?auto_58095 ?auto_58093 ) ( CLEAR ?auto_58095 ) ( HOLDING ?auto_58096 ) ( CLEAR ?auto_58094 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58094 ?auto_58096 )
      ( MAKE-1PILE ?auto_58091 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58097 - BLOCK
    )
    :vars
    (
      ?auto_58102 - BLOCK
      ?auto_58099 - BLOCK
      ?auto_58098 - BLOCK
      ?auto_58100 - BLOCK
      ?auto_58101 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58102 ?auto_58097 ) ( ON-TABLE ?auto_58097 ) ( not ( = ?auto_58097 ?auto_58102 ) ) ( not ( = ?auto_58097 ?auto_58099 ) ) ( not ( = ?auto_58097 ?auto_58098 ) ) ( not ( = ?auto_58102 ?auto_58099 ) ) ( not ( = ?auto_58102 ?auto_58098 ) ) ( not ( = ?auto_58099 ?auto_58098 ) ) ( ON ?auto_58099 ?auto_58102 ) ( ON-TABLE ?auto_58100 ) ( not ( = ?auto_58100 ?auto_58101 ) ) ( not ( = ?auto_58100 ?auto_58098 ) ) ( not ( = ?auto_58101 ?auto_58098 ) ) ( not ( = ?auto_58097 ?auto_58101 ) ) ( not ( = ?auto_58097 ?auto_58100 ) ) ( not ( = ?auto_58102 ?auto_58101 ) ) ( not ( = ?auto_58102 ?auto_58100 ) ) ( not ( = ?auto_58099 ?auto_58101 ) ) ( not ( = ?auto_58099 ?auto_58100 ) ) ( ON ?auto_58098 ?auto_58099 ) ( CLEAR ?auto_58100 ) ( ON ?auto_58101 ?auto_58098 ) ( CLEAR ?auto_58101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58097 ?auto_58102 ?auto_58099 ?auto_58098 )
      ( MAKE-1PILE ?auto_58097 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58103 - BLOCK
    )
    :vars
    (
      ?auto_58108 - BLOCK
      ?auto_58107 - BLOCK
      ?auto_58105 - BLOCK
      ?auto_58104 - BLOCK
      ?auto_58106 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58108 ?auto_58103 ) ( ON-TABLE ?auto_58103 ) ( not ( = ?auto_58103 ?auto_58108 ) ) ( not ( = ?auto_58103 ?auto_58107 ) ) ( not ( = ?auto_58103 ?auto_58105 ) ) ( not ( = ?auto_58108 ?auto_58107 ) ) ( not ( = ?auto_58108 ?auto_58105 ) ) ( not ( = ?auto_58107 ?auto_58105 ) ) ( ON ?auto_58107 ?auto_58108 ) ( not ( = ?auto_58104 ?auto_58106 ) ) ( not ( = ?auto_58104 ?auto_58105 ) ) ( not ( = ?auto_58106 ?auto_58105 ) ) ( not ( = ?auto_58103 ?auto_58106 ) ) ( not ( = ?auto_58103 ?auto_58104 ) ) ( not ( = ?auto_58108 ?auto_58106 ) ) ( not ( = ?auto_58108 ?auto_58104 ) ) ( not ( = ?auto_58107 ?auto_58106 ) ) ( not ( = ?auto_58107 ?auto_58104 ) ) ( ON ?auto_58105 ?auto_58107 ) ( ON ?auto_58106 ?auto_58105 ) ( CLEAR ?auto_58106 ) ( HOLDING ?auto_58104 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_58104 )
      ( MAKE-1PILE ?auto_58103 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58116 - BLOCK
    )
    :vars
    (
      ?auto_58117 - BLOCK
      ?auto_58120 - BLOCK
      ?auto_58118 - BLOCK
      ?auto_58121 - BLOCK
      ?auto_58119 - BLOCK
      ?auto_58122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58117 ?auto_58116 ) ( ON-TABLE ?auto_58116 ) ( not ( = ?auto_58116 ?auto_58117 ) ) ( not ( = ?auto_58116 ?auto_58120 ) ) ( not ( = ?auto_58116 ?auto_58118 ) ) ( not ( = ?auto_58117 ?auto_58120 ) ) ( not ( = ?auto_58117 ?auto_58118 ) ) ( not ( = ?auto_58120 ?auto_58118 ) ) ( ON ?auto_58120 ?auto_58117 ) ( not ( = ?auto_58121 ?auto_58119 ) ) ( not ( = ?auto_58121 ?auto_58118 ) ) ( not ( = ?auto_58119 ?auto_58118 ) ) ( not ( = ?auto_58116 ?auto_58119 ) ) ( not ( = ?auto_58116 ?auto_58121 ) ) ( not ( = ?auto_58117 ?auto_58119 ) ) ( not ( = ?auto_58117 ?auto_58121 ) ) ( not ( = ?auto_58120 ?auto_58119 ) ) ( not ( = ?auto_58120 ?auto_58121 ) ) ( ON ?auto_58118 ?auto_58120 ) ( ON ?auto_58119 ?auto_58118 ) ( CLEAR ?auto_58119 ) ( ON ?auto_58121 ?auto_58122 ) ( CLEAR ?auto_58121 ) ( HAND-EMPTY ) ( not ( = ?auto_58116 ?auto_58122 ) ) ( not ( = ?auto_58117 ?auto_58122 ) ) ( not ( = ?auto_58120 ?auto_58122 ) ) ( not ( = ?auto_58118 ?auto_58122 ) ) ( not ( = ?auto_58121 ?auto_58122 ) ) ( not ( = ?auto_58119 ?auto_58122 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_58121 ?auto_58122 )
      ( MAKE-1PILE ?auto_58116 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58123 - BLOCK
    )
    :vars
    (
      ?auto_58127 - BLOCK
      ?auto_58128 - BLOCK
      ?auto_58129 - BLOCK
      ?auto_58126 - BLOCK
      ?auto_58125 - BLOCK
      ?auto_58124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58127 ?auto_58123 ) ( ON-TABLE ?auto_58123 ) ( not ( = ?auto_58123 ?auto_58127 ) ) ( not ( = ?auto_58123 ?auto_58128 ) ) ( not ( = ?auto_58123 ?auto_58129 ) ) ( not ( = ?auto_58127 ?auto_58128 ) ) ( not ( = ?auto_58127 ?auto_58129 ) ) ( not ( = ?auto_58128 ?auto_58129 ) ) ( ON ?auto_58128 ?auto_58127 ) ( not ( = ?auto_58126 ?auto_58125 ) ) ( not ( = ?auto_58126 ?auto_58129 ) ) ( not ( = ?auto_58125 ?auto_58129 ) ) ( not ( = ?auto_58123 ?auto_58125 ) ) ( not ( = ?auto_58123 ?auto_58126 ) ) ( not ( = ?auto_58127 ?auto_58125 ) ) ( not ( = ?auto_58127 ?auto_58126 ) ) ( not ( = ?auto_58128 ?auto_58125 ) ) ( not ( = ?auto_58128 ?auto_58126 ) ) ( ON ?auto_58129 ?auto_58128 ) ( ON ?auto_58126 ?auto_58124 ) ( CLEAR ?auto_58126 ) ( not ( = ?auto_58123 ?auto_58124 ) ) ( not ( = ?auto_58127 ?auto_58124 ) ) ( not ( = ?auto_58128 ?auto_58124 ) ) ( not ( = ?auto_58129 ?auto_58124 ) ) ( not ( = ?auto_58126 ?auto_58124 ) ) ( not ( = ?auto_58125 ?auto_58124 ) ) ( HOLDING ?auto_58125 ) ( CLEAR ?auto_58129 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58123 ?auto_58127 ?auto_58128 ?auto_58129 ?auto_58125 )
      ( MAKE-1PILE ?auto_58123 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58130 - BLOCK
    )
    :vars
    (
      ?auto_58133 - BLOCK
      ?auto_58136 - BLOCK
      ?auto_58131 - BLOCK
      ?auto_58135 - BLOCK
      ?auto_58132 - BLOCK
      ?auto_58134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58133 ?auto_58130 ) ( ON-TABLE ?auto_58130 ) ( not ( = ?auto_58130 ?auto_58133 ) ) ( not ( = ?auto_58130 ?auto_58136 ) ) ( not ( = ?auto_58130 ?auto_58131 ) ) ( not ( = ?auto_58133 ?auto_58136 ) ) ( not ( = ?auto_58133 ?auto_58131 ) ) ( not ( = ?auto_58136 ?auto_58131 ) ) ( ON ?auto_58136 ?auto_58133 ) ( not ( = ?auto_58135 ?auto_58132 ) ) ( not ( = ?auto_58135 ?auto_58131 ) ) ( not ( = ?auto_58132 ?auto_58131 ) ) ( not ( = ?auto_58130 ?auto_58132 ) ) ( not ( = ?auto_58130 ?auto_58135 ) ) ( not ( = ?auto_58133 ?auto_58132 ) ) ( not ( = ?auto_58133 ?auto_58135 ) ) ( not ( = ?auto_58136 ?auto_58132 ) ) ( not ( = ?auto_58136 ?auto_58135 ) ) ( ON ?auto_58131 ?auto_58136 ) ( ON ?auto_58135 ?auto_58134 ) ( not ( = ?auto_58130 ?auto_58134 ) ) ( not ( = ?auto_58133 ?auto_58134 ) ) ( not ( = ?auto_58136 ?auto_58134 ) ) ( not ( = ?auto_58131 ?auto_58134 ) ) ( not ( = ?auto_58135 ?auto_58134 ) ) ( not ( = ?auto_58132 ?auto_58134 ) ) ( CLEAR ?auto_58131 ) ( ON ?auto_58132 ?auto_58135 ) ( CLEAR ?auto_58132 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_58134 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58134 ?auto_58135 )
      ( MAKE-1PILE ?auto_58130 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58170 - BLOCK
      ?auto_58171 - BLOCK
      ?auto_58172 - BLOCK
      ?auto_58173 - BLOCK
      ?auto_58174 - BLOCK
    )
    :vars
    (
      ?auto_58175 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58170 ) ( ON ?auto_58171 ?auto_58170 ) ( ON ?auto_58172 ?auto_58171 ) ( not ( = ?auto_58170 ?auto_58171 ) ) ( not ( = ?auto_58170 ?auto_58172 ) ) ( not ( = ?auto_58170 ?auto_58173 ) ) ( not ( = ?auto_58170 ?auto_58174 ) ) ( not ( = ?auto_58171 ?auto_58172 ) ) ( not ( = ?auto_58171 ?auto_58173 ) ) ( not ( = ?auto_58171 ?auto_58174 ) ) ( not ( = ?auto_58172 ?auto_58173 ) ) ( not ( = ?auto_58172 ?auto_58174 ) ) ( not ( = ?auto_58173 ?auto_58174 ) ) ( ON ?auto_58174 ?auto_58175 ) ( not ( = ?auto_58170 ?auto_58175 ) ) ( not ( = ?auto_58171 ?auto_58175 ) ) ( not ( = ?auto_58172 ?auto_58175 ) ) ( not ( = ?auto_58173 ?auto_58175 ) ) ( not ( = ?auto_58174 ?auto_58175 ) ) ( CLEAR ?auto_58172 ) ( ON ?auto_58173 ?auto_58174 ) ( CLEAR ?auto_58173 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_58175 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58175 ?auto_58174 )
      ( MAKE-5PILE ?auto_58170 ?auto_58171 ?auto_58172 ?auto_58173 ?auto_58174 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58176 - BLOCK
      ?auto_58177 - BLOCK
      ?auto_58178 - BLOCK
      ?auto_58179 - BLOCK
      ?auto_58180 - BLOCK
    )
    :vars
    (
      ?auto_58181 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58176 ) ( ON ?auto_58177 ?auto_58176 ) ( not ( = ?auto_58176 ?auto_58177 ) ) ( not ( = ?auto_58176 ?auto_58178 ) ) ( not ( = ?auto_58176 ?auto_58179 ) ) ( not ( = ?auto_58176 ?auto_58180 ) ) ( not ( = ?auto_58177 ?auto_58178 ) ) ( not ( = ?auto_58177 ?auto_58179 ) ) ( not ( = ?auto_58177 ?auto_58180 ) ) ( not ( = ?auto_58178 ?auto_58179 ) ) ( not ( = ?auto_58178 ?auto_58180 ) ) ( not ( = ?auto_58179 ?auto_58180 ) ) ( ON ?auto_58180 ?auto_58181 ) ( not ( = ?auto_58176 ?auto_58181 ) ) ( not ( = ?auto_58177 ?auto_58181 ) ) ( not ( = ?auto_58178 ?auto_58181 ) ) ( not ( = ?auto_58179 ?auto_58181 ) ) ( not ( = ?auto_58180 ?auto_58181 ) ) ( ON ?auto_58179 ?auto_58180 ) ( CLEAR ?auto_58179 ) ( ON-TABLE ?auto_58181 ) ( HOLDING ?auto_58178 ) ( CLEAR ?auto_58177 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58176 ?auto_58177 ?auto_58178 )
      ( MAKE-5PILE ?auto_58176 ?auto_58177 ?auto_58178 ?auto_58179 ?auto_58180 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58182 - BLOCK
      ?auto_58183 - BLOCK
      ?auto_58184 - BLOCK
      ?auto_58185 - BLOCK
      ?auto_58186 - BLOCK
    )
    :vars
    (
      ?auto_58187 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58182 ) ( ON ?auto_58183 ?auto_58182 ) ( not ( = ?auto_58182 ?auto_58183 ) ) ( not ( = ?auto_58182 ?auto_58184 ) ) ( not ( = ?auto_58182 ?auto_58185 ) ) ( not ( = ?auto_58182 ?auto_58186 ) ) ( not ( = ?auto_58183 ?auto_58184 ) ) ( not ( = ?auto_58183 ?auto_58185 ) ) ( not ( = ?auto_58183 ?auto_58186 ) ) ( not ( = ?auto_58184 ?auto_58185 ) ) ( not ( = ?auto_58184 ?auto_58186 ) ) ( not ( = ?auto_58185 ?auto_58186 ) ) ( ON ?auto_58186 ?auto_58187 ) ( not ( = ?auto_58182 ?auto_58187 ) ) ( not ( = ?auto_58183 ?auto_58187 ) ) ( not ( = ?auto_58184 ?auto_58187 ) ) ( not ( = ?auto_58185 ?auto_58187 ) ) ( not ( = ?auto_58186 ?auto_58187 ) ) ( ON ?auto_58185 ?auto_58186 ) ( ON-TABLE ?auto_58187 ) ( CLEAR ?auto_58183 ) ( ON ?auto_58184 ?auto_58185 ) ( CLEAR ?auto_58184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58187 ?auto_58186 ?auto_58185 )
      ( MAKE-5PILE ?auto_58182 ?auto_58183 ?auto_58184 ?auto_58185 ?auto_58186 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58188 - BLOCK
      ?auto_58189 - BLOCK
      ?auto_58190 - BLOCK
      ?auto_58191 - BLOCK
      ?auto_58192 - BLOCK
    )
    :vars
    (
      ?auto_58193 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58188 ) ( not ( = ?auto_58188 ?auto_58189 ) ) ( not ( = ?auto_58188 ?auto_58190 ) ) ( not ( = ?auto_58188 ?auto_58191 ) ) ( not ( = ?auto_58188 ?auto_58192 ) ) ( not ( = ?auto_58189 ?auto_58190 ) ) ( not ( = ?auto_58189 ?auto_58191 ) ) ( not ( = ?auto_58189 ?auto_58192 ) ) ( not ( = ?auto_58190 ?auto_58191 ) ) ( not ( = ?auto_58190 ?auto_58192 ) ) ( not ( = ?auto_58191 ?auto_58192 ) ) ( ON ?auto_58192 ?auto_58193 ) ( not ( = ?auto_58188 ?auto_58193 ) ) ( not ( = ?auto_58189 ?auto_58193 ) ) ( not ( = ?auto_58190 ?auto_58193 ) ) ( not ( = ?auto_58191 ?auto_58193 ) ) ( not ( = ?auto_58192 ?auto_58193 ) ) ( ON ?auto_58191 ?auto_58192 ) ( ON-TABLE ?auto_58193 ) ( ON ?auto_58190 ?auto_58191 ) ( CLEAR ?auto_58190 ) ( HOLDING ?auto_58189 ) ( CLEAR ?auto_58188 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58188 ?auto_58189 )
      ( MAKE-5PILE ?auto_58188 ?auto_58189 ?auto_58190 ?auto_58191 ?auto_58192 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58194 - BLOCK
      ?auto_58195 - BLOCK
      ?auto_58196 - BLOCK
      ?auto_58197 - BLOCK
      ?auto_58198 - BLOCK
    )
    :vars
    (
      ?auto_58199 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58194 ) ( not ( = ?auto_58194 ?auto_58195 ) ) ( not ( = ?auto_58194 ?auto_58196 ) ) ( not ( = ?auto_58194 ?auto_58197 ) ) ( not ( = ?auto_58194 ?auto_58198 ) ) ( not ( = ?auto_58195 ?auto_58196 ) ) ( not ( = ?auto_58195 ?auto_58197 ) ) ( not ( = ?auto_58195 ?auto_58198 ) ) ( not ( = ?auto_58196 ?auto_58197 ) ) ( not ( = ?auto_58196 ?auto_58198 ) ) ( not ( = ?auto_58197 ?auto_58198 ) ) ( ON ?auto_58198 ?auto_58199 ) ( not ( = ?auto_58194 ?auto_58199 ) ) ( not ( = ?auto_58195 ?auto_58199 ) ) ( not ( = ?auto_58196 ?auto_58199 ) ) ( not ( = ?auto_58197 ?auto_58199 ) ) ( not ( = ?auto_58198 ?auto_58199 ) ) ( ON ?auto_58197 ?auto_58198 ) ( ON-TABLE ?auto_58199 ) ( ON ?auto_58196 ?auto_58197 ) ( CLEAR ?auto_58194 ) ( ON ?auto_58195 ?auto_58196 ) ( CLEAR ?auto_58195 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58199 ?auto_58198 ?auto_58197 ?auto_58196 )
      ( MAKE-5PILE ?auto_58194 ?auto_58195 ?auto_58196 ?auto_58197 ?auto_58198 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58200 - BLOCK
      ?auto_58201 - BLOCK
      ?auto_58202 - BLOCK
      ?auto_58203 - BLOCK
      ?auto_58204 - BLOCK
    )
    :vars
    (
      ?auto_58205 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58200 ?auto_58201 ) ) ( not ( = ?auto_58200 ?auto_58202 ) ) ( not ( = ?auto_58200 ?auto_58203 ) ) ( not ( = ?auto_58200 ?auto_58204 ) ) ( not ( = ?auto_58201 ?auto_58202 ) ) ( not ( = ?auto_58201 ?auto_58203 ) ) ( not ( = ?auto_58201 ?auto_58204 ) ) ( not ( = ?auto_58202 ?auto_58203 ) ) ( not ( = ?auto_58202 ?auto_58204 ) ) ( not ( = ?auto_58203 ?auto_58204 ) ) ( ON ?auto_58204 ?auto_58205 ) ( not ( = ?auto_58200 ?auto_58205 ) ) ( not ( = ?auto_58201 ?auto_58205 ) ) ( not ( = ?auto_58202 ?auto_58205 ) ) ( not ( = ?auto_58203 ?auto_58205 ) ) ( not ( = ?auto_58204 ?auto_58205 ) ) ( ON ?auto_58203 ?auto_58204 ) ( ON-TABLE ?auto_58205 ) ( ON ?auto_58202 ?auto_58203 ) ( ON ?auto_58201 ?auto_58202 ) ( CLEAR ?auto_58201 ) ( HOLDING ?auto_58200 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_58200 )
      ( MAKE-5PILE ?auto_58200 ?auto_58201 ?auto_58202 ?auto_58203 ?auto_58204 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58206 - BLOCK
      ?auto_58207 - BLOCK
      ?auto_58208 - BLOCK
      ?auto_58209 - BLOCK
      ?auto_58210 - BLOCK
    )
    :vars
    (
      ?auto_58211 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58206 ?auto_58207 ) ) ( not ( = ?auto_58206 ?auto_58208 ) ) ( not ( = ?auto_58206 ?auto_58209 ) ) ( not ( = ?auto_58206 ?auto_58210 ) ) ( not ( = ?auto_58207 ?auto_58208 ) ) ( not ( = ?auto_58207 ?auto_58209 ) ) ( not ( = ?auto_58207 ?auto_58210 ) ) ( not ( = ?auto_58208 ?auto_58209 ) ) ( not ( = ?auto_58208 ?auto_58210 ) ) ( not ( = ?auto_58209 ?auto_58210 ) ) ( ON ?auto_58210 ?auto_58211 ) ( not ( = ?auto_58206 ?auto_58211 ) ) ( not ( = ?auto_58207 ?auto_58211 ) ) ( not ( = ?auto_58208 ?auto_58211 ) ) ( not ( = ?auto_58209 ?auto_58211 ) ) ( not ( = ?auto_58210 ?auto_58211 ) ) ( ON ?auto_58209 ?auto_58210 ) ( ON-TABLE ?auto_58211 ) ( ON ?auto_58208 ?auto_58209 ) ( ON ?auto_58207 ?auto_58208 ) ( ON ?auto_58206 ?auto_58207 ) ( CLEAR ?auto_58206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58211 ?auto_58210 ?auto_58209 ?auto_58208 ?auto_58207 )
      ( MAKE-5PILE ?auto_58206 ?auto_58207 ?auto_58208 ?auto_58209 ?auto_58210 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58217 - BLOCK
      ?auto_58218 - BLOCK
      ?auto_58219 - BLOCK
      ?auto_58220 - BLOCK
      ?auto_58221 - BLOCK
    )
    :vars
    (
      ?auto_58222 - BLOCK
      ?auto_58223 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58217 ?auto_58218 ) ) ( not ( = ?auto_58217 ?auto_58219 ) ) ( not ( = ?auto_58217 ?auto_58220 ) ) ( not ( = ?auto_58217 ?auto_58221 ) ) ( not ( = ?auto_58218 ?auto_58219 ) ) ( not ( = ?auto_58218 ?auto_58220 ) ) ( not ( = ?auto_58218 ?auto_58221 ) ) ( not ( = ?auto_58219 ?auto_58220 ) ) ( not ( = ?auto_58219 ?auto_58221 ) ) ( not ( = ?auto_58220 ?auto_58221 ) ) ( ON ?auto_58221 ?auto_58222 ) ( not ( = ?auto_58217 ?auto_58222 ) ) ( not ( = ?auto_58218 ?auto_58222 ) ) ( not ( = ?auto_58219 ?auto_58222 ) ) ( not ( = ?auto_58220 ?auto_58222 ) ) ( not ( = ?auto_58221 ?auto_58222 ) ) ( ON ?auto_58220 ?auto_58221 ) ( ON-TABLE ?auto_58222 ) ( ON ?auto_58219 ?auto_58220 ) ( ON ?auto_58218 ?auto_58219 ) ( CLEAR ?auto_58218 ) ( ON ?auto_58217 ?auto_58223 ) ( CLEAR ?auto_58217 ) ( HAND-EMPTY ) ( not ( = ?auto_58217 ?auto_58223 ) ) ( not ( = ?auto_58218 ?auto_58223 ) ) ( not ( = ?auto_58219 ?auto_58223 ) ) ( not ( = ?auto_58220 ?auto_58223 ) ) ( not ( = ?auto_58221 ?auto_58223 ) ) ( not ( = ?auto_58222 ?auto_58223 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_58217 ?auto_58223 )
      ( MAKE-5PILE ?auto_58217 ?auto_58218 ?auto_58219 ?auto_58220 ?auto_58221 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58224 - BLOCK
      ?auto_58225 - BLOCK
      ?auto_58226 - BLOCK
      ?auto_58227 - BLOCK
      ?auto_58228 - BLOCK
    )
    :vars
    (
      ?auto_58230 - BLOCK
      ?auto_58229 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58224 ?auto_58225 ) ) ( not ( = ?auto_58224 ?auto_58226 ) ) ( not ( = ?auto_58224 ?auto_58227 ) ) ( not ( = ?auto_58224 ?auto_58228 ) ) ( not ( = ?auto_58225 ?auto_58226 ) ) ( not ( = ?auto_58225 ?auto_58227 ) ) ( not ( = ?auto_58225 ?auto_58228 ) ) ( not ( = ?auto_58226 ?auto_58227 ) ) ( not ( = ?auto_58226 ?auto_58228 ) ) ( not ( = ?auto_58227 ?auto_58228 ) ) ( ON ?auto_58228 ?auto_58230 ) ( not ( = ?auto_58224 ?auto_58230 ) ) ( not ( = ?auto_58225 ?auto_58230 ) ) ( not ( = ?auto_58226 ?auto_58230 ) ) ( not ( = ?auto_58227 ?auto_58230 ) ) ( not ( = ?auto_58228 ?auto_58230 ) ) ( ON ?auto_58227 ?auto_58228 ) ( ON-TABLE ?auto_58230 ) ( ON ?auto_58226 ?auto_58227 ) ( ON ?auto_58224 ?auto_58229 ) ( CLEAR ?auto_58224 ) ( not ( = ?auto_58224 ?auto_58229 ) ) ( not ( = ?auto_58225 ?auto_58229 ) ) ( not ( = ?auto_58226 ?auto_58229 ) ) ( not ( = ?auto_58227 ?auto_58229 ) ) ( not ( = ?auto_58228 ?auto_58229 ) ) ( not ( = ?auto_58230 ?auto_58229 ) ) ( HOLDING ?auto_58225 ) ( CLEAR ?auto_58226 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58230 ?auto_58228 ?auto_58227 ?auto_58226 ?auto_58225 )
      ( MAKE-5PILE ?auto_58224 ?auto_58225 ?auto_58226 ?auto_58227 ?auto_58228 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58231 - BLOCK
      ?auto_58232 - BLOCK
      ?auto_58233 - BLOCK
      ?auto_58234 - BLOCK
      ?auto_58235 - BLOCK
    )
    :vars
    (
      ?auto_58236 - BLOCK
      ?auto_58237 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58231 ?auto_58232 ) ) ( not ( = ?auto_58231 ?auto_58233 ) ) ( not ( = ?auto_58231 ?auto_58234 ) ) ( not ( = ?auto_58231 ?auto_58235 ) ) ( not ( = ?auto_58232 ?auto_58233 ) ) ( not ( = ?auto_58232 ?auto_58234 ) ) ( not ( = ?auto_58232 ?auto_58235 ) ) ( not ( = ?auto_58233 ?auto_58234 ) ) ( not ( = ?auto_58233 ?auto_58235 ) ) ( not ( = ?auto_58234 ?auto_58235 ) ) ( ON ?auto_58235 ?auto_58236 ) ( not ( = ?auto_58231 ?auto_58236 ) ) ( not ( = ?auto_58232 ?auto_58236 ) ) ( not ( = ?auto_58233 ?auto_58236 ) ) ( not ( = ?auto_58234 ?auto_58236 ) ) ( not ( = ?auto_58235 ?auto_58236 ) ) ( ON ?auto_58234 ?auto_58235 ) ( ON-TABLE ?auto_58236 ) ( ON ?auto_58233 ?auto_58234 ) ( ON ?auto_58231 ?auto_58237 ) ( not ( = ?auto_58231 ?auto_58237 ) ) ( not ( = ?auto_58232 ?auto_58237 ) ) ( not ( = ?auto_58233 ?auto_58237 ) ) ( not ( = ?auto_58234 ?auto_58237 ) ) ( not ( = ?auto_58235 ?auto_58237 ) ) ( not ( = ?auto_58236 ?auto_58237 ) ) ( CLEAR ?auto_58233 ) ( ON ?auto_58232 ?auto_58231 ) ( CLEAR ?auto_58232 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_58237 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58237 ?auto_58231 )
      ( MAKE-5PILE ?auto_58231 ?auto_58232 ?auto_58233 ?auto_58234 ?auto_58235 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58238 - BLOCK
      ?auto_58239 - BLOCK
      ?auto_58240 - BLOCK
      ?auto_58241 - BLOCK
      ?auto_58242 - BLOCK
    )
    :vars
    (
      ?auto_58244 - BLOCK
      ?auto_58243 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58238 ?auto_58239 ) ) ( not ( = ?auto_58238 ?auto_58240 ) ) ( not ( = ?auto_58238 ?auto_58241 ) ) ( not ( = ?auto_58238 ?auto_58242 ) ) ( not ( = ?auto_58239 ?auto_58240 ) ) ( not ( = ?auto_58239 ?auto_58241 ) ) ( not ( = ?auto_58239 ?auto_58242 ) ) ( not ( = ?auto_58240 ?auto_58241 ) ) ( not ( = ?auto_58240 ?auto_58242 ) ) ( not ( = ?auto_58241 ?auto_58242 ) ) ( ON ?auto_58242 ?auto_58244 ) ( not ( = ?auto_58238 ?auto_58244 ) ) ( not ( = ?auto_58239 ?auto_58244 ) ) ( not ( = ?auto_58240 ?auto_58244 ) ) ( not ( = ?auto_58241 ?auto_58244 ) ) ( not ( = ?auto_58242 ?auto_58244 ) ) ( ON ?auto_58241 ?auto_58242 ) ( ON-TABLE ?auto_58244 ) ( ON ?auto_58238 ?auto_58243 ) ( not ( = ?auto_58238 ?auto_58243 ) ) ( not ( = ?auto_58239 ?auto_58243 ) ) ( not ( = ?auto_58240 ?auto_58243 ) ) ( not ( = ?auto_58241 ?auto_58243 ) ) ( not ( = ?auto_58242 ?auto_58243 ) ) ( not ( = ?auto_58244 ?auto_58243 ) ) ( ON ?auto_58239 ?auto_58238 ) ( CLEAR ?auto_58239 ) ( ON-TABLE ?auto_58243 ) ( HOLDING ?auto_58240 ) ( CLEAR ?auto_58241 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58244 ?auto_58242 ?auto_58241 ?auto_58240 )
      ( MAKE-5PILE ?auto_58238 ?auto_58239 ?auto_58240 ?auto_58241 ?auto_58242 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58245 - BLOCK
      ?auto_58246 - BLOCK
      ?auto_58247 - BLOCK
      ?auto_58248 - BLOCK
      ?auto_58249 - BLOCK
    )
    :vars
    (
      ?auto_58250 - BLOCK
      ?auto_58251 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58245 ?auto_58246 ) ) ( not ( = ?auto_58245 ?auto_58247 ) ) ( not ( = ?auto_58245 ?auto_58248 ) ) ( not ( = ?auto_58245 ?auto_58249 ) ) ( not ( = ?auto_58246 ?auto_58247 ) ) ( not ( = ?auto_58246 ?auto_58248 ) ) ( not ( = ?auto_58246 ?auto_58249 ) ) ( not ( = ?auto_58247 ?auto_58248 ) ) ( not ( = ?auto_58247 ?auto_58249 ) ) ( not ( = ?auto_58248 ?auto_58249 ) ) ( ON ?auto_58249 ?auto_58250 ) ( not ( = ?auto_58245 ?auto_58250 ) ) ( not ( = ?auto_58246 ?auto_58250 ) ) ( not ( = ?auto_58247 ?auto_58250 ) ) ( not ( = ?auto_58248 ?auto_58250 ) ) ( not ( = ?auto_58249 ?auto_58250 ) ) ( ON ?auto_58248 ?auto_58249 ) ( ON-TABLE ?auto_58250 ) ( ON ?auto_58245 ?auto_58251 ) ( not ( = ?auto_58245 ?auto_58251 ) ) ( not ( = ?auto_58246 ?auto_58251 ) ) ( not ( = ?auto_58247 ?auto_58251 ) ) ( not ( = ?auto_58248 ?auto_58251 ) ) ( not ( = ?auto_58249 ?auto_58251 ) ) ( not ( = ?auto_58250 ?auto_58251 ) ) ( ON ?auto_58246 ?auto_58245 ) ( ON-TABLE ?auto_58251 ) ( CLEAR ?auto_58248 ) ( ON ?auto_58247 ?auto_58246 ) ( CLEAR ?auto_58247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58251 ?auto_58245 ?auto_58246 )
      ( MAKE-5PILE ?auto_58245 ?auto_58246 ?auto_58247 ?auto_58248 ?auto_58249 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58252 - BLOCK
      ?auto_58253 - BLOCK
      ?auto_58254 - BLOCK
      ?auto_58255 - BLOCK
      ?auto_58256 - BLOCK
    )
    :vars
    (
      ?auto_58258 - BLOCK
      ?auto_58257 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58252 ?auto_58253 ) ) ( not ( = ?auto_58252 ?auto_58254 ) ) ( not ( = ?auto_58252 ?auto_58255 ) ) ( not ( = ?auto_58252 ?auto_58256 ) ) ( not ( = ?auto_58253 ?auto_58254 ) ) ( not ( = ?auto_58253 ?auto_58255 ) ) ( not ( = ?auto_58253 ?auto_58256 ) ) ( not ( = ?auto_58254 ?auto_58255 ) ) ( not ( = ?auto_58254 ?auto_58256 ) ) ( not ( = ?auto_58255 ?auto_58256 ) ) ( ON ?auto_58256 ?auto_58258 ) ( not ( = ?auto_58252 ?auto_58258 ) ) ( not ( = ?auto_58253 ?auto_58258 ) ) ( not ( = ?auto_58254 ?auto_58258 ) ) ( not ( = ?auto_58255 ?auto_58258 ) ) ( not ( = ?auto_58256 ?auto_58258 ) ) ( ON-TABLE ?auto_58258 ) ( ON ?auto_58252 ?auto_58257 ) ( not ( = ?auto_58252 ?auto_58257 ) ) ( not ( = ?auto_58253 ?auto_58257 ) ) ( not ( = ?auto_58254 ?auto_58257 ) ) ( not ( = ?auto_58255 ?auto_58257 ) ) ( not ( = ?auto_58256 ?auto_58257 ) ) ( not ( = ?auto_58258 ?auto_58257 ) ) ( ON ?auto_58253 ?auto_58252 ) ( ON-TABLE ?auto_58257 ) ( ON ?auto_58254 ?auto_58253 ) ( CLEAR ?auto_58254 ) ( HOLDING ?auto_58255 ) ( CLEAR ?auto_58256 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58258 ?auto_58256 ?auto_58255 )
      ( MAKE-5PILE ?auto_58252 ?auto_58253 ?auto_58254 ?auto_58255 ?auto_58256 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58259 - BLOCK
      ?auto_58260 - BLOCK
      ?auto_58261 - BLOCK
      ?auto_58262 - BLOCK
      ?auto_58263 - BLOCK
    )
    :vars
    (
      ?auto_58265 - BLOCK
      ?auto_58264 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58259 ?auto_58260 ) ) ( not ( = ?auto_58259 ?auto_58261 ) ) ( not ( = ?auto_58259 ?auto_58262 ) ) ( not ( = ?auto_58259 ?auto_58263 ) ) ( not ( = ?auto_58260 ?auto_58261 ) ) ( not ( = ?auto_58260 ?auto_58262 ) ) ( not ( = ?auto_58260 ?auto_58263 ) ) ( not ( = ?auto_58261 ?auto_58262 ) ) ( not ( = ?auto_58261 ?auto_58263 ) ) ( not ( = ?auto_58262 ?auto_58263 ) ) ( ON ?auto_58263 ?auto_58265 ) ( not ( = ?auto_58259 ?auto_58265 ) ) ( not ( = ?auto_58260 ?auto_58265 ) ) ( not ( = ?auto_58261 ?auto_58265 ) ) ( not ( = ?auto_58262 ?auto_58265 ) ) ( not ( = ?auto_58263 ?auto_58265 ) ) ( ON-TABLE ?auto_58265 ) ( ON ?auto_58259 ?auto_58264 ) ( not ( = ?auto_58259 ?auto_58264 ) ) ( not ( = ?auto_58260 ?auto_58264 ) ) ( not ( = ?auto_58261 ?auto_58264 ) ) ( not ( = ?auto_58262 ?auto_58264 ) ) ( not ( = ?auto_58263 ?auto_58264 ) ) ( not ( = ?auto_58265 ?auto_58264 ) ) ( ON ?auto_58260 ?auto_58259 ) ( ON-TABLE ?auto_58264 ) ( ON ?auto_58261 ?auto_58260 ) ( CLEAR ?auto_58263 ) ( ON ?auto_58262 ?auto_58261 ) ( CLEAR ?auto_58262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58264 ?auto_58259 ?auto_58260 ?auto_58261 )
      ( MAKE-5PILE ?auto_58259 ?auto_58260 ?auto_58261 ?auto_58262 ?auto_58263 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58266 - BLOCK
      ?auto_58267 - BLOCK
      ?auto_58268 - BLOCK
      ?auto_58269 - BLOCK
      ?auto_58270 - BLOCK
    )
    :vars
    (
      ?auto_58272 - BLOCK
      ?auto_58271 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58266 ?auto_58267 ) ) ( not ( = ?auto_58266 ?auto_58268 ) ) ( not ( = ?auto_58266 ?auto_58269 ) ) ( not ( = ?auto_58266 ?auto_58270 ) ) ( not ( = ?auto_58267 ?auto_58268 ) ) ( not ( = ?auto_58267 ?auto_58269 ) ) ( not ( = ?auto_58267 ?auto_58270 ) ) ( not ( = ?auto_58268 ?auto_58269 ) ) ( not ( = ?auto_58268 ?auto_58270 ) ) ( not ( = ?auto_58269 ?auto_58270 ) ) ( not ( = ?auto_58266 ?auto_58272 ) ) ( not ( = ?auto_58267 ?auto_58272 ) ) ( not ( = ?auto_58268 ?auto_58272 ) ) ( not ( = ?auto_58269 ?auto_58272 ) ) ( not ( = ?auto_58270 ?auto_58272 ) ) ( ON-TABLE ?auto_58272 ) ( ON ?auto_58266 ?auto_58271 ) ( not ( = ?auto_58266 ?auto_58271 ) ) ( not ( = ?auto_58267 ?auto_58271 ) ) ( not ( = ?auto_58268 ?auto_58271 ) ) ( not ( = ?auto_58269 ?auto_58271 ) ) ( not ( = ?auto_58270 ?auto_58271 ) ) ( not ( = ?auto_58272 ?auto_58271 ) ) ( ON ?auto_58267 ?auto_58266 ) ( ON-TABLE ?auto_58271 ) ( ON ?auto_58268 ?auto_58267 ) ( ON ?auto_58269 ?auto_58268 ) ( CLEAR ?auto_58269 ) ( HOLDING ?auto_58270 ) ( CLEAR ?auto_58272 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58272 ?auto_58270 )
      ( MAKE-5PILE ?auto_58266 ?auto_58267 ?auto_58268 ?auto_58269 ?auto_58270 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58273 - BLOCK
      ?auto_58274 - BLOCK
      ?auto_58275 - BLOCK
      ?auto_58276 - BLOCK
      ?auto_58277 - BLOCK
    )
    :vars
    (
      ?auto_58278 - BLOCK
      ?auto_58279 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58273 ?auto_58274 ) ) ( not ( = ?auto_58273 ?auto_58275 ) ) ( not ( = ?auto_58273 ?auto_58276 ) ) ( not ( = ?auto_58273 ?auto_58277 ) ) ( not ( = ?auto_58274 ?auto_58275 ) ) ( not ( = ?auto_58274 ?auto_58276 ) ) ( not ( = ?auto_58274 ?auto_58277 ) ) ( not ( = ?auto_58275 ?auto_58276 ) ) ( not ( = ?auto_58275 ?auto_58277 ) ) ( not ( = ?auto_58276 ?auto_58277 ) ) ( not ( = ?auto_58273 ?auto_58278 ) ) ( not ( = ?auto_58274 ?auto_58278 ) ) ( not ( = ?auto_58275 ?auto_58278 ) ) ( not ( = ?auto_58276 ?auto_58278 ) ) ( not ( = ?auto_58277 ?auto_58278 ) ) ( ON-TABLE ?auto_58278 ) ( ON ?auto_58273 ?auto_58279 ) ( not ( = ?auto_58273 ?auto_58279 ) ) ( not ( = ?auto_58274 ?auto_58279 ) ) ( not ( = ?auto_58275 ?auto_58279 ) ) ( not ( = ?auto_58276 ?auto_58279 ) ) ( not ( = ?auto_58277 ?auto_58279 ) ) ( not ( = ?auto_58278 ?auto_58279 ) ) ( ON ?auto_58274 ?auto_58273 ) ( ON-TABLE ?auto_58279 ) ( ON ?auto_58275 ?auto_58274 ) ( ON ?auto_58276 ?auto_58275 ) ( CLEAR ?auto_58278 ) ( ON ?auto_58277 ?auto_58276 ) ( CLEAR ?auto_58277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58279 ?auto_58273 ?auto_58274 ?auto_58275 ?auto_58276 )
      ( MAKE-5PILE ?auto_58273 ?auto_58274 ?auto_58275 ?auto_58276 ?auto_58277 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58280 - BLOCK
      ?auto_58281 - BLOCK
      ?auto_58282 - BLOCK
      ?auto_58283 - BLOCK
      ?auto_58284 - BLOCK
    )
    :vars
    (
      ?auto_58285 - BLOCK
      ?auto_58286 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58280 ?auto_58281 ) ) ( not ( = ?auto_58280 ?auto_58282 ) ) ( not ( = ?auto_58280 ?auto_58283 ) ) ( not ( = ?auto_58280 ?auto_58284 ) ) ( not ( = ?auto_58281 ?auto_58282 ) ) ( not ( = ?auto_58281 ?auto_58283 ) ) ( not ( = ?auto_58281 ?auto_58284 ) ) ( not ( = ?auto_58282 ?auto_58283 ) ) ( not ( = ?auto_58282 ?auto_58284 ) ) ( not ( = ?auto_58283 ?auto_58284 ) ) ( not ( = ?auto_58280 ?auto_58285 ) ) ( not ( = ?auto_58281 ?auto_58285 ) ) ( not ( = ?auto_58282 ?auto_58285 ) ) ( not ( = ?auto_58283 ?auto_58285 ) ) ( not ( = ?auto_58284 ?auto_58285 ) ) ( ON ?auto_58280 ?auto_58286 ) ( not ( = ?auto_58280 ?auto_58286 ) ) ( not ( = ?auto_58281 ?auto_58286 ) ) ( not ( = ?auto_58282 ?auto_58286 ) ) ( not ( = ?auto_58283 ?auto_58286 ) ) ( not ( = ?auto_58284 ?auto_58286 ) ) ( not ( = ?auto_58285 ?auto_58286 ) ) ( ON ?auto_58281 ?auto_58280 ) ( ON-TABLE ?auto_58286 ) ( ON ?auto_58282 ?auto_58281 ) ( ON ?auto_58283 ?auto_58282 ) ( ON ?auto_58284 ?auto_58283 ) ( CLEAR ?auto_58284 ) ( HOLDING ?auto_58285 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_58285 )
      ( MAKE-5PILE ?auto_58280 ?auto_58281 ?auto_58282 ?auto_58283 ?auto_58284 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58287 - BLOCK
      ?auto_58288 - BLOCK
      ?auto_58289 - BLOCK
      ?auto_58290 - BLOCK
      ?auto_58291 - BLOCK
    )
    :vars
    (
      ?auto_58292 - BLOCK
      ?auto_58293 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58287 ?auto_58288 ) ) ( not ( = ?auto_58287 ?auto_58289 ) ) ( not ( = ?auto_58287 ?auto_58290 ) ) ( not ( = ?auto_58287 ?auto_58291 ) ) ( not ( = ?auto_58288 ?auto_58289 ) ) ( not ( = ?auto_58288 ?auto_58290 ) ) ( not ( = ?auto_58288 ?auto_58291 ) ) ( not ( = ?auto_58289 ?auto_58290 ) ) ( not ( = ?auto_58289 ?auto_58291 ) ) ( not ( = ?auto_58290 ?auto_58291 ) ) ( not ( = ?auto_58287 ?auto_58292 ) ) ( not ( = ?auto_58288 ?auto_58292 ) ) ( not ( = ?auto_58289 ?auto_58292 ) ) ( not ( = ?auto_58290 ?auto_58292 ) ) ( not ( = ?auto_58291 ?auto_58292 ) ) ( ON ?auto_58287 ?auto_58293 ) ( not ( = ?auto_58287 ?auto_58293 ) ) ( not ( = ?auto_58288 ?auto_58293 ) ) ( not ( = ?auto_58289 ?auto_58293 ) ) ( not ( = ?auto_58290 ?auto_58293 ) ) ( not ( = ?auto_58291 ?auto_58293 ) ) ( not ( = ?auto_58292 ?auto_58293 ) ) ( ON ?auto_58288 ?auto_58287 ) ( ON-TABLE ?auto_58293 ) ( ON ?auto_58289 ?auto_58288 ) ( ON ?auto_58290 ?auto_58289 ) ( ON ?auto_58291 ?auto_58290 ) ( ON ?auto_58292 ?auto_58291 ) ( CLEAR ?auto_58292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_58293 ?auto_58287 ?auto_58288 ?auto_58289 ?auto_58290 ?auto_58291 )
      ( MAKE-5PILE ?auto_58287 ?auto_58288 ?auto_58289 ?auto_58290 ?auto_58291 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58306 - BLOCK
      ?auto_58307 - BLOCK
      ?auto_58308 - BLOCK
      ?auto_58309 - BLOCK
      ?auto_58310 - BLOCK
      ?auto_58311 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_58310 ) ( ON-TABLE ?auto_58306 ) ( ON ?auto_58307 ?auto_58306 ) ( ON ?auto_58308 ?auto_58307 ) ( ON ?auto_58309 ?auto_58308 ) ( ON ?auto_58310 ?auto_58309 ) ( not ( = ?auto_58306 ?auto_58307 ) ) ( not ( = ?auto_58306 ?auto_58308 ) ) ( not ( = ?auto_58306 ?auto_58309 ) ) ( not ( = ?auto_58306 ?auto_58310 ) ) ( not ( = ?auto_58306 ?auto_58311 ) ) ( not ( = ?auto_58307 ?auto_58308 ) ) ( not ( = ?auto_58307 ?auto_58309 ) ) ( not ( = ?auto_58307 ?auto_58310 ) ) ( not ( = ?auto_58307 ?auto_58311 ) ) ( not ( = ?auto_58308 ?auto_58309 ) ) ( not ( = ?auto_58308 ?auto_58310 ) ) ( not ( = ?auto_58308 ?auto_58311 ) ) ( not ( = ?auto_58309 ?auto_58310 ) ) ( not ( = ?auto_58309 ?auto_58311 ) ) ( not ( = ?auto_58310 ?auto_58311 ) ) ( ON-TABLE ?auto_58311 ) ( CLEAR ?auto_58311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_58311 )
      ( MAKE-6PILE ?auto_58306 ?auto_58307 ?auto_58308 ?auto_58309 ?auto_58310 ?auto_58311 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58312 - BLOCK
      ?auto_58313 - BLOCK
      ?auto_58314 - BLOCK
      ?auto_58315 - BLOCK
      ?auto_58316 - BLOCK
      ?auto_58317 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58312 ) ( ON ?auto_58313 ?auto_58312 ) ( ON ?auto_58314 ?auto_58313 ) ( ON ?auto_58315 ?auto_58314 ) ( not ( = ?auto_58312 ?auto_58313 ) ) ( not ( = ?auto_58312 ?auto_58314 ) ) ( not ( = ?auto_58312 ?auto_58315 ) ) ( not ( = ?auto_58312 ?auto_58316 ) ) ( not ( = ?auto_58312 ?auto_58317 ) ) ( not ( = ?auto_58313 ?auto_58314 ) ) ( not ( = ?auto_58313 ?auto_58315 ) ) ( not ( = ?auto_58313 ?auto_58316 ) ) ( not ( = ?auto_58313 ?auto_58317 ) ) ( not ( = ?auto_58314 ?auto_58315 ) ) ( not ( = ?auto_58314 ?auto_58316 ) ) ( not ( = ?auto_58314 ?auto_58317 ) ) ( not ( = ?auto_58315 ?auto_58316 ) ) ( not ( = ?auto_58315 ?auto_58317 ) ) ( not ( = ?auto_58316 ?auto_58317 ) ) ( ON-TABLE ?auto_58317 ) ( CLEAR ?auto_58317 ) ( HOLDING ?auto_58316 ) ( CLEAR ?auto_58315 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58312 ?auto_58313 ?auto_58314 ?auto_58315 ?auto_58316 )
      ( MAKE-6PILE ?auto_58312 ?auto_58313 ?auto_58314 ?auto_58315 ?auto_58316 ?auto_58317 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58318 - BLOCK
      ?auto_58319 - BLOCK
      ?auto_58320 - BLOCK
      ?auto_58321 - BLOCK
      ?auto_58322 - BLOCK
      ?auto_58323 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58318 ) ( ON ?auto_58319 ?auto_58318 ) ( ON ?auto_58320 ?auto_58319 ) ( ON ?auto_58321 ?auto_58320 ) ( not ( = ?auto_58318 ?auto_58319 ) ) ( not ( = ?auto_58318 ?auto_58320 ) ) ( not ( = ?auto_58318 ?auto_58321 ) ) ( not ( = ?auto_58318 ?auto_58322 ) ) ( not ( = ?auto_58318 ?auto_58323 ) ) ( not ( = ?auto_58319 ?auto_58320 ) ) ( not ( = ?auto_58319 ?auto_58321 ) ) ( not ( = ?auto_58319 ?auto_58322 ) ) ( not ( = ?auto_58319 ?auto_58323 ) ) ( not ( = ?auto_58320 ?auto_58321 ) ) ( not ( = ?auto_58320 ?auto_58322 ) ) ( not ( = ?auto_58320 ?auto_58323 ) ) ( not ( = ?auto_58321 ?auto_58322 ) ) ( not ( = ?auto_58321 ?auto_58323 ) ) ( not ( = ?auto_58322 ?auto_58323 ) ) ( ON-TABLE ?auto_58323 ) ( CLEAR ?auto_58321 ) ( ON ?auto_58322 ?auto_58323 ) ( CLEAR ?auto_58322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_58323 )
      ( MAKE-6PILE ?auto_58318 ?auto_58319 ?auto_58320 ?auto_58321 ?auto_58322 ?auto_58323 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58324 - BLOCK
      ?auto_58325 - BLOCK
      ?auto_58326 - BLOCK
      ?auto_58327 - BLOCK
      ?auto_58328 - BLOCK
      ?auto_58329 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58324 ) ( ON ?auto_58325 ?auto_58324 ) ( ON ?auto_58326 ?auto_58325 ) ( not ( = ?auto_58324 ?auto_58325 ) ) ( not ( = ?auto_58324 ?auto_58326 ) ) ( not ( = ?auto_58324 ?auto_58327 ) ) ( not ( = ?auto_58324 ?auto_58328 ) ) ( not ( = ?auto_58324 ?auto_58329 ) ) ( not ( = ?auto_58325 ?auto_58326 ) ) ( not ( = ?auto_58325 ?auto_58327 ) ) ( not ( = ?auto_58325 ?auto_58328 ) ) ( not ( = ?auto_58325 ?auto_58329 ) ) ( not ( = ?auto_58326 ?auto_58327 ) ) ( not ( = ?auto_58326 ?auto_58328 ) ) ( not ( = ?auto_58326 ?auto_58329 ) ) ( not ( = ?auto_58327 ?auto_58328 ) ) ( not ( = ?auto_58327 ?auto_58329 ) ) ( not ( = ?auto_58328 ?auto_58329 ) ) ( ON-TABLE ?auto_58329 ) ( ON ?auto_58328 ?auto_58329 ) ( CLEAR ?auto_58328 ) ( HOLDING ?auto_58327 ) ( CLEAR ?auto_58326 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58324 ?auto_58325 ?auto_58326 ?auto_58327 )
      ( MAKE-6PILE ?auto_58324 ?auto_58325 ?auto_58326 ?auto_58327 ?auto_58328 ?auto_58329 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58330 - BLOCK
      ?auto_58331 - BLOCK
      ?auto_58332 - BLOCK
      ?auto_58333 - BLOCK
      ?auto_58334 - BLOCK
      ?auto_58335 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58330 ) ( ON ?auto_58331 ?auto_58330 ) ( ON ?auto_58332 ?auto_58331 ) ( not ( = ?auto_58330 ?auto_58331 ) ) ( not ( = ?auto_58330 ?auto_58332 ) ) ( not ( = ?auto_58330 ?auto_58333 ) ) ( not ( = ?auto_58330 ?auto_58334 ) ) ( not ( = ?auto_58330 ?auto_58335 ) ) ( not ( = ?auto_58331 ?auto_58332 ) ) ( not ( = ?auto_58331 ?auto_58333 ) ) ( not ( = ?auto_58331 ?auto_58334 ) ) ( not ( = ?auto_58331 ?auto_58335 ) ) ( not ( = ?auto_58332 ?auto_58333 ) ) ( not ( = ?auto_58332 ?auto_58334 ) ) ( not ( = ?auto_58332 ?auto_58335 ) ) ( not ( = ?auto_58333 ?auto_58334 ) ) ( not ( = ?auto_58333 ?auto_58335 ) ) ( not ( = ?auto_58334 ?auto_58335 ) ) ( ON-TABLE ?auto_58335 ) ( ON ?auto_58334 ?auto_58335 ) ( CLEAR ?auto_58332 ) ( ON ?auto_58333 ?auto_58334 ) ( CLEAR ?auto_58333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58335 ?auto_58334 )
      ( MAKE-6PILE ?auto_58330 ?auto_58331 ?auto_58332 ?auto_58333 ?auto_58334 ?auto_58335 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58336 - BLOCK
      ?auto_58337 - BLOCK
      ?auto_58338 - BLOCK
      ?auto_58339 - BLOCK
      ?auto_58340 - BLOCK
      ?auto_58341 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58336 ) ( ON ?auto_58337 ?auto_58336 ) ( not ( = ?auto_58336 ?auto_58337 ) ) ( not ( = ?auto_58336 ?auto_58338 ) ) ( not ( = ?auto_58336 ?auto_58339 ) ) ( not ( = ?auto_58336 ?auto_58340 ) ) ( not ( = ?auto_58336 ?auto_58341 ) ) ( not ( = ?auto_58337 ?auto_58338 ) ) ( not ( = ?auto_58337 ?auto_58339 ) ) ( not ( = ?auto_58337 ?auto_58340 ) ) ( not ( = ?auto_58337 ?auto_58341 ) ) ( not ( = ?auto_58338 ?auto_58339 ) ) ( not ( = ?auto_58338 ?auto_58340 ) ) ( not ( = ?auto_58338 ?auto_58341 ) ) ( not ( = ?auto_58339 ?auto_58340 ) ) ( not ( = ?auto_58339 ?auto_58341 ) ) ( not ( = ?auto_58340 ?auto_58341 ) ) ( ON-TABLE ?auto_58341 ) ( ON ?auto_58340 ?auto_58341 ) ( ON ?auto_58339 ?auto_58340 ) ( CLEAR ?auto_58339 ) ( HOLDING ?auto_58338 ) ( CLEAR ?auto_58337 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58336 ?auto_58337 ?auto_58338 )
      ( MAKE-6PILE ?auto_58336 ?auto_58337 ?auto_58338 ?auto_58339 ?auto_58340 ?auto_58341 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58342 - BLOCK
      ?auto_58343 - BLOCK
      ?auto_58344 - BLOCK
      ?auto_58345 - BLOCK
      ?auto_58346 - BLOCK
      ?auto_58347 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58342 ) ( ON ?auto_58343 ?auto_58342 ) ( not ( = ?auto_58342 ?auto_58343 ) ) ( not ( = ?auto_58342 ?auto_58344 ) ) ( not ( = ?auto_58342 ?auto_58345 ) ) ( not ( = ?auto_58342 ?auto_58346 ) ) ( not ( = ?auto_58342 ?auto_58347 ) ) ( not ( = ?auto_58343 ?auto_58344 ) ) ( not ( = ?auto_58343 ?auto_58345 ) ) ( not ( = ?auto_58343 ?auto_58346 ) ) ( not ( = ?auto_58343 ?auto_58347 ) ) ( not ( = ?auto_58344 ?auto_58345 ) ) ( not ( = ?auto_58344 ?auto_58346 ) ) ( not ( = ?auto_58344 ?auto_58347 ) ) ( not ( = ?auto_58345 ?auto_58346 ) ) ( not ( = ?auto_58345 ?auto_58347 ) ) ( not ( = ?auto_58346 ?auto_58347 ) ) ( ON-TABLE ?auto_58347 ) ( ON ?auto_58346 ?auto_58347 ) ( ON ?auto_58345 ?auto_58346 ) ( CLEAR ?auto_58343 ) ( ON ?auto_58344 ?auto_58345 ) ( CLEAR ?auto_58344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58347 ?auto_58346 ?auto_58345 )
      ( MAKE-6PILE ?auto_58342 ?auto_58343 ?auto_58344 ?auto_58345 ?auto_58346 ?auto_58347 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58348 - BLOCK
      ?auto_58349 - BLOCK
      ?auto_58350 - BLOCK
      ?auto_58351 - BLOCK
      ?auto_58352 - BLOCK
      ?auto_58353 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58348 ) ( not ( = ?auto_58348 ?auto_58349 ) ) ( not ( = ?auto_58348 ?auto_58350 ) ) ( not ( = ?auto_58348 ?auto_58351 ) ) ( not ( = ?auto_58348 ?auto_58352 ) ) ( not ( = ?auto_58348 ?auto_58353 ) ) ( not ( = ?auto_58349 ?auto_58350 ) ) ( not ( = ?auto_58349 ?auto_58351 ) ) ( not ( = ?auto_58349 ?auto_58352 ) ) ( not ( = ?auto_58349 ?auto_58353 ) ) ( not ( = ?auto_58350 ?auto_58351 ) ) ( not ( = ?auto_58350 ?auto_58352 ) ) ( not ( = ?auto_58350 ?auto_58353 ) ) ( not ( = ?auto_58351 ?auto_58352 ) ) ( not ( = ?auto_58351 ?auto_58353 ) ) ( not ( = ?auto_58352 ?auto_58353 ) ) ( ON-TABLE ?auto_58353 ) ( ON ?auto_58352 ?auto_58353 ) ( ON ?auto_58351 ?auto_58352 ) ( ON ?auto_58350 ?auto_58351 ) ( CLEAR ?auto_58350 ) ( HOLDING ?auto_58349 ) ( CLEAR ?auto_58348 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58348 ?auto_58349 )
      ( MAKE-6PILE ?auto_58348 ?auto_58349 ?auto_58350 ?auto_58351 ?auto_58352 ?auto_58353 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58354 - BLOCK
      ?auto_58355 - BLOCK
      ?auto_58356 - BLOCK
      ?auto_58357 - BLOCK
      ?auto_58358 - BLOCK
      ?auto_58359 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58354 ) ( not ( = ?auto_58354 ?auto_58355 ) ) ( not ( = ?auto_58354 ?auto_58356 ) ) ( not ( = ?auto_58354 ?auto_58357 ) ) ( not ( = ?auto_58354 ?auto_58358 ) ) ( not ( = ?auto_58354 ?auto_58359 ) ) ( not ( = ?auto_58355 ?auto_58356 ) ) ( not ( = ?auto_58355 ?auto_58357 ) ) ( not ( = ?auto_58355 ?auto_58358 ) ) ( not ( = ?auto_58355 ?auto_58359 ) ) ( not ( = ?auto_58356 ?auto_58357 ) ) ( not ( = ?auto_58356 ?auto_58358 ) ) ( not ( = ?auto_58356 ?auto_58359 ) ) ( not ( = ?auto_58357 ?auto_58358 ) ) ( not ( = ?auto_58357 ?auto_58359 ) ) ( not ( = ?auto_58358 ?auto_58359 ) ) ( ON-TABLE ?auto_58359 ) ( ON ?auto_58358 ?auto_58359 ) ( ON ?auto_58357 ?auto_58358 ) ( ON ?auto_58356 ?auto_58357 ) ( CLEAR ?auto_58354 ) ( ON ?auto_58355 ?auto_58356 ) ( CLEAR ?auto_58355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58359 ?auto_58358 ?auto_58357 ?auto_58356 )
      ( MAKE-6PILE ?auto_58354 ?auto_58355 ?auto_58356 ?auto_58357 ?auto_58358 ?auto_58359 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58360 - BLOCK
      ?auto_58361 - BLOCK
      ?auto_58362 - BLOCK
      ?auto_58363 - BLOCK
      ?auto_58364 - BLOCK
      ?auto_58365 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58360 ?auto_58361 ) ) ( not ( = ?auto_58360 ?auto_58362 ) ) ( not ( = ?auto_58360 ?auto_58363 ) ) ( not ( = ?auto_58360 ?auto_58364 ) ) ( not ( = ?auto_58360 ?auto_58365 ) ) ( not ( = ?auto_58361 ?auto_58362 ) ) ( not ( = ?auto_58361 ?auto_58363 ) ) ( not ( = ?auto_58361 ?auto_58364 ) ) ( not ( = ?auto_58361 ?auto_58365 ) ) ( not ( = ?auto_58362 ?auto_58363 ) ) ( not ( = ?auto_58362 ?auto_58364 ) ) ( not ( = ?auto_58362 ?auto_58365 ) ) ( not ( = ?auto_58363 ?auto_58364 ) ) ( not ( = ?auto_58363 ?auto_58365 ) ) ( not ( = ?auto_58364 ?auto_58365 ) ) ( ON-TABLE ?auto_58365 ) ( ON ?auto_58364 ?auto_58365 ) ( ON ?auto_58363 ?auto_58364 ) ( ON ?auto_58362 ?auto_58363 ) ( ON ?auto_58361 ?auto_58362 ) ( CLEAR ?auto_58361 ) ( HOLDING ?auto_58360 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_58360 )
      ( MAKE-6PILE ?auto_58360 ?auto_58361 ?auto_58362 ?auto_58363 ?auto_58364 ?auto_58365 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58366 - BLOCK
      ?auto_58367 - BLOCK
      ?auto_58368 - BLOCK
      ?auto_58369 - BLOCK
      ?auto_58370 - BLOCK
      ?auto_58371 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58366 ?auto_58367 ) ) ( not ( = ?auto_58366 ?auto_58368 ) ) ( not ( = ?auto_58366 ?auto_58369 ) ) ( not ( = ?auto_58366 ?auto_58370 ) ) ( not ( = ?auto_58366 ?auto_58371 ) ) ( not ( = ?auto_58367 ?auto_58368 ) ) ( not ( = ?auto_58367 ?auto_58369 ) ) ( not ( = ?auto_58367 ?auto_58370 ) ) ( not ( = ?auto_58367 ?auto_58371 ) ) ( not ( = ?auto_58368 ?auto_58369 ) ) ( not ( = ?auto_58368 ?auto_58370 ) ) ( not ( = ?auto_58368 ?auto_58371 ) ) ( not ( = ?auto_58369 ?auto_58370 ) ) ( not ( = ?auto_58369 ?auto_58371 ) ) ( not ( = ?auto_58370 ?auto_58371 ) ) ( ON-TABLE ?auto_58371 ) ( ON ?auto_58370 ?auto_58371 ) ( ON ?auto_58369 ?auto_58370 ) ( ON ?auto_58368 ?auto_58369 ) ( ON ?auto_58367 ?auto_58368 ) ( ON ?auto_58366 ?auto_58367 ) ( CLEAR ?auto_58366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58371 ?auto_58370 ?auto_58369 ?auto_58368 ?auto_58367 )
      ( MAKE-6PILE ?auto_58366 ?auto_58367 ?auto_58368 ?auto_58369 ?auto_58370 ?auto_58371 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58378 - BLOCK
      ?auto_58379 - BLOCK
      ?auto_58380 - BLOCK
      ?auto_58381 - BLOCK
      ?auto_58382 - BLOCK
      ?auto_58383 - BLOCK
    )
    :vars
    (
      ?auto_58384 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58378 ?auto_58379 ) ) ( not ( = ?auto_58378 ?auto_58380 ) ) ( not ( = ?auto_58378 ?auto_58381 ) ) ( not ( = ?auto_58378 ?auto_58382 ) ) ( not ( = ?auto_58378 ?auto_58383 ) ) ( not ( = ?auto_58379 ?auto_58380 ) ) ( not ( = ?auto_58379 ?auto_58381 ) ) ( not ( = ?auto_58379 ?auto_58382 ) ) ( not ( = ?auto_58379 ?auto_58383 ) ) ( not ( = ?auto_58380 ?auto_58381 ) ) ( not ( = ?auto_58380 ?auto_58382 ) ) ( not ( = ?auto_58380 ?auto_58383 ) ) ( not ( = ?auto_58381 ?auto_58382 ) ) ( not ( = ?auto_58381 ?auto_58383 ) ) ( not ( = ?auto_58382 ?auto_58383 ) ) ( ON-TABLE ?auto_58383 ) ( ON ?auto_58382 ?auto_58383 ) ( ON ?auto_58381 ?auto_58382 ) ( ON ?auto_58380 ?auto_58381 ) ( ON ?auto_58379 ?auto_58380 ) ( CLEAR ?auto_58379 ) ( ON ?auto_58378 ?auto_58384 ) ( CLEAR ?auto_58378 ) ( HAND-EMPTY ) ( not ( = ?auto_58378 ?auto_58384 ) ) ( not ( = ?auto_58379 ?auto_58384 ) ) ( not ( = ?auto_58380 ?auto_58384 ) ) ( not ( = ?auto_58381 ?auto_58384 ) ) ( not ( = ?auto_58382 ?auto_58384 ) ) ( not ( = ?auto_58383 ?auto_58384 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_58378 ?auto_58384 )
      ( MAKE-6PILE ?auto_58378 ?auto_58379 ?auto_58380 ?auto_58381 ?auto_58382 ?auto_58383 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58385 - BLOCK
      ?auto_58386 - BLOCK
      ?auto_58387 - BLOCK
      ?auto_58388 - BLOCK
      ?auto_58389 - BLOCK
      ?auto_58390 - BLOCK
    )
    :vars
    (
      ?auto_58391 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58385 ?auto_58386 ) ) ( not ( = ?auto_58385 ?auto_58387 ) ) ( not ( = ?auto_58385 ?auto_58388 ) ) ( not ( = ?auto_58385 ?auto_58389 ) ) ( not ( = ?auto_58385 ?auto_58390 ) ) ( not ( = ?auto_58386 ?auto_58387 ) ) ( not ( = ?auto_58386 ?auto_58388 ) ) ( not ( = ?auto_58386 ?auto_58389 ) ) ( not ( = ?auto_58386 ?auto_58390 ) ) ( not ( = ?auto_58387 ?auto_58388 ) ) ( not ( = ?auto_58387 ?auto_58389 ) ) ( not ( = ?auto_58387 ?auto_58390 ) ) ( not ( = ?auto_58388 ?auto_58389 ) ) ( not ( = ?auto_58388 ?auto_58390 ) ) ( not ( = ?auto_58389 ?auto_58390 ) ) ( ON-TABLE ?auto_58390 ) ( ON ?auto_58389 ?auto_58390 ) ( ON ?auto_58388 ?auto_58389 ) ( ON ?auto_58387 ?auto_58388 ) ( ON ?auto_58385 ?auto_58391 ) ( CLEAR ?auto_58385 ) ( not ( = ?auto_58385 ?auto_58391 ) ) ( not ( = ?auto_58386 ?auto_58391 ) ) ( not ( = ?auto_58387 ?auto_58391 ) ) ( not ( = ?auto_58388 ?auto_58391 ) ) ( not ( = ?auto_58389 ?auto_58391 ) ) ( not ( = ?auto_58390 ?auto_58391 ) ) ( HOLDING ?auto_58386 ) ( CLEAR ?auto_58387 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58390 ?auto_58389 ?auto_58388 ?auto_58387 ?auto_58386 )
      ( MAKE-6PILE ?auto_58385 ?auto_58386 ?auto_58387 ?auto_58388 ?auto_58389 ?auto_58390 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58392 - BLOCK
      ?auto_58393 - BLOCK
      ?auto_58394 - BLOCK
      ?auto_58395 - BLOCK
      ?auto_58396 - BLOCK
      ?auto_58397 - BLOCK
    )
    :vars
    (
      ?auto_58398 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58392 ?auto_58393 ) ) ( not ( = ?auto_58392 ?auto_58394 ) ) ( not ( = ?auto_58392 ?auto_58395 ) ) ( not ( = ?auto_58392 ?auto_58396 ) ) ( not ( = ?auto_58392 ?auto_58397 ) ) ( not ( = ?auto_58393 ?auto_58394 ) ) ( not ( = ?auto_58393 ?auto_58395 ) ) ( not ( = ?auto_58393 ?auto_58396 ) ) ( not ( = ?auto_58393 ?auto_58397 ) ) ( not ( = ?auto_58394 ?auto_58395 ) ) ( not ( = ?auto_58394 ?auto_58396 ) ) ( not ( = ?auto_58394 ?auto_58397 ) ) ( not ( = ?auto_58395 ?auto_58396 ) ) ( not ( = ?auto_58395 ?auto_58397 ) ) ( not ( = ?auto_58396 ?auto_58397 ) ) ( ON-TABLE ?auto_58397 ) ( ON ?auto_58396 ?auto_58397 ) ( ON ?auto_58395 ?auto_58396 ) ( ON ?auto_58394 ?auto_58395 ) ( ON ?auto_58392 ?auto_58398 ) ( not ( = ?auto_58392 ?auto_58398 ) ) ( not ( = ?auto_58393 ?auto_58398 ) ) ( not ( = ?auto_58394 ?auto_58398 ) ) ( not ( = ?auto_58395 ?auto_58398 ) ) ( not ( = ?auto_58396 ?auto_58398 ) ) ( not ( = ?auto_58397 ?auto_58398 ) ) ( CLEAR ?auto_58394 ) ( ON ?auto_58393 ?auto_58392 ) ( CLEAR ?auto_58393 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_58398 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58398 ?auto_58392 )
      ( MAKE-6PILE ?auto_58392 ?auto_58393 ?auto_58394 ?auto_58395 ?auto_58396 ?auto_58397 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58399 - BLOCK
      ?auto_58400 - BLOCK
      ?auto_58401 - BLOCK
      ?auto_58402 - BLOCK
      ?auto_58403 - BLOCK
      ?auto_58404 - BLOCK
    )
    :vars
    (
      ?auto_58405 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58399 ?auto_58400 ) ) ( not ( = ?auto_58399 ?auto_58401 ) ) ( not ( = ?auto_58399 ?auto_58402 ) ) ( not ( = ?auto_58399 ?auto_58403 ) ) ( not ( = ?auto_58399 ?auto_58404 ) ) ( not ( = ?auto_58400 ?auto_58401 ) ) ( not ( = ?auto_58400 ?auto_58402 ) ) ( not ( = ?auto_58400 ?auto_58403 ) ) ( not ( = ?auto_58400 ?auto_58404 ) ) ( not ( = ?auto_58401 ?auto_58402 ) ) ( not ( = ?auto_58401 ?auto_58403 ) ) ( not ( = ?auto_58401 ?auto_58404 ) ) ( not ( = ?auto_58402 ?auto_58403 ) ) ( not ( = ?auto_58402 ?auto_58404 ) ) ( not ( = ?auto_58403 ?auto_58404 ) ) ( ON-TABLE ?auto_58404 ) ( ON ?auto_58403 ?auto_58404 ) ( ON ?auto_58402 ?auto_58403 ) ( ON ?auto_58399 ?auto_58405 ) ( not ( = ?auto_58399 ?auto_58405 ) ) ( not ( = ?auto_58400 ?auto_58405 ) ) ( not ( = ?auto_58401 ?auto_58405 ) ) ( not ( = ?auto_58402 ?auto_58405 ) ) ( not ( = ?auto_58403 ?auto_58405 ) ) ( not ( = ?auto_58404 ?auto_58405 ) ) ( ON ?auto_58400 ?auto_58399 ) ( CLEAR ?auto_58400 ) ( ON-TABLE ?auto_58405 ) ( HOLDING ?auto_58401 ) ( CLEAR ?auto_58402 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58404 ?auto_58403 ?auto_58402 ?auto_58401 )
      ( MAKE-6PILE ?auto_58399 ?auto_58400 ?auto_58401 ?auto_58402 ?auto_58403 ?auto_58404 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58406 - BLOCK
      ?auto_58407 - BLOCK
      ?auto_58408 - BLOCK
      ?auto_58409 - BLOCK
      ?auto_58410 - BLOCK
      ?auto_58411 - BLOCK
    )
    :vars
    (
      ?auto_58412 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58406 ?auto_58407 ) ) ( not ( = ?auto_58406 ?auto_58408 ) ) ( not ( = ?auto_58406 ?auto_58409 ) ) ( not ( = ?auto_58406 ?auto_58410 ) ) ( not ( = ?auto_58406 ?auto_58411 ) ) ( not ( = ?auto_58407 ?auto_58408 ) ) ( not ( = ?auto_58407 ?auto_58409 ) ) ( not ( = ?auto_58407 ?auto_58410 ) ) ( not ( = ?auto_58407 ?auto_58411 ) ) ( not ( = ?auto_58408 ?auto_58409 ) ) ( not ( = ?auto_58408 ?auto_58410 ) ) ( not ( = ?auto_58408 ?auto_58411 ) ) ( not ( = ?auto_58409 ?auto_58410 ) ) ( not ( = ?auto_58409 ?auto_58411 ) ) ( not ( = ?auto_58410 ?auto_58411 ) ) ( ON-TABLE ?auto_58411 ) ( ON ?auto_58410 ?auto_58411 ) ( ON ?auto_58409 ?auto_58410 ) ( ON ?auto_58406 ?auto_58412 ) ( not ( = ?auto_58406 ?auto_58412 ) ) ( not ( = ?auto_58407 ?auto_58412 ) ) ( not ( = ?auto_58408 ?auto_58412 ) ) ( not ( = ?auto_58409 ?auto_58412 ) ) ( not ( = ?auto_58410 ?auto_58412 ) ) ( not ( = ?auto_58411 ?auto_58412 ) ) ( ON ?auto_58407 ?auto_58406 ) ( ON-TABLE ?auto_58412 ) ( CLEAR ?auto_58409 ) ( ON ?auto_58408 ?auto_58407 ) ( CLEAR ?auto_58408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58412 ?auto_58406 ?auto_58407 )
      ( MAKE-6PILE ?auto_58406 ?auto_58407 ?auto_58408 ?auto_58409 ?auto_58410 ?auto_58411 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58413 - BLOCK
      ?auto_58414 - BLOCK
      ?auto_58415 - BLOCK
      ?auto_58416 - BLOCK
      ?auto_58417 - BLOCK
      ?auto_58418 - BLOCK
    )
    :vars
    (
      ?auto_58419 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58413 ?auto_58414 ) ) ( not ( = ?auto_58413 ?auto_58415 ) ) ( not ( = ?auto_58413 ?auto_58416 ) ) ( not ( = ?auto_58413 ?auto_58417 ) ) ( not ( = ?auto_58413 ?auto_58418 ) ) ( not ( = ?auto_58414 ?auto_58415 ) ) ( not ( = ?auto_58414 ?auto_58416 ) ) ( not ( = ?auto_58414 ?auto_58417 ) ) ( not ( = ?auto_58414 ?auto_58418 ) ) ( not ( = ?auto_58415 ?auto_58416 ) ) ( not ( = ?auto_58415 ?auto_58417 ) ) ( not ( = ?auto_58415 ?auto_58418 ) ) ( not ( = ?auto_58416 ?auto_58417 ) ) ( not ( = ?auto_58416 ?auto_58418 ) ) ( not ( = ?auto_58417 ?auto_58418 ) ) ( ON-TABLE ?auto_58418 ) ( ON ?auto_58417 ?auto_58418 ) ( ON ?auto_58413 ?auto_58419 ) ( not ( = ?auto_58413 ?auto_58419 ) ) ( not ( = ?auto_58414 ?auto_58419 ) ) ( not ( = ?auto_58415 ?auto_58419 ) ) ( not ( = ?auto_58416 ?auto_58419 ) ) ( not ( = ?auto_58417 ?auto_58419 ) ) ( not ( = ?auto_58418 ?auto_58419 ) ) ( ON ?auto_58414 ?auto_58413 ) ( ON-TABLE ?auto_58419 ) ( ON ?auto_58415 ?auto_58414 ) ( CLEAR ?auto_58415 ) ( HOLDING ?auto_58416 ) ( CLEAR ?auto_58417 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58418 ?auto_58417 ?auto_58416 )
      ( MAKE-6PILE ?auto_58413 ?auto_58414 ?auto_58415 ?auto_58416 ?auto_58417 ?auto_58418 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58420 - BLOCK
      ?auto_58421 - BLOCK
      ?auto_58422 - BLOCK
      ?auto_58423 - BLOCK
      ?auto_58424 - BLOCK
      ?auto_58425 - BLOCK
    )
    :vars
    (
      ?auto_58426 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58420 ?auto_58421 ) ) ( not ( = ?auto_58420 ?auto_58422 ) ) ( not ( = ?auto_58420 ?auto_58423 ) ) ( not ( = ?auto_58420 ?auto_58424 ) ) ( not ( = ?auto_58420 ?auto_58425 ) ) ( not ( = ?auto_58421 ?auto_58422 ) ) ( not ( = ?auto_58421 ?auto_58423 ) ) ( not ( = ?auto_58421 ?auto_58424 ) ) ( not ( = ?auto_58421 ?auto_58425 ) ) ( not ( = ?auto_58422 ?auto_58423 ) ) ( not ( = ?auto_58422 ?auto_58424 ) ) ( not ( = ?auto_58422 ?auto_58425 ) ) ( not ( = ?auto_58423 ?auto_58424 ) ) ( not ( = ?auto_58423 ?auto_58425 ) ) ( not ( = ?auto_58424 ?auto_58425 ) ) ( ON-TABLE ?auto_58425 ) ( ON ?auto_58424 ?auto_58425 ) ( ON ?auto_58420 ?auto_58426 ) ( not ( = ?auto_58420 ?auto_58426 ) ) ( not ( = ?auto_58421 ?auto_58426 ) ) ( not ( = ?auto_58422 ?auto_58426 ) ) ( not ( = ?auto_58423 ?auto_58426 ) ) ( not ( = ?auto_58424 ?auto_58426 ) ) ( not ( = ?auto_58425 ?auto_58426 ) ) ( ON ?auto_58421 ?auto_58420 ) ( ON-TABLE ?auto_58426 ) ( ON ?auto_58422 ?auto_58421 ) ( CLEAR ?auto_58424 ) ( ON ?auto_58423 ?auto_58422 ) ( CLEAR ?auto_58423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58426 ?auto_58420 ?auto_58421 ?auto_58422 )
      ( MAKE-6PILE ?auto_58420 ?auto_58421 ?auto_58422 ?auto_58423 ?auto_58424 ?auto_58425 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58427 - BLOCK
      ?auto_58428 - BLOCK
      ?auto_58429 - BLOCK
      ?auto_58430 - BLOCK
      ?auto_58431 - BLOCK
      ?auto_58432 - BLOCK
    )
    :vars
    (
      ?auto_58433 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58427 ?auto_58428 ) ) ( not ( = ?auto_58427 ?auto_58429 ) ) ( not ( = ?auto_58427 ?auto_58430 ) ) ( not ( = ?auto_58427 ?auto_58431 ) ) ( not ( = ?auto_58427 ?auto_58432 ) ) ( not ( = ?auto_58428 ?auto_58429 ) ) ( not ( = ?auto_58428 ?auto_58430 ) ) ( not ( = ?auto_58428 ?auto_58431 ) ) ( not ( = ?auto_58428 ?auto_58432 ) ) ( not ( = ?auto_58429 ?auto_58430 ) ) ( not ( = ?auto_58429 ?auto_58431 ) ) ( not ( = ?auto_58429 ?auto_58432 ) ) ( not ( = ?auto_58430 ?auto_58431 ) ) ( not ( = ?auto_58430 ?auto_58432 ) ) ( not ( = ?auto_58431 ?auto_58432 ) ) ( ON-TABLE ?auto_58432 ) ( ON ?auto_58427 ?auto_58433 ) ( not ( = ?auto_58427 ?auto_58433 ) ) ( not ( = ?auto_58428 ?auto_58433 ) ) ( not ( = ?auto_58429 ?auto_58433 ) ) ( not ( = ?auto_58430 ?auto_58433 ) ) ( not ( = ?auto_58431 ?auto_58433 ) ) ( not ( = ?auto_58432 ?auto_58433 ) ) ( ON ?auto_58428 ?auto_58427 ) ( ON-TABLE ?auto_58433 ) ( ON ?auto_58429 ?auto_58428 ) ( ON ?auto_58430 ?auto_58429 ) ( CLEAR ?auto_58430 ) ( HOLDING ?auto_58431 ) ( CLEAR ?auto_58432 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58432 ?auto_58431 )
      ( MAKE-6PILE ?auto_58427 ?auto_58428 ?auto_58429 ?auto_58430 ?auto_58431 ?auto_58432 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58434 - BLOCK
      ?auto_58435 - BLOCK
      ?auto_58436 - BLOCK
      ?auto_58437 - BLOCK
      ?auto_58438 - BLOCK
      ?auto_58439 - BLOCK
    )
    :vars
    (
      ?auto_58440 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58434 ?auto_58435 ) ) ( not ( = ?auto_58434 ?auto_58436 ) ) ( not ( = ?auto_58434 ?auto_58437 ) ) ( not ( = ?auto_58434 ?auto_58438 ) ) ( not ( = ?auto_58434 ?auto_58439 ) ) ( not ( = ?auto_58435 ?auto_58436 ) ) ( not ( = ?auto_58435 ?auto_58437 ) ) ( not ( = ?auto_58435 ?auto_58438 ) ) ( not ( = ?auto_58435 ?auto_58439 ) ) ( not ( = ?auto_58436 ?auto_58437 ) ) ( not ( = ?auto_58436 ?auto_58438 ) ) ( not ( = ?auto_58436 ?auto_58439 ) ) ( not ( = ?auto_58437 ?auto_58438 ) ) ( not ( = ?auto_58437 ?auto_58439 ) ) ( not ( = ?auto_58438 ?auto_58439 ) ) ( ON-TABLE ?auto_58439 ) ( ON ?auto_58434 ?auto_58440 ) ( not ( = ?auto_58434 ?auto_58440 ) ) ( not ( = ?auto_58435 ?auto_58440 ) ) ( not ( = ?auto_58436 ?auto_58440 ) ) ( not ( = ?auto_58437 ?auto_58440 ) ) ( not ( = ?auto_58438 ?auto_58440 ) ) ( not ( = ?auto_58439 ?auto_58440 ) ) ( ON ?auto_58435 ?auto_58434 ) ( ON-TABLE ?auto_58440 ) ( ON ?auto_58436 ?auto_58435 ) ( ON ?auto_58437 ?auto_58436 ) ( CLEAR ?auto_58439 ) ( ON ?auto_58438 ?auto_58437 ) ( CLEAR ?auto_58438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58440 ?auto_58434 ?auto_58435 ?auto_58436 ?auto_58437 )
      ( MAKE-6PILE ?auto_58434 ?auto_58435 ?auto_58436 ?auto_58437 ?auto_58438 ?auto_58439 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58441 - BLOCK
      ?auto_58442 - BLOCK
      ?auto_58443 - BLOCK
      ?auto_58444 - BLOCK
      ?auto_58445 - BLOCK
      ?auto_58446 - BLOCK
    )
    :vars
    (
      ?auto_58447 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58441 ?auto_58442 ) ) ( not ( = ?auto_58441 ?auto_58443 ) ) ( not ( = ?auto_58441 ?auto_58444 ) ) ( not ( = ?auto_58441 ?auto_58445 ) ) ( not ( = ?auto_58441 ?auto_58446 ) ) ( not ( = ?auto_58442 ?auto_58443 ) ) ( not ( = ?auto_58442 ?auto_58444 ) ) ( not ( = ?auto_58442 ?auto_58445 ) ) ( not ( = ?auto_58442 ?auto_58446 ) ) ( not ( = ?auto_58443 ?auto_58444 ) ) ( not ( = ?auto_58443 ?auto_58445 ) ) ( not ( = ?auto_58443 ?auto_58446 ) ) ( not ( = ?auto_58444 ?auto_58445 ) ) ( not ( = ?auto_58444 ?auto_58446 ) ) ( not ( = ?auto_58445 ?auto_58446 ) ) ( ON ?auto_58441 ?auto_58447 ) ( not ( = ?auto_58441 ?auto_58447 ) ) ( not ( = ?auto_58442 ?auto_58447 ) ) ( not ( = ?auto_58443 ?auto_58447 ) ) ( not ( = ?auto_58444 ?auto_58447 ) ) ( not ( = ?auto_58445 ?auto_58447 ) ) ( not ( = ?auto_58446 ?auto_58447 ) ) ( ON ?auto_58442 ?auto_58441 ) ( ON-TABLE ?auto_58447 ) ( ON ?auto_58443 ?auto_58442 ) ( ON ?auto_58444 ?auto_58443 ) ( ON ?auto_58445 ?auto_58444 ) ( CLEAR ?auto_58445 ) ( HOLDING ?auto_58446 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_58446 )
      ( MAKE-6PILE ?auto_58441 ?auto_58442 ?auto_58443 ?auto_58444 ?auto_58445 ?auto_58446 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58448 - BLOCK
      ?auto_58449 - BLOCK
      ?auto_58450 - BLOCK
      ?auto_58451 - BLOCK
      ?auto_58452 - BLOCK
      ?auto_58453 - BLOCK
    )
    :vars
    (
      ?auto_58454 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58448 ?auto_58449 ) ) ( not ( = ?auto_58448 ?auto_58450 ) ) ( not ( = ?auto_58448 ?auto_58451 ) ) ( not ( = ?auto_58448 ?auto_58452 ) ) ( not ( = ?auto_58448 ?auto_58453 ) ) ( not ( = ?auto_58449 ?auto_58450 ) ) ( not ( = ?auto_58449 ?auto_58451 ) ) ( not ( = ?auto_58449 ?auto_58452 ) ) ( not ( = ?auto_58449 ?auto_58453 ) ) ( not ( = ?auto_58450 ?auto_58451 ) ) ( not ( = ?auto_58450 ?auto_58452 ) ) ( not ( = ?auto_58450 ?auto_58453 ) ) ( not ( = ?auto_58451 ?auto_58452 ) ) ( not ( = ?auto_58451 ?auto_58453 ) ) ( not ( = ?auto_58452 ?auto_58453 ) ) ( ON ?auto_58448 ?auto_58454 ) ( not ( = ?auto_58448 ?auto_58454 ) ) ( not ( = ?auto_58449 ?auto_58454 ) ) ( not ( = ?auto_58450 ?auto_58454 ) ) ( not ( = ?auto_58451 ?auto_58454 ) ) ( not ( = ?auto_58452 ?auto_58454 ) ) ( not ( = ?auto_58453 ?auto_58454 ) ) ( ON ?auto_58449 ?auto_58448 ) ( ON-TABLE ?auto_58454 ) ( ON ?auto_58450 ?auto_58449 ) ( ON ?auto_58451 ?auto_58450 ) ( ON ?auto_58452 ?auto_58451 ) ( ON ?auto_58453 ?auto_58452 ) ( CLEAR ?auto_58453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_58454 ?auto_58448 ?auto_58449 ?auto_58450 ?auto_58451 ?auto_58452 )
      ( MAKE-6PILE ?auto_58448 ?auto_58449 ?auto_58450 ?auto_58451 ?auto_58452 ?auto_58453 ) )
  )

)

