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

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28883 - BLOCK
      ?auto_28884 - BLOCK
      ?auto_28885 - BLOCK
      ?auto_28886 - BLOCK
      ?auto_28887 - BLOCK
    )
    :vars
    (
      ?auto_28888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28888 ?auto_28887 ) ( CLEAR ?auto_28888 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28883 ) ( ON ?auto_28884 ?auto_28883 ) ( ON ?auto_28885 ?auto_28884 ) ( ON ?auto_28886 ?auto_28885 ) ( ON ?auto_28887 ?auto_28886 ) ( not ( = ?auto_28883 ?auto_28884 ) ) ( not ( = ?auto_28883 ?auto_28885 ) ) ( not ( = ?auto_28883 ?auto_28886 ) ) ( not ( = ?auto_28883 ?auto_28887 ) ) ( not ( = ?auto_28883 ?auto_28888 ) ) ( not ( = ?auto_28884 ?auto_28885 ) ) ( not ( = ?auto_28884 ?auto_28886 ) ) ( not ( = ?auto_28884 ?auto_28887 ) ) ( not ( = ?auto_28884 ?auto_28888 ) ) ( not ( = ?auto_28885 ?auto_28886 ) ) ( not ( = ?auto_28885 ?auto_28887 ) ) ( not ( = ?auto_28885 ?auto_28888 ) ) ( not ( = ?auto_28886 ?auto_28887 ) ) ( not ( = ?auto_28886 ?auto_28888 ) ) ( not ( = ?auto_28887 ?auto_28888 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28888 ?auto_28887 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28890 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_28890 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_28890 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28891 - BLOCK
    )
    :vars
    (
      ?auto_28892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28891 ?auto_28892 ) ( CLEAR ?auto_28891 ) ( HAND-EMPTY ) ( not ( = ?auto_28891 ?auto_28892 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28891 ?auto_28892 )
      ( MAKE-1PILE ?auto_28891 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28897 - BLOCK
      ?auto_28898 - BLOCK
      ?auto_28899 - BLOCK
      ?auto_28900 - BLOCK
    )
    :vars
    (
      ?auto_28901 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28901 ?auto_28900 ) ( CLEAR ?auto_28901 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28897 ) ( ON ?auto_28898 ?auto_28897 ) ( ON ?auto_28899 ?auto_28898 ) ( ON ?auto_28900 ?auto_28899 ) ( not ( = ?auto_28897 ?auto_28898 ) ) ( not ( = ?auto_28897 ?auto_28899 ) ) ( not ( = ?auto_28897 ?auto_28900 ) ) ( not ( = ?auto_28897 ?auto_28901 ) ) ( not ( = ?auto_28898 ?auto_28899 ) ) ( not ( = ?auto_28898 ?auto_28900 ) ) ( not ( = ?auto_28898 ?auto_28901 ) ) ( not ( = ?auto_28899 ?auto_28900 ) ) ( not ( = ?auto_28899 ?auto_28901 ) ) ( not ( = ?auto_28900 ?auto_28901 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28901 ?auto_28900 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28902 - BLOCK
      ?auto_28903 - BLOCK
      ?auto_28904 - BLOCK
      ?auto_28905 - BLOCK
    )
    :vars
    (
      ?auto_28906 - BLOCK
      ?auto_28907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28906 ?auto_28905 ) ( CLEAR ?auto_28906 ) ( ON-TABLE ?auto_28902 ) ( ON ?auto_28903 ?auto_28902 ) ( ON ?auto_28904 ?auto_28903 ) ( ON ?auto_28905 ?auto_28904 ) ( not ( = ?auto_28902 ?auto_28903 ) ) ( not ( = ?auto_28902 ?auto_28904 ) ) ( not ( = ?auto_28902 ?auto_28905 ) ) ( not ( = ?auto_28902 ?auto_28906 ) ) ( not ( = ?auto_28903 ?auto_28904 ) ) ( not ( = ?auto_28903 ?auto_28905 ) ) ( not ( = ?auto_28903 ?auto_28906 ) ) ( not ( = ?auto_28904 ?auto_28905 ) ) ( not ( = ?auto_28904 ?auto_28906 ) ) ( not ( = ?auto_28905 ?auto_28906 ) ) ( HOLDING ?auto_28907 ) ( not ( = ?auto_28902 ?auto_28907 ) ) ( not ( = ?auto_28903 ?auto_28907 ) ) ( not ( = ?auto_28904 ?auto_28907 ) ) ( not ( = ?auto_28905 ?auto_28907 ) ) ( not ( = ?auto_28906 ?auto_28907 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_28907 )
      ( MAKE-4PILE ?auto_28902 ?auto_28903 ?auto_28904 ?auto_28905 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28908 - BLOCK
      ?auto_28909 - BLOCK
      ?auto_28910 - BLOCK
      ?auto_28911 - BLOCK
    )
    :vars
    (
      ?auto_28913 - BLOCK
      ?auto_28912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28913 ?auto_28911 ) ( ON-TABLE ?auto_28908 ) ( ON ?auto_28909 ?auto_28908 ) ( ON ?auto_28910 ?auto_28909 ) ( ON ?auto_28911 ?auto_28910 ) ( not ( = ?auto_28908 ?auto_28909 ) ) ( not ( = ?auto_28908 ?auto_28910 ) ) ( not ( = ?auto_28908 ?auto_28911 ) ) ( not ( = ?auto_28908 ?auto_28913 ) ) ( not ( = ?auto_28909 ?auto_28910 ) ) ( not ( = ?auto_28909 ?auto_28911 ) ) ( not ( = ?auto_28909 ?auto_28913 ) ) ( not ( = ?auto_28910 ?auto_28911 ) ) ( not ( = ?auto_28910 ?auto_28913 ) ) ( not ( = ?auto_28911 ?auto_28913 ) ) ( not ( = ?auto_28908 ?auto_28912 ) ) ( not ( = ?auto_28909 ?auto_28912 ) ) ( not ( = ?auto_28910 ?auto_28912 ) ) ( not ( = ?auto_28911 ?auto_28912 ) ) ( not ( = ?auto_28913 ?auto_28912 ) ) ( ON ?auto_28912 ?auto_28913 ) ( CLEAR ?auto_28912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28908 ?auto_28909 ?auto_28910 ?auto_28911 ?auto_28913 )
      ( MAKE-4PILE ?auto_28908 ?auto_28909 ?auto_28910 ?auto_28911 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28916 - BLOCK
      ?auto_28917 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_28917 ) ( CLEAR ?auto_28916 ) ( ON-TABLE ?auto_28916 ) ( not ( = ?auto_28916 ?auto_28917 ) ) )
    :subtasks
    ( ( !STACK ?auto_28917 ?auto_28916 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28918 - BLOCK
      ?auto_28919 - BLOCK
    )
    :vars
    (
      ?auto_28920 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_28918 ) ( ON-TABLE ?auto_28918 ) ( not ( = ?auto_28918 ?auto_28919 ) ) ( ON ?auto_28919 ?auto_28920 ) ( CLEAR ?auto_28919 ) ( HAND-EMPTY ) ( not ( = ?auto_28918 ?auto_28920 ) ) ( not ( = ?auto_28919 ?auto_28920 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28919 ?auto_28920 )
      ( MAKE-2PILE ?auto_28918 ?auto_28919 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28921 - BLOCK
      ?auto_28922 - BLOCK
    )
    :vars
    (
      ?auto_28923 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28921 ?auto_28922 ) ) ( ON ?auto_28922 ?auto_28923 ) ( CLEAR ?auto_28922 ) ( not ( = ?auto_28921 ?auto_28923 ) ) ( not ( = ?auto_28922 ?auto_28923 ) ) ( HOLDING ?auto_28921 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28921 )
      ( MAKE-2PILE ?auto_28921 ?auto_28922 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28924 - BLOCK
      ?auto_28925 - BLOCK
    )
    :vars
    (
      ?auto_28926 - BLOCK
      ?auto_28928 - BLOCK
      ?auto_28929 - BLOCK
      ?auto_28927 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28924 ?auto_28925 ) ) ( ON ?auto_28925 ?auto_28926 ) ( not ( = ?auto_28924 ?auto_28926 ) ) ( not ( = ?auto_28925 ?auto_28926 ) ) ( ON ?auto_28924 ?auto_28925 ) ( CLEAR ?auto_28924 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28928 ) ( ON ?auto_28929 ?auto_28928 ) ( ON ?auto_28927 ?auto_28929 ) ( ON ?auto_28926 ?auto_28927 ) ( not ( = ?auto_28928 ?auto_28929 ) ) ( not ( = ?auto_28928 ?auto_28927 ) ) ( not ( = ?auto_28928 ?auto_28926 ) ) ( not ( = ?auto_28928 ?auto_28925 ) ) ( not ( = ?auto_28928 ?auto_28924 ) ) ( not ( = ?auto_28929 ?auto_28927 ) ) ( not ( = ?auto_28929 ?auto_28926 ) ) ( not ( = ?auto_28929 ?auto_28925 ) ) ( not ( = ?auto_28929 ?auto_28924 ) ) ( not ( = ?auto_28927 ?auto_28926 ) ) ( not ( = ?auto_28927 ?auto_28925 ) ) ( not ( = ?auto_28927 ?auto_28924 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28928 ?auto_28929 ?auto_28927 ?auto_28926 ?auto_28925 )
      ( MAKE-2PILE ?auto_28924 ?auto_28925 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28933 - BLOCK
      ?auto_28934 - BLOCK
      ?auto_28935 - BLOCK
    )
    :vars
    (
      ?auto_28936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28936 ?auto_28935 ) ( CLEAR ?auto_28936 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28933 ) ( ON ?auto_28934 ?auto_28933 ) ( ON ?auto_28935 ?auto_28934 ) ( not ( = ?auto_28933 ?auto_28934 ) ) ( not ( = ?auto_28933 ?auto_28935 ) ) ( not ( = ?auto_28933 ?auto_28936 ) ) ( not ( = ?auto_28934 ?auto_28935 ) ) ( not ( = ?auto_28934 ?auto_28936 ) ) ( not ( = ?auto_28935 ?auto_28936 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28936 ?auto_28935 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28937 - BLOCK
      ?auto_28938 - BLOCK
      ?auto_28939 - BLOCK
    )
    :vars
    (
      ?auto_28940 - BLOCK
      ?auto_28941 - BLOCK
      ?auto_28942 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28940 ?auto_28939 ) ( CLEAR ?auto_28940 ) ( ON-TABLE ?auto_28937 ) ( ON ?auto_28938 ?auto_28937 ) ( ON ?auto_28939 ?auto_28938 ) ( not ( = ?auto_28937 ?auto_28938 ) ) ( not ( = ?auto_28937 ?auto_28939 ) ) ( not ( = ?auto_28937 ?auto_28940 ) ) ( not ( = ?auto_28938 ?auto_28939 ) ) ( not ( = ?auto_28938 ?auto_28940 ) ) ( not ( = ?auto_28939 ?auto_28940 ) ) ( HOLDING ?auto_28941 ) ( CLEAR ?auto_28942 ) ( not ( = ?auto_28937 ?auto_28941 ) ) ( not ( = ?auto_28937 ?auto_28942 ) ) ( not ( = ?auto_28938 ?auto_28941 ) ) ( not ( = ?auto_28938 ?auto_28942 ) ) ( not ( = ?auto_28939 ?auto_28941 ) ) ( not ( = ?auto_28939 ?auto_28942 ) ) ( not ( = ?auto_28940 ?auto_28941 ) ) ( not ( = ?auto_28940 ?auto_28942 ) ) ( not ( = ?auto_28941 ?auto_28942 ) ) )
    :subtasks
    ( ( !STACK ?auto_28941 ?auto_28942 )
      ( MAKE-3PILE ?auto_28937 ?auto_28938 ?auto_28939 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29305 - BLOCK
      ?auto_29306 - BLOCK
      ?auto_29307 - BLOCK
    )
    :vars
    (
      ?auto_29308 - BLOCK
      ?auto_29309 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29308 ?auto_29307 ) ( ON-TABLE ?auto_29305 ) ( ON ?auto_29306 ?auto_29305 ) ( ON ?auto_29307 ?auto_29306 ) ( not ( = ?auto_29305 ?auto_29306 ) ) ( not ( = ?auto_29305 ?auto_29307 ) ) ( not ( = ?auto_29305 ?auto_29308 ) ) ( not ( = ?auto_29306 ?auto_29307 ) ) ( not ( = ?auto_29306 ?auto_29308 ) ) ( not ( = ?auto_29307 ?auto_29308 ) ) ( not ( = ?auto_29305 ?auto_29309 ) ) ( not ( = ?auto_29306 ?auto_29309 ) ) ( not ( = ?auto_29307 ?auto_29309 ) ) ( not ( = ?auto_29308 ?auto_29309 ) ) ( ON ?auto_29309 ?auto_29308 ) ( CLEAR ?auto_29309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29305 ?auto_29306 ?auto_29307 ?auto_29308 )
      ( MAKE-3PILE ?auto_29305 ?auto_29306 ?auto_29307 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28949 - BLOCK
      ?auto_28950 - BLOCK
      ?auto_28951 - BLOCK
    )
    :vars
    (
      ?auto_28954 - BLOCK
      ?auto_28952 - BLOCK
      ?auto_28953 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28954 ?auto_28951 ) ( ON-TABLE ?auto_28949 ) ( ON ?auto_28950 ?auto_28949 ) ( ON ?auto_28951 ?auto_28950 ) ( not ( = ?auto_28949 ?auto_28950 ) ) ( not ( = ?auto_28949 ?auto_28951 ) ) ( not ( = ?auto_28949 ?auto_28954 ) ) ( not ( = ?auto_28950 ?auto_28951 ) ) ( not ( = ?auto_28950 ?auto_28954 ) ) ( not ( = ?auto_28951 ?auto_28954 ) ) ( not ( = ?auto_28949 ?auto_28952 ) ) ( not ( = ?auto_28949 ?auto_28953 ) ) ( not ( = ?auto_28950 ?auto_28952 ) ) ( not ( = ?auto_28950 ?auto_28953 ) ) ( not ( = ?auto_28951 ?auto_28952 ) ) ( not ( = ?auto_28951 ?auto_28953 ) ) ( not ( = ?auto_28954 ?auto_28952 ) ) ( not ( = ?auto_28954 ?auto_28953 ) ) ( not ( = ?auto_28952 ?auto_28953 ) ) ( ON ?auto_28952 ?auto_28954 ) ( CLEAR ?auto_28952 ) ( HOLDING ?auto_28953 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28953 )
      ( MAKE-3PILE ?auto_28949 ?auto_28950 ?auto_28951 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28955 - BLOCK
      ?auto_28956 - BLOCK
      ?auto_28957 - BLOCK
    )
    :vars
    (
      ?auto_28960 - BLOCK
      ?auto_28959 - BLOCK
      ?auto_28958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28960 ?auto_28957 ) ( ON-TABLE ?auto_28955 ) ( ON ?auto_28956 ?auto_28955 ) ( ON ?auto_28957 ?auto_28956 ) ( not ( = ?auto_28955 ?auto_28956 ) ) ( not ( = ?auto_28955 ?auto_28957 ) ) ( not ( = ?auto_28955 ?auto_28960 ) ) ( not ( = ?auto_28956 ?auto_28957 ) ) ( not ( = ?auto_28956 ?auto_28960 ) ) ( not ( = ?auto_28957 ?auto_28960 ) ) ( not ( = ?auto_28955 ?auto_28959 ) ) ( not ( = ?auto_28955 ?auto_28958 ) ) ( not ( = ?auto_28956 ?auto_28959 ) ) ( not ( = ?auto_28956 ?auto_28958 ) ) ( not ( = ?auto_28957 ?auto_28959 ) ) ( not ( = ?auto_28957 ?auto_28958 ) ) ( not ( = ?auto_28960 ?auto_28959 ) ) ( not ( = ?auto_28960 ?auto_28958 ) ) ( not ( = ?auto_28959 ?auto_28958 ) ) ( ON ?auto_28959 ?auto_28960 ) ( ON ?auto_28958 ?auto_28959 ) ( CLEAR ?auto_28958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28955 ?auto_28956 ?auto_28957 ?auto_28960 ?auto_28959 )
      ( MAKE-3PILE ?auto_28955 ?auto_28956 ?auto_28957 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28964 - BLOCK
      ?auto_28965 - BLOCK
      ?auto_28966 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_28966 ) ( CLEAR ?auto_28965 ) ( ON-TABLE ?auto_28964 ) ( ON ?auto_28965 ?auto_28964 ) ( not ( = ?auto_28964 ?auto_28965 ) ) ( not ( = ?auto_28964 ?auto_28966 ) ) ( not ( = ?auto_28965 ?auto_28966 ) ) )
    :subtasks
    ( ( !STACK ?auto_28966 ?auto_28965 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28967 - BLOCK
      ?auto_28968 - BLOCK
      ?auto_28969 - BLOCK
    )
    :vars
    (
      ?auto_28970 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_28968 ) ( ON-TABLE ?auto_28967 ) ( ON ?auto_28968 ?auto_28967 ) ( not ( = ?auto_28967 ?auto_28968 ) ) ( not ( = ?auto_28967 ?auto_28969 ) ) ( not ( = ?auto_28968 ?auto_28969 ) ) ( ON ?auto_28969 ?auto_28970 ) ( CLEAR ?auto_28969 ) ( HAND-EMPTY ) ( not ( = ?auto_28967 ?auto_28970 ) ) ( not ( = ?auto_28968 ?auto_28970 ) ) ( not ( = ?auto_28969 ?auto_28970 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28969 ?auto_28970 )
      ( MAKE-3PILE ?auto_28967 ?auto_28968 ?auto_28969 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28971 - BLOCK
      ?auto_28972 - BLOCK
      ?auto_28973 - BLOCK
    )
    :vars
    (
      ?auto_28974 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28971 ) ( not ( = ?auto_28971 ?auto_28972 ) ) ( not ( = ?auto_28971 ?auto_28973 ) ) ( not ( = ?auto_28972 ?auto_28973 ) ) ( ON ?auto_28973 ?auto_28974 ) ( CLEAR ?auto_28973 ) ( not ( = ?auto_28971 ?auto_28974 ) ) ( not ( = ?auto_28972 ?auto_28974 ) ) ( not ( = ?auto_28973 ?auto_28974 ) ) ( HOLDING ?auto_28972 ) ( CLEAR ?auto_28971 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28971 ?auto_28972 )
      ( MAKE-3PILE ?auto_28971 ?auto_28972 ?auto_28973 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28975 - BLOCK
      ?auto_28976 - BLOCK
      ?auto_28977 - BLOCK
    )
    :vars
    (
      ?auto_28978 - BLOCK
      ?auto_28979 - BLOCK
      ?auto_28980 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28975 ) ( not ( = ?auto_28975 ?auto_28976 ) ) ( not ( = ?auto_28975 ?auto_28977 ) ) ( not ( = ?auto_28976 ?auto_28977 ) ) ( ON ?auto_28977 ?auto_28978 ) ( not ( = ?auto_28975 ?auto_28978 ) ) ( not ( = ?auto_28976 ?auto_28978 ) ) ( not ( = ?auto_28977 ?auto_28978 ) ) ( CLEAR ?auto_28975 ) ( ON ?auto_28976 ?auto_28977 ) ( CLEAR ?auto_28976 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28979 ) ( ON ?auto_28980 ?auto_28979 ) ( ON ?auto_28978 ?auto_28980 ) ( not ( = ?auto_28979 ?auto_28980 ) ) ( not ( = ?auto_28979 ?auto_28978 ) ) ( not ( = ?auto_28979 ?auto_28977 ) ) ( not ( = ?auto_28979 ?auto_28976 ) ) ( not ( = ?auto_28980 ?auto_28978 ) ) ( not ( = ?auto_28980 ?auto_28977 ) ) ( not ( = ?auto_28980 ?auto_28976 ) ) ( not ( = ?auto_28975 ?auto_28979 ) ) ( not ( = ?auto_28975 ?auto_28980 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28979 ?auto_28980 ?auto_28978 ?auto_28977 )
      ( MAKE-3PILE ?auto_28975 ?auto_28976 ?auto_28977 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28981 - BLOCK
      ?auto_28982 - BLOCK
      ?auto_28983 - BLOCK
    )
    :vars
    (
      ?auto_28985 - BLOCK
      ?auto_28984 - BLOCK
      ?auto_28986 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28981 ?auto_28982 ) ) ( not ( = ?auto_28981 ?auto_28983 ) ) ( not ( = ?auto_28982 ?auto_28983 ) ) ( ON ?auto_28983 ?auto_28985 ) ( not ( = ?auto_28981 ?auto_28985 ) ) ( not ( = ?auto_28982 ?auto_28985 ) ) ( not ( = ?auto_28983 ?auto_28985 ) ) ( ON ?auto_28982 ?auto_28983 ) ( CLEAR ?auto_28982 ) ( ON-TABLE ?auto_28984 ) ( ON ?auto_28986 ?auto_28984 ) ( ON ?auto_28985 ?auto_28986 ) ( not ( = ?auto_28984 ?auto_28986 ) ) ( not ( = ?auto_28984 ?auto_28985 ) ) ( not ( = ?auto_28984 ?auto_28983 ) ) ( not ( = ?auto_28984 ?auto_28982 ) ) ( not ( = ?auto_28986 ?auto_28985 ) ) ( not ( = ?auto_28986 ?auto_28983 ) ) ( not ( = ?auto_28986 ?auto_28982 ) ) ( not ( = ?auto_28981 ?auto_28984 ) ) ( not ( = ?auto_28981 ?auto_28986 ) ) ( HOLDING ?auto_28981 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28981 )
      ( MAKE-3PILE ?auto_28981 ?auto_28982 ?auto_28983 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28987 - BLOCK
      ?auto_28988 - BLOCK
      ?auto_28989 - BLOCK
    )
    :vars
    (
      ?auto_28990 - BLOCK
      ?auto_28992 - BLOCK
      ?auto_28991 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28987 ?auto_28988 ) ) ( not ( = ?auto_28987 ?auto_28989 ) ) ( not ( = ?auto_28988 ?auto_28989 ) ) ( ON ?auto_28989 ?auto_28990 ) ( not ( = ?auto_28987 ?auto_28990 ) ) ( not ( = ?auto_28988 ?auto_28990 ) ) ( not ( = ?auto_28989 ?auto_28990 ) ) ( ON ?auto_28988 ?auto_28989 ) ( ON-TABLE ?auto_28992 ) ( ON ?auto_28991 ?auto_28992 ) ( ON ?auto_28990 ?auto_28991 ) ( not ( = ?auto_28992 ?auto_28991 ) ) ( not ( = ?auto_28992 ?auto_28990 ) ) ( not ( = ?auto_28992 ?auto_28989 ) ) ( not ( = ?auto_28992 ?auto_28988 ) ) ( not ( = ?auto_28991 ?auto_28990 ) ) ( not ( = ?auto_28991 ?auto_28989 ) ) ( not ( = ?auto_28991 ?auto_28988 ) ) ( not ( = ?auto_28987 ?auto_28992 ) ) ( not ( = ?auto_28987 ?auto_28991 ) ) ( ON ?auto_28987 ?auto_28988 ) ( CLEAR ?auto_28987 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28992 ?auto_28991 ?auto_28990 ?auto_28989 ?auto_28988 )
      ( MAKE-3PILE ?auto_28987 ?auto_28988 ?auto_28989 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28995 - BLOCK
      ?auto_28996 - BLOCK
    )
    :vars
    (
      ?auto_28997 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28997 ?auto_28996 ) ( CLEAR ?auto_28997 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28995 ) ( ON ?auto_28996 ?auto_28995 ) ( not ( = ?auto_28995 ?auto_28996 ) ) ( not ( = ?auto_28995 ?auto_28997 ) ) ( not ( = ?auto_28996 ?auto_28997 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28997 ?auto_28996 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28998 - BLOCK
      ?auto_28999 - BLOCK
    )
    :vars
    (
      ?auto_29000 - BLOCK
      ?auto_29001 - BLOCK
      ?auto_29002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29000 ?auto_28999 ) ( CLEAR ?auto_29000 ) ( ON-TABLE ?auto_28998 ) ( ON ?auto_28999 ?auto_28998 ) ( not ( = ?auto_28998 ?auto_28999 ) ) ( not ( = ?auto_28998 ?auto_29000 ) ) ( not ( = ?auto_28999 ?auto_29000 ) ) ( HOLDING ?auto_29001 ) ( CLEAR ?auto_29002 ) ( not ( = ?auto_28998 ?auto_29001 ) ) ( not ( = ?auto_28998 ?auto_29002 ) ) ( not ( = ?auto_28999 ?auto_29001 ) ) ( not ( = ?auto_28999 ?auto_29002 ) ) ( not ( = ?auto_29000 ?auto_29001 ) ) ( not ( = ?auto_29000 ?auto_29002 ) ) ( not ( = ?auto_29001 ?auto_29002 ) ) )
    :subtasks
    ( ( !STACK ?auto_29001 ?auto_29002 )
      ( MAKE-2PILE ?auto_28998 ?auto_28999 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29003 - BLOCK
      ?auto_29004 - BLOCK
    )
    :vars
    (
      ?auto_29005 - BLOCK
      ?auto_29007 - BLOCK
      ?auto_29006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29005 ?auto_29004 ) ( ON-TABLE ?auto_29003 ) ( ON ?auto_29004 ?auto_29003 ) ( not ( = ?auto_29003 ?auto_29004 ) ) ( not ( = ?auto_29003 ?auto_29005 ) ) ( not ( = ?auto_29004 ?auto_29005 ) ) ( CLEAR ?auto_29007 ) ( not ( = ?auto_29003 ?auto_29006 ) ) ( not ( = ?auto_29003 ?auto_29007 ) ) ( not ( = ?auto_29004 ?auto_29006 ) ) ( not ( = ?auto_29004 ?auto_29007 ) ) ( not ( = ?auto_29005 ?auto_29006 ) ) ( not ( = ?auto_29005 ?auto_29007 ) ) ( not ( = ?auto_29006 ?auto_29007 ) ) ( ON ?auto_29006 ?auto_29005 ) ( CLEAR ?auto_29006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29003 ?auto_29004 ?auto_29005 )
      ( MAKE-2PILE ?auto_29003 ?auto_29004 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29008 - BLOCK
      ?auto_29009 - BLOCK
    )
    :vars
    (
      ?auto_29010 - BLOCK
      ?auto_29011 - BLOCK
      ?auto_29012 - BLOCK
      ?auto_29013 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29010 ?auto_29009 ) ( ON-TABLE ?auto_29008 ) ( ON ?auto_29009 ?auto_29008 ) ( not ( = ?auto_29008 ?auto_29009 ) ) ( not ( = ?auto_29008 ?auto_29010 ) ) ( not ( = ?auto_29009 ?auto_29010 ) ) ( not ( = ?auto_29008 ?auto_29011 ) ) ( not ( = ?auto_29008 ?auto_29012 ) ) ( not ( = ?auto_29009 ?auto_29011 ) ) ( not ( = ?auto_29009 ?auto_29012 ) ) ( not ( = ?auto_29010 ?auto_29011 ) ) ( not ( = ?auto_29010 ?auto_29012 ) ) ( not ( = ?auto_29011 ?auto_29012 ) ) ( ON ?auto_29011 ?auto_29010 ) ( CLEAR ?auto_29011 ) ( HOLDING ?auto_29012 ) ( CLEAR ?auto_29013 ) ( ON-TABLE ?auto_29013 ) ( not ( = ?auto_29013 ?auto_29012 ) ) ( not ( = ?auto_29008 ?auto_29013 ) ) ( not ( = ?auto_29009 ?auto_29013 ) ) ( not ( = ?auto_29010 ?auto_29013 ) ) ( not ( = ?auto_29011 ?auto_29013 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29013 ?auto_29012 )
      ( MAKE-2PILE ?auto_29008 ?auto_29009 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29432 - BLOCK
      ?auto_29433 - BLOCK
    )
    :vars
    (
      ?auto_29435 - BLOCK
      ?auto_29434 - BLOCK
      ?auto_29436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29435 ?auto_29433 ) ( ON-TABLE ?auto_29432 ) ( ON ?auto_29433 ?auto_29432 ) ( not ( = ?auto_29432 ?auto_29433 ) ) ( not ( = ?auto_29432 ?auto_29435 ) ) ( not ( = ?auto_29433 ?auto_29435 ) ) ( not ( = ?auto_29432 ?auto_29434 ) ) ( not ( = ?auto_29432 ?auto_29436 ) ) ( not ( = ?auto_29433 ?auto_29434 ) ) ( not ( = ?auto_29433 ?auto_29436 ) ) ( not ( = ?auto_29435 ?auto_29434 ) ) ( not ( = ?auto_29435 ?auto_29436 ) ) ( not ( = ?auto_29434 ?auto_29436 ) ) ( ON ?auto_29434 ?auto_29435 ) ( ON ?auto_29436 ?auto_29434 ) ( CLEAR ?auto_29436 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29432 ?auto_29433 ?auto_29435 ?auto_29434 )
      ( MAKE-2PILE ?auto_29432 ?auto_29433 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29020 - BLOCK
      ?auto_29021 - BLOCK
    )
    :vars
    (
      ?auto_29025 - BLOCK
      ?auto_29023 - BLOCK
      ?auto_29024 - BLOCK
      ?auto_29022 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29025 ?auto_29021 ) ( ON-TABLE ?auto_29020 ) ( ON ?auto_29021 ?auto_29020 ) ( not ( = ?auto_29020 ?auto_29021 ) ) ( not ( = ?auto_29020 ?auto_29025 ) ) ( not ( = ?auto_29021 ?auto_29025 ) ) ( not ( = ?auto_29020 ?auto_29023 ) ) ( not ( = ?auto_29020 ?auto_29024 ) ) ( not ( = ?auto_29021 ?auto_29023 ) ) ( not ( = ?auto_29021 ?auto_29024 ) ) ( not ( = ?auto_29025 ?auto_29023 ) ) ( not ( = ?auto_29025 ?auto_29024 ) ) ( not ( = ?auto_29023 ?auto_29024 ) ) ( ON ?auto_29023 ?auto_29025 ) ( not ( = ?auto_29022 ?auto_29024 ) ) ( not ( = ?auto_29020 ?auto_29022 ) ) ( not ( = ?auto_29021 ?auto_29022 ) ) ( not ( = ?auto_29025 ?auto_29022 ) ) ( not ( = ?auto_29023 ?auto_29022 ) ) ( ON ?auto_29024 ?auto_29023 ) ( CLEAR ?auto_29024 ) ( HOLDING ?auto_29022 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29022 )
      ( MAKE-2PILE ?auto_29020 ?auto_29021 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29026 - BLOCK
      ?auto_29027 - BLOCK
    )
    :vars
    (
      ?auto_29028 - BLOCK
      ?auto_29031 - BLOCK
      ?auto_29029 - BLOCK
      ?auto_29030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29028 ?auto_29027 ) ( ON-TABLE ?auto_29026 ) ( ON ?auto_29027 ?auto_29026 ) ( not ( = ?auto_29026 ?auto_29027 ) ) ( not ( = ?auto_29026 ?auto_29028 ) ) ( not ( = ?auto_29027 ?auto_29028 ) ) ( not ( = ?auto_29026 ?auto_29031 ) ) ( not ( = ?auto_29026 ?auto_29029 ) ) ( not ( = ?auto_29027 ?auto_29031 ) ) ( not ( = ?auto_29027 ?auto_29029 ) ) ( not ( = ?auto_29028 ?auto_29031 ) ) ( not ( = ?auto_29028 ?auto_29029 ) ) ( not ( = ?auto_29031 ?auto_29029 ) ) ( ON ?auto_29031 ?auto_29028 ) ( not ( = ?auto_29030 ?auto_29029 ) ) ( not ( = ?auto_29026 ?auto_29030 ) ) ( not ( = ?auto_29027 ?auto_29030 ) ) ( not ( = ?auto_29028 ?auto_29030 ) ) ( not ( = ?auto_29031 ?auto_29030 ) ) ( ON ?auto_29029 ?auto_29031 ) ( ON ?auto_29030 ?auto_29029 ) ( CLEAR ?auto_29030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_29026 ?auto_29027 ?auto_29028 ?auto_29031 ?auto_29029 )
      ( MAKE-2PILE ?auto_29026 ?auto_29027 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29036 - BLOCK
      ?auto_29037 - BLOCK
      ?auto_29038 - BLOCK
      ?auto_29039 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_29039 ) ( CLEAR ?auto_29038 ) ( ON-TABLE ?auto_29036 ) ( ON ?auto_29037 ?auto_29036 ) ( ON ?auto_29038 ?auto_29037 ) ( not ( = ?auto_29036 ?auto_29037 ) ) ( not ( = ?auto_29036 ?auto_29038 ) ) ( not ( = ?auto_29036 ?auto_29039 ) ) ( not ( = ?auto_29037 ?auto_29038 ) ) ( not ( = ?auto_29037 ?auto_29039 ) ) ( not ( = ?auto_29038 ?auto_29039 ) ) )
    :subtasks
    ( ( !STACK ?auto_29039 ?auto_29038 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29040 - BLOCK
      ?auto_29041 - BLOCK
      ?auto_29042 - BLOCK
      ?auto_29043 - BLOCK
    )
    :vars
    (
      ?auto_29044 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_29042 ) ( ON-TABLE ?auto_29040 ) ( ON ?auto_29041 ?auto_29040 ) ( ON ?auto_29042 ?auto_29041 ) ( not ( = ?auto_29040 ?auto_29041 ) ) ( not ( = ?auto_29040 ?auto_29042 ) ) ( not ( = ?auto_29040 ?auto_29043 ) ) ( not ( = ?auto_29041 ?auto_29042 ) ) ( not ( = ?auto_29041 ?auto_29043 ) ) ( not ( = ?auto_29042 ?auto_29043 ) ) ( ON ?auto_29043 ?auto_29044 ) ( CLEAR ?auto_29043 ) ( HAND-EMPTY ) ( not ( = ?auto_29040 ?auto_29044 ) ) ( not ( = ?auto_29041 ?auto_29044 ) ) ( not ( = ?auto_29042 ?auto_29044 ) ) ( not ( = ?auto_29043 ?auto_29044 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29043 ?auto_29044 )
      ( MAKE-4PILE ?auto_29040 ?auto_29041 ?auto_29042 ?auto_29043 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29045 - BLOCK
      ?auto_29046 - BLOCK
      ?auto_29047 - BLOCK
      ?auto_29048 - BLOCK
    )
    :vars
    (
      ?auto_29049 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29045 ) ( ON ?auto_29046 ?auto_29045 ) ( not ( = ?auto_29045 ?auto_29046 ) ) ( not ( = ?auto_29045 ?auto_29047 ) ) ( not ( = ?auto_29045 ?auto_29048 ) ) ( not ( = ?auto_29046 ?auto_29047 ) ) ( not ( = ?auto_29046 ?auto_29048 ) ) ( not ( = ?auto_29047 ?auto_29048 ) ) ( ON ?auto_29048 ?auto_29049 ) ( CLEAR ?auto_29048 ) ( not ( = ?auto_29045 ?auto_29049 ) ) ( not ( = ?auto_29046 ?auto_29049 ) ) ( not ( = ?auto_29047 ?auto_29049 ) ) ( not ( = ?auto_29048 ?auto_29049 ) ) ( HOLDING ?auto_29047 ) ( CLEAR ?auto_29046 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29045 ?auto_29046 ?auto_29047 )
      ( MAKE-4PILE ?auto_29045 ?auto_29046 ?auto_29047 ?auto_29048 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29050 - BLOCK
      ?auto_29051 - BLOCK
      ?auto_29052 - BLOCK
      ?auto_29053 - BLOCK
    )
    :vars
    (
      ?auto_29054 - BLOCK
      ?auto_29055 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29050 ) ( ON ?auto_29051 ?auto_29050 ) ( not ( = ?auto_29050 ?auto_29051 ) ) ( not ( = ?auto_29050 ?auto_29052 ) ) ( not ( = ?auto_29050 ?auto_29053 ) ) ( not ( = ?auto_29051 ?auto_29052 ) ) ( not ( = ?auto_29051 ?auto_29053 ) ) ( not ( = ?auto_29052 ?auto_29053 ) ) ( ON ?auto_29053 ?auto_29054 ) ( not ( = ?auto_29050 ?auto_29054 ) ) ( not ( = ?auto_29051 ?auto_29054 ) ) ( not ( = ?auto_29052 ?auto_29054 ) ) ( not ( = ?auto_29053 ?auto_29054 ) ) ( CLEAR ?auto_29051 ) ( ON ?auto_29052 ?auto_29053 ) ( CLEAR ?auto_29052 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29055 ) ( ON ?auto_29054 ?auto_29055 ) ( not ( = ?auto_29055 ?auto_29054 ) ) ( not ( = ?auto_29055 ?auto_29053 ) ) ( not ( = ?auto_29055 ?auto_29052 ) ) ( not ( = ?auto_29050 ?auto_29055 ) ) ( not ( = ?auto_29051 ?auto_29055 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29055 ?auto_29054 ?auto_29053 )
      ( MAKE-4PILE ?auto_29050 ?auto_29051 ?auto_29052 ?auto_29053 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29056 - BLOCK
      ?auto_29057 - BLOCK
      ?auto_29058 - BLOCK
      ?auto_29059 - BLOCK
    )
    :vars
    (
      ?auto_29061 - BLOCK
      ?auto_29060 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29056 ) ( not ( = ?auto_29056 ?auto_29057 ) ) ( not ( = ?auto_29056 ?auto_29058 ) ) ( not ( = ?auto_29056 ?auto_29059 ) ) ( not ( = ?auto_29057 ?auto_29058 ) ) ( not ( = ?auto_29057 ?auto_29059 ) ) ( not ( = ?auto_29058 ?auto_29059 ) ) ( ON ?auto_29059 ?auto_29061 ) ( not ( = ?auto_29056 ?auto_29061 ) ) ( not ( = ?auto_29057 ?auto_29061 ) ) ( not ( = ?auto_29058 ?auto_29061 ) ) ( not ( = ?auto_29059 ?auto_29061 ) ) ( ON ?auto_29058 ?auto_29059 ) ( CLEAR ?auto_29058 ) ( ON-TABLE ?auto_29060 ) ( ON ?auto_29061 ?auto_29060 ) ( not ( = ?auto_29060 ?auto_29061 ) ) ( not ( = ?auto_29060 ?auto_29059 ) ) ( not ( = ?auto_29060 ?auto_29058 ) ) ( not ( = ?auto_29056 ?auto_29060 ) ) ( not ( = ?auto_29057 ?auto_29060 ) ) ( HOLDING ?auto_29057 ) ( CLEAR ?auto_29056 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29056 ?auto_29057 )
      ( MAKE-4PILE ?auto_29056 ?auto_29057 ?auto_29058 ?auto_29059 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29062 - BLOCK
      ?auto_29063 - BLOCK
      ?auto_29064 - BLOCK
      ?auto_29065 - BLOCK
    )
    :vars
    (
      ?auto_29067 - BLOCK
      ?auto_29066 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29062 ) ( not ( = ?auto_29062 ?auto_29063 ) ) ( not ( = ?auto_29062 ?auto_29064 ) ) ( not ( = ?auto_29062 ?auto_29065 ) ) ( not ( = ?auto_29063 ?auto_29064 ) ) ( not ( = ?auto_29063 ?auto_29065 ) ) ( not ( = ?auto_29064 ?auto_29065 ) ) ( ON ?auto_29065 ?auto_29067 ) ( not ( = ?auto_29062 ?auto_29067 ) ) ( not ( = ?auto_29063 ?auto_29067 ) ) ( not ( = ?auto_29064 ?auto_29067 ) ) ( not ( = ?auto_29065 ?auto_29067 ) ) ( ON ?auto_29064 ?auto_29065 ) ( ON-TABLE ?auto_29066 ) ( ON ?auto_29067 ?auto_29066 ) ( not ( = ?auto_29066 ?auto_29067 ) ) ( not ( = ?auto_29066 ?auto_29065 ) ) ( not ( = ?auto_29066 ?auto_29064 ) ) ( not ( = ?auto_29062 ?auto_29066 ) ) ( not ( = ?auto_29063 ?auto_29066 ) ) ( CLEAR ?auto_29062 ) ( ON ?auto_29063 ?auto_29064 ) ( CLEAR ?auto_29063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29066 ?auto_29067 ?auto_29065 ?auto_29064 )
      ( MAKE-4PILE ?auto_29062 ?auto_29063 ?auto_29064 ?auto_29065 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29068 - BLOCK
      ?auto_29069 - BLOCK
      ?auto_29070 - BLOCK
      ?auto_29071 - BLOCK
    )
    :vars
    (
      ?auto_29072 - BLOCK
      ?auto_29073 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29068 ?auto_29069 ) ) ( not ( = ?auto_29068 ?auto_29070 ) ) ( not ( = ?auto_29068 ?auto_29071 ) ) ( not ( = ?auto_29069 ?auto_29070 ) ) ( not ( = ?auto_29069 ?auto_29071 ) ) ( not ( = ?auto_29070 ?auto_29071 ) ) ( ON ?auto_29071 ?auto_29072 ) ( not ( = ?auto_29068 ?auto_29072 ) ) ( not ( = ?auto_29069 ?auto_29072 ) ) ( not ( = ?auto_29070 ?auto_29072 ) ) ( not ( = ?auto_29071 ?auto_29072 ) ) ( ON ?auto_29070 ?auto_29071 ) ( ON-TABLE ?auto_29073 ) ( ON ?auto_29072 ?auto_29073 ) ( not ( = ?auto_29073 ?auto_29072 ) ) ( not ( = ?auto_29073 ?auto_29071 ) ) ( not ( = ?auto_29073 ?auto_29070 ) ) ( not ( = ?auto_29068 ?auto_29073 ) ) ( not ( = ?auto_29069 ?auto_29073 ) ) ( ON ?auto_29069 ?auto_29070 ) ( CLEAR ?auto_29069 ) ( HOLDING ?auto_29068 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29068 )
      ( MAKE-4PILE ?auto_29068 ?auto_29069 ?auto_29070 ?auto_29071 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29074 - BLOCK
      ?auto_29075 - BLOCK
      ?auto_29076 - BLOCK
      ?auto_29077 - BLOCK
    )
    :vars
    (
      ?auto_29078 - BLOCK
      ?auto_29079 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29074 ?auto_29075 ) ) ( not ( = ?auto_29074 ?auto_29076 ) ) ( not ( = ?auto_29074 ?auto_29077 ) ) ( not ( = ?auto_29075 ?auto_29076 ) ) ( not ( = ?auto_29075 ?auto_29077 ) ) ( not ( = ?auto_29076 ?auto_29077 ) ) ( ON ?auto_29077 ?auto_29078 ) ( not ( = ?auto_29074 ?auto_29078 ) ) ( not ( = ?auto_29075 ?auto_29078 ) ) ( not ( = ?auto_29076 ?auto_29078 ) ) ( not ( = ?auto_29077 ?auto_29078 ) ) ( ON ?auto_29076 ?auto_29077 ) ( ON-TABLE ?auto_29079 ) ( ON ?auto_29078 ?auto_29079 ) ( not ( = ?auto_29079 ?auto_29078 ) ) ( not ( = ?auto_29079 ?auto_29077 ) ) ( not ( = ?auto_29079 ?auto_29076 ) ) ( not ( = ?auto_29074 ?auto_29079 ) ) ( not ( = ?auto_29075 ?auto_29079 ) ) ( ON ?auto_29075 ?auto_29076 ) ( ON ?auto_29074 ?auto_29075 ) ( CLEAR ?auto_29074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_29079 ?auto_29078 ?auto_29077 ?auto_29076 ?auto_29075 )
      ( MAKE-4PILE ?auto_29074 ?auto_29075 ?auto_29076 ?auto_29077 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29081 - BLOCK
    )
    :vars
    (
      ?auto_29082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29082 ?auto_29081 ) ( CLEAR ?auto_29082 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29081 ) ( not ( = ?auto_29081 ?auto_29082 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29082 ?auto_29081 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29083 - BLOCK
    )
    :vars
    (
      ?auto_29084 - BLOCK
      ?auto_29085 - BLOCK
      ?auto_29086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29084 ?auto_29083 ) ( CLEAR ?auto_29084 ) ( ON-TABLE ?auto_29083 ) ( not ( = ?auto_29083 ?auto_29084 ) ) ( HOLDING ?auto_29085 ) ( CLEAR ?auto_29086 ) ( not ( = ?auto_29083 ?auto_29085 ) ) ( not ( = ?auto_29083 ?auto_29086 ) ) ( not ( = ?auto_29084 ?auto_29085 ) ) ( not ( = ?auto_29084 ?auto_29086 ) ) ( not ( = ?auto_29085 ?auto_29086 ) ) )
    :subtasks
    ( ( !STACK ?auto_29085 ?auto_29086 )
      ( MAKE-1PILE ?auto_29083 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29087 - BLOCK
    )
    :vars
    (
      ?auto_29088 - BLOCK
      ?auto_29090 - BLOCK
      ?auto_29089 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29088 ?auto_29087 ) ( ON-TABLE ?auto_29087 ) ( not ( = ?auto_29087 ?auto_29088 ) ) ( CLEAR ?auto_29090 ) ( not ( = ?auto_29087 ?auto_29089 ) ) ( not ( = ?auto_29087 ?auto_29090 ) ) ( not ( = ?auto_29088 ?auto_29089 ) ) ( not ( = ?auto_29088 ?auto_29090 ) ) ( not ( = ?auto_29089 ?auto_29090 ) ) ( ON ?auto_29089 ?auto_29088 ) ( CLEAR ?auto_29089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29087 ?auto_29088 )
      ( MAKE-1PILE ?auto_29087 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29091 - BLOCK
    )
    :vars
    (
      ?auto_29094 - BLOCK
      ?auto_29093 - BLOCK
      ?auto_29092 - BLOCK
      ?auto_29095 - BLOCK
      ?auto_29096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29094 ?auto_29091 ) ( ON-TABLE ?auto_29091 ) ( not ( = ?auto_29091 ?auto_29094 ) ) ( not ( = ?auto_29091 ?auto_29093 ) ) ( not ( = ?auto_29091 ?auto_29092 ) ) ( not ( = ?auto_29094 ?auto_29093 ) ) ( not ( = ?auto_29094 ?auto_29092 ) ) ( not ( = ?auto_29093 ?auto_29092 ) ) ( ON ?auto_29093 ?auto_29094 ) ( CLEAR ?auto_29093 ) ( HOLDING ?auto_29092 ) ( CLEAR ?auto_29095 ) ( ON-TABLE ?auto_29096 ) ( ON ?auto_29095 ?auto_29096 ) ( not ( = ?auto_29096 ?auto_29095 ) ) ( not ( = ?auto_29096 ?auto_29092 ) ) ( not ( = ?auto_29095 ?auto_29092 ) ) ( not ( = ?auto_29091 ?auto_29095 ) ) ( not ( = ?auto_29091 ?auto_29096 ) ) ( not ( = ?auto_29094 ?auto_29095 ) ) ( not ( = ?auto_29094 ?auto_29096 ) ) ( not ( = ?auto_29093 ?auto_29095 ) ) ( not ( = ?auto_29093 ?auto_29096 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29096 ?auto_29095 ?auto_29092 )
      ( MAKE-1PILE ?auto_29091 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29097 - BLOCK
    )
    :vars
    (
      ?auto_29099 - BLOCK
      ?auto_29101 - BLOCK
      ?auto_29098 - BLOCK
      ?auto_29102 - BLOCK
      ?auto_29100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29099 ?auto_29097 ) ( ON-TABLE ?auto_29097 ) ( not ( = ?auto_29097 ?auto_29099 ) ) ( not ( = ?auto_29097 ?auto_29101 ) ) ( not ( = ?auto_29097 ?auto_29098 ) ) ( not ( = ?auto_29099 ?auto_29101 ) ) ( not ( = ?auto_29099 ?auto_29098 ) ) ( not ( = ?auto_29101 ?auto_29098 ) ) ( ON ?auto_29101 ?auto_29099 ) ( CLEAR ?auto_29102 ) ( ON-TABLE ?auto_29100 ) ( ON ?auto_29102 ?auto_29100 ) ( not ( = ?auto_29100 ?auto_29102 ) ) ( not ( = ?auto_29100 ?auto_29098 ) ) ( not ( = ?auto_29102 ?auto_29098 ) ) ( not ( = ?auto_29097 ?auto_29102 ) ) ( not ( = ?auto_29097 ?auto_29100 ) ) ( not ( = ?auto_29099 ?auto_29102 ) ) ( not ( = ?auto_29099 ?auto_29100 ) ) ( not ( = ?auto_29101 ?auto_29102 ) ) ( not ( = ?auto_29101 ?auto_29100 ) ) ( ON ?auto_29098 ?auto_29101 ) ( CLEAR ?auto_29098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29097 ?auto_29099 ?auto_29101 )
      ( MAKE-1PILE ?auto_29097 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29103 - BLOCK
    )
    :vars
    (
      ?auto_29105 - BLOCK
      ?auto_29104 - BLOCK
      ?auto_29107 - BLOCK
      ?auto_29106 - BLOCK
      ?auto_29108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29105 ?auto_29103 ) ( ON-TABLE ?auto_29103 ) ( not ( = ?auto_29103 ?auto_29105 ) ) ( not ( = ?auto_29103 ?auto_29104 ) ) ( not ( = ?auto_29103 ?auto_29107 ) ) ( not ( = ?auto_29105 ?auto_29104 ) ) ( not ( = ?auto_29105 ?auto_29107 ) ) ( not ( = ?auto_29104 ?auto_29107 ) ) ( ON ?auto_29104 ?auto_29105 ) ( ON-TABLE ?auto_29106 ) ( not ( = ?auto_29106 ?auto_29108 ) ) ( not ( = ?auto_29106 ?auto_29107 ) ) ( not ( = ?auto_29108 ?auto_29107 ) ) ( not ( = ?auto_29103 ?auto_29108 ) ) ( not ( = ?auto_29103 ?auto_29106 ) ) ( not ( = ?auto_29105 ?auto_29108 ) ) ( not ( = ?auto_29105 ?auto_29106 ) ) ( not ( = ?auto_29104 ?auto_29108 ) ) ( not ( = ?auto_29104 ?auto_29106 ) ) ( ON ?auto_29107 ?auto_29104 ) ( CLEAR ?auto_29107 ) ( HOLDING ?auto_29108 ) ( CLEAR ?auto_29106 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29106 ?auto_29108 )
      ( MAKE-1PILE ?auto_29103 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29572 - BLOCK
    )
    :vars
    (
      ?auto_29575 - BLOCK
      ?auto_29573 - BLOCK
      ?auto_29576 - BLOCK
      ?auto_29574 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29575 ?auto_29572 ) ( ON-TABLE ?auto_29572 ) ( not ( = ?auto_29572 ?auto_29575 ) ) ( not ( = ?auto_29572 ?auto_29573 ) ) ( not ( = ?auto_29572 ?auto_29576 ) ) ( not ( = ?auto_29575 ?auto_29573 ) ) ( not ( = ?auto_29575 ?auto_29576 ) ) ( not ( = ?auto_29573 ?auto_29576 ) ) ( ON ?auto_29573 ?auto_29575 ) ( not ( = ?auto_29574 ?auto_29576 ) ) ( not ( = ?auto_29572 ?auto_29574 ) ) ( not ( = ?auto_29575 ?auto_29574 ) ) ( not ( = ?auto_29573 ?auto_29574 ) ) ( ON ?auto_29576 ?auto_29573 ) ( ON ?auto_29574 ?auto_29576 ) ( CLEAR ?auto_29574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29572 ?auto_29575 ?auto_29573 ?auto_29576 )
      ( MAKE-1PILE ?auto_29572 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29115 - BLOCK
    )
    :vars
    (
      ?auto_29117 - BLOCK
      ?auto_29119 - BLOCK
      ?auto_29116 - BLOCK
      ?auto_29120 - BLOCK
      ?auto_29118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29117 ?auto_29115 ) ( ON-TABLE ?auto_29115 ) ( not ( = ?auto_29115 ?auto_29117 ) ) ( not ( = ?auto_29115 ?auto_29119 ) ) ( not ( = ?auto_29115 ?auto_29116 ) ) ( not ( = ?auto_29117 ?auto_29119 ) ) ( not ( = ?auto_29117 ?auto_29116 ) ) ( not ( = ?auto_29119 ?auto_29116 ) ) ( ON ?auto_29119 ?auto_29117 ) ( not ( = ?auto_29120 ?auto_29118 ) ) ( not ( = ?auto_29120 ?auto_29116 ) ) ( not ( = ?auto_29118 ?auto_29116 ) ) ( not ( = ?auto_29115 ?auto_29118 ) ) ( not ( = ?auto_29115 ?auto_29120 ) ) ( not ( = ?auto_29117 ?auto_29118 ) ) ( not ( = ?auto_29117 ?auto_29120 ) ) ( not ( = ?auto_29119 ?auto_29118 ) ) ( not ( = ?auto_29119 ?auto_29120 ) ) ( ON ?auto_29116 ?auto_29119 ) ( ON ?auto_29118 ?auto_29116 ) ( CLEAR ?auto_29118 ) ( HOLDING ?auto_29120 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29120 )
      ( MAKE-1PILE ?auto_29115 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29121 - BLOCK
    )
    :vars
    (
      ?auto_29126 - BLOCK
      ?auto_29124 - BLOCK
      ?auto_29125 - BLOCK
      ?auto_29122 - BLOCK
      ?auto_29123 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29126 ?auto_29121 ) ( ON-TABLE ?auto_29121 ) ( not ( = ?auto_29121 ?auto_29126 ) ) ( not ( = ?auto_29121 ?auto_29124 ) ) ( not ( = ?auto_29121 ?auto_29125 ) ) ( not ( = ?auto_29126 ?auto_29124 ) ) ( not ( = ?auto_29126 ?auto_29125 ) ) ( not ( = ?auto_29124 ?auto_29125 ) ) ( ON ?auto_29124 ?auto_29126 ) ( not ( = ?auto_29122 ?auto_29123 ) ) ( not ( = ?auto_29122 ?auto_29125 ) ) ( not ( = ?auto_29123 ?auto_29125 ) ) ( not ( = ?auto_29121 ?auto_29123 ) ) ( not ( = ?auto_29121 ?auto_29122 ) ) ( not ( = ?auto_29126 ?auto_29123 ) ) ( not ( = ?auto_29126 ?auto_29122 ) ) ( not ( = ?auto_29124 ?auto_29123 ) ) ( not ( = ?auto_29124 ?auto_29122 ) ) ( ON ?auto_29125 ?auto_29124 ) ( ON ?auto_29123 ?auto_29125 ) ( ON ?auto_29122 ?auto_29123 ) ( CLEAR ?auto_29122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_29121 ?auto_29126 ?auto_29124 ?auto_29125 ?auto_29123 )
      ( MAKE-1PILE ?auto_29121 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29132 - BLOCK
      ?auto_29133 - BLOCK
      ?auto_29134 - BLOCK
      ?auto_29135 - BLOCK
      ?auto_29136 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_29136 ) ( CLEAR ?auto_29135 ) ( ON-TABLE ?auto_29132 ) ( ON ?auto_29133 ?auto_29132 ) ( ON ?auto_29134 ?auto_29133 ) ( ON ?auto_29135 ?auto_29134 ) ( not ( = ?auto_29132 ?auto_29133 ) ) ( not ( = ?auto_29132 ?auto_29134 ) ) ( not ( = ?auto_29132 ?auto_29135 ) ) ( not ( = ?auto_29132 ?auto_29136 ) ) ( not ( = ?auto_29133 ?auto_29134 ) ) ( not ( = ?auto_29133 ?auto_29135 ) ) ( not ( = ?auto_29133 ?auto_29136 ) ) ( not ( = ?auto_29134 ?auto_29135 ) ) ( not ( = ?auto_29134 ?auto_29136 ) ) ( not ( = ?auto_29135 ?auto_29136 ) ) )
    :subtasks
    ( ( !STACK ?auto_29136 ?auto_29135 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29137 - BLOCK
      ?auto_29138 - BLOCK
      ?auto_29139 - BLOCK
      ?auto_29140 - BLOCK
      ?auto_29141 - BLOCK
    )
    :vars
    (
      ?auto_29142 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_29140 ) ( ON-TABLE ?auto_29137 ) ( ON ?auto_29138 ?auto_29137 ) ( ON ?auto_29139 ?auto_29138 ) ( ON ?auto_29140 ?auto_29139 ) ( not ( = ?auto_29137 ?auto_29138 ) ) ( not ( = ?auto_29137 ?auto_29139 ) ) ( not ( = ?auto_29137 ?auto_29140 ) ) ( not ( = ?auto_29137 ?auto_29141 ) ) ( not ( = ?auto_29138 ?auto_29139 ) ) ( not ( = ?auto_29138 ?auto_29140 ) ) ( not ( = ?auto_29138 ?auto_29141 ) ) ( not ( = ?auto_29139 ?auto_29140 ) ) ( not ( = ?auto_29139 ?auto_29141 ) ) ( not ( = ?auto_29140 ?auto_29141 ) ) ( ON ?auto_29141 ?auto_29142 ) ( CLEAR ?auto_29141 ) ( HAND-EMPTY ) ( not ( = ?auto_29137 ?auto_29142 ) ) ( not ( = ?auto_29138 ?auto_29142 ) ) ( not ( = ?auto_29139 ?auto_29142 ) ) ( not ( = ?auto_29140 ?auto_29142 ) ) ( not ( = ?auto_29141 ?auto_29142 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29141 ?auto_29142 )
      ( MAKE-5PILE ?auto_29137 ?auto_29138 ?auto_29139 ?auto_29140 ?auto_29141 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29143 - BLOCK
      ?auto_29144 - BLOCK
      ?auto_29145 - BLOCK
      ?auto_29146 - BLOCK
      ?auto_29147 - BLOCK
    )
    :vars
    (
      ?auto_29148 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29143 ) ( ON ?auto_29144 ?auto_29143 ) ( ON ?auto_29145 ?auto_29144 ) ( not ( = ?auto_29143 ?auto_29144 ) ) ( not ( = ?auto_29143 ?auto_29145 ) ) ( not ( = ?auto_29143 ?auto_29146 ) ) ( not ( = ?auto_29143 ?auto_29147 ) ) ( not ( = ?auto_29144 ?auto_29145 ) ) ( not ( = ?auto_29144 ?auto_29146 ) ) ( not ( = ?auto_29144 ?auto_29147 ) ) ( not ( = ?auto_29145 ?auto_29146 ) ) ( not ( = ?auto_29145 ?auto_29147 ) ) ( not ( = ?auto_29146 ?auto_29147 ) ) ( ON ?auto_29147 ?auto_29148 ) ( CLEAR ?auto_29147 ) ( not ( = ?auto_29143 ?auto_29148 ) ) ( not ( = ?auto_29144 ?auto_29148 ) ) ( not ( = ?auto_29145 ?auto_29148 ) ) ( not ( = ?auto_29146 ?auto_29148 ) ) ( not ( = ?auto_29147 ?auto_29148 ) ) ( HOLDING ?auto_29146 ) ( CLEAR ?auto_29145 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29143 ?auto_29144 ?auto_29145 ?auto_29146 )
      ( MAKE-5PILE ?auto_29143 ?auto_29144 ?auto_29145 ?auto_29146 ?auto_29147 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29149 - BLOCK
      ?auto_29150 - BLOCK
      ?auto_29151 - BLOCK
      ?auto_29152 - BLOCK
      ?auto_29153 - BLOCK
    )
    :vars
    (
      ?auto_29154 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29149 ) ( ON ?auto_29150 ?auto_29149 ) ( ON ?auto_29151 ?auto_29150 ) ( not ( = ?auto_29149 ?auto_29150 ) ) ( not ( = ?auto_29149 ?auto_29151 ) ) ( not ( = ?auto_29149 ?auto_29152 ) ) ( not ( = ?auto_29149 ?auto_29153 ) ) ( not ( = ?auto_29150 ?auto_29151 ) ) ( not ( = ?auto_29150 ?auto_29152 ) ) ( not ( = ?auto_29150 ?auto_29153 ) ) ( not ( = ?auto_29151 ?auto_29152 ) ) ( not ( = ?auto_29151 ?auto_29153 ) ) ( not ( = ?auto_29152 ?auto_29153 ) ) ( ON ?auto_29153 ?auto_29154 ) ( not ( = ?auto_29149 ?auto_29154 ) ) ( not ( = ?auto_29150 ?auto_29154 ) ) ( not ( = ?auto_29151 ?auto_29154 ) ) ( not ( = ?auto_29152 ?auto_29154 ) ) ( not ( = ?auto_29153 ?auto_29154 ) ) ( CLEAR ?auto_29151 ) ( ON ?auto_29152 ?auto_29153 ) ( CLEAR ?auto_29152 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29154 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29154 ?auto_29153 )
      ( MAKE-5PILE ?auto_29149 ?auto_29150 ?auto_29151 ?auto_29152 ?auto_29153 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29155 - BLOCK
      ?auto_29156 - BLOCK
      ?auto_29157 - BLOCK
      ?auto_29158 - BLOCK
      ?auto_29159 - BLOCK
    )
    :vars
    (
      ?auto_29160 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29155 ) ( ON ?auto_29156 ?auto_29155 ) ( not ( = ?auto_29155 ?auto_29156 ) ) ( not ( = ?auto_29155 ?auto_29157 ) ) ( not ( = ?auto_29155 ?auto_29158 ) ) ( not ( = ?auto_29155 ?auto_29159 ) ) ( not ( = ?auto_29156 ?auto_29157 ) ) ( not ( = ?auto_29156 ?auto_29158 ) ) ( not ( = ?auto_29156 ?auto_29159 ) ) ( not ( = ?auto_29157 ?auto_29158 ) ) ( not ( = ?auto_29157 ?auto_29159 ) ) ( not ( = ?auto_29158 ?auto_29159 ) ) ( ON ?auto_29159 ?auto_29160 ) ( not ( = ?auto_29155 ?auto_29160 ) ) ( not ( = ?auto_29156 ?auto_29160 ) ) ( not ( = ?auto_29157 ?auto_29160 ) ) ( not ( = ?auto_29158 ?auto_29160 ) ) ( not ( = ?auto_29159 ?auto_29160 ) ) ( ON ?auto_29158 ?auto_29159 ) ( CLEAR ?auto_29158 ) ( ON-TABLE ?auto_29160 ) ( HOLDING ?auto_29157 ) ( CLEAR ?auto_29156 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29155 ?auto_29156 ?auto_29157 )
      ( MAKE-5PILE ?auto_29155 ?auto_29156 ?auto_29157 ?auto_29158 ?auto_29159 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29161 - BLOCK
      ?auto_29162 - BLOCK
      ?auto_29163 - BLOCK
      ?auto_29164 - BLOCK
      ?auto_29165 - BLOCK
    )
    :vars
    (
      ?auto_29166 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29161 ) ( ON ?auto_29162 ?auto_29161 ) ( not ( = ?auto_29161 ?auto_29162 ) ) ( not ( = ?auto_29161 ?auto_29163 ) ) ( not ( = ?auto_29161 ?auto_29164 ) ) ( not ( = ?auto_29161 ?auto_29165 ) ) ( not ( = ?auto_29162 ?auto_29163 ) ) ( not ( = ?auto_29162 ?auto_29164 ) ) ( not ( = ?auto_29162 ?auto_29165 ) ) ( not ( = ?auto_29163 ?auto_29164 ) ) ( not ( = ?auto_29163 ?auto_29165 ) ) ( not ( = ?auto_29164 ?auto_29165 ) ) ( ON ?auto_29165 ?auto_29166 ) ( not ( = ?auto_29161 ?auto_29166 ) ) ( not ( = ?auto_29162 ?auto_29166 ) ) ( not ( = ?auto_29163 ?auto_29166 ) ) ( not ( = ?auto_29164 ?auto_29166 ) ) ( not ( = ?auto_29165 ?auto_29166 ) ) ( ON ?auto_29164 ?auto_29165 ) ( ON-TABLE ?auto_29166 ) ( CLEAR ?auto_29162 ) ( ON ?auto_29163 ?auto_29164 ) ( CLEAR ?auto_29163 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29166 ?auto_29165 ?auto_29164 )
      ( MAKE-5PILE ?auto_29161 ?auto_29162 ?auto_29163 ?auto_29164 ?auto_29165 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29167 - BLOCK
      ?auto_29168 - BLOCK
      ?auto_29169 - BLOCK
      ?auto_29170 - BLOCK
      ?auto_29171 - BLOCK
    )
    :vars
    (
      ?auto_29172 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29167 ) ( not ( = ?auto_29167 ?auto_29168 ) ) ( not ( = ?auto_29167 ?auto_29169 ) ) ( not ( = ?auto_29167 ?auto_29170 ) ) ( not ( = ?auto_29167 ?auto_29171 ) ) ( not ( = ?auto_29168 ?auto_29169 ) ) ( not ( = ?auto_29168 ?auto_29170 ) ) ( not ( = ?auto_29168 ?auto_29171 ) ) ( not ( = ?auto_29169 ?auto_29170 ) ) ( not ( = ?auto_29169 ?auto_29171 ) ) ( not ( = ?auto_29170 ?auto_29171 ) ) ( ON ?auto_29171 ?auto_29172 ) ( not ( = ?auto_29167 ?auto_29172 ) ) ( not ( = ?auto_29168 ?auto_29172 ) ) ( not ( = ?auto_29169 ?auto_29172 ) ) ( not ( = ?auto_29170 ?auto_29172 ) ) ( not ( = ?auto_29171 ?auto_29172 ) ) ( ON ?auto_29170 ?auto_29171 ) ( ON-TABLE ?auto_29172 ) ( ON ?auto_29169 ?auto_29170 ) ( CLEAR ?auto_29169 ) ( HOLDING ?auto_29168 ) ( CLEAR ?auto_29167 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29167 ?auto_29168 )
      ( MAKE-5PILE ?auto_29167 ?auto_29168 ?auto_29169 ?auto_29170 ?auto_29171 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29173 - BLOCK
      ?auto_29174 - BLOCK
      ?auto_29175 - BLOCK
      ?auto_29176 - BLOCK
      ?auto_29177 - BLOCK
    )
    :vars
    (
      ?auto_29178 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29173 ) ( not ( = ?auto_29173 ?auto_29174 ) ) ( not ( = ?auto_29173 ?auto_29175 ) ) ( not ( = ?auto_29173 ?auto_29176 ) ) ( not ( = ?auto_29173 ?auto_29177 ) ) ( not ( = ?auto_29174 ?auto_29175 ) ) ( not ( = ?auto_29174 ?auto_29176 ) ) ( not ( = ?auto_29174 ?auto_29177 ) ) ( not ( = ?auto_29175 ?auto_29176 ) ) ( not ( = ?auto_29175 ?auto_29177 ) ) ( not ( = ?auto_29176 ?auto_29177 ) ) ( ON ?auto_29177 ?auto_29178 ) ( not ( = ?auto_29173 ?auto_29178 ) ) ( not ( = ?auto_29174 ?auto_29178 ) ) ( not ( = ?auto_29175 ?auto_29178 ) ) ( not ( = ?auto_29176 ?auto_29178 ) ) ( not ( = ?auto_29177 ?auto_29178 ) ) ( ON ?auto_29176 ?auto_29177 ) ( ON-TABLE ?auto_29178 ) ( ON ?auto_29175 ?auto_29176 ) ( CLEAR ?auto_29173 ) ( ON ?auto_29174 ?auto_29175 ) ( CLEAR ?auto_29174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29178 ?auto_29177 ?auto_29176 ?auto_29175 )
      ( MAKE-5PILE ?auto_29173 ?auto_29174 ?auto_29175 ?auto_29176 ?auto_29177 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29179 - BLOCK
      ?auto_29180 - BLOCK
      ?auto_29181 - BLOCK
      ?auto_29182 - BLOCK
      ?auto_29183 - BLOCK
    )
    :vars
    (
      ?auto_29184 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29179 ?auto_29180 ) ) ( not ( = ?auto_29179 ?auto_29181 ) ) ( not ( = ?auto_29179 ?auto_29182 ) ) ( not ( = ?auto_29179 ?auto_29183 ) ) ( not ( = ?auto_29180 ?auto_29181 ) ) ( not ( = ?auto_29180 ?auto_29182 ) ) ( not ( = ?auto_29180 ?auto_29183 ) ) ( not ( = ?auto_29181 ?auto_29182 ) ) ( not ( = ?auto_29181 ?auto_29183 ) ) ( not ( = ?auto_29182 ?auto_29183 ) ) ( ON ?auto_29183 ?auto_29184 ) ( not ( = ?auto_29179 ?auto_29184 ) ) ( not ( = ?auto_29180 ?auto_29184 ) ) ( not ( = ?auto_29181 ?auto_29184 ) ) ( not ( = ?auto_29182 ?auto_29184 ) ) ( not ( = ?auto_29183 ?auto_29184 ) ) ( ON ?auto_29182 ?auto_29183 ) ( ON-TABLE ?auto_29184 ) ( ON ?auto_29181 ?auto_29182 ) ( ON ?auto_29180 ?auto_29181 ) ( CLEAR ?auto_29180 ) ( HOLDING ?auto_29179 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29179 )
      ( MAKE-5PILE ?auto_29179 ?auto_29180 ?auto_29181 ?auto_29182 ?auto_29183 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29185 - BLOCK
      ?auto_29186 - BLOCK
      ?auto_29187 - BLOCK
      ?auto_29188 - BLOCK
      ?auto_29189 - BLOCK
    )
    :vars
    (
      ?auto_29190 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29185 ?auto_29186 ) ) ( not ( = ?auto_29185 ?auto_29187 ) ) ( not ( = ?auto_29185 ?auto_29188 ) ) ( not ( = ?auto_29185 ?auto_29189 ) ) ( not ( = ?auto_29186 ?auto_29187 ) ) ( not ( = ?auto_29186 ?auto_29188 ) ) ( not ( = ?auto_29186 ?auto_29189 ) ) ( not ( = ?auto_29187 ?auto_29188 ) ) ( not ( = ?auto_29187 ?auto_29189 ) ) ( not ( = ?auto_29188 ?auto_29189 ) ) ( ON ?auto_29189 ?auto_29190 ) ( not ( = ?auto_29185 ?auto_29190 ) ) ( not ( = ?auto_29186 ?auto_29190 ) ) ( not ( = ?auto_29187 ?auto_29190 ) ) ( not ( = ?auto_29188 ?auto_29190 ) ) ( not ( = ?auto_29189 ?auto_29190 ) ) ( ON ?auto_29188 ?auto_29189 ) ( ON-TABLE ?auto_29190 ) ( ON ?auto_29187 ?auto_29188 ) ( ON ?auto_29186 ?auto_29187 ) ( ON ?auto_29185 ?auto_29186 ) ( CLEAR ?auto_29185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_29190 ?auto_29189 ?auto_29188 ?auto_29187 ?auto_29186 )
      ( MAKE-5PILE ?auto_29185 ?auto_29186 ?auto_29187 ?auto_29188 ?auto_29189 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29249 - BLOCK
    )
    :vars
    (
      ?auto_29250 - BLOCK
      ?auto_29251 - BLOCK
      ?auto_29252 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29249 ?auto_29250 ) ( CLEAR ?auto_29249 ) ( not ( = ?auto_29249 ?auto_29250 ) ) ( HOLDING ?auto_29251 ) ( CLEAR ?auto_29252 ) ( not ( = ?auto_29249 ?auto_29251 ) ) ( not ( = ?auto_29249 ?auto_29252 ) ) ( not ( = ?auto_29250 ?auto_29251 ) ) ( not ( = ?auto_29250 ?auto_29252 ) ) ( not ( = ?auto_29251 ?auto_29252 ) ) )
    :subtasks
    ( ( !STACK ?auto_29251 ?auto_29252 )
      ( MAKE-1PILE ?auto_29249 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29253 - BLOCK
    )
    :vars
    (
      ?auto_29255 - BLOCK
      ?auto_29256 - BLOCK
      ?auto_29254 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29253 ?auto_29255 ) ( not ( = ?auto_29253 ?auto_29255 ) ) ( CLEAR ?auto_29256 ) ( not ( = ?auto_29253 ?auto_29254 ) ) ( not ( = ?auto_29253 ?auto_29256 ) ) ( not ( = ?auto_29255 ?auto_29254 ) ) ( not ( = ?auto_29255 ?auto_29256 ) ) ( not ( = ?auto_29254 ?auto_29256 ) ) ( ON ?auto_29254 ?auto_29253 ) ( CLEAR ?auto_29254 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29255 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29255 ?auto_29253 )
      ( MAKE-1PILE ?auto_29253 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29257 - BLOCK
    )
    :vars
    (
      ?auto_29260 - BLOCK
      ?auto_29259 - BLOCK
      ?auto_29258 - BLOCK
      ?auto_29261 - BLOCK
      ?auto_29262 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29257 ?auto_29260 ) ( not ( = ?auto_29257 ?auto_29260 ) ) ( not ( = ?auto_29257 ?auto_29259 ) ) ( not ( = ?auto_29257 ?auto_29258 ) ) ( not ( = ?auto_29260 ?auto_29259 ) ) ( not ( = ?auto_29260 ?auto_29258 ) ) ( not ( = ?auto_29259 ?auto_29258 ) ) ( ON ?auto_29259 ?auto_29257 ) ( CLEAR ?auto_29259 ) ( ON-TABLE ?auto_29260 ) ( HOLDING ?auto_29258 ) ( CLEAR ?auto_29261 ) ( ON-TABLE ?auto_29262 ) ( ON ?auto_29261 ?auto_29262 ) ( not ( = ?auto_29262 ?auto_29261 ) ) ( not ( = ?auto_29262 ?auto_29258 ) ) ( not ( = ?auto_29261 ?auto_29258 ) ) ( not ( = ?auto_29257 ?auto_29261 ) ) ( not ( = ?auto_29257 ?auto_29262 ) ) ( not ( = ?auto_29260 ?auto_29261 ) ) ( not ( = ?auto_29260 ?auto_29262 ) ) ( not ( = ?auto_29259 ?auto_29261 ) ) ( not ( = ?auto_29259 ?auto_29262 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29262 ?auto_29261 ?auto_29258 )
      ( MAKE-1PILE ?auto_29257 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29263 - BLOCK
    )
    :vars
    (
      ?auto_29266 - BLOCK
      ?auto_29268 - BLOCK
      ?auto_29265 - BLOCK
      ?auto_29264 - BLOCK
      ?auto_29267 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29263 ?auto_29266 ) ( not ( = ?auto_29263 ?auto_29266 ) ) ( not ( = ?auto_29263 ?auto_29268 ) ) ( not ( = ?auto_29263 ?auto_29265 ) ) ( not ( = ?auto_29266 ?auto_29268 ) ) ( not ( = ?auto_29266 ?auto_29265 ) ) ( not ( = ?auto_29268 ?auto_29265 ) ) ( ON ?auto_29268 ?auto_29263 ) ( ON-TABLE ?auto_29266 ) ( CLEAR ?auto_29264 ) ( ON-TABLE ?auto_29267 ) ( ON ?auto_29264 ?auto_29267 ) ( not ( = ?auto_29267 ?auto_29264 ) ) ( not ( = ?auto_29267 ?auto_29265 ) ) ( not ( = ?auto_29264 ?auto_29265 ) ) ( not ( = ?auto_29263 ?auto_29264 ) ) ( not ( = ?auto_29263 ?auto_29267 ) ) ( not ( = ?auto_29266 ?auto_29264 ) ) ( not ( = ?auto_29266 ?auto_29267 ) ) ( not ( = ?auto_29268 ?auto_29264 ) ) ( not ( = ?auto_29268 ?auto_29267 ) ) ( ON ?auto_29265 ?auto_29268 ) ( CLEAR ?auto_29265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29266 ?auto_29263 ?auto_29268 )
      ( MAKE-1PILE ?auto_29263 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29269 - BLOCK
    )
    :vars
    (
      ?auto_29270 - BLOCK
      ?auto_29273 - BLOCK
      ?auto_29272 - BLOCK
      ?auto_29271 - BLOCK
      ?auto_29274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29269 ?auto_29270 ) ( not ( = ?auto_29269 ?auto_29270 ) ) ( not ( = ?auto_29269 ?auto_29273 ) ) ( not ( = ?auto_29269 ?auto_29272 ) ) ( not ( = ?auto_29270 ?auto_29273 ) ) ( not ( = ?auto_29270 ?auto_29272 ) ) ( not ( = ?auto_29273 ?auto_29272 ) ) ( ON ?auto_29273 ?auto_29269 ) ( ON-TABLE ?auto_29270 ) ( ON-TABLE ?auto_29271 ) ( not ( = ?auto_29271 ?auto_29274 ) ) ( not ( = ?auto_29271 ?auto_29272 ) ) ( not ( = ?auto_29274 ?auto_29272 ) ) ( not ( = ?auto_29269 ?auto_29274 ) ) ( not ( = ?auto_29269 ?auto_29271 ) ) ( not ( = ?auto_29270 ?auto_29274 ) ) ( not ( = ?auto_29270 ?auto_29271 ) ) ( not ( = ?auto_29273 ?auto_29274 ) ) ( not ( = ?auto_29273 ?auto_29271 ) ) ( ON ?auto_29272 ?auto_29273 ) ( CLEAR ?auto_29272 ) ( HOLDING ?auto_29274 ) ( CLEAR ?auto_29271 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29271 ?auto_29274 )
      ( MAKE-1PILE ?auto_29269 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29275 - BLOCK
    )
    :vars
    (
      ?auto_29279 - BLOCK
      ?auto_29276 - BLOCK
      ?auto_29278 - BLOCK
      ?auto_29280 - BLOCK
      ?auto_29277 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29275 ?auto_29279 ) ( not ( = ?auto_29275 ?auto_29279 ) ) ( not ( = ?auto_29275 ?auto_29276 ) ) ( not ( = ?auto_29275 ?auto_29278 ) ) ( not ( = ?auto_29279 ?auto_29276 ) ) ( not ( = ?auto_29279 ?auto_29278 ) ) ( not ( = ?auto_29276 ?auto_29278 ) ) ( ON ?auto_29276 ?auto_29275 ) ( ON-TABLE ?auto_29279 ) ( ON-TABLE ?auto_29280 ) ( not ( = ?auto_29280 ?auto_29277 ) ) ( not ( = ?auto_29280 ?auto_29278 ) ) ( not ( = ?auto_29277 ?auto_29278 ) ) ( not ( = ?auto_29275 ?auto_29277 ) ) ( not ( = ?auto_29275 ?auto_29280 ) ) ( not ( = ?auto_29279 ?auto_29277 ) ) ( not ( = ?auto_29279 ?auto_29280 ) ) ( not ( = ?auto_29276 ?auto_29277 ) ) ( not ( = ?auto_29276 ?auto_29280 ) ) ( ON ?auto_29278 ?auto_29276 ) ( CLEAR ?auto_29280 ) ( ON ?auto_29277 ?auto_29278 ) ( CLEAR ?auto_29277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29279 ?auto_29275 ?auto_29276 ?auto_29278 )
      ( MAKE-1PILE ?auto_29275 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29281 - BLOCK
    )
    :vars
    (
      ?auto_29283 - BLOCK
      ?auto_29284 - BLOCK
      ?auto_29286 - BLOCK
      ?auto_29285 - BLOCK
      ?auto_29282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29281 ?auto_29283 ) ( not ( = ?auto_29281 ?auto_29283 ) ) ( not ( = ?auto_29281 ?auto_29284 ) ) ( not ( = ?auto_29281 ?auto_29286 ) ) ( not ( = ?auto_29283 ?auto_29284 ) ) ( not ( = ?auto_29283 ?auto_29286 ) ) ( not ( = ?auto_29284 ?auto_29286 ) ) ( ON ?auto_29284 ?auto_29281 ) ( ON-TABLE ?auto_29283 ) ( not ( = ?auto_29285 ?auto_29282 ) ) ( not ( = ?auto_29285 ?auto_29286 ) ) ( not ( = ?auto_29282 ?auto_29286 ) ) ( not ( = ?auto_29281 ?auto_29282 ) ) ( not ( = ?auto_29281 ?auto_29285 ) ) ( not ( = ?auto_29283 ?auto_29282 ) ) ( not ( = ?auto_29283 ?auto_29285 ) ) ( not ( = ?auto_29284 ?auto_29282 ) ) ( not ( = ?auto_29284 ?auto_29285 ) ) ( ON ?auto_29286 ?auto_29284 ) ( ON ?auto_29282 ?auto_29286 ) ( CLEAR ?auto_29282 ) ( HOLDING ?auto_29285 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29285 )
      ( MAKE-1PILE ?auto_29281 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29287 - BLOCK
    )
    :vars
    (
      ?auto_29291 - BLOCK
      ?auto_29288 - BLOCK
      ?auto_29289 - BLOCK
      ?auto_29292 - BLOCK
      ?auto_29290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29287 ?auto_29291 ) ( not ( = ?auto_29287 ?auto_29291 ) ) ( not ( = ?auto_29287 ?auto_29288 ) ) ( not ( = ?auto_29287 ?auto_29289 ) ) ( not ( = ?auto_29291 ?auto_29288 ) ) ( not ( = ?auto_29291 ?auto_29289 ) ) ( not ( = ?auto_29288 ?auto_29289 ) ) ( ON ?auto_29288 ?auto_29287 ) ( ON-TABLE ?auto_29291 ) ( not ( = ?auto_29292 ?auto_29290 ) ) ( not ( = ?auto_29292 ?auto_29289 ) ) ( not ( = ?auto_29290 ?auto_29289 ) ) ( not ( = ?auto_29287 ?auto_29290 ) ) ( not ( = ?auto_29287 ?auto_29292 ) ) ( not ( = ?auto_29291 ?auto_29290 ) ) ( not ( = ?auto_29291 ?auto_29292 ) ) ( not ( = ?auto_29288 ?auto_29290 ) ) ( not ( = ?auto_29288 ?auto_29292 ) ) ( ON ?auto_29289 ?auto_29288 ) ( ON ?auto_29290 ?auto_29289 ) ( ON ?auto_29292 ?auto_29290 ) ( CLEAR ?auto_29292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_29291 ?auto_29287 ?auto_29288 ?auto_29289 ?auto_29290 )
      ( MAKE-1PILE ?auto_29287 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29300 - BLOCK
      ?auto_29301 - BLOCK
      ?auto_29302 - BLOCK
    )
    :vars
    (
      ?auto_29303 - BLOCK
      ?auto_29304 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29303 ?auto_29302 ) ( CLEAR ?auto_29303 ) ( ON-TABLE ?auto_29300 ) ( ON ?auto_29301 ?auto_29300 ) ( ON ?auto_29302 ?auto_29301 ) ( not ( = ?auto_29300 ?auto_29301 ) ) ( not ( = ?auto_29300 ?auto_29302 ) ) ( not ( = ?auto_29300 ?auto_29303 ) ) ( not ( = ?auto_29301 ?auto_29302 ) ) ( not ( = ?auto_29301 ?auto_29303 ) ) ( not ( = ?auto_29302 ?auto_29303 ) ) ( HOLDING ?auto_29304 ) ( not ( = ?auto_29300 ?auto_29304 ) ) ( not ( = ?auto_29301 ?auto_29304 ) ) ( not ( = ?auto_29302 ?auto_29304 ) ) ( not ( = ?auto_29303 ?auto_29304 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_29304 )
      ( MAKE-3PILE ?auto_29300 ?auto_29301 ?auto_29302 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29353 - BLOCK
      ?auto_29354 - BLOCK
    )
    :vars
    (
      ?auto_29355 - BLOCK
      ?auto_29356 - BLOCK
      ?auto_29357 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29353 ?auto_29354 ) ) ( ON ?auto_29354 ?auto_29355 ) ( not ( = ?auto_29353 ?auto_29355 ) ) ( not ( = ?auto_29354 ?auto_29355 ) ) ( ON ?auto_29353 ?auto_29354 ) ( CLEAR ?auto_29353 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29356 ) ( ON ?auto_29357 ?auto_29356 ) ( ON ?auto_29355 ?auto_29357 ) ( not ( = ?auto_29356 ?auto_29357 ) ) ( not ( = ?auto_29356 ?auto_29355 ) ) ( not ( = ?auto_29356 ?auto_29354 ) ) ( not ( = ?auto_29356 ?auto_29353 ) ) ( not ( = ?auto_29357 ?auto_29355 ) ) ( not ( = ?auto_29357 ?auto_29354 ) ) ( not ( = ?auto_29357 ?auto_29353 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29356 ?auto_29357 ?auto_29355 ?auto_29354 )
      ( MAKE-2PILE ?auto_29353 ?auto_29354 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29360 - BLOCK
      ?auto_29361 - BLOCK
    )
    :vars
    (
      ?auto_29362 - BLOCK
      ?auto_29363 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29360 ?auto_29361 ) ) ( ON ?auto_29361 ?auto_29362 ) ( CLEAR ?auto_29361 ) ( not ( = ?auto_29360 ?auto_29362 ) ) ( not ( = ?auto_29361 ?auto_29362 ) ) ( ON ?auto_29360 ?auto_29363 ) ( CLEAR ?auto_29360 ) ( HAND-EMPTY ) ( not ( = ?auto_29360 ?auto_29363 ) ) ( not ( = ?auto_29361 ?auto_29363 ) ) ( not ( = ?auto_29362 ?auto_29363 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29360 ?auto_29363 )
      ( MAKE-2PILE ?auto_29360 ?auto_29361 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29364 - BLOCK
      ?auto_29365 - BLOCK
    )
    :vars
    (
      ?auto_29367 - BLOCK
      ?auto_29366 - BLOCK
      ?auto_29369 - BLOCK
      ?auto_29368 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29364 ?auto_29365 ) ) ( not ( = ?auto_29364 ?auto_29367 ) ) ( not ( = ?auto_29365 ?auto_29367 ) ) ( ON ?auto_29364 ?auto_29366 ) ( CLEAR ?auto_29364 ) ( not ( = ?auto_29364 ?auto_29366 ) ) ( not ( = ?auto_29365 ?auto_29366 ) ) ( not ( = ?auto_29367 ?auto_29366 ) ) ( HOLDING ?auto_29365 ) ( CLEAR ?auto_29367 ) ( ON-TABLE ?auto_29369 ) ( ON ?auto_29368 ?auto_29369 ) ( ON ?auto_29367 ?auto_29368 ) ( not ( = ?auto_29369 ?auto_29368 ) ) ( not ( = ?auto_29369 ?auto_29367 ) ) ( not ( = ?auto_29369 ?auto_29365 ) ) ( not ( = ?auto_29368 ?auto_29367 ) ) ( not ( = ?auto_29368 ?auto_29365 ) ) ( not ( = ?auto_29364 ?auto_29369 ) ) ( not ( = ?auto_29364 ?auto_29368 ) ) ( not ( = ?auto_29366 ?auto_29369 ) ) ( not ( = ?auto_29366 ?auto_29368 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29369 ?auto_29368 ?auto_29367 ?auto_29365 )
      ( MAKE-2PILE ?auto_29364 ?auto_29365 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29370 - BLOCK
      ?auto_29371 - BLOCK
    )
    :vars
    (
      ?auto_29374 - BLOCK
      ?auto_29372 - BLOCK
      ?auto_29373 - BLOCK
      ?auto_29375 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29370 ?auto_29371 ) ) ( not ( = ?auto_29370 ?auto_29374 ) ) ( not ( = ?auto_29371 ?auto_29374 ) ) ( ON ?auto_29370 ?auto_29372 ) ( not ( = ?auto_29370 ?auto_29372 ) ) ( not ( = ?auto_29371 ?auto_29372 ) ) ( not ( = ?auto_29374 ?auto_29372 ) ) ( CLEAR ?auto_29374 ) ( ON-TABLE ?auto_29373 ) ( ON ?auto_29375 ?auto_29373 ) ( ON ?auto_29374 ?auto_29375 ) ( not ( = ?auto_29373 ?auto_29375 ) ) ( not ( = ?auto_29373 ?auto_29374 ) ) ( not ( = ?auto_29373 ?auto_29371 ) ) ( not ( = ?auto_29375 ?auto_29374 ) ) ( not ( = ?auto_29375 ?auto_29371 ) ) ( not ( = ?auto_29370 ?auto_29373 ) ) ( not ( = ?auto_29370 ?auto_29375 ) ) ( not ( = ?auto_29372 ?auto_29373 ) ) ( not ( = ?auto_29372 ?auto_29375 ) ) ( ON ?auto_29371 ?auto_29370 ) ( CLEAR ?auto_29371 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29372 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29372 ?auto_29370 )
      ( MAKE-2PILE ?auto_29370 ?auto_29371 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29376 - BLOCK
      ?auto_29377 - BLOCK
    )
    :vars
    (
      ?auto_29379 - BLOCK
      ?auto_29381 - BLOCK
      ?auto_29378 - BLOCK
      ?auto_29380 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29376 ?auto_29377 ) ) ( not ( = ?auto_29376 ?auto_29379 ) ) ( not ( = ?auto_29377 ?auto_29379 ) ) ( ON ?auto_29376 ?auto_29381 ) ( not ( = ?auto_29376 ?auto_29381 ) ) ( not ( = ?auto_29377 ?auto_29381 ) ) ( not ( = ?auto_29379 ?auto_29381 ) ) ( ON-TABLE ?auto_29378 ) ( ON ?auto_29380 ?auto_29378 ) ( not ( = ?auto_29378 ?auto_29380 ) ) ( not ( = ?auto_29378 ?auto_29379 ) ) ( not ( = ?auto_29378 ?auto_29377 ) ) ( not ( = ?auto_29380 ?auto_29379 ) ) ( not ( = ?auto_29380 ?auto_29377 ) ) ( not ( = ?auto_29376 ?auto_29378 ) ) ( not ( = ?auto_29376 ?auto_29380 ) ) ( not ( = ?auto_29381 ?auto_29378 ) ) ( not ( = ?auto_29381 ?auto_29380 ) ) ( ON ?auto_29377 ?auto_29376 ) ( CLEAR ?auto_29377 ) ( ON-TABLE ?auto_29381 ) ( HOLDING ?auto_29379 ) ( CLEAR ?auto_29380 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29378 ?auto_29380 ?auto_29379 )
      ( MAKE-2PILE ?auto_29376 ?auto_29377 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29382 - BLOCK
      ?auto_29383 - BLOCK
    )
    :vars
    (
      ?auto_29387 - BLOCK
      ?auto_29385 - BLOCK
      ?auto_29386 - BLOCK
      ?auto_29384 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29382 ?auto_29383 ) ) ( not ( = ?auto_29382 ?auto_29387 ) ) ( not ( = ?auto_29383 ?auto_29387 ) ) ( ON ?auto_29382 ?auto_29385 ) ( not ( = ?auto_29382 ?auto_29385 ) ) ( not ( = ?auto_29383 ?auto_29385 ) ) ( not ( = ?auto_29387 ?auto_29385 ) ) ( ON-TABLE ?auto_29386 ) ( ON ?auto_29384 ?auto_29386 ) ( not ( = ?auto_29386 ?auto_29384 ) ) ( not ( = ?auto_29386 ?auto_29387 ) ) ( not ( = ?auto_29386 ?auto_29383 ) ) ( not ( = ?auto_29384 ?auto_29387 ) ) ( not ( = ?auto_29384 ?auto_29383 ) ) ( not ( = ?auto_29382 ?auto_29386 ) ) ( not ( = ?auto_29382 ?auto_29384 ) ) ( not ( = ?auto_29385 ?auto_29386 ) ) ( not ( = ?auto_29385 ?auto_29384 ) ) ( ON ?auto_29383 ?auto_29382 ) ( ON-TABLE ?auto_29385 ) ( CLEAR ?auto_29384 ) ( ON ?auto_29387 ?auto_29383 ) ( CLEAR ?auto_29387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29385 ?auto_29382 ?auto_29383 )
      ( MAKE-2PILE ?auto_29382 ?auto_29383 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29388 - BLOCK
      ?auto_29389 - BLOCK
    )
    :vars
    (
      ?auto_29393 - BLOCK
      ?auto_29390 - BLOCK
      ?auto_29392 - BLOCK
      ?auto_29391 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29388 ?auto_29389 ) ) ( not ( = ?auto_29388 ?auto_29393 ) ) ( not ( = ?auto_29389 ?auto_29393 ) ) ( ON ?auto_29388 ?auto_29390 ) ( not ( = ?auto_29388 ?auto_29390 ) ) ( not ( = ?auto_29389 ?auto_29390 ) ) ( not ( = ?auto_29393 ?auto_29390 ) ) ( ON-TABLE ?auto_29392 ) ( not ( = ?auto_29392 ?auto_29391 ) ) ( not ( = ?auto_29392 ?auto_29393 ) ) ( not ( = ?auto_29392 ?auto_29389 ) ) ( not ( = ?auto_29391 ?auto_29393 ) ) ( not ( = ?auto_29391 ?auto_29389 ) ) ( not ( = ?auto_29388 ?auto_29392 ) ) ( not ( = ?auto_29388 ?auto_29391 ) ) ( not ( = ?auto_29390 ?auto_29392 ) ) ( not ( = ?auto_29390 ?auto_29391 ) ) ( ON ?auto_29389 ?auto_29388 ) ( ON-TABLE ?auto_29390 ) ( ON ?auto_29393 ?auto_29389 ) ( CLEAR ?auto_29393 ) ( HOLDING ?auto_29391 ) ( CLEAR ?auto_29392 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29392 ?auto_29391 )
      ( MAKE-2PILE ?auto_29388 ?auto_29389 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29394 - BLOCK
      ?auto_29395 - BLOCK
    )
    :vars
    (
      ?auto_29399 - BLOCK
      ?auto_29397 - BLOCK
      ?auto_29396 - BLOCK
      ?auto_29398 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29394 ?auto_29395 ) ) ( not ( = ?auto_29394 ?auto_29399 ) ) ( not ( = ?auto_29395 ?auto_29399 ) ) ( ON ?auto_29394 ?auto_29397 ) ( not ( = ?auto_29394 ?auto_29397 ) ) ( not ( = ?auto_29395 ?auto_29397 ) ) ( not ( = ?auto_29399 ?auto_29397 ) ) ( ON-TABLE ?auto_29396 ) ( not ( = ?auto_29396 ?auto_29398 ) ) ( not ( = ?auto_29396 ?auto_29399 ) ) ( not ( = ?auto_29396 ?auto_29395 ) ) ( not ( = ?auto_29398 ?auto_29399 ) ) ( not ( = ?auto_29398 ?auto_29395 ) ) ( not ( = ?auto_29394 ?auto_29396 ) ) ( not ( = ?auto_29394 ?auto_29398 ) ) ( not ( = ?auto_29397 ?auto_29396 ) ) ( not ( = ?auto_29397 ?auto_29398 ) ) ( ON ?auto_29395 ?auto_29394 ) ( ON-TABLE ?auto_29397 ) ( ON ?auto_29399 ?auto_29395 ) ( CLEAR ?auto_29396 ) ( ON ?auto_29398 ?auto_29399 ) ( CLEAR ?auto_29398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29397 ?auto_29394 ?auto_29395 ?auto_29399 )
      ( MAKE-2PILE ?auto_29394 ?auto_29395 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29400 - BLOCK
      ?auto_29401 - BLOCK
    )
    :vars
    (
      ?auto_29403 - BLOCK
      ?auto_29404 - BLOCK
      ?auto_29402 - BLOCK
      ?auto_29405 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29400 ?auto_29401 ) ) ( not ( = ?auto_29400 ?auto_29403 ) ) ( not ( = ?auto_29401 ?auto_29403 ) ) ( ON ?auto_29400 ?auto_29404 ) ( not ( = ?auto_29400 ?auto_29404 ) ) ( not ( = ?auto_29401 ?auto_29404 ) ) ( not ( = ?auto_29403 ?auto_29404 ) ) ( not ( = ?auto_29402 ?auto_29405 ) ) ( not ( = ?auto_29402 ?auto_29403 ) ) ( not ( = ?auto_29402 ?auto_29401 ) ) ( not ( = ?auto_29405 ?auto_29403 ) ) ( not ( = ?auto_29405 ?auto_29401 ) ) ( not ( = ?auto_29400 ?auto_29402 ) ) ( not ( = ?auto_29400 ?auto_29405 ) ) ( not ( = ?auto_29404 ?auto_29402 ) ) ( not ( = ?auto_29404 ?auto_29405 ) ) ( ON ?auto_29401 ?auto_29400 ) ( ON-TABLE ?auto_29404 ) ( ON ?auto_29403 ?auto_29401 ) ( ON ?auto_29405 ?auto_29403 ) ( CLEAR ?auto_29405 ) ( HOLDING ?auto_29402 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29402 )
      ( MAKE-2PILE ?auto_29400 ?auto_29401 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29406 - BLOCK
      ?auto_29407 - BLOCK
    )
    :vars
    (
      ?auto_29409 - BLOCK
      ?auto_29410 - BLOCK
      ?auto_29411 - BLOCK
      ?auto_29408 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29406 ?auto_29407 ) ) ( not ( = ?auto_29406 ?auto_29409 ) ) ( not ( = ?auto_29407 ?auto_29409 ) ) ( ON ?auto_29406 ?auto_29410 ) ( not ( = ?auto_29406 ?auto_29410 ) ) ( not ( = ?auto_29407 ?auto_29410 ) ) ( not ( = ?auto_29409 ?auto_29410 ) ) ( not ( = ?auto_29411 ?auto_29408 ) ) ( not ( = ?auto_29411 ?auto_29409 ) ) ( not ( = ?auto_29411 ?auto_29407 ) ) ( not ( = ?auto_29408 ?auto_29409 ) ) ( not ( = ?auto_29408 ?auto_29407 ) ) ( not ( = ?auto_29406 ?auto_29411 ) ) ( not ( = ?auto_29406 ?auto_29408 ) ) ( not ( = ?auto_29410 ?auto_29411 ) ) ( not ( = ?auto_29410 ?auto_29408 ) ) ( ON ?auto_29407 ?auto_29406 ) ( ON-TABLE ?auto_29410 ) ( ON ?auto_29409 ?auto_29407 ) ( ON ?auto_29408 ?auto_29409 ) ( ON ?auto_29411 ?auto_29408 ) ( CLEAR ?auto_29411 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_29410 ?auto_29406 ?auto_29407 ?auto_29409 ?auto_29408 )
      ( MAKE-2PILE ?auto_29406 ?auto_29407 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29427 - BLOCK
      ?auto_29428 - BLOCK
    )
    :vars
    (
      ?auto_29430 - BLOCK
      ?auto_29429 - BLOCK
      ?auto_29431 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29430 ?auto_29428 ) ( ON-TABLE ?auto_29427 ) ( ON ?auto_29428 ?auto_29427 ) ( not ( = ?auto_29427 ?auto_29428 ) ) ( not ( = ?auto_29427 ?auto_29430 ) ) ( not ( = ?auto_29428 ?auto_29430 ) ) ( not ( = ?auto_29427 ?auto_29429 ) ) ( not ( = ?auto_29427 ?auto_29431 ) ) ( not ( = ?auto_29428 ?auto_29429 ) ) ( not ( = ?auto_29428 ?auto_29431 ) ) ( not ( = ?auto_29430 ?auto_29429 ) ) ( not ( = ?auto_29430 ?auto_29431 ) ) ( not ( = ?auto_29429 ?auto_29431 ) ) ( ON ?auto_29429 ?auto_29430 ) ( CLEAR ?auto_29429 ) ( HOLDING ?auto_29431 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29431 )
      ( MAKE-2PILE ?auto_29427 ?auto_29428 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29474 - BLOCK
      ?auto_29475 - BLOCK
      ?auto_29476 - BLOCK
    )
    :vars
    (
      ?auto_29477 - BLOCK
      ?auto_29478 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29474 ) ( not ( = ?auto_29474 ?auto_29475 ) ) ( not ( = ?auto_29474 ?auto_29476 ) ) ( not ( = ?auto_29475 ?auto_29476 ) ) ( ON ?auto_29476 ?auto_29477 ) ( not ( = ?auto_29474 ?auto_29477 ) ) ( not ( = ?auto_29475 ?auto_29477 ) ) ( not ( = ?auto_29476 ?auto_29477 ) ) ( CLEAR ?auto_29474 ) ( ON ?auto_29475 ?auto_29476 ) ( CLEAR ?auto_29475 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29478 ) ( ON ?auto_29477 ?auto_29478 ) ( not ( = ?auto_29478 ?auto_29477 ) ) ( not ( = ?auto_29478 ?auto_29476 ) ) ( not ( = ?auto_29478 ?auto_29475 ) ) ( not ( = ?auto_29474 ?auto_29478 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29478 ?auto_29477 ?auto_29476 )
      ( MAKE-3PILE ?auto_29474 ?auto_29475 ?auto_29476 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29479 - BLOCK
      ?auto_29480 - BLOCK
      ?auto_29481 - BLOCK
    )
    :vars
    (
      ?auto_29482 - BLOCK
      ?auto_29483 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29479 ?auto_29480 ) ) ( not ( = ?auto_29479 ?auto_29481 ) ) ( not ( = ?auto_29480 ?auto_29481 ) ) ( ON ?auto_29481 ?auto_29482 ) ( not ( = ?auto_29479 ?auto_29482 ) ) ( not ( = ?auto_29480 ?auto_29482 ) ) ( not ( = ?auto_29481 ?auto_29482 ) ) ( ON ?auto_29480 ?auto_29481 ) ( CLEAR ?auto_29480 ) ( ON-TABLE ?auto_29483 ) ( ON ?auto_29482 ?auto_29483 ) ( not ( = ?auto_29483 ?auto_29482 ) ) ( not ( = ?auto_29483 ?auto_29481 ) ) ( not ( = ?auto_29483 ?auto_29480 ) ) ( not ( = ?auto_29479 ?auto_29483 ) ) ( HOLDING ?auto_29479 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29479 )
      ( MAKE-3PILE ?auto_29479 ?auto_29480 ?auto_29481 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29484 - BLOCK
      ?auto_29485 - BLOCK
      ?auto_29486 - BLOCK
    )
    :vars
    (
      ?auto_29487 - BLOCK
      ?auto_29488 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29484 ?auto_29485 ) ) ( not ( = ?auto_29484 ?auto_29486 ) ) ( not ( = ?auto_29485 ?auto_29486 ) ) ( ON ?auto_29486 ?auto_29487 ) ( not ( = ?auto_29484 ?auto_29487 ) ) ( not ( = ?auto_29485 ?auto_29487 ) ) ( not ( = ?auto_29486 ?auto_29487 ) ) ( ON ?auto_29485 ?auto_29486 ) ( ON-TABLE ?auto_29488 ) ( ON ?auto_29487 ?auto_29488 ) ( not ( = ?auto_29488 ?auto_29487 ) ) ( not ( = ?auto_29488 ?auto_29486 ) ) ( not ( = ?auto_29488 ?auto_29485 ) ) ( not ( = ?auto_29484 ?auto_29488 ) ) ( ON ?auto_29484 ?auto_29485 ) ( CLEAR ?auto_29484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29488 ?auto_29487 ?auto_29486 ?auto_29485 )
      ( MAKE-3PILE ?auto_29484 ?auto_29485 ?auto_29486 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29492 - BLOCK
      ?auto_29493 - BLOCK
      ?auto_29494 - BLOCK
    )
    :vars
    (
      ?auto_29495 - BLOCK
      ?auto_29496 - BLOCK
      ?auto_29497 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29492 ?auto_29493 ) ) ( not ( = ?auto_29492 ?auto_29494 ) ) ( not ( = ?auto_29493 ?auto_29494 ) ) ( ON ?auto_29494 ?auto_29495 ) ( not ( = ?auto_29492 ?auto_29495 ) ) ( not ( = ?auto_29493 ?auto_29495 ) ) ( not ( = ?auto_29494 ?auto_29495 ) ) ( ON ?auto_29493 ?auto_29494 ) ( CLEAR ?auto_29493 ) ( ON-TABLE ?auto_29496 ) ( ON ?auto_29495 ?auto_29496 ) ( not ( = ?auto_29496 ?auto_29495 ) ) ( not ( = ?auto_29496 ?auto_29494 ) ) ( not ( = ?auto_29496 ?auto_29493 ) ) ( not ( = ?auto_29492 ?auto_29496 ) ) ( ON ?auto_29492 ?auto_29497 ) ( CLEAR ?auto_29492 ) ( HAND-EMPTY ) ( not ( = ?auto_29492 ?auto_29497 ) ) ( not ( = ?auto_29493 ?auto_29497 ) ) ( not ( = ?auto_29494 ?auto_29497 ) ) ( not ( = ?auto_29495 ?auto_29497 ) ) ( not ( = ?auto_29496 ?auto_29497 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29492 ?auto_29497 )
      ( MAKE-3PILE ?auto_29492 ?auto_29493 ?auto_29494 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29498 - BLOCK
      ?auto_29499 - BLOCK
      ?auto_29500 - BLOCK
    )
    :vars
    (
      ?auto_29503 - BLOCK
      ?auto_29502 - BLOCK
      ?auto_29501 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29498 ?auto_29499 ) ) ( not ( = ?auto_29498 ?auto_29500 ) ) ( not ( = ?auto_29499 ?auto_29500 ) ) ( ON ?auto_29500 ?auto_29503 ) ( not ( = ?auto_29498 ?auto_29503 ) ) ( not ( = ?auto_29499 ?auto_29503 ) ) ( not ( = ?auto_29500 ?auto_29503 ) ) ( ON-TABLE ?auto_29502 ) ( ON ?auto_29503 ?auto_29502 ) ( not ( = ?auto_29502 ?auto_29503 ) ) ( not ( = ?auto_29502 ?auto_29500 ) ) ( not ( = ?auto_29502 ?auto_29499 ) ) ( not ( = ?auto_29498 ?auto_29502 ) ) ( ON ?auto_29498 ?auto_29501 ) ( CLEAR ?auto_29498 ) ( not ( = ?auto_29498 ?auto_29501 ) ) ( not ( = ?auto_29499 ?auto_29501 ) ) ( not ( = ?auto_29500 ?auto_29501 ) ) ( not ( = ?auto_29503 ?auto_29501 ) ) ( not ( = ?auto_29502 ?auto_29501 ) ) ( HOLDING ?auto_29499 ) ( CLEAR ?auto_29500 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29502 ?auto_29503 ?auto_29500 ?auto_29499 )
      ( MAKE-3PILE ?auto_29498 ?auto_29499 ?auto_29500 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29504 - BLOCK
      ?auto_29505 - BLOCK
      ?auto_29506 - BLOCK
    )
    :vars
    (
      ?auto_29508 - BLOCK
      ?auto_29507 - BLOCK
      ?auto_29509 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29504 ?auto_29505 ) ) ( not ( = ?auto_29504 ?auto_29506 ) ) ( not ( = ?auto_29505 ?auto_29506 ) ) ( ON ?auto_29506 ?auto_29508 ) ( not ( = ?auto_29504 ?auto_29508 ) ) ( not ( = ?auto_29505 ?auto_29508 ) ) ( not ( = ?auto_29506 ?auto_29508 ) ) ( ON-TABLE ?auto_29507 ) ( ON ?auto_29508 ?auto_29507 ) ( not ( = ?auto_29507 ?auto_29508 ) ) ( not ( = ?auto_29507 ?auto_29506 ) ) ( not ( = ?auto_29507 ?auto_29505 ) ) ( not ( = ?auto_29504 ?auto_29507 ) ) ( ON ?auto_29504 ?auto_29509 ) ( not ( = ?auto_29504 ?auto_29509 ) ) ( not ( = ?auto_29505 ?auto_29509 ) ) ( not ( = ?auto_29506 ?auto_29509 ) ) ( not ( = ?auto_29508 ?auto_29509 ) ) ( not ( = ?auto_29507 ?auto_29509 ) ) ( CLEAR ?auto_29506 ) ( ON ?auto_29505 ?auto_29504 ) ( CLEAR ?auto_29505 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29509 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29509 ?auto_29504 )
      ( MAKE-3PILE ?auto_29504 ?auto_29505 ?auto_29506 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29510 - BLOCK
      ?auto_29511 - BLOCK
      ?auto_29512 - BLOCK
    )
    :vars
    (
      ?auto_29513 - BLOCK
      ?auto_29514 - BLOCK
      ?auto_29515 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29510 ?auto_29511 ) ) ( not ( = ?auto_29510 ?auto_29512 ) ) ( not ( = ?auto_29511 ?auto_29512 ) ) ( not ( = ?auto_29510 ?auto_29513 ) ) ( not ( = ?auto_29511 ?auto_29513 ) ) ( not ( = ?auto_29512 ?auto_29513 ) ) ( ON-TABLE ?auto_29514 ) ( ON ?auto_29513 ?auto_29514 ) ( not ( = ?auto_29514 ?auto_29513 ) ) ( not ( = ?auto_29514 ?auto_29512 ) ) ( not ( = ?auto_29514 ?auto_29511 ) ) ( not ( = ?auto_29510 ?auto_29514 ) ) ( ON ?auto_29510 ?auto_29515 ) ( not ( = ?auto_29510 ?auto_29515 ) ) ( not ( = ?auto_29511 ?auto_29515 ) ) ( not ( = ?auto_29512 ?auto_29515 ) ) ( not ( = ?auto_29513 ?auto_29515 ) ) ( not ( = ?auto_29514 ?auto_29515 ) ) ( ON ?auto_29511 ?auto_29510 ) ( CLEAR ?auto_29511 ) ( ON-TABLE ?auto_29515 ) ( HOLDING ?auto_29512 ) ( CLEAR ?auto_29513 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29514 ?auto_29513 ?auto_29512 )
      ( MAKE-3PILE ?auto_29510 ?auto_29511 ?auto_29512 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29516 - BLOCK
      ?auto_29517 - BLOCK
      ?auto_29518 - BLOCK
    )
    :vars
    (
      ?auto_29519 - BLOCK
      ?auto_29520 - BLOCK
      ?auto_29521 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29516 ?auto_29517 ) ) ( not ( = ?auto_29516 ?auto_29518 ) ) ( not ( = ?auto_29517 ?auto_29518 ) ) ( not ( = ?auto_29516 ?auto_29519 ) ) ( not ( = ?auto_29517 ?auto_29519 ) ) ( not ( = ?auto_29518 ?auto_29519 ) ) ( ON-TABLE ?auto_29520 ) ( ON ?auto_29519 ?auto_29520 ) ( not ( = ?auto_29520 ?auto_29519 ) ) ( not ( = ?auto_29520 ?auto_29518 ) ) ( not ( = ?auto_29520 ?auto_29517 ) ) ( not ( = ?auto_29516 ?auto_29520 ) ) ( ON ?auto_29516 ?auto_29521 ) ( not ( = ?auto_29516 ?auto_29521 ) ) ( not ( = ?auto_29517 ?auto_29521 ) ) ( not ( = ?auto_29518 ?auto_29521 ) ) ( not ( = ?auto_29519 ?auto_29521 ) ) ( not ( = ?auto_29520 ?auto_29521 ) ) ( ON ?auto_29517 ?auto_29516 ) ( ON-TABLE ?auto_29521 ) ( CLEAR ?auto_29519 ) ( ON ?auto_29518 ?auto_29517 ) ( CLEAR ?auto_29518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29521 ?auto_29516 ?auto_29517 )
      ( MAKE-3PILE ?auto_29516 ?auto_29517 ?auto_29518 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29522 - BLOCK
      ?auto_29523 - BLOCK
      ?auto_29524 - BLOCK
    )
    :vars
    (
      ?auto_29527 - BLOCK
      ?auto_29525 - BLOCK
      ?auto_29526 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29522 ?auto_29523 ) ) ( not ( = ?auto_29522 ?auto_29524 ) ) ( not ( = ?auto_29523 ?auto_29524 ) ) ( not ( = ?auto_29522 ?auto_29527 ) ) ( not ( = ?auto_29523 ?auto_29527 ) ) ( not ( = ?auto_29524 ?auto_29527 ) ) ( ON-TABLE ?auto_29525 ) ( not ( = ?auto_29525 ?auto_29527 ) ) ( not ( = ?auto_29525 ?auto_29524 ) ) ( not ( = ?auto_29525 ?auto_29523 ) ) ( not ( = ?auto_29522 ?auto_29525 ) ) ( ON ?auto_29522 ?auto_29526 ) ( not ( = ?auto_29522 ?auto_29526 ) ) ( not ( = ?auto_29523 ?auto_29526 ) ) ( not ( = ?auto_29524 ?auto_29526 ) ) ( not ( = ?auto_29527 ?auto_29526 ) ) ( not ( = ?auto_29525 ?auto_29526 ) ) ( ON ?auto_29523 ?auto_29522 ) ( ON-TABLE ?auto_29526 ) ( ON ?auto_29524 ?auto_29523 ) ( CLEAR ?auto_29524 ) ( HOLDING ?auto_29527 ) ( CLEAR ?auto_29525 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29525 ?auto_29527 )
      ( MAKE-3PILE ?auto_29522 ?auto_29523 ?auto_29524 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29528 - BLOCK
      ?auto_29529 - BLOCK
      ?auto_29530 - BLOCK
    )
    :vars
    (
      ?auto_29531 - BLOCK
      ?auto_29533 - BLOCK
      ?auto_29532 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29528 ?auto_29529 ) ) ( not ( = ?auto_29528 ?auto_29530 ) ) ( not ( = ?auto_29529 ?auto_29530 ) ) ( not ( = ?auto_29528 ?auto_29531 ) ) ( not ( = ?auto_29529 ?auto_29531 ) ) ( not ( = ?auto_29530 ?auto_29531 ) ) ( ON-TABLE ?auto_29533 ) ( not ( = ?auto_29533 ?auto_29531 ) ) ( not ( = ?auto_29533 ?auto_29530 ) ) ( not ( = ?auto_29533 ?auto_29529 ) ) ( not ( = ?auto_29528 ?auto_29533 ) ) ( ON ?auto_29528 ?auto_29532 ) ( not ( = ?auto_29528 ?auto_29532 ) ) ( not ( = ?auto_29529 ?auto_29532 ) ) ( not ( = ?auto_29530 ?auto_29532 ) ) ( not ( = ?auto_29531 ?auto_29532 ) ) ( not ( = ?auto_29533 ?auto_29532 ) ) ( ON ?auto_29529 ?auto_29528 ) ( ON-TABLE ?auto_29532 ) ( ON ?auto_29530 ?auto_29529 ) ( CLEAR ?auto_29533 ) ( ON ?auto_29531 ?auto_29530 ) ( CLEAR ?auto_29531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29532 ?auto_29528 ?auto_29529 ?auto_29530 )
      ( MAKE-3PILE ?auto_29528 ?auto_29529 ?auto_29530 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29534 - BLOCK
      ?auto_29535 - BLOCK
      ?auto_29536 - BLOCK
    )
    :vars
    (
      ?auto_29539 - BLOCK
      ?auto_29538 - BLOCK
      ?auto_29537 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29534 ?auto_29535 ) ) ( not ( = ?auto_29534 ?auto_29536 ) ) ( not ( = ?auto_29535 ?auto_29536 ) ) ( not ( = ?auto_29534 ?auto_29539 ) ) ( not ( = ?auto_29535 ?auto_29539 ) ) ( not ( = ?auto_29536 ?auto_29539 ) ) ( not ( = ?auto_29538 ?auto_29539 ) ) ( not ( = ?auto_29538 ?auto_29536 ) ) ( not ( = ?auto_29538 ?auto_29535 ) ) ( not ( = ?auto_29534 ?auto_29538 ) ) ( ON ?auto_29534 ?auto_29537 ) ( not ( = ?auto_29534 ?auto_29537 ) ) ( not ( = ?auto_29535 ?auto_29537 ) ) ( not ( = ?auto_29536 ?auto_29537 ) ) ( not ( = ?auto_29539 ?auto_29537 ) ) ( not ( = ?auto_29538 ?auto_29537 ) ) ( ON ?auto_29535 ?auto_29534 ) ( ON-TABLE ?auto_29537 ) ( ON ?auto_29536 ?auto_29535 ) ( ON ?auto_29539 ?auto_29536 ) ( CLEAR ?auto_29539 ) ( HOLDING ?auto_29538 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29538 )
      ( MAKE-3PILE ?auto_29534 ?auto_29535 ?auto_29536 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29540 - BLOCK
      ?auto_29541 - BLOCK
      ?auto_29542 - BLOCK
    )
    :vars
    (
      ?auto_29544 - BLOCK
      ?auto_29543 - BLOCK
      ?auto_29545 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29540 ?auto_29541 ) ) ( not ( = ?auto_29540 ?auto_29542 ) ) ( not ( = ?auto_29541 ?auto_29542 ) ) ( not ( = ?auto_29540 ?auto_29544 ) ) ( not ( = ?auto_29541 ?auto_29544 ) ) ( not ( = ?auto_29542 ?auto_29544 ) ) ( not ( = ?auto_29543 ?auto_29544 ) ) ( not ( = ?auto_29543 ?auto_29542 ) ) ( not ( = ?auto_29543 ?auto_29541 ) ) ( not ( = ?auto_29540 ?auto_29543 ) ) ( ON ?auto_29540 ?auto_29545 ) ( not ( = ?auto_29540 ?auto_29545 ) ) ( not ( = ?auto_29541 ?auto_29545 ) ) ( not ( = ?auto_29542 ?auto_29545 ) ) ( not ( = ?auto_29544 ?auto_29545 ) ) ( not ( = ?auto_29543 ?auto_29545 ) ) ( ON ?auto_29541 ?auto_29540 ) ( ON-TABLE ?auto_29545 ) ( ON ?auto_29542 ?auto_29541 ) ( ON ?auto_29544 ?auto_29542 ) ( ON ?auto_29543 ?auto_29544 ) ( CLEAR ?auto_29543 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_29545 ?auto_29540 ?auto_29541 ?auto_29542 ?auto_29544 )
      ( MAKE-3PILE ?auto_29540 ?auto_29541 ?auto_29542 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29557 - BLOCK
    )
    :vars
    (
      ?auto_29558 - BLOCK
      ?auto_29559 - BLOCK
      ?auto_29560 - BLOCK
      ?auto_29561 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29558 ?auto_29557 ) ( ON-TABLE ?auto_29557 ) ( not ( = ?auto_29557 ?auto_29558 ) ) ( not ( = ?auto_29557 ?auto_29559 ) ) ( not ( = ?auto_29557 ?auto_29560 ) ) ( not ( = ?auto_29558 ?auto_29559 ) ) ( not ( = ?auto_29558 ?auto_29560 ) ) ( not ( = ?auto_29559 ?auto_29560 ) ) ( ON ?auto_29559 ?auto_29558 ) ( CLEAR ?auto_29559 ) ( HOLDING ?auto_29560 ) ( CLEAR ?auto_29561 ) ( ON-TABLE ?auto_29561 ) ( not ( = ?auto_29561 ?auto_29560 ) ) ( not ( = ?auto_29557 ?auto_29561 ) ) ( not ( = ?auto_29558 ?auto_29561 ) ) ( not ( = ?auto_29559 ?auto_29561 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29561 ?auto_29560 )
      ( MAKE-1PILE ?auto_29557 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29562 - BLOCK
    )
    :vars
    (
      ?auto_29566 - BLOCK
      ?auto_29564 - BLOCK
      ?auto_29565 - BLOCK
      ?auto_29563 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29566 ?auto_29562 ) ( ON-TABLE ?auto_29562 ) ( not ( = ?auto_29562 ?auto_29566 ) ) ( not ( = ?auto_29562 ?auto_29564 ) ) ( not ( = ?auto_29562 ?auto_29565 ) ) ( not ( = ?auto_29566 ?auto_29564 ) ) ( not ( = ?auto_29566 ?auto_29565 ) ) ( not ( = ?auto_29564 ?auto_29565 ) ) ( ON ?auto_29564 ?auto_29566 ) ( CLEAR ?auto_29563 ) ( ON-TABLE ?auto_29563 ) ( not ( = ?auto_29563 ?auto_29565 ) ) ( not ( = ?auto_29562 ?auto_29563 ) ) ( not ( = ?auto_29566 ?auto_29563 ) ) ( not ( = ?auto_29564 ?auto_29563 ) ) ( ON ?auto_29565 ?auto_29564 ) ( CLEAR ?auto_29565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29562 ?auto_29566 ?auto_29564 )
      ( MAKE-1PILE ?auto_29562 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29567 - BLOCK
    )
    :vars
    (
      ?auto_29570 - BLOCK
      ?auto_29569 - BLOCK
      ?auto_29571 - BLOCK
      ?auto_29568 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29570 ?auto_29567 ) ( ON-TABLE ?auto_29567 ) ( not ( = ?auto_29567 ?auto_29570 ) ) ( not ( = ?auto_29567 ?auto_29569 ) ) ( not ( = ?auto_29567 ?auto_29571 ) ) ( not ( = ?auto_29570 ?auto_29569 ) ) ( not ( = ?auto_29570 ?auto_29571 ) ) ( not ( = ?auto_29569 ?auto_29571 ) ) ( ON ?auto_29569 ?auto_29570 ) ( not ( = ?auto_29568 ?auto_29571 ) ) ( not ( = ?auto_29567 ?auto_29568 ) ) ( not ( = ?auto_29570 ?auto_29568 ) ) ( not ( = ?auto_29569 ?auto_29568 ) ) ( ON ?auto_29571 ?auto_29569 ) ( CLEAR ?auto_29571 ) ( HOLDING ?auto_29568 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29568 )
      ( MAKE-1PILE ?auto_29567 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29578 - BLOCK
    )
    :vars
    (
      ?auto_29582 - BLOCK
      ?auto_29579 - BLOCK
      ?auto_29581 - BLOCK
      ?auto_29580 - BLOCK
      ?auto_29583 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29582 ?auto_29578 ) ( ON-TABLE ?auto_29578 ) ( not ( = ?auto_29578 ?auto_29582 ) ) ( not ( = ?auto_29578 ?auto_29579 ) ) ( not ( = ?auto_29578 ?auto_29581 ) ) ( not ( = ?auto_29582 ?auto_29579 ) ) ( not ( = ?auto_29582 ?auto_29581 ) ) ( not ( = ?auto_29579 ?auto_29581 ) ) ( ON ?auto_29579 ?auto_29582 ) ( not ( = ?auto_29580 ?auto_29581 ) ) ( not ( = ?auto_29578 ?auto_29580 ) ) ( not ( = ?auto_29582 ?auto_29580 ) ) ( not ( = ?auto_29579 ?auto_29580 ) ) ( ON ?auto_29581 ?auto_29579 ) ( CLEAR ?auto_29581 ) ( ON ?auto_29580 ?auto_29583 ) ( CLEAR ?auto_29580 ) ( HAND-EMPTY ) ( not ( = ?auto_29578 ?auto_29583 ) ) ( not ( = ?auto_29582 ?auto_29583 ) ) ( not ( = ?auto_29579 ?auto_29583 ) ) ( not ( = ?auto_29581 ?auto_29583 ) ) ( not ( = ?auto_29580 ?auto_29583 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29580 ?auto_29583 )
      ( MAKE-1PILE ?auto_29578 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29584 - BLOCK
    )
    :vars
    (
      ?auto_29586 - BLOCK
      ?auto_29585 - BLOCK
      ?auto_29588 - BLOCK
      ?auto_29587 - BLOCK
      ?auto_29589 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29586 ?auto_29584 ) ( ON-TABLE ?auto_29584 ) ( not ( = ?auto_29584 ?auto_29586 ) ) ( not ( = ?auto_29584 ?auto_29585 ) ) ( not ( = ?auto_29584 ?auto_29588 ) ) ( not ( = ?auto_29586 ?auto_29585 ) ) ( not ( = ?auto_29586 ?auto_29588 ) ) ( not ( = ?auto_29585 ?auto_29588 ) ) ( ON ?auto_29585 ?auto_29586 ) ( not ( = ?auto_29587 ?auto_29588 ) ) ( not ( = ?auto_29584 ?auto_29587 ) ) ( not ( = ?auto_29586 ?auto_29587 ) ) ( not ( = ?auto_29585 ?auto_29587 ) ) ( ON ?auto_29587 ?auto_29589 ) ( CLEAR ?auto_29587 ) ( not ( = ?auto_29584 ?auto_29589 ) ) ( not ( = ?auto_29586 ?auto_29589 ) ) ( not ( = ?auto_29585 ?auto_29589 ) ) ( not ( = ?auto_29588 ?auto_29589 ) ) ( not ( = ?auto_29587 ?auto_29589 ) ) ( HOLDING ?auto_29588 ) ( CLEAR ?auto_29585 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29584 ?auto_29586 ?auto_29585 ?auto_29588 )
      ( MAKE-1PILE ?auto_29584 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29618 - BLOCK
      ?auto_29619 - BLOCK
      ?auto_29620 - BLOCK
      ?auto_29621 - BLOCK
    )
    :vars
    (
      ?auto_29622 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29618 ) ( ON ?auto_29619 ?auto_29618 ) ( not ( = ?auto_29618 ?auto_29619 ) ) ( not ( = ?auto_29618 ?auto_29620 ) ) ( not ( = ?auto_29618 ?auto_29621 ) ) ( not ( = ?auto_29619 ?auto_29620 ) ) ( not ( = ?auto_29619 ?auto_29621 ) ) ( not ( = ?auto_29620 ?auto_29621 ) ) ( ON ?auto_29621 ?auto_29622 ) ( not ( = ?auto_29618 ?auto_29622 ) ) ( not ( = ?auto_29619 ?auto_29622 ) ) ( not ( = ?auto_29620 ?auto_29622 ) ) ( not ( = ?auto_29621 ?auto_29622 ) ) ( CLEAR ?auto_29619 ) ( ON ?auto_29620 ?auto_29621 ) ( CLEAR ?auto_29620 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29622 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29622 ?auto_29621 )
      ( MAKE-4PILE ?auto_29618 ?auto_29619 ?auto_29620 ?auto_29621 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29623 - BLOCK
      ?auto_29624 - BLOCK
      ?auto_29625 - BLOCK
      ?auto_29626 - BLOCK
    )
    :vars
    (
      ?auto_29627 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29623 ) ( not ( = ?auto_29623 ?auto_29624 ) ) ( not ( = ?auto_29623 ?auto_29625 ) ) ( not ( = ?auto_29623 ?auto_29626 ) ) ( not ( = ?auto_29624 ?auto_29625 ) ) ( not ( = ?auto_29624 ?auto_29626 ) ) ( not ( = ?auto_29625 ?auto_29626 ) ) ( ON ?auto_29626 ?auto_29627 ) ( not ( = ?auto_29623 ?auto_29627 ) ) ( not ( = ?auto_29624 ?auto_29627 ) ) ( not ( = ?auto_29625 ?auto_29627 ) ) ( not ( = ?auto_29626 ?auto_29627 ) ) ( ON ?auto_29625 ?auto_29626 ) ( CLEAR ?auto_29625 ) ( ON-TABLE ?auto_29627 ) ( HOLDING ?auto_29624 ) ( CLEAR ?auto_29623 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29623 ?auto_29624 )
      ( MAKE-4PILE ?auto_29623 ?auto_29624 ?auto_29625 ?auto_29626 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29628 - BLOCK
      ?auto_29629 - BLOCK
      ?auto_29630 - BLOCK
      ?auto_29631 - BLOCK
    )
    :vars
    (
      ?auto_29632 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29628 ) ( not ( = ?auto_29628 ?auto_29629 ) ) ( not ( = ?auto_29628 ?auto_29630 ) ) ( not ( = ?auto_29628 ?auto_29631 ) ) ( not ( = ?auto_29629 ?auto_29630 ) ) ( not ( = ?auto_29629 ?auto_29631 ) ) ( not ( = ?auto_29630 ?auto_29631 ) ) ( ON ?auto_29631 ?auto_29632 ) ( not ( = ?auto_29628 ?auto_29632 ) ) ( not ( = ?auto_29629 ?auto_29632 ) ) ( not ( = ?auto_29630 ?auto_29632 ) ) ( not ( = ?auto_29631 ?auto_29632 ) ) ( ON ?auto_29630 ?auto_29631 ) ( ON-TABLE ?auto_29632 ) ( CLEAR ?auto_29628 ) ( ON ?auto_29629 ?auto_29630 ) ( CLEAR ?auto_29629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29632 ?auto_29631 ?auto_29630 )
      ( MAKE-4PILE ?auto_29628 ?auto_29629 ?auto_29630 ?auto_29631 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29633 - BLOCK
      ?auto_29634 - BLOCK
      ?auto_29635 - BLOCK
      ?auto_29636 - BLOCK
    )
    :vars
    (
      ?auto_29637 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29633 ?auto_29634 ) ) ( not ( = ?auto_29633 ?auto_29635 ) ) ( not ( = ?auto_29633 ?auto_29636 ) ) ( not ( = ?auto_29634 ?auto_29635 ) ) ( not ( = ?auto_29634 ?auto_29636 ) ) ( not ( = ?auto_29635 ?auto_29636 ) ) ( ON ?auto_29636 ?auto_29637 ) ( not ( = ?auto_29633 ?auto_29637 ) ) ( not ( = ?auto_29634 ?auto_29637 ) ) ( not ( = ?auto_29635 ?auto_29637 ) ) ( not ( = ?auto_29636 ?auto_29637 ) ) ( ON ?auto_29635 ?auto_29636 ) ( ON-TABLE ?auto_29637 ) ( ON ?auto_29634 ?auto_29635 ) ( CLEAR ?auto_29634 ) ( HOLDING ?auto_29633 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29633 )
      ( MAKE-4PILE ?auto_29633 ?auto_29634 ?auto_29635 ?auto_29636 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29638 - BLOCK
      ?auto_29639 - BLOCK
      ?auto_29640 - BLOCK
      ?auto_29641 - BLOCK
    )
    :vars
    (
      ?auto_29642 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29638 ?auto_29639 ) ) ( not ( = ?auto_29638 ?auto_29640 ) ) ( not ( = ?auto_29638 ?auto_29641 ) ) ( not ( = ?auto_29639 ?auto_29640 ) ) ( not ( = ?auto_29639 ?auto_29641 ) ) ( not ( = ?auto_29640 ?auto_29641 ) ) ( ON ?auto_29641 ?auto_29642 ) ( not ( = ?auto_29638 ?auto_29642 ) ) ( not ( = ?auto_29639 ?auto_29642 ) ) ( not ( = ?auto_29640 ?auto_29642 ) ) ( not ( = ?auto_29641 ?auto_29642 ) ) ( ON ?auto_29640 ?auto_29641 ) ( ON-TABLE ?auto_29642 ) ( ON ?auto_29639 ?auto_29640 ) ( ON ?auto_29638 ?auto_29639 ) ( CLEAR ?auto_29638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29642 ?auto_29641 ?auto_29640 ?auto_29639 )
      ( MAKE-4PILE ?auto_29638 ?auto_29639 ?auto_29640 ?auto_29641 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29647 - BLOCK
      ?auto_29648 - BLOCK
      ?auto_29649 - BLOCK
      ?auto_29650 - BLOCK
    )
    :vars
    (
      ?auto_29651 - BLOCK
      ?auto_29652 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29647 ?auto_29648 ) ) ( not ( = ?auto_29647 ?auto_29649 ) ) ( not ( = ?auto_29647 ?auto_29650 ) ) ( not ( = ?auto_29648 ?auto_29649 ) ) ( not ( = ?auto_29648 ?auto_29650 ) ) ( not ( = ?auto_29649 ?auto_29650 ) ) ( ON ?auto_29650 ?auto_29651 ) ( not ( = ?auto_29647 ?auto_29651 ) ) ( not ( = ?auto_29648 ?auto_29651 ) ) ( not ( = ?auto_29649 ?auto_29651 ) ) ( not ( = ?auto_29650 ?auto_29651 ) ) ( ON ?auto_29649 ?auto_29650 ) ( ON-TABLE ?auto_29651 ) ( ON ?auto_29648 ?auto_29649 ) ( CLEAR ?auto_29648 ) ( ON ?auto_29647 ?auto_29652 ) ( CLEAR ?auto_29647 ) ( HAND-EMPTY ) ( not ( = ?auto_29647 ?auto_29652 ) ) ( not ( = ?auto_29648 ?auto_29652 ) ) ( not ( = ?auto_29649 ?auto_29652 ) ) ( not ( = ?auto_29650 ?auto_29652 ) ) ( not ( = ?auto_29651 ?auto_29652 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29647 ?auto_29652 )
      ( MAKE-4PILE ?auto_29647 ?auto_29648 ?auto_29649 ?auto_29650 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29653 - BLOCK
      ?auto_29654 - BLOCK
      ?auto_29655 - BLOCK
      ?auto_29656 - BLOCK
    )
    :vars
    (
      ?auto_29657 - BLOCK
      ?auto_29658 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29653 ?auto_29654 ) ) ( not ( = ?auto_29653 ?auto_29655 ) ) ( not ( = ?auto_29653 ?auto_29656 ) ) ( not ( = ?auto_29654 ?auto_29655 ) ) ( not ( = ?auto_29654 ?auto_29656 ) ) ( not ( = ?auto_29655 ?auto_29656 ) ) ( ON ?auto_29656 ?auto_29657 ) ( not ( = ?auto_29653 ?auto_29657 ) ) ( not ( = ?auto_29654 ?auto_29657 ) ) ( not ( = ?auto_29655 ?auto_29657 ) ) ( not ( = ?auto_29656 ?auto_29657 ) ) ( ON ?auto_29655 ?auto_29656 ) ( ON-TABLE ?auto_29657 ) ( ON ?auto_29653 ?auto_29658 ) ( CLEAR ?auto_29653 ) ( not ( = ?auto_29653 ?auto_29658 ) ) ( not ( = ?auto_29654 ?auto_29658 ) ) ( not ( = ?auto_29655 ?auto_29658 ) ) ( not ( = ?auto_29656 ?auto_29658 ) ) ( not ( = ?auto_29657 ?auto_29658 ) ) ( HOLDING ?auto_29654 ) ( CLEAR ?auto_29655 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29657 ?auto_29656 ?auto_29655 ?auto_29654 )
      ( MAKE-4PILE ?auto_29653 ?auto_29654 ?auto_29655 ?auto_29656 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29659 - BLOCK
      ?auto_29660 - BLOCK
      ?auto_29661 - BLOCK
      ?auto_29662 - BLOCK
    )
    :vars
    (
      ?auto_29664 - BLOCK
      ?auto_29663 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29659 ?auto_29660 ) ) ( not ( = ?auto_29659 ?auto_29661 ) ) ( not ( = ?auto_29659 ?auto_29662 ) ) ( not ( = ?auto_29660 ?auto_29661 ) ) ( not ( = ?auto_29660 ?auto_29662 ) ) ( not ( = ?auto_29661 ?auto_29662 ) ) ( ON ?auto_29662 ?auto_29664 ) ( not ( = ?auto_29659 ?auto_29664 ) ) ( not ( = ?auto_29660 ?auto_29664 ) ) ( not ( = ?auto_29661 ?auto_29664 ) ) ( not ( = ?auto_29662 ?auto_29664 ) ) ( ON ?auto_29661 ?auto_29662 ) ( ON-TABLE ?auto_29664 ) ( ON ?auto_29659 ?auto_29663 ) ( not ( = ?auto_29659 ?auto_29663 ) ) ( not ( = ?auto_29660 ?auto_29663 ) ) ( not ( = ?auto_29661 ?auto_29663 ) ) ( not ( = ?auto_29662 ?auto_29663 ) ) ( not ( = ?auto_29664 ?auto_29663 ) ) ( CLEAR ?auto_29661 ) ( ON ?auto_29660 ?auto_29659 ) ( CLEAR ?auto_29660 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29663 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29663 ?auto_29659 )
      ( MAKE-4PILE ?auto_29659 ?auto_29660 ?auto_29661 ?auto_29662 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29665 - BLOCK
      ?auto_29666 - BLOCK
      ?auto_29667 - BLOCK
      ?auto_29668 - BLOCK
    )
    :vars
    (
      ?auto_29670 - BLOCK
      ?auto_29669 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29665 ?auto_29666 ) ) ( not ( = ?auto_29665 ?auto_29667 ) ) ( not ( = ?auto_29665 ?auto_29668 ) ) ( not ( = ?auto_29666 ?auto_29667 ) ) ( not ( = ?auto_29666 ?auto_29668 ) ) ( not ( = ?auto_29667 ?auto_29668 ) ) ( ON ?auto_29668 ?auto_29670 ) ( not ( = ?auto_29665 ?auto_29670 ) ) ( not ( = ?auto_29666 ?auto_29670 ) ) ( not ( = ?auto_29667 ?auto_29670 ) ) ( not ( = ?auto_29668 ?auto_29670 ) ) ( ON-TABLE ?auto_29670 ) ( ON ?auto_29665 ?auto_29669 ) ( not ( = ?auto_29665 ?auto_29669 ) ) ( not ( = ?auto_29666 ?auto_29669 ) ) ( not ( = ?auto_29667 ?auto_29669 ) ) ( not ( = ?auto_29668 ?auto_29669 ) ) ( not ( = ?auto_29670 ?auto_29669 ) ) ( ON ?auto_29666 ?auto_29665 ) ( CLEAR ?auto_29666 ) ( ON-TABLE ?auto_29669 ) ( HOLDING ?auto_29667 ) ( CLEAR ?auto_29668 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29670 ?auto_29668 ?auto_29667 )
      ( MAKE-4PILE ?auto_29665 ?auto_29666 ?auto_29667 ?auto_29668 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29671 - BLOCK
      ?auto_29672 - BLOCK
      ?auto_29673 - BLOCK
      ?auto_29674 - BLOCK
    )
    :vars
    (
      ?auto_29675 - BLOCK
      ?auto_29676 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29671 ?auto_29672 ) ) ( not ( = ?auto_29671 ?auto_29673 ) ) ( not ( = ?auto_29671 ?auto_29674 ) ) ( not ( = ?auto_29672 ?auto_29673 ) ) ( not ( = ?auto_29672 ?auto_29674 ) ) ( not ( = ?auto_29673 ?auto_29674 ) ) ( ON ?auto_29674 ?auto_29675 ) ( not ( = ?auto_29671 ?auto_29675 ) ) ( not ( = ?auto_29672 ?auto_29675 ) ) ( not ( = ?auto_29673 ?auto_29675 ) ) ( not ( = ?auto_29674 ?auto_29675 ) ) ( ON-TABLE ?auto_29675 ) ( ON ?auto_29671 ?auto_29676 ) ( not ( = ?auto_29671 ?auto_29676 ) ) ( not ( = ?auto_29672 ?auto_29676 ) ) ( not ( = ?auto_29673 ?auto_29676 ) ) ( not ( = ?auto_29674 ?auto_29676 ) ) ( not ( = ?auto_29675 ?auto_29676 ) ) ( ON ?auto_29672 ?auto_29671 ) ( ON-TABLE ?auto_29676 ) ( CLEAR ?auto_29674 ) ( ON ?auto_29673 ?auto_29672 ) ( CLEAR ?auto_29673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29676 ?auto_29671 ?auto_29672 )
      ( MAKE-4PILE ?auto_29671 ?auto_29672 ?auto_29673 ?auto_29674 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29677 - BLOCK
      ?auto_29678 - BLOCK
      ?auto_29679 - BLOCK
      ?auto_29680 - BLOCK
    )
    :vars
    (
      ?auto_29681 - BLOCK
      ?auto_29682 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29677 ?auto_29678 ) ) ( not ( = ?auto_29677 ?auto_29679 ) ) ( not ( = ?auto_29677 ?auto_29680 ) ) ( not ( = ?auto_29678 ?auto_29679 ) ) ( not ( = ?auto_29678 ?auto_29680 ) ) ( not ( = ?auto_29679 ?auto_29680 ) ) ( not ( = ?auto_29677 ?auto_29681 ) ) ( not ( = ?auto_29678 ?auto_29681 ) ) ( not ( = ?auto_29679 ?auto_29681 ) ) ( not ( = ?auto_29680 ?auto_29681 ) ) ( ON-TABLE ?auto_29681 ) ( ON ?auto_29677 ?auto_29682 ) ( not ( = ?auto_29677 ?auto_29682 ) ) ( not ( = ?auto_29678 ?auto_29682 ) ) ( not ( = ?auto_29679 ?auto_29682 ) ) ( not ( = ?auto_29680 ?auto_29682 ) ) ( not ( = ?auto_29681 ?auto_29682 ) ) ( ON ?auto_29678 ?auto_29677 ) ( ON-TABLE ?auto_29682 ) ( ON ?auto_29679 ?auto_29678 ) ( CLEAR ?auto_29679 ) ( HOLDING ?auto_29680 ) ( CLEAR ?auto_29681 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29681 ?auto_29680 )
      ( MAKE-4PILE ?auto_29677 ?auto_29678 ?auto_29679 ?auto_29680 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29683 - BLOCK
      ?auto_29684 - BLOCK
      ?auto_29685 - BLOCK
      ?auto_29686 - BLOCK
    )
    :vars
    (
      ?auto_29687 - BLOCK
      ?auto_29688 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29683 ?auto_29684 ) ) ( not ( = ?auto_29683 ?auto_29685 ) ) ( not ( = ?auto_29683 ?auto_29686 ) ) ( not ( = ?auto_29684 ?auto_29685 ) ) ( not ( = ?auto_29684 ?auto_29686 ) ) ( not ( = ?auto_29685 ?auto_29686 ) ) ( not ( = ?auto_29683 ?auto_29687 ) ) ( not ( = ?auto_29684 ?auto_29687 ) ) ( not ( = ?auto_29685 ?auto_29687 ) ) ( not ( = ?auto_29686 ?auto_29687 ) ) ( ON-TABLE ?auto_29687 ) ( ON ?auto_29683 ?auto_29688 ) ( not ( = ?auto_29683 ?auto_29688 ) ) ( not ( = ?auto_29684 ?auto_29688 ) ) ( not ( = ?auto_29685 ?auto_29688 ) ) ( not ( = ?auto_29686 ?auto_29688 ) ) ( not ( = ?auto_29687 ?auto_29688 ) ) ( ON ?auto_29684 ?auto_29683 ) ( ON-TABLE ?auto_29688 ) ( ON ?auto_29685 ?auto_29684 ) ( CLEAR ?auto_29687 ) ( ON ?auto_29686 ?auto_29685 ) ( CLEAR ?auto_29686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29688 ?auto_29683 ?auto_29684 ?auto_29685 )
      ( MAKE-4PILE ?auto_29683 ?auto_29684 ?auto_29685 ?auto_29686 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29689 - BLOCK
      ?auto_29690 - BLOCK
      ?auto_29691 - BLOCK
      ?auto_29692 - BLOCK
    )
    :vars
    (
      ?auto_29693 - BLOCK
      ?auto_29694 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29689 ?auto_29690 ) ) ( not ( = ?auto_29689 ?auto_29691 ) ) ( not ( = ?auto_29689 ?auto_29692 ) ) ( not ( = ?auto_29690 ?auto_29691 ) ) ( not ( = ?auto_29690 ?auto_29692 ) ) ( not ( = ?auto_29691 ?auto_29692 ) ) ( not ( = ?auto_29689 ?auto_29693 ) ) ( not ( = ?auto_29690 ?auto_29693 ) ) ( not ( = ?auto_29691 ?auto_29693 ) ) ( not ( = ?auto_29692 ?auto_29693 ) ) ( ON ?auto_29689 ?auto_29694 ) ( not ( = ?auto_29689 ?auto_29694 ) ) ( not ( = ?auto_29690 ?auto_29694 ) ) ( not ( = ?auto_29691 ?auto_29694 ) ) ( not ( = ?auto_29692 ?auto_29694 ) ) ( not ( = ?auto_29693 ?auto_29694 ) ) ( ON ?auto_29690 ?auto_29689 ) ( ON-TABLE ?auto_29694 ) ( ON ?auto_29691 ?auto_29690 ) ( ON ?auto_29692 ?auto_29691 ) ( CLEAR ?auto_29692 ) ( HOLDING ?auto_29693 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29693 )
      ( MAKE-4PILE ?auto_29689 ?auto_29690 ?auto_29691 ?auto_29692 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29695 - BLOCK
      ?auto_29696 - BLOCK
      ?auto_29697 - BLOCK
      ?auto_29698 - BLOCK
    )
    :vars
    (
      ?auto_29699 - BLOCK
      ?auto_29700 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29695 ?auto_29696 ) ) ( not ( = ?auto_29695 ?auto_29697 ) ) ( not ( = ?auto_29695 ?auto_29698 ) ) ( not ( = ?auto_29696 ?auto_29697 ) ) ( not ( = ?auto_29696 ?auto_29698 ) ) ( not ( = ?auto_29697 ?auto_29698 ) ) ( not ( = ?auto_29695 ?auto_29699 ) ) ( not ( = ?auto_29696 ?auto_29699 ) ) ( not ( = ?auto_29697 ?auto_29699 ) ) ( not ( = ?auto_29698 ?auto_29699 ) ) ( ON ?auto_29695 ?auto_29700 ) ( not ( = ?auto_29695 ?auto_29700 ) ) ( not ( = ?auto_29696 ?auto_29700 ) ) ( not ( = ?auto_29697 ?auto_29700 ) ) ( not ( = ?auto_29698 ?auto_29700 ) ) ( not ( = ?auto_29699 ?auto_29700 ) ) ( ON ?auto_29696 ?auto_29695 ) ( ON-TABLE ?auto_29700 ) ( ON ?auto_29697 ?auto_29696 ) ( ON ?auto_29698 ?auto_29697 ) ( ON ?auto_29699 ?auto_29698 ) ( CLEAR ?auto_29699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_29700 ?auto_29695 ?auto_29696 ?auto_29697 ?auto_29698 )
      ( MAKE-4PILE ?auto_29695 ?auto_29696 ?auto_29697 ?auto_29698 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29711 - BLOCK
      ?auto_29712 - BLOCK
      ?auto_29713 - BLOCK
      ?auto_29714 - BLOCK
      ?auto_29715 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_29714 ) ( ON-TABLE ?auto_29711 ) ( ON ?auto_29712 ?auto_29711 ) ( ON ?auto_29713 ?auto_29712 ) ( ON ?auto_29714 ?auto_29713 ) ( not ( = ?auto_29711 ?auto_29712 ) ) ( not ( = ?auto_29711 ?auto_29713 ) ) ( not ( = ?auto_29711 ?auto_29714 ) ) ( not ( = ?auto_29711 ?auto_29715 ) ) ( not ( = ?auto_29712 ?auto_29713 ) ) ( not ( = ?auto_29712 ?auto_29714 ) ) ( not ( = ?auto_29712 ?auto_29715 ) ) ( not ( = ?auto_29713 ?auto_29714 ) ) ( not ( = ?auto_29713 ?auto_29715 ) ) ( not ( = ?auto_29714 ?auto_29715 ) ) ( ON-TABLE ?auto_29715 ) ( CLEAR ?auto_29715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_29715 )
      ( MAKE-5PILE ?auto_29711 ?auto_29712 ?auto_29713 ?auto_29714 ?auto_29715 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29716 - BLOCK
      ?auto_29717 - BLOCK
      ?auto_29718 - BLOCK
      ?auto_29719 - BLOCK
      ?auto_29720 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29716 ) ( ON ?auto_29717 ?auto_29716 ) ( ON ?auto_29718 ?auto_29717 ) ( not ( = ?auto_29716 ?auto_29717 ) ) ( not ( = ?auto_29716 ?auto_29718 ) ) ( not ( = ?auto_29716 ?auto_29719 ) ) ( not ( = ?auto_29716 ?auto_29720 ) ) ( not ( = ?auto_29717 ?auto_29718 ) ) ( not ( = ?auto_29717 ?auto_29719 ) ) ( not ( = ?auto_29717 ?auto_29720 ) ) ( not ( = ?auto_29718 ?auto_29719 ) ) ( not ( = ?auto_29718 ?auto_29720 ) ) ( not ( = ?auto_29719 ?auto_29720 ) ) ( ON-TABLE ?auto_29720 ) ( CLEAR ?auto_29720 ) ( HOLDING ?auto_29719 ) ( CLEAR ?auto_29718 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29716 ?auto_29717 ?auto_29718 ?auto_29719 )
      ( MAKE-5PILE ?auto_29716 ?auto_29717 ?auto_29718 ?auto_29719 ?auto_29720 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29721 - BLOCK
      ?auto_29722 - BLOCK
      ?auto_29723 - BLOCK
      ?auto_29724 - BLOCK
      ?auto_29725 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29721 ) ( ON ?auto_29722 ?auto_29721 ) ( ON ?auto_29723 ?auto_29722 ) ( not ( = ?auto_29721 ?auto_29722 ) ) ( not ( = ?auto_29721 ?auto_29723 ) ) ( not ( = ?auto_29721 ?auto_29724 ) ) ( not ( = ?auto_29721 ?auto_29725 ) ) ( not ( = ?auto_29722 ?auto_29723 ) ) ( not ( = ?auto_29722 ?auto_29724 ) ) ( not ( = ?auto_29722 ?auto_29725 ) ) ( not ( = ?auto_29723 ?auto_29724 ) ) ( not ( = ?auto_29723 ?auto_29725 ) ) ( not ( = ?auto_29724 ?auto_29725 ) ) ( ON-TABLE ?auto_29725 ) ( CLEAR ?auto_29723 ) ( ON ?auto_29724 ?auto_29725 ) ( CLEAR ?auto_29724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29725 )
      ( MAKE-5PILE ?auto_29721 ?auto_29722 ?auto_29723 ?auto_29724 ?auto_29725 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29726 - BLOCK
      ?auto_29727 - BLOCK
      ?auto_29728 - BLOCK
      ?auto_29729 - BLOCK
      ?auto_29730 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29726 ) ( ON ?auto_29727 ?auto_29726 ) ( not ( = ?auto_29726 ?auto_29727 ) ) ( not ( = ?auto_29726 ?auto_29728 ) ) ( not ( = ?auto_29726 ?auto_29729 ) ) ( not ( = ?auto_29726 ?auto_29730 ) ) ( not ( = ?auto_29727 ?auto_29728 ) ) ( not ( = ?auto_29727 ?auto_29729 ) ) ( not ( = ?auto_29727 ?auto_29730 ) ) ( not ( = ?auto_29728 ?auto_29729 ) ) ( not ( = ?auto_29728 ?auto_29730 ) ) ( not ( = ?auto_29729 ?auto_29730 ) ) ( ON-TABLE ?auto_29730 ) ( ON ?auto_29729 ?auto_29730 ) ( CLEAR ?auto_29729 ) ( HOLDING ?auto_29728 ) ( CLEAR ?auto_29727 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29726 ?auto_29727 ?auto_29728 )
      ( MAKE-5PILE ?auto_29726 ?auto_29727 ?auto_29728 ?auto_29729 ?auto_29730 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29731 - BLOCK
      ?auto_29732 - BLOCK
      ?auto_29733 - BLOCK
      ?auto_29734 - BLOCK
      ?auto_29735 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29731 ) ( ON ?auto_29732 ?auto_29731 ) ( not ( = ?auto_29731 ?auto_29732 ) ) ( not ( = ?auto_29731 ?auto_29733 ) ) ( not ( = ?auto_29731 ?auto_29734 ) ) ( not ( = ?auto_29731 ?auto_29735 ) ) ( not ( = ?auto_29732 ?auto_29733 ) ) ( not ( = ?auto_29732 ?auto_29734 ) ) ( not ( = ?auto_29732 ?auto_29735 ) ) ( not ( = ?auto_29733 ?auto_29734 ) ) ( not ( = ?auto_29733 ?auto_29735 ) ) ( not ( = ?auto_29734 ?auto_29735 ) ) ( ON-TABLE ?auto_29735 ) ( ON ?auto_29734 ?auto_29735 ) ( CLEAR ?auto_29732 ) ( ON ?auto_29733 ?auto_29734 ) ( CLEAR ?auto_29733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29735 ?auto_29734 )
      ( MAKE-5PILE ?auto_29731 ?auto_29732 ?auto_29733 ?auto_29734 ?auto_29735 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29736 - BLOCK
      ?auto_29737 - BLOCK
      ?auto_29738 - BLOCK
      ?auto_29739 - BLOCK
      ?auto_29740 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29736 ) ( not ( = ?auto_29736 ?auto_29737 ) ) ( not ( = ?auto_29736 ?auto_29738 ) ) ( not ( = ?auto_29736 ?auto_29739 ) ) ( not ( = ?auto_29736 ?auto_29740 ) ) ( not ( = ?auto_29737 ?auto_29738 ) ) ( not ( = ?auto_29737 ?auto_29739 ) ) ( not ( = ?auto_29737 ?auto_29740 ) ) ( not ( = ?auto_29738 ?auto_29739 ) ) ( not ( = ?auto_29738 ?auto_29740 ) ) ( not ( = ?auto_29739 ?auto_29740 ) ) ( ON-TABLE ?auto_29740 ) ( ON ?auto_29739 ?auto_29740 ) ( ON ?auto_29738 ?auto_29739 ) ( CLEAR ?auto_29738 ) ( HOLDING ?auto_29737 ) ( CLEAR ?auto_29736 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29736 ?auto_29737 )
      ( MAKE-5PILE ?auto_29736 ?auto_29737 ?auto_29738 ?auto_29739 ?auto_29740 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29741 - BLOCK
      ?auto_29742 - BLOCK
      ?auto_29743 - BLOCK
      ?auto_29744 - BLOCK
      ?auto_29745 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29741 ) ( not ( = ?auto_29741 ?auto_29742 ) ) ( not ( = ?auto_29741 ?auto_29743 ) ) ( not ( = ?auto_29741 ?auto_29744 ) ) ( not ( = ?auto_29741 ?auto_29745 ) ) ( not ( = ?auto_29742 ?auto_29743 ) ) ( not ( = ?auto_29742 ?auto_29744 ) ) ( not ( = ?auto_29742 ?auto_29745 ) ) ( not ( = ?auto_29743 ?auto_29744 ) ) ( not ( = ?auto_29743 ?auto_29745 ) ) ( not ( = ?auto_29744 ?auto_29745 ) ) ( ON-TABLE ?auto_29745 ) ( ON ?auto_29744 ?auto_29745 ) ( ON ?auto_29743 ?auto_29744 ) ( CLEAR ?auto_29741 ) ( ON ?auto_29742 ?auto_29743 ) ( CLEAR ?auto_29742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29745 ?auto_29744 ?auto_29743 )
      ( MAKE-5PILE ?auto_29741 ?auto_29742 ?auto_29743 ?auto_29744 ?auto_29745 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29746 - BLOCK
      ?auto_29747 - BLOCK
      ?auto_29748 - BLOCK
      ?auto_29749 - BLOCK
      ?auto_29750 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29746 ?auto_29747 ) ) ( not ( = ?auto_29746 ?auto_29748 ) ) ( not ( = ?auto_29746 ?auto_29749 ) ) ( not ( = ?auto_29746 ?auto_29750 ) ) ( not ( = ?auto_29747 ?auto_29748 ) ) ( not ( = ?auto_29747 ?auto_29749 ) ) ( not ( = ?auto_29747 ?auto_29750 ) ) ( not ( = ?auto_29748 ?auto_29749 ) ) ( not ( = ?auto_29748 ?auto_29750 ) ) ( not ( = ?auto_29749 ?auto_29750 ) ) ( ON-TABLE ?auto_29750 ) ( ON ?auto_29749 ?auto_29750 ) ( ON ?auto_29748 ?auto_29749 ) ( ON ?auto_29747 ?auto_29748 ) ( CLEAR ?auto_29747 ) ( HOLDING ?auto_29746 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29746 )
      ( MAKE-5PILE ?auto_29746 ?auto_29747 ?auto_29748 ?auto_29749 ?auto_29750 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29751 - BLOCK
      ?auto_29752 - BLOCK
      ?auto_29753 - BLOCK
      ?auto_29754 - BLOCK
      ?auto_29755 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29751 ?auto_29752 ) ) ( not ( = ?auto_29751 ?auto_29753 ) ) ( not ( = ?auto_29751 ?auto_29754 ) ) ( not ( = ?auto_29751 ?auto_29755 ) ) ( not ( = ?auto_29752 ?auto_29753 ) ) ( not ( = ?auto_29752 ?auto_29754 ) ) ( not ( = ?auto_29752 ?auto_29755 ) ) ( not ( = ?auto_29753 ?auto_29754 ) ) ( not ( = ?auto_29753 ?auto_29755 ) ) ( not ( = ?auto_29754 ?auto_29755 ) ) ( ON-TABLE ?auto_29755 ) ( ON ?auto_29754 ?auto_29755 ) ( ON ?auto_29753 ?auto_29754 ) ( ON ?auto_29752 ?auto_29753 ) ( ON ?auto_29751 ?auto_29752 ) ( CLEAR ?auto_29751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29755 ?auto_29754 ?auto_29753 ?auto_29752 )
      ( MAKE-5PILE ?auto_29751 ?auto_29752 ?auto_29753 ?auto_29754 ?auto_29755 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29761 - BLOCK
      ?auto_29762 - BLOCK
      ?auto_29763 - BLOCK
      ?auto_29764 - BLOCK
      ?auto_29765 - BLOCK
    )
    :vars
    (
      ?auto_29766 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29761 ?auto_29762 ) ) ( not ( = ?auto_29761 ?auto_29763 ) ) ( not ( = ?auto_29761 ?auto_29764 ) ) ( not ( = ?auto_29761 ?auto_29765 ) ) ( not ( = ?auto_29762 ?auto_29763 ) ) ( not ( = ?auto_29762 ?auto_29764 ) ) ( not ( = ?auto_29762 ?auto_29765 ) ) ( not ( = ?auto_29763 ?auto_29764 ) ) ( not ( = ?auto_29763 ?auto_29765 ) ) ( not ( = ?auto_29764 ?auto_29765 ) ) ( ON-TABLE ?auto_29765 ) ( ON ?auto_29764 ?auto_29765 ) ( ON ?auto_29763 ?auto_29764 ) ( ON ?auto_29762 ?auto_29763 ) ( CLEAR ?auto_29762 ) ( ON ?auto_29761 ?auto_29766 ) ( CLEAR ?auto_29761 ) ( HAND-EMPTY ) ( not ( = ?auto_29761 ?auto_29766 ) ) ( not ( = ?auto_29762 ?auto_29766 ) ) ( not ( = ?auto_29763 ?auto_29766 ) ) ( not ( = ?auto_29764 ?auto_29766 ) ) ( not ( = ?auto_29765 ?auto_29766 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29761 ?auto_29766 )
      ( MAKE-5PILE ?auto_29761 ?auto_29762 ?auto_29763 ?auto_29764 ?auto_29765 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29767 - BLOCK
      ?auto_29768 - BLOCK
      ?auto_29769 - BLOCK
      ?auto_29770 - BLOCK
      ?auto_29771 - BLOCK
    )
    :vars
    (
      ?auto_29772 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29767 ?auto_29768 ) ) ( not ( = ?auto_29767 ?auto_29769 ) ) ( not ( = ?auto_29767 ?auto_29770 ) ) ( not ( = ?auto_29767 ?auto_29771 ) ) ( not ( = ?auto_29768 ?auto_29769 ) ) ( not ( = ?auto_29768 ?auto_29770 ) ) ( not ( = ?auto_29768 ?auto_29771 ) ) ( not ( = ?auto_29769 ?auto_29770 ) ) ( not ( = ?auto_29769 ?auto_29771 ) ) ( not ( = ?auto_29770 ?auto_29771 ) ) ( ON-TABLE ?auto_29771 ) ( ON ?auto_29770 ?auto_29771 ) ( ON ?auto_29769 ?auto_29770 ) ( ON ?auto_29767 ?auto_29772 ) ( CLEAR ?auto_29767 ) ( not ( = ?auto_29767 ?auto_29772 ) ) ( not ( = ?auto_29768 ?auto_29772 ) ) ( not ( = ?auto_29769 ?auto_29772 ) ) ( not ( = ?auto_29770 ?auto_29772 ) ) ( not ( = ?auto_29771 ?auto_29772 ) ) ( HOLDING ?auto_29768 ) ( CLEAR ?auto_29769 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29771 ?auto_29770 ?auto_29769 ?auto_29768 )
      ( MAKE-5PILE ?auto_29767 ?auto_29768 ?auto_29769 ?auto_29770 ?auto_29771 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29773 - BLOCK
      ?auto_29774 - BLOCK
      ?auto_29775 - BLOCK
      ?auto_29776 - BLOCK
      ?auto_29777 - BLOCK
    )
    :vars
    (
      ?auto_29778 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29773 ?auto_29774 ) ) ( not ( = ?auto_29773 ?auto_29775 ) ) ( not ( = ?auto_29773 ?auto_29776 ) ) ( not ( = ?auto_29773 ?auto_29777 ) ) ( not ( = ?auto_29774 ?auto_29775 ) ) ( not ( = ?auto_29774 ?auto_29776 ) ) ( not ( = ?auto_29774 ?auto_29777 ) ) ( not ( = ?auto_29775 ?auto_29776 ) ) ( not ( = ?auto_29775 ?auto_29777 ) ) ( not ( = ?auto_29776 ?auto_29777 ) ) ( ON-TABLE ?auto_29777 ) ( ON ?auto_29776 ?auto_29777 ) ( ON ?auto_29775 ?auto_29776 ) ( ON ?auto_29773 ?auto_29778 ) ( not ( = ?auto_29773 ?auto_29778 ) ) ( not ( = ?auto_29774 ?auto_29778 ) ) ( not ( = ?auto_29775 ?auto_29778 ) ) ( not ( = ?auto_29776 ?auto_29778 ) ) ( not ( = ?auto_29777 ?auto_29778 ) ) ( CLEAR ?auto_29775 ) ( ON ?auto_29774 ?auto_29773 ) ( CLEAR ?auto_29774 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29778 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29778 ?auto_29773 )
      ( MAKE-5PILE ?auto_29773 ?auto_29774 ?auto_29775 ?auto_29776 ?auto_29777 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29779 - BLOCK
      ?auto_29780 - BLOCK
      ?auto_29781 - BLOCK
      ?auto_29782 - BLOCK
      ?auto_29783 - BLOCK
    )
    :vars
    (
      ?auto_29784 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29779 ?auto_29780 ) ) ( not ( = ?auto_29779 ?auto_29781 ) ) ( not ( = ?auto_29779 ?auto_29782 ) ) ( not ( = ?auto_29779 ?auto_29783 ) ) ( not ( = ?auto_29780 ?auto_29781 ) ) ( not ( = ?auto_29780 ?auto_29782 ) ) ( not ( = ?auto_29780 ?auto_29783 ) ) ( not ( = ?auto_29781 ?auto_29782 ) ) ( not ( = ?auto_29781 ?auto_29783 ) ) ( not ( = ?auto_29782 ?auto_29783 ) ) ( ON-TABLE ?auto_29783 ) ( ON ?auto_29782 ?auto_29783 ) ( ON ?auto_29779 ?auto_29784 ) ( not ( = ?auto_29779 ?auto_29784 ) ) ( not ( = ?auto_29780 ?auto_29784 ) ) ( not ( = ?auto_29781 ?auto_29784 ) ) ( not ( = ?auto_29782 ?auto_29784 ) ) ( not ( = ?auto_29783 ?auto_29784 ) ) ( ON ?auto_29780 ?auto_29779 ) ( CLEAR ?auto_29780 ) ( ON-TABLE ?auto_29784 ) ( HOLDING ?auto_29781 ) ( CLEAR ?auto_29782 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29783 ?auto_29782 ?auto_29781 )
      ( MAKE-5PILE ?auto_29779 ?auto_29780 ?auto_29781 ?auto_29782 ?auto_29783 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29785 - BLOCK
      ?auto_29786 - BLOCK
      ?auto_29787 - BLOCK
      ?auto_29788 - BLOCK
      ?auto_29789 - BLOCK
    )
    :vars
    (
      ?auto_29790 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29785 ?auto_29786 ) ) ( not ( = ?auto_29785 ?auto_29787 ) ) ( not ( = ?auto_29785 ?auto_29788 ) ) ( not ( = ?auto_29785 ?auto_29789 ) ) ( not ( = ?auto_29786 ?auto_29787 ) ) ( not ( = ?auto_29786 ?auto_29788 ) ) ( not ( = ?auto_29786 ?auto_29789 ) ) ( not ( = ?auto_29787 ?auto_29788 ) ) ( not ( = ?auto_29787 ?auto_29789 ) ) ( not ( = ?auto_29788 ?auto_29789 ) ) ( ON-TABLE ?auto_29789 ) ( ON ?auto_29788 ?auto_29789 ) ( ON ?auto_29785 ?auto_29790 ) ( not ( = ?auto_29785 ?auto_29790 ) ) ( not ( = ?auto_29786 ?auto_29790 ) ) ( not ( = ?auto_29787 ?auto_29790 ) ) ( not ( = ?auto_29788 ?auto_29790 ) ) ( not ( = ?auto_29789 ?auto_29790 ) ) ( ON ?auto_29786 ?auto_29785 ) ( ON-TABLE ?auto_29790 ) ( CLEAR ?auto_29788 ) ( ON ?auto_29787 ?auto_29786 ) ( CLEAR ?auto_29787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29790 ?auto_29785 ?auto_29786 )
      ( MAKE-5PILE ?auto_29785 ?auto_29786 ?auto_29787 ?auto_29788 ?auto_29789 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29791 - BLOCK
      ?auto_29792 - BLOCK
      ?auto_29793 - BLOCK
      ?auto_29794 - BLOCK
      ?auto_29795 - BLOCK
    )
    :vars
    (
      ?auto_29796 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29791 ?auto_29792 ) ) ( not ( = ?auto_29791 ?auto_29793 ) ) ( not ( = ?auto_29791 ?auto_29794 ) ) ( not ( = ?auto_29791 ?auto_29795 ) ) ( not ( = ?auto_29792 ?auto_29793 ) ) ( not ( = ?auto_29792 ?auto_29794 ) ) ( not ( = ?auto_29792 ?auto_29795 ) ) ( not ( = ?auto_29793 ?auto_29794 ) ) ( not ( = ?auto_29793 ?auto_29795 ) ) ( not ( = ?auto_29794 ?auto_29795 ) ) ( ON-TABLE ?auto_29795 ) ( ON ?auto_29791 ?auto_29796 ) ( not ( = ?auto_29791 ?auto_29796 ) ) ( not ( = ?auto_29792 ?auto_29796 ) ) ( not ( = ?auto_29793 ?auto_29796 ) ) ( not ( = ?auto_29794 ?auto_29796 ) ) ( not ( = ?auto_29795 ?auto_29796 ) ) ( ON ?auto_29792 ?auto_29791 ) ( ON-TABLE ?auto_29796 ) ( ON ?auto_29793 ?auto_29792 ) ( CLEAR ?auto_29793 ) ( HOLDING ?auto_29794 ) ( CLEAR ?auto_29795 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29795 ?auto_29794 )
      ( MAKE-5PILE ?auto_29791 ?auto_29792 ?auto_29793 ?auto_29794 ?auto_29795 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29797 - BLOCK
      ?auto_29798 - BLOCK
      ?auto_29799 - BLOCK
      ?auto_29800 - BLOCK
      ?auto_29801 - BLOCK
    )
    :vars
    (
      ?auto_29802 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29797 ?auto_29798 ) ) ( not ( = ?auto_29797 ?auto_29799 ) ) ( not ( = ?auto_29797 ?auto_29800 ) ) ( not ( = ?auto_29797 ?auto_29801 ) ) ( not ( = ?auto_29798 ?auto_29799 ) ) ( not ( = ?auto_29798 ?auto_29800 ) ) ( not ( = ?auto_29798 ?auto_29801 ) ) ( not ( = ?auto_29799 ?auto_29800 ) ) ( not ( = ?auto_29799 ?auto_29801 ) ) ( not ( = ?auto_29800 ?auto_29801 ) ) ( ON-TABLE ?auto_29801 ) ( ON ?auto_29797 ?auto_29802 ) ( not ( = ?auto_29797 ?auto_29802 ) ) ( not ( = ?auto_29798 ?auto_29802 ) ) ( not ( = ?auto_29799 ?auto_29802 ) ) ( not ( = ?auto_29800 ?auto_29802 ) ) ( not ( = ?auto_29801 ?auto_29802 ) ) ( ON ?auto_29798 ?auto_29797 ) ( ON-TABLE ?auto_29802 ) ( ON ?auto_29799 ?auto_29798 ) ( CLEAR ?auto_29801 ) ( ON ?auto_29800 ?auto_29799 ) ( CLEAR ?auto_29800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29802 ?auto_29797 ?auto_29798 ?auto_29799 )
      ( MAKE-5PILE ?auto_29797 ?auto_29798 ?auto_29799 ?auto_29800 ?auto_29801 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29803 - BLOCK
      ?auto_29804 - BLOCK
      ?auto_29805 - BLOCK
      ?auto_29806 - BLOCK
      ?auto_29807 - BLOCK
    )
    :vars
    (
      ?auto_29808 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29803 ?auto_29804 ) ) ( not ( = ?auto_29803 ?auto_29805 ) ) ( not ( = ?auto_29803 ?auto_29806 ) ) ( not ( = ?auto_29803 ?auto_29807 ) ) ( not ( = ?auto_29804 ?auto_29805 ) ) ( not ( = ?auto_29804 ?auto_29806 ) ) ( not ( = ?auto_29804 ?auto_29807 ) ) ( not ( = ?auto_29805 ?auto_29806 ) ) ( not ( = ?auto_29805 ?auto_29807 ) ) ( not ( = ?auto_29806 ?auto_29807 ) ) ( ON ?auto_29803 ?auto_29808 ) ( not ( = ?auto_29803 ?auto_29808 ) ) ( not ( = ?auto_29804 ?auto_29808 ) ) ( not ( = ?auto_29805 ?auto_29808 ) ) ( not ( = ?auto_29806 ?auto_29808 ) ) ( not ( = ?auto_29807 ?auto_29808 ) ) ( ON ?auto_29804 ?auto_29803 ) ( ON-TABLE ?auto_29808 ) ( ON ?auto_29805 ?auto_29804 ) ( ON ?auto_29806 ?auto_29805 ) ( CLEAR ?auto_29806 ) ( HOLDING ?auto_29807 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29807 )
      ( MAKE-5PILE ?auto_29803 ?auto_29804 ?auto_29805 ?auto_29806 ?auto_29807 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29809 - BLOCK
      ?auto_29810 - BLOCK
      ?auto_29811 - BLOCK
      ?auto_29812 - BLOCK
      ?auto_29813 - BLOCK
    )
    :vars
    (
      ?auto_29814 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29809 ?auto_29810 ) ) ( not ( = ?auto_29809 ?auto_29811 ) ) ( not ( = ?auto_29809 ?auto_29812 ) ) ( not ( = ?auto_29809 ?auto_29813 ) ) ( not ( = ?auto_29810 ?auto_29811 ) ) ( not ( = ?auto_29810 ?auto_29812 ) ) ( not ( = ?auto_29810 ?auto_29813 ) ) ( not ( = ?auto_29811 ?auto_29812 ) ) ( not ( = ?auto_29811 ?auto_29813 ) ) ( not ( = ?auto_29812 ?auto_29813 ) ) ( ON ?auto_29809 ?auto_29814 ) ( not ( = ?auto_29809 ?auto_29814 ) ) ( not ( = ?auto_29810 ?auto_29814 ) ) ( not ( = ?auto_29811 ?auto_29814 ) ) ( not ( = ?auto_29812 ?auto_29814 ) ) ( not ( = ?auto_29813 ?auto_29814 ) ) ( ON ?auto_29810 ?auto_29809 ) ( ON-TABLE ?auto_29814 ) ( ON ?auto_29811 ?auto_29810 ) ( ON ?auto_29812 ?auto_29811 ) ( ON ?auto_29813 ?auto_29812 ) ( CLEAR ?auto_29813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_29814 ?auto_29809 ?auto_29810 ?auto_29811 ?auto_29812 )
      ( MAKE-5PILE ?auto_29809 ?auto_29810 ?auto_29811 ?auto_29812 ?auto_29813 ) )
  )

)

