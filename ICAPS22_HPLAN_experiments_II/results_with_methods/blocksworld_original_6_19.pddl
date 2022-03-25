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
      ?auto_73927 - BLOCK
      ?auto_73928 - BLOCK
      ?auto_73929 - BLOCK
      ?auto_73930 - BLOCK
      ?auto_73931 - BLOCK
      ?auto_73932 - BLOCK
    )
    :vars
    (
      ?auto_73933 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73933 ?auto_73932 ) ( CLEAR ?auto_73933 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_73927 ) ( ON ?auto_73928 ?auto_73927 ) ( ON ?auto_73929 ?auto_73928 ) ( ON ?auto_73930 ?auto_73929 ) ( ON ?auto_73931 ?auto_73930 ) ( ON ?auto_73932 ?auto_73931 ) ( not ( = ?auto_73927 ?auto_73928 ) ) ( not ( = ?auto_73927 ?auto_73929 ) ) ( not ( = ?auto_73927 ?auto_73930 ) ) ( not ( = ?auto_73927 ?auto_73931 ) ) ( not ( = ?auto_73927 ?auto_73932 ) ) ( not ( = ?auto_73927 ?auto_73933 ) ) ( not ( = ?auto_73928 ?auto_73929 ) ) ( not ( = ?auto_73928 ?auto_73930 ) ) ( not ( = ?auto_73928 ?auto_73931 ) ) ( not ( = ?auto_73928 ?auto_73932 ) ) ( not ( = ?auto_73928 ?auto_73933 ) ) ( not ( = ?auto_73929 ?auto_73930 ) ) ( not ( = ?auto_73929 ?auto_73931 ) ) ( not ( = ?auto_73929 ?auto_73932 ) ) ( not ( = ?auto_73929 ?auto_73933 ) ) ( not ( = ?auto_73930 ?auto_73931 ) ) ( not ( = ?auto_73930 ?auto_73932 ) ) ( not ( = ?auto_73930 ?auto_73933 ) ) ( not ( = ?auto_73931 ?auto_73932 ) ) ( not ( = ?auto_73931 ?auto_73933 ) ) ( not ( = ?auto_73932 ?auto_73933 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_73933 ?auto_73932 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_73935 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_73935 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_73935 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_73936 - BLOCK
    )
    :vars
    (
      ?auto_73937 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73936 ?auto_73937 ) ( CLEAR ?auto_73936 ) ( HAND-EMPTY ) ( not ( = ?auto_73936 ?auto_73937 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_73936 ?auto_73937 )
      ( MAKE-1PILE ?auto_73936 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73943 - BLOCK
      ?auto_73944 - BLOCK
      ?auto_73945 - BLOCK
      ?auto_73946 - BLOCK
      ?auto_73947 - BLOCK
    )
    :vars
    (
      ?auto_73948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73948 ?auto_73947 ) ( CLEAR ?auto_73948 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_73943 ) ( ON ?auto_73944 ?auto_73943 ) ( ON ?auto_73945 ?auto_73944 ) ( ON ?auto_73946 ?auto_73945 ) ( ON ?auto_73947 ?auto_73946 ) ( not ( = ?auto_73943 ?auto_73944 ) ) ( not ( = ?auto_73943 ?auto_73945 ) ) ( not ( = ?auto_73943 ?auto_73946 ) ) ( not ( = ?auto_73943 ?auto_73947 ) ) ( not ( = ?auto_73943 ?auto_73948 ) ) ( not ( = ?auto_73944 ?auto_73945 ) ) ( not ( = ?auto_73944 ?auto_73946 ) ) ( not ( = ?auto_73944 ?auto_73947 ) ) ( not ( = ?auto_73944 ?auto_73948 ) ) ( not ( = ?auto_73945 ?auto_73946 ) ) ( not ( = ?auto_73945 ?auto_73947 ) ) ( not ( = ?auto_73945 ?auto_73948 ) ) ( not ( = ?auto_73946 ?auto_73947 ) ) ( not ( = ?auto_73946 ?auto_73948 ) ) ( not ( = ?auto_73947 ?auto_73948 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_73948 ?auto_73947 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73949 - BLOCK
      ?auto_73950 - BLOCK
      ?auto_73951 - BLOCK
      ?auto_73952 - BLOCK
      ?auto_73953 - BLOCK
    )
    :vars
    (
      ?auto_73954 - BLOCK
      ?auto_73955 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73954 ?auto_73953 ) ( CLEAR ?auto_73954 ) ( ON-TABLE ?auto_73949 ) ( ON ?auto_73950 ?auto_73949 ) ( ON ?auto_73951 ?auto_73950 ) ( ON ?auto_73952 ?auto_73951 ) ( ON ?auto_73953 ?auto_73952 ) ( not ( = ?auto_73949 ?auto_73950 ) ) ( not ( = ?auto_73949 ?auto_73951 ) ) ( not ( = ?auto_73949 ?auto_73952 ) ) ( not ( = ?auto_73949 ?auto_73953 ) ) ( not ( = ?auto_73949 ?auto_73954 ) ) ( not ( = ?auto_73950 ?auto_73951 ) ) ( not ( = ?auto_73950 ?auto_73952 ) ) ( not ( = ?auto_73950 ?auto_73953 ) ) ( not ( = ?auto_73950 ?auto_73954 ) ) ( not ( = ?auto_73951 ?auto_73952 ) ) ( not ( = ?auto_73951 ?auto_73953 ) ) ( not ( = ?auto_73951 ?auto_73954 ) ) ( not ( = ?auto_73952 ?auto_73953 ) ) ( not ( = ?auto_73952 ?auto_73954 ) ) ( not ( = ?auto_73953 ?auto_73954 ) ) ( HOLDING ?auto_73955 ) ( not ( = ?auto_73949 ?auto_73955 ) ) ( not ( = ?auto_73950 ?auto_73955 ) ) ( not ( = ?auto_73951 ?auto_73955 ) ) ( not ( = ?auto_73952 ?auto_73955 ) ) ( not ( = ?auto_73953 ?auto_73955 ) ) ( not ( = ?auto_73954 ?auto_73955 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_73955 )
      ( MAKE-5PILE ?auto_73949 ?auto_73950 ?auto_73951 ?auto_73952 ?auto_73953 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73956 - BLOCK
      ?auto_73957 - BLOCK
      ?auto_73958 - BLOCK
      ?auto_73959 - BLOCK
      ?auto_73960 - BLOCK
    )
    :vars
    (
      ?auto_73962 - BLOCK
      ?auto_73961 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73962 ?auto_73960 ) ( ON-TABLE ?auto_73956 ) ( ON ?auto_73957 ?auto_73956 ) ( ON ?auto_73958 ?auto_73957 ) ( ON ?auto_73959 ?auto_73958 ) ( ON ?auto_73960 ?auto_73959 ) ( not ( = ?auto_73956 ?auto_73957 ) ) ( not ( = ?auto_73956 ?auto_73958 ) ) ( not ( = ?auto_73956 ?auto_73959 ) ) ( not ( = ?auto_73956 ?auto_73960 ) ) ( not ( = ?auto_73956 ?auto_73962 ) ) ( not ( = ?auto_73957 ?auto_73958 ) ) ( not ( = ?auto_73957 ?auto_73959 ) ) ( not ( = ?auto_73957 ?auto_73960 ) ) ( not ( = ?auto_73957 ?auto_73962 ) ) ( not ( = ?auto_73958 ?auto_73959 ) ) ( not ( = ?auto_73958 ?auto_73960 ) ) ( not ( = ?auto_73958 ?auto_73962 ) ) ( not ( = ?auto_73959 ?auto_73960 ) ) ( not ( = ?auto_73959 ?auto_73962 ) ) ( not ( = ?auto_73960 ?auto_73962 ) ) ( not ( = ?auto_73956 ?auto_73961 ) ) ( not ( = ?auto_73957 ?auto_73961 ) ) ( not ( = ?auto_73958 ?auto_73961 ) ) ( not ( = ?auto_73959 ?auto_73961 ) ) ( not ( = ?auto_73960 ?auto_73961 ) ) ( not ( = ?auto_73962 ?auto_73961 ) ) ( ON ?auto_73961 ?auto_73962 ) ( CLEAR ?auto_73961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_73956 ?auto_73957 ?auto_73958 ?auto_73959 ?auto_73960 ?auto_73962 )
      ( MAKE-5PILE ?auto_73956 ?auto_73957 ?auto_73958 ?auto_73959 ?auto_73960 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_73965 - BLOCK
      ?auto_73966 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_73966 ) ( CLEAR ?auto_73965 ) ( ON-TABLE ?auto_73965 ) ( not ( = ?auto_73965 ?auto_73966 ) ) )
    :subtasks
    ( ( !STACK ?auto_73966 ?auto_73965 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_73967 - BLOCK
      ?auto_73968 - BLOCK
    )
    :vars
    (
      ?auto_73969 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_73967 ) ( ON-TABLE ?auto_73967 ) ( not ( = ?auto_73967 ?auto_73968 ) ) ( ON ?auto_73968 ?auto_73969 ) ( CLEAR ?auto_73968 ) ( HAND-EMPTY ) ( not ( = ?auto_73967 ?auto_73969 ) ) ( not ( = ?auto_73968 ?auto_73969 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_73968 ?auto_73969 )
      ( MAKE-2PILE ?auto_73967 ?auto_73968 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_73970 - BLOCK
      ?auto_73971 - BLOCK
    )
    :vars
    (
      ?auto_73972 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73970 ?auto_73971 ) ) ( ON ?auto_73971 ?auto_73972 ) ( CLEAR ?auto_73971 ) ( not ( = ?auto_73970 ?auto_73972 ) ) ( not ( = ?auto_73971 ?auto_73972 ) ) ( HOLDING ?auto_73970 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_73970 )
      ( MAKE-2PILE ?auto_73970 ?auto_73971 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_73973 - BLOCK
      ?auto_73974 - BLOCK
    )
    :vars
    (
      ?auto_73975 - BLOCK
      ?auto_73979 - BLOCK
      ?auto_73977 - BLOCK
      ?auto_73978 - BLOCK
      ?auto_73976 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73973 ?auto_73974 ) ) ( ON ?auto_73974 ?auto_73975 ) ( not ( = ?auto_73973 ?auto_73975 ) ) ( not ( = ?auto_73974 ?auto_73975 ) ) ( ON ?auto_73973 ?auto_73974 ) ( CLEAR ?auto_73973 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_73979 ) ( ON ?auto_73977 ?auto_73979 ) ( ON ?auto_73978 ?auto_73977 ) ( ON ?auto_73976 ?auto_73978 ) ( ON ?auto_73975 ?auto_73976 ) ( not ( = ?auto_73979 ?auto_73977 ) ) ( not ( = ?auto_73979 ?auto_73978 ) ) ( not ( = ?auto_73979 ?auto_73976 ) ) ( not ( = ?auto_73979 ?auto_73975 ) ) ( not ( = ?auto_73979 ?auto_73974 ) ) ( not ( = ?auto_73979 ?auto_73973 ) ) ( not ( = ?auto_73977 ?auto_73978 ) ) ( not ( = ?auto_73977 ?auto_73976 ) ) ( not ( = ?auto_73977 ?auto_73975 ) ) ( not ( = ?auto_73977 ?auto_73974 ) ) ( not ( = ?auto_73977 ?auto_73973 ) ) ( not ( = ?auto_73978 ?auto_73976 ) ) ( not ( = ?auto_73978 ?auto_73975 ) ) ( not ( = ?auto_73978 ?auto_73974 ) ) ( not ( = ?auto_73978 ?auto_73973 ) ) ( not ( = ?auto_73976 ?auto_73975 ) ) ( not ( = ?auto_73976 ?auto_73974 ) ) ( not ( = ?auto_73976 ?auto_73973 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_73979 ?auto_73977 ?auto_73978 ?auto_73976 ?auto_73975 ?auto_73974 )
      ( MAKE-2PILE ?auto_73973 ?auto_73974 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73984 - BLOCK
      ?auto_73985 - BLOCK
      ?auto_73986 - BLOCK
      ?auto_73987 - BLOCK
    )
    :vars
    (
      ?auto_73988 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73988 ?auto_73987 ) ( CLEAR ?auto_73988 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_73984 ) ( ON ?auto_73985 ?auto_73984 ) ( ON ?auto_73986 ?auto_73985 ) ( ON ?auto_73987 ?auto_73986 ) ( not ( = ?auto_73984 ?auto_73985 ) ) ( not ( = ?auto_73984 ?auto_73986 ) ) ( not ( = ?auto_73984 ?auto_73987 ) ) ( not ( = ?auto_73984 ?auto_73988 ) ) ( not ( = ?auto_73985 ?auto_73986 ) ) ( not ( = ?auto_73985 ?auto_73987 ) ) ( not ( = ?auto_73985 ?auto_73988 ) ) ( not ( = ?auto_73986 ?auto_73987 ) ) ( not ( = ?auto_73986 ?auto_73988 ) ) ( not ( = ?auto_73987 ?auto_73988 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_73988 ?auto_73987 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73989 - BLOCK
      ?auto_73990 - BLOCK
      ?auto_73991 - BLOCK
      ?auto_73992 - BLOCK
    )
    :vars
    (
      ?auto_73993 - BLOCK
      ?auto_73994 - BLOCK
      ?auto_73995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73993 ?auto_73992 ) ( CLEAR ?auto_73993 ) ( ON-TABLE ?auto_73989 ) ( ON ?auto_73990 ?auto_73989 ) ( ON ?auto_73991 ?auto_73990 ) ( ON ?auto_73992 ?auto_73991 ) ( not ( = ?auto_73989 ?auto_73990 ) ) ( not ( = ?auto_73989 ?auto_73991 ) ) ( not ( = ?auto_73989 ?auto_73992 ) ) ( not ( = ?auto_73989 ?auto_73993 ) ) ( not ( = ?auto_73990 ?auto_73991 ) ) ( not ( = ?auto_73990 ?auto_73992 ) ) ( not ( = ?auto_73990 ?auto_73993 ) ) ( not ( = ?auto_73991 ?auto_73992 ) ) ( not ( = ?auto_73991 ?auto_73993 ) ) ( not ( = ?auto_73992 ?auto_73993 ) ) ( HOLDING ?auto_73994 ) ( CLEAR ?auto_73995 ) ( not ( = ?auto_73989 ?auto_73994 ) ) ( not ( = ?auto_73989 ?auto_73995 ) ) ( not ( = ?auto_73990 ?auto_73994 ) ) ( not ( = ?auto_73990 ?auto_73995 ) ) ( not ( = ?auto_73991 ?auto_73994 ) ) ( not ( = ?auto_73991 ?auto_73995 ) ) ( not ( = ?auto_73992 ?auto_73994 ) ) ( not ( = ?auto_73992 ?auto_73995 ) ) ( not ( = ?auto_73993 ?auto_73994 ) ) ( not ( = ?auto_73993 ?auto_73995 ) ) ( not ( = ?auto_73994 ?auto_73995 ) ) )
    :subtasks
    ( ( !STACK ?auto_73994 ?auto_73995 )
      ( MAKE-4PILE ?auto_73989 ?auto_73990 ?auto_73991 ?auto_73992 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73996 - BLOCK
      ?auto_73997 - BLOCK
      ?auto_73998 - BLOCK
      ?auto_73999 - BLOCK
    )
    :vars
    (
      ?auto_74002 - BLOCK
      ?auto_74000 - BLOCK
      ?auto_74001 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74002 ?auto_73999 ) ( ON-TABLE ?auto_73996 ) ( ON ?auto_73997 ?auto_73996 ) ( ON ?auto_73998 ?auto_73997 ) ( ON ?auto_73999 ?auto_73998 ) ( not ( = ?auto_73996 ?auto_73997 ) ) ( not ( = ?auto_73996 ?auto_73998 ) ) ( not ( = ?auto_73996 ?auto_73999 ) ) ( not ( = ?auto_73996 ?auto_74002 ) ) ( not ( = ?auto_73997 ?auto_73998 ) ) ( not ( = ?auto_73997 ?auto_73999 ) ) ( not ( = ?auto_73997 ?auto_74002 ) ) ( not ( = ?auto_73998 ?auto_73999 ) ) ( not ( = ?auto_73998 ?auto_74002 ) ) ( not ( = ?auto_73999 ?auto_74002 ) ) ( CLEAR ?auto_74000 ) ( not ( = ?auto_73996 ?auto_74001 ) ) ( not ( = ?auto_73996 ?auto_74000 ) ) ( not ( = ?auto_73997 ?auto_74001 ) ) ( not ( = ?auto_73997 ?auto_74000 ) ) ( not ( = ?auto_73998 ?auto_74001 ) ) ( not ( = ?auto_73998 ?auto_74000 ) ) ( not ( = ?auto_73999 ?auto_74001 ) ) ( not ( = ?auto_73999 ?auto_74000 ) ) ( not ( = ?auto_74002 ?auto_74001 ) ) ( not ( = ?auto_74002 ?auto_74000 ) ) ( not ( = ?auto_74001 ?auto_74000 ) ) ( ON ?auto_74001 ?auto_74002 ) ( CLEAR ?auto_74001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73996 ?auto_73997 ?auto_73998 ?auto_73999 ?auto_74002 )
      ( MAKE-4PILE ?auto_73996 ?auto_73997 ?auto_73998 ?auto_73999 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_74003 - BLOCK
      ?auto_74004 - BLOCK
      ?auto_74005 - BLOCK
      ?auto_74006 - BLOCK
    )
    :vars
    (
      ?auto_74008 - BLOCK
      ?auto_74009 - BLOCK
      ?auto_74007 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74008 ?auto_74006 ) ( ON-TABLE ?auto_74003 ) ( ON ?auto_74004 ?auto_74003 ) ( ON ?auto_74005 ?auto_74004 ) ( ON ?auto_74006 ?auto_74005 ) ( not ( = ?auto_74003 ?auto_74004 ) ) ( not ( = ?auto_74003 ?auto_74005 ) ) ( not ( = ?auto_74003 ?auto_74006 ) ) ( not ( = ?auto_74003 ?auto_74008 ) ) ( not ( = ?auto_74004 ?auto_74005 ) ) ( not ( = ?auto_74004 ?auto_74006 ) ) ( not ( = ?auto_74004 ?auto_74008 ) ) ( not ( = ?auto_74005 ?auto_74006 ) ) ( not ( = ?auto_74005 ?auto_74008 ) ) ( not ( = ?auto_74006 ?auto_74008 ) ) ( not ( = ?auto_74003 ?auto_74009 ) ) ( not ( = ?auto_74003 ?auto_74007 ) ) ( not ( = ?auto_74004 ?auto_74009 ) ) ( not ( = ?auto_74004 ?auto_74007 ) ) ( not ( = ?auto_74005 ?auto_74009 ) ) ( not ( = ?auto_74005 ?auto_74007 ) ) ( not ( = ?auto_74006 ?auto_74009 ) ) ( not ( = ?auto_74006 ?auto_74007 ) ) ( not ( = ?auto_74008 ?auto_74009 ) ) ( not ( = ?auto_74008 ?auto_74007 ) ) ( not ( = ?auto_74009 ?auto_74007 ) ) ( ON ?auto_74009 ?auto_74008 ) ( CLEAR ?auto_74009 ) ( HOLDING ?auto_74007 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_74007 )
      ( MAKE-4PILE ?auto_74003 ?auto_74004 ?auto_74005 ?auto_74006 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_74010 - BLOCK
      ?auto_74011 - BLOCK
      ?auto_74012 - BLOCK
      ?auto_74013 - BLOCK
    )
    :vars
    (
      ?auto_74015 - BLOCK
      ?auto_74014 - BLOCK
      ?auto_74016 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74015 ?auto_74013 ) ( ON-TABLE ?auto_74010 ) ( ON ?auto_74011 ?auto_74010 ) ( ON ?auto_74012 ?auto_74011 ) ( ON ?auto_74013 ?auto_74012 ) ( not ( = ?auto_74010 ?auto_74011 ) ) ( not ( = ?auto_74010 ?auto_74012 ) ) ( not ( = ?auto_74010 ?auto_74013 ) ) ( not ( = ?auto_74010 ?auto_74015 ) ) ( not ( = ?auto_74011 ?auto_74012 ) ) ( not ( = ?auto_74011 ?auto_74013 ) ) ( not ( = ?auto_74011 ?auto_74015 ) ) ( not ( = ?auto_74012 ?auto_74013 ) ) ( not ( = ?auto_74012 ?auto_74015 ) ) ( not ( = ?auto_74013 ?auto_74015 ) ) ( not ( = ?auto_74010 ?auto_74014 ) ) ( not ( = ?auto_74010 ?auto_74016 ) ) ( not ( = ?auto_74011 ?auto_74014 ) ) ( not ( = ?auto_74011 ?auto_74016 ) ) ( not ( = ?auto_74012 ?auto_74014 ) ) ( not ( = ?auto_74012 ?auto_74016 ) ) ( not ( = ?auto_74013 ?auto_74014 ) ) ( not ( = ?auto_74013 ?auto_74016 ) ) ( not ( = ?auto_74015 ?auto_74014 ) ) ( not ( = ?auto_74015 ?auto_74016 ) ) ( not ( = ?auto_74014 ?auto_74016 ) ) ( ON ?auto_74014 ?auto_74015 ) ( ON ?auto_74016 ?auto_74014 ) ( CLEAR ?auto_74016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_74010 ?auto_74011 ?auto_74012 ?auto_74013 ?auto_74015 ?auto_74014 )
      ( MAKE-4PILE ?auto_74010 ?auto_74011 ?auto_74012 ?auto_74013 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74020 - BLOCK
      ?auto_74021 - BLOCK
      ?auto_74022 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_74022 ) ( CLEAR ?auto_74021 ) ( ON-TABLE ?auto_74020 ) ( ON ?auto_74021 ?auto_74020 ) ( not ( = ?auto_74020 ?auto_74021 ) ) ( not ( = ?auto_74020 ?auto_74022 ) ) ( not ( = ?auto_74021 ?auto_74022 ) ) )
    :subtasks
    ( ( !STACK ?auto_74022 ?auto_74021 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74023 - BLOCK
      ?auto_74024 - BLOCK
      ?auto_74025 - BLOCK
    )
    :vars
    (
      ?auto_74026 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_74024 ) ( ON-TABLE ?auto_74023 ) ( ON ?auto_74024 ?auto_74023 ) ( not ( = ?auto_74023 ?auto_74024 ) ) ( not ( = ?auto_74023 ?auto_74025 ) ) ( not ( = ?auto_74024 ?auto_74025 ) ) ( ON ?auto_74025 ?auto_74026 ) ( CLEAR ?auto_74025 ) ( HAND-EMPTY ) ( not ( = ?auto_74023 ?auto_74026 ) ) ( not ( = ?auto_74024 ?auto_74026 ) ) ( not ( = ?auto_74025 ?auto_74026 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_74025 ?auto_74026 )
      ( MAKE-3PILE ?auto_74023 ?auto_74024 ?auto_74025 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74027 - BLOCK
      ?auto_74028 - BLOCK
      ?auto_74029 - BLOCK
    )
    :vars
    (
      ?auto_74030 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74027 ) ( not ( = ?auto_74027 ?auto_74028 ) ) ( not ( = ?auto_74027 ?auto_74029 ) ) ( not ( = ?auto_74028 ?auto_74029 ) ) ( ON ?auto_74029 ?auto_74030 ) ( CLEAR ?auto_74029 ) ( not ( = ?auto_74027 ?auto_74030 ) ) ( not ( = ?auto_74028 ?auto_74030 ) ) ( not ( = ?auto_74029 ?auto_74030 ) ) ( HOLDING ?auto_74028 ) ( CLEAR ?auto_74027 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_74027 ?auto_74028 )
      ( MAKE-3PILE ?auto_74027 ?auto_74028 ?auto_74029 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74031 - BLOCK
      ?auto_74032 - BLOCK
      ?auto_74033 - BLOCK
    )
    :vars
    (
      ?auto_74034 - BLOCK
      ?auto_74035 - BLOCK
      ?auto_74036 - BLOCK
      ?auto_74037 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74031 ) ( not ( = ?auto_74031 ?auto_74032 ) ) ( not ( = ?auto_74031 ?auto_74033 ) ) ( not ( = ?auto_74032 ?auto_74033 ) ) ( ON ?auto_74033 ?auto_74034 ) ( not ( = ?auto_74031 ?auto_74034 ) ) ( not ( = ?auto_74032 ?auto_74034 ) ) ( not ( = ?auto_74033 ?auto_74034 ) ) ( CLEAR ?auto_74031 ) ( ON ?auto_74032 ?auto_74033 ) ( CLEAR ?auto_74032 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_74035 ) ( ON ?auto_74036 ?auto_74035 ) ( ON ?auto_74037 ?auto_74036 ) ( ON ?auto_74034 ?auto_74037 ) ( not ( = ?auto_74035 ?auto_74036 ) ) ( not ( = ?auto_74035 ?auto_74037 ) ) ( not ( = ?auto_74035 ?auto_74034 ) ) ( not ( = ?auto_74035 ?auto_74033 ) ) ( not ( = ?auto_74035 ?auto_74032 ) ) ( not ( = ?auto_74036 ?auto_74037 ) ) ( not ( = ?auto_74036 ?auto_74034 ) ) ( not ( = ?auto_74036 ?auto_74033 ) ) ( not ( = ?auto_74036 ?auto_74032 ) ) ( not ( = ?auto_74037 ?auto_74034 ) ) ( not ( = ?auto_74037 ?auto_74033 ) ) ( not ( = ?auto_74037 ?auto_74032 ) ) ( not ( = ?auto_74031 ?auto_74035 ) ) ( not ( = ?auto_74031 ?auto_74036 ) ) ( not ( = ?auto_74031 ?auto_74037 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_74035 ?auto_74036 ?auto_74037 ?auto_74034 ?auto_74033 )
      ( MAKE-3PILE ?auto_74031 ?auto_74032 ?auto_74033 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74038 - BLOCK
      ?auto_74039 - BLOCK
      ?auto_74040 - BLOCK
    )
    :vars
    (
      ?auto_74042 - BLOCK
      ?auto_74041 - BLOCK
      ?auto_74043 - BLOCK
      ?auto_74044 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74038 ?auto_74039 ) ) ( not ( = ?auto_74038 ?auto_74040 ) ) ( not ( = ?auto_74039 ?auto_74040 ) ) ( ON ?auto_74040 ?auto_74042 ) ( not ( = ?auto_74038 ?auto_74042 ) ) ( not ( = ?auto_74039 ?auto_74042 ) ) ( not ( = ?auto_74040 ?auto_74042 ) ) ( ON ?auto_74039 ?auto_74040 ) ( CLEAR ?auto_74039 ) ( ON-TABLE ?auto_74041 ) ( ON ?auto_74043 ?auto_74041 ) ( ON ?auto_74044 ?auto_74043 ) ( ON ?auto_74042 ?auto_74044 ) ( not ( = ?auto_74041 ?auto_74043 ) ) ( not ( = ?auto_74041 ?auto_74044 ) ) ( not ( = ?auto_74041 ?auto_74042 ) ) ( not ( = ?auto_74041 ?auto_74040 ) ) ( not ( = ?auto_74041 ?auto_74039 ) ) ( not ( = ?auto_74043 ?auto_74044 ) ) ( not ( = ?auto_74043 ?auto_74042 ) ) ( not ( = ?auto_74043 ?auto_74040 ) ) ( not ( = ?auto_74043 ?auto_74039 ) ) ( not ( = ?auto_74044 ?auto_74042 ) ) ( not ( = ?auto_74044 ?auto_74040 ) ) ( not ( = ?auto_74044 ?auto_74039 ) ) ( not ( = ?auto_74038 ?auto_74041 ) ) ( not ( = ?auto_74038 ?auto_74043 ) ) ( not ( = ?auto_74038 ?auto_74044 ) ) ( HOLDING ?auto_74038 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_74038 )
      ( MAKE-3PILE ?auto_74038 ?auto_74039 ?auto_74040 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74045 - BLOCK
      ?auto_74046 - BLOCK
      ?auto_74047 - BLOCK
    )
    :vars
    (
      ?auto_74050 - BLOCK
      ?auto_74048 - BLOCK
      ?auto_74051 - BLOCK
      ?auto_74049 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74045 ?auto_74046 ) ) ( not ( = ?auto_74045 ?auto_74047 ) ) ( not ( = ?auto_74046 ?auto_74047 ) ) ( ON ?auto_74047 ?auto_74050 ) ( not ( = ?auto_74045 ?auto_74050 ) ) ( not ( = ?auto_74046 ?auto_74050 ) ) ( not ( = ?auto_74047 ?auto_74050 ) ) ( ON ?auto_74046 ?auto_74047 ) ( ON-TABLE ?auto_74048 ) ( ON ?auto_74051 ?auto_74048 ) ( ON ?auto_74049 ?auto_74051 ) ( ON ?auto_74050 ?auto_74049 ) ( not ( = ?auto_74048 ?auto_74051 ) ) ( not ( = ?auto_74048 ?auto_74049 ) ) ( not ( = ?auto_74048 ?auto_74050 ) ) ( not ( = ?auto_74048 ?auto_74047 ) ) ( not ( = ?auto_74048 ?auto_74046 ) ) ( not ( = ?auto_74051 ?auto_74049 ) ) ( not ( = ?auto_74051 ?auto_74050 ) ) ( not ( = ?auto_74051 ?auto_74047 ) ) ( not ( = ?auto_74051 ?auto_74046 ) ) ( not ( = ?auto_74049 ?auto_74050 ) ) ( not ( = ?auto_74049 ?auto_74047 ) ) ( not ( = ?auto_74049 ?auto_74046 ) ) ( not ( = ?auto_74045 ?auto_74048 ) ) ( not ( = ?auto_74045 ?auto_74051 ) ) ( not ( = ?auto_74045 ?auto_74049 ) ) ( ON ?auto_74045 ?auto_74046 ) ( CLEAR ?auto_74045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_74048 ?auto_74051 ?auto_74049 ?auto_74050 ?auto_74047 ?auto_74046 )
      ( MAKE-3PILE ?auto_74045 ?auto_74046 ?auto_74047 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74055 - BLOCK
      ?auto_74056 - BLOCK
      ?auto_74057 - BLOCK
    )
    :vars
    (
      ?auto_74058 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74058 ?auto_74057 ) ( CLEAR ?auto_74058 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_74055 ) ( ON ?auto_74056 ?auto_74055 ) ( ON ?auto_74057 ?auto_74056 ) ( not ( = ?auto_74055 ?auto_74056 ) ) ( not ( = ?auto_74055 ?auto_74057 ) ) ( not ( = ?auto_74055 ?auto_74058 ) ) ( not ( = ?auto_74056 ?auto_74057 ) ) ( not ( = ?auto_74056 ?auto_74058 ) ) ( not ( = ?auto_74057 ?auto_74058 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_74058 ?auto_74057 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74059 - BLOCK
      ?auto_74060 - BLOCK
      ?auto_74061 - BLOCK
    )
    :vars
    (
      ?auto_74062 - BLOCK
      ?auto_74063 - BLOCK
      ?auto_74064 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74062 ?auto_74061 ) ( CLEAR ?auto_74062 ) ( ON-TABLE ?auto_74059 ) ( ON ?auto_74060 ?auto_74059 ) ( ON ?auto_74061 ?auto_74060 ) ( not ( = ?auto_74059 ?auto_74060 ) ) ( not ( = ?auto_74059 ?auto_74061 ) ) ( not ( = ?auto_74059 ?auto_74062 ) ) ( not ( = ?auto_74060 ?auto_74061 ) ) ( not ( = ?auto_74060 ?auto_74062 ) ) ( not ( = ?auto_74061 ?auto_74062 ) ) ( HOLDING ?auto_74063 ) ( CLEAR ?auto_74064 ) ( not ( = ?auto_74059 ?auto_74063 ) ) ( not ( = ?auto_74059 ?auto_74064 ) ) ( not ( = ?auto_74060 ?auto_74063 ) ) ( not ( = ?auto_74060 ?auto_74064 ) ) ( not ( = ?auto_74061 ?auto_74063 ) ) ( not ( = ?auto_74061 ?auto_74064 ) ) ( not ( = ?auto_74062 ?auto_74063 ) ) ( not ( = ?auto_74062 ?auto_74064 ) ) ( not ( = ?auto_74063 ?auto_74064 ) ) )
    :subtasks
    ( ( !STACK ?auto_74063 ?auto_74064 )
      ( MAKE-3PILE ?auto_74059 ?auto_74060 ?auto_74061 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74065 - BLOCK
      ?auto_74066 - BLOCK
      ?auto_74067 - BLOCK
    )
    :vars
    (
      ?auto_74070 - BLOCK
      ?auto_74068 - BLOCK
      ?auto_74069 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74070 ?auto_74067 ) ( ON-TABLE ?auto_74065 ) ( ON ?auto_74066 ?auto_74065 ) ( ON ?auto_74067 ?auto_74066 ) ( not ( = ?auto_74065 ?auto_74066 ) ) ( not ( = ?auto_74065 ?auto_74067 ) ) ( not ( = ?auto_74065 ?auto_74070 ) ) ( not ( = ?auto_74066 ?auto_74067 ) ) ( not ( = ?auto_74066 ?auto_74070 ) ) ( not ( = ?auto_74067 ?auto_74070 ) ) ( CLEAR ?auto_74068 ) ( not ( = ?auto_74065 ?auto_74069 ) ) ( not ( = ?auto_74065 ?auto_74068 ) ) ( not ( = ?auto_74066 ?auto_74069 ) ) ( not ( = ?auto_74066 ?auto_74068 ) ) ( not ( = ?auto_74067 ?auto_74069 ) ) ( not ( = ?auto_74067 ?auto_74068 ) ) ( not ( = ?auto_74070 ?auto_74069 ) ) ( not ( = ?auto_74070 ?auto_74068 ) ) ( not ( = ?auto_74069 ?auto_74068 ) ) ( ON ?auto_74069 ?auto_74070 ) ( CLEAR ?auto_74069 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_74065 ?auto_74066 ?auto_74067 ?auto_74070 )
      ( MAKE-3PILE ?auto_74065 ?auto_74066 ?auto_74067 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74071 - BLOCK
      ?auto_74072 - BLOCK
      ?auto_74073 - BLOCK
    )
    :vars
    (
      ?auto_74076 - BLOCK
      ?auto_74075 - BLOCK
      ?auto_74074 - BLOCK
      ?auto_74077 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74076 ?auto_74073 ) ( ON-TABLE ?auto_74071 ) ( ON ?auto_74072 ?auto_74071 ) ( ON ?auto_74073 ?auto_74072 ) ( not ( = ?auto_74071 ?auto_74072 ) ) ( not ( = ?auto_74071 ?auto_74073 ) ) ( not ( = ?auto_74071 ?auto_74076 ) ) ( not ( = ?auto_74072 ?auto_74073 ) ) ( not ( = ?auto_74072 ?auto_74076 ) ) ( not ( = ?auto_74073 ?auto_74076 ) ) ( not ( = ?auto_74071 ?auto_74075 ) ) ( not ( = ?auto_74071 ?auto_74074 ) ) ( not ( = ?auto_74072 ?auto_74075 ) ) ( not ( = ?auto_74072 ?auto_74074 ) ) ( not ( = ?auto_74073 ?auto_74075 ) ) ( not ( = ?auto_74073 ?auto_74074 ) ) ( not ( = ?auto_74076 ?auto_74075 ) ) ( not ( = ?auto_74076 ?auto_74074 ) ) ( not ( = ?auto_74075 ?auto_74074 ) ) ( ON ?auto_74075 ?auto_74076 ) ( CLEAR ?auto_74075 ) ( HOLDING ?auto_74074 ) ( CLEAR ?auto_74077 ) ( ON-TABLE ?auto_74077 ) ( not ( = ?auto_74077 ?auto_74074 ) ) ( not ( = ?auto_74071 ?auto_74077 ) ) ( not ( = ?auto_74072 ?auto_74077 ) ) ( not ( = ?auto_74073 ?auto_74077 ) ) ( not ( = ?auto_74076 ?auto_74077 ) ) ( not ( = ?auto_74075 ?auto_74077 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_74077 ?auto_74074 )
      ( MAKE-3PILE ?auto_74071 ?auto_74072 ?auto_74073 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74078 - BLOCK
      ?auto_74079 - BLOCK
      ?auto_74080 - BLOCK
    )
    :vars
    (
      ?auto_74081 - BLOCK
      ?auto_74082 - BLOCK
      ?auto_74084 - BLOCK
      ?auto_74083 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74081 ?auto_74080 ) ( ON-TABLE ?auto_74078 ) ( ON ?auto_74079 ?auto_74078 ) ( ON ?auto_74080 ?auto_74079 ) ( not ( = ?auto_74078 ?auto_74079 ) ) ( not ( = ?auto_74078 ?auto_74080 ) ) ( not ( = ?auto_74078 ?auto_74081 ) ) ( not ( = ?auto_74079 ?auto_74080 ) ) ( not ( = ?auto_74079 ?auto_74081 ) ) ( not ( = ?auto_74080 ?auto_74081 ) ) ( not ( = ?auto_74078 ?auto_74082 ) ) ( not ( = ?auto_74078 ?auto_74084 ) ) ( not ( = ?auto_74079 ?auto_74082 ) ) ( not ( = ?auto_74079 ?auto_74084 ) ) ( not ( = ?auto_74080 ?auto_74082 ) ) ( not ( = ?auto_74080 ?auto_74084 ) ) ( not ( = ?auto_74081 ?auto_74082 ) ) ( not ( = ?auto_74081 ?auto_74084 ) ) ( not ( = ?auto_74082 ?auto_74084 ) ) ( ON ?auto_74082 ?auto_74081 ) ( CLEAR ?auto_74083 ) ( ON-TABLE ?auto_74083 ) ( not ( = ?auto_74083 ?auto_74084 ) ) ( not ( = ?auto_74078 ?auto_74083 ) ) ( not ( = ?auto_74079 ?auto_74083 ) ) ( not ( = ?auto_74080 ?auto_74083 ) ) ( not ( = ?auto_74081 ?auto_74083 ) ) ( not ( = ?auto_74082 ?auto_74083 ) ) ( ON ?auto_74084 ?auto_74082 ) ( CLEAR ?auto_74084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_74078 ?auto_74079 ?auto_74080 ?auto_74081 ?auto_74082 )
      ( MAKE-3PILE ?auto_74078 ?auto_74079 ?auto_74080 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74085 - BLOCK
      ?auto_74086 - BLOCK
      ?auto_74087 - BLOCK
    )
    :vars
    (
      ?auto_74088 - BLOCK
      ?auto_74091 - BLOCK
      ?auto_74089 - BLOCK
      ?auto_74090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74088 ?auto_74087 ) ( ON-TABLE ?auto_74085 ) ( ON ?auto_74086 ?auto_74085 ) ( ON ?auto_74087 ?auto_74086 ) ( not ( = ?auto_74085 ?auto_74086 ) ) ( not ( = ?auto_74085 ?auto_74087 ) ) ( not ( = ?auto_74085 ?auto_74088 ) ) ( not ( = ?auto_74086 ?auto_74087 ) ) ( not ( = ?auto_74086 ?auto_74088 ) ) ( not ( = ?auto_74087 ?auto_74088 ) ) ( not ( = ?auto_74085 ?auto_74091 ) ) ( not ( = ?auto_74085 ?auto_74089 ) ) ( not ( = ?auto_74086 ?auto_74091 ) ) ( not ( = ?auto_74086 ?auto_74089 ) ) ( not ( = ?auto_74087 ?auto_74091 ) ) ( not ( = ?auto_74087 ?auto_74089 ) ) ( not ( = ?auto_74088 ?auto_74091 ) ) ( not ( = ?auto_74088 ?auto_74089 ) ) ( not ( = ?auto_74091 ?auto_74089 ) ) ( ON ?auto_74091 ?auto_74088 ) ( not ( = ?auto_74090 ?auto_74089 ) ) ( not ( = ?auto_74085 ?auto_74090 ) ) ( not ( = ?auto_74086 ?auto_74090 ) ) ( not ( = ?auto_74087 ?auto_74090 ) ) ( not ( = ?auto_74088 ?auto_74090 ) ) ( not ( = ?auto_74091 ?auto_74090 ) ) ( ON ?auto_74089 ?auto_74091 ) ( CLEAR ?auto_74089 ) ( HOLDING ?auto_74090 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_74090 )
      ( MAKE-3PILE ?auto_74085 ?auto_74086 ?auto_74087 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74092 - BLOCK
      ?auto_74093 - BLOCK
      ?auto_74094 - BLOCK
    )
    :vars
    (
      ?auto_74096 - BLOCK
      ?auto_74095 - BLOCK
      ?auto_74098 - BLOCK
      ?auto_74097 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74096 ?auto_74094 ) ( ON-TABLE ?auto_74092 ) ( ON ?auto_74093 ?auto_74092 ) ( ON ?auto_74094 ?auto_74093 ) ( not ( = ?auto_74092 ?auto_74093 ) ) ( not ( = ?auto_74092 ?auto_74094 ) ) ( not ( = ?auto_74092 ?auto_74096 ) ) ( not ( = ?auto_74093 ?auto_74094 ) ) ( not ( = ?auto_74093 ?auto_74096 ) ) ( not ( = ?auto_74094 ?auto_74096 ) ) ( not ( = ?auto_74092 ?auto_74095 ) ) ( not ( = ?auto_74092 ?auto_74098 ) ) ( not ( = ?auto_74093 ?auto_74095 ) ) ( not ( = ?auto_74093 ?auto_74098 ) ) ( not ( = ?auto_74094 ?auto_74095 ) ) ( not ( = ?auto_74094 ?auto_74098 ) ) ( not ( = ?auto_74096 ?auto_74095 ) ) ( not ( = ?auto_74096 ?auto_74098 ) ) ( not ( = ?auto_74095 ?auto_74098 ) ) ( ON ?auto_74095 ?auto_74096 ) ( not ( = ?auto_74097 ?auto_74098 ) ) ( not ( = ?auto_74092 ?auto_74097 ) ) ( not ( = ?auto_74093 ?auto_74097 ) ) ( not ( = ?auto_74094 ?auto_74097 ) ) ( not ( = ?auto_74096 ?auto_74097 ) ) ( not ( = ?auto_74095 ?auto_74097 ) ) ( ON ?auto_74098 ?auto_74095 ) ( ON ?auto_74097 ?auto_74098 ) ( CLEAR ?auto_74097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_74092 ?auto_74093 ?auto_74094 ?auto_74096 ?auto_74095 ?auto_74098 )
      ( MAKE-3PILE ?auto_74092 ?auto_74093 ?auto_74094 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_74103 - BLOCK
      ?auto_74104 - BLOCK
      ?auto_74105 - BLOCK
      ?auto_74106 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_74106 ) ( CLEAR ?auto_74105 ) ( ON-TABLE ?auto_74103 ) ( ON ?auto_74104 ?auto_74103 ) ( ON ?auto_74105 ?auto_74104 ) ( not ( = ?auto_74103 ?auto_74104 ) ) ( not ( = ?auto_74103 ?auto_74105 ) ) ( not ( = ?auto_74103 ?auto_74106 ) ) ( not ( = ?auto_74104 ?auto_74105 ) ) ( not ( = ?auto_74104 ?auto_74106 ) ) ( not ( = ?auto_74105 ?auto_74106 ) ) )
    :subtasks
    ( ( !STACK ?auto_74106 ?auto_74105 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_74107 - BLOCK
      ?auto_74108 - BLOCK
      ?auto_74109 - BLOCK
      ?auto_74110 - BLOCK
    )
    :vars
    (
      ?auto_74111 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_74109 ) ( ON-TABLE ?auto_74107 ) ( ON ?auto_74108 ?auto_74107 ) ( ON ?auto_74109 ?auto_74108 ) ( not ( = ?auto_74107 ?auto_74108 ) ) ( not ( = ?auto_74107 ?auto_74109 ) ) ( not ( = ?auto_74107 ?auto_74110 ) ) ( not ( = ?auto_74108 ?auto_74109 ) ) ( not ( = ?auto_74108 ?auto_74110 ) ) ( not ( = ?auto_74109 ?auto_74110 ) ) ( ON ?auto_74110 ?auto_74111 ) ( CLEAR ?auto_74110 ) ( HAND-EMPTY ) ( not ( = ?auto_74107 ?auto_74111 ) ) ( not ( = ?auto_74108 ?auto_74111 ) ) ( not ( = ?auto_74109 ?auto_74111 ) ) ( not ( = ?auto_74110 ?auto_74111 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_74110 ?auto_74111 )
      ( MAKE-4PILE ?auto_74107 ?auto_74108 ?auto_74109 ?auto_74110 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_74112 - BLOCK
      ?auto_74113 - BLOCK
      ?auto_74114 - BLOCK
      ?auto_74115 - BLOCK
    )
    :vars
    (
      ?auto_74116 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74112 ) ( ON ?auto_74113 ?auto_74112 ) ( not ( = ?auto_74112 ?auto_74113 ) ) ( not ( = ?auto_74112 ?auto_74114 ) ) ( not ( = ?auto_74112 ?auto_74115 ) ) ( not ( = ?auto_74113 ?auto_74114 ) ) ( not ( = ?auto_74113 ?auto_74115 ) ) ( not ( = ?auto_74114 ?auto_74115 ) ) ( ON ?auto_74115 ?auto_74116 ) ( CLEAR ?auto_74115 ) ( not ( = ?auto_74112 ?auto_74116 ) ) ( not ( = ?auto_74113 ?auto_74116 ) ) ( not ( = ?auto_74114 ?auto_74116 ) ) ( not ( = ?auto_74115 ?auto_74116 ) ) ( HOLDING ?auto_74114 ) ( CLEAR ?auto_74113 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_74112 ?auto_74113 ?auto_74114 )
      ( MAKE-4PILE ?auto_74112 ?auto_74113 ?auto_74114 ?auto_74115 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_74117 - BLOCK
      ?auto_74118 - BLOCK
      ?auto_74119 - BLOCK
      ?auto_74120 - BLOCK
    )
    :vars
    (
      ?auto_74121 - BLOCK
      ?auto_74123 - BLOCK
      ?auto_74122 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74117 ) ( ON ?auto_74118 ?auto_74117 ) ( not ( = ?auto_74117 ?auto_74118 ) ) ( not ( = ?auto_74117 ?auto_74119 ) ) ( not ( = ?auto_74117 ?auto_74120 ) ) ( not ( = ?auto_74118 ?auto_74119 ) ) ( not ( = ?auto_74118 ?auto_74120 ) ) ( not ( = ?auto_74119 ?auto_74120 ) ) ( ON ?auto_74120 ?auto_74121 ) ( not ( = ?auto_74117 ?auto_74121 ) ) ( not ( = ?auto_74118 ?auto_74121 ) ) ( not ( = ?auto_74119 ?auto_74121 ) ) ( not ( = ?auto_74120 ?auto_74121 ) ) ( CLEAR ?auto_74118 ) ( ON ?auto_74119 ?auto_74120 ) ( CLEAR ?auto_74119 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_74123 ) ( ON ?auto_74122 ?auto_74123 ) ( ON ?auto_74121 ?auto_74122 ) ( not ( = ?auto_74123 ?auto_74122 ) ) ( not ( = ?auto_74123 ?auto_74121 ) ) ( not ( = ?auto_74123 ?auto_74120 ) ) ( not ( = ?auto_74123 ?auto_74119 ) ) ( not ( = ?auto_74122 ?auto_74121 ) ) ( not ( = ?auto_74122 ?auto_74120 ) ) ( not ( = ?auto_74122 ?auto_74119 ) ) ( not ( = ?auto_74117 ?auto_74123 ) ) ( not ( = ?auto_74117 ?auto_74122 ) ) ( not ( = ?auto_74118 ?auto_74123 ) ) ( not ( = ?auto_74118 ?auto_74122 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_74123 ?auto_74122 ?auto_74121 ?auto_74120 )
      ( MAKE-4PILE ?auto_74117 ?auto_74118 ?auto_74119 ?auto_74120 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_74124 - BLOCK
      ?auto_74125 - BLOCK
      ?auto_74126 - BLOCK
      ?auto_74127 - BLOCK
    )
    :vars
    (
      ?auto_74130 - BLOCK
      ?auto_74128 - BLOCK
      ?auto_74129 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74124 ) ( not ( = ?auto_74124 ?auto_74125 ) ) ( not ( = ?auto_74124 ?auto_74126 ) ) ( not ( = ?auto_74124 ?auto_74127 ) ) ( not ( = ?auto_74125 ?auto_74126 ) ) ( not ( = ?auto_74125 ?auto_74127 ) ) ( not ( = ?auto_74126 ?auto_74127 ) ) ( ON ?auto_74127 ?auto_74130 ) ( not ( = ?auto_74124 ?auto_74130 ) ) ( not ( = ?auto_74125 ?auto_74130 ) ) ( not ( = ?auto_74126 ?auto_74130 ) ) ( not ( = ?auto_74127 ?auto_74130 ) ) ( ON ?auto_74126 ?auto_74127 ) ( CLEAR ?auto_74126 ) ( ON-TABLE ?auto_74128 ) ( ON ?auto_74129 ?auto_74128 ) ( ON ?auto_74130 ?auto_74129 ) ( not ( = ?auto_74128 ?auto_74129 ) ) ( not ( = ?auto_74128 ?auto_74130 ) ) ( not ( = ?auto_74128 ?auto_74127 ) ) ( not ( = ?auto_74128 ?auto_74126 ) ) ( not ( = ?auto_74129 ?auto_74130 ) ) ( not ( = ?auto_74129 ?auto_74127 ) ) ( not ( = ?auto_74129 ?auto_74126 ) ) ( not ( = ?auto_74124 ?auto_74128 ) ) ( not ( = ?auto_74124 ?auto_74129 ) ) ( not ( = ?auto_74125 ?auto_74128 ) ) ( not ( = ?auto_74125 ?auto_74129 ) ) ( HOLDING ?auto_74125 ) ( CLEAR ?auto_74124 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_74124 ?auto_74125 )
      ( MAKE-4PILE ?auto_74124 ?auto_74125 ?auto_74126 ?auto_74127 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_74131 - BLOCK
      ?auto_74132 - BLOCK
      ?auto_74133 - BLOCK
      ?auto_74134 - BLOCK
    )
    :vars
    (
      ?auto_74135 - BLOCK
      ?auto_74136 - BLOCK
      ?auto_74137 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74131 ) ( not ( = ?auto_74131 ?auto_74132 ) ) ( not ( = ?auto_74131 ?auto_74133 ) ) ( not ( = ?auto_74131 ?auto_74134 ) ) ( not ( = ?auto_74132 ?auto_74133 ) ) ( not ( = ?auto_74132 ?auto_74134 ) ) ( not ( = ?auto_74133 ?auto_74134 ) ) ( ON ?auto_74134 ?auto_74135 ) ( not ( = ?auto_74131 ?auto_74135 ) ) ( not ( = ?auto_74132 ?auto_74135 ) ) ( not ( = ?auto_74133 ?auto_74135 ) ) ( not ( = ?auto_74134 ?auto_74135 ) ) ( ON ?auto_74133 ?auto_74134 ) ( ON-TABLE ?auto_74136 ) ( ON ?auto_74137 ?auto_74136 ) ( ON ?auto_74135 ?auto_74137 ) ( not ( = ?auto_74136 ?auto_74137 ) ) ( not ( = ?auto_74136 ?auto_74135 ) ) ( not ( = ?auto_74136 ?auto_74134 ) ) ( not ( = ?auto_74136 ?auto_74133 ) ) ( not ( = ?auto_74137 ?auto_74135 ) ) ( not ( = ?auto_74137 ?auto_74134 ) ) ( not ( = ?auto_74137 ?auto_74133 ) ) ( not ( = ?auto_74131 ?auto_74136 ) ) ( not ( = ?auto_74131 ?auto_74137 ) ) ( not ( = ?auto_74132 ?auto_74136 ) ) ( not ( = ?auto_74132 ?auto_74137 ) ) ( CLEAR ?auto_74131 ) ( ON ?auto_74132 ?auto_74133 ) ( CLEAR ?auto_74132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_74136 ?auto_74137 ?auto_74135 ?auto_74134 ?auto_74133 )
      ( MAKE-4PILE ?auto_74131 ?auto_74132 ?auto_74133 ?auto_74134 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_74138 - BLOCK
      ?auto_74139 - BLOCK
      ?auto_74140 - BLOCK
      ?auto_74141 - BLOCK
    )
    :vars
    (
      ?auto_74142 - BLOCK
      ?auto_74144 - BLOCK
      ?auto_74143 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74138 ?auto_74139 ) ) ( not ( = ?auto_74138 ?auto_74140 ) ) ( not ( = ?auto_74138 ?auto_74141 ) ) ( not ( = ?auto_74139 ?auto_74140 ) ) ( not ( = ?auto_74139 ?auto_74141 ) ) ( not ( = ?auto_74140 ?auto_74141 ) ) ( ON ?auto_74141 ?auto_74142 ) ( not ( = ?auto_74138 ?auto_74142 ) ) ( not ( = ?auto_74139 ?auto_74142 ) ) ( not ( = ?auto_74140 ?auto_74142 ) ) ( not ( = ?auto_74141 ?auto_74142 ) ) ( ON ?auto_74140 ?auto_74141 ) ( ON-TABLE ?auto_74144 ) ( ON ?auto_74143 ?auto_74144 ) ( ON ?auto_74142 ?auto_74143 ) ( not ( = ?auto_74144 ?auto_74143 ) ) ( not ( = ?auto_74144 ?auto_74142 ) ) ( not ( = ?auto_74144 ?auto_74141 ) ) ( not ( = ?auto_74144 ?auto_74140 ) ) ( not ( = ?auto_74143 ?auto_74142 ) ) ( not ( = ?auto_74143 ?auto_74141 ) ) ( not ( = ?auto_74143 ?auto_74140 ) ) ( not ( = ?auto_74138 ?auto_74144 ) ) ( not ( = ?auto_74138 ?auto_74143 ) ) ( not ( = ?auto_74139 ?auto_74144 ) ) ( not ( = ?auto_74139 ?auto_74143 ) ) ( ON ?auto_74139 ?auto_74140 ) ( CLEAR ?auto_74139 ) ( HOLDING ?auto_74138 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_74138 )
      ( MAKE-4PILE ?auto_74138 ?auto_74139 ?auto_74140 ?auto_74141 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_74145 - BLOCK
      ?auto_74146 - BLOCK
      ?auto_74147 - BLOCK
      ?auto_74148 - BLOCK
    )
    :vars
    (
      ?auto_74149 - BLOCK
      ?auto_74151 - BLOCK
      ?auto_74150 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74145 ?auto_74146 ) ) ( not ( = ?auto_74145 ?auto_74147 ) ) ( not ( = ?auto_74145 ?auto_74148 ) ) ( not ( = ?auto_74146 ?auto_74147 ) ) ( not ( = ?auto_74146 ?auto_74148 ) ) ( not ( = ?auto_74147 ?auto_74148 ) ) ( ON ?auto_74148 ?auto_74149 ) ( not ( = ?auto_74145 ?auto_74149 ) ) ( not ( = ?auto_74146 ?auto_74149 ) ) ( not ( = ?auto_74147 ?auto_74149 ) ) ( not ( = ?auto_74148 ?auto_74149 ) ) ( ON ?auto_74147 ?auto_74148 ) ( ON-TABLE ?auto_74151 ) ( ON ?auto_74150 ?auto_74151 ) ( ON ?auto_74149 ?auto_74150 ) ( not ( = ?auto_74151 ?auto_74150 ) ) ( not ( = ?auto_74151 ?auto_74149 ) ) ( not ( = ?auto_74151 ?auto_74148 ) ) ( not ( = ?auto_74151 ?auto_74147 ) ) ( not ( = ?auto_74150 ?auto_74149 ) ) ( not ( = ?auto_74150 ?auto_74148 ) ) ( not ( = ?auto_74150 ?auto_74147 ) ) ( not ( = ?auto_74145 ?auto_74151 ) ) ( not ( = ?auto_74145 ?auto_74150 ) ) ( not ( = ?auto_74146 ?auto_74151 ) ) ( not ( = ?auto_74146 ?auto_74150 ) ) ( ON ?auto_74146 ?auto_74147 ) ( ON ?auto_74145 ?auto_74146 ) ( CLEAR ?auto_74145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_74151 ?auto_74150 ?auto_74149 ?auto_74148 ?auto_74147 ?auto_74146 )
      ( MAKE-4PILE ?auto_74145 ?auto_74146 ?auto_74147 ?auto_74148 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_74154 - BLOCK
      ?auto_74155 - BLOCK
    )
    :vars
    (
      ?auto_74156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74156 ?auto_74155 ) ( CLEAR ?auto_74156 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_74154 ) ( ON ?auto_74155 ?auto_74154 ) ( not ( = ?auto_74154 ?auto_74155 ) ) ( not ( = ?auto_74154 ?auto_74156 ) ) ( not ( = ?auto_74155 ?auto_74156 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_74156 ?auto_74155 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_74157 - BLOCK
      ?auto_74158 - BLOCK
    )
    :vars
    (
      ?auto_74159 - BLOCK
      ?auto_74160 - BLOCK
      ?auto_74161 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74159 ?auto_74158 ) ( CLEAR ?auto_74159 ) ( ON-TABLE ?auto_74157 ) ( ON ?auto_74158 ?auto_74157 ) ( not ( = ?auto_74157 ?auto_74158 ) ) ( not ( = ?auto_74157 ?auto_74159 ) ) ( not ( = ?auto_74158 ?auto_74159 ) ) ( HOLDING ?auto_74160 ) ( CLEAR ?auto_74161 ) ( not ( = ?auto_74157 ?auto_74160 ) ) ( not ( = ?auto_74157 ?auto_74161 ) ) ( not ( = ?auto_74158 ?auto_74160 ) ) ( not ( = ?auto_74158 ?auto_74161 ) ) ( not ( = ?auto_74159 ?auto_74160 ) ) ( not ( = ?auto_74159 ?auto_74161 ) ) ( not ( = ?auto_74160 ?auto_74161 ) ) )
    :subtasks
    ( ( !STACK ?auto_74160 ?auto_74161 )
      ( MAKE-2PILE ?auto_74157 ?auto_74158 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_74162 - BLOCK
      ?auto_74163 - BLOCK
    )
    :vars
    (
      ?auto_74164 - BLOCK
      ?auto_74166 - BLOCK
      ?auto_74165 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74164 ?auto_74163 ) ( ON-TABLE ?auto_74162 ) ( ON ?auto_74163 ?auto_74162 ) ( not ( = ?auto_74162 ?auto_74163 ) ) ( not ( = ?auto_74162 ?auto_74164 ) ) ( not ( = ?auto_74163 ?auto_74164 ) ) ( CLEAR ?auto_74166 ) ( not ( = ?auto_74162 ?auto_74165 ) ) ( not ( = ?auto_74162 ?auto_74166 ) ) ( not ( = ?auto_74163 ?auto_74165 ) ) ( not ( = ?auto_74163 ?auto_74166 ) ) ( not ( = ?auto_74164 ?auto_74165 ) ) ( not ( = ?auto_74164 ?auto_74166 ) ) ( not ( = ?auto_74165 ?auto_74166 ) ) ( ON ?auto_74165 ?auto_74164 ) ( CLEAR ?auto_74165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_74162 ?auto_74163 ?auto_74164 )
      ( MAKE-2PILE ?auto_74162 ?auto_74163 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_74167 - BLOCK
      ?auto_74168 - BLOCK
    )
    :vars
    (
      ?auto_74171 - BLOCK
      ?auto_74169 - BLOCK
      ?auto_74170 - BLOCK
      ?auto_74173 - BLOCK
      ?auto_74172 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74171 ?auto_74168 ) ( ON-TABLE ?auto_74167 ) ( ON ?auto_74168 ?auto_74167 ) ( not ( = ?auto_74167 ?auto_74168 ) ) ( not ( = ?auto_74167 ?auto_74171 ) ) ( not ( = ?auto_74168 ?auto_74171 ) ) ( not ( = ?auto_74167 ?auto_74169 ) ) ( not ( = ?auto_74167 ?auto_74170 ) ) ( not ( = ?auto_74168 ?auto_74169 ) ) ( not ( = ?auto_74168 ?auto_74170 ) ) ( not ( = ?auto_74171 ?auto_74169 ) ) ( not ( = ?auto_74171 ?auto_74170 ) ) ( not ( = ?auto_74169 ?auto_74170 ) ) ( ON ?auto_74169 ?auto_74171 ) ( CLEAR ?auto_74169 ) ( HOLDING ?auto_74170 ) ( CLEAR ?auto_74173 ) ( ON-TABLE ?auto_74172 ) ( ON ?auto_74173 ?auto_74172 ) ( not ( = ?auto_74172 ?auto_74173 ) ) ( not ( = ?auto_74172 ?auto_74170 ) ) ( not ( = ?auto_74173 ?auto_74170 ) ) ( not ( = ?auto_74167 ?auto_74173 ) ) ( not ( = ?auto_74167 ?auto_74172 ) ) ( not ( = ?auto_74168 ?auto_74173 ) ) ( not ( = ?auto_74168 ?auto_74172 ) ) ( not ( = ?auto_74171 ?auto_74173 ) ) ( not ( = ?auto_74171 ?auto_74172 ) ) ( not ( = ?auto_74169 ?auto_74173 ) ) ( not ( = ?auto_74169 ?auto_74172 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_74172 ?auto_74173 ?auto_74170 )
      ( MAKE-2PILE ?auto_74167 ?auto_74168 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_74174 - BLOCK
      ?auto_74175 - BLOCK
    )
    :vars
    (
      ?auto_74179 - BLOCK
      ?auto_74178 - BLOCK
      ?auto_74177 - BLOCK
      ?auto_74180 - BLOCK
      ?auto_74176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74179 ?auto_74175 ) ( ON-TABLE ?auto_74174 ) ( ON ?auto_74175 ?auto_74174 ) ( not ( = ?auto_74174 ?auto_74175 ) ) ( not ( = ?auto_74174 ?auto_74179 ) ) ( not ( = ?auto_74175 ?auto_74179 ) ) ( not ( = ?auto_74174 ?auto_74178 ) ) ( not ( = ?auto_74174 ?auto_74177 ) ) ( not ( = ?auto_74175 ?auto_74178 ) ) ( not ( = ?auto_74175 ?auto_74177 ) ) ( not ( = ?auto_74179 ?auto_74178 ) ) ( not ( = ?auto_74179 ?auto_74177 ) ) ( not ( = ?auto_74178 ?auto_74177 ) ) ( ON ?auto_74178 ?auto_74179 ) ( CLEAR ?auto_74180 ) ( ON-TABLE ?auto_74176 ) ( ON ?auto_74180 ?auto_74176 ) ( not ( = ?auto_74176 ?auto_74180 ) ) ( not ( = ?auto_74176 ?auto_74177 ) ) ( not ( = ?auto_74180 ?auto_74177 ) ) ( not ( = ?auto_74174 ?auto_74180 ) ) ( not ( = ?auto_74174 ?auto_74176 ) ) ( not ( = ?auto_74175 ?auto_74180 ) ) ( not ( = ?auto_74175 ?auto_74176 ) ) ( not ( = ?auto_74179 ?auto_74180 ) ) ( not ( = ?auto_74179 ?auto_74176 ) ) ( not ( = ?auto_74178 ?auto_74180 ) ) ( not ( = ?auto_74178 ?auto_74176 ) ) ( ON ?auto_74177 ?auto_74178 ) ( CLEAR ?auto_74177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_74174 ?auto_74175 ?auto_74179 ?auto_74178 )
      ( MAKE-2PILE ?auto_74174 ?auto_74175 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_74181 - BLOCK
      ?auto_74182 - BLOCK
    )
    :vars
    (
      ?auto_74185 - BLOCK
      ?auto_74187 - BLOCK
      ?auto_74186 - BLOCK
      ?auto_74184 - BLOCK
      ?auto_74183 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74185 ?auto_74182 ) ( ON-TABLE ?auto_74181 ) ( ON ?auto_74182 ?auto_74181 ) ( not ( = ?auto_74181 ?auto_74182 ) ) ( not ( = ?auto_74181 ?auto_74185 ) ) ( not ( = ?auto_74182 ?auto_74185 ) ) ( not ( = ?auto_74181 ?auto_74187 ) ) ( not ( = ?auto_74181 ?auto_74186 ) ) ( not ( = ?auto_74182 ?auto_74187 ) ) ( not ( = ?auto_74182 ?auto_74186 ) ) ( not ( = ?auto_74185 ?auto_74187 ) ) ( not ( = ?auto_74185 ?auto_74186 ) ) ( not ( = ?auto_74187 ?auto_74186 ) ) ( ON ?auto_74187 ?auto_74185 ) ( ON-TABLE ?auto_74184 ) ( not ( = ?auto_74184 ?auto_74183 ) ) ( not ( = ?auto_74184 ?auto_74186 ) ) ( not ( = ?auto_74183 ?auto_74186 ) ) ( not ( = ?auto_74181 ?auto_74183 ) ) ( not ( = ?auto_74181 ?auto_74184 ) ) ( not ( = ?auto_74182 ?auto_74183 ) ) ( not ( = ?auto_74182 ?auto_74184 ) ) ( not ( = ?auto_74185 ?auto_74183 ) ) ( not ( = ?auto_74185 ?auto_74184 ) ) ( not ( = ?auto_74187 ?auto_74183 ) ) ( not ( = ?auto_74187 ?auto_74184 ) ) ( ON ?auto_74186 ?auto_74187 ) ( CLEAR ?auto_74186 ) ( HOLDING ?auto_74183 ) ( CLEAR ?auto_74184 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_74184 ?auto_74183 )
      ( MAKE-2PILE ?auto_74181 ?auto_74182 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_74188 - BLOCK
      ?auto_74189 - BLOCK
    )
    :vars
    (
      ?auto_74191 - BLOCK
      ?auto_74192 - BLOCK
      ?auto_74190 - BLOCK
      ?auto_74193 - BLOCK
      ?auto_74194 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74191 ?auto_74189 ) ( ON-TABLE ?auto_74188 ) ( ON ?auto_74189 ?auto_74188 ) ( not ( = ?auto_74188 ?auto_74189 ) ) ( not ( = ?auto_74188 ?auto_74191 ) ) ( not ( = ?auto_74189 ?auto_74191 ) ) ( not ( = ?auto_74188 ?auto_74192 ) ) ( not ( = ?auto_74188 ?auto_74190 ) ) ( not ( = ?auto_74189 ?auto_74192 ) ) ( not ( = ?auto_74189 ?auto_74190 ) ) ( not ( = ?auto_74191 ?auto_74192 ) ) ( not ( = ?auto_74191 ?auto_74190 ) ) ( not ( = ?auto_74192 ?auto_74190 ) ) ( ON ?auto_74192 ?auto_74191 ) ( ON-TABLE ?auto_74193 ) ( not ( = ?auto_74193 ?auto_74194 ) ) ( not ( = ?auto_74193 ?auto_74190 ) ) ( not ( = ?auto_74194 ?auto_74190 ) ) ( not ( = ?auto_74188 ?auto_74194 ) ) ( not ( = ?auto_74188 ?auto_74193 ) ) ( not ( = ?auto_74189 ?auto_74194 ) ) ( not ( = ?auto_74189 ?auto_74193 ) ) ( not ( = ?auto_74191 ?auto_74194 ) ) ( not ( = ?auto_74191 ?auto_74193 ) ) ( not ( = ?auto_74192 ?auto_74194 ) ) ( not ( = ?auto_74192 ?auto_74193 ) ) ( ON ?auto_74190 ?auto_74192 ) ( CLEAR ?auto_74193 ) ( ON ?auto_74194 ?auto_74190 ) ( CLEAR ?auto_74194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_74188 ?auto_74189 ?auto_74191 ?auto_74192 ?auto_74190 )
      ( MAKE-2PILE ?auto_74188 ?auto_74189 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_74195 - BLOCK
      ?auto_74196 - BLOCK
    )
    :vars
    (
      ?auto_74197 - BLOCK
      ?auto_74199 - BLOCK
      ?auto_74201 - BLOCK
      ?auto_74198 - BLOCK
      ?auto_74200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74197 ?auto_74196 ) ( ON-TABLE ?auto_74195 ) ( ON ?auto_74196 ?auto_74195 ) ( not ( = ?auto_74195 ?auto_74196 ) ) ( not ( = ?auto_74195 ?auto_74197 ) ) ( not ( = ?auto_74196 ?auto_74197 ) ) ( not ( = ?auto_74195 ?auto_74199 ) ) ( not ( = ?auto_74195 ?auto_74201 ) ) ( not ( = ?auto_74196 ?auto_74199 ) ) ( not ( = ?auto_74196 ?auto_74201 ) ) ( not ( = ?auto_74197 ?auto_74199 ) ) ( not ( = ?auto_74197 ?auto_74201 ) ) ( not ( = ?auto_74199 ?auto_74201 ) ) ( ON ?auto_74199 ?auto_74197 ) ( not ( = ?auto_74198 ?auto_74200 ) ) ( not ( = ?auto_74198 ?auto_74201 ) ) ( not ( = ?auto_74200 ?auto_74201 ) ) ( not ( = ?auto_74195 ?auto_74200 ) ) ( not ( = ?auto_74195 ?auto_74198 ) ) ( not ( = ?auto_74196 ?auto_74200 ) ) ( not ( = ?auto_74196 ?auto_74198 ) ) ( not ( = ?auto_74197 ?auto_74200 ) ) ( not ( = ?auto_74197 ?auto_74198 ) ) ( not ( = ?auto_74199 ?auto_74200 ) ) ( not ( = ?auto_74199 ?auto_74198 ) ) ( ON ?auto_74201 ?auto_74199 ) ( ON ?auto_74200 ?auto_74201 ) ( CLEAR ?auto_74200 ) ( HOLDING ?auto_74198 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_74198 )
      ( MAKE-2PILE ?auto_74195 ?auto_74196 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_74202 - BLOCK
      ?auto_74203 - BLOCK
    )
    :vars
    (
      ?auto_74208 - BLOCK
      ?auto_74207 - BLOCK
      ?auto_74206 - BLOCK
      ?auto_74205 - BLOCK
      ?auto_74204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74208 ?auto_74203 ) ( ON-TABLE ?auto_74202 ) ( ON ?auto_74203 ?auto_74202 ) ( not ( = ?auto_74202 ?auto_74203 ) ) ( not ( = ?auto_74202 ?auto_74208 ) ) ( not ( = ?auto_74203 ?auto_74208 ) ) ( not ( = ?auto_74202 ?auto_74207 ) ) ( not ( = ?auto_74202 ?auto_74206 ) ) ( not ( = ?auto_74203 ?auto_74207 ) ) ( not ( = ?auto_74203 ?auto_74206 ) ) ( not ( = ?auto_74208 ?auto_74207 ) ) ( not ( = ?auto_74208 ?auto_74206 ) ) ( not ( = ?auto_74207 ?auto_74206 ) ) ( ON ?auto_74207 ?auto_74208 ) ( not ( = ?auto_74205 ?auto_74204 ) ) ( not ( = ?auto_74205 ?auto_74206 ) ) ( not ( = ?auto_74204 ?auto_74206 ) ) ( not ( = ?auto_74202 ?auto_74204 ) ) ( not ( = ?auto_74202 ?auto_74205 ) ) ( not ( = ?auto_74203 ?auto_74204 ) ) ( not ( = ?auto_74203 ?auto_74205 ) ) ( not ( = ?auto_74208 ?auto_74204 ) ) ( not ( = ?auto_74208 ?auto_74205 ) ) ( not ( = ?auto_74207 ?auto_74204 ) ) ( not ( = ?auto_74207 ?auto_74205 ) ) ( ON ?auto_74206 ?auto_74207 ) ( ON ?auto_74204 ?auto_74206 ) ( ON ?auto_74205 ?auto_74204 ) ( CLEAR ?auto_74205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_74202 ?auto_74203 ?auto_74208 ?auto_74207 ?auto_74206 ?auto_74204 )
      ( MAKE-2PILE ?auto_74202 ?auto_74203 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_74214 - BLOCK
      ?auto_74215 - BLOCK
      ?auto_74216 - BLOCK
      ?auto_74217 - BLOCK
      ?auto_74218 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_74218 ) ( CLEAR ?auto_74217 ) ( ON-TABLE ?auto_74214 ) ( ON ?auto_74215 ?auto_74214 ) ( ON ?auto_74216 ?auto_74215 ) ( ON ?auto_74217 ?auto_74216 ) ( not ( = ?auto_74214 ?auto_74215 ) ) ( not ( = ?auto_74214 ?auto_74216 ) ) ( not ( = ?auto_74214 ?auto_74217 ) ) ( not ( = ?auto_74214 ?auto_74218 ) ) ( not ( = ?auto_74215 ?auto_74216 ) ) ( not ( = ?auto_74215 ?auto_74217 ) ) ( not ( = ?auto_74215 ?auto_74218 ) ) ( not ( = ?auto_74216 ?auto_74217 ) ) ( not ( = ?auto_74216 ?auto_74218 ) ) ( not ( = ?auto_74217 ?auto_74218 ) ) )
    :subtasks
    ( ( !STACK ?auto_74218 ?auto_74217 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_74219 - BLOCK
      ?auto_74220 - BLOCK
      ?auto_74221 - BLOCK
      ?auto_74222 - BLOCK
      ?auto_74223 - BLOCK
    )
    :vars
    (
      ?auto_74224 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_74222 ) ( ON-TABLE ?auto_74219 ) ( ON ?auto_74220 ?auto_74219 ) ( ON ?auto_74221 ?auto_74220 ) ( ON ?auto_74222 ?auto_74221 ) ( not ( = ?auto_74219 ?auto_74220 ) ) ( not ( = ?auto_74219 ?auto_74221 ) ) ( not ( = ?auto_74219 ?auto_74222 ) ) ( not ( = ?auto_74219 ?auto_74223 ) ) ( not ( = ?auto_74220 ?auto_74221 ) ) ( not ( = ?auto_74220 ?auto_74222 ) ) ( not ( = ?auto_74220 ?auto_74223 ) ) ( not ( = ?auto_74221 ?auto_74222 ) ) ( not ( = ?auto_74221 ?auto_74223 ) ) ( not ( = ?auto_74222 ?auto_74223 ) ) ( ON ?auto_74223 ?auto_74224 ) ( CLEAR ?auto_74223 ) ( HAND-EMPTY ) ( not ( = ?auto_74219 ?auto_74224 ) ) ( not ( = ?auto_74220 ?auto_74224 ) ) ( not ( = ?auto_74221 ?auto_74224 ) ) ( not ( = ?auto_74222 ?auto_74224 ) ) ( not ( = ?auto_74223 ?auto_74224 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_74223 ?auto_74224 )
      ( MAKE-5PILE ?auto_74219 ?auto_74220 ?auto_74221 ?auto_74222 ?auto_74223 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_74225 - BLOCK
      ?auto_74226 - BLOCK
      ?auto_74227 - BLOCK
      ?auto_74228 - BLOCK
      ?auto_74229 - BLOCK
    )
    :vars
    (
      ?auto_74230 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74225 ) ( ON ?auto_74226 ?auto_74225 ) ( ON ?auto_74227 ?auto_74226 ) ( not ( = ?auto_74225 ?auto_74226 ) ) ( not ( = ?auto_74225 ?auto_74227 ) ) ( not ( = ?auto_74225 ?auto_74228 ) ) ( not ( = ?auto_74225 ?auto_74229 ) ) ( not ( = ?auto_74226 ?auto_74227 ) ) ( not ( = ?auto_74226 ?auto_74228 ) ) ( not ( = ?auto_74226 ?auto_74229 ) ) ( not ( = ?auto_74227 ?auto_74228 ) ) ( not ( = ?auto_74227 ?auto_74229 ) ) ( not ( = ?auto_74228 ?auto_74229 ) ) ( ON ?auto_74229 ?auto_74230 ) ( CLEAR ?auto_74229 ) ( not ( = ?auto_74225 ?auto_74230 ) ) ( not ( = ?auto_74226 ?auto_74230 ) ) ( not ( = ?auto_74227 ?auto_74230 ) ) ( not ( = ?auto_74228 ?auto_74230 ) ) ( not ( = ?auto_74229 ?auto_74230 ) ) ( HOLDING ?auto_74228 ) ( CLEAR ?auto_74227 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_74225 ?auto_74226 ?auto_74227 ?auto_74228 )
      ( MAKE-5PILE ?auto_74225 ?auto_74226 ?auto_74227 ?auto_74228 ?auto_74229 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_74231 - BLOCK
      ?auto_74232 - BLOCK
      ?auto_74233 - BLOCK
      ?auto_74234 - BLOCK
      ?auto_74235 - BLOCK
    )
    :vars
    (
      ?auto_74236 - BLOCK
      ?auto_74237 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74231 ) ( ON ?auto_74232 ?auto_74231 ) ( ON ?auto_74233 ?auto_74232 ) ( not ( = ?auto_74231 ?auto_74232 ) ) ( not ( = ?auto_74231 ?auto_74233 ) ) ( not ( = ?auto_74231 ?auto_74234 ) ) ( not ( = ?auto_74231 ?auto_74235 ) ) ( not ( = ?auto_74232 ?auto_74233 ) ) ( not ( = ?auto_74232 ?auto_74234 ) ) ( not ( = ?auto_74232 ?auto_74235 ) ) ( not ( = ?auto_74233 ?auto_74234 ) ) ( not ( = ?auto_74233 ?auto_74235 ) ) ( not ( = ?auto_74234 ?auto_74235 ) ) ( ON ?auto_74235 ?auto_74236 ) ( not ( = ?auto_74231 ?auto_74236 ) ) ( not ( = ?auto_74232 ?auto_74236 ) ) ( not ( = ?auto_74233 ?auto_74236 ) ) ( not ( = ?auto_74234 ?auto_74236 ) ) ( not ( = ?auto_74235 ?auto_74236 ) ) ( CLEAR ?auto_74233 ) ( ON ?auto_74234 ?auto_74235 ) ( CLEAR ?auto_74234 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_74237 ) ( ON ?auto_74236 ?auto_74237 ) ( not ( = ?auto_74237 ?auto_74236 ) ) ( not ( = ?auto_74237 ?auto_74235 ) ) ( not ( = ?auto_74237 ?auto_74234 ) ) ( not ( = ?auto_74231 ?auto_74237 ) ) ( not ( = ?auto_74232 ?auto_74237 ) ) ( not ( = ?auto_74233 ?auto_74237 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_74237 ?auto_74236 ?auto_74235 )
      ( MAKE-5PILE ?auto_74231 ?auto_74232 ?auto_74233 ?auto_74234 ?auto_74235 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_74238 - BLOCK
      ?auto_74239 - BLOCK
      ?auto_74240 - BLOCK
      ?auto_74241 - BLOCK
      ?auto_74242 - BLOCK
    )
    :vars
    (
      ?auto_74244 - BLOCK
      ?auto_74243 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74238 ) ( ON ?auto_74239 ?auto_74238 ) ( not ( = ?auto_74238 ?auto_74239 ) ) ( not ( = ?auto_74238 ?auto_74240 ) ) ( not ( = ?auto_74238 ?auto_74241 ) ) ( not ( = ?auto_74238 ?auto_74242 ) ) ( not ( = ?auto_74239 ?auto_74240 ) ) ( not ( = ?auto_74239 ?auto_74241 ) ) ( not ( = ?auto_74239 ?auto_74242 ) ) ( not ( = ?auto_74240 ?auto_74241 ) ) ( not ( = ?auto_74240 ?auto_74242 ) ) ( not ( = ?auto_74241 ?auto_74242 ) ) ( ON ?auto_74242 ?auto_74244 ) ( not ( = ?auto_74238 ?auto_74244 ) ) ( not ( = ?auto_74239 ?auto_74244 ) ) ( not ( = ?auto_74240 ?auto_74244 ) ) ( not ( = ?auto_74241 ?auto_74244 ) ) ( not ( = ?auto_74242 ?auto_74244 ) ) ( ON ?auto_74241 ?auto_74242 ) ( CLEAR ?auto_74241 ) ( ON-TABLE ?auto_74243 ) ( ON ?auto_74244 ?auto_74243 ) ( not ( = ?auto_74243 ?auto_74244 ) ) ( not ( = ?auto_74243 ?auto_74242 ) ) ( not ( = ?auto_74243 ?auto_74241 ) ) ( not ( = ?auto_74238 ?auto_74243 ) ) ( not ( = ?auto_74239 ?auto_74243 ) ) ( not ( = ?auto_74240 ?auto_74243 ) ) ( HOLDING ?auto_74240 ) ( CLEAR ?auto_74239 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_74238 ?auto_74239 ?auto_74240 )
      ( MAKE-5PILE ?auto_74238 ?auto_74239 ?auto_74240 ?auto_74241 ?auto_74242 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_74245 - BLOCK
      ?auto_74246 - BLOCK
      ?auto_74247 - BLOCK
      ?auto_74248 - BLOCK
      ?auto_74249 - BLOCK
    )
    :vars
    (
      ?auto_74250 - BLOCK
      ?auto_74251 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74245 ) ( ON ?auto_74246 ?auto_74245 ) ( not ( = ?auto_74245 ?auto_74246 ) ) ( not ( = ?auto_74245 ?auto_74247 ) ) ( not ( = ?auto_74245 ?auto_74248 ) ) ( not ( = ?auto_74245 ?auto_74249 ) ) ( not ( = ?auto_74246 ?auto_74247 ) ) ( not ( = ?auto_74246 ?auto_74248 ) ) ( not ( = ?auto_74246 ?auto_74249 ) ) ( not ( = ?auto_74247 ?auto_74248 ) ) ( not ( = ?auto_74247 ?auto_74249 ) ) ( not ( = ?auto_74248 ?auto_74249 ) ) ( ON ?auto_74249 ?auto_74250 ) ( not ( = ?auto_74245 ?auto_74250 ) ) ( not ( = ?auto_74246 ?auto_74250 ) ) ( not ( = ?auto_74247 ?auto_74250 ) ) ( not ( = ?auto_74248 ?auto_74250 ) ) ( not ( = ?auto_74249 ?auto_74250 ) ) ( ON ?auto_74248 ?auto_74249 ) ( ON-TABLE ?auto_74251 ) ( ON ?auto_74250 ?auto_74251 ) ( not ( = ?auto_74251 ?auto_74250 ) ) ( not ( = ?auto_74251 ?auto_74249 ) ) ( not ( = ?auto_74251 ?auto_74248 ) ) ( not ( = ?auto_74245 ?auto_74251 ) ) ( not ( = ?auto_74246 ?auto_74251 ) ) ( not ( = ?auto_74247 ?auto_74251 ) ) ( CLEAR ?auto_74246 ) ( ON ?auto_74247 ?auto_74248 ) ( CLEAR ?auto_74247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_74251 ?auto_74250 ?auto_74249 ?auto_74248 )
      ( MAKE-5PILE ?auto_74245 ?auto_74246 ?auto_74247 ?auto_74248 ?auto_74249 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_74252 - BLOCK
      ?auto_74253 - BLOCK
      ?auto_74254 - BLOCK
      ?auto_74255 - BLOCK
      ?auto_74256 - BLOCK
    )
    :vars
    (
      ?auto_74257 - BLOCK
      ?auto_74258 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74252 ) ( not ( = ?auto_74252 ?auto_74253 ) ) ( not ( = ?auto_74252 ?auto_74254 ) ) ( not ( = ?auto_74252 ?auto_74255 ) ) ( not ( = ?auto_74252 ?auto_74256 ) ) ( not ( = ?auto_74253 ?auto_74254 ) ) ( not ( = ?auto_74253 ?auto_74255 ) ) ( not ( = ?auto_74253 ?auto_74256 ) ) ( not ( = ?auto_74254 ?auto_74255 ) ) ( not ( = ?auto_74254 ?auto_74256 ) ) ( not ( = ?auto_74255 ?auto_74256 ) ) ( ON ?auto_74256 ?auto_74257 ) ( not ( = ?auto_74252 ?auto_74257 ) ) ( not ( = ?auto_74253 ?auto_74257 ) ) ( not ( = ?auto_74254 ?auto_74257 ) ) ( not ( = ?auto_74255 ?auto_74257 ) ) ( not ( = ?auto_74256 ?auto_74257 ) ) ( ON ?auto_74255 ?auto_74256 ) ( ON-TABLE ?auto_74258 ) ( ON ?auto_74257 ?auto_74258 ) ( not ( = ?auto_74258 ?auto_74257 ) ) ( not ( = ?auto_74258 ?auto_74256 ) ) ( not ( = ?auto_74258 ?auto_74255 ) ) ( not ( = ?auto_74252 ?auto_74258 ) ) ( not ( = ?auto_74253 ?auto_74258 ) ) ( not ( = ?auto_74254 ?auto_74258 ) ) ( ON ?auto_74254 ?auto_74255 ) ( CLEAR ?auto_74254 ) ( HOLDING ?auto_74253 ) ( CLEAR ?auto_74252 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_74252 ?auto_74253 )
      ( MAKE-5PILE ?auto_74252 ?auto_74253 ?auto_74254 ?auto_74255 ?auto_74256 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_74259 - BLOCK
      ?auto_74260 - BLOCK
      ?auto_74261 - BLOCK
      ?auto_74262 - BLOCK
      ?auto_74263 - BLOCK
    )
    :vars
    (
      ?auto_74265 - BLOCK
      ?auto_74264 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74259 ) ( not ( = ?auto_74259 ?auto_74260 ) ) ( not ( = ?auto_74259 ?auto_74261 ) ) ( not ( = ?auto_74259 ?auto_74262 ) ) ( not ( = ?auto_74259 ?auto_74263 ) ) ( not ( = ?auto_74260 ?auto_74261 ) ) ( not ( = ?auto_74260 ?auto_74262 ) ) ( not ( = ?auto_74260 ?auto_74263 ) ) ( not ( = ?auto_74261 ?auto_74262 ) ) ( not ( = ?auto_74261 ?auto_74263 ) ) ( not ( = ?auto_74262 ?auto_74263 ) ) ( ON ?auto_74263 ?auto_74265 ) ( not ( = ?auto_74259 ?auto_74265 ) ) ( not ( = ?auto_74260 ?auto_74265 ) ) ( not ( = ?auto_74261 ?auto_74265 ) ) ( not ( = ?auto_74262 ?auto_74265 ) ) ( not ( = ?auto_74263 ?auto_74265 ) ) ( ON ?auto_74262 ?auto_74263 ) ( ON-TABLE ?auto_74264 ) ( ON ?auto_74265 ?auto_74264 ) ( not ( = ?auto_74264 ?auto_74265 ) ) ( not ( = ?auto_74264 ?auto_74263 ) ) ( not ( = ?auto_74264 ?auto_74262 ) ) ( not ( = ?auto_74259 ?auto_74264 ) ) ( not ( = ?auto_74260 ?auto_74264 ) ) ( not ( = ?auto_74261 ?auto_74264 ) ) ( ON ?auto_74261 ?auto_74262 ) ( CLEAR ?auto_74259 ) ( ON ?auto_74260 ?auto_74261 ) ( CLEAR ?auto_74260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_74264 ?auto_74265 ?auto_74263 ?auto_74262 ?auto_74261 )
      ( MAKE-5PILE ?auto_74259 ?auto_74260 ?auto_74261 ?auto_74262 ?auto_74263 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_74266 - BLOCK
      ?auto_74267 - BLOCK
      ?auto_74268 - BLOCK
      ?auto_74269 - BLOCK
      ?auto_74270 - BLOCK
    )
    :vars
    (
      ?auto_74271 - BLOCK
      ?auto_74272 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74266 ?auto_74267 ) ) ( not ( = ?auto_74266 ?auto_74268 ) ) ( not ( = ?auto_74266 ?auto_74269 ) ) ( not ( = ?auto_74266 ?auto_74270 ) ) ( not ( = ?auto_74267 ?auto_74268 ) ) ( not ( = ?auto_74267 ?auto_74269 ) ) ( not ( = ?auto_74267 ?auto_74270 ) ) ( not ( = ?auto_74268 ?auto_74269 ) ) ( not ( = ?auto_74268 ?auto_74270 ) ) ( not ( = ?auto_74269 ?auto_74270 ) ) ( ON ?auto_74270 ?auto_74271 ) ( not ( = ?auto_74266 ?auto_74271 ) ) ( not ( = ?auto_74267 ?auto_74271 ) ) ( not ( = ?auto_74268 ?auto_74271 ) ) ( not ( = ?auto_74269 ?auto_74271 ) ) ( not ( = ?auto_74270 ?auto_74271 ) ) ( ON ?auto_74269 ?auto_74270 ) ( ON-TABLE ?auto_74272 ) ( ON ?auto_74271 ?auto_74272 ) ( not ( = ?auto_74272 ?auto_74271 ) ) ( not ( = ?auto_74272 ?auto_74270 ) ) ( not ( = ?auto_74272 ?auto_74269 ) ) ( not ( = ?auto_74266 ?auto_74272 ) ) ( not ( = ?auto_74267 ?auto_74272 ) ) ( not ( = ?auto_74268 ?auto_74272 ) ) ( ON ?auto_74268 ?auto_74269 ) ( ON ?auto_74267 ?auto_74268 ) ( CLEAR ?auto_74267 ) ( HOLDING ?auto_74266 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_74266 )
      ( MAKE-5PILE ?auto_74266 ?auto_74267 ?auto_74268 ?auto_74269 ?auto_74270 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_74273 - BLOCK
      ?auto_74274 - BLOCK
      ?auto_74275 - BLOCK
      ?auto_74276 - BLOCK
      ?auto_74277 - BLOCK
    )
    :vars
    (
      ?auto_74279 - BLOCK
      ?auto_74278 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74273 ?auto_74274 ) ) ( not ( = ?auto_74273 ?auto_74275 ) ) ( not ( = ?auto_74273 ?auto_74276 ) ) ( not ( = ?auto_74273 ?auto_74277 ) ) ( not ( = ?auto_74274 ?auto_74275 ) ) ( not ( = ?auto_74274 ?auto_74276 ) ) ( not ( = ?auto_74274 ?auto_74277 ) ) ( not ( = ?auto_74275 ?auto_74276 ) ) ( not ( = ?auto_74275 ?auto_74277 ) ) ( not ( = ?auto_74276 ?auto_74277 ) ) ( ON ?auto_74277 ?auto_74279 ) ( not ( = ?auto_74273 ?auto_74279 ) ) ( not ( = ?auto_74274 ?auto_74279 ) ) ( not ( = ?auto_74275 ?auto_74279 ) ) ( not ( = ?auto_74276 ?auto_74279 ) ) ( not ( = ?auto_74277 ?auto_74279 ) ) ( ON ?auto_74276 ?auto_74277 ) ( ON-TABLE ?auto_74278 ) ( ON ?auto_74279 ?auto_74278 ) ( not ( = ?auto_74278 ?auto_74279 ) ) ( not ( = ?auto_74278 ?auto_74277 ) ) ( not ( = ?auto_74278 ?auto_74276 ) ) ( not ( = ?auto_74273 ?auto_74278 ) ) ( not ( = ?auto_74274 ?auto_74278 ) ) ( not ( = ?auto_74275 ?auto_74278 ) ) ( ON ?auto_74275 ?auto_74276 ) ( ON ?auto_74274 ?auto_74275 ) ( ON ?auto_74273 ?auto_74274 ) ( CLEAR ?auto_74273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_74278 ?auto_74279 ?auto_74277 ?auto_74276 ?auto_74275 ?auto_74274 )
      ( MAKE-5PILE ?auto_74273 ?auto_74274 ?auto_74275 ?auto_74276 ?auto_74277 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74281 - BLOCK
    )
    :vars
    (
      ?auto_74282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74282 ?auto_74281 ) ( CLEAR ?auto_74282 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_74281 ) ( not ( = ?auto_74281 ?auto_74282 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_74282 ?auto_74281 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74283 - BLOCK
    )
    :vars
    (
      ?auto_74284 - BLOCK
      ?auto_74285 - BLOCK
      ?auto_74286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74284 ?auto_74283 ) ( CLEAR ?auto_74284 ) ( ON-TABLE ?auto_74283 ) ( not ( = ?auto_74283 ?auto_74284 ) ) ( HOLDING ?auto_74285 ) ( CLEAR ?auto_74286 ) ( not ( = ?auto_74283 ?auto_74285 ) ) ( not ( = ?auto_74283 ?auto_74286 ) ) ( not ( = ?auto_74284 ?auto_74285 ) ) ( not ( = ?auto_74284 ?auto_74286 ) ) ( not ( = ?auto_74285 ?auto_74286 ) ) )
    :subtasks
    ( ( !STACK ?auto_74285 ?auto_74286 )
      ( MAKE-1PILE ?auto_74283 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74287 - BLOCK
    )
    :vars
    (
      ?auto_74288 - BLOCK
      ?auto_74290 - BLOCK
      ?auto_74289 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74288 ?auto_74287 ) ( ON-TABLE ?auto_74287 ) ( not ( = ?auto_74287 ?auto_74288 ) ) ( CLEAR ?auto_74290 ) ( not ( = ?auto_74287 ?auto_74289 ) ) ( not ( = ?auto_74287 ?auto_74290 ) ) ( not ( = ?auto_74288 ?auto_74289 ) ) ( not ( = ?auto_74288 ?auto_74290 ) ) ( not ( = ?auto_74289 ?auto_74290 ) ) ( ON ?auto_74289 ?auto_74288 ) ( CLEAR ?auto_74289 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_74287 ?auto_74288 )
      ( MAKE-1PILE ?auto_74287 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74291 - BLOCK
    )
    :vars
    (
      ?auto_74292 - BLOCK
      ?auto_74294 - BLOCK
      ?auto_74293 - BLOCK
      ?auto_74295 - BLOCK
      ?auto_74297 - BLOCK
      ?auto_74296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74292 ?auto_74291 ) ( ON-TABLE ?auto_74291 ) ( not ( = ?auto_74291 ?auto_74292 ) ) ( not ( = ?auto_74291 ?auto_74294 ) ) ( not ( = ?auto_74291 ?auto_74293 ) ) ( not ( = ?auto_74292 ?auto_74294 ) ) ( not ( = ?auto_74292 ?auto_74293 ) ) ( not ( = ?auto_74294 ?auto_74293 ) ) ( ON ?auto_74294 ?auto_74292 ) ( CLEAR ?auto_74294 ) ( HOLDING ?auto_74293 ) ( CLEAR ?auto_74295 ) ( ON-TABLE ?auto_74297 ) ( ON ?auto_74296 ?auto_74297 ) ( ON ?auto_74295 ?auto_74296 ) ( not ( = ?auto_74297 ?auto_74296 ) ) ( not ( = ?auto_74297 ?auto_74295 ) ) ( not ( = ?auto_74297 ?auto_74293 ) ) ( not ( = ?auto_74296 ?auto_74295 ) ) ( not ( = ?auto_74296 ?auto_74293 ) ) ( not ( = ?auto_74295 ?auto_74293 ) ) ( not ( = ?auto_74291 ?auto_74295 ) ) ( not ( = ?auto_74291 ?auto_74297 ) ) ( not ( = ?auto_74291 ?auto_74296 ) ) ( not ( = ?auto_74292 ?auto_74295 ) ) ( not ( = ?auto_74292 ?auto_74297 ) ) ( not ( = ?auto_74292 ?auto_74296 ) ) ( not ( = ?auto_74294 ?auto_74295 ) ) ( not ( = ?auto_74294 ?auto_74297 ) ) ( not ( = ?auto_74294 ?auto_74296 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_74297 ?auto_74296 ?auto_74295 ?auto_74293 )
      ( MAKE-1PILE ?auto_74291 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74298 - BLOCK
    )
    :vars
    (
      ?auto_74301 - BLOCK
      ?auto_74304 - BLOCK
      ?auto_74303 - BLOCK
      ?auto_74302 - BLOCK
      ?auto_74299 - BLOCK
      ?auto_74300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74301 ?auto_74298 ) ( ON-TABLE ?auto_74298 ) ( not ( = ?auto_74298 ?auto_74301 ) ) ( not ( = ?auto_74298 ?auto_74304 ) ) ( not ( = ?auto_74298 ?auto_74303 ) ) ( not ( = ?auto_74301 ?auto_74304 ) ) ( not ( = ?auto_74301 ?auto_74303 ) ) ( not ( = ?auto_74304 ?auto_74303 ) ) ( ON ?auto_74304 ?auto_74301 ) ( CLEAR ?auto_74302 ) ( ON-TABLE ?auto_74299 ) ( ON ?auto_74300 ?auto_74299 ) ( ON ?auto_74302 ?auto_74300 ) ( not ( = ?auto_74299 ?auto_74300 ) ) ( not ( = ?auto_74299 ?auto_74302 ) ) ( not ( = ?auto_74299 ?auto_74303 ) ) ( not ( = ?auto_74300 ?auto_74302 ) ) ( not ( = ?auto_74300 ?auto_74303 ) ) ( not ( = ?auto_74302 ?auto_74303 ) ) ( not ( = ?auto_74298 ?auto_74302 ) ) ( not ( = ?auto_74298 ?auto_74299 ) ) ( not ( = ?auto_74298 ?auto_74300 ) ) ( not ( = ?auto_74301 ?auto_74302 ) ) ( not ( = ?auto_74301 ?auto_74299 ) ) ( not ( = ?auto_74301 ?auto_74300 ) ) ( not ( = ?auto_74304 ?auto_74302 ) ) ( not ( = ?auto_74304 ?auto_74299 ) ) ( not ( = ?auto_74304 ?auto_74300 ) ) ( ON ?auto_74303 ?auto_74304 ) ( CLEAR ?auto_74303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_74298 ?auto_74301 ?auto_74304 )
      ( MAKE-1PILE ?auto_74298 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74305 - BLOCK
    )
    :vars
    (
      ?auto_74311 - BLOCK
      ?auto_74308 - BLOCK
      ?auto_74309 - BLOCK
      ?auto_74310 - BLOCK
      ?auto_74306 - BLOCK
      ?auto_74307 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74311 ?auto_74305 ) ( ON-TABLE ?auto_74305 ) ( not ( = ?auto_74305 ?auto_74311 ) ) ( not ( = ?auto_74305 ?auto_74308 ) ) ( not ( = ?auto_74305 ?auto_74309 ) ) ( not ( = ?auto_74311 ?auto_74308 ) ) ( not ( = ?auto_74311 ?auto_74309 ) ) ( not ( = ?auto_74308 ?auto_74309 ) ) ( ON ?auto_74308 ?auto_74311 ) ( ON-TABLE ?auto_74310 ) ( ON ?auto_74306 ?auto_74310 ) ( not ( = ?auto_74310 ?auto_74306 ) ) ( not ( = ?auto_74310 ?auto_74307 ) ) ( not ( = ?auto_74310 ?auto_74309 ) ) ( not ( = ?auto_74306 ?auto_74307 ) ) ( not ( = ?auto_74306 ?auto_74309 ) ) ( not ( = ?auto_74307 ?auto_74309 ) ) ( not ( = ?auto_74305 ?auto_74307 ) ) ( not ( = ?auto_74305 ?auto_74310 ) ) ( not ( = ?auto_74305 ?auto_74306 ) ) ( not ( = ?auto_74311 ?auto_74307 ) ) ( not ( = ?auto_74311 ?auto_74310 ) ) ( not ( = ?auto_74311 ?auto_74306 ) ) ( not ( = ?auto_74308 ?auto_74307 ) ) ( not ( = ?auto_74308 ?auto_74310 ) ) ( not ( = ?auto_74308 ?auto_74306 ) ) ( ON ?auto_74309 ?auto_74308 ) ( CLEAR ?auto_74309 ) ( HOLDING ?auto_74307 ) ( CLEAR ?auto_74306 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_74310 ?auto_74306 ?auto_74307 )
      ( MAKE-1PILE ?auto_74305 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74312 - BLOCK
    )
    :vars
    (
      ?auto_74315 - BLOCK
      ?auto_74317 - BLOCK
      ?auto_74316 - BLOCK
      ?auto_74314 - BLOCK
      ?auto_74313 - BLOCK
      ?auto_74318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74315 ?auto_74312 ) ( ON-TABLE ?auto_74312 ) ( not ( = ?auto_74312 ?auto_74315 ) ) ( not ( = ?auto_74312 ?auto_74317 ) ) ( not ( = ?auto_74312 ?auto_74316 ) ) ( not ( = ?auto_74315 ?auto_74317 ) ) ( not ( = ?auto_74315 ?auto_74316 ) ) ( not ( = ?auto_74317 ?auto_74316 ) ) ( ON ?auto_74317 ?auto_74315 ) ( ON-TABLE ?auto_74314 ) ( ON ?auto_74313 ?auto_74314 ) ( not ( = ?auto_74314 ?auto_74313 ) ) ( not ( = ?auto_74314 ?auto_74318 ) ) ( not ( = ?auto_74314 ?auto_74316 ) ) ( not ( = ?auto_74313 ?auto_74318 ) ) ( not ( = ?auto_74313 ?auto_74316 ) ) ( not ( = ?auto_74318 ?auto_74316 ) ) ( not ( = ?auto_74312 ?auto_74318 ) ) ( not ( = ?auto_74312 ?auto_74314 ) ) ( not ( = ?auto_74312 ?auto_74313 ) ) ( not ( = ?auto_74315 ?auto_74318 ) ) ( not ( = ?auto_74315 ?auto_74314 ) ) ( not ( = ?auto_74315 ?auto_74313 ) ) ( not ( = ?auto_74317 ?auto_74318 ) ) ( not ( = ?auto_74317 ?auto_74314 ) ) ( not ( = ?auto_74317 ?auto_74313 ) ) ( ON ?auto_74316 ?auto_74317 ) ( CLEAR ?auto_74313 ) ( ON ?auto_74318 ?auto_74316 ) ( CLEAR ?auto_74318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_74312 ?auto_74315 ?auto_74317 ?auto_74316 )
      ( MAKE-1PILE ?auto_74312 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74319 - BLOCK
    )
    :vars
    (
      ?auto_74321 - BLOCK
      ?auto_74322 - BLOCK
      ?auto_74325 - BLOCK
      ?auto_74320 - BLOCK
      ?auto_74323 - BLOCK
      ?auto_74324 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74321 ?auto_74319 ) ( ON-TABLE ?auto_74319 ) ( not ( = ?auto_74319 ?auto_74321 ) ) ( not ( = ?auto_74319 ?auto_74322 ) ) ( not ( = ?auto_74319 ?auto_74325 ) ) ( not ( = ?auto_74321 ?auto_74322 ) ) ( not ( = ?auto_74321 ?auto_74325 ) ) ( not ( = ?auto_74322 ?auto_74325 ) ) ( ON ?auto_74322 ?auto_74321 ) ( ON-TABLE ?auto_74320 ) ( not ( = ?auto_74320 ?auto_74323 ) ) ( not ( = ?auto_74320 ?auto_74324 ) ) ( not ( = ?auto_74320 ?auto_74325 ) ) ( not ( = ?auto_74323 ?auto_74324 ) ) ( not ( = ?auto_74323 ?auto_74325 ) ) ( not ( = ?auto_74324 ?auto_74325 ) ) ( not ( = ?auto_74319 ?auto_74324 ) ) ( not ( = ?auto_74319 ?auto_74320 ) ) ( not ( = ?auto_74319 ?auto_74323 ) ) ( not ( = ?auto_74321 ?auto_74324 ) ) ( not ( = ?auto_74321 ?auto_74320 ) ) ( not ( = ?auto_74321 ?auto_74323 ) ) ( not ( = ?auto_74322 ?auto_74324 ) ) ( not ( = ?auto_74322 ?auto_74320 ) ) ( not ( = ?auto_74322 ?auto_74323 ) ) ( ON ?auto_74325 ?auto_74322 ) ( ON ?auto_74324 ?auto_74325 ) ( CLEAR ?auto_74324 ) ( HOLDING ?auto_74323 ) ( CLEAR ?auto_74320 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_74320 ?auto_74323 )
      ( MAKE-1PILE ?auto_74319 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74326 - BLOCK
    )
    :vars
    (
      ?auto_74332 - BLOCK
      ?auto_74330 - BLOCK
      ?auto_74327 - BLOCK
      ?auto_74328 - BLOCK
      ?auto_74329 - BLOCK
      ?auto_74331 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74332 ?auto_74326 ) ( ON-TABLE ?auto_74326 ) ( not ( = ?auto_74326 ?auto_74332 ) ) ( not ( = ?auto_74326 ?auto_74330 ) ) ( not ( = ?auto_74326 ?auto_74327 ) ) ( not ( = ?auto_74332 ?auto_74330 ) ) ( not ( = ?auto_74332 ?auto_74327 ) ) ( not ( = ?auto_74330 ?auto_74327 ) ) ( ON ?auto_74330 ?auto_74332 ) ( ON-TABLE ?auto_74328 ) ( not ( = ?auto_74328 ?auto_74329 ) ) ( not ( = ?auto_74328 ?auto_74331 ) ) ( not ( = ?auto_74328 ?auto_74327 ) ) ( not ( = ?auto_74329 ?auto_74331 ) ) ( not ( = ?auto_74329 ?auto_74327 ) ) ( not ( = ?auto_74331 ?auto_74327 ) ) ( not ( = ?auto_74326 ?auto_74331 ) ) ( not ( = ?auto_74326 ?auto_74328 ) ) ( not ( = ?auto_74326 ?auto_74329 ) ) ( not ( = ?auto_74332 ?auto_74331 ) ) ( not ( = ?auto_74332 ?auto_74328 ) ) ( not ( = ?auto_74332 ?auto_74329 ) ) ( not ( = ?auto_74330 ?auto_74331 ) ) ( not ( = ?auto_74330 ?auto_74328 ) ) ( not ( = ?auto_74330 ?auto_74329 ) ) ( ON ?auto_74327 ?auto_74330 ) ( ON ?auto_74331 ?auto_74327 ) ( CLEAR ?auto_74328 ) ( ON ?auto_74329 ?auto_74331 ) ( CLEAR ?auto_74329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_74326 ?auto_74332 ?auto_74330 ?auto_74327 ?auto_74331 )
      ( MAKE-1PILE ?auto_74326 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74333 - BLOCK
    )
    :vars
    (
      ?auto_74336 - BLOCK
      ?auto_74338 - BLOCK
      ?auto_74337 - BLOCK
      ?auto_74334 - BLOCK
      ?auto_74335 - BLOCK
      ?auto_74339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74336 ?auto_74333 ) ( ON-TABLE ?auto_74333 ) ( not ( = ?auto_74333 ?auto_74336 ) ) ( not ( = ?auto_74333 ?auto_74338 ) ) ( not ( = ?auto_74333 ?auto_74337 ) ) ( not ( = ?auto_74336 ?auto_74338 ) ) ( not ( = ?auto_74336 ?auto_74337 ) ) ( not ( = ?auto_74338 ?auto_74337 ) ) ( ON ?auto_74338 ?auto_74336 ) ( not ( = ?auto_74334 ?auto_74335 ) ) ( not ( = ?auto_74334 ?auto_74339 ) ) ( not ( = ?auto_74334 ?auto_74337 ) ) ( not ( = ?auto_74335 ?auto_74339 ) ) ( not ( = ?auto_74335 ?auto_74337 ) ) ( not ( = ?auto_74339 ?auto_74337 ) ) ( not ( = ?auto_74333 ?auto_74339 ) ) ( not ( = ?auto_74333 ?auto_74334 ) ) ( not ( = ?auto_74333 ?auto_74335 ) ) ( not ( = ?auto_74336 ?auto_74339 ) ) ( not ( = ?auto_74336 ?auto_74334 ) ) ( not ( = ?auto_74336 ?auto_74335 ) ) ( not ( = ?auto_74338 ?auto_74339 ) ) ( not ( = ?auto_74338 ?auto_74334 ) ) ( not ( = ?auto_74338 ?auto_74335 ) ) ( ON ?auto_74337 ?auto_74338 ) ( ON ?auto_74339 ?auto_74337 ) ( ON ?auto_74335 ?auto_74339 ) ( CLEAR ?auto_74335 ) ( HOLDING ?auto_74334 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_74334 )
      ( MAKE-1PILE ?auto_74333 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74340 - BLOCK
    )
    :vars
    (
      ?auto_74345 - BLOCK
      ?auto_74342 - BLOCK
      ?auto_74346 - BLOCK
      ?auto_74343 - BLOCK
      ?auto_74344 - BLOCK
      ?auto_74341 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74345 ?auto_74340 ) ( ON-TABLE ?auto_74340 ) ( not ( = ?auto_74340 ?auto_74345 ) ) ( not ( = ?auto_74340 ?auto_74342 ) ) ( not ( = ?auto_74340 ?auto_74346 ) ) ( not ( = ?auto_74345 ?auto_74342 ) ) ( not ( = ?auto_74345 ?auto_74346 ) ) ( not ( = ?auto_74342 ?auto_74346 ) ) ( ON ?auto_74342 ?auto_74345 ) ( not ( = ?auto_74343 ?auto_74344 ) ) ( not ( = ?auto_74343 ?auto_74341 ) ) ( not ( = ?auto_74343 ?auto_74346 ) ) ( not ( = ?auto_74344 ?auto_74341 ) ) ( not ( = ?auto_74344 ?auto_74346 ) ) ( not ( = ?auto_74341 ?auto_74346 ) ) ( not ( = ?auto_74340 ?auto_74341 ) ) ( not ( = ?auto_74340 ?auto_74343 ) ) ( not ( = ?auto_74340 ?auto_74344 ) ) ( not ( = ?auto_74345 ?auto_74341 ) ) ( not ( = ?auto_74345 ?auto_74343 ) ) ( not ( = ?auto_74345 ?auto_74344 ) ) ( not ( = ?auto_74342 ?auto_74341 ) ) ( not ( = ?auto_74342 ?auto_74343 ) ) ( not ( = ?auto_74342 ?auto_74344 ) ) ( ON ?auto_74346 ?auto_74342 ) ( ON ?auto_74341 ?auto_74346 ) ( ON ?auto_74344 ?auto_74341 ) ( ON ?auto_74343 ?auto_74344 ) ( CLEAR ?auto_74343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_74340 ?auto_74345 ?auto_74342 ?auto_74346 ?auto_74341 ?auto_74344 )
      ( MAKE-1PILE ?auto_74340 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_74353 - BLOCK
      ?auto_74354 - BLOCK
      ?auto_74355 - BLOCK
      ?auto_74356 - BLOCK
      ?auto_74357 - BLOCK
      ?auto_74358 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_74358 ) ( CLEAR ?auto_74357 ) ( ON-TABLE ?auto_74353 ) ( ON ?auto_74354 ?auto_74353 ) ( ON ?auto_74355 ?auto_74354 ) ( ON ?auto_74356 ?auto_74355 ) ( ON ?auto_74357 ?auto_74356 ) ( not ( = ?auto_74353 ?auto_74354 ) ) ( not ( = ?auto_74353 ?auto_74355 ) ) ( not ( = ?auto_74353 ?auto_74356 ) ) ( not ( = ?auto_74353 ?auto_74357 ) ) ( not ( = ?auto_74353 ?auto_74358 ) ) ( not ( = ?auto_74354 ?auto_74355 ) ) ( not ( = ?auto_74354 ?auto_74356 ) ) ( not ( = ?auto_74354 ?auto_74357 ) ) ( not ( = ?auto_74354 ?auto_74358 ) ) ( not ( = ?auto_74355 ?auto_74356 ) ) ( not ( = ?auto_74355 ?auto_74357 ) ) ( not ( = ?auto_74355 ?auto_74358 ) ) ( not ( = ?auto_74356 ?auto_74357 ) ) ( not ( = ?auto_74356 ?auto_74358 ) ) ( not ( = ?auto_74357 ?auto_74358 ) ) )
    :subtasks
    ( ( !STACK ?auto_74358 ?auto_74357 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_74359 - BLOCK
      ?auto_74360 - BLOCK
      ?auto_74361 - BLOCK
      ?auto_74362 - BLOCK
      ?auto_74363 - BLOCK
      ?auto_74364 - BLOCK
    )
    :vars
    (
      ?auto_74365 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_74363 ) ( ON-TABLE ?auto_74359 ) ( ON ?auto_74360 ?auto_74359 ) ( ON ?auto_74361 ?auto_74360 ) ( ON ?auto_74362 ?auto_74361 ) ( ON ?auto_74363 ?auto_74362 ) ( not ( = ?auto_74359 ?auto_74360 ) ) ( not ( = ?auto_74359 ?auto_74361 ) ) ( not ( = ?auto_74359 ?auto_74362 ) ) ( not ( = ?auto_74359 ?auto_74363 ) ) ( not ( = ?auto_74359 ?auto_74364 ) ) ( not ( = ?auto_74360 ?auto_74361 ) ) ( not ( = ?auto_74360 ?auto_74362 ) ) ( not ( = ?auto_74360 ?auto_74363 ) ) ( not ( = ?auto_74360 ?auto_74364 ) ) ( not ( = ?auto_74361 ?auto_74362 ) ) ( not ( = ?auto_74361 ?auto_74363 ) ) ( not ( = ?auto_74361 ?auto_74364 ) ) ( not ( = ?auto_74362 ?auto_74363 ) ) ( not ( = ?auto_74362 ?auto_74364 ) ) ( not ( = ?auto_74363 ?auto_74364 ) ) ( ON ?auto_74364 ?auto_74365 ) ( CLEAR ?auto_74364 ) ( HAND-EMPTY ) ( not ( = ?auto_74359 ?auto_74365 ) ) ( not ( = ?auto_74360 ?auto_74365 ) ) ( not ( = ?auto_74361 ?auto_74365 ) ) ( not ( = ?auto_74362 ?auto_74365 ) ) ( not ( = ?auto_74363 ?auto_74365 ) ) ( not ( = ?auto_74364 ?auto_74365 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_74364 ?auto_74365 )
      ( MAKE-6PILE ?auto_74359 ?auto_74360 ?auto_74361 ?auto_74362 ?auto_74363 ?auto_74364 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_74366 - BLOCK
      ?auto_74367 - BLOCK
      ?auto_74368 - BLOCK
      ?auto_74369 - BLOCK
      ?auto_74370 - BLOCK
      ?auto_74371 - BLOCK
    )
    :vars
    (
      ?auto_74372 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74366 ) ( ON ?auto_74367 ?auto_74366 ) ( ON ?auto_74368 ?auto_74367 ) ( ON ?auto_74369 ?auto_74368 ) ( not ( = ?auto_74366 ?auto_74367 ) ) ( not ( = ?auto_74366 ?auto_74368 ) ) ( not ( = ?auto_74366 ?auto_74369 ) ) ( not ( = ?auto_74366 ?auto_74370 ) ) ( not ( = ?auto_74366 ?auto_74371 ) ) ( not ( = ?auto_74367 ?auto_74368 ) ) ( not ( = ?auto_74367 ?auto_74369 ) ) ( not ( = ?auto_74367 ?auto_74370 ) ) ( not ( = ?auto_74367 ?auto_74371 ) ) ( not ( = ?auto_74368 ?auto_74369 ) ) ( not ( = ?auto_74368 ?auto_74370 ) ) ( not ( = ?auto_74368 ?auto_74371 ) ) ( not ( = ?auto_74369 ?auto_74370 ) ) ( not ( = ?auto_74369 ?auto_74371 ) ) ( not ( = ?auto_74370 ?auto_74371 ) ) ( ON ?auto_74371 ?auto_74372 ) ( CLEAR ?auto_74371 ) ( not ( = ?auto_74366 ?auto_74372 ) ) ( not ( = ?auto_74367 ?auto_74372 ) ) ( not ( = ?auto_74368 ?auto_74372 ) ) ( not ( = ?auto_74369 ?auto_74372 ) ) ( not ( = ?auto_74370 ?auto_74372 ) ) ( not ( = ?auto_74371 ?auto_74372 ) ) ( HOLDING ?auto_74370 ) ( CLEAR ?auto_74369 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_74366 ?auto_74367 ?auto_74368 ?auto_74369 ?auto_74370 )
      ( MAKE-6PILE ?auto_74366 ?auto_74367 ?auto_74368 ?auto_74369 ?auto_74370 ?auto_74371 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_74373 - BLOCK
      ?auto_74374 - BLOCK
      ?auto_74375 - BLOCK
      ?auto_74376 - BLOCK
      ?auto_74377 - BLOCK
      ?auto_74378 - BLOCK
    )
    :vars
    (
      ?auto_74379 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74373 ) ( ON ?auto_74374 ?auto_74373 ) ( ON ?auto_74375 ?auto_74374 ) ( ON ?auto_74376 ?auto_74375 ) ( not ( = ?auto_74373 ?auto_74374 ) ) ( not ( = ?auto_74373 ?auto_74375 ) ) ( not ( = ?auto_74373 ?auto_74376 ) ) ( not ( = ?auto_74373 ?auto_74377 ) ) ( not ( = ?auto_74373 ?auto_74378 ) ) ( not ( = ?auto_74374 ?auto_74375 ) ) ( not ( = ?auto_74374 ?auto_74376 ) ) ( not ( = ?auto_74374 ?auto_74377 ) ) ( not ( = ?auto_74374 ?auto_74378 ) ) ( not ( = ?auto_74375 ?auto_74376 ) ) ( not ( = ?auto_74375 ?auto_74377 ) ) ( not ( = ?auto_74375 ?auto_74378 ) ) ( not ( = ?auto_74376 ?auto_74377 ) ) ( not ( = ?auto_74376 ?auto_74378 ) ) ( not ( = ?auto_74377 ?auto_74378 ) ) ( ON ?auto_74378 ?auto_74379 ) ( not ( = ?auto_74373 ?auto_74379 ) ) ( not ( = ?auto_74374 ?auto_74379 ) ) ( not ( = ?auto_74375 ?auto_74379 ) ) ( not ( = ?auto_74376 ?auto_74379 ) ) ( not ( = ?auto_74377 ?auto_74379 ) ) ( not ( = ?auto_74378 ?auto_74379 ) ) ( CLEAR ?auto_74376 ) ( ON ?auto_74377 ?auto_74378 ) ( CLEAR ?auto_74377 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_74379 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_74379 ?auto_74378 )
      ( MAKE-6PILE ?auto_74373 ?auto_74374 ?auto_74375 ?auto_74376 ?auto_74377 ?auto_74378 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_74380 - BLOCK
      ?auto_74381 - BLOCK
      ?auto_74382 - BLOCK
      ?auto_74383 - BLOCK
      ?auto_74384 - BLOCK
      ?auto_74385 - BLOCK
    )
    :vars
    (
      ?auto_74386 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74380 ) ( ON ?auto_74381 ?auto_74380 ) ( ON ?auto_74382 ?auto_74381 ) ( not ( = ?auto_74380 ?auto_74381 ) ) ( not ( = ?auto_74380 ?auto_74382 ) ) ( not ( = ?auto_74380 ?auto_74383 ) ) ( not ( = ?auto_74380 ?auto_74384 ) ) ( not ( = ?auto_74380 ?auto_74385 ) ) ( not ( = ?auto_74381 ?auto_74382 ) ) ( not ( = ?auto_74381 ?auto_74383 ) ) ( not ( = ?auto_74381 ?auto_74384 ) ) ( not ( = ?auto_74381 ?auto_74385 ) ) ( not ( = ?auto_74382 ?auto_74383 ) ) ( not ( = ?auto_74382 ?auto_74384 ) ) ( not ( = ?auto_74382 ?auto_74385 ) ) ( not ( = ?auto_74383 ?auto_74384 ) ) ( not ( = ?auto_74383 ?auto_74385 ) ) ( not ( = ?auto_74384 ?auto_74385 ) ) ( ON ?auto_74385 ?auto_74386 ) ( not ( = ?auto_74380 ?auto_74386 ) ) ( not ( = ?auto_74381 ?auto_74386 ) ) ( not ( = ?auto_74382 ?auto_74386 ) ) ( not ( = ?auto_74383 ?auto_74386 ) ) ( not ( = ?auto_74384 ?auto_74386 ) ) ( not ( = ?auto_74385 ?auto_74386 ) ) ( ON ?auto_74384 ?auto_74385 ) ( CLEAR ?auto_74384 ) ( ON-TABLE ?auto_74386 ) ( HOLDING ?auto_74383 ) ( CLEAR ?auto_74382 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_74380 ?auto_74381 ?auto_74382 ?auto_74383 )
      ( MAKE-6PILE ?auto_74380 ?auto_74381 ?auto_74382 ?auto_74383 ?auto_74384 ?auto_74385 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_74387 - BLOCK
      ?auto_74388 - BLOCK
      ?auto_74389 - BLOCK
      ?auto_74390 - BLOCK
      ?auto_74391 - BLOCK
      ?auto_74392 - BLOCK
    )
    :vars
    (
      ?auto_74393 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74387 ) ( ON ?auto_74388 ?auto_74387 ) ( ON ?auto_74389 ?auto_74388 ) ( not ( = ?auto_74387 ?auto_74388 ) ) ( not ( = ?auto_74387 ?auto_74389 ) ) ( not ( = ?auto_74387 ?auto_74390 ) ) ( not ( = ?auto_74387 ?auto_74391 ) ) ( not ( = ?auto_74387 ?auto_74392 ) ) ( not ( = ?auto_74388 ?auto_74389 ) ) ( not ( = ?auto_74388 ?auto_74390 ) ) ( not ( = ?auto_74388 ?auto_74391 ) ) ( not ( = ?auto_74388 ?auto_74392 ) ) ( not ( = ?auto_74389 ?auto_74390 ) ) ( not ( = ?auto_74389 ?auto_74391 ) ) ( not ( = ?auto_74389 ?auto_74392 ) ) ( not ( = ?auto_74390 ?auto_74391 ) ) ( not ( = ?auto_74390 ?auto_74392 ) ) ( not ( = ?auto_74391 ?auto_74392 ) ) ( ON ?auto_74392 ?auto_74393 ) ( not ( = ?auto_74387 ?auto_74393 ) ) ( not ( = ?auto_74388 ?auto_74393 ) ) ( not ( = ?auto_74389 ?auto_74393 ) ) ( not ( = ?auto_74390 ?auto_74393 ) ) ( not ( = ?auto_74391 ?auto_74393 ) ) ( not ( = ?auto_74392 ?auto_74393 ) ) ( ON ?auto_74391 ?auto_74392 ) ( ON-TABLE ?auto_74393 ) ( CLEAR ?auto_74389 ) ( ON ?auto_74390 ?auto_74391 ) ( CLEAR ?auto_74390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_74393 ?auto_74392 ?auto_74391 )
      ( MAKE-6PILE ?auto_74387 ?auto_74388 ?auto_74389 ?auto_74390 ?auto_74391 ?auto_74392 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_74394 - BLOCK
      ?auto_74395 - BLOCK
      ?auto_74396 - BLOCK
      ?auto_74397 - BLOCK
      ?auto_74398 - BLOCK
      ?auto_74399 - BLOCK
    )
    :vars
    (
      ?auto_74400 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74394 ) ( ON ?auto_74395 ?auto_74394 ) ( not ( = ?auto_74394 ?auto_74395 ) ) ( not ( = ?auto_74394 ?auto_74396 ) ) ( not ( = ?auto_74394 ?auto_74397 ) ) ( not ( = ?auto_74394 ?auto_74398 ) ) ( not ( = ?auto_74394 ?auto_74399 ) ) ( not ( = ?auto_74395 ?auto_74396 ) ) ( not ( = ?auto_74395 ?auto_74397 ) ) ( not ( = ?auto_74395 ?auto_74398 ) ) ( not ( = ?auto_74395 ?auto_74399 ) ) ( not ( = ?auto_74396 ?auto_74397 ) ) ( not ( = ?auto_74396 ?auto_74398 ) ) ( not ( = ?auto_74396 ?auto_74399 ) ) ( not ( = ?auto_74397 ?auto_74398 ) ) ( not ( = ?auto_74397 ?auto_74399 ) ) ( not ( = ?auto_74398 ?auto_74399 ) ) ( ON ?auto_74399 ?auto_74400 ) ( not ( = ?auto_74394 ?auto_74400 ) ) ( not ( = ?auto_74395 ?auto_74400 ) ) ( not ( = ?auto_74396 ?auto_74400 ) ) ( not ( = ?auto_74397 ?auto_74400 ) ) ( not ( = ?auto_74398 ?auto_74400 ) ) ( not ( = ?auto_74399 ?auto_74400 ) ) ( ON ?auto_74398 ?auto_74399 ) ( ON-TABLE ?auto_74400 ) ( ON ?auto_74397 ?auto_74398 ) ( CLEAR ?auto_74397 ) ( HOLDING ?auto_74396 ) ( CLEAR ?auto_74395 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_74394 ?auto_74395 ?auto_74396 )
      ( MAKE-6PILE ?auto_74394 ?auto_74395 ?auto_74396 ?auto_74397 ?auto_74398 ?auto_74399 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_74401 - BLOCK
      ?auto_74402 - BLOCK
      ?auto_74403 - BLOCK
      ?auto_74404 - BLOCK
      ?auto_74405 - BLOCK
      ?auto_74406 - BLOCK
    )
    :vars
    (
      ?auto_74407 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74401 ) ( ON ?auto_74402 ?auto_74401 ) ( not ( = ?auto_74401 ?auto_74402 ) ) ( not ( = ?auto_74401 ?auto_74403 ) ) ( not ( = ?auto_74401 ?auto_74404 ) ) ( not ( = ?auto_74401 ?auto_74405 ) ) ( not ( = ?auto_74401 ?auto_74406 ) ) ( not ( = ?auto_74402 ?auto_74403 ) ) ( not ( = ?auto_74402 ?auto_74404 ) ) ( not ( = ?auto_74402 ?auto_74405 ) ) ( not ( = ?auto_74402 ?auto_74406 ) ) ( not ( = ?auto_74403 ?auto_74404 ) ) ( not ( = ?auto_74403 ?auto_74405 ) ) ( not ( = ?auto_74403 ?auto_74406 ) ) ( not ( = ?auto_74404 ?auto_74405 ) ) ( not ( = ?auto_74404 ?auto_74406 ) ) ( not ( = ?auto_74405 ?auto_74406 ) ) ( ON ?auto_74406 ?auto_74407 ) ( not ( = ?auto_74401 ?auto_74407 ) ) ( not ( = ?auto_74402 ?auto_74407 ) ) ( not ( = ?auto_74403 ?auto_74407 ) ) ( not ( = ?auto_74404 ?auto_74407 ) ) ( not ( = ?auto_74405 ?auto_74407 ) ) ( not ( = ?auto_74406 ?auto_74407 ) ) ( ON ?auto_74405 ?auto_74406 ) ( ON-TABLE ?auto_74407 ) ( ON ?auto_74404 ?auto_74405 ) ( CLEAR ?auto_74402 ) ( ON ?auto_74403 ?auto_74404 ) ( CLEAR ?auto_74403 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_74407 ?auto_74406 ?auto_74405 ?auto_74404 )
      ( MAKE-6PILE ?auto_74401 ?auto_74402 ?auto_74403 ?auto_74404 ?auto_74405 ?auto_74406 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_74408 - BLOCK
      ?auto_74409 - BLOCK
      ?auto_74410 - BLOCK
      ?auto_74411 - BLOCK
      ?auto_74412 - BLOCK
      ?auto_74413 - BLOCK
    )
    :vars
    (
      ?auto_74414 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74408 ) ( not ( = ?auto_74408 ?auto_74409 ) ) ( not ( = ?auto_74408 ?auto_74410 ) ) ( not ( = ?auto_74408 ?auto_74411 ) ) ( not ( = ?auto_74408 ?auto_74412 ) ) ( not ( = ?auto_74408 ?auto_74413 ) ) ( not ( = ?auto_74409 ?auto_74410 ) ) ( not ( = ?auto_74409 ?auto_74411 ) ) ( not ( = ?auto_74409 ?auto_74412 ) ) ( not ( = ?auto_74409 ?auto_74413 ) ) ( not ( = ?auto_74410 ?auto_74411 ) ) ( not ( = ?auto_74410 ?auto_74412 ) ) ( not ( = ?auto_74410 ?auto_74413 ) ) ( not ( = ?auto_74411 ?auto_74412 ) ) ( not ( = ?auto_74411 ?auto_74413 ) ) ( not ( = ?auto_74412 ?auto_74413 ) ) ( ON ?auto_74413 ?auto_74414 ) ( not ( = ?auto_74408 ?auto_74414 ) ) ( not ( = ?auto_74409 ?auto_74414 ) ) ( not ( = ?auto_74410 ?auto_74414 ) ) ( not ( = ?auto_74411 ?auto_74414 ) ) ( not ( = ?auto_74412 ?auto_74414 ) ) ( not ( = ?auto_74413 ?auto_74414 ) ) ( ON ?auto_74412 ?auto_74413 ) ( ON-TABLE ?auto_74414 ) ( ON ?auto_74411 ?auto_74412 ) ( ON ?auto_74410 ?auto_74411 ) ( CLEAR ?auto_74410 ) ( HOLDING ?auto_74409 ) ( CLEAR ?auto_74408 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_74408 ?auto_74409 )
      ( MAKE-6PILE ?auto_74408 ?auto_74409 ?auto_74410 ?auto_74411 ?auto_74412 ?auto_74413 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_74415 - BLOCK
      ?auto_74416 - BLOCK
      ?auto_74417 - BLOCK
      ?auto_74418 - BLOCK
      ?auto_74419 - BLOCK
      ?auto_74420 - BLOCK
    )
    :vars
    (
      ?auto_74421 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74415 ) ( not ( = ?auto_74415 ?auto_74416 ) ) ( not ( = ?auto_74415 ?auto_74417 ) ) ( not ( = ?auto_74415 ?auto_74418 ) ) ( not ( = ?auto_74415 ?auto_74419 ) ) ( not ( = ?auto_74415 ?auto_74420 ) ) ( not ( = ?auto_74416 ?auto_74417 ) ) ( not ( = ?auto_74416 ?auto_74418 ) ) ( not ( = ?auto_74416 ?auto_74419 ) ) ( not ( = ?auto_74416 ?auto_74420 ) ) ( not ( = ?auto_74417 ?auto_74418 ) ) ( not ( = ?auto_74417 ?auto_74419 ) ) ( not ( = ?auto_74417 ?auto_74420 ) ) ( not ( = ?auto_74418 ?auto_74419 ) ) ( not ( = ?auto_74418 ?auto_74420 ) ) ( not ( = ?auto_74419 ?auto_74420 ) ) ( ON ?auto_74420 ?auto_74421 ) ( not ( = ?auto_74415 ?auto_74421 ) ) ( not ( = ?auto_74416 ?auto_74421 ) ) ( not ( = ?auto_74417 ?auto_74421 ) ) ( not ( = ?auto_74418 ?auto_74421 ) ) ( not ( = ?auto_74419 ?auto_74421 ) ) ( not ( = ?auto_74420 ?auto_74421 ) ) ( ON ?auto_74419 ?auto_74420 ) ( ON-TABLE ?auto_74421 ) ( ON ?auto_74418 ?auto_74419 ) ( ON ?auto_74417 ?auto_74418 ) ( CLEAR ?auto_74415 ) ( ON ?auto_74416 ?auto_74417 ) ( CLEAR ?auto_74416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_74421 ?auto_74420 ?auto_74419 ?auto_74418 ?auto_74417 )
      ( MAKE-6PILE ?auto_74415 ?auto_74416 ?auto_74417 ?auto_74418 ?auto_74419 ?auto_74420 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_74422 - BLOCK
      ?auto_74423 - BLOCK
      ?auto_74424 - BLOCK
      ?auto_74425 - BLOCK
      ?auto_74426 - BLOCK
      ?auto_74427 - BLOCK
    )
    :vars
    (
      ?auto_74428 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74422 ?auto_74423 ) ) ( not ( = ?auto_74422 ?auto_74424 ) ) ( not ( = ?auto_74422 ?auto_74425 ) ) ( not ( = ?auto_74422 ?auto_74426 ) ) ( not ( = ?auto_74422 ?auto_74427 ) ) ( not ( = ?auto_74423 ?auto_74424 ) ) ( not ( = ?auto_74423 ?auto_74425 ) ) ( not ( = ?auto_74423 ?auto_74426 ) ) ( not ( = ?auto_74423 ?auto_74427 ) ) ( not ( = ?auto_74424 ?auto_74425 ) ) ( not ( = ?auto_74424 ?auto_74426 ) ) ( not ( = ?auto_74424 ?auto_74427 ) ) ( not ( = ?auto_74425 ?auto_74426 ) ) ( not ( = ?auto_74425 ?auto_74427 ) ) ( not ( = ?auto_74426 ?auto_74427 ) ) ( ON ?auto_74427 ?auto_74428 ) ( not ( = ?auto_74422 ?auto_74428 ) ) ( not ( = ?auto_74423 ?auto_74428 ) ) ( not ( = ?auto_74424 ?auto_74428 ) ) ( not ( = ?auto_74425 ?auto_74428 ) ) ( not ( = ?auto_74426 ?auto_74428 ) ) ( not ( = ?auto_74427 ?auto_74428 ) ) ( ON ?auto_74426 ?auto_74427 ) ( ON-TABLE ?auto_74428 ) ( ON ?auto_74425 ?auto_74426 ) ( ON ?auto_74424 ?auto_74425 ) ( ON ?auto_74423 ?auto_74424 ) ( CLEAR ?auto_74423 ) ( HOLDING ?auto_74422 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_74422 )
      ( MAKE-6PILE ?auto_74422 ?auto_74423 ?auto_74424 ?auto_74425 ?auto_74426 ?auto_74427 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_74429 - BLOCK
      ?auto_74430 - BLOCK
      ?auto_74431 - BLOCK
      ?auto_74432 - BLOCK
      ?auto_74433 - BLOCK
      ?auto_74434 - BLOCK
    )
    :vars
    (
      ?auto_74435 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74429 ?auto_74430 ) ) ( not ( = ?auto_74429 ?auto_74431 ) ) ( not ( = ?auto_74429 ?auto_74432 ) ) ( not ( = ?auto_74429 ?auto_74433 ) ) ( not ( = ?auto_74429 ?auto_74434 ) ) ( not ( = ?auto_74430 ?auto_74431 ) ) ( not ( = ?auto_74430 ?auto_74432 ) ) ( not ( = ?auto_74430 ?auto_74433 ) ) ( not ( = ?auto_74430 ?auto_74434 ) ) ( not ( = ?auto_74431 ?auto_74432 ) ) ( not ( = ?auto_74431 ?auto_74433 ) ) ( not ( = ?auto_74431 ?auto_74434 ) ) ( not ( = ?auto_74432 ?auto_74433 ) ) ( not ( = ?auto_74432 ?auto_74434 ) ) ( not ( = ?auto_74433 ?auto_74434 ) ) ( ON ?auto_74434 ?auto_74435 ) ( not ( = ?auto_74429 ?auto_74435 ) ) ( not ( = ?auto_74430 ?auto_74435 ) ) ( not ( = ?auto_74431 ?auto_74435 ) ) ( not ( = ?auto_74432 ?auto_74435 ) ) ( not ( = ?auto_74433 ?auto_74435 ) ) ( not ( = ?auto_74434 ?auto_74435 ) ) ( ON ?auto_74433 ?auto_74434 ) ( ON-TABLE ?auto_74435 ) ( ON ?auto_74432 ?auto_74433 ) ( ON ?auto_74431 ?auto_74432 ) ( ON ?auto_74430 ?auto_74431 ) ( ON ?auto_74429 ?auto_74430 ) ( CLEAR ?auto_74429 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_74435 ?auto_74434 ?auto_74433 ?auto_74432 ?auto_74431 ?auto_74430 )
      ( MAKE-6PILE ?auto_74429 ?auto_74430 ?auto_74431 ?auto_74432 ?auto_74433 ?auto_74434 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_74441 - BLOCK
      ?auto_74442 - BLOCK
      ?auto_74443 - BLOCK
      ?auto_74444 - BLOCK
      ?auto_74445 - BLOCK
    )
    :vars
    (
      ?auto_74446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74446 ?auto_74445 ) ( CLEAR ?auto_74446 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_74441 ) ( ON ?auto_74442 ?auto_74441 ) ( ON ?auto_74443 ?auto_74442 ) ( ON ?auto_74444 ?auto_74443 ) ( ON ?auto_74445 ?auto_74444 ) ( not ( = ?auto_74441 ?auto_74442 ) ) ( not ( = ?auto_74441 ?auto_74443 ) ) ( not ( = ?auto_74441 ?auto_74444 ) ) ( not ( = ?auto_74441 ?auto_74445 ) ) ( not ( = ?auto_74441 ?auto_74446 ) ) ( not ( = ?auto_74442 ?auto_74443 ) ) ( not ( = ?auto_74442 ?auto_74444 ) ) ( not ( = ?auto_74442 ?auto_74445 ) ) ( not ( = ?auto_74442 ?auto_74446 ) ) ( not ( = ?auto_74443 ?auto_74444 ) ) ( not ( = ?auto_74443 ?auto_74445 ) ) ( not ( = ?auto_74443 ?auto_74446 ) ) ( not ( = ?auto_74444 ?auto_74445 ) ) ( not ( = ?auto_74444 ?auto_74446 ) ) ( not ( = ?auto_74445 ?auto_74446 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_74446 ?auto_74445 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_74460 - BLOCK
      ?auto_74461 - BLOCK
      ?auto_74462 - BLOCK
      ?auto_74463 - BLOCK
      ?auto_74464 - BLOCK
    )
    :vars
    (
      ?auto_74465 - BLOCK
      ?auto_74466 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74460 ) ( ON ?auto_74461 ?auto_74460 ) ( ON ?auto_74462 ?auto_74461 ) ( ON ?auto_74463 ?auto_74462 ) ( not ( = ?auto_74460 ?auto_74461 ) ) ( not ( = ?auto_74460 ?auto_74462 ) ) ( not ( = ?auto_74460 ?auto_74463 ) ) ( not ( = ?auto_74460 ?auto_74464 ) ) ( not ( = ?auto_74460 ?auto_74465 ) ) ( not ( = ?auto_74461 ?auto_74462 ) ) ( not ( = ?auto_74461 ?auto_74463 ) ) ( not ( = ?auto_74461 ?auto_74464 ) ) ( not ( = ?auto_74461 ?auto_74465 ) ) ( not ( = ?auto_74462 ?auto_74463 ) ) ( not ( = ?auto_74462 ?auto_74464 ) ) ( not ( = ?auto_74462 ?auto_74465 ) ) ( not ( = ?auto_74463 ?auto_74464 ) ) ( not ( = ?auto_74463 ?auto_74465 ) ) ( not ( = ?auto_74464 ?auto_74465 ) ) ( ON ?auto_74465 ?auto_74466 ) ( CLEAR ?auto_74465 ) ( not ( = ?auto_74460 ?auto_74466 ) ) ( not ( = ?auto_74461 ?auto_74466 ) ) ( not ( = ?auto_74462 ?auto_74466 ) ) ( not ( = ?auto_74463 ?auto_74466 ) ) ( not ( = ?auto_74464 ?auto_74466 ) ) ( not ( = ?auto_74465 ?auto_74466 ) ) ( HOLDING ?auto_74464 ) ( CLEAR ?auto_74463 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_74460 ?auto_74461 ?auto_74462 ?auto_74463 ?auto_74464 ?auto_74465 )
      ( MAKE-5PILE ?auto_74460 ?auto_74461 ?auto_74462 ?auto_74463 ?auto_74464 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_74467 - BLOCK
      ?auto_74468 - BLOCK
      ?auto_74469 - BLOCK
      ?auto_74470 - BLOCK
      ?auto_74471 - BLOCK
    )
    :vars
    (
      ?auto_74473 - BLOCK
      ?auto_74472 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74467 ) ( ON ?auto_74468 ?auto_74467 ) ( ON ?auto_74469 ?auto_74468 ) ( ON ?auto_74470 ?auto_74469 ) ( not ( = ?auto_74467 ?auto_74468 ) ) ( not ( = ?auto_74467 ?auto_74469 ) ) ( not ( = ?auto_74467 ?auto_74470 ) ) ( not ( = ?auto_74467 ?auto_74471 ) ) ( not ( = ?auto_74467 ?auto_74473 ) ) ( not ( = ?auto_74468 ?auto_74469 ) ) ( not ( = ?auto_74468 ?auto_74470 ) ) ( not ( = ?auto_74468 ?auto_74471 ) ) ( not ( = ?auto_74468 ?auto_74473 ) ) ( not ( = ?auto_74469 ?auto_74470 ) ) ( not ( = ?auto_74469 ?auto_74471 ) ) ( not ( = ?auto_74469 ?auto_74473 ) ) ( not ( = ?auto_74470 ?auto_74471 ) ) ( not ( = ?auto_74470 ?auto_74473 ) ) ( not ( = ?auto_74471 ?auto_74473 ) ) ( ON ?auto_74473 ?auto_74472 ) ( not ( = ?auto_74467 ?auto_74472 ) ) ( not ( = ?auto_74468 ?auto_74472 ) ) ( not ( = ?auto_74469 ?auto_74472 ) ) ( not ( = ?auto_74470 ?auto_74472 ) ) ( not ( = ?auto_74471 ?auto_74472 ) ) ( not ( = ?auto_74473 ?auto_74472 ) ) ( CLEAR ?auto_74470 ) ( ON ?auto_74471 ?auto_74473 ) ( CLEAR ?auto_74471 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_74472 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_74472 ?auto_74473 )
      ( MAKE-5PILE ?auto_74467 ?auto_74468 ?auto_74469 ?auto_74470 ?auto_74471 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_74474 - BLOCK
      ?auto_74475 - BLOCK
      ?auto_74476 - BLOCK
      ?auto_74477 - BLOCK
      ?auto_74478 - BLOCK
    )
    :vars
    (
      ?auto_74480 - BLOCK
      ?auto_74479 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74474 ) ( ON ?auto_74475 ?auto_74474 ) ( ON ?auto_74476 ?auto_74475 ) ( not ( = ?auto_74474 ?auto_74475 ) ) ( not ( = ?auto_74474 ?auto_74476 ) ) ( not ( = ?auto_74474 ?auto_74477 ) ) ( not ( = ?auto_74474 ?auto_74478 ) ) ( not ( = ?auto_74474 ?auto_74480 ) ) ( not ( = ?auto_74475 ?auto_74476 ) ) ( not ( = ?auto_74475 ?auto_74477 ) ) ( not ( = ?auto_74475 ?auto_74478 ) ) ( not ( = ?auto_74475 ?auto_74480 ) ) ( not ( = ?auto_74476 ?auto_74477 ) ) ( not ( = ?auto_74476 ?auto_74478 ) ) ( not ( = ?auto_74476 ?auto_74480 ) ) ( not ( = ?auto_74477 ?auto_74478 ) ) ( not ( = ?auto_74477 ?auto_74480 ) ) ( not ( = ?auto_74478 ?auto_74480 ) ) ( ON ?auto_74480 ?auto_74479 ) ( not ( = ?auto_74474 ?auto_74479 ) ) ( not ( = ?auto_74475 ?auto_74479 ) ) ( not ( = ?auto_74476 ?auto_74479 ) ) ( not ( = ?auto_74477 ?auto_74479 ) ) ( not ( = ?auto_74478 ?auto_74479 ) ) ( not ( = ?auto_74480 ?auto_74479 ) ) ( ON ?auto_74478 ?auto_74480 ) ( CLEAR ?auto_74478 ) ( ON-TABLE ?auto_74479 ) ( HOLDING ?auto_74477 ) ( CLEAR ?auto_74476 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_74474 ?auto_74475 ?auto_74476 ?auto_74477 )
      ( MAKE-5PILE ?auto_74474 ?auto_74475 ?auto_74476 ?auto_74477 ?auto_74478 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_74481 - BLOCK
      ?auto_74482 - BLOCK
      ?auto_74483 - BLOCK
      ?auto_74484 - BLOCK
      ?auto_74485 - BLOCK
    )
    :vars
    (
      ?auto_74486 - BLOCK
      ?auto_74487 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74481 ) ( ON ?auto_74482 ?auto_74481 ) ( ON ?auto_74483 ?auto_74482 ) ( not ( = ?auto_74481 ?auto_74482 ) ) ( not ( = ?auto_74481 ?auto_74483 ) ) ( not ( = ?auto_74481 ?auto_74484 ) ) ( not ( = ?auto_74481 ?auto_74485 ) ) ( not ( = ?auto_74481 ?auto_74486 ) ) ( not ( = ?auto_74482 ?auto_74483 ) ) ( not ( = ?auto_74482 ?auto_74484 ) ) ( not ( = ?auto_74482 ?auto_74485 ) ) ( not ( = ?auto_74482 ?auto_74486 ) ) ( not ( = ?auto_74483 ?auto_74484 ) ) ( not ( = ?auto_74483 ?auto_74485 ) ) ( not ( = ?auto_74483 ?auto_74486 ) ) ( not ( = ?auto_74484 ?auto_74485 ) ) ( not ( = ?auto_74484 ?auto_74486 ) ) ( not ( = ?auto_74485 ?auto_74486 ) ) ( ON ?auto_74486 ?auto_74487 ) ( not ( = ?auto_74481 ?auto_74487 ) ) ( not ( = ?auto_74482 ?auto_74487 ) ) ( not ( = ?auto_74483 ?auto_74487 ) ) ( not ( = ?auto_74484 ?auto_74487 ) ) ( not ( = ?auto_74485 ?auto_74487 ) ) ( not ( = ?auto_74486 ?auto_74487 ) ) ( ON ?auto_74485 ?auto_74486 ) ( ON-TABLE ?auto_74487 ) ( CLEAR ?auto_74483 ) ( ON ?auto_74484 ?auto_74485 ) ( CLEAR ?auto_74484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_74487 ?auto_74486 ?auto_74485 )
      ( MAKE-5PILE ?auto_74481 ?auto_74482 ?auto_74483 ?auto_74484 ?auto_74485 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_74488 - BLOCK
      ?auto_74489 - BLOCK
      ?auto_74490 - BLOCK
      ?auto_74491 - BLOCK
      ?auto_74492 - BLOCK
    )
    :vars
    (
      ?auto_74493 - BLOCK
      ?auto_74494 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74488 ) ( ON ?auto_74489 ?auto_74488 ) ( not ( = ?auto_74488 ?auto_74489 ) ) ( not ( = ?auto_74488 ?auto_74490 ) ) ( not ( = ?auto_74488 ?auto_74491 ) ) ( not ( = ?auto_74488 ?auto_74492 ) ) ( not ( = ?auto_74488 ?auto_74493 ) ) ( not ( = ?auto_74489 ?auto_74490 ) ) ( not ( = ?auto_74489 ?auto_74491 ) ) ( not ( = ?auto_74489 ?auto_74492 ) ) ( not ( = ?auto_74489 ?auto_74493 ) ) ( not ( = ?auto_74490 ?auto_74491 ) ) ( not ( = ?auto_74490 ?auto_74492 ) ) ( not ( = ?auto_74490 ?auto_74493 ) ) ( not ( = ?auto_74491 ?auto_74492 ) ) ( not ( = ?auto_74491 ?auto_74493 ) ) ( not ( = ?auto_74492 ?auto_74493 ) ) ( ON ?auto_74493 ?auto_74494 ) ( not ( = ?auto_74488 ?auto_74494 ) ) ( not ( = ?auto_74489 ?auto_74494 ) ) ( not ( = ?auto_74490 ?auto_74494 ) ) ( not ( = ?auto_74491 ?auto_74494 ) ) ( not ( = ?auto_74492 ?auto_74494 ) ) ( not ( = ?auto_74493 ?auto_74494 ) ) ( ON ?auto_74492 ?auto_74493 ) ( ON-TABLE ?auto_74494 ) ( ON ?auto_74491 ?auto_74492 ) ( CLEAR ?auto_74491 ) ( HOLDING ?auto_74490 ) ( CLEAR ?auto_74489 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_74488 ?auto_74489 ?auto_74490 )
      ( MAKE-5PILE ?auto_74488 ?auto_74489 ?auto_74490 ?auto_74491 ?auto_74492 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_74495 - BLOCK
      ?auto_74496 - BLOCK
      ?auto_74497 - BLOCK
      ?auto_74498 - BLOCK
      ?auto_74499 - BLOCK
    )
    :vars
    (
      ?auto_74500 - BLOCK
      ?auto_74501 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74495 ) ( ON ?auto_74496 ?auto_74495 ) ( not ( = ?auto_74495 ?auto_74496 ) ) ( not ( = ?auto_74495 ?auto_74497 ) ) ( not ( = ?auto_74495 ?auto_74498 ) ) ( not ( = ?auto_74495 ?auto_74499 ) ) ( not ( = ?auto_74495 ?auto_74500 ) ) ( not ( = ?auto_74496 ?auto_74497 ) ) ( not ( = ?auto_74496 ?auto_74498 ) ) ( not ( = ?auto_74496 ?auto_74499 ) ) ( not ( = ?auto_74496 ?auto_74500 ) ) ( not ( = ?auto_74497 ?auto_74498 ) ) ( not ( = ?auto_74497 ?auto_74499 ) ) ( not ( = ?auto_74497 ?auto_74500 ) ) ( not ( = ?auto_74498 ?auto_74499 ) ) ( not ( = ?auto_74498 ?auto_74500 ) ) ( not ( = ?auto_74499 ?auto_74500 ) ) ( ON ?auto_74500 ?auto_74501 ) ( not ( = ?auto_74495 ?auto_74501 ) ) ( not ( = ?auto_74496 ?auto_74501 ) ) ( not ( = ?auto_74497 ?auto_74501 ) ) ( not ( = ?auto_74498 ?auto_74501 ) ) ( not ( = ?auto_74499 ?auto_74501 ) ) ( not ( = ?auto_74500 ?auto_74501 ) ) ( ON ?auto_74499 ?auto_74500 ) ( ON-TABLE ?auto_74501 ) ( ON ?auto_74498 ?auto_74499 ) ( CLEAR ?auto_74496 ) ( ON ?auto_74497 ?auto_74498 ) ( CLEAR ?auto_74497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_74501 ?auto_74500 ?auto_74499 ?auto_74498 )
      ( MAKE-5PILE ?auto_74495 ?auto_74496 ?auto_74497 ?auto_74498 ?auto_74499 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_74502 - BLOCK
      ?auto_74503 - BLOCK
      ?auto_74504 - BLOCK
      ?auto_74505 - BLOCK
      ?auto_74506 - BLOCK
    )
    :vars
    (
      ?auto_74508 - BLOCK
      ?auto_74507 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74502 ) ( not ( = ?auto_74502 ?auto_74503 ) ) ( not ( = ?auto_74502 ?auto_74504 ) ) ( not ( = ?auto_74502 ?auto_74505 ) ) ( not ( = ?auto_74502 ?auto_74506 ) ) ( not ( = ?auto_74502 ?auto_74508 ) ) ( not ( = ?auto_74503 ?auto_74504 ) ) ( not ( = ?auto_74503 ?auto_74505 ) ) ( not ( = ?auto_74503 ?auto_74506 ) ) ( not ( = ?auto_74503 ?auto_74508 ) ) ( not ( = ?auto_74504 ?auto_74505 ) ) ( not ( = ?auto_74504 ?auto_74506 ) ) ( not ( = ?auto_74504 ?auto_74508 ) ) ( not ( = ?auto_74505 ?auto_74506 ) ) ( not ( = ?auto_74505 ?auto_74508 ) ) ( not ( = ?auto_74506 ?auto_74508 ) ) ( ON ?auto_74508 ?auto_74507 ) ( not ( = ?auto_74502 ?auto_74507 ) ) ( not ( = ?auto_74503 ?auto_74507 ) ) ( not ( = ?auto_74504 ?auto_74507 ) ) ( not ( = ?auto_74505 ?auto_74507 ) ) ( not ( = ?auto_74506 ?auto_74507 ) ) ( not ( = ?auto_74508 ?auto_74507 ) ) ( ON ?auto_74506 ?auto_74508 ) ( ON-TABLE ?auto_74507 ) ( ON ?auto_74505 ?auto_74506 ) ( ON ?auto_74504 ?auto_74505 ) ( CLEAR ?auto_74504 ) ( HOLDING ?auto_74503 ) ( CLEAR ?auto_74502 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_74502 ?auto_74503 )
      ( MAKE-5PILE ?auto_74502 ?auto_74503 ?auto_74504 ?auto_74505 ?auto_74506 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_74509 - BLOCK
      ?auto_74510 - BLOCK
      ?auto_74511 - BLOCK
      ?auto_74512 - BLOCK
      ?auto_74513 - BLOCK
    )
    :vars
    (
      ?auto_74515 - BLOCK
      ?auto_74514 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74509 ) ( not ( = ?auto_74509 ?auto_74510 ) ) ( not ( = ?auto_74509 ?auto_74511 ) ) ( not ( = ?auto_74509 ?auto_74512 ) ) ( not ( = ?auto_74509 ?auto_74513 ) ) ( not ( = ?auto_74509 ?auto_74515 ) ) ( not ( = ?auto_74510 ?auto_74511 ) ) ( not ( = ?auto_74510 ?auto_74512 ) ) ( not ( = ?auto_74510 ?auto_74513 ) ) ( not ( = ?auto_74510 ?auto_74515 ) ) ( not ( = ?auto_74511 ?auto_74512 ) ) ( not ( = ?auto_74511 ?auto_74513 ) ) ( not ( = ?auto_74511 ?auto_74515 ) ) ( not ( = ?auto_74512 ?auto_74513 ) ) ( not ( = ?auto_74512 ?auto_74515 ) ) ( not ( = ?auto_74513 ?auto_74515 ) ) ( ON ?auto_74515 ?auto_74514 ) ( not ( = ?auto_74509 ?auto_74514 ) ) ( not ( = ?auto_74510 ?auto_74514 ) ) ( not ( = ?auto_74511 ?auto_74514 ) ) ( not ( = ?auto_74512 ?auto_74514 ) ) ( not ( = ?auto_74513 ?auto_74514 ) ) ( not ( = ?auto_74515 ?auto_74514 ) ) ( ON ?auto_74513 ?auto_74515 ) ( ON-TABLE ?auto_74514 ) ( ON ?auto_74512 ?auto_74513 ) ( ON ?auto_74511 ?auto_74512 ) ( CLEAR ?auto_74509 ) ( ON ?auto_74510 ?auto_74511 ) ( CLEAR ?auto_74510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_74514 ?auto_74515 ?auto_74513 ?auto_74512 ?auto_74511 )
      ( MAKE-5PILE ?auto_74509 ?auto_74510 ?auto_74511 ?auto_74512 ?auto_74513 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_74516 - BLOCK
      ?auto_74517 - BLOCK
      ?auto_74518 - BLOCK
      ?auto_74519 - BLOCK
      ?auto_74520 - BLOCK
    )
    :vars
    (
      ?auto_74522 - BLOCK
      ?auto_74521 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74516 ?auto_74517 ) ) ( not ( = ?auto_74516 ?auto_74518 ) ) ( not ( = ?auto_74516 ?auto_74519 ) ) ( not ( = ?auto_74516 ?auto_74520 ) ) ( not ( = ?auto_74516 ?auto_74522 ) ) ( not ( = ?auto_74517 ?auto_74518 ) ) ( not ( = ?auto_74517 ?auto_74519 ) ) ( not ( = ?auto_74517 ?auto_74520 ) ) ( not ( = ?auto_74517 ?auto_74522 ) ) ( not ( = ?auto_74518 ?auto_74519 ) ) ( not ( = ?auto_74518 ?auto_74520 ) ) ( not ( = ?auto_74518 ?auto_74522 ) ) ( not ( = ?auto_74519 ?auto_74520 ) ) ( not ( = ?auto_74519 ?auto_74522 ) ) ( not ( = ?auto_74520 ?auto_74522 ) ) ( ON ?auto_74522 ?auto_74521 ) ( not ( = ?auto_74516 ?auto_74521 ) ) ( not ( = ?auto_74517 ?auto_74521 ) ) ( not ( = ?auto_74518 ?auto_74521 ) ) ( not ( = ?auto_74519 ?auto_74521 ) ) ( not ( = ?auto_74520 ?auto_74521 ) ) ( not ( = ?auto_74522 ?auto_74521 ) ) ( ON ?auto_74520 ?auto_74522 ) ( ON-TABLE ?auto_74521 ) ( ON ?auto_74519 ?auto_74520 ) ( ON ?auto_74518 ?auto_74519 ) ( ON ?auto_74517 ?auto_74518 ) ( CLEAR ?auto_74517 ) ( HOLDING ?auto_74516 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_74516 )
      ( MAKE-5PILE ?auto_74516 ?auto_74517 ?auto_74518 ?auto_74519 ?auto_74520 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_74523 - BLOCK
      ?auto_74524 - BLOCK
      ?auto_74525 - BLOCK
      ?auto_74526 - BLOCK
      ?auto_74527 - BLOCK
    )
    :vars
    (
      ?auto_74529 - BLOCK
      ?auto_74528 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74523 ?auto_74524 ) ) ( not ( = ?auto_74523 ?auto_74525 ) ) ( not ( = ?auto_74523 ?auto_74526 ) ) ( not ( = ?auto_74523 ?auto_74527 ) ) ( not ( = ?auto_74523 ?auto_74529 ) ) ( not ( = ?auto_74524 ?auto_74525 ) ) ( not ( = ?auto_74524 ?auto_74526 ) ) ( not ( = ?auto_74524 ?auto_74527 ) ) ( not ( = ?auto_74524 ?auto_74529 ) ) ( not ( = ?auto_74525 ?auto_74526 ) ) ( not ( = ?auto_74525 ?auto_74527 ) ) ( not ( = ?auto_74525 ?auto_74529 ) ) ( not ( = ?auto_74526 ?auto_74527 ) ) ( not ( = ?auto_74526 ?auto_74529 ) ) ( not ( = ?auto_74527 ?auto_74529 ) ) ( ON ?auto_74529 ?auto_74528 ) ( not ( = ?auto_74523 ?auto_74528 ) ) ( not ( = ?auto_74524 ?auto_74528 ) ) ( not ( = ?auto_74525 ?auto_74528 ) ) ( not ( = ?auto_74526 ?auto_74528 ) ) ( not ( = ?auto_74527 ?auto_74528 ) ) ( not ( = ?auto_74529 ?auto_74528 ) ) ( ON ?auto_74527 ?auto_74529 ) ( ON-TABLE ?auto_74528 ) ( ON ?auto_74526 ?auto_74527 ) ( ON ?auto_74525 ?auto_74526 ) ( ON ?auto_74524 ?auto_74525 ) ( ON ?auto_74523 ?auto_74524 ) ( CLEAR ?auto_74523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_74528 ?auto_74529 ?auto_74527 ?auto_74526 ?auto_74525 ?auto_74524 )
      ( MAKE-5PILE ?auto_74523 ?auto_74524 ?auto_74525 ?auto_74526 ?auto_74527 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74531 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_74531 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_74531 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74532 - BLOCK
    )
    :vars
    (
      ?auto_74533 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74532 ?auto_74533 ) ( CLEAR ?auto_74532 ) ( HAND-EMPTY ) ( not ( = ?auto_74532 ?auto_74533 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_74532 ?auto_74533 )
      ( MAKE-1PILE ?auto_74532 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74534 - BLOCK
    )
    :vars
    (
      ?auto_74535 - BLOCK
      ?auto_74536 - BLOCK
      ?auto_74537 - BLOCK
      ?auto_74538 - BLOCK
      ?auto_74539 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74534 ?auto_74535 ) ) ( HOLDING ?auto_74534 ) ( CLEAR ?auto_74535 ) ( ON-TABLE ?auto_74536 ) ( ON ?auto_74537 ?auto_74536 ) ( ON ?auto_74538 ?auto_74537 ) ( ON ?auto_74539 ?auto_74538 ) ( ON ?auto_74535 ?auto_74539 ) ( not ( = ?auto_74536 ?auto_74537 ) ) ( not ( = ?auto_74536 ?auto_74538 ) ) ( not ( = ?auto_74536 ?auto_74539 ) ) ( not ( = ?auto_74536 ?auto_74535 ) ) ( not ( = ?auto_74536 ?auto_74534 ) ) ( not ( = ?auto_74537 ?auto_74538 ) ) ( not ( = ?auto_74537 ?auto_74539 ) ) ( not ( = ?auto_74537 ?auto_74535 ) ) ( not ( = ?auto_74537 ?auto_74534 ) ) ( not ( = ?auto_74538 ?auto_74539 ) ) ( not ( = ?auto_74538 ?auto_74535 ) ) ( not ( = ?auto_74538 ?auto_74534 ) ) ( not ( = ?auto_74539 ?auto_74535 ) ) ( not ( = ?auto_74539 ?auto_74534 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_74536 ?auto_74537 ?auto_74538 ?auto_74539 ?auto_74535 ?auto_74534 )
      ( MAKE-1PILE ?auto_74534 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74540 - BLOCK
    )
    :vars
    (
      ?auto_74545 - BLOCK
      ?auto_74541 - BLOCK
      ?auto_74544 - BLOCK
      ?auto_74543 - BLOCK
      ?auto_74542 - BLOCK
      ?auto_74546 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74540 ?auto_74545 ) ) ( CLEAR ?auto_74545 ) ( ON-TABLE ?auto_74541 ) ( ON ?auto_74544 ?auto_74541 ) ( ON ?auto_74543 ?auto_74544 ) ( ON ?auto_74542 ?auto_74543 ) ( ON ?auto_74545 ?auto_74542 ) ( not ( = ?auto_74541 ?auto_74544 ) ) ( not ( = ?auto_74541 ?auto_74543 ) ) ( not ( = ?auto_74541 ?auto_74542 ) ) ( not ( = ?auto_74541 ?auto_74545 ) ) ( not ( = ?auto_74541 ?auto_74540 ) ) ( not ( = ?auto_74544 ?auto_74543 ) ) ( not ( = ?auto_74544 ?auto_74542 ) ) ( not ( = ?auto_74544 ?auto_74545 ) ) ( not ( = ?auto_74544 ?auto_74540 ) ) ( not ( = ?auto_74543 ?auto_74542 ) ) ( not ( = ?auto_74543 ?auto_74545 ) ) ( not ( = ?auto_74543 ?auto_74540 ) ) ( not ( = ?auto_74542 ?auto_74545 ) ) ( not ( = ?auto_74542 ?auto_74540 ) ) ( ON ?auto_74540 ?auto_74546 ) ( CLEAR ?auto_74540 ) ( HAND-EMPTY ) ( not ( = ?auto_74540 ?auto_74546 ) ) ( not ( = ?auto_74545 ?auto_74546 ) ) ( not ( = ?auto_74541 ?auto_74546 ) ) ( not ( = ?auto_74544 ?auto_74546 ) ) ( not ( = ?auto_74543 ?auto_74546 ) ) ( not ( = ?auto_74542 ?auto_74546 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_74540 ?auto_74546 )
      ( MAKE-1PILE ?auto_74540 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74547 - BLOCK
    )
    :vars
    (
      ?auto_74553 - BLOCK
      ?auto_74550 - BLOCK
      ?auto_74552 - BLOCK
      ?auto_74551 - BLOCK
      ?auto_74549 - BLOCK
      ?auto_74548 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74547 ?auto_74553 ) ) ( ON-TABLE ?auto_74550 ) ( ON ?auto_74552 ?auto_74550 ) ( ON ?auto_74551 ?auto_74552 ) ( ON ?auto_74549 ?auto_74551 ) ( not ( = ?auto_74550 ?auto_74552 ) ) ( not ( = ?auto_74550 ?auto_74551 ) ) ( not ( = ?auto_74550 ?auto_74549 ) ) ( not ( = ?auto_74550 ?auto_74553 ) ) ( not ( = ?auto_74550 ?auto_74547 ) ) ( not ( = ?auto_74552 ?auto_74551 ) ) ( not ( = ?auto_74552 ?auto_74549 ) ) ( not ( = ?auto_74552 ?auto_74553 ) ) ( not ( = ?auto_74552 ?auto_74547 ) ) ( not ( = ?auto_74551 ?auto_74549 ) ) ( not ( = ?auto_74551 ?auto_74553 ) ) ( not ( = ?auto_74551 ?auto_74547 ) ) ( not ( = ?auto_74549 ?auto_74553 ) ) ( not ( = ?auto_74549 ?auto_74547 ) ) ( ON ?auto_74547 ?auto_74548 ) ( CLEAR ?auto_74547 ) ( not ( = ?auto_74547 ?auto_74548 ) ) ( not ( = ?auto_74553 ?auto_74548 ) ) ( not ( = ?auto_74550 ?auto_74548 ) ) ( not ( = ?auto_74552 ?auto_74548 ) ) ( not ( = ?auto_74551 ?auto_74548 ) ) ( not ( = ?auto_74549 ?auto_74548 ) ) ( HOLDING ?auto_74553 ) ( CLEAR ?auto_74549 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_74550 ?auto_74552 ?auto_74551 ?auto_74549 ?auto_74553 )
      ( MAKE-1PILE ?auto_74547 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74554 - BLOCK
    )
    :vars
    (
      ?auto_74557 - BLOCK
      ?auto_74556 - BLOCK
      ?auto_74559 - BLOCK
      ?auto_74560 - BLOCK
      ?auto_74555 - BLOCK
      ?auto_74558 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74554 ?auto_74557 ) ) ( ON-TABLE ?auto_74556 ) ( ON ?auto_74559 ?auto_74556 ) ( ON ?auto_74560 ?auto_74559 ) ( ON ?auto_74555 ?auto_74560 ) ( not ( = ?auto_74556 ?auto_74559 ) ) ( not ( = ?auto_74556 ?auto_74560 ) ) ( not ( = ?auto_74556 ?auto_74555 ) ) ( not ( = ?auto_74556 ?auto_74557 ) ) ( not ( = ?auto_74556 ?auto_74554 ) ) ( not ( = ?auto_74559 ?auto_74560 ) ) ( not ( = ?auto_74559 ?auto_74555 ) ) ( not ( = ?auto_74559 ?auto_74557 ) ) ( not ( = ?auto_74559 ?auto_74554 ) ) ( not ( = ?auto_74560 ?auto_74555 ) ) ( not ( = ?auto_74560 ?auto_74557 ) ) ( not ( = ?auto_74560 ?auto_74554 ) ) ( not ( = ?auto_74555 ?auto_74557 ) ) ( not ( = ?auto_74555 ?auto_74554 ) ) ( ON ?auto_74554 ?auto_74558 ) ( not ( = ?auto_74554 ?auto_74558 ) ) ( not ( = ?auto_74557 ?auto_74558 ) ) ( not ( = ?auto_74556 ?auto_74558 ) ) ( not ( = ?auto_74559 ?auto_74558 ) ) ( not ( = ?auto_74560 ?auto_74558 ) ) ( not ( = ?auto_74555 ?auto_74558 ) ) ( CLEAR ?auto_74555 ) ( ON ?auto_74557 ?auto_74554 ) ( CLEAR ?auto_74557 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_74558 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_74558 ?auto_74554 )
      ( MAKE-1PILE ?auto_74554 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74561 - BLOCK
    )
    :vars
    (
      ?auto_74563 - BLOCK
      ?auto_74567 - BLOCK
      ?auto_74565 - BLOCK
      ?auto_74566 - BLOCK
      ?auto_74562 - BLOCK
      ?auto_74564 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74561 ?auto_74563 ) ) ( ON-TABLE ?auto_74567 ) ( ON ?auto_74565 ?auto_74567 ) ( ON ?auto_74566 ?auto_74565 ) ( not ( = ?auto_74567 ?auto_74565 ) ) ( not ( = ?auto_74567 ?auto_74566 ) ) ( not ( = ?auto_74567 ?auto_74562 ) ) ( not ( = ?auto_74567 ?auto_74563 ) ) ( not ( = ?auto_74567 ?auto_74561 ) ) ( not ( = ?auto_74565 ?auto_74566 ) ) ( not ( = ?auto_74565 ?auto_74562 ) ) ( not ( = ?auto_74565 ?auto_74563 ) ) ( not ( = ?auto_74565 ?auto_74561 ) ) ( not ( = ?auto_74566 ?auto_74562 ) ) ( not ( = ?auto_74566 ?auto_74563 ) ) ( not ( = ?auto_74566 ?auto_74561 ) ) ( not ( = ?auto_74562 ?auto_74563 ) ) ( not ( = ?auto_74562 ?auto_74561 ) ) ( ON ?auto_74561 ?auto_74564 ) ( not ( = ?auto_74561 ?auto_74564 ) ) ( not ( = ?auto_74563 ?auto_74564 ) ) ( not ( = ?auto_74567 ?auto_74564 ) ) ( not ( = ?auto_74565 ?auto_74564 ) ) ( not ( = ?auto_74566 ?auto_74564 ) ) ( not ( = ?auto_74562 ?auto_74564 ) ) ( ON ?auto_74563 ?auto_74561 ) ( CLEAR ?auto_74563 ) ( ON-TABLE ?auto_74564 ) ( HOLDING ?auto_74562 ) ( CLEAR ?auto_74566 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_74567 ?auto_74565 ?auto_74566 ?auto_74562 )
      ( MAKE-1PILE ?auto_74561 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74568 - BLOCK
    )
    :vars
    (
      ?auto_74569 - BLOCK
      ?auto_74571 - BLOCK
      ?auto_74574 - BLOCK
      ?auto_74573 - BLOCK
      ?auto_74572 - BLOCK
      ?auto_74570 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74568 ?auto_74569 ) ) ( ON-TABLE ?auto_74571 ) ( ON ?auto_74574 ?auto_74571 ) ( ON ?auto_74573 ?auto_74574 ) ( not ( = ?auto_74571 ?auto_74574 ) ) ( not ( = ?auto_74571 ?auto_74573 ) ) ( not ( = ?auto_74571 ?auto_74572 ) ) ( not ( = ?auto_74571 ?auto_74569 ) ) ( not ( = ?auto_74571 ?auto_74568 ) ) ( not ( = ?auto_74574 ?auto_74573 ) ) ( not ( = ?auto_74574 ?auto_74572 ) ) ( not ( = ?auto_74574 ?auto_74569 ) ) ( not ( = ?auto_74574 ?auto_74568 ) ) ( not ( = ?auto_74573 ?auto_74572 ) ) ( not ( = ?auto_74573 ?auto_74569 ) ) ( not ( = ?auto_74573 ?auto_74568 ) ) ( not ( = ?auto_74572 ?auto_74569 ) ) ( not ( = ?auto_74572 ?auto_74568 ) ) ( ON ?auto_74568 ?auto_74570 ) ( not ( = ?auto_74568 ?auto_74570 ) ) ( not ( = ?auto_74569 ?auto_74570 ) ) ( not ( = ?auto_74571 ?auto_74570 ) ) ( not ( = ?auto_74574 ?auto_74570 ) ) ( not ( = ?auto_74573 ?auto_74570 ) ) ( not ( = ?auto_74572 ?auto_74570 ) ) ( ON ?auto_74569 ?auto_74568 ) ( ON-TABLE ?auto_74570 ) ( CLEAR ?auto_74573 ) ( ON ?auto_74572 ?auto_74569 ) ( CLEAR ?auto_74572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_74570 ?auto_74568 ?auto_74569 )
      ( MAKE-1PILE ?auto_74568 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74575 - BLOCK
    )
    :vars
    (
      ?auto_74581 - BLOCK
      ?auto_74577 - BLOCK
      ?auto_74578 - BLOCK
      ?auto_74576 - BLOCK
      ?auto_74579 - BLOCK
      ?auto_74580 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74575 ?auto_74581 ) ) ( ON-TABLE ?auto_74577 ) ( ON ?auto_74578 ?auto_74577 ) ( not ( = ?auto_74577 ?auto_74578 ) ) ( not ( = ?auto_74577 ?auto_74576 ) ) ( not ( = ?auto_74577 ?auto_74579 ) ) ( not ( = ?auto_74577 ?auto_74581 ) ) ( not ( = ?auto_74577 ?auto_74575 ) ) ( not ( = ?auto_74578 ?auto_74576 ) ) ( not ( = ?auto_74578 ?auto_74579 ) ) ( not ( = ?auto_74578 ?auto_74581 ) ) ( not ( = ?auto_74578 ?auto_74575 ) ) ( not ( = ?auto_74576 ?auto_74579 ) ) ( not ( = ?auto_74576 ?auto_74581 ) ) ( not ( = ?auto_74576 ?auto_74575 ) ) ( not ( = ?auto_74579 ?auto_74581 ) ) ( not ( = ?auto_74579 ?auto_74575 ) ) ( ON ?auto_74575 ?auto_74580 ) ( not ( = ?auto_74575 ?auto_74580 ) ) ( not ( = ?auto_74581 ?auto_74580 ) ) ( not ( = ?auto_74577 ?auto_74580 ) ) ( not ( = ?auto_74578 ?auto_74580 ) ) ( not ( = ?auto_74576 ?auto_74580 ) ) ( not ( = ?auto_74579 ?auto_74580 ) ) ( ON ?auto_74581 ?auto_74575 ) ( ON-TABLE ?auto_74580 ) ( ON ?auto_74579 ?auto_74581 ) ( CLEAR ?auto_74579 ) ( HOLDING ?auto_74576 ) ( CLEAR ?auto_74578 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_74577 ?auto_74578 ?auto_74576 )
      ( MAKE-1PILE ?auto_74575 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74582 - BLOCK
    )
    :vars
    (
      ?auto_74585 - BLOCK
      ?auto_74586 - BLOCK
      ?auto_74587 - BLOCK
      ?auto_74588 - BLOCK
      ?auto_74584 - BLOCK
      ?auto_74583 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74582 ?auto_74585 ) ) ( ON-TABLE ?auto_74586 ) ( ON ?auto_74587 ?auto_74586 ) ( not ( = ?auto_74586 ?auto_74587 ) ) ( not ( = ?auto_74586 ?auto_74588 ) ) ( not ( = ?auto_74586 ?auto_74584 ) ) ( not ( = ?auto_74586 ?auto_74585 ) ) ( not ( = ?auto_74586 ?auto_74582 ) ) ( not ( = ?auto_74587 ?auto_74588 ) ) ( not ( = ?auto_74587 ?auto_74584 ) ) ( not ( = ?auto_74587 ?auto_74585 ) ) ( not ( = ?auto_74587 ?auto_74582 ) ) ( not ( = ?auto_74588 ?auto_74584 ) ) ( not ( = ?auto_74588 ?auto_74585 ) ) ( not ( = ?auto_74588 ?auto_74582 ) ) ( not ( = ?auto_74584 ?auto_74585 ) ) ( not ( = ?auto_74584 ?auto_74582 ) ) ( ON ?auto_74582 ?auto_74583 ) ( not ( = ?auto_74582 ?auto_74583 ) ) ( not ( = ?auto_74585 ?auto_74583 ) ) ( not ( = ?auto_74586 ?auto_74583 ) ) ( not ( = ?auto_74587 ?auto_74583 ) ) ( not ( = ?auto_74588 ?auto_74583 ) ) ( not ( = ?auto_74584 ?auto_74583 ) ) ( ON ?auto_74585 ?auto_74582 ) ( ON-TABLE ?auto_74583 ) ( ON ?auto_74584 ?auto_74585 ) ( CLEAR ?auto_74587 ) ( ON ?auto_74588 ?auto_74584 ) ( CLEAR ?auto_74588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_74583 ?auto_74582 ?auto_74585 ?auto_74584 )
      ( MAKE-1PILE ?auto_74582 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74589 - BLOCK
    )
    :vars
    (
      ?auto_74593 - BLOCK
      ?auto_74592 - BLOCK
      ?auto_74594 - BLOCK
      ?auto_74595 - BLOCK
      ?auto_74591 - BLOCK
      ?auto_74590 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74589 ?auto_74593 ) ) ( ON-TABLE ?auto_74592 ) ( not ( = ?auto_74592 ?auto_74594 ) ) ( not ( = ?auto_74592 ?auto_74595 ) ) ( not ( = ?auto_74592 ?auto_74591 ) ) ( not ( = ?auto_74592 ?auto_74593 ) ) ( not ( = ?auto_74592 ?auto_74589 ) ) ( not ( = ?auto_74594 ?auto_74595 ) ) ( not ( = ?auto_74594 ?auto_74591 ) ) ( not ( = ?auto_74594 ?auto_74593 ) ) ( not ( = ?auto_74594 ?auto_74589 ) ) ( not ( = ?auto_74595 ?auto_74591 ) ) ( not ( = ?auto_74595 ?auto_74593 ) ) ( not ( = ?auto_74595 ?auto_74589 ) ) ( not ( = ?auto_74591 ?auto_74593 ) ) ( not ( = ?auto_74591 ?auto_74589 ) ) ( ON ?auto_74589 ?auto_74590 ) ( not ( = ?auto_74589 ?auto_74590 ) ) ( not ( = ?auto_74593 ?auto_74590 ) ) ( not ( = ?auto_74592 ?auto_74590 ) ) ( not ( = ?auto_74594 ?auto_74590 ) ) ( not ( = ?auto_74595 ?auto_74590 ) ) ( not ( = ?auto_74591 ?auto_74590 ) ) ( ON ?auto_74593 ?auto_74589 ) ( ON-TABLE ?auto_74590 ) ( ON ?auto_74591 ?auto_74593 ) ( ON ?auto_74595 ?auto_74591 ) ( CLEAR ?auto_74595 ) ( HOLDING ?auto_74594 ) ( CLEAR ?auto_74592 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_74592 ?auto_74594 )
      ( MAKE-1PILE ?auto_74589 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74596 - BLOCK
    )
    :vars
    (
      ?auto_74599 - BLOCK
      ?auto_74597 - BLOCK
      ?auto_74600 - BLOCK
      ?auto_74598 - BLOCK
      ?auto_74602 - BLOCK
      ?auto_74601 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74596 ?auto_74599 ) ) ( ON-TABLE ?auto_74597 ) ( not ( = ?auto_74597 ?auto_74600 ) ) ( not ( = ?auto_74597 ?auto_74598 ) ) ( not ( = ?auto_74597 ?auto_74602 ) ) ( not ( = ?auto_74597 ?auto_74599 ) ) ( not ( = ?auto_74597 ?auto_74596 ) ) ( not ( = ?auto_74600 ?auto_74598 ) ) ( not ( = ?auto_74600 ?auto_74602 ) ) ( not ( = ?auto_74600 ?auto_74599 ) ) ( not ( = ?auto_74600 ?auto_74596 ) ) ( not ( = ?auto_74598 ?auto_74602 ) ) ( not ( = ?auto_74598 ?auto_74599 ) ) ( not ( = ?auto_74598 ?auto_74596 ) ) ( not ( = ?auto_74602 ?auto_74599 ) ) ( not ( = ?auto_74602 ?auto_74596 ) ) ( ON ?auto_74596 ?auto_74601 ) ( not ( = ?auto_74596 ?auto_74601 ) ) ( not ( = ?auto_74599 ?auto_74601 ) ) ( not ( = ?auto_74597 ?auto_74601 ) ) ( not ( = ?auto_74600 ?auto_74601 ) ) ( not ( = ?auto_74598 ?auto_74601 ) ) ( not ( = ?auto_74602 ?auto_74601 ) ) ( ON ?auto_74599 ?auto_74596 ) ( ON-TABLE ?auto_74601 ) ( ON ?auto_74602 ?auto_74599 ) ( ON ?auto_74598 ?auto_74602 ) ( CLEAR ?auto_74597 ) ( ON ?auto_74600 ?auto_74598 ) ( CLEAR ?auto_74600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_74601 ?auto_74596 ?auto_74599 ?auto_74602 ?auto_74598 )
      ( MAKE-1PILE ?auto_74596 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74603 - BLOCK
    )
    :vars
    (
      ?auto_74606 - BLOCK
      ?auto_74608 - BLOCK
      ?auto_74609 - BLOCK
      ?auto_74605 - BLOCK
      ?auto_74604 - BLOCK
      ?auto_74607 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74603 ?auto_74606 ) ) ( not ( = ?auto_74608 ?auto_74609 ) ) ( not ( = ?auto_74608 ?auto_74605 ) ) ( not ( = ?auto_74608 ?auto_74604 ) ) ( not ( = ?auto_74608 ?auto_74606 ) ) ( not ( = ?auto_74608 ?auto_74603 ) ) ( not ( = ?auto_74609 ?auto_74605 ) ) ( not ( = ?auto_74609 ?auto_74604 ) ) ( not ( = ?auto_74609 ?auto_74606 ) ) ( not ( = ?auto_74609 ?auto_74603 ) ) ( not ( = ?auto_74605 ?auto_74604 ) ) ( not ( = ?auto_74605 ?auto_74606 ) ) ( not ( = ?auto_74605 ?auto_74603 ) ) ( not ( = ?auto_74604 ?auto_74606 ) ) ( not ( = ?auto_74604 ?auto_74603 ) ) ( ON ?auto_74603 ?auto_74607 ) ( not ( = ?auto_74603 ?auto_74607 ) ) ( not ( = ?auto_74606 ?auto_74607 ) ) ( not ( = ?auto_74608 ?auto_74607 ) ) ( not ( = ?auto_74609 ?auto_74607 ) ) ( not ( = ?auto_74605 ?auto_74607 ) ) ( not ( = ?auto_74604 ?auto_74607 ) ) ( ON ?auto_74606 ?auto_74603 ) ( ON-TABLE ?auto_74607 ) ( ON ?auto_74604 ?auto_74606 ) ( ON ?auto_74605 ?auto_74604 ) ( ON ?auto_74609 ?auto_74605 ) ( CLEAR ?auto_74609 ) ( HOLDING ?auto_74608 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_74608 )
      ( MAKE-1PILE ?auto_74603 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74610 - BLOCK
    )
    :vars
    (
      ?auto_74614 - BLOCK
      ?auto_74611 - BLOCK
      ?auto_74616 - BLOCK
      ?auto_74612 - BLOCK
      ?auto_74613 - BLOCK
      ?auto_74615 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74610 ?auto_74614 ) ) ( not ( = ?auto_74611 ?auto_74616 ) ) ( not ( = ?auto_74611 ?auto_74612 ) ) ( not ( = ?auto_74611 ?auto_74613 ) ) ( not ( = ?auto_74611 ?auto_74614 ) ) ( not ( = ?auto_74611 ?auto_74610 ) ) ( not ( = ?auto_74616 ?auto_74612 ) ) ( not ( = ?auto_74616 ?auto_74613 ) ) ( not ( = ?auto_74616 ?auto_74614 ) ) ( not ( = ?auto_74616 ?auto_74610 ) ) ( not ( = ?auto_74612 ?auto_74613 ) ) ( not ( = ?auto_74612 ?auto_74614 ) ) ( not ( = ?auto_74612 ?auto_74610 ) ) ( not ( = ?auto_74613 ?auto_74614 ) ) ( not ( = ?auto_74613 ?auto_74610 ) ) ( ON ?auto_74610 ?auto_74615 ) ( not ( = ?auto_74610 ?auto_74615 ) ) ( not ( = ?auto_74614 ?auto_74615 ) ) ( not ( = ?auto_74611 ?auto_74615 ) ) ( not ( = ?auto_74616 ?auto_74615 ) ) ( not ( = ?auto_74612 ?auto_74615 ) ) ( not ( = ?auto_74613 ?auto_74615 ) ) ( ON ?auto_74614 ?auto_74610 ) ( ON-TABLE ?auto_74615 ) ( ON ?auto_74613 ?auto_74614 ) ( ON ?auto_74612 ?auto_74613 ) ( ON ?auto_74616 ?auto_74612 ) ( ON ?auto_74611 ?auto_74616 ) ( CLEAR ?auto_74611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_74615 ?auto_74610 ?auto_74614 ?auto_74613 ?auto_74612 ?auto_74616 )
      ( MAKE-1PILE ?auto_74610 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_74621 - BLOCK
      ?auto_74622 - BLOCK
      ?auto_74623 - BLOCK
      ?auto_74624 - BLOCK
    )
    :vars
    (
      ?auto_74625 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74625 ?auto_74624 ) ( CLEAR ?auto_74625 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_74621 ) ( ON ?auto_74622 ?auto_74621 ) ( ON ?auto_74623 ?auto_74622 ) ( ON ?auto_74624 ?auto_74623 ) ( not ( = ?auto_74621 ?auto_74622 ) ) ( not ( = ?auto_74621 ?auto_74623 ) ) ( not ( = ?auto_74621 ?auto_74624 ) ) ( not ( = ?auto_74621 ?auto_74625 ) ) ( not ( = ?auto_74622 ?auto_74623 ) ) ( not ( = ?auto_74622 ?auto_74624 ) ) ( not ( = ?auto_74622 ?auto_74625 ) ) ( not ( = ?auto_74623 ?auto_74624 ) ) ( not ( = ?auto_74623 ?auto_74625 ) ) ( not ( = ?auto_74624 ?auto_74625 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_74625 ?auto_74624 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_74626 - BLOCK
      ?auto_74627 - BLOCK
      ?auto_74628 - BLOCK
      ?auto_74629 - BLOCK
    )
    :vars
    (
      ?auto_74630 - BLOCK
      ?auto_74631 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74630 ?auto_74629 ) ( CLEAR ?auto_74630 ) ( ON-TABLE ?auto_74626 ) ( ON ?auto_74627 ?auto_74626 ) ( ON ?auto_74628 ?auto_74627 ) ( ON ?auto_74629 ?auto_74628 ) ( not ( = ?auto_74626 ?auto_74627 ) ) ( not ( = ?auto_74626 ?auto_74628 ) ) ( not ( = ?auto_74626 ?auto_74629 ) ) ( not ( = ?auto_74626 ?auto_74630 ) ) ( not ( = ?auto_74627 ?auto_74628 ) ) ( not ( = ?auto_74627 ?auto_74629 ) ) ( not ( = ?auto_74627 ?auto_74630 ) ) ( not ( = ?auto_74628 ?auto_74629 ) ) ( not ( = ?auto_74628 ?auto_74630 ) ) ( not ( = ?auto_74629 ?auto_74630 ) ) ( HOLDING ?auto_74631 ) ( not ( = ?auto_74626 ?auto_74631 ) ) ( not ( = ?auto_74627 ?auto_74631 ) ) ( not ( = ?auto_74628 ?auto_74631 ) ) ( not ( = ?auto_74629 ?auto_74631 ) ) ( not ( = ?auto_74630 ?auto_74631 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_74631 )
      ( MAKE-4PILE ?auto_74626 ?auto_74627 ?auto_74628 ?auto_74629 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_74632 - BLOCK
      ?auto_74633 - BLOCK
      ?auto_74634 - BLOCK
      ?auto_74635 - BLOCK
    )
    :vars
    (
      ?auto_74637 - BLOCK
      ?auto_74636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74637 ?auto_74635 ) ( ON-TABLE ?auto_74632 ) ( ON ?auto_74633 ?auto_74632 ) ( ON ?auto_74634 ?auto_74633 ) ( ON ?auto_74635 ?auto_74634 ) ( not ( = ?auto_74632 ?auto_74633 ) ) ( not ( = ?auto_74632 ?auto_74634 ) ) ( not ( = ?auto_74632 ?auto_74635 ) ) ( not ( = ?auto_74632 ?auto_74637 ) ) ( not ( = ?auto_74633 ?auto_74634 ) ) ( not ( = ?auto_74633 ?auto_74635 ) ) ( not ( = ?auto_74633 ?auto_74637 ) ) ( not ( = ?auto_74634 ?auto_74635 ) ) ( not ( = ?auto_74634 ?auto_74637 ) ) ( not ( = ?auto_74635 ?auto_74637 ) ) ( not ( = ?auto_74632 ?auto_74636 ) ) ( not ( = ?auto_74633 ?auto_74636 ) ) ( not ( = ?auto_74634 ?auto_74636 ) ) ( not ( = ?auto_74635 ?auto_74636 ) ) ( not ( = ?auto_74637 ?auto_74636 ) ) ( ON ?auto_74636 ?auto_74637 ) ( CLEAR ?auto_74636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_74632 ?auto_74633 ?auto_74634 ?auto_74635 ?auto_74637 )
      ( MAKE-4PILE ?auto_74632 ?auto_74633 ?auto_74634 ?auto_74635 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_74638 - BLOCK
      ?auto_74639 - BLOCK
      ?auto_74640 - BLOCK
      ?auto_74641 - BLOCK
    )
    :vars
    (
      ?auto_74643 - BLOCK
      ?auto_74642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74643 ?auto_74641 ) ( ON-TABLE ?auto_74638 ) ( ON ?auto_74639 ?auto_74638 ) ( ON ?auto_74640 ?auto_74639 ) ( ON ?auto_74641 ?auto_74640 ) ( not ( = ?auto_74638 ?auto_74639 ) ) ( not ( = ?auto_74638 ?auto_74640 ) ) ( not ( = ?auto_74638 ?auto_74641 ) ) ( not ( = ?auto_74638 ?auto_74643 ) ) ( not ( = ?auto_74639 ?auto_74640 ) ) ( not ( = ?auto_74639 ?auto_74641 ) ) ( not ( = ?auto_74639 ?auto_74643 ) ) ( not ( = ?auto_74640 ?auto_74641 ) ) ( not ( = ?auto_74640 ?auto_74643 ) ) ( not ( = ?auto_74641 ?auto_74643 ) ) ( not ( = ?auto_74638 ?auto_74642 ) ) ( not ( = ?auto_74639 ?auto_74642 ) ) ( not ( = ?auto_74640 ?auto_74642 ) ) ( not ( = ?auto_74641 ?auto_74642 ) ) ( not ( = ?auto_74643 ?auto_74642 ) ) ( HOLDING ?auto_74642 ) ( CLEAR ?auto_74643 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_74638 ?auto_74639 ?auto_74640 ?auto_74641 ?auto_74643 ?auto_74642 )
      ( MAKE-4PILE ?auto_74638 ?auto_74639 ?auto_74640 ?auto_74641 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_74644 - BLOCK
      ?auto_74645 - BLOCK
      ?auto_74646 - BLOCK
      ?auto_74647 - BLOCK
    )
    :vars
    (
      ?auto_74649 - BLOCK
      ?auto_74648 - BLOCK
      ?auto_74650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74649 ?auto_74647 ) ( ON-TABLE ?auto_74644 ) ( ON ?auto_74645 ?auto_74644 ) ( ON ?auto_74646 ?auto_74645 ) ( ON ?auto_74647 ?auto_74646 ) ( not ( = ?auto_74644 ?auto_74645 ) ) ( not ( = ?auto_74644 ?auto_74646 ) ) ( not ( = ?auto_74644 ?auto_74647 ) ) ( not ( = ?auto_74644 ?auto_74649 ) ) ( not ( = ?auto_74645 ?auto_74646 ) ) ( not ( = ?auto_74645 ?auto_74647 ) ) ( not ( = ?auto_74645 ?auto_74649 ) ) ( not ( = ?auto_74646 ?auto_74647 ) ) ( not ( = ?auto_74646 ?auto_74649 ) ) ( not ( = ?auto_74647 ?auto_74649 ) ) ( not ( = ?auto_74644 ?auto_74648 ) ) ( not ( = ?auto_74645 ?auto_74648 ) ) ( not ( = ?auto_74646 ?auto_74648 ) ) ( not ( = ?auto_74647 ?auto_74648 ) ) ( not ( = ?auto_74649 ?auto_74648 ) ) ( CLEAR ?auto_74649 ) ( ON ?auto_74648 ?auto_74650 ) ( CLEAR ?auto_74648 ) ( HAND-EMPTY ) ( not ( = ?auto_74644 ?auto_74650 ) ) ( not ( = ?auto_74645 ?auto_74650 ) ) ( not ( = ?auto_74646 ?auto_74650 ) ) ( not ( = ?auto_74647 ?auto_74650 ) ) ( not ( = ?auto_74649 ?auto_74650 ) ) ( not ( = ?auto_74648 ?auto_74650 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_74648 ?auto_74650 )
      ( MAKE-4PILE ?auto_74644 ?auto_74645 ?auto_74646 ?auto_74647 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_74665 - BLOCK
      ?auto_74666 - BLOCK
      ?auto_74667 - BLOCK
      ?auto_74668 - BLOCK
    )
    :vars
    (
      ?auto_74669 - BLOCK
      ?auto_74670 - BLOCK
      ?auto_74671 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74665 ) ( ON ?auto_74666 ?auto_74665 ) ( ON ?auto_74667 ?auto_74666 ) ( not ( = ?auto_74665 ?auto_74666 ) ) ( not ( = ?auto_74665 ?auto_74667 ) ) ( not ( = ?auto_74665 ?auto_74668 ) ) ( not ( = ?auto_74665 ?auto_74669 ) ) ( not ( = ?auto_74666 ?auto_74667 ) ) ( not ( = ?auto_74666 ?auto_74668 ) ) ( not ( = ?auto_74666 ?auto_74669 ) ) ( not ( = ?auto_74667 ?auto_74668 ) ) ( not ( = ?auto_74667 ?auto_74669 ) ) ( not ( = ?auto_74668 ?auto_74669 ) ) ( not ( = ?auto_74665 ?auto_74670 ) ) ( not ( = ?auto_74666 ?auto_74670 ) ) ( not ( = ?auto_74667 ?auto_74670 ) ) ( not ( = ?auto_74668 ?auto_74670 ) ) ( not ( = ?auto_74669 ?auto_74670 ) ) ( ON ?auto_74670 ?auto_74671 ) ( not ( = ?auto_74665 ?auto_74671 ) ) ( not ( = ?auto_74666 ?auto_74671 ) ) ( not ( = ?auto_74667 ?auto_74671 ) ) ( not ( = ?auto_74668 ?auto_74671 ) ) ( not ( = ?auto_74669 ?auto_74671 ) ) ( not ( = ?auto_74670 ?auto_74671 ) ) ( ON ?auto_74669 ?auto_74670 ) ( CLEAR ?auto_74669 ) ( HOLDING ?auto_74668 ) ( CLEAR ?auto_74667 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_74665 ?auto_74666 ?auto_74667 ?auto_74668 ?auto_74669 )
      ( MAKE-4PILE ?auto_74665 ?auto_74666 ?auto_74667 ?auto_74668 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_74672 - BLOCK
      ?auto_74673 - BLOCK
      ?auto_74674 - BLOCK
      ?auto_74675 - BLOCK
    )
    :vars
    (
      ?auto_74677 - BLOCK
      ?auto_74678 - BLOCK
      ?auto_74676 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74672 ) ( ON ?auto_74673 ?auto_74672 ) ( ON ?auto_74674 ?auto_74673 ) ( not ( = ?auto_74672 ?auto_74673 ) ) ( not ( = ?auto_74672 ?auto_74674 ) ) ( not ( = ?auto_74672 ?auto_74675 ) ) ( not ( = ?auto_74672 ?auto_74677 ) ) ( not ( = ?auto_74673 ?auto_74674 ) ) ( not ( = ?auto_74673 ?auto_74675 ) ) ( not ( = ?auto_74673 ?auto_74677 ) ) ( not ( = ?auto_74674 ?auto_74675 ) ) ( not ( = ?auto_74674 ?auto_74677 ) ) ( not ( = ?auto_74675 ?auto_74677 ) ) ( not ( = ?auto_74672 ?auto_74678 ) ) ( not ( = ?auto_74673 ?auto_74678 ) ) ( not ( = ?auto_74674 ?auto_74678 ) ) ( not ( = ?auto_74675 ?auto_74678 ) ) ( not ( = ?auto_74677 ?auto_74678 ) ) ( ON ?auto_74678 ?auto_74676 ) ( not ( = ?auto_74672 ?auto_74676 ) ) ( not ( = ?auto_74673 ?auto_74676 ) ) ( not ( = ?auto_74674 ?auto_74676 ) ) ( not ( = ?auto_74675 ?auto_74676 ) ) ( not ( = ?auto_74677 ?auto_74676 ) ) ( not ( = ?auto_74678 ?auto_74676 ) ) ( ON ?auto_74677 ?auto_74678 ) ( CLEAR ?auto_74674 ) ( ON ?auto_74675 ?auto_74677 ) ( CLEAR ?auto_74675 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_74676 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_74676 ?auto_74678 ?auto_74677 )
      ( MAKE-4PILE ?auto_74672 ?auto_74673 ?auto_74674 ?auto_74675 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_74679 - BLOCK
      ?auto_74680 - BLOCK
      ?auto_74681 - BLOCK
      ?auto_74682 - BLOCK
    )
    :vars
    (
      ?auto_74684 - BLOCK
      ?auto_74683 - BLOCK
      ?auto_74685 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74679 ) ( ON ?auto_74680 ?auto_74679 ) ( not ( = ?auto_74679 ?auto_74680 ) ) ( not ( = ?auto_74679 ?auto_74681 ) ) ( not ( = ?auto_74679 ?auto_74682 ) ) ( not ( = ?auto_74679 ?auto_74684 ) ) ( not ( = ?auto_74680 ?auto_74681 ) ) ( not ( = ?auto_74680 ?auto_74682 ) ) ( not ( = ?auto_74680 ?auto_74684 ) ) ( not ( = ?auto_74681 ?auto_74682 ) ) ( not ( = ?auto_74681 ?auto_74684 ) ) ( not ( = ?auto_74682 ?auto_74684 ) ) ( not ( = ?auto_74679 ?auto_74683 ) ) ( not ( = ?auto_74680 ?auto_74683 ) ) ( not ( = ?auto_74681 ?auto_74683 ) ) ( not ( = ?auto_74682 ?auto_74683 ) ) ( not ( = ?auto_74684 ?auto_74683 ) ) ( ON ?auto_74683 ?auto_74685 ) ( not ( = ?auto_74679 ?auto_74685 ) ) ( not ( = ?auto_74680 ?auto_74685 ) ) ( not ( = ?auto_74681 ?auto_74685 ) ) ( not ( = ?auto_74682 ?auto_74685 ) ) ( not ( = ?auto_74684 ?auto_74685 ) ) ( not ( = ?auto_74683 ?auto_74685 ) ) ( ON ?auto_74684 ?auto_74683 ) ( ON ?auto_74682 ?auto_74684 ) ( CLEAR ?auto_74682 ) ( ON-TABLE ?auto_74685 ) ( HOLDING ?auto_74681 ) ( CLEAR ?auto_74680 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_74679 ?auto_74680 ?auto_74681 )
      ( MAKE-4PILE ?auto_74679 ?auto_74680 ?auto_74681 ?auto_74682 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_74686 - BLOCK
      ?auto_74687 - BLOCK
      ?auto_74688 - BLOCK
      ?auto_74689 - BLOCK
    )
    :vars
    (
      ?auto_74691 - BLOCK
      ?auto_74690 - BLOCK
      ?auto_74692 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74686 ) ( ON ?auto_74687 ?auto_74686 ) ( not ( = ?auto_74686 ?auto_74687 ) ) ( not ( = ?auto_74686 ?auto_74688 ) ) ( not ( = ?auto_74686 ?auto_74689 ) ) ( not ( = ?auto_74686 ?auto_74691 ) ) ( not ( = ?auto_74687 ?auto_74688 ) ) ( not ( = ?auto_74687 ?auto_74689 ) ) ( not ( = ?auto_74687 ?auto_74691 ) ) ( not ( = ?auto_74688 ?auto_74689 ) ) ( not ( = ?auto_74688 ?auto_74691 ) ) ( not ( = ?auto_74689 ?auto_74691 ) ) ( not ( = ?auto_74686 ?auto_74690 ) ) ( not ( = ?auto_74687 ?auto_74690 ) ) ( not ( = ?auto_74688 ?auto_74690 ) ) ( not ( = ?auto_74689 ?auto_74690 ) ) ( not ( = ?auto_74691 ?auto_74690 ) ) ( ON ?auto_74690 ?auto_74692 ) ( not ( = ?auto_74686 ?auto_74692 ) ) ( not ( = ?auto_74687 ?auto_74692 ) ) ( not ( = ?auto_74688 ?auto_74692 ) ) ( not ( = ?auto_74689 ?auto_74692 ) ) ( not ( = ?auto_74691 ?auto_74692 ) ) ( not ( = ?auto_74690 ?auto_74692 ) ) ( ON ?auto_74691 ?auto_74690 ) ( ON ?auto_74689 ?auto_74691 ) ( ON-TABLE ?auto_74692 ) ( CLEAR ?auto_74687 ) ( ON ?auto_74688 ?auto_74689 ) ( CLEAR ?auto_74688 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_74692 ?auto_74690 ?auto_74691 ?auto_74689 )
      ( MAKE-4PILE ?auto_74686 ?auto_74687 ?auto_74688 ?auto_74689 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_74693 - BLOCK
      ?auto_74694 - BLOCK
      ?auto_74695 - BLOCK
      ?auto_74696 - BLOCK
    )
    :vars
    (
      ?auto_74699 - BLOCK
      ?auto_74698 - BLOCK
      ?auto_74697 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74693 ) ( not ( = ?auto_74693 ?auto_74694 ) ) ( not ( = ?auto_74693 ?auto_74695 ) ) ( not ( = ?auto_74693 ?auto_74696 ) ) ( not ( = ?auto_74693 ?auto_74699 ) ) ( not ( = ?auto_74694 ?auto_74695 ) ) ( not ( = ?auto_74694 ?auto_74696 ) ) ( not ( = ?auto_74694 ?auto_74699 ) ) ( not ( = ?auto_74695 ?auto_74696 ) ) ( not ( = ?auto_74695 ?auto_74699 ) ) ( not ( = ?auto_74696 ?auto_74699 ) ) ( not ( = ?auto_74693 ?auto_74698 ) ) ( not ( = ?auto_74694 ?auto_74698 ) ) ( not ( = ?auto_74695 ?auto_74698 ) ) ( not ( = ?auto_74696 ?auto_74698 ) ) ( not ( = ?auto_74699 ?auto_74698 ) ) ( ON ?auto_74698 ?auto_74697 ) ( not ( = ?auto_74693 ?auto_74697 ) ) ( not ( = ?auto_74694 ?auto_74697 ) ) ( not ( = ?auto_74695 ?auto_74697 ) ) ( not ( = ?auto_74696 ?auto_74697 ) ) ( not ( = ?auto_74699 ?auto_74697 ) ) ( not ( = ?auto_74698 ?auto_74697 ) ) ( ON ?auto_74699 ?auto_74698 ) ( ON ?auto_74696 ?auto_74699 ) ( ON-TABLE ?auto_74697 ) ( ON ?auto_74695 ?auto_74696 ) ( CLEAR ?auto_74695 ) ( HOLDING ?auto_74694 ) ( CLEAR ?auto_74693 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_74693 ?auto_74694 )
      ( MAKE-4PILE ?auto_74693 ?auto_74694 ?auto_74695 ?auto_74696 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_74700 - BLOCK
      ?auto_74701 - BLOCK
      ?auto_74702 - BLOCK
      ?auto_74703 - BLOCK
    )
    :vars
    (
      ?auto_74704 - BLOCK
      ?auto_74705 - BLOCK
      ?auto_74706 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74700 ) ( not ( = ?auto_74700 ?auto_74701 ) ) ( not ( = ?auto_74700 ?auto_74702 ) ) ( not ( = ?auto_74700 ?auto_74703 ) ) ( not ( = ?auto_74700 ?auto_74704 ) ) ( not ( = ?auto_74701 ?auto_74702 ) ) ( not ( = ?auto_74701 ?auto_74703 ) ) ( not ( = ?auto_74701 ?auto_74704 ) ) ( not ( = ?auto_74702 ?auto_74703 ) ) ( not ( = ?auto_74702 ?auto_74704 ) ) ( not ( = ?auto_74703 ?auto_74704 ) ) ( not ( = ?auto_74700 ?auto_74705 ) ) ( not ( = ?auto_74701 ?auto_74705 ) ) ( not ( = ?auto_74702 ?auto_74705 ) ) ( not ( = ?auto_74703 ?auto_74705 ) ) ( not ( = ?auto_74704 ?auto_74705 ) ) ( ON ?auto_74705 ?auto_74706 ) ( not ( = ?auto_74700 ?auto_74706 ) ) ( not ( = ?auto_74701 ?auto_74706 ) ) ( not ( = ?auto_74702 ?auto_74706 ) ) ( not ( = ?auto_74703 ?auto_74706 ) ) ( not ( = ?auto_74704 ?auto_74706 ) ) ( not ( = ?auto_74705 ?auto_74706 ) ) ( ON ?auto_74704 ?auto_74705 ) ( ON ?auto_74703 ?auto_74704 ) ( ON-TABLE ?auto_74706 ) ( ON ?auto_74702 ?auto_74703 ) ( CLEAR ?auto_74700 ) ( ON ?auto_74701 ?auto_74702 ) ( CLEAR ?auto_74701 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_74706 ?auto_74705 ?auto_74704 ?auto_74703 ?auto_74702 )
      ( MAKE-4PILE ?auto_74700 ?auto_74701 ?auto_74702 ?auto_74703 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_74707 - BLOCK
      ?auto_74708 - BLOCK
      ?auto_74709 - BLOCK
      ?auto_74710 - BLOCK
    )
    :vars
    (
      ?auto_74711 - BLOCK
      ?auto_74712 - BLOCK
      ?auto_74713 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74707 ?auto_74708 ) ) ( not ( = ?auto_74707 ?auto_74709 ) ) ( not ( = ?auto_74707 ?auto_74710 ) ) ( not ( = ?auto_74707 ?auto_74711 ) ) ( not ( = ?auto_74708 ?auto_74709 ) ) ( not ( = ?auto_74708 ?auto_74710 ) ) ( not ( = ?auto_74708 ?auto_74711 ) ) ( not ( = ?auto_74709 ?auto_74710 ) ) ( not ( = ?auto_74709 ?auto_74711 ) ) ( not ( = ?auto_74710 ?auto_74711 ) ) ( not ( = ?auto_74707 ?auto_74712 ) ) ( not ( = ?auto_74708 ?auto_74712 ) ) ( not ( = ?auto_74709 ?auto_74712 ) ) ( not ( = ?auto_74710 ?auto_74712 ) ) ( not ( = ?auto_74711 ?auto_74712 ) ) ( ON ?auto_74712 ?auto_74713 ) ( not ( = ?auto_74707 ?auto_74713 ) ) ( not ( = ?auto_74708 ?auto_74713 ) ) ( not ( = ?auto_74709 ?auto_74713 ) ) ( not ( = ?auto_74710 ?auto_74713 ) ) ( not ( = ?auto_74711 ?auto_74713 ) ) ( not ( = ?auto_74712 ?auto_74713 ) ) ( ON ?auto_74711 ?auto_74712 ) ( ON ?auto_74710 ?auto_74711 ) ( ON-TABLE ?auto_74713 ) ( ON ?auto_74709 ?auto_74710 ) ( ON ?auto_74708 ?auto_74709 ) ( CLEAR ?auto_74708 ) ( HOLDING ?auto_74707 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_74707 )
      ( MAKE-4PILE ?auto_74707 ?auto_74708 ?auto_74709 ?auto_74710 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_74714 - BLOCK
      ?auto_74715 - BLOCK
      ?auto_74716 - BLOCK
      ?auto_74717 - BLOCK
    )
    :vars
    (
      ?auto_74720 - BLOCK
      ?auto_74719 - BLOCK
      ?auto_74718 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74714 ?auto_74715 ) ) ( not ( = ?auto_74714 ?auto_74716 ) ) ( not ( = ?auto_74714 ?auto_74717 ) ) ( not ( = ?auto_74714 ?auto_74720 ) ) ( not ( = ?auto_74715 ?auto_74716 ) ) ( not ( = ?auto_74715 ?auto_74717 ) ) ( not ( = ?auto_74715 ?auto_74720 ) ) ( not ( = ?auto_74716 ?auto_74717 ) ) ( not ( = ?auto_74716 ?auto_74720 ) ) ( not ( = ?auto_74717 ?auto_74720 ) ) ( not ( = ?auto_74714 ?auto_74719 ) ) ( not ( = ?auto_74715 ?auto_74719 ) ) ( not ( = ?auto_74716 ?auto_74719 ) ) ( not ( = ?auto_74717 ?auto_74719 ) ) ( not ( = ?auto_74720 ?auto_74719 ) ) ( ON ?auto_74719 ?auto_74718 ) ( not ( = ?auto_74714 ?auto_74718 ) ) ( not ( = ?auto_74715 ?auto_74718 ) ) ( not ( = ?auto_74716 ?auto_74718 ) ) ( not ( = ?auto_74717 ?auto_74718 ) ) ( not ( = ?auto_74720 ?auto_74718 ) ) ( not ( = ?auto_74719 ?auto_74718 ) ) ( ON ?auto_74720 ?auto_74719 ) ( ON ?auto_74717 ?auto_74720 ) ( ON-TABLE ?auto_74718 ) ( ON ?auto_74716 ?auto_74717 ) ( ON ?auto_74715 ?auto_74716 ) ( ON ?auto_74714 ?auto_74715 ) ( CLEAR ?auto_74714 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_74718 ?auto_74719 ?auto_74720 ?auto_74717 ?auto_74716 ?auto_74715 )
      ( MAKE-4PILE ?auto_74714 ?auto_74715 ?auto_74716 ?auto_74717 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_74723 - BLOCK
      ?auto_74724 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_74724 ) ( CLEAR ?auto_74723 ) ( ON-TABLE ?auto_74723 ) ( not ( = ?auto_74723 ?auto_74724 ) ) )
    :subtasks
    ( ( !STACK ?auto_74724 ?auto_74723 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_74725 - BLOCK
      ?auto_74726 - BLOCK
    )
    :vars
    (
      ?auto_74727 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_74725 ) ( ON-TABLE ?auto_74725 ) ( not ( = ?auto_74725 ?auto_74726 ) ) ( ON ?auto_74726 ?auto_74727 ) ( CLEAR ?auto_74726 ) ( HAND-EMPTY ) ( not ( = ?auto_74725 ?auto_74727 ) ) ( not ( = ?auto_74726 ?auto_74727 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_74726 ?auto_74727 )
      ( MAKE-2PILE ?auto_74725 ?auto_74726 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_74728 - BLOCK
      ?auto_74729 - BLOCK
    )
    :vars
    (
      ?auto_74730 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74728 ?auto_74729 ) ) ( ON ?auto_74729 ?auto_74730 ) ( CLEAR ?auto_74729 ) ( not ( = ?auto_74728 ?auto_74730 ) ) ( not ( = ?auto_74729 ?auto_74730 ) ) ( HOLDING ?auto_74728 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_74728 )
      ( MAKE-2PILE ?auto_74728 ?auto_74729 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_74731 - BLOCK
      ?auto_74732 - BLOCK
    )
    :vars
    (
      ?auto_74733 - BLOCK
      ?auto_74736 - BLOCK
      ?auto_74735 - BLOCK
      ?auto_74734 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74731 ?auto_74732 ) ) ( ON ?auto_74732 ?auto_74733 ) ( not ( = ?auto_74731 ?auto_74733 ) ) ( not ( = ?auto_74732 ?auto_74733 ) ) ( ON ?auto_74731 ?auto_74732 ) ( CLEAR ?auto_74731 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_74736 ) ( ON ?auto_74735 ?auto_74736 ) ( ON ?auto_74734 ?auto_74735 ) ( ON ?auto_74733 ?auto_74734 ) ( not ( = ?auto_74736 ?auto_74735 ) ) ( not ( = ?auto_74736 ?auto_74734 ) ) ( not ( = ?auto_74736 ?auto_74733 ) ) ( not ( = ?auto_74736 ?auto_74732 ) ) ( not ( = ?auto_74736 ?auto_74731 ) ) ( not ( = ?auto_74735 ?auto_74734 ) ) ( not ( = ?auto_74735 ?auto_74733 ) ) ( not ( = ?auto_74735 ?auto_74732 ) ) ( not ( = ?auto_74735 ?auto_74731 ) ) ( not ( = ?auto_74734 ?auto_74733 ) ) ( not ( = ?auto_74734 ?auto_74732 ) ) ( not ( = ?auto_74734 ?auto_74731 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_74736 ?auto_74735 ?auto_74734 ?auto_74733 ?auto_74732 )
      ( MAKE-2PILE ?auto_74731 ?auto_74732 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_74737 - BLOCK
      ?auto_74738 - BLOCK
    )
    :vars
    (
      ?auto_74740 - BLOCK
      ?auto_74742 - BLOCK
      ?auto_74739 - BLOCK
      ?auto_74741 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74737 ?auto_74738 ) ) ( ON ?auto_74738 ?auto_74740 ) ( not ( = ?auto_74737 ?auto_74740 ) ) ( not ( = ?auto_74738 ?auto_74740 ) ) ( ON-TABLE ?auto_74742 ) ( ON ?auto_74739 ?auto_74742 ) ( ON ?auto_74741 ?auto_74739 ) ( ON ?auto_74740 ?auto_74741 ) ( not ( = ?auto_74742 ?auto_74739 ) ) ( not ( = ?auto_74742 ?auto_74741 ) ) ( not ( = ?auto_74742 ?auto_74740 ) ) ( not ( = ?auto_74742 ?auto_74738 ) ) ( not ( = ?auto_74742 ?auto_74737 ) ) ( not ( = ?auto_74739 ?auto_74741 ) ) ( not ( = ?auto_74739 ?auto_74740 ) ) ( not ( = ?auto_74739 ?auto_74738 ) ) ( not ( = ?auto_74739 ?auto_74737 ) ) ( not ( = ?auto_74741 ?auto_74740 ) ) ( not ( = ?auto_74741 ?auto_74738 ) ) ( not ( = ?auto_74741 ?auto_74737 ) ) ( HOLDING ?auto_74737 ) ( CLEAR ?auto_74738 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_74742 ?auto_74739 ?auto_74741 ?auto_74740 ?auto_74738 ?auto_74737 )
      ( MAKE-2PILE ?auto_74737 ?auto_74738 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_74743 - BLOCK
      ?auto_74744 - BLOCK
    )
    :vars
    (
      ?auto_74746 - BLOCK
      ?auto_74748 - BLOCK
      ?auto_74745 - BLOCK
      ?auto_74747 - BLOCK
      ?auto_74749 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74743 ?auto_74744 ) ) ( ON ?auto_74744 ?auto_74746 ) ( not ( = ?auto_74743 ?auto_74746 ) ) ( not ( = ?auto_74744 ?auto_74746 ) ) ( ON-TABLE ?auto_74748 ) ( ON ?auto_74745 ?auto_74748 ) ( ON ?auto_74747 ?auto_74745 ) ( ON ?auto_74746 ?auto_74747 ) ( not ( = ?auto_74748 ?auto_74745 ) ) ( not ( = ?auto_74748 ?auto_74747 ) ) ( not ( = ?auto_74748 ?auto_74746 ) ) ( not ( = ?auto_74748 ?auto_74744 ) ) ( not ( = ?auto_74748 ?auto_74743 ) ) ( not ( = ?auto_74745 ?auto_74747 ) ) ( not ( = ?auto_74745 ?auto_74746 ) ) ( not ( = ?auto_74745 ?auto_74744 ) ) ( not ( = ?auto_74745 ?auto_74743 ) ) ( not ( = ?auto_74747 ?auto_74746 ) ) ( not ( = ?auto_74747 ?auto_74744 ) ) ( not ( = ?auto_74747 ?auto_74743 ) ) ( CLEAR ?auto_74744 ) ( ON ?auto_74743 ?auto_74749 ) ( CLEAR ?auto_74743 ) ( HAND-EMPTY ) ( not ( = ?auto_74743 ?auto_74749 ) ) ( not ( = ?auto_74744 ?auto_74749 ) ) ( not ( = ?auto_74746 ?auto_74749 ) ) ( not ( = ?auto_74748 ?auto_74749 ) ) ( not ( = ?auto_74745 ?auto_74749 ) ) ( not ( = ?auto_74747 ?auto_74749 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_74743 ?auto_74749 )
      ( MAKE-2PILE ?auto_74743 ?auto_74744 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_74750 - BLOCK
      ?auto_74751 - BLOCK
    )
    :vars
    (
      ?auto_74754 - BLOCK
      ?auto_74756 - BLOCK
      ?auto_74753 - BLOCK
      ?auto_74755 - BLOCK
      ?auto_74752 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74750 ?auto_74751 ) ) ( not ( = ?auto_74750 ?auto_74754 ) ) ( not ( = ?auto_74751 ?auto_74754 ) ) ( ON-TABLE ?auto_74756 ) ( ON ?auto_74753 ?auto_74756 ) ( ON ?auto_74755 ?auto_74753 ) ( ON ?auto_74754 ?auto_74755 ) ( not ( = ?auto_74756 ?auto_74753 ) ) ( not ( = ?auto_74756 ?auto_74755 ) ) ( not ( = ?auto_74756 ?auto_74754 ) ) ( not ( = ?auto_74756 ?auto_74751 ) ) ( not ( = ?auto_74756 ?auto_74750 ) ) ( not ( = ?auto_74753 ?auto_74755 ) ) ( not ( = ?auto_74753 ?auto_74754 ) ) ( not ( = ?auto_74753 ?auto_74751 ) ) ( not ( = ?auto_74753 ?auto_74750 ) ) ( not ( = ?auto_74755 ?auto_74754 ) ) ( not ( = ?auto_74755 ?auto_74751 ) ) ( not ( = ?auto_74755 ?auto_74750 ) ) ( ON ?auto_74750 ?auto_74752 ) ( CLEAR ?auto_74750 ) ( not ( = ?auto_74750 ?auto_74752 ) ) ( not ( = ?auto_74751 ?auto_74752 ) ) ( not ( = ?auto_74754 ?auto_74752 ) ) ( not ( = ?auto_74756 ?auto_74752 ) ) ( not ( = ?auto_74753 ?auto_74752 ) ) ( not ( = ?auto_74755 ?auto_74752 ) ) ( HOLDING ?auto_74751 ) ( CLEAR ?auto_74754 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_74756 ?auto_74753 ?auto_74755 ?auto_74754 ?auto_74751 )
      ( MAKE-2PILE ?auto_74750 ?auto_74751 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_74757 - BLOCK
      ?auto_74758 - BLOCK
    )
    :vars
    (
      ?auto_74759 - BLOCK
      ?auto_74762 - BLOCK
      ?auto_74763 - BLOCK
      ?auto_74761 - BLOCK
      ?auto_74760 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74757 ?auto_74758 ) ) ( not ( = ?auto_74757 ?auto_74759 ) ) ( not ( = ?auto_74758 ?auto_74759 ) ) ( ON-TABLE ?auto_74762 ) ( ON ?auto_74763 ?auto_74762 ) ( ON ?auto_74761 ?auto_74763 ) ( ON ?auto_74759 ?auto_74761 ) ( not ( = ?auto_74762 ?auto_74763 ) ) ( not ( = ?auto_74762 ?auto_74761 ) ) ( not ( = ?auto_74762 ?auto_74759 ) ) ( not ( = ?auto_74762 ?auto_74758 ) ) ( not ( = ?auto_74762 ?auto_74757 ) ) ( not ( = ?auto_74763 ?auto_74761 ) ) ( not ( = ?auto_74763 ?auto_74759 ) ) ( not ( = ?auto_74763 ?auto_74758 ) ) ( not ( = ?auto_74763 ?auto_74757 ) ) ( not ( = ?auto_74761 ?auto_74759 ) ) ( not ( = ?auto_74761 ?auto_74758 ) ) ( not ( = ?auto_74761 ?auto_74757 ) ) ( ON ?auto_74757 ?auto_74760 ) ( not ( = ?auto_74757 ?auto_74760 ) ) ( not ( = ?auto_74758 ?auto_74760 ) ) ( not ( = ?auto_74759 ?auto_74760 ) ) ( not ( = ?auto_74762 ?auto_74760 ) ) ( not ( = ?auto_74763 ?auto_74760 ) ) ( not ( = ?auto_74761 ?auto_74760 ) ) ( CLEAR ?auto_74759 ) ( ON ?auto_74758 ?auto_74757 ) ( CLEAR ?auto_74758 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_74760 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_74760 ?auto_74757 )
      ( MAKE-2PILE ?auto_74757 ?auto_74758 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_74764 - BLOCK
      ?auto_74765 - BLOCK
    )
    :vars
    (
      ?auto_74766 - BLOCK
      ?auto_74767 - BLOCK
      ?auto_74768 - BLOCK
      ?auto_74770 - BLOCK
      ?auto_74769 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74764 ?auto_74765 ) ) ( not ( = ?auto_74764 ?auto_74766 ) ) ( not ( = ?auto_74765 ?auto_74766 ) ) ( ON-TABLE ?auto_74767 ) ( ON ?auto_74768 ?auto_74767 ) ( ON ?auto_74770 ?auto_74768 ) ( not ( = ?auto_74767 ?auto_74768 ) ) ( not ( = ?auto_74767 ?auto_74770 ) ) ( not ( = ?auto_74767 ?auto_74766 ) ) ( not ( = ?auto_74767 ?auto_74765 ) ) ( not ( = ?auto_74767 ?auto_74764 ) ) ( not ( = ?auto_74768 ?auto_74770 ) ) ( not ( = ?auto_74768 ?auto_74766 ) ) ( not ( = ?auto_74768 ?auto_74765 ) ) ( not ( = ?auto_74768 ?auto_74764 ) ) ( not ( = ?auto_74770 ?auto_74766 ) ) ( not ( = ?auto_74770 ?auto_74765 ) ) ( not ( = ?auto_74770 ?auto_74764 ) ) ( ON ?auto_74764 ?auto_74769 ) ( not ( = ?auto_74764 ?auto_74769 ) ) ( not ( = ?auto_74765 ?auto_74769 ) ) ( not ( = ?auto_74766 ?auto_74769 ) ) ( not ( = ?auto_74767 ?auto_74769 ) ) ( not ( = ?auto_74768 ?auto_74769 ) ) ( not ( = ?auto_74770 ?auto_74769 ) ) ( ON ?auto_74765 ?auto_74764 ) ( CLEAR ?auto_74765 ) ( ON-TABLE ?auto_74769 ) ( HOLDING ?auto_74766 ) ( CLEAR ?auto_74770 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_74767 ?auto_74768 ?auto_74770 ?auto_74766 )
      ( MAKE-2PILE ?auto_74764 ?auto_74765 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_74771 - BLOCK
      ?auto_74772 - BLOCK
    )
    :vars
    (
      ?auto_74775 - BLOCK
      ?auto_74774 - BLOCK
      ?auto_74776 - BLOCK
      ?auto_74773 - BLOCK
      ?auto_74777 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74771 ?auto_74772 ) ) ( not ( = ?auto_74771 ?auto_74775 ) ) ( not ( = ?auto_74772 ?auto_74775 ) ) ( ON-TABLE ?auto_74774 ) ( ON ?auto_74776 ?auto_74774 ) ( ON ?auto_74773 ?auto_74776 ) ( not ( = ?auto_74774 ?auto_74776 ) ) ( not ( = ?auto_74774 ?auto_74773 ) ) ( not ( = ?auto_74774 ?auto_74775 ) ) ( not ( = ?auto_74774 ?auto_74772 ) ) ( not ( = ?auto_74774 ?auto_74771 ) ) ( not ( = ?auto_74776 ?auto_74773 ) ) ( not ( = ?auto_74776 ?auto_74775 ) ) ( not ( = ?auto_74776 ?auto_74772 ) ) ( not ( = ?auto_74776 ?auto_74771 ) ) ( not ( = ?auto_74773 ?auto_74775 ) ) ( not ( = ?auto_74773 ?auto_74772 ) ) ( not ( = ?auto_74773 ?auto_74771 ) ) ( ON ?auto_74771 ?auto_74777 ) ( not ( = ?auto_74771 ?auto_74777 ) ) ( not ( = ?auto_74772 ?auto_74777 ) ) ( not ( = ?auto_74775 ?auto_74777 ) ) ( not ( = ?auto_74774 ?auto_74777 ) ) ( not ( = ?auto_74776 ?auto_74777 ) ) ( not ( = ?auto_74773 ?auto_74777 ) ) ( ON ?auto_74772 ?auto_74771 ) ( ON-TABLE ?auto_74777 ) ( CLEAR ?auto_74773 ) ( ON ?auto_74775 ?auto_74772 ) ( CLEAR ?auto_74775 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_74777 ?auto_74771 ?auto_74772 )
      ( MAKE-2PILE ?auto_74771 ?auto_74772 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_74778 - BLOCK
      ?auto_74779 - BLOCK
    )
    :vars
    (
      ?auto_74780 - BLOCK
      ?auto_74783 - BLOCK
      ?auto_74784 - BLOCK
      ?auto_74782 - BLOCK
      ?auto_74781 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74778 ?auto_74779 ) ) ( not ( = ?auto_74778 ?auto_74780 ) ) ( not ( = ?auto_74779 ?auto_74780 ) ) ( ON-TABLE ?auto_74783 ) ( ON ?auto_74784 ?auto_74783 ) ( not ( = ?auto_74783 ?auto_74784 ) ) ( not ( = ?auto_74783 ?auto_74782 ) ) ( not ( = ?auto_74783 ?auto_74780 ) ) ( not ( = ?auto_74783 ?auto_74779 ) ) ( not ( = ?auto_74783 ?auto_74778 ) ) ( not ( = ?auto_74784 ?auto_74782 ) ) ( not ( = ?auto_74784 ?auto_74780 ) ) ( not ( = ?auto_74784 ?auto_74779 ) ) ( not ( = ?auto_74784 ?auto_74778 ) ) ( not ( = ?auto_74782 ?auto_74780 ) ) ( not ( = ?auto_74782 ?auto_74779 ) ) ( not ( = ?auto_74782 ?auto_74778 ) ) ( ON ?auto_74778 ?auto_74781 ) ( not ( = ?auto_74778 ?auto_74781 ) ) ( not ( = ?auto_74779 ?auto_74781 ) ) ( not ( = ?auto_74780 ?auto_74781 ) ) ( not ( = ?auto_74783 ?auto_74781 ) ) ( not ( = ?auto_74784 ?auto_74781 ) ) ( not ( = ?auto_74782 ?auto_74781 ) ) ( ON ?auto_74779 ?auto_74778 ) ( ON-TABLE ?auto_74781 ) ( ON ?auto_74780 ?auto_74779 ) ( CLEAR ?auto_74780 ) ( HOLDING ?auto_74782 ) ( CLEAR ?auto_74784 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_74783 ?auto_74784 ?auto_74782 )
      ( MAKE-2PILE ?auto_74778 ?auto_74779 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_74785 - BLOCK
      ?auto_74786 - BLOCK
    )
    :vars
    (
      ?auto_74787 - BLOCK
      ?auto_74791 - BLOCK
      ?auto_74789 - BLOCK
      ?auto_74788 - BLOCK
      ?auto_74790 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74785 ?auto_74786 ) ) ( not ( = ?auto_74785 ?auto_74787 ) ) ( not ( = ?auto_74786 ?auto_74787 ) ) ( ON-TABLE ?auto_74791 ) ( ON ?auto_74789 ?auto_74791 ) ( not ( = ?auto_74791 ?auto_74789 ) ) ( not ( = ?auto_74791 ?auto_74788 ) ) ( not ( = ?auto_74791 ?auto_74787 ) ) ( not ( = ?auto_74791 ?auto_74786 ) ) ( not ( = ?auto_74791 ?auto_74785 ) ) ( not ( = ?auto_74789 ?auto_74788 ) ) ( not ( = ?auto_74789 ?auto_74787 ) ) ( not ( = ?auto_74789 ?auto_74786 ) ) ( not ( = ?auto_74789 ?auto_74785 ) ) ( not ( = ?auto_74788 ?auto_74787 ) ) ( not ( = ?auto_74788 ?auto_74786 ) ) ( not ( = ?auto_74788 ?auto_74785 ) ) ( ON ?auto_74785 ?auto_74790 ) ( not ( = ?auto_74785 ?auto_74790 ) ) ( not ( = ?auto_74786 ?auto_74790 ) ) ( not ( = ?auto_74787 ?auto_74790 ) ) ( not ( = ?auto_74791 ?auto_74790 ) ) ( not ( = ?auto_74789 ?auto_74790 ) ) ( not ( = ?auto_74788 ?auto_74790 ) ) ( ON ?auto_74786 ?auto_74785 ) ( ON-TABLE ?auto_74790 ) ( ON ?auto_74787 ?auto_74786 ) ( CLEAR ?auto_74789 ) ( ON ?auto_74788 ?auto_74787 ) ( CLEAR ?auto_74788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_74790 ?auto_74785 ?auto_74786 ?auto_74787 )
      ( MAKE-2PILE ?auto_74785 ?auto_74786 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_74792 - BLOCK
      ?auto_74793 - BLOCK
    )
    :vars
    (
      ?auto_74794 - BLOCK
      ?auto_74796 - BLOCK
      ?auto_74795 - BLOCK
      ?auto_74798 - BLOCK
      ?auto_74797 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74792 ?auto_74793 ) ) ( not ( = ?auto_74792 ?auto_74794 ) ) ( not ( = ?auto_74793 ?auto_74794 ) ) ( ON-TABLE ?auto_74796 ) ( not ( = ?auto_74796 ?auto_74795 ) ) ( not ( = ?auto_74796 ?auto_74798 ) ) ( not ( = ?auto_74796 ?auto_74794 ) ) ( not ( = ?auto_74796 ?auto_74793 ) ) ( not ( = ?auto_74796 ?auto_74792 ) ) ( not ( = ?auto_74795 ?auto_74798 ) ) ( not ( = ?auto_74795 ?auto_74794 ) ) ( not ( = ?auto_74795 ?auto_74793 ) ) ( not ( = ?auto_74795 ?auto_74792 ) ) ( not ( = ?auto_74798 ?auto_74794 ) ) ( not ( = ?auto_74798 ?auto_74793 ) ) ( not ( = ?auto_74798 ?auto_74792 ) ) ( ON ?auto_74792 ?auto_74797 ) ( not ( = ?auto_74792 ?auto_74797 ) ) ( not ( = ?auto_74793 ?auto_74797 ) ) ( not ( = ?auto_74794 ?auto_74797 ) ) ( not ( = ?auto_74796 ?auto_74797 ) ) ( not ( = ?auto_74795 ?auto_74797 ) ) ( not ( = ?auto_74798 ?auto_74797 ) ) ( ON ?auto_74793 ?auto_74792 ) ( ON-TABLE ?auto_74797 ) ( ON ?auto_74794 ?auto_74793 ) ( ON ?auto_74798 ?auto_74794 ) ( CLEAR ?auto_74798 ) ( HOLDING ?auto_74795 ) ( CLEAR ?auto_74796 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_74796 ?auto_74795 )
      ( MAKE-2PILE ?auto_74792 ?auto_74793 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_74799 - BLOCK
      ?auto_74800 - BLOCK
    )
    :vars
    (
      ?auto_74802 - BLOCK
      ?auto_74803 - BLOCK
      ?auto_74801 - BLOCK
      ?auto_74804 - BLOCK
      ?auto_74805 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74799 ?auto_74800 ) ) ( not ( = ?auto_74799 ?auto_74802 ) ) ( not ( = ?auto_74800 ?auto_74802 ) ) ( ON-TABLE ?auto_74803 ) ( not ( = ?auto_74803 ?auto_74801 ) ) ( not ( = ?auto_74803 ?auto_74804 ) ) ( not ( = ?auto_74803 ?auto_74802 ) ) ( not ( = ?auto_74803 ?auto_74800 ) ) ( not ( = ?auto_74803 ?auto_74799 ) ) ( not ( = ?auto_74801 ?auto_74804 ) ) ( not ( = ?auto_74801 ?auto_74802 ) ) ( not ( = ?auto_74801 ?auto_74800 ) ) ( not ( = ?auto_74801 ?auto_74799 ) ) ( not ( = ?auto_74804 ?auto_74802 ) ) ( not ( = ?auto_74804 ?auto_74800 ) ) ( not ( = ?auto_74804 ?auto_74799 ) ) ( ON ?auto_74799 ?auto_74805 ) ( not ( = ?auto_74799 ?auto_74805 ) ) ( not ( = ?auto_74800 ?auto_74805 ) ) ( not ( = ?auto_74802 ?auto_74805 ) ) ( not ( = ?auto_74803 ?auto_74805 ) ) ( not ( = ?auto_74801 ?auto_74805 ) ) ( not ( = ?auto_74804 ?auto_74805 ) ) ( ON ?auto_74800 ?auto_74799 ) ( ON-TABLE ?auto_74805 ) ( ON ?auto_74802 ?auto_74800 ) ( ON ?auto_74804 ?auto_74802 ) ( CLEAR ?auto_74803 ) ( ON ?auto_74801 ?auto_74804 ) ( CLEAR ?auto_74801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_74805 ?auto_74799 ?auto_74800 ?auto_74802 ?auto_74804 )
      ( MAKE-2PILE ?auto_74799 ?auto_74800 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_74806 - BLOCK
      ?auto_74807 - BLOCK
    )
    :vars
    (
      ?auto_74810 - BLOCK
      ?auto_74809 - BLOCK
      ?auto_74812 - BLOCK
      ?auto_74808 - BLOCK
      ?auto_74811 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74806 ?auto_74807 ) ) ( not ( = ?auto_74806 ?auto_74810 ) ) ( not ( = ?auto_74807 ?auto_74810 ) ) ( not ( = ?auto_74809 ?auto_74812 ) ) ( not ( = ?auto_74809 ?auto_74808 ) ) ( not ( = ?auto_74809 ?auto_74810 ) ) ( not ( = ?auto_74809 ?auto_74807 ) ) ( not ( = ?auto_74809 ?auto_74806 ) ) ( not ( = ?auto_74812 ?auto_74808 ) ) ( not ( = ?auto_74812 ?auto_74810 ) ) ( not ( = ?auto_74812 ?auto_74807 ) ) ( not ( = ?auto_74812 ?auto_74806 ) ) ( not ( = ?auto_74808 ?auto_74810 ) ) ( not ( = ?auto_74808 ?auto_74807 ) ) ( not ( = ?auto_74808 ?auto_74806 ) ) ( ON ?auto_74806 ?auto_74811 ) ( not ( = ?auto_74806 ?auto_74811 ) ) ( not ( = ?auto_74807 ?auto_74811 ) ) ( not ( = ?auto_74810 ?auto_74811 ) ) ( not ( = ?auto_74809 ?auto_74811 ) ) ( not ( = ?auto_74812 ?auto_74811 ) ) ( not ( = ?auto_74808 ?auto_74811 ) ) ( ON ?auto_74807 ?auto_74806 ) ( ON-TABLE ?auto_74811 ) ( ON ?auto_74810 ?auto_74807 ) ( ON ?auto_74808 ?auto_74810 ) ( ON ?auto_74812 ?auto_74808 ) ( CLEAR ?auto_74812 ) ( HOLDING ?auto_74809 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_74809 )
      ( MAKE-2PILE ?auto_74806 ?auto_74807 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_74813 - BLOCK
      ?auto_74814 - BLOCK
    )
    :vars
    (
      ?auto_74818 - BLOCK
      ?auto_74815 - BLOCK
      ?auto_74819 - BLOCK
      ?auto_74817 - BLOCK
      ?auto_74816 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74813 ?auto_74814 ) ) ( not ( = ?auto_74813 ?auto_74818 ) ) ( not ( = ?auto_74814 ?auto_74818 ) ) ( not ( = ?auto_74815 ?auto_74819 ) ) ( not ( = ?auto_74815 ?auto_74817 ) ) ( not ( = ?auto_74815 ?auto_74818 ) ) ( not ( = ?auto_74815 ?auto_74814 ) ) ( not ( = ?auto_74815 ?auto_74813 ) ) ( not ( = ?auto_74819 ?auto_74817 ) ) ( not ( = ?auto_74819 ?auto_74818 ) ) ( not ( = ?auto_74819 ?auto_74814 ) ) ( not ( = ?auto_74819 ?auto_74813 ) ) ( not ( = ?auto_74817 ?auto_74818 ) ) ( not ( = ?auto_74817 ?auto_74814 ) ) ( not ( = ?auto_74817 ?auto_74813 ) ) ( ON ?auto_74813 ?auto_74816 ) ( not ( = ?auto_74813 ?auto_74816 ) ) ( not ( = ?auto_74814 ?auto_74816 ) ) ( not ( = ?auto_74818 ?auto_74816 ) ) ( not ( = ?auto_74815 ?auto_74816 ) ) ( not ( = ?auto_74819 ?auto_74816 ) ) ( not ( = ?auto_74817 ?auto_74816 ) ) ( ON ?auto_74814 ?auto_74813 ) ( ON-TABLE ?auto_74816 ) ( ON ?auto_74818 ?auto_74814 ) ( ON ?auto_74817 ?auto_74818 ) ( ON ?auto_74819 ?auto_74817 ) ( ON ?auto_74815 ?auto_74819 ) ( CLEAR ?auto_74815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_74816 ?auto_74813 ?auto_74814 ?auto_74818 ?auto_74817 ?auto_74819 )
      ( MAKE-2PILE ?auto_74813 ?auto_74814 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74823 - BLOCK
      ?auto_74824 - BLOCK
      ?auto_74825 - BLOCK
    )
    :vars
    (
      ?auto_74826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74826 ?auto_74825 ) ( CLEAR ?auto_74826 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_74823 ) ( ON ?auto_74824 ?auto_74823 ) ( ON ?auto_74825 ?auto_74824 ) ( not ( = ?auto_74823 ?auto_74824 ) ) ( not ( = ?auto_74823 ?auto_74825 ) ) ( not ( = ?auto_74823 ?auto_74826 ) ) ( not ( = ?auto_74824 ?auto_74825 ) ) ( not ( = ?auto_74824 ?auto_74826 ) ) ( not ( = ?auto_74825 ?auto_74826 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_74826 ?auto_74825 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74827 - BLOCK
      ?auto_74828 - BLOCK
      ?auto_74829 - BLOCK
    )
    :vars
    (
      ?auto_74830 - BLOCK
      ?auto_74831 - BLOCK
      ?auto_74832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74830 ?auto_74829 ) ( CLEAR ?auto_74830 ) ( ON-TABLE ?auto_74827 ) ( ON ?auto_74828 ?auto_74827 ) ( ON ?auto_74829 ?auto_74828 ) ( not ( = ?auto_74827 ?auto_74828 ) ) ( not ( = ?auto_74827 ?auto_74829 ) ) ( not ( = ?auto_74827 ?auto_74830 ) ) ( not ( = ?auto_74828 ?auto_74829 ) ) ( not ( = ?auto_74828 ?auto_74830 ) ) ( not ( = ?auto_74829 ?auto_74830 ) ) ( HOLDING ?auto_74831 ) ( CLEAR ?auto_74832 ) ( not ( = ?auto_74827 ?auto_74831 ) ) ( not ( = ?auto_74827 ?auto_74832 ) ) ( not ( = ?auto_74828 ?auto_74831 ) ) ( not ( = ?auto_74828 ?auto_74832 ) ) ( not ( = ?auto_74829 ?auto_74831 ) ) ( not ( = ?auto_74829 ?auto_74832 ) ) ( not ( = ?auto_74830 ?auto_74831 ) ) ( not ( = ?auto_74830 ?auto_74832 ) ) ( not ( = ?auto_74831 ?auto_74832 ) ) )
    :subtasks
    ( ( !STACK ?auto_74831 ?auto_74832 )
      ( MAKE-3PILE ?auto_74827 ?auto_74828 ?auto_74829 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74833 - BLOCK
      ?auto_74834 - BLOCK
      ?auto_74835 - BLOCK
    )
    :vars
    (
      ?auto_74837 - BLOCK
      ?auto_74838 - BLOCK
      ?auto_74836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74837 ?auto_74835 ) ( ON-TABLE ?auto_74833 ) ( ON ?auto_74834 ?auto_74833 ) ( ON ?auto_74835 ?auto_74834 ) ( not ( = ?auto_74833 ?auto_74834 ) ) ( not ( = ?auto_74833 ?auto_74835 ) ) ( not ( = ?auto_74833 ?auto_74837 ) ) ( not ( = ?auto_74834 ?auto_74835 ) ) ( not ( = ?auto_74834 ?auto_74837 ) ) ( not ( = ?auto_74835 ?auto_74837 ) ) ( CLEAR ?auto_74838 ) ( not ( = ?auto_74833 ?auto_74836 ) ) ( not ( = ?auto_74833 ?auto_74838 ) ) ( not ( = ?auto_74834 ?auto_74836 ) ) ( not ( = ?auto_74834 ?auto_74838 ) ) ( not ( = ?auto_74835 ?auto_74836 ) ) ( not ( = ?auto_74835 ?auto_74838 ) ) ( not ( = ?auto_74837 ?auto_74836 ) ) ( not ( = ?auto_74837 ?auto_74838 ) ) ( not ( = ?auto_74836 ?auto_74838 ) ) ( ON ?auto_74836 ?auto_74837 ) ( CLEAR ?auto_74836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_74833 ?auto_74834 ?auto_74835 ?auto_74837 )
      ( MAKE-3PILE ?auto_74833 ?auto_74834 ?auto_74835 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74839 - BLOCK
      ?auto_74840 - BLOCK
      ?auto_74841 - BLOCK
    )
    :vars
    (
      ?auto_74844 - BLOCK
      ?auto_74842 - BLOCK
      ?auto_74843 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74844 ?auto_74841 ) ( ON-TABLE ?auto_74839 ) ( ON ?auto_74840 ?auto_74839 ) ( ON ?auto_74841 ?auto_74840 ) ( not ( = ?auto_74839 ?auto_74840 ) ) ( not ( = ?auto_74839 ?auto_74841 ) ) ( not ( = ?auto_74839 ?auto_74844 ) ) ( not ( = ?auto_74840 ?auto_74841 ) ) ( not ( = ?auto_74840 ?auto_74844 ) ) ( not ( = ?auto_74841 ?auto_74844 ) ) ( not ( = ?auto_74839 ?auto_74842 ) ) ( not ( = ?auto_74839 ?auto_74843 ) ) ( not ( = ?auto_74840 ?auto_74842 ) ) ( not ( = ?auto_74840 ?auto_74843 ) ) ( not ( = ?auto_74841 ?auto_74842 ) ) ( not ( = ?auto_74841 ?auto_74843 ) ) ( not ( = ?auto_74844 ?auto_74842 ) ) ( not ( = ?auto_74844 ?auto_74843 ) ) ( not ( = ?auto_74842 ?auto_74843 ) ) ( ON ?auto_74842 ?auto_74844 ) ( CLEAR ?auto_74842 ) ( HOLDING ?auto_74843 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_74843 )
      ( MAKE-3PILE ?auto_74839 ?auto_74840 ?auto_74841 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74845 - BLOCK
      ?auto_74846 - BLOCK
      ?auto_74847 - BLOCK
    )
    :vars
    (
      ?auto_74850 - BLOCK
      ?auto_74849 - BLOCK
      ?auto_74848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74850 ?auto_74847 ) ( ON-TABLE ?auto_74845 ) ( ON ?auto_74846 ?auto_74845 ) ( ON ?auto_74847 ?auto_74846 ) ( not ( = ?auto_74845 ?auto_74846 ) ) ( not ( = ?auto_74845 ?auto_74847 ) ) ( not ( = ?auto_74845 ?auto_74850 ) ) ( not ( = ?auto_74846 ?auto_74847 ) ) ( not ( = ?auto_74846 ?auto_74850 ) ) ( not ( = ?auto_74847 ?auto_74850 ) ) ( not ( = ?auto_74845 ?auto_74849 ) ) ( not ( = ?auto_74845 ?auto_74848 ) ) ( not ( = ?auto_74846 ?auto_74849 ) ) ( not ( = ?auto_74846 ?auto_74848 ) ) ( not ( = ?auto_74847 ?auto_74849 ) ) ( not ( = ?auto_74847 ?auto_74848 ) ) ( not ( = ?auto_74850 ?auto_74849 ) ) ( not ( = ?auto_74850 ?auto_74848 ) ) ( not ( = ?auto_74849 ?auto_74848 ) ) ( ON ?auto_74849 ?auto_74850 ) ( ON ?auto_74848 ?auto_74849 ) ( CLEAR ?auto_74848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_74845 ?auto_74846 ?auto_74847 ?auto_74850 ?auto_74849 )
      ( MAKE-3PILE ?auto_74845 ?auto_74846 ?auto_74847 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74851 - BLOCK
      ?auto_74852 - BLOCK
      ?auto_74853 - BLOCK
    )
    :vars
    (
      ?auto_74854 - BLOCK
      ?auto_74855 - BLOCK
      ?auto_74856 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74854 ?auto_74853 ) ( ON-TABLE ?auto_74851 ) ( ON ?auto_74852 ?auto_74851 ) ( ON ?auto_74853 ?auto_74852 ) ( not ( = ?auto_74851 ?auto_74852 ) ) ( not ( = ?auto_74851 ?auto_74853 ) ) ( not ( = ?auto_74851 ?auto_74854 ) ) ( not ( = ?auto_74852 ?auto_74853 ) ) ( not ( = ?auto_74852 ?auto_74854 ) ) ( not ( = ?auto_74853 ?auto_74854 ) ) ( not ( = ?auto_74851 ?auto_74855 ) ) ( not ( = ?auto_74851 ?auto_74856 ) ) ( not ( = ?auto_74852 ?auto_74855 ) ) ( not ( = ?auto_74852 ?auto_74856 ) ) ( not ( = ?auto_74853 ?auto_74855 ) ) ( not ( = ?auto_74853 ?auto_74856 ) ) ( not ( = ?auto_74854 ?auto_74855 ) ) ( not ( = ?auto_74854 ?auto_74856 ) ) ( not ( = ?auto_74855 ?auto_74856 ) ) ( ON ?auto_74855 ?auto_74854 ) ( HOLDING ?auto_74856 ) ( CLEAR ?auto_74855 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_74851 ?auto_74852 ?auto_74853 ?auto_74854 ?auto_74855 ?auto_74856 )
      ( MAKE-3PILE ?auto_74851 ?auto_74852 ?auto_74853 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74857 - BLOCK
      ?auto_74858 - BLOCK
      ?auto_74859 - BLOCK
    )
    :vars
    (
      ?auto_74860 - BLOCK
      ?auto_74861 - BLOCK
      ?auto_74862 - BLOCK
      ?auto_74863 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74860 ?auto_74859 ) ( ON-TABLE ?auto_74857 ) ( ON ?auto_74858 ?auto_74857 ) ( ON ?auto_74859 ?auto_74858 ) ( not ( = ?auto_74857 ?auto_74858 ) ) ( not ( = ?auto_74857 ?auto_74859 ) ) ( not ( = ?auto_74857 ?auto_74860 ) ) ( not ( = ?auto_74858 ?auto_74859 ) ) ( not ( = ?auto_74858 ?auto_74860 ) ) ( not ( = ?auto_74859 ?auto_74860 ) ) ( not ( = ?auto_74857 ?auto_74861 ) ) ( not ( = ?auto_74857 ?auto_74862 ) ) ( not ( = ?auto_74858 ?auto_74861 ) ) ( not ( = ?auto_74858 ?auto_74862 ) ) ( not ( = ?auto_74859 ?auto_74861 ) ) ( not ( = ?auto_74859 ?auto_74862 ) ) ( not ( = ?auto_74860 ?auto_74861 ) ) ( not ( = ?auto_74860 ?auto_74862 ) ) ( not ( = ?auto_74861 ?auto_74862 ) ) ( ON ?auto_74861 ?auto_74860 ) ( CLEAR ?auto_74861 ) ( ON ?auto_74862 ?auto_74863 ) ( CLEAR ?auto_74862 ) ( HAND-EMPTY ) ( not ( = ?auto_74857 ?auto_74863 ) ) ( not ( = ?auto_74858 ?auto_74863 ) ) ( not ( = ?auto_74859 ?auto_74863 ) ) ( not ( = ?auto_74860 ?auto_74863 ) ) ( not ( = ?auto_74861 ?auto_74863 ) ) ( not ( = ?auto_74862 ?auto_74863 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_74862 ?auto_74863 )
      ( MAKE-3PILE ?auto_74857 ?auto_74858 ?auto_74859 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74864 - BLOCK
      ?auto_74865 - BLOCK
      ?auto_74866 - BLOCK
    )
    :vars
    (
      ?auto_74869 - BLOCK
      ?auto_74868 - BLOCK
      ?auto_74867 - BLOCK
      ?auto_74870 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74869 ?auto_74866 ) ( ON-TABLE ?auto_74864 ) ( ON ?auto_74865 ?auto_74864 ) ( ON ?auto_74866 ?auto_74865 ) ( not ( = ?auto_74864 ?auto_74865 ) ) ( not ( = ?auto_74864 ?auto_74866 ) ) ( not ( = ?auto_74864 ?auto_74869 ) ) ( not ( = ?auto_74865 ?auto_74866 ) ) ( not ( = ?auto_74865 ?auto_74869 ) ) ( not ( = ?auto_74866 ?auto_74869 ) ) ( not ( = ?auto_74864 ?auto_74868 ) ) ( not ( = ?auto_74864 ?auto_74867 ) ) ( not ( = ?auto_74865 ?auto_74868 ) ) ( not ( = ?auto_74865 ?auto_74867 ) ) ( not ( = ?auto_74866 ?auto_74868 ) ) ( not ( = ?auto_74866 ?auto_74867 ) ) ( not ( = ?auto_74869 ?auto_74868 ) ) ( not ( = ?auto_74869 ?auto_74867 ) ) ( not ( = ?auto_74868 ?auto_74867 ) ) ( ON ?auto_74867 ?auto_74870 ) ( CLEAR ?auto_74867 ) ( not ( = ?auto_74864 ?auto_74870 ) ) ( not ( = ?auto_74865 ?auto_74870 ) ) ( not ( = ?auto_74866 ?auto_74870 ) ) ( not ( = ?auto_74869 ?auto_74870 ) ) ( not ( = ?auto_74868 ?auto_74870 ) ) ( not ( = ?auto_74867 ?auto_74870 ) ) ( HOLDING ?auto_74868 ) ( CLEAR ?auto_74869 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_74864 ?auto_74865 ?auto_74866 ?auto_74869 ?auto_74868 )
      ( MAKE-3PILE ?auto_74864 ?auto_74865 ?auto_74866 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74871 - BLOCK
      ?auto_74872 - BLOCK
      ?auto_74873 - BLOCK
    )
    :vars
    (
      ?auto_74876 - BLOCK
      ?auto_74877 - BLOCK
      ?auto_74875 - BLOCK
      ?auto_74874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74876 ?auto_74873 ) ( ON-TABLE ?auto_74871 ) ( ON ?auto_74872 ?auto_74871 ) ( ON ?auto_74873 ?auto_74872 ) ( not ( = ?auto_74871 ?auto_74872 ) ) ( not ( = ?auto_74871 ?auto_74873 ) ) ( not ( = ?auto_74871 ?auto_74876 ) ) ( not ( = ?auto_74872 ?auto_74873 ) ) ( not ( = ?auto_74872 ?auto_74876 ) ) ( not ( = ?auto_74873 ?auto_74876 ) ) ( not ( = ?auto_74871 ?auto_74877 ) ) ( not ( = ?auto_74871 ?auto_74875 ) ) ( not ( = ?auto_74872 ?auto_74877 ) ) ( not ( = ?auto_74872 ?auto_74875 ) ) ( not ( = ?auto_74873 ?auto_74877 ) ) ( not ( = ?auto_74873 ?auto_74875 ) ) ( not ( = ?auto_74876 ?auto_74877 ) ) ( not ( = ?auto_74876 ?auto_74875 ) ) ( not ( = ?auto_74877 ?auto_74875 ) ) ( ON ?auto_74875 ?auto_74874 ) ( not ( = ?auto_74871 ?auto_74874 ) ) ( not ( = ?auto_74872 ?auto_74874 ) ) ( not ( = ?auto_74873 ?auto_74874 ) ) ( not ( = ?auto_74876 ?auto_74874 ) ) ( not ( = ?auto_74877 ?auto_74874 ) ) ( not ( = ?auto_74875 ?auto_74874 ) ) ( CLEAR ?auto_74876 ) ( ON ?auto_74877 ?auto_74875 ) ( CLEAR ?auto_74877 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_74874 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_74874 ?auto_74875 )
      ( MAKE-3PILE ?auto_74871 ?auto_74872 ?auto_74873 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74892 - BLOCK
      ?auto_74893 - BLOCK
      ?auto_74894 - BLOCK
    )
    :vars
    (
      ?auto_74896 - BLOCK
      ?auto_74897 - BLOCK
      ?auto_74898 - BLOCK
      ?auto_74895 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74892 ) ( ON ?auto_74893 ?auto_74892 ) ( not ( = ?auto_74892 ?auto_74893 ) ) ( not ( = ?auto_74892 ?auto_74894 ) ) ( not ( = ?auto_74892 ?auto_74896 ) ) ( not ( = ?auto_74893 ?auto_74894 ) ) ( not ( = ?auto_74893 ?auto_74896 ) ) ( not ( = ?auto_74894 ?auto_74896 ) ) ( not ( = ?auto_74892 ?auto_74897 ) ) ( not ( = ?auto_74892 ?auto_74898 ) ) ( not ( = ?auto_74893 ?auto_74897 ) ) ( not ( = ?auto_74893 ?auto_74898 ) ) ( not ( = ?auto_74894 ?auto_74897 ) ) ( not ( = ?auto_74894 ?auto_74898 ) ) ( not ( = ?auto_74896 ?auto_74897 ) ) ( not ( = ?auto_74896 ?auto_74898 ) ) ( not ( = ?auto_74897 ?auto_74898 ) ) ( ON ?auto_74898 ?auto_74895 ) ( not ( = ?auto_74892 ?auto_74895 ) ) ( not ( = ?auto_74893 ?auto_74895 ) ) ( not ( = ?auto_74894 ?auto_74895 ) ) ( not ( = ?auto_74896 ?auto_74895 ) ) ( not ( = ?auto_74897 ?auto_74895 ) ) ( not ( = ?auto_74898 ?auto_74895 ) ) ( ON ?auto_74897 ?auto_74898 ) ( ON-TABLE ?auto_74895 ) ( ON ?auto_74896 ?auto_74897 ) ( CLEAR ?auto_74896 ) ( HOLDING ?auto_74894 ) ( CLEAR ?auto_74893 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_74892 ?auto_74893 ?auto_74894 ?auto_74896 )
      ( MAKE-3PILE ?auto_74892 ?auto_74893 ?auto_74894 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74899 - BLOCK
      ?auto_74900 - BLOCK
      ?auto_74901 - BLOCK
    )
    :vars
    (
      ?auto_74905 - BLOCK
      ?auto_74902 - BLOCK
      ?auto_74904 - BLOCK
      ?auto_74903 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74899 ) ( ON ?auto_74900 ?auto_74899 ) ( not ( = ?auto_74899 ?auto_74900 ) ) ( not ( = ?auto_74899 ?auto_74901 ) ) ( not ( = ?auto_74899 ?auto_74905 ) ) ( not ( = ?auto_74900 ?auto_74901 ) ) ( not ( = ?auto_74900 ?auto_74905 ) ) ( not ( = ?auto_74901 ?auto_74905 ) ) ( not ( = ?auto_74899 ?auto_74902 ) ) ( not ( = ?auto_74899 ?auto_74904 ) ) ( not ( = ?auto_74900 ?auto_74902 ) ) ( not ( = ?auto_74900 ?auto_74904 ) ) ( not ( = ?auto_74901 ?auto_74902 ) ) ( not ( = ?auto_74901 ?auto_74904 ) ) ( not ( = ?auto_74905 ?auto_74902 ) ) ( not ( = ?auto_74905 ?auto_74904 ) ) ( not ( = ?auto_74902 ?auto_74904 ) ) ( ON ?auto_74904 ?auto_74903 ) ( not ( = ?auto_74899 ?auto_74903 ) ) ( not ( = ?auto_74900 ?auto_74903 ) ) ( not ( = ?auto_74901 ?auto_74903 ) ) ( not ( = ?auto_74905 ?auto_74903 ) ) ( not ( = ?auto_74902 ?auto_74903 ) ) ( not ( = ?auto_74904 ?auto_74903 ) ) ( ON ?auto_74902 ?auto_74904 ) ( ON-TABLE ?auto_74903 ) ( ON ?auto_74905 ?auto_74902 ) ( CLEAR ?auto_74900 ) ( ON ?auto_74901 ?auto_74905 ) ( CLEAR ?auto_74901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_74903 ?auto_74904 ?auto_74902 ?auto_74905 )
      ( MAKE-3PILE ?auto_74899 ?auto_74900 ?auto_74901 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74906 - BLOCK
      ?auto_74907 - BLOCK
      ?auto_74908 - BLOCK
    )
    :vars
    (
      ?auto_74912 - BLOCK
      ?auto_74909 - BLOCK
      ?auto_74911 - BLOCK
      ?auto_74910 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74906 ) ( not ( = ?auto_74906 ?auto_74907 ) ) ( not ( = ?auto_74906 ?auto_74908 ) ) ( not ( = ?auto_74906 ?auto_74912 ) ) ( not ( = ?auto_74907 ?auto_74908 ) ) ( not ( = ?auto_74907 ?auto_74912 ) ) ( not ( = ?auto_74908 ?auto_74912 ) ) ( not ( = ?auto_74906 ?auto_74909 ) ) ( not ( = ?auto_74906 ?auto_74911 ) ) ( not ( = ?auto_74907 ?auto_74909 ) ) ( not ( = ?auto_74907 ?auto_74911 ) ) ( not ( = ?auto_74908 ?auto_74909 ) ) ( not ( = ?auto_74908 ?auto_74911 ) ) ( not ( = ?auto_74912 ?auto_74909 ) ) ( not ( = ?auto_74912 ?auto_74911 ) ) ( not ( = ?auto_74909 ?auto_74911 ) ) ( ON ?auto_74911 ?auto_74910 ) ( not ( = ?auto_74906 ?auto_74910 ) ) ( not ( = ?auto_74907 ?auto_74910 ) ) ( not ( = ?auto_74908 ?auto_74910 ) ) ( not ( = ?auto_74912 ?auto_74910 ) ) ( not ( = ?auto_74909 ?auto_74910 ) ) ( not ( = ?auto_74911 ?auto_74910 ) ) ( ON ?auto_74909 ?auto_74911 ) ( ON-TABLE ?auto_74910 ) ( ON ?auto_74912 ?auto_74909 ) ( ON ?auto_74908 ?auto_74912 ) ( CLEAR ?auto_74908 ) ( HOLDING ?auto_74907 ) ( CLEAR ?auto_74906 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_74906 ?auto_74907 )
      ( MAKE-3PILE ?auto_74906 ?auto_74907 ?auto_74908 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74913 - BLOCK
      ?auto_74914 - BLOCK
      ?auto_74915 - BLOCK
    )
    :vars
    (
      ?auto_74917 - BLOCK
      ?auto_74918 - BLOCK
      ?auto_74919 - BLOCK
      ?auto_74916 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74913 ) ( not ( = ?auto_74913 ?auto_74914 ) ) ( not ( = ?auto_74913 ?auto_74915 ) ) ( not ( = ?auto_74913 ?auto_74917 ) ) ( not ( = ?auto_74914 ?auto_74915 ) ) ( not ( = ?auto_74914 ?auto_74917 ) ) ( not ( = ?auto_74915 ?auto_74917 ) ) ( not ( = ?auto_74913 ?auto_74918 ) ) ( not ( = ?auto_74913 ?auto_74919 ) ) ( not ( = ?auto_74914 ?auto_74918 ) ) ( not ( = ?auto_74914 ?auto_74919 ) ) ( not ( = ?auto_74915 ?auto_74918 ) ) ( not ( = ?auto_74915 ?auto_74919 ) ) ( not ( = ?auto_74917 ?auto_74918 ) ) ( not ( = ?auto_74917 ?auto_74919 ) ) ( not ( = ?auto_74918 ?auto_74919 ) ) ( ON ?auto_74919 ?auto_74916 ) ( not ( = ?auto_74913 ?auto_74916 ) ) ( not ( = ?auto_74914 ?auto_74916 ) ) ( not ( = ?auto_74915 ?auto_74916 ) ) ( not ( = ?auto_74917 ?auto_74916 ) ) ( not ( = ?auto_74918 ?auto_74916 ) ) ( not ( = ?auto_74919 ?auto_74916 ) ) ( ON ?auto_74918 ?auto_74919 ) ( ON-TABLE ?auto_74916 ) ( ON ?auto_74917 ?auto_74918 ) ( ON ?auto_74915 ?auto_74917 ) ( CLEAR ?auto_74913 ) ( ON ?auto_74914 ?auto_74915 ) ( CLEAR ?auto_74914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_74916 ?auto_74919 ?auto_74918 ?auto_74917 ?auto_74915 )
      ( MAKE-3PILE ?auto_74913 ?auto_74914 ?auto_74915 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74920 - BLOCK
      ?auto_74921 - BLOCK
      ?auto_74922 - BLOCK
    )
    :vars
    (
      ?auto_74926 - BLOCK
      ?auto_74925 - BLOCK
      ?auto_74923 - BLOCK
      ?auto_74924 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74920 ?auto_74921 ) ) ( not ( = ?auto_74920 ?auto_74922 ) ) ( not ( = ?auto_74920 ?auto_74926 ) ) ( not ( = ?auto_74921 ?auto_74922 ) ) ( not ( = ?auto_74921 ?auto_74926 ) ) ( not ( = ?auto_74922 ?auto_74926 ) ) ( not ( = ?auto_74920 ?auto_74925 ) ) ( not ( = ?auto_74920 ?auto_74923 ) ) ( not ( = ?auto_74921 ?auto_74925 ) ) ( not ( = ?auto_74921 ?auto_74923 ) ) ( not ( = ?auto_74922 ?auto_74925 ) ) ( not ( = ?auto_74922 ?auto_74923 ) ) ( not ( = ?auto_74926 ?auto_74925 ) ) ( not ( = ?auto_74926 ?auto_74923 ) ) ( not ( = ?auto_74925 ?auto_74923 ) ) ( ON ?auto_74923 ?auto_74924 ) ( not ( = ?auto_74920 ?auto_74924 ) ) ( not ( = ?auto_74921 ?auto_74924 ) ) ( not ( = ?auto_74922 ?auto_74924 ) ) ( not ( = ?auto_74926 ?auto_74924 ) ) ( not ( = ?auto_74925 ?auto_74924 ) ) ( not ( = ?auto_74923 ?auto_74924 ) ) ( ON ?auto_74925 ?auto_74923 ) ( ON-TABLE ?auto_74924 ) ( ON ?auto_74926 ?auto_74925 ) ( ON ?auto_74922 ?auto_74926 ) ( ON ?auto_74921 ?auto_74922 ) ( CLEAR ?auto_74921 ) ( HOLDING ?auto_74920 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_74920 )
      ( MAKE-3PILE ?auto_74920 ?auto_74921 ?auto_74922 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74927 - BLOCK
      ?auto_74928 - BLOCK
      ?auto_74929 - BLOCK
    )
    :vars
    (
      ?auto_74933 - BLOCK
      ?auto_74932 - BLOCK
      ?auto_74931 - BLOCK
      ?auto_74930 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74927 ?auto_74928 ) ) ( not ( = ?auto_74927 ?auto_74929 ) ) ( not ( = ?auto_74927 ?auto_74933 ) ) ( not ( = ?auto_74928 ?auto_74929 ) ) ( not ( = ?auto_74928 ?auto_74933 ) ) ( not ( = ?auto_74929 ?auto_74933 ) ) ( not ( = ?auto_74927 ?auto_74932 ) ) ( not ( = ?auto_74927 ?auto_74931 ) ) ( not ( = ?auto_74928 ?auto_74932 ) ) ( not ( = ?auto_74928 ?auto_74931 ) ) ( not ( = ?auto_74929 ?auto_74932 ) ) ( not ( = ?auto_74929 ?auto_74931 ) ) ( not ( = ?auto_74933 ?auto_74932 ) ) ( not ( = ?auto_74933 ?auto_74931 ) ) ( not ( = ?auto_74932 ?auto_74931 ) ) ( ON ?auto_74931 ?auto_74930 ) ( not ( = ?auto_74927 ?auto_74930 ) ) ( not ( = ?auto_74928 ?auto_74930 ) ) ( not ( = ?auto_74929 ?auto_74930 ) ) ( not ( = ?auto_74933 ?auto_74930 ) ) ( not ( = ?auto_74932 ?auto_74930 ) ) ( not ( = ?auto_74931 ?auto_74930 ) ) ( ON ?auto_74932 ?auto_74931 ) ( ON-TABLE ?auto_74930 ) ( ON ?auto_74933 ?auto_74932 ) ( ON ?auto_74929 ?auto_74933 ) ( ON ?auto_74928 ?auto_74929 ) ( ON ?auto_74927 ?auto_74928 ) ( CLEAR ?auto_74927 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_74930 ?auto_74931 ?auto_74932 ?auto_74933 ?auto_74929 ?auto_74928 )
      ( MAKE-3PILE ?auto_74927 ?auto_74928 ?auto_74929 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74937 - BLOCK
      ?auto_74938 - BLOCK
      ?auto_74939 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_74939 ) ( CLEAR ?auto_74938 ) ( ON-TABLE ?auto_74937 ) ( ON ?auto_74938 ?auto_74937 ) ( not ( = ?auto_74937 ?auto_74938 ) ) ( not ( = ?auto_74937 ?auto_74939 ) ) ( not ( = ?auto_74938 ?auto_74939 ) ) )
    :subtasks
    ( ( !STACK ?auto_74939 ?auto_74938 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74940 - BLOCK
      ?auto_74941 - BLOCK
      ?auto_74942 - BLOCK
    )
    :vars
    (
      ?auto_74943 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_74941 ) ( ON-TABLE ?auto_74940 ) ( ON ?auto_74941 ?auto_74940 ) ( not ( = ?auto_74940 ?auto_74941 ) ) ( not ( = ?auto_74940 ?auto_74942 ) ) ( not ( = ?auto_74941 ?auto_74942 ) ) ( ON ?auto_74942 ?auto_74943 ) ( CLEAR ?auto_74942 ) ( HAND-EMPTY ) ( not ( = ?auto_74940 ?auto_74943 ) ) ( not ( = ?auto_74941 ?auto_74943 ) ) ( not ( = ?auto_74942 ?auto_74943 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_74942 ?auto_74943 )
      ( MAKE-3PILE ?auto_74940 ?auto_74941 ?auto_74942 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74944 - BLOCK
      ?auto_74945 - BLOCK
      ?auto_74946 - BLOCK
    )
    :vars
    (
      ?auto_74947 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74944 ) ( not ( = ?auto_74944 ?auto_74945 ) ) ( not ( = ?auto_74944 ?auto_74946 ) ) ( not ( = ?auto_74945 ?auto_74946 ) ) ( ON ?auto_74946 ?auto_74947 ) ( CLEAR ?auto_74946 ) ( not ( = ?auto_74944 ?auto_74947 ) ) ( not ( = ?auto_74945 ?auto_74947 ) ) ( not ( = ?auto_74946 ?auto_74947 ) ) ( HOLDING ?auto_74945 ) ( CLEAR ?auto_74944 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_74944 ?auto_74945 )
      ( MAKE-3PILE ?auto_74944 ?auto_74945 ?auto_74946 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74948 - BLOCK
      ?auto_74949 - BLOCK
      ?auto_74950 - BLOCK
    )
    :vars
    (
      ?auto_74951 - BLOCK
      ?auto_74952 - BLOCK
      ?auto_74953 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74948 ) ( not ( = ?auto_74948 ?auto_74949 ) ) ( not ( = ?auto_74948 ?auto_74950 ) ) ( not ( = ?auto_74949 ?auto_74950 ) ) ( ON ?auto_74950 ?auto_74951 ) ( not ( = ?auto_74948 ?auto_74951 ) ) ( not ( = ?auto_74949 ?auto_74951 ) ) ( not ( = ?auto_74950 ?auto_74951 ) ) ( CLEAR ?auto_74948 ) ( ON ?auto_74949 ?auto_74950 ) ( CLEAR ?auto_74949 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_74952 ) ( ON ?auto_74953 ?auto_74952 ) ( ON ?auto_74951 ?auto_74953 ) ( not ( = ?auto_74952 ?auto_74953 ) ) ( not ( = ?auto_74952 ?auto_74951 ) ) ( not ( = ?auto_74952 ?auto_74950 ) ) ( not ( = ?auto_74952 ?auto_74949 ) ) ( not ( = ?auto_74953 ?auto_74951 ) ) ( not ( = ?auto_74953 ?auto_74950 ) ) ( not ( = ?auto_74953 ?auto_74949 ) ) ( not ( = ?auto_74948 ?auto_74952 ) ) ( not ( = ?auto_74948 ?auto_74953 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_74952 ?auto_74953 ?auto_74951 ?auto_74950 )
      ( MAKE-3PILE ?auto_74948 ?auto_74949 ?auto_74950 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74954 - BLOCK
      ?auto_74955 - BLOCK
      ?auto_74956 - BLOCK
    )
    :vars
    (
      ?auto_74959 - BLOCK
      ?auto_74958 - BLOCK
      ?auto_74957 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74954 ?auto_74955 ) ) ( not ( = ?auto_74954 ?auto_74956 ) ) ( not ( = ?auto_74955 ?auto_74956 ) ) ( ON ?auto_74956 ?auto_74959 ) ( not ( = ?auto_74954 ?auto_74959 ) ) ( not ( = ?auto_74955 ?auto_74959 ) ) ( not ( = ?auto_74956 ?auto_74959 ) ) ( ON ?auto_74955 ?auto_74956 ) ( CLEAR ?auto_74955 ) ( ON-TABLE ?auto_74958 ) ( ON ?auto_74957 ?auto_74958 ) ( ON ?auto_74959 ?auto_74957 ) ( not ( = ?auto_74958 ?auto_74957 ) ) ( not ( = ?auto_74958 ?auto_74959 ) ) ( not ( = ?auto_74958 ?auto_74956 ) ) ( not ( = ?auto_74958 ?auto_74955 ) ) ( not ( = ?auto_74957 ?auto_74959 ) ) ( not ( = ?auto_74957 ?auto_74956 ) ) ( not ( = ?auto_74957 ?auto_74955 ) ) ( not ( = ?auto_74954 ?auto_74958 ) ) ( not ( = ?auto_74954 ?auto_74957 ) ) ( HOLDING ?auto_74954 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_74954 )
      ( MAKE-3PILE ?auto_74954 ?auto_74955 ?auto_74956 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74960 - BLOCK
      ?auto_74961 - BLOCK
      ?auto_74962 - BLOCK
    )
    :vars
    (
      ?auto_74964 - BLOCK
      ?auto_74963 - BLOCK
      ?auto_74965 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74960 ?auto_74961 ) ) ( not ( = ?auto_74960 ?auto_74962 ) ) ( not ( = ?auto_74961 ?auto_74962 ) ) ( ON ?auto_74962 ?auto_74964 ) ( not ( = ?auto_74960 ?auto_74964 ) ) ( not ( = ?auto_74961 ?auto_74964 ) ) ( not ( = ?auto_74962 ?auto_74964 ) ) ( ON ?auto_74961 ?auto_74962 ) ( ON-TABLE ?auto_74963 ) ( ON ?auto_74965 ?auto_74963 ) ( ON ?auto_74964 ?auto_74965 ) ( not ( = ?auto_74963 ?auto_74965 ) ) ( not ( = ?auto_74963 ?auto_74964 ) ) ( not ( = ?auto_74963 ?auto_74962 ) ) ( not ( = ?auto_74963 ?auto_74961 ) ) ( not ( = ?auto_74965 ?auto_74964 ) ) ( not ( = ?auto_74965 ?auto_74962 ) ) ( not ( = ?auto_74965 ?auto_74961 ) ) ( not ( = ?auto_74960 ?auto_74963 ) ) ( not ( = ?auto_74960 ?auto_74965 ) ) ( ON ?auto_74960 ?auto_74961 ) ( CLEAR ?auto_74960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_74963 ?auto_74965 ?auto_74964 ?auto_74962 ?auto_74961 )
      ( MAKE-3PILE ?auto_74960 ?auto_74961 ?auto_74962 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74966 - BLOCK
      ?auto_74967 - BLOCK
      ?auto_74968 - BLOCK
    )
    :vars
    (
      ?auto_74971 - BLOCK
      ?auto_74970 - BLOCK
      ?auto_74969 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74966 ?auto_74967 ) ) ( not ( = ?auto_74966 ?auto_74968 ) ) ( not ( = ?auto_74967 ?auto_74968 ) ) ( ON ?auto_74968 ?auto_74971 ) ( not ( = ?auto_74966 ?auto_74971 ) ) ( not ( = ?auto_74967 ?auto_74971 ) ) ( not ( = ?auto_74968 ?auto_74971 ) ) ( ON ?auto_74967 ?auto_74968 ) ( ON-TABLE ?auto_74970 ) ( ON ?auto_74969 ?auto_74970 ) ( ON ?auto_74971 ?auto_74969 ) ( not ( = ?auto_74970 ?auto_74969 ) ) ( not ( = ?auto_74970 ?auto_74971 ) ) ( not ( = ?auto_74970 ?auto_74968 ) ) ( not ( = ?auto_74970 ?auto_74967 ) ) ( not ( = ?auto_74969 ?auto_74971 ) ) ( not ( = ?auto_74969 ?auto_74968 ) ) ( not ( = ?auto_74969 ?auto_74967 ) ) ( not ( = ?auto_74966 ?auto_74970 ) ) ( not ( = ?auto_74966 ?auto_74969 ) ) ( HOLDING ?auto_74966 ) ( CLEAR ?auto_74967 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_74970 ?auto_74969 ?auto_74971 ?auto_74968 ?auto_74967 ?auto_74966 )
      ( MAKE-3PILE ?auto_74966 ?auto_74967 ?auto_74968 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74972 - BLOCK
      ?auto_74973 - BLOCK
      ?auto_74974 - BLOCK
    )
    :vars
    (
      ?auto_74977 - BLOCK
      ?auto_74975 - BLOCK
      ?auto_74976 - BLOCK
      ?auto_74978 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74972 ?auto_74973 ) ) ( not ( = ?auto_74972 ?auto_74974 ) ) ( not ( = ?auto_74973 ?auto_74974 ) ) ( ON ?auto_74974 ?auto_74977 ) ( not ( = ?auto_74972 ?auto_74977 ) ) ( not ( = ?auto_74973 ?auto_74977 ) ) ( not ( = ?auto_74974 ?auto_74977 ) ) ( ON ?auto_74973 ?auto_74974 ) ( ON-TABLE ?auto_74975 ) ( ON ?auto_74976 ?auto_74975 ) ( ON ?auto_74977 ?auto_74976 ) ( not ( = ?auto_74975 ?auto_74976 ) ) ( not ( = ?auto_74975 ?auto_74977 ) ) ( not ( = ?auto_74975 ?auto_74974 ) ) ( not ( = ?auto_74975 ?auto_74973 ) ) ( not ( = ?auto_74976 ?auto_74977 ) ) ( not ( = ?auto_74976 ?auto_74974 ) ) ( not ( = ?auto_74976 ?auto_74973 ) ) ( not ( = ?auto_74972 ?auto_74975 ) ) ( not ( = ?auto_74972 ?auto_74976 ) ) ( CLEAR ?auto_74973 ) ( ON ?auto_74972 ?auto_74978 ) ( CLEAR ?auto_74972 ) ( HAND-EMPTY ) ( not ( = ?auto_74972 ?auto_74978 ) ) ( not ( = ?auto_74973 ?auto_74978 ) ) ( not ( = ?auto_74974 ?auto_74978 ) ) ( not ( = ?auto_74977 ?auto_74978 ) ) ( not ( = ?auto_74975 ?auto_74978 ) ) ( not ( = ?auto_74976 ?auto_74978 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_74972 ?auto_74978 )
      ( MAKE-3PILE ?auto_74972 ?auto_74973 ?auto_74974 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74979 - BLOCK
      ?auto_74980 - BLOCK
      ?auto_74981 - BLOCK
    )
    :vars
    (
      ?auto_74982 - BLOCK
      ?auto_74985 - BLOCK
      ?auto_74984 - BLOCK
      ?auto_74983 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74979 ?auto_74980 ) ) ( not ( = ?auto_74979 ?auto_74981 ) ) ( not ( = ?auto_74980 ?auto_74981 ) ) ( ON ?auto_74981 ?auto_74982 ) ( not ( = ?auto_74979 ?auto_74982 ) ) ( not ( = ?auto_74980 ?auto_74982 ) ) ( not ( = ?auto_74981 ?auto_74982 ) ) ( ON-TABLE ?auto_74985 ) ( ON ?auto_74984 ?auto_74985 ) ( ON ?auto_74982 ?auto_74984 ) ( not ( = ?auto_74985 ?auto_74984 ) ) ( not ( = ?auto_74985 ?auto_74982 ) ) ( not ( = ?auto_74985 ?auto_74981 ) ) ( not ( = ?auto_74985 ?auto_74980 ) ) ( not ( = ?auto_74984 ?auto_74982 ) ) ( not ( = ?auto_74984 ?auto_74981 ) ) ( not ( = ?auto_74984 ?auto_74980 ) ) ( not ( = ?auto_74979 ?auto_74985 ) ) ( not ( = ?auto_74979 ?auto_74984 ) ) ( ON ?auto_74979 ?auto_74983 ) ( CLEAR ?auto_74979 ) ( not ( = ?auto_74979 ?auto_74983 ) ) ( not ( = ?auto_74980 ?auto_74983 ) ) ( not ( = ?auto_74981 ?auto_74983 ) ) ( not ( = ?auto_74982 ?auto_74983 ) ) ( not ( = ?auto_74985 ?auto_74983 ) ) ( not ( = ?auto_74984 ?auto_74983 ) ) ( HOLDING ?auto_74980 ) ( CLEAR ?auto_74981 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_74985 ?auto_74984 ?auto_74982 ?auto_74981 ?auto_74980 )
      ( MAKE-3PILE ?auto_74979 ?auto_74980 ?auto_74981 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74986 - BLOCK
      ?auto_74987 - BLOCK
      ?auto_74988 - BLOCK
    )
    :vars
    (
      ?auto_74992 - BLOCK
      ?auto_74990 - BLOCK
      ?auto_74989 - BLOCK
      ?auto_74991 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74986 ?auto_74987 ) ) ( not ( = ?auto_74986 ?auto_74988 ) ) ( not ( = ?auto_74987 ?auto_74988 ) ) ( ON ?auto_74988 ?auto_74992 ) ( not ( = ?auto_74986 ?auto_74992 ) ) ( not ( = ?auto_74987 ?auto_74992 ) ) ( not ( = ?auto_74988 ?auto_74992 ) ) ( ON-TABLE ?auto_74990 ) ( ON ?auto_74989 ?auto_74990 ) ( ON ?auto_74992 ?auto_74989 ) ( not ( = ?auto_74990 ?auto_74989 ) ) ( not ( = ?auto_74990 ?auto_74992 ) ) ( not ( = ?auto_74990 ?auto_74988 ) ) ( not ( = ?auto_74990 ?auto_74987 ) ) ( not ( = ?auto_74989 ?auto_74992 ) ) ( not ( = ?auto_74989 ?auto_74988 ) ) ( not ( = ?auto_74989 ?auto_74987 ) ) ( not ( = ?auto_74986 ?auto_74990 ) ) ( not ( = ?auto_74986 ?auto_74989 ) ) ( ON ?auto_74986 ?auto_74991 ) ( not ( = ?auto_74986 ?auto_74991 ) ) ( not ( = ?auto_74987 ?auto_74991 ) ) ( not ( = ?auto_74988 ?auto_74991 ) ) ( not ( = ?auto_74992 ?auto_74991 ) ) ( not ( = ?auto_74990 ?auto_74991 ) ) ( not ( = ?auto_74989 ?auto_74991 ) ) ( CLEAR ?auto_74988 ) ( ON ?auto_74987 ?auto_74986 ) ( CLEAR ?auto_74987 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_74991 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_74991 ?auto_74986 )
      ( MAKE-3PILE ?auto_74986 ?auto_74987 ?auto_74988 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74993 - BLOCK
      ?auto_74994 - BLOCK
      ?auto_74995 - BLOCK
    )
    :vars
    (
      ?auto_74998 - BLOCK
      ?auto_74997 - BLOCK
      ?auto_74999 - BLOCK
      ?auto_74996 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74993 ?auto_74994 ) ) ( not ( = ?auto_74993 ?auto_74995 ) ) ( not ( = ?auto_74994 ?auto_74995 ) ) ( not ( = ?auto_74993 ?auto_74998 ) ) ( not ( = ?auto_74994 ?auto_74998 ) ) ( not ( = ?auto_74995 ?auto_74998 ) ) ( ON-TABLE ?auto_74997 ) ( ON ?auto_74999 ?auto_74997 ) ( ON ?auto_74998 ?auto_74999 ) ( not ( = ?auto_74997 ?auto_74999 ) ) ( not ( = ?auto_74997 ?auto_74998 ) ) ( not ( = ?auto_74997 ?auto_74995 ) ) ( not ( = ?auto_74997 ?auto_74994 ) ) ( not ( = ?auto_74999 ?auto_74998 ) ) ( not ( = ?auto_74999 ?auto_74995 ) ) ( not ( = ?auto_74999 ?auto_74994 ) ) ( not ( = ?auto_74993 ?auto_74997 ) ) ( not ( = ?auto_74993 ?auto_74999 ) ) ( ON ?auto_74993 ?auto_74996 ) ( not ( = ?auto_74993 ?auto_74996 ) ) ( not ( = ?auto_74994 ?auto_74996 ) ) ( not ( = ?auto_74995 ?auto_74996 ) ) ( not ( = ?auto_74998 ?auto_74996 ) ) ( not ( = ?auto_74997 ?auto_74996 ) ) ( not ( = ?auto_74999 ?auto_74996 ) ) ( ON ?auto_74994 ?auto_74993 ) ( CLEAR ?auto_74994 ) ( ON-TABLE ?auto_74996 ) ( HOLDING ?auto_74995 ) ( CLEAR ?auto_74998 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_74997 ?auto_74999 ?auto_74998 ?auto_74995 )
      ( MAKE-3PILE ?auto_74993 ?auto_74994 ?auto_74995 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_75000 - BLOCK
      ?auto_75001 - BLOCK
      ?auto_75002 - BLOCK
    )
    :vars
    (
      ?auto_75005 - BLOCK
      ?auto_75003 - BLOCK
      ?auto_75006 - BLOCK
      ?auto_75004 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75000 ?auto_75001 ) ) ( not ( = ?auto_75000 ?auto_75002 ) ) ( not ( = ?auto_75001 ?auto_75002 ) ) ( not ( = ?auto_75000 ?auto_75005 ) ) ( not ( = ?auto_75001 ?auto_75005 ) ) ( not ( = ?auto_75002 ?auto_75005 ) ) ( ON-TABLE ?auto_75003 ) ( ON ?auto_75006 ?auto_75003 ) ( ON ?auto_75005 ?auto_75006 ) ( not ( = ?auto_75003 ?auto_75006 ) ) ( not ( = ?auto_75003 ?auto_75005 ) ) ( not ( = ?auto_75003 ?auto_75002 ) ) ( not ( = ?auto_75003 ?auto_75001 ) ) ( not ( = ?auto_75006 ?auto_75005 ) ) ( not ( = ?auto_75006 ?auto_75002 ) ) ( not ( = ?auto_75006 ?auto_75001 ) ) ( not ( = ?auto_75000 ?auto_75003 ) ) ( not ( = ?auto_75000 ?auto_75006 ) ) ( ON ?auto_75000 ?auto_75004 ) ( not ( = ?auto_75000 ?auto_75004 ) ) ( not ( = ?auto_75001 ?auto_75004 ) ) ( not ( = ?auto_75002 ?auto_75004 ) ) ( not ( = ?auto_75005 ?auto_75004 ) ) ( not ( = ?auto_75003 ?auto_75004 ) ) ( not ( = ?auto_75006 ?auto_75004 ) ) ( ON ?auto_75001 ?auto_75000 ) ( ON-TABLE ?auto_75004 ) ( CLEAR ?auto_75005 ) ( ON ?auto_75002 ?auto_75001 ) ( CLEAR ?auto_75002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75004 ?auto_75000 ?auto_75001 )
      ( MAKE-3PILE ?auto_75000 ?auto_75001 ?auto_75002 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_75007 - BLOCK
      ?auto_75008 - BLOCK
      ?auto_75009 - BLOCK
    )
    :vars
    (
      ?auto_75012 - BLOCK
      ?auto_75013 - BLOCK
      ?auto_75011 - BLOCK
      ?auto_75010 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75007 ?auto_75008 ) ) ( not ( = ?auto_75007 ?auto_75009 ) ) ( not ( = ?auto_75008 ?auto_75009 ) ) ( not ( = ?auto_75007 ?auto_75012 ) ) ( not ( = ?auto_75008 ?auto_75012 ) ) ( not ( = ?auto_75009 ?auto_75012 ) ) ( ON-TABLE ?auto_75013 ) ( ON ?auto_75011 ?auto_75013 ) ( not ( = ?auto_75013 ?auto_75011 ) ) ( not ( = ?auto_75013 ?auto_75012 ) ) ( not ( = ?auto_75013 ?auto_75009 ) ) ( not ( = ?auto_75013 ?auto_75008 ) ) ( not ( = ?auto_75011 ?auto_75012 ) ) ( not ( = ?auto_75011 ?auto_75009 ) ) ( not ( = ?auto_75011 ?auto_75008 ) ) ( not ( = ?auto_75007 ?auto_75013 ) ) ( not ( = ?auto_75007 ?auto_75011 ) ) ( ON ?auto_75007 ?auto_75010 ) ( not ( = ?auto_75007 ?auto_75010 ) ) ( not ( = ?auto_75008 ?auto_75010 ) ) ( not ( = ?auto_75009 ?auto_75010 ) ) ( not ( = ?auto_75012 ?auto_75010 ) ) ( not ( = ?auto_75013 ?auto_75010 ) ) ( not ( = ?auto_75011 ?auto_75010 ) ) ( ON ?auto_75008 ?auto_75007 ) ( ON-TABLE ?auto_75010 ) ( ON ?auto_75009 ?auto_75008 ) ( CLEAR ?auto_75009 ) ( HOLDING ?auto_75012 ) ( CLEAR ?auto_75011 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75013 ?auto_75011 ?auto_75012 )
      ( MAKE-3PILE ?auto_75007 ?auto_75008 ?auto_75009 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_75014 - BLOCK
      ?auto_75015 - BLOCK
      ?auto_75016 - BLOCK
    )
    :vars
    (
      ?auto_75018 - BLOCK
      ?auto_75019 - BLOCK
      ?auto_75017 - BLOCK
      ?auto_75020 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75014 ?auto_75015 ) ) ( not ( = ?auto_75014 ?auto_75016 ) ) ( not ( = ?auto_75015 ?auto_75016 ) ) ( not ( = ?auto_75014 ?auto_75018 ) ) ( not ( = ?auto_75015 ?auto_75018 ) ) ( not ( = ?auto_75016 ?auto_75018 ) ) ( ON-TABLE ?auto_75019 ) ( ON ?auto_75017 ?auto_75019 ) ( not ( = ?auto_75019 ?auto_75017 ) ) ( not ( = ?auto_75019 ?auto_75018 ) ) ( not ( = ?auto_75019 ?auto_75016 ) ) ( not ( = ?auto_75019 ?auto_75015 ) ) ( not ( = ?auto_75017 ?auto_75018 ) ) ( not ( = ?auto_75017 ?auto_75016 ) ) ( not ( = ?auto_75017 ?auto_75015 ) ) ( not ( = ?auto_75014 ?auto_75019 ) ) ( not ( = ?auto_75014 ?auto_75017 ) ) ( ON ?auto_75014 ?auto_75020 ) ( not ( = ?auto_75014 ?auto_75020 ) ) ( not ( = ?auto_75015 ?auto_75020 ) ) ( not ( = ?auto_75016 ?auto_75020 ) ) ( not ( = ?auto_75018 ?auto_75020 ) ) ( not ( = ?auto_75019 ?auto_75020 ) ) ( not ( = ?auto_75017 ?auto_75020 ) ) ( ON ?auto_75015 ?auto_75014 ) ( ON-TABLE ?auto_75020 ) ( ON ?auto_75016 ?auto_75015 ) ( CLEAR ?auto_75017 ) ( ON ?auto_75018 ?auto_75016 ) ( CLEAR ?auto_75018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_75020 ?auto_75014 ?auto_75015 ?auto_75016 )
      ( MAKE-3PILE ?auto_75014 ?auto_75015 ?auto_75016 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_75021 - BLOCK
      ?auto_75022 - BLOCK
      ?auto_75023 - BLOCK
    )
    :vars
    (
      ?auto_75026 - BLOCK
      ?auto_75024 - BLOCK
      ?auto_75027 - BLOCK
      ?auto_75025 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75021 ?auto_75022 ) ) ( not ( = ?auto_75021 ?auto_75023 ) ) ( not ( = ?auto_75022 ?auto_75023 ) ) ( not ( = ?auto_75021 ?auto_75026 ) ) ( not ( = ?auto_75022 ?auto_75026 ) ) ( not ( = ?auto_75023 ?auto_75026 ) ) ( ON-TABLE ?auto_75024 ) ( not ( = ?auto_75024 ?auto_75027 ) ) ( not ( = ?auto_75024 ?auto_75026 ) ) ( not ( = ?auto_75024 ?auto_75023 ) ) ( not ( = ?auto_75024 ?auto_75022 ) ) ( not ( = ?auto_75027 ?auto_75026 ) ) ( not ( = ?auto_75027 ?auto_75023 ) ) ( not ( = ?auto_75027 ?auto_75022 ) ) ( not ( = ?auto_75021 ?auto_75024 ) ) ( not ( = ?auto_75021 ?auto_75027 ) ) ( ON ?auto_75021 ?auto_75025 ) ( not ( = ?auto_75021 ?auto_75025 ) ) ( not ( = ?auto_75022 ?auto_75025 ) ) ( not ( = ?auto_75023 ?auto_75025 ) ) ( not ( = ?auto_75026 ?auto_75025 ) ) ( not ( = ?auto_75024 ?auto_75025 ) ) ( not ( = ?auto_75027 ?auto_75025 ) ) ( ON ?auto_75022 ?auto_75021 ) ( ON-TABLE ?auto_75025 ) ( ON ?auto_75023 ?auto_75022 ) ( ON ?auto_75026 ?auto_75023 ) ( CLEAR ?auto_75026 ) ( HOLDING ?auto_75027 ) ( CLEAR ?auto_75024 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75024 ?auto_75027 )
      ( MAKE-3PILE ?auto_75021 ?auto_75022 ?auto_75023 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_75028 - BLOCK
      ?auto_75029 - BLOCK
      ?auto_75030 - BLOCK
    )
    :vars
    (
      ?auto_75033 - BLOCK
      ?auto_75031 - BLOCK
      ?auto_75032 - BLOCK
      ?auto_75034 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75028 ?auto_75029 ) ) ( not ( = ?auto_75028 ?auto_75030 ) ) ( not ( = ?auto_75029 ?auto_75030 ) ) ( not ( = ?auto_75028 ?auto_75033 ) ) ( not ( = ?auto_75029 ?auto_75033 ) ) ( not ( = ?auto_75030 ?auto_75033 ) ) ( ON-TABLE ?auto_75031 ) ( not ( = ?auto_75031 ?auto_75032 ) ) ( not ( = ?auto_75031 ?auto_75033 ) ) ( not ( = ?auto_75031 ?auto_75030 ) ) ( not ( = ?auto_75031 ?auto_75029 ) ) ( not ( = ?auto_75032 ?auto_75033 ) ) ( not ( = ?auto_75032 ?auto_75030 ) ) ( not ( = ?auto_75032 ?auto_75029 ) ) ( not ( = ?auto_75028 ?auto_75031 ) ) ( not ( = ?auto_75028 ?auto_75032 ) ) ( ON ?auto_75028 ?auto_75034 ) ( not ( = ?auto_75028 ?auto_75034 ) ) ( not ( = ?auto_75029 ?auto_75034 ) ) ( not ( = ?auto_75030 ?auto_75034 ) ) ( not ( = ?auto_75033 ?auto_75034 ) ) ( not ( = ?auto_75031 ?auto_75034 ) ) ( not ( = ?auto_75032 ?auto_75034 ) ) ( ON ?auto_75029 ?auto_75028 ) ( ON-TABLE ?auto_75034 ) ( ON ?auto_75030 ?auto_75029 ) ( ON ?auto_75033 ?auto_75030 ) ( CLEAR ?auto_75031 ) ( ON ?auto_75032 ?auto_75033 ) ( CLEAR ?auto_75032 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_75034 ?auto_75028 ?auto_75029 ?auto_75030 ?auto_75033 )
      ( MAKE-3PILE ?auto_75028 ?auto_75029 ?auto_75030 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_75035 - BLOCK
      ?auto_75036 - BLOCK
      ?auto_75037 - BLOCK
    )
    :vars
    (
      ?auto_75039 - BLOCK
      ?auto_75038 - BLOCK
      ?auto_75041 - BLOCK
      ?auto_75040 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75035 ?auto_75036 ) ) ( not ( = ?auto_75035 ?auto_75037 ) ) ( not ( = ?auto_75036 ?auto_75037 ) ) ( not ( = ?auto_75035 ?auto_75039 ) ) ( not ( = ?auto_75036 ?auto_75039 ) ) ( not ( = ?auto_75037 ?auto_75039 ) ) ( not ( = ?auto_75038 ?auto_75041 ) ) ( not ( = ?auto_75038 ?auto_75039 ) ) ( not ( = ?auto_75038 ?auto_75037 ) ) ( not ( = ?auto_75038 ?auto_75036 ) ) ( not ( = ?auto_75041 ?auto_75039 ) ) ( not ( = ?auto_75041 ?auto_75037 ) ) ( not ( = ?auto_75041 ?auto_75036 ) ) ( not ( = ?auto_75035 ?auto_75038 ) ) ( not ( = ?auto_75035 ?auto_75041 ) ) ( ON ?auto_75035 ?auto_75040 ) ( not ( = ?auto_75035 ?auto_75040 ) ) ( not ( = ?auto_75036 ?auto_75040 ) ) ( not ( = ?auto_75037 ?auto_75040 ) ) ( not ( = ?auto_75039 ?auto_75040 ) ) ( not ( = ?auto_75038 ?auto_75040 ) ) ( not ( = ?auto_75041 ?auto_75040 ) ) ( ON ?auto_75036 ?auto_75035 ) ( ON-TABLE ?auto_75040 ) ( ON ?auto_75037 ?auto_75036 ) ( ON ?auto_75039 ?auto_75037 ) ( ON ?auto_75041 ?auto_75039 ) ( CLEAR ?auto_75041 ) ( HOLDING ?auto_75038 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_75038 )
      ( MAKE-3PILE ?auto_75035 ?auto_75036 ?auto_75037 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_75042 - BLOCK
      ?auto_75043 - BLOCK
      ?auto_75044 - BLOCK
    )
    :vars
    (
      ?auto_75048 - BLOCK
      ?auto_75045 - BLOCK
      ?auto_75047 - BLOCK
      ?auto_75046 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75042 ?auto_75043 ) ) ( not ( = ?auto_75042 ?auto_75044 ) ) ( not ( = ?auto_75043 ?auto_75044 ) ) ( not ( = ?auto_75042 ?auto_75048 ) ) ( not ( = ?auto_75043 ?auto_75048 ) ) ( not ( = ?auto_75044 ?auto_75048 ) ) ( not ( = ?auto_75045 ?auto_75047 ) ) ( not ( = ?auto_75045 ?auto_75048 ) ) ( not ( = ?auto_75045 ?auto_75044 ) ) ( not ( = ?auto_75045 ?auto_75043 ) ) ( not ( = ?auto_75047 ?auto_75048 ) ) ( not ( = ?auto_75047 ?auto_75044 ) ) ( not ( = ?auto_75047 ?auto_75043 ) ) ( not ( = ?auto_75042 ?auto_75045 ) ) ( not ( = ?auto_75042 ?auto_75047 ) ) ( ON ?auto_75042 ?auto_75046 ) ( not ( = ?auto_75042 ?auto_75046 ) ) ( not ( = ?auto_75043 ?auto_75046 ) ) ( not ( = ?auto_75044 ?auto_75046 ) ) ( not ( = ?auto_75048 ?auto_75046 ) ) ( not ( = ?auto_75045 ?auto_75046 ) ) ( not ( = ?auto_75047 ?auto_75046 ) ) ( ON ?auto_75043 ?auto_75042 ) ( ON-TABLE ?auto_75046 ) ( ON ?auto_75044 ?auto_75043 ) ( ON ?auto_75048 ?auto_75044 ) ( ON ?auto_75047 ?auto_75048 ) ( ON ?auto_75045 ?auto_75047 ) ( CLEAR ?auto_75045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_75046 ?auto_75042 ?auto_75043 ?auto_75044 ?auto_75048 ?auto_75047 )
      ( MAKE-3PILE ?auto_75042 ?auto_75043 ?auto_75044 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75051 - BLOCK
      ?auto_75052 - BLOCK
    )
    :vars
    (
      ?auto_75053 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75053 ?auto_75052 ) ( CLEAR ?auto_75053 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_75051 ) ( ON ?auto_75052 ?auto_75051 ) ( not ( = ?auto_75051 ?auto_75052 ) ) ( not ( = ?auto_75051 ?auto_75053 ) ) ( not ( = ?auto_75052 ?auto_75053 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_75053 ?auto_75052 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75054 - BLOCK
      ?auto_75055 - BLOCK
    )
    :vars
    (
      ?auto_75056 - BLOCK
      ?auto_75057 - BLOCK
      ?auto_75058 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75056 ?auto_75055 ) ( CLEAR ?auto_75056 ) ( ON-TABLE ?auto_75054 ) ( ON ?auto_75055 ?auto_75054 ) ( not ( = ?auto_75054 ?auto_75055 ) ) ( not ( = ?auto_75054 ?auto_75056 ) ) ( not ( = ?auto_75055 ?auto_75056 ) ) ( HOLDING ?auto_75057 ) ( CLEAR ?auto_75058 ) ( not ( = ?auto_75054 ?auto_75057 ) ) ( not ( = ?auto_75054 ?auto_75058 ) ) ( not ( = ?auto_75055 ?auto_75057 ) ) ( not ( = ?auto_75055 ?auto_75058 ) ) ( not ( = ?auto_75056 ?auto_75057 ) ) ( not ( = ?auto_75056 ?auto_75058 ) ) ( not ( = ?auto_75057 ?auto_75058 ) ) )
    :subtasks
    ( ( !STACK ?auto_75057 ?auto_75058 )
      ( MAKE-2PILE ?auto_75054 ?auto_75055 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75059 - BLOCK
      ?auto_75060 - BLOCK
    )
    :vars
    (
      ?auto_75062 - BLOCK
      ?auto_75063 - BLOCK
      ?auto_75061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75062 ?auto_75060 ) ( ON-TABLE ?auto_75059 ) ( ON ?auto_75060 ?auto_75059 ) ( not ( = ?auto_75059 ?auto_75060 ) ) ( not ( = ?auto_75059 ?auto_75062 ) ) ( not ( = ?auto_75060 ?auto_75062 ) ) ( CLEAR ?auto_75063 ) ( not ( = ?auto_75059 ?auto_75061 ) ) ( not ( = ?auto_75059 ?auto_75063 ) ) ( not ( = ?auto_75060 ?auto_75061 ) ) ( not ( = ?auto_75060 ?auto_75063 ) ) ( not ( = ?auto_75062 ?auto_75061 ) ) ( not ( = ?auto_75062 ?auto_75063 ) ) ( not ( = ?auto_75061 ?auto_75063 ) ) ( ON ?auto_75061 ?auto_75062 ) ( CLEAR ?auto_75061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75059 ?auto_75060 ?auto_75062 )
      ( MAKE-2PILE ?auto_75059 ?auto_75060 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75064 - BLOCK
      ?auto_75065 - BLOCK
    )
    :vars
    (
      ?auto_75066 - BLOCK
      ?auto_75068 - BLOCK
      ?auto_75067 - BLOCK
      ?auto_75069 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75066 ?auto_75065 ) ( ON-TABLE ?auto_75064 ) ( ON ?auto_75065 ?auto_75064 ) ( not ( = ?auto_75064 ?auto_75065 ) ) ( not ( = ?auto_75064 ?auto_75066 ) ) ( not ( = ?auto_75065 ?auto_75066 ) ) ( not ( = ?auto_75064 ?auto_75068 ) ) ( not ( = ?auto_75064 ?auto_75067 ) ) ( not ( = ?auto_75065 ?auto_75068 ) ) ( not ( = ?auto_75065 ?auto_75067 ) ) ( not ( = ?auto_75066 ?auto_75068 ) ) ( not ( = ?auto_75066 ?auto_75067 ) ) ( not ( = ?auto_75068 ?auto_75067 ) ) ( ON ?auto_75068 ?auto_75066 ) ( CLEAR ?auto_75068 ) ( HOLDING ?auto_75067 ) ( CLEAR ?auto_75069 ) ( ON-TABLE ?auto_75069 ) ( not ( = ?auto_75069 ?auto_75067 ) ) ( not ( = ?auto_75064 ?auto_75069 ) ) ( not ( = ?auto_75065 ?auto_75069 ) ) ( not ( = ?auto_75066 ?auto_75069 ) ) ( not ( = ?auto_75068 ?auto_75069 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75069 ?auto_75067 )
      ( MAKE-2PILE ?auto_75064 ?auto_75065 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75070 - BLOCK
      ?auto_75071 - BLOCK
    )
    :vars
    (
      ?auto_75074 - BLOCK
      ?auto_75073 - BLOCK
      ?auto_75075 - BLOCK
      ?auto_75072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75074 ?auto_75071 ) ( ON-TABLE ?auto_75070 ) ( ON ?auto_75071 ?auto_75070 ) ( not ( = ?auto_75070 ?auto_75071 ) ) ( not ( = ?auto_75070 ?auto_75074 ) ) ( not ( = ?auto_75071 ?auto_75074 ) ) ( not ( = ?auto_75070 ?auto_75073 ) ) ( not ( = ?auto_75070 ?auto_75075 ) ) ( not ( = ?auto_75071 ?auto_75073 ) ) ( not ( = ?auto_75071 ?auto_75075 ) ) ( not ( = ?auto_75074 ?auto_75073 ) ) ( not ( = ?auto_75074 ?auto_75075 ) ) ( not ( = ?auto_75073 ?auto_75075 ) ) ( ON ?auto_75073 ?auto_75074 ) ( CLEAR ?auto_75072 ) ( ON-TABLE ?auto_75072 ) ( not ( = ?auto_75072 ?auto_75075 ) ) ( not ( = ?auto_75070 ?auto_75072 ) ) ( not ( = ?auto_75071 ?auto_75072 ) ) ( not ( = ?auto_75074 ?auto_75072 ) ) ( not ( = ?auto_75073 ?auto_75072 ) ) ( ON ?auto_75075 ?auto_75073 ) ( CLEAR ?auto_75075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_75070 ?auto_75071 ?auto_75074 ?auto_75073 )
      ( MAKE-2PILE ?auto_75070 ?auto_75071 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75076 - BLOCK
      ?auto_75077 - BLOCK
    )
    :vars
    (
      ?auto_75080 - BLOCK
      ?auto_75079 - BLOCK
      ?auto_75078 - BLOCK
      ?auto_75081 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75080 ?auto_75077 ) ( ON-TABLE ?auto_75076 ) ( ON ?auto_75077 ?auto_75076 ) ( not ( = ?auto_75076 ?auto_75077 ) ) ( not ( = ?auto_75076 ?auto_75080 ) ) ( not ( = ?auto_75077 ?auto_75080 ) ) ( not ( = ?auto_75076 ?auto_75079 ) ) ( not ( = ?auto_75076 ?auto_75078 ) ) ( not ( = ?auto_75077 ?auto_75079 ) ) ( not ( = ?auto_75077 ?auto_75078 ) ) ( not ( = ?auto_75080 ?auto_75079 ) ) ( not ( = ?auto_75080 ?auto_75078 ) ) ( not ( = ?auto_75079 ?auto_75078 ) ) ( ON ?auto_75079 ?auto_75080 ) ( not ( = ?auto_75081 ?auto_75078 ) ) ( not ( = ?auto_75076 ?auto_75081 ) ) ( not ( = ?auto_75077 ?auto_75081 ) ) ( not ( = ?auto_75080 ?auto_75081 ) ) ( not ( = ?auto_75079 ?auto_75081 ) ) ( ON ?auto_75078 ?auto_75079 ) ( CLEAR ?auto_75078 ) ( HOLDING ?auto_75081 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_75081 )
      ( MAKE-2PILE ?auto_75076 ?auto_75077 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75082 - BLOCK
      ?auto_75083 - BLOCK
    )
    :vars
    (
      ?auto_75086 - BLOCK
      ?auto_75084 - BLOCK
      ?auto_75087 - BLOCK
      ?auto_75085 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75086 ?auto_75083 ) ( ON-TABLE ?auto_75082 ) ( ON ?auto_75083 ?auto_75082 ) ( not ( = ?auto_75082 ?auto_75083 ) ) ( not ( = ?auto_75082 ?auto_75086 ) ) ( not ( = ?auto_75083 ?auto_75086 ) ) ( not ( = ?auto_75082 ?auto_75084 ) ) ( not ( = ?auto_75082 ?auto_75087 ) ) ( not ( = ?auto_75083 ?auto_75084 ) ) ( not ( = ?auto_75083 ?auto_75087 ) ) ( not ( = ?auto_75086 ?auto_75084 ) ) ( not ( = ?auto_75086 ?auto_75087 ) ) ( not ( = ?auto_75084 ?auto_75087 ) ) ( ON ?auto_75084 ?auto_75086 ) ( not ( = ?auto_75085 ?auto_75087 ) ) ( not ( = ?auto_75082 ?auto_75085 ) ) ( not ( = ?auto_75083 ?auto_75085 ) ) ( not ( = ?auto_75086 ?auto_75085 ) ) ( not ( = ?auto_75084 ?auto_75085 ) ) ( ON ?auto_75087 ?auto_75084 ) ( ON ?auto_75085 ?auto_75087 ) ( CLEAR ?auto_75085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_75082 ?auto_75083 ?auto_75086 ?auto_75084 ?auto_75087 )
      ( MAKE-2PILE ?auto_75082 ?auto_75083 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75088 - BLOCK
      ?auto_75089 - BLOCK
    )
    :vars
    (
      ?auto_75093 - BLOCK
      ?auto_75092 - BLOCK
      ?auto_75090 - BLOCK
      ?auto_75091 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75093 ?auto_75089 ) ( ON-TABLE ?auto_75088 ) ( ON ?auto_75089 ?auto_75088 ) ( not ( = ?auto_75088 ?auto_75089 ) ) ( not ( = ?auto_75088 ?auto_75093 ) ) ( not ( = ?auto_75089 ?auto_75093 ) ) ( not ( = ?auto_75088 ?auto_75092 ) ) ( not ( = ?auto_75088 ?auto_75090 ) ) ( not ( = ?auto_75089 ?auto_75092 ) ) ( not ( = ?auto_75089 ?auto_75090 ) ) ( not ( = ?auto_75093 ?auto_75092 ) ) ( not ( = ?auto_75093 ?auto_75090 ) ) ( not ( = ?auto_75092 ?auto_75090 ) ) ( ON ?auto_75092 ?auto_75093 ) ( not ( = ?auto_75091 ?auto_75090 ) ) ( not ( = ?auto_75088 ?auto_75091 ) ) ( not ( = ?auto_75089 ?auto_75091 ) ) ( not ( = ?auto_75093 ?auto_75091 ) ) ( not ( = ?auto_75092 ?auto_75091 ) ) ( ON ?auto_75090 ?auto_75092 ) ( HOLDING ?auto_75091 ) ( CLEAR ?auto_75090 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_75088 ?auto_75089 ?auto_75093 ?auto_75092 ?auto_75090 ?auto_75091 )
      ( MAKE-2PILE ?auto_75088 ?auto_75089 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75094 - BLOCK
      ?auto_75095 - BLOCK
    )
    :vars
    (
      ?auto_75097 - BLOCK
      ?auto_75098 - BLOCK
      ?auto_75096 - BLOCK
      ?auto_75099 - BLOCK
      ?auto_75100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75097 ?auto_75095 ) ( ON-TABLE ?auto_75094 ) ( ON ?auto_75095 ?auto_75094 ) ( not ( = ?auto_75094 ?auto_75095 ) ) ( not ( = ?auto_75094 ?auto_75097 ) ) ( not ( = ?auto_75095 ?auto_75097 ) ) ( not ( = ?auto_75094 ?auto_75098 ) ) ( not ( = ?auto_75094 ?auto_75096 ) ) ( not ( = ?auto_75095 ?auto_75098 ) ) ( not ( = ?auto_75095 ?auto_75096 ) ) ( not ( = ?auto_75097 ?auto_75098 ) ) ( not ( = ?auto_75097 ?auto_75096 ) ) ( not ( = ?auto_75098 ?auto_75096 ) ) ( ON ?auto_75098 ?auto_75097 ) ( not ( = ?auto_75099 ?auto_75096 ) ) ( not ( = ?auto_75094 ?auto_75099 ) ) ( not ( = ?auto_75095 ?auto_75099 ) ) ( not ( = ?auto_75097 ?auto_75099 ) ) ( not ( = ?auto_75098 ?auto_75099 ) ) ( ON ?auto_75096 ?auto_75098 ) ( CLEAR ?auto_75096 ) ( ON ?auto_75099 ?auto_75100 ) ( CLEAR ?auto_75099 ) ( HAND-EMPTY ) ( not ( = ?auto_75094 ?auto_75100 ) ) ( not ( = ?auto_75095 ?auto_75100 ) ) ( not ( = ?auto_75097 ?auto_75100 ) ) ( not ( = ?auto_75098 ?auto_75100 ) ) ( not ( = ?auto_75096 ?auto_75100 ) ) ( not ( = ?auto_75099 ?auto_75100 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_75099 ?auto_75100 )
      ( MAKE-2PILE ?auto_75094 ?auto_75095 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75101 - BLOCK
      ?auto_75102 - BLOCK
    )
    :vars
    (
      ?auto_75107 - BLOCK
      ?auto_75105 - BLOCK
      ?auto_75104 - BLOCK
      ?auto_75106 - BLOCK
      ?auto_75103 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75107 ?auto_75102 ) ( ON-TABLE ?auto_75101 ) ( ON ?auto_75102 ?auto_75101 ) ( not ( = ?auto_75101 ?auto_75102 ) ) ( not ( = ?auto_75101 ?auto_75107 ) ) ( not ( = ?auto_75102 ?auto_75107 ) ) ( not ( = ?auto_75101 ?auto_75105 ) ) ( not ( = ?auto_75101 ?auto_75104 ) ) ( not ( = ?auto_75102 ?auto_75105 ) ) ( not ( = ?auto_75102 ?auto_75104 ) ) ( not ( = ?auto_75107 ?auto_75105 ) ) ( not ( = ?auto_75107 ?auto_75104 ) ) ( not ( = ?auto_75105 ?auto_75104 ) ) ( ON ?auto_75105 ?auto_75107 ) ( not ( = ?auto_75106 ?auto_75104 ) ) ( not ( = ?auto_75101 ?auto_75106 ) ) ( not ( = ?auto_75102 ?auto_75106 ) ) ( not ( = ?auto_75107 ?auto_75106 ) ) ( not ( = ?auto_75105 ?auto_75106 ) ) ( ON ?auto_75106 ?auto_75103 ) ( CLEAR ?auto_75106 ) ( not ( = ?auto_75101 ?auto_75103 ) ) ( not ( = ?auto_75102 ?auto_75103 ) ) ( not ( = ?auto_75107 ?auto_75103 ) ) ( not ( = ?auto_75105 ?auto_75103 ) ) ( not ( = ?auto_75104 ?auto_75103 ) ) ( not ( = ?auto_75106 ?auto_75103 ) ) ( HOLDING ?auto_75104 ) ( CLEAR ?auto_75105 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_75101 ?auto_75102 ?auto_75107 ?auto_75105 ?auto_75104 )
      ( MAKE-2PILE ?auto_75101 ?auto_75102 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75108 - BLOCK
      ?auto_75109 - BLOCK
    )
    :vars
    (
      ?auto_75111 - BLOCK
      ?auto_75113 - BLOCK
      ?auto_75114 - BLOCK
      ?auto_75112 - BLOCK
      ?auto_75110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75111 ?auto_75109 ) ( ON-TABLE ?auto_75108 ) ( ON ?auto_75109 ?auto_75108 ) ( not ( = ?auto_75108 ?auto_75109 ) ) ( not ( = ?auto_75108 ?auto_75111 ) ) ( not ( = ?auto_75109 ?auto_75111 ) ) ( not ( = ?auto_75108 ?auto_75113 ) ) ( not ( = ?auto_75108 ?auto_75114 ) ) ( not ( = ?auto_75109 ?auto_75113 ) ) ( not ( = ?auto_75109 ?auto_75114 ) ) ( not ( = ?auto_75111 ?auto_75113 ) ) ( not ( = ?auto_75111 ?auto_75114 ) ) ( not ( = ?auto_75113 ?auto_75114 ) ) ( ON ?auto_75113 ?auto_75111 ) ( not ( = ?auto_75112 ?auto_75114 ) ) ( not ( = ?auto_75108 ?auto_75112 ) ) ( not ( = ?auto_75109 ?auto_75112 ) ) ( not ( = ?auto_75111 ?auto_75112 ) ) ( not ( = ?auto_75113 ?auto_75112 ) ) ( ON ?auto_75112 ?auto_75110 ) ( not ( = ?auto_75108 ?auto_75110 ) ) ( not ( = ?auto_75109 ?auto_75110 ) ) ( not ( = ?auto_75111 ?auto_75110 ) ) ( not ( = ?auto_75113 ?auto_75110 ) ) ( not ( = ?auto_75114 ?auto_75110 ) ) ( not ( = ?auto_75112 ?auto_75110 ) ) ( CLEAR ?auto_75113 ) ( ON ?auto_75114 ?auto_75112 ) ( CLEAR ?auto_75114 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_75110 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75110 ?auto_75112 )
      ( MAKE-2PILE ?auto_75108 ?auto_75109 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75115 - BLOCK
      ?auto_75116 - BLOCK
    )
    :vars
    (
      ?auto_75118 - BLOCK
      ?auto_75120 - BLOCK
      ?auto_75121 - BLOCK
      ?auto_75119 - BLOCK
      ?auto_75117 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75118 ?auto_75116 ) ( ON-TABLE ?auto_75115 ) ( ON ?auto_75116 ?auto_75115 ) ( not ( = ?auto_75115 ?auto_75116 ) ) ( not ( = ?auto_75115 ?auto_75118 ) ) ( not ( = ?auto_75116 ?auto_75118 ) ) ( not ( = ?auto_75115 ?auto_75120 ) ) ( not ( = ?auto_75115 ?auto_75121 ) ) ( not ( = ?auto_75116 ?auto_75120 ) ) ( not ( = ?auto_75116 ?auto_75121 ) ) ( not ( = ?auto_75118 ?auto_75120 ) ) ( not ( = ?auto_75118 ?auto_75121 ) ) ( not ( = ?auto_75120 ?auto_75121 ) ) ( not ( = ?auto_75119 ?auto_75121 ) ) ( not ( = ?auto_75115 ?auto_75119 ) ) ( not ( = ?auto_75116 ?auto_75119 ) ) ( not ( = ?auto_75118 ?auto_75119 ) ) ( not ( = ?auto_75120 ?auto_75119 ) ) ( ON ?auto_75119 ?auto_75117 ) ( not ( = ?auto_75115 ?auto_75117 ) ) ( not ( = ?auto_75116 ?auto_75117 ) ) ( not ( = ?auto_75118 ?auto_75117 ) ) ( not ( = ?auto_75120 ?auto_75117 ) ) ( not ( = ?auto_75121 ?auto_75117 ) ) ( not ( = ?auto_75119 ?auto_75117 ) ) ( ON ?auto_75121 ?auto_75119 ) ( CLEAR ?auto_75121 ) ( ON-TABLE ?auto_75117 ) ( HOLDING ?auto_75120 ) ( CLEAR ?auto_75118 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_75115 ?auto_75116 ?auto_75118 ?auto_75120 )
      ( MAKE-2PILE ?auto_75115 ?auto_75116 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75122 - BLOCK
      ?auto_75123 - BLOCK
    )
    :vars
    (
      ?auto_75124 - BLOCK
      ?auto_75128 - BLOCK
      ?auto_75125 - BLOCK
      ?auto_75126 - BLOCK
      ?auto_75127 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75124 ?auto_75123 ) ( ON-TABLE ?auto_75122 ) ( ON ?auto_75123 ?auto_75122 ) ( not ( = ?auto_75122 ?auto_75123 ) ) ( not ( = ?auto_75122 ?auto_75124 ) ) ( not ( = ?auto_75123 ?auto_75124 ) ) ( not ( = ?auto_75122 ?auto_75128 ) ) ( not ( = ?auto_75122 ?auto_75125 ) ) ( not ( = ?auto_75123 ?auto_75128 ) ) ( not ( = ?auto_75123 ?auto_75125 ) ) ( not ( = ?auto_75124 ?auto_75128 ) ) ( not ( = ?auto_75124 ?auto_75125 ) ) ( not ( = ?auto_75128 ?auto_75125 ) ) ( not ( = ?auto_75126 ?auto_75125 ) ) ( not ( = ?auto_75122 ?auto_75126 ) ) ( not ( = ?auto_75123 ?auto_75126 ) ) ( not ( = ?auto_75124 ?auto_75126 ) ) ( not ( = ?auto_75128 ?auto_75126 ) ) ( ON ?auto_75126 ?auto_75127 ) ( not ( = ?auto_75122 ?auto_75127 ) ) ( not ( = ?auto_75123 ?auto_75127 ) ) ( not ( = ?auto_75124 ?auto_75127 ) ) ( not ( = ?auto_75128 ?auto_75127 ) ) ( not ( = ?auto_75125 ?auto_75127 ) ) ( not ( = ?auto_75126 ?auto_75127 ) ) ( ON ?auto_75125 ?auto_75126 ) ( ON-TABLE ?auto_75127 ) ( CLEAR ?auto_75124 ) ( ON ?auto_75128 ?auto_75125 ) ( CLEAR ?auto_75128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75127 ?auto_75126 ?auto_75125 )
      ( MAKE-2PILE ?auto_75122 ?auto_75123 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75143 - BLOCK
      ?auto_75144 - BLOCK
    )
    :vars
    (
      ?auto_75145 - BLOCK
      ?auto_75149 - BLOCK
      ?auto_75146 - BLOCK
      ?auto_75147 - BLOCK
      ?auto_75148 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_75143 ) ( not ( = ?auto_75143 ?auto_75144 ) ) ( not ( = ?auto_75143 ?auto_75145 ) ) ( not ( = ?auto_75144 ?auto_75145 ) ) ( not ( = ?auto_75143 ?auto_75149 ) ) ( not ( = ?auto_75143 ?auto_75146 ) ) ( not ( = ?auto_75144 ?auto_75149 ) ) ( not ( = ?auto_75144 ?auto_75146 ) ) ( not ( = ?auto_75145 ?auto_75149 ) ) ( not ( = ?auto_75145 ?auto_75146 ) ) ( not ( = ?auto_75149 ?auto_75146 ) ) ( not ( = ?auto_75147 ?auto_75146 ) ) ( not ( = ?auto_75143 ?auto_75147 ) ) ( not ( = ?auto_75144 ?auto_75147 ) ) ( not ( = ?auto_75145 ?auto_75147 ) ) ( not ( = ?auto_75149 ?auto_75147 ) ) ( ON ?auto_75147 ?auto_75148 ) ( not ( = ?auto_75143 ?auto_75148 ) ) ( not ( = ?auto_75144 ?auto_75148 ) ) ( not ( = ?auto_75145 ?auto_75148 ) ) ( not ( = ?auto_75149 ?auto_75148 ) ) ( not ( = ?auto_75146 ?auto_75148 ) ) ( not ( = ?auto_75147 ?auto_75148 ) ) ( ON ?auto_75146 ?auto_75147 ) ( ON-TABLE ?auto_75148 ) ( ON ?auto_75149 ?auto_75146 ) ( ON ?auto_75145 ?auto_75149 ) ( CLEAR ?auto_75145 ) ( HOLDING ?auto_75144 ) ( CLEAR ?auto_75143 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75143 ?auto_75144 ?auto_75145 )
      ( MAKE-2PILE ?auto_75143 ?auto_75144 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75150 - BLOCK
      ?auto_75151 - BLOCK
    )
    :vars
    (
      ?auto_75153 - BLOCK
      ?auto_75155 - BLOCK
      ?auto_75152 - BLOCK
      ?auto_75156 - BLOCK
      ?auto_75154 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_75150 ) ( not ( = ?auto_75150 ?auto_75151 ) ) ( not ( = ?auto_75150 ?auto_75153 ) ) ( not ( = ?auto_75151 ?auto_75153 ) ) ( not ( = ?auto_75150 ?auto_75155 ) ) ( not ( = ?auto_75150 ?auto_75152 ) ) ( not ( = ?auto_75151 ?auto_75155 ) ) ( not ( = ?auto_75151 ?auto_75152 ) ) ( not ( = ?auto_75153 ?auto_75155 ) ) ( not ( = ?auto_75153 ?auto_75152 ) ) ( not ( = ?auto_75155 ?auto_75152 ) ) ( not ( = ?auto_75156 ?auto_75152 ) ) ( not ( = ?auto_75150 ?auto_75156 ) ) ( not ( = ?auto_75151 ?auto_75156 ) ) ( not ( = ?auto_75153 ?auto_75156 ) ) ( not ( = ?auto_75155 ?auto_75156 ) ) ( ON ?auto_75156 ?auto_75154 ) ( not ( = ?auto_75150 ?auto_75154 ) ) ( not ( = ?auto_75151 ?auto_75154 ) ) ( not ( = ?auto_75153 ?auto_75154 ) ) ( not ( = ?auto_75155 ?auto_75154 ) ) ( not ( = ?auto_75152 ?auto_75154 ) ) ( not ( = ?auto_75156 ?auto_75154 ) ) ( ON ?auto_75152 ?auto_75156 ) ( ON-TABLE ?auto_75154 ) ( ON ?auto_75155 ?auto_75152 ) ( ON ?auto_75153 ?auto_75155 ) ( CLEAR ?auto_75150 ) ( ON ?auto_75151 ?auto_75153 ) ( CLEAR ?auto_75151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_75154 ?auto_75156 ?auto_75152 ?auto_75155 ?auto_75153 )
      ( MAKE-2PILE ?auto_75150 ?auto_75151 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75157 - BLOCK
      ?auto_75158 - BLOCK
    )
    :vars
    (
      ?auto_75161 - BLOCK
      ?auto_75159 - BLOCK
      ?auto_75160 - BLOCK
      ?auto_75163 - BLOCK
      ?auto_75162 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75157 ?auto_75158 ) ) ( not ( = ?auto_75157 ?auto_75161 ) ) ( not ( = ?auto_75158 ?auto_75161 ) ) ( not ( = ?auto_75157 ?auto_75159 ) ) ( not ( = ?auto_75157 ?auto_75160 ) ) ( not ( = ?auto_75158 ?auto_75159 ) ) ( not ( = ?auto_75158 ?auto_75160 ) ) ( not ( = ?auto_75161 ?auto_75159 ) ) ( not ( = ?auto_75161 ?auto_75160 ) ) ( not ( = ?auto_75159 ?auto_75160 ) ) ( not ( = ?auto_75163 ?auto_75160 ) ) ( not ( = ?auto_75157 ?auto_75163 ) ) ( not ( = ?auto_75158 ?auto_75163 ) ) ( not ( = ?auto_75161 ?auto_75163 ) ) ( not ( = ?auto_75159 ?auto_75163 ) ) ( ON ?auto_75163 ?auto_75162 ) ( not ( = ?auto_75157 ?auto_75162 ) ) ( not ( = ?auto_75158 ?auto_75162 ) ) ( not ( = ?auto_75161 ?auto_75162 ) ) ( not ( = ?auto_75159 ?auto_75162 ) ) ( not ( = ?auto_75160 ?auto_75162 ) ) ( not ( = ?auto_75163 ?auto_75162 ) ) ( ON ?auto_75160 ?auto_75163 ) ( ON-TABLE ?auto_75162 ) ( ON ?auto_75159 ?auto_75160 ) ( ON ?auto_75161 ?auto_75159 ) ( ON ?auto_75158 ?auto_75161 ) ( CLEAR ?auto_75158 ) ( HOLDING ?auto_75157 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_75157 )
      ( MAKE-2PILE ?auto_75157 ?auto_75158 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75164 - BLOCK
      ?auto_75165 - BLOCK
    )
    :vars
    (
      ?auto_75169 - BLOCK
      ?auto_75170 - BLOCK
      ?auto_75166 - BLOCK
      ?auto_75168 - BLOCK
      ?auto_75167 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75164 ?auto_75165 ) ) ( not ( = ?auto_75164 ?auto_75169 ) ) ( not ( = ?auto_75165 ?auto_75169 ) ) ( not ( = ?auto_75164 ?auto_75170 ) ) ( not ( = ?auto_75164 ?auto_75166 ) ) ( not ( = ?auto_75165 ?auto_75170 ) ) ( not ( = ?auto_75165 ?auto_75166 ) ) ( not ( = ?auto_75169 ?auto_75170 ) ) ( not ( = ?auto_75169 ?auto_75166 ) ) ( not ( = ?auto_75170 ?auto_75166 ) ) ( not ( = ?auto_75168 ?auto_75166 ) ) ( not ( = ?auto_75164 ?auto_75168 ) ) ( not ( = ?auto_75165 ?auto_75168 ) ) ( not ( = ?auto_75169 ?auto_75168 ) ) ( not ( = ?auto_75170 ?auto_75168 ) ) ( ON ?auto_75168 ?auto_75167 ) ( not ( = ?auto_75164 ?auto_75167 ) ) ( not ( = ?auto_75165 ?auto_75167 ) ) ( not ( = ?auto_75169 ?auto_75167 ) ) ( not ( = ?auto_75170 ?auto_75167 ) ) ( not ( = ?auto_75166 ?auto_75167 ) ) ( not ( = ?auto_75168 ?auto_75167 ) ) ( ON ?auto_75166 ?auto_75168 ) ( ON-TABLE ?auto_75167 ) ( ON ?auto_75170 ?auto_75166 ) ( ON ?auto_75169 ?auto_75170 ) ( ON ?auto_75165 ?auto_75169 ) ( ON ?auto_75164 ?auto_75165 ) ( CLEAR ?auto_75164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_75167 ?auto_75168 ?auto_75166 ?auto_75170 ?auto_75169 ?auto_75165 )
      ( MAKE-2PILE ?auto_75164 ?auto_75165 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75175 - BLOCK
      ?auto_75176 - BLOCK
      ?auto_75177 - BLOCK
      ?auto_75178 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_75178 ) ( CLEAR ?auto_75177 ) ( ON-TABLE ?auto_75175 ) ( ON ?auto_75176 ?auto_75175 ) ( ON ?auto_75177 ?auto_75176 ) ( not ( = ?auto_75175 ?auto_75176 ) ) ( not ( = ?auto_75175 ?auto_75177 ) ) ( not ( = ?auto_75175 ?auto_75178 ) ) ( not ( = ?auto_75176 ?auto_75177 ) ) ( not ( = ?auto_75176 ?auto_75178 ) ) ( not ( = ?auto_75177 ?auto_75178 ) ) )
    :subtasks
    ( ( !STACK ?auto_75178 ?auto_75177 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75179 - BLOCK
      ?auto_75180 - BLOCK
      ?auto_75181 - BLOCK
      ?auto_75182 - BLOCK
    )
    :vars
    (
      ?auto_75183 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_75181 ) ( ON-TABLE ?auto_75179 ) ( ON ?auto_75180 ?auto_75179 ) ( ON ?auto_75181 ?auto_75180 ) ( not ( = ?auto_75179 ?auto_75180 ) ) ( not ( = ?auto_75179 ?auto_75181 ) ) ( not ( = ?auto_75179 ?auto_75182 ) ) ( not ( = ?auto_75180 ?auto_75181 ) ) ( not ( = ?auto_75180 ?auto_75182 ) ) ( not ( = ?auto_75181 ?auto_75182 ) ) ( ON ?auto_75182 ?auto_75183 ) ( CLEAR ?auto_75182 ) ( HAND-EMPTY ) ( not ( = ?auto_75179 ?auto_75183 ) ) ( not ( = ?auto_75180 ?auto_75183 ) ) ( not ( = ?auto_75181 ?auto_75183 ) ) ( not ( = ?auto_75182 ?auto_75183 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_75182 ?auto_75183 )
      ( MAKE-4PILE ?auto_75179 ?auto_75180 ?auto_75181 ?auto_75182 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75184 - BLOCK
      ?auto_75185 - BLOCK
      ?auto_75186 - BLOCK
      ?auto_75187 - BLOCK
    )
    :vars
    (
      ?auto_75188 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_75184 ) ( ON ?auto_75185 ?auto_75184 ) ( not ( = ?auto_75184 ?auto_75185 ) ) ( not ( = ?auto_75184 ?auto_75186 ) ) ( not ( = ?auto_75184 ?auto_75187 ) ) ( not ( = ?auto_75185 ?auto_75186 ) ) ( not ( = ?auto_75185 ?auto_75187 ) ) ( not ( = ?auto_75186 ?auto_75187 ) ) ( ON ?auto_75187 ?auto_75188 ) ( CLEAR ?auto_75187 ) ( not ( = ?auto_75184 ?auto_75188 ) ) ( not ( = ?auto_75185 ?auto_75188 ) ) ( not ( = ?auto_75186 ?auto_75188 ) ) ( not ( = ?auto_75187 ?auto_75188 ) ) ( HOLDING ?auto_75186 ) ( CLEAR ?auto_75185 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75184 ?auto_75185 ?auto_75186 )
      ( MAKE-4PILE ?auto_75184 ?auto_75185 ?auto_75186 ?auto_75187 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75189 - BLOCK
      ?auto_75190 - BLOCK
      ?auto_75191 - BLOCK
      ?auto_75192 - BLOCK
    )
    :vars
    (
      ?auto_75193 - BLOCK
      ?auto_75194 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_75189 ) ( ON ?auto_75190 ?auto_75189 ) ( not ( = ?auto_75189 ?auto_75190 ) ) ( not ( = ?auto_75189 ?auto_75191 ) ) ( not ( = ?auto_75189 ?auto_75192 ) ) ( not ( = ?auto_75190 ?auto_75191 ) ) ( not ( = ?auto_75190 ?auto_75192 ) ) ( not ( = ?auto_75191 ?auto_75192 ) ) ( ON ?auto_75192 ?auto_75193 ) ( not ( = ?auto_75189 ?auto_75193 ) ) ( not ( = ?auto_75190 ?auto_75193 ) ) ( not ( = ?auto_75191 ?auto_75193 ) ) ( not ( = ?auto_75192 ?auto_75193 ) ) ( CLEAR ?auto_75190 ) ( ON ?auto_75191 ?auto_75192 ) ( CLEAR ?auto_75191 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_75194 ) ( ON ?auto_75193 ?auto_75194 ) ( not ( = ?auto_75194 ?auto_75193 ) ) ( not ( = ?auto_75194 ?auto_75192 ) ) ( not ( = ?auto_75194 ?auto_75191 ) ) ( not ( = ?auto_75189 ?auto_75194 ) ) ( not ( = ?auto_75190 ?auto_75194 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75194 ?auto_75193 ?auto_75192 )
      ( MAKE-4PILE ?auto_75189 ?auto_75190 ?auto_75191 ?auto_75192 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75195 - BLOCK
      ?auto_75196 - BLOCK
      ?auto_75197 - BLOCK
      ?auto_75198 - BLOCK
    )
    :vars
    (
      ?auto_75199 - BLOCK
      ?auto_75200 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_75195 ) ( not ( = ?auto_75195 ?auto_75196 ) ) ( not ( = ?auto_75195 ?auto_75197 ) ) ( not ( = ?auto_75195 ?auto_75198 ) ) ( not ( = ?auto_75196 ?auto_75197 ) ) ( not ( = ?auto_75196 ?auto_75198 ) ) ( not ( = ?auto_75197 ?auto_75198 ) ) ( ON ?auto_75198 ?auto_75199 ) ( not ( = ?auto_75195 ?auto_75199 ) ) ( not ( = ?auto_75196 ?auto_75199 ) ) ( not ( = ?auto_75197 ?auto_75199 ) ) ( not ( = ?auto_75198 ?auto_75199 ) ) ( ON ?auto_75197 ?auto_75198 ) ( CLEAR ?auto_75197 ) ( ON-TABLE ?auto_75200 ) ( ON ?auto_75199 ?auto_75200 ) ( not ( = ?auto_75200 ?auto_75199 ) ) ( not ( = ?auto_75200 ?auto_75198 ) ) ( not ( = ?auto_75200 ?auto_75197 ) ) ( not ( = ?auto_75195 ?auto_75200 ) ) ( not ( = ?auto_75196 ?auto_75200 ) ) ( HOLDING ?auto_75196 ) ( CLEAR ?auto_75195 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75195 ?auto_75196 )
      ( MAKE-4PILE ?auto_75195 ?auto_75196 ?auto_75197 ?auto_75198 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75201 - BLOCK
      ?auto_75202 - BLOCK
      ?auto_75203 - BLOCK
      ?auto_75204 - BLOCK
    )
    :vars
    (
      ?auto_75205 - BLOCK
      ?auto_75206 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_75201 ) ( not ( = ?auto_75201 ?auto_75202 ) ) ( not ( = ?auto_75201 ?auto_75203 ) ) ( not ( = ?auto_75201 ?auto_75204 ) ) ( not ( = ?auto_75202 ?auto_75203 ) ) ( not ( = ?auto_75202 ?auto_75204 ) ) ( not ( = ?auto_75203 ?auto_75204 ) ) ( ON ?auto_75204 ?auto_75205 ) ( not ( = ?auto_75201 ?auto_75205 ) ) ( not ( = ?auto_75202 ?auto_75205 ) ) ( not ( = ?auto_75203 ?auto_75205 ) ) ( not ( = ?auto_75204 ?auto_75205 ) ) ( ON ?auto_75203 ?auto_75204 ) ( ON-TABLE ?auto_75206 ) ( ON ?auto_75205 ?auto_75206 ) ( not ( = ?auto_75206 ?auto_75205 ) ) ( not ( = ?auto_75206 ?auto_75204 ) ) ( not ( = ?auto_75206 ?auto_75203 ) ) ( not ( = ?auto_75201 ?auto_75206 ) ) ( not ( = ?auto_75202 ?auto_75206 ) ) ( CLEAR ?auto_75201 ) ( ON ?auto_75202 ?auto_75203 ) ( CLEAR ?auto_75202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_75206 ?auto_75205 ?auto_75204 ?auto_75203 )
      ( MAKE-4PILE ?auto_75201 ?auto_75202 ?auto_75203 ?auto_75204 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75207 - BLOCK
      ?auto_75208 - BLOCK
      ?auto_75209 - BLOCK
      ?auto_75210 - BLOCK
    )
    :vars
    (
      ?auto_75212 - BLOCK
      ?auto_75211 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75207 ?auto_75208 ) ) ( not ( = ?auto_75207 ?auto_75209 ) ) ( not ( = ?auto_75207 ?auto_75210 ) ) ( not ( = ?auto_75208 ?auto_75209 ) ) ( not ( = ?auto_75208 ?auto_75210 ) ) ( not ( = ?auto_75209 ?auto_75210 ) ) ( ON ?auto_75210 ?auto_75212 ) ( not ( = ?auto_75207 ?auto_75212 ) ) ( not ( = ?auto_75208 ?auto_75212 ) ) ( not ( = ?auto_75209 ?auto_75212 ) ) ( not ( = ?auto_75210 ?auto_75212 ) ) ( ON ?auto_75209 ?auto_75210 ) ( ON-TABLE ?auto_75211 ) ( ON ?auto_75212 ?auto_75211 ) ( not ( = ?auto_75211 ?auto_75212 ) ) ( not ( = ?auto_75211 ?auto_75210 ) ) ( not ( = ?auto_75211 ?auto_75209 ) ) ( not ( = ?auto_75207 ?auto_75211 ) ) ( not ( = ?auto_75208 ?auto_75211 ) ) ( ON ?auto_75208 ?auto_75209 ) ( CLEAR ?auto_75208 ) ( HOLDING ?auto_75207 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_75207 )
      ( MAKE-4PILE ?auto_75207 ?auto_75208 ?auto_75209 ?auto_75210 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75213 - BLOCK
      ?auto_75214 - BLOCK
      ?auto_75215 - BLOCK
      ?auto_75216 - BLOCK
    )
    :vars
    (
      ?auto_75217 - BLOCK
      ?auto_75218 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75213 ?auto_75214 ) ) ( not ( = ?auto_75213 ?auto_75215 ) ) ( not ( = ?auto_75213 ?auto_75216 ) ) ( not ( = ?auto_75214 ?auto_75215 ) ) ( not ( = ?auto_75214 ?auto_75216 ) ) ( not ( = ?auto_75215 ?auto_75216 ) ) ( ON ?auto_75216 ?auto_75217 ) ( not ( = ?auto_75213 ?auto_75217 ) ) ( not ( = ?auto_75214 ?auto_75217 ) ) ( not ( = ?auto_75215 ?auto_75217 ) ) ( not ( = ?auto_75216 ?auto_75217 ) ) ( ON ?auto_75215 ?auto_75216 ) ( ON-TABLE ?auto_75218 ) ( ON ?auto_75217 ?auto_75218 ) ( not ( = ?auto_75218 ?auto_75217 ) ) ( not ( = ?auto_75218 ?auto_75216 ) ) ( not ( = ?auto_75218 ?auto_75215 ) ) ( not ( = ?auto_75213 ?auto_75218 ) ) ( not ( = ?auto_75214 ?auto_75218 ) ) ( ON ?auto_75214 ?auto_75215 ) ( ON ?auto_75213 ?auto_75214 ) ( CLEAR ?auto_75213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_75218 ?auto_75217 ?auto_75216 ?auto_75215 ?auto_75214 )
      ( MAKE-4PILE ?auto_75213 ?auto_75214 ?auto_75215 ?auto_75216 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75219 - BLOCK
      ?auto_75220 - BLOCK
      ?auto_75221 - BLOCK
      ?auto_75222 - BLOCK
    )
    :vars
    (
      ?auto_75223 - BLOCK
      ?auto_75224 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75219 ?auto_75220 ) ) ( not ( = ?auto_75219 ?auto_75221 ) ) ( not ( = ?auto_75219 ?auto_75222 ) ) ( not ( = ?auto_75220 ?auto_75221 ) ) ( not ( = ?auto_75220 ?auto_75222 ) ) ( not ( = ?auto_75221 ?auto_75222 ) ) ( ON ?auto_75222 ?auto_75223 ) ( not ( = ?auto_75219 ?auto_75223 ) ) ( not ( = ?auto_75220 ?auto_75223 ) ) ( not ( = ?auto_75221 ?auto_75223 ) ) ( not ( = ?auto_75222 ?auto_75223 ) ) ( ON ?auto_75221 ?auto_75222 ) ( ON-TABLE ?auto_75224 ) ( ON ?auto_75223 ?auto_75224 ) ( not ( = ?auto_75224 ?auto_75223 ) ) ( not ( = ?auto_75224 ?auto_75222 ) ) ( not ( = ?auto_75224 ?auto_75221 ) ) ( not ( = ?auto_75219 ?auto_75224 ) ) ( not ( = ?auto_75220 ?auto_75224 ) ) ( ON ?auto_75220 ?auto_75221 ) ( HOLDING ?auto_75219 ) ( CLEAR ?auto_75220 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_75224 ?auto_75223 ?auto_75222 ?auto_75221 ?auto_75220 ?auto_75219 )
      ( MAKE-4PILE ?auto_75219 ?auto_75220 ?auto_75221 ?auto_75222 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75225 - BLOCK
      ?auto_75226 - BLOCK
      ?auto_75227 - BLOCK
      ?auto_75228 - BLOCK
    )
    :vars
    (
      ?auto_75230 - BLOCK
      ?auto_75229 - BLOCK
      ?auto_75231 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75225 ?auto_75226 ) ) ( not ( = ?auto_75225 ?auto_75227 ) ) ( not ( = ?auto_75225 ?auto_75228 ) ) ( not ( = ?auto_75226 ?auto_75227 ) ) ( not ( = ?auto_75226 ?auto_75228 ) ) ( not ( = ?auto_75227 ?auto_75228 ) ) ( ON ?auto_75228 ?auto_75230 ) ( not ( = ?auto_75225 ?auto_75230 ) ) ( not ( = ?auto_75226 ?auto_75230 ) ) ( not ( = ?auto_75227 ?auto_75230 ) ) ( not ( = ?auto_75228 ?auto_75230 ) ) ( ON ?auto_75227 ?auto_75228 ) ( ON-TABLE ?auto_75229 ) ( ON ?auto_75230 ?auto_75229 ) ( not ( = ?auto_75229 ?auto_75230 ) ) ( not ( = ?auto_75229 ?auto_75228 ) ) ( not ( = ?auto_75229 ?auto_75227 ) ) ( not ( = ?auto_75225 ?auto_75229 ) ) ( not ( = ?auto_75226 ?auto_75229 ) ) ( ON ?auto_75226 ?auto_75227 ) ( CLEAR ?auto_75226 ) ( ON ?auto_75225 ?auto_75231 ) ( CLEAR ?auto_75225 ) ( HAND-EMPTY ) ( not ( = ?auto_75225 ?auto_75231 ) ) ( not ( = ?auto_75226 ?auto_75231 ) ) ( not ( = ?auto_75227 ?auto_75231 ) ) ( not ( = ?auto_75228 ?auto_75231 ) ) ( not ( = ?auto_75230 ?auto_75231 ) ) ( not ( = ?auto_75229 ?auto_75231 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_75225 ?auto_75231 )
      ( MAKE-4PILE ?auto_75225 ?auto_75226 ?auto_75227 ?auto_75228 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75232 - BLOCK
      ?auto_75233 - BLOCK
      ?auto_75234 - BLOCK
      ?auto_75235 - BLOCK
    )
    :vars
    (
      ?auto_75238 - BLOCK
      ?auto_75236 - BLOCK
      ?auto_75237 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75232 ?auto_75233 ) ) ( not ( = ?auto_75232 ?auto_75234 ) ) ( not ( = ?auto_75232 ?auto_75235 ) ) ( not ( = ?auto_75233 ?auto_75234 ) ) ( not ( = ?auto_75233 ?auto_75235 ) ) ( not ( = ?auto_75234 ?auto_75235 ) ) ( ON ?auto_75235 ?auto_75238 ) ( not ( = ?auto_75232 ?auto_75238 ) ) ( not ( = ?auto_75233 ?auto_75238 ) ) ( not ( = ?auto_75234 ?auto_75238 ) ) ( not ( = ?auto_75235 ?auto_75238 ) ) ( ON ?auto_75234 ?auto_75235 ) ( ON-TABLE ?auto_75236 ) ( ON ?auto_75238 ?auto_75236 ) ( not ( = ?auto_75236 ?auto_75238 ) ) ( not ( = ?auto_75236 ?auto_75235 ) ) ( not ( = ?auto_75236 ?auto_75234 ) ) ( not ( = ?auto_75232 ?auto_75236 ) ) ( not ( = ?auto_75233 ?auto_75236 ) ) ( ON ?auto_75232 ?auto_75237 ) ( CLEAR ?auto_75232 ) ( not ( = ?auto_75232 ?auto_75237 ) ) ( not ( = ?auto_75233 ?auto_75237 ) ) ( not ( = ?auto_75234 ?auto_75237 ) ) ( not ( = ?auto_75235 ?auto_75237 ) ) ( not ( = ?auto_75238 ?auto_75237 ) ) ( not ( = ?auto_75236 ?auto_75237 ) ) ( HOLDING ?auto_75233 ) ( CLEAR ?auto_75234 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_75236 ?auto_75238 ?auto_75235 ?auto_75234 ?auto_75233 )
      ( MAKE-4PILE ?auto_75232 ?auto_75233 ?auto_75234 ?auto_75235 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75239 - BLOCK
      ?auto_75240 - BLOCK
      ?auto_75241 - BLOCK
      ?auto_75242 - BLOCK
    )
    :vars
    (
      ?auto_75243 - BLOCK
      ?auto_75244 - BLOCK
      ?auto_75245 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75239 ?auto_75240 ) ) ( not ( = ?auto_75239 ?auto_75241 ) ) ( not ( = ?auto_75239 ?auto_75242 ) ) ( not ( = ?auto_75240 ?auto_75241 ) ) ( not ( = ?auto_75240 ?auto_75242 ) ) ( not ( = ?auto_75241 ?auto_75242 ) ) ( ON ?auto_75242 ?auto_75243 ) ( not ( = ?auto_75239 ?auto_75243 ) ) ( not ( = ?auto_75240 ?auto_75243 ) ) ( not ( = ?auto_75241 ?auto_75243 ) ) ( not ( = ?auto_75242 ?auto_75243 ) ) ( ON ?auto_75241 ?auto_75242 ) ( ON-TABLE ?auto_75244 ) ( ON ?auto_75243 ?auto_75244 ) ( not ( = ?auto_75244 ?auto_75243 ) ) ( not ( = ?auto_75244 ?auto_75242 ) ) ( not ( = ?auto_75244 ?auto_75241 ) ) ( not ( = ?auto_75239 ?auto_75244 ) ) ( not ( = ?auto_75240 ?auto_75244 ) ) ( ON ?auto_75239 ?auto_75245 ) ( not ( = ?auto_75239 ?auto_75245 ) ) ( not ( = ?auto_75240 ?auto_75245 ) ) ( not ( = ?auto_75241 ?auto_75245 ) ) ( not ( = ?auto_75242 ?auto_75245 ) ) ( not ( = ?auto_75243 ?auto_75245 ) ) ( not ( = ?auto_75244 ?auto_75245 ) ) ( CLEAR ?auto_75241 ) ( ON ?auto_75240 ?auto_75239 ) ( CLEAR ?auto_75240 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_75245 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75245 ?auto_75239 )
      ( MAKE-4PILE ?auto_75239 ?auto_75240 ?auto_75241 ?auto_75242 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75246 - BLOCK
      ?auto_75247 - BLOCK
      ?auto_75248 - BLOCK
      ?auto_75249 - BLOCK
    )
    :vars
    (
      ?auto_75251 - BLOCK
      ?auto_75250 - BLOCK
      ?auto_75252 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75246 ?auto_75247 ) ) ( not ( = ?auto_75246 ?auto_75248 ) ) ( not ( = ?auto_75246 ?auto_75249 ) ) ( not ( = ?auto_75247 ?auto_75248 ) ) ( not ( = ?auto_75247 ?auto_75249 ) ) ( not ( = ?auto_75248 ?auto_75249 ) ) ( ON ?auto_75249 ?auto_75251 ) ( not ( = ?auto_75246 ?auto_75251 ) ) ( not ( = ?auto_75247 ?auto_75251 ) ) ( not ( = ?auto_75248 ?auto_75251 ) ) ( not ( = ?auto_75249 ?auto_75251 ) ) ( ON-TABLE ?auto_75250 ) ( ON ?auto_75251 ?auto_75250 ) ( not ( = ?auto_75250 ?auto_75251 ) ) ( not ( = ?auto_75250 ?auto_75249 ) ) ( not ( = ?auto_75250 ?auto_75248 ) ) ( not ( = ?auto_75246 ?auto_75250 ) ) ( not ( = ?auto_75247 ?auto_75250 ) ) ( ON ?auto_75246 ?auto_75252 ) ( not ( = ?auto_75246 ?auto_75252 ) ) ( not ( = ?auto_75247 ?auto_75252 ) ) ( not ( = ?auto_75248 ?auto_75252 ) ) ( not ( = ?auto_75249 ?auto_75252 ) ) ( not ( = ?auto_75251 ?auto_75252 ) ) ( not ( = ?auto_75250 ?auto_75252 ) ) ( ON ?auto_75247 ?auto_75246 ) ( CLEAR ?auto_75247 ) ( ON-TABLE ?auto_75252 ) ( HOLDING ?auto_75248 ) ( CLEAR ?auto_75249 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_75250 ?auto_75251 ?auto_75249 ?auto_75248 )
      ( MAKE-4PILE ?auto_75246 ?auto_75247 ?auto_75248 ?auto_75249 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75253 - BLOCK
      ?auto_75254 - BLOCK
      ?auto_75255 - BLOCK
      ?auto_75256 - BLOCK
    )
    :vars
    (
      ?auto_75257 - BLOCK
      ?auto_75258 - BLOCK
      ?auto_75259 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75253 ?auto_75254 ) ) ( not ( = ?auto_75253 ?auto_75255 ) ) ( not ( = ?auto_75253 ?auto_75256 ) ) ( not ( = ?auto_75254 ?auto_75255 ) ) ( not ( = ?auto_75254 ?auto_75256 ) ) ( not ( = ?auto_75255 ?auto_75256 ) ) ( ON ?auto_75256 ?auto_75257 ) ( not ( = ?auto_75253 ?auto_75257 ) ) ( not ( = ?auto_75254 ?auto_75257 ) ) ( not ( = ?auto_75255 ?auto_75257 ) ) ( not ( = ?auto_75256 ?auto_75257 ) ) ( ON-TABLE ?auto_75258 ) ( ON ?auto_75257 ?auto_75258 ) ( not ( = ?auto_75258 ?auto_75257 ) ) ( not ( = ?auto_75258 ?auto_75256 ) ) ( not ( = ?auto_75258 ?auto_75255 ) ) ( not ( = ?auto_75253 ?auto_75258 ) ) ( not ( = ?auto_75254 ?auto_75258 ) ) ( ON ?auto_75253 ?auto_75259 ) ( not ( = ?auto_75253 ?auto_75259 ) ) ( not ( = ?auto_75254 ?auto_75259 ) ) ( not ( = ?auto_75255 ?auto_75259 ) ) ( not ( = ?auto_75256 ?auto_75259 ) ) ( not ( = ?auto_75257 ?auto_75259 ) ) ( not ( = ?auto_75258 ?auto_75259 ) ) ( ON ?auto_75254 ?auto_75253 ) ( ON-TABLE ?auto_75259 ) ( CLEAR ?auto_75256 ) ( ON ?auto_75255 ?auto_75254 ) ( CLEAR ?auto_75255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75259 ?auto_75253 ?auto_75254 )
      ( MAKE-4PILE ?auto_75253 ?auto_75254 ?auto_75255 ?auto_75256 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75260 - BLOCK
      ?auto_75261 - BLOCK
      ?auto_75262 - BLOCK
      ?auto_75263 - BLOCK
    )
    :vars
    (
      ?auto_75265 - BLOCK
      ?auto_75266 - BLOCK
      ?auto_75264 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75260 ?auto_75261 ) ) ( not ( = ?auto_75260 ?auto_75262 ) ) ( not ( = ?auto_75260 ?auto_75263 ) ) ( not ( = ?auto_75261 ?auto_75262 ) ) ( not ( = ?auto_75261 ?auto_75263 ) ) ( not ( = ?auto_75262 ?auto_75263 ) ) ( not ( = ?auto_75260 ?auto_75265 ) ) ( not ( = ?auto_75261 ?auto_75265 ) ) ( not ( = ?auto_75262 ?auto_75265 ) ) ( not ( = ?auto_75263 ?auto_75265 ) ) ( ON-TABLE ?auto_75266 ) ( ON ?auto_75265 ?auto_75266 ) ( not ( = ?auto_75266 ?auto_75265 ) ) ( not ( = ?auto_75266 ?auto_75263 ) ) ( not ( = ?auto_75266 ?auto_75262 ) ) ( not ( = ?auto_75260 ?auto_75266 ) ) ( not ( = ?auto_75261 ?auto_75266 ) ) ( ON ?auto_75260 ?auto_75264 ) ( not ( = ?auto_75260 ?auto_75264 ) ) ( not ( = ?auto_75261 ?auto_75264 ) ) ( not ( = ?auto_75262 ?auto_75264 ) ) ( not ( = ?auto_75263 ?auto_75264 ) ) ( not ( = ?auto_75265 ?auto_75264 ) ) ( not ( = ?auto_75266 ?auto_75264 ) ) ( ON ?auto_75261 ?auto_75260 ) ( ON-TABLE ?auto_75264 ) ( ON ?auto_75262 ?auto_75261 ) ( CLEAR ?auto_75262 ) ( HOLDING ?auto_75263 ) ( CLEAR ?auto_75265 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75266 ?auto_75265 ?auto_75263 )
      ( MAKE-4PILE ?auto_75260 ?auto_75261 ?auto_75262 ?auto_75263 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75267 - BLOCK
      ?auto_75268 - BLOCK
      ?auto_75269 - BLOCK
      ?auto_75270 - BLOCK
    )
    :vars
    (
      ?auto_75272 - BLOCK
      ?auto_75273 - BLOCK
      ?auto_75271 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75267 ?auto_75268 ) ) ( not ( = ?auto_75267 ?auto_75269 ) ) ( not ( = ?auto_75267 ?auto_75270 ) ) ( not ( = ?auto_75268 ?auto_75269 ) ) ( not ( = ?auto_75268 ?auto_75270 ) ) ( not ( = ?auto_75269 ?auto_75270 ) ) ( not ( = ?auto_75267 ?auto_75272 ) ) ( not ( = ?auto_75268 ?auto_75272 ) ) ( not ( = ?auto_75269 ?auto_75272 ) ) ( not ( = ?auto_75270 ?auto_75272 ) ) ( ON-TABLE ?auto_75273 ) ( ON ?auto_75272 ?auto_75273 ) ( not ( = ?auto_75273 ?auto_75272 ) ) ( not ( = ?auto_75273 ?auto_75270 ) ) ( not ( = ?auto_75273 ?auto_75269 ) ) ( not ( = ?auto_75267 ?auto_75273 ) ) ( not ( = ?auto_75268 ?auto_75273 ) ) ( ON ?auto_75267 ?auto_75271 ) ( not ( = ?auto_75267 ?auto_75271 ) ) ( not ( = ?auto_75268 ?auto_75271 ) ) ( not ( = ?auto_75269 ?auto_75271 ) ) ( not ( = ?auto_75270 ?auto_75271 ) ) ( not ( = ?auto_75272 ?auto_75271 ) ) ( not ( = ?auto_75273 ?auto_75271 ) ) ( ON ?auto_75268 ?auto_75267 ) ( ON-TABLE ?auto_75271 ) ( ON ?auto_75269 ?auto_75268 ) ( CLEAR ?auto_75272 ) ( ON ?auto_75270 ?auto_75269 ) ( CLEAR ?auto_75270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_75271 ?auto_75267 ?auto_75268 ?auto_75269 )
      ( MAKE-4PILE ?auto_75267 ?auto_75268 ?auto_75269 ?auto_75270 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75274 - BLOCK
      ?auto_75275 - BLOCK
      ?auto_75276 - BLOCK
      ?auto_75277 - BLOCK
    )
    :vars
    (
      ?auto_75279 - BLOCK
      ?auto_75278 - BLOCK
      ?auto_75280 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75274 ?auto_75275 ) ) ( not ( = ?auto_75274 ?auto_75276 ) ) ( not ( = ?auto_75274 ?auto_75277 ) ) ( not ( = ?auto_75275 ?auto_75276 ) ) ( not ( = ?auto_75275 ?auto_75277 ) ) ( not ( = ?auto_75276 ?auto_75277 ) ) ( not ( = ?auto_75274 ?auto_75279 ) ) ( not ( = ?auto_75275 ?auto_75279 ) ) ( not ( = ?auto_75276 ?auto_75279 ) ) ( not ( = ?auto_75277 ?auto_75279 ) ) ( ON-TABLE ?auto_75278 ) ( not ( = ?auto_75278 ?auto_75279 ) ) ( not ( = ?auto_75278 ?auto_75277 ) ) ( not ( = ?auto_75278 ?auto_75276 ) ) ( not ( = ?auto_75274 ?auto_75278 ) ) ( not ( = ?auto_75275 ?auto_75278 ) ) ( ON ?auto_75274 ?auto_75280 ) ( not ( = ?auto_75274 ?auto_75280 ) ) ( not ( = ?auto_75275 ?auto_75280 ) ) ( not ( = ?auto_75276 ?auto_75280 ) ) ( not ( = ?auto_75277 ?auto_75280 ) ) ( not ( = ?auto_75279 ?auto_75280 ) ) ( not ( = ?auto_75278 ?auto_75280 ) ) ( ON ?auto_75275 ?auto_75274 ) ( ON-TABLE ?auto_75280 ) ( ON ?auto_75276 ?auto_75275 ) ( ON ?auto_75277 ?auto_75276 ) ( CLEAR ?auto_75277 ) ( HOLDING ?auto_75279 ) ( CLEAR ?auto_75278 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75278 ?auto_75279 )
      ( MAKE-4PILE ?auto_75274 ?auto_75275 ?auto_75276 ?auto_75277 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75281 - BLOCK
      ?auto_75282 - BLOCK
      ?auto_75283 - BLOCK
      ?auto_75284 - BLOCK
    )
    :vars
    (
      ?auto_75285 - BLOCK
      ?auto_75287 - BLOCK
      ?auto_75286 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75281 ?auto_75282 ) ) ( not ( = ?auto_75281 ?auto_75283 ) ) ( not ( = ?auto_75281 ?auto_75284 ) ) ( not ( = ?auto_75282 ?auto_75283 ) ) ( not ( = ?auto_75282 ?auto_75284 ) ) ( not ( = ?auto_75283 ?auto_75284 ) ) ( not ( = ?auto_75281 ?auto_75285 ) ) ( not ( = ?auto_75282 ?auto_75285 ) ) ( not ( = ?auto_75283 ?auto_75285 ) ) ( not ( = ?auto_75284 ?auto_75285 ) ) ( ON-TABLE ?auto_75287 ) ( not ( = ?auto_75287 ?auto_75285 ) ) ( not ( = ?auto_75287 ?auto_75284 ) ) ( not ( = ?auto_75287 ?auto_75283 ) ) ( not ( = ?auto_75281 ?auto_75287 ) ) ( not ( = ?auto_75282 ?auto_75287 ) ) ( ON ?auto_75281 ?auto_75286 ) ( not ( = ?auto_75281 ?auto_75286 ) ) ( not ( = ?auto_75282 ?auto_75286 ) ) ( not ( = ?auto_75283 ?auto_75286 ) ) ( not ( = ?auto_75284 ?auto_75286 ) ) ( not ( = ?auto_75285 ?auto_75286 ) ) ( not ( = ?auto_75287 ?auto_75286 ) ) ( ON ?auto_75282 ?auto_75281 ) ( ON-TABLE ?auto_75286 ) ( ON ?auto_75283 ?auto_75282 ) ( ON ?auto_75284 ?auto_75283 ) ( CLEAR ?auto_75287 ) ( ON ?auto_75285 ?auto_75284 ) ( CLEAR ?auto_75285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_75286 ?auto_75281 ?auto_75282 ?auto_75283 ?auto_75284 )
      ( MAKE-4PILE ?auto_75281 ?auto_75282 ?auto_75283 ?auto_75284 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75288 - BLOCK
      ?auto_75289 - BLOCK
      ?auto_75290 - BLOCK
      ?auto_75291 - BLOCK
    )
    :vars
    (
      ?auto_75292 - BLOCK
      ?auto_75293 - BLOCK
      ?auto_75294 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75288 ?auto_75289 ) ) ( not ( = ?auto_75288 ?auto_75290 ) ) ( not ( = ?auto_75288 ?auto_75291 ) ) ( not ( = ?auto_75289 ?auto_75290 ) ) ( not ( = ?auto_75289 ?auto_75291 ) ) ( not ( = ?auto_75290 ?auto_75291 ) ) ( not ( = ?auto_75288 ?auto_75292 ) ) ( not ( = ?auto_75289 ?auto_75292 ) ) ( not ( = ?auto_75290 ?auto_75292 ) ) ( not ( = ?auto_75291 ?auto_75292 ) ) ( not ( = ?auto_75293 ?auto_75292 ) ) ( not ( = ?auto_75293 ?auto_75291 ) ) ( not ( = ?auto_75293 ?auto_75290 ) ) ( not ( = ?auto_75288 ?auto_75293 ) ) ( not ( = ?auto_75289 ?auto_75293 ) ) ( ON ?auto_75288 ?auto_75294 ) ( not ( = ?auto_75288 ?auto_75294 ) ) ( not ( = ?auto_75289 ?auto_75294 ) ) ( not ( = ?auto_75290 ?auto_75294 ) ) ( not ( = ?auto_75291 ?auto_75294 ) ) ( not ( = ?auto_75292 ?auto_75294 ) ) ( not ( = ?auto_75293 ?auto_75294 ) ) ( ON ?auto_75289 ?auto_75288 ) ( ON-TABLE ?auto_75294 ) ( ON ?auto_75290 ?auto_75289 ) ( ON ?auto_75291 ?auto_75290 ) ( ON ?auto_75292 ?auto_75291 ) ( CLEAR ?auto_75292 ) ( HOLDING ?auto_75293 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_75293 )
      ( MAKE-4PILE ?auto_75288 ?auto_75289 ?auto_75290 ?auto_75291 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75295 - BLOCK
      ?auto_75296 - BLOCK
      ?auto_75297 - BLOCK
      ?auto_75298 - BLOCK
    )
    :vars
    (
      ?auto_75301 - BLOCK
      ?auto_75299 - BLOCK
      ?auto_75300 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75295 ?auto_75296 ) ) ( not ( = ?auto_75295 ?auto_75297 ) ) ( not ( = ?auto_75295 ?auto_75298 ) ) ( not ( = ?auto_75296 ?auto_75297 ) ) ( not ( = ?auto_75296 ?auto_75298 ) ) ( not ( = ?auto_75297 ?auto_75298 ) ) ( not ( = ?auto_75295 ?auto_75301 ) ) ( not ( = ?auto_75296 ?auto_75301 ) ) ( not ( = ?auto_75297 ?auto_75301 ) ) ( not ( = ?auto_75298 ?auto_75301 ) ) ( not ( = ?auto_75299 ?auto_75301 ) ) ( not ( = ?auto_75299 ?auto_75298 ) ) ( not ( = ?auto_75299 ?auto_75297 ) ) ( not ( = ?auto_75295 ?auto_75299 ) ) ( not ( = ?auto_75296 ?auto_75299 ) ) ( ON ?auto_75295 ?auto_75300 ) ( not ( = ?auto_75295 ?auto_75300 ) ) ( not ( = ?auto_75296 ?auto_75300 ) ) ( not ( = ?auto_75297 ?auto_75300 ) ) ( not ( = ?auto_75298 ?auto_75300 ) ) ( not ( = ?auto_75301 ?auto_75300 ) ) ( not ( = ?auto_75299 ?auto_75300 ) ) ( ON ?auto_75296 ?auto_75295 ) ( ON-TABLE ?auto_75300 ) ( ON ?auto_75297 ?auto_75296 ) ( ON ?auto_75298 ?auto_75297 ) ( ON ?auto_75301 ?auto_75298 ) ( ON ?auto_75299 ?auto_75301 ) ( CLEAR ?auto_75299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_75300 ?auto_75295 ?auto_75296 ?auto_75297 ?auto_75298 ?auto_75301 )
      ( MAKE-4PILE ?auto_75295 ?auto_75296 ?auto_75297 ?auto_75298 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_75303 - BLOCK
    )
    :vars
    (
      ?auto_75304 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75304 ?auto_75303 ) ( CLEAR ?auto_75304 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_75303 ) ( not ( = ?auto_75303 ?auto_75304 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_75304 ?auto_75303 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_75305 - BLOCK
    )
    :vars
    (
      ?auto_75306 - BLOCK
      ?auto_75307 - BLOCK
      ?auto_75308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75306 ?auto_75305 ) ( CLEAR ?auto_75306 ) ( ON-TABLE ?auto_75305 ) ( not ( = ?auto_75305 ?auto_75306 ) ) ( HOLDING ?auto_75307 ) ( CLEAR ?auto_75308 ) ( not ( = ?auto_75305 ?auto_75307 ) ) ( not ( = ?auto_75305 ?auto_75308 ) ) ( not ( = ?auto_75306 ?auto_75307 ) ) ( not ( = ?auto_75306 ?auto_75308 ) ) ( not ( = ?auto_75307 ?auto_75308 ) ) )
    :subtasks
    ( ( !STACK ?auto_75307 ?auto_75308 )
      ( MAKE-1PILE ?auto_75305 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_75309 - BLOCK
    )
    :vars
    (
      ?auto_75310 - BLOCK
      ?auto_75311 - BLOCK
      ?auto_75312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75310 ?auto_75309 ) ( ON-TABLE ?auto_75309 ) ( not ( = ?auto_75309 ?auto_75310 ) ) ( CLEAR ?auto_75311 ) ( not ( = ?auto_75309 ?auto_75312 ) ) ( not ( = ?auto_75309 ?auto_75311 ) ) ( not ( = ?auto_75310 ?auto_75312 ) ) ( not ( = ?auto_75310 ?auto_75311 ) ) ( not ( = ?auto_75312 ?auto_75311 ) ) ( ON ?auto_75312 ?auto_75310 ) ( CLEAR ?auto_75312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75309 ?auto_75310 )
      ( MAKE-1PILE ?auto_75309 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_75313 - BLOCK
    )
    :vars
    (
      ?auto_75315 - BLOCK
      ?auto_75316 - BLOCK
      ?auto_75314 - BLOCK
      ?auto_75317 - BLOCK
      ?auto_75318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75315 ?auto_75313 ) ( ON-TABLE ?auto_75313 ) ( not ( = ?auto_75313 ?auto_75315 ) ) ( not ( = ?auto_75313 ?auto_75316 ) ) ( not ( = ?auto_75313 ?auto_75314 ) ) ( not ( = ?auto_75315 ?auto_75316 ) ) ( not ( = ?auto_75315 ?auto_75314 ) ) ( not ( = ?auto_75316 ?auto_75314 ) ) ( ON ?auto_75316 ?auto_75315 ) ( CLEAR ?auto_75316 ) ( HOLDING ?auto_75314 ) ( CLEAR ?auto_75317 ) ( ON-TABLE ?auto_75318 ) ( ON ?auto_75317 ?auto_75318 ) ( not ( = ?auto_75318 ?auto_75317 ) ) ( not ( = ?auto_75318 ?auto_75314 ) ) ( not ( = ?auto_75317 ?auto_75314 ) ) ( not ( = ?auto_75313 ?auto_75317 ) ) ( not ( = ?auto_75313 ?auto_75318 ) ) ( not ( = ?auto_75315 ?auto_75317 ) ) ( not ( = ?auto_75315 ?auto_75318 ) ) ( not ( = ?auto_75316 ?auto_75317 ) ) ( not ( = ?auto_75316 ?auto_75318 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75318 ?auto_75317 ?auto_75314 )
      ( MAKE-1PILE ?auto_75313 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_75319 - BLOCK
    )
    :vars
    (
      ?auto_75321 - BLOCK
      ?auto_75320 - BLOCK
      ?auto_75322 - BLOCK
      ?auto_75323 - BLOCK
      ?auto_75324 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75321 ?auto_75319 ) ( ON-TABLE ?auto_75319 ) ( not ( = ?auto_75319 ?auto_75321 ) ) ( not ( = ?auto_75319 ?auto_75320 ) ) ( not ( = ?auto_75319 ?auto_75322 ) ) ( not ( = ?auto_75321 ?auto_75320 ) ) ( not ( = ?auto_75321 ?auto_75322 ) ) ( not ( = ?auto_75320 ?auto_75322 ) ) ( ON ?auto_75320 ?auto_75321 ) ( CLEAR ?auto_75323 ) ( ON-TABLE ?auto_75324 ) ( ON ?auto_75323 ?auto_75324 ) ( not ( = ?auto_75324 ?auto_75323 ) ) ( not ( = ?auto_75324 ?auto_75322 ) ) ( not ( = ?auto_75323 ?auto_75322 ) ) ( not ( = ?auto_75319 ?auto_75323 ) ) ( not ( = ?auto_75319 ?auto_75324 ) ) ( not ( = ?auto_75321 ?auto_75323 ) ) ( not ( = ?auto_75321 ?auto_75324 ) ) ( not ( = ?auto_75320 ?auto_75323 ) ) ( not ( = ?auto_75320 ?auto_75324 ) ) ( ON ?auto_75322 ?auto_75320 ) ( CLEAR ?auto_75322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75319 ?auto_75321 ?auto_75320 )
      ( MAKE-1PILE ?auto_75319 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_75325 - BLOCK
    )
    :vars
    (
      ?auto_75329 - BLOCK
      ?auto_75326 - BLOCK
      ?auto_75328 - BLOCK
      ?auto_75327 - BLOCK
      ?auto_75330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75329 ?auto_75325 ) ( ON-TABLE ?auto_75325 ) ( not ( = ?auto_75325 ?auto_75329 ) ) ( not ( = ?auto_75325 ?auto_75326 ) ) ( not ( = ?auto_75325 ?auto_75328 ) ) ( not ( = ?auto_75329 ?auto_75326 ) ) ( not ( = ?auto_75329 ?auto_75328 ) ) ( not ( = ?auto_75326 ?auto_75328 ) ) ( ON ?auto_75326 ?auto_75329 ) ( ON-TABLE ?auto_75327 ) ( not ( = ?auto_75327 ?auto_75330 ) ) ( not ( = ?auto_75327 ?auto_75328 ) ) ( not ( = ?auto_75330 ?auto_75328 ) ) ( not ( = ?auto_75325 ?auto_75330 ) ) ( not ( = ?auto_75325 ?auto_75327 ) ) ( not ( = ?auto_75329 ?auto_75330 ) ) ( not ( = ?auto_75329 ?auto_75327 ) ) ( not ( = ?auto_75326 ?auto_75330 ) ) ( not ( = ?auto_75326 ?auto_75327 ) ) ( ON ?auto_75328 ?auto_75326 ) ( CLEAR ?auto_75328 ) ( HOLDING ?auto_75330 ) ( CLEAR ?auto_75327 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75327 ?auto_75330 )
      ( MAKE-1PILE ?auto_75325 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_75331 - BLOCK
    )
    :vars
    (
      ?auto_75335 - BLOCK
      ?auto_75333 - BLOCK
      ?auto_75332 - BLOCK
      ?auto_75334 - BLOCK
      ?auto_75336 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75335 ?auto_75331 ) ( ON-TABLE ?auto_75331 ) ( not ( = ?auto_75331 ?auto_75335 ) ) ( not ( = ?auto_75331 ?auto_75333 ) ) ( not ( = ?auto_75331 ?auto_75332 ) ) ( not ( = ?auto_75335 ?auto_75333 ) ) ( not ( = ?auto_75335 ?auto_75332 ) ) ( not ( = ?auto_75333 ?auto_75332 ) ) ( ON ?auto_75333 ?auto_75335 ) ( ON-TABLE ?auto_75334 ) ( not ( = ?auto_75334 ?auto_75336 ) ) ( not ( = ?auto_75334 ?auto_75332 ) ) ( not ( = ?auto_75336 ?auto_75332 ) ) ( not ( = ?auto_75331 ?auto_75336 ) ) ( not ( = ?auto_75331 ?auto_75334 ) ) ( not ( = ?auto_75335 ?auto_75336 ) ) ( not ( = ?auto_75335 ?auto_75334 ) ) ( not ( = ?auto_75333 ?auto_75336 ) ) ( not ( = ?auto_75333 ?auto_75334 ) ) ( ON ?auto_75332 ?auto_75333 ) ( CLEAR ?auto_75334 ) ( ON ?auto_75336 ?auto_75332 ) ( CLEAR ?auto_75336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_75331 ?auto_75335 ?auto_75333 ?auto_75332 )
      ( MAKE-1PILE ?auto_75331 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_75337 - BLOCK
    )
    :vars
    (
      ?auto_75338 - BLOCK
      ?auto_75342 - BLOCK
      ?auto_75340 - BLOCK
      ?auto_75339 - BLOCK
      ?auto_75341 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75338 ?auto_75337 ) ( ON-TABLE ?auto_75337 ) ( not ( = ?auto_75337 ?auto_75338 ) ) ( not ( = ?auto_75337 ?auto_75342 ) ) ( not ( = ?auto_75337 ?auto_75340 ) ) ( not ( = ?auto_75338 ?auto_75342 ) ) ( not ( = ?auto_75338 ?auto_75340 ) ) ( not ( = ?auto_75342 ?auto_75340 ) ) ( ON ?auto_75342 ?auto_75338 ) ( not ( = ?auto_75339 ?auto_75341 ) ) ( not ( = ?auto_75339 ?auto_75340 ) ) ( not ( = ?auto_75341 ?auto_75340 ) ) ( not ( = ?auto_75337 ?auto_75341 ) ) ( not ( = ?auto_75337 ?auto_75339 ) ) ( not ( = ?auto_75338 ?auto_75341 ) ) ( not ( = ?auto_75338 ?auto_75339 ) ) ( not ( = ?auto_75342 ?auto_75341 ) ) ( not ( = ?auto_75342 ?auto_75339 ) ) ( ON ?auto_75340 ?auto_75342 ) ( ON ?auto_75341 ?auto_75340 ) ( CLEAR ?auto_75341 ) ( HOLDING ?auto_75339 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_75339 )
      ( MAKE-1PILE ?auto_75337 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_75343 - BLOCK
    )
    :vars
    (
      ?auto_75345 - BLOCK
      ?auto_75344 - BLOCK
      ?auto_75347 - BLOCK
      ?auto_75346 - BLOCK
      ?auto_75348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75345 ?auto_75343 ) ( ON-TABLE ?auto_75343 ) ( not ( = ?auto_75343 ?auto_75345 ) ) ( not ( = ?auto_75343 ?auto_75344 ) ) ( not ( = ?auto_75343 ?auto_75347 ) ) ( not ( = ?auto_75345 ?auto_75344 ) ) ( not ( = ?auto_75345 ?auto_75347 ) ) ( not ( = ?auto_75344 ?auto_75347 ) ) ( ON ?auto_75344 ?auto_75345 ) ( not ( = ?auto_75346 ?auto_75348 ) ) ( not ( = ?auto_75346 ?auto_75347 ) ) ( not ( = ?auto_75348 ?auto_75347 ) ) ( not ( = ?auto_75343 ?auto_75348 ) ) ( not ( = ?auto_75343 ?auto_75346 ) ) ( not ( = ?auto_75345 ?auto_75348 ) ) ( not ( = ?auto_75345 ?auto_75346 ) ) ( not ( = ?auto_75344 ?auto_75348 ) ) ( not ( = ?auto_75344 ?auto_75346 ) ) ( ON ?auto_75347 ?auto_75344 ) ( ON ?auto_75348 ?auto_75347 ) ( ON ?auto_75346 ?auto_75348 ) ( CLEAR ?auto_75346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_75343 ?auto_75345 ?auto_75344 ?auto_75347 ?auto_75348 )
      ( MAKE-1PILE ?auto_75343 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_75349 - BLOCK
    )
    :vars
    (
      ?auto_75350 - BLOCK
      ?auto_75354 - BLOCK
      ?auto_75352 - BLOCK
      ?auto_75351 - BLOCK
      ?auto_75353 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75350 ?auto_75349 ) ( ON-TABLE ?auto_75349 ) ( not ( = ?auto_75349 ?auto_75350 ) ) ( not ( = ?auto_75349 ?auto_75354 ) ) ( not ( = ?auto_75349 ?auto_75352 ) ) ( not ( = ?auto_75350 ?auto_75354 ) ) ( not ( = ?auto_75350 ?auto_75352 ) ) ( not ( = ?auto_75354 ?auto_75352 ) ) ( ON ?auto_75354 ?auto_75350 ) ( not ( = ?auto_75351 ?auto_75353 ) ) ( not ( = ?auto_75351 ?auto_75352 ) ) ( not ( = ?auto_75353 ?auto_75352 ) ) ( not ( = ?auto_75349 ?auto_75353 ) ) ( not ( = ?auto_75349 ?auto_75351 ) ) ( not ( = ?auto_75350 ?auto_75353 ) ) ( not ( = ?auto_75350 ?auto_75351 ) ) ( not ( = ?auto_75354 ?auto_75353 ) ) ( not ( = ?auto_75354 ?auto_75351 ) ) ( ON ?auto_75352 ?auto_75354 ) ( ON ?auto_75353 ?auto_75352 ) ( HOLDING ?auto_75351 ) ( CLEAR ?auto_75353 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_75349 ?auto_75350 ?auto_75354 ?auto_75352 ?auto_75353 ?auto_75351 )
      ( MAKE-1PILE ?auto_75349 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_75355 - BLOCK
    )
    :vars
    (
      ?auto_75356 - BLOCK
      ?auto_75360 - BLOCK
      ?auto_75357 - BLOCK
      ?auto_75358 - BLOCK
      ?auto_75359 - BLOCK
      ?auto_75361 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75356 ?auto_75355 ) ( ON-TABLE ?auto_75355 ) ( not ( = ?auto_75355 ?auto_75356 ) ) ( not ( = ?auto_75355 ?auto_75360 ) ) ( not ( = ?auto_75355 ?auto_75357 ) ) ( not ( = ?auto_75356 ?auto_75360 ) ) ( not ( = ?auto_75356 ?auto_75357 ) ) ( not ( = ?auto_75360 ?auto_75357 ) ) ( ON ?auto_75360 ?auto_75356 ) ( not ( = ?auto_75358 ?auto_75359 ) ) ( not ( = ?auto_75358 ?auto_75357 ) ) ( not ( = ?auto_75359 ?auto_75357 ) ) ( not ( = ?auto_75355 ?auto_75359 ) ) ( not ( = ?auto_75355 ?auto_75358 ) ) ( not ( = ?auto_75356 ?auto_75359 ) ) ( not ( = ?auto_75356 ?auto_75358 ) ) ( not ( = ?auto_75360 ?auto_75359 ) ) ( not ( = ?auto_75360 ?auto_75358 ) ) ( ON ?auto_75357 ?auto_75360 ) ( ON ?auto_75359 ?auto_75357 ) ( CLEAR ?auto_75359 ) ( ON ?auto_75358 ?auto_75361 ) ( CLEAR ?auto_75358 ) ( HAND-EMPTY ) ( not ( = ?auto_75355 ?auto_75361 ) ) ( not ( = ?auto_75356 ?auto_75361 ) ) ( not ( = ?auto_75360 ?auto_75361 ) ) ( not ( = ?auto_75357 ?auto_75361 ) ) ( not ( = ?auto_75358 ?auto_75361 ) ) ( not ( = ?auto_75359 ?auto_75361 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_75358 ?auto_75361 )
      ( MAKE-1PILE ?auto_75355 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_75362 - BLOCK
    )
    :vars
    (
      ?auto_75366 - BLOCK
      ?auto_75365 - BLOCK
      ?auto_75368 - BLOCK
      ?auto_75367 - BLOCK
      ?auto_75364 - BLOCK
      ?auto_75363 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75366 ?auto_75362 ) ( ON-TABLE ?auto_75362 ) ( not ( = ?auto_75362 ?auto_75366 ) ) ( not ( = ?auto_75362 ?auto_75365 ) ) ( not ( = ?auto_75362 ?auto_75368 ) ) ( not ( = ?auto_75366 ?auto_75365 ) ) ( not ( = ?auto_75366 ?auto_75368 ) ) ( not ( = ?auto_75365 ?auto_75368 ) ) ( ON ?auto_75365 ?auto_75366 ) ( not ( = ?auto_75367 ?auto_75364 ) ) ( not ( = ?auto_75367 ?auto_75368 ) ) ( not ( = ?auto_75364 ?auto_75368 ) ) ( not ( = ?auto_75362 ?auto_75364 ) ) ( not ( = ?auto_75362 ?auto_75367 ) ) ( not ( = ?auto_75366 ?auto_75364 ) ) ( not ( = ?auto_75366 ?auto_75367 ) ) ( not ( = ?auto_75365 ?auto_75364 ) ) ( not ( = ?auto_75365 ?auto_75367 ) ) ( ON ?auto_75368 ?auto_75365 ) ( ON ?auto_75367 ?auto_75363 ) ( CLEAR ?auto_75367 ) ( not ( = ?auto_75362 ?auto_75363 ) ) ( not ( = ?auto_75366 ?auto_75363 ) ) ( not ( = ?auto_75365 ?auto_75363 ) ) ( not ( = ?auto_75368 ?auto_75363 ) ) ( not ( = ?auto_75367 ?auto_75363 ) ) ( not ( = ?auto_75364 ?auto_75363 ) ) ( HOLDING ?auto_75364 ) ( CLEAR ?auto_75368 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_75362 ?auto_75366 ?auto_75365 ?auto_75368 ?auto_75364 )
      ( MAKE-1PILE ?auto_75362 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_75369 - BLOCK
    )
    :vars
    (
      ?auto_75371 - BLOCK
      ?auto_75372 - BLOCK
      ?auto_75375 - BLOCK
      ?auto_75373 - BLOCK
      ?auto_75370 - BLOCK
      ?auto_75374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75371 ?auto_75369 ) ( ON-TABLE ?auto_75369 ) ( not ( = ?auto_75369 ?auto_75371 ) ) ( not ( = ?auto_75369 ?auto_75372 ) ) ( not ( = ?auto_75369 ?auto_75375 ) ) ( not ( = ?auto_75371 ?auto_75372 ) ) ( not ( = ?auto_75371 ?auto_75375 ) ) ( not ( = ?auto_75372 ?auto_75375 ) ) ( ON ?auto_75372 ?auto_75371 ) ( not ( = ?auto_75373 ?auto_75370 ) ) ( not ( = ?auto_75373 ?auto_75375 ) ) ( not ( = ?auto_75370 ?auto_75375 ) ) ( not ( = ?auto_75369 ?auto_75370 ) ) ( not ( = ?auto_75369 ?auto_75373 ) ) ( not ( = ?auto_75371 ?auto_75370 ) ) ( not ( = ?auto_75371 ?auto_75373 ) ) ( not ( = ?auto_75372 ?auto_75370 ) ) ( not ( = ?auto_75372 ?auto_75373 ) ) ( ON ?auto_75375 ?auto_75372 ) ( ON ?auto_75373 ?auto_75374 ) ( not ( = ?auto_75369 ?auto_75374 ) ) ( not ( = ?auto_75371 ?auto_75374 ) ) ( not ( = ?auto_75372 ?auto_75374 ) ) ( not ( = ?auto_75375 ?auto_75374 ) ) ( not ( = ?auto_75373 ?auto_75374 ) ) ( not ( = ?auto_75370 ?auto_75374 ) ) ( CLEAR ?auto_75375 ) ( ON ?auto_75370 ?auto_75373 ) ( CLEAR ?auto_75370 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_75374 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75374 ?auto_75373 )
      ( MAKE-1PILE ?auto_75369 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_75376 - BLOCK
    )
    :vars
    (
      ?auto_75379 - BLOCK
      ?auto_75378 - BLOCK
      ?auto_75382 - BLOCK
      ?auto_75380 - BLOCK
      ?auto_75381 - BLOCK
      ?auto_75377 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75379 ?auto_75376 ) ( ON-TABLE ?auto_75376 ) ( not ( = ?auto_75376 ?auto_75379 ) ) ( not ( = ?auto_75376 ?auto_75378 ) ) ( not ( = ?auto_75376 ?auto_75382 ) ) ( not ( = ?auto_75379 ?auto_75378 ) ) ( not ( = ?auto_75379 ?auto_75382 ) ) ( not ( = ?auto_75378 ?auto_75382 ) ) ( ON ?auto_75378 ?auto_75379 ) ( not ( = ?auto_75380 ?auto_75381 ) ) ( not ( = ?auto_75380 ?auto_75382 ) ) ( not ( = ?auto_75381 ?auto_75382 ) ) ( not ( = ?auto_75376 ?auto_75381 ) ) ( not ( = ?auto_75376 ?auto_75380 ) ) ( not ( = ?auto_75379 ?auto_75381 ) ) ( not ( = ?auto_75379 ?auto_75380 ) ) ( not ( = ?auto_75378 ?auto_75381 ) ) ( not ( = ?auto_75378 ?auto_75380 ) ) ( ON ?auto_75380 ?auto_75377 ) ( not ( = ?auto_75376 ?auto_75377 ) ) ( not ( = ?auto_75379 ?auto_75377 ) ) ( not ( = ?auto_75378 ?auto_75377 ) ) ( not ( = ?auto_75382 ?auto_75377 ) ) ( not ( = ?auto_75380 ?auto_75377 ) ) ( not ( = ?auto_75381 ?auto_75377 ) ) ( ON ?auto_75381 ?auto_75380 ) ( CLEAR ?auto_75381 ) ( ON-TABLE ?auto_75377 ) ( HOLDING ?auto_75382 ) ( CLEAR ?auto_75378 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_75376 ?auto_75379 ?auto_75378 ?auto_75382 )
      ( MAKE-1PILE ?auto_75376 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_75383 - BLOCK
    )
    :vars
    (
      ?auto_75385 - BLOCK
      ?auto_75389 - BLOCK
      ?auto_75388 - BLOCK
      ?auto_75384 - BLOCK
      ?auto_75387 - BLOCK
      ?auto_75386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75385 ?auto_75383 ) ( ON-TABLE ?auto_75383 ) ( not ( = ?auto_75383 ?auto_75385 ) ) ( not ( = ?auto_75383 ?auto_75389 ) ) ( not ( = ?auto_75383 ?auto_75388 ) ) ( not ( = ?auto_75385 ?auto_75389 ) ) ( not ( = ?auto_75385 ?auto_75388 ) ) ( not ( = ?auto_75389 ?auto_75388 ) ) ( ON ?auto_75389 ?auto_75385 ) ( not ( = ?auto_75384 ?auto_75387 ) ) ( not ( = ?auto_75384 ?auto_75388 ) ) ( not ( = ?auto_75387 ?auto_75388 ) ) ( not ( = ?auto_75383 ?auto_75387 ) ) ( not ( = ?auto_75383 ?auto_75384 ) ) ( not ( = ?auto_75385 ?auto_75387 ) ) ( not ( = ?auto_75385 ?auto_75384 ) ) ( not ( = ?auto_75389 ?auto_75387 ) ) ( not ( = ?auto_75389 ?auto_75384 ) ) ( ON ?auto_75384 ?auto_75386 ) ( not ( = ?auto_75383 ?auto_75386 ) ) ( not ( = ?auto_75385 ?auto_75386 ) ) ( not ( = ?auto_75389 ?auto_75386 ) ) ( not ( = ?auto_75388 ?auto_75386 ) ) ( not ( = ?auto_75384 ?auto_75386 ) ) ( not ( = ?auto_75387 ?auto_75386 ) ) ( ON ?auto_75387 ?auto_75384 ) ( ON-TABLE ?auto_75386 ) ( CLEAR ?auto_75389 ) ( ON ?auto_75388 ?auto_75387 ) ( CLEAR ?auto_75388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75386 ?auto_75384 ?auto_75387 )
      ( MAKE-1PILE ?auto_75383 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_75390 - BLOCK
    )
    :vars
    (
      ?auto_75393 - BLOCK
      ?auto_75395 - BLOCK
      ?auto_75392 - BLOCK
      ?auto_75396 - BLOCK
      ?auto_75394 - BLOCK
      ?auto_75391 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75393 ?auto_75390 ) ( ON-TABLE ?auto_75390 ) ( not ( = ?auto_75390 ?auto_75393 ) ) ( not ( = ?auto_75390 ?auto_75395 ) ) ( not ( = ?auto_75390 ?auto_75392 ) ) ( not ( = ?auto_75393 ?auto_75395 ) ) ( not ( = ?auto_75393 ?auto_75392 ) ) ( not ( = ?auto_75395 ?auto_75392 ) ) ( not ( = ?auto_75396 ?auto_75394 ) ) ( not ( = ?auto_75396 ?auto_75392 ) ) ( not ( = ?auto_75394 ?auto_75392 ) ) ( not ( = ?auto_75390 ?auto_75394 ) ) ( not ( = ?auto_75390 ?auto_75396 ) ) ( not ( = ?auto_75393 ?auto_75394 ) ) ( not ( = ?auto_75393 ?auto_75396 ) ) ( not ( = ?auto_75395 ?auto_75394 ) ) ( not ( = ?auto_75395 ?auto_75396 ) ) ( ON ?auto_75396 ?auto_75391 ) ( not ( = ?auto_75390 ?auto_75391 ) ) ( not ( = ?auto_75393 ?auto_75391 ) ) ( not ( = ?auto_75395 ?auto_75391 ) ) ( not ( = ?auto_75392 ?auto_75391 ) ) ( not ( = ?auto_75396 ?auto_75391 ) ) ( not ( = ?auto_75394 ?auto_75391 ) ) ( ON ?auto_75394 ?auto_75396 ) ( ON-TABLE ?auto_75391 ) ( ON ?auto_75392 ?auto_75394 ) ( CLEAR ?auto_75392 ) ( HOLDING ?auto_75395 ) ( CLEAR ?auto_75393 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75390 ?auto_75393 ?auto_75395 )
      ( MAKE-1PILE ?auto_75390 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_75397 - BLOCK
    )
    :vars
    (
      ?auto_75400 - BLOCK
      ?auto_75402 - BLOCK
      ?auto_75399 - BLOCK
      ?auto_75398 - BLOCK
      ?auto_75401 - BLOCK
      ?auto_75403 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75400 ?auto_75397 ) ( ON-TABLE ?auto_75397 ) ( not ( = ?auto_75397 ?auto_75400 ) ) ( not ( = ?auto_75397 ?auto_75402 ) ) ( not ( = ?auto_75397 ?auto_75399 ) ) ( not ( = ?auto_75400 ?auto_75402 ) ) ( not ( = ?auto_75400 ?auto_75399 ) ) ( not ( = ?auto_75402 ?auto_75399 ) ) ( not ( = ?auto_75398 ?auto_75401 ) ) ( not ( = ?auto_75398 ?auto_75399 ) ) ( not ( = ?auto_75401 ?auto_75399 ) ) ( not ( = ?auto_75397 ?auto_75401 ) ) ( not ( = ?auto_75397 ?auto_75398 ) ) ( not ( = ?auto_75400 ?auto_75401 ) ) ( not ( = ?auto_75400 ?auto_75398 ) ) ( not ( = ?auto_75402 ?auto_75401 ) ) ( not ( = ?auto_75402 ?auto_75398 ) ) ( ON ?auto_75398 ?auto_75403 ) ( not ( = ?auto_75397 ?auto_75403 ) ) ( not ( = ?auto_75400 ?auto_75403 ) ) ( not ( = ?auto_75402 ?auto_75403 ) ) ( not ( = ?auto_75399 ?auto_75403 ) ) ( not ( = ?auto_75398 ?auto_75403 ) ) ( not ( = ?auto_75401 ?auto_75403 ) ) ( ON ?auto_75401 ?auto_75398 ) ( ON-TABLE ?auto_75403 ) ( ON ?auto_75399 ?auto_75401 ) ( CLEAR ?auto_75400 ) ( ON ?auto_75402 ?auto_75399 ) ( CLEAR ?auto_75402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_75403 ?auto_75398 ?auto_75401 ?auto_75399 )
      ( MAKE-1PILE ?auto_75397 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_75418 - BLOCK
    )
    :vars
    (
      ?auto_75423 - BLOCK
      ?auto_75419 - BLOCK
      ?auto_75422 - BLOCK
      ?auto_75424 - BLOCK
      ?auto_75420 - BLOCK
      ?auto_75421 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75418 ?auto_75423 ) ) ( not ( = ?auto_75418 ?auto_75419 ) ) ( not ( = ?auto_75418 ?auto_75422 ) ) ( not ( = ?auto_75423 ?auto_75419 ) ) ( not ( = ?auto_75423 ?auto_75422 ) ) ( not ( = ?auto_75419 ?auto_75422 ) ) ( not ( = ?auto_75424 ?auto_75420 ) ) ( not ( = ?auto_75424 ?auto_75422 ) ) ( not ( = ?auto_75420 ?auto_75422 ) ) ( not ( = ?auto_75418 ?auto_75420 ) ) ( not ( = ?auto_75418 ?auto_75424 ) ) ( not ( = ?auto_75423 ?auto_75420 ) ) ( not ( = ?auto_75423 ?auto_75424 ) ) ( not ( = ?auto_75419 ?auto_75420 ) ) ( not ( = ?auto_75419 ?auto_75424 ) ) ( ON ?auto_75424 ?auto_75421 ) ( not ( = ?auto_75418 ?auto_75421 ) ) ( not ( = ?auto_75423 ?auto_75421 ) ) ( not ( = ?auto_75419 ?auto_75421 ) ) ( not ( = ?auto_75422 ?auto_75421 ) ) ( not ( = ?auto_75424 ?auto_75421 ) ) ( not ( = ?auto_75420 ?auto_75421 ) ) ( ON ?auto_75420 ?auto_75424 ) ( ON-TABLE ?auto_75421 ) ( ON ?auto_75422 ?auto_75420 ) ( ON ?auto_75419 ?auto_75422 ) ( ON ?auto_75423 ?auto_75419 ) ( CLEAR ?auto_75423 ) ( HOLDING ?auto_75418 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75418 ?auto_75423 )
      ( MAKE-1PILE ?auto_75418 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_75425 - BLOCK
    )
    :vars
    (
      ?auto_75427 - BLOCK
      ?auto_75429 - BLOCK
      ?auto_75428 - BLOCK
      ?auto_75426 - BLOCK
      ?auto_75430 - BLOCK
      ?auto_75431 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75425 ?auto_75427 ) ) ( not ( = ?auto_75425 ?auto_75429 ) ) ( not ( = ?auto_75425 ?auto_75428 ) ) ( not ( = ?auto_75427 ?auto_75429 ) ) ( not ( = ?auto_75427 ?auto_75428 ) ) ( not ( = ?auto_75429 ?auto_75428 ) ) ( not ( = ?auto_75426 ?auto_75430 ) ) ( not ( = ?auto_75426 ?auto_75428 ) ) ( not ( = ?auto_75430 ?auto_75428 ) ) ( not ( = ?auto_75425 ?auto_75430 ) ) ( not ( = ?auto_75425 ?auto_75426 ) ) ( not ( = ?auto_75427 ?auto_75430 ) ) ( not ( = ?auto_75427 ?auto_75426 ) ) ( not ( = ?auto_75429 ?auto_75430 ) ) ( not ( = ?auto_75429 ?auto_75426 ) ) ( ON ?auto_75426 ?auto_75431 ) ( not ( = ?auto_75425 ?auto_75431 ) ) ( not ( = ?auto_75427 ?auto_75431 ) ) ( not ( = ?auto_75429 ?auto_75431 ) ) ( not ( = ?auto_75428 ?auto_75431 ) ) ( not ( = ?auto_75426 ?auto_75431 ) ) ( not ( = ?auto_75430 ?auto_75431 ) ) ( ON ?auto_75430 ?auto_75426 ) ( ON-TABLE ?auto_75431 ) ( ON ?auto_75428 ?auto_75430 ) ( ON ?auto_75429 ?auto_75428 ) ( ON ?auto_75427 ?auto_75429 ) ( ON ?auto_75425 ?auto_75427 ) ( CLEAR ?auto_75425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_75431 ?auto_75426 ?auto_75430 ?auto_75428 ?auto_75429 ?auto_75427 )
      ( MAKE-1PILE ?auto_75425 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75437 - BLOCK
      ?auto_75438 - BLOCK
      ?auto_75439 - BLOCK
      ?auto_75440 - BLOCK
      ?auto_75441 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_75441 ) ( CLEAR ?auto_75440 ) ( ON-TABLE ?auto_75437 ) ( ON ?auto_75438 ?auto_75437 ) ( ON ?auto_75439 ?auto_75438 ) ( ON ?auto_75440 ?auto_75439 ) ( not ( = ?auto_75437 ?auto_75438 ) ) ( not ( = ?auto_75437 ?auto_75439 ) ) ( not ( = ?auto_75437 ?auto_75440 ) ) ( not ( = ?auto_75437 ?auto_75441 ) ) ( not ( = ?auto_75438 ?auto_75439 ) ) ( not ( = ?auto_75438 ?auto_75440 ) ) ( not ( = ?auto_75438 ?auto_75441 ) ) ( not ( = ?auto_75439 ?auto_75440 ) ) ( not ( = ?auto_75439 ?auto_75441 ) ) ( not ( = ?auto_75440 ?auto_75441 ) ) )
    :subtasks
    ( ( !STACK ?auto_75441 ?auto_75440 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75442 - BLOCK
      ?auto_75443 - BLOCK
      ?auto_75444 - BLOCK
      ?auto_75445 - BLOCK
      ?auto_75446 - BLOCK
    )
    :vars
    (
      ?auto_75447 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_75445 ) ( ON-TABLE ?auto_75442 ) ( ON ?auto_75443 ?auto_75442 ) ( ON ?auto_75444 ?auto_75443 ) ( ON ?auto_75445 ?auto_75444 ) ( not ( = ?auto_75442 ?auto_75443 ) ) ( not ( = ?auto_75442 ?auto_75444 ) ) ( not ( = ?auto_75442 ?auto_75445 ) ) ( not ( = ?auto_75442 ?auto_75446 ) ) ( not ( = ?auto_75443 ?auto_75444 ) ) ( not ( = ?auto_75443 ?auto_75445 ) ) ( not ( = ?auto_75443 ?auto_75446 ) ) ( not ( = ?auto_75444 ?auto_75445 ) ) ( not ( = ?auto_75444 ?auto_75446 ) ) ( not ( = ?auto_75445 ?auto_75446 ) ) ( ON ?auto_75446 ?auto_75447 ) ( CLEAR ?auto_75446 ) ( HAND-EMPTY ) ( not ( = ?auto_75442 ?auto_75447 ) ) ( not ( = ?auto_75443 ?auto_75447 ) ) ( not ( = ?auto_75444 ?auto_75447 ) ) ( not ( = ?auto_75445 ?auto_75447 ) ) ( not ( = ?auto_75446 ?auto_75447 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_75446 ?auto_75447 )
      ( MAKE-5PILE ?auto_75442 ?auto_75443 ?auto_75444 ?auto_75445 ?auto_75446 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75448 - BLOCK
      ?auto_75449 - BLOCK
      ?auto_75450 - BLOCK
      ?auto_75451 - BLOCK
      ?auto_75452 - BLOCK
    )
    :vars
    (
      ?auto_75453 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_75448 ) ( ON ?auto_75449 ?auto_75448 ) ( ON ?auto_75450 ?auto_75449 ) ( not ( = ?auto_75448 ?auto_75449 ) ) ( not ( = ?auto_75448 ?auto_75450 ) ) ( not ( = ?auto_75448 ?auto_75451 ) ) ( not ( = ?auto_75448 ?auto_75452 ) ) ( not ( = ?auto_75449 ?auto_75450 ) ) ( not ( = ?auto_75449 ?auto_75451 ) ) ( not ( = ?auto_75449 ?auto_75452 ) ) ( not ( = ?auto_75450 ?auto_75451 ) ) ( not ( = ?auto_75450 ?auto_75452 ) ) ( not ( = ?auto_75451 ?auto_75452 ) ) ( ON ?auto_75452 ?auto_75453 ) ( CLEAR ?auto_75452 ) ( not ( = ?auto_75448 ?auto_75453 ) ) ( not ( = ?auto_75449 ?auto_75453 ) ) ( not ( = ?auto_75450 ?auto_75453 ) ) ( not ( = ?auto_75451 ?auto_75453 ) ) ( not ( = ?auto_75452 ?auto_75453 ) ) ( HOLDING ?auto_75451 ) ( CLEAR ?auto_75450 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_75448 ?auto_75449 ?auto_75450 ?auto_75451 )
      ( MAKE-5PILE ?auto_75448 ?auto_75449 ?auto_75450 ?auto_75451 ?auto_75452 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75454 - BLOCK
      ?auto_75455 - BLOCK
      ?auto_75456 - BLOCK
      ?auto_75457 - BLOCK
      ?auto_75458 - BLOCK
    )
    :vars
    (
      ?auto_75459 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_75454 ) ( ON ?auto_75455 ?auto_75454 ) ( ON ?auto_75456 ?auto_75455 ) ( not ( = ?auto_75454 ?auto_75455 ) ) ( not ( = ?auto_75454 ?auto_75456 ) ) ( not ( = ?auto_75454 ?auto_75457 ) ) ( not ( = ?auto_75454 ?auto_75458 ) ) ( not ( = ?auto_75455 ?auto_75456 ) ) ( not ( = ?auto_75455 ?auto_75457 ) ) ( not ( = ?auto_75455 ?auto_75458 ) ) ( not ( = ?auto_75456 ?auto_75457 ) ) ( not ( = ?auto_75456 ?auto_75458 ) ) ( not ( = ?auto_75457 ?auto_75458 ) ) ( ON ?auto_75458 ?auto_75459 ) ( not ( = ?auto_75454 ?auto_75459 ) ) ( not ( = ?auto_75455 ?auto_75459 ) ) ( not ( = ?auto_75456 ?auto_75459 ) ) ( not ( = ?auto_75457 ?auto_75459 ) ) ( not ( = ?auto_75458 ?auto_75459 ) ) ( CLEAR ?auto_75456 ) ( ON ?auto_75457 ?auto_75458 ) ( CLEAR ?auto_75457 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_75459 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75459 ?auto_75458 )
      ( MAKE-5PILE ?auto_75454 ?auto_75455 ?auto_75456 ?auto_75457 ?auto_75458 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75460 - BLOCK
      ?auto_75461 - BLOCK
      ?auto_75462 - BLOCK
      ?auto_75463 - BLOCK
      ?auto_75464 - BLOCK
    )
    :vars
    (
      ?auto_75465 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_75460 ) ( ON ?auto_75461 ?auto_75460 ) ( not ( = ?auto_75460 ?auto_75461 ) ) ( not ( = ?auto_75460 ?auto_75462 ) ) ( not ( = ?auto_75460 ?auto_75463 ) ) ( not ( = ?auto_75460 ?auto_75464 ) ) ( not ( = ?auto_75461 ?auto_75462 ) ) ( not ( = ?auto_75461 ?auto_75463 ) ) ( not ( = ?auto_75461 ?auto_75464 ) ) ( not ( = ?auto_75462 ?auto_75463 ) ) ( not ( = ?auto_75462 ?auto_75464 ) ) ( not ( = ?auto_75463 ?auto_75464 ) ) ( ON ?auto_75464 ?auto_75465 ) ( not ( = ?auto_75460 ?auto_75465 ) ) ( not ( = ?auto_75461 ?auto_75465 ) ) ( not ( = ?auto_75462 ?auto_75465 ) ) ( not ( = ?auto_75463 ?auto_75465 ) ) ( not ( = ?auto_75464 ?auto_75465 ) ) ( ON ?auto_75463 ?auto_75464 ) ( CLEAR ?auto_75463 ) ( ON-TABLE ?auto_75465 ) ( HOLDING ?auto_75462 ) ( CLEAR ?auto_75461 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75460 ?auto_75461 ?auto_75462 )
      ( MAKE-5PILE ?auto_75460 ?auto_75461 ?auto_75462 ?auto_75463 ?auto_75464 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75466 - BLOCK
      ?auto_75467 - BLOCK
      ?auto_75468 - BLOCK
      ?auto_75469 - BLOCK
      ?auto_75470 - BLOCK
    )
    :vars
    (
      ?auto_75471 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_75466 ) ( ON ?auto_75467 ?auto_75466 ) ( not ( = ?auto_75466 ?auto_75467 ) ) ( not ( = ?auto_75466 ?auto_75468 ) ) ( not ( = ?auto_75466 ?auto_75469 ) ) ( not ( = ?auto_75466 ?auto_75470 ) ) ( not ( = ?auto_75467 ?auto_75468 ) ) ( not ( = ?auto_75467 ?auto_75469 ) ) ( not ( = ?auto_75467 ?auto_75470 ) ) ( not ( = ?auto_75468 ?auto_75469 ) ) ( not ( = ?auto_75468 ?auto_75470 ) ) ( not ( = ?auto_75469 ?auto_75470 ) ) ( ON ?auto_75470 ?auto_75471 ) ( not ( = ?auto_75466 ?auto_75471 ) ) ( not ( = ?auto_75467 ?auto_75471 ) ) ( not ( = ?auto_75468 ?auto_75471 ) ) ( not ( = ?auto_75469 ?auto_75471 ) ) ( not ( = ?auto_75470 ?auto_75471 ) ) ( ON ?auto_75469 ?auto_75470 ) ( ON-TABLE ?auto_75471 ) ( CLEAR ?auto_75467 ) ( ON ?auto_75468 ?auto_75469 ) ( CLEAR ?auto_75468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75471 ?auto_75470 ?auto_75469 )
      ( MAKE-5PILE ?auto_75466 ?auto_75467 ?auto_75468 ?auto_75469 ?auto_75470 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75472 - BLOCK
      ?auto_75473 - BLOCK
      ?auto_75474 - BLOCK
      ?auto_75475 - BLOCK
      ?auto_75476 - BLOCK
    )
    :vars
    (
      ?auto_75477 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_75472 ) ( not ( = ?auto_75472 ?auto_75473 ) ) ( not ( = ?auto_75472 ?auto_75474 ) ) ( not ( = ?auto_75472 ?auto_75475 ) ) ( not ( = ?auto_75472 ?auto_75476 ) ) ( not ( = ?auto_75473 ?auto_75474 ) ) ( not ( = ?auto_75473 ?auto_75475 ) ) ( not ( = ?auto_75473 ?auto_75476 ) ) ( not ( = ?auto_75474 ?auto_75475 ) ) ( not ( = ?auto_75474 ?auto_75476 ) ) ( not ( = ?auto_75475 ?auto_75476 ) ) ( ON ?auto_75476 ?auto_75477 ) ( not ( = ?auto_75472 ?auto_75477 ) ) ( not ( = ?auto_75473 ?auto_75477 ) ) ( not ( = ?auto_75474 ?auto_75477 ) ) ( not ( = ?auto_75475 ?auto_75477 ) ) ( not ( = ?auto_75476 ?auto_75477 ) ) ( ON ?auto_75475 ?auto_75476 ) ( ON-TABLE ?auto_75477 ) ( ON ?auto_75474 ?auto_75475 ) ( CLEAR ?auto_75474 ) ( HOLDING ?auto_75473 ) ( CLEAR ?auto_75472 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75472 ?auto_75473 )
      ( MAKE-5PILE ?auto_75472 ?auto_75473 ?auto_75474 ?auto_75475 ?auto_75476 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75478 - BLOCK
      ?auto_75479 - BLOCK
      ?auto_75480 - BLOCK
      ?auto_75481 - BLOCK
      ?auto_75482 - BLOCK
    )
    :vars
    (
      ?auto_75483 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_75478 ) ( not ( = ?auto_75478 ?auto_75479 ) ) ( not ( = ?auto_75478 ?auto_75480 ) ) ( not ( = ?auto_75478 ?auto_75481 ) ) ( not ( = ?auto_75478 ?auto_75482 ) ) ( not ( = ?auto_75479 ?auto_75480 ) ) ( not ( = ?auto_75479 ?auto_75481 ) ) ( not ( = ?auto_75479 ?auto_75482 ) ) ( not ( = ?auto_75480 ?auto_75481 ) ) ( not ( = ?auto_75480 ?auto_75482 ) ) ( not ( = ?auto_75481 ?auto_75482 ) ) ( ON ?auto_75482 ?auto_75483 ) ( not ( = ?auto_75478 ?auto_75483 ) ) ( not ( = ?auto_75479 ?auto_75483 ) ) ( not ( = ?auto_75480 ?auto_75483 ) ) ( not ( = ?auto_75481 ?auto_75483 ) ) ( not ( = ?auto_75482 ?auto_75483 ) ) ( ON ?auto_75481 ?auto_75482 ) ( ON-TABLE ?auto_75483 ) ( ON ?auto_75480 ?auto_75481 ) ( CLEAR ?auto_75478 ) ( ON ?auto_75479 ?auto_75480 ) ( CLEAR ?auto_75479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_75483 ?auto_75482 ?auto_75481 ?auto_75480 )
      ( MAKE-5PILE ?auto_75478 ?auto_75479 ?auto_75480 ?auto_75481 ?auto_75482 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75484 - BLOCK
      ?auto_75485 - BLOCK
      ?auto_75486 - BLOCK
      ?auto_75487 - BLOCK
      ?auto_75488 - BLOCK
    )
    :vars
    (
      ?auto_75489 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75484 ?auto_75485 ) ) ( not ( = ?auto_75484 ?auto_75486 ) ) ( not ( = ?auto_75484 ?auto_75487 ) ) ( not ( = ?auto_75484 ?auto_75488 ) ) ( not ( = ?auto_75485 ?auto_75486 ) ) ( not ( = ?auto_75485 ?auto_75487 ) ) ( not ( = ?auto_75485 ?auto_75488 ) ) ( not ( = ?auto_75486 ?auto_75487 ) ) ( not ( = ?auto_75486 ?auto_75488 ) ) ( not ( = ?auto_75487 ?auto_75488 ) ) ( ON ?auto_75488 ?auto_75489 ) ( not ( = ?auto_75484 ?auto_75489 ) ) ( not ( = ?auto_75485 ?auto_75489 ) ) ( not ( = ?auto_75486 ?auto_75489 ) ) ( not ( = ?auto_75487 ?auto_75489 ) ) ( not ( = ?auto_75488 ?auto_75489 ) ) ( ON ?auto_75487 ?auto_75488 ) ( ON-TABLE ?auto_75489 ) ( ON ?auto_75486 ?auto_75487 ) ( ON ?auto_75485 ?auto_75486 ) ( CLEAR ?auto_75485 ) ( HOLDING ?auto_75484 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_75484 )
      ( MAKE-5PILE ?auto_75484 ?auto_75485 ?auto_75486 ?auto_75487 ?auto_75488 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75490 - BLOCK
      ?auto_75491 - BLOCK
      ?auto_75492 - BLOCK
      ?auto_75493 - BLOCK
      ?auto_75494 - BLOCK
    )
    :vars
    (
      ?auto_75495 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75490 ?auto_75491 ) ) ( not ( = ?auto_75490 ?auto_75492 ) ) ( not ( = ?auto_75490 ?auto_75493 ) ) ( not ( = ?auto_75490 ?auto_75494 ) ) ( not ( = ?auto_75491 ?auto_75492 ) ) ( not ( = ?auto_75491 ?auto_75493 ) ) ( not ( = ?auto_75491 ?auto_75494 ) ) ( not ( = ?auto_75492 ?auto_75493 ) ) ( not ( = ?auto_75492 ?auto_75494 ) ) ( not ( = ?auto_75493 ?auto_75494 ) ) ( ON ?auto_75494 ?auto_75495 ) ( not ( = ?auto_75490 ?auto_75495 ) ) ( not ( = ?auto_75491 ?auto_75495 ) ) ( not ( = ?auto_75492 ?auto_75495 ) ) ( not ( = ?auto_75493 ?auto_75495 ) ) ( not ( = ?auto_75494 ?auto_75495 ) ) ( ON ?auto_75493 ?auto_75494 ) ( ON-TABLE ?auto_75495 ) ( ON ?auto_75492 ?auto_75493 ) ( ON ?auto_75491 ?auto_75492 ) ( ON ?auto_75490 ?auto_75491 ) ( CLEAR ?auto_75490 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_75495 ?auto_75494 ?auto_75493 ?auto_75492 ?auto_75491 )
      ( MAKE-5PILE ?auto_75490 ?auto_75491 ?auto_75492 ?auto_75493 ?auto_75494 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75496 - BLOCK
      ?auto_75497 - BLOCK
      ?auto_75498 - BLOCK
      ?auto_75499 - BLOCK
      ?auto_75500 - BLOCK
    )
    :vars
    (
      ?auto_75501 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75496 ?auto_75497 ) ) ( not ( = ?auto_75496 ?auto_75498 ) ) ( not ( = ?auto_75496 ?auto_75499 ) ) ( not ( = ?auto_75496 ?auto_75500 ) ) ( not ( = ?auto_75497 ?auto_75498 ) ) ( not ( = ?auto_75497 ?auto_75499 ) ) ( not ( = ?auto_75497 ?auto_75500 ) ) ( not ( = ?auto_75498 ?auto_75499 ) ) ( not ( = ?auto_75498 ?auto_75500 ) ) ( not ( = ?auto_75499 ?auto_75500 ) ) ( ON ?auto_75500 ?auto_75501 ) ( not ( = ?auto_75496 ?auto_75501 ) ) ( not ( = ?auto_75497 ?auto_75501 ) ) ( not ( = ?auto_75498 ?auto_75501 ) ) ( not ( = ?auto_75499 ?auto_75501 ) ) ( not ( = ?auto_75500 ?auto_75501 ) ) ( ON ?auto_75499 ?auto_75500 ) ( ON-TABLE ?auto_75501 ) ( ON ?auto_75498 ?auto_75499 ) ( ON ?auto_75497 ?auto_75498 ) ( HOLDING ?auto_75496 ) ( CLEAR ?auto_75497 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_75501 ?auto_75500 ?auto_75499 ?auto_75498 ?auto_75497 ?auto_75496 )
      ( MAKE-5PILE ?auto_75496 ?auto_75497 ?auto_75498 ?auto_75499 ?auto_75500 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75502 - BLOCK
      ?auto_75503 - BLOCK
      ?auto_75504 - BLOCK
      ?auto_75505 - BLOCK
      ?auto_75506 - BLOCK
    )
    :vars
    (
      ?auto_75507 - BLOCK
      ?auto_75508 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75502 ?auto_75503 ) ) ( not ( = ?auto_75502 ?auto_75504 ) ) ( not ( = ?auto_75502 ?auto_75505 ) ) ( not ( = ?auto_75502 ?auto_75506 ) ) ( not ( = ?auto_75503 ?auto_75504 ) ) ( not ( = ?auto_75503 ?auto_75505 ) ) ( not ( = ?auto_75503 ?auto_75506 ) ) ( not ( = ?auto_75504 ?auto_75505 ) ) ( not ( = ?auto_75504 ?auto_75506 ) ) ( not ( = ?auto_75505 ?auto_75506 ) ) ( ON ?auto_75506 ?auto_75507 ) ( not ( = ?auto_75502 ?auto_75507 ) ) ( not ( = ?auto_75503 ?auto_75507 ) ) ( not ( = ?auto_75504 ?auto_75507 ) ) ( not ( = ?auto_75505 ?auto_75507 ) ) ( not ( = ?auto_75506 ?auto_75507 ) ) ( ON ?auto_75505 ?auto_75506 ) ( ON-TABLE ?auto_75507 ) ( ON ?auto_75504 ?auto_75505 ) ( ON ?auto_75503 ?auto_75504 ) ( CLEAR ?auto_75503 ) ( ON ?auto_75502 ?auto_75508 ) ( CLEAR ?auto_75502 ) ( HAND-EMPTY ) ( not ( = ?auto_75502 ?auto_75508 ) ) ( not ( = ?auto_75503 ?auto_75508 ) ) ( not ( = ?auto_75504 ?auto_75508 ) ) ( not ( = ?auto_75505 ?auto_75508 ) ) ( not ( = ?auto_75506 ?auto_75508 ) ) ( not ( = ?auto_75507 ?auto_75508 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_75502 ?auto_75508 )
      ( MAKE-5PILE ?auto_75502 ?auto_75503 ?auto_75504 ?auto_75505 ?auto_75506 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75509 - BLOCK
      ?auto_75510 - BLOCK
      ?auto_75511 - BLOCK
      ?auto_75512 - BLOCK
      ?auto_75513 - BLOCK
    )
    :vars
    (
      ?auto_75515 - BLOCK
      ?auto_75514 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75509 ?auto_75510 ) ) ( not ( = ?auto_75509 ?auto_75511 ) ) ( not ( = ?auto_75509 ?auto_75512 ) ) ( not ( = ?auto_75509 ?auto_75513 ) ) ( not ( = ?auto_75510 ?auto_75511 ) ) ( not ( = ?auto_75510 ?auto_75512 ) ) ( not ( = ?auto_75510 ?auto_75513 ) ) ( not ( = ?auto_75511 ?auto_75512 ) ) ( not ( = ?auto_75511 ?auto_75513 ) ) ( not ( = ?auto_75512 ?auto_75513 ) ) ( ON ?auto_75513 ?auto_75515 ) ( not ( = ?auto_75509 ?auto_75515 ) ) ( not ( = ?auto_75510 ?auto_75515 ) ) ( not ( = ?auto_75511 ?auto_75515 ) ) ( not ( = ?auto_75512 ?auto_75515 ) ) ( not ( = ?auto_75513 ?auto_75515 ) ) ( ON ?auto_75512 ?auto_75513 ) ( ON-TABLE ?auto_75515 ) ( ON ?auto_75511 ?auto_75512 ) ( ON ?auto_75509 ?auto_75514 ) ( CLEAR ?auto_75509 ) ( not ( = ?auto_75509 ?auto_75514 ) ) ( not ( = ?auto_75510 ?auto_75514 ) ) ( not ( = ?auto_75511 ?auto_75514 ) ) ( not ( = ?auto_75512 ?auto_75514 ) ) ( not ( = ?auto_75513 ?auto_75514 ) ) ( not ( = ?auto_75515 ?auto_75514 ) ) ( HOLDING ?auto_75510 ) ( CLEAR ?auto_75511 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_75515 ?auto_75513 ?auto_75512 ?auto_75511 ?auto_75510 )
      ( MAKE-5PILE ?auto_75509 ?auto_75510 ?auto_75511 ?auto_75512 ?auto_75513 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75516 - BLOCK
      ?auto_75517 - BLOCK
      ?auto_75518 - BLOCK
      ?auto_75519 - BLOCK
      ?auto_75520 - BLOCK
    )
    :vars
    (
      ?auto_75521 - BLOCK
      ?auto_75522 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75516 ?auto_75517 ) ) ( not ( = ?auto_75516 ?auto_75518 ) ) ( not ( = ?auto_75516 ?auto_75519 ) ) ( not ( = ?auto_75516 ?auto_75520 ) ) ( not ( = ?auto_75517 ?auto_75518 ) ) ( not ( = ?auto_75517 ?auto_75519 ) ) ( not ( = ?auto_75517 ?auto_75520 ) ) ( not ( = ?auto_75518 ?auto_75519 ) ) ( not ( = ?auto_75518 ?auto_75520 ) ) ( not ( = ?auto_75519 ?auto_75520 ) ) ( ON ?auto_75520 ?auto_75521 ) ( not ( = ?auto_75516 ?auto_75521 ) ) ( not ( = ?auto_75517 ?auto_75521 ) ) ( not ( = ?auto_75518 ?auto_75521 ) ) ( not ( = ?auto_75519 ?auto_75521 ) ) ( not ( = ?auto_75520 ?auto_75521 ) ) ( ON ?auto_75519 ?auto_75520 ) ( ON-TABLE ?auto_75521 ) ( ON ?auto_75518 ?auto_75519 ) ( ON ?auto_75516 ?auto_75522 ) ( not ( = ?auto_75516 ?auto_75522 ) ) ( not ( = ?auto_75517 ?auto_75522 ) ) ( not ( = ?auto_75518 ?auto_75522 ) ) ( not ( = ?auto_75519 ?auto_75522 ) ) ( not ( = ?auto_75520 ?auto_75522 ) ) ( not ( = ?auto_75521 ?auto_75522 ) ) ( CLEAR ?auto_75518 ) ( ON ?auto_75517 ?auto_75516 ) ( CLEAR ?auto_75517 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_75522 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75522 ?auto_75516 )
      ( MAKE-5PILE ?auto_75516 ?auto_75517 ?auto_75518 ?auto_75519 ?auto_75520 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75523 - BLOCK
      ?auto_75524 - BLOCK
      ?auto_75525 - BLOCK
      ?auto_75526 - BLOCK
      ?auto_75527 - BLOCK
    )
    :vars
    (
      ?auto_75528 - BLOCK
      ?auto_75529 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75523 ?auto_75524 ) ) ( not ( = ?auto_75523 ?auto_75525 ) ) ( not ( = ?auto_75523 ?auto_75526 ) ) ( not ( = ?auto_75523 ?auto_75527 ) ) ( not ( = ?auto_75524 ?auto_75525 ) ) ( not ( = ?auto_75524 ?auto_75526 ) ) ( not ( = ?auto_75524 ?auto_75527 ) ) ( not ( = ?auto_75525 ?auto_75526 ) ) ( not ( = ?auto_75525 ?auto_75527 ) ) ( not ( = ?auto_75526 ?auto_75527 ) ) ( ON ?auto_75527 ?auto_75528 ) ( not ( = ?auto_75523 ?auto_75528 ) ) ( not ( = ?auto_75524 ?auto_75528 ) ) ( not ( = ?auto_75525 ?auto_75528 ) ) ( not ( = ?auto_75526 ?auto_75528 ) ) ( not ( = ?auto_75527 ?auto_75528 ) ) ( ON ?auto_75526 ?auto_75527 ) ( ON-TABLE ?auto_75528 ) ( ON ?auto_75523 ?auto_75529 ) ( not ( = ?auto_75523 ?auto_75529 ) ) ( not ( = ?auto_75524 ?auto_75529 ) ) ( not ( = ?auto_75525 ?auto_75529 ) ) ( not ( = ?auto_75526 ?auto_75529 ) ) ( not ( = ?auto_75527 ?auto_75529 ) ) ( not ( = ?auto_75528 ?auto_75529 ) ) ( ON ?auto_75524 ?auto_75523 ) ( CLEAR ?auto_75524 ) ( ON-TABLE ?auto_75529 ) ( HOLDING ?auto_75525 ) ( CLEAR ?auto_75526 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_75528 ?auto_75527 ?auto_75526 ?auto_75525 )
      ( MAKE-5PILE ?auto_75523 ?auto_75524 ?auto_75525 ?auto_75526 ?auto_75527 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75530 - BLOCK
      ?auto_75531 - BLOCK
      ?auto_75532 - BLOCK
      ?auto_75533 - BLOCK
      ?auto_75534 - BLOCK
    )
    :vars
    (
      ?auto_75535 - BLOCK
      ?auto_75536 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75530 ?auto_75531 ) ) ( not ( = ?auto_75530 ?auto_75532 ) ) ( not ( = ?auto_75530 ?auto_75533 ) ) ( not ( = ?auto_75530 ?auto_75534 ) ) ( not ( = ?auto_75531 ?auto_75532 ) ) ( not ( = ?auto_75531 ?auto_75533 ) ) ( not ( = ?auto_75531 ?auto_75534 ) ) ( not ( = ?auto_75532 ?auto_75533 ) ) ( not ( = ?auto_75532 ?auto_75534 ) ) ( not ( = ?auto_75533 ?auto_75534 ) ) ( ON ?auto_75534 ?auto_75535 ) ( not ( = ?auto_75530 ?auto_75535 ) ) ( not ( = ?auto_75531 ?auto_75535 ) ) ( not ( = ?auto_75532 ?auto_75535 ) ) ( not ( = ?auto_75533 ?auto_75535 ) ) ( not ( = ?auto_75534 ?auto_75535 ) ) ( ON ?auto_75533 ?auto_75534 ) ( ON-TABLE ?auto_75535 ) ( ON ?auto_75530 ?auto_75536 ) ( not ( = ?auto_75530 ?auto_75536 ) ) ( not ( = ?auto_75531 ?auto_75536 ) ) ( not ( = ?auto_75532 ?auto_75536 ) ) ( not ( = ?auto_75533 ?auto_75536 ) ) ( not ( = ?auto_75534 ?auto_75536 ) ) ( not ( = ?auto_75535 ?auto_75536 ) ) ( ON ?auto_75531 ?auto_75530 ) ( ON-TABLE ?auto_75536 ) ( CLEAR ?auto_75533 ) ( ON ?auto_75532 ?auto_75531 ) ( CLEAR ?auto_75532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75536 ?auto_75530 ?auto_75531 )
      ( MAKE-5PILE ?auto_75530 ?auto_75531 ?auto_75532 ?auto_75533 ?auto_75534 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75537 - BLOCK
      ?auto_75538 - BLOCK
      ?auto_75539 - BLOCK
      ?auto_75540 - BLOCK
      ?auto_75541 - BLOCK
    )
    :vars
    (
      ?auto_75542 - BLOCK
      ?auto_75543 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75537 ?auto_75538 ) ) ( not ( = ?auto_75537 ?auto_75539 ) ) ( not ( = ?auto_75537 ?auto_75540 ) ) ( not ( = ?auto_75537 ?auto_75541 ) ) ( not ( = ?auto_75538 ?auto_75539 ) ) ( not ( = ?auto_75538 ?auto_75540 ) ) ( not ( = ?auto_75538 ?auto_75541 ) ) ( not ( = ?auto_75539 ?auto_75540 ) ) ( not ( = ?auto_75539 ?auto_75541 ) ) ( not ( = ?auto_75540 ?auto_75541 ) ) ( ON ?auto_75541 ?auto_75542 ) ( not ( = ?auto_75537 ?auto_75542 ) ) ( not ( = ?auto_75538 ?auto_75542 ) ) ( not ( = ?auto_75539 ?auto_75542 ) ) ( not ( = ?auto_75540 ?auto_75542 ) ) ( not ( = ?auto_75541 ?auto_75542 ) ) ( ON-TABLE ?auto_75542 ) ( ON ?auto_75537 ?auto_75543 ) ( not ( = ?auto_75537 ?auto_75543 ) ) ( not ( = ?auto_75538 ?auto_75543 ) ) ( not ( = ?auto_75539 ?auto_75543 ) ) ( not ( = ?auto_75540 ?auto_75543 ) ) ( not ( = ?auto_75541 ?auto_75543 ) ) ( not ( = ?auto_75542 ?auto_75543 ) ) ( ON ?auto_75538 ?auto_75537 ) ( ON-TABLE ?auto_75543 ) ( ON ?auto_75539 ?auto_75538 ) ( CLEAR ?auto_75539 ) ( HOLDING ?auto_75540 ) ( CLEAR ?auto_75541 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75542 ?auto_75541 ?auto_75540 )
      ( MAKE-5PILE ?auto_75537 ?auto_75538 ?auto_75539 ?auto_75540 ?auto_75541 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75544 - BLOCK
      ?auto_75545 - BLOCK
      ?auto_75546 - BLOCK
      ?auto_75547 - BLOCK
      ?auto_75548 - BLOCK
    )
    :vars
    (
      ?auto_75549 - BLOCK
      ?auto_75550 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75544 ?auto_75545 ) ) ( not ( = ?auto_75544 ?auto_75546 ) ) ( not ( = ?auto_75544 ?auto_75547 ) ) ( not ( = ?auto_75544 ?auto_75548 ) ) ( not ( = ?auto_75545 ?auto_75546 ) ) ( not ( = ?auto_75545 ?auto_75547 ) ) ( not ( = ?auto_75545 ?auto_75548 ) ) ( not ( = ?auto_75546 ?auto_75547 ) ) ( not ( = ?auto_75546 ?auto_75548 ) ) ( not ( = ?auto_75547 ?auto_75548 ) ) ( ON ?auto_75548 ?auto_75549 ) ( not ( = ?auto_75544 ?auto_75549 ) ) ( not ( = ?auto_75545 ?auto_75549 ) ) ( not ( = ?auto_75546 ?auto_75549 ) ) ( not ( = ?auto_75547 ?auto_75549 ) ) ( not ( = ?auto_75548 ?auto_75549 ) ) ( ON-TABLE ?auto_75549 ) ( ON ?auto_75544 ?auto_75550 ) ( not ( = ?auto_75544 ?auto_75550 ) ) ( not ( = ?auto_75545 ?auto_75550 ) ) ( not ( = ?auto_75546 ?auto_75550 ) ) ( not ( = ?auto_75547 ?auto_75550 ) ) ( not ( = ?auto_75548 ?auto_75550 ) ) ( not ( = ?auto_75549 ?auto_75550 ) ) ( ON ?auto_75545 ?auto_75544 ) ( ON-TABLE ?auto_75550 ) ( ON ?auto_75546 ?auto_75545 ) ( CLEAR ?auto_75548 ) ( ON ?auto_75547 ?auto_75546 ) ( CLEAR ?auto_75547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_75550 ?auto_75544 ?auto_75545 ?auto_75546 )
      ( MAKE-5PILE ?auto_75544 ?auto_75545 ?auto_75546 ?auto_75547 ?auto_75548 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75551 - BLOCK
      ?auto_75552 - BLOCK
      ?auto_75553 - BLOCK
      ?auto_75554 - BLOCK
      ?auto_75555 - BLOCK
    )
    :vars
    (
      ?auto_75557 - BLOCK
      ?auto_75556 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75551 ?auto_75552 ) ) ( not ( = ?auto_75551 ?auto_75553 ) ) ( not ( = ?auto_75551 ?auto_75554 ) ) ( not ( = ?auto_75551 ?auto_75555 ) ) ( not ( = ?auto_75552 ?auto_75553 ) ) ( not ( = ?auto_75552 ?auto_75554 ) ) ( not ( = ?auto_75552 ?auto_75555 ) ) ( not ( = ?auto_75553 ?auto_75554 ) ) ( not ( = ?auto_75553 ?auto_75555 ) ) ( not ( = ?auto_75554 ?auto_75555 ) ) ( not ( = ?auto_75551 ?auto_75557 ) ) ( not ( = ?auto_75552 ?auto_75557 ) ) ( not ( = ?auto_75553 ?auto_75557 ) ) ( not ( = ?auto_75554 ?auto_75557 ) ) ( not ( = ?auto_75555 ?auto_75557 ) ) ( ON-TABLE ?auto_75557 ) ( ON ?auto_75551 ?auto_75556 ) ( not ( = ?auto_75551 ?auto_75556 ) ) ( not ( = ?auto_75552 ?auto_75556 ) ) ( not ( = ?auto_75553 ?auto_75556 ) ) ( not ( = ?auto_75554 ?auto_75556 ) ) ( not ( = ?auto_75555 ?auto_75556 ) ) ( not ( = ?auto_75557 ?auto_75556 ) ) ( ON ?auto_75552 ?auto_75551 ) ( ON-TABLE ?auto_75556 ) ( ON ?auto_75553 ?auto_75552 ) ( ON ?auto_75554 ?auto_75553 ) ( CLEAR ?auto_75554 ) ( HOLDING ?auto_75555 ) ( CLEAR ?auto_75557 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75557 ?auto_75555 )
      ( MAKE-5PILE ?auto_75551 ?auto_75552 ?auto_75553 ?auto_75554 ?auto_75555 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75558 - BLOCK
      ?auto_75559 - BLOCK
      ?auto_75560 - BLOCK
      ?auto_75561 - BLOCK
      ?auto_75562 - BLOCK
    )
    :vars
    (
      ?auto_75564 - BLOCK
      ?auto_75563 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75558 ?auto_75559 ) ) ( not ( = ?auto_75558 ?auto_75560 ) ) ( not ( = ?auto_75558 ?auto_75561 ) ) ( not ( = ?auto_75558 ?auto_75562 ) ) ( not ( = ?auto_75559 ?auto_75560 ) ) ( not ( = ?auto_75559 ?auto_75561 ) ) ( not ( = ?auto_75559 ?auto_75562 ) ) ( not ( = ?auto_75560 ?auto_75561 ) ) ( not ( = ?auto_75560 ?auto_75562 ) ) ( not ( = ?auto_75561 ?auto_75562 ) ) ( not ( = ?auto_75558 ?auto_75564 ) ) ( not ( = ?auto_75559 ?auto_75564 ) ) ( not ( = ?auto_75560 ?auto_75564 ) ) ( not ( = ?auto_75561 ?auto_75564 ) ) ( not ( = ?auto_75562 ?auto_75564 ) ) ( ON-TABLE ?auto_75564 ) ( ON ?auto_75558 ?auto_75563 ) ( not ( = ?auto_75558 ?auto_75563 ) ) ( not ( = ?auto_75559 ?auto_75563 ) ) ( not ( = ?auto_75560 ?auto_75563 ) ) ( not ( = ?auto_75561 ?auto_75563 ) ) ( not ( = ?auto_75562 ?auto_75563 ) ) ( not ( = ?auto_75564 ?auto_75563 ) ) ( ON ?auto_75559 ?auto_75558 ) ( ON-TABLE ?auto_75563 ) ( ON ?auto_75560 ?auto_75559 ) ( ON ?auto_75561 ?auto_75560 ) ( CLEAR ?auto_75564 ) ( ON ?auto_75562 ?auto_75561 ) ( CLEAR ?auto_75562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_75563 ?auto_75558 ?auto_75559 ?auto_75560 ?auto_75561 )
      ( MAKE-5PILE ?auto_75558 ?auto_75559 ?auto_75560 ?auto_75561 ?auto_75562 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75565 - BLOCK
      ?auto_75566 - BLOCK
      ?auto_75567 - BLOCK
      ?auto_75568 - BLOCK
      ?auto_75569 - BLOCK
    )
    :vars
    (
      ?auto_75571 - BLOCK
      ?auto_75570 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75565 ?auto_75566 ) ) ( not ( = ?auto_75565 ?auto_75567 ) ) ( not ( = ?auto_75565 ?auto_75568 ) ) ( not ( = ?auto_75565 ?auto_75569 ) ) ( not ( = ?auto_75566 ?auto_75567 ) ) ( not ( = ?auto_75566 ?auto_75568 ) ) ( not ( = ?auto_75566 ?auto_75569 ) ) ( not ( = ?auto_75567 ?auto_75568 ) ) ( not ( = ?auto_75567 ?auto_75569 ) ) ( not ( = ?auto_75568 ?auto_75569 ) ) ( not ( = ?auto_75565 ?auto_75571 ) ) ( not ( = ?auto_75566 ?auto_75571 ) ) ( not ( = ?auto_75567 ?auto_75571 ) ) ( not ( = ?auto_75568 ?auto_75571 ) ) ( not ( = ?auto_75569 ?auto_75571 ) ) ( ON ?auto_75565 ?auto_75570 ) ( not ( = ?auto_75565 ?auto_75570 ) ) ( not ( = ?auto_75566 ?auto_75570 ) ) ( not ( = ?auto_75567 ?auto_75570 ) ) ( not ( = ?auto_75568 ?auto_75570 ) ) ( not ( = ?auto_75569 ?auto_75570 ) ) ( not ( = ?auto_75571 ?auto_75570 ) ) ( ON ?auto_75566 ?auto_75565 ) ( ON-TABLE ?auto_75570 ) ( ON ?auto_75567 ?auto_75566 ) ( ON ?auto_75568 ?auto_75567 ) ( ON ?auto_75569 ?auto_75568 ) ( CLEAR ?auto_75569 ) ( HOLDING ?auto_75571 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_75571 )
      ( MAKE-5PILE ?auto_75565 ?auto_75566 ?auto_75567 ?auto_75568 ?auto_75569 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75572 - BLOCK
      ?auto_75573 - BLOCK
      ?auto_75574 - BLOCK
      ?auto_75575 - BLOCK
      ?auto_75576 - BLOCK
    )
    :vars
    (
      ?auto_75578 - BLOCK
      ?auto_75577 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75572 ?auto_75573 ) ) ( not ( = ?auto_75572 ?auto_75574 ) ) ( not ( = ?auto_75572 ?auto_75575 ) ) ( not ( = ?auto_75572 ?auto_75576 ) ) ( not ( = ?auto_75573 ?auto_75574 ) ) ( not ( = ?auto_75573 ?auto_75575 ) ) ( not ( = ?auto_75573 ?auto_75576 ) ) ( not ( = ?auto_75574 ?auto_75575 ) ) ( not ( = ?auto_75574 ?auto_75576 ) ) ( not ( = ?auto_75575 ?auto_75576 ) ) ( not ( = ?auto_75572 ?auto_75578 ) ) ( not ( = ?auto_75573 ?auto_75578 ) ) ( not ( = ?auto_75574 ?auto_75578 ) ) ( not ( = ?auto_75575 ?auto_75578 ) ) ( not ( = ?auto_75576 ?auto_75578 ) ) ( ON ?auto_75572 ?auto_75577 ) ( not ( = ?auto_75572 ?auto_75577 ) ) ( not ( = ?auto_75573 ?auto_75577 ) ) ( not ( = ?auto_75574 ?auto_75577 ) ) ( not ( = ?auto_75575 ?auto_75577 ) ) ( not ( = ?auto_75576 ?auto_75577 ) ) ( not ( = ?auto_75578 ?auto_75577 ) ) ( ON ?auto_75573 ?auto_75572 ) ( ON-TABLE ?auto_75577 ) ( ON ?auto_75574 ?auto_75573 ) ( ON ?auto_75575 ?auto_75574 ) ( ON ?auto_75576 ?auto_75575 ) ( ON ?auto_75578 ?auto_75576 ) ( CLEAR ?auto_75578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_75577 ?auto_75572 ?auto_75573 ?auto_75574 ?auto_75575 ?auto_75576 )
      ( MAKE-5PILE ?auto_75572 ?auto_75573 ?auto_75574 ?auto_75575 ?auto_75576 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_75585 - BLOCK
      ?auto_75586 - BLOCK
      ?auto_75587 - BLOCK
      ?auto_75588 - BLOCK
      ?auto_75589 - BLOCK
      ?auto_75590 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_75590 ) ( CLEAR ?auto_75589 ) ( ON-TABLE ?auto_75585 ) ( ON ?auto_75586 ?auto_75585 ) ( ON ?auto_75587 ?auto_75586 ) ( ON ?auto_75588 ?auto_75587 ) ( ON ?auto_75589 ?auto_75588 ) ( not ( = ?auto_75585 ?auto_75586 ) ) ( not ( = ?auto_75585 ?auto_75587 ) ) ( not ( = ?auto_75585 ?auto_75588 ) ) ( not ( = ?auto_75585 ?auto_75589 ) ) ( not ( = ?auto_75585 ?auto_75590 ) ) ( not ( = ?auto_75586 ?auto_75587 ) ) ( not ( = ?auto_75586 ?auto_75588 ) ) ( not ( = ?auto_75586 ?auto_75589 ) ) ( not ( = ?auto_75586 ?auto_75590 ) ) ( not ( = ?auto_75587 ?auto_75588 ) ) ( not ( = ?auto_75587 ?auto_75589 ) ) ( not ( = ?auto_75587 ?auto_75590 ) ) ( not ( = ?auto_75588 ?auto_75589 ) ) ( not ( = ?auto_75588 ?auto_75590 ) ) ( not ( = ?auto_75589 ?auto_75590 ) ) )
    :subtasks
    ( ( !STACK ?auto_75590 ?auto_75589 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_75591 - BLOCK
      ?auto_75592 - BLOCK
      ?auto_75593 - BLOCK
      ?auto_75594 - BLOCK
      ?auto_75595 - BLOCK
      ?auto_75596 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_75595 ) ( ON-TABLE ?auto_75591 ) ( ON ?auto_75592 ?auto_75591 ) ( ON ?auto_75593 ?auto_75592 ) ( ON ?auto_75594 ?auto_75593 ) ( ON ?auto_75595 ?auto_75594 ) ( not ( = ?auto_75591 ?auto_75592 ) ) ( not ( = ?auto_75591 ?auto_75593 ) ) ( not ( = ?auto_75591 ?auto_75594 ) ) ( not ( = ?auto_75591 ?auto_75595 ) ) ( not ( = ?auto_75591 ?auto_75596 ) ) ( not ( = ?auto_75592 ?auto_75593 ) ) ( not ( = ?auto_75592 ?auto_75594 ) ) ( not ( = ?auto_75592 ?auto_75595 ) ) ( not ( = ?auto_75592 ?auto_75596 ) ) ( not ( = ?auto_75593 ?auto_75594 ) ) ( not ( = ?auto_75593 ?auto_75595 ) ) ( not ( = ?auto_75593 ?auto_75596 ) ) ( not ( = ?auto_75594 ?auto_75595 ) ) ( not ( = ?auto_75594 ?auto_75596 ) ) ( not ( = ?auto_75595 ?auto_75596 ) ) ( ON-TABLE ?auto_75596 ) ( CLEAR ?auto_75596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_75596 )
      ( MAKE-6PILE ?auto_75591 ?auto_75592 ?auto_75593 ?auto_75594 ?auto_75595 ?auto_75596 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_75597 - BLOCK
      ?auto_75598 - BLOCK
      ?auto_75599 - BLOCK
      ?auto_75600 - BLOCK
      ?auto_75601 - BLOCK
      ?auto_75602 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_75597 ) ( ON ?auto_75598 ?auto_75597 ) ( ON ?auto_75599 ?auto_75598 ) ( ON ?auto_75600 ?auto_75599 ) ( not ( = ?auto_75597 ?auto_75598 ) ) ( not ( = ?auto_75597 ?auto_75599 ) ) ( not ( = ?auto_75597 ?auto_75600 ) ) ( not ( = ?auto_75597 ?auto_75601 ) ) ( not ( = ?auto_75597 ?auto_75602 ) ) ( not ( = ?auto_75598 ?auto_75599 ) ) ( not ( = ?auto_75598 ?auto_75600 ) ) ( not ( = ?auto_75598 ?auto_75601 ) ) ( not ( = ?auto_75598 ?auto_75602 ) ) ( not ( = ?auto_75599 ?auto_75600 ) ) ( not ( = ?auto_75599 ?auto_75601 ) ) ( not ( = ?auto_75599 ?auto_75602 ) ) ( not ( = ?auto_75600 ?auto_75601 ) ) ( not ( = ?auto_75600 ?auto_75602 ) ) ( not ( = ?auto_75601 ?auto_75602 ) ) ( ON-TABLE ?auto_75602 ) ( CLEAR ?auto_75602 ) ( HOLDING ?auto_75601 ) ( CLEAR ?auto_75600 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_75597 ?auto_75598 ?auto_75599 ?auto_75600 ?auto_75601 )
      ( MAKE-6PILE ?auto_75597 ?auto_75598 ?auto_75599 ?auto_75600 ?auto_75601 ?auto_75602 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_75603 - BLOCK
      ?auto_75604 - BLOCK
      ?auto_75605 - BLOCK
      ?auto_75606 - BLOCK
      ?auto_75607 - BLOCK
      ?auto_75608 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_75603 ) ( ON ?auto_75604 ?auto_75603 ) ( ON ?auto_75605 ?auto_75604 ) ( ON ?auto_75606 ?auto_75605 ) ( not ( = ?auto_75603 ?auto_75604 ) ) ( not ( = ?auto_75603 ?auto_75605 ) ) ( not ( = ?auto_75603 ?auto_75606 ) ) ( not ( = ?auto_75603 ?auto_75607 ) ) ( not ( = ?auto_75603 ?auto_75608 ) ) ( not ( = ?auto_75604 ?auto_75605 ) ) ( not ( = ?auto_75604 ?auto_75606 ) ) ( not ( = ?auto_75604 ?auto_75607 ) ) ( not ( = ?auto_75604 ?auto_75608 ) ) ( not ( = ?auto_75605 ?auto_75606 ) ) ( not ( = ?auto_75605 ?auto_75607 ) ) ( not ( = ?auto_75605 ?auto_75608 ) ) ( not ( = ?auto_75606 ?auto_75607 ) ) ( not ( = ?auto_75606 ?auto_75608 ) ) ( not ( = ?auto_75607 ?auto_75608 ) ) ( ON-TABLE ?auto_75608 ) ( CLEAR ?auto_75606 ) ( ON ?auto_75607 ?auto_75608 ) ( CLEAR ?auto_75607 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_75608 )
      ( MAKE-6PILE ?auto_75603 ?auto_75604 ?auto_75605 ?auto_75606 ?auto_75607 ?auto_75608 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_75609 - BLOCK
      ?auto_75610 - BLOCK
      ?auto_75611 - BLOCK
      ?auto_75612 - BLOCK
      ?auto_75613 - BLOCK
      ?auto_75614 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_75609 ) ( ON ?auto_75610 ?auto_75609 ) ( ON ?auto_75611 ?auto_75610 ) ( not ( = ?auto_75609 ?auto_75610 ) ) ( not ( = ?auto_75609 ?auto_75611 ) ) ( not ( = ?auto_75609 ?auto_75612 ) ) ( not ( = ?auto_75609 ?auto_75613 ) ) ( not ( = ?auto_75609 ?auto_75614 ) ) ( not ( = ?auto_75610 ?auto_75611 ) ) ( not ( = ?auto_75610 ?auto_75612 ) ) ( not ( = ?auto_75610 ?auto_75613 ) ) ( not ( = ?auto_75610 ?auto_75614 ) ) ( not ( = ?auto_75611 ?auto_75612 ) ) ( not ( = ?auto_75611 ?auto_75613 ) ) ( not ( = ?auto_75611 ?auto_75614 ) ) ( not ( = ?auto_75612 ?auto_75613 ) ) ( not ( = ?auto_75612 ?auto_75614 ) ) ( not ( = ?auto_75613 ?auto_75614 ) ) ( ON-TABLE ?auto_75614 ) ( ON ?auto_75613 ?auto_75614 ) ( CLEAR ?auto_75613 ) ( HOLDING ?auto_75612 ) ( CLEAR ?auto_75611 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_75609 ?auto_75610 ?auto_75611 ?auto_75612 )
      ( MAKE-6PILE ?auto_75609 ?auto_75610 ?auto_75611 ?auto_75612 ?auto_75613 ?auto_75614 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_75615 - BLOCK
      ?auto_75616 - BLOCK
      ?auto_75617 - BLOCK
      ?auto_75618 - BLOCK
      ?auto_75619 - BLOCK
      ?auto_75620 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_75615 ) ( ON ?auto_75616 ?auto_75615 ) ( ON ?auto_75617 ?auto_75616 ) ( not ( = ?auto_75615 ?auto_75616 ) ) ( not ( = ?auto_75615 ?auto_75617 ) ) ( not ( = ?auto_75615 ?auto_75618 ) ) ( not ( = ?auto_75615 ?auto_75619 ) ) ( not ( = ?auto_75615 ?auto_75620 ) ) ( not ( = ?auto_75616 ?auto_75617 ) ) ( not ( = ?auto_75616 ?auto_75618 ) ) ( not ( = ?auto_75616 ?auto_75619 ) ) ( not ( = ?auto_75616 ?auto_75620 ) ) ( not ( = ?auto_75617 ?auto_75618 ) ) ( not ( = ?auto_75617 ?auto_75619 ) ) ( not ( = ?auto_75617 ?auto_75620 ) ) ( not ( = ?auto_75618 ?auto_75619 ) ) ( not ( = ?auto_75618 ?auto_75620 ) ) ( not ( = ?auto_75619 ?auto_75620 ) ) ( ON-TABLE ?auto_75620 ) ( ON ?auto_75619 ?auto_75620 ) ( CLEAR ?auto_75617 ) ( ON ?auto_75618 ?auto_75619 ) ( CLEAR ?auto_75618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75620 ?auto_75619 )
      ( MAKE-6PILE ?auto_75615 ?auto_75616 ?auto_75617 ?auto_75618 ?auto_75619 ?auto_75620 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_75621 - BLOCK
      ?auto_75622 - BLOCK
      ?auto_75623 - BLOCK
      ?auto_75624 - BLOCK
      ?auto_75625 - BLOCK
      ?auto_75626 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_75621 ) ( ON ?auto_75622 ?auto_75621 ) ( not ( = ?auto_75621 ?auto_75622 ) ) ( not ( = ?auto_75621 ?auto_75623 ) ) ( not ( = ?auto_75621 ?auto_75624 ) ) ( not ( = ?auto_75621 ?auto_75625 ) ) ( not ( = ?auto_75621 ?auto_75626 ) ) ( not ( = ?auto_75622 ?auto_75623 ) ) ( not ( = ?auto_75622 ?auto_75624 ) ) ( not ( = ?auto_75622 ?auto_75625 ) ) ( not ( = ?auto_75622 ?auto_75626 ) ) ( not ( = ?auto_75623 ?auto_75624 ) ) ( not ( = ?auto_75623 ?auto_75625 ) ) ( not ( = ?auto_75623 ?auto_75626 ) ) ( not ( = ?auto_75624 ?auto_75625 ) ) ( not ( = ?auto_75624 ?auto_75626 ) ) ( not ( = ?auto_75625 ?auto_75626 ) ) ( ON-TABLE ?auto_75626 ) ( ON ?auto_75625 ?auto_75626 ) ( ON ?auto_75624 ?auto_75625 ) ( CLEAR ?auto_75624 ) ( HOLDING ?auto_75623 ) ( CLEAR ?auto_75622 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75621 ?auto_75622 ?auto_75623 )
      ( MAKE-6PILE ?auto_75621 ?auto_75622 ?auto_75623 ?auto_75624 ?auto_75625 ?auto_75626 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_75627 - BLOCK
      ?auto_75628 - BLOCK
      ?auto_75629 - BLOCK
      ?auto_75630 - BLOCK
      ?auto_75631 - BLOCK
      ?auto_75632 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_75627 ) ( ON ?auto_75628 ?auto_75627 ) ( not ( = ?auto_75627 ?auto_75628 ) ) ( not ( = ?auto_75627 ?auto_75629 ) ) ( not ( = ?auto_75627 ?auto_75630 ) ) ( not ( = ?auto_75627 ?auto_75631 ) ) ( not ( = ?auto_75627 ?auto_75632 ) ) ( not ( = ?auto_75628 ?auto_75629 ) ) ( not ( = ?auto_75628 ?auto_75630 ) ) ( not ( = ?auto_75628 ?auto_75631 ) ) ( not ( = ?auto_75628 ?auto_75632 ) ) ( not ( = ?auto_75629 ?auto_75630 ) ) ( not ( = ?auto_75629 ?auto_75631 ) ) ( not ( = ?auto_75629 ?auto_75632 ) ) ( not ( = ?auto_75630 ?auto_75631 ) ) ( not ( = ?auto_75630 ?auto_75632 ) ) ( not ( = ?auto_75631 ?auto_75632 ) ) ( ON-TABLE ?auto_75632 ) ( ON ?auto_75631 ?auto_75632 ) ( ON ?auto_75630 ?auto_75631 ) ( CLEAR ?auto_75628 ) ( ON ?auto_75629 ?auto_75630 ) ( CLEAR ?auto_75629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75632 ?auto_75631 ?auto_75630 )
      ( MAKE-6PILE ?auto_75627 ?auto_75628 ?auto_75629 ?auto_75630 ?auto_75631 ?auto_75632 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_75633 - BLOCK
      ?auto_75634 - BLOCK
      ?auto_75635 - BLOCK
      ?auto_75636 - BLOCK
      ?auto_75637 - BLOCK
      ?auto_75638 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_75633 ) ( not ( = ?auto_75633 ?auto_75634 ) ) ( not ( = ?auto_75633 ?auto_75635 ) ) ( not ( = ?auto_75633 ?auto_75636 ) ) ( not ( = ?auto_75633 ?auto_75637 ) ) ( not ( = ?auto_75633 ?auto_75638 ) ) ( not ( = ?auto_75634 ?auto_75635 ) ) ( not ( = ?auto_75634 ?auto_75636 ) ) ( not ( = ?auto_75634 ?auto_75637 ) ) ( not ( = ?auto_75634 ?auto_75638 ) ) ( not ( = ?auto_75635 ?auto_75636 ) ) ( not ( = ?auto_75635 ?auto_75637 ) ) ( not ( = ?auto_75635 ?auto_75638 ) ) ( not ( = ?auto_75636 ?auto_75637 ) ) ( not ( = ?auto_75636 ?auto_75638 ) ) ( not ( = ?auto_75637 ?auto_75638 ) ) ( ON-TABLE ?auto_75638 ) ( ON ?auto_75637 ?auto_75638 ) ( ON ?auto_75636 ?auto_75637 ) ( ON ?auto_75635 ?auto_75636 ) ( CLEAR ?auto_75635 ) ( HOLDING ?auto_75634 ) ( CLEAR ?auto_75633 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75633 ?auto_75634 )
      ( MAKE-6PILE ?auto_75633 ?auto_75634 ?auto_75635 ?auto_75636 ?auto_75637 ?auto_75638 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_75639 - BLOCK
      ?auto_75640 - BLOCK
      ?auto_75641 - BLOCK
      ?auto_75642 - BLOCK
      ?auto_75643 - BLOCK
      ?auto_75644 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_75639 ) ( not ( = ?auto_75639 ?auto_75640 ) ) ( not ( = ?auto_75639 ?auto_75641 ) ) ( not ( = ?auto_75639 ?auto_75642 ) ) ( not ( = ?auto_75639 ?auto_75643 ) ) ( not ( = ?auto_75639 ?auto_75644 ) ) ( not ( = ?auto_75640 ?auto_75641 ) ) ( not ( = ?auto_75640 ?auto_75642 ) ) ( not ( = ?auto_75640 ?auto_75643 ) ) ( not ( = ?auto_75640 ?auto_75644 ) ) ( not ( = ?auto_75641 ?auto_75642 ) ) ( not ( = ?auto_75641 ?auto_75643 ) ) ( not ( = ?auto_75641 ?auto_75644 ) ) ( not ( = ?auto_75642 ?auto_75643 ) ) ( not ( = ?auto_75642 ?auto_75644 ) ) ( not ( = ?auto_75643 ?auto_75644 ) ) ( ON-TABLE ?auto_75644 ) ( ON ?auto_75643 ?auto_75644 ) ( ON ?auto_75642 ?auto_75643 ) ( ON ?auto_75641 ?auto_75642 ) ( CLEAR ?auto_75639 ) ( ON ?auto_75640 ?auto_75641 ) ( CLEAR ?auto_75640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_75644 ?auto_75643 ?auto_75642 ?auto_75641 )
      ( MAKE-6PILE ?auto_75639 ?auto_75640 ?auto_75641 ?auto_75642 ?auto_75643 ?auto_75644 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_75645 - BLOCK
      ?auto_75646 - BLOCK
      ?auto_75647 - BLOCK
      ?auto_75648 - BLOCK
      ?auto_75649 - BLOCK
      ?auto_75650 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75645 ?auto_75646 ) ) ( not ( = ?auto_75645 ?auto_75647 ) ) ( not ( = ?auto_75645 ?auto_75648 ) ) ( not ( = ?auto_75645 ?auto_75649 ) ) ( not ( = ?auto_75645 ?auto_75650 ) ) ( not ( = ?auto_75646 ?auto_75647 ) ) ( not ( = ?auto_75646 ?auto_75648 ) ) ( not ( = ?auto_75646 ?auto_75649 ) ) ( not ( = ?auto_75646 ?auto_75650 ) ) ( not ( = ?auto_75647 ?auto_75648 ) ) ( not ( = ?auto_75647 ?auto_75649 ) ) ( not ( = ?auto_75647 ?auto_75650 ) ) ( not ( = ?auto_75648 ?auto_75649 ) ) ( not ( = ?auto_75648 ?auto_75650 ) ) ( not ( = ?auto_75649 ?auto_75650 ) ) ( ON-TABLE ?auto_75650 ) ( ON ?auto_75649 ?auto_75650 ) ( ON ?auto_75648 ?auto_75649 ) ( ON ?auto_75647 ?auto_75648 ) ( ON ?auto_75646 ?auto_75647 ) ( CLEAR ?auto_75646 ) ( HOLDING ?auto_75645 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_75645 )
      ( MAKE-6PILE ?auto_75645 ?auto_75646 ?auto_75647 ?auto_75648 ?auto_75649 ?auto_75650 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_75651 - BLOCK
      ?auto_75652 - BLOCK
      ?auto_75653 - BLOCK
      ?auto_75654 - BLOCK
      ?auto_75655 - BLOCK
      ?auto_75656 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75651 ?auto_75652 ) ) ( not ( = ?auto_75651 ?auto_75653 ) ) ( not ( = ?auto_75651 ?auto_75654 ) ) ( not ( = ?auto_75651 ?auto_75655 ) ) ( not ( = ?auto_75651 ?auto_75656 ) ) ( not ( = ?auto_75652 ?auto_75653 ) ) ( not ( = ?auto_75652 ?auto_75654 ) ) ( not ( = ?auto_75652 ?auto_75655 ) ) ( not ( = ?auto_75652 ?auto_75656 ) ) ( not ( = ?auto_75653 ?auto_75654 ) ) ( not ( = ?auto_75653 ?auto_75655 ) ) ( not ( = ?auto_75653 ?auto_75656 ) ) ( not ( = ?auto_75654 ?auto_75655 ) ) ( not ( = ?auto_75654 ?auto_75656 ) ) ( not ( = ?auto_75655 ?auto_75656 ) ) ( ON-TABLE ?auto_75656 ) ( ON ?auto_75655 ?auto_75656 ) ( ON ?auto_75654 ?auto_75655 ) ( ON ?auto_75653 ?auto_75654 ) ( ON ?auto_75652 ?auto_75653 ) ( ON ?auto_75651 ?auto_75652 ) ( CLEAR ?auto_75651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_75656 ?auto_75655 ?auto_75654 ?auto_75653 ?auto_75652 )
      ( MAKE-6PILE ?auto_75651 ?auto_75652 ?auto_75653 ?auto_75654 ?auto_75655 ?auto_75656 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_75657 - BLOCK
      ?auto_75658 - BLOCK
      ?auto_75659 - BLOCK
      ?auto_75660 - BLOCK
      ?auto_75661 - BLOCK
      ?auto_75662 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75657 ?auto_75658 ) ) ( not ( = ?auto_75657 ?auto_75659 ) ) ( not ( = ?auto_75657 ?auto_75660 ) ) ( not ( = ?auto_75657 ?auto_75661 ) ) ( not ( = ?auto_75657 ?auto_75662 ) ) ( not ( = ?auto_75658 ?auto_75659 ) ) ( not ( = ?auto_75658 ?auto_75660 ) ) ( not ( = ?auto_75658 ?auto_75661 ) ) ( not ( = ?auto_75658 ?auto_75662 ) ) ( not ( = ?auto_75659 ?auto_75660 ) ) ( not ( = ?auto_75659 ?auto_75661 ) ) ( not ( = ?auto_75659 ?auto_75662 ) ) ( not ( = ?auto_75660 ?auto_75661 ) ) ( not ( = ?auto_75660 ?auto_75662 ) ) ( not ( = ?auto_75661 ?auto_75662 ) ) ( ON-TABLE ?auto_75662 ) ( ON ?auto_75661 ?auto_75662 ) ( ON ?auto_75660 ?auto_75661 ) ( ON ?auto_75659 ?auto_75660 ) ( ON ?auto_75658 ?auto_75659 ) ( HOLDING ?auto_75657 ) ( CLEAR ?auto_75658 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_75662 ?auto_75661 ?auto_75660 ?auto_75659 ?auto_75658 ?auto_75657 )
      ( MAKE-6PILE ?auto_75657 ?auto_75658 ?auto_75659 ?auto_75660 ?auto_75661 ?auto_75662 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_75663 - BLOCK
      ?auto_75664 - BLOCK
      ?auto_75665 - BLOCK
      ?auto_75666 - BLOCK
      ?auto_75667 - BLOCK
      ?auto_75668 - BLOCK
    )
    :vars
    (
      ?auto_75669 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75663 ?auto_75664 ) ) ( not ( = ?auto_75663 ?auto_75665 ) ) ( not ( = ?auto_75663 ?auto_75666 ) ) ( not ( = ?auto_75663 ?auto_75667 ) ) ( not ( = ?auto_75663 ?auto_75668 ) ) ( not ( = ?auto_75664 ?auto_75665 ) ) ( not ( = ?auto_75664 ?auto_75666 ) ) ( not ( = ?auto_75664 ?auto_75667 ) ) ( not ( = ?auto_75664 ?auto_75668 ) ) ( not ( = ?auto_75665 ?auto_75666 ) ) ( not ( = ?auto_75665 ?auto_75667 ) ) ( not ( = ?auto_75665 ?auto_75668 ) ) ( not ( = ?auto_75666 ?auto_75667 ) ) ( not ( = ?auto_75666 ?auto_75668 ) ) ( not ( = ?auto_75667 ?auto_75668 ) ) ( ON-TABLE ?auto_75668 ) ( ON ?auto_75667 ?auto_75668 ) ( ON ?auto_75666 ?auto_75667 ) ( ON ?auto_75665 ?auto_75666 ) ( ON ?auto_75664 ?auto_75665 ) ( CLEAR ?auto_75664 ) ( ON ?auto_75663 ?auto_75669 ) ( CLEAR ?auto_75663 ) ( HAND-EMPTY ) ( not ( = ?auto_75663 ?auto_75669 ) ) ( not ( = ?auto_75664 ?auto_75669 ) ) ( not ( = ?auto_75665 ?auto_75669 ) ) ( not ( = ?auto_75666 ?auto_75669 ) ) ( not ( = ?auto_75667 ?auto_75669 ) ) ( not ( = ?auto_75668 ?auto_75669 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_75663 ?auto_75669 )
      ( MAKE-6PILE ?auto_75663 ?auto_75664 ?auto_75665 ?auto_75666 ?auto_75667 ?auto_75668 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_75670 - BLOCK
      ?auto_75671 - BLOCK
      ?auto_75672 - BLOCK
      ?auto_75673 - BLOCK
      ?auto_75674 - BLOCK
      ?auto_75675 - BLOCK
    )
    :vars
    (
      ?auto_75676 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75670 ?auto_75671 ) ) ( not ( = ?auto_75670 ?auto_75672 ) ) ( not ( = ?auto_75670 ?auto_75673 ) ) ( not ( = ?auto_75670 ?auto_75674 ) ) ( not ( = ?auto_75670 ?auto_75675 ) ) ( not ( = ?auto_75671 ?auto_75672 ) ) ( not ( = ?auto_75671 ?auto_75673 ) ) ( not ( = ?auto_75671 ?auto_75674 ) ) ( not ( = ?auto_75671 ?auto_75675 ) ) ( not ( = ?auto_75672 ?auto_75673 ) ) ( not ( = ?auto_75672 ?auto_75674 ) ) ( not ( = ?auto_75672 ?auto_75675 ) ) ( not ( = ?auto_75673 ?auto_75674 ) ) ( not ( = ?auto_75673 ?auto_75675 ) ) ( not ( = ?auto_75674 ?auto_75675 ) ) ( ON-TABLE ?auto_75675 ) ( ON ?auto_75674 ?auto_75675 ) ( ON ?auto_75673 ?auto_75674 ) ( ON ?auto_75672 ?auto_75673 ) ( ON ?auto_75670 ?auto_75676 ) ( CLEAR ?auto_75670 ) ( not ( = ?auto_75670 ?auto_75676 ) ) ( not ( = ?auto_75671 ?auto_75676 ) ) ( not ( = ?auto_75672 ?auto_75676 ) ) ( not ( = ?auto_75673 ?auto_75676 ) ) ( not ( = ?auto_75674 ?auto_75676 ) ) ( not ( = ?auto_75675 ?auto_75676 ) ) ( HOLDING ?auto_75671 ) ( CLEAR ?auto_75672 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_75675 ?auto_75674 ?auto_75673 ?auto_75672 ?auto_75671 )
      ( MAKE-6PILE ?auto_75670 ?auto_75671 ?auto_75672 ?auto_75673 ?auto_75674 ?auto_75675 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_75677 - BLOCK
      ?auto_75678 - BLOCK
      ?auto_75679 - BLOCK
      ?auto_75680 - BLOCK
      ?auto_75681 - BLOCK
      ?auto_75682 - BLOCK
    )
    :vars
    (
      ?auto_75683 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75677 ?auto_75678 ) ) ( not ( = ?auto_75677 ?auto_75679 ) ) ( not ( = ?auto_75677 ?auto_75680 ) ) ( not ( = ?auto_75677 ?auto_75681 ) ) ( not ( = ?auto_75677 ?auto_75682 ) ) ( not ( = ?auto_75678 ?auto_75679 ) ) ( not ( = ?auto_75678 ?auto_75680 ) ) ( not ( = ?auto_75678 ?auto_75681 ) ) ( not ( = ?auto_75678 ?auto_75682 ) ) ( not ( = ?auto_75679 ?auto_75680 ) ) ( not ( = ?auto_75679 ?auto_75681 ) ) ( not ( = ?auto_75679 ?auto_75682 ) ) ( not ( = ?auto_75680 ?auto_75681 ) ) ( not ( = ?auto_75680 ?auto_75682 ) ) ( not ( = ?auto_75681 ?auto_75682 ) ) ( ON-TABLE ?auto_75682 ) ( ON ?auto_75681 ?auto_75682 ) ( ON ?auto_75680 ?auto_75681 ) ( ON ?auto_75679 ?auto_75680 ) ( ON ?auto_75677 ?auto_75683 ) ( not ( = ?auto_75677 ?auto_75683 ) ) ( not ( = ?auto_75678 ?auto_75683 ) ) ( not ( = ?auto_75679 ?auto_75683 ) ) ( not ( = ?auto_75680 ?auto_75683 ) ) ( not ( = ?auto_75681 ?auto_75683 ) ) ( not ( = ?auto_75682 ?auto_75683 ) ) ( CLEAR ?auto_75679 ) ( ON ?auto_75678 ?auto_75677 ) ( CLEAR ?auto_75678 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_75683 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75683 ?auto_75677 )
      ( MAKE-6PILE ?auto_75677 ?auto_75678 ?auto_75679 ?auto_75680 ?auto_75681 ?auto_75682 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_75684 - BLOCK
      ?auto_75685 - BLOCK
      ?auto_75686 - BLOCK
      ?auto_75687 - BLOCK
      ?auto_75688 - BLOCK
      ?auto_75689 - BLOCK
    )
    :vars
    (
      ?auto_75690 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75684 ?auto_75685 ) ) ( not ( = ?auto_75684 ?auto_75686 ) ) ( not ( = ?auto_75684 ?auto_75687 ) ) ( not ( = ?auto_75684 ?auto_75688 ) ) ( not ( = ?auto_75684 ?auto_75689 ) ) ( not ( = ?auto_75685 ?auto_75686 ) ) ( not ( = ?auto_75685 ?auto_75687 ) ) ( not ( = ?auto_75685 ?auto_75688 ) ) ( not ( = ?auto_75685 ?auto_75689 ) ) ( not ( = ?auto_75686 ?auto_75687 ) ) ( not ( = ?auto_75686 ?auto_75688 ) ) ( not ( = ?auto_75686 ?auto_75689 ) ) ( not ( = ?auto_75687 ?auto_75688 ) ) ( not ( = ?auto_75687 ?auto_75689 ) ) ( not ( = ?auto_75688 ?auto_75689 ) ) ( ON-TABLE ?auto_75689 ) ( ON ?auto_75688 ?auto_75689 ) ( ON ?auto_75687 ?auto_75688 ) ( ON ?auto_75684 ?auto_75690 ) ( not ( = ?auto_75684 ?auto_75690 ) ) ( not ( = ?auto_75685 ?auto_75690 ) ) ( not ( = ?auto_75686 ?auto_75690 ) ) ( not ( = ?auto_75687 ?auto_75690 ) ) ( not ( = ?auto_75688 ?auto_75690 ) ) ( not ( = ?auto_75689 ?auto_75690 ) ) ( ON ?auto_75685 ?auto_75684 ) ( CLEAR ?auto_75685 ) ( ON-TABLE ?auto_75690 ) ( HOLDING ?auto_75686 ) ( CLEAR ?auto_75687 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_75689 ?auto_75688 ?auto_75687 ?auto_75686 )
      ( MAKE-6PILE ?auto_75684 ?auto_75685 ?auto_75686 ?auto_75687 ?auto_75688 ?auto_75689 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_75691 - BLOCK
      ?auto_75692 - BLOCK
      ?auto_75693 - BLOCK
      ?auto_75694 - BLOCK
      ?auto_75695 - BLOCK
      ?auto_75696 - BLOCK
    )
    :vars
    (
      ?auto_75697 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75691 ?auto_75692 ) ) ( not ( = ?auto_75691 ?auto_75693 ) ) ( not ( = ?auto_75691 ?auto_75694 ) ) ( not ( = ?auto_75691 ?auto_75695 ) ) ( not ( = ?auto_75691 ?auto_75696 ) ) ( not ( = ?auto_75692 ?auto_75693 ) ) ( not ( = ?auto_75692 ?auto_75694 ) ) ( not ( = ?auto_75692 ?auto_75695 ) ) ( not ( = ?auto_75692 ?auto_75696 ) ) ( not ( = ?auto_75693 ?auto_75694 ) ) ( not ( = ?auto_75693 ?auto_75695 ) ) ( not ( = ?auto_75693 ?auto_75696 ) ) ( not ( = ?auto_75694 ?auto_75695 ) ) ( not ( = ?auto_75694 ?auto_75696 ) ) ( not ( = ?auto_75695 ?auto_75696 ) ) ( ON-TABLE ?auto_75696 ) ( ON ?auto_75695 ?auto_75696 ) ( ON ?auto_75694 ?auto_75695 ) ( ON ?auto_75691 ?auto_75697 ) ( not ( = ?auto_75691 ?auto_75697 ) ) ( not ( = ?auto_75692 ?auto_75697 ) ) ( not ( = ?auto_75693 ?auto_75697 ) ) ( not ( = ?auto_75694 ?auto_75697 ) ) ( not ( = ?auto_75695 ?auto_75697 ) ) ( not ( = ?auto_75696 ?auto_75697 ) ) ( ON ?auto_75692 ?auto_75691 ) ( ON-TABLE ?auto_75697 ) ( CLEAR ?auto_75694 ) ( ON ?auto_75693 ?auto_75692 ) ( CLEAR ?auto_75693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75697 ?auto_75691 ?auto_75692 )
      ( MAKE-6PILE ?auto_75691 ?auto_75692 ?auto_75693 ?auto_75694 ?auto_75695 ?auto_75696 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_75698 - BLOCK
      ?auto_75699 - BLOCK
      ?auto_75700 - BLOCK
      ?auto_75701 - BLOCK
      ?auto_75702 - BLOCK
      ?auto_75703 - BLOCK
    )
    :vars
    (
      ?auto_75704 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75698 ?auto_75699 ) ) ( not ( = ?auto_75698 ?auto_75700 ) ) ( not ( = ?auto_75698 ?auto_75701 ) ) ( not ( = ?auto_75698 ?auto_75702 ) ) ( not ( = ?auto_75698 ?auto_75703 ) ) ( not ( = ?auto_75699 ?auto_75700 ) ) ( not ( = ?auto_75699 ?auto_75701 ) ) ( not ( = ?auto_75699 ?auto_75702 ) ) ( not ( = ?auto_75699 ?auto_75703 ) ) ( not ( = ?auto_75700 ?auto_75701 ) ) ( not ( = ?auto_75700 ?auto_75702 ) ) ( not ( = ?auto_75700 ?auto_75703 ) ) ( not ( = ?auto_75701 ?auto_75702 ) ) ( not ( = ?auto_75701 ?auto_75703 ) ) ( not ( = ?auto_75702 ?auto_75703 ) ) ( ON-TABLE ?auto_75703 ) ( ON ?auto_75702 ?auto_75703 ) ( ON ?auto_75698 ?auto_75704 ) ( not ( = ?auto_75698 ?auto_75704 ) ) ( not ( = ?auto_75699 ?auto_75704 ) ) ( not ( = ?auto_75700 ?auto_75704 ) ) ( not ( = ?auto_75701 ?auto_75704 ) ) ( not ( = ?auto_75702 ?auto_75704 ) ) ( not ( = ?auto_75703 ?auto_75704 ) ) ( ON ?auto_75699 ?auto_75698 ) ( ON-TABLE ?auto_75704 ) ( ON ?auto_75700 ?auto_75699 ) ( CLEAR ?auto_75700 ) ( HOLDING ?auto_75701 ) ( CLEAR ?auto_75702 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75703 ?auto_75702 ?auto_75701 )
      ( MAKE-6PILE ?auto_75698 ?auto_75699 ?auto_75700 ?auto_75701 ?auto_75702 ?auto_75703 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_75705 - BLOCK
      ?auto_75706 - BLOCK
      ?auto_75707 - BLOCK
      ?auto_75708 - BLOCK
      ?auto_75709 - BLOCK
      ?auto_75710 - BLOCK
    )
    :vars
    (
      ?auto_75711 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75705 ?auto_75706 ) ) ( not ( = ?auto_75705 ?auto_75707 ) ) ( not ( = ?auto_75705 ?auto_75708 ) ) ( not ( = ?auto_75705 ?auto_75709 ) ) ( not ( = ?auto_75705 ?auto_75710 ) ) ( not ( = ?auto_75706 ?auto_75707 ) ) ( not ( = ?auto_75706 ?auto_75708 ) ) ( not ( = ?auto_75706 ?auto_75709 ) ) ( not ( = ?auto_75706 ?auto_75710 ) ) ( not ( = ?auto_75707 ?auto_75708 ) ) ( not ( = ?auto_75707 ?auto_75709 ) ) ( not ( = ?auto_75707 ?auto_75710 ) ) ( not ( = ?auto_75708 ?auto_75709 ) ) ( not ( = ?auto_75708 ?auto_75710 ) ) ( not ( = ?auto_75709 ?auto_75710 ) ) ( ON-TABLE ?auto_75710 ) ( ON ?auto_75709 ?auto_75710 ) ( ON ?auto_75705 ?auto_75711 ) ( not ( = ?auto_75705 ?auto_75711 ) ) ( not ( = ?auto_75706 ?auto_75711 ) ) ( not ( = ?auto_75707 ?auto_75711 ) ) ( not ( = ?auto_75708 ?auto_75711 ) ) ( not ( = ?auto_75709 ?auto_75711 ) ) ( not ( = ?auto_75710 ?auto_75711 ) ) ( ON ?auto_75706 ?auto_75705 ) ( ON-TABLE ?auto_75711 ) ( ON ?auto_75707 ?auto_75706 ) ( CLEAR ?auto_75709 ) ( ON ?auto_75708 ?auto_75707 ) ( CLEAR ?auto_75708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_75711 ?auto_75705 ?auto_75706 ?auto_75707 )
      ( MAKE-6PILE ?auto_75705 ?auto_75706 ?auto_75707 ?auto_75708 ?auto_75709 ?auto_75710 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_75712 - BLOCK
      ?auto_75713 - BLOCK
      ?auto_75714 - BLOCK
      ?auto_75715 - BLOCK
      ?auto_75716 - BLOCK
      ?auto_75717 - BLOCK
    )
    :vars
    (
      ?auto_75718 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75712 ?auto_75713 ) ) ( not ( = ?auto_75712 ?auto_75714 ) ) ( not ( = ?auto_75712 ?auto_75715 ) ) ( not ( = ?auto_75712 ?auto_75716 ) ) ( not ( = ?auto_75712 ?auto_75717 ) ) ( not ( = ?auto_75713 ?auto_75714 ) ) ( not ( = ?auto_75713 ?auto_75715 ) ) ( not ( = ?auto_75713 ?auto_75716 ) ) ( not ( = ?auto_75713 ?auto_75717 ) ) ( not ( = ?auto_75714 ?auto_75715 ) ) ( not ( = ?auto_75714 ?auto_75716 ) ) ( not ( = ?auto_75714 ?auto_75717 ) ) ( not ( = ?auto_75715 ?auto_75716 ) ) ( not ( = ?auto_75715 ?auto_75717 ) ) ( not ( = ?auto_75716 ?auto_75717 ) ) ( ON-TABLE ?auto_75717 ) ( ON ?auto_75712 ?auto_75718 ) ( not ( = ?auto_75712 ?auto_75718 ) ) ( not ( = ?auto_75713 ?auto_75718 ) ) ( not ( = ?auto_75714 ?auto_75718 ) ) ( not ( = ?auto_75715 ?auto_75718 ) ) ( not ( = ?auto_75716 ?auto_75718 ) ) ( not ( = ?auto_75717 ?auto_75718 ) ) ( ON ?auto_75713 ?auto_75712 ) ( ON-TABLE ?auto_75718 ) ( ON ?auto_75714 ?auto_75713 ) ( ON ?auto_75715 ?auto_75714 ) ( CLEAR ?auto_75715 ) ( HOLDING ?auto_75716 ) ( CLEAR ?auto_75717 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75717 ?auto_75716 )
      ( MAKE-6PILE ?auto_75712 ?auto_75713 ?auto_75714 ?auto_75715 ?auto_75716 ?auto_75717 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_75719 - BLOCK
      ?auto_75720 - BLOCK
      ?auto_75721 - BLOCK
      ?auto_75722 - BLOCK
      ?auto_75723 - BLOCK
      ?auto_75724 - BLOCK
    )
    :vars
    (
      ?auto_75725 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75719 ?auto_75720 ) ) ( not ( = ?auto_75719 ?auto_75721 ) ) ( not ( = ?auto_75719 ?auto_75722 ) ) ( not ( = ?auto_75719 ?auto_75723 ) ) ( not ( = ?auto_75719 ?auto_75724 ) ) ( not ( = ?auto_75720 ?auto_75721 ) ) ( not ( = ?auto_75720 ?auto_75722 ) ) ( not ( = ?auto_75720 ?auto_75723 ) ) ( not ( = ?auto_75720 ?auto_75724 ) ) ( not ( = ?auto_75721 ?auto_75722 ) ) ( not ( = ?auto_75721 ?auto_75723 ) ) ( not ( = ?auto_75721 ?auto_75724 ) ) ( not ( = ?auto_75722 ?auto_75723 ) ) ( not ( = ?auto_75722 ?auto_75724 ) ) ( not ( = ?auto_75723 ?auto_75724 ) ) ( ON-TABLE ?auto_75724 ) ( ON ?auto_75719 ?auto_75725 ) ( not ( = ?auto_75719 ?auto_75725 ) ) ( not ( = ?auto_75720 ?auto_75725 ) ) ( not ( = ?auto_75721 ?auto_75725 ) ) ( not ( = ?auto_75722 ?auto_75725 ) ) ( not ( = ?auto_75723 ?auto_75725 ) ) ( not ( = ?auto_75724 ?auto_75725 ) ) ( ON ?auto_75720 ?auto_75719 ) ( ON-TABLE ?auto_75725 ) ( ON ?auto_75721 ?auto_75720 ) ( ON ?auto_75722 ?auto_75721 ) ( CLEAR ?auto_75724 ) ( ON ?auto_75723 ?auto_75722 ) ( CLEAR ?auto_75723 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_75725 ?auto_75719 ?auto_75720 ?auto_75721 ?auto_75722 )
      ( MAKE-6PILE ?auto_75719 ?auto_75720 ?auto_75721 ?auto_75722 ?auto_75723 ?auto_75724 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_75726 - BLOCK
      ?auto_75727 - BLOCK
      ?auto_75728 - BLOCK
      ?auto_75729 - BLOCK
      ?auto_75730 - BLOCK
      ?auto_75731 - BLOCK
    )
    :vars
    (
      ?auto_75732 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75726 ?auto_75727 ) ) ( not ( = ?auto_75726 ?auto_75728 ) ) ( not ( = ?auto_75726 ?auto_75729 ) ) ( not ( = ?auto_75726 ?auto_75730 ) ) ( not ( = ?auto_75726 ?auto_75731 ) ) ( not ( = ?auto_75727 ?auto_75728 ) ) ( not ( = ?auto_75727 ?auto_75729 ) ) ( not ( = ?auto_75727 ?auto_75730 ) ) ( not ( = ?auto_75727 ?auto_75731 ) ) ( not ( = ?auto_75728 ?auto_75729 ) ) ( not ( = ?auto_75728 ?auto_75730 ) ) ( not ( = ?auto_75728 ?auto_75731 ) ) ( not ( = ?auto_75729 ?auto_75730 ) ) ( not ( = ?auto_75729 ?auto_75731 ) ) ( not ( = ?auto_75730 ?auto_75731 ) ) ( ON ?auto_75726 ?auto_75732 ) ( not ( = ?auto_75726 ?auto_75732 ) ) ( not ( = ?auto_75727 ?auto_75732 ) ) ( not ( = ?auto_75728 ?auto_75732 ) ) ( not ( = ?auto_75729 ?auto_75732 ) ) ( not ( = ?auto_75730 ?auto_75732 ) ) ( not ( = ?auto_75731 ?auto_75732 ) ) ( ON ?auto_75727 ?auto_75726 ) ( ON-TABLE ?auto_75732 ) ( ON ?auto_75728 ?auto_75727 ) ( ON ?auto_75729 ?auto_75728 ) ( ON ?auto_75730 ?auto_75729 ) ( CLEAR ?auto_75730 ) ( HOLDING ?auto_75731 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_75731 )
      ( MAKE-6PILE ?auto_75726 ?auto_75727 ?auto_75728 ?auto_75729 ?auto_75730 ?auto_75731 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_75733 - BLOCK
      ?auto_75734 - BLOCK
      ?auto_75735 - BLOCK
      ?auto_75736 - BLOCK
      ?auto_75737 - BLOCK
      ?auto_75738 - BLOCK
    )
    :vars
    (
      ?auto_75739 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75733 ?auto_75734 ) ) ( not ( = ?auto_75733 ?auto_75735 ) ) ( not ( = ?auto_75733 ?auto_75736 ) ) ( not ( = ?auto_75733 ?auto_75737 ) ) ( not ( = ?auto_75733 ?auto_75738 ) ) ( not ( = ?auto_75734 ?auto_75735 ) ) ( not ( = ?auto_75734 ?auto_75736 ) ) ( not ( = ?auto_75734 ?auto_75737 ) ) ( not ( = ?auto_75734 ?auto_75738 ) ) ( not ( = ?auto_75735 ?auto_75736 ) ) ( not ( = ?auto_75735 ?auto_75737 ) ) ( not ( = ?auto_75735 ?auto_75738 ) ) ( not ( = ?auto_75736 ?auto_75737 ) ) ( not ( = ?auto_75736 ?auto_75738 ) ) ( not ( = ?auto_75737 ?auto_75738 ) ) ( ON ?auto_75733 ?auto_75739 ) ( not ( = ?auto_75733 ?auto_75739 ) ) ( not ( = ?auto_75734 ?auto_75739 ) ) ( not ( = ?auto_75735 ?auto_75739 ) ) ( not ( = ?auto_75736 ?auto_75739 ) ) ( not ( = ?auto_75737 ?auto_75739 ) ) ( not ( = ?auto_75738 ?auto_75739 ) ) ( ON ?auto_75734 ?auto_75733 ) ( ON-TABLE ?auto_75739 ) ( ON ?auto_75735 ?auto_75734 ) ( ON ?auto_75736 ?auto_75735 ) ( ON ?auto_75737 ?auto_75736 ) ( ON ?auto_75738 ?auto_75737 ) ( CLEAR ?auto_75738 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_75739 ?auto_75733 ?auto_75734 ?auto_75735 ?auto_75736 ?auto_75737 )
      ( MAKE-6PILE ?auto_75733 ?auto_75734 ?auto_75735 ?auto_75736 ?auto_75737 ?auto_75738 ) )
  )

)

