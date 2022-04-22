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

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_153953 - BLOCK
      ?auto_153954 - BLOCK
      ?auto_153955 - BLOCK
      ?auto_153956 - BLOCK
      ?auto_153957 - BLOCK
      ?auto_153958 - BLOCK
      ?auto_153959 - BLOCK
      ?auto_153960 - BLOCK
    )
    :vars
    (
      ?auto_153961 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153961 ?auto_153960 ) ( CLEAR ?auto_153961 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_153953 ) ( ON ?auto_153954 ?auto_153953 ) ( ON ?auto_153955 ?auto_153954 ) ( ON ?auto_153956 ?auto_153955 ) ( ON ?auto_153957 ?auto_153956 ) ( ON ?auto_153958 ?auto_153957 ) ( ON ?auto_153959 ?auto_153958 ) ( ON ?auto_153960 ?auto_153959 ) ( not ( = ?auto_153953 ?auto_153954 ) ) ( not ( = ?auto_153953 ?auto_153955 ) ) ( not ( = ?auto_153953 ?auto_153956 ) ) ( not ( = ?auto_153953 ?auto_153957 ) ) ( not ( = ?auto_153953 ?auto_153958 ) ) ( not ( = ?auto_153953 ?auto_153959 ) ) ( not ( = ?auto_153953 ?auto_153960 ) ) ( not ( = ?auto_153953 ?auto_153961 ) ) ( not ( = ?auto_153954 ?auto_153955 ) ) ( not ( = ?auto_153954 ?auto_153956 ) ) ( not ( = ?auto_153954 ?auto_153957 ) ) ( not ( = ?auto_153954 ?auto_153958 ) ) ( not ( = ?auto_153954 ?auto_153959 ) ) ( not ( = ?auto_153954 ?auto_153960 ) ) ( not ( = ?auto_153954 ?auto_153961 ) ) ( not ( = ?auto_153955 ?auto_153956 ) ) ( not ( = ?auto_153955 ?auto_153957 ) ) ( not ( = ?auto_153955 ?auto_153958 ) ) ( not ( = ?auto_153955 ?auto_153959 ) ) ( not ( = ?auto_153955 ?auto_153960 ) ) ( not ( = ?auto_153955 ?auto_153961 ) ) ( not ( = ?auto_153956 ?auto_153957 ) ) ( not ( = ?auto_153956 ?auto_153958 ) ) ( not ( = ?auto_153956 ?auto_153959 ) ) ( not ( = ?auto_153956 ?auto_153960 ) ) ( not ( = ?auto_153956 ?auto_153961 ) ) ( not ( = ?auto_153957 ?auto_153958 ) ) ( not ( = ?auto_153957 ?auto_153959 ) ) ( not ( = ?auto_153957 ?auto_153960 ) ) ( not ( = ?auto_153957 ?auto_153961 ) ) ( not ( = ?auto_153958 ?auto_153959 ) ) ( not ( = ?auto_153958 ?auto_153960 ) ) ( not ( = ?auto_153958 ?auto_153961 ) ) ( not ( = ?auto_153959 ?auto_153960 ) ) ( not ( = ?auto_153959 ?auto_153961 ) ) ( not ( = ?auto_153960 ?auto_153961 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_153961 ?auto_153960 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_153963 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_153963 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_153963 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_153964 - BLOCK
    )
    :vars
    (
      ?auto_153965 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153964 ?auto_153965 ) ( CLEAR ?auto_153964 ) ( HAND-EMPTY ) ( not ( = ?auto_153964 ?auto_153965 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_153964 ?auto_153965 )
      ( MAKE-1PILE ?auto_153964 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153973 - BLOCK
      ?auto_153974 - BLOCK
      ?auto_153975 - BLOCK
      ?auto_153976 - BLOCK
      ?auto_153977 - BLOCK
      ?auto_153978 - BLOCK
      ?auto_153979 - BLOCK
    )
    :vars
    (
      ?auto_153980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153980 ?auto_153979 ) ( CLEAR ?auto_153980 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_153973 ) ( ON ?auto_153974 ?auto_153973 ) ( ON ?auto_153975 ?auto_153974 ) ( ON ?auto_153976 ?auto_153975 ) ( ON ?auto_153977 ?auto_153976 ) ( ON ?auto_153978 ?auto_153977 ) ( ON ?auto_153979 ?auto_153978 ) ( not ( = ?auto_153973 ?auto_153974 ) ) ( not ( = ?auto_153973 ?auto_153975 ) ) ( not ( = ?auto_153973 ?auto_153976 ) ) ( not ( = ?auto_153973 ?auto_153977 ) ) ( not ( = ?auto_153973 ?auto_153978 ) ) ( not ( = ?auto_153973 ?auto_153979 ) ) ( not ( = ?auto_153973 ?auto_153980 ) ) ( not ( = ?auto_153974 ?auto_153975 ) ) ( not ( = ?auto_153974 ?auto_153976 ) ) ( not ( = ?auto_153974 ?auto_153977 ) ) ( not ( = ?auto_153974 ?auto_153978 ) ) ( not ( = ?auto_153974 ?auto_153979 ) ) ( not ( = ?auto_153974 ?auto_153980 ) ) ( not ( = ?auto_153975 ?auto_153976 ) ) ( not ( = ?auto_153975 ?auto_153977 ) ) ( not ( = ?auto_153975 ?auto_153978 ) ) ( not ( = ?auto_153975 ?auto_153979 ) ) ( not ( = ?auto_153975 ?auto_153980 ) ) ( not ( = ?auto_153976 ?auto_153977 ) ) ( not ( = ?auto_153976 ?auto_153978 ) ) ( not ( = ?auto_153976 ?auto_153979 ) ) ( not ( = ?auto_153976 ?auto_153980 ) ) ( not ( = ?auto_153977 ?auto_153978 ) ) ( not ( = ?auto_153977 ?auto_153979 ) ) ( not ( = ?auto_153977 ?auto_153980 ) ) ( not ( = ?auto_153978 ?auto_153979 ) ) ( not ( = ?auto_153978 ?auto_153980 ) ) ( not ( = ?auto_153979 ?auto_153980 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_153980 ?auto_153979 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153981 - BLOCK
      ?auto_153982 - BLOCK
      ?auto_153983 - BLOCK
      ?auto_153984 - BLOCK
      ?auto_153985 - BLOCK
      ?auto_153986 - BLOCK
      ?auto_153987 - BLOCK
    )
    :vars
    (
      ?auto_153988 - BLOCK
      ?auto_153989 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153988 ?auto_153987 ) ( CLEAR ?auto_153988 ) ( ON-TABLE ?auto_153981 ) ( ON ?auto_153982 ?auto_153981 ) ( ON ?auto_153983 ?auto_153982 ) ( ON ?auto_153984 ?auto_153983 ) ( ON ?auto_153985 ?auto_153984 ) ( ON ?auto_153986 ?auto_153985 ) ( ON ?auto_153987 ?auto_153986 ) ( not ( = ?auto_153981 ?auto_153982 ) ) ( not ( = ?auto_153981 ?auto_153983 ) ) ( not ( = ?auto_153981 ?auto_153984 ) ) ( not ( = ?auto_153981 ?auto_153985 ) ) ( not ( = ?auto_153981 ?auto_153986 ) ) ( not ( = ?auto_153981 ?auto_153987 ) ) ( not ( = ?auto_153981 ?auto_153988 ) ) ( not ( = ?auto_153982 ?auto_153983 ) ) ( not ( = ?auto_153982 ?auto_153984 ) ) ( not ( = ?auto_153982 ?auto_153985 ) ) ( not ( = ?auto_153982 ?auto_153986 ) ) ( not ( = ?auto_153982 ?auto_153987 ) ) ( not ( = ?auto_153982 ?auto_153988 ) ) ( not ( = ?auto_153983 ?auto_153984 ) ) ( not ( = ?auto_153983 ?auto_153985 ) ) ( not ( = ?auto_153983 ?auto_153986 ) ) ( not ( = ?auto_153983 ?auto_153987 ) ) ( not ( = ?auto_153983 ?auto_153988 ) ) ( not ( = ?auto_153984 ?auto_153985 ) ) ( not ( = ?auto_153984 ?auto_153986 ) ) ( not ( = ?auto_153984 ?auto_153987 ) ) ( not ( = ?auto_153984 ?auto_153988 ) ) ( not ( = ?auto_153985 ?auto_153986 ) ) ( not ( = ?auto_153985 ?auto_153987 ) ) ( not ( = ?auto_153985 ?auto_153988 ) ) ( not ( = ?auto_153986 ?auto_153987 ) ) ( not ( = ?auto_153986 ?auto_153988 ) ) ( not ( = ?auto_153987 ?auto_153988 ) ) ( HOLDING ?auto_153989 ) ( not ( = ?auto_153981 ?auto_153989 ) ) ( not ( = ?auto_153982 ?auto_153989 ) ) ( not ( = ?auto_153983 ?auto_153989 ) ) ( not ( = ?auto_153984 ?auto_153989 ) ) ( not ( = ?auto_153985 ?auto_153989 ) ) ( not ( = ?auto_153986 ?auto_153989 ) ) ( not ( = ?auto_153987 ?auto_153989 ) ) ( not ( = ?auto_153988 ?auto_153989 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_153989 )
      ( MAKE-7PILE ?auto_153981 ?auto_153982 ?auto_153983 ?auto_153984 ?auto_153985 ?auto_153986 ?auto_153987 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153990 - BLOCK
      ?auto_153991 - BLOCK
      ?auto_153992 - BLOCK
      ?auto_153993 - BLOCK
      ?auto_153994 - BLOCK
      ?auto_153995 - BLOCK
      ?auto_153996 - BLOCK
    )
    :vars
    (
      ?auto_153997 - BLOCK
      ?auto_153998 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153997 ?auto_153996 ) ( ON-TABLE ?auto_153990 ) ( ON ?auto_153991 ?auto_153990 ) ( ON ?auto_153992 ?auto_153991 ) ( ON ?auto_153993 ?auto_153992 ) ( ON ?auto_153994 ?auto_153993 ) ( ON ?auto_153995 ?auto_153994 ) ( ON ?auto_153996 ?auto_153995 ) ( not ( = ?auto_153990 ?auto_153991 ) ) ( not ( = ?auto_153990 ?auto_153992 ) ) ( not ( = ?auto_153990 ?auto_153993 ) ) ( not ( = ?auto_153990 ?auto_153994 ) ) ( not ( = ?auto_153990 ?auto_153995 ) ) ( not ( = ?auto_153990 ?auto_153996 ) ) ( not ( = ?auto_153990 ?auto_153997 ) ) ( not ( = ?auto_153991 ?auto_153992 ) ) ( not ( = ?auto_153991 ?auto_153993 ) ) ( not ( = ?auto_153991 ?auto_153994 ) ) ( not ( = ?auto_153991 ?auto_153995 ) ) ( not ( = ?auto_153991 ?auto_153996 ) ) ( not ( = ?auto_153991 ?auto_153997 ) ) ( not ( = ?auto_153992 ?auto_153993 ) ) ( not ( = ?auto_153992 ?auto_153994 ) ) ( not ( = ?auto_153992 ?auto_153995 ) ) ( not ( = ?auto_153992 ?auto_153996 ) ) ( not ( = ?auto_153992 ?auto_153997 ) ) ( not ( = ?auto_153993 ?auto_153994 ) ) ( not ( = ?auto_153993 ?auto_153995 ) ) ( not ( = ?auto_153993 ?auto_153996 ) ) ( not ( = ?auto_153993 ?auto_153997 ) ) ( not ( = ?auto_153994 ?auto_153995 ) ) ( not ( = ?auto_153994 ?auto_153996 ) ) ( not ( = ?auto_153994 ?auto_153997 ) ) ( not ( = ?auto_153995 ?auto_153996 ) ) ( not ( = ?auto_153995 ?auto_153997 ) ) ( not ( = ?auto_153996 ?auto_153997 ) ) ( not ( = ?auto_153990 ?auto_153998 ) ) ( not ( = ?auto_153991 ?auto_153998 ) ) ( not ( = ?auto_153992 ?auto_153998 ) ) ( not ( = ?auto_153993 ?auto_153998 ) ) ( not ( = ?auto_153994 ?auto_153998 ) ) ( not ( = ?auto_153995 ?auto_153998 ) ) ( not ( = ?auto_153996 ?auto_153998 ) ) ( not ( = ?auto_153997 ?auto_153998 ) ) ( ON ?auto_153998 ?auto_153997 ) ( CLEAR ?auto_153998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_153990 ?auto_153991 ?auto_153992 ?auto_153993 ?auto_153994 ?auto_153995 ?auto_153996 ?auto_153997 )
      ( MAKE-7PILE ?auto_153990 ?auto_153991 ?auto_153992 ?auto_153993 ?auto_153994 ?auto_153995 ?auto_153996 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_154001 - BLOCK
      ?auto_154002 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_154002 ) ( CLEAR ?auto_154001 ) ( ON-TABLE ?auto_154001 ) ( not ( = ?auto_154001 ?auto_154002 ) ) )
    :subtasks
    ( ( !STACK ?auto_154002 ?auto_154001 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_154003 - BLOCK
      ?auto_154004 - BLOCK
    )
    :vars
    (
      ?auto_154005 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_154003 ) ( ON-TABLE ?auto_154003 ) ( not ( = ?auto_154003 ?auto_154004 ) ) ( ON ?auto_154004 ?auto_154005 ) ( CLEAR ?auto_154004 ) ( HAND-EMPTY ) ( not ( = ?auto_154003 ?auto_154005 ) ) ( not ( = ?auto_154004 ?auto_154005 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_154004 ?auto_154005 )
      ( MAKE-2PILE ?auto_154003 ?auto_154004 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_154006 - BLOCK
      ?auto_154007 - BLOCK
    )
    :vars
    (
      ?auto_154008 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154006 ?auto_154007 ) ) ( ON ?auto_154007 ?auto_154008 ) ( CLEAR ?auto_154007 ) ( not ( = ?auto_154006 ?auto_154008 ) ) ( not ( = ?auto_154007 ?auto_154008 ) ) ( HOLDING ?auto_154006 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_154006 )
      ( MAKE-2PILE ?auto_154006 ?auto_154007 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_154009 - BLOCK
      ?auto_154010 - BLOCK
    )
    :vars
    (
      ?auto_154011 - BLOCK
      ?auto_154014 - BLOCK
      ?auto_154017 - BLOCK
      ?auto_154015 - BLOCK
      ?auto_154016 - BLOCK
      ?auto_154013 - BLOCK
      ?auto_154012 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154009 ?auto_154010 ) ) ( ON ?auto_154010 ?auto_154011 ) ( not ( = ?auto_154009 ?auto_154011 ) ) ( not ( = ?auto_154010 ?auto_154011 ) ) ( ON ?auto_154009 ?auto_154010 ) ( CLEAR ?auto_154009 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_154014 ) ( ON ?auto_154017 ?auto_154014 ) ( ON ?auto_154015 ?auto_154017 ) ( ON ?auto_154016 ?auto_154015 ) ( ON ?auto_154013 ?auto_154016 ) ( ON ?auto_154012 ?auto_154013 ) ( ON ?auto_154011 ?auto_154012 ) ( not ( = ?auto_154014 ?auto_154017 ) ) ( not ( = ?auto_154014 ?auto_154015 ) ) ( not ( = ?auto_154014 ?auto_154016 ) ) ( not ( = ?auto_154014 ?auto_154013 ) ) ( not ( = ?auto_154014 ?auto_154012 ) ) ( not ( = ?auto_154014 ?auto_154011 ) ) ( not ( = ?auto_154014 ?auto_154010 ) ) ( not ( = ?auto_154014 ?auto_154009 ) ) ( not ( = ?auto_154017 ?auto_154015 ) ) ( not ( = ?auto_154017 ?auto_154016 ) ) ( not ( = ?auto_154017 ?auto_154013 ) ) ( not ( = ?auto_154017 ?auto_154012 ) ) ( not ( = ?auto_154017 ?auto_154011 ) ) ( not ( = ?auto_154017 ?auto_154010 ) ) ( not ( = ?auto_154017 ?auto_154009 ) ) ( not ( = ?auto_154015 ?auto_154016 ) ) ( not ( = ?auto_154015 ?auto_154013 ) ) ( not ( = ?auto_154015 ?auto_154012 ) ) ( not ( = ?auto_154015 ?auto_154011 ) ) ( not ( = ?auto_154015 ?auto_154010 ) ) ( not ( = ?auto_154015 ?auto_154009 ) ) ( not ( = ?auto_154016 ?auto_154013 ) ) ( not ( = ?auto_154016 ?auto_154012 ) ) ( not ( = ?auto_154016 ?auto_154011 ) ) ( not ( = ?auto_154016 ?auto_154010 ) ) ( not ( = ?auto_154016 ?auto_154009 ) ) ( not ( = ?auto_154013 ?auto_154012 ) ) ( not ( = ?auto_154013 ?auto_154011 ) ) ( not ( = ?auto_154013 ?auto_154010 ) ) ( not ( = ?auto_154013 ?auto_154009 ) ) ( not ( = ?auto_154012 ?auto_154011 ) ) ( not ( = ?auto_154012 ?auto_154010 ) ) ( not ( = ?auto_154012 ?auto_154009 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_154014 ?auto_154017 ?auto_154015 ?auto_154016 ?auto_154013 ?auto_154012 ?auto_154011 ?auto_154010 )
      ( MAKE-2PILE ?auto_154009 ?auto_154010 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_154024 - BLOCK
      ?auto_154025 - BLOCK
      ?auto_154026 - BLOCK
      ?auto_154027 - BLOCK
      ?auto_154028 - BLOCK
      ?auto_154029 - BLOCK
    )
    :vars
    (
      ?auto_154030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154030 ?auto_154029 ) ( CLEAR ?auto_154030 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_154024 ) ( ON ?auto_154025 ?auto_154024 ) ( ON ?auto_154026 ?auto_154025 ) ( ON ?auto_154027 ?auto_154026 ) ( ON ?auto_154028 ?auto_154027 ) ( ON ?auto_154029 ?auto_154028 ) ( not ( = ?auto_154024 ?auto_154025 ) ) ( not ( = ?auto_154024 ?auto_154026 ) ) ( not ( = ?auto_154024 ?auto_154027 ) ) ( not ( = ?auto_154024 ?auto_154028 ) ) ( not ( = ?auto_154024 ?auto_154029 ) ) ( not ( = ?auto_154024 ?auto_154030 ) ) ( not ( = ?auto_154025 ?auto_154026 ) ) ( not ( = ?auto_154025 ?auto_154027 ) ) ( not ( = ?auto_154025 ?auto_154028 ) ) ( not ( = ?auto_154025 ?auto_154029 ) ) ( not ( = ?auto_154025 ?auto_154030 ) ) ( not ( = ?auto_154026 ?auto_154027 ) ) ( not ( = ?auto_154026 ?auto_154028 ) ) ( not ( = ?auto_154026 ?auto_154029 ) ) ( not ( = ?auto_154026 ?auto_154030 ) ) ( not ( = ?auto_154027 ?auto_154028 ) ) ( not ( = ?auto_154027 ?auto_154029 ) ) ( not ( = ?auto_154027 ?auto_154030 ) ) ( not ( = ?auto_154028 ?auto_154029 ) ) ( not ( = ?auto_154028 ?auto_154030 ) ) ( not ( = ?auto_154029 ?auto_154030 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_154030 ?auto_154029 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_154031 - BLOCK
      ?auto_154032 - BLOCK
      ?auto_154033 - BLOCK
      ?auto_154034 - BLOCK
      ?auto_154035 - BLOCK
      ?auto_154036 - BLOCK
    )
    :vars
    (
      ?auto_154037 - BLOCK
      ?auto_154038 - BLOCK
      ?auto_154039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154037 ?auto_154036 ) ( CLEAR ?auto_154037 ) ( ON-TABLE ?auto_154031 ) ( ON ?auto_154032 ?auto_154031 ) ( ON ?auto_154033 ?auto_154032 ) ( ON ?auto_154034 ?auto_154033 ) ( ON ?auto_154035 ?auto_154034 ) ( ON ?auto_154036 ?auto_154035 ) ( not ( = ?auto_154031 ?auto_154032 ) ) ( not ( = ?auto_154031 ?auto_154033 ) ) ( not ( = ?auto_154031 ?auto_154034 ) ) ( not ( = ?auto_154031 ?auto_154035 ) ) ( not ( = ?auto_154031 ?auto_154036 ) ) ( not ( = ?auto_154031 ?auto_154037 ) ) ( not ( = ?auto_154032 ?auto_154033 ) ) ( not ( = ?auto_154032 ?auto_154034 ) ) ( not ( = ?auto_154032 ?auto_154035 ) ) ( not ( = ?auto_154032 ?auto_154036 ) ) ( not ( = ?auto_154032 ?auto_154037 ) ) ( not ( = ?auto_154033 ?auto_154034 ) ) ( not ( = ?auto_154033 ?auto_154035 ) ) ( not ( = ?auto_154033 ?auto_154036 ) ) ( not ( = ?auto_154033 ?auto_154037 ) ) ( not ( = ?auto_154034 ?auto_154035 ) ) ( not ( = ?auto_154034 ?auto_154036 ) ) ( not ( = ?auto_154034 ?auto_154037 ) ) ( not ( = ?auto_154035 ?auto_154036 ) ) ( not ( = ?auto_154035 ?auto_154037 ) ) ( not ( = ?auto_154036 ?auto_154037 ) ) ( HOLDING ?auto_154038 ) ( CLEAR ?auto_154039 ) ( not ( = ?auto_154031 ?auto_154038 ) ) ( not ( = ?auto_154031 ?auto_154039 ) ) ( not ( = ?auto_154032 ?auto_154038 ) ) ( not ( = ?auto_154032 ?auto_154039 ) ) ( not ( = ?auto_154033 ?auto_154038 ) ) ( not ( = ?auto_154033 ?auto_154039 ) ) ( not ( = ?auto_154034 ?auto_154038 ) ) ( not ( = ?auto_154034 ?auto_154039 ) ) ( not ( = ?auto_154035 ?auto_154038 ) ) ( not ( = ?auto_154035 ?auto_154039 ) ) ( not ( = ?auto_154036 ?auto_154038 ) ) ( not ( = ?auto_154036 ?auto_154039 ) ) ( not ( = ?auto_154037 ?auto_154038 ) ) ( not ( = ?auto_154037 ?auto_154039 ) ) ( not ( = ?auto_154038 ?auto_154039 ) ) )
    :subtasks
    ( ( !STACK ?auto_154038 ?auto_154039 )
      ( MAKE-6PILE ?auto_154031 ?auto_154032 ?auto_154033 ?auto_154034 ?auto_154035 ?auto_154036 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_154040 - BLOCK
      ?auto_154041 - BLOCK
      ?auto_154042 - BLOCK
      ?auto_154043 - BLOCK
      ?auto_154044 - BLOCK
      ?auto_154045 - BLOCK
    )
    :vars
    (
      ?auto_154048 - BLOCK
      ?auto_154047 - BLOCK
      ?auto_154046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154048 ?auto_154045 ) ( ON-TABLE ?auto_154040 ) ( ON ?auto_154041 ?auto_154040 ) ( ON ?auto_154042 ?auto_154041 ) ( ON ?auto_154043 ?auto_154042 ) ( ON ?auto_154044 ?auto_154043 ) ( ON ?auto_154045 ?auto_154044 ) ( not ( = ?auto_154040 ?auto_154041 ) ) ( not ( = ?auto_154040 ?auto_154042 ) ) ( not ( = ?auto_154040 ?auto_154043 ) ) ( not ( = ?auto_154040 ?auto_154044 ) ) ( not ( = ?auto_154040 ?auto_154045 ) ) ( not ( = ?auto_154040 ?auto_154048 ) ) ( not ( = ?auto_154041 ?auto_154042 ) ) ( not ( = ?auto_154041 ?auto_154043 ) ) ( not ( = ?auto_154041 ?auto_154044 ) ) ( not ( = ?auto_154041 ?auto_154045 ) ) ( not ( = ?auto_154041 ?auto_154048 ) ) ( not ( = ?auto_154042 ?auto_154043 ) ) ( not ( = ?auto_154042 ?auto_154044 ) ) ( not ( = ?auto_154042 ?auto_154045 ) ) ( not ( = ?auto_154042 ?auto_154048 ) ) ( not ( = ?auto_154043 ?auto_154044 ) ) ( not ( = ?auto_154043 ?auto_154045 ) ) ( not ( = ?auto_154043 ?auto_154048 ) ) ( not ( = ?auto_154044 ?auto_154045 ) ) ( not ( = ?auto_154044 ?auto_154048 ) ) ( not ( = ?auto_154045 ?auto_154048 ) ) ( CLEAR ?auto_154047 ) ( not ( = ?auto_154040 ?auto_154046 ) ) ( not ( = ?auto_154040 ?auto_154047 ) ) ( not ( = ?auto_154041 ?auto_154046 ) ) ( not ( = ?auto_154041 ?auto_154047 ) ) ( not ( = ?auto_154042 ?auto_154046 ) ) ( not ( = ?auto_154042 ?auto_154047 ) ) ( not ( = ?auto_154043 ?auto_154046 ) ) ( not ( = ?auto_154043 ?auto_154047 ) ) ( not ( = ?auto_154044 ?auto_154046 ) ) ( not ( = ?auto_154044 ?auto_154047 ) ) ( not ( = ?auto_154045 ?auto_154046 ) ) ( not ( = ?auto_154045 ?auto_154047 ) ) ( not ( = ?auto_154048 ?auto_154046 ) ) ( not ( = ?auto_154048 ?auto_154047 ) ) ( not ( = ?auto_154046 ?auto_154047 ) ) ( ON ?auto_154046 ?auto_154048 ) ( CLEAR ?auto_154046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_154040 ?auto_154041 ?auto_154042 ?auto_154043 ?auto_154044 ?auto_154045 ?auto_154048 )
      ( MAKE-6PILE ?auto_154040 ?auto_154041 ?auto_154042 ?auto_154043 ?auto_154044 ?auto_154045 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_154049 - BLOCK
      ?auto_154050 - BLOCK
      ?auto_154051 - BLOCK
      ?auto_154052 - BLOCK
      ?auto_154053 - BLOCK
      ?auto_154054 - BLOCK
    )
    :vars
    (
      ?auto_154055 - BLOCK
      ?auto_154056 - BLOCK
      ?auto_154057 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154055 ?auto_154054 ) ( ON-TABLE ?auto_154049 ) ( ON ?auto_154050 ?auto_154049 ) ( ON ?auto_154051 ?auto_154050 ) ( ON ?auto_154052 ?auto_154051 ) ( ON ?auto_154053 ?auto_154052 ) ( ON ?auto_154054 ?auto_154053 ) ( not ( = ?auto_154049 ?auto_154050 ) ) ( not ( = ?auto_154049 ?auto_154051 ) ) ( not ( = ?auto_154049 ?auto_154052 ) ) ( not ( = ?auto_154049 ?auto_154053 ) ) ( not ( = ?auto_154049 ?auto_154054 ) ) ( not ( = ?auto_154049 ?auto_154055 ) ) ( not ( = ?auto_154050 ?auto_154051 ) ) ( not ( = ?auto_154050 ?auto_154052 ) ) ( not ( = ?auto_154050 ?auto_154053 ) ) ( not ( = ?auto_154050 ?auto_154054 ) ) ( not ( = ?auto_154050 ?auto_154055 ) ) ( not ( = ?auto_154051 ?auto_154052 ) ) ( not ( = ?auto_154051 ?auto_154053 ) ) ( not ( = ?auto_154051 ?auto_154054 ) ) ( not ( = ?auto_154051 ?auto_154055 ) ) ( not ( = ?auto_154052 ?auto_154053 ) ) ( not ( = ?auto_154052 ?auto_154054 ) ) ( not ( = ?auto_154052 ?auto_154055 ) ) ( not ( = ?auto_154053 ?auto_154054 ) ) ( not ( = ?auto_154053 ?auto_154055 ) ) ( not ( = ?auto_154054 ?auto_154055 ) ) ( not ( = ?auto_154049 ?auto_154056 ) ) ( not ( = ?auto_154049 ?auto_154057 ) ) ( not ( = ?auto_154050 ?auto_154056 ) ) ( not ( = ?auto_154050 ?auto_154057 ) ) ( not ( = ?auto_154051 ?auto_154056 ) ) ( not ( = ?auto_154051 ?auto_154057 ) ) ( not ( = ?auto_154052 ?auto_154056 ) ) ( not ( = ?auto_154052 ?auto_154057 ) ) ( not ( = ?auto_154053 ?auto_154056 ) ) ( not ( = ?auto_154053 ?auto_154057 ) ) ( not ( = ?auto_154054 ?auto_154056 ) ) ( not ( = ?auto_154054 ?auto_154057 ) ) ( not ( = ?auto_154055 ?auto_154056 ) ) ( not ( = ?auto_154055 ?auto_154057 ) ) ( not ( = ?auto_154056 ?auto_154057 ) ) ( ON ?auto_154056 ?auto_154055 ) ( CLEAR ?auto_154056 ) ( HOLDING ?auto_154057 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_154057 )
      ( MAKE-6PILE ?auto_154049 ?auto_154050 ?auto_154051 ?auto_154052 ?auto_154053 ?auto_154054 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_154058 - BLOCK
      ?auto_154059 - BLOCK
      ?auto_154060 - BLOCK
      ?auto_154061 - BLOCK
      ?auto_154062 - BLOCK
      ?auto_154063 - BLOCK
    )
    :vars
    (
      ?auto_154064 - BLOCK
      ?auto_154066 - BLOCK
      ?auto_154065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154064 ?auto_154063 ) ( ON-TABLE ?auto_154058 ) ( ON ?auto_154059 ?auto_154058 ) ( ON ?auto_154060 ?auto_154059 ) ( ON ?auto_154061 ?auto_154060 ) ( ON ?auto_154062 ?auto_154061 ) ( ON ?auto_154063 ?auto_154062 ) ( not ( = ?auto_154058 ?auto_154059 ) ) ( not ( = ?auto_154058 ?auto_154060 ) ) ( not ( = ?auto_154058 ?auto_154061 ) ) ( not ( = ?auto_154058 ?auto_154062 ) ) ( not ( = ?auto_154058 ?auto_154063 ) ) ( not ( = ?auto_154058 ?auto_154064 ) ) ( not ( = ?auto_154059 ?auto_154060 ) ) ( not ( = ?auto_154059 ?auto_154061 ) ) ( not ( = ?auto_154059 ?auto_154062 ) ) ( not ( = ?auto_154059 ?auto_154063 ) ) ( not ( = ?auto_154059 ?auto_154064 ) ) ( not ( = ?auto_154060 ?auto_154061 ) ) ( not ( = ?auto_154060 ?auto_154062 ) ) ( not ( = ?auto_154060 ?auto_154063 ) ) ( not ( = ?auto_154060 ?auto_154064 ) ) ( not ( = ?auto_154061 ?auto_154062 ) ) ( not ( = ?auto_154061 ?auto_154063 ) ) ( not ( = ?auto_154061 ?auto_154064 ) ) ( not ( = ?auto_154062 ?auto_154063 ) ) ( not ( = ?auto_154062 ?auto_154064 ) ) ( not ( = ?auto_154063 ?auto_154064 ) ) ( not ( = ?auto_154058 ?auto_154066 ) ) ( not ( = ?auto_154058 ?auto_154065 ) ) ( not ( = ?auto_154059 ?auto_154066 ) ) ( not ( = ?auto_154059 ?auto_154065 ) ) ( not ( = ?auto_154060 ?auto_154066 ) ) ( not ( = ?auto_154060 ?auto_154065 ) ) ( not ( = ?auto_154061 ?auto_154066 ) ) ( not ( = ?auto_154061 ?auto_154065 ) ) ( not ( = ?auto_154062 ?auto_154066 ) ) ( not ( = ?auto_154062 ?auto_154065 ) ) ( not ( = ?auto_154063 ?auto_154066 ) ) ( not ( = ?auto_154063 ?auto_154065 ) ) ( not ( = ?auto_154064 ?auto_154066 ) ) ( not ( = ?auto_154064 ?auto_154065 ) ) ( not ( = ?auto_154066 ?auto_154065 ) ) ( ON ?auto_154066 ?auto_154064 ) ( ON ?auto_154065 ?auto_154066 ) ( CLEAR ?auto_154065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_154058 ?auto_154059 ?auto_154060 ?auto_154061 ?auto_154062 ?auto_154063 ?auto_154064 ?auto_154066 )
      ( MAKE-6PILE ?auto_154058 ?auto_154059 ?auto_154060 ?auto_154061 ?auto_154062 ?auto_154063 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_154070 - BLOCK
      ?auto_154071 - BLOCK
      ?auto_154072 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_154072 ) ( CLEAR ?auto_154071 ) ( ON-TABLE ?auto_154070 ) ( ON ?auto_154071 ?auto_154070 ) ( not ( = ?auto_154070 ?auto_154071 ) ) ( not ( = ?auto_154070 ?auto_154072 ) ) ( not ( = ?auto_154071 ?auto_154072 ) ) )
    :subtasks
    ( ( !STACK ?auto_154072 ?auto_154071 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_154073 - BLOCK
      ?auto_154074 - BLOCK
      ?auto_154075 - BLOCK
    )
    :vars
    (
      ?auto_154076 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_154074 ) ( ON-TABLE ?auto_154073 ) ( ON ?auto_154074 ?auto_154073 ) ( not ( = ?auto_154073 ?auto_154074 ) ) ( not ( = ?auto_154073 ?auto_154075 ) ) ( not ( = ?auto_154074 ?auto_154075 ) ) ( ON ?auto_154075 ?auto_154076 ) ( CLEAR ?auto_154075 ) ( HAND-EMPTY ) ( not ( = ?auto_154073 ?auto_154076 ) ) ( not ( = ?auto_154074 ?auto_154076 ) ) ( not ( = ?auto_154075 ?auto_154076 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_154075 ?auto_154076 )
      ( MAKE-3PILE ?auto_154073 ?auto_154074 ?auto_154075 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_154077 - BLOCK
      ?auto_154078 - BLOCK
      ?auto_154079 - BLOCK
    )
    :vars
    (
      ?auto_154080 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154077 ) ( not ( = ?auto_154077 ?auto_154078 ) ) ( not ( = ?auto_154077 ?auto_154079 ) ) ( not ( = ?auto_154078 ?auto_154079 ) ) ( ON ?auto_154079 ?auto_154080 ) ( CLEAR ?auto_154079 ) ( not ( = ?auto_154077 ?auto_154080 ) ) ( not ( = ?auto_154078 ?auto_154080 ) ) ( not ( = ?auto_154079 ?auto_154080 ) ) ( HOLDING ?auto_154078 ) ( CLEAR ?auto_154077 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_154077 ?auto_154078 )
      ( MAKE-3PILE ?auto_154077 ?auto_154078 ?auto_154079 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_154081 - BLOCK
      ?auto_154082 - BLOCK
      ?auto_154083 - BLOCK
    )
    :vars
    (
      ?auto_154084 - BLOCK
      ?auto_154087 - BLOCK
      ?auto_154086 - BLOCK
      ?auto_154089 - BLOCK
      ?auto_154085 - BLOCK
      ?auto_154088 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154081 ) ( not ( = ?auto_154081 ?auto_154082 ) ) ( not ( = ?auto_154081 ?auto_154083 ) ) ( not ( = ?auto_154082 ?auto_154083 ) ) ( ON ?auto_154083 ?auto_154084 ) ( not ( = ?auto_154081 ?auto_154084 ) ) ( not ( = ?auto_154082 ?auto_154084 ) ) ( not ( = ?auto_154083 ?auto_154084 ) ) ( CLEAR ?auto_154081 ) ( ON ?auto_154082 ?auto_154083 ) ( CLEAR ?auto_154082 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_154087 ) ( ON ?auto_154086 ?auto_154087 ) ( ON ?auto_154089 ?auto_154086 ) ( ON ?auto_154085 ?auto_154089 ) ( ON ?auto_154088 ?auto_154085 ) ( ON ?auto_154084 ?auto_154088 ) ( not ( = ?auto_154087 ?auto_154086 ) ) ( not ( = ?auto_154087 ?auto_154089 ) ) ( not ( = ?auto_154087 ?auto_154085 ) ) ( not ( = ?auto_154087 ?auto_154088 ) ) ( not ( = ?auto_154087 ?auto_154084 ) ) ( not ( = ?auto_154087 ?auto_154083 ) ) ( not ( = ?auto_154087 ?auto_154082 ) ) ( not ( = ?auto_154086 ?auto_154089 ) ) ( not ( = ?auto_154086 ?auto_154085 ) ) ( not ( = ?auto_154086 ?auto_154088 ) ) ( not ( = ?auto_154086 ?auto_154084 ) ) ( not ( = ?auto_154086 ?auto_154083 ) ) ( not ( = ?auto_154086 ?auto_154082 ) ) ( not ( = ?auto_154089 ?auto_154085 ) ) ( not ( = ?auto_154089 ?auto_154088 ) ) ( not ( = ?auto_154089 ?auto_154084 ) ) ( not ( = ?auto_154089 ?auto_154083 ) ) ( not ( = ?auto_154089 ?auto_154082 ) ) ( not ( = ?auto_154085 ?auto_154088 ) ) ( not ( = ?auto_154085 ?auto_154084 ) ) ( not ( = ?auto_154085 ?auto_154083 ) ) ( not ( = ?auto_154085 ?auto_154082 ) ) ( not ( = ?auto_154088 ?auto_154084 ) ) ( not ( = ?auto_154088 ?auto_154083 ) ) ( not ( = ?auto_154088 ?auto_154082 ) ) ( not ( = ?auto_154081 ?auto_154087 ) ) ( not ( = ?auto_154081 ?auto_154086 ) ) ( not ( = ?auto_154081 ?auto_154089 ) ) ( not ( = ?auto_154081 ?auto_154085 ) ) ( not ( = ?auto_154081 ?auto_154088 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_154087 ?auto_154086 ?auto_154089 ?auto_154085 ?auto_154088 ?auto_154084 ?auto_154083 )
      ( MAKE-3PILE ?auto_154081 ?auto_154082 ?auto_154083 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_154090 - BLOCK
      ?auto_154091 - BLOCK
      ?auto_154092 - BLOCK
    )
    :vars
    (
      ?auto_154097 - BLOCK
      ?auto_154095 - BLOCK
      ?auto_154093 - BLOCK
      ?auto_154096 - BLOCK
      ?auto_154094 - BLOCK
      ?auto_154098 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154090 ?auto_154091 ) ) ( not ( = ?auto_154090 ?auto_154092 ) ) ( not ( = ?auto_154091 ?auto_154092 ) ) ( ON ?auto_154092 ?auto_154097 ) ( not ( = ?auto_154090 ?auto_154097 ) ) ( not ( = ?auto_154091 ?auto_154097 ) ) ( not ( = ?auto_154092 ?auto_154097 ) ) ( ON ?auto_154091 ?auto_154092 ) ( CLEAR ?auto_154091 ) ( ON-TABLE ?auto_154095 ) ( ON ?auto_154093 ?auto_154095 ) ( ON ?auto_154096 ?auto_154093 ) ( ON ?auto_154094 ?auto_154096 ) ( ON ?auto_154098 ?auto_154094 ) ( ON ?auto_154097 ?auto_154098 ) ( not ( = ?auto_154095 ?auto_154093 ) ) ( not ( = ?auto_154095 ?auto_154096 ) ) ( not ( = ?auto_154095 ?auto_154094 ) ) ( not ( = ?auto_154095 ?auto_154098 ) ) ( not ( = ?auto_154095 ?auto_154097 ) ) ( not ( = ?auto_154095 ?auto_154092 ) ) ( not ( = ?auto_154095 ?auto_154091 ) ) ( not ( = ?auto_154093 ?auto_154096 ) ) ( not ( = ?auto_154093 ?auto_154094 ) ) ( not ( = ?auto_154093 ?auto_154098 ) ) ( not ( = ?auto_154093 ?auto_154097 ) ) ( not ( = ?auto_154093 ?auto_154092 ) ) ( not ( = ?auto_154093 ?auto_154091 ) ) ( not ( = ?auto_154096 ?auto_154094 ) ) ( not ( = ?auto_154096 ?auto_154098 ) ) ( not ( = ?auto_154096 ?auto_154097 ) ) ( not ( = ?auto_154096 ?auto_154092 ) ) ( not ( = ?auto_154096 ?auto_154091 ) ) ( not ( = ?auto_154094 ?auto_154098 ) ) ( not ( = ?auto_154094 ?auto_154097 ) ) ( not ( = ?auto_154094 ?auto_154092 ) ) ( not ( = ?auto_154094 ?auto_154091 ) ) ( not ( = ?auto_154098 ?auto_154097 ) ) ( not ( = ?auto_154098 ?auto_154092 ) ) ( not ( = ?auto_154098 ?auto_154091 ) ) ( not ( = ?auto_154090 ?auto_154095 ) ) ( not ( = ?auto_154090 ?auto_154093 ) ) ( not ( = ?auto_154090 ?auto_154096 ) ) ( not ( = ?auto_154090 ?auto_154094 ) ) ( not ( = ?auto_154090 ?auto_154098 ) ) ( HOLDING ?auto_154090 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_154090 )
      ( MAKE-3PILE ?auto_154090 ?auto_154091 ?auto_154092 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_154099 - BLOCK
      ?auto_154100 - BLOCK
      ?auto_154101 - BLOCK
    )
    :vars
    (
      ?auto_154105 - BLOCK
      ?auto_154103 - BLOCK
      ?auto_154106 - BLOCK
      ?auto_154104 - BLOCK
      ?auto_154107 - BLOCK
      ?auto_154102 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154099 ?auto_154100 ) ) ( not ( = ?auto_154099 ?auto_154101 ) ) ( not ( = ?auto_154100 ?auto_154101 ) ) ( ON ?auto_154101 ?auto_154105 ) ( not ( = ?auto_154099 ?auto_154105 ) ) ( not ( = ?auto_154100 ?auto_154105 ) ) ( not ( = ?auto_154101 ?auto_154105 ) ) ( ON ?auto_154100 ?auto_154101 ) ( ON-TABLE ?auto_154103 ) ( ON ?auto_154106 ?auto_154103 ) ( ON ?auto_154104 ?auto_154106 ) ( ON ?auto_154107 ?auto_154104 ) ( ON ?auto_154102 ?auto_154107 ) ( ON ?auto_154105 ?auto_154102 ) ( not ( = ?auto_154103 ?auto_154106 ) ) ( not ( = ?auto_154103 ?auto_154104 ) ) ( not ( = ?auto_154103 ?auto_154107 ) ) ( not ( = ?auto_154103 ?auto_154102 ) ) ( not ( = ?auto_154103 ?auto_154105 ) ) ( not ( = ?auto_154103 ?auto_154101 ) ) ( not ( = ?auto_154103 ?auto_154100 ) ) ( not ( = ?auto_154106 ?auto_154104 ) ) ( not ( = ?auto_154106 ?auto_154107 ) ) ( not ( = ?auto_154106 ?auto_154102 ) ) ( not ( = ?auto_154106 ?auto_154105 ) ) ( not ( = ?auto_154106 ?auto_154101 ) ) ( not ( = ?auto_154106 ?auto_154100 ) ) ( not ( = ?auto_154104 ?auto_154107 ) ) ( not ( = ?auto_154104 ?auto_154102 ) ) ( not ( = ?auto_154104 ?auto_154105 ) ) ( not ( = ?auto_154104 ?auto_154101 ) ) ( not ( = ?auto_154104 ?auto_154100 ) ) ( not ( = ?auto_154107 ?auto_154102 ) ) ( not ( = ?auto_154107 ?auto_154105 ) ) ( not ( = ?auto_154107 ?auto_154101 ) ) ( not ( = ?auto_154107 ?auto_154100 ) ) ( not ( = ?auto_154102 ?auto_154105 ) ) ( not ( = ?auto_154102 ?auto_154101 ) ) ( not ( = ?auto_154102 ?auto_154100 ) ) ( not ( = ?auto_154099 ?auto_154103 ) ) ( not ( = ?auto_154099 ?auto_154106 ) ) ( not ( = ?auto_154099 ?auto_154104 ) ) ( not ( = ?auto_154099 ?auto_154107 ) ) ( not ( = ?auto_154099 ?auto_154102 ) ) ( ON ?auto_154099 ?auto_154100 ) ( CLEAR ?auto_154099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_154103 ?auto_154106 ?auto_154104 ?auto_154107 ?auto_154102 ?auto_154105 ?auto_154101 ?auto_154100 )
      ( MAKE-3PILE ?auto_154099 ?auto_154100 ?auto_154101 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_154113 - BLOCK
      ?auto_154114 - BLOCK
      ?auto_154115 - BLOCK
      ?auto_154116 - BLOCK
      ?auto_154117 - BLOCK
    )
    :vars
    (
      ?auto_154118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154118 ?auto_154117 ) ( CLEAR ?auto_154118 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_154113 ) ( ON ?auto_154114 ?auto_154113 ) ( ON ?auto_154115 ?auto_154114 ) ( ON ?auto_154116 ?auto_154115 ) ( ON ?auto_154117 ?auto_154116 ) ( not ( = ?auto_154113 ?auto_154114 ) ) ( not ( = ?auto_154113 ?auto_154115 ) ) ( not ( = ?auto_154113 ?auto_154116 ) ) ( not ( = ?auto_154113 ?auto_154117 ) ) ( not ( = ?auto_154113 ?auto_154118 ) ) ( not ( = ?auto_154114 ?auto_154115 ) ) ( not ( = ?auto_154114 ?auto_154116 ) ) ( not ( = ?auto_154114 ?auto_154117 ) ) ( not ( = ?auto_154114 ?auto_154118 ) ) ( not ( = ?auto_154115 ?auto_154116 ) ) ( not ( = ?auto_154115 ?auto_154117 ) ) ( not ( = ?auto_154115 ?auto_154118 ) ) ( not ( = ?auto_154116 ?auto_154117 ) ) ( not ( = ?auto_154116 ?auto_154118 ) ) ( not ( = ?auto_154117 ?auto_154118 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_154118 ?auto_154117 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_154119 - BLOCK
      ?auto_154120 - BLOCK
      ?auto_154121 - BLOCK
      ?auto_154122 - BLOCK
      ?auto_154123 - BLOCK
    )
    :vars
    (
      ?auto_154124 - BLOCK
      ?auto_154125 - BLOCK
      ?auto_154126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154124 ?auto_154123 ) ( CLEAR ?auto_154124 ) ( ON-TABLE ?auto_154119 ) ( ON ?auto_154120 ?auto_154119 ) ( ON ?auto_154121 ?auto_154120 ) ( ON ?auto_154122 ?auto_154121 ) ( ON ?auto_154123 ?auto_154122 ) ( not ( = ?auto_154119 ?auto_154120 ) ) ( not ( = ?auto_154119 ?auto_154121 ) ) ( not ( = ?auto_154119 ?auto_154122 ) ) ( not ( = ?auto_154119 ?auto_154123 ) ) ( not ( = ?auto_154119 ?auto_154124 ) ) ( not ( = ?auto_154120 ?auto_154121 ) ) ( not ( = ?auto_154120 ?auto_154122 ) ) ( not ( = ?auto_154120 ?auto_154123 ) ) ( not ( = ?auto_154120 ?auto_154124 ) ) ( not ( = ?auto_154121 ?auto_154122 ) ) ( not ( = ?auto_154121 ?auto_154123 ) ) ( not ( = ?auto_154121 ?auto_154124 ) ) ( not ( = ?auto_154122 ?auto_154123 ) ) ( not ( = ?auto_154122 ?auto_154124 ) ) ( not ( = ?auto_154123 ?auto_154124 ) ) ( HOLDING ?auto_154125 ) ( CLEAR ?auto_154126 ) ( not ( = ?auto_154119 ?auto_154125 ) ) ( not ( = ?auto_154119 ?auto_154126 ) ) ( not ( = ?auto_154120 ?auto_154125 ) ) ( not ( = ?auto_154120 ?auto_154126 ) ) ( not ( = ?auto_154121 ?auto_154125 ) ) ( not ( = ?auto_154121 ?auto_154126 ) ) ( not ( = ?auto_154122 ?auto_154125 ) ) ( not ( = ?auto_154122 ?auto_154126 ) ) ( not ( = ?auto_154123 ?auto_154125 ) ) ( not ( = ?auto_154123 ?auto_154126 ) ) ( not ( = ?auto_154124 ?auto_154125 ) ) ( not ( = ?auto_154124 ?auto_154126 ) ) ( not ( = ?auto_154125 ?auto_154126 ) ) )
    :subtasks
    ( ( !STACK ?auto_154125 ?auto_154126 )
      ( MAKE-5PILE ?auto_154119 ?auto_154120 ?auto_154121 ?auto_154122 ?auto_154123 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_154127 - BLOCK
      ?auto_154128 - BLOCK
      ?auto_154129 - BLOCK
      ?auto_154130 - BLOCK
      ?auto_154131 - BLOCK
    )
    :vars
    (
      ?auto_154132 - BLOCK
      ?auto_154133 - BLOCK
      ?auto_154134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154132 ?auto_154131 ) ( ON-TABLE ?auto_154127 ) ( ON ?auto_154128 ?auto_154127 ) ( ON ?auto_154129 ?auto_154128 ) ( ON ?auto_154130 ?auto_154129 ) ( ON ?auto_154131 ?auto_154130 ) ( not ( = ?auto_154127 ?auto_154128 ) ) ( not ( = ?auto_154127 ?auto_154129 ) ) ( not ( = ?auto_154127 ?auto_154130 ) ) ( not ( = ?auto_154127 ?auto_154131 ) ) ( not ( = ?auto_154127 ?auto_154132 ) ) ( not ( = ?auto_154128 ?auto_154129 ) ) ( not ( = ?auto_154128 ?auto_154130 ) ) ( not ( = ?auto_154128 ?auto_154131 ) ) ( not ( = ?auto_154128 ?auto_154132 ) ) ( not ( = ?auto_154129 ?auto_154130 ) ) ( not ( = ?auto_154129 ?auto_154131 ) ) ( not ( = ?auto_154129 ?auto_154132 ) ) ( not ( = ?auto_154130 ?auto_154131 ) ) ( not ( = ?auto_154130 ?auto_154132 ) ) ( not ( = ?auto_154131 ?auto_154132 ) ) ( CLEAR ?auto_154133 ) ( not ( = ?auto_154127 ?auto_154134 ) ) ( not ( = ?auto_154127 ?auto_154133 ) ) ( not ( = ?auto_154128 ?auto_154134 ) ) ( not ( = ?auto_154128 ?auto_154133 ) ) ( not ( = ?auto_154129 ?auto_154134 ) ) ( not ( = ?auto_154129 ?auto_154133 ) ) ( not ( = ?auto_154130 ?auto_154134 ) ) ( not ( = ?auto_154130 ?auto_154133 ) ) ( not ( = ?auto_154131 ?auto_154134 ) ) ( not ( = ?auto_154131 ?auto_154133 ) ) ( not ( = ?auto_154132 ?auto_154134 ) ) ( not ( = ?auto_154132 ?auto_154133 ) ) ( not ( = ?auto_154134 ?auto_154133 ) ) ( ON ?auto_154134 ?auto_154132 ) ( CLEAR ?auto_154134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_154127 ?auto_154128 ?auto_154129 ?auto_154130 ?auto_154131 ?auto_154132 )
      ( MAKE-5PILE ?auto_154127 ?auto_154128 ?auto_154129 ?auto_154130 ?auto_154131 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_154135 - BLOCK
      ?auto_154136 - BLOCK
      ?auto_154137 - BLOCK
      ?auto_154138 - BLOCK
      ?auto_154139 - BLOCK
    )
    :vars
    (
      ?auto_154142 - BLOCK
      ?auto_154141 - BLOCK
      ?auto_154140 - BLOCK
      ?auto_154143 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154142 ?auto_154139 ) ( ON-TABLE ?auto_154135 ) ( ON ?auto_154136 ?auto_154135 ) ( ON ?auto_154137 ?auto_154136 ) ( ON ?auto_154138 ?auto_154137 ) ( ON ?auto_154139 ?auto_154138 ) ( not ( = ?auto_154135 ?auto_154136 ) ) ( not ( = ?auto_154135 ?auto_154137 ) ) ( not ( = ?auto_154135 ?auto_154138 ) ) ( not ( = ?auto_154135 ?auto_154139 ) ) ( not ( = ?auto_154135 ?auto_154142 ) ) ( not ( = ?auto_154136 ?auto_154137 ) ) ( not ( = ?auto_154136 ?auto_154138 ) ) ( not ( = ?auto_154136 ?auto_154139 ) ) ( not ( = ?auto_154136 ?auto_154142 ) ) ( not ( = ?auto_154137 ?auto_154138 ) ) ( not ( = ?auto_154137 ?auto_154139 ) ) ( not ( = ?auto_154137 ?auto_154142 ) ) ( not ( = ?auto_154138 ?auto_154139 ) ) ( not ( = ?auto_154138 ?auto_154142 ) ) ( not ( = ?auto_154139 ?auto_154142 ) ) ( not ( = ?auto_154135 ?auto_154141 ) ) ( not ( = ?auto_154135 ?auto_154140 ) ) ( not ( = ?auto_154136 ?auto_154141 ) ) ( not ( = ?auto_154136 ?auto_154140 ) ) ( not ( = ?auto_154137 ?auto_154141 ) ) ( not ( = ?auto_154137 ?auto_154140 ) ) ( not ( = ?auto_154138 ?auto_154141 ) ) ( not ( = ?auto_154138 ?auto_154140 ) ) ( not ( = ?auto_154139 ?auto_154141 ) ) ( not ( = ?auto_154139 ?auto_154140 ) ) ( not ( = ?auto_154142 ?auto_154141 ) ) ( not ( = ?auto_154142 ?auto_154140 ) ) ( not ( = ?auto_154141 ?auto_154140 ) ) ( ON ?auto_154141 ?auto_154142 ) ( CLEAR ?auto_154141 ) ( HOLDING ?auto_154140 ) ( CLEAR ?auto_154143 ) ( ON-TABLE ?auto_154143 ) ( not ( = ?auto_154143 ?auto_154140 ) ) ( not ( = ?auto_154135 ?auto_154143 ) ) ( not ( = ?auto_154136 ?auto_154143 ) ) ( not ( = ?auto_154137 ?auto_154143 ) ) ( not ( = ?auto_154138 ?auto_154143 ) ) ( not ( = ?auto_154139 ?auto_154143 ) ) ( not ( = ?auto_154142 ?auto_154143 ) ) ( not ( = ?auto_154141 ?auto_154143 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_154143 ?auto_154140 )
      ( MAKE-5PILE ?auto_154135 ?auto_154136 ?auto_154137 ?auto_154138 ?auto_154139 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_154144 - BLOCK
      ?auto_154145 - BLOCK
      ?auto_154146 - BLOCK
      ?auto_154147 - BLOCK
      ?auto_154148 - BLOCK
    )
    :vars
    (
      ?auto_154151 - BLOCK
      ?auto_154152 - BLOCK
      ?auto_154150 - BLOCK
      ?auto_154149 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154151 ?auto_154148 ) ( ON-TABLE ?auto_154144 ) ( ON ?auto_154145 ?auto_154144 ) ( ON ?auto_154146 ?auto_154145 ) ( ON ?auto_154147 ?auto_154146 ) ( ON ?auto_154148 ?auto_154147 ) ( not ( = ?auto_154144 ?auto_154145 ) ) ( not ( = ?auto_154144 ?auto_154146 ) ) ( not ( = ?auto_154144 ?auto_154147 ) ) ( not ( = ?auto_154144 ?auto_154148 ) ) ( not ( = ?auto_154144 ?auto_154151 ) ) ( not ( = ?auto_154145 ?auto_154146 ) ) ( not ( = ?auto_154145 ?auto_154147 ) ) ( not ( = ?auto_154145 ?auto_154148 ) ) ( not ( = ?auto_154145 ?auto_154151 ) ) ( not ( = ?auto_154146 ?auto_154147 ) ) ( not ( = ?auto_154146 ?auto_154148 ) ) ( not ( = ?auto_154146 ?auto_154151 ) ) ( not ( = ?auto_154147 ?auto_154148 ) ) ( not ( = ?auto_154147 ?auto_154151 ) ) ( not ( = ?auto_154148 ?auto_154151 ) ) ( not ( = ?auto_154144 ?auto_154152 ) ) ( not ( = ?auto_154144 ?auto_154150 ) ) ( not ( = ?auto_154145 ?auto_154152 ) ) ( not ( = ?auto_154145 ?auto_154150 ) ) ( not ( = ?auto_154146 ?auto_154152 ) ) ( not ( = ?auto_154146 ?auto_154150 ) ) ( not ( = ?auto_154147 ?auto_154152 ) ) ( not ( = ?auto_154147 ?auto_154150 ) ) ( not ( = ?auto_154148 ?auto_154152 ) ) ( not ( = ?auto_154148 ?auto_154150 ) ) ( not ( = ?auto_154151 ?auto_154152 ) ) ( not ( = ?auto_154151 ?auto_154150 ) ) ( not ( = ?auto_154152 ?auto_154150 ) ) ( ON ?auto_154152 ?auto_154151 ) ( CLEAR ?auto_154149 ) ( ON-TABLE ?auto_154149 ) ( not ( = ?auto_154149 ?auto_154150 ) ) ( not ( = ?auto_154144 ?auto_154149 ) ) ( not ( = ?auto_154145 ?auto_154149 ) ) ( not ( = ?auto_154146 ?auto_154149 ) ) ( not ( = ?auto_154147 ?auto_154149 ) ) ( not ( = ?auto_154148 ?auto_154149 ) ) ( not ( = ?auto_154151 ?auto_154149 ) ) ( not ( = ?auto_154152 ?auto_154149 ) ) ( ON ?auto_154150 ?auto_154152 ) ( CLEAR ?auto_154150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_154144 ?auto_154145 ?auto_154146 ?auto_154147 ?auto_154148 ?auto_154151 ?auto_154152 )
      ( MAKE-5PILE ?auto_154144 ?auto_154145 ?auto_154146 ?auto_154147 ?auto_154148 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_154153 - BLOCK
      ?auto_154154 - BLOCK
      ?auto_154155 - BLOCK
      ?auto_154156 - BLOCK
      ?auto_154157 - BLOCK
    )
    :vars
    (
      ?auto_154159 - BLOCK
      ?auto_154158 - BLOCK
      ?auto_154160 - BLOCK
      ?auto_154161 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154159 ?auto_154157 ) ( ON-TABLE ?auto_154153 ) ( ON ?auto_154154 ?auto_154153 ) ( ON ?auto_154155 ?auto_154154 ) ( ON ?auto_154156 ?auto_154155 ) ( ON ?auto_154157 ?auto_154156 ) ( not ( = ?auto_154153 ?auto_154154 ) ) ( not ( = ?auto_154153 ?auto_154155 ) ) ( not ( = ?auto_154153 ?auto_154156 ) ) ( not ( = ?auto_154153 ?auto_154157 ) ) ( not ( = ?auto_154153 ?auto_154159 ) ) ( not ( = ?auto_154154 ?auto_154155 ) ) ( not ( = ?auto_154154 ?auto_154156 ) ) ( not ( = ?auto_154154 ?auto_154157 ) ) ( not ( = ?auto_154154 ?auto_154159 ) ) ( not ( = ?auto_154155 ?auto_154156 ) ) ( not ( = ?auto_154155 ?auto_154157 ) ) ( not ( = ?auto_154155 ?auto_154159 ) ) ( not ( = ?auto_154156 ?auto_154157 ) ) ( not ( = ?auto_154156 ?auto_154159 ) ) ( not ( = ?auto_154157 ?auto_154159 ) ) ( not ( = ?auto_154153 ?auto_154158 ) ) ( not ( = ?auto_154153 ?auto_154160 ) ) ( not ( = ?auto_154154 ?auto_154158 ) ) ( not ( = ?auto_154154 ?auto_154160 ) ) ( not ( = ?auto_154155 ?auto_154158 ) ) ( not ( = ?auto_154155 ?auto_154160 ) ) ( not ( = ?auto_154156 ?auto_154158 ) ) ( not ( = ?auto_154156 ?auto_154160 ) ) ( not ( = ?auto_154157 ?auto_154158 ) ) ( not ( = ?auto_154157 ?auto_154160 ) ) ( not ( = ?auto_154159 ?auto_154158 ) ) ( not ( = ?auto_154159 ?auto_154160 ) ) ( not ( = ?auto_154158 ?auto_154160 ) ) ( ON ?auto_154158 ?auto_154159 ) ( not ( = ?auto_154161 ?auto_154160 ) ) ( not ( = ?auto_154153 ?auto_154161 ) ) ( not ( = ?auto_154154 ?auto_154161 ) ) ( not ( = ?auto_154155 ?auto_154161 ) ) ( not ( = ?auto_154156 ?auto_154161 ) ) ( not ( = ?auto_154157 ?auto_154161 ) ) ( not ( = ?auto_154159 ?auto_154161 ) ) ( not ( = ?auto_154158 ?auto_154161 ) ) ( ON ?auto_154160 ?auto_154158 ) ( CLEAR ?auto_154160 ) ( HOLDING ?auto_154161 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_154161 )
      ( MAKE-5PILE ?auto_154153 ?auto_154154 ?auto_154155 ?auto_154156 ?auto_154157 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_154162 - BLOCK
      ?auto_154163 - BLOCK
      ?auto_154164 - BLOCK
      ?auto_154165 - BLOCK
      ?auto_154166 - BLOCK
    )
    :vars
    (
      ?auto_154167 - BLOCK
      ?auto_154170 - BLOCK
      ?auto_154168 - BLOCK
      ?auto_154169 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154167 ?auto_154166 ) ( ON-TABLE ?auto_154162 ) ( ON ?auto_154163 ?auto_154162 ) ( ON ?auto_154164 ?auto_154163 ) ( ON ?auto_154165 ?auto_154164 ) ( ON ?auto_154166 ?auto_154165 ) ( not ( = ?auto_154162 ?auto_154163 ) ) ( not ( = ?auto_154162 ?auto_154164 ) ) ( not ( = ?auto_154162 ?auto_154165 ) ) ( not ( = ?auto_154162 ?auto_154166 ) ) ( not ( = ?auto_154162 ?auto_154167 ) ) ( not ( = ?auto_154163 ?auto_154164 ) ) ( not ( = ?auto_154163 ?auto_154165 ) ) ( not ( = ?auto_154163 ?auto_154166 ) ) ( not ( = ?auto_154163 ?auto_154167 ) ) ( not ( = ?auto_154164 ?auto_154165 ) ) ( not ( = ?auto_154164 ?auto_154166 ) ) ( not ( = ?auto_154164 ?auto_154167 ) ) ( not ( = ?auto_154165 ?auto_154166 ) ) ( not ( = ?auto_154165 ?auto_154167 ) ) ( not ( = ?auto_154166 ?auto_154167 ) ) ( not ( = ?auto_154162 ?auto_154170 ) ) ( not ( = ?auto_154162 ?auto_154168 ) ) ( not ( = ?auto_154163 ?auto_154170 ) ) ( not ( = ?auto_154163 ?auto_154168 ) ) ( not ( = ?auto_154164 ?auto_154170 ) ) ( not ( = ?auto_154164 ?auto_154168 ) ) ( not ( = ?auto_154165 ?auto_154170 ) ) ( not ( = ?auto_154165 ?auto_154168 ) ) ( not ( = ?auto_154166 ?auto_154170 ) ) ( not ( = ?auto_154166 ?auto_154168 ) ) ( not ( = ?auto_154167 ?auto_154170 ) ) ( not ( = ?auto_154167 ?auto_154168 ) ) ( not ( = ?auto_154170 ?auto_154168 ) ) ( ON ?auto_154170 ?auto_154167 ) ( not ( = ?auto_154169 ?auto_154168 ) ) ( not ( = ?auto_154162 ?auto_154169 ) ) ( not ( = ?auto_154163 ?auto_154169 ) ) ( not ( = ?auto_154164 ?auto_154169 ) ) ( not ( = ?auto_154165 ?auto_154169 ) ) ( not ( = ?auto_154166 ?auto_154169 ) ) ( not ( = ?auto_154167 ?auto_154169 ) ) ( not ( = ?auto_154170 ?auto_154169 ) ) ( ON ?auto_154168 ?auto_154170 ) ( ON ?auto_154169 ?auto_154168 ) ( CLEAR ?auto_154169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_154162 ?auto_154163 ?auto_154164 ?auto_154165 ?auto_154166 ?auto_154167 ?auto_154170 ?auto_154168 )
      ( MAKE-5PILE ?auto_154162 ?auto_154163 ?auto_154164 ?auto_154165 ?auto_154166 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_154175 - BLOCK
      ?auto_154176 - BLOCK
      ?auto_154177 - BLOCK
      ?auto_154178 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_154178 ) ( CLEAR ?auto_154177 ) ( ON-TABLE ?auto_154175 ) ( ON ?auto_154176 ?auto_154175 ) ( ON ?auto_154177 ?auto_154176 ) ( not ( = ?auto_154175 ?auto_154176 ) ) ( not ( = ?auto_154175 ?auto_154177 ) ) ( not ( = ?auto_154175 ?auto_154178 ) ) ( not ( = ?auto_154176 ?auto_154177 ) ) ( not ( = ?auto_154176 ?auto_154178 ) ) ( not ( = ?auto_154177 ?auto_154178 ) ) )
    :subtasks
    ( ( !STACK ?auto_154178 ?auto_154177 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_154179 - BLOCK
      ?auto_154180 - BLOCK
      ?auto_154181 - BLOCK
      ?auto_154182 - BLOCK
    )
    :vars
    (
      ?auto_154183 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_154181 ) ( ON-TABLE ?auto_154179 ) ( ON ?auto_154180 ?auto_154179 ) ( ON ?auto_154181 ?auto_154180 ) ( not ( = ?auto_154179 ?auto_154180 ) ) ( not ( = ?auto_154179 ?auto_154181 ) ) ( not ( = ?auto_154179 ?auto_154182 ) ) ( not ( = ?auto_154180 ?auto_154181 ) ) ( not ( = ?auto_154180 ?auto_154182 ) ) ( not ( = ?auto_154181 ?auto_154182 ) ) ( ON ?auto_154182 ?auto_154183 ) ( CLEAR ?auto_154182 ) ( HAND-EMPTY ) ( not ( = ?auto_154179 ?auto_154183 ) ) ( not ( = ?auto_154180 ?auto_154183 ) ) ( not ( = ?auto_154181 ?auto_154183 ) ) ( not ( = ?auto_154182 ?auto_154183 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_154182 ?auto_154183 )
      ( MAKE-4PILE ?auto_154179 ?auto_154180 ?auto_154181 ?auto_154182 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_154184 - BLOCK
      ?auto_154185 - BLOCK
      ?auto_154186 - BLOCK
      ?auto_154187 - BLOCK
    )
    :vars
    (
      ?auto_154188 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154184 ) ( ON ?auto_154185 ?auto_154184 ) ( not ( = ?auto_154184 ?auto_154185 ) ) ( not ( = ?auto_154184 ?auto_154186 ) ) ( not ( = ?auto_154184 ?auto_154187 ) ) ( not ( = ?auto_154185 ?auto_154186 ) ) ( not ( = ?auto_154185 ?auto_154187 ) ) ( not ( = ?auto_154186 ?auto_154187 ) ) ( ON ?auto_154187 ?auto_154188 ) ( CLEAR ?auto_154187 ) ( not ( = ?auto_154184 ?auto_154188 ) ) ( not ( = ?auto_154185 ?auto_154188 ) ) ( not ( = ?auto_154186 ?auto_154188 ) ) ( not ( = ?auto_154187 ?auto_154188 ) ) ( HOLDING ?auto_154186 ) ( CLEAR ?auto_154185 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_154184 ?auto_154185 ?auto_154186 )
      ( MAKE-4PILE ?auto_154184 ?auto_154185 ?auto_154186 ?auto_154187 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_154189 - BLOCK
      ?auto_154190 - BLOCK
      ?auto_154191 - BLOCK
      ?auto_154192 - BLOCK
    )
    :vars
    (
      ?auto_154193 - BLOCK
      ?auto_154196 - BLOCK
      ?auto_154195 - BLOCK
      ?auto_154194 - BLOCK
      ?auto_154197 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154189 ) ( ON ?auto_154190 ?auto_154189 ) ( not ( = ?auto_154189 ?auto_154190 ) ) ( not ( = ?auto_154189 ?auto_154191 ) ) ( not ( = ?auto_154189 ?auto_154192 ) ) ( not ( = ?auto_154190 ?auto_154191 ) ) ( not ( = ?auto_154190 ?auto_154192 ) ) ( not ( = ?auto_154191 ?auto_154192 ) ) ( ON ?auto_154192 ?auto_154193 ) ( not ( = ?auto_154189 ?auto_154193 ) ) ( not ( = ?auto_154190 ?auto_154193 ) ) ( not ( = ?auto_154191 ?auto_154193 ) ) ( not ( = ?auto_154192 ?auto_154193 ) ) ( CLEAR ?auto_154190 ) ( ON ?auto_154191 ?auto_154192 ) ( CLEAR ?auto_154191 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_154196 ) ( ON ?auto_154195 ?auto_154196 ) ( ON ?auto_154194 ?auto_154195 ) ( ON ?auto_154197 ?auto_154194 ) ( ON ?auto_154193 ?auto_154197 ) ( not ( = ?auto_154196 ?auto_154195 ) ) ( not ( = ?auto_154196 ?auto_154194 ) ) ( not ( = ?auto_154196 ?auto_154197 ) ) ( not ( = ?auto_154196 ?auto_154193 ) ) ( not ( = ?auto_154196 ?auto_154192 ) ) ( not ( = ?auto_154196 ?auto_154191 ) ) ( not ( = ?auto_154195 ?auto_154194 ) ) ( not ( = ?auto_154195 ?auto_154197 ) ) ( not ( = ?auto_154195 ?auto_154193 ) ) ( not ( = ?auto_154195 ?auto_154192 ) ) ( not ( = ?auto_154195 ?auto_154191 ) ) ( not ( = ?auto_154194 ?auto_154197 ) ) ( not ( = ?auto_154194 ?auto_154193 ) ) ( not ( = ?auto_154194 ?auto_154192 ) ) ( not ( = ?auto_154194 ?auto_154191 ) ) ( not ( = ?auto_154197 ?auto_154193 ) ) ( not ( = ?auto_154197 ?auto_154192 ) ) ( not ( = ?auto_154197 ?auto_154191 ) ) ( not ( = ?auto_154189 ?auto_154196 ) ) ( not ( = ?auto_154189 ?auto_154195 ) ) ( not ( = ?auto_154189 ?auto_154194 ) ) ( not ( = ?auto_154189 ?auto_154197 ) ) ( not ( = ?auto_154190 ?auto_154196 ) ) ( not ( = ?auto_154190 ?auto_154195 ) ) ( not ( = ?auto_154190 ?auto_154194 ) ) ( not ( = ?auto_154190 ?auto_154197 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_154196 ?auto_154195 ?auto_154194 ?auto_154197 ?auto_154193 ?auto_154192 )
      ( MAKE-4PILE ?auto_154189 ?auto_154190 ?auto_154191 ?auto_154192 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_154198 - BLOCK
      ?auto_154199 - BLOCK
      ?auto_154200 - BLOCK
      ?auto_154201 - BLOCK
    )
    :vars
    (
      ?auto_154204 - BLOCK
      ?auto_154203 - BLOCK
      ?auto_154205 - BLOCK
      ?auto_154202 - BLOCK
      ?auto_154206 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154198 ) ( not ( = ?auto_154198 ?auto_154199 ) ) ( not ( = ?auto_154198 ?auto_154200 ) ) ( not ( = ?auto_154198 ?auto_154201 ) ) ( not ( = ?auto_154199 ?auto_154200 ) ) ( not ( = ?auto_154199 ?auto_154201 ) ) ( not ( = ?auto_154200 ?auto_154201 ) ) ( ON ?auto_154201 ?auto_154204 ) ( not ( = ?auto_154198 ?auto_154204 ) ) ( not ( = ?auto_154199 ?auto_154204 ) ) ( not ( = ?auto_154200 ?auto_154204 ) ) ( not ( = ?auto_154201 ?auto_154204 ) ) ( ON ?auto_154200 ?auto_154201 ) ( CLEAR ?auto_154200 ) ( ON-TABLE ?auto_154203 ) ( ON ?auto_154205 ?auto_154203 ) ( ON ?auto_154202 ?auto_154205 ) ( ON ?auto_154206 ?auto_154202 ) ( ON ?auto_154204 ?auto_154206 ) ( not ( = ?auto_154203 ?auto_154205 ) ) ( not ( = ?auto_154203 ?auto_154202 ) ) ( not ( = ?auto_154203 ?auto_154206 ) ) ( not ( = ?auto_154203 ?auto_154204 ) ) ( not ( = ?auto_154203 ?auto_154201 ) ) ( not ( = ?auto_154203 ?auto_154200 ) ) ( not ( = ?auto_154205 ?auto_154202 ) ) ( not ( = ?auto_154205 ?auto_154206 ) ) ( not ( = ?auto_154205 ?auto_154204 ) ) ( not ( = ?auto_154205 ?auto_154201 ) ) ( not ( = ?auto_154205 ?auto_154200 ) ) ( not ( = ?auto_154202 ?auto_154206 ) ) ( not ( = ?auto_154202 ?auto_154204 ) ) ( not ( = ?auto_154202 ?auto_154201 ) ) ( not ( = ?auto_154202 ?auto_154200 ) ) ( not ( = ?auto_154206 ?auto_154204 ) ) ( not ( = ?auto_154206 ?auto_154201 ) ) ( not ( = ?auto_154206 ?auto_154200 ) ) ( not ( = ?auto_154198 ?auto_154203 ) ) ( not ( = ?auto_154198 ?auto_154205 ) ) ( not ( = ?auto_154198 ?auto_154202 ) ) ( not ( = ?auto_154198 ?auto_154206 ) ) ( not ( = ?auto_154199 ?auto_154203 ) ) ( not ( = ?auto_154199 ?auto_154205 ) ) ( not ( = ?auto_154199 ?auto_154202 ) ) ( not ( = ?auto_154199 ?auto_154206 ) ) ( HOLDING ?auto_154199 ) ( CLEAR ?auto_154198 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_154198 ?auto_154199 )
      ( MAKE-4PILE ?auto_154198 ?auto_154199 ?auto_154200 ?auto_154201 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_154207 - BLOCK
      ?auto_154208 - BLOCK
      ?auto_154209 - BLOCK
      ?auto_154210 - BLOCK
    )
    :vars
    (
      ?auto_154215 - BLOCK
      ?auto_154214 - BLOCK
      ?auto_154211 - BLOCK
      ?auto_154213 - BLOCK
      ?auto_154212 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154207 ) ( not ( = ?auto_154207 ?auto_154208 ) ) ( not ( = ?auto_154207 ?auto_154209 ) ) ( not ( = ?auto_154207 ?auto_154210 ) ) ( not ( = ?auto_154208 ?auto_154209 ) ) ( not ( = ?auto_154208 ?auto_154210 ) ) ( not ( = ?auto_154209 ?auto_154210 ) ) ( ON ?auto_154210 ?auto_154215 ) ( not ( = ?auto_154207 ?auto_154215 ) ) ( not ( = ?auto_154208 ?auto_154215 ) ) ( not ( = ?auto_154209 ?auto_154215 ) ) ( not ( = ?auto_154210 ?auto_154215 ) ) ( ON ?auto_154209 ?auto_154210 ) ( ON-TABLE ?auto_154214 ) ( ON ?auto_154211 ?auto_154214 ) ( ON ?auto_154213 ?auto_154211 ) ( ON ?auto_154212 ?auto_154213 ) ( ON ?auto_154215 ?auto_154212 ) ( not ( = ?auto_154214 ?auto_154211 ) ) ( not ( = ?auto_154214 ?auto_154213 ) ) ( not ( = ?auto_154214 ?auto_154212 ) ) ( not ( = ?auto_154214 ?auto_154215 ) ) ( not ( = ?auto_154214 ?auto_154210 ) ) ( not ( = ?auto_154214 ?auto_154209 ) ) ( not ( = ?auto_154211 ?auto_154213 ) ) ( not ( = ?auto_154211 ?auto_154212 ) ) ( not ( = ?auto_154211 ?auto_154215 ) ) ( not ( = ?auto_154211 ?auto_154210 ) ) ( not ( = ?auto_154211 ?auto_154209 ) ) ( not ( = ?auto_154213 ?auto_154212 ) ) ( not ( = ?auto_154213 ?auto_154215 ) ) ( not ( = ?auto_154213 ?auto_154210 ) ) ( not ( = ?auto_154213 ?auto_154209 ) ) ( not ( = ?auto_154212 ?auto_154215 ) ) ( not ( = ?auto_154212 ?auto_154210 ) ) ( not ( = ?auto_154212 ?auto_154209 ) ) ( not ( = ?auto_154207 ?auto_154214 ) ) ( not ( = ?auto_154207 ?auto_154211 ) ) ( not ( = ?auto_154207 ?auto_154213 ) ) ( not ( = ?auto_154207 ?auto_154212 ) ) ( not ( = ?auto_154208 ?auto_154214 ) ) ( not ( = ?auto_154208 ?auto_154211 ) ) ( not ( = ?auto_154208 ?auto_154213 ) ) ( not ( = ?auto_154208 ?auto_154212 ) ) ( CLEAR ?auto_154207 ) ( ON ?auto_154208 ?auto_154209 ) ( CLEAR ?auto_154208 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_154214 ?auto_154211 ?auto_154213 ?auto_154212 ?auto_154215 ?auto_154210 ?auto_154209 )
      ( MAKE-4PILE ?auto_154207 ?auto_154208 ?auto_154209 ?auto_154210 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_154216 - BLOCK
      ?auto_154217 - BLOCK
      ?auto_154218 - BLOCK
      ?auto_154219 - BLOCK
    )
    :vars
    (
      ?auto_154223 - BLOCK
      ?auto_154224 - BLOCK
      ?auto_154220 - BLOCK
      ?auto_154221 - BLOCK
      ?auto_154222 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154216 ?auto_154217 ) ) ( not ( = ?auto_154216 ?auto_154218 ) ) ( not ( = ?auto_154216 ?auto_154219 ) ) ( not ( = ?auto_154217 ?auto_154218 ) ) ( not ( = ?auto_154217 ?auto_154219 ) ) ( not ( = ?auto_154218 ?auto_154219 ) ) ( ON ?auto_154219 ?auto_154223 ) ( not ( = ?auto_154216 ?auto_154223 ) ) ( not ( = ?auto_154217 ?auto_154223 ) ) ( not ( = ?auto_154218 ?auto_154223 ) ) ( not ( = ?auto_154219 ?auto_154223 ) ) ( ON ?auto_154218 ?auto_154219 ) ( ON-TABLE ?auto_154224 ) ( ON ?auto_154220 ?auto_154224 ) ( ON ?auto_154221 ?auto_154220 ) ( ON ?auto_154222 ?auto_154221 ) ( ON ?auto_154223 ?auto_154222 ) ( not ( = ?auto_154224 ?auto_154220 ) ) ( not ( = ?auto_154224 ?auto_154221 ) ) ( not ( = ?auto_154224 ?auto_154222 ) ) ( not ( = ?auto_154224 ?auto_154223 ) ) ( not ( = ?auto_154224 ?auto_154219 ) ) ( not ( = ?auto_154224 ?auto_154218 ) ) ( not ( = ?auto_154220 ?auto_154221 ) ) ( not ( = ?auto_154220 ?auto_154222 ) ) ( not ( = ?auto_154220 ?auto_154223 ) ) ( not ( = ?auto_154220 ?auto_154219 ) ) ( not ( = ?auto_154220 ?auto_154218 ) ) ( not ( = ?auto_154221 ?auto_154222 ) ) ( not ( = ?auto_154221 ?auto_154223 ) ) ( not ( = ?auto_154221 ?auto_154219 ) ) ( not ( = ?auto_154221 ?auto_154218 ) ) ( not ( = ?auto_154222 ?auto_154223 ) ) ( not ( = ?auto_154222 ?auto_154219 ) ) ( not ( = ?auto_154222 ?auto_154218 ) ) ( not ( = ?auto_154216 ?auto_154224 ) ) ( not ( = ?auto_154216 ?auto_154220 ) ) ( not ( = ?auto_154216 ?auto_154221 ) ) ( not ( = ?auto_154216 ?auto_154222 ) ) ( not ( = ?auto_154217 ?auto_154224 ) ) ( not ( = ?auto_154217 ?auto_154220 ) ) ( not ( = ?auto_154217 ?auto_154221 ) ) ( not ( = ?auto_154217 ?auto_154222 ) ) ( ON ?auto_154217 ?auto_154218 ) ( CLEAR ?auto_154217 ) ( HOLDING ?auto_154216 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_154216 )
      ( MAKE-4PILE ?auto_154216 ?auto_154217 ?auto_154218 ?auto_154219 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_154225 - BLOCK
      ?auto_154226 - BLOCK
      ?auto_154227 - BLOCK
      ?auto_154228 - BLOCK
    )
    :vars
    (
      ?auto_154231 - BLOCK
      ?auto_154233 - BLOCK
      ?auto_154230 - BLOCK
      ?auto_154232 - BLOCK
      ?auto_154229 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154225 ?auto_154226 ) ) ( not ( = ?auto_154225 ?auto_154227 ) ) ( not ( = ?auto_154225 ?auto_154228 ) ) ( not ( = ?auto_154226 ?auto_154227 ) ) ( not ( = ?auto_154226 ?auto_154228 ) ) ( not ( = ?auto_154227 ?auto_154228 ) ) ( ON ?auto_154228 ?auto_154231 ) ( not ( = ?auto_154225 ?auto_154231 ) ) ( not ( = ?auto_154226 ?auto_154231 ) ) ( not ( = ?auto_154227 ?auto_154231 ) ) ( not ( = ?auto_154228 ?auto_154231 ) ) ( ON ?auto_154227 ?auto_154228 ) ( ON-TABLE ?auto_154233 ) ( ON ?auto_154230 ?auto_154233 ) ( ON ?auto_154232 ?auto_154230 ) ( ON ?auto_154229 ?auto_154232 ) ( ON ?auto_154231 ?auto_154229 ) ( not ( = ?auto_154233 ?auto_154230 ) ) ( not ( = ?auto_154233 ?auto_154232 ) ) ( not ( = ?auto_154233 ?auto_154229 ) ) ( not ( = ?auto_154233 ?auto_154231 ) ) ( not ( = ?auto_154233 ?auto_154228 ) ) ( not ( = ?auto_154233 ?auto_154227 ) ) ( not ( = ?auto_154230 ?auto_154232 ) ) ( not ( = ?auto_154230 ?auto_154229 ) ) ( not ( = ?auto_154230 ?auto_154231 ) ) ( not ( = ?auto_154230 ?auto_154228 ) ) ( not ( = ?auto_154230 ?auto_154227 ) ) ( not ( = ?auto_154232 ?auto_154229 ) ) ( not ( = ?auto_154232 ?auto_154231 ) ) ( not ( = ?auto_154232 ?auto_154228 ) ) ( not ( = ?auto_154232 ?auto_154227 ) ) ( not ( = ?auto_154229 ?auto_154231 ) ) ( not ( = ?auto_154229 ?auto_154228 ) ) ( not ( = ?auto_154229 ?auto_154227 ) ) ( not ( = ?auto_154225 ?auto_154233 ) ) ( not ( = ?auto_154225 ?auto_154230 ) ) ( not ( = ?auto_154225 ?auto_154232 ) ) ( not ( = ?auto_154225 ?auto_154229 ) ) ( not ( = ?auto_154226 ?auto_154233 ) ) ( not ( = ?auto_154226 ?auto_154230 ) ) ( not ( = ?auto_154226 ?auto_154232 ) ) ( not ( = ?auto_154226 ?auto_154229 ) ) ( ON ?auto_154226 ?auto_154227 ) ( ON ?auto_154225 ?auto_154226 ) ( CLEAR ?auto_154225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_154233 ?auto_154230 ?auto_154232 ?auto_154229 ?auto_154231 ?auto_154228 ?auto_154227 ?auto_154226 )
      ( MAKE-4PILE ?auto_154225 ?auto_154226 ?auto_154227 ?auto_154228 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_154238 - BLOCK
      ?auto_154239 - BLOCK
      ?auto_154240 - BLOCK
      ?auto_154241 - BLOCK
    )
    :vars
    (
      ?auto_154242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154242 ?auto_154241 ) ( CLEAR ?auto_154242 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_154238 ) ( ON ?auto_154239 ?auto_154238 ) ( ON ?auto_154240 ?auto_154239 ) ( ON ?auto_154241 ?auto_154240 ) ( not ( = ?auto_154238 ?auto_154239 ) ) ( not ( = ?auto_154238 ?auto_154240 ) ) ( not ( = ?auto_154238 ?auto_154241 ) ) ( not ( = ?auto_154238 ?auto_154242 ) ) ( not ( = ?auto_154239 ?auto_154240 ) ) ( not ( = ?auto_154239 ?auto_154241 ) ) ( not ( = ?auto_154239 ?auto_154242 ) ) ( not ( = ?auto_154240 ?auto_154241 ) ) ( not ( = ?auto_154240 ?auto_154242 ) ) ( not ( = ?auto_154241 ?auto_154242 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_154242 ?auto_154241 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_154243 - BLOCK
      ?auto_154244 - BLOCK
      ?auto_154245 - BLOCK
      ?auto_154246 - BLOCK
    )
    :vars
    (
      ?auto_154247 - BLOCK
      ?auto_154248 - BLOCK
      ?auto_154249 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154247 ?auto_154246 ) ( CLEAR ?auto_154247 ) ( ON-TABLE ?auto_154243 ) ( ON ?auto_154244 ?auto_154243 ) ( ON ?auto_154245 ?auto_154244 ) ( ON ?auto_154246 ?auto_154245 ) ( not ( = ?auto_154243 ?auto_154244 ) ) ( not ( = ?auto_154243 ?auto_154245 ) ) ( not ( = ?auto_154243 ?auto_154246 ) ) ( not ( = ?auto_154243 ?auto_154247 ) ) ( not ( = ?auto_154244 ?auto_154245 ) ) ( not ( = ?auto_154244 ?auto_154246 ) ) ( not ( = ?auto_154244 ?auto_154247 ) ) ( not ( = ?auto_154245 ?auto_154246 ) ) ( not ( = ?auto_154245 ?auto_154247 ) ) ( not ( = ?auto_154246 ?auto_154247 ) ) ( HOLDING ?auto_154248 ) ( CLEAR ?auto_154249 ) ( not ( = ?auto_154243 ?auto_154248 ) ) ( not ( = ?auto_154243 ?auto_154249 ) ) ( not ( = ?auto_154244 ?auto_154248 ) ) ( not ( = ?auto_154244 ?auto_154249 ) ) ( not ( = ?auto_154245 ?auto_154248 ) ) ( not ( = ?auto_154245 ?auto_154249 ) ) ( not ( = ?auto_154246 ?auto_154248 ) ) ( not ( = ?auto_154246 ?auto_154249 ) ) ( not ( = ?auto_154247 ?auto_154248 ) ) ( not ( = ?auto_154247 ?auto_154249 ) ) ( not ( = ?auto_154248 ?auto_154249 ) ) )
    :subtasks
    ( ( !STACK ?auto_154248 ?auto_154249 )
      ( MAKE-4PILE ?auto_154243 ?auto_154244 ?auto_154245 ?auto_154246 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_154250 - BLOCK
      ?auto_154251 - BLOCK
      ?auto_154252 - BLOCK
      ?auto_154253 - BLOCK
    )
    :vars
    (
      ?auto_154254 - BLOCK
      ?auto_154255 - BLOCK
      ?auto_154256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154254 ?auto_154253 ) ( ON-TABLE ?auto_154250 ) ( ON ?auto_154251 ?auto_154250 ) ( ON ?auto_154252 ?auto_154251 ) ( ON ?auto_154253 ?auto_154252 ) ( not ( = ?auto_154250 ?auto_154251 ) ) ( not ( = ?auto_154250 ?auto_154252 ) ) ( not ( = ?auto_154250 ?auto_154253 ) ) ( not ( = ?auto_154250 ?auto_154254 ) ) ( not ( = ?auto_154251 ?auto_154252 ) ) ( not ( = ?auto_154251 ?auto_154253 ) ) ( not ( = ?auto_154251 ?auto_154254 ) ) ( not ( = ?auto_154252 ?auto_154253 ) ) ( not ( = ?auto_154252 ?auto_154254 ) ) ( not ( = ?auto_154253 ?auto_154254 ) ) ( CLEAR ?auto_154255 ) ( not ( = ?auto_154250 ?auto_154256 ) ) ( not ( = ?auto_154250 ?auto_154255 ) ) ( not ( = ?auto_154251 ?auto_154256 ) ) ( not ( = ?auto_154251 ?auto_154255 ) ) ( not ( = ?auto_154252 ?auto_154256 ) ) ( not ( = ?auto_154252 ?auto_154255 ) ) ( not ( = ?auto_154253 ?auto_154256 ) ) ( not ( = ?auto_154253 ?auto_154255 ) ) ( not ( = ?auto_154254 ?auto_154256 ) ) ( not ( = ?auto_154254 ?auto_154255 ) ) ( not ( = ?auto_154256 ?auto_154255 ) ) ( ON ?auto_154256 ?auto_154254 ) ( CLEAR ?auto_154256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_154250 ?auto_154251 ?auto_154252 ?auto_154253 ?auto_154254 )
      ( MAKE-4PILE ?auto_154250 ?auto_154251 ?auto_154252 ?auto_154253 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_154257 - BLOCK
      ?auto_154258 - BLOCK
      ?auto_154259 - BLOCK
      ?auto_154260 - BLOCK
    )
    :vars
    (
      ?auto_154261 - BLOCK
      ?auto_154263 - BLOCK
      ?auto_154262 - BLOCK
      ?auto_154265 - BLOCK
      ?auto_154264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154261 ?auto_154260 ) ( ON-TABLE ?auto_154257 ) ( ON ?auto_154258 ?auto_154257 ) ( ON ?auto_154259 ?auto_154258 ) ( ON ?auto_154260 ?auto_154259 ) ( not ( = ?auto_154257 ?auto_154258 ) ) ( not ( = ?auto_154257 ?auto_154259 ) ) ( not ( = ?auto_154257 ?auto_154260 ) ) ( not ( = ?auto_154257 ?auto_154261 ) ) ( not ( = ?auto_154258 ?auto_154259 ) ) ( not ( = ?auto_154258 ?auto_154260 ) ) ( not ( = ?auto_154258 ?auto_154261 ) ) ( not ( = ?auto_154259 ?auto_154260 ) ) ( not ( = ?auto_154259 ?auto_154261 ) ) ( not ( = ?auto_154260 ?auto_154261 ) ) ( not ( = ?auto_154257 ?auto_154263 ) ) ( not ( = ?auto_154257 ?auto_154262 ) ) ( not ( = ?auto_154258 ?auto_154263 ) ) ( not ( = ?auto_154258 ?auto_154262 ) ) ( not ( = ?auto_154259 ?auto_154263 ) ) ( not ( = ?auto_154259 ?auto_154262 ) ) ( not ( = ?auto_154260 ?auto_154263 ) ) ( not ( = ?auto_154260 ?auto_154262 ) ) ( not ( = ?auto_154261 ?auto_154263 ) ) ( not ( = ?auto_154261 ?auto_154262 ) ) ( not ( = ?auto_154263 ?auto_154262 ) ) ( ON ?auto_154263 ?auto_154261 ) ( CLEAR ?auto_154263 ) ( HOLDING ?auto_154262 ) ( CLEAR ?auto_154265 ) ( ON-TABLE ?auto_154264 ) ( ON ?auto_154265 ?auto_154264 ) ( not ( = ?auto_154264 ?auto_154265 ) ) ( not ( = ?auto_154264 ?auto_154262 ) ) ( not ( = ?auto_154265 ?auto_154262 ) ) ( not ( = ?auto_154257 ?auto_154265 ) ) ( not ( = ?auto_154257 ?auto_154264 ) ) ( not ( = ?auto_154258 ?auto_154265 ) ) ( not ( = ?auto_154258 ?auto_154264 ) ) ( not ( = ?auto_154259 ?auto_154265 ) ) ( not ( = ?auto_154259 ?auto_154264 ) ) ( not ( = ?auto_154260 ?auto_154265 ) ) ( not ( = ?auto_154260 ?auto_154264 ) ) ( not ( = ?auto_154261 ?auto_154265 ) ) ( not ( = ?auto_154261 ?auto_154264 ) ) ( not ( = ?auto_154263 ?auto_154265 ) ) ( not ( = ?auto_154263 ?auto_154264 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_154264 ?auto_154265 ?auto_154262 )
      ( MAKE-4PILE ?auto_154257 ?auto_154258 ?auto_154259 ?auto_154260 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_154266 - BLOCK
      ?auto_154267 - BLOCK
      ?auto_154268 - BLOCK
      ?auto_154269 - BLOCK
    )
    :vars
    (
      ?auto_154271 - BLOCK
      ?auto_154272 - BLOCK
      ?auto_154270 - BLOCK
      ?auto_154274 - BLOCK
      ?auto_154273 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154271 ?auto_154269 ) ( ON-TABLE ?auto_154266 ) ( ON ?auto_154267 ?auto_154266 ) ( ON ?auto_154268 ?auto_154267 ) ( ON ?auto_154269 ?auto_154268 ) ( not ( = ?auto_154266 ?auto_154267 ) ) ( not ( = ?auto_154266 ?auto_154268 ) ) ( not ( = ?auto_154266 ?auto_154269 ) ) ( not ( = ?auto_154266 ?auto_154271 ) ) ( not ( = ?auto_154267 ?auto_154268 ) ) ( not ( = ?auto_154267 ?auto_154269 ) ) ( not ( = ?auto_154267 ?auto_154271 ) ) ( not ( = ?auto_154268 ?auto_154269 ) ) ( not ( = ?auto_154268 ?auto_154271 ) ) ( not ( = ?auto_154269 ?auto_154271 ) ) ( not ( = ?auto_154266 ?auto_154272 ) ) ( not ( = ?auto_154266 ?auto_154270 ) ) ( not ( = ?auto_154267 ?auto_154272 ) ) ( not ( = ?auto_154267 ?auto_154270 ) ) ( not ( = ?auto_154268 ?auto_154272 ) ) ( not ( = ?auto_154268 ?auto_154270 ) ) ( not ( = ?auto_154269 ?auto_154272 ) ) ( not ( = ?auto_154269 ?auto_154270 ) ) ( not ( = ?auto_154271 ?auto_154272 ) ) ( not ( = ?auto_154271 ?auto_154270 ) ) ( not ( = ?auto_154272 ?auto_154270 ) ) ( ON ?auto_154272 ?auto_154271 ) ( CLEAR ?auto_154274 ) ( ON-TABLE ?auto_154273 ) ( ON ?auto_154274 ?auto_154273 ) ( not ( = ?auto_154273 ?auto_154274 ) ) ( not ( = ?auto_154273 ?auto_154270 ) ) ( not ( = ?auto_154274 ?auto_154270 ) ) ( not ( = ?auto_154266 ?auto_154274 ) ) ( not ( = ?auto_154266 ?auto_154273 ) ) ( not ( = ?auto_154267 ?auto_154274 ) ) ( not ( = ?auto_154267 ?auto_154273 ) ) ( not ( = ?auto_154268 ?auto_154274 ) ) ( not ( = ?auto_154268 ?auto_154273 ) ) ( not ( = ?auto_154269 ?auto_154274 ) ) ( not ( = ?auto_154269 ?auto_154273 ) ) ( not ( = ?auto_154271 ?auto_154274 ) ) ( not ( = ?auto_154271 ?auto_154273 ) ) ( not ( = ?auto_154272 ?auto_154274 ) ) ( not ( = ?auto_154272 ?auto_154273 ) ) ( ON ?auto_154270 ?auto_154272 ) ( CLEAR ?auto_154270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_154266 ?auto_154267 ?auto_154268 ?auto_154269 ?auto_154271 ?auto_154272 )
      ( MAKE-4PILE ?auto_154266 ?auto_154267 ?auto_154268 ?auto_154269 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_154275 - BLOCK
      ?auto_154276 - BLOCK
      ?auto_154277 - BLOCK
      ?auto_154278 - BLOCK
    )
    :vars
    (
      ?auto_154281 - BLOCK
      ?auto_154282 - BLOCK
      ?auto_154280 - BLOCK
      ?auto_154283 - BLOCK
      ?auto_154279 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154281 ?auto_154278 ) ( ON-TABLE ?auto_154275 ) ( ON ?auto_154276 ?auto_154275 ) ( ON ?auto_154277 ?auto_154276 ) ( ON ?auto_154278 ?auto_154277 ) ( not ( = ?auto_154275 ?auto_154276 ) ) ( not ( = ?auto_154275 ?auto_154277 ) ) ( not ( = ?auto_154275 ?auto_154278 ) ) ( not ( = ?auto_154275 ?auto_154281 ) ) ( not ( = ?auto_154276 ?auto_154277 ) ) ( not ( = ?auto_154276 ?auto_154278 ) ) ( not ( = ?auto_154276 ?auto_154281 ) ) ( not ( = ?auto_154277 ?auto_154278 ) ) ( not ( = ?auto_154277 ?auto_154281 ) ) ( not ( = ?auto_154278 ?auto_154281 ) ) ( not ( = ?auto_154275 ?auto_154282 ) ) ( not ( = ?auto_154275 ?auto_154280 ) ) ( not ( = ?auto_154276 ?auto_154282 ) ) ( not ( = ?auto_154276 ?auto_154280 ) ) ( not ( = ?auto_154277 ?auto_154282 ) ) ( not ( = ?auto_154277 ?auto_154280 ) ) ( not ( = ?auto_154278 ?auto_154282 ) ) ( not ( = ?auto_154278 ?auto_154280 ) ) ( not ( = ?auto_154281 ?auto_154282 ) ) ( not ( = ?auto_154281 ?auto_154280 ) ) ( not ( = ?auto_154282 ?auto_154280 ) ) ( ON ?auto_154282 ?auto_154281 ) ( ON-TABLE ?auto_154283 ) ( not ( = ?auto_154283 ?auto_154279 ) ) ( not ( = ?auto_154283 ?auto_154280 ) ) ( not ( = ?auto_154279 ?auto_154280 ) ) ( not ( = ?auto_154275 ?auto_154279 ) ) ( not ( = ?auto_154275 ?auto_154283 ) ) ( not ( = ?auto_154276 ?auto_154279 ) ) ( not ( = ?auto_154276 ?auto_154283 ) ) ( not ( = ?auto_154277 ?auto_154279 ) ) ( not ( = ?auto_154277 ?auto_154283 ) ) ( not ( = ?auto_154278 ?auto_154279 ) ) ( not ( = ?auto_154278 ?auto_154283 ) ) ( not ( = ?auto_154281 ?auto_154279 ) ) ( not ( = ?auto_154281 ?auto_154283 ) ) ( not ( = ?auto_154282 ?auto_154279 ) ) ( not ( = ?auto_154282 ?auto_154283 ) ) ( ON ?auto_154280 ?auto_154282 ) ( CLEAR ?auto_154280 ) ( HOLDING ?auto_154279 ) ( CLEAR ?auto_154283 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_154283 ?auto_154279 )
      ( MAKE-4PILE ?auto_154275 ?auto_154276 ?auto_154277 ?auto_154278 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_154284 - BLOCK
      ?auto_154285 - BLOCK
      ?auto_154286 - BLOCK
      ?auto_154287 - BLOCK
    )
    :vars
    (
      ?auto_154291 - BLOCK
      ?auto_154290 - BLOCK
      ?auto_154288 - BLOCK
      ?auto_154289 - BLOCK
      ?auto_154292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154291 ?auto_154287 ) ( ON-TABLE ?auto_154284 ) ( ON ?auto_154285 ?auto_154284 ) ( ON ?auto_154286 ?auto_154285 ) ( ON ?auto_154287 ?auto_154286 ) ( not ( = ?auto_154284 ?auto_154285 ) ) ( not ( = ?auto_154284 ?auto_154286 ) ) ( not ( = ?auto_154284 ?auto_154287 ) ) ( not ( = ?auto_154284 ?auto_154291 ) ) ( not ( = ?auto_154285 ?auto_154286 ) ) ( not ( = ?auto_154285 ?auto_154287 ) ) ( not ( = ?auto_154285 ?auto_154291 ) ) ( not ( = ?auto_154286 ?auto_154287 ) ) ( not ( = ?auto_154286 ?auto_154291 ) ) ( not ( = ?auto_154287 ?auto_154291 ) ) ( not ( = ?auto_154284 ?auto_154290 ) ) ( not ( = ?auto_154284 ?auto_154288 ) ) ( not ( = ?auto_154285 ?auto_154290 ) ) ( not ( = ?auto_154285 ?auto_154288 ) ) ( not ( = ?auto_154286 ?auto_154290 ) ) ( not ( = ?auto_154286 ?auto_154288 ) ) ( not ( = ?auto_154287 ?auto_154290 ) ) ( not ( = ?auto_154287 ?auto_154288 ) ) ( not ( = ?auto_154291 ?auto_154290 ) ) ( not ( = ?auto_154291 ?auto_154288 ) ) ( not ( = ?auto_154290 ?auto_154288 ) ) ( ON ?auto_154290 ?auto_154291 ) ( ON-TABLE ?auto_154289 ) ( not ( = ?auto_154289 ?auto_154292 ) ) ( not ( = ?auto_154289 ?auto_154288 ) ) ( not ( = ?auto_154292 ?auto_154288 ) ) ( not ( = ?auto_154284 ?auto_154292 ) ) ( not ( = ?auto_154284 ?auto_154289 ) ) ( not ( = ?auto_154285 ?auto_154292 ) ) ( not ( = ?auto_154285 ?auto_154289 ) ) ( not ( = ?auto_154286 ?auto_154292 ) ) ( not ( = ?auto_154286 ?auto_154289 ) ) ( not ( = ?auto_154287 ?auto_154292 ) ) ( not ( = ?auto_154287 ?auto_154289 ) ) ( not ( = ?auto_154291 ?auto_154292 ) ) ( not ( = ?auto_154291 ?auto_154289 ) ) ( not ( = ?auto_154290 ?auto_154292 ) ) ( not ( = ?auto_154290 ?auto_154289 ) ) ( ON ?auto_154288 ?auto_154290 ) ( CLEAR ?auto_154289 ) ( ON ?auto_154292 ?auto_154288 ) ( CLEAR ?auto_154292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_154284 ?auto_154285 ?auto_154286 ?auto_154287 ?auto_154291 ?auto_154290 ?auto_154288 )
      ( MAKE-4PILE ?auto_154284 ?auto_154285 ?auto_154286 ?auto_154287 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_154293 - BLOCK
      ?auto_154294 - BLOCK
      ?auto_154295 - BLOCK
      ?auto_154296 - BLOCK
    )
    :vars
    (
      ?auto_154298 - BLOCK
      ?auto_154297 - BLOCK
      ?auto_154300 - BLOCK
      ?auto_154299 - BLOCK
      ?auto_154301 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154298 ?auto_154296 ) ( ON-TABLE ?auto_154293 ) ( ON ?auto_154294 ?auto_154293 ) ( ON ?auto_154295 ?auto_154294 ) ( ON ?auto_154296 ?auto_154295 ) ( not ( = ?auto_154293 ?auto_154294 ) ) ( not ( = ?auto_154293 ?auto_154295 ) ) ( not ( = ?auto_154293 ?auto_154296 ) ) ( not ( = ?auto_154293 ?auto_154298 ) ) ( not ( = ?auto_154294 ?auto_154295 ) ) ( not ( = ?auto_154294 ?auto_154296 ) ) ( not ( = ?auto_154294 ?auto_154298 ) ) ( not ( = ?auto_154295 ?auto_154296 ) ) ( not ( = ?auto_154295 ?auto_154298 ) ) ( not ( = ?auto_154296 ?auto_154298 ) ) ( not ( = ?auto_154293 ?auto_154297 ) ) ( not ( = ?auto_154293 ?auto_154300 ) ) ( not ( = ?auto_154294 ?auto_154297 ) ) ( not ( = ?auto_154294 ?auto_154300 ) ) ( not ( = ?auto_154295 ?auto_154297 ) ) ( not ( = ?auto_154295 ?auto_154300 ) ) ( not ( = ?auto_154296 ?auto_154297 ) ) ( not ( = ?auto_154296 ?auto_154300 ) ) ( not ( = ?auto_154298 ?auto_154297 ) ) ( not ( = ?auto_154298 ?auto_154300 ) ) ( not ( = ?auto_154297 ?auto_154300 ) ) ( ON ?auto_154297 ?auto_154298 ) ( not ( = ?auto_154299 ?auto_154301 ) ) ( not ( = ?auto_154299 ?auto_154300 ) ) ( not ( = ?auto_154301 ?auto_154300 ) ) ( not ( = ?auto_154293 ?auto_154301 ) ) ( not ( = ?auto_154293 ?auto_154299 ) ) ( not ( = ?auto_154294 ?auto_154301 ) ) ( not ( = ?auto_154294 ?auto_154299 ) ) ( not ( = ?auto_154295 ?auto_154301 ) ) ( not ( = ?auto_154295 ?auto_154299 ) ) ( not ( = ?auto_154296 ?auto_154301 ) ) ( not ( = ?auto_154296 ?auto_154299 ) ) ( not ( = ?auto_154298 ?auto_154301 ) ) ( not ( = ?auto_154298 ?auto_154299 ) ) ( not ( = ?auto_154297 ?auto_154301 ) ) ( not ( = ?auto_154297 ?auto_154299 ) ) ( ON ?auto_154300 ?auto_154297 ) ( ON ?auto_154301 ?auto_154300 ) ( CLEAR ?auto_154301 ) ( HOLDING ?auto_154299 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_154299 )
      ( MAKE-4PILE ?auto_154293 ?auto_154294 ?auto_154295 ?auto_154296 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_154302 - BLOCK
      ?auto_154303 - BLOCK
      ?auto_154304 - BLOCK
      ?auto_154305 - BLOCK
    )
    :vars
    (
      ?auto_154306 - BLOCK
      ?auto_154310 - BLOCK
      ?auto_154307 - BLOCK
      ?auto_154308 - BLOCK
      ?auto_154309 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154306 ?auto_154305 ) ( ON-TABLE ?auto_154302 ) ( ON ?auto_154303 ?auto_154302 ) ( ON ?auto_154304 ?auto_154303 ) ( ON ?auto_154305 ?auto_154304 ) ( not ( = ?auto_154302 ?auto_154303 ) ) ( not ( = ?auto_154302 ?auto_154304 ) ) ( not ( = ?auto_154302 ?auto_154305 ) ) ( not ( = ?auto_154302 ?auto_154306 ) ) ( not ( = ?auto_154303 ?auto_154304 ) ) ( not ( = ?auto_154303 ?auto_154305 ) ) ( not ( = ?auto_154303 ?auto_154306 ) ) ( not ( = ?auto_154304 ?auto_154305 ) ) ( not ( = ?auto_154304 ?auto_154306 ) ) ( not ( = ?auto_154305 ?auto_154306 ) ) ( not ( = ?auto_154302 ?auto_154310 ) ) ( not ( = ?auto_154302 ?auto_154307 ) ) ( not ( = ?auto_154303 ?auto_154310 ) ) ( not ( = ?auto_154303 ?auto_154307 ) ) ( not ( = ?auto_154304 ?auto_154310 ) ) ( not ( = ?auto_154304 ?auto_154307 ) ) ( not ( = ?auto_154305 ?auto_154310 ) ) ( not ( = ?auto_154305 ?auto_154307 ) ) ( not ( = ?auto_154306 ?auto_154310 ) ) ( not ( = ?auto_154306 ?auto_154307 ) ) ( not ( = ?auto_154310 ?auto_154307 ) ) ( ON ?auto_154310 ?auto_154306 ) ( not ( = ?auto_154308 ?auto_154309 ) ) ( not ( = ?auto_154308 ?auto_154307 ) ) ( not ( = ?auto_154309 ?auto_154307 ) ) ( not ( = ?auto_154302 ?auto_154309 ) ) ( not ( = ?auto_154302 ?auto_154308 ) ) ( not ( = ?auto_154303 ?auto_154309 ) ) ( not ( = ?auto_154303 ?auto_154308 ) ) ( not ( = ?auto_154304 ?auto_154309 ) ) ( not ( = ?auto_154304 ?auto_154308 ) ) ( not ( = ?auto_154305 ?auto_154309 ) ) ( not ( = ?auto_154305 ?auto_154308 ) ) ( not ( = ?auto_154306 ?auto_154309 ) ) ( not ( = ?auto_154306 ?auto_154308 ) ) ( not ( = ?auto_154310 ?auto_154309 ) ) ( not ( = ?auto_154310 ?auto_154308 ) ) ( ON ?auto_154307 ?auto_154310 ) ( ON ?auto_154309 ?auto_154307 ) ( ON ?auto_154308 ?auto_154309 ) ( CLEAR ?auto_154308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_154302 ?auto_154303 ?auto_154304 ?auto_154305 ?auto_154306 ?auto_154310 ?auto_154307 ?auto_154309 )
      ( MAKE-4PILE ?auto_154302 ?auto_154303 ?auto_154304 ?auto_154305 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_154316 - BLOCK
      ?auto_154317 - BLOCK
      ?auto_154318 - BLOCK
      ?auto_154319 - BLOCK
      ?auto_154320 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_154320 ) ( CLEAR ?auto_154319 ) ( ON-TABLE ?auto_154316 ) ( ON ?auto_154317 ?auto_154316 ) ( ON ?auto_154318 ?auto_154317 ) ( ON ?auto_154319 ?auto_154318 ) ( not ( = ?auto_154316 ?auto_154317 ) ) ( not ( = ?auto_154316 ?auto_154318 ) ) ( not ( = ?auto_154316 ?auto_154319 ) ) ( not ( = ?auto_154316 ?auto_154320 ) ) ( not ( = ?auto_154317 ?auto_154318 ) ) ( not ( = ?auto_154317 ?auto_154319 ) ) ( not ( = ?auto_154317 ?auto_154320 ) ) ( not ( = ?auto_154318 ?auto_154319 ) ) ( not ( = ?auto_154318 ?auto_154320 ) ) ( not ( = ?auto_154319 ?auto_154320 ) ) )
    :subtasks
    ( ( !STACK ?auto_154320 ?auto_154319 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_154321 - BLOCK
      ?auto_154322 - BLOCK
      ?auto_154323 - BLOCK
      ?auto_154324 - BLOCK
      ?auto_154325 - BLOCK
    )
    :vars
    (
      ?auto_154326 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_154324 ) ( ON-TABLE ?auto_154321 ) ( ON ?auto_154322 ?auto_154321 ) ( ON ?auto_154323 ?auto_154322 ) ( ON ?auto_154324 ?auto_154323 ) ( not ( = ?auto_154321 ?auto_154322 ) ) ( not ( = ?auto_154321 ?auto_154323 ) ) ( not ( = ?auto_154321 ?auto_154324 ) ) ( not ( = ?auto_154321 ?auto_154325 ) ) ( not ( = ?auto_154322 ?auto_154323 ) ) ( not ( = ?auto_154322 ?auto_154324 ) ) ( not ( = ?auto_154322 ?auto_154325 ) ) ( not ( = ?auto_154323 ?auto_154324 ) ) ( not ( = ?auto_154323 ?auto_154325 ) ) ( not ( = ?auto_154324 ?auto_154325 ) ) ( ON ?auto_154325 ?auto_154326 ) ( CLEAR ?auto_154325 ) ( HAND-EMPTY ) ( not ( = ?auto_154321 ?auto_154326 ) ) ( not ( = ?auto_154322 ?auto_154326 ) ) ( not ( = ?auto_154323 ?auto_154326 ) ) ( not ( = ?auto_154324 ?auto_154326 ) ) ( not ( = ?auto_154325 ?auto_154326 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_154325 ?auto_154326 )
      ( MAKE-5PILE ?auto_154321 ?auto_154322 ?auto_154323 ?auto_154324 ?auto_154325 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_154327 - BLOCK
      ?auto_154328 - BLOCK
      ?auto_154329 - BLOCK
      ?auto_154330 - BLOCK
      ?auto_154331 - BLOCK
    )
    :vars
    (
      ?auto_154332 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154327 ) ( ON ?auto_154328 ?auto_154327 ) ( ON ?auto_154329 ?auto_154328 ) ( not ( = ?auto_154327 ?auto_154328 ) ) ( not ( = ?auto_154327 ?auto_154329 ) ) ( not ( = ?auto_154327 ?auto_154330 ) ) ( not ( = ?auto_154327 ?auto_154331 ) ) ( not ( = ?auto_154328 ?auto_154329 ) ) ( not ( = ?auto_154328 ?auto_154330 ) ) ( not ( = ?auto_154328 ?auto_154331 ) ) ( not ( = ?auto_154329 ?auto_154330 ) ) ( not ( = ?auto_154329 ?auto_154331 ) ) ( not ( = ?auto_154330 ?auto_154331 ) ) ( ON ?auto_154331 ?auto_154332 ) ( CLEAR ?auto_154331 ) ( not ( = ?auto_154327 ?auto_154332 ) ) ( not ( = ?auto_154328 ?auto_154332 ) ) ( not ( = ?auto_154329 ?auto_154332 ) ) ( not ( = ?auto_154330 ?auto_154332 ) ) ( not ( = ?auto_154331 ?auto_154332 ) ) ( HOLDING ?auto_154330 ) ( CLEAR ?auto_154329 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_154327 ?auto_154328 ?auto_154329 ?auto_154330 )
      ( MAKE-5PILE ?auto_154327 ?auto_154328 ?auto_154329 ?auto_154330 ?auto_154331 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_154333 - BLOCK
      ?auto_154334 - BLOCK
      ?auto_154335 - BLOCK
      ?auto_154336 - BLOCK
      ?auto_154337 - BLOCK
    )
    :vars
    (
      ?auto_154338 - BLOCK
      ?auto_154341 - BLOCK
      ?auto_154339 - BLOCK
      ?auto_154340 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154333 ) ( ON ?auto_154334 ?auto_154333 ) ( ON ?auto_154335 ?auto_154334 ) ( not ( = ?auto_154333 ?auto_154334 ) ) ( not ( = ?auto_154333 ?auto_154335 ) ) ( not ( = ?auto_154333 ?auto_154336 ) ) ( not ( = ?auto_154333 ?auto_154337 ) ) ( not ( = ?auto_154334 ?auto_154335 ) ) ( not ( = ?auto_154334 ?auto_154336 ) ) ( not ( = ?auto_154334 ?auto_154337 ) ) ( not ( = ?auto_154335 ?auto_154336 ) ) ( not ( = ?auto_154335 ?auto_154337 ) ) ( not ( = ?auto_154336 ?auto_154337 ) ) ( ON ?auto_154337 ?auto_154338 ) ( not ( = ?auto_154333 ?auto_154338 ) ) ( not ( = ?auto_154334 ?auto_154338 ) ) ( not ( = ?auto_154335 ?auto_154338 ) ) ( not ( = ?auto_154336 ?auto_154338 ) ) ( not ( = ?auto_154337 ?auto_154338 ) ) ( CLEAR ?auto_154335 ) ( ON ?auto_154336 ?auto_154337 ) ( CLEAR ?auto_154336 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_154341 ) ( ON ?auto_154339 ?auto_154341 ) ( ON ?auto_154340 ?auto_154339 ) ( ON ?auto_154338 ?auto_154340 ) ( not ( = ?auto_154341 ?auto_154339 ) ) ( not ( = ?auto_154341 ?auto_154340 ) ) ( not ( = ?auto_154341 ?auto_154338 ) ) ( not ( = ?auto_154341 ?auto_154337 ) ) ( not ( = ?auto_154341 ?auto_154336 ) ) ( not ( = ?auto_154339 ?auto_154340 ) ) ( not ( = ?auto_154339 ?auto_154338 ) ) ( not ( = ?auto_154339 ?auto_154337 ) ) ( not ( = ?auto_154339 ?auto_154336 ) ) ( not ( = ?auto_154340 ?auto_154338 ) ) ( not ( = ?auto_154340 ?auto_154337 ) ) ( not ( = ?auto_154340 ?auto_154336 ) ) ( not ( = ?auto_154333 ?auto_154341 ) ) ( not ( = ?auto_154333 ?auto_154339 ) ) ( not ( = ?auto_154333 ?auto_154340 ) ) ( not ( = ?auto_154334 ?auto_154341 ) ) ( not ( = ?auto_154334 ?auto_154339 ) ) ( not ( = ?auto_154334 ?auto_154340 ) ) ( not ( = ?auto_154335 ?auto_154341 ) ) ( not ( = ?auto_154335 ?auto_154339 ) ) ( not ( = ?auto_154335 ?auto_154340 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_154341 ?auto_154339 ?auto_154340 ?auto_154338 ?auto_154337 )
      ( MAKE-5PILE ?auto_154333 ?auto_154334 ?auto_154335 ?auto_154336 ?auto_154337 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_154342 - BLOCK
      ?auto_154343 - BLOCK
      ?auto_154344 - BLOCK
      ?auto_154345 - BLOCK
      ?auto_154346 - BLOCK
    )
    :vars
    (
      ?auto_154347 - BLOCK
      ?auto_154348 - BLOCK
      ?auto_154349 - BLOCK
      ?auto_154350 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154342 ) ( ON ?auto_154343 ?auto_154342 ) ( not ( = ?auto_154342 ?auto_154343 ) ) ( not ( = ?auto_154342 ?auto_154344 ) ) ( not ( = ?auto_154342 ?auto_154345 ) ) ( not ( = ?auto_154342 ?auto_154346 ) ) ( not ( = ?auto_154343 ?auto_154344 ) ) ( not ( = ?auto_154343 ?auto_154345 ) ) ( not ( = ?auto_154343 ?auto_154346 ) ) ( not ( = ?auto_154344 ?auto_154345 ) ) ( not ( = ?auto_154344 ?auto_154346 ) ) ( not ( = ?auto_154345 ?auto_154346 ) ) ( ON ?auto_154346 ?auto_154347 ) ( not ( = ?auto_154342 ?auto_154347 ) ) ( not ( = ?auto_154343 ?auto_154347 ) ) ( not ( = ?auto_154344 ?auto_154347 ) ) ( not ( = ?auto_154345 ?auto_154347 ) ) ( not ( = ?auto_154346 ?auto_154347 ) ) ( ON ?auto_154345 ?auto_154346 ) ( CLEAR ?auto_154345 ) ( ON-TABLE ?auto_154348 ) ( ON ?auto_154349 ?auto_154348 ) ( ON ?auto_154350 ?auto_154349 ) ( ON ?auto_154347 ?auto_154350 ) ( not ( = ?auto_154348 ?auto_154349 ) ) ( not ( = ?auto_154348 ?auto_154350 ) ) ( not ( = ?auto_154348 ?auto_154347 ) ) ( not ( = ?auto_154348 ?auto_154346 ) ) ( not ( = ?auto_154348 ?auto_154345 ) ) ( not ( = ?auto_154349 ?auto_154350 ) ) ( not ( = ?auto_154349 ?auto_154347 ) ) ( not ( = ?auto_154349 ?auto_154346 ) ) ( not ( = ?auto_154349 ?auto_154345 ) ) ( not ( = ?auto_154350 ?auto_154347 ) ) ( not ( = ?auto_154350 ?auto_154346 ) ) ( not ( = ?auto_154350 ?auto_154345 ) ) ( not ( = ?auto_154342 ?auto_154348 ) ) ( not ( = ?auto_154342 ?auto_154349 ) ) ( not ( = ?auto_154342 ?auto_154350 ) ) ( not ( = ?auto_154343 ?auto_154348 ) ) ( not ( = ?auto_154343 ?auto_154349 ) ) ( not ( = ?auto_154343 ?auto_154350 ) ) ( not ( = ?auto_154344 ?auto_154348 ) ) ( not ( = ?auto_154344 ?auto_154349 ) ) ( not ( = ?auto_154344 ?auto_154350 ) ) ( HOLDING ?auto_154344 ) ( CLEAR ?auto_154343 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_154342 ?auto_154343 ?auto_154344 )
      ( MAKE-5PILE ?auto_154342 ?auto_154343 ?auto_154344 ?auto_154345 ?auto_154346 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_154351 - BLOCK
      ?auto_154352 - BLOCK
      ?auto_154353 - BLOCK
      ?auto_154354 - BLOCK
      ?auto_154355 - BLOCK
    )
    :vars
    (
      ?auto_154357 - BLOCK
      ?auto_154356 - BLOCK
      ?auto_154358 - BLOCK
      ?auto_154359 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154351 ) ( ON ?auto_154352 ?auto_154351 ) ( not ( = ?auto_154351 ?auto_154352 ) ) ( not ( = ?auto_154351 ?auto_154353 ) ) ( not ( = ?auto_154351 ?auto_154354 ) ) ( not ( = ?auto_154351 ?auto_154355 ) ) ( not ( = ?auto_154352 ?auto_154353 ) ) ( not ( = ?auto_154352 ?auto_154354 ) ) ( not ( = ?auto_154352 ?auto_154355 ) ) ( not ( = ?auto_154353 ?auto_154354 ) ) ( not ( = ?auto_154353 ?auto_154355 ) ) ( not ( = ?auto_154354 ?auto_154355 ) ) ( ON ?auto_154355 ?auto_154357 ) ( not ( = ?auto_154351 ?auto_154357 ) ) ( not ( = ?auto_154352 ?auto_154357 ) ) ( not ( = ?auto_154353 ?auto_154357 ) ) ( not ( = ?auto_154354 ?auto_154357 ) ) ( not ( = ?auto_154355 ?auto_154357 ) ) ( ON ?auto_154354 ?auto_154355 ) ( ON-TABLE ?auto_154356 ) ( ON ?auto_154358 ?auto_154356 ) ( ON ?auto_154359 ?auto_154358 ) ( ON ?auto_154357 ?auto_154359 ) ( not ( = ?auto_154356 ?auto_154358 ) ) ( not ( = ?auto_154356 ?auto_154359 ) ) ( not ( = ?auto_154356 ?auto_154357 ) ) ( not ( = ?auto_154356 ?auto_154355 ) ) ( not ( = ?auto_154356 ?auto_154354 ) ) ( not ( = ?auto_154358 ?auto_154359 ) ) ( not ( = ?auto_154358 ?auto_154357 ) ) ( not ( = ?auto_154358 ?auto_154355 ) ) ( not ( = ?auto_154358 ?auto_154354 ) ) ( not ( = ?auto_154359 ?auto_154357 ) ) ( not ( = ?auto_154359 ?auto_154355 ) ) ( not ( = ?auto_154359 ?auto_154354 ) ) ( not ( = ?auto_154351 ?auto_154356 ) ) ( not ( = ?auto_154351 ?auto_154358 ) ) ( not ( = ?auto_154351 ?auto_154359 ) ) ( not ( = ?auto_154352 ?auto_154356 ) ) ( not ( = ?auto_154352 ?auto_154358 ) ) ( not ( = ?auto_154352 ?auto_154359 ) ) ( not ( = ?auto_154353 ?auto_154356 ) ) ( not ( = ?auto_154353 ?auto_154358 ) ) ( not ( = ?auto_154353 ?auto_154359 ) ) ( CLEAR ?auto_154352 ) ( ON ?auto_154353 ?auto_154354 ) ( CLEAR ?auto_154353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_154356 ?auto_154358 ?auto_154359 ?auto_154357 ?auto_154355 ?auto_154354 )
      ( MAKE-5PILE ?auto_154351 ?auto_154352 ?auto_154353 ?auto_154354 ?auto_154355 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_154360 - BLOCK
      ?auto_154361 - BLOCK
      ?auto_154362 - BLOCK
      ?auto_154363 - BLOCK
      ?auto_154364 - BLOCK
    )
    :vars
    (
      ?auto_154366 - BLOCK
      ?auto_154365 - BLOCK
      ?auto_154367 - BLOCK
      ?auto_154368 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154360 ) ( not ( = ?auto_154360 ?auto_154361 ) ) ( not ( = ?auto_154360 ?auto_154362 ) ) ( not ( = ?auto_154360 ?auto_154363 ) ) ( not ( = ?auto_154360 ?auto_154364 ) ) ( not ( = ?auto_154361 ?auto_154362 ) ) ( not ( = ?auto_154361 ?auto_154363 ) ) ( not ( = ?auto_154361 ?auto_154364 ) ) ( not ( = ?auto_154362 ?auto_154363 ) ) ( not ( = ?auto_154362 ?auto_154364 ) ) ( not ( = ?auto_154363 ?auto_154364 ) ) ( ON ?auto_154364 ?auto_154366 ) ( not ( = ?auto_154360 ?auto_154366 ) ) ( not ( = ?auto_154361 ?auto_154366 ) ) ( not ( = ?auto_154362 ?auto_154366 ) ) ( not ( = ?auto_154363 ?auto_154366 ) ) ( not ( = ?auto_154364 ?auto_154366 ) ) ( ON ?auto_154363 ?auto_154364 ) ( ON-TABLE ?auto_154365 ) ( ON ?auto_154367 ?auto_154365 ) ( ON ?auto_154368 ?auto_154367 ) ( ON ?auto_154366 ?auto_154368 ) ( not ( = ?auto_154365 ?auto_154367 ) ) ( not ( = ?auto_154365 ?auto_154368 ) ) ( not ( = ?auto_154365 ?auto_154366 ) ) ( not ( = ?auto_154365 ?auto_154364 ) ) ( not ( = ?auto_154365 ?auto_154363 ) ) ( not ( = ?auto_154367 ?auto_154368 ) ) ( not ( = ?auto_154367 ?auto_154366 ) ) ( not ( = ?auto_154367 ?auto_154364 ) ) ( not ( = ?auto_154367 ?auto_154363 ) ) ( not ( = ?auto_154368 ?auto_154366 ) ) ( not ( = ?auto_154368 ?auto_154364 ) ) ( not ( = ?auto_154368 ?auto_154363 ) ) ( not ( = ?auto_154360 ?auto_154365 ) ) ( not ( = ?auto_154360 ?auto_154367 ) ) ( not ( = ?auto_154360 ?auto_154368 ) ) ( not ( = ?auto_154361 ?auto_154365 ) ) ( not ( = ?auto_154361 ?auto_154367 ) ) ( not ( = ?auto_154361 ?auto_154368 ) ) ( not ( = ?auto_154362 ?auto_154365 ) ) ( not ( = ?auto_154362 ?auto_154367 ) ) ( not ( = ?auto_154362 ?auto_154368 ) ) ( ON ?auto_154362 ?auto_154363 ) ( CLEAR ?auto_154362 ) ( HOLDING ?auto_154361 ) ( CLEAR ?auto_154360 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_154360 ?auto_154361 )
      ( MAKE-5PILE ?auto_154360 ?auto_154361 ?auto_154362 ?auto_154363 ?auto_154364 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_154369 - BLOCK
      ?auto_154370 - BLOCK
      ?auto_154371 - BLOCK
      ?auto_154372 - BLOCK
      ?auto_154373 - BLOCK
    )
    :vars
    (
      ?auto_154377 - BLOCK
      ?auto_154375 - BLOCK
      ?auto_154376 - BLOCK
      ?auto_154374 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154369 ) ( not ( = ?auto_154369 ?auto_154370 ) ) ( not ( = ?auto_154369 ?auto_154371 ) ) ( not ( = ?auto_154369 ?auto_154372 ) ) ( not ( = ?auto_154369 ?auto_154373 ) ) ( not ( = ?auto_154370 ?auto_154371 ) ) ( not ( = ?auto_154370 ?auto_154372 ) ) ( not ( = ?auto_154370 ?auto_154373 ) ) ( not ( = ?auto_154371 ?auto_154372 ) ) ( not ( = ?auto_154371 ?auto_154373 ) ) ( not ( = ?auto_154372 ?auto_154373 ) ) ( ON ?auto_154373 ?auto_154377 ) ( not ( = ?auto_154369 ?auto_154377 ) ) ( not ( = ?auto_154370 ?auto_154377 ) ) ( not ( = ?auto_154371 ?auto_154377 ) ) ( not ( = ?auto_154372 ?auto_154377 ) ) ( not ( = ?auto_154373 ?auto_154377 ) ) ( ON ?auto_154372 ?auto_154373 ) ( ON-TABLE ?auto_154375 ) ( ON ?auto_154376 ?auto_154375 ) ( ON ?auto_154374 ?auto_154376 ) ( ON ?auto_154377 ?auto_154374 ) ( not ( = ?auto_154375 ?auto_154376 ) ) ( not ( = ?auto_154375 ?auto_154374 ) ) ( not ( = ?auto_154375 ?auto_154377 ) ) ( not ( = ?auto_154375 ?auto_154373 ) ) ( not ( = ?auto_154375 ?auto_154372 ) ) ( not ( = ?auto_154376 ?auto_154374 ) ) ( not ( = ?auto_154376 ?auto_154377 ) ) ( not ( = ?auto_154376 ?auto_154373 ) ) ( not ( = ?auto_154376 ?auto_154372 ) ) ( not ( = ?auto_154374 ?auto_154377 ) ) ( not ( = ?auto_154374 ?auto_154373 ) ) ( not ( = ?auto_154374 ?auto_154372 ) ) ( not ( = ?auto_154369 ?auto_154375 ) ) ( not ( = ?auto_154369 ?auto_154376 ) ) ( not ( = ?auto_154369 ?auto_154374 ) ) ( not ( = ?auto_154370 ?auto_154375 ) ) ( not ( = ?auto_154370 ?auto_154376 ) ) ( not ( = ?auto_154370 ?auto_154374 ) ) ( not ( = ?auto_154371 ?auto_154375 ) ) ( not ( = ?auto_154371 ?auto_154376 ) ) ( not ( = ?auto_154371 ?auto_154374 ) ) ( ON ?auto_154371 ?auto_154372 ) ( CLEAR ?auto_154369 ) ( ON ?auto_154370 ?auto_154371 ) ( CLEAR ?auto_154370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_154375 ?auto_154376 ?auto_154374 ?auto_154377 ?auto_154373 ?auto_154372 ?auto_154371 )
      ( MAKE-5PILE ?auto_154369 ?auto_154370 ?auto_154371 ?auto_154372 ?auto_154373 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_154378 - BLOCK
      ?auto_154379 - BLOCK
      ?auto_154380 - BLOCK
      ?auto_154381 - BLOCK
      ?auto_154382 - BLOCK
    )
    :vars
    (
      ?auto_154386 - BLOCK
      ?auto_154383 - BLOCK
      ?auto_154385 - BLOCK
      ?auto_154384 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154378 ?auto_154379 ) ) ( not ( = ?auto_154378 ?auto_154380 ) ) ( not ( = ?auto_154378 ?auto_154381 ) ) ( not ( = ?auto_154378 ?auto_154382 ) ) ( not ( = ?auto_154379 ?auto_154380 ) ) ( not ( = ?auto_154379 ?auto_154381 ) ) ( not ( = ?auto_154379 ?auto_154382 ) ) ( not ( = ?auto_154380 ?auto_154381 ) ) ( not ( = ?auto_154380 ?auto_154382 ) ) ( not ( = ?auto_154381 ?auto_154382 ) ) ( ON ?auto_154382 ?auto_154386 ) ( not ( = ?auto_154378 ?auto_154386 ) ) ( not ( = ?auto_154379 ?auto_154386 ) ) ( not ( = ?auto_154380 ?auto_154386 ) ) ( not ( = ?auto_154381 ?auto_154386 ) ) ( not ( = ?auto_154382 ?auto_154386 ) ) ( ON ?auto_154381 ?auto_154382 ) ( ON-TABLE ?auto_154383 ) ( ON ?auto_154385 ?auto_154383 ) ( ON ?auto_154384 ?auto_154385 ) ( ON ?auto_154386 ?auto_154384 ) ( not ( = ?auto_154383 ?auto_154385 ) ) ( not ( = ?auto_154383 ?auto_154384 ) ) ( not ( = ?auto_154383 ?auto_154386 ) ) ( not ( = ?auto_154383 ?auto_154382 ) ) ( not ( = ?auto_154383 ?auto_154381 ) ) ( not ( = ?auto_154385 ?auto_154384 ) ) ( not ( = ?auto_154385 ?auto_154386 ) ) ( not ( = ?auto_154385 ?auto_154382 ) ) ( not ( = ?auto_154385 ?auto_154381 ) ) ( not ( = ?auto_154384 ?auto_154386 ) ) ( not ( = ?auto_154384 ?auto_154382 ) ) ( not ( = ?auto_154384 ?auto_154381 ) ) ( not ( = ?auto_154378 ?auto_154383 ) ) ( not ( = ?auto_154378 ?auto_154385 ) ) ( not ( = ?auto_154378 ?auto_154384 ) ) ( not ( = ?auto_154379 ?auto_154383 ) ) ( not ( = ?auto_154379 ?auto_154385 ) ) ( not ( = ?auto_154379 ?auto_154384 ) ) ( not ( = ?auto_154380 ?auto_154383 ) ) ( not ( = ?auto_154380 ?auto_154385 ) ) ( not ( = ?auto_154380 ?auto_154384 ) ) ( ON ?auto_154380 ?auto_154381 ) ( ON ?auto_154379 ?auto_154380 ) ( CLEAR ?auto_154379 ) ( HOLDING ?auto_154378 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_154378 )
      ( MAKE-5PILE ?auto_154378 ?auto_154379 ?auto_154380 ?auto_154381 ?auto_154382 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_154387 - BLOCK
      ?auto_154388 - BLOCK
      ?auto_154389 - BLOCK
      ?auto_154390 - BLOCK
      ?auto_154391 - BLOCK
    )
    :vars
    (
      ?auto_154394 - BLOCK
      ?auto_154395 - BLOCK
      ?auto_154392 - BLOCK
      ?auto_154393 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154387 ?auto_154388 ) ) ( not ( = ?auto_154387 ?auto_154389 ) ) ( not ( = ?auto_154387 ?auto_154390 ) ) ( not ( = ?auto_154387 ?auto_154391 ) ) ( not ( = ?auto_154388 ?auto_154389 ) ) ( not ( = ?auto_154388 ?auto_154390 ) ) ( not ( = ?auto_154388 ?auto_154391 ) ) ( not ( = ?auto_154389 ?auto_154390 ) ) ( not ( = ?auto_154389 ?auto_154391 ) ) ( not ( = ?auto_154390 ?auto_154391 ) ) ( ON ?auto_154391 ?auto_154394 ) ( not ( = ?auto_154387 ?auto_154394 ) ) ( not ( = ?auto_154388 ?auto_154394 ) ) ( not ( = ?auto_154389 ?auto_154394 ) ) ( not ( = ?auto_154390 ?auto_154394 ) ) ( not ( = ?auto_154391 ?auto_154394 ) ) ( ON ?auto_154390 ?auto_154391 ) ( ON-TABLE ?auto_154395 ) ( ON ?auto_154392 ?auto_154395 ) ( ON ?auto_154393 ?auto_154392 ) ( ON ?auto_154394 ?auto_154393 ) ( not ( = ?auto_154395 ?auto_154392 ) ) ( not ( = ?auto_154395 ?auto_154393 ) ) ( not ( = ?auto_154395 ?auto_154394 ) ) ( not ( = ?auto_154395 ?auto_154391 ) ) ( not ( = ?auto_154395 ?auto_154390 ) ) ( not ( = ?auto_154392 ?auto_154393 ) ) ( not ( = ?auto_154392 ?auto_154394 ) ) ( not ( = ?auto_154392 ?auto_154391 ) ) ( not ( = ?auto_154392 ?auto_154390 ) ) ( not ( = ?auto_154393 ?auto_154394 ) ) ( not ( = ?auto_154393 ?auto_154391 ) ) ( not ( = ?auto_154393 ?auto_154390 ) ) ( not ( = ?auto_154387 ?auto_154395 ) ) ( not ( = ?auto_154387 ?auto_154392 ) ) ( not ( = ?auto_154387 ?auto_154393 ) ) ( not ( = ?auto_154388 ?auto_154395 ) ) ( not ( = ?auto_154388 ?auto_154392 ) ) ( not ( = ?auto_154388 ?auto_154393 ) ) ( not ( = ?auto_154389 ?auto_154395 ) ) ( not ( = ?auto_154389 ?auto_154392 ) ) ( not ( = ?auto_154389 ?auto_154393 ) ) ( ON ?auto_154389 ?auto_154390 ) ( ON ?auto_154388 ?auto_154389 ) ( ON ?auto_154387 ?auto_154388 ) ( CLEAR ?auto_154387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_154395 ?auto_154392 ?auto_154393 ?auto_154394 ?auto_154391 ?auto_154390 ?auto_154389 ?auto_154388 )
      ( MAKE-5PILE ?auto_154387 ?auto_154388 ?auto_154389 ?auto_154390 ?auto_154391 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_154399 - BLOCK
      ?auto_154400 - BLOCK
      ?auto_154401 - BLOCK
    )
    :vars
    (
      ?auto_154402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154402 ?auto_154401 ) ( CLEAR ?auto_154402 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_154399 ) ( ON ?auto_154400 ?auto_154399 ) ( ON ?auto_154401 ?auto_154400 ) ( not ( = ?auto_154399 ?auto_154400 ) ) ( not ( = ?auto_154399 ?auto_154401 ) ) ( not ( = ?auto_154399 ?auto_154402 ) ) ( not ( = ?auto_154400 ?auto_154401 ) ) ( not ( = ?auto_154400 ?auto_154402 ) ) ( not ( = ?auto_154401 ?auto_154402 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_154402 ?auto_154401 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_154403 - BLOCK
      ?auto_154404 - BLOCK
      ?auto_154405 - BLOCK
    )
    :vars
    (
      ?auto_154406 - BLOCK
      ?auto_154407 - BLOCK
      ?auto_154408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154406 ?auto_154405 ) ( CLEAR ?auto_154406 ) ( ON-TABLE ?auto_154403 ) ( ON ?auto_154404 ?auto_154403 ) ( ON ?auto_154405 ?auto_154404 ) ( not ( = ?auto_154403 ?auto_154404 ) ) ( not ( = ?auto_154403 ?auto_154405 ) ) ( not ( = ?auto_154403 ?auto_154406 ) ) ( not ( = ?auto_154404 ?auto_154405 ) ) ( not ( = ?auto_154404 ?auto_154406 ) ) ( not ( = ?auto_154405 ?auto_154406 ) ) ( HOLDING ?auto_154407 ) ( CLEAR ?auto_154408 ) ( not ( = ?auto_154403 ?auto_154407 ) ) ( not ( = ?auto_154403 ?auto_154408 ) ) ( not ( = ?auto_154404 ?auto_154407 ) ) ( not ( = ?auto_154404 ?auto_154408 ) ) ( not ( = ?auto_154405 ?auto_154407 ) ) ( not ( = ?auto_154405 ?auto_154408 ) ) ( not ( = ?auto_154406 ?auto_154407 ) ) ( not ( = ?auto_154406 ?auto_154408 ) ) ( not ( = ?auto_154407 ?auto_154408 ) ) )
    :subtasks
    ( ( !STACK ?auto_154407 ?auto_154408 )
      ( MAKE-3PILE ?auto_154403 ?auto_154404 ?auto_154405 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_154409 - BLOCK
      ?auto_154410 - BLOCK
      ?auto_154411 - BLOCK
    )
    :vars
    (
      ?auto_154413 - BLOCK
      ?auto_154412 - BLOCK
      ?auto_154414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154413 ?auto_154411 ) ( ON-TABLE ?auto_154409 ) ( ON ?auto_154410 ?auto_154409 ) ( ON ?auto_154411 ?auto_154410 ) ( not ( = ?auto_154409 ?auto_154410 ) ) ( not ( = ?auto_154409 ?auto_154411 ) ) ( not ( = ?auto_154409 ?auto_154413 ) ) ( not ( = ?auto_154410 ?auto_154411 ) ) ( not ( = ?auto_154410 ?auto_154413 ) ) ( not ( = ?auto_154411 ?auto_154413 ) ) ( CLEAR ?auto_154412 ) ( not ( = ?auto_154409 ?auto_154414 ) ) ( not ( = ?auto_154409 ?auto_154412 ) ) ( not ( = ?auto_154410 ?auto_154414 ) ) ( not ( = ?auto_154410 ?auto_154412 ) ) ( not ( = ?auto_154411 ?auto_154414 ) ) ( not ( = ?auto_154411 ?auto_154412 ) ) ( not ( = ?auto_154413 ?auto_154414 ) ) ( not ( = ?auto_154413 ?auto_154412 ) ) ( not ( = ?auto_154414 ?auto_154412 ) ) ( ON ?auto_154414 ?auto_154413 ) ( CLEAR ?auto_154414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_154409 ?auto_154410 ?auto_154411 ?auto_154413 )
      ( MAKE-3PILE ?auto_154409 ?auto_154410 ?auto_154411 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_154415 - BLOCK
      ?auto_154416 - BLOCK
      ?auto_154417 - BLOCK
    )
    :vars
    (
      ?auto_154420 - BLOCK
      ?auto_154419 - BLOCK
      ?auto_154418 - BLOCK
      ?auto_154423 - BLOCK
      ?auto_154422 - BLOCK
      ?auto_154421 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154420 ?auto_154417 ) ( ON-TABLE ?auto_154415 ) ( ON ?auto_154416 ?auto_154415 ) ( ON ?auto_154417 ?auto_154416 ) ( not ( = ?auto_154415 ?auto_154416 ) ) ( not ( = ?auto_154415 ?auto_154417 ) ) ( not ( = ?auto_154415 ?auto_154420 ) ) ( not ( = ?auto_154416 ?auto_154417 ) ) ( not ( = ?auto_154416 ?auto_154420 ) ) ( not ( = ?auto_154417 ?auto_154420 ) ) ( not ( = ?auto_154415 ?auto_154419 ) ) ( not ( = ?auto_154415 ?auto_154418 ) ) ( not ( = ?auto_154416 ?auto_154419 ) ) ( not ( = ?auto_154416 ?auto_154418 ) ) ( not ( = ?auto_154417 ?auto_154419 ) ) ( not ( = ?auto_154417 ?auto_154418 ) ) ( not ( = ?auto_154420 ?auto_154419 ) ) ( not ( = ?auto_154420 ?auto_154418 ) ) ( not ( = ?auto_154419 ?auto_154418 ) ) ( ON ?auto_154419 ?auto_154420 ) ( CLEAR ?auto_154419 ) ( HOLDING ?auto_154418 ) ( CLEAR ?auto_154423 ) ( ON-TABLE ?auto_154422 ) ( ON ?auto_154421 ?auto_154422 ) ( ON ?auto_154423 ?auto_154421 ) ( not ( = ?auto_154422 ?auto_154421 ) ) ( not ( = ?auto_154422 ?auto_154423 ) ) ( not ( = ?auto_154422 ?auto_154418 ) ) ( not ( = ?auto_154421 ?auto_154423 ) ) ( not ( = ?auto_154421 ?auto_154418 ) ) ( not ( = ?auto_154423 ?auto_154418 ) ) ( not ( = ?auto_154415 ?auto_154423 ) ) ( not ( = ?auto_154415 ?auto_154422 ) ) ( not ( = ?auto_154415 ?auto_154421 ) ) ( not ( = ?auto_154416 ?auto_154423 ) ) ( not ( = ?auto_154416 ?auto_154422 ) ) ( not ( = ?auto_154416 ?auto_154421 ) ) ( not ( = ?auto_154417 ?auto_154423 ) ) ( not ( = ?auto_154417 ?auto_154422 ) ) ( not ( = ?auto_154417 ?auto_154421 ) ) ( not ( = ?auto_154420 ?auto_154423 ) ) ( not ( = ?auto_154420 ?auto_154422 ) ) ( not ( = ?auto_154420 ?auto_154421 ) ) ( not ( = ?auto_154419 ?auto_154423 ) ) ( not ( = ?auto_154419 ?auto_154422 ) ) ( not ( = ?auto_154419 ?auto_154421 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_154422 ?auto_154421 ?auto_154423 ?auto_154418 )
      ( MAKE-3PILE ?auto_154415 ?auto_154416 ?auto_154417 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_154424 - BLOCK
      ?auto_154425 - BLOCK
      ?auto_154426 - BLOCK
    )
    :vars
    (
      ?auto_154428 - BLOCK
      ?auto_154429 - BLOCK
      ?auto_154430 - BLOCK
      ?auto_154431 - BLOCK
      ?auto_154427 - BLOCK
      ?auto_154432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154428 ?auto_154426 ) ( ON-TABLE ?auto_154424 ) ( ON ?auto_154425 ?auto_154424 ) ( ON ?auto_154426 ?auto_154425 ) ( not ( = ?auto_154424 ?auto_154425 ) ) ( not ( = ?auto_154424 ?auto_154426 ) ) ( not ( = ?auto_154424 ?auto_154428 ) ) ( not ( = ?auto_154425 ?auto_154426 ) ) ( not ( = ?auto_154425 ?auto_154428 ) ) ( not ( = ?auto_154426 ?auto_154428 ) ) ( not ( = ?auto_154424 ?auto_154429 ) ) ( not ( = ?auto_154424 ?auto_154430 ) ) ( not ( = ?auto_154425 ?auto_154429 ) ) ( not ( = ?auto_154425 ?auto_154430 ) ) ( not ( = ?auto_154426 ?auto_154429 ) ) ( not ( = ?auto_154426 ?auto_154430 ) ) ( not ( = ?auto_154428 ?auto_154429 ) ) ( not ( = ?auto_154428 ?auto_154430 ) ) ( not ( = ?auto_154429 ?auto_154430 ) ) ( ON ?auto_154429 ?auto_154428 ) ( CLEAR ?auto_154431 ) ( ON-TABLE ?auto_154427 ) ( ON ?auto_154432 ?auto_154427 ) ( ON ?auto_154431 ?auto_154432 ) ( not ( = ?auto_154427 ?auto_154432 ) ) ( not ( = ?auto_154427 ?auto_154431 ) ) ( not ( = ?auto_154427 ?auto_154430 ) ) ( not ( = ?auto_154432 ?auto_154431 ) ) ( not ( = ?auto_154432 ?auto_154430 ) ) ( not ( = ?auto_154431 ?auto_154430 ) ) ( not ( = ?auto_154424 ?auto_154431 ) ) ( not ( = ?auto_154424 ?auto_154427 ) ) ( not ( = ?auto_154424 ?auto_154432 ) ) ( not ( = ?auto_154425 ?auto_154431 ) ) ( not ( = ?auto_154425 ?auto_154427 ) ) ( not ( = ?auto_154425 ?auto_154432 ) ) ( not ( = ?auto_154426 ?auto_154431 ) ) ( not ( = ?auto_154426 ?auto_154427 ) ) ( not ( = ?auto_154426 ?auto_154432 ) ) ( not ( = ?auto_154428 ?auto_154431 ) ) ( not ( = ?auto_154428 ?auto_154427 ) ) ( not ( = ?auto_154428 ?auto_154432 ) ) ( not ( = ?auto_154429 ?auto_154431 ) ) ( not ( = ?auto_154429 ?auto_154427 ) ) ( not ( = ?auto_154429 ?auto_154432 ) ) ( ON ?auto_154430 ?auto_154429 ) ( CLEAR ?auto_154430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_154424 ?auto_154425 ?auto_154426 ?auto_154428 ?auto_154429 )
      ( MAKE-3PILE ?auto_154424 ?auto_154425 ?auto_154426 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_154433 - BLOCK
      ?auto_154434 - BLOCK
      ?auto_154435 - BLOCK
    )
    :vars
    (
      ?auto_154439 - BLOCK
      ?auto_154438 - BLOCK
      ?auto_154440 - BLOCK
      ?auto_154437 - BLOCK
      ?auto_154441 - BLOCK
      ?auto_154436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154439 ?auto_154435 ) ( ON-TABLE ?auto_154433 ) ( ON ?auto_154434 ?auto_154433 ) ( ON ?auto_154435 ?auto_154434 ) ( not ( = ?auto_154433 ?auto_154434 ) ) ( not ( = ?auto_154433 ?auto_154435 ) ) ( not ( = ?auto_154433 ?auto_154439 ) ) ( not ( = ?auto_154434 ?auto_154435 ) ) ( not ( = ?auto_154434 ?auto_154439 ) ) ( not ( = ?auto_154435 ?auto_154439 ) ) ( not ( = ?auto_154433 ?auto_154438 ) ) ( not ( = ?auto_154433 ?auto_154440 ) ) ( not ( = ?auto_154434 ?auto_154438 ) ) ( not ( = ?auto_154434 ?auto_154440 ) ) ( not ( = ?auto_154435 ?auto_154438 ) ) ( not ( = ?auto_154435 ?auto_154440 ) ) ( not ( = ?auto_154439 ?auto_154438 ) ) ( not ( = ?auto_154439 ?auto_154440 ) ) ( not ( = ?auto_154438 ?auto_154440 ) ) ( ON ?auto_154438 ?auto_154439 ) ( ON-TABLE ?auto_154437 ) ( ON ?auto_154441 ?auto_154437 ) ( not ( = ?auto_154437 ?auto_154441 ) ) ( not ( = ?auto_154437 ?auto_154436 ) ) ( not ( = ?auto_154437 ?auto_154440 ) ) ( not ( = ?auto_154441 ?auto_154436 ) ) ( not ( = ?auto_154441 ?auto_154440 ) ) ( not ( = ?auto_154436 ?auto_154440 ) ) ( not ( = ?auto_154433 ?auto_154436 ) ) ( not ( = ?auto_154433 ?auto_154437 ) ) ( not ( = ?auto_154433 ?auto_154441 ) ) ( not ( = ?auto_154434 ?auto_154436 ) ) ( not ( = ?auto_154434 ?auto_154437 ) ) ( not ( = ?auto_154434 ?auto_154441 ) ) ( not ( = ?auto_154435 ?auto_154436 ) ) ( not ( = ?auto_154435 ?auto_154437 ) ) ( not ( = ?auto_154435 ?auto_154441 ) ) ( not ( = ?auto_154439 ?auto_154436 ) ) ( not ( = ?auto_154439 ?auto_154437 ) ) ( not ( = ?auto_154439 ?auto_154441 ) ) ( not ( = ?auto_154438 ?auto_154436 ) ) ( not ( = ?auto_154438 ?auto_154437 ) ) ( not ( = ?auto_154438 ?auto_154441 ) ) ( ON ?auto_154440 ?auto_154438 ) ( CLEAR ?auto_154440 ) ( HOLDING ?auto_154436 ) ( CLEAR ?auto_154441 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_154437 ?auto_154441 ?auto_154436 )
      ( MAKE-3PILE ?auto_154433 ?auto_154434 ?auto_154435 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_154442 - BLOCK
      ?auto_154443 - BLOCK
      ?auto_154444 - BLOCK
    )
    :vars
    (
      ?auto_154446 - BLOCK
      ?auto_154448 - BLOCK
      ?auto_154450 - BLOCK
      ?auto_154449 - BLOCK
      ?auto_154447 - BLOCK
      ?auto_154445 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154446 ?auto_154444 ) ( ON-TABLE ?auto_154442 ) ( ON ?auto_154443 ?auto_154442 ) ( ON ?auto_154444 ?auto_154443 ) ( not ( = ?auto_154442 ?auto_154443 ) ) ( not ( = ?auto_154442 ?auto_154444 ) ) ( not ( = ?auto_154442 ?auto_154446 ) ) ( not ( = ?auto_154443 ?auto_154444 ) ) ( not ( = ?auto_154443 ?auto_154446 ) ) ( not ( = ?auto_154444 ?auto_154446 ) ) ( not ( = ?auto_154442 ?auto_154448 ) ) ( not ( = ?auto_154442 ?auto_154450 ) ) ( not ( = ?auto_154443 ?auto_154448 ) ) ( not ( = ?auto_154443 ?auto_154450 ) ) ( not ( = ?auto_154444 ?auto_154448 ) ) ( not ( = ?auto_154444 ?auto_154450 ) ) ( not ( = ?auto_154446 ?auto_154448 ) ) ( not ( = ?auto_154446 ?auto_154450 ) ) ( not ( = ?auto_154448 ?auto_154450 ) ) ( ON ?auto_154448 ?auto_154446 ) ( ON-TABLE ?auto_154449 ) ( ON ?auto_154447 ?auto_154449 ) ( not ( = ?auto_154449 ?auto_154447 ) ) ( not ( = ?auto_154449 ?auto_154445 ) ) ( not ( = ?auto_154449 ?auto_154450 ) ) ( not ( = ?auto_154447 ?auto_154445 ) ) ( not ( = ?auto_154447 ?auto_154450 ) ) ( not ( = ?auto_154445 ?auto_154450 ) ) ( not ( = ?auto_154442 ?auto_154445 ) ) ( not ( = ?auto_154442 ?auto_154449 ) ) ( not ( = ?auto_154442 ?auto_154447 ) ) ( not ( = ?auto_154443 ?auto_154445 ) ) ( not ( = ?auto_154443 ?auto_154449 ) ) ( not ( = ?auto_154443 ?auto_154447 ) ) ( not ( = ?auto_154444 ?auto_154445 ) ) ( not ( = ?auto_154444 ?auto_154449 ) ) ( not ( = ?auto_154444 ?auto_154447 ) ) ( not ( = ?auto_154446 ?auto_154445 ) ) ( not ( = ?auto_154446 ?auto_154449 ) ) ( not ( = ?auto_154446 ?auto_154447 ) ) ( not ( = ?auto_154448 ?auto_154445 ) ) ( not ( = ?auto_154448 ?auto_154449 ) ) ( not ( = ?auto_154448 ?auto_154447 ) ) ( ON ?auto_154450 ?auto_154448 ) ( CLEAR ?auto_154447 ) ( ON ?auto_154445 ?auto_154450 ) ( CLEAR ?auto_154445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_154442 ?auto_154443 ?auto_154444 ?auto_154446 ?auto_154448 ?auto_154450 )
      ( MAKE-3PILE ?auto_154442 ?auto_154443 ?auto_154444 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_154451 - BLOCK
      ?auto_154452 - BLOCK
      ?auto_154453 - BLOCK
    )
    :vars
    (
      ?auto_154455 - BLOCK
      ?auto_154459 - BLOCK
      ?auto_154456 - BLOCK
      ?auto_154454 - BLOCK
      ?auto_154457 - BLOCK
      ?auto_154458 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154455 ?auto_154453 ) ( ON-TABLE ?auto_154451 ) ( ON ?auto_154452 ?auto_154451 ) ( ON ?auto_154453 ?auto_154452 ) ( not ( = ?auto_154451 ?auto_154452 ) ) ( not ( = ?auto_154451 ?auto_154453 ) ) ( not ( = ?auto_154451 ?auto_154455 ) ) ( not ( = ?auto_154452 ?auto_154453 ) ) ( not ( = ?auto_154452 ?auto_154455 ) ) ( not ( = ?auto_154453 ?auto_154455 ) ) ( not ( = ?auto_154451 ?auto_154459 ) ) ( not ( = ?auto_154451 ?auto_154456 ) ) ( not ( = ?auto_154452 ?auto_154459 ) ) ( not ( = ?auto_154452 ?auto_154456 ) ) ( not ( = ?auto_154453 ?auto_154459 ) ) ( not ( = ?auto_154453 ?auto_154456 ) ) ( not ( = ?auto_154455 ?auto_154459 ) ) ( not ( = ?auto_154455 ?auto_154456 ) ) ( not ( = ?auto_154459 ?auto_154456 ) ) ( ON ?auto_154459 ?auto_154455 ) ( ON-TABLE ?auto_154454 ) ( not ( = ?auto_154454 ?auto_154457 ) ) ( not ( = ?auto_154454 ?auto_154458 ) ) ( not ( = ?auto_154454 ?auto_154456 ) ) ( not ( = ?auto_154457 ?auto_154458 ) ) ( not ( = ?auto_154457 ?auto_154456 ) ) ( not ( = ?auto_154458 ?auto_154456 ) ) ( not ( = ?auto_154451 ?auto_154458 ) ) ( not ( = ?auto_154451 ?auto_154454 ) ) ( not ( = ?auto_154451 ?auto_154457 ) ) ( not ( = ?auto_154452 ?auto_154458 ) ) ( not ( = ?auto_154452 ?auto_154454 ) ) ( not ( = ?auto_154452 ?auto_154457 ) ) ( not ( = ?auto_154453 ?auto_154458 ) ) ( not ( = ?auto_154453 ?auto_154454 ) ) ( not ( = ?auto_154453 ?auto_154457 ) ) ( not ( = ?auto_154455 ?auto_154458 ) ) ( not ( = ?auto_154455 ?auto_154454 ) ) ( not ( = ?auto_154455 ?auto_154457 ) ) ( not ( = ?auto_154459 ?auto_154458 ) ) ( not ( = ?auto_154459 ?auto_154454 ) ) ( not ( = ?auto_154459 ?auto_154457 ) ) ( ON ?auto_154456 ?auto_154459 ) ( ON ?auto_154458 ?auto_154456 ) ( CLEAR ?auto_154458 ) ( HOLDING ?auto_154457 ) ( CLEAR ?auto_154454 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_154454 ?auto_154457 )
      ( MAKE-3PILE ?auto_154451 ?auto_154452 ?auto_154453 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_154460 - BLOCK
      ?auto_154461 - BLOCK
      ?auto_154462 - BLOCK
    )
    :vars
    (
      ?auto_154463 - BLOCK
      ?auto_154467 - BLOCK
      ?auto_154465 - BLOCK
      ?auto_154466 - BLOCK
      ?auto_154468 - BLOCK
      ?auto_154464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154463 ?auto_154462 ) ( ON-TABLE ?auto_154460 ) ( ON ?auto_154461 ?auto_154460 ) ( ON ?auto_154462 ?auto_154461 ) ( not ( = ?auto_154460 ?auto_154461 ) ) ( not ( = ?auto_154460 ?auto_154462 ) ) ( not ( = ?auto_154460 ?auto_154463 ) ) ( not ( = ?auto_154461 ?auto_154462 ) ) ( not ( = ?auto_154461 ?auto_154463 ) ) ( not ( = ?auto_154462 ?auto_154463 ) ) ( not ( = ?auto_154460 ?auto_154467 ) ) ( not ( = ?auto_154460 ?auto_154465 ) ) ( not ( = ?auto_154461 ?auto_154467 ) ) ( not ( = ?auto_154461 ?auto_154465 ) ) ( not ( = ?auto_154462 ?auto_154467 ) ) ( not ( = ?auto_154462 ?auto_154465 ) ) ( not ( = ?auto_154463 ?auto_154467 ) ) ( not ( = ?auto_154463 ?auto_154465 ) ) ( not ( = ?auto_154467 ?auto_154465 ) ) ( ON ?auto_154467 ?auto_154463 ) ( ON-TABLE ?auto_154466 ) ( not ( = ?auto_154466 ?auto_154468 ) ) ( not ( = ?auto_154466 ?auto_154464 ) ) ( not ( = ?auto_154466 ?auto_154465 ) ) ( not ( = ?auto_154468 ?auto_154464 ) ) ( not ( = ?auto_154468 ?auto_154465 ) ) ( not ( = ?auto_154464 ?auto_154465 ) ) ( not ( = ?auto_154460 ?auto_154464 ) ) ( not ( = ?auto_154460 ?auto_154466 ) ) ( not ( = ?auto_154460 ?auto_154468 ) ) ( not ( = ?auto_154461 ?auto_154464 ) ) ( not ( = ?auto_154461 ?auto_154466 ) ) ( not ( = ?auto_154461 ?auto_154468 ) ) ( not ( = ?auto_154462 ?auto_154464 ) ) ( not ( = ?auto_154462 ?auto_154466 ) ) ( not ( = ?auto_154462 ?auto_154468 ) ) ( not ( = ?auto_154463 ?auto_154464 ) ) ( not ( = ?auto_154463 ?auto_154466 ) ) ( not ( = ?auto_154463 ?auto_154468 ) ) ( not ( = ?auto_154467 ?auto_154464 ) ) ( not ( = ?auto_154467 ?auto_154466 ) ) ( not ( = ?auto_154467 ?auto_154468 ) ) ( ON ?auto_154465 ?auto_154467 ) ( ON ?auto_154464 ?auto_154465 ) ( CLEAR ?auto_154466 ) ( ON ?auto_154468 ?auto_154464 ) ( CLEAR ?auto_154468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_154460 ?auto_154461 ?auto_154462 ?auto_154463 ?auto_154467 ?auto_154465 ?auto_154464 )
      ( MAKE-3PILE ?auto_154460 ?auto_154461 ?auto_154462 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_154469 - BLOCK
      ?auto_154470 - BLOCK
      ?auto_154471 - BLOCK
    )
    :vars
    (
      ?auto_154475 - BLOCK
      ?auto_154477 - BLOCK
      ?auto_154474 - BLOCK
      ?auto_154473 - BLOCK
      ?auto_154476 - BLOCK
      ?auto_154472 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154475 ?auto_154471 ) ( ON-TABLE ?auto_154469 ) ( ON ?auto_154470 ?auto_154469 ) ( ON ?auto_154471 ?auto_154470 ) ( not ( = ?auto_154469 ?auto_154470 ) ) ( not ( = ?auto_154469 ?auto_154471 ) ) ( not ( = ?auto_154469 ?auto_154475 ) ) ( not ( = ?auto_154470 ?auto_154471 ) ) ( not ( = ?auto_154470 ?auto_154475 ) ) ( not ( = ?auto_154471 ?auto_154475 ) ) ( not ( = ?auto_154469 ?auto_154477 ) ) ( not ( = ?auto_154469 ?auto_154474 ) ) ( not ( = ?auto_154470 ?auto_154477 ) ) ( not ( = ?auto_154470 ?auto_154474 ) ) ( not ( = ?auto_154471 ?auto_154477 ) ) ( not ( = ?auto_154471 ?auto_154474 ) ) ( not ( = ?auto_154475 ?auto_154477 ) ) ( not ( = ?auto_154475 ?auto_154474 ) ) ( not ( = ?auto_154477 ?auto_154474 ) ) ( ON ?auto_154477 ?auto_154475 ) ( not ( = ?auto_154473 ?auto_154476 ) ) ( not ( = ?auto_154473 ?auto_154472 ) ) ( not ( = ?auto_154473 ?auto_154474 ) ) ( not ( = ?auto_154476 ?auto_154472 ) ) ( not ( = ?auto_154476 ?auto_154474 ) ) ( not ( = ?auto_154472 ?auto_154474 ) ) ( not ( = ?auto_154469 ?auto_154472 ) ) ( not ( = ?auto_154469 ?auto_154473 ) ) ( not ( = ?auto_154469 ?auto_154476 ) ) ( not ( = ?auto_154470 ?auto_154472 ) ) ( not ( = ?auto_154470 ?auto_154473 ) ) ( not ( = ?auto_154470 ?auto_154476 ) ) ( not ( = ?auto_154471 ?auto_154472 ) ) ( not ( = ?auto_154471 ?auto_154473 ) ) ( not ( = ?auto_154471 ?auto_154476 ) ) ( not ( = ?auto_154475 ?auto_154472 ) ) ( not ( = ?auto_154475 ?auto_154473 ) ) ( not ( = ?auto_154475 ?auto_154476 ) ) ( not ( = ?auto_154477 ?auto_154472 ) ) ( not ( = ?auto_154477 ?auto_154473 ) ) ( not ( = ?auto_154477 ?auto_154476 ) ) ( ON ?auto_154474 ?auto_154477 ) ( ON ?auto_154472 ?auto_154474 ) ( ON ?auto_154476 ?auto_154472 ) ( CLEAR ?auto_154476 ) ( HOLDING ?auto_154473 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_154473 )
      ( MAKE-3PILE ?auto_154469 ?auto_154470 ?auto_154471 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_154478 - BLOCK
      ?auto_154479 - BLOCK
      ?auto_154480 - BLOCK
    )
    :vars
    (
      ?auto_154486 - BLOCK
      ?auto_154482 - BLOCK
      ?auto_154484 - BLOCK
      ?auto_154485 - BLOCK
      ?auto_154481 - BLOCK
      ?auto_154483 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154486 ?auto_154480 ) ( ON-TABLE ?auto_154478 ) ( ON ?auto_154479 ?auto_154478 ) ( ON ?auto_154480 ?auto_154479 ) ( not ( = ?auto_154478 ?auto_154479 ) ) ( not ( = ?auto_154478 ?auto_154480 ) ) ( not ( = ?auto_154478 ?auto_154486 ) ) ( not ( = ?auto_154479 ?auto_154480 ) ) ( not ( = ?auto_154479 ?auto_154486 ) ) ( not ( = ?auto_154480 ?auto_154486 ) ) ( not ( = ?auto_154478 ?auto_154482 ) ) ( not ( = ?auto_154478 ?auto_154484 ) ) ( not ( = ?auto_154479 ?auto_154482 ) ) ( not ( = ?auto_154479 ?auto_154484 ) ) ( not ( = ?auto_154480 ?auto_154482 ) ) ( not ( = ?auto_154480 ?auto_154484 ) ) ( not ( = ?auto_154486 ?auto_154482 ) ) ( not ( = ?auto_154486 ?auto_154484 ) ) ( not ( = ?auto_154482 ?auto_154484 ) ) ( ON ?auto_154482 ?auto_154486 ) ( not ( = ?auto_154485 ?auto_154481 ) ) ( not ( = ?auto_154485 ?auto_154483 ) ) ( not ( = ?auto_154485 ?auto_154484 ) ) ( not ( = ?auto_154481 ?auto_154483 ) ) ( not ( = ?auto_154481 ?auto_154484 ) ) ( not ( = ?auto_154483 ?auto_154484 ) ) ( not ( = ?auto_154478 ?auto_154483 ) ) ( not ( = ?auto_154478 ?auto_154485 ) ) ( not ( = ?auto_154478 ?auto_154481 ) ) ( not ( = ?auto_154479 ?auto_154483 ) ) ( not ( = ?auto_154479 ?auto_154485 ) ) ( not ( = ?auto_154479 ?auto_154481 ) ) ( not ( = ?auto_154480 ?auto_154483 ) ) ( not ( = ?auto_154480 ?auto_154485 ) ) ( not ( = ?auto_154480 ?auto_154481 ) ) ( not ( = ?auto_154486 ?auto_154483 ) ) ( not ( = ?auto_154486 ?auto_154485 ) ) ( not ( = ?auto_154486 ?auto_154481 ) ) ( not ( = ?auto_154482 ?auto_154483 ) ) ( not ( = ?auto_154482 ?auto_154485 ) ) ( not ( = ?auto_154482 ?auto_154481 ) ) ( ON ?auto_154484 ?auto_154482 ) ( ON ?auto_154483 ?auto_154484 ) ( ON ?auto_154481 ?auto_154483 ) ( ON ?auto_154485 ?auto_154481 ) ( CLEAR ?auto_154485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_154478 ?auto_154479 ?auto_154480 ?auto_154486 ?auto_154482 ?auto_154484 ?auto_154483 ?auto_154481 )
      ( MAKE-3PILE ?auto_154478 ?auto_154479 ?auto_154480 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_154493 - BLOCK
      ?auto_154494 - BLOCK
      ?auto_154495 - BLOCK
      ?auto_154496 - BLOCK
      ?auto_154497 - BLOCK
      ?auto_154498 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_154498 ) ( CLEAR ?auto_154497 ) ( ON-TABLE ?auto_154493 ) ( ON ?auto_154494 ?auto_154493 ) ( ON ?auto_154495 ?auto_154494 ) ( ON ?auto_154496 ?auto_154495 ) ( ON ?auto_154497 ?auto_154496 ) ( not ( = ?auto_154493 ?auto_154494 ) ) ( not ( = ?auto_154493 ?auto_154495 ) ) ( not ( = ?auto_154493 ?auto_154496 ) ) ( not ( = ?auto_154493 ?auto_154497 ) ) ( not ( = ?auto_154493 ?auto_154498 ) ) ( not ( = ?auto_154494 ?auto_154495 ) ) ( not ( = ?auto_154494 ?auto_154496 ) ) ( not ( = ?auto_154494 ?auto_154497 ) ) ( not ( = ?auto_154494 ?auto_154498 ) ) ( not ( = ?auto_154495 ?auto_154496 ) ) ( not ( = ?auto_154495 ?auto_154497 ) ) ( not ( = ?auto_154495 ?auto_154498 ) ) ( not ( = ?auto_154496 ?auto_154497 ) ) ( not ( = ?auto_154496 ?auto_154498 ) ) ( not ( = ?auto_154497 ?auto_154498 ) ) )
    :subtasks
    ( ( !STACK ?auto_154498 ?auto_154497 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_154499 - BLOCK
      ?auto_154500 - BLOCK
      ?auto_154501 - BLOCK
      ?auto_154502 - BLOCK
      ?auto_154503 - BLOCK
      ?auto_154504 - BLOCK
    )
    :vars
    (
      ?auto_154505 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_154503 ) ( ON-TABLE ?auto_154499 ) ( ON ?auto_154500 ?auto_154499 ) ( ON ?auto_154501 ?auto_154500 ) ( ON ?auto_154502 ?auto_154501 ) ( ON ?auto_154503 ?auto_154502 ) ( not ( = ?auto_154499 ?auto_154500 ) ) ( not ( = ?auto_154499 ?auto_154501 ) ) ( not ( = ?auto_154499 ?auto_154502 ) ) ( not ( = ?auto_154499 ?auto_154503 ) ) ( not ( = ?auto_154499 ?auto_154504 ) ) ( not ( = ?auto_154500 ?auto_154501 ) ) ( not ( = ?auto_154500 ?auto_154502 ) ) ( not ( = ?auto_154500 ?auto_154503 ) ) ( not ( = ?auto_154500 ?auto_154504 ) ) ( not ( = ?auto_154501 ?auto_154502 ) ) ( not ( = ?auto_154501 ?auto_154503 ) ) ( not ( = ?auto_154501 ?auto_154504 ) ) ( not ( = ?auto_154502 ?auto_154503 ) ) ( not ( = ?auto_154502 ?auto_154504 ) ) ( not ( = ?auto_154503 ?auto_154504 ) ) ( ON ?auto_154504 ?auto_154505 ) ( CLEAR ?auto_154504 ) ( HAND-EMPTY ) ( not ( = ?auto_154499 ?auto_154505 ) ) ( not ( = ?auto_154500 ?auto_154505 ) ) ( not ( = ?auto_154501 ?auto_154505 ) ) ( not ( = ?auto_154502 ?auto_154505 ) ) ( not ( = ?auto_154503 ?auto_154505 ) ) ( not ( = ?auto_154504 ?auto_154505 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_154504 ?auto_154505 )
      ( MAKE-6PILE ?auto_154499 ?auto_154500 ?auto_154501 ?auto_154502 ?auto_154503 ?auto_154504 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_154506 - BLOCK
      ?auto_154507 - BLOCK
      ?auto_154508 - BLOCK
      ?auto_154509 - BLOCK
      ?auto_154510 - BLOCK
      ?auto_154511 - BLOCK
    )
    :vars
    (
      ?auto_154512 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154506 ) ( ON ?auto_154507 ?auto_154506 ) ( ON ?auto_154508 ?auto_154507 ) ( ON ?auto_154509 ?auto_154508 ) ( not ( = ?auto_154506 ?auto_154507 ) ) ( not ( = ?auto_154506 ?auto_154508 ) ) ( not ( = ?auto_154506 ?auto_154509 ) ) ( not ( = ?auto_154506 ?auto_154510 ) ) ( not ( = ?auto_154506 ?auto_154511 ) ) ( not ( = ?auto_154507 ?auto_154508 ) ) ( not ( = ?auto_154507 ?auto_154509 ) ) ( not ( = ?auto_154507 ?auto_154510 ) ) ( not ( = ?auto_154507 ?auto_154511 ) ) ( not ( = ?auto_154508 ?auto_154509 ) ) ( not ( = ?auto_154508 ?auto_154510 ) ) ( not ( = ?auto_154508 ?auto_154511 ) ) ( not ( = ?auto_154509 ?auto_154510 ) ) ( not ( = ?auto_154509 ?auto_154511 ) ) ( not ( = ?auto_154510 ?auto_154511 ) ) ( ON ?auto_154511 ?auto_154512 ) ( CLEAR ?auto_154511 ) ( not ( = ?auto_154506 ?auto_154512 ) ) ( not ( = ?auto_154507 ?auto_154512 ) ) ( not ( = ?auto_154508 ?auto_154512 ) ) ( not ( = ?auto_154509 ?auto_154512 ) ) ( not ( = ?auto_154510 ?auto_154512 ) ) ( not ( = ?auto_154511 ?auto_154512 ) ) ( HOLDING ?auto_154510 ) ( CLEAR ?auto_154509 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_154506 ?auto_154507 ?auto_154508 ?auto_154509 ?auto_154510 )
      ( MAKE-6PILE ?auto_154506 ?auto_154507 ?auto_154508 ?auto_154509 ?auto_154510 ?auto_154511 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_154513 - BLOCK
      ?auto_154514 - BLOCK
      ?auto_154515 - BLOCK
      ?auto_154516 - BLOCK
      ?auto_154517 - BLOCK
      ?auto_154518 - BLOCK
    )
    :vars
    (
      ?auto_154519 - BLOCK
      ?auto_154521 - BLOCK
      ?auto_154520 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154513 ) ( ON ?auto_154514 ?auto_154513 ) ( ON ?auto_154515 ?auto_154514 ) ( ON ?auto_154516 ?auto_154515 ) ( not ( = ?auto_154513 ?auto_154514 ) ) ( not ( = ?auto_154513 ?auto_154515 ) ) ( not ( = ?auto_154513 ?auto_154516 ) ) ( not ( = ?auto_154513 ?auto_154517 ) ) ( not ( = ?auto_154513 ?auto_154518 ) ) ( not ( = ?auto_154514 ?auto_154515 ) ) ( not ( = ?auto_154514 ?auto_154516 ) ) ( not ( = ?auto_154514 ?auto_154517 ) ) ( not ( = ?auto_154514 ?auto_154518 ) ) ( not ( = ?auto_154515 ?auto_154516 ) ) ( not ( = ?auto_154515 ?auto_154517 ) ) ( not ( = ?auto_154515 ?auto_154518 ) ) ( not ( = ?auto_154516 ?auto_154517 ) ) ( not ( = ?auto_154516 ?auto_154518 ) ) ( not ( = ?auto_154517 ?auto_154518 ) ) ( ON ?auto_154518 ?auto_154519 ) ( not ( = ?auto_154513 ?auto_154519 ) ) ( not ( = ?auto_154514 ?auto_154519 ) ) ( not ( = ?auto_154515 ?auto_154519 ) ) ( not ( = ?auto_154516 ?auto_154519 ) ) ( not ( = ?auto_154517 ?auto_154519 ) ) ( not ( = ?auto_154518 ?auto_154519 ) ) ( CLEAR ?auto_154516 ) ( ON ?auto_154517 ?auto_154518 ) ( CLEAR ?auto_154517 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_154521 ) ( ON ?auto_154520 ?auto_154521 ) ( ON ?auto_154519 ?auto_154520 ) ( not ( = ?auto_154521 ?auto_154520 ) ) ( not ( = ?auto_154521 ?auto_154519 ) ) ( not ( = ?auto_154521 ?auto_154518 ) ) ( not ( = ?auto_154521 ?auto_154517 ) ) ( not ( = ?auto_154520 ?auto_154519 ) ) ( not ( = ?auto_154520 ?auto_154518 ) ) ( not ( = ?auto_154520 ?auto_154517 ) ) ( not ( = ?auto_154513 ?auto_154521 ) ) ( not ( = ?auto_154513 ?auto_154520 ) ) ( not ( = ?auto_154514 ?auto_154521 ) ) ( not ( = ?auto_154514 ?auto_154520 ) ) ( not ( = ?auto_154515 ?auto_154521 ) ) ( not ( = ?auto_154515 ?auto_154520 ) ) ( not ( = ?auto_154516 ?auto_154521 ) ) ( not ( = ?auto_154516 ?auto_154520 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_154521 ?auto_154520 ?auto_154519 ?auto_154518 )
      ( MAKE-6PILE ?auto_154513 ?auto_154514 ?auto_154515 ?auto_154516 ?auto_154517 ?auto_154518 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_154522 - BLOCK
      ?auto_154523 - BLOCK
      ?auto_154524 - BLOCK
      ?auto_154525 - BLOCK
      ?auto_154526 - BLOCK
      ?auto_154527 - BLOCK
    )
    :vars
    (
      ?auto_154530 - BLOCK
      ?auto_154529 - BLOCK
      ?auto_154528 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154522 ) ( ON ?auto_154523 ?auto_154522 ) ( ON ?auto_154524 ?auto_154523 ) ( not ( = ?auto_154522 ?auto_154523 ) ) ( not ( = ?auto_154522 ?auto_154524 ) ) ( not ( = ?auto_154522 ?auto_154525 ) ) ( not ( = ?auto_154522 ?auto_154526 ) ) ( not ( = ?auto_154522 ?auto_154527 ) ) ( not ( = ?auto_154523 ?auto_154524 ) ) ( not ( = ?auto_154523 ?auto_154525 ) ) ( not ( = ?auto_154523 ?auto_154526 ) ) ( not ( = ?auto_154523 ?auto_154527 ) ) ( not ( = ?auto_154524 ?auto_154525 ) ) ( not ( = ?auto_154524 ?auto_154526 ) ) ( not ( = ?auto_154524 ?auto_154527 ) ) ( not ( = ?auto_154525 ?auto_154526 ) ) ( not ( = ?auto_154525 ?auto_154527 ) ) ( not ( = ?auto_154526 ?auto_154527 ) ) ( ON ?auto_154527 ?auto_154530 ) ( not ( = ?auto_154522 ?auto_154530 ) ) ( not ( = ?auto_154523 ?auto_154530 ) ) ( not ( = ?auto_154524 ?auto_154530 ) ) ( not ( = ?auto_154525 ?auto_154530 ) ) ( not ( = ?auto_154526 ?auto_154530 ) ) ( not ( = ?auto_154527 ?auto_154530 ) ) ( ON ?auto_154526 ?auto_154527 ) ( CLEAR ?auto_154526 ) ( ON-TABLE ?auto_154529 ) ( ON ?auto_154528 ?auto_154529 ) ( ON ?auto_154530 ?auto_154528 ) ( not ( = ?auto_154529 ?auto_154528 ) ) ( not ( = ?auto_154529 ?auto_154530 ) ) ( not ( = ?auto_154529 ?auto_154527 ) ) ( not ( = ?auto_154529 ?auto_154526 ) ) ( not ( = ?auto_154528 ?auto_154530 ) ) ( not ( = ?auto_154528 ?auto_154527 ) ) ( not ( = ?auto_154528 ?auto_154526 ) ) ( not ( = ?auto_154522 ?auto_154529 ) ) ( not ( = ?auto_154522 ?auto_154528 ) ) ( not ( = ?auto_154523 ?auto_154529 ) ) ( not ( = ?auto_154523 ?auto_154528 ) ) ( not ( = ?auto_154524 ?auto_154529 ) ) ( not ( = ?auto_154524 ?auto_154528 ) ) ( not ( = ?auto_154525 ?auto_154529 ) ) ( not ( = ?auto_154525 ?auto_154528 ) ) ( HOLDING ?auto_154525 ) ( CLEAR ?auto_154524 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_154522 ?auto_154523 ?auto_154524 ?auto_154525 )
      ( MAKE-6PILE ?auto_154522 ?auto_154523 ?auto_154524 ?auto_154525 ?auto_154526 ?auto_154527 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_154531 - BLOCK
      ?auto_154532 - BLOCK
      ?auto_154533 - BLOCK
      ?auto_154534 - BLOCK
      ?auto_154535 - BLOCK
      ?auto_154536 - BLOCK
    )
    :vars
    (
      ?auto_154537 - BLOCK
      ?auto_154539 - BLOCK
      ?auto_154538 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154531 ) ( ON ?auto_154532 ?auto_154531 ) ( ON ?auto_154533 ?auto_154532 ) ( not ( = ?auto_154531 ?auto_154532 ) ) ( not ( = ?auto_154531 ?auto_154533 ) ) ( not ( = ?auto_154531 ?auto_154534 ) ) ( not ( = ?auto_154531 ?auto_154535 ) ) ( not ( = ?auto_154531 ?auto_154536 ) ) ( not ( = ?auto_154532 ?auto_154533 ) ) ( not ( = ?auto_154532 ?auto_154534 ) ) ( not ( = ?auto_154532 ?auto_154535 ) ) ( not ( = ?auto_154532 ?auto_154536 ) ) ( not ( = ?auto_154533 ?auto_154534 ) ) ( not ( = ?auto_154533 ?auto_154535 ) ) ( not ( = ?auto_154533 ?auto_154536 ) ) ( not ( = ?auto_154534 ?auto_154535 ) ) ( not ( = ?auto_154534 ?auto_154536 ) ) ( not ( = ?auto_154535 ?auto_154536 ) ) ( ON ?auto_154536 ?auto_154537 ) ( not ( = ?auto_154531 ?auto_154537 ) ) ( not ( = ?auto_154532 ?auto_154537 ) ) ( not ( = ?auto_154533 ?auto_154537 ) ) ( not ( = ?auto_154534 ?auto_154537 ) ) ( not ( = ?auto_154535 ?auto_154537 ) ) ( not ( = ?auto_154536 ?auto_154537 ) ) ( ON ?auto_154535 ?auto_154536 ) ( ON-TABLE ?auto_154539 ) ( ON ?auto_154538 ?auto_154539 ) ( ON ?auto_154537 ?auto_154538 ) ( not ( = ?auto_154539 ?auto_154538 ) ) ( not ( = ?auto_154539 ?auto_154537 ) ) ( not ( = ?auto_154539 ?auto_154536 ) ) ( not ( = ?auto_154539 ?auto_154535 ) ) ( not ( = ?auto_154538 ?auto_154537 ) ) ( not ( = ?auto_154538 ?auto_154536 ) ) ( not ( = ?auto_154538 ?auto_154535 ) ) ( not ( = ?auto_154531 ?auto_154539 ) ) ( not ( = ?auto_154531 ?auto_154538 ) ) ( not ( = ?auto_154532 ?auto_154539 ) ) ( not ( = ?auto_154532 ?auto_154538 ) ) ( not ( = ?auto_154533 ?auto_154539 ) ) ( not ( = ?auto_154533 ?auto_154538 ) ) ( not ( = ?auto_154534 ?auto_154539 ) ) ( not ( = ?auto_154534 ?auto_154538 ) ) ( CLEAR ?auto_154533 ) ( ON ?auto_154534 ?auto_154535 ) ( CLEAR ?auto_154534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_154539 ?auto_154538 ?auto_154537 ?auto_154536 ?auto_154535 )
      ( MAKE-6PILE ?auto_154531 ?auto_154532 ?auto_154533 ?auto_154534 ?auto_154535 ?auto_154536 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_154540 - BLOCK
      ?auto_154541 - BLOCK
      ?auto_154542 - BLOCK
      ?auto_154543 - BLOCK
      ?auto_154544 - BLOCK
      ?auto_154545 - BLOCK
    )
    :vars
    (
      ?auto_154546 - BLOCK
      ?auto_154548 - BLOCK
      ?auto_154547 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154540 ) ( ON ?auto_154541 ?auto_154540 ) ( not ( = ?auto_154540 ?auto_154541 ) ) ( not ( = ?auto_154540 ?auto_154542 ) ) ( not ( = ?auto_154540 ?auto_154543 ) ) ( not ( = ?auto_154540 ?auto_154544 ) ) ( not ( = ?auto_154540 ?auto_154545 ) ) ( not ( = ?auto_154541 ?auto_154542 ) ) ( not ( = ?auto_154541 ?auto_154543 ) ) ( not ( = ?auto_154541 ?auto_154544 ) ) ( not ( = ?auto_154541 ?auto_154545 ) ) ( not ( = ?auto_154542 ?auto_154543 ) ) ( not ( = ?auto_154542 ?auto_154544 ) ) ( not ( = ?auto_154542 ?auto_154545 ) ) ( not ( = ?auto_154543 ?auto_154544 ) ) ( not ( = ?auto_154543 ?auto_154545 ) ) ( not ( = ?auto_154544 ?auto_154545 ) ) ( ON ?auto_154545 ?auto_154546 ) ( not ( = ?auto_154540 ?auto_154546 ) ) ( not ( = ?auto_154541 ?auto_154546 ) ) ( not ( = ?auto_154542 ?auto_154546 ) ) ( not ( = ?auto_154543 ?auto_154546 ) ) ( not ( = ?auto_154544 ?auto_154546 ) ) ( not ( = ?auto_154545 ?auto_154546 ) ) ( ON ?auto_154544 ?auto_154545 ) ( ON-TABLE ?auto_154548 ) ( ON ?auto_154547 ?auto_154548 ) ( ON ?auto_154546 ?auto_154547 ) ( not ( = ?auto_154548 ?auto_154547 ) ) ( not ( = ?auto_154548 ?auto_154546 ) ) ( not ( = ?auto_154548 ?auto_154545 ) ) ( not ( = ?auto_154548 ?auto_154544 ) ) ( not ( = ?auto_154547 ?auto_154546 ) ) ( not ( = ?auto_154547 ?auto_154545 ) ) ( not ( = ?auto_154547 ?auto_154544 ) ) ( not ( = ?auto_154540 ?auto_154548 ) ) ( not ( = ?auto_154540 ?auto_154547 ) ) ( not ( = ?auto_154541 ?auto_154548 ) ) ( not ( = ?auto_154541 ?auto_154547 ) ) ( not ( = ?auto_154542 ?auto_154548 ) ) ( not ( = ?auto_154542 ?auto_154547 ) ) ( not ( = ?auto_154543 ?auto_154548 ) ) ( not ( = ?auto_154543 ?auto_154547 ) ) ( ON ?auto_154543 ?auto_154544 ) ( CLEAR ?auto_154543 ) ( HOLDING ?auto_154542 ) ( CLEAR ?auto_154541 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_154540 ?auto_154541 ?auto_154542 )
      ( MAKE-6PILE ?auto_154540 ?auto_154541 ?auto_154542 ?auto_154543 ?auto_154544 ?auto_154545 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_154549 - BLOCK
      ?auto_154550 - BLOCK
      ?auto_154551 - BLOCK
      ?auto_154552 - BLOCK
      ?auto_154553 - BLOCK
      ?auto_154554 - BLOCK
    )
    :vars
    (
      ?auto_154557 - BLOCK
      ?auto_154555 - BLOCK
      ?auto_154556 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154549 ) ( ON ?auto_154550 ?auto_154549 ) ( not ( = ?auto_154549 ?auto_154550 ) ) ( not ( = ?auto_154549 ?auto_154551 ) ) ( not ( = ?auto_154549 ?auto_154552 ) ) ( not ( = ?auto_154549 ?auto_154553 ) ) ( not ( = ?auto_154549 ?auto_154554 ) ) ( not ( = ?auto_154550 ?auto_154551 ) ) ( not ( = ?auto_154550 ?auto_154552 ) ) ( not ( = ?auto_154550 ?auto_154553 ) ) ( not ( = ?auto_154550 ?auto_154554 ) ) ( not ( = ?auto_154551 ?auto_154552 ) ) ( not ( = ?auto_154551 ?auto_154553 ) ) ( not ( = ?auto_154551 ?auto_154554 ) ) ( not ( = ?auto_154552 ?auto_154553 ) ) ( not ( = ?auto_154552 ?auto_154554 ) ) ( not ( = ?auto_154553 ?auto_154554 ) ) ( ON ?auto_154554 ?auto_154557 ) ( not ( = ?auto_154549 ?auto_154557 ) ) ( not ( = ?auto_154550 ?auto_154557 ) ) ( not ( = ?auto_154551 ?auto_154557 ) ) ( not ( = ?auto_154552 ?auto_154557 ) ) ( not ( = ?auto_154553 ?auto_154557 ) ) ( not ( = ?auto_154554 ?auto_154557 ) ) ( ON ?auto_154553 ?auto_154554 ) ( ON-TABLE ?auto_154555 ) ( ON ?auto_154556 ?auto_154555 ) ( ON ?auto_154557 ?auto_154556 ) ( not ( = ?auto_154555 ?auto_154556 ) ) ( not ( = ?auto_154555 ?auto_154557 ) ) ( not ( = ?auto_154555 ?auto_154554 ) ) ( not ( = ?auto_154555 ?auto_154553 ) ) ( not ( = ?auto_154556 ?auto_154557 ) ) ( not ( = ?auto_154556 ?auto_154554 ) ) ( not ( = ?auto_154556 ?auto_154553 ) ) ( not ( = ?auto_154549 ?auto_154555 ) ) ( not ( = ?auto_154549 ?auto_154556 ) ) ( not ( = ?auto_154550 ?auto_154555 ) ) ( not ( = ?auto_154550 ?auto_154556 ) ) ( not ( = ?auto_154551 ?auto_154555 ) ) ( not ( = ?auto_154551 ?auto_154556 ) ) ( not ( = ?auto_154552 ?auto_154555 ) ) ( not ( = ?auto_154552 ?auto_154556 ) ) ( ON ?auto_154552 ?auto_154553 ) ( CLEAR ?auto_154550 ) ( ON ?auto_154551 ?auto_154552 ) ( CLEAR ?auto_154551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_154555 ?auto_154556 ?auto_154557 ?auto_154554 ?auto_154553 ?auto_154552 )
      ( MAKE-6PILE ?auto_154549 ?auto_154550 ?auto_154551 ?auto_154552 ?auto_154553 ?auto_154554 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_154558 - BLOCK
      ?auto_154559 - BLOCK
      ?auto_154560 - BLOCK
      ?auto_154561 - BLOCK
      ?auto_154562 - BLOCK
      ?auto_154563 - BLOCK
    )
    :vars
    (
      ?auto_154565 - BLOCK
      ?auto_154566 - BLOCK
      ?auto_154564 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154558 ) ( not ( = ?auto_154558 ?auto_154559 ) ) ( not ( = ?auto_154558 ?auto_154560 ) ) ( not ( = ?auto_154558 ?auto_154561 ) ) ( not ( = ?auto_154558 ?auto_154562 ) ) ( not ( = ?auto_154558 ?auto_154563 ) ) ( not ( = ?auto_154559 ?auto_154560 ) ) ( not ( = ?auto_154559 ?auto_154561 ) ) ( not ( = ?auto_154559 ?auto_154562 ) ) ( not ( = ?auto_154559 ?auto_154563 ) ) ( not ( = ?auto_154560 ?auto_154561 ) ) ( not ( = ?auto_154560 ?auto_154562 ) ) ( not ( = ?auto_154560 ?auto_154563 ) ) ( not ( = ?auto_154561 ?auto_154562 ) ) ( not ( = ?auto_154561 ?auto_154563 ) ) ( not ( = ?auto_154562 ?auto_154563 ) ) ( ON ?auto_154563 ?auto_154565 ) ( not ( = ?auto_154558 ?auto_154565 ) ) ( not ( = ?auto_154559 ?auto_154565 ) ) ( not ( = ?auto_154560 ?auto_154565 ) ) ( not ( = ?auto_154561 ?auto_154565 ) ) ( not ( = ?auto_154562 ?auto_154565 ) ) ( not ( = ?auto_154563 ?auto_154565 ) ) ( ON ?auto_154562 ?auto_154563 ) ( ON-TABLE ?auto_154566 ) ( ON ?auto_154564 ?auto_154566 ) ( ON ?auto_154565 ?auto_154564 ) ( not ( = ?auto_154566 ?auto_154564 ) ) ( not ( = ?auto_154566 ?auto_154565 ) ) ( not ( = ?auto_154566 ?auto_154563 ) ) ( not ( = ?auto_154566 ?auto_154562 ) ) ( not ( = ?auto_154564 ?auto_154565 ) ) ( not ( = ?auto_154564 ?auto_154563 ) ) ( not ( = ?auto_154564 ?auto_154562 ) ) ( not ( = ?auto_154558 ?auto_154566 ) ) ( not ( = ?auto_154558 ?auto_154564 ) ) ( not ( = ?auto_154559 ?auto_154566 ) ) ( not ( = ?auto_154559 ?auto_154564 ) ) ( not ( = ?auto_154560 ?auto_154566 ) ) ( not ( = ?auto_154560 ?auto_154564 ) ) ( not ( = ?auto_154561 ?auto_154566 ) ) ( not ( = ?auto_154561 ?auto_154564 ) ) ( ON ?auto_154561 ?auto_154562 ) ( ON ?auto_154560 ?auto_154561 ) ( CLEAR ?auto_154560 ) ( HOLDING ?auto_154559 ) ( CLEAR ?auto_154558 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_154558 ?auto_154559 )
      ( MAKE-6PILE ?auto_154558 ?auto_154559 ?auto_154560 ?auto_154561 ?auto_154562 ?auto_154563 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_154567 - BLOCK
      ?auto_154568 - BLOCK
      ?auto_154569 - BLOCK
      ?auto_154570 - BLOCK
      ?auto_154571 - BLOCK
      ?auto_154572 - BLOCK
    )
    :vars
    (
      ?auto_154574 - BLOCK
      ?auto_154575 - BLOCK
      ?auto_154573 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154567 ) ( not ( = ?auto_154567 ?auto_154568 ) ) ( not ( = ?auto_154567 ?auto_154569 ) ) ( not ( = ?auto_154567 ?auto_154570 ) ) ( not ( = ?auto_154567 ?auto_154571 ) ) ( not ( = ?auto_154567 ?auto_154572 ) ) ( not ( = ?auto_154568 ?auto_154569 ) ) ( not ( = ?auto_154568 ?auto_154570 ) ) ( not ( = ?auto_154568 ?auto_154571 ) ) ( not ( = ?auto_154568 ?auto_154572 ) ) ( not ( = ?auto_154569 ?auto_154570 ) ) ( not ( = ?auto_154569 ?auto_154571 ) ) ( not ( = ?auto_154569 ?auto_154572 ) ) ( not ( = ?auto_154570 ?auto_154571 ) ) ( not ( = ?auto_154570 ?auto_154572 ) ) ( not ( = ?auto_154571 ?auto_154572 ) ) ( ON ?auto_154572 ?auto_154574 ) ( not ( = ?auto_154567 ?auto_154574 ) ) ( not ( = ?auto_154568 ?auto_154574 ) ) ( not ( = ?auto_154569 ?auto_154574 ) ) ( not ( = ?auto_154570 ?auto_154574 ) ) ( not ( = ?auto_154571 ?auto_154574 ) ) ( not ( = ?auto_154572 ?auto_154574 ) ) ( ON ?auto_154571 ?auto_154572 ) ( ON-TABLE ?auto_154575 ) ( ON ?auto_154573 ?auto_154575 ) ( ON ?auto_154574 ?auto_154573 ) ( not ( = ?auto_154575 ?auto_154573 ) ) ( not ( = ?auto_154575 ?auto_154574 ) ) ( not ( = ?auto_154575 ?auto_154572 ) ) ( not ( = ?auto_154575 ?auto_154571 ) ) ( not ( = ?auto_154573 ?auto_154574 ) ) ( not ( = ?auto_154573 ?auto_154572 ) ) ( not ( = ?auto_154573 ?auto_154571 ) ) ( not ( = ?auto_154567 ?auto_154575 ) ) ( not ( = ?auto_154567 ?auto_154573 ) ) ( not ( = ?auto_154568 ?auto_154575 ) ) ( not ( = ?auto_154568 ?auto_154573 ) ) ( not ( = ?auto_154569 ?auto_154575 ) ) ( not ( = ?auto_154569 ?auto_154573 ) ) ( not ( = ?auto_154570 ?auto_154575 ) ) ( not ( = ?auto_154570 ?auto_154573 ) ) ( ON ?auto_154570 ?auto_154571 ) ( ON ?auto_154569 ?auto_154570 ) ( CLEAR ?auto_154567 ) ( ON ?auto_154568 ?auto_154569 ) ( CLEAR ?auto_154568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_154575 ?auto_154573 ?auto_154574 ?auto_154572 ?auto_154571 ?auto_154570 ?auto_154569 )
      ( MAKE-6PILE ?auto_154567 ?auto_154568 ?auto_154569 ?auto_154570 ?auto_154571 ?auto_154572 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_154576 - BLOCK
      ?auto_154577 - BLOCK
      ?auto_154578 - BLOCK
      ?auto_154579 - BLOCK
      ?auto_154580 - BLOCK
      ?auto_154581 - BLOCK
    )
    :vars
    (
      ?auto_154584 - BLOCK
      ?auto_154582 - BLOCK
      ?auto_154583 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154576 ?auto_154577 ) ) ( not ( = ?auto_154576 ?auto_154578 ) ) ( not ( = ?auto_154576 ?auto_154579 ) ) ( not ( = ?auto_154576 ?auto_154580 ) ) ( not ( = ?auto_154576 ?auto_154581 ) ) ( not ( = ?auto_154577 ?auto_154578 ) ) ( not ( = ?auto_154577 ?auto_154579 ) ) ( not ( = ?auto_154577 ?auto_154580 ) ) ( not ( = ?auto_154577 ?auto_154581 ) ) ( not ( = ?auto_154578 ?auto_154579 ) ) ( not ( = ?auto_154578 ?auto_154580 ) ) ( not ( = ?auto_154578 ?auto_154581 ) ) ( not ( = ?auto_154579 ?auto_154580 ) ) ( not ( = ?auto_154579 ?auto_154581 ) ) ( not ( = ?auto_154580 ?auto_154581 ) ) ( ON ?auto_154581 ?auto_154584 ) ( not ( = ?auto_154576 ?auto_154584 ) ) ( not ( = ?auto_154577 ?auto_154584 ) ) ( not ( = ?auto_154578 ?auto_154584 ) ) ( not ( = ?auto_154579 ?auto_154584 ) ) ( not ( = ?auto_154580 ?auto_154584 ) ) ( not ( = ?auto_154581 ?auto_154584 ) ) ( ON ?auto_154580 ?auto_154581 ) ( ON-TABLE ?auto_154582 ) ( ON ?auto_154583 ?auto_154582 ) ( ON ?auto_154584 ?auto_154583 ) ( not ( = ?auto_154582 ?auto_154583 ) ) ( not ( = ?auto_154582 ?auto_154584 ) ) ( not ( = ?auto_154582 ?auto_154581 ) ) ( not ( = ?auto_154582 ?auto_154580 ) ) ( not ( = ?auto_154583 ?auto_154584 ) ) ( not ( = ?auto_154583 ?auto_154581 ) ) ( not ( = ?auto_154583 ?auto_154580 ) ) ( not ( = ?auto_154576 ?auto_154582 ) ) ( not ( = ?auto_154576 ?auto_154583 ) ) ( not ( = ?auto_154577 ?auto_154582 ) ) ( not ( = ?auto_154577 ?auto_154583 ) ) ( not ( = ?auto_154578 ?auto_154582 ) ) ( not ( = ?auto_154578 ?auto_154583 ) ) ( not ( = ?auto_154579 ?auto_154582 ) ) ( not ( = ?auto_154579 ?auto_154583 ) ) ( ON ?auto_154579 ?auto_154580 ) ( ON ?auto_154578 ?auto_154579 ) ( ON ?auto_154577 ?auto_154578 ) ( CLEAR ?auto_154577 ) ( HOLDING ?auto_154576 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_154576 )
      ( MAKE-6PILE ?auto_154576 ?auto_154577 ?auto_154578 ?auto_154579 ?auto_154580 ?auto_154581 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_154585 - BLOCK
      ?auto_154586 - BLOCK
      ?auto_154587 - BLOCK
      ?auto_154588 - BLOCK
      ?auto_154589 - BLOCK
      ?auto_154590 - BLOCK
    )
    :vars
    (
      ?auto_154591 - BLOCK
      ?auto_154593 - BLOCK
      ?auto_154592 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154585 ?auto_154586 ) ) ( not ( = ?auto_154585 ?auto_154587 ) ) ( not ( = ?auto_154585 ?auto_154588 ) ) ( not ( = ?auto_154585 ?auto_154589 ) ) ( not ( = ?auto_154585 ?auto_154590 ) ) ( not ( = ?auto_154586 ?auto_154587 ) ) ( not ( = ?auto_154586 ?auto_154588 ) ) ( not ( = ?auto_154586 ?auto_154589 ) ) ( not ( = ?auto_154586 ?auto_154590 ) ) ( not ( = ?auto_154587 ?auto_154588 ) ) ( not ( = ?auto_154587 ?auto_154589 ) ) ( not ( = ?auto_154587 ?auto_154590 ) ) ( not ( = ?auto_154588 ?auto_154589 ) ) ( not ( = ?auto_154588 ?auto_154590 ) ) ( not ( = ?auto_154589 ?auto_154590 ) ) ( ON ?auto_154590 ?auto_154591 ) ( not ( = ?auto_154585 ?auto_154591 ) ) ( not ( = ?auto_154586 ?auto_154591 ) ) ( not ( = ?auto_154587 ?auto_154591 ) ) ( not ( = ?auto_154588 ?auto_154591 ) ) ( not ( = ?auto_154589 ?auto_154591 ) ) ( not ( = ?auto_154590 ?auto_154591 ) ) ( ON ?auto_154589 ?auto_154590 ) ( ON-TABLE ?auto_154593 ) ( ON ?auto_154592 ?auto_154593 ) ( ON ?auto_154591 ?auto_154592 ) ( not ( = ?auto_154593 ?auto_154592 ) ) ( not ( = ?auto_154593 ?auto_154591 ) ) ( not ( = ?auto_154593 ?auto_154590 ) ) ( not ( = ?auto_154593 ?auto_154589 ) ) ( not ( = ?auto_154592 ?auto_154591 ) ) ( not ( = ?auto_154592 ?auto_154590 ) ) ( not ( = ?auto_154592 ?auto_154589 ) ) ( not ( = ?auto_154585 ?auto_154593 ) ) ( not ( = ?auto_154585 ?auto_154592 ) ) ( not ( = ?auto_154586 ?auto_154593 ) ) ( not ( = ?auto_154586 ?auto_154592 ) ) ( not ( = ?auto_154587 ?auto_154593 ) ) ( not ( = ?auto_154587 ?auto_154592 ) ) ( not ( = ?auto_154588 ?auto_154593 ) ) ( not ( = ?auto_154588 ?auto_154592 ) ) ( ON ?auto_154588 ?auto_154589 ) ( ON ?auto_154587 ?auto_154588 ) ( ON ?auto_154586 ?auto_154587 ) ( ON ?auto_154585 ?auto_154586 ) ( CLEAR ?auto_154585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_154593 ?auto_154592 ?auto_154591 ?auto_154590 ?auto_154589 ?auto_154588 ?auto_154587 ?auto_154586 )
      ( MAKE-6PILE ?auto_154585 ?auto_154586 ?auto_154587 ?auto_154588 ?auto_154589 ?auto_154590 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_154596 - BLOCK
      ?auto_154597 - BLOCK
    )
    :vars
    (
      ?auto_154598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154598 ?auto_154597 ) ( CLEAR ?auto_154598 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_154596 ) ( ON ?auto_154597 ?auto_154596 ) ( not ( = ?auto_154596 ?auto_154597 ) ) ( not ( = ?auto_154596 ?auto_154598 ) ) ( not ( = ?auto_154597 ?auto_154598 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_154598 ?auto_154597 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_154599 - BLOCK
      ?auto_154600 - BLOCK
    )
    :vars
    (
      ?auto_154601 - BLOCK
      ?auto_154602 - BLOCK
      ?auto_154603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154601 ?auto_154600 ) ( CLEAR ?auto_154601 ) ( ON-TABLE ?auto_154599 ) ( ON ?auto_154600 ?auto_154599 ) ( not ( = ?auto_154599 ?auto_154600 ) ) ( not ( = ?auto_154599 ?auto_154601 ) ) ( not ( = ?auto_154600 ?auto_154601 ) ) ( HOLDING ?auto_154602 ) ( CLEAR ?auto_154603 ) ( not ( = ?auto_154599 ?auto_154602 ) ) ( not ( = ?auto_154599 ?auto_154603 ) ) ( not ( = ?auto_154600 ?auto_154602 ) ) ( not ( = ?auto_154600 ?auto_154603 ) ) ( not ( = ?auto_154601 ?auto_154602 ) ) ( not ( = ?auto_154601 ?auto_154603 ) ) ( not ( = ?auto_154602 ?auto_154603 ) ) )
    :subtasks
    ( ( !STACK ?auto_154602 ?auto_154603 )
      ( MAKE-2PILE ?auto_154599 ?auto_154600 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_154604 - BLOCK
      ?auto_154605 - BLOCK
    )
    :vars
    (
      ?auto_154606 - BLOCK
      ?auto_154607 - BLOCK
      ?auto_154608 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154606 ?auto_154605 ) ( ON-TABLE ?auto_154604 ) ( ON ?auto_154605 ?auto_154604 ) ( not ( = ?auto_154604 ?auto_154605 ) ) ( not ( = ?auto_154604 ?auto_154606 ) ) ( not ( = ?auto_154605 ?auto_154606 ) ) ( CLEAR ?auto_154607 ) ( not ( = ?auto_154604 ?auto_154608 ) ) ( not ( = ?auto_154604 ?auto_154607 ) ) ( not ( = ?auto_154605 ?auto_154608 ) ) ( not ( = ?auto_154605 ?auto_154607 ) ) ( not ( = ?auto_154606 ?auto_154608 ) ) ( not ( = ?auto_154606 ?auto_154607 ) ) ( not ( = ?auto_154608 ?auto_154607 ) ) ( ON ?auto_154608 ?auto_154606 ) ( CLEAR ?auto_154608 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_154604 ?auto_154605 ?auto_154606 )
      ( MAKE-2PILE ?auto_154604 ?auto_154605 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_154609 - BLOCK
      ?auto_154610 - BLOCK
    )
    :vars
    (
      ?auto_154611 - BLOCK
      ?auto_154612 - BLOCK
      ?auto_154613 - BLOCK
      ?auto_154615 - BLOCK
      ?auto_154614 - BLOCK
      ?auto_154616 - BLOCK
      ?auto_154617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154611 ?auto_154610 ) ( ON-TABLE ?auto_154609 ) ( ON ?auto_154610 ?auto_154609 ) ( not ( = ?auto_154609 ?auto_154610 ) ) ( not ( = ?auto_154609 ?auto_154611 ) ) ( not ( = ?auto_154610 ?auto_154611 ) ) ( not ( = ?auto_154609 ?auto_154612 ) ) ( not ( = ?auto_154609 ?auto_154613 ) ) ( not ( = ?auto_154610 ?auto_154612 ) ) ( not ( = ?auto_154610 ?auto_154613 ) ) ( not ( = ?auto_154611 ?auto_154612 ) ) ( not ( = ?auto_154611 ?auto_154613 ) ) ( not ( = ?auto_154612 ?auto_154613 ) ) ( ON ?auto_154612 ?auto_154611 ) ( CLEAR ?auto_154612 ) ( HOLDING ?auto_154613 ) ( CLEAR ?auto_154615 ) ( ON-TABLE ?auto_154614 ) ( ON ?auto_154616 ?auto_154614 ) ( ON ?auto_154617 ?auto_154616 ) ( ON ?auto_154615 ?auto_154617 ) ( not ( = ?auto_154614 ?auto_154616 ) ) ( not ( = ?auto_154614 ?auto_154617 ) ) ( not ( = ?auto_154614 ?auto_154615 ) ) ( not ( = ?auto_154614 ?auto_154613 ) ) ( not ( = ?auto_154616 ?auto_154617 ) ) ( not ( = ?auto_154616 ?auto_154615 ) ) ( not ( = ?auto_154616 ?auto_154613 ) ) ( not ( = ?auto_154617 ?auto_154615 ) ) ( not ( = ?auto_154617 ?auto_154613 ) ) ( not ( = ?auto_154615 ?auto_154613 ) ) ( not ( = ?auto_154609 ?auto_154615 ) ) ( not ( = ?auto_154609 ?auto_154614 ) ) ( not ( = ?auto_154609 ?auto_154616 ) ) ( not ( = ?auto_154609 ?auto_154617 ) ) ( not ( = ?auto_154610 ?auto_154615 ) ) ( not ( = ?auto_154610 ?auto_154614 ) ) ( not ( = ?auto_154610 ?auto_154616 ) ) ( not ( = ?auto_154610 ?auto_154617 ) ) ( not ( = ?auto_154611 ?auto_154615 ) ) ( not ( = ?auto_154611 ?auto_154614 ) ) ( not ( = ?auto_154611 ?auto_154616 ) ) ( not ( = ?auto_154611 ?auto_154617 ) ) ( not ( = ?auto_154612 ?auto_154615 ) ) ( not ( = ?auto_154612 ?auto_154614 ) ) ( not ( = ?auto_154612 ?auto_154616 ) ) ( not ( = ?auto_154612 ?auto_154617 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_154614 ?auto_154616 ?auto_154617 ?auto_154615 ?auto_154613 )
      ( MAKE-2PILE ?auto_154609 ?auto_154610 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_154618 - BLOCK
      ?auto_154619 - BLOCK
    )
    :vars
    (
      ?auto_154624 - BLOCK
      ?auto_154625 - BLOCK
      ?auto_154626 - BLOCK
      ?auto_154623 - BLOCK
      ?auto_154621 - BLOCK
      ?auto_154622 - BLOCK
      ?auto_154620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154624 ?auto_154619 ) ( ON-TABLE ?auto_154618 ) ( ON ?auto_154619 ?auto_154618 ) ( not ( = ?auto_154618 ?auto_154619 ) ) ( not ( = ?auto_154618 ?auto_154624 ) ) ( not ( = ?auto_154619 ?auto_154624 ) ) ( not ( = ?auto_154618 ?auto_154625 ) ) ( not ( = ?auto_154618 ?auto_154626 ) ) ( not ( = ?auto_154619 ?auto_154625 ) ) ( not ( = ?auto_154619 ?auto_154626 ) ) ( not ( = ?auto_154624 ?auto_154625 ) ) ( not ( = ?auto_154624 ?auto_154626 ) ) ( not ( = ?auto_154625 ?auto_154626 ) ) ( ON ?auto_154625 ?auto_154624 ) ( CLEAR ?auto_154623 ) ( ON-TABLE ?auto_154621 ) ( ON ?auto_154622 ?auto_154621 ) ( ON ?auto_154620 ?auto_154622 ) ( ON ?auto_154623 ?auto_154620 ) ( not ( = ?auto_154621 ?auto_154622 ) ) ( not ( = ?auto_154621 ?auto_154620 ) ) ( not ( = ?auto_154621 ?auto_154623 ) ) ( not ( = ?auto_154621 ?auto_154626 ) ) ( not ( = ?auto_154622 ?auto_154620 ) ) ( not ( = ?auto_154622 ?auto_154623 ) ) ( not ( = ?auto_154622 ?auto_154626 ) ) ( not ( = ?auto_154620 ?auto_154623 ) ) ( not ( = ?auto_154620 ?auto_154626 ) ) ( not ( = ?auto_154623 ?auto_154626 ) ) ( not ( = ?auto_154618 ?auto_154623 ) ) ( not ( = ?auto_154618 ?auto_154621 ) ) ( not ( = ?auto_154618 ?auto_154622 ) ) ( not ( = ?auto_154618 ?auto_154620 ) ) ( not ( = ?auto_154619 ?auto_154623 ) ) ( not ( = ?auto_154619 ?auto_154621 ) ) ( not ( = ?auto_154619 ?auto_154622 ) ) ( not ( = ?auto_154619 ?auto_154620 ) ) ( not ( = ?auto_154624 ?auto_154623 ) ) ( not ( = ?auto_154624 ?auto_154621 ) ) ( not ( = ?auto_154624 ?auto_154622 ) ) ( not ( = ?auto_154624 ?auto_154620 ) ) ( not ( = ?auto_154625 ?auto_154623 ) ) ( not ( = ?auto_154625 ?auto_154621 ) ) ( not ( = ?auto_154625 ?auto_154622 ) ) ( not ( = ?auto_154625 ?auto_154620 ) ) ( ON ?auto_154626 ?auto_154625 ) ( CLEAR ?auto_154626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_154618 ?auto_154619 ?auto_154624 ?auto_154625 )
      ( MAKE-2PILE ?auto_154618 ?auto_154619 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_154627 - BLOCK
      ?auto_154628 - BLOCK
    )
    :vars
    (
      ?auto_154635 - BLOCK
      ?auto_154633 - BLOCK
      ?auto_154632 - BLOCK
      ?auto_154630 - BLOCK
      ?auto_154629 - BLOCK
      ?auto_154634 - BLOCK
      ?auto_154631 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154635 ?auto_154628 ) ( ON-TABLE ?auto_154627 ) ( ON ?auto_154628 ?auto_154627 ) ( not ( = ?auto_154627 ?auto_154628 ) ) ( not ( = ?auto_154627 ?auto_154635 ) ) ( not ( = ?auto_154628 ?auto_154635 ) ) ( not ( = ?auto_154627 ?auto_154633 ) ) ( not ( = ?auto_154627 ?auto_154632 ) ) ( not ( = ?auto_154628 ?auto_154633 ) ) ( not ( = ?auto_154628 ?auto_154632 ) ) ( not ( = ?auto_154635 ?auto_154633 ) ) ( not ( = ?auto_154635 ?auto_154632 ) ) ( not ( = ?auto_154633 ?auto_154632 ) ) ( ON ?auto_154633 ?auto_154635 ) ( ON-TABLE ?auto_154630 ) ( ON ?auto_154629 ?auto_154630 ) ( ON ?auto_154634 ?auto_154629 ) ( not ( = ?auto_154630 ?auto_154629 ) ) ( not ( = ?auto_154630 ?auto_154634 ) ) ( not ( = ?auto_154630 ?auto_154631 ) ) ( not ( = ?auto_154630 ?auto_154632 ) ) ( not ( = ?auto_154629 ?auto_154634 ) ) ( not ( = ?auto_154629 ?auto_154631 ) ) ( not ( = ?auto_154629 ?auto_154632 ) ) ( not ( = ?auto_154634 ?auto_154631 ) ) ( not ( = ?auto_154634 ?auto_154632 ) ) ( not ( = ?auto_154631 ?auto_154632 ) ) ( not ( = ?auto_154627 ?auto_154631 ) ) ( not ( = ?auto_154627 ?auto_154630 ) ) ( not ( = ?auto_154627 ?auto_154629 ) ) ( not ( = ?auto_154627 ?auto_154634 ) ) ( not ( = ?auto_154628 ?auto_154631 ) ) ( not ( = ?auto_154628 ?auto_154630 ) ) ( not ( = ?auto_154628 ?auto_154629 ) ) ( not ( = ?auto_154628 ?auto_154634 ) ) ( not ( = ?auto_154635 ?auto_154631 ) ) ( not ( = ?auto_154635 ?auto_154630 ) ) ( not ( = ?auto_154635 ?auto_154629 ) ) ( not ( = ?auto_154635 ?auto_154634 ) ) ( not ( = ?auto_154633 ?auto_154631 ) ) ( not ( = ?auto_154633 ?auto_154630 ) ) ( not ( = ?auto_154633 ?auto_154629 ) ) ( not ( = ?auto_154633 ?auto_154634 ) ) ( ON ?auto_154632 ?auto_154633 ) ( CLEAR ?auto_154632 ) ( HOLDING ?auto_154631 ) ( CLEAR ?auto_154634 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_154630 ?auto_154629 ?auto_154634 ?auto_154631 )
      ( MAKE-2PILE ?auto_154627 ?auto_154628 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_154636 - BLOCK
      ?auto_154637 - BLOCK
    )
    :vars
    (
      ?auto_154642 - BLOCK
      ?auto_154639 - BLOCK
      ?auto_154638 - BLOCK
      ?auto_154643 - BLOCK
      ?auto_154640 - BLOCK
      ?auto_154641 - BLOCK
      ?auto_154644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154642 ?auto_154637 ) ( ON-TABLE ?auto_154636 ) ( ON ?auto_154637 ?auto_154636 ) ( not ( = ?auto_154636 ?auto_154637 ) ) ( not ( = ?auto_154636 ?auto_154642 ) ) ( not ( = ?auto_154637 ?auto_154642 ) ) ( not ( = ?auto_154636 ?auto_154639 ) ) ( not ( = ?auto_154636 ?auto_154638 ) ) ( not ( = ?auto_154637 ?auto_154639 ) ) ( not ( = ?auto_154637 ?auto_154638 ) ) ( not ( = ?auto_154642 ?auto_154639 ) ) ( not ( = ?auto_154642 ?auto_154638 ) ) ( not ( = ?auto_154639 ?auto_154638 ) ) ( ON ?auto_154639 ?auto_154642 ) ( ON-TABLE ?auto_154643 ) ( ON ?auto_154640 ?auto_154643 ) ( ON ?auto_154641 ?auto_154640 ) ( not ( = ?auto_154643 ?auto_154640 ) ) ( not ( = ?auto_154643 ?auto_154641 ) ) ( not ( = ?auto_154643 ?auto_154644 ) ) ( not ( = ?auto_154643 ?auto_154638 ) ) ( not ( = ?auto_154640 ?auto_154641 ) ) ( not ( = ?auto_154640 ?auto_154644 ) ) ( not ( = ?auto_154640 ?auto_154638 ) ) ( not ( = ?auto_154641 ?auto_154644 ) ) ( not ( = ?auto_154641 ?auto_154638 ) ) ( not ( = ?auto_154644 ?auto_154638 ) ) ( not ( = ?auto_154636 ?auto_154644 ) ) ( not ( = ?auto_154636 ?auto_154643 ) ) ( not ( = ?auto_154636 ?auto_154640 ) ) ( not ( = ?auto_154636 ?auto_154641 ) ) ( not ( = ?auto_154637 ?auto_154644 ) ) ( not ( = ?auto_154637 ?auto_154643 ) ) ( not ( = ?auto_154637 ?auto_154640 ) ) ( not ( = ?auto_154637 ?auto_154641 ) ) ( not ( = ?auto_154642 ?auto_154644 ) ) ( not ( = ?auto_154642 ?auto_154643 ) ) ( not ( = ?auto_154642 ?auto_154640 ) ) ( not ( = ?auto_154642 ?auto_154641 ) ) ( not ( = ?auto_154639 ?auto_154644 ) ) ( not ( = ?auto_154639 ?auto_154643 ) ) ( not ( = ?auto_154639 ?auto_154640 ) ) ( not ( = ?auto_154639 ?auto_154641 ) ) ( ON ?auto_154638 ?auto_154639 ) ( CLEAR ?auto_154641 ) ( ON ?auto_154644 ?auto_154638 ) ( CLEAR ?auto_154644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_154636 ?auto_154637 ?auto_154642 ?auto_154639 ?auto_154638 )
      ( MAKE-2PILE ?auto_154636 ?auto_154637 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_154645 - BLOCK
      ?auto_154646 - BLOCK
    )
    :vars
    (
      ?auto_154653 - BLOCK
      ?auto_154649 - BLOCK
      ?auto_154650 - BLOCK
      ?auto_154652 - BLOCK
      ?auto_154648 - BLOCK
      ?auto_154651 - BLOCK
      ?auto_154647 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154653 ?auto_154646 ) ( ON-TABLE ?auto_154645 ) ( ON ?auto_154646 ?auto_154645 ) ( not ( = ?auto_154645 ?auto_154646 ) ) ( not ( = ?auto_154645 ?auto_154653 ) ) ( not ( = ?auto_154646 ?auto_154653 ) ) ( not ( = ?auto_154645 ?auto_154649 ) ) ( not ( = ?auto_154645 ?auto_154650 ) ) ( not ( = ?auto_154646 ?auto_154649 ) ) ( not ( = ?auto_154646 ?auto_154650 ) ) ( not ( = ?auto_154653 ?auto_154649 ) ) ( not ( = ?auto_154653 ?auto_154650 ) ) ( not ( = ?auto_154649 ?auto_154650 ) ) ( ON ?auto_154649 ?auto_154653 ) ( ON-TABLE ?auto_154652 ) ( ON ?auto_154648 ?auto_154652 ) ( not ( = ?auto_154652 ?auto_154648 ) ) ( not ( = ?auto_154652 ?auto_154651 ) ) ( not ( = ?auto_154652 ?auto_154647 ) ) ( not ( = ?auto_154652 ?auto_154650 ) ) ( not ( = ?auto_154648 ?auto_154651 ) ) ( not ( = ?auto_154648 ?auto_154647 ) ) ( not ( = ?auto_154648 ?auto_154650 ) ) ( not ( = ?auto_154651 ?auto_154647 ) ) ( not ( = ?auto_154651 ?auto_154650 ) ) ( not ( = ?auto_154647 ?auto_154650 ) ) ( not ( = ?auto_154645 ?auto_154647 ) ) ( not ( = ?auto_154645 ?auto_154652 ) ) ( not ( = ?auto_154645 ?auto_154648 ) ) ( not ( = ?auto_154645 ?auto_154651 ) ) ( not ( = ?auto_154646 ?auto_154647 ) ) ( not ( = ?auto_154646 ?auto_154652 ) ) ( not ( = ?auto_154646 ?auto_154648 ) ) ( not ( = ?auto_154646 ?auto_154651 ) ) ( not ( = ?auto_154653 ?auto_154647 ) ) ( not ( = ?auto_154653 ?auto_154652 ) ) ( not ( = ?auto_154653 ?auto_154648 ) ) ( not ( = ?auto_154653 ?auto_154651 ) ) ( not ( = ?auto_154649 ?auto_154647 ) ) ( not ( = ?auto_154649 ?auto_154652 ) ) ( not ( = ?auto_154649 ?auto_154648 ) ) ( not ( = ?auto_154649 ?auto_154651 ) ) ( ON ?auto_154650 ?auto_154649 ) ( ON ?auto_154647 ?auto_154650 ) ( CLEAR ?auto_154647 ) ( HOLDING ?auto_154651 ) ( CLEAR ?auto_154648 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_154652 ?auto_154648 ?auto_154651 )
      ( MAKE-2PILE ?auto_154645 ?auto_154646 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_154654 - BLOCK
      ?auto_154655 - BLOCK
    )
    :vars
    (
      ?auto_154656 - BLOCK
      ?auto_154661 - BLOCK
      ?auto_154662 - BLOCK
      ?auto_154658 - BLOCK
      ?auto_154657 - BLOCK
      ?auto_154660 - BLOCK
      ?auto_154659 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154656 ?auto_154655 ) ( ON-TABLE ?auto_154654 ) ( ON ?auto_154655 ?auto_154654 ) ( not ( = ?auto_154654 ?auto_154655 ) ) ( not ( = ?auto_154654 ?auto_154656 ) ) ( not ( = ?auto_154655 ?auto_154656 ) ) ( not ( = ?auto_154654 ?auto_154661 ) ) ( not ( = ?auto_154654 ?auto_154662 ) ) ( not ( = ?auto_154655 ?auto_154661 ) ) ( not ( = ?auto_154655 ?auto_154662 ) ) ( not ( = ?auto_154656 ?auto_154661 ) ) ( not ( = ?auto_154656 ?auto_154662 ) ) ( not ( = ?auto_154661 ?auto_154662 ) ) ( ON ?auto_154661 ?auto_154656 ) ( ON-TABLE ?auto_154658 ) ( ON ?auto_154657 ?auto_154658 ) ( not ( = ?auto_154658 ?auto_154657 ) ) ( not ( = ?auto_154658 ?auto_154660 ) ) ( not ( = ?auto_154658 ?auto_154659 ) ) ( not ( = ?auto_154658 ?auto_154662 ) ) ( not ( = ?auto_154657 ?auto_154660 ) ) ( not ( = ?auto_154657 ?auto_154659 ) ) ( not ( = ?auto_154657 ?auto_154662 ) ) ( not ( = ?auto_154660 ?auto_154659 ) ) ( not ( = ?auto_154660 ?auto_154662 ) ) ( not ( = ?auto_154659 ?auto_154662 ) ) ( not ( = ?auto_154654 ?auto_154659 ) ) ( not ( = ?auto_154654 ?auto_154658 ) ) ( not ( = ?auto_154654 ?auto_154657 ) ) ( not ( = ?auto_154654 ?auto_154660 ) ) ( not ( = ?auto_154655 ?auto_154659 ) ) ( not ( = ?auto_154655 ?auto_154658 ) ) ( not ( = ?auto_154655 ?auto_154657 ) ) ( not ( = ?auto_154655 ?auto_154660 ) ) ( not ( = ?auto_154656 ?auto_154659 ) ) ( not ( = ?auto_154656 ?auto_154658 ) ) ( not ( = ?auto_154656 ?auto_154657 ) ) ( not ( = ?auto_154656 ?auto_154660 ) ) ( not ( = ?auto_154661 ?auto_154659 ) ) ( not ( = ?auto_154661 ?auto_154658 ) ) ( not ( = ?auto_154661 ?auto_154657 ) ) ( not ( = ?auto_154661 ?auto_154660 ) ) ( ON ?auto_154662 ?auto_154661 ) ( ON ?auto_154659 ?auto_154662 ) ( CLEAR ?auto_154657 ) ( ON ?auto_154660 ?auto_154659 ) ( CLEAR ?auto_154660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_154654 ?auto_154655 ?auto_154656 ?auto_154661 ?auto_154662 ?auto_154659 )
      ( MAKE-2PILE ?auto_154654 ?auto_154655 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_154663 - BLOCK
      ?auto_154664 - BLOCK
    )
    :vars
    (
      ?auto_154668 - BLOCK
      ?auto_154669 - BLOCK
      ?auto_154665 - BLOCK
      ?auto_154667 - BLOCK
      ?auto_154666 - BLOCK
      ?auto_154671 - BLOCK
      ?auto_154670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154668 ?auto_154664 ) ( ON-TABLE ?auto_154663 ) ( ON ?auto_154664 ?auto_154663 ) ( not ( = ?auto_154663 ?auto_154664 ) ) ( not ( = ?auto_154663 ?auto_154668 ) ) ( not ( = ?auto_154664 ?auto_154668 ) ) ( not ( = ?auto_154663 ?auto_154669 ) ) ( not ( = ?auto_154663 ?auto_154665 ) ) ( not ( = ?auto_154664 ?auto_154669 ) ) ( not ( = ?auto_154664 ?auto_154665 ) ) ( not ( = ?auto_154668 ?auto_154669 ) ) ( not ( = ?auto_154668 ?auto_154665 ) ) ( not ( = ?auto_154669 ?auto_154665 ) ) ( ON ?auto_154669 ?auto_154668 ) ( ON-TABLE ?auto_154667 ) ( not ( = ?auto_154667 ?auto_154666 ) ) ( not ( = ?auto_154667 ?auto_154671 ) ) ( not ( = ?auto_154667 ?auto_154670 ) ) ( not ( = ?auto_154667 ?auto_154665 ) ) ( not ( = ?auto_154666 ?auto_154671 ) ) ( not ( = ?auto_154666 ?auto_154670 ) ) ( not ( = ?auto_154666 ?auto_154665 ) ) ( not ( = ?auto_154671 ?auto_154670 ) ) ( not ( = ?auto_154671 ?auto_154665 ) ) ( not ( = ?auto_154670 ?auto_154665 ) ) ( not ( = ?auto_154663 ?auto_154670 ) ) ( not ( = ?auto_154663 ?auto_154667 ) ) ( not ( = ?auto_154663 ?auto_154666 ) ) ( not ( = ?auto_154663 ?auto_154671 ) ) ( not ( = ?auto_154664 ?auto_154670 ) ) ( not ( = ?auto_154664 ?auto_154667 ) ) ( not ( = ?auto_154664 ?auto_154666 ) ) ( not ( = ?auto_154664 ?auto_154671 ) ) ( not ( = ?auto_154668 ?auto_154670 ) ) ( not ( = ?auto_154668 ?auto_154667 ) ) ( not ( = ?auto_154668 ?auto_154666 ) ) ( not ( = ?auto_154668 ?auto_154671 ) ) ( not ( = ?auto_154669 ?auto_154670 ) ) ( not ( = ?auto_154669 ?auto_154667 ) ) ( not ( = ?auto_154669 ?auto_154666 ) ) ( not ( = ?auto_154669 ?auto_154671 ) ) ( ON ?auto_154665 ?auto_154669 ) ( ON ?auto_154670 ?auto_154665 ) ( ON ?auto_154671 ?auto_154670 ) ( CLEAR ?auto_154671 ) ( HOLDING ?auto_154666 ) ( CLEAR ?auto_154667 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_154667 ?auto_154666 )
      ( MAKE-2PILE ?auto_154663 ?auto_154664 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_154672 - BLOCK
      ?auto_154673 - BLOCK
    )
    :vars
    (
      ?auto_154679 - BLOCK
      ?auto_154678 - BLOCK
      ?auto_154676 - BLOCK
      ?auto_154677 - BLOCK
      ?auto_154680 - BLOCK
      ?auto_154674 - BLOCK
      ?auto_154675 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154679 ?auto_154673 ) ( ON-TABLE ?auto_154672 ) ( ON ?auto_154673 ?auto_154672 ) ( not ( = ?auto_154672 ?auto_154673 ) ) ( not ( = ?auto_154672 ?auto_154679 ) ) ( not ( = ?auto_154673 ?auto_154679 ) ) ( not ( = ?auto_154672 ?auto_154678 ) ) ( not ( = ?auto_154672 ?auto_154676 ) ) ( not ( = ?auto_154673 ?auto_154678 ) ) ( not ( = ?auto_154673 ?auto_154676 ) ) ( not ( = ?auto_154679 ?auto_154678 ) ) ( not ( = ?auto_154679 ?auto_154676 ) ) ( not ( = ?auto_154678 ?auto_154676 ) ) ( ON ?auto_154678 ?auto_154679 ) ( ON-TABLE ?auto_154677 ) ( not ( = ?auto_154677 ?auto_154680 ) ) ( not ( = ?auto_154677 ?auto_154674 ) ) ( not ( = ?auto_154677 ?auto_154675 ) ) ( not ( = ?auto_154677 ?auto_154676 ) ) ( not ( = ?auto_154680 ?auto_154674 ) ) ( not ( = ?auto_154680 ?auto_154675 ) ) ( not ( = ?auto_154680 ?auto_154676 ) ) ( not ( = ?auto_154674 ?auto_154675 ) ) ( not ( = ?auto_154674 ?auto_154676 ) ) ( not ( = ?auto_154675 ?auto_154676 ) ) ( not ( = ?auto_154672 ?auto_154675 ) ) ( not ( = ?auto_154672 ?auto_154677 ) ) ( not ( = ?auto_154672 ?auto_154680 ) ) ( not ( = ?auto_154672 ?auto_154674 ) ) ( not ( = ?auto_154673 ?auto_154675 ) ) ( not ( = ?auto_154673 ?auto_154677 ) ) ( not ( = ?auto_154673 ?auto_154680 ) ) ( not ( = ?auto_154673 ?auto_154674 ) ) ( not ( = ?auto_154679 ?auto_154675 ) ) ( not ( = ?auto_154679 ?auto_154677 ) ) ( not ( = ?auto_154679 ?auto_154680 ) ) ( not ( = ?auto_154679 ?auto_154674 ) ) ( not ( = ?auto_154678 ?auto_154675 ) ) ( not ( = ?auto_154678 ?auto_154677 ) ) ( not ( = ?auto_154678 ?auto_154680 ) ) ( not ( = ?auto_154678 ?auto_154674 ) ) ( ON ?auto_154676 ?auto_154678 ) ( ON ?auto_154675 ?auto_154676 ) ( ON ?auto_154674 ?auto_154675 ) ( CLEAR ?auto_154677 ) ( ON ?auto_154680 ?auto_154674 ) ( CLEAR ?auto_154680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_154672 ?auto_154673 ?auto_154679 ?auto_154678 ?auto_154676 ?auto_154675 ?auto_154674 )
      ( MAKE-2PILE ?auto_154672 ?auto_154673 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_154681 - BLOCK
      ?auto_154682 - BLOCK
    )
    :vars
    (
      ?auto_154689 - BLOCK
      ?auto_154687 - BLOCK
      ?auto_154683 - BLOCK
      ?auto_154685 - BLOCK
      ?auto_154688 - BLOCK
      ?auto_154684 - BLOCK
      ?auto_154686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154689 ?auto_154682 ) ( ON-TABLE ?auto_154681 ) ( ON ?auto_154682 ?auto_154681 ) ( not ( = ?auto_154681 ?auto_154682 ) ) ( not ( = ?auto_154681 ?auto_154689 ) ) ( not ( = ?auto_154682 ?auto_154689 ) ) ( not ( = ?auto_154681 ?auto_154687 ) ) ( not ( = ?auto_154681 ?auto_154683 ) ) ( not ( = ?auto_154682 ?auto_154687 ) ) ( not ( = ?auto_154682 ?auto_154683 ) ) ( not ( = ?auto_154689 ?auto_154687 ) ) ( not ( = ?auto_154689 ?auto_154683 ) ) ( not ( = ?auto_154687 ?auto_154683 ) ) ( ON ?auto_154687 ?auto_154689 ) ( not ( = ?auto_154685 ?auto_154688 ) ) ( not ( = ?auto_154685 ?auto_154684 ) ) ( not ( = ?auto_154685 ?auto_154686 ) ) ( not ( = ?auto_154685 ?auto_154683 ) ) ( not ( = ?auto_154688 ?auto_154684 ) ) ( not ( = ?auto_154688 ?auto_154686 ) ) ( not ( = ?auto_154688 ?auto_154683 ) ) ( not ( = ?auto_154684 ?auto_154686 ) ) ( not ( = ?auto_154684 ?auto_154683 ) ) ( not ( = ?auto_154686 ?auto_154683 ) ) ( not ( = ?auto_154681 ?auto_154686 ) ) ( not ( = ?auto_154681 ?auto_154685 ) ) ( not ( = ?auto_154681 ?auto_154688 ) ) ( not ( = ?auto_154681 ?auto_154684 ) ) ( not ( = ?auto_154682 ?auto_154686 ) ) ( not ( = ?auto_154682 ?auto_154685 ) ) ( not ( = ?auto_154682 ?auto_154688 ) ) ( not ( = ?auto_154682 ?auto_154684 ) ) ( not ( = ?auto_154689 ?auto_154686 ) ) ( not ( = ?auto_154689 ?auto_154685 ) ) ( not ( = ?auto_154689 ?auto_154688 ) ) ( not ( = ?auto_154689 ?auto_154684 ) ) ( not ( = ?auto_154687 ?auto_154686 ) ) ( not ( = ?auto_154687 ?auto_154685 ) ) ( not ( = ?auto_154687 ?auto_154688 ) ) ( not ( = ?auto_154687 ?auto_154684 ) ) ( ON ?auto_154683 ?auto_154687 ) ( ON ?auto_154686 ?auto_154683 ) ( ON ?auto_154684 ?auto_154686 ) ( ON ?auto_154688 ?auto_154684 ) ( CLEAR ?auto_154688 ) ( HOLDING ?auto_154685 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_154685 )
      ( MAKE-2PILE ?auto_154681 ?auto_154682 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_154690 - BLOCK
      ?auto_154691 - BLOCK
    )
    :vars
    (
      ?auto_154695 - BLOCK
      ?auto_154694 - BLOCK
      ?auto_154698 - BLOCK
      ?auto_154697 - BLOCK
      ?auto_154693 - BLOCK
      ?auto_154696 - BLOCK
      ?auto_154692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154695 ?auto_154691 ) ( ON-TABLE ?auto_154690 ) ( ON ?auto_154691 ?auto_154690 ) ( not ( = ?auto_154690 ?auto_154691 ) ) ( not ( = ?auto_154690 ?auto_154695 ) ) ( not ( = ?auto_154691 ?auto_154695 ) ) ( not ( = ?auto_154690 ?auto_154694 ) ) ( not ( = ?auto_154690 ?auto_154698 ) ) ( not ( = ?auto_154691 ?auto_154694 ) ) ( not ( = ?auto_154691 ?auto_154698 ) ) ( not ( = ?auto_154695 ?auto_154694 ) ) ( not ( = ?auto_154695 ?auto_154698 ) ) ( not ( = ?auto_154694 ?auto_154698 ) ) ( ON ?auto_154694 ?auto_154695 ) ( not ( = ?auto_154697 ?auto_154693 ) ) ( not ( = ?auto_154697 ?auto_154696 ) ) ( not ( = ?auto_154697 ?auto_154692 ) ) ( not ( = ?auto_154697 ?auto_154698 ) ) ( not ( = ?auto_154693 ?auto_154696 ) ) ( not ( = ?auto_154693 ?auto_154692 ) ) ( not ( = ?auto_154693 ?auto_154698 ) ) ( not ( = ?auto_154696 ?auto_154692 ) ) ( not ( = ?auto_154696 ?auto_154698 ) ) ( not ( = ?auto_154692 ?auto_154698 ) ) ( not ( = ?auto_154690 ?auto_154692 ) ) ( not ( = ?auto_154690 ?auto_154697 ) ) ( not ( = ?auto_154690 ?auto_154693 ) ) ( not ( = ?auto_154690 ?auto_154696 ) ) ( not ( = ?auto_154691 ?auto_154692 ) ) ( not ( = ?auto_154691 ?auto_154697 ) ) ( not ( = ?auto_154691 ?auto_154693 ) ) ( not ( = ?auto_154691 ?auto_154696 ) ) ( not ( = ?auto_154695 ?auto_154692 ) ) ( not ( = ?auto_154695 ?auto_154697 ) ) ( not ( = ?auto_154695 ?auto_154693 ) ) ( not ( = ?auto_154695 ?auto_154696 ) ) ( not ( = ?auto_154694 ?auto_154692 ) ) ( not ( = ?auto_154694 ?auto_154697 ) ) ( not ( = ?auto_154694 ?auto_154693 ) ) ( not ( = ?auto_154694 ?auto_154696 ) ) ( ON ?auto_154698 ?auto_154694 ) ( ON ?auto_154692 ?auto_154698 ) ( ON ?auto_154696 ?auto_154692 ) ( ON ?auto_154693 ?auto_154696 ) ( ON ?auto_154697 ?auto_154693 ) ( CLEAR ?auto_154697 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_154690 ?auto_154691 ?auto_154695 ?auto_154694 ?auto_154698 ?auto_154692 ?auto_154696 ?auto_154693 )
      ( MAKE-2PILE ?auto_154690 ?auto_154691 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_154706 - BLOCK
      ?auto_154707 - BLOCK
      ?auto_154708 - BLOCK
      ?auto_154709 - BLOCK
      ?auto_154710 - BLOCK
      ?auto_154711 - BLOCK
      ?auto_154712 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_154712 ) ( CLEAR ?auto_154711 ) ( ON-TABLE ?auto_154706 ) ( ON ?auto_154707 ?auto_154706 ) ( ON ?auto_154708 ?auto_154707 ) ( ON ?auto_154709 ?auto_154708 ) ( ON ?auto_154710 ?auto_154709 ) ( ON ?auto_154711 ?auto_154710 ) ( not ( = ?auto_154706 ?auto_154707 ) ) ( not ( = ?auto_154706 ?auto_154708 ) ) ( not ( = ?auto_154706 ?auto_154709 ) ) ( not ( = ?auto_154706 ?auto_154710 ) ) ( not ( = ?auto_154706 ?auto_154711 ) ) ( not ( = ?auto_154706 ?auto_154712 ) ) ( not ( = ?auto_154707 ?auto_154708 ) ) ( not ( = ?auto_154707 ?auto_154709 ) ) ( not ( = ?auto_154707 ?auto_154710 ) ) ( not ( = ?auto_154707 ?auto_154711 ) ) ( not ( = ?auto_154707 ?auto_154712 ) ) ( not ( = ?auto_154708 ?auto_154709 ) ) ( not ( = ?auto_154708 ?auto_154710 ) ) ( not ( = ?auto_154708 ?auto_154711 ) ) ( not ( = ?auto_154708 ?auto_154712 ) ) ( not ( = ?auto_154709 ?auto_154710 ) ) ( not ( = ?auto_154709 ?auto_154711 ) ) ( not ( = ?auto_154709 ?auto_154712 ) ) ( not ( = ?auto_154710 ?auto_154711 ) ) ( not ( = ?auto_154710 ?auto_154712 ) ) ( not ( = ?auto_154711 ?auto_154712 ) ) )
    :subtasks
    ( ( !STACK ?auto_154712 ?auto_154711 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_154713 - BLOCK
      ?auto_154714 - BLOCK
      ?auto_154715 - BLOCK
      ?auto_154716 - BLOCK
      ?auto_154717 - BLOCK
      ?auto_154718 - BLOCK
      ?auto_154719 - BLOCK
    )
    :vars
    (
      ?auto_154720 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_154718 ) ( ON-TABLE ?auto_154713 ) ( ON ?auto_154714 ?auto_154713 ) ( ON ?auto_154715 ?auto_154714 ) ( ON ?auto_154716 ?auto_154715 ) ( ON ?auto_154717 ?auto_154716 ) ( ON ?auto_154718 ?auto_154717 ) ( not ( = ?auto_154713 ?auto_154714 ) ) ( not ( = ?auto_154713 ?auto_154715 ) ) ( not ( = ?auto_154713 ?auto_154716 ) ) ( not ( = ?auto_154713 ?auto_154717 ) ) ( not ( = ?auto_154713 ?auto_154718 ) ) ( not ( = ?auto_154713 ?auto_154719 ) ) ( not ( = ?auto_154714 ?auto_154715 ) ) ( not ( = ?auto_154714 ?auto_154716 ) ) ( not ( = ?auto_154714 ?auto_154717 ) ) ( not ( = ?auto_154714 ?auto_154718 ) ) ( not ( = ?auto_154714 ?auto_154719 ) ) ( not ( = ?auto_154715 ?auto_154716 ) ) ( not ( = ?auto_154715 ?auto_154717 ) ) ( not ( = ?auto_154715 ?auto_154718 ) ) ( not ( = ?auto_154715 ?auto_154719 ) ) ( not ( = ?auto_154716 ?auto_154717 ) ) ( not ( = ?auto_154716 ?auto_154718 ) ) ( not ( = ?auto_154716 ?auto_154719 ) ) ( not ( = ?auto_154717 ?auto_154718 ) ) ( not ( = ?auto_154717 ?auto_154719 ) ) ( not ( = ?auto_154718 ?auto_154719 ) ) ( ON ?auto_154719 ?auto_154720 ) ( CLEAR ?auto_154719 ) ( HAND-EMPTY ) ( not ( = ?auto_154713 ?auto_154720 ) ) ( not ( = ?auto_154714 ?auto_154720 ) ) ( not ( = ?auto_154715 ?auto_154720 ) ) ( not ( = ?auto_154716 ?auto_154720 ) ) ( not ( = ?auto_154717 ?auto_154720 ) ) ( not ( = ?auto_154718 ?auto_154720 ) ) ( not ( = ?auto_154719 ?auto_154720 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_154719 ?auto_154720 )
      ( MAKE-7PILE ?auto_154713 ?auto_154714 ?auto_154715 ?auto_154716 ?auto_154717 ?auto_154718 ?auto_154719 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_154721 - BLOCK
      ?auto_154722 - BLOCK
      ?auto_154723 - BLOCK
      ?auto_154724 - BLOCK
      ?auto_154725 - BLOCK
      ?auto_154726 - BLOCK
      ?auto_154727 - BLOCK
    )
    :vars
    (
      ?auto_154728 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154721 ) ( ON ?auto_154722 ?auto_154721 ) ( ON ?auto_154723 ?auto_154722 ) ( ON ?auto_154724 ?auto_154723 ) ( ON ?auto_154725 ?auto_154724 ) ( not ( = ?auto_154721 ?auto_154722 ) ) ( not ( = ?auto_154721 ?auto_154723 ) ) ( not ( = ?auto_154721 ?auto_154724 ) ) ( not ( = ?auto_154721 ?auto_154725 ) ) ( not ( = ?auto_154721 ?auto_154726 ) ) ( not ( = ?auto_154721 ?auto_154727 ) ) ( not ( = ?auto_154722 ?auto_154723 ) ) ( not ( = ?auto_154722 ?auto_154724 ) ) ( not ( = ?auto_154722 ?auto_154725 ) ) ( not ( = ?auto_154722 ?auto_154726 ) ) ( not ( = ?auto_154722 ?auto_154727 ) ) ( not ( = ?auto_154723 ?auto_154724 ) ) ( not ( = ?auto_154723 ?auto_154725 ) ) ( not ( = ?auto_154723 ?auto_154726 ) ) ( not ( = ?auto_154723 ?auto_154727 ) ) ( not ( = ?auto_154724 ?auto_154725 ) ) ( not ( = ?auto_154724 ?auto_154726 ) ) ( not ( = ?auto_154724 ?auto_154727 ) ) ( not ( = ?auto_154725 ?auto_154726 ) ) ( not ( = ?auto_154725 ?auto_154727 ) ) ( not ( = ?auto_154726 ?auto_154727 ) ) ( ON ?auto_154727 ?auto_154728 ) ( CLEAR ?auto_154727 ) ( not ( = ?auto_154721 ?auto_154728 ) ) ( not ( = ?auto_154722 ?auto_154728 ) ) ( not ( = ?auto_154723 ?auto_154728 ) ) ( not ( = ?auto_154724 ?auto_154728 ) ) ( not ( = ?auto_154725 ?auto_154728 ) ) ( not ( = ?auto_154726 ?auto_154728 ) ) ( not ( = ?auto_154727 ?auto_154728 ) ) ( HOLDING ?auto_154726 ) ( CLEAR ?auto_154725 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_154721 ?auto_154722 ?auto_154723 ?auto_154724 ?auto_154725 ?auto_154726 )
      ( MAKE-7PILE ?auto_154721 ?auto_154722 ?auto_154723 ?auto_154724 ?auto_154725 ?auto_154726 ?auto_154727 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_154729 - BLOCK
      ?auto_154730 - BLOCK
      ?auto_154731 - BLOCK
      ?auto_154732 - BLOCK
      ?auto_154733 - BLOCK
      ?auto_154734 - BLOCK
      ?auto_154735 - BLOCK
    )
    :vars
    (
      ?auto_154736 - BLOCK
      ?auto_154737 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154729 ) ( ON ?auto_154730 ?auto_154729 ) ( ON ?auto_154731 ?auto_154730 ) ( ON ?auto_154732 ?auto_154731 ) ( ON ?auto_154733 ?auto_154732 ) ( not ( = ?auto_154729 ?auto_154730 ) ) ( not ( = ?auto_154729 ?auto_154731 ) ) ( not ( = ?auto_154729 ?auto_154732 ) ) ( not ( = ?auto_154729 ?auto_154733 ) ) ( not ( = ?auto_154729 ?auto_154734 ) ) ( not ( = ?auto_154729 ?auto_154735 ) ) ( not ( = ?auto_154730 ?auto_154731 ) ) ( not ( = ?auto_154730 ?auto_154732 ) ) ( not ( = ?auto_154730 ?auto_154733 ) ) ( not ( = ?auto_154730 ?auto_154734 ) ) ( not ( = ?auto_154730 ?auto_154735 ) ) ( not ( = ?auto_154731 ?auto_154732 ) ) ( not ( = ?auto_154731 ?auto_154733 ) ) ( not ( = ?auto_154731 ?auto_154734 ) ) ( not ( = ?auto_154731 ?auto_154735 ) ) ( not ( = ?auto_154732 ?auto_154733 ) ) ( not ( = ?auto_154732 ?auto_154734 ) ) ( not ( = ?auto_154732 ?auto_154735 ) ) ( not ( = ?auto_154733 ?auto_154734 ) ) ( not ( = ?auto_154733 ?auto_154735 ) ) ( not ( = ?auto_154734 ?auto_154735 ) ) ( ON ?auto_154735 ?auto_154736 ) ( not ( = ?auto_154729 ?auto_154736 ) ) ( not ( = ?auto_154730 ?auto_154736 ) ) ( not ( = ?auto_154731 ?auto_154736 ) ) ( not ( = ?auto_154732 ?auto_154736 ) ) ( not ( = ?auto_154733 ?auto_154736 ) ) ( not ( = ?auto_154734 ?auto_154736 ) ) ( not ( = ?auto_154735 ?auto_154736 ) ) ( CLEAR ?auto_154733 ) ( ON ?auto_154734 ?auto_154735 ) ( CLEAR ?auto_154734 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_154737 ) ( ON ?auto_154736 ?auto_154737 ) ( not ( = ?auto_154737 ?auto_154736 ) ) ( not ( = ?auto_154737 ?auto_154735 ) ) ( not ( = ?auto_154737 ?auto_154734 ) ) ( not ( = ?auto_154729 ?auto_154737 ) ) ( not ( = ?auto_154730 ?auto_154737 ) ) ( not ( = ?auto_154731 ?auto_154737 ) ) ( not ( = ?auto_154732 ?auto_154737 ) ) ( not ( = ?auto_154733 ?auto_154737 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_154737 ?auto_154736 ?auto_154735 )
      ( MAKE-7PILE ?auto_154729 ?auto_154730 ?auto_154731 ?auto_154732 ?auto_154733 ?auto_154734 ?auto_154735 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_154738 - BLOCK
      ?auto_154739 - BLOCK
      ?auto_154740 - BLOCK
      ?auto_154741 - BLOCK
      ?auto_154742 - BLOCK
      ?auto_154743 - BLOCK
      ?auto_154744 - BLOCK
    )
    :vars
    (
      ?auto_154745 - BLOCK
      ?auto_154746 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154738 ) ( ON ?auto_154739 ?auto_154738 ) ( ON ?auto_154740 ?auto_154739 ) ( ON ?auto_154741 ?auto_154740 ) ( not ( = ?auto_154738 ?auto_154739 ) ) ( not ( = ?auto_154738 ?auto_154740 ) ) ( not ( = ?auto_154738 ?auto_154741 ) ) ( not ( = ?auto_154738 ?auto_154742 ) ) ( not ( = ?auto_154738 ?auto_154743 ) ) ( not ( = ?auto_154738 ?auto_154744 ) ) ( not ( = ?auto_154739 ?auto_154740 ) ) ( not ( = ?auto_154739 ?auto_154741 ) ) ( not ( = ?auto_154739 ?auto_154742 ) ) ( not ( = ?auto_154739 ?auto_154743 ) ) ( not ( = ?auto_154739 ?auto_154744 ) ) ( not ( = ?auto_154740 ?auto_154741 ) ) ( not ( = ?auto_154740 ?auto_154742 ) ) ( not ( = ?auto_154740 ?auto_154743 ) ) ( not ( = ?auto_154740 ?auto_154744 ) ) ( not ( = ?auto_154741 ?auto_154742 ) ) ( not ( = ?auto_154741 ?auto_154743 ) ) ( not ( = ?auto_154741 ?auto_154744 ) ) ( not ( = ?auto_154742 ?auto_154743 ) ) ( not ( = ?auto_154742 ?auto_154744 ) ) ( not ( = ?auto_154743 ?auto_154744 ) ) ( ON ?auto_154744 ?auto_154745 ) ( not ( = ?auto_154738 ?auto_154745 ) ) ( not ( = ?auto_154739 ?auto_154745 ) ) ( not ( = ?auto_154740 ?auto_154745 ) ) ( not ( = ?auto_154741 ?auto_154745 ) ) ( not ( = ?auto_154742 ?auto_154745 ) ) ( not ( = ?auto_154743 ?auto_154745 ) ) ( not ( = ?auto_154744 ?auto_154745 ) ) ( ON ?auto_154743 ?auto_154744 ) ( CLEAR ?auto_154743 ) ( ON-TABLE ?auto_154746 ) ( ON ?auto_154745 ?auto_154746 ) ( not ( = ?auto_154746 ?auto_154745 ) ) ( not ( = ?auto_154746 ?auto_154744 ) ) ( not ( = ?auto_154746 ?auto_154743 ) ) ( not ( = ?auto_154738 ?auto_154746 ) ) ( not ( = ?auto_154739 ?auto_154746 ) ) ( not ( = ?auto_154740 ?auto_154746 ) ) ( not ( = ?auto_154741 ?auto_154746 ) ) ( not ( = ?auto_154742 ?auto_154746 ) ) ( HOLDING ?auto_154742 ) ( CLEAR ?auto_154741 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_154738 ?auto_154739 ?auto_154740 ?auto_154741 ?auto_154742 )
      ( MAKE-7PILE ?auto_154738 ?auto_154739 ?auto_154740 ?auto_154741 ?auto_154742 ?auto_154743 ?auto_154744 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_154747 - BLOCK
      ?auto_154748 - BLOCK
      ?auto_154749 - BLOCK
      ?auto_154750 - BLOCK
      ?auto_154751 - BLOCK
      ?auto_154752 - BLOCK
      ?auto_154753 - BLOCK
    )
    :vars
    (
      ?auto_154755 - BLOCK
      ?auto_154754 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154747 ) ( ON ?auto_154748 ?auto_154747 ) ( ON ?auto_154749 ?auto_154748 ) ( ON ?auto_154750 ?auto_154749 ) ( not ( = ?auto_154747 ?auto_154748 ) ) ( not ( = ?auto_154747 ?auto_154749 ) ) ( not ( = ?auto_154747 ?auto_154750 ) ) ( not ( = ?auto_154747 ?auto_154751 ) ) ( not ( = ?auto_154747 ?auto_154752 ) ) ( not ( = ?auto_154747 ?auto_154753 ) ) ( not ( = ?auto_154748 ?auto_154749 ) ) ( not ( = ?auto_154748 ?auto_154750 ) ) ( not ( = ?auto_154748 ?auto_154751 ) ) ( not ( = ?auto_154748 ?auto_154752 ) ) ( not ( = ?auto_154748 ?auto_154753 ) ) ( not ( = ?auto_154749 ?auto_154750 ) ) ( not ( = ?auto_154749 ?auto_154751 ) ) ( not ( = ?auto_154749 ?auto_154752 ) ) ( not ( = ?auto_154749 ?auto_154753 ) ) ( not ( = ?auto_154750 ?auto_154751 ) ) ( not ( = ?auto_154750 ?auto_154752 ) ) ( not ( = ?auto_154750 ?auto_154753 ) ) ( not ( = ?auto_154751 ?auto_154752 ) ) ( not ( = ?auto_154751 ?auto_154753 ) ) ( not ( = ?auto_154752 ?auto_154753 ) ) ( ON ?auto_154753 ?auto_154755 ) ( not ( = ?auto_154747 ?auto_154755 ) ) ( not ( = ?auto_154748 ?auto_154755 ) ) ( not ( = ?auto_154749 ?auto_154755 ) ) ( not ( = ?auto_154750 ?auto_154755 ) ) ( not ( = ?auto_154751 ?auto_154755 ) ) ( not ( = ?auto_154752 ?auto_154755 ) ) ( not ( = ?auto_154753 ?auto_154755 ) ) ( ON ?auto_154752 ?auto_154753 ) ( ON-TABLE ?auto_154754 ) ( ON ?auto_154755 ?auto_154754 ) ( not ( = ?auto_154754 ?auto_154755 ) ) ( not ( = ?auto_154754 ?auto_154753 ) ) ( not ( = ?auto_154754 ?auto_154752 ) ) ( not ( = ?auto_154747 ?auto_154754 ) ) ( not ( = ?auto_154748 ?auto_154754 ) ) ( not ( = ?auto_154749 ?auto_154754 ) ) ( not ( = ?auto_154750 ?auto_154754 ) ) ( not ( = ?auto_154751 ?auto_154754 ) ) ( CLEAR ?auto_154750 ) ( ON ?auto_154751 ?auto_154752 ) ( CLEAR ?auto_154751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_154754 ?auto_154755 ?auto_154753 ?auto_154752 )
      ( MAKE-7PILE ?auto_154747 ?auto_154748 ?auto_154749 ?auto_154750 ?auto_154751 ?auto_154752 ?auto_154753 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_154756 - BLOCK
      ?auto_154757 - BLOCK
      ?auto_154758 - BLOCK
      ?auto_154759 - BLOCK
      ?auto_154760 - BLOCK
      ?auto_154761 - BLOCK
      ?auto_154762 - BLOCK
    )
    :vars
    (
      ?auto_154764 - BLOCK
      ?auto_154763 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154756 ) ( ON ?auto_154757 ?auto_154756 ) ( ON ?auto_154758 ?auto_154757 ) ( not ( = ?auto_154756 ?auto_154757 ) ) ( not ( = ?auto_154756 ?auto_154758 ) ) ( not ( = ?auto_154756 ?auto_154759 ) ) ( not ( = ?auto_154756 ?auto_154760 ) ) ( not ( = ?auto_154756 ?auto_154761 ) ) ( not ( = ?auto_154756 ?auto_154762 ) ) ( not ( = ?auto_154757 ?auto_154758 ) ) ( not ( = ?auto_154757 ?auto_154759 ) ) ( not ( = ?auto_154757 ?auto_154760 ) ) ( not ( = ?auto_154757 ?auto_154761 ) ) ( not ( = ?auto_154757 ?auto_154762 ) ) ( not ( = ?auto_154758 ?auto_154759 ) ) ( not ( = ?auto_154758 ?auto_154760 ) ) ( not ( = ?auto_154758 ?auto_154761 ) ) ( not ( = ?auto_154758 ?auto_154762 ) ) ( not ( = ?auto_154759 ?auto_154760 ) ) ( not ( = ?auto_154759 ?auto_154761 ) ) ( not ( = ?auto_154759 ?auto_154762 ) ) ( not ( = ?auto_154760 ?auto_154761 ) ) ( not ( = ?auto_154760 ?auto_154762 ) ) ( not ( = ?auto_154761 ?auto_154762 ) ) ( ON ?auto_154762 ?auto_154764 ) ( not ( = ?auto_154756 ?auto_154764 ) ) ( not ( = ?auto_154757 ?auto_154764 ) ) ( not ( = ?auto_154758 ?auto_154764 ) ) ( not ( = ?auto_154759 ?auto_154764 ) ) ( not ( = ?auto_154760 ?auto_154764 ) ) ( not ( = ?auto_154761 ?auto_154764 ) ) ( not ( = ?auto_154762 ?auto_154764 ) ) ( ON ?auto_154761 ?auto_154762 ) ( ON-TABLE ?auto_154763 ) ( ON ?auto_154764 ?auto_154763 ) ( not ( = ?auto_154763 ?auto_154764 ) ) ( not ( = ?auto_154763 ?auto_154762 ) ) ( not ( = ?auto_154763 ?auto_154761 ) ) ( not ( = ?auto_154756 ?auto_154763 ) ) ( not ( = ?auto_154757 ?auto_154763 ) ) ( not ( = ?auto_154758 ?auto_154763 ) ) ( not ( = ?auto_154759 ?auto_154763 ) ) ( not ( = ?auto_154760 ?auto_154763 ) ) ( ON ?auto_154760 ?auto_154761 ) ( CLEAR ?auto_154760 ) ( HOLDING ?auto_154759 ) ( CLEAR ?auto_154758 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_154756 ?auto_154757 ?auto_154758 ?auto_154759 )
      ( MAKE-7PILE ?auto_154756 ?auto_154757 ?auto_154758 ?auto_154759 ?auto_154760 ?auto_154761 ?auto_154762 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_154765 - BLOCK
      ?auto_154766 - BLOCK
      ?auto_154767 - BLOCK
      ?auto_154768 - BLOCK
      ?auto_154769 - BLOCK
      ?auto_154770 - BLOCK
      ?auto_154771 - BLOCK
    )
    :vars
    (
      ?auto_154773 - BLOCK
      ?auto_154772 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154765 ) ( ON ?auto_154766 ?auto_154765 ) ( ON ?auto_154767 ?auto_154766 ) ( not ( = ?auto_154765 ?auto_154766 ) ) ( not ( = ?auto_154765 ?auto_154767 ) ) ( not ( = ?auto_154765 ?auto_154768 ) ) ( not ( = ?auto_154765 ?auto_154769 ) ) ( not ( = ?auto_154765 ?auto_154770 ) ) ( not ( = ?auto_154765 ?auto_154771 ) ) ( not ( = ?auto_154766 ?auto_154767 ) ) ( not ( = ?auto_154766 ?auto_154768 ) ) ( not ( = ?auto_154766 ?auto_154769 ) ) ( not ( = ?auto_154766 ?auto_154770 ) ) ( not ( = ?auto_154766 ?auto_154771 ) ) ( not ( = ?auto_154767 ?auto_154768 ) ) ( not ( = ?auto_154767 ?auto_154769 ) ) ( not ( = ?auto_154767 ?auto_154770 ) ) ( not ( = ?auto_154767 ?auto_154771 ) ) ( not ( = ?auto_154768 ?auto_154769 ) ) ( not ( = ?auto_154768 ?auto_154770 ) ) ( not ( = ?auto_154768 ?auto_154771 ) ) ( not ( = ?auto_154769 ?auto_154770 ) ) ( not ( = ?auto_154769 ?auto_154771 ) ) ( not ( = ?auto_154770 ?auto_154771 ) ) ( ON ?auto_154771 ?auto_154773 ) ( not ( = ?auto_154765 ?auto_154773 ) ) ( not ( = ?auto_154766 ?auto_154773 ) ) ( not ( = ?auto_154767 ?auto_154773 ) ) ( not ( = ?auto_154768 ?auto_154773 ) ) ( not ( = ?auto_154769 ?auto_154773 ) ) ( not ( = ?auto_154770 ?auto_154773 ) ) ( not ( = ?auto_154771 ?auto_154773 ) ) ( ON ?auto_154770 ?auto_154771 ) ( ON-TABLE ?auto_154772 ) ( ON ?auto_154773 ?auto_154772 ) ( not ( = ?auto_154772 ?auto_154773 ) ) ( not ( = ?auto_154772 ?auto_154771 ) ) ( not ( = ?auto_154772 ?auto_154770 ) ) ( not ( = ?auto_154765 ?auto_154772 ) ) ( not ( = ?auto_154766 ?auto_154772 ) ) ( not ( = ?auto_154767 ?auto_154772 ) ) ( not ( = ?auto_154768 ?auto_154772 ) ) ( not ( = ?auto_154769 ?auto_154772 ) ) ( ON ?auto_154769 ?auto_154770 ) ( CLEAR ?auto_154767 ) ( ON ?auto_154768 ?auto_154769 ) ( CLEAR ?auto_154768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_154772 ?auto_154773 ?auto_154771 ?auto_154770 ?auto_154769 )
      ( MAKE-7PILE ?auto_154765 ?auto_154766 ?auto_154767 ?auto_154768 ?auto_154769 ?auto_154770 ?auto_154771 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_154774 - BLOCK
      ?auto_154775 - BLOCK
      ?auto_154776 - BLOCK
      ?auto_154777 - BLOCK
      ?auto_154778 - BLOCK
      ?auto_154779 - BLOCK
      ?auto_154780 - BLOCK
    )
    :vars
    (
      ?auto_154781 - BLOCK
      ?auto_154782 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154774 ) ( ON ?auto_154775 ?auto_154774 ) ( not ( = ?auto_154774 ?auto_154775 ) ) ( not ( = ?auto_154774 ?auto_154776 ) ) ( not ( = ?auto_154774 ?auto_154777 ) ) ( not ( = ?auto_154774 ?auto_154778 ) ) ( not ( = ?auto_154774 ?auto_154779 ) ) ( not ( = ?auto_154774 ?auto_154780 ) ) ( not ( = ?auto_154775 ?auto_154776 ) ) ( not ( = ?auto_154775 ?auto_154777 ) ) ( not ( = ?auto_154775 ?auto_154778 ) ) ( not ( = ?auto_154775 ?auto_154779 ) ) ( not ( = ?auto_154775 ?auto_154780 ) ) ( not ( = ?auto_154776 ?auto_154777 ) ) ( not ( = ?auto_154776 ?auto_154778 ) ) ( not ( = ?auto_154776 ?auto_154779 ) ) ( not ( = ?auto_154776 ?auto_154780 ) ) ( not ( = ?auto_154777 ?auto_154778 ) ) ( not ( = ?auto_154777 ?auto_154779 ) ) ( not ( = ?auto_154777 ?auto_154780 ) ) ( not ( = ?auto_154778 ?auto_154779 ) ) ( not ( = ?auto_154778 ?auto_154780 ) ) ( not ( = ?auto_154779 ?auto_154780 ) ) ( ON ?auto_154780 ?auto_154781 ) ( not ( = ?auto_154774 ?auto_154781 ) ) ( not ( = ?auto_154775 ?auto_154781 ) ) ( not ( = ?auto_154776 ?auto_154781 ) ) ( not ( = ?auto_154777 ?auto_154781 ) ) ( not ( = ?auto_154778 ?auto_154781 ) ) ( not ( = ?auto_154779 ?auto_154781 ) ) ( not ( = ?auto_154780 ?auto_154781 ) ) ( ON ?auto_154779 ?auto_154780 ) ( ON-TABLE ?auto_154782 ) ( ON ?auto_154781 ?auto_154782 ) ( not ( = ?auto_154782 ?auto_154781 ) ) ( not ( = ?auto_154782 ?auto_154780 ) ) ( not ( = ?auto_154782 ?auto_154779 ) ) ( not ( = ?auto_154774 ?auto_154782 ) ) ( not ( = ?auto_154775 ?auto_154782 ) ) ( not ( = ?auto_154776 ?auto_154782 ) ) ( not ( = ?auto_154777 ?auto_154782 ) ) ( not ( = ?auto_154778 ?auto_154782 ) ) ( ON ?auto_154778 ?auto_154779 ) ( ON ?auto_154777 ?auto_154778 ) ( CLEAR ?auto_154777 ) ( HOLDING ?auto_154776 ) ( CLEAR ?auto_154775 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_154774 ?auto_154775 ?auto_154776 )
      ( MAKE-7PILE ?auto_154774 ?auto_154775 ?auto_154776 ?auto_154777 ?auto_154778 ?auto_154779 ?auto_154780 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_154783 - BLOCK
      ?auto_154784 - BLOCK
      ?auto_154785 - BLOCK
      ?auto_154786 - BLOCK
      ?auto_154787 - BLOCK
      ?auto_154788 - BLOCK
      ?auto_154789 - BLOCK
    )
    :vars
    (
      ?auto_154791 - BLOCK
      ?auto_154790 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154783 ) ( ON ?auto_154784 ?auto_154783 ) ( not ( = ?auto_154783 ?auto_154784 ) ) ( not ( = ?auto_154783 ?auto_154785 ) ) ( not ( = ?auto_154783 ?auto_154786 ) ) ( not ( = ?auto_154783 ?auto_154787 ) ) ( not ( = ?auto_154783 ?auto_154788 ) ) ( not ( = ?auto_154783 ?auto_154789 ) ) ( not ( = ?auto_154784 ?auto_154785 ) ) ( not ( = ?auto_154784 ?auto_154786 ) ) ( not ( = ?auto_154784 ?auto_154787 ) ) ( not ( = ?auto_154784 ?auto_154788 ) ) ( not ( = ?auto_154784 ?auto_154789 ) ) ( not ( = ?auto_154785 ?auto_154786 ) ) ( not ( = ?auto_154785 ?auto_154787 ) ) ( not ( = ?auto_154785 ?auto_154788 ) ) ( not ( = ?auto_154785 ?auto_154789 ) ) ( not ( = ?auto_154786 ?auto_154787 ) ) ( not ( = ?auto_154786 ?auto_154788 ) ) ( not ( = ?auto_154786 ?auto_154789 ) ) ( not ( = ?auto_154787 ?auto_154788 ) ) ( not ( = ?auto_154787 ?auto_154789 ) ) ( not ( = ?auto_154788 ?auto_154789 ) ) ( ON ?auto_154789 ?auto_154791 ) ( not ( = ?auto_154783 ?auto_154791 ) ) ( not ( = ?auto_154784 ?auto_154791 ) ) ( not ( = ?auto_154785 ?auto_154791 ) ) ( not ( = ?auto_154786 ?auto_154791 ) ) ( not ( = ?auto_154787 ?auto_154791 ) ) ( not ( = ?auto_154788 ?auto_154791 ) ) ( not ( = ?auto_154789 ?auto_154791 ) ) ( ON ?auto_154788 ?auto_154789 ) ( ON-TABLE ?auto_154790 ) ( ON ?auto_154791 ?auto_154790 ) ( not ( = ?auto_154790 ?auto_154791 ) ) ( not ( = ?auto_154790 ?auto_154789 ) ) ( not ( = ?auto_154790 ?auto_154788 ) ) ( not ( = ?auto_154783 ?auto_154790 ) ) ( not ( = ?auto_154784 ?auto_154790 ) ) ( not ( = ?auto_154785 ?auto_154790 ) ) ( not ( = ?auto_154786 ?auto_154790 ) ) ( not ( = ?auto_154787 ?auto_154790 ) ) ( ON ?auto_154787 ?auto_154788 ) ( ON ?auto_154786 ?auto_154787 ) ( CLEAR ?auto_154784 ) ( ON ?auto_154785 ?auto_154786 ) ( CLEAR ?auto_154785 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_154790 ?auto_154791 ?auto_154789 ?auto_154788 ?auto_154787 ?auto_154786 )
      ( MAKE-7PILE ?auto_154783 ?auto_154784 ?auto_154785 ?auto_154786 ?auto_154787 ?auto_154788 ?auto_154789 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_154792 - BLOCK
      ?auto_154793 - BLOCK
      ?auto_154794 - BLOCK
      ?auto_154795 - BLOCK
      ?auto_154796 - BLOCK
      ?auto_154797 - BLOCK
      ?auto_154798 - BLOCK
    )
    :vars
    (
      ?auto_154799 - BLOCK
      ?auto_154800 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154792 ) ( not ( = ?auto_154792 ?auto_154793 ) ) ( not ( = ?auto_154792 ?auto_154794 ) ) ( not ( = ?auto_154792 ?auto_154795 ) ) ( not ( = ?auto_154792 ?auto_154796 ) ) ( not ( = ?auto_154792 ?auto_154797 ) ) ( not ( = ?auto_154792 ?auto_154798 ) ) ( not ( = ?auto_154793 ?auto_154794 ) ) ( not ( = ?auto_154793 ?auto_154795 ) ) ( not ( = ?auto_154793 ?auto_154796 ) ) ( not ( = ?auto_154793 ?auto_154797 ) ) ( not ( = ?auto_154793 ?auto_154798 ) ) ( not ( = ?auto_154794 ?auto_154795 ) ) ( not ( = ?auto_154794 ?auto_154796 ) ) ( not ( = ?auto_154794 ?auto_154797 ) ) ( not ( = ?auto_154794 ?auto_154798 ) ) ( not ( = ?auto_154795 ?auto_154796 ) ) ( not ( = ?auto_154795 ?auto_154797 ) ) ( not ( = ?auto_154795 ?auto_154798 ) ) ( not ( = ?auto_154796 ?auto_154797 ) ) ( not ( = ?auto_154796 ?auto_154798 ) ) ( not ( = ?auto_154797 ?auto_154798 ) ) ( ON ?auto_154798 ?auto_154799 ) ( not ( = ?auto_154792 ?auto_154799 ) ) ( not ( = ?auto_154793 ?auto_154799 ) ) ( not ( = ?auto_154794 ?auto_154799 ) ) ( not ( = ?auto_154795 ?auto_154799 ) ) ( not ( = ?auto_154796 ?auto_154799 ) ) ( not ( = ?auto_154797 ?auto_154799 ) ) ( not ( = ?auto_154798 ?auto_154799 ) ) ( ON ?auto_154797 ?auto_154798 ) ( ON-TABLE ?auto_154800 ) ( ON ?auto_154799 ?auto_154800 ) ( not ( = ?auto_154800 ?auto_154799 ) ) ( not ( = ?auto_154800 ?auto_154798 ) ) ( not ( = ?auto_154800 ?auto_154797 ) ) ( not ( = ?auto_154792 ?auto_154800 ) ) ( not ( = ?auto_154793 ?auto_154800 ) ) ( not ( = ?auto_154794 ?auto_154800 ) ) ( not ( = ?auto_154795 ?auto_154800 ) ) ( not ( = ?auto_154796 ?auto_154800 ) ) ( ON ?auto_154796 ?auto_154797 ) ( ON ?auto_154795 ?auto_154796 ) ( ON ?auto_154794 ?auto_154795 ) ( CLEAR ?auto_154794 ) ( HOLDING ?auto_154793 ) ( CLEAR ?auto_154792 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_154792 ?auto_154793 )
      ( MAKE-7PILE ?auto_154792 ?auto_154793 ?auto_154794 ?auto_154795 ?auto_154796 ?auto_154797 ?auto_154798 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_154801 - BLOCK
      ?auto_154802 - BLOCK
      ?auto_154803 - BLOCK
      ?auto_154804 - BLOCK
      ?auto_154805 - BLOCK
      ?auto_154806 - BLOCK
      ?auto_154807 - BLOCK
    )
    :vars
    (
      ?auto_154809 - BLOCK
      ?auto_154808 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154801 ) ( not ( = ?auto_154801 ?auto_154802 ) ) ( not ( = ?auto_154801 ?auto_154803 ) ) ( not ( = ?auto_154801 ?auto_154804 ) ) ( not ( = ?auto_154801 ?auto_154805 ) ) ( not ( = ?auto_154801 ?auto_154806 ) ) ( not ( = ?auto_154801 ?auto_154807 ) ) ( not ( = ?auto_154802 ?auto_154803 ) ) ( not ( = ?auto_154802 ?auto_154804 ) ) ( not ( = ?auto_154802 ?auto_154805 ) ) ( not ( = ?auto_154802 ?auto_154806 ) ) ( not ( = ?auto_154802 ?auto_154807 ) ) ( not ( = ?auto_154803 ?auto_154804 ) ) ( not ( = ?auto_154803 ?auto_154805 ) ) ( not ( = ?auto_154803 ?auto_154806 ) ) ( not ( = ?auto_154803 ?auto_154807 ) ) ( not ( = ?auto_154804 ?auto_154805 ) ) ( not ( = ?auto_154804 ?auto_154806 ) ) ( not ( = ?auto_154804 ?auto_154807 ) ) ( not ( = ?auto_154805 ?auto_154806 ) ) ( not ( = ?auto_154805 ?auto_154807 ) ) ( not ( = ?auto_154806 ?auto_154807 ) ) ( ON ?auto_154807 ?auto_154809 ) ( not ( = ?auto_154801 ?auto_154809 ) ) ( not ( = ?auto_154802 ?auto_154809 ) ) ( not ( = ?auto_154803 ?auto_154809 ) ) ( not ( = ?auto_154804 ?auto_154809 ) ) ( not ( = ?auto_154805 ?auto_154809 ) ) ( not ( = ?auto_154806 ?auto_154809 ) ) ( not ( = ?auto_154807 ?auto_154809 ) ) ( ON ?auto_154806 ?auto_154807 ) ( ON-TABLE ?auto_154808 ) ( ON ?auto_154809 ?auto_154808 ) ( not ( = ?auto_154808 ?auto_154809 ) ) ( not ( = ?auto_154808 ?auto_154807 ) ) ( not ( = ?auto_154808 ?auto_154806 ) ) ( not ( = ?auto_154801 ?auto_154808 ) ) ( not ( = ?auto_154802 ?auto_154808 ) ) ( not ( = ?auto_154803 ?auto_154808 ) ) ( not ( = ?auto_154804 ?auto_154808 ) ) ( not ( = ?auto_154805 ?auto_154808 ) ) ( ON ?auto_154805 ?auto_154806 ) ( ON ?auto_154804 ?auto_154805 ) ( ON ?auto_154803 ?auto_154804 ) ( CLEAR ?auto_154801 ) ( ON ?auto_154802 ?auto_154803 ) ( CLEAR ?auto_154802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_154808 ?auto_154809 ?auto_154807 ?auto_154806 ?auto_154805 ?auto_154804 ?auto_154803 )
      ( MAKE-7PILE ?auto_154801 ?auto_154802 ?auto_154803 ?auto_154804 ?auto_154805 ?auto_154806 ?auto_154807 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_154810 - BLOCK
      ?auto_154811 - BLOCK
      ?auto_154812 - BLOCK
      ?auto_154813 - BLOCK
      ?auto_154814 - BLOCK
      ?auto_154815 - BLOCK
      ?auto_154816 - BLOCK
    )
    :vars
    (
      ?auto_154817 - BLOCK
      ?auto_154818 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154810 ?auto_154811 ) ) ( not ( = ?auto_154810 ?auto_154812 ) ) ( not ( = ?auto_154810 ?auto_154813 ) ) ( not ( = ?auto_154810 ?auto_154814 ) ) ( not ( = ?auto_154810 ?auto_154815 ) ) ( not ( = ?auto_154810 ?auto_154816 ) ) ( not ( = ?auto_154811 ?auto_154812 ) ) ( not ( = ?auto_154811 ?auto_154813 ) ) ( not ( = ?auto_154811 ?auto_154814 ) ) ( not ( = ?auto_154811 ?auto_154815 ) ) ( not ( = ?auto_154811 ?auto_154816 ) ) ( not ( = ?auto_154812 ?auto_154813 ) ) ( not ( = ?auto_154812 ?auto_154814 ) ) ( not ( = ?auto_154812 ?auto_154815 ) ) ( not ( = ?auto_154812 ?auto_154816 ) ) ( not ( = ?auto_154813 ?auto_154814 ) ) ( not ( = ?auto_154813 ?auto_154815 ) ) ( not ( = ?auto_154813 ?auto_154816 ) ) ( not ( = ?auto_154814 ?auto_154815 ) ) ( not ( = ?auto_154814 ?auto_154816 ) ) ( not ( = ?auto_154815 ?auto_154816 ) ) ( ON ?auto_154816 ?auto_154817 ) ( not ( = ?auto_154810 ?auto_154817 ) ) ( not ( = ?auto_154811 ?auto_154817 ) ) ( not ( = ?auto_154812 ?auto_154817 ) ) ( not ( = ?auto_154813 ?auto_154817 ) ) ( not ( = ?auto_154814 ?auto_154817 ) ) ( not ( = ?auto_154815 ?auto_154817 ) ) ( not ( = ?auto_154816 ?auto_154817 ) ) ( ON ?auto_154815 ?auto_154816 ) ( ON-TABLE ?auto_154818 ) ( ON ?auto_154817 ?auto_154818 ) ( not ( = ?auto_154818 ?auto_154817 ) ) ( not ( = ?auto_154818 ?auto_154816 ) ) ( not ( = ?auto_154818 ?auto_154815 ) ) ( not ( = ?auto_154810 ?auto_154818 ) ) ( not ( = ?auto_154811 ?auto_154818 ) ) ( not ( = ?auto_154812 ?auto_154818 ) ) ( not ( = ?auto_154813 ?auto_154818 ) ) ( not ( = ?auto_154814 ?auto_154818 ) ) ( ON ?auto_154814 ?auto_154815 ) ( ON ?auto_154813 ?auto_154814 ) ( ON ?auto_154812 ?auto_154813 ) ( ON ?auto_154811 ?auto_154812 ) ( CLEAR ?auto_154811 ) ( HOLDING ?auto_154810 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_154810 )
      ( MAKE-7PILE ?auto_154810 ?auto_154811 ?auto_154812 ?auto_154813 ?auto_154814 ?auto_154815 ?auto_154816 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_154819 - BLOCK
      ?auto_154820 - BLOCK
      ?auto_154821 - BLOCK
      ?auto_154822 - BLOCK
      ?auto_154823 - BLOCK
      ?auto_154824 - BLOCK
      ?auto_154825 - BLOCK
    )
    :vars
    (
      ?auto_154826 - BLOCK
      ?auto_154827 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154819 ?auto_154820 ) ) ( not ( = ?auto_154819 ?auto_154821 ) ) ( not ( = ?auto_154819 ?auto_154822 ) ) ( not ( = ?auto_154819 ?auto_154823 ) ) ( not ( = ?auto_154819 ?auto_154824 ) ) ( not ( = ?auto_154819 ?auto_154825 ) ) ( not ( = ?auto_154820 ?auto_154821 ) ) ( not ( = ?auto_154820 ?auto_154822 ) ) ( not ( = ?auto_154820 ?auto_154823 ) ) ( not ( = ?auto_154820 ?auto_154824 ) ) ( not ( = ?auto_154820 ?auto_154825 ) ) ( not ( = ?auto_154821 ?auto_154822 ) ) ( not ( = ?auto_154821 ?auto_154823 ) ) ( not ( = ?auto_154821 ?auto_154824 ) ) ( not ( = ?auto_154821 ?auto_154825 ) ) ( not ( = ?auto_154822 ?auto_154823 ) ) ( not ( = ?auto_154822 ?auto_154824 ) ) ( not ( = ?auto_154822 ?auto_154825 ) ) ( not ( = ?auto_154823 ?auto_154824 ) ) ( not ( = ?auto_154823 ?auto_154825 ) ) ( not ( = ?auto_154824 ?auto_154825 ) ) ( ON ?auto_154825 ?auto_154826 ) ( not ( = ?auto_154819 ?auto_154826 ) ) ( not ( = ?auto_154820 ?auto_154826 ) ) ( not ( = ?auto_154821 ?auto_154826 ) ) ( not ( = ?auto_154822 ?auto_154826 ) ) ( not ( = ?auto_154823 ?auto_154826 ) ) ( not ( = ?auto_154824 ?auto_154826 ) ) ( not ( = ?auto_154825 ?auto_154826 ) ) ( ON ?auto_154824 ?auto_154825 ) ( ON-TABLE ?auto_154827 ) ( ON ?auto_154826 ?auto_154827 ) ( not ( = ?auto_154827 ?auto_154826 ) ) ( not ( = ?auto_154827 ?auto_154825 ) ) ( not ( = ?auto_154827 ?auto_154824 ) ) ( not ( = ?auto_154819 ?auto_154827 ) ) ( not ( = ?auto_154820 ?auto_154827 ) ) ( not ( = ?auto_154821 ?auto_154827 ) ) ( not ( = ?auto_154822 ?auto_154827 ) ) ( not ( = ?auto_154823 ?auto_154827 ) ) ( ON ?auto_154823 ?auto_154824 ) ( ON ?auto_154822 ?auto_154823 ) ( ON ?auto_154821 ?auto_154822 ) ( ON ?auto_154820 ?auto_154821 ) ( ON ?auto_154819 ?auto_154820 ) ( CLEAR ?auto_154819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_154827 ?auto_154826 ?auto_154825 ?auto_154824 ?auto_154823 ?auto_154822 ?auto_154821 ?auto_154820 )
      ( MAKE-7PILE ?auto_154819 ?auto_154820 ?auto_154821 ?auto_154822 ?auto_154823 ?auto_154824 ?auto_154825 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_154829 - BLOCK
    )
    :vars
    (
      ?auto_154830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154830 ?auto_154829 ) ( CLEAR ?auto_154830 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_154829 ) ( not ( = ?auto_154829 ?auto_154830 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_154830 ?auto_154829 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_154831 - BLOCK
    )
    :vars
    (
      ?auto_154832 - BLOCK
      ?auto_154833 - BLOCK
      ?auto_154834 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154832 ?auto_154831 ) ( CLEAR ?auto_154832 ) ( ON-TABLE ?auto_154831 ) ( not ( = ?auto_154831 ?auto_154832 ) ) ( HOLDING ?auto_154833 ) ( CLEAR ?auto_154834 ) ( not ( = ?auto_154831 ?auto_154833 ) ) ( not ( = ?auto_154831 ?auto_154834 ) ) ( not ( = ?auto_154832 ?auto_154833 ) ) ( not ( = ?auto_154832 ?auto_154834 ) ) ( not ( = ?auto_154833 ?auto_154834 ) ) )
    :subtasks
    ( ( !STACK ?auto_154833 ?auto_154834 )
      ( MAKE-1PILE ?auto_154831 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_154835 - BLOCK
    )
    :vars
    (
      ?auto_154836 - BLOCK
      ?auto_154838 - BLOCK
      ?auto_154837 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154836 ?auto_154835 ) ( ON-TABLE ?auto_154835 ) ( not ( = ?auto_154835 ?auto_154836 ) ) ( CLEAR ?auto_154838 ) ( not ( = ?auto_154835 ?auto_154837 ) ) ( not ( = ?auto_154835 ?auto_154838 ) ) ( not ( = ?auto_154836 ?auto_154837 ) ) ( not ( = ?auto_154836 ?auto_154838 ) ) ( not ( = ?auto_154837 ?auto_154838 ) ) ( ON ?auto_154837 ?auto_154836 ) ( CLEAR ?auto_154837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_154835 ?auto_154836 )
      ( MAKE-1PILE ?auto_154835 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_154839 - BLOCK
    )
    :vars
    (
      ?auto_154842 - BLOCK
      ?auto_154840 - BLOCK
      ?auto_154841 - BLOCK
      ?auto_154847 - BLOCK
      ?auto_154845 - BLOCK
      ?auto_154843 - BLOCK
      ?auto_154846 - BLOCK
      ?auto_154844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154842 ?auto_154839 ) ( ON-TABLE ?auto_154839 ) ( not ( = ?auto_154839 ?auto_154842 ) ) ( not ( = ?auto_154839 ?auto_154840 ) ) ( not ( = ?auto_154839 ?auto_154841 ) ) ( not ( = ?auto_154842 ?auto_154840 ) ) ( not ( = ?auto_154842 ?auto_154841 ) ) ( not ( = ?auto_154840 ?auto_154841 ) ) ( ON ?auto_154840 ?auto_154842 ) ( CLEAR ?auto_154840 ) ( HOLDING ?auto_154841 ) ( CLEAR ?auto_154847 ) ( ON-TABLE ?auto_154845 ) ( ON ?auto_154843 ?auto_154845 ) ( ON ?auto_154846 ?auto_154843 ) ( ON ?auto_154844 ?auto_154846 ) ( ON ?auto_154847 ?auto_154844 ) ( not ( = ?auto_154845 ?auto_154843 ) ) ( not ( = ?auto_154845 ?auto_154846 ) ) ( not ( = ?auto_154845 ?auto_154844 ) ) ( not ( = ?auto_154845 ?auto_154847 ) ) ( not ( = ?auto_154845 ?auto_154841 ) ) ( not ( = ?auto_154843 ?auto_154846 ) ) ( not ( = ?auto_154843 ?auto_154844 ) ) ( not ( = ?auto_154843 ?auto_154847 ) ) ( not ( = ?auto_154843 ?auto_154841 ) ) ( not ( = ?auto_154846 ?auto_154844 ) ) ( not ( = ?auto_154846 ?auto_154847 ) ) ( not ( = ?auto_154846 ?auto_154841 ) ) ( not ( = ?auto_154844 ?auto_154847 ) ) ( not ( = ?auto_154844 ?auto_154841 ) ) ( not ( = ?auto_154847 ?auto_154841 ) ) ( not ( = ?auto_154839 ?auto_154847 ) ) ( not ( = ?auto_154839 ?auto_154845 ) ) ( not ( = ?auto_154839 ?auto_154843 ) ) ( not ( = ?auto_154839 ?auto_154846 ) ) ( not ( = ?auto_154839 ?auto_154844 ) ) ( not ( = ?auto_154842 ?auto_154847 ) ) ( not ( = ?auto_154842 ?auto_154845 ) ) ( not ( = ?auto_154842 ?auto_154843 ) ) ( not ( = ?auto_154842 ?auto_154846 ) ) ( not ( = ?auto_154842 ?auto_154844 ) ) ( not ( = ?auto_154840 ?auto_154847 ) ) ( not ( = ?auto_154840 ?auto_154845 ) ) ( not ( = ?auto_154840 ?auto_154843 ) ) ( not ( = ?auto_154840 ?auto_154846 ) ) ( not ( = ?auto_154840 ?auto_154844 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_154845 ?auto_154843 ?auto_154846 ?auto_154844 ?auto_154847 ?auto_154841 )
      ( MAKE-1PILE ?auto_154839 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_154848 - BLOCK
    )
    :vars
    (
      ?auto_154855 - BLOCK
      ?auto_154854 - BLOCK
      ?auto_154851 - BLOCK
      ?auto_154849 - BLOCK
      ?auto_154856 - BLOCK
      ?auto_154850 - BLOCK
      ?auto_154853 - BLOCK
      ?auto_154852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154855 ?auto_154848 ) ( ON-TABLE ?auto_154848 ) ( not ( = ?auto_154848 ?auto_154855 ) ) ( not ( = ?auto_154848 ?auto_154854 ) ) ( not ( = ?auto_154848 ?auto_154851 ) ) ( not ( = ?auto_154855 ?auto_154854 ) ) ( not ( = ?auto_154855 ?auto_154851 ) ) ( not ( = ?auto_154854 ?auto_154851 ) ) ( ON ?auto_154854 ?auto_154855 ) ( CLEAR ?auto_154849 ) ( ON-TABLE ?auto_154856 ) ( ON ?auto_154850 ?auto_154856 ) ( ON ?auto_154853 ?auto_154850 ) ( ON ?auto_154852 ?auto_154853 ) ( ON ?auto_154849 ?auto_154852 ) ( not ( = ?auto_154856 ?auto_154850 ) ) ( not ( = ?auto_154856 ?auto_154853 ) ) ( not ( = ?auto_154856 ?auto_154852 ) ) ( not ( = ?auto_154856 ?auto_154849 ) ) ( not ( = ?auto_154856 ?auto_154851 ) ) ( not ( = ?auto_154850 ?auto_154853 ) ) ( not ( = ?auto_154850 ?auto_154852 ) ) ( not ( = ?auto_154850 ?auto_154849 ) ) ( not ( = ?auto_154850 ?auto_154851 ) ) ( not ( = ?auto_154853 ?auto_154852 ) ) ( not ( = ?auto_154853 ?auto_154849 ) ) ( not ( = ?auto_154853 ?auto_154851 ) ) ( not ( = ?auto_154852 ?auto_154849 ) ) ( not ( = ?auto_154852 ?auto_154851 ) ) ( not ( = ?auto_154849 ?auto_154851 ) ) ( not ( = ?auto_154848 ?auto_154849 ) ) ( not ( = ?auto_154848 ?auto_154856 ) ) ( not ( = ?auto_154848 ?auto_154850 ) ) ( not ( = ?auto_154848 ?auto_154853 ) ) ( not ( = ?auto_154848 ?auto_154852 ) ) ( not ( = ?auto_154855 ?auto_154849 ) ) ( not ( = ?auto_154855 ?auto_154856 ) ) ( not ( = ?auto_154855 ?auto_154850 ) ) ( not ( = ?auto_154855 ?auto_154853 ) ) ( not ( = ?auto_154855 ?auto_154852 ) ) ( not ( = ?auto_154854 ?auto_154849 ) ) ( not ( = ?auto_154854 ?auto_154856 ) ) ( not ( = ?auto_154854 ?auto_154850 ) ) ( not ( = ?auto_154854 ?auto_154853 ) ) ( not ( = ?auto_154854 ?auto_154852 ) ) ( ON ?auto_154851 ?auto_154854 ) ( CLEAR ?auto_154851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_154848 ?auto_154855 ?auto_154854 )
      ( MAKE-1PILE ?auto_154848 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_154857 - BLOCK
    )
    :vars
    (
      ?auto_154863 - BLOCK
      ?auto_154861 - BLOCK
      ?auto_154862 - BLOCK
      ?auto_154864 - BLOCK
      ?auto_154865 - BLOCK
      ?auto_154859 - BLOCK
      ?auto_154860 - BLOCK
      ?auto_154858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154863 ?auto_154857 ) ( ON-TABLE ?auto_154857 ) ( not ( = ?auto_154857 ?auto_154863 ) ) ( not ( = ?auto_154857 ?auto_154861 ) ) ( not ( = ?auto_154857 ?auto_154862 ) ) ( not ( = ?auto_154863 ?auto_154861 ) ) ( not ( = ?auto_154863 ?auto_154862 ) ) ( not ( = ?auto_154861 ?auto_154862 ) ) ( ON ?auto_154861 ?auto_154863 ) ( ON-TABLE ?auto_154864 ) ( ON ?auto_154865 ?auto_154864 ) ( ON ?auto_154859 ?auto_154865 ) ( ON ?auto_154860 ?auto_154859 ) ( not ( = ?auto_154864 ?auto_154865 ) ) ( not ( = ?auto_154864 ?auto_154859 ) ) ( not ( = ?auto_154864 ?auto_154860 ) ) ( not ( = ?auto_154864 ?auto_154858 ) ) ( not ( = ?auto_154864 ?auto_154862 ) ) ( not ( = ?auto_154865 ?auto_154859 ) ) ( not ( = ?auto_154865 ?auto_154860 ) ) ( not ( = ?auto_154865 ?auto_154858 ) ) ( not ( = ?auto_154865 ?auto_154862 ) ) ( not ( = ?auto_154859 ?auto_154860 ) ) ( not ( = ?auto_154859 ?auto_154858 ) ) ( not ( = ?auto_154859 ?auto_154862 ) ) ( not ( = ?auto_154860 ?auto_154858 ) ) ( not ( = ?auto_154860 ?auto_154862 ) ) ( not ( = ?auto_154858 ?auto_154862 ) ) ( not ( = ?auto_154857 ?auto_154858 ) ) ( not ( = ?auto_154857 ?auto_154864 ) ) ( not ( = ?auto_154857 ?auto_154865 ) ) ( not ( = ?auto_154857 ?auto_154859 ) ) ( not ( = ?auto_154857 ?auto_154860 ) ) ( not ( = ?auto_154863 ?auto_154858 ) ) ( not ( = ?auto_154863 ?auto_154864 ) ) ( not ( = ?auto_154863 ?auto_154865 ) ) ( not ( = ?auto_154863 ?auto_154859 ) ) ( not ( = ?auto_154863 ?auto_154860 ) ) ( not ( = ?auto_154861 ?auto_154858 ) ) ( not ( = ?auto_154861 ?auto_154864 ) ) ( not ( = ?auto_154861 ?auto_154865 ) ) ( not ( = ?auto_154861 ?auto_154859 ) ) ( not ( = ?auto_154861 ?auto_154860 ) ) ( ON ?auto_154862 ?auto_154861 ) ( CLEAR ?auto_154862 ) ( HOLDING ?auto_154858 ) ( CLEAR ?auto_154860 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_154864 ?auto_154865 ?auto_154859 ?auto_154860 ?auto_154858 )
      ( MAKE-1PILE ?auto_154857 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_154866 - BLOCK
    )
    :vars
    (
      ?auto_154868 - BLOCK
      ?auto_154872 - BLOCK
      ?auto_154869 - BLOCK
      ?auto_154867 - BLOCK
      ?auto_154873 - BLOCK
      ?auto_154871 - BLOCK
      ?auto_154870 - BLOCK
      ?auto_154874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154868 ?auto_154866 ) ( ON-TABLE ?auto_154866 ) ( not ( = ?auto_154866 ?auto_154868 ) ) ( not ( = ?auto_154866 ?auto_154872 ) ) ( not ( = ?auto_154866 ?auto_154869 ) ) ( not ( = ?auto_154868 ?auto_154872 ) ) ( not ( = ?auto_154868 ?auto_154869 ) ) ( not ( = ?auto_154872 ?auto_154869 ) ) ( ON ?auto_154872 ?auto_154868 ) ( ON-TABLE ?auto_154867 ) ( ON ?auto_154873 ?auto_154867 ) ( ON ?auto_154871 ?auto_154873 ) ( ON ?auto_154870 ?auto_154871 ) ( not ( = ?auto_154867 ?auto_154873 ) ) ( not ( = ?auto_154867 ?auto_154871 ) ) ( not ( = ?auto_154867 ?auto_154870 ) ) ( not ( = ?auto_154867 ?auto_154874 ) ) ( not ( = ?auto_154867 ?auto_154869 ) ) ( not ( = ?auto_154873 ?auto_154871 ) ) ( not ( = ?auto_154873 ?auto_154870 ) ) ( not ( = ?auto_154873 ?auto_154874 ) ) ( not ( = ?auto_154873 ?auto_154869 ) ) ( not ( = ?auto_154871 ?auto_154870 ) ) ( not ( = ?auto_154871 ?auto_154874 ) ) ( not ( = ?auto_154871 ?auto_154869 ) ) ( not ( = ?auto_154870 ?auto_154874 ) ) ( not ( = ?auto_154870 ?auto_154869 ) ) ( not ( = ?auto_154874 ?auto_154869 ) ) ( not ( = ?auto_154866 ?auto_154874 ) ) ( not ( = ?auto_154866 ?auto_154867 ) ) ( not ( = ?auto_154866 ?auto_154873 ) ) ( not ( = ?auto_154866 ?auto_154871 ) ) ( not ( = ?auto_154866 ?auto_154870 ) ) ( not ( = ?auto_154868 ?auto_154874 ) ) ( not ( = ?auto_154868 ?auto_154867 ) ) ( not ( = ?auto_154868 ?auto_154873 ) ) ( not ( = ?auto_154868 ?auto_154871 ) ) ( not ( = ?auto_154868 ?auto_154870 ) ) ( not ( = ?auto_154872 ?auto_154874 ) ) ( not ( = ?auto_154872 ?auto_154867 ) ) ( not ( = ?auto_154872 ?auto_154873 ) ) ( not ( = ?auto_154872 ?auto_154871 ) ) ( not ( = ?auto_154872 ?auto_154870 ) ) ( ON ?auto_154869 ?auto_154872 ) ( CLEAR ?auto_154870 ) ( ON ?auto_154874 ?auto_154869 ) ( CLEAR ?auto_154874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_154866 ?auto_154868 ?auto_154872 ?auto_154869 )
      ( MAKE-1PILE ?auto_154866 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_154875 - BLOCK
    )
    :vars
    (
      ?auto_154880 - BLOCK
      ?auto_154876 - BLOCK
      ?auto_154882 - BLOCK
      ?auto_154878 - BLOCK
      ?auto_154877 - BLOCK
      ?auto_154883 - BLOCK
      ?auto_154879 - BLOCK
      ?auto_154881 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154880 ?auto_154875 ) ( ON-TABLE ?auto_154875 ) ( not ( = ?auto_154875 ?auto_154880 ) ) ( not ( = ?auto_154875 ?auto_154876 ) ) ( not ( = ?auto_154875 ?auto_154882 ) ) ( not ( = ?auto_154880 ?auto_154876 ) ) ( not ( = ?auto_154880 ?auto_154882 ) ) ( not ( = ?auto_154876 ?auto_154882 ) ) ( ON ?auto_154876 ?auto_154880 ) ( ON-TABLE ?auto_154878 ) ( ON ?auto_154877 ?auto_154878 ) ( ON ?auto_154883 ?auto_154877 ) ( not ( = ?auto_154878 ?auto_154877 ) ) ( not ( = ?auto_154878 ?auto_154883 ) ) ( not ( = ?auto_154878 ?auto_154879 ) ) ( not ( = ?auto_154878 ?auto_154881 ) ) ( not ( = ?auto_154878 ?auto_154882 ) ) ( not ( = ?auto_154877 ?auto_154883 ) ) ( not ( = ?auto_154877 ?auto_154879 ) ) ( not ( = ?auto_154877 ?auto_154881 ) ) ( not ( = ?auto_154877 ?auto_154882 ) ) ( not ( = ?auto_154883 ?auto_154879 ) ) ( not ( = ?auto_154883 ?auto_154881 ) ) ( not ( = ?auto_154883 ?auto_154882 ) ) ( not ( = ?auto_154879 ?auto_154881 ) ) ( not ( = ?auto_154879 ?auto_154882 ) ) ( not ( = ?auto_154881 ?auto_154882 ) ) ( not ( = ?auto_154875 ?auto_154881 ) ) ( not ( = ?auto_154875 ?auto_154878 ) ) ( not ( = ?auto_154875 ?auto_154877 ) ) ( not ( = ?auto_154875 ?auto_154883 ) ) ( not ( = ?auto_154875 ?auto_154879 ) ) ( not ( = ?auto_154880 ?auto_154881 ) ) ( not ( = ?auto_154880 ?auto_154878 ) ) ( not ( = ?auto_154880 ?auto_154877 ) ) ( not ( = ?auto_154880 ?auto_154883 ) ) ( not ( = ?auto_154880 ?auto_154879 ) ) ( not ( = ?auto_154876 ?auto_154881 ) ) ( not ( = ?auto_154876 ?auto_154878 ) ) ( not ( = ?auto_154876 ?auto_154877 ) ) ( not ( = ?auto_154876 ?auto_154883 ) ) ( not ( = ?auto_154876 ?auto_154879 ) ) ( ON ?auto_154882 ?auto_154876 ) ( ON ?auto_154881 ?auto_154882 ) ( CLEAR ?auto_154881 ) ( HOLDING ?auto_154879 ) ( CLEAR ?auto_154883 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_154878 ?auto_154877 ?auto_154883 ?auto_154879 )
      ( MAKE-1PILE ?auto_154875 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_154884 - BLOCK
    )
    :vars
    (
      ?auto_154888 - BLOCK
      ?auto_154890 - BLOCK
      ?auto_154891 - BLOCK
      ?auto_154889 - BLOCK
      ?auto_154885 - BLOCK
      ?auto_154892 - BLOCK
      ?auto_154886 - BLOCK
      ?auto_154887 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154888 ?auto_154884 ) ( ON-TABLE ?auto_154884 ) ( not ( = ?auto_154884 ?auto_154888 ) ) ( not ( = ?auto_154884 ?auto_154890 ) ) ( not ( = ?auto_154884 ?auto_154891 ) ) ( not ( = ?auto_154888 ?auto_154890 ) ) ( not ( = ?auto_154888 ?auto_154891 ) ) ( not ( = ?auto_154890 ?auto_154891 ) ) ( ON ?auto_154890 ?auto_154888 ) ( ON-TABLE ?auto_154889 ) ( ON ?auto_154885 ?auto_154889 ) ( ON ?auto_154892 ?auto_154885 ) ( not ( = ?auto_154889 ?auto_154885 ) ) ( not ( = ?auto_154889 ?auto_154892 ) ) ( not ( = ?auto_154889 ?auto_154886 ) ) ( not ( = ?auto_154889 ?auto_154887 ) ) ( not ( = ?auto_154889 ?auto_154891 ) ) ( not ( = ?auto_154885 ?auto_154892 ) ) ( not ( = ?auto_154885 ?auto_154886 ) ) ( not ( = ?auto_154885 ?auto_154887 ) ) ( not ( = ?auto_154885 ?auto_154891 ) ) ( not ( = ?auto_154892 ?auto_154886 ) ) ( not ( = ?auto_154892 ?auto_154887 ) ) ( not ( = ?auto_154892 ?auto_154891 ) ) ( not ( = ?auto_154886 ?auto_154887 ) ) ( not ( = ?auto_154886 ?auto_154891 ) ) ( not ( = ?auto_154887 ?auto_154891 ) ) ( not ( = ?auto_154884 ?auto_154887 ) ) ( not ( = ?auto_154884 ?auto_154889 ) ) ( not ( = ?auto_154884 ?auto_154885 ) ) ( not ( = ?auto_154884 ?auto_154892 ) ) ( not ( = ?auto_154884 ?auto_154886 ) ) ( not ( = ?auto_154888 ?auto_154887 ) ) ( not ( = ?auto_154888 ?auto_154889 ) ) ( not ( = ?auto_154888 ?auto_154885 ) ) ( not ( = ?auto_154888 ?auto_154892 ) ) ( not ( = ?auto_154888 ?auto_154886 ) ) ( not ( = ?auto_154890 ?auto_154887 ) ) ( not ( = ?auto_154890 ?auto_154889 ) ) ( not ( = ?auto_154890 ?auto_154885 ) ) ( not ( = ?auto_154890 ?auto_154892 ) ) ( not ( = ?auto_154890 ?auto_154886 ) ) ( ON ?auto_154891 ?auto_154890 ) ( ON ?auto_154887 ?auto_154891 ) ( CLEAR ?auto_154892 ) ( ON ?auto_154886 ?auto_154887 ) ( CLEAR ?auto_154886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_154884 ?auto_154888 ?auto_154890 ?auto_154891 ?auto_154887 )
      ( MAKE-1PILE ?auto_154884 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_154893 - BLOCK
    )
    :vars
    (
      ?auto_154895 - BLOCK
      ?auto_154901 - BLOCK
      ?auto_154894 - BLOCK
      ?auto_154899 - BLOCK
      ?auto_154897 - BLOCK
      ?auto_154896 - BLOCK
      ?auto_154898 - BLOCK
      ?auto_154900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154895 ?auto_154893 ) ( ON-TABLE ?auto_154893 ) ( not ( = ?auto_154893 ?auto_154895 ) ) ( not ( = ?auto_154893 ?auto_154901 ) ) ( not ( = ?auto_154893 ?auto_154894 ) ) ( not ( = ?auto_154895 ?auto_154901 ) ) ( not ( = ?auto_154895 ?auto_154894 ) ) ( not ( = ?auto_154901 ?auto_154894 ) ) ( ON ?auto_154901 ?auto_154895 ) ( ON-TABLE ?auto_154899 ) ( ON ?auto_154897 ?auto_154899 ) ( not ( = ?auto_154899 ?auto_154897 ) ) ( not ( = ?auto_154899 ?auto_154896 ) ) ( not ( = ?auto_154899 ?auto_154898 ) ) ( not ( = ?auto_154899 ?auto_154900 ) ) ( not ( = ?auto_154899 ?auto_154894 ) ) ( not ( = ?auto_154897 ?auto_154896 ) ) ( not ( = ?auto_154897 ?auto_154898 ) ) ( not ( = ?auto_154897 ?auto_154900 ) ) ( not ( = ?auto_154897 ?auto_154894 ) ) ( not ( = ?auto_154896 ?auto_154898 ) ) ( not ( = ?auto_154896 ?auto_154900 ) ) ( not ( = ?auto_154896 ?auto_154894 ) ) ( not ( = ?auto_154898 ?auto_154900 ) ) ( not ( = ?auto_154898 ?auto_154894 ) ) ( not ( = ?auto_154900 ?auto_154894 ) ) ( not ( = ?auto_154893 ?auto_154900 ) ) ( not ( = ?auto_154893 ?auto_154899 ) ) ( not ( = ?auto_154893 ?auto_154897 ) ) ( not ( = ?auto_154893 ?auto_154896 ) ) ( not ( = ?auto_154893 ?auto_154898 ) ) ( not ( = ?auto_154895 ?auto_154900 ) ) ( not ( = ?auto_154895 ?auto_154899 ) ) ( not ( = ?auto_154895 ?auto_154897 ) ) ( not ( = ?auto_154895 ?auto_154896 ) ) ( not ( = ?auto_154895 ?auto_154898 ) ) ( not ( = ?auto_154901 ?auto_154900 ) ) ( not ( = ?auto_154901 ?auto_154899 ) ) ( not ( = ?auto_154901 ?auto_154897 ) ) ( not ( = ?auto_154901 ?auto_154896 ) ) ( not ( = ?auto_154901 ?auto_154898 ) ) ( ON ?auto_154894 ?auto_154901 ) ( ON ?auto_154900 ?auto_154894 ) ( ON ?auto_154898 ?auto_154900 ) ( CLEAR ?auto_154898 ) ( HOLDING ?auto_154896 ) ( CLEAR ?auto_154897 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_154899 ?auto_154897 ?auto_154896 )
      ( MAKE-1PILE ?auto_154893 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_154902 - BLOCK
    )
    :vars
    (
      ?auto_154910 - BLOCK
      ?auto_154903 - BLOCK
      ?auto_154907 - BLOCK
      ?auto_154909 - BLOCK
      ?auto_154906 - BLOCK
      ?auto_154905 - BLOCK
      ?auto_154904 - BLOCK
      ?auto_154908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154910 ?auto_154902 ) ( ON-TABLE ?auto_154902 ) ( not ( = ?auto_154902 ?auto_154910 ) ) ( not ( = ?auto_154902 ?auto_154903 ) ) ( not ( = ?auto_154902 ?auto_154907 ) ) ( not ( = ?auto_154910 ?auto_154903 ) ) ( not ( = ?auto_154910 ?auto_154907 ) ) ( not ( = ?auto_154903 ?auto_154907 ) ) ( ON ?auto_154903 ?auto_154910 ) ( ON-TABLE ?auto_154909 ) ( ON ?auto_154906 ?auto_154909 ) ( not ( = ?auto_154909 ?auto_154906 ) ) ( not ( = ?auto_154909 ?auto_154905 ) ) ( not ( = ?auto_154909 ?auto_154904 ) ) ( not ( = ?auto_154909 ?auto_154908 ) ) ( not ( = ?auto_154909 ?auto_154907 ) ) ( not ( = ?auto_154906 ?auto_154905 ) ) ( not ( = ?auto_154906 ?auto_154904 ) ) ( not ( = ?auto_154906 ?auto_154908 ) ) ( not ( = ?auto_154906 ?auto_154907 ) ) ( not ( = ?auto_154905 ?auto_154904 ) ) ( not ( = ?auto_154905 ?auto_154908 ) ) ( not ( = ?auto_154905 ?auto_154907 ) ) ( not ( = ?auto_154904 ?auto_154908 ) ) ( not ( = ?auto_154904 ?auto_154907 ) ) ( not ( = ?auto_154908 ?auto_154907 ) ) ( not ( = ?auto_154902 ?auto_154908 ) ) ( not ( = ?auto_154902 ?auto_154909 ) ) ( not ( = ?auto_154902 ?auto_154906 ) ) ( not ( = ?auto_154902 ?auto_154905 ) ) ( not ( = ?auto_154902 ?auto_154904 ) ) ( not ( = ?auto_154910 ?auto_154908 ) ) ( not ( = ?auto_154910 ?auto_154909 ) ) ( not ( = ?auto_154910 ?auto_154906 ) ) ( not ( = ?auto_154910 ?auto_154905 ) ) ( not ( = ?auto_154910 ?auto_154904 ) ) ( not ( = ?auto_154903 ?auto_154908 ) ) ( not ( = ?auto_154903 ?auto_154909 ) ) ( not ( = ?auto_154903 ?auto_154906 ) ) ( not ( = ?auto_154903 ?auto_154905 ) ) ( not ( = ?auto_154903 ?auto_154904 ) ) ( ON ?auto_154907 ?auto_154903 ) ( ON ?auto_154908 ?auto_154907 ) ( ON ?auto_154904 ?auto_154908 ) ( CLEAR ?auto_154906 ) ( ON ?auto_154905 ?auto_154904 ) ( CLEAR ?auto_154905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_154902 ?auto_154910 ?auto_154903 ?auto_154907 ?auto_154908 ?auto_154904 )
      ( MAKE-1PILE ?auto_154902 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_154911 - BLOCK
    )
    :vars
    (
      ?auto_154915 - BLOCK
      ?auto_154914 - BLOCK
      ?auto_154913 - BLOCK
      ?auto_154917 - BLOCK
      ?auto_154916 - BLOCK
      ?auto_154919 - BLOCK
      ?auto_154918 - BLOCK
      ?auto_154912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154915 ?auto_154911 ) ( ON-TABLE ?auto_154911 ) ( not ( = ?auto_154911 ?auto_154915 ) ) ( not ( = ?auto_154911 ?auto_154914 ) ) ( not ( = ?auto_154911 ?auto_154913 ) ) ( not ( = ?auto_154915 ?auto_154914 ) ) ( not ( = ?auto_154915 ?auto_154913 ) ) ( not ( = ?auto_154914 ?auto_154913 ) ) ( ON ?auto_154914 ?auto_154915 ) ( ON-TABLE ?auto_154917 ) ( not ( = ?auto_154917 ?auto_154916 ) ) ( not ( = ?auto_154917 ?auto_154919 ) ) ( not ( = ?auto_154917 ?auto_154918 ) ) ( not ( = ?auto_154917 ?auto_154912 ) ) ( not ( = ?auto_154917 ?auto_154913 ) ) ( not ( = ?auto_154916 ?auto_154919 ) ) ( not ( = ?auto_154916 ?auto_154918 ) ) ( not ( = ?auto_154916 ?auto_154912 ) ) ( not ( = ?auto_154916 ?auto_154913 ) ) ( not ( = ?auto_154919 ?auto_154918 ) ) ( not ( = ?auto_154919 ?auto_154912 ) ) ( not ( = ?auto_154919 ?auto_154913 ) ) ( not ( = ?auto_154918 ?auto_154912 ) ) ( not ( = ?auto_154918 ?auto_154913 ) ) ( not ( = ?auto_154912 ?auto_154913 ) ) ( not ( = ?auto_154911 ?auto_154912 ) ) ( not ( = ?auto_154911 ?auto_154917 ) ) ( not ( = ?auto_154911 ?auto_154916 ) ) ( not ( = ?auto_154911 ?auto_154919 ) ) ( not ( = ?auto_154911 ?auto_154918 ) ) ( not ( = ?auto_154915 ?auto_154912 ) ) ( not ( = ?auto_154915 ?auto_154917 ) ) ( not ( = ?auto_154915 ?auto_154916 ) ) ( not ( = ?auto_154915 ?auto_154919 ) ) ( not ( = ?auto_154915 ?auto_154918 ) ) ( not ( = ?auto_154914 ?auto_154912 ) ) ( not ( = ?auto_154914 ?auto_154917 ) ) ( not ( = ?auto_154914 ?auto_154916 ) ) ( not ( = ?auto_154914 ?auto_154919 ) ) ( not ( = ?auto_154914 ?auto_154918 ) ) ( ON ?auto_154913 ?auto_154914 ) ( ON ?auto_154912 ?auto_154913 ) ( ON ?auto_154918 ?auto_154912 ) ( ON ?auto_154919 ?auto_154918 ) ( CLEAR ?auto_154919 ) ( HOLDING ?auto_154916 ) ( CLEAR ?auto_154917 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_154917 ?auto_154916 )
      ( MAKE-1PILE ?auto_154911 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_154920 - BLOCK
    )
    :vars
    (
      ?auto_154923 - BLOCK
      ?auto_154922 - BLOCK
      ?auto_154924 - BLOCK
      ?auto_154927 - BLOCK
      ?auto_154928 - BLOCK
      ?auto_154925 - BLOCK
      ?auto_154921 - BLOCK
      ?auto_154926 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154923 ?auto_154920 ) ( ON-TABLE ?auto_154920 ) ( not ( = ?auto_154920 ?auto_154923 ) ) ( not ( = ?auto_154920 ?auto_154922 ) ) ( not ( = ?auto_154920 ?auto_154924 ) ) ( not ( = ?auto_154923 ?auto_154922 ) ) ( not ( = ?auto_154923 ?auto_154924 ) ) ( not ( = ?auto_154922 ?auto_154924 ) ) ( ON ?auto_154922 ?auto_154923 ) ( ON-TABLE ?auto_154927 ) ( not ( = ?auto_154927 ?auto_154928 ) ) ( not ( = ?auto_154927 ?auto_154925 ) ) ( not ( = ?auto_154927 ?auto_154921 ) ) ( not ( = ?auto_154927 ?auto_154926 ) ) ( not ( = ?auto_154927 ?auto_154924 ) ) ( not ( = ?auto_154928 ?auto_154925 ) ) ( not ( = ?auto_154928 ?auto_154921 ) ) ( not ( = ?auto_154928 ?auto_154926 ) ) ( not ( = ?auto_154928 ?auto_154924 ) ) ( not ( = ?auto_154925 ?auto_154921 ) ) ( not ( = ?auto_154925 ?auto_154926 ) ) ( not ( = ?auto_154925 ?auto_154924 ) ) ( not ( = ?auto_154921 ?auto_154926 ) ) ( not ( = ?auto_154921 ?auto_154924 ) ) ( not ( = ?auto_154926 ?auto_154924 ) ) ( not ( = ?auto_154920 ?auto_154926 ) ) ( not ( = ?auto_154920 ?auto_154927 ) ) ( not ( = ?auto_154920 ?auto_154928 ) ) ( not ( = ?auto_154920 ?auto_154925 ) ) ( not ( = ?auto_154920 ?auto_154921 ) ) ( not ( = ?auto_154923 ?auto_154926 ) ) ( not ( = ?auto_154923 ?auto_154927 ) ) ( not ( = ?auto_154923 ?auto_154928 ) ) ( not ( = ?auto_154923 ?auto_154925 ) ) ( not ( = ?auto_154923 ?auto_154921 ) ) ( not ( = ?auto_154922 ?auto_154926 ) ) ( not ( = ?auto_154922 ?auto_154927 ) ) ( not ( = ?auto_154922 ?auto_154928 ) ) ( not ( = ?auto_154922 ?auto_154925 ) ) ( not ( = ?auto_154922 ?auto_154921 ) ) ( ON ?auto_154924 ?auto_154922 ) ( ON ?auto_154926 ?auto_154924 ) ( ON ?auto_154921 ?auto_154926 ) ( ON ?auto_154925 ?auto_154921 ) ( CLEAR ?auto_154927 ) ( ON ?auto_154928 ?auto_154925 ) ( CLEAR ?auto_154928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_154920 ?auto_154923 ?auto_154922 ?auto_154924 ?auto_154926 ?auto_154921 ?auto_154925 )
      ( MAKE-1PILE ?auto_154920 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_154929 - BLOCK
    )
    :vars
    (
      ?auto_154937 - BLOCK
      ?auto_154932 - BLOCK
      ?auto_154934 - BLOCK
      ?auto_154930 - BLOCK
      ?auto_154933 - BLOCK
      ?auto_154931 - BLOCK
      ?auto_154935 - BLOCK
      ?auto_154936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154937 ?auto_154929 ) ( ON-TABLE ?auto_154929 ) ( not ( = ?auto_154929 ?auto_154937 ) ) ( not ( = ?auto_154929 ?auto_154932 ) ) ( not ( = ?auto_154929 ?auto_154934 ) ) ( not ( = ?auto_154937 ?auto_154932 ) ) ( not ( = ?auto_154937 ?auto_154934 ) ) ( not ( = ?auto_154932 ?auto_154934 ) ) ( ON ?auto_154932 ?auto_154937 ) ( not ( = ?auto_154930 ?auto_154933 ) ) ( not ( = ?auto_154930 ?auto_154931 ) ) ( not ( = ?auto_154930 ?auto_154935 ) ) ( not ( = ?auto_154930 ?auto_154936 ) ) ( not ( = ?auto_154930 ?auto_154934 ) ) ( not ( = ?auto_154933 ?auto_154931 ) ) ( not ( = ?auto_154933 ?auto_154935 ) ) ( not ( = ?auto_154933 ?auto_154936 ) ) ( not ( = ?auto_154933 ?auto_154934 ) ) ( not ( = ?auto_154931 ?auto_154935 ) ) ( not ( = ?auto_154931 ?auto_154936 ) ) ( not ( = ?auto_154931 ?auto_154934 ) ) ( not ( = ?auto_154935 ?auto_154936 ) ) ( not ( = ?auto_154935 ?auto_154934 ) ) ( not ( = ?auto_154936 ?auto_154934 ) ) ( not ( = ?auto_154929 ?auto_154936 ) ) ( not ( = ?auto_154929 ?auto_154930 ) ) ( not ( = ?auto_154929 ?auto_154933 ) ) ( not ( = ?auto_154929 ?auto_154931 ) ) ( not ( = ?auto_154929 ?auto_154935 ) ) ( not ( = ?auto_154937 ?auto_154936 ) ) ( not ( = ?auto_154937 ?auto_154930 ) ) ( not ( = ?auto_154937 ?auto_154933 ) ) ( not ( = ?auto_154937 ?auto_154931 ) ) ( not ( = ?auto_154937 ?auto_154935 ) ) ( not ( = ?auto_154932 ?auto_154936 ) ) ( not ( = ?auto_154932 ?auto_154930 ) ) ( not ( = ?auto_154932 ?auto_154933 ) ) ( not ( = ?auto_154932 ?auto_154931 ) ) ( not ( = ?auto_154932 ?auto_154935 ) ) ( ON ?auto_154934 ?auto_154932 ) ( ON ?auto_154936 ?auto_154934 ) ( ON ?auto_154935 ?auto_154936 ) ( ON ?auto_154931 ?auto_154935 ) ( ON ?auto_154933 ?auto_154931 ) ( CLEAR ?auto_154933 ) ( HOLDING ?auto_154930 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_154930 )
      ( MAKE-1PILE ?auto_154929 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_154938 - BLOCK
    )
    :vars
    (
      ?auto_154945 - BLOCK
      ?auto_154943 - BLOCK
      ?auto_154946 - BLOCK
      ?auto_154944 - BLOCK
      ?auto_154942 - BLOCK
      ?auto_154940 - BLOCK
      ?auto_154941 - BLOCK
      ?auto_154939 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154945 ?auto_154938 ) ( ON-TABLE ?auto_154938 ) ( not ( = ?auto_154938 ?auto_154945 ) ) ( not ( = ?auto_154938 ?auto_154943 ) ) ( not ( = ?auto_154938 ?auto_154946 ) ) ( not ( = ?auto_154945 ?auto_154943 ) ) ( not ( = ?auto_154945 ?auto_154946 ) ) ( not ( = ?auto_154943 ?auto_154946 ) ) ( ON ?auto_154943 ?auto_154945 ) ( not ( = ?auto_154944 ?auto_154942 ) ) ( not ( = ?auto_154944 ?auto_154940 ) ) ( not ( = ?auto_154944 ?auto_154941 ) ) ( not ( = ?auto_154944 ?auto_154939 ) ) ( not ( = ?auto_154944 ?auto_154946 ) ) ( not ( = ?auto_154942 ?auto_154940 ) ) ( not ( = ?auto_154942 ?auto_154941 ) ) ( not ( = ?auto_154942 ?auto_154939 ) ) ( not ( = ?auto_154942 ?auto_154946 ) ) ( not ( = ?auto_154940 ?auto_154941 ) ) ( not ( = ?auto_154940 ?auto_154939 ) ) ( not ( = ?auto_154940 ?auto_154946 ) ) ( not ( = ?auto_154941 ?auto_154939 ) ) ( not ( = ?auto_154941 ?auto_154946 ) ) ( not ( = ?auto_154939 ?auto_154946 ) ) ( not ( = ?auto_154938 ?auto_154939 ) ) ( not ( = ?auto_154938 ?auto_154944 ) ) ( not ( = ?auto_154938 ?auto_154942 ) ) ( not ( = ?auto_154938 ?auto_154940 ) ) ( not ( = ?auto_154938 ?auto_154941 ) ) ( not ( = ?auto_154945 ?auto_154939 ) ) ( not ( = ?auto_154945 ?auto_154944 ) ) ( not ( = ?auto_154945 ?auto_154942 ) ) ( not ( = ?auto_154945 ?auto_154940 ) ) ( not ( = ?auto_154945 ?auto_154941 ) ) ( not ( = ?auto_154943 ?auto_154939 ) ) ( not ( = ?auto_154943 ?auto_154944 ) ) ( not ( = ?auto_154943 ?auto_154942 ) ) ( not ( = ?auto_154943 ?auto_154940 ) ) ( not ( = ?auto_154943 ?auto_154941 ) ) ( ON ?auto_154946 ?auto_154943 ) ( ON ?auto_154939 ?auto_154946 ) ( ON ?auto_154941 ?auto_154939 ) ( ON ?auto_154940 ?auto_154941 ) ( ON ?auto_154942 ?auto_154940 ) ( ON ?auto_154944 ?auto_154942 ) ( CLEAR ?auto_154944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_154938 ?auto_154945 ?auto_154943 ?auto_154946 ?auto_154939 ?auto_154941 ?auto_154940 ?auto_154942 )
      ( MAKE-1PILE ?auto_154938 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_154955 - BLOCK
      ?auto_154956 - BLOCK
      ?auto_154957 - BLOCK
      ?auto_154958 - BLOCK
      ?auto_154959 - BLOCK
      ?auto_154960 - BLOCK
      ?auto_154961 - BLOCK
      ?auto_154962 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_154962 ) ( CLEAR ?auto_154961 ) ( ON-TABLE ?auto_154955 ) ( ON ?auto_154956 ?auto_154955 ) ( ON ?auto_154957 ?auto_154956 ) ( ON ?auto_154958 ?auto_154957 ) ( ON ?auto_154959 ?auto_154958 ) ( ON ?auto_154960 ?auto_154959 ) ( ON ?auto_154961 ?auto_154960 ) ( not ( = ?auto_154955 ?auto_154956 ) ) ( not ( = ?auto_154955 ?auto_154957 ) ) ( not ( = ?auto_154955 ?auto_154958 ) ) ( not ( = ?auto_154955 ?auto_154959 ) ) ( not ( = ?auto_154955 ?auto_154960 ) ) ( not ( = ?auto_154955 ?auto_154961 ) ) ( not ( = ?auto_154955 ?auto_154962 ) ) ( not ( = ?auto_154956 ?auto_154957 ) ) ( not ( = ?auto_154956 ?auto_154958 ) ) ( not ( = ?auto_154956 ?auto_154959 ) ) ( not ( = ?auto_154956 ?auto_154960 ) ) ( not ( = ?auto_154956 ?auto_154961 ) ) ( not ( = ?auto_154956 ?auto_154962 ) ) ( not ( = ?auto_154957 ?auto_154958 ) ) ( not ( = ?auto_154957 ?auto_154959 ) ) ( not ( = ?auto_154957 ?auto_154960 ) ) ( not ( = ?auto_154957 ?auto_154961 ) ) ( not ( = ?auto_154957 ?auto_154962 ) ) ( not ( = ?auto_154958 ?auto_154959 ) ) ( not ( = ?auto_154958 ?auto_154960 ) ) ( not ( = ?auto_154958 ?auto_154961 ) ) ( not ( = ?auto_154958 ?auto_154962 ) ) ( not ( = ?auto_154959 ?auto_154960 ) ) ( not ( = ?auto_154959 ?auto_154961 ) ) ( not ( = ?auto_154959 ?auto_154962 ) ) ( not ( = ?auto_154960 ?auto_154961 ) ) ( not ( = ?auto_154960 ?auto_154962 ) ) ( not ( = ?auto_154961 ?auto_154962 ) ) )
    :subtasks
    ( ( !STACK ?auto_154962 ?auto_154961 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_154963 - BLOCK
      ?auto_154964 - BLOCK
      ?auto_154965 - BLOCK
      ?auto_154966 - BLOCK
      ?auto_154967 - BLOCK
      ?auto_154968 - BLOCK
      ?auto_154969 - BLOCK
      ?auto_154970 - BLOCK
    )
    :vars
    (
      ?auto_154971 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_154969 ) ( ON-TABLE ?auto_154963 ) ( ON ?auto_154964 ?auto_154963 ) ( ON ?auto_154965 ?auto_154964 ) ( ON ?auto_154966 ?auto_154965 ) ( ON ?auto_154967 ?auto_154966 ) ( ON ?auto_154968 ?auto_154967 ) ( ON ?auto_154969 ?auto_154968 ) ( not ( = ?auto_154963 ?auto_154964 ) ) ( not ( = ?auto_154963 ?auto_154965 ) ) ( not ( = ?auto_154963 ?auto_154966 ) ) ( not ( = ?auto_154963 ?auto_154967 ) ) ( not ( = ?auto_154963 ?auto_154968 ) ) ( not ( = ?auto_154963 ?auto_154969 ) ) ( not ( = ?auto_154963 ?auto_154970 ) ) ( not ( = ?auto_154964 ?auto_154965 ) ) ( not ( = ?auto_154964 ?auto_154966 ) ) ( not ( = ?auto_154964 ?auto_154967 ) ) ( not ( = ?auto_154964 ?auto_154968 ) ) ( not ( = ?auto_154964 ?auto_154969 ) ) ( not ( = ?auto_154964 ?auto_154970 ) ) ( not ( = ?auto_154965 ?auto_154966 ) ) ( not ( = ?auto_154965 ?auto_154967 ) ) ( not ( = ?auto_154965 ?auto_154968 ) ) ( not ( = ?auto_154965 ?auto_154969 ) ) ( not ( = ?auto_154965 ?auto_154970 ) ) ( not ( = ?auto_154966 ?auto_154967 ) ) ( not ( = ?auto_154966 ?auto_154968 ) ) ( not ( = ?auto_154966 ?auto_154969 ) ) ( not ( = ?auto_154966 ?auto_154970 ) ) ( not ( = ?auto_154967 ?auto_154968 ) ) ( not ( = ?auto_154967 ?auto_154969 ) ) ( not ( = ?auto_154967 ?auto_154970 ) ) ( not ( = ?auto_154968 ?auto_154969 ) ) ( not ( = ?auto_154968 ?auto_154970 ) ) ( not ( = ?auto_154969 ?auto_154970 ) ) ( ON ?auto_154970 ?auto_154971 ) ( CLEAR ?auto_154970 ) ( HAND-EMPTY ) ( not ( = ?auto_154963 ?auto_154971 ) ) ( not ( = ?auto_154964 ?auto_154971 ) ) ( not ( = ?auto_154965 ?auto_154971 ) ) ( not ( = ?auto_154966 ?auto_154971 ) ) ( not ( = ?auto_154967 ?auto_154971 ) ) ( not ( = ?auto_154968 ?auto_154971 ) ) ( not ( = ?auto_154969 ?auto_154971 ) ) ( not ( = ?auto_154970 ?auto_154971 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_154970 ?auto_154971 )
      ( MAKE-8PILE ?auto_154963 ?auto_154964 ?auto_154965 ?auto_154966 ?auto_154967 ?auto_154968 ?auto_154969 ?auto_154970 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_154972 - BLOCK
      ?auto_154973 - BLOCK
      ?auto_154974 - BLOCK
      ?auto_154975 - BLOCK
      ?auto_154976 - BLOCK
      ?auto_154977 - BLOCK
      ?auto_154978 - BLOCK
      ?auto_154979 - BLOCK
    )
    :vars
    (
      ?auto_154980 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154972 ) ( ON ?auto_154973 ?auto_154972 ) ( ON ?auto_154974 ?auto_154973 ) ( ON ?auto_154975 ?auto_154974 ) ( ON ?auto_154976 ?auto_154975 ) ( ON ?auto_154977 ?auto_154976 ) ( not ( = ?auto_154972 ?auto_154973 ) ) ( not ( = ?auto_154972 ?auto_154974 ) ) ( not ( = ?auto_154972 ?auto_154975 ) ) ( not ( = ?auto_154972 ?auto_154976 ) ) ( not ( = ?auto_154972 ?auto_154977 ) ) ( not ( = ?auto_154972 ?auto_154978 ) ) ( not ( = ?auto_154972 ?auto_154979 ) ) ( not ( = ?auto_154973 ?auto_154974 ) ) ( not ( = ?auto_154973 ?auto_154975 ) ) ( not ( = ?auto_154973 ?auto_154976 ) ) ( not ( = ?auto_154973 ?auto_154977 ) ) ( not ( = ?auto_154973 ?auto_154978 ) ) ( not ( = ?auto_154973 ?auto_154979 ) ) ( not ( = ?auto_154974 ?auto_154975 ) ) ( not ( = ?auto_154974 ?auto_154976 ) ) ( not ( = ?auto_154974 ?auto_154977 ) ) ( not ( = ?auto_154974 ?auto_154978 ) ) ( not ( = ?auto_154974 ?auto_154979 ) ) ( not ( = ?auto_154975 ?auto_154976 ) ) ( not ( = ?auto_154975 ?auto_154977 ) ) ( not ( = ?auto_154975 ?auto_154978 ) ) ( not ( = ?auto_154975 ?auto_154979 ) ) ( not ( = ?auto_154976 ?auto_154977 ) ) ( not ( = ?auto_154976 ?auto_154978 ) ) ( not ( = ?auto_154976 ?auto_154979 ) ) ( not ( = ?auto_154977 ?auto_154978 ) ) ( not ( = ?auto_154977 ?auto_154979 ) ) ( not ( = ?auto_154978 ?auto_154979 ) ) ( ON ?auto_154979 ?auto_154980 ) ( CLEAR ?auto_154979 ) ( not ( = ?auto_154972 ?auto_154980 ) ) ( not ( = ?auto_154973 ?auto_154980 ) ) ( not ( = ?auto_154974 ?auto_154980 ) ) ( not ( = ?auto_154975 ?auto_154980 ) ) ( not ( = ?auto_154976 ?auto_154980 ) ) ( not ( = ?auto_154977 ?auto_154980 ) ) ( not ( = ?auto_154978 ?auto_154980 ) ) ( not ( = ?auto_154979 ?auto_154980 ) ) ( HOLDING ?auto_154978 ) ( CLEAR ?auto_154977 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_154972 ?auto_154973 ?auto_154974 ?auto_154975 ?auto_154976 ?auto_154977 ?auto_154978 )
      ( MAKE-8PILE ?auto_154972 ?auto_154973 ?auto_154974 ?auto_154975 ?auto_154976 ?auto_154977 ?auto_154978 ?auto_154979 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_154981 - BLOCK
      ?auto_154982 - BLOCK
      ?auto_154983 - BLOCK
      ?auto_154984 - BLOCK
      ?auto_154985 - BLOCK
      ?auto_154986 - BLOCK
      ?auto_154987 - BLOCK
      ?auto_154988 - BLOCK
    )
    :vars
    (
      ?auto_154989 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154981 ) ( ON ?auto_154982 ?auto_154981 ) ( ON ?auto_154983 ?auto_154982 ) ( ON ?auto_154984 ?auto_154983 ) ( ON ?auto_154985 ?auto_154984 ) ( ON ?auto_154986 ?auto_154985 ) ( not ( = ?auto_154981 ?auto_154982 ) ) ( not ( = ?auto_154981 ?auto_154983 ) ) ( not ( = ?auto_154981 ?auto_154984 ) ) ( not ( = ?auto_154981 ?auto_154985 ) ) ( not ( = ?auto_154981 ?auto_154986 ) ) ( not ( = ?auto_154981 ?auto_154987 ) ) ( not ( = ?auto_154981 ?auto_154988 ) ) ( not ( = ?auto_154982 ?auto_154983 ) ) ( not ( = ?auto_154982 ?auto_154984 ) ) ( not ( = ?auto_154982 ?auto_154985 ) ) ( not ( = ?auto_154982 ?auto_154986 ) ) ( not ( = ?auto_154982 ?auto_154987 ) ) ( not ( = ?auto_154982 ?auto_154988 ) ) ( not ( = ?auto_154983 ?auto_154984 ) ) ( not ( = ?auto_154983 ?auto_154985 ) ) ( not ( = ?auto_154983 ?auto_154986 ) ) ( not ( = ?auto_154983 ?auto_154987 ) ) ( not ( = ?auto_154983 ?auto_154988 ) ) ( not ( = ?auto_154984 ?auto_154985 ) ) ( not ( = ?auto_154984 ?auto_154986 ) ) ( not ( = ?auto_154984 ?auto_154987 ) ) ( not ( = ?auto_154984 ?auto_154988 ) ) ( not ( = ?auto_154985 ?auto_154986 ) ) ( not ( = ?auto_154985 ?auto_154987 ) ) ( not ( = ?auto_154985 ?auto_154988 ) ) ( not ( = ?auto_154986 ?auto_154987 ) ) ( not ( = ?auto_154986 ?auto_154988 ) ) ( not ( = ?auto_154987 ?auto_154988 ) ) ( ON ?auto_154988 ?auto_154989 ) ( not ( = ?auto_154981 ?auto_154989 ) ) ( not ( = ?auto_154982 ?auto_154989 ) ) ( not ( = ?auto_154983 ?auto_154989 ) ) ( not ( = ?auto_154984 ?auto_154989 ) ) ( not ( = ?auto_154985 ?auto_154989 ) ) ( not ( = ?auto_154986 ?auto_154989 ) ) ( not ( = ?auto_154987 ?auto_154989 ) ) ( not ( = ?auto_154988 ?auto_154989 ) ) ( CLEAR ?auto_154986 ) ( ON ?auto_154987 ?auto_154988 ) ( CLEAR ?auto_154987 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_154989 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_154989 ?auto_154988 )
      ( MAKE-8PILE ?auto_154981 ?auto_154982 ?auto_154983 ?auto_154984 ?auto_154985 ?auto_154986 ?auto_154987 ?auto_154988 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_154990 - BLOCK
      ?auto_154991 - BLOCK
      ?auto_154992 - BLOCK
      ?auto_154993 - BLOCK
      ?auto_154994 - BLOCK
      ?auto_154995 - BLOCK
      ?auto_154996 - BLOCK
      ?auto_154997 - BLOCK
    )
    :vars
    (
      ?auto_154998 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154990 ) ( ON ?auto_154991 ?auto_154990 ) ( ON ?auto_154992 ?auto_154991 ) ( ON ?auto_154993 ?auto_154992 ) ( ON ?auto_154994 ?auto_154993 ) ( not ( = ?auto_154990 ?auto_154991 ) ) ( not ( = ?auto_154990 ?auto_154992 ) ) ( not ( = ?auto_154990 ?auto_154993 ) ) ( not ( = ?auto_154990 ?auto_154994 ) ) ( not ( = ?auto_154990 ?auto_154995 ) ) ( not ( = ?auto_154990 ?auto_154996 ) ) ( not ( = ?auto_154990 ?auto_154997 ) ) ( not ( = ?auto_154991 ?auto_154992 ) ) ( not ( = ?auto_154991 ?auto_154993 ) ) ( not ( = ?auto_154991 ?auto_154994 ) ) ( not ( = ?auto_154991 ?auto_154995 ) ) ( not ( = ?auto_154991 ?auto_154996 ) ) ( not ( = ?auto_154991 ?auto_154997 ) ) ( not ( = ?auto_154992 ?auto_154993 ) ) ( not ( = ?auto_154992 ?auto_154994 ) ) ( not ( = ?auto_154992 ?auto_154995 ) ) ( not ( = ?auto_154992 ?auto_154996 ) ) ( not ( = ?auto_154992 ?auto_154997 ) ) ( not ( = ?auto_154993 ?auto_154994 ) ) ( not ( = ?auto_154993 ?auto_154995 ) ) ( not ( = ?auto_154993 ?auto_154996 ) ) ( not ( = ?auto_154993 ?auto_154997 ) ) ( not ( = ?auto_154994 ?auto_154995 ) ) ( not ( = ?auto_154994 ?auto_154996 ) ) ( not ( = ?auto_154994 ?auto_154997 ) ) ( not ( = ?auto_154995 ?auto_154996 ) ) ( not ( = ?auto_154995 ?auto_154997 ) ) ( not ( = ?auto_154996 ?auto_154997 ) ) ( ON ?auto_154997 ?auto_154998 ) ( not ( = ?auto_154990 ?auto_154998 ) ) ( not ( = ?auto_154991 ?auto_154998 ) ) ( not ( = ?auto_154992 ?auto_154998 ) ) ( not ( = ?auto_154993 ?auto_154998 ) ) ( not ( = ?auto_154994 ?auto_154998 ) ) ( not ( = ?auto_154995 ?auto_154998 ) ) ( not ( = ?auto_154996 ?auto_154998 ) ) ( not ( = ?auto_154997 ?auto_154998 ) ) ( ON ?auto_154996 ?auto_154997 ) ( CLEAR ?auto_154996 ) ( ON-TABLE ?auto_154998 ) ( HOLDING ?auto_154995 ) ( CLEAR ?auto_154994 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_154990 ?auto_154991 ?auto_154992 ?auto_154993 ?auto_154994 ?auto_154995 )
      ( MAKE-8PILE ?auto_154990 ?auto_154991 ?auto_154992 ?auto_154993 ?auto_154994 ?auto_154995 ?auto_154996 ?auto_154997 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_154999 - BLOCK
      ?auto_155000 - BLOCK
      ?auto_155001 - BLOCK
      ?auto_155002 - BLOCK
      ?auto_155003 - BLOCK
      ?auto_155004 - BLOCK
      ?auto_155005 - BLOCK
      ?auto_155006 - BLOCK
    )
    :vars
    (
      ?auto_155007 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154999 ) ( ON ?auto_155000 ?auto_154999 ) ( ON ?auto_155001 ?auto_155000 ) ( ON ?auto_155002 ?auto_155001 ) ( ON ?auto_155003 ?auto_155002 ) ( not ( = ?auto_154999 ?auto_155000 ) ) ( not ( = ?auto_154999 ?auto_155001 ) ) ( not ( = ?auto_154999 ?auto_155002 ) ) ( not ( = ?auto_154999 ?auto_155003 ) ) ( not ( = ?auto_154999 ?auto_155004 ) ) ( not ( = ?auto_154999 ?auto_155005 ) ) ( not ( = ?auto_154999 ?auto_155006 ) ) ( not ( = ?auto_155000 ?auto_155001 ) ) ( not ( = ?auto_155000 ?auto_155002 ) ) ( not ( = ?auto_155000 ?auto_155003 ) ) ( not ( = ?auto_155000 ?auto_155004 ) ) ( not ( = ?auto_155000 ?auto_155005 ) ) ( not ( = ?auto_155000 ?auto_155006 ) ) ( not ( = ?auto_155001 ?auto_155002 ) ) ( not ( = ?auto_155001 ?auto_155003 ) ) ( not ( = ?auto_155001 ?auto_155004 ) ) ( not ( = ?auto_155001 ?auto_155005 ) ) ( not ( = ?auto_155001 ?auto_155006 ) ) ( not ( = ?auto_155002 ?auto_155003 ) ) ( not ( = ?auto_155002 ?auto_155004 ) ) ( not ( = ?auto_155002 ?auto_155005 ) ) ( not ( = ?auto_155002 ?auto_155006 ) ) ( not ( = ?auto_155003 ?auto_155004 ) ) ( not ( = ?auto_155003 ?auto_155005 ) ) ( not ( = ?auto_155003 ?auto_155006 ) ) ( not ( = ?auto_155004 ?auto_155005 ) ) ( not ( = ?auto_155004 ?auto_155006 ) ) ( not ( = ?auto_155005 ?auto_155006 ) ) ( ON ?auto_155006 ?auto_155007 ) ( not ( = ?auto_154999 ?auto_155007 ) ) ( not ( = ?auto_155000 ?auto_155007 ) ) ( not ( = ?auto_155001 ?auto_155007 ) ) ( not ( = ?auto_155002 ?auto_155007 ) ) ( not ( = ?auto_155003 ?auto_155007 ) ) ( not ( = ?auto_155004 ?auto_155007 ) ) ( not ( = ?auto_155005 ?auto_155007 ) ) ( not ( = ?auto_155006 ?auto_155007 ) ) ( ON ?auto_155005 ?auto_155006 ) ( ON-TABLE ?auto_155007 ) ( CLEAR ?auto_155003 ) ( ON ?auto_155004 ?auto_155005 ) ( CLEAR ?auto_155004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_155007 ?auto_155006 ?auto_155005 )
      ( MAKE-8PILE ?auto_154999 ?auto_155000 ?auto_155001 ?auto_155002 ?auto_155003 ?auto_155004 ?auto_155005 ?auto_155006 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_155008 - BLOCK
      ?auto_155009 - BLOCK
      ?auto_155010 - BLOCK
      ?auto_155011 - BLOCK
      ?auto_155012 - BLOCK
      ?auto_155013 - BLOCK
      ?auto_155014 - BLOCK
      ?auto_155015 - BLOCK
    )
    :vars
    (
      ?auto_155016 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155008 ) ( ON ?auto_155009 ?auto_155008 ) ( ON ?auto_155010 ?auto_155009 ) ( ON ?auto_155011 ?auto_155010 ) ( not ( = ?auto_155008 ?auto_155009 ) ) ( not ( = ?auto_155008 ?auto_155010 ) ) ( not ( = ?auto_155008 ?auto_155011 ) ) ( not ( = ?auto_155008 ?auto_155012 ) ) ( not ( = ?auto_155008 ?auto_155013 ) ) ( not ( = ?auto_155008 ?auto_155014 ) ) ( not ( = ?auto_155008 ?auto_155015 ) ) ( not ( = ?auto_155009 ?auto_155010 ) ) ( not ( = ?auto_155009 ?auto_155011 ) ) ( not ( = ?auto_155009 ?auto_155012 ) ) ( not ( = ?auto_155009 ?auto_155013 ) ) ( not ( = ?auto_155009 ?auto_155014 ) ) ( not ( = ?auto_155009 ?auto_155015 ) ) ( not ( = ?auto_155010 ?auto_155011 ) ) ( not ( = ?auto_155010 ?auto_155012 ) ) ( not ( = ?auto_155010 ?auto_155013 ) ) ( not ( = ?auto_155010 ?auto_155014 ) ) ( not ( = ?auto_155010 ?auto_155015 ) ) ( not ( = ?auto_155011 ?auto_155012 ) ) ( not ( = ?auto_155011 ?auto_155013 ) ) ( not ( = ?auto_155011 ?auto_155014 ) ) ( not ( = ?auto_155011 ?auto_155015 ) ) ( not ( = ?auto_155012 ?auto_155013 ) ) ( not ( = ?auto_155012 ?auto_155014 ) ) ( not ( = ?auto_155012 ?auto_155015 ) ) ( not ( = ?auto_155013 ?auto_155014 ) ) ( not ( = ?auto_155013 ?auto_155015 ) ) ( not ( = ?auto_155014 ?auto_155015 ) ) ( ON ?auto_155015 ?auto_155016 ) ( not ( = ?auto_155008 ?auto_155016 ) ) ( not ( = ?auto_155009 ?auto_155016 ) ) ( not ( = ?auto_155010 ?auto_155016 ) ) ( not ( = ?auto_155011 ?auto_155016 ) ) ( not ( = ?auto_155012 ?auto_155016 ) ) ( not ( = ?auto_155013 ?auto_155016 ) ) ( not ( = ?auto_155014 ?auto_155016 ) ) ( not ( = ?auto_155015 ?auto_155016 ) ) ( ON ?auto_155014 ?auto_155015 ) ( ON-TABLE ?auto_155016 ) ( ON ?auto_155013 ?auto_155014 ) ( CLEAR ?auto_155013 ) ( HOLDING ?auto_155012 ) ( CLEAR ?auto_155011 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_155008 ?auto_155009 ?auto_155010 ?auto_155011 ?auto_155012 )
      ( MAKE-8PILE ?auto_155008 ?auto_155009 ?auto_155010 ?auto_155011 ?auto_155012 ?auto_155013 ?auto_155014 ?auto_155015 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_155017 - BLOCK
      ?auto_155018 - BLOCK
      ?auto_155019 - BLOCK
      ?auto_155020 - BLOCK
      ?auto_155021 - BLOCK
      ?auto_155022 - BLOCK
      ?auto_155023 - BLOCK
      ?auto_155024 - BLOCK
    )
    :vars
    (
      ?auto_155025 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155017 ) ( ON ?auto_155018 ?auto_155017 ) ( ON ?auto_155019 ?auto_155018 ) ( ON ?auto_155020 ?auto_155019 ) ( not ( = ?auto_155017 ?auto_155018 ) ) ( not ( = ?auto_155017 ?auto_155019 ) ) ( not ( = ?auto_155017 ?auto_155020 ) ) ( not ( = ?auto_155017 ?auto_155021 ) ) ( not ( = ?auto_155017 ?auto_155022 ) ) ( not ( = ?auto_155017 ?auto_155023 ) ) ( not ( = ?auto_155017 ?auto_155024 ) ) ( not ( = ?auto_155018 ?auto_155019 ) ) ( not ( = ?auto_155018 ?auto_155020 ) ) ( not ( = ?auto_155018 ?auto_155021 ) ) ( not ( = ?auto_155018 ?auto_155022 ) ) ( not ( = ?auto_155018 ?auto_155023 ) ) ( not ( = ?auto_155018 ?auto_155024 ) ) ( not ( = ?auto_155019 ?auto_155020 ) ) ( not ( = ?auto_155019 ?auto_155021 ) ) ( not ( = ?auto_155019 ?auto_155022 ) ) ( not ( = ?auto_155019 ?auto_155023 ) ) ( not ( = ?auto_155019 ?auto_155024 ) ) ( not ( = ?auto_155020 ?auto_155021 ) ) ( not ( = ?auto_155020 ?auto_155022 ) ) ( not ( = ?auto_155020 ?auto_155023 ) ) ( not ( = ?auto_155020 ?auto_155024 ) ) ( not ( = ?auto_155021 ?auto_155022 ) ) ( not ( = ?auto_155021 ?auto_155023 ) ) ( not ( = ?auto_155021 ?auto_155024 ) ) ( not ( = ?auto_155022 ?auto_155023 ) ) ( not ( = ?auto_155022 ?auto_155024 ) ) ( not ( = ?auto_155023 ?auto_155024 ) ) ( ON ?auto_155024 ?auto_155025 ) ( not ( = ?auto_155017 ?auto_155025 ) ) ( not ( = ?auto_155018 ?auto_155025 ) ) ( not ( = ?auto_155019 ?auto_155025 ) ) ( not ( = ?auto_155020 ?auto_155025 ) ) ( not ( = ?auto_155021 ?auto_155025 ) ) ( not ( = ?auto_155022 ?auto_155025 ) ) ( not ( = ?auto_155023 ?auto_155025 ) ) ( not ( = ?auto_155024 ?auto_155025 ) ) ( ON ?auto_155023 ?auto_155024 ) ( ON-TABLE ?auto_155025 ) ( ON ?auto_155022 ?auto_155023 ) ( CLEAR ?auto_155020 ) ( ON ?auto_155021 ?auto_155022 ) ( CLEAR ?auto_155021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_155025 ?auto_155024 ?auto_155023 ?auto_155022 )
      ( MAKE-8PILE ?auto_155017 ?auto_155018 ?auto_155019 ?auto_155020 ?auto_155021 ?auto_155022 ?auto_155023 ?auto_155024 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_155026 - BLOCK
      ?auto_155027 - BLOCK
      ?auto_155028 - BLOCK
      ?auto_155029 - BLOCK
      ?auto_155030 - BLOCK
      ?auto_155031 - BLOCK
      ?auto_155032 - BLOCK
      ?auto_155033 - BLOCK
    )
    :vars
    (
      ?auto_155034 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155026 ) ( ON ?auto_155027 ?auto_155026 ) ( ON ?auto_155028 ?auto_155027 ) ( not ( = ?auto_155026 ?auto_155027 ) ) ( not ( = ?auto_155026 ?auto_155028 ) ) ( not ( = ?auto_155026 ?auto_155029 ) ) ( not ( = ?auto_155026 ?auto_155030 ) ) ( not ( = ?auto_155026 ?auto_155031 ) ) ( not ( = ?auto_155026 ?auto_155032 ) ) ( not ( = ?auto_155026 ?auto_155033 ) ) ( not ( = ?auto_155027 ?auto_155028 ) ) ( not ( = ?auto_155027 ?auto_155029 ) ) ( not ( = ?auto_155027 ?auto_155030 ) ) ( not ( = ?auto_155027 ?auto_155031 ) ) ( not ( = ?auto_155027 ?auto_155032 ) ) ( not ( = ?auto_155027 ?auto_155033 ) ) ( not ( = ?auto_155028 ?auto_155029 ) ) ( not ( = ?auto_155028 ?auto_155030 ) ) ( not ( = ?auto_155028 ?auto_155031 ) ) ( not ( = ?auto_155028 ?auto_155032 ) ) ( not ( = ?auto_155028 ?auto_155033 ) ) ( not ( = ?auto_155029 ?auto_155030 ) ) ( not ( = ?auto_155029 ?auto_155031 ) ) ( not ( = ?auto_155029 ?auto_155032 ) ) ( not ( = ?auto_155029 ?auto_155033 ) ) ( not ( = ?auto_155030 ?auto_155031 ) ) ( not ( = ?auto_155030 ?auto_155032 ) ) ( not ( = ?auto_155030 ?auto_155033 ) ) ( not ( = ?auto_155031 ?auto_155032 ) ) ( not ( = ?auto_155031 ?auto_155033 ) ) ( not ( = ?auto_155032 ?auto_155033 ) ) ( ON ?auto_155033 ?auto_155034 ) ( not ( = ?auto_155026 ?auto_155034 ) ) ( not ( = ?auto_155027 ?auto_155034 ) ) ( not ( = ?auto_155028 ?auto_155034 ) ) ( not ( = ?auto_155029 ?auto_155034 ) ) ( not ( = ?auto_155030 ?auto_155034 ) ) ( not ( = ?auto_155031 ?auto_155034 ) ) ( not ( = ?auto_155032 ?auto_155034 ) ) ( not ( = ?auto_155033 ?auto_155034 ) ) ( ON ?auto_155032 ?auto_155033 ) ( ON-TABLE ?auto_155034 ) ( ON ?auto_155031 ?auto_155032 ) ( ON ?auto_155030 ?auto_155031 ) ( CLEAR ?auto_155030 ) ( HOLDING ?auto_155029 ) ( CLEAR ?auto_155028 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_155026 ?auto_155027 ?auto_155028 ?auto_155029 )
      ( MAKE-8PILE ?auto_155026 ?auto_155027 ?auto_155028 ?auto_155029 ?auto_155030 ?auto_155031 ?auto_155032 ?auto_155033 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_155035 - BLOCK
      ?auto_155036 - BLOCK
      ?auto_155037 - BLOCK
      ?auto_155038 - BLOCK
      ?auto_155039 - BLOCK
      ?auto_155040 - BLOCK
      ?auto_155041 - BLOCK
      ?auto_155042 - BLOCK
    )
    :vars
    (
      ?auto_155043 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155035 ) ( ON ?auto_155036 ?auto_155035 ) ( ON ?auto_155037 ?auto_155036 ) ( not ( = ?auto_155035 ?auto_155036 ) ) ( not ( = ?auto_155035 ?auto_155037 ) ) ( not ( = ?auto_155035 ?auto_155038 ) ) ( not ( = ?auto_155035 ?auto_155039 ) ) ( not ( = ?auto_155035 ?auto_155040 ) ) ( not ( = ?auto_155035 ?auto_155041 ) ) ( not ( = ?auto_155035 ?auto_155042 ) ) ( not ( = ?auto_155036 ?auto_155037 ) ) ( not ( = ?auto_155036 ?auto_155038 ) ) ( not ( = ?auto_155036 ?auto_155039 ) ) ( not ( = ?auto_155036 ?auto_155040 ) ) ( not ( = ?auto_155036 ?auto_155041 ) ) ( not ( = ?auto_155036 ?auto_155042 ) ) ( not ( = ?auto_155037 ?auto_155038 ) ) ( not ( = ?auto_155037 ?auto_155039 ) ) ( not ( = ?auto_155037 ?auto_155040 ) ) ( not ( = ?auto_155037 ?auto_155041 ) ) ( not ( = ?auto_155037 ?auto_155042 ) ) ( not ( = ?auto_155038 ?auto_155039 ) ) ( not ( = ?auto_155038 ?auto_155040 ) ) ( not ( = ?auto_155038 ?auto_155041 ) ) ( not ( = ?auto_155038 ?auto_155042 ) ) ( not ( = ?auto_155039 ?auto_155040 ) ) ( not ( = ?auto_155039 ?auto_155041 ) ) ( not ( = ?auto_155039 ?auto_155042 ) ) ( not ( = ?auto_155040 ?auto_155041 ) ) ( not ( = ?auto_155040 ?auto_155042 ) ) ( not ( = ?auto_155041 ?auto_155042 ) ) ( ON ?auto_155042 ?auto_155043 ) ( not ( = ?auto_155035 ?auto_155043 ) ) ( not ( = ?auto_155036 ?auto_155043 ) ) ( not ( = ?auto_155037 ?auto_155043 ) ) ( not ( = ?auto_155038 ?auto_155043 ) ) ( not ( = ?auto_155039 ?auto_155043 ) ) ( not ( = ?auto_155040 ?auto_155043 ) ) ( not ( = ?auto_155041 ?auto_155043 ) ) ( not ( = ?auto_155042 ?auto_155043 ) ) ( ON ?auto_155041 ?auto_155042 ) ( ON-TABLE ?auto_155043 ) ( ON ?auto_155040 ?auto_155041 ) ( ON ?auto_155039 ?auto_155040 ) ( CLEAR ?auto_155037 ) ( ON ?auto_155038 ?auto_155039 ) ( CLEAR ?auto_155038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_155043 ?auto_155042 ?auto_155041 ?auto_155040 ?auto_155039 )
      ( MAKE-8PILE ?auto_155035 ?auto_155036 ?auto_155037 ?auto_155038 ?auto_155039 ?auto_155040 ?auto_155041 ?auto_155042 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_155044 - BLOCK
      ?auto_155045 - BLOCK
      ?auto_155046 - BLOCK
      ?auto_155047 - BLOCK
      ?auto_155048 - BLOCK
      ?auto_155049 - BLOCK
      ?auto_155050 - BLOCK
      ?auto_155051 - BLOCK
    )
    :vars
    (
      ?auto_155052 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155044 ) ( ON ?auto_155045 ?auto_155044 ) ( not ( = ?auto_155044 ?auto_155045 ) ) ( not ( = ?auto_155044 ?auto_155046 ) ) ( not ( = ?auto_155044 ?auto_155047 ) ) ( not ( = ?auto_155044 ?auto_155048 ) ) ( not ( = ?auto_155044 ?auto_155049 ) ) ( not ( = ?auto_155044 ?auto_155050 ) ) ( not ( = ?auto_155044 ?auto_155051 ) ) ( not ( = ?auto_155045 ?auto_155046 ) ) ( not ( = ?auto_155045 ?auto_155047 ) ) ( not ( = ?auto_155045 ?auto_155048 ) ) ( not ( = ?auto_155045 ?auto_155049 ) ) ( not ( = ?auto_155045 ?auto_155050 ) ) ( not ( = ?auto_155045 ?auto_155051 ) ) ( not ( = ?auto_155046 ?auto_155047 ) ) ( not ( = ?auto_155046 ?auto_155048 ) ) ( not ( = ?auto_155046 ?auto_155049 ) ) ( not ( = ?auto_155046 ?auto_155050 ) ) ( not ( = ?auto_155046 ?auto_155051 ) ) ( not ( = ?auto_155047 ?auto_155048 ) ) ( not ( = ?auto_155047 ?auto_155049 ) ) ( not ( = ?auto_155047 ?auto_155050 ) ) ( not ( = ?auto_155047 ?auto_155051 ) ) ( not ( = ?auto_155048 ?auto_155049 ) ) ( not ( = ?auto_155048 ?auto_155050 ) ) ( not ( = ?auto_155048 ?auto_155051 ) ) ( not ( = ?auto_155049 ?auto_155050 ) ) ( not ( = ?auto_155049 ?auto_155051 ) ) ( not ( = ?auto_155050 ?auto_155051 ) ) ( ON ?auto_155051 ?auto_155052 ) ( not ( = ?auto_155044 ?auto_155052 ) ) ( not ( = ?auto_155045 ?auto_155052 ) ) ( not ( = ?auto_155046 ?auto_155052 ) ) ( not ( = ?auto_155047 ?auto_155052 ) ) ( not ( = ?auto_155048 ?auto_155052 ) ) ( not ( = ?auto_155049 ?auto_155052 ) ) ( not ( = ?auto_155050 ?auto_155052 ) ) ( not ( = ?auto_155051 ?auto_155052 ) ) ( ON ?auto_155050 ?auto_155051 ) ( ON-TABLE ?auto_155052 ) ( ON ?auto_155049 ?auto_155050 ) ( ON ?auto_155048 ?auto_155049 ) ( ON ?auto_155047 ?auto_155048 ) ( CLEAR ?auto_155047 ) ( HOLDING ?auto_155046 ) ( CLEAR ?auto_155045 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_155044 ?auto_155045 ?auto_155046 )
      ( MAKE-8PILE ?auto_155044 ?auto_155045 ?auto_155046 ?auto_155047 ?auto_155048 ?auto_155049 ?auto_155050 ?auto_155051 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_155053 - BLOCK
      ?auto_155054 - BLOCK
      ?auto_155055 - BLOCK
      ?auto_155056 - BLOCK
      ?auto_155057 - BLOCK
      ?auto_155058 - BLOCK
      ?auto_155059 - BLOCK
      ?auto_155060 - BLOCK
    )
    :vars
    (
      ?auto_155061 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155053 ) ( ON ?auto_155054 ?auto_155053 ) ( not ( = ?auto_155053 ?auto_155054 ) ) ( not ( = ?auto_155053 ?auto_155055 ) ) ( not ( = ?auto_155053 ?auto_155056 ) ) ( not ( = ?auto_155053 ?auto_155057 ) ) ( not ( = ?auto_155053 ?auto_155058 ) ) ( not ( = ?auto_155053 ?auto_155059 ) ) ( not ( = ?auto_155053 ?auto_155060 ) ) ( not ( = ?auto_155054 ?auto_155055 ) ) ( not ( = ?auto_155054 ?auto_155056 ) ) ( not ( = ?auto_155054 ?auto_155057 ) ) ( not ( = ?auto_155054 ?auto_155058 ) ) ( not ( = ?auto_155054 ?auto_155059 ) ) ( not ( = ?auto_155054 ?auto_155060 ) ) ( not ( = ?auto_155055 ?auto_155056 ) ) ( not ( = ?auto_155055 ?auto_155057 ) ) ( not ( = ?auto_155055 ?auto_155058 ) ) ( not ( = ?auto_155055 ?auto_155059 ) ) ( not ( = ?auto_155055 ?auto_155060 ) ) ( not ( = ?auto_155056 ?auto_155057 ) ) ( not ( = ?auto_155056 ?auto_155058 ) ) ( not ( = ?auto_155056 ?auto_155059 ) ) ( not ( = ?auto_155056 ?auto_155060 ) ) ( not ( = ?auto_155057 ?auto_155058 ) ) ( not ( = ?auto_155057 ?auto_155059 ) ) ( not ( = ?auto_155057 ?auto_155060 ) ) ( not ( = ?auto_155058 ?auto_155059 ) ) ( not ( = ?auto_155058 ?auto_155060 ) ) ( not ( = ?auto_155059 ?auto_155060 ) ) ( ON ?auto_155060 ?auto_155061 ) ( not ( = ?auto_155053 ?auto_155061 ) ) ( not ( = ?auto_155054 ?auto_155061 ) ) ( not ( = ?auto_155055 ?auto_155061 ) ) ( not ( = ?auto_155056 ?auto_155061 ) ) ( not ( = ?auto_155057 ?auto_155061 ) ) ( not ( = ?auto_155058 ?auto_155061 ) ) ( not ( = ?auto_155059 ?auto_155061 ) ) ( not ( = ?auto_155060 ?auto_155061 ) ) ( ON ?auto_155059 ?auto_155060 ) ( ON-TABLE ?auto_155061 ) ( ON ?auto_155058 ?auto_155059 ) ( ON ?auto_155057 ?auto_155058 ) ( ON ?auto_155056 ?auto_155057 ) ( CLEAR ?auto_155054 ) ( ON ?auto_155055 ?auto_155056 ) ( CLEAR ?auto_155055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_155061 ?auto_155060 ?auto_155059 ?auto_155058 ?auto_155057 ?auto_155056 )
      ( MAKE-8PILE ?auto_155053 ?auto_155054 ?auto_155055 ?auto_155056 ?auto_155057 ?auto_155058 ?auto_155059 ?auto_155060 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_155062 - BLOCK
      ?auto_155063 - BLOCK
      ?auto_155064 - BLOCK
      ?auto_155065 - BLOCK
      ?auto_155066 - BLOCK
      ?auto_155067 - BLOCK
      ?auto_155068 - BLOCK
      ?auto_155069 - BLOCK
    )
    :vars
    (
      ?auto_155070 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155062 ) ( not ( = ?auto_155062 ?auto_155063 ) ) ( not ( = ?auto_155062 ?auto_155064 ) ) ( not ( = ?auto_155062 ?auto_155065 ) ) ( not ( = ?auto_155062 ?auto_155066 ) ) ( not ( = ?auto_155062 ?auto_155067 ) ) ( not ( = ?auto_155062 ?auto_155068 ) ) ( not ( = ?auto_155062 ?auto_155069 ) ) ( not ( = ?auto_155063 ?auto_155064 ) ) ( not ( = ?auto_155063 ?auto_155065 ) ) ( not ( = ?auto_155063 ?auto_155066 ) ) ( not ( = ?auto_155063 ?auto_155067 ) ) ( not ( = ?auto_155063 ?auto_155068 ) ) ( not ( = ?auto_155063 ?auto_155069 ) ) ( not ( = ?auto_155064 ?auto_155065 ) ) ( not ( = ?auto_155064 ?auto_155066 ) ) ( not ( = ?auto_155064 ?auto_155067 ) ) ( not ( = ?auto_155064 ?auto_155068 ) ) ( not ( = ?auto_155064 ?auto_155069 ) ) ( not ( = ?auto_155065 ?auto_155066 ) ) ( not ( = ?auto_155065 ?auto_155067 ) ) ( not ( = ?auto_155065 ?auto_155068 ) ) ( not ( = ?auto_155065 ?auto_155069 ) ) ( not ( = ?auto_155066 ?auto_155067 ) ) ( not ( = ?auto_155066 ?auto_155068 ) ) ( not ( = ?auto_155066 ?auto_155069 ) ) ( not ( = ?auto_155067 ?auto_155068 ) ) ( not ( = ?auto_155067 ?auto_155069 ) ) ( not ( = ?auto_155068 ?auto_155069 ) ) ( ON ?auto_155069 ?auto_155070 ) ( not ( = ?auto_155062 ?auto_155070 ) ) ( not ( = ?auto_155063 ?auto_155070 ) ) ( not ( = ?auto_155064 ?auto_155070 ) ) ( not ( = ?auto_155065 ?auto_155070 ) ) ( not ( = ?auto_155066 ?auto_155070 ) ) ( not ( = ?auto_155067 ?auto_155070 ) ) ( not ( = ?auto_155068 ?auto_155070 ) ) ( not ( = ?auto_155069 ?auto_155070 ) ) ( ON ?auto_155068 ?auto_155069 ) ( ON-TABLE ?auto_155070 ) ( ON ?auto_155067 ?auto_155068 ) ( ON ?auto_155066 ?auto_155067 ) ( ON ?auto_155065 ?auto_155066 ) ( ON ?auto_155064 ?auto_155065 ) ( CLEAR ?auto_155064 ) ( HOLDING ?auto_155063 ) ( CLEAR ?auto_155062 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_155062 ?auto_155063 )
      ( MAKE-8PILE ?auto_155062 ?auto_155063 ?auto_155064 ?auto_155065 ?auto_155066 ?auto_155067 ?auto_155068 ?auto_155069 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_155071 - BLOCK
      ?auto_155072 - BLOCK
      ?auto_155073 - BLOCK
      ?auto_155074 - BLOCK
      ?auto_155075 - BLOCK
      ?auto_155076 - BLOCK
      ?auto_155077 - BLOCK
      ?auto_155078 - BLOCK
    )
    :vars
    (
      ?auto_155079 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155071 ) ( not ( = ?auto_155071 ?auto_155072 ) ) ( not ( = ?auto_155071 ?auto_155073 ) ) ( not ( = ?auto_155071 ?auto_155074 ) ) ( not ( = ?auto_155071 ?auto_155075 ) ) ( not ( = ?auto_155071 ?auto_155076 ) ) ( not ( = ?auto_155071 ?auto_155077 ) ) ( not ( = ?auto_155071 ?auto_155078 ) ) ( not ( = ?auto_155072 ?auto_155073 ) ) ( not ( = ?auto_155072 ?auto_155074 ) ) ( not ( = ?auto_155072 ?auto_155075 ) ) ( not ( = ?auto_155072 ?auto_155076 ) ) ( not ( = ?auto_155072 ?auto_155077 ) ) ( not ( = ?auto_155072 ?auto_155078 ) ) ( not ( = ?auto_155073 ?auto_155074 ) ) ( not ( = ?auto_155073 ?auto_155075 ) ) ( not ( = ?auto_155073 ?auto_155076 ) ) ( not ( = ?auto_155073 ?auto_155077 ) ) ( not ( = ?auto_155073 ?auto_155078 ) ) ( not ( = ?auto_155074 ?auto_155075 ) ) ( not ( = ?auto_155074 ?auto_155076 ) ) ( not ( = ?auto_155074 ?auto_155077 ) ) ( not ( = ?auto_155074 ?auto_155078 ) ) ( not ( = ?auto_155075 ?auto_155076 ) ) ( not ( = ?auto_155075 ?auto_155077 ) ) ( not ( = ?auto_155075 ?auto_155078 ) ) ( not ( = ?auto_155076 ?auto_155077 ) ) ( not ( = ?auto_155076 ?auto_155078 ) ) ( not ( = ?auto_155077 ?auto_155078 ) ) ( ON ?auto_155078 ?auto_155079 ) ( not ( = ?auto_155071 ?auto_155079 ) ) ( not ( = ?auto_155072 ?auto_155079 ) ) ( not ( = ?auto_155073 ?auto_155079 ) ) ( not ( = ?auto_155074 ?auto_155079 ) ) ( not ( = ?auto_155075 ?auto_155079 ) ) ( not ( = ?auto_155076 ?auto_155079 ) ) ( not ( = ?auto_155077 ?auto_155079 ) ) ( not ( = ?auto_155078 ?auto_155079 ) ) ( ON ?auto_155077 ?auto_155078 ) ( ON-TABLE ?auto_155079 ) ( ON ?auto_155076 ?auto_155077 ) ( ON ?auto_155075 ?auto_155076 ) ( ON ?auto_155074 ?auto_155075 ) ( ON ?auto_155073 ?auto_155074 ) ( CLEAR ?auto_155071 ) ( ON ?auto_155072 ?auto_155073 ) ( CLEAR ?auto_155072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_155079 ?auto_155078 ?auto_155077 ?auto_155076 ?auto_155075 ?auto_155074 ?auto_155073 )
      ( MAKE-8PILE ?auto_155071 ?auto_155072 ?auto_155073 ?auto_155074 ?auto_155075 ?auto_155076 ?auto_155077 ?auto_155078 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_155080 - BLOCK
      ?auto_155081 - BLOCK
      ?auto_155082 - BLOCK
      ?auto_155083 - BLOCK
      ?auto_155084 - BLOCK
      ?auto_155085 - BLOCK
      ?auto_155086 - BLOCK
      ?auto_155087 - BLOCK
    )
    :vars
    (
      ?auto_155088 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155080 ?auto_155081 ) ) ( not ( = ?auto_155080 ?auto_155082 ) ) ( not ( = ?auto_155080 ?auto_155083 ) ) ( not ( = ?auto_155080 ?auto_155084 ) ) ( not ( = ?auto_155080 ?auto_155085 ) ) ( not ( = ?auto_155080 ?auto_155086 ) ) ( not ( = ?auto_155080 ?auto_155087 ) ) ( not ( = ?auto_155081 ?auto_155082 ) ) ( not ( = ?auto_155081 ?auto_155083 ) ) ( not ( = ?auto_155081 ?auto_155084 ) ) ( not ( = ?auto_155081 ?auto_155085 ) ) ( not ( = ?auto_155081 ?auto_155086 ) ) ( not ( = ?auto_155081 ?auto_155087 ) ) ( not ( = ?auto_155082 ?auto_155083 ) ) ( not ( = ?auto_155082 ?auto_155084 ) ) ( not ( = ?auto_155082 ?auto_155085 ) ) ( not ( = ?auto_155082 ?auto_155086 ) ) ( not ( = ?auto_155082 ?auto_155087 ) ) ( not ( = ?auto_155083 ?auto_155084 ) ) ( not ( = ?auto_155083 ?auto_155085 ) ) ( not ( = ?auto_155083 ?auto_155086 ) ) ( not ( = ?auto_155083 ?auto_155087 ) ) ( not ( = ?auto_155084 ?auto_155085 ) ) ( not ( = ?auto_155084 ?auto_155086 ) ) ( not ( = ?auto_155084 ?auto_155087 ) ) ( not ( = ?auto_155085 ?auto_155086 ) ) ( not ( = ?auto_155085 ?auto_155087 ) ) ( not ( = ?auto_155086 ?auto_155087 ) ) ( ON ?auto_155087 ?auto_155088 ) ( not ( = ?auto_155080 ?auto_155088 ) ) ( not ( = ?auto_155081 ?auto_155088 ) ) ( not ( = ?auto_155082 ?auto_155088 ) ) ( not ( = ?auto_155083 ?auto_155088 ) ) ( not ( = ?auto_155084 ?auto_155088 ) ) ( not ( = ?auto_155085 ?auto_155088 ) ) ( not ( = ?auto_155086 ?auto_155088 ) ) ( not ( = ?auto_155087 ?auto_155088 ) ) ( ON ?auto_155086 ?auto_155087 ) ( ON-TABLE ?auto_155088 ) ( ON ?auto_155085 ?auto_155086 ) ( ON ?auto_155084 ?auto_155085 ) ( ON ?auto_155083 ?auto_155084 ) ( ON ?auto_155082 ?auto_155083 ) ( ON ?auto_155081 ?auto_155082 ) ( CLEAR ?auto_155081 ) ( HOLDING ?auto_155080 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_155080 )
      ( MAKE-8PILE ?auto_155080 ?auto_155081 ?auto_155082 ?auto_155083 ?auto_155084 ?auto_155085 ?auto_155086 ?auto_155087 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_155089 - BLOCK
      ?auto_155090 - BLOCK
      ?auto_155091 - BLOCK
      ?auto_155092 - BLOCK
      ?auto_155093 - BLOCK
      ?auto_155094 - BLOCK
      ?auto_155095 - BLOCK
      ?auto_155096 - BLOCK
    )
    :vars
    (
      ?auto_155097 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155089 ?auto_155090 ) ) ( not ( = ?auto_155089 ?auto_155091 ) ) ( not ( = ?auto_155089 ?auto_155092 ) ) ( not ( = ?auto_155089 ?auto_155093 ) ) ( not ( = ?auto_155089 ?auto_155094 ) ) ( not ( = ?auto_155089 ?auto_155095 ) ) ( not ( = ?auto_155089 ?auto_155096 ) ) ( not ( = ?auto_155090 ?auto_155091 ) ) ( not ( = ?auto_155090 ?auto_155092 ) ) ( not ( = ?auto_155090 ?auto_155093 ) ) ( not ( = ?auto_155090 ?auto_155094 ) ) ( not ( = ?auto_155090 ?auto_155095 ) ) ( not ( = ?auto_155090 ?auto_155096 ) ) ( not ( = ?auto_155091 ?auto_155092 ) ) ( not ( = ?auto_155091 ?auto_155093 ) ) ( not ( = ?auto_155091 ?auto_155094 ) ) ( not ( = ?auto_155091 ?auto_155095 ) ) ( not ( = ?auto_155091 ?auto_155096 ) ) ( not ( = ?auto_155092 ?auto_155093 ) ) ( not ( = ?auto_155092 ?auto_155094 ) ) ( not ( = ?auto_155092 ?auto_155095 ) ) ( not ( = ?auto_155092 ?auto_155096 ) ) ( not ( = ?auto_155093 ?auto_155094 ) ) ( not ( = ?auto_155093 ?auto_155095 ) ) ( not ( = ?auto_155093 ?auto_155096 ) ) ( not ( = ?auto_155094 ?auto_155095 ) ) ( not ( = ?auto_155094 ?auto_155096 ) ) ( not ( = ?auto_155095 ?auto_155096 ) ) ( ON ?auto_155096 ?auto_155097 ) ( not ( = ?auto_155089 ?auto_155097 ) ) ( not ( = ?auto_155090 ?auto_155097 ) ) ( not ( = ?auto_155091 ?auto_155097 ) ) ( not ( = ?auto_155092 ?auto_155097 ) ) ( not ( = ?auto_155093 ?auto_155097 ) ) ( not ( = ?auto_155094 ?auto_155097 ) ) ( not ( = ?auto_155095 ?auto_155097 ) ) ( not ( = ?auto_155096 ?auto_155097 ) ) ( ON ?auto_155095 ?auto_155096 ) ( ON-TABLE ?auto_155097 ) ( ON ?auto_155094 ?auto_155095 ) ( ON ?auto_155093 ?auto_155094 ) ( ON ?auto_155092 ?auto_155093 ) ( ON ?auto_155091 ?auto_155092 ) ( ON ?auto_155090 ?auto_155091 ) ( ON ?auto_155089 ?auto_155090 ) ( CLEAR ?auto_155089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_155097 ?auto_155096 ?auto_155095 ?auto_155094 ?auto_155093 ?auto_155092 ?auto_155091 ?auto_155090 )
      ( MAKE-8PILE ?auto_155089 ?auto_155090 ?auto_155091 ?auto_155092 ?auto_155093 ?auto_155094 ?auto_155095 ?auto_155096 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_155105 - BLOCK
      ?auto_155106 - BLOCK
      ?auto_155107 - BLOCK
      ?auto_155108 - BLOCK
      ?auto_155109 - BLOCK
      ?auto_155110 - BLOCK
      ?auto_155111 - BLOCK
    )
    :vars
    (
      ?auto_155112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155112 ?auto_155111 ) ( CLEAR ?auto_155112 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_155105 ) ( ON ?auto_155106 ?auto_155105 ) ( ON ?auto_155107 ?auto_155106 ) ( ON ?auto_155108 ?auto_155107 ) ( ON ?auto_155109 ?auto_155108 ) ( ON ?auto_155110 ?auto_155109 ) ( ON ?auto_155111 ?auto_155110 ) ( not ( = ?auto_155105 ?auto_155106 ) ) ( not ( = ?auto_155105 ?auto_155107 ) ) ( not ( = ?auto_155105 ?auto_155108 ) ) ( not ( = ?auto_155105 ?auto_155109 ) ) ( not ( = ?auto_155105 ?auto_155110 ) ) ( not ( = ?auto_155105 ?auto_155111 ) ) ( not ( = ?auto_155105 ?auto_155112 ) ) ( not ( = ?auto_155106 ?auto_155107 ) ) ( not ( = ?auto_155106 ?auto_155108 ) ) ( not ( = ?auto_155106 ?auto_155109 ) ) ( not ( = ?auto_155106 ?auto_155110 ) ) ( not ( = ?auto_155106 ?auto_155111 ) ) ( not ( = ?auto_155106 ?auto_155112 ) ) ( not ( = ?auto_155107 ?auto_155108 ) ) ( not ( = ?auto_155107 ?auto_155109 ) ) ( not ( = ?auto_155107 ?auto_155110 ) ) ( not ( = ?auto_155107 ?auto_155111 ) ) ( not ( = ?auto_155107 ?auto_155112 ) ) ( not ( = ?auto_155108 ?auto_155109 ) ) ( not ( = ?auto_155108 ?auto_155110 ) ) ( not ( = ?auto_155108 ?auto_155111 ) ) ( not ( = ?auto_155108 ?auto_155112 ) ) ( not ( = ?auto_155109 ?auto_155110 ) ) ( not ( = ?auto_155109 ?auto_155111 ) ) ( not ( = ?auto_155109 ?auto_155112 ) ) ( not ( = ?auto_155110 ?auto_155111 ) ) ( not ( = ?auto_155110 ?auto_155112 ) ) ( not ( = ?auto_155111 ?auto_155112 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_155112 ?auto_155111 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_155130 - BLOCK
      ?auto_155131 - BLOCK
      ?auto_155132 - BLOCK
      ?auto_155133 - BLOCK
      ?auto_155134 - BLOCK
      ?auto_155135 - BLOCK
      ?auto_155136 - BLOCK
    )
    :vars
    (
      ?auto_155137 - BLOCK
      ?auto_155138 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155130 ) ( ON ?auto_155131 ?auto_155130 ) ( ON ?auto_155132 ?auto_155131 ) ( ON ?auto_155133 ?auto_155132 ) ( ON ?auto_155134 ?auto_155133 ) ( ON ?auto_155135 ?auto_155134 ) ( not ( = ?auto_155130 ?auto_155131 ) ) ( not ( = ?auto_155130 ?auto_155132 ) ) ( not ( = ?auto_155130 ?auto_155133 ) ) ( not ( = ?auto_155130 ?auto_155134 ) ) ( not ( = ?auto_155130 ?auto_155135 ) ) ( not ( = ?auto_155130 ?auto_155136 ) ) ( not ( = ?auto_155130 ?auto_155137 ) ) ( not ( = ?auto_155131 ?auto_155132 ) ) ( not ( = ?auto_155131 ?auto_155133 ) ) ( not ( = ?auto_155131 ?auto_155134 ) ) ( not ( = ?auto_155131 ?auto_155135 ) ) ( not ( = ?auto_155131 ?auto_155136 ) ) ( not ( = ?auto_155131 ?auto_155137 ) ) ( not ( = ?auto_155132 ?auto_155133 ) ) ( not ( = ?auto_155132 ?auto_155134 ) ) ( not ( = ?auto_155132 ?auto_155135 ) ) ( not ( = ?auto_155132 ?auto_155136 ) ) ( not ( = ?auto_155132 ?auto_155137 ) ) ( not ( = ?auto_155133 ?auto_155134 ) ) ( not ( = ?auto_155133 ?auto_155135 ) ) ( not ( = ?auto_155133 ?auto_155136 ) ) ( not ( = ?auto_155133 ?auto_155137 ) ) ( not ( = ?auto_155134 ?auto_155135 ) ) ( not ( = ?auto_155134 ?auto_155136 ) ) ( not ( = ?auto_155134 ?auto_155137 ) ) ( not ( = ?auto_155135 ?auto_155136 ) ) ( not ( = ?auto_155135 ?auto_155137 ) ) ( not ( = ?auto_155136 ?auto_155137 ) ) ( ON ?auto_155137 ?auto_155138 ) ( CLEAR ?auto_155137 ) ( not ( = ?auto_155130 ?auto_155138 ) ) ( not ( = ?auto_155131 ?auto_155138 ) ) ( not ( = ?auto_155132 ?auto_155138 ) ) ( not ( = ?auto_155133 ?auto_155138 ) ) ( not ( = ?auto_155134 ?auto_155138 ) ) ( not ( = ?auto_155135 ?auto_155138 ) ) ( not ( = ?auto_155136 ?auto_155138 ) ) ( not ( = ?auto_155137 ?auto_155138 ) ) ( HOLDING ?auto_155136 ) ( CLEAR ?auto_155135 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_155130 ?auto_155131 ?auto_155132 ?auto_155133 ?auto_155134 ?auto_155135 ?auto_155136 ?auto_155137 )
      ( MAKE-7PILE ?auto_155130 ?auto_155131 ?auto_155132 ?auto_155133 ?auto_155134 ?auto_155135 ?auto_155136 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_155139 - BLOCK
      ?auto_155140 - BLOCK
      ?auto_155141 - BLOCK
      ?auto_155142 - BLOCK
      ?auto_155143 - BLOCK
      ?auto_155144 - BLOCK
      ?auto_155145 - BLOCK
    )
    :vars
    (
      ?auto_155147 - BLOCK
      ?auto_155146 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155139 ) ( ON ?auto_155140 ?auto_155139 ) ( ON ?auto_155141 ?auto_155140 ) ( ON ?auto_155142 ?auto_155141 ) ( ON ?auto_155143 ?auto_155142 ) ( ON ?auto_155144 ?auto_155143 ) ( not ( = ?auto_155139 ?auto_155140 ) ) ( not ( = ?auto_155139 ?auto_155141 ) ) ( not ( = ?auto_155139 ?auto_155142 ) ) ( not ( = ?auto_155139 ?auto_155143 ) ) ( not ( = ?auto_155139 ?auto_155144 ) ) ( not ( = ?auto_155139 ?auto_155145 ) ) ( not ( = ?auto_155139 ?auto_155147 ) ) ( not ( = ?auto_155140 ?auto_155141 ) ) ( not ( = ?auto_155140 ?auto_155142 ) ) ( not ( = ?auto_155140 ?auto_155143 ) ) ( not ( = ?auto_155140 ?auto_155144 ) ) ( not ( = ?auto_155140 ?auto_155145 ) ) ( not ( = ?auto_155140 ?auto_155147 ) ) ( not ( = ?auto_155141 ?auto_155142 ) ) ( not ( = ?auto_155141 ?auto_155143 ) ) ( not ( = ?auto_155141 ?auto_155144 ) ) ( not ( = ?auto_155141 ?auto_155145 ) ) ( not ( = ?auto_155141 ?auto_155147 ) ) ( not ( = ?auto_155142 ?auto_155143 ) ) ( not ( = ?auto_155142 ?auto_155144 ) ) ( not ( = ?auto_155142 ?auto_155145 ) ) ( not ( = ?auto_155142 ?auto_155147 ) ) ( not ( = ?auto_155143 ?auto_155144 ) ) ( not ( = ?auto_155143 ?auto_155145 ) ) ( not ( = ?auto_155143 ?auto_155147 ) ) ( not ( = ?auto_155144 ?auto_155145 ) ) ( not ( = ?auto_155144 ?auto_155147 ) ) ( not ( = ?auto_155145 ?auto_155147 ) ) ( ON ?auto_155147 ?auto_155146 ) ( not ( = ?auto_155139 ?auto_155146 ) ) ( not ( = ?auto_155140 ?auto_155146 ) ) ( not ( = ?auto_155141 ?auto_155146 ) ) ( not ( = ?auto_155142 ?auto_155146 ) ) ( not ( = ?auto_155143 ?auto_155146 ) ) ( not ( = ?auto_155144 ?auto_155146 ) ) ( not ( = ?auto_155145 ?auto_155146 ) ) ( not ( = ?auto_155147 ?auto_155146 ) ) ( CLEAR ?auto_155144 ) ( ON ?auto_155145 ?auto_155147 ) ( CLEAR ?auto_155145 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_155146 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_155146 ?auto_155147 )
      ( MAKE-7PILE ?auto_155139 ?auto_155140 ?auto_155141 ?auto_155142 ?auto_155143 ?auto_155144 ?auto_155145 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_155148 - BLOCK
      ?auto_155149 - BLOCK
      ?auto_155150 - BLOCK
      ?auto_155151 - BLOCK
      ?auto_155152 - BLOCK
      ?auto_155153 - BLOCK
      ?auto_155154 - BLOCK
    )
    :vars
    (
      ?auto_155156 - BLOCK
      ?auto_155155 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155148 ) ( ON ?auto_155149 ?auto_155148 ) ( ON ?auto_155150 ?auto_155149 ) ( ON ?auto_155151 ?auto_155150 ) ( ON ?auto_155152 ?auto_155151 ) ( not ( = ?auto_155148 ?auto_155149 ) ) ( not ( = ?auto_155148 ?auto_155150 ) ) ( not ( = ?auto_155148 ?auto_155151 ) ) ( not ( = ?auto_155148 ?auto_155152 ) ) ( not ( = ?auto_155148 ?auto_155153 ) ) ( not ( = ?auto_155148 ?auto_155154 ) ) ( not ( = ?auto_155148 ?auto_155156 ) ) ( not ( = ?auto_155149 ?auto_155150 ) ) ( not ( = ?auto_155149 ?auto_155151 ) ) ( not ( = ?auto_155149 ?auto_155152 ) ) ( not ( = ?auto_155149 ?auto_155153 ) ) ( not ( = ?auto_155149 ?auto_155154 ) ) ( not ( = ?auto_155149 ?auto_155156 ) ) ( not ( = ?auto_155150 ?auto_155151 ) ) ( not ( = ?auto_155150 ?auto_155152 ) ) ( not ( = ?auto_155150 ?auto_155153 ) ) ( not ( = ?auto_155150 ?auto_155154 ) ) ( not ( = ?auto_155150 ?auto_155156 ) ) ( not ( = ?auto_155151 ?auto_155152 ) ) ( not ( = ?auto_155151 ?auto_155153 ) ) ( not ( = ?auto_155151 ?auto_155154 ) ) ( not ( = ?auto_155151 ?auto_155156 ) ) ( not ( = ?auto_155152 ?auto_155153 ) ) ( not ( = ?auto_155152 ?auto_155154 ) ) ( not ( = ?auto_155152 ?auto_155156 ) ) ( not ( = ?auto_155153 ?auto_155154 ) ) ( not ( = ?auto_155153 ?auto_155156 ) ) ( not ( = ?auto_155154 ?auto_155156 ) ) ( ON ?auto_155156 ?auto_155155 ) ( not ( = ?auto_155148 ?auto_155155 ) ) ( not ( = ?auto_155149 ?auto_155155 ) ) ( not ( = ?auto_155150 ?auto_155155 ) ) ( not ( = ?auto_155151 ?auto_155155 ) ) ( not ( = ?auto_155152 ?auto_155155 ) ) ( not ( = ?auto_155153 ?auto_155155 ) ) ( not ( = ?auto_155154 ?auto_155155 ) ) ( not ( = ?auto_155156 ?auto_155155 ) ) ( ON ?auto_155154 ?auto_155156 ) ( CLEAR ?auto_155154 ) ( ON-TABLE ?auto_155155 ) ( HOLDING ?auto_155153 ) ( CLEAR ?auto_155152 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_155148 ?auto_155149 ?auto_155150 ?auto_155151 ?auto_155152 ?auto_155153 )
      ( MAKE-7PILE ?auto_155148 ?auto_155149 ?auto_155150 ?auto_155151 ?auto_155152 ?auto_155153 ?auto_155154 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_155157 - BLOCK
      ?auto_155158 - BLOCK
      ?auto_155159 - BLOCK
      ?auto_155160 - BLOCK
      ?auto_155161 - BLOCK
      ?auto_155162 - BLOCK
      ?auto_155163 - BLOCK
    )
    :vars
    (
      ?auto_155165 - BLOCK
      ?auto_155164 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155157 ) ( ON ?auto_155158 ?auto_155157 ) ( ON ?auto_155159 ?auto_155158 ) ( ON ?auto_155160 ?auto_155159 ) ( ON ?auto_155161 ?auto_155160 ) ( not ( = ?auto_155157 ?auto_155158 ) ) ( not ( = ?auto_155157 ?auto_155159 ) ) ( not ( = ?auto_155157 ?auto_155160 ) ) ( not ( = ?auto_155157 ?auto_155161 ) ) ( not ( = ?auto_155157 ?auto_155162 ) ) ( not ( = ?auto_155157 ?auto_155163 ) ) ( not ( = ?auto_155157 ?auto_155165 ) ) ( not ( = ?auto_155158 ?auto_155159 ) ) ( not ( = ?auto_155158 ?auto_155160 ) ) ( not ( = ?auto_155158 ?auto_155161 ) ) ( not ( = ?auto_155158 ?auto_155162 ) ) ( not ( = ?auto_155158 ?auto_155163 ) ) ( not ( = ?auto_155158 ?auto_155165 ) ) ( not ( = ?auto_155159 ?auto_155160 ) ) ( not ( = ?auto_155159 ?auto_155161 ) ) ( not ( = ?auto_155159 ?auto_155162 ) ) ( not ( = ?auto_155159 ?auto_155163 ) ) ( not ( = ?auto_155159 ?auto_155165 ) ) ( not ( = ?auto_155160 ?auto_155161 ) ) ( not ( = ?auto_155160 ?auto_155162 ) ) ( not ( = ?auto_155160 ?auto_155163 ) ) ( not ( = ?auto_155160 ?auto_155165 ) ) ( not ( = ?auto_155161 ?auto_155162 ) ) ( not ( = ?auto_155161 ?auto_155163 ) ) ( not ( = ?auto_155161 ?auto_155165 ) ) ( not ( = ?auto_155162 ?auto_155163 ) ) ( not ( = ?auto_155162 ?auto_155165 ) ) ( not ( = ?auto_155163 ?auto_155165 ) ) ( ON ?auto_155165 ?auto_155164 ) ( not ( = ?auto_155157 ?auto_155164 ) ) ( not ( = ?auto_155158 ?auto_155164 ) ) ( not ( = ?auto_155159 ?auto_155164 ) ) ( not ( = ?auto_155160 ?auto_155164 ) ) ( not ( = ?auto_155161 ?auto_155164 ) ) ( not ( = ?auto_155162 ?auto_155164 ) ) ( not ( = ?auto_155163 ?auto_155164 ) ) ( not ( = ?auto_155165 ?auto_155164 ) ) ( ON ?auto_155163 ?auto_155165 ) ( ON-TABLE ?auto_155164 ) ( CLEAR ?auto_155161 ) ( ON ?auto_155162 ?auto_155163 ) ( CLEAR ?auto_155162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_155164 ?auto_155165 ?auto_155163 )
      ( MAKE-7PILE ?auto_155157 ?auto_155158 ?auto_155159 ?auto_155160 ?auto_155161 ?auto_155162 ?auto_155163 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_155166 - BLOCK
      ?auto_155167 - BLOCK
      ?auto_155168 - BLOCK
      ?auto_155169 - BLOCK
      ?auto_155170 - BLOCK
      ?auto_155171 - BLOCK
      ?auto_155172 - BLOCK
    )
    :vars
    (
      ?auto_155173 - BLOCK
      ?auto_155174 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155166 ) ( ON ?auto_155167 ?auto_155166 ) ( ON ?auto_155168 ?auto_155167 ) ( ON ?auto_155169 ?auto_155168 ) ( not ( = ?auto_155166 ?auto_155167 ) ) ( not ( = ?auto_155166 ?auto_155168 ) ) ( not ( = ?auto_155166 ?auto_155169 ) ) ( not ( = ?auto_155166 ?auto_155170 ) ) ( not ( = ?auto_155166 ?auto_155171 ) ) ( not ( = ?auto_155166 ?auto_155172 ) ) ( not ( = ?auto_155166 ?auto_155173 ) ) ( not ( = ?auto_155167 ?auto_155168 ) ) ( not ( = ?auto_155167 ?auto_155169 ) ) ( not ( = ?auto_155167 ?auto_155170 ) ) ( not ( = ?auto_155167 ?auto_155171 ) ) ( not ( = ?auto_155167 ?auto_155172 ) ) ( not ( = ?auto_155167 ?auto_155173 ) ) ( not ( = ?auto_155168 ?auto_155169 ) ) ( not ( = ?auto_155168 ?auto_155170 ) ) ( not ( = ?auto_155168 ?auto_155171 ) ) ( not ( = ?auto_155168 ?auto_155172 ) ) ( not ( = ?auto_155168 ?auto_155173 ) ) ( not ( = ?auto_155169 ?auto_155170 ) ) ( not ( = ?auto_155169 ?auto_155171 ) ) ( not ( = ?auto_155169 ?auto_155172 ) ) ( not ( = ?auto_155169 ?auto_155173 ) ) ( not ( = ?auto_155170 ?auto_155171 ) ) ( not ( = ?auto_155170 ?auto_155172 ) ) ( not ( = ?auto_155170 ?auto_155173 ) ) ( not ( = ?auto_155171 ?auto_155172 ) ) ( not ( = ?auto_155171 ?auto_155173 ) ) ( not ( = ?auto_155172 ?auto_155173 ) ) ( ON ?auto_155173 ?auto_155174 ) ( not ( = ?auto_155166 ?auto_155174 ) ) ( not ( = ?auto_155167 ?auto_155174 ) ) ( not ( = ?auto_155168 ?auto_155174 ) ) ( not ( = ?auto_155169 ?auto_155174 ) ) ( not ( = ?auto_155170 ?auto_155174 ) ) ( not ( = ?auto_155171 ?auto_155174 ) ) ( not ( = ?auto_155172 ?auto_155174 ) ) ( not ( = ?auto_155173 ?auto_155174 ) ) ( ON ?auto_155172 ?auto_155173 ) ( ON-TABLE ?auto_155174 ) ( ON ?auto_155171 ?auto_155172 ) ( CLEAR ?auto_155171 ) ( HOLDING ?auto_155170 ) ( CLEAR ?auto_155169 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_155166 ?auto_155167 ?auto_155168 ?auto_155169 ?auto_155170 )
      ( MAKE-7PILE ?auto_155166 ?auto_155167 ?auto_155168 ?auto_155169 ?auto_155170 ?auto_155171 ?auto_155172 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_155175 - BLOCK
      ?auto_155176 - BLOCK
      ?auto_155177 - BLOCK
      ?auto_155178 - BLOCK
      ?auto_155179 - BLOCK
      ?auto_155180 - BLOCK
      ?auto_155181 - BLOCK
    )
    :vars
    (
      ?auto_155182 - BLOCK
      ?auto_155183 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155175 ) ( ON ?auto_155176 ?auto_155175 ) ( ON ?auto_155177 ?auto_155176 ) ( ON ?auto_155178 ?auto_155177 ) ( not ( = ?auto_155175 ?auto_155176 ) ) ( not ( = ?auto_155175 ?auto_155177 ) ) ( not ( = ?auto_155175 ?auto_155178 ) ) ( not ( = ?auto_155175 ?auto_155179 ) ) ( not ( = ?auto_155175 ?auto_155180 ) ) ( not ( = ?auto_155175 ?auto_155181 ) ) ( not ( = ?auto_155175 ?auto_155182 ) ) ( not ( = ?auto_155176 ?auto_155177 ) ) ( not ( = ?auto_155176 ?auto_155178 ) ) ( not ( = ?auto_155176 ?auto_155179 ) ) ( not ( = ?auto_155176 ?auto_155180 ) ) ( not ( = ?auto_155176 ?auto_155181 ) ) ( not ( = ?auto_155176 ?auto_155182 ) ) ( not ( = ?auto_155177 ?auto_155178 ) ) ( not ( = ?auto_155177 ?auto_155179 ) ) ( not ( = ?auto_155177 ?auto_155180 ) ) ( not ( = ?auto_155177 ?auto_155181 ) ) ( not ( = ?auto_155177 ?auto_155182 ) ) ( not ( = ?auto_155178 ?auto_155179 ) ) ( not ( = ?auto_155178 ?auto_155180 ) ) ( not ( = ?auto_155178 ?auto_155181 ) ) ( not ( = ?auto_155178 ?auto_155182 ) ) ( not ( = ?auto_155179 ?auto_155180 ) ) ( not ( = ?auto_155179 ?auto_155181 ) ) ( not ( = ?auto_155179 ?auto_155182 ) ) ( not ( = ?auto_155180 ?auto_155181 ) ) ( not ( = ?auto_155180 ?auto_155182 ) ) ( not ( = ?auto_155181 ?auto_155182 ) ) ( ON ?auto_155182 ?auto_155183 ) ( not ( = ?auto_155175 ?auto_155183 ) ) ( not ( = ?auto_155176 ?auto_155183 ) ) ( not ( = ?auto_155177 ?auto_155183 ) ) ( not ( = ?auto_155178 ?auto_155183 ) ) ( not ( = ?auto_155179 ?auto_155183 ) ) ( not ( = ?auto_155180 ?auto_155183 ) ) ( not ( = ?auto_155181 ?auto_155183 ) ) ( not ( = ?auto_155182 ?auto_155183 ) ) ( ON ?auto_155181 ?auto_155182 ) ( ON-TABLE ?auto_155183 ) ( ON ?auto_155180 ?auto_155181 ) ( CLEAR ?auto_155178 ) ( ON ?auto_155179 ?auto_155180 ) ( CLEAR ?auto_155179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_155183 ?auto_155182 ?auto_155181 ?auto_155180 )
      ( MAKE-7PILE ?auto_155175 ?auto_155176 ?auto_155177 ?auto_155178 ?auto_155179 ?auto_155180 ?auto_155181 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_155184 - BLOCK
      ?auto_155185 - BLOCK
      ?auto_155186 - BLOCK
      ?auto_155187 - BLOCK
      ?auto_155188 - BLOCK
      ?auto_155189 - BLOCK
      ?auto_155190 - BLOCK
    )
    :vars
    (
      ?auto_155191 - BLOCK
      ?auto_155192 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155184 ) ( ON ?auto_155185 ?auto_155184 ) ( ON ?auto_155186 ?auto_155185 ) ( not ( = ?auto_155184 ?auto_155185 ) ) ( not ( = ?auto_155184 ?auto_155186 ) ) ( not ( = ?auto_155184 ?auto_155187 ) ) ( not ( = ?auto_155184 ?auto_155188 ) ) ( not ( = ?auto_155184 ?auto_155189 ) ) ( not ( = ?auto_155184 ?auto_155190 ) ) ( not ( = ?auto_155184 ?auto_155191 ) ) ( not ( = ?auto_155185 ?auto_155186 ) ) ( not ( = ?auto_155185 ?auto_155187 ) ) ( not ( = ?auto_155185 ?auto_155188 ) ) ( not ( = ?auto_155185 ?auto_155189 ) ) ( not ( = ?auto_155185 ?auto_155190 ) ) ( not ( = ?auto_155185 ?auto_155191 ) ) ( not ( = ?auto_155186 ?auto_155187 ) ) ( not ( = ?auto_155186 ?auto_155188 ) ) ( not ( = ?auto_155186 ?auto_155189 ) ) ( not ( = ?auto_155186 ?auto_155190 ) ) ( not ( = ?auto_155186 ?auto_155191 ) ) ( not ( = ?auto_155187 ?auto_155188 ) ) ( not ( = ?auto_155187 ?auto_155189 ) ) ( not ( = ?auto_155187 ?auto_155190 ) ) ( not ( = ?auto_155187 ?auto_155191 ) ) ( not ( = ?auto_155188 ?auto_155189 ) ) ( not ( = ?auto_155188 ?auto_155190 ) ) ( not ( = ?auto_155188 ?auto_155191 ) ) ( not ( = ?auto_155189 ?auto_155190 ) ) ( not ( = ?auto_155189 ?auto_155191 ) ) ( not ( = ?auto_155190 ?auto_155191 ) ) ( ON ?auto_155191 ?auto_155192 ) ( not ( = ?auto_155184 ?auto_155192 ) ) ( not ( = ?auto_155185 ?auto_155192 ) ) ( not ( = ?auto_155186 ?auto_155192 ) ) ( not ( = ?auto_155187 ?auto_155192 ) ) ( not ( = ?auto_155188 ?auto_155192 ) ) ( not ( = ?auto_155189 ?auto_155192 ) ) ( not ( = ?auto_155190 ?auto_155192 ) ) ( not ( = ?auto_155191 ?auto_155192 ) ) ( ON ?auto_155190 ?auto_155191 ) ( ON-TABLE ?auto_155192 ) ( ON ?auto_155189 ?auto_155190 ) ( ON ?auto_155188 ?auto_155189 ) ( CLEAR ?auto_155188 ) ( HOLDING ?auto_155187 ) ( CLEAR ?auto_155186 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_155184 ?auto_155185 ?auto_155186 ?auto_155187 )
      ( MAKE-7PILE ?auto_155184 ?auto_155185 ?auto_155186 ?auto_155187 ?auto_155188 ?auto_155189 ?auto_155190 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_155193 - BLOCK
      ?auto_155194 - BLOCK
      ?auto_155195 - BLOCK
      ?auto_155196 - BLOCK
      ?auto_155197 - BLOCK
      ?auto_155198 - BLOCK
      ?auto_155199 - BLOCK
    )
    :vars
    (
      ?auto_155201 - BLOCK
      ?auto_155200 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155193 ) ( ON ?auto_155194 ?auto_155193 ) ( ON ?auto_155195 ?auto_155194 ) ( not ( = ?auto_155193 ?auto_155194 ) ) ( not ( = ?auto_155193 ?auto_155195 ) ) ( not ( = ?auto_155193 ?auto_155196 ) ) ( not ( = ?auto_155193 ?auto_155197 ) ) ( not ( = ?auto_155193 ?auto_155198 ) ) ( not ( = ?auto_155193 ?auto_155199 ) ) ( not ( = ?auto_155193 ?auto_155201 ) ) ( not ( = ?auto_155194 ?auto_155195 ) ) ( not ( = ?auto_155194 ?auto_155196 ) ) ( not ( = ?auto_155194 ?auto_155197 ) ) ( not ( = ?auto_155194 ?auto_155198 ) ) ( not ( = ?auto_155194 ?auto_155199 ) ) ( not ( = ?auto_155194 ?auto_155201 ) ) ( not ( = ?auto_155195 ?auto_155196 ) ) ( not ( = ?auto_155195 ?auto_155197 ) ) ( not ( = ?auto_155195 ?auto_155198 ) ) ( not ( = ?auto_155195 ?auto_155199 ) ) ( not ( = ?auto_155195 ?auto_155201 ) ) ( not ( = ?auto_155196 ?auto_155197 ) ) ( not ( = ?auto_155196 ?auto_155198 ) ) ( not ( = ?auto_155196 ?auto_155199 ) ) ( not ( = ?auto_155196 ?auto_155201 ) ) ( not ( = ?auto_155197 ?auto_155198 ) ) ( not ( = ?auto_155197 ?auto_155199 ) ) ( not ( = ?auto_155197 ?auto_155201 ) ) ( not ( = ?auto_155198 ?auto_155199 ) ) ( not ( = ?auto_155198 ?auto_155201 ) ) ( not ( = ?auto_155199 ?auto_155201 ) ) ( ON ?auto_155201 ?auto_155200 ) ( not ( = ?auto_155193 ?auto_155200 ) ) ( not ( = ?auto_155194 ?auto_155200 ) ) ( not ( = ?auto_155195 ?auto_155200 ) ) ( not ( = ?auto_155196 ?auto_155200 ) ) ( not ( = ?auto_155197 ?auto_155200 ) ) ( not ( = ?auto_155198 ?auto_155200 ) ) ( not ( = ?auto_155199 ?auto_155200 ) ) ( not ( = ?auto_155201 ?auto_155200 ) ) ( ON ?auto_155199 ?auto_155201 ) ( ON-TABLE ?auto_155200 ) ( ON ?auto_155198 ?auto_155199 ) ( ON ?auto_155197 ?auto_155198 ) ( CLEAR ?auto_155195 ) ( ON ?auto_155196 ?auto_155197 ) ( CLEAR ?auto_155196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_155200 ?auto_155201 ?auto_155199 ?auto_155198 ?auto_155197 )
      ( MAKE-7PILE ?auto_155193 ?auto_155194 ?auto_155195 ?auto_155196 ?auto_155197 ?auto_155198 ?auto_155199 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_155202 - BLOCK
      ?auto_155203 - BLOCK
      ?auto_155204 - BLOCK
      ?auto_155205 - BLOCK
      ?auto_155206 - BLOCK
      ?auto_155207 - BLOCK
      ?auto_155208 - BLOCK
    )
    :vars
    (
      ?auto_155210 - BLOCK
      ?auto_155209 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155202 ) ( ON ?auto_155203 ?auto_155202 ) ( not ( = ?auto_155202 ?auto_155203 ) ) ( not ( = ?auto_155202 ?auto_155204 ) ) ( not ( = ?auto_155202 ?auto_155205 ) ) ( not ( = ?auto_155202 ?auto_155206 ) ) ( not ( = ?auto_155202 ?auto_155207 ) ) ( not ( = ?auto_155202 ?auto_155208 ) ) ( not ( = ?auto_155202 ?auto_155210 ) ) ( not ( = ?auto_155203 ?auto_155204 ) ) ( not ( = ?auto_155203 ?auto_155205 ) ) ( not ( = ?auto_155203 ?auto_155206 ) ) ( not ( = ?auto_155203 ?auto_155207 ) ) ( not ( = ?auto_155203 ?auto_155208 ) ) ( not ( = ?auto_155203 ?auto_155210 ) ) ( not ( = ?auto_155204 ?auto_155205 ) ) ( not ( = ?auto_155204 ?auto_155206 ) ) ( not ( = ?auto_155204 ?auto_155207 ) ) ( not ( = ?auto_155204 ?auto_155208 ) ) ( not ( = ?auto_155204 ?auto_155210 ) ) ( not ( = ?auto_155205 ?auto_155206 ) ) ( not ( = ?auto_155205 ?auto_155207 ) ) ( not ( = ?auto_155205 ?auto_155208 ) ) ( not ( = ?auto_155205 ?auto_155210 ) ) ( not ( = ?auto_155206 ?auto_155207 ) ) ( not ( = ?auto_155206 ?auto_155208 ) ) ( not ( = ?auto_155206 ?auto_155210 ) ) ( not ( = ?auto_155207 ?auto_155208 ) ) ( not ( = ?auto_155207 ?auto_155210 ) ) ( not ( = ?auto_155208 ?auto_155210 ) ) ( ON ?auto_155210 ?auto_155209 ) ( not ( = ?auto_155202 ?auto_155209 ) ) ( not ( = ?auto_155203 ?auto_155209 ) ) ( not ( = ?auto_155204 ?auto_155209 ) ) ( not ( = ?auto_155205 ?auto_155209 ) ) ( not ( = ?auto_155206 ?auto_155209 ) ) ( not ( = ?auto_155207 ?auto_155209 ) ) ( not ( = ?auto_155208 ?auto_155209 ) ) ( not ( = ?auto_155210 ?auto_155209 ) ) ( ON ?auto_155208 ?auto_155210 ) ( ON-TABLE ?auto_155209 ) ( ON ?auto_155207 ?auto_155208 ) ( ON ?auto_155206 ?auto_155207 ) ( ON ?auto_155205 ?auto_155206 ) ( CLEAR ?auto_155205 ) ( HOLDING ?auto_155204 ) ( CLEAR ?auto_155203 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_155202 ?auto_155203 ?auto_155204 )
      ( MAKE-7PILE ?auto_155202 ?auto_155203 ?auto_155204 ?auto_155205 ?auto_155206 ?auto_155207 ?auto_155208 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_155211 - BLOCK
      ?auto_155212 - BLOCK
      ?auto_155213 - BLOCK
      ?auto_155214 - BLOCK
      ?auto_155215 - BLOCK
      ?auto_155216 - BLOCK
      ?auto_155217 - BLOCK
    )
    :vars
    (
      ?auto_155218 - BLOCK
      ?auto_155219 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155211 ) ( ON ?auto_155212 ?auto_155211 ) ( not ( = ?auto_155211 ?auto_155212 ) ) ( not ( = ?auto_155211 ?auto_155213 ) ) ( not ( = ?auto_155211 ?auto_155214 ) ) ( not ( = ?auto_155211 ?auto_155215 ) ) ( not ( = ?auto_155211 ?auto_155216 ) ) ( not ( = ?auto_155211 ?auto_155217 ) ) ( not ( = ?auto_155211 ?auto_155218 ) ) ( not ( = ?auto_155212 ?auto_155213 ) ) ( not ( = ?auto_155212 ?auto_155214 ) ) ( not ( = ?auto_155212 ?auto_155215 ) ) ( not ( = ?auto_155212 ?auto_155216 ) ) ( not ( = ?auto_155212 ?auto_155217 ) ) ( not ( = ?auto_155212 ?auto_155218 ) ) ( not ( = ?auto_155213 ?auto_155214 ) ) ( not ( = ?auto_155213 ?auto_155215 ) ) ( not ( = ?auto_155213 ?auto_155216 ) ) ( not ( = ?auto_155213 ?auto_155217 ) ) ( not ( = ?auto_155213 ?auto_155218 ) ) ( not ( = ?auto_155214 ?auto_155215 ) ) ( not ( = ?auto_155214 ?auto_155216 ) ) ( not ( = ?auto_155214 ?auto_155217 ) ) ( not ( = ?auto_155214 ?auto_155218 ) ) ( not ( = ?auto_155215 ?auto_155216 ) ) ( not ( = ?auto_155215 ?auto_155217 ) ) ( not ( = ?auto_155215 ?auto_155218 ) ) ( not ( = ?auto_155216 ?auto_155217 ) ) ( not ( = ?auto_155216 ?auto_155218 ) ) ( not ( = ?auto_155217 ?auto_155218 ) ) ( ON ?auto_155218 ?auto_155219 ) ( not ( = ?auto_155211 ?auto_155219 ) ) ( not ( = ?auto_155212 ?auto_155219 ) ) ( not ( = ?auto_155213 ?auto_155219 ) ) ( not ( = ?auto_155214 ?auto_155219 ) ) ( not ( = ?auto_155215 ?auto_155219 ) ) ( not ( = ?auto_155216 ?auto_155219 ) ) ( not ( = ?auto_155217 ?auto_155219 ) ) ( not ( = ?auto_155218 ?auto_155219 ) ) ( ON ?auto_155217 ?auto_155218 ) ( ON-TABLE ?auto_155219 ) ( ON ?auto_155216 ?auto_155217 ) ( ON ?auto_155215 ?auto_155216 ) ( ON ?auto_155214 ?auto_155215 ) ( CLEAR ?auto_155212 ) ( ON ?auto_155213 ?auto_155214 ) ( CLEAR ?auto_155213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_155219 ?auto_155218 ?auto_155217 ?auto_155216 ?auto_155215 ?auto_155214 )
      ( MAKE-7PILE ?auto_155211 ?auto_155212 ?auto_155213 ?auto_155214 ?auto_155215 ?auto_155216 ?auto_155217 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_155220 - BLOCK
      ?auto_155221 - BLOCK
      ?auto_155222 - BLOCK
      ?auto_155223 - BLOCK
      ?auto_155224 - BLOCK
      ?auto_155225 - BLOCK
      ?auto_155226 - BLOCK
    )
    :vars
    (
      ?auto_155227 - BLOCK
      ?auto_155228 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155220 ) ( not ( = ?auto_155220 ?auto_155221 ) ) ( not ( = ?auto_155220 ?auto_155222 ) ) ( not ( = ?auto_155220 ?auto_155223 ) ) ( not ( = ?auto_155220 ?auto_155224 ) ) ( not ( = ?auto_155220 ?auto_155225 ) ) ( not ( = ?auto_155220 ?auto_155226 ) ) ( not ( = ?auto_155220 ?auto_155227 ) ) ( not ( = ?auto_155221 ?auto_155222 ) ) ( not ( = ?auto_155221 ?auto_155223 ) ) ( not ( = ?auto_155221 ?auto_155224 ) ) ( not ( = ?auto_155221 ?auto_155225 ) ) ( not ( = ?auto_155221 ?auto_155226 ) ) ( not ( = ?auto_155221 ?auto_155227 ) ) ( not ( = ?auto_155222 ?auto_155223 ) ) ( not ( = ?auto_155222 ?auto_155224 ) ) ( not ( = ?auto_155222 ?auto_155225 ) ) ( not ( = ?auto_155222 ?auto_155226 ) ) ( not ( = ?auto_155222 ?auto_155227 ) ) ( not ( = ?auto_155223 ?auto_155224 ) ) ( not ( = ?auto_155223 ?auto_155225 ) ) ( not ( = ?auto_155223 ?auto_155226 ) ) ( not ( = ?auto_155223 ?auto_155227 ) ) ( not ( = ?auto_155224 ?auto_155225 ) ) ( not ( = ?auto_155224 ?auto_155226 ) ) ( not ( = ?auto_155224 ?auto_155227 ) ) ( not ( = ?auto_155225 ?auto_155226 ) ) ( not ( = ?auto_155225 ?auto_155227 ) ) ( not ( = ?auto_155226 ?auto_155227 ) ) ( ON ?auto_155227 ?auto_155228 ) ( not ( = ?auto_155220 ?auto_155228 ) ) ( not ( = ?auto_155221 ?auto_155228 ) ) ( not ( = ?auto_155222 ?auto_155228 ) ) ( not ( = ?auto_155223 ?auto_155228 ) ) ( not ( = ?auto_155224 ?auto_155228 ) ) ( not ( = ?auto_155225 ?auto_155228 ) ) ( not ( = ?auto_155226 ?auto_155228 ) ) ( not ( = ?auto_155227 ?auto_155228 ) ) ( ON ?auto_155226 ?auto_155227 ) ( ON-TABLE ?auto_155228 ) ( ON ?auto_155225 ?auto_155226 ) ( ON ?auto_155224 ?auto_155225 ) ( ON ?auto_155223 ?auto_155224 ) ( ON ?auto_155222 ?auto_155223 ) ( CLEAR ?auto_155222 ) ( HOLDING ?auto_155221 ) ( CLEAR ?auto_155220 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_155220 ?auto_155221 )
      ( MAKE-7PILE ?auto_155220 ?auto_155221 ?auto_155222 ?auto_155223 ?auto_155224 ?auto_155225 ?auto_155226 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_155229 - BLOCK
      ?auto_155230 - BLOCK
      ?auto_155231 - BLOCK
      ?auto_155232 - BLOCK
      ?auto_155233 - BLOCK
      ?auto_155234 - BLOCK
      ?auto_155235 - BLOCK
    )
    :vars
    (
      ?auto_155236 - BLOCK
      ?auto_155237 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155229 ) ( not ( = ?auto_155229 ?auto_155230 ) ) ( not ( = ?auto_155229 ?auto_155231 ) ) ( not ( = ?auto_155229 ?auto_155232 ) ) ( not ( = ?auto_155229 ?auto_155233 ) ) ( not ( = ?auto_155229 ?auto_155234 ) ) ( not ( = ?auto_155229 ?auto_155235 ) ) ( not ( = ?auto_155229 ?auto_155236 ) ) ( not ( = ?auto_155230 ?auto_155231 ) ) ( not ( = ?auto_155230 ?auto_155232 ) ) ( not ( = ?auto_155230 ?auto_155233 ) ) ( not ( = ?auto_155230 ?auto_155234 ) ) ( not ( = ?auto_155230 ?auto_155235 ) ) ( not ( = ?auto_155230 ?auto_155236 ) ) ( not ( = ?auto_155231 ?auto_155232 ) ) ( not ( = ?auto_155231 ?auto_155233 ) ) ( not ( = ?auto_155231 ?auto_155234 ) ) ( not ( = ?auto_155231 ?auto_155235 ) ) ( not ( = ?auto_155231 ?auto_155236 ) ) ( not ( = ?auto_155232 ?auto_155233 ) ) ( not ( = ?auto_155232 ?auto_155234 ) ) ( not ( = ?auto_155232 ?auto_155235 ) ) ( not ( = ?auto_155232 ?auto_155236 ) ) ( not ( = ?auto_155233 ?auto_155234 ) ) ( not ( = ?auto_155233 ?auto_155235 ) ) ( not ( = ?auto_155233 ?auto_155236 ) ) ( not ( = ?auto_155234 ?auto_155235 ) ) ( not ( = ?auto_155234 ?auto_155236 ) ) ( not ( = ?auto_155235 ?auto_155236 ) ) ( ON ?auto_155236 ?auto_155237 ) ( not ( = ?auto_155229 ?auto_155237 ) ) ( not ( = ?auto_155230 ?auto_155237 ) ) ( not ( = ?auto_155231 ?auto_155237 ) ) ( not ( = ?auto_155232 ?auto_155237 ) ) ( not ( = ?auto_155233 ?auto_155237 ) ) ( not ( = ?auto_155234 ?auto_155237 ) ) ( not ( = ?auto_155235 ?auto_155237 ) ) ( not ( = ?auto_155236 ?auto_155237 ) ) ( ON ?auto_155235 ?auto_155236 ) ( ON-TABLE ?auto_155237 ) ( ON ?auto_155234 ?auto_155235 ) ( ON ?auto_155233 ?auto_155234 ) ( ON ?auto_155232 ?auto_155233 ) ( ON ?auto_155231 ?auto_155232 ) ( CLEAR ?auto_155229 ) ( ON ?auto_155230 ?auto_155231 ) ( CLEAR ?auto_155230 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_155237 ?auto_155236 ?auto_155235 ?auto_155234 ?auto_155233 ?auto_155232 ?auto_155231 )
      ( MAKE-7PILE ?auto_155229 ?auto_155230 ?auto_155231 ?auto_155232 ?auto_155233 ?auto_155234 ?auto_155235 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_155238 - BLOCK
      ?auto_155239 - BLOCK
      ?auto_155240 - BLOCK
      ?auto_155241 - BLOCK
      ?auto_155242 - BLOCK
      ?auto_155243 - BLOCK
      ?auto_155244 - BLOCK
    )
    :vars
    (
      ?auto_155246 - BLOCK
      ?auto_155245 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155238 ?auto_155239 ) ) ( not ( = ?auto_155238 ?auto_155240 ) ) ( not ( = ?auto_155238 ?auto_155241 ) ) ( not ( = ?auto_155238 ?auto_155242 ) ) ( not ( = ?auto_155238 ?auto_155243 ) ) ( not ( = ?auto_155238 ?auto_155244 ) ) ( not ( = ?auto_155238 ?auto_155246 ) ) ( not ( = ?auto_155239 ?auto_155240 ) ) ( not ( = ?auto_155239 ?auto_155241 ) ) ( not ( = ?auto_155239 ?auto_155242 ) ) ( not ( = ?auto_155239 ?auto_155243 ) ) ( not ( = ?auto_155239 ?auto_155244 ) ) ( not ( = ?auto_155239 ?auto_155246 ) ) ( not ( = ?auto_155240 ?auto_155241 ) ) ( not ( = ?auto_155240 ?auto_155242 ) ) ( not ( = ?auto_155240 ?auto_155243 ) ) ( not ( = ?auto_155240 ?auto_155244 ) ) ( not ( = ?auto_155240 ?auto_155246 ) ) ( not ( = ?auto_155241 ?auto_155242 ) ) ( not ( = ?auto_155241 ?auto_155243 ) ) ( not ( = ?auto_155241 ?auto_155244 ) ) ( not ( = ?auto_155241 ?auto_155246 ) ) ( not ( = ?auto_155242 ?auto_155243 ) ) ( not ( = ?auto_155242 ?auto_155244 ) ) ( not ( = ?auto_155242 ?auto_155246 ) ) ( not ( = ?auto_155243 ?auto_155244 ) ) ( not ( = ?auto_155243 ?auto_155246 ) ) ( not ( = ?auto_155244 ?auto_155246 ) ) ( ON ?auto_155246 ?auto_155245 ) ( not ( = ?auto_155238 ?auto_155245 ) ) ( not ( = ?auto_155239 ?auto_155245 ) ) ( not ( = ?auto_155240 ?auto_155245 ) ) ( not ( = ?auto_155241 ?auto_155245 ) ) ( not ( = ?auto_155242 ?auto_155245 ) ) ( not ( = ?auto_155243 ?auto_155245 ) ) ( not ( = ?auto_155244 ?auto_155245 ) ) ( not ( = ?auto_155246 ?auto_155245 ) ) ( ON ?auto_155244 ?auto_155246 ) ( ON-TABLE ?auto_155245 ) ( ON ?auto_155243 ?auto_155244 ) ( ON ?auto_155242 ?auto_155243 ) ( ON ?auto_155241 ?auto_155242 ) ( ON ?auto_155240 ?auto_155241 ) ( ON ?auto_155239 ?auto_155240 ) ( CLEAR ?auto_155239 ) ( HOLDING ?auto_155238 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_155238 )
      ( MAKE-7PILE ?auto_155238 ?auto_155239 ?auto_155240 ?auto_155241 ?auto_155242 ?auto_155243 ?auto_155244 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_155247 - BLOCK
      ?auto_155248 - BLOCK
      ?auto_155249 - BLOCK
      ?auto_155250 - BLOCK
      ?auto_155251 - BLOCK
      ?auto_155252 - BLOCK
      ?auto_155253 - BLOCK
    )
    :vars
    (
      ?auto_155255 - BLOCK
      ?auto_155254 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155247 ?auto_155248 ) ) ( not ( = ?auto_155247 ?auto_155249 ) ) ( not ( = ?auto_155247 ?auto_155250 ) ) ( not ( = ?auto_155247 ?auto_155251 ) ) ( not ( = ?auto_155247 ?auto_155252 ) ) ( not ( = ?auto_155247 ?auto_155253 ) ) ( not ( = ?auto_155247 ?auto_155255 ) ) ( not ( = ?auto_155248 ?auto_155249 ) ) ( not ( = ?auto_155248 ?auto_155250 ) ) ( not ( = ?auto_155248 ?auto_155251 ) ) ( not ( = ?auto_155248 ?auto_155252 ) ) ( not ( = ?auto_155248 ?auto_155253 ) ) ( not ( = ?auto_155248 ?auto_155255 ) ) ( not ( = ?auto_155249 ?auto_155250 ) ) ( not ( = ?auto_155249 ?auto_155251 ) ) ( not ( = ?auto_155249 ?auto_155252 ) ) ( not ( = ?auto_155249 ?auto_155253 ) ) ( not ( = ?auto_155249 ?auto_155255 ) ) ( not ( = ?auto_155250 ?auto_155251 ) ) ( not ( = ?auto_155250 ?auto_155252 ) ) ( not ( = ?auto_155250 ?auto_155253 ) ) ( not ( = ?auto_155250 ?auto_155255 ) ) ( not ( = ?auto_155251 ?auto_155252 ) ) ( not ( = ?auto_155251 ?auto_155253 ) ) ( not ( = ?auto_155251 ?auto_155255 ) ) ( not ( = ?auto_155252 ?auto_155253 ) ) ( not ( = ?auto_155252 ?auto_155255 ) ) ( not ( = ?auto_155253 ?auto_155255 ) ) ( ON ?auto_155255 ?auto_155254 ) ( not ( = ?auto_155247 ?auto_155254 ) ) ( not ( = ?auto_155248 ?auto_155254 ) ) ( not ( = ?auto_155249 ?auto_155254 ) ) ( not ( = ?auto_155250 ?auto_155254 ) ) ( not ( = ?auto_155251 ?auto_155254 ) ) ( not ( = ?auto_155252 ?auto_155254 ) ) ( not ( = ?auto_155253 ?auto_155254 ) ) ( not ( = ?auto_155255 ?auto_155254 ) ) ( ON ?auto_155253 ?auto_155255 ) ( ON-TABLE ?auto_155254 ) ( ON ?auto_155252 ?auto_155253 ) ( ON ?auto_155251 ?auto_155252 ) ( ON ?auto_155250 ?auto_155251 ) ( ON ?auto_155249 ?auto_155250 ) ( ON ?auto_155248 ?auto_155249 ) ( ON ?auto_155247 ?auto_155248 ) ( CLEAR ?auto_155247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_155254 ?auto_155255 ?auto_155253 ?auto_155252 ?auto_155251 ?auto_155250 ?auto_155249 ?auto_155248 )
      ( MAKE-7PILE ?auto_155247 ?auto_155248 ?auto_155249 ?auto_155250 ?auto_155251 ?auto_155252 ?auto_155253 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155257 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_155257 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_155257 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155258 - BLOCK
    )
    :vars
    (
      ?auto_155259 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155258 ?auto_155259 ) ( CLEAR ?auto_155258 ) ( HAND-EMPTY ) ( not ( = ?auto_155258 ?auto_155259 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_155258 ?auto_155259 )
      ( MAKE-1PILE ?auto_155258 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155260 - BLOCK
    )
    :vars
    (
      ?auto_155261 - BLOCK
      ?auto_155266 - BLOCK
      ?auto_155264 - BLOCK
      ?auto_155263 - BLOCK
      ?auto_155262 - BLOCK
      ?auto_155267 - BLOCK
      ?auto_155265 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155260 ?auto_155261 ) ) ( HOLDING ?auto_155260 ) ( CLEAR ?auto_155261 ) ( ON-TABLE ?auto_155266 ) ( ON ?auto_155264 ?auto_155266 ) ( ON ?auto_155263 ?auto_155264 ) ( ON ?auto_155262 ?auto_155263 ) ( ON ?auto_155267 ?auto_155262 ) ( ON ?auto_155265 ?auto_155267 ) ( ON ?auto_155261 ?auto_155265 ) ( not ( = ?auto_155266 ?auto_155264 ) ) ( not ( = ?auto_155266 ?auto_155263 ) ) ( not ( = ?auto_155266 ?auto_155262 ) ) ( not ( = ?auto_155266 ?auto_155267 ) ) ( not ( = ?auto_155266 ?auto_155265 ) ) ( not ( = ?auto_155266 ?auto_155261 ) ) ( not ( = ?auto_155266 ?auto_155260 ) ) ( not ( = ?auto_155264 ?auto_155263 ) ) ( not ( = ?auto_155264 ?auto_155262 ) ) ( not ( = ?auto_155264 ?auto_155267 ) ) ( not ( = ?auto_155264 ?auto_155265 ) ) ( not ( = ?auto_155264 ?auto_155261 ) ) ( not ( = ?auto_155264 ?auto_155260 ) ) ( not ( = ?auto_155263 ?auto_155262 ) ) ( not ( = ?auto_155263 ?auto_155267 ) ) ( not ( = ?auto_155263 ?auto_155265 ) ) ( not ( = ?auto_155263 ?auto_155261 ) ) ( not ( = ?auto_155263 ?auto_155260 ) ) ( not ( = ?auto_155262 ?auto_155267 ) ) ( not ( = ?auto_155262 ?auto_155265 ) ) ( not ( = ?auto_155262 ?auto_155261 ) ) ( not ( = ?auto_155262 ?auto_155260 ) ) ( not ( = ?auto_155267 ?auto_155265 ) ) ( not ( = ?auto_155267 ?auto_155261 ) ) ( not ( = ?auto_155267 ?auto_155260 ) ) ( not ( = ?auto_155265 ?auto_155261 ) ) ( not ( = ?auto_155265 ?auto_155260 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_155266 ?auto_155264 ?auto_155263 ?auto_155262 ?auto_155267 ?auto_155265 ?auto_155261 ?auto_155260 )
      ( MAKE-1PILE ?auto_155260 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155268 - BLOCK
    )
    :vars
    (
      ?auto_155272 - BLOCK
      ?auto_155271 - BLOCK
      ?auto_155270 - BLOCK
      ?auto_155274 - BLOCK
      ?auto_155275 - BLOCK
      ?auto_155269 - BLOCK
      ?auto_155273 - BLOCK
      ?auto_155276 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155268 ?auto_155272 ) ) ( CLEAR ?auto_155272 ) ( ON-TABLE ?auto_155271 ) ( ON ?auto_155270 ?auto_155271 ) ( ON ?auto_155274 ?auto_155270 ) ( ON ?auto_155275 ?auto_155274 ) ( ON ?auto_155269 ?auto_155275 ) ( ON ?auto_155273 ?auto_155269 ) ( ON ?auto_155272 ?auto_155273 ) ( not ( = ?auto_155271 ?auto_155270 ) ) ( not ( = ?auto_155271 ?auto_155274 ) ) ( not ( = ?auto_155271 ?auto_155275 ) ) ( not ( = ?auto_155271 ?auto_155269 ) ) ( not ( = ?auto_155271 ?auto_155273 ) ) ( not ( = ?auto_155271 ?auto_155272 ) ) ( not ( = ?auto_155271 ?auto_155268 ) ) ( not ( = ?auto_155270 ?auto_155274 ) ) ( not ( = ?auto_155270 ?auto_155275 ) ) ( not ( = ?auto_155270 ?auto_155269 ) ) ( not ( = ?auto_155270 ?auto_155273 ) ) ( not ( = ?auto_155270 ?auto_155272 ) ) ( not ( = ?auto_155270 ?auto_155268 ) ) ( not ( = ?auto_155274 ?auto_155275 ) ) ( not ( = ?auto_155274 ?auto_155269 ) ) ( not ( = ?auto_155274 ?auto_155273 ) ) ( not ( = ?auto_155274 ?auto_155272 ) ) ( not ( = ?auto_155274 ?auto_155268 ) ) ( not ( = ?auto_155275 ?auto_155269 ) ) ( not ( = ?auto_155275 ?auto_155273 ) ) ( not ( = ?auto_155275 ?auto_155272 ) ) ( not ( = ?auto_155275 ?auto_155268 ) ) ( not ( = ?auto_155269 ?auto_155273 ) ) ( not ( = ?auto_155269 ?auto_155272 ) ) ( not ( = ?auto_155269 ?auto_155268 ) ) ( not ( = ?auto_155273 ?auto_155272 ) ) ( not ( = ?auto_155273 ?auto_155268 ) ) ( ON ?auto_155268 ?auto_155276 ) ( CLEAR ?auto_155268 ) ( HAND-EMPTY ) ( not ( = ?auto_155268 ?auto_155276 ) ) ( not ( = ?auto_155272 ?auto_155276 ) ) ( not ( = ?auto_155271 ?auto_155276 ) ) ( not ( = ?auto_155270 ?auto_155276 ) ) ( not ( = ?auto_155274 ?auto_155276 ) ) ( not ( = ?auto_155275 ?auto_155276 ) ) ( not ( = ?auto_155269 ?auto_155276 ) ) ( not ( = ?auto_155273 ?auto_155276 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_155268 ?auto_155276 )
      ( MAKE-1PILE ?auto_155268 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155277 - BLOCK
    )
    :vars
    (
      ?auto_155282 - BLOCK
      ?auto_155281 - BLOCK
      ?auto_155279 - BLOCK
      ?auto_155283 - BLOCK
      ?auto_155278 - BLOCK
      ?auto_155284 - BLOCK
      ?auto_155285 - BLOCK
      ?auto_155280 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155277 ?auto_155282 ) ) ( ON-TABLE ?auto_155281 ) ( ON ?auto_155279 ?auto_155281 ) ( ON ?auto_155283 ?auto_155279 ) ( ON ?auto_155278 ?auto_155283 ) ( ON ?auto_155284 ?auto_155278 ) ( ON ?auto_155285 ?auto_155284 ) ( not ( = ?auto_155281 ?auto_155279 ) ) ( not ( = ?auto_155281 ?auto_155283 ) ) ( not ( = ?auto_155281 ?auto_155278 ) ) ( not ( = ?auto_155281 ?auto_155284 ) ) ( not ( = ?auto_155281 ?auto_155285 ) ) ( not ( = ?auto_155281 ?auto_155282 ) ) ( not ( = ?auto_155281 ?auto_155277 ) ) ( not ( = ?auto_155279 ?auto_155283 ) ) ( not ( = ?auto_155279 ?auto_155278 ) ) ( not ( = ?auto_155279 ?auto_155284 ) ) ( not ( = ?auto_155279 ?auto_155285 ) ) ( not ( = ?auto_155279 ?auto_155282 ) ) ( not ( = ?auto_155279 ?auto_155277 ) ) ( not ( = ?auto_155283 ?auto_155278 ) ) ( not ( = ?auto_155283 ?auto_155284 ) ) ( not ( = ?auto_155283 ?auto_155285 ) ) ( not ( = ?auto_155283 ?auto_155282 ) ) ( not ( = ?auto_155283 ?auto_155277 ) ) ( not ( = ?auto_155278 ?auto_155284 ) ) ( not ( = ?auto_155278 ?auto_155285 ) ) ( not ( = ?auto_155278 ?auto_155282 ) ) ( not ( = ?auto_155278 ?auto_155277 ) ) ( not ( = ?auto_155284 ?auto_155285 ) ) ( not ( = ?auto_155284 ?auto_155282 ) ) ( not ( = ?auto_155284 ?auto_155277 ) ) ( not ( = ?auto_155285 ?auto_155282 ) ) ( not ( = ?auto_155285 ?auto_155277 ) ) ( ON ?auto_155277 ?auto_155280 ) ( CLEAR ?auto_155277 ) ( not ( = ?auto_155277 ?auto_155280 ) ) ( not ( = ?auto_155282 ?auto_155280 ) ) ( not ( = ?auto_155281 ?auto_155280 ) ) ( not ( = ?auto_155279 ?auto_155280 ) ) ( not ( = ?auto_155283 ?auto_155280 ) ) ( not ( = ?auto_155278 ?auto_155280 ) ) ( not ( = ?auto_155284 ?auto_155280 ) ) ( not ( = ?auto_155285 ?auto_155280 ) ) ( HOLDING ?auto_155282 ) ( CLEAR ?auto_155285 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_155281 ?auto_155279 ?auto_155283 ?auto_155278 ?auto_155284 ?auto_155285 ?auto_155282 )
      ( MAKE-1PILE ?auto_155277 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155286 - BLOCK
    )
    :vars
    (
      ?auto_155290 - BLOCK
      ?auto_155288 - BLOCK
      ?auto_155287 - BLOCK
      ?auto_155293 - BLOCK
      ?auto_155289 - BLOCK
      ?auto_155294 - BLOCK
      ?auto_155291 - BLOCK
      ?auto_155292 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155286 ?auto_155290 ) ) ( ON-TABLE ?auto_155288 ) ( ON ?auto_155287 ?auto_155288 ) ( ON ?auto_155293 ?auto_155287 ) ( ON ?auto_155289 ?auto_155293 ) ( ON ?auto_155294 ?auto_155289 ) ( ON ?auto_155291 ?auto_155294 ) ( not ( = ?auto_155288 ?auto_155287 ) ) ( not ( = ?auto_155288 ?auto_155293 ) ) ( not ( = ?auto_155288 ?auto_155289 ) ) ( not ( = ?auto_155288 ?auto_155294 ) ) ( not ( = ?auto_155288 ?auto_155291 ) ) ( not ( = ?auto_155288 ?auto_155290 ) ) ( not ( = ?auto_155288 ?auto_155286 ) ) ( not ( = ?auto_155287 ?auto_155293 ) ) ( not ( = ?auto_155287 ?auto_155289 ) ) ( not ( = ?auto_155287 ?auto_155294 ) ) ( not ( = ?auto_155287 ?auto_155291 ) ) ( not ( = ?auto_155287 ?auto_155290 ) ) ( not ( = ?auto_155287 ?auto_155286 ) ) ( not ( = ?auto_155293 ?auto_155289 ) ) ( not ( = ?auto_155293 ?auto_155294 ) ) ( not ( = ?auto_155293 ?auto_155291 ) ) ( not ( = ?auto_155293 ?auto_155290 ) ) ( not ( = ?auto_155293 ?auto_155286 ) ) ( not ( = ?auto_155289 ?auto_155294 ) ) ( not ( = ?auto_155289 ?auto_155291 ) ) ( not ( = ?auto_155289 ?auto_155290 ) ) ( not ( = ?auto_155289 ?auto_155286 ) ) ( not ( = ?auto_155294 ?auto_155291 ) ) ( not ( = ?auto_155294 ?auto_155290 ) ) ( not ( = ?auto_155294 ?auto_155286 ) ) ( not ( = ?auto_155291 ?auto_155290 ) ) ( not ( = ?auto_155291 ?auto_155286 ) ) ( ON ?auto_155286 ?auto_155292 ) ( not ( = ?auto_155286 ?auto_155292 ) ) ( not ( = ?auto_155290 ?auto_155292 ) ) ( not ( = ?auto_155288 ?auto_155292 ) ) ( not ( = ?auto_155287 ?auto_155292 ) ) ( not ( = ?auto_155293 ?auto_155292 ) ) ( not ( = ?auto_155289 ?auto_155292 ) ) ( not ( = ?auto_155294 ?auto_155292 ) ) ( not ( = ?auto_155291 ?auto_155292 ) ) ( CLEAR ?auto_155291 ) ( ON ?auto_155290 ?auto_155286 ) ( CLEAR ?auto_155290 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_155292 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_155292 ?auto_155286 )
      ( MAKE-1PILE ?auto_155286 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155295 - BLOCK
    )
    :vars
    (
      ?auto_155299 - BLOCK
      ?auto_155298 - BLOCK
      ?auto_155300 - BLOCK
      ?auto_155301 - BLOCK
      ?auto_155297 - BLOCK
      ?auto_155303 - BLOCK
      ?auto_155302 - BLOCK
      ?auto_155296 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155295 ?auto_155299 ) ) ( ON-TABLE ?auto_155298 ) ( ON ?auto_155300 ?auto_155298 ) ( ON ?auto_155301 ?auto_155300 ) ( ON ?auto_155297 ?auto_155301 ) ( ON ?auto_155303 ?auto_155297 ) ( not ( = ?auto_155298 ?auto_155300 ) ) ( not ( = ?auto_155298 ?auto_155301 ) ) ( not ( = ?auto_155298 ?auto_155297 ) ) ( not ( = ?auto_155298 ?auto_155303 ) ) ( not ( = ?auto_155298 ?auto_155302 ) ) ( not ( = ?auto_155298 ?auto_155299 ) ) ( not ( = ?auto_155298 ?auto_155295 ) ) ( not ( = ?auto_155300 ?auto_155301 ) ) ( not ( = ?auto_155300 ?auto_155297 ) ) ( not ( = ?auto_155300 ?auto_155303 ) ) ( not ( = ?auto_155300 ?auto_155302 ) ) ( not ( = ?auto_155300 ?auto_155299 ) ) ( not ( = ?auto_155300 ?auto_155295 ) ) ( not ( = ?auto_155301 ?auto_155297 ) ) ( not ( = ?auto_155301 ?auto_155303 ) ) ( not ( = ?auto_155301 ?auto_155302 ) ) ( not ( = ?auto_155301 ?auto_155299 ) ) ( not ( = ?auto_155301 ?auto_155295 ) ) ( not ( = ?auto_155297 ?auto_155303 ) ) ( not ( = ?auto_155297 ?auto_155302 ) ) ( not ( = ?auto_155297 ?auto_155299 ) ) ( not ( = ?auto_155297 ?auto_155295 ) ) ( not ( = ?auto_155303 ?auto_155302 ) ) ( not ( = ?auto_155303 ?auto_155299 ) ) ( not ( = ?auto_155303 ?auto_155295 ) ) ( not ( = ?auto_155302 ?auto_155299 ) ) ( not ( = ?auto_155302 ?auto_155295 ) ) ( ON ?auto_155295 ?auto_155296 ) ( not ( = ?auto_155295 ?auto_155296 ) ) ( not ( = ?auto_155299 ?auto_155296 ) ) ( not ( = ?auto_155298 ?auto_155296 ) ) ( not ( = ?auto_155300 ?auto_155296 ) ) ( not ( = ?auto_155301 ?auto_155296 ) ) ( not ( = ?auto_155297 ?auto_155296 ) ) ( not ( = ?auto_155303 ?auto_155296 ) ) ( not ( = ?auto_155302 ?auto_155296 ) ) ( ON ?auto_155299 ?auto_155295 ) ( CLEAR ?auto_155299 ) ( ON-TABLE ?auto_155296 ) ( HOLDING ?auto_155302 ) ( CLEAR ?auto_155303 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_155298 ?auto_155300 ?auto_155301 ?auto_155297 ?auto_155303 ?auto_155302 )
      ( MAKE-1PILE ?auto_155295 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155304 - BLOCK
    )
    :vars
    (
      ?auto_155310 - BLOCK
      ?auto_155305 - BLOCK
      ?auto_155311 - BLOCK
      ?auto_155309 - BLOCK
      ?auto_155308 - BLOCK
      ?auto_155312 - BLOCK
      ?auto_155307 - BLOCK
      ?auto_155306 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155304 ?auto_155310 ) ) ( ON-TABLE ?auto_155305 ) ( ON ?auto_155311 ?auto_155305 ) ( ON ?auto_155309 ?auto_155311 ) ( ON ?auto_155308 ?auto_155309 ) ( ON ?auto_155312 ?auto_155308 ) ( not ( = ?auto_155305 ?auto_155311 ) ) ( not ( = ?auto_155305 ?auto_155309 ) ) ( not ( = ?auto_155305 ?auto_155308 ) ) ( not ( = ?auto_155305 ?auto_155312 ) ) ( not ( = ?auto_155305 ?auto_155307 ) ) ( not ( = ?auto_155305 ?auto_155310 ) ) ( not ( = ?auto_155305 ?auto_155304 ) ) ( not ( = ?auto_155311 ?auto_155309 ) ) ( not ( = ?auto_155311 ?auto_155308 ) ) ( not ( = ?auto_155311 ?auto_155312 ) ) ( not ( = ?auto_155311 ?auto_155307 ) ) ( not ( = ?auto_155311 ?auto_155310 ) ) ( not ( = ?auto_155311 ?auto_155304 ) ) ( not ( = ?auto_155309 ?auto_155308 ) ) ( not ( = ?auto_155309 ?auto_155312 ) ) ( not ( = ?auto_155309 ?auto_155307 ) ) ( not ( = ?auto_155309 ?auto_155310 ) ) ( not ( = ?auto_155309 ?auto_155304 ) ) ( not ( = ?auto_155308 ?auto_155312 ) ) ( not ( = ?auto_155308 ?auto_155307 ) ) ( not ( = ?auto_155308 ?auto_155310 ) ) ( not ( = ?auto_155308 ?auto_155304 ) ) ( not ( = ?auto_155312 ?auto_155307 ) ) ( not ( = ?auto_155312 ?auto_155310 ) ) ( not ( = ?auto_155312 ?auto_155304 ) ) ( not ( = ?auto_155307 ?auto_155310 ) ) ( not ( = ?auto_155307 ?auto_155304 ) ) ( ON ?auto_155304 ?auto_155306 ) ( not ( = ?auto_155304 ?auto_155306 ) ) ( not ( = ?auto_155310 ?auto_155306 ) ) ( not ( = ?auto_155305 ?auto_155306 ) ) ( not ( = ?auto_155311 ?auto_155306 ) ) ( not ( = ?auto_155309 ?auto_155306 ) ) ( not ( = ?auto_155308 ?auto_155306 ) ) ( not ( = ?auto_155312 ?auto_155306 ) ) ( not ( = ?auto_155307 ?auto_155306 ) ) ( ON ?auto_155310 ?auto_155304 ) ( ON-TABLE ?auto_155306 ) ( CLEAR ?auto_155312 ) ( ON ?auto_155307 ?auto_155310 ) ( CLEAR ?auto_155307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_155306 ?auto_155304 ?auto_155310 )
      ( MAKE-1PILE ?auto_155304 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155313 - BLOCK
    )
    :vars
    (
      ?auto_155316 - BLOCK
      ?auto_155317 - BLOCK
      ?auto_155318 - BLOCK
      ?auto_155321 - BLOCK
      ?auto_155314 - BLOCK
      ?auto_155319 - BLOCK
      ?auto_155315 - BLOCK
      ?auto_155320 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155313 ?auto_155316 ) ) ( ON-TABLE ?auto_155317 ) ( ON ?auto_155318 ?auto_155317 ) ( ON ?auto_155321 ?auto_155318 ) ( ON ?auto_155314 ?auto_155321 ) ( not ( = ?auto_155317 ?auto_155318 ) ) ( not ( = ?auto_155317 ?auto_155321 ) ) ( not ( = ?auto_155317 ?auto_155314 ) ) ( not ( = ?auto_155317 ?auto_155319 ) ) ( not ( = ?auto_155317 ?auto_155315 ) ) ( not ( = ?auto_155317 ?auto_155316 ) ) ( not ( = ?auto_155317 ?auto_155313 ) ) ( not ( = ?auto_155318 ?auto_155321 ) ) ( not ( = ?auto_155318 ?auto_155314 ) ) ( not ( = ?auto_155318 ?auto_155319 ) ) ( not ( = ?auto_155318 ?auto_155315 ) ) ( not ( = ?auto_155318 ?auto_155316 ) ) ( not ( = ?auto_155318 ?auto_155313 ) ) ( not ( = ?auto_155321 ?auto_155314 ) ) ( not ( = ?auto_155321 ?auto_155319 ) ) ( not ( = ?auto_155321 ?auto_155315 ) ) ( not ( = ?auto_155321 ?auto_155316 ) ) ( not ( = ?auto_155321 ?auto_155313 ) ) ( not ( = ?auto_155314 ?auto_155319 ) ) ( not ( = ?auto_155314 ?auto_155315 ) ) ( not ( = ?auto_155314 ?auto_155316 ) ) ( not ( = ?auto_155314 ?auto_155313 ) ) ( not ( = ?auto_155319 ?auto_155315 ) ) ( not ( = ?auto_155319 ?auto_155316 ) ) ( not ( = ?auto_155319 ?auto_155313 ) ) ( not ( = ?auto_155315 ?auto_155316 ) ) ( not ( = ?auto_155315 ?auto_155313 ) ) ( ON ?auto_155313 ?auto_155320 ) ( not ( = ?auto_155313 ?auto_155320 ) ) ( not ( = ?auto_155316 ?auto_155320 ) ) ( not ( = ?auto_155317 ?auto_155320 ) ) ( not ( = ?auto_155318 ?auto_155320 ) ) ( not ( = ?auto_155321 ?auto_155320 ) ) ( not ( = ?auto_155314 ?auto_155320 ) ) ( not ( = ?auto_155319 ?auto_155320 ) ) ( not ( = ?auto_155315 ?auto_155320 ) ) ( ON ?auto_155316 ?auto_155313 ) ( ON-TABLE ?auto_155320 ) ( ON ?auto_155315 ?auto_155316 ) ( CLEAR ?auto_155315 ) ( HOLDING ?auto_155319 ) ( CLEAR ?auto_155314 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_155317 ?auto_155318 ?auto_155321 ?auto_155314 ?auto_155319 )
      ( MAKE-1PILE ?auto_155313 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155322 - BLOCK
    )
    :vars
    (
      ?auto_155328 - BLOCK
      ?auto_155330 - BLOCK
      ?auto_155329 - BLOCK
      ?auto_155323 - BLOCK
      ?auto_155327 - BLOCK
      ?auto_155324 - BLOCK
      ?auto_155325 - BLOCK
      ?auto_155326 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155322 ?auto_155328 ) ) ( ON-TABLE ?auto_155330 ) ( ON ?auto_155329 ?auto_155330 ) ( ON ?auto_155323 ?auto_155329 ) ( ON ?auto_155327 ?auto_155323 ) ( not ( = ?auto_155330 ?auto_155329 ) ) ( not ( = ?auto_155330 ?auto_155323 ) ) ( not ( = ?auto_155330 ?auto_155327 ) ) ( not ( = ?auto_155330 ?auto_155324 ) ) ( not ( = ?auto_155330 ?auto_155325 ) ) ( not ( = ?auto_155330 ?auto_155328 ) ) ( not ( = ?auto_155330 ?auto_155322 ) ) ( not ( = ?auto_155329 ?auto_155323 ) ) ( not ( = ?auto_155329 ?auto_155327 ) ) ( not ( = ?auto_155329 ?auto_155324 ) ) ( not ( = ?auto_155329 ?auto_155325 ) ) ( not ( = ?auto_155329 ?auto_155328 ) ) ( not ( = ?auto_155329 ?auto_155322 ) ) ( not ( = ?auto_155323 ?auto_155327 ) ) ( not ( = ?auto_155323 ?auto_155324 ) ) ( not ( = ?auto_155323 ?auto_155325 ) ) ( not ( = ?auto_155323 ?auto_155328 ) ) ( not ( = ?auto_155323 ?auto_155322 ) ) ( not ( = ?auto_155327 ?auto_155324 ) ) ( not ( = ?auto_155327 ?auto_155325 ) ) ( not ( = ?auto_155327 ?auto_155328 ) ) ( not ( = ?auto_155327 ?auto_155322 ) ) ( not ( = ?auto_155324 ?auto_155325 ) ) ( not ( = ?auto_155324 ?auto_155328 ) ) ( not ( = ?auto_155324 ?auto_155322 ) ) ( not ( = ?auto_155325 ?auto_155328 ) ) ( not ( = ?auto_155325 ?auto_155322 ) ) ( ON ?auto_155322 ?auto_155326 ) ( not ( = ?auto_155322 ?auto_155326 ) ) ( not ( = ?auto_155328 ?auto_155326 ) ) ( not ( = ?auto_155330 ?auto_155326 ) ) ( not ( = ?auto_155329 ?auto_155326 ) ) ( not ( = ?auto_155323 ?auto_155326 ) ) ( not ( = ?auto_155327 ?auto_155326 ) ) ( not ( = ?auto_155324 ?auto_155326 ) ) ( not ( = ?auto_155325 ?auto_155326 ) ) ( ON ?auto_155328 ?auto_155322 ) ( ON-TABLE ?auto_155326 ) ( ON ?auto_155325 ?auto_155328 ) ( CLEAR ?auto_155327 ) ( ON ?auto_155324 ?auto_155325 ) ( CLEAR ?auto_155324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_155326 ?auto_155322 ?auto_155328 ?auto_155325 )
      ( MAKE-1PILE ?auto_155322 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155331 - BLOCK
    )
    :vars
    (
      ?auto_155339 - BLOCK
      ?auto_155334 - BLOCK
      ?auto_155337 - BLOCK
      ?auto_155333 - BLOCK
      ?auto_155338 - BLOCK
      ?auto_155336 - BLOCK
      ?auto_155335 - BLOCK
      ?auto_155332 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155331 ?auto_155339 ) ) ( ON-TABLE ?auto_155334 ) ( ON ?auto_155337 ?auto_155334 ) ( ON ?auto_155333 ?auto_155337 ) ( not ( = ?auto_155334 ?auto_155337 ) ) ( not ( = ?auto_155334 ?auto_155333 ) ) ( not ( = ?auto_155334 ?auto_155338 ) ) ( not ( = ?auto_155334 ?auto_155336 ) ) ( not ( = ?auto_155334 ?auto_155335 ) ) ( not ( = ?auto_155334 ?auto_155339 ) ) ( not ( = ?auto_155334 ?auto_155331 ) ) ( not ( = ?auto_155337 ?auto_155333 ) ) ( not ( = ?auto_155337 ?auto_155338 ) ) ( not ( = ?auto_155337 ?auto_155336 ) ) ( not ( = ?auto_155337 ?auto_155335 ) ) ( not ( = ?auto_155337 ?auto_155339 ) ) ( not ( = ?auto_155337 ?auto_155331 ) ) ( not ( = ?auto_155333 ?auto_155338 ) ) ( not ( = ?auto_155333 ?auto_155336 ) ) ( not ( = ?auto_155333 ?auto_155335 ) ) ( not ( = ?auto_155333 ?auto_155339 ) ) ( not ( = ?auto_155333 ?auto_155331 ) ) ( not ( = ?auto_155338 ?auto_155336 ) ) ( not ( = ?auto_155338 ?auto_155335 ) ) ( not ( = ?auto_155338 ?auto_155339 ) ) ( not ( = ?auto_155338 ?auto_155331 ) ) ( not ( = ?auto_155336 ?auto_155335 ) ) ( not ( = ?auto_155336 ?auto_155339 ) ) ( not ( = ?auto_155336 ?auto_155331 ) ) ( not ( = ?auto_155335 ?auto_155339 ) ) ( not ( = ?auto_155335 ?auto_155331 ) ) ( ON ?auto_155331 ?auto_155332 ) ( not ( = ?auto_155331 ?auto_155332 ) ) ( not ( = ?auto_155339 ?auto_155332 ) ) ( not ( = ?auto_155334 ?auto_155332 ) ) ( not ( = ?auto_155337 ?auto_155332 ) ) ( not ( = ?auto_155333 ?auto_155332 ) ) ( not ( = ?auto_155338 ?auto_155332 ) ) ( not ( = ?auto_155336 ?auto_155332 ) ) ( not ( = ?auto_155335 ?auto_155332 ) ) ( ON ?auto_155339 ?auto_155331 ) ( ON-TABLE ?auto_155332 ) ( ON ?auto_155335 ?auto_155339 ) ( ON ?auto_155336 ?auto_155335 ) ( CLEAR ?auto_155336 ) ( HOLDING ?auto_155338 ) ( CLEAR ?auto_155333 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_155334 ?auto_155337 ?auto_155333 ?auto_155338 )
      ( MAKE-1PILE ?auto_155331 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155340 - BLOCK
    )
    :vars
    (
      ?auto_155342 - BLOCK
      ?auto_155348 - BLOCK
      ?auto_155345 - BLOCK
      ?auto_155341 - BLOCK
      ?auto_155344 - BLOCK
      ?auto_155346 - BLOCK
      ?auto_155347 - BLOCK
      ?auto_155343 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155340 ?auto_155342 ) ) ( ON-TABLE ?auto_155348 ) ( ON ?auto_155345 ?auto_155348 ) ( ON ?auto_155341 ?auto_155345 ) ( not ( = ?auto_155348 ?auto_155345 ) ) ( not ( = ?auto_155348 ?auto_155341 ) ) ( not ( = ?auto_155348 ?auto_155344 ) ) ( not ( = ?auto_155348 ?auto_155346 ) ) ( not ( = ?auto_155348 ?auto_155347 ) ) ( not ( = ?auto_155348 ?auto_155342 ) ) ( not ( = ?auto_155348 ?auto_155340 ) ) ( not ( = ?auto_155345 ?auto_155341 ) ) ( not ( = ?auto_155345 ?auto_155344 ) ) ( not ( = ?auto_155345 ?auto_155346 ) ) ( not ( = ?auto_155345 ?auto_155347 ) ) ( not ( = ?auto_155345 ?auto_155342 ) ) ( not ( = ?auto_155345 ?auto_155340 ) ) ( not ( = ?auto_155341 ?auto_155344 ) ) ( not ( = ?auto_155341 ?auto_155346 ) ) ( not ( = ?auto_155341 ?auto_155347 ) ) ( not ( = ?auto_155341 ?auto_155342 ) ) ( not ( = ?auto_155341 ?auto_155340 ) ) ( not ( = ?auto_155344 ?auto_155346 ) ) ( not ( = ?auto_155344 ?auto_155347 ) ) ( not ( = ?auto_155344 ?auto_155342 ) ) ( not ( = ?auto_155344 ?auto_155340 ) ) ( not ( = ?auto_155346 ?auto_155347 ) ) ( not ( = ?auto_155346 ?auto_155342 ) ) ( not ( = ?auto_155346 ?auto_155340 ) ) ( not ( = ?auto_155347 ?auto_155342 ) ) ( not ( = ?auto_155347 ?auto_155340 ) ) ( ON ?auto_155340 ?auto_155343 ) ( not ( = ?auto_155340 ?auto_155343 ) ) ( not ( = ?auto_155342 ?auto_155343 ) ) ( not ( = ?auto_155348 ?auto_155343 ) ) ( not ( = ?auto_155345 ?auto_155343 ) ) ( not ( = ?auto_155341 ?auto_155343 ) ) ( not ( = ?auto_155344 ?auto_155343 ) ) ( not ( = ?auto_155346 ?auto_155343 ) ) ( not ( = ?auto_155347 ?auto_155343 ) ) ( ON ?auto_155342 ?auto_155340 ) ( ON-TABLE ?auto_155343 ) ( ON ?auto_155347 ?auto_155342 ) ( ON ?auto_155346 ?auto_155347 ) ( CLEAR ?auto_155341 ) ( ON ?auto_155344 ?auto_155346 ) ( CLEAR ?auto_155344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_155343 ?auto_155340 ?auto_155342 ?auto_155347 ?auto_155346 )
      ( MAKE-1PILE ?auto_155340 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155349 - BLOCK
    )
    :vars
    (
      ?auto_155354 - BLOCK
      ?auto_155351 - BLOCK
      ?auto_155350 - BLOCK
      ?auto_155356 - BLOCK
      ?auto_155352 - BLOCK
      ?auto_155353 - BLOCK
      ?auto_155357 - BLOCK
      ?auto_155355 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155349 ?auto_155354 ) ) ( ON-TABLE ?auto_155351 ) ( ON ?auto_155350 ?auto_155351 ) ( not ( = ?auto_155351 ?auto_155350 ) ) ( not ( = ?auto_155351 ?auto_155356 ) ) ( not ( = ?auto_155351 ?auto_155352 ) ) ( not ( = ?auto_155351 ?auto_155353 ) ) ( not ( = ?auto_155351 ?auto_155357 ) ) ( not ( = ?auto_155351 ?auto_155354 ) ) ( not ( = ?auto_155351 ?auto_155349 ) ) ( not ( = ?auto_155350 ?auto_155356 ) ) ( not ( = ?auto_155350 ?auto_155352 ) ) ( not ( = ?auto_155350 ?auto_155353 ) ) ( not ( = ?auto_155350 ?auto_155357 ) ) ( not ( = ?auto_155350 ?auto_155354 ) ) ( not ( = ?auto_155350 ?auto_155349 ) ) ( not ( = ?auto_155356 ?auto_155352 ) ) ( not ( = ?auto_155356 ?auto_155353 ) ) ( not ( = ?auto_155356 ?auto_155357 ) ) ( not ( = ?auto_155356 ?auto_155354 ) ) ( not ( = ?auto_155356 ?auto_155349 ) ) ( not ( = ?auto_155352 ?auto_155353 ) ) ( not ( = ?auto_155352 ?auto_155357 ) ) ( not ( = ?auto_155352 ?auto_155354 ) ) ( not ( = ?auto_155352 ?auto_155349 ) ) ( not ( = ?auto_155353 ?auto_155357 ) ) ( not ( = ?auto_155353 ?auto_155354 ) ) ( not ( = ?auto_155353 ?auto_155349 ) ) ( not ( = ?auto_155357 ?auto_155354 ) ) ( not ( = ?auto_155357 ?auto_155349 ) ) ( ON ?auto_155349 ?auto_155355 ) ( not ( = ?auto_155349 ?auto_155355 ) ) ( not ( = ?auto_155354 ?auto_155355 ) ) ( not ( = ?auto_155351 ?auto_155355 ) ) ( not ( = ?auto_155350 ?auto_155355 ) ) ( not ( = ?auto_155356 ?auto_155355 ) ) ( not ( = ?auto_155352 ?auto_155355 ) ) ( not ( = ?auto_155353 ?auto_155355 ) ) ( not ( = ?auto_155357 ?auto_155355 ) ) ( ON ?auto_155354 ?auto_155349 ) ( ON-TABLE ?auto_155355 ) ( ON ?auto_155357 ?auto_155354 ) ( ON ?auto_155353 ?auto_155357 ) ( ON ?auto_155352 ?auto_155353 ) ( CLEAR ?auto_155352 ) ( HOLDING ?auto_155356 ) ( CLEAR ?auto_155350 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_155351 ?auto_155350 ?auto_155356 )
      ( MAKE-1PILE ?auto_155349 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155358 - BLOCK
    )
    :vars
    (
      ?auto_155366 - BLOCK
      ?auto_155365 - BLOCK
      ?auto_155364 - BLOCK
      ?auto_155361 - BLOCK
      ?auto_155362 - BLOCK
      ?auto_155359 - BLOCK
      ?auto_155360 - BLOCK
      ?auto_155363 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155358 ?auto_155366 ) ) ( ON-TABLE ?auto_155365 ) ( ON ?auto_155364 ?auto_155365 ) ( not ( = ?auto_155365 ?auto_155364 ) ) ( not ( = ?auto_155365 ?auto_155361 ) ) ( not ( = ?auto_155365 ?auto_155362 ) ) ( not ( = ?auto_155365 ?auto_155359 ) ) ( not ( = ?auto_155365 ?auto_155360 ) ) ( not ( = ?auto_155365 ?auto_155366 ) ) ( not ( = ?auto_155365 ?auto_155358 ) ) ( not ( = ?auto_155364 ?auto_155361 ) ) ( not ( = ?auto_155364 ?auto_155362 ) ) ( not ( = ?auto_155364 ?auto_155359 ) ) ( not ( = ?auto_155364 ?auto_155360 ) ) ( not ( = ?auto_155364 ?auto_155366 ) ) ( not ( = ?auto_155364 ?auto_155358 ) ) ( not ( = ?auto_155361 ?auto_155362 ) ) ( not ( = ?auto_155361 ?auto_155359 ) ) ( not ( = ?auto_155361 ?auto_155360 ) ) ( not ( = ?auto_155361 ?auto_155366 ) ) ( not ( = ?auto_155361 ?auto_155358 ) ) ( not ( = ?auto_155362 ?auto_155359 ) ) ( not ( = ?auto_155362 ?auto_155360 ) ) ( not ( = ?auto_155362 ?auto_155366 ) ) ( not ( = ?auto_155362 ?auto_155358 ) ) ( not ( = ?auto_155359 ?auto_155360 ) ) ( not ( = ?auto_155359 ?auto_155366 ) ) ( not ( = ?auto_155359 ?auto_155358 ) ) ( not ( = ?auto_155360 ?auto_155366 ) ) ( not ( = ?auto_155360 ?auto_155358 ) ) ( ON ?auto_155358 ?auto_155363 ) ( not ( = ?auto_155358 ?auto_155363 ) ) ( not ( = ?auto_155366 ?auto_155363 ) ) ( not ( = ?auto_155365 ?auto_155363 ) ) ( not ( = ?auto_155364 ?auto_155363 ) ) ( not ( = ?auto_155361 ?auto_155363 ) ) ( not ( = ?auto_155362 ?auto_155363 ) ) ( not ( = ?auto_155359 ?auto_155363 ) ) ( not ( = ?auto_155360 ?auto_155363 ) ) ( ON ?auto_155366 ?auto_155358 ) ( ON-TABLE ?auto_155363 ) ( ON ?auto_155360 ?auto_155366 ) ( ON ?auto_155359 ?auto_155360 ) ( ON ?auto_155362 ?auto_155359 ) ( CLEAR ?auto_155364 ) ( ON ?auto_155361 ?auto_155362 ) ( CLEAR ?auto_155361 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_155363 ?auto_155358 ?auto_155366 ?auto_155360 ?auto_155359 ?auto_155362 )
      ( MAKE-1PILE ?auto_155358 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155367 - BLOCK
    )
    :vars
    (
      ?auto_155372 - BLOCK
      ?auto_155368 - BLOCK
      ?auto_155370 - BLOCK
      ?auto_155374 - BLOCK
      ?auto_155375 - BLOCK
      ?auto_155369 - BLOCK
      ?auto_155373 - BLOCK
      ?auto_155371 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155367 ?auto_155372 ) ) ( ON-TABLE ?auto_155368 ) ( not ( = ?auto_155368 ?auto_155370 ) ) ( not ( = ?auto_155368 ?auto_155374 ) ) ( not ( = ?auto_155368 ?auto_155375 ) ) ( not ( = ?auto_155368 ?auto_155369 ) ) ( not ( = ?auto_155368 ?auto_155373 ) ) ( not ( = ?auto_155368 ?auto_155372 ) ) ( not ( = ?auto_155368 ?auto_155367 ) ) ( not ( = ?auto_155370 ?auto_155374 ) ) ( not ( = ?auto_155370 ?auto_155375 ) ) ( not ( = ?auto_155370 ?auto_155369 ) ) ( not ( = ?auto_155370 ?auto_155373 ) ) ( not ( = ?auto_155370 ?auto_155372 ) ) ( not ( = ?auto_155370 ?auto_155367 ) ) ( not ( = ?auto_155374 ?auto_155375 ) ) ( not ( = ?auto_155374 ?auto_155369 ) ) ( not ( = ?auto_155374 ?auto_155373 ) ) ( not ( = ?auto_155374 ?auto_155372 ) ) ( not ( = ?auto_155374 ?auto_155367 ) ) ( not ( = ?auto_155375 ?auto_155369 ) ) ( not ( = ?auto_155375 ?auto_155373 ) ) ( not ( = ?auto_155375 ?auto_155372 ) ) ( not ( = ?auto_155375 ?auto_155367 ) ) ( not ( = ?auto_155369 ?auto_155373 ) ) ( not ( = ?auto_155369 ?auto_155372 ) ) ( not ( = ?auto_155369 ?auto_155367 ) ) ( not ( = ?auto_155373 ?auto_155372 ) ) ( not ( = ?auto_155373 ?auto_155367 ) ) ( ON ?auto_155367 ?auto_155371 ) ( not ( = ?auto_155367 ?auto_155371 ) ) ( not ( = ?auto_155372 ?auto_155371 ) ) ( not ( = ?auto_155368 ?auto_155371 ) ) ( not ( = ?auto_155370 ?auto_155371 ) ) ( not ( = ?auto_155374 ?auto_155371 ) ) ( not ( = ?auto_155375 ?auto_155371 ) ) ( not ( = ?auto_155369 ?auto_155371 ) ) ( not ( = ?auto_155373 ?auto_155371 ) ) ( ON ?auto_155372 ?auto_155367 ) ( ON-TABLE ?auto_155371 ) ( ON ?auto_155373 ?auto_155372 ) ( ON ?auto_155369 ?auto_155373 ) ( ON ?auto_155375 ?auto_155369 ) ( ON ?auto_155374 ?auto_155375 ) ( CLEAR ?auto_155374 ) ( HOLDING ?auto_155370 ) ( CLEAR ?auto_155368 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_155368 ?auto_155370 )
      ( MAKE-1PILE ?auto_155367 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155376 - BLOCK
    )
    :vars
    (
      ?auto_155378 - BLOCK
      ?auto_155381 - BLOCK
      ?auto_155384 - BLOCK
      ?auto_155382 - BLOCK
      ?auto_155380 - BLOCK
      ?auto_155377 - BLOCK
      ?auto_155383 - BLOCK
      ?auto_155379 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155376 ?auto_155378 ) ) ( ON-TABLE ?auto_155381 ) ( not ( = ?auto_155381 ?auto_155384 ) ) ( not ( = ?auto_155381 ?auto_155382 ) ) ( not ( = ?auto_155381 ?auto_155380 ) ) ( not ( = ?auto_155381 ?auto_155377 ) ) ( not ( = ?auto_155381 ?auto_155383 ) ) ( not ( = ?auto_155381 ?auto_155378 ) ) ( not ( = ?auto_155381 ?auto_155376 ) ) ( not ( = ?auto_155384 ?auto_155382 ) ) ( not ( = ?auto_155384 ?auto_155380 ) ) ( not ( = ?auto_155384 ?auto_155377 ) ) ( not ( = ?auto_155384 ?auto_155383 ) ) ( not ( = ?auto_155384 ?auto_155378 ) ) ( not ( = ?auto_155384 ?auto_155376 ) ) ( not ( = ?auto_155382 ?auto_155380 ) ) ( not ( = ?auto_155382 ?auto_155377 ) ) ( not ( = ?auto_155382 ?auto_155383 ) ) ( not ( = ?auto_155382 ?auto_155378 ) ) ( not ( = ?auto_155382 ?auto_155376 ) ) ( not ( = ?auto_155380 ?auto_155377 ) ) ( not ( = ?auto_155380 ?auto_155383 ) ) ( not ( = ?auto_155380 ?auto_155378 ) ) ( not ( = ?auto_155380 ?auto_155376 ) ) ( not ( = ?auto_155377 ?auto_155383 ) ) ( not ( = ?auto_155377 ?auto_155378 ) ) ( not ( = ?auto_155377 ?auto_155376 ) ) ( not ( = ?auto_155383 ?auto_155378 ) ) ( not ( = ?auto_155383 ?auto_155376 ) ) ( ON ?auto_155376 ?auto_155379 ) ( not ( = ?auto_155376 ?auto_155379 ) ) ( not ( = ?auto_155378 ?auto_155379 ) ) ( not ( = ?auto_155381 ?auto_155379 ) ) ( not ( = ?auto_155384 ?auto_155379 ) ) ( not ( = ?auto_155382 ?auto_155379 ) ) ( not ( = ?auto_155380 ?auto_155379 ) ) ( not ( = ?auto_155377 ?auto_155379 ) ) ( not ( = ?auto_155383 ?auto_155379 ) ) ( ON ?auto_155378 ?auto_155376 ) ( ON-TABLE ?auto_155379 ) ( ON ?auto_155383 ?auto_155378 ) ( ON ?auto_155377 ?auto_155383 ) ( ON ?auto_155380 ?auto_155377 ) ( ON ?auto_155382 ?auto_155380 ) ( CLEAR ?auto_155381 ) ( ON ?auto_155384 ?auto_155382 ) ( CLEAR ?auto_155384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_155379 ?auto_155376 ?auto_155378 ?auto_155383 ?auto_155377 ?auto_155380 ?auto_155382 )
      ( MAKE-1PILE ?auto_155376 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155385 - BLOCK
    )
    :vars
    (
      ?auto_155392 - BLOCK
      ?auto_155388 - BLOCK
      ?auto_155387 - BLOCK
      ?auto_155386 - BLOCK
      ?auto_155390 - BLOCK
      ?auto_155389 - BLOCK
      ?auto_155393 - BLOCK
      ?auto_155391 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155385 ?auto_155392 ) ) ( not ( = ?auto_155388 ?auto_155387 ) ) ( not ( = ?auto_155388 ?auto_155386 ) ) ( not ( = ?auto_155388 ?auto_155390 ) ) ( not ( = ?auto_155388 ?auto_155389 ) ) ( not ( = ?auto_155388 ?auto_155393 ) ) ( not ( = ?auto_155388 ?auto_155392 ) ) ( not ( = ?auto_155388 ?auto_155385 ) ) ( not ( = ?auto_155387 ?auto_155386 ) ) ( not ( = ?auto_155387 ?auto_155390 ) ) ( not ( = ?auto_155387 ?auto_155389 ) ) ( not ( = ?auto_155387 ?auto_155393 ) ) ( not ( = ?auto_155387 ?auto_155392 ) ) ( not ( = ?auto_155387 ?auto_155385 ) ) ( not ( = ?auto_155386 ?auto_155390 ) ) ( not ( = ?auto_155386 ?auto_155389 ) ) ( not ( = ?auto_155386 ?auto_155393 ) ) ( not ( = ?auto_155386 ?auto_155392 ) ) ( not ( = ?auto_155386 ?auto_155385 ) ) ( not ( = ?auto_155390 ?auto_155389 ) ) ( not ( = ?auto_155390 ?auto_155393 ) ) ( not ( = ?auto_155390 ?auto_155392 ) ) ( not ( = ?auto_155390 ?auto_155385 ) ) ( not ( = ?auto_155389 ?auto_155393 ) ) ( not ( = ?auto_155389 ?auto_155392 ) ) ( not ( = ?auto_155389 ?auto_155385 ) ) ( not ( = ?auto_155393 ?auto_155392 ) ) ( not ( = ?auto_155393 ?auto_155385 ) ) ( ON ?auto_155385 ?auto_155391 ) ( not ( = ?auto_155385 ?auto_155391 ) ) ( not ( = ?auto_155392 ?auto_155391 ) ) ( not ( = ?auto_155388 ?auto_155391 ) ) ( not ( = ?auto_155387 ?auto_155391 ) ) ( not ( = ?auto_155386 ?auto_155391 ) ) ( not ( = ?auto_155390 ?auto_155391 ) ) ( not ( = ?auto_155389 ?auto_155391 ) ) ( not ( = ?auto_155393 ?auto_155391 ) ) ( ON ?auto_155392 ?auto_155385 ) ( ON-TABLE ?auto_155391 ) ( ON ?auto_155393 ?auto_155392 ) ( ON ?auto_155389 ?auto_155393 ) ( ON ?auto_155390 ?auto_155389 ) ( ON ?auto_155386 ?auto_155390 ) ( ON ?auto_155387 ?auto_155386 ) ( CLEAR ?auto_155387 ) ( HOLDING ?auto_155388 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_155388 )
      ( MAKE-1PILE ?auto_155385 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155394 - BLOCK
    )
    :vars
    (
      ?auto_155402 - BLOCK
      ?auto_155396 - BLOCK
      ?auto_155400 - BLOCK
      ?auto_155395 - BLOCK
      ?auto_155401 - BLOCK
      ?auto_155398 - BLOCK
      ?auto_155397 - BLOCK
      ?auto_155399 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155394 ?auto_155402 ) ) ( not ( = ?auto_155396 ?auto_155400 ) ) ( not ( = ?auto_155396 ?auto_155395 ) ) ( not ( = ?auto_155396 ?auto_155401 ) ) ( not ( = ?auto_155396 ?auto_155398 ) ) ( not ( = ?auto_155396 ?auto_155397 ) ) ( not ( = ?auto_155396 ?auto_155402 ) ) ( not ( = ?auto_155396 ?auto_155394 ) ) ( not ( = ?auto_155400 ?auto_155395 ) ) ( not ( = ?auto_155400 ?auto_155401 ) ) ( not ( = ?auto_155400 ?auto_155398 ) ) ( not ( = ?auto_155400 ?auto_155397 ) ) ( not ( = ?auto_155400 ?auto_155402 ) ) ( not ( = ?auto_155400 ?auto_155394 ) ) ( not ( = ?auto_155395 ?auto_155401 ) ) ( not ( = ?auto_155395 ?auto_155398 ) ) ( not ( = ?auto_155395 ?auto_155397 ) ) ( not ( = ?auto_155395 ?auto_155402 ) ) ( not ( = ?auto_155395 ?auto_155394 ) ) ( not ( = ?auto_155401 ?auto_155398 ) ) ( not ( = ?auto_155401 ?auto_155397 ) ) ( not ( = ?auto_155401 ?auto_155402 ) ) ( not ( = ?auto_155401 ?auto_155394 ) ) ( not ( = ?auto_155398 ?auto_155397 ) ) ( not ( = ?auto_155398 ?auto_155402 ) ) ( not ( = ?auto_155398 ?auto_155394 ) ) ( not ( = ?auto_155397 ?auto_155402 ) ) ( not ( = ?auto_155397 ?auto_155394 ) ) ( ON ?auto_155394 ?auto_155399 ) ( not ( = ?auto_155394 ?auto_155399 ) ) ( not ( = ?auto_155402 ?auto_155399 ) ) ( not ( = ?auto_155396 ?auto_155399 ) ) ( not ( = ?auto_155400 ?auto_155399 ) ) ( not ( = ?auto_155395 ?auto_155399 ) ) ( not ( = ?auto_155401 ?auto_155399 ) ) ( not ( = ?auto_155398 ?auto_155399 ) ) ( not ( = ?auto_155397 ?auto_155399 ) ) ( ON ?auto_155402 ?auto_155394 ) ( ON-TABLE ?auto_155399 ) ( ON ?auto_155397 ?auto_155402 ) ( ON ?auto_155398 ?auto_155397 ) ( ON ?auto_155401 ?auto_155398 ) ( ON ?auto_155395 ?auto_155401 ) ( ON ?auto_155400 ?auto_155395 ) ( ON ?auto_155396 ?auto_155400 ) ( CLEAR ?auto_155396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_155399 ?auto_155394 ?auto_155402 ?auto_155397 ?auto_155398 ?auto_155401 ?auto_155395 ?auto_155400 )
      ( MAKE-1PILE ?auto_155394 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_155409 - BLOCK
      ?auto_155410 - BLOCK
      ?auto_155411 - BLOCK
      ?auto_155412 - BLOCK
      ?auto_155413 - BLOCK
      ?auto_155414 - BLOCK
    )
    :vars
    (
      ?auto_155415 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155415 ?auto_155414 ) ( CLEAR ?auto_155415 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_155409 ) ( ON ?auto_155410 ?auto_155409 ) ( ON ?auto_155411 ?auto_155410 ) ( ON ?auto_155412 ?auto_155411 ) ( ON ?auto_155413 ?auto_155412 ) ( ON ?auto_155414 ?auto_155413 ) ( not ( = ?auto_155409 ?auto_155410 ) ) ( not ( = ?auto_155409 ?auto_155411 ) ) ( not ( = ?auto_155409 ?auto_155412 ) ) ( not ( = ?auto_155409 ?auto_155413 ) ) ( not ( = ?auto_155409 ?auto_155414 ) ) ( not ( = ?auto_155409 ?auto_155415 ) ) ( not ( = ?auto_155410 ?auto_155411 ) ) ( not ( = ?auto_155410 ?auto_155412 ) ) ( not ( = ?auto_155410 ?auto_155413 ) ) ( not ( = ?auto_155410 ?auto_155414 ) ) ( not ( = ?auto_155410 ?auto_155415 ) ) ( not ( = ?auto_155411 ?auto_155412 ) ) ( not ( = ?auto_155411 ?auto_155413 ) ) ( not ( = ?auto_155411 ?auto_155414 ) ) ( not ( = ?auto_155411 ?auto_155415 ) ) ( not ( = ?auto_155412 ?auto_155413 ) ) ( not ( = ?auto_155412 ?auto_155414 ) ) ( not ( = ?auto_155412 ?auto_155415 ) ) ( not ( = ?auto_155413 ?auto_155414 ) ) ( not ( = ?auto_155413 ?auto_155415 ) ) ( not ( = ?auto_155414 ?auto_155415 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_155415 ?auto_155414 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_155416 - BLOCK
      ?auto_155417 - BLOCK
      ?auto_155418 - BLOCK
      ?auto_155419 - BLOCK
      ?auto_155420 - BLOCK
      ?auto_155421 - BLOCK
    )
    :vars
    (
      ?auto_155422 - BLOCK
      ?auto_155423 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155422 ?auto_155421 ) ( CLEAR ?auto_155422 ) ( ON-TABLE ?auto_155416 ) ( ON ?auto_155417 ?auto_155416 ) ( ON ?auto_155418 ?auto_155417 ) ( ON ?auto_155419 ?auto_155418 ) ( ON ?auto_155420 ?auto_155419 ) ( ON ?auto_155421 ?auto_155420 ) ( not ( = ?auto_155416 ?auto_155417 ) ) ( not ( = ?auto_155416 ?auto_155418 ) ) ( not ( = ?auto_155416 ?auto_155419 ) ) ( not ( = ?auto_155416 ?auto_155420 ) ) ( not ( = ?auto_155416 ?auto_155421 ) ) ( not ( = ?auto_155416 ?auto_155422 ) ) ( not ( = ?auto_155417 ?auto_155418 ) ) ( not ( = ?auto_155417 ?auto_155419 ) ) ( not ( = ?auto_155417 ?auto_155420 ) ) ( not ( = ?auto_155417 ?auto_155421 ) ) ( not ( = ?auto_155417 ?auto_155422 ) ) ( not ( = ?auto_155418 ?auto_155419 ) ) ( not ( = ?auto_155418 ?auto_155420 ) ) ( not ( = ?auto_155418 ?auto_155421 ) ) ( not ( = ?auto_155418 ?auto_155422 ) ) ( not ( = ?auto_155419 ?auto_155420 ) ) ( not ( = ?auto_155419 ?auto_155421 ) ) ( not ( = ?auto_155419 ?auto_155422 ) ) ( not ( = ?auto_155420 ?auto_155421 ) ) ( not ( = ?auto_155420 ?auto_155422 ) ) ( not ( = ?auto_155421 ?auto_155422 ) ) ( HOLDING ?auto_155423 ) ( not ( = ?auto_155416 ?auto_155423 ) ) ( not ( = ?auto_155417 ?auto_155423 ) ) ( not ( = ?auto_155418 ?auto_155423 ) ) ( not ( = ?auto_155419 ?auto_155423 ) ) ( not ( = ?auto_155420 ?auto_155423 ) ) ( not ( = ?auto_155421 ?auto_155423 ) ) ( not ( = ?auto_155422 ?auto_155423 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_155423 )
      ( MAKE-6PILE ?auto_155416 ?auto_155417 ?auto_155418 ?auto_155419 ?auto_155420 ?auto_155421 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_155424 - BLOCK
      ?auto_155425 - BLOCK
      ?auto_155426 - BLOCK
      ?auto_155427 - BLOCK
      ?auto_155428 - BLOCK
      ?auto_155429 - BLOCK
    )
    :vars
    (
      ?auto_155430 - BLOCK
      ?auto_155431 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155430 ?auto_155429 ) ( ON-TABLE ?auto_155424 ) ( ON ?auto_155425 ?auto_155424 ) ( ON ?auto_155426 ?auto_155425 ) ( ON ?auto_155427 ?auto_155426 ) ( ON ?auto_155428 ?auto_155427 ) ( ON ?auto_155429 ?auto_155428 ) ( not ( = ?auto_155424 ?auto_155425 ) ) ( not ( = ?auto_155424 ?auto_155426 ) ) ( not ( = ?auto_155424 ?auto_155427 ) ) ( not ( = ?auto_155424 ?auto_155428 ) ) ( not ( = ?auto_155424 ?auto_155429 ) ) ( not ( = ?auto_155424 ?auto_155430 ) ) ( not ( = ?auto_155425 ?auto_155426 ) ) ( not ( = ?auto_155425 ?auto_155427 ) ) ( not ( = ?auto_155425 ?auto_155428 ) ) ( not ( = ?auto_155425 ?auto_155429 ) ) ( not ( = ?auto_155425 ?auto_155430 ) ) ( not ( = ?auto_155426 ?auto_155427 ) ) ( not ( = ?auto_155426 ?auto_155428 ) ) ( not ( = ?auto_155426 ?auto_155429 ) ) ( not ( = ?auto_155426 ?auto_155430 ) ) ( not ( = ?auto_155427 ?auto_155428 ) ) ( not ( = ?auto_155427 ?auto_155429 ) ) ( not ( = ?auto_155427 ?auto_155430 ) ) ( not ( = ?auto_155428 ?auto_155429 ) ) ( not ( = ?auto_155428 ?auto_155430 ) ) ( not ( = ?auto_155429 ?auto_155430 ) ) ( not ( = ?auto_155424 ?auto_155431 ) ) ( not ( = ?auto_155425 ?auto_155431 ) ) ( not ( = ?auto_155426 ?auto_155431 ) ) ( not ( = ?auto_155427 ?auto_155431 ) ) ( not ( = ?auto_155428 ?auto_155431 ) ) ( not ( = ?auto_155429 ?auto_155431 ) ) ( not ( = ?auto_155430 ?auto_155431 ) ) ( ON ?auto_155431 ?auto_155430 ) ( CLEAR ?auto_155431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_155424 ?auto_155425 ?auto_155426 ?auto_155427 ?auto_155428 ?auto_155429 ?auto_155430 )
      ( MAKE-6PILE ?auto_155424 ?auto_155425 ?auto_155426 ?auto_155427 ?auto_155428 ?auto_155429 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_155432 - BLOCK
      ?auto_155433 - BLOCK
      ?auto_155434 - BLOCK
      ?auto_155435 - BLOCK
      ?auto_155436 - BLOCK
      ?auto_155437 - BLOCK
    )
    :vars
    (
      ?auto_155438 - BLOCK
      ?auto_155439 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155438 ?auto_155437 ) ( ON-TABLE ?auto_155432 ) ( ON ?auto_155433 ?auto_155432 ) ( ON ?auto_155434 ?auto_155433 ) ( ON ?auto_155435 ?auto_155434 ) ( ON ?auto_155436 ?auto_155435 ) ( ON ?auto_155437 ?auto_155436 ) ( not ( = ?auto_155432 ?auto_155433 ) ) ( not ( = ?auto_155432 ?auto_155434 ) ) ( not ( = ?auto_155432 ?auto_155435 ) ) ( not ( = ?auto_155432 ?auto_155436 ) ) ( not ( = ?auto_155432 ?auto_155437 ) ) ( not ( = ?auto_155432 ?auto_155438 ) ) ( not ( = ?auto_155433 ?auto_155434 ) ) ( not ( = ?auto_155433 ?auto_155435 ) ) ( not ( = ?auto_155433 ?auto_155436 ) ) ( not ( = ?auto_155433 ?auto_155437 ) ) ( not ( = ?auto_155433 ?auto_155438 ) ) ( not ( = ?auto_155434 ?auto_155435 ) ) ( not ( = ?auto_155434 ?auto_155436 ) ) ( not ( = ?auto_155434 ?auto_155437 ) ) ( not ( = ?auto_155434 ?auto_155438 ) ) ( not ( = ?auto_155435 ?auto_155436 ) ) ( not ( = ?auto_155435 ?auto_155437 ) ) ( not ( = ?auto_155435 ?auto_155438 ) ) ( not ( = ?auto_155436 ?auto_155437 ) ) ( not ( = ?auto_155436 ?auto_155438 ) ) ( not ( = ?auto_155437 ?auto_155438 ) ) ( not ( = ?auto_155432 ?auto_155439 ) ) ( not ( = ?auto_155433 ?auto_155439 ) ) ( not ( = ?auto_155434 ?auto_155439 ) ) ( not ( = ?auto_155435 ?auto_155439 ) ) ( not ( = ?auto_155436 ?auto_155439 ) ) ( not ( = ?auto_155437 ?auto_155439 ) ) ( not ( = ?auto_155438 ?auto_155439 ) ) ( HOLDING ?auto_155439 ) ( CLEAR ?auto_155438 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_155432 ?auto_155433 ?auto_155434 ?auto_155435 ?auto_155436 ?auto_155437 ?auto_155438 ?auto_155439 )
      ( MAKE-6PILE ?auto_155432 ?auto_155433 ?auto_155434 ?auto_155435 ?auto_155436 ?auto_155437 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_155440 - BLOCK
      ?auto_155441 - BLOCK
      ?auto_155442 - BLOCK
      ?auto_155443 - BLOCK
      ?auto_155444 - BLOCK
      ?auto_155445 - BLOCK
    )
    :vars
    (
      ?auto_155446 - BLOCK
      ?auto_155447 - BLOCK
      ?auto_155448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155446 ?auto_155445 ) ( ON-TABLE ?auto_155440 ) ( ON ?auto_155441 ?auto_155440 ) ( ON ?auto_155442 ?auto_155441 ) ( ON ?auto_155443 ?auto_155442 ) ( ON ?auto_155444 ?auto_155443 ) ( ON ?auto_155445 ?auto_155444 ) ( not ( = ?auto_155440 ?auto_155441 ) ) ( not ( = ?auto_155440 ?auto_155442 ) ) ( not ( = ?auto_155440 ?auto_155443 ) ) ( not ( = ?auto_155440 ?auto_155444 ) ) ( not ( = ?auto_155440 ?auto_155445 ) ) ( not ( = ?auto_155440 ?auto_155446 ) ) ( not ( = ?auto_155441 ?auto_155442 ) ) ( not ( = ?auto_155441 ?auto_155443 ) ) ( not ( = ?auto_155441 ?auto_155444 ) ) ( not ( = ?auto_155441 ?auto_155445 ) ) ( not ( = ?auto_155441 ?auto_155446 ) ) ( not ( = ?auto_155442 ?auto_155443 ) ) ( not ( = ?auto_155442 ?auto_155444 ) ) ( not ( = ?auto_155442 ?auto_155445 ) ) ( not ( = ?auto_155442 ?auto_155446 ) ) ( not ( = ?auto_155443 ?auto_155444 ) ) ( not ( = ?auto_155443 ?auto_155445 ) ) ( not ( = ?auto_155443 ?auto_155446 ) ) ( not ( = ?auto_155444 ?auto_155445 ) ) ( not ( = ?auto_155444 ?auto_155446 ) ) ( not ( = ?auto_155445 ?auto_155446 ) ) ( not ( = ?auto_155440 ?auto_155447 ) ) ( not ( = ?auto_155441 ?auto_155447 ) ) ( not ( = ?auto_155442 ?auto_155447 ) ) ( not ( = ?auto_155443 ?auto_155447 ) ) ( not ( = ?auto_155444 ?auto_155447 ) ) ( not ( = ?auto_155445 ?auto_155447 ) ) ( not ( = ?auto_155446 ?auto_155447 ) ) ( CLEAR ?auto_155446 ) ( ON ?auto_155447 ?auto_155448 ) ( CLEAR ?auto_155447 ) ( HAND-EMPTY ) ( not ( = ?auto_155440 ?auto_155448 ) ) ( not ( = ?auto_155441 ?auto_155448 ) ) ( not ( = ?auto_155442 ?auto_155448 ) ) ( not ( = ?auto_155443 ?auto_155448 ) ) ( not ( = ?auto_155444 ?auto_155448 ) ) ( not ( = ?auto_155445 ?auto_155448 ) ) ( not ( = ?auto_155446 ?auto_155448 ) ) ( not ( = ?auto_155447 ?auto_155448 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_155447 ?auto_155448 )
      ( MAKE-6PILE ?auto_155440 ?auto_155441 ?auto_155442 ?auto_155443 ?auto_155444 ?auto_155445 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_155467 - BLOCK
      ?auto_155468 - BLOCK
      ?auto_155469 - BLOCK
      ?auto_155470 - BLOCK
      ?auto_155471 - BLOCK
      ?auto_155472 - BLOCK
    )
    :vars
    (
      ?auto_155475 - BLOCK
      ?auto_155474 - BLOCK
      ?auto_155473 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155467 ) ( ON ?auto_155468 ?auto_155467 ) ( ON ?auto_155469 ?auto_155468 ) ( ON ?auto_155470 ?auto_155469 ) ( ON ?auto_155471 ?auto_155470 ) ( not ( = ?auto_155467 ?auto_155468 ) ) ( not ( = ?auto_155467 ?auto_155469 ) ) ( not ( = ?auto_155467 ?auto_155470 ) ) ( not ( = ?auto_155467 ?auto_155471 ) ) ( not ( = ?auto_155467 ?auto_155472 ) ) ( not ( = ?auto_155467 ?auto_155475 ) ) ( not ( = ?auto_155468 ?auto_155469 ) ) ( not ( = ?auto_155468 ?auto_155470 ) ) ( not ( = ?auto_155468 ?auto_155471 ) ) ( not ( = ?auto_155468 ?auto_155472 ) ) ( not ( = ?auto_155468 ?auto_155475 ) ) ( not ( = ?auto_155469 ?auto_155470 ) ) ( not ( = ?auto_155469 ?auto_155471 ) ) ( not ( = ?auto_155469 ?auto_155472 ) ) ( not ( = ?auto_155469 ?auto_155475 ) ) ( not ( = ?auto_155470 ?auto_155471 ) ) ( not ( = ?auto_155470 ?auto_155472 ) ) ( not ( = ?auto_155470 ?auto_155475 ) ) ( not ( = ?auto_155471 ?auto_155472 ) ) ( not ( = ?auto_155471 ?auto_155475 ) ) ( not ( = ?auto_155472 ?auto_155475 ) ) ( not ( = ?auto_155467 ?auto_155474 ) ) ( not ( = ?auto_155468 ?auto_155474 ) ) ( not ( = ?auto_155469 ?auto_155474 ) ) ( not ( = ?auto_155470 ?auto_155474 ) ) ( not ( = ?auto_155471 ?auto_155474 ) ) ( not ( = ?auto_155472 ?auto_155474 ) ) ( not ( = ?auto_155475 ?auto_155474 ) ) ( ON ?auto_155474 ?auto_155473 ) ( not ( = ?auto_155467 ?auto_155473 ) ) ( not ( = ?auto_155468 ?auto_155473 ) ) ( not ( = ?auto_155469 ?auto_155473 ) ) ( not ( = ?auto_155470 ?auto_155473 ) ) ( not ( = ?auto_155471 ?auto_155473 ) ) ( not ( = ?auto_155472 ?auto_155473 ) ) ( not ( = ?auto_155475 ?auto_155473 ) ) ( not ( = ?auto_155474 ?auto_155473 ) ) ( ON ?auto_155475 ?auto_155474 ) ( CLEAR ?auto_155475 ) ( HOLDING ?auto_155472 ) ( CLEAR ?auto_155471 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_155467 ?auto_155468 ?auto_155469 ?auto_155470 ?auto_155471 ?auto_155472 ?auto_155475 )
      ( MAKE-6PILE ?auto_155467 ?auto_155468 ?auto_155469 ?auto_155470 ?auto_155471 ?auto_155472 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_155476 - BLOCK
      ?auto_155477 - BLOCK
      ?auto_155478 - BLOCK
      ?auto_155479 - BLOCK
      ?auto_155480 - BLOCK
      ?auto_155481 - BLOCK
    )
    :vars
    (
      ?auto_155484 - BLOCK
      ?auto_155483 - BLOCK
      ?auto_155482 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155476 ) ( ON ?auto_155477 ?auto_155476 ) ( ON ?auto_155478 ?auto_155477 ) ( ON ?auto_155479 ?auto_155478 ) ( ON ?auto_155480 ?auto_155479 ) ( not ( = ?auto_155476 ?auto_155477 ) ) ( not ( = ?auto_155476 ?auto_155478 ) ) ( not ( = ?auto_155476 ?auto_155479 ) ) ( not ( = ?auto_155476 ?auto_155480 ) ) ( not ( = ?auto_155476 ?auto_155481 ) ) ( not ( = ?auto_155476 ?auto_155484 ) ) ( not ( = ?auto_155477 ?auto_155478 ) ) ( not ( = ?auto_155477 ?auto_155479 ) ) ( not ( = ?auto_155477 ?auto_155480 ) ) ( not ( = ?auto_155477 ?auto_155481 ) ) ( not ( = ?auto_155477 ?auto_155484 ) ) ( not ( = ?auto_155478 ?auto_155479 ) ) ( not ( = ?auto_155478 ?auto_155480 ) ) ( not ( = ?auto_155478 ?auto_155481 ) ) ( not ( = ?auto_155478 ?auto_155484 ) ) ( not ( = ?auto_155479 ?auto_155480 ) ) ( not ( = ?auto_155479 ?auto_155481 ) ) ( not ( = ?auto_155479 ?auto_155484 ) ) ( not ( = ?auto_155480 ?auto_155481 ) ) ( not ( = ?auto_155480 ?auto_155484 ) ) ( not ( = ?auto_155481 ?auto_155484 ) ) ( not ( = ?auto_155476 ?auto_155483 ) ) ( not ( = ?auto_155477 ?auto_155483 ) ) ( not ( = ?auto_155478 ?auto_155483 ) ) ( not ( = ?auto_155479 ?auto_155483 ) ) ( not ( = ?auto_155480 ?auto_155483 ) ) ( not ( = ?auto_155481 ?auto_155483 ) ) ( not ( = ?auto_155484 ?auto_155483 ) ) ( ON ?auto_155483 ?auto_155482 ) ( not ( = ?auto_155476 ?auto_155482 ) ) ( not ( = ?auto_155477 ?auto_155482 ) ) ( not ( = ?auto_155478 ?auto_155482 ) ) ( not ( = ?auto_155479 ?auto_155482 ) ) ( not ( = ?auto_155480 ?auto_155482 ) ) ( not ( = ?auto_155481 ?auto_155482 ) ) ( not ( = ?auto_155484 ?auto_155482 ) ) ( not ( = ?auto_155483 ?auto_155482 ) ) ( ON ?auto_155484 ?auto_155483 ) ( CLEAR ?auto_155480 ) ( ON ?auto_155481 ?auto_155484 ) ( CLEAR ?auto_155481 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_155482 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_155482 ?auto_155483 ?auto_155484 )
      ( MAKE-6PILE ?auto_155476 ?auto_155477 ?auto_155478 ?auto_155479 ?auto_155480 ?auto_155481 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_155485 - BLOCK
      ?auto_155486 - BLOCK
      ?auto_155487 - BLOCK
      ?auto_155488 - BLOCK
      ?auto_155489 - BLOCK
      ?auto_155490 - BLOCK
    )
    :vars
    (
      ?auto_155492 - BLOCK
      ?auto_155493 - BLOCK
      ?auto_155491 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155485 ) ( ON ?auto_155486 ?auto_155485 ) ( ON ?auto_155487 ?auto_155486 ) ( ON ?auto_155488 ?auto_155487 ) ( not ( = ?auto_155485 ?auto_155486 ) ) ( not ( = ?auto_155485 ?auto_155487 ) ) ( not ( = ?auto_155485 ?auto_155488 ) ) ( not ( = ?auto_155485 ?auto_155489 ) ) ( not ( = ?auto_155485 ?auto_155490 ) ) ( not ( = ?auto_155485 ?auto_155492 ) ) ( not ( = ?auto_155486 ?auto_155487 ) ) ( not ( = ?auto_155486 ?auto_155488 ) ) ( not ( = ?auto_155486 ?auto_155489 ) ) ( not ( = ?auto_155486 ?auto_155490 ) ) ( not ( = ?auto_155486 ?auto_155492 ) ) ( not ( = ?auto_155487 ?auto_155488 ) ) ( not ( = ?auto_155487 ?auto_155489 ) ) ( not ( = ?auto_155487 ?auto_155490 ) ) ( not ( = ?auto_155487 ?auto_155492 ) ) ( not ( = ?auto_155488 ?auto_155489 ) ) ( not ( = ?auto_155488 ?auto_155490 ) ) ( not ( = ?auto_155488 ?auto_155492 ) ) ( not ( = ?auto_155489 ?auto_155490 ) ) ( not ( = ?auto_155489 ?auto_155492 ) ) ( not ( = ?auto_155490 ?auto_155492 ) ) ( not ( = ?auto_155485 ?auto_155493 ) ) ( not ( = ?auto_155486 ?auto_155493 ) ) ( not ( = ?auto_155487 ?auto_155493 ) ) ( not ( = ?auto_155488 ?auto_155493 ) ) ( not ( = ?auto_155489 ?auto_155493 ) ) ( not ( = ?auto_155490 ?auto_155493 ) ) ( not ( = ?auto_155492 ?auto_155493 ) ) ( ON ?auto_155493 ?auto_155491 ) ( not ( = ?auto_155485 ?auto_155491 ) ) ( not ( = ?auto_155486 ?auto_155491 ) ) ( not ( = ?auto_155487 ?auto_155491 ) ) ( not ( = ?auto_155488 ?auto_155491 ) ) ( not ( = ?auto_155489 ?auto_155491 ) ) ( not ( = ?auto_155490 ?auto_155491 ) ) ( not ( = ?auto_155492 ?auto_155491 ) ) ( not ( = ?auto_155493 ?auto_155491 ) ) ( ON ?auto_155492 ?auto_155493 ) ( ON ?auto_155490 ?auto_155492 ) ( CLEAR ?auto_155490 ) ( ON-TABLE ?auto_155491 ) ( HOLDING ?auto_155489 ) ( CLEAR ?auto_155488 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_155485 ?auto_155486 ?auto_155487 ?auto_155488 ?auto_155489 )
      ( MAKE-6PILE ?auto_155485 ?auto_155486 ?auto_155487 ?auto_155488 ?auto_155489 ?auto_155490 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_155494 - BLOCK
      ?auto_155495 - BLOCK
      ?auto_155496 - BLOCK
      ?auto_155497 - BLOCK
      ?auto_155498 - BLOCK
      ?auto_155499 - BLOCK
    )
    :vars
    (
      ?auto_155502 - BLOCK
      ?auto_155501 - BLOCK
      ?auto_155500 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155494 ) ( ON ?auto_155495 ?auto_155494 ) ( ON ?auto_155496 ?auto_155495 ) ( ON ?auto_155497 ?auto_155496 ) ( not ( = ?auto_155494 ?auto_155495 ) ) ( not ( = ?auto_155494 ?auto_155496 ) ) ( not ( = ?auto_155494 ?auto_155497 ) ) ( not ( = ?auto_155494 ?auto_155498 ) ) ( not ( = ?auto_155494 ?auto_155499 ) ) ( not ( = ?auto_155494 ?auto_155502 ) ) ( not ( = ?auto_155495 ?auto_155496 ) ) ( not ( = ?auto_155495 ?auto_155497 ) ) ( not ( = ?auto_155495 ?auto_155498 ) ) ( not ( = ?auto_155495 ?auto_155499 ) ) ( not ( = ?auto_155495 ?auto_155502 ) ) ( not ( = ?auto_155496 ?auto_155497 ) ) ( not ( = ?auto_155496 ?auto_155498 ) ) ( not ( = ?auto_155496 ?auto_155499 ) ) ( not ( = ?auto_155496 ?auto_155502 ) ) ( not ( = ?auto_155497 ?auto_155498 ) ) ( not ( = ?auto_155497 ?auto_155499 ) ) ( not ( = ?auto_155497 ?auto_155502 ) ) ( not ( = ?auto_155498 ?auto_155499 ) ) ( not ( = ?auto_155498 ?auto_155502 ) ) ( not ( = ?auto_155499 ?auto_155502 ) ) ( not ( = ?auto_155494 ?auto_155501 ) ) ( not ( = ?auto_155495 ?auto_155501 ) ) ( not ( = ?auto_155496 ?auto_155501 ) ) ( not ( = ?auto_155497 ?auto_155501 ) ) ( not ( = ?auto_155498 ?auto_155501 ) ) ( not ( = ?auto_155499 ?auto_155501 ) ) ( not ( = ?auto_155502 ?auto_155501 ) ) ( ON ?auto_155501 ?auto_155500 ) ( not ( = ?auto_155494 ?auto_155500 ) ) ( not ( = ?auto_155495 ?auto_155500 ) ) ( not ( = ?auto_155496 ?auto_155500 ) ) ( not ( = ?auto_155497 ?auto_155500 ) ) ( not ( = ?auto_155498 ?auto_155500 ) ) ( not ( = ?auto_155499 ?auto_155500 ) ) ( not ( = ?auto_155502 ?auto_155500 ) ) ( not ( = ?auto_155501 ?auto_155500 ) ) ( ON ?auto_155502 ?auto_155501 ) ( ON ?auto_155499 ?auto_155502 ) ( ON-TABLE ?auto_155500 ) ( CLEAR ?auto_155497 ) ( ON ?auto_155498 ?auto_155499 ) ( CLEAR ?auto_155498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_155500 ?auto_155501 ?auto_155502 ?auto_155499 )
      ( MAKE-6PILE ?auto_155494 ?auto_155495 ?auto_155496 ?auto_155497 ?auto_155498 ?auto_155499 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_155503 - BLOCK
      ?auto_155504 - BLOCK
      ?auto_155505 - BLOCK
      ?auto_155506 - BLOCK
      ?auto_155507 - BLOCK
      ?auto_155508 - BLOCK
    )
    :vars
    (
      ?auto_155511 - BLOCK
      ?auto_155509 - BLOCK
      ?auto_155510 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155503 ) ( ON ?auto_155504 ?auto_155503 ) ( ON ?auto_155505 ?auto_155504 ) ( not ( = ?auto_155503 ?auto_155504 ) ) ( not ( = ?auto_155503 ?auto_155505 ) ) ( not ( = ?auto_155503 ?auto_155506 ) ) ( not ( = ?auto_155503 ?auto_155507 ) ) ( not ( = ?auto_155503 ?auto_155508 ) ) ( not ( = ?auto_155503 ?auto_155511 ) ) ( not ( = ?auto_155504 ?auto_155505 ) ) ( not ( = ?auto_155504 ?auto_155506 ) ) ( not ( = ?auto_155504 ?auto_155507 ) ) ( not ( = ?auto_155504 ?auto_155508 ) ) ( not ( = ?auto_155504 ?auto_155511 ) ) ( not ( = ?auto_155505 ?auto_155506 ) ) ( not ( = ?auto_155505 ?auto_155507 ) ) ( not ( = ?auto_155505 ?auto_155508 ) ) ( not ( = ?auto_155505 ?auto_155511 ) ) ( not ( = ?auto_155506 ?auto_155507 ) ) ( not ( = ?auto_155506 ?auto_155508 ) ) ( not ( = ?auto_155506 ?auto_155511 ) ) ( not ( = ?auto_155507 ?auto_155508 ) ) ( not ( = ?auto_155507 ?auto_155511 ) ) ( not ( = ?auto_155508 ?auto_155511 ) ) ( not ( = ?auto_155503 ?auto_155509 ) ) ( not ( = ?auto_155504 ?auto_155509 ) ) ( not ( = ?auto_155505 ?auto_155509 ) ) ( not ( = ?auto_155506 ?auto_155509 ) ) ( not ( = ?auto_155507 ?auto_155509 ) ) ( not ( = ?auto_155508 ?auto_155509 ) ) ( not ( = ?auto_155511 ?auto_155509 ) ) ( ON ?auto_155509 ?auto_155510 ) ( not ( = ?auto_155503 ?auto_155510 ) ) ( not ( = ?auto_155504 ?auto_155510 ) ) ( not ( = ?auto_155505 ?auto_155510 ) ) ( not ( = ?auto_155506 ?auto_155510 ) ) ( not ( = ?auto_155507 ?auto_155510 ) ) ( not ( = ?auto_155508 ?auto_155510 ) ) ( not ( = ?auto_155511 ?auto_155510 ) ) ( not ( = ?auto_155509 ?auto_155510 ) ) ( ON ?auto_155511 ?auto_155509 ) ( ON ?auto_155508 ?auto_155511 ) ( ON-TABLE ?auto_155510 ) ( ON ?auto_155507 ?auto_155508 ) ( CLEAR ?auto_155507 ) ( HOLDING ?auto_155506 ) ( CLEAR ?auto_155505 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_155503 ?auto_155504 ?auto_155505 ?auto_155506 )
      ( MAKE-6PILE ?auto_155503 ?auto_155504 ?auto_155505 ?auto_155506 ?auto_155507 ?auto_155508 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_155512 - BLOCK
      ?auto_155513 - BLOCK
      ?auto_155514 - BLOCK
      ?auto_155515 - BLOCK
      ?auto_155516 - BLOCK
      ?auto_155517 - BLOCK
    )
    :vars
    (
      ?auto_155520 - BLOCK
      ?auto_155518 - BLOCK
      ?auto_155519 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155512 ) ( ON ?auto_155513 ?auto_155512 ) ( ON ?auto_155514 ?auto_155513 ) ( not ( = ?auto_155512 ?auto_155513 ) ) ( not ( = ?auto_155512 ?auto_155514 ) ) ( not ( = ?auto_155512 ?auto_155515 ) ) ( not ( = ?auto_155512 ?auto_155516 ) ) ( not ( = ?auto_155512 ?auto_155517 ) ) ( not ( = ?auto_155512 ?auto_155520 ) ) ( not ( = ?auto_155513 ?auto_155514 ) ) ( not ( = ?auto_155513 ?auto_155515 ) ) ( not ( = ?auto_155513 ?auto_155516 ) ) ( not ( = ?auto_155513 ?auto_155517 ) ) ( not ( = ?auto_155513 ?auto_155520 ) ) ( not ( = ?auto_155514 ?auto_155515 ) ) ( not ( = ?auto_155514 ?auto_155516 ) ) ( not ( = ?auto_155514 ?auto_155517 ) ) ( not ( = ?auto_155514 ?auto_155520 ) ) ( not ( = ?auto_155515 ?auto_155516 ) ) ( not ( = ?auto_155515 ?auto_155517 ) ) ( not ( = ?auto_155515 ?auto_155520 ) ) ( not ( = ?auto_155516 ?auto_155517 ) ) ( not ( = ?auto_155516 ?auto_155520 ) ) ( not ( = ?auto_155517 ?auto_155520 ) ) ( not ( = ?auto_155512 ?auto_155518 ) ) ( not ( = ?auto_155513 ?auto_155518 ) ) ( not ( = ?auto_155514 ?auto_155518 ) ) ( not ( = ?auto_155515 ?auto_155518 ) ) ( not ( = ?auto_155516 ?auto_155518 ) ) ( not ( = ?auto_155517 ?auto_155518 ) ) ( not ( = ?auto_155520 ?auto_155518 ) ) ( ON ?auto_155518 ?auto_155519 ) ( not ( = ?auto_155512 ?auto_155519 ) ) ( not ( = ?auto_155513 ?auto_155519 ) ) ( not ( = ?auto_155514 ?auto_155519 ) ) ( not ( = ?auto_155515 ?auto_155519 ) ) ( not ( = ?auto_155516 ?auto_155519 ) ) ( not ( = ?auto_155517 ?auto_155519 ) ) ( not ( = ?auto_155520 ?auto_155519 ) ) ( not ( = ?auto_155518 ?auto_155519 ) ) ( ON ?auto_155520 ?auto_155518 ) ( ON ?auto_155517 ?auto_155520 ) ( ON-TABLE ?auto_155519 ) ( ON ?auto_155516 ?auto_155517 ) ( CLEAR ?auto_155514 ) ( ON ?auto_155515 ?auto_155516 ) ( CLEAR ?auto_155515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_155519 ?auto_155518 ?auto_155520 ?auto_155517 ?auto_155516 )
      ( MAKE-6PILE ?auto_155512 ?auto_155513 ?auto_155514 ?auto_155515 ?auto_155516 ?auto_155517 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_155521 - BLOCK
      ?auto_155522 - BLOCK
      ?auto_155523 - BLOCK
      ?auto_155524 - BLOCK
      ?auto_155525 - BLOCK
      ?auto_155526 - BLOCK
    )
    :vars
    (
      ?auto_155529 - BLOCK
      ?auto_155527 - BLOCK
      ?auto_155528 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155521 ) ( ON ?auto_155522 ?auto_155521 ) ( not ( = ?auto_155521 ?auto_155522 ) ) ( not ( = ?auto_155521 ?auto_155523 ) ) ( not ( = ?auto_155521 ?auto_155524 ) ) ( not ( = ?auto_155521 ?auto_155525 ) ) ( not ( = ?auto_155521 ?auto_155526 ) ) ( not ( = ?auto_155521 ?auto_155529 ) ) ( not ( = ?auto_155522 ?auto_155523 ) ) ( not ( = ?auto_155522 ?auto_155524 ) ) ( not ( = ?auto_155522 ?auto_155525 ) ) ( not ( = ?auto_155522 ?auto_155526 ) ) ( not ( = ?auto_155522 ?auto_155529 ) ) ( not ( = ?auto_155523 ?auto_155524 ) ) ( not ( = ?auto_155523 ?auto_155525 ) ) ( not ( = ?auto_155523 ?auto_155526 ) ) ( not ( = ?auto_155523 ?auto_155529 ) ) ( not ( = ?auto_155524 ?auto_155525 ) ) ( not ( = ?auto_155524 ?auto_155526 ) ) ( not ( = ?auto_155524 ?auto_155529 ) ) ( not ( = ?auto_155525 ?auto_155526 ) ) ( not ( = ?auto_155525 ?auto_155529 ) ) ( not ( = ?auto_155526 ?auto_155529 ) ) ( not ( = ?auto_155521 ?auto_155527 ) ) ( not ( = ?auto_155522 ?auto_155527 ) ) ( not ( = ?auto_155523 ?auto_155527 ) ) ( not ( = ?auto_155524 ?auto_155527 ) ) ( not ( = ?auto_155525 ?auto_155527 ) ) ( not ( = ?auto_155526 ?auto_155527 ) ) ( not ( = ?auto_155529 ?auto_155527 ) ) ( ON ?auto_155527 ?auto_155528 ) ( not ( = ?auto_155521 ?auto_155528 ) ) ( not ( = ?auto_155522 ?auto_155528 ) ) ( not ( = ?auto_155523 ?auto_155528 ) ) ( not ( = ?auto_155524 ?auto_155528 ) ) ( not ( = ?auto_155525 ?auto_155528 ) ) ( not ( = ?auto_155526 ?auto_155528 ) ) ( not ( = ?auto_155529 ?auto_155528 ) ) ( not ( = ?auto_155527 ?auto_155528 ) ) ( ON ?auto_155529 ?auto_155527 ) ( ON ?auto_155526 ?auto_155529 ) ( ON-TABLE ?auto_155528 ) ( ON ?auto_155525 ?auto_155526 ) ( ON ?auto_155524 ?auto_155525 ) ( CLEAR ?auto_155524 ) ( HOLDING ?auto_155523 ) ( CLEAR ?auto_155522 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_155521 ?auto_155522 ?auto_155523 )
      ( MAKE-6PILE ?auto_155521 ?auto_155522 ?auto_155523 ?auto_155524 ?auto_155525 ?auto_155526 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_155530 - BLOCK
      ?auto_155531 - BLOCK
      ?auto_155532 - BLOCK
      ?auto_155533 - BLOCK
      ?auto_155534 - BLOCK
      ?auto_155535 - BLOCK
    )
    :vars
    (
      ?auto_155536 - BLOCK
      ?auto_155537 - BLOCK
      ?auto_155538 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155530 ) ( ON ?auto_155531 ?auto_155530 ) ( not ( = ?auto_155530 ?auto_155531 ) ) ( not ( = ?auto_155530 ?auto_155532 ) ) ( not ( = ?auto_155530 ?auto_155533 ) ) ( not ( = ?auto_155530 ?auto_155534 ) ) ( not ( = ?auto_155530 ?auto_155535 ) ) ( not ( = ?auto_155530 ?auto_155536 ) ) ( not ( = ?auto_155531 ?auto_155532 ) ) ( not ( = ?auto_155531 ?auto_155533 ) ) ( not ( = ?auto_155531 ?auto_155534 ) ) ( not ( = ?auto_155531 ?auto_155535 ) ) ( not ( = ?auto_155531 ?auto_155536 ) ) ( not ( = ?auto_155532 ?auto_155533 ) ) ( not ( = ?auto_155532 ?auto_155534 ) ) ( not ( = ?auto_155532 ?auto_155535 ) ) ( not ( = ?auto_155532 ?auto_155536 ) ) ( not ( = ?auto_155533 ?auto_155534 ) ) ( not ( = ?auto_155533 ?auto_155535 ) ) ( not ( = ?auto_155533 ?auto_155536 ) ) ( not ( = ?auto_155534 ?auto_155535 ) ) ( not ( = ?auto_155534 ?auto_155536 ) ) ( not ( = ?auto_155535 ?auto_155536 ) ) ( not ( = ?auto_155530 ?auto_155537 ) ) ( not ( = ?auto_155531 ?auto_155537 ) ) ( not ( = ?auto_155532 ?auto_155537 ) ) ( not ( = ?auto_155533 ?auto_155537 ) ) ( not ( = ?auto_155534 ?auto_155537 ) ) ( not ( = ?auto_155535 ?auto_155537 ) ) ( not ( = ?auto_155536 ?auto_155537 ) ) ( ON ?auto_155537 ?auto_155538 ) ( not ( = ?auto_155530 ?auto_155538 ) ) ( not ( = ?auto_155531 ?auto_155538 ) ) ( not ( = ?auto_155532 ?auto_155538 ) ) ( not ( = ?auto_155533 ?auto_155538 ) ) ( not ( = ?auto_155534 ?auto_155538 ) ) ( not ( = ?auto_155535 ?auto_155538 ) ) ( not ( = ?auto_155536 ?auto_155538 ) ) ( not ( = ?auto_155537 ?auto_155538 ) ) ( ON ?auto_155536 ?auto_155537 ) ( ON ?auto_155535 ?auto_155536 ) ( ON-TABLE ?auto_155538 ) ( ON ?auto_155534 ?auto_155535 ) ( ON ?auto_155533 ?auto_155534 ) ( CLEAR ?auto_155531 ) ( ON ?auto_155532 ?auto_155533 ) ( CLEAR ?auto_155532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_155538 ?auto_155537 ?auto_155536 ?auto_155535 ?auto_155534 ?auto_155533 )
      ( MAKE-6PILE ?auto_155530 ?auto_155531 ?auto_155532 ?auto_155533 ?auto_155534 ?auto_155535 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_155539 - BLOCK
      ?auto_155540 - BLOCK
      ?auto_155541 - BLOCK
      ?auto_155542 - BLOCK
      ?auto_155543 - BLOCK
      ?auto_155544 - BLOCK
    )
    :vars
    (
      ?auto_155546 - BLOCK
      ?auto_155545 - BLOCK
      ?auto_155547 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155539 ) ( not ( = ?auto_155539 ?auto_155540 ) ) ( not ( = ?auto_155539 ?auto_155541 ) ) ( not ( = ?auto_155539 ?auto_155542 ) ) ( not ( = ?auto_155539 ?auto_155543 ) ) ( not ( = ?auto_155539 ?auto_155544 ) ) ( not ( = ?auto_155539 ?auto_155546 ) ) ( not ( = ?auto_155540 ?auto_155541 ) ) ( not ( = ?auto_155540 ?auto_155542 ) ) ( not ( = ?auto_155540 ?auto_155543 ) ) ( not ( = ?auto_155540 ?auto_155544 ) ) ( not ( = ?auto_155540 ?auto_155546 ) ) ( not ( = ?auto_155541 ?auto_155542 ) ) ( not ( = ?auto_155541 ?auto_155543 ) ) ( not ( = ?auto_155541 ?auto_155544 ) ) ( not ( = ?auto_155541 ?auto_155546 ) ) ( not ( = ?auto_155542 ?auto_155543 ) ) ( not ( = ?auto_155542 ?auto_155544 ) ) ( not ( = ?auto_155542 ?auto_155546 ) ) ( not ( = ?auto_155543 ?auto_155544 ) ) ( not ( = ?auto_155543 ?auto_155546 ) ) ( not ( = ?auto_155544 ?auto_155546 ) ) ( not ( = ?auto_155539 ?auto_155545 ) ) ( not ( = ?auto_155540 ?auto_155545 ) ) ( not ( = ?auto_155541 ?auto_155545 ) ) ( not ( = ?auto_155542 ?auto_155545 ) ) ( not ( = ?auto_155543 ?auto_155545 ) ) ( not ( = ?auto_155544 ?auto_155545 ) ) ( not ( = ?auto_155546 ?auto_155545 ) ) ( ON ?auto_155545 ?auto_155547 ) ( not ( = ?auto_155539 ?auto_155547 ) ) ( not ( = ?auto_155540 ?auto_155547 ) ) ( not ( = ?auto_155541 ?auto_155547 ) ) ( not ( = ?auto_155542 ?auto_155547 ) ) ( not ( = ?auto_155543 ?auto_155547 ) ) ( not ( = ?auto_155544 ?auto_155547 ) ) ( not ( = ?auto_155546 ?auto_155547 ) ) ( not ( = ?auto_155545 ?auto_155547 ) ) ( ON ?auto_155546 ?auto_155545 ) ( ON ?auto_155544 ?auto_155546 ) ( ON-TABLE ?auto_155547 ) ( ON ?auto_155543 ?auto_155544 ) ( ON ?auto_155542 ?auto_155543 ) ( ON ?auto_155541 ?auto_155542 ) ( CLEAR ?auto_155541 ) ( HOLDING ?auto_155540 ) ( CLEAR ?auto_155539 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_155539 ?auto_155540 )
      ( MAKE-6PILE ?auto_155539 ?auto_155540 ?auto_155541 ?auto_155542 ?auto_155543 ?auto_155544 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_155548 - BLOCK
      ?auto_155549 - BLOCK
      ?auto_155550 - BLOCK
      ?auto_155551 - BLOCK
      ?auto_155552 - BLOCK
      ?auto_155553 - BLOCK
    )
    :vars
    (
      ?auto_155555 - BLOCK
      ?auto_155554 - BLOCK
      ?auto_155556 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155548 ) ( not ( = ?auto_155548 ?auto_155549 ) ) ( not ( = ?auto_155548 ?auto_155550 ) ) ( not ( = ?auto_155548 ?auto_155551 ) ) ( not ( = ?auto_155548 ?auto_155552 ) ) ( not ( = ?auto_155548 ?auto_155553 ) ) ( not ( = ?auto_155548 ?auto_155555 ) ) ( not ( = ?auto_155549 ?auto_155550 ) ) ( not ( = ?auto_155549 ?auto_155551 ) ) ( not ( = ?auto_155549 ?auto_155552 ) ) ( not ( = ?auto_155549 ?auto_155553 ) ) ( not ( = ?auto_155549 ?auto_155555 ) ) ( not ( = ?auto_155550 ?auto_155551 ) ) ( not ( = ?auto_155550 ?auto_155552 ) ) ( not ( = ?auto_155550 ?auto_155553 ) ) ( not ( = ?auto_155550 ?auto_155555 ) ) ( not ( = ?auto_155551 ?auto_155552 ) ) ( not ( = ?auto_155551 ?auto_155553 ) ) ( not ( = ?auto_155551 ?auto_155555 ) ) ( not ( = ?auto_155552 ?auto_155553 ) ) ( not ( = ?auto_155552 ?auto_155555 ) ) ( not ( = ?auto_155553 ?auto_155555 ) ) ( not ( = ?auto_155548 ?auto_155554 ) ) ( not ( = ?auto_155549 ?auto_155554 ) ) ( not ( = ?auto_155550 ?auto_155554 ) ) ( not ( = ?auto_155551 ?auto_155554 ) ) ( not ( = ?auto_155552 ?auto_155554 ) ) ( not ( = ?auto_155553 ?auto_155554 ) ) ( not ( = ?auto_155555 ?auto_155554 ) ) ( ON ?auto_155554 ?auto_155556 ) ( not ( = ?auto_155548 ?auto_155556 ) ) ( not ( = ?auto_155549 ?auto_155556 ) ) ( not ( = ?auto_155550 ?auto_155556 ) ) ( not ( = ?auto_155551 ?auto_155556 ) ) ( not ( = ?auto_155552 ?auto_155556 ) ) ( not ( = ?auto_155553 ?auto_155556 ) ) ( not ( = ?auto_155555 ?auto_155556 ) ) ( not ( = ?auto_155554 ?auto_155556 ) ) ( ON ?auto_155555 ?auto_155554 ) ( ON ?auto_155553 ?auto_155555 ) ( ON-TABLE ?auto_155556 ) ( ON ?auto_155552 ?auto_155553 ) ( ON ?auto_155551 ?auto_155552 ) ( ON ?auto_155550 ?auto_155551 ) ( CLEAR ?auto_155548 ) ( ON ?auto_155549 ?auto_155550 ) ( CLEAR ?auto_155549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_155556 ?auto_155554 ?auto_155555 ?auto_155553 ?auto_155552 ?auto_155551 ?auto_155550 )
      ( MAKE-6PILE ?auto_155548 ?auto_155549 ?auto_155550 ?auto_155551 ?auto_155552 ?auto_155553 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_155557 - BLOCK
      ?auto_155558 - BLOCK
      ?auto_155559 - BLOCK
      ?auto_155560 - BLOCK
      ?auto_155561 - BLOCK
      ?auto_155562 - BLOCK
    )
    :vars
    (
      ?auto_155565 - BLOCK
      ?auto_155563 - BLOCK
      ?auto_155564 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155557 ?auto_155558 ) ) ( not ( = ?auto_155557 ?auto_155559 ) ) ( not ( = ?auto_155557 ?auto_155560 ) ) ( not ( = ?auto_155557 ?auto_155561 ) ) ( not ( = ?auto_155557 ?auto_155562 ) ) ( not ( = ?auto_155557 ?auto_155565 ) ) ( not ( = ?auto_155558 ?auto_155559 ) ) ( not ( = ?auto_155558 ?auto_155560 ) ) ( not ( = ?auto_155558 ?auto_155561 ) ) ( not ( = ?auto_155558 ?auto_155562 ) ) ( not ( = ?auto_155558 ?auto_155565 ) ) ( not ( = ?auto_155559 ?auto_155560 ) ) ( not ( = ?auto_155559 ?auto_155561 ) ) ( not ( = ?auto_155559 ?auto_155562 ) ) ( not ( = ?auto_155559 ?auto_155565 ) ) ( not ( = ?auto_155560 ?auto_155561 ) ) ( not ( = ?auto_155560 ?auto_155562 ) ) ( not ( = ?auto_155560 ?auto_155565 ) ) ( not ( = ?auto_155561 ?auto_155562 ) ) ( not ( = ?auto_155561 ?auto_155565 ) ) ( not ( = ?auto_155562 ?auto_155565 ) ) ( not ( = ?auto_155557 ?auto_155563 ) ) ( not ( = ?auto_155558 ?auto_155563 ) ) ( not ( = ?auto_155559 ?auto_155563 ) ) ( not ( = ?auto_155560 ?auto_155563 ) ) ( not ( = ?auto_155561 ?auto_155563 ) ) ( not ( = ?auto_155562 ?auto_155563 ) ) ( not ( = ?auto_155565 ?auto_155563 ) ) ( ON ?auto_155563 ?auto_155564 ) ( not ( = ?auto_155557 ?auto_155564 ) ) ( not ( = ?auto_155558 ?auto_155564 ) ) ( not ( = ?auto_155559 ?auto_155564 ) ) ( not ( = ?auto_155560 ?auto_155564 ) ) ( not ( = ?auto_155561 ?auto_155564 ) ) ( not ( = ?auto_155562 ?auto_155564 ) ) ( not ( = ?auto_155565 ?auto_155564 ) ) ( not ( = ?auto_155563 ?auto_155564 ) ) ( ON ?auto_155565 ?auto_155563 ) ( ON ?auto_155562 ?auto_155565 ) ( ON-TABLE ?auto_155564 ) ( ON ?auto_155561 ?auto_155562 ) ( ON ?auto_155560 ?auto_155561 ) ( ON ?auto_155559 ?auto_155560 ) ( ON ?auto_155558 ?auto_155559 ) ( CLEAR ?auto_155558 ) ( HOLDING ?auto_155557 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_155557 )
      ( MAKE-6PILE ?auto_155557 ?auto_155558 ?auto_155559 ?auto_155560 ?auto_155561 ?auto_155562 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_155566 - BLOCK
      ?auto_155567 - BLOCK
      ?auto_155568 - BLOCK
      ?auto_155569 - BLOCK
      ?auto_155570 - BLOCK
      ?auto_155571 - BLOCK
    )
    :vars
    (
      ?auto_155572 - BLOCK
      ?auto_155574 - BLOCK
      ?auto_155573 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155566 ?auto_155567 ) ) ( not ( = ?auto_155566 ?auto_155568 ) ) ( not ( = ?auto_155566 ?auto_155569 ) ) ( not ( = ?auto_155566 ?auto_155570 ) ) ( not ( = ?auto_155566 ?auto_155571 ) ) ( not ( = ?auto_155566 ?auto_155572 ) ) ( not ( = ?auto_155567 ?auto_155568 ) ) ( not ( = ?auto_155567 ?auto_155569 ) ) ( not ( = ?auto_155567 ?auto_155570 ) ) ( not ( = ?auto_155567 ?auto_155571 ) ) ( not ( = ?auto_155567 ?auto_155572 ) ) ( not ( = ?auto_155568 ?auto_155569 ) ) ( not ( = ?auto_155568 ?auto_155570 ) ) ( not ( = ?auto_155568 ?auto_155571 ) ) ( not ( = ?auto_155568 ?auto_155572 ) ) ( not ( = ?auto_155569 ?auto_155570 ) ) ( not ( = ?auto_155569 ?auto_155571 ) ) ( not ( = ?auto_155569 ?auto_155572 ) ) ( not ( = ?auto_155570 ?auto_155571 ) ) ( not ( = ?auto_155570 ?auto_155572 ) ) ( not ( = ?auto_155571 ?auto_155572 ) ) ( not ( = ?auto_155566 ?auto_155574 ) ) ( not ( = ?auto_155567 ?auto_155574 ) ) ( not ( = ?auto_155568 ?auto_155574 ) ) ( not ( = ?auto_155569 ?auto_155574 ) ) ( not ( = ?auto_155570 ?auto_155574 ) ) ( not ( = ?auto_155571 ?auto_155574 ) ) ( not ( = ?auto_155572 ?auto_155574 ) ) ( ON ?auto_155574 ?auto_155573 ) ( not ( = ?auto_155566 ?auto_155573 ) ) ( not ( = ?auto_155567 ?auto_155573 ) ) ( not ( = ?auto_155568 ?auto_155573 ) ) ( not ( = ?auto_155569 ?auto_155573 ) ) ( not ( = ?auto_155570 ?auto_155573 ) ) ( not ( = ?auto_155571 ?auto_155573 ) ) ( not ( = ?auto_155572 ?auto_155573 ) ) ( not ( = ?auto_155574 ?auto_155573 ) ) ( ON ?auto_155572 ?auto_155574 ) ( ON ?auto_155571 ?auto_155572 ) ( ON-TABLE ?auto_155573 ) ( ON ?auto_155570 ?auto_155571 ) ( ON ?auto_155569 ?auto_155570 ) ( ON ?auto_155568 ?auto_155569 ) ( ON ?auto_155567 ?auto_155568 ) ( ON ?auto_155566 ?auto_155567 ) ( CLEAR ?auto_155566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_155573 ?auto_155574 ?auto_155572 ?auto_155571 ?auto_155570 ?auto_155569 ?auto_155568 ?auto_155567 )
      ( MAKE-6PILE ?auto_155566 ?auto_155567 ?auto_155568 ?auto_155569 ?auto_155570 ?auto_155571 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_155577 - BLOCK
      ?auto_155578 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_155578 ) ( CLEAR ?auto_155577 ) ( ON-TABLE ?auto_155577 ) ( not ( = ?auto_155577 ?auto_155578 ) ) )
    :subtasks
    ( ( !STACK ?auto_155578 ?auto_155577 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_155579 - BLOCK
      ?auto_155580 - BLOCK
    )
    :vars
    (
      ?auto_155581 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_155579 ) ( ON-TABLE ?auto_155579 ) ( not ( = ?auto_155579 ?auto_155580 ) ) ( ON ?auto_155580 ?auto_155581 ) ( CLEAR ?auto_155580 ) ( HAND-EMPTY ) ( not ( = ?auto_155579 ?auto_155581 ) ) ( not ( = ?auto_155580 ?auto_155581 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_155580 ?auto_155581 )
      ( MAKE-2PILE ?auto_155579 ?auto_155580 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_155582 - BLOCK
      ?auto_155583 - BLOCK
    )
    :vars
    (
      ?auto_155584 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155582 ?auto_155583 ) ) ( ON ?auto_155583 ?auto_155584 ) ( CLEAR ?auto_155583 ) ( not ( = ?auto_155582 ?auto_155584 ) ) ( not ( = ?auto_155583 ?auto_155584 ) ) ( HOLDING ?auto_155582 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_155582 )
      ( MAKE-2PILE ?auto_155582 ?auto_155583 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_155585 - BLOCK
      ?auto_155586 - BLOCK
    )
    :vars
    (
      ?auto_155587 - BLOCK
      ?auto_155590 - BLOCK
      ?auto_155591 - BLOCK
      ?auto_155592 - BLOCK
      ?auto_155588 - BLOCK
      ?auto_155589 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155585 ?auto_155586 ) ) ( ON ?auto_155586 ?auto_155587 ) ( not ( = ?auto_155585 ?auto_155587 ) ) ( not ( = ?auto_155586 ?auto_155587 ) ) ( ON ?auto_155585 ?auto_155586 ) ( CLEAR ?auto_155585 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_155590 ) ( ON ?auto_155591 ?auto_155590 ) ( ON ?auto_155592 ?auto_155591 ) ( ON ?auto_155588 ?auto_155592 ) ( ON ?auto_155589 ?auto_155588 ) ( ON ?auto_155587 ?auto_155589 ) ( not ( = ?auto_155590 ?auto_155591 ) ) ( not ( = ?auto_155590 ?auto_155592 ) ) ( not ( = ?auto_155590 ?auto_155588 ) ) ( not ( = ?auto_155590 ?auto_155589 ) ) ( not ( = ?auto_155590 ?auto_155587 ) ) ( not ( = ?auto_155590 ?auto_155586 ) ) ( not ( = ?auto_155590 ?auto_155585 ) ) ( not ( = ?auto_155591 ?auto_155592 ) ) ( not ( = ?auto_155591 ?auto_155588 ) ) ( not ( = ?auto_155591 ?auto_155589 ) ) ( not ( = ?auto_155591 ?auto_155587 ) ) ( not ( = ?auto_155591 ?auto_155586 ) ) ( not ( = ?auto_155591 ?auto_155585 ) ) ( not ( = ?auto_155592 ?auto_155588 ) ) ( not ( = ?auto_155592 ?auto_155589 ) ) ( not ( = ?auto_155592 ?auto_155587 ) ) ( not ( = ?auto_155592 ?auto_155586 ) ) ( not ( = ?auto_155592 ?auto_155585 ) ) ( not ( = ?auto_155588 ?auto_155589 ) ) ( not ( = ?auto_155588 ?auto_155587 ) ) ( not ( = ?auto_155588 ?auto_155586 ) ) ( not ( = ?auto_155588 ?auto_155585 ) ) ( not ( = ?auto_155589 ?auto_155587 ) ) ( not ( = ?auto_155589 ?auto_155586 ) ) ( not ( = ?auto_155589 ?auto_155585 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_155590 ?auto_155591 ?auto_155592 ?auto_155588 ?auto_155589 ?auto_155587 ?auto_155586 )
      ( MAKE-2PILE ?auto_155585 ?auto_155586 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_155593 - BLOCK
      ?auto_155594 - BLOCK
    )
    :vars
    (
      ?auto_155596 - BLOCK
      ?auto_155599 - BLOCK
      ?auto_155598 - BLOCK
      ?auto_155597 - BLOCK
      ?auto_155595 - BLOCK
      ?auto_155600 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155593 ?auto_155594 ) ) ( ON ?auto_155594 ?auto_155596 ) ( not ( = ?auto_155593 ?auto_155596 ) ) ( not ( = ?auto_155594 ?auto_155596 ) ) ( ON-TABLE ?auto_155599 ) ( ON ?auto_155598 ?auto_155599 ) ( ON ?auto_155597 ?auto_155598 ) ( ON ?auto_155595 ?auto_155597 ) ( ON ?auto_155600 ?auto_155595 ) ( ON ?auto_155596 ?auto_155600 ) ( not ( = ?auto_155599 ?auto_155598 ) ) ( not ( = ?auto_155599 ?auto_155597 ) ) ( not ( = ?auto_155599 ?auto_155595 ) ) ( not ( = ?auto_155599 ?auto_155600 ) ) ( not ( = ?auto_155599 ?auto_155596 ) ) ( not ( = ?auto_155599 ?auto_155594 ) ) ( not ( = ?auto_155599 ?auto_155593 ) ) ( not ( = ?auto_155598 ?auto_155597 ) ) ( not ( = ?auto_155598 ?auto_155595 ) ) ( not ( = ?auto_155598 ?auto_155600 ) ) ( not ( = ?auto_155598 ?auto_155596 ) ) ( not ( = ?auto_155598 ?auto_155594 ) ) ( not ( = ?auto_155598 ?auto_155593 ) ) ( not ( = ?auto_155597 ?auto_155595 ) ) ( not ( = ?auto_155597 ?auto_155600 ) ) ( not ( = ?auto_155597 ?auto_155596 ) ) ( not ( = ?auto_155597 ?auto_155594 ) ) ( not ( = ?auto_155597 ?auto_155593 ) ) ( not ( = ?auto_155595 ?auto_155600 ) ) ( not ( = ?auto_155595 ?auto_155596 ) ) ( not ( = ?auto_155595 ?auto_155594 ) ) ( not ( = ?auto_155595 ?auto_155593 ) ) ( not ( = ?auto_155600 ?auto_155596 ) ) ( not ( = ?auto_155600 ?auto_155594 ) ) ( not ( = ?auto_155600 ?auto_155593 ) ) ( HOLDING ?auto_155593 ) ( CLEAR ?auto_155594 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_155599 ?auto_155598 ?auto_155597 ?auto_155595 ?auto_155600 ?auto_155596 ?auto_155594 ?auto_155593 )
      ( MAKE-2PILE ?auto_155593 ?auto_155594 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_155601 - BLOCK
      ?auto_155602 - BLOCK
    )
    :vars
    (
      ?auto_155604 - BLOCK
      ?auto_155603 - BLOCK
      ?auto_155607 - BLOCK
      ?auto_155606 - BLOCK
      ?auto_155608 - BLOCK
      ?auto_155605 - BLOCK
      ?auto_155609 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155601 ?auto_155602 ) ) ( ON ?auto_155602 ?auto_155604 ) ( not ( = ?auto_155601 ?auto_155604 ) ) ( not ( = ?auto_155602 ?auto_155604 ) ) ( ON-TABLE ?auto_155603 ) ( ON ?auto_155607 ?auto_155603 ) ( ON ?auto_155606 ?auto_155607 ) ( ON ?auto_155608 ?auto_155606 ) ( ON ?auto_155605 ?auto_155608 ) ( ON ?auto_155604 ?auto_155605 ) ( not ( = ?auto_155603 ?auto_155607 ) ) ( not ( = ?auto_155603 ?auto_155606 ) ) ( not ( = ?auto_155603 ?auto_155608 ) ) ( not ( = ?auto_155603 ?auto_155605 ) ) ( not ( = ?auto_155603 ?auto_155604 ) ) ( not ( = ?auto_155603 ?auto_155602 ) ) ( not ( = ?auto_155603 ?auto_155601 ) ) ( not ( = ?auto_155607 ?auto_155606 ) ) ( not ( = ?auto_155607 ?auto_155608 ) ) ( not ( = ?auto_155607 ?auto_155605 ) ) ( not ( = ?auto_155607 ?auto_155604 ) ) ( not ( = ?auto_155607 ?auto_155602 ) ) ( not ( = ?auto_155607 ?auto_155601 ) ) ( not ( = ?auto_155606 ?auto_155608 ) ) ( not ( = ?auto_155606 ?auto_155605 ) ) ( not ( = ?auto_155606 ?auto_155604 ) ) ( not ( = ?auto_155606 ?auto_155602 ) ) ( not ( = ?auto_155606 ?auto_155601 ) ) ( not ( = ?auto_155608 ?auto_155605 ) ) ( not ( = ?auto_155608 ?auto_155604 ) ) ( not ( = ?auto_155608 ?auto_155602 ) ) ( not ( = ?auto_155608 ?auto_155601 ) ) ( not ( = ?auto_155605 ?auto_155604 ) ) ( not ( = ?auto_155605 ?auto_155602 ) ) ( not ( = ?auto_155605 ?auto_155601 ) ) ( CLEAR ?auto_155602 ) ( ON ?auto_155601 ?auto_155609 ) ( CLEAR ?auto_155601 ) ( HAND-EMPTY ) ( not ( = ?auto_155601 ?auto_155609 ) ) ( not ( = ?auto_155602 ?auto_155609 ) ) ( not ( = ?auto_155604 ?auto_155609 ) ) ( not ( = ?auto_155603 ?auto_155609 ) ) ( not ( = ?auto_155607 ?auto_155609 ) ) ( not ( = ?auto_155606 ?auto_155609 ) ) ( not ( = ?auto_155608 ?auto_155609 ) ) ( not ( = ?auto_155605 ?auto_155609 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_155601 ?auto_155609 )
      ( MAKE-2PILE ?auto_155601 ?auto_155602 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_155610 - BLOCK
      ?auto_155611 - BLOCK
    )
    :vars
    (
      ?auto_155613 - BLOCK
      ?auto_155615 - BLOCK
      ?auto_155617 - BLOCK
      ?auto_155614 - BLOCK
      ?auto_155612 - BLOCK
      ?auto_155616 - BLOCK
      ?auto_155618 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155610 ?auto_155611 ) ) ( not ( = ?auto_155610 ?auto_155613 ) ) ( not ( = ?auto_155611 ?auto_155613 ) ) ( ON-TABLE ?auto_155615 ) ( ON ?auto_155617 ?auto_155615 ) ( ON ?auto_155614 ?auto_155617 ) ( ON ?auto_155612 ?auto_155614 ) ( ON ?auto_155616 ?auto_155612 ) ( ON ?auto_155613 ?auto_155616 ) ( not ( = ?auto_155615 ?auto_155617 ) ) ( not ( = ?auto_155615 ?auto_155614 ) ) ( not ( = ?auto_155615 ?auto_155612 ) ) ( not ( = ?auto_155615 ?auto_155616 ) ) ( not ( = ?auto_155615 ?auto_155613 ) ) ( not ( = ?auto_155615 ?auto_155611 ) ) ( not ( = ?auto_155615 ?auto_155610 ) ) ( not ( = ?auto_155617 ?auto_155614 ) ) ( not ( = ?auto_155617 ?auto_155612 ) ) ( not ( = ?auto_155617 ?auto_155616 ) ) ( not ( = ?auto_155617 ?auto_155613 ) ) ( not ( = ?auto_155617 ?auto_155611 ) ) ( not ( = ?auto_155617 ?auto_155610 ) ) ( not ( = ?auto_155614 ?auto_155612 ) ) ( not ( = ?auto_155614 ?auto_155616 ) ) ( not ( = ?auto_155614 ?auto_155613 ) ) ( not ( = ?auto_155614 ?auto_155611 ) ) ( not ( = ?auto_155614 ?auto_155610 ) ) ( not ( = ?auto_155612 ?auto_155616 ) ) ( not ( = ?auto_155612 ?auto_155613 ) ) ( not ( = ?auto_155612 ?auto_155611 ) ) ( not ( = ?auto_155612 ?auto_155610 ) ) ( not ( = ?auto_155616 ?auto_155613 ) ) ( not ( = ?auto_155616 ?auto_155611 ) ) ( not ( = ?auto_155616 ?auto_155610 ) ) ( ON ?auto_155610 ?auto_155618 ) ( CLEAR ?auto_155610 ) ( not ( = ?auto_155610 ?auto_155618 ) ) ( not ( = ?auto_155611 ?auto_155618 ) ) ( not ( = ?auto_155613 ?auto_155618 ) ) ( not ( = ?auto_155615 ?auto_155618 ) ) ( not ( = ?auto_155617 ?auto_155618 ) ) ( not ( = ?auto_155614 ?auto_155618 ) ) ( not ( = ?auto_155612 ?auto_155618 ) ) ( not ( = ?auto_155616 ?auto_155618 ) ) ( HOLDING ?auto_155611 ) ( CLEAR ?auto_155613 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_155615 ?auto_155617 ?auto_155614 ?auto_155612 ?auto_155616 ?auto_155613 ?auto_155611 )
      ( MAKE-2PILE ?auto_155610 ?auto_155611 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_155619 - BLOCK
      ?auto_155620 - BLOCK
    )
    :vars
    (
      ?auto_155622 - BLOCK
      ?auto_155621 - BLOCK
      ?auto_155624 - BLOCK
      ?auto_155627 - BLOCK
      ?auto_155626 - BLOCK
      ?auto_155625 - BLOCK
      ?auto_155623 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155619 ?auto_155620 ) ) ( not ( = ?auto_155619 ?auto_155622 ) ) ( not ( = ?auto_155620 ?auto_155622 ) ) ( ON-TABLE ?auto_155621 ) ( ON ?auto_155624 ?auto_155621 ) ( ON ?auto_155627 ?auto_155624 ) ( ON ?auto_155626 ?auto_155627 ) ( ON ?auto_155625 ?auto_155626 ) ( ON ?auto_155622 ?auto_155625 ) ( not ( = ?auto_155621 ?auto_155624 ) ) ( not ( = ?auto_155621 ?auto_155627 ) ) ( not ( = ?auto_155621 ?auto_155626 ) ) ( not ( = ?auto_155621 ?auto_155625 ) ) ( not ( = ?auto_155621 ?auto_155622 ) ) ( not ( = ?auto_155621 ?auto_155620 ) ) ( not ( = ?auto_155621 ?auto_155619 ) ) ( not ( = ?auto_155624 ?auto_155627 ) ) ( not ( = ?auto_155624 ?auto_155626 ) ) ( not ( = ?auto_155624 ?auto_155625 ) ) ( not ( = ?auto_155624 ?auto_155622 ) ) ( not ( = ?auto_155624 ?auto_155620 ) ) ( not ( = ?auto_155624 ?auto_155619 ) ) ( not ( = ?auto_155627 ?auto_155626 ) ) ( not ( = ?auto_155627 ?auto_155625 ) ) ( not ( = ?auto_155627 ?auto_155622 ) ) ( not ( = ?auto_155627 ?auto_155620 ) ) ( not ( = ?auto_155627 ?auto_155619 ) ) ( not ( = ?auto_155626 ?auto_155625 ) ) ( not ( = ?auto_155626 ?auto_155622 ) ) ( not ( = ?auto_155626 ?auto_155620 ) ) ( not ( = ?auto_155626 ?auto_155619 ) ) ( not ( = ?auto_155625 ?auto_155622 ) ) ( not ( = ?auto_155625 ?auto_155620 ) ) ( not ( = ?auto_155625 ?auto_155619 ) ) ( ON ?auto_155619 ?auto_155623 ) ( not ( = ?auto_155619 ?auto_155623 ) ) ( not ( = ?auto_155620 ?auto_155623 ) ) ( not ( = ?auto_155622 ?auto_155623 ) ) ( not ( = ?auto_155621 ?auto_155623 ) ) ( not ( = ?auto_155624 ?auto_155623 ) ) ( not ( = ?auto_155627 ?auto_155623 ) ) ( not ( = ?auto_155626 ?auto_155623 ) ) ( not ( = ?auto_155625 ?auto_155623 ) ) ( CLEAR ?auto_155622 ) ( ON ?auto_155620 ?auto_155619 ) ( CLEAR ?auto_155620 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_155623 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_155623 ?auto_155619 )
      ( MAKE-2PILE ?auto_155619 ?auto_155620 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_155628 - BLOCK
      ?auto_155629 - BLOCK
    )
    :vars
    (
      ?auto_155631 - BLOCK
      ?auto_155630 - BLOCK
      ?auto_155632 - BLOCK
      ?auto_155633 - BLOCK
      ?auto_155635 - BLOCK
      ?auto_155634 - BLOCK
      ?auto_155636 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155628 ?auto_155629 ) ) ( not ( = ?auto_155628 ?auto_155631 ) ) ( not ( = ?auto_155629 ?auto_155631 ) ) ( ON-TABLE ?auto_155630 ) ( ON ?auto_155632 ?auto_155630 ) ( ON ?auto_155633 ?auto_155632 ) ( ON ?auto_155635 ?auto_155633 ) ( ON ?auto_155634 ?auto_155635 ) ( not ( = ?auto_155630 ?auto_155632 ) ) ( not ( = ?auto_155630 ?auto_155633 ) ) ( not ( = ?auto_155630 ?auto_155635 ) ) ( not ( = ?auto_155630 ?auto_155634 ) ) ( not ( = ?auto_155630 ?auto_155631 ) ) ( not ( = ?auto_155630 ?auto_155629 ) ) ( not ( = ?auto_155630 ?auto_155628 ) ) ( not ( = ?auto_155632 ?auto_155633 ) ) ( not ( = ?auto_155632 ?auto_155635 ) ) ( not ( = ?auto_155632 ?auto_155634 ) ) ( not ( = ?auto_155632 ?auto_155631 ) ) ( not ( = ?auto_155632 ?auto_155629 ) ) ( not ( = ?auto_155632 ?auto_155628 ) ) ( not ( = ?auto_155633 ?auto_155635 ) ) ( not ( = ?auto_155633 ?auto_155634 ) ) ( not ( = ?auto_155633 ?auto_155631 ) ) ( not ( = ?auto_155633 ?auto_155629 ) ) ( not ( = ?auto_155633 ?auto_155628 ) ) ( not ( = ?auto_155635 ?auto_155634 ) ) ( not ( = ?auto_155635 ?auto_155631 ) ) ( not ( = ?auto_155635 ?auto_155629 ) ) ( not ( = ?auto_155635 ?auto_155628 ) ) ( not ( = ?auto_155634 ?auto_155631 ) ) ( not ( = ?auto_155634 ?auto_155629 ) ) ( not ( = ?auto_155634 ?auto_155628 ) ) ( ON ?auto_155628 ?auto_155636 ) ( not ( = ?auto_155628 ?auto_155636 ) ) ( not ( = ?auto_155629 ?auto_155636 ) ) ( not ( = ?auto_155631 ?auto_155636 ) ) ( not ( = ?auto_155630 ?auto_155636 ) ) ( not ( = ?auto_155632 ?auto_155636 ) ) ( not ( = ?auto_155633 ?auto_155636 ) ) ( not ( = ?auto_155635 ?auto_155636 ) ) ( not ( = ?auto_155634 ?auto_155636 ) ) ( ON ?auto_155629 ?auto_155628 ) ( CLEAR ?auto_155629 ) ( ON-TABLE ?auto_155636 ) ( HOLDING ?auto_155631 ) ( CLEAR ?auto_155634 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_155630 ?auto_155632 ?auto_155633 ?auto_155635 ?auto_155634 ?auto_155631 )
      ( MAKE-2PILE ?auto_155628 ?auto_155629 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_155637 - BLOCK
      ?auto_155638 - BLOCK
    )
    :vars
    (
      ?auto_155644 - BLOCK
      ?auto_155643 - BLOCK
      ?auto_155639 - BLOCK
      ?auto_155641 - BLOCK
      ?auto_155640 - BLOCK
      ?auto_155645 - BLOCK
      ?auto_155642 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155637 ?auto_155638 ) ) ( not ( = ?auto_155637 ?auto_155644 ) ) ( not ( = ?auto_155638 ?auto_155644 ) ) ( ON-TABLE ?auto_155643 ) ( ON ?auto_155639 ?auto_155643 ) ( ON ?auto_155641 ?auto_155639 ) ( ON ?auto_155640 ?auto_155641 ) ( ON ?auto_155645 ?auto_155640 ) ( not ( = ?auto_155643 ?auto_155639 ) ) ( not ( = ?auto_155643 ?auto_155641 ) ) ( not ( = ?auto_155643 ?auto_155640 ) ) ( not ( = ?auto_155643 ?auto_155645 ) ) ( not ( = ?auto_155643 ?auto_155644 ) ) ( not ( = ?auto_155643 ?auto_155638 ) ) ( not ( = ?auto_155643 ?auto_155637 ) ) ( not ( = ?auto_155639 ?auto_155641 ) ) ( not ( = ?auto_155639 ?auto_155640 ) ) ( not ( = ?auto_155639 ?auto_155645 ) ) ( not ( = ?auto_155639 ?auto_155644 ) ) ( not ( = ?auto_155639 ?auto_155638 ) ) ( not ( = ?auto_155639 ?auto_155637 ) ) ( not ( = ?auto_155641 ?auto_155640 ) ) ( not ( = ?auto_155641 ?auto_155645 ) ) ( not ( = ?auto_155641 ?auto_155644 ) ) ( not ( = ?auto_155641 ?auto_155638 ) ) ( not ( = ?auto_155641 ?auto_155637 ) ) ( not ( = ?auto_155640 ?auto_155645 ) ) ( not ( = ?auto_155640 ?auto_155644 ) ) ( not ( = ?auto_155640 ?auto_155638 ) ) ( not ( = ?auto_155640 ?auto_155637 ) ) ( not ( = ?auto_155645 ?auto_155644 ) ) ( not ( = ?auto_155645 ?auto_155638 ) ) ( not ( = ?auto_155645 ?auto_155637 ) ) ( ON ?auto_155637 ?auto_155642 ) ( not ( = ?auto_155637 ?auto_155642 ) ) ( not ( = ?auto_155638 ?auto_155642 ) ) ( not ( = ?auto_155644 ?auto_155642 ) ) ( not ( = ?auto_155643 ?auto_155642 ) ) ( not ( = ?auto_155639 ?auto_155642 ) ) ( not ( = ?auto_155641 ?auto_155642 ) ) ( not ( = ?auto_155640 ?auto_155642 ) ) ( not ( = ?auto_155645 ?auto_155642 ) ) ( ON ?auto_155638 ?auto_155637 ) ( ON-TABLE ?auto_155642 ) ( CLEAR ?auto_155645 ) ( ON ?auto_155644 ?auto_155638 ) ( CLEAR ?auto_155644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_155642 ?auto_155637 ?auto_155638 )
      ( MAKE-2PILE ?auto_155637 ?auto_155638 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_155646 - BLOCK
      ?auto_155647 - BLOCK
    )
    :vars
    (
      ?auto_155650 - BLOCK
      ?auto_155648 - BLOCK
      ?auto_155649 - BLOCK
      ?auto_155654 - BLOCK
      ?auto_155652 - BLOCK
      ?auto_155653 - BLOCK
      ?auto_155651 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155646 ?auto_155647 ) ) ( not ( = ?auto_155646 ?auto_155650 ) ) ( not ( = ?auto_155647 ?auto_155650 ) ) ( ON-TABLE ?auto_155648 ) ( ON ?auto_155649 ?auto_155648 ) ( ON ?auto_155654 ?auto_155649 ) ( ON ?auto_155652 ?auto_155654 ) ( not ( = ?auto_155648 ?auto_155649 ) ) ( not ( = ?auto_155648 ?auto_155654 ) ) ( not ( = ?auto_155648 ?auto_155652 ) ) ( not ( = ?auto_155648 ?auto_155653 ) ) ( not ( = ?auto_155648 ?auto_155650 ) ) ( not ( = ?auto_155648 ?auto_155647 ) ) ( not ( = ?auto_155648 ?auto_155646 ) ) ( not ( = ?auto_155649 ?auto_155654 ) ) ( not ( = ?auto_155649 ?auto_155652 ) ) ( not ( = ?auto_155649 ?auto_155653 ) ) ( not ( = ?auto_155649 ?auto_155650 ) ) ( not ( = ?auto_155649 ?auto_155647 ) ) ( not ( = ?auto_155649 ?auto_155646 ) ) ( not ( = ?auto_155654 ?auto_155652 ) ) ( not ( = ?auto_155654 ?auto_155653 ) ) ( not ( = ?auto_155654 ?auto_155650 ) ) ( not ( = ?auto_155654 ?auto_155647 ) ) ( not ( = ?auto_155654 ?auto_155646 ) ) ( not ( = ?auto_155652 ?auto_155653 ) ) ( not ( = ?auto_155652 ?auto_155650 ) ) ( not ( = ?auto_155652 ?auto_155647 ) ) ( not ( = ?auto_155652 ?auto_155646 ) ) ( not ( = ?auto_155653 ?auto_155650 ) ) ( not ( = ?auto_155653 ?auto_155647 ) ) ( not ( = ?auto_155653 ?auto_155646 ) ) ( ON ?auto_155646 ?auto_155651 ) ( not ( = ?auto_155646 ?auto_155651 ) ) ( not ( = ?auto_155647 ?auto_155651 ) ) ( not ( = ?auto_155650 ?auto_155651 ) ) ( not ( = ?auto_155648 ?auto_155651 ) ) ( not ( = ?auto_155649 ?auto_155651 ) ) ( not ( = ?auto_155654 ?auto_155651 ) ) ( not ( = ?auto_155652 ?auto_155651 ) ) ( not ( = ?auto_155653 ?auto_155651 ) ) ( ON ?auto_155647 ?auto_155646 ) ( ON-TABLE ?auto_155651 ) ( ON ?auto_155650 ?auto_155647 ) ( CLEAR ?auto_155650 ) ( HOLDING ?auto_155653 ) ( CLEAR ?auto_155652 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_155648 ?auto_155649 ?auto_155654 ?auto_155652 ?auto_155653 )
      ( MAKE-2PILE ?auto_155646 ?auto_155647 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_155655 - BLOCK
      ?auto_155656 - BLOCK
    )
    :vars
    (
      ?auto_155662 - BLOCK
      ?auto_155657 - BLOCK
      ?auto_155658 - BLOCK
      ?auto_155660 - BLOCK
      ?auto_155663 - BLOCK
      ?auto_155659 - BLOCK
      ?auto_155661 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155655 ?auto_155656 ) ) ( not ( = ?auto_155655 ?auto_155662 ) ) ( not ( = ?auto_155656 ?auto_155662 ) ) ( ON-TABLE ?auto_155657 ) ( ON ?auto_155658 ?auto_155657 ) ( ON ?auto_155660 ?auto_155658 ) ( ON ?auto_155663 ?auto_155660 ) ( not ( = ?auto_155657 ?auto_155658 ) ) ( not ( = ?auto_155657 ?auto_155660 ) ) ( not ( = ?auto_155657 ?auto_155663 ) ) ( not ( = ?auto_155657 ?auto_155659 ) ) ( not ( = ?auto_155657 ?auto_155662 ) ) ( not ( = ?auto_155657 ?auto_155656 ) ) ( not ( = ?auto_155657 ?auto_155655 ) ) ( not ( = ?auto_155658 ?auto_155660 ) ) ( not ( = ?auto_155658 ?auto_155663 ) ) ( not ( = ?auto_155658 ?auto_155659 ) ) ( not ( = ?auto_155658 ?auto_155662 ) ) ( not ( = ?auto_155658 ?auto_155656 ) ) ( not ( = ?auto_155658 ?auto_155655 ) ) ( not ( = ?auto_155660 ?auto_155663 ) ) ( not ( = ?auto_155660 ?auto_155659 ) ) ( not ( = ?auto_155660 ?auto_155662 ) ) ( not ( = ?auto_155660 ?auto_155656 ) ) ( not ( = ?auto_155660 ?auto_155655 ) ) ( not ( = ?auto_155663 ?auto_155659 ) ) ( not ( = ?auto_155663 ?auto_155662 ) ) ( not ( = ?auto_155663 ?auto_155656 ) ) ( not ( = ?auto_155663 ?auto_155655 ) ) ( not ( = ?auto_155659 ?auto_155662 ) ) ( not ( = ?auto_155659 ?auto_155656 ) ) ( not ( = ?auto_155659 ?auto_155655 ) ) ( ON ?auto_155655 ?auto_155661 ) ( not ( = ?auto_155655 ?auto_155661 ) ) ( not ( = ?auto_155656 ?auto_155661 ) ) ( not ( = ?auto_155662 ?auto_155661 ) ) ( not ( = ?auto_155657 ?auto_155661 ) ) ( not ( = ?auto_155658 ?auto_155661 ) ) ( not ( = ?auto_155660 ?auto_155661 ) ) ( not ( = ?auto_155663 ?auto_155661 ) ) ( not ( = ?auto_155659 ?auto_155661 ) ) ( ON ?auto_155656 ?auto_155655 ) ( ON-TABLE ?auto_155661 ) ( ON ?auto_155662 ?auto_155656 ) ( CLEAR ?auto_155663 ) ( ON ?auto_155659 ?auto_155662 ) ( CLEAR ?auto_155659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_155661 ?auto_155655 ?auto_155656 ?auto_155662 )
      ( MAKE-2PILE ?auto_155655 ?auto_155656 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_155664 - BLOCK
      ?auto_155665 - BLOCK
    )
    :vars
    (
      ?auto_155666 - BLOCK
      ?auto_155671 - BLOCK
      ?auto_155669 - BLOCK
      ?auto_155670 - BLOCK
      ?auto_155667 - BLOCK
      ?auto_155672 - BLOCK
      ?auto_155668 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155664 ?auto_155665 ) ) ( not ( = ?auto_155664 ?auto_155666 ) ) ( not ( = ?auto_155665 ?auto_155666 ) ) ( ON-TABLE ?auto_155671 ) ( ON ?auto_155669 ?auto_155671 ) ( ON ?auto_155670 ?auto_155669 ) ( not ( = ?auto_155671 ?auto_155669 ) ) ( not ( = ?auto_155671 ?auto_155670 ) ) ( not ( = ?auto_155671 ?auto_155667 ) ) ( not ( = ?auto_155671 ?auto_155672 ) ) ( not ( = ?auto_155671 ?auto_155666 ) ) ( not ( = ?auto_155671 ?auto_155665 ) ) ( not ( = ?auto_155671 ?auto_155664 ) ) ( not ( = ?auto_155669 ?auto_155670 ) ) ( not ( = ?auto_155669 ?auto_155667 ) ) ( not ( = ?auto_155669 ?auto_155672 ) ) ( not ( = ?auto_155669 ?auto_155666 ) ) ( not ( = ?auto_155669 ?auto_155665 ) ) ( not ( = ?auto_155669 ?auto_155664 ) ) ( not ( = ?auto_155670 ?auto_155667 ) ) ( not ( = ?auto_155670 ?auto_155672 ) ) ( not ( = ?auto_155670 ?auto_155666 ) ) ( not ( = ?auto_155670 ?auto_155665 ) ) ( not ( = ?auto_155670 ?auto_155664 ) ) ( not ( = ?auto_155667 ?auto_155672 ) ) ( not ( = ?auto_155667 ?auto_155666 ) ) ( not ( = ?auto_155667 ?auto_155665 ) ) ( not ( = ?auto_155667 ?auto_155664 ) ) ( not ( = ?auto_155672 ?auto_155666 ) ) ( not ( = ?auto_155672 ?auto_155665 ) ) ( not ( = ?auto_155672 ?auto_155664 ) ) ( ON ?auto_155664 ?auto_155668 ) ( not ( = ?auto_155664 ?auto_155668 ) ) ( not ( = ?auto_155665 ?auto_155668 ) ) ( not ( = ?auto_155666 ?auto_155668 ) ) ( not ( = ?auto_155671 ?auto_155668 ) ) ( not ( = ?auto_155669 ?auto_155668 ) ) ( not ( = ?auto_155670 ?auto_155668 ) ) ( not ( = ?auto_155667 ?auto_155668 ) ) ( not ( = ?auto_155672 ?auto_155668 ) ) ( ON ?auto_155665 ?auto_155664 ) ( ON-TABLE ?auto_155668 ) ( ON ?auto_155666 ?auto_155665 ) ( ON ?auto_155672 ?auto_155666 ) ( CLEAR ?auto_155672 ) ( HOLDING ?auto_155667 ) ( CLEAR ?auto_155670 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_155671 ?auto_155669 ?auto_155670 ?auto_155667 )
      ( MAKE-2PILE ?auto_155664 ?auto_155665 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_155673 - BLOCK
      ?auto_155674 - BLOCK
    )
    :vars
    (
      ?auto_155678 - BLOCK
      ?auto_155680 - BLOCK
      ?auto_155677 - BLOCK
      ?auto_155676 - BLOCK
      ?auto_155681 - BLOCK
      ?auto_155679 - BLOCK
      ?auto_155675 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155673 ?auto_155674 ) ) ( not ( = ?auto_155673 ?auto_155678 ) ) ( not ( = ?auto_155674 ?auto_155678 ) ) ( ON-TABLE ?auto_155680 ) ( ON ?auto_155677 ?auto_155680 ) ( ON ?auto_155676 ?auto_155677 ) ( not ( = ?auto_155680 ?auto_155677 ) ) ( not ( = ?auto_155680 ?auto_155676 ) ) ( not ( = ?auto_155680 ?auto_155681 ) ) ( not ( = ?auto_155680 ?auto_155679 ) ) ( not ( = ?auto_155680 ?auto_155678 ) ) ( not ( = ?auto_155680 ?auto_155674 ) ) ( not ( = ?auto_155680 ?auto_155673 ) ) ( not ( = ?auto_155677 ?auto_155676 ) ) ( not ( = ?auto_155677 ?auto_155681 ) ) ( not ( = ?auto_155677 ?auto_155679 ) ) ( not ( = ?auto_155677 ?auto_155678 ) ) ( not ( = ?auto_155677 ?auto_155674 ) ) ( not ( = ?auto_155677 ?auto_155673 ) ) ( not ( = ?auto_155676 ?auto_155681 ) ) ( not ( = ?auto_155676 ?auto_155679 ) ) ( not ( = ?auto_155676 ?auto_155678 ) ) ( not ( = ?auto_155676 ?auto_155674 ) ) ( not ( = ?auto_155676 ?auto_155673 ) ) ( not ( = ?auto_155681 ?auto_155679 ) ) ( not ( = ?auto_155681 ?auto_155678 ) ) ( not ( = ?auto_155681 ?auto_155674 ) ) ( not ( = ?auto_155681 ?auto_155673 ) ) ( not ( = ?auto_155679 ?auto_155678 ) ) ( not ( = ?auto_155679 ?auto_155674 ) ) ( not ( = ?auto_155679 ?auto_155673 ) ) ( ON ?auto_155673 ?auto_155675 ) ( not ( = ?auto_155673 ?auto_155675 ) ) ( not ( = ?auto_155674 ?auto_155675 ) ) ( not ( = ?auto_155678 ?auto_155675 ) ) ( not ( = ?auto_155680 ?auto_155675 ) ) ( not ( = ?auto_155677 ?auto_155675 ) ) ( not ( = ?auto_155676 ?auto_155675 ) ) ( not ( = ?auto_155681 ?auto_155675 ) ) ( not ( = ?auto_155679 ?auto_155675 ) ) ( ON ?auto_155674 ?auto_155673 ) ( ON-TABLE ?auto_155675 ) ( ON ?auto_155678 ?auto_155674 ) ( ON ?auto_155679 ?auto_155678 ) ( CLEAR ?auto_155676 ) ( ON ?auto_155681 ?auto_155679 ) ( CLEAR ?auto_155681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_155675 ?auto_155673 ?auto_155674 ?auto_155678 ?auto_155679 )
      ( MAKE-2PILE ?auto_155673 ?auto_155674 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_155682 - BLOCK
      ?auto_155683 - BLOCK
    )
    :vars
    (
      ?auto_155687 - BLOCK
      ?auto_155689 - BLOCK
      ?auto_155690 - BLOCK
      ?auto_155686 - BLOCK
      ?auto_155685 - BLOCK
      ?auto_155684 - BLOCK
      ?auto_155688 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155682 ?auto_155683 ) ) ( not ( = ?auto_155682 ?auto_155687 ) ) ( not ( = ?auto_155683 ?auto_155687 ) ) ( ON-TABLE ?auto_155689 ) ( ON ?auto_155690 ?auto_155689 ) ( not ( = ?auto_155689 ?auto_155690 ) ) ( not ( = ?auto_155689 ?auto_155686 ) ) ( not ( = ?auto_155689 ?auto_155685 ) ) ( not ( = ?auto_155689 ?auto_155684 ) ) ( not ( = ?auto_155689 ?auto_155687 ) ) ( not ( = ?auto_155689 ?auto_155683 ) ) ( not ( = ?auto_155689 ?auto_155682 ) ) ( not ( = ?auto_155690 ?auto_155686 ) ) ( not ( = ?auto_155690 ?auto_155685 ) ) ( not ( = ?auto_155690 ?auto_155684 ) ) ( not ( = ?auto_155690 ?auto_155687 ) ) ( not ( = ?auto_155690 ?auto_155683 ) ) ( not ( = ?auto_155690 ?auto_155682 ) ) ( not ( = ?auto_155686 ?auto_155685 ) ) ( not ( = ?auto_155686 ?auto_155684 ) ) ( not ( = ?auto_155686 ?auto_155687 ) ) ( not ( = ?auto_155686 ?auto_155683 ) ) ( not ( = ?auto_155686 ?auto_155682 ) ) ( not ( = ?auto_155685 ?auto_155684 ) ) ( not ( = ?auto_155685 ?auto_155687 ) ) ( not ( = ?auto_155685 ?auto_155683 ) ) ( not ( = ?auto_155685 ?auto_155682 ) ) ( not ( = ?auto_155684 ?auto_155687 ) ) ( not ( = ?auto_155684 ?auto_155683 ) ) ( not ( = ?auto_155684 ?auto_155682 ) ) ( ON ?auto_155682 ?auto_155688 ) ( not ( = ?auto_155682 ?auto_155688 ) ) ( not ( = ?auto_155683 ?auto_155688 ) ) ( not ( = ?auto_155687 ?auto_155688 ) ) ( not ( = ?auto_155689 ?auto_155688 ) ) ( not ( = ?auto_155690 ?auto_155688 ) ) ( not ( = ?auto_155686 ?auto_155688 ) ) ( not ( = ?auto_155685 ?auto_155688 ) ) ( not ( = ?auto_155684 ?auto_155688 ) ) ( ON ?auto_155683 ?auto_155682 ) ( ON-TABLE ?auto_155688 ) ( ON ?auto_155687 ?auto_155683 ) ( ON ?auto_155684 ?auto_155687 ) ( ON ?auto_155685 ?auto_155684 ) ( CLEAR ?auto_155685 ) ( HOLDING ?auto_155686 ) ( CLEAR ?auto_155690 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_155689 ?auto_155690 ?auto_155686 )
      ( MAKE-2PILE ?auto_155682 ?auto_155683 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_155691 - BLOCK
      ?auto_155692 - BLOCK
    )
    :vars
    (
      ?auto_155699 - BLOCK
      ?auto_155695 - BLOCK
      ?auto_155696 - BLOCK
      ?auto_155697 - BLOCK
      ?auto_155693 - BLOCK
      ?auto_155694 - BLOCK
      ?auto_155698 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155691 ?auto_155692 ) ) ( not ( = ?auto_155691 ?auto_155699 ) ) ( not ( = ?auto_155692 ?auto_155699 ) ) ( ON-TABLE ?auto_155695 ) ( ON ?auto_155696 ?auto_155695 ) ( not ( = ?auto_155695 ?auto_155696 ) ) ( not ( = ?auto_155695 ?auto_155697 ) ) ( not ( = ?auto_155695 ?auto_155693 ) ) ( not ( = ?auto_155695 ?auto_155694 ) ) ( not ( = ?auto_155695 ?auto_155699 ) ) ( not ( = ?auto_155695 ?auto_155692 ) ) ( not ( = ?auto_155695 ?auto_155691 ) ) ( not ( = ?auto_155696 ?auto_155697 ) ) ( not ( = ?auto_155696 ?auto_155693 ) ) ( not ( = ?auto_155696 ?auto_155694 ) ) ( not ( = ?auto_155696 ?auto_155699 ) ) ( not ( = ?auto_155696 ?auto_155692 ) ) ( not ( = ?auto_155696 ?auto_155691 ) ) ( not ( = ?auto_155697 ?auto_155693 ) ) ( not ( = ?auto_155697 ?auto_155694 ) ) ( not ( = ?auto_155697 ?auto_155699 ) ) ( not ( = ?auto_155697 ?auto_155692 ) ) ( not ( = ?auto_155697 ?auto_155691 ) ) ( not ( = ?auto_155693 ?auto_155694 ) ) ( not ( = ?auto_155693 ?auto_155699 ) ) ( not ( = ?auto_155693 ?auto_155692 ) ) ( not ( = ?auto_155693 ?auto_155691 ) ) ( not ( = ?auto_155694 ?auto_155699 ) ) ( not ( = ?auto_155694 ?auto_155692 ) ) ( not ( = ?auto_155694 ?auto_155691 ) ) ( ON ?auto_155691 ?auto_155698 ) ( not ( = ?auto_155691 ?auto_155698 ) ) ( not ( = ?auto_155692 ?auto_155698 ) ) ( not ( = ?auto_155699 ?auto_155698 ) ) ( not ( = ?auto_155695 ?auto_155698 ) ) ( not ( = ?auto_155696 ?auto_155698 ) ) ( not ( = ?auto_155697 ?auto_155698 ) ) ( not ( = ?auto_155693 ?auto_155698 ) ) ( not ( = ?auto_155694 ?auto_155698 ) ) ( ON ?auto_155692 ?auto_155691 ) ( ON-TABLE ?auto_155698 ) ( ON ?auto_155699 ?auto_155692 ) ( ON ?auto_155694 ?auto_155699 ) ( ON ?auto_155693 ?auto_155694 ) ( CLEAR ?auto_155696 ) ( ON ?auto_155697 ?auto_155693 ) ( CLEAR ?auto_155697 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_155698 ?auto_155691 ?auto_155692 ?auto_155699 ?auto_155694 ?auto_155693 )
      ( MAKE-2PILE ?auto_155691 ?auto_155692 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_155700 - BLOCK
      ?auto_155701 - BLOCK
    )
    :vars
    (
      ?auto_155706 - BLOCK
      ?auto_155704 - BLOCK
      ?auto_155703 - BLOCK
      ?auto_155707 - BLOCK
      ?auto_155708 - BLOCK
      ?auto_155705 - BLOCK
      ?auto_155702 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155700 ?auto_155701 ) ) ( not ( = ?auto_155700 ?auto_155706 ) ) ( not ( = ?auto_155701 ?auto_155706 ) ) ( ON-TABLE ?auto_155704 ) ( not ( = ?auto_155704 ?auto_155703 ) ) ( not ( = ?auto_155704 ?auto_155707 ) ) ( not ( = ?auto_155704 ?auto_155708 ) ) ( not ( = ?auto_155704 ?auto_155705 ) ) ( not ( = ?auto_155704 ?auto_155706 ) ) ( not ( = ?auto_155704 ?auto_155701 ) ) ( not ( = ?auto_155704 ?auto_155700 ) ) ( not ( = ?auto_155703 ?auto_155707 ) ) ( not ( = ?auto_155703 ?auto_155708 ) ) ( not ( = ?auto_155703 ?auto_155705 ) ) ( not ( = ?auto_155703 ?auto_155706 ) ) ( not ( = ?auto_155703 ?auto_155701 ) ) ( not ( = ?auto_155703 ?auto_155700 ) ) ( not ( = ?auto_155707 ?auto_155708 ) ) ( not ( = ?auto_155707 ?auto_155705 ) ) ( not ( = ?auto_155707 ?auto_155706 ) ) ( not ( = ?auto_155707 ?auto_155701 ) ) ( not ( = ?auto_155707 ?auto_155700 ) ) ( not ( = ?auto_155708 ?auto_155705 ) ) ( not ( = ?auto_155708 ?auto_155706 ) ) ( not ( = ?auto_155708 ?auto_155701 ) ) ( not ( = ?auto_155708 ?auto_155700 ) ) ( not ( = ?auto_155705 ?auto_155706 ) ) ( not ( = ?auto_155705 ?auto_155701 ) ) ( not ( = ?auto_155705 ?auto_155700 ) ) ( ON ?auto_155700 ?auto_155702 ) ( not ( = ?auto_155700 ?auto_155702 ) ) ( not ( = ?auto_155701 ?auto_155702 ) ) ( not ( = ?auto_155706 ?auto_155702 ) ) ( not ( = ?auto_155704 ?auto_155702 ) ) ( not ( = ?auto_155703 ?auto_155702 ) ) ( not ( = ?auto_155707 ?auto_155702 ) ) ( not ( = ?auto_155708 ?auto_155702 ) ) ( not ( = ?auto_155705 ?auto_155702 ) ) ( ON ?auto_155701 ?auto_155700 ) ( ON-TABLE ?auto_155702 ) ( ON ?auto_155706 ?auto_155701 ) ( ON ?auto_155705 ?auto_155706 ) ( ON ?auto_155708 ?auto_155705 ) ( ON ?auto_155707 ?auto_155708 ) ( CLEAR ?auto_155707 ) ( HOLDING ?auto_155703 ) ( CLEAR ?auto_155704 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_155704 ?auto_155703 )
      ( MAKE-2PILE ?auto_155700 ?auto_155701 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_155709 - BLOCK
      ?auto_155710 - BLOCK
    )
    :vars
    (
      ?auto_155717 - BLOCK
      ?auto_155715 - BLOCK
      ?auto_155714 - BLOCK
      ?auto_155713 - BLOCK
      ?auto_155716 - BLOCK
      ?auto_155712 - BLOCK
      ?auto_155711 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155709 ?auto_155710 ) ) ( not ( = ?auto_155709 ?auto_155717 ) ) ( not ( = ?auto_155710 ?auto_155717 ) ) ( ON-TABLE ?auto_155715 ) ( not ( = ?auto_155715 ?auto_155714 ) ) ( not ( = ?auto_155715 ?auto_155713 ) ) ( not ( = ?auto_155715 ?auto_155716 ) ) ( not ( = ?auto_155715 ?auto_155712 ) ) ( not ( = ?auto_155715 ?auto_155717 ) ) ( not ( = ?auto_155715 ?auto_155710 ) ) ( not ( = ?auto_155715 ?auto_155709 ) ) ( not ( = ?auto_155714 ?auto_155713 ) ) ( not ( = ?auto_155714 ?auto_155716 ) ) ( not ( = ?auto_155714 ?auto_155712 ) ) ( not ( = ?auto_155714 ?auto_155717 ) ) ( not ( = ?auto_155714 ?auto_155710 ) ) ( not ( = ?auto_155714 ?auto_155709 ) ) ( not ( = ?auto_155713 ?auto_155716 ) ) ( not ( = ?auto_155713 ?auto_155712 ) ) ( not ( = ?auto_155713 ?auto_155717 ) ) ( not ( = ?auto_155713 ?auto_155710 ) ) ( not ( = ?auto_155713 ?auto_155709 ) ) ( not ( = ?auto_155716 ?auto_155712 ) ) ( not ( = ?auto_155716 ?auto_155717 ) ) ( not ( = ?auto_155716 ?auto_155710 ) ) ( not ( = ?auto_155716 ?auto_155709 ) ) ( not ( = ?auto_155712 ?auto_155717 ) ) ( not ( = ?auto_155712 ?auto_155710 ) ) ( not ( = ?auto_155712 ?auto_155709 ) ) ( ON ?auto_155709 ?auto_155711 ) ( not ( = ?auto_155709 ?auto_155711 ) ) ( not ( = ?auto_155710 ?auto_155711 ) ) ( not ( = ?auto_155717 ?auto_155711 ) ) ( not ( = ?auto_155715 ?auto_155711 ) ) ( not ( = ?auto_155714 ?auto_155711 ) ) ( not ( = ?auto_155713 ?auto_155711 ) ) ( not ( = ?auto_155716 ?auto_155711 ) ) ( not ( = ?auto_155712 ?auto_155711 ) ) ( ON ?auto_155710 ?auto_155709 ) ( ON-TABLE ?auto_155711 ) ( ON ?auto_155717 ?auto_155710 ) ( ON ?auto_155712 ?auto_155717 ) ( ON ?auto_155716 ?auto_155712 ) ( ON ?auto_155713 ?auto_155716 ) ( CLEAR ?auto_155715 ) ( ON ?auto_155714 ?auto_155713 ) ( CLEAR ?auto_155714 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_155711 ?auto_155709 ?auto_155710 ?auto_155717 ?auto_155712 ?auto_155716 ?auto_155713 )
      ( MAKE-2PILE ?auto_155709 ?auto_155710 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_155718 - BLOCK
      ?auto_155719 - BLOCK
    )
    :vars
    (
      ?auto_155725 - BLOCK
      ?auto_155724 - BLOCK
      ?auto_155720 - BLOCK
      ?auto_155722 - BLOCK
      ?auto_155723 - BLOCK
      ?auto_155721 - BLOCK
      ?auto_155726 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155718 ?auto_155719 ) ) ( not ( = ?auto_155718 ?auto_155725 ) ) ( not ( = ?auto_155719 ?auto_155725 ) ) ( not ( = ?auto_155724 ?auto_155720 ) ) ( not ( = ?auto_155724 ?auto_155722 ) ) ( not ( = ?auto_155724 ?auto_155723 ) ) ( not ( = ?auto_155724 ?auto_155721 ) ) ( not ( = ?auto_155724 ?auto_155725 ) ) ( not ( = ?auto_155724 ?auto_155719 ) ) ( not ( = ?auto_155724 ?auto_155718 ) ) ( not ( = ?auto_155720 ?auto_155722 ) ) ( not ( = ?auto_155720 ?auto_155723 ) ) ( not ( = ?auto_155720 ?auto_155721 ) ) ( not ( = ?auto_155720 ?auto_155725 ) ) ( not ( = ?auto_155720 ?auto_155719 ) ) ( not ( = ?auto_155720 ?auto_155718 ) ) ( not ( = ?auto_155722 ?auto_155723 ) ) ( not ( = ?auto_155722 ?auto_155721 ) ) ( not ( = ?auto_155722 ?auto_155725 ) ) ( not ( = ?auto_155722 ?auto_155719 ) ) ( not ( = ?auto_155722 ?auto_155718 ) ) ( not ( = ?auto_155723 ?auto_155721 ) ) ( not ( = ?auto_155723 ?auto_155725 ) ) ( not ( = ?auto_155723 ?auto_155719 ) ) ( not ( = ?auto_155723 ?auto_155718 ) ) ( not ( = ?auto_155721 ?auto_155725 ) ) ( not ( = ?auto_155721 ?auto_155719 ) ) ( not ( = ?auto_155721 ?auto_155718 ) ) ( ON ?auto_155718 ?auto_155726 ) ( not ( = ?auto_155718 ?auto_155726 ) ) ( not ( = ?auto_155719 ?auto_155726 ) ) ( not ( = ?auto_155725 ?auto_155726 ) ) ( not ( = ?auto_155724 ?auto_155726 ) ) ( not ( = ?auto_155720 ?auto_155726 ) ) ( not ( = ?auto_155722 ?auto_155726 ) ) ( not ( = ?auto_155723 ?auto_155726 ) ) ( not ( = ?auto_155721 ?auto_155726 ) ) ( ON ?auto_155719 ?auto_155718 ) ( ON-TABLE ?auto_155726 ) ( ON ?auto_155725 ?auto_155719 ) ( ON ?auto_155721 ?auto_155725 ) ( ON ?auto_155723 ?auto_155721 ) ( ON ?auto_155722 ?auto_155723 ) ( ON ?auto_155720 ?auto_155722 ) ( CLEAR ?auto_155720 ) ( HOLDING ?auto_155724 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_155724 )
      ( MAKE-2PILE ?auto_155718 ?auto_155719 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_155727 - BLOCK
      ?auto_155728 - BLOCK
    )
    :vars
    (
      ?auto_155735 - BLOCK
      ?auto_155730 - BLOCK
      ?auto_155734 - BLOCK
      ?auto_155731 - BLOCK
      ?auto_155729 - BLOCK
      ?auto_155732 - BLOCK
      ?auto_155733 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155727 ?auto_155728 ) ) ( not ( = ?auto_155727 ?auto_155735 ) ) ( not ( = ?auto_155728 ?auto_155735 ) ) ( not ( = ?auto_155730 ?auto_155734 ) ) ( not ( = ?auto_155730 ?auto_155731 ) ) ( not ( = ?auto_155730 ?auto_155729 ) ) ( not ( = ?auto_155730 ?auto_155732 ) ) ( not ( = ?auto_155730 ?auto_155735 ) ) ( not ( = ?auto_155730 ?auto_155728 ) ) ( not ( = ?auto_155730 ?auto_155727 ) ) ( not ( = ?auto_155734 ?auto_155731 ) ) ( not ( = ?auto_155734 ?auto_155729 ) ) ( not ( = ?auto_155734 ?auto_155732 ) ) ( not ( = ?auto_155734 ?auto_155735 ) ) ( not ( = ?auto_155734 ?auto_155728 ) ) ( not ( = ?auto_155734 ?auto_155727 ) ) ( not ( = ?auto_155731 ?auto_155729 ) ) ( not ( = ?auto_155731 ?auto_155732 ) ) ( not ( = ?auto_155731 ?auto_155735 ) ) ( not ( = ?auto_155731 ?auto_155728 ) ) ( not ( = ?auto_155731 ?auto_155727 ) ) ( not ( = ?auto_155729 ?auto_155732 ) ) ( not ( = ?auto_155729 ?auto_155735 ) ) ( not ( = ?auto_155729 ?auto_155728 ) ) ( not ( = ?auto_155729 ?auto_155727 ) ) ( not ( = ?auto_155732 ?auto_155735 ) ) ( not ( = ?auto_155732 ?auto_155728 ) ) ( not ( = ?auto_155732 ?auto_155727 ) ) ( ON ?auto_155727 ?auto_155733 ) ( not ( = ?auto_155727 ?auto_155733 ) ) ( not ( = ?auto_155728 ?auto_155733 ) ) ( not ( = ?auto_155735 ?auto_155733 ) ) ( not ( = ?auto_155730 ?auto_155733 ) ) ( not ( = ?auto_155734 ?auto_155733 ) ) ( not ( = ?auto_155731 ?auto_155733 ) ) ( not ( = ?auto_155729 ?auto_155733 ) ) ( not ( = ?auto_155732 ?auto_155733 ) ) ( ON ?auto_155728 ?auto_155727 ) ( ON-TABLE ?auto_155733 ) ( ON ?auto_155735 ?auto_155728 ) ( ON ?auto_155732 ?auto_155735 ) ( ON ?auto_155729 ?auto_155732 ) ( ON ?auto_155731 ?auto_155729 ) ( ON ?auto_155734 ?auto_155731 ) ( ON ?auto_155730 ?auto_155734 ) ( CLEAR ?auto_155730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_155733 ?auto_155727 ?auto_155728 ?auto_155735 ?auto_155732 ?auto_155729 ?auto_155731 ?auto_155734 )
      ( MAKE-2PILE ?auto_155727 ?auto_155728 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_155741 - BLOCK
      ?auto_155742 - BLOCK
      ?auto_155743 - BLOCK
      ?auto_155744 - BLOCK
      ?auto_155745 - BLOCK
    )
    :vars
    (
      ?auto_155746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155746 ?auto_155745 ) ( CLEAR ?auto_155746 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_155741 ) ( ON ?auto_155742 ?auto_155741 ) ( ON ?auto_155743 ?auto_155742 ) ( ON ?auto_155744 ?auto_155743 ) ( ON ?auto_155745 ?auto_155744 ) ( not ( = ?auto_155741 ?auto_155742 ) ) ( not ( = ?auto_155741 ?auto_155743 ) ) ( not ( = ?auto_155741 ?auto_155744 ) ) ( not ( = ?auto_155741 ?auto_155745 ) ) ( not ( = ?auto_155741 ?auto_155746 ) ) ( not ( = ?auto_155742 ?auto_155743 ) ) ( not ( = ?auto_155742 ?auto_155744 ) ) ( not ( = ?auto_155742 ?auto_155745 ) ) ( not ( = ?auto_155742 ?auto_155746 ) ) ( not ( = ?auto_155743 ?auto_155744 ) ) ( not ( = ?auto_155743 ?auto_155745 ) ) ( not ( = ?auto_155743 ?auto_155746 ) ) ( not ( = ?auto_155744 ?auto_155745 ) ) ( not ( = ?auto_155744 ?auto_155746 ) ) ( not ( = ?auto_155745 ?auto_155746 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_155746 ?auto_155745 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_155747 - BLOCK
      ?auto_155748 - BLOCK
      ?auto_155749 - BLOCK
      ?auto_155750 - BLOCK
      ?auto_155751 - BLOCK
    )
    :vars
    (
      ?auto_155752 - BLOCK
      ?auto_155753 - BLOCK
      ?auto_155754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155752 ?auto_155751 ) ( CLEAR ?auto_155752 ) ( ON-TABLE ?auto_155747 ) ( ON ?auto_155748 ?auto_155747 ) ( ON ?auto_155749 ?auto_155748 ) ( ON ?auto_155750 ?auto_155749 ) ( ON ?auto_155751 ?auto_155750 ) ( not ( = ?auto_155747 ?auto_155748 ) ) ( not ( = ?auto_155747 ?auto_155749 ) ) ( not ( = ?auto_155747 ?auto_155750 ) ) ( not ( = ?auto_155747 ?auto_155751 ) ) ( not ( = ?auto_155747 ?auto_155752 ) ) ( not ( = ?auto_155748 ?auto_155749 ) ) ( not ( = ?auto_155748 ?auto_155750 ) ) ( not ( = ?auto_155748 ?auto_155751 ) ) ( not ( = ?auto_155748 ?auto_155752 ) ) ( not ( = ?auto_155749 ?auto_155750 ) ) ( not ( = ?auto_155749 ?auto_155751 ) ) ( not ( = ?auto_155749 ?auto_155752 ) ) ( not ( = ?auto_155750 ?auto_155751 ) ) ( not ( = ?auto_155750 ?auto_155752 ) ) ( not ( = ?auto_155751 ?auto_155752 ) ) ( HOLDING ?auto_155753 ) ( CLEAR ?auto_155754 ) ( not ( = ?auto_155747 ?auto_155753 ) ) ( not ( = ?auto_155747 ?auto_155754 ) ) ( not ( = ?auto_155748 ?auto_155753 ) ) ( not ( = ?auto_155748 ?auto_155754 ) ) ( not ( = ?auto_155749 ?auto_155753 ) ) ( not ( = ?auto_155749 ?auto_155754 ) ) ( not ( = ?auto_155750 ?auto_155753 ) ) ( not ( = ?auto_155750 ?auto_155754 ) ) ( not ( = ?auto_155751 ?auto_155753 ) ) ( not ( = ?auto_155751 ?auto_155754 ) ) ( not ( = ?auto_155752 ?auto_155753 ) ) ( not ( = ?auto_155752 ?auto_155754 ) ) ( not ( = ?auto_155753 ?auto_155754 ) ) )
    :subtasks
    ( ( !STACK ?auto_155753 ?auto_155754 )
      ( MAKE-5PILE ?auto_155747 ?auto_155748 ?auto_155749 ?auto_155750 ?auto_155751 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_155755 - BLOCK
      ?auto_155756 - BLOCK
      ?auto_155757 - BLOCK
      ?auto_155758 - BLOCK
      ?auto_155759 - BLOCK
    )
    :vars
    (
      ?auto_155760 - BLOCK
      ?auto_155761 - BLOCK
      ?auto_155762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155760 ?auto_155759 ) ( ON-TABLE ?auto_155755 ) ( ON ?auto_155756 ?auto_155755 ) ( ON ?auto_155757 ?auto_155756 ) ( ON ?auto_155758 ?auto_155757 ) ( ON ?auto_155759 ?auto_155758 ) ( not ( = ?auto_155755 ?auto_155756 ) ) ( not ( = ?auto_155755 ?auto_155757 ) ) ( not ( = ?auto_155755 ?auto_155758 ) ) ( not ( = ?auto_155755 ?auto_155759 ) ) ( not ( = ?auto_155755 ?auto_155760 ) ) ( not ( = ?auto_155756 ?auto_155757 ) ) ( not ( = ?auto_155756 ?auto_155758 ) ) ( not ( = ?auto_155756 ?auto_155759 ) ) ( not ( = ?auto_155756 ?auto_155760 ) ) ( not ( = ?auto_155757 ?auto_155758 ) ) ( not ( = ?auto_155757 ?auto_155759 ) ) ( not ( = ?auto_155757 ?auto_155760 ) ) ( not ( = ?auto_155758 ?auto_155759 ) ) ( not ( = ?auto_155758 ?auto_155760 ) ) ( not ( = ?auto_155759 ?auto_155760 ) ) ( CLEAR ?auto_155761 ) ( not ( = ?auto_155755 ?auto_155762 ) ) ( not ( = ?auto_155755 ?auto_155761 ) ) ( not ( = ?auto_155756 ?auto_155762 ) ) ( not ( = ?auto_155756 ?auto_155761 ) ) ( not ( = ?auto_155757 ?auto_155762 ) ) ( not ( = ?auto_155757 ?auto_155761 ) ) ( not ( = ?auto_155758 ?auto_155762 ) ) ( not ( = ?auto_155758 ?auto_155761 ) ) ( not ( = ?auto_155759 ?auto_155762 ) ) ( not ( = ?auto_155759 ?auto_155761 ) ) ( not ( = ?auto_155760 ?auto_155762 ) ) ( not ( = ?auto_155760 ?auto_155761 ) ) ( not ( = ?auto_155762 ?auto_155761 ) ) ( ON ?auto_155762 ?auto_155760 ) ( CLEAR ?auto_155762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_155755 ?auto_155756 ?auto_155757 ?auto_155758 ?auto_155759 ?auto_155760 )
      ( MAKE-5PILE ?auto_155755 ?auto_155756 ?auto_155757 ?auto_155758 ?auto_155759 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_155763 - BLOCK
      ?auto_155764 - BLOCK
      ?auto_155765 - BLOCK
      ?auto_155766 - BLOCK
      ?auto_155767 - BLOCK
    )
    :vars
    (
      ?auto_155768 - BLOCK
      ?auto_155770 - BLOCK
      ?auto_155769 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155768 ?auto_155767 ) ( ON-TABLE ?auto_155763 ) ( ON ?auto_155764 ?auto_155763 ) ( ON ?auto_155765 ?auto_155764 ) ( ON ?auto_155766 ?auto_155765 ) ( ON ?auto_155767 ?auto_155766 ) ( not ( = ?auto_155763 ?auto_155764 ) ) ( not ( = ?auto_155763 ?auto_155765 ) ) ( not ( = ?auto_155763 ?auto_155766 ) ) ( not ( = ?auto_155763 ?auto_155767 ) ) ( not ( = ?auto_155763 ?auto_155768 ) ) ( not ( = ?auto_155764 ?auto_155765 ) ) ( not ( = ?auto_155764 ?auto_155766 ) ) ( not ( = ?auto_155764 ?auto_155767 ) ) ( not ( = ?auto_155764 ?auto_155768 ) ) ( not ( = ?auto_155765 ?auto_155766 ) ) ( not ( = ?auto_155765 ?auto_155767 ) ) ( not ( = ?auto_155765 ?auto_155768 ) ) ( not ( = ?auto_155766 ?auto_155767 ) ) ( not ( = ?auto_155766 ?auto_155768 ) ) ( not ( = ?auto_155767 ?auto_155768 ) ) ( not ( = ?auto_155763 ?auto_155770 ) ) ( not ( = ?auto_155763 ?auto_155769 ) ) ( not ( = ?auto_155764 ?auto_155770 ) ) ( not ( = ?auto_155764 ?auto_155769 ) ) ( not ( = ?auto_155765 ?auto_155770 ) ) ( not ( = ?auto_155765 ?auto_155769 ) ) ( not ( = ?auto_155766 ?auto_155770 ) ) ( not ( = ?auto_155766 ?auto_155769 ) ) ( not ( = ?auto_155767 ?auto_155770 ) ) ( not ( = ?auto_155767 ?auto_155769 ) ) ( not ( = ?auto_155768 ?auto_155770 ) ) ( not ( = ?auto_155768 ?auto_155769 ) ) ( not ( = ?auto_155770 ?auto_155769 ) ) ( ON ?auto_155770 ?auto_155768 ) ( CLEAR ?auto_155770 ) ( HOLDING ?auto_155769 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_155769 )
      ( MAKE-5PILE ?auto_155763 ?auto_155764 ?auto_155765 ?auto_155766 ?auto_155767 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_155771 - BLOCK
      ?auto_155772 - BLOCK
      ?auto_155773 - BLOCK
      ?auto_155774 - BLOCK
      ?auto_155775 - BLOCK
    )
    :vars
    (
      ?auto_155777 - BLOCK
      ?auto_155778 - BLOCK
      ?auto_155776 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155777 ?auto_155775 ) ( ON-TABLE ?auto_155771 ) ( ON ?auto_155772 ?auto_155771 ) ( ON ?auto_155773 ?auto_155772 ) ( ON ?auto_155774 ?auto_155773 ) ( ON ?auto_155775 ?auto_155774 ) ( not ( = ?auto_155771 ?auto_155772 ) ) ( not ( = ?auto_155771 ?auto_155773 ) ) ( not ( = ?auto_155771 ?auto_155774 ) ) ( not ( = ?auto_155771 ?auto_155775 ) ) ( not ( = ?auto_155771 ?auto_155777 ) ) ( not ( = ?auto_155772 ?auto_155773 ) ) ( not ( = ?auto_155772 ?auto_155774 ) ) ( not ( = ?auto_155772 ?auto_155775 ) ) ( not ( = ?auto_155772 ?auto_155777 ) ) ( not ( = ?auto_155773 ?auto_155774 ) ) ( not ( = ?auto_155773 ?auto_155775 ) ) ( not ( = ?auto_155773 ?auto_155777 ) ) ( not ( = ?auto_155774 ?auto_155775 ) ) ( not ( = ?auto_155774 ?auto_155777 ) ) ( not ( = ?auto_155775 ?auto_155777 ) ) ( not ( = ?auto_155771 ?auto_155778 ) ) ( not ( = ?auto_155771 ?auto_155776 ) ) ( not ( = ?auto_155772 ?auto_155778 ) ) ( not ( = ?auto_155772 ?auto_155776 ) ) ( not ( = ?auto_155773 ?auto_155778 ) ) ( not ( = ?auto_155773 ?auto_155776 ) ) ( not ( = ?auto_155774 ?auto_155778 ) ) ( not ( = ?auto_155774 ?auto_155776 ) ) ( not ( = ?auto_155775 ?auto_155778 ) ) ( not ( = ?auto_155775 ?auto_155776 ) ) ( not ( = ?auto_155777 ?auto_155778 ) ) ( not ( = ?auto_155777 ?auto_155776 ) ) ( not ( = ?auto_155778 ?auto_155776 ) ) ( ON ?auto_155778 ?auto_155777 ) ( ON ?auto_155776 ?auto_155778 ) ( CLEAR ?auto_155776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_155771 ?auto_155772 ?auto_155773 ?auto_155774 ?auto_155775 ?auto_155777 ?auto_155778 )
      ( MAKE-5PILE ?auto_155771 ?auto_155772 ?auto_155773 ?auto_155774 ?auto_155775 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_155779 - BLOCK
      ?auto_155780 - BLOCK
      ?auto_155781 - BLOCK
      ?auto_155782 - BLOCK
      ?auto_155783 - BLOCK
    )
    :vars
    (
      ?auto_155785 - BLOCK
      ?auto_155784 - BLOCK
      ?auto_155786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155785 ?auto_155783 ) ( ON-TABLE ?auto_155779 ) ( ON ?auto_155780 ?auto_155779 ) ( ON ?auto_155781 ?auto_155780 ) ( ON ?auto_155782 ?auto_155781 ) ( ON ?auto_155783 ?auto_155782 ) ( not ( = ?auto_155779 ?auto_155780 ) ) ( not ( = ?auto_155779 ?auto_155781 ) ) ( not ( = ?auto_155779 ?auto_155782 ) ) ( not ( = ?auto_155779 ?auto_155783 ) ) ( not ( = ?auto_155779 ?auto_155785 ) ) ( not ( = ?auto_155780 ?auto_155781 ) ) ( not ( = ?auto_155780 ?auto_155782 ) ) ( not ( = ?auto_155780 ?auto_155783 ) ) ( not ( = ?auto_155780 ?auto_155785 ) ) ( not ( = ?auto_155781 ?auto_155782 ) ) ( not ( = ?auto_155781 ?auto_155783 ) ) ( not ( = ?auto_155781 ?auto_155785 ) ) ( not ( = ?auto_155782 ?auto_155783 ) ) ( not ( = ?auto_155782 ?auto_155785 ) ) ( not ( = ?auto_155783 ?auto_155785 ) ) ( not ( = ?auto_155779 ?auto_155784 ) ) ( not ( = ?auto_155779 ?auto_155786 ) ) ( not ( = ?auto_155780 ?auto_155784 ) ) ( not ( = ?auto_155780 ?auto_155786 ) ) ( not ( = ?auto_155781 ?auto_155784 ) ) ( not ( = ?auto_155781 ?auto_155786 ) ) ( not ( = ?auto_155782 ?auto_155784 ) ) ( not ( = ?auto_155782 ?auto_155786 ) ) ( not ( = ?auto_155783 ?auto_155784 ) ) ( not ( = ?auto_155783 ?auto_155786 ) ) ( not ( = ?auto_155785 ?auto_155784 ) ) ( not ( = ?auto_155785 ?auto_155786 ) ) ( not ( = ?auto_155784 ?auto_155786 ) ) ( ON ?auto_155784 ?auto_155785 ) ( HOLDING ?auto_155786 ) ( CLEAR ?auto_155784 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_155779 ?auto_155780 ?auto_155781 ?auto_155782 ?auto_155783 ?auto_155785 ?auto_155784 ?auto_155786 )
      ( MAKE-5PILE ?auto_155779 ?auto_155780 ?auto_155781 ?auto_155782 ?auto_155783 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_155787 - BLOCK
      ?auto_155788 - BLOCK
      ?auto_155789 - BLOCK
      ?auto_155790 - BLOCK
      ?auto_155791 - BLOCK
    )
    :vars
    (
      ?auto_155794 - BLOCK
      ?auto_155793 - BLOCK
      ?auto_155792 - BLOCK
      ?auto_155795 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155794 ?auto_155791 ) ( ON-TABLE ?auto_155787 ) ( ON ?auto_155788 ?auto_155787 ) ( ON ?auto_155789 ?auto_155788 ) ( ON ?auto_155790 ?auto_155789 ) ( ON ?auto_155791 ?auto_155790 ) ( not ( = ?auto_155787 ?auto_155788 ) ) ( not ( = ?auto_155787 ?auto_155789 ) ) ( not ( = ?auto_155787 ?auto_155790 ) ) ( not ( = ?auto_155787 ?auto_155791 ) ) ( not ( = ?auto_155787 ?auto_155794 ) ) ( not ( = ?auto_155788 ?auto_155789 ) ) ( not ( = ?auto_155788 ?auto_155790 ) ) ( not ( = ?auto_155788 ?auto_155791 ) ) ( not ( = ?auto_155788 ?auto_155794 ) ) ( not ( = ?auto_155789 ?auto_155790 ) ) ( not ( = ?auto_155789 ?auto_155791 ) ) ( not ( = ?auto_155789 ?auto_155794 ) ) ( not ( = ?auto_155790 ?auto_155791 ) ) ( not ( = ?auto_155790 ?auto_155794 ) ) ( not ( = ?auto_155791 ?auto_155794 ) ) ( not ( = ?auto_155787 ?auto_155793 ) ) ( not ( = ?auto_155787 ?auto_155792 ) ) ( not ( = ?auto_155788 ?auto_155793 ) ) ( not ( = ?auto_155788 ?auto_155792 ) ) ( not ( = ?auto_155789 ?auto_155793 ) ) ( not ( = ?auto_155789 ?auto_155792 ) ) ( not ( = ?auto_155790 ?auto_155793 ) ) ( not ( = ?auto_155790 ?auto_155792 ) ) ( not ( = ?auto_155791 ?auto_155793 ) ) ( not ( = ?auto_155791 ?auto_155792 ) ) ( not ( = ?auto_155794 ?auto_155793 ) ) ( not ( = ?auto_155794 ?auto_155792 ) ) ( not ( = ?auto_155793 ?auto_155792 ) ) ( ON ?auto_155793 ?auto_155794 ) ( CLEAR ?auto_155793 ) ( ON ?auto_155792 ?auto_155795 ) ( CLEAR ?auto_155792 ) ( HAND-EMPTY ) ( not ( = ?auto_155787 ?auto_155795 ) ) ( not ( = ?auto_155788 ?auto_155795 ) ) ( not ( = ?auto_155789 ?auto_155795 ) ) ( not ( = ?auto_155790 ?auto_155795 ) ) ( not ( = ?auto_155791 ?auto_155795 ) ) ( not ( = ?auto_155794 ?auto_155795 ) ) ( not ( = ?auto_155793 ?auto_155795 ) ) ( not ( = ?auto_155792 ?auto_155795 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_155792 ?auto_155795 )
      ( MAKE-5PILE ?auto_155787 ?auto_155788 ?auto_155789 ?auto_155790 ?auto_155791 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_155796 - BLOCK
      ?auto_155797 - BLOCK
      ?auto_155798 - BLOCK
      ?auto_155799 - BLOCK
      ?auto_155800 - BLOCK
    )
    :vars
    (
      ?auto_155802 - BLOCK
      ?auto_155803 - BLOCK
      ?auto_155804 - BLOCK
      ?auto_155801 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155802 ?auto_155800 ) ( ON-TABLE ?auto_155796 ) ( ON ?auto_155797 ?auto_155796 ) ( ON ?auto_155798 ?auto_155797 ) ( ON ?auto_155799 ?auto_155798 ) ( ON ?auto_155800 ?auto_155799 ) ( not ( = ?auto_155796 ?auto_155797 ) ) ( not ( = ?auto_155796 ?auto_155798 ) ) ( not ( = ?auto_155796 ?auto_155799 ) ) ( not ( = ?auto_155796 ?auto_155800 ) ) ( not ( = ?auto_155796 ?auto_155802 ) ) ( not ( = ?auto_155797 ?auto_155798 ) ) ( not ( = ?auto_155797 ?auto_155799 ) ) ( not ( = ?auto_155797 ?auto_155800 ) ) ( not ( = ?auto_155797 ?auto_155802 ) ) ( not ( = ?auto_155798 ?auto_155799 ) ) ( not ( = ?auto_155798 ?auto_155800 ) ) ( not ( = ?auto_155798 ?auto_155802 ) ) ( not ( = ?auto_155799 ?auto_155800 ) ) ( not ( = ?auto_155799 ?auto_155802 ) ) ( not ( = ?auto_155800 ?auto_155802 ) ) ( not ( = ?auto_155796 ?auto_155803 ) ) ( not ( = ?auto_155796 ?auto_155804 ) ) ( not ( = ?auto_155797 ?auto_155803 ) ) ( not ( = ?auto_155797 ?auto_155804 ) ) ( not ( = ?auto_155798 ?auto_155803 ) ) ( not ( = ?auto_155798 ?auto_155804 ) ) ( not ( = ?auto_155799 ?auto_155803 ) ) ( not ( = ?auto_155799 ?auto_155804 ) ) ( not ( = ?auto_155800 ?auto_155803 ) ) ( not ( = ?auto_155800 ?auto_155804 ) ) ( not ( = ?auto_155802 ?auto_155803 ) ) ( not ( = ?auto_155802 ?auto_155804 ) ) ( not ( = ?auto_155803 ?auto_155804 ) ) ( ON ?auto_155804 ?auto_155801 ) ( CLEAR ?auto_155804 ) ( not ( = ?auto_155796 ?auto_155801 ) ) ( not ( = ?auto_155797 ?auto_155801 ) ) ( not ( = ?auto_155798 ?auto_155801 ) ) ( not ( = ?auto_155799 ?auto_155801 ) ) ( not ( = ?auto_155800 ?auto_155801 ) ) ( not ( = ?auto_155802 ?auto_155801 ) ) ( not ( = ?auto_155803 ?auto_155801 ) ) ( not ( = ?auto_155804 ?auto_155801 ) ) ( HOLDING ?auto_155803 ) ( CLEAR ?auto_155802 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_155796 ?auto_155797 ?auto_155798 ?auto_155799 ?auto_155800 ?auto_155802 ?auto_155803 )
      ( MAKE-5PILE ?auto_155796 ?auto_155797 ?auto_155798 ?auto_155799 ?auto_155800 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_155805 - BLOCK
      ?auto_155806 - BLOCK
      ?auto_155807 - BLOCK
      ?auto_155808 - BLOCK
      ?auto_155809 - BLOCK
    )
    :vars
    (
      ?auto_155811 - BLOCK
      ?auto_155810 - BLOCK
      ?auto_155813 - BLOCK
      ?auto_155812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155811 ?auto_155809 ) ( ON-TABLE ?auto_155805 ) ( ON ?auto_155806 ?auto_155805 ) ( ON ?auto_155807 ?auto_155806 ) ( ON ?auto_155808 ?auto_155807 ) ( ON ?auto_155809 ?auto_155808 ) ( not ( = ?auto_155805 ?auto_155806 ) ) ( not ( = ?auto_155805 ?auto_155807 ) ) ( not ( = ?auto_155805 ?auto_155808 ) ) ( not ( = ?auto_155805 ?auto_155809 ) ) ( not ( = ?auto_155805 ?auto_155811 ) ) ( not ( = ?auto_155806 ?auto_155807 ) ) ( not ( = ?auto_155806 ?auto_155808 ) ) ( not ( = ?auto_155806 ?auto_155809 ) ) ( not ( = ?auto_155806 ?auto_155811 ) ) ( not ( = ?auto_155807 ?auto_155808 ) ) ( not ( = ?auto_155807 ?auto_155809 ) ) ( not ( = ?auto_155807 ?auto_155811 ) ) ( not ( = ?auto_155808 ?auto_155809 ) ) ( not ( = ?auto_155808 ?auto_155811 ) ) ( not ( = ?auto_155809 ?auto_155811 ) ) ( not ( = ?auto_155805 ?auto_155810 ) ) ( not ( = ?auto_155805 ?auto_155813 ) ) ( not ( = ?auto_155806 ?auto_155810 ) ) ( not ( = ?auto_155806 ?auto_155813 ) ) ( not ( = ?auto_155807 ?auto_155810 ) ) ( not ( = ?auto_155807 ?auto_155813 ) ) ( not ( = ?auto_155808 ?auto_155810 ) ) ( not ( = ?auto_155808 ?auto_155813 ) ) ( not ( = ?auto_155809 ?auto_155810 ) ) ( not ( = ?auto_155809 ?auto_155813 ) ) ( not ( = ?auto_155811 ?auto_155810 ) ) ( not ( = ?auto_155811 ?auto_155813 ) ) ( not ( = ?auto_155810 ?auto_155813 ) ) ( ON ?auto_155813 ?auto_155812 ) ( not ( = ?auto_155805 ?auto_155812 ) ) ( not ( = ?auto_155806 ?auto_155812 ) ) ( not ( = ?auto_155807 ?auto_155812 ) ) ( not ( = ?auto_155808 ?auto_155812 ) ) ( not ( = ?auto_155809 ?auto_155812 ) ) ( not ( = ?auto_155811 ?auto_155812 ) ) ( not ( = ?auto_155810 ?auto_155812 ) ) ( not ( = ?auto_155813 ?auto_155812 ) ) ( CLEAR ?auto_155811 ) ( ON ?auto_155810 ?auto_155813 ) ( CLEAR ?auto_155810 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_155812 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_155812 ?auto_155813 )
      ( MAKE-5PILE ?auto_155805 ?auto_155806 ?auto_155807 ?auto_155808 ?auto_155809 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_155832 - BLOCK
      ?auto_155833 - BLOCK
      ?auto_155834 - BLOCK
      ?auto_155835 - BLOCK
      ?auto_155836 - BLOCK
    )
    :vars
    (
      ?auto_155840 - BLOCK
      ?auto_155838 - BLOCK
      ?auto_155837 - BLOCK
      ?auto_155839 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155832 ) ( ON ?auto_155833 ?auto_155832 ) ( ON ?auto_155834 ?auto_155833 ) ( ON ?auto_155835 ?auto_155834 ) ( not ( = ?auto_155832 ?auto_155833 ) ) ( not ( = ?auto_155832 ?auto_155834 ) ) ( not ( = ?auto_155832 ?auto_155835 ) ) ( not ( = ?auto_155832 ?auto_155836 ) ) ( not ( = ?auto_155832 ?auto_155840 ) ) ( not ( = ?auto_155833 ?auto_155834 ) ) ( not ( = ?auto_155833 ?auto_155835 ) ) ( not ( = ?auto_155833 ?auto_155836 ) ) ( not ( = ?auto_155833 ?auto_155840 ) ) ( not ( = ?auto_155834 ?auto_155835 ) ) ( not ( = ?auto_155834 ?auto_155836 ) ) ( not ( = ?auto_155834 ?auto_155840 ) ) ( not ( = ?auto_155835 ?auto_155836 ) ) ( not ( = ?auto_155835 ?auto_155840 ) ) ( not ( = ?auto_155836 ?auto_155840 ) ) ( not ( = ?auto_155832 ?auto_155838 ) ) ( not ( = ?auto_155832 ?auto_155837 ) ) ( not ( = ?auto_155833 ?auto_155838 ) ) ( not ( = ?auto_155833 ?auto_155837 ) ) ( not ( = ?auto_155834 ?auto_155838 ) ) ( not ( = ?auto_155834 ?auto_155837 ) ) ( not ( = ?auto_155835 ?auto_155838 ) ) ( not ( = ?auto_155835 ?auto_155837 ) ) ( not ( = ?auto_155836 ?auto_155838 ) ) ( not ( = ?auto_155836 ?auto_155837 ) ) ( not ( = ?auto_155840 ?auto_155838 ) ) ( not ( = ?auto_155840 ?auto_155837 ) ) ( not ( = ?auto_155838 ?auto_155837 ) ) ( ON ?auto_155837 ?auto_155839 ) ( not ( = ?auto_155832 ?auto_155839 ) ) ( not ( = ?auto_155833 ?auto_155839 ) ) ( not ( = ?auto_155834 ?auto_155839 ) ) ( not ( = ?auto_155835 ?auto_155839 ) ) ( not ( = ?auto_155836 ?auto_155839 ) ) ( not ( = ?auto_155840 ?auto_155839 ) ) ( not ( = ?auto_155838 ?auto_155839 ) ) ( not ( = ?auto_155837 ?auto_155839 ) ) ( ON ?auto_155838 ?auto_155837 ) ( ON-TABLE ?auto_155839 ) ( ON ?auto_155840 ?auto_155838 ) ( CLEAR ?auto_155840 ) ( HOLDING ?auto_155836 ) ( CLEAR ?auto_155835 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_155832 ?auto_155833 ?auto_155834 ?auto_155835 ?auto_155836 ?auto_155840 )
      ( MAKE-5PILE ?auto_155832 ?auto_155833 ?auto_155834 ?auto_155835 ?auto_155836 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_155841 - BLOCK
      ?auto_155842 - BLOCK
      ?auto_155843 - BLOCK
      ?auto_155844 - BLOCK
      ?auto_155845 - BLOCK
    )
    :vars
    (
      ?auto_155847 - BLOCK
      ?auto_155848 - BLOCK
      ?auto_155849 - BLOCK
      ?auto_155846 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155841 ) ( ON ?auto_155842 ?auto_155841 ) ( ON ?auto_155843 ?auto_155842 ) ( ON ?auto_155844 ?auto_155843 ) ( not ( = ?auto_155841 ?auto_155842 ) ) ( not ( = ?auto_155841 ?auto_155843 ) ) ( not ( = ?auto_155841 ?auto_155844 ) ) ( not ( = ?auto_155841 ?auto_155845 ) ) ( not ( = ?auto_155841 ?auto_155847 ) ) ( not ( = ?auto_155842 ?auto_155843 ) ) ( not ( = ?auto_155842 ?auto_155844 ) ) ( not ( = ?auto_155842 ?auto_155845 ) ) ( not ( = ?auto_155842 ?auto_155847 ) ) ( not ( = ?auto_155843 ?auto_155844 ) ) ( not ( = ?auto_155843 ?auto_155845 ) ) ( not ( = ?auto_155843 ?auto_155847 ) ) ( not ( = ?auto_155844 ?auto_155845 ) ) ( not ( = ?auto_155844 ?auto_155847 ) ) ( not ( = ?auto_155845 ?auto_155847 ) ) ( not ( = ?auto_155841 ?auto_155848 ) ) ( not ( = ?auto_155841 ?auto_155849 ) ) ( not ( = ?auto_155842 ?auto_155848 ) ) ( not ( = ?auto_155842 ?auto_155849 ) ) ( not ( = ?auto_155843 ?auto_155848 ) ) ( not ( = ?auto_155843 ?auto_155849 ) ) ( not ( = ?auto_155844 ?auto_155848 ) ) ( not ( = ?auto_155844 ?auto_155849 ) ) ( not ( = ?auto_155845 ?auto_155848 ) ) ( not ( = ?auto_155845 ?auto_155849 ) ) ( not ( = ?auto_155847 ?auto_155848 ) ) ( not ( = ?auto_155847 ?auto_155849 ) ) ( not ( = ?auto_155848 ?auto_155849 ) ) ( ON ?auto_155849 ?auto_155846 ) ( not ( = ?auto_155841 ?auto_155846 ) ) ( not ( = ?auto_155842 ?auto_155846 ) ) ( not ( = ?auto_155843 ?auto_155846 ) ) ( not ( = ?auto_155844 ?auto_155846 ) ) ( not ( = ?auto_155845 ?auto_155846 ) ) ( not ( = ?auto_155847 ?auto_155846 ) ) ( not ( = ?auto_155848 ?auto_155846 ) ) ( not ( = ?auto_155849 ?auto_155846 ) ) ( ON ?auto_155848 ?auto_155849 ) ( ON-TABLE ?auto_155846 ) ( ON ?auto_155847 ?auto_155848 ) ( CLEAR ?auto_155844 ) ( ON ?auto_155845 ?auto_155847 ) ( CLEAR ?auto_155845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_155846 ?auto_155849 ?auto_155848 ?auto_155847 )
      ( MAKE-5PILE ?auto_155841 ?auto_155842 ?auto_155843 ?auto_155844 ?auto_155845 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_155850 - BLOCK
      ?auto_155851 - BLOCK
      ?auto_155852 - BLOCK
      ?auto_155853 - BLOCK
      ?auto_155854 - BLOCK
    )
    :vars
    (
      ?auto_155855 - BLOCK
      ?auto_155858 - BLOCK
      ?auto_155856 - BLOCK
      ?auto_155857 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155850 ) ( ON ?auto_155851 ?auto_155850 ) ( ON ?auto_155852 ?auto_155851 ) ( not ( = ?auto_155850 ?auto_155851 ) ) ( not ( = ?auto_155850 ?auto_155852 ) ) ( not ( = ?auto_155850 ?auto_155853 ) ) ( not ( = ?auto_155850 ?auto_155854 ) ) ( not ( = ?auto_155850 ?auto_155855 ) ) ( not ( = ?auto_155851 ?auto_155852 ) ) ( not ( = ?auto_155851 ?auto_155853 ) ) ( not ( = ?auto_155851 ?auto_155854 ) ) ( not ( = ?auto_155851 ?auto_155855 ) ) ( not ( = ?auto_155852 ?auto_155853 ) ) ( not ( = ?auto_155852 ?auto_155854 ) ) ( not ( = ?auto_155852 ?auto_155855 ) ) ( not ( = ?auto_155853 ?auto_155854 ) ) ( not ( = ?auto_155853 ?auto_155855 ) ) ( not ( = ?auto_155854 ?auto_155855 ) ) ( not ( = ?auto_155850 ?auto_155858 ) ) ( not ( = ?auto_155850 ?auto_155856 ) ) ( not ( = ?auto_155851 ?auto_155858 ) ) ( not ( = ?auto_155851 ?auto_155856 ) ) ( not ( = ?auto_155852 ?auto_155858 ) ) ( not ( = ?auto_155852 ?auto_155856 ) ) ( not ( = ?auto_155853 ?auto_155858 ) ) ( not ( = ?auto_155853 ?auto_155856 ) ) ( not ( = ?auto_155854 ?auto_155858 ) ) ( not ( = ?auto_155854 ?auto_155856 ) ) ( not ( = ?auto_155855 ?auto_155858 ) ) ( not ( = ?auto_155855 ?auto_155856 ) ) ( not ( = ?auto_155858 ?auto_155856 ) ) ( ON ?auto_155856 ?auto_155857 ) ( not ( = ?auto_155850 ?auto_155857 ) ) ( not ( = ?auto_155851 ?auto_155857 ) ) ( not ( = ?auto_155852 ?auto_155857 ) ) ( not ( = ?auto_155853 ?auto_155857 ) ) ( not ( = ?auto_155854 ?auto_155857 ) ) ( not ( = ?auto_155855 ?auto_155857 ) ) ( not ( = ?auto_155858 ?auto_155857 ) ) ( not ( = ?auto_155856 ?auto_155857 ) ) ( ON ?auto_155858 ?auto_155856 ) ( ON-TABLE ?auto_155857 ) ( ON ?auto_155855 ?auto_155858 ) ( ON ?auto_155854 ?auto_155855 ) ( CLEAR ?auto_155854 ) ( HOLDING ?auto_155853 ) ( CLEAR ?auto_155852 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_155850 ?auto_155851 ?auto_155852 ?auto_155853 )
      ( MAKE-5PILE ?auto_155850 ?auto_155851 ?auto_155852 ?auto_155853 ?auto_155854 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_155859 - BLOCK
      ?auto_155860 - BLOCK
      ?auto_155861 - BLOCK
      ?auto_155862 - BLOCK
      ?auto_155863 - BLOCK
    )
    :vars
    (
      ?auto_155865 - BLOCK
      ?auto_155867 - BLOCK
      ?auto_155866 - BLOCK
      ?auto_155864 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155859 ) ( ON ?auto_155860 ?auto_155859 ) ( ON ?auto_155861 ?auto_155860 ) ( not ( = ?auto_155859 ?auto_155860 ) ) ( not ( = ?auto_155859 ?auto_155861 ) ) ( not ( = ?auto_155859 ?auto_155862 ) ) ( not ( = ?auto_155859 ?auto_155863 ) ) ( not ( = ?auto_155859 ?auto_155865 ) ) ( not ( = ?auto_155860 ?auto_155861 ) ) ( not ( = ?auto_155860 ?auto_155862 ) ) ( not ( = ?auto_155860 ?auto_155863 ) ) ( not ( = ?auto_155860 ?auto_155865 ) ) ( not ( = ?auto_155861 ?auto_155862 ) ) ( not ( = ?auto_155861 ?auto_155863 ) ) ( not ( = ?auto_155861 ?auto_155865 ) ) ( not ( = ?auto_155862 ?auto_155863 ) ) ( not ( = ?auto_155862 ?auto_155865 ) ) ( not ( = ?auto_155863 ?auto_155865 ) ) ( not ( = ?auto_155859 ?auto_155867 ) ) ( not ( = ?auto_155859 ?auto_155866 ) ) ( not ( = ?auto_155860 ?auto_155867 ) ) ( not ( = ?auto_155860 ?auto_155866 ) ) ( not ( = ?auto_155861 ?auto_155867 ) ) ( not ( = ?auto_155861 ?auto_155866 ) ) ( not ( = ?auto_155862 ?auto_155867 ) ) ( not ( = ?auto_155862 ?auto_155866 ) ) ( not ( = ?auto_155863 ?auto_155867 ) ) ( not ( = ?auto_155863 ?auto_155866 ) ) ( not ( = ?auto_155865 ?auto_155867 ) ) ( not ( = ?auto_155865 ?auto_155866 ) ) ( not ( = ?auto_155867 ?auto_155866 ) ) ( ON ?auto_155866 ?auto_155864 ) ( not ( = ?auto_155859 ?auto_155864 ) ) ( not ( = ?auto_155860 ?auto_155864 ) ) ( not ( = ?auto_155861 ?auto_155864 ) ) ( not ( = ?auto_155862 ?auto_155864 ) ) ( not ( = ?auto_155863 ?auto_155864 ) ) ( not ( = ?auto_155865 ?auto_155864 ) ) ( not ( = ?auto_155867 ?auto_155864 ) ) ( not ( = ?auto_155866 ?auto_155864 ) ) ( ON ?auto_155867 ?auto_155866 ) ( ON-TABLE ?auto_155864 ) ( ON ?auto_155865 ?auto_155867 ) ( ON ?auto_155863 ?auto_155865 ) ( CLEAR ?auto_155861 ) ( ON ?auto_155862 ?auto_155863 ) ( CLEAR ?auto_155862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_155864 ?auto_155866 ?auto_155867 ?auto_155865 ?auto_155863 )
      ( MAKE-5PILE ?auto_155859 ?auto_155860 ?auto_155861 ?auto_155862 ?auto_155863 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_155868 - BLOCK
      ?auto_155869 - BLOCK
      ?auto_155870 - BLOCK
      ?auto_155871 - BLOCK
      ?auto_155872 - BLOCK
    )
    :vars
    (
      ?auto_155876 - BLOCK
      ?auto_155875 - BLOCK
      ?auto_155874 - BLOCK
      ?auto_155873 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155868 ) ( ON ?auto_155869 ?auto_155868 ) ( not ( = ?auto_155868 ?auto_155869 ) ) ( not ( = ?auto_155868 ?auto_155870 ) ) ( not ( = ?auto_155868 ?auto_155871 ) ) ( not ( = ?auto_155868 ?auto_155872 ) ) ( not ( = ?auto_155868 ?auto_155876 ) ) ( not ( = ?auto_155869 ?auto_155870 ) ) ( not ( = ?auto_155869 ?auto_155871 ) ) ( not ( = ?auto_155869 ?auto_155872 ) ) ( not ( = ?auto_155869 ?auto_155876 ) ) ( not ( = ?auto_155870 ?auto_155871 ) ) ( not ( = ?auto_155870 ?auto_155872 ) ) ( not ( = ?auto_155870 ?auto_155876 ) ) ( not ( = ?auto_155871 ?auto_155872 ) ) ( not ( = ?auto_155871 ?auto_155876 ) ) ( not ( = ?auto_155872 ?auto_155876 ) ) ( not ( = ?auto_155868 ?auto_155875 ) ) ( not ( = ?auto_155868 ?auto_155874 ) ) ( not ( = ?auto_155869 ?auto_155875 ) ) ( not ( = ?auto_155869 ?auto_155874 ) ) ( not ( = ?auto_155870 ?auto_155875 ) ) ( not ( = ?auto_155870 ?auto_155874 ) ) ( not ( = ?auto_155871 ?auto_155875 ) ) ( not ( = ?auto_155871 ?auto_155874 ) ) ( not ( = ?auto_155872 ?auto_155875 ) ) ( not ( = ?auto_155872 ?auto_155874 ) ) ( not ( = ?auto_155876 ?auto_155875 ) ) ( not ( = ?auto_155876 ?auto_155874 ) ) ( not ( = ?auto_155875 ?auto_155874 ) ) ( ON ?auto_155874 ?auto_155873 ) ( not ( = ?auto_155868 ?auto_155873 ) ) ( not ( = ?auto_155869 ?auto_155873 ) ) ( not ( = ?auto_155870 ?auto_155873 ) ) ( not ( = ?auto_155871 ?auto_155873 ) ) ( not ( = ?auto_155872 ?auto_155873 ) ) ( not ( = ?auto_155876 ?auto_155873 ) ) ( not ( = ?auto_155875 ?auto_155873 ) ) ( not ( = ?auto_155874 ?auto_155873 ) ) ( ON ?auto_155875 ?auto_155874 ) ( ON-TABLE ?auto_155873 ) ( ON ?auto_155876 ?auto_155875 ) ( ON ?auto_155872 ?auto_155876 ) ( ON ?auto_155871 ?auto_155872 ) ( CLEAR ?auto_155871 ) ( HOLDING ?auto_155870 ) ( CLEAR ?auto_155869 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_155868 ?auto_155869 ?auto_155870 )
      ( MAKE-5PILE ?auto_155868 ?auto_155869 ?auto_155870 ?auto_155871 ?auto_155872 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_155877 - BLOCK
      ?auto_155878 - BLOCK
      ?auto_155879 - BLOCK
      ?auto_155880 - BLOCK
      ?auto_155881 - BLOCK
    )
    :vars
    (
      ?auto_155883 - BLOCK
      ?auto_155885 - BLOCK
      ?auto_155882 - BLOCK
      ?auto_155884 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155877 ) ( ON ?auto_155878 ?auto_155877 ) ( not ( = ?auto_155877 ?auto_155878 ) ) ( not ( = ?auto_155877 ?auto_155879 ) ) ( not ( = ?auto_155877 ?auto_155880 ) ) ( not ( = ?auto_155877 ?auto_155881 ) ) ( not ( = ?auto_155877 ?auto_155883 ) ) ( not ( = ?auto_155878 ?auto_155879 ) ) ( not ( = ?auto_155878 ?auto_155880 ) ) ( not ( = ?auto_155878 ?auto_155881 ) ) ( not ( = ?auto_155878 ?auto_155883 ) ) ( not ( = ?auto_155879 ?auto_155880 ) ) ( not ( = ?auto_155879 ?auto_155881 ) ) ( not ( = ?auto_155879 ?auto_155883 ) ) ( not ( = ?auto_155880 ?auto_155881 ) ) ( not ( = ?auto_155880 ?auto_155883 ) ) ( not ( = ?auto_155881 ?auto_155883 ) ) ( not ( = ?auto_155877 ?auto_155885 ) ) ( not ( = ?auto_155877 ?auto_155882 ) ) ( not ( = ?auto_155878 ?auto_155885 ) ) ( not ( = ?auto_155878 ?auto_155882 ) ) ( not ( = ?auto_155879 ?auto_155885 ) ) ( not ( = ?auto_155879 ?auto_155882 ) ) ( not ( = ?auto_155880 ?auto_155885 ) ) ( not ( = ?auto_155880 ?auto_155882 ) ) ( not ( = ?auto_155881 ?auto_155885 ) ) ( not ( = ?auto_155881 ?auto_155882 ) ) ( not ( = ?auto_155883 ?auto_155885 ) ) ( not ( = ?auto_155883 ?auto_155882 ) ) ( not ( = ?auto_155885 ?auto_155882 ) ) ( ON ?auto_155882 ?auto_155884 ) ( not ( = ?auto_155877 ?auto_155884 ) ) ( not ( = ?auto_155878 ?auto_155884 ) ) ( not ( = ?auto_155879 ?auto_155884 ) ) ( not ( = ?auto_155880 ?auto_155884 ) ) ( not ( = ?auto_155881 ?auto_155884 ) ) ( not ( = ?auto_155883 ?auto_155884 ) ) ( not ( = ?auto_155885 ?auto_155884 ) ) ( not ( = ?auto_155882 ?auto_155884 ) ) ( ON ?auto_155885 ?auto_155882 ) ( ON-TABLE ?auto_155884 ) ( ON ?auto_155883 ?auto_155885 ) ( ON ?auto_155881 ?auto_155883 ) ( ON ?auto_155880 ?auto_155881 ) ( CLEAR ?auto_155878 ) ( ON ?auto_155879 ?auto_155880 ) ( CLEAR ?auto_155879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_155884 ?auto_155882 ?auto_155885 ?auto_155883 ?auto_155881 ?auto_155880 )
      ( MAKE-5PILE ?auto_155877 ?auto_155878 ?auto_155879 ?auto_155880 ?auto_155881 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_155886 - BLOCK
      ?auto_155887 - BLOCK
      ?auto_155888 - BLOCK
      ?auto_155889 - BLOCK
      ?auto_155890 - BLOCK
    )
    :vars
    (
      ?auto_155892 - BLOCK
      ?auto_155893 - BLOCK
      ?auto_155894 - BLOCK
      ?auto_155891 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155886 ) ( not ( = ?auto_155886 ?auto_155887 ) ) ( not ( = ?auto_155886 ?auto_155888 ) ) ( not ( = ?auto_155886 ?auto_155889 ) ) ( not ( = ?auto_155886 ?auto_155890 ) ) ( not ( = ?auto_155886 ?auto_155892 ) ) ( not ( = ?auto_155887 ?auto_155888 ) ) ( not ( = ?auto_155887 ?auto_155889 ) ) ( not ( = ?auto_155887 ?auto_155890 ) ) ( not ( = ?auto_155887 ?auto_155892 ) ) ( not ( = ?auto_155888 ?auto_155889 ) ) ( not ( = ?auto_155888 ?auto_155890 ) ) ( not ( = ?auto_155888 ?auto_155892 ) ) ( not ( = ?auto_155889 ?auto_155890 ) ) ( not ( = ?auto_155889 ?auto_155892 ) ) ( not ( = ?auto_155890 ?auto_155892 ) ) ( not ( = ?auto_155886 ?auto_155893 ) ) ( not ( = ?auto_155886 ?auto_155894 ) ) ( not ( = ?auto_155887 ?auto_155893 ) ) ( not ( = ?auto_155887 ?auto_155894 ) ) ( not ( = ?auto_155888 ?auto_155893 ) ) ( not ( = ?auto_155888 ?auto_155894 ) ) ( not ( = ?auto_155889 ?auto_155893 ) ) ( not ( = ?auto_155889 ?auto_155894 ) ) ( not ( = ?auto_155890 ?auto_155893 ) ) ( not ( = ?auto_155890 ?auto_155894 ) ) ( not ( = ?auto_155892 ?auto_155893 ) ) ( not ( = ?auto_155892 ?auto_155894 ) ) ( not ( = ?auto_155893 ?auto_155894 ) ) ( ON ?auto_155894 ?auto_155891 ) ( not ( = ?auto_155886 ?auto_155891 ) ) ( not ( = ?auto_155887 ?auto_155891 ) ) ( not ( = ?auto_155888 ?auto_155891 ) ) ( not ( = ?auto_155889 ?auto_155891 ) ) ( not ( = ?auto_155890 ?auto_155891 ) ) ( not ( = ?auto_155892 ?auto_155891 ) ) ( not ( = ?auto_155893 ?auto_155891 ) ) ( not ( = ?auto_155894 ?auto_155891 ) ) ( ON ?auto_155893 ?auto_155894 ) ( ON-TABLE ?auto_155891 ) ( ON ?auto_155892 ?auto_155893 ) ( ON ?auto_155890 ?auto_155892 ) ( ON ?auto_155889 ?auto_155890 ) ( ON ?auto_155888 ?auto_155889 ) ( CLEAR ?auto_155888 ) ( HOLDING ?auto_155887 ) ( CLEAR ?auto_155886 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_155886 ?auto_155887 )
      ( MAKE-5PILE ?auto_155886 ?auto_155887 ?auto_155888 ?auto_155889 ?auto_155890 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_155895 - BLOCK
      ?auto_155896 - BLOCK
      ?auto_155897 - BLOCK
      ?auto_155898 - BLOCK
      ?auto_155899 - BLOCK
    )
    :vars
    (
      ?auto_155903 - BLOCK
      ?auto_155902 - BLOCK
      ?auto_155900 - BLOCK
      ?auto_155901 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155895 ) ( not ( = ?auto_155895 ?auto_155896 ) ) ( not ( = ?auto_155895 ?auto_155897 ) ) ( not ( = ?auto_155895 ?auto_155898 ) ) ( not ( = ?auto_155895 ?auto_155899 ) ) ( not ( = ?auto_155895 ?auto_155903 ) ) ( not ( = ?auto_155896 ?auto_155897 ) ) ( not ( = ?auto_155896 ?auto_155898 ) ) ( not ( = ?auto_155896 ?auto_155899 ) ) ( not ( = ?auto_155896 ?auto_155903 ) ) ( not ( = ?auto_155897 ?auto_155898 ) ) ( not ( = ?auto_155897 ?auto_155899 ) ) ( not ( = ?auto_155897 ?auto_155903 ) ) ( not ( = ?auto_155898 ?auto_155899 ) ) ( not ( = ?auto_155898 ?auto_155903 ) ) ( not ( = ?auto_155899 ?auto_155903 ) ) ( not ( = ?auto_155895 ?auto_155902 ) ) ( not ( = ?auto_155895 ?auto_155900 ) ) ( not ( = ?auto_155896 ?auto_155902 ) ) ( not ( = ?auto_155896 ?auto_155900 ) ) ( not ( = ?auto_155897 ?auto_155902 ) ) ( not ( = ?auto_155897 ?auto_155900 ) ) ( not ( = ?auto_155898 ?auto_155902 ) ) ( not ( = ?auto_155898 ?auto_155900 ) ) ( not ( = ?auto_155899 ?auto_155902 ) ) ( not ( = ?auto_155899 ?auto_155900 ) ) ( not ( = ?auto_155903 ?auto_155902 ) ) ( not ( = ?auto_155903 ?auto_155900 ) ) ( not ( = ?auto_155902 ?auto_155900 ) ) ( ON ?auto_155900 ?auto_155901 ) ( not ( = ?auto_155895 ?auto_155901 ) ) ( not ( = ?auto_155896 ?auto_155901 ) ) ( not ( = ?auto_155897 ?auto_155901 ) ) ( not ( = ?auto_155898 ?auto_155901 ) ) ( not ( = ?auto_155899 ?auto_155901 ) ) ( not ( = ?auto_155903 ?auto_155901 ) ) ( not ( = ?auto_155902 ?auto_155901 ) ) ( not ( = ?auto_155900 ?auto_155901 ) ) ( ON ?auto_155902 ?auto_155900 ) ( ON-TABLE ?auto_155901 ) ( ON ?auto_155903 ?auto_155902 ) ( ON ?auto_155899 ?auto_155903 ) ( ON ?auto_155898 ?auto_155899 ) ( ON ?auto_155897 ?auto_155898 ) ( CLEAR ?auto_155895 ) ( ON ?auto_155896 ?auto_155897 ) ( CLEAR ?auto_155896 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_155901 ?auto_155900 ?auto_155902 ?auto_155903 ?auto_155899 ?auto_155898 ?auto_155897 )
      ( MAKE-5PILE ?auto_155895 ?auto_155896 ?auto_155897 ?auto_155898 ?auto_155899 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_155904 - BLOCK
      ?auto_155905 - BLOCK
      ?auto_155906 - BLOCK
      ?auto_155907 - BLOCK
      ?auto_155908 - BLOCK
    )
    :vars
    (
      ?auto_155911 - BLOCK
      ?auto_155910 - BLOCK
      ?auto_155909 - BLOCK
      ?auto_155912 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155904 ?auto_155905 ) ) ( not ( = ?auto_155904 ?auto_155906 ) ) ( not ( = ?auto_155904 ?auto_155907 ) ) ( not ( = ?auto_155904 ?auto_155908 ) ) ( not ( = ?auto_155904 ?auto_155911 ) ) ( not ( = ?auto_155905 ?auto_155906 ) ) ( not ( = ?auto_155905 ?auto_155907 ) ) ( not ( = ?auto_155905 ?auto_155908 ) ) ( not ( = ?auto_155905 ?auto_155911 ) ) ( not ( = ?auto_155906 ?auto_155907 ) ) ( not ( = ?auto_155906 ?auto_155908 ) ) ( not ( = ?auto_155906 ?auto_155911 ) ) ( not ( = ?auto_155907 ?auto_155908 ) ) ( not ( = ?auto_155907 ?auto_155911 ) ) ( not ( = ?auto_155908 ?auto_155911 ) ) ( not ( = ?auto_155904 ?auto_155910 ) ) ( not ( = ?auto_155904 ?auto_155909 ) ) ( not ( = ?auto_155905 ?auto_155910 ) ) ( not ( = ?auto_155905 ?auto_155909 ) ) ( not ( = ?auto_155906 ?auto_155910 ) ) ( not ( = ?auto_155906 ?auto_155909 ) ) ( not ( = ?auto_155907 ?auto_155910 ) ) ( not ( = ?auto_155907 ?auto_155909 ) ) ( not ( = ?auto_155908 ?auto_155910 ) ) ( not ( = ?auto_155908 ?auto_155909 ) ) ( not ( = ?auto_155911 ?auto_155910 ) ) ( not ( = ?auto_155911 ?auto_155909 ) ) ( not ( = ?auto_155910 ?auto_155909 ) ) ( ON ?auto_155909 ?auto_155912 ) ( not ( = ?auto_155904 ?auto_155912 ) ) ( not ( = ?auto_155905 ?auto_155912 ) ) ( not ( = ?auto_155906 ?auto_155912 ) ) ( not ( = ?auto_155907 ?auto_155912 ) ) ( not ( = ?auto_155908 ?auto_155912 ) ) ( not ( = ?auto_155911 ?auto_155912 ) ) ( not ( = ?auto_155910 ?auto_155912 ) ) ( not ( = ?auto_155909 ?auto_155912 ) ) ( ON ?auto_155910 ?auto_155909 ) ( ON-TABLE ?auto_155912 ) ( ON ?auto_155911 ?auto_155910 ) ( ON ?auto_155908 ?auto_155911 ) ( ON ?auto_155907 ?auto_155908 ) ( ON ?auto_155906 ?auto_155907 ) ( ON ?auto_155905 ?auto_155906 ) ( CLEAR ?auto_155905 ) ( HOLDING ?auto_155904 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_155904 )
      ( MAKE-5PILE ?auto_155904 ?auto_155905 ?auto_155906 ?auto_155907 ?auto_155908 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_155913 - BLOCK
      ?auto_155914 - BLOCK
      ?auto_155915 - BLOCK
      ?auto_155916 - BLOCK
      ?auto_155917 - BLOCK
    )
    :vars
    (
      ?auto_155918 - BLOCK
      ?auto_155921 - BLOCK
      ?auto_155920 - BLOCK
      ?auto_155919 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155913 ?auto_155914 ) ) ( not ( = ?auto_155913 ?auto_155915 ) ) ( not ( = ?auto_155913 ?auto_155916 ) ) ( not ( = ?auto_155913 ?auto_155917 ) ) ( not ( = ?auto_155913 ?auto_155918 ) ) ( not ( = ?auto_155914 ?auto_155915 ) ) ( not ( = ?auto_155914 ?auto_155916 ) ) ( not ( = ?auto_155914 ?auto_155917 ) ) ( not ( = ?auto_155914 ?auto_155918 ) ) ( not ( = ?auto_155915 ?auto_155916 ) ) ( not ( = ?auto_155915 ?auto_155917 ) ) ( not ( = ?auto_155915 ?auto_155918 ) ) ( not ( = ?auto_155916 ?auto_155917 ) ) ( not ( = ?auto_155916 ?auto_155918 ) ) ( not ( = ?auto_155917 ?auto_155918 ) ) ( not ( = ?auto_155913 ?auto_155921 ) ) ( not ( = ?auto_155913 ?auto_155920 ) ) ( not ( = ?auto_155914 ?auto_155921 ) ) ( not ( = ?auto_155914 ?auto_155920 ) ) ( not ( = ?auto_155915 ?auto_155921 ) ) ( not ( = ?auto_155915 ?auto_155920 ) ) ( not ( = ?auto_155916 ?auto_155921 ) ) ( not ( = ?auto_155916 ?auto_155920 ) ) ( not ( = ?auto_155917 ?auto_155921 ) ) ( not ( = ?auto_155917 ?auto_155920 ) ) ( not ( = ?auto_155918 ?auto_155921 ) ) ( not ( = ?auto_155918 ?auto_155920 ) ) ( not ( = ?auto_155921 ?auto_155920 ) ) ( ON ?auto_155920 ?auto_155919 ) ( not ( = ?auto_155913 ?auto_155919 ) ) ( not ( = ?auto_155914 ?auto_155919 ) ) ( not ( = ?auto_155915 ?auto_155919 ) ) ( not ( = ?auto_155916 ?auto_155919 ) ) ( not ( = ?auto_155917 ?auto_155919 ) ) ( not ( = ?auto_155918 ?auto_155919 ) ) ( not ( = ?auto_155921 ?auto_155919 ) ) ( not ( = ?auto_155920 ?auto_155919 ) ) ( ON ?auto_155921 ?auto_155920 ) ( ON-TABLE ?auto_155919 ) ( ON ?auto_155918 ?auto_155921 ) ( ON ?auto_155917 ?auto_155918 ) ( ON ?auto_155916 ?auto_155917 ) ( ON ?auto_155915 ?auto_155916 ) ( ON ?auto_155914 ?auto_155915 ) ( ON ?auto_155913 ?auto_155914 ) ( CLEAR ?auto_155913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_155919 ?auto_155920 ?auto_155921 ?auto_155918 ?auto_155917 ?auto_155916 ?auto_155915 ?auto_155914 )
      ( MAKE-5PILE ?auto_155913 ?auto_155914 ?auto_155915 ?auto_155916 ?auto_155917 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_155925 - BLOCK
      ?auto_155926 - BLOCK
      ?auto_155927 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_155927 ) ( CLEAR ?auto_155926 ) ( ON-TABLE ?auto_155925 ) ( ON ?auto_155926 ?auto_155925 ) ( not ( = ?auto_155925 ?auto_155926 ) ) ( not ( = ?auto_155925 ?auto_155927 ) ) ( not ( = ?auto_155926 ?auto_155927 ) ) )
    :subtasks
    ( ( !STACK ?auto_155927 ?auto_155926 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_155928 - BLOCK
      ?auto_155929 - BLOCK
      ?auto_155930 - BLOCK
    )
    :vars
    (
      ?auto_155931 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_155929 ) ( ON-TABLE ?auto_155928 ) ( ON ?auto_155929 ?auto_155928 ) ( not ( = ?auto_155928 ?auto_155929 ) ) ( not ( = ?auto_155928 ?auto_155930 ) ) ( not ( = ?auto_155929 ?auto_155930 ) ) ( ON ?auto_155930 ?auto_155931 ) ( CLEAR ?auto_155930 ) ( HAND-EMPTY ) ( not ( = ?auto_155928 ?auto_155931 ) ) ( not ( = ?auto_155929 ?auto_155931 ) ) ( not ( = ?auto_155930 ?auto_155931 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_155930 ?auto_155931 )
      ( MAKE-3PILE ?auto_155928 ?auto_155929 ?auto_155930 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_155932 - BLOCK
      ?auto_155933 - BLOCK
      ?auto_155934 - BLOCK
    )
    :vars
    (
      ?auto_155935 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155932 ) ( not ( = ?auto_155932 ?auto_155933 ) ) ( not ( = ?auto_155932 ?auto_155934 ) ) ( not ( = ?auto_155933 ?auto_155934 ) ) ( ON ?auto_155934 ?auto_155935 ) ( CLEAR ?auto_155934 ) ( not ( = ?auto_155932 ?auto_155935 ) ) ( not ( = ?auto_155933 ?auto_155935 ) ) ( not ( = ?auto_155934 ?auto_155935 ) ) ( HOLDING ?auto_155933 ) ( CLEAR ?auto_155932 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_155932 ?auto_155933 )
      ( MAKE-3PILE ?auto_155932 ?auto_155933 ?auto_155934 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_155936 - BLOCK
      ?auto_155937 - BLOCK
      ?auto_155938 - BLOCK
    )
    :vars
    (
      ?auto_155939 - BLOCK
      ?auto_155943 - BLOCK
      ?auto_155940 - BLOCK
      ?auto_155941 - BLOCK
      ?auto_155942 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155936 ) ( not ( = ?auto_155936 ?auto_155937 ) ) ( not ( = ?auto_155936 ?auto_155938 ) ) ( not ( = ?auto_155937 ?auto_155938 ) ) ( ON ?auto_155938 ?auto_155939 ) ( not ( = ?auto_155936 ?auto_155939 ) ) ( not ( = ?auto_155937 ?auto_155939 ) ) ( not ( = ?auto_155938 ?auto_155939 ) ) ( CLEAR ?auto_155936 ) ( ON ?auto_155937 ?auto_155938 ) ( CLEAR ?auto_155937 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_155943 ) ( ON ?auto_155940 ?auto_155943 ) ( ON ?auto_155941 ?auto_155940 ) ( ON ?auto_155942 ?auto_155941 ) ( ON ?auto_155939 ?auto_155942 ) ( not ( = ?auto_155943 ?auto_155940 ) ) ( not ( = ?auto_155943 ?auto_155941 ) ) ( not ( = ?auto_155943 ?auto_155942 ) ) ( not ( = ?auto_155943 ?auto_155939 ) ) ( not ( = ?auto_155943 ?auto_155938 ) ) ( not ( = ?auto_155943 ?auto_155937 ) ) ( not ( = ?auto_155940 ?auto_155941 ) ) ( not ( = ?auto_155940 ?auto_155942 ) ) ( not ( = ?auto_155940 ?auto_155939 ) ) ( not ( = ?auto_155940 ?auto_155938 ) ) ( not ( = ?auto_155940 ?auto_155937 ) ) ( not ( = ?auto_155941 ?auto_155942 ) ) ( not ( = ?auto_155941 ?auto_155939 ) ) ( not ( = ?auto_155941 ?auto_155938 ) ) ( not ( = ?auto_155941 ?auto_155937 ) ) ( not ( = ?auto_155942 ?auto_155939 ) ) ( not ( = ?auto_155942 ?auto_155938 ) ) ( not ( = ?auto_155942 ?auto_155937 ) ) ( not ( = ?auto_155936 ?auto_155943 ) ) ( not ( = ?auto_155936 ?auto_155940 ) ) ( not ( = ?auto_155936 ?auto_155941 ) ) ( not ( = ?auto_155936 ?auto_155942 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_155943 ?auto_155940 ?auto_155941 ?auto_155942 ?auto_155939 ?auto_155938 )
      ( MAKE-3PILE ?auto_155936 ?auto_155937 ?auto_155938 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_155944 - BLOCK
      ?auto_155945 - BLOCK
      ?auto_155946 - BLOCK
    )
    :vars
    (
      ?auto_155950 - BLOCK
      ?auto_155947 - BLOCK
      ?auto_155948 - BLOCK
      ?auto_155949 - BLOCK
      ?auto_155951 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155944 ?auto_155945 ) ) ( not ( = ?auto_155944 ?auto_155946 ) ) ( not ( = ?auto_155945 ?auto_155946 ) ) ( ON ?auto_155946 ?auto_155950 ) ( not ( = ?auto_155944 ?auto_155950 ) ) ( not ( = ?auto_155945 ?auto_155950 ) ) ( not ( = ?auto_155946 ?auto_155950 ) ) ( ON ?auto_155945 ?auto_155946 ) ( CLEAR ?auto_155945 ) ( ON-TABLE ?auto_155947 ) ( ON ?auto_155948 ?auto_155947 ) ( ON ?auto_155949 ?auto_155948 ) ( ON ?auto_155951 ?auto_155949 ) ( ON ?auto_155950 ?auto_155951 ) ( not ( = ?auto_155947 ?auto_155948 ) ) ( not ( = ?auto_155947 ?auto_155949 ) ) ( not ( = ?auto_155947 ?auto_155951 ) ) ( not ( = ?auto_155947 ?auto_155950 ) ) ( not ( = ?auto_155947 ?auto_155946 ) ) ( not ( = ?auto_155947 ?auto_155945 ) ) ( not ( = ?auto_155948 ?auto_155949 ) ) ( not ( = ?auto_155948 ?auto_155951 ) ) ( not ( = ?auto_155948 ?auto_155950 ) ) ( not ( = ?auto_155948 ?auto_155946 ) ) ( not ( = ?auto_155948 ?auto_155945 ) ) ( not ( = ?auto_155949 ?auto_155951 ) ) ( not ( = ?auto_155949 ?auto_155950 ) ) ( not ( = ?auto_155949 ?auto_155946 ) ) ( not ( = ?auto_155949 ?auto_155945 ) ) ( not ( = ?auto_155951 ?auto_155950 ) ) ( not ( = ?auto_155951 ?auto_155946 ) ) ( not ( = ?auto_155951 ?auto_155945 ) ) ( not ( = ?auto_155944 ?auto_155947 ) ) ( not ( = ?auto_155944 ?auto_155948 ) ) ( not ( = ?auto_155944 ?auto_155949 ) ) ( not ( = ?auto_155944 ?auto_155951 ) ) ( HOLDING ?auto_155944 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_155944 )
      ( MAKE-3PILE ?auto_155944 ?auto_155945 ?auto_155946 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_155952 - BLOCK
      ?auto_155953 - BLOCK
      ?auto_155954 - BLOCK
    )
    :vars
    (
      ?auto_155958 - BLOCK
      ?auto_155957 - BLOCK
      ?auto_155956 - BLOCK
      ?auto_155955 - BLOCK
      ?auto_155959 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155952 ?auto_155953 ) ) ( not ( = ?auto_155952 ?auto_155954 ) ) ( not ( = ?auto_155953 ?auto_155954 ) ) ( ON ?auto_155954 ?auto_155958 ) ( not ( = ?auto_155952 ?auto_155958 ) ) ( not ( = ?auto_155953 ?auto_155958 ) ) ( not ( = ?auto_155954 ?auto_155958 ) ) ( ON ?auto_155953 ?auto_155954 ) ( ON-TABLE ?auto_155957 ) ( ON ?auto_155956 ?auto_155957 ) ( ON ?auto_155955 ?auto_155956 ) ( ON ?auto_155959 ?auto_155955 ) ( ON ?auto_155958 ?auto_155959 ) ( not ( = ?auto_155957 ?auto_155956 ) ) ( not ( = ?auto_155957 ?auto_155955 ) ) ( not ( = ?auto_155957 ?auto_155959 ) ) ( not ( = ?auto_155957 ?auto_155958 ) ) ( not ( = ?auto_155957 ?auto_155954 ) ) ( not ( = ?auto_155957 ?auto_155953 ) ) ( not ( = ?auto_155956 ?auto_155955 ) ) ( not ( = ?auto_155956 ?auto_155959 ) ) ( not ( = ?auto_155956 ?auto_155958 ) ) ( not ( = ?auto_155956 ?auto_155954 ) ) ( not ( = ?auto_155956 ?auto_155953 ) ) ( not ( = ?auto_155955 ?auto_155959 ) ) ( not ( = ?auto_155955 ?auto_155958 ) ) ( not ( = ?auto_155955 ?auto_155954 ) ) ( not ( = ?auto_155955 ?auto_155953 ) ) ( not ( = ?auto_155959 ?auto_155958 ) ) ( not ( = ?auto_155959 ?auto_155954 ) ) ( not ( = ?auto_155959 ?auto_155953 ) ) ( not ( = ?auto_155952 ?auto_155957 ) ) ( not ( = ?auto_155952 ?auto_155956 ) ) ( not ( = ?auto_155952 ?auto_155955 ) ) ( not ( = ?auto_155952 ?auto_155959 ) ) ( ON ?auto_155952 ?auto_155953 ) ( CLEAR ?auto_155952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_155957 ?auto_155956 ?auto_155955 ?auto_155959 ?auto_155958 ?auto_155954 ?auto_155953 )
      ( MAKE-3PILE ?auto_155952 ?auto_155953 ?auto_155954 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_155960 - BLOCK
      ?auto_155961 - BLOCK
      ?auto_155962 - BLOCK
    )
    :vars
    (
      ?auto_155965 - BLOCK
      ?auto_155966 - BLOCK
      ?auto_155964 - BLOCK
      ?auto_155967 - BLOCK
      ?auto_155963 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155960 ?auto_155961 ) ) ( not ( = ?auto_155960 ?auto_155962 ) ) ( not ( = ?auto_155961 ?auto_155962 ) ) ( ON ?auto_155962 ?auto_155965 ) ( not ( = ?auto_155960 ?auto_155965 ) ) ( not ( = ?auto_155961 ?auto_155965 ) ) ( not ( = ?auto_155962 ?auto_155965 ) ) ( ON ?auto_155961 ?auto_155962 ) ( ON-TABLE ?auto_155966 ) ( ON ?auto_155964 ?auto_155966 ) ( ON ?auto_155967 ?auto_155964 ) ( ON ?auto_155963 ?auto_155967 ) ( ON ?auto_155965 ?auto_155963 ) ( not ( = ?auto_155966 ?auto_155964 ) ) ( not ( = ?auto_155966 ?auto_155967 ) ) ( not ( = ?auto_155966 ?auto_155963 ) ) ( not ( = ?auto_155966 ?auto_155965 ) ) ( not ( = ?auto_155966 ?auto_155962 ) ) ( not ( = ?auto_155966 ?auto_155961 ) ) ( not ( = ?auto_155964 ?auto_155967 ) ) ( not ( = ?auto_155964 ?auto_155963 ) ) ( not ( = ?auto_155964 ?auto_155965 ) ) ( not ( = ?auto_155964 ?auto_155962 ) ) ( not ( = ?auto_155964 ?auto_155961 ) ) ( not ( = ?auto_155967 ?auto_155963 ) ) ( not ( = ?auto_155967 ?auto_155965 ) ) ( not ( = ?auto_155967 ?auto_155962 ) ) ( not ( = ?auto_155967 ?auto_155961 ) ) ( not ( = ?auto_155963 ?auto_155965 ) ) ( not ( = ?auto_155963 ?auto_155962 ) ) ( not ( = ?auto_155963 ?auto_155961 ) ) ( not ( = ?auto_155960 ?auto_155966 ) ) ( not ( = ?auto_155960 ?auto_155964 ) ) ( not ( = ?auto_155960 ?auto_155967 ) ) ( not ( = ?auto_155960 ?auto_155963 ) ) ( HOLDING ?auto_155960 ) ( CLEAR ?auto_155961 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_155966 ?auto_155964 ?auto_155967 ?auto_155963 ?auto_155965 ?auto_155962 ?auto_155961 ?auto_155960 )
      ( MAKE-3PILE ?auto_155960 ?auto_155961 ?auto_155962 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_155968 - BLOCK
      ?auto_155969 - BLOCK
      ?auto_155970 - BLOCK
    )
    :vars
    (
      ?auto_155974 - BLOCK
      ?auto_155975 - BLOCK
      ?auto_155973 - BLOCK
      ?auto_155972 - BLOCK
      ?auto_155971 - BLOCK
      ?auto_155976 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155968 ?auto_155969 ) ) ( not ( = ?auto_155968 ?auto_155970 ) ) ( not ( = ?auto_155969 ?auto_155970 ) ) ( ON ?auto_155970 ?auto_155974 ) ( not ( = ?auto_155968 ?auto_155974 ) ) ( not ( = ?auto_155969 ?auto_155974 ) ) ( not ( = ?auto_155970 ?auto_155974 ) ) ( ON ?auto_155969 ?auto_155970 ) ( ON-TABLE ?auto_155975 ) ( ON ?auto_155973 ?auto_155975 ) ( ON ?auto_155972 ?auto_155973 ) ( ON ?auto_155971 ?auto_155972 ) ( ON ?auto_155974 ?auto_155971 ) ( not ( = ?auto_155975 ?auto_155973 ) ) ( not ( = ?auto_155975 ?auto_155972 ) ) ( not ( = ?auto_155975 ?auto_155971 ) ) ( not ( = ?auto_155975 ?auto_155974 ) ) ( not ( = ?auto_155975 ?auto_155970 ) ) ( not ( = ?auto_155975 ?auto_155969 ) ) ( not ( = ?auto_155973 ?auto_155972 ) ) ( not ( = ?auto_155973 ?auto_155971 ) ) ( not ( = ?auto_155973 ?auto_155974 ) ) ( not ( = ?auto_155973 ?auto_155970 ) ) ( not ( = ?auto_155973 ?auto_155969 ) ) ( not ( = ?auto_155972 ?auto_155971 ) ) ( not ( = ?auto_155972 ?auto_155974 ) ) ( not ( = ?auto_155972 ?auto_155970 ) ) ( not ( = ?auto_155972 ?auto_155969 ) ) ( not ( = ?auto_155971 ?auto_155974 ) ) ( not ( = ?auto_155971 ?auto_155970 ) ) ( not ( = ?auto_155971 ?auto_155969 ) ) ( not ( = ?auto_155968 ?auto_155975 ) ) ( not ( = ?auto_155968 ?auto_155973 ) ) ( not ( = ?auto_155968 ?auto_155972 ) ) ( not ( = ?auto_155968 ?auto_155971 ) ) ( CLEAR ?auto_155969 ) ( ON ?auto_155968 ?auto_155976 ) ( CLEAR ?auto_155968 ) ( HAND-EMPTY ) ( not ( = ?auto_155968 ?auto_155976 ) ) ( not ( = ?auto_155969 ?auto_155976 ) ) ( not ( = ?auto_155970 ?auto_155976 ) ) ( not ( = ?auto_155974 ?auto_155976 ) ) ( not ( = ?auto_155975 ?auto_155976 ) ) ( not ( = ?auto_155973 ?auto_155976 ) ) ( not ( = ?auto_155972 ?auto_155976 ) ) ( not ( = ?auto_155971 ?auto_155976 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_155968 ?auto_155976 )
      ( MAKE-3PILE ?auto_155968 ?auto_155969 ?auto_155970 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_155977 - BLOCK
      ?auto_155978 - BLOCK
      ?auto_155979 - BLOCK
    )
    :vars
    (
      ?auto_155981 - BLOCK
      ?auto_155983 - BLOCK
      ?auto_155984 - BLOCK
      ?auto_155985 - BLOCK
      ?auto_155982 - BLOCK
      ?auto_155980 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155977 ?auto_155978 ) ) ( not ( = ?auto_155977 ?auto_155979 ) ) ( not ( = ?auto_155978 ?auto_155979 ) ) ( ON ?auto_155979 ?auto_155981 ) ( not ( = ?auto_155977 ?auto_155981 ) ) ( not ( = ?auto_155978 ?auto_155981 ) ) ( not ( = ?auto_155979 ?auto_155981 ) ) ( ON-TABLE ?auto_155983 ) ( ON ?auto_155984 ?auto_155983 ) ( ON ?auto_155985 ?auto_155984 ) ( ON ?auto_155982 ?auto_155985 ) ( ON ?auto_155981 ?auto_155982 ) ( not ( = ?auto_155983 ?auto_155984 ) ) ( not ( = ?auto_155983 ?auto_155985 ) ) ( not ( = ?auto_155983 ?auto_155982 ) ) ( not ( = ?auto_155983 ?auto_155981 ) ) ( not ( = ?auto_155983 ?auto_155979 ) ) ( not ( = ?auto_155983 ?auto_155978 ) ) ( not ( = ?auto_155984 ?auto_155985 ) ) ( not ( = ?auto_155984 ?auto_155982 ) ) ( not ( = ?auto_155984 ?auto_155981 ) ) ( not ( = ?auto_155984 ?auto_155979 ) ) ( not ( = ?auto_155984 ?auto_155978 ) ) ( not ( = ?auto_155985 ?auto_155982 ) ) ( not ( = ?auto_155985 ?auto_155981 ) ) ( not ( = ?auto_155985 ?auto_155979 ) ) ( not ( = ?auto_155985 ?auto_155978 ) ) ( not ( = ?auto_155982 ?auto_155981 ) ) ( not ( = ?auto_155982 ?auto_155979 ) ) ( not ( = ?auto_155982 ?auto_155978 ) ) ( not ( = ?auto_155977 ?auto_155983 ) ) ( not ( = ?auto_155977 ?auto_155984 ) ) ( not ( = ?auto_155977 ?auto_155985 ) ) ( not ( = ?auto_155977 ?auto_155982 ) ) ( ON ?auto_155977 ?auto_155980 ) ( CLEAR ?auto_155977 ) ( not ( = ?auto_155977 ?auto_155980 ) ) ( not ( = ?auto_155978 ?auto_155980 ) ) ( not ( = ?auto_155979 ?auto_155980 ) ) ( not ( = ?auto_155981 ?auto_155980 ) ) ( not ( = ?auto_155983 ?auto_155980 ) ) ( not ( = ?auto_155984 ?auto_155980 ) ) ( not ( = ?auto_155985 ?auto_155980 ) ) ( not ( = ?auto_155982 ?auto_155980 ) ) ( HOLDING ?auto_155978 ) ( CLEAR ?auto_155979 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_155983 ?auto_155984 ?auto_155985 ?auto_155982 ?auto_155981 ?auto_155979 ?auto_155978 )
      ( MAKE-3PILE ?auto_155977 ?auto_155978 ?auto_155979 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_155986 - BLOCK
      ?auto_155987 - BLOCK
      ?auto_155988 - BLOCK
    )
    :vars
    (
      ?auto_155991 - BLOCK
      ?auto_155992 - BLOCK
      ?auto_155994 - BLOCK
      ?auto_155993 - BLOCK
      ?auto_155990 - BLOCK
      ?auto_155989 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155986 ?auto_155987 ) ) ( not ( = ?auto_155986 ?auto_155988 ) ) ( not ( = ?auto_155987 ?auto_155988 ) ) ( ON ?auto_155988 ?auto_155991 ) ( not ( = ?auto_155986 ?auto_155991 ) ) ( not ( = ?auto_155987 ?auto_155991 ) ) ( not ( = ?auto_155988 ?auto_155991 ) ) ( ON-TABLE ?auto_155992 ) ( ON ?auto_155994 ?auto_155992 ) ( ON ?auto_155993 ?auto_155994 ) ( ON ?auto_155990 ?auto_155993 ) ( ON ?auto_155991 ?auto_155990 ) ( not ( = ?auto_155992 ?auto_155994 ) ) ( not ( = ?auto_155992 ?auto_155993 ) ) ( not ( = ?auto_155992 ?auto_155990 ) ) ( not ( = ?auto_155992 ?auto_155991 ) ) ( not ( = ?auto_155992 ?auto_155988 ) ) ( not ( = ?auto_155992 ?auto_155987 ) ) ( not ( = ?auto_155994 ?auto_155993 ) ) ( not ( = ?auto_155994 ?auto_155990 ) ) ( not ( = ?auto_155994 ?auto_155991 ) ) ( not ( = ?auto_155994 ?auto_155988 ) ) ( not ( = ?auto_155994 ?auto_155987 ) ) ( not ( = ?auto_155993 ?auto_155990 ) ) ( not ( = ?auto_155993 ?auto_155991 ) ) ( not ( = ?auto_155993 ?auto_155988 ) ) ( not ( = ?auto_155993 ?auto_155987 ) ) ( not ( = ?auto_155990 ?auto_155991 ) ) ( not ( = ?auto_155990 ?auto_155988 ) ) ( not ( = ?auto_155990 ?auto_155987 ) ) ( not ( = ?auto_155986 ?auto_155992 ) ) ( not ( = ?auto_155986 ?auto_155994 ) ) ( not ( = ?auto_155986 ?auto_155993 ) ) ( not ( = ?auto_155986 ?auto_155990 ) ) ( ON ?auto_155986 ?auto_155989 ) ( not ( = ?auto_155986 ?auto_155989 ) ) ( not ( = ?auto_155987 ?auto_155989 ) ) ( not ( = ?auto_155988 ?auto_155989 ) ) ( not ( = ?auto_155991 ?auto_155989 ) ) ( not ( = ?auto_155992 ?auto_155989 ) ) ( not ( = ?auto_155994 ?auto_155989 ) ) ( not ( = ?auto_155993 ?auto_155989 ) ) ( not ( = ?auto_155990 ?auto_155989 ) ) ( CLEAR ?auto_155988 ) ( ON ?auto_155987 ?auto_155986 ) ( CLEAR ?auto_155987 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_155989 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_155989 ?auto_155986 )
      ( MAKE-3PILE ?auto_155986 ?auto_155987 ?auto_155988 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_155995 - BLOCK
      ?auto_155996 - BLOCK
      ?auto_155997 - BLOCK
    )
    :vars
    (
      ?auto_156000 - BLOCK
      ?auto_156001 - BLOCK
      ?auto_155998 - BLOCK
      ?auto_156003 - BLOCK
      ?auto_155999 - BLOCK
      ?auto_156002 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155995 ?auto_155996 ) ) ( not ( = ?auto_155995 ?auto_155997 ) ) ( not ( = ?auto_155996 ?auto_155997 ) ) ( not ( = ?auto_155995 ?auto_156000 ) ) ( not ( = ?auto_155996 ?auto_156000 ) ) ( not ( = ?auto_155997 ?auto_156000 ) ) ( ON-TABLE ?auto_156001 ) ( ON ?auto_155998 ?auto_156001 ) ( ON ?auto_156003 ?auto_155998 ) ( ON ?auto_155999 ?auto_156003 ) ( ON ?auto_156000 ?auto_155999 ) ( not ( = ?auto_156001 ?auto_155998 ) ) ( not ( = ?auto_156001 ?auto_156003 ) ) ( not ( = ?auto_156001 ?auto_155999 ) ) ( not ( = ?auto_156001 ?auto_156000 ) ) ( not ( = ?auto_156001 ?auto_155997 ) ) ( not ( = ?auto_156001 ?auto_155996 ) ) ( not ( = ?auto_155998 ?auto_156003 ) ) ( not ( = ?auto_155998 ?auto_155999 ) ) ( not ( = ?auto_155998 ?auto_156000 ) ) ( not ( = ?auto_155998 ?auto_155997 ) ) ( not ( = ?auto_155998 ?auto_155996 ) ) ( not ( = ?auto_156003 ?auto_155999 ) ) ( not ( = ?auto_156003 ?auto_156000 ) ) ( not ( = ?auto_156003 ?auto_155997 ) ) ( not ( = ?auto_156003 ?auto_155996 ) ) ( not ( = ?auto_155999 ?auto_156000 ) ) ( not ( = ?auto_155999 ?auto_155997 ) ) ( not ( = ?auto_155999 ?auto_155996 ) ) ( not ( = ?auto_155995 ?auto_156001 ) ) ( not ( = ?auto_155995 ?auto_155998 ) ) ( not ( = ?auto_155995 ?auto_156003 ) ) ( not ( = ?auto_155995 ?auto_155999 ) ) ( ON ?auto_155995 ?auto_156002 ) ( not ( = ?auto_155995 ?auto_156002 ) ) ( not ( = ?auto_155996 ?auto_156002 ) ) ( not ( = ?auto_155997 ?auto_156002 ) ) ( not ( = ?auto_156000 ?auto_156002 ) ) ( not ( = ?auto_156001 ?auto_156002 ) ) ( not ( = ?auto_155998 ?auto_156002 ) ) ( not ( = ?auto_156003 ?auto_156002 ) ) ( not ( = ?auto_155999 ?auto_156002 ) ) ( ON ?auto_155996 ?auto_155995 ) ( CLEAR ?auto_155996 ) ( ON-TABLE ?auto_156002 ) ( HOLDING ?auto_155997 ) ( CLEAR ?auto_156000 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_156001 ?auto_155998 ?auto_156003 ?auto_155999 ?auto_156000 ?auto_155997 )
      ( MAKE-3PILE ?auto_155995 ?auto_155996 ?auto_155997 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156004 - BLOCK
      ?auto_156005 - BLOCK
      ?auto_156006 - BLOCK
    )
    :vars
    (
      ?auto_156007 - BLOCK
      ?auto_156011 - BLOCK
      ?auto_156008 - BLOCK
      ?auto_156012 - BLOCK
      ?auto_156009 - BLOCK
      ?auto_156010 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156004 ?auto_156005 ) ) ( not ( = ?auto_156004 ?auto_156006 ) ) ( not ( = ?auto_156005 ?auto_156006 ) ) ( not ( = ?auto_156004 ?auto_156007 ) ) ( not ( = ?auto_156005 ?auto_156007 ) ) ( not ( = ?auto_156006 ?auto_156007 ) ) ( ON-TABLE ?auto_156011 ) ( ON ?auto_156008 ?auto_156011 ) ( ON ?auto_156012 ?auto_156008 ) ( ON ?auto_156009 ?auto_156012 ) ( ON ?auto_156007 ?auto_156009 ) ( not ( = ?auto_156011 ?auto_156008 ) ) ( not ( = ?auto_156011 ?auto_156012 ) ) ( not ( = ?auto_156011 ?auto_156009 ) ) ( not ( = ?auto_156011 ?auto_156007 ) ) ( not ( = ?auto_156011 ?auto_156006 ) ) ( not ( = ?auto_156011 ?auto_156005 ) ) ( not ( = ?auto_156008 ?auto_156012 ) ) ( not ( = ?auto_156008 ?auto_156009 ) ) ( not ( = ?auto_156008 ?auto_156007 ) ) ( not ( = ?auto_156008 ?auto_156006 ) ) ( not ( = ?auto_156008 ?auto_156005 ) ) ( not ( = ?auto_156012 ?auto_156009 ) ) ( not ( = ?auto_156012 ?auto_156007 ) ) ( not ( = ?auto_156012 ?auto_156006 ) ) ( not ( = ?auto_156012 ?auto_156005 ) ) ( not ( = ?auto_156009 ?auto_156007 ) ) ( not ( = ?auto_156009 ?auto_156006 ) ) ( not ( = ?auto_156009 ?auto_156005 ) ) ( not ( = ?auto_156004 ?auto_156011 ) ) ( not ( = ?auto_156004 ?auto_156008 ) ) ( not ( = ?auto_156004 ?auto_156012 ) ) ( not ( = ?auto_156004 ?auto_156009 ) ) ( ON ?auto_156004 ?auto_156010 ) ( not ( = ?auto_156004 ?auto_156010 ) ) ( not ( = ?auto_156005 ?auto_156010 ) ) ( not ( = ?auto_156006 ?auto_156010 ) ) ( not ( = ?auto_156007 ?auto_156010 ) ) ( not ( = ?auto_156011 ?auto_156010 ) ) ( not ( = ?auto_156008 ?auto_156010 ) ) ( not ( = ?auto_156012 ?auto_156010 ) ) ( not ( = ?auto_156009 ?auto_156010 ) ) ( ON ?auto_156005 ?auto_156004 ) ( ON-TABLE ?auto_156010 ) ( CLEAR ?auto_156007 ) ( ON ?auto_156006 ?auto_156005 ) ( CLEAR ?auto_156006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_156010 ?auto_156004 ?auto_156005 )
      ( MAKE-3PILE ?auto_156004 ?auto_156005 ?auto_156006 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156013 - BLOCK
      ?auto_156014 - BLOCK
      ?auto_156015 - BLOCK
    )
    :vars
    (
      ?auto_156020 - BLOCK
      ?auto_156018 - BLOCK
      ?auto_156017 - BLOCK
      ?auto_156021 - BLOCK
      ?auto_156016 - BLOCK
      ?auto_156019 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156013 ?auto_156014 ) ) ( not ( = ?auto_156013 ?auto_156015 ) ) ( not ( = ?auto_156014 ?auto_156015 ) ) ( not ( = ?auto_156013 ?auto_156020 ) ) ( not ( = ?auto_156014 ?auto_156020 ) ) ( not ( = ?auto_156015 ?auto_156020 ) ) ( ON-TABLE ?auto_156018 ) ( ON ?auto_156017 ?auto_156018 ) ( ON ?auto_156021 ?auto_156017 ) ( ON ?auto_156016 ?auto_156021 ) ( not ( = ?auto_156018 ?auto_156017 ) ) ( not ( = ?auto_156018 ?auto_156021 ) ) ( not ( = ?auto_156018 ?auto_156016 ) ) ( not ( = ?auto_156018 ?auto_156020 ) ) ( not ( = ?auto_156018 ?auto_156015 ) ) ( not ( = ?auto_156018 ?auto_156014 ) ) ( not ( = ?auto_156017 ?auto_156021 ) ) ( not ( = ?auto_156017 ?auto_156016 ) ) ( not ( = ?auto_156017 ?auto_156020 ) ) ( not ( = ?auto_156017 ?auto_156015 ) ) ( not ( = ?auto_156017 ?auto_156014 ) ) ( not ( = ?auto_156021 ?auto_156016 ) ) ( not ( = ?auto_156021 ?auto_156020 ) ) ( not ( = ?auto_156021 ?auto_156015 ) ) ( not ( = ?auto_156021 ?auto_156014 ) ) ( not ( = ?auto_156016 ?auto_156020 ) ) ( not ( = ?auto_156016 ?auto_156015 ) ) ( not ( = ?auto_156016 ?auto_156014 ) ) ( not ( = ?auto_156013 ?auto_156018 ) ) ( not ( = ?auto_156013 ?auto_156017 ) ) ( not ( = ?auto_156013 ?auto_156021 ) ) ( not ( = ?auto_156013 ?auto_156016 ) ) ( ON ?auto_156013 ?auto_156019 ) ( not ( = ?auto_156013 ?auto_156019 ) ) ( not ( = ?auto_156014 ?auto_156019 ) ) ( not ( = ?auto_156015 ?auto_156019 ) ) ( not ( = ?auto_156020 ?auto_156019 ) ) ( not ( = ?auto_156018 ?auto_156019 ) ) ( not ( = ?auto_156017 ?auto_156019 ) ) ( not ( = ?auto_156021 ?auto_156019 ) ) ( not ( = ?auto_156016 ?auto_156019 ) ) ( ON ?auto_156014 ?auto_156013 ) ( ON-TABLE ?auto_156019 ) ( ON ?auto_156015 ?auto_156014 ) ( CLEAR ?auto_156015 ) ( HOLDING ?auto_156020 ) ( CLEAR ?auto_156016 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_156018 ?auto_156017 ?auto_156021 ?auto_156016 ?auto_156020 )
      ( MAKE-3PILE ?auto_156013 ?auto_156014 ?auto_156015 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156022 - BLOCK
      ?auto_156023 - BLOCK
      ?auto_156024 - BLOCK
    )
    :vars
    (
      ?auto_156027 - BLOCK
      ?auto_156029 - BLOCK
      ?auto_156026 - BLOCK
      ?auto_156025 - BLOCK
      ?auto_156030 - BLOCK
      ?auto_156028 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156022 ?auto_156023 ) ) ( not ( = ?auto_156022 ?auto_156024 ) ) ( not ( = ?auto_156023 ?auto_156024 ) ) ( not ( = ?auto_156022 ?auto_156027 ) ) ( not ( = ?auto_156023 ?auto_156027 ) ) ( not ( = ?auto_156024 ?auto_156027 ) ) ( ON-TABLE ?auto_156029 ) ( ON ?auto_156026 ?auto_156029 ) ( ON ?auto_156025 ?auto_156026 ) ( ON ?auto_156030 ?auto_156025 ) ( not ( = ?auto_156029 ?auto_156026 ) ) ( not ( = ?auto_156029 ?auto_156025 ) ) ( not ( = ?auto_156029 ?auto_156030 ) ) ( not ( = ?auto_156029 ?auto_156027 ) ) ( not ( = ?auto_156029 ?auto_156024 ) ) ( not ( = ?auto_156029 ?auto_156023 ) ) ( not ( = ?auto_156026 ?auto_156025 ) ) ( not ( = ?auto_156026 ?auto_156030 ) ) ( not ( = ?auto_156026 ?auto_156027 ) ) ( not ( = ?auto_156026 ?auto_156024 ) ) ( not ( = ?auto_156026 ?auto_156023 ) ) ( not ( = ?auto_156025 ?auto_156030 ) ) ( not ( = ?auto_156025 ?auto_156027 ) ) ( not ( = ?auto_156025 ?auto_156024 ) ) ( not ( = ?auto_156025 ?auto_156023 ) ) ( not ( = ?auto_156030 ?auto_156027 ) ) ( not ( = ?auto_156030 ?auto_156024 ) ) ( not ( = ?auto_156030 ?auto_156023 ) ) ( not ( = ?auto_156022 ?auto_156029 ) ) ( not ( = ?auto_156022 ?auto_156026 ) ) ( not ( = ?auto_156022 ?auto_156025 ) ) ( not ( = ?auto_156022 ?auto_156030 ) ) ( ON ?auto_156022 ?auto_156028 ) ( not ( = ?auto_156022 ?auto_156028 ) ) ( not ( = ?auto_156023 ?auto_156028 ) ) ( not ( = ?auto_156024 ?auto_156028 ) ) ( not ( = ?auto_156027 ?auto_156028 ) ) ( not ( = ?auto_156029 ?auto_156028 ) ) ( not ( = ?auto_156026 ?auto_156028 ) ) ( not ( = ?auto_156025 ?auto_156028 ) ) ( not ( = ?auto_156030 ?auto_156028 ) ) ( ON ?auto_156023 ?auto_156022 ) ( ON-TABLE ?auto_156028 ) ( ON ?auto_156024 ?auto_156023 ) ( CLEAR ?auto_156030 ) ( ON ?auto_156027 ?auto_156024 ) ( CLEAR ?auto_156027 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_156028 ?auto_156022 ?auto_156023 ?auto_156024 )
      ( MAKE-3PILE ?auto_156022 ?auto_156023 ?auto_156024 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156031 - BLOCK
      ?auto_156032 - BLOCK
      ?auto_156033 - BLOCK
    )
    :vars
    (
      ?auto_156039 - BLOCK
      ?auto_156036 - BLOCK
      ?auto_156034 - BLOCK
      ?auto_156035 - BLOCK
      ?auto_156037 - BLOCK
      ?auto_156038 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156031 ?auto_156032 ) ) ( not ( = ?auto_156031 ?auto_156033 ) ) ( not ( = ?auto_156032 ?auto_156033 ) ) ( not ( = ?auto_156031 ?auto_156039 ) ) ( not ( = ?auto_156032 ?auto_156039 ) ) ( not ( = ?auto_156033 ?auto_156039 ) ) ( ON-TABLE ?auto_156036 ) ( ON ?auto_156034 ?auto_156036 ) ( ON ?auto_156035 ?auto_156034 ) ( not ( = ?auto_156036 ?auto_156034 ) ) ( not ( = ?auto_156036 ?auto_156035 ) ) ( not ( = ?auto_156036 ?auto_156037 ) ) ( not ( = ?auto_156036 ?auto_156039 ) ) ( not ( = ?auto_156036 ?auto_156033 ) ) ( not ( = ?auto_156036 ?auto_156032 ) ) ( not ( = ?auto_156034 ?auto_156035 ) ) ( not ( = ?auto_156034 ?auto_156037 ) ) ( not ( = ?auto_156034 ?auto_156039 ) ) ( not ( = ?auto_156034 ?auto_156033 ) ) ( not ( = ?auto_156034 ?auto_156032 ) ) ( not ( = ?auto_156035 ?auto_156037 ) ) ( not ( = ?auto_156035 ?auto_156039 ) ) ( not ( = ?auto_156035 ?auto_156033 ) ) ( not ( = ?auto_156035 ?auto_156032 ) ) ( not ( = ?auto_156037 ?auto_156039 ) ) ( not ( = ?auto_156037 ?auto_156033 ) ) ( not ( = ?auto_156037 ?auto_156032 ) ) ( not ( = ?auto_156031 ?auto_156036 ) ) ( not ( = ?auto_156031 ?auto_156034 ) ) ( not ( = ?auto_156031 ?auto_156035 ) ) ( not ( = ?auto_156031 ?auto_156037 ) ) ( ON ?auto_156031 ?auto_156038 ) ( not ( = ?auto_156031 ?auto_156038 ) ) ( not ( = ?auto_156032 ?auto_156038 ) ) ( not ( = ?auto_156033 ?auto_156038 ) ) ( not ( = ?auto_156039 ?auto_156038 ) ) ( not ( = ?auto_156036 ?auto_156038 ) ) ( not ( = ?auto_156034 ?auto_156038 ) ) ( not ( = ?auto_156035 ?auto_156038 ) ) ( not ( = ?auto_156037 ?auto_156038 ) ) ( ON ?auto_156032 ?auto_156031 ) ( ON-TABLE ?auto_156038 ) ( ON ?auto_156033 ?auto_156032 ) ( ON ?auto_156039 ?auto_156033 ) ( CLEAR ?auto_156039 ) ( HOLDING ?auto_156037 ) ( CLEAR ?auto_156035 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_156036 ?auto_156034 ?auto_156035 ?auto_156037 )
      ( MAKE-3PILE ?auto_156031 ?auto_156032 ?auto_156033 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156040 - BLOCK
      ?auto_156041 - BLOCK
      ?auto_156042 - BLOCK
    )
    :vars
    (
      ?auto_156044 - BLOCK
      ?auto_156043 - BLOCK
      ?auto_156046 - BLOCK
      ?auto_156047 - BLOCK
      ?auto_156045 - BLOCK
      ?auto_156048 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156040 ?auto_156041 ) ) ( not ( = ?auto_156040 ?auto_156042 ) ) ( not ( = ?auto_156041 ?auto_156042 ) ) ( not ( = ?auto_156040 ?auto_156044 ) ) ( not ( = ?auto_156041 ?auto_156044 ) ) ( not ( = ?auto_156042 ?auto_156044 ) ) ( ON-TABLE ?auto_156043 ) ( ON ?auto_156046 ?auto_156043 ) ( ON ?auto_156047 ?auto_156046 ) ( not ( = ?auto_156043 ?auto_156046 ) ) ( not ( = ?auto_156043 ?auto_156047 ) ) ( not ( = ?auto_156043 ?auto_156045 ) ) ( not ( = ?auto_156043 ?auto_156044 ) ) ( not ( = ?auto_156043 ?auto_156042 ) ) ( not ( = ?auto_156043 ?auto_156041 ) ) ( not ( = ?auto_156046 ?auto_156047 ) ) ( not ( = ?auto_156046 ?auto_156045 ) ) ( not ( = ?auto_156046 ?auto_156044 ) ) ( not ( = ?auto_156046 ?auto_156042 ) ) ( not ( = ?auto_156046 ?auto_156041 ) ) ( not ( = ?auto_156047 ?auto_156045 ) ) ( not ( = ?auto_156047 ?auto_156044 ) ) ( not ( = ?auto_156047 ?auto_156042 ) ) ( not ( = ?auto_156047 ?auto_156041 ) ) ( not ( = ?auto_156045 ?auto_156044 ) ) ( not ( = ?auto_156045 ?auto_156042 ) ) ( not ( = ?auto_156045 ?auto_156041 ) ) ( not ( = ?auto_156040 ?auto_156043 ) ) ( not ( = ?auto_156040 ?auto_156046 ) ) ( not ( = ?auto_156040 ?auto_156047 ) ) ( not ( = ?auto_156040 ?auto_156045 ) ) ( ON ?auto_156040 ?auto_156048 ) ( not ( = ?auto_156040 ?auto_156048 ) ) ( not ( = ?auto_156041 ?auto_156048 ) ) ( not ( = ?auto_156042 ?auto_156048 ) ) ( not ( = ?auto_156044 ?auto_156048 ) ) ( not ( = ?auto_156043 ?auto_156048 ) ) ( not ( = ?auto_156046 ?auto_156048 ) ) ( not ( = ?auto_156047 ?auto_156048 ) ) ( not ( = ?auto_156045 ?auto_156048 ) ) ( ON ?auto_156041 ?auto_156040 ) ( ON-TABLE ?auto_156048 ) ( ON ?auto_156042 ?auto_156041 ) ( ON ?auto_156044 ?auto_156042 ) ( CLEAR ?auto_156047 ) ( ON ?auto_156045 ?auto_156044 ) ( CLEAR ?auto_156045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_156048 ?auto_156040 ?auto_156041 ?auto_156042 ?auto_156044 )
      ( MAKE-3PILE ?auto_156040 ?auto_156041 ?auto_156042 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156049 - BLOCK
      ?auto_156050 - BLOCK
      ?auto_156051 - BLOCK
    )
    :vars
    (
      ?auto_156057 - BLOCK
      ?auto_156053 - BLOCK
      ?auto_156055 - BLOCK
      ?auto_156056 - BLOCK
      ?auto_156052 - BLOCK
      ?auto_156054 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156049 ?auto_156050 ) ) ( not ( = ?auto_156049 ?auto_156051 ) ) ( not ( = ?auto_156050 ?auto_156051 ) ) ( not ( = ?auto_156049 ?auto_156057 ) ) ( not ( = ?auto_156050 ?auto_156057 ) ) ( not ( = ?auto_156051 ?auto_156057 ) ) ( ON-TABLE ?auto_156053 ) ( ON ?auto_156055 ?auto_156053 ) ( not ( = ?auto_156053 ?auto_156055 ) ) ( not ( = ?auto_156053 ?auto_156056 ) ) ( not ( = ?auto_156053 ?auto_156052 ) ) ( not ( = ?auto_156053 ?auto_156057 ) ) ( not ( = ?auto_156053 ?auto_156051 ) ) ( not ( = ?auto_156053 ?auto_156050 ) ) ( not ( = ?auto_156055 ?auto_156056 ) ) ( not ( = ?auto_156055 ?auto_156052 ) ) ( not ( = ?auto_156055 ?auto_156057 ) ) ( not ( = ?auto_156055 ?auto_156051 ) ) ( not ( = ?auto_156055 ?auto_156050 ) ) ( not ( = ?auto_156056 ?auto_156052 ) ) ( not ( = ?auto_156056 ?auto_156057 ) ) ( not ( = ?auto_156056 ?auto_156051 ) ) ( not ( = ?auto_156056 ?auto_156050 ) ) ( not ( = ?auto_156052 ?auto_156057 ) ) ( not ( = ?auto_156052 ?auto_156051 ) ) ( not ( = ?auto_156052 ?auto_156050 ) ) ( not ( = ?auto_156049 ?auto_156053 ) ) ( not ( = ?auto_156049 ?auto_156055 ) ) ( not ( = ?auto_156049 ?auto_156056 ) ) ( not ( = ?auto_156049 ?auto_156052 ) ) ( ON ?auto_156049 ?auto_156054 ) ( not ( = ?auto_156049 ?auto_156054 ) ) ( not ( = ?auto_156050 ?auto_156054 ) ) ( not ( = ?auto_156051 ?auto_156054 ) ) ( not ( = ?auto_156057 ?auto_156054 ) ) ( not ( = ?auto_156053 ?auto_156054 ) ) ( not ( = ?auto_156055 ?auto_156054 ) ) ( not ( = ?auto_156056 ?auto_156054 ) ) ( not ( = ?auto_156052 ?auto_156054 ) ) ( ON ?auto_156050 ?auto_156049 ) ( ON-TABLE ?auto_156054 ) ( ON ?auto_156051 ?auto_156050 ) ( ON ?auto_156057 ?auto_156051 ) ( ON ?auto_156052 ?auto_156057 ) ( CLEAR ?auto_156052 ) ( HOLDING ?auto_156056 ) ( CLEAR ?auto_156055 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_156053 ?auto_156055 ?auto_156056 )
      ( MAKE-3PILE ?auto_156049 ?auto_156050 ?auto_156051 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156058 - BLOCK
      ?auto_156059 - BLOCK
      ?auto_156060 - BLOCK
    )
    :vars
    (
      ?auto_156065 - BLOCK
      ?auto_156061 - BLOCK
      ?auto_156062 - BLOCK
      ?auto_156064 - BLOCK
      ?auto_156063 - BLOCK
      ?auto_156066 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156058 ?auto_156059 ) ) ( not ( = ?auto_156058 ?auto_156060 ) ) ( not ( = ?auto_156059 ?auto_156060 ) ) ( not ( = ?auto_156058 ?auto_156065 ) ) ( not ( = ?auto_156059 ?auto_156065 ) ) ( not ( = ?auto_156060 ?auto_156065 ) ) ( ON-TABLE ?auto_156061 ) ( ON ?auto_156062 ?auto_156061 ) ( not ( = ?auto_156061 ?auto_156062 ) ) ( not ( = ?auto_156061 ?auto_156064 ) ) ( not ( = ?auto_156061 ?auto_156063 ) ) ( not ( = ?auto_156061 ?auto_156065 ) ) ( not ( = ?auto_156061 ?auto_156060 ) ) ( not ( = ?auto_156061 ?auto_156059 ) ) ( not ( = ?auto_156062 ?auto_156064 ) ) ( not ( = ?auto_156062 ?auto_156063 ) ) ( not ( = ?auto_156062 ?auto_156065 ) ) ( not ( = ?auto_156062 ?auto_156060 ) ) ( not ( = ?auto_156062 ?auto_156059 ) ) ( not ( = ?auto_156064 ?auto_156063 ) ) ( not ( = ?auto_156064 ?auto_156065 ) ) ( not ( = ?auto_156064 ?auto_156060 ) ) ( not ( = ?auto_156064 ?auto_156059 ) ) ( not ( = ?auto_156063 ?auto_156065 ) ) ( not ( = ?auto_156063 ?auto_156060 ) ) ( not ( = ?auto_156063 ?auto_156059 ) ) ( not ( = ?auto_156058 ?auto_156061 ) ) ( not ( = ?auto_156058 ?auto_156062 ) ) ( not ( = ?auto_156058 ?auto_156064 ) ) ( not ( = ?auto_156058 ?auto_156063 ) ) ( ON ?auto_156058 ?auto_156066 ) ( not ( = ?auto_156058 ?auto_156066 ) ) ( not ( = ?auto_156059 ?auto_156066 ) ) ( not ( = ?auto_156060 ?auto_156066 ) ) ( not ( = ?auto_156065 ?auto_156066 ) ) ( not ( = ?auto_156061 ?auto_156066 ) ) ( not ( = ?auto_156062 ?auto_156066 ) ) ( not ( = ?auto_156064 ?auto_156066 ) ) ( not ( = ?auto_156063 ?auto_156066 ) ) ( ON ?auto_156059 ?auto_156058 ) ( ON-TABLE ?auto_156066 ) ( ON ?auto_156060 ?auto_156059 ) ( ON ?auto_156065 ?auto_156060 ) ( ON ?auto_156063 ?auto_156065 ) ( CLEAR ?auto_156062 ) ( ON ?auto_156064 ?auto_156063 ) ( CLEAR ?auto_156064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_156066 ?auto_156058 ?auto_156059 ?auto_156060 ?auto_156065 ?auto_156063 )
      ( MAKE-3PILE ?auto_156058 ?auto_156059 ?auto_156060 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156067 - BLOCK
      ?auto_156068 - BLOCK
      ?auto_156069 - BLOCK
    )
    :vars
    (
      ?auto_156074 - BLOCK
      ?auto_156071 - BLOCK
      ?auto_156072 - BLOCK
      ?auto_156073 - BLOCK
      ?auto_156070 - BLOCK
      ?auto_156075 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156067 ?auto_156068 ) ) ( not ( = ?auto_156067 ?auto_156069 ) ) ( not ( = ?auto_156068 ?auto_156069 ) ) ( not ( = ?auto_156067 ?auto_156074 ) ) ( not ( = ?auto_156068 ?auto_156074 ) ) ( not ( = ?auto_156069 ?auto_156074 ) ) ( ON-TABLE ?auto_156071 ) ( not ( = ?auto_156071 ?auto_156072 ) ) ( not ( = ?auto_156071 ?auto_156073 ) ) ( not ( = ?auto_156071 ?auto_156070 ) ) ( not ( = ?auto_156071 ?auto_156074 ) ) ( not ( = ?auto_156071 ?auto_156069 ) ) ( not ( = ?auto_156071 ?auto_156068 ) ) ( not ( = ?auto_156072 ?auto_156073 ) ) ( not ( = ?auto_156072 ?auto_156070 ) ) ( not ( = ?auto_156072 ?auto_156074 ) ) ( not ( = ?auto_156072 ?auto_156069 ) ) ( not ( = ?auto_156072 ?auto_156068 ) ) ( not ( = ?auto_156073 ?auto_156070 ) ) ( not ( = ?auto_156073 ?auto_156074 ) ) ( not ( = ?auto_156073 ?auto_156069 ) ) ( not ( = ?auto_156073 ?auto_156068 ) ) ( not ( = ?auto_156070 ?auto_156074 ) ) ( not ( = ?auto_156070 ?auto_156069 ) ) ( not ( = ?auto_156070 ?auto_156068 ) ) ( not ( = ?auto_156067 ?auto_156071 ) ) ( not ( = ?auto_156067 ?auto_156072 ) ) ( not ( = ?auto_156067 ?auto_156073 ) ) ( not ( = ?auto_156067 ?auto_156070 ) ) ( ON ?auto_156067 ?auto_156075 ) ( not ( = ?auto_156067 ?auto_156075 ) ) ( not ( = ?auto_156068 ?auto_156075 ) ) ( not ( = ?auto_156069 ?auto_156075 ) ) ( not ( = ?auto_156074 ?auto_156075 ) ) ( not ( = ?auto_156071 ?auto_156075 ) ) ( not ( = ?auto_156072 ?auto_156075 ) ) ( not ( = ?auto_156073 ?auto_156075 ) ) ( not ( = ?auto_156070 ?auto_156075 ) ) ( ON ?auto_156068 ?auto_156067 ) ( ON-TABLE ?auto_156075 ) ( ON ?auto_156069 ?auto_156068 ) ( ON ?auto_156074 ?auto_156069 ) ( ON ?auto_156070 ?auto_156074 ) ( ON ?auto_156073 ?auto_156070 ) ( CLEAR ?auto_156073 ) ( HOLDING ?auto_156072 ) ( CLEAR ?auto_156071 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_156071 ?auto_156072 )
      ( MAKE-3PILE ?auto_156067 ?auto_156068 ?auto_156069 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156076 - BLOCK
      ?auto_156077 - BLOCK
      ?auto_156078 - BLOCK
    )
    :vars
    (
      ?auto_156079 - BLOCK
      ?auto_156083 - BLOCK
      ?auto_156080 - BLOCK
      ?auto_156082 - BLOCK
      ?auto_156081 - BLOCK
      ?auto_156084 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156076 ?auto_156077 ) ) ( not ( = ?auto_156076 ?auto_156078 ) ) ( not ( = ?auto_156077 ?auto_156078 ) ) ( not ( = ?auto_156076 ?auto_156079 ) ) ( not ( = ?auto_156077 ?auto_156079 ) ) ( not ( = ?auto_156078 ?auto_156079 ) ) ( ON-TABLE ?auto_156083 ) ( not ( = ?auto_156083 ?auto_156080 ) ) ( not ( = ?auto_156083 ?auto_156082 ) ) ( not ( = ?auto_156083 ?auto_156081 ) ) ( not ( = ?auto_156083 ?auto_156079 ) ) ( not ( = ?auto_156083 ?auto_156078 ) ) ( not ( = ?auto_156083 ?auto_156077 ) ) ( not ( = ?auto_156080 ?auto_156082 ) ) ( not ( = ?auto_156080 ?auto_156081 ) ) ( not ( = ?auto_156080 ?auto_156079 ) ) ( not ( = ?auto_156080 ?auto_156078 ) ) ( not ( = ?auto_156080 ?auto_156077 ) ) ( not ( = ?auto_156082 ?auto_156081 ) ) ( not ( = ?auto_156082 ?auto_156079 ) ) ( not ( = ?auto_156082 ?auto_156078 ) ) ( not ( = ?auto_156082 ?auto_156077 ) ) ( not ( = ?auto_156081 ?auto_156079 ) ) ( not ( = ?auto_156081 ?auto_156078 ) ) ( not ( = ?auto_156081 ?auto_156077 ) ) ( not ( = ?auto_156076 ?auto_156083 ) ) ( not ( = ?auto_156076 ?auto_156080 ) ) ( not ( = ?auto_156076 ?auto_156082 ) ) ( not ( = ?auto_156076 ?auto_156081 ) ) ( ON ?auto_156076 ?auto_156084 ) ( not ( = ?auto_156076 ?auto_156084 ) ) ( not ( = ?auto_156077 ?auto_156084 ) ) ( not ( = ?auto_156078 ?auto_156084 ) ) ( not ( = ?auto_156079 ?auto_156084 ) ) ( not ( = ?auto_156083 ?auto_156084 ) ) ( not ( = ?auto_156080 ?auto_156084 ) ) ( not ( = ?auto_156082 ?auto_156084 ) ) ( not ( = ?auto_156081 ?auto_156084 ) ) ( ON ?auto_156077 ?auto_156076 ) ( ON-TABLE ?auto_156084 ) ( ON ?auto_156078 ?auto_156077 ) ( ON ?auto_156079 ?auto_156078 ) ( ON ?auto_156081 ?auto_156079 ) ( ON ?auto_156082 ?auto_156081 ) ( CLEAR ?auto_156083 ) ( ON ?auto_156080 ?auto_156082 ) ( CLEAR ?auto_156080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_156084 ?auto_156076 ?auto_156077 ?auto_156078 ?auto_156079 ?auto_156081 ?auto_156082 )
      ( MAKE-3PILE ?auto_156076 ?auto_156077 ?auto_156078 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156085 - BLOCK
      ?auto_156086 - BLOCK
      ?auto_156087 - BLOCK
    )
    :vars
    (
      ?auto_156091 - BLOCK
      ?auto_156092 - BLOCK
      ?auto_156088 - BLOCK
      ?auto_156093 - BLOCK
      ?auto_156090 - BLOCK
      ?auto_156089 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156085 ?auto_156086 ) ) ( not ( = ?auto_156085 ?auto_156087 ) ) ( not ( = ?auto_156086 ?auto_156087 ) ) ( not ( = ?auto_156085 ?auto_156091 ) ) ( not ( = ?auto_156086 ?auto_156091 ) ) ( not ( = ?auto_156087 ?auto_156091 ) ) ( not ( = ?auto_156092 ?auto_156088 ) ) ( not ( = ?auto_156092 ?auto_156093 ) ) ( not ( = ?auto_156092 ?auto_156090 ) ) ( not ( = ?auto_156092 ?auto_156091 ) ) ( not ( = ?auto_156092 ?auto_156087 ) ) ( not ( = ?auto_156092 ?auto_156086 ) ) ( not ( = ?auto_156088 ?auto_156093 ) ) ( not ( = ?auto_156088 ?auto_156090 ) ) ( not ( = ?auto_156088 ?auto_156091 ) ) ( not ( = ?auto_156088 ?auto_156087 ) ) ( not ( = ?auto_156088 ?auto_156086 ) ) ( not ( = ?auto_156093 ?auto_156090 ) ) ( not ( = ?auto_156093 ?auto_156091 ) ) ( not ( = ?auto_156093 ?auto_156087 ) ) ( not ( = ?auto_156093 ?auto_156086 ) ) ( not ( = ?auto_156090 ?auto_156091 ) ) ( not ( = ?auto_156090 ?auto_156087 ) ) ( not ( = ?auto_156090 ?auto_156086 ) ) ( not ( = ?auto_156085 ?auto_156092 ) ) ( not ( = ?auto_156085 ?auto_156088 ) ) ( not ( = ?auto_156085 ?auto_156093 ) ) ( not ( = ?auto_156085 ?auto_156090 ) ) ( ON ?auto_156085 ?auto_156089 ) ( not ( = ?auto_156085 ?auto_156089 ) ) ( not ( = ?auto_156086 ?auto_156089 ) ) ( not ( = ?auto_156087 ?auto_156089 ) ) ( not ( = ?auto_156091 ?auto_156089 ) ) ( not ( = ?auto_156092 ?auto_156089 ) ) ( not ( = ?auto_156088 ?auto_156089 ) ) ( not ( = ?auto_156093 ?auto_156089 ) ) ( not ( = ?auto_156090 ?auto_156089 ) ) ( ON ?auto_156086 ?auto_156085 ) ( ON-TABLE ?auto_156089 ) ( ON ?auto_156087 ?auto_156086 ) ( ON ?auto_156091 ?auto_156087 ) ( ON ?auto_156090 ?auto_156091 ) ( ON ?auto_156093 ?auto_156090 ) ( ON ?auto_156088 ?auto_156093 ) ( CLEAR ?auto_156088 ) ( HOLDING ?auto_156092 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_156092 )
      ( MAKE-3PILE ?auto_156085 ?auto_156086 ?auto_156087 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156094 - BLOCK
      ?auto_156095 - BLOCK
      ?auto_156096 - BLOCK
    )
    :vars
    (
      ?auto_156101 - BLOCK
      ?auto_156097 - BLOCK
      ?auto_156098 - BLOCK
      ?auto_156099 - BLOCK
      ?auto_156100 - BLOCK
      ?auto_156102 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156094 ?auto_156095 ) ) ( not ( = ?auto_156094 ?auto_156096 ) ) ( not ( = ?auto_156095 ?auto_156096 ) ) ( not ( = ?auto_156094 ?auto_156101 ) ) ( not ( = ?auto_156095 ?auto_156101 ) ) ( not ( = ?auto_156096 ?auto_156101 ) ) ( not ( = ?auto_156097 ?auto_156098 ) ) ( not ( = ?auto_156097 ?auto_156099 ) ) ( not ( = ?auto_156097 ?auto_156100 ) ) ( not ( = ?auto_156097 ?auto_156101 ) ) ( not ( = ?auto_156097 ?auto_156096 ) ) ( not ( = ?auto_156097 ?auto_156095 ) ) ( not ( = ?auto_156098 ?auto_156099 ) ) ( not ( = ?auto_156098 ?auto_156100 ) ) ( not ( = ?auto_156098 ?auto_156101 ) ) ( not ( = ?auto_156098 ?auto_156096 ) ) ( not ( = ?auto_156098 ?auto_156095 ) ) ( not ( = ?auto_156099 ?auto_156100 ) ) ( not ( = ?auto_156099 ?auto_156101 ) ) ( not ( = ?auto_156099 ?auto_156096 ) ) ( not ( = ?auto_156099 ?auto_156095 ) ) ( not ( = ?auto_156100 ?auto_156101 ) ) ( not ( = ?auto_156100 ?auto_156096 ) ) ( not ( = ?auto_156100 ?auto_156095 ) ) ( not ( = ?auto_156094 ?auto_156097 ) ) ( not ( = ?auto_156094 ?auto_156098 ) ) ( not ( = ?auto_156094 ?auto_156099 ) ) ( not ( = ?auto_156094 ?auto_156100 ) ) ( ON ?auto_156094 ?auto_156102 ) ( not ( = ?auto_156094 ?auto_156102 ) ) ( not ( = ?auto_156095 ?auto_156102 ) ) ( not ( = ?auto_156096 ?auto_156102 ) ) ( not ( = ?auto_156101 ?auto_156102 ) ) ( not ( = ?auto_156097 ?auto_156102 ) ) ( not ( = ?auto_156098 ?auto_156102 ) ) ( not ( = ?auto_156099 ?auto_156102 ) ) ( not ( = ?auto_156100 ?auto_156102 ) ) ( ON ?auto_156095 ?auto_156094 ) ( ON-TABLE ?auto_156102 ) ( ON ?auto_156096 ?auto_156095 ) ( ON ?auto_156101 ?auto_156096 ) ( ON ?auto_156100 ?auto_156101 ) ( ON ?auto_156099 ?auto_156100 ) ( ON ?auto_156098 ?auto_156099 ) ( ON ?auto_156097 ?auto_156098 ) ( CLEAR ?auto_156097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_156102 ?auto_156094 ?auto_156095 ?auto_156096 ?auto_156101 ?auto_156100 ?auto_156099 ?auto_156098 )
      ( MAKE-3PILE ?auto_156094 ?auto_156095 ?auto_156096 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156107 - BLOCK
      ?auto_156108 - BLOCK
      ?auto_156109 - BLOCK
      ?auto_156110 - BLOCK
    )
    :vars
    (
      ?auto_156111 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156111 ?auto_156110 ) ( CLEAR ?auto_156111 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_156107 ) ( ON ?auto_156108 ?auto_156107 ) ( ON ?auto_156109 ?auto_156108 ) ( ON ?auto_156110 ?auto_156109 ) ( not ( = ?auto_156107 ?auto_156108 ) ) ( not ( = ?auto_156107 ?auto_156109 ) ) ( not ( = ?auto_156107 ?auto_156110 ) ) ( not ( = ?auto_156107 ?auto_156111 ) ) ( not ( = ?auto_156108 ?auto_156109 ) ) ( not ( = ?auto_156108 ?auto_156110 ) ) ( not ( = ?auto_156108 ?auto_156111 ) ) ( not ( = ?auto_156109 ?auto_156110 ) ) ( not ( = ?auto_156109 ?auto_156111 ) ) ( not ( = ?auto_156110 ?auto_156111 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_156111 ?auto_156110 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156112 - BLOCK
      ?auto_156113 - BLOCK
      ?auto_156114 - BLOCK
      ?auto_156115 - BLOCK
    )
    :vars
    (
      ?auto_156116 - BLOCK
      ?auto_156117 - BLOCK
      ?auto_156118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156116 ?auto_156115 ) ( CLEAR ?auto_156116 ) ( ON-TABLE ?auto_156112 ) ( ON ?auto_156113 ?auto_156112 ) ( ON ?auto_156114 ?auto_156113 ) ( ON ?auto_156115 ?auto_156114 ) ( not ( = ?auto_156112 ?auto_156113 ) ) ( not ( = ?auto_156112 ?auto_156114 ) ) ( not ( = ?auto_156112 ?auto_156115 ) ) ( not ( = ?auto_156112 ?auto_156116 ) ) ( not ( = ?auto_156113 ?auto_156114 ) ) ( not ( = ?auto_156113 ?auto_156115 ) ) ( not ( = ?auto_156113 ?auto_156116 ) ) ( not ( = ?auto_156114 ?auto_156115 ) ) ( not ( = ?auto_156114 ?auto_156116 ) ) ( not ( = ?auto_156115 ?auto_156116 ) ) ( HOLDING ?auto_156117 ) ( CLEAR ?auto_156118 ) ( not ( = ?auto_156112 ?auto_156117 ) ) ( not ( = ?auto_156112 ?auto_156118 ) ) ( not ( = ?auto_156113 ?auto_156117 ) ) ( not ( = ?auto_156113 ?auto_156118 ) ) ( not ( = ?auto_156114 ?auto_156117 ) ) ( not ( = ?auto_156114 ?auto_156118 ) ) ( not ( = ?auto_156115 ?auto_156117 ) ) ( not ( = ?auto_156115 ?auto_156118 ) ) ( not ( = ?auto_156116 ?auto_156117 ) ) ( not ( = ?auto_156116 ?auto_156118 ) ) ( not ( = ?auto_156117 ?auto_156118 ) ) )
    :subtasks
    ( ( !STACK ?auto_156117 ?auto_156118 )
      ( MAKE-4PILE ?auto_156112 ?auto_156113 ?auto_156114 ?auto_156115 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156119 - BLOCK
      ?auto_156120 - BLOCK
      ?auto_156121 - BLOCK
      ?auto_156122 - BLOCK
    )
    :vars
    (
      ?auto_156123 - BLOCK
      ?auto_156124 - BLOCK
      ?auto_156125 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156123 ?auto_156122 ) ( ON-TABLE ?auto_156119 ) ( ON ?auto_156120 ?auto_156119 ) ( ON ?auto_156121 ?auto_156120 ) ( ON ?auto_156122 ?auto_156121 ) ( not ( = ?auto_156119 ?auto_156120 ) ) ( not ( = ?auto_156119 ?auto_156121 ) ) ( not ( = ?auto_156119 ?auto_156122 ) ) ( not ( = ?auto_156119 ?auto_156123 ) ) ( not ( = ?auto_156120 ?auto_156121 ) ) ( not ( = ?auto_156120 ?auto_156122 ) ) ( not ( = ?auto_156120 ?auto_156123 ) ) ( not ( = ?auto_156121 ?auto_156122 ) ) ( not ( = ?auto_156121 ?auto_156123 ) ) ( not ( = ?auto_156122 ?auto_156123 ) ) ( CLEAR ?auto_156124 ) ( not ( = ?auto_156119 ?auto_156125 ) ) ( not ( = ?auto_156119 ?auto_156124 ) ) ( not ( = ?auto_156120 ?auto_156125 ) ) ( not ( = ?auto_156120 ?auto_156124 ) ) ( not ( = ?auto_156121 ?auto_156125 ) ) ( not ( = ?auto_156121 ?auto_156124 ) ) ( not ( = ?auto_156122 ?auto_156125 ) ) ( not ( = ?auto_156122 ?auto_156124 ) ) ( not ( = ?auto_156123 ?auto_156125 ) ) ( not ( = ?auto_156123 ?auto_156124 ) ) ( not ( = ?auto_156125 ?auto_156124 ) ) ( ON ?auto_156125 ?auto_156123 ) ( CLEAR ?auto_156125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_156119 ?auto_156120 ?auto_156121 ?auto_156122 ?auto_156123 )
      ( MAKE-4PILE ?auto_156119 ?auto_156120 ?auto_156121 ?auto_156122 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156126 - BLOCK
      ?auto_156127 - BLOCK
      ?auto_156128 - BLOCK
      ?auto_156129 - BLOCK
    )
    :vars
    (
      ?auto_156131 - BLOCK
      ?auto_156132 - BLOCK
      ?auto_156130 - BLOCK
      ?auto_156133 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156131 ?auto_156129 ) ( ON-TABLE ?auto_156126 ) ( ON ?auto_156127 ?auto_156126 ) ( ON ?auto_156128 ?auto_156127 ) ( ON ?auto_156129 ?auto_156128 ) ( not ( = ?auto_156126 ?auto_156127 ) ) ( not ( = ?auto_156126 ?auto_156128 ) ) ( not ( = ?auto_156126 ?auto_156129 ) ) ( not ( = ?auto_156126 ?auto_156131 ) ) ( not ( = ?auto_156127 ?auto_156128 ) ) ( not ( = ?auto_156127 ?auto_156129 ) ) ( not ( = ?auto_156127 ?auto_156131 ) ) ( not ( = ?auto_156128 ?auto_156129 ) ) ( not ( = ?auto_156128 ?auto_156131 ) ) ( not ( = ?auto_156129 ?auto_156131 ) ) ( not ( = ?auto_156126 ?auto_156132 ) ) ( not ( = ?auto_156126 ?auto_156130 ) ) ( not ( = ?auto_156127 ?auto_156132 ) ) ( not ( = ?auto_156127 ?auto_156130 ) ) ( not ( = ?auto_156128 ?auto_156132 ) ) ( not ( = ?auto_156128 ?auto_156130 ) ) ( not ( = ?auto_156129 ?auto_156132 ) ) ( not ( = ?auto_156129 ?auto_156130 ) ) ( not ( = ?auto_156131 ?auto_156132 ) ) ( not ( = ?auto_156131 ?auto_156130 ) ) ( not ( = ?auto_156132 ?auto_156130 ) ) ( ON ?auto_156132 ?auto_156131 ) ( CLEAR ?auto_156132 ) ( HOLDING ?auto_156130 ) ( CLEAR ?auto_156133 ) ( ON-TABLE ?auto_156133 ) ( not ( = ?auto_156133 ?auto_156130 ) ) ( not ( = ?auto_156126 ?auto_156133 ) ) ( not ( = ?auto_156127 ?auto_156133 ) ) ( not ( = ?auto_156128 ?auto_156133 ) ) ( not ( = ?auto_156129 ?auto_156133 ) ) ( not ( = ?auto_156131 ?auto_156133 ) ) ( not ( = ?auto_156132 ?auto_156133 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_156133 ?auto_156130 )
      ( MAKE-4PILE ?auto_156126 ?auto_156127 ?auto_156128 ?auto_156129 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156134 - BLOCK
      ?auto_156135 - BLOCK
      ?auto_156136 - BLOCK
      ?auto_156137 - BLOCK
    )
    :vars
    (
      ?auto_156141 - BLOCK
      ?auto_156139 - BLOCK
      ?auto_156140 - BLOCK
      ?auto_156138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156141 ?auto_156137 ) ( ON-TABLE ?auto_156134 ) ( ON ?auto_156135 ?auto_156134 ) ( ON ?auto_156136 ?auto_156135 ) ( ON ?auto_156137 ?auto_156136 ) ( not ( = ?auto_156134 ?auto_156135 ) ) ( not ( = ?auto_156134 ?auto_156136 ) ) ( not ( = ?auto_156134 ?auto_156137 ) ) ( not ( = ?auto_156134 ?auto_156141 ) ) ( not ( = ?auto_156135 ?auto_156136 ) ) ( not ( = ?auto_156135 ?auto_156137 ) ) ( not ( = ?auto_156135 ?auto_156141 ) ) ( not ( = ?auto_156136 ?auto_156137 ) ) ( not ( = ?auto_156136 ?auto_156141 ) ) ( not ( = ?auto_156137 ?auto_156141 ) ) ( not ( = ?auto_156134 ?auto_156139 ) ) ( not ( = ?auto_156134 ?auto_156140 ) ) ( not ( = ?auto_156135 ?auto_156139 ) ) ( not ( = ?auto_156135 ?auto_156140 ) ) ( not ( = ?auto_156136 ?auto_156139 ) ) ( not ( = ?auto_156136 ?auto_156140 ) ) ( not ( = ?auto_156137 ?auto_156139 ) ) ( not ( = ?auto_156137 ?auto_156140 ) ) ( not ( = ?auto_156141 ?auto_156139 ) ) ( not ( = ?auto_156141 ?auto_156140 ) ) ( not ( = ?auto_156139 ?auto_156140 ) ) ( ON ?auto_156139 ?auto_156141 ) ( CLEAR ?auto_156138 ) ( ON-TABLE ?auto_156138 ) ( not ( = ?auto_156138 ?auto_156140 ) ) ( not ( = ?auto_156134 ?auto_156138 ) ) ( not ( = ?auto_156135 ?auto_156138 ) ) ( not ( = ?auto_156136 ?auto_156138 ) ) ( not ( = ?auto_156137 ?auto_156138 ) ) ( not ( = ?auto_156141 ?auto_156138 ) ) ( not ( = ?auto_156139 ?auto_156138 ) ) ( ON ?auto_156140 ?auto_156139 ) ( CLEAR ?auto_156140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_156134 ?auto_156135 ?auto_156136 ?auto_156137 ?auto_156141 ?auto_156139 )
      ( MAKE-4PILE ?auto_156134 ?auto_156135 ?auto_156136 ?auto_156137 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156142 - BLOCK
      ?auto_156143 - BLOCK
      ?auto_156144 - BLOCK
      ?auto_156145 - BLOCK
    )
    :vars
    (
      ?auto_156146 - BLOCK
      ?auto_156149 - BLOCK
      ?auto_156148 - BLOCK
      ?auto_156147 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156146 ?auto_156145 ) ( ON-TABLE ?auto_156142 ) ( ON ?auto_156143 ?auto_156142 ) ( ON ?auto_156144 ?auto_156143 ) ( ON ?auto_156145 ?auto_156144 ) ( not ( = ?auto_156142 ?auto_156143 ) ) ( not ( = ?auto_156142 ?auto_156144 ) ) ( not ( = ?auto_156142 ?auto_156145 ) ) ( not ( = ?auto_156142 ?auto_156146 ) ) ( not ( = ?auto_156143 ?auto_156144 ) ) ( not ( = ?auto_156143 ?auto_156145 ) ) ( not ( = ?auto_156143 ?auto_156146 ) ) ( not ( = ?auto_156144 ?auto_156145 ) ) ( not ( = ?auto_156144 ?auto_156146 ) ) ( not ( = ?auto_156145 ?auto_156146 ) ) ( not ( = ?auto_156142 ?auto_156149 ) ) ( not ( = ?auto_156142 ?auto_156148 ) ) ( not ( = ?auto_156143 ?auto_156149 ) ) ( not ( = ?auto_156143 ?auto_156148 ) ) ( not ( = ?auto_156144 ?auto_156149 ) ) ( not ( = ?auto_156144 ?auto_156148 ) ) ( not ( = ?auto_156145 ?auto_156149 ) ) ( not ( = ?auto_156145 ?auto_156148 ) ) ( not ( = ?auto_156146 ?auto_156149 ) ) ( not ( = ?auto_156146 ?auto_156148 ) ) ( not ( = ?auto_156149 ?auto_156148 ) ) ( ON ?auto_156149 ?auto_156146 ) ( not ( = ?auto_156147 ?auto_156148 ) ) ( not ( = ?auto_156142 ?auto_156147 ) ) ( not ( = ?auto_156143 ?auto_156147 ) ) ( not ( = ?auto_156144 ?auto_156147 ) ) ( not ( = ?auto_156145 ?auto_156147 ) ) ( not ( = ?auto_156146 ?auto_156147 ) ) ( not ( = ?auto_156149 ?auto_156147 ) ) ( ON ?auto_156148 ?auto_156149 ) ( CLEAR ?auto_156148 ) ( HOLDING ?auto_156147 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_156147 )
      ( MAKE-4PILE ?auto_156142 ?auto_156143 ?auto_156144 ?auto_156145 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156150 - BLOCK
      ?auto_156151 - BLOCK
      ?auto_156152 - BLOCK
      ?auto_156153 - BLOCK
    )
    :vars
    (
      ?auto_156154 - BLOCK
      ?auto_156156 - BLOCK
      ?auto_156155 - BLOCK
      ?auto_156157 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156154 ?auto_156153 ) ( ON-TABLE ?auto_156150 ) ( ON ?auto_156151 ?auto_156150 ) ( ON ?auto_156152 ?auto_156151 ) ( ON ?auto_156153 ?auto_156152 ) ( not ( = ?auto_156150 ?auto_156151 ) ) ( not ( = ?auto_156150 ?auto_156152 ) ) ( not ( = ?auto_156150 ?auto_156153 ) ) ( not ( = ?auto_156150 ?auto_156154 ) ) ( not ( = ?auto_156151 ?auto_156152 ) ) ( not ( = ?auto_156151 ?auto_156153 ) ) ( not ( = ?auto_156151 ?auto_156154 ) ) ( not ( = ?auto_156152 ?auto_156153 ) ) ( not ( = ?auto_156152 ?auto_156154 ) ) ( not ( = ?auto_156153 ?auto_156154 ) ) ( not ( = ?auto_156150 ?auto_156156 ) ) ( not ( = ?auto_156150 ?auto_156155 ) ) ( not ( = ?auto_156151 ?auto_156156 ) ) ( not ( = ?auto_156151 ?auto_156155 ) ) ( not ( = ?auto_156152 ?auto_156156 ) ) ( not ( = ?auto_156152 ?auto_156155 ) ) ( not ( = ?auto_156153 ?auto_156156 ) ) ( not ( = ?auto_156153 ?auto_156155 ) ) ( not ( = ?auto_156154 ?auto_156156 ) ) ( not ( = ?auto_156154 ?auto_156155 ) ) ( not ( = ?auto_156156 ?auto_156155 ) ) ( ON ?auto_156156 ?auto_156154 ) ( not ( = ?auto_156157 ?auto_156155 ) ) ( not ( = ?auto_156150 ?auto_156157 ) ) ( not ( = ?auto_156151 ?auto_156157 ) ) ( not ( = ?auto_156152 ?auto_156157 ) ) ( not ( = ?auto_156153 ?auto_156157 ) ) ( not ( = ?auto_156154 ?auto_156157 ) ) ( not ( = ?auto_156156 ?auto_156157 ) ) ( ON ?auto_156155 ?auto_156156 ) ( ON ?auto_156157 ?auto_156155 ) ( CLEAR ?auto_156157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_156150 ?auto_156151 ?auto_156152 ?auto_156153 ?auto_156154 ?auto_156156 ?auto_156155 )
      ( MAKE-4PILE ?auto_156150 ?auto_156151 ?auto_156152 ?auto_156153 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156158 - BLOCK
      ?auto_156159 - BLOCK
      ?auto_156160 - BLOCK
      ?auto_156161 - BLOCK
    )
    :vars
    (
      ?auto_156162 - BLOCK
      ?auto_156165 - BLOCK
      ?auto_156164 - BLOCK
      ?auto_156163 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156162 ?auto_156161 ) ( ON-TABLE ?auto_156158 ) ( ON ?auto_156159 ?auto_156158 ) ( ON ?auto_156160 ?auto_156159 ) ( ON ?auto_156161 ?auto_156160 ) ( not ( = ?auto_156158 ?auto_156159 ) ) ( not ( = ?auto_156158 ?auto_156160 ) ) ( not ( = ?auto_156158 ?auto_156161 ) ) ( not ( = ?auto_156158 ?auto_156162 ) ) ( not ( = ?auto_156159 ?auto_156160 ) ) ( not ( = ?auto_156159 ?auto_156161 ) ) ( not ( = ?auto_156159 ?auto_156162 ) ) ( not ( = ?auto_156160 ?auto_156161 ) ) ( not ( = ?auto_156160 ?auto_156162 ) ) ( not ( = ?auto_156161 ?auto_156162 ) ) ( not ( = ?auto_156158 ?auto_156165 ) ) ( not ( = ?auto_156158 ?auto_156164 ) ) ( not ( = ?auto_156159 ?auto_156165 ) ) ( not ( = ?auto_156159 ?auto_156164 ) ) ( not ( = ?auto_156160 ?auto_156165 ) ) ( not ( = ?auto_156160 ?auto_156164 ) ) ( not ( = ?auto_156161 ?auto_156165 ) ) ( not ( = ?auto_156161 ?auto_156164 ) ) ( not ( = ?auto_156162 ?auto_156165 ) ) ( not ( = ?auto_156162 ?auto_156164 ) ) ( not ( = ?auto_156165 ?auto_156164 ) ) ( ON ?auto_156165 ?auto_156162 ) ( not ( = ?auto_156163 ?auto_156164 ) ) ( not ( = ?auto_156158 ?auto_156163 ) ) ( not ( = ?auto_156159 ?auto_156163 ) ) ( not ( = ?auto_156160 ?auto_156163 ) ) ( not ( = ?auto_156161 ?auto_156163 ) ) ( not ( = ?auto_156162 ?auto_156163 ) ) ( not ( = ?auto_156165 ?auto_156163 ) ) ( ON ?auto_156164 ?auto_156165 ) ( HOLDING ?auto_156163 ) ( CLEAR ?auto_156164 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_156158 ?auto_156159 ?auto_156160 ?auto_156161 ?auto_156162 ?auto_156165 ?auto_156164 ?auto_156163 )
      ( MAKE-4PILE ?auto_156158 ?auto_156159 ?auto_156160 ?auto_156161 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156166 - BLOCK
      ?auto_156167 - BLOCK
      ?auto_156168 - BLOCK
      ?auto_156169 - BLOCK
    )
    :vars
    (
      ?auto_156173 - BLOCK
      ?auto_156170 - BLOCK
      ?auto_156172 - BLOCK
      ?auto_156171 - BLOCK
      ?auto_156174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156173 ?auto_156169 ) ( ON-TABLE ?auto_156166 ) ( ON ?auto_156167 ?auto_156166 ) ( ON ?auto_156168 ?auto_156167 ) ( ON ?auto_156169 ?auto_156168 ) ( not ( = ?auto_156166 ?auto_156167 ) ) ( not ( = ?auto_156166 ?auto_156168 ) ) ( not ( = ?auto_156166 ?auto_156169 ) ) ( not ( = ?auto_156166 ?auto_156173 ) ) ( not ( = ?auto_156167 ?auto_156168 ) ) ( not ( = ?auto_156167 ?auto_156169 ) ) ( not ( = ?auto_156167 ?auto_156173 ) ) ( not ( = ?auto_156168 ?auto_156169 ) ) ( not ( = ?auto_156168 ?auto_156173 ) ) ( not ( = ?auto_156169 ?auto_156173 ) ) ( not ( = ?auto_156166 ?auto_156170 ) ) ( not ( = ?auto_156166 ?auto_156172 ) ) ( not ( = ?auto_156167 ?auto_156170 ) ) ( not ( = ?auto_156167 ?auto_156172 ) ) ( not ( = ?auto_156168 ?auto_156170 ) ) ( not ( = ?auto_156168 ?auto_156172 ) ) ( not ( = ?auto_156169 ?auto_156170 ) ) ( not ( = ?auto_156169 ?auto_156172 ) ) ( not ( = ?auto_156173 ?auto_156170 ) ) ( not ( = ?auto_156173 ?auto_156172 ) ) ( not ( = ?auto_156170 ?auto_156172 ) ) ( ON ?auto_156170 ?auto_156173 ) ( not ( = ?auto_156171 ?auto_156172 ) ) ( not ( = ?auto_156166 ?auto_156171 ) ) ( not ( = ?auto_156167 ?auto_156171 ) ) ( not ( = ?auto_156168 ?auto_156171 ) ) ( not ( = ?auto_156169 ?auto_156171 ) ) ( not ( = ?auto_156173 ?auto_156171 ) ) ( not ( = ?auto_156170 ?auto_156171 ) ) ( ON ?auto_156172 ?auto_156170 ) ( CLEAR ?auto_156172 ) ( ON ?auto_156171 ?auto_156174 ) ( CLEAR ?auto_156171 ) ( HAND-EMPTY ) ( not ( = ?auto_156166 ?auto_156174 ) ) ( not ( = ?auto_156167 ?auto_156174 ) ) ( not ( = ?auto_156168 ?auto_156174 ) ) ( not ( = ?auto_156169 ?auto_156174 ) ) ( not ( = ?auto_156173 ?auto_156174 ) ) ( not ( = ?auto_156170 ?auto_156174 ) ) ( not ( = ?auto_156172 ?auto_156174 ) ) ( not ( = ?auto_156171 ?auto_156174 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_156171 ?auto_156174 )
      ( MAKE-4PILE ?auto_156166 ?auto_156167 ?auto_156168 ?auto_156169 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156175 - BLOCK
      ?auto_156176 - BLOCK
      ?auto_156177 - BLOCK
      ?auto_156178 - BLOCK
    )
    :vars
    (
      ?auto_156179 - BLOCK
      ?auto_156182 - BLOCK
      ?auto_156180 - BLOCK
      ?auto_156183 - BLOCK
      ?auto_156181 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156179 ?auto_156178 ) ( ON-TABLE ?auto_156175 ) ( ON ?auto_156176 ?auto_156175 ) ( ON ?auto_156177 ?auto_156176 ) ( ON ?auto_156178 ?auto_156177 ) ( not ( = ?auto_156175 ?auto_156176 ) ) ( not ( = ?auto_156175 ?auto_156177 ) ) ( not ( = ?auto_156175 ?auto_156178 ) ) ( not ( = ?auto_156175 ?auto_156179 ) ) ( not ( = ?auto_156176 ?auto_156177 ) ) ( not ( = ?auto_156176 ?auto_156178 ) ) ( not ( = ?auto_156176 ?auto_156179 ) ) ( not ( = ?auto_156177 ?auto_156178 ) ) ( not ( = ?auto_156177 ?auto_156179 ) ) ( not ( = ?auto_156178 ?auto_156179 ) ) ( not ( = ?auto_156175 ?auto_156182 ) ) ( not ( = ?auto_156175 ?auto_156180 ) ) ( not ( = ?auto_156176 ?auto_156182 ) ) ( not ( = ?auto_156176 ?auto_156180 ) ) ( not ( = ?auto_156177 ?auto_156182 ) ) ( not ( = ?auto_156177 ?auto_156180 ) ) ( not ( = ?auto_156178 ?auto_156182 ) ) ( not ( = ?auto_156178 ?auto_156180 ) ) ( not ( = ?auto_156179 ?auto_156182 ) ) ( not ( = ?auto_156179 ?auto_156180 ) ) ( not ( = ?auto_156182 ?auto_156180 ) ) ( ON ?auto_156182 ?auto_156179 ) ( not ( = ?auto_156183 ?auto_156180 ) ) ( not ( = ?auto_156175 ?auto_156183 ) ) ( not ( = ?auto_156176 ?auto_156183 ) ) ( not ( = ?auto_156177 ?auto_156183 ) ) ( not ( = ?auto_156178 ?auto_156183 ) ) ( not ( = ?auto_156179 ?auto_156183 ) ) ( not ( = ?auto_156182 ?auto_156183 ) ) ( ON ?auto_156183 ?auto_156181 ) ( CLEAR ?auto_156183 ) ( not ( = ?auto_156175 ?auto_156181 ) ) ( not ( = ?auto_156176 ?auto_156181 ) ) ( not ( = ?auto_156177 ?auto_156181 ) ) ( not ( = ?auto_156178 ?auto_156181 ) ) ( not ( = ?auto_156179 ?auto_156181 ) ) ( not ( = ?auto_156182 ?auto_156181 ) ) ( not ( = ?auto_156180 ?auto_156181 ) ) ( not ( = ?auto_156183 ?auto_156181 ) ) ( HOLDING ?auto_156180 ) ( CLEAR ?auto_156182 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_156175 ?auto_156176 ?auto_156177 ?auto_156178 ?auto_156179 ?auto_156182 ?auto_156180 )
      ( MAKE-4PILE ?auto_156175 ?auto_156176 ?auto_156177 ?auto_156178 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156184 - BLOCK
      ?auto_156185 - BLOCK
      ?auto_156186 - BLOCK
      ?auto_156187 - BLOCK
    )
    :vars
    (
      ?auto_156191 - BLOCK
      ?auto_156189 - BLOCK
      ?auto_156190 - BLOCK
      ?auto_156192 - BLOCK
      ?auto_156188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156191 ?auto_156187 ) ( ON-TABLE ?auto_156184 ) ( ON ?auto_156185 ?auto_156184 ) ( ON ?auto_156186 ?auto_156185 ) ( ON ?auto_156187 ?auto_156186 ) ( not ( = ?auto_156184 ?auto_156185 ) ) ( not ( = ?auto_156184 ?auto_156186 ) ) ( not ( = ?auto_156184 ?auto_156187 ) ) ( not ( = ?auto_156184 ?auto_156191 ) ) ( not ( = ?auto_156185 ?auto_156186 ) ) ( not ( = ?auto_156185 ?auto_156187 ) ) ( not ( = ?auto_156185 ?auto_156191 ) ) ( not ( = ?auto_156186 ?auto_156187 ) ) ( not ( = ?auto_156186 ?auto_156191 ) ) ( not ( = ?auto_156187 ?auto_156191 ) ) ( not ( = ?auto_156184 ?auto_156189 ) ) ( not ( = ?auto_156184 ?auto_156190 ) ) ( not ( = ?auto_156185 ?auto_156189 ) ) ( not ( = ?auto_156185 ?auto_156190 ) ) ( not ( = ?auto_156186 ?auto_156189 ) ) ( not ( = ?auto_156186 ?auto_156190 ) ) ( not ( = ?auto_156187 ?auto_156189 ) ) ( not ( = ?auto_156187 ?auto_156190 ) ) ( not ( = ?auto_156191 ?auto_156189 ) ) ( not ( = ?auto_156191 ?auto_156190 ) ) ( not ( = ?auto_156189 ?auto_156190 ) ) ( ON ?auto_156189 ?auto_156191 ) ( not ( = ?auto_156192 ?auto_156190 ) ) ( not ( = ?auto_156184 ?auto_156192 ) ) ( not ( = ?auto_156185 ?auto_156192 ) ) ( not ( = ?auto_156186 ?auto_156192 ) ) ( not ( = ?auto_156187 ?auto_156192 ) ) ( not ( = ?auto_156191 ?auto_156192 ) ) ( not ( = ?auto_156189 ?auto_156192 ) ) ( ON ?auto_156192 ?auto_156188 ) ( not ( = ?auto_156184 ?auto_156188 ) ) ( not ( = ?auto_156185 ?auto_156188 ) ) ( not ( = ?auto_156186 ?auto_156188 ) ) ( not ( = ?auto_156187 ?auto_156188 ) ) ( not ( = ?auto_156191 ?auto_156188 ) ) ( not ( = ?auto_156189 ?auto_156188 ) ) ( not ( = ?auto_156190 ?auto_156188 ) ) ( not ( = ?auto_156192 ?auto_156188 ) ) ( CLEAR ?auto_156189 ) ( ON ?auto_156190 ?auto_156192 ) ( CLEAR ?auto_156190 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_156188 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_156188 ?auto_156192 )
      ( MAKE-4PILE ?auto_156184 ?auto_156185 ?auto_156186 ?auto_156187 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156193 - BLOCK
      ?auto_156194 - BLOCK
      ?auto_156195 - BLOCK
      ?auto_156196 - BLOCK
    )
    :vars
    (
      ?auto_156200 - BLOCK
      ?auto_156198 - BLOCK
      ?auto_156197 - BLOCK
      ?auto_156201 - BLOCK
      ?auto_156199 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156200 ?auto_156196 ) ( ON-TABLE ?auto_156193 ) ( ON ?auto_156194 ?auto_156193 ) ( ON ?auto_156195 ?auto_156194 ) ( ON ?auto_156196 ?auto_156195 ) ( not ( = ?auto_156193 ?auto_156194 ) ) ( not ( = ?auto_156193 ?auto_156195 ) ) ( not ( = ?auto_156193 ?auto_156196 ) ) ( not ( = ?auto_156193 ?auto_156200 ) ) ( not ( = ?auto_156194 ?auto_156195 ) ) ( not ( = ?auto_156194 ?auto_156196 ) ) ( not ( = ?auto_156194 ?auto_156200 ) ) ( not ( = ?auto_156195 ?auto_156196 ) ) ( not ( = ?auto_156195 ?auto_156200 ) ) ( not ( = ?auto_156196 ?auto_156200 ) ) ( not ( = ?auto_156193 ?auto_156198 ) ) ( not ( = ?auto_156193 ?auto_156197 ) ) ( not ( = ?auto_156194 ?auto_156198 ) ) ( not ( = ?auto_156194 ?auto_156197 ) ) ( not ( = ?auto_156195 ?auto_156198 ) ) ( not ( = ?auto_156195 ?auto_156197 ) ) ( not ( = ?auto_156196 ?auto_156198 ) ) ( not ( = ?auto_156196 ?auto_156197 ) ) ( not ( = ?auto_156200 ?auto_156198 ) ) ( not ( = ?auto_156200 ?auto_156197 ) ) ( not ( = ?auto_156198 ?auto_156197 ) ) ( not ( = ?auto_156201 ?auto_156197 ) ) ( not ( = ?auto_156193 ?auto_156201 ) ) ( not ( = ?auto_156194 ?auto_156201 ) ) ( not ( = ?auto_156195 ?auto_156201 ) ) ( not ( = ?auto_156196 ?auto_156201 ) ) ( not ( = ?auto_156200 ?auto_156201 ) ) ( not ( = ?auto_156198 ?auto_156201 ) ) ( ON ?auto_156201 ?auto_156199 ) ( not ( = ?auto_156193 ?auto_156199 ) ) ( not ( = ?auto_156194 ?auto_156199 ) ) ( not ( = ?auto_156195 ?auto_156199 ) ) ( not ( = ?auto_156196 ?auto_156199 ) ) ( not ( = ?auto_156200 ?auto_156199 ) ) ( not ( = ?auto_156198 ?auto_156199 ) ) ( not ( = ?auto_156197 ?auto_156199 ) ) ( not ( = ?auto_156201 ?auto_156199 ) ) ( ON ?auto_156197 ?auto_156201 ) ( CLEAR ?auto_156197 ) ( ON-TABLE ?auto_156199 ) ( HOLDING ?auto_156198 ) ( CLEAR ?auto_156200 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_156193 ?auto_156194 ?auto_156195 ?auto_156196 ?auto_156200 ?auto_156198 )
      ( MAKE-4PILE ?auto_156193 ?auto_156194 ?auto_156195 ?auto_156196 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156202 - BLOCK
      ?auto_156203 - BLOCK
      ?auto_156204 - BLOCK
      ?auto_156205 - BLOCK
    )
    :vars
    (
      ?auto_156206 - BLOCK
      ?auto_156207 - BLOCK
      ?auto_156208 - BLOCK
      ?auto_156209 - BLOCK
      ?auto_156210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156206 ?auto_156205 ) ( ON-TABLE ?auto_156202 ) ( ON ?auto_156203 ?auto_156202 ) ( ON ?auto_156204 ?auto_156203 ) ( ON ?auto_156205 ?auto_156204 ) ( not ( = ?auto_156202 ?auto_156203 ) ) ( not ( = ?auto_156202 ?auto_156204 ) ) ( not ( = ?auto_156202 ?auto_156205 ) ) ( not ( = ?auto_156202 ?auto_156206 ) ) ( not ( = ?auto_156203 ?auto_156204 ) ) ( not ( = ?auto_156203 ?auto_156205 ) ) ( not ( = ?auto_156203 ?auto_156206 ) ) ( not ( = ?auto_156204 ?auto_156205 ) ) ( not ( = ?auto_156204 ?auto_156206 ) ) ( not ( = ?auto_156205 ?auto_156206 ) ) ( not ( = ?auto_156202 ?auto_156207 ) ) ( not ( = ?auto_156202 ?auto_156208 ) ) ( not ( = ?auto_156203 ?auto_156207 ) ) ( not ( = ?auto_156203 ?auto_156208 ) ) ( not ( = ?auto_156204 ?auto_156207 ) ) ( not ( = ?auto_156204 ?auto_156208 ) ) ( not ( = ?auto_156205 ?auto_156207 ) ) ( not ( = ?auto_156205 ?auto_156208 ) ) ( not ( = ?auto_156206 ?auto_156207 ) ) ( not ( = ?auto_156206 ?auto_156208 ) ) ( not ( = ?auto_156207 ?auto_156208 ) ) ( not ( = ?auto_156209 ?auto_156208 ) ) ( not ( = ?auto_156202 ?auto_156209 ) ) ( not ( = ?auto_156203 ?auto_156209 ) ) ( not ( = ?auto_156204 ?auto_156209 ) ) ( not ( = ?auto_156205 ?auto_156209 ) ) ( not ( = ?auto_156206 ?auto_156209 ) ) ( not ( = ?auto_156207 ?auto_156209 ) ) ( ON ?auto_156209 ?auto_156210 ) ( not ( = ?auto_156202 ?auto_156210 ) ) ( not ( = ?auto_156203 ?auto_156210 ) ) ( not ( = ?auto_156204 ?auto_156210 ) ) ( not ( = ?auto_156205 ?auto_156210 ) ) ( not ( = ?auto_156206 ?auto_156210 ) ) ( not ( = ?auto_156207 ?auto_156210 ) ) ( not ( = ?auto_156208 ?auto_156210 ) ) ( not ( = ?auto_156209 ?auto_156210 ) ) ( ON ?auto_156208 ?auto_156209 ) ( ON-TABLE ?auto_156210 ) ( CLEAR ?auto_156206 ) ( ON ?auto_156207 ?auto_156208 ) ( CLEAR ?auto_156207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_156210 ?auto_156209 ?auto_156208 )
      ( MAKE-4PILE ?auto_156202 ?auto_156203 ?auto_156204 ?auto_156205 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156229 - BLOCK
      ?auto_156230 - BLOCK
      ?auto_156231 - BLOCK
      ?auto_156232 - BLOCK
    )
    :vars
    (
      ?auto_156236 - BLOCK
      ?auto_156234 - BLOCK
      ?auto_156233 - BLOCK
      ?auto_156235 - BLOCK
      ?auto_156237 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_156229 ) ( ON ?auto_156230 ?auto_156229 ) ( ON ?auto_156231 ?auto_156230 ) ( not ( = ?auto_156229 ?auto_156230 ) ) ( not ( = ?auto_156229 ?auto_156231 ) ) ( not ( = ?auto_156229 ?auto_156232 ) ) ( not ( = ?auto_156229 ?auto_156236 ) ) ( not ( = ?auto_156230 ?auto_156231 ) ) ( not ( = ?auto_156230 ?auto_156232 ) ) ( not ( = ?auto_156230 ?auto_156236 ) ) ( not ( = ?auto_156231 ?auto_156232 ) ) ( not ( = ?auto_156231 ?auto_156236 ) ) ( not ( = ?auto_156232 ?auto_156236 ) ) ( not ( = ?auto_156229 ?auto_156234 ) ) ( not ( = ?auto_156229 ?auto_156233 ) ) ( not ( = ?auto_156230 ?auto_156234 ) ) ( not ( = ?auto_156230 ?auto_156233 ) ) ( not ( = ?auto_156231 ?auto_156234 ) ) ( not ( = ?auto_156231 ?auto_156233 ) ) ( not ( = ?auto_156232 ?auto_156234 ) ) ( not ( = ?auto_156232 ?auto_156233 ) ) ( not ( = ?auto_156236 ?auto_156234 ) ) ( not ( = ?auto_156236 ?auto_156233 ) ) ( not ( = ?auto_156234 ?auto_156233 ) ) ( not ( = ?auto_156235 ?auto_156233 ) ) ( not ( = ?auto_156229 ?auto_156235 ) ) ( not ( = ?auto_156230 ?auto_156235 ) ) ( not ( = ?auto_156231 ?auto_156235 ) ) ( not ( = ?auto_156232 ?auto_156235 ) ) ( not ( = ?auto_156236 ?auto_156235 ) ) ( not ( = ?auto_156234 ?auto_156235 ) ) ( ON ?auto_156235 ?auto_156237 ) ( not ( = ?auto_156229 ?auto_156237 ) ) ( not ( = ?auto_156230 ?auto_156237 ) ) ( not ( = ?auto_156231 ?auto_156237 ) ) ( not ( = ?auto_156232 ?auto_156237 ) ) ( not ( = ?auto_156236 ?auto_156237 ) ) ( not ( = ?auto_156234 ?auto_156237 ) ) ( not ( = ?auto_156233 ?auto_156237 ) ) ( not ( = ?auto_156235 ?auto_156237 ) ) ( ON ?auto_156233 ?auto_156235 ) ( ON-TABLE ?auto_156237 ) ( ON ?auto_156234 ?auto_156233 ) ( ON ?auto_156236 ?auto_156234 ) ( CLEAR ?auto_156236 ) ( HOLDING ?auto_156232 ) ( CLEAR ?auto_156231 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_156229 ?auto_156230 ?auto_156231 ?auto_156232 ?auto_156236 )
      ( MAKE-4PILE ?auto_156229 ?auto_156230 ?auto_156231 ?auto_156232 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156238 - BLOCK
      ?auto_156239 - BLOCK
      ?auto_156240 - BLOCK
      ?auto_156241 - BLOCK
    )
    :vars
    (
      ?auto_156245 - BLOCK
      ?auto_156244 - BLOCK
      ?auto_156246 - BLOCK
      ?auto_156243 - BLOCK
      ?auto_156242 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_156238 ) ( ON ?auto_156239 ?auto_156238 ) ( ON ?auto_156240 ?auto_156239 ) ( not ( = ?auto_156238 ?auto_156239 ) ) ( not ( = ?auto_156238 ?auto_156240 ) ) ( not ( = ?auto_156238 ?auto_156241 ) ) ( not ( = ?auto_156238 ?auto_156245 ) ) ( not ( = ?auto_156239 ?auto_156240 ) ) ( not ( = ?auto_156239 ?auto_156241 ) ) ( not ( = ?auto_156239 ?auto_156245 ) ) ( not ( = ?auto_156240 ?auto_156241 ) ) ( not ( = ?auto_156240 ?auto_156245 ) ) ( not ( = ?auto_156241 ?auto_156245 ) ) ( not ( = ?auto_156238 ?auto_156244 ) ) ( not ( = ?auto_156238 ?auto_156246 ) ) ( not ( = ?auto_156239 ?auto_156244 ) ) ( not ( = ?auto_156239 ?auto_156246 ) ) ( not ( = ?auto_156240 ?auto_156244 ) ) ( not ( = ?auto_156240 ?auto_156246 ) ) ( not ( = ?auto_156241 ?auto_156244 ) ) ( not ( = ?auto_156241 ?auto_156246 ) ) ( not ( = ?auto_156245 ?auto_156244 ) ) ( not ( = ?auto_156245 ?auto_156246 ) ) ( not ( = ?auto_156244 ?auto_156246 ) ) ( not ( = ?auto_156243 ?auto_156246 ) ) ( not ( = ?auto_156238 ?auto_156243 ) ) ( not ( = ?auto_156239 ?auto_156243 ) ) ( not ( = ?auto_156240 ?auto_156243 ) ) ( not ( = ?auto_156241 ?auto_156243 ) ) ( not ( = ?auto_156245 ?auto_156243 ) ) ( not ( = ?auto_156244 ?auto_156243 ) ) ( ON ?auto_156243 ?auto_156242 ) ( not ( = ?auto_156238 ?auto_156242 ) ) ( not ( = ?auto_156239 ?auto_156242 ) ) ( not ( = ?auto_156240 ?auto_156242 ) ) ( not ( = ?auto_156241 ?auto_156242 ) ) ( not ( = ?auto_156245 ?auto_156242 ) ) ( not ( = ?auto_156244 ?auto_156242 ) ) ( not ( = ?auto_156246 ?auto_156242 ) ) ( not ( = ?auto_156243 ?auto_156242 ) ) ( ON ?auto_156246 ?auto_156243 ) ( ON-TABLE ?auto_156242 ) ( ON ?auto_156244 ?auto_156246 ) ( ON ?auto_156245 ?auto_156244 ) ( CLEAR ?auto_156240 ) ( ON ?auto_156241 ?auto_156245 ) ( CLEAR ?auto_156241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_156242 ?auto_156243 ?auto_156246 ?auto_156244 ?auto_156245 )
      ( MAKE-4PILE ?auto_156238 ?auto_156239 ?auto_156240 ?auto_156241 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156247 - BLOCK
      ?auto_156248 - BLOCK
      ?auto_156249 - BLOCK
      ?auto_156250 - BLOCK
    )
    :vars
    (
      ?auto_156253 - BLOCK
      ?auto_156251 - BLOCK
      ?auto_156255 - BLOCK
      ?auto_156252 - BLOCK
      ?auto_156254 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_156247 ) ( ON ?auto_156248 ?auto_156247 ) ( not ( = ?auto_156247 ?auto_156248 ) ) ( not ( = ?auto_156247 ?auto_156249 ) ) ( not ( = ?auto_156247 ?auto_156250 ) ) ( not ( = ?auto_156247 ?auto_156253 ) ) ( not ( = ?auto_156248 ?auto_156249 ) ) ( not ( = ?auto_156248 ?auto_156250 ) ) ( not ( = ?auto_156248 ?auto_156253 ) ) ( not ( = ?auto_156249 ?auto_156250 ) ) ( not ( = ?auto_156249 ?auto_156253 ) ) ( not ( = ?auto_156250 ?auto_156253 ) ) ( not ( = ?auto_156247 ?auto_156251 ) ) ( not ( = ?auto_156247 ?auto_156255 ) ) ( not ( = ?auto_156248 ?auto_156251 ) ) ( not ( = ?auto_156248 ?auto_156255 ) ) ( not ( = ?auto_156249 ?auto_156251 ) ) ( not ( = ?auto_156249 ?auto_156255 ) ) ( not ( = ?auto_156250 ?auto_156251 ) ) ( not ( = ?auto_156250 ?auto_156255 ) ) ( not ( = ?auto_156253 ?auto_156251 ) ) ( not ( = ?auto_156253 ?auto_156255 ) ) ( not ( = ?auto_156251 ?auto_156255 ) ) ( not ( = ?auto_156252 ?auto_156255 ) ) ( not ( = ?auto_156247 ?auto_156252 ) ) ( not ( = ?auto_156248 ?auto_156252 ) ) ( not ( = ?auto_156249 ?auto_156252 ) ) ( not ( = ?auto_156250 ?auto_156252 ) ) ( not ( = ?auto_156253 ?auto_156252 ) ) ( not ( = ?auto_156251 ?auto_156252 ) ) ( ON ?auto_156252 ?auto_156254 ) ( not ( = ?auto_156247 ?auto_156254 ) ) ( not ( = ?auto_156248 ?auto_156254 ) ) ( not ( = ?auto_156249 ?auto_156254 ) ) ( not ( = ?auto_156250 ?auto_156254 ) ) ( not ( = ?auto_156253 ?auto_156254 ) ) ( not ( = ?auto_156251 ?auto_156254 ) ) ( not ( = ?auto_156255 ?auto_156254 ) ) ( not ( = ?auto_156252 ?auto_156254 ) ) ( ON ?auto_156255 ?auto_156252 ) ( ON-TABLE ?auto_156254 ) ( ON ?auto_156251 ?auto_156255 ) ( ON ?auto_156253 ?auto_156251 ) ( ON ?auto_156250 ?auto_156253 ) ( CLEAR ?auto_156250 ) ( HOLDING ?auto_156249 ) ( CLEAR ?auto_156248 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_156247 ?auto_156248 ?auto_156249 )
      ( MAKE-4PILE ?auto_156247 ?auto_156248 ?auto_156249 ?auto_156250 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156256 - BLOCK
      ?auto_156257 - BLOCK
      ?auto_156258 - BLOCK
      ?auto_156259 - BLOCK
    )
    :vars
    (
      ?auto_156261 - BLOCK
      ?auto_156260 - BLOCK
      ?auto_156264 - BLOCK
      ?auto_156263 - BLOCK
      ?auto_156262 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_156256 ) ( ON ?auto_156257 ?auto_156256 ) ( not ( = ?auto_156256 ?auto_156257 ) ) ( not ( = ?auto_156256 ?auto_156258 ) ) ( not ( = ?auto_156256 ?auto_156259 ) ) ( not ( = ?auto_156256 ?auto_156261 ) ) ( not ( = ?auto_156257 ?auto_156258 ) ) ( not ( = ?auto_156257 ?auto_156259 ) ) ( not ( = ?auto_156257 ?auto_156261 ) ) ( not ( = ?auto_156258 ?auto_156259 ) ) ( not ( = ?auto_156258 ?auto_156261 ) ) ( not ( = ?auto_156259 ?auto_156261 ) ) ( not ( = ?auto_156256 ?auto_156260 ) ) ( not ( = ?auto_156256 ?auto_156264 ) ) ( not ( = ?auto_156257 ?auto_156260 ) ) ( not ( = ?auto_156257 ?auto_156264 ) ) ( not ( = ?auto_156258 ?auto_156260 ) ) ( not ( = ?auto_156258 ?auto_156264 ) ) ( not ( = ?auto_156259 ?auto_156260 ) ) ( not ( = ?auto_156259 ?auto_156264 ) ) ( not ( = ?auto_156261 ?auto_156260 ) ) ( not ( = ?auto_156261 ?auto_156264 ) ) ( not ( = ?auto_156260 ?auto_156264 ) ) ( not ( = ?auto_156263 ?auto_156264 ) ) ( not ( = ?auto_156256 ?auto_156263 ) ) ( not ( = ?auto_156257 ?auto_156263 ) ) ( not ( = ?auto_156258 ?auto_156263 ) ) ( not ( = ?auto_156259 ?auto_156263 ) ) ( not ( = ?auto_156261 ?auto_156263 ) ) ( not ( = ?auto_156260 ?auto_156263 ) ) ( ON ?auto_156263 ?auto_156262 ) ( not ( = ?auto_156256 ?auto_156262 ) ) ( not ( = ?auto_156257 ?auto_156262 ) ) ( not ( = ?auto_156258 ?auto_156262 ) ) ( not ( = ?auto_156259 ?auto_156262 ) ) ( not ( = ?auto_156261 ?auto_156262 ) ) ( not ( = ?auto_156260 ?auto_156262 ) ) ( not ( = ?auto_156264 ?auto_156262 ) ) ( not ( = ?auto_156263 ?auto_156262 ) ) ( ON ?auto_156264 ?auto_156263 ) ( ON-TABLE ?auto_156262 ) ( ON ?auto_156260 ?auto_156264 ) ( ON ?auto_156261 ?auto_156260 ) ( ON ?auto_156259 ?auto_156261 ) ( CLEAR ?auto_156257 ) ( ON ?auto_156258 ?auto_156259 ) ( CLEAR ?auto_156258 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_156262 ?auto_156263 ?auto_156264 ?auto_156260 ?auto_156261 ?auto_156259 )
      ( MAKE-4PILE ?auto_156256 ?auto_156257 ?auto_156258 ?auto_156259 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156265 - BLOCK
      ?auto_156266 - BLOCK
      ?auto_156267 - BLOCK
      ?auto_156268 - BLOCK
    )
    :vars
    (
      ?auto_156271 - BLOCK
      ?auto_156272 - BLOCK
      ?auto_156273 - BLOCK
      ?auto_156269 - BLOCK
      ?auto_156270 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_156265 ) ( not ( = ?auto_156265 ?auto_156266 ) ) ( not ( = ?auto_156265 ?auto_156267 ) ) ( not ( = ?auto_156265 ?auto_156268 ) ) ( not ( = ?auto_156265 ?auto_156271 ) ) ( not ( = ?auto_156266 ?auto_156267 ) ) ( not ( = ?auto_156266 ?auto_156268 ) ) ( not ( = ?auto_156266 ?auto_156271 ) ) ( not ( = ?auto_156267 ?auto_156268 ) ) ( not ( = ?auto_156267 ?auto_156271 ) ) ( not ( = ?auto_156268 ?auto_156271 ) ) ( not ( = ?auto_156265 ?auto_156272 ) ) ( not ( = ?auto_156265 ?auto_156273 ) ) ( not ( = ?auto_156266 ?auto_156272 ) ) ( not ( = ?auto_156266 ?auto_156273 ) ) ( not ( = ?auto_156267 ?auto_156272 ) ) ( not ( = ?auto_156267 ?auto_156273 ) ) ( not ( = ?auto_156268 ?auto_156272 ) ) ( not ( = ?auto_156268 ?auto_156273 ) ) ( not ( = ?auto_156271 ?auto_156272 ) ) ( not ( = ?auto_156271 ?auto_156273 ) ) ( not ( = ?auto_156272 ?auto_156273 ) ) ( not ( = ?auto_156269 ?auto_156273 ) ) ( not ( = ?auto_156265 ?auto_156269 ) ) ( not ( = ?auto_156266 ?auto_156269 ) ) ( not ( = ?auto_156267 ?auto_156269 ) ) ( not ( = ?auto_156268 ?auto_156269 ) ) ( not ( = ?auto_156271 ?auto_156269 ) ) ( not ( = ?auto_156272 ?auto_156269 ) ) ( ON ?auto_156269 ?auto_156270 ) ( not ( = ?auto_156265 ?auto_156270 ) ) ( not ( = ?auto_156266 ?auto_156270 ) ) ( not ( = ?auto_156267 ?auto_156270 ) ) ( not ( = ?auto_156268 ?auto_156270 ) ) ( not ( = ?auto_156271 ?auto_156270 ) ) ( not ( = ?auto_156272 ?auto_156270 ) ) ( not ( = ?auto_156273 ?auto_156270 ) ) ( not ( = ?auto_156269 ?auto_156270 ) ) ( ON ?auto_156273 ?auto_156269 ) ( ON-TABLE ?auto_156270 ) ( ON ?auto_156272 ?auto_156273 ) ( ON ?auto_156271 ?auto_156272 ) ( ON ?auto_156268 ?auto_156271 ) ( ON ?auto_156267 ?auto_156268 ) ( CLEAR ?auto_156267 ) ( HOLDING ?auto_156266 ) ( CLEAR ?auto_156265 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_156265 ?auto_156266 )
      ( MAKE-4PILE ?auto_156265 ?auto_156266 ?auto_156267 ?auto_156268 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156274 - BLOCK
      ?auto_156275 - BLOCK
      ?auto_156276 - BLOCK
      ?auto_156277 - BLOCK
    )
    :vars
    (
      ?auto_156282 - BLOCK
      ?auto_156281 - BLOCK
      ?auto_156279 - BLOCK
      ?auto_156280 - BLOCK
      ?auto_156278 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_156274 ) ( not ( = ?auto_156274 ?auto_156275 ) ) ( not ( = ?auto_156274 ?auto_156276 ) ) ( not ( = ?auto_156274 ?auto_156277 ) ) ( not ( = ?auto_156274 ?auto_156282 ) ) ( not ( = ?auto_156275 ?auto_156276 ) ) ( not ( = ?auto_156275 ?auto_156277 ) ) ( not ( = ?auto_156275 ?auto_156282 ) ) ( not ( = ?auto_156276 ?auto_156277 ) ) ( not ( = ?auto_156276 ?auto_156282 ) ) ( not ( = ?auto_156277 ?auto_156282 ) ) ( not ( = ?auto_156274 ?auto_156281 ) ) ( not ( = ?auto_156274 ?auto_156279 ) ) ( not ( = ?auto_156275 ?auto_156281 ) ) ( not ( = ?auto_156275 ?auto_156279 ) ) ( not ( = ?auto_156276 ?auto_156281 ) ) ( not ( = ?auto_156276 ?auto_156279 ) ) ( not ( = ?auto_156277 ?auto_156281 ) ) ( not ( = ?auto_156277 ?auto_156279 ) ) ( not ( = ?auto_156282 ?auto_156281 ) ) ( not ( = ?auto_156282 ?auto_156279 ) ) ( not ( = ?auto_156281 ?auto_156279 ) ) ( not ( = ?auto_156280 ?auto_156279 ) ) ( not ( = ?auto_156274 ?auto_156280 ) ) ( not ( = ?auto_156275 ?auto_156280 ) ) ( not ( = ?auto_156276 ?auto_156280 ) ) ( not ( = ?auto_156277 ?auto_156280 ) ) ( not ( = ?auto_156282 ?auto_156280 ) ) ( not ( = ?auto_156281 ?auto_156280 ) ) ( ON ?auto_156280 ?auto_156278 ) ( not ( = ?auto_156274 ?auto_156278 ) ) ( not ( = ?auto_156275 ?auto_156278 ) ) ( not ( = ?auto_156276 ?auto_156278 ) ) ( not ( = ?auto_156277 ?auto_156278 ) ) ( not ( = ?auto_156282 ?auto_156278 ) ) ( not ( = ?auto_156281 ?auto_156278 ) ) ( not ( = ?auto_156279 ?auto_156278 ) ) ( not ( = ?auto_156280 ?auto_156278 ) ) ( ON ?auto_156279 ?auto_156280 ) ( ON-TABLE ?auto_156278 ) ( ON ?auto_156281 ?auto_156279 ) ( ON ?auto_156282 ?auto_156281 ) ( ON ?auto_156277 ?auto_156282 ) ( ON ?auto_156276 ?auto_156277 ) ( CLEAR ?auto_156274 ) ( ON ?auto_156275 ?auto_156276 ) ( CLEAR ?auto_156275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_156278 ?auto_156280 ?auto_156279 ?auto_156281 ?auto_156282 ?auto_156277 ?auto_156276 )
      ( MAKE-4PILE ?auto_156274 ?auto_156275 ?auto_156276 ?auto_156277 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156283 - BLOCK
      ?auto_156284 - BLOCK
      ?auto_156285 - BLOCK
      ?auto_156286 - BLOCK
    )
    :vars
    (
      ?auto_156290 - BLOCK
      ?auto_156289 - BLOCK
      ?auto_156288 - BLOCK
      ?auto_156291 - BLOCK
      ?auto_156287 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156283 ?auto_156284 ) ) ( not ( = ?auto_156283 ?auto_156285 ) ) ( not ( = ?auto_156283 ?auto_156286 ) ) ( not ( = ?auto_156283 ?auto_156290 ) ) ( not ( = ?auto_156284 ?auto_156285 ) ) ( not ( = ?auto_156284 ?auto_156286 ) ) ( not ( = ?auto_156284 ?auto_156290 ) ) ( not ( = ?auto_156285 ?auto_156286 ) ) ( not ( = ?auto_156285 ?auto_156290 ) ) ( not ( = ?auto_156286 ?auto_156290 ) ) ( not ( = ?auto_156283 ?auto_156289 ) ) ( not ( = ?auto_156283 ?auto_156288 ) ) ( not ( = ?auto_156284 ?auto_156289 ) ) ( not ( = ?auto_156284 ?auto_156288 ) ) ( not ( = ?auto_156285 ?auto_156289 ) ) ( not ( = ?auto_156285 ?auto_156288 ) ) ( not ( = ?auto_156286 ?auto_156289 ) ) ( not ( = ?auto_156286 ?auto_156288 ) ) ( not ( = ?auto_156290 ?auto_156289 ) ) ( not ( = ?auto_156290 ?auto_156288 ) ) ( not ( = ?auto_156289 ?auto_156288 ) ) ( not ( = ?auto_156291 ?auto_156288 ) ) ( not ( = ?auto_156283 ?auto_156291 ) ) ( not ( = ?auto_156284 ?auto_156291 ) ) ( not ( = ?auto_156285 ?auto_156291 ) ) ( not ( = ?auto_156286 ?auto_156291 ) ) ( not ( = ?auto_156290 ?auto_156291 ) ) ( not ( = ?auto_156289 ?auto_156291 ) ) ( ON ?auto_156291 ?auto_156287 ) ( not ( = ?auto_156283 ?auto_156287 ) ) ( not ( = ?auto_156284 ?auto_156287 ) ) ( not ( = ?auto_156285 ?auto_156287 ) ) ( not ( = ?auto_156286 ?auto_156287 ) ) ( not ( = ?auto_156290 ?auto_156287 ) ) ( not ( = ?auto_156289 ?auto_156287 ) ) ( not ( = ?auto_156288 ?auto_156287 ) ) ( not ( = ?auto_156291 ?auto_156287 ) ) ( ON ?auto_156288 ?auto_156291 ) ( ON-TABLE ?auto_156287 ) ( ON ?auto_156289 ?auto_156288 ) ( ON ?auto_156290 ?auto_156289 ) ( ON ?auto_156286 ?auto_156290 ) ( ON ?auto_156285 ?auto_156286 ) ( ON ?auto_156284 ?auto_156285 ) ( CLEAR ?auto_156284 ) ( HOLDING ?auto_156283 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_156283 )
      ( MAKE-4PILE ?auto_156283 ?auto_156284 ?auto_156285 ?auto_156286 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156292 - BLOCK
      ?auto_156293 - BLOCK
      ?auto_156294 - BLOCK
      ?auto_156295 - BLOCK
    )
    :vars
    (
      ?auto_156297 - BLOCK
      ?auto_156298 - BLOCK
      ?auto_156296 - BLOCK
      ?auto_156300 - BLOCK
      ?auto_156299 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156292 ?auto_156293 ) ) ( not ( = ?auto_156292 ?auto_156294 ) ) ( not ( = ?auto_156292 ?auto_156295 ) ) ( not ( = ?auto_156292 ?auto_156297 ) ) ( not ( = ?auto_156293 ?auto_156294 ) ) ( not ( = ?auto_156293 ?auto_156295 ) ) ( not ( = ?auto_156293 ?auto_156297 ) ) ( not ( = ?auto_156294 ?auto_156295 ) ) ( not ( = ?auto_156294 ?auto_156297 ) ) ( not ( = ?auto_156295 ?auto_156297 ) ) ( not ( = ?auto_156292 ?auto_156298 ) ) ( not ( = ?auto_156292 ?auto_156296 ) ) ( not ( = ?auto_156293 ?auto_156298 ) ) ( not ( = ?auto_156293 ?auto_156296 ) ) ( not ( = ?auto_156294 ?auto_156298 ) ) ( not ( = ?auto_156294 ?auto_156296 ) ) ( not ( = ?auto_156295 ?auto_156298 ) ) ( not ( = ?auto_156295 ?auto_156296 ) ) ( not ( = ?auto_156297 ?auto_156298 ) ) ( not ( = ?auto_156297 ?auto_156296 ) ) ( not ( = ?auto_156298 ?auto_156296 ) ) ( not ( = ?auto_156300 ?auto_156296 ) ) ( not ( = ?auto_156292 ?auto_156300 ) ) ( not ( = ?auto_156293 ?auto_156300 ) ) ( not ( = ?auto_156294 ?auto_156300 ) ) ( not ( = ?auto_156295 ?auto_156300 ) ) ( not ( = ?auto_156297 ?auto_156300 ) ) ( not ( = ?auto_156298 ?auto_156300 ) ) ( ON ?auto_156300 ?auto_156299 ) ( not ( = ?auto_156292 ?auto_156299 ) ) ( not ( = ?auto_156293 ?auto_156299 ) ) ( not ( = ?auto_156294 ?auto_156299 ) ) ( not ( = ?auto_156295 ?auto_156299 ) ) ( not ( = ?auto_156297 ?auto_156299 ) ) ( not ( = ?auto_156298 ?auto_156299 ) ) ( not ( = ?auto_156296 ?auto_156299 ) ) ( not ( = ?auto_156300 ?auto_156299 ) ) ( ON ?auto_156296 ?auto_156300 ) ( ON-TABLE ?auto_156299 ) ( ON ?auto_156298 ?auto_156296 ) ( ON ?auto_156297 ?auto_156298 ) ( ON ?auto_156295 ?auto_156297 ) ( ON ?auto_156294 ?auto_156295 ) ( ON ?auto_156293 ?auto_156294 ) ( ON ?auto_156292 ?auto_156293 ) ( CLEAR ?auto_156292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_156299 ?auto_156300 ?auto_156296 ?auto_156298 ?auto_156297 ?auto_156295 ?auto_156294 ?auto_156293 )
      ( MAKE-4PILE ?auto_156292 ?auto_156293 ?auto_156294 ?auto_156295 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156305 - BLOCK
      ?auto_156306 - BLOCK
      ?auto_156307 - BLOCK
      ?auto_156308 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_156308 ) ( CLEAR ?auto_156307 ) ( ON-TABLE ?auto_156305 ) ( ON ?auto_156306 ?auto_156305 ) ( ON ?auto_156307 ?auto_156306 ) ( not ( = ?auto_156305 ?auto_156306 ) ) ( not ( = ?auto_156305 ?auto_156307 ) ) ( not ( = ?auto_156305 ?auto_156308 ) ) ( not ( = ?auto_156306 ?auto_156307 ) ) ( not ( = ?auto_156306 ?auto_156308 ) ) ( not ( = ?auto_156307 ?auto_156308 ) ) )
    :subtasks
    ( ( !STACK ?auto_156308 ?auto_156307 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156309 - BLOCK
      ?auto_156310 - BLOCK
      ?auto_156311 - BLOCK
      ?auto_156312 - BLOCK
    )
    :vars
    (
      ?auto_156313 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_156311 ) ( ON-TABLE ?auto_156309 ) ( ON ?auto_156310 ?auto_156309 ) ( ON ?auto_156311 ?auto_156310 ) ( not ( = ?auto_156309 ?auto_156310 ) ) ( not ( = ?auto_156309 ?auto_156311 ) ) ( not ( = ?auto_156309 ?auto_156312 ) ) ( not ( = ?auto_156310 ?auto_156311 ) ) ( not ( = ?auto_156310 ?auto_156312 ) ) ( not ( = ?auto_156311 ?auto_156312 ) ) ( ON ?auto_156312 ?auto_156313 ) ( CLEAR ?auto_156312 ) ( HAND-EMPTY ) ( not ( = ?auto_156309 ?auto_156313 ) ) ( not ( = ?auto_156310 ?auto_156313 ) ) ( not ( = ?auto_156311 ?auto_156313 ) ) ( not ( = ?auto_156312 ?auto_156313 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_156312 ?auto_156313 )
      ( MAKE-4PILE ?auto_156309 ?auto_156310 ?auto_156311 ?auto_156312 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156314 - BLOCK
      ?auto_156315 - BLOCK
      ?auto_156316 - BLOCK
      ?auto_156317 - BLOCK
    )
    :vars
    (
      ?auto_156318 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_156314 ) ( ON ?auto_156315 ?auto_156314 ) ( not ( = ?auto_156314 ?auto_156315 ) ) ( not ( = ?auto_156314 ?auto_156316 ) ) ( not ( = ?auto_156314 ?auto_156317 ) ) ( not ( = ?auto_156315 ?auto_156316 ) ) ( not ( = ?auto_156315 ?auto_156317 ) ) ( not ( = ?auto_156316 ?auto_156317 ) ) ( ON ?auto_156317 ?auto_156318 ) ( CLEAR ?auto_156317 ) ( not ( = ?auto_156314 ?auto_156318 ) ) ( not ( = ?auto_156315 ?auto_156318 ) ) ( not ( = ?auto_156316 ?auto_156318 ) ) ( not ( = ?auto_156317 ?auto_156318 ) ) ( HOLDING ?auto_156316 ) ( CLEAR ?auto_156315 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_156314 ?auto_156315 ?auto_156316 )
      ( MAKE-4PILE ?auto_156314 ?auto_156315 ?auto_156316 ?auto_156317 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156319 - BLOCK
      ?auto_156320 - BLOCK
      ?auto_156321 - BLOCK
      ?auto_156322 - BLOCK
    )
    :vars
    (
      ?auto_156323 - BLOCK
      ?auto_156326 - BLOCK
      ?auto_156325 - BLOCK
      ?auto_156324 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_156319 ) ( ON ?auto_156320 ?auto_156319 ) ( not ( = ?auto_156319 ?auto_156320 ) ) ( not ( = ?auto_156319 ?auto_156321 ) ) ( not ( = ?auto_156319 ?auto_156322 ) ) ( not ( = ?auto_156320 ?auto_156321 ) ) ( not ( = ?auto_156320 ?auto_156322 ) ) ( not ( = ?auto_156321 ?auto_156322 ) ) ( ON ?auto_156322 ?auto_156323 ) ( not ( = ?auto_156319 ?auto_156323 ) ) ( not ( = ?auto_156320 ?auto_156323 ) ) ( not ( = ?auto_156321 ?auto_156323 ) ) ( not ( = ?auto_156322 ?auto_156323 ) ) ( CLEAR ?auto_156320 ) ( ON ?auto_156321 ?auto_156322 ) ( CLEAR ?auto_156321 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_156326 ) ( ON ?auto_156325 ?auto_156326 ) ( ON ?auto_156324 ?auto_156325 ) ( ON ?auto_156323 ?auto_156324 ) ( not ( = ?auto_156326 ?auto_156325 ) ) ( not ( = ?auto_156326 ?auto_156324 ) ) ( not ( = ?auto_156326 ?auto_156323 ) ) ( not ( = ?auto_156326 ?auto_156322 ) ) ( not ( = ?auto_156326 ?auto_156321 ) ) ( not ( = ?auto_156325 ?auto_156324 ) ) ( not ( = ?auto_156325 ?auto_156323 ) ) ( not ( = ?auto_156325 ?auto_156322 ) ) ( not ( = ?auto_156325 ?auto_156321 ) ) ( not ( = ?auto_156324 ?auto_156323 ) ) ( not ( = ?auto_156324 ?auto_156322 ) ) ( not ( = ?auto_156324 ?auto_156321 ) ) ( not ( = ?auto_156319 ?auto_156326 ) ) ( not ( = ?auto_156319 ?auto_156325 ) ) ( not ( = ?auto_156319 ?auto_156324 ) ) ( not ( = ?auto_156320 ?auto_156326 ) ) ( not ( = ?auto_156320 ?auto_156325 ) ) ( not ( = ?auto_156320 ?auto_156324 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_156326 ?auto_156325 ?auto_156324 ?auto_156323 ?auto_156322 )
      ( MAKE-4PILE ?auto_156319 ?auto_156320 ?auto_156321 ?auto_156322 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156327 - BLOCK
      ?auto_156328 - BLOCK
      ?auto_156329 - BLOCK
      ?auto_156330 - BLOCK
    )
    :vars
    (
      ?auto_156333 - BLOCK
      ?auto_156334 - BLOCK
      ?auto_156332 - BLOCK
      ?auto_156331 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_156327 ) ( not ( = ?auto_156327 ?auto_156328 ) ) ( not ( = ?auto_156327 ?auto_156329 ) ) ( not ( = ?auto_156327 ?auto_156330 ) ) ( not ( = ?auto_156328 ?auto_156329 ) ) ( not ( = ?auto_156328 ?auto_156330 ) ) ( not ( = ?auto_156329 ?auto_156330 ) ) ( ON ?auto_156330 ?auto_156333 ) ( not ( = ?auto_156327 ?auto_156333 ) ) ( not ( = ?auto_156328 ?auto_156333 ) ) ( not ( = ?auto_156329 ?auto_156333 ) ) ( not ( = ?auto_156330 ?auto_156333 ) ) ( ON ?auto_156329 ?auto_156330 ) ( CLEAR ?auto_156329 ) ( ON-TABLE ?auto_156334 ) ( ON ?auto_156332 ?auto_156334 ) ( ON ?auto_156331 ?auto_156332 ) ( ON ?auto_156333 ?auto_156331 ) ( not ( = ?auto_156334 ?auto_156332 ) ) ( not ( = ?auto_156334 ?auto_156331 ) ) ( not ( = ?auto_156334 ?auto_156333 ) ) ( not ( = ?auto_156334 ?auto_156330 ) ) ( not ( = ?auto_156334 ?auto_156329 ) ) ( not ( = ?auto_156332 ?auto_156331 ) ) ( not ( = ?auto_156332 ?auto_156333 ) ) ( not ( = ?auto_156332 ?auto_156330 ) ) ( not ( = ?auto_156332 ?auto_156329 ) ) ( not ( = ?auto_156331 ?auto_156333 ) ) ( not ( = ?auto_156331 ?auto_156330 ) ) ( not ( = ?auto_156331 ?auto_156329 ) ) ( not ( = ?auto_156327 ?auto_156334 ) ) ( not ( = ?auto_156327 ?auto_156332 ) ) ( not ( = ?auto_156327 ?auto_156331 ) ) ( not ( = ?auto_156328 ?auto_156334 ) ) ( not ( = ?auto_156328 ?auto_156332 ) ) ( not ( = ?auto_156328 ?auto_156331 ) ) ( HOLDING ?auto_156328 ) ( CLEAR ?auto_156327 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_156327 ?auto_156328 )
      ( MAKE-4PILE ?auto_156327 ?auto_156328 ?auto_156329 ?auto_156330 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156335 - BLOCK
      ?auto_156336 - BLOCK
      ?auto_156337 - BLOCK
      ?auto_156338 - BLOCK
    )
    :vars
    (
      ?auto_156342 - BLOCK
      ?auto_156341 - BLOCK
      ?auto_156340 - BLOCK
      ?auto_156339 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_156335 ) ( not ( = ?auto_156335 ?auto_156336 ) ) ( not ( = ?auto_156335 ?auto_156337 ) ) ( not ( = ?auto_156335 ?auto_156338 ) ) ( not ( = ?auto_156336 ?auto_156337 ) ) ( not ( = ?auto_156336 ?auto_156338 ) ) ( not ( = ?auto_156337 ?auto_156338 ) ) ( ON ?auto_156338 ?auto_156342 ) ( not ( = ?auto_156335 ?auto_156342 ) ) ( not ( = ?auto_156336 ?auto_156342 ) ) ( not ( = ?auto_156337 ?auto_156342 ) ) ( not ( = ?auto_156338 ?auto_156342 ) ) ( ON ?auto_156337 ?auto_156338 ) ( ON-TABLE ?auto_156341 ) ( ON ?auto_156340 ?auto_156341 ) ( ON ?auto_156339 ?auto_156340 ) ( ON ?auto_156342 ?auto_156339 ) ( not ( = ?auto_156341 ?auto_156340 ) ) ( not ( = ?auto_156341 ?auto_156339 ) ) ( not ( = ?auto_156341 ?auto_156342 ) ) ( not ( = ?auto_156341 ?auto_156338 ) ) ( not ( = ?auto_156341 ?auto_156337 ) ) ( not ( = ?auto_156340 ?auto_156339 ) ) ( not ( = ?auto_156340 ?auto_156342 ) ) ( not ( = ?auto_156340 ?auto_156338 ) ) ( not ( = ?auto_156340 ?auto_156337 ) ) ( not ( = ?auto_156339 ?auto_156342 ) ) ( not ( = ?auto_156339 ?auto_156338 ) ) ( not ( = ?auto_156339 ?auto_156337 ) ) ( not ( = ?auto_156335 ?auto_156341 ) ) ( not ( = ?auto_156335 ?auto_156340 ) ) ( not ( = ?auto_156335 ?auto_156339 ) ) ( not ( = ?auto_156336 ?auto_156341 ) ) ( not ( = ?auto_156336 ?auto_156340 ) ) ( not ( = ?auto_156336 ?auto_156339 ) ) ( CLEAR ?auto_156335 ) ( ON ?auto_156336 ?auto_156337 ) ( CLEAR ?auto_156336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_156341 ?auto_156340 ?auto_156339 ?auto_156342 ?auto_156338 ?auto_156337 )
      ( MAKE-4PILE ?auto_156335 ?auto_156336 ?auto_156337 ?auto_156338 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156343 - BLOCK
      ?auto_156344 - BLOCK
      ?auto_156345 - BLOCK
      ?auto_156346 - BLOCK
    )
    :vars
    (
      ?auto_156347 - BLOCK
      ?auto_156348 - BLOCK
      ?auto_156349 - BLOCK
      ?auto_156350 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156343 ?auto_156344 ) ) ( not ( = ?auto_156343 ?auto_156345 ) ) ( not ( = ?auto_156343 ?auto_156346 ) ) ( not ( = ?auto_156344 ?auto_156345 ) ) ( not ( = ?auto_156344 ?auto_156346 ) ) ( not ( = ?auto_156345 ?auto_156346 ) ) ( ON ?auto_156346 ?auto_156347 ) ( not ( = ?auto_156343 ?auto_156347 ) ) ( not ( = ?auto_156344 ?auto_156347 ) ) ( not ( = ?auto_156345 ?auto_156347 ) ) ( not ( = ?auto_156346 ?auto_156347 ) ) ( ON ?auto_156345 ?auto_156346 ) ( ON-TABLE ?auto_156348 ) ( ON ?auto_156349 ?auto_156348 ) ( ON ?auto_156350 ?auto_156349 ) ( ON ?auto_156347 ?auto_156350 ) ( not ( = ?auto_156348 ?auto_156349 ) ) ( not ( = ?auto_156348 ?auto_156350 ) ) ( not ( = ?auto_156348 ?auto_156347 ) ) ( not ( = ?auto_156348 ?auto_156346 ) ) ( not ( = ?auto_156348 ?auto_156345 ) ) ( not ( = ?auto_156349 ?auto_156350 ) ) ( not ( = ?auto_156349 ?auto_156347 ) ) ( not ( = ?auto_156349 ?auto_156346 ) ) ( not ( = ?auto_156349 ?auto_156345 ) ) ( not ( = ?auto_156350 ?auto_156347 ) ) ( not ( = ?auto_156350 ?auto_156346 ) ) ( not ( = ?auto_156350 ?auto_156345 ) ) ( not ( = ?auto_156343 ?auto_156348 ) ) ( not ( = ?auto_156343 ?auto_156349 ) ) ( not ( = ?auto_156343 ?auto_156350 ) ) ( not ( = ?auto_156344 ?auto_156348 ) ) ( not ( = ?auto_156344 ?auto_156349 ) ) ( not ( = ?auto_156344 ?auto_156350 ) ) ( ON ?auto_156344 ?auto_156345 ) ( CLEAR ?auto_156344 ) ( HOLDING ?auto_156343 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_156343 )
      ( MAKE-4PILE ?auto_156343 ?auto_156344 ?auto_156345 ?auto_156346 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156351 - BLOCK
      ?auto_156352 - BLOCK
      ?auto_156353 - BLOCK
      ?auto_156354 - BLOCK
    )
    :vars
    (
      ?auto_156356 - BLOCK
      ?auto_156358 - BLOCK
      ?auto_156357 - BLOCK
      ?auto_156355 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156351 ?auto_156352 ) ) ( not ( = ?auto_156351 ?auto_156353 ) ) ( not ( = ?auto_156351 ?auto_156354 ) ) ( not ( = ?auto_156352 ?auto_156353 ) ) ( not ( = ?auto_156352 ?auto_156354 ) ) ( not ( = ?auto_156353 ?auto_156354 ) ) ( ON ?auto_156354 ?auto_156356 ) ( not ( = ?auto_156351 ?auto_156356 ) ) ( not ( = ?auto_156352 ?auto_156356 ) ) ( not ( = ?auto_156353 ?auto_156356 ) ) ( not ( = ?auto_156354 ?auto_156356 ) ) ( ON ?auto_156353 ?auto_156354 ) ( ON-TABLE ?auto_156358 ) ( ON ?auto_156357 ?auto_156358 ) ( ON ?auto_156355 ?auto_156357 ) ( ON ?auto_156356 ?auto_156355 ) ( not ( = ?auto_156358 ?auto_156357 ) ) ( not ( = ?auto_156358 ?auto_156355 ) ) ( not ( = ?auto_156358 ?auto_156356 ) ) ( not ( = ?auto_156358 ?auto_156354 ) ) ( not ( = ?auto_156358 ?auto_156353 ) ) ( not ( = ?auto_156357 ?auto_156355 ) ) ( not ( = ?auto_156357 ?auto_156356 ) ) ( not ( = ?auto_156357 ?auto_156354 ) ) ( not ( = ?auto_156357 ?auto_156353 ) ) ( not ( = ?auto_156355 ?auto_156356 ) ) ( not ( = ?auto_156355 ?auto_156354 ) ) ( not ( = ?auto_156355 ?auto_156353 ) ) ( not ( = ?auto_156351 ?auto_156358 ) ) ( not ( = ?auto_156351 ?auto_156357 ) ) ( not ( = ?auto_156351 ?auto_156355 ) ) ( not ( = ?auto_156352 ?auto_156358 ) ) ( not ( = ?auto_156352 ?auto_156357 ) ) ( not ( = ?auto_156352 ?auto_156355 ) ) ( ON ?auto_156352 ?auto_156353 ) ( ON ?auto_156351 ?auto_156352 ) ( CLEAR ?auto_156351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_156358 ?auto_156357 ?auto_156355 ?auto_156356 ?auto_156354 ?auto_156353 ?auto_156352 )
      ( MAKE-4PILE ?auto_156351 ?auto_156352 ?auto_156353 ?auto_156354 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156359 - BLOCK
      ?auto_156360 - BLOCK
      ?auto_156361 - BLOCK
      ?auto_156362 - BLOCK
    )
    :vars
    (
      ?auto_156363 - BLOCK
      ?auto_156364 - BLOCK
      ?auto_156366 - BLOCK
      ?auto_156365 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156359 ?auto_156360 ) ) ( not ( = ?auto_156359 ?auto_156361 ) ) ( not ( = ?auto_156359 ?auto_156362 ) ) ( not ( = ?auto_156360 ?auto_156361 ) ) ( not ( = ?auto_156360 ?auto_156362 ) ) ( not ( = ?auto_156361 ?auto_156362 ) ) ( ON ?auto_156362 ?auto_156363 ) ( not ( = ?auto_156359 ?auto_156363 ) ) ( not ( = ?auto_156360 ?auto_156363 ) ) ( not ( = ?auto_156361 ?auto_156363 ) ) ( not ( = ?auto_156362 ?auto_156363 ) ) ( ON ?auto_156361 ?auto_156362 ) ( ON-TABLE ?auto_156364 ) ( ON ?auto_156366 ?auto_156364 ) ( ON ?auto_156365 ?auto_156366 ) ( ON ?auto_156363 ?auto_156365 ) ( not ( = ?auto_156364 ?auto_156366 ) ) ( not ( = ?auto_156364 ?auto_156365 ) ) ( not ( = ?auto_156364 ?auto_156363 ) ) ( not ( = ?auto_156364 ?auto_156362 ) ) ( not ( = ?auto_156364 ?auto_156361 ) ) ( not ( = ?auto_156366 ?auto_156365 ) ) ( not ( = ?auto_156366 ?auto_156363 ) ) ( not ( = ?auto_156366 ?auto_156362 ) ) ( not ( = ?auto_156366 ?auto_156361 ) ) ( not ( = ?auto_156365 ?auto_156363 ) ) ( not ( = ?auto_156365 ?auto_156362 ) ) ( not ( = ?auto_156365 ?auto_156361 ) ) ( not ( = ?auto_156359 ?auto_156364 ) ) ( not ( = ?auto_156359 ?auto_156366 ) ) ( not ( = ?auto_156359 ?auto_156365 ) ) ( not ( = ?auto_156360 ?auto_156364 ) ) ( not ( = ?auto_156360 ?auto_156366 ) ) ( not ( = ?auto_156360 ?auto_156365 ) ) ( ON ?auto_156360 ?auto_156361 ) ( HOLDING ?auto_156359 ) ( CLEAR ?auto_156360 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_156364 ?auto_156366 ?auto_156365 ?auto_156363 ?auto_156362 ?auto_156361 ?auto_156360 ?auto_156359 )
      ( MAKE-4PILE ?auto_156359 ?auto_156360 ?auto_156361 ?auto_156362 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156367 - BLOCK
      ?auto_156368 - BLOCK
      ?auto_156369 - BLOCK
      ?auto_156370 - BLOCK
    )
    :vars
    (
      ?auto_156372 - BLOCK
      ?auto_156374 - BLOCK
      ?auto_156373 - BLOCK
      ?auto_156371 - BLOCK
      ?auto_156375 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156367 ?auto_156368 ) ) ( not ( = ?auto_156367 ?auto_156369 ) ) ( not ( = ?auto_156367 ?auto_156370 ) ) ( not ( = ?auto_156368 ?auto_156369 ) ) ( not ( = ?auto_156368 ?auto_156370 ) ) ( not ( = ?auto_156369 ?auto_156370 ) ) ( ON ?auto_156370 ?auto_156372 ) ( not ( = ?auto_156367 ?auto_156372 ) ) ( not ( = ?auto_156368 ?auto_156372 ) ) ( not ( = ?auto_156369 ?auto_156372 ) ) ( not ( = ?auto_156370 ?auto_156372 ) ) ( ON ?auto_156369 ?auto_156370 ) ( ON-TABLE ?auto_156374 ) ( ON ?auto_156373 ?auto_156374 ) ( ON ?auto_156371 ?auto_156373 ) ( ON ?auto_156372 ?auto_156371 ) ( not ( = ?auto_156374 ?auto_156373 ) ) ( not ( = ?auto_156374 ?auto_156371 ) ) ( not ( = ?auto_156374 ?auto_156372 ) ) ( not ( = ?auto_156374 ?auto_156370 ) ) ( not ( = ?auto_156374 ?auto_156369 ) ) ( not ( = ?auto_156373 ?auto_156371 ) ) ( not ( = ?auto_156373 ?auto_156372 ) ) ( not ( = ?auto_156373 ?auto_156370 ) ) ( not ( = ?auto_156373 ?auto_156369 ) ) ( not ( = ?auto_156371 ?auto_156372 ) ) ( not ( = ?auto_156371 ?auto_156370 ) ) ( not ( = ?auto_156371 ?auto_156369 ) ) ( not ( = ?auto_156367 ?auto_156374 ) ) ( not ( = ?auto_156367 ?auto_156373 ) ) ( not ( = ?auto_156367 ?auto_156371 ) ) ( not ( = ?auto_156368 ?auto_156374 ) ) ( not ( = ?auto_156368 ?auto_156373 ) ) ( not ( = ?auto_156368 ?auto_156371 ) ) ( ON ?auto_156368 ?auto_156369 ) ( CLEAR ?auto_156368 ) ( ON ?auto_156367 ?auto_156375 ) ( CLEAR ?auto_156367 ) ( HAND-EMPTY ) ( not ( = ?auto_156367 ?auto_156375 ) ) ( not ( = ?auto_156368 ?auto_156375 ) ) ( not ( = ?auto_156369 ?auto_156375 ) ) ( not ( = ?auto_156370 ?auto_156375 ) ) ( not ( = ?auto_156372 ?auto_156375 ) ) ( not ( = ?auto_156374 ?auto_156375 ) ) ( not ( = ?auto_156373 ?auto_156375 ) ) ( not ( = ?auto_156371 ?auto_156375 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_156367 ?auto_156375 )
      ( MAKE-4PILE ?auto_156367 ?auto_156368 ?auto_156369 ?auto_156370 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156376 - BLOCK
      ?auto_156377 - BLOCK
      ?auto_156378 - BLOCK
      ?auto_156379 - BLOCK
    )
    :vars
    (
      ?auto_156384 - BLOCK
      ?auto_156381 - BLOCK
      ?auto_156382 - BLOCK
      ?auto_156383 - BLOCK
      ?auto_156380 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156376 ?auto_156377 ) ) ( not ( = ?auto_156376 ?auto_156378 ) ) ( not ( = ?auto_156376 ?auto_156379 ) ) ( not ( = ?auto_156377 ?auto_156378 ) ) ( not ( = ?auto_156377 ?auto_156379 ) ) ( not ( = ?auto_156378 ?auto_156379 ) ) ( ON ?auto_156379 ?auto_156384 ) ( not ( = ?auto_156376 ?auto_156384 ) ) ( not ( = ?auto_156377 ?auto_156384 ) ) ( not ( = ?auto_156378 ?auto_156384 ) ) ( not ( = ?auto_156379 ?auto_156384 ) ) ( ON ?auto_156378 ?auto_156379 ) ( ON-TABLE ?auto_156381 ) ( ON ?auto_156382 ?auto_156381 ) ( ON ?auto_156383 ?auto_156382 ) ( ON ?auto_156384 ?auto_156383 ) ( not ( = ?auto_156381 ?auto_156382 ) ) ( not ( = ?auto_156381 ?auto_156383 ) ) ( not ( = ?auto_156381 ?auto_156384 ) ) ( not ( = ?auto_156381 ?auto_156379 ) ) ( not ( = ?auto_156381 ?auto_156378 ) ) ( not ( = ?auto_156382 ?auto_156383 ) ) ( not ( = ?auto_156382 ?auto_156384 ) ) ( not ( = ?auto_156382 ?auto_156379 ) ) ( not ( = ?auto_156382 ?auto_156378 ) ) ( not ( = ?auto_156383 ?auto_156384 ) ) ( not ( = ?auto_156383 ?auto_156379 ) ) ( not ( = ?auto_156383 ?auto_156378 ) ) ( not ( = ?auto_156376 ?auto_156381 ) ) ( not ( = ?auto_156376 ?auto_156382 ) ) ( not ( = ?auto_156376 ?auto_156383 ) ) ( not ( = ?auto_156377 ?auto_156381 ) ) ( not ( = ?auto_156377 ?auto_156382 ) ) ( not ( = ?auto_156377 ?auto_156383 ) ) ( ON ?auto_156376 ?auto_156380 ) ( CLEAR ?auto_156376 ) ( not ( = ?auto_156376 ?auto_156380 ) ) ( not ( = ?auto_156377 ?auto_156380 ) ) ( not ( = ?auto_156378 ?auto_156380 ) ) ( not ( = ?auto_156379 ?auto_156380 ) ) ( not ( = ?auto_156384 ?auto_156380 ) ) ( not ( = ?auto_156381 ?auto_156380 ) ) ( not ( = ?auto_156382 ?auto_156380 ) ) ( not ( = ?auto_156383 ?auto_156380 ) ) ( HOLDING ?auto_156377 ) ( CLEAR ?auto_156378 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_156381 ?auto_156382 ?auto_156383 ?auto_156384 ?auto_156379 ?auto_156378 ?auto_156377 )
      ( MAKE-4PILE ?auto_156376 ?auto_156377 ?auto_156378 ?auto_156379 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156385 - BLOCK
      ?auto_156386 - BLOCK
      ?auto_156387 - BLOCK
      ?auto_156388 - BLOCK
    )
    :vars
    (
      ?auto_156389 - BLOCK
      ?auto_156392 - BLOCK
      ?auto_156391 - BLOCK
      ?auto_156393 - BLOCK
      ?auto_156390 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156385 ?auto_156386 ) ) ( not ( = ?auto_156385 ?auto_156387 ) ) ( not ( = ?auto_156385 ?auto_156388 ) ) ( not ( = ?auto_156386 ?auto_156387 ) ) ( not ( = ?auto_156386 ?auto_156388 ) ) ( not ( = ?auto_156387 ?auto_156388 ) ) ( ON ?auto_156388 ?auto_156389 ) ( not ( = ?auto_156385 ?auto_156389 ) ) ( not ( = ?auto_156386 ?auto_156389 ) ) ( not ( = ?auto_156387 ?auto_156389 ) ) ( not ( = ?auto_156388 ?auto_156389 ) ) ( ON ?auto_156387 ?auto_156388 ) ( ON-TABLE ?auto_156392 ) ( ON ?auto_156391 ?auto_156392 ) ( ON ?auto_156393 ?auto_156391 ) ( ON ?auto_156389 ?auto_156393 ) ( not ( = ?auto_156392 ?auto_156391 ) ) ( not ( = ?auto_156392 ?auto_156393 ) ) ( not ( = ?auto_156392 ?auto_156389 ) ) ( not ( = ?auto_156392 ?auto_156388 ) ) ( not ( = ?auto_156392 ?auto_156387 ) ) ( not ( = ?auto_156391 ?auto_156393 ) ) ( not ( = ?auto_156391 ?auto_156389 ) ) ( not ( = ?auto_156391 ?auto_156388 ) ) ( not ( = ?auto_156391 ?auto_156387 ) ) ( not ( = ?auto_156393 ?auto_156389 ) ) ( not ( = ?auto_156393 ?auto_156388 ) ) ( not ( = ?auto_156393 ?auto_156387 ) ) ( not ( = ?auto_156385 ?auto_156392 ) ) ( not ( = ?auto_156385 ?auto_156391 ) ) ( not ( = ?auto_156385 ?auto_156393 ) ) ( not ( = ?auto_156386 ?auto_156392 ) ) ( not ( = ?auto_156386 ?auto_156391 ) ) ( not ( = ?auto_156386 ?auto_156393 ) ) ( ON ?auto_156385 ?auto_156390 ) ( not ( = ?auto_156385 ?auto_156390 ) ) ( not ( = ?auto_156386 ?auto_156390 ) ) ( not ( = ?auto_156387 ?auto_156390 ) ) ( not ( = ?auto_156388 ?auto_156390 ) ) ( not ( = ?auto_156389 ?auto_156390 ) ) ( not ( = ?auto_156392 ?auto_156390 ) ) ( not ( = ?auto_156391 ?auto_156390 ) ) ( not ( = ?auto_156393 ?auto_156390 ) ) ( CLEAR ?auto_156387 ) ( ON ?auto_156386 ?auto_156385 ) ( CLEAR ?auto_156386 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_156390 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_156390 ?auto_156385 )
      ( MAKE-4PILE ?auto_156385 ?auto_156386 ?auto_156387 ?auto_156388 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156394 - BLOCK
      ?auto_156395 - BLOCK
      ?auto_156396 - BLOCK
      ?auto_156397 - BLOCK
    )
    :vars
    (
      ?auto_156400 - BLOCK
      ?auto_156399 - BLOCK
      ?auto_156401 - BLOCK
      ?auto_156398 - BLOCK
      ?auto_156402 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156394 ?auto_156395 ) ) ( not ( = ?auto_156394 ?auto_156396 ) ) ( not ( = ?auto_156394 ?auto_156397 ) ) ( not ( = ?auto_156395 ?auto_156396 ) ) ( not ( = ?auto_156395 ?auto_156397 ) ) ( not ( = ?auto_156396 ?auto_156397 ) ) ( ON ?auto_156397 ?auto_156400 ) ( not ( = ?auto_156394 ?auto_156400 ) ) ( not ( = ?auto_156395 ?auto_156400 ) ) ( not ( = ?auto_156396 ?auto_156400 ) ) ( not ( = ?auto_156397 ?auto_156400 ) ) ( ON-TABLE ?auto_156399 ) ( ON ?auto_156401 ?auto_156399 ) ( ON ?auto_156398 ?auto_156401 ) ( ON ?auto_156400 ?auto_156398 ) ( not ( = ?auto_156399 ?auto_156401 ) ) ( not ( = ?auto_156399 ?auto_156398 ) ) ( not ( = ?auto_156399 ?auto_156400 ) ) ( not ( = ?auto_156399 ?auto_156397 ) ) ( not ( = ?auto_156399 ?auto_156396 ) ) ( not ( = ?auto_156401 ?auto_156398 ) ) ( not ( = ?auto_156401 ?auto_156400 ) ) ( not ( = ?auto_156401 ?auto_156397 ) ) ( not ( = ?auto_156401 ?auto_156396 ) ) ( not ( = ?auto_156398 ?auto_156400 ) ) ( not ( = ?auto_156398 ?auto_156397 ) ) ( not ( = ?auto_156398 ?auto_156396 ) ) ( not ( = ?auto_156394 ?auto_156399 ) ) ( not ( = ?auto_156394 ?auto_156401 ) ) ( not ( = ?auto_156394 ?auto_156398 ) ) ( not ( = ?auto_156395 ?auto_156399 ) ) ( not ( = ?auto_156395 ?auto_156401 ) ) ( not ( = ?auto_156395 ?auto_156398 ) ) ( ON ?auto_156394 ?auto_156402 ) ( not ( = ?auto_156394 ?auto_156402 ) ) ( not ( = ?auto_156395 ?auto_156402 ) ) ( not ( = ?auto_156396 ?auto_156402 ) ) ( not ( = ?auto_156397 ?auto_156402 ) ) ( not ( = ?auto_156400 ?auto_156402 ) ) ( not ( = ?auto_156399 ?auto_156402 ) ) ( not ( = ?auto_156401 ?auto_156402 ) ) ( not ( = ?auto_156398 ?auto_156402 ) ) ( ON ?auto_156395 ?auto_156394 ) ( CLEAR ?auto_156395 ) ( ON-TABLE ?auto_156402 ) ( HOLDING ?auto_156396 ) ( CLEAR ?auto_156397 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_156399 ?auto_156401 ?auto_156398 ?auto_156400 ?auto_156397 ?auto_156396 )
      ( MAKE-4PILE ?auto_156394 ?auto_156395 ?auto_156396 ?auto_156397 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156403 - BLOCK
      ?auto_156404 - BLOCK
      ?auto_156405 - BLOCK
      ?auto_156406 - BLOCK
    )
    :vars
    (
      ?auto_156408 - BLOCK
      ?auto_156407 - BLOCK
      ?auto_156410 - BLOCK
      ?auto_156409 - BLOCK
      ?auto_156411 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156403 ?auto_156404 ) ) ( not ( = ?auto_156403 ?auto_156405 ) ) ( not ( = ?auto_156403 ?auto_156406 ) ) ( not ( = ?auto_156404 ?auto_156405 ) ) ( not ( = ?auto_156404 ?auto_156406 ) ) ( not ( = ?auto_156405 ?auto_156406 ) ) ( ON ?auto_156406 ?auto_156408 ) ( not ( = ?auto_156403 ?auto_156408 ) ) ( not ( = ?auto_156404 ?auto_156408 ) ) ( not ( = ?auto_156405 ?auto_156408 ) ) ( not ( = ?auto_156406 ?auto_156408 ) ) ( ON-TABLE ?auto_156407 ) ( ON ?auto_156410 ?auto_156407 ) ( ON ?auto_156409 ?auto_156410 ) ( ON ?auto_156408 ?auto_156409 ) ( not ( = ?auto_156407 ?auto_156410 ) ) ( not ( = ?auto_156407 ?auto_156409 ) ) ( not ( = ?auto_156407 ?auto_156408 ) ) ( not ( = ?auto_156407 ?auto_156406 ) ) ( not ( = ?auto_156407 ?auto_156405 ) ) ( not ( = ?auto_156410 ?auto_156409 ) ) ( not ( = ?auto_156410 ?auto_156408 ) ) ( not ( = ?auto_156410 ?auto_156406 ) ) ( not ( = ?auto_156410 ?auto_156405 ) ) ( not ( = ?auto_156409 ?auto_156408 ) ) ( not ( = ?auto_156409 ?auto_156406 ) ) ( not ( = ?auto_156409 ?auto_156405 ) ) ( not ( = ?auto_156403 ?auto_156407 ) ) ( not ( = ?auto_156403 ?auto_156410 ) ) ( not ( = ?auto_156403 ?auto_156409 ) ) ( not ( = ?auto_156404 ?auto_156407 ) ) ( not ( = ?auto_156404 ?auto_156410 ) ) ( not ( = ?auto_156404 ?auto_156409 ) ) ( ON ?auto_156403 ?auto_156411 ) ( not ( = ?auto_156403 ?auto_156411 ) ) ( not ( = ?auto_156404 ?auto_156411 ) ) ( not ( = ?auto_156405 ?auto_156411 ) ) ( not ( = ?auto_156406 ?auto_156411 ) ) ( not ( = ?auto_156408 ?auto_156411 ) ) ( not ( = ?auto_156407 ?auto_156411 ) ) ( not ( = ?auto_156410 ?auto_156411 ) ) ( not ( = ?auto_156409 ?auto_156411 ) ) ( ON ?auto_156404 ?auto_156403 ) ( ON-TABLE ?auto_156411 ) ( CLEAR ?auto_156406 ) ( ON ?auto_156405 ?auto_156404 ) ( CLEAR ?auto_156405 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_156411 ?auto_156403 ?auto_156404 )
      ( MAKE-4PILE ?auto_156403 ?auto_156404 ?auto_156405 ?auto_156406 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156412 - BLOCK
      ?auto_156413 - BLOCK
      ?auto_156414 - BLOCK
      ?auto_156415 - BLOCK
    )
    :vars
    (
      ?auto_156420 - BLOCK
      ?auto_156419 - BLOCK
      ?auto_156417 - BLOCK
      ?auto_156416 - BLOCK
      ?auto_156418 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156412 ?auto_156413 ) ) ( not ( = ?auto_156412 ?auto_156414 ) ) ( not ( = ?auto_156412 ?auto_156415 ) ) ( not ( = ?auto_156413 ?auto_156414 ) ) ( not ( = ?auto_156413 ?auto_156415 ) ) ( not ( = ?auto_156414 ?auto_156415 ) ) ( not ( = ?auto_156412 ?auto_156420 ) ) ( not ( = ?auto_156413 ?auto_156420 ) ) ( not ( = ?auto_156414 ?auto_156420 ) ) ( not ( = ?auto_156415 ?auto_156420 ) ) ( ON-TABLE ?auto_156419 ) ( ON ?auto_156417 ?auto_156419 ) ( ON ?auto_156416 ?auto_156417 ) ( ON ?auto_156420 ?auto_156416 ) ( not ( = ?auto_156419 ?auto_156417 ) ) ( not ( = ?auto_156419 ?auto_156416 ) ) ( not ( = ?auto_156419 ?auto_156420 ) ) ( not ( = ?auto_156419 ?auto_156415 ) ) ( not ( = ?auto_156419 ?auto_156414 ) ) ( not ( = ?auto_156417 ?auto_156416 ) ) ( not ( = ?auto_156417 ?auto_156420 ) ) ( not ( = ?auto_156417 ?auto_156415 ) ) ( not ( = ?auto_156417 ?auto_156414 ) ) ( not ( = ?auto_156416 ?auto_156420 ) ) ( not ( = ?auto_156416 ?auto_156415 ) ) ( not ( = ?auto_156416 ?auto_156414 ) ) ( not ( = ?auto_156412 ?auto_156419 ) ) ( not ( = ?auto_156412 ?auto_156417 ) ) ( not ( = ?auto_156412 ?auto_156416 ) ) ( not ( = ?auto_156413 ?auto_156419 ) ) ( not ( = ?auto_156413 ?auto_156417 ) ) ( not ( = ?auto_156413 ?auto_156416 ) ) ( ON ?auto_156412 ?auto_156418 ) ( not ( = ?auto_156412 ?auto_156418 ) ) ( not ( = ?auto_156413 ?auto_156418 ) ) ( not ( = ?auto_156414 ?auto_156418 ) ) ( not ( = ?auto_156415 ?auto_156418 ) ) ( not ( = ?auto_156420 ?auto_156418 ) ) ( not ( = ?auto_156419 ?auto_156418 ) ) ( not ( = ?auto_156417 ?auto_156418 ) ) ( not ( = ?auto_156416 ?auto_156418 ) ) ( ON ?auto_156413 ?auto_156412 ) ( ON-TABLE ?auto_156418 ) ( ON ?auto_156414 ?auto_156413 ) ( CLEAR ?auto_156414 ) ( HOLDING ?auto_156415 ) ( CLEAR ?auto_156420 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_156419 ?auto_156417 ?auto_156416 ?auto_156420 ?auto_156415 )
      ( MAKE-4PILE ?auto_156412 ?auto_156413 ?auto_156414 ?auto_156415 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156421 - BLOCK
      ?auto_156422 - BLOCK
      ?auto_156423 - BLOCK
      ?auto_156424 - BLOCK
    )
    :vars
    (
      ?auto_156427 - BLOCK
      ?auto_156428 - BLOCK
      ?auto_156425 - BLOCK
      ?auto_156426 - BLOCK
      ?auto_156429 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156421 ?auto_156422 ) ) ( not ( = ?auto_156421 ?auto_156423 ) ) ( not ( = ?auto_156421 ?auto_156424 ) ) ( not ( = ?auto_156422 ?auto_156423 ) ) ( not ( = ?auto_156422 ?auto_156424 ) ) ( not ( = ?auto_156423 ?auto_156424 ) ) ( not ( = ?auto_156421 ?auto_156427 ) ) ( not ( = ?auto_156422 ?auto_156427 ) ) ( not ( = ?auto_156423 ?auto_156427 ) ) ( not ( = ?auto_156424 ?auto_156427 ) ) ( ON-TABLE ?auto_156428 ) ( ON ?auto_156425 ?auto_156428 ) ( ON ?auto_156426 ?auto_156425 ) ( ON ?auto_156427 ?auto_156426 ) ( not ( = ?auto_156428 ?auto_156425 ) ) ( not ( = ?auto_156428 ?auto_156426 ) ) ( not ( = ?auto_156428 ?auto_156427 ) ) ( not ( = ?auto_156428 ?auto_156424 ) ) ( not ( = ?auto_156428 ?auto_156423 ) ) ( not ( = ?auto_156425 ?auto_156426 ) ) ( not ( = ?auto_156425 ?auto_156427 ) ) ( not ( = ?auto_156425 ?auto_156424 ) ) ( not ( = ?auto_156425 ?auto_156423 ) ) ( not ( = ?auto_156426 ?auto_156427 ) ) ( not ( = ?auto_156426 ?auto_156424 ) ) ( not ( = ?auto_156426 ?auto_156423 ) ) ( not ( = ?auto_156421 ?auto_156428 ) ) ( not ( = ?auto_156421 ?auto_156425 ) ) ( not ( = ?auto_156421 ?auto_156426 ) ) ( not ( = ?auto_156422 ?auto_156428 ) ) ( not ( = ?auto_156422 ?auto_156425 ) ) ( not ( = ?auto_156422 ?auto_156426 ) ) ( ON ?auto_156421 ?auto_156429 ) ( not ( = ?auto_156421 ?auto_156429 ) ) ( not ( = ?auto_156422 ?auto_156429 ) ) ( not ( = ?auto_156423 ?auto_156429 ) ) ( not ( = ?auto_156424 ?auto_156429 ) ) ( not ( = ?auto_156427 ?auto_156429 ) ) ( not ( = ?auto_156428 ?auto_156429 ) ) ( not ( = ?auto_156425 ?auto_156429 ) ) ( not ( = ?auto_156426 ?auto_156429 ) ) ( ON ?auto_156422 ?auto_156421 ) ( ON-TABLE ?auto_156429 ) ( ON ?auto_156423 ?auto_156422 ) ( CLEAR ?auto_156427 ) ( ON ?auto_156424 ?auto_156423 ) ( CLEAR ?auto_156424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_156429 ?auto_156421 ?auto_156422 ?auto_156423 )
      ( MAKE-4PILE ?auto_156421 ?auto_156422 ?auto_156423 ?auto_156424 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156430 - BLOCK
      ?auto_156431 - BLOCK
      ?auto_156432 - BLOCK
      ?auto_156433 - BLOCK
    )
    :vars
    (
      ?auto_156437 - BLOCK
      ?auto_156438 - BLOCK
      ?auto_156436 - BLOCK
      ?auto_156435 - BLOCK
      ?auto_156434 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156430 ?auto_156431 ) ) ( not ( = ?auto_156430 ?auto_156432 ) ) ( not ( = ?auto_156430 ?auto_156433 ) ) ( not ( = ?auto_156431 ?auto_156432 ) ) ( not ( = ?auto_156431 ?auto_156433 ) ) ( not ( = ?auto_156432 ?auto_156433 ) ) ( not ( = ?auto_156430 ?auto_156437 ) ) ( not ( = ?auto_156431 ?auto_156437 ) ) ( not ( = ?auto_156432 ?auto_156437 ) ) ( not ( = ?auto_156433 ?auto_156437 ) ) ( ON-TABLE ?auto_156438 ) ( ON ?auto_156436 ?auto_156438 ) ( ON ?auto_156435 ?auto_156436 ) ( not ( = ?auto_156438 ?auto_156436 ) ) ( not ( = ?auto_156438 ?auto_156435 ) ) ( not ( = ?auto_156438 ?auto_156437 ) ) ( not ( = ?auto_156438 ?auto_156433 ) ) ( not ( = ?auto_156438 ?auto_156432 ) ) ( not ( = ?auto_156436 ?auto_156435 ) ) ( not ( = ?auto_156436 ?auto_156437 ) ) ( not ( = ?auto_156436 ?auto_156433 ) ) ( not ( = ?auto_156436 ?auto_156432 ) ) ( not ( = ?auto_156435 ?auto_156437 ) ) ( not ( = ?auto_156435 ?auto_156433 ) ) ( not ( = ?auto_156435 ?auto_156432 ) ) ( not ( = ?auto_156430 ?auto_156438 ) ) ( not ( = ?auto_156430 ?auto_156436 ) ) ( not ( = ?auto_156430 ?auto_156435 ) ) ( not ( = ?auto_156431 ?auto_156438 ) ) ( not ( = ?auto_156431 ?auto_156436 ) ) ( not ( = ?auto_156431 ?auto_156435 ) ) ( ON ?auto_156430 ?auto_156434 ) ( not ( = ?auto_156430 ?auto_156434 ) ) ( not ( = ?auto_156431 ?auto_156434 ) ) ( not ( = ?auto_156432 ?auto_156434 ) ) ( not ( = ?auto_156433 ?auto_156434 ) ) ( not ( = ?auto_156437 ?auto_156434 ) ) ( not ( = ?auto_156438 ?auto_156434 ) ) ( not ( = ?auto_156436 ?auto_156434 ) ) ( not ( = ?auto_156435 ?auto_156434 ) ) ( ON ?auto_156431 ?auto_156430 ) ( ON-TABLE ?auto_156434 ) ( ON ?auto_156432 ?auto_156431 ) ( ON ?auto_156433 ?auto_156432 ) ( CLEAR ?auto_156433 ) ( HOLDING ?auto_156437 ) ( CLEAR ?auto_156435 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_156438 ?auto_156436 ?auto_156435 ?auto_156437 )
      ( MAKE-4PILE ?auto_156430 ?auto_156431 ?auto_156432 ?auto_156433 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156439 - BLOCK
      ?auto_156440 - BLOCK
      ?auto_156441 - BLOCK
      ?auto_156442 - BLOCK
    )
    :vars
    (
      ?auto_156444 - BLOCK
      ?auto_156443 - BLOCK
      ?auto_156445 - BLOCK
      ?auto_156446 - BLOCK
      ?auto_156447 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156439 ?auto_156440 ) ) ( not ( = ?auto_156439 ?auto_156441 ) ) ( not ( = ?auto_156439 ?auto_156442 ) ) ( not ( = ?auto_156440 ?auto_156441 ) ) ( not ( = ?auto_156440 ?auto_156442 ) ) ( not ( = ?auto_156441 ?auto_156442 ) ) ( not ( = ?auto_156439 ?auto_156444 ) ) ( not ( = ?auto_156440 ?auto_156444 ) ) ( not ( = ?auto_156441 ?auto_156444 ) ) ( not ( = ?auto_156442 ?auto_156444 ) ) ( ON-TABLE ?auto_156443 ) ( ON ?auto_156445 ?auto_156443 ) ( ON ?auto_156446 ?auto_156445 ) ( not ( = ?auto_156443 ?auto_156445 ) ) ( not ( = ?auto_156443 ?auto_156446 ) ) ( not ( = ?auto_156443 ?auto_156444 ) ) ( not ( = ?auto_156443 ?auto_156442 ) ) ( not ( = ?auto_156443 ?auto_156441 ) ) ( not ( = ?auto_156445 ?auto_156446 ) ) ( not ( = ?auto_156445 ?auto_156444 ) ) ( not ( = ?auto_156445 ?auto_156442 ) ) ( not ( = ?auto_156445 ?auto_156441 ) ) ( not ( = ?auto_156446 ?auto_156444 ) ) ( not ( = ?auto_156446 ?auto_156442 ) ) ( not ( = ?auto_156446 ?auto_156441 ) ) ( not ( = ?auto_156439 ?auto_156443 ) ) ( not ( = ?auto_156439 ?auto_156445 ) ) ( not ( = ?auto_156439 ?auto_156446 ) ) ( not ( = ?auto_156440 ?auto_156443 ) ) ( not ( = ?auto_156440 ?auto_156445 ) ) ( not ( = ?auto_156440 ?auto_156446 ) ) ( ON ?auto_156439 ?auto_156447 ) ( not ( = ?auto_156439 ?auto_156447 ) ) ( not ( = ?auto_156440 ?auto_156447 ) ) ( not ( = ?auto_156441 ?auto_156447 ) ) ( not ( = ?auto_156442 ?auto_156447 ) ) ( not ( = ?auto_156444 ?auto_156447 ) ) ( not ( = ?auto_156443 ?auto_156447 ) ) ( not ( = ?auto_156445 ?auto_156447 ) ) ( not ( = ?auto_156446 ?auto_156447 ) ) ( ON ?auto_156440 ?auto_156439 ) ( ON-TABLE ?auto_156447 ) ( ON ?auto_156441 ?auto_156440 ) ( ON ?auto_156442 ?auto_156441 ) ( CLEAR ?auto_156446 ) ( ON ?auto_156444 ?auto_156442 ) ( CLEAR ?auto_156444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_156447 ?auto_156439 ?auto_156440 ?auto_156441 ?auto_156442 )
      ( MAKE-4PILE ?auto_156439 ?auto_156440 ?auto_156441 ?auto_156442 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156448 - BLOCK
      ?auto_156449 - BLOCK
      ?auto_156450 - BLOCK
      ?auto_156451 - BLOCK
    )
    :vars
    (
      ?auto_156454 - BLOCK
      ?auto_156452 - BLOCK
      ?auto_156455 - BLOCK
      ?auto_156453 - BLOCK
      ?auto_156456 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156448 ?auto_156449 ) ) ( not ( = ?auto_156448 ?auto_156450 ) ) ( not ( = ?auto_156448 ?auto_156451 ) ) ( not ( = ?auto_156449 ?auto_156450 ) ) ( not ( = ?auto_156449 ?auto_156451 ) ) ( not ( = ?auto_156450 ?auto_156451 ) ) ( not ( = ?auto_156448 ?auto_156454 ) ) ( not ( = ?auto_156449 ?auto_156454 ) ) ( not ( = ?auto_156450 ?auto_156454 ) ) ( not ( = ?auto_156451 ?auto_156454 ) ) ( ON-TABLE ?auto_156452 ) ( ON ?auto_156455 ?auto_156452 ) ( not ( = ?auto_156452 ?auto_156455 ) ) ( not ( = ?auto_156452 ?auto_156453 ) ) ( not ( = ?auto_156452 ?auto_156454 ) ) ( not ( = ?auto_156452 ?auto_156451 ) ) ( not ( = ?auto_156452 ?auto_156450 ) ) ( not ( = ?auto_156455 ?auto_156453 ) ) ( not ( = ?auto_156455 ?auto_156454 ) ) ( not ( = ?auto_156455 ?auto_156451 ) ) ( not ( = ?auto_156455 ?auto_156450 ) ) ( not ( = ?auto_156453 ?auto_156454 ) ) ( not ( = ?auto_156453 ?auto_156451 ) ) ( not ( = ?auto_156453 ?auto_156450 ) ) ( not ( = ?auto_156448 ?auto_156452 ) ) ( not ( = ?auto_156448 ?auto_156455 ) ) ( not ( = ?auto_156448 ?auto_156453 ) ) ( not ( = ?auto_156449 ?auto_156452 ) ) ( not ( = ?auto_156449 ?auto_156455 ) ) ( not ( = ?auto_156449 ?auto_156453 ) ) ( ON ?auto_156448 ?auto_156456 ) ( not ( = ?auto_156448 ?auto_156456 ) ) ( not ( = ?auto_156449 ?auto_156456 ) ) ( not ( = ?auto_156450 ?auto_156456 ) ) ( not ( = ?auto_156451 ?auto_156456 ) ) ( not ( = ?auto_156454 ?auto_156456 ) ) ( not ( = ?auto_156452 ?auto_156456 ) ) ( not ( = ?auto_156455 ?auto_156456 ) ) ( not ( = ?auto_156453 ?auto_156456 ) ) ( ON ?auto_156449 ?auto_156448 ) ( ON-TABLE ?auto_156456 ) ( ON ?auto_156450 ?auto_156449 ) ( ON ?auto_156451 ?auto_156450 ) ( ON ?auto_156454 ?auto_156451 ) ( CLEAR ?auto_156454 ) ( HOLDING ?auto_156453 ) ( CLEAR ?auto_156455 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_156452 ?auto_156455 ?auto_156453 )
      ( MAKE-4PILE ?auto_156448 ?auto_156449 ?auto_156450 ?auto_156451 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156457 - BLOCK
      ?auto_156458 - BLOCK
      ?auto_156459 - BLOCK
      ?auto_156460 - BLOCK
    )
    :vars
    (
      ?auto_156464 - BLOCK
      ?auto_156461 - BLOCK
      ?auto_156462 - BLOCK
      ?auto_156465 - BLOCK
      ?auto_156463 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156457 ?auto_156458 ) ) ( not ( = ?auto_156457 ?auto_156459 ) ) ( not ( = ?auto_156457 ?auto_156460 ) ) ( not ( = ?auto_156458 ?auto_156459 ) ) ( not ( = ?auto_156458 ?auto_156460 ) ) ( not ( = ?auto_156459 ?auto_156460 ) ) ( not ( = ?auto_156457 ?auto_156464 ) ) ( not ( = ?auto_156458 ?auto_156464 ) ) ( not ( = ?auto_156459 ?auto_156464 ) ) ( not ( = ?auto_156460 ?auto_156464 ) ) ( ON-TABLE ?auto_156461 ) ( ON ?auto_156462 ?auto_156461 ) ( not ( = ?auto_156461 ?auto_156462 ) ) ( not ( = ?auto_156461 ?auto_156465 ) ) ( not ( = ?auto_156461 ?auto_156464 ) ) ( not ( = ?auto_156461 ?auto_156460 ) ) ( not ( = ?auto_156461 ?auto_156459 ) ) ( not ( = ?auto_156462 ?auto_156465 ) ) ( not ( = ?auto_156462 ?auto_156464 ) ) ( not ( = ?auto_156462 ?auto_156460 ) ) ( not ( = ?auto_156462 ?auto_156459 ) ) ( not ( = ?auto_156465 ?auto_156464 ) ) ( not ( = ?auto_156465 ?auto_156460 ) ) ( not ( = ?auto_156465 ?auto_156459 ) ) ( not ( = ?auto_156457 ?auto_156461 ) ) ( not ( = ?auto_156457 ?auto_156462 ) ) ( not ( = ?auto_156457 ?auto_156465 ) ) ( not ( = ?auto_156458 ?auto_156461 ) ) ( not ( = ?auto_156458 ?auto_156462 ) ) ( not ( = ?auto_156458 ?auto_156465 ) ) ( ON ?auto_156457 ?auto_156463 ) ( not ( = ?auto_156457 ?auto_156463 ) ) ( not ( = ?auto_156458 ?auto_156463 ) ) ( not ( = ?auto_156459 ?auto_156463 ) ) ( not ( = ?auto_156460 ?auto_156463 ) ) ( not ( = ?auto_156464 ?auto_156463 ) ) ( not ( = ?auto_156461 ?auto_156463 ) ) ( not ( = ?auto_156462 ?auto_156463 ) ) ( not ( = ?auto_156465 ?auto_156463 ) ) ( ON ?auto_156458 ?auto_156457 ) ( ON-TABLE ?auto_156463 ) ( ON ?auto_156459 ?auto_156458 ) ( ON ?auto_156460 ?auto_156459 ) ( ON ?auto_156464 ?auto_156460 ) ( CLEAR ?auto_156462 ) ( ON ?auto_156465 ?auto_156464 ) ( CLEAR ?auto_156465 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_156463 ?auto_156457 ?auto_156458 ?auto_156459 ?auto_156460 ?auto_156464 )
      ( MAKE-4PILE ?auto_156457 ?auto_156458 ?auto_156459 ?auto_156460 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156466 - BLOCK
      ?auto_156467 - BLOCK
      ?auto_156468 - BLOCK
      ?auto_156469 - BLOCK
    )
    :vars
    (
      ?auto_156473 - BLOCK
      ?auto_156474 - BLOCK
      ?auto_156471 - BLOCK
      ?auto_156472 - BLOCK
      ?auto_156470 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156466 ?auto_156467 ) ) ( not ( = ?auto_156466 ?auto_156468 ) ) ( not ( = ?auto_156466 ?auto_156469 ) ) ( not ( = ?auto_156467 ?auto_156468 ) ) ( not ( = ?auto_156467 ?auto_156469 ) ) ( not ( = ?auto_156468 ?auto_156469 ) ) ( not ( = ?auto_156466 ?auto_156473 ) ) ( not ( = ?auto_156467 ?auto_156473 ) ) ( not ( = ?auto_156468 ?auto_156473 ) ) ( not ( = ?auto_156469 ?auto_156473 ) ) ( ON-TABLE ?auto_156474 ) ( not ( = ?auto_156474 ?auto_156471 ) ) ( not ( = ?auto_156474 ?auto_156472 ) ) ( not ( = ?auto_156474 ?auto_156473 ) ) ( not ( = ?auto_156474 ?auto_156469 ) ) ( not ( = ?auto_156474 ?auto_156468 ) ) ( not ( = ?auto_156471 ?auto_156472 ) ) ( not ( = ?auto_156471 ?auto_156473 ) ) ( not ( = ?auto_156471 ?auto_156469 ) ) ( not ( = ?auto_156471 ?auto_156468 ) ) ( not ( = ?auto_156472 ?auto_156473 ) ) ( not ( = ?auto_156472 ?auto_156469 ) ) ( not ( = ?auto_156472 ?auto_156468 ) ) ( not ( = ?auto_156466 ?auto_156474 ) ) ( not ( = ?auto_156466 ?auto_156471 ) ) ( not ( = ?auto_156466 ?auto_156472 ) ) ( not ( = ?auto_156467 ?auto_156474 ) ) ( not ( = ?auto_156467 ?auto_156471 ) ) ( not ( = ?auto_156467 ?auto_156472 ) ) ( ON ?auto_156466 ?auto_156470 ) ( not ( = ?auto_156466 ?auto_156470 ) ) ( not ( = ?auto_156467 ?auto_156470 ) ) ( not ( = ?auto_156468 ?auto_156470 ) ) ( not ( = ?auto_156469 ?auto_156470 ) ) ( not ( = ?auto_156473 ?auto_156470 ) ) ( not ( = ?auto_156474 ?auto_156470 ) ) ( not ( = ?auto_156471 ?auto_156470 ) ) ( not ( = ?auto_156472 ?auto_156470 ) ) ( ON ?auto_156467 ?auto_156466 ) ( ON-TABLE ?auto_156470 ) ( ON ?auto_156468 ?auto_156467 ) ( ON ?auto_156469 ?auto_156468 ) ( ON ?auto_156473 ?auto_156469 ) ( ON ?auto_156472 ?auto_156473 ) ( CLEAR ?auto_156472 ) ( HOLDING ?auto_156471 ) ( CLEAR ?auto_156474 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_156474 ?auto_156471 )
      ( MAKE-4PILE ?auto_156466 ?auto_156467 ?auto_156468 ?auto_156469 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156475 - BLOCK
      ?auto_156476 - BLOCK
      ?auto_156477 - BLOCK
      ?auto_156478 - BLOCK
    )
    :vars
    (
      ?auto_156482 - BLOCK
      ?auto_156481 - BLOCK
      ?auto_156480 - BLOCK
      ?auto_156479 - BLOCK
      ?auto_156483 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156475 ?auto_156476 ) ) ( not ( = ?auto_156475 ?auto_156477 ) ) ( not ( = ?auto_156475 ?auto_156478 ) ) ( not ( = ?auto_156476 ?auto_156477 ) ) ( not ( = ?auto_156476 ?auto_156478 ) ) ( not ( = ?auto_156477 ?auto_156478 ) ) ( not ( = ?auto_156475 ?auto_156482 ) ) ( not ( = ?auto_156476 ?auto_156482 ) ) ( not ( = ?auto_156477 ?auto_156482 ) ) ( not ( = ?auto_156478 ?auto_156482 ) ) ( ON-TABLE ?auto_156481 ) ( not ( = ?auto_156481 ?auto_156480 ) ) ( not ( = ?auto_156481 ?auto_156479 ) ) ( not ( = ?auto_156481 ?auto_156482 ) ) ( not ( = ?auto_156481 ?auto_156478 ) ) ( not ( = ?auto_156481 ?auto_156477 ) ) ( not ( = ?auto_156480 ?auto_156479 ) ) ( not ( = ?auto_156480 ?auto_156482 ) ) ( not ( = ?auto_156480 ?auto_156478 ) ) ( not ( = ?auto_156480 ?auto_156477 ) ) ( not ( = ?auto_156479 ?auto_156482 ) ) ( not ( = ?auto_156479 ?auto_156478 ) ) ( not ( = ?auto_156479 ?auto_156477 ) ) ( not ( = ?auto_156475 ?auto_156481 ) ) ( not ( = ?auto_156475 ?auto_156480 ) ) ( not ( = ?auto_156475 ?auto_156479 ) ) ( not ( = ?auto_156476 ?auto_156481 ) ) ( not ( = ?auto_156476 ?auto_156480 ) ) ( not ( = ?auto_156476 ?auto_156479 ) ) ( ON ?auto_156475 ?auto_156483 ) ( not ( = ?auto_156475 ?auto_156483 ) ) ( not ( = ?auto_156476 ?auto_156483 ) ) ( not ( = ?auto_156477 ?auto_156483 ) ) ( not ( = ?auto_156478 ?auto_156483 ) ) ( not ( = ?auto_156482 ?auto_156483 ) ) ( not ( = ?auto_156481 ?auto_156483 ) ) ( not ( = ?auto_156480 ?auto_156483 ) ) ( not ( = ?auto_156479 ?auto_156483 ) ) ( ON ?auto_156476 ?auto_156475 ) ( ON-TABLE ?auto_156483 ) ( ON ?auto_156477 ?auto_156476 ) ( ON ?auto_156478 ?auto_156477 ) ( ON ?auto_156482 ?auto_156478 ) ( ON ?auto_156479 ?auto_156482 ) ( CLEAR ?auto_156481 ) ( ON ?auto_156480 ?auto_156479 ) ( CLEAR ?auto_156480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_156483 ?auto_156475 ?auto_156476 ?auto_156477 ?auto_156478 ?auto_156482 ?auto_156479 )
      ( MAKE-4PILE ?auto_156475 ?auto_156476 ?auto_156477 ?auto_156478 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156484 - BLOCK
      ?auto_156485 - BLOCK
      ?auto_156486 - BLOCK
      ?auto_156487 - BLOCK
    )
    :vars
    (
      ?auto_156489 - BLOCK
      ?auto_156490 - BLOCK
      ?auto_156488 - BLOCK
      ?auto_156492 - BLOCK
      ?auto_156491 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156484 ?auto_156485 ) ) ( not ( = ?auto_156484 ?auto_156486 ) ) ( not ( = ?auto_156484 ?auto_156487 ) ) ( not ( = ?auto_156485 ?auto_156486 ) ) ( not ( = ?auto_156485 ?auto_156487 ) ) ( not ( = ?auto_156486 ?auto_156487 ) ) ( not ( = ?auto_156484 ?auto_156489 ) ) ( not ( = ?auto_156485 ?auto_156489 ) ) ( not ( = ?auto_156486 ?auto_156489 ) ) ( not ( = ?auto_156487 ?auto_156489 ) ) ( not ( = ?auto_156490 ?auto_156488 ) ) ( not ( = ?auto_156490 ?auto_156492 ) ) ( not ( = ?auto_156490 ?auto_156489 ) ) ( not ( = ?auto_156490 ?auto_156487 ) ) ( not ( = ?auto_156490 ?auto_156486 ) ) ( not ( = ?auto_156488 ?auto_156492 ) ) ( not ( = ?auto_156488 ?auto_156489 ) ) ( not ( = ?auto_156488 ?auto_156487 ) ) ( not ( = ?auto_156488 ?auto_156486 ) ) ( not ( = ?auto_156492 ?auto_156489 ) ) ( not ( = ?auto_156492 ?auto_156487 ) ) ( not ( = ?auto_156492 ?auto_156486 ) ) ( not ( = ?auto_156484 ?auto_156490 ) ) ( not ( = ?auto_156484 ?auto_156488 ) ) ( not ( = ?auto_156484 ?auto_156492 ) ) ( not ( = ?auto_156485 ?auto_156490 ) ) ( not ( = ?auto_156485 ?auto_156488 ) ) ( not ( = ?auto_156485 ?auto_156492 ) ) ( ON ?auto_156484 ?auto_156491 ) ( not ( = ?auto_156484 ?auto_156491 ) ) ( not ( = ?auto_156485 ?auto_156491 ) ) ( not ( = ?auto_156486 ?auto_156491 ) ) ( not ( = ?auto_156487 ?auto_156491 ) ) ( not ( = ?auto_156489 ?auto_156491 ) ) ( not ( = ?auto_156490 ?auto_156491 ) ) ( not ( = ?auto_156488 ?auto_156491 ) ) ( not ( = ?auto_156492 ?auto_156491 ) ) ( ON ?auto_156485 ?auto_156484 ) ( ON-TABLE ?auto_156491 ) ( ON ?auto_156486 ?auto_156485 ) ( ON ?auto_156487 ?auto_156486 ) ( ON ?auto_156489 ?auto_156487 ) ( ON ?auto_156492 ?auto_156489 ) ( ON ?auto_156488 ?auto_156492 ) ( CLEAR ?auto_156488 ) ( HOLDING ?auto_156490 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_156490 )
      ( MAKE-4PILE ?auto_156484 ?auto_156485 ?auto_156486 ?auto_156487 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156493 - BLOCK
      ?auto_156494 - BLOCK
      ?auto_156495 - BLOCK
      ?auto_156496 - BLOCK
    )
    :vars
    (
      ?auto_156497 - BLOCK
      ?auto_156499 - BLOCK
      ?auto_156500 - BLOCK
      ?auto_156501 - BLOCK
      ?auto_156498 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156493 ?auto_156494 ) ) ( not ( = ?auto_156493 ?auto_156495 ) ) ( not ( = ?auto_156493 ?auto_156496 ) ) ( not ( = ?auto_156494 ?auto_156495 ) ) ( not ( = ?auto_156494 ?auto_156496 ) ) ( not ( = ?auto_156495 ?auto_156496 ) ) ( not ( = ?auto_156493 ?auto_156497 ) ) ( not ( = ?auto_156494 ?auto_156497 ) ) ( not ( = ?auto_156495 ?auto_156497 ) ) ( not ( = ?auto_156496 ?auto_156497 ) ) ( not ( = ?auto_156499 ?auto_156500 ) ) ( not ( = ?auto_156499 ?auto_156501 ) ) ( not ( = ?auto_156499 ?auto_156497 ) ) ( not ( = ?auto_156499 ?auto_156496 ) ) ( not ( = ?auto_156499 ?auto_156495 ) ) ( not ( = ?auto_156500 ?auto_156501 ) ) ( not ( = ?auto_156500 ?auto_156497 ) ) ( not ( = ?auto_156500 ?auto_156496 ) ) ( not ( = ?auto_156500 ?auto_156495 ) ) ( not ( = ?auto_156501 ?auto_156497 ) ) ( not ( = ?auto_156501 ?auto_156496 ) ) ( not ( = ?auto_156501 ?auto_156495 ) ) ( not ( = ?auto_156493 ?auto_156499 ) ) ( not ( = ?auto_156493 ?auto_156500 ) ) ( not ( = ?auto_156493 ?auto_156501 ) ) ( not ( = ?auto_156494 ?auto_156499 ) ) ( not ( = ?auto_156494 ?auto_156500 ) ) ( not ( = ?auto_156494 ?auto_156501 ) ) ( ON ?auto_156493 ?auto_156498 ) ( not ( = ?auto_156493 ?auto_156498 ) ) ( not ( = ?auto_156494 ?auto_156498 ) ) ( not ( = ?auto_156495 ?auto_156498 ) ) ( not ( = ?auto_156496 ?auto_156498 ) ) ( not ( = ?auto_156497 ?auto_156498 ) ) ( not ( = ?auto_156499 ?auto_156498 ) ) ( not ( = ?auto_156500 ?auto_156498 ) ) ( not ( = ?auto_156501 ?auto_156498 ) ) ( ON ?auto_156494 ?auto_156493 ) ( ON-TABLE ?auto_156498 ) ( ON ?auto_156495 ?auto_156494 ) ( ON ?auto_156496 ?auto_156495 ) ( ON ?auto_156497 ?auto_156496 ) ( ON ?auto_156501 ?auto_156497 ) ( ON ?auto_156500 ?auto_156501 ) ( ON ?auto_156499 ?auto_156500 ) ( CLEAR ?auto_156499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_156498 ?auto_156493 ?auto_156494 ?auto_156495 ?auto_156496 ?auto_156497 ?auto_156501 ?auto_156500 )
      ( MAKE-4PILE ?auto_156493 ?auto_156494 ?auto_156495 ?auto_156496 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156505 - BLOCK
      ?auto_156506 - BLOCK
      ?auto_156507 - BLOCK
    )
    :vars
    (
      ?auto_156508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156508 ?auto_156507 ) ( CLEAR ?auto_156508 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_156505 ) ( ON ?auto_156506 ?auto_156505 ) ( ON ?auto_156507 ?auto_156506 ) ( not ( = ?auto_156505 ?auto_156506 ) ) ( not ( = ?auto_156505 ?auto_156507 ) ) ( not ( = ?auto_156505 ?auto_156508 ) ) ( not ( = ?auto_156506 ?auto_156507 ) ) ( not ( = ?auto_156506 ?auto_156508 ) ) ( not ( = ?auto_156507 ?auto_156508 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_156508 ?auto_156507 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156509 - BLOCK
      ?auto_156510 - BLOCK
      ?auto_156511 - BLOCK
    )
    :vars
    (
      ?auto_156512 - BLOCK
      ?auto_156513 - BLOCK
      ?auto_156514 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156512 ?auto_156511 ) ( CLEAR ?auto_156512 ) ( ON-TABLE ?auto_156509 ) ( ON ?auto_156510 ?auto_156509 ) ( ON ?auto_156511 ?auto_156510 ) ( not ( = ?auto_156509 ?auto_156510 ) ) ( not ( = ?auto_156509 ?auto_156511 ) ) ( not ( = ?auto_156509 ?auto_156512 ) ) ( not ( = ?auto_156510 ?auto_156511 ) ) ( not ( = ?auto_156510 ?auto_156512 ) ) ( not ( = ?auto_156511 ?auto_156512 ) ) ( HOLDING ?auto_156513 ) ( CLEAR ?auto_156514 ) ( not ( = ?auto_156509 ?auto_156513 ) ) ( not ( = ?auto_156509 ?auto_156514 ) ) ( not ( = ?auto_156510 ?auto_156513 ) ) ( not ( = ?auto_156510 ?auto_156514 ) ) ( not ( = ?auto_156511 ?auto_156513 ) ) ( not ( = ?auto_156511 ?auto_156514 ) ) ( not ( = ?auto_156512 ?auto_156513 ) ) ( not ( = ?auto_156512 ?auto_156514 ) ) ( not ( = ?auto_156513 ?auto_156514 ) ) )
    :subtasks
    ( ( !STACK ?auto_156513 ?auto_156514 )
      ( MAKE-3PILE ?auto_156509 ?auto_156510 ?auto_156511 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156515 - BLOCK
      ?auto_156516 - BLOCK
      ?auto_156517 - BLOCK
    )
    :vars
    (
      ?auto_156520 - BLOCK
      ?auto_156518 - BLOCK
      ?auto_156519 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156520 ?auto_156517 ) ( ON-TABLE ?auto_156515 ) ( ON ?auto_156516 ?auto_156515 ) ( ON ?auto_156517 ?auto_156516 ) ( not ( = ?auto_156515 ?auto_156516 ) ) ( not ( = ?auto_156515 ?auto_156517 ) ) ( not ( = ?auto_156515 ?auto_156520 ) ) ( not ( = ?auto_156516 ?auto_156517 ) ) ( not ( = ?auto_156516 ?auto_156520 ) ) ( not ( = ?auto_156517 ?auto_156520 ) ) ( CLEAR ?auto_156518 ) ( not ( = ?auto_156515 ?auto_156519 ) ) ( not ( = ?auto_156515 ?auto_156518 ) ) ( not ( = ?auto_156516 ?auto_156519 ) ) ( not ( = ?auto_156516 ?auto_156518 ) ) ( not ( = ?auto_156517 ?auto_156519 ) ) ( not ( = ?auto_156517 ?auto_156518 ) ) ( not ( = ?auto_156520 ?auto_156519 ) ) ( not ( = ?auto_156520 ?auto_156518 ) ) ( not ( = ?auto_156519 ?auto_156518 ) ) ( ON ?auto_156519 ?auto_156520 ) ( CLEAR ?auto_156519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_156515 ?auto_156516 ?auto_156517 ?auto_156520 )
      ( MAKE-3PILE ?auto_156515 ?auto_156516 ?auto_156517 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156521 - BLOCK
      ?auto_156522 - BLOCK
      ?auto_156523 - BLOCK
    )
    :vars
    (
      ?auto_156524 - BLOCK
      ?auto_156525 - BLOCK
      ?auto_156526 - BLOCK
      ?auto_156528 - BLOCK
      ?auto_156527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156524 ?auto_156523 ) ( ON-TABLE ?auto_156521 ) ( ON ?auto_156522 ?auto_156521 ) ( ON ?auto_156523 ?auto_156522 ) ( not ( = ?auto_156521 ?auto_156522 ) ) ( not ( = ?auto_156521 ?auto_156523 ) ) ( not ( = ?auto_156521 ?auto_156524 ) ) ( not ( = ?auto_156522 ?auto_156523 ) ) ( not ( = ?auto_156522 ?auto_156524 ) ) ( not ( = ?auto_156523 ?auto_156524 ) ) ( not ( = ?auto_156521 ?auto_156525 ) ) ( not ( = ?auto_156521 ?auto_156526 ) ) ( not ( = ?auto_156522 ?auto_156525 ) ) ( not ( = ?auto_156522 ?auto_156526 ) ) ( not ( = ?auto_156523 ?auto_156525 ) ) ( not ( = ?auto_156523 ?auto_156526 ) ) ( not ( = ?auto_156524 ?auto_156525 ) ) ( not ( = ?auto_156524 ?auto_156526 ) ) ( not ( = ?auto_156525 ?auto_156526 ) ) ( ON ?auto_156525 ?auto_156524 ) ( CLEAR ?auto_156525 ) ( HOLDING ?auto_156526 ) ( CLEAR ?auto_156528 ) ( ON-TABLE ?auto_156527 ) ( ON ?auto_156528 ?auto_156527 ) ( not ( = ?auto_156527 ?auto_156528 ) ) ( not ( = ?auto_156527 ?auto_156526 ) ) ( not ( = ?auto_156528 ?auto_156526 ) ) ( not ( = ?auto_156521 ?auto_156528 ) ) ( not ( = ?auto_156521 ?auto_156527 ) ) ( not ( = ?auto_156522 ?auto_156528 ) ) ( not ( = ?auto_156522 ?auto_156527 ) ) ( not ( = ?auto_156523 ?auto_156528 ) ) ( not ( = ?auto_156523 ?auto_156527 ) ) ( not ( = ?auto_156524 ?auto_156528 ) ) ( not ( = ?auto_156524 ?auto_156527 ) ) ( not ( = ?auto_156525 ?auto_156528 ) ) ( not ( = ?auto_156525 ?auto_156527 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_156527 ?auto_156528 ?auto_156526 )
      ( MAKE-3PILE ?auto_156521 ?auto_156522 ?auto_156523 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156529 - BLOCK
      ?auto_156530 - BLOCK
      ?auto_156531 - BLOCK
    )
    :vars
    (
      ?auto_156535 - BLOCK
      ?auto_156534 - BLOCK
      ?auto_156533 - BLOCK
      ?auto_156536 - BLOCK
      ?auto_156532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156535 ?auto_156531 ) ( ON-TABLE ?auto_156529 ) ( ON ?auto_156530 ?auto_156529 ) ( ON ?auto_156531 ?auto_156530 ) ( not ( = ?auto_156529 ?auto_156530 ) ) ( not ( = ?auto_156529 ?auto_156531 ) ) ( not ( = ?auto_156529 ?auto_156535 ) ) ( not ( = ?auto_156530 ?auto_156531 ) ) ( not ( = ?auto_156530 ?auto_156535 ) ) ( not ( = ?auto_156531 ?auto_156535 ) ) ( not ( = ?auto_156529 ?auto_156534 ) ) ( not ( = ?auto_156529 ?auto_156533 ) ) ( not ( = ?auto_156530 ?auto_156534 ) ) ( not ( = ?auto_156530 ?auto_156533 ) ) ( not ( = ?auto_156531 ?auto_156534 ) ) ( not ( = ?auto_156531 ?auto_156533 ) ) ( not ( = ?auto_156535 ?auto_156534 ) ) ( not ( = ?auto_156535 ?auto_156533 ) ) ( not ( = ?auto_156534 ?auto_156533 ) ) ( ON ?auto_156534 ?auto_156535 ) ( CLEAR ?auto_156536 ) ( ON-TABLE ?auto_156532 ) ( ON ?auto_156536 ?auto_156532 ) ( not ( = ?auto_156532 ?auto_156536 ) ) ( not ( = ?auto_156532 ?auto_156533 ) ) ( not ( = ?auto_156536 ?auto_156533 ) ) ( not ( = ?auto_156529 ?auto_156536 ) ) ( not ( = ?auto_156529 ?auto_156532 ) ) ( not ( = ?auto_156530 ?auto_156536 ) ) ( not ( = ?auto_156530 ?auto_156532 ) ) ( not ( = ?auto_156531 ?auto_156536 ) ) ( not ( = ?auto_156531 ?auto_156532 ) ) ( not ( = ?auto_156535 ?auto_156536 ) ) ( not ( = ?auto_156535 ?auto_156532 ) ) ( not ( = ?auto_156534 ?auto_156536 ) ) ( not ( = ?auto_156534 ?auto_156532 ) ) ( ON ?auto_156533 ?auto_156534 ) ( CLEAR ?auto_156533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_156529 ?auto_156530 ?auto_156531 ?auto_156535 ?auto_156534 )
      ( MAKE-3PILE ?auto_156529 ?auto_156530 ?auto_156531 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156537 - BLOCK
      ?auto_156538 - BLOCK
      ?auto_156539 - BLOCK
    )
    :vars
    (
      ?auto_156543 - BLOCK
      ?auto_156541 - BLOCK
      ?auto_156540 - BLOCK
      ?auto_156542 - BLOCK
      ?auto_156544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156543 ?auto_156539 ) ( ON-TABLE ?auto_156537 ) ( ON ?auto_156538 ?auto_156537 ) ( ON ?auto_156539 ?auto_156538 ) ( not ( = ?auto_156537 ?auto_156538 ) ) ( not ( = ?auto_156537 ?auto_156539 ) ) ( not ( = ?auto_156537 ?auto_156543 ) ) ( not ( = ?auto_156538 ?auto_156539 ) ) ( not ( = ?auto_156538 ?auto_156543 ) ) ( not ( = ?auto_156539 ?auto_156543 ) ) ( not ( = ?auto_156537 ?auto_156541 ) ) ( not ( = ?auto_156537 ?auto_156540 ) ) ( not ( = ?auto_156538 ?auto_156541 ) ) ( not ( = ?auto_156538 ?auto_156540 ) ) ( not ( = ?auto_156539 ?auto_156541 ) ) ( not ( = ?auto_156539 ?auto_156540 ) ) ( not ( = ?auto_156543 ?auto_156541 ) ) ( not ( = ?auto_156543 ?auto_156540 ) ) ( not ( = ?auto_156541 ?auto_156540 ) ) ( ON ?auto_156541 ?auto_156543 ) ( ON-TABLE ?auto_156542 ) ( not ( = ?auto_156542 ?auto_156544 ) ) ( not ( = ?auto_156542 ?auto_156540 ) ) ( not ( = ?auto_156544 ?auto_156540 ) ) ( not ( = ?auto_156537 ?auto_156544 ) ) ( not ( = ?auto_156537 ?auto_156542 ) ) ( not ( = ?auto_156538 ?auto_156544 ) ) ( not ( = ?auto_156538 ?auto_156542 ) ) ( not ( = ?auto_156539 ?auto_156544 ) ) ( not ( = ?auto_156539 ?auto_156542 ) ) ( not ( = ?auto_156543 ?auto_156544 ) ) ( not ( = ?auto_156543 ?auto_156542 ) ) ( not ( = ?auto_156541 ?auto_156544 ) ) ( not ( = ?auto_156541 ?auto_156542 ) ) ( ON ?auto_156540 ?auto_156541 ) ( CLEAR ?auto_156540 ) ( HOLDING ?auto_156544 ) ( CLEAR ?auto_156542 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_156542 ?auto_156544 )
      ( MAKE-3PILE ?auto_156537 ?auto_156538 ?auto_156539 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156545 - BLOCK
      ?auto_156546 - BLOCK
      ?auto_156547 - BLOCK
    )
    :vars
    (
      ?auto_156549 - BLOCK
      ?auto_156550 - BLOCK
      ?auto_156548 - BLOCK
      ?auto_156552 - BLOCK
      ?auto_156551 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156549 ?auto_156547 ) ( ON-TABLE ?auto_156545 ) ( ON ?auto_156546 ?auto_156545 ) ( ON ?auto_156547 ?auto_156546 ) ( not ( = ?auto_156545 ?auto_156546 ) ) ( not ( = ?auto_156545 ?auto_156547 ) ) ( not ( = ?auto_156545 ?auto_156549 ) ) ( not ( = ?auto_156546 ?auto_156547 ) ) ( not ( = ?auto_156546 ?auto_156549 ) ) ( not ( = ?auto_156547 ?auto_156549 ) ) ( not ( = ?auto_156545 ?auto_156550 ) ) ( not ( = ?auto_156545 ?auto_156548 ) ) ( not ( = ?auto_156546 ?auto_156550 ) ) ( not ( = ?auto_156546 ?auto_156548 ) ) ( not ( = ?auto_156547 ?auto_156550 ) ) ( not ( = ?auto_156547 ?auto_156548 ) ) ( not ( = ?auto_156549 ?auto_156550 ) ) ( not ( = ?auto_156549 ?auto_156548 ) ) ( not ( = ?auto_156550 ?auto_156548 ) ) ( ON ?auto_156550 ?auto_156549 ) ( ON-TABLE ?auto_156552 ) ( not ( = ?auto_156552 ?auto_156551 ) ) ( not ( = ?auto_156552 ?auto_156548 ) ) ( not ( = ?auto_156551 ?auto_156548 ) ) ( not ( = ?auto_156545 ?auto_156551 ) ) ( not ( = ?auto_156545 ?auto_156552 ) ) ( not ( = ?auto_156546 ?auto_156551 ) ) ( not ( = ?auto_156546 ?auto_156552 ) ) ( not ( = ?auto_156547 ?auto_156551 ) ) ( not ( = ?auto_156547 ?auto_156552 ) ) ( not ( = ?auto_156549 ?auto_156551 ) ) ( not ( = ?auto_156549 ?auto_156552 ) ) ( not ( = ?auto_156550 ?auto_156551 ) ) ( not ( = ?auto_156550 ?auto_156552 ) ) ( ON ?auto_156548 ?auto_156550 ) ( CLEAR ?auto_156552 ) ( ON ?auto_156551 ?auto_156548 ) ( CLEAR ?auto_156551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_156545 ?auto_156546 ?auto_156547 ?auto_156549 ?auto_156550 ?auto_156548 )
      ( MAKE-3PILE ?auto_156545 ?auto_156546 ?auto_156547 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156553 - BLOCK
      ?auto_156554 - BLOCK
      ?auto_156555 - BLOCK
    )
    :vars
    (
      ?auto_156556 - BLOCK
      ?auto_156558 - BLOCK
      ?auto_156560 - BLOCK
      ?auto_156559 - BLOCK
      ?auto_156557 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156556 ?auto_156555 ) ( ON-TABLE ?auto_156553 ) ( ON ?auto_156554 ?auto_156553 ) ( ON ?auto_156555 ?auto_156554 ) ( not ( = ?auto_156553 ?auto_156554 ) ) ( not ( = ?auto_156553 ?auto_156555 ) ) ( not ( = ?auto_156553 ?auto_156556 ) ) ( not ( = ?auto_156554 ?auto_156555 ) ) ( not ( = ?auto_156554 ?auto_156556 ) ) ( not ( = ?auto_156555 ?auto_156556 ) ) ( not ( = ?auto_156553 ?auto_156558 ) ) ( not ( = ?auto_156553 ?auto_156560 ) ) ( not ( = ?auto_156554 ?auto_156558 ) ) ( not ( = ?auto_156554 ?auto_156560 ) ) ( not ( = ?auto_156555 ?auto_156558 ) ) ( not ( = ?auto_156555 ?auto_156560 ) ) ( not ( = ?auto_156556 ?auto_156558 ) ) ( not ( = ?auto_156556 ?auto_156560 ) ) ( not ( = ?auto_156558 ?auto_156560 ) ) ( ON ?auto_156558 ?auto_156556 ) ( not ( = ?auto_156559 ?auto_156557 ) ) ( not ( = ?auto_156559 ?auto_156560 ) ) ( not ( = ?auto_156557 ?auto_156560 ) ) ( not ( = ?auto_156553 ?auto_156557 ) ) ( not ( = ?auto_156553 ?auto_156559 ) ) ( not ( = ?auto_156554 ?auto_156557 ) ) ( not ( = ?auto_156554 ?auto_156559 ) ) ( not ( = ?auto_156555 ?auto_156557 ) ) ( not ( = ?auto_156555 ?auto_156559 ) ) ( not ( = ?auto_156556 ?auto_156557 ) ) ( not ( = ?auto_156556 ?auto_156559 ) ) ( not ( = ?auto_156558 ?auto_156557 ) ) ( not ( = ?auto_156558 ?auto_156559 ) ) ( ON ?auto_156560 ?auto_156558 ) ( ON ?auto_156557 ?auto_156560 ) ( CLEAR ?auto_156557 ) ( HOLDING ?auto_156559 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_156559 )
      ( MAKE-3PILE ?auto_156553 ?auto_156554 ?auto_156555 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156561 - BLOCK
      ?auto_156562 - BLOCK
      ?auto_156563 - BLOCK
    )
    :vars
    (
      ?auto_156565 - BLOCK
      ?auto_156566 - BLOCK
      ?auto_156564 - BLOCK
      ?auto_156567 - BLOCK
      ?auto_156568 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156565 ?auto_156563 ) ( ON-TABLE ?auto_156561 ) ( ON ?auto_156562 ?auto_156561 ) ( ON ?auto_156563 ?auto_156562 ) ( not ( = ?auto_156561 ?auto_156562 ) ) ( not ( = ?auto_156561 ?auto_156563 ) ) ( not ( = ?auto_156561 ?auto_156565 ) ) ( not ( = ?auto_156562 ?auto_156563 ) ) ( not ( = ?auto_156562 ?auto_156565 ) ) ( not ( = ?auto_156563 ?auto_156565 ) ) ( not ( = ?auto_156561 ?auto_156566 ) ) ( not ( = ?auto_156561 ?auto_156564 ) ) ( not ( = ?auto_156562 ?auto_156566 ) ) ( not ( = ?auto_156562 ?auto_156564 ) ) ( not ( = ?auto_156563 ?auto_156566 ) ) ( not ( = ?auto_156563 ?auto_156564 ) ) ( not ( = ?auto_156565 ?auto_156566 ) ) ( not ( = ?auto_156565 ?auto_156564 ) ) ( not ( = ?auto_156566 ?auto_156564 ) ) ( ON ?auto_156566 ?auto_156565 ) ( not ( = ?auto_156567 ?auto_156568 ) ) ( not ( = ?auto_156567 ?auto_156564 ) ) ( not ( = ?auto_156568 ?auto_156564 ) ) ( not ( = ?auto_156561 ?auto_156568 ) ) ( not ( = ?auto_156561 ?auto_156567 ) ) ( not ( = ?auto_156562 ?auto_156568 ) ) ( not ( = ?auto_156562 ?auto_156567 ) ) ( not ( = ?auto_156563 ?auto_156568 ) ) ( not ( = ?auto_156563 ?auto_156567 ) ) ( not ( = ?auto_156565 ?auto_156568 ) ) ( not ( = ?auto_156565 ?auto_156567 ) ) ( not ( = ?auto_156566 ?auto_156568 ) ) ( not ( = ?auto_156566 ?auto_156567 ) ) ( ON ?auto_156564 ?auto_156566 ) ( ON ?auto_156568 ?auto_156564 ) ( ON ?auto_156567 ?auto_156568 ) ( CLEAR ?auto_156567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_156561 ?auto_156562 ?auto_156563 ?auto_156565 ?auto_156566 ?auto_156564 ?auto_156568 )
      ( MAKE-3PILE ?auto_156561 ?auto_156562 ?auto_156563 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156569 - BLOCK
      ?auto_156570 - BLOCK
      ?auto_156571 - BLOCK
    )
    :vars
    (
      ?auto_156573 - BLOCK
      ?auto_156574 - BLOCK
      ?auto_156575 - BLOCK
      ?auto_156576 - BLOCK
      ?auto_156572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156573 ?auto_156571 ) ( ON-TABLE ?auto_156569 ) ( ON ?auto_156570 ?auto_156569 ) ( ON ?auto_156571 ?auto_156570 ) ( not ( = ?auto_156569 ?auto_156570 ) ) ( not ( = ?auto_156569 ?auto_156571 ) ) ( not ( = ?auto_156569 ?auto_156573 ) ) ( not ( = ?auto_156570 ?auto_156571 ) ) ( not ( = ?auto_156570 ?auto_156573 ) ) ( not ( = ?auto_156571 ?auto_156573 ) ) ( not ( = ?auto_156569 ?auto_156574 ) ) ( not ( = ?auto_156569 ?auto_156575 ) ) ( not ( = ?auto_156570 ?auto_156574 ) ) ( not ( = ?auto_156570 ?auto_156575 ) ) ( not ( = ?auto_156571 ?auto_156574 ) ) ( not ( = ?auto_156571 ?auto_156575 ) ) ( not ( = ?auto_156573 ?auto_156574 ) ) ( not ( = ?auto_156573 ?auto_156575 ) ) ( not ( = ?auto_156574 ?auto_156575 ) ) ( ON ?auto_156574 ?auto_156573 ) ( not ( = ?auto_156576 ?auto_156572 ) ) ( not ( = ?auto_156576 ?auto_156575 ) ) ( not ( = ?auto_156572 ?auto_156575 ) ) ( not ( = ?auto_156569 ?auto_156572 ) ) ( not ( = ?auto_156569 ?auto_156576 ) ) ( not ( = ?auto_156570 ?auto_156572 ) ) ( not ( = ?auto_156570 ?auto_156576 ) ) ( not ( = ?auto_156571 ?auto_156572 ) ) ( not ( = ?auto_156571 ?auto_156576 ) ) ( not ( = ?auto_156573 ?auto_156572 ) ) ( not ( = ?auto_156573 ?auto_156576 ) ) ( not ( = ?auto_156574 ?auto_156572 ) ) ( not ( = ?auto_156574 ?auto_156576 ) ) ( ON ?auto_156575 ?auto_156574 ) ( ON ?auto_156572 ?auto_156575 ) ( HOLDING ?auto_156576 ) ( CLEAR ?auto_156572 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_156569 ?auto_156570 ?auto_156571 ?auto_156573 ?auto_156574 ?auto_156575 ?auto_156572 ?auto_156576 )
      ( MAKE-3PILE ?auto_156569 ?auto_156570 ?auto_156571 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156577 - BLOCK
      ?auto_156578 - BLOCK
      ?auto_156579 - BLOCK
    )
    :vars
    (
      ?auto_156580 - BLOCK
      ?auto_156583 - BLOCK
      ?auto_156584 - BLOCK
      ?auto_156581 - BLOCK
      ?auto_156582 - BLOCK
      ?auto_156585 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156580 ?auto_156579 ) ( ON-TABLE ?auto_156577 ) ( ON ?auto_156578 ?auto_156577 ) ( ON ?auto_156579 ?auto_156578 ) ( not ( = ?auto_156577 ?auto_156578 ) ) ( not ( = ?auto_156577 ?auto_156579 ) ) ( not ( = ?auto_156577 ?auto_156580 ) ) ( not ( = ?auto_156578 ?auto_156579 ) ) ( not ( = ?auto_156578 ?auto_156580 ) ) ( not ( = ?auto_156579 ?auto_156580 ) ) ( not ( = ?auto_156577 ?auto_156583 ) ) ( not ( = ?auto_156577 ?auto_156584 ) ) ( not ( = ?auto_156578 ?auto_156583 ) ) ( not ( = ?auto_156578 ?auto_156584 ) ) ( not ( = ?auto_156579 ?auto_156583 ) ) ( not ( = ?auto_156579 ?auto_156584 ) ) ( not ( = ?auto_156580 ?auto_156583 ) ) ( not ( = ?auto_156580 ?auto_156584 ) ) ( not ( = ?auto_156583 ?auto_156584 ) ) ( ON ?auto_156583 ?auto_156580 ) ( not ( = ?auto_156581 ?auto_156582 ) ) ( not ( = ?auto_156581 ?auto_156584 ) ) ( not ( = ?auto_156582 ?auto_156584 ) ) ( not ( = ?auto_156577 ?auto_156582 ) ) ( not ( = ?auto_156577 ?auto_156581 ) ) ( not ( = ?auto_156578 ?auto_156582 ) ) ( not ( = ?auto_156578 ?auto_156581 ) ) ( not ( = ?auto_156579 ?auto_156582 ) ) ( not ( = ?auto_156579 ?auto_156581 ) ) ( not ( = ?auto_156580 ?auto_156582 ) ) ( not ( = ?auto_156580 ?auto_156581 ) ) ( not ( = ?auto_156583 ?auto_156582 ) ) ( not ( = ?auto_156583 ?auto_156581 ) ) ( ON ?auto_156584 ?auto_156583 ) ( ON ?auto_156582 ?auto_156584 ) ( CLEAR ?auto_156582 ) ( ON ?auto_156581 ?auto_156585 ) ( CLEAR ?auto_156581 ) ( HAND-EMPTY ) ( not ( = ?auto_156577 ?auto_156585 ) ) ( not ( = ?auto_156578 ?auto_156585 ) ) ( not ( = ?auto_156579 ?auto_156585 ) ) ( not ( = ?auto_156580 ?auto_156585 ) ) ( not ( = ?auto_156583 ?auto_156585 ) ) ( not ( = ?auto_156584 ?auto_156585 ) ) ( not ( = ?auto_156581 ?auto_156585 ) ) ( not ( = ?auto_156582 ?auto_156585 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_156581 ?auto_156585 )
      ( MAKE-3PILE ?auto_156577 ?auto_156578 ?auto_156579 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156586 - BLOCK
      ?auto_156587 - BLOCK
      ?auto_156588 - BLOCK
    )
    :vars
    (
      ?auto_156591 - BLOCK
      ?auto_156590 - BLOCK
      ?auto_156593 - BLOCK
      ?auto_156594 - BLOCK
      ?auto_156592 - BLOCK
      ?auto_156589 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156591 ?auto_156588 ) ( ON-TABLE ?auto_156586 ) ( ON ?auto_156587 ?auto_156586 ) ( ON ?auto_156588 ?auto_156587 ) ( not ( = ?auto_156586 ?auto_156587 ) ) ( not ( = ?auto_156586 ?auto_156588 ) ) ( not ( = ?auto_156586 ?auto_156591 ) ) ( not ( = ?auto_156587 ?auto_156588 ) ) ( not ( = ?auto_156587 ?auto_156591 ) ) ( not ( = ?auto_156588 ?auto_156591 ) ) ( not ( = ?auto_156586 ?auto_156590 ) ) ( not ( = ?auto_156586 ?auto_156593 ) ) ( not ( = ?auto_156587 ?auto_156590 ) ) ( not ( = ?auto_156587 ?auto_156593 ) ) ( not ( = ?auto_156588 ?auto_156590 ) ) ( not ( = ?auto_156588 ?auto_156593 ) ) ( not ( = ?auto_156591 ?auto_156590 ) ) ( not ( = ?auto_156591 ?auto_156593 ) ) ( not ( = ?auto_156590 ?auto_156593 ) ) ( ON ?auto_156590 ?auto_156591 ) ( not ( = ?auto_156594 ?auto_156592 ) ) ( not ( = ?auto_156594 ?auto_156593 ) ) ( not ( = ?auto_156592 ?auto_156593 ) ) ( not ( = ?auto_156586 ?auto_156592 ) ) ( not ( = ?auto_156586 ?auto_156594 ) ) ( not ( = ?auto_156587 ?auto_156592 ) ) ( not ( = ?auto_156587 ?auto_156594 ) ) ( not ( = ?auto_156588 ?auto_156592 ) ) ( not ( = ?auto_156588 ?auto_156594 ) ) ( not ( = ?auto_156591 ?auto_156592 ) ) ( not ( = ?auto_156591 ?auto_156594 ) ) ( not ( = ?auto_156590 ?auto_156592 ) ) ( not ( = ?auto_156590 ?auto_156594 ) ) ( ON ?auto_156593 ?auto_156590 ) ( ON ?auto_156594 ?auto_156589 ) ( CLEAR ?auto_156594 ) ( not ( = ?auto_156586 ?auto_156589 ) ) ( not ( = ?auto_156587 ?auto_156589 ) ) ( not ( = ?auto_156588 ?auto_156589 ) ) ( not ( = ?auto_156591 ?auto_156589 ) ) ( not ( = ?auto_156590 ?auto_156589 ) ) ( not ( = ?auto_156593 ?auto_156589 ) ) ( not ( = ?auto_156594 ?auto_156589 ) ) ( not ( = ?auto_156592 ?auto_156589 ) ) ( HOLDING ?auto_156592 ) ( CLEAR ?auto_156593 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_156586 ?auto_156587 ?auto_156588 ?auto_156591 ?auto_156590 ?auto_156593 ?auto_156592 )
      ( MAKE-3PILE ?auto_156586 ?auto_156587 ?auto_156588 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156595 - BLOCK
      ?auto_156596 - BLOCK
      ?auto_156597 - BLOCK
    )
    :vars
    (
      ?auto_156603 - BLOCK
      ?auto_156600 - BLOCK
      ?auto_156601 - BLOCK
      ?auto_156598 - BLOCK
      ?auto_156599 - BLOCK
      ?auto_156602 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156603 ?auto_156597 ) ( ON-TABLE ?auto_156595 ) ( ON ?auto_156596 ?auto_156595 ) ( ON ?auto_156597 ?auto_156596 ) ( not ( = ?auto_156595 ?auto_156596 ) ) ( not ( = ?auto_156595 ?auto_156597 ) ) ( not ( = ?auto_156595 ?auto_156603 ) ) ( not ( = ?auto_156596 ?auto_156597 ) ) ( not ( = ?auto_156596 ?auto_156603 ) ) ( not ( = ?auto_156597 ?auto_156603 ) ) ( not ( = ?auto_156595 ?auto_156600 ) ) ( not ( = ?auto_156595 ?auto_156601 ) ) ( not ( = ?auto_156596 ?auto_156600 ) ) ( not ( = ?auto_156596 ?auto_156601 ) ) ( not ( = ?auto_156597 ?auto_156600 ) ) ( not ( = ?auto_156597 ?auto_156601 ) ) ( not ( = ?auto_156603 ?auto_156600 ) ) ( not ( = ?auto_156603 ?auto_156601 ) ) ( not ( = ?auto_156600 ?auto_156601 ) ) ( ON ?auto_156600 ?auto_156603 ) ( not ( = ?auto_156598 ?auto_156599 ) ) ( not ( = ?auto_156598 ?auto_156601 ) ) ( not ( = ?auto_156599 ?auto_156601 ) ) ( not ( = ?auto_156595 ?auto_156599 ) ) ( not ( = ?auto_156595 ?auto_156598 ) ) ( not ( = ?auto_156596 ?auto_156599 ) ) ( not ( = ?auto_156596 ?auto_156598 ) ) ( not ( = ?auto_156597 ?auto_156599 ) ) ( not ( = ?auto_156597 ?auto_156598 ) ) ( not ( = ?auto_156603 ?auto_156599 ) ) ( not ( = ?auto_156603 ?auto_156598 ) ) ( not ( = ?auto_156600 ?auto_156599 ) ) ( not ( = ?auto_156600 ?auto_156598 ) ) ( ON ?auto_156601 ?auto_156600 ) ( ON ?auto_156598 ?auto_156602 ) ( not ( = ?auto_156595 ?auto_156602 ) ) ( not ( = ?auto_156596 ?auto_156602 ) ) ( not ( = ?auto_156597 ?auto_156602 ) ) ( not ( = ?auto_156603 ?auto_156602 ) ) ( not ( = ?auto_156600 ?auto_156602 ) ) ( not ( = ?auto_156601 ?auto_156602 ) ) ( not ( = ?auto_156598 ?auto_156602 ) ) ( not ( = ?auto_156599 ?auto_156602 ) ) ( CLEAR ?auto_156601 ) ( ON ?auto_156599 ?auto_156598 ) ( CLEAR ?auto_156599 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_156602 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_156602 ?auto_156598 )
      ( MAKE-3PILE ?auto_156595 ?auto_156596 ?auto_156597 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156604 - BLOCK
      ?auto_156605 - BLOCK
      ?auto_156606 - BLOCK
    )
    :vars
    (
      ?auto_156610 - BLOCK
      ?auto_156609 - BLOCK
      ?auto_156607 - BLOCK
      ?auto_156608 - BLOCK
      ?auto_156611 - BLOCK
      ?auto_156612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156610 ?auto_156606 ) ( ON-TABLE ?auto_156604 ) ( ON ?auto_156605 ?auto_156604 ) ( ON ?auto_156606 ?auto_156605 ) ( not ( = ?auto_156604 ?auto_156605 ) ) ( not ( = ?auto_156604 ?auto_156606 ) ) ( not ( = ?auto_156604 ?auto_156610 ) ) ( not ( = ?auto_156605 ?auto_156606 ) ) ( not ( = ?auto_156605 ?auto_156610 ) ) ( not ( = ?auto_156606 ?auto_156610 ) ) ( not ( = ?auto_156604 ?auto_156609 ) ) ( not ( = ?auto_156604 ?auto_156607 ) ) ( not ( = ?auto_156605 ?auto_156609 ) ) ( not ( = ?auto_156605 ?auto_156607 ) ) ( not ( = ?auto_156606 ?auto_156609 ) ) ( not ( = ?auto_156606 ?auto_156607 ) ) ( not ( = ?auto_156610 ?auto_156609 ) ) ( not ( = ?auto_156610 ?auto_156607 ) ) ( not ( = ?auto_156609 ?auto_156607 ) ) ( ON ?auto_156609 ?auto_156610 ) ( not ( = ?auto_156608 ?auto_156611 ) ) ( not ( = ?auto_156608 ?auto_156607 ) ) ( not ( = ?auto_156611 ?auto_156607 ) ) ( not ( = ?auto_156604 ?auto_156611 ) ) ( not ( = ?auto_156604 ?auto_156608 ) ) ( not ( = ?auto_156605 ?auto_156611 ) ) ( not ( = ?auto_156605 ?auto_156608 ) ) ( not ( = ?auto_156606 ?auto_156611 ) ) ( not ( = ?auto_156606 ?auto_156608 ) ) ( not ( = ?auto_156610 ?auto_156611 ) ) ( not ( = ?auto_156610 ?auto_156608 ) ) ( not ( = ?auto_156609 ?auto_156611 ) ) ( not ( = ?auto_156609 ?auto_156608 ) ) ( ON ?auto_156608 ?auto_156612 ) ( not ( = ?auto_156604 ?auto_156612 ) ) ( not ( = ?auto_156605 ?auto_156612 ) ) ( not ( = ?auto_156606 ?auto_156612 ) ) ( not ( = ?auto_156610 ?auto_156612 ) ) ( not ( = ?auto_156609 ?auto_156612 ) ) ( not ( = ?auto_156607 ?auto_156612 ) ) ( not ( = ?auto_156608 ?auto_156612 ) ) ( not ( = ?auto_156611 ?auto_156612 ) ) ( ON ?auto_156611 ?auto_156608 ) ( CLEAR ?auto_156611 ) ( ON-TABLE ?auto_156612 ) ( HOLDING ?auto_156607 ) ( CLEAR ?auto_156609 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_156604 ?auto_156605 ?auto_156606 ?auto_156610 ?auto_156609 ?auto_156607 )
      ( MAKE-3PILE ?auto_156604 ?auto_156605 ?auto_156606 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156613 - BLOCK
      ?auto_156614 - BLOCK
      ?auto_156615 - BLOCK
    )
    :vars
    (
      ?auto_156616 - BLOCK
      ?auto_156620 - BLOCK
      ?auto_156617 - BLOCK
      ?auto_156621 - BLOCK
      ?auto_156619 - BLOCK
      ?auto_156618 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156616 ?auto_156615 ) ( ON-TABLE ?auto_156613 ) ( ON ?auto_156614 ?auto_156613 ) ( ON ?auto_156615 ?auto_156614 ) ( not ( = ?auto_156613 ?auto_156614 ) ) ( not ( = ?auto_156613 ?auto_156615 ) ) ( not ( = ?auto_156613 ?auto_156616 ) ) ( not ( = ?auto_156614 ?auto_156615 ) ) ( not ( = ?auto_156614 ?auto_156616 ) ) ( not ( = ?auto_156615 ?auto_156616 ) ) ( not ( = ?auto_156613 ?auto_156620 ) ) ( not ( = ?auto_156613 ?auto_156617 ) ) ( not ( = ?auto_156614 ?auto_156620 ) ) ( not ( = ?auto_156614 ?auto_156617 ) ) ( not ( = ?auto_156615 ?auto_156620 ) ) ( not ( = ?auto_156615 ?auto_156617 ) ) ( not ( = ?auto_156616 ?auto_156620 ) ) ( not ( = ?auto_156616 ?auto_156617 ) ) ( not ( = ?auto_156620 ?auto_156617 ) ) ( ON ?auto_156620 ?auto_156616 ) ( not ( = ?auto_156621 ?auto_156619 ) ) ( not ( = ?auto_156621 ?auto_156617 ) ) ( not ( = ?auto_156619 ?auto_156617 ) ) ( not ( = ?auto_156613 ?auto_156619 ) ) ( not ( = ?auto_156613 ?auto_156621 ) ) ( not ( = ?auto_156614 ?auto_156619 ) ) ( not ( = ?auto_156614 ?auto_156621 ) ) ( not ( = ?auto_156615 ?auto_156619 ) ) ( not ( = ?auto_156615 ?auto_156621 ) ) ( not ( = ?auto_156616 ?auto_156619 ) ) ( not ( = ?auto_156616 ?auto_156621 ) ) ( not ( = ?auto_156620 ?auto_156619 ) ) ( not ( = ?auto_156620 ?auto_156621 ) ) ( ON ?auto_156621 ?auto_156618 ) ( not ( = ?auto_156613 ?auto_156618 ) ) ( not ( = ?auto_156614 ?auto_156618 ) ) ( not ( = ?auto_156615 ?auto_156618 ) ) ( not ( = ?auto_156616 ?auto_156618 ) ) ( not ( = ?auto_156620 ?auto_156618 ) ) ( not ( = ?auto_156617 ?auto_156618 ) ) ( not ( = ?auto_156621 ?auto_156618 ) ) ( not ( = ?auto_156619 ?auto_156618 ) ) ( ON ?auto_156619 ?auto_156621 ) ( ON-TABLE ?auto_156618 ) ( CLEAR ?auto_156620 ) ( ON ?auto_156617 ?auto_156619 ) ( CLEAR ?auto_156617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_156618 ?auto_156621 ?auto_156619 )
      ( MAKE-3PILE ?auto_156613 ?auto_156614 ?auto_156615 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156622 - BLOCK
      ?auto_156623 - BLOCK
      ?auto_156624 - BLOCK
    )
    :vars
    (
      ?auto_156630 - BLOCK
      ?auto_156627 - BLOCK
      ?auto_156626 - BLOCK
      ?auto_156628 - BLOCK
      ?auto_156629 - BLOCK
      ?auto_156625 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156630 ?auto_156624 ) ( ON-TABLE ?auto_156622 ) ( ON ?auto_156623 ?auto_156622 ) ( ON ?auto_156624 ?auto_156623 ) ( not ( = ?auto_156622 ?auto_156623 ) ) ( not ( = ?auto_156622 ?auto_156624 ) ) ( not ( = ?auto_156622 ?auto_156630 ) ) ( not ( = ?auto_156623 ?auto_156624 ) ) ( not ( = ?auto_156623 ?auto_156630 ) ) ( not ( = ?auto_156624 ?auto_156630 ) ) ( not ( = ?auto_156622 ?auto_156627 ) ) ( not ( = ?auto_156622 ?auto_156626 ) ) ( not ( = ?auto_156623 ?auto_156627 ) ) ( not ( = ?auto_156623 ?auto_156626 ) ) ( not ( = ?auto_156624 ?auto_156627 ) ) ( not ( = ?auto_156624 ?auto_156626 ) ) ( not ( = ?auto_156630 ?auto_156627 ) ) ( not ( = ?auto_156630 ?auto_156626 ) ) ( not ( = ?auto_156627 ?auto_156626 ) ) ( not ( = ?auto_156628 ?auto_156629 ) ) ( not ( = ?auto_156628 ?auto_156626 ) ) ( not ( = ?auto_156629 ?auto_156626 ) ) ( not ( = ?auto_156622 ?auto_156629 ) ) ( not ( = ?auto_156622 ?auto_156628 ) ) ( not ( = ?auto_156623 ?auto_156629 ) ) ( not ( = ?auto_156623 ?auto_156628 ) ) ( not ( = ?auto_156624 ?auto_156629 ) ) ( not ( = ?auto_156624 ?auto_156628 ) ) ( not ( = ?auto_156630 ?auto_156629 ) ) ( not ( = ?auto_156630 ?auto_156628 ) ) ( not ( = ?auto_156627 ?auto_156629 ) ) ( not ( = ?auto_156627 ?auto_156628 ) ) ( ON ?auto_156628 ?auto_156625 ) ( not ( = ?auto_156622 ?auto_156625 ) ) ( not ( = ?auto_156623 ?auto_156625 ) ) ( not ( = ?auto_156624 ?auto_156625 ) ) ( not ( = ?auto_156630 ?auto_156625 ) ) ( not ( = ?auto_156627 ?auto_156625 ) ) ( not ( = ?auto_156626 ?auto_156625 ) ) ( not ( = ?auto_156628 ?auto_156625 ) ) ( not ( = ?auto_156629 ?auto_156625 ) ) ( ON ?auto_156629 ?auto_156628 ) ( ON-TABLE ?auto_156625 ) ( ON ?auto_156626 ?auto_156629 ) ( CLEAR ?auto_156626 ) ( HOLDING ?auto_156627 ) ( CLEAR ?auto_156630 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_156622 ?auto_156623 ?auto_156624 ?auto_156630 ?auto_156627 )
      ( MAKE-3PILE ?auto_156622 ?auto_156623 ?auto_156624 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156631 - BLOCK
      ?auto_156632 - BLOCK
      ?auto_156633 - BLOCK
    )
    :vars
    (
      ?auto_156639 - BLOCK
      ?auto_156636 - BLOCK
      ?auto_156637 - BLOCK
      ?auto_156635 - BLOCK
      ?auto_156638 - BLOCK
      ?auto_156634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156639 ?auto_156633 ) ( ON-TABLE ?auto_156631 ) ( ON ?auto_156632 ?auto_156631 ) ( ON ?auto_156633 ?auto_156632 ) ( not ( = ?auto_156631 ?auto_156632 ) ) ( not ( = ?auto_156631 ?auto_156633 ) ) ( not ( = ?auto_156631 ?auto_156639 ) ) ( not ( = ?auto_156632 ?auto_156633 ) ) ( not ( = ?auto_156632 ?auto_156639 ) ) ( not ( = ?auto_156633 ?auto_156639 ) ) ( not ( = ?auto_156631 ?auto_156636 ) ) ( not ( = ?auto_156631 ?auto_156637 ) ) ( not ( = ?auto_156632 ?auto_156636 ) ) ( not ( = ?auto_156632 ?auto_156637 ) ) ( not ( = ?auto_156633 ?auto_156636 ) ) ( not ( = ?auto_156633 ?auto_156637 ) ) ( not ( = ?auto_156639 ?auto_156636 ) ) ( not ( = ?auto_156639 ?auto_156637 ) ) ( not ( = ?auto_156636 ?auto_156637 ) ) ( not ( = ?auto_156635 ?auto_156638 ) ) ( not ( = ?auto_156635 ?auto_156637 ) ) ( not ( = ?auto_156638 ?auto_156637 ) ) ( not ( = ?auto_156631 ?auto_156638 ) ) ( not ( = ?auto_156631 ?auto_156635 ) ) ( not ( = ?auto_156632 ?auto_156638 ) ) ( not ( = ?auto_156632 ?auto_156635 ) ) ( not ( = ?auto_156633 ?auto_156638 ) ) ( not ( = ?auto_156633 ?auto_156635 ) ) ( not ( = ?auto_156639 ?auto_156638 ) ) ( not ( = ?auto_156639 ?auto_156635 ) ) ( not ( = ?auto_156636 ?auto_156638 ) ) ( not ( = ?auto_156636 ?auto_156635 ) ) ( ON ?auto_156635 ?auto_156634 ) ( not ( = ?auto_156631 ?auto_156634 ) ) ( not ( = ?auto_156632 ?auto_156634 ) ) ( not ( = ?auto_156633 ?auto_156634 ) ) ( not ( = ?auto_156639 ?auto_156634 ) ) ( not ( = ?auto_156636 ?auto_156634 ) ) ( not ( = ?auto_156637 ?auto_156634 ) ) ( not ( = ?auto_156635 ?auto_156634 ) ) ( not ( = ?auto_156638 ?auto_156634 ) ) ( ON ?auto_156638 ?auto_156635 ) ( ON-TABLE ?auto_156634 ) ( ON ?auto_156637 ?auto_156638 ) ( CLEAR ?auto_156639 ) ( ON ?auto_156636 ?auto_156637 ) ( CLEAR ?auto_156636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_156634 ?auto_156635 ?auto_156638 ?auto_156637 )
      ( MAKE-3PILE ?auto_156631 ?auto_156632 ?auto_156633 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156658 - BLOCK
      ?auto_156659 - BLOCK
      ?auto_156660 - BLOCK
    )
    :vars
    (
      ?auto_156665 - BLOCK
      ?auto_156661 - BLOCK
      ?auto_156662 - BLOCK
      ?auto_156663 - BLOCK
      ?auto_156666 - BLOCK
      ?auto_156664 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_156658 ) ( ON ?auto_156659 ?auto_156658 ) ( not ( = ?auto_156658 ?auto_156659 ) ) ( not ( = ?auto_156658 ?auto_156660 ) ) ( not ( = ?auto_156658 ?auto_156665 ) ) ( not ( = ?auto_156659 ?auto_156660 ) ) ( not ( = ?auto_156659 ?auto_156665 ) ) ( not ( = ?auto_156660 ?auto_156665 ) ) ( not ( = ?auto_156658 ?auto_156661 ) ) ( not ( = ?auto_156658 ?auto_156662 ) ) ( not ( = ?auto_156659 ?auto_156661 ) ) ( not ( = ?auto_156659 ?auto_156662 ) ) ( not ( = ?auto_156660 ?auto_156661 ) ) ( not ( = ?auto_156660 ?auto_156662 ) ) ( not ( = ?auto_156665 ?auto_156661 ) ) ( not ( = ?auto_156665 ?auto_156662 ) ) ( not ( = ?auto_156661 ?auto_156662 ) ) ( not ( = ?auto_156663 ?auto_156666 ) ) ( not ( = ?auto_156663 ?auto_156662 ) ) ( not ( = ?auto_156666 ?auto_156662 ) ) ( not ( = ?auto_156658 ?auto_156666 ) ) ( not ( = ?auto_156658 ?auto_156663 ) ) ( not ( = ?auto_156659 ?auto_156666 ) ) ( not ( = ?auto_156659 ?auto_156663 ) ) ( not ( = ?auto_156660 ?auto_156666 ) ) ( not ( = ?auto_156660 ?auto_156663 ) ) ( not ( = ?auto_156665 ?auto_156666 ) ) ( not ( = ?auto_156665 ?auto_156663 ) ) ( not ( = ?auto_156661 ?auto_156666 ) ) ( not ( = ?auto_156661 ?auto_156663 ) ) ( ON ?auto_156663 ?auto_156664 ) ( not ( = ?auto_156658 ?auto_156664 ) ) ( not ( = ?auto_156659 ?auto_156664 ) ) ( not ( = ?auto_156660 ?auto_156664 ) ) ( not ( = ?auto_156665 ?auto_156664 ) ) ( not ( = ?auto_156661 ?auto_156664 ) ) ( not ( = ?auto_156662 ?auto_156664 ) ) ( not ( = ?auto_156663 ?auto_156664 ) ) ( not ( = ?auto_156666 ?auto_156664 ) ) ( ON ?auto_156666 ?auto_156663 ) ( ON-TABLE ?auto_156664 ) ( ON ?auto_156662 ?auto_156666 ) ( ON ?auto_156661 ?auto_156662 ) ( ON ?auto_156665 ?auto_156661 ) ( CLEAR ?auto_156665 ) ( HOLDING ?auto_156660 ) ( CLEAR ?auto_156659 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_156658 ?auto_156659 ?auto_156660 ?auto_156665 )
      ( MAKE-3PILE ?auto_156658 ?auto_156659 ?auto_156660 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156667 - BLOCK
      ?auto_156668 - BLOCK
      ?auto_156669 - BLOCK
    )
    :vars
    (
      ?auto_156671 - BLOCK
      ?auto_156674 - BLOCK
      ?auto_156673 - BLOCK
      ?auto_156672 - BLOCK
      ?auto_156670 - BLOCK
      ?auto_156675 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_156667 ) ( ON ?auto_156668 ?auto_156667 ) ( not ( = ?auto_156667 ?auto_156668 ) ) ( not ( = ?auto_156667 ?auto_156669 ) ) ( not ( = ?auto_156667 ?auto_156671 ) ) ( not ( = ?auto_156668 ?auto_156669 ) ) ( not ( = ?auto_156668 ?auto_156671 ) ) ( not ( = ?auto_156669 ?auto_156671 ) ) ( not ( = ?auto_156667 ?auto_156674 ) ) ( not ( = ?auto_156667 ?auto_156673 ) ) ( not ( = ?auto_156668 ?auto_156674 ) ) ( not ( = ?auto_156668 ?auto_156673 ) ) ( not ( = ?auto_156669 ?auto_156674 ) ) ( not ( = ?auto_156669 ?auto_156673 ) ) ( not ( = ?auto_156671 ?auto_156674 ) ) ( not ( = ?auto_156671 ?auto_156673 ) ) ( not ( = ?auto_156674 ?auto_156673 ) ) ( not ( = ?auto_156672 ?auto_156670 ) ) ( not ( = ?auto_156672 ?auto_156673 ) ) ( not ( = ?auto_156670 ?auto_156673 ) ) ( not ( = ?auto_156667 ?auto_156670 ) ) ( not ( = ?auto_156667 ?auto_156672 ) ) ( not ( = ?auto_156668 ?auto_156670 ) ) ( not ( = ?auto_156668 ?auto_156672 ) ) ( not ( = ?auto_156669 ?auto_156670 ) ) ( not ( = ?auto_156669 ?auto_156672 ) ) ( not ( = ?auto_156671 ?auto_156670 ) ) ( not ( = ?auto_156671 ?auto_156672 ) ) ( not ( = ?auto_156674 ?auto_156670 ) ) ( not ( = ?auto_156674 ?auto_156672 ) ) ( ON ?auto_156672 ?auto_156675 ) ( not ( = ?auto_156667 ?auto_156675 ) ) ( not ( = ?auto_156668 ?auto_156675 ) ) ( not ( = ?auto_156669 ?auto_156675 ) ) ( not ( = ?auto_156671 ?auto_156675 ) ) ( not ( = ?auto_156674 ?auto_156675 ) ) ( not ( = ?auto_156673 ?auto_156675 ) ) ( not ( = ?auto_156672 ?auto_156675 ) ) ( not ( = ?auto_156670 ?auto_156675 ) ) ( ON ?auto_156670 ?auto_156672 ) ( ON-TABLE ?auto_156675 ) ( ON ?auto_156673 ?auto_156670 ) ( ON ?auto_156674 ?auto_156673 ) ( ON ?auto_156671 ?auto_156674 ) ( CLEAR ?auto_156668 ) ( ON ?auto_156669 ?auto_156671 ) ( CLEAR ?auto_156669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_156675 ?auto_156672 ?auto_156670 ?auto_156673 ?auto_156674 ?auto_156671 )
      ( MAKE-3PILE ?auto_156667 ?auto_156668 ?auto_156669 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156676 - BLOCK
      ?auto_156677 - BLOCK
      ?auto_156678 - BLOCK
    )
    :vars
    (
      ?auto_156683 - BLOCK
      ?auto_156679 - BLOCK
      ?auto_156680 - BLOCK
      ?auto_156684 - BLOCK
      ?auto_156682 - BLOCK
      ?auto_156681 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_156676 ) ( not ( = ?auto_156676 ?auto_156677 ) ) ( not ( = ?auto_156676 ?auto_156678 ) ) ( not ( = ?auto_156676 ?auto_156683 ) ) ( not ( = ?auto_156677 ?auto_156678 ) ) ( not ( = ?auto_156677 ?auto_156683 ) ) ( not ( = ?auto_156678 ?auto_156683 ) ) ( not ( = ?auto_156676 ?auto_156679 ) ) ( not ( = ?auto_156676 ?auto_156680 ) ) ( not ( = ?auto_156677 ?auto_156679 ) ) ( not ( = ?auto_156677 ?auto_156680 ) ) ( not ( = ?auto_156678 ?auto_156679 ) ) ( not ( = ?auto_156678 ?auto_156680 ) ) ( not ( = ?auto_156683 ?auto_156679 ) ) ( not ( = ?auto_156683 ?auto_156680 ) ) ( not ( = ?auto_156679 ?auto_156680 ) ) ( not ( = ?auto_156684 ?auto_156682 ) ) ( not ( = ?auto_156684 ?auto_156680 ) ) ( not ( = ?auto_156682 ?auto_156680 ) ) ( not ( = ?auto_156676 ?auto_156682 ) ) ( not ( = ?auto_156676 ?auto_156684 ) ) ( not ( = ?auto_156677 ?auto_156682 ) ) ( not ( = ?auto_156677 ?auto_156684 ) ) ( not ( = ?auto_156678 ?auto_156682 ) ) ( not ( = ?auto_156678 ?auto_156684 ) ) ( not ( = ?auto_156683 ?auto_156682 ) ) ( not ( = ?auto_156683 ?auto_156684 ) ) ( not ( = ?auto_156679 ?auto_156682 ) ) ( not ( = ?auto_156679 ?auto_156684 ) ) ( ON ?auto_156684 ?auto_156681 ) ( not ( = ?auto_156676 ?auto_156681 ) ) ( not ( = ?auto_156677 ?auto_156681 ) ) ( not ( = ?auto_156678 ?auto_156681 ) ) ( not ( = ?auto_156683 ?auto_156681 ) ) ( not ( = ?auto_156679 ?auto_156681 ) ) ( not ( = ?auto_156680 ?auto_156681 ) ) ( not ( = ?auto_156684 ?auto_156681 ) ) ( not ( = ?auto_156682 ?auto_156681 ) ) ( ON ?auto_156682 ?auto_156684 ) ( ON-TABLE ?auto_156681 ) ( ON ?auto_156680 ?auto_156682 ) ( ON ?auto_156679 ?auto_156680 ) ( ON ?auto_156683 ?auto_156679 ) ( ON ?auto_156678 ?auto_156683 ) ( CLEAR ?auto_156678 ) ( HOLDING ?auto_156677 ) ( CLEAR ?auto_156676 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_156676 ?auto_156677 )
      ( MAKE-3PILE ?auto_156676 ?auto_156677 ?auto_156678 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156685 - BLOCK
      ?auto_156686 - BLOCK
      ?auto_156687 - BLOCK
    )
    :vars
    (
      ?auto_156690 - BLOCK
      ?auto_156691 - BLOCK
      ?auto_156692 - BLOCK
      ?auto_156693 - BLOCK
      ?auto_156688 - BLOCK
      ?auto_156689 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_156685 ) ( not ( = ?auto_156685 ?auto_156686 ) ) ( not ( = ?auto_156685 ?auto_156687 ) ) ( not ( = ?auto_156685 ?auto_156690 ) ) ( not ( = ?auto_156686 ?auto_156687 ) ) ( not ( = ?auto_156686 ?auto_156690 ) ) ( not ( = ?auto_156687 ?auto_156690 ) ) ( not ( = ?auto_156685 ?auto_156691 ) ) ( not ( = ?auto_156685 ?auto_156692 ) ) ( not ( = ?auto_156686 ?auto_156691 ) ) ( not ( = ?auto_156686 ?auto_156692 ) ) ( not ( = ?auto_156687 ?auto_156691 ) ) ( not ( = ?auto_156687 ?auto_156692 ) ) ( not ( = ?auto_156690 ?auto_156691 ) ) ( not ( = ?auto_156690 ?auto_156692 ) ) ( not ( = ?auto_156691 ?auto_156692 ) ) ( not ( = ?auto_156693 ?auto_156688 ) ) ( not ( = ?auto_156693 ?auto_156692 ) ) ( not ( = ?auto_156688 ?auto_156692 ) ) ( not ( = ?auto_156685 ?auto_156688 ) ) ( not ( = ?auto_156685 ?auto_156693 ) ) ( not ( = ?auto_156686 ?auto_156688 ) ) ( not ( = ?auto_156686 ?auto_156693 ) ) ( not ( = ?auto_156687 ?auto_156688 ) ) ( not ( = ?auto_156687 ?auto_156693 ) ) ( not ( = ?auto_156690 ?auto_156688 ) ) ( not ( = ?auto_156690 ?auto_156693 ) ) ( not ( = ?auto_156691 ?auto_156688 ) ) ( not ( = ?auto_156691 ?auto_156693 ) ) ( ON ?auto_156693 ?auto_156689 ) ( not ( = ?auto_156685 ?auto_156689 ) ) ( not ( = ?auto_156686 ?auto_156689 ) ) ( not ( = ?auto_156687 ?auto_156689 ) ) ( not ( = ?auto_156690 ?auto_156689 ) ) ( not ( = ?auto_156691 ?auto_156689 ) ) ( not ( = ?auto_156692 ?auto_156689 ) ) ( not ( = ?auto_156693 ?auto_156689 ) ) ( not ( = ?auto_156688 ?auto_156689 ) ) ( ON ?auto_156688 ?auto_156693 ) ( ON-TABLE ?auto_156689 ) ( ON ?auto_156692 ?auto_156688 ) ( ON ?auto_156691 ?auto_156692 ) ( ON ?auto_156690 ?auto_156691 ) ( ON ?auto_156687 ?auto_156690 ) ( CLEAR ?auto_156685 ) ( ON ?auto_156686 ?auto_156687 ) ( CLEAR ?auto_156686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_156689 ?auto_156693 ?auto_156688 ?auto_156692 ?auto_156691 ?auto_156690 ?auto_156687 )
      ( MAKE-3PILE ?auto_156685 ?auto_156686 ?auto_156687 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156694 - BLOCK
      ?auto_156695 - BLOCK
      ?auto_156696 - BLOCK
    )
    :vars
    (
      ?auto_156697 - BLOCK
      ?auto_156701 - BLOCK
      ?auto_156698 - BLOCK
      ?auto_156699 - BLOCK
      ?auto_156700 - BLOCK
      ?auto_156702 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156694 ?auto_156695 ) ) ( not ( = ?auto_156694 ?auto_156696 ) ) ( not ( = ?auto_156694 ?auto_156697 ) ) ( not ( = ?auto_156695 ?auto_156696 ) ) ( not ( = ?auto_156695 ?auto_156697 ) ) ( not ( = ?auto_156696 ?auto_156697 ) ) ( not ( = ?auto_156694 ?auto_156701 ) ) ( not ( = ?auto_156694 ?auto_156698 ) ) ( not ( = ?auto_156695 ?auto_156701 ) ) ( not ( = ?auto_156695 ?auto_156698 ) ) ( not ( = ?auto_156696 ?auto_156701 ) ) ( not ( = ?auto_156696 ?auto_156698 ) ) ( not ( = ?auto_156697 ?auto_156701 ) ) ( not ( = ?auto_156697 ?auto_156698 ) ) ( not ( = ?auto_156701 ?auto_156698 ) ) ( not ( = ?auto_156699 ?auto_156700 ) ) ( not ( = ?auto_156699 ?auto_156698 ) ) ( not ( = ?auto_156700 ?auto_156698 ) ) ( not ( = ?auto_156694 ?auto_156700 ) ) ( not ( = ?auto_156694 ?auto_156699 ) ) ( not ( = ?auto_156695 ?auto_156700 ) ) ( not ( = ?auto_156695 ?auto_156699 ) ) ( not ( = ?auto_156696 ?auto_156700 ) ) ( not ( = ?auto_156696 ?auto_156699 ) ) ( not ( = ?auto_156697 ?auto_156700 ) ) ( not ( = ?auto_156697 ?auto_156699 ) ) ( not ( = ?auto_156701 ?auto_156700 ) ) ( not ( = ?auto_156701 ?auto_156699 ) ) ( ON ?auto_156699 ?auto_156702 ) ( not ( = ?auto_156694 ?auto_156702 ) ) ( not ( = ?auto_156695 ?auto_156702 ) ) ( not ( = ?auto_156696 ?auto_156702 ) ) ( not ( = ?auto_156697 ?auto_156702 ) ) ( not ( = ?auto_156701 ?auto_156702 ) ) ( not ( = ?auto_156698 ?auto_156702 ) ) ( not ( = ?auto_156699 ?auto_156702 ) ) ( not ( = ?auto_156700 ?auto_156702 ) ) ( ON ?auto_156700 ?auto_156699 ) ( ON-TABLE ?auto_156702 ) ( ON ?auto_156698 ?auto_156700 ) ( ON ?auto_156701 ?auto_156698 ) ( ON ?auto_156697 ?auto_156701 ) ( ON ?auto_156696 ?auto_156697 ) ( ON ?auto_156695 ?auto_156696 ) ( CLEAR ?auto_156695 ) ( HOLDING ?auto_156694 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_156694 )
      ( MAKE-3PILE ?auto_156694 ?auto_156695 ?auto_156696 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156703 - BLOCK
      ?auto_156704 - BLOCK
      ?auto_156705 - BLOCK
    )
    :vars
    (
      ?auto_156710 - BLOCK
      ?auto_156707 - BLOCK
      ?auto_156706 - BLOCK
      ?auto_156709 - BLOCK
      ?auto_156711 - BLOCK
      ?auto_156708 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156703 ?auto_156704 ) ) ( not ( = ?auto_156703 ?auto_156705 ) ) ( not ( = ?auto_156703 ?auto_156710 ) ) ( not ( = ?auto_156704 ?auto_156705 ) ) ( not ( = ?auto_156704 ?auto_156710 ) ) ( not ( = ?auto_156705 ?auto_156710 ) ) ( not ( = ?auto_156703 ?auto_156707 ) ) ( not ( = ?auto_156703 ?auto_156706 ) ) ( not ( = ?auto_156704 ?auto_156707 ) ) ( not ( = ?auto_156704 ?auto_156706 ) ) ( not ( = ?auto_156705 ?auto_156707 ) ) ( not ( = ?auto_156705 ?auto_156706 ) ) ( not ( = ?auto_156710 ?auto_156707 ) ) ( not ( = ?auto_156710 ?auto_156706 ) ) ( not ( = ?auto_156707 ?auto_156706 ) ) ( not ( = ?auto_156709 ?auto_156711 ) ) ( not ( = ?auto_156709 ?auto_156706 ) ) ( not ( = ?auto_156711 ?auto_156706 ) ) ( not ( = ?auto_156703 ?auto_156711 ) ) ( not ( = ?auto_156703 ?auto_156709 ) ) ( not ( = ?auto_156704 ?auto_156711 ) ) ( not ( = ?auto_156704 ?auto_156709 ) ) ( not ( = ?auto_156705 ?auto_156711 ) ) ( not ( = ?auto_156705 ?auto_156709 ) ) ( not ( = ?auto_156710 ?auto_156711 ) ) ( not ( = ?auto_156710 ?auto_156709 ) ) ( not ( = ?auto_156707 ?auto_156711 ) ) ( not ( = ?auto_156707 ?auto_156709 ) ) ( ON ?auto_156709 ?auto_156708 ) ( not ( = ?auto_156703 ?auto_156708 ) ) ( not ( = ?auto_156704 ?auto_156708 ) ) ( not ( = ?auto_156705 ?auto_156708 ) ) ( not ( = ?auto_156710 ?auto_156708 ) ) ( not ( = ?auto_156707 ?auto_156708 ) ) ( not ( = ?auto_156706 ?auto_156708 ) ) ( not ( = ?auto_156709 ?auto_156708 ) ) ( not ( = ?auto_156711 ?auto_156708 ) ) ( ON ?auto_156711 ?auto_156709 ) ( ON-TABLE ?auto_156708 ) ( ON ?auto_156706 ?auto_156711 ) ( ON ?auto_156707 ?auto_156706 ) ( ON ?auto_156710 ?auto_156707 ) ( ON ?auto_156705 ?auto_156710 ) ( ON ?auto_156704 ?auto_156705 ) ( ON ?auto_156703 ?auto_156704 ) ( CLEAR ?auto_156703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_156708 ?auto_156709 ?auto_156711 ?auto_156706 ?auto_156707 ?auto_156710 ?auto_156705 ?auto_156704 )
      ( MAKE-3PILE ?auto_156703 ?auto_156704 ?auto_156705 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_156717 - BLOCK
      ?auto_156718 - BLOCK
      ?auto_156719 - BLOCK
      ?auto_156720 - BLOCK
      ?auto_156721 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_156721 ) ( CLEAR ?auto_156720 ) ( ON-TABLE ?auto_156717 ) ( ON ?auto_156718 ?auto_156717 ) ( ON ?auto_156719 ?auto_156718 ) ( ON ?auto_156720 ?auto_156719 ) ( not ( = ?auto_156717 ?auto_156718 ) ) ( not ( = ?auto_156717 ?auto_156719 ) ) ( not ( = ?auto_156717 ?auto_156720 ) ) ( not ( = ?auto_156717 ?auto_156721 ) ) ( not ( = ?auto_156718 ?auto_156719 ) ) ( not ( = ?auto_156718 ?auto_156720 ) ) ( not ( = ?auto_156718 ?auto_156721 ) ) ( not ( = ?auto_156719 ?auto_156720 ) ) ( not ( = ?auto_156719 ?auto_156721 ) ) ( not ( = ?auto_156720 ?auto_156721 ) ) )
    :subtasks
    ( ( !STACK ?auto_156721 ?auto_156720 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_156722 - BLOCK
      ?auto_156723 - BLOCK
      ?auto_156724 - BLOCK
      ?auto_156725 - BLOCK
      ?auto_156726 - BLOCK
    )
    :vars
    (
      ?auto_156727 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_156725 ) ( ON-TABLE ?auto_156722 ) ( ON ?auto_156723 ?auto_156722 ) ( ON ?auto_156724 ?auto_156723 ) ( ON ?auto_156725 ?auto_156724 ) ( not ( = ?auto_156722 ?auto_156723 ) ) ( not ( = ?auto_156722 ?auto_156724 ) ) ( not ( = ?auto_156722 ?auto_156725 ) ) ( not ( = ?auto_156722 ?auto_156726 ) ) ( not ( = ?auto_156723 ?auto_156724 ) ) ( not ( = ?auto_156723 ?auto_156725 ) ) ( not ( = ?auto_156723 ?auto_156726 ) ) ( not ( = ?auto_156724 ?auto_156725 ) ) ( not ( = ?auto_156724 ?auto_156726 ) ) ( not ( = ?auto_156725 ?auto_156726 ) ) ( ON ?auto_156726 ?auto_156727 ) ( CLEAR ?auto_156726 ) ( HAND-EMPTY ) ( not ( = ?auto_156722 ?auto_156727 ) ) ( not ( = ?auto_156723 ?auto_156727 ) ) ( not ( = ?auto_156724 ?auto_156727 ) ) ( not ( = ?auto_156725 ?auto_156727 ) ) ( not ( = ?auto_156726 ?auto_156727 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_156726 ?auto_156727 )
      ( MAKE-5PILE ?auto_156722 ?auto_156723 ?auto_156724 ?auto_156725 ?auto_156726 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_156728 - BLOCK
      ?auto_156729 - BLOCK
      ?auto_156730 - BLOCK
      ?auto_156731 - BLOCK
      ?auto_156732 - BLOCK
    )
    :vars
    (
      ?auto_156733 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_156728 ) ( ON ?auto_156729 ?auto_156728 ) ( ON ?auto_156730 ?auto_156729 ) ( not ( = ?auto_156728 ?auto_156729 ) ) ( not ( = ?auto_156728 ?auto_156730 ) ) ( not ( = ?auto_156728 ?auto_156731 ) ) ( not ( = ?auto_156728 ?auto_156732 ) ) ( not ( = ?auto_156729 ?auto_156730 ) ) ( not ( = ?auto_156729 ?auto_156731 ) ) ( not ( = ?auto_156729 ?auto_156732 ) ) ( not ( = ?auto_156730 ?auto_156731 ) ) ( not ( = ?auto_156730 ?auto_156732 ) ) ( not ( = ?auto_156731 ?auto_156732 ) ) ( ON ?auto_156732 ?auto_156733 ) ( CLEAR ?auto_156732 ) ( not ( = ?auto_156728 ?auto_156733 ) ) ( not ( = ?auto_156729 ?auto_156733 ) ) ( not ( = ?auto_156730 ?auto_156733 ) ) ( not ( = ?auto_156731 ?auto_156733 ) ) ( not ( = ?auto_156732 ?auto_156733 ) ) ( HOLDING ?auto_156731 ) ( CLEAR ?auto_156730 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_156728 ?auto_156729 ?auto_156730 ?auto_156731 )
      ( MAKE-5PILE ?auto_156728 ?auto_156729 ?auto_156730 ?auto_156731 ?auto_156732 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_156734 - BLOCK
      ?auto_156735 - BLOCK
      ?auto_156736 - BLOCK
      ?auto_156737 - BLOCK
      ?auto_156738 - BLOCK
    )
    :vars
    (
      ?auto_156739 - BLOCK
      ?auto_156740 - BLOCK
      ?auto_156741 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_156734 ) ( ON ?auto_156735 ?auto_156734 ) ( ON ?auto_156736 ?auto_156735 ) ( not ( = ?auto_156734 ?auto_156735 ) ) ( not ( = ?auto_156734 ?auto_156736 ) ) ( not ( = ?auto_156734 ?auto_156737 ) ) ( not ( = ?auto_156734 ?auto_156738 ) ) ( not ( = ?auto_156735 ?auto_156736 ) ) ( not ( = ?auto_156735 ?auto_156737 ) ) ( not ( = ?auto_156735 ?auto_156738 ) ) ( not ( = ?auto_156736 ?auto_156737 ) ) ( not ( = ?auto_156736 ?auto_156738 ) ) ( not ( = ?auto_156737 ?auto_156738 ) ) ( ON ?auto_156738 ?auto_156739 ) ( not ( = ?auto_156734 ?auto_156739 ) ) ( not ( = ?auto_156735 ?auto_156739 ) ) ( not ( = ?auto_156736 ?auto_156739 ) ) ( not ( = ?auto_156737 ?auto_156739 ) ) ( not ( = ?auto_156738 ?auto_156739 ) ) ( CLEAR ?auto_156736 ) ( ON ?auto_156737 ?auto_156738 ) ( CLEAR ?auto_156737 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_156740 ) ( ON ?auto_156741 ?auto_156740 ) ( ON ?auto_156739 ?auto_156741 ) ( not ( = ?auto_156740 ?auto_156741 ) ) ( not ( = ?auto_156740 ?auto_156739 ) ) ( not ( = ?auto_156740 ?auto_156738 ) ) ( not ( = ?auto_156740 ?auto_156737 ) ) ( not ( = ?auto_156741 ?auto_156739 ) ) ( not ( = ?auto_156741 ?auto_156738 ) ) ( not ( = ?auto_156741 ?auto_156737 ) ) ( not ( = ?auto_156734 ?auto_156740 ) ) ( not ( = ?auto_156734 ?auto_156741 ) ) ( not ( = ?auto_156735 ?auto_156740 ) ) ( not ( = ?auto_156735 ?auto_156741 ) ) ( not ( = ?auto_156736 ?auto_156740 ) ) ( not ( = ?auto_156736 ?auto_156741 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_156740 ?auto_156741 ?auto_156739 ?auto_156738 )
      ( MAKE-5PILE ?auto_156734 ?auto_156735 ?auto_156736 ?auto_156737 ?auto_156738 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_156742 - BLOCK
      ?auto_156743 - BLOCK
      ?auto_156744 - BLOCK
      ?auto_156745 - BLOCK
      ?auto_156746 - BLOCK
    )
    :vars
    (
      ?auto_156748 - BLOCK
      ?auto_156749 - BLOCK
      ?auto_156747 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_156742 ) ( ON ?auto_156743 ?auto_156742 ) ( not ( = ?auto_156742 ?auto_156743 ) ) ( not ( = ?auto_156742 ?auto_156744 ) ) ( not ( = ?auto_156742 ?auto_156745 ) ) ( not ( = ?auto_156742 ?auto_156746 ) ) ( not ( = ?auto_156743 ?auto_156744 ) ) ( not ( = ?auto_156743 ?auto_156745 ) ) ( not ( = ?auto_156743 ?auto_156746 ) ) ( not ( = ?auto_156744 ?auto_156745 ) ) ( not ( = ?auto_156744 ?auto_156746 ) ) ( not ( = ?auto_156745 ?auto_156746 ) ) ( ON ?auto_156746 ?auto_156748 ) ( not ( = ?auto_156742 ?auto_156748 ) ) ( not ( = ?auto_156743 ?auto_156748 ) ) ( not ( = ?auto_156744 ?auto_156748 ) ) ( not ( = ?auto_156745 ?auto_156748 ) ) ( not ( = ?auto_156746 ?auto_156748 ) ) ( ON ?auto_156745 ?auto_156746 ) ( CLEAR ?auto_156745 ) ( ON-TABLE ?auto_156749 ) ( ON ?auto_156747 ?auto_156749 ) ( ON ?auto_156748 ?auto_156747 ) ( not ( = ?auto_156749 ?auto_156747 ) ) ( not ( = ?auto_156749 ?auto_156748 ) ) ( not ( = ?auto_156749 ?auto_156746 ) ) ( not ( = ?auto_156749 ?auto_156745 ) ) ( not ( = ?auto_156747 ?auto_156748 ) ) ( not ( = ?auto_156747 ?auto_156746 ) ) ( not ( = ?auto_156747 ?auto_156745 ) ) ( not ( = ?auto_156742 ?auto_156749 ) ) ( not ( = ?auto_156742 ?auto_156747 ) ) ( not ( = ?auto_156743 ?auto_156749 ) ) ( not ( = ?auto_156743 ?auto_156747 ) ) ( not ( = ?auto_156744 ?auto_156749 ) ) ( not ( = ?auto_156744 ?auto_156747 ) ) ( HOLDING ?auto_156744 ) ( CLEAR ?auto_156743 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_156742 ?auto_156743 ?auto_156744 )
      ( MAKE-5PILE ?auto_156742 ?auto_156743 ?auto_156744 ?auto_156745 ?auto_156746 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_156750 - BLOCK
      ?auto_156751 - BLOCK
      ?auto_156752 - BLOCK
      ?auto_156753 - BLOCK
      ?auto_156754 - BLOCK
    )
    :vars
    (
      ?auto_156755 - BLOCK
      ?auto_156756 - BLOCK
      ?auto_156757 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_156750 ) ( ON ?auto_156751 ?auto_156750 ) ( not ( = ?auto_156750 ?auto_156751 ) ) ( not ( = ?auto_156750 ?auto_156752 ) ) ( not ( = ?auto_156750 ?auto_156753 ) ) ( not ( = ?auto_156750 ?auto_156754 ) ) ( not ( = ?auto_156751 ?auto_156752 ) ) ( not ( = ?auto_156751 ?auto_156753 ) ) ( not ( = ?auto_156751 ?auto_156754 ) ) ( not ( = ?auto_156752 ?auto_156753 ) ) ( not ( = ?auto_156752 ?auto_156754 ) ) ( not ( = ?auto_156753 ?auto_156754 ) ) ( ON ?auto_156754 ?auto_156755 ) ( not ( = ?auto_156750 ?auto_156755 ) ) ( not ( = ?auto_156751 ?auto_156755 ) ) ( not ( = ?auto_156752 ?auto_156755 ) ) ( not ( = ?auto_156753 ?auto_156755 ) ) ( not ( = ?auto_156754 ?auto_156755 ) ) ( ON ?auto_156753 ?auto_156754 ) ( ON-TABLE ?auto_156756 ) ( ON ?auto_156757 ?auto_156756 ) ( ON ?auto_156755 ?auto_156757 ) ( not ( = ?auto_156756 ?auto_156757 ) ) ( not ( = ?auto_156756 ?auto_156755 ) ) ( not ( = ?auto_156756 ?auto_156754 ) ) ( not ( = ?auto_156756 ?auto_156753 ) ) ( not ( = ?auto_156757 ?auto_156755 ) ) ( not ( = ?auto_156757 ?auto_156754 ) ) ( not ( = ?auto_156757 ?auto_156753 ) ) ( not ( = ?auto_156750 ?auto_156756 ) ) ( not ( = ?auto_156750 ?auto_156757 ) ) ( not ( = ?auto_156751 ?auto_156756 ) ) ( not ( = ?auto_156751 ?auto_156757 ) ) ( not ( = ?auto_156752 ?auto_156756 ) ) ( not ( = ?auto_156752 ?auto_156757 ) ) ( CLEAR ?auto_156751 ) ( ON ?auto_156752 ?auto_156753 ) ( CLEAR ?auto_156752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_156756 ?auto_156757 ?auto_156755 ?auto_156754 ?auto_156753 )
      ( MAKE-5PILE ?auto_156750 ?auto_156751 ?auto_156752 ?auto_156753 ?auto_156754 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_156758 - BLOCK
      ?auto_156759 - BLOCK
      ?auto_156760 - BLOCK
      ?auto_156761 - BLOCK
      ?auto_156762 - BLOCK
    )
    :vars
    (
      ?auto_156764 - BLOCK
      ?auto_156765 - BLOCK
      ?auto_156763 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_156758 ) ( not ( = ?auto_156758 ?auto_156759 ) ) ( not ( = ?auto_156758 ?auto_156760 ) ) ( not ( = ?auto_156758 ?auto_156761 ) ) ( not ( = ?auto_156758 ?auto_156762 ) ) ( not ( = ?auto_156759 ?auto_156760 ) ) ( not ( = ?auto_156759 ?auto_156761 ) ) ( not ( = ?auto_156759 ?auto_156762 ) ) ( not ( = ?auto_156760 ?auto_156761 ) ) ( not ( = ?auto_156760 ?auto_156762 ) ) ( not ( = ?auto_156761 ?auto_156762 ) ) ( ON ?auto_156762 ?auto_156764 ) ( not ( = ?auto_156758 ?auto_156764 ) ) ( not ( = ?auto_156759 ?auto_156764 ) ) ( not ( = ?auto_156760 ?auto_156764 ) ) ( not ( = ?auto_156761 ?auto_156764 ) ) ( not ( = ?auto_156762 ?auto_156764 ) ) ( ON ?auto_156761 ?auto_156762 ) ( ON-TABLE ?auto_156765 ) ( ON ?auto_156763 ?auto_156765 ) ( ON ?auto_156764 ?auto_156763 ) ( not ( = ?auto_156765 ?auto_156763 ) ) ( not ( = ?auto_156765 ?auto_156764 ) ) ( not ( = ?auto_156765 ?auto_156762 ) ) ( not ( = ?auto_156765 ?auto_156761 ) ) ( not ( = ?auto_156763 ?auto_156764 ) ) ( not ( = ?auto_156763 ?auto_156762 ) ) ( not ( = ?auto_156763 ?auto_156761 ) ) ( not ( = ?auto_156758 ?auto_156765 ) ) ( not ( = ?auto_156758 ?auto_156763 ) ) ( not ( = ?auto_156759 ?auto_156765 ) ) ( not ( = ?auto_156759 ?auto_156763 ) ) ( not ( = ?auto_156760 ?auto_156765 ) ) ( not ( = ?auto_156760 ?auto_156763 ) ) ( ON ?auto_156760 ?auto_156761 ) ( CLEAR ?auto_156760 ) ( HOLDING ?auto_156759 ) ( CLEAR ?auto_156758 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_156758 ?auto_156759 )
      ( MAKE-5PILE ?auto_156758 ?auto_156759 ?auto_156760 ?auto_156761 ?auto_156762 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_156766 - BLOCK
      ?auto_156767 - BLOCK
      ?auto_156768 - BLOCK
      ?auto_156769 - BLOCK
      ?auto_156770 - BLOCK
    )
    :vars
    (
      ?auto_156772 - BLOCK
      ?auto_156773 - BLOCK
      ?auto_156771 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_156766 ) ( not ( = ?auto_156766 ?auto_156767 ) ) ( not ( = ?auto_156766 ?auto_156768 ) ) ( not ( = ?auto_156766 ?auto_156769 ) ) ( not ( = ?auto_156766 ?auto_156770 ) ) ( not ( = ?auto_156767 ?auto_156768 ) ) ( not ( = ?auto_156767 ?auto_156769 ) ) ( not ( = ?auto_156767 ?auto_156770 ) ) ( not ( = ?auto_156768 ?auto_156769 ) ) ( not ( = ?auto_156768 ?auto_156770 ) ) ( not ( = ?auto_156769 ?auto_156770 ) ) ( ON ?auto_156770 ?auto_156772 ) ( not ( = ?auto_156766 ?auto_156772 ) ) ( not ( = ?auto_156767 ?auto_156772 ) ) ( not ( = ?auto_156768 ?auto_156772 ) ) ( not ( = ?auto_156769 ?auto_156772 ) ) ( not ( = ?auto_156770 ?auto_156772 ) ) ( ON ?auto_156769 ?auto_156770 ) ( ON-TABLE ?auto_156773 ) ( ON ?auto_156771 ?auto_156773 ) ( ON ?auto_156772 ?auto_156771 ) ( not ( = ?auto_156773 ?auto_156771 ) ) ( not ( = ?auto_156773 ?auto_156772 ) ) ( not ( = ?auto_156773 ?auto_156770 ) ) ( not ( = ?auto_156773 ?auto_156769 ) ) ( not ( = ?auto_156771 ?auto_156772 ) ) ( not ( = ?auto_156771 ?auto_156770 ) ) ( not ( = ?auto_156771 ?auto_156769 ) ) ( not ( = ?auto_156766 ?auto_156773 ) ) ( not ( = ?auto_156766 ?auto_156771 ) ) ( not ( = ?auto_156767 ?auto_156773 ) ) ( not ( = ?auto_156767 ?auto_156771 ) ) ( not ( = ?auto_156768 ?auto_156773 ) ) ( not ( = ?auto_156768 ?auto_156771 ) ) ( ON ?auto_156768 ?auto_156769 ) ( CLEAR ?auto_156766 ) ( ON ?auto_156767 ?auto_156768 ) ( CLEAR ?auto_156767 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_156773 ?auto_156771 ?auto_156772 ?auto_156770 ?auto_156769 ?auto_156768 )
      ( MAKE-5PILE ?auto_156766 ?auto_156767 ?auto_156768 ?auto_156769 ?auto_156770 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_156774 - BLOCK
      ?auto_156775 - BLOCK
      ?auto_156776 - BLOCK
      ?auto_156777 - BLOCK
      ?auto_156778 - BLOCK
    )
    :vars
    (
      ?auto_156780 - BLOCK
      ?auto_156779 - BLOCK
      ?auto_156781 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156774 ?auto_156775 ) ) ( not ( = ?auto_156774 ?auto_156776 ) ) ( not ( = ?auto_156774 ?auto_156777 ) ) ( not ( = ?auto_156774 ?auto_156778 ) ) ( not ( = ?auto_156775 ?auto_156776 ) ) ( not ( = ?auto_156775 ?auto_156777 ) ) ( not ( = ?auto_156775 ?auto_156778 ) ) ( not ( = ?auto_156776 ?auto_156777 ) ) ( not ( = ?auto_156776 ?auto_156778 ) ) ( not ( = ?auto_156777 ?auto_156778 ) ) ( ON ?auto_156778 ?auto_156780 ) ( not ( = ?auto_156774 ?auto_156780 ) ) ( not ( = ?auto_156775 ?auto_156780 ) ) ( not ( = ?auto_156776 ?auto_156780 ) ) ( not ( = ?auto_156777 ?auto_156780 ) ) ( not ( = ?auto_156778 ?auto_156780 ) ) ( ON ?auto_156777 ?auto_156778 ) ( ON-TABLE ?auto_156779 ) ( ON ?auto_156781 ?auto_156779 ) ( ON ?auto_156780 ?auto_156781 ) ( not ( = ?auto_156779 ?auto_156781 ) ) ( not ( = ?auto_156779 ?auto_156780 ) ) ( not ( = ?auto_156779 ?auto_156778 ) ) ( not ( = ?auto_156779 ?auto_156777 ) ) ( not ( = ?auto_156781 ?auto_156780 ) ) ( not ( = ?auto_156781 ?auto_156778 ) ) ( not ( = ?auto_156781 ?auto_156777 ) ) ( not ( = ?auto_156774 ?auto_156779 ) ) ( not ( = ?auto_156774 ?auto_156781 ) ) ( not ( = ?auto_156775 ?auto_156779 ) ) ( not ( = ?auto_156775 ?auto_156781 ) ) ( not ( = ?auto_156776 ?auto_156779 ) ) ( not ( = ?auto_156776 ?auto_156781 ) ) ( ON ?auto_156776 ?auto_156777 ) ( ON ?auto_156775 ?auto_156776 ) ( CLEAR ?auto_156775 ) ( HOLDING ?auto_156774 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_156774 )
      ( MAKE-5PILE ?auto_156774 ?auto_156775 ?auto_156776 ?auto_156777 ?auto_156778 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_156782 - BLOCK
      ?auto_156783 - BLOCK
      ?auto_156784 - BLOCK
      ?auto_156785 - BLOCK
      ?auto_156786 - BLOCK
    )
    :vars
    (
      ?auto_156789 - BLOCK
      ?auto_156788 - BLOCK
      ?auto_156787 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156782 ?auto_156783 ) ) ( not ( = ?auto_156782 ?auto_156784 ) ) ( not ( = ?auto_156782 ?auto_156785 ) ) ( not ( = ?auto_156782 ?auto_156786 ) ) ( not ( = ?auto_156783 ?auto_156784 ) ) ( not ( = ?auto_156783 ?auto_156785 ) ) ( not ( = ?auto_156783 ?auto_156786 ) ) ( not ( = ?auto_156784 ?auto_156785 ) ) ( not ( = ?auto_156784 ?auto_156786 ) ) ( not ( = ?auto_156785 ?auto_156786 ) ) ( ON ?auto_156786 ?auto_156789 ) ( not ( = ?auto_156782 ?auto_156789 ) ) ( not ( = ?auto_156783 ?auto_156789 ) ) ( not ( = ?auto_156784 ?auto_156789 ) ) ( not ( = ?auto_156785 ?auto_156789 ) ) ( not ( = ?auto_156786 ?auto_156789 ) ) ( ON ?auto_156785 ?auto_156786 ) ( ON-TABLE ?auto_156788 ) ( ON ?auto_156787 ?auto_156788 ) ( ON ?auto_156789 ?auto_156787 ) ( not ( = ?auto_156788 ?auto_156787 ) ) ( not ( = ?auto_156788 ?auto_156789 ) ) ( not ( = ?auto_156788 ?auto_156786 ) ) ( not ( = ?auto_156788 ?auto_156785 ) ) ( not ( = ?auto_156787 ?auto_156789 ) ) ( not ( = ?auto_156787 ?auto_156786 ) ) ( not ( = ?auto_156787 ?auto_156785 ) ) ( not ( = ?auto_156782 ?auto_156788 ) ) ( not ( = ?auto_156782 ?auto_156787 ) ) ( not ( = ?auto_156783 ?auto_156788 ) ) ( not ( = ?auto_156783 ?auto_156787 ) ) ( not ( = ?auto_156784 ?auto_156788 ) ) ( not ( = ?auto_156784 ?auto_156787 ) ) ( ON ?auto_156784 ?auto_156785 ) ( ON ?auto_156783 ?auto_156784 ) ( ON ?auto_156782 ?auto_156783 ) ( CLEAR ?auto_156782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_156788 ?auto_156787 ?auto_156789 ?auto_156786 ?auto_156785 ?auto_156784 ?auto_156783 )
      ( MAKE-5PILE ?auto_156782 ?auto_156783 ?auto_156784 ?auto_156785 ?auto_156786 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_156790 - BLOCK
      ?auto_156791 - BLOCK
      ?auto_156792 - BLOCK
      ?auto_156793 - BLOCK
      ?auto_156794 - BLOCK
    )
    :vars
    (
      ?auto_156797 - BLOCK
      ?auto_156796 - BLOCK
      ?auto_156795 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156790 ?auto_156791 ) ) ( not ( = ?auto_156790 ?auto_156792 ) ) ( not ( = ?auto_156790 ?auto_156793 ) ) ( not ( = ?auto_156790 ?auto_156794 ) ) ( not ( = ?auto_156791 ?auto_156792 ) ) ( not ( = ?auto_156791 ?auto_156793 ) ) ( not ( = ?auto_156791 ?auto_156794 ) ) ( not ( = ?auto_156792 ?auto_156793 ) ) ( not ( = ?auto_156792 ?auto_156794 ) ) ( not ( = ?auto_156793 ?auto_156794 ) ) ( ON ?auto_156794 ?auto_156797 ) ( not ( = ?auto_156790 ?auto_156797 ) ) ( not ( = ?auto_156791 ?auto_156797 ) ) ( not ( = ?auto_156792 ?auto_156797 ) ) ( not ( = ?auto_156793 ?auto_156797 ) ) ( not ( = ?auto_156794 ?auto_156797 ) ) ( ON ?auto_156793 ?auto_156794 ) ( ON-TABLE ?auto_156796 ) ( ON ?auto_156795 ?auto_156796 ) ( ON ?auto_156797 ?auto_156795 ) ( not ( = ?auto_156796 ?auto_156795 ) ) ( not ( = ?auto_156796 ?auto_156797 ) ) ( not ( = ?auto_156796 ?auto_156794 ) ) ( not ( = ?auto_156796 ?auto_156793 ) ) ( not ( = ?auto_156795 ?auto_156797 ) ) ( not ( = ?auto_156795 ?auto_156794 ) ) ( not ( = ?auto_156795 ?auto_156793 ) ) ( not ( = ?auto_156790 ?auto_156796 ) ) ( not ( = ?auto_156790 ?auto_156795 ) ) ( not ( = ?auto_156791 ?auto_156796 ) ) ( not ( = ?auto_156791 ?auto_156795 ) ) ( not ( = ?auto_156792 ?auto_156796 ) ) ( not ( = ?auto_156792 ?auto_156795 ) ) ( ON ?auto_156792 ?auto_156793 ) ( ON ?auto_156791 ?auto_156792 ) ( HOLDING ?auto_156790 ) ( CLEAR ?auto_156791 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_156796 ?auto_156795 ?auto_156797 ?auto_156794 ?auto_156793 ?auto_156792 ?auto_156791 ?auto_156790 )
      ( MAKE-5PILE ?auto_156790 ?auto_156791 ?auto_156792 ?auto_156793 ?auto_156794 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_156798 - BLOCK
      ?auto_156799 - BLOCK
      ?auto_156800 - BLOCK
      ?auto_156801 - BLOCK
      ?auto_156802 - BLOCK
    )
    :vars
    (
      ?auto_156805 - BLOCK
      ?auto_156803 - BLOCK
      ?auto_156804 - BLOCK
      ?auto_156806 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156798 ?auto_156799 ) ) ( not ( = ?auto_156798 ?auto_156800 ) ) ( not ( = ?auto_156798 ?auto_156801 ) ) ( not ( = ?auto_156798 ?auto_156802 ) ) ( not ( = ?auto_156799 ?auto_156800 ) ) ( not ( = ?auto_156799 ?auto_156801 ) ) ( not ( = ?auto_156799 ?auto_156802 ) ) ( not ( = ?auto_156800 ?auto_156801 ) ) ( not ( = ?auto_156800 ?auto_156802 ) ) ( not ( = ?auto_156801 ?auto_156802 ) ) ( ON ?auto_156802 ?auto_156805 ) ( not ( = ?auto_156798 ?auto_156805 ) ) ( not ( = ?auto_156799 ?auto_156805 ) ) ( not ( = ?auto_156800 ?auto_156805 ) ) ( not ( = ?auto_156801 ?auto_156805 ) ) ( not ( = ?auto_156802 ?auto_156805 ) ) ( ON ?auto_156801 ?auto_156802 ) ( ON-TABLE ?auto_156803 ) ( ON ?auto_156804 ?auto_156803 ) ( ON ?auto_156805 ?auto_156804 ) ( not ( = ?auto_156803 ?auto_156804 ) ) ( not ( = ?auto_156803 ?auto_156805 ) ) ( not ( = ?auto_156803 ?auto_156802 ) ) ( not ( = ?auto_156803 ?auto_156801 ) ) ( not ( = ?auto_156804 ?auto_156805 ) ) ( not ( = ?auto_156804 ?auto_156802 ) ) ( not ( = ?auto_156804 ?auto_156801 ) ) ( not ( = ?auto_156798 ?auto_156803 ) ) ( not ( = ?auto_156798 ?auto_156804 ) ) ( not ( = ?auto_156799 ?auto_156803 ) ) ( not ( = ?auto_156799 ?auto_156804 ) ) ( not ( = ?auto_156800 ?auto_156803 ) ) ( not ( = ?auto_156800 ?auto_156804 ) ) ( ON ?auto_156800 ?auto_156801 ) ( ON ?auto_156799 ?auto_156800 ) ( CLEAR ?auto_156799 ) ( ON ?auto_156798 ?auto_156806 ) ( CLEAR ?auto_156798 ) ( HAND-EMPTY ) ( not ( = ?auto_156798 ?auto_156806 ) ) ( not ( = ?auto_156799 ?auto_156806 ) ) ( not ( = ?auto_156800 ?auto_156806 ) ) ( not ( = ?auto_156801 ?auto_156806 ) ) ( not ( = ?auto_156802 ?auto_156806 ) ) ( not ( = ?auto_156805 ?auto_156806 ) ) ( not ( = ?auto_156803 ?auto_156806 ) ) ( not ( = ?auto_156804 ?auto_156806 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_156798 ?auto_156806 )
      ( MAKE-5PILE ?auto_156798 ?auto_156799 ?auto_156800 ?auto_156801 ?auto_156802 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_156807 - BLOCK
      ?auto_156808 - BLOCK
      ?auto_156809 - BLOCK
      ?auto_156810 - BLOCK
      ?auto_156811 - BLOCK
    )
    :vars
    (
      ?auto_156812 - BLOCK
      ?auto_156815 - BLOCK
      ?auto_156814 - BLOCK
      ?auto_156813 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156807 ?auto_156808 ) ) ( not ( = ?auto_156807 ?auto_156809 ) ) ( not ( = ?auto_156807 ?auto_156810 ) ) ( not ( = ?auto_156807 ?auto_156811 ) ) ( not ( = ?auto_156808 ?auto_156809 ) ) ( not ( = ?auto_156808 ?auto_156810 ) ) ( not ( = ?auto_156808 ?auto_156811 ) ) ( not ( = ?auto_156809 ?auto_156810 ) ) ( not ( = ?auto_156809 ?auto_156811 ) ) ( not ( = ?auto_156810 ?auto_156811 ) ) ( ON ?auto_156811 ?auto_156812 ) ( not ( = ?auto_156807 ?auto_156812 ) ) ( not ( = ?auto_156808 ?auto_156812 ) ) ( not ( = ?auto_156809 ?auto_156812 ) ) ( not ( = ?auto_156810 ?auto_156812 ) ) ( not ( = ?auto_156811 ?auto_156812 ) ) ( ON ?auto_156810 ?auto_156811 ) ( ON-TABLE ?auto_156815 ) ( ON ?auto_156814 ?auto_156815 ) ( ON ?auto_156812 ?auto_156814 ) ( not ( = ?auto_156815 ?auto_156814 ) ) ( not ( = ?auto_156815 ?auto_156812 ) ) ( not ( = ?auto_156815 ?auto_156811 ) ) ( not ( = ?auto_156815 ?auto_156810 ) ) ( not ( = ?auto_156814 ?auto_156812 ) ) ( not ( = ?auto_156814 ?auto_156811 ) ) ( not ( = ?auto_156814 ?auto_156810 ) ) ( not ( = ?auto_156807 ?auto_156815 ) ) ( not ( = ?auto_156807 ?auto_156814 ) ) ( not ( = ?auto_156808 ?auto_156815 ) ) ( not ( = ?auto_156808 ?auto_156814 ) ) ( not ( = ?auto_156809 ?auto_156815 ) ) ( not ( = ?auto_156809 ?auto_156814 ) ) ( ON ?auto_156809 ?auto_156810 ) ( ON ?auto_156807 ?auto_156813 ) ( CLEAR ?auto_156807 ) ( not ( = ?auto_156807 ?auto_156813 ) ) ( not ( = ?auto_156808 ?auto_156813 ) ) ( not ( = ?auto_156809 ?auto_156813 ) ) ( not ( = ?auto_156810 ?auto_156813 ) ) ( not ( = ?auto_156811 ?auto_156813 ) ) ( not ( = ?auto_156812 ?auto_156813 ) ) ( not ( = ?auto_156815 ?auto_156813 ) ) ( not ( = ?auto_156814 ?auto_156813 ) ) ( HOLDING ?auto_156808 ) ( CLEAR ?auto_156809 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_156815 ?auto_156814 ?auto_156812 ?auto_156811 ?auto_156810 ?auto_156809 ?auto_156808 )
      ( MAKE-5PILE ?auto_156807 ?auto_156808 ?auto_156809 ?auto_156810 ?auto_156811 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_156816 - BLOCK
      ?auto_156817 - BLOCK
      ?auto_156818 - BLOCK
      ?auto_156819 - BLOCK
      ?auto_156820 - BLOCK
    )
    :vars
    (
      ?auto_156822 - BLOCK
      ?auto_156824 - BLOCK
      ?auto_156823 - BLOCK
      ?auto_156821 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156816 ?auto_156817 ) ) ( not ( = ?auto_156816 ?auto_156818 ) ) ( not ( = ?auto_156816 ?auto_156819 ) ) ( not ( = ?auto_156816 ?auto_156820 ) ) ( not ( = ?auto_156817 ?auto_156818 ) ) ( not ( = ?auto_156817 ?auto_156819 ) ) ( not ( = ?auto_156817 ?auto_156820 ) ) ( not ( = ?auto_156818 ?auto_156819 ) ) ( not ( = ?auto_156818 ?auto_156820 ) ) ( not ( = ?auto_156819 ?auto_156820 ) ) ( ON ?auto_156820 ?auto_156822 ) ( not ( = ?auto_156816 ?auto_156822 ) ) ( not ( = ?auto_156817 ?auto_156822 ) ) ( not ( = ?auto_156818 ?auto_156822 ) ) ( not ( = ?auto_156819 ?auto_156822 ) ) ( not ( = ?auto_156820 ?auto_156822 ) ) ( ON ?auto_156819 ?auto_156820 ) ( ON-TABLE ?auto_156824 ) ( ON ?auto_156823 ?auto_156824 ) ( ON ?auto_156822 ?auto_156823 ) ( not ( = ?auto_156824 ?auto_156823 ) ) ( not ( = ?auto_156824 ?auto_156822 ) ) ( not ( = ?auto_156824 ?auto_156820 ) ) ( not ( = ?auto_156824 ?auto_156819 ) ) ( not ( = ?auto_156823 ?auto_156822 ) ) ( not ( = ?auto_156823 ?auto_156820 ) ) ( not ( = ?auto_156823 ?auto_156819 ) ) ( not ( = ?auto_156816 ?auto_156824 ) ) ( not ( = ?auto_156816 ?auto_156823 ) ) ( not ( = ?auto_156817 ?auto_156824 ) ) ( not ( = ?auto_156817 ?auto_156823 ) ) ( not ( = ?auto_156818 ?auto_156824 ) ) ( not ( = ?auto_156818 ?auto_156823 ) ) ( ON ?auto_156818 ?auto_156819 ) ( ON ?auto_156816 ?auto_156821 ) ( not ( = ?auto_156816 ?auto_156821 ) ) ( not ( = ?auto_156817 ?auto_156821 ) ) ( not ( = ?auto_156818 ?auto_156821 ) ) ( not ( = ?auto_156819 ?auto_156821 ) ) ( not ( = ?auto_156820 ?auto_156821 ) ) ( not ( = ?auto_156822 ?auto_156821 ) ) ( not ( = ?auto_156824 ?auto_156821 ) ) ( not ( = ?auto_156823 ?auto_156821 ) ) ( CLEAR ?auto_156818 ) ( ON ?auto_156817 ?auto_156816 ) ( CLEAR ?auto_156817 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_156821 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_156821 ?auto_156816 )
      ( MAKE-5PILE ?auto_156816 ?auto_156817 ?auto_156818 ?auto_156819 ?auto_156820 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_156825 - BLOCK
      ?auto_156826 - BLOCK
      ?auto_156827 - BLOCK
      ?auto_156828 - BLOCK
      ?auto_156829 - BLOCK
    )
    :vars
    (
      ?auto_156831 - BLOCK
      ?auto_156833 - BLOCK
      ?auto_156830 - BLOCK
      ?auto_156832 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156825 ?auto_156826 ) ) ( not ( = ?auto_156825 ?auto_156827 ) ) ( not ( = ?auto_156825 ?auto_156828 ) ) ( not ( = ?auto_156825 ?auto_156829 ) ) ( not ( = ?auto_156826 ?auto_156827 ) ) ( not ( = ?auto_156826 ?auto_156828 ) ) ( not ( = ?auto_156826 ?auto_156829 ) ) ( not ( = ?auto_156827 ?auto_156828 ) ) ( not ( = ?auto_156827 ?auto_156829 ) ) ( not ( = ?auto_156828 ?auto_156829 ) ) ( ON ?auto_156829 ?auto_156831 ) ( not ( = ?auto_156825 ?auto_156831 ) ) ( not ( = ?auto_156826 ?auto_156831 ) ) ( not ( = ?auto_156827 ?auto_156831 ) ) ( not ( = ?auto_156828 ?auto_156831 ) ) ( not ( = ?auto_156829 ?auto_156831 ) ) ( ON ?auto_156828 ?auto_156829 ) ( ON-TABLE ?auto_156833 ) ( ON ?auto_156830 ?auto_156833 ) ( ON ?auto_156831 ?auto_156830 ) ( not ( = ?auto_156833 ?auto_156830 ) ) ( not ( = ?auto_156833 ?auto_156831 ) ) ( not ( = ?auto_156833 ?auto_156829 ) ) ( not ( = ?auto_156833 ?auto_156828 ) ) ( not ( = ?auto_156830 ?auto_156831 ) ) ( not ( = ?auto_156830 ?auto_156829 ) ) ( not ( = ?auto_156830 ?auto_156828 ) ) ( not ( = ?auto_156825 ?auto_156833 ) ) ( not ( = ?auto_156825 ?auto_156830 ) ) ( not ( = ?auto_156826 ?auto_156833 ) ) ( not ( = ?auto_156826 ?auto_156830 ) ) ( not ( = ?auto_156827 ?auto_156833 ) ) ( not ( = ?auto_156827 ?auto_156830 ) ) ( ON ?auto_156825 ?auto_156832 ) ( not ( = ?auto_156825 ?auto_156832 ) ) ( not ( = ?auto_156826 ?auto_156832 ) ) ( not ( = ?auto_156827 ?auto_156832 ) ) ( not ( = ?auto_156828 ?auto_156832 ) ) ( not ( = ?auto_156829 ?auto_156832 ) ) ( not ( = ?auto_156831 ?auto_156832 ) ) ( not ( = ?auto_156833 ?auto_156832 ) ) ( not ( = ?auto_156830 ?auto_156832 ) ) ( ON ?auto_156826 ?auto_156825 ) ( CLEAR ?auto_156826 ) ( ON-TABLE ?auto_156832 ) ( HOLDING ?auto_156827 ) ( CLEAR ?auto_156828 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_156833 ?auto_156830 ?auto_156831 ?auto_156829 ?auto_156828 ?auto_156827 )
      ( MAKE-5PILE ?auto_156825 ?auto_156826 ?auto_156827 ?auto_156828 ?auto_156829 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_156834 - BLOCK
      ?auto_156835 - BLOCK
      ?auto_156836 - BLOCK
      ?auto_156837 - BLOCK
      ?auto_156838 - BLOCK
    )
    :vars
    (
      ?auto_156842 - BLOCK
      ?auto_156841 - BLOCK
      ?auto_156839 - BLOCK
      ?auto_156840 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156834 ?auto_156835 ) ) ( not ( = ?auto_156834 ?auto_156836 ) ) ( not ( = ?auto_156834 ?auto_156837 ) ) ( not ( = ?auto_156834 ?auto_156838 ) ) ( not ( = ?auto_156835 ?auto_156836 ) ) ( not ( = ?auto_156835 ?auto_156837 ) ) ( not ( = ?auto_156835 ?auto_156838 ) ) ( not ( = ?auto_156836 ?auto_156837 ) ) ( not ( = ?auto_156836 ?auto_156838 ) ) ( not ( = ?auto_156837 ?auto_156838 ) ) ( ON ?auto_156838 ?auto_156842 ) ( not ( = ?auto_156834 ?auto_156842 ) ) ( not ( = ?auto_156835 ?auto_156842 ) ) ( not ( = ?auto_156836 ?auto_156842 ) ) ( not ( = ?auto_156837 ?auto_156842 ) ) ( not ( = ?auto_156838 ?auto_156842 ) ) ( ON ?auto_156837 ?auto_156838 ) ( ON-TABLE ?auto_156841 ) ( ON ?auto_156839 ?auto_156841 ) ( ON ?auto_156842 ?auto_156839 ) ( not ( = ?auto_156841 ?auto_156839 ) ) ( not ( = ?auto_156841 ?auto_156842 ) ) ( not ( = ?auto_156841 ?auto_156838 ) ) ( not ( = ?auto_156841 ?auto_156837 ) ) ( not ( = ?auto_156839 ?auto_156842 ) ) ( not ( = ?auto_156839 ?auto_156838 ) ) ( not ( = ?auto_156839 ?auto_156837 ) ) ( not ( = ?auto_156834 ?auto_156841 ) ) ( not ( = ?auto_156834 ?auto_156839 ) ) ( not ( = ?auto_156835 ?auto_156841 ) ) ( not ( = ?auto_156835 ?auto_156839 ) ) ( not ( = ?auto_156836 ?auto_156841 ) ) ( not ( = ?auto_156836 ?auto_156839 ) ) ( ON ?auto_156834 ?auto_156840 ) ( not ( = ?auto_156834 ?auto_156840 ) ) ( not ( = ?auto_156835 ?auto_156840 ) ) ( not ( = ?auto_156836 ?auto_156840 ) ) ( not ( = ?auto_156837 ?auto_156840 ) ) ( not ( = ?auto_156838 ?auto_156840 ) ) ( not ( = ?auto_156842 ?auto_156840 ) ) ( not ( = ?auto_156841 ?auto_156840 ) ) ( not ( = ?auto_156839 ?auto_156840 ) ) ( ON ?auto_156835 ?auto_156834 ) ( ON-TABLE ?auto_156840 ) ( CLEAR ?auto_156837 ) ( ON ?auto_156836 ?auto_156835 ) ( CLEAR ?auto_156836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_156840 ?auto_156834 ?auto_156835 )
      ( MAKE-5PILE ?auto_156834 ?auto_156835 ?auto_156836 ?auto_156837 ?auto_156838 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_156843 - BLOCK
      ?auto_156844 - BLOCK
      ?auto_156845 - BLOCK
      ?auto_156846 - BLOCK
      ?auto_156847 - BLOCK
    )
    :vars
    (
      ?auto_156851 - BLOCK
      ?auto_156850 - BLOCK
      ?auto_156849 - BLOCK
      ?auto_156848 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156843 ?auto_156844 ) ) ( not ( = ?auto_156843 ?auto_156845 ) ) ( not ( = ?auto_156843 ?auto_156846 ) ) ( not ( = ?auto_156843 ?auto_156847 ) ) ( not ( = ?auto_156844 ?auto_156845 ) ) ( not ( = ?auto_156844 ?auto_156846 ) ) ( not ( = ?auto_156844 ?auto_156847 ) ) ( not ( = ?auto_156845 ?auto_156846 ) ) ( not ( = ?auto_156845 ?auto_156847 ) ) ( not ( = ?auto_156846 ?auto_156847 ) ) ( ON ?auto_156847 ?auto_156851 ) ( not ( = ?auto_156843 ?auto_156851 ) ) ( not ( = ?auto_156844 ?auto_156851 ) ) ( not ( = ?auto_156845 ?auto_156851 ) ) ( not ( = ?auto_156846 ?auto_156851 ) ) ( not ( = ?auto_156847 ?auto_156851 ) ) ( ON-TABLE ?auto_156850 ) ( ON ?auto_156849 ?auto_156850 ) ( ON ?auto_156851 ?auto_156849 ) ( not ( = ?auto_156850 ?auto_156849 ) ) ( not ( = ?auto_156850 ?auto_156851 ) ) ( not ( = ?auto_156850 ?auto_156847 ) ) ( not ( = ?auto_156850 ?auto_156846 ) ) ( not ( = ?auto_156849 ?auto_156851 ) ) ( not ( = ?auto_156849 ?auto_156847 ) ) ( not ( = ?auto_156849 ?auto_156846 ) ) ( not ( = ?auto_156843 ?auto_156850 ) ) ( not ( = ?auto_156843 ?auto_156849 ) ) ( not ( = ?auto_156844 ?auto_156850 ) ) ( not ( = ?auto_156844 ?auto_156849 ) ) ( not ( = ?auto_156845 ?auto_156850 ) ) ( not ( = ?auto_156845 ?auto_156849 ) ) ( ON ?auto_156843 ?auto_156848 ) ( not ( = ?auto_156843 ?auto_156848 ) ) ( not ( = ?auto_156844 ?auto_156848 ) ) ( not ( = ?auto_156845 ?auto_156848 ) ) ( not ( = ?auto_156846 ?auto_156848 ) ) ( not ( = ?auto_156847 ?auto_156848 ) ) ( not ( = ?auto_156851 ?auto_156848 ) ) ( not ( = ?auto_156850 ?auto_156848 ) ) ( not ( = ?auto_156849 ?auto_156848 ) ) ( ON ?auto_156844 ?auto_156843 ) ( ON-TABLE ?auto_156848 ) ( ON ?auto_156845 ?auto_156844 ) ( CLEAR ?auto_156845 ) ( HOLDING ?auto_156846 ) ( CLEAR ?auto_156847 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_156850 ?auto_156849 ?auto_156851 ?auto_156847 ?auto_156846 )
      ( MAKE-5PILE ?auto_156843 ?auto_156844 ?auto_156845 ?auto_156846 ?auto_156847 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_156852 - BLOCK
      ?auto_156853 - BLOCK
      ?auto_156854 - BLOCK
      ?auto_156855 - BLOCK
      ?auto_156856 - BLOCK
    )
    :vars
    (
      ?auto_156857 - BLOCK
      ?auto_156858 - BLOCK
      ?auto_156859 - BLOCK
      ?auto_156860 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156852 ?auto_156853 ) ) ( not ( = ?auto_156852 ?auto_156854 ) ) ( not ( = ?auto_156852 ?auto_156855 ) ) ( not ( = ?auto_156852 ?auto_156856 ) ) ( not ( = ?auto_156853 ?auto_156854 ) ) ( not ( = ?auto_156853 ?auto_156855 ) ) ( not ( = ?auto_156853 ?auto_156856 ) ) ( not ( = ?auto_156854 ?auto_156855 ) ) ( not ( = ?auto_156854 ?auto_156856 ) ) ( not ( = ?auto_156855 ?auto_156856 ) ) ( ON ?auto_156856 ?auto_156857 ) ( not ( = ?auto_156852 ?auto_156857 ) ) ( not ( = ?auto_156853 ?auto_156857 ) ) ( not ( = ?auto_156854 ?auto_156857 ) ) ( not ( = ?auto_156855 ?auto_156857 ) ) ( not ( = ?auto_156856 ?auto_156857 ) ) ( ON-TABLE ?auto_156858 ) ( ON ?auto_156859 ?auto_156858 ) ( ON ?auto_156857 ?auto_156859 ) ( not ( = ?auto_156858 ?auto_156859 ) ) ( not ( = ?auto_156858 ?auto_156857 ) ) ( not ( = ?auto_156858 ?auto_156856 ) ) ( not ( = ?auto_156858 ?auto_156855 ) ) ( not ( = ?auto_156859 ?auto_156857 ) ) ( not ( = ?auto_156859 ?auto_156856 ) ) ( not ( = ?auto_156859 ?auto_156855 ) ) ( not ( = ?auto_156852 ?auto_156858 ) ) ( not ( = ?auto_156852 ?auto_156859 ) ) ( not ( = ?auto_156853 ?auto_156858 ) ) ( not ( = ?auto_156853 ?auto_156859 ) ) ( not ( = ?auto_156854 ?auto_156858 ) ) ( not ( = ?auto_156854 ?auto_156859 ) ) ( ON ?auto_156852 ?auto_156860 ) ( not ( = ?auto_156852 ?auto_156860 ) ) ( not ( = ?auto_156853 ?auto_156860 ) ) ( not ( = ?auto_156854 ?auto_156860 ) ) ( not ( = ?auto_156855 ?auto_156860 ) ) ( not ( = ?auto_156856 ?auto_156860 ) ) ( not ( = ?auto_156857 ?auto_156860 ) ) ( not ( = ?auto_156858 ?auto_156860 ) ) ( not ( = ?auto_156859 ?auto_156860 ) ) ( ON ?auto_156853 ?auto_156852 ) ( ON-TABLE ?auto_156860 ) ( ON ?auto_156854 ?auto_156853 ) ( CLEAR ?auto_156856 ) ( ON ?auto_156855 ?auto_156854 ) ( CLEAR ?auto_156855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_156860 ?auto_156852 ?auto_156853 ?auto_156854 )
      ( MAKE-5PILE ?auto_156852 ?auto_156853 ?auto_156854 ?auto_156855 ?auto_156856 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_156861 - BLOCK
      ?auto_156862 - BLOCK
      ?auto_156863 - BLOCK
      ?auto_156864 - BLOCK
      ?auto_156865 - BLOCK
    )
    :vars
    (
      ?auto_156866 - BLOCK
      ?auto_156869 - BLOCK
      ?auto_156867 - BLOCK
      ?auto_156868 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156861 ?auto_156862 ) ) ( not ( = ?auto_156861 ?auto_156863 ) ) ( not ( = ?auto_156861 ?auto_156864 ) ) ( not ( = ?auto_156861 ?auto_156865 ) ) ( not ( = ?auto_156862 ?auto_156863 ) ) ( not ( = ?auto_156862 ?auto_156864 ) ) ( not ( = ?auto_156862 ?auto_156865 ) ) ( not ( = ?auto_156863 ?auto_156864 ) ) ( not ( = ?auto_156863 ?auto_156865 ) ) ( not ( = ?auto_156864 ?auto_156865 ) ) ( not ( = ?auto_156861 ?auto_156866 ) ) ( not ( = ?auto_156862 ?auto_156866 ) ) ( not ( = ?auto_156863 ?auto_156866 ) ) ( not ( = ?auto_156864 ?auto_156866 ) ) ( not ( = ?auto_156865 ?auto_156866 ) ) ( ON-TABLE ?auto_156869 ) ( ON ?auto_156867 ?auto_156869 ) ( ON ?auto_156866 ?auto_156867 ) ( not ( = ?auto_156869 ?auto_156867 ) ) ( not ( = ?auto_156869 ?auto_156866 ) ) ( not ( = ?auto_156869 ?auto_156865 ) ) ( not ( = ?auto_156869 ?auto_156864 ) ) ( not ( = ?auto_156867 ?auto_156866 ) ) ( not ( = ?auto_156867 ?auto_156865 ) ) ( not ( = ?auto_156867 ?auto_156864 ) ) ( not ( = ?auto_156861 ?auto_156869 ) ) ( not ( = ?auto_156861 ?auto_156867 ) ) ( not ( = ?auto_156862 ?auto_156869 ) ) ( not ( = ?auto_156862 ?auto_156867 ) ) ( not ( = ?auto_156863 ?auto_156869 ) ) ( not ( = ?auto_156863 ?auto_156867 ) ) ( ON ?auto_156861 ?auto_156868 ) ( not ( = ?auto_156861 ?auto_156868 ) ) ( not ( = ?auto_156862 ?auto_156868 ) ) ( not ( = ?auto_156863 ?auto_156868 ) ) ( not ( = ?auto_156864 ?auto_156868 ) ) ( not ( = ?auto_156865 ?auto_156868 ) ) ( not ( = ?auto_156866 ?auto_156868 ) ) ( not ( = ?auto_156869 ?auto_156868 ) ) ( not ( = ?auto_156867 ?auto_156868 ) ) ( ON ?auto_156862 ?auto_156861 ) ( ON-TABLE ?auto_156868 ) ( ON ?auto_156863 ?auto_156862 ) ( ON ?auto_156864 ?auto_156863 ) ( CLEAR ?auto_156864 ) ( HOLDING ?auto_156865 ) ( CLEAR ?auto_156866 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_156869 ?auto_156867 ?auto_156866 ?auto_156865 )
      ( MAKE-5PILE ?auto_156861 ?auto_156862 ?auto_156863 ?auto_156864 ?auto_156865 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_156870 - BLOCK
      ?auto_156871 - BLOCK
      ?auto_156872 - BLOCK
      ?auto_156873 - BLOCK
      ?auto_156874 - BLOCK
    )
    :vars
    (
      ?auto_156875 - BLOCK
      ?auto_156877 - BLOCK
      ?auto_156876 - BLOCK
      ?auto_156878 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156870 ?auto_156871 ) ) ( not ( = ?auto_156870 ?auto_156872 ) ) ( not ( = ?auto_156870 ?auto_156873 ) ) ( not ( = ?auto_156870 ?auto_156874 ) ) ( not ( = ?auto_156871 ?auto_156872 ) ) ( not ( = ?auto_156871 ?auto_156873 ) ) ( not ( = ?auto_156871 ?auto_156874 ) ) ( not ( = ?auto_156872 ?auto_156873 ) ) ( not ( = ?auto_156872 ?auto_156874 ) ) ( not ( = ?auto_156873 ?auto_156874 ) ) ( not ( = ?auto_156870 ?auto_156875 ) ) ( not ( = ?auto_156871 ?auto_156875 ) ) ( not ( = ?auto_156872 ?auto_156875 ) ) ( not ( = ?auto_156873 ?auto_156875 ) ) ( not ( = ?auto_156874 ?auto_156875 ) ) ( ON-TABLE ?auto_156877 ) ( ON ?auto_156876 ?auto_156877 ) ( ON ?auto_156875 ?auto_156876 ) ( not ( = ?auto_156877 ?auto_156876 ) ) ( not ( = ?auto_156877 ?auto_156875 ) ) ( not ( = ?auto_156877 ?auto_156874 ) ) ( not ( = ?auto_156877 ?auto_156873 ) ) ( not ( = ?auto_156876 ?auto_156875 ) ) ( not ( = ?auto_156876 ?auto_156874 ) ) ( not ( = ?auto_156876 ?auto_156873 ) ) ( not ( = ?auto_156870 ?auto_156877 ) ) ( not ( = ?auto_156870 ?auto_156876 ) ) ( not ( = ?auto_156871 ?auto_156877 ) ) ( not ( = ?auto_156871 ?auto_156876 ) ) ( not ( = ?auto_156872 ?auto_156877 ) ) ( not ( = ?auto_156872 ?auto_156876 ) ) ( ON ?auto_156870 ?auto_156878 ) ( not ( = ?auto_156870 ?auto_156878 ) ) ( not ( = ?auto_156871 ?auto_156878 ) ) ( not ( = ?auto_156872 ?auto_156878 ) ) ( not ( = ?auto_156873 ?auto_156878 ) ) ( not ( = ?auto_156874 ?auto_156878 ) ) ( not ( = ?auto_156875 ?auto_156878 ) ) ( not ( = ?auto_156877 ?auto_156878 ) ) ( not ( = ?auto_156876 ?auto_156878 ) ) ( ON ?auto_156871 ?auto_156870 ) ( ON-TABLE ?auto_156878 ) ( ON ?auto_156872 ?auto_156871 ) ( ON ?auto_156873 ?auto_156872 ) ( CLEAR ?auto_156875 ) ( ON ?auto_156874 ?auto_156873 ) ( CLEAR ?auto_156874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_156878 ?auto_156870 ?auto_156871 ?auto_156872 ?auto_156873 )
      ( MAKE-5PILE ?auto_156870 ?auto_156871 ?auto_156872 ?auto_156873 ?auto_156874 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_156879 - BLOCK
      ?auto_156880 - BLOCK
      ?auto_156881 - BLOCK
      ?auto_156882 - BLOCK
      ?auto_156883 - BLOCK
    )
    :vars
    (
      ?auto_156887 - BLOCK
      ?auto_156884 - BLOCK
      ?auto_156886 - BLOCK
      ?auto_156885 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156879 ?auto_156880 ) ) ( not ( = ?auto_156879 ?auto_156881 ) ) ( not ( = ?auto_156879 ?auto_156882 ) ) ( not ( = ?auto_156879 ?auto_156883 ) ) ( not ( = ?auto_156880 ?auto_156881 ) ) ( not ( = ?auto_156880 ?auto_156882 ) ) ( not ( = ?auto_156880 ?auto_156883 ) ) ( not ( = ?auto_156881 ?auto_156882 ) ) ( not ( = ?auto_156881 ?auto_156883 ) ) ( not ( = ?auto_156882 ?auto_156883 ) ) ( not ( = ?auto_156879 ?auto_156887 ) ) ( not ( = ?auto_156880 ?auto_156887 ) ) ( not ( = ?auto_156881 ?auto_156887 ) ) ( not ( = ?auto_156882 ?auto_156887 ) ) ( not ( = ?auto_156883 ?auto_156887 ) ) ( ON-TABLE ?auto_156884 ) ( ON ?auto_156886 ?auto_156884 ) ( not ( = ?auto_156884 ?auto_156886 ) ) ( not ( = ?auto_156884 ?auto_156887 ) ) ( not ( = ?auto_156884 ?auto_156883 ) ) ( not ( = ?auto_156884 ?auto_156882 ) ) ( not ( = ?auto_156886 ?auto_156887 ) ) ( not ( = ?auto_156886 ?auto_156883 ) ) ( not ( = ?auto_156886 ?auto_156882 ) ) ( not ( = ?auto_156879 ?auto_156884 ) ) ( not ( = ?auto_156879 ?auto_156886 ) ) ( not ( = ?auto_156880 ?auto_156884 ) ) ( not ( = ?auto_156880 ?auto_156886 ) ) ( not ( = ?auto_156881 ?auto_156884 ) ) ( not ( = ?auto_156881 ?auto_156886 ) ) ( ON ?auto_156879 ?auto_156885 ) ( not ( = ?auto_156879 ?auto_156885 ) ) ( not ( = ?auto_156880 ?auto_156885 ) ) ( not ( = ?auto_156881 ?auto_156885 ) ) ( not ( = ?auto_156882 ?auto_156885 ) ) ( not ( = ?auto_156883 ?auto_156885 ) ) ( not ( = ?auto_156887 ?auto_156885 ) ) ( not ( = ?auto_156884 ?auto_156885 ) ) ( not ( = ?auto_156886 ?auto_156885 ) ) ( ON ?auto_156880 ?auto_156879 ) ( ON-TABLE ?auto_156885 ) ( ON ?auto_156881 ?auto_156880 ) ( ON ?auto_156882 ?auto_156881 ) ( ON ?auto_156883 ?auto_156882 ) ( CLEAR ?auto_156883 ) ( HOLDING ?auto_156887 ) ( CLEAR ?auto_156886 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_156884 ?auto_156886 ?auto_156887 )
      ( MAKE-5PILE ?auto_156879 ?auto_156880 ?auto_156881 ?auto_156882 ?auto_156883 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_156888 - BLOCK
      ?auto_156889 - BLOCK
      ?auto_156890 - BLOCK
      ?auto_156891 - BLOCK
      ?auto_156892 - BLOCK
    )
    :vars
    (
      ?auto_156895 - BLOCK
      ?auto_156893 - BLOCK
      ?auto_156896 - BLOCK
      ?auto_156894 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156888 ?auto_156889 ) ) ( not ( = ?auto_156888 ?auto_156890 ) ) ( not ( = ?auto_156888 ?auto_156891 ) ) ( not ( = ?auto_156888 ?auto_156892 ) ) ( not ( = ?auto_156889 ?auto_156890 ) ) ( not ( = ?auto_156889 ?auto_156891 ) ) ( not ( = ?auto_156889 ?auto_156892 ) ) ( not ( = ?auto_156890 ?auto_156891 ) ) ( not ( = ?auto_156890 ?auto_156892 ) ) ( not ( = ?auto_156891 ?auto_156892 ) ) ( not ( = ?auto_156888 ?auto_156895 ) ) ( not ( = ?auto_156889 ?auto_156895 ) ) ( not ( = ?auto_156890 ?auto_156895 ) ) ( not ( = ?auto_156891 ?auto_156895 ) ) ( not ( = ?auto_156892 ?auto_156895 ) ) ( ON-TABLE ?auto_156893 ) ( ON ?auto_156896 ?auto_156893 ) ( not ( = ?auto_156893 ?auto_156896 ) ) ( not ( = ?auto_156893 ?auto_156895 ) ) ( not ( = ?auto_156893 ?auto_156892 ) ) ( not ( = ?auto_156893 ?auto_156891 ) ) ( not ( = ?auto_156896 ?auto_156895 ) ) ( not ( = ?auto_156896 ?auto_156892 ) ) ( not ( = ?auto_156896 ?auto_156891 ) ) ( not ( = ?auto_156888 ?auto_156893 ) ) ( not ( = ?auto_156888 ?auto_156896 ) ) ( not ( = ?auto_156889 ?auto_156893 ) ) ( not ( = ?auto_156889 ?auto_156896 ) ) ( not ( = ?auto_156890 ?auto_156893 ) ) ( not ( = ?auto_156890 ?auto_156896 ) ) ( ON ?auto_156888 ?auto_156894 ) ( not ( = ?auto_156888 ?auto_156894 ) ) ( not ( = ?auto_156889 ?auto_156894 ) ) ( not ( = ?auto_156890 ?auto_156894 ) ) ( not ( = ?auto_156891 ?auto_156894 ) ) ( not ( = ?auto_156892 ?auto_156894 ) ) ( not ( = ?auto_156895 ?auto_156894 ) ) ( not ( = ?auto_156893 ?auto_156894 ) ) ( not ( = ?auto_156896 ?auto_156894 ) ) ( ON ?auto_156889 ?auto_156888 ) ( ON-TABLE ?auto_156894 ) ( ON ?auto_156890 ?auto_156889 ) ( ON ?auto_156891 ?auto_156890 ) ( ON ?auto_156892 ?auto_156891 ) ( CLEAR ?auto_156896 ) ( ON ?auto_156895 ?auto_156892 ) ( CLEAR ?auto_156895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_156894 ?auto_156888 ?auto_156889 ?auto_156890 ?auto_156891 ?auto_156892 )
      ( MAKE-5PILE ?auto_156888 ?auto_156889 ?auto_156890 ?auto_156891 ?auto_156892 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_156897 - BLOCK
      ?auto_156898 - BLOCK
      ?auto_156899 - BLOCK
      ?auto_156900 - BLOCK
      ?auto_156901 - BLOCK
    )
    :vars
    (
      ?auto_156902 - BLOCK
      ?auto_156904 - BLOCK
      ?auto_156903 - BLOCK
      ?auto_156905 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156897 ?auto_156898 ) ) ( not ( = ?auto_156897 ?auto_156899 ) ) ( not ( = ?auto_156897 ?auto_156900 ) ) ( not ( = ?auto_156897 ?auto_156901 ) ) ( not ( = ?auto_156898 ?auto_156899 ) ) ( not ( = ?auto_156898 ?auto_156900 ) ) ( not ( = ?auto_156898 ?auto_156901 ) ) ( not ( = ?auto_156899 ?auto_156900 ) ) ( not ( = ?auto_156899 ?auto_156901 ) ) ( not ( = ?auto_156900 ?auto_156901 ) ) ( not ( = ?auto_156897 ?auto_156902 ) ) ( not ( = ?auto_156898 ?auto_156902 ) ) ( not ( = ?auto_156899 ?auto_156902 ) ) ( not ( = ?auto_156900 ?auto_156902 ) ) ( not ( = ?auto_156901 ?auto_156902 ) ) ( ON-TABLE ?auto_156904 ) ( not ( = ?auto_156904 ?auto_156903 ) ) ( not ( = ?auto_156904 ?auto_156902 ) ) ( not ( = ?auto_156904 ?auto_156901 ) ) ( not ( = ?auto_156904 ?auto_156900 ) ) ( not ( = ?auto_156903 ?auto_156902 ) ) ( not ( = ?auto_156903 ?auto_156901 ) ) ( not ( = ?auto_156903 ?auto_156900 ) ) ( not ( = ?auto_156897 ?auto_156904 ) ) ( not ( = ?auto_156897 ?auto_156903 ) ) ( not ( = ?auto_156898 ?auto_156904 ) ) ( not ( = ?auto_156898 ?auto_156903 ) ) ( not ( = ?auto_156899 ?auto_156904 ) ) ( not ( = ?auto_156899 ?auto_156903 ) ) ( ON ?auto_156897 ?auto_156905 ) ( not ( = ?auto_156897 ?auto_156905 ) ) ( not ( = ?auto_156898 ?auto_156905 ) ) ( not ( = ?auto_156899 ?auto_156905 ) ) ( not ( = ?auto_156900 ?auto_156905 ) ) ( not ( = ?auto_156901 ?auto_156905 ) ) ( not ( = ?auto_156902 ?auto_156905 ) ) ( not ( = ?auto_156904 ?auto_156905 ) ) ( not ( = ?auto_156903 ?auto_156905 ) ) ( ON ?auto_156898 ?auto_156897 ) ( ON-TABLE ?auto_156905 ) ( ON ?auto_156899 ?auto_156898 ) ( ON ?auto_156900 ?auto_156899 ) ( ON ?auto_156901 ?auto_156900 ) ( ON ?auto_156902 ?auto_156901 ) ( CLEAR ?auto_156902 ) ( HOLDING ?auto_156903 ) ( CLEAR ?auto_156904 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_156904 ?auto_156903 )
      ( MAKE-5PILE ?auto_156897 ?auto_156898 ?auto_156899 ?auto_156900 ?auto_156901 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_156906 - BLOCK
      ?auto_156907 - BLOCK
      ?auto_156908 - BLOCK
      ?auto_156909 - BLOCK
      ?auto_156910 - BLOCK
    )
    :vars
    (
      ?auto_156912 - BLOCK
      ?auto_156914 - BLOCK
      ?auto_156913 - BLOCK
      ?auto_156911 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156906 ?auto_156907 ) ) ( not ( = ?auto_156906 ?auto_156908 ) ) ( not ( = ?auto_156906 ?auto_156909 ) ) ( not ( = ?auto_156906 ?auto_156910 ) ) ( not ( = ?auto_156907 ?auto_156908 ) ) ( not ( = ?auto_156907 ?auto_156909 ) ) ( not ( = ?auto_156907 ?auto_156910 ) ) ( not ( = ?auto_156908 ?auto_156909 ) ) ( not ( = ?auto_156908 ?auto_156910 ) ) ( not ( = ?auto_156909 ?auto_156910 ) ) ( not ( = ?auto_156906 ?auto_156912 ) ) ( not ( = ?auto_156907 ?auto_156912 ) ) ( not ( = ?auto_156908 ?auto_156912 ) ) ( not ( = ?auto_156909 ?auto_156912 ) ) ( not ( = ?auto_156910 ?auto_156912 ) ) ( ON-TABLE ?auto_156914 ) ( not ( = ?auto_156914 ?auto_156913 ) ) ( not ( = ?auto_156914 ?auto_156912 ) ) ( not ( = ?auto_156914 ?auto_156910 ) ) ( not ( = ?auto_156914 ?auto_156909 ) ) ( not ( = ?auto_156913 ?auto_156912 ) ) ( not ( = ?auto_156913 ?auto_156910 ) ) ( not ( = ?auto_156913 ?auto_156909 ) ) ( not ( = ?auto_156906 ?auto_156914 ) ) ( not ( = ?auto_156906 ?auto_156913 ) ) ( not ( = ?auto_156907 ?auto_156914 ) ) ( not ( = ?auto_156907 ?auto_156913 ) ) ( not ( = ?auto_156908 ?auto_156914 ) ) ( not ( = ?auto_156908 ?auto_156913 ) ) ( ON ?auto_156906 ?auto_156911 ) ( not ( = ?auto_156906 ?auto_156911 ) ) ( not ( = ?auto_156907 ?auto_156911 ) ) ( not ( = ?auto_156908 ?auto_156911 ) ) ( not ( = ?auto_156909 ?auto_156911 ) ) ( not ( = ?auto_156910 ?auto_156911 ) ) ( not ( = ?auto_156912 ?auto_156911 ) ) ( not ( = ?auto_156914 ?auto_156911 ) ) ( not ( = ?auto_156913 ?auto_156911 ) ) ( ON ?auto_156907 ?auto_156906 ) ( ON-TABLE ?auto_156911 ) ( ON ?auto_156908 ?auto_156907 ) ( ON ?auto_156909 ?auto_156908 ) ( ON ?auto_156910 ?auto_156909 ) ( ON ?auto_156912 ?auto_156910 ) ( CLEAR ?auto_156914 ) ( ON ?auto_156913 ?auto_156912 ) ( CLEAR ?auto_156913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_156911 ?auto_156906 ?auto_156907 ?auto_156908 ?auto_156909 ?auto_156910 ?auto_156912 )
      ( MAKE-5PILE ?auto_156906 ?auto_156907 ?auto_156908 ?auto_156909 ?auto_156910 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_156915 - BLOCK
      ?auto_156916 - BLOCK
      ?auto_156917 - BLOCK
      ?auto_156918 - BLOCK
      ?auto_156919 - BLOCK
    )
    :vars
    (
      ?auto_156922 - BLOCK
      ?auto_156923 - BLOCK
      ?auto_156921 - BLOCK
      ?auto_156920 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156915 ?auto_156916 ) ) ( not ( = ?auto_156915 ?auto_156917 ) ) ( not ( = ?auto_156915 ?auto_156918 ) ) ( not ( = ?auto_156915 ?auto_156919 ) ) ( not ( = ?auto_156916 ?auto_156917 ) ) ( not ( = ?auto_156916 ?auto_156918 ) ) ( not ( = ?auto_156916 ?auto_156919 ) ) ( not ( = ?auto_156917 ?auto_156918 ) ) ( not ( = ?auto_156917 ?auto_156919 ) ) ( not ( = ?auto_156918 ?auto_156919 ) ) ( not ( = ?auto_156915 ?auto_156922 ) ) ( not ( = ?auto_156916 ?auto_156922 ) ) ( not ( = ?auto_156917 ?auto_156922 ) ) ( not ( = ?auto_156918 ?auto_156922 ) ) ( not ( = ?auto_156919 ?auto_156922 ) ) ( not ( = ?auto_156923 ?auto_156921 ) ) ( not ( = ?auto_156923 ?auto_156922 ) ) ( not ( = ?auto_156923 ?auto_156919 ) ) ( not ( = ?auto_156923 ?auto_156918 ) ) ( not ( = ?auto_156921 ?auto_156922 ) ) ( not ( = ?auto_156921 ?auto_156919 ) ) ( not ( = ?auto_156921 ?auto_156918 ) ) ( not ( = ?auto_156915 ?auto_156923 ) ) ( not ( = ?auto_156915 ?auto_156921 ) ) ( not ( = ?auto_156916 ?auto_156923 ) ) ( not ( = ?auto_156916 ?auto_156921 ) ) ( not ( = ?auto_156917 ?auto_156923 ) ) ( not ( = ?auto_156917 ?auto_156921 ) ) ( ON ?auto_156915 ?auto_156920 ) ( not ( = ?auto_156915 ?auto_156920 ) ) ( not ( = ?auto_156916 ?auto_156920 ) ) ( not ( = ?auto_156917 ?auto_156920 ) ) ( not ( = ?auto_156918 ?auto_156920 ) ) ( not ( = ?auto_156919 ?auto_156920 ) ) ( not ( = ?auto_156922 ?auto_156920 ) ) ( not ( = ?auto_156923 ?auto_156920 ) ) ( not ( = ?auto_156921 ?auto_156920 ) ) ( ON ?auto_156916 ?auto_156915 ) ( ON-TABLE ?auto_156920 ) ( ON ?auto_156917 ?auto_156916 ) ( ON ?auto_156918 ?auto_156917 ) ( ON ?auto_156919 ?auto_156918 ) ( ON ?auto_156922 ?auto_156919 ) ( ON ?auto_156921 ?auto_156922 ) ( CLEAR ?auto_156921 ) ( HOLDING ?auto_156923 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_156923 )
      ( MAKE-5PILE ?auto_156915 ?auto_156916 ?auto_156917 ?auto_156918 ?auto_156919 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_156924 - BLOCK
      ?auto_156925 - BLOCK
      ?auto_156926 - BLOCK
      ?auto_156927 - BLOCK
      ?auto_156928 - BLOCK
    )
    :vars
    (
      ?auto_156929 - BLOCK
      ?auto_156930 - BLOCK
      ?auto_156932 - BLOCK
      ?auto_156931 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156924 ?auto_156925 ) ) ( not ( = ?auto_156924 ?auto_156926 ) ) ( not ( = ?auto_156924 ?auto_156927 ) ) ( not ( = ?auto_156924 ?auto_156928 ) ) ( not ( = ?auto_156925 ?auto_156926 ) ) ( not ( = ?auto_156925 ?auto_156927 ) ) ( not ( = ?auto_156925 ?auto_156928 ) ) ( not ( = ?auto_156926 ?auto_156927 ) ) ( not ( = ?auto_156926 ?auto_156928 ) ) ( not ( = ?auto_156927 ?auto_156928 ) ) ( not ( = ?auto_156924 ?auto_156929 ) ) ( not ( = ?auto_156925 ?auto_156929 ) ) ( not ( = ?auto_156926 ?auto_156929 ) ) ( not ( = ?auto_156927 ?auto_156929 ) ) ( not ( = ?auto_156928 ?auto_156929 ) ) ( not ( = ?auto_156930 ?auto_156932 ) ) ( not ( = ?auto_156930 ?auto_156929 ) ) ( not ( = ?auto_156930 ?auto_156928 ) ) ( not ( = ?auto_156930 ?auto_156927 ) ) ( not ( = ?auto_156932 ?auto_156929 ) ) ( not ( = ?auto_156932 ?auto_156928 ) ) ( not ( = ?auto_156932 ?auto_156927 ) ) ( not ( = ?auto_156924 ?auto_156930 ) ) ( not ( = ?auto_156924 ?auto_156932 ) ) ( not ( = ?auto_156925 ?auto_156930 ) ) ( not ( = ?auto_156925 ?auto_156932 ) ) ( not ( = ?auto_156926 ?auto_156930 ) ) ( not ( = ?auto_156926 ?auto_156932 ) ) ( ON ?auto_156924 ?auto_156931 ) ( not ( = ?auto_156924 ?auto_156931 ) ) ( not ( = ?auto_156925 ?auto_156931 ) ) ( not ( = ?auto_156926 ?auto_156931 ) ) ( not ( = ?auto_156927 ?auto_156931 ) ) ( not ( = ?auto_156928 ?auto_156931 ) ) ( not ( = ?auto_156929 ?auto_156931 ) ) ( not ( = ?auto_156930 ?auto_156931 ) ) ( not ( = ?auto_156932 ?auto_156931 ) ) ( ON ?auto_156925 ?auto_156924 ) ( ON-TABLE ?auto_156931 ) ( ON ?auto_156926 ?auto_156925 ) ( ON ?auto_156927 ?auto_156926 ) ( ON ?auto_156928 ?auto_156927 ) ( ON ?auto_156929 ?auto_156928 ) ( ON ?auto_156932 ?auto_156929 ) ( ON ?auto_156930 ?auto_156932 ) ( CLEAR ?auto_156930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_156931 ?auto_156924 ?auto_156925 ?auto_156926 ?auto_156927 ?auto_156928 ?auto_156929 ?auto_156932 )
      ( MAKE-5PILE ?auto_156924 ?auto_156925 ?auto_156926 ?auto_156927 ?auto_156928 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_156935 - BLOCK
      ?auto_156936 - BLOCK
    )
    :vars
    (
      ?auto_156937 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156937 ?auto_156936 ) ( CLEAR ?auto_156937 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_156935 ) ( ON ?auto_156936 ?auto_156935 ) ( not ( = ?auto_156935 ?auto_156936 ) ) ( not ( = ?auto_156935 ?auto_156937 ) ) ( not ( = ?auto_156936 ?auto_156937 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_156937 ?auto_156936 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_156938 - BLOCK
      ?auto_156939 - BLOCK
    )
    :vars
    (
      ?auto_156940 - BLOCK
      ?auto_156941 - BLOCK
      ?auto_156942 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156940 ?auto_156939 ) ( CLEAR ?auto_156940 ) ( ON-TABLE ?auto_156938 ) ( ON ?auto_156939 ?auto_156938 ) ( not ( = ?auto_156938 ?auto_156939 ) ) ( not ( = ?auto_156938 ?auto_156940 ) ) ( not ( = ?auto_156939 ?auto_156940 ) ) ( HOLDING ?auto_156941 ) ( CLEAR ?auto_156942 ) ( not ( = ?auto_156938 ?auto_156941 ) ) ( not ( = ?auto_156938 ?auto_156942 ) ) ( not ( = ?auto_156939 ?auto_156941 ) ) ( not ( = ?auto_156939 ?auto_156942 ) ) ( not ( = ?auto_156940 ?auto_156941 ) ) ( not ( = ?auto_156940 ?auto_156942 ) ) ( not ( = ?auto_156941 ?auto_156942 ) ) )
    :subtasks
    ( ( !STACK ?auto_156941 ?auto_156942 )
      ( MAKE-2PILE ?auto_156938 ?auto_156939 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_156943 - BLOCK
      ?auto_156944 - BLOCK
    )
    :vars
    (
      ?auto_156947 - BLOCK
      ?auto_156945 - BLOCK
      ?auto_156946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156947 ?auto_156944 ) ( ON-TABLE ?auto_156943 ) ( ON ?auto_156944 ?auto_156943 ) ( not ( = ?auto_156943 ?auto_156944 ) ) ( not ( = ?auto_156943 ?auto_156947 ) ) ( not ( = ?auto_156944 ?auto_156947 ) ) ( CLEAR ?auto_156945 ) ( not ( = ?auto_156943 ?auto_156946 ) ) ( not ( = ?auto_156943 ?auto_156945 ) ) ( not ( = ?auto_156944 ?auto_156946 ) ) ( not ( = ?auto_156944 ?auto_156945 ) ) ( not ( = ?auto_156947 ?auto_156946 ) ) ( not ( = ?auto_156947 ?auto_156945 ) ) ( not ( = ?auto_156946 ?auto_156945 ) ) ( ON ?auto_156946 ?auto_156947 ) ( CLEAR ?auto_156946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_156943 ?auto_156944 ?auto_156947 )
      ( MAKE-2PILE ?auto_156943 ?auto_156944 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_156948 - BLOCK
      ?auto_156949 - BLOCK
    )
    :vars
    (
      ?auto_156951 - BLOCK
      ?auto_156950 - BLOCK
      ?auto_156952 - BLOCK
      ?auto_156953 - BLOCK
      ?auto_156955 - BLOCK
      ?auto_156954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156951 ?auto_156949 ) ( ON-TABLE ?auto_156948 ) ( ON ?auto_156949 ?auto_156948 ) ( not ( = ?auto_156948 ?auto_156949 ) ) ( not ( = ?auto_156948 ?auto_156951 ) ) ( not ( = ?auto_156949 ?auto_156951 ) ) ( not ( = ?auto_156948 ?auto_156950 ) ) ( not ( = ?auto_156948 ?auto_156952 ) ) ( not ( = ?auto_156949 ?auto_156950 ) ) ( not ( = ?auto_156949 ?auto_156952 ) ) ( not ( = ?auto_156951 ?auto_156950 ) ) ( not ( = ?auto_156951 ?auto_156952 ) ) ( not ( = ?auto_156950 ?auto_156952 ) ) ( ON ?auto_156950 ?auto_156951 ) ( CLEAR ?auto_156950 ) ( HOLDING ?auto_156952 ) ( CLEAR ?auto_156953 ) ( ON-TABLE ?auto_156955 ) ( ON ?auto_156954 ?auto_156955 ) ( ON ?auto_156953 ?auto_156954 ) ( not ( = ?auto_156955 ?auto_156954 ) ) ( not ( = ?auto_156955 ?auto_156953 ) ) ( not ( = ?auto_156955 ?auto_156952 ) ) ( not ( = ?auto_156954 ?auto_156953 ) ) ( not ( = ?auto_156954 ?auto_156952 ) ) ( not ( = ?auto_156953 ?auto_156952 ) ) ( not ( = ?auto_156948 ?auto_156953 ) ) ( not ( = ?auto_156948 ?auto_156955 ) ) ( not ( = ?auto_156948 ?auto_156954 ) ) ( not ( = ?auto_156949 ?auto_156953 ) ) ( not ( = ?auto_156949 ?auto_156955 ) ) ( not ( = ?auto_156949 ?auto_156954 ) ) ( not ( = ?auto_156951 ?auto_156953 ) ) ( not ( = ?auto_156951 ?auto_156955 ) ) ( not ( = ?auto_156951 ?auto_156954 ) ) ( not ( = ?auto_156950 ?auto_156953 ) ) ( not ( = ?auto_156950 ?auto_156955 ) ) ( not ( = ?auto_156950 ?auto_156954 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_156955 ?auto_156954 ?auto_156953 ?auto_156952 )
      ( MAKE-2PILE ?auto_156948 ?auto_156949 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_156956 - BLOCK
      ?auto_156957 - BLOCK
    )
    :vars
    (
      ?auto_156959 - BLOCK
      ?auto_156958 - BLOCK
      ?auto_156963 - BLOCK
      ?auto_156960 - BLOCK
      ?auto_156962 - BLOCK
      ?auto_156961 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156959 ?auto_156957 ) ( ON-TABLE ?auto_156956 ) ( ON ?auto_156957 ?auto_156956 ) ( not ( = ?auto_156956 ?auto_156957 ) ) ( not ( = ?auto_156956 ?auto_156959 ) ) ( not ( = ?auto_156957 ?auto_156959 ) ) ( not ( = ?auto_156956 ?auto_156958 ) ) ( not ( = ?auto_156956 ?auto_156963 ) ) ( not ( = ?auto_156957 ?auto_156958 ) ) ( not ( = ?auto_156957 ?auto_156963 ) ) ( not ( = ?auto_156959 ?auto_156958 ) ) ( not ( = ?auto_156959 ?auto_156963 ) ) ( not ( = ?auto_156958 ?auto_156963 ) ) ( ON ?auto_156958 ?auto_156959 ) ( CLEAR ?auto_156960 ) ( ON-TABLE ?auto_156962 ) ( ON ?auto_156961 ?auto_156962 ) ( ON ?auto_156960 ?auto_156961 ) ( not ( = ?auto_156962 ?auto_156961 ) ) ( not ( = ?auto_156962 ?auto_156960 ) ) ( not ( = ?auto_156962 ?auto_156963 ) ) ( not ( = ?auto_156961 ?auto_156960 ) ) ( not ( = ?auto_156961 ?auto_156963 ) ) ( not ( = ?auto_156960 ?auto_156963 ) ) ( not ( = ?auto_156956 ?auto_156960 ) ) ( not ( = ?auto_156956 ?auto_156962 ) ) ( not ( = ?auto_156956 ?auto_156961 ) ) ( not ( = ?auto_156957 ?auto_156960 ) ) ( not ( = ?auto_156957 ?auto_156962 ) ) ( not ( = ?auto_156957 ?auto_156961 ) ) ( not ( = ?auto_156959 ?auto_156960 ) ) ( not ( = ?auto_156959 ?auto_156962 ) ) ( not ( = ?auto_156959 ?auto_156961 ) ) ( not ( = ?auto_156958 ?auto_156960 ) ) ( not ( = ?auto_156958 ?auto_156962 ) ) ( not ( = ?auto_156958 ?auto_156961 ) ) ( ON ?auto_156963 ?auto_156958 ) ( CLEAR ?auto_156963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_156956 ?auto_156957 ?auto_156959 ?auto_156958 )
      ( MAKE-2PILE ?auto_156956 ?auto_156957 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_156964 - BLOCK
      ?auto_156965 - BLOCK
    )
    :vars
    (
      ?auto_156969 - BLOCK
      ?auto_156966 - BLOCK
      ?auto_156967 - BLOCK
      ?auto_156971 - BLOCK
      ?auto_156970 - BLOCK
      ?auto_156968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156969 ?auto_156965 ) ( ON-TABLE ?auto_156964 ) ( ON ?auto_156965 ?auto_156964 ) ( not ( = ?auto_156964 ?auto_156965 ) ) ( not ( = ?auto_156964 ?auto_156969 ) ) ( not ( = ?auto_156965 ?auto_156969 ) ) ( not ( = ?auto_156964 ?auto_156966 ) ) ( not ( = ?auto_156964 ?auto_156967 ) ) ( not ( = ?auto_156965 ?auto_156966 ) ) ( not ( = ?auto_156965 ?auto_156967 ) ) ( not ( = ?auto_156969 ?auto_156966 ) ) ( not ( = ?auto_156969 ?auto_156967 ) ) ( not ( = ?auto_156966 ?auto_156967 ) ) ( ON ?auto_156966 ?auto_156969 ) ( ON-TABLE ?auto_156971 ) ( ON ?auto_156970 ?auto_156971 ) ( not ( = ?auto_156971 ?auto_156970 ) ) ( not ( = ?auto_156971 ?auto_156968 ) ) ( not ( = ?auto_156971 ?auto_156967 ) ) ( not ( = ?auto_156970 ?auto_156968 ) ) ( not ( = ?auto_156970 ?auto_156967 ) ) ( not ( = ?auto_156968 ?auto_156967 ) ) ( not ( = ?auto_156964 ?auto_156968 ) ) ( not ( = ?auto_156964 ?auto_156971 ) ) ( not ( = ?auto_156964 ?auto_156970 ) ) ( not ( = ?auto_156965 ?auto_156968 ) ) ( not ( = ?auto_156965 ?auto_156971 ) ) ( not ( = ?auto_156965 ?auto_156970 ) ) ( not ( = ?auto_156969 ?auto_156968 ) ) ( not ( = ?auto_156969 ?auto_156971 ) ) ( not ( = ?auto_156969 ?auto_156970 ) ) ( not ( = ?auto_156966 ?auto_156968 ) ) ( not ( = ?auto_156966 ?auto_156971 ) ) ( not ( = ?auto_156966 ?auto_156970 ) ) ( ON ?auto_156967 ?auto_156966 ) ( CLEAR ?auto_156967 ) ( HOLDING ?auto_156968 ) ( CLEAR ?auto_156970 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_156971 ?auto_156970 ?auto_156968 )
      ( MAKE-2PILE ?auto_156964 ?auto_156965 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_156972 - BLOCK
      ?auto_156973 - BLOCK
    )
    :vars
    (
      ?auto_156978 - BLOCK
      ?auto_156977 - BLOCK
      ?auto_156975 - BLOCK
      ?auto_156976 - BLOCK
      ?auto_156979 - BLOCK
      ?auto_156974 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156978 ?auto_156973 ) ( ON-TABLE ?auto_156972 ) ( ON ?auto_156973 ?auto_156972 ) ( not ( = ?auto_156972 ?auto_156973 ) ) ( not ( = ?auto_156972 ?auto_156978 ) ) ( not ( = ?auto_156973 ?auto_156978 ) ) ( not ( = ?auto_156972 ?auto_156977 ) ) ( not ( = ?auto_156972 ?auto_156975 ) ) ( not ( = ?auto_156973 ?auto_156977 ) ) ( not ( = ?auto_156973 ?auto_156975 ) ) ( not ( = ?auto_156978 ?auto_156977 ) ) ( not ( = ?auto_156978 ?auto_156975 ) ) ( not ( = ?auto_156977 ?auto_156975 ) ) ( ON ?auto_156977 ?auto_156978 ) ( ON-TABLE ?auto_156976 ) ( ON ?auto_156979 ?auto_156976 ) ( not ( = ?auto_156976 ?auto_156979 ) ) ( not ( = ?auto_156976 ?auto_156974 ) ) ( not ( = ?auto_156976 ?auto_156975 ) ) ( not ( = ?auto_156979 ?auto_156974 ) ) ( not ( = ?auto_156979 ?auto_156975 ) ) ( not ( = ?auto_156974 ?auto_156975 ) ) ( not ( = ?auto_156972 ?auto_156974 ) ) ( not ( = ?auto_156972 ?auto_156976 ) ) ( not ( = ?auto_156972 ?auto_156979 ) ) ( not ( = ?auto_156973 ?auto_156974 ) ) ( not ( = ?auto_156973 ?auto_156976 ) ) ( not ( = ?auto_156973 ?auto_156979 ) ) ( not ( = ?auto_156978 ?auto_156974 ) ) ( not ( = ?auto_156978 ?auto_156976 ) ) ( not ( = ?auto_156978 ?auto_156979 ) ) ( not ( = ?auto_156977 ?auto_156974 ) ) ( not ( = ?auto_156977 ?auto_156976 ) ) ( not ( = ?auto_156977 ?auto_156979 ) ) ( ON ?auto_156975 ?auto_156977 ) ( CLEAR ?auto_156979 ) ( ON ?auto_156974 ?auto_156975 ) ( CLEAR ?auto_156974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_156972 ?auto_156973 ?auto_156978 ?auto_156977 ?auto_156975 )
      ( MAKE-2PILE ?auto_156972 ?auto_156973 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_156980 - BLOCK
      ?auto_156981 - BLOCK
    )
    :vars
    (
      ?auto_156985 - BLOCK
      ?auto_156983 - BLOCK
      ?auto_156984 - BLOCK
      ?auto_156986 - BLOCK
      ?auto_156987 - BLOCK
      ?auto_156982 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156985 ?auto_156981 ) ( ON-TABLE ?auto_156980 ) ( ON ?auto_156981 ?auto_156980 ) ( not ( = ?auto_156980 ?auto_156981 ) ) ( not ( = ?auto_156980 ?auto_156985 ) ) ( not ( = ?auto_156981 ?auto_156985 ) ) ( not ( = ?auto_156980 ?auto_156983 ) ) ( not ( = ?auto_156980 ?auto_156984 ) ) ( not ( = ?auto_156981 ?auto_156983 ) ) ( not ( = ?auto_156981 ?auto_156984 ) ) ( not ( = ?auto_156985 ?auto_156983 ) ) ( not ( = ?auto_156985 ?auto_156984 ) ) ( not ( = ?auto_156983 ?auto_156984 ) ) ( ON ?auto_156983 ?auto_156985 ) ( ON-TABLE ?auto_156986 ) ( not ( = ?auto_156986 ?auto_156987 ) ) ( not ( = ?auto_156986 ?auto_156982 ) ) ( not ( = ?auto_156986 ?auto_156984 ) ) ( not ( = ?auto_156987 ?auto_156982 ) ) ( not ( = ?auto_156987 ?auto_156984 ) ) ( not ( = ?auto_156982 ?auto_156984 ) ) ( not ( = ?auto_156980 ?auto_156982 ) ) ( not ( = ?auto_156980 ?auto_156986 ) ) ( not ( = ?auto_156980 ?auto_156987 ) ) ( not ( = ?auto_156981 ?auto_156982 ) ) ( not ( = ?auto_156981 ?auto_156986 ) ) ( not ( = ?auto_156981 ?auto_156987 ) ) ( not ( = ?auto_156985 ?auto_156982 ) ) ( not ( = ?auto_156985 ?auto_156986 ) ) ( not ( = ?auto_156985 ?auto_156987 ) ) ( not ( = ?auto_156983 ?auto_156982 ) ) ( not ( = ?auto_156983 ?auto_156986 ) ) ( not ( = ?auto_156983 ?auto_156987 ) ) ( ON ?auto_156984 ?auto_156983 ) ( ON ?auto_156982 ?auto_156984 ) ( CLEAR ?auto_156982 ) ( HOLDING ?auto_156987 ) ( CLEAR ?auto_156986 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_156986 ?auto_156987 )
      ( MAKE-2PILE ?auto_156980 ?auto_156981 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_156988 - BLOCK
      ?auto_156989 - BLOCK
    )
    :vars
    (
      ?auto_156993 - BLOCK
      ?auto_156992 - BLOCK
      ?auto_156995 - BLOCK
      ?auto_156994 - BLOCK
      ?auto_156991 - BLOCK
      ?auto_156990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156993 ?auto_156989 ) ( ON-TABLE ?auto_156988 ) ( ON ?auto_156989 ?auto_156988 ) ( not ( = ?auto_156988 ?auto_156989 ) ) ( not ( = ?auto_156988 ?auto_156993 ) ) ( not ( = ?auto_156989 ?auto_156993 ) ) ( not ( = ?auto_156988 ?auto_156992 ) ) ( not ( = ?auto_156988 ?auto_156995 ) ) ( not ( = ?auto_156989 ?auto_156992 ) ) ( not ( = ?auto_156989 ?auto_156995 ) ) ( not ( = ?auto_156993 ?auto_156992 ) ) ( not ( = ?auto_156993 ?auto_156995 ) ) ( not ( = ?auto_156992 ?auto_156995 ) ) ( ON ?auto_156992 ?auto_156993 ) ( ON-TABLE ?auto_156994 ) ( not ( = ?auto_156994 ?auto_156991 ) ) ( not ( = ?auto_156994 ?auto_156990 ) ) ( not ( = ?auto_156994 ?auto_156995 ) ) ( not ( = ?auto_156991 ?auto_156990 ) ) ( not ( = ?auto_156991 ?auto_156995 ) ) ( not ( = ?auto_156990 ?auto_156995 ) ) ( not ( = ?auto_156988 ?auto_156990 ) ) ( not ( = ?auto_156988 ?auto_156994 ) ) ( not ( = ?auto_156988 ?auto_156991 ) ) ( not ( = ?auto_156989 ?auto_156990 ) ) ( not ( = ?auto_156989 ?auto_156994 ) ) ( not ( = ?auto_156989 ?auto_156991 ) ) ( not ( = ?auto_156993 ?auto_156990 ) ) ( not ( = ?auto_156993 ?auto_156994 ) ) ( not ( = ?auto_156993 ?auto_156991 ) ) ( not ( = ?auto_156992 ?auto_156990 ) ) ( not ( = ?auto_156992 ?auto_156994 ) ) ( not ( = ?auto_156992 ?auto_156991 ) ) ( ON ?auto_156995 ?auto_156992 ) ( ON ?auto_156990 ?auto_156995 ) ( CLEAR ?auto_156994 ) ( ON ?auto_156991 ?auto_156990 ) ( CLEAR ?auto_156991 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_156988 ?auto_156989 ?auto_156993 ?auto_156992 ?auto_156995 ?auto_156990 )
      ( MAKE-2PILE ?auto_156988 ?auto_156989 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_156996 - BLOCK
      ?auto_156997 - BLOCK
    )
    :vars
    (
      ?auto_156998 - BLOCK
      ?auto_157000 - BLOCK
      ?auto_157002 - BLOCK
      ?auto_156999 - BLOCK
      ?auto_157001 - BLOCK
      ?auto_157003 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156998 ?auto_156997 ) ( ON-TABLE ?auto_156996 ) ( ON ?auto_156997 ?auto_156996 ) ( not ( = ?auto_156996 ?auto_156997 ) ) ( not ( = ?auto_156996 ?auto_156998 ) ) ( not ( = ?auto_156997 ?auto_156998 ) ) ( not ( = ?auto_156996 ?auto_157000 ) ) ( not ( = ?auto_156996 ?auto_157002 ) ) ( not ( = ?auto_156997 ?auto_157000 ) ) ( not ( = ?auto_156997 ?auto_157002 ) ) ( not ( = ?auto_156998 ?auto_157000 ) ) ( not ( = ?auto_156998 ?auto_157002 ) ) ( not ( = ?auto_157000 ?auto_157002 ) ) ( ON ?auto_157000 ?auto_156998 ) ( not ( = ?auto_156999 ?auto_157001 ) ) ( not ( = ?auto_156999 ?auto_157003 ) ) ( not ( = ?auto_156999 ?auto_157002 ) ) ( not ( = ?auto_157001 ?auto_157003 ) ) ( not ( = ?auto_157001 ?auto_157002 ) ) ( not ( = ?auto_157003 ?auto_157002 ) ) ( not ( = ?auto_156996 ?auto_157003 ) ) ( not ( = ?auto_156996 ?auto_156999 ) ) ( not ( = ?auto_156996 ?auto_157001 ) ) ( not ( = ?auto_156997 ?auto_157003 ) ) ( not ( = ?auto_156997 ?auto_156999 ) ) ( not ( = ?auto_156997 ?auto_157001 ) ) ( not ( = ?auto_156998 ?auto_157003 ) ) ( not ( = ?auto_156998 ?auto_156999 ) ) ( not ( = ?auto_156998 ?auto_157001 ) ) ( not ( = ?auto_157000 ?auto_157003 ) ) ( not ( = ?auto_157000 ?auto_156999 ) ) ( not ( = ?auto_157000 ?auto_157001 ) ) ( ON ?auto_157002 ?auto_157000 ) ( ON ?auto_157003 ?auto_157002 ) ( ON ?auto_157001 ?auto_157003 ) ( CLEAR ?auto_157001 ) ( HOLDING ?auto_156999 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_156999 )
      ( MAKE-2PILE ?auto_156996 ?auto_156997 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_157004 - BLOCK
      ?auto_157005 - BLOCK
    )
    :vars
    (
      ?auto_157006 - BLOCK
      ?auto_157010 - BLOCK
      ?auto_157007 - BLOCK
      ?auto_157009 - BLOCK
      ?auto_157008 - BLOCK
      ?auto_157011 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157006 ?auto_157005 ) ( ON-TABLE ?auto_157004 ) ( ON ?auto_157005 ?auto_157004 ) ( not ( = ?auto_157004 ?auto_157005 ) ) ( not ( = ?auto_157004 ?auto_157006 ) ) ( not ( = ?auto_157005 ?auto_157006 ) ) ( not ( = ?auto_157004 ?auto_157010 ) ) ( not ( = ?auto_157004 ?auto_157007 ) ) ( not ( = ?auto_157005 ?auto_157010 ) ) ( not ( = ?auto_157005 ?auto_157007 ) ) ( not ( = ?auto_157006 ?auto_157010 ) ) ( not ( = ?auto_157006 ?auto_157007 ) ) ( not ( = ?auto_157010 ?auto_157007 ) ) ( ON ?auto_157010 ?auto_157006 ) ( not ( = ?auto_157009 ?auto_157008 ) ) ( not ( = ?auto_157009 ?auto_157011 ) ) ( not ( = ?auto_157009 ?auto_157007 ) ) ( not ( = ?auto_157008 ?auto_157011 ) ) ( not ( = ?auto_157008 ?auto_157007 ) ) ( not ( = ?auto_157011 ?auto_157007 ) ) ( not ( = ?auto_157004 ?auto_157011 ) ) ( not ( = ?auto_157004 ?auto_157009 ) ) ( not ( = ?auto_157004 ?auto_157008 ) ) ( not ( = ?auto_157005 ?auto_157011 ) ) ( not ( = ?auto_157005 ?auto_157009 ) ) ( not ( = ?auto_157005 ?auto_157008 ) ) ( not ( = ?auto_157006 ?auto_157011 ) ) ( not ( = ?auto_157006 ?auto_157009 ) ) ( not ( = ?auto_157006 ?auto_157008 ) ) ( not ( = ?auto_157010 ?auto_157011 ) ) ( not ( = ?auto_157010 ?auto_157009 ) ) ( not ( = ?auto_157010 ?auto_157008 ) ) ( ON ?auto_157007 ?auto_157010 ) ( ON ?auto_157011 ?auto_157007 ) ( ON ?auto_157008 ?auto_157011 ) ( ON ?auto_157009 ?auto_157008 ) ( CLEAR ?auto_157009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_157004 ?auto_157005 ?auto_157006 ?auto_157010 ?auto_157007 ?auto_157011 ?auto_157008 )
      ( MAKE-2PILE ?auto_157004 ?auto_157005 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_157012 - BLOCK
      ?auto_157013 - BLOCK
    )
    :vars
    (
      ?auto_157019 - BLOCK
      ?auto_157017 - BLOCK
      ?auto_157014 - BLOCK
      ?auto_157015 - BLOCK
      ?auto_157018 - BLOCK
      ?auto_157016 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157019 ?auto_157013 ) ( ON-TABLE ?auto_157012 ) ( ON ?auto_157013 ?auto_157012 ) ( not ( = ?auto_157012 ?auto_157013 ) ) ( not ( = ?auto_157012 ?auto_157019 ) ) ( not ( = ?auto_157013 ?auto_157019 ) ) ( not ( = ?auto_157012 ?auto_157017 ) ) ( not ( = ?auto_157012 ?auto_157014 ) ) ( not ( = ?auto_157013 ?auto_157017 ) ) ( not ( = ?auto_157013 ?auto_157014 ) ) ( not ( = ?auto_157019 ?auto_157017 ) ) ( not ( = ?auto_157019 ?auto_157014 ) ) ( not ( = ?auto_157017 ?auto_157014 ) ) ( ON ?auto_157017 ?auto_157019 ) ( not ( = ?auto_157015 ?auto_157018 ) ) ( not ( = ?auto_157015 ?auto_157016 ) ) ( not ( = ?auto_157015 ?auto_157014 ) ) ( not ( = ?auto_157018 ?auto_157016 ) ) ( not ( = ?auto_157018 ?auto_157014 ) ) ( not ( = ?auto_157016 ?auto_157014 ) ) ( not ( = ?auto_157012 ?auto_157016 ) ) ( not ( = ?auto_157012 ?auto_157015 ) ) ( not ( = ?auto_157012 ?auto_157018 ) ) ( not ( = ?auto_157013 ?auto_157016 ) ) ( not ( = ?auto_157013 ?auto_157015 ) ) ( not ( = ?auto_157013 ?auto_157018 ) ) ( not ( = ?auto_157019 ?auto_157016 ) ) ( not ( = ?auto_157019 ?auto_157015 ) ) ( not ( = ?auto_157019 ?auto_157018 ) ) ( not ( = ?auto_157017 ?auto_157016 ) ) ( not ( = ?auto_157017 ?auto_157015 ) ) ( not ( = ?auto_157017 ?auto_157018 ) ) ( ON ?auto_157014 ?auto_157017 ) ( ON ?auto_157016 ?auto_157014 ) ( ON ?auto_157018 ?auto_157016 ) ( HOLDING ?auto_157015 ) ( CLEAR ?auto_157018 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_157012 ?auto_157013 ?auto_157019 ?auto_157017 ?auto_157014 ?auto_157016 ?auto_157018 ?auto_157015 )
      ( MAKE-2PILE ?auto_157012 ?auto_157013 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_157020 - BLOCK
      ?auto_157021 - BLOCK
    )
    :vars
    (
      ?auto_157022 - BLOCK
      ?auto_157023 - BLOCK
      ?auto_157027 - BLOCK
      ?auto_157026 - BLOCK
      ?auto_157025 - BLOCK
      ?auto_157024 - BLOCK
      ?auto_157028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157022 ?auto_157021 ) ( ON-TABLE ?auto_157020 ) ( ON ?auto_157021 ?auto_157020 ) ( not ( = ?auto_157020 ?auto_157021 ) ) ( not ( = ?auto_157020 ?auto_157022 ) ) ( not ( = ?auto_157021 ?auto_157022 ) ) ( not ( = ?auto_157020 ?auto_157023 ) ) ( not ( = ?auto_157020 ?auto_157027 ) ) ( not ( = ?auto_157021 ?auto_157023 ) ) ( not ( = ?auto_157021 ?auto_157027 ) ) ( not ( = ?auto_157022 ?auto_157023 ) ) ( not ( = ?auto_157022 ?auto_157027 ) ) ( not ( = ?auto_157023 ?auto_157027 ) ) ( ON ?auto_157023 ?auto_157022 ) ( not ( = ?auto_157026 ?auto_157025 ) ) ( not ( = ?auto_157026 ?auto_157024 ) ) ( not ( = ?auto_157026 ?auto_157027 ) ) ( not ( = ?auto_157025 ?auto_157024 ) ) ( not ( = ?auto_157025 ?auto_157027 ) ) ( not ( = ?auto_157024 ?auto_157027 ) ) ( not ( = ?auto_157020 ?auto_157024 ) ) ( not ( = ?auto_157020 ?auto_157026 ) ) ( not ( = ?auto_157020 ?auto_157025 ) ) ( not ( = ?auto_157021 ?auto_157024 ) ) ( not ( = ?auto_157021 ?auto_157026 ) ) ( not ( = ?auto_157021 ?auto_157025 ) ) ( not ( = ?auto_157022 ?auto_157024 ) ) ( not ( = ?auto_157022 ?auto_157026 ) ) ( not ( = ?auto_157022 ?auto_157025 ) ) ( not ( = ?auto_157023 ?auto_157024 ) ) ( not ( = ?auto_157023 ?auto_157026 ) ) ( not ( = ?auto_157023 ?auto_157025 ) ) ( ON ?auto_157027 ?auto_157023 ) ( ON ?auto_157024 ?auto_157027 ) ( ON ?auto_157025 ?auto_157024 ) ( CLEAR ?auto_157025 ) ( ON ?auto_157026 ?auto_157028 ) ( CLEAR ?auto_157026 ) ( HAND-EMPTY ) ( not ( = ?auto_157020 ?auto_157028 ) ) ( not ( = ?auto_157021 ?auto_157028 ) ) ( not ( = ?auto_157022 ?auto_157028 ) ) ( not ( = ?auto_157023 ?auto_157028 ) ) ( not ( = ?auto_157027 ?auto_157028 ) ) ( not ( = ?auto_157026 ?auto_157028 ) ) ( not ( = ?auto_157025 ?auto_157028 ) ) ( not ( = ?auto_157024 ?auto_157028 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_157026 ?auto_157028 )
      ( MAKE-2PILE ?auto_157020 ?auto_157021 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_157029 - BLOCK
      ?auto_157030 - BLOCK
    )
    :vars
    (
      ?auto_157037 - BLOCK
      ?auto_157034 - BLOCK
      ?auto_157035 - BLOCK
      ?auto_157033 - BLOCK
      ?auto_157036 - BLOCK
      ?auto_157031 - BLOCK
      ?auto_157032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157037 ?auto_157030 ) ( ON-TABLE ?auto_157029 ) ( ON ?auto_157030 ?auto_157029 ) ( not ( = ?auto_157029 ?auto_157030 ) ) ( not ( = ?auto_157029 ?auto_157037 ) ) ( not ( = ?auto_157030 ?auto_157037 ) ) ( not ( = ?auto_157029 ?auto_157034 ) ) ( not ( = ?auto_157029 ?auto_157035 ) ) ( not ( = ?auto_157030 ?auto_157034 ) ) ( not ( = ?auto_157030 ?auto_157035 ) ) ( not ( = ?auto_157037 ?auto_157034 ) ) ( not ( = ?auto_157037 ?auto_157035 ) ) ( not ( = ?auto_157034 ?auto_157035 ) ) ( ON ?auto_157034 ?auto_157037 ) ( not ( = ?auto_157033 ?auto_157036 ) ) ( not ( = ?auto_157033 ?auto_157031 ) ) ( not ( = ?auto_157033 ?auto_157035 ) ) ( not ( = ?auto_157036 ?auto_157031 ) ) ( not ( = ?auto_157036 ?auto_157035 ) ) ( not ( = ?auto_157031 ?auto_157035 ) ) ( not ( = ?auto_157029 ?auto_157031 ) ) ( not ( = ?auto_157029 ?auto_157033 ) ) ( not ( = ?auto_157029 ?auto_157036 ) ) ( not ( = ?auto_157030 ?auto_157031 ) ) ( not ( = ?auto_157030 ?auto_157033 ) ) ( not ( = ?auto_157030 ?auto_157036 ) ) ( not ( = ?auto_157037 ?auto_157031 ) ) ( not ( = ?auto_157037 ?auto_157033 ) ) ( not ( = ?auto_157037 ?auto_157036 ) ) ( not ( = ?auto_157034 ?auto_157031 ) ) ( not ( = ?auto_157034 ?auto_157033 ) ) ( not ( = ?auto_157034 ?auto_157036 ) ) ( ON ?auto_157035 ?auto_157034 ) ( ON ?auto_157031 ?auto_157035 ) ( ON ?auto_157033 ?auto_157032 ) ( CLEAR ?auto_157033 ) ( not ( = ?auto_157029 ?auto_157032 ) ) ( not ( = ?auto_157030 ?auto_157032 ) ) ( not ( = ?auto_157037 ?auto_157032 ) ) ( not ( = ?auto_157034 ?auto_157032 ) ) ( not ( = ?auto_157035 ?auto_157032 ) ) ( not ( = ?auto_157033 ?auto_157032 ) ) ( not ( = ?auto_157036 ?auto_157032 ) ) ( not ( = ?auto_157031 ?auto_157032 ) ) ( HOLDING ?auto_157036 ) ( CLEAR ?auto_157031 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_157029 ?auto_157030 ?auto_157037 ?auto_157034 ?auto_157035 ?auto_157031 ?auto_157036 )
      ( MAKE-2PILE ?auto_157029 ?auto_157030 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_157038 - BLOCK
      ?auto_157039 - BLOCK
    )
    :vars
    (
      ?auto_157041 - BLOCK
      ?auto_157044 - BLOCK
      ?auto_157043 - BLOCK
      ?auto_157040 - BLOCK
      ?auto_157045 - BLOCK
      ?auto_157046 - BLOCK
      ?auto_157042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157041 ?auto_157039 ) ( ON-TABLE ?auto_157038 ) ( ON ?auto_157039 ?auto_157038 ) ( not ( = ?auto_157038 ?auto_157039 ) ) ( not ( = ?auto_157038 ?auto_157041 ) ) ( not ( = ?auto_157039 ?auto_157041 ) ) ( not ( = ?auto_157038 ?auto_157044 ) ) ( not ( = ?auto_157038 ?auto_157043 ) ) ( not ( = ?auto_157039 ?auto_157044 ) ) ( not ( = ?auto_157039 ?auto_157043 ) ) ( not ( = ?auto_157041 ?auto_157044 ) ) ( not ( = ?auto_157041 ?auto_157043 ) ) ( not ( = ?auto_157044 ?auto_157043 ) ) ( ON ?auto_157044 ?auto_157041 ) ( not ( = ?auto_157040 ?auto_157045 ) ) ( not ( = ?auto_157040 ?auto_157046 ) ) ( not ( = ?auto_157040 ?auto_157043 ) ) ( not ( = ?auto_157045 ?auto_157046 ) ) ( not ( = ?auto_157045 ?auto_157043 ) ) ( not ( = ?auto_157046 ?auto_157043 ) ) ( not ( = ?auto_157038 ?auto_157046 ) ) ( not ( = ?auto_157038 ?auto_157040 ) ) ( not ( = ?auto_157038 ?auto_157045 ) ) ( not ( = ?auto_157039 ?auto_157046 ) ) ( not ( = ?auto_157039 ?auto_157040 ) ) ( not ( = ?auto_157039 ?auto_157045 ) ) ( not ( = ?auto_157041 ?auto_157046 ) ) ( not ( = ?auto_157041 ?auto_157040 ) ) ( not ( = ?auto_157041 ?auto_157045 ) ) ( not ( = ?auto_157044 ?auto_157046 ) ) ( not ( = ?auto_157044 ?auto_157040 ) ) ( not ( = ?auto_157044 ?auto_157045 ) ) ( ON ?auto_157043 ?auto_157044 ) ( ON ?auto_157046 ?auto_157043 ) ( ON ?auto_157040 ?auto_157042 ) ( not ( = ?auto_157038 ?auto_157042 ) ) ( not ( = ?auto_157039 ?auto_157042 ) ) ( not ( = ?auto_157041 ?auto_157042 ) ) ( not ( = ?auto_157044 ?auto_157042 ) ) ( not ( = ?auto_157043 ?auto_157042 ) ) ( not ( = ?auto_157040 ?auto_157042 ) ) ( not ( = ?auto_157045 ?auto_157042 ) ) ( not ( = ?auto_157046 ?auto_157042 ) ) ( CLEAR ?auto_157046 ) ( ON ?auto_157045 ?auto_157040 ) ( CLEAR ?auto_157045 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_157042 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_157042 ?auto_157040 )
      ( MAKE-2PILE ?auto_157038 ?auto_157039 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_157047 - BLOCK
      ?auto_157048 - BLOCK
    )
    :vars
    (
      ?auto_157054 - BLOCK
      ?auto_157052 - BLOCK
      ?auto_157055 - BLOCK
      ?auto_157049 - BLOCK
      ?auto_157053 - BLOCK
      ?auto_157051 - BLOCK
      ?auto_157050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157054 ?auto_157048 ) ( ON-TABLE ?auto_157047 ) ( ON ?auto_157048 ?auto_157047 ) ( not ( = ?auto_157047 ?auto_157048 ) ) ( not ( = ?auto_157047 ?auto_157054 ) ) ( not ( = ?auto_157048 ?auto_157054 ) ) ( not ( = ?auto_157047 ?auto_157052 ) ) ( not ( = ?auto_157047 ?auto_157055 ) ) ( not ( = ?auto_157048 ?auto_157052 ) ) ( not ( = ?auto_157048 ?auto_157055 ) ) ( not ( = ?auto_157054 ?auto_157052 ) ) ( not ( = ?auto_157054 ?auto_157055 ) ) ( not ( = ?auto_157052 ?auto_157055 ) ) ( ON ?auto_157052 ?auto_157054 ) ( not ( = ?auto_157049 ?auto_157053 ) ) ( not ( = ?auto_157049 ?auto_157051 ) ) ( not ( = ?auto_157049 ?auto_157055 ) ) ( not ( = ?auto_157053 ?auto_157051 ) ) ( not ( = ?auto_157053 ?auto_157055 ) ) ( not ( = ?auto_157051 ?auto_157055 ) ) ( not ( = ?auto_157047 ?auto_157051 ) ) ( not ( = ?auto_157047 ?auto_157049 ) ) ( not ( = ?auto_157047 ?auto_157053 ) ) ( not ( = ?auto_157048 ?auto_157051 ) ) ( not ( = ?auto_157048 ?auto_157049 ) ) ( not ( = ?auto_157048 ?auto_157053 ) ) ( not ( = ?auto_157054 ?auto_157051 ) ) ( not ( = ?auto_157054 ?auto_157049 ) ) ( not ( = ?auto_157054 ?auto_157053 ) ) ( not ( = ?auto_157052 ?auto_157051 ) ) ( not ( = ?auto_157052 ?auto_157049 ) ) ( not ( = ?auto_157052 ?auto_157053 ) ) ( ON ?auto_157055 ?auto_157052 ) ( ON ?auto_157049 ?auto_157050 ) ( not ( = ?auto_157047 ?auto_157050 ) ) ( not ( = ?auto_157048 ?auto_157050 ) ) ( not ( = ?auto_157054 ?auto_157050 ) ) ( not ( = ?auto_157052 ?auto_157050 ) ) ( not ( = ?auto_157055 ?auto_157050 ) ) ( not ( = ?auto_157049 ?auto_157050 ) ) ( not ( = ?auto_157053 ?auto_157050 ) ) ( not ( = ?auto_157051 ?auto_157050 ) ) ( ON ?auto_157053 ?auto_157049 ) ( CLEAR ?auto_157053 ) ( ON-TABLE ?auto_157050 ) ( HOLDING ?auto_157051 ) ( CLEAR ?auto_157055 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_157047 ?auto_157048 ?auto_157054 ?auto_157052 ?auto_157055 ?auto_157051 )
      ( MAKE-2PILE ?auto_157047 ?auto_157048 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_157056 - BLOCK
      ?auto_157057 - BLOCK
    )
    :vars
    (
      ?auto_157063 - BLOCK
      ?auto_157060 - BLOCK
      ?auto_157058 - BLOCK
      ?auto_157059 - BLOCK
      ?auto_157064 - BLOCK
      ?auto_157062 - BLOCK
      ?auto_157061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157063 ?auto_157057 ) ( ON-TABLE ?auto_157056 ) ( ON ?auto_157057 ?auto_157056 ) ( not ( = ?auto_157056 ?auto_157057 ) ) ( not ( = ?auto_157056 ?auto_157063 ) ) ( not ( = ?auto_157057 ?auto_157063 ) ) ( not ( = ?auto_157056 ?auto_157060 ) ) ( not ( = ?auto_157056 ?auto_157058 ) ) ( not ( = ?auto_157057 ?auto_157060 ) ) ( not ( = ?auto_157057 ?auto_157058 ) ) ( not ( = ?auto_157063 ?auto_157060 ) ) ( not ( = ?auto_157063 ?auto_157058 ) ) ( not ( = ?auto_157060 ?auto_157058 ) ) ( ON ?auto_157060 ?auto_157063 ) ( not ( = ?auto_157059 ?auto_157064 ) ) ( not ( = ?auto_157059 ?auto_157062 ) ) ( not ( = ?auto_157059 ?auto_157058 ) ) ( not ( = ?auto_157064 ?auto_157062 ) ) ( not ( = ?auto_157064 ?auto_157058 ) ) ( not ( = ?auto_157062 ?auto_157058 ) ) ( not ( = ?auto_157056 ?auto_157062 ) ) ( not ( = ?auto_157056 ?auto_157059 ) ) ( not ( = ?auto_157056 ?auto_157064 ) ) ( not ( = ?auto_157057 ?auto_157062 ) ) ( not ( = ?auto_157057 ?auto_157059 ) ) ( not ( = ?auto_157057 ?auto_157064 ) ) ( not ( = ?auto_157063 ?auto_157062 ) ) ( not ( = ?auto_157063 ?auto_157059 ) ) ( not ( = ?auto_157063 ?auto_157064 ) ) ( not ( = ?auto_157060 ?auto_157062 ) ) ( not ( = ?auto_157060 ?auto_157059 ) ) ( not ( = ?auto_157060 ?auto_157064 ) ) ( ON ?auto_157058 ?auto_157060 ) ( ON ?auto_157059 ?auto_157061 ) ( not ( = ?auto_157056 ?auto_157061 ) ) ( not ( = ?auto_157057 ?auto_157061 ) ) ( not ( = ?auto_157063 ?auto_157061 ) ) ( not ( = ?auto_157060 ?auto_157061 ) ) ( not ( = ?auto_157058 ?auto_157061 ) ) ( not ( = ?auto_157059 ?auto_157061 ) ) ( not ( = ?auto_157064 ?auto_157061 ) ) ( not ( = ?auto_157062 ?auto_157061 ) ) ( ON ?auto_157064 ?auto_157059 ) ( ON-TABLE ?auto_157061 ) ( CLEAR ?auto_157058 ) ( ON ?auto_157062 ?auto_157064 ) ( CLEAR ?auto_157062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_157061 ?auto_157059 ?auto_157064 )
      ( MAKE-2PILE ?auto_157056 ?auto_157057 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_157065 - BLOCK
      ?auto_157066 - BLOCK
    )
    :vars
    (
      ?auto_157070 - BLOCK
      ?auto_157072 - BLOCK
      ?auto_157068 - BLOCK
      ?auto_157069 - BLOCK
      ?auto_157067 - BLOCK
      ?auto_157071 - BLOCK
      ?auto_157073 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157070 ?auto_157066 ) ( ON-TABLE ?auto_157065 ) ( ON ?auto_157066 ?auto_157065 ) ( not ( = ?auto_157065 ?auto_157066 ) ) ( not ( = ?auto_157065 ?auto_157070 ) ) ( not ( = ?auto_157066 ?auto_157070 ) ) ( not ( = ?auto_157065 ?auto_157072 ) ) ( not ( = ?auto_157065 ?auto_157068 ) ) ( not ( = ?auto_157066 ?auto_157072 ) ) ( not ( = ?auto_157066 ?auto_157068 ) ) ( not ( = ?auto_157070 ?auto_157072 ) ) ( not ( = ?auto_157070 ?auto_157068 ) ) ( not ( = ?auto_157072 ?auto_157068 ) ) ( ON ?auto_157072 ?auto_157070 ) ( not ( = ?auto_157069 ?auto_157067 ) ) ( not ( = ?auto_157069 ?auto_157071 ) ) ( not ( = ?auto_157069 ?auto_157068 ) ) ( not ( = ?auto_157067 ?auto_157071 ) ) ( not ( = ?auto_157067 ?auto_157068 ) ) ( not ( = ?auto_157071 ?auto_157068 ) ) ( not ( = ?auto_157065 ?auto_157071 ) ) ( not ( = ?auto_157065 ?auto_157069 ) ) ( not ( = ?auto_157065 ?auto_157067 ) ) ( not ( = ?auto_157066 ?auto_157071 ) ) ( not ( = ?auto_157066 ?auto_157069 ) ) ( not ( = ?auto_157066 ?auto_157067 ) ) ( not ( = ?auto_157070 ?auto_157071 ) ) ( not ( = ?auto_157070 ?auto_157069 ) ) ( not ( = ?auto_157070 ?auto_157067 ) ) ( not ( = ?auto_157072 ?auto_157071 ) ) ( not ( = ?auto_157072 ?auto_157069 ) ) ( not ( = ?auto_157072 ?auto_157067 ) ) ( ON ?auto_157069 ?auto_157073 ) ( not ( = ?auto_157065 ?auto_157073 ) ) ( not ( = ?auto_157066 ?auto_157073 ) ) ( not ( = ?auto_157070 ?auto_157073 ) ) ( not ( = ?auto_157072 ?auto_157073 ) ) ( not ( = ?auto_157068 ?auto_157073 ) ) ( not ( = ?auto_157069 ?auto_157073 ) ) ( not ( = ?auto_157067 ?auto_157073 ) ) ( not ( = ?auto_157071 ?auto_157073 ) ) ( ON ?auto_157067 ?auto_157069 ) ( ON-TABLE ?auto_157073 ) ( ON ?auto_157071 ?auto_157067 ) ( CLEAR ?auto_157071 ) ( HOLDING ?auto_157068 ) ( CLEAR ?auto_157072 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_157065 ?auto_157066 ?auto_157070 ?auto_157072 ?auto_157068 )
      ( MAKE-2PILE ?auto_157065 ?auto_157066 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_157074 - BLOCK
      ?auto_157075 - BLOCK
    )
    :vars
    (
      ?auto_157078 - BLOCK
      ?auto_157079 - BLOCK
      ?auto_157076 - BLOCK
      ?auto_157081 - BLOCK
      ?auto_157080 - BLOCK
      ?auto_157077 - BLOCK
      ?auto_157082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157078 ?auto_157075 ) ( ON-TABLE ?auto_157074 ) ( ON ?auto_157075 ?auto_157074 ) ( not ( = ?auto_157074 ?auto_157075 ) ) ( not ( = ?auto_157074 ?auto_157078 ) ) ( not ( = ?auto_157075 ?auto_157078 ) ) ( not ( = ?auto_157074 ?auto_157079 ) ) ( not ( = ?auto_157074 ?auto_157076 ) ) ( not ( = ?auto_157075 ?auto_157079 ) ) ( not ( = ?auto_157075 ?auto_157076 ) ) ( not ( = ?auto_157078 ?auto_157079 ) ) ( not ( = ?auto_157078 ?auto_157076 ) ) ( not ( = ?auto_157079 ?auto_157076 ) ) ( ON ?auto_157079 ?auto_157078 ) ( not ( = ?auto_157081 ?auto_157080 ) ) ( not ( = ?auto_157081 ?auto_157077 ) ) ( not ( = ?auto_157081 ?auto_157076 ) ) ( not ( = ?auto_157080 ?auto_157077 ) ) ( not ( = ?auto_157080 ?auto_157076 ) ) ( not ( = ?auto_157077 ?auto_157076 ) ) ( not ( = ?auto_157074 ?auto_157077 ) ) ( not ( = ?auto_157074 ?auto_157081 ) ) ( not ( = ?auto_157074 ?auto_157080 ) ) ( not ( = ?auto_157075 ?auto_157077 ) ) ( not ( = ?auto_157075 ?auto_157081 ) ) ( not ( = ?auto_157075 ?auto_157080 ) ) ( not ( = ?auto_157078 ?auto_157077 ) ) ( not ( = ?auto_157078 ?auto_157081 ) ) ( not ( = ?auto_157078 ?auto_157080 ) ) ( not ( = ?auto_157079 ?auto_157077 ) ) ( not ( = ?auto_157079 ?auto_157081 ) ) ( not ( = ?auto_157079 ?auto_157080 ) ) ( ON ?auto_157081 ?auto_157082 ) ( not ( = ?auto_157074 ?auto_157082 ) ) ( not ( = ?auto_157075 ?auto_157082 ) ) ( not ( = ?auto_157078 ?auto_157082 ) ) ( not ( = ?auto_157079 ?auto_157082 ) ) ( not ( = ?auto_157076 ?auto_157082 ) ) ( not ( = ?auto_157081 ?auto_157082 ) ) ( not ( = ?auto_157080 ?auto_157082 ) ) ( not ( = ?auto_157077 ?auto_157082 ) ) ( ON ?auto_157080 ?auto_157081 ) ( ON-TABLE ?auto_157082 ) ( ON ?auto_157077 ?auto_157080 ) ( CLEAR ?auto_157079 ) ( ON ?auto_157076 ?auto_157077 ) ( CLEAR ?auto_157076 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_157082 ?auto_157081 ?auto_157080 ?auto_157077 )
      ( MAKE-2PILE ?auto_157074 ?auto_157075 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_157083 - BLOCK
      ?auto_157084 - BLOCK
    )
    :vars
    (
      ?auto_157085 - BLOCK
      ?auto_157088 - BLOCK
      ?auto_157089 - BLOCK
      ?auto_157087 - BLOCK
      ?auto_157091 - BLOCK
      ?auto_157086 - BLOCK
      ?auto_157090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157085 ?auto_157084 ) ( ON-TABLE ?auto_157083 ) ( ON ?auto_157084 ?auto_157083 ) ( not ( = ?auto_157083 ?auto_157084 ) ) ( not ( = ?auto_157083 ?auto_157085 ) ) ( not ( = ?auto_157084 ?auto_157085 ) ) ( not ( = ?auto_157083 ?auto_157088 ) ) ( not ( = ?auto_157083 ?auto_157089 ) ) ( not ( = ?auto_157084 ?auto_157088 ) ) ( not ( = ?auto_157084 ?auto_157089 ) ) ( not ( = ?auto_157085 ?auto_157088 ) ) ( not ( = ?auto_157085 ?auto_157089 ) ) ( not ( = ?auto_157088 ?auto_157089 ) ) ( not ( = ?auto_157087 ?auto_157091 ) ) ( not ( = ?auto_157087 ?auto_157086 ) ) ( not ( = ?auto_157087 ?auto_157089 ) ) ( not ( = ?auto_157091 ?auto_157086 ) ) ( not ( = ?auto_157091 ?auto_157089 ) ) ( not ( = ?auto_157086 ?auto_157089 ) ) ( not ( = ?auto_157083 ?auto_157086 ) ) ( not ( = ?auto_157083 ?auto_157087 ) ) ( not ( = ?auto_157083 ?auto_157091 ) ) ( not ( = ?auto_157084 ?auto_157086 ) ) ( not ( = ?auto_157084 ?auto_157087 ) ) ( not ( = ?auto_157084 ?auto_157091 ) ) ( not ( = ?auto_157085 ?auto_157086 ) ) ( not ( = ?auto_157085 ?auto_157087 ) ) ( not ( = ?auto_157085 ?auto_157091 ) ) ( not ( = ?auto_157088 ?auto_157086 ) ) ( not ( = ?auto_157088 ?auto_157087 ) ) ( not ( = ?auto_157088 ?auto_157091 ) ) ( ON ?auto_157087 ?auto_157090 ) ( not ( = ?auto_157083 ?auto_157090 ) ) ( not ( = ?auto_157084 ?auto_157090 ) ) ( not ( = ?auto_157085 ?auto_157090 ) ) ( not ( = ?auto_157088 ?auto_157090 ) ) ( not ( = ?auto_157089 ?auto_157090 ) ) ( not ( = ?auto_157087 ?auto_157090 ) ) ( not ( = ?auto_157091 ?auto_157090 ) ) ( not ( = ?auto_157086 ?auto_157090 ) ) ( ON ?auto_157091 ?auto_157087 ) ( ON-TABLE ?auto_157090 ) ( ON ?auto_157086 ?auto_157091 ) ( ON ?auto_157089 ?auto_157086 ) ( CLEAR ?auto_157089 ) ( HOLDING ?auto_157088 ) ( CLEAR ?auto_157085 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_157083 ?auto_157084 ?auto_157085 ?auto_157088 )
      ( MAKE-2PILE ?auto_157083 ?auto_157084 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_157092 - BLOCK
      ?auto_157093 - BLOCK
    )
    :vars
    (
      ?auto_157098 - BLOCK
      ?auto_157097 - BLOCK
      ?auto_157100 - BLOCK
      ?auto_157096 - BLOCK
      ?auto_157094 - BLOCK
      ?auto_157099 - BLOCK
      ?auto_157095 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157098 ?auto_157093 ) ( ON-TABLE ?auto_157092 ) ( ON ?auto_157093 ?auto_157092 ) ( not ( = ?auto_157092 ?auto_157093 ) ) ( not ( = ?auto_157092 ?auto_157098 ) ) ( not ( = ?auto_157093 ?auto_157098 ) ) ( not ( = ?auto_157092 ?auto_157097 ) ) ( not ( = ?auto_157092 ?auto_157100 ) ) ( not ( = ?auto_157093 ?auto_157097 ) ) ( not ( = ?auto_157093 ?auto_157100 ) ) ( not ( = ?auto_157098 ?auto_157097 ) ) ( not ( = ?auto_157098 ?auto_157100 ) ) ( not ( = ?auto_157097 ?auto_157100 ) ) ( not ( = ?auto_157096 ?auto_157094 ) ) ( not ( = ?auto_157096 ?auto_157099 ) ) ( not ( = ?auto_157096 ?auto_157100 ) ) ( not ( = ?auto_157094 ?auto_157099 ) ) ( not ( = ?auto_157094 ?auto_157100 ) ) ( not ( = ?auto_157099 ?auto_157100 ) ) ( not ( = ?auto_157092 ?auto_157099 ) ) ( not ( = ?auto_157092 ?auto_157096 ) ) ( not ( = ?auto_157092 ?auto_157094 ) ) ( not ( = ?auto_157093 ?auto_157099 ) ) ( not ( = ?auto_157093 ?auto_157096 ) ) ( not ( = ?auto_157093 ?auto_157094 ) ) ( not ( = ?auto_157098 ?auto_157099 ) ) ( not ( = ?auto_157098 ?auto_157096 ) ) ( not ( = ?auto_157098 ?auto_157094 ) ) ( not ( = ?auto_157097 ?auto_157099 ) ) ( not ( = ?auto_157097 ?auto_157096 ) ) ( not ( = ?auto_157097 ?auto_157094 ) ) ( ON ?auto_157096 ?auto_157095 ) ( not ( = ?auto_157092 ?auto_157095 ) ) ( not ( = ?auto_157093 ?auto_157095 ) ) ( not ( = ?auto_157098 ?auto_157095 ) ) ( not ( = ?auto_157097 ?auto_157095 ) ) ( not ( = ?auto_157100 ?auto_157095 ) ) ( not ( = ?auto_157096 ?auto_157095 ) ) ( not ( = ?auto_157094 ?auto_157095 ) ) ( not ( = ?auto_157099 ?auto_157095 ) ) ( ON ?auto_157094 ?auto_157096 ) ( ON-TABLE ?auto_157095 ) ( ON ?auto_157099 ?auto_157094 ) ( ON ?auto_157100 ?auto_157099 ) ( CLEAR ?auto_157098 ) ( ON ?auto_157097 ?auto_157100 ) ( CLEAR ?auto_157097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_157095 ?auto_157096 ?auto_157094 ?auto_157099 ?auto_157100 )
      ( MAKE-2PILE ?auto_157092 ?auto_157093 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_157119 - BLOCK
      ?auto_157120 - BLOCK
    )
    :vars
    (
      ?auto_157126 - BLOCK
      ?auto_157122 - BLOCK
      ?auto_157123 - BLOCK
      ?auto_157121 - BLOCK
      ?auto_157124 - BLOCK
      ?auto_157125 - BLOCK
      ?auto_157127 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157119 ) ( not ( = ?auto_157119 ?auto_157120 ) ) ( not ( = ?auto_157119 ?auto_157126 ) ) ( not ( = ?auto_157120 ?auto_157126 ) ) ( not ( = ?auto_157119 ?auto_157122 ) ) ( not ( = ?auto_157119 ?auto_157123 ) ) ( not ( = ?auto_157120 ?auto_157122 ) ) ( not ( = ?auto_157120 ?auto_157123 ) ) ( not ( = ?auto_157126 ?auto_157122 ) ) ( not ( = ?auto_157126 ?auto_157123 ) ) ( not ( = ?auto_157122 ?auto_157123 ) ) ( not ( = ?auto_157121 ?auto_157124 ) ) ( not ( = ?auto_157121 ?auto_157125 ) ) ( not ( = ?auto_157121 ?auto_157123 ) ) ( not ( = ?auto_157124 ?auto_157125 ) ) ( not ( = ?auto_157124 ?auto_157123 ) ) ( not ( = ?auto_157125 ?auto_157123 ) ) ( not ( = ?auto_157119 ?auto_157125 ) ) ( not ( = ?auto_157119 ?auto_157121 ) ) ( not ( = ?auto_157119 ?auto_157124 ) ) ( not ( = ?auto_157120 ?auto_157125 ) ) ( not ( = ?auto_157120 ?auto_157121 ) ) ( not ( = ?auto_157120 ?auto_157124 ) ) ( not ( = ?auto_157126 ?auto_157125 ) ) ( not ( = ?auto_157126 ?auto_157121 ) ) ( not ( = ?auto_157126 ?auto_157124 ) ) ( not ( = ?auto_157122 ?auto_157125 ) ) ( not ( = ?auto_157122 ?auto_157121 ) ) ( not ( = ?auto_157122 ?auto_157124 ) ) ( ON ?auto_157121 ?auto_157127 ) ( not ( = ?auto_157119 ?auto_157127 ) ) ( not ( = ?auto_157120 ?auto_157127 ) ) ( not ( = ?auto_157126 ?auto_157127 ) ) ( not ( = ?auto_157122 ?auto_157127 ) ) ( not ( = ?auto_157123 ?auto_157127 ) ) ( not ( = ?auto_157121 ?auto_157127 ) ) ( not ( = ?auto_157124 ?auto_157127 ) ) ( not ( = ?auto_157125 ?auto_157127 ) ) ( ON ?auto_157124 ?auto_157121 ) ( ON-TABLE ?auto_157127 ) ( ON ?auto_157125 ?auto_157124 ) ( ON ?auto_157123 ?auto_157125 ) ( ON ?auto_157122 ?auto_157123 ) ( ON ?auto_157126 ?auto_157122 ) ( CLEAR ?auto_157126 ) ( HOLDING ?auto_157120 ) ( CLEAR ?auto_157119 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_157119 ?auto_157120 ?auto_157126 )
      ( MAKE-2PILE ?auto_157119 ?auto_157120 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_157128 - BLOCK
      ?auto_157129 - BLOCK
    )
    :vars
    (
      ?auto_157131 - BLOCK
      ?auto_157133 - BLOCK
      ?auto_157136 - BLOCK
      ?auto_157135 - BLOCK
      ?auto_157134 - BLOCK
      ?auto_157132 - BLOCK
      ?auto_157130 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157128 ) ( not ( = ?auto_157128 ?auto_157129 ) ) ( not ( = ?auto_157128 ?auto_157131 ) ) ( not ( = ?auto_157129 ?auto_157131 ) ) ( not ( = ?auto_157128 ?auto_157133 ) ) ( not ( = ?auto_157128 ?auto_157136 ) ) ( not ( = ?auto_157129 ?auto_157133 ) ) ( not ( = ?auto_157129 ?auto_157136 ) ) ( not ( = ?auto_157131 ?auto_157133 ) ) ( not ( = ?auto_157131 ?auto_157136 ) ) ( not ( = ?auto_157133 ?auto_157136 ) ) ( not ( = ?auto_157135 ?auto_157134 ) ) ( not ( = ?auto_157135 ?auto_157132 ) ) ( not ( = ?auto_157135 ?auto_157136 ) ) ( not ( = ?auto_157134 ?auto_157132 ) ) ( not ( = ?auto_157134 ?auto_157136 ) ) ( not ( = ?auto_157132 ?auto_157136 ) ) ( not ( = ?auto_157128 ?auto_157132 ) ) ( not ( = ?auto_157128 ?auto_157135 ) ) ( not ( = ?auto_157128 ?auto_157134 ) ) ( not ( = ?auto_157129 ?auto_157132 ) ) ( not ( = ?auto_157129 ?auto_157135 ) ) ( not ( = ?auto_157129 ?auto_157134 ) ) ( not ( = ?auto_157131 ?auto_157132 ) ) ( not ( = ?auto_157131 ?auto_157135 ) ) ( not ( = ?auto_157131 ?auto_157134 ) ) ( not ( = ?auto_157133 ?auto_157132 ) ) ( not ( = ?auto_157133 ?auto_157135 ) ) ( not ( = ?auto_157133 ?auto_157134 ) ) ( ON ?auto_157135 ?auto_157130 ) ( not ( = ?auto_157128 ?auto_157130 ) ) ( not ( = ?auto_157129 ?auto_157130 ) ) ( not ( = ?auto_157131 ?auto_157130 ) ) ( not ( = ?auto_157133 ?auto_157130 ) ) ( not ( = ?auto_157136 ?auto_157130 ) ) ( not ( = ?auto_157135 ?auto_157130 ) ) ( not ( = ?auto_157134 ?auto_157130 ) ) ( not ( = ?auto_157132 ?auto_157130 ) ) ( ON ?auto_157134 ?auto_157135 ) ( ON-TABLE ?auto_157130 ) ( ON ?auto_157132 ?auto_157134 ) ( ON ?auto_157136 ?auto_157132 ) ( ON ?auto_157133 ?auto_157136 ) ( ON ?auto_157131 ?auto_157133 ) ( CLEAR ?auto_157128 ) ( ON ?auto_157129 ?auto_157131 ) ( CLEAR ?auto_157129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_157130 ?auto_157135 ?auto_157134 ?auto_157132 ?auto_157136 ?auto_157133 ?auto_157131 )
      ( MAKE-2PILE ?auto_157128 ?auto_157129 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_157137 - BLOCK
      ?auto_157138 - BLOCK
    )
    :vars
    (
      ?auto_157142 - BLOCK
      ?auto_157139 - BLOCK
      ?auto_157144 - BLOCK
      ?auto_157145 - BLOCK
      ?auto_157141 - BLOCK
      ?auto_157143 - BLOCK
      ?auto_157140 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157137 ?auto_157138 ) ) ( not ( = ?auto_157137 ?auto_157142 ) ) ( not ( = ?auto_157138 ?auto_157142 ) ) ( not ( = ?auto_157137 ?auto_157139 ) ) ( not ( = ?auto_157137 ?auto_157144 ) ) ( not ( = ?auto_157138 ?auto_157139 ) ) ( not ( = ?auto_157138 ?auto_157144 ) ) ( not ( = ?auto_157142 ?auto_157139 ) ) ( not ( = ?auto_157142 ?auto_157144 ) ) ( not ( = ?auto_157139 ?auto_157144 ) ) ( not ( = ?auto_157145 ?auto_157141 ) ) ( not ( = ?auto_157145 ?auto_157143 ) ) ( not ( = ?auto_157145 ?auto_157144 ) ) ( not ( = ?auto_157141 ?auto_157143 ) ) ( not ( = ?auto_157141 ?auto_157144 ) ) ( not ( = ?auto_157143 ?auto_157144 ) ) ( not ( = ?auto_157137 ?auto_157143 ) ) ( not ( = ?auto_157137 ?auto_157145 ) ) ( not ( = ?auto_157137 ?auto_157141 ) ) ( not ( = ?auto_157138 ?auto_157143 ) ) ( not ( = ?auto_157138 ?auto_157145 ) ) ( not ( = ?auto_157138 ?auto_157141 ) ) ( not ( = ?auto_157142 ?auto_157143 ) ) ( not ( = ?auto_157142 ?auto_157145 ) ) ( not ( = ?auto_157142 ?auto_157141 ) ) ( not ( = ?auto_157139 ?auto_157143 ) ) ( not ( = ?auto_157139 ?auto_157145 ) ) ( not ( = ?auto_157139 ?auto_157141 ) ) ( ON ?auto_157145 ?auto_157140 ) ( not ( = ?auto_157137 ?auto_157140 ) ) ( not ( = ?auto_157138 ?auto_157140 ) ) ( not ( = ?auto_157142 ?auto_157140 ) ) ( not ( = ?auto_157139 ?auto_157140 ) ) ( not ( = ?auto_157144 ?auto_157140 ) ) ( not ( = ?auto_157145 ?auto_157140 ) ) ( not ( = ?auto_157141 ?auto_157140 ) ) ( not ( = ?auto_157143 ?auto_157140 ) ) ( ON ?auto_157141 ?auto_157145 ) ( ON-TABLE ?auto_157140 ) ( ON ?auto_157143 ?auto_157141 ) ( ON ?auto_157144 ?auto_157143 ) ( ON ?auto_157139 ?auto_157144 ) ( ON ?auto_157142 ?auto_157139 ) ( ON ?auto_157138 ?auto_157142 ) ( CLEAR ?auto_157138 ) ( HOLDING ?auto_157137 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_157137 )
      ( MAKE-2PILE ?auto_157137 ?auto_157138 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_157146 - BLOCK
      ?auto_157147 - BLOCK
    )
    :vars
    (
      ?auto_157149 - BLOCK
      ?auto_157154 - BLOCK
      ?auto_157151 - BLOCK
      ?auto_157150 - BLOCK
      ?auto_157148 - BLOCK
      ?auto_157152 - BLOCK
      ?auto_157153 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157146 ?auto_157147 ) ) ( not ( = ?auto_157146 ?auto_157149 ) ) ( not ( = ?auto_157147 ?auto_157149 ) ) ( not ( = ?auto_157146 ?auto_157154 ) ) ( not ( = ?auto_157146 ?auto_157151 ) ) ( not ( = ?auto_157147 ?auto_157154 ) ) ( not ( = ?auto_157147 ?auto_157151 ) ) ( not ( = ?auto_157149 ?auto_157154 ) ) ( not ( = ?auto_157149 ?auto_157151 ) ) ( not ( = ?auto_157154 ?auto_157151 ) ) ( not ( = ?auto_157150 ?auto_157148 ) ) ( not ( = ?auto_157150 ?auto_157152 ) ) ( not ( = ?auto_157150 ?auto_157151 ) ) ( not ( = ?auto_157148 ?auto_157152 ) ) ( not ( = ?auto_157148 ?auto_157151 ) ) ( not ( = ?auto_157152 ?auto_157151 ) ) ( not ( = ?auto_157146 ?auto_157152 ) ) ( not ( = ?auto_157146 ?auto_157150 ) ) ( not ( = ?auto_157146 ?auto_157148 ) ) ( not ( = ?auto_157147 ?auto_157152 ) ) ( not ( = ?auto_157147 ?auto_157150 ) ) ( not ( = ?auto_157147 ?auto_157148 ) ) ( not ( = ?auto_157149 ?auto_157152 ) ) ( not ( = ?auto_157149 ?auto_157150 ) ) ( not ( = ?auto_157149 ?auto_157148 ) ) ( not ( = ?auto_157154 ?auto_157152 ) ) ( not ( = ?auto_157154 ?auto_157150 ) ) ( not ( = ?auto_157154 ?auto_157148 ) ) ( ON ?auto_157150 ?auto_157153 ) ( not ( = ?auto_157146 ?auto_157153 ) ) ( not ( = ?auto_157147 ?auto_157153 ) ) ( not ( = ?auto_157149 ?auto_157153 ) ) ( not ( = ?auto_157154 ?auto_157153 ) ) ( not ( = ?auto_157151 ?auto_157153 ) ) ( not ( = ?auto_157150 ?auto_157153 ) ) ( not ( = ?auto_157148 ?auto_157153 ) ) ( not ( = ?auto_157152 ?auto_157153 ) ) ( ON ?auto_157148 ?auto_157150 ) ( ON-TABLE ?auto_157153 ) ( ON ?auto_157152 ?auto_157148 ) ( ON ?auto_157151 ?auto_157152 ) ( ON ?auto_157154 ?auto_157151 ) ( ON ?auto_157149 ?auto_157154 ) ( ON ?auto_157147 ?auto_157149 ) ( ON ?auto_157146 ?auto_157147 ) ( CLEAR ?auto_157146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_157153 ?auto_157150 ?auto_157148 ?auto_157152 ?auto_157151 ?auto_157154 ?auto_157149 ?auto_157147 )
      ( MAKE-2PILE ?auto_157146 ?auto_157147 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157161 - BLOCK
      ?auto_157162 - BLOCK
      ?auto_157163 - BLOCK
      ?auto_157164 - BLOCK
      ?auto_157165 - BLOCK
      ?auto_157166 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_157166 ) ( CLEAR ?auto_157165 ) ( ON-TABLE ?auto_157161 ) ( ON ?auto_157162 ?auto_157161 ) ( ON ?auto_157163 ?auto_157162 ) ( ON ?auto_157164 ?auto_157163 ) ( ON ?auto_157165 ?auto_157164 ) ( not ( = ?auto_157161 ?auto_157162 ) ) ( not ( = ?auto_157161 ?auto_157163 ) ) ( not ( = ?auto_157161 ?auto_157164 ) ) ( not ( = ?auto_157161 ?auto_157165 ) ) ( not ( = ?auto_157161 ?auto_157166 ) ) ( not ( = ?auto_157162 ?auto_157163 ) ) ( not ( = ?auto_157162 ?auto_157164 ) ) ( not ( = ?auto_157162 ?auto_157165 ) ) ( not ( = ?auto_157162 ?auto_157166 ) ) ( not ( = ?auto_157163 ?auto_157164 ) ) ( not ( = ?auto_157163 ?auto_157165 ) ) ( not ( = ?auto_157163 ?auto_157166 ) ) ( not ( = ?auto_157164 ?auto_157165 ) ) ( not ( = ?auto_157164 ?auto_157166 ) ) ( not ( = ?auto_157165 ?auto_157166 ) ) )
    :subtasks
    ( ( !STACK ?auto_157166 ?auto_157165 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157167 - BLOCK
      ?auto_157168 - BLOCK
      ?auto_157169 - BLOCK
      ?auto_157170 - BLOCK
      ?auto_157171 - BLOCK
      ?auto_157172 - BLOCK
    )
    :vars
    (
      ?auto_157173 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_157171 ) ( ON-TABLE ?auto_157167 ) ( ON ?auto_157168 ?auto_157167 ) ( ON ?auto_157169 ?auto_157168 ) ( ON ?auto_157170 ?auto_157169 ) ( ON ?auto_157171 ?auto_157170 ) ( not ( = ?auto_157167 ?auto_157168 ) ) ( not ( = ?auto_157167 ?auto_157169 ) ) ( not ( = ?auto_157167 ?auto_157170 ) ) ( not ( = ?auto_157167 ?auto_157171 ) ) ( not ( = ?auto_157167 ?auto_157172 ) ) ( not ( = ?auto_157168 ?auto_157169 ) ) ( not ( = ?auto_157168 ?auto_157170 ) ) ( not ( = ?auto_157168 ?auto_157171 ) ) ( not ( = ?auto_157168 ?auto_157172 ) ) ( not ( = ?auto_157169 ?auto_157170 ) ) ( not ( = ?auto_157169 ?auto_157171 ) ) ( not ( = ?auto_157169 ?auto_157172 ) ) ( not ( = ?auto_157170 ?auto_157171 ) ) ( not ( = ?auto_157170 ?auto_157172 ) ) ( not ( = ?auto_157171 ?auto_157172 ) ) ( ON ?auto_157172 ?auto_157173 ) ( CLEAR ?auto_157172 ) ( HAND-EMPTY ) ( not ( = ?auto_157167 ?auto_157173 ) ) ( not ( = ?auto_157168 ?auto_157173 ) ) ( not ( = ?auto_157169 ?auto_157173 ) ) ( not ( = ?auto_157170 ?auto_157173 ) ) ( not ( = ?auto_157171 ?auto_157173 ) ) ( not ( = ?auto_157172 ?auto_157173 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_157172 ?auto_157173 )
      ( MAKE-6PILE ?auto_157167 ?auto_157168 ?auto_157169 ?auto_157170 ?auto_157171 ?auto_157172 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157174 - BLOCK
      ?auto_157175 - BLOCK
      ?auto_157176 - BLOCK
      ?auto_157177 - BLOCK
      ?auto_157178 - BLOCK
      ?auto_157179 - BLOCK
    )
    :vars
    (
      ?auto_157180 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157174 ) ( ON ?auto_157175 ?auto_157174 ) ( ON ?auto_157176 ?auto_157175 ) ( ON ?auto_157177 ?auto_157176 ) ( not ( = ?auto_157174 ?auto_157175 ) ) ( not ( = ?auto_157174 ?auto_157176 ) ) ( not ( = ?auto_157174 ?auto_157177 ) ) ( not ( = ?auto_157174 ?auto_157178 ) ) ( not ( = ?auto_157174 ?auto_157179 ) ) ( not ( = ?auto_157175 ?auto_157176 ) ) ( not ( = ?auto_157175 ?auto_157177 ) ) ( not ( = ?auto_157175 ?auto_157178 ) ) ( not ( = ?auto_157175 ?auto_157179 ) ) ( not ( = ?auto_157176 ?auto_157177 ) ) ( not ( = ?auto_157176 ?auto_157178 ) ) ( not ( = ?auto_157176 ?auto_157179 ) ) ( not ( = ?auto_157177 ?auto_157178 ) ) ( not ( = ?auto_157177 ?auto_157179 ) ) ( not ( = ?auto_157178 ?auto_157179 ) ) ( ON ?auto_157179 ?auto_157180 ) ( CLEAR ?auto_157179 ) ( not ( = ?auto_157174 ?auto_157180 ) ) ( not ( = ?auto_157175 ?auto_157180 ) ) ( not ( = ?auto_157176 ?auto_157180 ) ) ( not ( = ?auto_157177 ?auto_157180 ) ) ( not ( = ?auto_157178 ?auto_157180 ) ) ( not ( = ?auto_157179 ?auto_157180 ) ) ( HOLDING ?auto_157178 ) ( CLEAR ?auto_157177 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_157174 ?auto_157175 ?auto_157176 ?auto_157177 ?auto_157178 )
      ( MAKE-6PILE ?auto_157174 ?auto_157175 ?auto_157176 ?auto_157177 ?auto_157178 ?auto_157179 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157181 - BLOCK
      ?auto_157182 - BLOCK
      ?auto_157183 - BLOCK
      ?auto_157184 - BLOCK
      ?auto_157185 - BLOCK
      ?auto_157186 - BLOCK
    )
    :vars
    (
      ?auto_157187 - BLOCK
      ?auto_157188 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157181 ) ( ON ?auto_157182 ?auto_157181 ) ( ON ?auto_157183 ?auto_157182 ) ( ON ?auto_157184 ?auto_157183 ) ( not ( = ?auto_157181 ?auto_157182 ) ) ( not ( = ?auto_157181 ?auto_157183 ) ) ( not ( = ?auto_157181 ?auto_157184 ) ) ( not ( = ?auto_157181 ?auto_157185 ) ) ( not ( = ?auto_157181 ?auto_157186 ) ) ( not ( = ?auto_157182 ?auto_157183 ) ) ( not ( = ?auto_157182 ?auto_157184 ) ) ( not ( = ?auto_157182 ?auto_157185 ) ) ( not ( = ?auto_157182 ?auto_157186 ) ) ( not ( = ?auto_157183 ?auto_157184 ) ) ( not ( = ?auto_157183 ?auto_157185 ) ) ( not ( = ?auto_157183 ?auto_157186 ) ) ( not ( = ?auto_157184 ?auto_157185 ) ) ( not ( = ?auto_157184 ?auto_157186 ) ) ( not ( = ?auto_157185 ?auto_157186 ) ) ( ON ?auto_157186 ?auto_157187 ) ( not ( = ?auto_157181 ?auto_157187 ) ) ( not ( = ?auto_157182 ?auto_157187 ) ) ( not ( = ?auto_157183 ?auto_157187 ) ) ( not ( = ?auto_157184 ?auto_157187 ) ) ( not ( = ?auto_157185 ?auto_157187 ) ) ( not ( = ?auto_157186 ?auto_157187 ) ) ( CLEAR ?auto_157184 ) ( ON ?auto_157185 ?auto_157186 ) ( CLEAR ?auto_157185 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_157188 ) ( ON ?auto_157187 ?auto_157188 ) ( not ( = ?auto_157188 ?auto_157187 ) ) ( not ( = ?auto_157188 ?auto_157186 ) ) ( not ( = ?auto_157188 ?auto_157185 ) ) ( not ( = ?auto_157181 ?auto_157188 ) ) ( not ( = ?auto_157182 ?auto_157188 ) ) ( not ( = ?auto_157183 ?auto_157188 ) ) ( not ( = ?auto_157184 ?auto_157188 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_157188 ?auto_157187 ?auto_157186 )
      ( MAKE-6PILE ?auto_157181 ?auto_157182 ?auto_157183 ?auto_157184 ?auto_157185 ?auto_157186 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157189 - BLOCK
      ?auto_157190 - BLOCK
      ?auto_157191 - BLOCK
      ?auto_157192 - BLOCK
      ?auto_157193 - BLOCK
      ?auto_157194 - BLOCK
    )
    :vars
    (
      ?auto_157196 - BLOCK
      ?auto_157195 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157189 ) ( ON ?auto_157190 ?auto_157189 ) ( ON ?auto_157191 ?auto_157190 ) ( not ( = ?auto_157189 ?auto_157190 ) ) ( not ( = ?auto_157189 ?auto_157191 ) ) ( not ( = ?auto_157189 ?auto_157192 ) ) ( not ( = ?auto_157189 ?auto_157193 ) ) ( not ( = ?auto_157189 ?auto_157194 ) ) ( not ( = ?auto_157190 ?auto_157191 ) ) ( not ( = ?auto_157190 ?auto_157192 ) ) ( not ( = ?auto_157190 ?auto_157193 ) ) ( not ( = ?auto_157190 ?auto_157194 ) ) ( not ( = ?auto_157191 ?auto_157192 ) ) ( not ( = ?auto_157191 ?auto_157193 ) ) ( not ( = ?auto_157191 ?auto_157194 ) ) ( not ( = ?auto_157192 ?auto_157193 ) ) ( not ( = ?auto_157192 ?auto_157194 ) ) ( not ( = ?auto_157193 ?auto_157194 ) ) ( ON ?auto_157194 ?auto_157196 ) ( not ( = ?auto_157189 ?auto_157196 ) ) ( not ( = ?auto_157190 ?auto_157196 ) ) ( not ( = ?auto_157191 ?auto_157196 ) ) ( not ( = ?auto_157192 ?auto_157196 ) ) ( not ( = ?auto_157193 ?auto_157196 ) ) ( not ( = ?auto_157194 ?auto_157196 ) ) ( ON ?auto_157193 ?auto_157194 ) ( CLEAR ?auto_157193 ) ( ON-TABLE ?auto_157195 ) ( ON ?auto_157196 ?auto_157195 ) ( not ( = ?auto_157195 ?auto_157196 ) ) ( not ( = ?auto_157195 ?auto_157194 ) ) ( not ( = ?auto_157195 ?auto_157193 ) ) ( not ( = ?auto_157189 ?auto_157195 ) ) ( not ( = ?auto_157190 ?auto_157195 ) ) ( not ( = ?auto_157191 ?auto_157195 ) ) ( not ( = ?auto_157192 ?auto_157195 ) ) ( HOLDING ?auto_157192 ) ( CLEAR ?auto_157191 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_157189 ?auto_157190 ?auto_157191 ?auto_157192 )
      ( MAKE-6PILE ?auto_157189 ?auto_157190 ?auto_157191 ?auto_157192 ?auto_157193 ?auto_157194 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157197 - BLOCK
      ?auto_157198 - BLOCK
      ?auto_157199 - BLOCK
      ?auto_157200 - BLOCK
      ?auto_157201 - BLOCK
      ?auto_157202 - BLOCK
    )
    :vars
    (
      ?auto_157204 - BLOCK
      ?auto_157203 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157197 ) ( ON ?auto_157198 ?auto_157197 ) ( ON ?auto_157199 ?auto_157198 ) ( not ( = ?auto_157197 ?auto_157198 ) ) ( not ( = ?auto_157197 ?auto_157199 ) ) ( not ( = ?auto_157197 ?auto_157200 ) ) ( not ( = ?auto_157197 ?auto_157201 ) ) ( not ( = ?auto_157197 ?auto_157202 ) ) ( not ( = ?auto_157198 ?auto_157199 ) ) ( not ( = ?auto_157198 ?auto_157200 ) ) ( not ( = ?auto_157198 ?auto_157201 ) ) ( not ( = ?auto_157198 ?auto_157202 ) ) ( not ( = ?auto_157199 ?auto_157200 ) ) ( not ( = ?auto_157199 ?auto_157201 ) ) ( not ( = ?auto_157199 ?auto_157202 ) ) ( not ( = ?auto_157200 ?auto_157201 ) ) ( not ( = ?auto_157200 ?auto_157202 ) ) ( not ( = ?auto_157201 ?auto_157202 ) ) ( ON ?auto_157202 ?auto_157204 ) ( not ( = ?auto_157197 ?auto_157204 ) ) ( not ( = ?auto_157198 ?auto_157204 ) ) ( not ( = ?auto_157199 ?auto_157204 ) ) ( not ( = ?auto_157200 ?auto_157204 ) ) ( not ( = ?auto_157201 ?auto_157204 ) ) ( not ( = ?auto_157202 ?auto_157204 ) ) ( ON ?auto_157201 ?auto_157202 ) ( ON-TABLE ?auto_157203 ) ( ON ?auto_157204 ?auto_157203 ) ( not ( = ?auto_157203 ?auto_157204 ) ) ( not ( = ?auto_157203 ?auto_157202 ) ) ( not ( = ?auto_157203 ?auto_157201 ) ) ( not ( = ?auto_157197 ?auto_157203 ) ) ( not ( = ?auto_157198 ?auto_157203 ) ) ( not ( = ?auto_157199 ?auto_157203 ) ) ( not ( = ?auto_157200 ?auto_157203 ) ) ( CLEAR ?auto_157199 ) ( ON ?auto_157200 ?auto_157201 ) ( CLEAR ?auto_157200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_157203 ?auto_157204 ?auto_157202 ?auto_157201 )
      ( MAKE-6PILE ?auto_157197 ?auto_157198 ?auto_157199 ?auto_157200 ?auto_157201 ?auto_157202 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157205 - BLOCK
      ?auto_157206 - BLOCK
      ?auto_157207 - BLOCK
      ?auto_157208 - BLOCK
      ?auto_157209 - BLOCK
      ?auto_157210 - BLOCK
    )
    :vars
    (
      ?auto_157211 - BLOCK
      ?auto_157212 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157205 ) ( ON ?auto_157206 ?auto_157205 ) ( not ( = ?auto_157205 ?auto_157206 ) ) ( not ( = ?auto_157205 ?auto_157207 ) ) ( not ( = ?auto_157205 ?auto_157208 ) ) ( not ( = ?auto_157205 ?auto_157209 ) ) ( not ( = ?auto_157205 ?auto_157210 ) ) ( not ( = ?auto_157206 ?auto_157207 ) ) ( not ( = ?auto_157206 ?auto_157208 ) ) ( not ( = ?auto_157206 ?auto_157209 ) ) ( not ( = ?auto_157206 ?auto_157210 ) ) ( not ( = ?auto_157207 ?auto_157208 ) ) ( not ( = ?auto_157207 ?auto_157209 ) ) ( not ( = ?auto_157207 ?auto_157210 ) ) ( not ( = ?auto_157208 ?auto_157209 ) ) ( not ( = ?auto_157208 ?auto_157210 ) ) ( not ( = ?auto_157209 ?auto_157210 ) ) ( ON ?auto_157210 ?auto_157211 ) ( not ( = ?auto_157205 ?auto_157211 ) ) ( not ( = ?auto_157206 ?auto_157211 ) ) ( not ( = ?auto_157207 ?auto_157211 ) ) ( not ( = ?auto_157208 ?auto_157211 ) ) ( not ( = ?auto_157209 ?auto_157211 ) ) ( not ( = ?auto_157210 ?auto_157211 ) ) ( ON ?auto_157209 ?auto_157210 ) ( ON-TABLE ?auto_157212 ) ( ON ?auto_157211 ?auto_157212 ) ( not ( = ?auto_157212 ?auto_157211 ) ) ( not ( = ?auto_157212 ?auto_157210 ) ) ( not ( = ?auto_157212 ?auto_157209 ) ) ( not ( = ?auto_157205 ?auto_157212 ) ) ( not ( = ?auto_157206 ?auto_157212 ) ) ( not ( = ?auto_157207 ?auto_157212 ) ) ( not ( = ?auto_157208 ?auto_157212 ) ) ( ON ?auto_157208 ?auto_157209 ) ( CLEAR ?auto_157208 ) ( HOLDING ?auto_157207 ) ( CLEAR ?auto_157206 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_157205 ?auto_157206 ?auto_157207 )
      ( MAKE-6PILE ?auto_157205 ?auto_157206 ?auto_157207 ?auto_157208 ?auto_157209 ?auto_157210 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157213 - BLOCK
      ?auto_157214 - BLOCK
      ?auto_157215 - BLOCK
      ?auto_157216 - BLOCK
      ?auto_157217 - BLOCK
      ?auto_157218 - BLOCK
    )
    :vars
    (
      ?auto_157220 - BLOCK
      ?auto_157219 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157213 ) ( ON ?auto_157214 ?auto_157213 ) ( not ( = ?auto_157213 ?auto_157214 ) ) ( not ( = ?auto_157213 ?auto_157215 ) ) ( not ( = ?auto_157213 ?auto_157216 ) ) ( not ( = ?auto_157213 ?auto_157217 ) ) ( not ( = ?auto_157213 ?auto_157218 ) ) ( not ( = ?auto_157214 ?auto_157215 ) ) ( not ( = ?auto_157214 ?auto_157216 ) ) ( not ( = ?auto_157214 ?auto_157217 ) ) ( not ( = ?auto_157214 ?auto_157218 ) ) ( not ( = ?auto_157215 ?auto_157216 ) ) ( not ( = ?auto_157215 ?auto_157217 ) ) ( not ( = ?auto_157215 ?auto_157218 ) ) ( not ( = ?auto_157216 ?auto_157217 ) ) ( not ( = ?auto_157216 ?auto_157218 ) ) ( not ( = ?auto_157217 ?auto_157218 ) ) ( ON ?auto_157218 ?auto_157220 ) ( not ( = ?auto_157213 ?auto_157220 ) ) ( not ( = ?auto_157214 ?auto_157220 ) ) ( not ( = ?auto_157215 ?auto_157220 ) ) ( not ( = ?auto_157216 ?auto_157220 ) ) ( not ( = ?auto_157217 ?auto_157220 ) ) ( not ( = ?auto_157218 ?auto_157220 ) ) ( ON ?auto_157217 ?auto_157218 ) ( ON-TABLE ?auto_157219 ) ( ON ?auto_157220 ?auto_157219 ) ( not ( = ?auto_157219 ?auto_157220 ) ) ( not ( = ?auto_157219 ?auto_157218 ) ) ( not ( = ?auto_157219 ?auto_157217 ) ) ( not ( = ?auto_157213 ?auto_157219 ) ) ( not ( = ?auto_157214 ?auto_157219 ) ) ( not ( = ?auto_157215 ?auto_157219 ) ) ( not ( = ?auto_157216 ?auto_157219 ) ) ( ON ?auto_157216 ?auto_157217 ) ( CLEAR ?auto_157214 ) ( ON ?auto_157215 ?auto_157216 ) ( CLEAR ?auto_157215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_157219 ?auto_157220 ?auto_157218 ?auto_157217 ?auto_157216 )
      ( MAKE-6PILE ?auto_157213 ?auto_157214 ?auto_157215 ?auto_157216 ?auto_157217 ?auto_157218 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157221 - BLOCK
      ?auto_157222 - BLOCK
      ?auto_157223 - BLOCK
      ?auto_157224 - BLOCK
      ?auto_157225 - BLOCK
      ?auto_157226 - BLOCK
    )
    :vars
    (
      ?auto_157228 - BLOCK
      ?auto_157227 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157221 ) ( not ( = ?auto_157221 ?auto_157222 ) ) ( not ( = ?auto_157221 ?auto_157223 ) ) ( not ( = ?auto_157221 ?auto_157224 ) ) ( not ( = ?auto_157221 ?auto_157225 ) ) ( not ( = ?auto_157221 ?auto_157226 ) ) ( not ( = ?auto_157222 ?auto_157223 ) ) ( not ( = ?auto_157222 ?auto_157224 ) ) ( not ( = ?auto_157222 ?auto_157225 ) ) ( not ( = ?auto_157222 ?auto_157226 ) ) ( not ( = ?auto_157223 ?auto_157224 ) ) ( not ( = ?auto_157223 ?auto_157225 ) ) ( not ( = ?auto_157223 ?auto_157226 ) ) ( not ( = ?auto_157224 ?auto_157225 ) ) ( not ( = ?auto_157224 ?auto_157226 ) ) ( not ( = ?auto_157225 ?auto_157226 ) ) ( ON ?auto_157226 ?auto_157228 ) ( not ( = ?auto_157221 ?auto_157228 ) ) ( not ( = ?auto_157222 ?auto_157228 ) ) ( not ( = ?auto_157223 ?auto_157228 ) ) ( not ( = ?auto_157224 ?auto_157228 ) ) ( not ( = ?auto_157225 ?auto_157228 ) ) ( not ( = ?auto_157226 ?auto_157228 ) ) ( ON ?auto_157225 ?auto_157226 ) ( ON-TABLE ?auto_157227 ) ( ON ?auto_157228 ?auto_157227 ) ( not ( = ?auto_157227 ?auto_157228 ) ) ( not ( = ?auto_157227 ?auto_157226 ) ) ( not ( = ?auto_157227 ?auto_157225 ) ) ( not ( = ?auto_157221 ?auto_157227 ) ) ( not ( = ?auto_157222 ?auto_157227 ) ) ( not ( = ?auto_157223 ?auto_157227 ) ) ( not ( = ?auto_157224 ?auto_157227 ) ) ( ON ?auto_157224 ?auto_157225 ) ( ON ?auto_157223 ?auto_157224 ) ( CLEAR ?auto_157223 ) ( HOLDING ?auto_157222 ) ( CLEAR ?auto_157221 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_157221 ?auto_157222 )
      ( MAKE-6PILE ?auto_157221 ?auto_157222 ?auto_157223 ?auto_157224 ?auto_157225 ?auto_157226 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157229 - BLOCK
      ?auto_157230 - BLOCK
      ?auto_157231 - BLOCK
      ?auto_157232 - BLOCK
      ?auto_157233 - BLOCK
      ?auto_157234 - BLOCK
    )
    :vars
    (
      ?auto_157235 - BLOCK
      ?auto_157236 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157229 ) ( not ( = ?auto_157229 ?auto_157230 ) ) ( not ( = ?auto_157229 ?auto_157231 ) ) ( not ( = ?auto_157229 ?auto_157232 ) ) ( not ( = ?auto_157229 ?auto_157233 ) ) ( not ( = ?auto_157229 ?auto_157234 ) ) ( not ( = ?auto_157230 ?auto_157231 ) ) ( not ( = ?auto_157230 ?auto_157232 ) ) ( not ( = ?auto_157230 ?auto_157233 ) ) ( not ( = ?auto_157230 ?auto_157234 ) ) ( not ( = ?auto_157231 ?auto_157232 ) ) ( not ( = ?auto_157231 ?auto_157233 ) ) ( not ( = ?auto_157231 ?auto_157234 ) ) ( not ( = ?auto_157232 ?auto_157233 ) ) ( not ( = ?auto_157232 ?auto_157234 ) ) ( not ( = ?auto_157233 ?auto_157234 ) ) ( ON ?auto_157234 ?auto_157235 ) ( not ( = ?auto_157229 ?auto_157235 ) ) ( not ( = ?auto_157230 ?auto_157235 ) ) ( not ( = ?auto_157231 ?auto_157235 ) ) ( not ( = ?auto_157232 ?auto_157235 ) ) ( not ( = ?auto_157233 ?auto_157235 ) ) ( not ( = ?auto_157234 ?auto_157235 ) ) ( ON ?auto_157233 ?auto_157234 ) ( ON-TABLE ?auto_157236 ) ( ON ?auto_157235 ?auto_157236 ) ( not ( = ?auto_157236 ?auto_157235 ) ) ( not ( = ?auto_157236 ?auto_157234 ) ) ( not ( = ?auto_157236 ?auto_157233 ) ) ( not ( = ?auto_157229 ?auto_157236 ) ) ( not ( = ?auto_157230 ?auto_157236 ) ) ( not ( = ?auto_157231 ?auto_157236 ) ) ( not ( = ?auto_157232 ?auto_157236 ) ) ( ON ?auto_157232 ?auto_157233 ) ( ON ?auto_157231 ?auto_157232 ) ( CLEAR ?auto_157229 ) ( ON ?auto_157230 ?auto_157231 ) ( CLEAR ?auto_157230 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_157236 ?auto_157235 ?auto_157234 ?auto_157233 ?auto_157232 ?auto_157231 )
      ( MAKE-6PILE ?auto_157229 ?auto_157230 ?auto_157231 ?auto_157232 ?auto_157233 ?auto_157234 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157237 - BLOCK
      ?auto_157238 - BLOCK
      ?auto_157239 - BLOCK
      ?auto_157240 - BLOCK
      ?auto_157241 - BLOCK
      ?auto_157242 - BLOCK
    )
    :vars
    (
      ?auto_157244 - BLOCK
      ?auto_157243 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157237 ?auto_157238 ) ) ( not ( = ?auto_157237 ?auto_157239 ) ) ( not ( = ?auto_157237 ?auto_157240 ) ) ( not ( = ?auto_157237 ?auto_157241 ) ) ( not ( = ?auto_157237 ?auto_157242 ) ) ( not ( = ?auto_157238 ?auto_157239 ) ) ( not ( = ?auto_157238 ?auto_157240 ) ) ( not ( = ?auto_157238 ?auto_157241 ) ) ( not ( = ?auto_157238 ?auto_157242 ) ) ( not ( = ?auto_157239 ?auto_157240 ) ) ( not ( = ?auto_157239 ?auto_157241 ) ) ( not ( = ?auto_157239 ?auto_157242 ) ) ( not ( = ?auto_157240 ?auto_157241 ) ) ( not ( = ?auto_157240 ?auto_157242 ) ) ( not ( = ?auto_157241 ?auto_157242 ) ) ( ON ?auto_157242 ?auto_157244 ) ( not ( = ?auto_157237 ?auto_157244 ) ) ( not ( = ?auto_157238 ?auto_157244 ) ) ( not ( = ?auto_157239 ?auto_157244 ) ) ( not ( = ?auto_157240 ?auto_157244 ) ) ( not ( = ?auto_157241 ?auto_157244 ) ) ( not ( = ?auto_157242 ?auto_157244 ) ) ( ON ?auto_157241 ?auto_157242 ) ( ON-TABLE ?auto_157243 ) ( ON ?auto_157244 ?auto_157243 ) ( not ( = ?auto_157243 ?auto_157244 ) ) ( not ( = ?auto_157243 ?auto_157242 ) ) ( not ( = ?auto_157243 ?auto_157241 ) ) ( not ( = ?auto_157237 ?auto_157243 ) ) ( not ( = ?auto_157238 ?auto_157243 ) ) ( not ( = ?auto_157239 ?auto_157243 ) ) ( not ( = ?auto_157240 ?auto_157243 ) ) ( ON ?auto_157240 ?auto_157241 ) ( ON ?auto_157239 ?auto_157240 ) ( ON ?auto_157238 ?auto_157239 ) ( CLEAR ?auto_157238 ) ( HOLDING ?auto_157237 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_157237 )
      ( MAKE-6PILE ?auto_157237 ?auto_157238 ?auto_157239 ?auto_157240 ?auto_157241 ?auto_157242 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157245 - BLOCK
      ?auto_157246 - BLOCK
      ?auto_157247 - BLOCK
      ?auto_157248 - BLOCK
      ?auto_157249 - BLOCK
      ?auto_157250 - BLOCK
    )
    :vars
    (
      ?auto_157251 - BLOCK
      ?auto_157252 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157245 ?auto_157246 ) ) ( not ( = ?auto_157245 ?auto_157247 ) ) ( not ( = ?auto_157245 ?auto_157248 ) ) ( not ( = ?auto_157245 ?auto_157249 ) ) ( not ( = ?auto_157245 ?auto_157250 ) ) ( not ( = ?auto_157246 ?auto_157247 ) ) ( not ( = ?auto_157246 ?auto_157248 ) ) ( not ( = ?auto_157246 ?auto_157249 ) ) ( not ( = ?auto_157246 ?auto_157250 ) ) ( not ( = ?auto_157247 ?auto_157248 ) ) ( not ( = ?auto_157247 ?auto_157249 ) ) ( not ( = ?auto_157247 ?auto_157250 ) ) ( not ( = ?auto_157248 ?auto_157249 ) ) ( not ( = ?auto_157248 ?auto_157250 ) ) ( not ( = ?auto_157249 ?auto_157250 ) ) ( ON ?auto_157250 ?auto_157251 ) ( not ( = ?auto_157245 ?auto_157251 ) ) ( not ( = ?auto_157246 ?auto_157251 ) ) ( not ( = ?auto_157247 ?auto_157251 ) ) ( not ( = ?auto_157248 ?auto_157251 ) ) ( not ( = ?auto_157249 ?auto_157251 ) ) ( not ( = ?auto_157250 ?auto_157251 ) ) ( ON ?auto_157249 ?auto_157250 ) ( ON-TABLE ?auto_157252 ) ( ON ?auto_157251 ?auto_157252 ) ( not ( = ?auto_157252 ?auto_157251 ) ) ( not ( = ?auto_157252 ?auto_157250 ) ) ( not ( = ?auto_157252 ?auto_157249 ) ) ( not ( = ?auto_157245 ?auto_157252 ) ) ( not ( = ?auto_157246 ?auto_157252 ) ) ( not ( = ?auto_157247 ?auto_157252 ) ) ( not ( = ?auto_157248 ?auto_157252 ) ) ( ON ?auto_157248 ?auto_157249 ) ( ON ?auto_157247 ?auto_157248 ) ( ON ?auto_157246 ?auto_157247 ) ( ON ?auto_157245 ?auto_157246 ) ( CLEAR ?auto_157245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_157252 ?auto_157251 ?auto_157250 ?auto_157249 ?auto_157248 ?auto_157247 ?auto_157246 )
      ( MAKE-6PILE ?auto_157245 ?auto_157246 ?auto_157247 ?auto_157248 ?auto_157249 ?auto_157250 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157253 - BLOCK
      ?auto_157254 - BLOCK
      ?auto_157255 - BLOCK
      ?auto_157256 - BLOCK
      ?auto_157257 - BLOCK
      ?auto_157258 - BLOCK
    )
    :vars
    (
      ?auto_157259 - BLOCK
      ?auto_157260 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157253 ?auto_157254 ) ) ( not ( = ?auto_157253 ?auto_157255 ) ) ( not ( = ?auto_157253 ?auto_157256 ) ) ( not ( = ?auto_157253 ?auto_157257 ) ) ( not ( = ?auto_157253 ?auto_157258 ) ) ( not ( = ?auto_157254 ?auto_157255 ) ) ( not ( = ?auto_157254 ?auto_157256 ) ) ( not ( = ?auto_157254 ?auto_157257 ) ) ( not ( = ?auto_157254 ?auto_157258 ) ) ( not ( = ?auto_157255 ?auto_157256 ) ) ( not ( = ?auto_157255 ?auto_157257 ) ) ( not ( = ?auto_157255 ?auto_157258 ) ) ( not ( = ?auto_157256 ?auto_157257 ) ) ( not ( = ?auto_157256 ?auto_157258 ) ) ( not ( = ?auto_157257 ?auto_157258 ) ) ( ON ?auto_157258 ?auto_157259 ) ( not ( = ?auto_157253 ?auto_157259 ) ) ( not ( = ?auto_157254 ?auto_157259 ) ) ( not ( = ?auto_157255 ?auto_157259 ) ) ( not ( = ?auto_157256 ?auto_157259 ) ) ( not ( = ?auto_157257 ?auto_157259 ) ) ( not ( = ?auto_157258 ?auto_157259 ) ) ( ON ?auto_157257 ?auto_157258 ) ( ON-TABLE ?auto_157260 ) ( ON ?auto_157259 ?auto_157260 ) ( not ( = ?auto_157260 ?auto_157259 ) ) ( not ( = ?auto_157260 ?auto_157258 ) ) ( not ( = ?auto_157260 ?auto_157257 ) ) ( not ( = ?auto_157253 ?auto_157260 ) ) ( not ( = ?auto_157254 ?auto_157260 ) ) ( not ( = ?auto_157255 ?auto_157260 ) ) ( not ( = ?auto_157256 ?auto_157260 ) ) ( ON ?auto_157256 ?auto_157257 ) ( ON ?auto_157255 ?auto_157256 ) ( ON ?auto_157254 ?auto_157255 ) ( HOLDING ?auto_157253 ) ( CLEAR ?auto_157254 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_157260 ?auto_157259 ?auto_157258 ?auto_157257 ?auto_157256 ?auto_157255 ?auto_157254 ?auto_157253 )
      ( MAKE-6PILE ?auto_157253 ?auto_157254 ?auto_157255 ?auto_157256 ?auto_157257 ?auto_157258 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157261 - BLOCK
      ?auto_157262 - BLOCK
      ?auto_157263 - BLOCK
      ?auto_157264 - BLOCK
      ?auto_157265 - BLOCK
      ?auto_157266 - BLOCK
    )
    :vars
    (
      ?auto_157268 - BLOCK
      ?auto_157267 - BLOCK
      ?auto_157269 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157261 ?auto_157262 ) ) ( not ( = ?auto_157261 ?auto_157263 ) ) ( not ( = ?auto_157261 ?auto_157264 ) ) ( not ( = ?auto_157261 ?auto_157265 ) ) ( not ( = ?auto_157261 ?auto_157266 ) ) ( not ( = ?auto_157262 ?auto_157263 ) ) ( not ( = ?auto_157262 ?auto_157264 ) ) ( not ( = ?auto_157262 ?auto_157265 ) ) ( not ( = ?auto_157262 ?auto_157266 ) ) ( not ( = ?auto_157263 ?auto_157264 ) ) ( not ( = ?auto_157263 ?auto_157265 ) ) ( not ( = ?auto_157263 ?auto_157266 ) ) ( not ( = ?auto_157264 ?auto_157265 ) ) ( not ( = ?auto_157264 ?auto_157266 ) ) ( not ( = ?auto_157265 ?auto_157266 ) ) ( ON ?auto_157266 ?auto_157268 ) ( not ( = ?auto_157261 ?auto_157268 ) ) ( not ( = ?auto_157262 ?auto_157268 ) ) ( not ( = ?auto_157263 ?auto_157268 ) ) ( not ( = ?auto_157264 ?auto_157268 ) ) ( not ( = ?auto_157265 ?auto_157268 ) ) ( not ( = ?auto_157266 ?auto_157268 ) ) ( ON ?auto_157265 ?auto_157266 ) ( ON-TABLE ?auto_157267 ) ( ON ?auto_157268 ?auto_157267 ) ( not ( = ?auto_157267 ?auto_157268 ) ) ( not ( = ?auto_157267 ?auto_157266 ) ) ( not ( = ?auto_157267 ?auto_157265 ) ) ( not ( = ?auto_157261 ?auto_157267 ) ) ( not ( = ?auto_157262 ?auto_157267 ) ) ( not ( = ?auto_157263 ?auto_157267 ) ) ( not ( = ?auto_157264 ?auto_157267 ) ) ( ON ?auto_157264 ?auto_157265 ) ( ON ?auto_157263 ?auto_157264 ) ( ON ?auto_157262 ?auto_157263 ) ( CLEAR ?auto_157262 ) ( ON ?auto_157261 ?auto_157269 ) ( CLEAR ?auto_157261 ) ( HAND-EMPTY ) ( not ( = ?auto_157261 ?auto_157269 ) ) ( not ( = ?auto_157262 ?auto_157269 ) ) ( not ( = ?auto_157263 ?auto_157269 ) ) ( not ( = ?auto_157264 ?auto_157269 ) ) ( not ( = ?auto_157265 ?auto_157269 ) ) ( not ( = ?auto_157266 ?auto_157269 ) ) ( not ( = ?auto_157268 ?auto_157269 ) ) ( not ( = ?auto_157267 ?auto_157269 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_157261 ?auto_157269 )
      ( MAKE-6PILE ?auto_157261 ?auto_157262 ?auto_157263 ?auto_157264 ?auto_157265 ?auto_157266 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157270 - BLOCK
      ?auto_157271 - BLOCK
      ?auto_157272 - BLOCK
      ?auto_157273 - BLOCK
      ?auto_157274 - BLOCK
      ?auto_157275 - BLOCK
    )
    :vars
    (
      ?auto_157277 - BLOCK
      ?auto_157276 - BLOCK
      ?auto_157278 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157270 ?auto_157271 ) ) ( not ( = ?auto_157270 ?auto_157272 ) ) ( not ( = ?auto_157270 ?auto_157273 ) ) ( not ( = ?auto_157270 ?auto_157274 ) ) ( not ( = ?auto_157270 ?auto_157275 ) ) ( not ( = ?auto_157271 ?auto_157272 ) ) ( not ( = ?auto_157271 ?auto_157273 ) ) ( not ( = ?auto_157271 ?auto_157274 ) ) ( not ( = ?auto_157271 ?auto_157275 ) ) ( not ( = ?auto_157272 ?auto_157273 ) ) ( not ( = ?auto_157272 ?auto_157274 ) ) ( not ( = ?auto_157272 ?auto_157275 ) ) ( not ( = ?auto_157273 ?auto_157274 ) ) ( not ( = ?auto_157273 ?auto_157275 ) ) ( not ( = ?auto_157274 ?auto_157275 ) ) ( ON ?auto_157275 ?auto_157277 ) ( not ( = ?auto_157270 ?auto_157277 ) ) ( not ( = ?auto_157271 ?auto_157277 ) ) ( not ( = ?auto_157272 ?auto_157277 ) ) ( not ( = ?auto_157273 ?auto_157277 ) ) ( not ( = ?auto_157274 ?auto_157277 ) ) ( not ( = ?auto_157275 ?auto_157277 ) ) ( ON ?auto_157274 ?auto_157275 ) ( ON-TABLE ?auto_157276 ) ( ON ?auto_157277 ?auto_157276 ) ( not ( = ?auto_157276 ?auto_157277 ) ) ( not ( = ?auto_157276 ?auto_157275 ) ) ( not ( = ?auto_157276 ?auto_157274 ) ) ( not ( = ?auto_157270 ?auto_157276 ) ) ( not ( = ?auto_157271 ?auto_157276 ) ) ( not ( = ?auto_157272 ?auto_157276 ) ) ( not ( = ?auto_157273 ?auto_157276 ) ) ( ON ?auto_157273 ?auto_157274 ) ( ON ?auto_157272 ?auto_157273 ) ( ON ?auto_157270 ?auto_157278 ) ( CLEAR ?auto_157270 ) ( not ( = ?auto_157270 ?auto_157278 ) ) ( not ( = ?auto_157271 ?auto_157278 ) ) ( not ( = ?auto_157272 ?auto_157278 ) ) ( not ( = ?auto_157273 ?auto_157278 ) ) ( not ( = ?auto_157274 ?auto_157278 ) ) ( not ( = ?auto_157275 ?auto_157278 ) ) ( not ( = ?auto_157277 ?auto_157278 ) ) ( not ( = ?auto_157276 ?auto_157278 ) ) ( HOLDING ?auto_157271 ) ( CLEAR ?auto_157272 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_157276 ?auto_157277 ?auto_157275 ?auto_157274 ?auto_157273 ?auto_157272 ?auto_157271 )
      ( MAKE-6PILE ?auto_157270 ?auto_157271 ?auto_157272 ?auto_157273 ?auto_157274 ?auto_157275 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157279 - BLOCK
      ?auto_157280 - BLOCK
      ?auto_157281 - BLOCK
      ?auto_157282 - BLOCK
      ?auto_157283 - BLOCK
      ?auto_157284 - BLOCK
    )
    :vars
    (
      ?auto_157286 - BLOCK
      ?auto_157285 - BLOCK
      ?auto_157287 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157279 ?auto_157280 ) ) ( not ( = ?auto_157279 ?auto_157281 ) ) ( not ( = ?auto_157279 ?auto_157282 ) ) ( not ( = ?auto_157279 ?auto_157283 ) ) ( not ( = ?auto_157279 ?auto_157284 ) ) ( not ( = ?auto_157280 ?auto_157281 ) ) ( not ( = ?auto_157280 ?auto_157282 ) ) ( not ( = ?auto_157280 ?auto_157283 ) ) ( not ( = ?auto_157280 ?auto_157284 ) ) ( not ( = ?auto_157281 ?auto_157282 ) ) ( not ( = ?auto_157281 ?auto_157283 ) ) ( not ( = ?auto_157281 ?auto_157284 ) ) ( not ( = ?auto_157282 ?auto_157283 ) ) ( not ( = ?auto_157282 ?auto_157284 ) ) ( not ( = ?auto_157283 ?auto_157284 ) ) ( ON ?auto_157284 ?auto_157286 ) ( not ( = ?auto_157279 ?auto_157286 ) ) ( not ( = ?auto_157280 ?auto_157286 ) ) ( not ( = ?auto_157281 ?auto_157286 ) ) ( not ( = ?auto_157282 ?auto_157286 ) ) ( not ( = ?auto_157283 ?auto_157286 ) ) ( not ( = ?auto_157284 ?auto_157286 ) ) ( ON ?auto_157283 ?auto_157284 ) ( ON-TABLE ?auto_157285 ) ( ON ?auto_157286 ?auto_157285 ) ( not ( = ?auto_157285 ?auto_157286 ) ) ( not ( = ?auto_157285 ?auto_157284 ) ) ( not ( = ?auto_157285 ?auto_157283 ) ) ( not ( = ?auto_157279 ?auto_157285 ) ) ( not ( = ?auto_157280 ?auto_157285 ) ) ( not ( = ?auto_157281 ?auto_157285 ) ) ( not ( = ?auto_157282 ?auto_157285 ) ) ( ON ?auto_157282 ?auto_157283 ) ( ON ?auto_157281 ?auto_157282 ) ( ON ?auto_157279 ?auto_157287 ) ( not ( = ?auto_157279 ?auto_157287 ) ) ( not ( = ?auto_157280 ?auto_157287 ) ) ( not ( = ?auto_157281 ?auto_157287 ) ) ( not ( = ?auto_157282 ?auto_157287 ) ) ( not ( = ?auto_157283 ?auto_157287 ) ) ( not ( = ?auto_157284 ?auto_157287 ) ) ( not ( = ?auto_157286 ?auto_157287 ) ) ( not ( = ?auto_157285 ?auto_157287 ) ) ( CLEAR ?auto_157281 ) ( ON ?auto_157280 ?auto_157279 ) ( CLEAR ?auto_157280 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_157287 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_157287 ?auto_157279 )
      ( MAKE-6PILE ?auto_157279 ?auto_157280 ?auto_157281 ?auto_157282 ?auto_157283 ?auto_157284 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157288 - BLOCK
      ?auto_157289 - BLOCK
      ?auto_157290 - BLOCK
      ?auto_157291 - BLOCK
      ?auto_157292 - BLOCK
      ?auto_157293 - BLOCK
    )
    :vars
    (
      ?auto_157294 - BLOCK
      ?auto_157296 - BLOCK
      ?auto_157295 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157288 ?auto_157289 ) ) ( not ( = ?auto_157288 ?auto_157290 ) ) ( not ( = ?auto_157288 ?auto_157291 ) ) ( not ( = ?auto_157288 ?auto_157292 ) ) ( not ( = ?auto_157288 ?auto_157293 ) ) ( not ( = ?auto_157289 ?auto_157290 ) ) ( not ( = ?auto_157289 ?auto_157291 ) ) ( not ( = ?auto_157289 ?auto_157292 ) ) ( not ( = ?auto_157289 ?auto_157293 ) ) ( not ( = ?auto_157290 ?auto_157291 ) ) ( not ( = ?auto_157290 ?auto_157292 ) ) ( not ( = ?auto_157290 ?auto_157293 ) ) ( not ( = ?auto_157291 ?auto_157292 ) ) ( not ( = ?auto_157291 ?auto_157293 ) ) ( not ( = ?auto_157292 ?auto_157293 ) ) ( ON ?auto_157293 ?auto_157294 ) ( not ( = ?auto_157288 ?auto_157294 ) ) ( not ( = ?auto_157289 ?auto_157294 ) ) ( not ( = ?auto_157290 ?auto_157294 ) ) ( not ( = ?auto_157291 ?auto_157294 ) ) ( not ( = ?auto_157292 ?auto_157294 ) ) ( not ( = ?auto_157293 ?auto_157294 ) ) ( ON ?auto_157292 ?auto_157293 ) ( ON-TABLE ?auto_157296 ) ( ON ?auto_157294 ?auto_157296 ) ( not ( = ?auto_157296 ?auto_157294 ) ) ( not ( = ?auto_157296 ?auto_157293 ) ) ( not ( = ?auto_157296 ?auto_157292 ) ) ( not ( = ?auto_157288 ?auto_157296 ) ) ( not ( = ?auto_157289 ?auto_157296 ) ) ( not ( = ?auto_157290 ?auto_157296 ) ) ( not ( = ?auto_157291 ?auto_157296 ) ) ( ON ?auto_157291 ?auto_157292 ) ( ON ?auto_157288 ?auto_157295 ) ( not ( = ?auto_157288 ?auto_157295 ) ) ( not ( = ?auto_157289 ?auto_157295 ) ) ( not ( = ?auto_157290 ?auto_157295 ) ) ( not ( = ?auto_157291 ?auto_157295 ) ) ( not ( = ?auto_157292 ?auto_157295 ) ) ( not ( = ?auto_157293 ?auto_157295 ) ) ( not ( = ?auto_157294 ?auto_157295 ) ) ( not ( = ?auto_157296 ?auto_157295 ) ) ( ON ?auto_157289 ?auto_157288 ) ( CLEAR ?auto_157289 ) ( ON-TABLE ?auto_157295 ) ( HOLDING ?auto_157290 ) ( CLEAR ?auto_157291 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_157296 ?auto_157294 ?auto_157293 ?auto_157292 ?auto_157291 ?auto_157290 )
      ( MAKE-6PILE ?auto_157288 ?auto_157289 ?auto_157290 ?auto_157291 ?auto_157292 ?auto_157293 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157297 - BLOCK
      ?auto_157298 - BLOCK
      ?auto_157299 - BLOCK
      ?auto_157300 - BLOCK
      ?auto_157301 - BLOCK
      ?auto_157302 - BLOCK
    )
    :vars
    (
      ?auto_157303 - BLOCK
      ?auto_157304 - BLOCK
      ?auto_157305 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157297 ?auto_157298 ) ) ( not ( = ?auto_157297 ?auto_157299 ) ) ( not ( = ?auto_157297 ?auto_157300 ) ) ( not ( = ?auto_157297 ?auto_157301 ) ) ( not ( = ?auto_157297 ?auto_157302 ) ) ( not ( = ?auto_157298 ?auto_157299 ) ) ( not ( = ?auto_157298 ?auto_157300 ) ) ( not ( = ?auto_157298 ?auto_157301 ) ) ( not ( = ?auto_157298 ?auto_157302 ) ) ( not ( = ?auto_157299 ?auto_157300 ) ) ( not ( = ?auto_157299 ?auto_157301 ) ) ( not ( = ?auto_157299 ?auto_157302 ) ) ( not ( = ?auto_157300 ?auto_157301 ) ) ( not ( = ?auto_157300 ?auto_157302 ) ) ( not ( = ?auto_157301 ?auto_157302 ) ) ( ON ?auto_157302 ?auto_157303 ) ( not ( = ?auto_157297 ?auto_157303 ) ) ( not ( = ?auto_157298 ?auto_157303 ) ) ( not ( = ?auto_157299 ?auto_157303 ) ) ( not ( = ?auto_157300 ?auto_157303 ) ) ( not ( = ?auto_157301 ?auto_157303 ) ) ( not ( = ?auto_157302 ?auto_157303 ) ) ( ON ?auto_157301 ?auto_157302 ) ( ON-TABLE ?auto_157304 ) ( ON ?auto_157303 ?auto_157304 ) ( not ( = ?auto_157304 ?auto_157303 ) ) ( not ( = ?auto_157304 ?auto_157302 ) ) ( not ( = ?auto_157304 ?auto_157301 ) ) ( not ( = ?auto_157297 ?auto_157304 ) ) ( not ( = ?auto_157298 ?auto_157304 ) ) ( not ( = ?auto_157299 ?auto_157304 ) ) ( not ( = ?auto_157300 ?auto_157304 ) ) ( ON ?auto_157300 ?auto_157301 ) ( ON ?auto_157297 ?auto_157305 ) ( not ( = ?auto_157297 ?auto_157305 ) ) ( not ( = ?auto_157298 ?auto_157305 ) ) ( not ( = ?auto_157299 ?auto_157305 ) ) ( not ( = ?auto_157300 ?auto_157305 ) ) ( not ( = ?auto_157301 ?auto_157305 ) ) ( not ( = ?auto_157302 ?auto_157305 ) ) ( not ( = ?auto_157303 ?auto_157305 ) ) ( not ( = ?auto_157304 ?auto_157305 ) ) ( ON ?auto_157298 ?auto_157297 ) ( ON-TABLE ?auto_157305 ) ( CLEAR ?auto_157300 ) ( ON ?auto_157299 ?auto_157298 ) ( CLEAR ?auto_157299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_157305 ?auto_157297 ?auto_157298 )
      ( MAKE-6PILE ?auto_157297 ?auto_157298 ?auto_157299 ?auto_157300 ?auto_157301 ?auto_157302 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157306 - BLOCK
      ?auto_157307 - BLOCK
      ?auto_157308 - BLOCK
      ?auto_157309 - BLOCK
      ?auto_157310 - BLOCK
      ?auto_157311 - BLOCK
    )
    :vars
    (
      ?auto_157312 - BLOCK
      ?auto_157313 - BLOCK
      ?auto_157314 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157306 ?auto_157307 ) ) ( not ( = ?auto_157306 ?auto_157308 ) ) ( not ( = ?auto_157306 ?auto_157309 ) ) ( not ( = ?auto_157306 ?auto_157310 ) ) ( not ( = ?auto_157306 ?auto_157311 ) ) ( not ( = ?auto_157307 ?auto_157308 ) ) ( not ( = ?auto_157307 ?auto_157309 ) ) ( not ( = ?auto_157307 ?auto_157310 ) ) ( not ( = ?auto_157307 ?auto_157311 ) ) ( not ( = ?auto_157308 ?auto_157309 ) ) ( not ( = ?auto_157308 ?auto_157310 ) ) ( not ( = ?auto_157308 ?auto_157311 ) ) ( not ( = ?auto_157309 ?auto_157310 ) ) ( not ( = ?auto_157309 ?auto_157311 ) ) ( not ( = ?auto_157310 ?auto_157311 ) ) ( ON ?auto_157311 ?auto_157312 ) ( not ( = ?auto_157306 ?auto_157312 ) ) ( not ( = ?auto_157307 ?auto_157312 ) ) ( not ( = ?auto_157308 ?auto_157312 ) ) ( not ( = ?auto_157309 ?auto_157312 ) ) ( not ( = ?auto_157310 ?auto_157312 ) ) ( not ( = ?auto_157311 ?auto_157312 ) ) ( ON ?auto_157310 ?auto_157311 ) ( ON-TABLE ?auto_157313 ) ( ON ?auto_157312 ?auto_157313 ) ( not ( = ?auto_157313 ?auto_157312 ) ) ( not ( = ?auto_157313 ?auto_157311 ) ) ( not ( = ?auto_157313 ?auto_157310 ) ) ( not ( = ?auto_157306 ?auto_157313 ) ) ( not ( = ?auto_157307 ?auto_157313 ) ) ( not ( = ?auto_157308 ?auto_157313 ) ) ( not ( = ?auto_157309 ?auto_157313 ) ) ( ON ?auto_157306 ?auto_157314 ) ( not ( = ?auto_157306 ?auto_157314 ) ) ( not ( = ?auto_157307 ?auto_157314 ) ) ( not ( = ?auto_157308 ?auto_157314 ) ) ( not ( = ?auto_157309 ?auto_157314 ) ) ( not ( = ?auto_157310 ?auto_157314 ) ) ( not ( = ?auto_157311 ?auto_157314 ) ) ( not ( = ?auto_157312 ?auto_157314 ) ) ( not ( = ?auto_157313 ?auto_157314 ) ) ( ON ?auto_157307 ?auto_157306 ) ( ON-TABLE ?auto_157314 ) ( ON ?auto_157308 ?auto_157307 ) ( CLEAR ?auto_157308 ) ( HOLDING ?auto_157309 ) ( CLEAR ?auto_157310 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_157313 ?auto_157312 ?auto_157311 ?auto_157310 ?auto_157309 )
      ( MAKE-6PILE ?auto_157306 ?auto_157307 ?auto_157308 ?auto_157309 ?auto_157310 ?auto_157311 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157315 - BLOCK
      ?auto_157316 - BLOCK
      ?auto_157317 - BLOCK
      ?auto_157318 - BLOCK
      ?auto_157319 - BLOCK
      ?auto_157320 - BLOCK
    )
    :vars
    (
      ?auto_157322 - BLOCK
      ?auto_157323 - BLOCK
      ?auto_157321 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157315 ?auto_157316 ) ) ( not ( = ?auto_157315 ?auto_157317 ) ) ( not ( = ?auto_157315 ?auto_157318 ) ) ( not ( = ?auto_157315 ?auto_157319 ) ) ( not ( = ?auto_157315 ?auto_157320 ) ) ( not ( = ?auto_157316 ?auto_157317 ) ) ( not ( = ?auto_157316 ?auto_157318 ) ) ( not ( = ?auto_157316 ?auto_157319 ) ) ( not ( = ?auto_157316 ?auto_157320 ) ) ( not ( = ?auto_157317 ?auto_157318 ) ) ( not ( = ?auto_157317 ?auto_157319 ) ) ( not ( = ?auto_157317 ?auto_157320 ) ) ( not ( = ?auto_157318 ?auto_157319 ) ) ( not ( = ?auto_157318 ?auto_157320 ) ) ( not ( = ?auto_157319 ?auto_157320 ) ) ( ON ?auto_157320 ?auto_157322 ) ( not ( = ?auto_157315 ?auto_157322 ) ) ( not ( = ?auto_157316 ?auto_157322 ) ) ( not ( = ?auto_157317 ?auto_157322 ) ) ( not ( = ?auto_157318 ?auto_157322 ) ) ( not ( = ?auto_157319 ?auto_157322 ) ) ( not ( = ?auto_157320 ?auto_157322 ) ) ( ON ?auto_157319 ?auto_157320 ) ( ON-TABLE ?auto_157323 ) ( ON ?auto_157322 ?auto_157323 ) ( not ( = ?auto_157323 ?auto_157322 ) ) ( not ( = ?auto_157323 ?auto_157320 ) ) ( not ( = ?auto_157323 ?auto_157319 ) ) ( not ( = ?auto_157315 ?auto_157323 ) ) ( not ( = ?auto_157316 ?auto_157323 ) ) ( not ( = ?auto_157317 ?auto_157323 ) ) ( not ( = ?auto_157318 ?auto_157323 ) ) ( ON ?auto_157315 ?auto_157321 ) ( not ( = ?auto_157315 ?auto_157321 ) ) ( not ( = ?auto_157316 ?auto_157321 ) ) ( not ( = ?auto_157317 ?auto_157321 ) ) ( not ( = ?auto_157318 ?auto_157321 ) ) ( not ( = ?auto_157319 ?auto_157321 ) ) ( not ( = ?auto_157320 ?auto_157321 ) ) ( not ( = ?auto_157322 ?auto_157321 ) ) ( not ( = ?auto_157323 ?auto_157321 ) ) ( ON ?auto_157316 ?auto_157315 ) ( ON-TABLE ?auto_157321 ) ( ON ?auto_157317 ?auto_157316 ) ( CLEAR ?auto_157319 ) ( ON ?auto_157318 ?auto_157317 ) ( CLEAR ?auto_157318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_157321 ?auto_157315 ?auto_157316 ?auto_157317 )
      ( MAKE-6PILE ?auto_157315 ?auto_157316 ?auto_157317 ?auto_157318 ?auto_157319 ?auto_157320 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157324 - BLOCK
      ?auto_157325 - BLOCK
      ?auto_157326 - BLOCK
      ?auto_157327 - BLOCK
      ?auto_157328 - BLOCK
      ?auto_157329 - BLOCK
    )
    :vars
    (
      ?auto_157330 - BLOCK
      ?auto_157331 - BLOCK
      ?auto_157332 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157324 ?auto_157325 ) ) ( not ( = ?auto_157324 ?auto_157326 ) ) ( not ( = ?auto_157324 ?auto_157327 ) ) ( not ( = ?auto_157324 ?auto_157328 ) ) ( not ( = ?auto_157324 ?auto_157329 ) ) ( not ( = ?auto_157325 ?auto_157326 ) ) ( not ( = ?auto_157325 ?auto_157327 ) ) ( not ( = ?auto_157325 ?auto_157328 ) ) ( not ( = ?auto_157325 ?auto_157329 ) ) ( not ( = ?auto_157326 ?auto_157327 ) ) ( not ( = ?auto_157326 ?auto_157328 ) ) ( not ( = ?auto_157326 ?auto_157329 ) ) ( not ( = ?auto_157327 ?auto_157328 ) ) ( not ( = ?auto_157327 ?auto_157329 ) ) ( not ( = ?auto_157328 ?auto_157329 ) ) ( ON ?auto_157329 ?auto_157330 ) ( not ( = ?auto_157324 ?auto_157330 ) ) ( not ( = ?auto_157325 ?auto_157330 ) ) ( not ( = ?auto_157326 ?auto_157330 ) ) ( not ( = ?auto_157327 ?auto_157330 ) ) ( not ( = ?auto_157328 ?auto_157330 ) ) ( not ( = ?auto_157329 ?auto_157330 ) ) ( ON-TABLE ?auto_157331 ) ( ON ?auto_157330 ?auto_157331 ) ( not ( = ?auto_157331 ?auto_157330 ) ) ( not ( = ?auto_157331 ?auto_157329 ) ) ( not ( = ?auto_157331 ?auto_157328 ) ) ( not ( = ?auto_157324 ?auto_157331 ) ) ( not ( = ?auto_157325 ?auto_157331 ) ) ( not ( = ?auto_157326 ?auto_157331 ) ) ( not ( = ?auto_157327 ?auto_157331 ) ) ( ON ?auto_157324 ?auto_157332 ) ( not ( = ?auto_157324 ?auto_157332 ) ) ( not ( = ?auto_157325 ?auto_157332 ) ) ( not ( = ?auto_157326 ?auto_157332 ) ) ( not ( = ?auto_157327 ?auto_157332 ) ) ( not ( = ?auto_157328 ?auto_157332 ) ) ( not ( = ?auto_157329 ?auto_157332 ) ) ( not ( = ?auto_157330 ?auto_157332 ) ) ( not ( = ?auto_157331 ?auto_157332 ) ) ( ON ?auto_157325 ?auto_157324 ) ( ON-TABLE ?auto_157332 ) ( ON ?auto_157326 ?auto_157325 ) ( ON ?auto_157327 ?auto_157326 ) ( CLEAR ?auto_157327 ) ( HOLDING ?auto_157328 ) ( CLEAR ?auto_157329 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_157331 ?auto_157330 ?auto_157329 ?auto_157328 )
      ( MAKE-6PILE ?auto_157324 ?auto_157325 ?auto_157326 ?auto_157327 ?auto_157328 ?auto_157329 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157333 - BLOCK
      ?auto_157334 - BLOCK
      ?auto_157335 - BLOCK
      ?auto_157336 - BLOCK
      ?auto_157337 - BLOCK
      ?auto_157338 - BLOCK
    )
    :vars
    (
      ?auto_157339 - BLOCK
      ?auto_157341 - BLOCK
      ?auto_157340 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157333 ?auto_157334 ) ) ( not ( = ?auto_157333 ?auto_157335 ) ) ( not ( = ?auto_157333 ?auto_157336 ) ) ( not ( = ?auto_157333 ?auto_157337 ) ) ( not ( = ?auto_157333 ?auto_157338 ) ) ( not ( = ?auto_157334 ?auto_157335 ) ) ( not ( = ?auto_157334 ?auto_157336 ) ) ( not ( = ?auto_157334 ?auto_157337 ) ) ( not ( = ?auto_157334 ?auto_157338 ) ) ( not ( = ?auto_157335 ?auto_157336 ) ) ( not ( = ?auto_157335 ?auto_157337 ) ) ( not ( = ?auto_157335 ?auto_157338 ) ) ( not ( = ?auto_157336 ?auto_157337 ) ) ( not ( = ?auto_157336 ?auto_157338 ) ) ( not ( = ?auto_157337 ?auto_157338 ) ) ( ON ?auto_157338 ?auto_157339 ) ( not ( = ?auto_157333 ?auto_157339 ) ) ( not ( = ?auto_157334 ?auto_157339 ) ) ( not ( = ?auto_157335 ?auto_157339 ) ) ( not ( = ?auto_157336 ?auto_157339 ) ) ( not ( = ?auto_157337 ?auto_157339 ) ) ( not ( = ?auto_157338 ?auto_157339 ) ) ( ON-TABLE ?auto_157341 ) ( ON ?auto_157339 ?auto_157341 ) ( not ( = ?auto_157341 ?auto_157339 ) ) ( not ( = ?auto_157341 ?auto_157338 ) ) ( not ( = ?auto_157341 ?auto_157337 ) ) ( not ( = ?auto_157333 ?auto_157341 ) ) ( not ( = ?auto_157334 ?auto_157341 ) ) ( not ( = ?auto_157335 ?auto_157341 ) ) ( not ( = ?auto_157336 ?auto_157341 ) ) ( ON ?auto_157333 ?auto_157340 ) ( not ( = ?auto_157333 ?auto_157340 ) ) ( not ( = ?auto_157334 ?auto_157340 ) ) ( not ( = ?auto_157335 ?auto_157340 ) ) ( not ( = ?auto_157336 ?auto_157340 ) ) ( not ( = ?auto_157337 ?auto_157340 ) ) ( not ( = ?auto_157338 ?auto_157340 ) ) ( not ( = ?auto_157339 ?auto_157340 ) ) ( not ( = ?auto_157341 ?auto_157340 ) ) ( ON ?auto_157334 ?auto_157333 ) ( ON-TABLE ?auto_157340 ) ( ON ?auto_157335 ?auto_157334 ) ( ON ?auto_157336 ?auto_157335 ) ( CLEAR ?auto_157338 ) ( ON ?auto_157337 ?auto_157336 ) ( CLEAR ?auto_157337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_157340 ?auto_157333 ?auto_157334 ?auto_157335 ?auto_157336 )
      ( MAKE-6PILE ?auto_157333 ?auto_157334 ?auto_157335 ?auto_157336 ?auto_157337 ?auto_157338 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157342 - BLOCK
      ?auto_157343 - BLOCK
      ?auto_157344 - BLOCK
      ?auto_157345 - BLOCK
      ?auto_157346 - BLOCK
      ?auto_157347 - BLOCK
    )
    :vars
    (
      ?auto_157348 - BLOCK
      ?auto_157349 - BLOCK
      ?auto_157350 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157342 ?auto_157343 ) ) ( not ( = ?auto_157342 ?auto_157344 ) ) ( not ( = ?auto_157342 ?auto_157345 ) ) ( not ( = ?auto_157342 ?auto_157346 ) ) ( not ( = ?auto_157342 ?auto_157347 ) ) ( not ( = ?auto_157343 ?auto_157344 ) ) ( not ( = ?auto_157343 ?auto_157345 ) ) ( not ( = ?auto_157343 ?auto_157346 ) ) ( not ( = ?auto_157343 ?auto_157347 ) ) ( not ( = ?auto_157344 ?auto_157345 ) ) ( not ( = ?auto_157344 ?auto_157346 ) ) ( not ( = ?auto_157344 ?auto_157347 ) ) ( not ( = ?auto_157345 ?auto_157346 ) ) ( not ( = ?auto_157345 ?auto_157347 ) ) ( not ( = ?auto_157346 ?auto_157347 ) ) ( not ( = ?auto_157342 ?auto_157348 ) ) ( not ( = ?auto_157343 ?auto_157348 ) ) ( not ( = ?auto_157344 ?auto_157348 ) ) ( not ( = ?auto_157345 ?auto_157348 ) ) ( not ( = ?auto_157346 ?auto_157348 ) ) ( not ( = ?auto_157347 ?auto_157348 ) ) ( ON-TABLE ?auto_157349 ) ( ON ?auto_157348 ?auto_157349 ) ( not ( = ?auto_157349 ?auto_157348 ) ) ( not ( = ?auto_157349 ?auto_157347 ) ) ( not ( = ?auto_157349 ?auto_157346 ) ) ( not ( = ?auto_157342 ?auto_157349 ) ) ( not ( = ?auto_157343 ?auto_157349 ) ) ( not ( = ?auto_157344 ?auto_157349 ) ) ( not ( = ?auto_157345 ?auto_157349 ) ) ( ON ?auto_157342 ?auto_157350 ) ( not ( = ?auto_157342 ?auto_157350 ) ) ( not ( = ?auto_157343 ?auto_157350 ) ) ( not ( = ?auto_157344 ?auto_157350 ) ) ( not ( = ?auto_157345 ?auto_157350 ) ) ( not ( = ?auto_157346 ?auto_157350 ) ) ( not ( = ?auto_157347 ?auto_157350 ) ) ( not ( = ?auto_157348 ?auto_157350 ) ) ( not ( = ?auto_157349 ?auto_157350 ) ) ( ON ?auto_157343 ?auto_157342 ) ( ON-TABLE ?auto_157350 ) ( ON ?auto_157344 ?auto_157343 ) ( ON ?auto_157345 ?auto_157344 ) ( ON ?auto_157346 ?auto_157345 ) ( CLEAR ?auto_157346 ) ( HOLDING ?auto_157347 ) ( CLEAR ?auto_157348 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_157349 ?auto_157348 ?auto_157347 )
      ( MAKE-6PILE ?auto_157342 ?auto_157343 ?auto_157344 ?auto_157345 ?auto_157346 ?auto_157347 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157351 - BLOCK
      ?auto_157352 - BLOCK
      ?auto_157353 - BLOCK
      ?auto_157354 - BLOCK
      ?auto_157355 - BLOCK
      ?auto_157356 - BLOCK
    )
    :vars
    (
      ?auto_157359 - BLOCK
      ?auto_157357 - BLOCK
      ?auto_157358 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157351 ?auto_157352 ) ) ( not ( = ?auto_157351 ?auto_157353 ) ) ( not ( = ?auto_157351 ?auto_157354 ) ) ( not ( = ?auto_157351 ?auto_157355 ) ) ( not ( = ?auto_157351 ?auto_157356 ) ) ( not ( = ?auto_157352 ?auto_157353 ) ) ( not ( = ?auto_157352 ?auto_157354 ) ) ( not ( = ?auto_157352 ?auto_157355 ) ) ( not ( = ?auto_157352 ?auto_157356 ) ) ( not ( = ?auto_157353 ?auto_157354 ) ) ( not ( = ?auto_157353 ?auto_157355 ) ) ( not ( = ?auto_157353 ?auto_157356 ) ) ( not ( = ?auto_157354 ?auto_157355 ) ) ( not ( = ?auto_157354 ?auto_157356 ) ) ( not ( = ?auto_157355 ?auto_157356 ) ) ( not ( = ?auto_157351 ?auto_157359 ) ) ( not ( = ?auto_157352 ?auto_157359 ) ) ( not ( = ?auto_157353 ?auto_157359 ) ) ( not ( = ?auto_157354 ?auto_157359 ) ) ( not ( = ?auto_157355 ?auto_157359 ) ) ( not ( = ?auto_157356 ?auto_157359 ) ) ( ON-TABLE ?auto_157357 ) ( ON ?auto_157359 ?auto_157357 ) ( not ( = ?auto_157357 ?auto_157359 ) ) ( not ( = ?auto_157357 ?auto_157356 ) ) ( not ( = ?auto_157357 ?auto_157355 ) ) ( not ( = ?auto_157351 ?auto_157357 ) ) ( not ( = ?auto_157352 ?auto_157357 ) ) ( not ( = ?auto_157353 ?auto_157357 ) ) ( not ( = ?auto_157354 ?auto_157357 ) ) ( ON ?auto_157351 ?auto_157358 ) ( not ( = ?auto_157351 ?auto_157358 ) ) ( not ( = ?auto_157352 ?auto_157358 ) ) ( not ( = ?auto_157353 ?auto_157358 ) ) ( not ( = ?auto_157354 ?auto_157358 ) ) ( not ( = ?auto_157355 ?auto_157358 ) ) ( not ( = ?auto_157356 ?auto_157358 ) ) ( not ( = ?auto_157359 ?auto_157358 ) ) ( not ( = ?auto_157357 ?auto_157358 ) ) ( ON ?auto_157352 ?auto_157351 ) ( ON-TABLE ?auto_157358 ) ( ON ?auto_157353 ?auto_157352 ) ( ON ?auto_157354 ?auto_157353 ) ( ON ?auto_157355 ?auto_157354 ) ( CLEAR ?auto_157359 ) ( ON ?auto_157356 ?auto_157355 ) ( CLEAR ?auto_157356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_157358 ?auto_157351 ?auto_157352 ?auto_157353 ?auto_157354 ?auto_157355 )
      ( MAKE-6PILE ?auto_157351 ?auto_157352 ?auto_157353 ?auto_157354 ?auto_157355 ?auto_157356 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157360 - BLOCK
      ?auto_157361 - BLOCK
      ?auto_157362 - BLOCK
      ?auto_157363 - BLOCK
      ?auto_157364 - BLOCK
      ?auto_157365 - BLOCK
    )
    :vars
    (
      ?auto_157368 - BLOCK
      ?auto_157367 - BLOCK
      ?auto_157366 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157360 ?auto_157361 ) ) ( not ( = ?auto_157360 ?auto_157362 ) ) ( not ( = ?auto_157360 ?auto_157363 ) ) ( not ( = ?auto_157360 ?auto_157364 ) ) ( not ( = ?auto_157360 ?auto_157365 ) ) ( not ( = ?auto_157361 ?auto_157362 ) ) ( not ( = ?auto_157361 ?auto_157363 ) ) ( not ( = ?auto_157361 ?auto_157364 ) ) ( not ( = ?auto_157361 ?auto_157365 ) ) ( not ( = ?auto_157362 ?auto_157363 ) ) ( not ( = ?auto_157362 ?auto_157364 ) ) ( not ( = ?auto_157362 ?auto_157365 ) ) ( not ( = ?auto_157363 ?auto_157364 ) ) ( not ( = ?auto_157363 ?auto_157365 ) ) ( not ( = ?auto_157364 ?auto_157365 ) ) ( not ( = ?auto_157360 ?auto_157368 ) ) ( not ( = ?auto_157361 ?auto_157368 ) ) ( not ( = ?auto_157362 ?auto_157368 ) ) ( not ( = ?auto_157363 ?auto_157368 ) ) ( not ( = ?auto_157364 ?auto_157368 ) ) ( not ( = ?auto_157365 ?auto_157368 ) ) ( ON-TABLE ?auto_157367 ) ( not ( = ?auto_157367 ?auto_157368 ) ) ( not ( = ?auto_157367 ?auto_157365 ) ) ( not ( = ?auto_157367 ?auto_157364 ) ) ( not ( = ?auto_157360 ?auto_157367 ) ) ( not ( = ?auto_157361 ?auto_157367 ) ) ( not ( = ?auto_157362 ?auto_157367 ) ) ( not ( = ?auto_157363 ?auto_157367 ) ) ( ON ?auto_157360 ?auto_157366 ) ( not ( = ?auto_157360 ?auto_157366 ) ) ( not ( = ?auto_157361 ?auto_157366 ) ) ( not ( = ?auto_157362 ?auto_157366 ) ) ( not ( = ?auto_157363 ?auto_157366 ) ) ( not ( = ?auto_157364 ?auto_157366 ) ) ( not ( = ?auto_157365 ?auto_157366 ) ) ( not ( = ?auto_157368 ?auto_157366 ) ) ( not ( = ?auto_157367 ?auto_157366 ) ) ( ON ?auto_157361 ?auto_157360 ) ( ON-TABLE ?auto_157366 ) ( ON ?auto_157362 ?auto_157361 ) ( ON ?auto_157363 ?auto_157362 ) ( ON ?auto_157364 ?auto_157363 ) ( ON ?auto_157365 ?auto_157364 ) ( CLEAR ?auto_157365 ) ( HOLDING ?auto_157368 ) ( CLEAR ?auto_157367 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_157367 ?auto_157368 )
      ( MAKE-6PILE ?auto_157360 ?auto_157361 ?auto_157362 ?auto_157363 ?auto_157364 ?auto_157365 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157369 - BLOCK
      ?auto_157370 - BLOCK
      ?auto_157371 - BLOCK
      ?auto_157372 - BLOCK
      ?auto_157373 - BLOCK
      ?auto_157374 - BLOCK
    )
    :vars
    (
      ?auto_157375 - BLOCK
      ?auto_157376 - BLOCK
      ?auto_157377 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157369 ?auto_157370 ) ) ( not ( = ?auto_157369 ?auto_157371 ) ) ( not ( = ?auto_157369 ?auto_157372 ) ) ( not ( = ?auto_157369 ?auto_157373 ) ) ( not ( = ?auto_157369 ?auto_157374 ) ) ( not ( = ?auto_157370 ?auto_157371 ) ) ( not ( = ?auto_157370 ?auto_157372 ) ) ( not ( = ?auto_157370 ?auto_157373 ) ) ( not ( = ?auto_157370 ?auto_157374 ) ) ( not ( = ?auto_157371 ?auto_157372 ) ) ( not ( = ?auto_157371 ?auto_157373 ) ) ( not ( = ?auto_157371 ?auto_157374 ) ) ( not ( = ?auto_157372 ?auto_157373 ) ) ( not ( = ?auto_157372 ?auto_157374 ) ) ( not ( = ?auto_157373 ?auto_157374 ) ) ( not ( = ?auto_157369 ?auto_157375 ) ) ( not ( = ?auto_157370 ?auto_157375 ) ) ( not ( = ?auto_157371 ?auto_157375 ) ) ( not ( = ?auto_157372 ?auto_157375 ) ) ( not ( = ?auto_157373 ?auto_157375 ) ) ( not ( = ?auto_157374 ?auto_157375 ) ) ( ON-TABLE ?auto_157376 ) ( not ( = ?auto_157376 ?auto_157375 ) ) ( not ( = ?auto_157376 ?auto_157374 ) ) ( not ( = ?auto_157376 ?auto_157373 ) ) ( not ( = ?auto_157369 ?auto_157376 ) ) ( not ( = ?auto_157370 ?auto_157376 ) ) ( not ( = ?auto_157371 ?auto_157376 ) ) ( not ( = ?auto_157372 ?auto_157376 ) ) ( ON ?auto_157369 ?auto_157377 ) ( not ( = ?auto_157369 ?auto_157377 ) ) ( not ( = ?auto_157370 ?auto_157377 ) ) ( not ( = ?auto_157371 ?auto_157377 ) ) ( not ( = ?auto_157372 ?auto_157377 ) ) ( not ( = ?auto_157373 ?auto_157377 ) ) ( not ( = ?auto_157374 ?auto_157377 ) ) ( not ( = ?auto_157375 ?auto_157377 ) ) ( not ( = ?auto_157376 ?auto_157377 ) ) ( ON ?auto_157370 ?auto_157369 ) ( ON-TABLE ?auto_157377 ) ( ON ?auto_157371 ?auto_157370 ) ( ON ?auto_157372 ?auto_157371 ) ( ON ?auto_157373 ?auto_157372 ) ( ON ?auto_157374 ?auto_157373 ) ( CLEAR ?auto_157376 ) ( ON ?auto_157375 ?auto_157374 ) ( CLEAR ?auto_157375 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_157377 ?auto_157369 ?auto_157370 ?auto_157371 ?auto_157372 ?auto_157373 ?auto_157374 )
      ( MAKE-6PILE ?auto_157369 ?auto_157370 ?auto_157371 ?auto_157372 ?auto_157373 ?auto_157374 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157378 - BLOCK
      ?auto_157379 - BLOCK
      ?auto_157380 - BLOCK
      ?auto_157381 - BLOCK
      ?auto_157382 - BLOCK
      ?auto_157383 - BLOCK
    )
    :vars
    (
      ?auto_157386 - BLOCK
      ?auto_157385 - BLOCK
      ?auto_157384 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157378 ?auto_157379 ) ) ( not ( = ?auto_157378 ?auto_157380 ) ) ( not ( = ?auto_157378 ?auto_157381 ) ) ( not ( = ?auto_157378 ?auto_157382 ) ) ( not ( = ?auto_157378 ?auto_157383 ) ) ( not ( = ?auto_157379 ?auto_157380 ) ) ( not ( = ?auto_157379 ?auto_157381 ) ) ( not ( = ?auto_157379 ?auto_157382 ) ) ( not ( = ?auto_157379 ?auto_157383 ) ) ( not ( = ?auto_157380 ?auto_157381 ) ) ( not ( = ?auto_157380 ?auto_157382 ) ) ( not ( = ?auto_157380 ?auto_157383 ) ) ( not ( = ?auto_157381 ?auto_157382 ) ) ( not ( = ?auto_157381 ?auto_157383 ) ) ( not ( = ?auto_157382 ?auto_157383 ) ) ( not ( = ?auto_157378 ?auto_157386 ) ) ( not ( = ?auto_157379 ?auto_157386 ) ) ( not ( = ?auto_157380 ?auto_157386 ) ) ( not ( = ?auto_157381 ?auto_157386 ) ) ( not ( = ?auto_157382 ?auto_157386 ) ) ( not ( = ?auto_157383 ?auto_157386 ) ) ( not ( = ?auto_157385 ?auto_157386 ) ) ( not ( = ?auto_157385 ?auto_157383 ) ) ( not ( = ?auto_157385 ?auto_157382 ) ) ( not ( = ?auto_157378 ?auto_157385 ) ) ( not ( = ?auto_157379 ?auto_157385 ) ) ( not ( = ?auto_157380 ?auto_157385 ) ) ( not ( = ?auto_157381 ?auto_157385 ) ) ( ON ?auto_157378 ?auto_157384 ) ( not ( = ?auto_157378 ?auto_157384 ) ) ( not ( = ?auto_157379 ?auto_157384 ) ) ( not ( = ?auto_157380 ?auto_157384 ) ) ( not ( = ?auto_157381 ?auto_157384 ) ) ( not ( = ?auto_157382 ?auto_157384 ) ) ( not ( = ?auto_157383 ?auto_157384 ) ) ( not ( = ?auto_157386 ?auto_157384 ) ) ( not ( = ?auto_157385 ?auto_157384 ) ) ( ON ?auto_157379 ?auto_157378 ) ( ON-TABLE ?auto_157384 ) ( ON ?auto_157380 ?auto_157379 ) ( ON ?auto_157381 ?auto_157380 ) ( ON ?auto_157382 ?auto_157381 ) ( ON ?auto_157383 ?auto_157382 ) ( ON ?auto_157386 ?auto_157383 ) ( CLEAR ?auto_157386 ) ( HOLDING ?auto_157385 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_157385 )
      ( MAKE-6PILE ?auto_157378 ?auto_157379 ?auto_157380 ?auto_157381 ?auto_157382 ?auto_157383 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157387 - BLOCK
      ?auto_157388 - BLOCK
      ?auto_157389 - BLOCK
      ?auto_157390 - BLOCK
      ?auto_157391 - BLOCK
      ?auto_157392 - BLOCK
    )
    :vars
    (
      ?auto_157394 - BLOCK
      ?auto_157395 - BLOCK
      ?auto_157393 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157387 ?auto_157388 ) ) ( not ( = ?auto_157387 ?auto_157389 ) ) ( not ( = ?auto_157387 ?auto_157390 ) ) ( not ( = ?auto_157387 ?auto_157391 ) ) ( not ( = ?auto_157387 ?auto_157392 ) ) ( not ( = ?auto_157388 ?auto_157389 ) ) ( not ( = ?auto_157388 ?auto_157390 ) ) ( not ( = ?auto_157388 ?auto_157391 ) ) ( not ( = ?auto_157388 ?auto_157392 ) ) ( not ( = ?auto_157389 ?auto_157390 ) ) ( not ( = ?auto_157389 ?auto_157391 ) ) ( not ( = ?auto_157389 ?auto_157392 ) ) ( not ( = ?auto_157390 ?auto_157391 ) ) ( not ( = ?auto_157390 ?auto_157392 ) ) ( not ( = ?auto_157391 ?auto_157392 ) ) ( not ( = ?auto_157387 ?auto_157394 ) ) ( not ( = ?auto_157388 ?auto_157394 ) ) ( not ( = ?auto_157389 ?auto_157394 ) ) ( not ( = ?auto_157390 ?auto_157394 ) ) ( not ( = ?auto_157391 ?auto_157394 ) ) ( not ( = ?auto_157392 ?auto_157394 ) ) ( not ( = ?auto_157395 ?auto_157394 ) ) ( not ( = ?auto_157395 ?auto_157392 ) ) ( not ( = ?auto_157395 ?auto_157391 ) ) ( not ( = ?auto_157387 ?auto_157395 ) ) ( not ( = ?auto_157388 ?auto_157395 ) ) ( not ( = ?auto_157389 ?auto_157395 ) ) ( not ( = ?auto_157390 ?auto_157395 ) ) ( ON ?auto_157387 ?auto_157393 ) ( not ( = ?auto_157387 ?auto_157393 ) ) ( not ( = ?auto_157388 ?auto_157393 ) ) ( not ( = ?auto_157389 ?auto_157393 ) ) ( not ( = ?auto_157390 ?auto_157393 ) ) ( not ( = ?auto_157391 ?auto_157393 ) ) ( not ( = ?auto_157392 ?auto_157393 ) ) ( not ( = ?auto_157394 ?auto_157393 ) ) ( not ( = ?auto_157395 ?auto_157393 ) ) ( ON ?auto_157388 ?auto_157387 ) ( ON-TABLE ?auto_157393 ) ( ON ?auto_157389 ?auto_157388 ) ( ON ?auto_157390 ?auto_157389 ) ( ON ?auto_157391 ?auto_157390 ) ( ON ?auto_157392 ?auto_157391 ) ( ON ?auto_157394 ?auto_157392 ) ( ON ?auto_157395 ?auto_157394 ) ( CLEAR ?auto_157395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_157393 ?auto_157387 ?auto_157388 ?auto_157389 ?auto_157390 ?auto_157391 ?auto_157392 ?auto_157394 )
      ( MAKE-6PILE ?auto_157387 ?auto_157388 ?auto_157389 ?auto_157390 ?auto_157391 ?auto_157392 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_157397 - BLOCK
    )
    :vars
    (
      ?auto_157398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157398 ?auto_157397 ) ( CLEAR ?auto_157398 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_157397 ) ( not ( = ?auto_157397 ?auto_157398 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_157398 ?auto_157397 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_157399 - BLOCK
    )
    :vars
    (
      ?auto_157400 - BLOCK
      ?auto_157401 - BLOCK
      ?auto_157402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157400 ?auto_157399 ) ( CLEAR ?auto_157400 ) ( ON-TABLE ?auto_157399 ) ( not ( = ?auto_157399 ?auto_157400 ) ) ( HOLDING ?auto_157401 ) ( CLEAR ?auto_157402 ) ( not ( = ?auto_157399 ?auto_157401 ) ) ( not ( = ?auto_157399 ?auto_157402 ) ) ( not ( = ?auto_157400 ?auto_157401 ) ) ( not ( = ?auto_157400 ?auto_157402 ) ) ( not ( = ?auto_157401 ?auto_157402 ) ) )
    :subtasks
    ( ( !STACK ?auto_157401 ?auto_157402 )
      ( MAKE-1PILE ?auto_157399 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_157403 - BLOCK
    )
    :vars
    (
      ?auto_157406 - BLOCK
      ?auto_157404 - BLOCK
      ?auto_157405 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157406 ?auto_157403 ) ( ON-TABLE ?auto_157403 ) ( not ( = ?auto_157403 ?auto_157406 ) ) ( CLEAR ?auto_157404 ) ( not ( = ?auto_157403 ?auto_157405 ) ) ( not ( = ?auto_157403 ?auto_157404 ) ) ( not ( = ?auto_157406 ?auto_157405 ) ) ( not ( = ?auto_157406 ?auto_157404 ) ) ( not ( = ?auto_157405 ?auto_157404 ) ) ( ON ?auto_157405 ?auto_157406 ) ( CLEAR ?auto_157405 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_157403 ?auto_157406 )
      ( MAKE-1PILE ?auto_157403 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_157407 - BLOCK
    )
    :vars
    (
      ?auto_157410 - BLOCK
      ?auto_157408 - BLOCK
      ?auto_157409 - BLOCK
      ?auto_157412 - BLOCK
      ?auto_157413 - BLOCK
      ?auto_157414 - BLOCK
      ?auto_157411 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157410 ?auto_157407 ) ( ON-TABLE ?auto_157407 ) ( not ( = ?auto_157407 ?auto_157410 ) ) ( not ( = ?auto_157407 ?auto_157408 ) ) ( not ( = ?auto_157407 ?auto_157409 ) ) ( not ( = ?auto_157410 ?auto_157408 ) ) ( not ( = ?auto_157410 ?auto_157409 ) ) ( not ( = ?auto_157408 ?auto_157409 ) ) ( ON ?auto_157408 ?auto_157410 ) ( CLEAR ?auto_157408 ) ( HOLDING ?auto_157409 ) ( CLEAR ?auto_157412 ) ( ON-TABLE ?auto_157413 ) ( ON ?auto_157414 ?auto_157413 ) ( ON ?auto_157411 ?auto_157414 ) ( ON ?auto_157412 ?auto_157411 ) ( not ( = ?auto_157413 ?auto_157414 ) ) ( not ( = ?auto_157413 ?auto_157411 ) ) ( not ( = ?auto_157413 ?auto_157412 ) ) ( not ( = ?auto_157413 ?auto_157409 ) ) ( not ( = ?auto_157414 ?auto_157411 ) ) ( not ( = ?auto_157414 ?auto_157412 ) ) ( not ( = ?auto_157414 ?auto_157409 ) ) ( not ( = ?auto_157411 ?auto_157412 ) ) ( not ( = ?auto_157411 ?auto_157409 ) ) ( not ( = ?auto_157412 ?auto_157409 ) ) ( not ( = ?auto_157407 ?auto_157412 ) ) ( not ( = ?auto_157407 ?auto_157413 ) ) ( not ( = ?auto_157407 ?auto_157414 ) ) ( not ( = ?auto_157407 ?auto_157411 ) ) ( not ( = ?auto_157410 ?auto_157412 ) ) ( not ( = ?auto_157410 ?auto_157413 ) ) ( not ( = ?auto_157410 ?auto_157414 ) ) ( not ( = ?auto_157410 ?auto_157411 ) ) ( not ( = ?auto_157408 ?auto_157412 ) ) ( not ( = ?auto_157408 ?auto_157413 ) ) ( not ( = ?auto_157408 ?auto_157414 ) ) ( not ( = ?auto_157408 ?auto_157411 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_157413 ?auto_157414 ?auto_157411 ?auto_157412 ?auto_157409 )
      ( MAKE-1PILE ?auto_157407 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_157415 - BLOCK
    )
    :vars
    (
      ?auto_157418 - BLOCK
      ?auto_157421 - BLOCK
      ?auto_157419 - BLOCK
      ?auto_157416 - BLOCK
      ?auto_157420 - BLOCK
      ?auto_157422 - BLOCK
      ?auto_157417 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157418 ?auto_157415 ) ( ON-TABLE ?auto_157415 ) ( not ( = ?auto_157415 ?auto_157418 ) ) ( not ( = ?auto_157415 ?auto_157421 ) ) ( not ( = ?auto_157415 ?auto_157419 ) ) ( not ( = ?auto_157418 ?auto_157421 ) ) ( not ( = ?auto_157418 ?auto_157419 ) ) ( not ( = ?auto_157421 ?auto_157419 ) ) ( ON ?auto_157421 ?auto_157418 ) ( CLEAR ?auto_157416 ) ( ON-TABLE ?auto_157420 ) ( ON ?auto_157422 ?auto_157420 ) ( ON ?auto_157417 ?auto_157422 ) ( ON ?auto_157416 ?auto_157417 ) ( not ( = ?auto_157420 ?auto_157422 ) ) ( not ( = ?auto_157420 ?auto_157417 ) ) ( not ( = ?auto_157420 ?auto_157416 ) ) ( not ( = ?auto_157420 ?auto_157419 ) ) ( not ( = ?auto_157422 ?auto_157417 ) ) ( not ( = ?auto_157422 ?auto_157416 ) ) ( not ( = ?auto_157422 ?auto_157419 ) ) ( not ( = ?auto_157417 ?auto_157416 ) ) ( not ( = ?auto_157417 ?auto_157419 ) ) ( not ( = ?auto_157416 ?auto_157419 ) ) ( not ( = ?auto_157415 ?auto_157416 ) ) ( not ( = ?auto_157415 ?auto_157420 ) ) ( not ( = ?auto_157415 ?auto_157422 ) ) ( not ( = ?auto_157415 ?auto_157417 ) ) ( not ( = ?auto_157418 ?auto_157416 ) ) ( not ( = ?auto_157418 ?auto_157420 ) ) ( not ( = ?auto_157418 ?auto_157422 ) ) ( not ( = ?auto_157418 ?auto_157417 ) ) ( not ( = ?auto_157421 ?auto_157416 ) ) ( not ( = ?auto_157421 ?auto_157420 ) ) ( not ( = ?auto_157421 ?auto_157422 ) ) ( not ( = ?auto_157421 ?auto_157417 ) ) ( ON ?auto_157419 ?auto_157421 ) ( CLEAR ?auto_157419 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_157415 ?auto_157418 ?auto_157421 )
      ( MAKE-1PILE ?auto_157415 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_157423 - BLOCK
    )
    :vars
    (
      ?auto_157425 - BLOCK
      ?auto_157427 - BLOCK
      ?auto_157424 - BLOCK
      ?auto_157430 - BLOCK
      ?auto_157428 - BLOCK
      ?auto_157426 - BLOCK
      ?auto_157429 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157425 ?auto_157423 ) ( ON-TABLE ?auto_157423 ) ( not ( = ?auto_157423 ?auto_157425 ) ) ( not ( = ?auto_157423 ?auto_157427 ) ) ( not ( = ?auto_157423 ?auto_157424 ) ) ( not ( = ?auto_157425 ?auto_157427 ) ) ( not ( = ?auto_157425 ?auto_157424 ) ) ( not ( = ?auto_157427 ?auto_157424 ) ) ( ON ?auto_157427 ?auto_157425 ) ( ON-TABLE ?auto_157430 ) ( ON ?auto_157428 ?auto_157430 ) ( ON ?auto_157426 ?auto_157428 ) ( not ( = ?auto_157430 ?auto_157428 ) ) ( not ( = ?auto_157430 ?auto_157426 ) ) ( not ( = ?auto_157430 ?auto_157429 ) ) ( not ( = ?auto_157430 ?auto_157424 ) ) ( not ( = ?auto_157428 ?auto_157426 ) ) ( not ( = ?auto_157428 ?auto_157429 ) ) ( not ( = ?auto_157428 ?auto_157424 ) ) ( not ( = ?auto_157426 ?auto_157429 ) ) ( not ( = ?auto_157426 ?auto_157424 ) ) ( not ( = ?auto_157429 ?auto_157424 ) ) ( not ( = ?auto_157423 ?auto_157429 ) ) ( not ( = ?auto_157423 ?auto_157430 ) ) ( not ( = ?auto_157423 ?auto_157428 ) ) ( not ( = ?auto_157423 ?auto_157426 ) ) ( not ( = ?auto_157425 ?auto_157429 ) ) ( not ( = ?auto_157425 ?auto_157430 ) ) ( not ( = ?auto_157425 ?auto_157428 ) ) ( not ( = ?auto_157425 ?auto_157426 ) ) ( not ( = ?auto_157427 ?auto_157429 ) ) ( not ( = ?auto_157427 ?auto_157430 ) ) ( not ( = ?auto_157427 ?auto_157428 ) ) ( not ( = ?auto_157427 ?auto_157426 ) ) ( ON ?auto_157424 ?auto_157427 ) ( CLEAR ?auto_157424 ) ( HOLDING ?auto_157429 ) ( CLEAR ?auto_157426 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_157430 ?auto_157428 ?auto_157426 ?auto_157429 )
      ( MAKE-1PILE ?auto_157423 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_157431 - BLOCK
    )
    :vars
    (
      ?auto_157438 - BLOCK
      ?auto_157436 - BLOCK
      ?auto_157437 - BLOCK
      ?auto_157433 - BLOCK
      ?auto_157432 - BLOCK
      ?auto_157435 - BLOCK
      ?auto_157434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157438 ?auto_157431 ) ( ON-TABLE ?auto_157431 ) ( not ( = ?auto_157431 ?auto_157438 ) ) ( not ( = ?auto_157431 ?auto_157436 ) ) ( not ( = ?auto_157431 ?auto_157437 ) ) ( not ( = ?auto_157438 ?auto_157436 ) ) ( not ( = ?auto_157438 ?auto_157437 ) ) ( not ( = ?auto_157436 ?auto_157437 ) ) ( ON ?auto_157436 ?auto_157438 ) ( ON-TABLE ?auto_157433 ) ( ON ?auto_157432 ?auto_157433 ) ( ON ?auto_157435 ?auto_157432 ) ( not ( = ?auto_157433 ?auto_157432 ) ) ( not ( = ?auto_157433 ?auto_157435 ) ) ( not ( = ?auto_157433 ?auto_157434 ) ) ( not ( = ?auto_157433 ?auto_157437 ) ) ( not ( = ?auto_157432 ?auto_157435 ) ) ( not ( = ?auto_157432 ?auto_157434 ) ) ( not ( = ?auto_157432 ?auto_157437 ) ) ( not ( = ?auto_157435 ?auto_157434 ) ) ( not ( = ?auto_157435 ?auto_157437 ) ) ( not ( = ?auto_157434 ?auto_157437 ) ) ( not ( = ?auto_157431 ?auto_157434 ) ) ( not ( = ?auto_157431 ?auto_157433 ) ) ( not ( = ?auto_157431 ?auto_157432 ) ) ( not ( = ?auto_157431 ?auto_157435 ) ) ( not ( = ?auto_157438 ?auto_157434 ) ) ( not ( = ?auto_157438 ?auto_157433 ) ) ( not ( = ?auto_157438 ?auto_157432 ) ) ( not ( = ?auto_157438 ?auto_157435 ) ) ( not ( = ?auto_157436 ?auto_157434 ) ) ( not ( = ?auto_157436 ?auto_157433 ) ) ( not ( = ?auto_157436 ?auto_157432 ) ) ( not ( = ?auto_157436 ?auto_157435 ) ) ( ON ?auto_157437 ?auto_157436 ) ( CLEAR ?auto_157435 ) ( ON ?auto_157434 ?auto_157437 ) ( CLEAR ?auto_157434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_157431 ?auto_157438 ?auto_157436 ?auto_157437 )
      ( MAKE-1PILE ?auto_157431 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_157439 - BLOCK
    )
    :vars
    (
      ?auto_157442 - BLOCK
      ?auto_157446 - BLOCK
      ?auto_157441 - BLOCK
      ?auto_157440 - BLOCK
      ?auto_157445 - BLOCK
      ?auto_157444 - BLOCK
      ?auto_157443 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157442 ?auto_157439 ) ( ON-TABLE ?auto_157439 ) ( not ( = ?auto_157439 ?auto_157442 ) ) ( not ( = ?auto_157439 ?auto_157446 ) ) ( not ( = ?auto_157439 ?auto_157441 ) ) ( not ( = ?auto_157442 ?auto_157446 ) ) ( not ( = ?auto_157442 ?auto_157441 ) ) ( not ( = ?auto_157446 ?auto_157441 ) ) ( ON ?auto_157446 ?auto_157442 ) ( ON-TABLE ?auto_157440 ) ( ON ?auto_157445 ?auto_157440 ) ( not ( = ?auto_157440 ?auto_157445 ) ) ( not ( = ?auto_157440 ?auto_157444 ) ) ( not ( = ?auto_157440 ?auto_157443 ) ) ( not ( = ?auto_157440 ?auto_157441 ) ) ( not ( = ?auto_157445 ?auto_157444 ) ) ( not ( = ?auto_157445 ?auto_157443 ) ) ( not ( = ?auto_157445 ?auto_157441 ) ) ( not ( = ?auto_157444 ?auto_157443 ) ) ( not ( = ?auto_157444 ?auto_157441 ) ) ( not ( = ?auto_157443 ?auto_157441 ) ) ( not ( = ?auto_157439 ?auto_157443 ) ) ( not ( = ?auto_157439 ?auto_157440 ) ) ( not ( = ?auto_157439 ?auto_157445 ) ) ( not ( = ?auto_157439 ?auto_157444 ) ) ( not ( = ?auto_157442 ?auto_157443 ) ) ( not ( = ?auto_157442 ?auto_157440 ) ) ( not ( = ?auto_157442 ?auto_157445 ) ) ( not ( = ?auto_157442 ?auto_157444 ) ) ( not ( = ?auto_157446 ?auto_157443 ) ) ( not ( = ?auto_157446 ?auto_157440 ) ) ( not ( = ?auto_157446 ?auto_157445 ) ) ( not ( = ?auto_157446 ?auto_157444 ) ) ( ON ?auto_157441 ?auto_157446 ) ( ON ?auto_157443 ?auto_157441 ) ( CLEAR ?auto_157443 ) ( HOLDING ?auto_157444 ) ( CLEAR ?auto_157445 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_157440 ?auto_157445 ?auto_157444 )
      ( MAKE-1PILE ?auto_157439 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_157447 - BLOCK
    )
    :vars
    (
      ?auto_157452 - BLOCK
      ?auto_157450 - BLOCK
      ?auto_157451 - BLOCK
      ?auto_157453 - BLOCK
      ?auto_157449 - BLOCK
      ?auto_157454 - BLOCK
      ?auto_157448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157452 ?auto_157447 ) ( ON-TABLE ?auto_157447 ) ( not ( = ?auto_157447 ?auto_157452 ) ) ( not ( = ?auto_157447 ?auto_157450 ) ) ( not ( = ?auto_157447 ?auto_157451 ) ) ( not ( = ?auto_157452 ?auto_157450 ) ) ( not ( = ?auto_157452 ?auto_157451 ) ) ( not ( = ?auto_157450 ?auto_157451 ) ) ( ON ?auto_157450 ?auto_157452 ) ( ON-TABLE ?auto_157453 ) ( ON ?auto_157449 ?auto_157453 ) ( not ( = ?auto_157453 ?auto_157449 ) ) ( not ( = ?auto_157453 ?auto_157454 ) ) ( not ( = ?auto_157453 ?auto_157448 ) ) ( not ( = ?auto_157453 ?auto_157451 ) ) ( not ( = ?auto_157449 ?auto_157454 ) ) ( not ( = ?auto_157449 ?auto_157448 ) ) ( not ( = ?auto_157449 ?auto_157451 ) ) ( not ( = ?auto_157454 ?auto_157448 ) ) ( not ( = ?auto_157454 ?auto_157451 ) ) ( not ( = ?auto_157448 ?auto_157451 ) ) ( not ( = ?auto_157447 ?auto_157448 ) ) ( not ( = ?auto_157447 ?auto_157453 ) ) ( not ( = ?auto_157447 ?auto_157449 ) ) ( not ( = ?auto_157447 ?auto_157454 ) ) ( not ( = ?auto_157452 ?auto_157448 ) ) ( not ( = ?auto_157452 ?auto_157453 ) ) ( not ( = ?auto_157452 ?auto_157449 ) ) ( not ( = ?auto_157452 ?auto_157454 ) ) ( not ( = ?auto_157450 ?auto_157448 ) ) ( not ( = ?auto_157450 ?auto_157453 ) ) ( not ( = ?auto_157450 ?auto_157449 ) ) ( not ( = ?auto_157450 ?auto_157454 ) ) ( ON ?auto_157451 ?auto_157450 ) ( ON ?auto_157448 ?auto_157451 ) ( CLEAR ?auto_157449 ) ( ON ?auto_157454 ?auto_157448 ) ( CLEAR ?auto_157454 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_157447 ?auto_157452 ?auto_157450 ?auto_157451 ?auto_157448 )
      ( MAKE-1PILE ?auto_157447 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_157455 - BLOCK
    )
    :vars
    (
      ?auto_157456 - BLOCK
      ?auto_157462 - BLOCK
      ?auto_157460 - BLOCK
      ?auto_157457 - BLOCK
      ?auto_157458 - BLOCK
      ?auto_157461 - BLOCK
      ?auto_157459 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157456 ?auto_157455 ) ( ON-TABLE ?auto_157455 ) ( not ( = ?auto_157455 ?auto_157456 ) ) ( not ( = ?auto_157455 ?auto_157462 ) ) ( not ( = ?auto_157455 ?auto_157460 ) ) ( not ( = ?auto_157456 ?auto_157462 ) ) ( not ( = ?auto_157456 ?auto_157460 ) ) ( not ( = ?auto_157462 ?auto_157460 ) ) ( ON ?auto_157462 ?auto_157456 ) ( ON-TABLE ?auto_157457 ) ( not ( = ?auto_157457 ?auto_157458 ) ) ( not ( = ?auto_157457 ?auto_157461 ) ) ( not ( = ?auto_157457 ?auto_157459 ) ) ( not ( = ?auto_157457 ?auto_157460 ) ) ( not ( = ?auto_157458 ?auto_157461 ) ) ( not ( = ?auto_157458 ?auto_157459 ) ) ( not ( = ?auto_157458 ?auto_157460 ) ) ( not ( = ?auto_157461 ?auto_157459 ) ) ( not ( = ?auto_157461 ?auto_157460 ) ) ( not ( = ?auto_157459 ?auto_157460 ) ) ( not ( = ?auto_157455 ?auto_157459 ) ) ( not ( = ?auto_157455 ?auto_157457 ) ) ( not ( = ?auto_157455 ?auto_157458 ) ) ( not ( = ?auto_157455 ?auto_157461 ) ) ( not ( = ?auto_157456 ?auto_157459 ) ) ( not ( = ?auto_157456 ?auto_157457 ) ) ( not ( = ?auto_157456 ?auto_157458 ) ) ( not ( = ?auto_157456 ?auto_157461 ) ) ( not ( = ?auto_157462 ?auto_157459 ) ) ( not ( = ?auto_157462 ?auto_157457 ) ) ( not ( = ?auto_157462 ?auto_157458 ) ) ( not ( = ?auto_157462 ?auto_157461 ) ) ( ON ?auto_157460 ?auto_157462 ) ( ON ?auto_157459 ?auto_157460 ) ( ON ?auto_157461 ?auto_157459 ) ( CLEAR ?auto_157461 ) ( HOLDING ?auto_157458 ) ( CLEAR ?auto_157457 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_157457 ?auto_157458 )
      ( MAKE-1PILE ?auto_157455 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_157463 - BLOCK
    )
    :vars
    (
      ?auto_157466 - BLOCK
      ?auto_157464 - BLOCK
      ?auto_157468 - BLOCK
      ?auto_157467 - BLOCK
      ?auto_157469 - BLOCK
      ?auto_157465 - BLOCK
      ?auto_157470 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157466 ?auto_157463 ) ( ON-TABLE ?auto_157463 ) ( not ( = ?auto_157463 ?auto_157466 ) ) ( not ( = ?auto_157463 ?auto_157464 ) ) ( not ( = ?auto_157463 ?auto_157468 ) ) ( not ( = ?auto_157466 ?auto_157464 ) ) ( not ( = ?auto_157466 ?auto_157468 ) ) ( not ( = ?auto_157464 ?auto_157468 ) ) ( ON ?auto_157464 ?auto_157466 ) ( ON-TABLE ?auto_157467 ) ( not ( = ?auto_157467 ?auto_157469 ) ) ( not ( = ?auto_157467 ?auto_157465 ) ) ( not ( = ?auto_157467 ?auto_157470 ) ) ( not ( = ?auto_157467 ?auto_157468 ) ) ( not ( = ?auto_157469 ?auto_157465 ) ) ( not ( = ?auto_157469 ?auto_157470 ) ) ( not ( = ?auto_157469 ?auto_157468 ) ) ( not ( = ?auto_157465 ?auto_157470 ) ) ( not ( = ?auto_157465 ?auto_157468 ) ) ( not ( = ?auto_157470 ?auto_157468 ) ) ( not ( = ?auto_157463 ?auto_157470 ) ) ( not ( = ?auto_157463 ?auto_157467 ) ) ( not ( = ?auto_157463 ?auto_157469 ) ) ( not ( = ?auto_157463 ?auto_157465 ) ) ( not ( = ?auto_157466 ?auto_157470 ) ) ( not ( = ?auto_157466 ?auto_157467 ) ) ( not ( = ?auto_157466 ?auto_157469 ) ) ( not ( = ?auto_157466 ?auto_157465 ) ) ( not ( = ?auto_157464 ?auto_157470 ) ) ( not ( = ?auto_157464 ?auto_157467 ) ) ( not ( = ?auto_157464 ?auto_157469 ) ) ( not ( = ?auto_157464 ?auto_157465 ) ) ( ON ?auto_157468 ?auto_157464 ) ( ON ?auto_157470 ?auto_157468 ) ( ON ?auto_157465 ?auto_157470 ) ( CLEAR ?auto_157467 ) ( ON ?auto_157469 ?auto_157465 ) ( CLEAR ?auto_157469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_157463 ?auto_157466 ?auto_157464 ?auto_157468 ?auto_157470 ?auto_157465 )
      ( MAKE-1PILE ?auto_157463 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_157471 - BLOCK
    )
    :vars
    (
      ?auto_157474 - BLOCK
      ?auto_157477 - BLOCK
      ?auto_157472 - BLOCK
      ?auto_157473 - BLOCK
      ?auto_157476 - BLOCK
      ?auto_157478 - BLOCK
      ?auto_157475 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157474 ?auto_157471 ) ( ON-TABLE ?auto_157471 ) ( not ( = ?auto_157471 ?auto_157474 ) ) ( not ( = ?auto_157471 ?auto_157477 ) ) ( not ( = ?auto_157471 ?auto_157472 ) ) ( not ( = ?auto_157474 ?auto_157477 ) ) ( not ( = ?auto_157474 ?auto_157472 ) ) ( not ( = ?auto_157477 ?auto_157472 ) ) ( ON ?auto_157477 ?auto_157474 ) ( not ( = ?auto_157473 ?auto_157476 ) ) ( not ( = ?auto_157473 ?auto_157478 ) ) ( not ( = ?auto_157473 ?auto_157475 ) ) ( not ( = ?auto_157473 ?auto_157472 ) ) ( not ( = ?auto_157476 ?auto_157478 ) ) ( not ( = ?auto_157476 ?auto_157475 ) ) ( not ( = ?auto_157476 ?auto_157472 ) ) ( not ( = ?auto_157478 ?auto_157475 ) ) ( not ( = ?auto_157478 ?auto_157472 ) ) ( not ( = ?auto_157475 ?auto_157472 ) ) ( not ( = ?auto_157471 ?auto_157475 ) ) ( not ( = ?auto_157471 ?auto_157473 ) ) ( not ( = ?auto_157471 ?auto_157476 ) ) ( not ( = ?auto_157471 ?auto_157478 ) ) ( not ( = ?auto_157474 ?auto_157475 ) ) ( not ( = ?auto_157474 ?auto_157473 ) ) ( not ( = ?auto_157474 ?auto_157476 ) ) ( not ( = ?auto_157474 ?auto_157478 ) ) ( not ( = ?auto_157477 ?auto_157475 ) ) ( not ( = ?auto_157477 ?auto_157473 ) ) ( not ( = ?auto_157477 ?auto_157476 ) ) ( not ( = ?auto_157477 ?auto_157478 ) ) ( ON ?auto_157472 ?auto_157477 ) ( ON ?auto_157475 ?auto_157472 ) ( ON ?auto_157478 ?auto_157475 ) ( ON ?auto_157476 ?auto_157478 ) ( CLEAR ?auto_157476 ) ( HOLDING ?auto_157473 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_157473 )
      ( MAKE-1PILE ?auto_157471 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_157479 - BLOCK
    )
    :vars
    (
      ?auto_157485 - BLOCK
      ?auto_157480 - BLOCK
      ?auto_157483 - BLOCK
      ?auto_157481 - BLOCK
      ?auto_157484 - BLOCK
      ?auto_157482 - BLOCK
      ?auto_157486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157485 ?auto_157479 ) ( ON-TABLE ?auto_157479 ) ( not ( = ?auto_157479 ?auto_157485 ) ) ( not ( = ?auto_157479 ?auto_157480 ) ) ( not ( = ?auto_157479 ?auto_157483 ) ) ( not ( = ?auto_157485 ?auto_157480 ) ) ( not ( = ?auto_157485 ?auto_157483 ) ) ( not ( = ?auto_157480 ?auto_157483 ) ) ( ON ?auto_157480 ?auto_157485 ) ( not ( = ?auto_157481 ?auto_157484 ) ) ( not ( = ?auto_157481 ?auto_157482 ) ) ( not ( = ?auto_157481 ?auto_157486 ) ) ( not ( = ?auto_157481 ?auto_157483 ) ) ( not ( = ?auto_157484 ?auto_157482 ) ) ( not ( = ?auto_157484 ?auto_157486 ) ) ( not ( = ?auto_157484 ?auto_157483 ) ) ( not ( = ?auto_157482 ?auto_157486 ) ) ( not ( = ?auto_157482 ?auto_157483 ) ) ( not ( = ?auto_157486 ?auto_157483 ) ) ( not ( = ?auto_157479 ?auto_157486 ) ) ( not ( = ?auto_157479 ?auto_157481 ) ) ( not ( = ?auto_157479 ?auto_157484 ) ) ( not ( = ?auto_157479 ?auto_157482 ) ) ( not ( = ?auto_157485 ?auto_157486 ) ) ( not ( = ?auto_157485 ?auto_157481 ) ) ( not ( = ?auto_157485 ?auto_157484 ) ) ( not ( = ?auto_157485 ?auto_157482 ) ) ( not ( = ?auto_157480 ?auto_157486 ) ) ( not ( = ?auto_157480 ?auto_157481 ) ) ( not ( = ?auto_157480 ?auto_157484 ) ) ( not ( = ?auto_157480 ?auto_157482 ) ) ( ON ?auto_157483 ?auto_157480 ) ( ON ?auto_157486 ?auto_157483 ) ( ON ?auto_157482 ?auto_157486 ) ( ON ?auto_157484 ?auto_157482 ) ( ON ?auto_157481 ?auto_157484 ) ( CLEAR ?auto_157481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_157479 ?auto_157485 ?auto_157480 ?auto_157483 ?auto_157486 ?auto_157482 ?auto_157484 )
      ( MAKE-1PILE ?auto_157479 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_157487 - BLOCK
    )
    :vars
    (
      ?auto_157490 - BLOCK
      ?auto_157494 - BLOCK
      ?auto_157493 - BLOCK
      ?auto_157491 - BLOCK
      ?auto_157488 - BLOCK
      ?auto_157489 - BLOCK
      ?auto_157492 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157490 ?auto_157487 ) ( ON-TABLE ?auto_157487 ) ( not ( = ?auto_157487 ?auto_157490 ) ) ( not ( = ?auto_157487 ?auto_157494 ) ) ( not ( = ?auto_157487 ?auto_157493 ) ) ( not ( = ?auto_157490 ?auto_157494 ) ) ( not ( = ?auto_157490 ?auto_157493 ) ) ( not ( = ?auto_157494 ?auto_157493 ) ) ( ON ?auto_157494 ?auto_157490 ) ( not ( = ?auto_157491 ?auto_157488 ) ) ( not ( = ?auto_157491 ?auto_157489 ) ) ( not ( = ?auto_157491 ?auto_157492 ) ) ( not ( = ?auto_157491 ?auto_157493 ) ) ( not ( = ?auto_157488 ?auto_157489 ) ) ( not ( = ?auto_157488 ?auto_157492 ) ) ( not ( = ?auto_157488 ?auto_157493 ) ) ( not ( = ?auto_157489 ?auto_157492 ) ) ( not ( = ?auto_157489 ?auto_157493 ) ) ( not ( = ?auto_157492 ?auto_157493 ) ) ( not ( = ?auto_157487 ?auto_157492 ) ) ( not ( = ?auto_157487 ?auto_157491 ) ) ( not ( = ?auto_157487 ?auto_157488 ) ) ( not ( = ?auto_157487 ?auto_157489 ) ) ( not ( = ?auto_157490 ?auto_157492 ) ) ( not ( = ?auto_157490 ?auto_157491 ) ) ( not ( = ?auto_157490 ?auto_157488 ) ) ( not ( = ?auto_157490 ?auto_157489 ) ) ( not ( = ?auto_157494 ?auto_157492 ) ) ( not ( = ?auto_157494 ?auto_157491 ) ) ( not ( = ?auto_157494 ?auto_157488 ) ) ( not ( = ?auto_157494 ?auto_157489 ) ) ( ON ?auto_157493 ?auto_157494 ) ( ON ?auto_157492 ?auto_157493 ) ( ON ?auto_157489 ?auto_157492 ) ( ON ?auto_157488 ?auto_157489 ) ( HOLDING ?auto_157491 ) ( CLEAR ?auto_157488 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_157487 ?auto_157490 ?auto_157494 ?auto_157493 ?auto_157492 ?auto_157489 ?auto_157488 ?auto_157491 )
      ( MAKE-1PILE ?auto_157487 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_157495 - BLOCK
    )
    :vars
    (
      ?auto_157497 - BLOCK
      ?auto_157501 - BLOCK
      ?auto_157502 - BLOCK
      ?auto_157499 - BLOCK
      ?auto_157498 - BLOCK
      ?auto_157496 - BLOCK
      ?auto_157500 - BLOCK
      ?auto_157503 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157497 ?auto_157495 ) ( ON-TABLE ?auto_157495 ) ( not ( = ?auto_157495 ?auto_157497 ) ) ( not ( = ?auto_157495 ?auto_157501 ) ) ( not ( = ?auto_157495 ?auto_157502 ) ) ( not ( = ?auto_157497 ?auto_157501 ) ) ( not ( = ?auto_157497 ?auto_157502 ) ) ( not ( = ?auto_157501 ?auto_157502 ) ) ( ON ?auto_157501 ?auto_157497 ) ( not ( = ?auto_157499 ?auto_157498 ) ) ( not ( = ?auto_157499 ?auto_157496 ) ) ( not ( = ?auto_157499 ?auto_157500 ) ) ( not ( = ?auto_157499 ?auto_157502 ) ) ( not ( = ?auto_157498 ?auto_157496 ) ) ( not ( = ?auto_157498 ?auto_157500 ) ) ( not ( = ?auto_157498 ?auto_157502 ) ) ( not ( = ?auto_157496 ?auto_157500 ) ) ( not ( = ?auto_157496 ?auto_157502 ) ) ( not ( = ?auto_157500 ?auto_157502 ) ) ( not ( = ?auto_157495 ?auto_157500 ) ) ( not ( = ?auto_157495 ?auto_157499 ) ) ( not ( = ?auto_157495 ?auto_157498 ) ) ( not ( = ?auto_157495 ?auto_157496 ) ) ( not ( = ?auto_157497 ?auto_157500 ) ) ( not ( = ?auto_157497 ?auto_157499 ) ) ( not ( = ?auto_157497 ?auto_157498 ) ) ( not ( = ?auto_157497 ?auto_157496 ) ) ( not ( = ?auto_157501 ?auto_157500 ) ) ( not ( = ?auto_157501 ?auto_157499 ) ) ( not ( = ?auto_157501 ?auto_157498 ) ) ( not ( = ?auto_157501 ?auto_157496 ) ) ( ON ?auto_157502 ?auto_157501 ) ( ON ?auto_157500 ?auto_157502 ) ( ON ?auto_157496 ?auto_157500 ) ( ON ?auto_157498 ?auto_157496 ) ( CLEAR ?auto_157498 ) ( ON ?auto_157499 ?auto_157503 ) ( CLEAR ?auto_157499 ) ( HAND-EMPTY ) ( not ( = ?auto_157495 ?auto_157503 ) ) ( not ( = ?auto_157497 ?auto_157503 ) ) ( not ( = ?auto_157501 ?auto_157503 ) ) ( not ( = ?auto_157502 ?auto_157503 ) ) ( not ( = ?auto_157499 ?auto_157503 ) ) ( not ( = ?auto_157498 ?auto_157503 ) ) ( not ( = ?auto_157496 ?auto_157503 ) ) ( not ( = ?auto_157500 ?auto_157503 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_157499 ?auto_157503 )
      ( MAKE-1PILE ?auto_157495 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_157504 - BLOCK
    )
    :vars
    (
      ?auto_157511 - BLOCK
      ?auto_157508 - BLOCK
      ?auto_157505 - BLOCK
      ?auto_157509 - BLOCK
      ?auto_157510 - BLOCK
      ?auto_157512 - BLOCK
      ?auto_157507 - BLOCK
      ?auto_157506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157511 ?auto_157504 ) ( ON-TABLE ?auto_157504 ) ( not ( = ?auto_157504 ?auto_157511 ) ) ( not ( = ?auto_157504 ?auto_157508 ) ) ( not ( = ?auto_157504 ?auto_157505 ) ) ( not ( = ?auto_157511 ?auto_157508 ) ) ( not ( = ?auto_157511 ?auto_157505 ) ) ( not ( = ?auto_157508 ?auto_157505 ) ) ( ON ?auto_157508 ?auto_157511 ) ( not ( = ?auto_157509 ?auto_157510 ) ) ( not ( = ?auto_157509 ?auto_157512 ) ) ( not ( = ?auto_157509 ?auto_157507 ) ) ( not ( = ?auto_157509 ?auto_157505 ) ) ( not ( = ?auto_157510 ?auto_157512 ) ) ( not ( = ?auto_157510 ?auto_157507 ) ) ( not ( = ?auto_157510 ?auto_157505 ) ) ( not ( = ?auto_157512 ?auto_157507 ) ) ( not ( = ?auto_157512 ?auto_157505 ) ) ( not ( = ?auto_157507 ?auto_157505 ) ) ( not ( = ?auto_157504 ?auto_157507 ) ) ( not ( = ?auto_157504 ?auto_157509 ) ) ( not ( = ?auto_157504 ?auto_157510 ) ) ( not ( = ?auto_157504 ?auto_157512 ) ) ( not ( = ?auto_157511 ?auto_157507 ) ) ( not ( = ?auto_157511 ?auto_157509 ) ) ( not ( = ?auto_157511 ?auto_157510 ) ) ( not ( = ?auto_157511 ?auto_157512 ) ) ( not ( = ?auto_157508 ?auto_157507 ) ) ( not ( = ?auto_157508 ?auto_157509 ) ) ( not ( = ?auto_157508 ?auto_157510 ) ) ( not ( = ?auto_157508 ?auto_157512 ) ) ( ON ?auto_157505 ?auto_157508 ) ( ON ?auto_157507 ?auto_157505 ) ( ON ?auto_157512 ?auto_157507 ) ( ON ?auto_157509 ?auto_157506 ) ( CLEAR ?auto_157509 ) ( not ( = ?auto_157504 ?auto_157506 ) ) ( not ( = ?auto_157511 ?auto_157506 ) ) ( not ( = ?auto_157508 ?auto_157506 ) ) ( not ( = ?auto_157505 ?auto_157506 ) ) ( not ( = ?auto_157509 ?auto_157506 ) ) ( not ( = ?auto_157510 ?auto_157506 ) ) ( not ( = ?auto_157512 ?auto_157506 ) ) ( not ( = ?auto_157507 ?auto_157506 ) ) ( HOLDING ?auto_157510 ) ( CLEAR ?auto_157512 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_157504 ?auto_157511 ?auto_157508 ?auto_157505 ?auto_157507 ?auto_157512 ?auto_157510 )
      ( MAKE-1PILE ?auto_157504 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_157513 - BLOCK
    )
    :vars
    (
      ?auto_157521 - BLOCK
      ?auto_157514 - BLOCK
      ?auto_157519 - BLOCK
      ?auto_157520 - BLOCK
      ?auto_157515 - BLOCK
      ?auto_157517 - BLOCK
      ?auto_157518 - BLOCK
      ?auto_157516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157521 ?auto_157513 ) ( ON-TABLE ?auto_157513 ) ( not ( = ?auto_157513 ?auto_157521 ) ) ( not ( = ?auto_157513 ?auto_157514 ) ) ( not ( = ?auto_157513 ?auto_157519 ) ) ( not ( = ?auto_157521 ?auto_157514 ) ) ( not ( = ?auto_157521 ?auto_157519 ) ) ( not ( = ?auto_157514 ?auto_157519 ) ) ( ON ?auto_157514 ?auto_157521 ) ( not ( = ?auto_157520 ?auto_157515 ) ) ( not ( = ?auto_157520 ?auto_157517 ) ) ( not ( = ?auto_157520 ?auto_157518 ) ) ( not ( = ?auto_157520 ?auto_157519 ) ) ( not ( = ?auto_157515 ?auto_157517 ) ) ( not ( = ?auto_157515 ?auto_157518 ) ) ( not ( = ?auto_157515 ?auto_157519 ) ) ( not ( = ?auto_157517 ?auto_157518 ) ) ( not ( = ?auto_157517 ?auto_157519 ) ) ( not ( = ?auto_157518 ?auto_157519 ) ) ( not ( = ?auto_157513 ?auto_157518 ) ) ( not ( = ?auto_157513 ?auto_157520 ) ) ( not ( = ?auto_157513 ?auto_157515 ) ) ( not ( = ?auto_157513 ?auto_157517 ) ) ( not ( = ?auto_157521 ?auto_157518 ) ) ( not ( = ?auto_157521 ?auto_157520 ) ) ( not ( = ?auto_157521 ?auto_157515 ) ) ( not ( = ?auto_157521 ?auto_157517 ) ) ( not ( = ?auto_157514 ?auto_157518 ) ) ( not ( = ?auto_157514 ?auto_157520 ) ) ( not ( = ?auto_157514 ?auto_157515 ) ) ( not ( = ?auto_157514 ?auto_157517 ) ) ( ON ?auto_157519 ?auto_157514 ) ( ON ?auto_157518 ?auto_157519 ) ( ON ?auto_157517 ?auto_157518 ) ( ON ?auto_157520 ?auto_157516 ) ( not ( = ?auto_157513 ?auto_157516 ) ) ( not ( = ?auto_157521 ?auto_157516 ) ) ( not ( = ?auto_157514 ?auto_157516 ) ) ( not ( = ?auto_157519 ?auto_157516 ) ) ( not ( = ?auto_157520 ?auto_157516 ) ) ( not ( = ?auto_157515 ?auto_157516 ) ) ( not ( = ?auto_157517 ?auto_157516 ) ) ( not ( = ?auto_157518 ?auto_157516 ) ) ( CLEAR ?auto_157517 ) ( ON ?auto_157515 ?auto_157520 ) ( CLEAR ?auto_157515 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_157516 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_157516 ?auto_157520 )
      ( MAKE-1PILE ?auto_157513 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_157522 - BLOCK
    )
    :vars
    (
      ?auto_157527 - BLOCK
      ?auto_157529 - BLOCK
      ?auto_157530 - BLOCK
      ?auto_157525 - BLOCK
      ?auto_157523 - BLOCK
      ?auto_157524 - BLOCK
      ?auto_157526 - BLOCK
      ?auto_157528 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157527 ?auto_157522 ) ( ON-TABLE ?auto_157522 ) ( not ( = ?auto_157522 ?auto_157527 ) ) ( not ( = ?auto_157522 ?auto_157529 ) ) ( not ( = ?auto_157522 ?auto_157530 ) ) ( not ( = ?auto_157527 ?auto_157529 ) ) ( not ( = ?auto_157527 ?auto_157530 ) ) ( not ( = ?auto_157529 ?auto_157530 ) ) ( ON ?auto_157529 ?auto_157527 ) ( not ( = ?auto_157525 ?auto_157523 ) ) ( not ( = ?auto_157525 ?auto_157524 ) ) ( not ( = ?auto_157525 ?auto_157526 ) ) ( not ( = ?auto_157525 ?auto_157530 ) ) ( not ( = ?auto_157523 ?auto_157524 ) ) ( not ( = ?auto_157523 ?auto_157526 ) ) ( not ( = ?auto_157523 ?auto_157530 ) ) ( not ( = ?auto_157524 ?auto_157526 ) ) ( not ( = ?auto_157524 ?auto_157530 ) ) ( not ( = ?auto_157526 ?auto_157530 ) ) ( not ( = ?auto_157522 ?auto_157526 ) ) ( not ( = ?auto_157522 ?auto_157525 ) ) ( not ( = ?auto_157522 ?auto_157523 ) ) ( not ( = ?auto_157522 ?auto_157524 ) ) ( not ( = ?auto_157527 ?auto_157526 ) ) ( not ( = ?auto_157527 ?auto_157525 ) ) ( not ( = ?auto_157527 ?auto_157523 ) ) ( not ( = ?auto_157527 ?auto_157524 ) ) ( not ( = ?auto_157529 ?auto_157526 ) ) ( not ( = ?auto_157529 ?auto_157525 ) ) ( not ( = ?auto_157529 ?auto_157523 ) ) ( not ( = ?auto_157529 ?auto_157524 ) ) ( ON ?auto_157530 ?auto_157529 ) ( ON ?auto_157526 ?auto_157530 ) ( ON ?auto_157525 ?auto_157528 ) ( not ( = ?auto_157522 ?auto_157528 ) ) ( not ( = ?auto_157527 ?auto_157528 ) ) ( not ( = ?auto_157529 ?auto_157528 ) ) ( not ( = ?auto_157530 ?auto_157528 ) ) ( not ( = ?auto_157525 ?auto_157528 ) ) ( not ( = ?auto_157523 ?auto_157528 ) ) ( not ( = ?auto_157524 ?auto_157528 ) ) ( not ( = ?auto_157526 ?auto_157528 ) ) ( ON ?auto_157523 ?auto_157525 ) ( CLEAR ?auto_157523 ) ( ON-TABLE ?auto_157528 ) ( HOLDING ?auto_157524 ) ( CLEAR ?auto_157526 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_157522 ?auto_157527 ?auto_157529 ?auto_157530 ?auto_157526 ?auto_157524 )
      ( MAKE-1PILE ?auto_157522 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_157531 - BLOCK
    )
    :vars
    (
      ?auto_157536 - BLOCK
      ?auto_157535 - BLOCK
      ?auto_157533 - BLOCK
      ?auto_157539 - BLOCK
      ?auto_157537 - BLOCK
      ?auto_157532 - BLOCK
      ?auto_157534 - BLOCK
      ?auto_157538 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157536 ?auto_157531 ) ( ON-TABLE ?auto_157531 ) ( not ( = ?auto_157531 ?auto_157536 ) ) ( not ( = ?auto_157531 ?auto_157535 ) ) ( not ( = ?auto_157531 ?auto_157533 ) ) ( not ( = ?auto_157536 ?auto_157535 ) ) ( not ( = ?auto_157536 ?auto_157533 ) ) ( not ( = ?auto_157535 ?auto_157533 ) ) ( ON ?auto_157535 ?auto_157536 ) ( not ( = ?auto_157539 ?auto_157537 ) ) ( not ( = ?auto_157539 ?auto_157532 ) ) ( not ( = ?auto_157539 ?auto_157534 ) ) ( not ( = ?auto_157539 ?auto_157533 ) ) ( not ( = ?auto_157537 ?auto_157532 ) ) ( not ( = ?auto_157537 ?auto_157534 ) ) ( not ( = ?auto_157537 ?auto_157533 ) ) ( not ( = ?auto_157532 ?auto_157534 ) ) ( not ( = ?auto_157532 ?auto_157533 ) ) ( not ( = ?auto_157534 ?auto_157533 ) ) ( not ( = ?auto_157531 ?auto_157534 ) ) ( not ( = ?auto_157531 ?auto_157539 ) ) ( not ( = ?auto_157531 ?auto_157537 ) ) ( not ( = ?auto_157531 ?auto_157532 ) ) ( not ( = ?auto_157536 ?auto_157534 ) ) ( not ( = ?auto_157536 ?auto_157539 ) ) ( not ( = ?auto_157536 ?auto_157537 ) ) ( not ( = ?auto_157536 ?auto_157532 ) ) ( not ( = ?auto_157535 ?auto_157534 ) ) ( not ( = ?auto_157535 ?auto_157539 ) ) ( not ( = ?auto_157535 ?auto_157537 ) ) ( not ( = ?auto_157535 ?auto_157532 ) ) ( ON ?auto_157533 ?auto_157535 ) ( ON ?auto_157534 ?auto_157533 ) ( ON ?auto_157539 ?auto_157538 ) ( not ( = ?auto_157531 ?auto_157538 ) ) ( not ( = ?auto_157536 ?auto_157538 ) ) ( not ( = ?auto_157535 ?auto_157538 ) ) ( not ( = ?auto_157533 ?auto_157538 ) ) ( not ( = ?auto_157539 ?auto_157538 ) ) ( not ( = ?auto_157537 ?auto_157538 ) ) ( not ( = ?auto_157532 ?auto_157538 ) ) ( not ( = ?auto_157534 ?auto_157538 ) ) ( ON ?auto_157537 ?auto_157539 ) ( ON-TABLE ?auto_157538 ) ( CLEAR ?auto_157534 ) ( ON ?auto_157532 ?auto_157537 ) ( CLEAR ?auto_157532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_157538 ?auto_157539 ?auto_157537 )
      ( MAKE-1PILE ?auto_157531 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_157540 - BLOCK
    )
    :vars
    (
      ?auto_157548 - BLOCK
      ?auto_157545 - BLOCK
      ?auto_157543 - BLOCK
      ?auto_157547 - BLOCK
      ?auto_157542 - BLOCK
      ?auto_157541 - BLOCK
      ?auto_157544 - BLOCK
      ?auto_157546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157548 ?auto_157540 ) ( ON-TABLE ?auto_157540 ) ( not ( = ?auto_157540 ?auto_157548 ) ) ( not ( = ?auto_157540 ?auto_157545 ) ) ( not ( = ?auto_157540 ?auto_157543 ) ) ( not ( = ?auto_157548 ?auto_157545 ) ) ( not ( = ?auto_157548 ?auto_157543 ) ) ( not ( = ?auto_157545 ?auto_157543 ) ) ( ON ?auto_157545 ?auto_157548 ) ( not ( = ?auto_157547 ?auto_157542 ) ) ( not ( = ?auto_157547 ?auto_157541 ) ) ( not ( = ?auto_157547 ?auto_157544 ) ) ( not ( = ?auto_157547 ?auto_157543 ) ) ( not ( = ?auto_157542 ?auto_157541 ) ) ( not ( = ?auto_157542 ?auto_157544 ) ) ( not ( = ?auto_157542 ?auto_157543 ) ) ( not ( = ?auto_157541 ?auto_157544 ) ) ( not ( = ?auto_157541 ?auto_157543 ) ) ( not ( = ?auto_157544 ?auto_157543 ) ) ( not ( = ?auto_157540 ?auto_157544 ) ) ( not ( = ?auto_157540 ?auto_157547 ) ) ( not ( = ?auto_157540 ?auto_157542 ) ) ( not ( = ?auto_157540 ?auto_157541 ) ) ( not ( = ?auto_157548 ?auto_157544 ) ) ( not ( = ?auto_157548 ?auto_157547 ) ) ( not ( = ?auto_157548 ?auto_157542 ) ) ( not ( = ?auto_157548 ?auto_157541 ) ) ( not ( = ?auto_157545 ?auto_157544 ) ) ( not ( = ?auto_157545 ?auto_157547 ) ) ( not ( = ?auto_157545 ?auto_157542 ) ) ( not ( = ?auto_157545 ?auto_157541 ) ) ( ON ?auto_157543 ?auto_157545 ) ( ON ?auto_157547 ?auto_157546 ) ( not ( = ?auto_157540 ?auto_157546 ) ) ( not ( = ?auto_157548 ?auto_157546 ) ) ( not ( = ?auto_157545 ?auto_157546 ) ) ( not ( = ?auto_157543 ?auto_157546 ) ) ( not ( = ?auto_157547 ?auto_157546 ) ) ( not ( = ?auto_157542 ?auto_157546 ) ) ( not ( = ?auto_157541 ?auto_157546 ) ) ( not ( = ?auto_157544 ?auto_157546 ) ) ( ON ?auto_157542 ?auto_157547 ) ( ON-TABLE ?auto_157546 ) ( ON ?auto_157541 ?auto_157542 ) ( CLEAR ?auto_157541 ) ( HOLDING ?auto_157544 ) ( CLEAR ?auto_157543 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_157540 ?auto_157548 ?auto_157545 ?auto_157543 ?auto_157544 )
      ( MAKE-1PILE ?auto_157540 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_157549 - BLOCK
    )
    :vars
    (
      ?auto_157556 - BLOCK
      ?auto_157557 - BLOCK
      ?auto_157554 - BLOCK
      ?auto_157553 - BLOCK
      ?auto_157552 - BLOCK
      ?auto_157550 - BLOCK
      ?auto_157555 - BLOCK
      ?auto_157551 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157556 ?auto_157549 ) ( ON-TABLE ?auto_157549 ) ( not ( = ?auto_157549 ?auto_157556 ) ) ( not ( = ?auto_157549 ?auto_157557 ) ) ( not ( = ?auto_157549 ?auto_157554 ) ) ( not ( = ?auto_157556 ?auto_157557 ) ) ( not ( = ?auto_157556 ?auto_157554 ) ) ( not ( = ?auto_157557 ?auto_157554 ) ) ( ON ?auto_157557 ?auto_157556 ) ( not ( = ?auto_157553 ?auto_157552 ) ) ( not ( = ?auto_157553 ?auto_157550 ) ) ( not ( = ?auto_157553 ?auto_157555 ) ) ( not ( = ?auto_157553 ?auto_157554 ) ) ( not ( = ?auto_157552 ?auto_157550 ) ) ( not ( = ?auto_157552 ?auto_157555 ) ) ( not ( = ?auto_157552 ?auto_157554 ) ) ( not ( = ?auto_157550 ?auto_157555 ) ) ( not ( = ?auto_157550 ?auto_157554 ) ) ( not ( = ?auto_157555 ?auto_157554 ) ) ( not ( = ?auto_157549 ?auto_157555 ) ) ( not ( = ?auto_157549 ?auto_157553 ) ) ( not ( = ?auto_157549 ?auto_157552 ) ) ( not ( = ?auto_157549 ?auto_157550 ) ) ( not ( = ?auto_157556 ?auto_157555 ) ) ( not ( = ?auto_157556 ?auto_157553 ) ) ( not ( = ?auto_157556 ?auto_157552 ) ) ( not ( = ?auto_157556 ?auto_157550 ) ) ( not ( = ?auto_157557 ?auto_157555 ) ) ( not ( = ?auto_157557 ?auto_157553 ) ) ( not ( = ?auto_157557 ?auto_157552 ) ) ( not ( = ?auto_157557 ?auto_157550 ) ) ( ON ?auto_157554 ?auto_157557 ) ( ON ?auto_157553 ?auto_157551 ) ( not ( = ?auto_157549 ?auto_157551 ) ) ( not ( = ?auto_157556 ?auto_157551 ) ) ( not ( = ?auto_157557 ?auto_157551 ) ) ( not ( = ?auto_157554 ?auto_157551 ) ) ( not ( = ?auto_157553 ?auto_157551 ) ) ( not ( = ?auto_157552 ?auto_157551 ) ) ( not ( = ?auto_157550 ?auto_157551 ) ) ( not ( = ?auto_157555 ?auto_157551 ) ) ( ON ?auto_157552 ?auto_157553 ) ( ON-TABLE ?auto_157551 ) ( ON ?auto_157550 ?auto_157552 ) ( CLEAR ?auto_157554 ) ( ON ?auto_157555 ?auto_157550 ) ( CLEAR ?auto_157555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_157551 ?auto_157553 ?auto_157552 ?auto_157550 )
      ( MAKE-1PILE ?auto_157549 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_157558 - BLOCK
    )
    :vars
    (
      ?auto_157559 - BLOCK
      ?auto_157565 - BLOCK
      ?auto_157563 - BLOCK
      ?auto_157560 - BLOCK
      ?auto_157562 - BLOCK
      ?auto_157564 - BLOCK
      ?auto_157561 - BLOCK
      ?auto_157566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157559 ?auto_157558 ) ( ON-TABLE ?auto_157558 ) ( not ( = ?auto_157558 ?auto_157559 ) ) ( not ( = ?auto_157558 ?auto_157565 ) ) ( not ( = ?auto_157558 ?auto_157563 ) ) ( not ( = ?auto_157559 ?auto_157565 ) ) ( not ( = ?auto_157559 ?auto_157563 ) ) ( not ( = ?auto_157565 ?auto_157563 ) ) ( ON ?auto_157565 ?auto_157559 ) ( not ( = ?auto_157560 ?auto_157562 ) ) ( not ( = ?auto_157560 ?auto_157564 ) ) ( not ( = ?auto_157560 ?auto_157561 ) ) ( not ( = ?auto_157560 ?auto_157563 ) ) ( not ( = ?auto_157562 ?auto_157564 ) ) ( not ( = ?auto_157562 ?auto_157561 ) ) ( not ( = ?auto_157562 ?auto_157563 ) ) ( not ( = ?auto_157564 ?auto_157561 ) ) ( not ( = ?auto_157564 ?auto_157563 ) ) ( not ( = ?auto_157561 ?auto_157563 ) ) ( not ( = ?auto_157558 ?auto_157561 ) ) ( not ( = ?auto_157558 ?auto_157560 ) ) ( not ( = ?auto_157558 ?auto_157562 ) ) ( not ( = ?auto_157558 ?auto_157564 ) ) ( not ( = ?auto_157559 ?auto_157561 ) ) ( not ( = ?auto_157559 ?auto_157560 ) ) ( not ( = ?auto_157559 ?auto_157562 ) ) ( not ( = ?auto_157559 ?auto_157564 ) ) ( not ( = ?auto_157565 ?auto_157561 ) ) ( not ( = ?auto_157565 ?auto_157560 ) ) ( not ( = ?auto_157565 ?auto_157562 ) ) ( not ( = ?auto_157565 ?auto_157564 ) ) ( ON ?auto_157560 ?auto_157566 ) ( not ( = ?auto_157558 ?auto_157566 ) ) ( not ( = ?auto_157559 ?auto_157566 ) ) ( not ( = ?auto_157565 ?auto_157566 ) ) ( not ( = ?auto_157563 ?auto_157566 ) ) ( not ( = ?auto_157560 ?auto_157566 ) ) ( not ( = ?auto_157562 ?auto_157566 ) ) ( not ( = ?auto_157564 ?auto_157566 ) ) ( not ( = ?auto_157561 ?auto_157566 ) ) ( ON ?auto_157562 ?auto_157560 ) ( ON-TABLE ?auto_157566 ) ( ON ?auto_157564 ?auto_157562 ) ( ON ?auto_157561 ?auto_157564 ) ( CLEAR ?auto_157561 ) ( HOLDING ?auto_157563 ) ( CLEAR ?auto_157565 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_157558 ?auto_157559 ?auto_157565 ?auto_157563 )
      ( MAKE-1PILE ?auto_157558 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_157567 - BLOCK
    )
    :vars
    (
      ?auto_157572 - BLOCK
      ?auto_157568 - BLOCK
      ?auto_157574 - BLOCK
      ?auto_157571 - BLOCK
      ?auto_157575 - BLOCK
      ?auto_157569 - BLOCK
      ?auto_157573 - BLOCK
      ?auto_157570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157572 ?auto_157567 ) ( ON-TABLE ?auto_157567 ) ( not ( = ?auto_157567 ?auto_157572 ) ) ( not ( = ?auto_157567 ?auto_157568 ) ) ( not ( = ?auto_157567 ?auto_157574 ) ) ( not ( = ?auto_157572 ?auto_157568 ) ) ( not ( = ?auto_157572 ?auto_157574 ) ) ( not ( = ?auto_157568 ?auto_157574 ) ) ( ON ?auto_157568 ?auto_157572 ) ( not ( = ?auto_157571 ?auto_157575 ) ) ( not ( = ?auto_157571 ?auto_157569 ) ) ( not ( = ?auto_157571 ?auto_157573 ) ) ( not ( = ?auto_157571 ?auto_157574 ) ) ( not ( = ?auto_157575 ?auto_157569 ) ) ( not ( = ?auto_157575 ?auto_157573 ) ) ( not ( = ?auto_157575 ?auto_157574 ) ) ( not ( = ?auto_157569 ?auto_157573 ) ) ( not ( = ?auto_157569 ?auto_157574 ) ) ( not ( = ?auto_157573 ?auto_157574 ) ) ( not ( = ?auto_157567 ?auto_157573 ) ) ( not ( = ?auto_157567 ?auto_157571 ) ) ( not ( = ?auto_157567 ?auto_157575 ) ) ( not ( = ?auto_157567 ?auto_157569 ) ) ( not ( = ?auto_157572 ?auto_157573 ) ) ( not ( = ?auto_157572 ?auto_157571 ) ) ( not ( = ?auto_157572 ?auto_157575 ) ) ( not ( = ?auto_157572 ?auto_157569 ) ) ( not ( = ?auto_157568 ?auto_157573 ) ) ( not ( = ?auto_157568 ?auto_157571 ) ) ( not ( = ?auto_157568 ?auto_157575 ) ) ( not ( = ?auto_157568 ?auto_157569 ) ) ( ON ?auto_157571 ?auto_157570 ) ( not ( = ?auto_157567 ?auto_157570 ) ) ( not ( = ?auto_157572 ?auto_157570 ) ) ( not ( = ?auto_157568 ?auto_157570 ) ) ( not ( = ?auto_157574 ?auto_157570 ) ) ( not ( = ?auto_157571 ?auto_157570 ) ) ( not ( = ?auto_157575 ?auto_157570 ) ) ( not ( = ?auto_157569 ?auto_157570 ) ) ( not ( = ?auto_157573 ?auto_157570 ) ) ( ON ?auto_157575 ?auto_157571 ) ( ON-TABLE ?auto_157570 ) ( ON ?auto_157569 ?auto_157575 ) ( ON ?auto_157573 ?auto_157569 ) ( CLEAR ?auto_157568 ) ( ON ?auto_157574 ?auto_157573 ) ( CLEAR ?auto_157574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_157570 ?auto_157571 ?auto_157575 ?auto_157569 ?auto_157573 )
      ( MAKE-1PILE ?auto_157567 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_157576 - BLOCK
    )
    :vars
    (
      ?auto_157577 - BLOCK
      ?auto_157584 - BLOCK
      ?auto_157583 - BLOCK
      ?auto_157580 - BLOCK
      ?auto_157581 - BLOCK
      ?auto_157579 - BLOCK
      ?auto_157582 - BLOCK
      ?auto_157578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157577 ?auto_157576 ) ( ON-TABLE ?auto_157576 ) ( not ( = ?auto_157576 ?auto_157577 ) ) ( not ( = ?auto_157576 ?auto_157584 ) ) ( not ( = ?auto_157576 ?auto_157583 ) ) ( not ( = ?auto_157577 ?auto_157584 ) ) ( not ( = ?auto_157577 ?auto_157583 ) ) ( not ( = ?auto_157584 ?auto_157583 ) ) ( not ( = ?auto_157580 ?auto_157581 ) ) ( not ( = ?auto_157580 ?auto_157579 ) ) ( not ( = ?auto_157580 ?auto_157582 ) ) ( not ( = ?auto_157580 ?auto_157583 ) ) ( not ( = ?auto_157581 ?auto_157579 ) ) ( not ( = ?auto_157581 ?auto_157582 ) ) ( not ( = ?auto_157581 ?auto_157583 ) ) ( not ( = ?auto_157579 ?auto_157582 ) ) ( not ( = ?auto_157579 ?auto_157583 ) ) ( not ( = ?auto_157582 ?auto_157583 ) ) ( not ( = ?auto_157576 ?auto_157582 ) ) ( not ( = ?auto_157576 ?auto_157580 ) ) ( not ( = ?auto_157576 ?auto_157581 ) ) ( not ( = ?auto_157576 ?auto_157579 ) ) ( not ( = ?auto_157577 ?auto_157582 ) ) ( not ( = ?auto_157577 ?auto_157580 ) ) ( not ( = ?auto_157577 ?auto_157581 ) ) ( not ( = ?auto_157577 ?auto_157579 ) ) ( not ( = ?auto_157584 ?auto_157582 ) ) ( not ( = ?auto_157584 ?auto_157580 ) ) ( not ( = ?auto_157584 ?auto_157581 ) ) ( not ( = ?auto_157584 ?auto_157579 ) ) ( ON ?auto_157580 ?auto_157578 ) ( not ( = ?auto_157576 ?auto_157578 ) ) ( not ( = ?auto_157577 ?auto_157578 ) ) ( not ( = ?auto_157584 ?auto_157578 ) ) ( not ( = ?auto_157583 ?auto_157578 ) ) ( not ( = ?auto_157580 ?auto_157578 ) ) ( not ( = ?auto_157581 ?auto_157578 ) ) ( not ( = ?auto_157579 ?auto_157578 ) ) ( not ( = ?auto_157582 ?auto_157578 ) ) ( ON ?auto_157581 ?auto_157580 ) ( ON-TABLE ?auto_157578 ) ( ON ?auto_157579 ?auto_157581 ) ( ON ?auto_157582 ?auto_157579 ) ( ON ?auto_157583 ?auto_157582 ) ( CLEAR ?auto_157583 ) ( HOLDING ?auto_157584 ) ( CLEAR ?auto_157577 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_157576 ?auto_157577 ?auto_157584 )
      ( MAKE-1PILE ?auto_157576 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_157585 - BLOCK
    )
    :vars
    (
      ?auto_157593 - BLOCK
      ?auto_157592 - BLOCK
      ?auto_157588 - BLOCK
      ?auto_157590 - BLOCK
      ?auto_157591 - BLOCK
      ?auto_157587 - BLOCK
      ?auto_157586 - BLOCK
      ?auto_157589 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157593 ?auto_157585 ) ( ON-TABLE ?auto_157585 ) ( not ( = ?auto_157585 ?auto_157593 ) ) ( not ( = ?auto_157585 ?auto_157592 ) ) ( not ( = ?auto_157585 ?auto_157588 ) ) ( not ( = ?auto_157593 ?auto_157592 ) ) ( not ( = ?auto_157593 ?auto_157588 ) ) ( not ( = ?auto_157592 ?auto_157588 ) ) ( not ( = ?auto_157590 ?auto_157591 ) ) ( not ( = ?auto_157590 ?auto_157587 ) ) ( not ( = ?auto_157590 ?auto_157586 ) ) ( not ( = ?auto_157590 ?auto_157588 ) ) ( not ( = ?auto_157591 ?auto_157587 ) ) ( not ( = ?auto_157591 ?auto_157586 ) ) ( not ( = ?auto_157591 ?auto_157588 ) ) ( not ( = ?auto_157587 ?auto_157586 ) ) ( not ( = ?auto_157587 ?auto_157588 ) ) ( not ( = ?auto_157586 ?auto_157588 ) ) ( not ( = ?auto_157585 ?auto_157586 ) ) ( not ( = ?auto_157585 ?auto_157590 ) ) ( not ( = ?auto_157585 ?auto_157591 ) ) ( not ( = ?auto_157585 ?auto_157587 ) ) ( not ( = ?auto_157593 ?auto_157586 ) ) ( not ( = ?auto_157593 ?auto_157590 ) ) ( not ( = ?auto_157593 ?auto_157591 ) ) ( not ( = ?auto_157593 ?auto_157587 ) ) ( not ( = ?auto_157592 ?auto_157586 ) ) ( not ( = ?auto_157592 ?auto_157590 ) ) ( not ( = ?auto_157592 ?auto_157591 ) ) ( not ( = ?auto_157592 ?auto_157587 ) ) ( ON ?auto_157590 ?auto_157589 ) ( not ( = ?auto_157585 ?auto_157589 ) ) ( not ( = ?auto_157593 ?auto_157589 ) ) ( not ( = ?auto_157592 ?auto_157589 ) ) ( not ( = ?auto_157588 ?auto_157589 ) ) ( not ( = ?auto_157590 ?auto_157589 ) ) ( not ( = ?auto_157591 ?auto_157589 ) ) ( not ( = ?auto_157587 ?auto_157589 ) ) ( not ( = ?auto_157586 ?auto_157589 ) ) ( ON ?auto_157591 ?auto_157590 ) ( ON-TABLE ?auto_157589 ) ( ON ?auto_157587 ?auto_157591 ) ( ON ?auto_157586 ?auto_157587 ) ( ON ?auto_157588 ?auto_157586 ) ( CLEAR ?auto_157593 ) ( ON ?auto_157592 ?auto_157588 ) ( CLEAR ?auto_157592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_157589 ?auto_157590 ?auto_157591 ?auto_157587 ?auto_157586 ?auto_157588 )
      ( MAKE-1PILE ?auto_157585 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_157612 - BLOCK
    )
    :vars
    (
      ?auto_157613 - BLOCK
      ?auto_157620 - BLOCK
      ?auto_157618 - BLOCK
      ?auto_157619 - BLOCK
      ?auto_157617 - BLOCK
      ?auto_157614 - BLOCK
      ?auto_157615 - BLOCK
      ?auto_157616 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157612 ?auto_157613 ) ) ( not ( = ?auto_157612 ?auto_157620 ) ) ( not ( = ?auto_157612 ?auto_157618 ) ) ( not ( = ?auto_157613 ?auto_157620 ) ) ( not ( = ?auto_157613 ?auto_157618 ) ) ( not ( = ?auto_157620 ?auto_157618 ) ) ( not ( = ?auto_157619 ?auto_157617 ) ) ( not ( = ?auto_157619 ?auto_157614 ) ) ( not ( = ?auto_157619 ?auto_157615 ) ) ( not ( = ?auto_157619 ?auto_157618 ) ) ( not ( = ?auto_157617 ?auto_157614 ) ) ( not ( = ?auto_157617 ?auto_157615 ) ) ( not ( = ?auto_157617 ?auto_157618 ) ) ( not ( = ?auto_157614 ?auto_157615 ) ) ( not ( = ?auto_157614 ?auto_157618 ) ) ( not ( = ?auto_157615 ?auto_157618 ) ) ( not ( = ?auto_157612 ?auto_157615 ) ) ( not ( = ?auto_157612 ?auto_157619 ) ) ( not ( = ?auto_157612 ?auto_157617 ) ) ( not ( = ?auto_157612 ?auto_157614 ) ) ( not ( = ?auto_157613 ?auto_157615 ) ) ( not ( = ?auto_157613 ?auto_157619 ) ) ( not ( = ?auto_157613 ?auto_157617 ) ) ( not ( = ?auto_157613 ?auto_157614 ) ) ( not ( = ?auto_157620 ?auto_157615 ) ) ( not ( = ?auto_157620 ?auto_157619 ) ) ( not ( = ?auto_157620 ?auto_157617 ) ) ( not ( = ?auto_157620 ?auto_157614 ) ) ( ON ?auto_157619 ?auto_157616 ) ( not ( = ?auto_157612 ?auto_157616 ) ) ( not ( = ?auto_157613 ?auto_157616 ) ) ( not ( = ?auto_157620 ?auto_157616 ) ) ( not ( = ?auto_157618 ?auto_157616 ) ) ( not ( = ?auto_157619 ?auto_157616 ) ) ( not ( = ?auto_157617 ?auto_157616 ) ) ( not ( = ?auto_157614 ?auto_157616 ) ) ( not ( = ?auto_157615 ?auto_157616 ) ) ( ON ?auto_157617 ?auto_157619 ) ( ON-TABLE ?auto_157616 ) ( ON ?auto_157614 ?auto_157617 ) ( ON ?auto_157615 ?auto_157614 ) ( ON ?auto_157618 ?auto_157615 ) ( ON ?auto_157620 ?auto_157618 ) ( ON ?auto_157613 ?auto_157620 ) ( CLEAR ?auto_157613 ) ( HOLDING ?auto_157612 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_157612 ?auto_157613 )
      ( MAKE-1PILE ?auto_157612 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_157621 - BLOCK
    )
    :vars
    (
      ?auto_157626 - BLOCK
      ?auto_157625 - BLOCK
      ?auto_157629 - BLOCK
      ?auto_157624 - BLOCK
      ?auto_157627 - BLOCK
      ?auto_157623 - BLOCK
      ?auto_157622 - BLOCK
      ?auto_157628 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157621 ?auto_157626 ) ) ( not ( = ?auto_157621 ?auto_157625 ) ) ( not ( = ?auto_157621 ?auto_157629 ) ) ( not ( = ?auto_157626 ?auto_157625 ) ) ( not ( = ?auto_157626 ?auto_157629 ) ) ( not ( = ?auto_157625 ?auto_157629 ) ) ( not ( = ?auto_157624 ?auto_157627 ) ) ( not ( = ?auto_157624 ?auto_157623 ) ) ( not ( = ?auto_157624 ?auto_157622 ) ) ( not ( = ?auto_157624 ?auto_157629 ) ) ( not ( = ?auto_157627 ?auto_157623 ) ) ( not ( = ?auto_157627 ?auto_157622 ) ) ( not ( = ?auto_157627 ?auto_157629 ) ) ( not ( = ?auto_157623 ?auto_157622 ) ) ( not ( = ?auto_157623 ?auto_157629 ) ) ( not ( = ?auto_157622 ?auto_157629 ) ) ( not ( = ?auto_157621 ?auto_157622 ) ) ( not ( = ?auto_157621 ?auto_157624 ) ) ( not ( = ?auto_157621 ?auto_157627 ) ) ( not ( = ?auto_157621 ?auto_157623 ) ) ( not ( = ?auto_157626 ?auto_157622 ) ) ( not ( = ?auto_157626 ?auto_157624 ) ) ( not ( = ?auto_157626 ?auto_157627 ) ) ( not ( = ?auto_157626 ?auto_157623 ) ) ( not ( = ?auto_157625 ?auto_157622 ) ) ( not ( = ?auto_157625 ?auto_157624 ) ) ( not ( = ?auto_157625 ?auto_157627 ) ) ( not ( = ?auto_157625 ?auto_157623 ) ) ( ON ?auto_157624 ?auto_157628 ) ( not ( = ?auto_157621 ?auto_157628 ) ) ( not ( = ?auto_157626 ?auto_157628 ) ) ( not ( = ?auto_157625 ?auto_157628 ) ) ( not ( = ?auto_157629 ?auto_157628 ) ) ( not ( = ?auto_157624 ?auto_157628 ) ) ( not ( = ?auto_157627 ?auto_157628 ) ) ( not ( = ?auto_157623 ?auto_157628 ) ) ( not ( = ?auto_157622 ?auto_157628 ) ) ( ON ?auto_157627 ?auto_157624 ) ( ON-TABLE ?auto_157628 ) ( ON ?auto_157623 ?auto_157627 ) ( ON ?auto_157622 ?auto_157623 ) ( ON ?auto_157629 ?auto_157622 ) ( ON ?auto_157625 ?auto_157629 ) ( ON ?auto_157626 ?auto_157625 ) ( ON ?auto_157621 ?auto_157626 ) ( CLEAR ?auto_157621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_157628 ?auto_157624 ?auto_157627 ?auto_157623 ?auto_157622 ?auto_157629 ?auto_157625 ?auto_157626 )
      ( MAKE-1PILE ?auto_157621 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157637 - BLOCK
      ?auto_157638 - BLOCK
      ?auto_157639 - BLOCK
      ?auto_157640 - BLOCK
      ?auto_157641 - BLOCK
      ?auto_157642 - BLOCK
      ?auto_157643 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_157643 ) ( CLEAR ?auto_157642 ) ( ON-TABLE ?auto_157637 ) ( ON ?auto_157638 ?auto_157637 ) ( ON ?auto_157639 ?auto_157638 ) ( ON ?auto_157640 ?auto_157639 ) ( ON ?auto_157641 ?auto_157640 ) ( ON ?auto_157642 ?auto_157641 ) ( not ( = ?auto_157637 ?auto_157638 ) ) ( not ( = ?auto_157637 ?auto_157639 ) ) ( not ( = ?auto_157637 ?auto_157640 ) ) ( not ( = ?auto_157637 ?auto_157641 ) ) ( not ( = ?auto_157637 ?auto_157642 ) ) ( not ( = ?auto_157637 ?auto_157643 ) ) ( not ( = ?auto_157638 ?auto_157639 ) ) ( not ( = ?auto_157638 ?auto_157640 ) ) ( not ( = ?auto_157638 ?auto_157641 ) ) ( not ( = ?auto_157638 ?auto_157642 ) ) ( not ( = ?auto_157638 ?auto_157643 ) ) ( not ( = ?auto_157639 ?auto_157640 ) ) ( not ( = ?auto_157639 ?auto_157641 ) ) ( not ( = ?auto_157639 ?auto_157642 ) ) ( not ( = ?auto_157639 ?auto_157643 ) ) ( not ( = ?auto_157640 ?auto_157641 ) ) ( not ( = ?auto_157640 ?auto_157642 ) ) ( not ( = ?auto_157640 ?auto_157643 ) ) ( not ( = ?auto_157641 ?auto_157642 ) ) ( not ( = ?auto_157641 ?auto_157643 ) ) ( not ( = ?auto_157642 ?auto_157643 ) ) )
    :subtasks
    ( ( !STACK ?auto_157643 ?auto_157642 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157644 - BLOCK
      ?auto_157645 - BLOCK
      ?auto_157646 - BLOCK
      ?auto_157647 - BLOCK
      ?auto_157648 - BLOCK
      ?auto_157649 - BLOCK
      ?auto_157650 - BLOCK
    )
    :vars
    (
      ?auto_157651 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_157649 ) ( ON-TABLE ?auto_157644 ) ( ON ?auto_157645 ?auto_157644 ) ( ON ?auto_157646 ?auto_157645 ) ( ON ?auto_157647 ?auto_157646 ) ( ON ?auto_157648 ?auto_157647 ) ( ON ?auto_157649 ?auto_157648 ) ( not ( = ?auto_157644 ?auto_157645 ) ) ( not ( = ?auto_157644 ?auto_157646 ) ) ( not ( = ?auto_157644 ?auto_157647 ) ) ( not ( = ?auto_157644 ?auto_157648 ) ) ( not ( = ?auto_157644 ?auto_157649 ) ) ( not ( = ?auto_157644 ?auto_157650 ) ) ( not ( = ?auto_157645 ?auto_157646 ) ) ( not ( = ?auto_157645 ?auto_157647 ) ) ( not ( = ?auto_157645 ?auto_157648 ) ) ( not ( = ?auto_157645 ?auto_157649 ) ) ( not ( = ?auto_157645 ?auto_157650 ) ) ( not ( = ?auto_157646 ?auto_157647 ) ) ( not ( = ?auto_157646 ?auto_157648 ) ) ( not ( = ?auto_157646 ?auto_157649 ) ) ( not ( = ?auto_157646 ?auto_157650 ) ) ( not ( = ?auto_157647 ?auto_157648 ) ) ( not ( = ?auto_157647 ?auto_157649 ) ) ( not ( = ?auto_157647 ?auto_157650 ) ) ( not ( = ?auto_157648 ?auto_157649 ) ) ( not ( = ?auto_157648 ?auto_157650 ) ) ( not ( = ?auto_157649 ?auto_157650 ) ) ( ON ?auto_157650 ?auto_157651 ) ( CLEAR ?auto_157650 ) ( HAND-EMPTY ) ( not ( = ?auto_157644 ?auto_157651 ) ) ( not ( = ?auto_157645 ?auto_157651 ) ) ( not ( = ?auto_157646 ?auto_157651 ) ) ( not ( = ?auto_157647 ?auto_157651 ) ) ( not ( = ?auto_157648 ?auto_157651 ) ) ( not ( = ?auto_157649 ?auto_157651 ) ) ( not ( = ?auto_157650 ?auto_157651 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_157650 ?auto_157651 )
      ( MAKE-7PILE ?auto_157644 ?auto_157645 ?auto_157646 ?auto_157647 ?auto_157648 ?auto_157649 ?auto_157650 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157652 - BLOCK
      ?auto_157653 - BLOCK
      ?auto_157654 - BLOCK
      ?auto_157655 - BLOCK
      ?auto_157656 - BLOCK
      ?auto_157657 - BLOCK
      ?auto_157658 - BLOCK
    )
    :vars
    (
      ?auto_157659 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157652 ) ( ON ?auto_157653 ?auto_157652 ) ( ON ?auto_157654 ?auto_157653 ) ( ON ?auto_157655 ?auto_157654 ) ( ON ?auto_157656 ?auto_157655 ) ( not ( = ?auto_157652 ?auto_157653 ) ) ( not ( = ?auto_157652 ?auto_157654 ) ) ( not ( = ?auto_157652 ?auto_157655 ) ) ( not ( = ?auto_157652 ?auto_157656 ) ) ( not ( = ?auto_157652 ?auto_157657 ) ) ( not ( = ?auto_157652 ?auto_157658 ) ) ( not ( = ?auto_157653 ?auto_157654 ) ) ( not ( = ?auto_157653 ?auto_157655 ) ) ( not ( = ?auto_157653 ?auto_157656 ) ) ( not ( = ?auto_157653 ?auto_157657 ) ) ( not ( = ?auto_157653 ?auto_157658 ) ) ( not ( = ?auto_157654 ?auto_157655 ) ) ( not ( = ?auto_157654 ?auto_157656 ) ) ( not ( = ?auto_157654 ?auto_157657 ) ) ( not ( = ?auto_157654 ?auto_157658 ) ) ( not ( = ?auto_157655 ?auto_157656 ) ) ( not ( = ?auto_157655 ?auto_157657 ) ) ( not ( = ?auto_157655 ?auto_157658 ) ) ( not ( = ?auto_157656 ?auto_157657 ) ) ( not ( = ?auto_157656 ?auto_157658 ) ) ( not ( = ?auto_157657 ?auto_157658 ) ) ( ON ?auto_157658 ?auto_157659 ) ( CLEAR ?auto_157658 ) ( not ( = ?auto_157652 ?auto_157659 ) ) ( not ( = ?auto_157653 ?auto_157659 ) ) ( not ( = ?auto_157654 ?auto_157659 ) ) ( not ( = ?auto_157655 ?auto_157659 ) ) ( not ( = ?auto_157656 ?auto_157659 ) ) ( not ( = ?auto_157657 ?auto_157659 ) ) ( not ( = ?auto_157658 ?auto_157659 ) ) ( HOLDING ?auto_157657 ) ( CLEAR ?auto_157656 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_157652 ?auto_157653 ?auto_157654 ?auto_157655 ?auto_157656 ?auto_157657 )
      ( MAKE-7PILE ?auto_157652 ?auto_157653 ?auto_157654 ?auto_157655 ?auto_157656 ?auto_157657 ?auto_157658 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157660 - BLOCK
      ?auto_157661 - BLOCK
      ?auto_157662 - BLOCK
      ?auto_157663 - BLOCK
      ?auto_157664 - BLOCK
      ?auto_157665 - BLOCK
      ?auto_157666 - BLOCK
    )
    :vars
    (
      ?auto_157667 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157660 ) ( ON ?auto_157661 ?auto_157660 ) ( ON ?auto_157662 ?auto_157661 ) ( ON ?auto_157663 ?auto_157662 ) ( ON ?auto_157664 ?auto_157663 ) ( not ( = ?auto_157660 ?auto_157661 ) ) ( not ( = ?auto_157660 ?auto_157662 ) ) ( not ( = ?auto_157660 ?auto_157663 ) ) ( not ( = ?auto_157660 ?auto_157664 ) ) ( not ( = ?auto_157660 ?auto_157665 ) ) ( not ( = ?auto_157660 ?auto_157666 ) ) ( not ( = ?auto_157661 ?auto_157662 ) ) ( not ( = ?auto_157661 ?auto_157663 ) ) ( not ( = ?auto_157661 ?auto_157664 ) ) ( not ( = ?auto_157661 ?auto_157665 ) ) ( not ( = ?auto_157661 ?auto_157666 ) ) ( not ( = ?auto_157662 ?auto_157663 ) ) ( not ( = ?auto_157662 ?auto_157664 ) ) ( not ( = ?auto_157662 ?auto_157665 ) ) ( not ( = ?auto_157662 ?auto_157666 ) ) ( not ( = ?auto_157663 ?auto_157664 ) ) ( not ( = ?auto_157663 ?auto_157665 ) ) ( not ( = ?auto_157663 ?auto_157666 ) ) ( not ( = ?auto_157664 ?auto_157665 ) ) ( not ( = ?auto_157664 ?auto_157666 ) ) ( not ( = ?auto_157665 ?auto_157666 ) ) ( ON ?auto_157666 ?auto_157667 ) ( not ( = ?auto_157660 ?auto_157667 ) ) ( not ( = ?auto_157661 ?auto_157667 ) ) ( not ( = ?auto_157662 ?auto_157667 ) ) ( not ( = ?auto_157663 ?auto_157667 ) ) ( not ( = ?auto_157664 ?auto_157667 ) ) ( not ( = ?auto_157665 ?auto_157667 ) ) ( not ( = ?auto_157666 ?auto_157667 ) ) ( CLEAR ?auto_157664 ) ( ON ?auto_157665 ?auto_157666 ) ( CLEAR ?auto_157665 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_157667 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_157667 ?auto_157666 )
      ( MAKE-7PILE ?auto_157660 ?auto_157661 ?auto_157662 ?auto_157663 ?auto_157664 ?auto_157665 ?auto_157666 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157668 - BLOCK
      ?auto_157669 - BLOCK
      ?auto_157670 - BLOCK
      ?auto_157671 - BLOCK
      ?auto_157672 - BLOCK
      ?auto_157673 - BLOCK
      ?auto_157674 - BLOCK
    )
    :vars
    (
      ?auto_157675 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157668 ) ( ON ?auto_157669 ?auto_157668 ) ( ON ?auto_157670 ?auto_157669 ) ( ON ?auto_157671 ?auto_157670 ) ( not ( = ?auto_157668 ?auto_157669 ) ) ( not ( = ?auto_157668 ?auto_157670 ) ) ( not ( = ?auto_157668 ?auto_157671 ) ) ( not ( = ?auto_157668 ?auto_157672 ) ) ( not ( = ?auto_157668 ?auto_157673 ) ) ( not ( = ?auto_157668 ?auto_157674 ) ) ( not ( = ?auto_157669 ?auto_157670 ) ) ( not ( = ?auto_157669 ?auto_157671 ) ) ( not ( = ?auto_157669 ?auto_157672 ) ) ( not ( = ?auto_157669 ?auto_157673 ) ) ( not ( = ?auto_157669 ?auto_157674 ) ) ( not ( = ?auto_157670 ?auto_157671 ) ) ( not ( = ?auto_157670 ?auto_157672 ) ) ( not ( = ?auto_157670 ?auto_157673 ) ) ( not ( = ?auto_157670 ?auto_157674 ) ) ( not ( = ?auto_157671 ?auto_157672 ) ) ( not ( = ?auto_157671 ?auto_157673 ) ) ( not ( = ?auto_157671 ?auto_157674 ) ) ( not ( = ?auto_157672 ?auto_157673 ) ) ( not ( = ?auto_157672 ?auto_157674 ) ) ( not ( = ?auto_157673 ?auto_157674 ) ) ( ON ?auto_157674 ?auto_157675 ) ( not ( = ?auto_157668 ?auto_157675 ) ) ( not ( = ?auto_157669 ?auto_157675 ) ) ( not ( = ?auto_157670 ?auto_157675 ) ) ( not ( = ?auto_157671 ?auto_157675 ) ) ( not ( = ?auto_157672 ?auto_157675 ) ) ( not ( = ?auto_157673 ?auto_157675 ) ) ( not ( = ?auto_157674 ?auto_157675 ) ) ( ON ?auto_157673 ?auto_157674 ) ( CLEAR ?auto_157673 ) ( ON-TABLE ?auto_157675 ) ( HOLDING ?auto_157672 ) ( CLEAR ?auto_157671 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_157668 ?auto_157669 ?auto_157670 ?auto_157671 ?auto_157672 )
      ( MAKE-7PILE ?auto_157668 ?auto_157669 ?auto_157670 ?auto_157671 ?auto_157672 ?auto_157673 ?auto_157674 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157676 - BLOCK
      ?auto_157677 - BLOCK
      ?auto_157678 - BLOCK
      ?auto_157679 - BLOCK
      ?auto_157680 - BLOCK
      ?auto_157681 - BLOCK
      ?auto_157682 - BLOCK
    )
    :vars
    (
      ?auto_157683 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157676 ) ( ON ?auto_157677 ?auto_157676 ) ( ON ?auto_157678 ?auto_157677 ) ( ON ?auto_157679 ?auto_157678 ) ( not ( = ?auto_157676 ?auto_157677 ) ) ( not ( = ?auto_157676 ?auto_157678 ) ) ( not ( = ?auto_157676 ?auto_157679 ) ) ( not ( = ?auto_157676 ?auto_157680 ) ) ( not ( = ?auto_157676 ?auto_157681 ) ) ( not ( = ?auto_157676 ?auto_157682 ) ) ( not ( = ?auto_157677 ?auto_157678 ) ) ( not ( = ?auto_157677 ?auto_157679 ) ) ( not ( = ?auto_157677 ?auto_157680 ) ) ( not ( = ?auto_157677 ?auto_157681 ) ) ( not ( = ?auto_157677 ?auto_157682 ) ) ( not ( = ?auto_157678 ?auto_157679 ) ) ( not ( = ?auto_157678 ?auto_157680 ) ) ( not ( = ?auto_157678 ?auto_157681 ) ) ( not ( = ?auto_157678 ?auto_157682 ) ) ( not ( = ?auto_157679 ?auto_157680 ) ) ( not ( = ?auto_157679 ?auto_157681 ) ) ( not ( = ?auto_157679 ?auto_157682 ) ) ( not ( = ?auto_157680 ?auto_157681 ) ) ( not ( = ?auto_157680 ?auto_157682 ) ) ( not ( = ?auto_157681 ?auto_157682 ) ) ( ON ?auto_157682 ?auto_157683 ) ( not ( = ?auto_157676 ?auto_157683 ) ) ( not ( = ?auto_157677 ?auto_157683 ) ) ( not ( = ?auto_157678 ?auto_157683 ) ) ( not ( = ?auto_157679 ?auto_157683 ) ) ( not ( = ?auto_157680 ?auto_157683 ) ) ( not ( = ?auto_157681 ?auto_157683 ) ) ( not ( = ?auto_157682 ?auto_157683 ) ) ( ON ?auto_157681 ?auto_157682 ) ( ON-TABLE ?auto_157683 ) ( CLEAR ?auto_157679 ) ( ON ?auto_157680 ?auto_157681 ) ( CLEAR ?auto_157680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_157683 ?auto_157682 ?auto_157681 )
      ( MAKE-7PILE ?auto_157676 ?auto_157677 ?auto_157678 ?auto_157679 ?auto_157680 ?auto_157681 ?auto_157682 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157684 - BLOCK
      ?auto_157685 - BLOCK
      ?auto_157686 - BLOCK
      ?auto_157687 - BLOCK
      ?auto_157688 - BLOCK
      ?auto_157689 - BLOCK
      ?auto_157690 - BLOCK
    )
    :vars
    (
      ?auto_157691 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157684 ) ( ON ?auto_157685 ?auto_157684 ) ( ON ?auto_157686 ?auto_157685 ) ( not ( = ?auto_157684 ?auto_157685 ) ) ( not ( = ?auto_157684 ?auto_157686 ) ) ( not ( = ?auto_157684 ?auto_157687 ) ) ( not ( = ?auto_157684 ?auto_157688 ) ) ( not ( = ?auto_157684 ?auto_157689 ) ) ( not ( = ?auto_157684 ?auto_157690 ) ) ( not ( = ?auto_157685 ?auto_157686 ) ) ( not ( = ?auto_157685 ?auto_157687 ) ) ( not ( = ?auto_157685 ?auto_157688 ) ) ( not ( = ?auto_157685 ?auto_157689 ) ) ( not ( = ?auto_157685 ?auto_157690 ) ) ( not ( = ?auto_157686 ?auto_157687 ) ) ( not ( = ?auto_157686 ?auto_157688 ) ) ( not ( = ?auto_157686 ?auto_157689 ) ) ( not ( = ?auto_157686 ?auto_157690 ) ) ( not ( = ?auto_157687 ?auto_157688 ) ) ( not ( = ?auto_157687 ?auto_157689 ) ) ( not ( = ?auto_157687 ?auto_157690 ) ) ( not ( = ?auto_157688 ?auto_157689 ) ) ( not ( = ?auto_157688 ?auto_157690 ) ) ( not ( = ?auto_157689 ?auto_157690 ) ) ( ON ?auto_157690 ?auto_157691 ) ( not ( = ?auto_157684 ?auto_157691 ) ) ( not ( = ?auto_157685 ?auto_157691 ) ) ( not ( = ?auto_157686 ?auto_157691 ) ) ( not ( = ?auto_157687 ?auto_157691 ) ) ( not ( = ?auto_157688 ?auto_157691 ) ) ( not ( = ?auto_157689 ?auto_157691 ) ) ( not ( = ?auto_157690 ?auto_157691 ) ) ( ON ?auto_157689 ?auto_157690 ) ( ON-TABLE ?auto_157691 ) ( ON ?auto_157688 ?auto_157689 ) ( CLEAR ?auto_157688 ) ( HOLDING ?auto_157687 ) ( CLEAR ?auto_157686 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_157684 ?auto_157685 ?auto_157686 ?auto_157687 )
      ( MAKE-7PILE ?auto_157684 ?auto_157685 ?auto_157686 ?auto_157687 ?auto_157688 ?auto_157689 ?auto_157690 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157692 - BLOCK
      ?auto_157693 - BLOCK
      ?auto_157694 - BLOCK
      ?auto_157695 - BLOCK
      ?auto_157696 - BLOCK
      ?auto_157697 - BLOCK
      ?auto_157698 - BLOCK
    )
    :vars
    (
      ?auto_157699 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157692 ) ( ON ?auto_157693 ?auto_157692 ) ( ON ?auto_157694 ?auto_157693 ) ( not ( = ?auto_157692 ?auto_157693 ) ) ( not ( = ?auto_157692 ?auto_157694 ) ) ( not ( = ?auto_157692 ?auto_157695 ) ) ( not ( = ?auto_157692 ?auto_157696 ) ) ( not ( = ?auto_157692 ?auto_157697 ) ) ( not ( = ?auto_157692 ?auto_157698 ) ) ( not ( = ?auto_157693 ?auto_157694 ) ) ( not ( = ?auto_157693 ?auto_157695 ) ) ( not ( = ?auto_157693 ?auto_157696 ) ) ( not ( = ?auto_157693 ?auto_157697 ) ) ( not ( = ?auto_157693 ?auto_157698 ) ) ( not ( = ?auto_157694 ?auto_157695 ) ) ( not ( = ?auto_157694 ?auto_157696 ) ) ( not ( = ?auto_157694 ?auto_157697 ) ) ( not ( = ?auto_157694 ?auto_157698 ) ) ( not ( = ?auto_157695 ?auto_157696 ) ) ( not ( = ?auto_157695 ?auto_157697 ) ) ( not ( = ?auto_157695 ?auto_157698 ) ) ( not ( = ?auto_157696 ?auto_157697 ) ) ( not ( = ?auto_157696 ?auto_157698 ) ) ( not ( = ?auto_157697 ?auto_157698 ) ) ( ON ?auto_157698 ?auto_157699 ) ( not ( = ?auto_157692 ?auto_157699 ) ) ( not ( = ?auto_157693 ?auto_157699 ) ) ( not ( = ?auto_157694 ?auto_157699 ) ) ( not ( = ?auto_157695 ?auto_157699 ) ) ( not ( = ?auto_157696 ?auto_157699 ) ) ( not ( = ?auto_157697 ?auto_157699 ) ) ( not ( = ?auto_157698 ?auto_157699 ) ) ( ON ?auto_157697 ?auto_157698 ) ( ON-TABLE ?auto_157699 ) ( ON ?auto_157696 ?auto_157697 ) ( CLEAR ?auto_157694 ) ( ON ?auto_157695 ?auto_157696 ) ( CLEAR ?auto_157695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_157699 ?auto_157698 ?auto_157697 ?auto_157696 )
      ( MAKE-7PILE ?auto_157692 ?auto_157693 ?auto_157694 ?auto_157695 ?auto_157696 ?auto_157697 ?auto_157698 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157700 - BLOCK
      ?auto_157701 - BLOCK
      ?auto_157702 - BLOCK
      ?auto_157703 - BLOCK
      ?auto_157704 - BLOCK
      ?auto_157705 - BLOCK
      ?auto_157706 - BLOCK
    )
    :vars
    (
      ?auto_157707 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157700 ) ( ON ?auto_157701 ?auto_157700 ) ( not ( = ?auto_157700 ?auto_157701 ) ) ( not ( = ?auto_157700 ?auto_157702 ) ) ( not ( = ?auto_157700 ?auto_157703 ) ) ( not ( = ?auto_157700 ?auto_157704 ) ) ( not ( = ?auto_157700 ?auto_157705 ) ) ( not ( = ?auto_157700 ?auto_157706 ) ) ( not ( = ?auto_157701 ?auto_157702 ) ) ( not ( = ?auto_157701 ?auto_157703 ) ) ( not ( = ?auto_157701 ?auto_157704 ) ) ( not ( = ?auto_157701 ?auto_157705 ) ) ( not ( = ?auto_157701 ?auto_157706 ) ) ( not ( = ?auto_157702 ?auto_157703 ) ) ( not ( = ?auto_157702 ?auto_157704 ) ) ( not ( = ?auto_157702 ?auto_157705 ) ) ( not ( = ?auto_157702 ?auto_157706 ) ) ( not ( = ?auto_157703 ?auto_157704 ) ) ( not ( = ?auto_157703 ?auto_157705 ) ) ( not ( = ?auto_157703 ?auto_157706 ) ) ( not ( = ?auto_157704 ?auto_157705 ) ) ( not ( = ?auto_157704 ?auto_157706 ) ) ( not ( = ?auto_157705 ?auto_157706 ) ) ( ON ?auto_157706 ?auto_157707 ) ( not ( = ?auto_157700 ?auto_157707 ) ) ( not ( = ?auto_157701 ?auto_157707 ) ) ( not ( = ?auto_157702 ?auto_157707 ) ) ( not ( = ?auto_157703 ?auto_157707 ) ) ( not ( = ?auto_157704 ?auto_157707 ) ) ( not ( = ?auto_157705 ?auto_157707 ) ) ( not ( = ?auto_157706 ?auto_157707 ) ) ( ON ?auto_157705 ?auto_157706 ) ( ON-TABLE ?auto_157707 ) ( ON ?auto_157704 ?auto_157705 ) ( ON ?auto_157703 ?auto_157704 ) ( CLEAR ?auto_157703 ) ( HOLDING ?auto_157702 ) ( CLEAR ?auto_157701 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_157700 ?auto_157701 ?auto_157702 )
      ( MAKE-7PILE ?auto_157700 ?auto_157701 ?auto_157702 ?auto_157703 ?auto_157704 ?auto_157705 ?auto_157706 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157708 - BLOCK
      ?auto_157709 - BLOCK
      ?auto_157710 - BLOCK
      ?auto_157711 - BLOCK
      ?auto_157712 - BLOCK
      ?auto_157713 - BLOCK
      ?auto_157714 - BLOCK
    )
    :vars
    (
      ?auto_157715 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157708 ) ( ON ?auto_157709 ?auto_157708 ) ( not ( = ?auto_157708 ?auto_157709 ) ) ( not ( = ?auto_157708 ?auto_157710 ) ) ( not ( = ?auto_157708 ?auto_157711 ) ) ( not ( = ?auto_157708 ?auto_157712 ) ) ( not ( = ?auto_157708 ?auto_157713 ) ) ( not ( = ?auto_157708 ?auto_157714 ) ) ( not ( = ?auto_157709 ?auto_157710 ) ) ( not ( = ?auto_157709 ?auto_157711 ) ) ( not ( = ?auto_157709 ?auto_157712 ) ) ( not ( = ?auto_157709 ?auto_157713 ) ) ( not ( = ?auto_157709 ?auto_157714 ) ) ( not ( = ?auto_157710 ?auto_157711 ) ) ( not ( = ?auto_157710 ?auto_157712 ) ) ( not ( = ?auto_157710 ?auto_157713 ) ) ( not ( = ?auto_157710 ?auto_157714 ) ) ( not ( = ?auto_157711 ?auto_157712 ) ) ( not ( = ?auto_157711 ?auto_157713 ) ) ( not ( = ?auto_157711 ?auto_157714 ) ) ( not ( = ?auto_157712 ?auto_157713 ) ) ( not ( = ?auto_157712 ?auto_157714 ) ) ( not ( = ?auto_157713 ?auto_157714 ) ) ( ON ?auto_157714 ?auto_157715 ) ( not ( = ?auto_157708 ?auto_157715 ) ) ( not ( = ?auto_157709 ?auto_157715 ) ) ( not ( = ?auto_157710 ?auto_157715 ) ) ( not ( = ?auto_157711 ?auto_157715 ) ) ( not ( = ?auto_157712 ?auto_157715 ) ) ( not ( = ?auto_157713 ?auto_157715 ) ) ( not ( = ?auto_157714 ?auto_157715 ) ) ( ON ?auto_157713 ?auto_157714 ) ( ON-TABLE ?auto_157715 ) ( ON ?auto_157712 ?auto_157713 ) ( ON ?auto_157711 ?auto_157712 ) ( CLEAR ?auto_157709 ) ( ON ?auto_157710 ?auto_157711 ) ( CLEAR ?auto_157710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_157715 ?auto_157714 ?auto_157713 ?auto_157712 ?auto_157711 )
      ( MAKE-7PILE ?auto_157708 ?auto_157709 ?auto_157710 ?auto_157711 ?auto_157712 ?auto_157713 ?auto_157714 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157716 - BLOCK
      ?auto_157717 - BLOCK
      ?auto_157718 - BLOCK
      ?auto_157719 - BLOCK
      ?auto_157720 - BLOCK
      ?auto_157721 - BLOCK
      ?auto_157722 - BLOCK
    )
    :vars
    (
      ?auto_157723 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157716 ) ( not ( = ?auto_157716 ?auto_157717 ) ) ( not ( = ?auto_157716 ?auto_157718 ) ) ( not ( = ?auto_157716 ?auto_157719 ) ) ( not ( = ?auto_157716 ?auto_157720 ) ) ( not ( = ?auto_157716 ?auto_157721 ) ) ( not ( = ?auto_157716 ?auto_157722 ) ) ( not ( = ?auto_157717 ?auto_157718 ) ) ( not ( = ?auto_157717 ?auto_157719 ) ) ( not ( = ?auto_157717 ?auto_157720 ) ) ( not ( = ?auto_157717 ?auto_157721 ) ) ( not ( = ?auto_157717 ?auto_157722 ) ) ( not ( = ?auto_157718 ?auto_157719 ) ) ( not ( = ?auto_157718 ?auto_157720 ) ) ( not ( = ?auto_157718 ?auto_157721 ) ) ( not ( = ?auto_157718 ?auto_157722 ) ) ( not ( = ?auto_157719 ?auto_157720 ) ) ( not ( = ?auto_157719 ?auto_157721 ) ) ( not ( = ?auto_157719 ?auto_157722 ) ) ( not ( = ?auto_157720 ?auto_157721 ) ) ( not ( = ?auto_157720 ?auto_157722 ) ) ( not ( = ?auto_157721 ?auto_157722 ) ) ( ON ?auto_157722 ?auto_157723 ) ( not ( = ?auto_157716 ?auto_157723 ) ) ( not ( = ?auto_157717 ?auto_157723 ) ) ( not ( = ?auto_157718 ?auto_157723 ) ) ( not ( = ?auto_157719 ?auto_157723 ) ) ( not ( = ?auto_157720 ?auto_157723 ) ) ( not ( = ?auto_157721 ?auto_157723 ) ) ( not ( = ?auto_157722 ?auto_157723 ) ) ( ON ?auto_157721 ?auto_157722 ) ( ON-TABLE ?auto_157723 ) ( ON ?auto_157720 ?auto_157721 ) ( ON ?auto_157719 ?auto_157720 ) ( ON ?auto_157718 ?auto_157719 ) ( CLEAR ?auto_157718 ) ( HOLDING ?auto_157717 ) ( CLEAR ?auto_157716 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_157716 ?auto_157717 )
      ( MAKE-7PILE ?auto_157716 ?auto_157717 ?auto_157718 ?auto_157719 ?auto_157720 ?auto_157721 ?auto_157722 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157724 - BLOCK
      ?auto_157725 - BLOCK
      ?auto_157726 - BLOCK
      ?auto_157727 - BLOCK
      ?auto_157728 - BLOCK
      ?auto_157729 - BLOCK
      ?auto_157730 - BLOCK
    )
    :vars
    (
      ?auto_157731 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157724 ) ( not ( = ?auto_157724 ?auto_157725 ) ) ( not ( = ?auto_157724 ?auto_157726 ) ) ( not ( = ?auto_157724 ?auto_157727 ) ) ( not ( = ?auto_157724 ?auto_157728 ) ) ( not ( = ?auto_157724 ?auto_157729 ) ) ( not ( = ?auto_157724 ?auto_157730 ) ) ( not ( = ?auto_157725 ?auto_157726 ) ) ( not ( = ?auto_157725 ?auto_157727 ) ) ( not ( = ?auto_157725 ?auto_157728 ) ) ( not ( = ?auto_157725 ?auto_157729 ) ) ( not ( = ?auto_157725 ?auto_157730 ) ) ( not ( = ?auto_157726 ?auto_157727 ) ) ( not ( = ?auto_157726 ?auto_157728 ) ) ( not ( = ?auto_157726 ?auto_157729 ) ) ( not ( = ?auto_157726 ?auto_157730 ) ) ( not ( = ?auto_157727 ?auto_157728 ) ) ( not ( = ?auto_157727 ?auto_157729 ) ) ( not ( = ?auto_157727 ?auto_157730 ) ) ( not ( = ?auto_157728 ?auto_157729 ) ) ( not ( = ?auto_157728 ?auto_157730 ) ) ( not ( = ?auto_157729 ?auto_157730 ) ) ( ON ?auto_157730 ?auto_157731 ) ( not ( = ?auto_157724 ?auto_157731 ) ) ( not ( = ?auto_157725 ?auto_157731 ) ) ( not ( = ?auto_157726 ?auto_157731 ) ) ( not ( = ?auto_157727 ?auto_157731 ) ) ( not ( = ?auto_157728 ?auto_157731 ) ) ( not ( = ?auto_157729 ?auto_157731 ) ) ( not ( = ?auto_157730 ?auto_157731 ) ) ( ON ?auto_157729 ?auto_157730 ) ( ON-TABLE ?auto_157731 ) ( ON ?auto_157728 ?auto_157729 ) ( ON ?auto_157727 ?auto_157728 ) ( ON ?auto_157726 ?auto_157727 ) ( CLEAR ?auto_157724 ) ( ON ?auto_157725 ?auto_157726 ) ( CLEAR ?auto_157725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_157731 ?auto_157730 ?auto_157729 ?auto_157728 ?auto_157727 ?auto_157726 )
      ( MAKE-7PILE ?auto_157724 ?auto_157725 ?auto_157726 ?auto_157727 ?auto_157728 ?auto_157729 ?auto_157730 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157732 - BLOCK
      ?auto_157733 - BLOCK
      ?auto_157734 - BLOCK
      ?auto_157735 - BLOCK
      ?auto_157736 - BLOCK
      ?auto_157737 - BLOCK
      ?auto_157738 - BLOCK
    )
    :vars
    (
      ?auto_157739 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157732 ?auto_157733 ) ) ( not ( = ?auto_157732 ?auto_157734 ) ) ( not ( = ?auto_157732 ?auto_157735 ) ) ( not ( = ?auto_157732 ?auto_157736 ) ) ( not ( = ?auto_157732 ?auto_157737 ) ) ( not ( = ?auto_157732 ?auto_157738 ) ) ( not ( = ?auto_157733 ?auto_157734 ) ) ( not ( = ?auto_157733 ?auto_157735 ) ) ( not ( = ?auto_157733 ?auto_157736 ) ) ( not ( = ?auto_157733 ?auto_157737 ) ) ( not ( = ?auto_157733 ?auto_157738 ) ) ( not ( = ?auto_157734 ?auto_157735 ) ) ( not ( = ?auto_157734 ?auto_157736 ) ) ( not ( = ?auto_157734 ?auto_157737 ) ) ( not ( = ?auto_157734 ?auto_157738 ) ) ( not ( = ?auto_157735 ?auto_157736 ) ) ( not ( = ?auto_157735 ?auto_157737 ) ) ( not ( = ?auto_157735 ?auto_157738 ) ) ( not ( = ?auto_157736 ?auto_157737 ) ) ( not ( = ?auto_157736 ?auto_157738 ) ) ( not ( = ?auto_157737 ?auto_157738 ) ) ( ON ?auto_157738 ?auto_157739 ) ( not ( = ?auto_157732 ?auto_157739 ) ) ( not ( = ?auto_157733 ?auto_157739 ) ) ( not ( = ?auto_157734 ?auto_157739 ) ) ( not ( = ?auto_157735 ?auto_157739 ) ) ( not ( = ?auto_157736 ?auto_157739 ) ) ( not ( = ?auto_157737 ?auto_157739 ) ) ( not ( = ?auto_157738 ?auto_157739 ) ) ( ON ?auto_157737 ?auto_157738 ) ( ON-TABLE ?auto_157739 ) ( ON ?auto_157736 ?auto_157737 ) ( ON ?auto_157735 ?auto_157736 ) ( ON ?auto_157734 ?auto_157735 ) ( ON ?auto_157733 ?auto_157734 ) ( CLEAR ?auto_157733 ) ( HOLDING ?auto_157732 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_157732 )
      ( MAKE-7PILE ?auto_157732 ?auto_157733 ?auto_157734 ?auto_157735 ?auto_157736 ?auto_157737 ?auto_157738 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157740 - BLOCK
      ?auto_157741 - BLOCK
      ?auto_157742 - BLOCK
      ?auto_157743 - BLOCK
      ?auto_157744 - BLOCK
      ?auto_157745 - BLOCK
      ?auto_157746 - BLOCK
    )
    :vars
    (
      ?auto_157747 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157740 ?auto_157741 ) ) ( not ( = ?auto_157740 ?auto_157742 ) ) ( not ( = ?auto_157740 ?auto_157743 ) ) ( not ( = ?auto_157740 ?auto_157744 ) ) ( not ( = ?auto_157740 ?auto_157745 ) ) ( not ( = ?auto_157740 ?auto_157746 ) ) ( not ( = ?auto_157741 ?auto_157742 ) ) ( not ( = ?auto_157741 ?auto_157743 ) ) ( not ( = ?auto_157741 ?auto_157744 ) ) ( not ( = ?auto_157741 ?auto_157745 ) ) ( not ( = ?auto_157741 ?auto_157746 ) ) ( not ( = ?auto_157742 ?auto_157743 ) ) ( not ( = ?auto_157742 ?auto_157744 ) ) ( not ( = ?auto_157742 ?auto_157745 ) ) ( not ( = ?auto_157742 ?auto_157746 ) ) ( not ( = ?auto_157743 ?auto_157744 ) ) ( not ( = ?auto_157743 ?auto_157745 ) ) ( not ( = ?auto_157743 ?auto_157746 ) ) ( not ( = ?auto_157744 ?auto_157745 ) ) ( not ( = ?auto_157744 ?auto_157746 ) ) ( not ( = ?auto_157745 ?auto_157746 ) ) ( ON ?auto_157746 ?auto_157747 ) ( not ( = ?auto_157740 ?auto_157747 ) ) ( not ( = ?auto_157741 ?auto_157747 ) ) ( not ( = ?auto_157742 ?auto_157747 ) ) ( not ( = ?auto_157743 ?auto_157747 ) ) ( not ( = ?auto_157744 ?auto_157747 ) ) ( not ( = ?auto_157745 ?auto_157747 ) ) ( not ( = ?auto_157746 ?auto_157747 ) ) ( ON ?auto_157745 ?auto_157746 ) ( ON-TABLE ?auto_157747 ) ( ON ?auto_157744 ?auto_157745 ) ( ON ?auto_157743 ?auto_157744 ) ( ON ?auto_157742 ?auto_157743 ) ( ON ?auto_157741 ?auto_157742 ) ( ON ?auto_157740 ?auto_157741 ) ( CLEAR ?auto_157740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_157747 ?auto_157746 ?auto_157745 ?auto_157744 ?auto_157743 ?auto_157742 ?auto_157741 )
      ( MAKE-7PILE ?auto_157740 ?auto_157741 ?auto_157742 ?auto_157743 ?auto_157744 ?auto_157745 ?auto_157746 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157748 - BLOCK
      ?auto_157749 - BLOCK
      ?auto_157750 - BLOCK
      ?auto_157751 - BLOCK
      ?auto_157752 - BLOCK
      ?auto_157753 - BLOCK
      ?auto_157754 - BLOCK
    )
    :vars
    (
      ?auto_157755 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157748 ?auto_157749 ) ) ( not ( = ?auto_157748 ?auto_157750 ) ) ( not ( = ?auto_157748 ?auto_157751 ) ) ( not ( = ?auto_157748 ?auto_157752 ) ) ( not ( = ?auto_157748 ?auto_157753 ) ) ( not ( = ?auto_157748 ?auto_157754 ) ) ( not ( = ?auto_157749 ?auto_157750 ) ) ( not ( = ?auto_157749 ?auto_157751 ) ) ( not ( = ?auto_157749 ?auto_157752 ) ) ( not ( = ?auto_157749 ?auto_157753 ) ) ( not ( = ?auto_157749 ?auto_157754 ) ) ( not ( = ?auto_157750 ?auto_157751 ) ) ( not ( = ?auto_157750 ?auto_157752 ) ) ( not ( = ?auto_157750 ?auto_157753 ) ) ( not ( = ?auto_157750 ?auto_157754 ) ) ( not ( = ?auto_157751 ?auto_157752 ) ) ( not ( = ?auto_157751 ?auto_157753 ) ) ( not ( = ?auto_157751 ?auto_157754 ) ) ( not ( = ?auto_157752 ?auto_157753 ) ) ( not ( = ?auto_157752 ?auto_157754 ) ) ( not ( = ?auto_157753 ?auto_157754 ) ) ( ON ?auto_157754 ?auto_157755 ) ( not ( = ?auto_157748 ?auto_157755 ) ) ( not ( = ?auto_157749 ?auto_157755 ) ) ( not ( = ?auto_157750 ?auto_157755 ) ) ( not ( = ?auto_157751 ?auto_157755 ) ) ( not ( = ?auto_157752 ?auto_157755 ) ) ( not ( = ?auto_157753 ?auto_157755 ) ) ( not ( = ?auto_157754 ?auto_157755 ) ) ( ON ?auto_157753 ?auto_157754 ) ( ON-TABLE ?auto_157755 ) ( ON ?auto_157752 ?auto_157753 ) ( ON ?auto_157751 ?auto_157752 ) ( ON ?auto_157750 ?auto_157751 ) ( ON ?auto_157749 ?auto_157750 ) ( HOLDING ?auto_157748 ) ( CLEAR ?auto_157749 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_157755 ?auto_157754 ?auto_157753 ?auto_157752 ?auto_157751 ?auto_157750 ?auto_157749 ?auto_157748 )
      ( MAKE-7PILE ?auto_157748 ?auto_157749 ?auto_157750 ?auto_157751 ?auto_157752 ?auto_157753 ?auto_157754 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157756 - BLOCK
      ?auto_157757 - BLOCK
      ?auto_157758 - BLOCK
      ?auto_157759 - BLOCK
      ?auto_157760 - BLOCK
      ?auto_157761 - BLOCK
      ?auto_157762 - BLOCK
    )
    :vars
    (
      ?auto_157763 - BLOCK
      ?auto_157764 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157756 ?auto_157757 ) ) ( not ( = ?auto_157756 ?auto_157758 ) ) ( not ( = ?auto_157756 ?auto_157759 ) ) ( not ( = ?auto_157756 ?auto_157760 ) ) ( not ( = ?auto_157756 ?auto_157761 ) ) ( not ( = ?auto_157756 ?auto_157762 ) ) ( not ( = ?auto_157757 ?auto_157758 ) ) ( not ( = ?auto_157757 ?auto_157759 ) ) ( not ( = ?auto_157757 ?auto_157760 ) ) ( not ( = ?auto_157757 ?auto_157761 ) ) ( not ( = ?auto_157757 ?auto_157762 ) ) ( not ( = ?auto_157758 ?auto_157759 ) ) ( not ( = ?auto_157758 ?auto_157760 ) ) ( not ( = ?auto_157758 ?auto_157761 ) ) ( not ( = ?auto_157758 ?auto_157762 ) ) ( not ( = ?auto_157759 ?auto_157760 ) ) ( not ( = ?auto_157759 ?auto_157761 ) ) ( not ( = ?auto_157759 ?auto_157762 ) ) ( not ( = ?auto_157760 ?auto_157761 ) ) ( not ( = ?auto_157760 ?auto_157762 ) ) ( not ( = ?auto_157761 ?auto_157762 ) ) ( ON ?auto_157762 ?auto_157763 ) ( not ( = ?auto_157756 ?auto_157763 ) ) ( not ( = ?auto_157757 ?auto_157763 ) ) ( not ( = ?auto_157758 ?auto_157763 ) ) ( not ( = ?auto_157759 ?auto_157763 ) ) ( not ( = ?auto_157760 ?auto_157763 ) ) ( not ( = ?auto_157761 ?auto_157763 ) ) ( not ( = ?auto_157762 ?auto_157763 ) ) ( ON ?auto_157761 ?auto_157762 ) ( ON-TABLE ?auto_157763 ) ( ON ?auto_157760 ?auto_157761 ) ( ON ?auto_157759 ?auto_157760 ) ( ON ?auto_157758 ?auto_157759 ) ( ON ?auto_157757 ?auto_157758 ) ( CLEAR ?auto_157757 ) ( ON ?auto_157756 ?auto_157764 ) ( CLEAR ?auto_157756 ) ( HAND-EMPTY ) ( not ( = ?auto_157756 ?auto_157764 ) ) ( not ( = ?auto_157757 ?auto_157764 ) ) ( not ( = ?auto_157758 ?auto_157764 ) ) ( not ( = ?auto_157759 ?auto_157764 ) ) ( not ( = ?auto_157760 ?auto_157764 ) ) ( not ( = ?auto_157761 ?auto_157764 ) ) ( not ( = ?auto_157762 ?auto_157764 ) ) ( not ( = ?auto_157763 ?auto_157764 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_157756 ?auto_157764 )
      ( MAKE-7PILE ?auto_157756 ?auto_157757 ?auto_157758 ?auto_157759 ?auto_157760 ?auto_157761 ?auto_157762 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157765 - BLOCK
      ?auto_157766 - BLOCK
      ?auto_157767 - BLOCK
      ?auto_157768 - BLOCK
      ?auto_157769 - BLOCK
      ?auto_157770 - BLOCK
      ?auto_157771 - BLOCK
    )
    :vars
    (
      ?auto_157773 - BLOCK
      ?auto_157772 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157765 ?auto_157766 ) ) ( not ( = ?auto_157765 ?auto_157767 ) ) ( not ( = ?auto_157765 ?auto_157768 ) ) ( not ( = ?auto_157765 ?auto_157769 ) ) ( not ( = ?auto_157765 ?auto_157770 ) ) ( not ( = ?auto_157765 ?auto_157771 ) ) ( not ( = ?auto_157766 ?auto_157767 ) ) ( not ( = ?auto_157766 ?auto_157768 ) ) ( not ( = ?auto_157766 ?auto_157769 ) ) ( not ( = ?auto_157766 ?auto_157770 ) ) ( not ( = ?auto_157766 ?auto_157771 ) ) ( not ( = ?auto_157767 ?auto_157768 ) ) ( not ( = ?auto_157767 ?auto_157769 ) ) ( not ( = ?auto_157767 ?auto_157770 ) ) ( not ( = ?auto_157767 ?auto_157771 ) ) ( not ( = ?auto_157768 ?auto_157769 ) ) ( not ( = ?auto_157768 ?auto_157770 ) ) ( not ( = ?auto_157768 ?auto_157771 ) ) ( not ( = ?auto_157769 ?auto_157770 ) ) ( not ( = ?auto_157769 ?auto_157771 ) ) ( not ( = ?auto_157770 ?auto_157771 ) ) ( ON ?auto_157771 ?auto_157773 ) ( not ( = ?auto_157765 ?auto_157773 ) ) ( not ( = ?auto_157766 ?auto_157773 ) ) ( not ( = ?auto_157767 ?auto_157773 ) ) ( not ( = ?auto_157768 ?auto_157773 ) ) ( not ( = ?auto_157769 ?auto_157773 ) ) ( not ( = ?auto_157770 ?auto_157773 ) ) ( not ( = ?auto_157771 ?auto_157773 ) ) ( ON ?auto_157770 ?auto_157771 ) ( ON-TABLE ?auto_157773 ) ( ON ?auto_157769 ?auto_157770 ) ( ON ?auto_157768 ?auto_157769 ) ( ON ?auto_157767 ?auto_157768 ) ( ON ?auto_157765 ?auto_157772 ) ( CLEAR ?auto_157765 ) ( not ( = ?auto_157765 ?auto_157772 ) ) ( not ( = ?auto_157766 ?auto_157772 ) ) ( not ( = ?auto_157767 ?auto_157772 ) ) ( not ( = ?auto_157768 ?auto_157772 ) ) ( not ( = ?auto_157769 ?auto_157772 ) ) ( not ( = ?auto_157770 ?auto_157772 ) ) ( not ( = ?auto_157771 ?auto_157772 ) ) ( not ( = ?auto_157773 ?auto_157772 ) ) ( HOLDING ?auto_157766 ) ( CLEAR ?auto_157767 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_157773 ?auto_157771 ?auto_157770 ?auto_157769 ?auto_157768 ?auto_157767 ?auto_157766 )
      ( MAKE-7PILE ?auto_157765 ?auto_157766 ?auto_157767 ?auto_157768 ?auto_157769 ?auto_157770 ?auto_157771 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157774 - BLOCK
      ?auto_157775 - BLOCK
      ?auto_157776 - BLOCK
      ?auto_157777 - BLOCK
      ?auto_157778 - BLOCK
      ?auto_157779 - BLOCK
      ?auto_157780 - BLOCK
    )
    :vars
    (
      ?auto_157781 - BLOCK
      ?auto_157782 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157774 ?auto_157775 ) ) ( not ( = ?auto_157774 ?auto_157776 ) ) ( not ( = ?auto_157774 ?auto_157777 ) ) ( not ( = ?auto_157774 ?auto_157778 ) ) ( not ( = ?auto_157774 ?auto_157779 ) ) ( not ( = ?auto_157774 ?auto_157780 ) ) ( not ( = ?auto_157775 ?auto_157776 ) ) ( not ( = ?auto_157775 ?auto_157777 ) ) ( not ( = ?auto_157775 ?auto_157778 ) ) ( not ( = ?auto_157775 ?auto_157779 ) ) ( not ( = ?auto_157775 ?auto_157780 ) ) ( not ( = ?auto_157776 ?auto_157777 ) ) ( not ( = ?auto_157776 ?auto_157778 ) ) ( not ( = ?auto_157776 ?auto_157779 ) ) ( not ( = ?auto_157776 ?auto_157780 ) ) ( not ( = ?auto_157777 ?auto_157778 ) ) ( not ( = ?auto_157777 ?auto_157779 ) ) ( not ( = ?auto_157777 ?auto_157780 ) ) ( not ( = ?auto_157778 ?auto_157779 ) ) ( not ( = ?auto_157778 ?auto_157780 ) ) ( not ( = ?auto_157779 ?auto_157780 ) ) ( ON ?auto_157780 ?auto_157781 ) ( not ( = ?auto_157774 ?auto_157781 ) ) ( not ( = ?auto_157775 ?auto_157781 ) ) ( not ( = ?auto_157776 ?auto_157781 ) ) ( not ( = ?auto_157777 ?auto_157781 ) ) ( not ( = ?auto_157778 ?auto_157781 ) ) ( not ( = ?auto_157779 ?auto_157781 ) ) ( not ( = ?auto_157780 ?auto_157781 ) ) ( ON ?auto_157779 ?auto_157780 ) ( ON-TABLE ?auto_157781 ) ( ON ?auto_157778 ?auto_157779 ) ( ON ?auto_157777 ?auto_157778 ) ( ON ?auto_157776 ?auto_157777 ) ( ON ?auto_157774 ?auto_157782 ) ( not ( = ?auto_157774 ?auto_157782 ) ) ( not ( = ?auto_157775 ?auto_157782 ) ) ( not ( = ?auto_157776 ?auto_157782 ) ) ( not ( = ?auto_157777 ?auto_157782 ) ) ( not ( = ?auto_157778 ?auto_157782 ) ) ( not ( = ?auto_157779 ?auto_157782 ) ) ( not ( = ?auto_157780 ?auto_157782 ) ) ( not ( = ?auto_157781 ?auto_157782 ) ) ( CLEAR ?auto_157776 ) ( ON ?auto_157775 ?auto_157774 ) ( CLEAR ?auto_157775 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_157782 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_157782 ?auto_157774 )
      ( MAKE-7PILE ?auto_157774 ?auto_157775 ?auto_157776 ?auto_157777 ?auto_157778 ?auto_157779 ?auto_157780 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157783 - BLOCK
      ?auto_157784 - BLOCK
      ?auto_157785 - BLOCK
      ?auto_157786 - BLOCK
      ?auto_157787 - BLOCK
      ?auto_157788 - BLOCK
      ?auto_157789 - BLOCK
    )
    :vars
    (
      ?auto_157791 - BLOCK
      ?auto_157790 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157783 ?auto_157784 ) ) ( not ( = ?auto_157783 ?auto_157785 ) ) ( not ( = ?auto_157783 ?auto_157786 ) ) ( not ( = ?auto_157783 ?auto_157787 ) ) ( not ( = ?auto_157783 ?auto_157788 ) ) ( not ( = ?auto_157783 ?auto_157789 ) ) ( not ( = ?auto_157784 ?auto_157785 ) ) ( not ( = ?auto_157784 ?auto_157786 ) ) ( not ( = ?auto_157784 ?auto_157787 ) ) ( not ( = ?auto_157784 ?auto_157788 ) ) ( not ( = ?auto_157784 ?auto_157789 ) ) ( not ( = ?auto_157785 ?auto_157786 ) ) ( not ( = ?auto_157785 ?auto_157787 ) ) ( not ( = ?auto_157785 ?auto_157788 ) ) ( not ( = ?auto_157785 ?auto_157789 ) ) ( not ( = ?auto_157786 ?auto_157787 ) ) ( not ( = ?auto_157786 ?auto_157788 ) ) ( not ( = ?auto_157786 ?auto_157789 ) ) ( not ( = ?auto_157787 ?auto_157788 ) ) ( not ( = ?auto_157787 ?auto_157789 ) ) ( not ( = ?auto_157788 ?auto_157789 ) ) ( ON ?auto_157789 ?auto_157791 ) ( not ( = ?auto_157783 ?auto_157791 ) ) ( not ( = ?auto_157784 ?auto_157791 ) ) ( not ( = ?auto_157785 ?auto_157791 ) ) ( not ( = ?auto_157786 ?auto_157791 ) ) ( not ( = ?auto_157787 ?auto_157791 ) ) ( not ( = ?auto_157788 ?auto_157791 ) ) ( not ( = ?auto_157789 ?auto_157791 ) ) ( ON ?auto_157788 ?auto_157789 ) ( ON-TABLE ?auto_157791 ) ( ON ?auto_157787 ?auto_157788 ) ( ON ?auto_157786 ?auto_157787 ) ( ON ?auto_157783 ?auto_157790 ) ( not ( = ?auto_157783 ?auto_157790 ) ) ( not ( = ?auto_157784 ?auto_157790 ) ) ( not ( = ?auto_157785 ?auto_157790 ) ) ( not ( = ?auto_157786 ?auto_157790 ) ) ( not ( = ?auto_157787 ?auto_157790 ) ) ( not ( = ?auto_157788 ?auto_157790 ) ) ( not ( = ?auto_157789 ?auto_157790 ) ) ( not ( = ?auto_157791 ?auto_157790 ) ) ( ON ?auto_157784 ?auto_157783 ) ( CLEAR ?auto_157784 ) ( ON-TABLE ?auto_157790 ) ( HOLDING ?auto_157785 ) ( CLEAR ?auto_157786 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_157791 ?auto_157789 ?auto_157788 ?auto_157787 ?auto_157786 ?auto_157785 )
      ( MAKE-7PILE ?auto_157783 ?auto_157784 ?auto_157785 ?auto_157786 ?auto_157787 ?auto_157788 ?auto_157789 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157792 - BLOCK
      ?auto_157793 - BLOCK
      ?auto_157794 - BLOCK
      ?auto_157795 - BLOCK
      ?auto_157796 - BLOCK
      ?auto_157797 - BLOCK
      ?auto_157798 - BLOCK
    )
    :vars
    (
      ?auto_157799 - BLOCK
      ?auto_157800 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157792 ?auto_157793 ) ) ( not ( = ?auto_157792 ?auto_157794 ) ) ( not ( = ?auto_157792 ?auto_157795 ) ) ( not ( = ?auto_157792 ?auto_157796 ) ) ( not ( = ?auto_157792 ?auto_157797 ) ) ( not ( = ?auto_157792 ?auto_157798 ) ) ( not ( = ?auto_157793 ?auto_157794 ) ) ( not ( = ?auto_157793 ?auto_157795 ) ) ( not ( = ?auto_157793 ?auto_157796 ) ) ( not ( = ?auto_157793 ?auto_157797 ) ) ( not ( = ?auto_157793 ?auto_157798 ) ) ( not ( = ?auto_157794 ?auto_157795 ) ) ( not ( = ?auto_157794 ?auto_157796 ) ) ( not ( = ?auto_157794 ?auto_157797 ) ) ( not ( = ?auto_157794 ?auto_157798 ) ) ( not ( = ?auto_157795 ?auto_157796 ) ) ( not ( = ?auto_157795 ?auto_157797 ) ) ( not ( = ?auto_157795 ?auto_157798 ) ) ( not ( = ?auto_157796 ?auto_157797 ) ) ( not ( = ?auto_157796 ?auto_157798 ) ) ( not ( = ?auto_157797 ?auto_157798 ) ) ( ON ?auto_157798 ?auto_157799 ) ( not ( = ?auto_157792 ?auto_157799 ) ) ( not ( = ?auto_157793 ?auto_157799 ) ) ( not ( = ?auto_157794 ?auto_157799 ) ) ( not ( = ?auto_157795 ?auto_157799 ) ) ( not ( = ?auto_157796 ?auto_157799 ) ) ( not ( = ?auto_157797 ?auto_157799 ) ) ( not ( = ?auto_157798 ?auto_157799 ) ) ( ON ?auto_157797 ?auto_157798 ) ( ON-TABLE ?auto_157799 ) ( ON ?auto_157796 ?auto_157797 ) ( ON ?auto_157795 ?auto_157796 ) ( ON ?auto_157792 ?auto_157800 ) ( not ( = ?auto_157792 ?auto_157800 ) ) ( not ( = ?auto_157793 ?auto_157800 ) ) ( not ( = ?auto_157794 ?auto_157800 ) ) ( not ( = ?auto_157795 ?auto_157800 ) ) ( not ( = ?auto_157796 ?auto_157800 ) ) ( not ( = ?auto_157797 ?auto_157800 ) ) ( not ( = ?auto_157798 ?auto_157800 ) ) ( not ( = ?auto_157799 ?auto_157800 ) ) ( ON ?auto_157793 ?auto_157792 ) ( ON-TABLE ?auto_157800 ) ( CLEAR ?auto_157795 ) ( ON ?auto_157794 ?auto_157793 ) ( CLEAR ?auto_157794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_157800 ?auto_157792 ?auto_157793 )
      ( MAKE-7PILE ?auto_157792 ?auto_157793 ?auto_157794 ?auto_157795 ?auto_157796 ?auto_157797 ?auto_157798 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157801 - BLOCK
      ?auto_157802 - BLOCK
      ?auto_157803 - BLOCK
      ?auto_157804 - BLOCK
      ?auto_157805 - BLOCK
      ?auto_157806 - BLOCK
      ?auto_157807 - BLOCK
    )
    :vars
    (
      ?auto_157809 - BLOCK
      ?auto_157808 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157801 ?auto_157802 ) ) ( not ( = ?auto_157801 ?auto_157803 ) ) ( not ( = ?auto_157801 ?auto_157804 ) ) ( not ( = ?auto_157801 ?auto_157805 ) ) ( not ( = ?auto_157801 ?auto_157806 ) ) ( not ( = ?auto_157801 ?auto_157807 ) ) ( not ( = ?auto_157802 ?auto_157803 ) ) ( not ( = ?auto_157802 ?auto_157804 ) ) ( not ( = ?auto_157802 ?auto_157805 ) ) ( not ( = ?auto_157802 ?auto_157806 ) ) ( not ( = ?auto_157802 ?auto_157807 ) ) ( not ( = ?auto_157803 ?auto_157804 ) ) ( not ( = ?auto_157803 ?auto_157805 ) ) ( not ( = ?auto_157803 ?auto_157806 ) ) ( not ( = ?auto_157803 ?auto_157807 ) ) ( not ( = ?auto_157804 ?auto_157805 ) ) ( not ( = ?auto_157804 ?auto_157806 ) ) ( not ( = ?auto_157804 ?auto_157807 ) ) ( not ( = ?auto_157805 ?auto_157806 ) ) ( not ( = ?auto_157805 ?auto_157807 ) ) ( not ( = ?auto_157806 ?auto_157807 ) ) ( ON ?auto_157807 ?auto_157809 ) ( not ( = ?auto_157801 ?auto_157809 ) ) ( not ( = ?auto_157802 ?auto_157809 ) ) ( not ( = ?auto_157803 ?auto_157809 ) ) ( not ( = ?auto_157804 ?auto_157809 ) ) ( not ( = ?auto_157805 ?auto_157809 ) ) ( not ( = ?auto_157806 ?auto_157809 ) ) ( not ( = ?auto_157807 ?auto_157809 ) ) ( ON ?auto_157806 ?auto_157807 ) ( ON-TABLE ?auto_157809 ) ( ON ?auto_157805 ?auto_157806 ) ( ON ?auto_157801 ?auto_157808 ) ( not ( = ?auto_157801 ?auto_157808 ) ) ( not ( = ?auto_157802 ?auto_157808 ) ) ( not ( = ?auto_157803 ?auto_157808 ) ) ( not ( = ?auto_157804 ?auto_157808 ) ) ( not ( = ?auto_157805 ?auto_157808 ) ) ( not ( = ?auto_157806 ?auto_157808 ) ) ( not ( = ?auto_157807 ?auto_157808 ) ) ( not ( = ?auto_157809 ?auto_157808 ) ) ( ON ?auto_157802 ?auto_157801 ) ( ON-TABLE ?auto_157808 ) ( ON ?auto_157803 ?auto_157802 ) ( CLEAR ?auto_157803 ) ( HOLDING ?auto_157804 ) ( CLEAR ?auto_157805 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_157809 ?auto_157807 ?auto_157806 ?auto_157805 ?auto_157804 )
      ( MAKE-7PILE ?auto_157801 ?auto_157802 ?auto_157803 ?auto_157804 ?auto_157805 ?auto_157806 ?auto_157807 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157810 - BLOCK
      ?auto_157811 - BLOCK
      ?auto_157812 - BLOCK
      ?auto_157813 - BLOCK
      ?auto_157814 - BLOCK
      ?auto_157815 - BLOCK
      ?auto_157816 - BLOCK
    )
    :vars
    (
      ?auto_157817 - BLOCK
      ?auto_157818 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157810 ?auto_157811 ) ) ( not ( = ?auto_157810 ?auto_157812 ) ) ( not ( = ?auto_157810 ?auto_157813 ) ) ( not ( = ?auto_157810 ?auto_157814 ) ) ( not ( = ?auto_157810 ?auto_157815 ) ) ( not ( = ?auto_157810 ?auto_157816 ) ) ( not ( = ?auto_157811 ?auto_157812 ) ) ( not ( = ?auto_157811 ?auto_157813 ) ) ( not ( = ?auto_157811 ?auto_157814 ) ) ( not ( = ?auto_157811 ?auto_157815 ) ) ( not ( = ?auto_157811 ?auto_157816 ) ) ( not ( = ?auto_157812 ?auto_157813 ) ) ( not ( = ?auto_157812 ?auto_157814 ) ) ( not ( = ?auto_157812 ?auto_157815 ) ) ( not ( = ?auto_157812 ?auto_157816 ) ) ( not ( = ?auto_157813 ?auto_157814 ) ) ( not ( = ?auto_157813 ?auto_157815 ) ) ( not ( = ?auto_157813 ?auto_157816 ) ) ( not ( = ?auto_157814 ?auto_157815 ) ) ( not ( = ?auto_157814 ?auto_157816 ) ) ( not ( = ?auto_157815 ?auto_157816 ) ) ( ON ?auto_157816 ?auto_157817 ) ( not ( = ?auto_157810 ?auto_157817 ) ) ( not ( = ?auto_157811 ?auto_157817 ) ) ( not ( = ?auto_157812 ?auto_157817 ) ) ( not ( = ?auto_157813 ?auto_157817 ) ) ( not ( = ?auto_157814 ?auto_157817 ) ) ( not ( = ?auto_157815 ?auto_157817 ) ) ( not ( = ?auto_157816 ?auto_157817 ) ) ( ON ?auto_157815 ?auto_157816 ) ( ON-TABLE ?auto_157817 ) ( ON ?auto_157814 ?auto_157815 ) ( ON ?auto_157810 ?auto_157818 ) ( not ( = ?auto_157810 ?auto_157818 ) ) ( not ( = ?auto_157811 ?auto_157818 ) ) ( not ( = ?auto_157812 ?auto_157818 ) ) ( not ( = ?auto_157813 ?auto_157818 ) ) ( not ( = ?auto_157814 ?auto_157818 ) ) ( not ( = ?auto_157815 ?auto_157818 ) ) ( not ( = ?auto_157816 ?auto_157818 ) ) ( not ( = ?auto_157817 ?auto_157818 ) ) ( ON ?auto_157811 ?auto_157810 ) ( ON-TABLE ?auto_157818 ) ( ON ?auto_157812 ?auto_157811 ) ( CLEAR ?auto_157814 ) ( ON ?auto_157813 ?auto_157812 ) ( CLEAR ?auto_157813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_157818 ?auto_157810 ?auto_157811 ?auto_157812 )
      ( MAKE-7PILE ?auto_157810 ?auto_157811 ?auto_157812 ?auto_157813 ?auto_157814 ?auto_157815 ?auto_157816 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157819 - BLOCK
      ?auto_157820 - BLOCK
      ?auto_157821 - BLOCK
      ?auto_157822 - BLOCK
      ?auto_157823 - BLOCK
      ?auto_157824 - BLOCK
      ?auto_157825 - BLOCK
    )
    :vars
    (
      ?auto_157827 - BLOCK
      ?auto_157826 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157819 ?auto_157820 ) ) ( not ( = ?auto_157819 ?auto_157821 ) ) ( not ( = ?auto_157819 ?auto_157822 ) ) ( not ( = ?auto_157819 ?auto_157823 ) ) ( not ( = ?auto_157819 ?auto_157824 ) ) ( not ( = ?auto_157819 ?auto_157825 ) ) ( not ( = ?auto_157820 ?auto_157821 ) ) ( not ( = ?auto_157820 ?auto_157822 ) ) ( not ( = ?auto_157820 ?auto_157823 ) ) ( not ( = ?auto_157820 ?auto_157824 ) ) ( not ( = ?auto_157820 ?auto_157825 ) ) ( not ( = ?auto_157821 ?auto_157822 ) ) ( not ( = ?auto_157821 ?auto_157823 ) ) ( not ( = ?auto_157821 ?auto_157824 ) ) ( not ( = ?auto_157821 ?auto_157825 ) ) ( not ( = ?auto_157822 ?auto_157823 ) ) ( not ( = ?auto_157822 ?auto_157824 ) ) ( not ( = ?auto_157822 ?auto_157825 ) ) ( not ( = ?auto_157823 ?auto_157824 ) ) ( not ( = ?auto_157823 ?auto_157825 ) ) ( not ( = ?auto_157824 ?auto_157825 ) ) ( ON ?auto_157825 ?auto_157827 ) ( not ( = ?auto_157819 ?auto_157827 ) ) ( not ( = ?auto_157820 ?auto_157827 ) ) ( not ( = ?auto_157821 ?auto_157827 ) ) ( not ( = ?auto_157822 ?auto_157827 ) ) ( not ( = ?auto_157823 ?auto_157827 ) ) ( not ( = ?auto_157824 ?auto_157827 ) ) ( not ( = ?auto_157825 ?auto_157827 ) ) ( ON ?auto_157824 ?auto_157825 ) ( ON-TABLE ?auto_157827 ) ( ON ?auto_157819 ?auto_157826 ) ( not ( = ?auto_157819 ?auto_157826 ) ) ( not ( = ?auto_157820 ?auto_157826 ) ) ( not ( = ?auto_157821 ?auto_157826 ) ) ( not ( = ?auto_157822 ?auto_157826 ) ) ( not ( = ?auto_157823 ?auto_157826 ) ) ( not ( = ?auto_157824 ?auto_157826 ) ) ( not ( = ?auto_157825 ?auto_157826 ) ) ( not ( = ?auto_157827 ?auto_157826 ) ) ( ON ?auto_157820 ?auto_157819 ) ( ON-TABLE ?auto_157826 ) ( ON ?auto_157821 ?auto_157820 ) ( ON ?auto_157822 ?auto_157821 ) ( CLEAR ?auto_157822 ) ( HOLDING ?auto_157823 ) ( CLEAR ?auto_157824 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_157827 ?auto_157825 ?auto_157824 ?auto_157823 )
      ( MAKE-7PILE ?auto_157819 ?auto_157820 ?auto_157821 ?auto_157822 ?auto_157823 ?auto_157824 ?auto_157825 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157828 - BLOCK
      ?auto_157829 - BLOCK
      ?auto_157830 - BLOCK
      ?auto_157831 - BLOCK
      ?auto_157832 - BLOCK
      ?auto_157833 - BLOCK
      ?auto_157834 - BLOCK
    )
    :vars
    (
      ?auto_157835 - BLOCK
      ?auto_157836 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157828 ?auto_157829 ) ) ( not ( = ?auto_157828 ?auto_157830 ) ) ( not ( = ?auto_157828 ?auto_157831 ) ) ( not ( = ?auto_157828 ?auto_157832 ) ) ( not ( = ?auto_157828 ?auto_157833 ) ) ( not ( = ?auto_157828 ?auto_157834 ) ) ( not ( = ?auto_157829 ?auto_157830 ) ) ( not ( = ?auto_157829 ?auto_157831 ) ) ( not ( = ?auto_157829 ?auto_157832 ) ) ( not ( = ?auto_157829 ?auto_157833 ) ) ( not ( = ?auto_157829 ?auto_157834 ) ) ( not ( = ?auto_157830 ?auto_157831 ) ) ( not ( = ?auto_157830 ?auto_157832 ) ) ( not ( = ?auto_157830 ?auto_157833 ) ) ( not ( = ?auto_157830 ?auto_157834 ) ) ( not ( = ?auto_157831 ?auto_157832 ) ) ( not ( = ?auto_157831 ?auto_157833 ) ) ( not ( = ?auto_157831 ?auto_157834 ) ) ( not ( = ?auto_157832 ?auto_157833 ) ) ( not ( = ?auto_157832 ?auto_157834 ) ) ( not ( = ?auto_157833 ?auto_157834 ) ) ( ON ?auto_157834 ?auto_157835 ) ( not ( = ?auto_157828 ?auto_157835 ) ) ( not ( = ?auto_157829 ?auto_157835 ) ) ( not ( = ?auto_157830 ?auto_157835 ) ) ( not ( = ?auto_157831 ?auto_157835 ) ) ( not ( = ?auto_157832 ?auto_157835 ) ) ( not ( = ?auto_157833 ?auto_157835 ) ) ( not ( = ?auto_157834 ?auto_157835 ) ) ( ON ?auto_157833 ?auto_157834 ) ( ON-TABLE ?auto_157835 ) ( ON ?auto_157828 ?auto_157836 ) ( not ( = ?auto_157828 ?auto_157836 ) ) ( not ( = ?auto_157829 ?auto_157836 ) ) ( not ( = ?auto_157830 ?auto_157836 ) ) ( not ( = ?auto_157831 ?auto_157836 ) ) ( not ( = ?auto_157832 ?auto_157836 ) ) ( not ( = ?auto_157833 ?auto_157836 ) ) ( not ( = ?auto_157834 ?auto_157836 ) ) ( not ( = ?auto_157835 ?auto_157836 ) ) ( ON ?auto_157829 ?auto_157828 ) ( ON-TABLE ?auto_157836 ) ( ON ?auto_157830 ?auto_157829 ) ( ON ?auto_157831 ?auto_157830 ) ( CLEAR ?auto_157833 ) ( ON ?auto_157832 ?auto_157831 ) ( CLEAR ?auto_157832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_157836 ?auto_157828 ?auto_157829 ?auto_157830 ?auto_157831 )
      ( MAKE-7PILE ?auto_157828 ?auto_157829 ?auto_157830 ?auto_157831 ?auto_157832 ?auto_157833 ?auto_157834 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157837 - BLOCK
      ?auto_157838 - BLOCK
      ?auto_157839 - BLOCK
      ?auto_157840 - BLOCK
      ?auto_157841 - BLOCK
      ?auto_157842 - BLOCK
      ?auto_157843 - BLOCK
    )
    :vars
    (
      ?auto_157844 - BLOCK
      ?auto_157845 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157837 ?auto_157838 ) ) ( not ( = ?auto_157837 ?auto_157839 ) ) ( not ( = ?auto_157837 ?auto_157840 ) ) ( not ( = ?auto_157837 ?auto_157841 ) ) ( not ( = ?auto_157837 ?auto_157842 ) ) ( not ( = ?auto_157837 ?auto_157843 ) ) ( not ( = ?auto_157838 ?auto_157839 ) ) ( not ( = ?auto_157838 ?auto_157840 ) ) ( not ( = ?auto_157838 ?auto_157841 ) ) ( not ( = ?auto_157838 ?auto_157842 ) ) ( not ( = ?auto_157838 ?auto_157843 ) ) ( not ( = ?auto_157839 ?auto_157840 ) ) ( not ( = ?auto_157839 ?auto_157841 ) ) ( not ( = ?auto_157839 ?auto_157842 ) ) ( not ( = ?auto_157839 ?auto_157843 ) ) ( not ( = ?auto_157840 ?auto_157841 ) ) ( not ( = ?auto_157840 ?auto_157842 ) ) ( not ( = ?auto_157840 ?auto_157843 ) ) ( not ( = ?auto_157841 ?auto_157842 ) ) ( not ( = ?auto_157841 ?auto_157843 ) ) ( not ( = ?auto_157842 ?auto_157843 ) ) ( ON ?auto_157843 ?auto_157844 ) ( not ( = ?auto_157837 ?auto_157844 ) ) ( not ( = ?auto_157838 ?auto_157844 ) ) ( not ( = ?auto_157839 ?auto_157844 ) ) ( not ( = ?auto_157840 ?auto_157844 ) ) ( not ( = ?auto_157841 ?auto_157844 ) ) ( not ( = ?auto_157842 ?auto_157844 ) ) ( not ( = ?auto_157843 ?auto_157844 ) ) ( ON-TABLE ?auto_157844 ) ( ON ?auto_157837 ?auto_157845 ) ( not ( = ?auto_157837 ?auto_157845 ) ) ( not ( = ?auto_157838 ?auto_157845 ) ) ( not ( = ?auto_157839 ?auto_157845 ) ) ( not ( = ?auto_157840 ?auto_157845 ) ) ( not ( = ?auto_157841 ?auto_157845 ) ) ( not ( = ?auto_157842 ?auto_157845 ) ) ( not ( = ?auto_157843 ?auto_157845 ) ) ( not ( = ?auto_157844 ?auto_157845 ) ) ( ON ?auto_157838 ?auto_157837 ) ( ON-TABLE ?auto_157845 ) ( ON ?auto_157839 ?auto_157838 ) ( ON ?auto_157840 ?auto_157839 ) ( ON ?auto_157841 ?auto_157840 ) ( CLEAR ?auto_157841 ) ( HOLDING ?auto_157842 ) ( CLEAR ?auto_157843 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_157844 ?auto_157843 ?auto_157842 )
      ( MAKE-7PILE ?auto_157837 ?auto_157838 ?auto_157839 ?auto_157840 ?auto_157841 ?auto_157842 ?auto_157843 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157846 - BLOCK
      ?auto_157847 - BLOCK
      ?auto_157848 - BLOCK
      ?auto_157849 - BLOCK
      ?auto_157850 - BLOCK
      ?auto_157851 - BLOCK
      ?auto_157852 - BLOCK
    )
    :vars
    (
      ?auto_157853 - BLOCK
      ?auto_157854 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157846 ?auto_157847 ) ) ( not ( = ?auto_157846 ?auto_157848 ) ) ( not ( = ?auto_157846 ?auto_157849 ) ) ( not ( = ?auto_157846 ?auto_157850 ) ) ( not ( = ?auto_157846 ?auto_157851 ) ) ( not ( = ?auto_157846 ?auto_157852 ) ) ( not ( = ?auto_157847 ?auto_157848 ) ) ( not ( = ?auto_157847 ?auto_157849 ) ) ( not ( = ?auto_157847 ?auto_157850 ) ) ( not ( = ?auto_157847 ?auto_157851 ) ) ( not ( = ?auto_157847 ?auto_157852 ) ) ( not ( = ?auto_157848 ?auto_157849 ) ) ( not ( = ?auto_157848 ?auto_157850 ) ) ( not ( = ?auto_157848 ?auto_157851 ) ) ( not ( = ?auto_157848 ?auto_157852 ) ) ( not ( = ?auto_157849 ?auto_157850 ) ) ( not ( = ?auto_157849 ?auto_157851 ) ) ( not ( = ?auto_157849 ?auto_157852 ) ) ( not ( = ?auto_157850 ?auto_157851 ) ) ( not ( = ?auto_157850 ?auto_157852 ) ) ( not ( = ?auto_157851 ?auto_157852 ) ) ( ON ?auto_157852 ?auto_157853 ) ( not ( = ?auto_157846 ?auto_157853 ) ) ( not ( = ?auto_157847 ?auto_157853 ) ) ( not ( = ?auto_157848 ?auto_157853 ) ) ( not ( = ?auto_157849 ?auto_157853 ) ) ( not ( = ?auto_157850 ?auto_157853 ) ) ( not ( = ?auto_157851 ?auto_157853 ) ) ( not ( = ?auto_157852 ?auto_157853 ) ) ( ON-TABLE ?auto_157853 ) ( ON ?auto_157846 ?auto_157854 ) ( not ( = ?auto_157846 ?auto_157854 ) ) ( not ( = ?auto_157847 ?auto_157854 ) ) ( not ( = ?auto_157848 ?auto_157854 ) ) ( not ( = ?auto_157849 ?auto_157854 ) ) ( not ( = ?auto_157850 ?auto_157854 ) ) ( not ( = ?auto_157851 ?auto_157854 ) ) ( not ( = ?auto_157852 ?auto_157854 ) ) ( not ( = ?auto_157853 ?auto_157854 ) ) ( ON ?auto_157847 ?auto_157846 ) ( ON-TABLE ?auto_157854 ) ( ON ?auto_157848 ?auto_157847 ) ( ON ?auto_157849 ?auto_157848 ) ( ON ?auto_157850 ?auto_157849 ) ( CLEAR ?auto_157852 ) ( ON ?auto_157851 ?auto_157850 ) ( CLEAR ?auto_157851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_157854 ?auto_157846 ?auto_157847 ?auto_157848 ?auto_157849 ?auto_157850 )
      ( MAKE-7PILE ?auto_157846 ?auto_157847 ?auto_157848 ?auto_157849 ?auto_157850 ?auto_157851 ?auto_157852 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157855 - BLOCK
      ?auto_157856 - BLOCK
      ?auto_157857 - BLOCK
      ?auto_157858 - BLOCK
      ?auto_157859 - BLOCK
      ?auto_157860 - BLOCK
      ?auto_157861 - BLOCK
    )
    :vars
    (
      ?auto_157863 - BLOCK
      ?auto_157862 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157855 ?auto_157856 ) ) ( not ( = ?auto_157855 ?auto_157857 ) ) ( not ( = ?auto_157855 ?auto_157858 ) ) ( not ( = ?auto_157855 ?auto_157859 ) ) ( not ( = ?auto_157855 ?auto_157860 ) ) ( not ( = ?auto_157855 ?auto_157861 ) ) ( not ( = ?auto_157856 ?auto_157857 ) ) ( not ( = ?auto_157856 ?auto_157858 ) ) ( not ( = ?auto_157856 ?auto_157859 ) ) ( not ( = ?auto_157856 ?auto_157860 ) ) ( not ( = ?auto_157856 ?auto_157861 ) ) ( not ( = ?auto_157857 ?auto_157858 ) ) ( not ( = ?auto_157857 ?auto_157859 ) ) ( not ( = ?auto_157857 ?auto_157860 ) ) ( not ( = ?auto_157857 ?auto_157861 ) ) ( not ( = ?auto_157858 ?auto_157859 ) ) ( not ( = ?auto_157858 ?auto_157860 ) ) ( not ( = ?auto_157858 ?auto_157861 ) ) ( not ( = ?auto_157859 ?auto_157860 ) ) ( not ( = ?auto_157859 ?auto_157861 ) ) ( not ( = ?auto_157860 ?auto_157861 ) ) ( not ( = ?auto_157855 ?auto_157863 ) ) ( not ( = ?auto_157856 ?auto_157863 ) ) ( not ( = ?auto_157857 ?auto_157863 ) ) ( not ( = ?auto_157858 ?auto_157863 ) ) ( not ( = ?auto_157859 ?auto_157863 ) ) ( not ( = ?auto_157860 ?auto_157863 ) ) ( not ( = ?auto_157861 ?auto_157863 ) ) ( ON-TABLE ?auto_157863 ) ( ON ?auto_157855 ?auto_157862 ) ( not ( = ?auto_157855 ?auto_157862 ) ) ( not ( = ?auto_157856 ?auto_157862 ) ) ( not ( = ?auto_157857 ?auto_157862 ) ) ( not ( = ?auto_157858 ?auto_157862 ) ) ( not ( = ?auto_157859 ?auto_157862 ) ) ( not ( = ?auto_157860 ?auto_157862 ) ) ( not ( = ?auto_157861 ?auto_157862 ) ) ( not ( = ?auto_157863 ?auto_157862 ) ) ( ON ?auto_157856 ?auto_157855 ) ( ON-TABLE ?auto_157862 ) ( ON ?auto_157857 ?auto_157856 ) ( ON ?auto_157858 ?auto_157857 ) ( ON ?auto_157859 ?auto_157858 ) ( ON ?auto_157860 ?auto_157859 ) ( CLEAR ?auto_157860 ) ( HOLDING ?auto_157861 ) ( CLEAR ?auto_157863 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_157863 ?auto_157861 )
      ( MAKE-7PILE ?auto_157855 ?auto_157856 ?auto_157857 ?auto_157858 ?auto_157859 ?auto_157860 ?auto_157861 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157864 - BLOCK
      ?auto_157865 - BLOCK
      ?auto_157866 - BLOCK
      ?auto_157867 - BLOCK
      ?auto_157868 - BLOCK
      ?auto_157869 - BLOCK
      ?auto_157870 - BLOCK
    )
    :vars
    (
      ?auto_157872 - BLOCK
      ?auto_157871 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157864 ?auto_157865 ) ) ( not ( = ?auto_157864 ?auto_157866 ) ) ( not ( = ?auto_157864 ?auto_157867 ) ) ( not ( = ?auto_157864 ?auto_157868 ) ) ( not ( = ?auto_157864 ?auto_157869 ) ) ( not ( = ?auto_157864 ?auto_157870 ) ) ( not ( = ?auto_157865 ?auto_157866 ) ) ( not ( = ?auto_157865 ?auto_157867 ) ) ( not ( = ?auto_157865 ?auto_157868 ) ) ( not ( = ?auto_157865 ?auto_157869 ) ) ( not ( = ?auto_157865 ?auto_157870 ) ) ( not ( = ?auto_157866 ?auto_157867 ) ) ( not ( = ?auto_157866 ?auto_157868 ) ) ( not ( = ?auto_157866 ?auto_157869 ) ) ( not ( = ?auto_157866 ?auto_157870 ) ) ( not ( = ?auto_157867 ?auto_157868 ) ) ( not ( = ?auto_157867 ?auto_157869 ) ) ( not ( = ?auto_157867 ?auto_157870 ) ) ( not ( = ?auto_157868 ?auto_157869 ) ) ( not ( = ?auto_157868 ?auto_157870 ) ) ( not ( = ?auto_157869 ?auto_157870 ) ) ( not ( = ?auto_157864 ?auto_157872 ) ) ( not ( = ?auto_157865 ?auto_157872 ) ) ( not ( = ?auto_157866 ?auto_157872 ) ) ( not ( = ?auto_157867 ?auto_157872 ) ) ( not ( = ?auto_157868 ?auto_157872 ) ) ( not ( = ?auto_157869 ?auto_157872 ) ) ( not ( = ?auto_157870 ?auto_157872 ) ) ( ON-TABLE ?auto_157872 ) ( ON ?auto_157864 ?auto_157871 ) ( not ( = ?auto_157864 ?auto_157871 ) ) ( not ( = ?auto_157865 ?auto_157871 ) ) ( not ( = ?auto_157866 ?auto_157871 ) ) ( not ( = ?auto_157867 ?auto_157871 ) ) ( not ( = ?auto_157868 ?auto_157871 ) ) ( not ( = ?auto_157869 ?auto_157871 ) ) ( not ( = ?auto_157870 ?auto_157871 ) ) ( not ( = ?auto_157872 ?auto_157871 ) ) ( ON ?auto_157865 ?auto_157864 ) ( ON-TABLE ?auto_157871 ) ( ON ?auto_157866 ?auto_157865 ) ( ON ?auto_157867 ?auto_157866 ) ( ON ?auto_157868 ?auto_157867 ) ( ON ?auto_157869 ?auto_157868 ) ( CLEAR ?auto_157872 ) ( ON ?auto_157870 ?auto_157869 ) ( CLEAR ?auto_157870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_157871 ?auto_157864 ?auto_157865 ?auto_157866 ?auto_157867 ?auto_157868 ?auto_157869 )
      ( MAKE-7PILE ?auto_157864 ?auto_157865 ?auto_157866 ?auto_157867 ?auto_157868 ?auto_157869 ?auto_157870 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157873 - BLOCK
      ?auto_157874 - BLOCK
      ?auto_157875 - BLOCK
      ?auto_157876 - BLOCK
      ?auto_157877 - BLOCK
      ?auto_157878 - BLOCK
      ?auto_157879 - BLOCK
    )
    :vars
    (
      ?auto_157881 - BLOCK
      ?auto_157880 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157873 ?auto_157874 ) ) ( not ( = ?auto_157873 ?auto_157875 ) ) ( not ( = ?auto_157873 ?auto_157876 ) ) ( not ( = ?auto_157873 ?auto_157877 ) ) ( not ( = ?auto_157873 ?auto_157878 ) ) ( not ( = ?auto_157873 ?auto_157879 ) ) ( not ( = ?auto_157874 ?auto_157875 ) ) ( not ( = ?auto_157874 ?auto_157876 ) ) ( not ( = ?auto_157874 ?auto_157877 ) ) ( not ( = ?auto_157874 ?auto_157878 ) ) ( not ( = ?auto_157874 ?auto_157879 ) ) ( not ( = ?auto_157875 ?auto_157876 ) ) ( not ( = ?auto_157875 ?auto_157877 ) ) ( not ( = ?auto_157875 ?auto_157878 ) ) ( not ( = ?auto_157875 ?auto_157879 ) ) ( not ( = ?auto_157876 ?auto_157877 ) ) ( not ( = ?auto_157876 ?auto_157878 ) ) ( not ( = ?auto_157876 ?auto_157879 ) ) ( not ( = ?auto_157877 ?auto_157878 ) ) ( not ( = ?auto_157877 ?auto_157879 ) ) ( not ( = ?auto_157878 ?auto_157879 ) ) ( not ( = ?auto_157873 ?auto_157881 ) ) ( not ( = ?auto_157874 ?auto_157881 ) ) ( not ( = ?auto_157875 ?auto_157881 ) ) ( not ( = ?auto_157876 ?auto_157881 ) ) ( not ( = ?auto_157877 ?auto_157881 ) ) ( not ( = ?auto_157878 ?auto_157881 ) ) ( not ( = ?auto_157879 ?auto_157881 ) ) ( ON ?auto_157873 ?auto_157880 ) ( not ( = ?auto_157873 ?auto_157880 ) ) ( not ( = ?auto_157874 ?auto_157880 ) ) ( not ( = ?auto_157875 ?auto_157880 ) ) ( not ( = ?auto_157876 ?auto_157880 ) ) ( not ( = ?auto_157877 ?auto_157880 ) ) ( not ( = ?auto_157878 ?auto_157880 ) ) ( not ( = ?auto_157879 ?auto_157880 ) ) ( not ( = ?auto_157881 ?auto_157880 ) ) ( ON ?auto_157874 ?auto_157873 ) ( ON-TABLE ?auto_157880 ) ( ON ?auto_157875 ?auto_157874 ) ( ON ?auto_157876 ?auto_157875 ) ( ON ?auto_157877 ?auto_157876 ) ( ON ?auto_157878 ?auto_157877 ) ( ON ?auto_157879 ?auto_157878 ) ( CLEAR ?auto_157879 ) ( HOLDING ?auto_157881 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_157881 )
      ( MAKE-7PILE ?auto_157873 ?auto_157874 ?auto_157875 ?auto_157876 ?auto_157877 ?auto_157878 ?auto_157879 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157882 - BLOCK
      ?auto_157883 - BLOCK
      ?auto_157884 - BLOCK
      ?auto_157885 - BLOCK
      ?auto_157886 - BLOCK
      ?auto_157887 - BLOCK
      ?auto_157888 - BLOCK
    )
    :vars
    (
      ?auto_157890 - BLOCK
      ?auto_157889 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157882 ?auto_157883 ) ) ( not ( = ?auto_157882 ?auto_157884 ) ) ( not ( = ?auto_157882 ?auto_157885 ) ) ( not ( = ?auto_157882 ?auto_157886 ) ) ( not ( = ?auto_157882 ?auto_157887 ) ) ( not ( = ?auto_157882 ?auto_157888 ) ) ( not ( = ?auto_157883 ?auto_157884 ) ) ( not ( = ?auto_157883 ?auto_157885 ) ) ( not ( = ?auto_157883 ?auto_157886 ) ) ( not ( = ?auto_157883 ?auto_157887 ) ) ( not ( = ?auto_157883 ?auto_157888 ) ) ( not ( = ?auto_157884 ?auto_157885 ) ) ( not ( = ?auto_157884 ?auto_157886 ) ) ( not ( = ?auto_157884 ?auto_157887 ) ) ( not ( = ?auto_157884 ?auto_157888 ) ) ( not ( = ?auto_157885 ?auto_157886 ) ) ( not ( = ?auto_157885 ?auto_157887 ) ) ( not ( = ?auto_157885 ?auto_157888 ) ) ( not ( = ?auto_157886 ?auto_157887 ) ) ( not ( = ?auto_157886 ?auto_157888 ) ) ( not ( = ?auto_157887 ?auto_157888 ) ) ( not ( = ?auto_157882 ?auto_157890 ) ) ( not ( = ?auto_157883 ?auto_157890 ) ) ( not ( = ?auto_157884 ?auto_157890 ) ) ( not ( = ?auto_157885 ?auto_157890 ) ) ( not ( = ?auto_157886 ?auto_157890 ) ) ( not ( = ?auto_157887 ?auto_157890 ) ) ( not ( = ?auto_157888 ?auto_157890 ) ) ( ON ?auto_157882 ?auto_157889 ) ( not ( = ?auto_157882 ?auto_157889 ) ) ( not ( = ?auto_157883 ?auto_157889 ) ) ( not ( = ?auto_157884 ?auto_157889 ) ) ( not ( = ?auto_157885 ?auto_157889 ) ) ( not ( = ?auto_157886 ?auto_157889 ) ) ( not ( = ?auto_157887 ?auto_157889 ) ) ( not ( = ?auto_157888 ?auto_157889 ) ) ( not ( = ?auto_157890 ?auto_157889 ) ) ( ON ?auto_157883 ?auto_157882 ) ( ON-TABLE ?auto_157889 ) ( ON ?auto_157884 ?auto_157883 ) ( ON ?auto_157885 ?auto_157884 ) ( ON ?auto_157886 ?auto_157885 ) ( ON ?auto_157887 ?auto_157886 ) ( ON ?auto_157888 ?auto_157887 ) ( ON ?auto_157890 ?auto_157888 ) ( CLEAR ?auto_157890 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_157889 ?auto_157882 ?auto_157883 ?auto_157884 ?auto_157885 ?auto_157886 ?auto_157887 ?auto_157888 )
      ( MAKE-7PILE ?auto_157882 ?auto_157883 ?auto_157884 ?auto_157885 ?auto_157886 ?auto_157887 ?auto_157888 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_157899 - BLOCK
      ?auto_157900 - BLOCK
      ?auto_157901 - BLOCK
      ?auto_157902 - BLOCK
      ?auto_157903 - BLOCK
      ?auto_157904 - BLOCK
      ?auto_157905 - BLOCK
      ?auto_157906 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_157906 ) ( CLEAR ?auto_157905 ) ( ON-TABLE ?auto_157899 ) ( ON ?auto_157900 ?auto_157899 ) ( ON ?auto_157901 ?auto_157900 ) ( ON ?auto_157902 ?auto_157901 ) ( ON ?auto_157903 ?auto_157902 ) ( ON ?auto_157904 ?auto_157903 ) ( ON ?auto_157905 ?auto_157904 ) ( not ( = ?auto_157899 ?auto_157900 ) ) ( not ( = ?auto_157899 ?auto_157901 ) ) ( not ( = ?auto_157899 ?auto_157902 ) ) ( not ( = ?auto_157899 ?auto_157903 ) ) ( not ( = ?auto_157899 ?auto_157904 ) ) ( not ( = ?auto_157899 ?auto_157905 ) ) ( not ( = ?auto_157899 ?auto_157906 ) ) ( not ( = ?auto_157900 ?auto_157901 ) ) ( not ( = ?auto_157900 ?auto_157902 ) ) ( not ( = ?auto_157900 ?auto_157903 ) ) ( not ( = ?auto_157900 ?auto_157904 ) ) ( not ( = ?auto_157900 ?auto_157905 ) ) ( not ( = ?auto_157900 ?auto_157906 ) ) ( not ( = ?auto_157901 ?auto_157902 ) ) ( not ( = ?auto_157901 ?auto_157903 ) ) ( not ( = ?auto_157901 ?auto_157904 ) ) ( not ( = ?auto_157901 ?auto_157905 ) ) ( not ( = ?auto_157901 ?auto_157906 ) ) ( not ( = ?auto_157902 ?auto_157903 ) ) ( not ( = ?auto_157902 ?auto_157904 ) ) ( not ( = ?auto_157902 ?auto_157905 ) ) ( not ( = ?auto_157902 ?auto_157906 ) ) ( not ( = ?auto_157903 ?auto_157904 ) ) ( not ( = ?auto_157903 ?auto_157905 ) ) ( not ( = ?auto_157903 ?auto_157906 ) ) ( not ( = ?auto_157904 ?auto_157905 ) ) ( not ( = ?auto_157904 ?auto_157906 ) ) ( not ( = ?auto_157905 ?auto_157906 ) ) )
    :subtasks
    ( ( !STACK ?auto_157906 ?auto_157905 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_157907 - BLOCK
      ?auto_157908 - BLOCK
      ?auto_157909 - BLOCK
      ?auto_157910 - BLOCK
      ?auto_157911 - BLOCK
      ?auto_157912 - BLOCK
      ?auto_157913 - BLOCK
      ?auto_157914 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_157913 ) ( ON-TABLE ?auto_157907 ) ( ON ?auto_157908 ?auto_157907 ) ( ON ?auto_157909 ?auto_157908 ) ( ON ?auto_157910 ?auto_157909 ) ( ON ?auto_157911 ?auto_157910 ) ( ON ?auto_157912 ?auto_157911 ) ( ON ?auto_157913 ?auto_157912 ) ( not ( = ?auto_157907 ?auto_157908 ) ) ( not ( = ?auto_157907 ?auto_157909 ) ) ( not ( = ?auto_157907 ?auto_157910 ) ) ( not ( = ?auto_157907 ?auto_157911 ) ) ( not ( = ?auto_157907 ?auto_157912 ) ) ( not ( = ?auto_157907 ?auto_157913 ) ) ( not ( = ?auto_157907 ?auto_157914 ) ) ( not ( = ?auto_157908 ?auto_157909 ) ) ( not ( = ?auto_157908 ?auto_157910 ) ) ( not ( = ?auto_157908 ?auto_157911 ) ) ( not ( = ?auto_157908 ?auto_157912 ) ) ( not ( = ?auto_157908 ?auto_157913 ) ) ( not ( = ?auto_157908 ?auto_157914 ) ) ( not ( = ?auto_157909 ?auto_157910 ) ) ( not ( = ?auto_157909 ?auto_157911 ) ) ( not ( = ?auto_157909 ?auto_157912 ) ) ( not ( = ?auto_157909 ?auto_157913 ) ) ( not ( = ?auto_157909 ?auto_157914 ) ) ( not ( = ?auto_157910 ?auto_157911 ) ) ( not ( = ?auto_157910 ?auto_157912 ) ) ( not ( = ?auto_157910 ?auto_157913 ) ) ( not ( = ?auto_157910 ?auto_157914 ) ) ( not ( = ?auto_157911 ?auto_157912 ) ) ( not ( = ?auto_157911 ?auto_157913 ) ) ( not ( = ?auto_157911 ?auto_157914 ) ) ( not ( = ?auto_157912 ?auto_157913 ) ) ( not ( = ?auto_157912 ?auto_157914 ) ) ( not ( = ?auto_157913 ?auto_157914 ) ) ( ON-TABLE ?auto_157914 ) ( CLEAR ?auto_157914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_157914 )
      ( MAKE-8PILE ?auto_157907 ?auto_157908 ?auto_157909 ?auto_157910 ?auto_157911 ?auto_157912 ?auto_157913 ?auto_157914 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_157915 - BLOCK
      ?auto_157916 - BLOCK
      ?auto_157917 - BLOCK
      ?auto_157918 - BLOCK
      ?auto_157919 - BLOCK
      ?auto_157920 - BLOCK
      ?auto_157921 - BLOCK
      ?auto_157922 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157915 ) ( ON ?auto_157916 ?auto_157915 ) ( ON ?auto_157917 ?auto_157916 ) ( ON ?auto_157918 ?auto_157917 ) ( ON ?auto_157919 ?auto_157918 ) ( ON ?auto_157920 ?auto_157919 ) ( not ( = ?auto_157915 ?auto_157916 ) ) ( not ( = ?auto_157915 ?auto_157917 ) ) ( not ( = ?auto_157915 ?auto_157918 ) ) ( not ( = ?auto_157915 ?auto_157919 ) ) ( not ( = ?auto_157915 ?auto_157920 ) ) ( not ( = ?auto_157915 ?auto_157921 ) ) ( not ( = ?auto_157915 ?auto_157922 ) ) ( not ( = ?auto_157916 ?auto_157917 ) ) ( not ( = ?auto_157916 ?auto_157918 ) ) ( not ( = ?auto_157916 ?auto_157919 ) ) ( not ( = ?auto_157916 ?auto_157920 ) ) ( not ( = ?auto_157916 ?auto_157921 ) ) ( not ( = ?auto_157916 ?auto_157922 ) ) ( not ( = ?auto_157917 ?auto_157918 ) ) ( not ( = ?auto_157917 ?auto_157919 ) ) ( not ( = ?auto_157917 ?auto_157920 ) ) ( not ( = ?auto_157917 ?auto_157921 ) ) ( not ( = ?auto_157917 ?auto_157922 ) ) ( not ( = ?auto_157918 ?auto_157919 ) ) ( not ( = ?auto_157918 ?auto_157920 ) ) ( not ( = ?auto_157918 ?auto_157921 ) ) ( not ( = ?auto_157918 ?auto_157922 ) ) ( not ( = ?auto_157919 ?auto_157920 ) ) ( not ( = ?auto_157919 ?auto_157921 ) ) ( not ( = ?auto_157919 ?auto_157922 ) ) ( not ( = ?auto_157920 ?auto_157921 ) ) ( not ( = ?auto_157920 ?auto_157922 ) ) ( not ( = ?auto_157921 ?auto_157922 ) ) ( ON-TABLE ?auto_157922 ) ( CLEAR ?auto_157922 ) ( HOLDING ?auto_157921 ) ( CLEAR ?auto_157920 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_157915 ?auto_157916 ?auto_157917 ?auto_157918 ?auto_157919 ?auto_157920 ?auto_157921 )
      ( MAKE-8PILE ?auto_157915 ?auto_157916 ?auto_157917 ?auto_157918 ?auto_157919 ?auto_157920 ?auto_157921 ?auto_157922 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_157923 - BLOCK
      ?auto_157924 - BLOCK
      ?auto_157925 - BLOCK
      ?auto_157926 - BLOCK
      ?auto_157927 - BLOCK
      ?auto_157928 - BLOCK
      ?auto_157929 - BLOCK
      ?auto_157930 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157923 ) ( ON ?auto_157924 ?auto_157923 ) ( ON ?auto_157925 ?auto_157924 ) ( ON ?auto_157926 ?auto_157925 ) ( ON ?auto_157927 ?auto_157926 ) ( ON ?auto_157928 ?auto_157927 ) ( not ( = ?auto_157923 ?auto_157924 ) ) ( not ( = ?auto_157923 ?auto_157925 ) ) ( not ( = ?auto_157923 ?auto_157926 ) ) ( not ( = ?auto_157923 ?auto_157927 ) ) ( not ( = ?auto_157923 ?auto_157928 ) ) ( not ( = ?auto_157923 ?auto_157929 ) ) ( not ( = ?auto_157923 ?auto_157930 ) ) ( not ( = ?auto_157924 ?auto_157925 ) ) ( not ( = ?auto_157924 ?auto_157926 ) ) ( not ( = ?auto_157924 ?auto_157927 ) ) ( not ( = ?auto_157924 ?auto_157928 ) ) ( not ( = ?auto_157924 ?auto_157929 ) ) ( not ( = ?auto_157924 ?auto_157930 ) ) ( not ( = ?auto_157925 ?auto_157926 ) ) ( not ( = ?auto_157925 ?auto_157927 ) ) ( not ( = ?auto_157925 ?auto_157928 ) ) ( not ( = ?auto_157925 ?auto_157929 ) ) ( not ( = ?auto_157925 ?auto_157930 ) ) ( not ( = ?auto_157926 ?auto_157927 ) ) ( not ( = ?auto_157926 ?auto_157928 ) ) ( not ( = ?auto_157926 ?auto_157929 ) ) ( not ( = ?auto_157926 ?auto_157930 ) ) ( not ( = ?auto_157927 ?auto_157928 ) ) ( not ( = ?auto_157927 ?auto_157929 ) ) ( not ( = ?auto_157927 ?auto_157930 ) ) ( not ( = ?auto_157928 ?auto_157929 ) ) ( not ( = ?auto_157928 ?auto_157930 ) ) ( not ( = ?auto_157929 ?auto_157930 ) ) ( ON-TABLE ?auto_157930 ) ( CLEAR ?auto_157928 ) ( ON ?auto_157929 ?auto_157930 ) ( CLEAR ?auto_157929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_157930 )
      ( MAKE-8PILE ?auto_157923 ?auto_157924 ?auto_157925 ?auto_157926 ?auto_157927 ?auto_157928 ?auto_157929 ?auto_157930 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_157931 - BLOCK
      ?auto_157932 - BLOCK
      ?auto_157933 - BLOCK
      ?auto_157934 - BLOCK
      ?auto_157935 - BLOCK
      ?auto_157936 - BLOCK
      ?auto_157937 - BLOCK
      ?auto_157938 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157931 ) ( ON ?auto_157932 ?auto_157931 ) ( ON ?auto_157933 ?auto_157932 ) ( ON ?auto_157934 ?auto_157933 ) ( ON ?auto_157935 ?auto_157934 ) ( not ( = ?auto_157931 ?auto_157932 ) ) ( not ( = ?auto_157931 ?auto_157933 ) ) ( not ( = ?auto_157931 ?auto_157934 ) ) ( not ( = ?auto_157931 ?auto_157935 ) ) ( not ( = ?auto_157931 ?auto_157936 ) ) ( not ( = ?auto_157931 ?auto_157937 ) ) ( not ( = ?auto_157931 ?auto_157938 ) ) ( not ( = ?auto_157932 ?auto_157933 ) ) ( not ( = ?auto_157932 ?auto_157934 ) ) ( not ( = ?auto_157932 ?auto_157935 ) ) ( not ( = ?auto_157932 ?auto_157936 ) ) ( not ( = ?auto_157932 ?auto_157937 ) ) ( not ( = ?auto_157932 ?auto_157938 ) ) ( not ( = ?auto_157933 ?auto_157934 ) ) ( not ( = ?auto_157933 ?auto_157935 ) ) ( not ( = ?auto_157933 ?auto_157936 ) ) ( not ( = ?auto_157933 ?auto_157937 ) ) ( not ( = ?auto_157933 ?auto_157938 ) ) ( not ( = ?auto_157934 ?auto_157935 ) ) ( not ( = ?auto_157934 ?auto_157936 ) ) ( not ( = ?auto_157934 ?auto_157937 ) ) ( not ( = ?auto_157934 ?auto_157938 ) ) ( not ( = ?auto_157935 ?auto_157936 ) ) ( not ( = ?auto_157935 ?auto_157937 ) ) ( not ( = ?auto_157935 ?auto_157938 ) ) ( not ( = ?auto_157936 ?auto_157937 ) ) ( not ( = ?auto_157936 ?auto_157938 ) ) ( not ( = ?auto_157937 ?auto_157938 ) ) ( ON-TABLE ?auto_157938 ) ( ON ?auto_157937 ?auto_157938 ) ( CLEAR ?auto_157937 ) ( HOLDING ?auto_157936 ) ( CLEAR ?auto_157935 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_157931 ?auto_157932 ?auto_157933 ?auto_157934 ?auto_157935 ?auto_157936 )
      ( MAKE-8PILE ?auto_157931 ?auto_157932 ?auto_157933 ?auto_157934 ?auto_157935 ?auto_157936 ?auto_157937 ?auto_157938 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_157939 - BLOCK
      ?auto_157940 - BLOCK
      ?auto_157941 - BLOCK
      ?auto_157942 - BLOCK
      ?auto_157943 - BLOCK
      ?auto_157944 - BLOCK
      ?auto_157945 - BLOCK
      ?auto_157946 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157939 ) ( ON ?auto_157940 ?auto_157939 ) ( ON ?auto_157941 ?auto_157940 ) ( ON ?auto_157942 ?auto_157941 ) ( ON ?auto_157943 ?auto_157942 ) ( not ( = ?auto_157939 ?auto_157940 ) ) ( not ( = ?auto_157939 ?auto_157941 ) ) ( not ( = ?auto_157939 ?auto_157942 ) ) ( not ( = ?auto_157939 ?auto_157943 ) ) ( not ( = ?auto_157939 ?auto_157944 ) ) ( not ( = ?auto_157939 ?auto_157945 ) ) ( not ( = ?auto_157939 ?auto_157946 ) ) ( not ( = ?auto_157940 ?auto_157941 ) ) ( not ( = ?auto_157940 ?auto_157942 ) ) ( not ( = ?auto_157940 ?auto_157943 ) ) ( not ( = ?auto_157940 ?auto_157944 ) ) ( not ( = ?auto_157940 ?auto_157945 ) ) ( not ( = ?auto_157940 ?auto_157946 ) ) ( not ( = ?auto_157941 ?auto_157942 ) ) ( not ( = ?auto_157941 ?auto_157943 ) ) ( not ( = ?auto_157941 ?auto_157944 ) ) ( not ( = ?auto_157941 ?auto_157945 ) ) ( not ( = ?auto_157941 ?auto_157946 ) ) ( not ( = ?auto_157942 ?auto_157943 ) ) ( not ( = ?auto_157942 ?auto_157944 ) ) ( not ( = ?auto_157942 ?auto_157945 ) ) ( not ( = ?auto_157942 ?auto_157946 ) ) ( not ( = ?auto_157943 ?auto_157944 ) ) ( not ( = ?auto_157943 ?auto_157945 ) ) ( not ( = ?auto_157943 ?auto_157946 ) ) ( not ( = ?auto_157944 ?auto_157945 ) ) ( not ( = ?auto_157944 ?auto_157946 ) ) ( not ( = ?auto_157945 ?auto_157946 ) ) ( ON-TABLE ?auto_157946 ) ( ON ?auto_157945 ?auto_157946 ) ( CLEAR ?auto_157943 ) ( ON ?auto_157944 ?auto_157945 ) ( CLEAR ?auto_157944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_157946 ?auto_157945 )
      ( MAKE-8PILE ?auto_157939 ?auto_157940 ?auto_157941 ?auto_157942 ?auto_157943 ?auto_157944 ?auto_157945 ?auto_157946 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_157947 - BLOCK
      ?auto_157948 - BLOCK
      ?auto_157949 - BLOCK
      ?auto_157950 - BLOCK
      ?auto_157951 - BLOCK
      ?auto_157952 - BLOCK
      ?auto_157953 - BLOCK
      ?auto_157954 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157947 ) ( ON ?auto_157948 ?auto_157947 ) ( ON ?auto_157949 ?auto_157948 ) ( ON ?auto_157950 ?auto_157949 ) ( not ( = ?auto_157947 ?auto_157948 ) ) ( not ( = ?auto_157947 ?auto_157949 ) ) ( not ( = ?auto_157947 ?auto_157950 ) ) ( not ( = ?auto_157947 ?auto_157951 ) ) ( not ( = ?auto_157947 ?auto_157952 ) ) ( not ( = ?auto_157947 ?auto_157953 ) ) ( not ( = ?auto_157947 ?auto_157954 ) ) ( not ( = ?auto_157948 ?auto_157949 ) ) ( not ( = ?auto_157948 ?auto_157950 ) ) ( not ( = ?auto_157948 ?auto_157951 ) ) ( not ( = ?auto_157948 ?auto_157952 ) ) ( not ( = ?auto_157948 ?auto_157953 ) ) ( not ( = ?auto_157948 ?auto_157954 ) ) ( not ( = ?auto_157949 ?auto_157950 ) ) ( not ( = ?auto_157949 ?auto_157951 ) ) ( not ( = ?auto_157949 ?auto_157952 ) ) ( not ( = ?auto_157949 ?auto_157953 ) ) ( not ( = ?auto_157949 ?auto_157954 ) ) ( not ( = ?auto_157950 ?auto_157951 ) ) ( not ( = ?auto_157950 ?auto_157952 ) ) ( not ( = ?auto_157950 ?auto_157953 ) ) ( not ( = ?auto_157950 ?auto_157954 ) ) ( not ( = ?auto_157951 ?auto_157952 ) ) ( not ( = ?auto_157951 ?auto_157953 ) ) ( not ( = ?auto_157951 ?auto_157954 ) ) ( not ( = ?auto_157952 ?auto_157953 ) ) ( not ( = ?auto_157952 ?auto_157954 ) ) ( not ( = ?auto_157953 ?auto_157954 ) ) ( ON-TABLE ?auto_157954 ) ( ON ?auto_157953 ?auto_157954 ) ( ON ?auto_157952 ?auto_157953 ) ( CLEAR ?auto_157952 ) ( HOLDING ?auto_157951 ) ( CLEAR ?auto_157950 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_157947 ?auto_157948 ?auto_157949 ?auto_157950 ?auto_157951 )
      ( MAKE-8PILE ?auto_157947 ?auto_157948 ?auto_157949 ?auto_157950 ?auto_157951 ?auto_157952 ?auto_157953 ?auto_157954 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_157955 - BLOCK
      ?auto_157956 - BLOCK
      ?auto_157957 - BLOCK
      ?auto_157958 - BLOCK
      ?auto_157959 - BLOCK
      ?auto_157960 - BLOCK
      ?auto_157961 - BLOCK
      ?auto_157962 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157955 ) ( ON ?auto_157956 ?auto_157955 ) ( ON ?auto_157957 ?auto_157956 ) ( ON ?auto_157958 ?auto_157957 ) ( not ( = ?auto_157955 ?auto_157956 ) ) ( not ( = ?auto_157955 ?auto_157957 ) ) ( not ( = ?auto_157955 ?auto_157958 ) ) ( not ( = ?auto_157955 ?auto_157959 ) ) ( not ( = ?auto_157955 ?auto_157960 ) ) ( not ( = ?auto_157955 ?auto_157961 ) ) ( not ( = ?auto_157955 ?auto_157962 ) ) ( not ( = ?auto_157956 ?auto_157957 ) ) ( not ( = ?auto_157956 ?auto_157958 ) ) ( not ( = ?auto_157956 ?auto_157959 ) ) ( not ( = ?auto_157956 ?auto_157960 ) ) ( not ( = ?auto_157956 ?auto_157961 ) ) ( not ( = ?auto_157956 ?auto_157962 ) ) ( not ( = ?auto_157957 ?auto_157958 ) ) ( not ( = ?auto_157957 ?auto_157959 ) ) ( not ( = ?auto_157957 ?auto_157960 ) ) ( not ( = ?auto_157957 ?auto_157961 ) ) ( not ( = ?auto_157957 ?auto_157962 ) ) ( not ( = ?auto_157958 ?auto_157959 ) ) ( not ( = ?auto_157958 ?auto_157960 ) ) ( not ( = ?auto_157958 ?auto_157961 ) ) ( not ( = ?auto_157958 ?auto_157962 ) ) ( not ( = ?auto_157959 ?auto_157960 ) ) ( not ( = ?auto_157959 ?auto_157961 ) ) ( not ( = ?auto_157959 ?auto_157962 ) ) ( not ( = ?auto_157960 ?auto_157961 ) ) ( not ( = ?auto_157960 ?auto_157962 ) ) ( not ( = ?auto_157961 ?auto_157962 ) ) ( ON-TABLE ?auto_157962 ) ( ON ?auto_157961 ?auto_157962 ) ( ON ?auto_157960 ?auto_157961 ) ( CLEAR ?auto_157958 ) ( ON ?auto_157959 ?auto_157960 ) ( CLEAR ?auto_157959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_157962 ?auto_157961 ?auto_157960 )
      ( MAKE-8PILE ?auto_157955 ?auto_157956 ?auto_157957 ?auto_157958 ?auto_157959 ?auto_157960 ?auto_157961 ?auto_157962 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_157963 - BLOCK
      ?auto_157964 - BLOCK
      ?auto_157965 - BLOCK
      ?auto_157966 - BLOCK
      ?auto_157967 - BLOCK
      ?auto_157968 - BLOCK
      ?auto_157969 - BLOCK
      ?auto_157970 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157963 ) ( ON ?auto_157964 ?auto_157963 ) ( ON ?auto_157965 ?auto_157964 ) ( not ( = ?auto_157963 ?auto_157964 ) ) ( not ( = ?auto_157963 ?auto_157965 ) ) ( not ( = ?auto_157963 ?auto_157966 ) ) ( not ( = ?auto_157963 ?auto_157967 ) ) ( not ( = ?auto_157963 ?auto_157968 ) ) ( not ( = ?auto_157963 ?auto_157969 ) ) ( not ( = ?auto_157963 ?auto_157970 ) ) ( not ( = ?auto_157964 ?auto_157965 ) ) ( not ( = ?auto_157964 ?auto_157966 ) ) ( not ( = ?auto_157964 ?auto_157967 ) ) ( not ( = ?auto_157964 ?auto_157968 ) ) ( not ( = ?auto_157964 ?auto_157969 ) ) ( not ( = ?auto_157964 ?auto_157970 ) ) ( not ( = ?auto_157965 ?auto_157966 ) ) ( not ( = ?auto_157965 ?auto_157967 ) ) ( not ( = ?auto_157965 ?auto_157968 ) ) ( not ( = ?auto_157965 ?auto_157969 ) ) ( not ( = ?auto_157965 ?auto_157970 ) ) ( not ( = ?auto_157966 ?auto_157967 ) ) ( not ( = ?auto_157966 ?auto_157968 ) ) ( not ( = ?auto_157966 ?auto_157969 ) ) ( not ( = ?auto_157966 ?auto_157970 ) ) ( not ( = ?auto_157967 ?auto_157968 ) ) ( not ( = ?auto_157967 ?auto_157969 ) ) ( not ( = ?auto_157967 ?auto_157970 ) ) ( not ( = ?auto_157968 ?auto_157969 ) ) ( not ( = ?auto_157968 ?auto_157970 ) ) ( not ( = ?auto_157969 ?auto_157970 ) ) ( ON-TABLE ?auto_157970 ) ( ON ?auto_157969 ?auto_157970 ) ( ON ?auto_157968 ?auto_157969 ) ( ON ?auto_157967 ?auto_157968 ) ( CLEAR ?auto_157967 ) ( HOLDING ?auto_157966 ) ( CLEAR ?auto_157965 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_157963 ?auto_157964 ?auto_157965 ?auto_157966 )
      ( MAKE-8PILE ?auto_157963 ?auto_157964 ?auto_157965 ?auto_157966 ?auto_157967 ?auto_157968 ?auto_157969 ?auto_157970 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_157971 - BLOCK
      ?auto_157972 - BLOCK
      ?auto_157973 - BLOCK
      ?auto_157974 - BLOCK
      ?auto_157975 - BLOCK
      ?auto_157976 - BLOCK
      ?auto_157977 - BLOCK
      ?auto_157978 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157971 ) ( ON ?auto_157972 ?auto_157971 ) ( ON ?auto_157973 ?auto_157972 ) ( not ( = ?auto_157971 ?auto_157972 ) ) ( not ( = ?auto_157971 ?auto_157973 ) ) ( not ( = ?auto_157971 ?auto_157974 ) ) ( not ( = ?auto_157971 ?auto_157975 ) ) ( not ( = ?auto_157971 ?auto_157976 ) ) ( not ( = ?auto_157971 ?auto_157977 ) ) ( not ( = ?auto_157971 ?auto_157978 ) ) ( not ( = ?auto_157972 ?auto_157973 ) ) ( not ( = ?auto_157972 ?auto_157974 ) ) ( not ( = ?auto_157972 ?auto_157975 ) ) ( not ( = ?auto_157972 ?auto_157976 ) ) ( not ( = ?auto_157972 ?auto_157977 ) ) ( not ( = ?auto_157972 ?auto_157978 ) ) ( not ( = ?auto_157973 ?auto_157974 ) ) ( not ( = ?auto_157973 ?auto_157975 ) ) ( not ( = ?auto_157973 ?auto_157976 ) ) ( not ( = ?auto_157973 ?auto_157977 ) ) ( not ( = ?auto_157973 ?auto_157978 ) ) ( not ( = ?auto_157974 ?auto_157975 ) ) ( not ( = ?auto_157974 ?auto_157976 ) ) ( not ( = ?auto_157974 ?auto_157977 ) ) ( not ( = ?auto_157974 ?auto_157978 ) ) ( not ( = ?auto_157975 ?auto_157976 ) ) ( not ( = ?auto_157975 ?auto_157977 ) ) ( not ( = ?auto_157975 ?auto_157978 ) ) ( not ( = ?auto_157976 ?auto_157977 ) ) ( not ( = ?auto_157976 ?auto_157978 ) ) ( not ( = ?auto_157977 ?auto_157978 ) ) ( ON-TABLE ?auto_157978 ) ( ON ?auto_157977 ?auto_157978 ) ( ON ?auto_157976 ?auto_157977 ) ( ON ?auto_157975 ?auto_157976 ) ( CLEAR ?auto_157973 ) ( ON ?auto_157974 ?auto_157975 ) ( CLEAR ?auto_157974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_157978 ?auto_157977 ?auto_157976 ?auto_157975 )
      ( MAKE-8PILE ?auto_157971 ?auto_157972 ?auto_157973 ?auto_157974 ?auto_157975 ?auto_157976 ?auto_157977 ?auto_157978 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_157979 - BLOCK
      ?auto_157980 - BLOCK
      ?auto_157981 - BLOCK
      ?auto_157982 - BLOCK
      ?auto_157983 - BLOCK
      ?auto_157984 - BLOCK
      ?auto_157985 - BLOCK
      ?auto_157986 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157979 ) ( ON ?auto_157980 ?auto_157979 ) ( not ( = ?auto_157979 ?auto_157980 ) ) ( not ( = ?auto_157979 ?auto_157981 ) ) ( not ( = ?auto_157979 ?auto_157982 ) ) ( not ( = ?auto_157979 ?auto_157983 ) ) ( not ( = ?auto_157979 ?auto_157984 ) ) ( not ( = ?auto_157979 ?auto_157985 ) ) ( not ( = ?auto_157979 ?auto_157986 ) ) ( not ( = ?auto_157980 ?auto_157981 ) ) ( not ( = ?auto_157980 ?auto_157982 ) ) ( not ( = ?auto_157980 ?auto_157983 ) ) ( not ( = ?auto_157980 ?auto_157984 ) ) ( not ( = ?auto_157980 ?auto_157985 ) ) ( not ( = ?auto_157980 ?auto_157986 ) ) ( not ( = ?auto_157981 ?auto_157982 ) ) ( not ( = ?auto_157981 ?auto_157983 ) ) ( not ( = ?auto_157981 ?auto_157984 ) ) ( not ( = ?auto_157981 ?auto_157985 ) ) ( not ( = ?auto_157981 ?auto_157986 ) ) ( not ( = ?auto_157982 ?auto_157983 ) ) ( not ( = ?auto_157982 ?auto_157984 ) ) ( not ( = ?auto_157982 ?auto_157985 ) ) ( not ( = ?auto_157982 ?auto_157986 ) ) ( not ( = ?auto_157983 ?auto_157984 ) ) ( not ( = ?auto_157983 ?auto_157985 ) ) ( not ( = ?auto_157983 ?auto_157986 ) ) ( not ( = ?auto_157984 ?auto_157985 ) ) ( not ( = ?auto_157984 ?auto_157986 ) ) ( not ( = ?auto_157985 ?auto_157986 ) ) ( ON-TABLE ?auto_157986 ) ( ON ?auto_157985 ?auto_157986 ) ( ON ?auto_157984 ?auto_157985 ) ( ON ?auto_157983 ?auto_157984 ) ( ON ?auto_157982 ?auto_157983 ) ( CLEAR ?auto_157982 ) ( HOLDING ?auto_157981 ) ( CLEAR ?auto_157980 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_157979 ?auto_157980 ?auto_157981 )
      ( MAKE-8PILE ?auto_157979 ?auto_157980 ?auto_157981 ?auto_157982 ?auto_157983 ?auto_157984 ?auto_157985 ?auto_157986 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_157987 - BLOCK
      ?auto_157988 - BLOCK
      ?auto_157989 - BLOCK
      ?auto_157990 - BLOCK
      ?auto_157991 - BLOCK
      ?auto_157992 - BLOCK
      ?auto_157993 - BLOCK
      ?auto_157994 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157987 ) ( ON ?auto_157988 ?auto_157987 ) ( not ( = ?auto_157987 ?auto_157988 ) ) ( not ( = ?auto_157987 ?auto_157989 ) ) ( not ( = ?auto_157987 ?auto_157990 ) ) ( not ( = ?auto_157987 ?auto_157991 ) ) ( not ( = ?auto_157987 ?auto_157992 ) ) ( not ( = ?auto_157987 ?auto_157993 ) ) ( not ( = ?auto_157987 ?auto_157994 ) ) ( not ( = ?auto_157988 ?auto_157989 ) ) ( not ( = ?auto_157988 ?auto_157990 ) ) ( not ( = ?auto_157988 ?auto_157991 ) ) ( not ( = ?auto_157988 ?auto_157992 ) ) ( not ( = ?auto_157988 ?auto_157993 ) ) ( not ( = ?auto_157988 ?auto_157994 ) ) ( not ( = ?auto_157989 ?auto_157990 ) ) ( not ( = ?auto_157989 ?auto_157991 ) ) ( not ( = ?auto_157989 ?auto_157992 ) ) ( not ( = ?auto_157989 ?auto_157993 ) ) ( not ( = ?auto_157989 ?auto_157994 ) ) ( not ( = ?auto_157990 ?auto_157991 ) ) ( not ( = ?auto_157990 ?auto_157992 ) ) ( not ( = ?auto_157990 ?auto_157993 ) ) ( not ( = ?auto_157990 ?auto_157994 ) ) ( not ( = ?auto_157991 ?auto_157992 ) ) ( not ( = ?auto_157991 ?auto_157993 ) ) ( not ( = ?auto_157991 ?auto_157994 ) ) ( not ( = ?auto_157992 ?auto_157993 ) ) ( not ( = ?auto_157992 ?auto_157994 ) ) ( not ( = ?auto_157993 ?auto_157994 ) ) ( ON-TABLE ?auto_157994 ) ( ON ?auto_157993 ?auto_157994 ) ( ON ?auto_157992 ?auto_157993 ) ( ON ?auto_157991 ?auto_157992 ) ( ON ?auto_157990 ?auto_157991 ) ( CLEAR ?auto_157988 ) ( ON ?auto_157989 ?auto_157990 ) ( CLEAR ?auto_157989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_157994 ?auto_157993 ?auto_157992 ?auto_157991 ?auto_157990 )
      ( MAKE-8PILE ?auto_157987 ?auto_157988 ?auto_157989 ?auto_157990 ?auto_157991 ?auto_157992 ?auto_157993 ?auto_157994 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_157995 - BLOCK
      ?auto_157996 - BLOCK
      ?auto_157997 - BLOCK
      ?auto_157998 - BLOCK
      ?auto_157999 - BLOCK
      ?auto_158000 - BLOCK
      ?auto_158001 - BLOCK
      ?auto_158002 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157995 ) ( not ( = ?auto_157995 ?auto_157996 ) ) ( not ( = ?auto_157995 ?auto_157997 ) ) ( not ( = ?auto_157995 ?auto_157998 ) ) ( not ( = ?auto_157995 ?auto_157999 ) ) ( not ( = ?auto_157995 ?auto_158000 ) ) ( not ( = ?auto_157995 ?auto_158001 ) ) ( not ( = ?auto_157995 ?auto_158002 ) ) ( not ( = ?auto_157996 ?auto_157997 ) ) ( not ( = ?auto_157996 ?auto_157998 ) ) ( not ( = ?auto_157996 ?auto_157999 ) ) ( not ( = ?auto_157996 ?auto_158000 ) ) ( not ( = ?auto_157996 ?auto_158001 ) ) ( not ( = ?auto_157996 ?auto_158002 ) ) ( not ( = ?auto_157997 ?auto_157998 ) ) ( not ( = ?auto_157997 ?auto_157999 ) ) ( not ( = ?auto_157997 ?auto_158000 ) ) ( not ( = ?auto_157997 ?auto_158001 ) ) ( not ( = ?auto_157997 ?auto_158002 ) ) ( not ( = ?auto_157998 ?auto_157999 ) ) ( not ( = ?auto_157998 ?auto_158000 ) ) ( not ( = ?auto_157998 ?auto_158001 ) ) ( not ( = ?auto_157998 ?auto_158002 ) ) ( not ( = ?auto_157999 ?auto_158000 ) ) ( not ( = ?auto_157999 ?auto_158001 ) ) ( not ( = ?auto_157999 ?auto_158002 ) ) ( not ( = ?auto_158000 ?auto_158001 ) ) ( not ( = ?auto_158000 ?auto_158002 ) ) ( not ( = ?auto_158001 ?auto_158002 ) ) ( ON-TABLE ?auto_158002 ) ( ON ?auto_158001 ?auto_158002 ) ( ON ?auto_158000 ?auto_158001 ) ( ON ?auto_157999 ?auto_158000 ) ( ON ?auto_157998 ?auto_157999 ) ( ON ?auto_157997 ?auto_157998 ) ( CLEAR ?auto_157997 ) ( HOLDING ?auto_157996 ) ( CLEAR ?auto_157995 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_157995 ?auto_157996 )
      ( MAKE-8PILE ?auto_157995 ?auto_157996 ?auto_157997 ?auto_157998 ?auto_157999 ?auto_158000 ?auto_158001 ?auto_158002 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_158003 - BLOCK
      ?auto_158004 - BLOCK
      ?auto_158005 - BLOCK
      ?auto_158006 - BLOCK
      ?auto_158007 - BLOCK
      ?auto_158008 - BLOCK
      ?auto_158009 - BLOCK
      ?auto_158010 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158003 ) ( not ( = ?auto_158003 ?auto_158004 ) ) ( not ( = ?auto_158003 ?auto_158005 ) ) ( not ( = ?auto_158003 ?auto_158006 ) ) ( not ( = ?auto_158003 ?auto_158007 ) ) ( not ( = ?auto_158003 ?auto_158008 ) ) ( not ( = ?auto_158003 ?auto_158009 ) ) ( not ( = ?auto_158003 ?auto_158010 ) ) ( not ( = ?auto_158004 ?auto_158005 ) ) ( not ( = ?auto_158004 ?auto_158006 ) ) ( not ( = ?auto_158004 ?auto_158007 ) ) ( not ( = ?auto_158004 ?auto_158008 ) ) ( not ( = ?auto_158004 ?auto_158009 ) ) ( not ( = ?auto_158004 ?auto_158010 ) ) ( not ( = ?auto_158005 ?auto_158006 ) ) ( not ( = ?auto_158005 ?auto_158007 ) ) ( not ( = ?auto_158005 ?auto_158008 ) ) ( not ( = ?auto_158005 ?auto_158009 ) ) ( not ( = ?auto_158005 ?auto_158010 ) ) ( not ( = ?auto_158006 ?auto_158007 ) ) ( not ( = ?auto_158006 ?auto_158008 ) ) ( not ( = ?auto_158006 ?auto_158009 ) ) ( not ( = ?auto_158006 ?auto_158010 ) ) ( not ( = ?auto_158007 ?auto_158008 ) ) ( not ( = ?auto_158007 ?auto_158009 ) ) ( not ( = ?auto_158007 ?auto_158010 ) ) ( not ( = ?auto_158008 ?auto_158009 ) ) ( not ( = ?auto_158008 ?auto_158010 ) ) ( not ( = ?auto_158009 ?auto_158010 ) ) ( ON-TABLE ?auto_158010 ) ( ON ?auto_158009 ?auto_158010 ) ( ON ?auto_158008 ?auto_158009 ) ( ON ?auto_158007 ?auto_158008 ) ( ON ?auto_158006 ?auto_158007 ) ( ON ?auto_158005 ?auto_158006 ) ( CLEAR ?auto_158003 ) ( ON ?auto_158004 ?auto_158005 ) ( CLEAR ?auto_158004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_158010 ?auto_158009 ?auto_158008 ?auto_158007 ?auto_158006 ?auto_158005 )
      ( MAKE-8PILE ?auto_158003 ?auto_158004 ?auto_158005 ?auto_158006 ?auto_158007 ?auto_158008 ?auto_158009 ?auto_158010 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_158011 - BLOCK
      ?auto_158012 - BLOCK
      ?auto_158013 - BLOCK
      ?auto_158014 - BLOCK
      ?auto_158015 - BLOCK
      ?auto_158016 - BLOCK
      ?auto_158017 - BLOCK
      ?auto_158018 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158011 ?auto_158012 ) ) ( not ( = ?auto_158011 ?auto_158013 ) ) ( not ( = ?auto_158011 ?auto_158014 ) ) ( not ( = ?auto_158011 ?auto_158015 ) ) ( not ( = ?auto_158011 ?auto_158016 ) ) ( not ( = ?auto_158011 ?auto_158017 ) ) ( not ( = ?auto_158011 ?auto_158018 ) ) ( not ( = ?auto_158012 ?auto_158013 ) ) ( not ( = ?auto_158012 ?auto_158014 ) ) ( not ( = ?auto_158012 ?auto_158015 ) ) ( not ( = ?auto_158012 ?auto_158016 ) ) ( not ( = ?auto_158012 ?auto_158017 ) ) ( not ( = ?auto_158012 ?auto_158018 ) ) ( not ( = ?auto_158013 ?auto_158014 ) ) ( not ( = ?auto_158013 ?auto_158015 ) ) ( not ( = ?auto_158013 ?auto_158016 ) ) ( not ( = ?auto_158013 ?auto_158017 ) ) ( not ( = ?auto_158013 ?auto_158018 ) ) ( not ( = ?auto_158014 ?auto_158015 ) ) ( not ( = ?auto_158014 ?auto_158016 ) ) ( not ( = ?auto_158014 ?auto_158017 ) ) ( not ( = ?auto_158014 ?auto_158018 ) ) ( not ( = ?auto_158015 ?auto_158016 ) ) ( not ( = ?auto_158015 ?auto_158017 ) ) ( not ( = ?auto_158015 ?auto_158018 ) ) ( not ( = ?auto_158016 ?auto_158017 ) ) ( not ( = ?auto_158016 ?auto_158018 ) ) ( not ( = ?auto_158017 ?auto_158018 ) ) ( ON-TABLE ?auto_158018 ) ( ON ?auto_158017 ?auto_158018 ) ( ON ?auto_158016 ?auto_158017 ) ( ON ?auto_158015 ?auto_158016 ) ( ON ?auto_158014 ?auto_158015 ) ( ON ?auto_158013 ?auto_158014 ) ( ON ?auto_158012 ?auto_158013 ) ( CLEAR ?auto_158012 ) ( HOLDING ?auto_158011 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_158011 )
      ( MAKE-8PILE ?auto_158011 ?auto_158012 ?auto_158013 ?auto_158014 ?auto_158015 ?auto_158016 ?auto_158017 ?auto_158018 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_158019 - BLOCK
      ?auto_158020 - BLOCK
      ?auto_158021 - BLOCK
      ?auto_158022 - BLOCK
      ?auto_158023 - BLOCK
      ?auto_158024 - BLOCK
      ?auto_158025 - BLOCK
      ?auto_158026 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158019 ?auto_158020 ) ) ( not ( = ?auto_158019 ?auto_158021 ) ) ( not ( = ?auto_158019 ?auto_158022 ) ) ( not ( = ?auto_158019 ?auto_158023 ) ) ( not ( = ?auto_158019 ?auto_158024 ) ) ( not ( = ?auto_158019 ?auto_158025 ) ) ( not ( = ?auto_158019 ?auto_158026 ) ) ( not ( = ?auto_158020 ?auto_158021 ) ) ( not ( = ?auto_158020 ?auto_158022 ) ) ( not ( = ?auto_158020 ?auto_158023 ) ) ( not ( = ?auto_158020 ?auto_158024 ) ) ( not ( = ?auto_158020 ?auto_158025 ) ) ( not ( = ?auto_158020 ?auto_158026 ) ) ( not ( = ?auto_158021 ?auto_158022 ) ) ( not ( = ?auto_158021 ?auto_158023 ) ) ( not ( = ?auto_158021 ?auto_158024 ) ) ( not ( = ?auto_158021 ?auto_158025 ) ) ( not ( = ?auto_158021 ?auto_158026 ) ) ( not ( = ?auto_158022 ?auto_158023 ) ) ( not ( = ?auto_158022 ?auto_158024 ) ) ( not ( = ?auto_158022 ?auto_158025 ) ) ( not ( = ?auto_158022 ?auto_158026 ) ) ( not ( = ?auto_158023 ?auto_158024 ) ) ( not ( = ?auto_158023 ?auto_158025 ) ) ( not ( = ?auto_158023 ?auto_158026 ) ) ( not ( = ?auto_158024 ?auto_158025 ) ) ( not ( = ?auto_158024 ?auto_158026 ) ) ( not ( = ?auto_158025 ?auto_158026 ) ) ( ON-TABLE ?auto_158026 ) ( ON ?auto_158025 ?auto_158026 ) ( ON ?auto_158024 ?auto_158025 ) ( ON ?auto_158023 ?auto_158024 ) ( ON ?auto_158022 ?auto_158023 ) ( ON ?auto_158021 ?auto_158022 ) ( ON ?auto_158020 ?auto_158021 ) ( ON ?auto_158019 ?auto_158020 ) ( CLEAR ?auto_158019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_158026 ?auto_158025 ?auto_158024 ?auto_158023 ?auto_158022 ?auto_158021 ?auto_158020 )
      ( MAKE-8PILE ?auto_158019 ?auto_158020 ?auto_158021 ?auto_158022 ?auto_158023 ?auto_158024 ?auto_158025 ?auto_158026 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_158027 - BLOCK
      ?auto_158028 - BLOCK
      ?auto_158029 - BLOCK
      ?auto_158030 - BLOCK
      ?auto_158031 - BLOCK
      ?auto_158032 - BLOCK
      ?auto_158033 - BLOCK
      ?auto_158034 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158027 ?auto_158028 ) ) ( not ( = ?auto_158027 ?auto_158029 ) ) ( not ( = ?auto_158027 ?auto_158030 ) ) ( not ( = ?auto_158027 ?auto_158031 ) ) ( not ( = ?auto_158027 ?auto_158032 ) ) ( not ( = ?auto_158027 ?auto_158033 ) ) ( not ( = ?auto_158027 ?auto_158034 ) ) ( not ( = ?auto_158028 ?auto_158029 ) ) ( not ( = ?auto_158028 ?auto_158030 ) ) ( not ( = ?auto_158028 ?auto_158031 ) ) ( not ( = ?auto_158028 ?auto_158032 ) ) ( not ( = ?auto_158028 ?auto_158033 ) ) ( not ( = ?auto_158028 ?auto_158034 ) ) ( not ( = ?auto_158029 ?auto_158030 ) ) ( not ( = ?auto_158029 ?auto_158031 ) ) ( not ( = ?auto_158029 ?auto_158032 ) ) ( not ( = ?auto_158029 ?auto_158033 ) ) ( not ( = ?auto_158029 ?auto_158034 ) ) ( not ( = ?auto_158030 ?auto_158031 ) ) ( not ( = ?auto_158030 ?auto_158032 ) ) ( not ( = ?auto_158030 ?auto_158033 ) ) ( not ( = ?auto_158030 ?auto_158034 ) ) ( not ( = ?auto_158031 ?auto_158032 ) ) ( not ( = ?auto_158031 ?auto_158033 ) ) ( not ( = ?auto_158031 ?auto_158034 ) ) ( not ( = ?auto_158032 ?auto_158033 ) ) ( not ( = ?auto_158032 ?auto_158034 ) ) ( not ( = ?auto_158033 ?auto_158034 ) ) ( ON-TABLE ?auto_158034 ) ( ON ?auto_158033 ?auto_158034 ) ( ON ?auto_158032 ?auto_158033 ) ( ON ?auto_158031 ?auto_158032 ) ( ON ?auto_158030 ?auto_158031 ) ( ON ?auto_158029 ?auto_158030 ) ( ON ?auto_158028 ?auto_158029 ) ( HOLDING ?auto_158027 ) ( CLEAR ?auto_158028 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_158034 ?auto_158033 ?auto_158032 ?auto_158031 ?auto_158030 ?auto_158029 ?auto_158028 ?auto_158027 )
      ( MAKE-8PILE ?auto_158027 ?auto_158028 ?auto_158029 ?auto_158030 ?auto_158031 ?auto_158032 ?auto_158033 ?auto_158034 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_158035 - BLOCK
      ?auto_158036 - BLOCK
      ?auto_158037 - BLOCK
      ?auto_158038 - BLOCK
      ?auto_158039 - BLOCK
      ?auto_158040 - BLOCK
      ?auto_158041 - BLOCK
      ?auto_158042 - BLOCK
    )
    :vars
    (
      ?auto_158043 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158035 ?auto_158036 ) ) ( not ( = ?auto_158035 ?auto_158037 ) ) ( not ( = ?auto_158035 ?auto_158038 ) ) ( not ( = ?auto_158035 ?auto_158039 ) ) ( not ( = ?auto_158035 ?auto_158040 ) ) ( not ( = ?auto_158035 ?auto_158041 ) ) ( not ( = ?auto_158035 ?auto_158042 ) ) ( not ( = ?auto_158036 ?auto_158037 ) ) ( not ( = ?auto_158036 ?auto_158038 ) ) ( not ( = ?auto_158036 ?auto_158039 ) ) ( not ( = ?auto_158036 ?auto_158040 ) ) ( not ( = ?auto_158036 ?auto_158041 ) ) ( not ( = ?auto_158036 ?auto_158042 ) ) ( not ( = ?auto_158037 ?auto_158038 ) ) ( not ( = ?auto_158037 ?auto_158039 ) ) ( not ( = ?auto_158037 ?auto_158040 ) ) ( not ( = ?auto_158037 ?auto_158041 ) ) ( not ( = ?auto_158037 ?auto_158042 ) ) ( not ( = ?auto_158038 ?auto_158039 ) ) ( not ( = ?auto_158038 ?auto_158040 ) ) ( not ( = ?auto_158038 ?auto_158041 ) ) ( not ( = ?auto_158038 ?auto_158042 ) ) ( not ( = ?auto_158039 ?auto_158040 ) ) ( not ( = ?auto_158039 ?auto_158041 ) ) ( not ( = ?auto_158039 ?auto_158042 ) ) ( not ( = ?auto_158040 ?auto_158041 ) ) ( not ( = ?auto_158040 ?auto_158042 ) ) ( not ( = ?auto_158041 ?auto_158042 ) ) ( ON-TABLE ?auto_158042 ) ( ON ?auto_158041 ?auto_158042 ) ( ON ?auto_158040 ?auto_158041 ) ( ON ?auto_158039 ?auto_158040 ) ( ON ?auto_158038 ?auto_158039 ) ( ON ?auto_158037 ?auto_158038 ) ( ON ?auto_158036 ?auto_158037 ) ( CLEAR ?auto_158036 ) ( ON ?auto_158035 ?auto_158043 ) ( CLEAR ?auto_158035 ) ( HAND-EMPTY ) ( not ( = ?auto_158035 ?auto_158043 ) ) ( not ( = ?auto_158036 ?auto_158043 ) ) ( not ( = ?auto_158037 ?auto_158043 ) ) ( not ( = ?auto_158038 ?auto_158043 ) ) ( not ( = ?auto_158039 ?auto_158043 ) ) ( not ( = ?auto_158040 ?auto_158043 ) ) ( not ( = ?auto_158041 ?auto_158043 ) ) ( not ( = ?auto_158042 ?auto_158043 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_158035 ?auto_158043 )
      ( MAKE-8PILE ?auto_158035 ?auto_158036 ?auto_158037 ?auto_158038 ?auto_158039 ?auto_158040 ?auto_158041 ?auto_158042 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_158044 - BLOCK
      ?auto_158045 - BLOCK
      ?auto_158046 - BLOCK
      ?auto_158047 - BLOCK
      ?auto_158048 - BLOCK
      ?auto_158049 - BLOCK
      ?auto_158050 - BLOCK
      ?auto_158051 - BLOCK
    )
    :vars
    (
      ?auto_158052 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158044 ?auto_158045 ) ) ( not ( = ?auto_158044 ?auto_158046 ) ) ( not ( = ?auto_158044 ?auto_158047 ) ) ( not ( = ?auto_158044 ?auto_158048 ) ) ( not ( = ?auto_158044 ?auto_158049 ) ) ( not ( = ?auto_158044 ?auto_158050 ) ) ( not ( = ?auto_158044 ?auto_158051 ) ) ( not ( = ?auto_158045 ?auto_158046 ) ) ( not ( = ?auto_158045 ?auto_158047 ) ) ( not ( = ?auto_158045 ?auto_158048 ) ) ( not ( = ?auto_158045 ?auto_158049 ) ) ( not ( = ?auto_158045 ?auto_158050 ) ) ( not ( = ?auto_158045 ?auto_158051 ) ) ( not ( = ?auto_158046 ?auto_158047 ) ) ( not ( = ?auto_158046 ?auto_158048 ) ) ( not ( = ?auto_158046 ?auto_158049 ) ) ( not ( = ?auto_158046 ?auto_158050 ) ) ( not ( = ?auto_158046 ?auto_158051 ) ) ( not ( = ?auto_158047 ?auto_158048 ) ) ( not ( = ?auto_158047 ?auto_158049 ) ) ( not ( = ?auto_158047 ?auto_158050 ) ) ( not ( = ?auto_158047 ?auto_158051 ) ) ( not ( = ?auto_158048 ?auto_158049 ) ) ( not ( = ?auto_158048 ?auto_158050 ) ) ( not ( = ?auto_158048 ?auto_158051 ) ) ( not ( = ?auto_158049 ?auto_158050 ) ) ( not ( = ?auto_158049 ?auto_158051 ) ) ( not ( = ?auto_158050 ?auto_158051 ) ) ( ON-TABLE ?auto_158051 ) ( ON ?auto_158050 ?auto_158051 ) ( ON ?auto_158049 ?auto_158050 ) ( ON ?auto_158048 ?auto_158049 ) ( ON ?auto_158047 ?auto_158048 ) ( ON ?auto_158046 ?auto_158047 ) ( ON ?auto_158044 ?auto_158052 ) ( CLEAR ?auto_158044 ) ( not ( = ?auto_158044 ?auto_158052 ) ) ( not ( = ?auto_158045 ?auto_158052 ) ) ( not ( = ?auto_158046 ?auto_158052 ) ) ( not ( = ?auto_158047 ?auto_158052 ) ) ( not ( = ?auto_158048 ?auto_158052 ) ) ( not ( = ?auto_158049 ?auto_158052 ) ) ( not ( = ?auto_158050 ?auto_158052 ) ) ( not ( = ?auto_158051 ?auto_158052 ) ) ( HOLDING ?auto_158045 ) ( CLEAR ?auto_158046 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_158051 ?auto_158050 ?auto_158049 ?auto_158048 ?auto_158047 ?auto_158046 ?auto_158045 )
      ( MAKE-8PILE ?auto_158044 ?auto_158045 ?auto_158046 ?auto_158047 ?auto_158048 ?auto_158049 ?auto_158050 ?auto_158051 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_158053 - BLOCK
      ?auto_158054 - BLOCK
      ?auto_158055 - BLOCK
      ?auto_158056 - BLOCK
      ?auto_158057 - BLOCK
      ?auto_158058 - BLOCK
      ?auto_158059 - BLOCK
      ?auto_158060 - BLOCK
    )
    :vars
    (
      ?auto_158061 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158053 ?auto_158054 ) ) ( not ( = ?auto_158053 ?auto_158055 ) ) ( not ( = ?auto_158053 ?auto_158056 ) ) ( not ( = ?auto_158053 ?auto_158057 ) ) ( not ( = ?auto_158053 ?auto_158058 ) ) ( not ( = ?auto_158053 ?auto_158059 ) ) ( not ( = ?auto_158053 ?auto_158060 ) ) ( not ( = ?auto_158054 ?auto_158055 ) ) ( not ( = ?auto_158054 ?auto_158056 ) ) ( not ( = ?auto_158054 ?auto_158057 ) ) ( not ( = ?auto_158054 ?auto_158058 ) ) ( not ( = ?auto_158054 ?auto_158059 ) ) ( not ( = ?auto_158054 ?auto_158060 ) ) ( not ( = ?auto_158055 ?auto_158056 ) ) ( not ( = ?auto_158055 ?auto_158057 ) ) ( not ( = ?auto_158055 ?auto_158058 ) ) ( not ( = ?auto_158055 ?auto_158059 ) ) ( not ( = ?auto_158055 ?auto_158060 ) ) ( not ( = ?auto_158056 ?auto_158057 ) ) ( not ( = ?auto_158056 ?auto_158058 ) ) ( not ( = ?auto_158056 ?auto_158059 ) ) ( not ( = ?auto_158056 ?auto_158060 ) ) ( not ( = ?auto_158057 ?auto_158058 ) ) ( not ( = ?auto_158057 ?auto_158059 ) ) ( not ( = ?auto_158057 ?auto_158060 ) ) ( not ( = ?auto_158058 ?auto_158059 ) ) ( not ( = ?auto_158058 ?auto_158060 ) ) ( not ( = ?auto_158059 ?auto_158060 ) ) ( ON-TABLE ?auto_158060 ) ( ON ?auto_158059 ?auto_158060 ) ( ON ?auto_158058 ?auto_158059 ) ( ON ?auto_158057 ?auto_158058 ) ( ON ?auto_158056 ?auto_158057 ) ( ON ?auto_158055 ?auto_158056 ) ( ON ?auto_158053 ?auto_158061 ) ( not ( = ?auto_158053 ?auto_158061 ) ) ( not ( = ?auto_158054 ?auto_158061 ) ) ( not ( = ?auto_158055 ?auto_158061 ) ) ( not ( = ?auto_158056 ?auto_158061 ) ) ( not ( = ?auto_158057 ?auto_158061 ) ) ( not ( = ?auto_158058 ?auto_158061 ) ) ( not ( = ?auto_158059 ?auto_158061 ) ) ( not ( = ?auto_158060 ?auto_158061 ) ) ( CLEAR ?auto_158055 ) ( ON ?auto_158054 ?auto_158053 ) ( CLEAR ?auto_158054 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_158061 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_158061 ?auto_158053 )
      ( MAKE-8PILE ?auto_158053 ?auto_158054 ?auto_158055 ?auto_158056 ?auto_158057 ?auto_158058 ?auto_158059 ?auto_158060 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_158062 - BLOCK
      ?auto_158063 - BLOCK
      ?auto_158064 - BLOCK
      ?auto_158065 - BLOCK
      ?auto_158066 - BLOCK
      ?auto_158067 - BLOCK
      ?auto_158068 - BLOCK
      ?auto_158069 - BLOCK
    )
    :vars
    (
      ?auto_158070 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158062 ?auto_158063 ) ) ( not ( = ?auto_158062 ?auto_158064 ) ) ( not ( = ?auto_158062 ?auto_158065 ) ) ( not ( = ?auto_158062 ?auto_158066 ) ) ( not ( = ?auto_158062 ?auto_158067 ) ) ( not ( = ?auto_158062 ?auto_158068 ) ) ( not ( = ?auto_158062 ?auto_158069 ) ) ( not ( = ?auto_158063 ?auto_158064 ) ) ( not ( = ?auto_158063 ?auto_158065 ) ) ( not ( = ?auto_158063 ?auto_158066 ) ) ( not ( = ?auto_158063 ?auto_158067 ) ) ( not ( = ?auto_158063 ?auto_158068 ) ) ( not ( = ?auto_158063 ?auto_158069 ) ) ( not ( = ?auto_158064 ?auto_158065 ) ) ( not ( = ?auto_158064 ?auto_158066 ) ) ( not ( = ?auto_158064 ?auto_158067 ) ) ( not ( = ?auto_158064 ?auto_158068 ) ) ( not ( = ?auto_158064 ?auto_158069 ) ) ( not ( = ?auto_158065 ?auto_158066 ) ) ( not ( = ?auto_158065 ?auto_158067 ) ) ( not ( = ?auto_158065 ?auto_158068 ) ) ( not ( = ?auto_158065 ?auto_158069 ) ) ( not ( = ?auto_158066 ?auto_158067 ) ) ( not ( = ?auto_158066 ?auto_158068 ) ) ( not ( = ?auto_158066 ?auto_158069 ) ) ( not ( = ?auto_158067 ?auto_158068 ) ) ( not ( = ?auto_158067 ?auto_158069 ) ) ( not ( = ?auto_158068 ?auto_158069 ) ) ( ON-TABLE ?auto_158069 ) ( ON ?auto_158068 ?auto_158069 ) ( ON ?auto_158067 ?auto_158068 ) ( ON ?auto_158066 ?auto_158067 ) ( ON ?auto_158065 ?auto_158066 ) ( ON ?auto_158062 ?auto_158070 ) ( not ( = ?auto_158062 ?auto_158070 ) ) ( not ( = ?auto_158063 ?auto_158070 ) ) ( not ( = ?auto_158064 ?auto_158070 ) ) ( not ( = ?auto_158065 ?auto_158070 ) ) ( not ( = ?auto_158066 ?auto_158070 ) ) ( not ( = ?auto_158067 ?auto_158070 ) ) ( not ( = ?auto_158068 ?auto_158070 ) ) ( not ( = ?auto_158069 ?auto_158070 ) ) ( ON ?auto_158063 ?auto_158062 ) ( CLEAR ?auto_158063 ) ( ON-TABLE ?auto_158070 ) ( HOLDING ?auto_158064 ) ( CLEAR ?auto_158065 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_158069 ?auto_158068 ?auto_158067 ?auto_158066 ?auto_158065 ?auto_158064 )
      ( MAKE-8PILE ?auto_158062 ?auto_158063 ?auto_158064 ?auto_158065 ?auto_158066 ?auto_158067 ?auto_158068 ?auto_158069 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_158071 - BLOCK
      ?auto_158072 - BLOCK
      ?auto_158073 - BLOCK
      ?auto_158074 - BLOCK
      ?auto_158075 - BLOCK
      ?auto_158076 - BLOCK
      ?auto_158077 - BLOCK
      ?auto_158078 - BLOCK
    )
    :vars
    (
      ?auto_158079 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158071 ?auto_158072 ) ) ( not ( = ?auto_158071 ?auto_158073 ) ) ( not ( = ?auto_158071 ?auto_158074 ) ) ( not ( = ?auto_158071 ?auto_158075 ) ) ( not ( = ?auto_158071 ?auto_158076 ) ) ( not ( = ?auto_158071 ?auto_158077 ) ) ( not ( = ?auto_158071 ?auto_158078 ) ) ( not ( = ?auto_158072 ?auto_158073 ) ) ( not ( = ?auto_158072 ?auto_158074 ) ) ( not ( = ?auto_158072 ?auto_158075 ) ) ( not ( = ?auto_158072 ?auto_158076 ) ) ( not ( = ?auto_158072 ?auto_158077 ) ) ( not ( = ?auto_158072 ?auto_158078 ) ) ( not ( = ?auto_158073 ?auto_158074 ) ) ( not ( = ?auto_158073 ?auto_158075 ) ) ( not ( = ?auto_158073 ?auto_158076 ) ) ( not ( = ?auto_158073 ?auto_158077 ) ) ( not ( = ?auto_158073 ?auto_158078 ) ) ( not ( = ?auto_158074 ?auto_158075 ) ) ( not ( = ?auto_158074 ?auto_158076 ) ) ( not ( = ?auto_158074 ?auto_158077 ) ) ( not ( = ?auto_158074 ?auto_158078 ) ) ( not ( = ?auto_158075 ?auto_158076 ) ) ( not ( = ?auto_158075 ?auto_158077 ) ) ( not ( = ?auto_158075 ?auto_158078 ) ) ( not ( = ?auto_158076 ?auto_158077 ) ) ( not ( = ?auto_158076 ?auto_158078 ) ) ( not ( = ?auto_158077 ?auto_158078 ) ) ( ON-TABLE ?auto_158078 ) ( ON ?auto_158077 ?auto_158078 ) ( ON ?auto_158076 ?auto_158077 ) ( ON ?auto_158075 ?auto_158076 ) ( ON ?auto_158074 ?auto_158075 ) ( ON ?auto_158071 ?auto_158079 ) ( not ( = ?auto_158071 ?auto_158079 ) ) ( not ( = ?auto_158072 ?auto_158079 ) ) ( not ( = ?auto_158073 ?auto_158079 ) ) ( not ( = ?auto_158074 ?auto_158079 ) ) ( not ( = ?auto_158075 ?auto_158079 ) ) ( not ( = ?auto_158076 ?auto_158079 ) ) ( not ( = ?auto_158077 ?auto_158079 ) ) ( not ( = ?auto_158078 ?auto_158079 ) ) ( ON ?auto_158072 ?auto_158071 ) ( ON-TABLE ?auto_158079 ) ( CLEAR ?auto_158074 ) ( ON ?auto_158073 ?auto_158072 ) ( CLEAR ?auto_158073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_158079 ?auto_158071 ?auto_158072 )
      ( MAKE-8PILE ?auto_158071 ?auto_158072 ?auto_158073 ?auto_158074 ?auto_158075 ?auto_158076 ?auto_158077 ?auto_158078 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_158080 - BLOCK
      ?auto_158081 - BLOCK
      ?auto_158082 - BLOCK
      ?auto_158083 - BLOCK
      ?auto_158084 - BLOCK
      ?auto_158085 - BLOCK
      ?auto_158086 - BLOCK
      ?auto_158087 - BLOCK
    )
    :vars
    (
      ?auto_158088 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158080 ?auto_158081 ) ) ( not ( = ?auto_158080 ?auto_158082 ) ) ( not ( = ?auto_158080 ?auto_158083 ) ) ( not ( = ?auto_158080 ?auto_158084 ) ) ( not ( = ?auto_158080 ?auto_158085 ) ) ( not ( = ?auto_158080 ?auto_158086 ) ) ( not ( = ?auto_158080 ?auto_158087 ) ) ( not ( = ?auto_158081 ?auto_158082 ) ) ( not ( = ?auto_158081 ?auto_158083 ) ) ( not ( = ?auto_158081 ?auto_158084 ) ) ( not ( = ?auto_158081 ?auto_158085 ) ) ( not ( = ?auto_158081 ?auto_158086 ) ) ( not ( = ?auto_158081 ?auto_158087 ) ) ( not ( = ?auto_158082 ?auto_158083 ) ) ( not ( = ?auto_158082 ?auto_158084 ) ) ( not ( = ?auto_158082 ?auto_158085 ) ) ( not ( = ?auto_158082 ?auto_158086 ) ) ( not ( = ?auto_158082 ?auto_158087 ) ) ( not ( = ?auto_158083 ?auto_158084 ) ) ( not ( = ?auto_158083 ?auto_158085 ) ) ( not ( = ?auto_158083 ?auto_158086 ) ) ( not ( = ?auto_158083 ?auto_158087 ) ) ( not ( = ?auto_158084 ?auto_158085 ) ) ( not ( = ?auto_158084 ?auto_158086 ) ) ( not ( = ?auto_158084 ?auto_158087 ) ) ( not ( = ?auto_158085 ?auto_158086 ) ) ( not ( = ?auto_158085 ?auto_158087 ) ) ( not ( = ?auto_158086 ?auto_158087 ) ) ( ON-TABLE ?auto_158087 ) ( ON ?auto_158086 ?auto_158087 ) ( ON ?auto_158085 ?auto_158086 ) ( ON ?auto_158084 ?auto_158085 ) ( ON ?auto_158080 ?auto_158088 ) ( not ( = ?auto_158080 ?auto_158088 ) ) ( not ( = ?auto_158081 ?auto_158088 ) ) ( not ( = ?auto_158082 ?auto_158088 ) ) ( not ( = ?auto_158083 ?auto_158088 ) ) ( not ( = ?auto_158084 ?auto_158088 ) ) ( not ( = ?auto_158085 ?auto_158088 ) ) ( not ( = ?auto_158086 ?auto_158088 ) ) ( not ( = ?auto_158087 ?auto_158088 ) ) ( ON ?auto_158081 ?auto_158080 ) ( ON-TABLE ?auto_158088 ) ( ON ?auto_158082 ?auto_158081 ) ( CLEAR ?auto_158082 ) ( HOLDING ?auto_158083 ) ( CLEAR ?auto_158084 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_158087 ?auto_158086 ?auto_158085 ?auto_158084 ?auto_158083 )
      ( MAKE-8PILE ?auto_158080 ?auto_158081 ?auto_158082 ?auto_158083 ?auto_158084 ?auto_158085 ?auto_158086 ?auto_158087 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_158089 - BLOCK
      ?auto_158090 - BLOCK
      ?auto_158091 - BLOCK
      ?auto_158092 - BLOCK
      ?auto_158093 - BLOCK
      ?auto_158094 - BLOCK
      ?auto_158095 - BLOCK
      ?auto_158096 - BLOCK
    )
    :vars
    (
      ?auto_158097 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158089 ?auto_158090 ) ) ( not ( = ?auto_158089 ?auto_158091 ) ) ( not ( = ?auto_158089 ?auto_158092 ) ) ( not ( = ?auto_158089 ?auto_158093 ) ) ( not ( = ?auto_158089 ?auto_158094 ) ) ( not ( = ?auto_158089 ?auto_158095 ) ) ( not ( = ?auto_158089 ?auto_158096 ) ) ( not ( = ?auto_158090 ?auto_158091 ) ) ( not ( = ?auto_158090 ?auto_158092 ) ) ( not ( = ?auto_158090 ?auto_158093 ) ) ( not ( = ?auto_158090 ?auto_158094 ) ) ( not ( = ?auto_158090 ?auto_158095 ) ) ( not ( = ?auto_158090 ?auto_158096 ) ) ( not ( = ?auto_158091 ?auto_158092 ) ) ( not ( = ?auto_158091 ?auto_158093 ) ) ( not ( = ?auto_158091 ?auto_158094 ) ) ( not ( = ?auto_158091 ?auto_158095 ) ) ( not ( = ?auto_158091 ?auto_158096 ) ) ( not ( = ?auto_158092 ?auto_158093 ) ) ( not ( = ?auto_158092 ?auto_158094 ) ) ( not ( = ?auto_158092 ?auto_158095 ) ) ( not ( = ?auto_158092 ?auto_158096 ) ) ( not ( = ?auto_158093 ?auto_158094 ) ) ( not ( = ?auto_158093 ?auto_158095 ) ) ( not ( = ?auto_158093 ?auto_158096 ) ) ( not ( = ?auto_158094 ?auto_158095 ) ) ( not ( = ?auto_158094 ?auto_158096 ) ) ( not ( = ?auto_158095 ?auto_158096 ) ) ( ON-TABLE ?auto_158096 ) ( ON ?auto_158095 ?auto_158096 ) ( ON ?auto_158094 ?auto_158095 ) ( ON ?auto_158093 ?auto_158094 ) ( ON ?auto_158089 ?auto_158097 ) ( not ( = ?auto_158089 ?auto_158097 ) ) ( not ( = ?auto_158090 ?auto_158097 ) ) ( not ( = ?auto_158091 ?auto_158097 ) ) ( not ( = ?auto_158092 ?auto_158097 ) ) ( not ( = ?auto_158093 ?auto_158097 ) ) ( not ( = ?auto_158094 ?auto_158097 ) ) ( not ( = ?auto_158095 ?auto_158097 ) ) ( not ( = ?auto_158096 ?auto_158097 ) ) ( ON ?auto_158090 ?auto_158089 ) ( ON-TABLE ?auto_158097 ) ( ON ?auto_158091 ?auto_158090 ) ( CLEAR ?auto_158093 ) ( ON ?auto_158092 ?auto_158091 ) ( CLEAR ?auto_158092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_158097 ?auto_158089 ?auto_158090 ?auto_158091 )
      ( MAKE-8PILE ?auto_158089 ?auto_158090 ?auto_158091 ?auto_158092 ?auto_158093 ?auto_158094 ?auto_158095 ?auto_158096 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_158098 - BLOCK
      ?auto_158099 - BLOCK
      ?auto_158100 - BLOCK
      ?auto_158101 - BLOCK
      ?auto_158102 - BLOCK
      ?auto_158103 - BLOCK
      ?auto_158104 - BLOCK
      ?auto_158105 - BLOCK
    )
    :vars
    (
      ?auto_158106 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158098 ?auto_158099 ) ) ( not ( = ?auto_158098 ?auto_158100 ) ) ( not ( = ?auto_158098 ?auto_158101 ) ) ( not ( = ?auto_158098 ?auto_158102 ) ) ( not ( = ?auto_158098 ?auto_158103 ) ) ( not ( = ?auto_158098 ?auto_158104 ) ) ( not ( = ?auto_158098 ?auto_158105 ) ) ( not ( = ?auto_158099 ?auto_158100 ) ) ( not ( = ?auto_158099 ?auto_158101 ) ) ( not ( = ?auto_158099 ?auto_158102 ) ) ( not ( = ?auto_158099 ?auto_158103 ) ) ( not ( = ?auto_158099 ?auto_158104 ) ) ( not ( = ?auto_158099 ?auto_158105 ) ) ( not ( = ?auto_158100 ?auto_158101 ) ) ( not ( = ?auto_158100 ?auto_158102 ) ) ( not ( = ?auto_158100 ?auto_158103 ) ) ( not ( = ?auto_158100 ?auto_158104 ) ) ( not ( = ?auto_158100 ?auto_158105 ) ) ( not ( = ?auto_158101 ?auto_158102 ) ) ( not ( = ?auto_158101 ?auto_158103 ) ) ( not ( = ?auto_158101 ?auto_158104 ) ) ( not ( = ?auto_158101 ?auto_158105 ) ) ( not ( = ?auto_158102 ?auto_158103 ) ) ( not ( = ?auto_158102 ?auto_158104 ) ) ( not ( = ?auto_158102 ?auto_158105 ) ) ( not ( = ?auto_158103 ?auto_158104 ) ) ( not ( = ?auto_158103 ?auto_158105 ) ) ( not ( = ?auto_158104 ?auto_158105 ) ) ( ON-TABLE ?auto_158105 ) ( ON ?auto_158104 ?auto_158105 ) ( ON ?auto_158103 ?auto_158104 ) ( ON ?auto_158098 ?auto_158106 ) ( not ( = ?auto_158098 ?auto_158106 ) ) ( not ( = ?auto_158099 ?auto_158106 ) ) ( not ( = ?auto_158100 ?auto_158106 ) ) ( not ( = ?auto_158101 ?auto_158106 ) ) ( not ( = ?auto_158102 ?auto_158106 ) ) ( not ( = ?auto_158103 ?auto_158106 ) ) ( not ( = ?auto_158104 ?auto_158106 ) ) ( not ( = ?auto_158105 ?auto_158106 ) ) ( ON ?auto_158099 ?auto_158098 ) ( ON-TABLE ?auto_158106 ) ( ON ?auto_158100 ?auto_158099 ) ( ON ?auto_158101 ?auto_158100 ) ( CLEAR ?auto_158101 ) ( HOLDING ?auto_158102 ) ( CLEAR ?auto_158103 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_158105 ?auto_158104 ?auto_158103 ?auto_158102 )
      ( MAKE-8PILE ?auto_158098 ?auto_158099 ?auto_158100 ?auto_158101 ?auto_158102 ?auto_158103 ?auto_158104 ?auto_158105 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_158107 - BLOCK
      ?auto_158108 - BLOCK
      ?auto_158109 - BLOCK
      ?auto_158110 - BLOCK
      ?auto_158111 - BLOCK
      ?auto_158112 - BLOCK
      ?auto_158113 - BLOCK
      ?auto_158114 - BLOCK
    )
    :vars
    (
      ?auto_158115 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158107 ?auto_158108 ) ) ( not ( = ?auto_158107 ?auto_158109 ) ) ( not ( = ?auto_158107 ?auto_158110 ) ) ( not ( = ?auto_158107 ?auto_158111 ) ) ( not ( = ?auto_158107 ?auto_158112 ) ) ( not ( = ?auto_158107 ?auto_158113 ) ) ( not ( = ?auto_158107 ?auto_158114 ) ) ( not ( = ?auto_158108 ?auto_158109 ) ) ( not ( = ?auto_158108 ?auto_158110 ) ) ( not ( = ?auto_158108 ?auto_158111 ) ) ( not ( = ?auto_158108 ?auto_158112 ) ) ( not ( = ?auto_158108 ?auto_158113 ) ) ( not ( = ?auto_158108 ?auto_158114 ) ) ( not ( = ?auto_158109 ?auto_158110 ) ) ( not ( = ?auto_158109 ?auto_158111 ) ) ( not ( = ?auto_158109 ?auto_158112 ) ) ( not ( = ?auto_158109 ?auto_158113 ) ) ( not ( = ?auto_158109 ?auto_158114 ) ) ( not ( = ?auto_158110 ?auto_158111 ) ) ( not ( = ?auto_158110 ?auto_158112 ) ) ( not ( = ?auto_158110 ?auto_158113 ) ) ( not ( = ?auto_158110 ?auto_158114 ) ) ( not ( = ?auto_158111 ?auto_158112 ) ) ( not ( = ?auto_158111 ?auto_158113 ) ) ( not ( = ?auto_158111 ?auto_158114 ) ) ( not ( = ?auto_158112 ?auto_158113 ) ) ( not ( = ?auto_158112 ?auto_158114 ) ) ( not ( = ?auto_158113 ?auto_158114 ) ) ( ON-TABLE ?auto_158114 ) ( ON ?auto_158113 ?auto_158114 ) ( ON ?auto_158112 ?auto_158113 ) ( ON ?auto_158107 ?auto_158115 ) ( not ( = ?auto_158107 ?auto_158115 ) ) ( not ( = ?auto_158108 ?auto_158115 ) ) ( not ( = ?auto_158109 ?auto_158115 ) ) ( not ( = ?auto_158110 ?auto_158115 ) ) ( not ( = ?auto_158111 ?auto_158115 ) ) ( not ( = ?auto_158112 ?auto_158115 ) ) ( not ( = ?auto_158113 ?auto_158115 ) ) ( not ( = ?auto_158114 ?auto_158115 ) ) ( ON ?auto_158108 ?auto_158107 ) ( ON-TABLE ?auto_158115 ) ( ON ?auto_158109 ?auto_158108 ) ( ON ?auto_158110 ?auto_158109 ) ( CLEAR ?auto_158112 ) ( ON ?auto_158111 ?auto_158110 ) ( CLEAR ?auto_158111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_158115 ?auto_158107 ?auto_158108 ?auto_158109 ?auto_158110 )
      ( MAKE-8PILE ?auto_158107 ?auto_158108 ?auto_158109 ?auto_158110 ?auto_158111 ?auto_158112 ?auto_158113 ?auto_158114 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_158116 - BLOCK
      ?auto_158117 - BLOCK
      ?auto_158118 - BLOCK
      ?auto_158119 - BLOCK
      ?auto_158120 - BLOCK
      ?auto_158121 - BLOCK
      ?auto_158122 - BLOCK
      ?auto_158123 - BLOCK
    )
    :vars
    (
      ?auto_158124 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158116 ?auto_158117 ) ) ( not ( = ?auto_158116 ?auto_158118 ) ) ( not ( = ?auto_158116 ?auto_158119 ) ) ( not ( = ?auto_158116 ?auto_158120 ) ) ( not ( = ?auto_158116 ?auto_158121 ) ) ( not ( = ?auto_158116 ?auto_158122 ) ) ( not ( = ?auto_158116 ?auto_158123 ) ) ( not ( = ?auto_158117 ?auto_158118 ) ) ( not ( = ?auto_158117 ?auto_158119 ) ) ( not ( = ?auto_158117 ?auto_158120 ) ) ( not ( = ?auto_158117 ?auto_158121 ) ) ( not ( = ?auto_158117 ?auto_158122 ) ) ( not ( = ?auto_158117 ?auto_158123 ) ) ( not ( = ?auto_158118 ?auto_158119 ) ) ( not ( = ?auto_158118 ?auto_158120 ) ) ( not ( = ?auto_158118 ?auto_158121 ) ) ( not ( = ?auto_158118 ?auto_158122 ) ) ( not ( = ?auto_158118 ?auto_158123 ) ) ( not ( = ?auto_158119 ?auto_158120 ) ) ( not ( = ?auto_158119 ?auto_158121 ) ) ( not ( = ?auto_158119 ?auto_158122 ) ) ( not ( = ?auto_158119 ?auto_158123 ) ) ( not ( = ?auto_158120 ?auto_158121 ) ) ( not ( = ?auto_158120 ?auto_158122 ) ) ( not ( = ?auto_158120 ?auto_158123 ) ) ( not ( = ?auto_158121 ?auto_158122 ) ) ( not ( = ?auto_158121 ?auto_158123 ) ) ( not ( = ?auto_158122 ?auto_158123 ) ) ( ON-TABLE ?auto_158123 ) ( ON ?auto_158122 ?auto_158123 ) ( ON ?auto_158116 ?auto_158124 ) ( not ( = ?auto_158116 ?auto_158124 ) ) ( not ( = ?auto_158117 ?auto_158124 ) ) ( not ( = ?auto_158118 ?auto_158124 ) ) ( not ( = ?auto_158119 ?auto_158124 ) ) ( not ( = ?auto_158120 ?auto_158124 ) ) ( not ( = ?auto_158121 ?auto_158124 ) ) ( not ( = ?auto_158122 ?auto_158124 ) ) ( not ( = ?auto_158123 ?auto_158124 ) ) ( ON ?auto_158117 ?auto_158116 ) ( ON-TABLE ?auto_158124 ) ( ON ?auto_158118 ?auto_158117 ) ( ON ?auto_158119 ?auto_158118 ) ( ON ?auto_158120 ?auto_158119 ) ( CLEAR ?auto_158120 ) ( HOLDING ?auto_158121 ) ( CLEAR ?auto_158122 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_158123 ?auto_158122 ?auto_158121 )
      ( MAKE-8PILE ?auto_158116 ?auto_158117 ?auto_158118 ?auto_158119 ?auto_158120 ?auto_158121 ?auto_158122 ?auto_158123 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_158125 - BLOCK
      ?auto_158126 - BLOCK
      ?auto_158127 - BLOCK
      ?auto_158128 - BLOCK
      ?auto_158129 - BLOCK
      ?auto_158130 - BLOCK
      ?auto_158131 - BLOCK
      ?auto_158132 - BLOCK
    )
    :vars
    (
      ?auto_158133 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158125 ?auto_158126 ) ) ( not ( = ?auto_158125 ?auto_158127 ) ) ( not ( = ?auto_158125 ?auto_158128 ) ) ( not ( = ?auto_158125 ?auto_158129 ) ) ( not ( = ?auto_158125 ?auto_158130 ) ) ( not ( = ?auto_158125 ?auto_158131 ) ) ( not ( = ?auto_158125 ?auto_158132 ) ) ( not ( = ?auto_158126 ?auto_158127 ) ) ( not ( = ?auto_158126 ?auto_158128 ) ) ( not ( = ?auto_158126 ?auto_158129 ) ) ( not ( = ?auto_158126 ?auto_158130 ) ) ( not ( = ?auto_158126 ?auto_158131 ) ) ( not ( = ?auto_158126 ?auto_158132 ) ) ( not ( = ?auto_158127 ?auto_158128 ) ) ( not ( = ?auto_158127 ?auto_158129 ) ) ( not ( = ?auto_158127 ?auto_158130 ) ) ( not ( = ?auto_158127 ?auto_158131 ) ) ( not ( = ?auto_158127 ?auto_158132 ) ) ( not ( = ?auto_158128 ?auto_158129 ) ) ( not ( = ?auto_158128 ?auto_158130 ) ) ( not ( = ?auto_158128 ?auto_158131 ) ) ( not ( = ?auto_158128 ?auto_158132 ) ) ( not ( = ?auto_158129 ?auto_158130 ) ) ( not ( = ?auto_158129 ?auto_158131 ) ) ( not ( = ?auto_158129 ?auto_158132 ) ) ( not ( = ?auto_158130 ?auto_158131 ) ) ( not ( = ?auto_158130 ?auto_158132 ) ) ( not ( = ?auto_158131 ?auto_158132 ) ) ( ON-TABLE ?auto_158132 ) ( ON ?auto_158131 ?auto_158132 ) ( ON ?auto_158125 ?auto_158133 ) ( not ( = ?auto_158125 ?auto_158133 ) ) ( not ( = ?auto_158126 ?auto_158133 ) ) ( not ( = ?auto_158127 ?auto_158133 ) ) ( not ( = ?auto_158128 ?auto_158133 ) ) ( not ( = ?auto_158129 ?auto_158133 ) ) ( not ( = ?auto_158130 ?auto_158133 ) ) ( not ( = ?auto_158131 ?auto_158133 ) ) ( not ( = ?auto_158132 ?auto_158133 ) ) ( ON ?auto_158126 ?auto_158125 ) ( ON-TABLE ?auto_158133 ) ( ON ?auto_158127 ?auto_158126 ) ( ON ?auto_158128 ?auto_158127 ) ( ON ?auto_158129 ?auto_158128 ) ( CLEAR ?auto_158131 ) ( ON ?auto_158130 ?auto_158129 ) ( CLEAR ?auto_158130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_158133 ?auto_158125 ?auto_158126 ?auto_158127 ?auto_158128 ?auto_158129 )
      ( MAKE-8PILE ?auto_158125 ?auto_158126 ?auto_158127 ?auto_158128 ?auto_158129 ?auto_158130 ?auto_158131 ?auto_158132 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_158134 - BLOCK
      ?auto_158135 - BLOCK
      ?auto_158136 - BLOCK
      ?auto_158137 - BLOCK
      ?auto_158138 - BLOCK
      ?auto_158139 - BLOCK
      ?auto_158140 - BLOCK
      ?auto_158141 - BLOCK
    )
    :vars
    (
      ?auto_158142 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158134 ?auto_158135 ) ) ( not ( = ?auto_158134 ?auto_158136 ) ) ( not ( = ?auto_158134 ?auto_158137 ) ) ( not ( = ?auto_158134 ?auto_158138 ) ) ( not ( = ?auto_158134 ?auto_158139 ) ) ( not ( = ?auto_158134 ?auto_158140 ) ) ( not ( = ?auto_158134 ?auto_158141 ) ) ( not ( = ?auto_158135 ?auto_158136 ) ) ( not ( = ?auto_158135 ?auto_158137 ) ) ( not ( = ?auto_158135 ?auto_158138 ) ) ( not ( = ?auto_158135 ?auto_158139 ) ) ( not ( = ?auto_158135 ?auto_158140 ) ) ( not ( = ?auto_158135 ?auto_158141 ) ) ( not ( = ?auto_158136 ?auto_158137 ) ) ( not ( = ?auto_158136 ?auto_158138 ) ) ( not ( = ?auto_158136 ?auto_158139 ) ) ( not ( = ?auto_158136 ?auto_158140 ) ) ( not ( = ?auto_158136 ?auto_158141 ) ) ( not ( = ?auto_158137 ?auto_158138 ) ) ( not ( = ?auto_158137 ?auto_158139 ) ) ( not ( = ?auto_158137 ?auto_158140 ) ) ( not ( = ?auto_158137 ?auto_158141 ) ) ( not ( = ?auto_158138 ?auto_158139 ) ) ( not ( = ?auto_158138 ?auto_158140 ) ) ( not ( = ?auto_158138 ?auto_158141 ) ) ( not ( = ?auto_158139 ?auto_158140 ) ) ( not ( = ?auto_158139 ?auto_158141 ) ) ( not ( = ?auto_158140 ?auto_158141 ) ) ( ON-TABLE ?auto_158141 ) ( ON ?auto_158134 ?auto_158142 ) ( not ( = ?auto_158134 ?auto_158142 ) ) ( not ( = ?auto_158135 ?auto_158142 ) ) ( not ( = ?auto_158136 ?auto_158142 ) ) ( not ( = ?auto_158137 ?auto_158142 ) ) ( not ( = ?auto_158138 ?auto_158142 ) ) ( not ( = ?auto_158139 ?auto_158142 ) ) ( not ( = ?auto_158140 ?auto_158142 ) ) ( not ( = ?auto_158141 ?auto_158142 ) ) ( ON ?auto_158135 ?auto_158134 ) ( ON-TABLE ?auto_158142 ) ( ON ?auto_158136 ?auto_158135 ) ( ON ?auto_158137 ?auto_158136 ) ( ON ?auto_158138 ?auto_158137 ) ( ON ?auto_158139 ?auto_158138 ) ( CLEAR ?auto_158139 ) ( HOLDING ?auto_158140 ) ( CLEAR ?auto_158141 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_158141 ?auto_158140 )
      ( MAKE-8PILE ?auto_158134 ?auto_158135 ?auto_158136 ?auto_158137 ?auto_158138 ?auto_158139 ?auto_158140 ?auto_158141 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_158143 - BLOCK
      ?auto_158144 - BLOCK
      ?auto_158145 - BLOCK
      ?auto_158146 - BLOCK
      ?auto_158147 - BLOCK
      ?auto_158148 - BLOCK
      ?auto_158149 - BLOCK
      ?auto_158150 - BLOCK
    )
    :vars
    (
      ?auto_158151 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158143 ?auto_158144 ) ) ( not ( = ?auto_158143 ?auto_158145 ) ) ( not ( = ?auto_158143 ?auto_158146 ) ) ( not ( = ?auto_158143 ?auto_158147 ) ) ( not ( = ?auto_158143 ?auto_158148 ) ) ( not ( = ?auto_158143 ?auto_158149 ) ) ( not ( = ?auto_158143 ?auto_158150 ) ) ( not ( = ?auto_158144 ?auto_158145 ) ) ( not ( = ?auto_158144 ?auto_158146 ) ) ( not ( = ?auto_158144 ?auto_158147 ) ) ( not ( = ?auto_158144 ?auto_158148 ) ) ( not ( = ?auto_158144 ?auto_158149 ) ) ( not ( = ?auto_158144 ?auto_158150 ) ) ( not ( = ?auto_158145 ?auto_158146 ) ) ( not ( = ?auto_158145 ?auto_158147 ) ) ( not ( = ?auto_158145 ?auto_158148 ) ) ( not ( = ?auto_158145 ?auto_158149 ) ) ( not ( = ?auto_158145 ?auto_158150 ) ) ( not ( = ?auto_158146 ?auto_158147 ) ) ( not ( = ?auto_158146 ?auto_158148 ) ) ( not ( = ?auto_158146 ?auto_158149 ) ) ( not ( = ?auto_158146 ?auto_158150 ) ) ( not ( = ?auto_158147 ?auto_158148 ) ) ( not ( = ?auto_158147 ?auto_158149 ) ) ( not ( = ?auto_158147 ?auto_158150 ) ) ( not ( = ?auto_158148 ?auto_158149 ) ) ( not ( = ?auto_158148 ?auto_158150 ) ) ( not ( = ?auto_158149 ?auto_158150 ) ) ( ON-TABLE ?auto_158150 ) ( ON ?auto_158143 ?auto_158151 ) ( not ( = ?auto_158143 ?auto_158151 ) ) ( not ( = ?auto_158144 ?auto_158151 ) ) ( not ( = ?auto_158145 ?auto_158151 ) ) ( not ( = ?auto_158146 ?auto_158151 ) ) ( not ( = ?auto_158147 ?auto_158151 ) ) ( not ( = ?auto_158148 ?auto_158151 ) ) ( not ( = ?auto_158149 ?auto_158151 ) ) ( not ( = ?auto_158150 ?auto_158151 ) ) ( ON ?auto_158144 ?auto_158143 ) ( ON-TABLE ?auto_158151 ) ( ON ?auto_158145 ?auto_158144 ) ( ON ?auto_158146 ?auto_158145 ) ( ON ?auto_158147 ?auto_158146 ) ( ON ?auto_158148 ?auto_158147 ) ( CLEAR ?auto_158150 ) ( ON ?auto_158149 ?auto_158148 ) ( CLEAR ?auto_158149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_158151 ?auto_158143 ?auto_158144 ?auto_158145 ?auto_158146 ?auto_158147 ?auto_158148 )
      ( MAKE-8PILE ?auto_158143 ?auto_158144 ?auto_158145 ?auto_158146 ?auto_158147 ?auto_158148 ?auto_158149 ?auto_158150 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_158152 - BLOCK
      ?auto_158153 - BLOCK
      ?auto_158154 - BLOCK
      ?auto_158155 - BLOCK
      ?auto_158156 - BLOCK
      ?auto_158157 - BLOCK
      ?auto_158158 - BLOCK
      ?auto_158159 - BLOCK
    )
    :vars
    (
      ?auto_158160 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158152 ?auto_158153 ) ) ( not ( = ?auto_158152 ?auto_158154 ) ) ( not ( = ?auto_158152 ?auto_158155 ) ) ( not ( = ?auto_158152 ?auto_158156 ) ) ( not ( = ?auto_158152 ?auto_158157 ) ) ( not ( = ?auto_158152 ?auto_158158 ) ) ( not ( = ?auto_158152 ?auto_158159 ) ) ( not ( = ?auto_158153 ?auto_158154 ) ) ( not ( = ?auto_158153 ?auto_158155 ) ) ( not ( = ?auto_158153 ?auto_158156 ) ) ( not ( = ?auto_158153 ?auto_158157 ) ) ( not ( = ?auto_158153 ?auto_158158 ) ) ( not ( = ?auto_158153 ?auto_158159 ) ) ( not ( = ?auto_158154 ?auto_158155 ) ) ( not ( = ?auto_158154 ?auto_158156 ) ) ( not ( = ?auto_158154 ?auto_158157 ) ) ( not ( = ?auto_158154 ?auto_158158 ) ) ( not ( = ?auto_158154 ?auto_158159 ) ) ( not ( = ?auto_158155 ?auto_158156 ) ) ( not ( = ?auto_158155 ?auto_158157 ) ) ( not ( = ?auto_158155 ?auto_158158 ) ) ( not ( = ?auto_158155 ?auto_158159 ) ) ( not ( = ?auto_158156 ?auto_158157 ) ) ( not ( = ?auto_158156 ?auto_158158 ) ) ( not ( = ?auto_158156 ?auto_158159 ) ) ( not ( = ?auto_158157 ?auto_158158 ) ) ( not ( = ?auto_158157 ?auto_158159 ) ) ( not ( = ?auto_158158 ?auto_158159 ) ) ( ON ?auto_158152 ?auto_158160 ) ( not ( = ?auto_158152 ?auto_158160 ) ) ( not ( = ?auto_158153 ?auto_158160 ) ) ( not ( = ?auto_158154 ?auto_158160 ) ) ( not ( = ?auto_158155 ?auto_158160 ) ) ( not ( = ?auto_158156 ?auto_158160 ) ) ( not ( = ?auto_158157 ?auto_158160 ) ) ( not ( = ?auto_158158 ?auto_158160 ) ) ( not ( = ?auto_158159 ?auto_158160 ) ) ( ON ?auto_158153 ?auto_158152 ) ( ON-TABLE ?auto_158160 ) ( ON ?auto_158154 ?auto_158153 ) ( ON ?auto_158155 ?auto_158154 ) ( ON ?auto_158156 ?auto_158155 ) ( ON ?auto_158157 ?auto_158156 ) ( ON ?auto_158158 ?auto_158157 ) ( CLEAR ?auto_158158 ) ( HOLDING ?auto_158159 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_158159 )
      ( MAKE-8PILE ?auto_158152 ?auto_158153 ?auto_158154 ?auto_158155 ?auto_158156 ?auto_158157 ?auto_158158 ?auto_158159 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_158161 - BLOCK
      ?auto_158162 - BLOCK
      ?auto_158163 - BLOCK
      ?auto_158164 - BLOCK
      ?auto_158165 - BLOCK
      ?auto_158166 - BLOCK
      ?auto_158167 - BLOCK
      ?auto_158168 - BLOCK
    )
    :vars
    (
      ?auto_158169 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158161 ?auto_158162 ) ) ( not ( = ?auto_158161 ?auto_158163 ) ) ( not ( = ?auto_158161 ?auto_158164 ) ) ( not ( = ?auto_158161 ?auto_158165 ) ) ( not ( = ?auto_158161 ?auto_158166 ) ) ( not ( = ?auto_158161 ?auto_158167 ) ) ( not ( = ?auto_158161 ?auto_158168 ) ) ( not ( = ?auto_158162 ?auto_158163 ) ) ( not ( = ?auto_158162 ?auto_158164 ) ) ( not ( = ?auto_158162 ?auto_158165 ) ) ( not ( = ?auto_158162 ?auto_158166 ) ) ( not ( = ?auto_158162 ?auto_158167 ) ) ( not ( = ?auto_158162 ?auto_158168 ) ) ( not ( = ?auto_158163 ?auto_158164 ) ) ( not ( = ?auto_158163 ?auto_158165 ) ) ( not ( = ?auto_158163 ?auto_158166 ) ) ( not ( = ?auto_158163 ?auto_158167 ) ) ( not ( = ?auto_158163 ?auto_158168 ) ) ( not ( = ?auto_158164 ?auto_158165 ) ) ( not ( = ?auto_158164 ?auto_158166 ) ) ( not ( = ?auto_158164 ?auto_158167 ) ) ( not ( = ?auto_158164 ?auto_158168 ) ) ( not ( = ?auto_158165 ?auto_158166 ) ) ( not ( = ?auto_158165 ?auto_158167 ) ) ( not ( = ?auto_158165 ?auto_158168 ) ) ( not ( = ?auto_158166 ?auto_158167 ) ) ( not ( = ?auto_158166 ?auto_158168 ) ) ( not ( = ?auto_158167 ?auto_158168 ) ) ( ON ?auto_158161 ?auto_158169 ) ( not ( = ?auto_158161 ?auto_158169 ) ) ( not ( = ?auto_158162 ?auto_158169 ) ) ( not ( = ?auto_158163 ?auto_158169 ) ) ( not ( = ?auto_158164 ?auto_158169 ) ) ( not ( = ?auto_158165 ?auto_158169 ) ) ( not ( = ?auto_158166 ?auto_158169 ) ) ( not ( = ?auto_158167 ?auto_158169 ) ) ( not ( = ?auto_158168 ?auto_158169 ) ) ( ON ?auto_158162 ?auto_158161 ) ( ON-TABLE ?auto_158169 ) ( ON ?auto_158163 ?auto_158162 ) ( ON ?auto_158164 ?auto_158163 ) ( ON ?auto_158165 ?auto_158164 ) ( ON ?auto_158166 ?auto_158165 ) ( ON ?auto_158167 ?auto_158166 ) ( ON ?auto_158168 ?auto_158167 ) ( CLEAR ?auto_158168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_158169 ?auto_158161 ?auto_158162 ?auto_158163 ?auto_158164 ?auto_158165 ?auto_158166 ?auto_158167 )
      ( MAKE-8PILE ?auto_158161 ?auto_158162 ?auto_158163 ?auto_158164 ?auto_158165 ?auto_158166 ?auto_158167 ?auto_158168 ) )
  )

)

