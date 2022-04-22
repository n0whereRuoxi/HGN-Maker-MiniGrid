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
      ?auto_17888 - BLOCK
    )
    :vars
    (
      ?auto_17889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17888 ?auto_17889 ) ( CLEAR ?auto_17888 ) ( HAND-EMPTY ) ( not ( = ?auto_17888 ?auto_17889 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17888 ?auto_17889 )
      ( !PUTDOWN ?auto_17888 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17891 - BLOCK
    )
    :vars
    (
      ?auto_17892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17891 ?auto_17892 ) ( CLEAR ?auto_17891 ) ( HAND-EMPTY ) ( not ( = ?auto_17891 ?auto_17892 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17891 ?auto_17892 )
      ( !PUTDOWN ?auto_17891 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17895 - BLOCK
      ?auto_17896 - BLOCK
    )
    :vars
    (
      ?auto_17897 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_17895 ) ( ON ?auto_17896 ?auto_17897 ) ( CLEAR ?auto_17896 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17895 ) ( not ( = ?auto_17895 ?auto_17896 ) ) ( not ( = ?auto_17895 ?auto_17897 ) ) ( not ( = ?auto_17896 ?auto_17897 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17896 ?auto_17897 )
      ( !STACK ?auto_17896 ?auto_17895 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17900 - BLOCK
      ?auto_17901 - BLOCK
    )
    :vars
    (
      ?auto_17902 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_17900 ) ( ON ?auto_17901 ?auto_17902 ) ( CLEAR ?auto_17901 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17900 ) ( not ( = ?auto_17900 ?auto_17901 ) ) ( not ( = ?auto_17900 ?auto_17902 ) ) ( not ( = ?auto_17901 ?auto_17902 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17901 ?auto_17902 )
      ( !STACK ?auto_17901 ?auto_17900 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17905 - BLOCK
      ?auto_17906 - BLOCK
    )
    :vars
    (
      ?auto_17907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17906 ?auto_17907 ) ( not ( = ?auto_17905 ?auto_17906 ) ) ( not ( = ?auto_17905 ?auto_17907 ) ) ( not ( = ?auto_17906 ?auto_17907 ) ) ( ON ?auto_17905 ?auto_17906 ) ( CLEAR ?auto_17905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17905 )
      ( MAKE-2PILE ?auto_17905 ?auto_17906 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17910 - BLOCK
      ?auto_17911 - BLOCK
    )
    :vars
    (
      ?auto_17912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17911 ?auto_17912 ) ( not ( = ?auto_17910 ?auto_17911 ) ) ( not ( = ?auto_17910 ?auto_17912 ) ) ( not ( = ?auto_17911 ?auto_17912 ) ) ( ON ?auto_17910 ?auto_17911 ) ( CLEAR ?auto_17910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17910 )
      ( MAKE-2PILE ?auto_17910 ?auto_17911 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17916 - BLOCK
      ?auto_17917 - BLOCK
      ?auto_17918 - BLOCK
    )
    :vars
    (
      ?auto_17919 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_17917 ) ( ON ?auto_17918 ?auto_17919 ) ( CLEAR ?auto_17918 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17916 ) ( ON ?auto_17917 ?auto_17916 ) ( not ( = ?auto_17916 ?auto_17917 ) ) ( not ( = ?auto_17916 ?auto_17918 ) ) ( not ( = ?auto_17916 ?auto_17919 ) ) ( not ( = ?auto_17917 ?auto_17918 ) ) ( not ( = ?auto_17917 ?auto_17919 ) ) ( not ( = ?auto_17918 ?auto_17919 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17918 ?auto_17919 )
      ( !STACK ?auto_17918 ?auto_17917 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17923 - BLOCK
      ?auto_17924 - BLOCK
      ?auto_17925 - BLOCK
    )
    :vars
    (
      ?auto_17926 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_17924 ) ( ON ?auto_17925 ?auto_17926 ) ( CLEAR ?auto_17925 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17923 ) ( ON ?auto_17924 ?auto_17923 ) ( not ( = ?auto_17923 ?auto_17924 ) ) ( not ( = ?auto_17923 ?auto_17925 ) ) ( not ( = ?auto_17923 ?auto_17926 ) ) ( not ( = ?auto_17924 ?auto_17925 ) ) ( not ( = ?auto_17924 ?auto_17926 ) ) ( not ( = ?auto_17925 ?auto_17926 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17925 ?auto_17926 )
      ( !STACK ?auto_17925 ?auto_17924 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17930 - BLOCK
      ?auto_17931 - BLOCK
      ?auto_17932 - BLOCK
    )
    :vars
    (
      ?auto_17933 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17932 ?auto_17933 ) ( ON-TABLE ?auto_17930 ) ( not ( = ?auto_17930 ?auto_17931 ) ) ( not ( = ?auto_17930 ?auto_17932 ) ) ( not ( = ?auto_17930 ?auto_17933 ) ) ( not ( = ?auto_17931 ?auto_17932 ) ) ( not ( = ?auto_17931 ?auto_17933 ) ) ( not ( = ?auto_17932 ?auto_17933 ) ) ( CLEAR ?auto_17930 ) ( ON ?auto_17931 ?auto_17932 ) ( CLEAR ?auto_17931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17930 ?auto_17931 )
      ( MAKE-3PILE ?auto_17930 ?auto_17931 ?auto_17932 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17937 - BLOCK
      ?auto_17938 - BLOCK
      ?auto_17939 - BLOCK
    )
    :vars
    (
      ?auto_17940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17939 ?auto_17940 ) ( ON-TABLE ?auto_17937 ) ( not ( = ?auto_17937 ?auto_17938 ) ) ( not ( = ?auto_17937 ?auto_17939 ) ) ( not ( = ?auto_17937 ?auto_17940 ) ) ( not ( = ?auto_17938 ?auto_17939 ) ) ( not ( = ?auto_17938 ?auto_17940 ) ) ( not ( = ?auto_17939 ?auto_17940 ) ) ( CLEAR ?auto_17937 ) ( ON ?auto_17938 ?auto_17939 ) ( CLEAR ?auto_17938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17937 ?auto_17938 )
      ( MAKE-3PILE ?auto_17937 ?auto_17938 ?auto_17939 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17944 - BLOCK
      ?auto_17945 - BLOCK
      ?auto_17946 - BLOCK
    )
    :vars
    (
      ?auto_17947 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17946 ?auto_17947 ) ( not ( = ?auto_17944 ?auto_17945 ) ) ( not ( = ?auto_17944 ?auto_17946 ) ) ( not ( = ?auto_17944 ?auto_17947 ) ) ( not ( = ?auto_17945 ?auto_17946 ) ) ( not ( = ?auto_17945 ?auto_17947 ) ) ( not ( = ?auto_17946 ?auto_17947 ) ) ( ON ?auto_17945 ?auto_17946 ) ( ON ?auto_17944 ?auto_17945 ) ( CLEAR ?auto_17944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17944 )
      ( MAKE-3PILE ?auto_17944 ?auto_17945 ?auto_17946 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17951 - BLOCK
      ?auto_17952 - BLOCK
      ?auto_17953 - BLOCK
    )
    :vars
    (
      ?auto_17954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17953 ?auto_17954 ) ( not ( = ?auto_17951 ?auto_17952 ) ) ( not ( = ?auto_17951 ?auto_17953 ) ) ( not ( = ?auto_17951 ?auto_17954 ) ) ( not ( = ?auto_17952 ?auto_17953 ) ) ( not ( = ?auto_17952 ?auto_17954 ) ) ( not ( = ?auto_17953 ?auto_17954 ) ) ( ON ?auto_17952 ?auto_17953 ) ( ON ?auto_17951 ?auto_17952 ) ( CLEAR ?auto_17951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17951 )
      ( MAKE-3PILE ?auto_17951 ?auto_17952 ?auto_17953 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17959 - BLOCK
      ?auto_17960 - BLOCK
      ?auto_17961 - BLOCK
      ?auto_17962 - BLOCK
    )
    :vars
    (
      ?auto_17963 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_17961 ) ( ON ?auto_17962 ?auto_17963 ) ( CLEAR ?auto_17962 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17959 ) ( ON ?auto_17960 ?auto_17959 ) ( ON ?auto_17961 ?auto_17960 ) ( not ( = ?auto_17959 ?auto_17960 ) ) ( not ( = ?auto_17959 ?auto_17961 ) ) ( not ( = ?auto_17959 ?auto_17962 ) ) ( not ( = ?auto_17959 ?auto_17963 ) ) ( not ( = ?auto_17960 ?auto_17961 ) ) ( not ( = ?auto_17960 ?auto_17962 ) ) ( not ( = ?auto_17960 ?auto_17963 ) ) ( not ( = ?auto_17961 ?auto_17962 ) ) ( not ( = ?auto_17961 ?auto_17963 ) ) ( not ( = ?auto_17962 ?auto_17963 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17962 ?auto_17963 )
      ( !STACK ?auto_17962 ?auto_17961 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17968 - BLOCK
      ?auto_17969 - BLOCK
      ?auto_17970 - BLOCK
      ?auto_17971 - BLOCK
    )
    :vars
    (
      ?auto_17972 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_17970 ) ( ON ?auto_17971 ?auto_17972 ) ( CLEAR ?auto_17971 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17968 ) ( ON ?auto_17969 ?auto_17968 ) ( ON ?auto_17970 ?auto_17969 ) ( not ( = ?auto_17968 ?auto_17969 ) ) ( not ( = ?auto_17968 ?auto_17970 ) ) ( not ( = ?auto_17968 ?auto_17971 ) ) ( not ( = ?auto_17968 ?auto_17972 ) ) ( not ( = ?auto_17969 ?auto_17970 ) ) ( not ( = ?auto_17969 ?auto_17971 ) ) ( not ( = ?auto_17969 ?auto_17972 ) ) ( not ( = ?auto_17970 ?auto_17971 ) ) ( not ( = ?auto_17970 ?auto_17972 ) ) ( not ( = ?auto_17971 ?auto_17972 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17971 ?auto_17972 )
      ( !STACK ?auto_17971 ?auto_17970 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17977 - BLOCK
      ?auto_17978 - BLOCK
      ?auto_17979 - BLOCK
      ?auto_17980 - BLOCK
    )
    :vars
    (
      ?auto_17981 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17980 ?auto_17981 ) ( ON-TABLE ?auto_17977 ) ( ON ?auto_17978 ?auto_17977 ) ( not ( = ?auto_17977 ?auto_17978 ) ) ( not ( = ?auto_17977 ?auto_17979 ) ) ( not ( = ?auto_17977 ?auto_17980 ) ) ( not ( = ?auto_17977 ?auto_17981 ) ) ( not ( = ?auto_17978 ?auto_17979 ) ) ( not ( = ?auto_17978 ?auto_17980 ) ) ( not ( = ?auto_17978 ?auto_17981 ) ) ( not ( = ?auto_17979 ?auto_17980 ) ) ( not ( = ?auto_17979 ?auto_17981 ) ) ( not ( = ?auto_17980 ?auto_17981 ) ) ( CLEAR ?auto_17978 ) ( ON ?auto_17979 ?auto_17980 ) ( CLEAR ?auto_17979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17977 ?auto_17978 ?auto_17979 )
      ( MAKE-4PILE ?auto_17977 ?auto_17978 ?auto_17979 ?auto_17980 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17986 - BLOCK
      ?auto_17987 - BLOCK
      ?auto_17988 - BLOCK
      ?auto_17989 - BLOCK
    )
    :vars
    (
      ?auto_17990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17989 ?auto_17990 ) ( ON-TABLE ?auto_17986 ) ( ON ?auto_17987 ?auto_17986 ) ( not ( = ?auto_17986 ?auto_17987 ) ) ( not ( = ?auto_17986 ?auto_17988 ) ) ( not ( = ?auto_17986 ?auto_17989 ) ) ( not ( = ?auto_17986 ?auto_17990 ) ) ( not ( = ?auto_17987 ?auto_17988 ) ) ( not ( = ?auto_17987 ?auto_17989 ) ) ( not ( = ?auto_17987 ?auto_17990 ) ) ( not ( = ?auto_17988 ?auto_17989 ) ) ( not ( = ?auto_17988 ?auto_17990 ) ) ( not ( = ?auto_17989 ?auto_17990 ) ) ( CLEAR ?auto_17987 ) ( ON ?auto_17988 ?auto_17989 ) ( CLEAR ?auto_17988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17986 ?auto_17987 ?auto_17988 )
      ( MAKE-4PILE ?auto_17986 ?auto_17987 ?auto_17988 ?auto_17989 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17995 - BLOCK
      ?auto_17996 - BLOCK
      ?auto_17997 - BLOCK
      ?auto_17998 - BLOCK
    )
    :vars
    (
      ?auto_17999 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17998 ?auto_17999 ) ( ON-TABLE ?auto_17995 ) ( not ( = ?auto_17995 ?auto_17996 ) ) ( not ( = ?auto_17995 ?auto_17997 ) ) ( not ( = ?auto_17995 ?auto_17998 ) ) ( not ( = ?auto_17995 ?auto_17999 ) ) ( not ( = ?auto_17996 ?auto_17997 ) ) ( not ( = ?auto_17996 ?auto_17998 ) ) ( not ( = ?auto_17996 ?auto_17999 ) ) ( not ( = ?auto_17997 ?auto_17998 ) ) ( not ( = ?auto_17997 ?auto_17999 ) ) ( not ( = ?auto_17998 ?auto_17999 ) ) ( ON ?auto_17997 ?auto_17998 ) ( CLEAR ?auto_17995 ) ( ON ?auto_17996 ?auto_17997 ) ( CLEAR ?auto_17996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17995 ?auto_17996 )
      ( MAKE-4PILE ?auto_17995 ?auto_17996 ?auto_17997 ?auto_17998 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18004 - BLOCK
      ?auto_18005 - BLOCK
      ?auto_18006 - BLOCK
      ?auto_18007 - BLOCK
    )
    :vars
    (
      ?auto_18008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18007 ?auto_18008 ) ( ON-TABLE ?auto_18004 ) ( not ( = ?auto_18004 ?auto_18005 ) ) ( not ( = ?auto_18004 ?auto_18006 ) ) ( not ( = ?auto_18004 ?auto_18007 ) ) ( not ( = ?auto_18004 ?auto_18008 ) ) ( not ( = ?auto_18005 ?auto_18006 ) ) ( not ( = ?auto_18005 ?auto_18007 ) ) ( not ( = ?auto_18005 ?auto_18008 ) ) ( not ( = ?auto_18006 ?auto_18007 ) ) ( not ( = ?auto_18006 ?auto_18008 ) ) ( not ( = ?auto_18007 ?auto_18008 ) ) ( ON ?auto_18006 ?auto_18007 ) ( CLEAR ?auto_18004 ) ( ON ?auto_18005 ?auto_18006 ) ( CLEAR ?auto_18005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18004 ?auto_18005 )
      ( MAKE-4PILE ?auto_18004 ?auto_18005 ?auto_18006 ?auto_18007 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18013 - BLOCK
      ?auto_18014 - BLOCK
      ?auto_18015 - BLOCK
      ?auto_18016 - BLOCK
    )
    :vars
    (
      ?auto_18017 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18016 ?auto_18017 ) ( not ( = ?auto_18013 ?auto_18014 ) ) ( not ( = ?auto_18013 ?auto_18015 ) ) ( not ( = ?auto_18013 ?auto_18016 ) ) ( not ( = ?auto_18013 ?auto_18017 ) ) ( not ( = ?auto_18014 ?auto_18015 ) ) ( not ( = ?auto_18014 ?auto_18016 ) ) ( not ( = ?auto_18014 ?auto_18017 ) ) ( not ( = ?auto_18015 ?auto_18016 ) ) ( not ( = ?auto_18015 ?auto_18017 ) ) ( not ( = ?auto_18016 ?auto_18017 ) ) ( ON ?auto_18015 ?auto_18016 ) ( ON ?auto_18014 ?auto_18015 ) ( ON ?auto_18013 ?auto_18014 ) ( CLEAR ?auto_18013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18013 )
      ( MAKE-4PILE ?auto_18013 ?auto_18014 ?auto_18015 ?auto_18016 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18022 - BLOCK
      ?auto_18023 - BLOCK
      ?auto_18024 - BLOCK
      ?auto_18025 - BLOCK
    )
    :vars
    (
      ?auto_18026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18025 ?auto_18026 ) ( not ( = ?auto_18022 ?auto_18023 ) ) ( not ( = ?auto_18022 ?auto_18024 ) ) ( not ( = ?auto_18022 ?auto_18025 ) ) ( not ( = ?auto_18022 ?auto_18026 ) ) ( not ( = ?auto_18023 ?auto_18024 ) ) ( not ( = ?auto_18023 ?auto_18025 ) ) ( not ( = ?auto_18023 ?auto_18026 ) ) ( not ( = ?auto_18024 ?auto_18025 ) ) ( not ( = ?auto_18024 ?auto_18026 ) ) ( not ( = ?auto_18025 ?auto_18026 ) ) ( ON ?auto_18024 ?auto_18025 ) ( ON ?auto_18023 ?auto_18024 ) ( ON ?auto_18022 ?auto_18023 ) ( CLEAR ?auto_18022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18022 )
      ( MAKE-4PILE ?auto_18022 ?auto_18023 ?auto_18024 ?auto_18025 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18032 - BLOCK
      ?auto_18033 - BLOCK
      ?auto_18034 - BLOCK
      ?auto_18035 - BLOCK
      ?auto_18036 - BLOCK
    )
    :vars
    (
      ?auto_18037 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_18035 ) ( ON ?auto_18036 ?auto_18037 ) ( CLEAR ?auto_18036 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18032 ) ( ON ?auto_18033 ?auto_18032 ) ( ON ?auto_18034 ?auto_18033 ) ( ON ?auto_18035 ?auto_18034 ) ( not ( = ?auto_18032 ?auto_18033 ) ) ( not ( = ?auto_18032 ?auto_18034 ) ) ( not ( = ?auto_18032 ?auto_18035 ) ) ( not ( = ?auto_18032 ?auto_18036 ) ) ( not ( = ?auto_18032 ?auto_18037 ) ) ( not ( = ?auto_18033 ?auto_18034 ) ) ( not ( = ?auto_18033 ?auto_18035 ) ) ( not ( = ?auto_18033 ?auto_18036 ) ) ( not ( = ?auto_18033 ?auto_18037 ) ) ( not ( = ?auto_18034 ?auto_18035 ) ) ( not ( = ?auto_18034 ?auto_18036 ) ) ( not ( = ?auto_18034 ?auto_18037 ) ) ( not ( = ?auto_18035 ?auto_18036 ) ) ( not ( = ?auto_18035 ?auto_18037 ) ) ( not ( = ?auto_18036 ?auto_18037 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18036 ?auto_18037 )
      ( !STACK ?auto_18036 ?auto_18035 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18043 - BLOCK
      ?auto_18044 - BLOCK
      ?auto_18045 - BLOCK
      ?auto_18046 - BLOCK
      ?auto_18047 - BLOCK
    )
    :vars
    (
      ?auto_18048 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_18046 ) ( ON ?auto_18047 ?auto_18048 ) ( CLEAR ?auto_18047 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18043 ) ( ON ?auto_18044 ?auto_18043 ) ( ON ?auto_18045 ?auto_18044 ) ( ON ?auto_18046 ?auto_18045 ) ( not ( = ?auto_18043 ?auto_18044 ) ) ( not ( = ?auto_18043 ?auto_18045 ) ) ( not ( = ?auto_18043 ?auto_18046 ) ) ( not ( = ?auto_18043 ?auto_18047 ) ) ( not ( = ?auto_18043 ?auto_18048 ) ) ( not ( = ?auto_18044 ?auto_18045 ) ) ( not ( = ?auto_18044 ?auto_18046 ) ) ( not ( = ?auto_18044 ?auto_18047 ) ) ( not ( = ?auto_18044 ?auto_18048 ) ) ( not ( = ?auto_18045 ?auto_18046 ) ) ( not ( = ?auto_18045 ?auto_18047 ) ) ( not ( = ?auto_18045 ?auto_18048 ) ) ( not ( = ?auto_18046 ?auto_18047 ) ) ( not ( = ?auto_18046 ?auto_18048 ) ) ( not ( = ?auto_18047 ?auto_18048 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18047 ?auto_18048 )
      ( !STACK ?auto_18047 ?auto_18046 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18054 - BLOCK
      ?auto_18055 - BLOCK
      ?auto_18056 - BLOCK
      ?auto_18057 - BLOCK
      ?auto_18058 - BLOCK
    )
    :vars
    (
      ?auto_18059 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18058 ?auto_18059 ) ( ON-TABLE ?auto_18054 ) ( ON ?auto_18055 ?auto_18054 ) ( ON ?auto_18056 ?auto_18055 ) ( not ( = ?auto_18054 ?auto_18055 ) ) ( not ( = ?auto_18054 ?auto_18056 ) ) ( not ( = ?auto_18054 ?auto_18057 ) ) ( not ( = ?auto_18054 ?auto_18058 ) ) ( not ( = ?auto_18054 ?auto_18059 ) ) ( not ( = ?auto_18055 ?auto_18056 ) ) ( not ( = ?auto_18055 ?auto_18057 ) ) ( not ( = ?auto_18055 ?auto_18058 ) ) ( not ( = ?auto_18055 ?auto_18059 ) ) ( not ( = ?auto_18056 ?auto_18057 ) ) ( not ( = ?auto_18056 ?auto_18058 ) ) ( not ( = ?auto_18056 ?auto_18059 ) ) ( not ( = ?auto_18057 ?auto_18058 ) ) ( not ( = ?auto_18057 ?auto_18059 ) ) ( not ( = ?auto_18058 ?auto_18059 ) ) ( CLEAR ?auto_18056 ) ( ON ?auto_18057 ?auto_18058 ) ( CLEAR ?auto_18057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18054 ?auto_18055 ?auto_18056 ?auto_18057 )
      ( MAKE-5PILE ?auto_18054 ?auto_18055 ?auto_18056 ?auto_18057 ?auto_18058 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18065 - BLOCK
      ?auto_18066 - BLOCK
      ?auto_18067 - BLOCK
      ?auto_18068 - BLOCK
      ?auto_18069 - BLOCK
    )
    :vars
    (
      ?auto_18070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18069 ?auto_18070 ) ( ON-TABLE ?auto_18065 ) ( ON ?auto_18066 ?auto_18065 ) ( ON ?auto_18067 ?auto_18066 ) ( not ( = ?auto_18065 ?auto_18066 ) ) ( not ( = ?auto_18065 ?auto_18067 ) ) ( not ( = ?auto_18065 ?auto_18068 ) ) ( not ( = ?auto_18065 ?auto_18069 ) ) ( not ( = ?auto_18065 ?auto_18070 ) ) ( not ( = ?auto_18066 ?auto_18067 ) ) ( not ( = ?auto_18066 ?auto_18068 ) ) ( not ( = ?auto_18066 ?auto_18069 ) ) ( not ( = ?auto_18066 ?auto_18070 ) ) ( not ( = ?auto_18067 ?auto_18068 ) ) ( not ( = ?auto_18067 ?auto_18069 ) ) ( not ( = ?auto_18067 ?auto_18070 ) ) ( not ( = ?auto_18068 ?auto_18069 ) ) ( not ( = ?auto_18068 ?auto_18070 ) ) ( not ( = ?auto_18069 ?auto_18070 ) ) ( CLEAR ?auto_18067 ) ( ON ?auto_18068 ?auto_18069 ) ( CLEAR ?auto_18068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18065 ?auto_18066 ?auto_18067 ?auto_18068 )
      ( MAKE-5PILE ?auto_18065 ?auto_18066 ?auto_18067 ?auto_18068 ?auto_18069 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18076 - BLOCK
      ?auto_18077 - BLOCK
      ?auto_18078 - BLOCK
      ?auto_18079 - BLOCK
      ?auto_18080 - BLOCK
    )
    :vars
    (
      ?auto_18081 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18080 ?auto_18081 ) ( ON-TABLE ?auto_18076 ) ( ON ?auto_18077 ?auto_18076 ) ( not ( = ?auto_18076 ?auto_18077 ) ) ( not ( = ?auto_18076 ?auto_18078 ) ) ( not ( = ?auto_18076 ?auto_18079 ) ) ( not ( = ?auto_18076 ?auto_18080 ) ) ( not ( = ?auto_18076 ?auto_18081 ) ) ( not ( = ?auto_18077 ?auto_18078 ) ) ( not ( = ?auto_18077 ?auto_18079 ) ) ( not ( = ?auto_18077 ?auto_18080 ) ) ( not ( = ?auto_18077 ?auto_18081 ) ) ( not ( = ?auto_18078 ?auto_18079 ) ) ( not ( = ?auto_18078 ?auto_18080 ) ) ( not ( = ?auto_18078 ?auto_18081 ) ) ( not ( = ?auto_18079 ?auto_18080 ) ) ( not ( = ?auto_18079 ?auto_18081 ) ) ( not ( = ?auto_18080 ?auto_18081 ) ) ( ON ?auto_18079 ?auto_18080 ) ( CLEAR ?auto_18077 ) ( ON ?auto_18078 ?auto_18079 ) ( CLEAR ?auto_18078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18076 ?auto_18077 ?auto_18078 )
      ( MAKE-5PILE ?auto_18076 ?auto_18077 ?auto_18078 ?auto_18079 ?auto_18080 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18087 - BLOCK
      ?auto_18088 - BLOCK
      ?auto_18089 - BLOCK
      ?auto_18090 - BLOCK
      ?auto_18091 - BLOCK
    )
    :vars
    (
      ?auto_18092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18091 ?auto_18092 ) ( ON-TABLE ?auto_18087 ) ( ON ?auto_18088 ?auto_18087 ) ( not ( = ?auto_18087 ?auto_18088 ) ) ( not ( = ?auto_18087 ?auto_18089 ) ) ( not ( = ?auto_18087 ?auto_18090 ) ) ( not ( = ?auto_18087 ?auto_18091 ) ) ( not ( = ?auto_18087 ?auto_18092 ) ) ( not ( = ?auto_18088 ?auto_18089 ) ) ( not ( = ?auto_18088 ?auto_18090 ) ) ( not ( = ?auto_18088 ?auto_18091 ) ) ( not ( = ?auto_18088 ?auto_18092 ) ) ( not ( = ?auto_18089 ?auto_18090 ) ) ( not ( = ?auto_18089 ?auto_18091 ) ) ( not ( = ?auto_18089 ?auto_18092 ) ) ( not ( = ?auto_18090 ?auto_18091 ) ) ( not ( = ?auto_18090 ?auto_18092 ) ) ( not ( = ?auto_18091 ?auto_18092 ) ) ( ON ?auto_18090 ?auto_18091 ) ( CLEAR ?auto_18088 ) ( ON ?auto_18089 ?auto_18090 ) ( CLEAR ?auto_18089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18087 ?auto_18088 ?auto_18089 )
      ( MAKE-5PILE ?auto_18087 ?auto_18088 ?auto_18089 ?auto_18090 ?auto_18091 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18098 - BLOCK
      ?auto_18099 - BLOCK
      ?auto_18100 - BLOCK
      ?auto_18101 - BLOCK
      ?auto_18102 - BLOCK
    )
    :vars
    (
      ?auto_18103 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18102 ?auto_18103 ) ( ON-TABLE ?auto_18098 ) ( not ( = ?auto_18098 ?auto_18099 ) ) ( not ( = ?auto_18098 ?auto_18100 ) ) ( not ( = ?auto_18098 ?auto_18101 ) ) ( not ( = ?auto_18098 ?auto_18102 ) ) ( not ( = ?auto_18098 ?auto_18103 ) ) ( not ( = ?auto_18099 ?auto_18100 ) ) ( not ( = ?auto_18099 ?auto_18101 ) ) ( not ( = ?auto_18099 ?auto_18102 ) ) ( not ( = ?auto_18099 ?auto_18103 ) ) ( not ( = ?auto_18100 ?auto_18101 ) ) ( not ( = ?auto_18100 ?auto_18102 ) ) ( not ( = ?auto_18100 ?auto_18103 ) ) ( not ( = ?auto_18101 ?auto_18102 ) ) ( not ( = ?auto_18101 ?auto_18103 ) ) ( not ( = ?auto_18102 ?auto_18103 ) ) ( ON ?auto_18101 ?auto_18102 ) ( ON ?auto_18100 ?auto_18101 ) ( CLEAR ?auto_18098 ) ( ON ?auto_18099 ?auto_18100 ) ( CLEAR ?auto_18099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18098 ?auto_18099 )
      ( MAKE-5PILE ?auto_18098 ?auto_18099 ?auto_18100 ?auto_18101 ?auto_18102 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18109 - BLOCK
      ?auto_18110 - BLOCK
      ?auto_18111 - BLOCK
      ?auto_18112 - BLOCK
      ?auto_18113 - BLOCK
    )
    :vars
    (
      ?auto_18114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18113 ?auto_18114 ) ( ON-TABLE ?auto_18109 ) ( not ( = ?auto_18109 ?auto_18110 ) ) ( not ( = ?auto_18109 ?auto_18111 ) ) ( not ( = ?auto_18109 ?auto_18112 ) ) ( not ( = ?auto_18109 ?auto_18113 ) ) ( not ( = ?auto_18109 ?auto_18114 ) ) ( not ( = ?auto_18110 ?auto_18111 ) ) ( not ( = ?auto_18110 ?auto_18112 ) ) ( not ( = ?auto_18110 ?auto_18113 ) ) ( not ( = ?auto_18110 ?auto_18114 ) ) ( not ( = ?auto_18111 ?auto_18112 ) ) ( not ( = ?auto_18111 ?auto_18113 ) ) ( not ( = ?auto_18111 ?auto_18114 ) ) ( not ( = ?auto_18112 ?auto_18113 ) ) ( not ( = ?auto_18112 ?auto_18114 ) ) ( not ( = ?auto_18113 ?auto_18114 ) ) ( ON ?auto_18112 ?auto_18113 ) ( ON ?auto_18111 ?auto_18112 ) ( CLEAR ?auto_18109 ) ( ON ?auto_18110 ?auto_18111 ) ( CLEAR ?auto_18110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18109 ?auto_18110 )
      ( MAKE-5PILE ?auto_18109 ?auto_18110 ?auto_18111 ?auto_18112 ?auto_18113 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18120 - BLOCK
      ?auto_18121 - BLOCK
      ?auto_18122 - BLOCK
      ?auto_18123 - BLOCK
      ?auto_18124 - BLOCK
    )
    :vars
    (
      ?auto_18125 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18124 ?auto_18125 ) ( not ( = ?auto_18120 ?auto_18121 ) ) ( not ( = ?auto_18120 ?auto_18122 ) ) ( not ( = ?auto_18120 ?auto_18123 ) ) ( not ( = ?auto_18120 ?auto_18124 ) ) ( not ( = ?auto_18120 ?auto_18125 ) ) ( not ( = ?auto_18121 ?auto_18122 ) ) ( not ( = ?auto_18121 ?auto_18123 ) ) ( not ( = ?auto_18121 ?auto_18124 ) ) ( not ( = ?auto_18121 ?auto_18125 ) ) ( not ( = ?auto_18122 ?auto_18123 ) ) ( not ( = ?auto_18122 ?auto_18124 ) ) ( not ( = ?auto_18122 ?auto_18125 ) ) ( not ( = ?auto_18123 ?auto_18124 ) ) ( not ( = ?auto_18123 ?auto_18125 ) ) ( not ( = ?auto_18124 ?auto_18125 ) ) ( ON ?auto_18123 ?auto_18124 ) ( ON ?auto_18122 ?auto_18123 ) ( ON ?auto_18121 ?auto_18122 ) ( ON ?auto_18120 ?auto_18121 ) ( CLEAR ?auto_18120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18120 )
      ( MAKE-5PILE ?auto_18120 ?auto_18121 ?auto_18122 ?auto_18123 ?auto_18124 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18131 - BLOCK
      ?auto_18132 - BLOCK
      ?auto_18133 - BLOCK
      ?auto_18134 - BLOCK
      ?auto_18135 - BLOCK
    )
    :vars
    (
      ?auto_18136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18135 ?auto_18136 ) ( not ( = ?auto_18131 ?auto_18132 ) ) ( not ( = ?auto_18131 ?auto_18133 ) ) ( not ( = ?auto_18131 ?auto_18134 ) ) ( not ( = ?auto_18131 ?auto_18135 ) ) ( not ( = ?auto_18131 ?auto_18136 ) ) ( not ( = ?auto_18132 ?auto_18133 ) ) ( not ( = ?auto_18132 ?auto_18134 ) ) ( not ( = ?auto_18132 ?auto_18135 ) ) ( not ( = ?auto_18132 ?auto_18136 ) ) ( not ( = ?auto_18133 ?auto_18134 ) ) ( not ( = ?auto_18133 ?auto_18135 ) ) ( not ( = ?auto_18133 ?auto_18136 ) ) ( not ( = ?auto_18134 ?auto_18135 ) ) ( not ( = ?auto_18134 ?auto_18136 ) ) ( not ( = ?auto_18135 ?auto_18136 ) ) ( ON ?auto_18134 ?auto_18135 ) ( ON ?auto_18133 ?auto_18134 ) ( ON ?auto_18132 ?auto_18133 ) ( ON ?auto_18131 ?auto_18132 ) ( CLEAR ?auto_18131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18131 )
      ( MAKE-5PILE ?auto_18131 ?auto_18132 ?auto_18133 ?auto_18134 ?auto_18135 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_18143 - BLOCK
      ?auto_18144 - BLOCK
      ?auto_18145 - BLOCK
      ?auto_18146 - BLOCK
      ?auto_18147 - BLOCK
      ?auto_18148 - BLOCK
    )
    :vars
    (
      ?auto_18149 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_18147 ) ( ON ?auto_18148 ?auto_18149 ) ( CLEAR ?auto_18148 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18143 ) ( ON ?auto_18144 ?auto_18143 ) ( ON ?auto_18145 ?auto_18144 ) ( ON ?auto_18146 ?auto_18145 ) ( ON ?auto_18147 ?auto_18146 ) ( not ( = ?auto_18143 ?auto_18144 ) ) ( not ( = ?auto_18143 ?auto_18145 ) ) ( not ( = ?auto_18143 ?auto_18146 ) ) ( not ( = ?auto_18143 ?auto_18147 ) ) ( not ( = ?auto_18143 ?auto_18148 ) ) ( not ( = ?auto_18143 ?auto_18149 ) ) ( not ( = ?auto_18144 ?auto_18145 ) ) ( not ( = ?auto_18144 ?auto_18146 ) ) ( not ( = ?auto_18144 ?auto_18147 ) ) ( not ( = ?auto_18144 ?auto_18148 ) ) ( not ( = ?auto_18144 ?auto_18149 ) ) ( not ( = ?auto_18145 ?auto_18146 ) ) ( not ( = ?auto_18145 ?auto_18147 ) ) ( not ( = ?auto_18145 ?auto_18148 ) ) ( not ( = ?auto_18145 ?auto_18149 ) ) ( not ( = ?auto_18146 ?auto_18147 ) ) ( not ( = ?auto_18146 ?auto_18148 ) ) ( not ( = ?auto_18146 ?auto_18149 ) ) ( not ( = ?auto_18147 ?auto_18148 ) ) ( not ( = ?auto_18147 ?auto_18149 ) ) ( not ( = ?auto_18148 ?auto_18149 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18148 ?auto_18149 )
      ( !STACK ?auto_18148 ?auto_18147 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_18156 - BLOCK
      ?auto_18157 - BLOCK
      ?auto_18158 - BLOCK
      ?auto_18159 - BLOCK
      ?auto_18160 - BLOCK
      ?auto_18161 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_18160 ) ( ON-TABLE ?auto_18161 ) ( CLEAR ?auto_18161 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18156 ) ( ON ?auto_18157 ?auto_18156 ) ( ON ?auto_18158 ?auto_18157 ) ( ON ?auto_18159 ?auto_18158 ) ( ON ?auto_18160 ?auto_18159 ) ( not ( = ?auto_18156 ?auto_18157 ) ) ( not ( = ?auto_18156 ?auto_18158 ) ) ( not ( = ?auto_18156 ?auto_18159 ) ) ( not ( = ?auto_18156 ?auto_18160 ) ) ( not ( = ?auto_18156 ?auto_18161 ) ) ( not ( = ?auto_18157 ?auto_18158 ) ) ( not ( = ?auto_18157 ?auto_18159 ) ) ( not ( = ?auto_18157 ?auto_18160 ) ) ( not ( = ?auto_18157 ?auto_18161 ) ) ( not ( = ?auto_18158 ?auto_18159 ) ) ( not ( = ?auto_18158 ?auto_18160 ) ) ( not ( = ?auto_18158 ?auto_18161 ) ) ( not ( = ?auto_18159 ?auto_18160 ) ) ( not ( = ?auto_18159 ?auto_18161 ) ) ( not ( = ?auto_18160 ?auto_18161 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_18161 )
      ( !STACK ?auto_18161 ?auto_18160 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_18168 - BLOCK
      ?auto_18169 - BLOCK
      ?auto_18170 - BLOCK
      ?auto_18171 - BLOCK
      ?auto_18172 - BLOCK
      ?auto_18173 - BLOCK
    )
    :vars
    (
      ?auto_18174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18173 ?auto_18174 ) ( ON-TABLE ?auto_18168 ) ( ON ?auto_18169 ?auto_18168 ) ( ON ?auto_18170 ?auto_18169 ) ( ON ?auto_18171 ?auto_18170 ) ( not ( = ?auto_18168 ?auto_18169 ) ) ( not ( = ?auto_18168 ?auto_18170 ) ) ( not ( = ?auto_18168 ?auto_18171 ) ) ( not ( = ?auto_18168 ?auto_18172 ) ) ( not ( = ?auto_18168 ?auto_18173 ) ) ( not ( = ?auto_18168 ?auto_18174 ) ) ( not ( = ?auto_18169 ?auto_18170 ) ) ( not ( = ?auto_18169 ?auto_18171 ) ) ( not ( = ?auto_18169 ?auto_18172 ) ) ( not ( = ?auto_18169 ?auto_18173 ) ) ( not ( = ?auto_18169 ?auto_18174 ) ) ( not ( = ?auto_18170 ?auto_18171 ) ) ( not ( = ?auto_18170 ?auto_18172 ) ) ( not ( = ?auto_18170 ?auto_18173 ) ) ( not ( = ?auto_18170 ?auto_18174 ) ) ( not ( = ?auto_18171 ?auto_18172 ) ) ( not ( = ?auto_18171 ?auto_18173 ) ) ( not ( = ?auto_18171 ?auto_18174 ) ) ( not ( = ?auto_18172 ?auto_18173 ) ) ( not ( = ?auto_18172 ?auto_18174 ) ) ( not ( = ?auto_18173 ?auto_18174 ) ) ( CLEAR ?auto_18171 ) ( ON ?auto_18172 ?auto_18173 ) ( CLEAR ?auto_18172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_18168 ?auto_18169 ?auto_18170 ?auto_18171 ?auto_18172 )
      ( MAKE-6PILE ?auto_18168 ?auto_18169 ?auto_18170 ?auto_18171 ?auto_18172 ?auto_18173 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_18181 - BLOCK
      ?auto_18182 - BLOCK
      ?auto_18183 - BLOCK
      ?auto_18184 - BLOCK
      ?auto_18185 - BLOCK
      ?auto_18186 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18186 ) ( ON-TABLE ?auto_18181 ) ( ON ?auto_18182 ?auto_18181 ) ( ON ?auto_18183 ?auto_18182 ) ( ON ?auto_18184 ?auto_18183 ) ( not ( = ?auto_18181 ?auto_18182 ) ) ( not ( = ?auto_18181 ?auto_18183 ) ) ( not ( = ?auto_18181 ?auto_18184 ) ) ( not ( = ?auto_18181 ?auto_18185 ) ) ( not ( = ?auto_18181 ?auto_18186 ) ) ( not ( = ?auto_18182 ?auto_18183 ) ) ( not ( = ?auto_18182 ?auto_18184 ) ) ( not ( = ?auto_18182 ?auto_18185 ) ) ( not ( = ?auto_18182 ?auto_18186 ) ) ( not ( = ?auto_18183 ?auto_18184 ) ) ( not ( = ?auto_18183 ?auto_18185 ) ) ( not ( = ?auto_18183 ?auto_18186 ) ) ( not ( = ?auto_18184 ?auto_18185 ) ) ( not ( = ?auto_18184 ?auto_18186 ) ) ( not ( = ?auto_18185 ?auto_18186 ) ) ( CLEAR ?auto_18184 ) ( ON ?auto_18185 ?auto_18186 ) ( CLEAR ?auto_18185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_18181 ?auto_18182 ?auto_18183 ?auto_18184 ?auto_18185 )
      ( MAKE-6PILE ?auto_18181 ?auto_18182 ?auto_18183 ?auto_18184 ?auto_18185 ?auto_18186 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_18193 - BLOCK
      ?auto_18194 - BLOCK
      ?auto_18195 - BLOCK
      ?auto_18196 - BLOCK
      ?auto_18197 - BLOCK
      ?auto_18198 - BLOCK
    )
    :vars
    (
      ?auto_18199 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18198 ?auto_18199 ) ( ON-TABLE ?auto_18193 ) ( ON ?auto_18194 ?auto_18193 ) ( ON ?auto_18195 ?auto_18194 ) ( not ( = ?auto_18193 ?auto_18194 ) ) ( not ( = ?auto_18193 ?auto_18195 ) ) ( not ( = ?auto_18193 ?auto_18196 ) ) ( not ( = ?auto_18193 ?auto_18197 ) ) ( not ( = ?auto_18193 ?auto_18198 ) ) ( not ( = ?auto_18193 ?auto_18199 ) ) ( not ( = ?auto_18194 ?auto_18195 ) ) ( not ( = ?auto_18194 ?auto_18196 ) ) ( not ( = ?auto_18194 ?auto_18197 ) ) ( not ( = ?auto_18194 ?auto_18198 ) ) ( not ( = ?auto_18194 ?auto_18199 ) ) ( not ( = ?auto_18195 ?auto_18196 ) ) ( not ( = ?auto_18195 ?auto_18197 ) ) ( not ( = ?auto_18195 ?auto_18198 ) ) ( not ( = ?auto_18195 ?auto_18199 ) ) ( not ( = ?auto_18196 ?auto_18197 ) ) ( not ( = ?auto_18196 ?auto_18198 ) ) ( not ( = ?auto_18196 ?auto_18199 ) ) ( not ( = ?auto_18197 ?auto_18198 ) ) ( not ( = ?auto_18197 ?auto_18199 ) ) ( not ( = ?auto_18198 ?auto_18199 ) ) ( ON ?auto_18197 ?auto_18198 ) ( CLEAR ?auto_18195 ) ( ON ?auto_18196 ?auto_18197 ) ( CLEAR ?auto_18196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18193 ?auto_18194 ?auto_18195 ?auto_18196 )
      ( MAKE-6PILE ?auto_18193 ?auto_18194 ?auto_18195 ?auto_18196 ?auto_18197 ?auto_18198 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_18206 - BLOCK
      ?auto_18207 - BLOCK
      ?auto_18208 - BLOCK
      ?auto_18209 - BLOCK
      ?auto_18210 - BLOCK
      ?auto_18211 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18211 ) ( ON-TABLE ?auto_18206 ) ( ON ?auto_18207 ?auto_18206 ) ( ON ?auto_18208 ?auto_18207 ) ( not ( = ?auto_18206 ?auto_18207 ) ) ( not ( = ?auto_18206 ?auto_18208 ) ) ( not ( = ?auto_18206 ?auto_18209 ) ) ( not ( = ?auto_18206 ?auto_18210 ) ) ( not ( = ?auto_18206 ?auto_18211 ) ) ( not ( = ?auto_18207 ?auto_18208 ) ) ( not ( = ?auto_18207 ?auto_18209 ) ) ( not ( = ?auto_18207 ?auto_18210 ) ) ( not ( = ?auto_18207 ?auto_18211 ) ) ( not ( = ?auto_18208 ?auto_18209 ) ) ( not ( = ?auto_18208 ?auto_18210 ) ) ( not ( = ?auto_18208 ?auto_18211 ) ) ( not ( = ?auto_18209 ?auto_18210 ) ) ( not ( = ?auto_18209 ?auto_18211 ) ) ( not ( = ?auto_18210 ?auto_18211 ) ) ( ON ?auto_18210 ?auto_18211 ) ( CLEAR ?auto_18208 ) ( ON ?auto_18209 ?auto_18210 ) ( CLEAR ?auto_18209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18206 ?auto_18207 ?auto_18208 ?auto_18209 )
      ( MAKE-6PILE ?auto_18206 ?auto_18207 ?auto_18208 ?auto_18209 ?auto_18210 ?auto_18211 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_18218 - BLOCK
      ?auto_18219 - BLOCK
      ?auto_18220 - BLOCK
      ?auto_18221 - BLOCK
      ?auto_18222 - BLOCK
      ?auto_18223 - BLOCK
    )
    :vars
    (
      ?auto_18224 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18223 ?auto_18224 ) ( ON-TABLE ?auto_18218 ) ( ON ?auto_18219 ?auto_18218 ) ( not ( = ?auto_18218 ?auto_18219 ) ) ( not ( = ?auto_18218 ?auto_18220 ) ) ( not ( = ?auto_18218 ?auto_18221 ) ) ( not ( = ?auto_18218 ?auto_18222 ) ) ( not ( = ?auto_18218 ?auto_18223 ) ) ( not ( = ?auto_18218 ?auto_18224 ) ) ( not ( = ?auto_18219 ?auto_18220 ) ) ( not ( = ?auto_18219 ?auto_18221 ) ) ( not ( = ?auto_18219 ?auto_18222 ) ) ( not ( = ?auto_18219 ?auto_18223 ) ) ( not ( = ?auto_18219 ?auto_18224 ) ) ( not ( = ?auto_18220 ?auto_18221 ) ) ( not ( = ?auto_18220 ?auto_18222 ) ) ( not ( = ?auto_18220 ?auto_18223 ) ) ( not ( = ?auto_18220 ?auto_18224 ) ) ( not ( = ?auto_18221 ?auto_18222 ) ) ( not ( = ?auto_18221 ?auto_18223 ) ) ( not ( = ?auto_18221 ?auto_18224 ) ) ( not ( = ?auto_18222 ?auto_18223 ) ) ( not ( = ?auto_18222 ?auto_18224 ) ) ( not ( = ?auto_18223 ?auto_18224 ) ) ( ON ?auto_18222 ?auto_18223 ) ( ON ?auto_18221 ?auto_18222 ) ( CLEAR ?auto_18219 ) ( ON ?auto_18220 ?auto_18221 ) ( CLEAR ?auto_18220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18218 ?auto_18219 ?auto_18220 )
      ( MAKE-6PILE ?auto_18218 ?auto_18219 ?auto_18220 ?auto_18221 ?auto_18222 ?auto_18223 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_18231 - BLOCK
      ?auto_18232 - BLOCK
      ?auto_18233 - BLOCK
      ?auto_18234 - BLOCK
      ?auto_18235 - BLOCK
      ?auto_18236 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18236 ) ( ON-TABLE ?auto_18231 ) ( ON ?auto_18232 ?auto_18231 ) ( not ( = ?auto_18231 ?auto_18232 ) ) ( not ( = ?auto_18231 ?auto_18233 ) ) ( not ( = ?auto_18231 ?auto_18234 ) ) ( not ( = ?auto_18231 ?auto_18235 ) ) ( not ( = ?auto_18231 ?auto_18236 ) ) ( not ( = ?auto_18232 ?auto_18233 ) ) ( not ( = ?auto_18232 ?auto_18234 ) ) ( not ( = ?auto_18232 ?auto_18235 ) ) ( not ( = ?auto_18232 ?auto_18236 ) ) ( not ( = ?auto_18233 ?auto_18234 ) ) ( not ( = ?auto_18233 ?auto_18235 ) ) ( not ( = ?auto_18233 ?auto_18236 ) ) ( not ( = ?auto_18234 ?auto_18235 ) ) ( not ( = ?auto_18234 ?auto_18236 ) ) ( not ( = ?auto_18235 ?auto_18236 ) ) ( ON ?auto_18235 ?auto_18236 ) ( ON ?auto_18234 ?auto_18235 ) ( CLEAR ?auto_18232 ) ( ON ?auto_18233 ?auto_18234 ) ( CLEAR ?auto_18233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18231 ?auto_18232 ?auto_18233 )
      ( MAKE-6PILE ?auto_18231 ?auto_18232 ?auto_18233 ?auto_18234 ?auto_18235 ?auto_18236 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_18243 - BLOCK
      ?auto_18244 - BLOCK
      ?auto_18245 - BLOCK
      ?auto_18246 - BLOCK
      ?auto_18247 - BLOCK
      ?auto_18248 - BLOCK
    )
    :vars
    (
      ?auto_18249 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18248 ?auto_18249 ) ( ON-TABLE ?auto_18243 ) ( not ( = ?auto_18243 ?auto_18244 ) ) ( not ( = ?auto_18243 ?auto_18245 ) ) ( not ( = ?auto_18243 ?auto_18246 ) ) ( not ( = ?auto_18243 ?auto_18247 ) ) ( not ( = ?auto_18243 ?auto_18248 ) ) ( not ( = ?auto_18243 ?auto_18249 ) ) ( not ( = ?auto_18244 ?auto_18245 ) ) ( not ( = ?auto_18244 ?auto_18246 ) ) ( not ( = ?auto_18244 ?auto_18247 ) ) ( not ( = ?auto_18244 ?auto_18248 ) ) ( not ( = ?auto_18244 ?auto_18249 ) ) ( not ( = ?auto_18245 ?auto_18246 ) ) ( not ( = ?auto_18245 ?auto_18247 ) ) ( not ( = ?auto_18245 ?auto_18248 ) ) ( not ( = ?auto_18245 ?auto_18249 ) ) ( not ( = ?auto_18246 ?auto_18247 ) ) ( not ( = ?auto_18246 ?auto_18248 ) ) ( not ( = ?auto_18246 ?auto_18249 ) ) ( not ( = ?auto_18247 ?auto_18248 ) ) ( not ( = ?auto_18247 ?auto_18249 ) ) ( not ( = ?auto_18248 ?auto_18249 ) ) ( ON ?auto_18247 ?auto_18248 ) ( ON ?auto_18246 ?auto_18247 ) ( ON ?auto_18245 ?auto_18246 ) ( CLEAR ?auto_18243 ) ( ON ?auto_18244 ?auto_18245 ) ( CLEAR ?auto_18244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18243 ?auto_18244 )
      ( MAKE-6PILE ?auto_18243 ?auto_18244 ?auto_18245 ?auto_18246 ?auto_18247 ?auto_18248 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_18256 - BLOCK
      ?auto_18257 - BLOCK
      ?auto_18258 - BLOCK
      ?auto_18259 - BLOCK
      ?auto_18260 - BLOCK
      ?auto_18261 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18261 ) ( ON-TABLE ?auto_18256 ) ( not ( = ?auto_18256 ?auto_18257 ) ) ( not ( = ?auto_18256 ?auto_18258 ) ) ( not ( = ?auto_18256 ?auto_18259 ) ) ( not ( = ?auto_18256 ?auto_18260 ) ) ( not ( = ?auto_18256 ?auto_18261 ) ) ( not ( = ?auto_18257 ?auto_18258 ) ) ( not ( = ?auto_18257 ?auto_18259 ) ) ( not ( = ?auto_18257 ?auto_18260 ) ) ( not ( = ?auto_18257 ?auto_18261 ) ) ( not ( = ?auto_18258 ?auto_18259 ) ) ( not ( = ?auto_18258 ?auto_18260 ) ) ( not ( = ?auto_18258 ?auto_18261 ) ) ( not ( = ?auto_18259 ?auto_18260 ) ) ( not ( = ?auto_18259 ?auto_18261 ) ) ( not ( = ?auto_18260 ?auto_18261 ) ) ( ON ?auto_18260 ?auto_18261 ) ( ON ?auto_18259 ?auto_18260 ) ( ON ?auto_18258 ?auto_18259 ) ( CLEAR ?auto_18256 ) ( ON ?auto_18257 ?auto_18258 ) ( CLEAR ?auto_18257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18256 ?auto_18257 )
      ( MAKE-6PILE ?auto_18256 ?auto_18257 ?auto_18258 ?auto_18259 ?auto_18260 ?auto_18261 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_18268 - BLOCK
      ?auto_18269 - BLOCK
      ?auto_18270 - BLOCK
      ?auto_18271 - BLOCK
      ?auto_18272 - BLOCK
      ?auto_18273 - BLOCK
    )
    :vars
    (
      ?auto_18274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18273 ?auto_18274 ) ( not ( = ?auto_18268 ?auto_18269 ) ) ( not ( = ?auto_18268 ?auto_18270 ) ) ( not ( = ?auto_18268 ?auto_18271 ) ) ( not ( = ?auto_18268 ?auto_18272 ) ) ( not ( = ?auto_18268 ?auto_18273 ) ) ( not ( = ?auto_18268 ?auto_18274 ) ) ( not ( = ?auto_18269 ?auto_18270 ) ) ( not ( = ?auto_18269 ?auto_18271 ) ) ( not ( = ?auto_18269 ?auto_18272 ) ) ( not ( = ?auto_18269 ?auto_18273 ) ) ( not ( = ?auto_18269 ?auto_18274 ) ) ( not ( = ?auto_18270 ?auto_18271 ) ) ( not ( = ?auto_18270 ?auto_18272 ) ) ( not ( = ?auto_18270 ?auto_18273 ) ) ( not ( = ?auto_18270 ?auto_18274 ) ) ( not ( = ?auto_18271 ?auto_18272 ) ) ( not ( = ?auto_18271 ?auto_18273 ) ) ( not ( = ?auto_18271 ?auto_18274 ) ) ( not ( = ?auto_18272 ?auto_18273 ) ) ( not ( = ?auto_18272 ?auto_18274 ) ) ( not ( = ?auto_18273 ?auto_18274 ) ) ( ON ?auto_18272 ?auto_18273 ) ( ON ?auto_18271 ?auto_18272 ) ( ON ?auto_18270 ?auto_18271 ) ( ON ?auto_18269 ?auto_18270 ) ( ON ?auto_18268 ?auto_18269 ) ( CLEAR ?auto_18268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18268 )
      ( MAKE-6PILE ?auto_18268 ?auto_18269 ?auto_18270 ?auto_18271 ?auto_18272 ?auto_18273 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_18281 - BLOCK
      ?auto_18282 - BLOCK
      ?auto_18283 - BLOCK
      ?auto_18284 - BLOCK
      ?auto_18285 - BLOCK
      ?auto_18286 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18286 ) ( not ( = ?auto_18281 ?auto_18282 ) ) ( not ( = ?auto_18281 ?auto_18283 ) ) ( not ( = ?auto_18281 ?auto_18284 ) ) ( not ( = ?auto_18281 ?auto_18285 ) ) ( not ( = ?auto_18281 ?auto_18286 ) ) ( not ( = ?auto_18282 ?auto_18283 ) ) ( not ( = ?auto_18282 ?auto_18284 ) ) ( not ( = ?auto_18282 ?auto_18285 ) ) ( not ( = ?auto_18282 ?auto_18286 ) ) ( not ( = ?auto_18283 ?auto_18284 ) ) ( not ( = ?auto_18283 ?auto_18285 ) ) ( not ( = ?auto_18283 ?auto_18286 ) ) ( not ( = ?auto_18284 ?auto_18285 ) ) ( not ( = ?auto_18284 ?auto_18286 ) ) ( not ( = ?auto_18285 ?auto_18286 ) ) ( ON ?auto_18285 ?auto_18286 ) ( ON ?auto_18284 ?auto_18285 ) ( ON ?auto_18283 ?auto_18284 ) ( ON ?auto_18282 ?auto_18283 ) ( ON ?auto_18281 ?auto_18282 ) ( CLEAR ?auto_18281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18281 )
      ( MAKE-6PILE ?auto_18281 ?auto_18282 ?auto_18283 ?auto_18284 ?auto_18285 ?auto_18286 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_18293 - BLOCK
      ?auto_18294 - BLOCK
      ?auto_18295 - BLOCK
      ?auto_18296 - BLOCK
      ?auto_18297 - BLOCK
      ?auto_18298 - BLOCK
    )
    :vars
    (
      ?auto_18299 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18293 ?auto_18294 ) ) ( not ( = ?auto_18293 ?auto_18295 ) ) ( not ( = ?auto_18293 ?auto_18296 ) ) ( not ( = ?auto_18293 ?auto_18297 ) ) ( not ( = ?auto_18293 ?auto_18298 ) ) ( not ( = ?auto_18294 ?auto_18295 ) ) ( not ( = ?auto_18294 ?auto_18296 ) ) ( not ( = ?auto_18294 ?auto_18297 ) ) ( not ( = ?auto_18294 ?auto_18298 ) ) ( not ( = ?auto_18295 ?auto_18296 ) ) ( not ( = ?auto_18295 ?auto_18297 ) ) ( not ( = ?auto_18295 ?auto_18298 ) ) ( not ( = ?auto_18296 ?auto_18297 ) ) ( not ( = ?auto_18296 ?auto_18298 ) ) ( not ( = ?auto_18297 ?auto_18298 ) ) ( ON ?auto_18293 ?auto_18299 ) ( not ( = ?auto_18298 ?auto_18299 ) ) ( not ( = ?auto_18297 ?auto_18299 ) ) ( not ( = ?auto_18296 ?auto_18299 ) ) ( not ( = ?auto_18295 ?auto_18299 ) ) ( not ( = ?auto_18294 ?auto_18299 ) ) ( not ( = ?auto_18293 ?auto_18299 ) ) ( ON ?auto_18294 ?auto_18293 ) ( ON ?auto_18295 ?auto_18294 ) ( ON ?auto_18296 ?auto_18295 ) ( ON ?auto_18297 ?auto_18296 ) ( ON ?auto_18298 ?auto_18297 ) ( CLEAR ?auto_18298 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_18298 ?auto_18297 ?auto_18296 ?auto_18295 ?auto_18294 ?auto_18293 )
      ( MAKE-6PILE ?auto_18293 ?auto_18294 ?auto_18295 ?auto_18296 ?auto_18297 ?auto_18298 ) )
  )

)

