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
      ?auto_28909 - BLOCK
    )
    :vars
    (
      ?auto_28910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28909 ?auto_28910 ) ( CLEAR ?auto_28909 ) ( HAND-EMPTY ) ( not ( = ?auto_28909 ?auto_28910 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28909 ?auto_28910 )
      ( !PUTDOWN ?auto_28909 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28912 - BLOCK
    )
    :vars
    (
      ?auto_28913 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28912 ?auto_28913 ) ( CLEAR ?auto_28912 ) ( HAND-EMPTY ) ( not ( = ?auto_28912 ?auto_28913 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28912 ?auto_28913 )
      ( !PUTDOWN ?auto_28912 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28916 - BLOCK
      ?auto_28917 - BLOCK
    )
    :vars
    (
      ?auto_28918 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_28916 ) ( ON ?auto_28917 ?auto_28918 ) ( CLEAR ?auto_28917 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28916 ) ( not ( = ?auto_28916 ?auto_28917 ) ) ( not ( = ?auto_28916 ?auto_28918 ) ) ( not ( = ?auto_28917 ?auto_28918 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28917 ?auto_28918 )
      ( !STACK ?auto_28917 ?auto_28916 ) )
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
    ( and ( CLEAR ?auto_28921 ) ( ON ?auto_28922 ?auto_28923 ) ( CLEAR ?auto_28922 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28921 ) ( not ( = ?auto_28921 ?auto_28922 ) ) ( not ( = ?auto_28921 ?auto_28923 ) ) ( not ( = ?auto_28922 ?auto_28923 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28922 ?auto_28923 )
      ( !STACK ?auto_28922 ?auto_28921 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28926 - BLOCK
      ?auto_28927 - BLOCK
    )
    :vars
    (
      ?auto_28928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28927 ?auto_28928 ) ( not ( = ?auto_28926 ?auto_28927 ) ) ( not ( = ?auto_28926 ?auto_28928 ) ) ( not ( = ?auto_28927 ?auto_28928 ) ) ( ON ?auto_28926 ?auto_28927 ) ( CLEAR ?auto_28926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28926 )
      ( MAKE-2PILE ?auto_28926 ?auto_28927 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28931 - BLOCK
      ?auto_28932 - BLOCK
    )
    :vars
    (
      ?auto_28933 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28932 ?auto_28933 ) ( not ( = ?auto_28931 ?auto_28932 ) ) ( not ( = ?auto_28931 ?auto_28933 ) ) ( not ( = ?auto_28932 ?auto_28933 ) ) ( ON ?auto_28931 ?auto_28932 ) ( CLEAR ?auto_28931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28931 )
      ( MAKE-2PILE ?auto_28931 ?auto_28932 ) )
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
    )
    :precondition
    ( and ( CLEAR ?auto_28938 ) ( ON ?auto_28939 ?auto_28940 ) ( CLEAR ?auto_28939 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28937 ) ( ON ?auto_28938 ?auto_28937 ) ( not ( = ?auto_28937 ?auto_28938 ) ) ( not ( = ?auto_28937 ?auto_28939 ) ) ( not ( = ?auto_28937 ?auto_28940 ) ) ( not ( = ?auto_28938 ?auto_28939 ) ) ( not ( = ?auto_28938 ?auto_28940 ) ) ( not ( = ?auto_28939 ?auto_28940 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28939 ?auto_28940 )
      ( !STACK ?auto_28939 ?auto_28938 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28944 - BLOCK
      ?auto_28945 - BLOCK
      ?auto_28946 - BLOCK
    )
    :vars
    (
      ?auto_28947 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_28945 ) ( ON ?auto_28946 ?auto_28947 ) ( CLEAR ?auto_28946 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28944 ) ( ON ?auto_28945 ?auto_28944 ) ( not ( = ?auto_28944 ?auto_28945 ) ) ( not ( = ?auto_28944 ?auto_28946 ) ) ( not ( = ?auto_28944 ?auto_28947 ) ) ( not ( = ?auto_28945 ?auto_28946 ) ) ( not ( = ?auto_28945 ?auto_28947 ) ) ( not ( = ?auto_28946 ?auto_28947 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28946 ?auto_28947 )
      ( !STACK ?auto_28946 ?auto_28945 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28951 - BLOCK
      ?auto_28952 - BLOCK
      ?auto_28953 - BLOCK
    )
    :vars
    (
      ?auto_28954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28953 ?auto_28954 ) ( ON-TABLE ?auto_28951 ) ( not ( = ?auto_28951 ?auto_28952 ) ) ( not ( = ?auto_28951 ?auto_28953 ) ) ( not ( = ?auto_28951 ?auto_28954 ) ) ( not ( = ?auto_28952 ?auto_28953 ) ) ( not ( = ?auto_28952 ?auto_28954 ) ) ( not ( = ?auto_28953 ?auto_28954 ) ) ( CLEAR ?auto_28951 ) ( ON ?auto_28952 ?auto_28953 ) ( CLEAR ?auto_28952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28951 ?auto_28952 )
      ( MAKE-3PILE ?auto_28951 ?auto_28952 ?auto_28953 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28958 - BLOCK
      ?auto_28959 - BLOCK
      ?auto_28960 - BLOCK
    )
    :vars
    (
      ?auto_28961 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28960 ?auto_28961 ) ( ON-TABLE ?auto_28958 ) ( not ( = ?auto_28958 ?auto_28959 ) ) ( not ( = ?auto_28958 ?auto_28960 ) ) ( not ( = ?auto_28958 ?auto_28961 ) ) ( not ( = ?auto_28959 ?auto_28960 ) ) ( not ( = ?auto_28959 ?auto_28961 ) ) ( not ( = ?auto_28960 ?auto_28961 ) ) ( CLEAR ?auto_28958 ) ( ON ?auto_28959 ?auto_28960 ) ( CLEAR ?auto_28959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28958 ?auto_28959 )
      ( MAKE-3PILE ?auto_28958 ?auto_28959 ?auto_28960 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28965 - BLOCK
      ?auto_28966 - BLOCK
      ?auto_28967 - BLOCK
    )
    :vars
    (
      ?auto_28968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28967 ?auto_28968 ) ( not ( = ?auto_28965 ?auto_28966 ) ) ( not ( = ?auto_28965 ?auto_28967 ) ) ( not ( = ?auto_28965 ?auto_28968 ) ) ( not ( = ?auto_28966 ?auto_28967 ) ) ( not ( = ?auto_28966 ?auto_28968 ) ) ( not ( = ?auto_28967 ?auto_28968 ) ) ( ON ?auto_28966 ?auto_28967 ) ( ON ?auto_28965 ?auto_28966 ) ( CLEAR ?auto_28965 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28965 )
      ( MAKE-3PILE ?auto_28965 ?auto_28966 ?auto_28967 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28972 - BLOCK
      ?auto_28973 - BLOCK
      ?auto_28974 - BLOCK
    )
    :vars
    (
      ?auto_28975 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28974 ?auto_28975 ) ( not ( = ?auto_28972 ?auto_28973 ) ) ( not ( = ?auto_28972 ?auto_28974 ) ) ( not ( = ?auto_28972 ?auto_28975 ) ) ( not ( = ?auto_28973 ?auto_28974 ) ) ( not ( = ?auto_28973 ?auto_28975 ) ) ( not ( = ?auto_28974 ?auto_28975 ) ) ( ON ?auto_28973 ?auto_28974 ) ( ON ?auto_28972 ?auto_28973 ) ( CLEAR ?auto_28972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28972 )
      ( MAKE-3PILE ?auto_28972 ?auto_28973 ?auto_28974 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28980 - BLOCK
      ?auto_28981 - BLOCK
      ?auto_28982 - BLOCK
      ?auto_28983 - BLOCK
    )
    :vars
    (
      ?auto_28984 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_28982 ) ( ON ?auto_28983 ?auto_28984 ) ( CLEAR ?auto_28983 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28980 ) ( ON ?auto_28981 ?auto_28980 ) ( ON ?auto_28982 ?auto_28981 ) ( not ( = ?auto_28980 ?auto_28981 ) ) ( not ( = ?auto_28980 ?auto_28982 ) ) ( not ( = ?auto_28980 ?auto_28983 ) ) ( not ( = ?auto_28980 ?auto_28984 ) ) ( not ( = ?auto_28981 ?auto_28982 ) ) ( not ( = ?auto_28981 ?auto_28983 ) ) ( not ( = ?auto_28981 ?auto_28984 ) ) ( not ( = ?auto_28982 ?auto_28983 ) ) ( not ( = ?auto_28982 ?auto_28984 ) ) ( not ( = ?auto_28983 ?auto_28984 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28983 ?auto_28984 )
      ( !STACK ?auto_28983 ?auto_28982 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28989 - BLOCK
      ?auto_28990 - BLOCK
      ?auto_28991 - BLOCK
      ?auto_28992 - BLOCK
    )
    :vars
    (
      ?auto_28993 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_28991 ) ( ON ?auto_28992 ?auto_28993 ) ( CLEAR ?auto_28992 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28989 ) ( ON ?auto_28990 ?auto_28989 ) ( ON ?auto_28991 ?auto_28990 ) ( not ( = ?auto_28989 ?auto_28990 ) ) ( not ( = ?auto_28989 ?auto_28991 ) ) ( not ( = ?auto_28989 ?auto_28992 ) ) ( not ( = ?auto_28989 ?auto_28993 ) ) ( not ( = ?auto_28990 ?auto_28991 ) ) ( not ( = ?auto_28990 ?auto_28992 ) ) ( not ( = ?auto_28990 ?auto_28993 ) ) ( not ( = ?auto_28991 ?auto_28992 ) ) ( not ( = ?auto_28991 ?auto_28993 ) ) ( not ( = ?auto_28992 ?auto_28993 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28992 ?auto_28993 )
      ( !STACK ?auto_28992 ?auto_28991 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28998 - BLOCK
      ?auto_28999 - BLOCK
      ?auto_29000 - BLOCK
      ?auto_29001 - BLOCK
    )
    :vars
    (
      ?auto_29002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29001 ?auto_29002 ) ( ON-TABLE ?auto_28998 ) ( ON ?auto_28999 ?auto_28998 ) ( not ( = ?auto_28998 ?auto_28999 ) ) ( not ( = ?auto_28998 ?auto_29000 ) ) ( not ( = ?auto_28998 ?auto_29001 ) ) ( not ( = ?auto_28998 ?auto_29002 ) ) ( not ( = ?auto_28999 ?auto_29000 ) ) ( not ( = ?auto_28999 ?auto_29001 ) ) ( not ( = ?auto_28999 ?auto_29002 ) ) ( not ( = ?auto_29000 ?auto_29001 ) ) ( not ( = ?auto_29000 ?auto_29002 ) ) ( not ( = ?auto_29001 ?auto_29002 ) ) ( CLEAR ?auto_28999 ) ( ON ?auto_29000 ?auto_29001 ) ( CLEAR ?auto_29000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28998 ?auto_28999 ?auto_29000 )
      ( MAKE-4PILE ?auto_28998 ?auto_28999 ?auto_29000 ?auto_29001 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29007 - BLOCK
      ?auto_29008 - BLOCK
      ?auto_29009 - BLOCK
      ?auto_29010 - BLOCK
    )
    :vars
    (
      ?auto_29011 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29010 ?auto_29011 ) ( ON-TABLE ?auto_29007 ) ( ON ?auto_29008 ?auto_29007 ) ( not ( = ?auto_29007 ?auto_29008 ) ) ( not ( = ?auto_29007 ?auto_29009 ) ) ( not ( = ?auto_29007 ?auto_29010 ) ) ( not ( = ?auto_29007 ?auto_29011 ) ) ( not ( = ?auto_29008 ?auto_29009 ) ) ( not ( = ?auto_29008 ?auto_29010 ) ) ( not ( = ?auto_29008 ?auto_29011 ) ) ( not ( = ?auto_29009 ?auto_29010 ) ) ( not ( = ?auto_29009 ?auto_29011 ) ) ( not ( = ?auto_29010 ?auto_29011 ) ) ( CLEAR ?auto_29008 ) ( ON ?auto_29009 ?auto_29010 ) ( CLEAR ?auto_29009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29007 ?auto_29008 ?auto_29009 )
      ( MAKE-4PILE ?auto_29007 ?auto_29008 ?auto_29009 ?auto_29010 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29016 - BLOCK
      ?auto_29017 - BLOCK
      ?auto_29018 - BLOCK
      ?auto_29019 - BLOCK
    )
    :vars
    (
      ?auto_29020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29019 ?auto_29020 ) ( ON-TABLE ?auto_29016 ) ( not ( = ?auto_29016 ?auto_29017 ) ) ( not ( = ?auto_29016 ?auto_29018 ) ) ( not ( = ?auto_29016 ?auto_29019 ) ) ( not ( = ?auto_29016 ?auto_29020 ) ) ( not ( = ?auto_29017 ?auto_29018 ) ) ( not ( = ?auto_29017 ?auto_29019 ) ) ( not ( = ?auto_29017 ?auto_29020 ) ) ( not ( = ?auto_29018 ?auto_29019 ) ) ( not ( = ?auto_29018 ?auto_29020 ) ) ( not ( = ?auto_29019 ?auto_29020 ) ) ( ON ?auto_29018 ?auto_29019 ) ( CLEAR ?auto_29016 ) ( ON ?auto_29017 ?auto_29018 ) ( CLEAR ?auto_29017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29016 ?auto_29017 )
      ( MAKE-4PILE ?auto_29016 ?auto_29017 ?auto_29018 ?auto_29019 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29025 - BLOCK
      ?auto_29026 - BLOCK
      ?auto_29027 - BLOCK
      ?auto_29028 - BLOCK
    )
    :vars
    (
      ?auto_29029 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29028 ?auto_29029 ) ( ON-TABLE ?auto_29025 ) ( not ( = ?auto_29025 ?auto_29026 ) ) ( not ( = ?auto_29025 ?auto_29027 ) ) ( not ( = ?auto_29025 ?auto_29028 ) ) ( not ( = ?auto_29025 ?auto_29029 ) ) ( not ( = ?auto_29026 ?auto_29027 ) ) ( not ( = ?auto_29026 ?auto_29028 ) ) ( not ( = ?auto_29026 ?auto_29029 ) ) ( not ( = ?auto_29027 ?auto_29028 ) ) ( not ( = ?auto_29027 ?auto_29029 ) ) ( not ( = ?auto_29028 ?auto_29029 ) ) ( ON ?auto_29027 ?auto_29028 ) ( CLEAR ?auto_29025 ) ( ON ?auto_29026 ?auto_29027 ) ( CLEAR ?auto_29026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29025 ?auto_29026 )
      ( MAKE-4PILE ?auto_29025 ?auto_29026 ?auto_29027 ?auto_29028 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29034 - BLOCK
      ?auto_29035 - BLOCK
      ?auto_29036 - BLOCK
      ?auto_29037 - BLOCK
    )
    :vars
    (
      ?auto_29038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29037 ?auto_29038 ) ( not ( = ?auto_29034 ?auto_29035 ) ) ( not ( = ?auto_29034 ?auto_29036 ) ) ( not ( = ?auto_29034 ?auto_29037 ) ) ( not ( = ?auto_29034 ?auto_29038 ) ) ( not ( = ?auto_29035 ?auto_29036 ) ) ( not ( = ?auto_29035 ?auto_29037 ) ) ( not ( = ?auto_29035 ?auto_29038 ) ) ( not ( = ?auto_29036 ?auto_29037 ) ) ( not ( = ?auto_29036 ?auto_29038 ) ) ( not ( = ?auto_29037 ?auto_29038 ) ) ( ON ?auto_29036 ?auto_29037 ) ( ON ?auto_29035 ?auto_29036 ) ( ON ?auto_29034 ?auto_29035 ) ( CLEAR ?auto_29034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29034 )
      ( MAKE-4PILE ?auto_29034 ?auto_29035 ?auto_29036 ?auto_29037 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29043 - BLOCK
      ?auto_29044 - BLOCK
      ?auto_29045 - BLOCK
      ?auto_29046 - BLOCK
    )
    :vars
    (
      ?auto_29047 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29046 ?auto_29047 ) ( not ( = ?auto_29043 ?auto_29044 ) ) ( not ( = ?auto_29043 ?auto_29045 ) ) ( not ( = ?auto_29043 ?auto_29046 ) ) ( not ( = ?auto_29043 ?auto_29047 ) ) ( not ( = ?auto_29044 ?auto_29045 ) ) ( not ( = ?auto_29044 ?auto_29046 ) ) ( not ( = ?auto_29044 ?auto_29047 ) ) ( not ( = ?auto_29045 ?auto_29046 ) ) ( not ( = ?auto_29045 ?auto_29047 ) ) ( not ( = ?auto_29046 ?auto_29047 ) ) ( ON ?auto_29045 ?auto_29046 ) ( ON ?auto_29044 ?auto_29045 ) ( ON ?auto_29043 ?auto_29044 ) ( CLEAR ?auto_29043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29043 )
      ( MAKE-4PILE ?auto_29043 ?auto_29044 ?auto_29045 ?auto_29046 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29053 - BLOCK
      ?auto_29054 - BLOCK
      ?auto_29055 - BLOCK
      ?auto_29056 - BLOCK
      ?auto_29057 - BLOCK
    )
    :vars
    (
      ?auto_29058 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_29056 ) ( ON ?auto_29057 ?auto_29058 ) ( CLEAR ?auto_29057 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29053 ) ( ON ?auto_29054 ?auto_29053 ) ( ON ?auto_29055 ?auto_29054 ) ( ON ?auto_29056 ?auto_29055 ) ( not ( = ?auto_29053 ?auto_29054 ) ) ( not ( = ?auto_29053 ?auto_29055 ) ) ( not ( = ?auto_29053 ?auto_29056 ) ) ( not ( = ?auto_29053 ?auto_29057 ) ) ( not ( = ?auto_29053 ?auto_29058 ) ) ( not ( = ?auto_29054 ?auto_29055 ) ) ( not ( = ?auto_29054 ?auto_29056 ) ) ( not ( = ?auto_29054 ?auto_29057 ) ) ( not ( = ?auto_29054 ?auto_29058 ) ) ( not ( = ?auto_29055 ?auto_29056 ) ) ( not ( = ?auto_29055 ?auto_29057 ) ) ( not ( = ?auto_29055 ?auto_29058 ) ) ( not ( = ?auto_29056 ?auto_29057 ) ) ( not ( = ?auto_29056 ?auto_29058 ) ) ( not ( = ?auto_29057 ?auto_29058 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29057 ?auto_29058 )
      ( !STACK ?auto_29057 ?auto_29056 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29064 - BLOCK
      ?auto_29065 - BLOCK
      ?auto_29066 - BLOCK
      ?auto_29067 - BLOCK
      ?auto_29068 - BLOCK
    )
    :vars
    (
      ?auto_29069 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_29067 ) ( ON ?auto_29068 ?auto_29069 ) ( CLEAR ?auto_29068 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29064 ) ( ON ?auto_29065 ?auto_29064 ) ( ON ?auto_29066 ?auto_29065 ) ( ON ?auto_29067 ?auto_29066 ) ( not ( = ?auto_29064 ?auto_29065 ) ) ( not ( = ?auto_29064 ?auto_29066 ) ) ( not ( = ?auto_29064 ?auto_29067 ) ) ( not ( = ?auto_29064 ?auto_29068 ) ) ( not ( = ?auto_29064 ?auto_29069 ) ) ( not ( = ?auto_29065 ?auto_29066 ) ) ( not ( = ?auto_29065 ?auto_29067 ) ) ( not ( = ?auto_29065 ?auto_29068 ) ) ( not ( = ?auto_29065 ?auto_29069 ) ) ( not ( = ?auto_29066 ?auto_29067 ) ) ( not ( = ?auto_29066 ?auto_29068 ) ) ( not ( = ?auto_29066 ?auto_29069 ) ) ( not ( = ?auto_29067 ?auto_29068 ) ) ( not ( = ?auto_29067 ?auto_29069 ) ) ( not ( = ?auto_29068 ?auto_29069 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29068 ?auto_29069 )
      ( !STACK ?auto_29068 ?auto_29067 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29075 - BLOCK
      ?auto_29076 - BLOCK
      ?auto_29077 - BLOCK
      ?auto_29078 - BLOCK
      ?auto_29079 - BLOCK
    )
    :vars
    (
      ?auto_29080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29079 ?auto_29080 ) ( ON-TABLE ?auto_29075 ) ( ON ?auto_29076 ?auto_29075 ) ( ON ?auto_29077 ?auto_29076 ) ( not ( = ?auto_29075 ?auto_29076 ) ) ( not ( = ?auto_29075 ?auto_29077 ) ) ( not ( = ?auto_29075 ?auto_29078 ) ) ( not ( = ?auto_29075 ?auto_29079 ) ) ( not ( = ?auto_29075 ?auto_29080 ) ) ( not ( = ?auto_29076 ?auto_29077 ) ) ( not ( = ?auto_29076 ?auto_29078 ) ) ( not ( = ?auto_29076 ?auto_29079 ) ) ( not ( = ?auto_29076 ?auto_29080 ) ) ( not ( = ?auto_29077 ?auto_29078 ) ) ( not ( = ?auto_29077 ?auto_29079 ) ) ( not ( = ?auto_29077 ?auto_29080 ) ) ( not ( = ?auto_29078 ?auto_29079 ) ) ( not ( = ?auto_29078 ?auto_29080 ) ) ( not ( = ?auto_29079 ?auto_29080 ) ) ( CLEAR ?auto_29077 ) ( ON ?auto_29078 ?auto_29079 ) ( CLEAR ?auto_29078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29075 ?auto_29076 ?auto_29077 ?auto_29078 )
      ( MAKE-5PILE ?auto_29075 ?auto_29076 ?auto_29077 ?auto_29078 ?auto_29079 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29086 - BLOCK
      ?auto_29087 - BLOCK
      ?auto_29088 - BLOCK
      ?auto_29089 - BLOCK
      ?auto_29090 - BLOCK
    )
    :vars
    (
      ?auto_29091 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29090 ?auto_29091 ) ( ON-TABLE ?auto_29086 ) ( ON ?auto_29087 ?auto_29086 ) ( ON ?auto_29088 ?auto_29087 ) ( not ( = ?auto_29086 ?auto_29087 ) ) ( not ( = ?auto_29086 ?auto_29088 ) ) ( not ( = ?auto_29086 ?auto_29089 ) ) ( not ( = ?auto_29086 ?auto_29090 ) ) ( not ( = ?auto_29086 ?auto_29091 ) ) ( not ( = ?auto_29087 ?auto_29088 ) ) ( not ( = ?auto_29087 ?auto_29089 ) ) ( not ( = ?auto_29087 ?auto_29090 ) ) ( not ( = ?auto_29087 ?auto_29091 ) ) ( not ( = ?auto_29088 ?auto_29089 ) ) ( not ( = ?auto_29088 ?auto_29090 ) ) ( not ( = ?auto_29088 ?auto_29091 ) ) ( not ( = ?auto_29089 ?auto_29090 ) ) ( not ( = ?auto_29089 ?auto_29091 ) ) ( not ( = ?auto_29090 ?auto_29091 ) ) ( CLEAR ?auto_29088 ) ( ON ?auto_29089 ?auto_29090 ) ( CLEAR ?auto_29089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29086 ?auto_29087 ?auto_29088 ?auto_29089 )
      ( MAKE-5PILE ?auto_29086 ?auto_29087 ?auto_29088 ?auto_29089 ?auto_29090 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29097 - BLOCK
      ?auto_29098 - BLOCK
      ?auto_29099 - BLOCK
      ?auto_29100 - BLOCK
      ?auto_29101 - BLOCK
    )
    :vars
    (
      ?auto_29102 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29101 ?auto_29102 ) ( ON-TABLE ?auto_29097 ) ( ON ?auto_29098 ?auto_29097 ) ( not ( = ?auto_29097 ?auto_29098 ) ) ( not ( = ?auto_29097 ?auto_29099 ) ) ( not ( = ?auto_29097 ?auto_29100 ) ) ( not ( = ?auto_29097 ?auto_29101 ) ) ( not ( = ?auto_29097 ?auto_29102 ) ) ( not ( = ?auto_29098 ?auto_29099 ) ) ( not ( = ?auto_29098 ?auto_29100 ) ) ( not ( = ?auto_29098 ?auto_29101 ) ) ( not ( = ?auto_29098 ?auto_29102 ) ) ( not ( = ?auto_29099 ?auto_29100 ) ) ( not ( = ?auto_29099 ?auto_29101 ) ) ( not ( = ?auto_29099 ?auto_29102 ) ) ( not ( = ?auto_29100 ?auto_29101 ) ) ( not ( = ?auto_29100 ?auto_29102 ) ) ( not ( = ?auto_29101 ?auto_29102 ) ) ( ON ?auto_29100 ?auto_29101 ) ( CLEAR ?auto_29098 ) ( ON ?auto_29099 ?auto_29100 ) ( CLEAR ?auto_29099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29097 ?auto_29098 ?auto_29099 )
      ( MAKE-5PILE ?auto_29097 ?auto_29098 ?auto_29099 ?auto_29100 ?auto_29101 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29108 - BLOCK
      ?auto_29109 - BLOCK
      ?auto_29110 - BLOCK
      ?auto_29111 - BLOCK
      ?auto_29112 - BLOCK
    )
    :vars
    (
      ?auto_29113 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29112 ?auto_29113 ) ( ON-TABLE ?auto_29108 ) ( ON ?auto_29109 ?auto_29108 ) ( not ( = ?auto_29108 ?auto_29109 ) ) ( not ( = ?auto_29108 ?auto_29110 ) ) ( not ( = ?auto_29108 ?auto_29111 ) ) ( not ( = ?auto_29108 ?auto_29112 ) ) ( not ( = ?auto_29108 ?auto_29113 ) ) ( not ( = ?auto_29109 ?auto_29110 ) ) ( not ( = ?auto_29109 ?auto_29111 ) ) ( not ( = ?auto_29109 ?auto_29112 ) ) ( not ( = ?auto_29109 ?auto_29113 ) ) ( not ( = ?auto_29110 ?auto_29111 ) ) ( not ( = ?auto_29110 ?auto_29112 ) ) ( not ( = ?auto_29110 ?auto_29113 ) ) ( not ( = ?auto_29111 ?auto_29112 ) ) ( not ( = ?auto_29111 ?auto_29113 ) ) ( not ( = ?auto_29112 ?auto_29113 ) ) ( ON ?auto_29111 ?auto_29112 ) ( CLEAR ?auto_29109 ) ( ON ?auto_29110 ?auto_29111 ) ( CLEAR ?auto_29110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29108 ?auto_29109 ?auto_29110 )
      ( MAKE-5PILE ?auto_29108 ?auto_29109 ?auto_29110 ?auto_29111 ?auto_29112 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29119 - BLOCK
      ?auto_29120 - BLOCK
      ?auto_29121 - BLOCK
      ?auto_29122 - BLOCK
      ?auto_29123 - BLOCK
    )
    :vars
    (
      ?auto_29124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29123 ?auto_29124 ) ( ON-TABLE ?auto_29119 ) ( not ( = ?auto_29119 ?auto_29120 ) ) ( not ( = ?auto_29119 ?auto_29121 ) ) ( not ( = ?auto_29119 ?auto_29122 ) ) ( not ( = ?auto_29119 ?auto_29123 ) ) ( not ( = ?auto_29119 ?auto_29124 ) ) ( not ( = ?auto_29120 ?auto_29121 ) ) ( not ( = ?auto_29120 ?auto_29122 ) ) ( not ( = ?auto_29120 ?auto_29123 ) ) ( not ( = ?auto_29120 ?auto_29124 ) ) ( not ( = ?auto_29121 ?auto_29122 ) ) ( not ( = ?auto_29121 ?auto_29123 ) ) ( not ( = ?auto_29121 ?auto_29124 ) ) ( not ( = ?auto_29122 ?auto_29123 ) ) ( not ( = ?auto_29122 ?auto_29124 ) ) ( not ( = ?auto_29123 ?auto_29124 ) ) ( ON ?auto_29122 ?auto_29123 ) ( ON ?auto_29121 ?auto_29122 ) ( CLEAR ?auto_29119 ) ( ON ?auto_29120 ?auto_29121 ) ( CLEAR ?auto_29120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29119 ?auto_29120 )
      ( MAKE-5PILE ?auto_29119 ?auto_29120 ?auto_29121 ?auto_29122 ?auto_29123 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29130 - BLOCK
      ?auto_29131 - BLOCK
      ?auto_29132 - BLOCK
      ?auto_29133 - BLOCK
      ?auto_29134 - BLOCK
    )
    :vars
    (
      ?auto_29135 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29134 ?auto_29135 ) ( ON-TABLE ?auto_29130 ) ( not ( = ?auto_29130 ?auto_29131 ) ) ( not ( = ?auto_29130 ?auto_29132 ) ) ( not ( = ?auto_29130 ?auto_29133 ) ) ( not ( = ?auto_29130 ?auto_29134 ) ) ( not ( = ?auto_29130 ?auto_29135 ) ) ( not ( = ?auto_29131 ?auto_29132 ) ) ( not ( = ?auto_29131 ?auto_29133 ) ) ( not ( = ?auto_29131 ?auto_29134 ) ) ( not ( = ?auto_29131 ?auto_29135 ) ) ( not ( = ?auto_29132 ?auto_29133 ) ) ( not ( = ?auto_29132 ?auto_29134 ) ) ( not ( = ?auto_29132 ?auto_29135 ) ) ( not ( = ?auto_29133 ?auto_29134 ) ) ( not ( = ?auto_29133 ?auto_29135 ) ) ( not ( = ?auto_29134 ?auto_29135 ) ) ( ON ?auto_29133 ?auto_29134 ) ( ON ?auto_29132 ?auto_29133 ) ( CLEAR ?auto_29130 ) ( ON ?auto_29131 ?auto_29132 ) ( CLEAR ?auto_29131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29130 ?auto_29131 )
      ( MAKE-5PILE ?auto_29130 ?auto_29131 ?auto_29132 ?auto_29133 ?auto_29134 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29141 - BLOCK
      ?auto_29142 - BLOCK
      ?auto_29143 - BLOCK
      ?auto_29144 - BLOCK
      ?auto_29145 - BLOCK
    )
    :vars
    (
      ?auto_29146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29145 ?auto_29146 ) ( not ( = ?auto_29141 ?auto_29142 ) ) ( not ( = ?auto_29141 ?auto_29143 ) ) ( not ( = ?auto_29141 ?auto_29144 ) ) ( not ( = ?auto_29141 ?auto_29145 ) ) ( not ( = ?auto_29141 ?auto_29146 ) ) ( not ( = ?auto_29142 ?auto_29143 ) ) ( not ( = ?auto_29142 ?auto_29144 ) ) ( not ( = ?auto_29142 ?auto_29145 ) ) ( not ( = ?auto_29142 ?auto_29146 ) ) ( not ( = ?auto_29143 ?auto_29144 ) ) ( not ( = ?auto_29143 ?auto_29145 ) ) ( not ( = ?auto_29143 ?auto_29146 ) ) ( not ( = ?auto_29144 ?auto_29145 ) ) ( not ( = ?auto_29144 ?auto_29146 ) ) ( not ( = ?auto_29145 ?auto_29146 ) ) ( ON ?auto_29144 ?auto_29145 ) ( ON ?auto_29143 ?auto_29144 ) ( ON ?auto_29142 ?auto_29143 ) ( ON ?auto_29141 ?auto_29142 ) ( CLEAR ?auto_29141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29141 )
      ( MAKE-5PILE ?auto_29141 ?auto_29142 ?auto_29143 ?auto_29144 ?auto_29145 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29152 - BLOCK
      ?auto_29153 - BLOCK
      ?auto_29154 - BLOCK
      ?auto_29155 - BLOCK
      ?auto_29156 - BLOCK
    )
    :vars
    (
      ?auto_29157 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29156 ?auto_29157 ) ( not ( = ?auto_29152 ?auto_29153 ) ) ( not ( = ?auto_29152 ?auto_29154 ) ) ( not ( = ?auto_29152 ?auto_29155 ) ) ( not ( = ?auto_29152 ?auto_29156 ) ) ( not ( = ?auto_29152 ?auto_29157 ) ) ( not ( = ?auto_29153 ?auto_29154 ) ) ( not ( = ?auto_29153 ?auto_29155 ) ) ( not ( = ?auto_29153 ?auto_29156 ) ) ( not ( = ?auto_29153 ?auto_29157 ) ) ( not ( = ?auto_29154 ?auto_29155 ) ) ( not ( = ?auto_29154 ?auto_29156 ) ) ( not ( = ?auto_29154 ?auto_29157 ) ) ( not ( = ?auto_29155 ?auto_29156 ) ) ( not ( = ?auto_29155 ?auto_29157 ) ) ( not ( = ?auto_29156 ?auto_29157 ) ) ( ON ?auto_29155 ?auto_29156 ) ( ON ?auto_29154 ?auto_29155 ) ( ON ?auto_29153 ?auto_29154 ) ( ON ?auto_29152 ?auto_29153 ) ( CLEAR ?auto_29152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29152 )
      ( MAKE-5PILE ?auto_29152 ?auto_29153 ?auto_29154 ?auto_29155 ?auto_29156 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_29164 - BLOCK
      ?auto_29165 - BLOCK
      ?auto_29166 - BLOCK
      ?auto_29167 - BLOCK
      ?auto_29168 - BLOCK
      ?auto_29169 - BLOCK
    )
    :vars
    (
      ?auto_29170 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_29168 ) ( ON ?auto_29169 ?auto_29170 ) ( CLEAR ?auto_29169 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29164 ) ( ON ?auto_29165 ?auto_29164 ) ( ON ?auto_29166 ?auto_29165 ) ( ON ?auto_29167 ?auto_29166 ) ( ON ?auto_29168 ?auto_29167 ) ( not ( = ?auto_29164 ?auto_29165 ) ) ( not ( = ?auto_29164 ?auto_29166 ) ) ( not ( = ?auto_29164 ?auto_29167 ) ) ( not ( = ?auto_29164 ?auto_29168 ) ) ( not ( = ?auto_29164 ?auto_29169 ) ) ( not ( = ?auto_29164 ?auto_29170 ) ) ( not ( = ?auto_29165 ?auto_29166 ) ) ( not ( = ?auto_29165 ?auto_29167 ) ) ( not ( = ?auto_29165 ?auto_29168 ) ) ( not ( = ?auto_29165 ?auto_29169 ) ) ( not ( = ?auto_29165 ?auto_29170 ) ) ( not ( = ?auto_29166 ?auto_29167 ) ) ( not ( = ?auto_29166 ?auto_29168 ) ) ( not ( = ?auto_29166 ?auto_29169 ) ) ( not ( = ?auto_29166 ?auto_29170 ) ) ( not ( = ?auto_29167 ?auto_29168 ) ) ( not ( = ?auto_29167 ?auto_29169 ) ) ( not ( = ?auto_29167 ?auto_29170 ) ) ( not ( = ?auto_29168 ?auto_29169 ) ) ( not ( = ?auto_29168 ?auto_29170 ) ) ( not ( = ?auto_29169 ?auto_29170 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29169 ?auto_29170 )
      ( !STACK ?auto_29169 ?auto_29168 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_29177 - BLOCK
      ?auto_29178 - BLOCK
      ?auto_29179 - BLOCK
      ?auto_29180 - BLOCK
      ?auto_29181 - BLOCK
      ?auto_29182 - BLOCK
    )
    :vars
    (
      ?auto_29183 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_29181 ) ( ON ?auto_29182 ?auto_29183 ) ( CLEAR ?auto_29182 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29177 ) ( ON ?auto_29178 ?auto_29177 ) ( ON ?auto_29179 ?auto_29178 ) ( ON ?auto_29180 ?auto_29179 ) ( ON ?auto_29181 ?auto_29180 ) ( not ( = ?auto_29177 ?auto_29178 ) ) ( not ( = ?auto_29177 ?auto_29179 ) ) ( not ( = ?auto_29177 ?auto_29180 ) ) ( not ( = ?auto_29177 ?auto_29181 ) ) ( not ( = ?auto_29177 ?auto_29182 ) ) ( not ( = ?auto_29177 ?auto_29183 ) ) ( not ( = ?auto_29178 ?auto_29179 ) ) ( not ( = ?auto_29178 ?auto_29180 ) ) ( not ( = ?auto_29178 ?auto_29181 ) ) ( not ( = ?auto_29178 ?auto_29182 ) ) ( not ( = ?auto_29178 ?auto_29183 ) ) ( not ( = ?auto_29179 ?auto_29180 ) ) ( not ( = ?auto_29179 ?auto_29181 ) ) ( not ( = ?auto_29179 ?auto_29182 ) ) ( not ( = ?auto_29179 ?auto_29183 ) ) ( not ( = ?auto_29180 ?auto_29181 ) ) ( not ( = ?auto_29180 ?auto_29182 ) ) ( not ( = ?auto_29180 ?auto_29183 ) ) ( not ( = ?auto_29181 ?auto_29182 ) ) ( not ( = ?auto_29181 ?auto_29183 ) ) ( not ( = ?auto_29182 ?auto_29183 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29182 ?auto_29183 )
      ( !STACK ?auto_29182 ?auto_29181 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_29190 - BLOCK
      ?auto_29191 - BLOCK
      ?auto_29192 - BLOCK
      ?auto_29193 - BLOCK
      ?auto_29194 - BLOCK
      ?auto_29195 - BLOCK
    )
    :vars
    (
      ?auto_29196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29195 ?auto_29196 ) ( ON-TABLE ?auto_29190 ) ( ON ?auto_29191 ?auto_29190 ) ( ON ?auto_29192 ?auto_29191 ) ( ON ?auto_29193 ?auto_29192 ) ( not ( = ?auto_29190 ?auto_29191 ) ) ( not ( = ?auto_29190 ?auto_29192 ) ) ( not ( = ?auto_29190 ?auto_29193 ) ) ( not ( = ?auto_29190 ?auto_29194 ) ) ( not ( = ?auto_29190 ?auto_29195 ) ) ( not ( = ?auto_29190 ?auto_29196 ) ) ( not ( = ?auto_29191 ?auto_29192 ) ) ( not ( = ?auto_29191 ?auto_29193 ) ) ( not ( = ?auto_29191 ?auto_29194 ) ) ( not ( = ?auto_29191 ?auto_29195 ) ) ( not ( = ?auto_29191 ?auto_29196 ) ) ( not ( = ?auto_29192 ?auto_29193 ) ) ( not ( = ?auto_29192 ?auto_29194 ) ) ( not ( = ?auto_29192 ?auto_29195 ) ) ( not ( = ?auto_29192 ?auto_29196 ) ) ( not ( = ?auto_29193 ?auto_29194 ) ) ( not ( = ?auto_29193 ?auto_29195 ) ) ( not ( = ?auto_29193 ?auto_29196 ) ) ( not ( = ?auto_29194 ?auto_29195 ) ) ( not ( = ?auto_29194 ?auto_29196 ) ) ( not ( = ?auto_29195 ?auto_29196 ) ) ( CLEAR ?auto_29193 ) ( ON ?auto_29194 ?auto_29195 ) ( CLEAR ?auto_29194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_29190 ?auto_29191 ?auto_29192 ?auto_29193 ?auto_29194 )
      ( MAKE-6PILE ?auto_29190 ?auto_29191 ?auto_29192 ?auto_29193 ?auto_29194 ?auto_29195 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_29203 - BLOCK
      ?auto_29204 - BLOCK
      ?auto_29205 - BLOCK
      ?auto_29206 - BLOCK
      ?auto_29207 - BLOCK
      ?auto_29208 - BLOCK
    )
    :vars
    (
      ?auto_29209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29208 ?auto_29209 ) ( ON-TABLE ?auto_29203 ) ( ON ?auto_29204 ?auto_29203 ) ( ON ?auto_29205 ?auto_29204 ) ( ON ?auto_29206 ?auto_29205 ) ( not ( = ?auto_29203 ?auto_29204 ) ) ( not ( = ?auto_29203 ?auto_29205 ) ) ( not ( = ?auto_29203 ?auto_29206 ) ) ( not ( = ?auto_29203 ?auto_29207 ) ) ( not ( = ?auto_29203 ?auto_29208 ) ) ( not ( = ?auto_29203 ?auto_29209 ) ) ( not ( = ?auto_29204 ?auto_29205 ) ) ( not ( = ?auto_29204 ?auto_29206 ) ) ( not ( = ?auto_29204 ?auto_29207 ) ) ( not ( = ?auto_29204 ?auto_29208 ) ) ( not ( = ?auto_29204 ?auto_29209 ) ) ( not ( = ?auto_29205 ?auto_29206 ) ) ( not ( = ?auto_29205 ?auto_29207 ) ) ( not ( = ?auto_29205 ?auto_29208 ) ) ( not ( = ?auto_29205 ?auto_29209 ) ) ( not ( = ?auto_29206 ?auto_29207 ) ) ( not ( = ?auto_29206 ?auto_29208 ) ) ( not ( = ?auto_29206 ?auto_29209 ) ) ( not ( = ?auto_29207 ?auto_29208 ) ) ( not ( = ?auto_29207 ?auto_29209 ) ) ( not ( = ?auto_29208 ?auto_29209 ) ) ( CLEAR ?auto_29206 ) ( ON ?auto_29207 ?auto_29208 ) ( CLEAR ?auto_29207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_29203 ?auto_29204 ?auto_29205 ?auto_29206 ?auto_29207 )
      ( MAKE-6PILE ?auto_29203 ?auto_29204 ?auto_29205 ?auto_29206 ?auto_29207 ?auto_29208 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_29216 - BLOCK
      ?auto_29217 - BLOCK
      ?auto_29218 - BLOCK
      ?auto_29219 - BLOCK
      ?auto_29220 - BLOCK
      ?auto_29221 - BLOCK
    )
    :vars
    (
      ?auto_29222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29221 ?auto_29222 ) ( ON-TABLE ?auto_29216 ) ( ON ?auto_29217 ?auto_29216 ) ( ON ?auto_29218 ?auto_29217 ) ( not ( = ?auto_29216 ?auto_29217 ) ) ( not ( = ?auto_29216 ?auto_29218 ) ) ( not ( = ?auto_29216 ?auto_29219 ) ) ( not ( = ?auto_29216 ?auto_29220 ) ) ( not ( = ?auto_29216 ?auto_29221 ) ) ( not ( = ?auto_29216 ?auto_29222 ) ) ( not ( = ?auto_29217 ?auto_29218 ) ) ( not ( = ?auto_29217 ?auto_29219 ) ) ( not ( = ?auto_29217 ?auto_29220 ) ) ( not ( = ?auto_29217 ?auto_29221 ) ) ( not ( = ?auto_29217 ?auto_29222 ) ) ( not ( = ?auto_29218 ?auto_29219 ) ) ( not ( = ?auto_29218 ?auto_29220 ) ) ( not ( = ?auto_29218 ?auto_29221 ) ) ( not ( = ?auto_29218 ?auto_29222 ) ) ( not ( = ?auto_29219 ?auto_29220 ) ) ( not ( = ?auto_29219 ?auto_29221 ) ) ( not ( = ?auto_29219 ?auto_29222 ) ) ( not ( = ?auto_29220 ?auto_29221 ) ) ( not ( = ?auto_29220 ?auto_29222 ) ) ( not ( = ?auto_29221 ?auto_29222 ) ) ( ON ?auto_29220 ?auto_29221 ) ( CLEAR ?auto_29218 ) ( ON ?auto_29219 ?auto_29220 ) ( CLEAR ?auto_29219 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29216 ?auto_29217 ?auto_29218 ?auto_29219 )
      ( MAKE-6PILE ?auto_29216 ?auto_29217 ?auto_29218 ?auto_29219 ?auto_29220 ?auto_29221 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_29229 - BLOCK
      ?auto_29230 - BLOCK
      ?auto_29231 - BLOCK
      ?auto_29232 - BLOCK
      ?auto_29233 - BLOCK
      ?auto_29234 - BLOCK
    )
    :vars
    (
      ?auto_29235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29234 ?auto_29235 ) ( ON-TABLE ?auto_29229 ) ( ON ?auto_29230 ?auto_29229 ) ( ON ?auto_29231 ?auto_29230 ) ( not ( = ?auto_29229 ?auto_29230 ) ) ( not ( = ?auto_29229 ?auto_29231 ) ) ( not ( = ?auto_29229 ?auto_29232 ) ) ( not ( = ?auto_29229 ?auto_29233 ) ) ( not ( = ?auto_29229 ?auto_29234 ) ) ( not ( = ?auto_29229 ?auto_29235 ) ) ( not ( = ?auto_29230 ?auto_29231 ) ) ( not ( = ?auto_29230 ?auto_29232 ) ) ( not ( = ?auto_29230 ?auto_29233 ) ) ( not ( = ?auto_29230 ?auto_29234 ) ) ( not ( = ?auto_29230 ?auto_29235 ) ) ( not ( = ?auto_29231 ?auto_29232 ) ) ( not ( = ?auto_29231 ?auto_29233 ) ) ( not ( = ?auto_29231 ?auto_29234 ) ) ( not ( = ?auto_29231 ?auto_29235 ) ) ( not ( = ?auto_29232 ?auto_29233 ) ) ( not ( = ?auto_29232 ?auto_29234 ) ) ( not ( = ?auto_29232 ?auto_29235 ) ) ( not ( = ?auto_29233 ?auto_29234 ) ) ( not ( = ?auto_29233 ?auto_29235 ) ) ( not ( = ?auto_29234 ?auto_29235 ) ) ( ON ?auto_29233 ?auto_29234 ) ( CLEAR ?auto_29231 ) ( ON ?auto_29232 ?auto_29233 ) ( CLEAR ?auto_29232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29229 ?auto_29230 ?auto_29231 ?auto_29232 )
      ( MAKE-6PILE ?auto_29229 ?auto_29230 ?auto_29231 ?auto_29232 ?auto_29233 ?auto_29234 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_29242 - BLOCK
      ?auto_29243 - BLOCK
      ?auto_29244 - BLOCK
      ?auto_29245 - BLOCK
      ?auto_29246 - BLOCK
      ?auto_29247 - BLOCK
    )
    :vars
    (
      ?auto_29248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29247 ?auto_29248 ) ( ON-TABLE ?auto_29242 ) ( ON ?auto_29243 ?auto_29242 ) ( not ( = ?auto_29242 ?auto_29243 ) ) ( not ( = ?auto_29242 ?auto_29244 ) ) ( not ( = ?auto_29242 ?auto_29245 ) ) ( not ( = ?auto_29242 ?auto_29246 ) ) ( not ( = ?auto_29242 ?auto_29247 ) ) ( not ( = ?auto_29242 ?auto_29248 ) ) ( not ( = ?auto_29243 ?auto_29244 ) ) ( not ( = ?auto_29243 ?auto_29245 ) ) ( not ( = ?auto_29243 ?auto_29246 ) ) ( not ( = ?auto_29243 ?auto_29247 ) ) ( not ( = ?auto_29243 ?auto_29248 ) ) ( not ( = ?auto_29244 ?auto_29245 ) ) ( not ( = ?auto_29244 ?auto_29246 ) ) ( not ( = ?auto_29244 ?auto_29247 ) ) ( not ( = ?auto_29244 ?auto_29248 ) ) ( not ( = ?auto_29245 ?auto_29246 ) ) ( not ( = ?auto_29245 ?auto_29247 ) ) ( not ( = ?auto_29245 ?auto_29248 ) ) ( not ( = ?auto_29246 ?auto_29247 ) ) ( not ( = ?auto_29246 ?auto_29248 ) ) ( not ( = ?auto_29247 ?auto_29248 ) ) ( ON ?auto_29246 ?auto_29247 ) ( ON ?auto_29245 ?auto_29246 ) ( CLEAR ?auto_29243 ) ( ON ?auto_29244 ?auto_29245 ) ( CLEAR ?auto_29244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29242 ?auto_29243 ?auto_29244 )
      ( MAKE-6PILE ?auto_29242 ?auto_29243 ?auto_29244 ?auto_29245 ?auto_29246 ?auto_29247 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_29255 - BLOCK
      ?auto_29256 - BLOCK
      ?auto_29257 - BLOCK
      ?auto_29258 - BLOCK
      ?auto_29259 - BLOCK
      ?auto_29260 - BLOCK
    )
    :vars
    (
      ?auto_29261 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29260 ?auto_29261 ) ( ON-TABLE ?auto_29255 ) ( ON ?auto_29256 ?auto_29255 ) ( not ( = ?auto_29255 ?auto_29256 ) ) ( not ( = ?auto_29255 ?auto_29257 ) ) ( not ( = ?auto_29255 ?auto_29258 ) ) ( not ( = ?auto_29255 ?auto_29259 ) ) ( not ( = ?auto_29255 ?auto_29260 ) ) ( not ( = ?auto_29255 ?auto_29261 ) ) ( not ( = ?auto_29256 ?auto_29257 ) ) ( not ( = ?auto_29256 ?auto_29258 ) ) ( not ( = ?auto_29256 ?auto_29259 ) ) ( not ( = ?auto_29256 ?auto_29260 ) ) ( not ( = ?auto_29256 ?auto_29261 ) ) ( not ( = ?auto_29257 ?auto_29258 ) ) ( not ( = ?auto_29257 ?auto_29259 ) ) ( not ( = ?auto_29257 ?auto_29260 ) ) ( not ( = ?auto_29257 ?auto_29261 ) ) ( not ( = ?auto_29258 ?auto_29259 ) ) ( not ( = ?auto_29258 ?auto_29260 ) ) ( not ( = ?auto_29258 ?auto_29261 ) ) ( not ( = ?auto_29259 ?auto_29260 ) ) ( not ( = ?auto_29259 ?auto_29261 ) ) ( not ( = ?auto_29260 ?auto_29261 ) ) ( ON ?auto_29259 ?auto_29260 ) ( ON ?auto_29258 ?auto_29259 ) ( CLEAR ?auto_29256 ) ( ON ?auto_29257 ?auto_29258 ) ( CLEAR ?auto_29257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29255 ?auto_29256 ?auto_29257 )
      ( MAKE-6PILE ?auto_29255 ?auto_29256 ?auto_29257 ?auto_29258 ?auto_29259 ?auto_29260 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_29268 - BLOCK
      ?auto_29269 - BLOCK
      ?auto_29270 - BLOCK
      ?auto_29271 - BLOCK
      ?auto_29272 - BLOCK
      ?auto_29273 - BLOCK
    )
    :vars
    (
      ?auto_29274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29273 ?auto_29274 ) ( ON-TABLE ?auto_29268 ) ( not ( = ?auto_29268 ?auto_29269 ) ) ( not ( = ?auto_29268 ?auto_29270 ) ) ( not ( = ?auto_29268 ?auto_29271 ) ) ( not ( = ?auto_29268 ?auto_29272 ) ) ( not ( = ?auto_29268 ?auto_29273 ) ) ( not ( = ?auto_29268 ?auto_29274 ) ) ( not ( = ?auto_29269 ?auto_29270 ) ) ( not ( = ?auto_29269 ?auto_29271 ) ) ( not ( = ?auto_29269 ?auto_29272 ) ) ( not ( = ?auto_29269 ?auto_29273 ) ) ( not ( = ?auto_29269 ?auto_29274 ) ) ( not ( = ?auto_29270 ?auto_29271 ) ) ( not ( = ?auto_29270 ?auto_29272 ) ) ( not ( = ?auto_29270 ?auto_29273 ) ) ( not ( = ?auto_29270 ?auto_29274 ) ) ( not ( = ?auto_29271 ?auto_29272 ) ) ( not ( = ?auto_29271 ?auto_29273 ) ) ( not ( = ?auto_29271 ?auto_29274 ) ) ( not ( = ?auto_29272 ?auto_29273 ) ) ( not ( = ?auto_29272 ?auto_29274 ) ) ( not ( = ?auto_29273 ?auto_29274 ) ) ( ON ?auto_29272 ?auto_29273 ) ( ON ?auto_29271 ?auto_29272 ) ( ON ?auto_29270 ?auto_29271 ) ( CLEAR ?auto_29268 ) ( ON ?auto_29269 ?auto_29270 ) ( CLEAR ?auto_29269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29268 ?auto_29269 )
      ( MAKE-6PILE ?auto_29268 ?auto_29269 ?auto_29270 ?auto_29271 ?auto_29272 ?auto_29273 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_29281 - BLOCK
      ?auto_29282 - BLOCK
      ?auto_29283 - BLOCK
      ?auto_29284 - BLOCK
      ?auto_29285 - BLOCK
      ?auto_29286 - BLOCK
    )
    :vars
    (
      ?auto_29287 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29286 ?auto_29287 ) ( ON-TABLE ?auto_29281 ) ( not ( = ?auto_29281 ?auto_29282 ) ) ( not ( = ?auto_29281 ?auto_29283 ) ) ( not ( = ?auto_29281 ?auto_29284 ) ) ( not ( = ?auto_29281 ?auto_29285 ) ) ( not ( = ?auto_29281 ?auto_29286 ) ) ( not ( = ?auto_29281 ?auto_29287 ) ) ( not ( = ?auto_29282 ?auto_29283 ) ) ( not ( = ?auto_29282 ?auto_29284 ) ) ( not ( = ?auto_29282 ?auto_29285 ) ) ( not ( = ?auto_29282 ?auto_29286 ) ) ( not ( = ?auto_29282 ?auto_29287 ) ) ( not ( = ?auto_29283 ?auto_29284 ) ) ( not ( = ?auto_29283 ?auto_29285 ) ) ( not ( = ?auto_29283 ?auto_29286 ) ) ( not ( = ?auto_29283 ?auto_29287 ) ) ( not ( = ?auto_29284 ?auto_29285 ) ) ( not ( = ?auto_29284 ?auto_29286 ) ) ( not ( = ?auto_29284 ?auto_29287 ) ) ( not ( = ?auto_29285 ?auto_29286 ) ) ( not ( = ?auto_29285 ?auto_29287 ) ) ( not ( = ?auto_29286 ?auto_29287 ) ) ( ON ?auto_29285 ?auto_29286 ) ( ON ?auto_29284 ?auto_29285 ) ( ON ?auto_29283 ?auto_29284 ) ( CLEAR ?auto_29281 ) ( ON ?auto_29282 ?auto_29283 ) ( CLEAR ?auto_29282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29281 ?auto_29282 )
      ( MAKE-6PILE ?auto_29281 ?auto_29282 ?auto_29283 ?auto_29284 ?auto_29285 ?auto_29286 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_29294 - BLOCK
      ?auto_29295 - BLOCK
      ?auto_29296 - BLOCK
      ?auto_29297 - BLOCK
      ?auto_29298 - BLOCK
      ?auto_29299 - BLOCK
    )
    :vars
    (
      ?auto_29300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29299 ?auto_29300 ) ( not ( = ?auto_29294 ?auto_29295 ) ) ( not ( = ?auto_29294 ?auto_29296 ) ) ( not ( = ?auto_29294 ?auto_29297 ) ) ( not ( = ?auto_29294 ?auto_29298 ) ) ( not ( = ?auto_29294 ?auto_29299 ) ) ( not ( = ?auto_29294 ?auto_29300 ) ) ( not ( = ?auto_29295 ?auto_29296 ) ) ( not ( = ?auto_29295 ?auto_29297 ) ) ( not ( = ?auto_29295 ?auto_29298 ) ) ( not ( = ?auto_29295 ?auto_29299 ) ) ( not ( = ?auto_29295 ?auto_29300 ) ) ( not ( = ?auto_29296 ?auto_29297 ) ) ( not ( = ?auto_29296 ?auto_29298 ) ) ( not ( = ?auto_29296 ?auto_29299 ) ) ( not ( = ?auto_29296 ?auto_29300 ) ) ( not ( = ?auto_29297 ?auto_29298 ) ) ( not ( = ?auto_29297 ?auto_29299 ) ) ( not ( = ?auto_29297 ?auto_29300 ) ) ( not ( = ?auto_29298 ?auto_29299 ) ) ( not ( = ?auto_29298 ?auto_29300 ) ) ( not ( = ?auto_29299 ?auto_29300 ) ) ( ON ?auto_29298 ?auto_29299 ) ( ON ?auto_29297 ?auto_29298 ) ( ON ?auto_29296 ?auto_29297 ) ( ON ?auto_29295 ?auto_29296 ) ( ON ?auto_29294 ?auto_29295 ) ( CLEAR ?auto_29294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29294 )
      ( MAKE-6PILE ?auto_29294 ?auto_29295 ?auto_29296 ?auto_29297 ?auto_29298 ?auto_29299 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_29307 - BLOCK
      ?auto_29308 - BLOCK
      ?auto_29309 - BLOCK
      ?auto_29310 - BLOCK
      ?auto_29311 - BLOCK
      ?auto_29312 - BLOCK
    )
    :vars
    (
      ?auto_29313 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29312 ?auto_29313 ) ( not ( = ?auto_29307 ?auto_29308 ) ) ( not ( = ?auto_29307 ?auto_29309 ) ) ( not ( = ?auto_29307 ?auto_29310 ) ) ( not ( = ?auto_29307 ?auto_29311 ) ) ( not ( = ?auto_29307 ?auto_29312 ) ) ( not ( = ?auto_29307 ?auto_29313 ) ) ( not ( = ?auto_29308 ?auto_29309 ) ) ( not ( = ?auto_29308 ?auto_29310 ) ) ( not ( = ?auto_29308 ?auto_29311 ) ) ( not ( = ?auto_29308 ?auto_29312 ) ) ( not ( = ?auto_29308 ?auto_29313 ) ) ( not ( = ?auto_29309 ?auto_29310 ) ) ( not ( = ?auto_29309 ?auto_29311 ) ) ( not ( = ?auto_29309 ?auto_29312 ) ) ( not ( = ?auto_29309 ?auto_29313 ) ) ( not ( = ?auto_29310 ?auto_29311 ) ) ( not ( = ?auto_29310 ?auto_29312 ) ) ( not ( = ?auto_29310 ?auto_29313 ) ) ( not ( = ?auto_29311 ?auto_29312 ) ) ( not ( = ?auto_29311 ?auto_29313 ) ) ( not ( = ?auto_29312 ?auto_29313 ) ) ( ON ?auto_29311 ?auto_29312 ) ( ON ?auto_29310 ?auto_29311 ) ( ON ?auto_29309 ?auto_29310 ) ( ON ?auto_29308 ?auto_29309 ) ( ON ?auto_29307 ?auto_29308 ) ( CLEAR ?auto_29307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29307 )
      ( MAKE-6PILE ?auto_29307 ?auto_29308 ?auto_29309 ?auto_29310 ?auto_29311 ?auto_29312 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_29321 - BLOCK
      ?auto_29322 - BLOCK
      ?auto_29323 - BLOCK
      ?auto_29324 - BLOCK
      ?auto_29325 - BLOCK
      ?auto_29326 - BLOCK
      ?auto_29327 - BLOCK
    )
    :vars
    (
      ?auto_29328 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_29326 ) ( ON ?auto_29327 ?auto_29328 ) ( CLEAR ?auto_29327 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29321 ) ( ON ?auto_29322 ?auto_29321 ) ( ON ?auto_29323 ?auto_29322 ) ( ON ?auto_29324 ?auto_29323 ) ( ON ?auto_29325 ?auto_29324 ) ( ON ?auto_29326 ?auto_29325 ) ( not ( = ?auto_29321 ?auto_29322 ) ) ( not ( = ?auto_29321 ?auto_29323 ) ) ( not ( = ?auto_29321 ?auto_29324 ) ) ( not ( = ?auto_29321 ?auto_29325 ) ) ( not ( = ?auto_29321 ?auto_29326 ) ) ( not ( = ?auto_29321 ?auto_29327 ) ) ( not ( = ?auto_29321 ?auto_29328 ) ) ( not ( = ?auto_29322 ?auto_29323 ) ) ( not ( = ?auto_29322 ?auto_29324 ) ) ( not ( = ?auto_29322 ?auto_29325 ) ) ( not ( = ?auto_29322 ?auto_29326 ) ) ( not ( = ?auto_29322 ?auto_29327 ) ) ( not ( = ?auto_29322 ?auto_29328 ) ) ( not ( = ?auto_29323 ?auto_29324 ) ) ( not ( = ?auto_29323 ?auto_29325 ) ) ( not ( = ?auto_29323 ?auto_29326 ) ) ( not ( = ?auto_29323 ?auto_29327 ) ) ( not ( = ?auto_29323 ?auto_29328 ) ) ( not ( = ?auto_29324 ?auto_29325 ) ) ( not ( = ?auto_29324 ?auto_29326 ) ) ( not ( = ?auto_29324 ?auto_29327 ) ) ( not ( = ?auto_29324 ?auto_29328 ) ) ( not ( = ?auto_29325 ?auto_29326 ) ) ( not ( = ?auto_29325 ?auto_29327 ) ) ( not ( = ?auto_29325 ?auto_29328 ) ) ( not ( = ?auto_29326 ?auto_29327 ) ) ( not ( = ?auto_29326 ?auto_29328 ) ) ( not ( = ?auto_29327 ?auto_29328 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29327 ?auto_29328 )
      ( !STACK ?auto_29327 ?auto_29326 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_29336 - BLOCK
      ?auto_29337 - BLOCK
      ?auto_29338 - BLOCK
      ?auto_29339 - BLOCK
      ?auto_29340 - BLOCK
      ?auto_29341 - BLOCK
      ?auto_29342 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_29341 ) ( ON-TABLE ?auto_29342 ) ( CLEAR ?auto_29342 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29336 ) ( ON ?auto_29337 ?auto_29336 ) ( ON ?auto_29338 ?auto_29337 ) ( ON ?auto_29339 ?auto_29338 ) ( ON ?auto_29340 ?auto_29339 ) ( ON ?auto_29341 ?auto_29340 ) ( not ( = ?auto_29336 ?auto_29337 ) ) ( not ( = ?auto_29336 ?auto_29338 ) ) ( not ( = ?auto_29336 ?auto_29339 ) ) ( not ( = ?auto_29336 ?auto_29340 ) ) ( not ( = ?auto_29336 ?auto_29341 ) ) ( not ( = ?auto_29336 ?auto_29342 ) ) ( not ( = ?auto_29337 ?auto_29338 ) ) ( not ( = ?auto_29337 ?auto_29339 ) ) ( not ( = ?auto_29337 ?auto_29340 ) ) ( not ( = ?auto_29337 ?auto_29341 ) ) ( not ( = ?auto_29337 ?auto_29342 ) ) ( not ( = ?auto_29338 ?auto_29339 ) ) ( not ( = ?auto_29338 ?auto_29340 ) ) ( not ( = ?auto_29338 ?auto_29341 ) ) ( not ( = ?auto_29338 ?auto_29342 ) ) ( not ( = ?auto_29339 ?auto_29340 ) ) ( not ( = ?auto_29339 ?auto_29341 ) ) ( not ( = ?auto_29339 ?auto_29342 ) ) ( not ( = ?auto_29340 ?auto_29341 ) ) ( not ( = ?auto_29340 ?auto_29342 ) ) ( not ( = ?auto_29341 ?auto_29342 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_29342 )
      ( !STACK ?auto_29342 ?auto_29341 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_29350 - BLOCK
      ?auto_29351 - BLOCK
      ?auto_29352 - BLOCK
      ?auto_29353 - BLOCK
      ?auto_29354 - BLOCK
      ?auto_29355 - BLOCK
      ?auto_29356 - BLOCK
    )
    :vars
    (
      ?auto_29357 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29356 ?auto_29357 ) ( ON-TABLE ?auto_29350 ) ( ON ?auto_29351 ?auto_29350 ) ( ON ?auto_29352 ?auto_29351 ) ( ON ?auto_29353 ?auto_29352 ) ( ON ?auto_29354 ?auto_29353 ) ( not ( = ?auto_29350 ?auto_29351 ) ) ( not ( = ?auto_29350 ?auto_29352 ) ) ( not ( = ?auto_29350 ?auto_29353 ) ) ( not ( = ?auto_29350 ?auto_29354 ) ) ( not ( = ?auto_29350 ?auto_29355 ) ) ( not ( = ?auto_29350 ?auto_29356 ) ) ( not ( = ?auto_29350 ?auto_29357 ) ) ( not ( = ?auto_29351 ?auto_29352 ) ) ( not ( = ?auto_29351 ?auto_29353 ) ) ( not ( = ?auto_29351 ?auto_29354 ) ) ( not ( = ?auto_29351 ?auto_29355 ) ) ( not ( = ?auto_29351 ?auto_29356 ) ) ( not ( = ?auto_29351 ?auto_29357 ) ) ( not ( = ?auto_29352 ?auto_29353 ) ) ( not ( = ?auto_29352 ?auto_29354 ) ) ( not ( = ?auto_29352 ?auto_29355 ) ) ( not ( = ?auto_29352 ?auto_29356 ) ) ( not ( = ?auto_29352 ?auto_29357 ) ) ( not ( = ?auto_29353 ?auto_29354 ) ) ( not ( = ?auto_29353 ?auto_29355 ) ) ( not ( = ?auto_29353 ?auto_29356 ) ) ( not ( = ?auto_29353 ?auto_29357 ) ) ( not ( = ?auto_29354 ?auto_29355 ) ) ( not ( = ?auto_29354 ?auto_29356 ) ) ( not ( = ?auto_29354 ?auto_29357 ) ) ( not ( = ?auto_29355 ?auto_29356 ) ) ( not ( = ?auto_29355 ?auto_29357 ) ) ( not ( = ?auto_29356 ?auto_29357 ) ) ( CLEAR ?auto_29354 ) ( ON ?auto_29355 ?auto_29356 ) ( CLEAR ?auto_29355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_29350 ?auto_29351 ?auto_29352 ?auto_29353 ?auto_29354 ?auto_29355 )
      ( MAKE-7PILE ?auto_29350 ?auto_29351 ?auto_29352 ?auto_29353 ?auto_29354 ?auto_29355 ?auto_29356 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_29365 - BLOCK
      ?auto_29366 - BLOCK
      ?auto_29367 - BLOCK
      ?auto_29368 - BLOCK
      ?auto_29369 - BLOCK
      ?auto_29370 - BLOCK
      ?auto_29371 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29371 ) ( ON-TABLE ?auto_29365 ) ( ON ?auto_29366 ?auto_29365 ) ( ON ?auto_29367 ?auto_29366 ) ( ON ?auto_29368 ?auto_29367 ) ( ON ?auto_29369 ?auto_29368 ) ( not ( = ?auto_29365 ?auto_29366 ) ) ( not ( = ?auto_29365 ?auto_29367 ) ) ( not ( = ?auto_29365 ?auto_29368 ) ) ( not ( = ?auto_29365 ?auto_29369 ) ) ( not ( = ?auto_29365 ?auto_29370 ) ) ( not ( = ?auto_29365 ?auto_29371 ) ) ( not ( = ?auto_29366 ?auto_29367 ) ) ( not ( = ?auto_29366 ?auto_29368 ) ) ( not ( = ?auto_29366 ?auto_29369 ) ) ( not ( = ?auto_29366 ?auto_29370 ) ) ( not ( = ?auto_29366 ?auto_29371 ) ) ( not ( = ?auto_29367 ?auto_29368 ) ) ( not ( = ?auto_29367 ?auto_29369 ) ) ( not ( = ?auto_29367 ?auto_29370 ) ) ( not ( = ?auto_29367 ?auto_29371 ) ) ( not ( = ?auto_29368 ?auto_29369 ) ) ( not ( = ?auto_29368 ?auto_29370 ) ) ( not ( = ?auto_29368 ?auto_29371 ) ) ( not ( = ?auto_29369 ?auto_29370 ) ) ( not ( = ?auto_29369 ?auto_29371 ) ) ( not ( = ?auto_29370 ?auto_29371 ) ) ( CLEAR ?auto_29369 ) ( ON ?auto_29370 ?auto_29371 ) ( CLEAR ?auto_29370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_29365 ?auto_29366 ?auto_29367 ?auto_29368 ?auto_29369 ?auto_29370 )
      ( MAKE-7PILE ?auto_29365 ?auto_29366 ?auto_29367 ?auto_29368 ?auto_29369 ?auto_29370 ?auto_29371 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_29379 - BLOCK
      ?auto_29380 - BLOCK
      ?auto_29381 - BLOCK
      ?auto_29382 - BLOCK
      ?auto_29383 - BLOCK
      ?auto_29384 - BLOCK
      ?auto_29385 - BLOCK
    )
    :vars
    (
      ?auto_29386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29385 ?auto_29386 ) ( ON-TABLE ?auto_29379 ) ( ON ?auto_29380 ?auto_29379 ) ( ON ?auto_29381 ?auto_29380 ) ( ON ?auto_29382 ?auto_29381 ) ( not ( = ?auto_29379 ?auto_29380 ) ) ( not ( = ?auto_29379 ?auto_29381 ) ) ( not ( = ?auto_29379 ?auto_29382 ) ) ( not ( = ?auto_29379 ?auto_29383 ) ) ( not ( = ?auto_29379 ?auto_29384 ) ) ( not ( = ?auto_29379 ?auto_29385 ) ) ( not ( = ?auto_29379 ?auto_29386 ) ) ( not ( = ?auto_29380 ?auto_29381 ) ) ( not ( = ?auto_29380 ?auto_29382 ) ) ( not ( = ?auto_29380 ?auto_29383 ) ) ( not ( = ?auto_29380 ?auto_29384 ) ) ( not ( = ?auto_29380 ?auto_29385 ) ) ( not ( = ?auto_29380 ?auto_29386 ) ) ( not ( = ?auto_29381 ?auto_29382 ) ) ( not ( = ?auto_29381 ?auto_29383 ) ) ( not ( = ?auto_29381 ?auto_29384 ) ) ( not ( = ?auto_29381 ?auto_29385 ) ) ( not ( = ?auto_29381 ?auto_29386 ) ) ( not ( = ?auto_29382 ?auto_29383 ) ) ( not ( = ?auto_29382 ?auto_29384 ) ) ( not ( = ?auto_29382 ?auto_29385 ) ) ( not ( = ?auto_29382 ?auto_29386 ) ) ( not ( = ?auto_29383 ?auto_29384 ) ) ( not ( = ?auto_29383 ?auto_29385 ) ) ( not ( = ?auto_29383 ?auto_29386 ) ) ( not ( = ?auto_29384 ?auto_29385 ) ) ( not ( = ?auto_29384 ?auto_29386 ) ) ( not ( = ?auto_29385 ?auto_29386 ) ) ( ON ?auto_29384 ?auto_29385 ) ( CLEAR ?auto_29382 ) ( ON ?auto_29383 ?auto_29384 ) ( CLEAR ?auto_29383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_29379 ?auto_29380 ?auto_29381 ?auto_29382 ?auto_29383 )
      ( MAKE-7PILE ?auto_29379 ?auto_29380 ?auto_29381 ?auto_29382 ?auto_29383 ?auto_29384 ?auto_29385 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_29394 - BLOCK
      ?auto_29395 - BLOCK
      ?auto_29396 - BLOCK
      ?auto_29397 - BLOCK
      ?auto_29398 - BLOCK
      ?auto_29399 - BLOCK
      ?auto_29400 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29400 ) ( ON-TABLE ?auto_29394 ) ( ON ?auto_29395 ?auto_29394 ) ( ON ?auto_29396 ?auto_29395 ) ( ON ?auto_29397 ?auto_29396 ) ( not ( = ?auto_29394 ?auto_29395 ) ) ( not ( = ?auto_29394 ?auto_29396 ) ) ( not ( = ?auto_29394 ?auto_29397 ) ) ( not ( = ?auto_29394 ?auto_29398 ) ) ( not ( = ?auto_29394 ?auto_29399 ) ) ( not ( = ?auto_29394 ?auto_29400 ) ) ( not ( = ?auto_29395 ?auto_29396 ) ) ( not ( = ?auto_29395 ?auto_29397 ) ) ( not ( = ?auto_29395 ?auto_29398 ) ) ( not ( = ?auto_29395 ?auto_29399 ) ) ( not ( = ?auto_29395 ?auto_29400 ) ) ( not ( = ?auto_29396 ?auto_29397 ) ) ( not ( = ?auto_29396 ?auto_29398 ) ) ( not ( = ?auto_29396 ?auto_29399 ) ) ( not ( = ?auto_29396 ?auto_29400 ) ) ( not ( = ?auto_29397 ?auto_29398 ) ) ( not ( = ?auto_29397 ?auto_29399 ) ) ( not ( = ?auto_29397 ?auto_29400 ) ) ( not ( = ?auto_29398 ?auto_29399 ) ) ( not ( = ?auto_29398 ?auto_29400 ) ) ( not ( = ?auto_29399 ?auto_29400 ) ) ( ON ?auto_29399 ?auto_29400 ) ( CLEAR ?auto_29397 ) ( ON ?auto_29398 ?auto_29399 ) ( CLEAR ?auto_29398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_29394 ?auto_29395 ?auto_29396 ?auto_29397 ?auto_29398 )
      ( MAKE-7PILE ?auto_29394 ?auto_29395 ?auto_29396 ?auto_29397 ?auto_29398 ?auto_29399 ?auto_29400 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_29408 - BLOCK
      ?auto_29409 - BLOCK
      ?auto_29410 - BLOCK
      ?auto_29411 - BLOCK
      ?auto_29412 - BLOCK
      ?auto_29413 - BLOCK
      ?auto_29414 - BLOCK
    )
    :vars
    (
      ?auto_29415 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29414 ?auto_29415 ) ( ON-TABLE ?auto_29408 ) ( ON ?auto_29409 ?auto_29408 ) ( ON ?auto_29410 ?auto_29409 ) ( not ( = ?auto_29408 ?auto_29409 ) ) ( not ( = ?auto_29408 ?auto_29410 ) ) ( not ( = ?auto_29408 ?auto_29411 ) ) ( not ( = ?auto_29408 ?auto_29412 ) ) ( not ( = ?auto_29408 ?auto_29413 ) ) ( not ( = ?auto_29408 ?auto_29414 ) ) ( not ( = ?auto_29408 ?auto_29415 ) ) ( not ( = ?auto_29409 ?auto_29410 ) ) ( not ( = ?auto_29409 ?auto_29411 ) ) ( not ( = ?auto_29409 ?auto_29412 ) ) ( not ( = ?auto_29409 ?auto_29413 ) ) ( not ( = ?auto_29409 ?auto_29414 ) ) ( not ( = ?auto_29409 ?auto_29415 ) ) ( not ( = ?auto_29410 ?auto_29411 ) ) ( not ( = ?auto_29410 ?auto_29412 ) ) ( not ( = ?auto_29410 ?auto_29413 ) ) ( not ( = ?auto_29410 ?auto_29414 ) ) ( not ( = ?auto_29410 ?auto_29415 ) ) ( not ( = ?auto_29411 ?auto_29412 ) ) ( not ( = ?auto_29411 ?auto_29413 ) ) ( not ( = ?auto_29411 ?auto_29414 ) ) ( not ( = ?auto_29411 ?auto_29415 ) ) ( not ( = ?auto_29412 ?auto_29413 ) ) ( not ( = ?auto_29412 ?auto_29414 ) ) ( not ( = ?auto_29412 ?auto_29415 ) ) ( not ( = ?auto_29413 ?auto_29414 ) ) ( not ( = ?auto_29413 ?auto_29415 ) ) ( not ( = ?auto_29414 ?auto_29415 ) ) ( ON ?auto_29413 ?auto_29414 ) ( ON ?auto_29412 ?auto_29413 ) ( CLEAR ?auto_29410 ) ( ON ?auto_29411 ?auto_29412 ) ( CLEAR ?auto_29411 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29408 ?auto_29409 ?auto_29410 ?auto_29411 )
      ( MAKE-7PILE ?auto_29408 ?auto_29409 ?auto_29410 ?auto_29411 ?auto_29412 ?auto_29413 ?auto_29414 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_29423 - BLOCK
      ?auto_29424 - BLOCK
      ?auto_29425 - BLOCK
      ?auto_29426 - BLOCK
      ?auto_29427 - BLOCK
      ?auto_29428 - BLOCK
      ?auto_29429 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29429 ) ( ON-TABLE ?auto_29423 ) ( ON ?auto_29424 ?auto_29423 ) ( ON ?auto_29425 ?auto_29424 ) ( not ( = ?auto_29423 ?auto_29424 ) ) ( not ( = ?auto_29423 ?auto_29425 ) ) ( not ( = ?auto_29423 ?auto_29426 ) ) ( not ( = ?auto_29423 ?auto_29427 ) ) ( not ( = ?auto_29423 ?auto_29428 ) ) ( not ( = ?auto_29423 ?auto_29429 ) ) ( not ( = ?auto_29424 ?auto_29425 ) ) ( not ( = ?auto_29424 ?auto_29426 ) ) ( not ( = ?auto_29424 ?auto_29427 ) ) ( not ( = ?auto_29424 ?auto_29428 ) ) ( not ( = ?auto_29424 ?auto_29429 ) ) ( not ( = ?auto_29425 ?auto_29426 ) ) ( not ( = ?auto_29425 ?auto_29427 ) ) ( not ( = ?auto_29425 ?auto_29428 ) ) ( not ( = ?auto_29425 ?auto_29429 ) ) ( not ( = ?auto_29426 ?auto_29427 ) ) ( not ( = ?auto_29426 ?auto_29428 ) ) ( not ( = ?auto_29426 ?auto_29429 ) ) ( not ( = ?auto_29427 ?auto_29428 ) ) ( not ( = ?auto_29427 ?auto_29429 ) ) ( not ( = ?auto_29428 ?auto_29429 ) ) ( ON ?auto_29428 ?auto_29429 ) ( ON ?auto_29427 ?auto_29428 ) ( CLEAR ?auto_29425 ) ( ON ?auto_29426 ?auto_29427 ) ( CLEAR ?auto_29426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29423 ?auto_29424 ?auto_29425 ?auto_29426 )
      ( MAKE-7PILE ?auto_29423 ?auto_29424 ?auto_29425 ?auto_29426 ?auto_29427 ?auto_29428 ?auto_29429 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_29437 - BLOCK
      ?auto_29438 - BLOCK
      ?auto_29439 - BLOCK
      ?auto_29440 - BLOCK
      ?auto_29441 - BLOCK
      ?auto_29442 - BLOCK
      ?auto_29443 - BLOCK
    )
    :vars
    (
      ?auto_29444 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29443 ?auto_29444 ) ( ON-TABLE ?auto_29437 ) ( ON ?auto_29438 ?auto_29437 ) ( not ( = ?auto_29437 ?auto_29438 ) ) ( not ( = ?auto_29437 ?auto_29439 ) ) ( not ( = ?auto_29437 ?auto_29440 ) ) ( not ( = ?auto_29437 ?auto_29441 ) ) ( not ( = ?auto_29437 ?auto_29442 ) ) ( not ( = ?auto_29437 ?auto_29443 ) ) ( not ( = ?auto_29437 ?auto_29444 ) ) ( not ( = ?auto_29438 ?auto_29439 ) ) ( not ( = ?auto_29438 ?auto_29440 ) ) ( not ( = ?auto_29438 ?auto_29441 ) ) ( not ( = ?auto_29438 ?auto_29442 ) ) ( not ( = ?auto_29438 ?auto_29443 ) ) ( not ( = ?auto_29438 ?auto_29444 ) ) ( not ( = ?auto_29439 ?auto_29440 ) ) ( not ( = ?auto_29439 ?auto_29441 ) ) ( not ( = ?auto_29439 ?auto_29442 ) ) ( not ( = ?auto_29439 ?auto_29443 ) ) ( not ( = ?auto_29439 ?auto_29444 ) ) ( not ( = ?auto_29440 ?auto_29441 ) ) ( not ( = ?auto_29440 ?auto_29442 ) ) ( not ( = ?auto_29440 ?auto_29443 ) ) ( not ( = ?auto_29440 ?auto_29444 ) ) ( not ( = ?auto_29441 ?auto_29442 ) ) ( not ( = ?auto_29441 ?auto_29443 ) ) ( not ( = ?auto_29441 ?auto_29444 ) ) ( not ( = ?auto_29442 ?auto_29443 ) ) ( not ( = ?auto_29442 ?auto_29444 ) ) ( not ( = ?auto_29443 ?auto_29444 ) ) ( ON ?auto_29442 ?auto_29443 ) ( ON ?auto_29441 ?auto_29442 ) ( ON ?auto_29440 ?auto_29441 ) ( CLEAR ?auto_29438 ) ( ON ?auto_29439 ?auto_29440 ) ( CLEAR ?auto_29439 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29437 ?auto_29438 ?auto_29439 )
      ( MAKE-7PILE ?auto_29437 ?auto_29438 ?auto_29439 ?auto_29440 ?auto_29441 ?auto_29442 ?auto_29443 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_29452 - BLOCK
      ?auto_29453 - BLOCK
      ?auto_29454 - BLOCK
      ?auto_29455 - BLOCK
      ?auto_29456 - BLOCK
      ?auto_29457 - BLOCK
      ?auto_29458 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29458 ) ( ON-TABLE ?auto_29452 ) ( ON ?auto_29453 ?auto_29452 ) ( not ( = ?auto_29452 ?auto_29453 ) ) ( not ( = ?auto_29452 ?auto_29454 ) ) ( not ( = ?auto_29452 ?auto_29455 ) ) ( not ( = ?auto_29452 ?auto_29456 ) ) ( not ( = ?auto_29452 ?auto_29457 ) ) ( not ( = ?auto_29452 ?auto_29458 ) ) ( not ( = ?auto_29453 ?auto_29454 ) ) ( not ( = ?auto_29453 ?auto_29455 ) ) ( not ( = ?auto_29453 ?auto_29456 ) ) ( not ( = ?auto_29453 ?auto_29457 ) ) ( not ( = ?auto_29453 ?auto_29458 ) ) ( not ( = ?auto_29454 ?auto_29455 ) ) ( not ( = ?auto_29454 ?auto_29456 ) ) ( not ( = ?auto_29454 ?auto_29457 ) ) ( not ( = ?auto_29454 ?auto_29458 ) ) ( not ( = ?auto_29455 ?auto_29456 ) ) ( not ( = ?auto_29455 ?auto_29457 ) ) ( not ( = ?auto_29455 ?auto_29458 ) ) ( not ( = ?auto_29456 ?auto_29457 ) ) ( not ( = ?auto_29456 ?auto_29458 ) ) ( not ( = ?auto_29457 ?auto_29458 ) ) ( ON ?auto_29457 ?auto_29458 ) ( ON ?auto_29456 ?auto_29457 ) ( ON ?auto_29455 ?auto_29456 ) ( CLEAR ?auto_29453 ) ( ON ?auto_29454 ?auto_29455 ) ( CLEAR ?auto_29454 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29452 ?auto_29453 ?auto_29454 )
      ( MAKE-7PILE ?auto_29452 ?auto_29453 ?auto_29454 ?auto_29455 ?auto_29456 ?auto_29457 ?auto_29458 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_29466 - BLOCK
      ?auto_29467 - BLOCK
      ?auto_29468 - BLOCK
      ?auto_29469 - BLOCK
      ?auto_29470 - BLOCK
      ?auto_29471 - BLOCK
      ?auto_29472 - BLOCK
    )
    :vars
    (
      ?auto_29473 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29472 ?auto_29473 ) ( ON-TABLE ?auto_29466 ) ( not ( = ?auto_29466 ?auto_29467 ) ) ( not ( = ?auto_29466 ?auto_29468 ) ) ( not ( = ?auto_29466 ?auto_29469 ) ) ( not ( = ?auto_29466 ?auto_29470 ) ) ( not ( = ?auto_29466 ?auto_29471 ) ) ( not ( = ?auto_29466 ?auto_29472 ) ) ( not ( = ?auto_29466 ?auto_29473 ) ) ( not ( = ?auto_29467 ?auto_29468 ) ) ( not ( = ?auto_29467 ?auto_29469 ) ) ( not ( = ?auto_29467 ?auto_29470 ) ) ( not ( = ?auto_29467 ?auto_29471 ) ) ( not ( = ?auto_29467 ?auto_29472 ) ) ( not ( = ?auto_29467 ?auto_29473 ) ) ( not ( = ?auto_29468 ?auto_29469 ) ) ( not ( = ?auto_29468 ?auto_29470 ) ) ( not ( = ?auto_29468 ?auto_29471 ) ) ( not ( = ?auto_29468 ?auto_29472 ) ) ( not ( = ?auto_29468 ?auto_29473 ) ) ( not ( = ?auto_29469 ?auto_29470 ) ) ( not ( = ?auto_29469 ?auto_29471 ) ) ( not ( = ?auto_29469 ?auto_29472 ) ) ( not ( = ?auto_29469 ?auto_29473 ) ) ( not ( = ?auto_29470 ?auto_29471 ) ) ( not ( = ?auto_29470 ?auto_29472 ) ) ( not ( = ?auto_29470 ?auto_29473 ) ) ( not ( = ?auto_29471 ?auto_29472 ) ) ( not ( = ?auto_29471 ?auto_29473 ) ) ( not ( = ?auto_29472 ?auto_29473 ) ) ( ON ?auto_29471 ?auto_29472 ) ( ON ?auto_29470 ?auto_29471 ) ( ON ?auto_29469 ?auto_29470 ) ( ON ?auto_29468 ?auto_29469 ) ( CLEAR ?auto_29466 ) ( ON ?auto_29467 ?auto_29468 ) ( CLEAR ?auto_29467 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29466 ?auto_29467 )
      ( MAKE-7PILE ?auto_29466 ?auto_29467 ?auto_29468 ?auto_29469 ?auto_29470 ?auto_29471 ?auto_29472 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_29481 - BLOCK
      ?auto_29482 - BLOCK
      ?auto_29483 - BLOCK
      ?auto_29484 - BLOCK
      ?auto_29485 - BLOCK
      ?auto_29486 - BLOCK
      ?auto_29487 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29487 ) ( ON-TABLE ?auto_29481 ) ( not ( = ?auto_29481 ?auto_29482 ) ) ( not ( = ?auto_29481 ?auto_29483 ) ) ( not ( = ?auto_29481 ?auto_29484 ) ) ( not ( = ?auto_29481 ?auto_29485 ) ) ( not ( = ?auto_29481 ?auto_29486 ) ) ( not ( = ?auto_29481 ?auto_29487 ) ) ( not ( = ?auto_29482 ?auto_29483 ) ) ( not ( = ?auto_29482 ?auto_29484 ) ) ( not ( = ?auto_29482 ?auto_29485 ) ) ( not ( = ?auto_29482 ?auto_29486 ) ) ( not ( = ?auto_29482 ?auto_29487 ) ) ( not ( = ?auto_29483 ?auto_29484 ) ) ( not ( = ?auto_29483 ?auto_29485 ) ) ( not ( = ?auto_29483 ?auto_29486 ) ) ( not ( = ?auto_29483 ?auto_29487 ) ) ( not ( = ?auto_29484 ?auto_29485 ) ) ( not ( = ?auto_29484 ?auto_29486 ) ) ( not ( = ?auto_29484 ?auto_29487 ) ) ( not ( = ?auto_29485 ?auto_29486 ) ) ( not ( = ?auto_29485 ?auto_29487 ) ) ( not ( = ?auto_29486 ?auto_29487 ) ) ( ON ?auto_29486 ?auto_29487 ) ( ON ?auto_29485 ?auto_29486 ) ( ON ?auto_29484 ?auto_29485 ) ( ON ?auto_29483 ?auto_29484 ) ( CLEAR ?auto_29481 ) ( ON ?auto_29482 ?auto_29483 ) ( CLEAR ?auto_29482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29481 ?auto_29482 )
      ( MAKE-7PILE ?auto_29481 ?auto_29482 ?auto_29483 ?auto_29484 ?auto_29485 ?auto_29486 ?auto_29487 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_29495 - BLOCK
      ?auto_29496 - BLOCK
      ?auto_29497 - BLOCK
      ?auto_29498 - BLOCK
      ?auto_29499 - BLOCK
      ?auto_29500 - BLOCK
      ?auto_29501 - BLOCK
    )
    :vars
    (
      ?auto_29502 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29501 ?auto_29502 ) ( not ( = ?auto_29495 ?auto_29496 ) ) ( not ( = ?auto_29495 ?auto_29497 ) ) ( not ( = ?auto_29495 ?auto_29498 ) ) ( not ( = ?auto_29495 ?auto_29499 ) ) ( not ( = ?auto_29495 ?auto_29500 ) ) ( not ( = ?auto_29495 ?auto_29501 ) ) ( not ( = ?auto_29495 ?auto_29502 ) ) ( not ( = ?auto_29496 ?auto_29497 ) ) ( not ( = ?auto_29496 ?auto_29498 ) ) ( not ( = ?auto_29496 ?auto_29499 ) ) ( not ( = ?auto_29496 ?auto_29500 ) ) ( not ( = ?auto_29496 ?auto_29501 ) ) ( not ( = ?auto_29496 ?auto_29502 ) ) ( not ( = ?auto_29497 ?auto_29498 ) ) ( not ( = ?auto_29497 ?auto_29499 ) ) ( not ( = ?auto_29497 ?auto_29500 ) ) ( not ( = ?auto_29497 ?auto_29501 ) ) ( not ( = ?auto_29497 ?auto_29502 ) ) ( not ( = ?auto_29498 ?auto_29499 ) ) ( not ( = ?auto_29498 ?auto_29500 ) ) ( not ( = ?auto_29498 ?auto_29501 ) ) ( not ( = ?auto_29498 ?auto_29502 ) ) ( not ( = ?auto_29499 ?auto_29500 ) ) ( not ( = ?auto_29499 ?auto_29501 ) ) ( not ( = ?auto_29499 ?auto_29502 ) ) ( not ( = ?auto_29500 ?auto_29501 ) ) ( not ( = ?auto_29500 ?auto_29502 ) ) ( not ( = ?auto_29501 ?auto_29502 ) ) ( ON ?auto_29500 ?auto_29501 ) ( ON ?auto_29499 ?auto_29500 ) ( ON ?auto_29498 ?auto_29499 ) ( ON ?auto_29497 ?auto_29498 ) ( ON ?auto_29496 ?auto_29497 ) ( ON ?auto_29495 ?auto_29496 ) ( CLEAR ?auto_29495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29495 )
      ( MAKE-7PILE ?auto_29495 ?auto_29496 ?auto_29497 ?auto_29498 ?auto_29499 ?auto_29500 ?auto_29501 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_29510 - BLOCK
      ?auto_29511 - BLOCK
      ?auto_29512 - BLOCK
      ?auto_29513 - BLOCK
      ?auto_29514 - BLOCK
      ?auto_29515 - BLOCK
      ?auto_29516 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29516 ) ( not ( = ?auto_29510 ?auto_29511 ) ) ( not ( = ?auto_29510 ?auto_29512 ) ) ( not ( = ?auto_29510 ?auto_29513 ) ) ( not ( = ?auto_29510 ?auto_29514 ) ) ( not ( = ?auto_29510 ?auto_29515 ) ) ( not ( = ?auto_29510 ?auto_29516 ) ) ( not ( = ?auto_29511 ?auto_29512 ) ) ( not ( = ?auto_29511 ?auto_29513 ) ) ( not ( = ?auto_29511 ?auto_29514 ) ) ( not ( = ?auto_29511 ?auto_29515 ) ) ( not ( = ?auto_29511 ?auto_29516 ) ) ( not ( = ?auto_29512 ?auto_29513 ) ) ( not ( = ?auto_29512 ?auto_29514 ) ) ( not ( = ?auto_29512 ?auto_29515 ) ) ( not ( = ?auto_29512 ?auto_29516 ) ) ( not ( = ?auto_29513 ?auto_29514 ) ) ( not ( = ?auto_29513 ?auto_29515 ) ) ( not ( = ?auto_29513 ?auto_29516 ) ) ( not ( = ?auto_29514 ?auto_29515 ) ) ( not ( = ?auto_29514 ?auto_29516 ) ) ( not ( = ?auto_29515 ?auto_29516 ) ) ( ON ?auto_29515 ?auto_29516 ) ( ON ?auto_29514 ?auto_29515 ) ( ON ?auto_29513 ?auto_29514 ) ( ON ?auto_29512 ?auto_29513 ) ( ON ?auto_29511 ?auto_29512 ) ( ON ?auto_29510 ?auto_29511 ) ( CLEAR ?auto_29510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29510 )
      ( MAKE-7PILE ?auto_29510 ?auto_29511 ?auto_29512 ?auto_29513 ?auto_29514 ?auto_29515 ?auto_29516 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_29524 - BLOCK
      ?auto_29525 - BLOCK
      ?auto_29526 - BLOCK
      ?auto_29527 - BLOCK
      ?auto_29528 - BLOCK
      ?auto_29529 - BLOCK
      ?auto_29530 - BLOCK
    )
    :vars
    (
      ?auto_29531 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29524 ?auto_29525 ) ) ( not ( = ?auto_29524 ?auto_29526 ) ) ( not ( = ?auto_29524 ?auto_29527 ) ) ( not ( = ?auto_29524 ?auto_29528 ) ) ( not ( = ?auto_29524 ?auto_29529 ) ) ( not ( = ?auto_29524 ?auto_29530 ) ) ( not ( = ?auto_29525 ?auto_29526 ) ) ( not ( = ?auto_29525 ?auto_29527 ) ) ( not ( = ?auto_29525 ?auto_29528 ) ) ( not ( = ?auto_29525 ?auto_29529 ) ) ( not ( = ?auto_29525 ?auto_29530 ) ) ( not ( = ?auto_29526 ?auto_29527 ) ) ( not ( = ?auto_29526 ?auto_29528 ) ) ( not ( = ?auto_29526 ?auto_29529 ) ) ( not ( = ?auto_29526 ?auto_29530 ) ) ( not ( = ?auto_29527 ?auto_29528 ) ) ( not ( = ?auto_29527 ?auto_29529 ) ) ( not ( = ?auto_29527 ?auto_29530 ) ) ( not ( = ?auto_29528 ?auto_29529 ) ) ( not ( = ?auto_29528 ?auto_29530 ) ) ( not ( = ?auto_29529 ?auto_29530 ) ) ( ON ?auto_29524 ?auto_29531 ) ( not ( = ?auto_29530 ?auto_29531 ) ) ( not ( = ?auto_29529 ?auto_29531 ) ) ( not ( = ?auto_29528 ?auto_29531 ) ) ( not ( = ?auto_29527 ?auto_29531 ) ) ( not ( = ?auto_29526 ?auto_29531 ) ) ( not ( = ?auto_29525 ?auto_29531 ) ) ( not ( = ?auto_29524 ?auto_29531 ) ) ( ON ?auto_29525 ?auto_29524 ) ( ON ?auto_29526 ?auto_29525 ) ( ON ?auto_29527 ?auto_29526 ) ( ON ?auto_29528 ?auto_29527 ) ( ON ?auto_29529 ?auto_29528 ) ( ON ?auto_29530 ?auto_29529 ) ( CLEAR ?auto_29530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_29530 ?auto_29529 ?auto_29528 ?auto_29527 ?auto_29526 ?auto_29525 ?auto_29524 )
      ( MAKE-7PILE ?auto_29524 ?auto_29525 ?auto_29526 ?auto_29527 ?auto_29528 ?auto_29529 ?auto_29530 ) )
  )

)

