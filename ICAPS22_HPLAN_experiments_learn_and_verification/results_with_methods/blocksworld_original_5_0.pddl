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
      ?auto_17925 - BLOCK
      ?auto_17926 - BLOCK
      ?auto_17927 - BLOCK
      ?auto_17928 - BLOCK
      ?auto_17929 - BLOCK
    )
    :vars
    (
      ?auto_17930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17930 ?auto_17929 ) ( CLEAR ?auto_17930 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17925 ) ( ON ?auto_17926 ?auto_17925 ) ( ON ?auto_17927 ?auto_17926 ) ( ON ?auto_17928 ?auto_17927 ) ( ON ?auto_17929 ?auto_17928 ) ( not ( = ?auto_17925 ?auto_17926 ) ) ( not ( = ?auto_17925 ?auto_17927 ) ) ( not ( = ?auto_17925 ?auto_17928 ) ) ( not ( = ?auto_17925 ?auto_17929 ) ) ( not ( = ?auto_17925 ?auto_17930 ) ) ( not ( = ?auto_17926 ?auto_17927 ) ) ( not ( = ?auto_17926 ?auto_17928 ) ) ( not ( = ?auto_17926 ?auto_17929 ) ) ( not ( = ?auto_17926 ?auto_17930 ) ) ( not ( = ?auto_17927 ?auto_17928 ) ) ( not ( = ?auto_17927 ?auto_17929 ) ) ( not ( = ?auto_17927 ?auto_17930 ) ) ( not ( = ?auto_17928 ?auto_17929 ) ) ( not ( = ?auto_17928 ?auto_17930 ) ) ( not ( = ?auto_17929 ?auto_17930 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17930 ?auto_17929 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17932 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_17932 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_17932 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17933 - BLOCK
    )
    :vars
    (
      ?auto_17934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17933 ?auto_17934 ) ( CLEAR ?auto_17933 ) ( HAND-EMPTY ) ( not ( = ?auto_17933 ?auto_17934 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17933 ?auto_17934 )
      ( MAKE-1PILE ?auto_17933 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17939 - BLOCK
      ?auto_17940 - BLOCK
      ?auto_17941 - BLOCK
      ?auto_17942 - BLOCK
    )
    :vars
    (
      ?auto_17943 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17943 ?auto_17942 ) ( CLEAR ?auto_17943 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17939 ) ( ON ?auto_17940 ?auto_17939 ) ( ON ?auto_17941 ?auto_17940 ) ( ON ?auto_17942 ?auto_17941 ) ( not ( = ?auto_17939 ?auto_17940 ) ) ( not ( = ?auto_17939 ?auto_17941 ) ) ( not ( = ?auto_17939 ?auto_17942 ) ) ( not ( = ?auto_17939 ?auto_17943 ) ) ( not ( = ?auto_17940 ?auto_17941 ) ) ( not ( = ?auto_17940 ?auto_17942 ) ) ( not ( = ?auto_17940 ?auto_17943 ) ) ( not ( = ?auto_17941 ?auto_17942 ) ) ( not ( = ?auto_17941 ?auto_17943 ) ) ( not ( = ?auto_17942 ?auto_17943 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17943 ?auto_17942 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17944 - BLOCK
      ?auto_17945 - BLOCK
      ?auto_17946 - BLOCK
      ?auto_17947 - BLOCK
    )
    :vars
    (
      ?auto_17948 - BLOCK
      ?auto_17949 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17948 ?auto_17947 ) ( CLEAR ?auto_17948 ) ( ON-TABLE ?auto_17944 ) ( ON ?auto_17945 ?auto_17944 ) ( ON ?auto_17946 ?auto_17945 ) ( ON ?auto_17947 ?auto_17946 ) ( not ( = ?auto_17944 ?auto_17945 ) ) ( not ( = ?auto_17944 ?auto_17946 ) ) ( not ( = ?auto_17944 ?auto_17947 ) ) ( not ( = ?auto_17944 ?auto_17948 ) ) ( not ( = ?auto_17945 ?auto_17946 ) ) ( not ( = ?auto_17945 ?auto_17947 ) ) ( not ( = ?auto_17945 ?auto_17948 ) ) ( not ( = ?auto_17946 ?auto_17947 ) ) ( not ( = ?auto_17946 ?auto_17948 ) ) ( not ( = ?auto_17947 ?auto_17948 ) ) ( HOLDING ?auto_17949 ) ( not ( = ?auto_17944 ?auto_17949 ) ) ( not ( = ?auto_17945 ?auto_17949 ) ) ( not ( = ?auto_17946 ?auto_17949 ) ) ( not ( = ?auto_17947 ?auto_17949 ) ) ( not ( = ?auto_17948 ?auto_17949 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_17949 )
      ( MAKE-4PILE ?auto_17944 ?auto_17945 ?auto_17946 ?auto_17947 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17950 - BLOCK
      ?auto_17951 - BLOCK
      ?auto_17952 - BLOCK
      ?auto_17953 - BLOCK
    )
    :vars
    (
      ?auto_17955 - BLOCK
      ?auto_17954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17955 ?auto_17953 ) ( ON-TABLE ?auto_17950 ) ( ON ?auto_17951 ?auto_17950 ) ( ON ?auto_17952 ?auto_17951 ) ( ON ?auto_17953 ?auto_17952 ) ( not ( = ?auto_17950 ?auto_17951 ) ) ( not ( = ?auto_17950 ?auto_17952 ) ) ( not ( = ?auto_17950 ?auto_17953 ) ) ( not ( = ?auto_17950 ?auto_17955 ) ) ( not ( = ?auto_17951 ?auto_17952 ) ) ( not ( = ?auto_17951 ?auto_17953 ) ) ( not ( = ?auto_17951 ?auto_17955 ) ) ( not ( = ?auto_17952 ?auto_17953 ) ) ( not ( = ?auto_17952 ?auto_17955 ) ) ( not ( = ?auto_17953 ?auto_17955 ) ) ( not ( = ?auto_17950 ?auto_17954 ) ) ( not ( = ?auto_17951 ?auto_17954 ) ) ( not ( = ?auto_17952 ?auto_17954 ) ) ( not ( = ?auto_17953 ?auto_17954 ) ) ( not ( = ?auto_17955 ?auto_17954 ) ) ( ON ?auto_17954 ?auto_17955 ) ( CLEAR ?auto_17954 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_17950 ?auto_17951 ?auto_17952 ?auto_17953 ?auto_17955 )
      ( MAKE-4PILE ?auto_17950 ?auto_17951 ?auto_17952 ?auto_17953 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17958 - BLOCK
      ?auto_17959 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_17959 ) ( CLEAR ?auto_17958 ) ( ON-TABLE ?auto_17958 ) ( not ( = ?auto_17958 ?auto_17959 ) ) )
    :subtasks
    ( ( !STACK ?auto_17959 ?auto_17958 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17960 - BLOCK
      ?auto_17961 - BLOCK
    )
    :vars
    (
      ?auto_17962 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_17960 ) ( ON-TABLE ?auto_17960 ) ( not ( = ?auto_17960 ?auto_17961 ) ) ( ON ?auto_17961 ?auto_17962 ) ( CLEAR ?auto_17961 ) ( HAND-EMPTY ) ( not ( = ?auto_17960 ?auto_17962 ) ) ( not ( = ?auto_17961 ?auto_17962 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17961 ?auto_17962 )
      ( MAKE-2PILE ?auto_17960 ?auto_17961 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17963 - BLOCK
      ?auto_17964 - BLOCK
    )
    :vars
    (
      ?auto_17965 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17963 ?auto_17964 ) ) ( ON ?auto_17964 ?auto_17965 ) ( CLEAR ?auto_17964 ) ( not ( = ?auto_17963 ?auto_17965 ) ) ( not ( = ?auto_17964 ?auto_17965 ) ) ( HOLDING ?auto_17963 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17963 )
      ( MAKE-2PILE ?auto_17963 ?auto_17964 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17966 - BLOCK
      ?auto_17967 - BLOCK
    )
    :vars
    (
      ?auto_17968 - BLOCK
      ?auto_17970 - BLOCK
      ?auto_17971 - BLOCK
      ?auto_17969 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17966 ?auto_17967 ) ) ( ON ?auto_17967 ?auto_17968 ) ( not ( = ?auto_17966 ?auto_17968 ) ) ( not ( = ?auto_17967 ?auto_17968 ) ) ( ON ?auto_17966 ?auto_17967 ) ( CLEAR ?auto_17966 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17970 ) ( ON ?auto_17971 ?auto_17970 ) ( ON ?auto_17969 ?auto_17971 ) ( ON ?auto_17968 ?auto_17969 ) ( not ( = ?auto_17970 ?auto_17971 ) ) ( not ( = ?auto_17970 ?auto_17969 ) ) ( not ( = ?auto_17970 ?auto_17968 ) ) ( not ( = ?auto_17970 ?auto_17967 ) ) ( not ( = ?auto_17970 ?auto_17966 ) ) ( not ( = ?auto_17971 ?auto_17969 ) ) ( not ( = ?auto_17971 ?auto_17968 ) ) ( not ( = ?auto_17971 ?auto_17967 ) ) ( not ( = ?auto_17971 ?auto_17966 ) ) ( not ( = ?auto_17969 ?auto_17968 ) ) ( not ( = ?auto_17969 ?auto_17967 ) ) ( not ( = ?auto_17969 ?auto_17966 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_17970 ?auto_17971 ?auto_17969 ?auto_17968 ?auto_17967 )
      ( MAKE-2PILE ?auto_17966 ?auto_17967 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17975 - BLOCK
      ?auto_17976 - BLOCK
      ?auto_17977 - BLOCK
    )
    :vars
    (
      ?auto_17978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17978 ?auto_17977 ) ( CLEAR ?auto_17978 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17975 ) ( ON ?auto_17976 ?auto_17975 ) ( ON ?auto_17977 ?auto_17976 ) ( not ( = ?auto_17975 ?auto_17976 ) ) ( not ( = ?auto_17975 ?auto_17977 ) ) ( not ( = ?auto_17975 ?auto_17978 ) ) ( not ( = ?auto_17976 ?auto_17977 ) ) ( not ( = ?auto_17976 ?auto_17978 ) ) ( not ( = ?auto_17977 ?auto_17978 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17978 ?auto_17977 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17979 - BLOCK
      ?auto_17980 - BLOCK
      ?auto_17981 - BLOCK
    )
    :vars
    (
      ?auto_17982 - BLOCK
      ?auto_17983 - BLOCK
      ?auto_17984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17982 ?auto_17981 ) ( CLEAR ?auto_17982 ) ( ON-TABLE ?auto_17979 ) ( ON ?auto_17980 ?auto_17979 ) ( ON ?auto_17981 ?auto_17980 ) ( not ( = ?auto_17979 ?auto_17980 ) ) ( not ( = ?auto_17979 ?auto_17981 ) ) ( not ( = ?auto_17979 ?auto_17982 ) ) ( not ( = ?auto_17980 ?auto_17981 ) ) ( not ( = ?auto_17980 ?auto_17982 ) ) ( not ( = ?auto_17981 ?auto_17982 ) ) ( HOLDING ?auto_17983 ) ( CLEAR ?auto_17984 ) ( not ( = ?auto_17979 ?auto_17983 ) ) ( not ( = ?auto_17979 ?auto_17984 ) ) ( not ( = ?auto_17980 ?auto_17983 ) ) ( not ( = ?auto_17980 ?auto_17984 ) ) ( not ( = ?auto_17981 ?auto_17983 ) ) ( not ( = ?auto_17981 ?auto_17984 ) ) ( not ( = ?auto_17982 ?auto_17983 ) ) ( not ( = ?auto_17982 ?auto_17984 ) ) ( not ( = ?auto_17983 ?auto_17984 ) ) )
    :subtasks
    ( ( !STACK ?auto_17983 ?auto_17984 )
      ( MAKE-3PILE ?auto_17979 ?auto_17980 ?auto_17981 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17985 - BLOCK
      ?auto_17986 - BLOCK
      ?auto_17987 - BLOCK
    )
    :vars
    (
      ?auto_17989 - BLOCK
      ?auto_17988 - BLOCK
      ?auto_17990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17989 ?auto_17987 ) ( ON-TABLE ?auto_17985 ) ( ON ?auto_17986 ?auto_17985 ) ( ON ?auto_17987 ?auto_17986 ) ( not ( = ?auto_17985 ?auto_17986 ) ) ( not ( = ?auto_17985 ?auto_17987 ) ) ( not ( = ?auto_17985 ?auto_17989 ) ) ( not ( = ?auto_17986 ?auto_17987 ) ) ( not ( = ?auto_17986 ?auto_17989 ) ) ( not ( = ?auto_17987 ?auto_17989 ) ) ( CLEAR ?auto_17988 ) ( not ( = ?auto_17985 ?auto_17990 ) ) ( not ( = ?auto_17985 ?auto_17988 ) ) ( not ( = ?auto_17986 ?auto_17990 ) ) ( not ( = ?auto_17986 ?auto_17988 ) ) ( not ( = ?auto_17987 ?auto_17990 ) ) ( not ( = ?auto_17987 ?auto_17988 ) ) ( not ( = ?auto_17989 ?auto_17990 ) ) ( not ( = ?auto_17989 ?auto_17988 ) ) ( not ( = ?auto_17990 ?auto_17988 ) ) ( ON ?auto_17990 ?auto_17989 ) ( CLEAR ?auto_17990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17985 ?auto_17986 ?auto_17987 ?auto_17989 )
      ( MAKE-3PILE ?auto_17985 ?auto_17986 ?auto_17987 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17991 - BLOCK
      ?auto_17992 - BLOCK
      ?auto_17993 - BLOCK
    )
    :vars
    (
      ?auto_17996 - BLOCK
      ?auto_17994 - BLOCK
      ?auto_17995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17996 ?auto_17993 ) ( ON-TABLE ?auto_17991 ) ( ON ?auto_17992 ?auto_17991 ) ( ON ?auto_17993 ?auto_17992 ) ( not ( = ?auto_17991 ?auto_17992 ) ) ( not ( = ?auto_17991 ?auto_17993 ) ) ( not ( = ?auto_17991 ?auto_17996 ) ) ( not ( = ?auto_17992 ?auto_17993 ) ) ( not ( = ?auto_17992 ?auto_17996 ) ) ( not ( = ?auto_17993 ?auto_17996 ) ) ( not ( = ?auto_17991 ?auto_17994 ) ) ( not ( = ?auto_17991 ?auto_17995 ) ) ( not ( = ?auto_17992 ?auto_17994 ) ) ( not ( = ?auto_17992 ?auto_17995 ) ) ( not ( = ?auto_17993 ?auto_17994 ) ) ( not ( = ?auto_17993 ?auto_17995 ) ) ( not ( = ?auto_17996 ?auto_17994 ) ) ( not ( = ?auto_17996 ?auto_17995 ) ) ( not ( = ?auto_17994 ?auto_17995 ) ) ( ON ?auto_17994 ?auto_17996 ) ( CLEAR ?auto_17994 ) ( HOLDING ?auto_17995 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17995 )
      ( MAKE-3PILE ?auto_17991 ?auto_17992 ?auto_17993 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17997 - BLOCK
      ?auto_17998 - BLOCK
      ?auto_17999 - BLOCK
    )
    :vars
    (
      ?auto_18001 - BLOCK
      ?auto_18000 - BLOCK
      ?auto_18002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18001 ?auto_17999 ) ( ON-TABLE ?auto_17997 ) ( ON ?auto_17998 ?auto_17997 ) ( ON ?auto_17999 ?auto_17998 ) ( not ( = ?auto_17997 ?auto_17998 ) ) ( not ( = ?auto_17997 ?auto_17999 ) ) ( not ( = ?auto_17997 ?auto_18001 ) ) ( not ( = ?auto_17998 ?auto_17999 ) ) ( not ( = ?auto_17998 ?auto_18001 ) ) ( not ( = ?auto_17999 ?auto_18001 ) ) ( not ( = ?auto_17997 ?auto_18000 ) ) ( not ( = ?auto_17997 ?auto_18002 ) ) ( not ( = ?auto_17998 ?auto_18000 ) ) ( not ( = ?auto_17998 ?auto_18002 ) ) ( not ( = ?auto_17999 ?auto_18000 ) ) ( not ( = ?auto_17999 ?auto_18002 ) ) ( not ( = ?auto_18001 ?auto_18000 ) ) ( not ( = ?auto_18001 ?auto_18002 ) ) ( not ( = ?auto_18000 ?auto_18002 ) ) ( ON ?auto_18000 ?auto_18001 ) ( ON ?auto_18002 ?auto_18000 ) ( CLEAR ?auto_18002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_17997 ?auto_17998 ?auto_17999 ?auto_18001 ?auto_18000 )
      ( MAKE-3PILE ?auto_17997 ?auto_17998 ?auto_17999 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18006 - BLOCK
      ?auto_18007 - BLOCK
      ?auto_18008 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_18008 ) ( CLEAR ?auto_18007 ) ( ON-TABLE ?auto_18006 ) ( ON ?auto_18007 ?auto_18006 ) ( not ( = ?auto_18006 ?auto_18007 ) ) ( not ( = ?auto_18006 ?auto_18008 ) ) ( not ( = ?auto_18007 ?auto_18008 ) ) )
    :subtasks
    ( ( !STACK ?auto_18008 ?auto_18007 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18009 - BLOCK
      ?auto_18010 - BLOCK
      ?auto_18011 - BLOCK
    )
    :vars
    (
      ?auto_18012 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_18010 ) ( ON-TABLE ?auto_18009 ) ( ON ?auto_18010 ?auto_18009 ) ( not ( = ?auto_18009 ?auto_18010 ) ) ( not ( = ?auto_18009 ?auto_18011 ) ) ( not ( = ?auto_18010 ?auto_18011 ) ) ( ON ?auto_18011 ?auto_18012 ) ( CLEAR ?auto_18011 ) ( HAND-EMPTY ) ( not ( = ?auto_18009 ?auto_18012 ) ) ( not ( = ?auto_18010 ?auto_18012 ) ) ( not ( = ?auto_18011 ?auto_18012 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18011 ?auto_18012 )
      ( MAKE-3PILE ?auto_18009 ?auto_18010 ?auto_18011 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18013 - BLOCK
      ?auto_18014 - BLOCK
      ?auto_18015 - BLOCK
    )
    :vars
    (
      ?auto_18016 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18013 ) ( not ( = ?auto_18013 ?auto_18014 ) ) ( not ( = ?auto_18013 ?auto_18015 ) ) ( not ( = ?auto_18014 ?auto_18015 ) ) ( ON ?auto_18015 ?auto_18016 ) ( CLEAR ?auto_18015 ) ( not ( = ?auto_18013 ?auto_18016 ) ) ( not ( = ?auto_18014 ?auto_18016 ) ) ( not ( = ?auto_18015 ?auto_18016 ) ) ( HOLDING ?auto_18014 ) ( CLEAR ?auto_18013 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18013 ?auto_18014 )
      ( MAKE-3PILE ?auto_18013 ?auto_18014 ?auto_18015 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18017 - BLOCK
      ?auto_18018 - BLOCK
      ?auto_18019 - BLOCK
    )
    :vars
    (
      ?auto_18020 - BLOCK
      ?auto_18021 - BLOCK
      ?auto_18022 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18017 ) ( not ( = ?auto_18017 ?auto_18018 ) ) ( not ( = ?auto_18017 ?auto_18019 ) ) ( not ( = ?auto_18018 ?auto_18019 ) ) ( ON ?auto_18019 ?auto_18020 ) ( not ( = ?auto_18017 ?auto_18020 ) ) ( not ( = ?auto_18018 ?auto_18020 ) ) ( not ( = ?auto_18019 ?auto_18020 ) ) ( CLEAR ?auto_18017 ) ( ON ?auto_18018 ?auto_18019 ) ( CLEAR ?auto_18018 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18021 ) ( ON ?auto_18022 ?auto_18021 ) ( ON ?auto_18020 ?auto_18022 ) ( not ( = ?auto_18021 ?auto_18022 ) ) ( not ( = ?auto_18021 ?auto_18020 ) ) ( not ( = ?auto_18021 ?auto_18019 ) ) ( not ( = ?auto_18021 ?auto_18018 ) ) ( not ( = ?auto_18022 ?auto_18020 ) ) ( not ( = ?auto_18022 ?auto_18019 ) ) ( not ( = ?auto_18022 ?auto_18018 ) ) ( not ( = ?auto_18017 ?auto_18021 ) ) ( not ( = ?auto_18017 ?auto_18022 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18021 ?auto_18022 ?auto_18020 ?auto_18019 )
      ( MAKE-3PILE ?auto_18017 ?auto_18018 ?auto_18019 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18023 - BLOCK
      ?auto_18024 - BLOCK
      ?auto_18025 - BLOCK
    )
    :vars
    (
      ?auto_18026 - BLOCK
      ?auto_18028 - BLOCK
      ?auto_18027 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18023 ?auto_18024 ) ) ( not ( = ?auto_18023 ?auto_18025 ) ) ( not ( = ?auto_18024 ?auto_18025 ) ) ( ON ?auto_18025 ?auto_18026 ) ( not ( = ?auto_18023 ?auto_18026 ) ) ( not ( = ?auto_18024 ?auto_18026 ) ) ( not ( = ?auto_18025 ?auto_18026 ) ) ( ON ?auto_18024 ?auto_18025 ) ( CLEAR ?auto_18024 ) ( ON-TABLE ?auto_18028 ) ( ON ?auto_18027 ?auto_18028 ) ( ON ?auto_18026 ?auto_18027 ) ( not ( = ?auto_18028 ?auto_18027 ) ) ( not ( = ?auto_18028 ?auto_18026 ) ) ( not ( = ?auto_18028 ?auto_18025 ) ) ( not ( = ?auto_18028 ?auto_18024 ) ) ( not ( = ?auto_18027 ?auto_18026 ) ) ( not ( = ?auto_18027 ?auto_18025 ) ) ( not ( = ?auto_18027 ?auto_18024 ) ) ( not ( = ?auto_18023 ?auto_18028 ) ) ( not ( = ?auto_18023 ?auto_18027 ) ) ( HOLDING ?auto_18023 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18023 )
      ( MAKE-3PILE ?auto_18023 ?auto_18024 ?auto_18025 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18029 - BLOCK
      ?auto_18030 - BLOCK
      ?auto_18031 - BLOCK
    )
    :vars
    (
      ?auto_18034 - BLOCK
      ?auto_18033 - BLOCK
      ?auto_18032 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18029 ?auto_18030 ) ) ( not ( = ?auto_18029 ?auto_18031 ) ) ( not ( = ?auto_18030 ?auto_18031 ) ) ( ON ?auto_18031 ?auto_18034 ) ( not ( = ?auto_18029 ?auto_18034 ) ) ( not ( = ?auto_18030 ?auto_18034 ) ) ( not ( = ?auto_18031 ?auto_18034 ) ) ( ON ?auto_18030 ?auto_18031 ) ( ON-TABLE ?auto_18033 ) ( ON ?auto_18032 ?auto_18033 ) ( ON ?auto_18034 ?auto_18032 ) ( not ( = ?auto_18033 ?auto_18032 ) ) ( not ( = ?auto_18033 ?auto_18034 ) ) ( not ( = ?auto_18033 ?auto_18031 ) ) ( not ( = ?auto_18033 ?auto_18030 ) ) ( not ( = ?auto_18032 ?auto_18034 ) ) ( not ( = ?auto_18032 ?auto_18031 ) ) ( not ( = ?auto_18032 ?auto_18030 ) ) ( not ( = ?auto_18029 ?auto_18033 ) ) ( not ( = ?auto_18029 ?auto_18032 ) ) ( ON ?auto_18029 ?auto_18030 ) ( CLEAR ?auto_18029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_18033 ?auto_18032 ?auto_18034 ?auto_18031 ?auto_18030 )
      ( MAKE-3PILE ?auto_18029 ?auto_18030 ?auto_18031 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18037 - BLOCK
      ?auto_18038 - BLOCK
    )
    :vars
    (
      ?auto_18039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18039 ?auto_18038 ) ( CLEAR ?auto_18039 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18037 ) ( ON ?auto_18038 ?auto_18037 ) ( not ( = ?auto_18037 ?auto_18038 ) ) ( not ( = ?auto_18037 ?auto_18039 ) ) ( not ( = ?auto_18038 ?auto_18039 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18039 ?auto_18038 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18040 - BLOCK
      ?auto_18041 - BLOCK
    )
    :vars
    (
      ?auto_18042 - BLOCK
      ?auto_18043 - BLOCK
      ?auto_18044 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18042 ?auto_18041 ) ( CLEAR ?auto_18042 ) ( ON-TABLE ?auto_18040 ) ( ON ?auto_18041 ?auto_18040 ) ( not ( = ?auto_18040 ?auto_18041 ) ) ( not ( = ?auto_18040 ?auto_18042 ) ) ( not ( = ?auto_18041 ?auto_18042 ) ) ( HOLDING ?auto_18043 ) ( CLEAR ?auto_18044 ) ( not ( = ?auto_18040 ?auto_18043 ) ) ( not ( = ?auto_18040 ?auto_18044 ) ) ( not ( = ?auto_18041 ?auto_18043 ) ) ( not ( = ?auto_18041 ?auto_18044 ) ) ( not ( = ?auto_18042 ?auto_18043 ) ) ( not ( = ?auto_18042 ?auto_18044 ) ) ( not ( = ?auto_18043 ?auto_18044 ) ) )
    :subtasks
    ( ( !STACK ?auto_18043 ?auto_18044 )
      ( MAKE-2PILE ?auto_18040 ?auto_18041 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18045 - BLOCK
      ?auto_18046 - BLOCK
    )
    :vars
    (
      ?auto_18048 - BLOCK
      ?auto_18047 - BLOCK
      ?auto_18049 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18048 ?auto_18046 ) ( ON-TABLE ?auto_18045 ) ( ON ?auto_18046 ?auto_18045 ) ( not ( = ?auto_18045 ?auto_18046 ) ) ( not ( = ?auto_18045 ?auto_18048 ) ) ( not ( = ?auto_18046 ?auto_18048 ) ) ( CLEAR ?auto_18047 ) ( not ( = ?auto_18045 ?auto_18049 ) ) ( not ( = ?auto_18045 ?auto_18047 ) ) ( not ( = ?auto_18046 ?auto_18049 ) ) ( not ( = ?auto_18046 ?auto_18047 ) ) ( not ( = ?auto_18048 ?auto_18049 ) ) ( not ( = ?auto_18048 ?auto_18047 ) ) ( not ( = ?auto_18049 ?auto_18047 ) ) ( ON ?auto_18049 ?auto_18048 ) ( CLEAR ?auto_18049 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18045 ?auto_18046 ?auto_18048 )
      ( MAKE-2PILE ?auto_18045 ?auto_18046 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18050 - BLOCK
      ?auto_18051 - BLOCK
    )
    :vars
    (
      ?auto_18052 - BLOCK
      ?auto_18054 - BLOCK
      ?auto_18053 - BLOCK
      ?auto_18055 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18052 ?auto_18051 ) ( ON-TABLE ?auto_18050 ) ( ON ?auto_18051 ?auto_18050 ) ( not ( = ?auto_18050 ?auto_18051 ) ) ( not ( = ?auto_18050 ?auto_18052 ) ) ( not ( = ?auto_18051 ?auto_18052 ) ) ( not ( = ?auto_18050 ?auto_18054 ) ) ( not ( = ?auto_18050 ?auto_18053 ) ) ( not ( = ?auto_18051 ?auto_18054 ) ) ( not ( = ?auto_18051 ?auto_18053 ) ) ( not ( = ?auto_18052 ?auto_18054 ) ) ( not ( = ?auto_18052 ?auto_18053 ) ) ( not ( = ?auto_18054 ?auto_18053 ) ) ( ON ?auto_18054 ?auto_18052 ) ( CLEAR ?auto_18054 ) ( HOLDING ?auto_18053 ) ( CLEAR ?auto_18055 ) ( ON-TABLE ?auto_18055 ) ( not ( = ?auto_18055 ?auto_18053 ) ) ( not ( = ?auto_18050 ?auto_18055 ) ) ( not ( = ?auto_18051 ?auto_18055 ) ) ( not ( = ?auto_18052 ?auto_18055 ) ) ( not ( = ?auto_18054 ?auto_18055 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18055 ?auto_18053 )
      ( MAKE-2PILE ?auto_18050 ?auto_18051 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18056 - BLOCK
      ?auto_18057 - BLOCK
    )
    :vars
    (
      ?auto_18059 - BLOCK
      ?auto_18061 - BLOCK
      ?auto_18058 - BLOCK
      ?auto_18060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18059 ?auto_18057 ) ( ON-TABLE ?auto_18056 ) ( ON ?auto_18057 ?auto_18056 ) ( not ( = ?auto_18056 ?auto_18057 ) ) ( not ( = ?auto_18056 ?auto_18059 ) ) ( not ( = ?auto_18057 ?auto_18059 ) ) ( not ( = ?auto_18056 ?auto_18061 ) ) ( not ( = ?auto_18056 ?auto_18058 ) ) ( not ( = ?auto_18057 ?auto_18061 ) ) ( not ( = ?auto_18057 ?auto_18058 ) ) ( not ( = ?auto_18059 ?auto_18061 ) ) ( not ( = ?auto_18059 ?auto_18058 ) ) ( not ( = ?auto_18061 ?auto_18058 ) ) ( ON ?auto_18061 ?auto_18059 ) ( CLEAR ?auto_18060 ) ( ON-TABLE ?auto_18060 ) ( not ( = ?auto_18060 ?auto_18058 ) ) ( not ( = ?auto_18056 ?auto_18060 ) ) ( not ( = ?auto_18057 ?auto_18060 ) ) ( not ( = ?auto_18059 ?auto_18060 ) ) ( not ( = ?auto_18061 ?auto_18060 ) ) ( ON ?auto_18058 ?auto_18061 ) ( CLEAR ?auto_18058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18056 ?auto_18057 ?auto_18059 ?auto_18061 )
      ( MAKE-2PILE ?auto_18056 ?auto_18057 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18062 - BLOCK
      ?auto_18063 - BLOCK
    )
    :vars
    (
      ?auto_18067 - BLOCK
      ?auto_18064 - BLOCK
      ?auto_18065 - BLOCK
      ?auto_18066 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18067 ?auto_18063 ) ( ON-TABLE ?auto_18062 ) ( ON ?auto_18063 ?auto_18062 ) ( not ( = ?auto_18062 ?auto_18063 ) ) ( not ( = ?auto_18062 ?auto_18067 ) ) ( not ( = ?auto_18063 ?auto_18067 ) ) ( not ( = ?auto_18062 ?auto_18064 ) ) ( not ( = ?auto_18062 ?auto_18065 ) ) ( not ( = ?auto_18063 ?auto_18064 ) ) ( not ( = ?auto_18063 ?auto_18065 ) ) ( not ( = ?auto_18067 ?auto_18064 ) ) ( not ( = ?auto_18067 ?auto_18065 ) ) ( not ( = ?auto_18064 ?auto_18065 ) ) ( ON ?auto_18064 ?auto_18067 ) ( not ( = ?auto_18066 ?auto_18065 ) ) ( not ( = ?auto_18062 ?auto_18066 ) ) ( not ( = ?auto_18063 ?auto_18066 ) ) ( not ( = ?auto_18067 ?auto_18066 ) ) ( not ( = ?auto_18064 ?auto_18066 ) ) ( ON ?auto_18065 ?auto_18064 ) ( CLEAR ?auto_18065 ) ( HOLDING ?auto_18066 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18066 )
      ( MAKE-2PILE ?auto_18062 ?auto_18063 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18068 - BLOCK
      ?auto_18069 - BLOCK
    )
    :vars
    (
      ?auto_18071 - BLOCK
      ?auto_18072 - BLOCK
      ?auto_18070 - BLOCK
      ?auto_18073 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18071 ?auto_18069 ) ( ON-TABLE ?auto_18068 ) ( ON ?auto_18069 ?auto_18068 ) ( not ( = ?auto_18068 ?auto_18069 ) ) ( not ( = ?auto_18068 ?auto_18071 ) ) ( not ( = ?auto_18069 ?auto_18071 ) ) ( not ( = ?auto_18068 ?auto_18072 ) ) ( not ( = ?auto_18068 ?auto_18070 ) ) ( not ( = ?auto_18069 ?auto_18072 ) ) ( not ( = ?auto_18069 ?auto_18070 ) ) ( not ( = ?auto_18071 ?auto_18072 ) ) ( not ( = ?auto_18071 ?auto_18070 ) ) ( not ( = ?auto_18072 ?auto_18070 ) ) ( ON ?auto_18072 ?auto_18071 ) ( not ( = ?auto_18073 ?auto_18070 ) ) ( not ( = ?auto_18068 ?auto_18073 ) ) ( not ( = ?auto_18069 ?auto_18073 ) ) ( not ( = ?auto_18071 ?auto_18073 ) ) ( not ( = ?auto_18072 ?auto_18073 ) ) ( ON ?auto_18070 ?auto_18072 ) ( ON ?auto_18073 ?auto_18070 ) ( CLEAR ?auto_18073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_18068 ?auto_18069 ?auto_18071 ?auto_18072 ?auto_18070 )
      ( MAKE-2PILE ?auto_18068 ?auto_18069 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18078 - BLOCK
      ?auto_18079 - BLOCK
      ?auto_18080 - BLOCK
      ?auto_18081 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_18081 ) ( CLEAR ?auto_18080 ) ( ON-TABLE ?auto_18078 ) ( ON ?auto_18079 ?auto_18078 ) ( ON ?auto_18080 ?auto_18079 ) ( not ( = ?auto_18078 ?auto_18079 ) ) ( not ( = ?auto_18078 ?auto_18080 ) ) ( not ( = ?auto_18078 ?auto_18081 ) ) ( not ( = ?auto_18079 ?auto_18080 ) ) ( not ( = ?auto_18079 ?auto_18081 ) ) ( not ( = ?auto_18080 ?auto_18081 ) ) )
    :subtasks
    ( ( !STACK ?auto_18081 ?auto_18080 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18082 - BLOCK
      ?auto_18083 - BLOCK
      ?auto_18084 - BLOCK
      ?auto_18085 - BLOCK
    )
    :vars
    (
      ?auto_18086 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_18084 ) ( ON-TABLE ?auto_18082 ) ( ON ?auto_18083 ?auto_18082 ) ( ON ?auto_18084 ?auto_18083 ) ( not ( = ?auto_18082 ?auto_18083 ) ) ( not ( = ?auto_18082 ?auto_18084 ) ) ( not ( = ?auto_18082 ?auto_18085 ) ) ( not ( = ?auto_18083 ?auto_18084 ) ) ( not ( = ?auto_18083 ?auto_18085 ) ) ( not ( = ?auto_18084 ?auto_18085 ) ) ( ON ?auto_18085 ?auto_18086 ) ( CLEAR ?auto_18085 ) ( HAND-EMPTY ) ( not ( = ?auto_18082 ?auto_18086 ) ) ( not ( = ?auto_18083 ?auto_18086 ) ) ( not ( = ?auto_18084 ?auto_18086 ) ) ( not ( = ?auto_18085 ?auto_18086 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18085 ?auto_18086 )
      ( MAKE-4PILE ?auto_18082 ?auto_18083 ?auto_18084 ?auto_18085 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18087 - BLOCK
      ?auto_18088 - BLOCK
      ?auto_18089 - BLOCK
      ?auto_18090 - BLOCK
    )
    :vars
    (
      ?auto_18091 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18087 ) ( ON ?auto_18088 ?auto_18087 ) ( not ( = ?auto_18087 ?auto_18088 ) ) ( not ( = ?auto_18087 ?auto_18089 ) ) ( not ( = ?auto_18087 ?auto_18090 ) ) ( not ( = ?auto_18088 ?auto_18089 ) ) ( not ( = ?auto_18088 ?auto_18090 ) ) ( not ( = ?auto_18089 ?auto_18090 ) ) ( ON ?auto_18090 ?auto_18091 ) ( CLEAR ?auto_18090 ) ( not ( = ?auto_18087 ?auto_18091 ) ) ( not ( = ?auto_18088 ?auto_18091 ) ) ( not ( = ?auto_18089 ?auto_18091 ) ) ( not ( = ?auto_18090 ?auto_18091 ) ) ( HOLDING ?auto_18089 ) ( CLEAR ?auto_18088 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18087 ?auto_18088 ?auto_18089 )
      ( MAKE-4PILE ?auto_18087 ?auto_18088 ?auto_18089 ?auto_18090 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18092 - BLOCK
      ?auto_18093 - BLOCK
      ?auto_18094 - BLOCK
      ?auto_18095 - BLOCK
    )
    :vars
    (
      ?auto_18096 - BLOCK
      ?auto_18097 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18092 ) ( ON ?auto_18093 ?auto_18092 ) ( not ( = ?auto_18092 ?auto_18093 ) ) ( not ( = ?auto_18092 ?auto_18094 ) ) ( not ( = ?auto_18092 ?auto_18095 ) ) ( not ( = ?auto_18093 ?auto_18094 ) ) ( not ( = ?auto_18093 ?auto_18095 ) ) ( not ( = ?auto_18094 ?auto_18095 ) ) ( ON ?auto_18095 ?auto_18096 ) ( not ( = ?auto_18092 ?auto_18096 ) ) ( not ( = ?auto_18093 ?auto_18096 ) ) ( not ( = ?auto_18094 ?auto_18096 ) ) ( not ( = ?auto_18095 ?auto_18096 ) ) ( CLEAR ?auto_18093 ) ( ON ?auto_18094 ?auto_18095 ) ( CLEAR ?auto_18094 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18097 ) ( ON ?auto_18096 ?auto_18097 ) ( not ( = ?auto_18097 ?auto_18096 ) ) ( not ( = ?auto_18097 ?auto_18095 ) ) ( not ( = ?auto_18097 ?auto_18094 ) ) ( not ( = ?auto_18092 ?auto_18097 ) ) ( not ( = ?auto_18093 ?auto_18097 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18097 ?auto_18096 ?auto_18095 )
      ( MAKE-4PILE ?auto_18092 ?auto_18093 ?auto_18094 ?auto_18095 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18098 - BLOCK
      ?auto_18099 - BLOCK
      ?auto_18100 - BLOCK
      ?auto_18101 - BLOCK
    )
    :vars
    (
      ?auto_18103 - BLOCK
      ?auto_18102 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18098 ) ( not ( = ?auto_18098 ?auto_18099 ) ) ( not ( = ?auto_18098 ?auto_18100 ) ) ( not ( = ?auto_18098 ?auto_18101 ) ) ( not ( = ?auto_18099 ?auto_18100 ) ) ( not ( = ?auto_18099 ?auto_18101 ) ) ( not ( = ?auto_18100 ?auto_18101 ) ) ( ON ?auto_18101 ?auto_18103 ) ( not ( = ?auto_18098 ?auto_18103 ) ) ( not ( = ?auto_18099 ?auto_18103 ) ) ( not ( = ?auto_18100 ?auto_18103 ) ) ( not ( = ?auto_18101 ?auto_18103 ) ) ( ON ?auto_18100 ?auto_18101 ) ( CLEAR ?auto_18100 ) ( ON-TABLE ?auto_18102 ) ( ON ?auto_18103 ?auto_18102 ) ( not ( = ?auto_18102 ?auto_18103 ) ) ( not ( = ?auto_18102 ?auto_18101 ) ) ( not ( = ?auto_18102 ?auto_18100 ) ) ( not ( = ?auto_18098 ?auto_18102 ) ) ( not ( = ?auto_18099 ?auto_18102 ) ) ( HOLDING ?auto_18099 ) ( CLEAR ?auto_18098 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18098 ?auto_18099 )
      ( MAKE-4PILE ?auto_18098 ?auto_18099 ?auto_18100 ?auto_18101 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18104 - BLOCK
      ?auto_18105 - BLOCK
      ?auto_18106 - BLOCK
      ?auto_18107 - BLOCK
    )
    :vars
    (
      ?auto_18109 - BLOCK
      ?auto_18108 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18104 ) ( not ( = ?auto_18104 ?auto_18105 ) ) ( not ( = ?auto_18104 ?auto_18106 ) ) ( not ( = ?auto_18104 ?auto_18107 ) ) ( not ( = ?auto_18105 ?auto_18106 ) ) ( not ( = ?auto_18105 ?auto_18107 ) ) ( not ( = ?auto_18106 ?auto_18107 ) ) ( ON ?auto_18107 ?auto_18109 ) ( not ( = ?auto_18104 ?auto_18109 ) ) ( not ( = ?auto_18105 ?auto_18109 ) ) ( not ( = ?auto_18106 ?auto_18109 ) ) ( not ( = ?auto_18107 ?auto_18109 ) ) ( ON ?auto_18106 ?auto_18107 ) ( ON-TABLE ?auto_18108 ) ( ON ?auto_18109 ?auto_18108 ) ( not ( = ?auto_18108 ?auto_18109 ) ) ( not ( = ?auto_18108 ?auto_18107 ) ) ( not ( = ?auto_18108 ?auto_18106 ) ) ( not ( = ?auto_18104 ?auto_18108 ) ) ( not ( = ?auto_18105 ?auto_18108 ) ) ( CLEAR ?auto_18104 ) ( ON ?auto_18105 ?auto_18106 ) ( CLEAR ?auto_18105 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18108 ?auto_18109 ?auto_18107 ?auto_18106 )
      ( MAKE-4PILE ?auto_18104 ?auto_18105 ?auto_18106 ?auto_18107 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18110 - BLOCK
      ?auto_18111 - BLOCK
      ?auto_18112 - BLOCK
      ?auto_18113 - BLOCK
    )
    :vars
    (
      ?auto_18114 - BLOCK
      ?auto_18115 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18110 ?auto_18111 ) ) ( not ( = ?auto_18110 ?auto_18112 ) ) ( not ( = ?auto_18110 ?auto_18113 ) ) ( not ( = ?auto_18111 ?auto_18112 ) ) ( not ( = ?auto_18111 ?auto_18113 ) ) ( not ( = ?auto_18112 ?auto_18113 ) ) ( ON ?auto_18113 ?auto_18114 ) ( not ( = ?auto_18110 ?auto_18114 ) ) ( not ( = ?auto_18111 ?auto_18114 ) ) ( not ( = ?auto_18112 ?auto_18114 ) ) ( not ( = ?auto_18113 ?auto_18114 ) ) ( ON ?auto_18112 ?auto_18113 ) ( ON-TABLE ?auto_18115 ) ( ON ?auto_18114 ?auto_18115 ) ( not ( = ?auto_18115 ?auto_18114 ) ) ( not ( = ?auto_18115 ?auto_18113 ) ) ( not ( = ?auto_18115 ?auto_18112 ) ) ( not ( = ?auto_18110 ?auto_18115 ) ) ( not ( = ?auto_18111 ?auto_18115 ) ) ( ON ?auto_18111 ?auto_18112 ) ( CLEAR ?auto_18111 ) ( HOLDING ?auto_18110 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18110 )
      ( MAKE-4PILE ?auto_18110 ?auto_18111 ?auto_18112 ?auto_18113 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18116 - BLOCK
      ?auto_18117 - BLOCK
      ?auto_18118 - BLOCK
      ?auto_18119 - BLOCK
    )
    :vars
    (
      ?auto_18121 - BLOCK
      ?auto_18120 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18116 ?auto_18117 ) ) ( not ( = ?auto_18116 ?auto_18118 ) ) ( not ( = ?auto_18116 ?auto_18119 ) ) ( not ( = ?auto_18117 ?auto_18118 ) ) ( not ( = ?auto_18117 ?auto_18119 ) ) ( not ( = ?auto_18118 ?auto_18119 ) ) ( ON ?auto_18119 ?auto_18121 ) ( not ( = ?auto_18116 ?auto_18121 ) ) ( not ( = ?auto_18117 ?auto_18121 ) ) ( not ( = ?auto_18118 ?auto_18121 ) ) ( not ( = ?auto_18119 ?auto_18121 ) ) ( ON ?auto_18118 ?auto_18119 ) ( ON-TABLE ?auto_18120 ) ( ON ?auto_18121 ?auto_18120 ) ( not ( = ?auto_18120 ?auto_18121 ) ) ( not ( = ?auto_18120 ?auto_18119 ) ) ( not ( = ?auto_18120 ?auto_18118 ) ) ( not ( = ?auto_18116 ?auto_18120 ) ) ( not ( = ?auto_18117 ?auto_18120 ) ) ( ON ?auto_18117 ?auto_18118 ) ( ON ?auto_18116 ?auto_18117 ) ( CLEAR ?auto_18116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_18120 ?auto_18121 ?auto_18119 ?auto_18118 ?auto_18117 )
      ( MAKE-4PILE ?auto_18116 ?auto_18117 ?auto_18118 ?auto_18119 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18123 - BLOCK
    )
    :vars
    (
      ?auto_18124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18124 ?auto_18123 ) ( CLEAR ?auto_18124 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18123 ) ( not ( = ?auto_18123 ?auto_18124 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18124 ?auto_18123 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18125 - BLOCK
    )
    :vars
    (
      ?auto_18126 - BLOCK
      ?auto_18127 - BLOCK
      ?auto_18128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18126 ?auto_18125 ) ( CLEAR ?auto_18126 ) ( ON-TABLE ?auto_18125 ) ( not ( = ?auto_18125 ?auto_18126 ) ) ( HOLDING ?auto_18127 ) ( CLEAR ?auto_18128 ) ( not ( = ?auto_18125 ?auto_18127 ) ) ( not ( = ?auto_18125 ?auto_18128 ) ) ( not ( = ?auto_18126 ?auto_18127 ) ) ( not ( = ?auto_18126 ?auto_18128 ) ) ( not ( = ?auto_18127 ?auto_18128 ) ) )
    :subtasks
    ( ( !STACK ?auto_18127 ?auto_18128 )
      ( MAKE-1PILE ?auto_18125 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18129 - BLOCK
    )
    :vars
    (
      ?auto_18130 - BLOCK
      ?auto_18132 - BLOCK
      ?auto_18131 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18130 ?auto_18129 ) ( ON-TABLE ?auto_18129 ) ( not ( = ?auto_18129 ?auto_18130 ) ) ( CLEAR ?auto_18132 ) ( not ( = ?auto_18129 ?auto_18131 ) ) ( not ( = ?auto_18129 ?auto_18132 ) ) ( not ( = ?auto_18130 ?auto_18131 ) ) ( not ( = ?auto_18130 ?auto_18132 ) ) ( not ( = ?auto_18131 ?auto_18132 ) ) ( ON ?auto_18131 ?auto_18130 ) ( CLEAR ?auto_18131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18129 ?auto_18130 )
      ( MAKE-1PILE ?auto_18129 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18133 - BLOCK
    )
    :vars
    (
      ?auto_18134 - BLOCK
      ?auto_18136 - BLOCK
      ?auto_18135 - BLOCK
      ?auto_18138 - BLOCK
      ?auto_18137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18134 ?auto_18133 ) ( ON-TABLE ?auto_18133 ) ( not ( = ?auto_18133 ?auto_18134 ) ) ( not ( = ?auto_18133 ?auto_18136 ) ) ( not ( = ?auto_18133 ?auto_18135 ) ) ( not ( = ?auto_18134 ?auto_18136 ) ) ( not ( = ?auto_18134 ?auto_18135 ) ) ( not ( = ?auto_18136 ?auto_18135 ) ) ( ON ?auto_18136 ?auto_18134 ) ( CLEAR ?auto_18136 ) ( HOLDING ?auto_18135 ) ( CLEAR ?auto_18138 ) ( ON-TABLE ?auto_18137 ) ( ON ?auto_18138 ?auto_18137 ) ( not ( = ?auto_18137 ?auto_18138 ) ) ( not ( = ?auto_18137 ?auto_18135 ) ) ( not ( = ?auto_18138 ?auto_18135 ) ) ( not ( = ?auto_18133 ?auto_18138 ) ) ( not ( = ?auto_18133 ?auto_18137 ) ) ( not ( = ?auto_18134 ?auto_18138 ) ) ( not ( = ?auto_18134 ?auto_18137 ) ) ( not ( = ?auto_18136 ?auto_18138 ) ) ( not ( = ?auto_18136 ?auto_18137 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18137 ?auto_18138 ?auto_18135 )
      ( MAKE-1PILE ?auto_18133 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18139 - BLOCK
    )
    :vars
    (
      ?auto_18140 - BLOCK
      ?auto_18143 - BLOCK
      ?auto_18144 - BLOCK
      ?auto_18142 - BLOCK
      ?auto_18141 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18140 ?auto_18139 ) ( ON-TABLE ?auto_18139 ) ( not ( = ?auto_18139 ?auto_18140 ) ) ( not ( = ?auto_18139 ?auto_18143 ) ) ( not ( = ?auto_18139 ?auto_18144 ) ) ( not ( = ?auto_18140 ?auto_18143 ) ) ( not ( = ?auto_18140 ?auto_18144 ) ) ( not ( = ?auto_18143 ?auto_18144 ) ) ( ON ?auto_18143 ?auto_18140 ) ( CLEAR ?auto_18142 ) ( ON-TABLE ?auto_18141 ) ( ON ?auto_18142 ?auto_18141 ) ( not ( = ?auto_18141 ?auto_18142 ) ) ( not ( = ?auto_18141 ?auto_18144 ) ) ( not ( = ?auto_18142 ?auto_18144 ) ) ( not ( = ?auto_18139 ?auto_18142 ) ) ( not ( = ?auto_18139 ?auto_18141 ) ) ( not ( = ?auto_18140 ?auto_18142 ) ) ( not ( = ?auto_18140 ?auto_18141 ) ) ( not ( = ?auto_18143 ?auto_18142 ) ) ( not ( = ?auto_18143 ?auto_18141 ) ) ( ON ?auto_18144 ?auto_18143 ) ( CLEAR ?auto_18144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18139 ?auto_18140 ?auto_18143 )
      ( MAKE-1PILE ?auto_18139 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18145 - BLOCK
    )
    :vars
    (
      ?auto_18149 - BLOCK
      ?auto_18146 - BLOCK
      ?auto_18150 - BLOCK
      ?auto_18148 - BLOCK
      ?auto_18147 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18149 ?auto_18145 ) ( ON-TABLE ?auto_18145 ) ( not ( = ?auto_18145 ?auto_18149 ) ) ( not ( = ?auto_18145 ?auto_18146 ) ) ( not ( = ?auto_18145 ?auto_18150 ) ) ( not ( = ?auto_18149 ?auto_18146 ) ) ( not ( = ?auto_18149 ?auto_18150 ) ) ( not ( = ?auto_18146 ?auto_18150 ) ) ( ON ?auto_18146 ?auto_18149 ) ( ON-TABLE ?auto_18148 ) ( not ( = ?auto_18148 ?auto_18147 ) ) ( not ( = ?auto_18148 ?auto_18150 ) ) ( not ( = ?auto_18147 ?auto_18150 ) ) ( not ( = ?auto_18145 ?auto_18147 ) ) ( not ( = ?auto_18145 ?auto_18148 ) ) ( not ( = ?auto_18149 ?auto_18147 ) ) ( not ( = ?auto_18149 ?auto_18148 ) ) ( not ( = ?auto_18146 ?auto_18147 ) ) ( not ( = ?auto_18146 ?auto_18148 ) ) ( ON ?auto_18150 ?auto_18146 ) ( CLEAR ?auto_18150 ) ( HOLDING ?auto_18147 ) ( CLEAR ?auto_18148 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18148 ?auto_18147 )
      ( MAKE-1PILE ?auto_18145 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18151 - BLOCK
    )
    :vars
    (
      ?auto_18155 - BLOCK
      ?auto_18152 - BLOCK
      ?auto_18153 - BLOCK
      ?auto_18154 - BLOCK
      ?auto_18156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18155 ?auto_18151 ) ( ON-TABLE ?auto_18151 ) ( not ( = ?auto_18151 ?auto_18155 ) ) ( not ( = ?auto_18151 ?auto_18152 ) ) ( not ( = ?auto_18151 ?auto_18153 ) ) ( not ( = ?auto_18155 ?auto_18152 ) ) ( not ( = ?auto_18155 ?auto_18153 ) ) ( not ( = ?auto_18152 ?auto_18153 ) ) ( ON ?auto_18152 ?auto_18155 ) ( ON-TABLE ?auto_18154 ) ( not ( = ?auto_18154 ?auto_18156 ) ) ( not ( = ?auto_18154 ?auto_18153 ) ) ( not ( = ?auto_18156 ?auto_18153 ) ) ( not ( = ?auto_18151 ?auto_18156 ) ) ( not ( = ?auto_18151 ?auto_18154 ) ) ( not ( = ?auto_18155 ?auto_18156 ) ) ( not ( = ?auto_18155 ?auto_18154 ) ) ( not ( = ?auto_18152 ?auto_18156 ) ) ( not ( = ?auto_18152 ?auto_18154 ) ) ( ON ?auto_18153 ?auto_18152 ) ( CLEAR ?auto_18154 ) ( ON ?auto_18156 ?auto_18153 ) ( CLEAR ?auto_18156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18151 ?auto_18155 ?auto_18152 ?auto_18153 )
      ( MAKE-1PILE ?auto_18151 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18157 - BLOCK
    )
    :vars
    (
      ?auto_18160 - BLOCK
      ?auto_18162 - BLOCK
      ?auto_18161 - BLOCK
      ?auto_18158 - BLOCK
      ?auto_18159 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18160 ?auto_18157 ) ( ON-TABLE ?auto_18157 ) ( not ( = ?auto_18157 ?auto_18160 ) ) ( not ( = ?auto_18157 ?auto_18162 ) ) ( not ( = ?auto_18157 ?auto_18161 ) ) ( not ( = ?auto_18160 ?auto_18162 ) ) ( not ( = ?auto_18160 ?auto_18161 ) ) ( not ( = ?auto_18162 ?auto_18161 ) ) ( ON ?auto_18162 ?auto_18160 ) ( not ( = ?auto_18158 ?auto_18159 ) ) ( not ( = ?auto_18158 ?auto_18161 ) ) ( not ( = ?auto_18159 ?auto_18161 ) ) ( not ( = ?auto_18157 ?auto_18159 ) ) ( not ( = ?auto_18157 ?auto_18158 ) ) ( not ( = ?auto_18160 ?auto_18159 ) ) ( not ( = ?auto_18160 ?auto_18158 ) ) ( not ( = ?auto_18162 ?auto_18159 ) ) ( not ( = ?auto_18162 ?auto_18158 ) ) ( ON ?auto_18161 ?auto_18162 ) ( ON ?auto_18159 ?auto_18161 ) ( CLEAR ?auto_18159 ) ( HOLDING ?auto_18158 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18158 )
      ( MAKE-1PILE ?auto_18157 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18163 - BLOCK
    )
    :vars
    (
      ?auto_18166 - BLOCK
      ?auto_18167 - BLOCK
      ?auto_18165 - BLOCK
      ?auto_18168 - BLOCK
      ?auto_18164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18166 ?auto_18163 ) ( ON-TABLE ?auto_18163 ) ( not ( = ?auto_18163 ?auto_18166 ) ) ( not ( = ?auto_18163 ?auto_18167 ) ) ( not ( = ?auto_18163 ?auto_18165 ) ) ( not ( = ?auto_18166 ?auto_18167 ) ) ( not ( = ?auto_18166 ?auto_18165 ) ) ( not ( = ?auto_18167 ?auto_18165 ) ) ( ON ?auto_18167 ?auto_18166 ) ( not ( = ?auto_18168 ?auto_18164 ) ) ( not ( = ?auto_18168 ?auto_18165 ) ) ( not ( = ?auto_18164 ?auto_18165 ) ) ( not ( = ?auto_18163 ?auto_18164 ) ) ( not ( = ?auto_18163 ?auto_18168 ) ) ( not ( = ?auto_18166 ?auto_18164 ) ) ( not ( = ?auto_18166 ?auto_18168 ) ) ( not ( = ?auto_18167 ?auto_18164 ) ) ( not ( = ?auto_18167 ?auto_18168 ) ) ( ON ?auto_18165 ?auto_18167 ) ( ON ?auto_18164 ?auto_18165 ) ( ON ?auto_18168 ?auto_18164 ) ( CLEAR ?auto_18168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_18163 ?auto_18166 ?auto_18167 ?auto_18165 ?auto_18164 )
      ( MAKE-1PILE ?auto_18163 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18174 - BLOCK
      ?auto_18175 - BLOCK
      ?auto_18176 - BLOCK
      ?auto_18177 - BLOCK
      ?auto_18178 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_18178 ) ( CLEAR ?auto_18177 ) ( ON-TABLE ?auto_18174 ) ( ON ?auto_18175 ?auto_18174 ) ( ON ?auto_18176 ?auto_18175 ) ( ON ?auto_18177 ?auto_18176 ) ( not ( = ?auto_18174 ?auto_18175 ) ) ( not ( = ?auto_18174 ?auto_18176 ) ) ( not ( = ?auto_18174 ?auto_18177 ) ) ( not ( = ?auto_18174 ?auto_18178 ) ) ( not ( = ?auto_18175 ?auto_18176 ) ) ( not ( = ?auto_18175 ?auto_18177 ) ) ( not ( = ?auto_18175 ?auto_18178 ) ) ( not ( = ?auto_18176 ?auto_18177 ) ) ( not ( = ?auto_18176 ?auto_18178 ) ) ( not ( = ?auto_18177 ?auto_18178 ) ) )
    :subtasks
    ( ( !STACK ?auto_18178 ?auto_18177 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18179 - BLOCK
      ?auto_18180 - BLOCK
      ?auto_18181 - BLOCK
      ?auto_18182 - BLOCK
      ?auto_18183 - BLOCK
    )
    :vars
    (
      ?auto_18184 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_18182 ) ( ON-TABLE ?auto_18179 ) ( ON ?auto_18180 ?auto_18179 ) ( ON ?auto_18181 ?auto_18180 ) ( ON ?auto_18182 ?auto_18181 ) ( not ( = ?auto_18179 ?auto_18180 ) ) ( not ( = ?auto_18179 ?auto_18181 ) ) ( not ( = ?auto_18179 ?auto_18182 ) ) ( not ( = ?auto_18179 ?auto_18183 ) ) ( not ( = ?auto_18180 ?auto_18181 ) ) ( not ( = ?auto_18180 ?auto_18182 ) ) ( not ( = ?auto_18180 ?auto_18183 ) ) ( not ( = ?auto_18181 ?auto_18182 ) ) ( not ( = ?auto_18181 ?auto_18183 ) ) ( not ( = ?auto_18182 ?auto_18183 ) ) ( ON ?auto_18183 ?auto_18184 ) ( CLEAR ?auto_18183 ) ( HAND-EMPTY ) ( not ( = ?auto_18179 ?auto_18184 ) ) ( not ( = ?auto_18180 ?auto_18184 ) ) ( not ( = ?auto_18181 ?auto_18184 ) ) ( not ( = ?auto_18182 ?auto_18184 ) ) ( not ( = ?auto_18183 ?auto_18184 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18183 ?auto_18184 )
      ( MAKE-5PILE ?auto_18179 ?auto_18180 ?auto_18181 ?auto_18182 ?auto_18183 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18185 - BLOCK
      ?auto_18186 - BLOCK
      ?auto_18187 - BLOCK
      ?auto_18188 - BLOCK
      ?auto_18189 - BLOCK
    )
    :vars
    (
      ?auto_18190 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18185 ) ( ON ?auto_18186 ?auto_18185 ) ( ON ?auto_18187 ?auto_18186 ) ( not ( = ?auto_18185 ?auto_18186 ) ) ( not ( = ?auto_18185 ?auto_18187 ) ) ( not ( = ?auto_18185 ?auto_18188 ) ) ( not ( = ?auto_18185 ?auto_18189 ) ) ( not ( = ?auto_18186 ?auto_18187 ) ) ( not ( = ?auto_18186 ?auto_18188 ) ) ( not ( = ?auto_18186 ?auto_18189 ) ) ( not ( = ?auto_18187 ?auto_18188 ) ) ( not ( = ?auto_18187 ?auto_18189 ) ) ( not ( = ?auto_18188 ?auto_18189 ) ) ( ON ?auto_18189 ?auto_18190 ) ( CLEAR ?auto_18189 ) ( not ( = ?auto_18185 ?auto_18190 ) ) ( not ( = ?auto_18186 ?auto_18190 ) ) ( not ( = ?auto_18187 ?auto_18190 ) ) ( not ( = ?auto_18188 ?auto_18190 ) ) ( not ( = ?auto_18189 ?auto_18190 ) ) ( HOLDING ?auto_18188 ) ( CLEAR ?auto_18187 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18185 ?auto_18186 ?auto_18187 ?auto_18188 )
      ( MAKE-5PILE ?auto_18185 ?auto_18186 ?auto_18187 ?auto_18188 ?auto_18189 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18191 - BLOCK
      ?auto_18192 - BLOCK
      ?auto_18193 - BLOCK
      ?auto_18194 - BLOCK
      ?auto_18195 - BLOCK
    )
    :vars
    (
      ?auto_18196 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18191 ) ( ON ?auto_18192 ?auto_18191 ) ( ON ?auto_18193 ?auto_18192 ) ( not ( = ?auto_18191 ?auto_18192 ) ) ( not ( = ?auto_18191 ?auto_18193 ) ) ( not ( = ?auto_18191 ?auto_18194 ) ) ( not ( = ?auto_18191 ?auto_18195 ) ) ( not ( = ?auto_18192 ?auto_18193 ) ) ( not ( = ?auto_18192 ?auto_18194 ) ) ( not ( = ?auto_18192 ?auto_18195 ) ) ( not ( = ?auto_18193 ?auto_18194 ) ) ( not ( = ?auto_18193 ?auto_18195 ) ) ( not ( = ?auto_18194 ?auto_18195 ) ) ( ON ?auto_18195 ?auto_18196 ) ( not ( = ?auto_18191 ?auto_18196 ) ) ( not ( = ?auto_18192 ?auto_18196 ) ) ( not ( = ?auto_18193 ?auto_18196 ) ) ( not ( = ?auto_18194 ?auto_18196 ) ) ( not ( = ?auto_18195 ?auto_18196 ) ) ( CLEAR ?auto_18193 ) ( ON ?auto_18194 ?auto_18195 ) ( CLEAR ?auto_18194 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18196 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18196 ?auto_18195 )
      ( MAKE-5PILE ?auto_18191 ?auto_18192 ?auto_18193 ?auto_18194 ?auto_18195 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18197 - BLOCK
      ?auto_18198 - BLOCK
      ?auto_18199 - BLOCK
      ?auto_18200 - BLOCK
      ?auto_18201 - BLOCK
    )
    :vars
    (
      ?auto_18202 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18197 ) ( ON ?auto_18198 ?auto_18197 ) ( not ( = ?auto_18197 ?auto_18198 ) ) ( not ( = ?auto_18197 ?auto_18199 ) ) ( not ( = ?auto_18197 ?auto_18200 ) ) ( not ( = ?auto_18197 ?auto_18201 ) ) ( not ( = ?auto_18198 ?auto_18199 ) ) ( not ( = ?auto_18198 ?auto_18200 ) ) ( not ( = ?auto_18198 ?auto_18201 ) ) ( not ( = ?auto_18199 ?auto_18200 ) ) ( not ( = ?auto_18199 ?auto_18201 ) ) ( not ( = ?auto_18200 ?auto_18201 ) ) ( ON ?auto_18201 ?auto_18202 ) ( not ( = ?auto_18197 ?auto_18202 ) ) ( not ( = ?auto_18198 ?auto_18202 ) ) ( not ( = ?auto_18199 ?auto_18202 ) ) ( not ( = ?auto_18200 ?auto_18202 ) ) ( not ( = ?auto_18201 ?auto_18202 ) ) ( ON ?auto_18200 ?auto_18201 ) ( CLEAR ?auto_18200 ) ( ON-TABLE ?auto_18202 ) ( HOLDING ?auto_18199 ) ( CLEAR ?auto_18198 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18197 ?auto_18198 ?auto_18199 )
      ( MAKE-5PILE ?auto_18197 ?auto_18198 ?auto_18199 ?auto_18200 ?auto_18201 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18203 - BLOCK
      ?auto_18204 - BLOCK
      ?auto_18205 - BLOCK
      ?auto_18206 - BLOCK
      ?auto_18207 - BLOCK
    )
    :vars
    (
      ?auto_18208 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18203 ) ( ON ?auto_18204 ?auto_18203 ) ( not ( = ?auto_18203 ?auto_18204 ) ) ( not ( = ?auto_18203 ?auto_18205 ) ) ( not ( = ?auto_18203 ?auto_18206 ) ) ( not ( = ?auto_18203 ?auto_18207 ) ) ( not ( = ?auto_18204 ?auto_18205 ) ) ( not ( = ?auto_18204 ?auto_18206 ) ) ( not ( = ?auto_18204 ?auto_18207 ) ) ( not ( = ?auto_18205 ?auto_18206 ) ) ( not ( = ?auto_18205 ?auto_18207 ) ) ( not ( = ?auto_18206 ?auto_18207 ) ) ( ON ?auto_18207 ?auto_18208 ) ( not ( = ?auto_18203 ?auto_18208 ) ) ( not ( = ?auto_18204 ?auto_18208 ) ) ( not ( = ?auto_18205 ?auto_18208 ) ) ( not ( = ?auto_18206 ?auto_18208 ) ) ( not ( = ?auto_18207 ?auto_18208 ) ) ( ON ?auto_18206 ?auto_18207 ) ( ON-TABLE ?auto_18208 ) ( CLEAR ?auto_18204 ) ( ON ?auto_18205 ?auto_18206 ) ( CLEAR ?auto_18205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18208 ?auto_18207 ?auto_18206 )
      ( MAKE-5PILE ?auto_18203 ?auto_18204 ?auto_18205 ?auto_18206 ?auto_18207 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18209 - BLOCK
      ?auto_18210 - BLOCK
      ?auto_18211 - BLOCK
      ?auto_18212 - BLOCK
      ?auto_18213 - BLOCK
    )
    :vars
    (
      ?auto_18214 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18209 ) ( not ( = ?auto_18209 ?auto_18210 ) ) ( not ( = ?auto_18209 ?auto_18211 ) ) ( not ( = ?auto_18209 ?auto_18212 ) ) ( not ( = ?auto_18209 ?auto_18213 ) ) ( not ( = ?auto_18210 ?auto_18211 ) ) ( not ( = ?auto_18210 ?auto_18212 ) ) ( not ( = ?auto_18210 ?auto_18213 ) ) ( not ( = ?auto_18211 ?auto_18212 ) ) ( not ( = ?auto_18211 ?auto_18213 ) ) ( not ( = ?auto_18212 ?auto_18213 ) ) ( ON ?auto_18213 ?auto_18214 ) ( not ( = ?auto_18209 ?auto_18214 ) ) ( not ( = ?auto_18210 ?auto_18214 ) ) ( not ( = ?auto_18211 ?auto_18214 ) ) ( not ( = ?auto_18212 ?auto_18214 ) ) ( not ( = ?auto_18213 ?auto_18214 ) ) ( ON ?auto_18212 ?auto_18213 ) ( ON-TABLE ?auto_18214 ) ( ON ?auto_18211 ?auto_18212 ) ( CLEAR ?auto_18211 ) ( HOLDING ?auto_18210 ) ( CLEAR ?auto_18209 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18209 ?auto_18210 )
      ( MAKE-5PILE ?auto_18209 ?auto_18210 ?auto_18211 ?auto_18212 ?auto_18213 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18215 - BLOCK
      ?auto_18216 - BLOCK
      ?auto_18217 - BLOCK
      ?auto_18218 - BLOCK
      ?auto_18219 - BLOCK
    )
    :vars
    (
      ?auto_18220 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18215 ) ( not ( = ?auto_18215 ?auto_18216 ) ) ( not ( = ?auto_18215 ?auto_18217 ) ) ( not ( = ?auto_18215 ?auto_18218 ) ) ( not ( = ?auto_18215 ?auto_18219 ) ) ( not ( = ?auto_18216 ?auto_18217 ) ) ( not ( = ?auto_18216 ?auto_18218 ) ) ( not ( = ?auto_18216 ?auto_18219 ) ) ( not ( = ?auto_18217 ?auto_18218 ) ) ( not ( = ?auto_18217 ?auto_18219 ) ) ( not ( = ?auto_18218 ?auto_18219 ) ) ( ON ?auto_18219 ?auto_18220 ) ( not ( = ?auto_18215 ?auto_18220 ) ) ( not ( = ?auto_18216 ?auto_18220 ) ) ( not ( = ?auto_18217 ?auto_18220 ) ) ( not ( = ?auto_18218 ?auto_18220 ) ) ( not ( = ?auto_18219 ?auto_18220 ) ) ( ON ?auto_18218 ?auto_18219 ) ( ON-TABLE ?auto_18220 ) ( ON ?auto_18217 ?auto_18218 ) ( CLEAR ?auto_18215 ) ( ON ?auto_18216 ?auto_18217 ) ( CLEAR ?auto_18216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18220 ?auto_18219 ?auto_18218 ?auto_18217 )
      ( MAKE-5PILE ?auto_18215 ?auto_18216 ?auto_18217 ?auto_18218 ?auto_18219 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18221 - BLOCK
      ?auto_18222 - BLOCK
      ?auto_18223 - BLOCK
      ?auto_18224 - BLOCK
      ?auto_18225 - BLOCK
    )
    :vars
    (
      ?auto_18226 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18221 ?auto_18222 ) ) ( not ( = ?auto_18221 ?auto_18223 ) ) ( not ( = ?auto_18221 ?auto_18224 ) ) ( not ( = ?auto_18221 ?auto_18225 ) ) ( not ( = ?auto_18222 ?auto_18223 ) ) ( not ( = ?auto_18222 ?auto_18224 ) ) ( not ( = ?auto_18222 ?auto_18225 ) ) ( not ( = ?auto_18223 ?auto_18224 ) ) ( not ( = ?auto_18223 ?auto_18225 ) ) ( not ( = ?auto_18224 ?auto_18225 ) ) ( ON ?auto_18225 ?auto_18226 ) ( not ( = ?auto_18221 ?auto_18226 ) ) ( not ( = ?auto_18222 ?auto_18226 ) ) ( not ( = ?auto_18223 ?auto_18226 ) ) ( not ( = ?auto_18224 ?auto_18226 ) ) ( not ( = ?auto_18225 ?auto_18226 ) ) ( ON ?auto_18224 ?auto_18225 ) ( ON-TABLE ?auto_18226 ) ( ON ?auto_18223 ?auto_18224 ) ( ON ?auto_18222 ?auto_18223 ) ( CLEAR ?auto_18222 ) ( HOLDING ?auto_18221 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18221 )
      ( MAKE-5PILE ?auto_18221 ?auto_18222 ?auto_18223 ?auto_18224 ?auto_18225 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18227 - BLOCK
      ?auto_18228 - BLOCK
      ?auto_18229 - BLOCK
      ?auto_18230 - BLOCK
      ?auto_18231 - BLOCK
    )
    :vars
    (
      ?auto_18232 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18227 ?auto_18228 ) ) ( not ( = ?auto_18227 ?auto_18229 ) ) ( not ( = ?auto_18227 ?auto_18230 ) ) ( not ( = ?auto_18227 ?auto_18231 ) ) ( not ( = ?auto_18228 ?auto_18229 ) ) ( not ( = ?auto_18228 ?auto_18230 ) ) ( not ( = ?auto_18228 ?auto_18231 ) ) ( not ( = ?auto_18229 ?auto_18230 ) ) ( not ( = ?auto_18229 ?auto_18231 ) ) ( not ( = ?auto_18230 ?auto_18231 ) ) ( ON ?auto_18231 ?auto_18232 ) ( not ( = ?auto_18227 ?auto_18232 ) ) ( not ( = ?auto_18228 ?auto_18232 ) ) ( not ( = ?auto_18229 ?auto_18232 ) ) ( not ( = ?auto_18230 ?auto_18232 ) ) ( not ( = ?auto_18231 ?auto_18232 ) ) ( ON ?auto_18230 ?auto_18231 ) ( ON-TABLE ?auto_18232 ) ( ON ?auto_18229 ?auto_18230 ) ( ON ?auto_18228 ?auto_18229 ) ( ON ?auto_18227 ?auto_18228 ) ( CLEAR ?auto_18227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_18232 ?auto_18231 ?auto_18230 ?auto_18229 ?auto_18228 )
      ( MAKE-5PILE ?auto_18227 ?auto_18228 ?auto_18229 ?auto_18230 ?auto_18231 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18237 - BLOCK
      ?auto_18238 - BLOCK
      ?auto_18239 - BLOCK
      ?auto_18240 - BLOCK
    )
    :vars
    (
      ?auto_18241 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18241 ?auto_18240 ) ( CLEAR ?auto_18241 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18237 ) ( ON ?auto_18238 ?auto_18237 ) ( ON ?auto_18239 ?auto_18238 ) ( ON ?auto_18240 ?auto_18239 ) ( not ( = ?auto_18237 ?auto_18238 ) ) ( not ( = ?auto_18237 ?auto_18239 ) ) ( not ( = ?auto_18237 ?auto_18240 ) ) ( not ( = ?auto_18237 ?auto_18241 ) ) ( not ( = ?auto_18238 ?auto_18239 ) ) ( not ( = ?auto_18238 ?auto_18240 ) ) ( not ( = ?auto_18238 ?auto_18241 ) ) ( not ( = ?auto_18239 ?auto_18240 ) ) ( not ( = ?auto_18239 ?auto_18241 ) ) ( not ( = ?auto_18240 ?auto_18241 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18241 ?auto_18240 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18253 - BLOCK
      ?auto_18254 - BLOCK
      ?auto_18255 - BLOCK
      ?auto_18256 - BLOCK
    )
    :vars
    (
      ?auto_18257 - BLOCK
      ?auto_18258 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18253 ) ( ON ?auto_18254 ?auto_18253 ) ( ON ?auto_18255 ?auto_18254 ) ( not ( = ?auto_18253 ?auto_18254 ) ) ( not ( = ?auto_18253 ?auto_18255 ) ) ( not ( = ?auto_18253 ?auto_18256 ) ) ( not ( = ?auto_18253 ?auto_18257 ) ) ( not ( = ?auto_18254 ?auto_18255 ) ) ( not ( = ?auto_18254 ?auto_18256 ) ) ( not ( = ?auto_18254 ?auto_18257 ) ) ( not ( = ?auto_18255 ?auto_18256 ) ) ( not ( = ?auto_18255 ?auto_18257 ) ) ( not ( = ?auto_18256 ?auto_18257 ) ) ( ON ?auto_18257 ?auto_18258 ) ( CLEAR ?auto_18257 ) ( not ( = ?auto_18253 ?auto_18258 ) ) ( not ( = ?auto_18254 ?auto_18258 ) ) ( not ( = ?auto_18255 ?auto_18258 ) ) ( not ( = ?auto_18256 ?auto_18258 ) ) ( not ( = ?auto_18257 ?auto_18258 ) ) ( HOLDING ?auto_18256 ) ( CLEAR ?auto_18255 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_18253 ?auto_18254 ?auto_18255 ?auto_18256 ?auto_18257 )
      ( MAKE-4PILE ?auto_18253 ?auto_18254 ?auto_18255 ?auto_18256 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18259 - BLOCK
      ?auto_18260 - BLOCK
      ?auto_18261 - BLOCK
      ?auto_18262 - BLOCK
    )
    :vars
    (
      ?auto_18263 - BLOCK
      ?auto_18264 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18259 ) ( ON ?auto_18260 ?auto_18259 ) ( ON ?auto_18261 ?auto_18260 ) ( not ( = ?auto_18259 ?auto_18260 ) ) ( not ( = ?auto_18259 ?auto_18261 ) ) ( not ( = ?auto_18259 ?auto_18262 ) ) ( not ( = ?auto_18259 ?auto_18263 ) ) ( not ( = ?auto_18260 ?auto_18261 ) ) ( not ( = ?auto_18260 ?auto_18262 ) ) ( not ( = ?auto_18260 ?auto_18263 ) ) ( not ( = ?auto_18261 ?auto_18262 ) ) ( not ( = ?auto_18261 ?auto_18263 ) ) ( not ( = ?auto_18262 ?auto_18263 ) ) ( ON ?auto_18263 ?auto_18264 ) ( not ( = ?auto_18259 ?auto_18264 ) ) ( not ( = ?auto_18260 ?auto_18264 ) ) ( not ( = ?auto_18261 ?auto_18264 ) ) ( not ( = ?auto_18262 ?auto_18264 ) ) ( not ( = ?auto_18263 ?auto_18264 ) ) ( CLEAR ?auto_18261 ) ( ON ?auto_18262 ?auto_18263 ) ( CLEAR ?auto_18262 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18264 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18264 ?auto_18263 )
      ( MAKE-4PILE ?auto_18259 ?auto_18260 ?auto_18261 ?auto_18262 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18265 - BLOCK
      ?auto_18266 - BLOCK
      ?auto_18267 - BLOCK
      ?auto_18268 - BLOCK
    )
    :vars
    (
      ?auto_18269 - BLOCK
      ?auto_18270 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18265 ) ( ON ?auto_18266 ?auto_18265 ) ( not ( = ?auto_18265 ?auto_18266 ) ) ( not ( = ?auto_18265 ?auto_18267 ) ) ( not ( = ?auto_18265 ?auto_18268 ) ) ( not ( = ?auto_18265 ?auto_18269 ) ) ( not ( = ?auto_18266 ?auto_18267 ) ) ( not ( = ?auto_18266 ?auto_18268 ) ) ( not ( = ?auto_18266 ?auto_18269 ) ) ( not ( = ?auto_18267 ?auto_18268 ) ) ( not ( = ?auto_18267 ?auto_18269 ) ) ( not ( = ?auto_18268 ?auto_18269 ) ) ( ON ?auto_18269 ?auto_18270 ) ( not ( = ?auto_18265 ?auto_18270 ) ) ( not ( = ?auto_18266 ?auto_18270 ) ) ( not ( = ?auto_18267 ?auto_18270 ) ) ( not ( = ?auto_18268 ?auto_18270 ) ) ( not ( = ?auto_18269 ?auto_18270 ) ) ( ON ?auto_18268 ?auto_18269 ) ( CLEAR ?auto_18268 ) ( ON-TABLE ?auto_18270 ) ( HOLDING ?auto_18267 ) ( CLEAR ?auto_18266 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18265 ?auto_18266 ?auto_18267 )
      ( MAKE-4PILE ?auto_18265 ?auto_18266 ?auto_18267 ?auto_18268 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18271 - BLOCK
      ?auto_18272 - BLOCK
      ?auto_18273 - BLOCK
      ?auto_18274 - BLOCK
    )
    :vars
    (
      ?auto_18275 - BLOCK
      ?auto_18276 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18271 ) ( ON ?auto_18272 ?auto_18271 ) ( not ( = ?auto_18271 ?auto_18272 ) ) ( not ( = ?auto_18271 ?auto_18273 ) ) ( not ( = ?auto_18271 ?auto_18274 ) ) ( not ( = ?auto_18271 ?auto_18275 ) ) ( not ( = ?auto_18272 ?auto_18273 ) ) ( not ( = ?auto_18272 ?auto_18274 ) ) ( not ( = ?auto_18272 ?auto_18275 ) ) ( not ( = ?auto_18273 ?auto_18274 ) ) ( not ( = ?auto_18273 ?auto_18275 ) ) ( not ( = ?auto_18274 ?auto_18275 ) ) ( ON ?auto_18275 ?auto_18276 ) ( not ( = ?auto_18271 ?auto_18276 ) ) ( not ( = ?auto_18272 ?auto_18276 ) ) ( not ( = ?auto_18273 ?auto_18276 ) ) ( not ( = ?auto_18274 ?auto_18276 ) ) ( not ( = ?auto_18275 ?auto_18276 ) ) ( ON ?auto_18274 ?auto_18275 ) ( ON-TABLE ?auto_18276 ) ( CLEAR ?auto_18272 ) ( ON ?auto_18273 ?auto_18274 ) ( CLEAR ?auto_18273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18276 ?auto_18275 ?auto_18274 )
      ( MAKE-4PILE ?auto_18271 ?auto_18272 ?auto_18273 ?auto_18274 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18277 - BLOCK
      ?auto_18278 - BLOCK
      ?auto_18279 - BLOCK
      ?auto_18280 - BLOCK
    )
    :vars
    (
      ?auto_18282 - BLOCK
      ?auto_18281 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18277 ) ( not ( = ?auto_18277 ?auto_18278 ) ) ( not ( = ?auto_18277 ?auto_18279 ) ) ( not ( = ?auto_18277 ?auto_18280 ) ) ( not ( = ?auto_18277 ?auto_18282 ) ) ( not ( = ?auto_18278 ?auto_18279 ) ) ( not ( = ?auto_18278 ?auto_18280 ) ) ( not ( = ?auto_18278 ?auto_18282 ) ) ( not ( = ?auto_18279 ?auto_18280 ) ) ( not ( = ?auto_18279 ?auto_18282 ) ) ( not ( = ?auto_18280 ?auto_18282 ) ) ( ON ?auto_18282 ?auto_18281 ) ( not ( = ?auto_18277 ?auto_18281 ) ) ( not ( = ?auto_18278 ?auto_18281 ) ) ( not ( = ?auto_18279 ?auto_18281 ) ) ( not ( = ?auto_18280 ?auto_18281 ) ) ( not ( = ?auto_18282 ?auto_18281 ) ) ( ON ?auto_18280 ?auto_18282 ) ( ON-TABLE ?auto_18281 ) ( ON ?auto_18279 ?auto_18280 ) ( CLEAR ?auto_18279 ) ( HOLDING ?auto_18278 ) ( CLEAR ?auto_18277 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18277 ?auto_18278 )
      ( MAKE-4PILE ?auto_18277 ?auto_18278 ?auto_18279 ?auto_18280 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18283 - BLOCK
      ?auto_18284 - BLOCK
      ?auto_18285 - BLOCK
      ?auto_18286 - BLOCK
    )
    :vars
    (
      ?auto_18287 - BLOCK
      ?auto_18288 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18283 ) ( not ( = ?auto_18283 ?auto_18284 ) ) ( not ( = ?auto_18283 ?auto_18285 ) ) ( not ( = ?auto_18283 ?auto_18286 ) ) ( not ( = ?auto_18283 ?auto_18287 ) ) ( not ( = ?auto_18284 ?auto_18285 ) ) ( not ( = ?auto_18284 ?auto_18286 ) ) ( not ( = ?auto_18284 ?auto_18287 ) ) ( not ( = ?auto_18285 ?auto_18286 ) ) ( not ( = ?auto_18285 ?auto_18287 ) ) ( not ( = ?auto_18286 ?auto_18287 ) ) ( ON ?auto_18287 ?auto_18288 ) ( not ( = ?auto_18283 ?auto_18288 ) ) ( not ( = ?auto_18284 ?auto_18288 ) ) ( not ( = ?auto_18285 ?auto_18288 ) ) ( not ( = ?auto_18286 ?auto_18288 ) ) ( not ( = ?auto_18287 ?auto_18288 ) ) ( ON ?auto_18286 ?auto_18287 ) ( ON-TABLE ?auto_18288 ) ( ON ?auto_18285 ?auto_18286 ) ( CLEAR ?auto_18283 ) ( ON ?auto_18284 ?auto_18285 ) ( CLEAR ?auto_18284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18288 ?auto_18287 ?auto_18286 ?auto_18285 )
      ( MAKE-4PILE ?auto_18283 ?auto_18284 ?auto_18285 ?auto_18286 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18289 - BLOCK
      ?auto_18290 - BLOCK
      ?auto_18291 - BLOCK
      ?auto_18292 - BLOCK
    )
    :vars
    (
      ?auto_18293 - BLOCK
      ?auto_18294 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18289 ?auto_18290 ) ) ( not ( = ?auto_18289 ?auto_18291 ) ) ( not ( = ?auto_18289 ?auto_18292 ) ) ( not ( = ?auto_18289 ?auto_18293 ) ) ( not ( = ?auto_18290 ?auto_18291 ) ) ( not ( = ?auto_18290 ?auto_18292 ) ) ( not ( = ?auto_18290 ?auto_18293 ) ) ( not ( = ?auto_18291 ?auto_18292 ) ) ( not ( = ?auto_18291 ?auto_18293 ) ) ( not ( = ?auto_18292 ?auto_18293 ) ) ( ON ?auto_18293 ?auto_18294 ) ( not ( = ?auto_18289 ?auto_18294 ) ) ( not ( = ?auto_18290 ?auto_18294 ) ) ( not ( = ?auto_18291 ?auto_18294 ) ) ( not ( = ?auto_18292 ?auto_18294 ) ) ( not ( = ?auto_18293 ?auto_18294 ) ) ( ON ?auto_18292 ?auto_18293 ) ( ON-TABLE ?auto_18294 ) ( ON ?auto_18291 ?auto_18292 ) ( ON ?auto_18290 ?auto_18291 ) ( CLEAR ?auto_18290 ) ( HOLDING ?auto_18289 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18289 )
      ( MAKE-4PILE ?auto_18289 ?auto_18290 ?auto_18291 ?auto_18292 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18295 - BLOCK
      ?auto_18296 - BLOCK
      ?auto_18297 - BLOCK
      ?auto_18298 - BLOCK
    )
    :vars
    (
      ?auto_18300 - BLOCK
      ?auto_18299 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18295 ?auto_18296 ) ) ( not ( = ?auto_18295 ?auto_18297 ) ) ( not ( = ?auto_18295 ?auto_18298 ) ) ( not ( = ?auto_18295 ?auto_18300 ) ) ( not ( = ?auto_18296 ?auto_18297 ) ) ( not ( = ?auto_18296 ?auto_18298 ) ) ( not ( = ?auto_18296 ?auto_18300 ) ) ( not ( = ?auto_18297 ?auto_18298 ) ) ( not ( = ?auto_18297 ?auto_18300 ) ) ( not ( = ?auto_18298 ?auto_18300 ) ) ( ON ?auto_18300 ?auto_18299 ) ( not ( = ?auto_18295 ?auto_18299 ) ) ( not ( = ?auto_18296 ?auto_18299 ) ) ( not ( = ?auto_18297 ?auto_18299 ) ) ( not ( = ?auto_18298 ?auto_18299 ) ) ( not ( = ?auto_18300 ?auto_18299 ) ) ( ON ?auto_18298 ?auto_18300 ) ( ON-TABLE ?auto_18299 ) ( ON ?auto_18297 ?auto_18298 ) ( ON ?auto_18296 ?auto_18297 ) ( ON ?auto_18295 ?auto_18296 ) ( CLEAR ?auto_18295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_18299 ?auto_18300 ?auto_18298 ?auto_18297 ?auto_18296 )
      ( MAKE-4PILE ?auto_18295 ?auto_18296 ?auto_18297 ?auto_18298 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18302 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_18302 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_18302 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18303 - BLOCK
    )
    :vars
    (
      ?auto_18304 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18303 ?auto_18304 ) ( CLEAR ?auto_18303 ) ( HAND-EMPTY ) ( not ( = ?auto_18303 ?auto_18304 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18303 ?auto_18304 )
      ( MAKE-1PILE ?auto_18303 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18305 - BLOCK
    )
    :vars
    (
      ?auto_18306 - BLOCK
      ?auto_18307 - BLOCK
      ?auto_18309 - BLOCK
      ?auto_18308 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18305 ?auto_18306 ) ) ( HOLDING ?auto_18305 ) ( CLEAR ?auto_18306 ) ( ON-TABLE ?auto_18307 ) ( ON ?auto_18309 ?auto_18307 ) ( ON ?auto_18308 ?auto_18309 ) ( ON ?auto_18306 ?auto_18308 ) ( not ( = ?auto_18307 ?auto_18309 ) ) ( not ( = ?auto_18307 ?auto_18308 ) ) ( not ( = ?auto_18307 ?auto_18306 ) ) ( not ( = ?auto_18307 ?auto_18305 ) ) ( not ( = ?auto_18309 ?auto_18308 ) ) ( not ( = ?auto_18309 ?auto_18306 ) ) ( not ( = ?auto_18309 ?auto_18305 ) ) ( not ( = ?auto_18308 ?auto_18306 ) ) ( not ( = ?auto_18308 ?auto_18305 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_18307 ?auto_18309 ?auto_18308 ?auto_18306 ?auto_18305 )
      ( MAKE-1PILE ?auto_18305 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18310 - BLOCK
    )
    :vars
    (
      ?auto_18312 - BLOCK
      ?auto_18314 - BLOCK
      ?auto_18311 - BLOCK
      ?auto_18313 - BLOCK
      ?auto_18315 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18310 ?auto_18312 ) ) ( CLEAR ?auto_18312 ) ( ON-TABLE ?auto_18314 ) ( ON ?auto_18311 ?auto_18314 ) ( ON ?auto_18313 ?auto_18311 ) ( ON ?auto_18312 ?auto_18313 ) ( not ( = ?auto_18314 ?auto_18311 ) ) ( not ( = ?auto_18314 ?auto_18313 ) ) ( not ( = ?auto_18314 ?auto_18312 ) ) ( not ( = ?auto_18314 ?auto_18310 ) ) ( not ( = ?auto_18311 ?auto_18313 ) ) ( not ( = ?auto_18311 ?auto_18312 ) ) ( not ( = ?auto_18311 ?auto_18310 ) ) ( not ( = ?auto_18313 ?auto_18312 ) ) ( not ( = ?auto_18313 ?auto_18310 ) ) ( ON ?auto_18310 ?auto_18315 ) ( CLEAR ?auto_18310 ) ( HAND-EMPTY ) ( not ( = ?auto_18310 ?auto_18315 ) ) ( not ( = ?auto_18312 ?auto_18315 ) ) ( not ( = ?auto_18314 ?auto_18315 ) ) ( not ( = ?auto_18311 ?auto_18315 ) ) ( not ( = ?auto_18313 ?auto_18315 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18310 ?auto_18315 )
      ( MAKE-1PILE ?auto_18310 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18316 - BLOCK
    )
    :vars
    (
      ?auto_18318 - BLOCK
      ?auto_18321 - BLOCK
      ?auto_18317 - BLOCK
      ?auto_18319 - BLOCK
      ?auto_18320 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18316 ?auto_18318 ) ) ( ON-TABLE ?auto_18321 ) ( ON ?auto_18317 ?auto_18321 ) ( ON ?auto_18319 ?auto_18317 ) ( not ( = ?auto_18321 ?auto_18317 ) ) ( not ( = ?auto_18321 ?auto_18319 ) ) ( not ( = ?auto_18321 ?auto_18318 ) ) ( not ( = ?auto_18321 ?auto_18316 ) ) ( not ( = ?auto_18317 ?auto_18319 ) ) ( not ( = ?auto_18317 ?auto_18318 ) ) ( not ( = ?auto_18317 ?auto_18316 ) ) ( not ( = ?auto_18319 ?auto_18318 ) ) ( not ( = ?auto_18319 ?auto_18316 ) ) ( ON ?auto_18316 ?auto_18320 ) ( CLEAR ?auto_18316 ) ( not ( = ?auto_18316 ?auto_18320 ) ) ( not ( = ?auto_18318 ?auto_18320 ) ) ( not ( = ?auto_18321 ?auto_18320 ) ) ( not ( = ?auto_18317 ?auto_18320 ) ) ( not ( = ?auto_18319 ?auto_18320 ) ) ( HOLDING ?auto_18318 ) ( CLEAR ?auto_18319 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18321 ?auto_18317 ?auto_18319 ?auto_18318 )
      ( MAKE-1PILE ?auto_18316 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18322 - BLOCK
    )
    :vars
    (
      ?auto_18326 - BLOCK
      ?auto_18324 - BLOCK
      ?auto_18323 - BLOCK
      ?auto_18327 - BLOCK
      ?auto_18325 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18322 ?auto_18326 ) ) ( ON-TABLE ?auto_18324 ) ( ON ?auto_18323 ?auto_18324 ) ( ON ?auto_18327 ?auto_18323 ) ( not ( = ?auto_18324 ?auto_18323 ) ) ( not ( = ?auto_18324 ?auto_18327 ) ) ( not ( = ?auto_18324 ?auto_18326 ) ) ( not ( = ?auto_18324 ?auto_18322 ) ) ( not ( = ?auto_18323 ?auto_18327 ) ) ( not ( = ?auto_18323 ?auto_18326 ) ) ( not ( = ?auto_18323 ?auto_18322 ) ) ( not ( = ?auto_18327 ?auto_18326 ) ) ( not ( = ?auto_18327 ?auto_18322 ) ) ( ON ?auto_18322 ?auto_18325 ) ( not ( = ?auto_18322 ?auto_18325 ) ) ( not ( = ?auto_18326 ?auto_18325 ) ) ( not ( = ?auto_18324 ?auto_18325 ) ) ( not ( = ?auto_18323 ?auto_18325 ) ) ( not ( = ?auto_18327 ?auto_18325 ) ) ( CLEAR ?auto_18327 ) ( ON ?auto_18326 ?auto_18322 ) ( CLEAR ?auto_18326 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18325 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18325 ?auto_18322 )
      ( MAKE-1PILE ?auto_18322 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18328 - BLOCK
    )
    :vars
    (
      ?auto_18333 - BLOCK
      ?auto_18331 - BLOCK
      ?auto_18330 - BLOCK
      ?auto_18329 - BLOCK
      ?auto_18332 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18328 ?auto_18333 ) ) ( ON-TABLE ?auto_18331 ) ( ON ?auto_18330 ?auto_18331 ) ( not ( = ?auto_18331 ?auto_18330 ) ) ( not ( = ?auto_18331 ?auto_18329 ) ) ( not ( = ?auto_18331 ?auto_18333 ) ) ( not ( = ?auto_18331 ?auto_18328 ) ) ( not ( = ?auto_18330 ?auto_18329 ) ) ( not ( = ?auto_18330 ?auto_18333 ) ) ( not ( = ?auto_18330 ?auto_18328 ) ) ( not ( = ?auto_18329 ?auto_18333 ) ) ( not ( = ?auto_18329 ?auto_18328 ) ) ( ON ?auto_18328 ?auto_18332 ) ( not ( = ?auto_18328 ?auto_18332 ) ) ( not ( = ?auto_18333 ?auto_18332 ) ) ( not ( = ?auto_18331 ?auto_18332 ) ) ( not ( = ?auto_18330 ?auto_18332 ) ) ( not ( = ?auto_18329 ?auto_18332 ) ) ( ON ?auto_18333 ?auto_18328 ) ( CLEAR ?auto_18333 ) ( ON-TABLE ?auto_18332 ) ( HOLDING ?auto_18329 ) ( CLEAR ?auto_18330 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18331 ?auto_18330 ?auto_18329 )
      ( MAKE-1PILE ?auto_18328 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18334 - BLOCK
    )
    :vars
    (
      ?auto_18335 - BLOCK
      ?auto_18337 - BLOCK
      ?auto_18338 - BLOCK
      ?auto_18336 - BLOCK
      ?auto_18339 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18334 ?auto_18335 ) ) ( ON-TABLE ?auto_18337 ) ( ON ?auto_18338 ?auto_18337 ) ( not ( = ?auto_18337 ?auto_18338 ) ) ( not ( = ?auto_18337 ?auto_18336 ) ) ( not ( = ?auto_18337 ?auto_18335 ) ) ( not ( = ?auto_18337 ?auto_18334 ) ) ( not ( = ?auto_18338 ?auto_18336 ) ) ( not ( = ?auto_18338 ?auto_18335 ) ) ( not ( = ?auto_18338 ?auto_18334 ) ) ( not ( = ?auto_18336 ?auto_18335 ) ) ( not ( = ?auto_18336 ?auto_18334 ) ) ( ON ?auto_18334 ?auto_18339 ) ( not ( = ?auto_18334 ?auto_18339 ) ) ( not ( = ?auto_18335 ?auto_18339 ) ) ( not ( = ?auto_18337 ?auto_18339 ) ) ( not ( = ?auto_18338 ?auto_18339 ) ) ( not ( = ?auto_18336 ?auto_18339 ) ) ( ON ?auto_18335 ?auto_18334 ) ( ON-TABLE ?auto_18339 ) ( CLEAR ?auto_18338 ) ( ON ?auto_18336 ?auto_18335 ) ( CLEAR ?auto_18336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18339 ?auto_18334 ?auto_18335 )
      ( MAKE-1PILE ?auto_18334 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18340 - BLOCK
    )
    :vars
    (
      ?auto_18341 - BLOCK
      ?auto_18345 - BLOCK
      ?auto_18344 - BLOCK
      ?auto_18342 - BLOCK
      ?auto_18343 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18340 ?auto_18341 ) ) ( ON-TABLE ?auto_18345 ) ( not ( = ?auto_18345 ?auto_18344 ) ) ( not ( = ?auto_18345 ?auto_18342 ) ) ( not ( = ?auto_18345 ?auto_18341 ) ) ( not ( = ?auto_18345 ?auto_18340 ) ) ( not ( = ?auto_18344 ?auto_18342 ) ) ( not ( = ?auto_18344 ?auto_18341 ) ) ( not ( = ?auto_18344 ?auto_18340 ) ) ( not ( = ?auto_18342 ?auto_18341 ) ) ( not ( = ?auto_18342 ?auto_18340 ) ) ( ON ?auto_18340 ?auto_18343 ) ( not ( = ?auto_18340 ?auto_18343 ) ) ( not ( = ?auto_18341 ?auto_18343 ) ) ( not ( = ?auto_18345 ?auto_18343 ) ) ( not ( = ?auto_18344 ?auto_18343 ) ) ( not ( = ?auto_18342 ?auto_18343 ) ) ( ON ?auto_18341 ?auto_18340 ) ( ON-TABLE ?auto_18343 ) ( ON ?auto_18342 ?auto_18341 ) ( CLEAR ?auto_18342 ) ( HOLDING ?auto_18344 ) ( CLEAR ?auto_18345 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18345 ?auto_18344 )
      ( MAKE-1PILE ?auto_18340 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18346 - BLOCK
    )
    :vars
    (
      ?auto_18347 - BLOCK
      ?auto_18348 - BLOCK
      ?auto_18349 - BLOCK
      ?auto_18350 - BLOCK
      ?auto_18351 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18346 ?auto_18347 ) ) ( ON-TABLE ?auto_18348 ) ( not ( = ?auto_18348 ?auto_18349 ) ) ( not ( = ?auto_18348 ?auto_18350 ) ) ( not ( = ?auto_18348 ?auto_18347 ) ) ( not ( = ?auto_18348 ?auto_18346 ) ) ( not ( = ?auto_18349 ?auto_18350 ) ) ( not ( = ?auto_18349 ?auto_18347 ) ) ( not ( = ?auto_18349 ?auto_18346 ) ) ( not ( = ?auto_18350 ?auto_18347 ) ) ( not ( = ?auto_18350 ?auto_18346 ) ) ( ON ?auto_18346 ?auto_18351 ) ( not ( = ?auto_18346 ?auto_18351 ) ) ( not ( = ?auto_18347 ?auto_18351 ) ) ( not ( = ?auto_18348 ?auto_18351 ) ) ( not ( = ?auto_18349 ?auto_18351 ) ) ( not ( = ?auto_18350 ?auto_18351 ) ) ( ON ?auto_18347 ?auto_18346 ) ( ON-TABLE ?auto_18351 ) ( ON ?auto_18350 ?auto_18347 ) ( CLEAR ?auto_18348 ) ( ON ?auto_18349 ?auto_18350 ) ( CLEAR ?auto_18349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18351 ?auto_18346 ?auto_18347 ?auto_18350 )
      ( MAKE-1PILE ?auto_18346 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18352 - BLOCK
    )
    :vars
    (
      ?auto_18353 - BLOCK
      ?auto_18356 - BLOCK
      ?auto_18355 - BLOCK
      ?auto_18357 - BLOCK
      ?auto_18354 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18352 ?auto_18353 ) ) ( not ( = ?auto_18356 ?auto_18355 ) ) ( not ( = ?auto_18356 ?auto_18357 ) ) ( not ( = ?auto_18356 ?auto_18353 ) ) ( not ( = ?auto_18356 ?auto_18352 ) ) ( not ( = ?auto_18355 ?auto_18357 ) ) ( not ( = ?auto_18355 ?auto_18353 ) ) ( not ( = ?auto_18355 ?auto_18352 ) ) ( not ( = ?auto_18357 ?auto_18353 ) ) ( not ( = ?auto_18357 ?auto_18352 ) ) ( ON ?auto_18352 ?auto_18354 ) ( not ( = ?auto_18352 ?auto_18354 ) ) ( not ( = ?auto_18353 ?auto_18354 ) ) ( not ( = ?auto_18356 ?auto_18354 ) ) ( not ( = ?auto_18355 ?auto_18354 ) ) ( not ( = ?auto_18357 ?auto_18354 ) ) ( ON ?auto_18353 ?auto_18352 ) ( ON-TABLE ?auto_18354 ) ( ON ?auto_18357 ?auto_18353 ) ( ON ?auto_18355 ?auto_18357 ) ( CLEAR ?auto_18355 ) ( HOLDING ?auto_18356 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18356 )
      ( MAKE-1PILE ?auto_18352 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18358 - BLOCK
    )
    :vars
    (
      ?auto_18361 - BLOCK
      ?auto_18362 - BLOCK
      ?auto_18360 - BLOCK
      ?auto_18363 - BLOCK
      ?auto_18359 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18358 ?auto_18361 ) ) ( not ( = ?auto_18362 ?auto_18360 ) ) ( not ( = ?auto_18362 ?auto_18363 ) ) ( not ( = ?auto_18362 ?auto_18361 ) ) ( not ( = ?auto_18362 ?auto_18358 ) ) ( not ( = ?auto_18360 ?auto_18363 ) ) ( not ( = ?auto_18360 ?auto_18361 ) ) ( not ( = ?auto_18360 ?auto_18358 ) ) ( not ( = ?auto_18363 ?auto_18361 ) ) ( not ( = ?auto_18363 ?auto_18358 ) ) ( ON ?auto_18358 ?auto_18359 ) ( not ( = ?auto_18358 ?auto_18359 ) ) ( not ( = ?auto_18361 ?auto_18359 ) ) ( not ( = ?auto_18362 ?auto_18359 ) ) ( not ( = ?auto_18360 ?auto_18359 ) ) ( not ( = ?auto_18363 ?auto_18359 ) ) ( ON ?auto_18361 ?auto_18358 ) ( ON-TABLE ?auto_18359 ) ( ON ?auto_18363 ?auto_18361 ) ( ON ?auto_18360 ?auto_18363 ) ( ON ?auto_18362 ?auto_18360 ) ( CLEAR ?auto_18362 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_18359 ?auto_18358 ?auto_18361 ?auto_18363 ?auto_18360 )
      ( MAKE-1PILE ?auto_18358 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18367 - BLOCK
      ?auto_18368 - BLOCK
      ?auto_18369 - BLOCK
    )
    :vars
    (
      ?auto_18370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18370 ?auto_18369 ) ( CLEAR ?auto_18370 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18367 ) ( ON ?auto_18368 ?auto_18367 ) ( ON ?auto_18369 ?auto_18368 ) ( not ( = ?auto_18367 ?auto_18368 ) ) ( not ( = ?auto_18367 ?auto_18369 ) ) ( not ( = ?auto_18367 ?auto_18370 ) ) ( not ( = ?auto_18368 ?auto_18369 ) ) ( not ( = ?auto_18368 ?auto_18370 ) ) ( not ( = ?auto_18369 ?auto_18370 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18370 ?auto_18369 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18371 - BLOCK
      ?auto_18372 - BLOCK
      ?auto_18373 - BLOCK
    )
    :vars
    (
      ?auto_18374 - BLOCK
      ?auto_18375 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18374 ?auto_18373 ) ( CLEAR ?auto_18374 ) ( ON-TABLE ?auto_18371 ) ( ON ?auto_18372 ?auto_18371 ) ( ON ?auto_18373 ?auto_18372 ) ( not ( = ?auto_18371 ?auto_18372 ) ) ( not ( = ?auto_18371 ?auto_18373 ) ) ( not ( = ?auto_18371 ?auto_18374 ) ) ( not ( = ?auto_18372 ?auto_18373 ) ) ( not ( = ?auto_18372 ?auto_18374 ) ) ( not ( = ?auto_18373 ?auto_18374 ) ) ( HOLDING ?auto_18375 ) ( not ( = ?auto_18371 ?auto_18375 ) ) ( not ( = ?auto_18372 ?auto_18375 ) ) ( not ( = ?auto_18373 ?auto_18375 ) ) ( not ( = ?auto_18374 ?auto_18375 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_18375 )
      ( MAKE-3PILE ?auto_18371 ?auto_18372 ?auto_18373 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18376 - BLOCK
      ?auto_18377 - BLOCK
      ?auto_18378 - BLOCK
    )
    :vars
    (
      ?auto_18379 - BLOCK
      ?auto_18380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18379 ?auto_18378 ) ( ON-TABLE ?auto_18376 ) ( ON ?auto_18377 ?auto_18376 ) ( ON ?auto_18378 ?auto_18377 ) ( not ( = ?auto_18376 ?auto_18377 ) ) ( not ( = ?auto_18376 ?auto_18378 ) ) ( not ( = ?auto_18376 ?auto_18379 ) ) ( not ( = ?auto_18377 ?auto_18378 ) ) ( not ( = ?auto_18377 ?auto_18379 ) ) ( not ( = ?auto_18378 ?auto_18379 ) ) ( not ( = ?auto_18376 ?auto_18380 ) ) ( not ( = ?auto_18377 ?auto_18380 ) ) ( not ( = ?auto_18378 ?auto_18380 ) ) ( not ( = ?auto_18379 ?auto_18380 ) ) ( ON ?auto_18380 ?auto_18379 ) ( CLEAR ?auto_18380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18376 ?auto_18377 ?auto_18378 ?auto_18379 )
      ( MAKE-3PILE ?auto_18376 ?auto_18377 ?auto_18378 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18381 - BLOCK
      ?auto_18382 - BLOCK
      ?auto_18383 - BLOCK
    )
    :vars
    (
      ?auto_18384 - BLOCK
      ?auto_18385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18384 ?auto_18383 ) ( ON-TABLE ?auto_18381 ) ( ON ?auto_18382 ?auto_18381 ) ( ON ?auto_18383 ?auto_18382 ) ( not ( = ?auto_18381 ?auto_18382 ) ) ( not ( = ?auto_18381 ?auto_18383 ) ) ( not ( = ?auto_18381 ?auto_18384 ) ) ( not ( = ?auto_18382 ?auto_18383 ) ) ( not ( = ?auto_18382 ?auto_18384 ) ) ( not ( = ?auto_18383 ?auto_18384 ) ) ( not ( = ?auto_18381 ?auto_18385 ) ) ( not ( = ?auto_18382 ?auto_18385 ) ) ( not ( = ?auto_18383 ?auto_18385 ) ) ( not ( = ?auto_18384 ?auto_18385 ) ) ( HOLDING ?auto_18385 ) ( CLEAR ?auto_18384 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_18381 ?auto_18382 ?auto_18383 ?auto_18384 ?auto_18385 )
      ( MAKE-3PILE ?auto_18381 ?auto_18382 ?auto_18383 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18386 - BLOCK
      ?auto_18387 - BLOCK
      ?auto_18388 - BLOCK
    )
    :vars
    (
      ?auto_18390 - BLOCK
      ?auto_18389 - BLOCK
      ?auto_18391 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18390 ?auto_18388 ) ( ON-TABLE ?auto_18386 ) ( ON ?auto_18387 ?auto_18386 ) ( ON ?auto_18388 ?auto_18387 ) ( not ( = ?auto_18386 ?auto_18387 ) ) ( not ( = ?auto_18386 ?auto_18388 ) ) ( not ( = ?auto_18386 ?auto_18390 ) ) ( not ( = ?auto_18387 ?auto_18388 ) ) ( not ( = ?auto_18387 ?auto_18390 ) ) ( not ( = ?auto_18388 ?auto_18390 ) ) ( not ( = ?auto_18386 ?auto_18389 ) ) ( not ( = ?auto_18387 ?auto_18389 ) ) ( not ( = ?auto_18388 ?auto_18389 ) ) ( not ( = ?auto_18390 ?auto_18389 ) ) ( CLEAR ?auto_18390 ) ( ON ?auto_18389 ?auto_18391 ) ( CLEAR ?auto_18389 ) ( HAND-EMPTY ) ( not ( = ?auto_18386 ?auto_18391 ) ) ( not ( = ?auto_18387 ?auto_18391 ) ) ( not ( = ?auto_18388 ?auto_18391 ) ) ( not ( = ?auto_18390 ?auto_18391 ) ) ( not ( = ?auto_18389 ?auto_18391 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18389 ?auto_18391 )
      ( MAKE-3PILE ?auto_18386 ?auto_18387 ?auto_18388 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18404 - BLOCK
      ?auto_18405 - BLOCK
      ?auto_18406 - BLOCK
    )
    :vars
    (
      ?auto_18408 - BLOCK
      ?auto_18407 - BLOCK
      ?auto_18409 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18404 ) ( ON ?auto_18405 ?auto_18404 ) ( not ( = ?auto_18404 ?auto_18405 ) ) ( not ( = ?auto_18404 ?auto_18406 ) ) ( not ( = ?auto_18404 ?auto_18408 ) ) ( not ( = ?auto_18405 ?auto_18406 ) ) ( not ( = ?auto_18405 ?auto_18408 ) ) ( not ( = ?auto_18406 ?auto_18408 ) ) ( not ( = ?auto_18404 ?auto_18407 ) ) ( not ( = ?auto_18405 ?auto_18407 ) ) ( not ( = ?auto_18406 ?auto_18407 ) ) ( not ( = ?auto_18408 ?auto_18407 ) ) ( ON ?auto_18407 ?auto_18409 ) ( not ( = ?auto_18404 ?auto_18409 ) ) ( not ( = ?auto_18405 ?auto_18409 ) ) ( not ( = ?auto_18406 ?auto_18409 ) ) ( not ( = ?auto_18408 ?auto_18409 ) ) ( not ( = ?auto_18407 ?auto_18409 ) ) ( ON ?auto_18408 ?auto_18407 ) ( CLEAR ?auto_18408 ) ( HOLDING ?auto_18406 ) ( CLEAR ?auto_18405 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18404 ?auto_18405 ?auto_18406 ?auto_18408 )
      ( MAKE-3PILE ?auto_18404 ?auto_18405 ?auto_18406 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18410 - BLOCK
      ?auto_18411 - BLOCK
      ?auto_18412 - BLOCK
    )
    :vars
    (
      ?auto_18415 - BLOCK
      ?auto_18414 - BLOCK
      ?auto_18413 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18410 ) ( ON ?auto_18411 ?auto_18410 ) ( not ( = ?auto_18410 ?auto_18411 ) ) ( not ( = ?auto_18410 ?auto_18412 ) ) ( not ( = ?auto_18410 ?auto_18415 ) ) ( not ( = ?auto_18411 ?auto_18412 ) ) ( not ( = ?auto_18411 ?auto_18415 ) ) ( not ( = ?auto_18412 ?auto_18415 ) ) ( not ( = ?auto_18410 ?auto_18414 ) ) ( not ( = ?auto_18411 ?auto_18414 ) ) ( not ( = ?auto_18412 ?auto_18414 ) ) ( not ( = ?auto_18415 ?auto_18414 ) ) ( ON ?auto_18414 ?auto_18413 ) ( not ( = ?auto_18410 ?auto_18413 ) ) ( not ( = ?auto_18411 ?auto_18413 ) ) ( not ( = ?auto_18412 ?auto_18413 ) ) ( not ( = ?auto_18415 ?auto_18413 ) ) ( not ( = ?auto_18414 ?auto_18413 ) ) ( ON ?auto_18415 ?auto_18414 ) ( CLEAR ?auto_18411 ) ( ON ?auto_18412 ?auto_18415 ) ( CLEAR ?auto_18412 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18413 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18413 ?auto_18414 ?auto_18415 )
      ( MAKE-3PILE ?auto_18410 ?auto_18411 ?auto_18412 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18416 - BLOCK
      ?auto_18417 - BLOCK
      ?auto_18418 - BLOCK
    )
    :vars
    (
      ?auto_18420 - BLOCK
      ?auto_18421 - BLOCK
      ?auto_18419 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18416 ) ( not ( = ?auto_18416 ?auto_18417 ) ) ( not ( = ?auto_18416 ?auto_18418 ) ) ( not ( = ?auto_18416 ?auto_18420 ) ) ( not ( = ?auto_18417 ?auto_18418 ) ) ( not ( = ?auto_18417 ?auto_18420 ) ) ( not ( = ?auto_18418 ?auto_18420 ) ) ( not ( = ?auto_18416 ?auto_18421 ) ) ( not ( = ?auto_18417 ?auto_18421 ) ) ( not ( = ?auto_18418 ?auto_18421 ) ) ( not ( = ?auto_18420 ?auto_18421 ) ) ( ON ?auto_18421 ?auto_18419 ) ( not ( = ?auto_18416 ?auto_18419 ) ) ( not ( = ?auto_18417 ?auto_18419 ) ) ( not ( = ?auto_18418 ?auto_18419 ) ) ( not ( = ?auto_18420 ?auto_18419 ) ) ( not ( = ?auto_18421 ?auto_18419 ) ) ( ON ?auto_18420 ?auto_18421 ) ( ON ?auto_18418 ?auto_18420 ) ( CLEAR ?auto_18418 ) ( ON-TABLE ?auto_18419 ) ( HOLDING ?auto_18417 ) ( CLEAR ?auto_18416 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18416 ?auto_18417 )
      ( MAKE-3PILE ?auto_18416 ?auto_18417 ?auto_18418 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18422 - BLOCK
      ?auto_18423 - BLOCK
      ?auto_18424 - BLOCK
    )
    :vars
    (
      ?auto_18425 - BLOCK
      ?auto_18426 - BLOCK
      ?auto_18427 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18422 ) ( not ( = ?auto_18422 ?auto_18423 ) ) ( not ( = ?auto_18422 ?auto_18424 ) ) ( not ( = ?auto_18422 ?auto_18425 ) ) ( not ( = ?auto_18423 ?auto_18424 ) ) ( not ( = ?auto_18423 ?auto_18425 ) ) ( not ( = ?auto_18424 ?auto_18425 ) ) ( not ( = ?auto_18422 ?auto_18426 ) ) ( not ( = ?auto_18423 ?auto_18426 ) ) ( not ( = ?auto_18424 ?auto_18426 ) ) ( not ( = ?auto_18425 ?auto_18426 ) ) ( ON ?auto_18426 ?auto_18427 ) ( not ( = ?auto_18422 ?auto_18427 ) ) ( not ( = ?auto_18423 ?auto_18427 ) ) ( not ( = ?auto_18424 ?auto_18427 ) ) ( not ( = ?auto_18425 ?auto_18427 ) ) ( not ( = ?auto_18426 ?auto_18427 ) ) ( ON ?auto_18425 ?auto_18426 ) ( ON ?auto_18424 ?auto_18425 ) ( ON-TABLE ?auto_18427 ) ( CLEAR ?auto_18422 ) ( ON ?auto_18423 ?auto_18424 ) ( CLEAR ?auto_18423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18427 ?auto_18426 ?auto_18425 ?auto_18424 )
      ( MAKE-3PILE ?auto_18422 ?auto_18423 ?auto_18424 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18428 - BLOCK
      ?auto_18429 - BLOCK
      ?auto_18430 - BLOCK
    )
    :vars
    (
      ?auto_18432 - BLOCK
      ?auto_18431 - BLOCK
      ?auto_18433 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18428 ?auto_18429 ) ) ( not ( = ?auto_18428 ?auto_18430 ) ) ( not ( = ?auto_18428 ?auto_18432 ) ) ( not ( = ?auto_18429 ?auto_18430 ) ) ( not ( = ?auto_18429 ?auto_18432 ) ) ( not ( = ?auto_18430 ?auto_18432 ) ) ( not ( = ?auto_18428 ?auto_18431 ) ) ( not ( = ?auto_18429 ?auto_18431 ) ) ( not ( = ?auto_18430 ?auto_18431 ) ) ( not ( = ?auto_18432 ?auto_18431 ) ) ( ON ?auto_18431 ?auto_18433 ) ( not ( = ?auto_18428 ?auto_18433 ) ) ( not ( = ?auto_18429 ?auto_18433 ) ) ( not ( = ?auto_18430 ?auto_18433 ) ) ( not ( = ?auto_18432 ?auto_18433 ) ) ( not ( = ?auto_18431 ?auto_18433 ) ) ( ON ?auto_18432 ?auto_18431 ) ( ON ?auto_18430 ?auto_18432 ) ( ON-TABLE ?auto_18433 ) ( ON ?auto_18429 ?auto_18430 ) ( CLEAR ?auto_18429 ) ( HOLDING ?auto_18428 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18428 )
      ( MAKE-3PILE ?auto_18428 ?auto_18429 ?auto_18430 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18434 - BLOCK
      ?auto_18435 - BLOCK
      ?auto_18436 - BLOCK
    )
    :vars
    (
      ?auto_18439 - BLOCK
      ?auto_18437 - BLOCK
      ?auto_18438 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18434 ?auto_18435 ) ) ( not ( = ?auto_18434 ?auto_18436 ) ) ( not ( = ?auto_18434 ?auto_18439 ) ) ( not ( = ?auto_18435 ?auto_18436 ) ) ( not ( = ?auto_18435 ?auto_18439 ) ) ( not ( = ?auto_18436 ?auto_18439 ) ) ( not ( = ?auto_18434 ?auto_18437 ) ) ( not ( = ?auto_18435 ?auto_18437 ) ) ( not ( = ?auto_18436 ?auto_18437 ) ) ( not ( = ?auto_18439 ?auto_18437 ) ) ( ON ?auto_18437 ?auto_18438 ) ( not ( = ?auto_18434 ?auto_18438 ) ) ( not ( = ?auto_18435 ?auto_18438 ) ) ( not ( = ?auto_18436 ?auto_18438 ) ) ( not ( = ?auto_18439 ?auto_18438 ) ) ( not ( = ?auto_18437 ?auto_18438 ) ) ( ON ?auto_18439 ?auto_18437 ) ( ON ?auto_18436 ?auto_18439 ) ( ON-TABLE ?auto_18438 ) ( ON ?auto_18435 ?auto_18436 ) ( ON ?auto_18434 ?auto_18435 ) ( CLEAR ?auto_18434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_18438 ?auto_18437 ?auto_18439 ?auto_18436 ?auto_18435 )
      ( MAKE-3PILE ?auto_18434 ?auto_18435 ?auto_18436 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18442 - BLOCK
      ?auto_18443 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_18443 ) ( CLEAR ?auto_18442 ) ( ON-TABLE ?auto_18442 ) ( not ( = ?auto_18442 ?auto_18443 ) ) )
    :subtasks
    ( ( !STACK ?auto_18443 ?auto_18442 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18444 - BLOCK
      ?auto_18445 - BLOCK
    )
    :vars
    (
      ?auto_18446 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_18444 ) ( ON-TABLE ?auto_18444 ) ( not ( = ?auto_18444 ?auto_18445 ) ) ( ON ?auto_18445 ?auto_18446 ) ( CLEAR ?auto_18445 ) ( HAND-EMPTY ) ( not ( = ?auto_18444 ?auto_18446 ) ) ( not ( = ?auto_18445 ?auto_18446 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18445 ?auto_18446 )
      ( MAKE-2PILE ?auto_18444 ?auto_18445 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18447 - BLOCK
      ?auto_18448 - BLOCK
    )
    :vars
    (
      ?auto_18449 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18447 ?auto_18448 ) ) ( ON ?auto_18448 ?auto_18449 ) ( CLEAR ?auto_18448 ) ( not ( = ?auto_18447 ?auto_18449 ) ) ( not ( = ?auto_18448 ?auto_18449 ) ) ( HOLDING ?auto_18447 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18447 )
      ( MAKE-2PILE ?auto_18447 ?auto_18448 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18450 - BLOCK
      ?auto_18451 - BLOCK
    )
    :vars
    (
      ?auto_18452 - BLOCK
      ?auto_18454 - BLOCK
      ?auto_18453 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18450 ?auto_18451 ) ) ( ON ?auto_18451 ?auto_18452 ) ( not ( = ?auto_18450 ?auto_18452 ) ) ( not ( = ?auto_18451 ?auto_18452 ) ) ( ON ?auto_18450 ?auto_18451 ) ( CLEAR ?auto_18450 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18454 ) ( ON ?auto_18453 ?auto_18454 ) ( ON ?auto_18452 ?auto_18453 ) ( not ( = ?auto_18454 ?auto_18453 ) ) ( not ( = ?auto_18454 ?auto_18452 ) ) ( not ( = ?auto_18454 ?auto_18451 ) ) ( not ( = ?auto_18454 ?auto_18450 ) ) ( not ( = ?auto_18453 ?auto_18452 ) ) ( not ( = ?auto_18453 ?auto_18451 ) ) ( not ( = ?auto_18453 ?auto_18450 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18454 ?auto_18453 ?auto_18452 ?auto_18451 )
      ( MAKE-2PILE ?auto_18450 ?auto_18451 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18455 - BLOCK
      ?auto_18456 - BLOCK
    )
    :vars
    (
      ?auto_18459 - BLOCK
      ?auto_18457 - BLOCK
      ?auto_18458 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18455 ?auto_18456 ) ) ( ON ?auto_18456 ?auto_18459 ) ( not ( = ?auto_18455 ?auto_18459 ) ) ( not ( = ?auto_18456 ?auto_18459 ) ) ( ON-TABLE ?auto_18457 ) ( ON ?auto_18458 ?auto_18457 ) ( ON ?auto_18459 ?auto_18458 ) ( not ( = ?auto_18457 ?auto_18458 ) ) ( not ( = ?auto_18457 ?auto_18459 ) ) ( not ( = ?auto_18457 ?auto_18456 ) ) ( not ( = ?auto_18457 ?auto_18455 ) ) ( not ( = ?auto_18458 ?auto_18459 ) ) ( not ( = ?auto_18458 ?auto_18456 ) ) ( not ( = ?auto_18458 ?auto_18455 ) ) ( HOLDING ?auto_18455 ) ( CLEAR ?auto_18456 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_18457 ?auto_18458 ?auto_18459 ?auto_18456 ?auto_18455 )
      ( MAKE-2PILE ?auto_18455 ?auto_18456 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18460 - BLOCK
      ?auto_18461 - BLOCK
    )
    :vars
    (
      ?auto_18462 - BLOCK
      ?auto_18464 - BLOCK
      ?auto_18463 - BLOCK
      ?auto_18465 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18460 ?auto_18461 ) ) ( ON ?auto_18461 ?auto_18462 ) ( not ( = ?auto_18460 ?auto_18462 ) ) ( not ( = ?auto_18461 ?auto_18462 ) ) ( ON-TABLE ?auto_18464 ) ( ON ?auto_18463 ?auto_18464 ) ( ON ?auto_18462 ?auto_18463 ) ( not ( = ?auto_18464 ?auto_18463 ) ) ( not ( = ?auto_18464 ?auto_18462 ) ) ( not ( = ?auto_18464 ?auto_18461 ) ) ( not ( = ?auto_18464 ?auto_18460 ) ) ( not ( = ?auto_18463 ?auto_18462 ) ) ( not ( = ?auto_18463 ?auto_18461 ) ) ( not ( = ?auto_18463 ?auto_18460 ) ) ( CLEAR ?auto_18461 ) ( ON ?auto_18460 ?auto_18465 ) ( CLEAR ?auto_18460 ) ( HAND-EMPTY ) ( not ( = ?auto_18460 ?auto_18465 ) ) ( not ( = ?auto_18461 ?auto_18465 ) ) ( not ( = ?auto_18462 ?auto_18465 ) ) ( not ( = ?auto_18464 ?auto_18465 ) ) ( not ( = ?auto_18463 ?auto_18465 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18460 ?auto_18465 )
      ( MAKE-2PILE ?auto_18460 ?auto_18461 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18466 - BLOCK
      ?auto_18467 - BLOCK
    )
    :vars
    (
      ?auto_18470 - BLOCK
      ?auto_18471 - BLOCK
      ?auto_18469 - BLOCK
      ?auto_18468 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18466 ?auto_18467 ) ) ( not ( = ?auto_18466 ?auto_18470 ) ) ( not ( = ?auto_18467 ?auto_18470 ) ) ( ON-TABLE ?auto_18471 ) ( ON ?auto_18469 ?auto_18471 ) ( ON ?auto_18470 ?auto_18469 ) ( not ( = ?auto_18471 ?auto_18469 ) ) ( not ( = ?auto_18471 ?auto_18470 ) ) ( not ( = ?auto_18471 ?auto_18467 ) ) ( not ( = ?auto_18471 ?auto_18466 ) ) ( not ( = ?auto_18469 ?auto_18470 ) ) ( not ( = ?auto_18469 ?auto_18467 ) ) ( not ( = ?auto_18469 ?auto_18466 ) ) ( ON ?auto_18466 ?auto_18468 ) ( CLEAR ?auto_18466 ) ( not ( = ?auto_18466 ?auto_18468 ) ) ( not ( = ?auto_18467 ?auto_18468 ) ) ( not ( = ?auto_18470 ?auto_18468 ) ) ( not ( = ?auto_18471 ?auto_18468 ) ) ( not ( = ?auto_18469 ?auto_18468 ) ) ( HOLDING ?auto_18467 ) ( CLEAR ?auto_18470 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18471 ?auto_18469 ?auto_18470 ?auto_18467 )
      ( MAKE-2PILE ?auto_18466 ?auto_18467 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18472 - BLOCK
      ?auto_18473 - BLOCK
    )
    :vars
    (
      ?auto_18476 - BLOCK
      ?auto_18477 - BLOCK
      ?auto_18475 - BLOCK
      ?auto_18474 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18472 ?auto_18473 ) ) ( not ( = ?auto_18472 ?auto_18476 ) ) ( not ( = ?auto_18473 ?auto_18476 ) ) ( ON-TABLE ?auto_18477 ) ( ON ?auto_18475 ?auto_18477 ) ( ON ?auto_18476 ?auto_18475 ) ( not ( = ?auto_18477 ?auto_18475 ) ) ( not ( = ?auto_18477 ?auto_18476 ) ) ( not ( = ?auto_18477 ?auto_18473 ) ) ( not ( = ?auto_18477 ?auto_18472 ) ) ( not ( = ?auto_18475 ?auto_18476 ) ) ( not ( = ?auto_18475 ?auto_18473 ) ) ( not ( = ?auto_18475 ?auto_18472 ) ) ( ON ?auto_18472 ?auto_18474 ) ( not ( = ?auto_18472 ?auto_18474 ) ) ( not ( = ?auto_18473 ?auto_18474 ) ) ( not ( = ?auto_18476 ?auto_18474 ) ) ( not ( = ?auto_18477 ?auto_18474 ) ) ( not ( = ?auto_18475 ?auto_18474 ) ) ( CLEAR ?auto_18476 ) ( ON ?auto_18473 ?auto_18472 ) ( CLEAR ?auto_18473 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18474 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18474 ?auto_18472 )
      ( MAKE-2PILE ?auto_18472 ?auto_18473 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18478 - BLOCK
      ?auto_18479 - BLOCK
    )
    :vars
    (
      ?auto_18480 - BLOCK
      ?auto_18482 - BLOCK
      ?auto_18481 - BLOCK
      ?auto_18483 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18478 ?auto_18479 ) ) ( not ( = ?auto_18478 ?auto_18480 ) ) ( not ( = ?auto_18479 ?auto_18480 ) ) ( ON-TABLE ?auto_18482 ) ( ON ?auto_18481 ?auto_18482 ) ( not ( = ?auto_18482 ?auto_18481 ) ) ( not ( = ?auto_18482 ?auto_18480 ) ) ( not ( = ?auto_18482 ?auto_18479 ) ) ( not ( = ?auto_18482 ?auto_18478 ) ) ( not ( = ?auto_18481 ?auto_18480 ) ) ( not ( = ?auto_18481 ?auto_18479 ) ) ( not ( = ?auto_18481 ?auto_18478 ) ) ( ON ?auto_18478 ?auto_18483 ) ( not ( = ?auto_18478 ?auto_18483 ) ) ( not ( = ?auto_18479 ?auto_18483 ) ) ( not ( = ?auto_18480 ?auto_18483 ) ) ( not ( = ?auto_18482 ?auto_18483 ) ) ( not ( = ?auto_18481 ?auto_18483 ) ) ( ON ?auto_18479 ?auto_18478 ) ( CLEAR ?auto_18479 ) ( ON-TABLE ?auto_18483 ) ( HOLDING ?auto_18480 ) ( CLEAR ?auto_18481 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18482 ?auto_18481 ?auto_18480 )
      ( MAKE-2PILE ?auto_18478 ?auto_18479 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18484 - BLOCK
      ?auto_18485 - BLOCK
    )
    :vars
    (
      ?auto_18489 - BLOCK
      ?auto_18486 - BLOCK
      ?auto_18488 - BLOCK
      ?auto_18487 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18484 ?auto_18485 ) ) ( not ( = ?auto_18484 ?auto_18489 ) ) ( not ( = ?auto_18485 ?auto_18489 ) ) ( ON-TABLE ?auto_18486 ) ( ON ?auto_18488 ?auto_18486 ) ( not ( = ?auto_18486 ?auto_18488 ) ) ( not ( = ?auto_18486 ?auto_18489 ) ) ( not ( = ?auto_18486 ?auto_18485 ) ) ( not ( = ?auto_18486 ?auto_18484 ) ) ( not ( = ?auto_18488 ?auto_18489 ) ) ( not ( = ?auto_18488 ?auto_18485 ) ) ( not ( = ?auto_18488 ?auto_18484 ) ) ( ON ?auto_18484 ?auto_18487 ) ( not ( = ?auto_18484 ?auto_18487 ) ) ( not ( = ?auto_18485 ?auto_18487 ) ) ( not ( = ?auto_18489 ?auto_18487 ) ) ( not ( = ?auto_18486 ?auto_18487 ) ) ( not ( = ?auto_18488 ?auto_18487 ) ) ( ON ?auto_18485 ?auto_18484 ) ( ON-TABLE ?auto_18487 ) ( CLEAR ?auto_18488 ) ( ON ?auto_18489 ?auto_18485 ) ( CLEAR ?auto_18489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18487 ?auto_18484 ?auto_18485 )
      ( MAKE-2PILE ?auto_18484 ?auto_18485 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18490 - BLOCK
      ?auto_18491 - BLOCK
    )
    :vars
    (
      ?auto_18495 - BLOCK
      ?auto_18494 - BLOCK
      ?auto_18493 - BLOCK
      ?auto_18492 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18490 ?auto_18491 ) ) ( not ( = ?auto_18490 ?auto_18495 ) ) ( not ( = ?auto_18491 ?auto_18495 ) ) ( ON-TABLE ?auto_18494 ) ( not ( = ?auto_18494 ?auto_18493 ) ) ( not ( = ?auto_18494 ?auto_18495 ) ) ( not ( = ?auto_18494 ?auto_18491 ) ) ( not ( = ?auto_18494 ?auto_18490 ) ) ( not ( = ?auto_18493 ?auto_18495 ) ) ( not ( = ?auto_18493 ?auto_18491 ) ) ( not ( = ?auto_18493 ?auto_18490 ) ) ( ON ?auto_18490 ?auto_18492 ) ( not ( = ?auto_18490 ?auto_18492 ) ) ( not ( = ?auto_18491 ?auto_18492 ) ) ( not ( = ?auto_18495 ?auto_18492 ) ) ( not ( = ?auto_18494 ?auto_18492 ) ) ( not ( = ?auto_18493 ?auto_18492 ) ) ( ON ?auto_18491 ?auto_18490 ) ( ON-TABLE ?auto_18492 ) ( ON ?auto_18495 ?auto_18491 ) ( CLEAR ?auto_18495 ) ( HOLDING ?auto_18493 ) ( CLEAR ?auto_18494 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18494 ?auto_18493 )
      ( MAKE-2PILE ?auto_18490 ?auto_18491 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18496 - BLOCK
      ?auto_18497 - BLOCK
    )
    :vars
    (
      ?auto_18501 - BLOCK
      ?auto_18498 - BLOCK
      ?auto_18500 - BLOCK
      ?auto_18499 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18496 ?auto_18497 ) ) ( not ( = ?auto_18496 ?auto_18501 ) ) ( not ( = ?auto_18497 ?auto_18501 ) ) ( ON-TABLE ?auto_18498 ) ( not ( = ?auto_18498 ?auto_18500 ) ) ( not ( = ?auto_18498 ?auto_18501 ) ) ( not ( = ?auto_18498 ?auto_18497 ) ) ( not ( = ?auto_18498 ?auto_18496 ) ) ( not ( = ?auto_18500 ?auto_18501 ) ) ( not ( = ?auto_18500 ?auto_18497 ) ) ( not ( = ?auto_18500 ?auto_18496 ) ) ( ON ?auto_18496 ?auto_18499 ) ( not ( = ?auto_18496 ?auto_18499 ) ) ( not ( = ?auto_18497 ?auto_18499 ) ) ( not ( = ?auto_18501 ?auto_18499 ) ) ( not ( = ?auto_18498 ?auto_18499 ) ) ( not ( = ?auto_18500 ?auto_18499 ) ) ( ON ?auto_18497 ?auto_18496 ) ( ON-TABLE ?auto_18499 ) ( ON ?auto_18501 ?auto_18497 ) ( CLEAR ?auto_18498 ) ( ON ?auto_18500 ?auto_18501 ) ( CLEAR ?auto_18500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18499 ?auto_18496 ?auto_18497 ?auto_18501 )
      ( MAKE-2PILE ?auto_18496 ?auto_18497 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18502 - BLOCK
      ?auto_18503 - BLOCK
    )
    :vars
    (
      ?auto_18506 - BLOCK
      ?auto_18504 - BLOCK
      ?auto_18505 - BLOCK
      ?auto_18507 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18502 ?auto_18503 ) ) ( not ( = ?auto_18502 ?auto_18506 ) ) ( not ( = ?auto_18503 ?auto_18506 ) ) ( not ( = ?auto_18504 ?auto_18505 ) ) ( not ( = ?auto_18504 ?auto_18506 ) ) ( not ( = ?auto_18504 ?auto_18503 ) ) ( not ( = ?auto_18504 ?auto_18502 ) ) ( not ( = ?auto_18505 ?auto_18506 ) ) ( not ( = ?auto_18505 ?auto_18503 ) ) ( not ( = ?auto_18505 ?auto_18502 ) ) ( ON ?auto_18502 ?auto_18507 ) ( not ( = ?auto_18502 ?auto_18507 ) ) ( not ( = ?auto_18503 ?auto_18507 ) ) ( not ( = ?auto_18506 ?auto_18507 ) ) ( not ( = ?auto_18504 ?auto_18507 ) ) ( not ( = ?auto_18505 ?auto_18507 ) ) ( ON ?auto_18503 ?auto_18502 ) ( ON-TABLE ?auto_18507 ) ( ON ?auto_18506 ?auto_18503 ) ( ON ?auto_18505 ?auto_18506 ) ( CLEAR ?auto_18505 ) ( HOLDING ?auto_18504 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18504 )
      ( MAKE-2PILE ?auto_18502 ?auto_18503 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18508 - BLOCK
      ?auto_18509 - BLOCK
    )
    :vars
    (
      ?auto_18510 - BLOCK
      ?auto_18512 - BLOCK
      ?auto_18511 - BLOCK
      ?auto_18513 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18508 ?auto_18509 ) ) ( not ( = ?auto_18508 ?auto_18510 ) ) ( not ( = ?auto_18509 ?auto_18510 ) ) ( not ( = ?auto_18512 ?auto_18511 ) ) ( not ( = ?auto_18512 ?auto_18510 ) ) ( not ( = ?auto_18512 ?auto_18509 ) ) ( not ( = ?auto_18512 ?auto_18508 ) ) ( not ( = ?auto_18511 ?auto_18510 ) ) ( not ( = ?auto_18511 ?auto_18509 ) ) ( not ( = ?auto_18511 ?auto_18508 ) ) ( ON ?auto_18508 ?auto_18513 ) ( not ( = ?auto_18508 ?auto_18513 ) ) ( not ( = ?auto_18509 ?auto_18513 ) ) ( not ( = ?auto_18510 ?auto_18513 ) ) ( not ( = ?auto_18512 ?auto_18513 ) ) ( not ( = ?auto_18511 ?auto_18513 ) ) ( ON ?auto_18509 ?auto_18508 ) ( ON-TABLE ?auto_18513 ) ( ON ?auto_18510 ?auto_18509 ) ( ON ?auto_18511 ?auto_18510 ) ( ON ?auto_18512 ?auto_18511 ) ( CLEAR ?auto_18512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_18513 ?auto_18508 ?auto_18509 ?auto_18510 ?auto_18511 )
      ( MAKE-2PILE ?auto_18508 ?auto_18509 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18516 - BLOCK
      ?auto_18517 - BLOCK
    )
    :vars
    (
      ?auto_18518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18518 ?auto_18517 ) ( CLEAR ?auto_18518 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18516 ) ( ON ?auto_18517 ?auto_18516 ) ( not ( = ?auto_18516 ?auto_18517 ) ) ( not ( = ?auto_18516 ?auto_18518 ) ) ( not ( = ?auto_18517 ?auto_18518 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18518 ?auto_18517 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18519 - BLOCK
      ?auto_18520 - BLOCK
    )
    :vars
    (
      ?auto_18521 - BLOCK
      ?auto_18522 - BLOCK
      ?auto_18523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18521 ?auto_18520 ) ( CLEAR ?auto_18521 ) ( ON-TABLE ?auto_18519 ) ( ON ?auto_18520 ?auto_18519 ) ( not ( = ?auto_18519 ?auto_18520 ) ) ( not ( = ?auto_18519 ?auto_18521 ) ) ( not ( = ?auto_18520 ?auto_18521 ) ) ( HOLDING ?auto_18522 ) ( CLEAR ?auto_18523 ) ( not ( = ?auto_18519 ?auto_18522 ) ) ( not ( = ?auto_18519 ?auto_18523 ) ) ( not ( = ?auto_18520 ?auto_18522 ) ) ( not ( = ?auto_18520 ?auto_18523 ) ) ( not ( = ?auto_18521 ?auto_18522 ) ) ( not ( = ?auto_18521 ?auto_18523 ) ) ( not ( = ?auto_18522 ?auto_18523 ) ) )
    :subtasks
    ( ( !STACK ?auto_18522 ?auto_18523 )
      ( MAKE-2PILE ?auto_18519 ?auto_18520 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18524 - BLOCK
      ?auto_18525 - BLOCK
    )
    :vars
    (
      ?auto_18528 - BLOCK
      ?auto_18527 - BLOCK
      ?auto_18526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18528 ?auto_18525 ) ( ON-TABLE ?auto_18524 ) ( ON ?auto_18525 ?auto_18524 ) ( not ( = ?auto_18524 ?auto_18525 ) ) ( not ( = ?auto_18524 ?auto_18528 ) ) ( not ( = ?auto_18525 ?auto_18528 ) ) ( CLEAR ?auto_18527 ) ( not ( = ?auto_18524 ?auto_18526 ) ) ( not ( = ?auto_18524 ?auto_18527 ) ) ( not ( = ?auto_18525 ?auto_18526 ) ) ( not ( = ?auto_18525 ?auto_18527 ) ) ( not ( = ?auto_18528 ?auto_18526 ) ) ( not ( = ?auto_18528 ?auto_18527 ) ) ( not ( = ?auto_18526 ?auto_18527 ) ) ( ON ?auto_18526 ?auto_18528 ) ( CLEAR ?auto_18526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18524 ?auto_18525 ?auto_18528 )
      ( MAKE-2PILE ?auto_18524 ?auto_18525 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18529 - BLOCK
      ?auto_18530 - BLOCK
    )
    :vars
    (
      ?auto_18532 - BLOCK
      ?auto_18533 - BLOCK
      ?auto_18531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18532 ?auto_18530 ) ( ON-TABLE ?auto_18529 ) ( ON ?auto_18530 ?auto_18529 ) ( not ( = ?auto_18529 ?auto_18530 ) ) ( not ( = ?auto_18529 ?auto_18532 ) ) ( not ( = ?auto_18530 ?auto_18532 ) ) ( not ( = ?auto_18529 ?auto_18533 ) ) ( not ( = ?auto_18529 ?auto_18531 ) ) ( not ( = ?auto_18530 ?auto_18533 ) ) ( not ( = ?auto_18530 ?auto_18531 ) ) ( not ( = ?auto_18532 ?auto_18533 ) ) ( not ( = ?auto_18532 ?auto_18531 ) ) ( not ( = ?auto_18533 ?auto_18531 ) ) ( ON ?auto_18533 ?auto_18532 ) ( CLEAR ?auto_18533 ) ( HOLDING ?auto_18531 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18531 )
      ( MAKE-2PILE ?auto_18529 ?auto_18530 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18534 - BLOCK
      ?auto_18535 - BLOCK
    )
    :vars
    (
      ?auto_18537 - BLOCK
      ?auto_18538 - BLOCK
      ?auto_18536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18537 ?auto_18535 ) ( ON-TABLE ?auto_18534 ) ( ON ?auto_18535 ?auto_18534 ) ( not ( = ?auto_18534 ?auto_18535 ) ) ( not ( = ?auto_18534 ?auto_18537 ) ) ( not ( = ?auto_18535 ?auto_18537 ) ) ( not ( = ?auto_18534 ?auto_18538 ) ) ( not ( = ?auto_18534 ?auto_18536 ) ) ( not ( = ?auto_18535 ?auto_18538 ) ) ( not ( = ?auto_18535 ?auto_18536 ) ) ( not ( = ?auto_18537 ?auto_18538 ) ) ( not ( = ?auto_18537 ?auto_18536 ) ) ( not ( = ?auto_18538 ?auto_18536 ) ) ( ON ?auto_18538 ?auto_18537 ) ( ON ?auto_18536 ?auto_18538 ) ( CLEAR ?auto_18536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18534 ?auto_18535 ?auto_18537 ?auto_18538 )
      ( MAKE-2PILE ?auto_18534 ?auto_18535 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18539 - BLOCK
      ?auto_18540 - BLOCK
    )
    :vars
    (
      ?auto_18541 - BLOCK
      ?auto_18542 - BLOCK
      ?auto_18543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18541 ?auto_18540 ) ( ON-TABLE ?auto_18539 ) ( ON ?auto_18540 ?auto_18539 ) ( not ( = ?auto_18539 ?auto_18540 ) ) ( not ( = ?auto_18539 ?auto_18541 ) ) ( not ( = ?auto_18540 ?auto_18541 ) ) ( not ( = ?auto_18539 ?auto_18542 ) ) ( not ( = ?auto_18539 ?auto_18543 ) ) ( not ( = ?auto_18540 ?auto_18542 ) ) ( not ( = ?auto_18540 ?auto_18543 ) ) ( not ( = ?auto_18541 ?auto_18542 ) ) ( not ( = ?auto_18541 ?auto_18543 ) ) ( not ( = ?auto_18542 ?auto_18543 ) ) ( ON ?auto_18542 ?auto_18541 ) ( HOLDING ?auto_18543 ) ( CLEAR ?auto_18542 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_18539 ?auto_18540 ?auto_18541 ?auto_18542 ?auto_18543 )
      ( MAKE-2PILE ?auto_18539 ?auto_18540 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18544 - BLOCK
      ?auto_18545 - BLOCK
    )
    :vars
    (
      ?auto_18546 - BLOCK
      ?auto_18548 - BLOCK
      ?auto_18547 - BLOCK
      ?auto_18549 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18546 ?auto_18545 ) ( ON-TABLE ?auto_18544 ) ( ON ?auto_18545 ?auto_18544 ) ( not ( = ?auto_18544 ?auto_18545 ) ) ( not ( = ?auto_18544 ?auto_18546 ) ) ( not ( = ?auto_18545 ?auto_18546 ) ) ( not ( = ?auto_18544 ?auto_18548 ) ) ( not ( = ?auto_18544 ?auto_18547 ) ) ( not ( = ?auto_18545 ?auto_18548 ) ) ( not ( = ?auto_18545 ?auto_18547 ) ) ( not ( = ?auto_18546 ?auto_18548 ) ) ( not ( = ?auto_18546 ?auto_18547 ) ) ( not ( = ?auto_18548 ?auto_18547 ) ) ( ON ?auto_18548 ?auto_18546 ) ( CLEAR ?auto_18548 ) ( ON ?auto_18547 ?auto_18549 ) ( CLEAR ?auto_18547 ) ( HAND-EMPTY ) ( not ( = ?auto_18544 ?auto_18549 ) ) ( not ( = ?auto_18545 ?auto_18549 ) ) ( not ( = ?auto_18546 ?auto_18549 ) ) ( not ( = ?auto_18548 ?auto_18549 ) ) ( not ( = ?auto_18547 ?auto_18549 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18547 ?auto_18549 )
      ( MAKE-2PILE ?auto_18544 ?auto_18545 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18550 - BLOCK
      ?auto_18551 - BLOCK
    )
    :vars
    (
      ?auto_18553 - BLOCK
      ?auto_18555 - BLOCK
      ?auto_18554 - BLOCK
      ?auto_18552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18553 ?auto_18551 ) ( ON-TABLE ?auto_18550 ) ( ON ?auto_18551 ?auto_18550 ) ( not ( = ?auto_18550 ?auto_18551 ) ) ( not ( = ?auto_18550 ?auto_18553 ) ) ( not ( = ?auto_18551 ?auto_18553 ) ) ( not ( = ?auto_18550 ?auto_18555 ) ) ( not ( = ?auto_18550 ?auto_18554 ) ) ( not ( = ?auto_18551 ?auto_18555 ) ) ( not ( = ?auto_18551 ?auto_18554 ) ) ( not ( = ?auto_18553 ?auto_18555 ) ) ( not ( = ?auto_18553 ?auto_18554 ) ) ( not ( = ?auto_18555 ?auto_18554 ) ) ( ON ?auto_18554 ?auto_18552 ) ( CLEAR ?auto_18554 ) ( not ( = ?auto_18550 ?auto_18552 ) ) ( not ( = ?auto_18551 ?auto_18552 ) ) ( not ( = ?auto_18553 ?auto_18552 ) ) ( not ( = ?auto_18555 ?auto_18552 ) ) ( not ( = ?auto_18554 ?auto_18552 ) ) ( HOLDING ?auto_18555 ) ( CLEAR ?auto_18553 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18550 ?auto_18551 ?auto_18553 ?auto_18555 )
      ( MAKE-2PILE ?auto_18550 ?auto_18551 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18556 - BLOCK
      ?auto_18557 - BLOCK
    )
    :vars
    (
      ?auto_18560 - BLOCK
      ?auto_18558 - BLOCK
      ?auto_18561 - BLOCK
      ?auto_18559 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18560 ?auto_18557 ) ( ON-TABLE ?auto_18556 ) ( ON ?auto_18557 ?auto_18556 ) ( not ( = ?auto_18556 ?auto_18557 ) ) ( not ( = ?auto_18556 ?auto_18560 ) ) ( not ( = ?auto_18557 ?auto_18560 ) ) ( not ( = ?auto_18556 ?auto_18558 ) ) ( not ( = ?auto_18556 ?auto_18561 ) ) ( not ( = ?auto_18557 ?auto_18558 ) ) ( not ( = ?auto_18557 ?auto_18561 ) ) ( not ( = ?auto_18560 ?auto_18558 ) ) ( not ( = ?auto_18560 ?auto_18561 ) ) ( not ( = ?auto_18558 ?auto_18561 ) ) ( ON ?auto_18561 ?auto_18559 ) ( not ( = ?auto_18556 ?auto_18559 ) ) ( not ( = ?auto_18557 ?auto_18559 ) ) ( not ( = ?auto_18560 ?auto_18559 ) ) ( not ( = ?auto_18558 ?auto_18559 ) ) ( not ( = ?auto_18561 ?auto_18559 ) ) ( CLEAR ?auto_18560 ) ( ON ?auto_18558 ?auto_18561 ) ( CLEAR ?auto_18558 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18559 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18559 ?auto_18561 )
      ( MAKE-2PILE ?auto_18556 ?auto_18557 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18574 - BLOCK
      ?auto_18575 - BLOCK
    )
    :vars
    (
      ?auto_18577 - BLOCK
      ?auto_18579 - BLOCK
      ?auto_18578 - BLOCK
      ?auto_18576 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18574 ) ( not ( = ?auto_18574 ?auto_18575 ) ) ( not ( = ?auto_18574 ?auto_18577 ) ) ( not ( = ?auto_18575 ?auto_18577 ) ) ( not ( = ?auto_18574 ?auto_18579 ) ) ( not ( = ?auto_18574 ?auto_18578 ) ) ( not ( = ?auto_18575 ?auto_18579 ) ) ( not ( = ?auto_18575 ?auto_18578 ) ) ( not ( = ?auto_18577 ?auto_18579 ) ) ( not ( = ?auto_18577 ?auto_18578 ) ) ( not ( = ?auto_18579 ?auto_18578 ) ) ( ON ?auto_18578 ?auto_18576 ) ( not ( = ?auto_18574 ?auto_18576 ) ) ( not ( = ?auto_18575 ?auto_18576 ) ) ( not ( = ?auto_18577 ?auto_18576 ) ) ( not ( = ?auto_18579 ?auto_18576 ) ) ( not ( = ?auto_18578 ?auto_18576 ) ) ( ON ?auto_18579 ?auto_18578 ) ( ON-TABLE ?auto_18576 ) ( ON ?auto_18577 ?auto_18579 ) ( CLEAR ?auto_18577 ) ( HOLDING ?auto_18575 ) ( CLEAR ?auto_18574 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18574 ?auto_18575 ?auto_18577 )
      ( MAKE-2PILE ?auto_18574 ?auto_18575 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18580 - BLOCK
      ?auto_18581 - BLOCK
    )
    :vars
    (
      ?auto_18582 - BLOCK
      ?auto_18583 - BLOCK
      ?auto_18584 - BLOCK
      ?auto_18585 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18580 ) ( not ( = ?auto_18580 ?auto_18581 ) ) ( not ( = ?auto_18580 ?auto_18582 ) ) ( not ( = ?auto_18581 ?auto_18582 ) ) ( not ( = ?auto_18580 ?auto_18583 ) ) ( not ( = ?auto_18580 ?auto_18584 ) ) ( not ( = ?auto_18581 ?auto_18583 ) ) ( not ( = ?auto_18581 ?auto_18584 ) ) ( not ( = ?auto_18582 ?auto_18583 ) ) ( not ( = ?auto_18582 ?auto_18584 ) ) ( not ( = ?auto_18583 ?auto_18584 ) ) ( ON ?auto_18584 ?auto_18585 ) ( not ( = ?auto_18580 ?auto_18585 ) ) ( not ( = ?auto_18581 ?auto_18585 ) ) ( not ( = ?auto_18582 ?auto_18585 ) ) ( not ( = ?auto_18583 ?auto_18585 ) ) ( not ( = ?auto_18584 ?auto_18585 ) ) ( ON ?auto_18583 ?auto_18584 ) ( ON-TABLE ?auto_18585 ) ( ON ?auto_18582 ?auto_18583 ) ( CLEAR ?auto_18580 ) ( ON ?auto_18581 ?auto_18582 ) ( CLEAR ?auto_18581 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18585 ?auto_18584 ?auto_18583 ?auto_18582 )
      ( MAKE-2PILE ?auto_18580 ?auto_18581 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18586 - BLOCK
      ?auto_18587 - BLOCK
    )
    :vars
    (
      ?auto_18589 - BLOCK
      ?auto_18590 - BLOCK
      ?auto_18588 - BLOCK
      ?auto_18591 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18586 ?auto_18587 ) ) ( not ( = ?auto_18586 ?auto_18589 ) ) ( not ( = ?auto_18587 ?auto_18589 ) ) ( not ( = ?auto_18586 ?auto_18590 ) ) ( not ( = ?auto_18586 ?auto_18588 ) ) ( not ( = ?auto_18587 ?auto_18590 ) ) ( not ( = ?auto_18587 ?auto_18588 ) ) ( not ( = ?auto_18589 ?auto_18590 ) ) ( not ( = ?auto_18589 ?auto_18588 ) ) ( not ( = ?auto_18590 ?auto_18588 ) ) ( ON ?auto_18588 ?auto_18591 ) ( not ( = ?auto_18586 ?auto_18591 ) ) ( not ( = ?auto_18587 ?auto_18591 ) ) ( not ( = ?auto_18589 ?auto_18591 ) ) ( not ( = ?auto_18590 ?auto_18591 ) ) ( not ( = ?auto_18588 ?auto_18591 ) ) ( ON ?auto_18590 ?auto_18588 ) ( ON-TABLE ?auto_18591 ) ( ON ?auto_18589 ?auto_18590 ) ( ON ?auto_18587 ?auto_18589 ) ( CLEAR ?auto_18587 ) ( HOLDING ?auto_18586 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18586 )
      ( MAKE-2PILE ?auto_18586 ?auto_18587 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18592 - BLOCK
      ?auto_18593 - BLOCK
    )
    :vars
    (
      ?auto_18596 - BLOCK
      ?auto_18597 - BLOCK
      ?auto_18594 - BLOCK
      ?auto_18595 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18592 ?auto_18593 ) ) ( not ( = ?auto_18592 ?auto_18596 ) ) ( not ( = ?auto_18593 ?auto_18596 ) ) ( not ( = ?auto_18592 ?auto_18597 ) ) ( not ( = ?auto_18592 ?auto_18594 ) ) ( not ( = ?auto_18593 ?auto_18597 ) ) ( not ( = ?auto_18593 ?auto_18594 ) ) ( not ( = ?auto_18596 ?auto_18597 ) ) ( not ( = ?auto_18596 ?auto_18594 ) ) ( not ( = ?auto_18597 ?auto_18594 ) ) ( ON ?auto_18594 ?auto_18595 ) ( not ( = ?auto_18592 ?auto_18595 ) ) ( not ( = ?auto_18593 ?auto_18595 ) ) ( not ( = ?auto_18596 ?auto_18595 ) ) ( not ( = ?auto_18597 ?auto_18595 ) ) ( not ( = ?auto_18594 ?auto_18595 ) ) ( ON ?auto_18597 ?auto_18594 ) ( ON-TABLE ?auto_18595 ) ( ON ?auto_18596 ?auto_18597 ) ( ON ?auto_18593 ?auto_18596 ) ( ON ?auto_18592 ?auto_18593 ) ( CLEAR ?auto_18592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_18595 ?auto_18594 ?auto_18597 ?auto_18596 ?auto_18593 )
      ( MAKE-2PILE ?auto_18592 ?auto_18593 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18601 - BLOCK
      ?auto_18602 - BLOCK
      ?auto_18603 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_18603 ) ( CLEAR ?auto_18602 ) ( ON-TABLE ?auto_18601 ) ( ON ?auto_18602 ?auto_18601 ) ( not ( = ?auto_18601 ?auto_18602 ) ) ( not ( = ?auto_18601 ?auto_18603 ) ) ( not ( = ?auto_18602 ?auto_18603 ) ) )
    :subtasks
    ( ( !STACK ?auto_18603 ?auto_18602 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18604 - BLOCK
      ?auto_18605 - BLOCK
      ?auto_18606 - BLOCK
    )
    :vars
    (
      ?auto_18607 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_18605 ) ( ON-TABLE ?auto_18604 ) ( ON ?auto_18605 ?auto_18604 ) ( not ( = ?auto_18604 ?auto_18605 ) ) ( not ( = ?auto_18604 ?auto_18606 ) ) ( not ( = ?auto_18605 ?auto_18606 ) ) ( ON ?auto_18606 ?auto_18607 ) ( CLEAR ?auto_18606 ) ( HAND-EMPTY ) ( not ( = ?auto_18604 ?auto_18607 ) ) ( not ( = ?auto_18605 ?auto_18607 ) ) ( not ( = ?auto_18606 ?auto_18607 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18606 ?auto_18607 )
      ( MAKE-3PILE ?auto_18604 ?auto_18605 ?auto_18606 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18608 - BLOCK
      ?auto_18609 - BLOCK
      ?auto_18610 - BLOCK
    )
    :vars
    (
      ?auto_18611 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18608 ) ( not ( = ?auto_18608 ?auto_18609 ) ) ( not ( = ?auto_18608 ?auto_18610 ) ) ( not ( = ?auto_18609 ?auto_18610 ) ) ( ON ?auto_18610 ?auto_18611 ) ( CLEAR ?auto_18610 ) ( not ( = ?auto_18608 ?auto_18611 ) ) ( not ( = ?auto_18609 ?auto_18611 ) ) ( not ( = ?auto_18610 ?auto_18611 ) ) ( HOLDING ?auto_18609 ) ( CLEAR ?auto_18608 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18608 ?auto_18609 )
      ( MAKE-3PILE ?auto_18608 ?auto_18609 ?auto_18610 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18612 - BLOCK
      ?auto_18613 - BLOCK
      ?auto_18614 - BLOCK
    )
    :vars
    (
      ?auto_18615 - BLOCK
      ?auto_18616 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18612 ) ( not ( = ?auto_18612 ?auto_18613 ) ) ( not ( = ?auto_18612 ?auto_18614 ) ) ( not ( = ?auto_18613 ?auto_18614 ) ) ( ON ?auto_18614 ?auto_18615 ) ( not ( = ?auto_18612 ?auto_18615 ) ) ( not ( = ?auto_18613 ?auto_18615 ) ) ( not ( = ?auto_18614 ?auto_18615 ) ) ( CLEAR ?auto_18612 ) ( ON ?auto_18613 ?auto_18614 ) ( CLEAR ?auto_18613 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18616 ) ( ON ?auto_18615 ?auto_18616 ) ( not ( = ?auto_18616 ?auto_18615 ) ) ( not ( = ?auto_18616 ?auto_18614 ) ) ( not ( = ?auto_18616 ?auto_18613 ) ) ( not ( = ?auto_18612 ?auto_18616 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18616 ?auto_18615 ?auto_18614 )
      ( MAKE-3PILE ?auto_18612 ?auto_18613 ?auto_18614 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18617 - BLOCK
      ?auto_18618 - BLOCK
      ?auto_18619 - BLOCK
    )
    :vars
    (
      ?auto_18621 - BLOCK
      ?auto_18620 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18617 ?auto_18618 ) ) ( not ( = ?auto_18617 ?auto_18619 ) ) ( not ( = ?auto_18618 ?auto_18619 ) ) ( ON ?auto_18619 ?auto_18621 ) ( not ( = ?auto_18617 ?auto_18621 ) ) ( not ( = ?auto_18618 ?auto_18621 ) ) ( not ( = ?auto_18619 ?auto_18621 ) ) ( ON ?auto_18618 ?auto_18619 ) ( CLEAR ?auto_18618 ) ( ON-TABLE ?auto_18620 ) ( ON ?auto_18621 ?auto_18620 ) ( not ( = ?auto_18620 ?auto_18621 ) ) ( not ( = ?auto_18620 ?auto_18619 ) ) ( not ( = ?auto_18620 ?auto_18618 ) ) ( not ( = ?auto_18617 ?auto_18620 ) ) ( HOLDING ?auto_18617 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18617 )
      ( MAKE-3PILE ?auto_18617 ?auto_18618 ?auto_18619 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18622 - BLOCK
      ?auto_18623 - BLOCK
      ?auto_18624 - BLOCK
    )
    :vars
    (
      ?auto_18626 - BLOCK
      ?auto_18625 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18622 ?auto_18623 ) ) ( not ( = ?auto_18622 ?auto_18624 ) ) ( not ( = ?auto_18623 ?auto_18624 ) ) ( ON ?auto_18624 ?auto_18626 ) ( not ( = ?auto_18622 ?auto_18626 ) ) ( not ( = ?auto_18623 ?auto_18626 ) ) ( not ( = ?auto_18624 ?auto_18626 ) ) ( ON ?auto_18623 ?auto_18624 ) ( ON-TABLE ?auto_18625 ) ( ON ?auto_18626 ?auto_18625 ) ( not ( = ?auto_18625 ?auto_18626 ) ) ( not ( = ?auto_18625 ?auto_18624 ) ) ( not ( = ?auto_18625 ?auto_18623 ) ) ( not ( = ?auto_18622 ?auto_18625 ) ) ( ON ?auto_18622 ?auto_18623 ) ( CLEAR ?auto_18622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18625 ?auto_18626 ?auto_18624 ?auto_18623 )
      ( MAKE-3PILE ?auto_18622 ?auto_18623 ?auto_18624 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18627 - BLOCK
      ?auto_18628 - BLOCK
      ?auto_18629 - BLOCK
    )
    :vars
    (
      ?auto_18630 - BLOCK
      ?auto_18631 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18627 ?auto_18628 ) ) ( not ( = ?auto_18627 ?auto_18629 ) ) ( not ( = ?auto_18628 ?auto_18629 ) ) ( ON ?auto_18629 ?auto_18630 ) ( not ( = ?auto_18627 ?auto_18630 ) ) ( not ( = ?auto_18628 ?auto_18630 ) ) ( not ( = ?auto_18629 ?auto_18630 ) ) ( ON ?auto_18628 ?auto_18629 ) ( ON-TABLE ?auto_18631 ) ( ON ?auto_18630 ?auto_18631 ) ( not ( = ?auto_18631 ?auto_18630 ) ) ( not ( = ?auto_18631 ?auto_18629 ) ) ( not ( = ?auto_18631 ?auto_18628 ) ) ( not ( = ?auto_18627 ?auto_18631 ) ) ( HOLDING ?auto_18627 ) ( CLEAR ?auto_18628 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_18631 ?auto_18630 ?auto_18629 ?auto_18628 ?auto_18627 )
      ( MAKE-3PILE ?auto_18627 ?auto_18628 ?auto_18629 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18632 - BLOCK
      ?auto_18633 - BLOCK
      ?auto_18634 - BLOCK
    )
    :vars
    (
      ?auto_18636 - BLOCK
      ?auto_18635 - BLOCK
      ?auto_18637 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18632 ?auto_18633 ) ) ( not ( = ?auto_18632 ?auto_18634 ) ) ( not ( = ?auto_18633 ?auto_18634 ) ) ( ON ?auto_18634 ?auto_18636 ) ( not ( = ?auto_18632 ?auto_18636 ) ) ( not ( = ?auto_18633 ?auto_18636 ) ) ( not ( = ?auto_18634 ?auto_18636 ) ) ( ON ?auto_18633 ?auto_18634 ) ( ON-TABLE ?auto_18635 ) ( ON ?auto_18636 ?auto_18635 ) ( not ( = ?auto_18635 ?auto_18636 ) ) ( not ( = ?auto_18635 ?auto_18634 ) ) ( not ( = ?auto_18635 ?auto_18633 ) ) ( not ( = ?auto_18632 ?auto_18635 ) ) ( CLEAR ?auto_18633 ) ( ON ?auto_18632 ?auto_18637 ) ( CLEAR ?auto_18632 ) ( HAND-EMPTY ) ( not ( = ?auto_18632 ?auto_18637 ) ) ( not ( = ?auto_18633 ?auto_18637 ) ) ( not ( = ?auto_18634 ?auto_18637 ) ) ( not ( = ?auto_18636 ?auto_18637 ) ) ( not ( = ?auto_18635 ?auto_18637 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18632 ?auto_18637 )
      ( MAKE-3PILE ?auto_18632 ?auto_18633 ?auto_18634 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18638 - BLOCK
      ?auto_18639 - BLOCK
      ?auto_18640 - BLOCK
    )
    :vars
    (
      ?auto_18642 - BLOCK
      ?auto_18643 - BLOCK
      ?auto_18641 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18638 ?auto_18639 ) ) ( not ( = ?auto_18638 ?auto_18640 ) ) ( not ( = ?auto_18639 ?auto_18640 ) ) ( ON ?auto_18640 ?auto_18642 ) ( not ( = ?auto_18638 ?auto_18642 ) ) ( not ( = ?auto_18639 ?auto_18642 ) ) ( not ( = ?auto_18640 ?auto_18642 ) ) ( ON-TABLE ?auto_18643 ) ( ON ?auto_18642 ?auto_18643 ) ( not ( = ?auto_18643 ?auto_18642 ) ) ( not ( = ?auto_18643 ?auto_18640 ) ) ( not ( = ?auto_18643 ?auto_18639 ) ) ( not ( = ?auto_18638 ?auto_18643 ) ) ( ON ?auto_18638 ?auto_18641 ) ( CLEAR ?auto_18638 ) ( not ( = ?auto_18638 ?auto_18641 ) ) ( not ( = ?auto_18639 ?auto_18641 ) ) ( not ( = ?auto_18640 ?auto_18641 ) ) ( not ( = ?auto_18642 ?auto_18641 ) ) ( not ( = ?auto_18643 ?auto_18641 ) ) ( HOLDING ?auto_18639 ) ( CLEAR ?auto_18640 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18643 ?auto_18642 ?auto_18640 ?auto_18639 )
      ( MAKE-3PILE ?auto_18638 ?auto_18639 ?auto_18640 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18644 - BLOCK
      ?auto_18645 - BLOCK
      ?auto_18646 - BLOCK
    )
    :vars
    (
      ?auto_18647 - BLOCK
      ?auto_18649 - BLOCK
      ?auto_18648 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18644 ?auto_18645 ) ) ( not ( = ?auto_18644 ?auto_18646 ) ) ( not ( = ?auto_18645 ?auto_18646 ) ) ( ON ?auto_18646 ?auto_18647 ) ( not ( = ?auto_18644 ?auto_18647 ) ) ( not ( = ?auto_18645 ?auto_18647 ) ) ( not ( = ?auto_18646 ?auto_18647 ) ) ( ON-TABLE ?auto_18649 ) ( ON ?auto_18647 ?auto_18649 ) ( not ( = ?auto_18649 ?auto_18647 ) ) ( not ( = ?auto_18649 ?auto_18646 ) ) ( not ( = ?auto_18649 ?auto_18645 ) ) ( not ( = ?auto_18644 ?auto_18649 ) ) ( ON ?auto_18644 ?auto_18648 ) ( not ( = ?auto_18644 ?auto_18648 ) ) ( not ( = ?auto_18645 ?auto_18648 ) ) ( not ( = ?auto_18646 ?auto_18648 ) ) ( not ( = ?auto_18647 ?auto_18648 ) ) ( not ( = ?auto_18649 ?auto_18648 ) ) ( CLEAR ?auto_18646 ) ( ON ?auto_18645 ?auto_18644 ) ( CLEAR ?auto_18645 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18648 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18648 ?auto_18644 )
      ( MAKE-3PILE ?auto_18644 ?auto_18645 ?auto_18646 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18650 - BLOCK
      ?auto_18651 - BLOCK
      ?auto_18652 - BLOCK
    )
    :vars
    (
      ?auto_18653 - BLOCK
      ?auto_18655 - BLOCK
      ?auto_18654 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18650 ?auto_18651 ) ) ( not ( = ?auto_18650 ?auto_18652 ) ) ( not ( = ?auto_18651 ?auto_18652 ) ) ( not ( = ?auto_18650 ?auto_18653 ) ) ( not ( = ?auto_18651 ?auto_18653 ) ) ( not ( = ?auto_18652 ?auto_18653 ) ) ( ON-TABLE ?auto_18655 ) ( ON ?auto_18653 ?auto_18655 ) ( not ( = ?auto_18655 ?auto_18653 ) ) ( not ( = ?auto_18655 ?auto_18652 ) ) ( not ( = ?auto_18655 ?auto_18651 ) ) ( not ( = ?auto_18650 ?auto_18655 ) ) ( ON ?auto_18650 ?auto_18654 ) ( not ( = ?auto_18650 ?auto_18654 ) ) ( not ( = ?auto_18651 ?auto_18654 ) ) ( not ( = ?auto_18652 ?auto_18654 ) ) ( not ( = ?auto_18653 ?auto_18654 ) ) ( not ( = ?auto_18655 ?auto_18654 ) ) ( ON ?auto_18651 ?auto_18650 ) ( CLEAR ?auto_18651 ) ( ON-TABLE ?auto_18654 ) ( HOLDING ?auto_18652 ) ( CLEAR ?auto_18653 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18655 ?auto_18653 ?auto_18652 )
      ( MAKE-3PILE ?auto_18650 ?auto_18651 ?auto_18652 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18656 - BLOCK
      ?auto_18657 - BLOCK
      ?auto_18658 - BLOCK
    )
    :vars
    (
      ?auto_18659 - BLOCK
      ?auto_18661 - BLOCK
      ?auto_18660 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18656 ?auto_18657 ) ) ( not ( = ?auto_18656 ?auto_18658 ) ) ( not ( = ?auto_18657 ?auto_18658 ) ) ( not ( = ?auto_18656 ?auto_18659 ) ) ( not ( = ?auto_18657 ?auto_18659 ) ) ( not ( = ?auto_18658 ?auto_18659 ) ) ( ON-TABLE ?auto_18661 ) ( ON ?auto_18659 ?auto_18661 ) ( not ( = ?auto_18661 ?auto_18659 ) ) ( not ( = ?auto_18661 ?auto_18658 ) ) ( not ( = ?auto_18661 ?auto_18657 ) ) ( not ( = ?auto_18656 ?auto_18661 ) ) ( ON ?auto_18656 ?auto_18660 ) ( not ( = ?auto_18656 ?auto_18660 ) ) ( not ( = ?auto_18657 ?auto_18660 ) ) ( not ( = ?auto_18658 ?auto_18660 ) ) ( not ( = ?auto_18659 ?auto_18660 ) ) ( not ( = ?auto_18661 ?auto_18660 ) ) ( ON ?auto_18657 ?auto_18656 ) ( ON-TABLE ?auto_18660 ) ( CLEAR ?auto_18659 ) ( ON ?auto_18658 ?auto_18657 ) ( CLEAR ?auto_18658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18660 ?auto_18656 ?auto_18657 )
      ( MAKE-3PILE ?auto_18656 ?auto_18657 ?auto_18658 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18662 - BLOCK
      ?auto_18663 - BLOCK
      ?auto_18664 - BLOCK
    )
    :vars
    (
      ?auto_18666 - BLOCK
      ?auto_18667 - BLOCK
      ?auto_18665 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18662 ?auto_18663 ) ) ( not ( = ?auto_18662 ?auto_18664 ) ) ( not ( = ?auto_18663 ?auto_18664 ) ) ( not ( = ?auto_18662 ?auto_18666 ) ) ( not ( = ?auto_18663 ?auto_18666 ) ) ( not ( = ?auto_18664 ?auto_18666 ) ) ( ON-TABLE ?auto_18667 ) ( not ( = ?auto_18667 ?auto_18666 ) ) ( not ( = ?auto_18667 ?auto_18664 ) ) ( not ( = ?auto_18667 ?auto_18663 ) ) ( not ( = ?auto_18662 ?auto_18667 ) ) ( ON ?auto_18662 ?auto_18665 ) ( not ( = ?auto_18662 ?auto_18665 ) ) ( not ( = ?auto_18663 ?auto_18665 ) ) ( not ( = ?auto_18664 ?auto_18665 ) ) ( not ( = ?auto_18666 ?auto_18665 ) ) ( not ( = ?auto_18667 ?auto_18665 ) ) ( ON ?auto_18663 ?auto_18662 ) ( ON-TABLE ?auto_18665 ) ( ON ?auto_18664 ?auto_18663 ) ( CLEAR ?auto_18664 ) ( HOLDING ?auto_18666 ) ( CLEAR ?auto_18667 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18667 ?auto_18666 )
      ( MAKE-3PILE ?auto_18662 ?auto_18663 ?auto_18664 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18668 - BLOCK
      ?auto_18669 - BLOCK
      ?auto_18670 - BLOCK
    )
    :vars
    (
      ?auto_18671 - BLOCK
      ?auto_18673 - BLOCK
      ?auto_18672 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18668 ?auto_18669 ) ) ( not ( = ?auto_18668 ?auto_18670 ) ) ( not ( = ?auto_18669 ?auto_18670 ) ) ( not ( = ?auto_18668 ?auto_18671 ) ) ( not ( = ?auto_18669 ?auto_18671 ) ) ( not ( = ?auto_18670 ?auto_18671 ) ) ( ON-TABLE ?auto_18673 ) ( not ( = ?auto_18673 ?auto_18671 ) ) ( not ( = ?auto_18673 ?auto_18670 ) ) ( not ( = ?auto_18673 ?auto_18669 ) ) ( not ( = ?auto_18668 ?auto_18673 ) ) ( ON ?auto_18668 ?auto_18672 ) ( not ( = ?auto_18668 ?auto_18672 ) ) ( not ( = ?auto_18669 ?auto_18672 ) ) ( not ( = ?auto_18670 ?auto_18672 ) ) ( not ( = ?auto_18671 ?auto_18672 ) ) ( not ( = ?auto_18673 ?auto_18672 ) ) ( ON ?auto_18669 ?auto_18668 ) ( ON-TABLE ?auto_18672 ) ( ON ?auto_18670 ?auto_18669 ) ( CLEAR ?auto_18673 ) ( ON ?auto_18671 ?auto_18670 ) ( CLEAR ?auto_18671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18672 ?auto_18668 ?auto_18669 ?auto_18670 )
      ( MAKE-3PILE ?auto_18668 ?auto_18669 ?auto_18670 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18674 - BLOCK
      ?auto_18675 - BLOCK
      ?auto_18676 - BLOCK
    )
    :vars
    (
      ?auto_18677 - BLOCK
      ?auto_18679 - BLOCK
      ?auto_18678 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18674 ?auto_18675 ) ) ( not ( = ?auto_18674 ?auto_18676 ) ) ( not ( = ?auto_18675 ?auto_18676 ) ) ( not ( = ?auto_18674 ?auto_18677 ) ) ( not ( = ?auto_18675 ?auto_18677 ) ) ( not ( = ?auto_18676 ?auto_18677 ) ) ( not ( = ?auto_18679 ?auto_18677 ) ) ( not ( = ?auto_18679 ?auto_18676 ) ) ( not ( = ?auto_18679 ?auto_18675 ) ) ( not ( = ?auto_18674 ?auto_18679 ) ) ( ON ?auto_18674 ?auto_18678 ) ( not ( = ?auto_18674 ?auto_18678 ) ) ( not ( = ?auto_18675 ?auto_18678 ) ) ( not ( = ?auto_18676 ?auto_18678 ) ) ( not ( = ?auto_18677 ?auto_18678 ) ) ( not ( = ?auto_18679 ?auto_18678 ) ) ( ON ?auto_18675 ?auto_18674 ) ( ON-TABLE ?auto_18678 ) ( ON ?auto_18676 ?auto_18675 ) ( ON ?auto_18677 ?auto_18676 ) ( CLEAR ?auto_18677 ) ( HOLDING ?auto_18679 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18679 )
      ( MAKE-3PILE ?auto_18674 ?auto_18675 ?auto_18676 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18680 - BLOCK
      ?auto_18681 - BLOCK
      ?auto_18682 - BLOCK
    )
    :vars
    (
      ?auto_18683 - BLOCK
      ?auto_18684 - BLOCK
      ?auto_18685 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18680 ?auto_18681 ) ) ( not ( = ?auto_18680 ?auto_18682 ) ) ( not ( = ?auto_18681 ?auto_18682 ) ) ( not ( = ?auto_18680 ?auto_18683 ) ) ( not ( = ?auto_18681 ?auto_18683 ) ) ( not ( = ?auto_18682 ?auto_18683 ) ) ( not ( = ?auto_18684 ?auto_18683 ) ) ( not ( = ?auto_18684 ?auto_18682 ) ) ( not ( = ?auto_18684 ?auto_18681 ) ) ( not ( = ?auto_18680 ?auto_18684 ) ) ( ON ?auto_18680 ?auto_18685 ) ( not ( = ?auto_18680 ?auto_18685 ) ) ( not ( = ?auto_18681 ?auto_18685 ) ) ( not ( = ?auto_18682 ?auto_18685 ) ) ( not ( = ?auto_18683 ?auto_18685 ) ) ( not ( = ?auto_18684 ?auto_18685 ) ) ( ON ?auto_18681 ?auto_18680 ) ( ON-TABLE ?auto_18685 ) ( ON ?auto_18682 ?auto_18681 ) ( ON ?auto_18683 ?auto_18682 ) ( ON ?auto_18684 ?auto_18683 ) ( CLEAR ?auto_18684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_18685 ?auto_18680 ?auto_18681 ?auto_18682 ?auto_18683 )
      ( MAKE-3PILE ?auto_18680 ?auto_18681 ?auto_18682 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18687 - BLOCK
    )
    :vars
    (
      ?auto_18688 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18688 ?auto_18687 ) ( CLEAR ?auto_18688 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18687 ) ( not ( = ?auto_18687 ?auto_18688 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18688 ?auto_18687 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18689 - BLOCK
    )
    :vars
    (
      ?auto_18690 - BLOCK
      ?auto_18691 - BLOCK
      ?auto_18692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18690 ?auto_18689 ) ( CLEAR ?auto_18690 ) ( ON-TABLE ?auto_18689 ) ( not ( = ?auto_18689 ?auto_18690 ) ) ( HOLDING ?auto_18691 ) ( CLEAR ?auto_18692 ) ( not ( = ?auto_18689 ?auto_18691 ) ) ( not ( = ?auto_18689 ?auto_18692 ) ) ( not ( = ?auto_18690 ?auto_18691 ) ) ( not ( = ?auto_18690 ?auto_18692 ) ) ( not ( = ?auto_18691 ?auto_18692 ) ) )
    :subtasks
    ( ( !STACK ?auto_18691 ?auto_18692 )
      ( MAKE-1PILE ?auto_18689 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18693 - BLOCK
    )
    :vars
    (
      ?auto_18696 - BLOCK
      ?auto_18695 - BLOCK
      ?auto_18694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18696 ?auto_18693 ) ( ON-TABLE ?auto_18693 ) ( not ( = ?auto_18693 ?auto_18696 ) ) ( CLEAR ?auto_18695 ) ( not ( = ?auto_18693 ?auto_18694 ) ) ( not ( = ?auto_18693 ?auto_18695 ) ) ( not ( = ?auto_18696 ?auto_18694 ) ) ( not ( = ?auto_18696 ?auto_18695 ) ) ( not ( = ?auto_18694 ?auto_18695 ) ) ( ON ?auto_18694 ?auto_18696 ) ( CLEAR ?auto_18694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18693 ?auto_18696 )
      ( MAKE-1PILE ?auto_18693 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18697 - BLOCK
    )
    :vars
    (
      ?auto_18698 - BLOCK
      ?auto_18699 - BLOCK
      ?auto_18700 - BLOCK
      ?auto_18701 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18698 ?auto_18697 ) ( ON-TABLE ?auto_18697 ) ( not ( = ?auto_18697 ?auto_18698 ) ) ( not ( = ?auto_18697 ?auto_18699 ) ) ( not ( = ?auto_18697 ?auto_18700 ) ) ( not ( = ?auto_18698 ?auto_18699 ) ) ( not ( = ?auto_18698 ?auto_18700 ) ) ( not ( = ?auto_18699 ?auto_18700 ) ) ( ON ?auto_18699 ?auto_18698 ) ( CLEAR ?auto_18699 ) ( HOLDING ?auto_18700 ) ( CLEAR ?auto_18701 ) ( ON-TABLE ?auto_18701 ) ( not ( = ?auto_18701 ?auto_18700 ) ) ( not ( = ?auto_18697 ?auto_18701 ) ) ( not ( = ?auto_18698 ?auto_18701 ) ) ( not ( = ?auto_18699 ?auto_18701 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18701 ?auto_18700 )
      ( MAKE-1PILE ?auto_18697 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18702 - BLOCK
    )
    :vars
    (
      ?auto_18705 - BLOCK
      ?auto_18703 - BLOCK
      ?auto_18704 - BLOCK
      ?auto_18706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18705 ?auto_18702 ) ( ON-TABLE ?auto_18702 ) ( not ( = ?auto_18702 ?auto_18705 ) ) ( not ( = ?auto_18702 ?auto_18703 ) ) ( not ( = ?auto_18702 ?auto_18704 ) ) ( not ( = ?auto_18705 ?auto_18703 ) ) ( not ( = ?auto_18705 ?auto_18704 ) ) ( not ( = ?auto_18703 ?auto_18704 ) ) ( ON ?auto_18703 ?auto_18705 ) ( CLEAR ?auto_18706 ) ( ON-TABLE ?auto_18706 ) ( not ( = ?auto_18706 ?auto_18704 ) ) ( not ( = ?auto_18702 ?auto_18706 ) ) ( not ( = ?auto_18705 ?auto_18706 ) ) ( not ( = ?auto_18703 ?auto_18706 ) ) ( ON ?auto_18704 ?auto_18703 ) ( CLEAR ?auto_18704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18702 ?auto_18705 ?auto_18703 )
      ( MAKE-1PILE ?auto_18702 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18707 - BLOCK
    )
    :vars
    (
      ?auto_18711 - BLOCK
      ?auto_18708 - BLOCK
      ?auto_18710 - BLOCK
      ?auto_18709 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18711 ?auto_18707 ) ( ON-TABLE ?auto_18707 ) ( not ( = ?auto_18707 ?auto_18711 ) ) ( not ( = ?auto_18707 ?auto_18708 ) ) ( not ( = ?auto_18707 ?auto_18710 ) ) ( not ( = ?auto_18711 ?auto_18708 ) ) ( not ( = ?auto_18711 ?auto_18710 ) ) ( not ( = ?auto_18708 ?auto_18710 ) ) ( ON ?auto_18708 ?auto_18711 ) ( not ( = ?auto_18709 ?auto_18710 ) ) ( not ( = ?auto_18707 ?auto_18709 ) ) ( not ( = ?auto_18711 ?auto_18709 ) ) ( not ( = ?auto_18708 ?auto_18709 ) ) ( ON ?auto_18710 ?auto_18708 ) ( CLEAR ?auto_18710 ) ( HOLDING ?auto_18709 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18709 )
      ( MAKE-1PILE ?auto_18707 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18712 - BLOCK
    )
    :vars
    (
      ?auto_18716 - BLOCK
      ?auto_18713 - BLOCK
      ?auto_18715 - BLOCK
      ?auto_18714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18716 ?auto_18712 ) ( ON-TABLE ?auto_18712 ) ( not ( = ?auto_18712 ?auto_18716 ) ) ( not ( = ?auto_18712 ?auto_18713 ) ) ( not ( = ?auto_18712 ?auto_18715 ) ) ( not ( = ?auto_18716 ?auto_18713 ) ) ( not ( = ?auto_18716 ?auto_18715 ) ) ( not ( = ?auto_18713 ?auto_18715 ) ) ( ON ?auto_18713 ?auto_18716 ) ( not ( = ?auto_18714 ?auto_18715 ) ) ( not ( = ?auto_18712 ?auto_18714 ) ) ( not ( = ?auto_18716 ?auto_18714 ) ) ( not ( = ?auto_18713 ?auto_18714 ) ) ( ON ?auto_18715 ?auto_18713 ) ( ON ?auto_18714 ?auto_18715 ) ( CLEAR ?auto_18714 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18712 ?auto_18716 ?auto_18713 ?auto_18715 )
      ( MAKE-1PILE ?auto_18712 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18717 - BLOCK
    )
    :vars
    (
      ?auto_18718 - BLOCK
      ?auto_18719 - BLOCK
      ?auto_18721 - BLOCK
      ?auto_18720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18718 ?auto_18717 ) ( ON-TABLE ?auto_18717 ) ( not ( = ?auto_18717 ?auto_18718 ) ) ( not ( = ?auto_18717 ?auto_18719 ) ) ( not ( = ?auto_18717 ?auto_18721 ) ) ( not ( = ?auto_18718 ?auto_18719 ) ) ( not ( = ?auto_18718 ?auto_18721 ) ) ( not ( = ?auto_18719 ?auto_18721 ) ) ( ON ?auto_18719 ?auto_18718 ) ( not ( = ?auto_18720 ?auto_18721 ) ) ( not ( = ?auto_18717 ?auto_18720 ) ) ( not ( = ?auto_18718 ?auto_18720 ) ) ( not ( = ?auto_18719 ?auto_18720 ) ) ( ON ?auto_18721 ?auto_18719 ) ( HOLDING ?auto_18720 ) ( CLEAR ?auto_18721 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_18717 ?auto_18718 ?auto_18719 ?auto_18721 ?auto_18720 )
      ( MAKE-1PILE ?auto_18717 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18722 - BLOCK
    )
    :vars
    (
      ?auto_18723 - BLOCK
      ?auto_18726 - BLOCK
      ?auto_18724 - BLOCK
      ?auto_18725 - BLOCK
      ?auto_18727 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18723 ?auto_18722 ) ( ON-TABLE ?auto_18722 ) ( not ( = ?auto_18722 ?auto_18723 ) ) ( not ( = ?auto_18722 ?auto_18726 ) ) ( not ( = ?auto_18722 ?auto_18724 ) ) ( not ( = ?auto_18723 ?auto_18726 ) ) ( not ( = ?auto_18723 ?auto_18724 ) ) ( not ( = ?auto_18726 ?auto_18724 ) ) ( ON ?auto_18726 ?auto_18723 ) ( not ( = ?auto_18725 ?auto_18724 ) ) ( not ( = ?auto_18722 ?auto_18725 ) ) ( not ( = ?auto_18723 ?auto_18725 ) ) ( not ( = ?auto_18726 ?auto_18725 ) ) ( ON ?auto_18724 ?auto_18726 ) ( CLEAR ?auto_18724 ) ( ON ?auto_18725 ?auto_18727 ) ( CLEAR ?auto_18725 ) ( HAND-EMPTY ) ( not ( = ?auto_18722 ?auto_18727 ) ) ( not ( = ?auto_18723 ?auto_18727 ) ) ( not ( = ?auto_18726 ?auto_18727 ) ) ( not ( = ?auto_18724 ?auto_18727 ) ) ( not ( = ?auto_18725 ?auto_18727 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18725 ?auto_18727 )
      ( MAKE-1PILE ?auto_18722 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18728 - BLOCK
    )
    :vars
    (
      ?auto_18733 - BLOCK
      ?auto_18730 - BLOCK
      ?auto_18732 - BLOCK
      ?auto_18731 - BLOCK
      ?auto_18729 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18733 ?auto_18728 ) ( ON-TABLE ?auto_18728 ) ( not ( = ?auto_18728 ?auto_18733 ) ) ( not ( = ?auto_18728 ?auto_18730 ) ) ( not ( = ?auto_18728 ?auto_18732 ) ) ( not ( = ?auto_18733 ?auto_18730 ) ) ( not ( = ?auto_18733 ?auto_18732 ) ) ( not ( = ?auto_18730 ?auto_18732 ) ) ( ON ?auto_18730 ?auto_18733 ) ( not ( = ?auto_18731 ?auto_18732 ) ) ( not ( = ?auto_18728 ?auto_18731 ) ) ( not ( = ?auto_18733 ?auto_18731 ) ) ( not ( = ?auto_18730 ?auto_18731 ) ) ( ON ?auto_18731 ?auto_18729 ) ( CLEAR ?auto_18731 ) ( not ( = ?auto_18728 ?auto_18729 ) ) ( not ( = ?auto_18733 ?auto_18729 ) ) ( not ( = ?auto_18730 ?auto_18729 ) ) ( not ( = ?auto_18732 ?auto_18729 ) ) ( not ( = ?auto_18731 ?auto_18729 ) ) ( HOLDING ?auto_18732 ) ( CLEAR ?auto_18730 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18728 ?auto_18733 ?auto_18730 ?auto_18732 )
      ( MAKE-1PILE ?auto_18728 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18734 - BLOCK
    )
    :vars
    (
      ?auto_18735 - BLOCK
      ?auto_18737 - BLOCK
      ?auto_18739 - BLOCK
      ?auto_18738 - BLOCK
      ?auto_18736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18735 ?auto_18734 ) ( ON-TABLE ?auto_18734 ) ( not ( = ?auto_18734 ?auto_18735 ) ) ( not ( = ?auto_18734 ?auto_18737 ) ) ( not ( = ?auto_18734 ?auto_18739 ) ) ( not ( = ?auto_18735 ?auto_18737 ) ) ( not ( = ?auto_18735 ?auto_18739 ) ) ( not ( = ?auto_18737 ?auto_18739 ) ) ( ON ?auto_18737 ?auto_18735 ) ( not ( = ?auto_18738 ?auto_18739 ) ) ( not ( = ?auto_18734 ?auto_18738 ) ) ( not ( = ?auto_18735 ?auto_18738 ) ) ( not ( = ?auto_18737 ?auto_18738 ) ) ( ON ?auto_18738 ?auto_18736 ) ( not ( = ?auto_18734 ?auto_18736 ) ) ( not ( = ?auto_18735 ?auto_18736 ) ) ( not ( = ?auto_18737 ?auto_18736 ) ) ( not ( = ?auto_18739 ?auto_18736 ) ) ( not ( = ?auto_18738 ?auto_18736 ) ) ( CLEAR ?auto_18737 ) ( ON ?auto_18739 ?auto_18738 ) ( CLEAR ?auto_18739 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18736 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18736 ?auto_18738 )
      ( MAKE-1PILE ?auto_18734 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18740 - BLOCK
    )
    :vars
    (
      ?auto_18741 - BLOCK
      ?auto_18745 - BLOCK
      ?auto_18742 - BLOCK
      ?auto_18743 - BLOCK
      ?auto_18744 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18741 ?auto_18740 ) ( ON-TABLE ?auto_18740 ) ( not ( = ?auto_18740 ?auto_18741 ) ) ( not ( = ?auto_18740 ?auto_18745 ) ) ( not ( = ?auto_18740 ?auto_18742 ) ) ( not ( = ?auto_18741 ?auto_18745 ) ) ( not ( = ?auto_18741 ?auto_18742 ) ) ( not ( = ?auto_18745 ?auto_18742 ) ) ( not ( = ?auto_18743 ?auto_18742 ) ) ( not ( = ?auto_18740 ?auto_18743 ) ) ( not ( = ?auto_18741 ?auto_18743 ) ) ( not ( = ?auto_18745 ?auto_18743 ) ) ( ON ?auto_18743 ?auto_18744 ) ( not ( = ?auto_18740 ?auto_18744 ) ) ( not ( = ?auto_18741 ?auto_18744 ) ) ( not ( = ?auto_18745 ?auto_18744 ) ) ( not ( = ?auto_18742 ?auto_18744 ) ) ( not ( = ?auto_18743 ?auto_18744 ) ) ( ON ?auto_18742 ?auto_18743 ) ( CLEAR ?auto_18742 ) ( ON-TABLE ?auto_18744 ) ( HOLDING ?auto_18745 ) ( CLEAR ?auto_18741 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18740 ?auto_18741 ?auto_18745 )
      ( MAKE-1PILE ?auto_18740 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18746 - BLOCK
    )
    :vars
    (
      ?auto_18750 - BLOCK
      ?auto_18747 - BLOCK
      ?auto_18749 - BLOCK
      ?auto_18751 - BLOCK
      ?auto_18748 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18750 ?auto_18746 ) ( ON-TABLE ?auto_18746 ) ( not ( = ?auto_18746 ?auto_18750 ) ) ( not ( = ?auto_18746 ?auto_18747 ) ) ( not ( = ?auto_18746 ?auto_18749 ) ) ( not ( = ?auto_18750 ?auto_18747 ) ) ( not ( = ?auto_18750 ?auto_18749 ) ) ( not ( = ?auto_18747 ?auto_18749 ) ) ( not ( = ?auto_18751 ?auto_18749 ) ) ( not ( = ?auto_18746 ?auto_18751 ) ) ( not ( = ?auto_18750 ?auto_18751 ) ) ( not ( = ?auto_18747 ?auto_18751 ) ) ( ON ?auto_18751 ?auto_18748 ) ( not ( = ?auto_18746 ?auto_18748 ) ) ( not ( = ?auto_18750 ?auto_18748 ) ) ( not ( = ?auto_18747 ?auto_18748 ) ) ( not ( = ?auto_18749 ?auto_18748 ) ) ( not ( = ?auto_18751 ?auto_18748 ) ) ( ON ?auto_18749 ?auto_18751 ) ( ON-TABLE ?auto_18748 ) ( CLEAR ?auto_18750 ) ( ON ?auto_18747 ?auto_18749 ) ( CLEAR ?auto_18747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18748 ?auto_18751 ?auto_18749 )
      ( MAKE-1PILE ?auto_18746 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18764 - BLOCK
    )
    :vars
    (
      ?auto_18766 - BLOCK
      ?auto_18769 - BLOCK
      ?auto_18767 - BLOCK
      ?auto_18765 - BLOCK
      ?auto_18768 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18764 ?auto_18766 ) ) ( not ( = ?auto_18764 ?auto_18769 ) ) ( not ( = ?auto_18764 ?auto_18767 ) ) ( not ( = ?auto_18766 ?auto_18769 ) ) ( not ( = ?auto_18766 ?auto_18767 ) ) ( not ( = ?auto_18769 ?auto_18767 ) ) ( not ( = ?auto_18765 ?auto_18767 ) ) ( not ( = ?auto_18764 ?auto_18765 ) ) ( not ( = ?auto_18766 ?auto_18765 ) ) ( not ( = ?auto_18769 ?auto_18765 ) ) ( ON ?auto_18765 ?auto_18768 ) ( not ( = ?auto_18764 ?auto_18768 ) ) ( not ( = ?auto_18766 ?auto_18768 ) ) ( not ( = ?auto_18769 ?auto_18768 ) ) ( not ( = ?auto_18767 ?auto_18768 ) ) ( not ( = ?auto_18765 ?auto_18768 ) ) ( ON ?auto_18767 ?auto_18765 ) ( ON-TABLE ?auto_18768 ) ( ON ?auto_18769 ?auto_18767 ) ( ON ?auto_18766 ?auto_18769 ) ( CLEAR ?auto_18766 ) ( HOLDING ?auto_18764 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18764 ?auto_18766 )
      ( MAKE-1PILE ?auto_18764 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18770 - BLOCK
    )
    :vars
    (
      ?auto_18773 - BLOCK
      ?auto_18771 - BLOCK
      ?auto_18775 - BLOCK
      ?auto_18774 - BLOCK
      ?auto_18772 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18770 ?auto_18773 ) ) ( not ( = ?auto_18770 ?auto_18771 ) ) ( not ( = ?auto_18770 ?auto_18775 ) ) ( not ( = ?auto_18773 ?auto_18771 ) ) ( not ( = ?auto_18773 ?auto_18775 ) ) ( not ( = ?auto_18771 ?auto_18775 ) ) ( not ( = ?auto_18774 ?auto_18775 ) ) ( not ( = ?auto_18770 ?auto_18774 ) ) ( not ( = ?auto_18773 ?auto_18774 ) ) ( not ( = ?auto_18771 ?auto_18774 ) ) ( ON ?auto_18774 ?auto_18772 ) ( not ( = ?auto_18770 ?auto_18772 ) ) ( not ( = ?auto_18773 ?auto_18772 ) ) ( not ( = ?auto_18771 ?auto_18772 ) ) ( not ( = ?auto_18775 ?auto_18772 ) ) ( not ( = ?auto_18774 ?auto_18772 ) ) ( ON ?auto_18775 ?auto_18774 ) ( ON-TABLE ?auto_18772 ) ( ON ?auto_18771 ?auto_18775 ) ( ON ?auto_18773 ?auto_18771 ) ( ON ?auto_18770 ?auto_18773 ) ( CLEAR ?auto_18770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_18772 ?auto_18774 ?auto_18775 ?auto_18771 ?auto_18773 )
      ( MAKE-1PILE ?auto_18770 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18780 - BLOCK
      ?auto_18781 - BLOCK
      ?auto_18782 - BLOCK
      ?auto_18783 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_18783 ) ( CLEAR ?auto_18782 ) ( ON-TABLE ?auto_18780 ) ( ON ?auto_18781 ?auto_18780 ) ( ON ?auto_18782 ?auto_18781 ) ( not ( = ?auto_18780 ?auto_18781 ) ) ( not ( = ?auto_18780 ?auto_18782 ) ) ( not ( = ?auto_18780 ?auto_18783 ) ) ( not ( = ?auto_18781 ?auto_18782 ) ) ( not ( = ?auto_18781 ?auto_18783 ) ) ( not ( = ?auto_18782 ?auto_18783 ) ) )
    :subtasks
    ( ( !STACK ?auto_18783 ?auto_18782 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18784 - BLOCK
      ?auto_18785 - BLOCK
      ?auto_18786 - BLOCK
      ?auto_18787 - BLOCK
    )
    :vars
    (
      ?auto_18788 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_18786 ) ( ON-TABLE ?auto_18784 ) ( ON ?auto_18785 ?auto_18784 ) ( ON ?auto_18786 ?auto_18785 ) ( not ( = ?auto_18784 ?auto_18785 ) ) ( not ( = ?auto_18784 ?auto_18786 ) ) ( not ( = ?auto_18784 ?auto_18787 ) ) ( not ( = ?auto_18785 ?auto_18786 ) ) ( not ( = ?auto_18785 ?auto_18787 ) ) ( not ( = ?auto_18786 ?auto_18787 ) ) ( ON ?auto_18787 ?auto_18788 ) ( CLEAR ?auto_18787 ) ( HAND-EMPTY ) ( not ( = ?auto_18784 ?auto_18788 ) ) ( not ( = ?auto_18785 ?auto_18788 ) ) ( not ( = ?auto_18786 ?auto_18788 ) ) ( not ( = ?auto_18787 ?auto_18788 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18787 ?auto_18788 )
      ( MAKE-4PILE ?auto_18784 ?auto_18785 ?auto_18786 ?auto_18787 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18789 - BLOCK
      ?auto_18790 - BLOCK
      ?auto_18791 - BLOCK
      ?auto_18792 - BLOCK
    )
    :vars
    (
      ?auto_18793 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18789 ) ( ON ?auto_18790 ?auto_18789 ) ( not ( = ?auto_18789 ?auto_18790 ) ) ( not ( = ?auto_18789 ?auto_18791 ) ) ( not ( = ?auto_18789 ?auto_18792 ) ) ( not ( = ?auto_18790 ?auto_18791 ) ) ( not ( = ?auto_18790 ?auto_18792 ) ) ( not ( = ?auto_18791 ?auto_18792 ) ) ( ON ?auto_18792 ?auto_18793 ) ( CLEAR ?auto_18792 ) ( not ( = ?auto_18789 ?auto_18793 ) ) ( not ( = ?auto_18790 ?auto_18793 ) ) ( not ( = ?auto_18791 ?auto_18793 ) ) ( not ( = ?auto_18792 ?auto_18793 ) ) ( HOLDING ?auto_18791 ) ( CLEAR ?auto_18790 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18789 ?auto_18790 ?auto_18791 )
      ( MAKE-4PILE ?auto_18789 ?auto_18790 ?auto_18791 ?auto_18792 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18794 - BLOCK
      ?auto_18795 - BLOCK
      ?auto_18796 - BLOCK
      ?auto_18797 - BLOCK
    )
    :vars
    (
      ?auto_18798 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18794 ) ( ON ?auto_18795 ?auto_18794 ) ( not ( = ?auto_18794 ?auto_18795 ) ) ( not ( = ?auto_18794 ?auto_18796 ) ) ( not ( = ?auto_18794 ?auto_18797 ) ) ( not ( = ?auto_18795 ?auto_18796 ) ) ( not ( = ?auto_18795 ?auto_18797 ) ) ( not ( = ?auto_18796 ?auto_18797 ) ) ( ON ?auto_18797 ?auto_18798 ) ( not ( = ?auto_18794 ?auto_18798 ) ) ( not ( = ?auto_18795 ?auto_18798 ) ) ( not ( = ?auto_18796 ?auto_18798 ) ) ( not ( = ?auto_18797 ?auto_18798 ) ) ( CLEAR ?auto_18795 ) ( ON ?auto_18796 ?auto_18797 ) ( CLEAR ?auto_18796 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18798 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18798 ?auto_18797 )
      ( MAKE-4PILE ?auto_18794 ?auto_18795 ?auto_18796 ?auto_18797 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18799 - BLOCK
      ?auto_18800 - BLOCK
      ?auto_18801 - BLOCK
      ?auto_18802 - BLOCK
    )
    :vars
    (
      ?auto_18803 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18799 ) ( not ( = ?auto_18799 ?auto_18800 ) ) ( not ( = ?auto_18799 ?auto_18801 ) ) ( not ( = ?auto_18799 ?auto_18802 ) ) ( not ( = ?auto_18800 ?auto_18801 ) ) ( not ( = ?auto_18800 ?auto_18802 ) ) ( not ( = ?auto_18801 ?auto_18802 ) ) ( ON ?auto_18802 ?auto_18803 ) ( not ( = ?auto_18799 ?auto_18803 ) ) ( not ( = ?auto_18800 ?auto_18803 ) ) ( not ( = ?auto_18801 ?auto_18803 ) ) ( not ( = ?auto_18802 ?auto_18803 ) ) ( ON ?auto_18801 ?auto_18802 ) ( CLEAR ?auto_18801 ) ( ON-TABLE ?auto_18803 ) ( HOLDING ?auto_18800 ) ( CLEAR ?auto_18799 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18799 ?auto_18800 )
      ( MAKE-4PILE ?auto_18799 ?auto_18800 ?auto_18801 ?auto_18802 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18804 - BLOCK
      ?auto_18805 - BLOCK
      ?auto_18806 - BLOCK
      ?auto_18807 - BLOCK
    )
    :vars
    (
      ?auto_18808 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18804 ) ( not ( = ?auto_18804 ?auto_18805 ) ) ( not ( = ?auto_18804 ?auto_18806 ) ) ( not ( = ?auto_18804 ?auto_18807 ) ) ( not ( = ?auto_18805 ?auto_18806 ) ) ( not ( = ?auto_18805 ?auto_18807 ) ) ( not ( = ?auto_18806 ?auto_18807 ) ) ( ON ?auto_18807 ?auto_18808 ) ( not ( = ?auto_18804 ?auto_18808 ) ) ( not ( = ?auto_18805 ?auto_18808 ) ) ( not ( = ?auto_18806 ?auto_18808 ) ) ( not ( = ?auto_18807 ?auto_18808 ) ) ( ON ?auto_18806 ?auto_18807 ) ( ON-TABLE ?auto_18808 ) ( CLEAR ?auto_18804 ) ( ON ?auto_18805 ?auto_18806 ) ( CLEAR ?auto_18805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18808 ?auto_18807 ?auto_18806 )
      ( MAKE-4PILE ?auto_18804 ?auto_18805 ?auto_18806 ?auto_18807 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18809 - BLOCK
      ?auto_18810 - BLOCK
      ?auto_18811 - BLOCK
      ?auto_18812 - BLOCK
    )
    :vars
    (
      ?auto_18813 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18809 ?auto_18810 ) ) ( not ( = ?auto_18809 ?auto_18811 ) ) ( not ( = ?auto_18809 ?auto_18812 ) ) ( not ( = ?auto_18810 ?auto_18811 ) ) ( not ( = ?auto_18810 ?auto_18812 ) ) ( not ( = ?auto_18811 ?auto_18812 ) ) ( ON ?auto_18812 ?auto_18813 ) ( not ( = ?auto_18809 ?auto_18813 ) ) ( not ( = ?auto_18810 ?auto_18813 ) ) ( not ( = ?auto_18811 ?auto_18813 ) ) ( not ( = ?auto_18812 ?auto_18813 ) ) ( ON ?auto_18811 ?auto_18812 ) ( ON-TABLE ?auto_18813 ) ( ON ?auto_18810 ?auto_18811 ) ( CLEAR ?auto_18810 ) ( HOLDING ?auto_18809 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18809 )
      ( MAKE-4PILE ?auto_18809 ?auto_18810 ?auto_18811 ?auto_18812 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18814 - BLOCK
      ?auto_18815 - BLOCK
      ?auto_18816 - BLOCK
      ?auto_18817 - BLOCK
    )
    :vars
    (
      ?auto_18818 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18814 ?auto_18815 ) ) ( not ( = ?auto_18814 ?auto_18816 ) ) ( not ( = ?auto_18814 ?auto_18817 ) ) ( not ( = ?auto_18815 ?auto_18816 ) ) ( not ( = ?auto_18815 ?auto_18817 ) ) ( not ( = ?auto_18816 ?auto_18817 ) ) ( ON ?auto_18817 ?auto_18818 ) ( not ( = ?auto_18814 ?auto_18818 ) ) ( not ( = ?auto_18815 ?auto_18818 ) ) ( not ( = ?auto_18816 ?auto_18818 ) ) ( not ( = ?auto_18817 ?auto_18818 ) ) ( ON ?auto_18816 ?auto_18817 ) ( ON-TABLE ?auto_18818 ) ( ON ?auto_18815 ?auto_18816 ) ( ON ?auto_18814 ?auto_18815 ) ( CLEAR ?auto_18814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18818 ?auto_18817 ?auto_18816 ?auto_18815 )
      ( MAKE-4PILE ?auto_18814 ?auto_18815 ?auto_18816 ?auto_18817 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18819 - BLOCK
      ?auto_18820 - BLOCK
      ?auto_18821 - BLOCK
      ?auto_18822 - BLOCK
    )
    :vars
    (
      ?auto_18823 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18819 ?auto_18820 ) ) ( not ( = ?auto_18819 ?auto_18821 ) ) ( not ( = ?auto_18819 ?auto_18822 ) ) ( not ( = ?auto_18820 ?auto_18821 ) ) ( not ( = ?auto_18820 ?auto_18822 ) ) ( not ( = ?auto_18821 ?auto_18822 ) ) ( ON ?auto_18822 ?auto_18823 ) ( not ( = ?auto_18819 ?auto_18823 ) ) ( not ( = ?auto_18820 ?auto_18823 ) ) ( not ( = ?auto_18821 ?auto_18823 ) ) ( not ( = ?auto_18822 ?auto_18823 ) ) ( ON ?auto_18821 ?auto_18822 ) ( ON-TABLE ?auto_18823 ) ( ON ?auto_18820 ?auto_18821 ) ( HOLDING ?auto_18819 ) ( CLEAR ?auto_18820 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_18823 ?auto_18822 ?auto_18821 ?auto_18820 ?auto_18819 )
      ( MAKE-4PILE ?auto_18819 ?auto_18820 ?auto_18821 ?auto_18822 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18824 - BLOCK
      ?auto_18825 - BLOCK
      ?auto_18826 - BLOCK
      ?auto_18827 - BLOCK
    )
    :vars
    (
      ?auto_18828 - BLOCK
      ?auto_18829 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18824 ?auto_18825 ) ) ( not ( = ?auto_18824 ?auto_18826 ) ) ( not ( = ?auto_18824 ?auto_18827 ) ) ( not ( = ?auto_18825 ?auto_18826 ) ) ( not ( = ?auto_18825 ?auto_18827 ) ) ( not ( = ?auto_18826 ?auto_18827 ) ) ( ON ?auto_18827 ?auto_18828 ) ( not ( = ?auto_18824 ?auto_18828 ) ) ( not ( = ?auto_18825 ?auto_18828 ) ) ( not ( = ?auto_18826 ?auto_18828 ) ) ( not ( = ?auto_18827 ?auto_18828 ) ) ( ON ?auto_18826 ?auto_18827 ) ( ON-TABLE ?auto_18828 ) ( ON ?auto_18825 ?auto_18826 ) ( CLEAR ?auto_18825 ) ( ON ?auto_18824 ?auto_18829 ) ( CLEAR ?auto_18824 ) ( HAND-EMPTY ) ( not ( = ?auto_18824 ?auto_18829 ) ) ( not ( = ?auto_18825 ?auto_18829 ) ) ( not ( = ?auto_18826 ?auto_18829 ) ) ( not ( = ?auto_18827 ?auto_18829 ) ) ( not ( = ?auto_18828 ?auto_18829 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18824 ?auto_18829 )
      ( MAKE-4PILE ?auto_18824 ?auto_18825 ?auto_18826 ?auto_18827 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18830 - BLOCK
      ?auto_18831 - BLOCK
      ?auto_18832 - BLOCK
      ?auto_18833 - BLOCK
    )
    :vars
    (
      ?auto_18835 - BLOCK
      ?auto_18834 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18830 ?auto_18831 ) ) ( not ( = ?auto_18830 ?auto_18832 ) ) ( not ( = ?auto_18830 ?auto_18833 ) ) ( not ( = ?auto_18831 ?auto_18832 ) ) ( not ( = ?auto_18831 ?auto_18833 ) ) ( not ( = ?auto_18832 ?auto_18833 ) ) ( ON ?auto_18833 ?auto_18835 ) ( not ( = ?auto_18830 ?auto_18835 ) ) ( not ( = ?auto_18831 ?auto_18835 ) ) ( not ( = ?auto_18832 ?auto_18835 ) ) ( not ( = ?auto_18833 ?auto_18835 ) ) ( ON ?auto_18832 ?auto_18833 ) ( ON-TABLE ?auto_18835 ) ( ON ?auto_18830 ?auto_18834 ) ( CLEAR ?auto_18830 ) ( not ( = ?auto_18830 ?auto_18834 ) ) ( not ( = ?auto_18831 ?auto_18834 ) ) ( not ( = ?auto_18832 ?auto_18834 ) ) ( not ( = ?auto_18833 ?auto_18834 ) ) ( not ( = ?auto_18835 ?auto_18834 ) ) ( HOLDING ?auto_18831 ) ( CLEAR ?auto_18832 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18835 ?auto_18833 ?auto_18832 ?auto_18831 )
      ( MAKE-4PILE ?auto_18830 ?auto_18831 ?auto_18832 ?auto_18833 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18836 - BLOCK
      ?auto_18837 - BLOCK
      ?auto_18838 - BLOCK
      ?auto_18839 - BLOCK
    )
    :vars
    (
      ?auto_18840 - BLOCK
      ?auto_18841 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18836 ?auto_18837 ) ) ( not ( = ?auto_18836 ?auto_18838 ) ) ( not ( = ?auto_18836 ?auto_18839 ) ) ( not ( = ?auto_18837 ?auto_18838 ) ) ( not ( = ?auto_18837 ?auto_18839 ) ) ( not ( = ?auto_18838 ?auto_18839 ) ) ( ON ?auto_18839 ?auto_18840 ) ( not ( = ?auto_18836 ?auto_18840 ) ) ( not ( = ?auto_18837 ?auto_18840 ) ) ( not ( = ?auto_18838 ?auto_18840 ) ) ( not ( = ?auto_18839 ?auto_18840 ) ) ( ON ?auto_18838 ?auto_18839 ) ( ON-TABLE ?auto_18840 ) ( ON ?auto_18836 ?auto_18841 ) ( not ( = ?auto_18836 ?auto_18841 ) ) ( not ( = ?auto_18837 ?auto_18841 ) ) ( not ( = ?auto_18838 ?auto_18841 ) ) ( not ( = ?auto_18839 ?auto_18841 ) ) ( not ( = ?auto_18840 ?auto_18841 ) ) ( CLEAR ?auto_18838 ) ( ON ?auto_18837 ?auto_18836 ) ( CLEAR ?auto_18837 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18841 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18841 ?auto_18836 )
      ( MAKE-4PILE ?auto_18836 ?auto_18837 ?auto_18838 ?auto_18839 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18842 - BLOCK
      ?auto_18843 - BLOCK
      ?auto_18844 - BLOCK
      ?auto_18845 - BLOCK
    )
    :vars
    (
      ?auto_18846 - BLOCK
      ?auto_18847 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18842 ?auto_18843 ) ) ( not ( = ?auto_18842 ?auto_18844 ) ) ( not ( = ?auto_18842 ?auto_18845 ) ) ( not ( = ?auto_18843 ?auto_18844 ) ) ( not ( = ?auto_18843 ?auto_18845 ) ) ( not ( = ?auto_18844 ?auto_18845 ) ) ( ON ?auto_18845 ?auto_18846 ) ( not ( = ?auto_18842 ?auto_18846 ) ) ( not ( = ?auto_18843 ?auto_18846 ) ) ( not ( = ?auto_18844 ?auto_18846 ) ) ( not ( = ?auto_18845 ?auto_18846 ) ) ( ON-TABLE ?auto_18846 ) ( ON ?auto_18842 ?auto_18847 ) ( not ( = ?auto_18842 ?auto_18847 ) ) ( not ( = ?auto_18843 ?auto_18847 ) ) ( not ( = ?auto_18844 ?auto_18847 ) ) ( not ( = ?auto_18845 ?auto_18847 ) ) ( not ( = ?auto_18846 ?auto_18847 ) ) ( ON ?auto_18843 ?auto_18842 ) ( CLEAR ?auto_18843 ) ( ON-TABLE ?auto_18847 ) ( HOLDING ?auto_18844 ) ( CLEAR ?auto_18845 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18846 ?auto_18845 ?auto_18844 )
      ( MAKE-4PILE ?auto_18842 ?auto_18843 ?auto_18844 ?auto_18845 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18848 - BLOCK
      ?auto_18849 - BLOCK
      ?auto_18850 - BLOCK
      ?auto_18851 - BLOCK
    )
    :vars
    (
      ?auto_18852 - BLOCK
      ?auto_18853 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18848 ?auto_18849 ) ) ( not ( = ?auto_18848 ?auto_18850 ) ) ( not ( = ?auto_18848 ?auto_18851 ) ) ( not ( = ?auto_18849 ?auto_18850 ) ) ( not ( = ?auto_18849 ?auto_18851 ) ) ( not ( = ?auto_18850 ?auto_18851 ) ) ( ON ?auto_18851 ?auto_18852 ) ( not ( = ?auto_18848 ?auto_18852 ) ) ( not ( = ?auto_18849 ?auto_18852 ) ) ( not ( = ?auto_18850 ?auto_18852 ) ) ( not ( = ?auto_18851 ?auto_18852 ) ) ( ON-TABLE ?auto_18852 ) ( ON ?auto_18848 ?auto_18853 ) ( not ( = ?auto_18848 ?auto_18853 ) ) ( not ( = ?auto_18849 ?auto_18853 ) ) ( not ( = ?auto_18850 ?auto_18853 ) ) ( not ( = ?auto_18851 ?auto_18853 ) ) ( not ( = ?auto_18852 ?auto_18853 ) ) ( ON ?auto_18849 ?auto_18848 ) ( ON-TABLE ?auto_18853 ) ( CLEAR ?auto_18851 ) ( ON ?auto_18850 ?auto_18849 ) ( CLEAR ?auto_18850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18853 ?auto_18848 ?auto_18849 )
      ( MAKE-4PILE ?auto_18848 ?auto_18849 ?auto_18850 ?auto_18851 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18854 - BLOCK
      ?auto_18855 - BLOCK
      ?auto_18856 - BLOCK
      ?auto_18857 - BLOCK
    )
    :vars
    (
      ?auto_18859 - BLOCK
      ?auto_18858 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18854 ?auto_18855 ) ) ( not ( = ?auto_18854 ?auto_18856 ) ) ( not ( = ?auto_18854 ?auto_18857 ) ) ( not ( = ?auto_18855 ?auto_18856 ) ) ( not ( = ?auto_18855 ?auto_18857 ) ) ( not ( = ?auto_18856 ?auto_18857 ) ) ( not ( = ?auto_18854 ?auto_18859 ) ) ( not ( = ?auto_18855 ?auto_18859 ) ) ( not ( = ?auto_18856 ?auto_18859 ) ) ( not ( = ?auto_18857 ?auto_18859 ) ) ( ON-TABLE ?auto_18859 ) ( ON ?auto_18854 ?auto_18858 ) ( not ( = ?auto_18854 ?auto_18858 ) ) ( not ( = ?auto_18855 ?auto_18858 ) ) ( not ( = ?auto_18856 ?auto_18858 ) ) ( not ( = ?auto_18857 ?auto_18858 ) ) ( not ( = ?auto_18859 ?auto_18858 ) ) ( ON ?auto_18855 ?auto_18854 ) ( ON-TABLE ?auto_18858 ) ( ON ?auto_18856 ?auto_18855 ) ( CLEAR ?auto_18856 ) ( HOLDING ?auto_18857 ) ( CLEAR ?auto_18859 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18859 ?auto_18857 )
      ( MAKE-4PILE ?auto_18854 ?auto_18855 ?auto_18856 ?auto_18857 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18860 - BLOCK
      ?auto_18861 - BLOCK
      ?auto_18862 - BLOCK
      ?auto_18863 - BLOCK
    )
    :vars
    (
      ?auto_18865 - BLOCK
      ?auto_18864 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18860 ?auto_18861 ) ) ( not ( = ?auto_18860 ?auto_18862 ) ) ( not ( = ?auto_18860 ?auto_18863 ) ) ( not ( = ?auto_18861 ?auto_18862 ) ) ( not ( = ?auto_18861 ?auto_18863 ) ) ( not ( = ?auto_18862 ?auto_18863 ) ) ( not ( = ?auto_18860 ?auto_18865 ) ) ( not ( = ?auto_18861 ?auto_18865 ) ) ( not ( = ?auto_18862 ?auto_18865 ) ) ( not ( = ?auto_18863 ?auto_18865 ) ) ( ON-TABLE ?auto_18865 ) ( ON ?auto_18860 ?auto_18864 ) ( not ( = ?auto_18860 ?auto_18864 ) ) ( not ( = ?auto_18861 ?auto_18864 ) ) ( not ( = ?auto_18862 ?auto_18864 ) ) ( not ( = ?auto_18863 ?auto_18864 ) ) ( not ( = ?auto_18865 ?auto_18864 ) ) ( ON ?auto_18861 ?auto_18860 ) ( ON-TABLE ?auto_18864 ) ( ON ?auto_18862 ?auto_18861 ) ( CLEAR ?auto_18865 ) ( ON ?auto_18863 ?auto_18862 ) ( CLEAR ?auto_18863 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18864 ?auto_18860 ?auto_18861 ?auto_18862 )
      ( MAKE-4PILE ?auto_18860 ?auto_18861 ?auto_18862 ?auto_18863 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18866 - BLOCK
      ?auto_18867 - BLOCK
      ?auto_18868 - BLOCK
      ?auto_18869 - BLOCK
    )
    :vars
    (
      ?auto_18871 - BLOCK
      ?auto_18870 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18866 ?auto_18867 ) ) ( not ( = ?auto_18866 ?auto_18868 ) ) ( not ( = ?auto_18866 ?auto_18869 ) ) ( not ( = ?auto_18867 ?auto_18868 ) ) ( not ( = ?auto_18867 ?auto_18869 ) ) ( not ( = ?auto_18868 ?auto_18869 ) ) ( not ( = ?auto_18866 ?auto_18871 ) ) ( not ( = ?auto_18867 ?auto_18871 ) ) ( not ( = ?auto_18868 ?auto_18871 ) ) ( not ( = ?auto_18869 ?auto_18871 ) ) ( ON ?auto_18866 ?auto_18870 ) ( not ( = ?auto_18866 ?auto_18870 ) ) ( not ( = ?auto_18867 ?auto_18870 ) ) ( not ( = ?auto_18868 ?auto_18870 ) ) ( not ( = ?auto_18869 ?auto_18870 ) ) ( not ( = ?auto_18871 ?auto_18870 ) ) ( ON ?auto_18867 ?auto_18866 ) ( ON-TABLE ?auto_18870 ) ( ON ?auto_18868 ?auto_18867 ) ( ON ?auto_18869 ?auto_18868 ) ( CLEAR ?auto_18869 ) ( HOLDING ?auto_18871 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18871 )
      ( MAKE-4PILE ?auto_18866 ?auto_18867 ?auto_18868 ?auto_18869 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18872 - BLOCK
      ?auto_18873 - BLOCK
      ?auto_18874 - BLOCK
      ?auto_18875 - BLOCK
    )
    :vars
    (
      ?auto_18877 - BLOCK
      ?auto_18876 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18872 ?auto_18873 ) ) ( not ( = ?auto_18872 ?auto_18874 ) ) ( not ( = ?auto_18872 ?auto_18875 ) ) ( not ( = ?auto_18873 ?auto_18874 ) ) ( not ( = ?auto_18873 ?auto_18875 ) ) ( not ( = ?auto_18874 ?auto_18875 ) ) ( not ( = ?auto_18872 ?auto_18877 ) ) ( not ( = ?auto_18873 ?auto_18877 ) ) ( not ( = ?auto_18874 ?auto_18877 ) ) ( not ( = ?auto_18875 ?auto_18877 ) ) ( ON ?auto_18872 ?auto_18876 ) ( not ( = ?auto_18872 ?auto_18876 ) ) ( not ( = ?auto_18873 ?auto_18876 ) ) ( not ( = ?auto_18874 ?auto_18876 ) ) ( not ( = ?auto_18875 ?auto_18876 ) ) ( not ( = ?auto_18877 ?auto_18876 ) ) ( ON ?auto_18873 ?auto_18872 ) ( ON-TABLE ?auto_18876 ) ( ON ?auto_18874 ?auto_18873 ) ( ON ?auto_18875 ?auto_18874 ) ( ON ?auto_18877 ?auto_18875 ) ( CLEAR ?auto_18877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_18876 ?auto_18872 ?auto_18873 ?auto_18874 ?auto_18875 )
      ( MAKE-4PILE ?auto_18872 ?auto_18873 ?auto_18874 ?auto_18875 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18883 - BLOCK
      ?auto_18884 - BLOCK
      ?auto_18885 - BLOCK
      ?auto_18886 - BLOCK
      ?auto_18887 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_18887 ) ( CLEAR ?auto_18886 ) ( ON-TABLE ?auto_18883 ) ( ON ?auto_18884 ?auto_18883 ) ( ON ?auto_18885 ?auto_18884 ) ( ON ?auto_18886 ?auto_18885 ) ( not ( = ?auto_18883 ?auto_18884 ) ) ( not ( = ?auto_18883 ?auto_18885 ) ) ( not ( = ?auto_18883 ?auto_18886 ) ) ( not ( = ?auto_18883 ?auto_18887 ) ) ( not ( = ?auto_18884 ?auto_18885 ) ) ( not ( = ?auto_18884 ?auto_18886 ) ) ( not ( = ?auto_18884 ?auto_18887 ) ) ( not ( = ?auto_18885 ?auto_18886 ) ) ( not ( = ?auto_18885 ?auto_18887 ) ) ( not ( = ?auto_18886 ?auto_18887 ) ) )
    :subtasks
    ( ( !STACK ?auto_18887 ?auto_18886 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18888 - BLOCK
      ?auto_18889 - BLOCK
      ?auto_18890 - BLOCK
      ?auto_18891 - BLOCK
      ?auto_18892 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_18891 ) ( ON-TABLE ?auto_18888 ) ( ON ?auto_18889 ?auto_18888 ) ( ON ?auto_18890 ?auto_18889 ) ( ON ?auto_18891 ?auto_18890 ) ( not ( = ?auto_18888 ?auto_18889 ) ) ( not ( = ?auto_18888 ?auto_18890 ) ) ( not ( = ?auto_18888 ?auto_18891 ) ) ( not ( = ?auto_18888 ?auto_18892 ) ) ( not ( = ?auto_18889 ?auto_18890 ) ) ( not ( = ?auto_18889 ?auto_18891 ) ) ( not ( = ?auto_18889 ?auto_18892 ) ) ( not ( = ?auto_18890 ?auto_18891 ) ) ( not ( = ?auto_18890 ?auto_18892 ) ) ( not ( = ?auto_18891 ?auto_18892 ) ) ( ON-TABLE ?auto_18892 ) ( CLEAR ?auto_18892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_18892 )
      ( MAKE-5PILE ?auto_18888 ?auto_18889 ?auto_18890 ?auto_18891 ?auto_18892 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18893 - BLOCK
      ?auto_18894 - BLOCK
      ?auto_18895 - BLOCK
      ?auto_18896 - BLOCK
      ?auto_18897 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18893 ) ( ON ?auto_18894 ?auto_18893 ) ( ON ?auto_18895 ?auto_18894 ) ( not ( = ?auto_18893 ?auto_18894 ) ) ( not ( = ?auto_18893 ?auto_18895 ) ) ( not ( = ?auto_18893 ?auto_18896 ) ) ( not ( = ?auto_18893 ?auto_18897 ) ) ( not ( = ?auto_18894 ?auto_18895 ) ) ( not ( = ?auto_18894 ?auto_18896 ) ) ( not ( = ?auto_18894 ?auto_18897 ) ) ( not ( = ?auto_18895 ?auto_18896 ) ) ( not ( = ?auto_18895 ?auto_18897 ) ) ( not ( = ?auto_18896 ?auto_18897 ) ) ( ON-TABLE ?auto_18897 ) ( CLEAR ?auto_18897 ) ( HOLDING ?auto_18896 ) ( CLEAR ?auto_18895 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18893 ?auto_18894 ?auto_18895 ?auto_18896 )
      ( MAKE-5PILE ?auto_18893 ?auto_18894 ?auto_18895 ?auto_18896 ?auto_18897 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18898 - BLOCK
      ?auto_18899 - BLOCK
      ?auto_18900 - BLOCK
      ?auto_18901 - BLOCK
      ?auto_18902 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18898 ) ( ON ?auto_18899 ?auto_18898 ) ( ON ?auto_18900 ?auto_18899 ) ( not ( = ?auto_18898 ?auto_18899 ) ) ( not ( = ?auto_18898 ?auto_18900 ) ) ( not ( = ?auto_18898 ?auto_18901 ) ) ( not ( = ?auto_18898 ?auto_18902 ) ) ( not ( = ?auto_18899 ?auto_18900 ) ) ( not ( = ?auto_18899 ?auto_18901 ) ) ( not ( = ?auto_18899 ?auto_18902 ) ) ( not ( = ?auto_18900 ?auto_18901 ) ) ( not ( = ?auto_18900 ?auto_18902 ) ) ( not ( = ?auto_18901 ?auto_18902 ) ) ( ON-TABLE ?auto_18902 ) ( CLEAR ?auto_18900 ) ( ON ?auto_18901 ?auto_18902 ) ( CLEAR ?auto_18901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18902 )
      ( MAKE-5PILE ?auto_18898 ?auto_18899 ?auto_18900 ?auto_18901 ?auto_18902 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18903 - BLOCK
      ?auto_18904 - BLOCK
      ?auto_18905 - BLOCK
      ?auto_18906 - BLOCK
      ?auto_18907 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18903 ) ( ON ?auto_18904 ?auto_18903 ) ( not ( = ?auto_18903 ?auto_18904 ) ) ( not ( = ?auto_18903 ?auto_18905 ) ) ( not ( = ?auto_18903 ?auto_18906 ) ) ( not ( = ?auto_18903 ?auto_18907 ) ) ( not ( = ?auto_18904 ?auto_18905 ) ) ( not ( = ?auto_18904 ?auto_18906 ) ) ( not ( = ?auto_18904 ?auto_18907 ) ) ( not ( = ?auto_18905 ?auto_18906 ) ) ( not ( = ?auto_18905 ?auto_18907 ) ) ( not ( = ?auto_18906 ?auto_18907 ) ) ( ON-TABLE ?auto_18907 ) ( ON ?auto_18906 ?auto_18907 ) ( CLEAR ?auto_18906 ) ( HOLDING ?auto_18905 ) ( CLEAR ?auto_18904 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18903 ?auto_18904 ?auto_18905 )
      ( MAKE-5PILE ?auto_18903 ?auto_18904 ?auto_18905 ?auto_18906 ?auto_18907 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18908 - BLOCK
      ?auto_18909 - BLOCK
      ?auto_18910 - BLOCK
      ?auto_18911 - BLOCK
      ?auto_18912 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18908 ) ( ON ?auto_18909 ?auto_18908 ) ( not ( = ?auto_18908 ?auto_18909 ) ) ( not ( = ?auto_18908 ?auto_18910 ) ) ( not ( = ?auto_18908 ?auto_18911 ) ) ( not ( = ?auto_18908 ?auto_18912 ) ) ( not ( = ?auto_18909 ?auto_18910 ) ) ( not ( = ?auto_18909 ?auto_18911 ) ) ( not ( = ?auto_18909 ?auto_18912 ) ) ( not ( = ?auto_18910 ?auto_18911 ) ) ( not ( = ?auto_18910 ?auto_18912 ) ) ( not ( = ?auto_18911 ?auto_18912 ) ) ( ON-TABLE ?auto_18912 ) ( ON ?auto_18911 ?auto_18912 ) ( CLEAR ?auto_18909 ) ( ON ?auto_18910 ?auto_18911 ) ( CLEAR ?auto_18910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18912 ?auto_18911 )
      ( MAKE-5PILE ?auto_18908 ?auto_18909 ?auto_18910 ?auto_18911 ?auto_18912 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18913 - BLOCK
      ?auto_18914 - BLOCK
      ?auto_18915 - BLOCK
      ?auto_18916 - BLOCK
      ?auto_18917 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18913 ) ( not ( = ?auto_18913 ?auto_18914 ) ) ( not ( = ?auto_18913 ?auto_18915 ) ) ( not ( = ?auto_18913 ?auto_18916 ) ) ( not ( = ?auto_18913 ?auto_18917 ) ) ( not ( = ?auto_18914 ?auto_18915 ) ) ( not ( = ?auto_18914 ?auto_18916 ) ) ( not ( = ?auto_18914 ?auto_18917 ) ) ( not ( = ?auto_18915 ?auto_18916 ) ) ( not ( = ?auto_18915 ?auto_18917 ) ) ( not ( = ?auto_18916 ?auto_18917 ) ) ( ON-TABLE ?auto_18917 ) ( ON ?auto_18916 ?auto_18917 ) ( ON ?auto_18915 ?auto_18916 ) ( CLEAR ?auto_18915 ) ( HOLDING ?auto_18914 ) ( CLEAR ?auto_18913 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18913 ?auto_18914 )
      ( MAKE-5PILE ?auto_18913 ?auto_18914 ?auto_18915 ?auto_18916 ?auto_18917 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18918 - BLOCK
      ?auto_18919 - BLOCK
      ?auto_18920 - BLOCK
      ?auto_18921 - BLOCK
      ?auto_18922 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18918 ) ( not ( = ?auto_18918 ?auto_18919 ) ) ( not ( = ?auto_18918 ?auto_18920 ) ) ( not ( = ?auto_18918 ?auto_18921 ) ) ( not ( = ?auto_18918 ?auto_18922 ) ) ( not ( = ?auto_18919 ?auto_18920 ) ) ( not ( = ?auto_18919 ?auto_18921 ) ) ( not ( = ?auto_18919 ?auto_18922 ) ) ( not ( = ?auto_18920 ?auto_18921 ) ) ( not ( = ?auto_18920 ?auto_18922 ) ) ( not ( = ?auto_18921 ?auto_18922 ) ) ( ON-TABLE ?auto_18922 ) ( ON ?auto_18921 ?auto_18922 ) ( ON ?auto_18920 ?auto_18921 ) ( CLEAR ?auto_18918 ) ( ON ?auto_18919 ?auto_18920 ) ( CLEAR ?auto_18919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18922 ?auto_18921 ?auto_18920 )
      ( MAKE-5PILE ?auto_18918 ?auto_18919 ?auto_18920 ?auto_18921 ?auto_18922 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18923 - BLOCK
      ?auto_18924 - BLOCK
      ?auto_18925 - BLOCK
      ?auto_18926 - BLOCK
      ?auto_18927 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18923 ?auto_18924 ) ) ( not ( = ?auto_18923 ?auto_18925 ) ) ( not ( = ?auto_18923 ?auto_18926 ) ) ( not ( = ?auto_18923 ?auto_18927 ) ) ( not ( = ?auto_18924 ?auto_18925 ) ) ( not ( = ?auto_18924 ?auto_18926 ) ) ( not ( = ?auto_18924 ?auto_18927 ) ) ( not ( = ?auto_18925 ?auto_18926 ) ) ( not ( = ?auto_18925 ?auto_18927 ) ) ( not ( = ?auto_18926 ?auto_18927 ) ) ( ON-TABLE ?auto_18927 ) ( ON ?auto_18926 ?auto_18927 ) ( ON ?auto_18925 ?auto_18926 ) ( ON ?auto_18924 ?auto_18925 ) ( CLEAR ?auto_18924 ) ( HOLDING ?auto_18923 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18923 )
      ( MAKE-5PILE ?auto_18923 ?auto_18924 ?auto_18925 ?auto_18926 ?auto_18927 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18928 - BLOCK
      ?auto_18929 - BLOCK
      ?auto_18930 - BLOCK
      ?auto_18931 - BLOCK
      ?auto_18932 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18928 ?auto_18929 ) ) ( not ( = ?auto_18928 ?auto_18930 ) ) ( not ( = ?auto_18928 ?auto_18931 ) ) ( not ( = ?auto_18928 ?auto_18932 ) ) ( not ( = ?auto_18929 ?auto_18930 ) ) ( not ( = ?auto_18929 ?auto_18931 ) ) ( not ( = ?auto_18929 ?auto_18932 ) ) ( not ( = ?auto_18930 ?auto_18931 ) ) ( not ( = ?auto_18930 ?auto_18932 ) ) ( not ( = ?auto_18931 ?auto_18932 ) ) ( ON-TABLE ?auto_18932 ) ( ON ?auto_18931 ?auto_18932 ) ( ON ?auto_18930 ?auto_18931 ) ( ON ?auto_18929 ?auto_18930 ) ( ON ?auto_18928 ?auto_18929 ) ( CLEAR ?auto_18928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18932 ?auto_18931 ?auto_18930 ?auto_18929 )
      ( MAKE-5PILE ?auto_18928 ?auto_18929 ?auto_18930 ?auto_18931 ?auto_18932 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18933 - BLOCK
      ?auto_18934 - BLOCK
      ?auto_18935 - BLOCK
      ?auto_18936 - BLOCK
      ?auto_18937 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18933 ?auto_18934 ) ) ( not ( = ?auto_18933 ?auto_18935 ) ) ( not ( = ?auto_18933 ?auto_18936 ) ) ( not ( = ?auto_18933 ?auto_18937 ) ) ( not ( = ?auto_18934 ?auto_18935 ) ) ( not ( = ?auto_18934 ?auto_18936 ) ) ( not ( = ?auto_18934 ?auto_18937 ) ) ( not ( = ?auto_18935 ?auto_18936 ) ) ( not ( = ?auto_18935 ?auto_18937 ) ) ( not ( = ?auto_18936 ?auto_18937 ) ) ( ON-TABLE ?auto_18937 ) ( ON ?auto_18936 ?auto_18937 ) ( ON ?auto_18935 ?auto_18936 ) ( ON ?auto_18934 ?auto_18935 ) ( HOLDING ?auto_18933 ) ( CLEAR ?auto_18934 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_18937 ?auto_18936 ?auto_18935 ?auto_18934 ?auto_18933 )
      ( MAKE-5PILE ?auto_18933 ?auto_18934 ?auto_18935 ?auto_18936 ?auto_18937 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18938 - BLOCK
      ?auto_18939 - BLOCK
      ?auto_18940 - BLOCK
      ?auto_18941 - BLOCK
      ?auto_18942 - BLOCK
    )
    :vars
    (
      ?auto_18943 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18938 ?auto_18939 ) ) ( not ( = ?auto_18938 ?auto_18940 ) ) ( not ( = ?auto_18938 ?auto_18941 ) ) ( not ( = ?auto_18938 ?auto_18942 ) ) ( not ( = ?auto_18939 ?auto_18940 ) ) ( not ( = ?auto_18939 ?auto_18941 ) ) ( not ( = ?auto_18939 ?auto_18942 ) ) ( not ( = ?auto_18940 ?auto_18941 ) ) ( not ( = ?auto_18940 ?auto_18942 ) ) ( not ( = ?auto_18941 ?auto_18942 ) ) ( ON-TABLE ?auto_18942 ) ( ON ?auto_18941 ?auto_18942 ) ( ON ?auto_18940 ?auto_18941 ) ( ON ?auto_18939 ?auto_18940 ) ( CLEAR ?auto_18939 ) ( ON ?auto_18938 ?auto_18943 ) ( CLEAR ?auto_18938 ) ( HAND-EMPTY ) ( not ( = ?auto_18938 ?auto_18943 ) ) ( not ( = ?auto_18939 ?auto_18943 ) ) ( not ( = ?auto_18940 ?auto_18943 ) ) ( not ( = ?auto_18941 ?auto_18943 ) ) ( not ( = ?auto_18942 ?auto_18943 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18938 ?auto_18943 )
      ( MAKE-5PILE ?auto_18938 ?auto_18939 ?auto_18940 ?auto_18941 ?auto_18942 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18944 - BLOCK
      ?auto_18945 - BLOCK
      ?auto_18946 - BLOCK
      ?auto_18947 - BLOCK
      ?auto_18948 - BLOCK
    )
    :vars
    (
      ?auto_18949 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18944 ?auto_18945 ) ) ( not ( = ?auto_18944 ?auto_18946 ) ) ( not ( = ?auto_18944 ?auto_18947 ) ) ( not ( = ?auto_18944 ?auto_18948 ) ) ( not ( = ?auto_18945 ?auto_18946 ) ) ( not ( = ?auto_18945 ?auto_18947 ) ) ( not ( = ?auto_18945 ?auto_18948 ) ) ( not ( = ?auto_18946 ?auto_18947 ) ) ( not ( = ?auto_18946 ?auto_18948 ) ) ( not ( = ?auto_18947 ?auto_18948 ) ) ( ON-TABLE ?auto_18948 ) ( ON ?auto_18947 ?auto_18948 ) ( ON ?auto_18946 ?auto_18947 ) ( ON ?auto_18944 ?auto_18949 ) ( CLEAR ?auto_18944 ) ( not ( = ?auto_18944 ?auto_18949 ) ) ( not ( = ?auto_18945 ?auto_18949 ) ) ( not ( = ?auto_18946 ?auto_18949 ) ) ( not ( = ?auto_18947 ?auto_18949 ) ) ( not ( = ?auto_18948 ?auto_18949 ) ) ( HOLDING ?auto_18945 ) ( CLEAR ?auto_18946 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18948 ?auto_18947 ?auto_18946 ?auto_18945 )
      ( MAKE-5PILE ?auto_18944 ?auto_18945 ?auto_18946 ?auto_18947 ?auto_18948 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18950 - BLOCK
      ?auto_18951 - BLOCK
      ?auto_18952 - BLOCK
      ?auto_18953 - BLOCK
      ?auto_18954 - BLOCK
    )
    :vars
    (
      ?auto_18955 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18950 ?auto_18951 ) ) ( not ( = ?auto_18950 ?auto_18952 ) ) ( not ( = ?auto_18950 ?auto_18953 ) ) ( not ( = ?auto_18950 ?auto_18954 ) ) ( not ( = ?auto_18951 ?auto_18952 ) ) ( not ( = ?auto_18951 ?auto_18953 ) ) ( not ( = ?auto_18951 ?auto_18954 ) ) ( not ( = ?auto_18952 ?auto_18953 ) ) ( not ( = ?auto_18952 ?auto_18954 ) ) ( not ( = ?auto_18953 ?auto_18954 ) ) ( ON-TABLE ?auto_18954 ) ( ON ?auto_18953 ?auto_18954 ) ( ON ?auto_18952 ?auto_18953 ) ( ON ?auto_18950 ?auto_18955 ) ( not ( = ?auto_18950 ?auto_18955 ) ) ( not ( = ?auto_18951 ?auto_18955 ) ) ( not ( = ?auto_18952 ?auto_18955 ) ) ( not ( = ?auto_18953 ?auto_18955 ) ) ( not ( = ?auto_18954 ?auto_18955 ) ) ( CLEAR ?auto_18952 ) ( ON ?auto_18951 ?auto_18950 ) ( CLEAR ?auto_18951 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18955 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18955 ?auto_18950 )
      ( MAKE-5PILE ?auto_18950 ?auto_18951 ?auto_18952 ?auto_18953 ?auto_18954 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18956 - BLOCK
      ?auto_18957 - BLOCK
      ?auto_18958 - BLOCK
      ?auto_18959 - BLOCK
      ?auto_18960 - BLOCK
    )
    :vars
    (
      ?auto_18961 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18956 ?auto_18957 ) ) ( not ( = ?auto_18956 ?auto_18958 ) ) ( not ( = ?auto_18956 ?auto_18959 ) ) ( not ( = ?auto_18956 ?auto_18960 ) ) ( not ( = ?auto_18957 ?auto_18958 ) ) ( not ( = ?auto_18957 ?auto_18959 ) ) ( not ( = ?auto_18957 ?auto_18960 ) ) ( not ( = ?auto_18958 ?auto_18959 ) ) ( not ( = ?auto_18958 ?auto_18960 ) ) ( not ( = ?auto_18959 ?auto_18960 ) ) ( ON-TABLE ?auto_18960 ) ( ON ?auto_18959 ?auto_18960 ) ( ON ?auto_18956 ?auto_18961 ) ( not ( = ?auto_18956 ?auto_18961 ) ) ( not ( = ?auto_18957 ?auto_18961 ) ) ( not ( = ?auto_18958 ?auto_18961 ) ) ( not ( = ?auto_18959 ?auto_18961 ) ) ( not ( = ?auto_18960 ?auto_18961 ) ) ( ON ?auto_18957 ?auto_18956 ) ( CLEAR ?auto_18957 ) ( ON-TABLE ?auto_18961 ) ( HOLDING ?auto_18958 ) ( CLEAR ?auto_18959 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18960 ?auto_18959 ?auto_18958 )
      ( MAKE-5PILE ?auto_18956 ?auto_18957 ?auto_18958 ?auto_18959 ?auto_18960 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18962 - BLOCK
      ?auto_18963 - BLOCK
      ?auto_18964 - BLOCK
      ?auto_18965 - BLOCK
      ?auto_18966 - BLOCK
    )
    :vars
    (
      ?auto_18967 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18962 ?auto_18963 ) ) ( not ( = ?auto_18962 ?auto_18964 ) ) ( not ( = ?auto_18962 ?auto_18965 ) ) ( not ( = ?auto_18962 ?auto_18966 ) ) ( not ( = ?auto_18963 ?auto_18964 ) ) ( not ( = ?auto_18963 ?auto_18965 ) ) ( not ( = ?auto_18963 ?auto_18966 ) ) ( not ( = ?auto_18964 ?auto_18965 ) ) ( not ( = ?auto_18964 ?auto_18966 ) ) ( not ( = ?auto_18965 ?auto_18966 ) ) ( ON-TABLE ?auto_18966 ) ( ON ?auto_18965 ?auto_18966 ) ( ON ?auto_18962 ?auto_18967 ) ( not ( = ?auto_18962 ?auto_18967 ) ) ( not ( = ?auto_18963 ?auto_18967 ) ) ( not ( = ?auto_18964 ?auto_18967 ) ) ( not ( = ?auto_18965 ?auto_18967 ) ) ( not ( = ?auto_18966 ?auto_18967 ) ) ( ON ?auto_18963 ?auto_18962 ) ( ON-TABLE ?auto_18967 ) ( CLEAR ?auto_18965 ) ( ON ?auto_18964 ?auto_18963 ) ( CLEAR ?auto_18964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18967 ?auto_18962 ?auto_18963 )
      ( MAKE-5PILE ?auto_18962 ?auto_18963 ?auto_18964 ?auto_18965 ?auto_18966 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18968 - BLOCK
      ?auto_18969 - BLOCK
      ?auto_18970 - BLOCK
      ?auto_18971 - BLOCK
      ?auto_18972 - BLOCK
    )
    :vars
    (
      ?auto_18973 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18968 ?auto_18969 ) ) ( not ( = ?auto_18968 ?auto_18970 ) ) ( not ( = ?auto_18968 ?auto_18971 ) ) ( not ( = ?auto_18968 ?auto_18972 ) ) ( not ( = ?auto_18969 ?auto_18970 ) ) ( not ( = ?auto_18969 ?auto_18971 ) ) ( not ( = ?auto_18969 ?auto_18972 ) ) ( not ( = ?auto_18970 ?auto_18971 ) ) ( not ( = ?auto_18970 ?auto_18972 ) ) ( not ( = ?auto_18971 ?auto_18972 ) ) ( ON-TABLE ?auto_18972 ) ( ON ?auto_18968 ?auto_18973 ) ( not ( = ?auto_18968 ?auto_18973 ) ) ( not ( = ?auto_18969 ?auto_18973 ) ) ( not ( = ?auto_18970 ?auto_18973 ) ) ( not ( = ?auto_18971 ?auto_18973 ) ) ( not ( = ?auto_18972 ?auto_18973 ) ) ( ON ?auto_18969 ?auto_18968 ) ( ON-TABLE ?auto_18973 ) ( ON ?auto_18970 ?auto_18969 ) ( CLEAR ?auto_18970 ) ( HOLDING ?auto_18971 ) ( CLEAR ?auto_18972 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18972 ?auto_18971 )
      ( MAKE-5PILE ?auto_18968 ?auto_18969 ?auto_18970 ?auto_18971 ?auto_18972 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18974 - BLOCK
      ?auto_18975 - BLOCK
      ?auto_18976 - BLOCK
      ?auto_18977 - BLOCK
      ?auto_18978 - BLOCK
    )
    :vars
    (
      ?auto_18979 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18974 ?auto_18975 ) ) ( not ( = ?auto_18974 ?auto_18976 ) ) ( not ( = ?auto_18974 ?auto_18977 ) ) ( not ( = ?auto_18974 ?auto_18978 ) ) ( not ( = ?auto_18975 ?auto_18976 ) ) ( not ( = ?auto_18975 ?auto_18977 ) ) ( not ( = ?auto_18975 ?auto_18978 ) ) ( not ( = ?auto_18976 ?auto_18977 ) ) ( not ( = ?auto_18976 ?auto_18978 ) ) ( not ( = ?auto_18977 ?auto_18978 ) ) ( ON-TABLE ?auto_18978 ) ( ON ?auto_18974 ?auto_18979 ) ( not ( = ?auto_18974 ?auto_18979 ) ) ( not ( = ?auto_18975 ?auto_18979 ) ) ( not ( = ?auto_18976 ?auto_18979 ) ) ( not ( = ?auto_18977 ?auto_18979 ) ) ( not ( = ?auto_18978 ?auto_18979 ) ) ( ON ?auto_18975 ?auto_18974 ) ( ON-TABLE ?auto_18979 ) ( ON ?auto_18976 ?auto_18975 ) ( CLEAR ?auto_18978 ) ( ON ?auto_18977 ?auto_18976 ) ( CLEAR ?auto_18977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18979 ?auto_18974 ?auto_18975 ?auto_18976 )
      ( MAKE-5PILE ?auto_18974 ?auto_18975 ?auto_18976 ?auto_18977 ?auto_18978 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18980 - BLOCK
      ?auto_18981 - BLOCK
      ?auto_18982 - BLOCK
      ?auto_18983 - BLOCK
      ?auto_18984 - BLOCK
    )
    :vars
    (
      ?auto_18985 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18980 ?auto_18981 ) ) ( not ( = ?auto_18980 ?auto_18982 ) ) ( not ( = ?auto_18980 ?auto_18983 ) ) ( not ( = ?auto_18980 ?auto_18984 ) ) ( not ( = ?auto_18981 ?auto_18982 ) ) ( not ( = ?auto_18981 ?auto_18983 ) ) ( not ( = ?auto_18981 ?auto_18984 ) ) ( not ( = ?auto_18982 ?auto_18983 ) ) ( not ( = ?auto_18982 ?auto_18984 ) ) ( not ( = ?auto_18983 ?auto_18984 ) ) ( ON ?auto_18980 ?auto_18985 ) ( not ( = ?auto_18980 ?auto_18985 ) ) ( not ( = ?auto_18981 ?auto_18985 ) ) ( not ( = ?auto_18982 ?auto_18985 ) ) ( not ( = ?auto_18983 ?auto_18985 ) ) ( not ( = ?auto_18984 ?auto_18985 ) ) ( ON ?auto_18981 ?auto_18980 ) ( ON-TABLE ?auto_18985 ) ( ON ?auto_18982 ?auto_18981 ) ( ON ?auto_18983 ?auto_18982 ) ( CLEAR ?auto_18983 ) ( HOLDING ?auto_18984 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18984 )
      ( MAKE-5PILE ?auto_18980 ?auto_18981 ?auto_18982 ?auto_18983 ?auto_18984 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18986 - BLOCK
      ?auto_18987 - BLOCK
      ?auto_18988 - BLOCK
      ?auto_18989 - BLOCK
      ?auto_18990 - BLOCK
    )
    :vars
    (
      ?auto_18991 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18986 ?auto_18987 ) ) ( not ( = ?auto_18986 ?auto_18988 ) ) ( not ( = ?auto_18986 ?auto_18989 ) ) ( not ( = ?auto_18986 ?auto_18990 ) ) ( not ( = ?auto_18987 ?auto_18988 ) ) ( not ( = ?auto_18987 ?auto_18989 ) ) ( not ( = ?auto_18987 ?auto_18990 ) ) ( not ( = ?auto_18988 ?auto_18989 ) ) ( not ( = ?auto_18988 ?auto_18990 ) ) ( not ( = ?auto_18989 ?auto_18990 ) ) ( ON ?auto_18986 ?auto_18991 ) ( not ( = ?auto_18986 ?auto_18991 ) ) ( not ( = ?auto_18987 ?auto_18991 ) ) ( not ( = ?auto_18988 ?auto_18991 ) ) ( not ( = ?auto_18989 ?auto_18991 ) ) ( not ( = ?auto_18990 ?auto_18991 ) ) ( ON ?auto_18987 ?auto_18986 ) ( ON-TABLE ?auto_18991 ) ( ON ?auto_18988 ?auto_18987 ) ( ON ?auto_18989 ?auto_18988 ) ( ON ?auto_18990 ?auto_18989 ) ( CLEAR ?auto_18990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_18991 ?auto_18986 ?auto_18987 ?auto_18988 ?auto_18989 )
      ( MAKE-5PILE ?auto_18986 ?auto_18987 ?auto_18988 ?auto_18989 ?auto_18990 ) )
  )

)

