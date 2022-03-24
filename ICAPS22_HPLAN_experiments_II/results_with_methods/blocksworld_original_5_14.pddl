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
      ?auto_32933 - BLOCK
      ?auto_32934 - BLOCK
      ?auto_32935 - BLOCK
      ?auto_32936 - BLOCK
      ?auto_32937 - BLOCK
    )
    :vars
    (
      ?auto_32938 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32938 ?auto_32937 ) ( CLEAR ?auto_32938 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32933 ) ( ON ?auto_32934 ?auto_32933 ) ( ON ?auto_32935 ?auto_32934 ) ( ON ?auto_32936 ?auto_32935 ) ( ON ?auto_32937 ?auto_32936 ) ( not ( = ?auto_32933 ?auto_32934 ) ) ( not ( = ?auto_32933 ?auto_32935 ) ) ( not ( = ?auto_32933 ?auto_32936 ) ) ( not ( = ?auto_32933 ?auto_32937 ) ) ( not ( = ?auto_32933 ?auto_32938 ) ) ( not ( = ?auto_32934 ?auto_32935 ) ) ( not ( = ?auto_32934 ?auto_32936 ) ) ( not ( = ?auto_32934 ?auto_32937 ) ) ( not ( = ?auto_32934 ?auto_32938 ) ) ( not ( = ?auto_32935 ?auto_32936 ) ) ( not ( = ?auto_32935 ?auto_32937 ) ) ( not ( = ?auto_32935 ?auto_32938 ) ) ( not ( = ?auto_32936 ?auto_32937 ) ) ( not ( = ?auto_32936 ?auto_32938 ) ) ( not ( = ?auto_32937 ?auto_32938 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32938 ?auto_32937 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32940 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_32940 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_32940 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32941 - BLOCK
    )
    :vars
    (
      ?auto_32942 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32941 ?auto_32942 ) ( CLEAR ?auto_32941 ) ( HAND-EMPTY ) ( not ( = ?auto_32941 ?auto_32942 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32941 ?auto_32942 )
      ( MAKE-1PILE ?auto_32941 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32947 - BLOCK
      ?auto_32948 - BLOCK
      ?auto_32949 - BLOCK
      ?auto_32950 - BLOCK
    )
    :vars
    (
      ?auto_32951 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32951 ?auto_32950 ) ( CLEAR ?auto_32951 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32947 ) ( ON ?auto_32948 ?auto_32947 ) ( ON ?auto_32949 ?auto_32948 ) ( ON ?auto_32950 ?auto_32949 ) ( not ( = ?auto_32947 ?auto_32948 ) ) ( not ( = ?auto_32947 ?auto_32949 ) ) ( not ( = ?auto_32947 ?auto_32950 ) ) ( not ( = ?auto_32947 ?auto_32951 ) ) ( not ( = ?auto_32948 ?auto_32949 ) ) ( not ( = ?auto_32948 ?auto_32950 ) ) ( not ( = ?auto_32948 ?auto_32951 ) ) ( not ( = ?auto_32949 ?auto_32950 ) ) ( not ( = ?auto_32949 ?auto_32951 ) ) ( not ( = ?auto_32950 ?auto_32951 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32951 ?auto_32950 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32952 - BLOCK
      ?auto_32953 - BLOCK
      ?auto_32954 - BLOCK
      ?auto_32955 - BLOCK
    )
    :vars
    (
      ?auto_32956 - BLOCK
      ?auto_32957 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32956 ?auto_32955 ) ( CLEAR ?auto_32956 ) ( ON-TABLE ?auto_32952 ) ( ON ?auto_32953 ?auto_32952 ) ( ON ?auto_32954 ?auto_32953 ) ( ON ?auto_32955 ?auto_32954 ) ( not ( = ?auto_32952 ?auto_32953 ) ) ( not ( = ?auto_32952 ?auto_32954 ) ) ( not ( = ?auto_32952 ?auto_32955 ) ) ( not ( = ?auto_32952 ?auto_32956 ) ) ( not ( = ?auto_32953 ?auto_32954 ) ) ( not ( = ?auto_32953 ?auto_32955 ) ) ( not ( = ?auto_32953 ?auto_32956 ) ) ( not ( = ?auto_32954 ?auto_32955 ) ) ( not ( = ?auto_32954 ?auto_32956 ) ) ( not ( = ?auto_32955 ?auto_32956 ) ) ( HOLDING ?auto_32957 ) ( not ( = ?auto_32952 ?auto_32957 ) ) ( not ( = ?auto_32953 ?auto_32957 ) ) ( not ( = ?auto_32954 ?auto_32957 ) ) ( not ( = ?auto_32955 ?auto_32957 ) ) ( not ( = ?auto_32956 ?auto_32957 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_32957 )
      ( MAKE-4PILE ?auto_32952 ?auto_32953 ?auto_32954 ?auto_32955 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32958 - BLOCK
      ?auto_32959 - BLOCK
      ?auto_32960 - BLOCK
      ?auto_32961 - BLOCK
    )
    :vars
    (
      ?auto_32962 - BLOCK
      ?auto_32963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32962 ?auto_32961 ) ( ON-TABLE ?auto_32958 ) ( ON ?auto_32959 ?auto_32958 ) ( ON ?auto_32960 ?auto_32959 ) ( ON ?auto_32961 ?auto_32960 ) ( not ( = ?auto_32958 ?auto_32959 ) ) ( not ( = ?auto_32958 ?auto_32960 ) ) ( not ( = ?auto_32958 ?auto_32961 ) ) ( not ( = ?auto_32958 ?auto_32962 ) ) ( not ( = ?auto_32959 ?auto_32960 ) ) ( not ( = ?auto_32959 ?auto_32961 ) ) ( not ( = ?auto_32959 ?auto_32962 ) ) ( not ( = ?auto_32960 ?auto_32961 ) ) ( not ( = ?auto_32960 ?auto_32962 ) ) ( not ( = ?auto_32961 ?auto_32962 ) ) ( not ( = ?auto_32958 ?auto_32963 ) ) ( not ( = ?auto_32959 ?auto_32963 ) ) ( not ( = ?auto_32960 ?auto_32963 ) ) ( not ( = ?auto_32961 ?auto_32963 ) ) ( not ( = ?auto_32962 ?auto_32963 ) ) ( ON ?auto_32963 ?auto_32962 ) ( CLEAR ?auto_32963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_32958 ?auto_32959 ?auto_32960 ?auto_32961 ?auto_32962 )
      ( MAKE-4PILE ?auto_32958 ?auto_32959 ?auto_32960 ?auto_32961 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32966 - BLOCK
      ?auto_32967 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_32967 ) ( CLEAR ?auto_32966 ) ( ON-TABLE ?auto_32966 ) ( not ( = ?auto_32966 ?auto_32967 ) ) )
    :subtasks
    ( ( !STACK ?auto_32967 ?auto_32966 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32968 - BLOCK
      ?auto_32969 - BLOCK
    )
    :vars
    (
      ?auto_32970 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_32968 ) ( ON-TABLE ?auto_32968 ) ( not ( = ?auto_32968 ?auto_32969 ) ) ( ON ?auto_32969 ?auto_32970 ) ( CLEAR ?auto_32969 ) ( HAND-EMPTY ) ( not ( = ?auto_32968 ?auto_32970 ) ) ( not ( = ?auto_32969 ?auto_32970 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32969 ?auto_32970 )
      ( MAKE-2PILE ?auto_32968 ?auto_32969 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32971 - BLOCK
      ?auto_32972 - BLOCK
    )
    :vars
    (
      ?auto_32973 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32971 ?auto_32972 ) ) ( ON ?auto_32972 ?auto_32973 ) ( CLEAR ?auto_32972 ) ( not ( = ?auto_32971 ?auto_32973 ) ) ( not ( = ?auto_32972 ?auto_32973 ) ) ( HOLDING ?auto_32971 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32971 )
      ( MAKE-2PILE ?auto_32971 ?auto_32972 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32974 - BLOCK
      ?auto_32975 - BLOCK
    )
    :vars
    (
      ?auto_32976 - BLOCK
      ?auto_32979 - BLOCK
      ?auto_32978 - BLOCK
      ?auto_32977 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32974 ?auto_32975 ) ) ( ON ?auto_32975 ?auto_32976 ) ( not ( = ?auto_32974 ?auto_32976 ) ) ( not ( = ?auto_32975 ?auto_32976 ) ) ( ON ?auto_32974 ?auto_32975 ) ( CLEAR ?auto_32974 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32979 ) ( ON ?auto_32978 ?auto_32979 ) ( ON ?auto_32977 ?auto_32978 ) ( ON ?auto_32976 ?auto_32977 ) ( not ( = ?auto_32979 ?auto_32978 ) ) ( not ( = ?auto_32979 ?auto_32977 ) ) ( not ( = ?auto_32979 ?auto_32976 ) ) ( not ( = ?auto_32979 ?auto_32975 ) ) ( not ( = ?auto_32979 ?auto_32974 ) ) ( not ( = ?auto_32978 ?auto_32977 ) ) ( not ( = ?auto_32978 ?auto_32976 ) ) ( not ( = ?auto_32978 ?auto_32975 ) ) ( not ( = ?auto_32978 ?auto_32974 ) ) ( not ( = ?auto_32977 ?auto_32976 ) ) ( not ( = ?auto_32977 ?auto_32975 ) ) ( not ( = ?auto_32977 ?auto_32974 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_32979 ?auto_32978 ?auto_32977 ?auto_32976 ?auto_32975 )
      ( MAKE-2PILE ?auto_32974 ?auto_32975 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32983 - BLOCK
      ?auto_32984 - BLOCK
      ?auto_32985 - BLOCK
    )
    :vars
    (
      ?auto_32986 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32986 ?auto_32985 ) ( CLEAR ?auto_32986 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32983 ) ( ON ?auto_32984 ?auto_32983 ) ( ON ?auto_32985 ?auto_32984 ) ( not ( = ?auto_32983 ?auto_32984 ) ) ( not ( = ?auto_32983 ?auto_32985 ) ) ( not ( = ?auto_32983 ?auto_32986 ) ) ( not ( = ?auto_32984 ?auto_32985 ) ) ( not ( = ?auto_32984 ?auto_32986 ) ) ( not ( = ?auto_32985 ?auto_32986 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32986 ?auto_32985 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32987 - BLOCK
      ?auto_32988 - BLOCK
      ?auto_32989 - BLOCK
    )
    :vars
    (
      ?auto_32990 - BLOCK
      ?auto_32991 - BLOCK
      ?auto_32992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32990 ?auto_32989 ) ( CLEAR ?auto_32990 ) ( ON-TABLE ?auto_32987 ) ( ON ?auto_32988 ?auto_32987 ) ( ON ?auto_32989 ?auto_32988 ) ( not ( = ?auto_32987 ?auto_32988 ) ) ( not ( = ?auto_32987 ?auto_32989 ) ) ( not ( = ?auto_32987 ?auto_32990 ) ) ( not ( = ?auto_32988 ?auto_32989 ) ) ( not ( = ?auto_32988 ?auto_32990 ) ) ( not ( = ?auto_32989 ?auto_32990 ) ) ( HOLDING ?auto_32991 ) ( CLEAR ?auto_32992 ) ( not ( = ?auto_32987 ?auto_32991 ) ) ( not ( = ?auto_32987 ?auto_32992 ) ) ( not ( = ?auto_32988 ?auto_32991 ) ) ( not ( = ?auto_32988 ?auto_32992 ) ) ( not ( = ?auto_32989 ?auto_32991 ) ) ( not ( = ?auto_32989 ?auto_32992 ) ) ( not ( = ?auto_32990 ?auto_32991 ) ) ( not ( = ?auto_32990 ?auto_32992 ) ) ( not ( = ?auto_32991 ?auto_32992 ) ) )
    :subtasks
    ( ( !STACK ?auto_32991 ?auto_32992 )
      ( MAKE-3PILE ?auto_32987 ?auto_32988 ?auto_32989 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32993 - BLOCK
      ?auto_32994 - BLOCK
      ?auto_32995 - BLOCK
    )
    :vars
    (
      ?auto_32998 - BLOCK
      ?auto_32996 - BLOCK
      ?auto_32997 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32998 ?auto_32995 ) ( ON-TABLE ?auto_32993 ) ( ON ?auto_32994 ?auto_32993 ) ( ON ?auto_32995 ?auto_32994 ) ( not ( = ?auto_32993 ?auto_32994 ) ) ( not ( = ?auto_32993 ?auto_32995 ) ) ( not ( = ?auto_32993 ?auto_32998 ) ) ( not ( = ?auto_32994 ?auto_32995 ) ) ( not ( = ?auto_32994 ?auto_32998 ) ) ( not ( = ?auto_32995 ?auto_32998 ) ) ( CLEAR ?auto_32996 ) ( not ( = ?auto_32993 ?auto_32997 ) ) ( not ( = ?auto_32993 ?auto_32996 ) ) ( not ( = ?auto_32994 ?auto_32997 ) ) ( not ( = ?auto_32994 ?auto_32996 ) ) ( not ( = ?auto_32995 ?auto_32997 ) ) ( not ( = ?auto_32995 ?auto_32996 ) ) ( not ( = ?auto_32998 ?auto_32997 ) ) ( not ( = ?auto_32998 ?auto_32996 ) ) ( not ( = ?auto_32997 ?auto_32996 ) ) ( ON ?auto_32997 ?auto_32998 ) ( CLEAR ?auto_32997 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32993 ?auto_32994 ?auto_32995 ?auto_32998 )
      ( MAKE-3PILE ?auto_32993 ?auto_32994 ?auto_32995 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32999 - BLOCK
      ?auto_33000 - BLOCK
      ?auto_33001 - BLOCK
    )
    :vars
    (
      ?auto_33004 - BLOCK
      ?auto_33002 - BLOCK
      ?auto_33003 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33004 ?auto_33001 ) ( ON-TABLE ?auto_32999 ) ( ON ?auto_33000 ?auto_32999 ) ( ON ?auto_33001 ?auto_33000 ) ( not ( = ?auto_32999 ?auto_33000 ) ) ( not ( = ?auto_32999 ?auto_33001 ) ) ( not ( = ?auto_32999 ?auto_33004 ) ) ( not ( = ?auto_33000 ?auto_33001 ) ) ( not ( = ?auto_33000 ?auto_33004 ) ) ( not ( = ?auto_33001 ?auto_33004 ) ) ( not ( = ?auto_32999 ?auto_33002 ) ) ( not ( = ?auto_32999 ?auto_33003 ) ) ( not ( = ?auto_33000 ?auto_33002 ) ) ( not ( = ?auto_33000 ?auto_33003 ) ) ( not ( = ?auto_33001 ?auto_33002 ) ) ( not ( = ?auto_33001 ?auto_33003 ) ) ( not ( = ?auto_33004 ?auto_33002 ) ) ( not ( = ?auto_33004 ?auto_33003 ) ) ( not ( = ?auto_33002 ?auto_33003 ) ) ( ON ?auto_33002 ?auto_33004 ) ( CLEAR ?auto_33002 ) ( HOLDING ?auto_33003 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33003 )
      ( MAKE-3PILE ?auto_32999 ?auto_33000 ?auto_33001 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33005 - BLOCK
      ?auto_33006 - BLOCK
      ?auto_33007 - BLOCK
    )
    :vars
    (
      ?auto_33010 - BLOCK
      ?auto_33008 - BLOCK
      ?auto_33009 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33010 ?auto_33007 ) ( ON-TABLE ?auto_33005 ) ( ON ?auto_33006 ?auto_33005 ) ( ON ?auto_33007 ?auto_33006 ) ( not ( = ?auto_33005 ?auto_33006 ) ) ( not ( = ?auto_33005 ?auto_33007 ) ) ( not ( = ?auto_33005 ?auto_33010 ) ) ( not ( = ?auto_33006 ?auto_33007 ) ) ( not ( = ?auto_33006 ?auto_33010 ) ) ( not ( = ?auto_33007 ?auto_33010 ) ) ( not ( = ?auto_33005 ?auto_33008 ) ) ( not ( = ?auto_33005 ?auto_33009 ) ) ( not ( = ?auto_33006 ?auto_33008 ) ) ( not ( = ?auto_33006 ?auto_33009 ) ) ( not ( = ?auto_33007 ?auto_33008 ) ) ( not ( = ?auto_33007 ?auto_33009 ) ) ( not ( = ?auto_33010 ?auto_33008 ) ) ( not ( = ?auto_33010 ?auto_33009 ) ) ( not ( = ?auto_33008 ?auto_33009 ) ) ( ON ?auto_33008 ?auto_33010 ) ( ON ?auto_33009 ?auto_33008 ) ( CLEAR ?auto_33009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_33005 ?auto_33006 ?auto_33007 ?auto_33010 ?auto_33008 )
      ( MAKE-3PILE ?auto_33005 ?auto_33006 ?auto_33007 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33014 - BLOCK
      ?auto_33015 - BLOCK
      ?auto_33016 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_33016 ) ( CLEAR ?auto_33015 ) ( ON-TABLE ?auto_33014 ) ( ON ?auto_33015 ?auto_33014 ) ( not ( = ?auto_33014 ?auto_33015 ) ) ( not ( = ?auto_33014 ?auto_33016 ) ) ( not ( = ?auto_33015 ?auto_33016 ) ) )
    :subtasks
    ( ( !STACK ?auto_33016 ?auto_33015 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33017 - BLOCK
      ?auto_33018 - BLOCK
      ?auto_33019 - BLOCK
    )
    :vars
    (
      ?auto_33020 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_33018 ) ( ON-TABLE ?auto_33017 ) ( ON ?auto_33018 ?auto_33017 ) ( not ( = ?auto_33017 ?auto_33018 ) ) ( not ( = ?auto_33017 ?auto_33019 ) ) ( not ( = ?auto_33018 ?auto_33019 ) ) ( ON ?auto_33019 ?auto_33020 ) ( CLEAR ?auto_33019 ) ( HAND-EMPTY ) ( not ( = ?auto_33017 ?auto_33020 ) ) ( not ( = ?auto_33018 ?auto_33020 ) ) ( not ( = ?auto_33019 ?auto_33020 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33019 ?auto_33020 )
      ( MAKE-3PILE ?auto_33017 ?auto_33018 ?auto_33019 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33021 - BLOCK
      ?auto_33022 - BLOCK
      ?auto_33023 - BLOCK
    )
    :vars
    (
      ?auto_33024 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33021 ) ( not ( = ?auto_33021 ?auto_33022 ) ) ( not ( = ?auto_33021 ?auto_33023 ) ) ( not ( = ?auto_33022 ?auto_33023 ) ) ( ON ?auto_33023 ?auto_33024 ) ( CLEAR ?auto_33023 ) ( not ( = ?auto_33021 ?auto_33024 ) ) ( not ( = ?auto_33022 ?auto_33024 ) ) ( not ( = ?auto_33023 ?auto_33024 ) ) ( HOLDING ?auto_33022 ) ( CLEAR ?auto_33021 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33021 ?auto_33022 )
      ( MAKE-3PILE ?auto_33021 ?auto_33022 ?auto_33023 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33025 - BLOCK
      ?auto_33026 - BLOCK
      ?auto_33027 - BLOCK
    )
    :vars
    (
      ?auto_33028 - BLOCK
      ?auto_33030 - BLOCK
      ?auto_33029 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33025 ) ( not ( = ?auto_33025 ?auto_33026 ) ) ( not ( = ?auto_33025 ?auto_33027 ) ) ( not ( = ?auto_33026 ?auto_33027 ) ) ( ON ?auto_33027 ?auto_33028 ) ( not ( = ?auto_33025 ?auto_33028 ) ) ( not ( = ?auto_33026 ?auto_33028 ) ) ( not ( = ?auto_33027 ?auto_33028 ) ) ( CLEAR ?auto_33025 ) ( ON ?auto_33026 ?auto_33027 ) ( CLEAR ?auto_33026 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33030 ) ( ON ?auto_33029 ?auto_33030 ) ( ON ?auto_33028 ?auto_33029 ) ( not ( = ?auto_33030 ?auto_33029 ) ) ( not ( = ?auto_33030 ?auto_33028 ) ) ( not ( = ?auto_33030 ?auto_33027 ) ) ( not ( = ?auto_33030 ?auto_33026 ) ) ( not ( = ?auto_33029 ?auto_33028 ) ) ( not ( = ?auto_33029 ?auto_33027 ) ) ( not ( = ?auto_33029 ?auto_33026 ) ) ( not ( = ?auto_33025 ?auto_33030 ) ) ( not ( = ?auto_33025 ?auto_33029 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33030 ?auto_33029 ?auto_33028 ?auto_33027 )
      ( MAKE-3PILE ?auto_33025 ?auto_33026 ?auto_33027 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33031 - BLOCK
      ?auto_33032 - BLOCK
      ?auto_33033 - BLOCK
    )
    :vars
    (
      ?auto_33036 - BLOCK
      ?auto_33035 - BLOCK
      ?auto_33034 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33031 ?auto_33032 ) ) ( not ( = ?auto_33031 ?auto_33033 ) ) ( not ( = ?auto_33032 ?auto_33033 ) ) ( ON ?auto_33033 ?auto_33036 ) ( not ( = ?auto_33031 ?auto_33036 ) ) ( not ( = ?auto_33032 ?auto_33036 ) ) ( not ( = ?auto_33033 ?auto_33036 ) ) ( ON ?auto_33032 ?auto_33033 ) ( CLEAR ?auto_33032 ) ( ON-TABLE ?auto_33035 ) ( ON ?auto_33034 ?auto_33035 ) ( ON ?auto_33036 ?auto_33034 ) ( not ( = ?auto_33035 ?auto_33034 ) ) ( not ( = ?auto_33035 ?auto_33036 ) ) ( not ( = ?auto_33035 ?auto_33033 ) ) ( not ( = ?auto_33035 ?auto_33032 ) ) ( not ( = ?auto_33034 ?auto_33036 ) ) ( not ( = ?auto_33034 ?auto_33033 ) ) ( not ( = ?auto_33034 ?auto_33032 ) ) ( not ( = ?auto_33031 ?auto_33035 ) ) ( not ( = ?auto_33031 ?auto_33034 ) ) ( HOLDING ?auto_33031 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33031 )
      ( MAKE-3PILE ?auto_33031 ?auto_33032 ?auto_33033 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33037 - BLOCK
      ?auto_33038 - BLOCK
      ?auto_33039 - BLOCK
    )
    :vars
    (
      ?auto_33041 - BLOCK
      ?auto_33040 - BLOCK
      ?auto_33042 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33037 ?auto_33038 ) ) ( not ( = ?auto_33037 ?auto_33039 ) ) ( not ( = ?auto_33038 ?auto_33039 ) ) ( ON ?auto_33039 ?auto_33041 ) ( not ( = ?auto_33037 ?auto_33041 ) ) ( not ( = ?auto_33038 ?auto_33041 ) ) ( not ( = ?auto_33039 ?auto_33041 ) ) ( ON ?auto_33038 ?auto_33039 ) ( ON-TABLE ?auto_33040 ) ( ON ?auto_33042 ?auto_33040 ) ( ON ?auto_33041 ?auto_33042 ) ( not ( = ?auto_33040 ?auto_33042 ) ) ( not ( = ?auto_33040 ?auto_33041 ) ) ( not ( = ?auto_33040 ?auto_33039 ) ) ( not ( = ?auto_33040 ?auto_33038 ) ) ( not ( = ?auto_33042 ?auto_33041 ) ) ( not ( = ?auto_33042 ?auto_33039 ) ) ( not ( = ?auto_33042 ?auto_33038 ) ) ( not ( = ?auto_33037 ?auto_33040 ) ) ( not ( = ?auto_33037 ?auto_33042 ) ) ( ON ?auto_33037 ?auto_33038 ) ( CLEAR ?auto_33037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_33040 ?auto_33042 ?auto_33041 ?auto_33039 ?auto_33038 )
      ( MAKE-3PILE ?auto_33037 ?auto_33038 ?auto_33039 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33045 - BLOCK
      ?auto_33046 - BLOCK
    )
    :vars
    (
      ?auto_33047 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33047 ?auto_33046 ) ( CLEAR ?auto_33047 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33045 ) ( ON ?auto_33046 ?auto_33045 ) ( not ( = ?auto_33045 ?auto_33046 ) ) ( not ( = ?auto_33045 ?auto_33047 ) ) ( not ( = ?auto_33046 ?auto_33047 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33047 ?auto_33046 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33048 - BLOCK
      ?auto_33049 - BLOCK
    )
    :vars
    (
      ?auto_33050 - BLOCK
      ?auto_33051 - BLOCK
      ?auto_33052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33050 ?auto_33049 ) ( CLEAR ?auto_33050 ) ( ON-TABLE ?auto_33048 ) ( ON ?auto_33049 ?auto_33048 ) ( not ( = ?auto_33048 ?auto_33049 ) ) ( not ( = ?auto_33048 ?auto_33050 ) ) ( not ( = ?auto_33049 ?auto_33050 ) ) ( HOLDING ?auto_33051 ) ( CLEAR ?auto_33052 ) ( not ( = ?auto_33048 ?auto_33051 ) ) ( not ( = ?auto_33048 ?auto_33052 ) ) ( not ( = ?auto_33049 ?auto_33051 ) ) ( not ( = ?auto_33049 ?auto_33052 ) ) ( not ( = ?auto_33050 ?auto_33051 ) ) ( not ( = ?auto_33050 ?auto_33052 ) ) ( not ( = ?auto_33051 ?auto_33052 ) ) )
    :subtasks
    ( ( !STACK ?auto_33051 ?auto_33052 )
      ( MAKE-2PILE ?auto_33048 ?auto_33049 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33053 - BLOCK
      ?auto_33054 - BLOCK
    )
    :vars
    (
      ?auto_33056 - BLOCK
      ?auto_33055 - BLOCK
      ?auto_33057 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33056 ?auto_33054 ) ( ON-TABLE ?auto_33053 ) ( ON ?auto_33054 ?auto_33053 ) ( not ( = ?auto_33053 ?auto_33054 ) ) ( not ( = ?auto_33053 ?auto_33056 ) ) ( not ( = ?auto_33054 ?auto_33056 ) ) ( CLEAR ?auto_33055 ) ( not ( = ?auto_33053 ?auto_33057 ) ) ( not ( = ?auto_33053 ?auto_33055 ) ) ( not ( = ?auto_33054 ?auto_33057 ) ) ( not ( = ?auto_33054 ?auto_33055 ) ) ( not ( = ?auto_33056 ?auto_33057 ) ) ( not ( = ?auto_33056 ?auto_33055 ) ) ( not ( = ?auto_33057 ?auto_33055 ) ) ( ON ?auto_33057 ?auto_33056 ) ( CLEAR ?auto_33057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33053 ?auto_33054 ?auto_33056 )
      ( MAKE-2PILE ?auto_33053 ?auto_33054 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33058 - BLOCK
      ?auto_33059 - BLOCK
    )
    :vars
    (
      ?auto_33062 - BLOCK
      ?auto_33060 - BLOCK
      ?auto_33061 - BLOCK
      ?auto_33063 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33062 ?auto_33059 ) ( ON-TABLE ?auto_33058 ) ( ON ?auto_33059 ?auto_33058 ) ( not ( = ?auto_33058 ?auto_33059 ) ) ( not ( = ?auto_33058 ?auto_33062 ) ) ( not ( = ?auto_33059 ?auto_33062 ) ) ( not ( = ?auto_33058 ?auto_33060 ) ) ( not ( = ?auto_33058 ?auto_33061 ) ) ( not ( = ?auto_33059 ?auto_33060 ) ) ( not ( = ?auto_33059 ?auto_33061 ) ) ( not ( = ?auto_33062 ?auto_33060 ) ) ( not ( = ?auto_33062 ?auto_33061 ) ) ( not ( = ?auto_33060 ?auto_33061 ) ) ( ON ?auto_33060 ?auto_33062 ) ( CLEAR ?auto_33060 ) ( HOLDING ?auto_33061 ) ( CLEAR ?auto_33063 ) ( ON-TABLE ?auto_33063 ) ( not ( = ?auto_33063 ?auto_33061 ) ) ( not ( = ?auto_33058 ?auto_33063 ) ) ( not ( = ?auto_33059 ?auto_33063 ) ) ( not ( = ?auto_33062 ?auto_33063 ) ) ( not ( = ?auto_33060 ?auto_33063 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33063 ?auto_33061 )
      ( MAKE-2PILE ?auto_33058 ?auto_33059 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33064 - BLOCK
      ?auto_33065 - BLOCK
    )
    :vars
    (
      ?auto_33067 - BLOCK
      ?auto_33069 - BLOCK
      ?auto_33068 - BLOCK
      ?auto_33066 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33067 ?auto_33065 ) ( ON-TABLE ?auto_33064 ) ( ON ?auto_33065 ?auto_33064 ) ( not ( = ?auto_33064 ?auto_33065 ) ) ( not ( = ?auto_33064 ?auto_33067 ) ) ( not ( = ?auto_33065 ?auto_33067 ) ) ( not ( = ?auto_33064 ?auto_33069 ) ) ( not ( = ?auto_33064 ?auto_33068 ) ) ( not ( = ?auto_33065 ?auto_33069 ) ) ( not ( = ?auto_33065 ?auto_33068 ) ) ( not ( = ?auto_33067 ?auto_33069 ) ) ( not ( = ?auto_33067 ?auto_33068 ) ) ( not ( = ?auto_33069 ?auto_33068 ) ) ( ON ?auto_33069 ?auto_33067 ) ( CLEAR ?auto_33066 ) ( ON-TABLE ?auto_33066 ) ( not ( = ?auto_33066 ?auto_33068 ) ) ( not ( = ?auto_33064 ?auto_33066 ) ) ( not ( = ?auto_33065 ?auto_33066 ) ) ( not ( = ?auto_33067 ?auto_33066 ) ) ( not ( = ?auto_33069 ?auto_33066 ) ) ( ON ?auto_33068 ?auto_33069 ) ( CLEAR ?auto_33068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33064 ?auto_33065 ?auto_33067 ?auto_33069 )
      ( MAKE-2PILE ?auto_33064 ?auto_33065 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33070 - BLOCK
      ?auto_33071 - BLOCK
    )
    :vars
    (
      ?auto_33072 - BLOCK
      ?auto_33073 - BLOCK
      ?auto_33075 - BLOCK
      ?auto_33074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33072 ?auto_33071 ) ( ON-TABLE ?auto_33070 ) ( ON ?auto_33071 ?auto_33070 ) ( not ( = ?auto_33070 ?auto_33071 ) ) ( not ( = ?auto_33070 ?auto_33072 ) ) ( not ( = ?auto_33071 ?auto_33072 ) ) ( not ( = ?auto_33070 ?auto_33073 ) ) ( not ( = ?auto_33070 ?auto_33075 ) ) ( not ( = ?auto_33071 ?auto_33073 ) ) ( not ( = ?auto_33071 ?auto_33075 ) ) ( not ( = ?auto_33072 ?auto_33073 ) ) ( not ( = ?auto_33072 ?auto_33075 ) ) ( not ( = ?auto_33073 ?auto_33075 ) ) ( ON ?auto_33073 ?auto_33072 ) ( not ( = ?auto_33074 ?auto_33075 ) ) ( not ( = ?auto_33070 ?auto_33074 ) ) ( not ( = ?auto_33071 ?auto_33074 ) ) ( not ( = ?auto_33072 ?auto_33074 ) ) ( not ( = ?auto_33073 ?auto_33074 ) ) ( ON ?auto_33075 ?auto_33073 ) ( CLEAR ?auto_33075 ) ( HOLDING ?auto_33074 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33074 )
      ( MAKE-2PILE ?auto_33070 ?auto_33071 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33076 - BLOCK
      ?auto_33077 - BLOCK
    )
    :vars
    (
      ?auto_33078 - BLOCK
      ?auto_33080 - BLOCK
      ?auto_33079 - BLOCK
      ?auto_33081 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33078 ?auto_33077 ) ( ON-TABLE ?auto_33076 ) ( ON ?auto_33077 ?auto_33076 ) ( not ( = ?auto_33076 ?auto_33077 ) ) ( not ( = ?auto_33076 ?auto_33078 ) ) ( not ( = ?auto_33077 ?auto_33078 ) ) ( not ( = ?auto_33076 ?auto_33080 ) ) ( not ( = ?auto_33076 ?auto_33079 ) ) ( not ( = ?auto_33077 ?auto_33080 ) ) ( not ( = ?auto_33077 ?auto_33079 ) ) ( not ( = ?auto_33078 ?auto_33080 ) ) ( not ( = ?auto_33078 ?auto_33079 ) ) ( not ( = ?auto_33080 ?auto_33079 ) ) ( ON ?auto_33080 ?auto_33078 ) ( not ( = ?auto_33081 ?auto_33079 ) ) ( not ( = ?auto_33076 ?auto_33081 ) ) ( not ( = ?auto_33077 ?auto_33081 ) ) ( not ( = ?auto_33078 ?auto_33081 ) ) ( not ( = ?auto_33080 ?auto_33081 ) ) ( ON ?auto_33079 ?auto_33080 ) ( ON ?auto_33081 ?auto_33079 ) ( CLEAR ?auto_33081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_33076 ?auto_33077 ?auto_33078 ?auto_33080 ?auto_33079 )
      ( MAKE-2PILE ?auto_33076 ?auto_33077 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33086 - BLOCK
      ?auto_33087 - BLOCK
      ?auto_33088 - BLOCK
      ?auto_33089 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_33089 ) ( CLEAR ?auto_33088 ) ( ON-TABLE ?auto_33086 ) ( ON ?auto_33087 ?auto_33086 ) ( ON ?auto_33088 ?auto_33087 ) ( not ( = ?auto_33086 ?auto_33087 ) ) ( not ( = ?auto_33086 ?auto_33088 ) ) ( not ( = ?auto_33086 ?auto_33089 ) ) ( not ( = ?auto_33087 ?auto_33088 ) ) ( not ( = ?auto_33087 ?auto_33089 ) ) ( not ( = ?auto_33088 ?auto_33089 ) ) )
    :subtasks
    ( ( !STACK ?auto_33089 ?auto_33088 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33090 - BLOCK
      ?auto_33091 - BLOCK
      ?auto_33092 - BLOCK
      ?auto_33093 - BLOCK
    )
    :vars
    (
      ?auto_33094 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_33092 ) ( ON-TABLE ?auto_33090 ) ( ON ?auto_33091 ?auto_33090 ) ( ON ?auto_33092 ?auto_33091 ) ( not ( = ?auto_33090 ?auto_33091 ) ) ( not ( = ?auto_33090 ?auto_33092 ) ) ( not ( = ?auto_33090 ?auto_33093 ) ) ( not ( = ?auto_33091 ?auto_33092 ) ) ( not ( = ?auto_33091 ?auto_33093 ) ) ( not ( = ?auto_33092 ?auto_33093 ) ) ( ON ?auto_33093 ?auto_33094 ) ( CLEAR ?auto_33093 ) ( HAND-EMPTY ) ( not ( = ?auto_33090 ?auto_33094 ) ) ( not ( = ?auto_33091 ?auto_33094 ) ) ( not ( = ?auto_33092 ?auto_33094 ) ) ( not ( = ?auto_33093 ?auto_33094 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33093 ?auto_33094 )
      ( MAKE-4PILE ?auto_33090 ?auto_33091 ?auto_33092 ?auto_33093 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33095 - BLOCK
      ?auto_33096 - BLOCK
      ?auto_33097 - BLOCK
      ?auto_33098 - BLOCK
    )
    :vars
    (
      ?auto_33099 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33095 ) ( ON ?auto_33096 ?auto_33095 ) ( not ( = ?auto_33095 ?auto_33096 ) ) ( not ( = ?auto_33095 ?auto_33097 ) ) ( not ( = ?auto_33095 ?auto_33098 ) ) ( not ( = ?auto_33096 ?auto_33097 ) ) ( not ( = ?auto_33096 ?auto_33098 ) ) ( not ( = ?auto_33097 ?auto_33098 ) ) ( ON ?auto_33098 ?auto_33099 ) ( CLEAR ?auto_33098 ) ( not ( = ?auto_33095 ?auto_33099 ) ) ( not ( = ?auto_33096 ?auto_33099 ) ) ( not ( = ?auto_33097 ?auto_33099 ) ) ( not ( = ?auto_33098 ?auto_33099 ) ) ( HOLDING ?auto_33097 ) ( CLEAR ?auto_33096 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33095 ?auto_33096 ?auto_33097 )
      ( MAKE-4PILE ?auto_33095 ?auto_33096 ?auto_33097 ?auto_33098 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33100 - BLOCK
      ?auto_33101 - BLOCK
      ?auto_33102 - BLOCK
      ?auto_33103 - BLOCK
    )
    :vars
    (
      ?auto_33104 - BLOCK
      ?auto_33105 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33100 ) ( ON ?auto_33101 ?auto_33100 ) ( not ( = ?auto_33100 ?auto_33101 ) ) ( not ( = ?auto_33100 ?auto_33102 ) ) ( not ( = ?auto_33100 ?auto_33103 ) ) ( not ( = ?auto_33101 ?auto_33102 ) ) ( not ( = ?auto_33101 ?auto_33103 ) ) ( not ( = ?auto_33102 ?auto_33103 ) ) ( ON ?auto_33103 ?auto_33104 ) ( not ( = ?auto_33100 ?auto_33104 ) ) ( not ( = ?auto_33101 ?auto_33104 ) ) ( not ( = ?auto_33102 ?auto_33104 ) ) ( not ( = ?auto_33103 ?auto_33104 ) ) ( CLEAR ?auto_33101 ) ( ON ?auto_33102 ?auto_33103 ) ( CLEAR ?auto_33102 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33105 ) ( ON ?auto_33104 ?auto_33105 ) ( not ( = ?auto_33105 ?auto_33104 ) ) ( not ( = ?auto_33105 ?auto_33103 ) ) ( not ( = ?auto_33105 ?auto_33102 ) ) ( not ( = ?auto_33100 ?auto_33105 ) ) ( not ( = ?auto_33101 ?auto_33105 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33105 ?auto_33104 ?auto_33103 )
      ( MAKE-4PILE ?auto_33100 ?auto_33101 ?auto_33102 ?auto_33103 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33106 - BLOCK
      ?auto_33107 - BLOCK
      ?auto_33108 - BLOCK
      ?auto_33109 - BLOCK
    )
    :vars
    (
      ?auto_33110 - BLOCK
      ?auto_33111 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33106 ) ( not ( = ?auto_33106 ?auto_33107 ) ) ( not ( = ?auto_33106 ?auto_33108 ) ) ( not ( = ?auto_33106 ?auto_33109 ) ) ( not ( = ?auto_33107 ?auto_33108 ) ) ( not ( = ?auto_33107 ?auto_33109 ) ) ( not ( = ?auto_33108 ?auto_33109 ) ) ( ON ?auto_33109 ?auto_33110 ) ( not ( = ?auto_33106 ?auto_33110 ) ) ( not ( = ?auto_33107 ?auto_33110 ) ) ( not ( = ?auto_33108 ?auto_33110 ) ) ( not ( = ?auto_33109 ?auto_33110 ) ) ( ON ?auto_33108 ?auto_33109 ) ( CLEAR ?auto_33108 ) ( ON-TABLE ?auto_33111 ) ( ON ?auto_33110 ?auto_33111 ) ( not ( = ?auto_33111 ?auto_33110 ) ) ( not ( = ?auto_33111 ?auto_33109 ) ) ( not ( = ?auto_33111 ?auto_33108 ) ) ( not ( = ?auto_33106 ?auto_33111 ) ) ( not ( = ?auto_33107 ?auto_33111 ) ) ( HOLDING ?auto_33107 ) ( CLEAR ?auto_33106 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33106 ?auto_33107 )
      ( MAKE-4PILE ?auto_33106 ?auto_33107 ?auto_33108 ?auto_33109 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33112 - BLOCK
      ?auto_33113 - BLOCK
      ?auto_33114 - BLOCK
      ?auto_33115 - BLOCK
    )
    :vars
    (
      ?auto_33116 - BLOCK
      ?auto_33117 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33112 ) ( not ( = ?auto_33112 ?auto_33113 ) ) ( not ( = ?auto_33112 ?auto_33114 ) ) ( not ( = ?auto_33112 ?auto_33115 ) ) ( not ( = ?auto_33113 ?auto_33114 ) ) ( not ( = ?auto_33113 ?auto_33115 ) ) ( not ( = ?auto_33114 ?auto_33115 ) ) ( ON ?auto_33115 ?auto_33116 ) ( not ( = ?auto_33112 ?auto_33116 ) ) ( not ( = ?auto_33113 ?auto_33116 ) ) ( not ( = ?auto_33114 ?auto_33116 ) ) ( not ( = ?auto_33115 ?auto_33116 ) ) ( ON ?auto_33114 ?auto_33115 ) ( ON-TABLE ?auto_33117 ) ( ON ?auto_33116 ?auto_33117 ) ( not ( = ?auto_33117 ?auto_33116 ) ) ( not ( = ?auto_33117 ?auto_33115 ) ) ( not ( = ?auto_33117 ?auto_33114 ) ) ( not ( = ?auto_33112 ?auto_33117 ) ) ( not ( = ?auto_33113 ?auto_33117 ) ) ( CLEAR ?auto_33112 ) ( ON ?auto_33113 ?auto_33114 ) ( CLEAR ?auto_33113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33117 ?auto_33116 ?auto_33115 ?auto_33114 )
      ( MAKE-4PILE ?auto_33112 ?auto_33113 ?auto_33114 ?auto_33115 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33118 - BLOCK
      ?auto_33119 - BLOCK
      ?auto_33120 - BLOCK
      ?auto_33121 - BLOCK
    )
    :vars
    (
      ?auto_33123 - BLOCK
      ?auto_33122 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33118 ?auto_33119 ) ) ( not ( = ?auto_33118 ?auto_33120 ) ) ( not ( = ?auto_33118 ?auto_33121 ) ) ( not ( = ?auto_33119 ?auto_33120 ) ) ( not ( = ?auto_33119 ?auto_33121 ) ) ( not ( = ?auto_33120 ?auto_33121 ) ) ( ON ?auto_33121 ?auto_33123 ) ( not ( = ?auto_33118 ?auto_33123 ) ) ( not ( = ?auto_33119 ?auto_33123 ) ) ( not ( = ?auto_33120 ?auto_33123 ) ) ( not ( = ?auto_33121 ?auto_33123 ) ) ( ON ?auto_33120 ?auto_33121 ) ( ON-TABLE ?auto_33122 ) ( ON ?auto_33123 ?auto_33122 ) ( not ( = ?auto_33122 ?auto_33123 ) ) ( not ( = ?auto_33122 ?auto_33121 ) ) ( not ( = ?auto_33122 ?auto_33120 ) ) ( not ( = ?auto_33118 ?auto_33122 ) ) ( not ( = ?auto_33119 ?auto_33122 ) ) ( ON ?auto_33119 ?auto_33120 ) ( CLEAR ?auto_33119 ) ( HOLDING ?auto_33118 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33118 )
      ( MAKE-4PILE ?auto_33118 ?auto_33119 ?auto_33120 ?auto_33121 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33124 - BLOCK
      ?auto_33125 - BLOCK
      ?auto_33126 - BLOCK
      ?auto_33127 - BLOCK
    )
    :vars
    (
      ?auto_33129 - BLOCK
      ?auto_33128 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33124 ?auto_33125 ) ) ( not ( = ?auto_33124 ?auto_33126 ) ) ( not ( = ?auto_33124 ?auto_33127 ) ) ( not ( = ?auto_33125 ?auto_33126 ) ) ( not ( = ?auto_33125 ?auto_33127 ) ) ( not ( = ?auto_33126 ?auto_33127 ) ) ( ON ?auto_33127 ?auto_33129 ) ( not ( = ?auto_33124 ?auto_33129 ) ) ( not ( = ?auto_33125 ?auto_33129 ) ) ( not ( = ?auto_33126 ?auto_33129 ) ) ( not ( = ?auto_33127 ?auto_33129 ) ) ( ON ?auto_33126 ?auto_33127 ) ( ON-TABLE ?auto_33128 ) ( ON ?auto_33129 ?auto_33128 ) ( not ( = ?auto_33128 ?auto_33129 ) ) ( not ( = ?auto_33128 ?auto_33127 ) ) ( not ( = ?auto_33128 ?auto_33126 ) ) ( not ( = ?auto_33124 ?auto_33128 ) ) ( not ( = ?auto_33125 ?auto_33128 ) ) ( ON ?auto_33125 ?auto_33126 ) ( ON ?auto_33124 ?auto_33125 ) ( CLEAR ?auto_33124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_33128 ?auto_33129 ?auto_33127 ?auto_33126 ?auto_33125 )
      ( MAKE-4PILE ?auto_33124 ?auto_33125 ?auto_33126 ?auto_33127 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33131 - BLOCK
    )
    :vars
    (
      ?auto_33132 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33132 ?auto_33131 ) ( CLEAR ?auto_33132 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33131 ) ( not ( = ?auto_33131 ?auto_33132 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33132 ?auto_33131 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33133 - BLOCK
    )
    :vars
    (
      ?auto_33134 - BLOCK
      ?auto_33135 - BLOCK
      ?auto_33136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33134 ?auto_33133 ) ( CLEAR ?auto_33134 ) ( ON-TABLE ?auto_33133 ) ( not ( = ?auto_33133 ?auto_33134 ) ) ( HOLDING ?auto_33135 ) ( CLEAR ?auto_33136 ) ( not ( = ?auto_33133 ?auto_33135 ) ) ( not ( = ?auto_33133 ?auto_33136 ) ) ( not ( = ?auto_33134 ?auto_33135 ) ) ( not ( = ?auto_33134 ?auto_33136 ) ) ( not ( = ?auto_33135 ?auto_33136 ) ) )
    :subtasks
    ( ( !STACK ?auto_33135 ?auto_33136 )
      ( MAKE-1PILE ?auto_33133 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33137 - BLOCK
    )
    :vars
    (
      ?auto_33138 - BLOCK
      ?auto_33140 - BLOCK
      ?auto_33139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33138 ?auto_33137 ) ( ON-TABLE ?auto_33137 ) ( not ( = ?auto_33137 ?auto_33138 ) ) ( CLEAR ?auto_33140 ) ( not ( = ?auto_33137 ?auto_33139 ) ) ( not ( = ?auto_33137 ?auto_33140 ) ) ( not ( = ?auto_33138 ?auto_33139 ) ) ( not ( = ?auto_33138 ?auto_33140 ) ) ( not ( = ?auto_33139 ?auto_33140 ) ) ( ON ?auto_33139 ?auto_33138 ) ( CLEAR ?auto_33139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33137 ?auto_33138 )
      ( MAKE-1PILE ?auto_33137 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33141 - BLOCK
    )
    :vars
    (
      ?auto_33142 - BLOCK
      ?auto_33144 - BLOCK
      ?auto_33143 - BLOCK
      ?auto_33146 - BLOCK
      ?auto_33145 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33142 ?auto_33141 ) ( ON-TABLE ?auto_33141 ) ( not ( = ?auto_33141 ?auto_33142 ) ) ( not ( = ?auto_33141 ?auto_33144 ) ) ( not ( = ?auto_33141 ?auto_33143 ) ) ( not ( = ?auto_33142 ?auto_33144 ) ) ( not ( = ?auto_33142 ?auto_33143 ) ) ( not ( = ?auto_33144 ?auto_33143 ) ) ( ON ?auto_33144 ?auto_33142 ) ( CLEAR ?auto_33144 ) ( HOLDING ?auto_33143 ) ( CLEAR ?auto_33146 ) ( ON-TABLE ?auto_33145 ) ( ON ?auto_33146 ?auto_33145 ) ( not ( = ?auto_33145 ?auto_33146 ) ) ( not ( = ?auto_33145 ?auto_33143 ) ) ( not ( = ?auto_33146 ?auto_33143 ) ) ( not ( = ?auto_33141 ?auto_33146 ) ) ( not ( = ?auto_33141 ?auto_33145 ) ) ( not ( = ?auto_33142 ?auto_33146 ) ) ( not ( = ?auto_33142 ?auto_33145 ) ) ( not ( = ?auto_33144 ?auto_33146 ) ) ( not ( = ?auto_33144 ?auto_33145 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33145 ?auto_33146 ?auto_33143 )
      ( MAKE-1PILE ?auto_33141 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33147 - BLOCK
    )
    :vars
    (
      ?auto_33148 - BLOCK
      ?auto_33151 - BLOCK
      ?auto_33150 - BLOCK
      ?auto_33152 - BLOCK
      ?auto_33149 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33148 ?auto_33147 ) ( ON-TABLE ?auto_33147 ) ( not ( = ?auto_33147 ?auto_33148 ) ) ( not ( = ?auto_33147 ?auto_33151 ) ) ( not ( = ?auto_33147 ?auto_33150 ) ) ( not ( = ?auto_33148 ?auto_33151 ) ) ( not ( = ?auto_33148 ?auto_33150 ) ) ( not ( = ?auto_33151 ?auto_33150 ) ) ( ON ?auto_33151 ?auto_33148 ) ( CLEAR ?auto_33152 ) ( ON-TABLE ?auto_33149 ) ( ON ?auto_33152 ?auto_33149 ) ( not ( = ?auto_33149 ?auto_33152 ) ) ( not ( = ?auto_33149 ?auto_33150 ) ) ( not ( = ?auto_33152 ?auto_33150 ) ) ( not ( = ?auto_33147 ?auto_33152 ) ) ( not ( = ?auto_33147 ?auto_33149 ) ) ( not ( = ?auto_33148 ?auto_33152 ) ) ( not ( = ?auto_33148 ?auto_33149 ) ) ( not ( = ?auto_33151 ?auto_33152 ) ) ( not ( = ?auto_33151 ?auto_33149 ) ) ( ON ?auto_33150 ?auto_33151 ) ( CLEAR ?auto_33150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33147 ?auto_33148 ?auto_33151 )
      ( MAKE-1PILE ?auto_33147 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33153 - BLOCK
    )
    :vars
    (
      ?auto_33155 - BLOCK
      ?auto_33157 - BLOCK
      ?auto_33154 - BLOCK
      ?auto_33158 - BLOCK
      ?auto_33156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33155 ?auto_33153 ) ( ON-TABLE ?auto_33153 ) ( not ( = ?auto_33153 ?auto_33155 ) ) ( not ( = ?auto_33153 ?auto_33157 ) ) ( not ( = ?auto_33153 ?auto_33154 ) ) ( not ( = ?auto_33155 ?auto_33157 ) ) ( not ( = ?auto_33155 ?auto_33154 ) ) ( not ( = ?auto_33157 ?auto_33154 ) ) ( ON ?auto_33157 ?auto_33155 ) ( ON-TABLE ?auto_33158 ) ( not ( = ?auto_33158 ?auto_33156 ) ) ( not ( = ?auto_33158 ?auto_33154 ) ) ( not ( = ?auto_33156 ?auto_33154 ) ) ( not ( = ?auto_33153 ?auto_33156 ) ) ( not ( = ?auto_33153 ?auto_33158 ) ) ( not ( = ?auto_33155 ?auto_33156 ) ) ( not ( = ?auto_33155 ?auto_33158 ) ) ( not ( = ?auto_33157 ?auto_33156 ) ) ( not ( = ?auto_33157 ?auto_33158 ) ) ( ON ?auto_33154 ?auto_33157 ) ( CLEAR ?auto_33154 ) ( HOLDING ?auto_33156 ) ( CLEAR ?auto_33158 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33158 ?auto_33156 )
      ( MAKE-1PILE ?auto_33153 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33159 - BLOCK
    )
    :vars
    (
      ?auto_33161 - BLOCK
      ?auto_33164 - BLOCK
      ?auto_33160 - BLOCK
      ?auto_33163 - BLOCK
      ?auto_33162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33161 ?auto_33159 ) ( ON-TABLE ?auto_33159 ) ( not ( = ?auto_33159 ?auto_33161 ) ) ( not ( = ?auto_33159 ?auto_33164 ) ) ( not ( = ?auto_33159 ?auto_33160 ) ) ( not ( = ?auto_33161 ?auto_33164 ) ) ( not ( = ?auto_33161 ?auto_33160 ) ) ( not ( = ?auto_33164 ?auto_33160 ) ) ( ON ?auto_33164 ?auto_33161 ) ( ON-TABLE ?auto_33163 ) ( not ( = ?auto_33163 ?auto_33162 ) ) ( not ( = ?auto_33163 ?auto_33160 ) ) ( not ( = ?auto_33162 ?auto_33160 ) ) ( not ( = ?auto_33159 ?auto_33162 ) ) ( not ( = ?auto_33159 ?auto_33163 ) ) ( not ( = ?auto_33161 ?auto_33162 ) ) ( not ( = ?auto_33161 ?auto_33163 ) ) ( not ( = ?auto_33164 ?auto_33162 ) ) ( not ( = ?auto_33164 ?auto_33163 ) ) ( ON ?auto_33160 ?auto_33164 ) ( CLEAR ?auto_33163 ) ( ON ?auto_33162 ?auto_33160 ) ( CLEAR ?auto_33162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33159 ?auto_33161 ?auto_33164 ?auto_33160 )
      ( MAKE-1PILE ?auto_33159 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33165 - BLOCK
    )
    :vars
    (
      ?auto_33166 - BLOCK
      ?auto_33167 - BLOCK
      ?auto_33170 - BLOCK
      ?auto_33169 - BLOCK
      ?auto_33168 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33166 ?auto_33165 ) ( ON-TABLE ?auto_33165 ) ( not ( = ?auto_33165 ?auto_33166 ) ) ( not ( = ?auto_33165 ?auto_33167 ) ) ( not ( = ?auto_33165 ?auto_33170 ) ) ( not ( = ?auto_33166 ?auto_33167 ) ) ( not ( = ?auto_33166 ?auto_33170 ) ) ( not ( = ?auto_33167 ?auto_33170 ) ) ( ON ?auto_33167 ?auto_33166 ) ( not ( = ?auto_33169 ?auto_33168 ) ) ( not ( = ?auto_33169 ?auto_33170 ) ) ( not ( = ?auto_33168 ?auto_33170 ) ) ( not ( = ?auto_33165 ?auto_33168 ) ) ( not ( = ?auto_33165 ?auto_33169 ) ) ( not ( = ?auto_33166 ?auto_33168 ) ) ( not ( = ?auto_33166 ?auto_33169 ) ) ( not ( = ?auto_33167 ?auto_33168 ) ) ( not ( = ?auto_33167 ?auto_33169 ) ) ( ON ?auto_33170 ?auto_33167 ) ( ON ?auto_33168 ?auto_33170 ) ( CLEAR ?auto_33168 ) ( HOLDING ?auto_33169 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33169 )
      ( MAKE-1PILE ?auto_33165 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33171 - BLOCK
    )
    :vars
    (
      ?auto_33173 - BLOCK
      ?auto_33175 - BLOCK
      ?auto_33172 - BLOCK
      ?auto_33174 - BLOCK
      ?auto_33176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33173 ?auto_33171 ) ( ON-TABLE ?auto_33171 ) ( not ( = ?auto_33171 ?auto_33173 ) ) ( not ( = ?auto_33171 ?auto_33175 ) ) ( not ( = ?auto_33171 ?auto_33172 ) ) ( not ( = ?auto_33173 ?auto_33175 ) ) ( not ( = ?auto_33173 ?auto_33172 ) ) ( not ( = ?auto_33175 ?auto_33172 ) ) ( ON ?auto_33175 ?auto_33173 ) ( not ( = ?auto_33174 ?auto_33176 ) ) ( not ( = ?auto_33174 ?auto_33172 ) ) ( not ( = ?auto_33176 ?auto_33172 ) ) ( not ( = ?auto_33171 ?auto_33176 ) ) ( not ( = ?auto_33171 ?auto_33174 ) ) ( not ( = ?auto_33173 ?auto_33176 ) ) ( not ( = ?auto_33173 ?auto_33174 ) ) ( not ( = ?auto_33175 ?auto_33176 ) ) ( not ( = ?auto_33175 ?auto_33174 ) ) ( ON ?auto_33172 ?auto_33175 ) ( ON ?auto_33176 ?auto_33172 ) ( ON ?auto_33174 ?auto_33176 ) ( CLEAR ?auto_33174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_33171 ?auto_33173 ?auto_33175 ?auto_33172 ?auto_33176 )
      ( MAKE-1PILE ?auto_33171 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33182 - BLOCK
      ?auto_33183 - BLOCK
      ?auto_33184 - BLOCK
      ?auto_33185 - BLOCK
      ?auto_33186 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_33186 ) ( CLEAR ?auto_33185 ) ( ON-TABLE ?auto_33182 ) ( ON ?auto_33183 ?auto_33182 ) ( ON ?auto_33184 ?auto_33183 ) ( ON ?auto_33185 ?auto_33184 ) ( not ( = ?auto_33182 ?auto_33183 ) ) ( not ( = ?auto_33182 ?auto_33184 ) ) ( not ( = ?auto_33182 ?auto_33185 ) ) ( not ( = ?auto_33182 ?auto_33186 ) ) ( not ( = ?auto_33183 ?auto_33184 ) ) ( not ( = ?auto_33183 ?auto_33185 ) ) ( not ( = ?auto_33183 ?auto_33186 ) ) ( not ( = ?auto_33184 ?auto_33185 ) ) ( not ( = ?auto_33184 ?auto_33186 ) ) ( not ( = ?auto_33185 ?auto_33186 ) ) )
    :subtasks
    ( ( !STACK ?auto_33186 ?auto_33185 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33187 - BLOCK
      ?auto_33188 - BLOCK
      ?auto_33189 - BLOCK
      ?auto_33190 - BLOCK
      ?auto_33191 - BLOCK
    )
    :vars
    (
      ?auto_33192 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_33190 ) ( ON-TABLE ?auto_33187 ) ( ON ?auto_33188 ?auto_33187 ) ( ON ?auto_33189 ?auto_33188 ) ( ON ?auto_33190 ?auto_33189 ) ( not ( = ?auto_33187 ?auto_33188 ) ) ( not ( = ?auto_33187 ?auto_33189 ) ) ( not ( = ?auto_33187 ?auto_33190 ) ) ( not ( = ?auto_33187 ?auto_33191 ) ) ( not ( = ?auto_33188 ?auto_33189 ) ) ( not ( = ?auto_33188 ?auto_33190 ) ) ( not ( = ?auto_33188 ?auto_33191 ) ) ( not ( = ?auto_33189 ?auto_33190 ) ) ( not ( = ?auto_33189 ?auto_33191 ) ) ( not ( = ?auto_33190 ?auto_33191 ) ) ( ON ?auto_33191 ?auto_33192 ) ( CLEAR ?auto_33191 ) ( HAND-EMPTY ) ( not ( = ?auto_33187 ?auto_33192 ) ) ( not ( = ?auto_33188 ?auto_33192 ) ) ( not ( = ?auto_33189 ?auto_33192 ) ) ( not ( = ?auto_33190 ?auto_33192 ) ) ( not ( = ?auto_33191 ?auto_33192 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33191 ?auto_33192 )
      ( MAKE-5PILE ?auto_33187 ?auto_33188 ?auto_33189 ?auto_33190 ?auto_33191 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33193 - BLOCK
      ?auto_33194 - BLOCK
      ?auto_33195 - BLOCK
      ?auto_33196 - BLOCK
      ?auto_33197 - BLOCK
    )
    :vars
    (
      ?auto_33198 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33193 ) ( ON ?auto_33194 ?auto_33193 ) ( ON ?auto_33195 ?auto_33194 ) ( not ( = ?auto_33193 ?auto_33194 ) ) ( not ( = ?auto_33193 ?auto_33195 ) ) ( not ( = ?auto_33193 ?auto_33196 ) ) ( not ( = ?auto_33193 ?auto_33197 ) ) ( not ( = ?auto_33194 ?auto_33195 ) ) ( not ( = ?auto_33194 ?auto_33196 ) ) ( not ( = ?auto_33194 ?auto_33197 ) ) ( not ( = ?auto_33195 ?auto_33196 ) ) ( not ( = ?auto_33195 ?auto_33197 ) ) ( not ( = ?auto_33196 ?auto_33197 ) ) ( ON ?auto_33197 ?auto_33198 ) ( CLEAR ?auto_33197 ) ( not ( = ?auto_33193 ?auto_33198 ) ) ( not ( = ?auto_33194 ?auto_33198 ) ) ( not ( = ?auto_33195 ?auto_33198 ) ) ( not ( = ?auto_33196 ?auto_33198 ) ) ( not ( = ?auto_33197 ?auto_33198 ) ) ( HOLDING ?auto_33196 ) ( CLEAR ?auto_33195 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33193 ?auto_33194 ?auto_33195 ?auto_33196 )
      ( MAKE-5PILE ?auto_33193 ?auto_33194 ?auto_33195 ?auto_33196 ?auto_33197 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33199 - BLOCK
      ?auto_33200 - BLOCK
      ?auto_33201 - BLOCK
      ?auto_33202 - BLOCK
      ?auto_33203 - BLOCK
    )
    :vars
    (
      ?auto_33204 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33199 ) ( ON ?auto_33200 ?auto_33199 ) ( ON ?auto_33201 ?auto_33200 ) ( not ( = ?auto_33199 ?auto_33200 ) ) ( not ( = ?auto_33199 ?auto_33201 ) ) ( not ( = ?auto_33199 ?auto_33202 ) ) ( not ( = ?auto_33199 ?auto_33203 ) ) ( not ( = ?auto_33200 ?auto_33201 ) ) ( not ( = ?auto_33200 ?auto_33202 ) ) ( not ( = ?auto_33200 ?auto_33203 ) ) ( not ( = ?auto_33201 ?auto_33202 ) ) ( not ( = ?auto_33201 ?auto_33203 ) ) ( not ( = ?auto_33202 ?auto_33203 ) ) ( ON ?auto_33203 ?auto_33204 ) ( not ( = ?auto_33199 ?auto_33204 ) ) ( not ( = ?auto_33200 ?auto_33204 ) ) ( not ( = ?auto_33201 ?auto_33204 ) ) ( not ( = ?auto_33202 ?auto_33204 ) ) ( not ( = ?auto_33203 ?auto_33204 ) ) ( CLEAR ?auto_33201 ) ( ON ?auto_33202 ?auto_33203 ) ( CLEAR ?auto_33202 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33204 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33204 ?auto_33203 )
      ( MAKE-5PILE ?auto_33199 ?auto_33200 ?auto_33201 ?auto_33202 ?auto_33203 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33205 - BLOCK
      ?auto_33206 - BLOCK
      ?auto_33207 - BLOCK
      ?auto_33208 - BLOCK
      ?auto_33209 - BLOCK
    )
    :vars
    (
      ?auto_33210 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33205 ) ( ON ?auto_33206 ?auto_33205 ) ( not ( = ?auto_33205 ?auto_33206 ) ) ( not ( = ?auto_33205 ?auto_33207 ) ) ( not ( = ?auto_33205 ?auto_33208 ) ) ( not ( = ?auto_33205 ?auto_33209 ) ) ( not ( = ?auto_33206 ?auto_33207 ) ) ( not ( = ?auto_33206 ?auto_33208 ) ) ( not ( = ?auto_33206 ?auto_33209 ) ) ( not ( = ?auto_33207 ?auto_33208 ) ) ( not ( = ?auto_33207 ?auto_33209 ) ) ( not ( = ?auto_33208 ?auto_33209 ) ) ( ON ?auto_33209 ?auto_33210 ) ( not ( = ?auto_33205 ?auto_33210 ) ) ( not ( = ?auto_33206 ?auto_33210 ) ) ( not ( = ?auto_33207 ?auto_33210 ) ) ( not ( = ?auto_33208 ?auto_33210 ) ) ( not ( = ?auto_33209 ?auto_33210 ) ) ( ON ?auto_33208 ?auto_33209 ) ( CLEAR ?auto_33208 ) ( ON-TABLE ?auto_33210 ) ( HOLDING ?auto_33207 ) ( CLEAR ?auto_33206 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33205 ?auto_33206 ?auto_33207 )
      ( MAKE-5PILE ?auto_33205 ?auto_33206 ?auto_33207 ?auto_33208 ?auto_33209 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33211 - BLOCK
      ?auto_33212 - BLOCK
      ?auto_33213 - BLOCK
      ?auto_33214 - BLOCK
      ?auto_33215 - BLOCK
    )
    :vars
    (
      ?auto_33216 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33211 ) ( ON ?auto_33212 ?auto_33211 ) ( not ( = ?auto_33211 ?auto_33212 ) ) ( not ( = ?auto_33211 ?auto_33213 ) ) ( not ( = ?auto_33211 ?auto_33214 ) ) ( not ( = ?auto_33211 ?auto_33215 ) ) ( not ( = ?auto_33212 ?auto_33213 ) ) ( not ( = ?auto_33212 ?auto_33214 ) ) ( not ( = ?auto_33212 ?auto_33215 ) ) ( not ( = ?auto_33213 ?auto_33214 ) ) ( not ( = ?auto_33213 ?auto_33215 ) ) ( not ( = ?auto_33214 ?auto_33215 ) ) ( ON ?auto_33215 ?auto_33216 ) ( not ( = ?auto_33211 ?auto_33216 ) ) ( not ( = ?auto_33212 ?auto_33216 ) ) ( not ( = ?auto_33213 ?auto_33216 ) ) ( not ( = ?auto_33214 ?auto_33216 ) ) ( not ( = ?auto_33215 ?auto_33216 ) ) ( ON ?auto_33214 ?auto_33215 ) ( ON-TABLE ?auto_33216 ) ( CLEAR ?auto_33212 ) ( ON ?auto_33213 ?auto_33214 ) ( CLEAR ?auto_33213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33216 ?auto_33215 ?auto_33214 )
      ( MAKE-5PILE ?auto_33211 ?auto_33212 ?auto_33213 ?auto_33214 ?auto_33215 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33217 - BLOCK
      ?auto_33218 - BLOCK
      ?auto_33219 - BLOCK
      ?auto_33220 - BLOCK
      ?auto_33221 - BLOCK
    )
    :vars
    (
      ?auto_33222 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33217 ) ( not ( = ?auto_33217 ?auto_33218 ) ) ( not ( = ?auto_33217 ?auto_33219 ) ) ( not ( = ?auto_33217 ?auto_33220 ) ) ( not ( = ?auto_33217 ?auto_33221 ) ) ( not ( = ?auto_33218 ?auto_33219 ) ) ( not ( = ?auto_33218 ?auto_33220 ) ) ( not ( = ?auto_33218 ?auto_33221 ) ) ( not ( = ?auto_33219 ?auto_33220 ) ) ( not ( = ?auto_33219 ?auto_33221 ) ) ( not ( = ?auto_33220 ?auto_33221 ) ) ( ON ?auto_33221 ?auto_33222 ) ( not ( = ?auto_33217 ?auto_33222 ) ) ( not ( = ?auto_33218 ?auto_33222 ) ) ( not ( = ?auto_33219 ?auto_33222 ) ) ( not ( = ?auto_33220 ?auto_33222 ) ) ( not ( = ?auto_33221 ?auto_33222 ) ) ( ON ?auto_33220 ?auto_33221 ) ( ON-TABLE ?auto_33222 ) ( ON ?auto_33219 ?auto_33220 ) ( CLEAR ?auto_33219 ) ( HOLDING ?auto_33218 ) ( CLEAR ?auto_33217 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33217 ?auto_33218 )
      ( MAKE-5PILE ?auto_33217 ?auto_33218 ?auto_33219 ?auto_33220 ?auto_33221 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33223 - BLOCK
      ?auto_33224 - BLOCK
      ?auto_33225 - BLOCK
      ?auto_33226 - BLOCK
      ?auto_33227 - BLOCK
    )
    :vars
    (
      ?auto_33228 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33223 ) ( not ( = ?auto_33223 ?auto_33224 ) ) ( not ( = ?auto_33223 ?auto_33225 ) ) ( not ( = ?auto_33223 ?auto_33226 ) ) ( not ( = ?auto_33223 ?auto_33227 ) ) ( not ( = ?auto_33224 ?auto_33225 ) ) ( not ( = ?auto_33224 ?auto_33226 ) ) ( not ( = ?auto_33224 ?auto_33227 ) ) ( not ( = ?auto_33225 ?auto_33226 ) ) ( not ( = ?auto_33225 ?auto_33227 ) ) ( not ( = ?auto_33226 ?auto_33227 ) ) ( ON ?auto_33227 ?auto_33228 ) ( not ( = ?auto_33223 ?auto_33228 ) ) ( not ( = ?auto_33224 ?auto_33228 ) ) ( not ( = ?auto_33225 ?auto_33228 ) ) ( not ( = ?auto_33226 ?auto_33228 ) ) ( not ( = ?auto_33227 ?auto_33228 ) ) ( ON ?auto_33226 ?auto_33227 ) ( ON-TABLE ?auto_33228 ) ( ON ?auto_33225 ?auto_33226 ) ( CLEAR ?auto_33223 ) ( ON ?auto_33224 ?auto_33225 ) ( CLEAR ?auto_33224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33228 ?auto_33227 ?auto_33226 ?auto_33225 )
      ( MAKE-5PILE ?auto_33223 ?auto_33224 ?auto_33225 ?auto_33226 ?auto_33227 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33229 - BLOCK
      ?auto_33230 - BLOCK
      ?auto_33231 - BLOCK
      ?auto_33232 - BLOCK
      ?auto_33233 - BLOCK
    )
    :vars
    (
      ?auto_33234 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33229 ?auto_33230 ) ) ( not ( = ?auto_33229 ?auto_33231 ) ) ( not ( = ?auto_33229 ?auto_33232 ) ) ( not ( = ?auto_33229 ?auto_33233 ) ) ( not ( = ?auto_33230 ?auto_33231 ) ) ( not ( = ?auto_33230 ?auto_33232 ) ) ( not ( = ?auto_33230 ?auto_33233 ) ) ( not ( = ?auto_33231 ?auto_33232 ) ) ( not ( = ?auto_33231 ?auto_33233 ) ) ( not ( = ?auto_33232 ?auto_33233 ) ) ( ON ?auto_33233 ?auto_33234 ) ( not ( = ?auto_33229 ?auto_33234 ) ) ( not ( = ?auto_33230 ?auto_33234 ) ) ( not ( = ?auto_33231 ?auto_33234 ) ) ( not ( = ?auto_33232 ?auto_33234 ) ) ( not ( = ?auto_33233 ?auto_33234 ) ) ( ON ?auto_33232 ?auto_33233 ) ( ON-TABLE ?auto_33234 ) ( ON ?auto_33231 ?auto_33232 ) ( ON ?auto_33230 ?auto_33231 ) ( CLEAR ?auto_33230 ) ( HOLDING ?auto_33229 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33229 )
      ( MAKE-5PILE ?auto_33229 ?auto_33230 ?auto_33231 ?auto_33232 ?auto_33233 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33235 - BLOCK
      ?auto_33236 - BLOCK
      ?auto_33237 - BLOCK
      ?auto_33238 - BLOCK
      ?auto_33239 - BLOCK
    )
    :vars
    (
      ?auto_33240 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33235 ?auto_33236 ) ) ( not ( = ?auto_33235 ?auto_33237 ) ) ( not ( = ?auto_33235 ?auto_33238 ) ) ( not ( = ?auto_33235 ?auto_33239 ) ) ( not ( = ?auto_33236 ?auto_33237 ) ) ( not ( = ?auto_33236 ?auto_33238 ) ) ( not ( = ?auto_33236 ?auto_33239 ) ) ( not ( = ?auto_33237 ?auto_33238 ) ) ( not ( = ?auto_33237 ?auto_33239 ) ) ( not ( = ?auto_33238 ?auto_33239 ) ) ( ON ?auto_33239 ?auto_33240 ) ( not ( = ?auto_33235 ?auto_33240 ) ) ( not ( = ?auto_33236 ?auto_33240 ) ) ( not ( = ?auto_33237 ?auto_33240 ) ) ( not ( = ?auto_33238 ?auto_33240 ) ) ( not ( = ?auto_33239 ?auto_33240 ) ) ( ON ?auto_33238 ?auto_33239 ) ( ON-TABLE ?auto_33240 ) ( ON ?auto_33237 ?auto_33238 ) ( ON ?auto_33236 ?auto_33237 ) ( ON ?auto_33235 ?auto_33236 ) ( CLEAR ?auto_33235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_33240 ?auto_33239 ?auto_33238 ?auto_33237 ?auto_33236 )
      ( MAKE-5PILE ?auto_33235 ?auto_33236 ?auto_33237 ?auto_33238 ?auto_33239 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33245 - BLOCK
      ?auto_33246 - BLOCK
      ?auto_33247 - BLOCK
      ?auto_33248 - BLOCK
    )
    :vars
    (
      ?auto_33249 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33249 ?auto_33248 ) ( CLEAR ?auto_33249 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33245 ) ( ON ?auto_33246 ?auto_33245 ) ( ON ?auto_33247 ?auto_33246 ) ( ON ?auto_33248 ?auto_33247 ) ( not ( = ?auto_33245 ?auto_33246 ) ) ( not ( = ?auto_33245 ?auto_33247 ) ) ( not ( = ?auto_33245 ?auto_33248 ) ) ( not ( = ?auto_33245 ?auto_33249 ) ) ( not ( = ?auto_33246 ?auto_33247 ) ) ( not ( = ?auto_33246 ?auto_33248 ) ) ( not ( = ?auto_33246 ?auto_33249 ) ) ( not ( = ?auto_33247 ?auto_33248 ) ) ( not ( = ?auto_33247 ?auto_33249 ) ) ( not ( = ?auto_33248 ?auto_33249 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33249 ?auto_33248 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33261 - BLOCK
      ?auto_33262 - BLOCK
      ?auto_33263 - BLOCK
      ?auto_33264 - BLOCK
    )
    :vars
    (
      ?auto_33265 - BLOCK
      ?auto_33266 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33261 ) ( ON ?auto_33262 ?auto_33261 ) ( ON ?auto_33263 ?auto_33262 ) ( not ( = ?auto_33261 ?auto_33262 ) ) ( not ( = ?auto_33261 ?auto_33263 ) ) ( not ( = ?auto_33261 ?auto_33264 ) ) ( not ( = ?auto_33261 ?auto_33265 ) ) ( not ( = ?auto_33262 ?auto_33263 ) ) ( not ( = ?auto_33262 ?auto_33264 ) ) ( not ( = ?auto_33262 ?auto_33265 ) ) ( not ( = ?auto_33263 ?auto_33264 ) ) ( not ( = ?auto_33263 ?auto_33265 ) ) ( not ( = ?auto_33264 ?auto_33265 ) ) ( ON ?auto_33265 ?auto_33266 ) ( CLEAR ?auto_33265 ) ( not ( = ?auto_33261 ?auto_33266 ) ) ( not ( = ?auto_33262 ?auto_33266 ) ) ( not ( = ?auto_33263 ?auto_33266 ) ) ( not ( = ?auto_33264 ?auto_33266 ) ) ( not ( = ?auto_33265 ?auto_33266 ) ) ( HOLDING ?auto_33264 ) ( CLEAR ?auto_33263 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_33261 ?auto_33262 ?auto_33263 ?auto_33264 ?auto_33265 )
      ( MAKE-4PILE ?auto_33261 ?auto_33262 ?auto_33263 ?auto_33264 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33267 - BLOCK
      ?auto_33268 - BLOCK
      ?auto_33269 - BLOCK
      ?auto_33270 - BLOCK
    )
    :vars
    (
      ?auto_33272 - BLOCK
      ?auto_33271 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33267 ) ( ON ?auto_33268 ?auto_33267 ) ( ON ?auto_33269 ?auto_33268 ) ( not ( = ?auto_33267 ?auto_33268 ) ) ( not ( = ?auto_33267 ?auto_33269 ) ) ( not ( = ?auto_33267 ?auto_33270 ) ) ( not ( = ?auto_33267 ?auto_33272 ) ) ( not ( = ?auto_33268 ?auto_33269 ) ) ( not ( = ?auto_33268 ?auto_33270 ) ) ( not ( = ?auto_33268 ?auto_33272 ) ) ( not ( = ?auto_33269 ?auto_33270 ) ) ( not ( = ?auto_33269 ?auto_33272 ) ) ( not ( = ?auto_33270 ?auto_33272 ) ) ( ON ?auto_33272 ?auto_33271 ) ( not ( = ?auto_33267 ?auto_33271 ) ) ( not ( = ?auto_33268 ?auto_33271 ) ) ( not ( = ?auto_33269 ?auto_33271 ) ) ( not ( = ?auto_33270 ?auto_33271 ) ) ( not ( = ?auto_33272 ?auto_33271 ) ) ( CLEAR ?auto_33269 ) ( ON ?auto_33270 ?auto_33272 ) ( CLEAR ?auto_33270 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33271 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33271 ?auto_33272 )
      ( MAKE-4PILE ?auto_33267 ?auto_33268 ?auto_33269 ?auto_33270 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33273 - BLOCK
      ?auto_33274 - BLOCK
      ?auto_33275 - BLOCK
      ?auto_33276 - BLOCK
    )
    :vars
    (
      ?auto_33278 - BLOCK
      ?auto_33277 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33273 ) ( ON ?auto_33274 ?auto_33273 ) ( not ( = ?auto_33273 ?auto_33274 ) ) ( not ( = ?auto_33273 ?auto_33275 ) ) ( not ( = ?auto_33273 ?auto_33276 ) ) ( not ( = ?auto_33273 ?auto_33278 ) ) ( not ( = ?auto_33274 ?auto_33275 ) ) ( not ( = ?auto_33274 ?auto_33276 ) ) ( not ( = ?auto_33274 ?auto_33278 ) ) ( not ( = ?auto_33275 ?auto_33276 ) ) ( not ( = ?auto_33275 ?auto_33278 ) ) ( not ( = ?auto_33276 ?auto_33278 ) ) ( ON ?auto_33278 ?auto_33277 ) ( not ( = ?auto_33273 ?auto_33277 ) ) ( not ( = ?auto_33274 ?auto_33277 ) ) ( not ( = ?auto_33275 ?auto_33277 ) ) ( not ( = ?auto_33276 ?auto_33277 ) ) ( not ( = ?auto_33278 ?auto_33277 ) ) ( ON ?auto_33276 ?auto_33278 ) ( CLEAR ?auto_33276 ) ( ON-TABLE ?auto_33277 ) ( HOLDING ?auto_33275 ) ( CLEAR ?auto_33274 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33273 ?auto_33274 ?auto_33275 )
      ( MAKE-4PILE ?auto_33273 ?auto_33274 ?auto_33275 ?auto_33276 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33279 - BLOCK
      ?auto_33280 - BLOCK
      ?auto_33281 - BLOCK
      ?auto_33282 - BLOCK
    )
    :vars
    (
      ?auto_33284 - BLOCK
      ?auto_33283 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33279 ) ( ON ?auto_33280 ?auto_33279 ) ( not ( = ?auto_33279 ?auto_33280 ) ) ( not ( = ?auto_33279 ?auto_33281 ) ) ( not ( = ?auto_33279 ?auto_33282 ) ) ( not ( = ?auto_33279 ?auto_33284 ) ) ( not ( = ?auto_33280 ?auto_33281 ) ) ( not ( = ?auto_33280 ?auto_33282 ) ) ( not ( = ?auto_33280 ?auto_33284 ) ) ( not ( = ?auto_33281 ?auto_33282 ) ) ( not ( = ?auto_33281 ?auto_33284 ) ) ( not ( = ?auto_33282 ?auto_33284 ) ) ( ON ?auto_33284 ?auto_33283 ) ( not ( = ?auto_33279 ?auto_33283 ) ) ( not ( = ?auto_33280 ?auto_33283 ) ) ( not ( = ?auto_33281 ?auto_33283 ) ) ( not ( = ?auto_33282 ?auto_33283 ) ) ( not ( = ?auto_33284 ?auto_33283 ) ) ( ON ?auto_33282 ?auto_33284 ) ( ON-TABLE ?auto_33283 ) ( CLEAR ?auto_33280 ) ( ON ?auto_33281 ?auto_33282 ) ( CLEAR ?auto_33281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33283 ?auto_33284 ?auto_33282 )
      ( MAKE-4PILE ?auto_33279 ?auto_33280 ?auto_33281 ?auto_33282 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33285 - BLOCK
      ?auto_33286 - BLOCK
      ?auto_33287 - BLOCK
      ?auto_33288 - BLOCK
    )
    :vars
    (
      ?auto_33289 - BLOCK
      ?auto_33290 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33285 ) ( not ( = ?auto_33285 ?auto_33286 ) ) ( not ( = ?auto_33285 ?auto_33287 ) ) ( not ( = ?auto_33285 ?auto_33288 ) ) ( not ( = ?auto_33285 ?auto_33289 ) ) ( not ( = ?auto_33286 ?auto_33287 ) ) ( not ( = ?auto_33286 ?auto_33288 ) ) ( not ( = ?auto_33286 ?auto_33289 ) ) ( not ( = ?auto_33287 ?auto_33288 ) ) ( not ( = ?auto_33287 ?auto_33289 ) ) ( not ( = ?auto_33288 ?auto_33289 ) ) ( ON ?auto_33289 ?auto_33290 ) ( not ( = ?auto_33285 ?auto_33290 ) ) ( not ( = ?auto_33286 ?auto_33290 ) ) ( not ( = ?auto_33287 ?auto_33290 ) ) ( not ( = ?auto_33288 ?auto_33290 ) ) ( not ( = ?auto_33289 ?auto_33290 ) ) ( ON ?auto_33288 ?auto_33289 ) ( ON-TABLE ?auto_33290 ) ( ON ?auto_33287 ?auto_33288 ) ( CLEAR ?auto_33287 ) ( HOLDING ?auto_33286 ) ( CLEAR ?auto_33285 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33285 ?auto_33286 )
      ( MAKE-4PILE ?auto_33285 ?auto_33286 ?auto_33287 ?auto_33288 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33291 - BLOCK
      ?auto_33292 - BLOCK
      ?auto_33293 - BLOCK
      ?auto_33294 - BLOCK
    )
    :vars
    (
      ?auto_33296 - BLOCK
      ?auto_33295 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33291 ) ( not ( = ?auto_33291 ?auto_33292 ) ) ( not ( = ?auto_33291 ?auto_33293 ) ) ( not ( = ?auto_33291 ?auto_33294 ) ) ( not ( = ?auto_33291 ?auto_33296 ) ) ( not ( = ?auto_33292 ?auto_33293 ) ) ( not ( = ?auto_33292 ?auto_33294 ) ) ( not ( = ?auto_33292 ?auto_33296 ) ) ( not ( = ?auto_33293 ?auto_33294 ) ) ( not ( = ?auto_33293 ?auto_33296 ) ) ( not ( = ?auto_33294 ?auto_33296 ) ) ( ON ?auto_33296 ?auto_33295 ) ( not ( = ?auto_33291 ?auto_33295 ) ) ( not ( = ?auto_33292 ?auto_33295 ) ) ( not ( = ?auto_33293 ?auto_33295 ) ) ( not ( = ?auto_33294 ?auto_33295 ) ) ( not ( = ?auto_33296 ?auto_33295 ) ) ( ON ?auto_33294 ?auto_33296 ) ( ON-TABLE ?auto_33295 ) ( ON ?auto_33293 ?auto_33294 ) ( CLEAR ?auto_33291 ) ( ON ?auto_33292 ?auto_33293 ) ( CLEAR ?auto_33292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33295 ?auto_33296 ?auto_33294 ?auto_33293 )
      ( MAKE-4PILE ?auto_33291 ?auto_33292 ?auto_33293 ?auto_33294 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33297 - BLOCK
      ?auto_33298 - BLOCK
      ?auto_33299 - BLOCK
      ?auto_33300 - BLOCK
    )
    :vars
    (
      ?auto_33302 - BLOCK
      ?auto_33301 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33297 ?auto_33298 ) ) ( not ( = ?auto_33297 ?auto_33299 ) ) ( not ( = ?auto_33297 ?auto_33300 ) ) ( not ( = ?auto_33297 ?auto_33302 ) ) ( not ( = ?auto_33298 ?auto_33299 ) ) ( not ( = ?auto_33298 ?auto_33300 ) ) ( not ( = ?auto_33298 ?auto_33302 ) ) ( not ( = ?auto_33299 ?auto_33300 ) ) ( not ( = ?auto_33299 ?auto_33302 ) ) ( not ( = ?auto_33300 ?auto_33302 ) ) ( ON ?auto_33302 ?auto_33301 ) ( not ( = ?auto_33297 ?auto_33301 ) ) ( not ( = ?auto_33298 ?auto_33301 ) ) ( not ( = ?auto_33299 ?auto_33301 ) ) ( not ( = ?auto_33300 ?auto_33301 ) ) ( not ( = ?auto_33302 ?auto_33301 ) ) ( ON ?auto_33300 ?auto_33302 ) ( ON-TABLE ?auto_33301 ) ( ON ?auto_33299 ?auto_33300 ) ( ON ?auto_33298 ?auto_33299 ) ( CLEAR ?auto_33298 ) ( HOLDING ?auto_33297 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33297 )
      ( MAKE-4PILE ?auto_33297 ?auto_33298 ?auto_33299 ?auto_33300 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33303 - BLOCK
      ?auto_33304 - BLOCK
      ?auto_33305 - BLOCK
      ?auto_33306 - BLOCK
    )
    :vars
    (
      ?auto_33308 - BLOCK
      ?auto_33307 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33303 ?auto_33304 ) ) ( not ( = ?auto_33303 ?auto_33305 ) ) ( not ( = ?auto_33303 ?auto_33306 ) ) ( not ( = ?auto_33303 ?auto_33308 ) ) ( not ( = ?auto_33304 ?auto_33305 ) ) ( not ( = ?auto_33304 ?auto_33306 ) ) ( not ( = ?auto_33304 ?auto_33308 ) ) ( not ( = ?auto_33305 ?auto_33306 ) ) ( not ( = ?auto_33305 ?auto_33308 ) ) ( not ( = ?auto_33306 ?auto_33308 ) ) ( ON ?auto_33308 ?auto_33307 ) ( not ( = ?auto_33303 ?auto_33307 ) ) ( not ( = ?auto_33304 ?auto_33307 ) ) ( not ( = ?auto_33305 ?auto_33307 ) ) ( not ( = ?auto_33306 ?auto_33307 ) ) ( not ( = ?auto_33308 ?auto_33307 ) ) ( ON ?auto_33306 ?auto_33308 ) ( ON-TABLE ?auto_33307 ) ( ON ?auto_33305 ?auto_33306 ) ( ON ?auto_33304 ?auto_33305 ) ( ON ?auto_33303 ?auto_33304 ) ( CLEAR ?auto_33303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_33307 ?auto_33308 ?auto_33306 ?auto_33305 ?auto_33304 )
      ( MAKE-4PILE ?auto_33303 ?auto_33304 ?auto_33305 ?auto_33306 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33310 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_33310 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_33310 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33311 - BLOCK
    )
    :vars
    (
      ?auto_33312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33311 ?auto_33312 ) ( CLEAR ?auto_33311 ) ( HAND-EMPTY ) ( not ( = ?auto_33311 ?auto_33312 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33311 ?auto_33312 )
      ( MAKE-1PILE ?auto_33311 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33313 - BLOCK
    )
    :vars
    (
      ?auto_33314 - BLOCK
      ?auto_33315 - BLOCK
      ?auto_33316 - BLOCK
      ?auto_33317 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33313 ?auto_33314 ) ) ( HOLDING ?auto_33313 ) ( CLEAR ?auto_33314 ) ( ON-TABLE ?auto_33315 ) ( ON ?auto_33316 ?auto_33315 ) ( ON ?auto_33317 ?auto_33316 ) ( ON ?auto_33314 ?auto_33317 ) ( not ( = ?auto_33315 ?auto_33316 ) ) ( not ( = ?auto_33315 ?auto_33317 ) ) ( not ( = ?auto_33315 ?auto_33314 ) ) ( not ( = ?auto_33315 ?auto_33313 ) ) ( not ( = ?auto_33316 ?auto_33317 ) ) ( not ( = ?auto_33316 ?auto_33314 ) ) ( not ( = ?auto_33316 ?auto_33313 ) ) ( not ( = ?auto_33317 ?auto_33314 ) ) ( not ( = ?auto_33317 ?auto_33313 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_33315 ?auto_33316 ?auto_33317 ?auto_33314 ?auto_33313 )
      ( MAKE-1PILE ?auto_33313 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33318 - BLOCK
    )
    :vars
    (
      ?auto_33322 - BLOCK
      ?auto_33319 - BLOCK
      ?auto_33320 - BLOCK
      ?auto_33321 - BLOCK
      ?auto_33323 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33318 ?auto_33322 ) ) ( CLEAR ?auto_33322 ) ( ON-TABLE ?auto_33319 ) ( ON ?auto_33320 ?auto_33319 ) ( ON ?auto_33321 ?auto_33320 ) ( ON ?auto_33322 ?auto_33321 ) ( not ( = ?auto_33319 ?auto_33320 ) ) ( not ( = ?auto_33319 ?auto_33321 ) ) ( not ( = ?auto_33319 ?auto_33322 ) ) ( not ( = ?auto_33319 ?auto_33318 ) ) ( not ( = ?auto_33320 ?auto_33321 ) ) ( not ( = ?auto_33320 ?auto_33322 ) ) ( not ( = ?auto_33320 ?auto_33318 ) ) ( not ( = ?auto_33321 ?auto_33322 ) ) ( not ( = ?auto_33321 ?auto_33318 ) ) ( ON ?auto_33318 ?auto_33323 ) ( CLEAR ?auto_33318 ) ( HAND-EMPTY ) ( not ( = ?auto_33318 ?auto_33323 ) ) ( not ( = ?auto_33322 ?auto_33323 ) ) ( not ( = ?auto_33319 ?auto_33323 ) ) ( not ( = ?auto_33320 ?auto_33323 ) ) ( not ( = ?auto_33321 ?auto_33323 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33318 ?auto_33323 )
      ( MAKE-1PILE ?auto_33318 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33324 - BLOCK
    )
    :vars
    (
      ?auto_33326 - BLOCK
      ?auto_33327 - BLOCK
      ?auto_33328 - BLOCK
      ?auto_33325 - BLOCK
      ?auto_33329 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33324 ?auto_33326 ) ) ( ON-TABLE ?auto_33327 ) ( ON ?auto_33328 ?auto_33327 ) ( ON ?auto_33325 ?auto_33328 ) ( not ( = ?auto_33327 ?auto_33328 ) ) ( not ( = ?auto_33327 ?auto_33325 ) ) ( not ( = ?auto_33327 ?auto_33326 ) ) ( not ( = ?auto_33327 ?auto_33324 ) ) ( not ( = ?auto_33328 ?auto_33325 ) ) ( not ( = ?auto_33328 ?auto_33326 ) ) ( not ( = ?auto_33328 ?auto_33324 ) ) ( not ( = ?auto_33325 ?auto_33326 ) ) ( not ( = ?auto_33325 ?auto_33324 ) ) ( ON ?auto_33324 ?auto_33329 ) ( CLEAR ?auto_33324 ) ( not ( = ?auto_33324 ?auto_33329 ) ) ( not ( = ?auto_33326 ?auto_33329 ) ) ( not ( = ?auto_33327 ?auto_33329 ) ) ( not ( = ?auto_33328 ?auto_33329 ) ) ( not ( = ?auto_33325 ?auto_33329 ) ) ( HOLDING ?auto_33326 ) ( CLEAR ?auto_33325 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33327 ?auto_33328 ?auto_33325 ?auto_33326 )
      ( MAKE-1PILE ?auto_33324 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33330 - BLOCK
    )
    :vars
    (
      ?auto_33335 - BLOCK
      ?auto_33334 - BLOCK
      ?auto_33331 - BLOCK
      ?auto_33333 - BLOCK
      ?auto_33332 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33330 ?auto_33335 ) ) ( ON-TABLE ?auto_33334 ) ( ON ?auto_33331 ?auto_33334 ) ( ON ?auto_33333 ?auto_33331 ) ( not ( = ?auto_33334 ?auto_33331 ) ) ( not ( = ?auto_33334 ?auto_33333 ) ) ( not ( = ?auto_33334 ?auto_33335 ) ) ( not ( = ?auto_33334 ?auto_33330 ) ) ( not ( = ?auto_33331 ?auto_33333 ) ) ( not ( = ?auto_33331 ?auto_33335 ) ) ( not ( = ?auto_33331 ?auto_33330 ) ) ( not ( = ?auto_33333 ?auto_33335 ) ) ( not ( = ?auto_33333 ?auto_33330 ) ) ( ON ?auto_33330 ?auto_33332 ) ( not ( = ?auto_33330 ?auto_33332 ) ) ( not ( = ?auto_33335 ?auto_33332 ) ) ( not ( = ?auto_33334 ?auto_33332 ) ) ( not ( = ?auto_33331 ?auto_33332 ) ) ( not ( = ?auto_33333 ?auto_33332 ) ) ( CLEAR ?auto_33333 ) ( ON ?auto_33335 ?auto_33330 ) ( CLEAR ?auto_33335 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33332 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33332 ?auto_33330 )
      ( MAKE-1PILE ?auto_33330 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33336 - BLOCK
    )
    :vars
    (
      ?auto_33340 - BLOCK
      ?auto_33338 - BLOCK
      ?auto_33339 - BLOCK
      ?auto_33337 - BLOCK
      ?auto_33341 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33336 ?auto_33340 ) ) ( ON-TABLE ?auto_33338 ) ( ON ?auto_33339 ?auto_33338 ) ( not ( = ?auto_33338 ?auto_33339 ) ) ( not ( = ?auto_33338 ?auto_33337 ) ) ( not ( = ?auto_33338 ?auto_33340 ) ) ( not ( = ?auto_33338 ?auto_33336 ) ) ( not ( = ?auto_33339 ?auto_33337 ) ) ( not ( = ?auto_33339 ?auto_33340 ) ) ( not ( = ?auto_33339 ?auto_33336 ) ) ( not ( = ?auto_33337 ?auto_33340 ) ) ( not ( = ?auto_33337 ?auto_33336 ) ) ( ON ?auto_33336 ?auto_33341 ) ( not ( = ?auto_33336 ?auto_33341 ) ) ( not ( = ?auto_33340 ?auto_33341 ) ) ( not ( = ?auto_33338 ?auto_33341 ) ) ( not ( = ?auto_33339 ?auto_33341 ) ) ( not ( = ?auto_33337 ?auto_33341 ) ) ( ON ?auto_33340 ?auto_33336 ) ( CLEAR ?auto_33340 ) ( ON-TABLE ?auto_33341 ) ( HOLDING ?auto_33337 ) ( CLEAR ?auto_33339 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33338 ?auto_33339 ?auto_33337 )
      ( MAKE-1PILE ?auto_33336 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33342 - BLOCK
    )
    :vars
    (
      ?auto_33343 - BLOCK
      ?auto_33347 - BLOCK
      ?auto_33346 - BLOCK
      ?auto_33344 - BLOCK
      ?auto_33345 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33342 ?auto_33343 ) ) ( ON-TABLE ?auto_33347 ) ( ON ?auto_33346 ?auto_33347 ) ( not ( = ?auto_33347 ?auto_33346 ) ) ( not ( = ?auto_33347 ?auto_33344 ) ) ( not ( = ?auto_33347 ?auto_33343 ) ) ( not ( = ?auto_33347 ?auto_33342 ) ) ( not ( = ?auto_33346 ?auto_33344 ) ) ( not ( = ?auto_33346 ?auto_33343 ) ) ( not ( = ?auto_33346 ?auto_33342 ) ) ( not ( = ?auto_33344 ?auto_33343 ) ) ( not ( = ?auto_33344 ?auto_33342 ) ) ( ON ?auto_33342 ?auto_33345 ) ( not ( = ?auto_33342 ?auto_33345 ) ) ( not ( = ?auto_33343 ?auto_33345 ) ) ( not ( = ?auto_33347 ?auto_33345 ) ) ( not ( = ?auto_33346 ?auto_33345 ) ) ( not ( = ?auto_33344 ?auto_33345 ) ) ( ON ?auto_33343 ?auto_33342 ) ( ON-TABLE ?auto_33345 ) ( CLEAR ?auto_33346 ) ( ON ?auto_33344 ?auto_33343 ) ( CLEAR ?auto_33344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33345 ?auto_33342 ?auto_33343 )
      ( MAKE-1PILE ?auto_33342 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33348 - BLOCK
    )
    :vars
    (
      ?auto_33352 - BLOCK
      ?auto_33349 - BLOCK
      ?auto_33351 - BLOCK
      ?auto_33353 - BLOCK
      ?auto_33350 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33348 ?auto_33352 ) ) ( ON-TABLE ?auto_33349 ) ( not ( = ?auto_33349 ?auto_33351 ) ) ( not ( = ?auto_33349 ?auto_33353 ) ) ( not ( = ?auto_33349 ?auto_33352 ) ) ( not ( = ?auto_33349 ?auto_33348 ) ) ( not ( = ?auto_33351 ?auto_33353 ) ) ( not ( = ?auto_33351 ?auto_33352 ) ) ( not ( = ?auto_33351 ?auto_33348 ) ) ( not ( = ?auto_33353 ?auto_33352 ) ) ( not ( = ?auto_33353 ?auto_33348 ) ) ( ON ?auto_33348 ?auto_33350 ) ( not ( = ?auto_33348 ?auto_33350 ) ) ( not ( = ?auto_33352 ?auto_33350 ) ) ( not ( = ?auto_33349 ?auto_33350 ) ) ( not ( = ?auto_33351 ?auto_33350 ) ) ( not ( = ?auto_33353 ?auto_33350 ) ) ( ON ?auto_33352 ?auto_33348 ) ( ON-TABLE ?auto_33350 ) ( ON ?auto_33353 ?auto_33352 ) ( CLEAR ?auto_33353 ) ( HOLDING ?auto_33351 ) ( CLEAR ?auto_33349 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33349 ?auto_33351 )
      ( MAKE-1PILE ?auto_33348 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33354 - BLOCK
    )
    :vars
    (
      ?auto_33357 - BLOCK
      ?auto_33359 - BLOCK
      ?auto_33358 - BLOCK
      ?auto_33356 - BLOCK
      ?auto_33355 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33354 ?auto_33357 ) ) ( ON-TABLE ?auto_33359 ) ( not ( = ?auto_33359 ?auto_33358 ) ) ( not ( = ?auto_33359 ?auto_33356 ) ) ( not ( = ?auto_33359 ?auto_33357 ) ) ( not ( = ?auto_33359 ?auto_33354 ) ) ( not ( = ?auto_33358 ?auto_33356 ) ) ( not ( = ?auto_33358 ?auto_33357 ) ) ( not ( = ?auto_33358 ?auto_33354 ) ) ( not ( = ?auto_33356 ?auto_33357 ) ) ( not ( = ?auto_33356 ?auto_33354 ) ) ( ON ?auto_33354 ?auto_33355 ) ( not ( = ?auto_33354 ?auto_33355 ) ) ( not ( = ?auto_33357 ?auto_33355 ) ) ( not ( = ?auto_33359 ?auto_33355 ) ) ( not ( = ?auto_33358 ?auto_33355 ) ) ( not ( = ?auto_33356 ?auto_33355 ) ) ( ON ?auto_33357 ?auto_33354 ) ( ON-TABLE ?auto_33355 ) ( ON ?auto_33356 ?auto_33357 ) ( CLEAR ?auto_33359 ) ( ON ?auto_33358 ?auto_33356 ) ( CLEAR ?auto_33358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33355 ?auto_33354 ?auto_33357 ?auto_33356 )
      ( MAKE-1PILE ?auto_33354 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33360 - BLOCK
    )
    :vars
    (
      ?auto_33365 - BLOCK
      ?auto_33364 - BLOCK
      ?auto_33362 - BLOCK
      ?auto_33361 - BLOCK
      ?auto_33363 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33360 ?auto_33365 ) ) ( not ( = ?auto_33364 ?auto_33362 ) ) ( not ( = ?auto_33364 ?auto_33361 ) ) ( not ( = ?auto_33364 ?auto_33365 ) ) ( not ( = ?auto_33364 ?auto_33360 ) ) ( not ( = ?auto_33362 ?auto_33361 ) ) ( not ( = ?auto_33362 ?auto_33365 ) ) ( not ( = ?auto_33362 ?auto_33360 ) ) ( not ( = ?auto_33361 ?auto_33365 ) ) ( not ( = ?auto_33361 ?auto_33360 ) ) ( ON ?auto_33360 ?auto_33363 ) ( not ( = ?auto_33360 ?auto_33363 ) ) ( not ( = ?auto_33365 ?auto_33363 ) ) ( not ( = ?auto_33364 ?auto_33363 ) ) ( not ( = ?auto_33362 ?auto_33363 ) ) ( not ( = ?auto_33361 ?auto_33363 ) ) ( ON ?auto_33365 ?auto_33360 ) ( ON-TABLE ?auto_33363 ) ( ON ?auto_33361 ?auto_33365 ) ( ON ?auto_33362 ?auto_33361 ) ( CLEAR ?auto_33362 ) ( HOLDING ?auto_33364 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33364 )
      ( MAKE-1PILE ?auto_33360 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33366 - BLOCK
    )
    :vars
    (
      ?auto_33369 - BLOCK
      ?auto_33368 - BLOCK
      ?auto_33367 - BLOCK
      ?auto_33371 - BLOCK
      ?auto_33370 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33366 ?auto_33369 ) ) ( not ( = ?auto_33368 ?auto_33367 ) ) ( not ( = ?auto_33368 ?auto_33371 ) ) ( not ( = ?auto_33368 ?auto_33369 ) ) ( not ( = ?auto_33368 ?auto_33366 ) ) ( not ( = ?auto_33367 ?auto_33371 ) ) ( not ( = ?auto_33367 ?auto_33369 ) ) ( not ( = ?auto_33367 ?auto_33366 ) ) ( not ( = ?auto_33371 ?auto_33369 ) ) ( not ( = ?auto_33371 ?auto_33366 ) ) ( ON ?auto_33366 ?auto_33370 ) ( not ( = ?auto_33366 ?auto_33370 ) ) ( not ( = ?auto_33369 ?auto_33370 ) ) ( not ( = ?auto_33368 ?auto_33370 ) ) ( not ( = ?auto_33367 ?auto_33370 ) ) ( not ( = ?auto_33371 ?auto_33370 ) ) ( ON ?auto_33369 ?auto_33366 ) ( ON-TABLE ?auto_33370 ) ( ON ?auto_33371 ?auto_33369 ) ( ON ?auto_33367 ?auto_33371 ) ( ON ?auto_33368 ?auto_33367 ) ( CLEAR ?auto_33368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_33370 ?auto_33366 ?auto_33369 ?auto_33371 ?auto_33367 )
      ( MAKE-1PILE ?auto_33366 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33375 - BLOCK
      ?auto_33376 - BLOCK
      ?auto_33377 - BLOCK
    )
    :vars
    (
      ?auto_33378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33378 ?auto_33377 ) ( CLEAR ?auto_33378 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33375 ) ( ON ?auto_33376 ?auto_33375 ) ( ON ?auto_33377 ?auto_33376 ) ( not ( = ?auto_33375 ?auto_33376 ) ) ( not ( = ?auto_33375 ?auto_33377 ) ) ( not ( = ?auto_33375 ?auto_33378 ) ) ( not ( = ?auto_33376 ?auto_33377 ) ) ( not ( = ?auto_33376 ?auto_33378 ) ) ( not ( = ?auto_33377 ?auto_33378 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33378 ?auto_33377 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33379 - BLOCK
      ?auto_33380 - BLOCK
      ?auto_33381 - BLOCK
    )
    :vars
    (
      ?auto_33382 - BLOCK
      ?auto_33383 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33382 ?auto_33381 ) ( CLEAR ?auto_33382 ) ( ON-TABLE ?auto_33379 ) ( ON ?auto_33380 ?auto_33379 ) ( ON ?auto_33381 ?auto_33380 ) ( not ( = ?auto_33379 ?auto_33380 ) ) ( not ( = ?auto_33379 ?auto_33381 ) ) ( not ( = ?auto_33379 ?auto_33382 ) ) ( not ( = ?auto_33380 ?auto_33381 ) ) ( not ( = ?auto_33380 ?auto_33382 ) ) ( not ( = ?auto_33381 ?auto_33382 ) ) ( HOLDING ?auto_33383 ) ( not ( = ?auto_33379 ?auto_33383 ) ) ( not ( = ?auto_33380 ?auto_33383 ) ) ( not ( = ?auto_33381 ?auto_33383 ) ) ( not ( = ?auto_33382 ?auto_33383 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_33383 )
      ( MAKE-3PILE ?auto_33379 ?auto_33380 ?auto_33381 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33384 - BLOCK
      ?auto_33385 - BLOCK
      ?auto_33386 - BLOCK
    )
    :vars
    (
      ?auto_33388 - BLOCK
      ?auto_33387 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33388 ?auto_33386 ) ( ON-TABLE ?auto_33384 ) ( ON ?auto_33385 ?auto_33384 ) ( ON ?auto_33386 ?auto_33385 ) ( not ( = ?auto_33384 ?auto_33385 ) ) ( not ( = ?auto_33384 ?auto_33386 ) ) ( not ( = ?auto_33384 ?auto_33388 ) ) ( not ( = ?auto_33385 ?auto_33386 ) ) ( not ( = ?auto_33385 ?auto_33388 ) ) ( not ( = ?auto_33386 ?auto_33388 ) ) ( not ( = ?auto_33384 ?auto_33387 ) ) ( not ( = ?auto_33385 ?auto_33387 ) ) ( not ( = ?auto_33386 ?auto_33387 ) ) ( not ( = ?auto_33388 ?auto_33387 ) ) ( ON ?auto_33387 ?auto_33388 ) ( CLEAR ?auto_33387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33384 ?auto_33385 ?auto_33386 ?auto_33388 )
      ( MAKE-3PILE ?auto_33384 ?auto_33385 ?auto_33386 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33389 - BLOCK
      ?auto_33390 - BLOCK
      ?auto_33391 - BLOCK
    )
    :vars
    (
      ?auto_33393 - BLOCK
      ?auto_33392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33393 ?auto_33391 ) ( ON-TABLE ?auto_33389 ) ( ON ?auto_33390 ?auto_33389 ) ( ON ?auto_33391 ?auto_33390 ) ( not ( = ?auto_33389 ?auto_33390 ) ) ( not ( = ?auto_33389 ?auto_33391 ) ) ( not ( = ?auto_33389 ?auto_33393 ) ) ( not ( = ?auto_33390 ?auto_33391 ) ) ( not ( = ?auto_33390 ?auto_33393 ) ) ( not ( = ?auto_33391 ?auto_33393 ) ) ( not ( = ?auto_33389 ?auto_33392 ) ) ( not ( = ?auto_33390 ?auto_33392 ) ) ( not ( = ?auto_33391 ?auto_33392 ) ) ( not ( = ?auto_33393 ?auto_33392 ) ) ( HOLDING ?auto_33392 ) ( CLEAR ?auto_33393 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_33389 ?auto_33390 ?auto_33391 ?auto_33393 ?auto_33392 )
      ( MAKE-3PILE ?auto_33389 ?auto_33390 ?auto_33391 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33394 - BLOCK
      ?auto_33395 - BLOCK
      ?auto_33396 - BLOCK
    )
    :vars
    (
      ?auto_33398 - BLOCK
      ?auto_33397 - BLOCK
      ?auto_33399 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33398 ?auto_33396 ) ( ON-TABLE ?auto_33394 ) ( ON ?auto_33395 ?auto_33394 ) ( ON ?auto_33396 ?auto_33395 ) ( not ( = ?auto_33394 ?auto_33395 ) ) ( not ( = ?auto_33394 ?auto_33396 ) ) ( not ( = ?auto_33394 ?auto_33398 ) ) ( not ( = ?auto_33395 ?auto_33396 ) ) ( not ( = ?auto_33395 ?auto_33398 ) ) ( not ( = ?auto_33396 ?auto_33398 ) ) ( not ( = ?auto_33394 ?auto_33397 ) ) ( not ( = ?auto_33395 ?auto_33397 ) ) ( not ( = ?auto_33396 ?auto_33397 ) ) ( not ( = ?auto_33398 ?auto_33397 ) ) ( CLEAR ?auto_33398 ) ( ON ?auto_33397 ?auto_33399 ) ( CLEAR ?auto_33397 ) ( HAND-EMPTY ) ( not ( = ?auto_33394 ?auto_33399 ) ) ( not ( = ?auto_33395 ?auto_33399 ) ) ( not ( = ?auto_33396 ?auto_33399 ) ) ( not ( = ?auto_33398 ?auto_33399 ) ) ( not ( = ?auto_33397 ?auto_33399 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33397 ?auto_33399 )
      ( MAKE-3PILE ?auto_33394 ?auto_33395 ?auto_33396 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33412 - BLOCK
      ?auto_33413 - BLOCK
      ?auto_33414 - BLOCK
    )
    :vars
    (
      ?auto_33417 - BLOCK
      ?auto_33416 - BLOCK
      ?auto_33415 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33412 ) ( ON ?auto_33413 ?auto_33412 ) ( not ( = ?auto_33412 ?auto_33413 ) ) ( not ( = ?auto_33412 ?auto_33414 ) ) ( not ( = ?auto_33412 ?auto_33417 ) ) ( not ( = ?auto_33413 ?auto_33414 ) ) ( not ( = ?auto_33413 ?auto_33417 ) ) ( not ( = ?auto_33414 ?auto_33417 ) ) ( not ( = ?auto_33412 ?auto_33416 ) ) ( not ( = ?auto_33413 ?auto_33416 ) ) ( not ( = ?auto_33414 ?auto_33416 ) ) ( not ( = ?auto_33417 ?auto_33416 ) ) ( ON ?auto_33416 ?auto_33415 ) ( not ( = ?auto_33412 ?auto_33415 ) ) ( not ( = ?auto_33413 ?auto_33415 ) ) ( not ( = ?auto_33414 ?auto_33415 ) ) ( not ( = ?auto_33417 ?auto_33415 ) ) ( not ( = ?auto_33416 ?auto_33415 ) ) ( ON ?auto_33417 ?auto_33416 ) ( CLEAR ?auto_33417 ) ( HOLDING ?auto_33414 ) ( CLEAR ?auto_33413 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33412 ?auto_33413 ?auto_33414 ?auto_33417 )
      ( MAKE-3PILE ?auto_33412 ?auto_33413 ?auto_33414 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33418 - BLOCK
      ?auto_33419 - BLOCK
      ?auto_33420 - BLOCK
    )
    :vars
    (
      ?auto_33422 - BLOCK
      ?auto_33421 - BLOCK
      ?auto_33423 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33418 ) ( ON ?auto_33419 ?auto_33418 ) ( not ( = ?auto_33418 ?auto_33419 ) ) ( not ( = ?auto_33418 ?auto_33420 ) ) ( not ( = ?auto_33418 ?auto_33422 ) ) ( not ( = ?auto_33419 ?auto_33420 ) ) ( not ( = ?auto_33419 ?auto_33422 ) ) ( not ( = ?auto_33420 ?auto_33422 ) ) ( not ( = ?auto_33418 ?auto_33421 ) ) ( not ( = ?auto_33419 ?auto_33421 ) ) ( not ( = ?auto_33420 ?auto_33421 ) ) ( not ( = ?auto_33422 ?auto_33421 ) ) ( ON ?auto_33421 ?auto_33423 ) ( not ( = ?auto_33418 ?auto_33423 ) ) ( not ( = ?auto_33419 ?auto_33423 ) ) ( not ( = ?auto_33420 ?auto_33423 ) ) ( not ( = ?auto_33422 ?auto_33423 ) ) ( not ( = ?auto_33421 ?auto_33423 ) ) ( ON ?auto_33422 ?auto_33421 ) ( CLEAR ?auto_33419 ) ( ON ?auto_33420 ?auto_33422 ) ( CLEAR ?auto_33420 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33423 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33423 ?auto_33421 ?auto_33422 )
      ( MAKE-3PILE ?auto_33418 ?auto_33419 ?auto_33420 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33424 - BLOCK
      ?auto_33425 - BLOCK
      ?auto_33426 - BLOCK
    )
    :vars
    (
      ?auto_33429 - BLOCK
      ?auto_33428 - BLOCK
      ?auto_33427 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33424 ) ( not ( = ?auto_33424 ?auto_33425 ) ) ( not ( = ?auto_33424 ?auto_33426 ) ) ( not ( = ?auto_33424 ?auto_33429 ) ) ( not ( = ?auto_33425 ?auto_33426 ) ) ( not ( = ?auto_33425 ?auto_33429 ) ) ( not ( = ?auto_33426 ?auto_33429 ) ) ( not ( = ?auto_33424 ?auto_33428 ) ) ( not ( = ?auto_33425 ?auto_33428 ) ) ( not ( = ?auto_33426 ?auto_33428 ) ) ( not ( = ?auto_33429 ?auto_33428 ) ) ( ON ?auto_33428 ?auto_33427 ) ( not ( = ?auto_33424 ?auto_33427 ) ) ( not ( = ?auto_33425 ?auto_33427 ) ) ( not ( = ?auto_33426 ?auto_33427 ) ) ( not ( = ?auto_33429 ?auto_33427 ) ) ( not ( = ?auto_33428 ?auto_33427 ) ) ( ON ?auto_33429 ?auto_33428 ) ( ON ?auto_33426 ?auto_33429 ) ( CLEAR ?auto_33426 ) ( ON-TABLE ?auto_33427 ) ( HOLDING ?auto_33425 ) ( CLEAR ?auto_33424 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33424 ?auto_33425 )
      ( MAKE-3PILE ?auto_33424 ?auto_33425 ?auto_33426 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33430 - BLOCK
      ?auto_33431 - BLOCK
      ?auto_33432 - BLOCK
    )
    :vars
    (
      ?auto_33433 - BLOCK
      ?auto_33435 - BLOCK
      ?auto_33434 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33430 ) ( not ( = ?auto_33430 ?auto_33431 ) ) ( not ( = ?auto_33430 ?auto_33432 ) ) ( not ( = ?auto_33430 ?auto_33433 ) ) ( not ( = ?auto_33431 ?auto_33432 ) ) ( not ( = ?auto_33431 ?auto_33433 ) ) ( not ( = ?auto_33432 ?auto_33433 ) ) ( not ( = ?auto_33430 ?auto_33435 ) ) ( not ( = ?auto_33431 ?auto_33435 ) ) ( not ( = ?auto_33432 ?auto_33435 ) ) ( not ( = ?auto_33433 ?auto_33435 ) ) ( ON ?auto_33435 ?auto_33434 ) ( not ( = ?auto_33430 ?auto_33434 ) ) ( not ( = ?auto_33431 ?auto_33434 ) ) ( not ( = ?auto_33432 ?auto_33434 ) ) ( not ( = ?auto_33433 ?auto_33434 ) ) ( not ( = ?auto_33435 ?auto_33434 ) ) ( ON ?auto_33433 ?auto_33435 ) ( ON ?auto_33432 ?auto_33433 ) ( ON-TABLE ?auto_33434 ) ( CLEAR ?auto_33430 ) ( ON ?auto_33431 ?auto_33432 ) ( CLEAR ?auto_33431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33434 ?auto_33435 ?auto_33433 ?auto_33432 )
      ( MAKE-3PILE ?auto_33430 ?auto_33431 ?auto_33432 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33436 - BLOCK
      ?auto_33437 - BLOCK
      ?auto_33438 - BLOCK
    )
    :vars
    (
      ?auto_33441 - BLOCK
      ?auto_33439 - BLOCK
      ?auto_33440 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33436 ?auto_33437 ) ) ( not ( = ?auto_33436 ?auto_33438 ) ) ( not ( = ?auto_33436 ?auto_33441 ) ) ( not ( = ?auto_33437 ?auto_33438 ) ) ( not ( = ?auto_33437 ?auto_33441 ) ) ( not ( = ?auto_33438 ?auto_33441 ) ) ( not ( = ?auto_33436 ?auto_33439 ) ) ( not ( = ?auto_33437 ?auto_33439 ) ) ( not ( = ?auto_33438 ?auto_33439 ) ) ( not ( = ?auto_33441 ?auto_33439 ) ) ( ON ?auto_33439 ?auto_33440 ) ( not ( = ?auto_33436 ?auto_33440 ) ) ( not ( = ?auto_33437 ?auto_33440 ) ) ( not ( = ?auto_33438 ?auto_33440 ) ) ( not ( = ?auto_33441 ?auto_33440 ) ) ( not ( = ?auto_33439 ?auto_33440 ) ) ( ON ?auto_33441 ?auto_33439 ) ( ON ?auto_33438 ?auto_33441 ) ( ON-TABLE ?auto_33440 ) ( ON ?auto_33437 ?auto_33438 ) ( CLEAR ?auto_33437 ) ( HOLDING ?auto_33436 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33436 )
      ( MAKE-3PILE ?auto_33436 ?auto_33437 ?auto_33438 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33442 - BLOCK
      ?auto_33443 - BLOCK
      ?auto_33444 - BLOCK
    )
    :vars
    (
      ?auto_33445 - BLOCK
      ?auto_33447 - BLOCK
      ?auto_33446 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33442 ?auto_33443 ) ) ( not ( = ?auto_33442 ?auto_33444 ) ) ( not ( = ?auto_33442 ?auto_33445 ) ) ( not ( = ?auto_33443 ?auto_33444 ) ) ( not ( = ?auto_33443 ?auto_33445 ) ) ( not ( = ?auto_33444 ?auto_33445 ) ) ( not ( = ?auto_33442 ?auto_33447 ) ) ( not ( = ?auto_33443 ?auto_33447 ) ) ( not ( = ?auto_33444 ?auto_33447 ) ) ( not ( = ?auto_33445 ?auto_33447 ) ) ( ON ?auto_33447 ?auto_33446 ) ( not ( = ?auto_33442 ?auto_33446 ) ) ( not ( = ?auto_33443 ?auto_33446 ) ) ( not ( = ?auto_33444 ?auto_33446 ) ) ( not ( = ?auto_33445 ?auto_33446 ) ) ( not ( = ?auto_33447 ?auto_33446 ) ) ( ON ?auto_33445 ?auto_33447 ) ( ON ?auto_33444 ?auto_33445 ) ( ON-TABLE ?auto_33446 ) ( ON ?auto_33443 ?auto_33444 ) ( ON ?auto_33442 ?auto_33443 ) ( CLEAR ?auto_33442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_33446 ?auto_33447 ?auto_33445 ?auto_33444 ?auto_33443 )
      ( MAKE-3PILE ?auto_33442 ?auto_33443 ?auto_33444 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33450 - BLOCK
      ?auto_33451 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_33451 ) ( CLEAR ?auto_33450 ) ( ON-TABLE ?auto_33450 ) ( not ( = ?auto_33450 ?auto_33451 ) ) )
    :subtasks
    ( ( !STACK ?auto_33451 ?auto_33450 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33452 - BLOCK
      ?auto_33453 - BLOCK
    )
    :vars
    (
      ?auto_33454 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_33452 ) ( ON-TABLE ?auto_33452 ) ( not ( = ?auto_33452 ?auto_33453 ) ) ( ON ?auto_33453 ?auto_33454 ) ( CLEAR ?auto_33453 ) ( HAND-EMPTY ) ( not ( = ?auto_33452 ?auto_33454 ) ) ( not ( = ?auto_33453 ?auto_33454 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33453 ?auto_33454 )
      ( MAKE-2PILE ?auto_33452 ?auto_33453 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33455 - BLOCK
      ?auto_33456 - BLOCK
    )
    :vars
    (
      ?auto_33457 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33455 ?auto_33456 ) ) ( ON ?auto_33456 ?auto_33457 ) ( CLEAR ?auto_33456 ) ( not ( = ?auto_33455 ?auto_33457 ) ) ( not ( = ?auto_33456 ?auto_33457 ) ) ( HOLDING ?auto_33455 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33455 )
      ( MAKE-2PILE ?auto_33455 ?auto_33456 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33458 - BLOCK
      ?auto_33459 - BLOCK
    )
    :vars
    (
      ?auto_33460 - BLOCK
      ?auto_33462 - BLOCK
      ?auto_33461 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33458 ?auto_33459 ) ) ( ON ?auto_33459 ?auto_33460 ) ( not ( = ?auto_33458 ?auto_33460 ) ) ( not ( = ?auto_33459 ?auto_33460 ) ) ( ON ?auto_33458 ?auto_33459 ) ( CLEAR ?auto_33458 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33462 ) ( ON ?auto_33461 ?auto_33462 ) ( ON ?auto_33460 ?auto_33461 ) ( not ( = ?auto_33462 ?auto_33461 ) ) ( not ( = ?auto_33462 ?auto_33460 ) ) ( not ( = ?auto_33462 ?auto_33459 ) ) ( not ( = ?auto_33462 ?auto_33458 ) ) ( not ( = ?auto_33461 ?auto_33460 ) ) ( not ( = ?auto_33461 ?auto_33459 ) ) ( not ( = ?auto_33461 ?auto_33458 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33462 ?auto_33461 ?auto_33460 ?auto_33459 )
      ( MAKE-2PILE ?auto_33458 ?auto_33459 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33463 - BLOCK
      ?auto_33464 - BLOCK
    )
    :vars
    (
      ?auto_33466 - BLOCK
      ?auto_33465 - BLOCK
      ?auto_33467 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33463 ?auto_33464 ) ) ( ON ?auto_33464 ?auto_33466 ) ( not ( = ?auto_33463 ?auto_33466 ) ) ( not ( = ?auto_33464 ?auto_33466 ) ) ( ON-TABLE ?auto_33465 ) ( ON ?auto_33467 ?auto_33465 ) ( ON ?auto_33466 ?auto_33467 ) ( not ( = ?auto_33465 ?auto_33467 ) ) ( not ( = ?auto_33465 ?auto_33466 ) ) ( not ( = ?auto_33465 ?auto_33464 ) ) ( not ( = ?auto_33465 ?auto_33463 ) ) ( not ( = ?auto_33467 ?auto_33466 ) ) ( not ( = ?auto_33467 ?auto_33464 ) ) ( not ( = ?auto_33467 ?auto_33463 ) ) ( HOLDING ?auto_33463 ) ( CLEAR ?auto_33464 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_33465 ?auto_33467 ?auto_33466 ?auto_33464 ?auto_33463 )
      ( MAKE-2PILE ?auto_33463 ?auto_33464 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33468 - BLOCK
      ?auto_33469 - BLOCK
    )
    :vars
    (
      ?auto_33471 - BLOCK
      ?auto_33470 - BLOCK
      ?auto_33472 - BLOCK
      ?auto_33473 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33468 ?auto_33469 ) ) ( ON ?auto_33469 ?auto_33471 ) ( not ( = ?auto_33468 ?auto_33471 ) ) ( not ( = ?auto_33469 ?auto_33471 ) ) ( ON-TABLE ?auto_33470 ) ( ON ?auto_33472 ?auto_33470 ) ( ON ?auto_33471 ?auto_33472 ) ( not ( = ?auto_33470 ?auto_33472 ) ) ( not ( = ?auto_33470 ?auto_33471 ) ) ( not ( = ?auto_33470 ?auto_33469 ) ) ( not ( = ?auto_33470 ?auto_33468 ) ) ( not ( = ?auto_33472 ?auto_33471 ) ) ( not ( = ?auto_33472 ?auto_33469 ) ) ( not ( = ?auto_33472 ?auto_33468 ) ) ( CLEAR ?auto_33469 ) ( ON ?auto_33468 ?auto_33473 ) ( CLEAR ?auto_33468 ) ( HAND-EMPTY ) ( not ( = ?auto_33468 ?auto_33473 ) ) ( not ( = ?auto_33469 ?auto_33473 ) ) ( not ( = ?auto_33471 ?auto_33473 ) ) ( not ( = ?auto_33470 ?auto_33473 ) ) ( not ( = ?auto_33472 ?auto_33473 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33468 ?auto_33473 )
      ( MAKE-2PILE ?auto_33468 ?auto_33469 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33474 - BLOCK
      ?auto_33475 - BLOCK
    )
    :vars
    (
      ?auto_33478 - BLOCK
      ?auto_33476 - BLOCK
      ?auto_33479 - BLOCK
      ?auto_33477 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33474 ?auto_33475 ) ) ( not ( = ?auto_33474 ?auto_33478 ) ) ( not ( = ?auto_33475 ?auto_33478 ) ) ( ON-TABLE ?auto_33476 ) ( ON ?auto_33479 ?auto_33476 ) ( ON ?auto_33478 ?auto_33479 ) ( not ( = ?auto_33476 ?auto_33479 ) ) ( not ( = ?auto_33476 ?auto_33478 ) ) ( not ( = ?auto_33476 ?auto_33475 ) ) ( not ( = ?auto_33476 ?auto_33474 ) ) ( not ( = ?auto_33479 ?auto_33478 ) ) ( not ( = ?auto_33479 ?auto_33475 ) ) ( not ( = ?auto_33479 ?auto_33474 ) ) ( ON ?auto_33474 ?auto_33477 ) ( CLEAR ?auto_33474 ) ( not ( = ?auto_33474 ?auto_33477 ) ) ( not ( = ?auto_33475 ?auto_33477 ) ) ( not ( = ?auto_33478 ?auto_33477 ) ) ( not ( = ?auto_33476 ?auto_33477 ) ) ( not ( = ?auto_33479 ?auto_33477 ) ) ( HOLDING ?auto_33475 ) ( CLEAR ?auto_33478 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33476 ?auto_33479 ?auto_33478 ?auto_33475 )
      ( MAKE-2PILE ?auto_33474 ?auto_33475 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33480 - BLOCK
      ?auto_33481 - BLOCK
    )
    :vars
    (
      ?auto_33484 - BLOCK
      ?auto_33482 - BLOCK
      ?auto_33485 - BLOCK
      ?auto_33483 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33480 ?auto_33481 ) ) ( not ( = ?auto_33480 ?auto_33484 ) ) ( not ( = ?auto_33481 ?auto_33484 ) ) ( ON-TABLE ?auto_33482 ) ( ON ?auto_33485 ?auto_33482 ) ( ON ?auto_33484 ?auto_33485 ) ( not ( = ?auto_33482 ?auto_33485 ) ) ( not ( = ?auto_33482 ?auto_33484 ) ) ( not ( = ?auto_33482 ?auto_33481 ) ) ( not ( = ?auto_33482 ?auto_33480 ) ) ( not ( = ?auto_33485 ?auto_33484 ) ) ( not ( = ?auto_33485 ?auto_33481 ) ) ( not ( = ?auto_33485 ?auto_33480 ) ) ( ON ?auto_33480 ?auto_33483 ) ( not ( = ?auto_33480 ?auto_33483 ) ) ( not ( = ?auto_33481 ?auto_33483 ) ) ( not ( = ?auto_33484 ?auto_33483 ) ) ( not ( = ?auto_33482 ?auto_33483 ) ) ( not ( = ?auto_33485 ?auto_33483 ) ) ( CLEAR ?auto_33484 ) ( ON ?auto_33481 ?auto_33480 ) ( CLEAR ?auto_33481 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33483 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33483 ?auto_33480 )
      ( MAKE-2PILE ?auto_33480 ?auto_33481 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33486 - BLOCK
      ?auto_33487 - BLOCK
    )
    :vars
    (
      ?auto_33490 - BLOCK
      ?auto_33489 - BLOCK
      ?auto_33491 - BLOCK
      ?auto_33488 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33486 ?auto_33487 ) ) ( not ( = ?auto_33486 ?auto_33490 ) ) ( not ( = ?auto_33487 ?auto_33490 ) ) ( ON-TABLE ?auto_33489 ) ( ON ?auto_33491 ?auto_33489 ) ( not ( = ?auto_33489 ?auto_33491 ) ) ( not ( = ?auto_33489 ?auto_33490 ) ) ( not ( = ?auto_33489 ?auto_33487 ) ) ( not ( = ?auto_33489 ?auto_33486 ) ) ( not ( = ?auto_33491 ?auto_33490 ) ) ( not ( = ?auto_33491 ?auto_33487 ) ) ( not ( = ?auto_33491 ?auto_33486 ) ) ( ON ?auto_33486 ?auto_33488 ) ( not ( = ?auto_33486 ?auto_33488 ) ) ( not ( = ?auto_33487 ?auto_33488 ) ) ( not ( = ?auto_33490 ?auto_33488 ) ) ( not ( = ?auto_33489 ?auto_33488 ) ) ( not ( = ?auto_33491 ?auto_33488 ) ) ( ON ?auto_33487 ?auto_33486 ) ( CLEAR ?auto_33487 ) ( ON-TABLE ?auto_33488 ) ( HOLDING ?auto_33490 ) ( CLEAR ?auto_33491 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33489 ?auto_33491 ?auto_33490 )
      ( MAKE-2PILE ?auto_33486 ?auto_33487 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33492 - BLOCK
      ?auto_33493 - BLOCK
    )
    :vars
    (
      ?auto_33497 - BLOCK
      ?auto_33495 - BLOCK
      ?auto_33494 - BLOCK
      ?auto_33496 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33492 ?auto_33493 ) ) ( not ( = ?auto_33492 ?auto_33497 ) ) ( not ( = ?auto_33493 ?auto_33497 ) ) ( ON-TABLE ?auto_33495 ) ( ON ?auto_33494 ?auto_33495 ) ( not ( = ?auto_33495 ?auto_33494 ) ) ( not ( = ?auto_33495 ?auto_33497 ) ) ( not ( = ?auto_33495 ?auto_33493 ) ) ( not ( = ?auto_33495 ?auto_33492 ) ) ( not ( = ?auto_33494 ?auto_33497 ) ) ( not ( = ?auto_33494 ?auto_33493 ) ) ( not ( = ?auto_33494 ?auto_33492 ) ) ( ON ?auto_33492 ?auto_33496 ) ( not ( = ?auto_33492 ?auto_33496 ) ) ( not ( = ?auto_33493 ?auto_33496 ) ) ( not ( = ?auto_33497 ?auto_33496 ) ) ( not ( = ?auto_33495 ?auto_33496 ) ) ( not ( = ?auto_33494 ?auto_33496 ) ) ( ON ?auto_33493 ?auto_33492 ) ( ON-TABLE ?auto_33496 ) ( CLEAR ?auto_33494 ) ( ON ?auto_33497 ?auto_33493 ) ( CLEAR ?auto_33497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33496 ?auto_33492 ?auto_33493 )
      ( MAKE-2PILE ?auto_33492 ?auto_33493 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33498 - BLOCK
      ?auto_33499 - BLOCK
    )
    :vars
    (
      ?auto_33503 - BLOCK
      ?auto_33501 - BLOCK
      ?auto_33502 - BLOCK
      ?auto_33500 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33498 ?auto_33499 ) ) ( not ( = ?auto_33498 ?auto_33503 ) ) ( not ( = ?auto_33499 ?auto_33503 ) ) ( ON-TABLE ?auto_33501 ) ( not ( = ?auto_33501 ?auto_33502 ) ) ( not ( = ?auto_33501 ?auto_33503 ) ) ( not ( = ?auto_33501 ?auto_33499 ) ) ( not ( = ?auto_33501 ?auto_33498 ) ) ( not ( = ?auto_33502 ?auto_33503 ) ) ( not ( = ?auto_33502 ?auto_33499 ) ) ( not ( = ?auto_33502 ?auto_33498 ) ) ( ON ?auto_33498 ?auto_33500 ) ( not ( = ?auto_33498 ?auto_33500 ) ) ( not ( = ?auto_33499 ?auto_33500 ) ) ( not ( = ?auto_33503 ?auto_33500 ) ) ( not ( = ?auto_33501 ?auto_33500 ) ) ( not ( = ?auto_33502 ?auto_33500 ) ) ( ON ?auto_33499 ?auto_33498 ) ( ON-TABLE ?auto_33500 ) ( ON ?auto_33503 ?auto_33499 ) ( CLEAR ?auto_33503 ) ( HOLDING ?auto_33502 ) ( CLEAR ?auto_33501 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33501 ?auto_33502 )
      ( MAKE-2PILE ?auto_33498 ?auto_33499 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33504 - BLOCK
      ?auto_33505 - BLOCK
    )
    :vars
    (
      ?auto_33509 - BLOCK
      ?auto_33506 - BLOCK
      ?auto_33507 - BLOCK
      ?auto_33508 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33504 ?auto_33505 ) ) ( not ( = ?auto_33504 ?auto_33509 ) ) ( not ( = ?auto_33505 ?auto_33509 ) ) ( ON-TABLE ?auto_33506 ) ( not ( = ?auto_33506 ?auto_33507 ) ) ( not ( = ?auto_33506 ?auto_33509 ) ) ( not ( = ?auto_33506 ?auto_33505 ) ) ( not ( = ?auto_33506 ?auto_33504 ) ) ( not ( = ?auto_33507 ?auto_33509 ) ) ( not ( = ?auto_33507 ?auto_33505 ) ) ( not ( = ?auto_33507 ?auto_33504 ) ) ( ON ?auto_33504 ?auto_33508 ) ( not ( = ?auto_33504 ?auto_33508 ) ) ( not ( = ?auto_33505 ?auto_33508 ) ) ( not ( = ?auto_33509 ?auto_33508 ) ) ( not ( = ?auto_33506 ?auto_33508 ) ) ( not ( = ?auto_33507 ?auto_33508 ) ) ( ON ?auto_33505 ?auto_33504 ) ( ON-TABLE ?auto_33508 ) ( ON ?auto_33509 ?auto_33505 ) ( CLEAR ?auto_33506 ) ( ON ?auto_33507 ?auto_33509 ) ( CLEAR ?auto_33507 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33508 ?auto_33504 ?auto_33505 ?auto_33509 )
      ( MAKE-2PILE ?auto_33504 ?auto_33505 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33510 - BLOCK
      ?auto_33511 - BLOCK
    )
    :vars
    (
      ?auto_33512 - BLOCK
      ?auto_33513 - BLOCK
      ?auto_33515 - BLOCK
      ?auto_33514 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33510 ?auto_33511 ) ) ( not ( = ?auto_33510 ?auto_33512 ) ) ( not ( = ?auto_33511 ?auto_33512 ) ) ( not ( = ?auto_33513 ?auto_33515 ) ) ( not ( = ?auto_33513 ?auto_33512 ) ) ( not ( = ?auto_33513 ?auto_33511 ) ) ( not ( = ?auto_33513 ?auto_33510 ) ) ( not ( = ?auto_33515 ?auto_33512 ) ) ( not ( = ?auto_33515 ?auto_33511 ) ) ( not ( = ?auto_33515 ?auto_33510 ) ) ( ON ?auto_33510 ?auto_33514 ) ( not ( = ?auto_33510 ?auto_33514 ) ) ( not ( = ?auto_33511 ?auto_33514 ) ) ( not ( = ?auto_33512 ?auto_33514 ) ) ( not ( = ?auto_33513 ?auto_33514 ) ) ( not ( = ?auto_33515 ?auto_33514 ) ) ( ON ?auto_33511 ?auto_33510 ) ( ON-TABLE ?auto_33514 ) ( ON ?auto_33512 ?auto_33511 ) ( ON ?auto_33515 ?auto_33512 ) ( CLEAR ?auto_33515 ) ( HOLDING ?auto_33513 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33513 )
      ( MAKE-2PILE ?auto_33510 ?auto_33511 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33516 - BLOCK
      ?auto_33517 - BLOCK
    )
    :vars
    (
      ?auto_33521 - BLOCK
      ?auto_33519 - BLOCK
      ?auto_33518 - BLOCK
      ?auto_33520 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33516 ?auto_33517 ) ) ( not ( = ?auto_33516 ?auto_33521 ) ) ( not ( = ?auto_33517 ?auto_33521 ) ) ( not ( = ?auto_33519 ?auto_33518 ) ) ( not ( = ?auto_33519 ?auto_33521 ) ) ( not ( = ?auto_33519 ?auto_33517 ) ) ( not ( = ?auto_33519 ?auto_33516 ) ) ( not ( = ?auto_33518 ?auto_33521 ) ) ( not ( = ?auto_33518 ?auto_33517 ) ) ( not ( = ?auto_33518 ?auto_33516 ) ) ( ON ?auto_33516 ?auto_33520 ) ( not ( = ?auto_33516 ?auto_33520 ) ) ( not ( = ?auto_33517 ?auto_33520 ) ) ( not ( = ?auto_33521 ?auto_33520 ) ) ( not ( = ?auto_33519 ?auto_33520 ) ) ( not ( = ?auto_33518 ?auto_33520 ) ) ( ON ?auto_33517 ?auto_33516 ) ( ON-TABLE ?auto_33520 ) ( ON ?auto_33521 ?auto_33517 ) ( ON ?auto_33518 ?auto_33521 ) ( ON ?auto_33519 ?auto_33518 ) ( CLEAR ?auto_33519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_33520 ?auto_33516 ?auto_33517 ?auto_33521 ?auto_33518 )
      ( MAKE-2PILE ?auto_33516 ?auto_33517 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33524 - BLOCK
      ?auto_33525 - BLOCK
    )
    :vars
    (
      ?auto_33526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33526 ?auto_33525 ) ( CLEAR ?auto_33526 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33524 ) ( ON ?auto_33525 ?auto_33524 ) ( not ( = ?auto_33524 ?auto_33525 ) ) ( not ( = ?auto_33524 ?auto_33526 ) ) ( not ( = ?auto_33525 ?auto_33526 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33526 ?auto_33525 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33527 - BLOCK
      ?auto_33528 - BLOCK
    )
    :vars
    (
      ?auto_33529 - BLOCK
      ?auto_33530 - BLOCK
      ?auto_33531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33529 ?auto_33528 ) ( CLEAR ?auto_33529 ) ( ON-TABLE ?auto_33527 ) ( ON ?auto_33528 ?auto_33527 ) ( not ( = ?auto_33527 ?auto_33528 ) ) ( not ( = ?auto_33527 ?auto_33529 ) ) ( not ( = ?auto_33528 ?auto_33529 ) ) ( HOLDING ?auto_33530 ) ( CLEAR ?auto_33531 ) ( not ( = ?auto_33527 ?auto_33530 ) ) ( not ( = ?auto_33527 ?auto_33531 ) ) ( not ( = ?auto_33528 ?auto_33530 ) ) ( not ( = ?auto_33528 ?auto_33531 ) ) ( not ( = ?auto_33529 ?auto_33530 ) ) ( not ( = ?auto_33529 ?auto_33531 ) ) ( not ( = ?auto_33530 ?auto_33531 ) ) )
    :subtasks
    ( ( !STACK ?auto_33530 ?auto_33531 )
      ( MAKE-2PILE ?auto_33527 ?auto_33528 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33532 - BLOCK
      ?auto_33533 - BLOCK
    )
    :vars
    (
      ?auto_33535 - BLOCK
      ?auto_33534 - BLOCK
      ?auto_33536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33535 ?auto_33533 ) ( ON-TABLE ?auto_33532 ) ( ON ?auto_33533 ?auto_33532 ) ( not ( = ?auto_33532 ?auto_33533 ) ) ( not ( = ?auto_33532 ?auto_33535 ) ) ( not ( = ?auto_33533 ?auto_33535 ) ) ( CLEAR ?auto_33534 ) ( not ( = ?auto_33532 ?auto_33536 ) ) ( not ( = ?auto_33532 ?auto_33534 ) ) ( not ( = ?auto_33533 ?auto_33536 ) ) ( not ( = ?auto_33533 ?auto_33534 ) ) ( not ( = ?auto_33535 ?auto_33536 ) ) ( not ( = ?auto_33535 ?auto_33534 ) ) ( not ( = ?auto_33536 ?auto_33534 ) ) ( ON ?auto_33536 ?auto_33535 ) ( CLEAR ?auto_33536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33532 ?auto_33533 ?auto_33535 )
      ( MAKE-2PILE ?auto_33532 ?auto_33533 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33537 - BLOCK
      ?auto_33538 - BLOCK
    )
    :vars
    (
      ?auto_33541 - BLOCK
      ?auto_33539 - BLOCK
      ?auto_33540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33541 ?auto_33538 ) ( ON-TABLE ?auto_33537 ) ( ON ?auto_33538 ?auto_33537 ) ( not ( = ?auto_33537 ?auto_33538 ) ) ( not ( = ?auto_33537 ?auto_33541 ) ) ( not ( = ?auto_33538 ?auto_33541 ) ) ( not ( = ?auto_33537 ?auto_33539 ) ) ( not ( = ?auto_33537 ?auto_33540 ) ) ( not ( = ?auto_33538 ?auto_33539 ) ) ( not ( = ?auto_33538 ?auto_33540 ) ) ( not ( = ?auto_33541 ?auto_33539 ) ) ( not ( = ?auto_33541 ?auto_33540 ) ) ( not ( = ?auto_33539 ?auto_33540 ) ) ( ON ?auto_33539 ?auto_33541 ) ( CLEAR ?auto_33539 ) ( HOLDING ?auto_33540 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33540 )
      ( MAKE-2PILE ?auto_33537 ?auto_33538 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33542 - BLOCK
      ?auto_33543 - BLOCK
    )
    :vars
    (
      ?auto_33546 - BLOCK
      ?auto_33545 - BLOCK
      ?auto_33544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33546 ?auto_33543 ) ( ON-TABLE ?auto_33542 ) ( ON ?auto_33543 ?auto_33542 ) ( not ( = ?auto_33542 ?auto_33543 ) ) ( not ( = ?auto_33542 ?auto_33546 ) ) ( not ( = ?auto_33543 ?auto_33546 ) ) ( not ( = ?auto_33542 ?auto_33545 ) ) ( not ( = ?auto_33542 ?auto_33544 ) ) ( not ( = ?auto_33543 ?auto_33545 ) ) ( not ( = ?auto_33543 ?auto_33544 ) ) ( not ( = ?auto_33546 ?auto_33545 ) ) ( not ( = ?auto_33546 ?auto_33544 ) ) ( not ( = ?auto_33545 ?auto_33544 ) ) ( ON ?auto_33545 ?auto_33546 ) ( ON ?auto_33544 ?auto_33545 ) ( CLEAR ?auto_33544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33542 ?auto_33543 ?auto_33546 ?auto_33545 )
      ( MAKE-2PILE ?auto_33542 ?auto_33543 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33547 - BLOCK
      ?auto_33548 - BLOCK
    )
    :vars
    (
      ?auto_33551 - BLOCK
      ?auto_33550 - BLOCK
      ?auto_33549 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33551 ?auto_33548 ) ( ON-TABLE ?auto_33547 ) ( ON ?auto_33548 ?auto_33547 ) ( not ( = ?auto_33547 ?auto_33548 ) ) ( not ( = ?auto_33547 ?auto_33551 ) ) ( not ( = ?auto_33548 ?auto_33551 ) ) ( not ( = ?auto_33547 ?auto_33550 ) ) ( not ( = ?auto_33547 ?auto_33549 ) ) ( not ( = ?auto_33548 ?auto_33550 ) ) ( not ( = ?auto_33548 ?auto_33549 ) ) ( not ( = ?auto_33551 ?auto_33550 ) ) ( not ( = ?auto_33551 ?auto_33549 ) ) ( not ( = ?auto_33550 ?auto_33549 ) ) ( ON ?auto_33550 ?auto_33551 ) ( HOLDING ?auto_33549 ) ( CLEAR ?auto_33550 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_33547 ?auto_33548 ?auto_33551 ?auto_33550 ?auto_33549 )
      ( MAKE-2PILE ?auto_33547 ?auto_33548 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33552 - BLOCK
      ?auto_33553 - BLOCK
    )
    :vars
    (
      ?auto_33556 - BLOCK
      ?auto_33555 - BLOCK
      ?auto_33554 - BLOCK
      ?auto_33557 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33556 ?auto_33553 ) ( ON-TABLE ?auto_33552 ) ( ON ?auto_33553 ?auto_33552 ) ( not ( = ?auto_33552 ?auto_33553 ) ) ( not ( = ?auto_33552 ?auto_33556 ) ) ( not ( = ?auto_33553 ?auto_33556 ) ) ( not ( = ?auto_33552 ?auto_33555 ) ) ( not ( = ?auto_33552 ?auto_33554 ) ) ( not ( = ?auto_33553 ?auto_33555 ) ) ( not ( = ?auto_33553 ?auto_33554 ) ) ( not ( = ?auto_33556 ?auto_33555 ) ) ( not ( = ?auto_33556 ?auto_33554 ) ) ( not ( = ?auto_33555 ?auto_33554 ) ) ( ON ?auto_33555 ?auto_33556 ) ( CLEAR ?auto_33555 ) ( ON ?auto_33554 ?auto_33557 ) ( CLEAR ?auto_33554 ) ( HAND-EMPTY ) ( not ( = ?auto_33552 ?auto_33557 ) ) ( not ( = ?auto_33553 ?auto_33557 ) ) ( not ( = ?auto_33556 ?auto_33557 ) ) ( not ( = ?auto_33555 ?auto_33557 ) ) ( not ( = ?auto_33554 ?auto_33557 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33554 ?auto_33557 )
      ( MAKE-2PILE ?auto_33552 ?auto_33553 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33558 - BLOCK
      ?auto_33559 - BLOCK
    )
    :vars
    (
      ?auto_33563 - BLOCK
      ?auto_33562 - BLOCK
      ?auto_33561 - BLOCK
      ?auto_33560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33563 ?auto_33559 ) ( ON-TABLE ?auto_33558 ) ( ON ?auto_33559 ?auto_33558 ) ( not ( = ?auto_33558 ?auto_33559 ) ) ( not ( = ?auto_33558 ?auto_33563 ) ) ( not ( = ?auto_33559 ?auto_33563 ) ) ( not ( = ?auto_33558 ?auto_33562 ) ) ( not ( = ?auto_33558 ?auto_33561 ) ) ( not ( = ?auto_33559 ?auto_33562 ) ) ( not ( = ?auto_33559 ?auto_33561 ) ) ( not ( = ?auto_33563 ?auto_33562 ) ) ( not ( = ?auto_33563 ?auto_33561 ) ) ( not ( = ?auto_33562 ?auto_33561 ) ) ( ON ?auto_33561 ?auto_33560 ) ( CLEAR ?auto_33561 ) ( not ( = ?auto_33558 ?auto_33560 ) ) ( not ( = ?auto_33559 ?auto_33560 ) ) ( not ( = ?auto_33563 ?auto_33560 ) ) ( not ( = ?auto_33562 ?auto_33560 ) ) ( not ( = ?auto_33561 ?auto_33560 ) ) ( HOLDING ?auto_33562 ) ( CLEAR ?auto_33563 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33558 ?auto_33559 ?auto_33563 ?auto_33562 )
      ( MAKE-2PILE ?auto_33558 ?auto_33559 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33564 - BLOCK
      ?auto_33565 - BLOCK
    )
    :vars
    (
      ?auto_33567 - BLOCK
      ?auto_33569 - BLOCK
      ?auto_33568 - BLOCK
      ?auto_33566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33567 ?auto_33565 ) ( ON-TABLE ?auto_33564 ) ( ON ?auto_33565 ?auto_33564 ) ( not ( = ?auto_33564 ?auto_33565 ) ) ( not ( = ?auto_33564 ?auto_33567 ) ) ( not ( = ?auto_33565 ?auto_33567 ) ) ( not ( = ?auto_33564 ?auto_33569 ) ) ( not ( = ?auto_33564 ?auto_33568 ) ) ( not ( = ?auto_33565 ?auto_33569 ) ) ( not ( = ?auto_33565 ?auto_33568 ) ) ( not ( = ?auto_33567 ?auto_33569 ) ) ( not ( = ?auto_33567 ?auto_33568 ) ) ( not ( = ?auto_33569 ?auto_33568 ) ) ( ON ?auto_33568 ?auto_33566 ) ( not ( = ?auto_33564 ?auto_33566 ) ) ( not ( = ?auto_33565 ?auto_33566 ) ) ( not ( = ?auto_33567 ?auto_33566 ) ) ( not ( = ?auto_33569 ?auto_33566 ) ) ( not ( = ?auto_33568 ?auto_33566 ) ) ( CLEAR ?auto_33567 ) ( ON ?auto_33569 ?auto_33568 ) ( CLEAR ?auto_33569 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33566 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33566 ?auto_33568 )
      ( MAKE-2PILE ?auto_33564 ?auto_33565 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33582 - BLOCK
      ?auto_33583 - BLOCK
    )
    :vars
    (
      ?auto_33584 - BLOCK
      ?auto_33587 - BLOCK
      ?auto_33586 - BLOCK
      ?auto_33585 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33582 ) ( not ( = ?auto_33582 ?auto_33583 ) ) ( not ( = ?auto_33582 ?auto_33584 ) ) ( not ( = ?auto_33583 ?auto_33584 ) ) ( not ( = ?auto_33582 ?auto_33587 ) ) ( not ( = ?auto_33582 ?auto_33586 ) ) ( not ( = ?auto_33583 ?auto_33587 ) ) ( not ( = ?auto_33583 ?auto_33586 ) ) ( not ( = ?auto_33584 ?auto_33587 ) ) ( not ( = ?auto_33584 ?auto_33586 ) ) ( not ( = ?auto_33587 ?auto_33586 ) ) ( ON ?auto_33586 ?auto_33585 ) ( not ( = ?auto_33582 ?auto_33585 ) ) ( not ( = ?auto_33583 ?auto_33585 ) ) ( not ( = ?auto_33584 ?auto_33585 ) ) ( not ( = ?auto_33587 ?auto_33585 ) ) ( not ( = ?auto_33586 ?auto_33585 ) ) ( ON ?auto_33587 ?auto_33586 ) ( ON-TABLE ?auto_33585 ) ( ON ?auto_33584 ?auto_33587 ) ( CLEAR ?auto_33584 ) ( HOLDING ?auto_33583 ) ( CLEAR ?auto_33582 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33582 ?auto_33583 ?auto_33584 )
      ( MAKE-2PILE ?auto_33582 ?auto_33583 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33588 - BLOCK
      ?auto_33589 - BLOCK
    )
    :vars
    (
      ?auto_33593 - BLOCK
      ?auto_33590 - BLOCK
      ?auto_33591 - BLOCK
      ?auto_33592 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33588 ) ( not ( = ?auto_33588 ?auto_33589 ) ) ( not ( = ?auto_33588 ?auto_33593 ) ) ( not ( = ?auto_33589 ?auto_33593 ) ) ( not ( = ?auto_33588 ?auto_33590 ) ) ( not ( = ?auto_33588 ?auto_33591 ) ) ( not ( = ?auto_33589 ?auto_33590 ) ) ( not ( = ?auto_33589 ?auto_33591 ) ) ( not ( = ?auto_33593 ?auto_33590 ) ) ( not ( = ?auto_33593 ?auto_33591 ) ) ( not ( = ?auto_33590 ?auto_33591 ) ) ( ON ?auto_33591 ?auto_33592 ) ( not ( = ?auto_33588 ?auto_33592 ) ) ( not ( = ?auto_33589 ?auto_33592 ) ) ( not ( = ?auto_33593 ?auto_33592 ) ) ( not ( = ?auto_33590 ?auto_33592 ) ) ( not ( = ?auto_33591 ?auto_33592 ) ) ( ON ?auto_33590 ?auto_33591 ) ( ON-TABLE ?auto_33592 ) ( ON ?auto_33593 ?auto_33590 ) ( CLEAR ?auto_33588 ) ( ON ?auto_33589 ?auto_33593 ) ( CLEAR ?auto_33589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33592 ?auto_33591 ?auto_33590 ?auto_33593 )
      ( MAKE-2PILE ?auto_33588 ?auto_33589 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33594 - BLOCK
      ?auto_33595 - BLOCK
    )
    :vars
    (
      ?auto_33596 - BLOCK
      ?auto_33598 - BLOCK
      ?auto_33599 - BLOCK
      ?auto_33597 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33594 ?auto_33595 ) ) ( not ( = ?auto_33594 ?auto_33596 ) ) ( not ( = ?auto_33595 ?auto_33596 ) ) ( not ( = ?auto_33594 ?auto_33598 ) ) ( not ( = ?auto_33594 ?auto_33599 ) ) ( not ( = ?auto_33595 ?auto_33598 ) ) ( not ( = ?auto_33595 ?auto_33599 ) ) ( not ( = ?auto_33596 ?auto_33598 ) ) ( not ( = ?auto_33596 ?auto_33599 ) ) ( not ( = ?auto_33598 ?auto_33599 ) ) ( ON ?auto_33599 ?auto_33597 ) ( not ( = ?auto_33594 ?auto_33597 ) ) ( not ( = ?auto_33595 ?auto_33597 ) ) ( not ( = ?auto_33596 ?auto_33597 ) ) ( not ( = ?auto_33598 ?auto_33597 ) ) ( not ( = ?auto_33599 ?auto_33597 ) ) ( ON ?auto_33598 ?auto_33599 ) ( ON-TABLE ?auto_33597 ) ( ON ?auto_33596 ?auto_33598 ) ( ON ?auto_33595 ?auto_33596 ) ( CLEAR ?auto_33595 ) ( HOLDING ?auto_33594 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33594 )
      ( MAKE-2PILE ?auto_33594 ?auto_33595 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33600 - BLOCK
      ?auto_33601 - BLOCK
    )
    :vars
    (
      ?auto_33604 - BLOCK
      ?auto_33603 - BLOCK
      ?auto_33602 - BLOCK
      ?auto_33605 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33600 ?auto_33601 ) ) ( not ( = ?auto_33600 ?auto_33604 ) ) ( not ( = ?auto_33601 ?auto_33604 ) ) ( not ( = ?auto_33600 ?auto_33603 ) ) ( not ( = ?auto_33600 ?auto_33602 ) ) ( not ( = ?auto_33601 ?auto_33603 ) ) ( not ( = ?auto_33601 ?auto_33602 ) ) ( not ( = ?auto_33604 ?auto_33603 ) ) ( not ( = ?auto_33604 ?auto_33602 ) ) ( not ( = ?auto_33603 ?auto_33602 ) ) ( ON ?auto_33602 ?auto_33605 ) ( not ( = ?auto_33600 ?auto_33605 ) ) ( not ( = ?auto_33601 ?auto_33605 ) ) ( not ( = ?auto_33604 ?auto_33605 ) ) ( not ( = ?auto_33603 ?auto_33605 ) ) ( not ( = ?auto_33602 ?auto_33605 ) ) ( ON ?auto_33603 ?auto_33602 ) ( ON-TABLE ?auto_33605 ) ( ON ?auto_33604 ?auto_33603 ) ( ON ?auto_33601 ?auto_33604 ) ( ON ?auto_33600 ?auto_33601 ) ( CLEAR ?auto_33600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_33605 ?auto_33602 ?auto_33603 ?auto_33604 ?auto_33601 )
      ( MAKE-2PILE ?auto_33600 ?auto_33601 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33609 - BLOCK
      ?auto_33610 - BLOCK
      ?auto_33611 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_33611 ) ( CLEAR ?auto_33610 ) ( ON-TABLE ?auto_33609 ) ( ON ?auto_33610 ?auto_33609 ) ( not ( = ?auto_33609 ?auto_33610 ) ) ( not ( = ?auto_33609 ?auto_33611 ) ) ( not ( = ?auto_33610 ?auto_33611 ) ) )
    :subtasks
    ( ( !STACK ?auto_33611 ?auto_33610 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33612 - BLOCK
      ?auto_33613 - BLOCK
      ?auto_33614 - BLOCK
    )
    :vars
    (
      ?auto_33615 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_33613 ) ( ON-TABLE ?auto_33612 ) ( ON ?auto_33613 ?auto_33612 ) ( not ( = ?auto_33612 ?auto_33613 ) ) ( not ( = ?auto_33612 ?auto_33614 ) ) ( not ( = ?auto_33613 ?auto_33614 ) ) ( ON ?auto_33614 ?auto_33615 ) ( CLEAR ?auto_33614 ) ( HAND-EMPTY ) ( not ( = ?auto_33612 ?auto_33615 ) ) ( not ( = ?auto_33613 ?auto_33615 ) ) ( not ( = ?auto_33614 ?auto_33615 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33614 ?auto_33615 )
      ( MAKE-3PILE ?auto_33612 ?auto_33613 ?auto_33614 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33616 - BLOCK
      ?auto_33617 - BLOCK
      ?auto_33618 - BLOCK
    )
    :vars
    (
      ?auto_33619 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33616 ) ( not ( = ?auto_33616 ?auto_33617 ) ) ( not ( = ?auto_33616 ?auto_33618 ) ) ( not ( = ?auto_33617 ?auto_33618 ) ) ( ON ?auto_33618 ?auto_33619 ) ( CLEAR ?auto_33618 ) ( not ( = ?auto_33616 ?auto_33619 ) ) ( not ( = ?auto_33617 ?auto_33619 ) ) ( not ( = ?auto_33618 ?auto_33619 ) ) ( HOLDING ?auto_33617 ) ( CLEAR ?auto_33616 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33616 ?auto_33617 )
      ( MAKE-3PILE ?auto_33616 ?auto_33617 ?auto_33618 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33620 - BLOCK
      ?auto_33621 - BLOCK
      ?auto_33622 - BLOCK
    )
    :vars
    (
      ?auto_33623 - BLOCK
      ?auto_33624 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33620 ) ( not ( = ?auto_33620 ?auto_33621 ) ) ( not ( = ?auto_33620 ?auto_33622 ) ) ( not ( = ?auto_33621 ?auto_33622 ) ) ( ON ?auto_33622 ?auto_33623 ) ( not ( = ?auto_33620 ?auto_33623 ) ) ( not ( = ?auto_33621 ?auto_33623 ) ) ( not ( = ?auto_33622 ?auto_33623 ) ) ( CLEAR ?auto_33620 ) ( ON ?auto_33621 ?auto_33622 ) ( CLEAR ?auto_33621 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33624 ) ( ON ?auto_33623 ?auto_33624 ) ( not ( = ?auto_33624 ?auto_33623 ) ) ( not ( = ?auto_33624 ?auto_33622 ) ) ( not ( = ?auto_33624 ?auto_33621 ) ) ( not ( = ?auto_33620 ?auto_33624 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33624 ?auto_33623 ?auto_33622 )
      ( MAKE-3PILE ?auto_33620 ?auto_33621 ?auto_33622 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33625 - BLOCK
      ?auto_33626 - BLOCK
      ?auto_33627 - BLOCK
    )
    :vars
    (
      ?auto_33629 - BLOCK
      ?auto_33628 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33625 ?auto_33626 ) ) ( not ( = ?auto_33625 ?auto_33627 ) ) ( not ( = ?auto_33626 ?auto_33627 ) ) ( ON ?auto_33627 ?auto_33629 ) ( not ( = ?auto_33625 ?auto_33629 ) ) ( not ( = ?auto_33626 ?auto_33629 ) ) ( not ( = ?auto_33627 ?auto_33629 ) ) ( ON ?auto_33626 ?auto_33627 ) ( CLEAR ?auto_33626 ) ( ON-TABLE ?auto_33628 ) ( ON ?auto_33629 ?auto_33628 ) ( not ( = ?auto_33628 ?auto_33629 ) ) ( not ( = ?auto_33628 ?auto_33627 ) ) ( not ( = ?auto_33628 ?auto_33626 ) ) ( not ( = ?auto_33625 ?auto_33628 ) ) ( HOLDING ?auto_33625 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33625 )
      ( MAKE-3PILE ?auto_33625 ?auto_33626 ?auto_33627 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33630 - BLOCK
      ?auto_33631 - BLOCK
      ?auto_33632 - BLOCK
    )
    :vars
    (
      ?auto_33633 - BLOCK
      ?auto_33634 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33630 ?auto_33631 ) ) ( not ( = ?auto_33630 ?auto_33632 ) ) ( not ( = ?auto_33631 ?auto_33632 ) ) ( ON ?auto_33632 ?auto_33633 ) ( not ( = ?auto_33630 ?auto_33633 ) ) ( not ( = ?auto_33631 ?auto_33633 ) ) ( not ( = ?auto_33632 ?auto_33633 ) ) ( ON ?auto_33631 ?auto_33632 ) ( ON-TABLE ?auto_33634 ) ( ON ?auto_33633 ?auto_33634 ) ( not ( = ?auto_33634 ?auto_33633 ) ) ( not ( = ?auto_33634 ?auto_33632 ) ) ( not ( = ?auto_33634 ?auto_33631 ) ) ( not ( = ?auto_33630 ?auto_33634 ) ) ( ON ?auto_33630 ?auto_33631 ) ( CLEAR ?auto_33630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33634 ?auto_33633 ?auto_33632 ?auto_33631 )
      ( MAKE-3PILE ?auto_33630 ?auto_33631 ?auto_33632 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33635 - BLOCK
      ?auto_33636 - BLOCK
      ?auto_33637 - BLOCK
    )
    :vars
    (
      ?auto_33639 - BLOCK
      ?auto_33638 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33635 ?auto_33636 ) ) ( not ( = ?auto_33635 ?auto_33637 ) ) ( not ( = ?auto_33636 ?auto_33637 ) ) ( ON ?auto_33637 ?auto_33639 ) ( not ( = ?auto_33635 ?auto_33639 ) ) ( not ( = ?auto_33636 ?auto_33639 ) ) ( not ( = ?auto_33637 ?auto_33639 ) ) ( ON ?auto_33636 ?auto_33637 ) ( ON-TABLE ?auto_33638 ) ( ON ?auto_33639 ?auto_33638 ) ( not ( = ?auto_33638 ?auto_33639 ) ) ( not ( = ?auto_33638 ?auto_33637 ) ) ( not ( = ?auto_33638 ?auto_33636 ) ) ( not ( = ?auto_33635 ?auto_33638 ) ) ( HOLDING ?auto_33635 ) ( CLEAR ?auto_33636 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_33638 ?auto_33639 ?auto_33637 ?auto_33636 ?auto_33635 )
      ( MAKE-3PILE ?auto_33635 ?auto_33636 ?auto_33637 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33640 - BLOCK
      ?auto_33641 - BLOCK
      ?auto_33642 - BLOCK
    )
    :vars
    (
      ?auto_33643 - BLOCK
      ?auto_33644 - BLOCK
      ?auto_33645 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33640 ?auto_33641 ) ) ( not ( = ?auto_33640 ?auto_33642 ) ) ( not ( = ?auto_33641 ?auto_33642 ) ) ( ON ?auto_33642 ?auto_33643 ) ( not ( = ?auto_33640 ?auto_33643 ) ) ( not ( = ?auto_33641 ?auto_33643 ) ) ( not ( = ?auto_33642 ?auto_33643 ) ) ( ON ?auto_33641 ?auto_33642 ) ( ON-TABLE ?auto_33644 ) ( ON ?auto_33643 ?auto_33644 ) ( not ( = ?auto_33644 ?auto_33643 ) ) ( not ( = ?auto_33644 ?auto_33642 ) ) ( not ( = ?auto_33644 ?auto_33641 ) ) ( not ( = ?auto_33640 ?auto_33644 ) ) ( CLEAR ?auto_33641 ) ( ON ?auto_33640 ?auto_33645 ) ( CLEAR ?auto_33640 ) ( HAND-EMPTY ) ( not ( = ?auto_33640 ?auto_33645 ) ) ( not ( = ?auto_33641 ?auto_33645 ) ) ( not ( = ?auto_33642 ?auto_33645 ) ) ( not ( = ?auto_33643 ?auto_33645 ) ) ( not ( = ?auto_33644 ?auto_33645 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33640 ?auto_33645 )
      ( MAKE-3PILE ?auto_33640 ?auto_33641 ?auto_33642 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33646 - BLOCK
      ?auto_33647 - BLOCK
      ?auto_33648 - BLOCK
    )
    :vars
    (
      ?auto_33650 - BLOCK
      ?auto_33651 - BLOCK
      ?auto_33649 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33646 ?auto_33647 ) ) ( not ( = ?auto_33646 ?auto_33648 ) ) ( not ( = ?auto_33647 ?auto_33648 ) ) ( ON ?auto_33648 ?auto_33650 ) ( not ( = ?auto_33646 ?auto_33650 ) ) ( not ( = ?auto_33647 ?auto_33650 ) ) ( not ( = ?auto_33648 ?auto_33650 ) ) ( ON-TABLE ?auto_33651 ) ( ON ?auto_33650 ?auto_33651 ) ( not ( = ?auto_33651 ?auto_33650 ) ) ( not ( = ?auto_33651 ?auto_33648 ) ) ( not ( = ?auto_33651 ?auto_33647 ) ) ( not ( = ?auto_33646 ?auto_33651 ) ) ( ON ?auto_33646 ?auto_33649 ) ( CLEAR ?auto_33646 ) ( not ( = ?auto_33646 ?auto_33649 ) ) ( not ( = ?auto_33647 ?auto_33649 ) ) ( not ( = ?auto_33648 ?auto_33649 ) ) ( not ( = ?auto_33650 ?auto_33649 ) ) ( not ( = ?auto_33651 ?auto_33649 ) ) ( HOLDING ?auto_33647 ) ( CLEAR ?auto_33648 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33651 ?auto_33650 ?auto_33648 ?auto_33647 )
      ( MAKE-3PILE ?auto_33646 ?auto_33647 ?auto_33648 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33652 - BLOCK
      ?auto_33653 - BLOCK
      ?auto_33654 - BLOCK
    )
    :vars
    (
      ?auto_33656 - BLOCK
      ?auto_33655 - BLOCK
      ?auto_33657 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33652 ?auto_33653 ) ) ( not ( = ?auto_33652 ?auto_33654 ) ) ( not ( = ?auto_33653 ?auto_33654 ) ) ( ON ?auto_33654 ?auto_33656 ) ( not ( = ?auto_33652 ?auto_33656 ) ) ( not ( = ?auto_33653 ?auto_33656 ) ) ( not ( = ?auto_33654 ?auto_33656 ) ) ( ON-TABLE ?auto_33655 ) ( ON ?auto_33656 ?auto_33655 ) ( not ( = ?auto_33655 ?auto_33656 ) ) ( not ( = ?auto_33655 ?auto_33654 ) ) ( not ( = ?auto_33655 ?auto_33653 ) ) ( not ( = ?auto_33652 ?auto_33655 ) ) ( ON ?auto_33652 ?auto_33657 ) ( not ( = ?auto_33652 ?auto_33657 ) ) ( not ( = ?auto_33653 ?auto_33657 ) ) ( not ( = ?auto_33654 ?auto_33657 ) ) ( not ( = ?auto_33656 ?auto_33657 ) ) ( not ( = ?auto_33655 ?auto_33657 ) ) ( CLEAR ?auto_33654 ) ( ON ?auto_33653 ?auto_33652 ) ( CLEAR ?auto_33653 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33657 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33657 ?auto_33652 )
      ( MAKE-3PILE ?auto_33652 ?auto_33653 ?auto_33654 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33658 - BLOCK
      ?auto_33659 - BLOCK
      ?auto_33660 - BLOCK
    )
    :vars
    (
      ?auto_33661 - BLOCK
      ?auto_33663 - BLOCK
      ?auto_33662 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33658 ?auto_33659 ) ) ( not ( = ?auto_33658 ?auto_33660 ) ) ( not ( = ?auto_33659 ?auto_33660 ) ) ( not ( = ?auto_33658 ?auto_33661 ) ) ( not ( = ?auto_33659 ?auto_33661 ) ) ( not ( = ?auto_33660 ?auto_33661 ) ) ( ON-TABLE ?auto_33663 ) ( ON ?auto_33661 ?auto_33663 ) ( not ( = ?auto_33663 ?auto_33661 ) ) ( not ( = ?auto_33663 ?auto_33660 ) ) ( not ( = ?auto_33663 ?auto_33659 ) ) ( not ( = ?auto_33658 ?auto_33663 ) ) ( ON ?auto_33658 ?auto_33662 ) ( not ( = ?auto_33658 ?auto_33662 ) ) ( not ( = ?auto_33659 ?auto_33662 ) ) ( not ( = ?auto_33660 ?auto_33662 ) ) ( not ( = ?auto_33661 ?auto_33662 ) ) ( not ( = ?auto_33663 ?auto_33662 ) ) ( ON ?auto_33659 ?auto_33658 ) ( CLEAR ?auto_33659 ) ( ON-TABLE ?auto_33662 ) ( HOLDING ?auto_33660 ) ( CLEAR ?auto_33661 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33663 ?auto_33661 ?auto_33660 )
      ( MAKE-3PILE ?auto_33658 ?auto_33659 ?auto_33660 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33664 - BLOCK
      ?auto_33665 - BLOCK
      ?auto_33666 - BLOCK
    )
    :vars
    (
      ?auto_33668 - BLOCK
      ?auto_33667 - BLOCK
      ?auto_33669 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33664 ?auto_33665 ) ) ( not ( = ?auto_33664 ?auto_33666 ) ) ( not ( = ?auto_33665 ?auto_33666 ) ) ( not ( = ?auto_33664 ?auto_33668 ) ) ( not ( = ?auto_33665 ?auto_33668 ) ) ( not ( = ?auto_33666 ?auto_33668 ) ) ( ON-TABLE ?auto_33667 ) ( ON ?auto_33668 ?auto_33667 ) ( not ( = ?auto_33667 ?auto_33668 ) ) ( not ( = ?auto_33667 ?auto_33666 ) ) ( not ( = ?auto_33667 ?auto_33665 ) ) ( not ( = ?auto_33664 ?auto_33667 ) ) ( ON ?auto_33664 ?auto_33669 ) ( not ( = ?auto_33664 ?auto_33669 ) ) ( not ( = ?auto_33665 ?auto_33669 ) ) ( not ( = ?auto_33666 ?auto_33669 ) ) ( not ( = ?auto_33668 ?auto_33669 ) ) ( not ( = ?auto_33667 ?auto_33669 ) ) ( ON ?auto_33665 ?auto_33664 ) ( ON-TABLE ?auto_33669 ) ( CLEAR ?auto_33668 ) ( ON ?auto_33666 ?auto_33665 ) ( CLEAR ?auto_33666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33669 ?auto_33664 ?auto_33665 )
      ( MAKE-3PILE ?auto_33664 ?auto_33665 ?auto_33666 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33670 - BLOCK
      ?auto_33671 - BLOCK
      ?auto_33672 - BLOCK
    )
    :vars
    (
      ?auto_33674 - BLOCK
      ?auto_33673 - BLOCK
      ?auto_33675 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33670 ?auto_33671 ) ) ( not ( = ?auto_33670 ?auto_33672 ) ) ( not ( = ?auto_33671 ?auto_33672 ) ) ( not ( = ?auto_33670 ?auto_33674 ) ) ( not ( = ?auto_33671 ?auto_33674 ) ) ( not ( = ?auto_33672 ?auto_33674 ) ) ( ON-TABLE ?auto_33673 ) ( not ( = ?auto_33673 ?auto_33674 ) ) ( not ( = ?auto_33673 ?auto_33672 ) ) ( not ( = ?auto_33673 ?auto_33671 ) ) ( not ( = ?auto_33670 ?auto_33673 ) ) ( ON ?auto_33670 ?auto_33675 ) ( not ( = ?auto_33670 ?auto_33675 ) ) ( not ( = ?auto_33671 ?auto_33675 ) ) ( not ( = ?auto_33672 ?auto_33675 ) ) ( not ( = ?auto_33674 ?auto_33675 ) ) ( not ( = ?auto_33673 ?auto_33675 ) ) ( ON ?auto_33671 ?auto_33670 ) ( ON-TABLE ?auto_33675 ) ( ON ?auto_33672 ?auto_33671 ) ( CLEAR ?auto_33672 ) ( HOLDING ?auto_33674 ) ( CLEAR ?auto_33673 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33673 ?auto_33674 )
      ( MAKE-3PILE ?auto_33670 ?auto_33671 ?auto_33672 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33676 - BLOCK
      ?auto_33677 - BLOCK
      ?auto_33678 - BLOCK
    )
    :vars
    (
      ?auto_33680 - BLOCK
      ?auto_33679 - BLOCK
      ?auto_33681 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33676 ?auto_33677 ) ) ( not ( = ?auto_33676 ?auto_33678 ) ) ( not ( = ?auto_33677 ?auto_33678 ) ) ( not ( = ?auto_33676 ?auto_33680 ) ) ( not ( = ?auto_33677 ?auto_33680 ) ) ( not ( = ?auto_33678 ?auto_33680 ) ) ( ON-TABLE ?auto_33679 ) ( not ( = ?auto_33679 ?auto_33680 ) ) ( not ( = ?auto_33679 ?auto_33678 ) ) ( not ( = ?auto_33679 ?auto_33677 ) ) ( not ( = ?auto_33676 ?auto_33679 ) ) ( ON ?auto_33676 ?auto_33681 ) ( not ( = ?auto_33676 ?auto_33681 ) ) ( not ( = ?auto_33677 ?auto_33681 ) ) ( not ( = ?auto_33678 ?auto_33681 ) ) ( not ( = ?auto_33680 ?auto_33681 ) ) ( not ( = ?auto_33679 ?auto_33681 ) ) ( ON ?auto_33677 ?auto_33676 ) ( ON-TABLE ?auto_33681 ) ( ON ?auto_33678 ?auto_33677 ) ( CLEAR ?auto_33679 ) ( ON ?auto_33680 ?auto_33678 ) ( CLEAR ?auto_33680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33681 ?auto_33676 ?auto_33677 ?auto_33678 )
      ( MAKE-3PILE ?auto_33676 ?auto_33677 ?auto_33678 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33682 - BLOCK
      ?auto_33683 - BLOCK
      ?auto_33684 - BLOCK
    )
    :vars
    (
      ?auto_33685 - BLOCK
      ?auto_33687 - BLOCK
      ?auto_33686 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33682 ?auto_33683 ) ) ( not ( = ?auto_33682 ?auto_33684 ) ) ( not ( = ?auto_33683 ?auto_33684 ) ) ( not ( = ?auto_33682 ?auto_33685 ) ) ( not ( = ?auto_33683 ?auto_33685 ) ) ( not ( = ?auto_33684 ?auto_33685 ) ) ( not ( = ?auto_33687 ?auto_33685 ) ) ( not ( = ?auto_33687 ?auto_33684 ) ) ( not ( = ?auto_33687 ?auto_33683 ) ) ( not ( = ?auto_33682 ?auto_33687 ) ) ( ON ?auto_33682 ?auto_33686 ) ( not ( = ?auto_33682 ?auto_33686 ) ) ( not ( = ?auto_33683 ?auto_33686 ) ) ( not ( = ?auto_33684 ?auto_33686 ) ) ( not ( = ?auto_33685 ?auto_33686 ) ) ( not ( = ?auto_33687 ?auto_33686 ) ) ( ON ?auto_33683 ?auto_33682 ) ( ON-TABLE ?auto_33686 ) ( ON ?auto_33684 ?auto_33683 ) ( ON ?auto_33685 ?auto_33684 ) ( CLEAR ?auto_33685 ) ( HOLDING ?auto_33687 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33687 )
      ( MAKE-3PILE ?auto_33682 ?auto_33683 ?auto_33684 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33688 - BLOCK
      ?auto_33689 - BLOCK
      ?auto_33690 - BLOCK
    )
    :vars
    (
      ?auto_33693 - BLOCK
      ?auto_33691 - BLOCK
      ?auto_33692 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33688 ?auto_33689 ) ) ( not ( = ?auto_33688 ?auto_33690 ) ) ( not ( = ?auto_33689 ?auto_33690 ) ) ( not ( = ?auto_33688 ?auto_33693 ) ) ( not ( = ?auto_33689 ?auto_33693 ) ) ( not ( = ?auto_33690 ?auto_33693 ) ) ( not ( = ?auto_33691 ?auto_33693 ) ) ( not ( = ?auto_33691 ?auto_33690 ) ) ( not ( = ?auto_33691 ?auto_33689 ) ) ( not ( = ?auto_33688 ?auto_33691 ) ) ( ON ?auto_33688 ?auto_33692 ) ( not ( = ?auto_33688 ?auto_33692 ) ) ( not ( = ?auto_33689 ?auto_33692 ) ) ( not ( = ?auto_33690 ?auto_33692 ) ) ( not ( = ?auto_33693 ?auto_33692 ) ) ( not ( = ?auto_33691 ?auto_33692 ) ) ( ON ?auto_33689 ?auto_33688 ) ( ON-TABLE ?auto_33692 ) ( ON ?auto_33690 ?auto_33689 ) ( ON ?auto_33693 ?auto_33690 ) ( ON ?auto_33691 ?auto_33693 ) ( CLEAR ?auto_33691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_33692 ?auto_33688 ?auto_33689 ?auto_33690 ?auto_33693 )
      ( MAKE-3PILE ?auto_33688 ?auto_33689 ?auto_33690 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33695 - BLOCK
    )
    :vars
    (
      ?auto_33696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33696 ?auto_33695 ) ( CLEAR ?auto_33696 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33695 ) ( not ( = ?auto_33695 ?auto_33696 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33696 ?auto_33695 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33697 - BLOCK
    )
    :vars
    (
      ?auto_33698 - BLOCK
      ?auto_33699 - BLOCK
      ?auto_33700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33698 ?auto_33697 ) ( CLEAR ?auto_33698 ) ( ON-TABLE ?auto_33697 ) ( not ( = ?auto_33697 ?auto_33698 ) ) ( HOLDING ?auto_33699 ) ( CLEAR ?auto_33700 ) ( not ( = ?auto_33697 ?auto_33699 ) ) ( not ( = ?auto_33697 ?auto_33700 ) ) ( not ( = ?auto_33698 ?auto_33699 ) ) ( not ( = ?auto_33698 ?auto_33700 ) ) ( not ( = ?auto_33699 ?auto_33700 ) ) )
    :subtasks
    ( ( !STACK ?auto_33699 ?auto_33700 )
      ( MAKE-1PILE ?auto_33697 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33701 - BLOCK
    )
    :vars
    (
      ?auto_33703 - BLOCK
      ?auto_33704 - BLOCK
      ?auto_33702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33703 ?auto_33701 ) ( ON-TABLE ?auto_33701 ) ( not ( = ?auto_33701 ?auto_33703 ) ) ( CLEAR ?auto_33704 ) ( not ( = ?auto_33701 ?auto_33702 ) ) ( not ( = ?auto_33701 ?auto_33704 ) ) ( not ( = ?auto_33703 ?auto_33702 ) ) ( not ( = ?auto_33703 ?auto_33704 ) ) ( not ( = ?auto_33702 ?auto_33704 ) ) ( ON ?auto_33702 ?auto_33703 ) ( CLEAR ?auto_33702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33701 ?auto_33703 )
      ( MAKE-1PILE ?auto_33701 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33705 - BLOCK
    )
    :vars
    (
      ?auto_33708 - BLOCK
      ?auto_33706 - BLOCK
      ?auto_33707 - BLOCK
      ?auto_33709 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33708 ?auto_33705 ) ( ON-TABLE ?auto_33705 ) ( not ( = ?auto_33705 ?auto_33708 ) ) ( not ( = ?auto_33705 ?auto_33706 ) ) ( not ( = ?auto_33705 ?auto_33707 ) ) ( not ( = ?auto_33708 ?auto_33706 ) ) ( not ( = ?auto_33708 ?auto_33707 ) ) ( not ( = ?auto_33706 ?auto_33707 ) ) ( ON ?auto_33706 ?auto_33708 ) ( CLEAR ?auto_33706 ) ( HOLDING ?auto_33707 ) ( CLEAR ?auto_33709 ) ( ON-TABLE ?auto_33709 ) ( not ( = ?auto_33709 ?auto_33707 ) ) ( not ( = ?auto_33705 ?auto_33709 ) ) ( not ( = ?auto_33708 ?auto_33709 ) ) ( not ( = ?auto_33706 ?auto_33709 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33709 ?auto_33707 )
      ( MAKE-1PILE ?auto_33705 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33710 - BLOCK
    )
    :vars
    (
      ?auto_33714 - BLOCK
      ?auto_33712 - BLOCK
      ?auto_33713 - BLOCK
      ?auto_33711 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33714 ?auto_33710 ) ( ON-TABLE ?auto_33710 ) ( not ( = ?auto_33710 ?auto_33714 ) ) ( not ( = ?auto_33710 ?auto_33712 ) ) ( not ( = ?auto_33710 ?auto_33713 ) ) ( not ( = ?auto_33714 ?auto_33712 ) ) ( not ( = ?auto_33714 ?auto_33713 ) ) ( not ( = ?auto_33712 ?auto_33713 ) ) ( ON ?auto_33712 ?auto_33714 ) ( CLEAR ?auto_33711 ) ( ON-TABLE ?auto_33711 ) ( not ( = ?auto_33711 ?auto_33713 ) ) ( not ( = ?auto_33710 ?auto_33711 ) ) ( not ( = ?auto_33714 ?auto_33711 ) ) ( not ( = ?auto_33712 ?auto_33711 ) ) ( ON ?auto_33713 ?auto_33712 ) ( CLEAR ?auto_33713 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33710 ?auto_33714 ?auto_33712 )
      ( MAKE-1PILE ?auto_33710 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33715 - BLOCK
    )
    :vars
    (
      ?auto_33718 - BLOCK
      ?auto_33716 - BLOCK
      ?auto_33719 - BLOCK
      ?auto_33717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33718 ?auto_33715 ) ( ON-TABLE ?auto_33715 ) ( not ( = ?auto_33715 ?auto_33718 ) ) ( not ( = ?auto_33715 ?auto_33716 ) ) ( not ( = ?auto_33715 ?auto_33719 ) ) ( not ( = ?auto_33718 ?auto_33716 ) ) ( not ( = ?auto_33718 ?auto_33719 ) ) ( not ( = ?auto_33716 ?auto_33719 ) ) ( ON ?auto_33716 ?auto_33718 ) ( not ( = ?auto_33717 ?auto_33719 ) ) ( not ( = ?auto_33715 ?auto_33717 ) ) ( not ( = ?auto_33718 ?auto_33717 ) ) ( not ( = ?auto_33716 ?auto_33717 ) ) ( ON ?auto_33719 ?auto_33716 ) ( CLEAR ?auto_33719 ) ( HOLDING ?auto_33717 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33717 )
      ( MAKE-1PILE ?auto_33715 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33720 - BLOCK
    )
    :vars
    (
      ?auto_33722 - BLOCK
      ?auto_33724 - BLOCK
      ?auto_33723 - BLOCK
      ?auto_33721 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33722 ?auto_33720 ) ( ON-TABLE ?auto_33720 ) ( not ( = ?auto_33720 ?auto_33722 ) ) ( not ( = ?auto_33720 ?auto_33724 ) ) ( not ( = ?auto_33720 ?auto_33723 ) ) ( not ( = ?auto_33722 ?auto_33724 ) ) ( not ( = ?auto_33722 ?auto_33723 ) ) ( not ( = ?auto_33724 ?auto_33723 ) ) ( ON ?auto_33724 ?auto_33722 ) ( not ( = ?auto_33721 ?auto_33723 ) ) ( not ( = ?auto_33720 ?auto_33721 ) ) ( not ( = ?auto_33722 ?auto_33721 ) ) ( not ( = ?auto_33724 ?auto_33721 ) ) ( ON ?auto_33723 ?auto_33724 ) ( ON ?auto_33721 ?auto_33723 ) ( CLEAR ?auto_33721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33720 ?auto_33722 ?auto_33724 ?auto_33723 )
      ( MAKE-1PILE ?auto_33720 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33725 - BLOCK
    )
    :vars
    (
      ?auto_33726 - BLOCK
      ?auto_33727 - BLOCK
      ?auto_33729 - BLOCK
      ?auto_33728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33726 ?auto_33725 ) ( ON-TABLE ?auto_33725 ) ( not ( = ?auto_33725 ?auto_33726 ) ) ( not ( = ?auto_33725 ?auto_33727 ) ) ( not ( = ?auto_33725 ?auto_33729 ) ) ( not ( = ?auto_33726 ?auto_33727 ) ) ( not ( = ?auto_33726 ?auto_33729 ) ) ( not ( = ?auto_33727 ?auto_33729 ) ) ( ON ?auto_33727 ?auto_33726 ) ( not ( = ?auto_33728 ?auto_33729 ) ) ( not ( = ?auto_33725 ?auto_33728 ) ) ( not ( = ?auto_33726 ?auto_33728 ) ) ( not ( = ?auto_33727 ?auto_33728 ) ) ( ON ?auto_33729 ?auto_33727 ) ( HOLDING ?auto_33728 ) ( CLEAR ?auto_33729 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_33725 ?auto_33726 ?auto_33727 ?auto_33729 ?auto_33728 )
      ( MAKE-1PILE ?auto_33725 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33730 - BLOCK
    )
    :vars
    (
      ?auto_33732 - BLOCK
      ?auto_33734 - BLOCK
      ?auto_33733 - BLOCK
      ?auto_33731 - BLOCK
      ?auto_33735 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33732 ?auto_33730 ) ( ON-TABLE ?auto_33730 ) ( not ( = ?auto_33730 ?auto_33732 ) ) ( not ( = ?auto_33730 ?auto_33734 ) ) ( not ( = ?auto_33730 ?auto_33733 ) ) ( not ( = ?auto_33732 ?auto_33734 ) ) ( not ( = ?auto_33732 ?auto_33733 ) ) ( not ( = ?auto_33734 ?auto_33733 ) ) ( ON ?auto_33734 ?auto_33732 ) ( not ( = ?auto_33731 ?auto_33733 ) ) ( not ( = ?auto_33730 ?auto_33731 ) ) ( not ( = ?auto_33732 ?auto_33731 ) ) ( not ( = ?auto_33734 ?auto_33731 ) ) ( ON ?auto_33733 ?auto_33734 ) ( CLEAR ?auto_33733 ) ( ON ?auto_33731 ?auto_33735 ) ( CLEAR ?auto_33731 ) ( HAND-EMPTY ) ( not ( = ?auto_33730 ?auto_33735 ) ) ( not ( = ?auto_33732 ?auto_33735 ) ) ( not ( = ?auto_33734 ?auto_33735 ) ) ( not ( = ?auto_33733 ?auto_33735 ) ) ( not ( = ?auto_33731 ?auto_33735 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33731 ?auto_33735 )
      ( MAKE-1PILE ?auto_33730 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33736 - BLOCK
    )
    :vars
    (
      ?auto_33739 - BLOCK
      ?auto_33740 - BLOCK
      ?auto_33738 - BLOCK
      ?auto_33741 - BLOCK
      ?auto_33737 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33739 ?auto_33736 ) ( ON-TABLE ?auto_33736 ) ( not ( = ?auto_33736 ?auto_33739 ) ) ( not ( = ?auto_33736 ?auto_33740 ) ) ( not ( = ?auto_33736 ?auto_33738 ) ) ( not ( = ?auto_33739 ?auto_33740 ) ) ( not ( = ?auto_33739 ?auto_33738 ) ) ( not ( = ?auto_33740 ?auto_33738 ) ) ( ON ?auto_33740 ?auto_33739 ) ( not ( = ?auto_33741 ?auto_33738 ) ) ( not ( = ?auto_33736 ?auto_33741 ) ) ( not ( = ?auto_33739 ?auto_33741 ) ) ( not ( = ?auto_33740 ?auto_33741 ) ) ( ON ?auto_33741 ?auto_33737 ) ( CLEAR ?auto_33741 ) ( not ( = ?auto_33736 ?auto_33737 ) ) ( not ( = ?auto_33739 ?auto_33737 ) ) ( not ( = ?auto_33740 ?auto_33737 ) ) ( not ( = ?auto_33738 ?auto_33737 ) ) ( not ( = ?auto_33741 ?auto_33737 ) ) ( HOLDING ?auto_33738 ) ( CLEAR ?auto_33740 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33736 ?auto_33739 ?auto_33740 ?auto_33738 )
      ( MAKE-1PILE ?auto_33736 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33742 - BLOCK
    )
    :vars
    (
      ?auto_33743 - BLOCK
      ?auto_33744 - BLOCK
      ?auto_33745 - BLOCK
      ?auto_33747 - BLOCK
      ?auto_33746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33743 ?auto_33742 ) ( ON-TABLE ?auto_33742 ) ( not ( = ?auto_33742 ?auto_33743 ) ) ( not ( = ?auto_33742 ?auto_33744 ) ) ( not ( = ?auto_33742 ?auto_33745 ) ) ( not ( = ?auto_33743 ?auto_33744 ) ) ( not ( = ?auto_33743 ?auto_33745 ) ) ( not ( = ?auto_33744 ?auto_33745 ) ) ( ON ?auto_33744 ?auto_33743 ) ( not ( = ?auto_33747 ?auto_33745 ) ) ( not ( = ?auto_33742 ?auto_33747 ) ) ( not ( = ?auto_33743 ?auto_33747 ) ) ( not ( = ?auto_33744 ?auto_33747 ) ) ( ON ?auto_33747 ?auto_33746 ) ( not ( = ?auto_33742 ?auto_33746 ) ) ( not ( = ?auto_33743 ?auto_33746 ) ) ( not ( = ?auto_33744 ?auto_33746 ) ) ( not ( = ?auto_33745 ?auto_33746 ) ) ( not ( = ?auto_33747 ?auto_33746 ) ) ( CLEAR ?auto_33744 ) ( ON ?auto_33745 ?auto_33747 ) ( CLEAR ?auto_33745 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33746 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33746 ?auto_33747 )
      ( MAKE-1PILE ?auto_33742 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33748 - BLOCK
    )
    :vars
    (
      ?auto_33749 - BLOCK
      ?auto_33752 - BLOCK
      ?auto_33753 - BLOCK
      ?auto_33750 - BLOCK
      ?auto_33751 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33749 ?auto_33748 ) ( ON-TABLE ?auto_33748 ) ( not ( = ?auto_33748 ?auto_33749 ) ) ( not ( = ?auto_33748 ?auto_33752 ) ) ( not ( = ?auto_33748 ?auto_33753 ) ) ( not ( = ?auto_33749 ?auto_33752 ) ) ( not ( = ?auto_33749 ?auto_33753 ) ) ( not ( = ?auto_33752 ?auto_33753 ) ) ( not ( = ?auto_33750 ?auto_33753 ) ) ( not ( = ?auto_33748 ?auto_33750 ) ) ( not ( = ?auto_33749 ?auto_33750 ) ) ( not ( = ?auto_33752 ?auto_33750 ) ) ( ON ?auto_33750 ?auto_33751 ) ( not ( = ?auto_33748 ?auto_33751 ) ) ( not ( = ?auto_33749 ?auto_33751 ) ) ( not ( = ?auto_33752 ?auto_33751 ) ) ( not ( = ?auto_33753 ?auto_33751 ) ) ( not ( = ?auto_33750 ?auto_33751 ) ) ( ON ?auto_33753 ?auto_33750 ) ( CLEAR ?auto_33753 ) ( ON-TABLE ?auto_33751 ) ( HOLDING ?auto_33752 ) ( CLEAR ?auto_33749 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33748 ?auto_33749 ?auto_33752 )
      ( MAKE-1PILE ?auto_33748 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33754 - BLOCK
    )
    :vars
    (
      ?auto_33757 - BLOCK
      ?auto_33759 - BLOCK
      ?auto_33755 - BLOCK
      ?auto_33756 - BLOCK
      ?auto_33758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33757 ?auto_33754 ) ( ON-TABLE ?auto_33754 ) ( not ( = ?auto_33754 ?auto_33757 ) ) ( not ( = ?auto_33754 ?auto_33759 ) ) ( not ( = ?auto_33754 ?auto_33755 ) ) ( not ( = ?auto_33757 ?auto_33759 ) ) ( not ( = ?auto_33757 ?auto_33755 ) ) ( not ( = ?auto_33759 ?auto_33755 ) ) ( not ( = ?auto_33756 ?auto_33755 ) ) ( not ( = ?auto_33754 ?auto_33756 ) ) ( not ( = ?auto_33757 ?auto_33756 ) ) ( not ( = ?auto_33759 ?auto_33756 ) ) ( ON ?auto_33756 ?auto_33758 ) ( not ( = ?auto_33754 ?auto_33758 ) ) ( not ( = ?auto_33757 ?auto_33758 ) ) ( not ( = ?auto_33759 ?auto_33758 ) ) ( not ( = ?auto_33755 ?auto_33758 ) ) ( not ( = ?auto_33756 ?auto_33758 ) ) ( ON ?auto_33755 ?auto_33756 ) ( ON-TABLE ?auto_33758 ) ( CLEAR ?auto_33757 ) ( ON ?auto_33759 ?auto_33755 ) ( CLEAR ?auto_33759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33758 ?auto_33756 ?auto_33755 )
      ( MAKE-1PILE ?auto_33754 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33772 - BLOCK
    )
    :vars
    (
      ?auto_33775 - BLOCK
      ?auto_33776 - BLOCK
      ?auto_33773 - BLOCK
      ?auto_33777 - BLOCK
      ?auto_33774 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33772 ?auto_33775 ) ) ( not ( = ?auto_33772 ?auto_33776 ) ) ( not ( = ?auto_33772 ?auto_33773 ) ) ( not ( = ?auto_33775 ?auto_33776 ) ) ( not ( = ?auto_33775 ?auto_33773 ) ) ( not ( = ?auto_33776 ?auto_33773 ) ) ( not ( = ?auto_33777 ?auto_33773 ) ) ( not ( = ?auto_33772 ?auto_33777 ) ) ( not ( = ?auto_33775 ?auto_33777 ) ) ( not ( = ?auto_33776 ?auto_33777 ) ) ( ON ?auto_33777 ?auto_33774 ) ( not ( = ?auto_33772 ?auto_33774 ) ) ( not ( = ?auto_33775 ?auto_33774 ) ) ( not ( = ?auto_33776 ?auto_33774 ) ) ( not ( = ?auto_33773 ?auto_33774 ) ) ( not ( = ?auto_33777 ?auto_33774 ) ) ( ON ?auto_33773 ?auto_33777 ) ( ON-TABLE ?auto_33774 ) ( ON ?auto_33776 ?auto_33773 ) ( ON ?auto_33775 ?auto_33776 ) ( CLEAR ?auto_33775 ) ( HOLDING ?auto_33772 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33772 ?auto_33775 )
      ( MAKE-1PILE ?auto_33772 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33778 - BLOCK
    )
    :vars
    (
      ?auto_33783 - BLOCK
      ?auto_33779 - BLOCK
      ?auto_33781 - BLOCK
      ?auto_33780 - BLOCK
      ?auto_33782 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33778 ?auto_33783 ) ) ( not ( = ?auto_33778 ?auto_33779 ) ) ( not ( = ?auto_33778 ?auto_33781 ) ) ( not ( = ?auto_33783 ?auto_33779 ) ) ( not ( = ?auto_33783 ?auto_33781 ) ) ( not ( = ?auto_33779 ?auto_33781 ) ) ( not ( = ?auto_33780 ?auto_33781 ) ) ( not ( = ?auto_33778 ?auto_33780 ) ) ( not ( = ?auto_33783 ?auto_33780 ) ) ( not ( = ?auto_33779 ?auto_33780 ) ) ( ON ?auto_33780 ?auto_33782 ) ( not ( = ?auto_33778 ?auto_33782 ) ) ( not ( = ?auto_33783 ?auto_33782 ) ) ( not ( = ?auto_33779 ?auto_33782 ) ) ( not ( = ?auto_33781 ?auto_33782 ) ) ( not ( = ?auto_33780 ?auto_33782 ) ) ( ON ?auto_33781 ?auto_33780 ) ( ON-TABLE ?auto_33782 ) ( ON ?auto_33779 ?auto_33781 ) ( ON ?auto_33783 ?auto_33779 ) ( ON ?auto_33778 ?auto_33783 ) ( CLEAR ?auto_33778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_33782 ?auto_33780 ?auto_33781 ?auto_33779 ?auto_33783 )
      ( MAKE-1PILE ?auto_33778 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33788 - BLOCK
      ?auto_33789 - BLOCK
      ?auto_33790 - BLOCK
      ?auto_33791 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_33791 ) ( CLEAR ?auto_33790 ) ( ON-TABLE ?auto_33788 ) ( ON ?auto_33789 ?auto_33788 ) ( ON ?auto_33790 ?auto_33789 ) ( not ( = ?auto_33788 ?auto_33789 ) ) ( not ( = ?auto_33788 ?auto_33790 ) ) ( not ( = ?auto_33788 ?auto_33791 ) ) ( not ( = ?auto_33789 ?auto_33790 ) ) ( not ( = ?auto_33789 ?auto_33791 ) ) ( not ( = ?auto_33790 ?auto_33791 ) ) )
    :subtasks
    ( ( !STACK ?auto_33791 ?auto_33790 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33792 - BLOCK
      ?auto_33793 - BLOCK
      ?auto_33794 - BLOCK
      ?auto_33795 - BLOCK
    )
    :vars
    (
      ?auto_33796 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_33794 ) ( ON-TABLE ?auto_33792 ) ( ON ?auto_33793 ?auto_33792 ) ( ON ?auto_33794 ?auto_33793 ) ( not ( = ?auto_33792 ?auto_33793 ) ) ( not ( = ?auto_33792 ?auto_33794 ) ) ( not ( = ?auto_33792 ?auto_33795 ) ) ( not ( = ?auto_33793 ?auto_33794 ) ) ( not ( = ?auto_33793 ?auto_33795 ) ) ( not ( = ?auto_33794 ?auto_33795 ) ) ( ON ?auto_33795 ?auto_33796 ) ( CLEAR ?auto_33795 ) ( HAND-EMPTY ) ( not ( = ?auto_33792 ?auto_33796 ) ) ( not ( = ?auto_33793 ?auto_33796 ) ) ( not ( = ?auto_33794 ?auto_33796 ) ) ( not ( = ?auto_33795 ?auto_33796 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33795 ?auto_33796 )
      ( MAKE-4PILE ?auto_33792 ?auto_33793 ?auto_33794 ?auto_33795 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33797 - BLOCK
      ?auto_33798 - BLOCK
      ?auto_33799 - BLOCK
      ?auto_33800 - BLOCK
    )
    :vars
    (
      ?auto_33801 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33797 ) ( ON ?auto_33798 ?auto_33797 ) ( not ( = ?auto_33797 ?auto_33798 ) ) ( not ( = ?auto_33797 ?auto_33799 ) ) ( not ( = ?auto_33797 ?auto_33800 ) ) ( not ( = ?auto_33798 ?auto_33799 ) ) ( not ( = ?auto_33798 ?auto_33800 ) ) ( not ( = ?auto_33799 ?auto_33800 ) ) ( ON ?auto_33800 ?auto_33801 ) ( CLEAR ?auto_33800 ) ( not ( = ?auto_33797 ?auto_33801 ) ) ( not ( = ?auto_33798 ?auto_33801 ) ) ( not ( = ?auto_33799 ?auto_33801 ) ) ( not ( = ?auto_33800 ?auto_33801 ) ) ( HOLDING ?auto_33799 ) ( CLEAR ?auto_33798 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33797 ?auto_33798 ?auto_33799 )
      ( MAKE-4PILE ?auto_33797 ?auto_33798 ?auto_33799 ?auto_33800 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33802 - BLOCK
      ?auto_33803 - BLOCK
      ?auto_33804 - BLOCK
      ?auto_33805 - BLOCK
    )
    :vars
    (
      ?auto_33806 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33802 ) ( ON ?auto_33803 ?auto_33802 ) ( not ( = ?auto_33802 ?auto_33803 ) ) ( not ( = ?auto_33802 ?auto_33804 ) ) ( not ( = ?auto_33802 ?auto_33805 ) ) ( not ( = ?auto_33803 ?auto_33804 ) ) ( not ( = ?auto_33803 ?auto_33805 ) ) ( not ( = ?auto_33804 ?auto_33805 ) ) ( ON ?auto_33805 ?auto_33806 ) ( not ( = ?auto_33802 ?auto_33806 ) ) ( not ( = ?auto_33803 ?auto_33806 ) ) ( not ( = ?auto_33804 ?auto_33806 ) ) ( not ( = ?auto_33805 ?auto_33806 ) ) ( CLEAR ?auto_33803 ) ( ON ?auto_33804 ?auto_33805 ) ( CLEAR ?auto_33804 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33806 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33806 ?auto_33805 )
      ( MAKE-4PILE ?auto_33802 ?auto_33803 ?auto_33804 ?auto_33805 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33807 - BLOCK
      ?auto_33808 - BLOCK
      ?auto_33809 - BLOCK
      ?auto_33810 - BLOCK
    )
    :vars
    (
      ?auto_33811 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33807 ) ( not ( = ?auto_33807 ?auto_33808 ) ) ( not ( = ?auto_33807 ?auto_33809 ) ) ( not ( = ?auto_33807 ?auto_33810 ) ) ( not ( = ?auto_33808 ?auto_33809 ) ) ( not ( = ?auto_33808 ?auto_33810 ) ) ( not ( = ?auto_33809 ?auto_33810 ) ) ( ON ?auto_33810 ?auto_33811 ) ( not ( = ?auto_33807 ?auto_33811 ) ) ( not ( = ?auto_33808 ?auto_33811 ) ) ( not ( = ?auto_33809 ?auto_33811 ) ) ( not ( = ?auto_33810 ?auto_33811 ) ) ( ON ?auto_33809 ?auto_33810 ) ( CLEAR ?auto_33809 ) ( ON-TABLE ?auto_33811 ) ( HOLDING ?auto_33808 ) ( CLEAR ?auto_33807 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33807 ?auto_33808 )
      ( MAKE-4PILE ?auto_33807 ?auto_33808 ?auto_33809 ?auto_33810 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33812 - BLOCK
      ?auto_33813 - BLOCK
      ?auto_33814 - BLOCK
      ?auto_33815 - BLOCK
    )
    :vars
    (
      ?auto_33816 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33812 ) ( not ( = ?auto_33812 ?auto_33813 ) ) ( not ( = ?auto_33812 ?auto_33814 ) ) ( not ( = ?auto_33812 ?auto_33815 ) ) ( not ( = ?auto_33813 ?auto_33814 ) ) ( not ( = ?auto_33813 ?auto_33815 ) ) ( not ( = ?auto_33814 ?auto_33815 ) ) ( ON ?auto_33815 ?auto_33816 ) ( not ( = ?auto_33812 ?auto_33816 ) ) ( not ( = ?auto_33813 ?auto_33816 ) ) ( not ( = ?auto_33814 ?auto_33816 ) ) ( not ( = ?auto_33815 ?auto_33816 ) ) ( ON ?auto_33814 ?auto_33815 ) ( ON-TABLE ?auto_33816 ) ( CLEAR ?auto_33812 ) ( ON ?auto_33813 ?auto_33814 ) ( CLEAR ?auto_33813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33816 ?auto_33815 ?auto_33814 )
      ( MAKE-4PILE ?auto_33812 ?auto_33813 ?auto_33814 ?auto_33815 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33817 - BLOCK
      ?auto_33818 - BLOCK
      ?auto_33819 - BLOCK
      ?auto_33820 - BLOCK
    )
    :vars
    (
      ?auto_33821 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33817 ?auto_33818 ) ) ( not ( = ?auto_33817 ?auto_33819 ) ) ( not ( = ?auto_33817 ?auto_33820 ) ) ( not ( = ?auto_33818 ?auto_33819 ) ) ( not ( = ?auto_33818 ?auto_33820 ) ) ( not ( = ?auto_33819 ?auto_33820 ) ) ( ON ?auto_33820 ?auto_33821 ) ( not ( = ?auto_33817 ?auto_33821 ) ) ( not ( = ?auto_33818 ?auto_33821 ) ) ( not ( = ?auto_33819 ?auto_33821 ) ) ( not ( = ?auto_33820 ?auto_33821 ) ) ( ON ?auto_33819 ?auto_33820 ) ( ON-TABLE ?auto_33821 ) ( ON ?auto_33818 ?auto_33819 ) ( CLEAR ?auto_33818 ) ( HOLDING ?auto_33817 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33817 )
      ( MAKE-4PILE ?auto_33817 ?auto_33818 ?auto_33819 ?auto_33820 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33822 - BLOCK
      ?auto_33823 - BLOCK
      ?auto_33824 - BLOCK
      ?auto_33825 - BLOCK
    )
    :vars
    (
      ?auto_33826 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33822 ?auto_33823 ) ) ( not ( = ?auto_33822 ?auto_33824 ) ) ( not ( = ?auto_33822 ?auto_33825 ) ) ( not ( = ?auto_33823 ?auto_33824 ) ) ( not ( = ?auto_33823 ?auto_33825 ) ) ( not ( = ?auto_33824 ?auto_33825 ) ) ( ON ?auto_33825 ?auto_33826 ) ( not ( = ?auto_33822 ?auto_33826 ) ) ( not ( = ?auto_33823 ?auto_33826 ) ) ( not ( = ?auto_33824 ?auto_33826 ) ) ( not ( = ?auto_33825 ?auto_33826 ) ) ( ON ?auto_33824 ?auto_33825 ) ( ON-TABLE ?auto_33826 ) ( ON ?auto_33823 ?auto_33824 ) ( ON ?auto_33822 ?auto_33823 ) ( CLEAR ?auto_33822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33826 ?auto_33825 ?auto_33824 ?auto_33823 )
      ( MAKE-4PILE ?auto_33822 ?auto_33823 ?auto_33824 ?auto_33825 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33827 - BLOCK
      ?auto_33828 - BLOCK
      ?auto_33829 - BLOCK
      ?auto_33830 - BLOCK
    )
    :vars
    (
      ?auto_33831 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33827 ?auto_33828 ) ) ( not ( = ?auto_33827 ?auto_33829 ) ) ( not ( = ?auto_33827 ?auto_33830 ) ) ( not ( = ?auto_33828 ?auto_33829 ) ) ( not ( = ?auto_33828 ?auto_33830 ) ) ( not ( = ?auto_33829 ?auto_33830 ) ) ( ON ?auto_33830 ?auto_33831 ) ( not ( = ?auto_33827 ?auto_33831 ) ) ( not ( = ?auto_33828 ?auto_33831 ) ) ( not ( = ?auto_33829 ?auto_33831 ) ) ( not ( = ?auto_33830 ?auto_33831 ) ) ( ON ?auto_33829 ?auto_33830 ) ( ON-TABLE ?auto_33831 ) ( ON ?auto_33828 ?auto_33829 ) ( HOLDING ?auto_33827 ) ( CLEAR ?auto_33828 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_33831 ?auto_33830 ?auto_33829 ?auto_33828 ?auto_33827 )
      ( MAKE-4PILE ?auto_33827 ?auto_33828 ?auto_33829 ?auto_33830 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33832 - BLOCK
      ?auto_33833 - BLOCK
      ?auto_33834 - BLOCK
      ?auto_33835 - BLOCK
    )
    :vars
    (
      ?auto_33836 - BLOCK
      ?auto_33837 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33832 ?auto_33833 ) ) ( not ( = ?auto_33832 ?auto_33834 ) ) ( not ( = ?auto_33832 ?auto_33835 ) ) ( not ( = ?auto_33833 ?auto_33834 ) ) ( not ( = ?auto_33833 ?auto_33835 ) ) ( not ( = ?auto_33834 ?auto_33835 ) ) ( ON ?auto_33835 ?auto_33836 ) ( not ( = ?auto_33832 ?auto_33836 ) ) ( not ( = ?auto_33833 ?auto_33836 ) ) ( not ( = ?auto_33834 ?auto_33836 ) ) ( not ( = ?auto_33835 ?auto_33836 ) ) ( ON ?auto_33834 ?auto_33835 ) ( ON-TABLE ?auto_33836 ) ( ON ?auto_33833 ?auto_33834 ) ( CLEAR ?auto_33833 ) ( ON ?auto_33832 ?auto_33837 ) ( CLEAR ?auto_33832 ) ( HAND-EMPTY ) ( not ( = ?auto_33832 ?auto_33837 ) ) ( not ( = ?auto_33833 ?auto_33837 ) ) ( not ( = ?auto_33834 ?auto_33837 ) ) ( not ( = ?auto_33835 ?auto_33837 ) ) ( not ( = ?auto_33836 ?auto_33837 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33832 ?auto_33837 )
      ( MAKE-4PILE ?auto_33832 ?auto_33833 ?auto_33834 ?auto_33835 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33838 - BLOCK
      ?auto_33839 - BLOCK
      ?auto_33840 - BLOCK
      ?auto_33841 - BLOCK
    )
    :vars
    (
      ?auto_33843 - BLOCK
      ?auto_33842 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33838 ?auto_33839 ) ) ( not ( = ?auto_33838 ?auto_33840 ) ) ( not ( = ?auto_33838 ?auto_33841 ) ) ( not ( = ?auto_33839 ?auto_33840 ) ) ( not ( = ?auto_33839 ?auto_33841 ) ) ( not ( = ?auto_33840 ?auto_33841 ) ) ( ON ?auto_33841 ?auto_33843 ) ( not ( = ?auto_33838 ?auto_33843 ) ) ( not ( = ?auto_33839 ?auto_33843 ) ) ( not ( = ?auto_33840 ?auto_33843 ) ) ( not ( = ?auto_33841 ?auto_33843 ) ) ( ON ?auto_33840 ?auto_33841 ) ( ON-TABLE ?auto_33843 ) ( ON ?auto_33838 ?auto_33842 ) ( CLEAR ?auto_33838 ) ( not ( = ?auto_33838 ?auto_33842 ) ) ( not ( = ?auto_33839 ?auto_33842 ) ) ( not ( = ?auto_33840 ?auto_33842 ) ) ( not ( = ?auto_33841 ?auto_33842 ) ) ( not ( = ?auto_33843 ?auto_33842 ) ) ( HOLDING ?auto_33839 ) ( CLEAR ?auto_33840 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33843 ?auto_33841 ?auto_33840 ?auto_33839 )
      ( MAKE-4PILE ?auto_33838 ?auto_33839 ?auto_33840 ?auto_33841 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33844 - BLOCK
      ?auto_33845 - BLOCK
      ?auto_33846 - BLOCK
      ?auto_33847 - BLOCK
    )
    :vars
    (
      ?auto_33848 - BLOCK
      ?auto_33849 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33844 ?auto_33845 ) ) ( not ( = ?auto_33844 ?auto_33846 ) ) ( not ( = ?auto_33844 ?auto_33847 ) ) ( not ( = ?auto_33845 ?auto_33846 ) ) ( not ( = ?auto_33845 ?auto_33847 ) ) ( not ( = ?auto_33846 ?auto_33847 ) ) ( ON ?auto_33847 ?auto_33848 ) ( not ( = ?auto_33844 ?auto_33848 ) ) ( not ( = ?auto_33845 ?auto_33848 ) ) ( not ( = ?auto_33846 ?auto_33848 ) ) ( not ( = ?auto_33847 ?auto_33848 ) ) ( ON ?auto_33846 ?auto_33847 ) ( ON-TABLE ?auto_33848 ) ( ON ?auto_33844 ?auto_33849 ) ( not ( = ?auto_33844 ?auto_33849 ) ) ( not ( = ?auto_33845 ?auto_33849 ) ) ( not ( = ?auto_33846 ?auto_33849 ) ) ( not ( = ?auto_33847 ?auto_33849 ) ) ( not ( = ?auto_33848 ?auto_33849 ) ) ( CLEAR ?auto_33846 ) ( ON ?auto_33845 ?auto_33844 ) ( CLEAR ?auto_33845 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33849 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33849 ?auto_33844 )
      ( MAKE-4PILE ?auto_33844 ?auto_33845 ?auto_33846 ?auto_33847 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33850 - BLOCK
      ?auto_33851 - BLOCK
      ?auto_33852 - BLOCK
      ?auto_33853 - BLOCK
    )
    :vars
    (
      ?auto_33854 - BLOCK
      ?auto_33855 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33850 ?auto_33851 ) ) ( not ( = ?auto_33850 ?auto_33852 ) ) ( not ( = ?auto_33850 ?auto_33853 ) ) ( not ( = ?auto_33851 ?auto_33852 ) ) ( not ( = ?auto_33851 ?auto_33853 ) ) ( not ( = ?auto_33852 ?auto_33853 ) ) ( ON ?auto_33853 ?auto_33854 ) ( not ( = ?auto_33850 ?auto_33854 ) ) ( not ( = ?auto_33851 ?auto_33854 ) ) ( not ( = ?auto_33852 ?auto_33854 ) ) ( not ( = ?auto_33853 ?auto_33854 ) ) ( ON-TABLE ?auto_33854 ) ( ON ?auto_33850 ?auto_33855 ) ( not ( = ?auto_33850 ?auto_33855 ) ) ( not ( = ?auto_33851 ?auto_33855 ) ) ( not ( = ?auto_33852 ?auto_33855 ) ) ( not ( = ?auto_33853 ?auto_33855 ) ) ( not ( = ?auto_33854 ?auto_33855 ) ) ( ON ?auto_33851 ?auto_33850 ) ( CLEAR ?auto_33851 ) ( ON-TABLE ?auto_33855 ) ( HOLDING ?auto_33852 ) ( CLEAR ?auto_33853 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33854 ?auto_33853 ?auto_33852 )
      ( MAKE-4PILE ?auto_33850 ?auto_33851 ?auto_33852 ?auto_33853 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33856 - BLOCK
      ?auto_33857 - BLOCK
      ?auto_33858 - BLOCK
      ?auto_33859 - BLOCK
    )
    :vars
    (
      ?auto_33861 - BLOCK
      ?auto_33860 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33856 ?auto_33857 ) ) ( not ( = ?auto_33856 ?auto_33858 ) ) ( not ( = ?auto_33856 ?auto_33859 ) ) ( not ( = ?auto_33857 ?auto_33858 ) ) ( not ( = ?auto_33857 ?auto_33859 ) ) ( not ( = ?auto_33858 ?auto_33859 ) ) ( ON ?auto_33859 ?auto_33861 ) ( not ( = ?auto_33856 ?auto_33861 ) ) ( not ( = ?auto_33857 ?auto_33861 ) ) ( not ( = ?auto_33858 ?auto_33861 ) ) ( not ( = ?auto_33859 ?auto_33861 ) ) ( ON-TABLE ?auto_33861 ) ( ON ?auto_33856 ?auto_33860 ) ( not ( = ?auto_33856 ?auto_33860 ) ) ( not ( = ?auto_33857 ?auto_33860 ) ) ( not ( = ?auto_33858 ?auto_33860 ) ) ( not ( = ?auto_33859 ?auto_33860 ) ) ( not ( = ?auto_33861 ?auto_33860 ) ) ( ON ?auto_33857 ?auto_33856 ) ( ON-TABLE ?auto_33860 ) ( CLEAR ?auto_33859 ) ( ON ?auto_33858 ?auto_33857 ) ( CLEAR ?auto_33858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33860 ?auto_33856 ?auto_33857 )
      ( MAKE-4PILE ?auto_33856 ?auto_33857 ?auto_33858 ?auto_33859 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33862 - BLOCK
      ?auto_33863 - BLOCK
      ?auto_33864 - BLOCK
      ?auto_33865 - BLOCK
    )
    :vars
    (
      ?auto_33866 - BLOCK
      ?auto_33867 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33862 ?auto_33863 ) ) ( not ( = ?auto_33862 ?auto_33864 ) ) ( not ( = ?auto_33862 ?auto_33865 ) ) ( not ( = ?auto_33863 ?auto_33864 ) ) ( not ( = ?auto_33863 ?auto_33865 ) ) ( not ( = ?auto_33864 ?auto_33865 ) ) ( not ( = ?auto_33862 ?auto_33866 ) ) ( not ( = ?auto_33863 ?auto_33866 ) ) ( not ( = ?auto_33864 ?auto_33866 ) ) ( not ( = ?auto_33865 ?auto_33866 ) ) ( ON-TABLE ?auto_33866 ) ( ON ?auto_33862 ?auto_33867 ) ( not ( = ?auto_33862 ?auto_33867 ) ) ( not ( = ?auto_33863 ?auto_33867 ) ) ( not ( = ?auto_33864 ?auto_33867 ) ) ( not ( = ?auto_33865 ?auto_33867 ) ) ( not ( = ?auto_33866 ?auto_33867 ) ) ( ON ?auto_33863 ?auto_33862 ) ( ON-TABLE ?auto_33867 ) ( ON ?auto_33864 ?auto_33863 ) ( CLEAR ?auto_33864 ) ( HOLDING ?auto_33865 ) ( CLEAR ?auto_33866 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33866 ?auto_33865 )
      ( MAKE-4PILE ?auto_33862 ?auto_33863 ?auto_33864 ?auto_33865 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33868 - BLOCK
      ?auto_33869 - BLOCK
      ?auto_33870 - BLOCK
      ?auto_33871 - BLOCK
    )
    :vars
    (
      ?auto_33872 - BLOCK
      ?auto_33873 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33868 ?auto_33869 ) ) ( not ( = ?auto_33868 ?auto_33870 ) ) ( not ( = ?auto_33868 ?auto_33871 ) ) ( not ( = ?auto_33869 ?auto_33870 ) ) ( not ( = ?auto_33869 ?auto_33871 ) ) ( not ( = ?auto_33870 ?auto_33871 ) ) ( not ( = ?auto_33868 ?auto_33872 ) ) ( not ( = ?auto_33869 ?auto_33872 ) ) ( not ( = ?auto_33870 ?auto_33872 ) ) ( not ( = ?auto_33871 ?auto_33872 ) ) ( ON-TABLE ?auto_33872 ) ( ON ?auto_33868 ?auto_33873 ) ( not ( = ?auto_33868 ?auto_33873 ) ) ( not ( = ?auto_33869 ?auto_33873 ) ) ( not ( = ?auto_33870 ?auto_33873 ) ) ( not ( = ?auto_33871 ?auto_33873 ) ) ( not ( = ?auto_33872 ?auto_33873 ) ) ( ON ?auto_33869 ?auto_33868 ) ( ON-TABLE ?auto_33873 ) ( ON ?auto_33870 ?auto_33869 ) ( CLEAR ?auto_33872 ) ( ON ?auto_33871 ?auto_33870 ) ( CLEAR ?auto_33871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33873 ?auto_33868 ?auto_33869 ?auto_33870 )
      ( MAKE-4PILE ?auto_33868 ?auto_33869 ?auto_33870 ?auto_33871 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33874 - BLOCK
      ?auto_33875 - BLOCK
      ?auto_33876 - BLOCK
      ?auto_33877 - BLOCK
    )
    :vars
    (
      ?auto_33879 - BLOCK
      ?auto_33878 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33874 ?auto_33875 ) ) ( not ( = ?auto_33874 ?auto_33876 ) ) ( not ( = ?auto_33874 ?auto_33877 ) ) ( not ( = ?auto_33875 ?auto_33876 ) ) ( not ( = ?auto_33875 ?auto_33877 ) ) ( not ( = ?auto_33876 ?auto_33877 ) ) ( not ( = ?auto_33874 ?auto_33879 ) ) ( not ( = ?auto_33875 ?auto_33879 ) ) ( not ( = ?auto_33876 ?auto_33879 ) ) ( not ( = ?auto_33877 ?auto_33879 ) ) ( ON ?auto_33874 ?auto_33878 ) ( not ( = ?auto_33874 ?auto_33878 ) ) ( not ( = ?auto_33875 ?auto_33878 ) ) ( not ( = ?auto_33876 ?auto_33878 ) ) ( not ( = ?auto_33877 ?auto_33878 ) ) ( not ( = ?auto_33879 ?auto_33878 ) ) ( ON ?auto_33875 ?auto_33874 ) ( ON-TABLE ?auto_33878 ) ( ON ?auto_33876 ?auto_33875 ) ( ON ?auto_33877 ?auto_33876 ) ( CLEAR ?auto_33877 ) ( HOLDING ?auto_33879 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33879 )
      ( MAKE-4PILE ?auto_33874 ?auto_33875 ?auto_33876 ?auto_33877 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33880 - BLOCK
      ?auto_33881 - BLOCK
      ?auto_33882 - BLOCK
      ?auto_33883 - BLOCK
    )
    :vars
    (
      ?auto_33885 - BLOCK
      ?auto_33884 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33880 ?auto_33881 ) ) ( not ( = ?auto_33880 ?auto_33882 ) ) ( not ( = ?auto_33880 ?auto_33883 ) ) ( not ( = ?auto_33881 ?auto_33882 ) ) ( not ( = ?auto_33881 ?auto_33883 ) ) ( not ( = ?auto_33882 ?auto_33883 ) ) ( not ( = ?auto_33880 ?auto_33885 ) ) ( not ( = ?auto_33881 ?auto_33885 ) ) ( not ( = ?auto_33882 ?auto_33885 ) ) ( not ( = ?auto_33883 ?auto_33885 ) ) ( ON ?auto_33880 ?auto_33884 ) ( not ( = ?auto_33880 ?auto_33884 ) ) ( not ( = ?auto_33881 ?auto_33884 ) ) ( not ( = ?auto_33882 ?auto_33884 ) ) ( not ( = ?auto_33883 ?auto_33884 ) ) ( not ( = ?auto_33885 ?auto_33884 ) ) ( ON ?auto_33881 ?auto_33880 ) ( ON-TABLE ?auto_33884 ) ( ON ?auto_33882 ?auto_33881 ) ( ON ?auto_33883 ?auto_33882 ) ( ON ?auto_33885 ?auto_33883 ) ( CLEAR ?auto_33885 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_33884 ?auto_33880 ?auto_33881 ?auto_33882 ?auto_33883 )
      ( MAKE-4PILE ?auto_33880 ?auto_33881 ?auto_33882 ?auto_33883 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33891 - BLOCK
      ?auto_33892 - BLOCK
      ?auto_33893 - BLOCK
      ?auto_33894 - BLOCK
      ?auto_33895 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_33895 ) ( CLEAR ?auto_33894 ) ( ON-TABLE ?auto_33891 ) ( ON ?auto_33892 ?auto_33891 ) ( ON ?auto_33893 ?auto_33892 ) ( ON ?auto_33894 ?auto_33893 ) ( not ( = ?auto_33891 ?auto_33892 ) ) ( not ( = ?auto_33891 ?auto_33893 ) ) ( not ( = ?auto_33891 ?auto_33894 ) ) ( not ( = ?auto_33891 ?auto_33895 ) ) ( not ( = ?auto_33892 ?auto_33893 ) ) ( not ( = ?auto_33892 ?auto_33894 ) ) ( not ( = ?auto_33892 ?auto_33895 ) ) ( not ( = ?auto_33893 ?auto_33894 ) ) ( not ( = ?auto_33893 ?auto_33895 ) ) ( not ( = ?auto_33894 ?auto_33895 ) ) )
    :subtasks
    ( ( !STACK ?auto_33895 ?auto_33894 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33896 - BLOCK
      ?auto_33897 - BLOCK
      ?auto_33898 - BLOCK
      ?auto_33899 - BLOCK
      ?auto_33900 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_33899 ) ( ON-TABLE ?auto_33896 ) ( ON ?auto_33897 ?auto_33896 ) ( ON ?auto_33898 ?auto_33897 ) ( ON ?auto_33899 ?auto_33898 ) ( not ( = ?auto_33896 ?auto_33897 ) ) ( not ( = ?auto_33896 ?auto_33898 ) ) ( not ( = ?auto_33896 ?auto_33899 ) ) ( not ( = ?auto_33896 ?auto_33900 ) ) ( not ( = ?auto_33897 ?auto_33898 ) ) ( not ( = ?auto_33897 ?auto_33899 ) ) ( not ( = ?auto_33897 ?auto_33900 ) ) ( not ( = ?auto_33898 ?auto_33899 ) ) ( not ( = ?auto_33898 ?auto_33900 ) ) ( not ( = ?auto_33899 ?auto_33900 ) ) ( ON-TABLE ?auto_33900 ) ( CLEAR ?auto_33900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_33900 )
      ( MAKE-5PILE ?auto_33896 ?auto_33897 ?auto_33898 ?auto_33899 ?auto_33900 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33901 - BLOCK
      ?auto_33902 - BLOCK
      ?auto_33903 - BLOCK
      ?auto_33904 - BLOCK
      ?auto_33905 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33901 ) ( ON ?auto_33902 ?auto_33901 ) ( ON ?auto_33903 ?auto_33902 ) ( not ( = ?auto_33901 ?auto_33902 ) ) ( not ( = ?auto_33901 ?auto_33903 ) ) ( not ( = ?auto_33901 ?auto_33904 ) ) ( not ( = ?auto_33901 ?auto_33905 ) ) ( not ( = ?auto_33902 ?auto_33903 ) ) ( not ( = ?auto_33902 ?auto_33904 ) ) ( not ( = ?auto_33902 ?auto_33905 ) ) ( not ( = ?auto_33903 ?auto_33904 ) ) ( not ( = ?auto_33903 ?auto_33905 ) ) ( not ( = ?auto_33904 ?auto_33905 ) ) ( ON-TABLE ?auto_33905 ) ( CLEAR ?auto_33905 ) ( HOLDING ?auto_33904 ) ( CLEAR ?auto_33903 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33901 ?auto_33902 ?auto_33903 ?auto_33904 )
      ( MAKE-5PILE ?auto_33901 ?auto_33902 ?auto_33903 ?auto_33904 ?auto_33905 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33906 - BLOCK
      ?auto_33907 - BLOCK
      ?auto_33908 - BLOCK
      ?auto_33909 - BLOCK
      ?auto_33910 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33906 ) ( ON ?auto_33907 ?auto_33906 ) ( ON ?auto_33908 ?auto_33907 ) ( not ( = ?auto_33906 ?auto_33907 ) ) ( not ( = ?auto_33906 ?auto_33908 ) ) ( not ( = ?auto_33906 ?auto_33909 ) ) ( not ( = ?auto_33906 ?auto_33910 ) ) ( not ( = ?auto_33907 ?auto_33908 ) ) ( not ( = ?auto_33907 ?auto_33909 ) ) ( not ( = ?auto_33907 ?auto_33910 ) ) ( not ( = ?auto_33908 ?auto_33909 ) ) ( not ( = ?auto_33908 ?auto_33910 ) ) ( not ( = ?auto_33909 ?auto_33910 ) ) ( ON-TABLE ?auto_33910 ) ( CLEAR ?auto_33908 ) ( ON ?auto_33909 ?auto_33910 ) ( CLEAR ?auto_33909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33910 )
      ( MAKE-5PILE ?auto_33906 ?auto_33907 ?auto_33908 ?auto_33909 ?auto_33910 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33911 - BLOCK
      ?auto_33912 - BLOCK
      ?auto_33913 - BLOCK
      ?auto_33914 - BLOCK
      ?auto_33915 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33911 ) ( ON ?auto_33912 ?auto_33911 ) ( not ( = ?auto_33911 ?auto_33912 ) ) ( not ( = ?auto_33911 ?auto_33913 ) ) ( not ( = ?auto_33911 ?auto_33914 ) ) ( not ( = ?auto_33911 ?auto_33915 ) ) ( not ( = ?auto_33912 ?auto_33913 ) ) ( not ( = ?auto_33912 ?auto_33914 ) ) ( not ( = ?auto_33912 ?auto_33915 ) ) ( not ( = ?auto_33913 ?auto_33914 ) ) ( not ( = ?auto_33913 ?auto_33915 ) ) ( not ( = ?auto_33914 ?auto_33915 ) ) ( ON-TABLE ?auto_33915 ) ( ON ?auto_33914 ?auto_33915 ) ( CLEAR ?auto_33914 ) ( HOLDING ?auto_33913 ) ( CLEAR ?auto_33912 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33911 ?auto_33912 ?auto_33913 )
      ( MAKE-5PILE ?auto_33911 ?auto_33912 ?auto_33913 ?auto_33914 ?auto_33915 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33916 - BLOCK
      ?auto_33917 - BLOCK
      ?auto_33918 - BLOCK
      ?auto_33919 - BLOCK
      ?auto_33920 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33916 ) ( ON ?auto_33917 ?auto_33916 ) ( not ( = ?auto_33916 ?auto_33917 ) ) ( not ( = ?auto_33916 ?auto_33918 ) ) ( not ( = ?auto_33916 ?auto_33919 ) ) ( not ( = ?auto_33916 ?auto_33920 ) ) ( not ( = ?auto_33917 ?auto_33918 ) ) ( not ( = ?auto_33917 ?auto_33919 ) ) ( not ( = ?auto_33917 ?auto_33920 ) ) ( not ( = ?auto_33918 ?auto_33919 ) ) ( not ( = ?auto_33918 ?auto_33920 ) ) ( not ( = ?auto_33919 ?auto_33920 ) ) ( ON-TABLE ?auto_33920 ) ( ON ?auto_33919 ?auto_33920 ) ( CLEAR ?auto_33917 ) ( ON ?auto_33918 ?auto_33919 ) ( CLEAR ?auto_33918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33920 ?auto_33919 )
      ( MAKE-5PILE ?auto_33916 ?auto_33917 ?auto_33918 ?auto_33919 ?auto_33920 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33921 - BLOCK
      ?auto_33922 - BLOCK
      ?auto_33923 - BLOCK
      ?auto_33924 - BLOCK
      ?auto_33925 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33921 ) ( not ( = ?auto_33921 ?auto_33922 ) ) ( not ( = ?auto_33921 ?auto_33923 ) ) ( not ( = ?auto_33921 ?auto_33924 ) ) ( not ( = ?auto_33921 ?auto_33925 ) ) ( not ( = ?auto_33922 ?auto_33923 ) ) ( not ( = ?auto_33922 ?auto_33924 ) ) ( not ( = ?auto_33922 ?auto_33925 ) ) ( not ( = ?auto_33923 ?auto_33924 ) ) ( not ( = ?auto_33923 ?auto_33925 ) ) ( not ( = ?auto_33924 ?auto_33925 ) ) ( ON-TABLE ?auto_33925 ) ( ON ?auto_33924 ?auto_33925 ) ( ON ?auto_33923 ?auto_33924 ) ( CLEAR ?auto_33923 ) ( HOLDING ?auto_33922 ) ( CLEAR ?auto_33921 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33921 ?auto_33922 )
      ( MAKE-5PILE ?auto_33921 ?auto_33922 ?auto_33923 ?auto_33924 ?auto_33925 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33926 - BLOCK
      ?auto_33927 - BLOCK
      ?auto_33928 - BLOCK
      ?auto_33929 - BLOCK
      ?auto_33930 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33926 ) ( not ( = ?auto_33926 ?auto_33927 ) ) ( not ( = ?auto_33926 ?auto_33928 ) ) ( not ( = ?auto_33926 ?auto_33929 ) ) ( not ( = ?auto_33926 ?auto_33930 ) ) ( not ( = ?auto_33927 ?auto_33928 ) ) ( not ( = ?auto_33927 ?auto_33929 ) ) ( not ( = ?auto_33927 ?auto_33930 ) ) ( not ( = ?auto_33928 ?auto_33929 ) ) ( not ( = ?auto_33928 ?auto_33930 ) ) ( not ( = ?auto_33929 ?auto_33930 ) ) ( ON-TABLE ?auto_33930 ) ( ON ?auto_33929 ?auto_33930 ) ( ON ?auto_33928 ?auto_33929 ) ( CLEAR ?auto_33926 ) ( ON ?auto_33927 ?auto_33928 ) ( CLEAR ?auto_33927 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33930 ?auto_33929 ?auto_33928 )
      ( MAKE-5PILE ?auto_33926 ?auto_33927 ?auto_33928 ?auto_33929 ?auto_33930 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33931 - BLOCK
      ?auto_33932 - BLOCK
      ?auto_33933 - BLOCK
      ?auto_33934 - BLOCK
      ?auto_33935 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33931 ?auto_33932 ) ) ( not ( = ?auto_33931 ?auto_33933 ) ) ( not ( = ?auto_33931 ?auto_33934 ) ) ( not ( = ?auto_33931 ?auto_33935 ) ) ( not ( = ?auto_33932 ?auto_33933 ) ) ( not ( = ?auto_33932 ?auto_33934 ) ) ( not ( = ?auto_33932 ?auto_33935 ) ) ( not ( = ?auto_33933 ?auto_33934 ) ) ( not ( = ?auto_33933 ?auto_33935 ) ) ( not ( = ?auto_33934 ?auto_33935 ) ) ( ON-TABLE ?auto_33935 ) ( ON ?auto_33934 ?auto_33935 ) ( ON ?auto_33933 ?auto_33934 ) ( ON ?auto_33932 ?auto_33933 ) ( CLEAR ?auto_33932 ) ( HOLDING ?auto_33931 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33931 )
      ( MAKE-5PILE ?auto_33931 ?auto_33932 ?auto_33933 ?auto_33934 ?auto_33935 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33936 - BLOCK
      ?auto_33937 - BLOCK
      ?auto_33938 - BLOCK
      ?auto_33939 - BLOCK
      ?auto_33940 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33936 ?auto_33937 ) ) ( not ( = ?auto_33936 ?auto_33938 ) ) ( not ( = ?auto_33936 ?auto_33939 ) ) ( not ( = ?auto_33936 ?auto_33940 ) ) ( not ( = ?auto_33937 ?auto_33938 ) ) ( not ( = ?auto_33937 ?auto_33939 ) ) ( not ( = ?auto_33937 ?auto_33940 ) ) ( not ( = ?auto_33938 ?auto_33939 ) ) ( not ( = ?auto_33938 ?auto_33940 ) ) ( not ( = ?auto_33939 ?auto_33940 ) ) ( ON-TABLE ?auto_33940 ) ( ON ?auto_33939 ?auto_33940 ) ( ON ?auto_33938 ?auto_33939 ) ( ON ?auto_33937 ?auto_33938 ) ( ON ?auto_33936 ?auto_33937 ) ( CLEAR ?auto_33936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33940 ?auto_33939 ?auto_33938 ?auto_33937 )
      ( MAKE-5PILE ?auto_33936 ?auto_33937 ?auto_33938 ?auto_33939 ?auto_33940 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33941 - BLOCK
      ?auto_33942 - BLOCK
      ?auto_33943 - BLOCK
      ?auto_33944 - BLOCK
      ?auto_33945 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33941 ?auto_33942 ) ) ( not ( = ?auto_33941 ?auto_33943 ) ) ( not ( = ?auto_33941 ?auto_33944 ) ) ( not ( = ?auto_33941 ?auto_33945 ) ) ( not ( = ?auto_33942 ?auto_33943 ) ) ( not ( = ?auto_33942 ?auto_33944 ) ) ( not ( = ?auto_33942 ?auto_33945 ) ) ( not ( = ?auto_33943 ?auto_33944 ) ) ( not ( = ?auto_33943 ?auto_33945 ) ) ( not ( = ?auto_33944 ?auto_33945 ) ) ( ON-TABLE ?auto_33945 ) ( ON ?auto_33944 ?auto_33945 ) ( ON ?auto_33943 ?auto_33944 ) ( ON ?auto_33942 ?auto_33943 ) ( HOLDING ?auto_33941 ) ( CLEAR ?auto_33942 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_33945 ?auto_33944 ?auto_33943 ?auto_33942 ?auto_33941 )
      ( MAKE-5PILE ?auto_33941 ?auto_33942 ?auto_33943 ?auto_33944 ?auto_33945 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33946 - BLOCK
      ?auto_33947 - BLOCK
      ?auto_33948 - BLOCK
      ?auto_33949 - BLOCK
      ?auto_33950 - BLOCK
    )
    :vars
    (
      ?auto_33951 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33946 ?auto_33947 ) ) ( not ( = ?auto_33946 ?auto_33948 ) ) ( not ( = ?auto_33946 ?auto_33949 ) ) ( not ( = ?auto_33946 ?auto_33950 ) ) ( not ( = ?auto_33947 ?auto_33948 ) ) ( not ( = ?auto_33947 ?auto_33949 ) ) ( not ( = ?auto_33947 ?auto_33950 ) ) ( not ( = ?auto_33948 ?auto_33949 ) ) ( not ( = ?auto_33948 ?auto_33950 ) ) ( not ( = ?auto_33949 ?auto_33950 ) ) ( ON-TABLE ?auto_33950 ) ( ON ?auto_33949 ?auto_33950 ) ( ON ?auto_33948 ?auto_33949 ) ( ON ?auto_33947 ?auto_33948 ) ( CLEAR ?auto_33947 ) ( ON ?auto_33946 ?auto_33951 ) ( CLEAR ?auto_33946 ) ( HAND-EMPTY ) ( not ( = ?auto_33946 ?auto_33951 ) ) ( not ( = ?auto_33947 ?auto_33951 ) ) ( not ( = ?auto_33948 ?auto_33951 ) ) ( not ( = ?auto_33949 ?auto_33951 ) ) ( not ( = ?auto_33950 ?auto_33951 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33946 ?auto_33951 )
      ( MAKE-5PILE ?auto_33946 ?auto_33947 ?auto_33948 ?auto_33949 ?auto_33950 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33952 - BLOCK
      ?auto_33953 - BLOCK
      ?auto_33954 - BLOCK
      ?auto_33955 - BLOCK
      ?auto_33956 - BLOCK
    )
    :vars
    (
      ?auto_33957 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33952 ?auto_33953 ) ) ( not ( = ?auto_33952 ?auto_33954 ) ) ( not ( = ?auto_33952 ?auto_33955 ) ) ( not ( = ?auto_33952 ?auto_33956 ) ) ( not ( = ?auto_33953 ?auto_33954 ) ) ( not ( = ?auto_33953 ?auto_33955 ) ) ( not ( = ?auto_33953 ?auto_33956 ) ) ( not ( = ?auto_33954 ?auto_33955 ) ) ( not ( = ?auto_33954 ?auto_33956 ) ) ( not ( = ?auto_33955 ?auto_33956 ) ) ( ON-TABLE ?auto_33956 ) ( ON ?auto_33955 ?auto_33956 ) ( ON ?auto_33954 ?auto_33955 ) ( ON ?auto_33952 ?auto_33957 ) ( CLEAR ?auto_33952 ) ( not ( = ?auto_33952 ?auto_33957 ) ) ( not ( = ?auto_33953 ?auto_33957 ) ) ( not ( = ?auto_33954 ?auto_33957 ) ) ( not ( = ?auto_33955 ?auto_33957 ) ) ( not ( = ?auto_33956 ?auto_33957 ) ) ( HOLDING ?auto_33953 ) ( CLEAR ?auto_33954 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33956 ?auto_33955 ?auto_33954 ?auto_33953 )
      ( MAKE-5PILE ?auto_33952 ?auto_33953 ?auto_33954 ?auto_33955 ?auto_33956 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33958 - BLOCK
      ?auto_33959 - BLOCK
      ?auto_33960 - BLOCK
      ?auto_33961 - BLOCK
      ?auto_33962 - BLOCK
    )
    :vars
    (
      ?auto_33963 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33958 ?auto_33959 ) ) ( not ( = ?auto_33958 ?auto_33960 ) ) ( not ( = ?auto_33958 ?auto_33961 ) ) ( not ( = ?auto_33958 ?auto_33962 ) ) ( not ( = ?auto_33959 ?auto_33960 ) ) ( not ( = ?auto_33959 ?auto_33961 ) ) ( not ( = ?auto_33959 ?auto_33962 ) ) ( not ( = ?auto_33960 ?auto_33961 ) ) ( not ( = ?auto_33960 ?auto_33962 ) ) ( not ( = ?auto_33961 ?auto_33962 ) ) ( ON-TABLE ?auto_33962 ) ( ON ?auto_33961 ?auto_33962 ) ( ON ?auto_33960 ?auto_33961 ) ( ON ?auto_33958 ?auto_33963 ) ( not ( = ?auto_33958 ?auto_33963 ) ) ( not ( = ?auto_33959 ?auto_33963 ) ) ( not ( = ?auto_33960 ?auto_33963 ) ) ( not ( = ?auto_33961 ?auto_33963 ) ) ( not ( = ?auto_33962 ?auto_33963 ) ) ( CLEAR ?auto_33960 ) ( ON ?auto_33959 ?auto_33958 ) ( CLEAR ?auto_33959 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33963 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33963 ?auto_33958 )
      ( MAKE-5PILE ?auto_33958 ?auto_33959 ?auto_33960 ?auto_33961 ?auto_33962 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33964 - BLOCK
      ?auto_33965 - BLOCK
      ?auto_33966 - BLOCK
      ?auto_33967 - BLOCK
      ?auto_33968 - BLOCK
    )
    :vars
    (
      ?auto_33969 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33964 ?auto_33965 ) ) ( not ( = ?auto_33964 ?auto_33966 ) ) ( not ( = ?auto_33964 ?auto_33967 ) ) ( not ( = ?auto_33964 ?auto_33968 ) ) ( not ( = ?auto_33965 ?auto_33966 ) ) ( not ( = ?auto_33965 ?auto_33967 ) ) ( not ( = ?auto_33965 ?auto_33968 ) ) ( not ( = ?auto_33966 ?auto_33967 ) ) ( not ( = ?auto_33966 ?auto_33968 ) ) ( not ( = ?auto_33967 ?auto_33968 ) ) ( ON-TABLE ?auto_33968 ) ( ON ?auto_33967 ?auto_33968 ) ( ON ?auto_33964 ?auto_33969 ) ( not ( = ?auto_33964 ?auto_33969 ) ) ( not ( = ?auto_33965 ?auto_33969 ) ) ( not ( = ?auto_33966 ?auto_33969 ) ) ( not ( = ?auto_33967 ?auto_33969 ) ) ( not ( = ?auto_33968 ?auto_33969 ) ) ( ON ?auto_33965 ?auto_33964 ) ( CLEAR ?auto_33965 ) ( ON-TABLE ?auto_33969 ) ( HOLDING ?auto_33966 ) ( CLEAR ?auto_33967 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33968 ?auto_33967 ?auto_33966 )
      ( MAKE-5PILE ?auto_33964 ?auto_33965 ?auto_33966 ?auto_33967 ?auto_33968 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33970 - BLOCK
      ?auto_33971 - BLOCK
      ?auto_33972 - BLOCK
      ?auto_33973 - BLOCK
      ?auto_33974 - BLOCK
    )
    :vars
    (
      ?auto_33975 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33970 ?auto_33971 ) ) ( not ( = ?auto_33970 ?auto_33972 ) ) ( not ( = ?auto_33970 ?auto_33973 ) ) ( not ( = ?auto_33970 ?auto_33974 ) ) ( not ( = ?auto_33971 ?auto_33972 ) ) ( not ( = ?auto_33971 ?auto_33973 ) ) ( not ( = ?auto_33971 ?auto_33974 ) ) ( not ( = ?auto_33972 ?auto_33973 ) ) ( not ( = ?auto_33972 ?auto_33974 ) ) ( not ( = ?auto_33973 ?auto_33974 ) ) ( ON-TABLE ?auto_33974 ) ( ON ?auto_33973 ?auto_33974 ) ( ON ?auto_33970 ?auto_33975 ) ( not ( = ?auto_33970 ?auto_33975 ) ) ( not ( = ?auto_33971 ?auto_33975 ) ) ( not ( = ?auto_33972 ?auto_33975 ) ) ( not ( = ?auto_33973 ?auto_33975 ) ) ( not ( = ?auto_33974 ?auto_33975 ) ) ( ON ?auto_33971 ?auto_33970 ) ( ON-TABLE ?auto_33975 ) ( CLEAR ?auto_33973 ) ( ON ?auto_33972 ?auto_33971 ) ( CLEAR ?auto_33972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33975 ?auto_33970 ?auto_33971 )
      ( MAKE-5PILE ?auto_33970 ?auto_33971 ?auto_33972 ?auto_33973 ?auto_33974 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33976 - BLOCK
      ?auto_33977 - BLOCK
      ?auto_33978 - BLOCK
      ?auto_33979 - BLOCK
      ?auto_33980 - BLOCK
    )
    :vars
    (
      ?auto_33981 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33976 ?auto_33977 ) ) ( not ( = ?auto_33976 ?auto_33978 ) ) ( not ( = ?auto_33976 ?auto_33979 ) ) ( not ( = ?auto_33976 ?auto_33980 ) ) ( not ( = ?auto_33977 ?auto_33978 ) ) ( not ( = ?auto_33977 ?auto_33979 ) ) ( not ( = ?auto_33977 ?auto_33980 ) ) ( not ( = ?auto_33978 ?auto_33979 ) ) ( not ( = ?auto_33978 ?auto_33980 ) ) ( not ( = ?auto_33979 ?auto_33980 ) ) ( ON-TABLE ?auto_33980 ) ( ON ?auto_33976 ?auto_33981 ) ( not ( = ?auto_33976 ?auto_33981 ) ) ( not ( = ?auto_33977 ?auto_33981 ) ) ( not ( = ?auto_33978 ?auto_33981 ) ) ( not ( = ?auto_33979 ?auto_33981 ) ) ( not ( = ?auto_33980 ?auto_33981 ) ) ( ON ?auto_33977 ?auto_33976 ) ( ON-TABLE ?auto_33981 ) ( ON ?auto_33978 ?auto_33977 ) ( CLEAR ?auto_33978 ) ( HOLDING ?auto_33979 ) ( CLEAR ?auto_33980 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33980 ?auto_33979 )
      ( MAKE-5PILE ?auto_33976 ?auto_33977 ?auto_33978 ?auto_33979 ?auto_33980 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33982 - BLOCK
      ?auto_33983 - BLOCK
      ?auto_33984 - BLOCK
      ?auto_33985 - BLOCK
      ?auto_33986 - BLOCK
    )
    :vars
    (
      ?auto_33987 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33982 ?auto_33983 ) ) ( not ( = ?auto_33982 ?auto_33984 ) ) ( not ( = ?auto_33982 ?auto_33985 ) ) ( not ( = ?auto_33982 ?auto_33986 ) ) ( not ( = ?auto_33983 ?auto_33984 ) ) ( not ( = ?auto_33983 ?auto_33985 ) ) ( not ( = ?auto_33983 ?auto_33986 ) ) ( not ( = ?auto_33984 ?auto_33985 ) ) ( not ( = ?auto_33984 ?auto_33986 ) ) ( not ( = ?auto_33985 ?auto_33986 ) ) ( ON-TABLE ?auto_33986 ) ( ON ?auto_33982 ?auto_33987 ) ( not ( = ?auto_33982 ?auto_33987 ) ) ( not ( = ?auto_33983 ?auto_33987 ) ) ( not ( = ?auto_33984 ?auto_33987 ) ) ( not ( = ?auto_33985 ?auto_33987 ) ) ( not ( = ?auto_33986 ?auto_33987 ) ) ( ON ?auto_33983 ?auto_33982 ) ( ON-TABLE ?auto_33987 ) ( ON ?auto_33984 ?auto_33983 ) ( CLEAR ?auto_33986 ) ( ON ?auto_33985 ?auto_33984 ) ( CLEAR ?auto_33985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33987 ?auto_33982 ?auto_33983 ?auto_33984 )
      ( MAKE-5PILE ?auto_33982 ?auto_33983 ?auto_33984 ?auto_33985 ?auto_33986 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33988 - BLOCK
      ?auto_33989 - BLOCK
      ?auto_33990 - BLOCK
      ?auto_33991 - BLOCK
      ?auto_33992 - BLOCK
    )
    :vars
    (
      ?auto_33993 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33988 ?auto_33989 ) ) ( not ( = ?auto_33988 ?auto_33990 ) ) ( not ( = ?auto_33988 ?auto_33991 ) ) ( not ( = ?auto_33988 ?auto_33992 ) ) ( not ( = ?auto_33989 ?auto_33990 ) ) ( not ( = ?auto_33989 ?auto_33991 ) ) ( not ( = ?auto_33989 ?auto_33992 ) ) ( not ( = ?auto_33990 ?auto_33991 ) ) ( not ( = ?auto_33990 ?auto_33992 ) ) ( not ( = ?auto_33991 ?auto_33992 ) ) ( ON ?auto_33988 ?auto_33993 ) ( not ( = ?auto_33988 ?auto_33993 ) ) ( not ( = ?auto_33989 ?auto_33993 ) ) ( not ( = ?auto_33990 ?auto_33993 ) ) ( not ( = ?auto_33991 ?auto_33993 ) ) ( not ( = ?auto_33992 ?auto_33993 ) ) ( ON ?auto_33989 ?auto_33988 ) ( ON-TABLE ?auto_33993 ) ( ON ?auto_33990 ?auto_33989 ) ( ON ?auto_33991 ?auto_33990 ) ( CLEAR ?auto_33991 ) ( HOLDING ?auto_33992 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33992 )
      ( MAKE-5PILE ?auto_33988 ?auto_33989 ?auto_33990 ?auto_33991 ?auto_33992 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33994 - BLOCK
      ?auto_33995 - BLOCK
      ?auto_33996 - BLOCK
      ?auto_33997 - BLOCK
      ?auto_33998 - BLOCK
    )
    :vars
    (
      ?auto_33999 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33994 ?auto_33995 ) ) ( not ( = ?auto_33994 ?auto_33996 ) ) ( not ( = ?auto_33994 ?auto_33997 ) ) ( not ( = ?auto_33994 ?auto_33998 ) ) ( not ( = ?auto_33995 ?auto_33996 ) ) ( not ( = ?auto_33995 ?auto_33997 ) ) ( not ( = ?auto_33995 ?auto_33998 ) ) ( not ( = ?auto_33996 ?auto_33997 ) ) ( not ( = ?auto_33996 ?auto_33998 ) ) ( not ( = ?auto_33997 ?auto_33998 ) ) ( ON ?auto_33994 ?auto_33999 ) ( not ( = ?auto_33994 ?auto_33999 ) ) ( not ( = ?auto_33995 ?auto_33999 ) ) ( not ( = ?auto_33996 ?auto_33999 ) ) ( not ( = ?auto_33997 ?auto_33999 ) ) ( not ( = ?auto_33998 ?auto_33999 ) ) ( ON ?auto_33995 ?auto_33994 ) ( ON-TABLE ?auto_33999 ) ( ON ?auto_33996 ?auto_33995 ) ( ON ?auto_33997 ?auto_33996 ) ( ON ?auto_33998 ?auto_33997 ) ( CLEAR ?auto_33998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_33999 ?auto_33994 ?auto_33995 ?auto_33996 ?auto_33997 )
      ( MAKE-5PILE ?auto_33994 ?auto_33995 ?auto_33996 ?auto_33997 ?auto_33998 ) )
  )

)

