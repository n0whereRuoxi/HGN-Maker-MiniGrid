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
      ?auto_108909 - BLOCK
    )
    :vars
    (
      ?auto_108910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108909 ?auto_108910 ) ( CLEAR ?auto_108909 ) ( HAND-EMPTY ) ( not ( = ?auto_108909 ?auto_108910 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_108909 ?auto_108910 )
      ( !PUTDOWN ?auto_108909 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_108912 - BLOCK
    )
    :vars
    (
      ?auto_108913 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108912 ?auto_108913 ) ( CLEAR ?auto_108912 ) ( HAND-EMPTY ) ( not ( = ?auto_108912 ?auto_108913 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_108912 ?auto_108913 )
      ( !PUTDOWN ?auto_108912 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_108916 - BLOCK
      ?auto_108917 - BLOCK
    )
    :vars
    (
      ?auto_108918 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_108916 ) ( ON ?auto_108917 ?auto_108918 ) ( CLEAR ?auto_108917 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_108916 ) ( not ( = ?auto_108916 ?auto_108917 ) ) ( not ( = ?auto_108916 ?auto_108918 ) ) ( not ( = ?auto_108917 ?auto_108918 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_108917 ?auto_108918 )
      ( !STACK ?auto_108917 ?auto_108916 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_108921 - BLOCK
      ?auto_108922 - BLOCK
    )
    :vars
    (
      ?auto_108923 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_108921 ) ( ON ?auto_108922 ?auto_108923 ) ( CLEAR ?auto_108922 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_108921 ) ( not ( = ?auto_108921 ?auto_108922 ) ) ( not ( = ?auto_108921 ?auto_108923 ) ) ( not ( = ?auto_108922 ?auto_108923 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_108922 ?auto_108923 )
      ( !STACK ?auto_108922 ?auto_108921 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_108926 - BLOCK
      ?auto_108927 - BLOCK
    )
    :vars
    (
      ?auto_108928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108927 ?auto_108928 ) ( not ( = ?auto_108926 ?auto_108927 ) ) ( not ( = ?auto_108926 ?auto_108928 ) ) ( not ( = ?auto_108927 ?auto_108928 ) ) ( ON ?auto_108926 ?auto_108927 ) ( CLEAR ?auto_108926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_108926 )
      ( MAKE-2PILE ?auto_108926 ?auto_108927 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_108931 - BLOCK
      ?auto_108932 - BLOCK
    )
    :vars
    (
      ?auto_108933 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108932 ?auto_108933 ) ( not ( = ?auto_108931 ?auto_108932 ) ) ( not ( = ?auto_108931 ?auto_108933 ) ) ( not ( = ?auto_108932 ?auto_108933 ) ) ( ON ?auto_108931 ?auto_108932 ) ( CLEAR ?auto_108931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_108931 )
      ( MAKE-2PILE ?auto_108931 ?auto_108932 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108937 - BLOCK
      ?auto_108938 - BLOCK
      ?auto_108939 - BLOCK
    )
    :vars
    (
      ?auto_108940 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_108938 ) ( ON ?auto_108939 ?auto_108940 ) ( CLEAR ?auto_108939 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_108937 ) ( ON ?auto_108938 ?auto_108937 ) ( not ( = ?auto_108937 ?auto_108938 ) ) ( not ( = ?auto_108937 ?auto_108939 ) ) ( not ( = ?auto_108937 ?auto_108940 ) ) ( not ( = ?auto_108938 ?auto_108939 ) ) ( not ( = ?auto_108938 ?auto_108940 ) ) ( not ( = ?auto_108939 ?auto_108940 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_108939 ?auto_108940 )
      ( !STACK ?auto_108939 ?auto_108938 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108944 - BLOCK
      ?auto_108945 - BLOCK
      ?auto_108946 - BLOCK
    )
    :vars
    (
      ?auto_108947 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_108945 ) ( ON ?auto_108946 ?auto_108947 ) ( CLEAR ?auto_108946 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_108944 ) ( ON ?auto_108945 ?auto_108944 ) ( not ( = ?auto_108944 ?auto_108945 ) ) ( not ( = ?auto_108944 ?auto_108946 ) ) ( not ( = ?auto_108944 ?auto_108947 ) ) ( not ( = ?auto_108945 ?auto_108946 ) ) ( not ( = ?auto_108945 ?auto_108947 ) ) ( not ( = ?auto_108946 ?auto_108947 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_108946 ?auto_108947 )
      ( !STACK ?auto_108946 ?auto_108945 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108951 - BLOCK
      ?auto_108952 - BLOCK
      ?auto_108953 - BLOCK
    )
    :vars
    (
      ?auto_108954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108953 ?auto_108954 ) ( ON-TABLE ?auto_108951 ) ( not ( = ?auto_108951 ?auto_108952 ) ) ( not ( = ?auto_108951 ?auto_108953 ) ) ( not ( = ?auto_108951 ?auto_108954 ) ) ( not ( = ?auto_108952 ?auto_108953 ) ) ( not ( = ?auto_108952 ?auto_108954 ) ) ( not ( = ?auto_108953 ?auto_108954 ) ) ( CLEAR ?auto_108951 ) ( ON ?auto_108952 ?auto_108953 ) ( CLEAR ?auto_108952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_108951 ?auto_108952 )
      ( MAKE-3PILE ?auto_108951 ?auto_108952 ?auto_108953 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108958 - BLOCK
      ?auto_108959 - BLOCK
      ?auto_108960 - BLOCK
    )
    :vars
    (
      ?auto_108961 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108960 ?auto_108961 ) ( ON-TABLE ?auto_108958 ) ( not ( = ?auto_108958 ?auto_108959 ) ) ( not ( = ?auto_108958 ?auto_108960 ) ) ( not ( = ?auto_108958 ?auto_108961 ) ) ( not ( = ?auto_108959 ?auto_108960 ) ) ( not ( = ?auto_108959 ?auto_108961 ) ) ( not ( = ?auto_108960 ?auto_108961 ) ) ( CLEAR ?auto_108958 ) ( ON ?auto_108959 ?auto_108960 ) ( CLEAR ?auto_108959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_108958 ?auto_108959 )
      ( MAKE-3PILE ?auto_108958 ?auto_108959 ?auto_108960 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108965 - BLOCK
      ?auto_108966 - BLOCK
      ?auto_108967 - BLOCK
    )
    :vars
    (
      ?auto_108968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108967 ?auto_108968 ) ( not ( = ?auto_108965 ?auto_108966 ) ) ( not ( = ?auto_108965 ?auto_108967 ) ) ( not ( = ?auto_108965 ?auto_108968 ) ) ( not ( = ?auto_108966 ?auto_108967 ) ) ( not ( = ?auto_108966 ?auto_108968 ) ) ( not ( = ?auto_108967 ?auto_108968 ) ) ( ON ?auto_108966 ?auto_108967 ) ( ON ?auto_108965 ?auto_108966 ) ( CLEAR ?auto_108965 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_108965 )
      ( MAKE-3PILE ?auto_108965 ?auto_108966 ?auto_108967 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108972 - BLOCK
      ?auto_108973 - BLOCK
      ?auto_108974 - BLOCK
    )
    :vars
    (
      ?auto_108975 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108974 ?auto_108975 ) ( not ( = ?auto_108972 ?auto_108973 ) ) ( not ( = ?auto_108972 ?auto_108974 ) ) ( not ( = ?auto_108972 ?auto_108975 ) ) ( not ( = ?auto_108973 ?auto_108974 ) ) ( not ( = ?auto_108973 ?auto_108975 ) ) ( not ( = ?auto_108974 ?auto_108975 ) ) ( ON ?auto_108973 ?auto_108974 ) ( ON ?auto_108972 ?auto_108973 ) ( CLEAR ?auto_108972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_108972 )
      ( MAKE-3PILE ?auto_108972 ?auto_108973 ?auto_108974 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108980 - BLOCK
      ?auto_108981 - BLOCK
      ?auto_108982 - BLOCK
      ?auto_108983 - BLOCK
    )
    :vars
    (
      ?auto_108984 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_108982 ) ( ON ?auto_108983 ?auto_108984 ) ( CLEAR ?auto_108983 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_108980 ) ( ON ?auto_108981 ?auto_108980 ) ( ON ?auto_108982 ?auto_108981 ) ( not ( = ?auto_108980 ?auto_108981 ) ) ( not ( = ?auto_108980 ?auto_108982 ) ) ( not ( = ?auto_108980 ?auto_108983 ) ) ( not ( = ?auto_108980 ?auto_108984 ) ) ( not ( = ?auto_108981 ?auto_108982 ) ) ( not ( = ?auto_108981 ?auto_108983 ) ) ( not ( = ?auto_108981 ?auto_108984 ) ) ( not ( = ?auto_108982 ?auto_108983 ) ) ( not ( = ?auto_108982 ?auto_108984 ) ) ( not ( = ?auto_108983 ?auto_108984 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_108983 ?auto_108984 )
      ( !STACK ?auto_108983 ?auto_108982 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108989 - BLOCK
      ?auto_108990 - BLOCK
      ?auto_108991 - BLOCK
      ?auto_108992 - BLOCK
    )
    :vars
    (
      ?auto_108993 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_108991 ) ( ON ?auto_108992 ?auto_108993 ) ( CLEAR ?auto_108992 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_108989 ) ( ON ?auto_108990 ?auto_108989 ) ( ON ?auto_108991 ?auto_108990 ) ( not ( = ?auto_108989 ?auto_108990 ) ) ( not ( = ?auto_108989 ?auto_108991 ) ) ( not ( = ?auto_108989 ?auto_108992 ) ) ( not ( = ?auto_108989 ?auto_108993 ) ) ( not ( = ?auto_108990 ?auto_108991 ) ) ( not ( = ?auto_108990 ?auto_108992 ) ) ( not ( = ?auto_108990 ?auto_108993 ) ) ( not ( = ?auto_108991 ?auto_108992 ) ) ( not ( = ?auto_108991 ?auto_108993 ) ) ( not ( = ?auto_108992 ?auto_108993 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_108992 ?auto_108993 )
      ( !STACK ?auto_108992 ?auto_108991 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108998 - BLOCK
      ?auto_108999 - BLOCK
      ?auto_109000 - BLOCK
      ?auto_109001 - BLOCK
    )
    :vars
    (
      ?auto_109002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109001 ?auto_109002 ) ( ON-TABLE ?auto_108998 ) ( ON ?auto_108999 ?auto_108998 ) ( not ( = ?auto_108998 ?auto_108999 ) ) ( not ( = ?auto_108998 ?auto_109000 ) ) ( not ( = ?auto_108998 ?auto_109001 ) ) ( not ( = ?auto_108998 ?auto_109002 ) ) ( not ( = ?auto_108999 ?auto_109000 ) ) ( not ( = ?auto_108999 ?auto_109001 ) ) ( not ( = ?auto_108999 ?auto_109002 ) ) ( not ( = ?auto_109000 ?auto_109001 ) ) ( not ( = ?auto_109000 ?auto_109002 ) ) ( not ( = ?auto_109001 ?auto_109002 ) ) ( CLEAR ?auto_108999 ) ( ON ?auto_109000 ?auto_109001 ) ( CLEAR ?auto_109000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_108998 ?auto_108999 ?auto_109000 )
      ( MAKE-4PILE ?auto_108998 ?auto_108999 ?auto_109000 ?auto_109001 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_109007 - BLOCK
      ?auto_109008 - BLOCK
      ?auto_109009 - BLOCK
      ?auto_109010 - BLOCK
    )
    :vars
    (
      ?auto_109011 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109010 ?auto_109011 ) ( ON-TABLE ?auto_109007 ) ( ON ?auto_109008 ?auto_109007 ) ( not ( = ?auto_109007 ?auto_109008 ) ) ( not ( = ?auto_109007 ?auto_109009 ) ) ( not ( = ?auto_109007 ?auto_109010 ) ) ( not ( = ?auto_109007 ?auto_109011 ) ) ( not ( = ?auto_109008 ?auto_109009 ) ) ( not ( = ?auto_109008 ?auto_109010 ) ) ( not ( = ?auto_109008 ?auto_109011 ) ) ( not ( = ?auto_109009 ?auto_109010 ) ) ( not ( = ?auto_109009 ?auto_109011 ) ) ( not ( = ?auto_109010 ?auto_109011 ) ) ( CLEAR ?auto_109008 ) ( ON ?auto_109009 ?auto_109010 ) ( CLEAR ?auto_109009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109007 ?auto_109008 ?auto_109009 )
      ( MAKE-4PILE ?auto_109007 ?auto_109008 ?auto_109009 ?auto_109010 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_109016 - BLOCK
      ?auto_109017 - BLOCK
      ?auto_109018 - BLOCK
      ?auto_109019 - BLOCK
    )
    :vars
    (
      ?auto_109020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109019 ?auto_109020 ) ( ON-TABLE ?auto_109016 ) ( not ( = ?auto_109016 ?auto_109017 ) ) ( not ( = ?auto_109016 ?auto_109018 ) ) ( not ( = ?auto_109016 ?auto_109019 ) ) ( not ( = ?auto_109016 ?auto_109020 ) ) ( not ( = ?auto_109017 ?auto_109018 ) ) ( not ( = ?auto_109017 ?auto_109019 ) ) ( not ( = ?auto_109017 ?auto_109020 ) ) ( not ( = ?auto_109018 ?auto_109019 ) ) ( not ( = ?auto_109018 ?auto_109020 ) ) ( not ( = ?auto_109019 ?auto_109020 ) ) ( ON ?auto_109018 ?auto_109019 ) ( CLEAR ?auto_109016 ) ( ON ?auto_109017 ?auto_109018 ) ( CLEAR ?auto_109017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_109016 ?auto_109017 )
      ( MAKE-4PILE ?auto_109016 ?auto_109017 ?auto_109018 ?auto_109019 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_109025 - BLOCK
      ?auto_109026 - BLOCK
      ?auto_109027 - BLOCK
      ?auto_109028 - BLOCK
    )
    :vars
    (
      ?auto_109029 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109028 ?auto_109029 ) ( ON-TABLE ?auto_109025 ) ( not ( = ?auto_109025 ?auto_109026 ) ) ( not ( = ?auto_109025 ?auto_109027 ) ) ( not ( = ?auto_109025 ?auto_109028 ) ) ( not ( = ?auto_109025 ?auto_109029 ) ) ( not ( = ?auto_109026 ?auto_109027 ) ) ( not ( = ?auto_109026 ?auto_109028 ) ) ( not ( = ?auto_109026 ?auto_109029 ) ) ( not ( = ?auto_109027 ?auto_109028 ) ) ( not ( = ?auto_109027 ?auto_109029 ) ) ( not ( = ?auto_109028 ?auto_109029 ) ) ( ON ?auto_109027 ?auto_109028 ) ( CLEAR ?auto_109025 ) ( ON ?auto_109026 ?auto_109027 ) ( CLEAR ?auto_109026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_109025 ?auto_109026 )
      ( MAKE-4PILE ?auto_109025 ?auto_109026 ?auto_109027 ?auto_109028 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_109034 - BLOCK
      ?auto_109035 - BLOCK
      ?auto_109036 - BLOCK
      ?auto_109037 - BLOCK
    )
    :vars
    (
      ?auto_109038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109037 ?auto_109038 ) ( not ( = ?auto_109034 ?auto_109035 ) ) ( not ( = ?auto_109034 ?auto_109036 ) ) ( not ( = ?auto_109034 ?auto_109037 ) ) ( not ( = ?auto_109034 ?auto_109038 ) ) ( not ( = ?auto_109035 ?auto_109036 ) ) ( not ( = ?auto_109035 ?auto_109037 ) ) ( not ( = ?auto_109035 ?auto_109038 ) ) ( not ( = ?auto_109036 ?auto_109037 ) ) ( not ( = ?auto_109036 ?auto_109038 ) ) ( not ( = ?auto_109037 ?auto_109038 ) ) ( ON ?auto_109036 ?auto_109037 ) ( ON ?auto_109035 ?auto_109036 ) ( ON ?auto_109034 ?auto_109035 ) ( CLEAR ?auto_109034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_109034 )
      ( MAKE-4PILE ?auto_109034 ?auto_109035 ?auto_109036 ?auto_109037 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_109043 - BLOCK
      ?auto_109044 - BLOCK
      ?auto_109045 - BLOCK
      ?auto_109046 - BLOCK
    )
    :vars
    (
      ?auto_109047 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109046 ?auto_109047 ) ( not ( = ?auto_109043 ?auto_109044 ) ) ( not ( = ?auto_109043 ?auto_109045 ) ) ( not ( = ?auto_109043 ?auto_109046 ) ) ( not ( = ?auto_109043 ?auto_109047 ) ) ( not ( = ?auto_109044 ?auto_109045 ) ) ( not ( = ?auto_109044 ?auto_109046 ) ) ( not ( = ?auto_109044 ?auto_109047 ) ) ( not ( = ?auto_109045 ?auto_109046 ) ) ( not ( = ?auto_109045 ?auto_109047 ) ) ( not ( = ?auto_109046 ?auto_109047 ) ) ( ON ?auto_109045 ?auto_109046 ) ( ON ?auto_109044 ?auto_109045 ) ( ON ?auto_109043 ?auto_109044 ) ( CLEAR ?auto_109043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_109043 )
      ( MAKE-4PILE ?auto_109043 ?auto_109044 ?auto_109045 ?auto_109046 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109053 - BLOCK
      ?auto_109054 - BLOCK
      ?auto_109055 - BLOCK
      ?auto_109056 - BLOCK
      ?auto_109057 - BLOCK
    )
    :vars
    (
      ?auto_109058 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_109056 ) ( ON ?auto_109057 ?auto_109058 ) ( CLEAR ?auto_109057 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_109053 ) ( ON ?auto_109054 ?auto_109053 ) ( ON ?auto_109055 ?auto_109054 ) ( ON ?auto_109056 ?auto_109055 ) ( not ( = ?auto_109053 ?auto_109054 ) ) ( not ( = ?auto_109053 ?auto_109055 ) ) ( not ( = ?auto_109053 ?auto_109056 ) ) ( not ( = ?auto_109053 ?auto_109057 ) ) ( not ( = ?auto_109053 ?auto_109058 ) ) ( not ( = ?auto_109054 ?auto_109055 ) ) ( not ( = ?auto_109054 ?auto_109056 ) ) ( not ( = ?auto_109054 ?auto_109057 ) ) ( not ( = ?auto_109054 ?auto_109058 ) ) ( not ( = ?auto_109055 ?auto_109056 ) ) ( not ( = ?auto_109055 ?auto_109057 ) ) ( not ( = ?auto_109055 ?auto_109058 ) ) ( not ( = ?auto_109056 ?auto_109057 ) ) ( not ( = ?auto_109056 ?auto_109058 ) ) ( not ( = ?auto_109057 ?auto_109058 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_109057 ?auto_109058 )
      ( !STACK ?auto_109057 ?auto_109056 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109064 - BLOCK
      ?auto_109065 - BLOCK
      ?auto_109066 - BLOCK
      ?auto_109067 - BLOCK
      ?auto_109068 - BLOCK
    )
    :vars
    (
      ?auto_109069 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_109067 ) ( ON ?auto_109068 ?auto_109069 ) ( CLEAR ?auto_109068 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_109064 ) ( ON ?auto_109065 ?auto_109064 ) ( ON ?auto_109066 ?auto_109065 ) ( ON ?auto_109067 ?auto_109066 ) ( not ( = ?auto_109064 ?auto_109065 ) ) ( not ( = ?auto_109064 ?auto_109066 ) ) ( not ( = ?auto_109064 ?auto_109067 ) ) ( not ( = ?auto_109064 ?auto_109068 ) ) ( not ( = ?auto_109064 ?auto_109069 ) ) ( not ( = ?auto_109065 ?auto_109066 ) ) ( not ( = ?auto_109065 ?auto_109067 ) ) ( not ( = ?auto_109065 ?auto_109068 ) ) ( not ( = ?auto_109065 ?auto_109069 ) ) ( not ( = ?auto_109066 ?auto_109067 ) ) ( not ( = ?auto_109066 ?auto_109068 ) ) ( not ( = ?auto_109066 ?auto_109069 ) ) ( not ( = ?auto_109067 ?auto_109068 ) ) ( not ( = ?auto_109067 ?auto_109069 ) ) ( not ( = ?auto_109068 ?auto_109069 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_109068 ?auto_109069 )
      ( !STACK ?auto_109068 ?auto_109067 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109075 - BLOCK
      ?auto_109076 - BLOCK
      ?auto_109077 - BLOCK
      ?auto_109078 - BLOCK
      ?auto_109079 - BLOCK
    )
    :vars
    (
      ?auto_109080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109079 ?auto_109080 ) ( ON-TABLE ?auto_109075 ) ( ON ?auto_109076 ?auto_109075 ) ( ON ?auto_109077 ?auto_109076 ) ( not ( = ?auto_109075 ?auto_109076 ) ) ( not ( = ?auto_109075 ?auto_109077 ) ) ( not ( = ?auto_109075 ?auto_109078 ) ) ( not ( = ?auto_109075 ?auto_109079 ) ) ( not ( = ?auto_109075 ?auto_109080 ) ) ( not ( = ?auto_109076 ?auto_109077 ) ) ( not ( = ?auto_109076 ?auto_109078 ) ) ( not ( = ?auto_109076 ?auto_109079 ) ) ( not ( = ?auto_109076 ?auto_109080 ) ) ( not ( = ?auto_109077 ?auto_109078 ) ) ( not ( = ?auto_109077 ?auto_109079 ) ) ( not ( = ?auto_109077 ?auto_109080 ) ) ( not ( = ?auto_109078 ?auto_109079 ) ) ( not ( = ?auto_109078 ?auto_109080 ) ) ( not ( = ?auto_109079 ?auto_109080 ) ) ( CLEAR ?auto_109077 ) ( ON ?auto_109078 ?auto_109079 ) ( CLEAR ?auto_109078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_109075 ?auto_109076 ?auto_109077 ?auto_109078 )
      ( MAKE-5PILE ?auto_109075 ?auto_109076 ?auto_109077 ?auto_109078 ?auto_109079 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109086 - BLOCK
      ?auto_109087 - BLOCK
      ?auto_109088 - BLOCK
      ?auto_109089 - BLOCK
      ?auto_109090 - BLOCK
    )
    :vars
    (
      ?auto_109091 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109090 ?auto_109091 ) ( ON-TABLE ?auto_109086 ) ( ON ?auto_109087 ?auto_109086 ) ( ON ?auto_109088 ?auto_109087 ) ( not ( = ?auto_109086 ?auto_109087 ) ) ( not ( = ?auto_109086 ?auto_109088 ) ) ( not ( = ?auto_109086 ?auto_109089 ) ) ( not ( = ?auto_109086 ?auto_109090 ) ) ( not ( = ?auto_109086 ?auto_109091 ) ) ( not ( = ?auto_109087 ?auto_109088 ) ) ( not ( = ?auto_109087 ?auto_109089 ) ) ( not ( = ?auto_109087 ?auto_109090 ) ) ( not ( = ?auto_109087 ?auto_109091 ) ) ( not ( = ?auto_109088 ?auto_109089 ) ) ( not ( = ?auto_109088 ?auto_109090 ) ) ( not ( = ?auto_109088 ?auto_109091 ) ) ( not ( = ?auto_109089 ?auto_109090 ) ) ( not ( = ?auto_109089 ?auto_109091 ) ) ( not ( = ?auto_109090 ?auto_109091 ) ) ( CLEAR ?auto_109088 ) ( ON ?auto_109089 ?auto_109090 ) ( CLEAR ?auto_109089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_109086 ?auto_109087 ?auto_109088 ?auto_109089 )
      ( MAKE-5PILE ?auto_109086 ?auto_109087 ?auto_109088 ?auto_109089 ?auto_109090 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109097 - BLOCK
      ?auto_109098 - BLOCK
      ?auto_109099 - BLOCK
      ?auto_109100 - BLOCK
      ?auto_109101 - BLOCK
    )
    :vars
    (
      ?auto_109102 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109101 ?auto_109102 ) ( ON-TABLE ?auto_109097 ) ( ON ?auto_109098 ?auto_109097 ) ( not ( = ?auto_109097 ?auto_109098 ) ) ( not ( = ?auto_109097 ?auto_109099 ) ) ( not ( = ?auto_109097 ?auto_109100 ) ) ( not ( = ?auto_109097 ?auto_109101 ) ) ( not ( = ?auto_109097 ?auto_109102 ) ) ( not ( = ?auto_109098 ?auto_109099 ) ) ( not ( = ?auto_109098 ?auto_109100 ) ) ( not ( = ?auto_109098 ?auto_109101 ) ) ( not ( = ?auto_109098 ?auto_109102 ) ) ( not ( = ?auto_109099 ?auto_109100 ) ) ( not ( = ?auto_109099 ?auto_109101 ) ) ( not ( = ?auto_109099 ?auto_109102 ) ) ( not ( = ?auto_109100 ?auto_109101 ) ) ( not ( = ?auto_109100 ?auto_109102 ) ) ( not ( = ?auto_109101 ?auto_109102 ) ) ( ON ?auto_109100 ?auto_109101 ) ( CLEAR ?auto_109098 ) ( ON ?auto_109099 ?auto_109100 ) ( CLEAR ?auto_109099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109097 ?auto_109098 ?auto_109099 )
      ( MAKE-5PILE ?auto_109097 ?auto_109098 ?auto_109099 ?auto_109100 ?auto_109101 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109108 - BLOCK
      ?auto_109109 - BLOCK
      ?auto_109110 - BLOCK
      ?auto_109111 - BLOCK
      ?auto_109112 - BLOCK
    )
    :vars
    (
      ?auto_109113 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109112 ?auto_109113 ) ( ON-TABLE ?auto_109108 ) ( ON ?auto_109109 ?auto_109108 ) ( not ( = ?auto_109108 ?auto_109109 ) ) ( not ( = ?auto_109108 ?auto_109110 ) ) ( not ( = ?auto_109108 ?auto_109111 ) ) ( not ( = ?auto_109108 ?auto_109112 ) ) ( not ( = ?auto_109108 ?auto_109113 ) ) ( not ( = ?auto_109109 ?auto_109110 ) ) ( not ( = ?auto_109109 ?auto_109111 ) ) ( not ( = ?auto_109109 ?auto_109112 ) ) ( not ( = ?auto_109109 ?auto_109113 ) ) ( not ( = ?auto_109110 ?auto_109111 ) ) ( not ( = ?auto_109110 ?auto_109112 ) ) ( not ( = ?auto_109110 ?auto_109113 ) ) ( not ( = ?auto_109111 ?auto_109112 ) ) ( not ( = ?auto_109111 ?auto_109113 ) ) ( not ( = ?auto_109112 ?auto_109113 ) ) ( ON ?auto_109111 ?auto_109112 ) ( CLEAR ?auto_109109 ) ( ON ?auto_109110 ?auto_109111 ) ( CLEAR ?auto_109110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109108 ?auto_109109 ?auto_109110 )
      ( MAKE-5PILE ?auto_109108 ?auto_109109 ?auto_109110 ?auto_109111 ?auto_109112 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109119 - BLOCK
      ?auto_109120 - BLOCK
      ?auto_109121 - BLOCK
      ?auto_109122 - BLOCK
      ?auto_109123 - BLOCK
    )
    :vars
    (
      ?auto_109124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109123 ?auto_109124 ) ( ON-TABLE ?auto_109119 ) ( not ( = ?auto_109119 ?auto_109120 ) ) ( not ( = ?auto_109119 ?auto_109121 ) ) ( not ( = ?auto_109119 ?auto_109122 ) ) ( not ( = ?auto_109119 ?auto_109123 ) ) ( not ( = ?auto_109119 ?auto_109124 ) ) ( not ( = ?auto_109120 ?auto_109121 ) ) ( not ( = ?auto_109120 ?auto_109122 ) ) ( not ( = ?auto_109120 ?auto_109123 ) ) ( not ( = ?auto_109120 ?auto_109124 ) ) ( not ( = ?auto_109121 ?auto_109122 ) ) ( not ( = ?auto_109121 ?auto_109123 ) ) ( not ( = ?auto_109121 ?auto_109124 ) ) ( not ( = ?auto_109122 ?auto_109123 ) ) ( not ( = ?auto_109122 ?auto_109124 ) ) ( not ( = ?auto_109123 ?auto_109124 ) ) ( ON ?auto_109122 ?auto_109123 ) ( ON ?auto_109121 ?auto_109122 ) ( CLEAR ?auto_109119 ) ( ON ?auto_109120 ?auto_109121 ) ( CLEAR ?auto_109120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_109119 ?auto_109120 )
      ( MAKE-5PILE ?auto_109119 ?auto_109120 ?auto_109121 ?auto_109122 ?auto_109123 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109130 - BLOCK
      ?auto_109131 - BLOCK
      ?auto_109132 - BLOCK
      ?auto_109133 - BLOCK
      ?auto_109134 - BLOCK
    )
    :vars
    (
      ?auto_109135 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109134 ?auto_109135 ) ( ON-TABLE ?auto_109130 ) ( not ( = ?auto_109130 ?auto_109131 ) ) ( not ( = ?auto_109130 ?auto_109132 ) ) ( not ( = ?auto_109130 ?auto_109133 ) ) ( not ( = ?auto_109130 ?auto_109134 ) ) ( not ( = ?auto_109130 ?auto_109135 ) ) ( not ( = ?auto_109131 ?auto_109132 ) ) ( not ( = ?auto_109131 ?auto_109133 ) ) ( not ( = ?auto_109131 ?auto_109134 ) ) ( not ( = ?auto_109131 ?auto_109135 ) ) ( not ( = ?auto_109132 ?auto_109133 ) ) ( not ( = ?auto_109132 ?auto_109134 ) ) ( not ( = ?auto_109132 ?auto_109135 ) ) ( not ( = ?auto_109133 ?auto_109134 ) ) ( not ( = ?auto_109133 ?auto_109135 ) ) ( not ( = ?auto_109134 ?auto_109135 ) ) ( ON ?auto_109133 ?auto_109134 ) ( ON ?auto_109132 ?auto_109133 ) ( CLEAR ?auto_109130 ) ( ON ?auto_109131 ?auto_109132 ) ( CLEAR ?auto_109131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_109130 ?auto_109131 )
      ( MAKE-5PILE ?auto_109130 ?auto_109131 ?auto_109132 ?auto_109133 ?auto_109134 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109141 - BLOCK
      ?auto_109142 - BLOCK
      ?auto_109143 - BLOCK
      ?auto_109144 - BLOCK
      ?auto_109145 - BLOCK
    )
    :vars
    (
      ?auto_109146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109145 ?auto_109146 ) ( not ( = ?auto_109141 ?auto_109142 ) ) ( not ( = ?auto_109141 ?auto_109143 ) ) ( not ( = ?auto_109141 ?auto_109144 ) ) ( not ( = ?auto_109141 ?auto_109145 ) ) ( not ( = ?auto_109141 ?auto_109146 ) ) ( not ( = ?auto_109142 ?auto_109143 ) ) ( not ( = ?auto_109142 ?auto_109144 ) ) ( not ( = ?auto_109142 ?auto_109145 ) ) ( not ( = ?auto_109142 ?auto_109146 ) ) ( not ( = ?auto_109143 ?auto_109144 ) ) ( not ( = ?auto_109143 ?auto_109145 ) ) ( not ( = ?auto_109143 ?auto_109146 ) ) ( not ( = ?auto_109144 ?auto_109145 ) ) ( not ( = ?auto_109144 ?auto_109146 ) ) ( not ( = ?auto_109145 ?auto_109146 ) ) ( ON ?auto_109144 ?auto_109145 ) ( ON ?auto_109143 ?auto_109144 ) ( ON ?auto_109142 ?auto_109143 ) ( ON ?auto_109141 ?auto_109142 ) ( CLEAR ?auto_109141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_109141 )
      ( MAKE-5PILE ?auto_109141 ?auto_109142 ?auto_109143 ?auto_109144 ?auto_109145 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109152 - BLOCK
      ?auto_109153 - BLOCK
      ?auto_109154 - BLOCK
      ?auto_109155 - BLOCK
      ?auto_109156 - BLOCK
    )
    :vars
    (
      ?auto_109157 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109156 ?auto_109157 ) ( not ( = ?auto_109152 ?auto_109153 ) ) ( not ( = ?auto_109152 ?auto_109154 ) ) ( not ( = ?auto_109152 ?auto_109155 ) ) ( not ( = ?auto_109152 ?auto_109156 ) ) ( not ( = ?auto_109152 ?auto_109157 ) ) ( not ( = ?auto_109153 ?auto_109154 ) ) ( not ( = ?auto_109153 ?auto_109155 ) ) ( not ( = ?auto_109153 ?auto_109156 ) ) ( not ( = ?auto_109153 ?auto_109157 ) ) ( not ( = ?auto_109154 ?auto_109155 ) ) ( not ( = ?auto_109154 ?auto_109156 ) ) ( not ( = ?auto_109154 ?auto_109157 ) ) ( not ( = ?auto_109155 ?auto_109156 ) ) ( not ( = ?auto_109155 ?auto_109157 ) ) ( not ( = ?auto_109156 ?auto_109157 ) ) ( ON ?auto_109155 ?auto_109156 ) ( ON ?auto_109154 ?auto_109155 ) ( ON ?auto_109153 ?auto_109154 ) ( ON ?auto_109152 ?auto_109153 ) ( CLEAR ?auto_109152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_109152 )
      ( MAKE-5PILE ?auto_109152 ?auto_109153 ?auto_109154 ?auto_109155 ?auto_109156 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109164 - BLOCK
      ?auto_109165 - BLOCK
      ?auto_109166 - BLOCK
      ?auto_109167 - BLOCK
      ?auto_109168 - BLOCK
      ?auto_109169 - BLOCK
    )
    :vars
    (
      ?auto_109170 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_109168 ) ( ON ?auto_109169 ?auto_109170 ) ( CLEAR ?auto_109169 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_109164 ) ( ON ?auto_109165 ?auto_109164 ) ( ON ?auto_109166 ?auto_109165 ) ( ON ?auto_109167 ?auto_109166 ) ( ON ?auto_109168 ?auto_109167 ) ( not ( = ?auto_109164 ?auto_109165 ) ) ( not ( = ?auto_109164 ?auto_109166 ) ) ( not ( = ?auto_109164 ?auto_109167 ) ) ( not ( = ?auto_109164 ?auto_109168 ) ) ( not ( = ?auto_109164 ?auto_109169 ) ) ( not ( = ?auto_109164 ?auto_109170 ) ) ( not ( = ?auto_109165 ?auto_109166 ) ) ( not ( = ?auto_109165 ?auto_109167 ) ) ( not ( = ?auto_109165 ?auto_109168 ) ) ( not ( = ?auto_109165 ?auto_109169 ) ) ( not ( = ?auto_109165 ?auto_109170 ) ) ( not ( = ?auto_109166 ?auto_109167 ) ) ( not ( = ?auto_109166 ?auto_109168 ) ) ( not ( = ?auto_109166 ?auto_109169 ) ) ( not ( = ?auto_109166 ?auto_109170 ) ) ( not ( = ?auto_109167 ?auto_109168 ) ) ( not ( = ?auto_109167 ?auto_109169 ) ) ( not ( = ?auto_109167 ?auto_109170 ) ) ( not ( = ?auto_109168 ?auto_109169 ) ) ( not ( = ?auto_109168 ?auto_109170 ) ) ( not ( = ?auto_109169 ?auto_109170 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_109169 ?auto_109170 )
      ( !STACK ?auto_109169 ?auto_109168 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109177 - BLOCK
      ?auto_109178 - BLOCK
      ?auto_109179 - BLOCK
      ?auto_109180 - BLOCK
      ?auto_109181 - BLOCK
      ?auto_109182 - BLOCK
    )
    :vars
    (
      ?auto_109183 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_109181 ) ( ON ?auto_109182 ?auto_109183 ) ( CLEAR ?auto_109182 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_109177 ) ( ON ?auto_109178 ?auto_109177 ) ( ON ?auto_109179 ?auto_109178 ) ( ON ?auto_109180 ?auto_109179 ) ( ON ?auto_109181 ?auto_109180 ) ( not ( = ?auto_109177 ?auto_109178 ) ) ( not ( = ?auto_109177 ?auto_109179 ) ) ( not ( = ?auto_109177 ?auto_109180 ) ) ( not ( = ?auto_109177 ?auto_109181 ) ) ( not ( = ?auto_109177 ?auto_109182 ) ) ( not ( = ?auto_109177 ?auto_109183 ) ) ( not ( = ?auto_109178 ?auto_109179 ) ) ( not ( = ?auto_109178 ?auto_109180 ) ) ( not ( = ?auto_109178 ?auto_109181 ) ) ( not ( = ?auto_109178 ?auto_109182 ) ) ( not ( = ?auto_109178 ?auto_109183 ) ) ( not ( = ?auto_109179 ?auto_109180 ) ) ( not ( = ?auto_109179 ?auto_109181 ) ) ( not ( = ?auto_109179 ?auto_109182 ) ) ( not ( = ?auto_109179 ?auto_109183 ) ) ( not ( = ?auto_109180 ?auto_109181 ) ) ( not ( = ?auto_109180 ?auto_109182 ) ) ( not ( = ?auto_109180 ?auto_109183 ) ) ( not ( = ?auto_109181 ?auto_109182 ) ) ( not ( = ?auto_109181 ?auto_109183 ) ) ( not ( = ?auto_109182 ?auto_109183 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_109182 ?auto_109183 )
      ( !STACK ?auto_109182 ?auto_109181 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109190 - BLOCK
      ?auto_109191 - BLOCK
      ?auto_109192 - BLOCK
      ?auto_109193 - BLOCK
      ?auto_109194 - BLOCK
      ?auto_109195 - BLOCK
    )
    :vars
    (
      ?auto_109196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109195 ?auto_109196 ) ( ON-TABLE ?auto_109190 ) ( ON ?auto_109191 ?auto_109190 ) ( ON ?auto_109192 ?auto_109191 ) ( ON ?auto_109193 ?auto_109192 ) ( not ( = ?auto_109190 ?auto_109191 ) ) ( not ( = ?auto_109190 ?auto_109192 ) ) ( not ( = ?auto_109190 ?auto_109193 ) ) ( not ( = ?auto_109190 ?auto_109194 ) ) ( not ( = ?auto_109190 ?auto_109195 ) ) ( not ( = ?auto_109190 ?auto_109196 ) ) ( not ( = ?auto_109191 ?auto_109192 ) ) ( not ( = ?auto_109191 ?auto_109193 ) ) ( not ( = ?auto_109191 ?auto_109194 ) ) ( not ( = ?auto_109191 ?auto_109195 ) ) ( not ( = ?auto_109191 ?auto_109196 ) ) ( not ( = ?auto_109192 ?auto_109193 ) ) ( not ( = ?auto_109192 ?auto_109194 ) ) ( not ( = ?auto_109192 ?auto_109195 ) ) ( not ( = ?auto_109192 ?auto_109196 ) ) ( not ( = ?auto_109193 ?auto_109194 ) ) ( not ( = ?auto_109193 ?auto_109195 ) ) ( not ( = ?auto_109193 ?auto_109196 ) ) ( not ( = ?auto_109194 ?auto_109195 ) ) ( not ( = ?auto_109194 ?auto_109196 ) ) ( not ( = ?auto_109195 ?auto_109196 ) ) ( CLEAR ?auto_109193 ) ( ON ?auto_109194 ?auto_109195 ) ( CLEAR ?auto_109194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_109190 ?auto_109191 ?auto_109192 ?auto_109193 ?auto_109194 )
      ( MAKE-6PILE ?auto_109190 ?auto_109191 ?auto_109192 ?auto_109193 ?auto_109194 ?auto_109195 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109203 - BLOCK
      ?auto_109204 - BLOCK
      ?auto_109205 - BLOCK
      ?auto_109206 - BLOCK
      ?auto_109207 - BLOCK
      ?auto_109208 - BLOCK
    )
    :vars
    (
      ?auto_109209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109208 ?auto_109209 ) ( ON-TABLE ?auto_109203 ) ( ON ?auto_109204 ?auto_109203 ) ( ON ?auto_109205 ?auto_109204 ) ( ON ?auto_109206 ?auto_109205 ) ( not ( = ?auto_109203 ?auto_109204 ) ) ( not ( = ?auto_109203 ?auto_109205 ) ) ( not ( = ?auto_109203 ?auto_109206 ) ) ( not ( = ?auto_109203 ?auto_109207 ) ) ( not ( = ?auto_109203 ?auto_109208 ) ) ( not ( = ?auto_109203 ?auto_109209 ) ) ( not ( = ?auto_109204 ?auto_109205 ) ) ( not ( = ?auto_109204 ?auto_109206 ) ) ( not ( = ?auto_109204 ?auto_109207 ) ) ( not ( = ?auto_109204 ?auto_109208 ) ) ( not ( = ?auto_109204 ?auto_109209 ) ) ( not ( = ?auto_109205 ?auto_109206 ) ) ( not ( = ?auto_109205 ?auto_109207 ) ) ( not ( = ?auto_109205 ?auto_109208 ) ) ( not ( = ?auto_109205 ?auto_109209 ) ) ( not ( = ?auto_109206 ?auto_109207 ) ) ( not ( = ?auto_109206 ?auto_109208 ) ) ( not ( = ?auto_109206 ?auto_109209 ) ) ( not ( = ?auto_109207 ?auto_109208 ) ) ( not ( = ?auto_109207 ?auto_109209 ) ) ( not ( = ?auto_109208 ?auto_109209 ) ) ( CLEAR ?auto_109206 ) ( ON ?auto_109207 ?auto_109208 ) ( CLEAR ?auto_109207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_109203 ?auto_109204 ?auto_109205 ?auto_109206 ?auto_109207 )
      ( MAKE-6PILE ?auto_109203 ?auto_109204 ?auto_109205 ?auto_109206 ?auto_109207 ?auto_109208 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109216 - BLOCK
      ?auto_109217 - BLOCK
      ?auto_109218 - BLOCK
      ?auto_109219 - BLOCK
      ?auto_109220 - BLOCK
      ?auto_109221 - BLOCK
    )
    :vars
    (
      ?auto_109222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109221 ?auto_109222 ) ( ON-TABLE ?auto_109216 ) ( ON ?auto_109217 ?auto_109216 ) ( ON ?auto_109218 ?auto_109217 ) ( not ( = ?auto_109216 ?auto_109217 ) ) ( not ( = ?auto_109216 ?auto_109218 ) ) ( not ( = ?auto_109216 ?auto_109219 ) ) ( not ( = ?auto_109216 ?auto_109220 ) ) ( not ( = ?auto_109216 ?auto_109221 ) ) ( not ( = ?auto_109216 ?auto_109222 ) ) ( not ( = ?auto_109217 ?auto_109218 ) ) ( not ( = ?auto_109217 ?auto_109219 ) ) ( not ( = ?auto_109217 ?auto_109220 ) ) ( not ( = ?auto_109217 ?auto_109221 ) ) ( not ( = ?auto_109217 ?auto_109222 ) ) ( not ( = ?auto_109218 ?auto_109219 ) ) ( not ( = ?auto_109218 ?auto_109220 ) ) ( not ( = ?auto_109218 ?auto_109221 ) ) ( not ( = ?auto_109218 ?auto_109222 ) ) ( not ( = ?auto_109219 ?auto_109220 ) ) ( not ( = ?auto_109219 ?auto_109221 ) ) ( not ( = ?auto_109219 ?auto_109222 ) ) ( not ( = ?auto_109220 ?auto_109221 ) ) ( not ( = ?auto_109220 ?auto_109222 ) ) ( not ( = ?auto_109221 ?auto_109222 ) ) ( ON ?auto_109220 ?auto_109221 ) ( CLEAR ?auto_109218 ) ( ON ?auto_109219 ?auto_109220 ) ( CLEAR ?auto_109219 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_109216 ?auto_109217 ?auto_109218 ?auto_109219 )
      ( MAKE-6PILE ?auto_109216 ?auto_109217 ?auto_109218 ?auto_109219 ?auto_109220 ?auto_109221 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109229 - BLOCK
      ?auto_109230 - BLOCK
      ?auto_109231 - BLOCK
      ?auto_109232 - BLOCK
      ?auto_109233 - BLOCK
      ?auto_109234 - BLOCK
    )
    :vars
    (
      ?auto_109235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109234 ?auto_109235 ) ( ON-TABLE ?auto_109229 ) ( ON ?auto_109230 ?auto_109229 ) ( ON ?auto_109231 ?auto_109230 ) ( not ( = ?auto_109229 ?auto_109230 ) ) ( not ( = ?auto_109229 ?auto_109231 ) ) ( not ( = ?auto_109229 ?auto_109232 ) ) ( not ( = ?auto_109229 ?auto_109233 ) ) ( not ( = ?auto_109229 ?auto_109234 ) ) ( not ( = ?auto_109229 ?auto_109235 ) ) ( not ( = ?auto_109230 ?auto_109231 ) ) ( not ( = ?auto_109230 ?auto_109232 ) ) ( not ( = ?auto_109230 ?auto_109233 ) ) ( not ( = ?auto_109230 ?auto_109234 ) ) ( not ( = ?auto_109230 ?auto_109235 ) ) ( not ( = ?auto_109231 ?auto_109232 ) ) ( not ( = ?auto_109231 ?auto_109233 ) ) ( not ( = ?auto_109231 ?auto_109234 ) ) ( not ( = ?auto_109231 ?auto_109235 ) ) ( not ( = ?auto_109232 ?auto_109233 ) ) ( not ( = ?auto_109232 ?auto_109234 ) ) ( not ( = ?auto_109232 ?auto_109235 ) ) ( not ( = ?auto_109233 ?auto_109234 ) ) ( not ( = ?auto_109233 ?auto_109235 ) ) ( not ( = ?auto_109234 ?auto_109235 ) ) ( ON ?auto_109233 ?auto_109234 ) ( CLEAR ?auto_109231 ) ( ON ?auto_109232 ?auto_109233 ) ( CLEAR ?auto_109232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_109229 ?auto_109230 ?auto_109231 ?auto_109232 )
      ( MAKE-6PILE ?auto_109229 ?auto_109230 ?auto_109231 ?auto_109232 ?auto_109233 ?auto_109234 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109242 - BLOCK
      ?auto_109243 - BLOCK
      ?auto_109244 - BLOCK
      ?auto_109245 - BLOCK
      ?auto_109246 - BLOCK
      ?auto_109247 - BLOCK
    )
    :vars
    (
      ?auto_109248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109247 ?auto_109248 ) ( ON-TABLE ?auto_109242 ) ( ON ?auto_109243 ?auto_109242 ) ( not ( = ?auto_109242 ?auto_109243 ) ) ( not ( = ?auto_109242 ?auto_109244 ) ) ( not ( = ?auto_109242 ?auto_109245 ) ) ( not ( = ?auto_109242 ?auto_109246 ) ) ( not ( = ?auto_109242 ?auto_109247 ) ) ( not ( = ?auto_109242 ?auto_109248 ) ) ( not ( = ?auto_109243 ?auto_109244 ) ) ( not ( = ?auto_109243 ?auto_109245 ) ) ( not ( = ?auto_109243 ?auto_109246 ) ) ( not ( = ?auto_109243 ?auto_109247 ) ) ( not ( = ?auto_109243 ?auto_109248 ) ) ( not ( = ?auto_109244 ?auto_109245 ) ) ( not ( = ?auto_109244 ?auto_109246 ) ) ( not ( = ?auto_109244 ?auto_109247 ) ) ( not ( = ?auto_109244 ?auto_109248 ) ) ( not ( = ?auto_109245 ?auto_109246 ) ) ( not ( = ?auto_109245 ?auto_109247 ) ) ( not ( = ?auto_109245 ?auto_109248 ) ) ( not ( = ?auto_109246 ?auto_109247 ) ) ( not ( = ?auto_109246 ?auto_109248 ) ) ( not ( = ?auto_109247 ?auto_109248 ) ) ( ON ?auto_109246 ?auto_109247 ) ( ON ?auto_109245 ?auto_109246 ) ( CLEAR ?auto_109243 ) ( ON ?auto_109244 ?auto_109245 ) ( CLEAR ?auto_109244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109242 ?auto_109243 ?auto_109244 )
      ( MAKE-6PILE ?auto_109242 ?auto_109243 ?auto_109244 ?auto_109245 ?auto_109246 ?auto_109247 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109255 - BLOCK
      ?auto_109256 - BLOCK
      ?auto_109257 - BLOCK
      ?auto_109258 - BLOCK
      ?auto_109259 - BLOCK
      ?auto_109260 - BLOCK
    )
    :vars
    (
      ?auto_109261 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109260 ?auto_109261 ) ( ON-TABLE ?auto_109255 ) ( ON ?auto_109256 ?auto_109255 ) ( not ( = ?auto_109255 ?auto_109256 ) ) ( not ( = ?auto_109255 ?auto_109257 ) ) ( not ( = ?auto_109255 ?auto_109258 ) ) ( not ( = ?auto_109255 ?auto_109259 ) ) ( not ( = ?auto_109255 ?auto_109260 ) ) ( not ( = ?auto_109255 ?auto_109261 ) ) ( not ( = ?auto_109256 ?auto_109257 ) ) ( not ( = ?auto_109256 ?auto_109258 ) ) ( not ( = ?auto_109256 ?auto_109259 ) ) ( not ( = ?auto_109256 ?auto_109260 ) ) ( not ( = ?auto_109256 ?auto_109261 ) ) ( not ( = ?auto_109257 ?auto_109258 ) ) ( not ( = ?auto_109257 ?auto_109259 ) ) ( not ( = ?auto_109257 ?auto_109260 ) ) ( not ( = ?auto_109257 ?auto_109261 ) ) ( not ( = ?auto_109258 ?auto_109259 ) ) ( not ( = ?auto_109258 ?auto_109260 ) ) ( not ( = ?auto_109258 ?auto_109261 ) ) ( not ( = ?auto_109259 ?auto_109260 ) ) ( not ( = ?auto_109259 ?auto_109261 ) ) ( not ( = ?auto_109260 ?auto_109261 ) ) ( ON ?auto_109259 ?auto_109260 ) ( ON ?auto_109258 ?auto_109259 ) ( CLEAR ?auto_109256 ) ( ON ?auto_109257 ?auto_109258 ) ( CLEAR ?auto_109257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109255 ?auto_109256 ?auto_109257 )
      ( MAKE-6PILE ?auto_109255 ?auto_109256 ?auto_109257 ?auto_109258 ?auto_109259 ?auto_109260 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109268 - BLOCK
      ?auto_109269 - BLOCK
      ?auto_109270 - BLOCK
      ?auto_109271 - BLOCK
      ?auto_109272 - BLOCK
      ?auto_109273 - BLOCK
    )
    :vars
    (
      ?auto_109274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109273 ?auto_109274 ) ( ON-TABLE ?auto_109268 ) ( not ( = ?auto_109268 ?auto_109269 ) ) ( not ( = ?auto_109268 ?auto_109270 ) ) ( not ( = ?auto_109268 ?auto_109271 ) ) ( not ( = ?auto_109268 ?auto_109272 ) ) ( not ( = ?auto_109268 ?auto_109273 ) ) ( not ( = ?auto_109268 ?auto_109274 ) ) ( not ( = ?auto_109269 ?auto_109270 ) ) ( not ( = ?auto_109269 ?auto_109271 ) ) ( not ( = ?auto_109269 ?auto_109272 ) ) ( not ( = ?auto_109269 ?auto_109273 ) ) ( not ( = ?auto_109269 ?auto_109274 ) ) ( not ( = ?auto_109270 ?auto_109271 ) ) ( not ( = ?auto_109270 ?auto_109272 ) ) ( not ( = ?auto_109270 ?auto_109273 ) ) ( not ( = ?auto_109270 ?auto_109274 ) ) ( not ( = ?auto_109271 ?auto_109272 ) ) ( not ( = ?auto_109271 ?auto_109273 ) ) ( not ( = ?auto_109271 ?auto_109274 ) ) ( not ( = ?auto_109272 ?auto_109273 ) ) ( not ( = ?auto_109272 ?auto_109274 ) ) ( not ( = ?auto_109273 ?auto_109274 ) ) ( ON ?auto_109272 ?auto_109273 ) ( ON ?auto_109271 ?auto_109272 ) ( ON ?auto_109270 ?auto_109271 ) ( CLEAR ?auto_109268 ) ( ON ?auto_109269 ?auto_109270 ) ( CLEAR ?auto_109269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_109268 ?auto_109269 )
      ( MAKE-6PILE ?auto_109268 ?auto_109269 ?auto_109270 ?auto_109271 ?auto_109272 ?auto_109273 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109281 - BLOCK
      ?auto_109282 - BLOCK
      ?auto_109283 - BLOCK
      ?auto_109284 - BLOCK
      ?auto_109285 - BLOCK
      ?auto_109286 - BLOCK
    )
    :vars
    (
      ?auto_109287 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109286 ?auto_109287 ) ( ON-TABLE ?auto_109281 ) ( not ( = ?auto_109281 ?auto_109282 ) ) ( not ( = ?auto_109281 ?auto_109283 ) ) ( not ( = ?auto_109281 ?auto_109284 ) ) ( not ( = ?auto_109281 ?auto_109285 ) ) ( not ( = ?auto_109281 ?auto_109286 ) ) ( not ( = ?auto_109281 ?auto_109287 ) ) ( not ( = ?auto_109282 ?auto_109283 ) ) ( not ( = ?auto_109282 ?auto_109284 ) ) ( not ( = ?auto_109282 ?auto_109285 ) ) ( not ( = ?auto_109282 ?auto_109286 ) ) ( not ( = ?auto_109282 ?auto_109287 ) ) ( not ( = ?auto_109283 ?auto_109284 ) ) ( not ( = ?auto_109283 ?auto_109285 ) ) ( not ( = ?auto_109283 ?auto_109286 ) ) ( not ( = ?auto_109283 ?auto_109287 ) ) ( not ( = ?auto_109284 ?auto_109285 ) ) ( not ( = ?auto_109284 ?auto_109286 ) ) ( not ( = ?auto_109284 ?auto_109287 ) ) ( not ( = ?auto_109285 ?auto_109286 ) ) ( not ( = ?auto_109285 ?auto_109287 ) ) ( not ( = ?auto_109286 ?auto_109287 ) ) ( ON ?auto_109285 ?auto_109286 ) ( ON ?auto_109284 ?auto_109285 ) ( ON ?auto_109283 ?auto_109284 ) ( CLEAR ?auto_109281 ) ( ON ?auto_109282 ?auto_109283 ) ( CLEAR ?auto_109282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_109281 ?auto_109282 )
      ( MAKE-6PILE ?auto_109281 ?auto_109282 ?auto_109283 ?auto_109284 ?auto_109285 ?auto_109286 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109294 - BLOCK
      ?auto_109295 - BLOCK
      ?auto_109296 - BLOCK
      ?auto_109297 - BLOCK
      ?auto_109298 - BLOCK
      ?auto_109299 - BLOCK
    )
    :vars
    (
      ?auto_109300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109299 ?auto_109300 ) ( not ( = ?auto_109294 ?auto_109295 ) ) ( not ( = ?auto_109294 ?auto_109296 ) ) ( not ( = ?auto_109294 ?auto_109297 ) ) ( not ( = ?auto_109294 ?auto_109298 ) ) ( not ( = ?auto_109294 ?auto_109299 ) ) ( not ( = ?auto_109294 ?auto_109300 ) ) ( not ( = ?auto_109295 ?auto_109296 ) ) ( not ( = ?auto_109295 ?auto_109297 ) ) ( not ( = ?auto_109295 ?auto_109298 ) ) ( not ( = ?auto_109295 ?auto_109299 ) ) ( not ( = ?auto_109295 ?auto_109300 ) ) ( not ( = ?auto_109296 ?auto_109297 ) ) ( not ( = ?auto_109296 ?auto_109298 ) ) ( not ( = ?auto_109296 ?auto_109299 ) ) ( not ( = ?auto_109296 ?auto_109300 ) ) ( not ( = ?auto_109297 ?auto_109298 ) ) ( not ( = ?auto_109297 ?auto_109299 ) ) ( not ( = ?auto_109297 ?auto_109300 ) ) ( not ( = ?auto_109298 ?auto_109299 ) ) ( not ( = ?auto_109298 ?auto_109300 ) ) ( not ( = ?auto_109299 ?auto_109300 ) ) ( ON ?auto_109298 ?auto_109299 ) ( ON ?auto_109297 ?auto_109298 ) ( ON ?auto_109296 ?auto_109297 ) ( ON ?auto_109295 ?auto_109296 ) ( ON ?auto_109294 ?auto_109295 ) ( CLEAR ?auto_109294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_109294 )
      ( MAKE-6PILE ?auto_109294 ?auto_109295 ?auto_109296 ?auto_109297 ?auto_109298 ?auto_109299 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109307 - BLOCK
      ?auto_109308 - BLOCK
      ?auto_109309 - BLOCK
      ?auto_109310 - BLOCK
      ?auto_109311 - BLOCK
      ?auto_109312 - BLOCK
    )
    :vars
    (
      ?auto_109313 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109312 ?auto_109313 ) ( not ( = ?auto_109307 ?auto_109308 ) ) ( not ( = ?auto_109307 ?auto_109309 ) ) ( not ( = ?auto_109307 ?auto_109310 ) ) ( not ( = ?auto_109307 ?auto_109311 ) ) ( not ( = ?auto_109307 ?auto_109312 ) ) ( not ( = ?auto_109307 ?auto_109313 ) ) ( not ( = ?auto_109308 ?auto_109309 ) ) ( not ( = ?auto_109308 ?auto_109310 ) ) ( not ( = ?auto_109308 ?auto_109311 ) ) ( not ( = ?auto_109308 ?auto_109312 ) ) ( not ( = ?auto_109308 ?auto_109313 ) ) ( not ( = ?auto_109309 ?auto_109310 ) ) ( not ( = ?auto_109309 ?auto_109311 ) ) ( not ( = ?auto_109309 ?auto_109312 ) ) ( not ( = ?auto_109309 ?auto_109313 ) ) ( not ( = ?auto_109310 ?auto_109311 ) ) ( not ( = ?auto_109310 ?auto_109312 ) ) ( not ( = ?auto_109310 ?auto_109313 ) ) ( not ( = ?auto_109311 ?auto_109312 ) ) ( not ( = ?auto_109311 ?auto_109313 ) ) ( not ( = ?auto_109312 ?auto_109313 ) ) ( ON ?auto_109311 ?auto_109312 ) ( ON ?auto_109310 ?auto_109311 ) ( ON ?auto_109309 ?auto_109310 ) ( ON ?auto_109308 ?auto_109309 ) ( ON ?auto_109307 ?auto_109308 ) ( CLEAR ?auto_109307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_109307 )
      ( MAKE-6PILE ?auto_109307 ?auto_109308 ?auto_109309 ?auto_109310 ?auto_109311 ?auto_109312 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109321 - BLOCK
      ?auto_109322 - BLOCK
      ?auto_109323 - BLOCK
      ?auto_109324 - BLOCK
      ?auto_109325 - BLOCK
      ?auto_109326 - BLOCK
      ?auto_109327 - BLOCK
    )
    :vars
    (
      ?auto_109328 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_109326 ) ( ON ?auto_109327 ?auto_109328 ) ( CLEAR ?auto_109327 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_109321 ) ( ON ?auto_109322 ?auto_109321 ) ( ON ?auto_109323 ?auto_109322 ) ( ON ?auto_109324 ?auto_109323 ) ( ON ?auto_109325 ?auto_109324 ) ( ON ?auto_109326 ?auto_109325 ) ( not ( = ?auto_109321 ?auto_109322 ) ) ( not ( = ?auto_109321 ?auto_109323 ) ) ( not ( = ?auto_109321 ?auto_109324 ) ) ( not ( = ?auto_109321 ?auto_109325 ) ) ( not ( = ?auto_109321 ?auto_109326 ) ) ( not ( = ?auto_109321 ?auto_109327 ) ) ( not ( = ?auto_109321 ?auto_109328 ) ) ( not ( = ?auto_109322 ?auto_109323 ) ) ( not ( = ?auto_109322 ?auto_109324 ) ) ( not ( = ?auto_109322 ?auto_109325 ) ) ( not ( = ?auto_109322 ?auto_109326 ) ) ( not ( = ?auto_109322 ?auto_109327 ) ) ( not ( = ?auto_109322 ?auto_109328 ) ) ( not ( = ?auto_109323 ?auto_109324 ) ) ( not ( = ?auto_109323 ?auto_109325 ) ) ( not ( = ?auto_109323 ?auto_109326 ) ) ( not ( = ?auto_109323 ?auto_109327 ) ) ( not ( = ?auto_109323 ?auto_109328 ) ) ( not ( = ?auto_109324 ?auto_109325 ) ) ( not ( = ?auto_109324 ?auto_109326 ) ) ( not ( = ?auto_109324 ?auto_109327 ) ) ( not ( = ?auto_109324 ?auto_109328 ) ) ( not ( = ?auto_109325 ?auto_109326 ) ) ( not ( = ?auto_109325 ?auto_109327 ) ) ( not ( = ?auto_109325 ?auto_109328 ) ) ( not ( = ?auto_109326 ?auto_109327 ) ) ( not ( = ?auto_109326 ?auto_109328 ) ) ( not ( = ?auto_109327 ?auto_109328 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_109327 ?auto_109328 )
      ( !STACK ?auto_109327 ?auto_109326 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109336 - BLOCK
      ?auto_109337 - BLOCK
      ?auto_109338 - BLOCK
      ?auto_109339 - BLOCK
      ?auto_109340 - BLOCK
      ?auto_109341 - BLOCK
      ?auto_109342 - BLOCK
    )
    :vars
    (
      ?auto_109343 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_109341 ) ( ON ?auto_109342 ?auto_109343 ) ( CLEAR ?auto_109342 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_109336 ) ( ON ?auto_109337 ?auto_109336 ) ( ON ?auto_109338 ?auto_109337 ) ( ON ?auto_109339 ?auto_109338 ) ( ON ?auto_109340 ?auto_109339 ) ( ON ?auto_109341 ?auto_109340 ) ( not ( = ?auto_109336 ?auto_109337 ) ) ( not ( = ?auto_109336 ?auto_109338 ) ) ( not ( = ?auto_109336 ?auto_109339 ) ) ( not ( = ?auto_109336 ?auto_109340 ) ) ( not ( = ?auto_109336 ?auto_109341 ) ) ( not ( = ?auto_109336 ?auto_109342 ) ) ( not ( = ?auto_109336 ?auto_109343 ) ) ( not ( = ?auto_109337 ?auto_109338 ) ) ( not ( = ?auto_109337 ?auto_109339 ) ) ( not ( = ?auto_109337 ?auto_109340 ) ) ( not ( = ?auto_109337 ?auto_109341 ) ) ( not ( = ?auto_109337 ?auto_109342 ) ) ( not ( = ?auto_109337 ?auto_109343 ) ) ( not ( = ?auto_109338 ?auto_109339 ) ) ( not ( = ?auto_109338 ?auto_109340 ) ) ( not ( = ?auto_109338 ?auto_109341 ) ) ( not ( = ?auto_109338 ?auto_109342 ) ) ( not ( = ?auto_109338 ?auto_109343 ) ) ( not ( = ?auto_109339 ?auto_109340 ) ) ( not ( = ?auto_109339 ?auto_109341 ) ) ( not ( = ?auto_109339 ?auto_109342 ) ) ( not ( = ?auto_109339 ?auto_109343 ) ) ( not ( = ?auto_109340 ?auto_109341 ) ) ( not ( = ?auto_109340 ?auto_109342 ) ) ( not ( = ?auto_109340 ?auto_109343 ) ) ( not ( = ?auto_109341 ?auto_109342 ) ) ( not ( = ?auto_109341 ?auto_109343 ) ) ( not ( = ?auto_109342 ?auto_109343 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_109342 ?auto_109343 )
      ( !STACK ?auto_109342 ?auto_109341 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109351 - BLOCK
      ?auto_109352 - BLOCK
      ?auto_109353 - BLOCK
      ?auto_109354 - BLOCK
      ?auto_109355 - BLOCK
      ?auto_109356 - BLOCK
      ?auto_109357 - BLOCK
    )
    :vars
    (
      ?auto_109358 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109357 ?auto_109358 ) ( ON-TABLE ?auto_109351 ) ( ON ?auto_109352 ?auto_109351 ) ( ON ?auto_109353 ?auto_109352 ) ( ON ?auto_109354 ?auto_109353 ) ( ON ?auto_109355 ?auto_109354 ) ( not ( = ?auto_109351 ?auto_109352 ) ) ( not ( = ?auto_109351 ?auto_109353 ) ) ( not ( = ?auto_109351 ?auto_109354 ) ) ( not ( = ?auto_109351 ?auto_109355 ) ) ( not ( = ?auto_109351 ?auto_109356 ) ) ( not ( = ?auto_109351 ?auto_109357 ) ) ( not ( = ?auto_109351 ?auto_109358 ) ) ( not ( = ?auto_109352 ?auto_109353 ) ) ( not ( = ?auto_109352 ?auto_109354 ) ) ( not ( = ?auto_109352 ?auto_109355 ) ) ( not ( = ?auto_109352 ?auto_109356 ) ) ( not ( = ?auto_109352 ?auto_109357 ) ) ( not ( = ?auto_109352 ?auto_109358 ) ) ( not ( = ?auto_109353 ?auto_109354 ) ) ( not ( = ?auto_109353 ?auto_109355 ) ) ( not ( = ?auto_109353 ?auto_109356 ) ) ( not ( = ?auto_109353 ?auto_109357 ) ) ( not ( = ?auto_109353 ?auto_109358 ) ) ( not ( = ?auto_109354 ?auto_109355 ) ) ( not ( = ?auto_109354 ?auto_109356 ) ) ( not ( = ?auto_109354 ?auto_109357 ) ) ( not ( = ?auto_109354 ?auto_109358 ) ) ( not ( = ?auto_109355 ?auto_109356 ) ) ( not ( = ?auto_109355 ?auto_109357 ) ) ( not ( = ?auto_109355 ?auto_109358 ) ) ( not ( = ?auto_109356 ?auto_109357 ) ) ( not ( = ?auto_109356 ?auto_109358 ) ) ( not ( = ?auto_109357 ?auto_109358 ) ) ( CLEAR ?auto_109355 ) ( ON ?auto_109356 ?auto_109357 ) ( CLEAR ?auto_109356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_109351 ?auto_109352 ?auto_109353 ?auto_109354 ?auto_109355 ?auto_109356 )
      ( MAKE-7PILE ?auto_109351 ?auto_109352 ?auto_109353 ?auto_109354 ?auto_109355 ?auto_109356 ?auto_109357 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109366 - BLOCK
      ?auto_109367 - BLOCK
      ?auto_109368 - BLOCK
      ?auto_109369 - BLOCK
      ?auto_109370 - BLOCK
      ?auto_109371 - BLOCK
      ?auto_109372 - BLOCK
    )
    :vars
    (
      ?auto_109373 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109372 ?auto_109373 ) ( ON-TABLE ?auto_109366 ) ( ON ?auto_109367 ?auto_109366 ) ( ON ?auto_109368 ?auto_109367 ) ( ON ?auto_109369 ?auto_109368 ) ( ON ?auto_109370 ?auto_109369 ) ( not ( = ?auto_109366 ?auto_109367 ) ) ( not ( = ?auto_109366 ?auto_109368 ) ) ( not ( = ?auto_109366 ?auto_109369 ) ) ( not ( = ?auto_109366 ?auto_109370 ) ) ( not ( = ?auto_109366 ?auto_109371 ) ) ( not ( = ?auto_109366 ?auto_109372 ) ) ( not ( = ?auto_109366 ?auto_109373 ) ) ( not ( = ?auto_109367 ?auto_109368 ) ) ( not ( = ?auto_109367 ?auto_109369 ) ) ( not ( = ?auto_109367 ?auto_109370 ) ) ( not ( = ?auto_109367 ?auto_109371 ) ) ( not ( = ?auto_109367 ?auto_109372 ) ) ( not ( = ?auto_109367 ?auto_109373 ) ) ( not ( = ?auto_109368 ?auto_109369 ) ) ( not ( = ?auto_109368 ?auto_109370 ) ) ( not ( = ?auto_109368 ?auto_109371 ) ) ( not ( = ?auto_109368 ?auto_109372 ) ) ( not ( = ?auto_109368 ?auto_109373 ) ) ( not ( = ?auto_109369 ?auto_109370 ) ) ( not ( = ?auto_109369 ?auto_109371 ) ) ( not ( = ?auto_109369 ?auto_109372 ) ) ( not ( = ?auto_109369 ?auto_109373 ) ) ( not ( = ?auto_109370 ?auto_109371 ) ) ( not ( = ?auto_109370 ?auto_109372 ) ) ( not ( = ?auto_109370 ?auto_109373 ) ) ( not ( = ?auto_109371 ?auto_109372 ) ) ( not ( = ?auto_109371 ?auto_109373 ) ) ( not ( = ?auto_109372 ?auto_109373 ) ) ( CLEAR ?auto_109370 ) ( ON ?auto_109371 ?auto_109372 ) ( CLEAR ?auto_109371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_109366 ?auto_109367 ?auto_109368 ?auto_109369 ?auto_109370 ?auto_109371 )
      ( MAKE-7PILE ?auto_109366 ?auto_109367 ?auto_109368 ?auto_109369 ?auto_109370 ?auto_109371 ?auto_109372 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109381 - BLOCK
      ?auto_109382 - BLOCK
      ?auto_109383 - BLOCK
      ?auto_109384 - BLOCK
      ?auto_109385 - BLOCK
      ?auto_109386 - BLOCK
      ?auto_109387 - BLOCK
    )
    :vars
    (
      ?auto_109388 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109387 ?auto_109388 ) ( ON-TABLE ?auto_109381 ) ( ON ?auto_109382 ?auto_109381 ) ( ON ?auto_109383 ?auto_109382 ) ( ON ?auto_109384 ?auto_109383 ) ( not ( = ?auto_109381 ?auto_109382 ) ) ( not ( = ?auto_109381 ?auto_109383 ) ) ( not ( = ?auto_109381 ?auto_109384 ) ) ( not ( = ?auto_109381 ?auto_109385 ) ) ( not ( = ?auto_109381 ?auto_109386 ) ) ( not ( = ?auto_109381 ?auto_109387 ) ) ( not ( = ?auto_109381 ?auto_109388 ) ) ( not ( = ?auto_109382 ?auto_109383 ) ) ( not ( = ?auto_109382 ?auto_109384 ) ) ( not ( = ?auto_109382 ?auto_109385 ) ) ( not ( = ?auto_109382 ?auto_109386 ) ) ( not ( = ?auto_109382 ?auto_109387 ) ) ( not ( = ?auto_109382 ?auto_109388 ) ) ( not ( = ?auto_109383 ?auto_109384 ) ) ( not ( = ?auto_109383 ?auto_109385 ) ) ( not ( = ?auto_109383 ?auto_109386 ) ) ( not ( = ?auto_109383 ?auto_109387 ) ) ( not ( = ?auto_109383 ?auto_109388 ) ) ( not ( = ?auto_109384 ?auto_109385 ) ) ( not ( = ?auto_109384 ?auto_109386 ) ) ( not ( = ?auto_109384 ?auto_109387 ) ) ( not ( = ?auto_109384 ?auto_109388 ) ) ( not ( = ?auto_109385 ?auto_109386 ) ) ( not ( = ?auto_109385 ?auto_109387 ) ) ( not ( = ?auto_109385 ?auto_109388 ) ) ( not ( = ?auto_109386 ?auto_109387 ) ) ( not ( = ?auto_109386 ?auto_109388 ) ) ( not ( = ?auto_109387 ?auto_109388 ) ) ( ON ?auto_109386 ?auto_109387 ) ( CLEAR ?auto_109384 ) ( ON ?auto_109385 ?auto_109386 ) ( CLEAR ?auto_109385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_109381 ?auto_109382 ?auto_109383 ?auto_109384 ?auto_109385 )
      ( MAKE-7PILE ?auto_109381 ?auto_109382 ?auto_109383 ?auto_109384 ?auto_109385 ?auto_109386 ?auto_109387 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109396 - BLOCK
      ?auto_109397 - BLOCK
      ?auto_109398 - BLOCK
      ?auto_109399 - BLOCK
      ?auto_109400 - BLOCK
      ?auto_109401 - BLOCK
      ?auto_109402 - BLOCK
    )
    :vars
    (
      ?auto_109403 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109402 ?auto_109403 ) ( ON-TABLE ?auto_109396 ) ( ON ?auto_109397 ?auto_109396 ) ( ON ?auto_109398 ?auto_109397 ) ( ON ?auto_109399 ?auto_109398 ) ( not ( = ?auto_109396 ?auto_109397 ) ) ( not ( = ?auto_109396 ?auto_109398 ) ) ( not ( = ?auto_109396 ?auto_109399 ) ) ( not ( = ?auto_109396 ?auto_109400 ) ) ( not ( = ?auto_109396 ?auto_109401 ) ) ( not ( = ?auto_109396 ?auto_109402 ) ) ( not ( = ?auto_109396 ?auto_109403 ) ) ( not ( = ?auto_109397 ?auto_109398 ) ) ( not ( = ?auto_109397 ?auto_109399 ) ) ( not ( = ?auto_109397 ?auto_109400 ) ) ( not ( = ?auto_109397 ?auto_109401 ) ) ( not ( = ?auto_109397 ?auto_109402 ) ) ( not ( = ?auto_109397 ?auto_109403 ) ) ( not ( = ?auto_109398 ?auto_109399 ) ) ( not ( = ?auto_109398 ?auto_109400 ) ) ( not ( = ?auto_109398 ?auto_109401 ) ) ( not ( = ?auto_109398 ?auto_109402 ) ) ( not ( = ?auto_109398 ?auto_109403 ) ) ( not ( = ?auto_109399 ?auto_109400 ) ) ( not ( = ?auto_109399 ?auto_109401 ) ) ( not ( = ?auto_109399 ?auto_109402 ) ) ( not ( = ?auto_109399 ?auto_109403 ) ) ( not ( = ?auto_109400 ?auto_109401 ) ) ( not ( = ?auto_109400 ?auto_109402 ) ) ( not ( = ?auto_109400 ?auto_109403 ) ) ( not ( = ?auto_109401 ?auto_109402 ) ) ( not ( = ?auto_109401 ?auto_109403 ) ) ( not ( = ?auto_109402 ?auto_109403 ) ) ( ON ?auto_109401 ?auto_109402 ) ( CLEAR ?auto_109399 ) ( ON ?auto_109400 ?auto_109401 ) ( CLEAR ?auto_109400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_109396 ?auto_109397 ?auto_109398 ?auto_109399 ?auto_109400 )
      ( MAKE-7PILE ?auto_109396 ?auto_109397 ?auto_109398 ?auto_109399 ?auto_109400 ?auto_109401 ?auto_109402 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109411 - BLOCK
      ?auto_109412 - BLOCK
      ?auto_109413 - BLOCK
      ?auto_109414 - BLOCK
      ?auto_109415 - BLOCK
      ?auto_109416 - BLOCK
      ?auto_109417 - BLOCK
    )
    :vars
    (
      ?auto_109418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109417 ?auto_109418 ) ( ON-TABLE ?auto_109411 ) ( ON ?auto_109412 ?auto_109411 ) ( ON ?auto_109413 ?auto_109412 ) ( not ( = ?auto_109411 ?auto_109412 ) ) ( not ( = ?auto_109411 ?auto_109413 ) ) ( not ( = ?auto_109411 ?auto_109414 ) ) ( not ( = ?auto_109411 ?auto_109415 ) ) ( not ( = ?auto_109411 ?auto_109416 ) ) ( not ( = ?auto_109411 ?auto_109417 ) ) ( not ( = ?auto_109411 ?auto_109418 ) ) ( not ( = ?auto_109412 ?auto_109413 ) ) ( not ( = ?auto_109412 ?auto_109414 ) ) ( not ( = ?auto_109412 ?auto_109415 ) ) ( not ( = ?auto_109412 ?auto_109416 ) ) ( not ( = ?auto_109412 ?auto_109417 ) ) ( not ( = ?auto_109412 ?auto_109418 ) ) ( not ( = ?auto_109413 ?auto_109414 ) ) ( not ( = ?auto_109413 ?auto_109415 ) ) ( not ( = ?auto_109413 ?auto_109416 ) ) ( not ( = ?auto_109413 ?auto_109417 ) ) ( not ( = ?auto_109413 ?auto_109418 ) ) ( not ( = ?auto_109414 ?auto_109415 ) ) ( not ( = ?auto_109414 ?auto_109416 ) ) ( not ( = ?auto_109414 ?auto_109417 ) ) ( not ( = ?auto_109414 ?auto_109418 ) ) ( not ( = ?auto_109415 ?auto_109416 ) ) ( not ( = ?auto_109415 ?auto_109417 ) ) ( not ( = ?auto_109415 ?auto_109418 ) ) ( not ( = ?auto_109416 ?auto_109417 ) ) ( not ( = ?auto_109416 ?auto_109418 ) ) ( not ( = ?auto_109417 ?auto_109418 ) ) ( ON ?auto_109416 ?auto_109417 ) ( ON ?auto_109415 ?auto_109416 ) ( CLEAR ?auto_109413 ) ( ON ?auto_109414 ?auto_109415 ) ( CLEAR ?auto_109414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_109411 ?auto_109412 ?auto_109413 ?auto_109414 )
      ( MAKE-7PILE ?auto_109411 ?auto_109412 ?auto_109413 ?auto_109414 ?auto_109415 ?auto_109416 ?auto_109417 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109426 - BLOCK
      ?auto_109427 - BLOCK
      ?auto_109428 - BLOCK
      ?auto_109429 - BLOCK
      ?auto_109430 - BLOCK
      ?auto_109431 - BLOCK
      ?auto_109432 - BLOCK
    )
    :vars
    (
      ?auto_109433 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109432 ?auto_109433 ) ( ON-TABLE ?auto_109426 ) ( ON ?auto_109427 ?auto_109426 ) ( ON ?auto_109428 ?auto_109427 ) ( not ( = ?auto_109426 ?auto_109427 ) ) ( not ( = ?auto_109426 ?auto_109428 ) ) ( not ( = ?auto_109426 ?auto_109429 ) ) ( not ( = ?auto_109426 ?auto_109430 ) ) ( not ( = ?auto_109426 ?auto_109431 ) ) ( not ( = ?auto_109426 ?auto_109432 ) ) ( not ( = ?auto_109426 ?auto_109433 ) ) ( not ( = ?auto_109427 ?auto_109428 ) ) ( not ( = ?auto_109427 ?auto_109429 ) ) ( not ( = ?auto_109427 ?auto_109430 ) ) ( not ( = ?auto_109427 ?auto_109431 ) ) ( not ( = ?auto_109427 ?auto_109432 ) ) ( not ( = ?auto_109427 ?auto_109433 ) ) ( not ( = ?auto_109428 ?auto_109429 ) ) ( not ( = ?auto_109428 ?auto_109430 ) ) ( not ( = ?auto_109428 ?auto_109431 ) ) ( not ( = ?auto_109428 ?auto_109432 ) ) ( not ( = ?auto_109428 ?auto_109433 ) ) ( not ( = ?auto_109429 ?auto_109430 ) ) ( not ( = ?auto_109429 ?auto_109431 ) ) ( not ( = ?auto_109429 ?auto_109432 ) ) ( not ( = ?auto_109429 ?auto_109433 ) ) ( not ( = ?auto_109430 ?auto_109431 ) ) ( not ( = ?auto_109430 ?auto_109432 ) ) ( not ( = ?auto_109430 ?auto_109433 ) ) ( not ( = ?auto_109431 ?auto_109432 ) ) ( not ( = ?auto_109431 ?auto_109433 ) ) ( not ( = ?auto_109432 ?auto_109433 ) ) ( ON ?auto_109431 ?auto_109432 ) ( ON ?auto_109430 ?auto_109431 ) ( CLEAR ?auto_109428 ) ( ON ?auto_109429 ?auto_109430 ) ( CLEAR ?auto_109429 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_109426 ?auto_109427 ?auto_109428 ?auto_109429 )
      ( MAKE-7PILE ?auto_109426 ?auto_109427 ?auto_109428 ?auto_109429 ?auto_109430 ?auto_109431 ?auto_109432 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109441 - BLOCK
      ?auto_109442 - BLOCK
      ?auto_109443 - BLOCK
      ?auto_109444 - BLOCK
      ?auto_109445 - BLOCK
      ?auto_109446 - BLOCK
      ?auto_109447 - BLOCK
    )
    :vars
    (
      ?auto_109448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109447 ?auto_109448 ) ( ON-TABLE ?auto_109441 ) ( ON ?auto_109442 ?auto_109441 ) ( not ( = ?auto_109441 ?auto_109442 ) ) ( not ( = ?auto_109441 ?auto_109443 ) ) ( not ( = ?auto_109441 ?auto_109444 ) ) ( not ( = ?auto_109441 ?auto_109445 ) ) ( not ( = ?auto_109441 ?auto_109446 ) ) ( not ( = ?auto_109441 ?auto_109447 ) ) ( not ( = ?auto_109441 ?auto_109448 ) ) ( not ( = ?auto_109442 ?auto_109443 ) ) ( not ( = ?auto_109442 ?auto_109444 ) ) ( not ( = ?auto_109442 ?auto_109445 ) ) ( not ( = ?auto_109442 ?auto_109446 ) ) ( not ( = ?auto_109442 ?auto_109447 ) ) ( not ( = ?auto_109442 ?auto_109448 ) ) ( not ( = ?auto_109443 ?auto_109444 ) ) ( not ( = ?auto_109443 ?auto_109445 ) ) ( not ( = ?auto_109443 ?auto_109446 ) ) ( not ( = ?auto_109443 ?auto_109447 ) ) ( not ( = ?auto_109443 ?auto_109448 ) ) ( not ( = ?auto_109444 ?auto_109445 ) ) ( not ( = ?auto_109444 ?auto_109446 ) ) ( not ( = ?auto_109444 ?auto_109447 ) ) ( not ( = ?auto_109444 ?auto_109448 ) ) ( not ( = ?auto_109445 ?auto_109446 ) ) ( not ( = ?auto_109445 ?auto_109447 ) ) ( not ( = ?auto_109445 ?auto_109448 ) ) ( not ( = ?auto_109446 ?auto_109447 ) ) ( not ( = ?auto_109446 ?auto_109448 ) ) ( not ( = ?auto_109447 ?auto_109448 ) ) ( ON ?auto_109446 ?auto_109447 ) ( ON ?auto_109445 ?auto_109446 ) ( ON ?auto_109444 ?auto_109445 ) ( CLEAR ?auto_109442 ) ( ON ?auto_109443 ?auto_109444 ) ( CLEAR ?auto_109443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109441 ?auto_109442 ?auto_109443 )
      ( MAKE-7PILE ?auto_109441 ?auto_109442 ?auto_109443 ?auto_109444 ?auto_109445 ?auto_109446 ?auto_109447 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109456 - BLOCK
      ?auto_109457 - BLOCK
      ?auto_109458 - BLOCK
      ?auto_109459 - BLOCK
      ?auto_109460 - BLOCK
      ?auto_109461 - BLOCK
      ?auto_109462 - BLOCK
    )
    :vars
    (
      ?auto_109463 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109462 ?auto_109463 ) ( ON-TABLE ?auto_109456 ) ( ON ?auto_109457 ?auto_109456 ) ( not ( = ?auto_109456 ?auto_109457 ) ) ( not ( = ?auto_109456 ?auto_109458 ) ) ( not ( = ?auto_109456 ?auto_109459 ) ) ( not ( = ?auto_109456 ?auto_109460 ) ) ( not ( = ?auto_109456 ?auto_109461 ) ) ( not ( = ?auto_109456 ?auto_109462 ) ) ( not ( = ?auto_109456 ?auto_109463 ) ) ( not ( = ?auto_109457 ?auto_109458 ) ) ( not ( = ?auto_109457 ?auto_109459 ) ) ( not ( = ?auto_109457 ?auto_109460 ) ) ( not ( = ?auto_109457 ?auto_109461 ) ) ( not ( = ?auto_109457 ?auto_109462 ) ) ( not ( = ?auto_109457 ?auto_109463 ) ) ( not ( = ?auto_109458 ?auto_109459 ) ) ( not ( = ?auto_109458 ?auto_109460 ) ) ( not ( = ?auto_109458 ?auto_109461 ) ) ( not ( = ?auto_109458 ?auto_109462 ) ) ( not ( = ?auto_109458 ?auto_109463 ) ) ( not ( = ?auto_109459 ?auto_109460 ) ) ( not ( = ?auto_109459 ?auto_109461 ) ) ( not ( = ?auto_109459 ?auto_109462 ) ) ( not ( = ?auto_109459 ?auto_109463 ) ) ( not ( = ?auto_109460 ?auto_109461 ) ) ( not ( = ?auto_109460 ?auto_109462 ) ) ( not ( = ?auto_109460 ?auto_109463 ) ) ( not ( = ?auto_109461 ?auto_109462 ) ) ( not ( = ?auto_109461 ?auto_109463 ) ) ( not ( = ?auto_109462 ?auto_109463 ) ) ( ON ?auto_109461 ?auto_109462 ) ( ON ?auto_109460 ?auto_109461 ) ( ON ?auto_109459 ?auto_109460 ) ( CLEAR ?auto_109457 ) ( ON ?auto_109458 ?auto_109459 ) ( CLEAR ?auto_109458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109456 ?auto_109457 ?auto_109458 )
      ( MAKE-7PILE ?auto_109456 ?auto_109457 ?auto_109458 ?auto_109459 ?auto_109460 ?auto_109461 ?auto_109462 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109471 - BLOCK
      ?auto_109472 - BLOCK
      ?auto_109473 - BLOCK
      ?auto_109474 - BLOCK
      ?auto_109475 - BLOCK
      ?auto_109476 - BLOCK
      ?auto_109477 - BLOCK
    )
    :vars
    (
      ?auto_109478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109477 ?auto_109478 ) ( ON-TABLE ?auto_109471 ) ( not ( = ?auto_109471 ?auto_109472 ) ) ( not ( = ?auto_109471 ?auto_109473 ) ) ( not ( = ?auto_109471 ?auto_109474 ) ) ( not ( = ?auto_109471 ?auto_109475 ) ) ( not ( = ?auto_109471 ?auto_109476 ) ) ( not ( = ?auto_109471 ?auto_109477 ) ) ( not ( = ?auto_109471 ?auto_109478 ) ) ( not ( = ?auto_109472 ?auto_109473 ) ) ( not ( = ?auto_109472 ?auto_109474 ) ) ( not ( = ?auto_109472 ?auto_109475 ) ) ( not ( = ?auto_109472 ?auto_109476 ) ) ( not ( = ?auto_109472 ?auto_109477 ) ) ( not ( = ?auto_109472 ?auto_109478 ) ) ( not ( = ?auto_109473 ?auto_109474 ) ) ( not ( = ?auto_109473 ?auto_109475 ) ) ( not ( = ?auto_109473 ?auto_109476 ) ) ( not ( = ?auto_109473 ?auto_109477 ) ) ( not ( = ?auto_109473 ?auto_109478 ) ) ( not ( = ?auto_109474 ?auto_109475 ) ) ( not ( = ?auto_109474 ?auto_109476 ) ) ( not ( = ?auto_109474 ?auto_109477 ) ) ( not ( = ?auto_109474 ?auto_109478 ) ) ( not ( = ?auto_109475 ?auto_109476 ) ) ( not ( = ?auto_109475 ?auto_109477 ) ) ( not ( = ?auto_109475 ?auto_109478 ) ) ( not ( = ?auto_109476 ?auto_109477 ) ) ( not ( = ?auto_109476 ?auto_109478 ) ) ( not ( = ?auto_109477 ?auto_109478 ) ) ( ON ?auto_109476 ?auto_109477 ) ( ON ?auto_109475 ?auto_109476 ) ( ON ?auto_109474 ?auto_109475 ) ( ON ?auto_109473 ?auto_109474 ) ( CLEAR ?auto_109471 ) ( ON ?auto_109472 ?auto_109473 ) ( CLEAR ?auto_109472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_109471 ?auto_109472 )
      ( MAKE-7PILE ?auto_109471 ?auto_109472 ?auto_109473 ?auto_109474 ?auto_109475 ?auto_109476 ?auto_109477 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109486 - BLOCK
      ?auto_109487 - BLOCK
      ?auto_109488 - BLOCK
      ?auto_109489 - BLOCK
      ?auto_109490 - BLOCK
      ?auto_109491 - BLOCK
      ?auto_109492 - BLOCK
    )
    :vars
    (
      ?auto_109493 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109492 ?auto_109493 ) ( ON-TABLE ?auto_109486 ) ( not ( = ?auto_109486 ?auto_109487 ) ) ( not ( = ?auto_109486 ?auto_109488 ) ) ( not ( = ?auto_109486 ?auto_109489 ) ) ( not ( = ?auto_109486 ?auto_109490 ) ) ( not ( = ?auto_109486 ?auto_109491 ) ) ( not ( = ?auto_109486 ?auto_109492 ) ) ( not ( = ?auto_109486 ?auto_109493 ) ) ( not ( = ?auto_109487 ?auto_109488 ) ) ( not ( = ?auto_109487 ?auto_109489 ) ) ( not ( = ?auto_109487 ?auto_109490 ) ) ( not ( = ?auto_109487 ?auto_109491 ) ) ( not ( = ?auto_109487 ?auto_109492 ) ) ( not ( = ?auto_109487 ?auto_109493 ) ) ( not ( = ?auto_109488 ?auto_109489 ) ) ( not ( = ?auto_109488 ?auto_109490 ) ) ( not ( = ?auto_109488 ?auto_109491 ) ) ( not ( = ?auto_109488 ?auto_109492 ) ) ( not ( = ?auto_109488 ?auto_109493 ) ) ( not ( = ?auto_109489 ?auto_109490 ) ) ( not ( = ?auto_109489 ?auto_109491 ) ) ( not ( = ?auto_109489 ?auto_109492 ) ) ( not ( = ?auto_109489 ?auto_109493 ) ) ( not ( = ?auto_109490 ?auto_109491 ) ) ( not ( = ?auto_109490 ?auto_109492 ) ) ( not ( = ?auto_109490 ?auto_109493 ) ) ( not ( = ?auto_109491 ?auto_109492 ) ) ( not ( = ?auto_109491 ?auto_109493 ) ) ( not ( = ?auto_109492 ?auto_109493 ) ) ( ON ?auto_109491 ?auto_109492 ) ( ON ?auto_109490 ?auto_109491 ) ( ON ?auto_109489 ?auto_109490 ) ( ON ?auto_109488 ?auto_109489 ) ( CLEAR ?auto_109486 ) ( ON ?auto_109487 ?auto_109488 ) ( CLEAR ?auto_109487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_109486 ?auto_109487 )
      ( MAKE-7PILE ?auto_109486 ?auto_109487 ?auto_109488 ?auto_109489 ?auto_109490 ?auto_109491 ?auto_109492 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109501 - BLOCK
      ?auto_109502 - BLOCK
      ?auto_109503 - BLOCK
      ?auto_109504 - BLOCK
      ?auto_109505 - BLOCK
      ?auto_109506 - BLOCK
      ?auto_109507 - BLOCK
    )
    :vars
    (
      ?auto_109508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109507 ?auto_109508 ) ( not ( = ?auto_109501 ?auto_109502 ) ) ( not ( = ?auto_109501 ?auto_109503 ) ) ( not ( = ?auto_109501 ?auto_109504 ) ) ( not ( = ?auto_109501 ?auto_109505 ) ) ( not ( = ?auto_109501 ?auto_109506 ) ) ( not ( = ?auto_109501 ?auto_109507 ) ) ( not ( = ?auto_109501 ?auto_109508 ) ) ( not ( = ?auto_109502 ?auto_109503 ) ) ( not ( = ?auto_109502 ?auto_109504 ) ) ( not ( = ?auto_109502 ?auto_109505 ) ) ( not ( = ?auto_109502 ?auto_109506 ) ) ( not ( = ?auto_109502 ?auto_109507 ) ) ( not ( = ?auto_109502 ?auto_109508 ) ) ( not ( = ?auto_109503 ?auto_109504 ) ) ( not ( = ?auto_109503 ?auto_109505 ) ) ( not ( = ?auto_109503 ?auto_109506 ) ) ( not ( = ?auto_109503 ?auto_109507 ) ) ( not ( = ?auto_109503 ?auto_109508 ) ) ( not ( = ?auto_109504 ?auto_109505 ) ) ( not ( = ?auto_109504 ?auto_109506 ) ) ( not ( = ?auto_109504 ?auto_109507 ) ) ( not ( = ?auto_109504 ?auto_109508 ) ) ( not ( = ?auto_109505 ?auto_109506 ) ) ( not ( = ?auto_109505 ?auto_109507 ) ) ( not ( = ?auto_109505 ?auto_109508 ) ) ( not ( = ?auto_109506 ?auto_109507 ) ) ( not ( = ?auto_109506 ?auto_109508 ) ) ( not ( = ?auto_109507 ?auto_109508 ) ) ( ON ?auto_109506 ?auto_109507 ) ( ON ?auto_109505 ?auto_109506 ) ( ON ?auto_109504 ?auto_109505 ) ( ON ?auto_109503 ?auto_109504 ) ( ON ?auto_109502 ?auto_109503 ) ( ON ?auto_109501 ?auto_109502 ) ( CLEAR ?auto_109501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_109501 )
      ( MAKE-7PILE ?auto_109501 ?auto_109502 ?auto_109503 ?auto_109504 ?auto_109505 ?auto_109506 ?auto_109507 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109516 - BLOCK
      ?auto_109517 - BLOCK
      ?auto_109518 - BLOCK
      ?auto_109519 - BLOCK
      ?auto_109520 - BLOCK
      ?auto_109521 - BLOCK
      ?auto_109522 - BLOCK
    )
    :vars
    (
      ?auto_109523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109522 ?auto_109523 ) ( not ( = ?auto_109516 ?auto_109517 ) ) ( not ( = ?auto_109516 ?auto_109518 ) ) ( not ( = ?auto_109516 ?auto_109519 ) ) ( not ( = ?auto_109516 ?auto_109520 ) ) ( not ( = ?auto_109516 ?auto_109521 ) ) ( not ( = ?auto_109516 ?auto_109522 ) ) ( not ( = ?auto_109516 ?auto_109523 ) ) ( not ( = ?auto_109517 ?auto_109518 ) ) ( not ( = ?auto_109517 ?auto_109519 ) ) ( not ( = ?auto_109517 ?auto_109520 ) ) ( not ( = ?auto_109517 ?auto_109521 ) ) ( not ( = ?auto_109517 ?auto_109522 ) ) ( not ( = ?auto_109517 ?auto_109523 ) ) ( not ( = ?auto_109518 ?auto_109519 ) ) ( not ( = ?auto_109518 ?auto_109520 ) ) ( not ( = ?auto_109518 ?auto_109521 ) ) ( not ( = ?auto_109518 ?auto_109522 ) ) ( not ( = ?auto_109518 ?auto_109523 ) ) ( not ( = ?auto_109519 ?auto_109520 ) ) ( not ( = ?auto_109519 ?auto_109521 ) ) ( not ( = ?auto_109519 ?auto_109522 ) ) ( not ( = ?auto_109519 ?auto_109523 ) ) ( not ( = ?auto_109520 ?auto_109521 ) ) ( not ( = ?auto_109520 ?auto_109522 ) ) ( not ( = ?auto_109520 ?auto_109523 ) ) ( not ( = ?auto_109521 ?auto_109522 ) ) ( not ( = ?auto_109521 ?auto_109523 ) ) ( not ( = ?auto_109522 ?auto_109523 ) ) ( ON ?auto_109521 ?auto_109522 ) ( ON ?auto_109520 ?auto_109521 ) ( ON ?auto_109519 ?auto_109520 ) ( ON ?auto_109518 ?auto_109519 ) ( ON ?auto_109517 ?auto_109518 ) ( ON ?auto_109516 ?auto_109517 ) ( CLEAR ?auto_109516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_109516 )
      ( MAKE-7PILE ?auto_109516 ?auto_109517 ?auto_109518 ?auto_109519 ?auto_109520 ?auto_109521 ?auto_109522 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_109532 - BLOCK
      ?auto_109533 - BLOCK
      ?auto_109534 - BLOCK
      ?auto_109535 - BLOCK
      ?auto_109536 - BLOCK
      ?auto_109537 - BLOCK
      ?auto_109538 - BLOCK
      ?auto_109539 - BLOCK
    )
    :vars
    (
      ?auto_109540 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_109538 ) ( ON ?auto_109539 ?auto_109540 ) ( CLEAR ?auto_109539 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_109532 ) ( ON ?auto_109533 ?auto_109532 ) ( ON ?auto_109534 ?auto_109533 ) ( ON ?auto_109535 ?auto_109534 ) ( ON ?auto_109536 ?auto_109535 ) ( ON ?auto_109537 ?auto_109536 ) ( ON ?auto_109538 ?auto_109537 ) ( not ( = ?auto_109532 ?auto_109533 ) ) ( not ( = ?auto_109532 ?auto_109534 ) ) ( not ( = ?auto_109532 ?auto_109535 ) ) ( not ( = ?auto_109532 ?auto_109536 ) ) ( not ( = ?auto_109532 ?auto_109537 ) ) ( not ( = ?auto_109532 ?auto_109538 ) ) ( not ( = ?auto_109532 ?auto_109539 ) ) ( not ( = ?auto_109532 ?auto_109540 ) ) ( not ( = ?auto_109533 ?auto_109534 ) ) ( not ( = ?auto_109533 ?auto_109535 ) ) ( not ( = ?auto_109533 ?auto_109536 ) ) ( not ( = ?auto_109533 ?auto_109537 ) ) ( not ( = ?auto_109533 ?auto_109538 ) ) ( not ( = ?auto_109533 ?auto_109539 ) ) ( not ( = ?auto_109533 ?auto_109540 ) ) ( not ( = ?auto_109534 ?auto_109535 ) ) ( not ( = ?auto_109534 ?auto_109536 ) ) ( not ( = ?auto_109534 ?auto_109537 ) ) ( not ( = ?auto_109534 ?auto_109538 ) ) ( not ( = ?auto_109534 ?auto_109539 ) ) ( not ( = ?auto_109534 ?auto_109540 ) ) ( not ( = ?auto_109535 ?auto_109536 ) ) ( not ( = ?auto_109535 ?auto_109537 ) ) ( not ( = ?auto_109535 ?auto_109538 ) ) ( not ( = ?auto_109535 ?auto_109539 ) ) ( not ( = ?auto_109535 ?auto_109540 ) ) ( not ( = ?auto_109536 ?auto_109537 ) ) ( not ( = ?auto_109536 ?auto_109538 ) ) ( not ( = ?auto_109536 ?auto_109539 ) ) ( not ( = ?auto_109536 ?auto_109540 ) ) ( not ( = ?auto_109537 ?auto_109538 ) ) ( not ( = ?auto_109537 ?auto_109539 ) ) ( not ( = ?auto_109537 ?auto_109540 ) ) ( not ( = ?auto_109538 ?auto_109539 ) ) ( not ( = ?auto_109538 ?auto_109540 ) ) ( not ( = ?auto_109539 ?auto_109540 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_109539 ?auto_109540 )
      ( !STACK ?auto_109539 ?auto_109538 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_109549 - BLOCK
      ?auto_109550 - BLOCK
      ?auto_109551 - BLOCK
      ?auto_109552 - BLOCK
      ?auto_109553 - BLOCK
      ?auto_109554 - BLOCK
      ?auto_109555 - BLOCK
      ?auto_109556 - BLOCK
    )
    :vars
    (
      ?auto_109557 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_109555 ) ( ON ?auto_109556 ?auto_109557 ) ( CLEAR ?auto_109556 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_109549 ) ( ON ?auto_109550 ?auto_109549 ) ( ON ?auto_109551 ?auto_109550 ) ( ON ?auto_109552 ?auto_109551 ) ( ON ?auto_109553 ?auto_109552 ) ( ON ?auto_109554 ?auto_109553 ) ( ON ?auto_109555 ?auto_109554 ) ( not ( = ?auto_109549 ?auto_109550 ) ) ( not ( = ?auto_109549 ?auto_109551 ) ) ( not ( = ?auto_109549 ?auto_109552 ) ) ( not ( = ?auto_109549 ?auto_109553 ) ) ( not ( = ?auto_109549 ?auto_109554 ) ) ( not ( = ?auto_109549 ?auto_109555 ) ) ( not ( = ?auto_109549 ?auto_109556 ) ) ( not ( = ?auto_109549 ?auto_109557 ) ) ( not ( = ?auto_109550 ?auto_109551 ) ) ( not ( = ?auto_109550 ?auto_109552 ) ) ( not ( = ?auto_109550 ?auto_109553 ) ) ( not ( = ?auto_109550 ?auto_109554 ) ) ( not ( = ?auto_109550 ?auto_109555 ) ) ( not ( = ?auto_109550 ?auto_109556 ) ) ( not ( = ?auto_109550 ?auto_109557 ) ) ( not ( = ?auto_109551 ?auto_109552 ) ) ( not ( = ?auto_109551 ?auto_109553 ) ) ( not ( = ?auto_109551 ?auto_109554 ) ) ( not ( = ?auto_109551 ?auto_109555 ) ) ( not ( = ?auto_109551 ?auto_109556 ) ) ( not ( = ?auto_109551 ?auto_109557 ) ) ( not ( = ?auto_109552 ?auto_109553 ) ) ( not ( = ?auto_109552 ?auto_109554 ) ) ( not ( = ?auto_109552 ?auto_109555 ) ) ( not ( = ?auto_109552 ?auto_109556 ) ) ( not ( = ?auto_109552 ?auto_109557 ) ) ( not ( = ?auto_109553 ?auto_109554 ) ) ( not ( = ?auto_109553 ?auto_109555 ) ) ( not ( = ?auto_109553 ?auto_109556 ) ) ( not ( = ?auto_109553 ?auto_109557 ) ) ( not ( = ?auto_109554 ?auto_109555 ) ) ( not ( = ?auto_109554 ?auto_109556 ) ) ( not ( = ?auto_109554 ?auto_109557 ) ) ( not ( = ?auto_109555 ?auto_109556 ) ) ( not ( = ?auto_109555 ?auto_109557 ) ) ( not ( = ?auto_109556 ?auto_109557 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_109556 ?auto_109557 )
      ( !STACK ?auto_109556 ?auto_109555 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_109566 - BLOCK
      ?auto_109567 - BLOCK
      ?auto_109568 - BLOCK
      ?auto_109569 - BLOCK
      ?auto_109570 - BLOCK
      ?auto_109571 - BLOCK
      ?auto_109572 - BLOCK
      ?auto_109573 - BLOCK
    )
    :vars
    (
      ?auto_109574 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109573 ?auto_109574 ) ( ON-TABLE ?auto_109566 ) ( ON ?auto_109567 ?auto_109566 ) ( ON ?auto_109568 ?auto_109567 ) ( ON ?auto_109569 ?auto_109568 ) ( ON ?auto_109570 ?auto_109569 ) ( ON ?auto_109571 ?auto_109570 ) ( not ( = ?auto_109566 ?auto_109567 ) ) ( not ( = ?auto_109566 ?auto_109568 ) ) ( not ( = ?auto_109566 ?auto_109569 ) ) ( not ( = ?auto_109566 ?auto_109570 ) ) ( not ( = ?auto_109566 ?auto_109571 ) ) ( not ( = ?auto_109566 ?auto_109572 ) ) ( not ( = ?auto_109566 ?auto_109573 ) ) ( not ( = ?auto_109566 ?auto_109574 ) ) ( not ( = ?auto_109567 ?auto_109568 ) ) ( not ( = ?auto_109567 ?auto_109569 ) ) ( not ( = ?auto_109567 ?auto_109570 ) ) ( not ( = ?auto_109567 ?auto_109571 ) ) ( not ( = ?auto_109567 ?auto_109572 ) ) ( not ( = ?auto_109567 ?auto_109573 ) ) ( not ( = ?auto_109567 ?auto_109574 ) ) ( not ( = ?auto_109568 ?auto_109569 ) ) ( not ( = ?auto_109568 ?auto_109570 ) ) ( not ( = ?auto_109568 ?auto_109571 ) ) ( not ( = ?auto_109568 ?auto_109572 ) ) ( not ( = ?auto_109568 ?auto_109573 ) ) ( not ( = ?auto_109568 ?auto_109574 ) ) ( not ( = ?auto_109569 ?auto_109570 ) ) ( not ( = ?auto_109569 ?auto_109571 ) ) ( not ( = ?auto_109569 ?auto_109572 ) ) ( not ( = ?auto_109569 ?auto_109573 ) ) ( not ( = ?auto_109569 ?auto_109574 ) ) ( not ( = ?auto_109570 ?auto_109571 ) ) ( not ( = ?auto_109570 ?auto_109572 ) ) ( not ( = ?auto_109570 ?auto_109573 ) ) ( not ( = ?auto_109570 ?auto_109574 ) ) ( not ( = ?auto_109571 ?auto_109572 ) ) ( not ( = ?auto_109571 ?auto_109573 ) ) ( not ( = ?auto_109571 ?auto_109574 ) ) ( not ( = ?auto_109572 ?auto_109573 ) ) ( not ( = ?auto_109572 ?auto_109574 ) ) ( not ( = ?auto_109573 ?auto_109574 ) ) ( CLEAR ?auto_109571 ) ( ON ?auto_109572 ?auto_109573 ) ( CLEAR ?auto_109572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_109566 ?auto_109567 ?auto_109568 ?auto_109569 ?auto_109570 ?auto_109571 ?auto_109572 )
      ( MAKE-8PILE ?auto_109566 ?auto_109567 ?auto_109568 ?auto_109569 ?auto_109570 ?auto_109571 ?auto_109572 ?auto_109573 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_109583 - BLOCK
      ?auto_109584 - BLOCK
      ?auto_109585 - BLOCK
      ?auto_109586 - BLOCK
      ?auto_109587 - BLOCK
      ?auto_109588 - BLOCK
      ?auto_109589 - BLOCK
      ?auto_109590 - BLOCK
    )
    :vars
    (
      ?auto_109591 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109590 ?auto_109591 ) ( ON-TABLE ?auto_109583 ) ( ON ?auto_109584 ?auto_109583 ) ( ON ?auto_109585 ?auto_109584 ) ( ON ?auto_109586 ?auto_109585 ) ( ON ?auto_109587 ?auto_109586 ) ( ON ?auto_109588 ?auto_109587 ) ( not ( = ?auto_109583 ?auto_109584 ) ) ( not ( = ?auto_109583 ?auto_109585 ) ) ( not ( = ?auto_109583 ?auto_109586 ) ) ( not ( = ?auto_109583 ?auto_109587 ) ) ( not ( = ?auto_109583 ?auto_109588 ) ) ( not ( = ?auto_109583 ?auto_109589 ) ) ( not ( = ?auto_109583 ?auto_109590 ) ) ( not ( = ?auto_109583 ?auto_109591 ) ) ( not ( = ?auto_109584 ?auto_109585 ) ) ( not ( = ?auto_109584 ?auto_109586 ) ) ( not ( = ?auto_109584 ?auto_109587 ) ) ( not ( = ?auto_109584 ?auto_109588 ) ) ( not ( = ?auto_109584 ?auto_109589 ) ) ( not ( = ?auto_109584 ?auto_109590 ) ) ( not ( = ?auto_109584 ?auto_109591 ) ) ( not ( = ?auto_109585 ?auto_109586 ) ) ( not ( = ?auto_109585 ?auto_109587 ) ) ( not ( = ?auto_109585 ?auto_109588 ) ) ( not ( = ?auto_109585 ?auto_109589 ) ) ( not ( = ?auto_109585 ?auto_109590 ) ) ( not ( = ?auto_109585 ?auto_109591 ) ) ( not ( = ?auto_109586 ?auto_109587 ) ) ( not ( = ?auto_109586 ?auto_109588 ) ) ( not ( = ?auto_109586 ?auto_109589 ) ) ( not ( = ?auto_109586 ?auto_109590 ) ) ( not ( = ?auto_109586 ?auto_109591 ) ) ( not ( = ?auto_109587 ?auto_109588 ) ) ( not ( = ?auto_109587 ?auto_109589 ) ) ( not ( = ?auto_109587 ?auto_109590 ) ) ( not ( = ?auto_109587 ?auto_109591 ) ) ( not ( = ?auto_109588 ?auto_109589 ) ) ( not ( = ?auto_109588 ?auto_109590 ) ) ( not ( = ?auto_109588 ?auto_109591 ) ) ( not ( = ?auto_109589 ?auto_109590 ) ) ( not ( = ?auto_109589 ?auto_109591 ) ) ( not ( = ?auto_109590 ?auto_109591 ) ) ( CLEAR ?auto_109588 ) ( ON ?auto_109589 ?auto_109590 ) ( CLEAR ?auto_109589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_109583 ?auto_109584 ?auto_109585 ?auto_109586 ?auto_109587 ?auto_109588 ?auto_109589 )
      ( MAKE-8PILE ?auto_109583 ?auto_109584 ?auto_109585 ?auto_109586 ?auto_109587 ?auto_109588 ?auto_109589 ?auto_109590 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_109600 - BLOCK
      ?auto_109601 - BLOCK
      ?auto_109602 - BLOCK
      ?auto_109603 - BLOCK
      ?auto_109604 - BLOCK
      ?auto_109605 - BLOCK
      ?auto_109606 - BLOCK
      ?auto_109607 - BLOCK
    )
    :vars
    (
      ?auto_109608 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109607 ?auto_109608 ) ( ON-TABLE ?auto_109600 ) ( ON ?auto_109601 ?auto_109600 ) ( ON ?auto_109602 ?auto_109601 ) ( ON ?auto_109603 ?auto_109602 ) ( ON ?auto_109604 ?auto_109603 ) ( not ( = ?auto_109600 ?auto_109601 ) ) ( not ( = ?auto_109600 ?auto_109602 ) ) ( not ( = ?auto_109600 ?auto_109603 ) ) ( not ( = ?auto_109600 ?auto_109604 ) ) ( not ( = ?auto_109600 ?auto_109605 ) ) ( not ( = ?auto_109600 ?auto_109606 ) ) ( not ( = ?auto_109600 ?auto_109607 ) ) ( not ( = ?auto_109600 ?auto_109608 ) ) ( not ( = ?auto_109601 ?auto_109602 ) ) ( not ( = ?auto_109601 ?auto_109603 ) ) ( not ( = ?auto_109601 ?auto_109604 ) ) ( not ( = ?auto_109601 ?auto_109605 ) ) ( not ( = ?auto_109601 ?auto_109606 ) ) ( not ( = ?auto_109601 ?auto_109607 ) ) ( not ( = ?auto_109601 ?auto_109608 ) ) ( not ( = ?auto_109602 ?auto_109603 ) ) ( not ( = ?auto_109602 ?auto_109604 ) ) ( not ( = ?auto_109602 ?auto_109605 ) ) ( not ( = ?auto_109602 ?auto_109606 ) ) ( not ( = ?auto_109602 ?auto_109607 ) ) ( not ( = ?auto_109602 ?auto_109608 ) ) ( not ( = ?auto_109603 ?auto_109604 ) ) ( not ( = ?auto_109603 ?auto_109605 ) ) ( not ( = ?auto_109603 ?auto_109606 ) ) ( not ( = ?auto_109603 ?auto_109607 ) ) ( not ( = ?auto_109603 ?auto_109608 ) ) ( not ( = ?auto_109604 ?auto_109605 ) ) ( not ( = ?auto_109604 ?auto_109606 ) ) ( not ( = ?auto_109604 ?auto_109607 ) ) ( not ( = ?auto_109604 ?auto_109608 ) ) ( not ( = ?auto_109605 ?auto_109606 ) ) ( not ( = ?auto_109605 ?auto_109607 ) ) ( not ( = ?auto_109605 ?auto_109608 ) ) ( not ( = ?auto_109606 ?auto_109607 ) ) ( not ( = ?auto_109606 ?auto_109608 ) ) ( not ( = ?auto_109607 ?auto_109608 ) ) ( ON ?auto_109606 ?auto_109607 ) ( CLEAR ?auto_109604 ) ( ON ?auto_109605 ?auto_109606 ) ( CLEAR ?auto_109605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_109600 ?auto_109601 ?auto_109602 ?auto_109603 ?auto_109604 ?auto_109605 )
      ( MAKE-8PILE ?auto_109600 ?auto_109601 ?auto_109602 ?auto_109603 ?auto_109604 ?auto_109605 ?auto_109606 ?auto_109607 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_109617 - BLOCK
      ?auto_109618 - BLOCK
      ?auto_109619 - BLOCK
      ?auto_109620 - BLOCK
      ?auto_109621 - BLOCK
      ?auto_109622 - BLOCK
      ?auto_109623 - BLOCK
      ?auto_109624 - BLOCK
    )
    :vars
    (
      ?auto_109625 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109624 ?auto_109625 ) ( ON-TABLE ?auto_109617 ) ( ON ?auto_109618 ?auto_109617 ) ( ON ?auto_109619 ?auto_109618 ) ( ON ?auto_109620 ?auto_109619 ) ( ON ?auto_109621 ?auto_109620 ) ( not ( = ?auto_109617 ?auto_109618 ) ) ( not ( = ?auto_109617 ?auto_109619 ) ) ( not ( = ?auto_109617 ?auto_109620 ) ) ( not ( = ?auto_109617 ?auto_109621 ) ) ( not ( = ?auto_109617 ?auto_109622 ) ) ( not ( = ?auto_109617 ?auto_109623 ) ) ( not ( = ?auto_109617 ?auto_109624 ) ) ( not ( = ?auto_109617 ?auto_109625 ) ) ( not ( = ?auto_109618 ?auto_109619 ) ) ( not ( = ?auto_109618 ?auto_109620 ) ) ( not ( = ?auto_109618 ?auto_109621 ) ) ( not ( = ?auto_109618 ?auto_109622 ) ) ( not ( = ?auto_109618 ?auto_109623 ) ) ( not ( = ?auto_109618 ?auto_109624 ) ) ( not ( = ?auto_109618 ?auto_109625 ) ) ( not ( = ?auto_109619 ?auto_109620 ) ) ( not ( = ?auto_109619 ?auto_109621 ) ) ( not ( = ?auto_109619 ?auto_109622 ) ) ( not ( = ?auto_109619 ?auto_109623 ) ) ( not ( = ?auto_109619 ?auto_109624 ) ) ( not ( = ?auto_109619 ?auto_109625 ) ) ( not ( = ?auto_109620 ?auto_109621 ) ) ( not ( = ?auto_109620 ?auto_109622 ) ) ( not ( = ?auto_109620 ?auto_109623 ) ) ( not ( = ?auto_109620 ?auto_109624 ) ) ( not ( = ?auto_109620 ?auto_109625 ) ) ( not ( = ?auto_109621 ?auto_109622 ) ) ( not ( = ?auto_109621 ?auto_109623 ) ) ( not ( = ?auto_109621 ?auto_109624 ) ) ( not ( = ?auto_109621 ?auto_109625 ) ) ( not ( = ?auto_109622 ?auto_109623 ) ) ( not ( = ?auto_109622 ?auto_109624 ) ) ( not ( = ?auto_109622 ?auto_109625 ) ) ( not ( = ?auto_109623 ?auto_109624 ) ) ( not ( = ?auto_109623 ?auto_109625 ) ) ( not ( = ?auto_109624 ?auto_109625 ) ) ( ON ?auto_109623 ?auto_109624 ) ( CLEAR ?auto_109621 ) ( ON ?auto_109622 ?auto_109623 ) ( CLEAR ?auto_109622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_109617 ?auto_109618 ?auto_109619 ?auto_109620 ?auto_109621 ?auto_109622 )
      ( MAKE-8PILE ?auto_109617 ?auto_109618 ?auto_109619 ?auto_109620 ?auto_109621 ?auto_109622 ?auto_109623 ?auto_109624 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_109634 - BLOCK
      ?auto_109635 - BLOCK
      ?auto_109636 - BLOCK
      ?auto_109637 - BLOCK
      ?auto_109638 - BLOCK
      ?auto_109639 - BLOCK
      ?auto_109640 - BLOCK
      ?auto_109641 - BLOCK
    )
    :vars
    (
      ?auto_109642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109641 ?auto_109642 ) ( ON-TABLE ?auto_109634 ) ( ON ?auto_109635 ?auto_109634 ) ( ON ?auto_109636 ?auto_109635 ) ( ON ?auto_109637 ?auto_109636 ) ( not ( = ?auto_109634 ?auto_109635 ) ) ( not ( = ?auto_109634 ?auto_109636 ) ) ( not ( = ?auto_109634 ?auto_109637 ) ) ( not ( = ?auto_109634 ?auto_109638 ) ) ( not ( = ?auto_109634 ?auto_109639 ) ) ( not ( = ?auto_109634 ?auto_109640 ) ) ( not ( = ?auto_109634 ?auto_109641 ) ) ( not ( = ?auto_109634 ?auto_109642 ) ) ( not ( = ?auto_109635 ?auto_109636 ) ) ( not ( = ?auto_109635 ?auto_109637 ) ) ( not ( = ?auto_109635 ?auto_109638 ) ) ( not ( = ?auto_109635 ?auto_109639 ) ) ( not ( = ?auto_109635 ?auto_109640 ) ) ( not ( = ?auto_109635 ?auto_109641 ) ) ( not ( = ?auto_109635 ?auto_109642 ) ) ( not ( = ?auto_109636 ?auto_109637 ) ) ( not ( = ?auto_109636 ?auto_109638 ) ) ( not ( = ?auto_109636 ?auto_109639 ) ) ( not ( = ?auto_109636 ?auto_109640 ) ) ( not ( = ?auto_109636 ?auto_109641 ) ) ( not ( = ?auto_109636 ?auto_109642 ) ) ( not ( = ?auto_109637 ?auto_109638 ) ) ( not ( = ?auto_109637 ?auto_109639 ) ) ( not ( = ?auto_109637 ?auto_109640 ) ) ( not ( = ?auto_109637 ?auto_109641 ) ) ( not ( = ?auto_109637 ?auto_109642 ) ) ( not ( = ?auto_109638 ?auto_109639 ) ) ( not ( = ?auto_109638 ?auto_109640 ) ) ( not ( = ?auto_109638 ?auto_109641 ) ) ( not ( = ?auto_109638 ?auto_109642 ) ) ( not ( = ?auto_109639 ?auto_109640 ) ) ( not ( = ?auto_109639 ?auto_109641 ) ) ( not ( = ?auto_109639 ?auto_109642 ) ) ( not ( = ?auto_109640 ?auto_109641 ) ) ( not ( = ?auto_109640 ?auto_109642 ) ) ( not ( = ?auto_109641 ?auto_109642 ) ) ( ON ?auto_109640 ?auto_109641 ) ( ON ?auto_109639 ?auto_109640 ) ( CLEAR ?auto_109637 ) ( ON ?auto_109638 ?auto_109639 ) ( CLEAR ?auto_109638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_109634 ?auto_109635 ?auto_109636 ?auto_109637 ?auto_109638 )
      ( MAKE-8PILE ?auto_109634 ?auto_109635 ?auto_109636 ?auto_109637 ?auto_109638 ?auto_109639 ?auto_109640 ?auto_109641 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_109651 - BLOCK
      ?auto_109652 - BLOCK
      ?auto_109653 - BLOCK
      ?auto_109654 - BLOCK
      ?auto_109655 - BLOCK
      ?auto_109656 - BLOCK
      ?auto_109657 - BLOCK
      ?auto_109658 - BLOCK
    )
    :vars
    (
      ?auto_109659 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109658 ?auto_109659 ) ( ON-TABLE ?auto_109651 ) ( ON ?auto_109652 ?auto_109651 ) ( ON ?auto_109653 ?auto_109652 ) ( ON ?auto_109654 ?auto_109653 ) ( not ( = ?auto_109651 ?auto_109652 ) ) ( not ( = ?auto_109651 ?auto_109653 ) ) ( not ( = ?auto_109651 ?auto_109654 ) ) ( not ( = ?auto_109651 ?auto_109655 ) ) ( not ( = ?auto_109651 ?auto_109656 ) ) ( not ( = ?auto_109651 ?auto_109657 ) ) ( not ( = ?auto_109651 ?auto_109658 ) ) ( not ( = ?auto_109651 ?auto_109659 ) ) ( not ( = ?auto_109652 ?auto_109653 ) ) ( not ( = ?auto_109652 ?auto_109654 ) ) ( not ( = ?auto_109652 ?auto_109655 ) ) ( not ( = ?auto_109652 ?auto_109656 ) ) ( not ( = ?auto_109652 ?auto_109657 ) ) ( not ( = ?auto_109652 ?auto_109658 ) ) ( not ( = ?auto_109652 ?auto_109659 ) ) ( not ( = ?auto_109653 ?auto_109654 ) ) ( not ( = ?auto_109653 ?auto_109655 ) ) ( not ( = ?auto_109653 ?auto_109656 ) ) ( not ( = ?auto_109653 ?auto_109657 ) ) ( not ( = ?auto_109653 ?auto_109658 ) ) ( not ( = ?auto_109653 ?auto_109659 ) ) ( not ( = ?auto_109654 ?auto_109655 ) ) ( not ( = ?auto_109654 ?auto_109656 ) ) ( not ( = ?auto_109654 ?auto_109657 ) ) ( not ( = ?auto_109654 ?auto_109658 ) ) ( not ( = ?auto_109654 ?auto_109659 ) ) ( not ( = ?auto_109655 ?auto_109656 ) ) ( not ( = ?auto_109655 ?auto_109657 ) ) ( not ( = ?auto_109655 ?auto_109658 ) ) ( not ( = ?auto_109655 ?auto_109659 ) ) ( not ( = ?auto_109656 ?auto_109657 ) ) ( not ( = ?auto_109656 ?auto_109658 ) ) ( not ( = ?auto_109656 ?auto_109659 ) ) ( not ( = ?auto_109657 ?auto_109658 ) ) ( not ( = ?auto_109657 ?auto_109659 ) ) ( not ( = ?auto_109658 ?auto_109659 ) ) ( ON ?auto_109657 ?auto_109658 ) ( ON ?auto_109656 ?auto_109657 ) ( CLEAR ?auto_109654 ) ( ON ?auto_109655 ?auto_109656 ) ( CLEAR ?auto_109655 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_109651 ?auto_109652 ?auto_109653 ?auto_109654 ?auto_109655 )
      ( MAKE-8PILE ?auto_109651 ?auto_109652 ?auto_109653 ?auto_109654 ?auto_109655 ?auto_109656 ?auto_109657 ?auto_109658 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_109668 - BLOCK
      ?auto_109669 - BLOCK
      ?auto_109670 - BLOCK
      ?auto_109671 - BLOCK
      ?auto_109672 - BLOCK
      ?auto_109673 - BLOCK
      ?auto_109674 - BLOCK
      ?auto_109675 - BLOCK
    )
    :vars
    (
      ?auto_109676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109675 ?auto_109676 ) ( ON-TABLE ?auto_109668 ) ( ON ?auto_109669 ?auto_109668 ) ( ON ?auto_109670 ?auto_109669 ) ( not ( = ?auto_109668 ?auto_109669 ) ) ( not ( = ?auto_109668 ?auto_109670 ) ) ( not ( = ?auto_109668 ?auto_109671 ) ) ( not ( = ?auto_109668 ?auto_109672 ) ) ( not ( = ?auto_109668 ?auto_109673 ) ) ( not ( = ?auto_109668 ?auto_109674 ) ) ( not ( = ?auto_109668 ?auto_109675 ) ) ( not ( = ?auto_109668 ?auto_109676 ) ) ( not ( = ?auto_109669 ?auto_109670 ) ) ( not ( = ?auto_109669 ?auto_109671 ) ) ( not ( = ?auto_109669 ?auto_109672 ) ) ( not ( = ?auto_109669 ?auto_109673 ) ) ( not ( = ?auto_109669 ?auto_109674 ) ) ( not ( = ?auto_109669 ?auto_109675 ) ) ( not ( = ?auto_109669 ?auto_109676 ) ) ( not ( = ?auto_109670 ?auto_109671 ) ) ( not ( = ?auto_109670 ?auto_109672 ) ) ( not ( = ?auto_109670 ?auto_109673 ) ) ( not ( = ?auto_109670 ?auto_109674 ) ) ( not ( = ?auto_109670 ?auto_109675 ) ) ( not ( = ?auto_109670 ?auto_109676 ) ) ( not ( = ?auto_109671 ?auto_109672 ) ) ( not ( = ?auto_109671 ?auto_109673 ) ) ( not ( = ?auto_109671 ?auto_109674 ) ) ( not ( = ?auto_109671 ?auto_109675 ) ) ( not ( = ?auto_109671 ?auto_109676 ) ) ( not ( = ?auto_109672 ?auto_109673 ) ) ( not ( = ?auto_109672 ?auto_109674 ) ) ( not ( = ?auto_109672 ?auto_109675 ) ) ( not ( = ?auto_109672 ?auto_109676 ) ) ( not ( = ?auto_109673 ?auto_109674 ) ) ( not ( = ?auto_109673 ?auto_109675 ) ) ( not ( = ?auto_109673 ?auto_109676 ) ) ( not ( = ?auto_109674 ?auto_109675 ) ) ( not ( = ?auto_109674 ?auto_109676 ) ) ( not ( = ?auto_109675 ?auto_109676 ) ) ( ON ?auto_109674 ?auto_109675 ) ( ON ?auto_109673 ?auto_109674 ) ( ON ?auto_109672 ?auto_109673 ) ( CLEAR ?auto_109670 ) ( ON ?auto_109671 ?auto_109672 ) ( CLEAR ?auto_109671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_109668 ?auto_109669 ?auto_109670 ?auto_109671 )
      ( MAKE-8PILE ?auto_109668 ?auto_109669 ?auto_109670 ?auto_109671 ?auto_109672 ?auto_109673 ?auto_109674 ?auto_109675 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_109685 - BLOCK
      ?auto_109686 - BLOCK
      ?auto_109687 - BLOCK
      ?auto_109688 - BLOCK
      ?auto_109689 - BLOCK
      ?auto_109690 - BLOCK
      ?auto_109691 - BLOCK
      ?auto_109692 - BLOCK
    )
    :vars
    (
      ?auto_109693 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109692 ?auto_109693 ) ( ON-TABLE ?auto_109685 ) ( ON ?auto_109686 ?auto_109685 ) ( ON ?auto_109687 ?auto_109686 ) ( not ( = ?auto_109685 ?auto_109686 ) ) ( not ( = ?auto_109685 ?auto_109687 ) ) ( not ( = ?auto_109685 ?auto_109688 ) ) ( not ( = ?auto_109685 ?auto_109689 ) ) ( not ( = ?auto_109685 ?auto_109690 ) ) ( not ( = ?auto_109685 ?auto_109691 ) ) ( not ( = ?auto_109685 ?auto_109692 ) ) ( not ( = ?auto_109685 ?auto_109693 ) ) ( not ( = ?auto_109686 ?auto_109687 ) ) ( not ( = ?auto_109686 ?auto_109688 ) ) ( not ( = ?auto_109686 ?auto_109689 ) ) ( not ( = ?auto_109686 ?auto_109690 ) ) ( not ( = ?auto_109686 ?auto_109691 ) ) ( not ( = ?auto_109686 ?auto_109692 ) ) ( not ( = ?auto_109686 ?auto_109693 ) ) ( not ( = ?auto_109687 ?auto_109688 ) ) ( not ( = ?auto_109687 ?auto_109689 ) ) ( not ( = ?auto_109687 ?auto_109690 ) ) ( not ( = ?auto_109687 ?auto_109691 ) ) ( not ( = ?auto_109687 ?auto_109692 ) ) ( not ( = ?auto_109687 ?auto_109693 ) ) ( not ( = ?auto_109688 ?auto_109689 ) ) ( not ( = ?auto_109688 ?auto_109690 ) ) ( not ( = ?auto_109688 ?auto_109691 ) ) ( not ( = ?auto_109688 ?auto_109692 ) ) ( not ( = ?auto_109688 ?auto_109693 ) ) ( not ( = ?auto_109689 ?auto_109690 ) ) ( not ( = ?auto_109689 ?auto_109691 ) ) ( not ( = ?auto_109689 ?auto_109692 ) ) ( not ( = ?auto_109689 ?auto_109693 ) ) ( not ( = ?auto_109690 ?auto_109691 ) ) ( not ( = ?auto_109690 ?auto_109692 ) ) ( not ( = ?auto_109690 ?auto_109693 ) ) ( not ( = ?auto_109691 ?auto_109692 ) ) ( not ( = ?auto_109691 ?auto_109693 ) ) ( not ( = ?auto_109692 ?auto_109693 ) ) ( ON ?auto_109691 ?auto_109692 ) ( ON ?auto_109690 ?auto_109691 ) ( ON ?auto_109689 ?auto_109690 ) ( CLEAR ?auto_109687 ) ( ON ?auto_109688 ?auto_109689 ) ( CLEAR ?auto_109688 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_109685 ?auto_109686 ?auto_109687 ?auto_109688 )
      ( MAKE-8PILE ?auto_109685 ?auto_109686 ?auto_109687 ?auto_109688 ?auto_109689 ?auto_109690 ?auto_109691 ?auto_109692 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_109702 - BLOCK
      ?auto_109703 - BLOCK
      ?auto_109704 - BLOCK
      ?auto_109705 - BLOCK
      ?auto_109706 - BLOCK
      ?auto_109707 - BLOCK
      ?auto_109708 - BLOCK
      ?auto_109709 - BLOCK
    )
    :vars
    (
      ?auto_109710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109709 ?auto_109710 ) ( ON-TABLE ?auto_109702 ) ( ON ?auto_109703 ?auto_109702 ) ( not ( = ?auto_109702 ?auto_109703 ) ) ( not ( = ?auto_109702 ?auto_109704 ) ) ( not ( = ?auto_109702 ?auto_109705 ) ) ( not ( = ?auto_109702 ?auto_109706 ) ) ( not ( = ?auto_109702 ?auto_109707 ) ) ( not ( = ?auto_109702 ?auto_109708 ) ) ( not ( = ?auto_109702 ?auto_109709 ) ) ( not ( = ?auto_109702 ?auto_109710 ) ) ( not ( = ?auto_109703 ?auto_109704 ) ) ( not ( = ?auto_109703 ?auto_109705 ) ) ( not ( = ?auto_109703 ?auto_109706 ) ) ( not ( = ?auto_109703 ?auto_109707 ) ) ( not ( = ?auto_109703 ?auto_109708 ) ) ( not ( = ?auto_109703 ?auto_109709 ) ) ( not ( = ?auto_109703 ?auto_109710 ) ) ( not ( = ?auto_109704 ?auto_109705 ) ) ( not ( = ?auto_109704 ?auto_109706 ) ) ( not ( = ?auto_109704 ?auto_109707 ) ) ( not ( = ?auto_109704 ?auto_109708 ) ) ( not ( = ?auto_109704 ?auto_109709 ) ) ( not ( = ?auto_109704 ?auto_109710 ) ) ( not ( = ?auto_109705 ?auto_109706 ) ) ( not ( = ?auto_109705 ?auto_109707 ) ) ( not ( = ?auto_109705 ?auto_109708 ) ) ( not ( = ?auto_109705 ?auto_109709 ) ) ( not ( = ?auto_109705 ?auto_109710 ) ) ( not ( = ?auto_109706 ?auto_109707 ) ) ( not ( = ?auto_109706 ?auto_109708 ) ) ( not ( = ?auto_109706 ?auto_109709 ) ) ( not ( = ?auto_109706 ?auto_109710 ) ) ( not ( = ?auto_109707 ?auto_109708 ) ) ( not ( = ?auto_109707 ?auto_109709 ) ) ( not ( = ?auto_109707 ?auto_109710 ) ) ( not ( = ?auto_109708 ?auto_109709 ) ) ( not ( = ?auto_109708 ?auto_109710 ) ) ( not ( = ?auto_109709 ?auto_109710 ) ) ( ON ?auto_109708 ?auto_109709 ) ( ON ?auto_109707 ?auto_109708 ) ( ON ?auto_109706 ?auto_109707 ) ( ON ?auto_109705 ?auto_109706 ) ( CLEAR ?auto_109703 ) ( ON ?auto_109704 ?auto_109705 ) ( CLEAR ?auto_109704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109702 ?auto_109703 ?auto_109704 )
      ( MAKE-8PILE ?auto_109702 ?auto_109703 ?auto_109704 ?auto_109705 ?auto_109706 ?auto_109707 ?auto_109708 ?auto_109709 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_109719 - BLOCK
      ?auto_109720 - BLOCK
      ?auto_109721 - BLOCK
      ?auto_109722 - BLOCK
      ?auto_109723 - BLOCK
      ?auto_109724 - BLOCK
      ?auto_109725 - BLOCK
      ?auto_109726 - BLOCK
    )
    :vars
    (
      ?auto_109727 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109726 ?auto_109727 ) ( ON-TABLE ?auto_109719 ) ( ON ?auto_109720 ?auto_109719 ) ( not ( = ?auto_109719 ?auto_109720 ) ) ( not ( = ?auto_109719 ?auto_109721 ) ) ( not ( = ?auto_109719 ?auto_109722 ) ) ( not ( = ?auto_109719 ?auto_109723 ) ) ( not ( = ?auto_109719 ?auto_109724 ) ) ( not ( = ?auto_109719 ?auto_109725 ) ) ( not ( = ?auto_109719 ?auto_109726 ) ) ( not ( = ?auto_109719 ?auto_109727 ) ) ( not ( = ?auto_109720 ?auto_109721 ) ) ( not ( = ?auto_109720 ?auto_109722 ) ) ( not ( = ?auto_109720 ?auto_109723 ) ) ( not ( = ?auto_109720 ?auto_109724 ) ) ( not ( = ?auto_109720 ?auto_109725 ) ) ( not ( = ?auto_109720 ?auto_109726 ) ) ( not ( = ?auto_109720 ?auto_109727 ) ) ( not ( = ?auto_109721 ?auto_109722 ) ) ( not ( = ?auto_109721 ?auto_109723 ) ) ( not ( = ?auto_109721 ?auto_109724 ) ) ( not ( = ?auto_109721 ?auto_109725 ) ) ( not ( = ?auto_109721 ?auto_109726 ) ) ( not ( = ?auto_109721 ?auto_109727 ) ) ( not ( = ?auto_109722 ?auto_109723 ) ) ( not ( = ?auto_109722 ?auto_109724 ) ) ( not ( = ?auto_109722 ?auto_109725 ) ) ( not ( = ?auto_109722 ?auto_109726 ) ) ( not ( = ?auto_109722 ?auto_109727 ) ) ( not ( = ?auto_109723 ?auto_109724 ) ) ( not ( = ?auto_109723 ?auto_109725 ) ) ( not ( = ?auto_109723 ?auto_109726 ) ) ( not ( = ?auto_109723 ?auto_109727 ) ) ( not ( = ?auto_109724 ?auto_109725 ) ) ( not ( = ?auto_109724 ?auto_109726 ) ) ( not ( = ?auto_109724 ?auto_109727 ) ) ( not ( = ?auto_109725 ?auto_109726 ) ) ( not ( = ?auto_109725 ?auto_109727 ) ) ( not ( = ?auto_109726 ?auto_109727 ) ) ( ON ?auto_109725 ?auto_109726 ) ( ON ?auto_109724 ?auto_109725 ) ( ON ?auto_109723 ?auto_109724 ) ( ON ?auto_109722 ?auto_109723 ) ( CLEAR ?auto_109720 ) ( ON ?auto_109721 ?auto_109722 ) ( CLEAR ?auto_109721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109719 ?auto_109720 ?auto_109721 )
      ( MAKE-8PILE ?auto_109719 ?auto_109720 ?auto_109721 ?auto_109722 ?auto_109723 ?auto_109724 ?auto_109725 ?auto_109726 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_109736 - BLOCK
      ?auto_109737 - BLOCK
      ?auto_109738 - BLOCK
      ?auto_109739 - BLOCK
      ?auto_109740 - BLOCK
      ?auto_109741 - BLOCK
      ?auto_109742 - BLOCK
      ?auto_109743 - BLOCK
    )
    :vars
    (
      ?auto_109744 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109743 ?auto_109744 ) ( ON-TABLE ?auto_109736 ) ( not ( = ?auto_109736 ?auto_109737 ) ) ( not ( = ?auto_109736 ?auto_109738 ) ) ( not ( = ?auto_109736 ?auto_109739 ) ) ( not ( = ?auto_109736 ?auto_109740 ) ) ( not ( = ?auto_109736 ?auto_109741 ) ) ( not ( = ?auto_109736 ?auto_109742 ) ) ( not ( = ?auto_109736 ?auto_109743 ) ) ( not ( = ?auto_109736 ?auto_109744 ) ) ( not ( = ?auto_109737 ?auto_109738 ) ) ( not ( = ?auto_109737 ?auto_109739 ) ) ( not ( = ?auto_109737 ?auto_109740 ) ) ( not ( = ?auto_109737 ?auto_109741 ) ) ( not ( = ?auto_109737 ?auto_109742 ) ) ( not ( = ?auto_109737 ?auto_109743 ) ) ( not ( = ?auto_109737 ?auto_109744 ) ) ( not ( = ?auto_109738 ?auto_109739 ) ) ( not ( = ?auto_109738 ?auto_109740 ) ) ( not ( = ?auto_109738 ?auto_109741 ) ) ( not ( = ?auto_109738 ?auto_109742 ) ) ( not ( = ?auto_109738 ?auto_109743 ) ) ( not ( = ?auto_109738 ?auto_109744 ) ) ( not ( = ?auto_109739 ?auto_109740 ) ) ( not ( = ?auto_109739 ?auto_109741 ) ) ( not ( = ?auto_109739 ?auto_109742 ) ) ( not ( = ?auto_109739 ?auto_109743 ) ) ( not ( = ?auto_109739 ?auto_109744 ) ) ( not ( = ?auto_109740 ?auto_109741 ) ) ( not ( = ?auto_109740 ?auto_109742 ) ) ( not ( = ?auto_109740 ?auto_109743 ) ) ( not ( = ?auto_109740 ?auto_109744 ) ) ( not ( = ?auto_109741 ?auto_109742 ) ) ( not ( = ?auto_109741 ?auto_109743 ) ) ( not ( = ?auto_109741 ?auto_109744 ) ) ( not ( = ?auto_109742 ?auto_109743 ) ) ( not ( = ?auto_109742 ?auto_109744 ) ) ( not ( = ?auto_109743 ?auto_109744 ) ) ( ON ?auto_109742 ?auto_109743 ) ( ON ?auto_109741 ?auto_109742 ) ( ON ?auto_109740 ?auto_109741 ) ( ON ?auto_109739 ?auto_109740 ) ( ON ?auto_109738 ?auto_109739 ) ( CLEAR ?auto_109736 ) ( ON ?auto_109737 ?auto_109738 ) ( CLEAR ?auto_109737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_109736 ?auto_109737 )
      ( MAKE-8PILE ?auto_109736 ?auto_109737 ?auto_109738 ?auto_109739 ?auto_109740 ?auto_109741 ?auto_109742 ?auto_109743 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_109753 - BLOCK
      ?auto_109754 - BLOCK
      ?auto_109755 - BLOCK
      ?auto_109756 - BLOCK
      ?auto_109757 - BLOCK
      ?auto_109758 - BLOCK
      ?auto_109759 - BLOCK
      ?auto_109760 - BLOCK
    )
    :vars
    (
      ?auto_109761 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109760 ?auto_109761 ) ( ON-TABLE ?auto_109753 ) ( not ( = ?auto_109753 ?auto_109754 ) ) ( not ( = ?auto_109753 ?auto_109755 ) ) ( not ( = ?auto_109753 ?auto_109756 ) ) ( not ( = ?auto_109753 ?auto_109757 ) ) ( not ( = ?auto_109753 ?auto_109758 ) ) ( not ( = ?auto_109753 ?auto_109759 ) ) ( not ( = ?auto_109753 ?auto_109760 ) ) ( not ( = ?auto_109753 ?auto_109761 ) ) ( not ( = ?auto_109754 ?auto_109755 ) ) ( not ( = ?auto_109754 ?auto_109756 ) ) ( not ( = ?auto_109754 ?auto_109757 ) ) ( not ( = ?auto_109754 ?auto_109758 ) ) ( not ( = ?auto_109754 ?auto_109759 ) ) ( not ( = ?auto_109754 ?auto_109760 ) ) ( not ( = ?auto_109754 ?auto_109761 ) ) ( not ( = ?auto_109755 ?auto_109756 ) ) ( not ( = ?auto_109755 ?auto_109757 ) ) ( not ( = ?auto_109755 ?auto_109758 ) ) ( not ( = ?auto_109755 ?auto_109759 ) ) ( not ( = ?auto_109755 ?auto_109760 ) ) ( not ( = ?auto_109755 ?auto_109761 ) ) ( not ( = ?auto_109756 ?auto_109757 ) ) ( not ( = ?auto_109756 ?auto_109758 ) ) ( not ( = ?auto_109756 ?auto_109759 ) ) ( not ( = ?auto_109756 ?auto_109760 ) ) ( not ( = ?auto_109756 ?auto_109761 ) ) ( not ( = ?auto_109757 ?auto_109758 ) ) ( not ( = ?auto_109757 ?auto_109759 ) ) ( not ( = ?auto_109757 ?auto_109760 ) ) ( not ( = ?auto_109757 ?auto_109761 ) ) ( not ( = ?auto_109758 ?auto_109759 ) ) ( not ( = ?auto_109758 ?auto_109760 ) ) ( not ( = ?auto_109758 ?auto_109761 ) ) ( not ( = ?auto_109759 ?auto_109760 ) ) ( not ( = ?auto_109759 ?auto_109761 ) ) ( not ( = ?auto_109760 ?auto_109761 ) ) ( ON ?auto_109759 ?auto_109760 ) ( ON ?auto_109758 ?auto_109759 ) ( ON ?auto_109757 ?auto_109758 ) ( ON ?auto_109756 ?auto_109757 ) ( ON ?auto_109755 ?auto_109756 ) ( CLEAR ?auto_109753 ) ( ON ?auto_109754 ?auto_109755 ) ( CLEAR ?auto_109754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_109753 ?auto_109754 )
      ( MAKE-8PILE ?auto_109753 ?auto_109754 ?auto_109755 ?auto_109756 ?auto_109757 ?auto_109758 ?auto_109759 ?auto_109760 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_109770 - BLOCK
      ?auto_109771 - BLOCK
      ?auto_109772 - BLOCK
      ?auto_109773 - BLOCK
      ?auto_109774 - BLOCK
      ?auto_109775 - BLOCK
      ?auto_109776 - BLOCK
      ?auto_109777 - BLOCK
    )
    :vars
    (
      ?auto_109778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109777 ?auto_109778 ) ( not ( = ?auto_109770 ?auto_109771 ) ) ( not ( = ?auto_109770 ?auto_109772 ) ) ( not ( = ?auto_109770 ?auto_109773 ) ) ( not ( = ?auto_109770 ?auto_109774 ) ) ( not ( = ?auto_109770 ?auto_109775 ) ) ( not ( = ?auto_109770 ?auto_109776 ) ) ( not ( = ?auto_109770 ?auto_109777 ) ) ( not ( = ?auto_109770 ?auto_109778 ) ) ( not ( = ?auto_109771 ?auto_109772 ) ) ( not ( = ?auto_109771 ?auto_109773 ) ) ( not ( = ?auto_109771 ?auto_109774 ) ) ( not ( = ?auto_109771 ?auto_109775 ) ) ( not ( = ?auto_109771 ?auto_109776 ) ) ( not ( = ?auto_109771 ?auto_109777 ) ) ( not ( = ?auto_109771 ?auto_109778 ) ) ( not ( = ?auto_109772 ?auto_109773 ) ) ( not ( = ?auto_109772 ?auto_109774 ) ) ( not ( = ?auto_109772 ?auto_109775 ) ) ( not ( = ?auto_109772 ?auto_109776 ) ) ( not ( = ?auto_109772 ?auto_109777 ) ) ( not ( = ?auto_109772 ?auto_109778 ) ) ( not ( = ?auto_109773 ?auto_109774 ) ) ( not ( = ?auto_109773 ?auto_109775 ) ) ( not ( = ?auto_109773 ?auto_109776 ) ) ( not ( = ?auto_109773 ?auto_109777 ) ) ( not ( = ?auto_109773 ?auto_109778 ) ) ( not ( = ?auto_109774 ?auto_109775 ) ) ( not ( = ?auto_109774 ?auto_109776 ) ) ( not ( = ?auto_109774 ?auto_109777 ) ) ( not ( = ?auto_109774 ?auto_109778 ) ) ( not ( = ?auto_109775 ?auto_109776 ) ) ( not ( = ?auto_109775 ?auto_109777 ) ) ( not ( = ?auto_109775 ?auto_109778 ) ) ( not ( = ?auto_109776 ?auto_109777 ) ) ( not ( = ?auto_109776 ?auto_109778 ) ) ( not ( = ?auto_109777 ?auto_109778 ) ) ( ON ?auto_109776 ?auto_109777 ) ( ON ?auto_109775 ?auto_109776 ) ( ON ?auto_109774 ?auto_109775 ) ( ON ?auto_109773 ?auto_109774 ) ( ON ?auto_109772 ?auto_109773 ) ( ON ?auto_109771 ?auto_109772 ) ( ON ?auto_109770 ?auto_109771 ) ( CLEAR ?auto_109770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_109770 )
      ( MAKE-8PILE ?auto_109770 ?auto_109771 ?auto_109772 ?auto_109773 ?auto_109774 ?auto_109775 ?auto_109776 ?auto_109777 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_109787 - BLOCK
      ?auto_109788 - BLOCK
      ?auto_109789 - BLOCK
      ?auto_109790 - BLOCK
      ?auto_109791 - BLOCK
      ?auto_109792 - BLOCK
      ?auto_109793 - BLOCK
      ?auto_109794 - BLOCK
    )
    :vars
    (
      ?auto_109795 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109794 ?auto_109795 ) ( not ( = ?auto_109787 ?auto_109788 ) ) ( not ( = ?auto_109787 ?auto_109789 ) ) ( not ( = ?auto_109787 ?auto_109790 ) ) ( not ( = ?auto_109787 ?auto_109791 ) ) ( not ( = ?auto_109787 ?auto_109792 ) ) ( not ( = ?auto_109787 ?auto_109793 ) ) ( not ( = ?auto_109787 ?auto_109794 ) ) ( not ( = ?auto_109787 ?auto_109795 ) ) ( not ( = ?auto_109788 ?auto_109789 ) ) ( not ( = ?auto_109788 ?auto_109790 ) ) ( not ( = ?auto_109788 ?auto_109791 ) ) ( not ( = ?auto_109788 ?auto_109792 ) ) ( not ( = ?auto_109788 ?auto_109793 ) ) ( not ( = ?auto_109788 ?auto_109794 ) ) ( not ( = ?auto_109788 ?auto_109795 ) ) ( not ( = ?auto_109789 ?auto_109790 ) ) ( not ( = ?auto_109789 ?auto_109791 ) ) ( not ( = ?auto_109789 ?auto_109792 ) ) ( not ( = ?auto_109789 ?auto_109793 ) ) ( not ( = ?auto_109789 ?auto_109794 ) ) ( not ( = ?auto_109789 ?auto_109795 ) ) ( not ( = ?auto_109790 ?auto_109791 ) ) ( not ( = ?auto_109790 ?auto_109792 ) ) ( not ( = ?auto_109790 ?auto_109793 ) ) ( not ( = ?auto_109790 ?auto_109794 ) ) ( not ( = ?auto_109790 ?auto_109795 ) ) ( not ( = ?auto_109791 ?auto_109792 ) ) ( not ( = ?auto_109791 ?auto_109793 ) ) ( not ( = ?auto_109791 ?auto_109794 ) ) ( not ( = ?auto_109791 ?auto_109795 ) ) ( not ( = ?auto_109792 ?auto_109793 ) ) ( not ( = ?auto_109792 ?auto_109794 ) ) ( not ( = ?auto_109792 ?auto_109795 ) ) ( not ( = ?auto_109793 ?auto_109794 ) ) ( not ( = ?auto_109793 ?auto_109795 ) ) ( not ( = ?auto_109794 ?auto_109795 ) ) ( ON ?auto_109793 ?auto_109794 ) ( ON ?auto_109792 ?auto_109793 ) ( ON ?auto_109791 ?auto_109792 ) ( ON ?auto_109790 ?auto_109791 ) ( ON ?auto_109789 ?auto_109790 ) ( ON ?auto_109788 ?auto_109789 ) ( ON ?auto_109787 ?auto_109788 ) ( CLEAR ?auto_109787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_109787 )
      ( MAKE-8PILE ?auto_109787 ?auto_109788 ?auto_109789 ?auto_109790 ?auto_109791 ?auto_109792 ?auto_109793 ?auto_109794 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_109805 - BLOCK
      ?auto_109806 - BLOCK
      ?auto_109807 - BLOCK
      ?auto_109808 - BLOCK
      ?auto_109809 - BLOCK
      ?auto_109810 - BLOCK
      ?auto_109811 - BLOCK
      ?auto_109812 - BLOCK
      ?auto_109813 - BLOCK
    )
    :vars
    (
      ?auto_109814 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_109812 ) ( ON ?auto_109813 ?auto_109814 ) ( CLEAR ?auto_109813 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_109805 ) ( ON ?auto_109806 ?auto_109805 ) ( ON ?auto_109807 ?auto_109806 ) ( ON ?auto_109808 ?auto_109807 ) ( ON ?auto_109809 ?auto_109808 ) ( ON ?auto_109810 ?auto_109809 ) ( ON ?auto_109811 ?auto_109810 ) ( ON ?auto_109812 ?auto_109811 ) ( not ( = ?auto_109805 ?auto_109806 ) ) ( not ( = ?auto_109805 ?auto_109807 ) ) ( not ( = ?auto_109805 ?auto_109808 ) ) ( not ( = ?auto_109805 ?auto_109809 ) ) ( not ( = ?auto_109805 ?auto_109810 ) ) ( not ( = ?auto_109805 ?auto_109811 ) ) ( not ( = ?auto_109805 ?auto_109812 ) ) ( not ( = ?auto_109805 ?auto_109813 ) ) ( not ( = ?auto_109805 ?auto_109814 ) ) ( not ( = ?auto_109806 ?auto_109807 ) ) ( not ( = ?auto_109806 ?auto_109808 ) ) ( not ( = ?auto_109806 ?auto_109809 ) ) ( not ( = ?auto_109806 ?auto_109810 ) ) ( not ( = ?auto_109806 ?auto_109811 ) ) ( not ( = ?auto_109806 ?auto_109812 ) ) ( not ( = ?auto_109806 ?auto_109813 ) ) ( not ( = ?auto_109806 ?auto_109814 ) ) ( not ( = ?auto_109807 ?auto_109808 ) ) ( not ( = ?auto_109807 ?auto_109809 ) ) ( not ( = ?auto_109807 ?auto_109810 ) ) ( not ( = ?auto_109807 ?auto_109811 ) ) ( not ( = ?auto_109807 ?auto_109812 ) ) ( not ( = ?auto_109807 ?auto_109813 ) ) ( not ( = ?auto_109807 ?auto_109814 ) ) ( not ( = ?auto_109808 ?auto_109809 ) ) ( not ( = ?auto_109808 ?auto_109810 ) ) ( not ( = ?auto_109808 ?auto_109811 ) ) ( not ( = ?auto_109808 ?auto_109812 ) ) ( not ( = ?auto_109808 ?auto_109813 ) ) ( not ( = ?auto_109808 ?auto_109814 ) ) ( not ( = ?auto_109809 ?auto_109810 ) ) ( not ( = ?auto_109809 ?auto_109811 ) ) ( not ( = ?auto_109809 ?auto_109812 ) ) ( not ( = ?auto_109809 ?auto_109813 ) ) ( not ( = ?auto_109809 ?auto_109814 ) ) ( not ( = ?auto_109810 ?auto_109811 ) ) ( not ( = ?auto_109810 ?auto_109812 ) ) ( not ( = ?auto_109810 ?auto_109813 ) ) ( not ( = ?auto_109810 ?auto_109814 ) ) ( not ( = ?auto_109811 ?auto_109812 ) ) ( not ( = ?auto_109811 ?auto_109813 ) ) ( not ( = ?auto_109811 ?auto_109814 ) ) ( not ( = ?auto_109812 ?auto_109813 ) ) ( not ( = ?auto_109812 ?auto_109814 ) ) ( not ( = ?auto_109813 ?auto_109814 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_109813 ?auto_109814 )
      ( !STACK ?auto_109813 ?auto_109812 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_109824 - BLOCK
      ?auto_109825 - BLOCK
      ?auto_109826 - BLOCK
      ?auto_109827 - BLOCK
      ?auto_109828 - BLOCK
      ?auto_109829 - BLOCK
      ?auto_109830 - BLOCK
      ?auto_109831 - BLOCK
      ?auto_109832 - BLOCK
    )
    :vars
    (
      ?auto_109833 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_109831 ) ( ON ?auto_109832 ?auto_109833 ) ( CLEAR ?auto_109832 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_109824 ) ( ON ?auto_109825 ?auto_109824 ) ( ON ?auto_109826 ?auto_109825 ) ( ON ?auto_109827 ?auto_109826 ) ( ON ?auto_109828 ?auto_109827 ) ( ON ?auto_109829 ?auto_109828 ) ( ON ?auto_109830 ?auto_109829 ) ( ON ?auto_109831 ?auto_109830 ) ( not ( = ?auto_109824 ?auto_109825 ) ) ( not ( = ?auto_109824 ?auto_109826 ) ) ( not ( = ?auto_109824 ?auto_109827 ) ) ( not ( = ?auto_109824 ?auto_109828 ) ) ( not ( = ?auto_109824 ?auto_109829 ) ) ( not ( = ?auto_109824 ?auto_109830 ) ) ( not ( = ?auto_109824 ?auto_109831 ) ) ( not ( = ?auto_109824 ?auto_109832 ) ) ( not ( = ?auto_109824 ?auto_109833 ) ) ( not ( = ?auto_109825 ?auto_109826 ) ) ( not ( = ?auto_109825 ?auto_109827 ) ) ( not ( = ?auto_109825 ?auto_109828 ) ) ( not ( = ?auto_109825 ?auto_109829 ) ) ( not ( = ?auto_109825 ?auto_109830 ) ) ( not ( = ?auto_109825 ?auto_109831 ) ) ( not ( = ?auto_109825 ?auto_109832 ) ) ( not ( = ?auto_109825 ?auto_109833 ) ) ( not ( = ?auto_109826 ?auto_109827 ) ) ( not ( = ?auto_109826 ?auto_109828 ) ) ( not ( = ?auto_109826 ?auto_109829 ) ) ( not ( = ?auto_109826 ?auto_109830 ) ) ( not ( = ?auto_109826 ?auto_109831 ) ) ( not ( = ?auto_109826 ?auto_109832 ) ) ( not ( = ?auto_109826 ?auto_109833 ) ) ( not ( = ?auto_109827 ?auto_109828 ) ) ( not ( = ?auto_109827 ?auto_109829 ) ) ( not ( = ?auto_109827 ?auto_109830 ) ) ( not ( = ?auto_109827 ?auto_109831 ) ) ( not ( = ?auto_109827 ?auto_109832 ) ) ( not ( = ?auto_109827 ?auto_109833 ) ) ( not ( = ?auto_109828 ?auto_109829 ) ) ( not ( = ?auto_109828 ?auto_109830 ) ) ( not ( = ?auto_109828 ?auto_109831 ) ) ( not ( = ?auto_109828 ?auto_109832 ) ) ( not ( = ?auto_109828 ?auto_109833 ) ) ( not ( = ?auto_109829 ?auto_109830 ) ) ( not ( = ?auto_109829 ?auto_109831 ) ) ( not ( = ?auto_109829 ?auto_109832 ) ) ( not ( = ?auto_109829 ?auto_109833 ) ) ( not ( = ?auto_109830 ?auto_109831 ) ) ( not ( = ?auto_109830 ?auto_109832 ) ) ( not ( = ?auto_109830 ?auto_109833 ) ) ( not ( = ?auto_109831 ?auto_109832 ) ) ( not ( = ?auto_109831 ?auto_109833 ) ) ( not ( = ?auto_109832 ?auto_109833 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_109832 ?auto_109833 )
      ( !STACK ?auto_109832 ?auto_109831 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_109843 - BLOCK
      ?auto_109844 - BLOCK
      ?auto_109845 - BLOCK
      ?auto_109846 - BLOCK
      ?auto_109847 - BLOCK
      ?auto_109848 - BLOCK
      ?auto_109849 - BLOCK
      ?auto_109850 - BLOCK
      ?auto_109851 - BLOCK
    )
    :vars
    (
      ?auto_109852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109851 ?auto_109852 ) ( ON-TABLE ?auto_109843 ) ( ON ?auto_109844 ?auto_109843 ) ( ON ?auto_109845 ?auto_109844 ) ( ON ?auto_109846 ?auto_109845 ) ( ON ?auto_109847 ?auto_109846 ) ( ON ?auto_109848 ?auto_109847 ) ( ON ?auto_109849 ?auto_109848 ) ( not ( = ?auto_109843 ?auto_109844 ) ) ( not ( = ?auto_109843 ?auto_109845 ) ) ( not ( = ?auto_109843 ?auto_109846 ) ) ( not ( = ?auto_109843 ?auto_109847 ) ) ( not ( = ?auto_109843 ?auto_109848 ) ) ( not ( = ?auto_109843 ?auto_109849 ) ) ( not ( = ?auto_109843 ?auto_109850 ) ) ( not ( = ?auto_109843 ?auto_109851 ) ) ( not ( = ?auto_109843 ?auto_109852 ) ) ( not ( = ?auto_109844 ?auto_109845 ) ) ( not ( = ?auto_109844 ?auto_109846 ) ) ( not ( = ?auto_109844 ?auto_109847 ) ) ( not ( = ?auto_109844 ?auto_109848 ) ) ( not ( = ?auto_109844 ?auto_109849 ) ) ( not ( = ?auto_109844 ?auto_109850 ) ) ( not ( = ?auto_109844 ?auto_109851 ) ) ( not ( = ?auto_109844 ?auto_109852 ) ) ( not ( = ?auto_109845 ?auto_109846 ) ) ( not ( = ?auto_109845 ?auto_109847 ) ) ( not ( = ?auto_109845 ?auto_109848 ) ) ( not ( = ?auto_109845 ?auto_109849 ) ) ( not ( = ?auto_109845 ?auto_109850 ) ) ( not ( = ?auto_109845 ?auto_109851 ) ) ( not ( = ?auto_109845 ?auto_109852 ) ) ( not ( = ?auto_109846 ?auto_109847 ) ) ( not ( = ?auto_109846 ?auto_109848 ) ) ( not ( = ?auto_109846 ?auto_109849 ) ) ( not ( = ?auto_109846 ?auto_109850 ) ) ( not ( = ?auto_109846 ?auto_109851 ) ) ( not ( = ?auto_109846 ?auto_109852 ) ) ( not ( = ?auto_109847 ?auto_109848 ) ) ( not ( = ?auto_109847 ?auto_109849 ) ) ( not ( = ?auto_109847 ?auto_109850 ) ) ( not ( = ?auto_109847 ?auto_109851 ) ) ( not ( = ?auto_109847 ?auto_109852 ) ) ( not ( = ?auto_109848 ?auto_109849 ) ) ( not ( = ?auto_109848 ?auto_109850 ) ) ( not ( = ?auto_109848 ?auto_109851 ) ) ( not ( = ?auto_109848 ?auto_109852 ) ) ( not ( = ?auto_109849 ?auto_109850 ) ) ( not ( = ?auto_109849 ?auto_109851 ) ) ( not ( = ?auto_109849 ?auto_109852 ) ) ( not ( = ?auto_109850 ?auto_109851 ) ) ( not ( = ?auto_109850 ?auto_109852 ) ) ( not ( = ?auto_109851 ?auto_109852 ) ) ( CLEAR ?auto_109849 ) ( ON ?auto_109850 ?auto_109851 ) ( CLEAR ?auto_109850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_109843 ?auto_109844 ?auto_109845 ?auto_109846 ?auto_109847 ?auto_109848 ?auto_109849 ?auto_109850 )
      ( MAKE-9PILE ?auto_109843 ?auto_109844 ?auto_109845 ?auto_109846 ?auto_109847 ?auto_109848 ?auto_109849 ?auto_109850 ?auto_109851 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_109862 - BLOCK
      ?auto_109863 - BLOCK
      ?auto_109864 - BLOCK
      ?auto_109865 - BLOCK
      ?auto_109866 - BLOCK
      ?auto_109867 - BLOCK
      ?auto_109868 - BLOCK
      ?auto_109869 - BLOCK
      ?auto_109870 - BLOCK
    )
    :vars
    (
      ?auto_109871 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109870 ?auto_109871 ) ( ON-TABLE ?auto_109862 ) ( ON ?auto_109863 ?auto_109862 ) ( ON ?auto_109864 ?auto_109863 ) ( ON ?auto_109865 ?auto_109864 ) ( ON ?auto_109866 ?auto_109865 ) ( ON ?auto_109867 ?auto_109866 ) ( ON ?auto_109868 ?auto_109867 ) ( not ( = ?auto_109862 ?auto_109863 ) ) ( not ( = ?auto_109862 ?auto_109864 ) ) ( not ( = ?auto_109862 ?auto_109865 ) ) ( not ( = ?auto_109862 ?auto_109866 ) ) ( not ( = ?auto_109862 ?auto_109867 ) ) ( not ( = ?auto_109862 ?auto_109868 ) ) ( not ( = ?auto_109862 ?auto_109869 ) ) ( not ( = ?auto_109862 ?auto_109870 ) ) ( not ( = ?auto_109862 ?auto_109871 ) ) ( not ( = ?auto_109863 ?auto_109864 ) ) ( not ( = ?auto_109863 ?auto_109865 ) ) ( not ( = ?auto_109863 ?auto_109866 ) ) ( not ( = ?auto_109863 ?auto_109867 ) ) ( not ( = ?auto_109863 ?auto_109868 ) ) ( not ( = ?auto_109863 ?auto_109869 ) ) ( not ( = ?auto_109863 ?auto_109870 ) ) ( not ( = ?auto_109863 ?auto_109871 ) ) ( not ( = ?auto_109864 ?auto_109865 ) ) ( not ( = ?auto_109864 ?auto_109866 ) ) ( not ( = ?auto_109864 ?auto_109867 ) ) ( not ( = ?auto_109864 ?auto_109868 ) ) ( not ( = ?auto_109864 ?auto_109869 ) ) ( not ( = ?auto_109864 ?auto_109870 ) ) ( not ( = ?auto_109864 ?auto_109871 ) ) ( not ( = ?auto_109865 ?auto_109866 ) ) ( not ( = ?auto_109865 ?auto_109867 ) ) ( not ( = ?auto_109865 ?auto_109868 ) ) ( not ( = ?auto_109865 ?auto_109869 ) ) ( not ( = ?auto_109865 ?auto_109870 ) ) ( not ( = ?auto_109865 ?auto_109871 ) ) ( not ( = ?auto_109866 ?auto_109867 ) ) ( not ( = ?auto_109866 ?auto_109868 ) ) ( not ( = ?auto_109866 ?auto_109869 ) ) ( not ( = ?auto_109866 ?auto_109870 ) ) ( not ( = ?auto_109866 ?auto_109871 ) ) ( not ( = ?auto_109867 ?auto_109868 ) ) ( not ( = ?auto_109867 ?auto_109869 ) ) ( not ( = ?auto_109867 ?auto_109870 ) ) ( not ( = ?auto_109867 ?auto_109871 ) ) ( not ( = ?auto_109868 ?auto_109869 ) ) ( not ( = ?auto_109868 ?auto_109870 ) ) ( not ( = ?auto_109868 ?auto_109871 ) ) ( not ( = ?auto_109869 ?auto_109870 ) ) ( not ( = ?auto_109869 ?auto_109871 ) ) ( not ( = ?auto_109870 ?auto_109871 ) ) ( CLEAR ?auto_109868 ) ( ON ?auto_109869 ?auto_109870 ) ( CLEAR ?auto_109869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_109862 ?auto_109863 ?auto_109864 ?auto_109865 ?auto_109866 ?auto_109867 ?auto_109868 ?auto_109869 )
      ( MAKE-9PILE ?auto_109862 ?auto_109863 ?auto_109864 ?auto_109865 ?auto_109866 ?auto_109867 ?auto_109868 ?auto_109869 ?auto_109870 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_109881 - BLOCK
      ?auto_109882 - BLOCK
      ?auto_109883 - BLOCK
      ?auto_109884 - BLOCK
      ?auto_109885 - BLOCK
      ?auto_109886 - BLOCK
      ?auto_109887 - BLOCK
      ?auto_109888 - BLOCK
      ?auto_109889 - BLOCK
    )
    :vars
    (
      ?auto_109890 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109889 ?auto_109890 ) ( ON-TABLE ?auto_109881 ) ( ON ?auto_109882 ?auto_109881 ) ( ON ?auto_109883 ?auto_109882 ) ( ON ?auto_109884 ?auto_109883 ) ( ON ?auto_109885 ?auto_109884 ) ( ON ?auto_109886 ?auto_109885 ) ( not ( = ?auto_109881 ?auto_109882 ) ) ( not ( = ?auto_109881 ?auto_109883 ) ) ( not ( = ?auto_109881 ?auto_109884 ) ) ( not ( = ?auto_109881 ?auto_109885 ) ) ( not ( = ?auto_109881 ?auto_109886 ) ) ( not ( = ?auto_109881 ?auto_109887 ) ) ( not ( = ?auto_109881 ?auto_109888 ) ) ( not ( = ?auto_109881 ?auto_109889 ) ) ( not ( = ?auto_109881 ?auto_109890 ) ) ( not ( = ?auto_109882 ?auto_109883 ) ) ( not ( = ?auto_109882 ?auto_109884 ) ) ( not ( = ?auto_109882 ?auto_109885 ) ) ( not ( = ?auto_109882 ?auto_109886 ) ) ( not ( = ?auto_109882 ?auto_109887 ) ) ( not ( = ?auto_109882 ?auto_109888 ) ) ( not ( = ?auto_109882 ?auto_109889 ) ) ( not ( = ?auto_109882 ?auto_109890 ) ) ( not ( = ?auto_109883 ?auto_109884 ) ) ( not ( = ?auto_109883 ?auto_109885 ) ) ( not ( = ?auto_109883 ?auto_109886 ) ) ( not ( = ?auto_109883 ?auto_109887 ) ) ( not ( = ?auto_109883 ?auto_109888 ) ) ( not ( = ?auto_109883 ?auto_109889 ) ) ( not ( = ?auto_109883 ?auto_109890 ) ) ( not ( = ?auto_109884 ?auto_109885 ) ) ( not ( = ?auto_109884 ?auto_109886 ) ) ( not ( = ?auto_109884 ?auto_109887 ) ) ( not ( = ?auto_109884 ?auto_109888 ) ) ( not ( = ?auto_109884 ?auto_109889 ) ) ( not ( = ?auto_109884 ?auto_109890 ) ) ( not ( = ?auto_109885 ?auto_109886 ) ) ( not ( = ?auto_109885 ?auto_109887 ) ) ( not ( = ?auto_109885 ?auto_109888 ) ) ( not ( = ?auto_109885 ?auto_109889 ) ) ( not ( = ?auto_109885 ?auto_109890 ) ) ( not ( = ?auto_109886 ?auto_109887 ) ) ( not ( = ?auto_109886 ?auto_109888 ) ) ( not ( = ?auto_109886 ?auto_109889 ) ) ( not ( = ?auto_109886 ?auto_109890 ) ) ( not ( = ?auto_109887 ?auto_109888 ) ) ( not ( = ?auto_109887 ?auto_109889 ) ) ( not ( = ?auto_109887 ?auto_109890 ) ) ( not ( = ?auto_109888 ?auto_109889 ) ) ( not ( = ?auto_109888 ?auto_109890 ) ) ( not ( = ?auto_109889 ?auto_109890 ) ) ( ON ?auto_109888 ?auto_109889 ) ( CLEAR ?auto_109886 ) ( ON ?auto_109887 ?auto_109888 ) ( CLEAR ?auto_109887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_109881 ?auto_109882 ?auto_109883 ?auto_109884 ?auto_109885 ?auto_109886 ?auto_109887 )
      ( MAKE-9PILE ?auto_109881 ?auto_109882 ?auto_109883 ?auto_109884 ?auto_109885 ?auto_109886 ?auto_109887 ?auto_109888 ?auto_109889 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_109900 - BLOCK
      ?auto_109901 - BLOCK
      ?auto_109902 - BLOCK
      ?auto_109903 - BLOCK
      ?auto_109904 - BLOCK
      ?auto_109905 - BLOCK
      ?auto_109906 - BLOCK
      ?auto_109907 - BLOCK
      ?auto_109908 - BLOCK
    )
    :vars
    (
      ?auto_109909 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109908 ?auto_109909 ) ( ON-TABLE ?auto_109900 ) ( ON ?auto_109901 ?auto_109900 ) ( ON ?auto_109902 ?auto_109901 ) ( ON ?auto_109903 ?auto_109902 ) ( ON ?auto_109904 ?auto_109903 ) ( ON ?auto_109905 ?auto_109904 ) ( not ( = ?auto_109900 ?auto_109901 ) ) ( not ( = ?auto_109900 ?auto_109902 ) ) ( not ( = ?auto_109900 ?auto_109903 ) ) ( not ( = ?auto_109900 ?auto_109904 ) ) ( not ( = ?auto_109900 ?auto_109905 ) ) ( not ( = ?auto_109900 ?auto_109906 ) ) ( not ( = ?auto_109900 ?auto_109907 ) ) ( not ( = ?auto_109900 ?auto_109908 ) ) ( not ( = ?auto_109900 ?auto_109909 ) ) ( not ( = ?auto_109901 ?auto_109902 ) ) ( not ( = ?auto_109901 ?auto_109903 ) ) ( not ( = ?auto_109901 ?auto_109904 ) ) ( not ( = ?auto_109901 ?auto_109905 ) ) ( not ( = ?auto_109901 ?auto_109906 ) ) ( not ( = ?auto_109901 ?auto_109907 ) ) ( not ( = ?auto_109901 ?auto_109908 ) ) ( not ( = ?auto_109901 ?auto_109909 ) ) ( not ( = ?auto_109902 ?auto_109903 ) ) ( not ( = ?auto_109902 ?auto_109904 ) ) ( not ( = ?auto_109902 ?auto_109905 ) ) ( not ( = ?auto_109902 ?auto_109906 ) ) ( not ( = ?auto_109902 ?auto_109907 ) ) ( not ( = ?auto_109902 ?auto_109908 ) ) ( not ( = ?auto_109902 ?auto_109909 ) ) ( not ( = ?auto_109903 ?auto_109904 ) ) ( not ( = ?auto_109903 ?auto_109905 ) ) ( not ( = ?auto_109903 ?auto_109906 ) ) ( not ( = ?auto_109903 ?auto_109907 ) ) ( not ( = ?auto_109903 ?auto_109908 ) ) ( not ( = ?auto_109903 ?auto_109909 ) ) ( not ( = ?auto_109904 ?auto_109905 ) ) ( not ( = ?auto_109904 ?auto_109906 ) ) ( not ( = ?auto_109904 ?auto_109907 ) ) ( not ( = ?auto_109904 ?auto_109908 ) ) ( not ( = ?auto_109904 ?auto_109909 ) ) ( not ( = ?auto_109905 ?auto_109906 ) ) ( not ( = ?auto_109905 ?auto_109907 ) ) ( not ( = ?auto_109905 ?auto_109908 ) ) ( not ( = ?auto_109905 ?auto_109909 ) ) ( not ( = ?auto_109906 ?auto_109907 ) ) ( not ( = ?auto_109906 ?auto_109908 ) ) ( not ( = ?auto_109906 ?auto_109909 ) ) ( not ( = ?auto_109907 ?auto_109908 ) ) ( not ( = ?auto_109907 ?auto_109909 ) ) ( not ( = ?auto_109908 ?auto_109909 ) ) ( ON ?auto_109907 ?auto_109908 ) ( CLEAR ?auto_109905 ) ( ON ?auto_109906 ?auto_109907 ) ( CLEAR ?auto_109906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_109900 ?auto_109901 ?auto_109902 ?auto_109903 ?auto_109904 ?auto_109905 ?auto_109906 )
      ( MAKE-9PILE ?auto_109900 ?auto_109901 ?auto_109902 ?auto_109903 ?auto_109904 ?auto_109905 ?auto_109906 ?auto_109907 ?auto_109908 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_109919 - BLOCK
      ?auto_109920 - BLOCK
      ?auto_109921 - BLOCK
      ?auto_109922 - BLOCK
      ?auto_109923 - BLOCK
      ?auto_109924 - BLOCK
      ?auto_109925 - BLOCK
      ?auto_109926 - BLOCK
      ?auto_109927 - BLOCK
    )
    :vars
    (
      ?auto_109928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109927 ?auto_109928 ) ( ON-TABLE ?auto_109919 ) ( ON ?auto_109920 ?auto_109919 ) ( ON ?auto_109921 ?auto_109920 ) ( ON ?auto_109922 ?auto_109921 ) ( ON ?auto_109923 ?auto_109922 ) ( not ( = ?auto_109919 ?auto_109920 ) ) ( not ( = ?auto_109919 ?auto_109921 ) ) ( not ( = ?auto_109919 ?auto_109922 ) ) ( not ( = ?auto_109919 ?auto_109923 ) ) ( not ( = ?auto_109919 ?auto_109924 ) ) ( not ( = ?auto_109919 ?auto_109925 ) ) ( not ( = ?auto_109919 ?auto_109926 ) ) ( not ( = ?auto_109919 ?auto_109927 ) ) ( not ( = ?auto_109919 ?auto_109928 ) ) ( not ( = ?auto_109920 ?auto_109921 ) ) ( not ( = ?auto_109920 ?auto_109922 ) ) ( not ( = ?auto_109920 ?auto_109923 ) ) ( not ( = ?auto_109920 ?auto_109924 ) ) ( not ( = ?auto_109920 ?auto_109925 ) ) ( not ( = ?auto_109920 ?auto_109926 ) ) ( not ( = ?auto_109920 ?auto_109927 ) ) ( not ( = ?auto_109920 ?auto_109928 ) ) ( not ( = ?auto_109921 ?auto_109922 ) ) ( not ( = ?auto_109921 ?auto_109923 ) ) ( not ( = ?auto_109921 ?auto_109924 ) ) ( not ( = ?auto_109921 ?auto_109925 ) ) ( not ( = ?auto_109921 ?auto_109926 ) ) ( not ( = ?auto_109921 ?auto_109927 ) ) ( not ( = ?auto_109921 ?auto_109928 ) ) ( not ( = ?auto_109922 ?auto_109923 ) ) ( not ( = ?auto_109922 ?auto_109924 ) ) ( not ( = ?auto_109922 ?auto_109925 ) ) ( not ( = ?auto_109922 ?auto_109926 ) ) ( not ( = ?auto_109922 ?auto_109927 ) ) ( not ( = ?auto_109922 ?auto_109928 ) ) ( not ( = ?auto_109923 ?auto_109924 ) ) ( not ( = ?auto_109923 ?auto_109925 ) ) ( not ( = ?auto_109923 ?auto_109926 ) ) ( not ( = ?auto_109923 ?auto_109927 ) ) ( not ( = ?auto_109923 ?auto_109928 ) ) ( not ( = ?auto_109924 ?auto_109925 ) ) ( not ( = ?auto_109924 ?auto_109926 ) ) ( not ( = ?auto_109924 ?auto_109927 ) ) ( not ( = ?auto_109924 ?auto_109928 ) ) ( not ( = ?auto_109925 ?auto_109926 ) ) ( not ( = ?auto_109925 ?auto_109927 ) ) ( not ( = ?auto_109925 ?auto_109928 ) ) ( not ( = ?auto_109926 ?auto_109927 ) ) ( not ( = ?auto_109926 ?auto_109928 ) ) ( not ( = ?auto_109927 ?auto_109928 ) ) ( ON ?auto_109926 ?auto_109927 ) ( ON ?auto_109925 ?auto_109926 ) ( CLEAR ?auto_109923 ) ( ON ?auto_109924 ?auto_109925 ) ( CLEAR ?auto_109924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_109919 ?auto_109920 ?auto_109921 ?auto_109922 ?auto_109923 ?auto_109924 )
      ( MAKE-9PILE ?auto_109919 ?auto_109920 ?auto_109921 ?auto_109922 ?auto_109923 ?auto_109924 ?auto_109925 ?auto_109926 ?auto_109927 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_109938 - BLOCK
      ?auto_109939 - BLOCK
      ?auto_109940 - BLOCK
      ?auto_109941 - BLOCK
      ?auto_109942 - BLOCK
      ?auto_109943 - BLOCK
      ?auto_109944 - BLOCK
      ?auto_109945 - BLOCK
      ?auto_109946 - BLOCK
    )
    :vars
    (
      ?auto_109947 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109946 ?auto_109947 ) ( ON-TABLE ?auto_109938 ) ( ON ?auto_109939 ?auto_109938 ) ( ON ?auto_109940 ?auto_109939 ) ( ON ?auto_109941 ?auto_109940 ) ( ON ?auto_109942 ?auto_109941 ) ( not ( = ?auto_109938 ?auto_109939 ) ) ( not ( = ?auto_109938 ?auto_109940 ) ) ( not ( = ?auto_109938 ?auto_109941 ) ) ( not ( = ?auto_109938 ?auto_109942 ) ) ( not ( = ?auto_109938 ?auto_109943 ) ) ( not ( = ?auto_109938 ?auto_109944 ) ) ( not ( = ?auto_109938 ?auto_109945 ) ) ( not ( = ?auto_109938 ?auto_109946 ) ) ( not ( = ?auto_109938 ?auto_109947 ) ) ( not ( = ?auto_109939 ?auto_109940 ) ) ( not ( = ?auto_109939 ?auto_109941 ) ) ( not ( = ?auto_109939 ?auto_109942 ) ) ( not ( = ?auto_109939 ?auto_109943 ) ) ( not ( = ?auto_109939 ?auto_109944 ) ) ( not ( = ?auto_109939 ?auto_109945 ) ) ( not ( = ?auto_109939 ?auto_109946 ) ) ( not ( = ?auto_109939 ?auto_109947 ) ) ( not ( = ?auto_109940 ?auto_109941 ) ) ( not ( = ?auto_109940 ?auto_109942 ) ) ( not ( = ?auto_109940 ?auto_109943 ) ) ( not ( = ?auto_109940 ?auto_109944 ) ) ( not ( = ?auto_109940 ?auto_109945 ) ) ( not ( = ?auto_109940 ?auto_109946 ) ) ( not ( = ?auto_109940 ?auto_109947 ) ) ( not ( = ?auto_109941 ?auto_109942 ) ) ( not ( = ?auto_109941 ?auto_109943 ) ) ( not ( = ?auto_109941 ?auto_109944 ) ) ( not ( = ?auto_109941 ?auto_109945 ) ) ( not ( = ?auto_109941 ?auto_109946 ) ) ( not ( = ?auto_109941 ?auto_109947 ) ) ( not ( = ?auto_109942 ?auto_109943 ) ) ( not ( = ?auto_109942 ?auto_109944 ) ) ( not ( = ?auto_109942 ?auto_109945 ) ) ( not ( = ?auto_109942 ?auto_109946 ) ) ( not ( = ?auto_109942 ?auto_109947 ) ) ( not ( = ?auto_109943 ?auto_109944 ) ) ( not ( = ?auto_109943 ?auto_109945 ) ) ( not ( = ?auto_109943 ?auto_109946 ) ) ( not ( = ?auto_109943 ?auto_109947 ) ) ( not ( = ?auto_109944 ?auto_109945 ) ) ( not ( = ?auto_109944 ?auto_109946 ) ) ( not ( = ?auto_109944 ?auto_109947 ) ) ( not ( = ?auto_109945 ?auto_109946 ) ) ( not ( = ?auto_109945 ?auto_109947 ) ) ( not ( = ?auto_109946 ?auto_109947 ) ) ( ON ?auto_109945 ?auto_109946 ) ( ON ?auto_109944 ?auto_109945 ) ( CLEAR ?auto_109942 ) ( ON ?auto_109943 ?auto_109944 ) ( CLEAR ?auto_109943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_109938 ?auto_109939 ?auto_109940 ?auto_109941 ?auto_109942 ?auto_109943 )
      ( MAKE-9PILE ?auto_109938 ?auto_109939 ?auto_109940 ?auto_109941 ?auto_109942 ?auto_109943 ?auto_109944 ?auto_109945 ?auto_109946 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_109957 - BLOCK
      ?auto_109958 - BLOCK
      ?auto_109959 - BLOCK
      ?auto_109960 - BLOCK
      ?auto_109961 - BLOCK
      ?auto_109962 - BLOCK
      ?auto_109963 - BLOCK
      ?auto_109964 - BLOCK
      ?auto_109965 - BLOCK
    )
    :vars
    (
      ?auto_109966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109965 ?auto_109966 ) ( ON-TABLE ?auto_109957 ) ( ON ?auto_109958 ?auto_109957 ) ( ON ?auto_109959 ?auto_109958 ) ( ON ?auto_109960 ?auto_109959 ) ( not ( = ?auto_109957 ?auto_109958 ) ) ( not ( = ?auto_109957 ?auto_109959 ) ) ( not ( = ?auto_109957 ?auto_109960 ) ) ( not ( = ?auto_109957 ?auto_109961 ) ) ( not ( = ?auto_109957 ?auto_109962 ) ) ( not ( = ?auto_109957 ?auto_109963 ) ) ( not ( = ?auto_109957 ?auto_109964 ) ) ( not ( = ?auto_109957 ?auto_109965 ) ) ( not ( = ?auto_109957 ?auto_109966 ) ) ( not ( = ?auto_109958 ?auto_109959 ) ) ( not ( = ?auto_109958 ?auto_109960 ) ) ( not ( = ?auto_109958 ?auto_109961 ) ) ( not ( = ?auto_109958 ?auto_109962 ) ) ( not ( = ?auto_109958 ?auto_109963 ) ) ( not ( = ?auto_109958 ?auto_109964 ) ) ( not ( = ?auto_109958 ?auto_109965 ) ) ( not ( = ?auto_109958 ?auto_109966 ) ) ( not ( = ?auto_109959 ?auto_109960 ) ) ( not ( = ?auto_109959 ?auto_109961 ) ) ( not ( = ?auto_109959 ?auto_109962 ) ) ( not ( = ?auto_109959 ?auto_109963 ) ) ( not ( = ?auto_109959 ?auto_109964 ) ) ( not ( = ?auto_109959 ?auto_109965 ) ) ( not ( = ?auto_109959 ?auto_109966 ) ) ( not ( = ?auto_109960 ?auto_109961 ) ) ( not ( = ?auto_109960 ?auto_109962 ) ) ( not ( = ?auto_109960 ?auto_109963 ) ) ( not ( = ?auto_109960 ?auto_109964 ) ) ( not ( = ?auto_109960 ?auto_109965 ) ) ( not ( = ?auto_109960 ?auto_109966 ) ) ( not ( = ?auto_109961 ?auto_109962 ) ) ( not ( = ?auto_109961 ?auto_109963 ) ) ( not ( = ?auto_109961 ?auto_109964 ) ) ( not ( = ?auto_109961 ?auto_109965 ) ) ( not ( = ?auto_109961 ?auto_109966 ) ) ( not ( = ?auto_109962 ?auto_109963 ) ) ( not ( = ?auto_109962 ?auto_109964 ) ) ( not ( = ?auto_109962 ?auto_109965 ) ) ( not ( = ?auto_109962 ?auto_109966 ) ) ( not ( = ?auto_109963 ?auto_109964 ) ) ( not ( = ?auto_109963 ?auto_109965 ) ) ( not ( = ?auto_109963 ?auto_109966 ) ) ( not ( = ?auto_109964 ?auto_109965 ) ) ( not ( = ?auto_109964 ?auto_109966 ) ) ( not ( = ?auto_109965 ?auto_109966 ) ) ( ON ?auto_109964 ?auto_109965 ) ( ON ?auto_109963 ?auto_109964 ) ( ON ?auto_109962 ?auto_109963 ) ( CLEAR ?auto_109960 ) ( ON ?auto_109961 ?auto_109962 ) ( CLEAR ?auto_109961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_109957 ?auto_109958 ?auto_109959 ?auto_109960 ?auto_109961 )
      ( MAKE-9PILE ?auto_109957 ?auto_109958 ?auto_109959 ?auto_109960 ?auto_109961 ?auto_109962 ?auto_109963 ?auto_109964 ?auto_109965 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_109976 - BLOCK
      ?auto_109977 - BLOCK
      ?auto_109978 - BLOCK
      ?auto_109979 - BLOCK
      ?auto_109980 - BLOCK
      ?auto_109981 - BLOCK
      ?auto_109982 - BLOCK
      ?auto_109983 - BLOCK
      ?auto_109984 - BLOCK
    )
    :vars
    (
      ?auto_109985 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109984 ?auto_109985 ) ( ON-TABLE ?auto_109976 ) ( ON ?auto_109977 ?auto_109976 ) ( ON ?auto_109978 ?auto_109977 ) ( ON ?auto_109979 ?auto_109978 ) ( not ( = ?auto_109976 ?auto_109977 ) ) ( not ( = ?auto_109976 ?auto_109978 ) ) ( not ( = ?auto_109976 ?auto_109979 ) ) ( not ( = ?auto_109976 ?auto_109980 ) ) ( not ( = ?auto_109976 ?auto_109981 ) ) ( not ( = ?auto_109976 ?auto_109982 ) ) ( not ( = ?auto_109976 ?auto_109983 ) ) ( not ( = ?auto_109976 ?auto_109984 ) ) ( not ( = ?auto_109976 ?auto_109985 ) ) ( not ( = ?auto_109977 ?auto_109978 ) ) ( not ( = ?auto_109977 ?auto_109979 ) ) ( not ( = ?auto_109977 ?auto_109980 ) ) ( not ( = ?auto_109977 ?auto_109981 ) ) ( not ( = ?auto_109977 ?auto_109982 ) ) ( not ( = ?auto_109977 ?auto_109983 ) ) ( not ( = ?auto_109977 ?auto_109984 ) ) ( not ( = ?auto_109977 ?auto_109985 ) ) ( not ( = ?auto_109978 ?auto_109979 ) ) ( not ( = ?auto_109978 ?auto_109980 ) ) ( not ( = ?auto_109978 ?auto_109981 ) ) ( not ( = ?auto_109978 ?auto_109982 ) ) ( not ( = ?auto_109978 ?auto_109983 ) ) ( not ( = ?auto_109978 ?auto_109984 ) ) ( not ( = ?auto_109978 ?auto_109985 ) ) ( not ( = ?auto_109979 ?auto_109980 ) ) ( not ( = ?auto_109979 ?auto_109981 ) ) ( not ( = ?auto_109979 ?auto_109982 ) ) ( not ( = ?auto_109979 ?auto_109983 ) ) ( not ( = ?auto_109979 ?auto_109984 ) ) ( not ( = ?auto_109979 ?auto_109985 ) ) ( not ( = ?auto_109980 ?auto_109981 ) ) ( not ( = ?auto_109980 ?auto_109982 ) ) ( not ( = ?auto_109980 ?auto_109983 ) ) ( not ( = ?auto_109980 ?auto_109984 ) ) ( not ( = ?auto_109980 ?auto_109985 ) ) ( not ( = ?auto_109981 ?auto_109982 ) ) ( not ( = ?auto_109981 ?auto_109983 ) ) ( not ( = ?auto_109981 ?auto_109984 ) ) ( not ( = ?auto_109981 ?auto_109985 ) ) ( not ( = ?auto_109982 ?auto_109983 ) ) ( not ( = ?auto_109982 ?auto_109984 ) ) ( not ( = ?auto_109982 ?auto_109985 ) ) ( not ( = ?auto_109983 ?auto_109984 ) ) ( not ( = ?auto_109983 ?auto_109985 ) ) ( not ( = ?auto_109984 ?auto_109985 ) ) ( ON ?auto_109983 ?auto_109984 ) ( ON ?auto_109982 ?auto_109983 ) ( ON ?auto_109981 ?auto_109982 ) ( CLEAR ?auto_109979 ) ( ON ?auto_109980 ?auto_109981 ) ( CLEAR ?auto_109980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_109976 ?auto_109977 ?auto_109978 ?auto_109979 ?auto_109980 )
      ( MAKE-9PILE ?auto_109976 ?auto_109977 ?auto_109978 ?auto_109979 ?auto_109980 ?auto_109981 ?auto_109982 ?auto_109983 ?auto_109984 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_109995 - BLOCK
      ?auto_109996 - BLOCK
      ?auto_109997 - BLOCK
      ?auto_109998 - BLOCK
      ?auto_109999 - BLOCK
      ?auto_110000 - BLOCK
      ?auto_110001 - BLOCK
      ?auto_110002 - BLOCK
      ?auto_110003 - BLOCK
    )
    :vars
    (
      ?auto_110004 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110003 ?auto_110004 ) ( ON-TABLE ?auto_109995 ) ( ON ?auto_109996 ?auto_109995 ) ( ON ?auto_109997 ?auto_109996 ) ( not ( = ?auto_109995 ?auto_109996 ) ) ( not ( = ?auto_109995 ?auto_109997 ) ) ( not ( = ?auto_109995 ?auto_109998 ) ) ( not ( = ?auto_109995 ?auto_109999 ) ) ( not ( = ?auto_109995 ?auto_110000 ) ) ( not ( = ?auto_109995 ?auto_110001 ) ) ( not ( = ?auto_109995 ?auto_110002 ) ) ( not ( = ?auto_109995 ?auto_110003 ) ) ( not ( = ?auto_109995 ?auto_110004 ) ) ( not ( = ?auto_109996 ?auto_109997 ) ) ( not ( = ?auto_109996 ?auto_109998 ) ) ( not ( = ?auto_109996 ?auto_109999 ) ) ( not ( = ?auto_109996 ?auto_110000 ) ) ( not ( = ?auto_109996 ?auto_110001 ) ) ( not ( = ?auto_109996 ?auto_110002 ) ) ( not ( = ?auto_109996 ?auto_110003 ) ) ( not ( = ?auto_109996 ?auto_110004 ) ) ( not ( = ?auto_109997 ?auto_109998 ) ) ( not ( = ?auto_109997 ?auto_109999 ) ) ( not ( = ?auto_109997 ?auto_110000 ) ) ( not ( = ?auto_109997 ?auto_110001 ) ) ( not ( = ?auto_109997 ?auto_110002 ) ) ( not ( = ?auto_109997 ?auto_110003 ) ) ( not ( = ?auto_109997 ?auto_110004 ) ) ( not ( = ?auto_109998 ?auto_109999 ) ) ( not ( = ?auto_109998 ?auto_110000 ) ) ( not ( = ?auto_109998 ?auto_110001 ) ) ( not ( = ?auto_109998 ?auto_110002 ) ) ( not ( = ?auto_109998 ?auto_110003 ) ) ( not ( = ?auto_109998 ?auto_110004 ) ) ( not ( = ?auto_109999 ?auto_110000 ) ) ( not ( = ?auto_109999 ?auto_110001 ) ) ( not ( = ?auto_109999 ?auto_110002 ) ) ( not ( = ?auto_109999 ?auto_110003 ) ) ( not ( = ?auto_109999 ?auto_110004 ) ) ( not ( = ?auto_110000 ?auto_110001 ) ) ( not ( = ?auto_110000 ?auto_110002 ) ) ( not ( = ?auto_110000 ?auto_110003 ) ) ( not ( = ?auto_110000 ?auto_110004 ) ) ( not ( = ?auto_110001 ?auto_110002 ) ) ( not ( = ?auto_110001 ?auto_110003 ) ) ( not ( = ?auto_110001 ?auto_110004 ) ) ( not ( = ?auto_110002 ?auto_110003 ) ) ( not ( = ?auto_110002 ?auto_110004 ) ) ( not ( = ?auto_110003 ?auto_110004 ) ) ( ON ?auto_110002 ?auto_110003 ) ( ON ?auto_110001 ?auto_110002 ) ( ON ?auto_110000 ?auto_110001 ) ( ON ?auto_109999 ?auto_110000 ) ( CLEAR ?auto_109997 ) ( ON ?auto_109998 ?auto_109999 ) ( CLEAR ?auto_109998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_109995 ?auto_109996 ?auto_109997 ?auto_109998 )
      ( MAKE-9PILE ?auto_109995 ?auto_109996 ?auto_109997 ?auto_109998 ?auto_109999 ?auto_110000 ?auto_110001 ?auto_110002 ?auto_110003 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_110014 - BLOCK
      ?auto_110015 - BLOCK
      ?auto_110016 - BLOCK
      ?auto_110017 - BLOCK
      ?auto_110018 - BLOCK
      ?auto_110019 - BLOCK
      ?auto_110020 - BLOCK
      ?auto_110021 - BLOCK
      ?auto_110022 - BLOCK
    )
    :vars
    (
      ?auto_110023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110022 ?auto_110023 ) ( ON-TABLE ?auto_110014 ) ( ON ?auto_110015 ?auto_110014 ) ( ON ?auto_110016 ?auto_110015 ) ( not ( = ?auto_110014 ?auto_110015 ) ) ( not ( = ?auto_110014 ?auto_110016 ) ) ( not ( = ?auto_110014 ?auto_110017 ) ) ( not ( = ?auto_110014 ?auto_110018 ) ) ( not ( = ?auto_110014 ?auto_110019 ) ) ( not ( = ?auto_110014 ?auto_110020 ) ) ( not ( = ?auto_110014 ?auto_110021 ) ) ( not ( = ?auto_110014 ?auto_110022 ) ) ( not ( = ?auto_110014 ?auto_110023 ) ) ( not ( = ?auto_110015 ?auto_110016 ) ) ( not ( = ?auto_110015 ?auto_110017 ) ) ( not ( = ?auto_110015 ?auto_110018 ) ) ( not ( = ?auto_110015 ?auto_110019 ) ) ( not ( = ?auto_110015 ?auto_110020 ) ) ( not ( = ?auto_110015 ?auto_110021 ) ) ( not ( = ?auto_110015 ?auto_110022 ) ) ( not ( = ?auto_110015 ?auto_110023 ) ) ( not ( = ?auto_110016 ?auto_110017 ) ) ( not ( = ?auto_110016 ?auto_110018 ) ) ( not ( = ?auto_110016 ?auto_110019 ) ) ( not ( = ?auto_110016 ?auto_110020 ) ) ( not ( = ?auto_110016 ?auto_110021 ) ) ( not ( = ?auto_110016 ?auto_110022 ) ) ( not ( = ?auto_110016 ?auto_110023 ) ) ( not ( = ?auto_110017 ?auto_110018 ) ) ( not ( = ?auto_110017 ?auto_110019 ) ) ( not ( = ?auto_110017 ?auto_110020 ) ) ( not ( = ?auto_110017 ?auto_110021 ) ) ( not ( = ?auto_110017 ?auto_110022 ) ) ( not ( = ?auto_110017 ?auto_110023 ) ) ( not ( = ?auto_110018 ?auto_110019 ) ) ( not ( = ?auto_110018 ?auto_110020 ) ) ( not ( = ?auto_110018 ?auto_110021 ) ) ( not ( = ?auto_110018 ?auto_110022 ) ) ( not ( = ?auto_110018 ?auto_110023 ) ) ( not ( = ?auto_110019 ?auto_110020 ) ) ( not ( = ?auto_110019 ?auto_110021 ) ) ( not ( = ?auto_110019 ?auto_110022 ) ) ( not ( = ?auto_110019 ?auto_110023 ) ) ( not ( = ?auto_110020 ?auto_110021 ) ) ( not ( = ?auto_110020 ?auto_110022 ) ) ( not ( = ?auto_110020 ?auto_110023 ) ) ( not ( = ?auto_110021 ?auto_110022 ) ) ( not ( = ?auto_110021 ?auto_110023 ) ) ( not ( = ?auto_110022 ?auto_110023 ) ) ( ON ?auto_110021 ?auto_110022 ) ( ON ?auto_110020 ?auto_110021 ) ( ON ?auto_110019 ?auto_110020 ) ( ON ?auto_110018 ?auto_110019 ) ( CLEAR ?auto_110016 ) ( ON ?auto_110017 ?auto_110018 ) ( CLEAR ?auto_110017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_110014 ?auto_110015 ?auto_110016 ?auto_110017 )
      ( MAKE-9PILE ?auto_110014 ?auto_110015 ?auto_110016 ?auto_110017 ?auto_110018 ?auto_110019 ?auto_110020 ?auto_110021 ?auto_110022 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_110033 - BLOCK
      ?auto_110034 - BLOCK
      ?auto_110035 - BLOCK
      ?auto_110036 - BLOCK
      ?auto_110037 - BLOCK
      ?auto_110038 - BLOCK
      ?auto_110039 - BLOCK
      ?auto_110040 - BLOCK
      ?auto_110041 - BLOCK
    )
    :vars
    (
      ?auto_110042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110041 ?auto_110042 ) ( ON-TABLE ?auto_110033 ) ( ON ?auto_110034 ?auto_110033 ) ( not ( = ?auto_110033 ?auto_110034 ) ) ( not ( = ?auto_110033 ?auto_110035 ) ) ( not ( = ?auto_110033 ?auto_110036 ) ) ( not ( = ?auto_110033 ?auto_110037 ) ) ( not ( = ?auto_110033 ?auto_110038 ) ) ( not ( = ?auto_110033 ?auto_110039 ) ) ( not ( = ?auto_110033 ?auto_110040 ) ) ( not ( = ?auto_110033 ?auto_110041 ) ) ( not ( = ?auto_110033 ?auto_110042 ) ) ( not ( = ?auto_110034 ?auto_110035 ) ) ( not ( = ?auto_110034 ?auto_110036 ) ) ( not ( = ?auto_110034 ?auto_110037 ) ) ( not ( = ?auto_110034 ?auto_110038 ) ) ( not ( = ?auto_110034 ?auto_110039 ) ) ( not ( = ?auto_110034 ?auto_110040 ) ) ( not ( = ?auto_110034 ?auto_110041 ) ) ( not ( = ?auto_110034 ?auto_110042 ) ) ( not ( = ?auto_110035 ?auto_110036 ) ) ( not ( = ?auto_110035 ?auto_110037 ) ) ( not ( = ?auto_110035 ?auto_110038 ) ) ( not ( = ?auto_110035 ?auto_110039 ) ) ( not ( = ?auto_110035 ?auto_110040 ) ) ( not ( = ?auto_110035 ?auto_110041 ) ) ( not ( = ?auto_110035 ?auto_110042 ) ) ( not ( = ?auto_110036 ?auto_110037 ) ) ( not ( = ?auto_110036 ?auto_110038 ) ) ( not ( = ?auto_110036 ?auto_110039 ) ) ( not ( = ?auto_110036 ?auto_110040 ) ) ( not ( = ?auto_110036 ?auto_110041 ) ) ( not ( = ?auto_110036 ?auto_110042 ) ) ( not ( = ?auto_110037 ?auto_110038 ) ) ( not ( = ?auto_110037 ?auto_110039 ) ) ( not ( = ?auto_110037 ?auto_110040 ) ) ( not ( = ?auto_110037 ?auto_110041 ) ) ( not ( = ?auto_110037 ?auto_110042 ) ) ( not ( = ?auto_110038 ?auto_110039 ) ) ( not ( = ?auto_110038 ?auto_110040 ) ) ( not ( = ?auto_110038 ?auto_110041 ) ) ( not ( = ?auto_110038 ?auto_110042 ) ) ( not ( = ?auto_110039 ?auto_110040 ) ) ( not ( = ?auto_110039 ?auto_110041 ) ) ( not ( = ?auto_110039 ?auto_110042 ) ) ( not ( = ?auto_110040 ?auto_110041 ) ) ( not ( = ?auto_110040 ?auto_110042 ) ) ( not ( = ?auto_110041 ?auto_110042 ) ) ( ON ?auto_110040 ?auto_110041 ) ( ON ?auto_110039 ?auto_110040 ) ( ON ?auto_110038 ?auto_110039 ) ( ON ?auto_110037 ?auto_110038 ) ( ON ?auto_110036 ?auto_110037 ) ( CLEAR ?auto_110034 ) ( ON ?auto_110035 ?auto_110036 ) ( CLEAR ?auto_110035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_110033 ?auto_110034 ?auto_110035 )
      ( MAKE-9PILE ?auto_110033 ?auto_110034 ?auto_110035 ?auto_110036 ?auto_110037 ?auto_110038 ?auto_110039 ?auto_110040 ?auto_110041 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_110052 - BLOCK
      ?auto_110053 - BLOCK
      ?auto_110054 - BLOCK
      ?auto_110055 - BLOCK
      ?auto_110056 - BLOCK
      ?auto_110057 - BLOCK
      ?auto_110058 - BLOCK
      ?auto_110059 - BLOCK
      ?auto_110060 - BLOCK
    )
    :vars
    (
      ?auto_110061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110060 ?auto_110061 ) ( ON-TABLE ?auto_110052 ) ( ON ?auto_110053 ?auto_110052 ) ( not ( = ?auto_110052 ?auto_110053 ) ) ( not ( = ?auto_110052 ?auto_110054 ) ) ( not ( = ?auto_110052 ?auto_110055 ) ) ( not ( = ?auto_110052 ?auto_110056 ) ) ( not ( = ?auto_110052 ?auto_110057 ) ) ( not ( = ?auto_110052 ?auto_110058 ) ) ( not ( = ?auto_110052 ?auto_110059 ) ) ( not ( = ?auto_110052 ?auto_110060 ) ) ( not ( = ?auto_110052 ?auto_110061 ) ) ( not ( = ?auto_110053 ?auto_110054 ) ) ( not ( = ?auto_110053 ?auto_110055 ) ) ( not ( = ?auto_110053 ?auto_110056 ) ) ( not ( = ?auto_110053 ?auto_110057 ) ) ( not ( = ?auto_110053 ?auto_110058 ) ) ( not ( = ?auto_110053 ?auto_110059 ) ) ( not ( = ?auto_110053 ?auto_110060 ) ) ( not ( = ?auto_110053 ?auto_110061 ) ) ( not ( = ?auto_110054 ?auto_110055 ) ) ( not ( = ?auto_110054 ?auto_110056 ) ) ( not ( = ?auto_110054 ?auto_110057 ) ) ( not ( = ?auto_110054 ?auto_110058 ) ) ( not ( = ?auto_110054 ?auto_110059 ) ) ( not ( = ?auto_110054 ?auto_110060 ) ) ( not ( = ?auto_110054 ?auto_110061 ) ) ( not ( = ?auto_110055 ?auto_110056 ) ) ( not ( = ?auto_110055 ?auto_110057 ) ) ( not ( = ?auto_110055 ?auto_110058 ) ) ( not ( = ?auto_110055 ?auto_110059 ) ) ( not ( = ?auto_110055 ?auto_110060 ) ) ( not ( = ?auto_110055 ?auto_110061 ) ) ( not ( = ?auto_110056 ?auto_110057 ) ) ( not ( = ?auto_110056 ?auto_110058 ) ) ( not ( = ?auto_110056 ?auto_110059 ) ) ( not ( = ?auto_110056 ?auto_110060 ) ) ( not ( = ?auto_110056 ?auto_110061 ) ) ( not ( = ?auto_110057 ?auto_110058 ) ) ( not ( = ?auto_110057 ?auto_110059 ) ) ( not ( = ?auto_110057 ?auto_110060 ) ) ( not ( = ?auto_110057 ?auto_110061 ) ) ( not ( = ?auto_110058 ?auto_110059 ) ) ( not ( = ?auto_110058 ?auto_110060 ) ) ( not ( = ?auto_110058 ?auto_110061 ) ) ( not ( = ?auto_110059 ?auto_110060 ) ) ( not ( = ?auto_110059 ?auto_110061 ) ) ( not ( = ?auto_110060 ?auto_110061 ) ) ( ON ?auto_110059 ?auto_110060 ) ( ON ?auto_110058 ?auto_110059 ) ( ON ?auto_110057 ?auto_110058 ) ( ON ?auto_110056 ?auto_110057 ) ( ON ?auto_110055 ?auto_110056 ) ( CLEAR ?auto_110053 ) ( ON ?auto_110054 ?auto_110055 ) ( CLEAR ?auto_110054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_110052 ?auto_110053 ?auto_110054 )
      ( MAKE-9PILE ?auto_110052 ?auto_110053 ?auto_110054 ?auto_110055 ?auto_110056 ?auto_110057 ?auto_110058 ?auto_110059 ?auto_110060 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_110071 - BLOCK
      ?auto_110072 - BLOCK
      ?auto_110073 - BLOCK
      ?auto_110074 - BLOCK
      ?auto_110075 - BLOCK
      ?auto_110076 - BLOCK
      ?auto_110077 - BLOCK
      ?auto_110078 - BLOCK
      ?auto_110079 - BLOCK
    )
    :vars
    (
      ?auto_110080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110079 ?auto_110080 ) ( ON-TABLE ?auto_110071 ) ( not ( = ?auto_110071 ?auto_110072 ) ) ( not ( = ?auto_110071 ?auto_110073 ) ) ( not ( = ?auto_110071 ?auto_110074 ) ) ( not ( = ?auto_110071 ?auto_110075 ) ) ( not ( = ?auto_110071 ?auto_110076 ) ) ( not ( = ?auto_110071 ?auto_110077 ) ) ( not ( = ?auto_110071 ?auto_110078 ) ) ( not ( = ?auto_110071 ?auto_110079 ) ) ( not ( = ?auto_110071 ?auto_110080 ) ) ( not ( = ?auto_110072 ?auto_110073 ) ) ( not ( = ?auto_110072 ?auto_110074 ) ) ( not ( = ?auto_110072 ?auto_110075 ) ) ( not ( = ?auto_110072 ?auto_110076 ) ) ( not ( = ?auto_110072 ?auto_110077 ) ) ( not ( = ?auto_110072 ?auto_110078 ) ) ( not ( = ?auto_110072 ?auto_110079 ) ) ( not ( = ?auto_110072 ?auto_110080 ) ) ( not ( = ?auto_110073 ?auto_110074 ) ) ( not ( = ?auto_110073 ?auto_110075 ) ) ( not ( = ?auto_110073 ?auto_110076 ) ) ( not ( = ?auto_110073 ?auto_110077 ) ) ( not ( = ?auto_110073 ?auto_110078 ) ) ( not ( = ?auto_110073 ?auto_110079 ) ) ( not ( = ?auto_110073 ?auto_110080 ) ) ( not ( = ?auto_110074 ?auto_110075 ) ) ( not ( = ?auto_110074 ?auto_110076 ) ) ( not ( = ?auto_110074 ?auto_110077 ) ) ( not ( = ?auto_110074 ?auto_110078 ) ) ( not ( = ?auto_110074 ?auto_110079 ) ) ( not ( = ?auto_110074 ?auto_110080 ) ) ( not ( = ?auto_110075 ?auto_110076 ) ) ( not ( = ?auto_110075 ?auto_110077 ) ) ( not ( = ?auto_110075 ?auto_110078 ) ) ( not ( = ?auto_110075 ?auto_110079 ) ) ( not ( = ?auto_110075 ?auto_110080 ) ) ( not ( = ?auto_110076 ?auto_110077 ) ) ( not ( = ?auto_110076 ?auto_110078 ) ) ( not ( = ?auto_110076 ?auto_110079 ) ) ( not ( = ?auto_110076 ?auto_110080 ) ) ( not ( = ?auto_110077 ?auto_110078 ) ) ( not ( = ?auto_110077 ?auto_110079 ) ) ( not ( = ?auto_110077 ?auto_110080 ) ) ( not ( = ?auto_110078 ?auto_110079 ) ) ( not ( = ?auto_110078 ?auto_110080 ) ) ( not ( = ?auto_110079 ?auto_110080 ) ) ( ON ?auto_110078 ?auto_110079 ) ( ON ?auto_110077 ?auto_110078 ) ( ON ?auto_110076 ?auto_110077 ) ( ON ?auto_110075 ?auto_110076 ) ( ON ?auto_110074 ?auto_110075 ) ( ON ?auto_110073 ?auto_110074 ) ( CLEAR ?auto_110071 ) ( ON ?auto_110072 ?auto_110073 ) ( CLEAR ?auto_110072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_110071 ?auto_110072 )
      ( MAKE-9PILE ?auto_110071 ?auto_110072 ?auto_110073 ?auto_110074 ?auto_110075 ?auto_110076 ?auto_110077 ?auto_110078 ?auto_110079 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_110090 - BLOCK
      ?auto_110091 - BLOCK
      ?auto_110092 - BLOCK
      ?auto_110093 - BLOCK
      ?auto_110094 - BLOCK
      ?auto_110095 - BLOCK
      ?auto_110096 - BLOCK
      ?auto_110097 - BLOCK
      ?auto_110098 - BLOCK
    )
    :vars
    (
      ?auto_110099 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110098 ?auto_110099 ) ( ON-TABLE ?auto_110090 ) ( not ( = ?auto_110090 ?auto_110091 ) ) ( not ( = ?auto_110090 ?auto_110092 ) ) ( not ( = ?auto_110090 ?auto_110093 ) ) ( not ( = ?auto_110090 ?auto_110094 ) ) ( not ( = ?auto_110090 ?auto_110095 ) ) ( not ( = ?auto_110090 ?auto_110096 ) ) ( not ( = ?auto_110090 ?auto_110097 ) ) ( not ( = ?auto_110090 ?auto_110098 ) ) ( not ( = ?auto_110090 ?auto_110099 ) ) ( not ( = ?auto_110091 ?auto_110092 ) ) ( not ( = ?auto_110091 ?auto_110093 ) ) ( not ( = ?auto_110091 ?auto_110094 ) ) ( not ( = ?auto_110091 ?auto_110095 ) ) ( not ( = ?auto_110091 ?auto_110096 ) ) ( not ( = ?auto_110091 ?auto_110097 ) ) ( not ( = ?auto_110091 ?auto_110098 ) ) ( not ( = ?auto_110091 ?auto_110099 ) ) ( not ( = ?auto_110092 ?auto_110093 ) ) ( not ( = ?auto_110092 ?auto_110094 ) ) ( not ( = ?auto_110092 ?auto_110095 ) ) ( not ( = ?auto_110092 ?auto_110096 ) ) ( not ( = ?auto_110092 ?auto_110097 ) ) ( not ( = ?auto_110092 ?auto_110098 ) ) ( not ( = ?auto_110092 ?auto_110099 ) ) ( not ( = ?auto_110093 ?auto_110094 ) ) ( not ( = ?auto_110093 ?auto_110095 ) ) ( not ( = ?auto_110093 ?auto_110096 ) ) ( not ( = ?auto_110093 ?auto_110097 ) ) ( not ( = ?auto_110093 ?auto_110098 ) ) ( not ( = ?auto_110093 ?auto_110099 ) ) ( not ( = ?auto_110094 ?auto_110095 ) ) ( not ( = ?auto_110094 ?auto_110096 ) ) ( not ( = ?auto_110094 ?auto_110097 ) ) ( not ( = ?auto_110094 ?auto_110098 ) ) ( not ( = ?auto_110094 ?auto_110099 ) ) ( not ( = ?auto_110095 ?auto_110096 ) ) ( not ( = ?auto_110095 ?auto_110097 ) ) ( not ( = ?auto_110095 ?auto_110098 ) ) ( not ( = ?auto_110095 ?auto_110099 ) ) ( not ( = ?auto_110096 ?auto_110097 ) ) ( not ( = ?auto_110096 ?auto_110098 ) ) ( not ( = ?auto_110096 ?auto_110099 ) ) ( not ( = ?auto_110097 ?auto_110098 ) ) ( not ( = ?auto_110097 ?auto_110099 ) ) ( not ( = ?auto_110098 ?auto_110099 ) ) ( ON ?auto_110097 ?auto_110098 ) ( ON ?auto_110096 ?auto_110097 ) ( ON ?auto_110095 ?auto_110096 ) ( ON ?auto_110094 ?auto_110095 ) ( ON ?auto_110093 ?auto_110094 ) ( ON ?auto_110092 ?auto_110093 ) ( CLEAR ?auto_110090 ) ( ON ?auto_110091 ?auto_110092 ) ( CLEAR ?auto_110091 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_110090 ?auto_110091 )
      ( MAKE-9PILE ?auto_110090 ?auto_110091 ?auto_110092 ?auto_110093 ?auto_110094 ?auto_110095 ?auto_110096 ?auto_110097 ?auto_110098 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_110109 - BLOCK
      ?auto_110110 - BLOCK
      ?auto_110111 - BLOCK
      ?auto_110112 - BLOCK
      ?auto_110113 - BLOCK
      ?auto_110114 - BLOCK
      ?auto_110115 - BLOCK
      ?auto_110116 - BLOCK
      ?auto_110117 - BLOCK
    )
    :vars
    (
      ?auto_110118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110117 ?auto_110118 ) ( not ( = ?auto_110109 ?auto_110110 ) ) ( not ( = ?auto_110109 ?auto_110111 ) ) ( not ( = ?auto_110109 ?auto_110112 ) ) ( not ( = ?auto_110109 ?auto_110113 ) ) ( not ( = ?auto_110109 ?auto_110114 ) ) ( not ( = ?auto_110109 ?auto_110115 ) ) ( not ( = ?auto_110109 ?auto_110116 ) ) ( not ( = ?auto_110109 ?auto_110117 ) ) ( not ( = ?auto_110109 ?auto_110118 ) ) ( not ( = ?auto_110110 ?auto_110111 ) ) ( not ( = ?auto_110110 ?auto_110112 ) ) ( not ( = ?auto_110110 ?auto_110113 ) ) ( not ( = ?auto_110110 ?auto_110114 ) ) ( not ( = ?auto_110110 ?auto_110115 ) ) ( not ( = ?auto_110110 ?auto_110116 ) ) ( not ( = ?auto_110110 ?auto_110117 ) ) ( not ( = ?auto_110110 ?auto_110118 ) ) ( not ( = ?auto_110111 ?auto_110112 ) ) ( not ( = ?auto_110111 ?auto_110113 ) ) ( not ( = ?auto_110111 ?auto_110114 ) ) ( not ( = ?auto_110111 ?auto_110115 ) ) ( not ( = ?auto_110111 ?auto_110116 ) ) ( not ( = ?auto_110111 ?auto_110117 ) ) ( not ( = ?auto_110111 ?auto_110118 ) ) ( not ( = ?auto_110112 ?auto_110113 ) ) ( not ( = ?auto_110112 ?auto_110114 ) ) ( not ( = ?auto_110112 ?auto_110115 ) ) ( not ( = ?auto_110112 ?auto_110116 ) ) ( not ( = ?auto_110112 ?auto_110117 ) ) ( not ( = ?auto_110112 ?auto_110118 ) ) ( not ( = ?auto_110113 ?auto_110114 ) ) ( not ( = ?auto_110113 ?auto_110115 ) ) ( not ( = ?auto_110113 ?auto_110116 ) ) ( not ( = ?auto_110113 ?auto_110117 ) ) ( not ( = ?auto_110113 ?auto_110118 ) ) ( not ( = ?auto_110114 ?auto_110115 ) ) ( not ( = ?auto_110114 ?auto_110116 ) ) ( not ( = ?auto_110114 ?auto_110117 ) ) ( not ( = ?auto_110114 ?auto_110118 ) ) ( not ( = ?auto_110115 ?auto_110116 ) ) ( not ( = ?auto_110115 ?auto_110117 ) ) ( not ( = ?auto_110115 ?auto_110118 ) ) ( not ( = ?auto_110116 ?auto_110117 ) ) ( not ( = ?auto_110116 ?auto_110118 ) ) ( not ( = ?auto_110117 ?auto_110118 ) ) ( ON ?auto_110116 ?auto_110117 ) ( ON ?auto_110115 ?auto_110116 ) ( ON ?auto_110114 ?auto_110115 ) ( ON ?auto_110113 ?auto_110114 ) ( ON ?auto_110112 ?auto_110113 ) ( ON ?auto_110111 ?auto_110112 ) ( ON ?auto_110110 ?auto_110111 ) ( ON ?auto_110109 ?auto_110110 ) ( CLEAR ?auto_110109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_110109 )
      ( MAKE-9PILE ?auto_110109 ?auto_110110 ?auto_110111 ?auto_110112 ?auto_110113 ?auto_110114 ?auto_110115 ?auto_110116 ?auto_110117 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_110128 - BLOCK
      ?auto_110129 - BLOCK
      ?auto_110130 - BLOCK
      ?auto_110131 - BLOCK
      ?auto_110132 - BLOCK
      ?auto_110133 - BLOCK
      ?auto_110134 - BLOCK
      ?auto_110135 - BLOCK
      ?auto_110136 - BLOCK
    )
    :vars
    (
      ?auto_110137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110136 ?auto_110137 ) ( not ( = ?auto_110128 ?auto_110129 ) ) ( not ( = ?auto_110128 ?auto_110130 ) ) ( not ( = ?auto_110128 ?auto_110131 ) ) ( not ( = ?auto_110128 ?auto_110132 ) ) ( not ( = ?auto_110128 ?auto_110133 ) ) ( not ( = ?auto_110128 ?auto_110134 ) ) ( not ( = ?auto_110128 ?auto_110135 ) ) ( not ( = ?auto_110128 ?auto_110136 ) ) ( not ( = ?auto_110128 ?auto_110137 ) ) ( not ( = ?auto_110129 ?auto_110130 ) ) ( not ( = ?auto_110129 ?auto_110131 ) ) ( not ( = ?auto_110129 ?auto_110132 ) ) ( not ( = ?auto_110129 ?auto_110133 ) ) ( not ( = ?auto_110129 ?auto_110134 ) ) ( not ( = ?auto_110129 ?auto_110135 ) ) ( not ( = ?auto_110129 ?auto_110136 ) ) ( not ( = ?auto_110129 ?auto_110137 ) ) ( not ( = ?auto_110130 ?auto_110131 ) ) ( not ( = ?auto_110130 ?auto_110132 ) ) ( not ( = ?auto_110130 ?auto_110133 ) ) ( not ( = ?auto_110130 ?auto_110134 ) ) ( not ( = ?auto_110130 ?auto_110135 ) ) ( not ( = ?auto_110130 ?auto_110136 ) ) ( not ( = ?auto_110130 ?auto_110137 ) ) ( not ( = ?auto_110131 ?auto_110132 ) ) ( not ( = ?auto_110131 ?auto_110133 ) ) ( not ( = ?auto_110131 ?auto_110134 ) ) ( not ( = ?auto_110131 ?auto_110135 ) ) ( not ( = ?auto_110131 ?auto_110136 ) ) ( not ( = ?auto_110131 ?auto_110137 ) ) ( not ( = ?auto_110132 ?auto_110133 ) ) ( not ( = ?auto_110132 ?auto_110134 ) ) ( not ( = ?auto_110132 ?auto_110135 ) ) ( not ( = ?auto_110132 ?auto_110136 ) ) ( not ( = ?auto_110132 ?auto_110137 ) ) ( not ( = ?auto_110133 ?auto_110134 ) ) ( not ( = ?auto_110133 ?auto_110135 ) ) ( not ( = ?auto_110133 ?auto_110136 ) ) ( not ( = ?auto_110133 ?auto_110137 ) ) ( not ( = ?auto_110134 ?auto_110135 ) ) ( not ( = ?auto_110134 ?auto_110136 ) ) ( not ( = ?auto_110134 ?auto_110137 ) ) ( not ( = ?auto_110135 ?auto_110136 ) ) ( not ( = ?auto_110135 ?auto_110137 ) ) ( not ( = ?auto_110136 ?auto_110137 ) ) ( ON ?auto_110135 ?auto_110136 ) ( ON ?auto_110134 ?auto_110135 ) ( ON ?auto_110133 ?auto_110134 ) ( ON ?auto_110132 ?auto_110133 ) ( ON ?auto_110131 ?auto_110132 ) ( ON ?auto_110130 ?auto_110131 ) ( ON ?auto_110129 ?auto_110130 ) ( ON ?auto_110128 ?auto_110129 ) ( CLEAR ?auto_110128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_110128 )
      ( MAKE-9PILE ?auto_110128 ?auto_110129 ?auto_110130 ?auto_110131 ?auto_110132 ?auto_110133 ?auto_110134 ?auto_110135 ?auto_110136 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_110148 - BLOCK
      ?auto_110149 - BLOCK
      ?auto_110150 - BLOCK
      ?auto_110151 - BLOCK
      ?auto_110152 - BLOCK
      ?auto_110153 - BLOCK
      ?auto_110154 - BLOCK
      ?auto_110155 - BLOCK
      ?auto_110156 - BLOCK
      ?auto_110157 - BLOCK
    )
    :vars
    (
      ?auto_110158 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_110156 ) ( ON ?auto_110157 ?auto_110158 ) ( CLEAR ?auto_110157 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_110148 ) ( ON ?auto_110149 ?auto_110148 ) ( ON ?auto_110150 ?auto_110149 ) ( ON ?auto_110151 ?auto_110150 ) ( ON ?auto_110152 ?auto_110151 ) ( ON ?auto_110153 ?auto_110152 ) ( ON ?auto_110154 ?auto_110153 ) ( ON ?auto_110155 ?auto_110154 ) ( ON ?auto_110156 ?auto_110155 ) ( not ( = ?auto_110148 ?auto_110149 ) ) ( not ( = ?auto_110148 ?auto_110150 ) ) ( not ( = ?auto_110148 ?auto_110151 ) ) ( not ( = ?auto_110148 ?auto_110152 ) ) ( not ( = ?auto_110148 ?auto_110153 ) ) ( not ( = ?auto_110148 ?auto_110154 ) ) ( not ( = ?auto_110148 ?auto_110155 ) ) ( not ( = ?auto_110148 ?auto_110156 ) ) ( not ( = ?auto_110148 ?auto_110157 ) ) ( not ( = ?auto_110148 ?auto_110158 ) ) ( not ( = ?auto_110149 ?auto_110150 ) ) ( not ( = ?auto_110149 ?auto_110151 ) ) ( not ( = ?auto_110149 ?auto_110152 ) ) ( not ( = ?auto_110149 ?auto_110153 ) ) ( not ( = ?auto_110149 ?auto_110154 ) ) ( not ( = ?auto_110149 ?auto_110155 ) ) ( not ( = ?auto_110149 ?auto_110156 ) ) ( not ( = ?auto_110149 ?auto_110157 ) ) ( not ( = ?auto_110149 ?auto_110158 ) ) ( not ( = ?auto_110150 ?auto_110151 ) ) ( not ( = ?auto_110150 ?auto_110152 ) ) ( not ( = ?auto_110150 ?auto_110153 ) ) ( not ( = ?auto_110150 ?auto_110154 ) ) ( not ( = ?auto_110150 ?auto_110155 ) ) ( not ( = ?auto_110150 ?auto_110156 ) ) ( not ( = ?auto_110150 ?auto_110157 ) ) ( not ( = ?auto_110150 ?auto_110158 ) ) ( not ( = ?auto_110151 ?auto_110152 ) ) ( not ( = ?auto_110151 ?auto_110153 ) ) ( not ( = ?auto_110151 ?auto_110154 ) ) ( not ( = ?auto_110151 ?auto_110155 ) ) ( not ( = ?auto_110151 ?auto_110156 ) ) ( not ( = ?auto_110151 ?auto_110157 ) ) ( not ( = ?auto_110151 ?auto_110158 ) ) ( not ( = ?auto_110152 ?auto_110153 ) ) ( not ( = ?auto_110152 ?auto_110154 ) ) ( not ( = ?auto_110152 ?auto_110155 ) ) ( not ( = ?auto_110152 ?auto_110156 ) ) ( not ( = ?auto_110152 ?auto_110157 ) ) ( not ( = ?auto_110152 ?auto_110158 ) ) ( not ( = ?auto_110153 ?auto_110154 ) ) ( not ( = ?auto_110153 ?auto_110155 ) ) ( not ( = ?auto_110153 ?auto_110156 ) ) ( not ( = ?auto_110153 ?auto_110157 ) ) ( not ( = ?auto_110153 ?auto_110158 ) ) ( not ( = ?auto_110154 ?auto_110155 ) ) ( not ( = ?auto_110154 ?auto_110156 ) ) ( not ( = ?auto_110154 ?auto_110157 ) ) ( not ( = ?auto_110154 ?auto_110158 ) ) ( not ( = ?auto_110155 ?auto_110156 ) ) ( not ( = ?auto_110155 ?auto_110157 ) ) ( not ( = ?auto_110155 ?auto_110158 ) ) ( not ( = ?auto_110156 ?auto_110157 ) ) ( not ( = ?auto_110156 ?auto_110158 ) ) ( not ( = ?auto_110157 ?auto_110158 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_110157 ?auto_110158 )
      ( !STACK ?auto_110157 ?auto_110156 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_110169 - BLOCK
      ?auto_110170 - BLOCK
      ?auto_110171 - BLOCK
      ?auto_110172 - BLOCK
      ?auto_110173 - BLOCK
      ?auto_110174 - BLOCK
      ?auto_110175 - BLOCK
      ?auto_110176 - BLOCK
      ?auto_110177 - BLOCK
      ?auto_110178 - BLOCK
    )
    :vars
    (
      ?auto_110179 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_110177 ) ( ON ?auto_110178 ?auto_110179 ) ( CLEAR ?auto_110178 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_110169 ) ( ON ?auto_110170 ?auto_110169 ) ( ON ?auto_110171 ?auto_110170 ) ( ON ?auto_110172 ?auto_110171 ) ( ON ?auto_110173 ?auto_110172 ) ( ON ?auto_110174 ?auto_110173 ) ( ON ?auto_110175 ?auto_110174 ) ( ON ?auto_110176 ?auto_110175 ) ( ON ?auto_110177 ?auto_110176 ) ( not ( = ?auto_110169 ?auto_110170 ) ) ( not ( = ?auto_110169 ?auto_110171 ) ) ( not ( = ?auto_110169 ?auto_110172 ) ) ( not ( = ?auto_110169 ?auto_110173 ) ) ( not ( = ?auto_110169 ?auto_110174 ) ) ( not ( = ?auto_110169 ?auto_110175 ) ) ( not ( = ?auto_110169 ?auto_110176 ) ) ( not ( = ?auto_110169 ?auto_110177 ) ) ( not ( = ?auto_110169 ?auto_110178 ) ) ( not ( = ?auto_110169 ?auto_110179 ) ) ( not ( = ?auto_110170 ?auto_110171 ) ) ( not ( = ?auto_110170 ?auto_110172 ) ) ( not ( = ?auto_110170 ?auto_110173 ) ) ( not ( = ?auto_110170 ?auto_110174 ) ) ( not ( = ?auto_110170 ?auto_110175 ) ) ( not ( = ?auto_110170 ?auto_110176 ) ) ( not ( = ?auto_110170 ?auto_110177 ) ) ( not ( = ?auto_110170 ?auto_110178 ) ) ( not ( = ?auto_110170 ?auto_110179 ) ) ( not ( = ?auto_110171 ?auto_110172 ) ) ( not ( = ?auto_110171 ?auto_110173 ) ) ( not ( = ?auto_110171 ?auto_110174 ) ) ( not ( = ?auto_110171 ?auto_110175 ) ) ( not ( = ?auto_110171 ?auto_110176 ) ) ( not ( = ?auto_110171 ?auto_110177 ) ) ( not ( = ?auto_110171 ?auto_110178 ) ) ( not ( = ?auto_110171 ?auto_110179 ) ) ( not ( = ?auto_110172 ?auto_110173 ) ) ( not ( = ?auto_110172 ?auto_110174 ) ) ( not ( = ?auto_110172 ?auto_110175 ) ) ( not ( = ?auto_110172 ?auto_110176 ) ) ( not ( = ?auto_110172 ?auto_110177 ) ) ( not ( = ?auto_110172 ?auto_110178 ) ) ( not ( = ?auto_110172 ?auto_110179 ) ) ( not ( = ?auto_110173 ?auto_110174 ) ) ( not ( = ?auto_110173 ?auto_110175 ) ) ( not ( = ?auto_110173 ?auto_110176 ) ) ( not ( = ?auto_110173 ?auto_110177 ) ) ( not ( = ?auto_110173 ?auto_110178 ) ) ( not ( = ?auto_110173 ?auto_110179 ) ) ( not ( = ?auto_110174 ?auto_110175 ) ) ( not ( = ?auto_110174 ?auto_110176 ) ) ( not ( = ?auto_110174 ?auto_110177 ) ) ( not ( = ?auto_110174 ?auto_110178 ) ) ( not ( = ?auto_110174 ?auto_110179 ) ) ( not ( = ?auto_110175 ?auto_110176 ) ) ( not ( = ?auto_110175 ?auto_110177 ) ) ( not ( = ?auto_110175 ?auto_110178 ) ) ( not ( = ?auto_110175 ?auto_110179 ) ) ( not ( = ?auto_110176 ?auto_110177 ) ) ( not ( = ?auto_110176 ?auto_110178 ) ) ( not ( = ?auto_110176 ?auto_110179 ) ) ( not ( = ?auto_110177 ?auto_110178 ) ) ( not ( = ?auto_110177 ?auto_110179 ) ) ( not ( = ?auto_110178 ?auto_110179 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_110178 ?auto_110179 )
      ( !STACK ?auto_110178 ?auto_110177 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_110190 - BLOCK
      ?auto_110191 - BLOCK
      ?auto_110192 - BLOCK
      ?auto_110193 - BLOCK
      ?auto_110194 - BLOCK
      ?auto_110195 - BLOCK
      ?auto_110196 - BLOCK
      ?auto_110197 - BLOCK
      ?auto_110198 - BLOCK
      ?auto_110199 - BLOCK
    )
    :vars
    (
      ?auto_110200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110199 ?auto_110200 ) ( ON-TABLE ?auto_110190 ) ( ON ?auto_110191 ?auto_110190 ) ( ON ?auto_110192 ?auto_110191 ) ( ON ?auto_110193 ?auto_110192 ) ( ON ?auto_110194 ?auto_110193 ) ( ON ?auto_110195 ?auto_110194 ) ( ON ?auto_110196 ?auto_110195 ) ( ON ?auto_110197 ?auto_110196 ) ( not ( = ?auto_110190 ?auto_110191 ) ) ( not ( = ?auto_110190 ?auto_110192 ) ) ( not ( = ?auto_110190 ?auto_110193 ) ) ( not ( = ?auto_110190 ?auto_110194 ) ) ( not ( = ?auto_110190 ?auto_110195 ) ) ( not ( = ?auto_110190 ?auto_110196 ) ) ( not ( = ?auto_110190 ?auto_110197 ) ) ( not ( = ?auto_110190 ?auto_110198 ) ) ( not ( = ?auto_110190 ?auto_110199 ) ) ( not ( = ?auto_110190 ?auto_110200 ) ) ( not ( = ?auto_110191 ?auto_110192 ) ) ( not ( = ?auto_110191 ?auto_110193 ) ) ( not ( = ?auto_110191 ?auto_110194 ) ) ( not ( = ?auto_110191 ?auto_110195 ) ) ( not ( = ?auto_110191 ?auto_110196 ) ) ( not ( = ?auto_110191 ?auto_110197 ) ) ( not ( = ?auto_110191 ?auto_110198 ) ) ( not ( = ?auto_110191 ?auto_110199 ) ) ( not ( = ?auto_110191 ?auto_110200 ) ) ( not ( = ?auto_110192 ?auto_110193 ) ) ( not ( = ?auto_110192 ?auto_110194 ) ) ( not ( = ?auto_110192 ?auto_110195 ) ) ( not ( = ?auto_110192 ?auto_110196 ) ) ( not ( = ?auto_110192 ?auto_110197 ) ) ( not ( = ?auto_110192 ?auto_110198 ) ) ( not ( = ?auto_110192 ?auto_110199 ) ) ( not ( = ?auto_110192 ?auto_110200 ) ) ( not ( = ?auto_110193 ?auto_110194 ) ) ( not ( = ?auto_110193 ?auto_110195 ) ) ( not ( = ?auto_110193 ?auto_110196 ) ) ( not ( = ?auto_110193 ?auto_110197 ) ) ( not ( = ?auto_110193 ?auto_110198 ) ) ( not ( = ?auto_110193 ?auto_110199 ) ) ( not ( = ?auto_110193 ?auto_110200 ) ) ( not ( = ?auto_110194 ?auto_110195 ) ) ( not ( = ?auto_110194 ?auto_110196 ) ) ( not ( = ?auto_110194 ?auto_110197 ) ) ( not ( = ?auto_110194 ?auto_110198 ) ) ( not ( = ?auto_110194 ?auto_110199 ) ) ( not ( = ?auto_110194 ?auto_110200 ) ) ( not ( = ?auto_110195 ?auto_110196 ) ) ( not ( = ?auto_110195 ?auto_110197 ) ) ( not ( = ?auto_110195 ?auto_110198 ) ) ( not ( = ?auto_110195 ?auto_110199 ) ) ( not ( = ?auto_110195 ?auto_110200 ) ) ( not ( = ?auto_110196 ?auto_110197 ) ) ( not ( = ?auto_110196 ?auto_110198 ) ) ( not ( = ?auto_110196 ?auto_110199 ) ) ( not ( = ?auto_110196 ?auto_110200 ) ) ( not ( = ?auto_110197 ?auto_110198 ) ) ( not ( = ?auto_110197 ?auto_110199 ) ) ( not ( = ?auto_110197 ?auto_110200 ) ) ( not ( = ?auto_110198 ?auto_110199 ) ) ( not ( = ?auto_110198 ?auto_110200 ) ) ( not ( = ?auto_110199 ?auto_110200 ) ) ( CLEAR ?auto_110197 ) ( ON ?auto_110198 ?auto_110199 ) ( CLEAR ?auto_110198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_110190 ?auto_110191 ?auto_110192 ?auto_110193 ?auto_110194 ?auto_110195 ?auto_110196 ?auto_110197 ?auto_110198 )
      ( MAKE-10PILE ?auto_110190 ?auto_110191 ?auto_110192 ?auto_110193 ?auto_110194 ?auto_110195 ?auto_110196 ?auto_110197 ?auto_110198 ?auto_110199 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_110211 - BLOCK
      ?auto_110212 - BLOCK
      ?auto_110213 - BLOCK
      ?auto_110214 - BLOCK
      ?auto_110215 - BLOCK
      ?auto_110216 - BLOCK
      ?auto_110217 - BLOCK
      ?auto_110218 - BLOCK
      ?auto_110219 - BLOCK
      ?auto_110220 - BLOCK
    )
    :vars
    (
      ?auto_110221 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110220 ?auto_110221 ) ( ON-TABLE ?auto_110211 ) ( ON ?auto_110212 ?auto_110211 ) ( ON ?auto_110213 ?auto_110212 ) ( ON ?auto_110214 ?auto_110213 ) ( ON ?auto_110215 ?auto_110214 ) ( ON ?auto_110216 ?auto_110215 ) ( ON ?auto_110217 ?auto_110216 ) ( ON ?auto_110218 ?auto_110217 ) ( not ( = ?auto_110211 ?auto_110212 ) ) ( not ( = ?auto_110211 ?auto_110213 ) ) ( not ( = ?auto_110211 ?auto_110214 ) ) ( not ( = ?auto_110211 ?auto_110215 ) ) ( not ( = ?auto_110211 ?auto_110216 ) ) ( not ( = ?auto_110211 ?auto_110217 ) ) ( not ( = ?auto_110211 ?auto_110218 ) ) ( not ( = ?auto_110211 ?auto_110219 ) ) ( not ( = ?auto_110211 ?auto_110220 ) ) ( not ( = ?auto_110211 ?auto_110221 ) ) ( not ( = ?auto_110212 ?auto_110213 ) ) ( not ( = ?auto_110212 ?auto_110214 ) ) ( not ( = ?auto_110212 ?auto_110215 ) ) ( not ( = ?auto_110212 ?auto_110216 ) ) ( not ( = ?auto_110212 ?auto_110217 ) ) ( not ( = ?auto_110212 ?auto_110218 ) ) ( not ( = ?auto_110212 ?auto_110219 ) ) ( not ( = ?auto_110212 ?auto_110220 ) ) ( not ( = ?auto_110212 ?auto_110221 ) ) ( not ( = ?auto_110213 ?auto_110214 ) ) ( not ( = ?auto_110213 ?auto_110215 ) ) ( not ( = ?auto_110213 ?auto_110216 ) ) ( not ( = ?auto_110213 ?auto_110217 ) ) ( not ( = ?auto_110213 ?auto_110218 ) ) ( not ( = ?auto_110213 ?auto_110219 ) ) ( not ( = ?auto_110213 ?auto_110220 ) ) ( not ( = ?auto_110213 ?auto_110221 ) ) ( not ( = ?auto_110214 ?auto_110215 ) ) ( not ( = ?auto_110214 ?auto_110216 ) ) ( not ( = ?auto_110214 ?auto_110217 ) ) ( not ( = ?auto_110214 ?auto_110218 ) ) ( not ( = ?auto_110214 ?auto_110219 ) ) ( not ( = ?auto_110214 ?auto_110220 ) ) ( not ( = ?auto_110214 ?auto_110221 ) ) ( not ( = ?auto_110215 ?auto_110216 ) ) ( not ( = ?auto_110215 ?auto_110217 ) ) ( not ( = ?auto_110215 ?auto_110218 ) ) ( not ( = ?auto_110215 ?auto_110219 ) ) ( not ( = ?auto_110215 ?auto_110220 ) ) ( not ( = ?auto_110215 ?auto_110221 ) ) ( not ( = ?auto_110216 ?auto_110217 ) ) ( not ( = ?auto_110216 ?auto_110218 ) ) ( not ( = ?auto_110216 ?auto_110219 ) ) ( not ( = ?auto_110216 ?auto_110220 ) ) ( not ( = ?auto_110216 ?auto_110221 ) ) ( not ( = ?auto_110217 ?auto_110218 ) ) ( not ( = ?auto_110217 ?auto_110219 ) ) ( not ( = ?auto_110217 ?auto_110220 ) ) ( not ( = ?auto_110217 ?auto_110221 ) ) ( not ( = ?auto_110218 ?auto_110219 ) ) ( not ( = ?auto_110218 ?auto_110220 ) ) ( not ( = ?auto_110218 ?auto_110221 ) ) ( not ( = ?auto_110219 ?auto_110220 ) ) ( not ( = ?auto_110219 ?auto_110221 ) ) ( not ( = ?auto_110220 ?auto_110221 ) ) ( CLEAR ?auto_110218 ) ( ON ?auto_110219 ?auto_110220 ) ( CLEAR ?auto_110219 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_110211 ?auto_110212 ?auto_110213 ?auto_110214 ?auto_110215 ?auto_110216 ?auto_110217 ?auto_110218 ?auto_110219 )
      ( MAKE-10PILE ?auto_110211 ?auto_110212 ?auto_110213 ?auto_110214 ?auto_110215 ?auto_110216 ?auto_110217 ?auto_110218 ?auto_110219 ?auto_110220 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_110232 - BLOCK
      ?auto_110233 - BLOCK
      ?auto_110234 - BLOCK
      ?auto_110235 - BLOCK
      ?auto_110236 - BLOCK
      ?auto_110237 - BLOCK
      ?auto_110238 - BLOCK
      ?auto_110239 - BLOCK
      ?auto_110240 - BLOCK
      ?auto_110241 - BLOCK
    )
    :vars
    (
      ?auto_110242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110241 ?auto_110242 ) ( ON-TABLE ?auto_110232 ) ( ON ?auto_110233 ?auto_110232 ) ( ON ?auto_110234 ?auto_110233 ) ( ON ?auto_110235 ?auto_110234 ) ( ON ?auto_110236 ?auto_110235 ) ( ON ?auto_110237 ?auto_110236 ) ( ON ?auto_110238 ?auto_110237 ) ( not ( = ?auto_110232 ?auto_110233 ) ) ( not ( = ?auto_110232 ?auto_110234 ) ) ( not ( = ?auto_110232 ?auto_110235 ) ) ( not ( = ?auto_110232 ?auto_110236 ) ) ( not ( = ?auto_110232 ?auto_110237 ) ) ( not ( = ?auto_110232 ?auto_110238 ) ) ( not ( = ?auto_110232 ?auto_110239 ) ) ( not ( = ?auto_110232 ?auto_110240 ) ) ( not ( = ?auto_110232 ?auto_110241 ) ) ( not ( = ?auto_110232 ?auto_110242 ) ) ( not ( = ?auto_110233 ?auto_110234 ) ) ( not ( = ?auto_110233 ?auto_110235 ) ) ( not ( = ?auto_110233 ?auto_110236 ) ) ( not ( = ?auto_110233 ?auto_110237 ) ) ( not ( = ?auto_110233 ?auto_110238 ) ) ( not ( = ?auto_110233 ?auto_110239 ) ) ( not ( = ?auto_110233 ?auto_110240 ) ) ( not ( = ?auto_110233 ?auto_110241 ) ) ( not ( = ?auto_110233 ?auto_110242 ) ) ( not ( = ?auto_110234 ?auto_110235 ) ) ( not ( = ?auto_110234 ?auto_110236 ) ) ( not ( = ?auto_110234 ?auto_110237 ) ) ( not ( = ?auto_110234 ?auto_110238 ) ) ( not ( = ?auto_110234 ?auto_110239 ) ) ( not ( = ?auto_110234 ?auto_110240 ) ) ( not ( = ?auto_110234 ?auto_110241 ) ) ( not ( = ?auto_110234 ?auto_110242 ) ) ( not ( = ?auto_110235 ?auto_110236 ) ) ( not ( = ?auto_110235 ?auto_110237 ) ) ( not ( = ?auto_110235 ?auto_110238 ) ) ( not ( = ?auto_110235 ?auto_110239 ) ) ( not ( = ?auto_110235 ?auto_110240 ) ) ( not ( = ?auto_110235 ?auto_110241 ) ) ( not ( = ?auto_110235 ?auto_110242 ) ) ( not ( = ?auto_110236 ?auto_110237 ) ) ( not ( = ?auto_110236 ?auto_110238 ) ) ( not ( = ?auto_110236 ?auto_110239 ) ) ( not ( = ?auto_110236 ?auto_110240 ) ) ( not ( = ?auto_110236 ?auto_110241 ) ) ( not ( = ?auto_110236 ?auto_110242 ) ) ( not ( = ?auto_110237 ?auto_110238 ) ) ( not ( = ?auto_110237 ?auto_110239 ) ) ( not ( = ?auto_110237 ?auto_110240 ) ) ( not ( = ?auto_110237 ?auto_110241 ) ) ( not ( = ?auto_110237 ?auto_110242 ) ) ( not ( = ?auto_110238 ?auto_110239 ) ) ( not ( = ?auto_110238 ?auto_110240 ) ) ( not ( = ?auto_110238 ?auto_110241 ) ) ( not ( = ?auto_110238 ?auto_110242 ) ) ( not ( = ?auto_110239 ?auto_110240 ) ) ( not ( = ?auto_110239 ?auto_110241 ) ) ( not ( = ?auto_110239 ?auto_110242 ) ) ( not ( = ?auto_110240 ?auto_110241 ) ) ( not ( = ?auto_110240 ?auto_110242 ) ) ( not ( = ?auto_110241 ?auto_110242 ) ) ( ON ?auto_110240 ?auto_110241 ) ( CLEAR ?auto_110238 ) ( ON ?auto_110239 ?auto_110240 ) ( CLEAR ?auto_110239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_110232 ?auto_110233 ?auto_110234 ?auto_110235 ?auto_110236 ?auto_110237 ?auto_110238 ?auto_110239 )
      ( MAKE-10PILE ?auto_110232 ?auto_110233 ?auto_110234 ?auto_110235 ?auto_110236 ?auto_110237 ?auto_110238 ?auto_110239 ?auto_110240 ?auto_110241 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_110253 - BLOCK
      ?auto_110254 - BLOCK
      ?auto_110255 - BLOCK
      ?auto_110256 - BLOCK
      ?auto_110257 - BLOCK
      ?auto_110258 - BLOCK
      ?auto_110259 - BLOCK
      ?auto_110260 - BLOCK
      ?auto_110261 - BLOCK
      ?auto_110262 - BLOCK
    )
    :vars
    (
      ?auto_110263 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110262 ?auto_110263 ) ( ON-TABLE ?auto_110253 ) ( ON ?auto_110254 ?auto_110253 ) ( ON ?auto_110255 ?auto_110254 ) ( ON ?auto_110256 ?auto_110255 ) ( ON ?auto_110257 ?auto_110256 ) ( ON ?auto_110258 ?auto_110257 ) ( ON ?auto_110259 ?auto_110258 ) ( not ( = ?auto_110253 ?auto_110254 ) ) ( not ( = ?auto_110253 ?auto_110255 ) ) ( not ( = ?auto_110253 ?auto_110256 ) ) ( not ( = ?auto_110253 ?auto_110257 ) ) ( not ( = ?auto_110253 ?auto_110258 ) ) ( not ( = ?auto_110253 ?auto_110259 ) ) ( not ( = ?auto_110253 ?auto_110260 ) ) ( not ( = ?auto_110253 ?auto_110261 ) ) ( not ( = ?auto_110253 ?auto_110262 ) ) ( not ( = ?auto_110253 ?auto_110263 ) ) ( not ( = ?auto_110254 ?auto_110255 ) ) ( not ( = ?auto_110254 ?auto_110256 ) ) ( not ( = ?auto_110254 ?auto_110257 ) ) ( not ( = ?auto_110254 ?auto_110258 ) ) ( not ( = ?auto_110254 ?auto_110259 ) ) ( not ( = ?auto_110254 ?auto_110260 ) ) ( not ( = ?auto_110254 ?auto_110261 ) ) ( not ( = ?auto_110254 ?auto_110262 ) ) ( not ( = ?auto_110254 ?auto_110263 ) ) ( not ( = ?auto_110255 ?auto_110256 ) ) ( not ( = ?auto_110255 ?auto_110257 ) ) ( not ( = ?auto_110255 ?auto_110258 ) ) ( not ( = ?auto_110255 ?auto_110259 ) ) ( not ( = ?auto_110255 ?auto_110260 ) ) ( not ( = ?auto_110255 ?auto_110261 ) ) ( not ( = ?auto_110255 ?auto_110262 ) ) ( not ( = ?auto_110255 ?auto_110263 ) ) ( not ( = ?auto_110256 ?auto_110257 ) ) ( not ( = ?auto_110256 ?auto_110258 ) ) ( not ( = ?auto_110256 ?auto_110259 ) ) ( not ( = ?auto_110256 ?auto_110260 ) ) ( not ( = ?auto_110256 ?auto_110261 ) ) ( not ( = ?auto_110256 ?auto_110262 ) ) ( not ( = ?auto_110256 ?auto_110263 ) ) ( not ( = ?auto_110257 ?auto_110258 ) ) ( not ( = ?auto_110257 ?auto_110259 ) ) ( not ( = ?auto_110257 ?auto_110260 ) ) ( not ( = ?auto_110257 ?auto_110261 ) ) ( not ( = ?auto_110257 ?auto_110262 ) ) ( not ( = ?auto_110257 ?auto_110263 ) ) ( not ( = ?auto_110258 ?auto_110259 ) ) ( not ( = ?auto_110258 ?auto_110260 ) ) ( not ( = ?auto_110258 ?auto_110261 ) ) ( not ( = ?auto_110258 ?auto_110262 ) ) ( not ( = ?auto_110258 ?auto_110263 ) ) ( not ( = ?auto_110259 ?auto_110260 ) ) ( not ( = ?auto_110259 ?auto_110261 ) ) ( not ( = ?auto_110259 ?auto_110262 ) ) ( not ( = ?auto_110259 ?auto_110263 ) ) ( not ( = ?auto_110260 ?auto_110261 ) ) ( not ( = ?auto_110260 ?auto_110262 ) ) ( not ( = ?auto_110260 ?auto_110263 ) ) ( not ( = ?auto_110261 ?auto_110262 ) ) ( not ( = ?auto_110261 ?auto_110263 ) ) ( not ( = ?auto_110262 ?auto_110263 ) ) ( ON ?auto_110261 ?auto_110262 ) ( CLEAR ?auto_110259 ) ( ON ?auto_110260 ?auto_110261 ) ( CLEAR ?auto_110260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_110253 ?auto_110254 ?auto_110255 ?auto_110256 ?auto_110257 ?auto_110258 ?auto_110259 ?auto_110260 )
      ( MAKE-10PILE ?auto_110253 ?auto_110254 ?auto_110255 ?auto_110256 ?auto_110257 ?auto_110258 ?auto_110259 ?auto_110260 ?auto_110261 ?auto_110262 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_110274 - BLOCK
      ?auto_110275 - BLOCK
      ?auto_110276 - BLOCK
      ?auto_110277 - BLOCK
      ?auto_110278 - BLOCK
      ?auto_110279 - BLOCK
      ?auto_110280 - BLOCK
      ?auto_110281 - BLOCK
      ?auto_110282 - BLOCK
      ?auto_110283 - BLOCK
    )
    :vars
    (
      ?auto_110284 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110283 ?auto_110284 ) ( ON-TABLE ?auto_110274 ) ( ON ?auto_110275 ?auto_110274 ) ( ON ?auto_110276 ?auto_110275 ) ( ON ?auto_110277 ?auto_110276 ) ( ON ?auto_110278 ?auto_110277 ) ( ON ?auto_110279 ?auto_110278 ) ( not ( = ?auto_110274 ?auto_110275 ) ) ( not ( = ?auto_110274 ?auto_110276 ) ) ( not ( = ?auto_110274 ?auto_110277 ) ) ( not ( = ?auto_110274 ?auto_110278 ) ) ( not ( = ?auto_110274 ?auto_110279 ) ) ( not ( = ?auto_110274 ?auto_110280 ) ) ( not ( = ?auto_110274 ?auto_110281 ) ) ( not ( = ?auto_110274 ?auto_110282 ) ) ( not ( = ?auto_110274 ?auto_110283 ) ) ( not ( = ?auto_110274 ?auto_110284 ) ) ( not ( = ?auto_110275 ?auto_110276 ) ) ( not ( = ?auto_110275 ?auto_110277 ) ) ( not ( = ?auto_110275 ?auto_110278 ) ) ( not ( = ?auto_110275 ?auto_110279 ) ) ( not ( = ?auto_110275 ?auto_110280 ) ) ( not ( = ?auto_110275 ?auto_110281 ) ) ( not ( = ?auto_110275 ?auto_110282 ) ) ( not ( = ?auto_110275 ?auto_110283 ) ) ( not ( = ?auto_110275 ?auto_110284 ) ) ( not ( = ?auto_110276 ?auto_110277 ) ) ( not ( = ?auto_110276 ?auto_110278 ) ) ( not ( = ?auto_110276 ?auto_110279 ) ) ( not ( = ?auto_110276 ?auto_110280 ) ) ( not ( = ?auto_110276 ?auto_110281 ) ) ( not ( = ?auto_110276 ?auto_110282 ) ) ( not ( = ?auto_110276 ?auto_110283 ) ) ( not ( = ?auto_110276 ?auto_110284 ) ) ( not ( = ?auto_110277 ?auto_110278 ) ) ( not ( = ?auto_110277 ?auto_110279 ) ) ( not ( = ?auto_110277 ?auto_110280 ) ) ( not ( = ?auto_110277 ?auto_110281 ) ) ( not ( = ?auto_110277 ?auto_110282 ) ) ( not ( = ?auto_110277 ?auto_110283 ) ) ( not ( = ?auto_110277 ?auto_110284 ) ) ( not ( = ?auto_110278 ?auto_110279 ) ) ( not ( = ?auto_110278 ?auto_110280 ) ) ( not ( = ?auto_110278 ?auto_110281 ) ) ( not ( = ?auto_110278 ?auto_110282 ) ) ( not ( = ?auto_110278 ?auto_110283 ) ) ( not ( = ?auto_110278 ?auto_110284 ) ) ( not ( = ?auto_110279 ?auto_110280 ) ) ( not ( = ?auto_110279 ?auto_110281 ) ) ( not ( = ?auto_110279 ?auto_110282 ) ) ( not ( = ?auto_110279 ?auto_110283 ) ) ( not ( = ?auto_110279 ?auto_110284 ) ) ( not ( = ?auto_110280 ?auto_110281 ) ) ( not ( = ?auto_110280 ?auto_110282 ) ) ( not ( = ?auto_110280 ?auto_110283 ) ) ( not ( = ?auto_110280 ?auto_110284 ) ) ( not ( = ?auto_110281 ?auto_110282 ) ) ( not ( = ?auto_110281 ?auto_110283 ) ) ( not ( = ?auto_110281 ?auto_110284 ) ) ( not ( = ?auto_110282 ?auto_110283 ) ) ( not ( = ?auto_110282 ?auto_110284 ) ) ( not ( = ?auto_110283 ?auto_110284 ) ) ( ON ?auto_110282 ?auto_110283 ) ( ON ?auto_110281 ?auto_110282 ) ( CLEAR ?auto_110279 ) ( ON ?auto_110280 ?auto_110281 ) ( CLEAR ?auto_110280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_110274 ?auto_110275 ?auto_110276 ?auto_110277 ?auto_110278 ?auto_110279 ?auto_110280 )
      ( MAKE-10PILE ?auto_110274 ?auto_110275 ?auto_110276 ?auto_110277 ?auto_110278 ?auto_110279 ?auto_110280 ?auto_110281 ?auto_110282 ?auto_110283 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_110295 - BLOCK
      ?auto_110296 - BLOCK
      ?auto_110297 - BLOCK
      ?auto_110298 - BLOCK
      ?auto_110299 - BLOCK
      ?auto_110300 - BLOCK
      ?auto_110301 - BLOCK
      ?auto_110302 - BLOCK
      ?auto_110303 - BLOCK
      ?auto_110304 - BLOCK
    )
    :vars
    (
      ?auto_110305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110304 ?auto_110305 ) ( ON-TABLE ?auto_110295 ) ( ON ?auto_110296 ?auto_110295 ) ( ON ?auto_110297 ?auto_110296 ) ( ON ?auto_110298 ?auto_110297 ) ( ON ?auto_110299 ?auto_110298 ) ( ON ?auto_110300 ?auto_110299 ) ( not ( = ?auto_110295 ?auto_110296 ) ) ( not ( = ?auto_110295 ?auto_110297 ) ) ( not ( = ?auto_110295 ?auto_110298 ) ) ( not ( = ?auto_110295 ?auto_110299 ) ) ( not ( = ?auto_110295 ?auto_110300 ) ) ( not ( = ?auto_110295 ?auto_110301 ) ) ( not ( = ?auto_110295 ?auto_110302 ) ) ( not ( = ?auto_110295 ?auto_110303 ) ) ( not ( = ?auto_110295 ?auto_110304 ) ) ( not ( = ?auto_110295 ?auto_110305 ) ) ( not ( = ?auto_110296 ?auto_110297 ) ) ( not ( = ?auto_110296 ?auto_110298 ) ) ( not ( = ?auto_110296 ?auto_110299 ) ) ( not ( = ?auto_110296 ?auto_110300 ) ) ( not ( = ?auto_110296 ?auto_110301 ) ) ( not ( = ?auto_110296 ?auto_110302 ) ) ( not ( = ?auto_110296 ?auto_110303 ) ) ( not ( = ?auto_110296 ?auto_110304 ) ) ( not ( = ?auto_110296 ?auto_110305 ) ) ( not ( = ?auto_110297 ?auto_110298 ) ) ( not ( = ?auto_110297 ?auto_110299 ) ) ( not ( = ?auto_110297 ?auto_110300 ) ) ( not ( = ?auto_110297 ?auto_110301 ) ) ( not ( = ?auto_110297 ?auto_110302 ) ) ( not ( = ?auto_110297 ?auto_110303 ) ) ( not ( = ?auto_110297 ?auto_110304 ) ) ( not ( = ?auto_110297 ?auto_110305 ) ) ( not ( = ?auto_110298 ?auto_110299 ) ) ( not ( = ?auto_110298 ?auto_110300 ) ) ( not ( = ?auto_110298 ?auto_110301 ) ) ( not ( = ?auto_110298 ?auto_110302 ) ) ( not ( = ?auto_110298 ?auto_110303 ) ) ( not ( = ?auto_110298 ?auto_110304 ) ) ( not ( = ?auto_110298 ?auto_110305 ) ) ( not ( = ?auto_110299 ?auto_110300 ) ) ( not ( = ?auto_110299 ?auto_110301 ) ) ( not ( = ?auto_110299 ?auto_110302 ) ) ( not ( = ?auto_110299 ?auto_110303 ) ) ( not ( = ?auto_110299 ?auto_110304 ) ) ( not ( = ?auto_110299 ?auto_110305 ) ) ( not ( = ?auto_110300 ?auto_110301 ) ) ( not ( = ?auto_110300 ?auto_110302 ) ) ( not ( = ?auto_110300 ?auto_110303 ) ) ( not ( = ?auto_110300 ?auto_110304 ) ) ( not ( = ?auto_110300 ?auto_110305 ) ) ( not ( = ?auto_110301 ?auto_110302 ) ) ( not ( = ?auto_110301 ?auto_110303 ) ) ( not ( = ?auto_110301 ?auto_110304 ) ) ( not ( = ?auto_110301 ?auto_110305 ) ) ( not ( = ?auto_110302 ?auto_110303 ) ) ( not ( = ?auto_110302 ?auto_110304 ) ) ( not ( = ?auto_110302 ?auto_110305 ) ) ( not ( = ?auto_110303 ?auto_110304 ) ) ( not ( = ?auto_110303 ?auto_110305 ) ) ( not ( = ?auto_110304 ?auto_110305 ) ) ( ON ?auto_110303 ?auto_110304 ) ( ON ?auto_110302 ?auto_110303 ) ( CLEAR ?auto_110300 ) ( ON ?auto_110301 ?auto_110302 ) ( CLEAR ?auto_110301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_110295 ?auto_110296 ?auto_110297 ?auto_110298 ?auto_110299 ?auto_110300 ?auto_110301 )
      ( MAKE-10PILE ?auto_110295 ?auto_110296 ?auto_110297 ?auto_110298 ?auto_110299 ?auto_110300 ?auto_110301 ?auto_110302 ?auto_110303 ?auto_110304 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_110316 - BLOCK
      ?auto_110317 - BLOCK
      ?auto_110318 - BLOCK
      ?auto_110319 - BLOCK
      ?auto_110320 - BLOCK
      ?auto_110321 - BLOCK
      ?auto_110322 - BLOCK
      ?auto_110323 - BLOCK
      ?auto_110324 - BLOCK
      ?auto_110325 - BLOCK
    )
    :vars
    (
      ?auto_110326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110325 ?auto_110326 ) ( ON-TABLE ?auto_110316 ) ( ON ?auto_110317 ?auto_110316 ) ( ON ?auto_110318 ?auto_110317 ) ( ON ?auto_110319 ?auto_110318 ) ( ON ?auto_110320 ?auto_110319 ) ( not ( = ?auto_110316 ?auto_110317 ) ) ( not ( = ?auto_110316 ?auto_110318 ) ) ( not ( = ?auto_110316 ?auto_110319 ) ) ( not ( = ?auto_110316 ?auto_110320 ) ) ( not ( = ?auto_110316 ?auto_110321 ) ) ( not ( = ?auto_110316 ?auto_110322 ) ) ( not ( = ?auto_110316 ?auto_110323 ) ) ( not ( = ?auto_110316 ?auto_110324 ) ) ( not ( = ?auto_110316 ?auto_110325 ) ) ( not ( = ?auto_110316 ?auto_110326 ) ) ( not ( = ?auto_110317 ?auto_110318 ) ) ( not ( = ?auto_110317 ?auto_110319 ) ) ( not ( = ?auto_110317 ?auto_110320 ) ) ( not ( = ?auto_110317 ?auto_110321 ) ) ( not ( = ?auto_110317 ?auto_110322 ) ) ( not ( = ?auto_110317 ?auto_110323 ) ) ( not ( = ?auto_110317 ?auto_110324 ) ) ( not ( = ?auto_110317 ?auto_110325 ) ) ( not ( = ?auto_110317 ?auto_110326 ) ) ( not ( = ?auto_110318 ?auto_110319 ) ) ( not ( = ?auto_110318 ?auto_110320 ) ) ( not ( = ?auto_110318 ?auto_110321 ) ) ( not ( = ?auto_110318 ?auto_110322 ) ) ( not ( = ?auto_110318 ?auto_110323 ) ) ( not ( = ?auto_110318 ?auto_110324 ) ) ( not ( = ?auto_110318 ?auto_110325 ) ) ( not ( = ?auto_110318 ?auto_110326 ) ) ( not ( = ?auto_110319 ?auto_110320 ) ) ( not ( = ?auto_110319 ?auto_110321 ) ) ( not ( = ?auto_110319 ?auto_110322 ) ) ( not ( = ?auto_110319 ?auto_110323 ) ) ( not ( = ?auto_110319 ?auto_110324 ) ) ( not ( = ?auto_110319 ?auto_110325 ) ) ( not ( = ?auto_110319 ?auto_110326 ) ) ( not ( = ?auto_110320 ?auto_110321 ) ) ( not ( = ?auto_110320 ?auto_110322 ) ) ( not ( = ?auto_110320 ?auto_110323 ) ) ( not ( = ?auto_110320 ?auto_110324 ) ) ( not ( = ?auto_110320 ?auto_110325 ) ) ( not ( = ?auto_110320 ?auto_110326 ) ) ( not ( = ?auto_110321 ?auto_110322 ) ) ( not ( = ?auto_110321 ?auto_110323 ) ) ( not ( = ?auto_110321 ?auto_110324 ) ) ( not ( = ?auto_110321 ?auto_110325 ) ) ( not ( = ?auto_110321 ?auto_110326 ) ) ( not ( = ?auto_110322 ?auto_110323 ) ) ( not ( = ?auto_110322 ?auto_110324 ) ) ( not ( = ?auto_110322 ?auto_110325 ) ) ( not ( = ?auto_110322 ?auto_110326 ) ) ( not ( = ?auto_110323 ?auto_110324 ) ) ( not ( = ?auto_110323 ?auto_110325 ) ) ( not ( = ?auto_110323 ?auto_110326 ) ) ( not ( = ?auto_110324 ?auto_110325 ) ) ( not ( = ?auto_110324 ?auto_110326 ) ) ( not ( = ?auto_110325 ?auto_110326 ) ) ( ON ?auto_110324 ?auto_110325 ) ( ON ?auto_110323 ?auto_110324 ) ( ON ?auto_110322 ?auto_110323 ) ( CLEAR ?auto_110320 ) ( ON ?auto_110321 ?auto_110322 ) ( CLEAR ?auto_110321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_110316 ?auto_110317 ?auto_110318 ?auto_110319 ?auto_110320 ?auto_110321 )
      ( MAKE-10PILE ?auto_110316 ?auto_110317 ?auto_110318 ?auto_110319 ?auto_110320 ?auto_110321 ?auto_110322 ?auto_110323 ?auto_110324 ?auto_110325 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_110337 - BLOCK
      ?auto_110338 - BLOCK
      ?auto_110339 - BLOCK
      ?auto_110340 - BLOCK
      ?auto_110341 - BLOCK
      ?auto_110342 - BLOCK
      ?auto_110343 - BLOCK
      ?auto_110344 - BLOCK
      ?auto_110345 - BLOCK
      ?auto_110346 - BLOCK
    )
    :vars
    (
      ?auto_110347 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110346 ?auto_110347 ) ( ON-TABLE ?auto_110337 ) ( ON ?auto_110338 ?auto_110337 ) ( ON ?auto_110339 ?auto_110338 ) ( ON ?auto_110340 ?auto_110339 ) ( ON ?auto_110341 ?auto_110340 ) ( not ( = ?auto_110337 ?auto_110338 ) ) ( not ( = ?auto_110337 ?auto_110339 ) ) ( not ( = ?auto_110337 ?auto_110340 ) ) ( not ( = ?auto_110337 ?auto_110341 ) ) ( not ( = ?auto_110337 ?auto_110342 ) ) ( not ( = ?auto_110337 ?auto_110343 ) ) ( not ( = ?auto_110337 ?auto_110344 ) ) ( not ( = ?auto_110337 ?auto_110345 ) ) ( not ( = ?auto_110337 ?auto_110346 ) ) ( not ( = ?auto_110337 ?auto_110347 ) ) ( not ( = ?auto_110338 ?auto_110339 ) ) ( not ( = ?auto_110338 ?auto_110340 ) ) ( not ( = ?auto_110338 ?auto_110341 ) ) ( not ( = ?auto_110338 ?auto_110342 ) ) ( not ( = ?auto_110338 ?auto_110343 ) ) ( not ( = ?auto_110338 ?auto_110344 ) ) ( not ( = ?auto_110338 ?auto_110345 ) ) ( not ( = ?auto_110338 ?auto_110346 ) ) ( not ( = ?auto_110338 ?auto_110347 ) ) ( not ( = ?auto_110339 ?auto_110340 ) ) ( not ( = ?auto_110339 ?auto_110341 ) ) ( not ( = ?auto_110339 ?auto_110342 ) ) ( not ( = ?auto_110339 ?auto_110343 ) ) ( not ( = ?auto_110339 ?auto_110344 ) ) ( not ( = ?auto_110339 ?auto_110345 ) ) ( not ( = ?auto_110339 ?auto_110346 ) ) ( not ( = ?auto_110339 ?auto_110347 ) ) ( not ( = ?auto_110340 ?auto_110341 ) ) ( not ( = ?auto_110340 ?auto_110342 ) ) ( not ( = ?auto_110340 ?auto_110343 ) ) ( not ( = ?auto_110340 ?auto_110344 ) ) ( not ( = ?auto_110340 ?auto_110345 ) ) ( not ( = ?auto_110340 ?auto_110346 ) ) ( not ( = ?auto_110340 ?auto_110347 ) ) ( not ( = ?auto_110341 ?auto_110342 ) ) ( not ( = ?auto_110341 ?auto_110343 ) ) ( not ( = ?auto_110341 ?auto_110344 ) ) ( not ( = ?auto_110341 ?auto_110345 ) ) ( not ( = ?auto_110341 ?auto_110346 ) ) ( not ( = ?auto_110341 ?auto_110347 ) ) ( not ( = ?auto_110342 ?auto_110343 ) ) ( not ( = ?auto_110342 ?auto_110344 ) ) ( not ( = ?auto_110342 ?auto_110345 ) ) ( not ( = ?auto_110342 ?auto_110346 ) ) ( not ( = ?auto_110342 ?auto_110347 ) ) ( not ( = ?auto_110343 ?auto_110344 ) ) ( not ( = ?auto_110343 ?auto_110345 ) ) ( not ( = ?auto_110343 ?auto_110346 ) ) ( not ( = ?auto_110343 ?auto_110347 ) ) ( not ( = ?auto_110344 ?auto_110345 ) ) ( not ( = ?auto_110344 ?auto_110346 ) ) ( not ( = ?auto_110344 ?auto_110347 ) ) ( not ( = ?auto_110345 ?auto_110346 ) ) ( not ( = ?auto_110345 ?auto_110347 ) ) ( not ( = ?auto_110346 ?auto_110347 ) ) ( ON ?auto_110345 ?auto_110346 ) ( ON ?auto_110344 ?auto_110345 ) ( ON ?auto_110343 ?auto_110344 ) ( CLEAR ?auto_110341 ) ( ON ?auto_110342 ?auto_110343 ) ( CLEAR ?auto_110342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_110337 ?auto_110338 ?auto_110339 ?auto_110340 ?auto_110341 ?auto_110342 )
      ( MAKE-10PILE ?auto_110337 ?auto_110338 ?auto_110339 ?auto_110340 ?auto_110341 ?auto_110342 ?auto_110343 ?auto_110344 ?auto_110345 ?auto_110346 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_110358 - BLOCK
      ?auto_110359 - BLOCK
      ?auto_110360 - BLOCK
      ?auto_110361 - BLOCK
      ?auto_110362 - BLOCK
      ?auto_110363 - BLOCK
      ?auto_110364 - BLOCK
      ?auto_110365 - BLOCK
      ?auto_110366 - BLOCK
      ?auto_110367 - BLOCK
    )
    :vars
    (
      ?auto_110368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110367 ?auto_110368 ) ( ON-TABLE ?auto_110358 ) ( ON ?auto_110359 ?auto_110358 ) ( ON ?auto_110360 ?auto_110359 ) ( ON ?auto_110361 ?auto_110360 ) ( not ( = ?auto_110358 ?auto_110359 ) ) ( not ( = ?auto_110358 ?auto_110360 ) ) ( not ( = ?auto_110358 ?auto_110361 ) ) ( not ( = ?auto_110358 ?auto_110362 ) ) ( not ( = ?auto_110358 ?auto_110363 ) ) ( not ( = ?auto_110358 ?auto_110364 ) ) ( not ( = ?auto_110358 ?auto_110365 ) ) ( not ( = ?auto_110358 ?auto_110366 ) ) ( not ( = ?auto_110358 ?auto_110367 ) ) ( not ( = ?auto_110358 ?auto_110368 ) ) ( not ( = ?auto_110359 ?auto_110360 ) ) ( not ( = ?auto_110359 ?auto_110361 ) ) ( not ( = ?auto_110359 ?auto_110362 ) ) ( not ( = ?auto_110359 ?auto_110363 ) ) ( not ( = ?auto_110359 ?auto_110364 ) ) ( not ( = ?auto_110359 ?auto_110365 ) ) ( not ( = ?auto_110359 ?auto_110366 ) ) ( not ( = ?auto_110359 ?auto_110367 ) ) ( not ( = ?auto_110359 ?auto_110368 ) ) ( not ( = ?auto_110360 ?auto_110361 ) ) ( not ( = ?auto_110360 ?auto_110362 ) ) ( not ( = ?auto_110360 ?auto_110363 ) ) ( not ( = ?auto_110360 ?auto_110364 ) ) ( not ( = ?auto_110360 ?auto_110365 ) ) ( not ( = ?auto_110360 ?auto_110366 ) ) ( not ( = ?auto_110360 ?auto_110367 ) ) ( not ( = ?auto_110360 ?auto_110368 ) ) ( not ( = ?auto_110361 ?auto_110362 ) ) ( not ( = ?auto_110361 ?auto_110363 ) ) ( not ( = ?auto_110361 ?auto_110364 ) ) ( not ( = ?auto_110361 ?auto_110365 ) ) ( not ( = ?auto_110361 ?auto_110366 ) ) ( not ( = ?auto_110361 ?auto_110367 ) ) ( not ( = ?auto_110361 ?auto_110368 ) ) ( not ( = ?auto_110362 ?auto_110363 ) ) ( not ( = ?auto_110362 ?auto_110364 ) ) ( not ( = ?auto_110362 ?auto_110365 ) ) ( not ( = ?auto_110362 ?auto_110366 ) ) ( not ( = ?auto_110362 ?auto_110367 ) ) ( not ( = ?auto_110362 ?auto_110368 ) ) ( not ( = ?auto_110363 ?auto_110364 ) ) ( not ( = ?auto_110363 ?auto_110365 ) ) ( not ( = ?auto_110363 ?auto_110366 ) ) ( not ( = ?auto_110363 ?auto_110367 ) ) ( not ( = ?auto_110363 ?auto_110368 ) ) ( not ( = ?auto_110364 ?auto_110365 ) ) ( not ( = ?auto_110364 ?auto_110366 ) ) ( not ( = ?auto_110364 ?auto_110367 ) ) ( not ( = ?auto_110364 ?auto_110368 ) ) ( not ( = ?auto_110365 ?auto_110366 ) ) ( not ( = ?auto_110365 ?auto_110367 ) ) ( not ( = ?auto_110365 ?auto_110368 ) ) ( not ( = ?auto_110366 ?auto_110367 ) ) ( not ( = ?auto_110366 ?auto_110368 ) ) ( not ( = ?auto_110367 ?auto_110368 ) ) ( ON ?auto_110366 ?auto_110367 ) ( ON ?auto_110365 ?auto_110366 ) ( ON ?auto_110364 ?auto_110365 ) ( ON ?auto_110363 ?auto_110364 ) ( CLEAR ?auto_110361 ) ( ON ?auto_110362 ?auto_110363 ) ( CLEAR ?auto_110362 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_110358 ?auto_110359 ?auto_110360 ?auto_110361 ?auto_110362 )
      ( MAKE-10PILE ?auto_110358 ?auto_110359 ?auto_110360 ?auto_110361 ?auto_110362 ?auto_110363 ?auto_110364 ?auto_110365 ?auto_110366 ?auto_110367 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_110379 - BLOCK
      ?auto_110380 - BLOCK
      ?auto_110381 - BLOCK
      ?auto_110382 - BLOCK
      ?auto_110383 - BLOCK
      ?auto_110384 - BLOCK
      ?auto_110385 - BLOCK
      ?auto_110386 - BLOCK
      ?auto_110387 - BLOCK
      ?auto_110388 - BLOCK
    )
    :vars
    (
      ?auto_110389 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110388 ?auto_110389 ) ( ON-TABLE ?auto_110379 ) ( ON ?auto_110380 ?auto_110379 ) ( ON ?auto_110381 ?auto_110380 ) ( ON ?auto_110382 ?auto_110381 ) ( not ( = ?auto_110379 ?auto_110380 ) ) ( not ( = ?auto_110379 ?auto_110381 ) ) ( not ( = ?auto_110379 ?auto_110382 ) ) ( not ( = ?auto_110379 ?auto_110383 ) ) ( not ( = ?auto_110379 ?auto_110384 ) ) ( not ( = ?auto_110379 ?auto_110385 ) ) ( not ( = ?auto_110379 ?auto_110386 ) ) ( not ( = ?auto_110379 ?auto_110387 ) ) ( not ( = ?auto_110379 ?auto_110388 ) ) ( not ( = ?auto_110379 ?auto_110389 ) ) ( not ( = ?auto_110380 ?auto_110381 ) ) ( not ( = ?auto_110380 ?auto_110382 ) ) ( not ( = ?auto_110380 ?auto_110383 ) ) ( not ( = ?auto_110380 ?auto_110384 ) ) ( not ( = ?auto_110380 ?auto_110385 ) ) ( not ( = ?auto_110380 ?auto_110386 ) ) ( not ( = ?auto_110380 ?auto_110387 ) ) ( not ( = ?auto_110380 ?auto_110388 ) ) ( not ( = ?auto_110380 ?auto_110389 ) ) ( not ( = ?auto_110381 ?auto_110382 ) ) ( not ( = ?auto_110381 ?auto_110383 ) ) ( not ( = ?auto_110381 ?auto_110384 ) ) ( not ( = ?auto_110381 ?auto_110385 ) ) ( not ( = ?auto_110381 ?auto_110386 ) ) ( not ( = ?auto_110381 ?auto_110387 ) ) ( not ( = ?auto_110381 ?auto_110388 ) ) ( not ( = ?auto_110381 ?auto_110389 ) ) ( not ( = ?auto_110382 ?auto_110383 ) ) ( not ( = ?auto_110382 ?auto_110384 ) ) ( not ( = ?auto_110382 ?auto_110385 ) ) ( not ( = ?auto_110382 ?auto_110386 ) ) ( not ( = ?auto_110382 ?auto_110387 ) ) ( not ( = ?auto_110382 ?auto_110388 ) ) ( not ( = ?auto_110382 ?auto_110389 ) ) ( not ( = ?auto_110383 ?auto_110384 ) ) ( not ( = ?auto_110383 ?auto_110385 ) ) ( not ( = ?auto_110383 ?auto_110386 ) ) ( not ( = ?auto_110383 ?auto_110387 ) ) ( not ( = ?auto_110383 ?auto_110388 ) ) ( not ( = ?auto_110383 ?auto_110389 ) ) ( not ( = ?auto_110384 ?auto_110385 ) ) ( not ( = ?auto_110384 ?auto_110386 ) ) ( not ( = ?auto_110384 ?auto_110387 ) ) ( not ( = ?auto_110384 ?auto_110388 ) ) ( not ( = ?auto_110384 ?auto_110389 ) ) ( not ( = ?auto_110385 ?auto_110386 ) ) ( not ( = ?auto_110385 ?auto_110387 ) ) ( not ( = ?auto_110385 ?auto_110388 ) ) ( not ( = ?auto_110385 ?auto_110389 ) ) ( not ( = ?auto_110386 ?auto_110387 ) ) ( not ( = ?auto_110386 ?auto_110388 ) ) ( not ( = ?auto_110386 ?auto_110389 ) ) ( not ( = ?auto_110387 ?auto_110388 ) ) ( not ( = ?auto_110387 ?auto_110389 ) ) ( not ( = ?auto_110388 ?auto_110389 ) ) ( ON ?auto_110387 ?auto_110388 ) ( ON ?auto_110386 ?auto_110387 ) ( ON ?auto_110385 ?auto_110386 ) ( ON ?auto_110384 ?auto_110385 ) ( CLEAR ?auto_110382 ) ( ON ?auto_110383 ?auto_110384 ) ( CLEAR ?auto_110383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_110379 ?auto_110380 ?auto_110381 ?auto_110382 ?auto_110383 )
      ( MAKE-10PILE ?auto_110379 ?auto_110380 ?auto_110381 ?auto_110382 ?auto_110383 ?auto_110384 ?auto_110385 ?auto_110386 ?auto_110387 ?auto_110388 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_110400 - BLOCK
      ?auto_110401 - BLOCK
      ?auto_110402 - BLOCK
      ?auto_110403 - BLOCK
      ?auto_110404 - BLOCK
      ?auto_110405 - BLOCK
      ?auto_110406 - BLOCK
      ?auto_110407 - BLOCK
      ?auto_110408 - BLOCK
      ?auto_110409 - BLOCK
    )
    :vars
    (
      ?auto_110410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110409 ?auto_110410 ) ( ON-TABLE ?auto_110400 ) ( ON ?auto_110401 ?auto_110400 ) ( ON ?auto_110402 ?auto_110401 ) ( not ( = ?auto_110400 ?auto_110401 ) ) ( not ( = ?auto_110400 ?auto_110402 ) ) ( not ( = ?auto_110400 ?auto_110403 ) ) ( not ( = ?auto_110400 ?auto_110404 ) ) ( not ( = ?auto_110400 ?auto_110405 ) ) ( not ( = ?auto_110400 ?auto_110406 ) ) ( not ( = ?auto_110400 ?auto_110407 ) ) ( not ( = ?auto_110400 ?auto_110408 ) ) ( not ( = ?auto_110400 ?auto_110409 ) ) ( not ( = ?auto_110400 ?auto_110410 ) ) ( not ( = ?auto_110401 ?auto_110402 ) ) ( not ( = ?auto_110401 ?auto_110403 ) ) ( not ( = ?auto_110401 ?auto_110404 ) ) ( not ( = ?auto_110401 ?auto_110405 ) ) ( not ( = ?auto_110401 ?auto_110406 ) ) ( not ( = ?auto_110401 ?auto_110407 ) ) ( not ( = ?auto_110401 ?auto_110408 ) ) ( not ( = ?auto_110401 ?auto_110409 ) ) ( not ( = ?auto_110401 ?auto_110410 ) ) ( not ( = ?auto_110402 ?auto_110403 ) ) ( not ( = ?auto_110402 ?auto_110404 ) ) ( not ( = ?auto_110402 ?auto_110405 ) ) ( not ( = ?auto_110402 ?auto_110406 ) ) ( not ( = ?auto_110402 ?auto_110407 ) ) ( not ( = ?auto_110402 ?auto_110408 ) ) ( not ( = ?auto_110402 ?auto_110409 ) ) ( not ( = ?auto_110402 ?auto_110410 ) ) ( not ( = ?auto_110403 ?auto_110404 ) ) ( not ( = ?auto_110403 ?auto_110405 ) ) ( not ( = ?auto_110403 ?auto_110406 ) ) ( not ( = ?auto_110403 ?auto_110407 ) ) ( not ( = ?auto_110403 ?auto_110408 ) ) ( not ( = ?auto_110403 ?auto_110409 ) ) ( not ( = ?auto_110403 ?auto_110410 ) ) ( not ( = ?auto_110404 ?auto_110405 ) ) ( not ( = ?auto_110404 ?auto_110406 ) ) ( not ( = ?auto_110404 ?auto_110407 ) ) ( not ( = ?auto_110404 ?auto_110408 ) ) ( not ( = ?auto_110404 ?auto_110409 ) ) ( not ( = ?auto_110404 ?auto_110410 ) ) ( not ( = ?auto_110405 ?auto_110406 ) ) ( not ( = ?auto_110405 ?auto_110407 ) ) ( not ( = ?auto_110405 ?auto_110408 ) ) ( not ( = ?auto_110405 ?auto_110409 ) ) ( not ( = ?auto_110405 ?auto_110410 ) ) ( not ( = ?auto_110406 ?auto_110407 ) ) ( not ( = ?auto_110406 ?auto_110408 ) ) ( not ( = ?auto_110406 ?auto_110409 ) ) ( not ( = ?auto_110406 ?auto_110410 ) ) ( not ( = ?auto_110407 ?auto_110408 ) ) ( not ( = ?auto_110407 ?auto_110409 ) ) ( not ( = ?auto_110407 ?auto_110410 ) ) ( not ( = ?auto_110408 ?auto_110409 ) ) ( not ( = ?auto_110408 ?auto_110410 ) ) ( not ( = ?auto_110409 ?auto_110410 ) ) ( ON ?auto_110408 ?auto_110409 ) ( ON ?auto_110407 ?auto_110408 ) ( ON ?auto_110406 ?auto_110407 ) ( ON ?auto_110405 ?auto_110406 ) ( ON ?auto_110404 ?auto_110405 ) ( CLEAR ?auto_110402 ) ( ON ?auto_110403 ?auto_110404 ) ( CLEAR ?auto_110403 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_110400 ?auto_110401 ?auto_110402 ?auto_110403 )
      ( MAKE-10PILE ?auto_110400 ?auto_110401 ?auto_110402 ?auto_110403 ?auto_110404 ?auto_110405 ?auto_110406 ?auto_110407 ?auto_110408 ?auto_110409 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_110421 - BLOCK
      ?auto_110422 - BLOCK
      ?auto_110423 - BLOCK
      ?auto_110424 - BLOCK
      ?auto_110425 - BLOCK
      ?auto_110426 - BLOCK
      ?auto_110427 - BLOCK
      ?auto_110428 - BLOCK
      ?auto_110429 - BLOCK
      ?auto_110430 - BLOCK
    )
    :vars
    (
      ?auto_110431 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110430 ?auto_110431 ) ( ON-TABLE ?auto_110421 ) ( ON ?auto_110422 ?auto_110421 ) ( ON ?auto_110423 ?auto_110422 ) ( not ( = ?auto_110421 ?auto_110422 ) ) ( not ( = ?auto_110421 ?auto_110423 ) ) ( not ( = ?auto_110421 ?auto_110424 ) ) ( not ( = ?auto_110421 ?auto_110425 ) ) ( not ( = ?auto_110421 ?auto_110426 ) ) ( not ( = ?auto_110421 ?auto_110427 ) ) ( not ( = ?auto_110421 ?auto_110428 ) ) ( not ( = ?auto_110421 ?auto_110429 ) ) ( not ( = ?auto_110421 ?auto_110430 ) ) ( not ( = ?auto_110421 ?auto_110431 ) ) ( not ( = ?auto_110422 ?auto_110423 ) ) ( not ( = ?auto_110422 ?auto_110424 ) ) ( not ( = ?auto_110422 ?auto_110425 ) ) ( not ( = ?auto_110422 ?auto_110426 ) ) ( not ( = ?auto_110422 ?auto_110427 ) ) ( not ( = ?auto_110422 ?auto_110428 ) ) ( not ( = ?auto_110422 ?auto_110429 ) ) ( not ( = ?auto_110422 ?auto_110430 ) ) ( not ( = ?auto_110422 ?auto_110431 ) ) ( not ( = ?auto_110423 ?auto_110424 ) ) ( not ( = ?auto_110423 ?auto_110425 ) ) ( not ( = ?auto_110423 ?auto_110426 ) ) ( not ( = ?auto_110423 ?auto_110427 ) ) ( not ( = ?auto_110423 ?auto_110428 ) ) ( not ( = ?auto_110423 ?auto_110429 ) ) ( not ( = ?auto_110423 ?auto_110430 ) ) ( not ( = ?auto_110423 ?auto_110431 ) ) ( not ( = ?auto_110424 ?auto_110425 ) ) ( not ( = ?auto_110424 ?auto_110426 ) ) ( not ( = ?auto_110424 ?auto_110427 ) ) ( not ( = ?auto_110424 ?auto_110428 ) ) ( not ( = ?auto_110424 ?auto_110429 ) ) ( not ( = ?auto_110424 ?auto_110430 ) ) ( not ( = ?auto_110424 ?auto_110431 ) ) ( not ( = ?auto_110425 ?auto_110426 ) ) ( not ( = ?auto_110425 ?auto_110427 ) ) ( not ( = ?auto_110425 ?auto_110428 ) ) ( not ( = ?auto_110425 ?auto_110429 ) ) ( not ( = ?auto_110425 ?auto_110430 ) ) ( not ( = ?auto_110425 ?auto_110431 ) ) ( not ( = ?auto_110426 ?auto_110427 ) ) ( not ( = ?auto_110426 ?auto_110428 ) ) ( not ( = ?auto_110426 ?auto_110429 ) ) ( not ( = ?auto_110426 ?auto_110430 ) ) ( not ( = ?auto_110426 ?auto_110431 ) ) ( not ( = ?auto_110427 ?auto_110428 ) ) ( not ( = ?auto_110427 ?auto_110429 ) ) ( not ( = ?auto_110427 ?auto_110430 ) ) ( not ( = ?auto_110427 ?auto_110431 ) ) ( not ( = ?auto_110428 ?auto_110429 ) ) ( not ( = ?auto_110428 ?auto_110430 ) ) ( not ( = ?auto_110428 ?auto_110431 ) ) ( not ( = ?auto_110429 ?auto_110430 ) ) ( not ( = ?auto_110429 ?auto_110431 ) ) ( not ( = ?auto_110430 ?auto_110431 ) ) ( ON ?auto_110429 ?auto_110430 ) ( ON ?auto_110428 ?auto_110429 ) ( ON ?auto_110427 ?auto_110428 ) ( ON ?auto_110426 ?auto_110427 ) ( ON ?auto_110425 ?auto_110426 ) ( CLEAR ?auto_110423 ) ( ON ?auto_110424 ?auto_110425 ) ( CLEAR ?auto_110424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_110421 ?auto_110422 ?auto_110423 ?auto_110424 )
      ( MAKE-10PILE ?auto_110421 ?auto_110422 ?auto_110423 ?auto_110424 ?auto_110425 ?auto_110426 ?auto_110427 ?auto_110428 ?auto_110429 ?auto_110430 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_110442 - BLOCK
      ?auto_110443 - BLOCK
      ?auto_110444 - BLOCK
      ?auto_110445 - BLOCK
      ?auto_110446 - BLOCK
      ?auto_110447 - BLOCK
      ?auto_110448 - BLOCK
      ?auto_110449 - BLOCK
      ?auto_110450 - BLOCK
      ?auto_110451 - BLOCK
    )
    :vars
    (
      ?auto_110452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110451 ?auto_110452 ) ( ON-TABLE ?auto_110442 ) ( ON ?auto_110443 ?auto_110442 ) ( not ( = ?auto_110442 ?auto_110443 ) ) ( not ( = ?auto_110442 ?auto_110444 ) ) ( not ( = ?auto_110442 ?auto_110445 ) ) ( not ( = ?auto_110442 ?auto_110446 ) ) ( not ( = ?auto_110442 ?auto_110447 ) ) ( not ( = ?auto_110442 ?auto_110448 ) ) ( not ( = ?auto_110442 ?auto_110449 ) ) ( not ( = ?auto_110442 ?auto_110450 ) ) ( not ( = ?auto_110442 ?auto_110451 ) ) ( not ( = ?auto_110442 ?auto_110452 ) ) ( not ( = ?auto_110443 ?auto_110444 ) ) ( not ( = ?auto_110443 ?auto_110445 ) ) ( not ( = ?auto_110443 ?auto_110446 ) ) ( not ( = ?auto_110443 ?auto_110447 ) ) ( not ( = ?auto_110443 ?auto_110448 ) ) ( not ( = ?auto_110443 ?auto_110449 ) ) ( not ( = ?auto_110443 ?auto_110450 ) ) ( not ( = ?auto_110443 ?auto_110451 ) ) ( not ( = ?auto_110443 ?auto_110452 ) ) ( not ( = ?auto_110444 ?auto_110445 ) ) ( not ( = ?auto_110444 ?auto_110446 ) ) ( not ( = ?auto_110444 ?auto_110447 ) ) ( not ( = ?auto_110444 ?auto_110448 ) ) ( not ( = ?auto_110444 ?auto_110449 ) ) ( not ( = ?auto_110444 ?auto_110450 ) ) ( not ( = ?auto_110444 ?auto_110451 ) ) ( not ( = ?auto_110444 ?auto_110452 ) ) ( not ( = ?auto_110445 ?auto_110446 ) ) ( not ( = ?auto_110445 ?auto_110447 ) ) ( not ( = ?auto_110445 ?auto_110448 ) ) ( not ( = ?auto_110445 ?auto_110449 ) ) ( not ( = ?auto_110445 ?auto_110450 ) ) ( not ( = ?auto_110445 ?auto_110451 ) ) ( not ( = ?auto_110445 ?auto_110452 ) ) ( not ( = ?auto_110446 ?auto_110447 ) ) ( not ( = ?auto_110446 ?auto_110448 ) ) ( not ( = ?auto_110446 ?auto_110449 ) ) ( not ( = ?auto_110446 ?auto_110450 ) ) ( not ( = ?auto_110446 ?auto_110451 ) ) ( not ( = ?auto_110446 ?auto_110452 ) ) ( not ( = ?auto_110447 ?auto_110448 ) ) ( not ( = ?auto_110447 ?auto_110449 ) ) ( not ( = ?auto_110447 ?auto_110450 ) ) ( not ( = ?auto_110447 ?auto_110451 ) ) ( not ( = ?auto_110447 ?auto_110452 ) ) ( not ( = ?auto_110448 ?auto_110449 ) ) ( not ( = ?auto_110448 ?auto_110450 ) ) ( not ( = ?auto_110448 ?auto_110451 ) ) ( not ( = ?auto_110448 ?auto_110452 ) ) ( not ( = ?auto_110449 ?auto_110450 ) ) ( not ( = ?auto_110449 ?auto_110451 ) ) ( not ( = ?auto_110449 ?auto_110452 ) ) ( not ( = ?auto_110450 ?auto_110451 ) ) ( not ( = ?auto_110450 ?auto_110452 ) ) ( not ( = ?auto_110451 ?auto_110452 ) ) ( ON ?auto_110450 ?auto_110451 ) ( ON ?auto_110449 ?auto_110450 ) ( ON ?auto_110448 ?auto_110449 ) ( ON ?auto_110447 ?auto_110448 ) ( ON ?auto_110446 ?auto_110447 ) ( ON ?auto_110445 ?auto_110446 ) ( CLEAR ?auto_110443 ) ( ON ?auto_110444 ?auto_110445 ) ( CLEAR ?auto_110444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_110442 ?auto_110443 ?auto_110444 )
      ( MAKE-10PILE ?auto_110442 ?auto_110443 ?auto_110444 ?auto_110445 ?auto_110446 ?auto_110447 ?auto_110448 ?auto_110449 ?auto_110450 ?auto_110451 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_110463 - BLOCK
      ?auto_110464 - BLOCK
      ?auto_110465 - BLOCK
      ?auto_110466 - BLOCK
      ?auto_110467 - BLOCK
      ?auto_110468 - BLOCK
      ?auto_110469 - BLOCK
      ?auto_110470 - BLOCK
      ?auto_110471 - BLOCK
      ?auto_110472 - BLOCK
    )
    :vars
    (
      ?auto_110473 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110472 ?auto_110473 ) ( ON-TABLE ?auto_110463 ) ( ON ?auto_110464 ?auto_110463 ) ( not ( = ?auto_110463 ?auto_110464 ) ) ( not ( = ?auto_110463 ?auto_110465 ) ) ( not ( = ?auto_110463 ?auto_110466 ) ) ( not ( = ?auto_110463 ?auto_110467 ) ) ( not ( = ?auto_110463 ?auto_110468 ) ) ( not ( = ?auto_110463 ?auto_110469 ) ) ( not ( = ?auto_110463 ?auto_110470 ) ) ( not ( = ?auto_110463 ?auto_110471 ) ) ( not ( = ?auto_110463 ?auto_110472 ) ) ( not ( = ?auto_110463 ?auto_110473 ) ) ( not ( = ?auto_110464 ?auto_110465 ) ) ( not ( = ?auto_110464 ?auto_110466 ) ) ( not ( = ?auto_110464 ?auto_110467 ) ) ( not ( = ?auto_110464 ?auto_110468 ) ) ( not ( = ?auto_110464 ?auto_110469 ) ) ( not ( = ?auto_110464 ?auto_110470 ) ) ( not ( = ?auto_110464 ?auto_110471 ) ) ( not ( = ?auto_110464 ?auto_110472 ) ) ( not ( = ?auto_110464 ?auto_110473 ) ) ( not ( = ?auto_110465 ?auto_110466 ) ) ( not ( = ?auto_110465 ?auto_110467 ) ) ( not ( = ?auto_110465 ?auto_110468 ) ) ( not ( = ?auto_110465 ?auto_110469 ) ) ( not ( = ?auto_110465 ?auto_110470 ) ) ( not ( = ?auto_110465 ?auto_110471 ) ) ( not ( = ?auto_110465 ?auto_110472 ) ) ( not ( = ?auto_110465 ?auto_110473 ) ) ( not ( = ?auto_110466 ?auto_110467 ) ) ( not ( = ?auto_110466 ?auto_110468 ) ) ( not ( = ?auto_110466 ?auto_110469 ) ) ( not ( = ?auto_110466 ?auto_110470 ) ) ( not ( = ?auto_110466 ?auto_110471 ) ) ( not ( = ?auto_110466 ?auto_110472 ) ) ( not ( = ?auto_110466 ?auto_110473 ) ) ( not ( = ?auto_110467 ?auto_110468 ) ) ( not ( = ?auto_110467 ?auto_110469 ) ) ( not ( = ?auto_110467 ?auto_110470 ) ) ( not ( = ?auto_110467 ?auto_110471 ) ) ( not ( = ?auto_110467 ?auto_110472 ) ) ( not ( = ?auto_110467 ?auto_110473 ) ) ( not ( = ?auto_110468 ?auto_110469 ) ) ( not ( = ?auto_110468 ?auto_110470 ) ) ( not ( = ?auto_110468 ?auto_110471 ) ) ( not ( = ?auto_110468 ?auto_110472 ) ) ( not ( = ?auto_110468 ?auto_110473 ) ) ( not ( = ?auto_110469 ?auto_110470 ) ) ( not ( = ?auto_110469 ?auto_110471 ) ) ( not ( = ?auto_110469 ?auto_110472 ) ) ( not ( = ?auto_110469 ?auto_110473 ) ) ( not ( = ?auto_110470 ?auto_110471 ) ) ( not ( = ?auto_110470 ?auto_110472 ) ) ( not ( = ?auto_110470 ?auto_110473 ) ) ( not ( = ?auto_110471 ?auto_110472 ) ) ( not ( = ?auto_110471 ?auto_110473 ) ) ( not ( = ?auto_110472 ?auto_110473 ) ) ( ON ?auto_110471 ?auto_110472 ) ( ON ?auto_110470 ?auto_110471 ) ( ON ?auto_110469 ?auto_110470 ) ( ON ?auto_110468 ?auto_110469 ) ( ON ?auto_110467 ?auto_110468 ) ( ON ?auto_110466 ?auto_110467 ) ( CLEAR ?auto_110464 ) ( ON ?auto_110465 ?auto_110466 ) ( CLEAR ?auto_110465 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_110463 ?auto_110464 ?auto_110465 )
      ( MAKE-10PILE ?auto_110463 ?auto_110464 ?auto_110465 ?auto_110466 ?auto_110467 ?auto_110468 ?auto_110469 ?auto_110470 ?auto_110471 ?auto_110472 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_110484 - BLOCK
      ?auto_110485 - BLOCK
      ?auto_110486 - BLOCK
      ?auto_110487 - BLOCK
      ?auto_110488 - BLOCK
      ?auto_110489 - BLOCK
      ?auto_110490 - BLOCK
      ?auto_110491 - BLOCK
      ?auto_110492 - BLOCK
      ?auto_110493 - BLOCK
    )
    :vars
    (
      ?auto_110494 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110493 ?auto_110494 ) ( ON-TABLE ?auto_110484 ) ( not ( = ?auto_110484 ?auto_110485 ) ) ( not ( = ?auto_110484 ?auto_110486 ) ) ( not ( = ?auto_110484 ?auto_110487 ) ) ( not ( = ?auto_110484 ?auto_110488 ) ) ( not ( = ?auto_110484 ?auto_110489 ) ) ( not ( = ?auto_110484 ?auto_110490 ) ) ( not ( = ?auto_110484 ?auto_110491 ) ) ( not ( = ?auto_110484 ?auto_110492 ) ) ( not ( = ?auto_110484 ?auto_110493 ) ) ( not ( = ?auto_110484 ?auto_110494 ) ) ( not ( = ?auto_110485 ?auto_110486 ) ) ( not ( = ?auto_110485 ?auto_110487 ) ) ( not ( = ?auto_110485 ?auto_110488 ) ) ( not ( = ?auto_110485 ?auto_110489 ) ) ( not ( = ?auto_110485 ?auto_110490 ) ) ( not ( = ?auto_110485 ?auto_110491 ) ) ( not ( = ?auto_110485 ?auto_110492 ) ) ( not ( = ?auto_110485 ?auto_110493 ) ) ( not ( = ?auto_110485 ?auto_110494 ) ) ( not ( = ?auto_110486 ?auto_110487 ) ) ( not ( = ?auto_110486 ?auto_110488 ) ) ( not ( = ?auto_110486 ?auto_110489 ) ) ( not ( = ?auto_110486 ?auto_110490 ) ) ( not ( = ?auto_110486 ?auto_110491 ) ) ( not ( = ?auto_110486 ?auto_110492 ) ) ( not ( = ?auto_110486 ?auto_110493 ) ) ( not ( = ?auto_110486 ?auto_110494 ) ) ( not ( = ?auto_110487 ?auto_110488 ) ) ( not ( = ?auto_110487 ?auto_110489 ) ) ( not ( = ?auto_110487 ?auto_110490 ) ) ( not ( = ?auto_110487 ?auto_110491 ) ) ( not ( = ?auto_110487 ?auto_110492 ) ) ( not ( = ?auto_110487 ?auto_110493 ) ) ( not ( = ?auto_110487 ?auto_110494 ) ) ( not ( = ?auto_110488 ?auto_110489 ) ) ( not ( = ?auto_110488 ?auto_110490 ) ) ( not ( = ?auto_110488 ?auto_110491 ) ) ( not ( = ?auto_110488 ?auto_110492 ) ) ( not ( = ?auto_110488 ?auto_110493 ) ) ( not ( = ?auto_110488 ?auto_110494 ) ) ( not ( = ?auto_110489 ?auto_110490 ) ) ( not ( = ?auto_110489 ?auto_110491 ) ) ( not ( = ?auto_110489 ?auto_110492 ) ) ( not ( = ?auto_110489 ?auto_110493 ) ) ( not ( = ?auto_110489 ?auto_110494 ) ) ( not ( = ?auto_110490 ?auto_110491 ) ) ( not ( = ?auto_110490 ?auto_110492 ) ) ( not ( = ?auto_110490 ?auto_110493 ) ) ( not ( = ?auto_110490 ?auto_110494 ) ) ( not ( = ?auto_110491 ?auto_110492 ) ) ( not ( = ?auto_110491 ?auto_110493 ) ) ( not ( = ?auto_110491 ?auto_110494 ) ) ( not ( = ?auto_110492 ?auto_110493 ) ) ( not ( = ?auto_110492 ?auto_110494 ) ) ( not ( = ?auto_110493 ?auto_110494 ) ) ( ON ?auto_110492 ?auto_110493 ) ( ON ?auto_110491 ?auto_110492 ) ( ON ?auto_110490 ?auto_110491 ) ( ON ?auto_110489 ?auto_110490 ) ( ON ?auto_110488 ?auto_110489 ) ( ON ?auto_110487 ?auto_110488 ) ( ON ?auto_110486 ?auto_110487 ) ( CLEAR ?auto_110484 ) ( ON ?auto_110485 ?auto_110486 ) ( CLEAR ?auto_110485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_110484 ?auto_110485 )
      ( MAKE-10PILE ?auto_110484 ?auto_110485 ?auto_110486 ?auto_110487 ?auto_110488 ?auto_110489 ?auto_110490 ?auto_110491 ?auto_110492 ?auto_110493 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_110505 - BLOCK
      ?auto_110506 - BLOCK
      ?auto_110507 - BLOCK
      ?auto_110508 - BLOCK
      ?auto_110509 - BLOCK
      ?auto_110510 - BLOCK
      ?auto_110511 - BLOCK
      ?auto_110512 - BLOCK
      ?auto_110513 - BLOCK
      ?auto_110514 - BLOCK
    )
    :vars
    (
      ?auto_110515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110514 ?auto_110515 ) ( ON-TABLE ?auto_110505 ) ( not ( = ?auto_110505 ?auto_110506 ) ) ( not ( = ?auto_110505 ?auto_110507 ) ) ( not ( = ?auto_110505 ?auto_110508 ) ) ( not ( = ?auto_110505 ?auto_110509 ) ) ( not ( = ?auto_110505 ?auto_110510 ) ) ( not ( = ?auto_110505 ?auto_110511 ) ) ( not ( = ?auto_110505 ?auto_110512 ) ) ( not ( = ?auto_110505 ?auto_110513 ) ) ( not ( = ?auto_110505 ?auto_110514 ) ) ( not ( = ?auto_110505 ?auto_110515 ) ) ( not ( = ?auto_110506 ?auto_110507 ) ) ( not ( = ?auto_110506 ?auto_110508 ) ) ( not ( = ?auto_110506 ?auto_110509 ) ) ( not ( = ?auto_110506 ?auto_110510 ) ) ( not ( = ?auto_110506 ?auto_110511 ) ) ( not ( = ?auto_110506 ?auto_110512 ) ) ( not ( = ?auto_110506 ?auto_110513 ) ) ( not ( = ?auto_110506 ?auto_110514 ) ) ( not ( = ?auto_110506 ?auto_110515 ) ) ( not ( = ?auto_110507 ?auto_110508 ) ) ( not ( = ?auto_110507 ?auto_110509 ) ) ( not ( = ?auto_110507 ?auto_110510 ) ) ( not ( = ?auto_110507 ?auto_110511 ) ) ( not ( = ?auto_110507 ?auto_110512 ) ) ( not ( = ?auto_110507 ?auto_110513 ) ) ( not ( = ?auto_110507 ?auto_110514 ) ) ( not ( = ?auto_110507 ?auto_110515 ) ) ( not ( = ?auto_110508 ?auto_110509 ) ) ( not ( = ?auto_110508 ?auto_110510 ) ) ( not ( = ?auto_110508 ?auto_110511 ) ) ( not ( = ?auto_110508 ?auto_110512 ) ) ( not ( = ?auto_110508 ?auto_110513 ) ) ( not ( = ?auto_110508 ?auto_110514 ) ) ( not ( = ?auto_110508 ?auto_110515 ) ) ( not ( = ?auto_110509 ?auto_110510 ) ) ( not ( = ?auto_110509 ?auto_110511 ) ) ( not ( = ?auto_110509 ?auto_110512 ) ) ( not ( = ?auto_110509 ?auto_110513 ) ) ( not ( = ?auto_110509 ?auto_110514 ) ) ( not ( = ?auto_110509 ?auto_110515 ) ) ( not ( = ?auto_110510 ?auto_110511 ) ) ( not ( = ?auto_110510 ?auto_110512 ) ) ( not ( = ?auto_110510 ?auto_110513 ) ) ( not ( = ?auto_110510 ?auto_110514 ) ) ( not ( = ?auto_110510 ?auto_110515 ) ) ( not ( = ?auto_110511 ?auto_110512 ) ) ( not ( = ?auto_110511 ?auto_110513 ) ) ( not ( = ?auto_110511 ?auto_110514 ) ) ( not ( = ?auto_110511 ?auto_110515 ) ) ( not ( = ?auto_110512 ?auto_110513 ) ) ( not ( = ?auto_110512 ?auto_110514 ) ) ( not ( = ?auto_110512 ?auto_110515 ) ) ( not ( = ?auto_110513 ?auto_110514 ) ) ( not ( = ?auto_110513 ?auto_110515 ) ) ( not ( = ?auto_110514 ?auto_110515 ) ) ( ON ?auto_110513 ?auto_110514 ) ( ON ?auto_110512 ?auto_110513 ) ( ON ?auto_110511 ?auto_110512 ) ( ON ?auto_110510 ?auto_110511 ) ( ON ?auto_110509 ?auto_110510 ) ( ON ?auto_110508 ?auto_110509 ) ( ON ?auto_110507 ?auto_110508 ) ( CLEAR ?auto_110505 ) ( ON ?auto_110506 ?auto_110507 ) ( CLEAR ?auto_110506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_110505 ?auto_110506 )
      ( MAKE-10PILE ?auto_110505 ?auto_110506 ?auto_110507 ?auto_110508 ?auto_110509 ?auto_110510 ?auto_110511 ?auto_110512 ?auto_110513 ?auto_110514 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_110526 - BLOCK
      ?auto_110527 - BLOCK
      ?auto_110528 - BLOCK
      ?auto_110529 - BLOCK
      ?auto_110530 - BLOCK
      ?auto_110531 - BLOCK
      ?auto_110532 - BLOCK
      ?auto_110533 - BLOCK
      ?auto_110534 - BLOCK
      ?auto_110535 - BLOCK
    )
    :vars
    (
      ?auto_110536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110535 ?auto_110536 ) ( not ( = ?auto_110526 ?auto_110527 ) ) ( not ( = ?auto_110526 ?auto_110528 ) ) ( not ( = ?auto_110526 ?auto_110529 ) ) ( not ( = ?auto_110526 ?auto_110530 ) ) ( not ( = ?auto_110526 ?auto_110531 ) ) ( not ( = ?auto_110526 ?auto_110532 ) ) ( not ( = ?auto_110526 ?auto_110533 ) ) ( not ( = ?auto_110526 ?auto_110534 ) ) ( not ( = ?auto_110526 ?auto_110535 ) ) ( not ( = ?auto_110526 ?auto_110536 ) ) ( not ( = ?auto_110527 ?auto_110528 ) ) ( not ( = ?auto_110527 ?auto_110529 ) ) ( not ( = ?auto_110527 ?auto_110530 ) ) ( not ( = ?auto_110527 ?auto_110531 ) ) ( not ( = ?auto_110527 ?auto_110532 ) ) ( not ( = ?auto_110527 ?auto_110533 ) ) ( not ( = ?auto_110527 ?auto_110534 ) ) ( not ( = ?auto_110527 ?auto_110535 ) ) ( not ( = ?auto_110527 ?auto_110536 ) ) ( not ( = ?auto_110528 ?auto_110529 ) ) ( not ( = ?auto_110528 ?auto_110530 ) ) ( not ( = ?auto_110528 ?auto_110531 ) ) ( not ( = ?auto_110528 ?auto_110532 ) ) ( not ( = ?auto_110528 ?auto_110533 ) ) ( not ( = ?auto_110528 ?auto_110534 ) ) ( not ( = ?auto_110528 ?auto_110535 ) ) ( not ( = ?auto_110528 ?auto_110536 ) ) ( not ( = ?auto_110529 ?auto_110530 ) ) ( not ( = ?auto_110529 ?auto_110531 ) ) ( not ( = ?auto_110529 ?auto_110532 ) ) ( not ( = ?auto_110529 ?auto_110533 ) ) ( not ( = ?auto_110529 ?auto_110534 ) ) ( not ( = ?auto_110529 ?auto_110535 ) ) ( not ( = ?auto_110529 ?auto_110536 ) ) ( not ( = ?auto_110530 ?auto_110531 ) ) ( not ( = ?auto_110530 ?auto_110532 ) ) ( not ( = ?auto_110530 ?auto_110533 ) ) ( not ( = ?auto_110530 ?auto_110534 ) ) ( not ( = ?auto_110530 ?auto_110535 ) ) ( not ( = ?auto_110530 ?auto_110536 ) ) ( not ( = ?auto_110531 ?auto_110532 ) ) ( not ( = ?auto_110531 ?auto_110533 ) ) ( not ( = ?auto_110531 ?auto_110534 ) ) ( not ( = ?auto_110531 ?auto_110535 ) ) ( not ( = ?auto_110531 ?auto_110536 ) ) ( not ( = ?auto_110532 ?auto_110533 ) ) ( not ( = ?auto_110532 ?auto_110534 ) ) ( not ( = ?auto_110532 ?auto_110535 ) ) ( not ( = ?auto_110532 ?auto_110536 ) ) ( not ( = ?auto_110533 ?auto_110534 ) ) ( not ( = ?auto_110533 ?auto_110535 ) ) ( not ( = ?auto_110533 ?auto_110536 ) ) ( not ( = ?auto_110534 ?auto_110535 ) ) ( not ( = ?auto_110534 ?auto_110536 ) ) ( not ( = ?auto_110535 ?auto_110536 ) ) ( ON ?auto_110534 ?auto_110535 ) ( ON ?auto_110533 ?auto_110534 ) ( ON ?auto_110532 ?auto_110533 ) ( ON ?auto_110531 ?auto_110532 ) ( ON ?auto_110530 ?auto_110531 ) ( ON ?auto_110529 ?auto_110530 ) ( ON ?auto_110528 ?auto_110529 ) ( ON ?auto_110527 ?auto_110528 ) ( ON ?auto_110526 ?auto_110527 ) ( CLEAR ?auto_110526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_110526 )
      ( MAKE-10PILE ?auto_110526 ?auto_110527 ?auto_110528 ?auto_110529 ?auto_110530 ?auto_110531 ?auto_110532 ?auto_110533 ?auto_110534 ?auto_110535 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_110547 - BLOCK
      ?auto_110548 - BLOCK
      ?auto_110549 - BLOCK
      ?auto_110550 - BLOCK
      ?auto_110551 - BLOCK
      ?auto_110552 - BLOCK
      ?auto_110553 - BLOCK
      ?auto_110554 - BLOCK
      ?auto_110555 - BLOCK
      ?auto_110556 - BLOCK
    )
    :vars
    (
      ?auto_110557 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110556 ?auto_110557 ) ( not ( = ?auto_110547 ?auto_110548 ) ) ( not ( = ?auto_110547 ?auto_110549 ) ) ( not ( = ?auto_110547 ?auto_110550 ) ) ( not ( = ?auto_110547 ?auto_110551 ) ) ( not ( = ?auto_110547 ?auto_110552 ) ) ( not ( = ?auto_110547 ?auto_110553 ) ) ( not ( = ?auto_110547 ?auto_110554 ) ) ( not ( = ?auto_110547 ?auto_110555 ) ) ( not ( = ?auto_110547 ?auto_110556 ) ) ( not ( = ?auto_110547 ?auto_110557 ) ) ( not ( = ?auto_110548 ?auto_110549 ) ) ( not ( = ?auto_110548 ?auto_110550 ) ) ( not ( = ?auto_110548 ?auto_110551 ) ) ( not ( = ?auto_110548 ?auto_110552 ) ) ( not ( = ?auto_110548 ?auto_110553 ) ) ( not ( = ?auto_110548 ?auto_110554 ) ) ( not ( = ?auto_110548 ?auto_110555 ) ) ( not ( = ?auto_110548 ?auto_110556 ) ) ( not ( = ?auto_110548 ?auto_110557 ) ) ( not ( = ?auto_110549 ?auto_110550 ) ) ( not ( = ?auto_110549 ?auto_110551 ) ) ( not ( = ?auto_110549 ?auto_110552 ) ) ( not ( = ?auto_110549 ?auto_110553 ) ) ( not ( = ?auto_110549 ?auto_110554 ) ) ( not ( = ?auto_110549 ?auto_110555 ) ) ( not ( = ?auto_110549 ?auto_110556 ) ) ( not ( = ?auto_110549 ?auto_110557 ) ) ( not ( = ?auto_110550 ?auto_110551 ) ) ( not ( = ?auto_110550 ?auto_110552 ) ) ( not ( = ?auto_110550 ?auto_110553 ) ) ( not ( = ?auto_110550 ?auto_110554 ) ) ( not ( = ?auto_110550 ?auto_110555 ) ) ( not ( = ?auto_110550 ?auto_110556 ) ) ( not ( = ?auto_110550 ?auto_110557 ) ) ( not ( = ?auto_110551 ?auto_110552 ) ) ( not ( = ?auto_110551 ?auto_110553 ) ) ( not ( = ?auto_110551 ?auto_110554 ) ) ( not ( = ?auto_110551 ?auto_110555 ) ) ( not ( = ?auto_110551 ?auto_110556 ) ) ( not ( = ?auto_110551 ?auto_110557 ) ) ( not ( = ?auto_110552 ?auto_110553 ) ) ( not ( = ?auto_110552 ?auto_110554 ) ) ( not ( = ?auto_110552 ?auto_110555 ) ) ( not ( = ?auto_110552 ?auto_110556 ) ) ( not ( = ?auto_110552 ?auto_110557 ) ) ( not ( = ?auto_110553 ?auto_110554 ) ) ( not ( = ?auto_110553 ?auto_110555 ) ) ( not ( = ?auto_110553 ?auto_110556 ) ) ( not ( = ?auto_110553 ?auto_110557 ) ) ( not ( = ?auto_110554 ?auto_110555 ) ) ( not ( = ?auto_110554 ?auto_110556 ) ) ( not ( = ?auto_110554 ?auto_110557 ) ) ( not ( = ?auto_110555 ?auto_110556 ) ) ( not ( = ?auto_110555 ?auto_110557 ) ) ( not ( = ?auto_110556 ?auto_110557 ) ) ( ON ?auto_110555 ?auto_110556 ) ( ON ?auto_110554 ?auto_110555 ) ( ON ?auto_110553 ?auto_110554 ) ( ON ?auto_110552 ?auto_110553 ) ( ON ?auto_110551 ?auto_110552 ) ( ON ?auto_110550 ?auto_110551 ) ( ON ?auto_110549 ?auto_110550 ) ( ON ?auto_110548 ?auto_110549 ) ( ON ?auto_110547 ?auto_110548 ) ( CLEAR ?auto_110547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_110547 )
      ( MAKE-10PILE ?auto_110547 ?auto_110548 ?auto_110549 ?auto_110550 ?auto_110551 ?auto_110552 ?auto_110553 ?auto_110554 ?auto_110555 ?auto_110556 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_110569 - BLOCK
      ?auto_110570 - BLOCK
      ?auto_110571 - BLOCK
      ?auto_110572 - BLOCK
      ?auto_110573 - BLOCK
      ?auto_110574 - BLOCK
      ?auto_110575 - BLOCK
      ?auto_110576 - BLOCK
      ?auto_110577 - BLOCK
      ?auto_110578 - BLOCK
      ?auto_110579 - BLOCK
    )
    :vars
    (
      ?auto_110580 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_110578 ) ( ON ?auto_110579 ?auto_110580 ) ( CLEAR ?auto_110579 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_110569 ) ( ON ?auto_110570 ?auto_110569 ) ( ON ?auto_110571 ?auto_110570 ) ( ON ?auto_110572 ?auto_110571 ) ( ON ?auto_110573 ?auto_110572 ) ( ON ?auto_110574 ?auto_110573 ) ( ON ?auto_110575 ?auto_110574 ) ( ON ?auto_110576 ?auto_110575 ) ( ON ?auto_110577 ?auto_110576 ) ( ON ?auto_110578 ?auto_110577 ) ( not ( = ?auto_110569 ?auto_110570 ) ) ( not ( = ?auto_110569 ?auto_110571 ) ) ( not ( = ?auto_110569 ?auto_110572 ) ) ( not ( = ?auto_110569 ?auto_110573 ) ) ( not ( = ?auto_110569 ?auto_110574 ) ) ( not ( = ?auto_110569 ?auto_110575 ) ) ( not ( = ?auto_110569 ?auto_110576 ) ) ( not ( = ?auto_110569 ?auto_110577 ) ) ( not ( = ?auto_110569 ?auto_110578 ) ) ( not ( = ?auto_110569 ?auto_110579 ) ) ( not ( = ?auto_110569 ?auto_110580 ) ) ( not ( = ?auto_110570 ?auto_110571 ) ) ( not ( = ?auto_110570 ?auto_110572 ) ) ( not ( = ?auto_110570 ?auto_110573 ) ) ( not ( = ?auto_110570 ?auto_110574 ) ) ( not ( = ?auto_110570 ?auto_110575 ) ) ( not ( = ?auto_110570 ?auto_110576 ) ) ( not ( = ?auto_110570 ?auto_110577 ) ) ( not ( = ?auto_110570 ?auto_110578 ) ) ( not ( = ?auto_110570 ?auto_110579 ) ) ( not ( = ?auto_110570 ?auto_110580 ) ) ( not ( = ?auto_110571 ?auto_110572 ) ) ( not ( = ?auto_110571 ?auto_110573 ) ) ( not ( = ?auto_110571 ?auto_110574 ) ) ( not ( = ?auto_110571 ?auto_110575 ) ) ( not ( = ?auto_110571 ?auto_110576 ) ) ( not ( = ?auto_110571 ?auto_110577 ) ) ( not ( = ?auto_110571 ?auto_110578 ) ) ( not ( = ?auto_110571 ?auto_110579 ) ) ( not ( = ?auto_110571 ?auto_110580 ) ) ( not ( = ?auto_110572 ?auto_110573 ) ) ( not ( = ?auto_110572 ?auto_110574 ) ) ( not ( = ?auto_110572 ?auto_110575 ) ) ( not ( = ?auto_110572 ?auto_110576 ) ) ( not ( = ?auto_110572 ?auto_110577 ) ) ( not ( = ?auto_110572 ?auto_110578 ) ) ( not ( = ?auto_110572 ?auto_110579 ) ) ( not ( = ?auto_110572 ?auto_110580 ) ) ( not ( = ?auto_110573 ?auto_110574 ) ) ( not ( = ?auto_110573 ?auto_110575 ) ) ( not ( = ?auto_110573 ?auto_110576 ) ) ( not ( = ?auto_110573 ?auto_110577 ) ) ( not ( = ?auto_110573 ?auto_110578 ) ) ( not ( = ?auto_110573 ?auto_110579 ) ) ( not ( = ?auto_110573 ?auto_110580 ) ) ( not ( = ?auto_110574 ?auto_110575 ) ) ( not ( = ?auto_110574 ?auto_110576 ) ) ( not ( = ?auto_110574 ?auto_110577 ) ) ( not ( = ?auto_110574 ?auto_110578 ) ) ( not ( = ?auto_110574 ?auto_110579 ) ) ( not ( = ?auto_110574 ?auto_110580 ) ) ( not ( = ?auto_110575 ?auto_110576 ) ) ( not ( = ?auto_110575 ?auto_110577 ) ) ( not ( = ?auto_110575 ?auto_110578 ) ) ( not ( = ?auto_110575 ?auto_110579 ) ) ( not ( = ?auto_110575 ?auto_110580 ) ) ( not ( = ?auto_110576 ?auto_110577 ) ) ( not ( = ?auto_110576 ?auto_110578 ) ) ( not ( = ?auto_110576 ?auto_110579 ) ) ( not ( = ?auto_110576 ?auto_110580 ) ) ( not ( = ?auto_110577 ?auto_110578 ) ) ( not ( = ?auto_110577 ?auto_110579 ) ) ( not ( = ?auto_110577 ?auto_110580 ) ) ( not ( = ?auto_110578 ?auto_110579 ) ) ( not ( = ?auto_110578 ?auto_110580 ) ) ( not ( = ?auto_110579 ?auto_110580 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_110579 ?auto_110580 )
      ( !STACK ?auto_110579 ?auto_110578 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_110592 - BLOCK
      ?auto_110593 - BLOCK
      ?auto_110594 - BLOCK
      ?auto_110595 - BLOCK
      ?auto_110596 - BLOCK
      ?auto_110597 - BLOCK
      ?auto_110598 - BLOCK
      ?auto_110599 - BLOCK
      ?auto_110600 - BLOCK
      ?auto_110601 - BLOCK
      ?auto_110602 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_110601 ) ( ON-TABLE ?auto_110602 ) ( CLEAR ?auto_110602 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_110592 ) ( ON ?auto_110593 ?auto_110592 ) ( ON ?auto_110594 ?auto_110593 ) ( ON ?auto_110595 ?auto_110594 ) ( ON ?auto_110596 ?auto_110595 ) ( ON ?auto_110597 ?auto_110596 ) ( ON ?auto_110598 ?auto_110597 ) ( ON ?auto_110599 ?auto_110598 ) ( ON ?auto_110600 ?auto_110599 ) ( ON ?auto_110601 ?auto_110600 ) ( not ( = ?auto_110592 ?auto_110593 ) ) ( not ( = ?auto_110592 ?auto_110594 ) ) ( not ( = ?auto_110592 ?auto_110595 ) ) ( not ( = ?auto_110592 ?auto_110596 ) ) ( not ( = ?auto_110592 ?auto_110597 ) ) ( not ( = ?auto_110592 ?auto_110598 ) ) ( not ( = ?auto_110592 ?auto_110599 ) ) ( not ( = ?auto_110592 ?auto_110600 ) ) ( not ( = ?auto_110592 ?auto_110601 ) ) ( not ( = ?auto_110592 ?auto_110602 ) ) ( not ( = ?auto_110593 ?auto_110594 ) ) ( not ( = ?auto_110593 ?auto_110595 ) ) ( not ( = ?auto_110593 ?auto_110596 ) ) ( not ( = ?auto_110593 ?auto_110597 ) ) ( not ( = ?auto_110593 ?auto_110598 ) ) ( not ( = ?auto_110593 ?auto_110599 ) ) ( not ( = ?auto_110593 ?auto_110600 ) ) ( not ( = ?auto_110593 ?auto_110601 ) ) ( not ( = ?auto_110593 ?auto_110602 ) ) ( not ( = ?auto_110594 ?auto_110595 ) ) ( not ( = ?auto_110594 ?auto_110596 ) ) ( not ( = ?auto_110594 ?auto_110597 ) ) ( not ( = ?auto_110594 ?auto_110598 ) ) ( not ( = ?auto_110594 ?auto_110599 ) ) ( not ( = ?auto_110594 ?auto_110600 ) ) ( not ( = ?auto_110594 ?auto_110601 ) ) ( not ( = ?auto_110594 ?auto_110602 ) ) ( not ( = ?auto_110595 ?auto_110596 ) ) ( not ( = ?auto_110595 ?auto_110597 ) ) ( not ( = ?auto_110595 ?auto_110598 ) ) ( not ( = ?auto_110595 ?auto_110599 ) ) ( not ( = ?auto_110595 ?auto_110600 ) ) ( not ( = ?auto_110595 ?auto_110601 ) ) ( not ( = ?auto_110595 ?auto_110602 ) ) ( not ( = ?auto_110596 ?auto_110597 ) ) ( not ( = ?auto_110596 ?auto_110598 ) ) ( not ( = ?auto_110596 ?auto_110599 ) ) ( not ( = ?auto_110596 ?auto_110600 ) ) ( not ( = ?auto_110596 ?auto_110601 ) ) ( not ( = ?auto_110596 ?auto_110602 ) ) ( not ( = ?auto_110597 ?auto_110598 ) ) ( not ( = ?auto_110597 ?auto_110599 ) ) ( not ( = ?auto_110597 ?auto_110600 ) ) ( not ( = ?auto_110597 ?auto_110601 ) ) ( not ( = ?auto_110597 ?auto_110602 ) ) ( not ( = ?auto_110598 ?auto_110599 ) ) ( not ( = ?auto_110598 ?auto_110600 ) ) ( not ( = ?auto_110598 ?auto_110601 ) ) ( not ( = ?auto_110598 ?auto_110602 ) ) ( not ( = ?auto_110599 ?auto_110600 ) ) ( not ( = ?auto_110599 ?auto_110601 ) ) ( not ( = ?auto_110599 ?auto_110602 ) ) ( not ( = ?auto_110600 ?auto_110601 ) ) ( not ( = ?auto_110600 ?auto_110602 ) ) ( not ( = ?auto_110601 ?auto_110602 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_110602 )
      ( !STACK ?auto_110602 ?auto_110601 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_110614 - BLOCK
      ?auto_110615 - BLOCK
      ?auto_110616 - BLOCK
      ?auto_110617 - BLOCK
      ?auto_110618 - BLOCK
      ?auto_110619 - BLOCK
      ?auto_110620 - BLOCK
      ?auto_110621 - BLOCK
      ?auto_110622 - BLOCK
      ?auto_110623 - BLOCK
      ?auto_110624 - BLOCK
    )
    :vars
    (
      ?auto_110625 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110624 ?auto_110625 ) ( ON-TABLE ?auto_110614 ) ( ON ?auto_110615 ?auto_110614 ) ( ON ?auto_110616 ?auto_110615 ) ( ON ?auto_110617 ?auto_110616 ) ( ON ?auto_110618 ?auto_110617 ) ( ON ?auto_110619 ?auto_110618 ) ( ON ?auto_110620 ?auto_110619 ) ( ON ?auto_110621 ?auto_110620 ) ( ON ?auto_110622 ?auto_110621 ) ( not ( = ?auto_110614 ?auto_110615 ) ) ( not ( = ?auto_110614 ?auto_110616 ) ) ( not ( = ?auto_110614 ?auto_110617 ) ) ( not ( = ?auto_110614 ?auto_110618 ) ) ( not ( = ?auto_110614 ?auto_110619 ) ) ( not ( = ?auto_110614 ?auto_110620 ) ) ( not ( = ?auto_110614 ?auto_110621 ) ) ( not ( = ?auto_110614 ?auto_110622 ) ) ( not ( = ?auto_110614 ?auto_110623 ) ) ( not ( = ?auto_110614 ?auto_110624 ) ) ( not ( = ?auto_110614 ?auto_110625 ) ) ( not ( = ?auto_110615 ?auto_110616 ) ) ( not ( = ?auto_110615 ?auto_110617 ) ) ( not ( = ?auto_110615 ?auto_110618 ) ) ( not ( = ?auto_110615 ?auto_110619 ) ) ( not ( = ?auto_110615 ?auto_110620 ) ) ( not ( = ?auto_110615 ?auto_110621 ) ) ( not ( = ?auto_110615 ?auto_110622 ) ) ( not ( = ?auto_110615 ?auto_110623 ) ) ( not ( = ?auto_110615 ?auto_110624 ) ) ( not ( = ?auto_110615 ?auto_110625 ) ) ( not ( = ?auto_110616 ?auto_110617 ) ) ( not ( = ?auto_110616 ?auto_110618 ) ) ( not ( = ?auto_110616 ?auto_110619 ) ) ( not ( = ?auto_110616 ?auto_110620 ) ) ( not ( = ?auto_110616 ?auto_110621 ) ) ( not ( = ?auto_110616 ?auto_110622 ) ) ( not ( = ?auto_110616 ?auto_110623 ) ) ( not ( = ?auto_110616 ?auto_110624 ) ) ( not ( = ?auto_110616 ?auto_110625 ) ) ( not ( = ?auto_110617 ?auto_110618 ) ) ( not ( = ?auto_110617 ?auto_110619 ) ) ( not ( = ?auto_110617 ?auto_110620 ) ) ( not ( = ?auto_110617 ?auto_110621 ) ) ( not ( = ?auto_110617 ?auto_110622 ) ) ( not ( = ?auto_110617 ?auto_110623 ) ) ( not ( = ?auto_110617 ?auto_110624 ) ) ( not ( = ?auto_110617 ?auto_110625 ) ) ( not ( = ?auto_110618 ?auto_110619 ) ) ( not ( = ?auto_110618 ?auto_110620 ) ) ( not ( = ?auto_110618 ?auto_110621 ) ) ( not ( = ?auto_110618 ?auto_110622 ) ) ( not ( = ?auto_110618 ?auto_110623 ) ) ( not ( = ?auto_110618 ?auto_110624 ) ) ( not ( = ?auto_110618 ?auto_110625 ) ) ( not ( = ?auto_110619 ?auto_110620 ) ) ( not ( = ?auto_110619 ?auto_110621 ) ) ( not ( = ?auto_110619 ?auto_110622 ) ) ( not ( = ?auto_110619 ?auto_110623 ) ) ( not ( = ?auto_110619 ?auto_110624 ) ) ( not ( = ?auto_110619 ?auto_110625 ) ) ( not ( = ?auto_110620 ?auto_110621 ) ) ( not ( = ?auto_110620 ?auto_110622 ) ) ( not ( = ?auto_110620 ?auto_110623 ) ) ( not ( = ?auto_110620 ?auto_110624 ) ) ( not ( = ?auto_110620 ?auto_110625 ) ) ( not ( = ?auto_110621 ?auto_110622 ) ) ( not ( = ?auto_110621 ?auto_110623 ) ) ( not ( = ?auto_110621 ?auto_110624 ) ) ( not ( = ?auto_110621 ?auto_110625 ) ) ( not ( = ?auto_110622 ?auto_110623 ) ) ( not ( = ?auto_110622 ?auto_110624 ) ) ( not ( = ?auto_110622 ?auto_110625 ) ) ( not ( = ?auto_110623 ?auto_110624 ) ) ( not ( = ?auto_110623 ?auto_110625 ) ) ( not ( = ?auto_110624 ?auto_110625 ) ) ( CLEAR ?auto_110622 ) ( ON ?auto_110623 ?auto_110624 ) ( CLEAR ?auto_110623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_110614 ?auto_110615 ?auto_110616 ?auto_110617 ?auto_110618 ?auto_110619 ?auto_110620 ?auto_110621 ?auto_110622 ?auto_110623 )
      ( MAKE-11PILE ?auto_110614 ?auto_110615 ?auto_110616 ?auto_110617 ?auto_110618 ?auto_110619 ?auto_110620 ?auto_110621 ?auto_110622 ?auto_110623 ?auto_110624 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_110637 - BLOCK
      ?auto_110638 - BLOCK
      ?auto_110639 - BLOCK
      ?auto_110640 - BLOCK
      ?auto_110641 - BLOCK
      ?auto_110642 - BLOCK
      ?auto_110643 - BLOCK
      ?auto_110644 - BLOCK
      ?auto_110645 - BLOCK
      ?auto_110646 - BLOCK
      ?auto_110647 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110647 ) ( ON-TABLE ?auto_110637 ) ( ON ?auto_110638 ?auto_110637 ) ( ON ?auto_110639 ?auto_110638 ) ( ON ?auto_110640 ?auto_110639 ) ( ON ?auto_110641 ?auto_110640 ) ( ON ?auto_110642 ?auto_110641 ) ( ON ?auto_110643 ?auto_110642 ) ( ON ?auto_110644 ?auto_110643 ) ( ON ?auto_110645 ?auto_110644 ) ( not ( = ?auto_110637 ?auto_110638 ) ) ( not ( = ?auto_110637 ?auto_110639 ) ) ( not ( = ?auto_110637 ?auto_110640 ) ) ( not ( = ?auto_110637 ?auto_110641 ) ) ( not ( = ?auto_110637 ?auto_110642 ) ) ( not ( = ?auto_110637 ?auto_110643 ) ) ( not ( = ?auto_110637 ?auto_110644 ) ) ( not ( = ?auto_110637 ?auto_110645 ) ) ( not ( = ?auto_110637 ?auto_110646 ) ) ( not ( = ?auto_110637 ?auto_110647 ) ) ( not ( = ?auto_110638 ?auto_110639 ) ) ( not ( = ?auto_110638 ?auto_110640 ) ) ( not ( = ?auto_110638 ?auto_110641 ) ) ( not ( = ?auto_110638 ?auto_110642 ) ) ( not ( = ?auto_110638 ?auto_110643 ) ) ( not ( = ?auto_110638 ?auto_110644 ) ) ( not ( = ?auto_110638 ?auto_110645 ) ) ( not ( = ?auto_110638 ?auto_110646 ) ) ( not ( = ?auto_110638 ?auto_110647 ) ) ( not ( = ?auto_110639 ?auto_110640 ) ) ( not ( = ?auto_110639 ?auto_110641 ) ) ( not ( = ?auto_110639 ?auto_110642 ) ) ( not ( = ?auto_110639 ?auto_110643 ) ) ( not ( = ?auto_110639 ?auto_110644 ) ) ( not ( = ?auto_110639 ?auto_110645 ) ) ( not ( = ?auto_110639 ?auto_110646 ) ) ( not ( = ?auto_110639 ?auto_110647 ) ) ( not ( = ?auto_110640 ?auto_110641 ) ) ( not ( = ?auto_110640 ?auto_110642 ) ) ( not ( = ?auto_110640 ?auto_110643 ) ) ( not ( = ?auto_110640 ?auto_110644 ) ) ( not ( = ?auto_110640 ?auto_110645 ) ) ( not ( = ?auto_110640 ?auto_110646 ) ) ( not ( = ?auto_110640 ?auto_110647 ) ) ( not ( = ?auto_110641 ?auto_110642 ) ) ( not ( = ?auto_110641 ?auto_110643 ) ) ( not ( = ?auto_110641 ?auto_110644 ) ) ( not ( = ?auto_110641 ?auto_110645 ) ) ( not ( = ?auto_110641 ?auto_110646 ) ) ( not ( = ?auto_110641 ?auto_110647 ) ) ( not ( = ?auto_110642 ?auto_110643 ) ) ( not ( = ?auto_110642 ?auto_110644 ) ) ( not ( = ?auto_110642 ?auto_110645 ) ) ( not ( = ?auto_110642 ?auto_110646 ) ) ( not ( = ?auto_110642 ?auto_110647 ) ) ( not ( = ?auto_110643 ?auto_110644 ) ) ( not ( = ?auto_110643 ?auto_110645 ) ) ( not ( = ?auto_110643 ?auto_110646 ) ) ( not ( = ?auto_110643 ?auto_110647 ) ) ( not ( = ?auto_110644 ?auto_110645 ) ) ( not ( = ?auto_110644 ?auto_110646 ) ) ( not ( = ?auto_110644 ?auto_110647 ) ) ( not ( = ?auto_110645 ?auto_110646 ) ) ( not ( = ?auto_110645 ?auto_110647 ) ) ( not ( = ?auto_110646 ?auto_110647 ) ) ( CLEAR ?auto_110645 ) ( ON ?auto_110646 ?auto_110647 ) ( CLEAR ?auto_110646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_110637 ?auto_110638 ?auto_110639 ?auto_110640 ?auto_110641 ?auto_110642 ?auto_110643 ?auto_110644 ?auto_110645 ?auto_110646 )
      ( MAKE-11PILE ?auto_110637 ?auto_110638 ?auto_110639 ?auto_110640 ?auto_110641 ?auto_110642 ?auto_110643 ?auto_110644 ?auto_110645 ?auto_110646 ?auto_110647 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_110659 - BLOCK
      ?auto_110660 - BLOCK
      ?auto_110661 - BLOCK
      ?auto_110662 - BLOCK
      ?auto_110663 - BLOCK
      ?auto_110664 - BLOCK
      ?auto_110665 - BLOCK
      ?auto_110666 - BLOCK
      ?auto_110667 - BLOCK
      ?auto_110668 - BLOCK
      ?auto_110669 - BLOCK
    )
    :vars
    (
      ?auto_110670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110669 ?auto_110670 ) ( ON-TABLE ?auto_110659 ) ( ON ?auto_110660 ?auto_110659 ) ( ON ?auto_110661 ?auto_110660 ) ( ON ?auto_110662 ?auto_110661 ) ( ON ?auto_110663 ?auto_110662 ) ( ON ?auto_110664 ?auto_110663 ) ( ON ?auto_110665 ?auto_110664 ) ( ON ?auto_110666 ?auto_110665 ) ( not ( = ?auto_110659 ?auto_110660 ) ) ( not ( = ?auto_110659 ?auto_110661 ) ) ( not ( = ?auto_110659 ?auto_110662 ) ) ( not ( = ?auto_110659 ?auto_110663 ) ) ( not ( = ?auto_110659 ?auto_110664 ) ) ( not ( = ?auto_110659 ?auto_110665 ) ) ( not ( = ?auto_110659 ?auto_110666 ) ) ( not ( = ?auto_110659 ?auto_110667 ) ) ( not ( = ?auto_110659 ?auto_110668 ) ) ( not ( = ?auto_110659 ?auto_110669 ) ) ( not ( = ?auto_110659 ?auto_110670 ) ) ( not ( = ?auto_110660 ?auto_110661 ) ) ( not ( = ?auto_110660 ?auto_110662 ) ) ( not ( = ?auto_110660 ?auto_110663 ) ) ( not ( = ?auto_110660 ?auto_110664 ) ) ( not ( = ?auto_110660 ?auto_110665 ) ) ( not ( = ?auto_110660 ?auto_110666 ) ) ( not ( = ?auto_110660 ?auto_110667 ) ) ( not ( = ?auto_110660 ?auto_110668 ) ) ( not ( = ?auto_110660 ?auto_110669 ) ) ( not ( = ?auto_110660 ?auto_110670 ) ) ( not ( = ?auto_110661 ?auto_110662 ) ) ( not ( = ?auto_110661 ?auto_110663 ) ) ( not ( = ?auto_110661 ?auto_110664 ) ) ( not ( = ?auto_110661 ?auto_110665 ) ) ( not ( = ?auto_110661 ?auto_110666 ) ) ( not ( = ?auto_110661 ?auto_110667 ) ) ( not ( = ?auto_110661 ?auto_110668 ) ) ( not ( = ?auto_110661 ?auto_110669 ) ) ( not ( = ?auto_110661 ?auto_110670 ) ) ( not ( = ?auto_110662 ?auto_110663 ) ) ( not ( = ?auto_110662 ?auto_110664 ) ) ( not ( = ?auto_110662 ?auto_110665 ) ) ( not ( = ?auto_110662 ?auto_110666 ) ) ( not ( = ?auto_110662 ?auto_110667 ) ) ( not ( = ?auto_110662 ?auto_110668 ) ) ( not ( = ?auto_110662 ?auto_110669 ) ) ( not ( = ?auto_110662 ?auto_110670 ) ) ( not ( = ?auto_110663 ?auto_110664 ) ) ( not ( = ?auto_110663 ?auto_110665 ) ) ( not ( = ?auto_110663 ?auto_110666 ) ) ( not ( = ?auto_110663 ?auto_110667 ) ) ( not ( = ?auto_110663 ?auto_110668 ) ) ( not ( = ?auto_110663 ?auto_110669 ) ) ( not ( = ?auto_110663 ?auto_110670 ) ) ( not ( = ?auto_110664 ?auto_110665 ) ) ( not ( = ?auto_110664 ?auto_110666 ) ) ( not ( = ?auto_110664 ?auto_110667 ) ) ( not ( = ?auto_110664 ?auto_110668 ) ) ( not ( = ?auto_110664 ?auto_110669 ) ) ( not ( = ?auto_110664 ?auto_110670 ) ) ( not ( = ?auto_110665 ?auto_110666 ) ) ( not ( = ?auto_110665 ?auto_110667 ) ) ( not ( = ?auto_110665 ?auto_110668 ) ) ( not ( = ?auto_110665 ?auto_110669 ) ) ( not ( = ?auto_110665 ?auto_110670 ) ) ( not ( = ?auto_110666 ?auto_110667 ) ) ( not ( = ?auto_110666 ?auto_110668 ) ) ( not ( = ?auto_110666 ?auto_110669 ) ) ( not ( = ?auto_110666 ?auto_110670 ) ) ( not ( = ?auto_110667 ?auto_110668 ) ) ( not ( = ?auto_110667 ?auto_110669 ) ) ( not ( = ?auto_110667 ?auto_110670 ) ) ( not ( = ?auto_110668 ?auto_110669 ) ) ( not ( = ?auto_110668 ?auto_110670 ) ) ( not ( = ?auto_110669 ?auto_110670 ) ) ( ON ?auto_110668 ?auto_110669 ) ( CLEAR ?auto_110666 ) ( ON ?auto_110667 ?auto_110668 ) ( CLEAR ?auto_110667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_110659 ?auto_110660 ?auto_110661 ?auto_110662 ?auto_110663 ?auto_110664 ?auto_110665 ?auto_110666 ?auto_110667 )
      ( MAKE-11PILE ?auto_110659 ?auto_110660 ?auto_110661 ?auto_110662 ?auto_110663 ?auto_110664 ?auto_110665 ?auto_110666 ?auto_110667 ?auto_110668 ?auto_110669 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_110682 - BLOCK
      ?auto_110683 - BLOCK
      ?auto_110684 - BLOCK
      ?auto_110685 - BLOCK
      ?auto_110686 - BLOCK
      ?auto_110687 - BLOCK
      ?auto_110688 - BLOCK
      ?auto_110689 - BLOCK
      ?auto_110690 - BLOCK
      ?auto_110691 - BLOCK
      ?auto_110692 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110692 ) ( ON-TABLE ?auto_110682 ) ( ON ?auto_110683 ?auto_110682 ) ( ON ?auto_110684 ?auto_110683 ) ( ON ?auto_110685 ?auto_110684 ) ( ON ?auto_110686 ?auto_110685 ) ( ON ?auto_110687 ?auto_110686 ) ( ON ?auto_110688 ?auto_110687 ) ( ON ?auto_110689 ?auto_110688 ) ( not ( = ?auto_110682 ?auto_110683 ) ) ( not ( = ?auto_110682 ?auto_110684 ) ) ( not ( = ?auto_110682 ?auto_110685 ) ) ( not ( = ?auto_110682 ?auto_110686 ) ) ( not ( = ?auto_110682 ?auto_110687 ) ) ( not ( = ?auto_110682 ?auto_110688 ) ) ( not ( = ?auto_110682 ?auto_110689 ) ) ( not ( = ?auto_110682 ?auto_110690 ) ) ( not ( = ?auto_110682 ?auto_110691 ) ) ( not ( = ?auto_110682 ?auto_110692 ) ) ( not ( = ?auto_110683 ?auto_110684 ) ) ( not ( = ?auto_110683 ?auto_110685 ) ) ( not ( = ?auto_110683 ?auto_110686 ) ) ( not ( = ?auto_110683 ?auto_110687 ) ) ( not ( = ?auto_110683 ?auto_110688 ) ) ( not ( = ?auto_110683 ?auto_110689 ) ) ( not ( = ?auto_110683 ?auto_110690 ) ) ( not ( = ?auto_110683 ?auto_110691 ) ) ( not ( = ?auto_110683 ?auto_110692 ) ) ( not ( = ?auto_110684 ?auto_110685 ) ) ( not ( = ?auto_110684 ?auto_110686 ) ) ( not ( = ?auto_110684 ?auto_110687 ) ) ( not ( = ?auto_110684 ?auto_110688 ) ) ( not ( = ?auto_110684 ?auto_110689 ) ) ( not ( = ?auto_110684 ?auto_110690 ) ) ( not ( = ?auto_110684 ?auto_110691 ) ) ( not ( = ?auto_110684 ?auto_110692 ) ) ( not ( = ?auto_110685 ?auto_110686 ) ) ( not ( = ?auto_110685 ?auto_110687 ) ) ( not ( = ?auto_110685 ?auto_110688 ) ) ( not ( = ?auto_110685 ?auto_110689 ) ) ( not ( = ?auto_110685 ?auto_110690 ) ) ( not ( = ?auto_110685 ?auto_110691 ) ) ( not ( = ?auto_110685 ?auto_110692 ) ) ( not ( = ?auto_110686 ?auto_110687 ) ) ( not ( = ?auto_110686 ?auto_110688 ) ) ( not ( = ?auto_110686 ?auto_110689 ) ) ( not ( = ?auto_110686 ?auto_110690 ) ) ( not ( = ?auto_110686 ?auto_110691 ) ) ( not ( = ?auto_110686 ?auto_110692 ) ) ( not ( = ?auto_110687 ?auto_110688 ) ) ( not ( = ?auto_110687 ?auto_110689 ) ) ( not ( = ?auto_110687 ?auto_110690 ) ) ( not ( = ?auto_110687 ?auto_110691 ) ) ( not ( = ?auto_110687 ?auto_110692 ) ) ( not ( = ?auto_110688 ?auto_110689 ) ) ( not ( = ?auto_110688 ?auto_110690 ) ) ( not ( = ?auto_110688 ?auto_110691 ) ) ( not ( = ?auto_110688 ?auto_110692 ) ) ( not ( = ?auto_110689 ?auto_110690 ) ) ( not ( = ?auto_110689 ?auto_110691 ) ) ( not ( = ?auto_110689 ?auto_110692 ) ) ( not ( = ?auto_110690 ?auto_110691 ) ) ( not ( = ?auto_110690 ?auto_110692 ) ) ( not ( = ?auto_110691 ?auto_110692 ) ) ( ON ?auto_110691 ?auto_110692 ) ( CLEAR ?auto_110689 ) ( ON ?auto_110690 ?auto_110691 ) ( CLEAR ?auto_110690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_110682 ?auto_110683 ?auto_110684 ?auto_110685 ?auto_110686 ?auto_110687 ?auto_110688 ?auto_110689 ?auto_110690 )
      ( MAKE-11PILE ?auto_110682 ?auto_110683 ?auto_110684 ?auto_110685 ?auto_110686 ?auto_110687 ?auto_110688 ?auto_110689 ?auto_110690 ?auto_110691 ?auto_110692 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_110704 - BLOCK
      ?auto_110705 - BLOCK
      ?auto_110706 - BLOCK
      ?auto_110707 - BLOCK
      ?auto_110708 - BLOCK
      ?auto_110709 - BLOCK
      ?auto_110710 - BLOCK
      ?auto_110711 - BLOCK
      ?auto_110712 - BLOCK
      ?auto_110713 - BLOCK
      ?auto_110714 - BLOCK
    )
    :vars
    (
      ?auto_110715 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110714 ?auto_110715 ) ( ON-TABLE ?auto_110704 ) ( ON ?auto_110705 ?auto_110704 ) ( ON ?auto_110706 ?auto_110705 ) ( ON ?auto_110707 ?auto_110706 ) ( ON ?auto_110708 ?auto_110707 ) ( ON ?auto_110709 ?auto_110708 ) ( ON ?auto_110710 ?auto_110709 ) ( not ( = ?auto_110704 ?auto_110705 ) ) ( not ( = ?auto_110704 ?auto_110706 ) ) ( not ( = ?auto_110704 ?auto_110707 ) ) ( not ( = ?auto_110704 ?auto_110708 ) ) ( not ( = ?auto_110704 ?auto_110709 ) ) ( not ( = ?auto_110704 ?auto_110710 ) ) ( not ( = ?auto_110704 ?auto_110711 ) ) ( not ( = ?auto_110704 ?auto_110712 ) ) ( not ( = ?auto_110704 ?auto_110713 ) ) ( not ( = ?auto_110704 ?auto_110714 ) ) ( not ( = ?auto_110704 ?auto_110715 ) ) ( not ( = ?auto_110705 ?auto_110706 ) ) ( not ( = ?auto_110705 ?auto_110707 ) ) ( not ( = ?auto_110705 ?auto_110708 ) ) ( not ( = ?auto_110705 ?auto_110709 ) ) ( not ( = ?auto_110705 ?auto_110710 ) ) ( not ( = ?auto_110705 ?auto_110711 ) ) ( not ( = ?auto_110705 ?auto_110712 ) ) ( not ( = ?auto_110705 ?auto_110713 ) ) ( not ( = ?auto_110705 ?auto_110714 ) ) ( not ( = ?auto_110705 ?auto_110715 ) ) ( not ( = ?auto_110706 ?auto_110707 ) ) ( not ( = ?auto_110706 ?auto_110708 ) ) ( not ( = ?auto_110706 ?auto_110709 ) ) ( not ( = ?auto_110706 ?auto_110710 ) ) ( not ( = ?auto_110706 ?auto_110711 ) ) ( not ( = ?auto_110706 ?auto_110712 ) ) ( not ( = ?auto_110706 ?auto_110713 ) ) ( not ( = ?auto_110706 ?auto_110714 ) ) ( not ( = ?auto_110706 ?auto_110715 ) ) ( not ( = ?auto_110707 ?auto_110708 ) ) ( not ( = ?auto_110707 ?auto_110709 ) ) ( not ( = ?auto_110707 ?auto_110710 ) ) ( not ( = ?auto_110707 ?auto_110711 ) ) ( not ( = ?auto_110707 ?auto_110712 ) ) ( not ( = ?auto_110707 ?auto_110713 ) ) ( not ( = ?auto_110707 ?auto_110714 ) ) ( not ( = ?auto_110707 ?auto_110715 ) ) ( not ( = ?auto_110708 ?auto_110709 ) ) ( not ( = ?auto_110708 ?auto_110710 ) ) ( not ( = ?auto_110708 ?auto_110711 ) ) ( not ( = ?auto_110708 ?auto_110712 ) ) ( not ( = ?auto_110708 ?auto_110713 ) ) ( not ( = ?auto_110708 ?auto_110714 ) ) ( not ( = ?auto_110708 ?auto_110715 ) ) ( not ( = ?auto_110709 ?auto_110710 ) ) ( not ( = ?auto_110709 ?auto_110711 ) ) ( not ( = ?auto_110709 ?auto_110712 ) ) ( not ( = ?auto_110709 ?auto_110713 ) ) ( not ( = ?auto_110709 ?auto_110714 ) ) ( not ( = ?auto_110709 ?auto_110715 ) ) ( not ( = ?auto_110710 ?auto_110711 ) ) ( not ( = ?auto_110710 ?auto_110712 ) ) ( not ( = ?auto_110710 ?auto_110713 ) ) ( not ( = ?auto_110710 ?auto_110714 ) ) ( not ( = ?auto_110710 ?auto_110715 ) ) ( not ( = ?auto_110711 ?auto_110712 ) ) ( not ( = ?auto_110711 ?auto_110713 ) ) ( not ( = ?auto_110711 ?auto_110714 ) ) ( not ( = ?auto_110711 ?auto_110715 ) ) ( not ( = ?auto_110712 ?auto_110713 ) ) ( not ( = ?auto_110712 ?auto_110714 ) ) ( not ( = ?auto_110712 ?auto_110715 ) ) ( not ( = ?auto_110713 ?auto_110714 ) ) ( not ( = ?auto_110713 ?auto_110715 ) ) ( not ( = ?auto_110714 ?auto_110715 ) ) ( ON ?auto_110713 ?auto_110714 ) ( ON ?auto_110712 ?auto_110713 ) ( CLEAR ?auto_110710 ) ( ON ?auto_110711 ?auto_110712 ) ( CLEAR ?auto_110711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_110704 ?auto_110705 ?auto_110706 ?auto_110707 ?auto_110708 ?auto_110709 ?auto_110710 ?auto_110711 )
      ( MAKE-11PILE ?auto_110704 ?auto_110705 ?auto_110706 ?auto_110707 ?auto_110708 ?auto_110709 ?auto_110710 ?auto_110711 ?auto_110712 ?auto_110713 ?auto_110714 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_110727 - BLOCK
      ?auto_110728 - BLOCK
      ?auto_110729 - BLOCK
      ?auto_110730 - BLOCK
      ?auto_110731 - BLOCK
      ?auto_110732 - BLOCK
      ?auto_110733 - BLOCK
      ?auto_110734 - BLOCK
      ?auto_110735 - BLOCK
      ?auto_110736 - BLOCK
      ?auto_110737 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110737 ) ( ON-TABLE ?auto_110727 ) ( ON ?auto_110728 ?auto_110727 ) ( ON ?auto_110729 ?auto_110728 ) ( ON ?auto_110730 ?auto_110729 ) ( ON ?auto_110731 ?auto_110730 ) ( ON ?auto_110732 ?auto_110731 ) ( ON ?auto_110733 ?auto_110732 ) ( not ( = ?auto_110727 ?auto_110728 ) ) ( not ( = ?auto_110727 ?auto_110729 ) ) ( not ( = ?auto_110727 ?auto_110730 ) ) ( not ( = ?auto_110727 ?auto_110731 ) ) ( not ( = ?auto_110727 ?auto_110732 ) ) ( not ( = ?auto_110727 ?auto_110733 ) ) ( not ( = ?auto_110727 ?auto_110734 ) ) ( not ( = ?auto_110727 ?auto_110735 ) ) ( not ( = ?auto_110727 ?auto_110736 ) ) ( not ( = ?auto_110727 ?auto_110737 ) ) ( not ( = ?auto_110728 ?auto_110729 ) ) ( not ( = ?auto_110728 ?auto_110730 ) ) ( not ( = ?auto_110728 ?auto_110731 ) ) ( not ( = ?auto_110728 ?auto_110732 ) ) ( not ( = ?auto_110728 ?auto_110733 ) ) ( not ( = ?auto_110728 ?auto_110734 ) ) ( not ( = ?auto_110728 ?auto_110735 ) ) ( not ( = ?auto_110728 ?auto_110736 ) ) ( not ( = ?auto_110728 ?auto_110737 ) ) ( not ( = ?auto_110729 ?auto_110730 ) ) ( not ( = ?auto_110729 ?auto_110731 ) ) ( not ( = ?auto_110729 ?auto_110732 ) ) ( not ( = ?auto_110729 ?auto_110733 ) ) ( not ( = ?auto_110729 ?auto_110734 ) ) ( not ( = ?auto_110729 ?auto_110735 ) ) ( not ( = ?auto_110729 ?auto_110736 ) ) ( not ( = ?auto_110729 ?auto_110737 ) ) ( not ( = ?auto_110730 ?auto_110731 ) ) ( not ( = ?auto_110730 ?auto_110732 ) ) ( not ( = ?auto_110730 ?auto_110733 ) ) ( not ( = ?auto_110730 ?auto_110734 ) ) ( not ( = ?auto_110730 ?auto_110735 ) ) ( not ( = ?auto_110730 ?auto_110736 ) ) ( not ( = ?auto_110730 ?auto_110737 ) ) ( not ( = ?auto_110731 ?auto_110732 ) ) ( not ( = ?auto_110731 ?auto_110733 ) ) ( not ( = ?auto_110731 ?auto_110734 ) ) ( not ( = ?auto_110731 ?auto_110735 ) ) ( not ( = ?auto_110731 ?auto_110736 ) ) ( not ( = ?auto_110731 ?auto_110737 ) ) ( not ( = ?auto_110732 ?auto_110733 ) ) ( not ( = ?auto_110732 ?auto_110734 ) ) ( not ( = ?auto_110732 ?auto_110735 ) ) ( not ( = ?auto_110732 ?auto_110736 ) ) ( not ( = ?auto_110732 ?auto_110737 ) ) ( not ( = ?auto_110733 ?auto_110734 ) ) ( not ( = ?auto_110733 ?auto_110735 ) ) ( not ( = ?auto_110733 ?auto_110736 ) ) ( not ( = ?auto_110733 ?auto_110737 ) ) ( not ( = ?auto_110734 ?auto_110735 ) ) ( not ( = ?auto_110734 ?auto_110736 ) ) ( not ( = ?auto_110734 ?auto_110737 ) ) ( not ( = ?auto_110735 ?auto_110736 ) ) ( not ( = ?auto_110735 ?auto_110737 ) ) ( not ( = ?auto_110736 ?auto_110737 ) ) ( ON ?auto_110736 ?auto_110737 ) ( ON ?auto_110735 ?auto_110736 ) ( CLEAR ?auto_110733 ) ( ON ?auto_110734 ?auto_110735 ) ( CLEAR ?auto_110734 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_110727 ?auto_110728 ?auto_110729 ?auto_110730 ?auto_110731 ?auto_110732 ?auto_110733 ?auto_110734 )
      ( MAKE-11PILE ?auto_110727 ?auto_110728 ?auto_110729 ?auto_110730 ?auto_110731 ?auto_110732 ?auto_110733 ?auto_110734 ?auto_110735 ?auto_110736 ?auto_110737 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_110749 - BLOCK
      ?auto_110750 - BLOCK
      ?auto_110751 - BLOCK
      ?auto_110752 - BLOCK
      ?auto_110753 - BLOCK
      ?auto_110754 - BLOCK
      ?auto_110755 - BLOCK
      ?auto_110756 - BLOCK
      ?auto_110757 - BLOCK
      ?auto_110758 - BLOCK
      ?auto_110759 - BLOCK
    )
    :vars
    (
      ?auto_110760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110759 ?auto_110760 ) ( ON-TABLE ?auto_110749 ) ( ON ?auto_110750 ?auto_110749 ) ( ON ?auto_110751 ?auto_110750 ) ( ON ?auto_110752 ?auto_110751 ) ( ON ?auto_110753 ?auto_110752 ) ( ON ?auto_110754 ?auto_110753 ) ( not ( = ?auto_110749 ?auto_110750 ) ) ( not ( = ?auto_110749 ?auto_110751 ) ) ( not ( = ?auto_110749 ?auto_110752 ) ) ( not ( = ?auto_110749 ?auto_110753 ) ) ( not ( = ?auto_110749 ?auto_110754 ) ) ( not ( = ?auto_110749 ?auto_110755 ) ) ( not ( = ?auto_110749 ?auto_110756 ) ) ( not ( = ?auto_110749 ?auto_110757 ) ) ( not ( = ?auto_110749 ?auto_110758 ) ) ( not ( = ?auto_110749 ?auto_110759 ) ) ( not ( = ?auto_110749 ?auto_110760 ) ) ( not ( = ?auto_110750 ?auto_110751 ) ) ( not ( = ?auto_110750 ?auto_110752 ) ) ( not ( = ?auto_110750 ?auto_110753 ) ) ( not ( = ?auto_110750 ?auto_110754 ) ) ( not ( = ?auto_110750 ?auto_110755 ) ) ( not ( = ?auto_110750 ?auto_110756 ) ) ( not ( = ?auto_110750 ?auto_110757 ) ) ( not ( = ?auto_110750 ?auto_110758 ) ) ( not ( = ?auto_110750 ?auto_110759 ) ) ( not ( = ?auto_110750 ?auto_110760 ) ) ( not ( = ?auto_110751 ?auto_110752 ) ) ( not ( = ?auto_110751 ?auto_110753 ) ) ( not ( = ?auto_110751 ?auto_110754 ) ) ( not ( = ?auto_110751 ?auto_110755 ) ) ( not ( = ?auto_110751 ?auto_110756 ) ) ( not ( = ?auto_110751 ?auto_110757 ) ) ( not ( = ?auto_110751 ?auto_110758 ) ) ( not ( = ?auto_110751 ?auto_110759 ) ) ( not ( = ?auto_110751 ?auto_110760 ) ) ( not ( = ?auto_110752 ?auto_110753 ) ) ( not ( = ?auto_110752 ?auto_110754 ) ) ( not ( = ?auto_110752 ?auto_110755 ) ) ( not ( = ?auto_110752 ?auto_110756 ) ) ( not ( = ?auto_110752 ?auto_110757 ) ) ( not ( = ?auto_110752 ?auto_110758 ) ) ( not ( = ?auto_110752 ?auto_110759 ) ) ( not ( = ?auto_110752 ?auto_110760 ) ) ( not ( = ?auto_110753 ?auto_110754 ) ) ( not ( = ?auto_110753 ?auto_110755 ) ) ( not ( = ?auto_110753 ?auto_110756 ) ) ( not ( = ?auto_110753 ?auto_110757 ) ) ( not ( = ?auto_110753 ?auto_110758 ) ) ( not ( = ?auto_110753 ?auto_110759 ) ) ( not ( = ?auto_110753 ?auto_110760 ) ) ( not ( = ?auto_110754 ?auto_110755 ) ) ( not ( = ?auto_110754 ?auto_110756 ) ) ( not ( = ?auto_110754 ?auto_110757 ) ) ( not ( = ?auto_110754 ?auto_110758 ) ) ( not ( = ?auto_110754 ?auto_110759 ) ) ( not ( = ?auto_110754 ?auto_110760 ) ) ( not ( = ?auto_110755 ?auto_110756 ) ) ( not ( = ?auto_110755 ?auto_110757 ) ) ( not ( = ?auto_110755 ?auto_110758 ) ) ( not ( = ?auto_110755 ?auto_110759 ) ) ( not ( = ?auto_110755 ?auto_110760 ) ) ( not ( = ?auto_110756 ?auto_110757 ) ) ( not ( = ?auto_110756 ?auto_110758 ) ) ( not ( = ?auto_110756 ?auto_110759 ) ) ( not ( = ?auto_110756 ?auto_110760 ) ) ( not ( = ?auto_110757 ?auto_110758 ) ) ( not ( = ?auto_110757 ?auto_110759 ) ) ( not ( = ?auto_110757 ?auto_110760 ) ) ( not ( = ?auto_110758 ?auto_110759 ) ) ( not ( = ?auto_110758 ?auto_110760 ) ) ( not ( = ?auto_110759 ?auto_110760 ) ) ( ON ?auto_110758 ?auto_110759 ) ( ON ?auto_110757 ?auto_110758 ) ( ON ?auto_110756 ?auto_110757 ) ( CLEAR ?auto_110754 ) ( ON ?auto_110755 ?auto_110756 ) ( CLEAR ?auto_110755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_110749 ?auto_110750 ?auto_110751 ?auto_110752 ?auto_110753 ?auto_110754 ?auto_110755 )
      ( MAKE-11PILE ?auto_110749 ?auto_110750 ?auto_110751 ?auto_110752 ?auto_110753 ?auto_110754 ?auto_110755 ?auto_110756 ?auto_110757 ?auto_110758 ?auto_110759 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_110772 - BLOCK
      ?auto_110773 - BLOCK
      ?auto_110774 - BLOCK
      ?auto_110775 - BLOCK
      ?auto_110776 - BLOCK
      ?auto_110777 - BLOCK
      ?auto_110778 - BLOCK
      ?auto_110779 - BLOCK
      ?auto_110780 - BLOCK
      ?auto_110781 - BLOCK
      ?auto_110782 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110782 ) ( ON-TABLE ?auto_110772 ) ( ON ?auto_110773 ?auto_110772 ) ( ON ?auto_110774 ?auto_110773 ) ( ON ?auto_110775 ?auto_110774 ) ( ON ?auto_110776 ?auto_110775 ) ( ON ?auto_110777 ?auto_110776 ) ( not ( = ?auto_110772 ?auto_110773 ) ) ( not ( = ?auto_110772 ?auto_110774 ) ) ( not ( = ?auto_110772 ?auto_110775 ) ) ( not ( = ?auto_110772 ?auto_110776 ) ) ( not ( = ?auto_110772 ?auto_110777 ) ) ( not ( = ?auto_110772 ?auto_110778 ) ) ( not ( = ?auto_110772 ?auto_110779 ) ) ( not ( = ?auto_110772 ?auto_110780 ) ) ( not ( = ?auto_110772 ?auto_110781 ) ) ( not ( = ?auto_110772 ?auto_110782 ) ) ( not ( = ?auto_110773 ?auto_110774 ) ) ( not ( = ?auto_110773 ?auto_110775 ) ) ( not ( = ?auto_110773 ?auto_110776 ) ) ( not ( = ?auto_110773 ?auto_110777 ) ) ( not ( = ?auto_110773 ?auto_110778 ) ) ( not ( = ?auto_110773 ?auto_110779 ) ) ( not ( = ?auto_110773 ?auto_110780 ) ) ( not ( = ?auto_110773 ?auto_110781 ) ) ( not ( = ?auto_110773 ?auto_110782 ) ) ( not ( = ?auto_110774 ?auto_110775 ) ) ( not ( = ?auto_110774 ?auto_110776 ) ) ( not ( = ?auto_110774 ?auto_110777 ) ) ( not ( = ?auto_110774 ?auto_110778 ) ) ( not ( = ?auto_110774 ?auto_110779 ) ) ( not ( = ?auto_110774 ?auto_110780 ) ) ( not ( = ?auto_110774 ?auto_110781 ) ) ( not ( = ?auto_110774 ?auto_110782 ) ) ( not ( = ?auto_110775 ?auto_110776 ) ) ( not ( = ?auto_110775 ?auto_110777 ) ) ( not ( = ?auto_110775 ?auto_110778 ) ) ( not ( = ?auto_110775 ?auto_110779 ) ) ( not ( = ?auto_110775 ?auto_110780 ) ) ( not ( = ?auto_110775 ?auto_110781 ) ) ( not ( = ?auto_110775 ?auto_110782 ) ) ( not ( = ?auto_110776 ?auto_110777 ) ) ( not ( = ?auto_110776 ?auto_110778 ) ) ( not ( = ?auto_110776 ?auto_110779 ) ) ( not ( = ?auto_110776 ?auto_110780 ) ) ( not ( = ?auto_110776 ?auto_110781 ) ) ( not ( = ?auto_110776 ?auto_110782 ) ) ( not ( = ?auto_110777 ?auto_110778 ) ) ( not ( = ?auto_110777 ?auto_110779 ) ) ( not ( = ?auto_110777 ?auto_110780 ) ) ( not ( = ?auto_110777 ?auto_110781 ) ) ( not ( = ?auto_110777 ?auto_110782 ) ) ( not ( = ?auto_110778 ?auto_110779 ) ) ( not ( = ?auto_110778 ?auto_110780 ) ) ( not ( = ?auto_110778 ?auto_110781 ) ) ( not ( = ?auto_110778 ?auto_110782 ) ) ( not ( = ?auto_110779 ?auto_110780 ) ) ( not ( = ?auto_110779 ?auto_110781 ) ) ( not ( = ?auto_110779 ?auto_110782 ) ) ( not ( = ?auto_110780 ?auto_110781 ) ) ( not ( = ?auto_110780 ?auto_110782 ) ) ( not ( = ?auto_110781 ?auto_110782 ) ) ( ON ?auto_110781 ?auto_110782 ) ( ON ?auto_110780 ?auto_110781 ) ( ON ?auto_110779 ?auto_110780 ) ( CLEAR ?auto_110777 ) ( ON ?auto_110778 ?auto_110779 ) ( CLEAR ?auto_110778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_110772 ?auto_110773 ?auto_110774 ?auto_110775 ?auto_110776 ?auto_110777 ?auto_110778 )
      ( MAKE-11PILE ?auto_110772 ?auto_110773 ?auto_110774 ?auto_110775 ?auto_110776 ?auto_110777 ?auto_110778 ?auto_110779 ?auto_110780 ?auto_110781 ?auto_110782 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_110794 - BLOCK
      ?auto_110795 - BLOCK
      ?auto_110796 - BLOCK
      ?auto_110797 - BLOCK
      ?auto_110798 - BLOCK
      ?auto_110799 - BLOCK
      ?auto_110800 - BLOCK
      ?auto_110801 - BLOCK
      ?auto_110802 - BLOCK
      ?auto_110803 - BLOCK
      ?auto_110804 - BLOCK
    )
    :vars
    (
      ?auto_110805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110804 ?auto_110805 ) ( ON-TABLE ?auto_110794 ) ( ON ?auto_110795 ?auto_110794 ) ( ON ?auto_110796 ?auto_110795 ) ( ON ?auto_110797 ?auto_110796 ) ( ON ?auto_110798 ?auto_110797 ) ( not ( = ?auto_110794 ?auto_110795 ) ) ( not ( = ?auto_110794 ?auto_110796 ) ) ( not ( = ?auto_110794 ?auto_110797 ) ) ( not ( = ?auto_110794 ?auto_110798 ) ) ( not ( = ?auto_110794 ?auto_110799 ) ) ( not ( = ?auto_110794 ?auto_110800 ) ) ( not ( = ?auto_110794 ?auto_110801 ) ) ( not ( = ?auto_110794 ?auto_110802 ) ) ( not ( = ?auto_110794 ?auto_110803 ) ) ( not ( = ?auto_110794 ?auto_110804 ) ) ( not ( = ?auto_110794 ?auto_110805 ) ) ( not ( = ?auto_110795 ?auto_110796 ) ) ( not ( = ?auto_110795 ?auto_110797 ) ) ( not ( = ?auto_110795 ?auto_110798 ) ) ( not ( = ?auto_110795 ?auto_110799 ) ) ( not ( = ?auto_110795 ?auto_110800 ) ) ( not ( = ?auto_110795 ?auto_110801 ) ) ( not ( = ?auto_110795 ?auto_110802 ) ) ( not ( = ?auto_110795 ?auto_110803 ) ) ( not ( = ?auto_110795 ?auto_110804 ) ) ( not ( = ?auto_110795 ?auto_110805 ) ) ( not ( = ?auto_110796 ?auto_110797 ) ) ( not ( = ?auto_110796 ?auto_110798 ) ) ( not ( = ?auto_110796 ?auto_110799 ) ) ( not ( = ?auto_110796 ?auto_110800 ) ) ( not ( = ?auto_110796 ?auto_110801 ) ) ( not ( = ?auto_110796 ?auto_110802 ) ) ( not ( = ?auto_110796 ?auto_110803 ) ) ( not ( = ?auto_110796 ?auto_110804 ) ) ( not ( = ?auto_110796 ?auto_110805 ) ) ( not ( = ?auto_110797 ?auto_110798 ) ) ( not ( = ?auto_110797 ?auto_110799 ) ) ( not ( = ?auto_110797 ?auto_110800 ) ) ( not ( = ?auto_110797 ?auto_110801 ) ) ( not ( = ?auto_110797 ?auto_110802 ) ) ( not ( = ?auto_110797 ?auto_110803 ) ) ( not ( = ?auto_110797 ?auto_110804 ) ) ( not ( = ?auto_110797 ?auto_110805 ) ) ( not ( = ?auto_110798 ?auto_110799 ) ) ( not ( = ?auto_110798 ?auto_110800 ) ) ( not ( = ?auto_110798 ?auto_110801 ) ) ( not ( = ?auto_110798 ?auto_110802 ) ) ( not ( = ?auto_110798 ?auto_110803 ) ) ( not ( = ?auto_110798 ?auto_110804 ) ) ( not ( = ?auto_110798 ?auto_110805 ) ) ( not ( = ?auto_110799 ?auto_110800 ) ) ( not ( = ?auto_110799 ?auto_110801 ) ) ( not ( = ?auto_110799 ?auto_110802 ) ) ( not ( = ?auto_110799 ?auto_110803 ) ) ( not ( = ?auto_110799 ?auto_110804 ) ) ( not ( = ?auto_110799 ?auto_110805 ) ) ( not ( = ?auto_110800 ?auto_110801 ) ) ( not ( = ?auto_110800 ?auto_110802 ) ) ( not ( = ?auto_110800 ?auto_110803 ) ) ( not ( = ?auto_110800 ?auto_110804 ) ) ( not ( = ?auto_110800 ?auto_110805 ) ) ( not ( = ?auto_110801 ?auto_110802 ) ) ( not ( = ?auto_110801 ?auto_110803 ) ) ( not ( = ?auto_110801 ?auto_110804 ) ) ( not ( = ?auto_110801 ?auto_110805 ) ) ( not ( = ?auto_110802 ?auto_110803 ) ) ( not ( = ?auto_110802 ?auto_110804 ) ) ( not ( = ?auto_110802 ?auto_110805 ) ) ( not ( = ?auto_110803 ?auto_110804 ) ) ( not ( = ?auto_110803 ?auto_110805 ) ) ( not ( = ?auto_110804 ?auto_110805 ) ) ( ON ?auto_110803 ?auto_110804 ) ( ON ?auto_110802 ?auto_110803 ) ( ON ?auto_110801 ?auto_110802 ) ( ON ?auto_110800 ?auto_110801 ) ( CLEAR ?auto_110798 ) ( ON ?auto_110799 ?auto_110800 ) ( CLEAR ?auto_110799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_110794 ?auto_110795 ?auto_110796 ?auto_110797 ?auto_110798 ?auto_110799 )
      ( MAKE-11PILE ?auto_110794 ?auto_110795 ?auto_110796 ?auto_110797 ?auto_110798 ?auto_110799 ?auto_110800 ?auto_110801 ?auto_110802 ?auto_110803 ?auto_110804 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_110817 - BLOCK
      ?auto_110818 - BLOCK
      ?auto_110819 - BLOCK
      ?auto_110820 - BLOCK
      ?auto_110821 - BLOCK
      ?auto_110822 - BLOCK
      ?auto_110823 - BLOCK
      ?auto_110824 - BLOCK
      ?auto_110825 - BLOCK
      ?auto_110826 - BLOCK
      ?auto_110827 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110827 ) ( ON-TABLE ?auto_110817 ) ( ON ?auto_110818 ?auto_110817 ) ( ON ?auto_110819 ?auto_110818 ) ( ON ?auto_110820 ?auto_110819 ) ( ON ?auto_110821 ?auto_110820 ) ( not ( = ?auto_110817 ?auto_110818 ) ) ( not ( = ?auto_110817 ?auto_110819 ) ) ( not ( = ?auto_110817 ?auto_110820 ) ) ( not ( = ?auto_110817 ?auto_110821 ) ) ( not ( = ?auto_110817 ?auto_110822 ) ) ( not ( = ?auto_110817 ?auto_110823 ) ) ( not ( = ?auto_110817 ?auto_110824 ) ) ( not ( = ?auto_110817 ?auto_110825 ) ) ( not ( = ?auto_110817 ?auto_110826 ) ) ( not ( = ?auto_110817 ?auto_110827 ) ) ( not ( = ?auto_110818 ?auto_110819 ) ) ( not ( = ?auto_110818 ?auto_110820 ) ) ( not ( = ?auto_110818 ?auto_110821 ) ) ( not ( = ?auto_110818 ?auto_110822 ) ) ( not ( = ?auto_110818 ?auto_110823 ) ) ( not ( = ?auto_110818 ?auto_110824 ) ) ( not ( = ?auto_110818 ?auto_110825 ) ) ( not ( = ?auto_110818 ?auto_110826 ) ) ( not ( = ?auto_110818 ?auto_110827 ) ) ( not ( = ?auto_110819 ?auto_110820 ) ) ( not ( = ?auto_110819 ?auto_110821 ) ) ( not ( = ?auto_110819 ?auto_110822 ) ) ( not ( = ?auto_110819 ?auto_110823 ) ) ( not ( = ?auto_110819 ?auto_110824 ) ) ( not ( = ?auto_110819 ?auto_110825 ) ) ( not ( = ?auto_110819 ?auto_110826 ) ) ( not ( = ?auto_110819 ?auto_110827 ) ) ( not ( = ?auto_110820 ?auto_110821 ) ) ( not ( = ?auto_110820 ?auto_110822 ) ) ( not ( = ?auto_110820 ?auto_110823 ) ) ( not ( = ?auto_110820 ?auto_110824 ) ) ( not ( = ?auto_110820 ?auto_110825 ) ) ( not ( = ?auto_110820 ?auto_110826 ) ) ( not ( = ?auto_110820 ?auto_110827 ) ) ( not ( = ?auto_110821 ?auto_110822 ) ) ( not ( = ?auto_110821 ?auto_110823 ) ) ( not ( = ?auto_110821 ?auto_110824 ) ) ( not ( = ?auto_110821 ?auto_110825 ) ) ( not ( = ?auto_110821 ?auto_110826 ) ) ( not ( = ?auto_110821 ?auto_110827 ) ) ( not ( = ?auto_110822 ?auto_110823 ) ) ( not ( = ?auto_110822 ?auto_110824 ) ) ( not ( = ?auto_110822 ?auto_110825 ) ) ( not ( = ?auto_110822 ?auto_110826 ) ) ( not ( = ?auto_110822 ?auto_110827 ) ) ( not ( = ?auto_110823 ?auto_110824 ) ) ( not ( = ?auto_110823 ?auto_110825 ) ) ( not ( = ?auto_110823 ?auto_110826 ) ) ( not ( = ?auto_110823 ?auto_110827 ) ) ( not ( = ?auto_110824 ?auto_110825 ) ) ( not ( = ?auto_110824 ?auto_110826 ) ) ( not ( = ?auto_110824 ?auto_110827 ) ) ( not ( = ?auto_110825 ?auto_110826 ) ) ( not ( = ?auto_110825 ?auto_110827 ) ) ( not ( = ?auto_110826 ?auto_110827 ) ) ( ON ?auto_110826 ?auto_110827 ) ( ON ?auto_110825 ?auto_110826 ) ( ON ?auto_110824 ?auto_110825 ) ( ON ?auto_110823 ?auto_110824 ) ( CLEAR ?auto_110821 ) ( ON ?auto_110822 ?auto_110823 ) ( CLEAR ?auto_110822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_110817 ?auto_110818 ?auto_110819 ?auto_110820 ?auto_110821 ?auto_110822 )
      ( MAKE-11PILE ?auto_110817 ?auto_110818 ?auto_110819 ?auto_110820 ?auto_110821 ?auto_110822 ?auto_110823 ?auto_110824 ?auto_110825 ?auto_110826 ?auto_110827 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_110839 - BLOCK
      ?auto_110840 - BLOCK
      ?auto_110841 - BLOCK
      ?auto_110842 - BLOCK
      ?auto_110843 - BLOCK
      ?auto_110844 - BLOCK
      ?auto_110845 - BLOCK
      ?auto_110846 - BLOCK
      ?auto_110847 - BLOCK
      ?auto_110848 - BLOCK
      ?auto_110849 - BLOCK
    )
    :vars
    (
      ?auto_110850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110849 ?auto_110850 ) ( ON-TABLE ?auto_110839 ) ( ON ?auto_110840 ?auto_110839 ) ( ON ?auto_110841 ?auto_110840 ) ( ON ?auto_110842 ?auto_110841 ) ( not ( = ?auto_110839 ?auto_110840 ) ) ( not ( = ?auto_110839 ?auto_110841 ) ) ( not ( = ?auto_110839 ?auto_110842 ) ) ( not ( = ?auto_110839 ?auto_110843 ) ) ( not ( = ?auto_110839 ?auto_110844 ) ) ( not ( = ?auto_110839 ?auto_110845 ) ) ( not ( = ?auto_110839 ?auto_110846 ) ) ( not ( = ?auto_110839 ?auto_110847 ) ) ( not ( = ?auto_110839 ?auto_110848 ) ) ( not ( = ?auto_110839 ?auto_110849 ) ) ( not ( = ?auto_110839 ?auto_110850 ) ) ( not ( = ?auto_110840 ?auto_110841 ) ) ( not ( = ?auto_110840 ?auto_110842 ) ) ( not ( = ?auto_110840 ?auto_110843 ) ) ( not ( = ?auto_110840 ?auto_110844 ) ) ( not ( = ?auto_110840 ?auto_110845 ) ) ( not ( = ?auto_110840 ?auto_110846 ) ) ( not ( = ?auto_110840 ?auto_110847 ) ) ( not ( = ?auto_110840 ?auto_110848 ) ) ( not ( = ?auto_110840 ?auto_110849 ) ) ( not ( = ?auto_110840 ?auto_110850 ) ) ( not ( = ?auto_110841 ?auto_110842 ) ) ( not ( = ?auto_110841 ?auto_110843 ) ) ( not ( = ?auto_110841 ?auto_110844 ) ) ( not ( = ?auto_110841 ?auto_110845 ) ) ( not ( = ?auto_110841 ?auto_110846 ) ) ( not ( = ?auto_110841 ?auto_110847 ) ) ( not ( = ?auto_110841 ?auto_110848 ) ) ( not ( = ?auto_110841 ?auto_110849 ) ) ( not ( = ?auto_110841 ?auto_110850 ) ) ( not ( = ?auto_110842 ?auto_110843 ) ) ( not ( = ?auto_110842 ?auto_110844 ) ) ( not ( = ?auto_110842 ?auto_110845 ) ) ( not ( = ?auto_110842 ?auto_110846 ) ) ( not ( = ?auto_110842 ?auto_110847 ) ) ( not ( = ?auto_110842 ?auto_110848 ) ) ( not ( = ?auto_110842 ?auto_110849 ) ) ( not ( = ?auto_110842 ?auto_110850 ) ) ( not ( = ?auto_110843 ?auto_110844 ) ) ( not ( = ?auto_110843 ?auto_110845 ) ) ( not ( = ?auto_110843 ?auto_110846 ) ) ( not ( = ?auto_110843 ?auto_110847 ) ) ( not ( = ?auto_110843 ?auto_110848 ) ) ( not ( = ?auto_110843 ?auto_110849 ) ) ( not ( = ?auto_110843 ?auto_110850 ) ) ( not ( = ?auto_110844 ?auto_110845 ) ) ( not ( = ?auto_110844 ?auto_110846 ) ) ( not ( = ?auto_110844 ?auto_110847 ) ) ( not ( = ?auto_110844 ?auto_110848 ) ) ( not ( = ?auto_110844 ?auto_110849 ) ) ( not ( = ?auto_110844 ?auto_110850 ) ) ( not ( = ?auto_110845 ?auto_110846 ) ) ( not ( = ?auto_110845 ?auto_110847 ) ) ( not ( = ?auto_110845 ?auto_110848 ) ) ( not ( = ?auto_110845 ?auto_110849 ) ) ( not ( = ?auto_110845 ?auto_110850 ) ) ( not ( = ?auto_110846 ?auto_110847 ) ) ( not ( = ?auto_110846 ?auto_110848 ) ) ( not ( = ?auto_110846 ?auto_110849 ) ) ( not ( = ?auto_110846 ?auto_110850 ) ) ( not ( = ?auto_110847 ?auto_110848 ) ) ( not ( = ?auto_110847 ?auto_110849 ) ) ( not ( = ?auto_110847 ?auto_110850 ) ) ( not ( = ?auto_110848 ?auto_110849 ) ) ( not ( = ?auto_110848 ?auto_110850 ) ) ( not ( = ?auto_110849 ?auto_110850 ) ) ( ON ?auto_110848 ?auto_110849 ) ( ON ?auto_110847 ?auto_110848 ) ( ON ?auto_110846 ?auto_110847 ) ( ON ?auto_110845 ?auto_110846 ) ( ON ?auto_110844 ?auto_110845 ) ( CLEAR ?auto_110842 ) ( ON ?auto_110843 ?auto_110844 ) ( CLEAR ?auto_110843 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_110839 ?auto_110840 ?auto_110841 ?auto_110842 ?auto_110843 )
      ( MAKE-11PILE ?auto_110839 ?auto_110840 ?auto_110841 ?auto_110842 ?auto_110843 ?auto_110844 ?auto_110845 ?auto_110846 ?auto_110847 ?auto_110848 ?auto_110849 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_110862 - BLOCK
      ?auto_110863 - BLOCK
      ?auto_110864 - BLOCK
      ?auto_110865 - BLOCK
      ?auto_110866 - BLOCK
      ?auto_110867 - BLOCK
      ?auto_110868 - BLOCK
      ?auto_110869 - BLOCK
      ?auto_110870 - BLOCK
      ?auto_110871 - BLOCK
      ?auto_110872 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110872 ) ( ON-TABLE ?auto_110862 ) ( ON ?auto_110863 ?auto_110862 ) ( ON ?auto_110864 ?auto_110863 ) ( ON ?auto_110865 ?auto_110864 ) ( not ( = ?auto_110862 ?auto_110863 ) ) ( not ( = ?auto_110862 ?auto_110864 ) ) ( not ( = ?auto_110862 ?auto_110865 ) ) ( not ( = ?auto_110862 ?auto_110866 ) ) ( not ( = ?auto_110862 ?auto_110867 ) ) ( not ( = ?auto_110862 ?auto_110868 ) ) ( not ( = ?auto_110862 ?auto_110869 ) ) ( not ( = ?auto_110862 ?auto_110870 ) ) ( not ( = ?auto_110862 ?auto_110871 ) ) ( not ( = ?auto_110862 ?auto_110872 ) ) ( not ( = ?auto_110863 ?auto_110864 ) ) ( not ( = ?auto_110863 ?auto_110865 ) ) ( not ( = ?auto_110863 ?auto_110866 ) ) ( not ( = ?auto_110863 ?auto_110867 ) ) ( not ( = ?auto_110863 ?auto_110868 ) ) ( not ( = ?auto_110863 ?auto_110869 ) ) ( not ( = ?auto_110863 ?auto_110870 ) ) ( not ( = ?auto_110863 ?auto_110871 ) ) ( not ( = ?auto_110863 ?auto_110872 ) ) ( not ( = ?auto_110864 ?auto_110865 ) ) ( not ( = ?auto_110864 ?auto_110866 ) ) ( not ( = ?auto_110864 ?auto_110867 ) ) ( not ( = ?auto_110864 ?auto_110868 ) ) ( not ( = ?auto_110864 ?auto_110869 ) ) ( not ( = ?auto_110864 ?auto_110870 ) ) ( not ( = ?auto_110864 ?auto_110871 ) ) ( not ( = ?auto_110864 ?auto_110872 ) ) ( not ( = ?auto_110865 ?auto_110866 ) ) ( not ( = ?auto_110865 ?auto_110867 ) ) ( not ( = ?auto_110865 ?auto_110868 ) ) ( not ( = ?auto_110865 ?auto_110869 ) ) ( not ( = ?auto_110865 ?auto_110870 ) ) ( not ( = ?auto_110865 ?auto_110871 ) ) ( not ( = ?auto_110865 ?auto_110872 ) ) ( not ( = ?auto_110866 ?auto_110867 ) ) ( not ( = ?auto_110866 ?auto_110868 ) ) ( not ( = ?auto_110866 ?auto_110869 ) ) ( not ( = ?auto_110866 ?auto_110870 ) ) ( not ( = ?auto_110866 ?auto_110871 ) ) ( not ( = ?auto_110866 ?auto_110872 ) ) ( not ( = ?auto_110867 ?auto_110868 ) ) ( not ( = ?auto_110867 ?auto_110869 ) ) ( not ( = ?auto_110867 ?auto_110870 ) ) ( not ( = ?auto_110867 ?auto_110871 ) ) ( not ( = ?auto_110867 ?auto_110872 ) ) ( not ( = ?auto_110868 ?auto_110869 ) ) ( not ( = ?auto_110868 ?auto_110870 ) ) ( not ( = ?auto_110868 ?auto_110871 ) ) ( not ( = ?auto_110868 ?auto_110872 ) ) ( not ( = ?auto_110869 ?auto_110870 ) ) ( not ( = ?auto_110869 ?auto_110871 ) ) ( not ( = ?auto_110869 ?auto_110872 ) ) ( not ( = ?auto_110870 ?auto_110871 ) ) ( not ( = ?auto_110870 ?auto_110872 ) ) ( not ( = ?auto_110871 ?auto_110872 ) ) ( ON ?auto_110871 ?auto_110872 ) ( ON ?auto_110870 ?auto_110871 ) ( ON ?auto_110869 ?auto_110870 ) ( ON ?auto_110868 ?auto_110869 ) ( ON ?auto_110867 ?auto_110868 ) ( CLEAR ?auto_110865 ) ( ON ?auto_110866 ?auto_110867 ) ( CLEAR ?auto_110866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_110862 ?auto_110863 ?auto_110864 ?auto_110865 ?auto_110866 )
      ( MAKE-11PILE ?auto_110862 ?auto_110863 ?auto_110864 ?auto_110865 ?auto_110866 ?auto_110867 ?auto_110868 ?auto_110869 ?auto_110870 ?auto_110871 ?auto_110872 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_110884 - BLOCK
      ?auto_110885 - BLOCK
      ?auto_110886 - BLOCK
      ?auto_110887 - BLOCK
      ?auto_110888 - BLOCK
      ?auto_110889 - BLOCK
      ?auto_110890 - BLOCK
      ?auto_110891 - BLOCK
      ?auto_110892 - BLOCK
      ?auto_110893 - BLOCK
      ?auto_110894 - BLOCK
    )
    :vars
    (
      ?auto_110895 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110894 ?auto_110895 ) ( ON-TABLE ?auto_110884 ) ( ON ?auto_110885 ?auto_110884 ) ( ON ?auto_110886 ?auto_110885 ) ( not ( = ?auto_110884 ?auto_110885 ) ) ( not ( = ?auto_110884 ?auto_110886 ) ) ( not ( = ?auto_110884 ?auto_110887 ) ) ( not ( = ?auto_110884 ?auto_110888 ) ) ( not ( = ?auto_110884 ?auto_110889 ) ) ( not ( = ?auto_110884 ?auto_110890 ) ) ( not ( = ?auto_110884 ?auto_110891 ) ) ( not ( = ?auto_110884 ?auto_110892 ) ) ( not ( = ?auto_110884 ?auto_110893 ) ) ( not ( = ?auto_110884 ?auto_110894 ) ) ( not ( = ?auto_110884 ?auto_110895 ) ) ( not ( = ?auto_110885 ?auto_110886 ) ) ( not ( = ?auto_110885 ?auto_110887 ) ) ( not ( = ?auto_110885 ?auto_110888 ) ) ( not ( = ?auto_110885 ?auto_110889 ) ) ( not ( = ?auto_110885 ?auto_110890 ) ) ( not ( = ?auto_110885 ?auto_110891 ) ) ( not ( = ?auto_110885 ?auto_110892 ) ) ( not ( = ?auto_110885 ?auto_110893 ) ) ( not ( = ?auto_110885 ?auto_110894 ) ) ( not ( = ?auto_110885 ?auto_110895 ) ) ( not ( = ?auto_110886 ?auto_110887 ) ) ( not ( = ?auto_110886 ?auto_110888 ) ) ( not ( = ?auto_110886 ?auto_110889 ) ) ( not ( = ?auto_110886 ?auto_110890 ) ) ( not ( = ?auto_110886 ?auto_110891 ) ) ( not ( = ?auto_110886 ?auto_110892 ) ) ( not ( = ?auto_110886 ?auto_110893 ) ) ( not ( = ?auto_110886 ?auto_110894 ) ) ( not ( = ?auto_110886 ?auto_110895 ) ) ( not ( = ?auto_110887 ?auto_110888 ) ) ( not ( = ?auto_110887 ?auto_110889 ) ) ( not ( = ?auto_110887 ?auto_110890 ) ) ( not ( = ?auto_110887 ?auto_110891 ) ) ( not ( = ?auto_110887 ?auto_110892 ) ) ( not ( = ?auto_110887 ?auto_110893 ) ) ( not ( = ?auto_110887 ?auto_110894 ) ) ( not ( = ?auto_110887 ?auto_110895 ) ) ( not ( = ?auto_110888 ?auto_110889 ) ) ( not ( = ?auto_110888 ?auto_110890 ) ) ( not ( = ?auto_110888 ?auto_110891 ) ) ( not ( = ?auto_110888 ?auto_110892 ) ) ( not ( = ?auto_110888 ?auto_110893 ) ) ( not ( = ?auto_110888 ?auto_110894 ) ) ( not ( = ?auto_110888 ?auto_110895 ) ) ( not ( = ?auto_110889 ?auto_110890 ) ) ( not ( = ?auto_110889 ?auto_110891 ) ) ( not ( = ?auto_110889 ?auto_110892 ) ) ( not ( = ?auto_110889 ?auto_110893 ) ) ( not ( = ?auto_110889 ?auto_110894 ) ) ( not ( = ?auto_110889 ?auto_110895 ) ) ( not ( = ?auto_110890 ?auto_110891 ) ) ( not ( = ?auto_110890 ?auto_110892 ) ) ( not ( = ?auto_110890 ?auto_110893 ) ) ( not ( = ?auto_110890 ?auto_110894 ) ) ( not ( = ?auto_110890 ?auto_110895 ) ) ( not ( = ?auto_110891 ?auto_110892 ) ) ( not ( = ?auto_110891 ?auto_110893 ) ) ( not ( = ?auto_110891 ?auto_110894 ) ) ( not ( = ?auto_110891 ?auto_110895 ) ) ( not ( = ?auto_110892 ?auto_110893 ) ) ( not ( = ?auto_110892 ?auto_110894 ) ) ( not ( = ?auto_110892 ?auto_110895 ) ) ( not ( = ?auto_110893 ?auto_110894 ) ) ( not ( = ?auto_110893 ?auto_110895 ) ) ( not ( = ?auto_110894 ?auto_110895 ) ) ( ON ?auto_110893 ?auto_110894 ) ( ON ?auto_110892 ?auto_110893 ) ( ON ?auto_110891 ?auto_110892 ) ( ON ?auto_110890 ?auto_110891 ) ( ON ?auto_110889 ?auto_110890 ) ( ON ?auto_110888 ?auto_110889 ) ( CLEAR ?auto_110886 ) ( ON ?auto_110887 ?auto_110888 ) ( CLEAR ?auto_110887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_110884 ?auto_110885 ?auto_110886 ?auto_110887 )
      ( MAKE-11PILE ?auto_110884 ?auto_110885 ?auto_110886 ?auto_110887 ?auto_110888 ?auto_110889 ?auto_110890 ?auto_110891 ?auto_110892 ?auto_110893 ?auto_110894 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_110907 - BLOCK
      ?auto_110908 - BLOCK
      ?auto_110909 - BLOCK
      ?auto_110910 - BLOCK
      ?auto_110911 - BLOCK
      ?auto_110912 - BLOCK
      ?auto_110913 - BLOCK
      ?auto_110914 - BLOCK
      ?auto_110915 - BLOCK
      ?auto_110916 - BLOCK
      ?auto_110917 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110917 ) ( ON-TABLE ?auto_110907 ) ( ON ?auto_110908 ?auto_110907 ) ( ON ?auto_110909 ?auto_110908 ) ( not ( = ?auto_110907 ?auto_110908 ) ) ( not ( = ?auto_110907 ?auto_110909 ) ) ( not ( = ?auto_110907 ?auto_110910 ) ) ( not ( = ?auto_110907 ?auto_110911 ) ) ( not ( = ?auto_110907 ?auto_110912 ) ) ( not ( = ?auto_110907 ?auto_110913 ) ) ( not ( = ?auto_110907 ?auto_110914 ) ) ( not ( = ?auto_110907 ?auto_110915 ) ) ( not ( = ?auto_110907 ?auto_110916 ) ) ( not ( = ?auto_110907 ?auto_110917 ) ) ( not ( = ?auto_110908 ?auto_110909 ) ) ( not ( = ?auto_110908 ?auto_110910 ) ) ( not ( = ?auto_110908 ?auto_110911 ) ) ( not ( = ?auto_110908 ?auto_110912 ) ) ( not ( = ?auto_110908 ?auto_110913 ) ) ( not ( = ?auto_110908 ?auto_110914 ) ) ( not ( = ?auto_110908 ?auto_110915 ) ) ( not ( = ?auto_110908 ?auto_110916 ) ) ( not ( = ?auto_110908 ?auto_110917 ) ) ( not ( = ?auto_110909 ?auto_110910 ) ) ( not ( = ?auto_110909 ?auto_110911 ) ) ( not ( = ?auto_110909 ?auto_110912 ) ) ( not ( = ?auto_110909 ?auto_110913 ) ) ( not ( = ?auto_110909 ?auto_110914 ) ) ( not ( = ?auto_110909 ?auto_110915 ) ) ( not ( = ?auto_110909 ?auto_110916 ) ) ( not ( = ?auto_110909 ?auto_110917 ) ) ( not ( = ?auto_110910 ?auto_110911 ) ) ( not ( = ?auto_110910 ?auto_110912 ) ) ( not ( = ?auto_110910 ?auto_110913 ) ) ( not ( = ?auto_110910 ?auto_110914 ) ) ( not ( = ?auto_110910 ?auto_110915 ) ) ( not ( = ?auto_110910 ?auto_110916 ) ) ( not ( = ?auto_110910 ?auto_110917 ) ) ( not ( = ?auto_110911 ?auto_110912 ) ) ( not ( = ?auto_110911 ?auto_110913 ) ) ( not ( = ?auto_110911 ?auto_110914 ) ) ( not ( = ?auto_110911 ?auto_110915 ) ) ( not ( = ?auto_110911 ?auto_110916 ) ) ( not ( = ?auto_110911 ?auto_110917 ) ) ( not ( = ?auto_110912 ?auto_110913 ) ) ( not ( = ?auto_110912 ?auto_110914 ) ) ( not ( = ?auto_110912 ?auto_110915 ) ) ( not ( = ?auto_110912 ?auto_110916 ) ) ( not ( = ?auto_110912 ?auto_110917 ) ) ( not ( = ?auto_110913 ?auto_110914 ) ) ( not ( = ?auto_110913 ?auto_110915 ) ) ( not ( = ?auto_110913 ?auto_110916 ) ) ( not ( = ?auto_110913 ?auto_110917 ) ) ( not ( = ?auto_110914 ?auto_110915 ) ) ( not ( = ?auto_110914 ?auto_110916 ) ) ( not ( = ?auto_110914 ?auto_110917 ) ) ( not ( = ?auto_110915 ?auto_110916 ) ) ( not ( = ?auto_110915 ?auto_110917 ) ) ( not ( = ?auto_110916 ?auto_110917 ) ) ( ON ?auto_110916 ?auto_110917 ) ( ON ?auto_110915 ?auto_110916 ) ( ON ?auto_110914 ?auto_110915 ) ( ON ?auto_110913 ?auto_110914 ) ( ON ?auto_110912 ?auto_110913 ) ( ON ?auto_110911 ?auto_110912 ) ( CLEAR ?auto_110909 ) ( ON ?auto_110910 ?auto_110911 ) ( CLEAR ?auto_110910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_110907 ?auto_110908 ?auto_110909 ?auto_110910 )
      ( MAKE-11PILE ?auto_110907 ?auto_110908 ?auto_110909 ?auto_110910 ?auto_110911 ?auto_110912 ?auto_110913 ?auto_110914 ?auto_110915 ?auto_110916 ?auto_110917 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_110929 - BLOCK
      ?auto_110930 - BLOCK
      ?auto_110931 - BLOCK
      ?auto_110932 - BLOCK
      ?auto_110933 - BLOCK
      ?auto_110934 - BLOCK
      ?auto_110935 - BLOCK
      ?auto_110936 - BLOCK
      ?auto_110937 - BLOCK
      ?auto_110938 - BLOCK
      ?auto_110939 - BLOCK
    )
    :vars
    (
      ?auto_110940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110939 ?auto_110940 ) ( ON-TABLE ?auto_110929 ) ( ON ?auto_110930 ?auto_110929 ) ( not ( = ?auto_110929 ?auto_110930 ) ) ( not ( = ?auto_110929 ?auto_110931 ) ) ( not ( = ?auto_110929 ?auto_110932 ) ) ( not ( = ?auto_110929 ?auto_110933 ) ) ( not ( = ?auto_110929 ?auto_110934 ) ) ( not ( = ?auto_110929 ?auto_110935 ) ) ( not ( = ?auto_110929 ?auto_110936 ) ) ( not ( = ?auto_110929 ?auto_110937 ) ) ( not ( = ?auto_110929 ?auto_110938 ) ) ( not ( = ?auto_110929 ?auto_110939 ) ) ( not ( = ?auto_110929 ?auto_110940 ) ) ( not ( = ?auto_110930 ?auto_110931 ) ) ( not ( = ?auto_110930 ?auto_110932 ) ) ( not ( = ?auto_110930 ?auto_110933 ) ) ( not ( = ?auto_110930 ?auto_110934 ) ) ( not ( = ?auto_110930 ?auto_110935 ) ) ( not ( = ?auto_110930 ?auto_110936 ) ) ( not ( = ?auto_110930 ?auto_110937 ) ) ( not ( = ?auto_110930 ?auto_110938 ) ) ( not ( = ?auto_110930 ?auto_110939 ) ) ( not ( = ?auto_110930 ?auto_110940 ) ) ( not ( = ?auto_110931 ?auto_110932 ) ) ( not ( = ?auto_110931 ?auto_110933 ) ) ( not ( = ?auto_110931 ?auto_110934 ) ) ( not ( = ?auto_110931 ?auto_110935 ) ) ( not ( = ?auto_110931 ?auto_110936 ) ) ( not ( = ?auto_110931 ?auto_110937 ) ) ( not ( = ?auto_110931 ?auto_110938 ) ) ( not ( = ?auto_110931 ?auto_110939 ) ) ( not ( = ?auto_110931 ?auto_110940 ) ) ( not ( = ?auto_110932 ?auto_110933 ) ) ( not ( = ?auto_110932 ?auto_110934 ) ) ( not ( = ?auto_110932 ?auto_110935 ) ) ( not ( = ?auto_110932 ?auto_110936 ) ) ( not ( = ?auto_110932 ?auto_110937 ) ) ( not ( = ?auto_110932 ?auto_110938 ) ) ( not ( = ?auto_110932 ?auto_110939 ) ) ( not ( = ?auto_110932 ?auto_110940 ) ) ( not ( = ?auto_110933 ?auto_110934 ) ) ( not ( = ?auto_110933 ?auto_110935 ) ) ( not ( = ?auto_110933 ?auto_110936 ) ) ( not ( = ?auto_110933 ?auto_110937 ) ) ( not ( = ?auto_110933 ?auto_110938 ) ) ( not ( = ?auto_110933 ?auto_110939 ) ) ( not ( = ?auto_110933 ?auto_110940 ) ) ( not ( = ?auto_110934 ?auto_110935 ) ) ( not ( = ?auto_110934 ?auto_110936 ) ) ( not ( = ?auto_110934 ?auto_110937 ) ) ( not ( = ?auto_110934 ?auto_110938 ) ) ( not ( = ?auto_110934 ?auto_110939 ) ) ( not ( = ?auto_110934 ?auto_110940 ) ) ( not ( = ?auto_110935 ?auto_110936 ) ) ( not ( = ?auto_110935 ?auto_110937 ) ) ( not ( = ?auto_110935 ?auto_110938 ) ) ( not ( = ?auto_110935 ?auto_110939 ) ) ( not ( = ?auto_110935 ?auto_110940 ) ) ( not ( = ?auto_110936 ?auto_110937 ) ) ( not ( = ?auto_110936 ?auto_110938 ) ) ( not ( = ?auto_110936 ?auto_110939 ) ) ( not ( = ?auto_110936 ?auto_110940 ) ) ( not ( = ?auto_110937 ?auto_110938 ) ) ( not ( = ?auto_110937 ?auto_110939 ) ) ( not ( = ?auto_110937 ?auto_110940 ) ) ( not ( = ?auto_110938 ?auto_110939 ) ) ( not ( = ?auto_110938 ?auto_110940 ) ) ( not ( = ?auto_110939 ?auto_110940 ) ) ( ON ?auto_110938 ?auto_110939 ) ( ON ?auto_110937 ?auto_110938 ) ( ON ?auto_110936 ?auto_110937 ) ( ON ?auto_110935 ?auto_110936 ) ( ON ?auto_110934 ?auto_110935 ) ( ON ?auto_110933 ?auto_110934 ) ( ON ?auto_110932 ?auto_110933 ) ( CLEAR ?auto_110930 ) ( ON ?auto_110931 ?auto_110932 ) ( CLEAR ?auto_110931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_110929 ?auto_110930 ?auto_110931 )
      ( MAKE-11PILE ?auto_110929 ?auto_110930 ?auto_110931 ?auto_110932 ?auto_110933 ?auto_110934 ?auto_110935 ?auto_110936 ?auto_110937 ?auto_110938 ?auto_110939 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_110952 - BLOCK
      ?auto_110953 - BLOCK
      ?auto_110954 - BLOCK
      ?auto_110955 - BLOCK
      ?auto_110956 - BLOCK
      ?auto_110957 - BLOCK
      ?auto_110958 - BLOCK
      ?auto_110959 - BLOCK
      ?auto_110960 - BLOCK
      ?auto_110961 - BLOCK
      ?auto_110962 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110962 ) ( ON-TABLE ?auto_110952 ) ( ON ?auto_110953 ?auto_110952 ) ( not ( = ?auto_110952 ?auto_110953 ) ) ( not ( = ?auto_110952 ?auto_110954 ) ) ( not ( = ?auto_110952 ?auto_110955 ) ) ( not ( = ?auto_110952 ?auto_110956 ) ) ( not ( = ?auto_110952 ?auto_110957 ) ) ( not ( = ?auto_110952 ?auto_110958 ) ) ( not ( = ?auto_110952 ?auto_110959 ) ) ( not ( = ?auto_110952 ?auto_110960 ) ) ( not ( = ?auto_110952 ?auto_110961 ) ) ( not ( = ?auto_110952 ?auto_110962 ) ) ( not ( = ?auto_110953 ?auto_110954 ) ) ( not ( = ?auto_110953 ?auto_110955 ) ) ( not ( = ?auto_110953 ?auto_110956 ) ) ( not ( = ?auto_110953 ?auto_110957 ) ) ( not ( = ?auto_110953 ?auto_110958 ) ) ( not ( = ?auto_110953 ?auto_110959 ) ) ( not ( = ?auto_110953 ?auto_110960 ) ) ( not ( = ?auto_110953 ?auto_110961 ) ) ( not ( = ?auto_110953 ?auto_110962 ) ) ( not ( = ?auto_110954 ?auto_110955 ) ) ( not ( = ?auto_110954 ?auto_110956 ) ) ( not ( = ?auto_110954 ?auto_110957 ) ) ( not ( = ?auto_110954 ?auto_110958 ) ) ( not ( = ?auto_110954 ?auto_110959 ) ) ( not ( = ?auto_110954 ?auto_110960 ) ) ( not ( = ?auto_110954 ?auto_110961 ) ) ( not ( = ?auto_110954 ?auto_110962 ) ) ( not ( = ?auto_110955 ?auto_110956 ) ) ( not ( = ?auto_110955 ?auto_110957 ) ) ( not ( = ?auto_110955 ?auto_110958 ) ) ( not ( = ?auto_110955 ?auto_110959 ) ) ( not ( = ?auto_110955 ?auto_110960 ) ) ( not ( = ?auto_110955 ?auto_110961 ) ) ( not ( = ?auto_110955 ?auto_110962 ) ) ( not ( = ?auto_110956 ?auto_110957 ) ) ( not ( = ?auto_110956 ?auto_110958 ) ) ( not ( = ?auto_110956 ?auto_110959 ) ) ( not ( = ?auto_110956 ?auto_110960 ) ) ( not ( = ?auto_110956 ?auto_110961 ) ) ( not ( = ?auto_110956 ?auto_110962 ) ) ( not ( = ?auto_110957 ?auto_110958 ) ) ( not ( = ?auto_110957 ?auto_110959 ) ) ( not ( = ?auto_110957 ?auto_110960 ) ) ( not ( = ?auto_110957 ?auto_110961 ) ) ( not ( = ?auto_110957 ?auto_110962 ) ) ( not ( = ?auto_110958 ?auto_110959 ) ) ( not ( = ?auto_110958 ?auto_110960 ) ) ( not ( = ?auto_110958 ?auto_110961 ) ) ( not ( = ?auto_110958 ?auto_110962 ) ) ( not ( = ?auto_110959 ?auto_110960 ) ) ( not ( = ?auto_110959 ?auto_110961 ) ) ( not ( = ?auto_110959 ?auto_110962 ) ) ( not ( = ?auto_110960 ?auto_110961 ) ) ( not ( = ?auto_110960 ?auto_110962 ) ) ( not ( = ?auto_110961 ?auto_110962 ) ) ( ON ?auto_110961 ?auto_110962 ) ( ON ?auto_110960 ?auto_110961 ) ( ON ?auto_110959 ?auto_110960 ) ( ON ?auto_110958 ?auto_110959 ) ( ON ?auto_110957 ?auto_110958 ) ( ON ?auto_110956 ?auto_110957 ) ( ON ?auto_110955 ?auto_110956 ) ( CLEAR ?auto_110953 ) ( ON ?auto_110954 ?auto_110955 ) ( CLEAR ?auto_110954 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_110952 ?auto_110953 ?auto_110954 )
      ( MAKE-11PILE ?auto_110952 ?auto_110953 ?auto_110954 ?auto_110955 ?auto_110956 ?auto_110957 ?auto_110958 ?auto_110959 ?auto_110960 ?auto_110961 ?auto_110962 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_110974 - BLOCK
      ?auto_110975 - BLOCK
      ?auto_110976 - BLOCK
      ?auto_110977 - BLOCK
      ?auto_110978 - BLOCK
      ?auto_110979 - BLOCK
      ?auto_110980 - BLOCK
      ?auto_110981 - BLOCK
      ?auto_110982 - BLOCK
      ?auto_110983 - BLOCK
      ?auto_110984 - BLOCK
    )
    :vars
    (
      ?auto_110985 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110984 ?auto_110985 ) ( ON-TABLE ?auto_110974 ) ( not ( = ?auto_110974 ?auto_110975 ) ) ( not ( = ?auto_110974 ?auto_110976 ) ) ( not ( = ?auto_110974 ?auto_110977 ) ) ( not ( = ?auto_110974 ?auto_110978 ) ) ( not ( = ?auto_110974 ?auto_110979 ) ) ( not ( = ?auto_110974 ?auto_110980 ) ) ( not ( = ?auto_110974 ?auto_110981 ) ) ( not ( = ?auto_110974 ?auto_110982 ) ) ( not ( = ?auto_110974 ?auto_110983 ) ) ( not ( = ?auto_110974 ?auto_110984 ) ) ( not ( = ?auto_110974 ?auto_110985 ) ) ( not ( = ?auto_110975 ?auto_110976 ) ) ( not ( = ?auto_110975 ?auto_110977 ) ) ( not ( = ?auto_110975 ?auto_110978 ) ) ( not ( = ?auto_110975 ?auto_110979 ) ) ( not ( = ?auto_110975 ?auto_110980 ) ) ( not ( = ?auto_110975 ?auto_110981 ) ) ( not ( = ?auto_110975 ?auto_110982 ) ) ( not ( = ?auto_110975 ?auto_110983 ) ) ( not ( = ?auto_110975 ?auto_110984 ) ) ( not ( = ?auto_110975 ?auto_110985 ) ) ( not ( = ?auto_110976 ?auto_110977 ) ) ( not ( = ?auto_110976 ?auto_110978 ) ) ( not ( = ?auto_110976 ?auto_110979 ) ) ( not ( = ?auto_110976 ?auto_110980 ) ) ( not ( = ?auto_110976 ?auto_110981 ) ) ( not ( = ?auto_110976 ?auto_110982 ) ) ( not ( = ?auto_110976 ?auto_110983 ) ) ( not ( = ?auto_110976 ?auto_110984 ) ) ( not ( = ?auto_110976 ?auto_110985 ) ) ( not ( = ?auto_110977 ?auto_110978 ) ) ( not ( = ?auto_110977 ?auto_110979 ) ) ( not ( = ?auto_110977 ?auto_110980 ) ) ( not ( = ?auto_110977 ?auto_110981 ) ) ( not ( = ?auto_110977 ?auto_110982 ) ) ( not ( = ?auto_110977 ?auto_110983 ) ) ( not ( = ?auto_110977 ?auto_110984 ) ) ( not ( = ?auto_110977 ?auto_110985 ) ) ( not ( = ?auto_110978 ?auto_110979 ) ) ( not ( = ?auto_110978 ?auto_110980 ) ) ( not ( = ?auto_110978 ?auto_110981 ) ) ( not ( = ?auto_110978 ?auto_110982 ) ) ( not ( = ?auto_110978 ?auto_110983 ) ) ( not ( = ?auto_110978 ?auto_110984 ) ) ( not ( = ?auto_110978 ?auto_110985 ) ) ( not ( = ?auto_110979 ?auto_110980 ) ) ( not ( = ?auto_110979 ?auto_110981 ) ) ( not ( = ?auto_110979 ?auto_110982 ) ) ( not ( = ?auto_110979 ?auto_110983 ) ) ( not ( = ?auto_110979 ?auto_110984 ) ) ( not ( = ?auto_110979 ?auto_110985 ) ) ( not ( = ?auto_110980 ?auto_110981 ) ) ( not ( = ?auto_110980 ?auto_110982 ) ) ( not ( = ?auto_110980 ?auto_110983 ) ) ( not ( = ?auto_110980 ?auto_110984 ) ) ( not ( = ?auto_110980 ?auto_110985 ) ) ( not ( = ?auto_110981 ?auto_110982 ) ) ( not ( = ?auto_110981 ?auto_110983 ) ) ( not ( = ?auto_110981 ?auto_110984 ) ) ( not ( = ?auto_110981 ?auto_110985 ) ) ( not ( = ?auto_110982 ?auto_110983 ) ) ( not ( = ?auto_110982 ?auto_110984 ) ) ( not ( = ?auto_110982 ?auto_110985 ) ) ( not ( = ?auto_110983 ?auto_110984 ) ) ( not ( = ?auto_110983 ?auto_110985 ) ) ( not ( = ?auto_110984 ?auto_110985 ) ) ( ON ?auto_110983 ?auto_110984 ) ( ON ?auto_110982 ?auto_110983 ) ( ON ?auto_110981 ?auto_110982 ) ( ON ?auto_110980 ?auto_110981 ) ( ON ?auto_110979 ?auto_110980 ) ( ON ?auto_110978 ?auto_110979 ) ( ON ?auto_110977 ?auto_110978 ) ( ON ?auto_110976 ?auto_110977 ) ( CLEAR ?auto_110974 ) ( ON ?auto_110975 ?auto_110976 ) ( CLEAR ?auto_110975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_110974 ?auto_110975 )
      ( MAKE-11PILE ?auto_110974 ?auto_110975 ?auto_110976 ?auto_110977 ?auto_110978 ?auto_110979 ?auto_110980 ?auto_110981 ?auto_110982 ?auto_110983 ?auto_110984 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_110997 - BLOCK
      ?auto_110998 - BLOCK
      ?auto_110999 - BLOCK
      ?auto_111000 - BLOCK
      ?auto_111001 - BLOCK
      ?auto_111002 - BLOCK
      ?auto_111003 - BLOCK
      ?auto_111004 - BLOCK
      ?auto_111005 - BLOCK
      ?auto_111006 - BLOCK
      ?auto_111007 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111007 ) ( ON-TABLE ?auto_110997 ) ( not ( = ?auto_110997 ?auto_110998 ) ) ( not ( = ?auto_110997 ?auto_110999 ) ) ( not ( = ?auto_110997 ?auto_111000 ) ) ( not ( = ?auto_110997 ?auto_111001 ) ) ( not ( = ?auto_110997 ?auto_111002 ) ) ( not ( = ?auto_110997 ?auto_111003 ) ) ( not ( = ?auto_110997 ?auto_111004 ) ) ( not ( = ?auto_110997 ?auto_111005 ) ) ( not ( = ?auto_110997 ?auto_111006 ) ) ( not ( = ?auto_110997 ?auto_111007 ) ) ( not ( = ?auto_110998 ?auto_110999 ) ) ( not ( = ?auto_110998 ?auto_111000 ) ) ( not ( = ?auto_110998 ?auto_111001 ) ) ( not ( = ?auto_110998 ?auto_111002 ) ) ( not ( = ?auto_110998 ?auto_111003 ) ) ( not ( = ?auto_110998 ?auto_111004 ) ) ( not ( = ?auto_110998 ?auto_111005 ) ) ( not ( = ?auto_110998 ?auto_111006 ) ) ( not ( = ?auto_110998 ?auto_111007 ) ) ( not ( = ?auto_110999 ?auto_111000 ) ) ( not ( = ?auto_110999 ?auto_111001 ) ) ( not ( = ?auto_110999 ?auto_111002 ) ) ( not ( = ?auto_110999 ?auto_111003 ) ) ( not ( = ?auto_110999 ?auto_111004 ) ) ( not ( = ?auto_110999 ?auto_111005 ) ) ( not ( = ?auto_110999 ?auto_111006 ) ) ( not ( = ?auto_110999 ?auto_111007 ) ) ( not ( = ?auto_111000 ?auto_111001 ) ) ( not ( = ?auto_111000 ?auto_111002 ) ) ( not ( = ?auto_111000 ?auto_111003 ) ) ( not ( = ?auto_111000 ?auto_111004 ) ) ( not ( = ?auto_111000 ?auto_111005 ) ) ( not ( = ?auto_111000 ?auto_111006 ) ) ( not ( = ?auto_111000 ?auto_111007 ) ) ( not ( = ?auto_111001 ?auto_111002 ) ) ( not ( = ?auto_111001 ?auto_111003 ) ) ( not ( = ?auto_111001 ?auto_111004 ) ) ( not ( = ?auto_111001 ?auto_111005 ) ) ( not ( = ?auto_111001 ?auto_111006 ) ) ( not ( = ?auto_111001 ?auto_111007 ) ) ( not ( = ?auto_111002 ?auto_111003 ) ) ( not ( = ?auto_111002 ?auto_111004 ) ) ( not ( = ?auto_111002 ?auto_111005 ) ) ( not ( = ?auto_111002 ?auto_111006 ) ) ( not ( = ?auto_111002 ?auto_111007 ) ) ( not ( = ?auto_111003 ?auto_111004 ) ) ( not ( = ?auto_111003 ?auto_111005 ) ) ( not ( = ?auto_111003 ?auto_111006 ) ) ( not ( = ?auto_111003 ?auto_111007 ) ) ( not ( = ?auto_111004 ?auto_111005 ) ) ( not ( = ?auto_111004 ?auto_111006 ) ) ( not ( = ?auto_111004 ?auto_111007 ) ) ( not ( = ?auto_111005 ?auto_111006 ) ) ( not ( = ?auto_111005 ?auto_111007 ) ) ( not ( = ?auto_111006 ?auto_111007 ) ) ( ON ?auto_111006 ?auto_111007 ) ( ON ?auto_111005 ?auto_111006 ) ( ON ?auto_111004 ?auto_111005 ) ( ON ?auto_111003 ?auto_111004 ) ( ON ?auto_111002 ?auto_111003 ) ( ON ?auto_111001 ?auto_111002 ) ( ON ?auto_111000 ?auto_111001 ) ( ON ?auto_110999 ?auto_111000 ) ( CLEAR ?auto_110997 ) ( ON ?auto_110998 ?auto_110999 ) ( CLEAR ?auto_110998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_110997 ?auto_110998 )
      ( MAKE-11PILE ?auto_110997 ?auto_110998 ?auto_110999 ?auto_111000 ?auto_111001 ?auto_111002 ?auto_111003 ?auto_111004 ?auto_111005 ?auto_111006 ?auto_111007 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_111019 - BLOCK
      ?auto_111020 - BLOCK
      ?auto_111021 - BLOCK
      ?auto_111022 - BLOCK
      ?auto_111023 - BLOCK
      ?auto_111024 - BLOCK
      ?auto_111025 - BLOCK
      ?auto_111026 - BLOCK
      ?auto_111027 - BLOCK
      ?auto_111028 - BLOCK
      ?auto_111029 - BLOCK
    )
    :vars
    (
      ?auto_111030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111029 ?auto_111030 ) ( not ( = ?auto_111019 ?auto_111020 ) ) ( not ( = ?auto_111019 ?auto_111021 ) ) ( not ( = ?auto_111019 ?auto_111022 ) ) ( not ( = ?auto_111019 ?auto_111023 ) ) ( not ( = ?auto_111019 ?auto_111024 ) ) ( not ( = ?auto_111019 ?auto_111025 ) ) ( not ( = ?auto_111019 ?auto_111026 ) ) ( not ( = ?auto_111019 ?auto_111027 ) ) ( not ( = ?auto_111019 ?auto_111028 ) ) ( not ( = ?auto_111019 ?auto_111029 ) ) ( not ( = ?auto_111019 ?auto_111030 ) ) ( not ( = ?auto_111020 ?auto_111021 ) ) ( not ( = ?auto_111020 ?auto_111022 ) ) ( not ( = ?auto_111020 ?auto_111023 ) ) ( not ( = ?auto_111020 ?auto_111024 ) ) ( not ( = ?auto_111020 ?auto_111025 ) ) ( not ( = ?auto_111020 ?auto_111026 ) ) ( not ( = ?auto_111020 ?auto_111027 ) ) ( not ( = ?auto_111020 ?auto_111028 ) ) ( not ( = ?auto_111020 ?auto_111029 ) ) ( not ( = ?auto_111020 ?auto_111030 ) ) ( not ( = ?auto_111021 ?auto_111022 ) ) ( not ( = ?auto_111021 ?auto_111023 ) ) ( not ( = ?auto_111021 ?auto_111024 ) ) ( not ( = ?auto_111021 ?auto_111025 ) ) ( not ( = ?auto_111021 ?auto_111026 ) ) ( not ( = ?auto_111021 ?auto_111027 ) ) ( not ( = ?auto_111021 ?auto_111028 ) ) ( not ( = ?auto_111021 ?auto_111029 ) ) ( not ( = ?auto_111021 ?auto_111030 ) ) ( not ( = ?auto_111022 ?auto_111023 ) ) ( not ( = ?auto_111022 ?auto_111024 ) ) ( not ( = ?auto_111022 ?auto_111025 ) ) ( not ( = ?auto_111022 ?auto_111026 ) ) ( not ( = ?auto_111022 ?auto_111027 ) ) ( not ( = ?auto_111022 ?auto_111028 ) ) ( not ( = ?auto_111022 ?auto_111029 ) ) ( not ( = ?auto_111022 ?auto_111030 ) ) ( not ( = ?auto_111023 ?auto_111024 ) ) ( not ( = ?auto_111023 ?auto_111025 ) ) ( not ( = ?auto_111023 ?auto_111026 ) ) ( not ( = ?auto_111023 ?auto_111027 ) ) ( not ( = ?auto_111023 ?auto_111028 ) ) ( not ( = ?auto_111023 ?auto_111029 ) ) ( not ( = ?auto_111023 ?auto_111030 ) ) ( not ( = ?auto_111024 ?auto_111025 ) ) ( not ( = ?auto_111024 ?auto_111026 ) ) ( not ( = ?auto_111024 ?auto_111027 ) ) ( not ( = ?auto_111024 ?auto_111028 ) ) ( not ( = ?auto_111024 ?auto_111029 ) ) ( not ( = ?auto_111024 ?auto_111030 ) ) ( not ( = ?auto_111025 ?auto_111026 ) ) ( not ( = ?auto_111025 ?auto_111027 ) ) ( not ( = ?auto_111025 ?auto_111028 ) ) ( not ( = ?auto_111025 ?auto_111029 ) ) ( not ( = ?auto_111025 ?auto_111030 ) ) ( not ( = ?auto_111026 ?auto_111027 ) ) ( not ( = ?auto_111026 ?auto_111028 ) ) ( not ( = ?auto_111026 ?auto_111029 ) ) ( not ( = ?auto_111026 ?auto_111030 ) ) ( not ( = ?auto_111027 ?auto_111028 ) ) ( not ( = ?auto_111027 ?auto_111029 ) ) ( not ( = ?auto_111027 ?auto_111030 ) ) ( not ( = ?auto_111028 ?auto_111029 ) ) ( not ( = ?auto_111028 ?auto_111030 ) ) ( not ( = ?auto_111029 ?auto_111030 ) ) ( ON ?auto_111028 ?auto_111029 ) ( ON ?auto_111027 ?auto_111028 ) ( ON ?auto_111026 ?auto_111027 ) ( ON ?auto_111025 ?auto_111026 ) ( ON ?auto_111024 ?auto_111025 ) ( ON ?auto_111023 ?auto_111024 ) ( ON ?auto_111022 ?auto_111023 ) ( ON ?auto_111021 ?auto_111022 ) ( ON ?auto_111020 ?auto_111021 ) ( ON ?auto_111019 ?auto_111020 ) ( CLEAR ?auto_111019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_111019 )
      ( MAKE-11PILE ?auto_111019 ?auto_111020 ?auto_111021 ?auto_111022 ?auto_111023 ?auto_111024 ?auto_111025 ?auto_111026 ?auto_111027 ?auto_111028 ?auto_111029 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_111042 - BLOCK
      ?auto_111043 - BLOCK
      ?auto_111044 - BLOCK
      ?auto_111045 - BLOCK
      ?auto_111046 - BLOCK
      ?auto_111047 - BLOCK
      ?auto_111048 - BLOCK
      ?auto_111049 - BLOCK
      ?auto_111050 - BLOCK
      ?auto_111051 - BLOCK
      ?auto_111052 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111052 ) ( not ( = ?auto_111042 ?auto_111043 ) ) ( not ( = ?auto_111042 ?auto_111044 ) ) ( not ( = ?auto_111042 ?auto_111045 ) ) ( not ( = ?auto_111042 ?auto_111046 ) ) ( not ( = ?auto_111042 ?auto_111047 ) ) ( not ( = ?auto_111042 ?auto_111048 ) ) ( not ( = ?auto_111042 ?auto_111049 ) ) ( not ( = ?auto_111042 ?auto_111050 ) ) ( not ( = ?auto_111042 ?auto_111051 ) ) ( not ( = ?auto_111042 ?auto_111052 ) ) ( not ( = ?auto_111043 ?auto_111044 ) ) ( not ( = ?auto_111043 ?auto_111045 ) ) ( not ( = ?auto_111043 ?auto_111046 ) ) ( not ( = ?auto_111043 ?auto_111047 ) ) ( not ( = ?auto_111043 ?auto_111048 ) ) ( not ( = ?auto_111043 ?auto_111049 ) ) ( not ( = ?auto_111043 ?auto_111050 ) ) ( not ( = ?auto_111043 ?auto_111051 ) ) ( not ( = ?auto_111043 ?auto_111052 ) ) ( not ( = ?auto_111044 ?auto_111045 ) ) ( not ( = ?auto_111044 ?auto_111046 ) ) ( not ( = ?auto_111044 ?auto_111047 ) ) ( not ( = ?auto_111044 ?auto_111048 ) ) ( not ( = ?auto_111044 ?auto_111049 ) ) ( not ( = ?auto_111044 ?auto_111050 ) ) ( not ( = ?auto_111044 ?auto_111051 ) ) ( not ( = ?auto_111044 ?auto_111052 ) ) ( not ( = ?auto_111045 ?auto_111046 ) ) ( not ( = ?auto_111045 ?auto_111047 ) ) ( not ( = ?auto_111045 ?auto_111048 ) ) ( not ( = ?auto_111045 ?auto_111049 ) ) ( not ( = ?auto_111045 ?auto_111050 ) ) ( not ( = ?auto_111045 ?auto_111051 ) ) ( not ( = ?auto_111045 ?auto_111052 ) ) ( not ( = ?auto_111046 ?auto_111047 ) ) ( not ( = ?auto_111046 ?auto_111048 ) ) ( not ( = ?auto_111046 ?auto_111049 ) ) ( not ( = ?auto_111046 ?auto_111050 ) ) ( not ( = ?auto_111046 ?auto_111051 ) ) ( not ( = ?auto_111046 ?auto_111052 ) ) ( not ( = ?auto_111047 ?auto_111048 ) ) ( not ( = ?auto_111047 ?auto_111049 ) ) ( not ( = ?auto_111047 ?auto_111050 ) ) ( not ( = ?auto_111047 ?auto_111051 ) ) ( not ( = ?auto_111047 ?auto_111052 ) ) ( not ( = ?auto_111048 ?auto_111049 ) ) ( not ( = ?auto_111048 ?auto_111050 ) ) ( not ( = ?auto_111048 ?auto_111051 ) ) ( not ( = ?auto_111048 ?auto_111052 ) ) ( not ( = ?auto_111049 ?auto_111050 ) ) ( not ( = ?auto_111049 ?auto_111051 ) ) ( not ( = ?auto_111049 ?auto_111052 ) ) ( not ( = ?auto_111050 ?auto_111051 ) ) ( not ( = ?auto_111050 ?auto_111052 ) ) ( not ( = ?auto_111051 ?auto_111052 ) ) ( ON ?auto_111051 ?auto_111052 ) ( ON ?auto_111050 ?auto_111051 ) ( ON ?auto_111049 ?auto_111050 ) ( ON ?auto_111048 ?auto_111049 ) ( ON ?auto_111047 ?auto_111048 ) ( ON ?auto_111046 ?auto_111047 ) ( ON ?auto_111045 ?auto_111046 ) ( ON ?auto_111044 ?auto_111045 ) ( ON ?auto_111043 ?auto_111044 ) ( ON ?auto_111042 ?auto_111043 ) ( CLEAR ?auto_111042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_111042 )
      ( MAKE-11PILE ?auto_111042 ?auto_111043 ?auto_111044 ?auto_111045 ?auto_111046 ?auto_111047 ?auto_111048 ?auto_111049 ?auto_111050 ?auto_111051 ?auto_111052 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_111064 - BLOCK
      ?auto_111065 - BLOCK
      ?auto_111066 - BLOCK
      ?auto_111067 - BLOCK
      ?auto_111068 - BLOCK
      ?auto_111069 - BLOCK
      ?auto_111070 - BLOCK
      ?auto_111071 - BLOCK
      ?auto_111072 - BLOCK
      ?auto_111073 - BLOCK
      ?auto_111074 - BLOCK
    )
    :vars
    (
      ?auto_111075 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111064 ?auto_111065 ) ) ( not ( = ?auto_111064 ?auto_111066 ) ) ( not ( = ?auto_111064 ?auto_111067 ) ) ( not ( = ?auto_111064 ?auto_111068 ) ) ( not ( = ?auto_111064 ?auto_111069 ) ) ( not ( = ?auto_111064 ?auto_111070 ) ) ( not ( = ?auto_111064 ?auto_111071 ) ) ( not ( = ?auto_111064 ?auto_111072 ) ) ( not ( = ?auto_111064 ?auto_111073 ) ) ( not ( = ?auto_111064 ?auto_111074 ) ) ( not ( = ?auto_111065 ?auto_111066 ) ) ( not ( = ?auto_111065 ?auto_111067 ) ) ( not ( = ?auto_111065 ?auto_111068 ) ) ( not ( = ?auto_111065 ?auto_111069 ) ) ( not ( = ?auto_111065 ?auto_111070 ) ) ( not ( = ?auto_111065 ?auto_111071 ) ) ( not ( = ?auto_111065 ?auto_111072 ) ) ( not ( = ?auto_111065 ?auto_111073 ) ) ( not ( = ?auto_111065 ?auto_111074 ) ) ( not ( = ?auto_111066 ?auto_111067 ) ) ( not ( = ?auto_111066 ?auto_111068 ) ) ( not ( = ?auto_111066 ?auto_111069 ) ) ( not ( = ?auto_111066 ?auto_111070 ) ) ( not ( = ?auto_111066 ?auto_111071 ) ) ( not ( = ?auto_111066 ?auto_111072 ) ) ( not ( = ?auto_111066 ?auto_111073 ) ) ( not ( = ?auto_111066 ?auto_111074 ) ) ( not ( = ?auto_111067 ?auto_111068 ) ) ( not ( = ?auto_111067 ?auto_111069 ) ) ( not ( = ?auto_111067 ?auto_111070 ) ) ( not ( = ?auto_111067 ?auto_111071 ) ) ( not ( = ?auto_111067 ?auto_111072 ) ) ( not ( = ?auto_111067 ?auto_111073 ) ) ( not ( = ?auto_111067 ?auto_111074 ) ) ( not ( = ?auto_111068 ?auto_111069 ) ) ( not ( = ?auto_111068 ?auto_111070 ) ) ( not ( = ?auto_111068 ?auto_111071 ) ) ( not ( = ?auto_111068 ?auto_111072 ) ) ( not ( = ?auto_111068 ?auto_111073 ) ) ( not ( = ?auto_111068 ?auto_111074 ) ) ( not ( = ?auto_111069 ?auto_111070 ) ) ( not ( = ?auto_111069 ?auto_111071 ) ) ( not ( = ?auto_111069 ?auto_111072 ) ) ( not ( = ?auto_111069 ?auto_111073 ) ) ( not ( = ?auto_111069 ?auto_111074 ) ) ( not ( = ?auto_111070 ?auto_111071 ) ) ( not ( = ?auto_111070 ?auto_111072 ) ) ( not ( = ?auto_111070 ?auto_111073 ) ) ( not ( = ?auto_111070 ?auto_111074 ) ) ( not ( = ?auto_111071 ?auto_111072 ) ) ( not ( = ?auto_111071 ?auto_111073 ) ) ( not ( = ?auto_111071 ?auto_111074 ) ) ( not ( = ?auto_111072 ?auto_111073 ) ) ( not ( = ?auto_111072 ?auto_111074 ) ) ( not ( = ?auto_111073 ?auto_111074 ) ) ( ON ?auto_111064 ?auto_111075 ) ( not ( = ?auto_111074 ?auto_111075 ) ) ( not ( = ?auto_111073 ?auto_111075 ) ) ( not ( = ?auto_111072 ?auto_111075 ) ) ( not ( = ?auto_111071 ?auto_111075 ) ) ( not ( = ?auto_111070 ?auto_111075 ) ) ( not ( = ?auto_111069 ?auto_111075 ) ) ( not ( = ?auto_111068 ?auto_111075 ) ) ( not ( = ?auto_111067 ?auto_111075 ) ) ( not ( = ?auto_111066 ?auto_111075 ) ) ( not ( = ?auto_111065 ?auto_111075 ) ) ( not ( = ?auto_111064 ?auto_111075 ) ) ( ON ?auto_111065 ?auto_111064 ) ( ON ?auto_111066 ?auto_111065 ) ( ON ?auto_111067 ?auto_111066 ) ( ON ?auto_111068 ?auto_111067 ) ( ON ?auto_111069 ?auto_111068 ) ( ON ?auto_111070 ?auto_111069 ) ( ON ?auto_111071 ?auto_111070 ) ( ON ?auto_111072 ?auto_111071 ) ( ON ?auto_111073 ?auto_111072 ) ( ON ?auto_111074 ?auto_111073 ) ( CLEAR ?auto_111074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_111074 ?auto_111073 ?auto_111072 ?auto_111071 ?auto_111070 ?auto_111069 ?auto_111068 ?auto_111067 ?auto_111066 ?auto_111065 ?auto_111064 )
      ( MAKE-11PILE ?auto_111064 ?auto_111065 ?auto_111066 ?auto_111067 ?auto_111068 ?auto_111069 ?auto_111070 ?auto_111071 ?auto_111072 ?auto_111073 ?auto_111074 ) )
  )

)

