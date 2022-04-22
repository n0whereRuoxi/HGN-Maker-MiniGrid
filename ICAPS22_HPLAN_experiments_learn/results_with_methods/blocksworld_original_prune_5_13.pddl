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
      ?auto_27946 - BLOCK
      ?auto_27947 - BLOCK
      ?auto_27948 - BLOCK
      ?auto_27949 - BLOCK
      ?auto_27950 - BLOCK
    )
    :vars
    (
      ?auto_27951 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27951 ?auto_27950 ) ( CLEAR ?auto_27951 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27946 ) ( ON ?auto_27947 ?auto_27946 ) ( ON ?auto_27948 ?auto_27947 ) ( ON ?auto_27949 ?auto_27948 ) ( ON ?auto_27950 ?auto_27949 ) ( not ( = ?auto_27946 ?auto_27947 ) ) ( not ( = ?auto_27946 ?auto_27948 ) ) ( not ( = ?auto_27946 ?auto_27949 ) ) ( not ( = ?auto_27946 ?auto_27950 ) ) ( not ( = ?auto_27946 ?auto_27951 ) ) ( not ( = ?auto_27947 ?auto_27948 ) ) ( not ( = ?auto_27947 ?auto_27949 ) ) ( not ( = ?auto_27947 ?auto_27950 ) ) ( not ( = ?auto_27947 ?auto_27951 ) ) ( not ( = ?auto_27948 ?auto_27949 ) ) ( not ( = ?auto_27948 ?auto_27950 ) ) ( not ( = ?auto_27948 ?auto_27951 ) ) ( not ( = ?auto_27949 ?auto_27950 ) ) ( not ( = ?auto_27949 ?auto_27951 ) ) ( not ( = ?auto_27950 ?auto_27951 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27951 ?auto_27950 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27953 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_27953 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_27953 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27954 - BLOCK
    )
    :vars
    (
      ?auto_27955 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27954 ?auto_27955 ) ( CLEAR ?auto_27954 ) ( HAND-EMPTY ) ( not ( = ?auto_27954 ?auto_27955 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27954 ?auto_27955 )
      ( MAKE-1PILE ?auto_27954 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27960 - BLOCK
      ?auto_27961 - BLOCK
      ?auto_27962 - BLOCK
      ?auto_27963 - BLOCK
    )
    :vars
    (
      ?auto_27964 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27964 ?auto_27963 ) ( CLEAR ?auto_27964 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27960 ) ( ON ?auto_27961 ?auto_27960 ) ( ON ?auto_27962 ?auto_27961 ) ( ON ?auto_27963 ?auto_27962 ) ( not ( = ?auto_27960 ?auto_27961 ) ) ( not ( = ?auto_27960 ?auto_27962 ) ) ( not ( = ?auto_27960 ?auto_27963 ) ) ( not ( = ?auto_27960 ?auto_27964 ) ) ( not ( = ?auto_27961 ?auto_27962 ) ) ( not ( = ?auto_27961 ?auto_27963 ) ) ( not ( = ?auto_27961 ?auto_27964 ) ) ( not ( = ?auto_27962 ?auto_27963 ) ) ( not ( = ?auto_27962 ?auto_27964 ) ) ( not ( = ?auto_27963 ?auto_27964 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27964 ?auto_27963 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27965 - BLOCK
      ?auto_27966 - BLOCK
      ?auto_27967 - BLOCK
      ?auto_27968 - BLOCK
    )
    :vars
    (
      ?auto_27969 - BLOCK
      ?auto_27970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27969 ?auto_27968 ) ( CLEAR ?auto_27969 ) ( ON-TABLE ?auto_27965 ) ( ON ?auto_27966 ?auto_27965 ) ( ON ?auto_27967 ?auto_27966 ) ( ON ?auto_27968 ?auto_27967 ) ( not ( = ?auto_27965 ?auto_27966 ) ) ( not ( = ?auto_27965 ?auto_27967 ) ) ( not ( = ?auto_27965 ?auto_27968 ) ) ( not ( = ?auto_27965 ?auto_27969 ) ) ( not ( = ?auto_27966 ?auto_27967 ) ) ( not ( = ?auto_27966 ?auto_27968 ) ) ( not ( = ?auto_27966 ?auto_27969 ) ) ( not ( = ?auto_27967 ?auto_27968 ) ) ( not ( = ?auto_27967 ?auto_27969 ) ) ( not ( = ?auto_27968 ?auto_27969 ) ) ( HOLDING ?auto_27970 ) ( not ( = ?auto_27965 ?auto_27970 ) ) ( not ( = ?auto_27966 ?auto_27970 ) ) ( not ( = ?auto_27967 ?auto_27970 ) ) ( not ( = ?auto_27968 ?auto_27970 ) ) ( not ( = ?auto_27969 ?auto_27970 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_27970 )
      ( MAKE-4PILE ?auto_27965 ?auto_27966 ?auto_27967 ?auto_27968 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27971 - BLOCK
      ?auto_27972 - BLOCK
      ?auto_27973 - BLOCK
      ?auto_27974 - BLOCK
    )
    :vars
    (
      ?auto_27975 - BLOCK
      ?auto_27976 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27975 ?auto_27974 ) ( ON-TABLE ?auto_27971 ) ( ON ?auto_27972 ?auto_27971 ) ( ON ?auto_27973 ?auto_27972 ) ( ON ?auto_27974 ?auto_27973 ) ( not ( = ?auto_27971 ?auto_27972 ) ) ( not ( = ?auto_27971 ?auto_27973 ) ) ( not ( = ?auto_27971 ?auto_27974 ) ) ( not ( = ?auto_27971 ?auto_27975 ) ) ( not ( = ?auto_27972 ?auto_27973 ) ) ( not ( = ?auto_27972 ?auto_27974 ) ) ( not ( = ?auto_27972 ?auto_27975 ) ) ( not ( = ?auto_27973 ?auto_27974 ) ) ( not ( = ?auto_27973 ?auto_27975 ) ) ( not ( = ?auto_27974 ?auto_27975 ) ) ( not ( = ?auto_27971 ?auto_27976 ) ) ( not ( = ?auto_27972 ?auto_27976 ) ) ( not ( = ?auto_27973 ?auto_27976 ) ) ( not ( = ?auto_27974 ?auto_27976 ) ) ( not ( = ?auto_27975 ?auto_27976 ) ) ( ON ?auto_27976 ?auto_27975 ) ( CLEAR ?auto_27976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27971 ?auto_27972 ?auto_27973 ?auto_27974 ?auto_27975 )
      ( MAKE-4PILE ?auto_27971 ?auto_27972 ?auto_27973 ?auto_27974 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27979 - BLOCK
      ?auto_27980 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_27980 ) ( CLEAR ?auto_27979 ) ( ON-TABLE ?auto_27979 ) ( not ( = ?auto_27979 ?auto_27980 ) ) )
    :subtasks
    ( ( !STACK ?auto_27980 ?auto_27979 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27981 - BLOCK
      ?auto_27982 - BLOCK
    )
    :vars
    (
      ?auto_27983 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_27981 ) ( ON-TABLE ?auto_27981 ) ( not ( = ?auto_27981 ?auto_27982 ) ) ( ON ?auto_27982 ?auto_27983 ) ( CLEAR ?auto_27982 ) ( HAND-EMPTY ) ( not ( = ?auto_27981 ?auto_27983 ) ) ( not ( = ?auto_27982 ?auto_27983 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27982 ?auto_27983 )
      ( MAKE-2PILE ?auto_27981 ?auto_27982 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27984 - BLOCK
      ?auto_27985 - BLOCK
    )
    :vars
    (
      ?auto_27986 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27984 ?auto_27985 ) ) ( ON ?auto_27985 ?auto_27986 ) ( CLEAR ?auto_27985 ) ( not ( = ?auto_27984 ?auto_27986 ) ) ( not ( = ?auto_27985 ?auto_27986 ) ) ( HOLDING ?auto_27984 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27984 )
      ( MAKE-2PILE ?auto_27984 ?auto_27985 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27987 - BLOCK
      ?auto_27988 - BLOCK
    )
    :vars
    (
      ?auto_27989 - BLOCK
      ?auto_27990 - BLOCK
      ?auto_27991 - BLOCK
      ?auto_27992 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27987 ?auto_27988 ) ) ( ON ?auto_27988 ?auto_27989 ) ( not ( = ?auto_27987 ?auto_27989 ) ) ( not ( = ?auto_27988 ?auto_27989 ) ) ( ON ?auto_27987 ?auto_27988 ) ( CLEAR ?auto_27987 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27990 ) ( ON ?auto_27991 ?auto_27990 ) ( ON ?auto_27992 ?auto_27991 ) ( ON ?auto_27989 ?auto_27992 ) ( not ( = ?auto_27990 ?auto_27991 ) ) ( not ( = ?auto_27990 ?auto_27992 ) ) ( not ( = ?auto_27990 ?auto_27989 ) ) ( not ( = ?auto_27990 ?auto_27988 ) ) ( not ( = ?auto_27990 ?auto_27987 ) ) ( not ( = ?auto_27991 ?auto_27992 ) ) ( not ( = ?auto_27991 ?auto_27989 ) ) ( not ( = ?auto_27991 ?auto_27988 ) ) ( not ( = ?auto_27991 ?auto_27987 ) ) ( not ( = ?auto_27992 ?auto_27989 ) ) ( not ( = ?auto_27992 ?auto_27988 ) ) ( not ( = ?auto_27992 ?auto_27987 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27990 ?auto_27991 ?auto_27992 ?auto_27989 ?auto_27988 )
      ( MAKE-2PILE ?auto_27987 ?auto_27988 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27996 - BLOCK
      ?auto_27997 - BLOCK
      ?auto_27998 - BLOCK
    )
    :vars
    (
      ?auto_27999 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27999 ?auto_27998 ) ( CLEAR ?auto_27999 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27996 ) ( ON ?auto_27997 ?auto_27996 ) ( ON ?auto_27998 ?auto_27997 ) ( not ( = ?auto_27996 ?auto_27997 ) ) ( not ( = ?auto_27996 ?auto_27998 ) ) ( not ( = ?auto_27996 ?auto_27999 ) ) ( not ( = ?auto_27997 ?auto_27998 ) ) ( not ( = ?auto_27997 ?auto_27999 ) ) ( not ( = ?auto_27998 ?auto_27999 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27999 ?auto_27998 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28000 - BLOCK
      ?auto_28001 - BLOCK
      ?auto_28002 - BLOCK
    )
    :vars
    (
      ?auto_28003 - BLOCK
      ?auto_28004 - BLOCK
      ?auto_28005 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28003 ?auto_28002 ) ( CLEAR ?auto_28003 ) ( ON-TABLE ?auto_28000 ) ( ON ?auto_28001 ?auto_28000 ) ( ON ?auto_28002 ?auto_28001 ) ( not ( = ?auto_28000 ?auto_28001 ) ) ( not ( = ?auto_28000 ?auto_28002 ) ) ( not ( = ?auto_28000 ?auto_28003 ) ) ( not ( = ?auto_28001 ?auto_28002 ) ) ( not ( = ?auto_28001 ?auto_28003 ) ) ( not ( = ?auto_28002 ?auto_28003 ) ) ( HOLDING ?auto_28004 ) ( CLEAR ?auto_28005 ) ( not ( = ?auto_28000 ?auto_28004 ) ) ( not ( = ?auto_28000 ?auto_28005 ) ) ( not ( = ?auto_28001 ?auto_28004 ) ) ( not ( = ?auto_28001 ?auto_28005 ) ) ( not ( = ?auto_28002 ?auto_28004 ) ) ( not ( = ?auto_28002 ?auto_28005 ) ) ( not ( = ?auto_28003 ?auto_28004 ) ) ( not ( = ?auto_28003 ?auto_28005 ) ) ( not ( = ?auto_28004 ?auto_28005 ) ) )
    :subtasks
    ( ( !STACK ?auto_28004 ?auto_28005 )
      ( MAKE-3PILE ?auto_28000 ?auto_28001 ?auto_28002 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28368 - BLOCK
      ?auto_28369 - BLOCK
      ?auto_28370 - BLOCK
    )
    :vars
    (
      ?auto_28372 - BLOCK
      ?auto_28371 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28372 ?auto_28370 ) ( ON-TABLE ?auto_28368 ) ( ON ?auto_28369 ?auto_28368 ) ( ON ?auto_28370 ?auto_28369 ) ( not ( = ?auto_28368 ?auto_28369 ) ) ( not ( = ?auto_28368 ?auto_28370 ) ) ( not ( = ?auto_28368 ?auto_28372 ) ) ( not ( = ?auto_28369 ?auto_28370 ) ) ( not ( = ?auto_28369 ?auto_28372 ) ) ( not ( = ?auto_28370 ?auto_28372 ) ) ( not ( = ?auto_28368 ?auto_28371 ) ) ( not ( = ?auto_28369 ?auto_28371 ) ) ( not ( = ?auto_28370 ?auto_28371 ) ) ( not ( = ?auto_28372 ?auto_28371 ) ) ( ON ?auto_28371 ?auto_28372 ) ( CLEAR ?auto_28371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28368 ?auto_28369 ?auto_28370 ?auto_28372 )
      ( MAKE-3PILE ?auto_28368 ?auto_28369 ?auto_28370 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28012 - BLOCK
      ?auto_28013 - BLOCK
      ?auto_28014 - BLOCK
    )
    :vars
    (
      ?auto_28017 - BLOCK
      ?auto_28016 - BLOCK
      ?auto_28015 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28017 ?auto_28014 ) ( ON-TABLE ?auto_28012 ) ( ON ?auto_28013 ?auto_28012 ) ( ON ?auto_28014 ?auto_28013 ) ( not ( = ?auto_28012 ?auto_28013 ) ) ( not ( = ?auto_28012 ?auto_28014 ) ) ( not ( = ?auto_28012 ?auto_28017 ) ) ( not ( = ?auto_28013 ?auto_28014 ) ) ( not ( = ?auto_28013 ?auto_28017 ) ) ( not ( = ?auto_28014 ?auto_28017 ) ) ( not ( = ?auto_28012 ?auto_28016 ) ) ( not ( = ?auto_28012 ?auto_28015 ) ) ( not ( = ?auto_28013 ?auto_28016 ) ) ( not ( = ?auto_28013 ?auto_28015 ) ) ( not ( = ?auto_28014 ?auto_28016 ) ) ( not ( = ?auto_28014 ?auto_28015 ) ) ( not ( = ?auto_28017 ?auto_28016 ) ) ( not ( = ?auto_28017 ?auto_28015 ) ) ( not ( = ?auto_28016 ?auto_28015 ) ) ( ON ?auto_28016 ?auto_28017 ) ( CLEAR ?auto_28016 ) ( HOLDING ?auto_28015 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28015 )
      ( MAKE-3PILE ?auto_28012 ?auto_28013 ?auto_28014 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28018 - BLOCK
      ?auto_28019 - BLOCK
      ?auto_28020 - BLOCK
    )
    :vars
    (
      ?auto_28021 - BLOCK
      ?auto_28022 - BLOCK
      ?auto_28023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28021 ?auto_28020 ) ( ON-TABLE ?auto_28018 ) ( ON ?auto_28019 ?auto_28018 ) ( ON ?auto_28020 ?auto_28019 ) ( not ( = ?auto_28018 ?auto_28019 ) ) ( not ( = ?auto_28018 ?auto_28020 ) ) ( not ( = ?auto_28018 ?auto_28021 ) ) ( not ( = ?auto_28019 ?auto_28020 ) ) ( not ( = ?auto_28019 ?auto_28021 ) ) ( not ( = ?auto_28020 ?auto_28021 ) ) ( not ( = ?auto_28018 ?auto_28022 ) ) ( not ( = ?auto_28018 ?auto_28023 ) ) ( not ( = ?auto_28019 ?auto_28022 ) ) ( not ( = ?auto_28019 ?auto_28023 ) ) ( not ( = ?auto_28020 ?auto_28022 ) ) ( not ( = ?auto_28020 ?auto_28023 ) ) ( not ( = ?auto_28021 ?auto_28022 ) ) ( not ( = ?auto_28021 ?auto_28023 ) ) ( not ( = ?auto_28022 ?auto_28023 ) ) ( ON ?auto_28022 ?auto_28021 ) ( ON ?auto_28023 ?auto_28022 ) ( CLEAR ?auto_28023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28018 ?auto_28019 ?auto_28020 ?auto_28021 ?auto_28022 )
      ( MAKE-3PILE ?auto_28018 ?auto_28019 ?auto_28020 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28027 - BLOCK
      ?auto_28028 - BLOCK
      ?auto_28029 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_28029 ) ( CLEAR ?auto_28028 ) ( ON-TABLE ?auto_28027 ) ( ON ?auto_28028 ?auto_28027 ) ( not ( = ?auto_28027 ?auto_28028 ) ) ( not ( = ?auto_28027 ?auto_28029 ) ) ( not ( = ?auto_28028 ?auto_28029 ) ) )
    :subtasks
    ( ( !STACK ?auto_28029 ?auto_28028 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28030 - BLOCK
      ?auto_28031 - BLOCK
      ?auto_28032 - BLOCK
    )
    :vars
    (
      ?auto_28033 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_28031 ) ( ON-TABLE ?auto_28030 ) ( ON ?auto_28031 ?auto_28030 ) ( not ( = ?auto_28030 ?auto_28031 ) ) ( not ( = ?auto_28030 ?auto_28032 ) ) ( not ( = ?auto_28031 ?auto_28032 ) ) ( ON ?auto_28032 ?auto_28033 ) ( CLEAR ?auto_28032 ) ( HAND-EMPTY ) ( not ( = ?auto_28030 ?auto_28033 ) ) ( not ( = ?auto_28031 ?auto_28033 ) ) ( not ( = ?auto_28032 ?auto_28033 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28032 ?auto_28033 )
      ( MAKE-3PILE ?auto_28030 ?auto_28031 ?auto_28032 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28034 - BLOCK
      ?auto_28035 - BLOCK
      ?auto_28036 - BLOCK
    )
    :vars
    (
      ?auto_28037 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28034 ) ( not ( = ?auto_28034 ?auto_28035 ) ) ( not ( = ?auto_28034 ?auto_28036 ) ) ( not ( = ?auto_28035 ?auto_28036 ) ) ( ON ?auto_28036 ?auto_28037 ) ( CLEAR ?auto_28036 ) ( not ( = ?auto_28034 ?auto_28037 ) ) ( not ( = ?auto_28035 ?auto_28037 ) ) ( not ( = ?auto_28036 ?auto_28037 ) ) ( HOLDING ?auto_28035 ) ( CLEAR ?auto_28034 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28034 ?auto_28035 )
      ( MAKE-3PILE ?auto_28034 ?auto_28035 ?auto_28036 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28038 - BLOCK
      ?auto_28039 - BLOCK
      ?auto_28040 - BLOCK
    )
    :vars
    (
      ?auto_28041 - BLOCK
      ?auto_28042 - BLOCK
      ?auto_28043 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28038 ) ( not ( = ?auto_28038 ?auto_28039 ) ) ( not ( = ?auto_28038 ?auto_28040 ) ) ( not ( = ?auto_28039 ?auto_28040 ) ) ( ON ?auto_28040 ?auto_28041 ) ( not ( = ?auto_28038 ?auto_28041 ) ) ( not ( = ?auto_28039 ?auto_28041 ) ) ( not ( = ?auto_28040 ?auto_28041 ) ) ( CLEAR ?auto_28038 ) ( ON ?auto_28039 ?auto_28040 ) ( CLEAR ?auto_28039 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28042 ) ( ON ?auto_28043 ?auto_28042 ) ( ON ?auto_28041 ?auto_28043 ) ( not ( = ?auto_28042 ?auto_28043 ) ) ( not ( = ?auto_28042 ?auto_28041 ) ) ( not ( = ?auto_28042 ?auto_28040 ) ) ( not ( = ?auto_28042 ?auto_28039 ) ) ( not ( = ?auto_28043 ?auto_28041 ) ) ( not ( = ?auto_28043 ?auto_28040 ) ) ( not ( = ?auto_28043 ?auto_28039 ) ) ( not ( = ?auto_28038 ?auto_28042 ) ) ( not ( = ?auto_28038 ?auto_28043 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28042 ?auto_28043 ?auto_28041 ?auto_28040 )
      ( MAKE-3PILE ?auto_28038 ?auto_28039 ?auto_28040 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28044 - BLOCK
      ?auto_28045 - BLOCK
      ?auto_28046 - BLOCK
    )
    :vars
    (
      ?auto_28047 - BLOCK
      ?auto_28048 - BLOCK
      ?auto_28049 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28044 ?auto_28045 ) ) ( not ( = ?auto_28044 ?auto_28046 ) ) ( not ( = ?auto_28045 ?auto_28046 ) ) ( ON ?auto_28046 ?auto_28047 ) ( not ( = ?auto_28044 ?auto_28047 ) ) ( not ( = ?auto_28045 ?auto_28047 ) ) ( not ( = ?auto_28046 ?auto_28047 ) ) ( ON ?auto_28045 ?auto_28046 ) ( CLEAR ?auto_28045 ) ( ON-TABLE ?auto_28048 ) ( ON ?auto_28049 ?auto_28048 ) ( ON ?auto_28047 ?auto_28049 ) ( not ( = ?auto_28048 ?auto_28049 ) ) ( not ( = ?auto_28048 ?auto_28047 ) ) ( not ( = ?auto_28048 ?auto_28046 ) ) ( not ( = ?auto_28048 ?auto_28045 ) ) ( not ( = ?auto_28049 ?auto_28047 ) ) ( not ( = ?auto_28049 ?auto_28046 ) ) ( not ( = ?auto_28049 ?auto_28045 ) ) ( not ( = ?auto_28044 ?auto_28048 ) ) ( not ( = ?auto_28044 ?auto_28049 ) ) ( HOLDING ?auto_28044 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28044 )
      ( MAKE-3PILE ?auto_28044 ?auto_28045 ?auto_28046 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28050 - BLOCK
      ?auto_28051 - BLOCK
      ?auto_28052 - BLOCK
    )
    :vars
    (
      ?auto_28054 - BLOCK
      ?auto_28055 - BLOCK
      ?auto_28053 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28050 ?auto_28051 ) ) ( not ( = ?auto_28050 ?auto_28052 ) ) ( not ( = ?auto_28051 ?auto_28052 ) ) ( ON ?auto_28052 ?auto_28054 ) ( not ( = ?auto_28050 ?auto_28054 ) ) ( not ( = ?auto_28051 ?auto_28054 ) ) ( not ( = ?auto_28052 ?auto_28054 ) ) ( ON ?auto_28051 ?auto_28052 ) ( ON-TABLE ?auto_28055 ) ( ON ?auto_28053 ?auto_28055 ) ( ON ?auto_28054 ?auto_28053 ) ( not ( = ?auto_28055 ?auto_28053 ) ) ( not ( = ?auto_28055 ?auto_28054 ) ) ( not ( = ?auto_28055 ?auto_28052 ) ) ( not ( = ?auto_28055 ?auto_28051 ) ) ( not ( = ?auto_28053 ?auto_28054 ) ) ( not ( = ?auto_28053 ?auto_28052 ) ) ( not ( = ?auto_28053 ?auto_28051 ) ) ( not ( = ?auto_28050 ?auto_28055 ) ) ( not ( = ?auto_28050 ?auto_28053 ) ) ( ON ?auto_28050 ?auto_28051 ) ( CLEAR ?auto_28050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28055 ?auto_28053 ?auto_28054 ?auto_28052 ?auto_28051 )
      ( MAKE-3PILE ?auto_28050 ?auto_28051 ?auto_28052 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28058 - BLOCK
      ?auto_28059 - BLOCK
    )
    :vars
    (
      ?auto_28060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28060 ?auto_28059 ) ( CLEAR ?auto_28060 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28058 ) ( ON ?auto_28059 ?auto_28058 ) ( not ( = ?auto_28058 ?auto_28059 ) ) ( not ( = ?auto_28058 ?auto_28060 ) ) ( not ( = ?auto_28059 ?auto_28060 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28060 ?auto_28059 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28061 - BLOCK
      ?auto_28062 - BLOCK
    )
    :vars
    (
      ?auto_28063 - BLOCK
      ?auto_28064 - BLOCK
      ?auto_28065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28063 ?auto_28062 ) ( CLEAR ?auto_28063 ) ( ON-TABLE ?auto_28061 ) ( ON ?auto_28062 ?auto_28061 ) ( not ( = ?auto_28061 ?auto_28062 ) ) ( not ( = ?auto_28061 ?auto_28063 ) ) ( not ( = ?auto_28062 ?auto_28063 ) ) ( HOLDING ?auto_28064 ) ( CLEAR ?auto_28065 ) ( not ( = ?auto_28061 ?auto_28064 ) ) ( not ( = ?auto_28061 ?auto_28065 ) ) ( not ( = ?auto_28062 ?auto_28064 ) ) ( not ( = ?auto_28062 ?auto_28065 ) ) ( not ( = ?auto_28063 ?auto_28064 ) ) ( not ( = ?auto_28063 ?auto_28065 ) ) ( not ( = ?auto_28064 ?auto_28065 ) ) )
    :subtasks
    ( ( !STACK ?auto_28064 ?auto_28065 )
      ( MAKE-2PILE ?auto_28061 ?auto_28062 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28066 - BLOCK
      ?auto_28067 - BLOCK
    )
    :vars
    (
      ?auto_28069 - BLOCK
      ?auto_28068 - BLOCK
      ?auto_28070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28069 ?auto_28067 ) ( ON-TABLE ?auto_28066 ) ( ON ?auto_28067 ?auto_28066 ) ( not ( = ?auto_28066 ?auto_28067 ) ) ( not ( = ?auto_28066 ?auto_28069 ) ) ( not ( = ?auto_28067 ?auto_28069 ) ) ( CLEAR ?auto_28068 ) ( not ( = ?auto_28066 ?auto_28070 ) ) ( not ( = ?auto_28066 ?auto_28068 ) ) ( not ( = ?auto_28067 ?auto_28070 ) ) ( not ( = ?auto_28067 ?auto_28068 ) ) ( not ( = ?auto_28069 ?auto_28070 ) ) ( not ( = ?auto_28069 ?auto_28068 ) ) ( not ( = ?auto_28070 ?auto_28068 ) ) ( ON ?auto_28070 ?auto_28069 ) ( CLEAR ?auto_28070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28066 ?auto_28067 ?auto_28069 )
      ( MAKE-2PILE ?auto_28066 ?auto_28067 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28071 - BLOCK
      ?auto_28072 - BLOCK
    )
    :vars
    (
      ?auto_28075 - BLOCK
      ?auto_28073 - BLOCK
      ?auto_28074 - BLOCK
      ?auto_28076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28075 ?auto_28072 ) ( ON-TABLE ?auto_28071 ) ( ON ?auto_28072 ?auto_28071 ) ( not ( = ?auto_28071 ?auto_28072 ) ) ( not ( = ?auto_28071 ?auto_28075 ) ) ( not ( = ?auto_28072 ?auto_28075 ) ) ( not ( = ?auto_28071 ?auto_28073 ) ) ( not ( = ?auto_28071 ?auto_28074 ) ) ( not ( = ?auto_28072 ?auto_28073 ) ) ( not ( = ?auto_28072 ?auto_28074 ) ) ( not ( = ?auto_28075 ?auto_28073 ) ) ( not ( = ?auto_28075 ?auto_28074 ) ) ( not ( = ?auto_28073 ?auto_28074 ) ) ( ON ?auto_28073 ?auto_28075 ) ( CLEAR ?auto_28073 ) ( HOLDING ?auto_28074 ) ( CLEAR ?auto_28076 ) ( ON-TABLE ?auto_28076 ) ( not ( = ?auto_28076 ?auto_28074 ) ) ( not ( = ?auto_28071 ?auto_28076 ) ) ( not ( = ?auto_28072 ?auto_28076 ) ) ( not ( = ?auto_28075 ?auto_28076 ) ) ( not ( = ?auto_28073 ?auto_28076 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28076 ?auto_28074 )
      ( MAKE-2PILE ?auto_28071 ?auto_28072 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28495 - BLOCK
      ?auto_28496 - BLOCK
    )
    :vars
    (
      ?auto_28497 - BLOCK
      ?auto_28498 - BLOCK
      ?auto_28499 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28497 ?auto_28496 ) ( ON-TABLE ?auto_28495 ) ( ON ?auto_28496 ?auto_28495 ) ( not ( = ?auto_28495 ?auto_28496 ) ) ( not ( = ?auto_28495 ?auto_28497 ) ) ( not ( = ?auto_28496 ?auto_28497 ) ) ( not ( = ?auto_28495 ?auto_28498 ) ) ( not ( = ?auto_28495 ?auto_28499 ) ) ( not ( = ?auto_28496 ?auto_28498 ) ) ( not ( = ?auto_28496 ?auto_28499 ) ) ( not ( = ?auto_28497 ?auto_28498 ) ) ( not ( = ?auto_28497 ?auto_28499 ) ) ( not ( = ?auto_28498 ?auto_28499 ) ) ( ON ?auto_28498 ?auto_28497 ) ( ON ?auto_28499 ?auto_28498 ) ( CLEAR ?auto_28499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28495 ?auto_28496 ?auto_28497 ?auto_28498 )
      ( MAKE-2PILE ?auto_28495 ?auto_28496 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28083 - BLOCK
      ?auto_28084 - BLOCK
    )
    :vars
    (
      ?auto_28087 - BLOCK
      ?auto_28086 - BLOCK
      ?auto_28085 - BLOCK
      ?auto_28088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28087 ?auto_28084 ) ( ON-TABLE ?auto_28083 ) ( ON ?auto_28084 ?auto_28083 ) ( not ( = ?auto_28083 ?auto_28084 ) ) ( not ( = ?auto_28083 ?auto_28087 ) ) ( not ( = ?auto_28084 ?auto_28087 ) ) ( not ( = ?auto_28083 ?auto_28086 ) ) ( not ( = ?auto_28083 ?auto_28085 ) ) ( not ( = ?auto_28084 ?auto_28086 ) ) ( not ( = ?auto_28084 ?auto_28085 ) ) ( not ( = ?auto_28087 ?auto_28086 ) ) ( not ( = ?auto_28087 ?auto_28085 ) ) ( not ( = ?auto_28086 ?auto_28085 ) ) ( ON ?auto_28086 ?auto_28087 ) ( not ( = ?auto_28088 ?auto_28085 ) ) ( not ( = ?auto_28083 ?auto_28088 ) ) ( not ( = ?auto_28084 ?auto_28088 ) ) ( not ( = ?auto_28087 ?auto_28088 ) ) ( not ( = ?auto_28086 ?auto_28088 ) ) ( ON ?auto_28085 ?auto_28086 ) ( CLEAR ?auto_28085 ) ( HOLDING ?auto_28088 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28088 )
      ( MAKE-2PILE ?auto_28083 ?auto_28084 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28089 - BLOCK
      ?auto_28090 - BLOCK
    )
    :vars
    (
      ?auto_28094 - BLOCK
      ?auto_28092 - BLOCK
      ?auto_28091 - BLOCK
      ?auto_28093 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28094 ?auto_28090 ) ( ON-TABLE ?auto_28089 ) ( ON ?auto_28090 ?auto_28089 ) ( not ( = ?auto_28089 ?auto_28090 ) ) ( not ( = ?auto_28089 ?auto_28094 ) ) ( not ( = ?auto_28090 ?auto_28094 ) ) ( not ( = ?auto_28089 ?auto_28092 ) ) ( not ( = ?auto_28089 ?auto_28091 ) ) ( not ( = ?auto_28090 ?auto_28092 ) ) ( not ( = ?auto_28090 ?auto_28091 ) ) ( not ( = ?auto_28094 ?auto_28092 ) ) ( not ( = ?auto_28094 ?auto_28091 ) ) ( not ( = ?auto_28092 ?auto_28091 ) ) ( ON ?auto_28092 ?auto_28094 ) ( not ( = ?auto_28093 ?auto_28091 ) ) ( not ( = ?auto_28089 ?auto_28093 ) ) ( not ( = ?auto_28090 ?auto_28093 ) ) ( not ( = ?auto_28094 ?auto_28093 ) ) ( not ( = ?auto_28092 ?auto_28093 ) ) ( ON ?auto_28091 ?auto_28092 ) ( ON ?auto_28093 ?auto_28091 ) ( CLEAR ?auto_28093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28089 ?auto_28090 ?auto_28094 ?auto_28092 ?auto_28091 )
      ( MAKE-2PILE ?auto_28089 ?auto_28090 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28099 - BLOCK
      ?auto_28100 - BLOCK
      ?auto_28101 - BLOCK
      ?auto_28102 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_28102 ) ( CLEAR ?auto_28101 ) ( ON-TABLE ?auto_28099 ) ( ON ?auto_28100 ?auto_28099 ) ( ON ?auto_28101 ?auto_28100 ) ( not ( = ?auto_28099 ?auto_28100 ) ) ( not ( = ?auto_28099 ?auto_28101 ) ) ( not ( = ?auto_28099 ?auto_28102 ) ) ( not ( = ?auto_28100 ?auto_28101 ) ) ( not ( = ?auto_28100 ?auto_28102 ) ) ( not ( = ?auto_28101 ?auto_28102 ) ) )
    :subtasks
    ( ( !STACK ?auto_28102 ?auto_28101 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28103 - BLOCK
      ?auto_28104 - BLOCK
      ?auto_28105 - BLOCK
      ?auto_28106 - BLOCK
    )
    :vars
    (
      ?auto_28107 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_28105 ) ( ON-TABLE ?auto_28103 ) ( ON ?auto_28104 ?auto_28103 ) ( ON ?auto_28105 ?auto_28104 ) ( not ( = ?auto_28103 ?auto_28104 ) ) ( not ( = ?auto_28103 ?auto_28105 ) ) ( not ( = ?auto_28103 ?auto_28106 ) ) ( not ( = ?auto_28104 ?auto_28105 ) ) ( not ( = ?auto_28104 ?auto_28106 ) ) ( not ( = ?auto_28105 ?auto_28106 ) ) ( ON ?auto_28106 ?auto_28107 ) ( CLEAR ?auto_28106 ) ( HAND-EMPTY ) ( not ( = ?auto_28103 ?auto_28107 ) ) ( not ( = ?auto_28104 ?auto_28107 ) ) ( not ( = ?auto_28105 ?auto_28107 ) ) ( not ( = ?auto_28106 ?auto_28107 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28106 ?auto_28107 )
      ( MAKE-4PILE ?auto_28103 ?auto_28104 ?auto_28105 ?auto_28106 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28108 - BLOCK
      ?auto_28109 - BLOCK
      ?auto_28110 - BLOCK
      ?auto_28111 - BLOCK
    )
    :vars
    (
      ?auto_28112 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28108 ) ( ON ?auto_28109 ?auto_28108 ) ( not ( = ?auto_28108 ?auto_28109 ) ) ( not ( = ?auto_28108 ?auto_28110 ) ) ( not ( = ?auto_28108 ?auto_28111 ) ) ( not ( = ?auto_28109 ?auto_28110 ) ) ( not ( = ?auto_28109 ?auto_28111 ) ) ( not ( = ?auto_28110 ?auto_28111 ) ) ( ON ?auto_28111 ?auto_28112 ) ( CLEAR ?auto_28111 ) ( not ( = ?auto_28108 ?auto_28112 ) ) ( not ( = ?auto_28109 ?auto_28112 ) ) ( not ( = ?auto_28110 ?auto_28112 ) ) ( not ( = ?auto_28111 ?auto_28112 ) ) ( HOLDING ?auto_28110 ) ( CLEAR ?auto_28109 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28108 ?auto_28109 ?auto_28110 )
      ( MAKE-4PILE ?auto_28108 ?auto_28109 ?auto_28110 ?auto_28111 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28113 - BLOCK
      ?auto_28114 - BLOCK
      ?auto_28115 - BLOCK
      ?auto_28116 - BLOCK
    )
    :vars
    (
      ?auto_28117 - BLOCK
      ?auto_28118 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28113 ) ( ON ?auto_28114 ?auto_28113 ) ( not ( = ?auto_28113 ?auto_28114 ) ) ( not ( = ?auto_28113 ?auto_28115 ) ) ( not ( = ?auto_28113 ?auto_28116 ) ) ( not ( = ?auto_28114 ?auto_28115 ) ) ( not ( = ?auto_28114 ?auto_28116 ) ) ( not ( = ?auto_28115 ?auto_28116 ) ) ( ON ?auto_28116 ?auto_28117 ) ( not ( = ?auto_28113 ?auto_28117 ) ) ( not ( = ?auto_28114 ?auto_28117 ) ) ( not ( = ?auto_28115 ?auto_28117 ) ) ( not ( = ?auto_28116 ?auto_28117 ) ) ( CLEAR ?auto_28114 ) ( ON ?auto_28115 ?auto_28116 ) ( CLEAR ?auto_28115 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28118 ) ( ON ?auto_28117 ?auto_28118 ) ( not ( = ?auto_28118 ?auto_28117 ) ) ( not ( = ?auto_28118 ?auto_28116 ) ) ( not ( = ?auto_28118 ?auto_28115 ) ) ( not ( = ?auto_28113 ?auto_28118 ) ) ( not ( = ?auto_28114 ?auto_28118 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28118 ?auto_28117 ?auto_28116 )
      ( MAKE-4PILE ?auto_28113 ?auto_28114 ?auto_28115 ?auto_28116 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28119 - BLOCK
      ?auto_28120 - BLOCK
      ?auto_28121 - BLOCK
      ?auto_28122 - BLOCK
    )
    :vars
    (
      ?auto_28124 - BLOCK
      ?auto_28123 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28119 ) ( not ( = ?auto_28119 ?auto_28120 ) ) ( not ( = ?auto_28119 ?auto_28121 ) ) ( not ( = ?auto_28119 ?auto_28122 ) ) ( not ( = ?auto_28120 ?auto_28121 ) ) ( not ( = ?auto_28120 ?auto_28122 ) ) ( not ( = ?auto_28121 ?auto_28122 ) ) ( ON ?auto_28122 ?auto_28124 ) ( not ( = ?auto_28119 ?auto_28124 ) ) ( not ( = ?auto_28120 ?auto_28124 ) ) ( not ( = ?auto_28121 ?auto_28124 ) ) ( not ( = ?auto_28122 ?auto_28124 ) ) ( ON ?auto_28121 ?auto_28122 ) ( CLEAR ?auto_28121 ) ( ON-TABLE ?auto_28123 ) ( ON ?auto_28124 ?auto_28123 ) ( not ( = ?auto_28123 ?auto_28124 ) ) ( not ( = ?auto_28123 ?auto_28122 ) ) ( not ( = ?auto_28123 ?auto_28121 ) ) ( not ( = ?auto_28119 ?auto_28123 ) ) ( not ( = ?auto_28120 ?auto_28123 ) ) ( HOLDING ?auto_28120 ) ( CLEAR ?auto_28119 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28119 ?auto_28120 )
      ( MAKE-4PILE ?auto_28119 ?auto_28120 ?auto_28121 ?auto_28122 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28125 - BLOCK
      ?auto_28126 - BLOCK
      ?auto_28127 - BLOCK
      ?auto_28128 - BLOCK
    )
    :vars
    (
      ?auto_28130 - BLOCK
      ?auto_28129 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28125 ) ( not ( = ?auto_28125 ?auto_28126 ) ) ( not ( = ?auto_28125 ?auto_28127 ) ) ( not ( = ?auto_28125 ?auto_28128 ) ) ( not ( = ?auto_28126 ?auto_28127 ) ) ( not ( = ?auto_28126 ?auto_28128 ) ) ( not ( = ?auto_28127 ?auto_28128 ) ) ( ON ?auto_28128 ?auto_28130 ) ( not ( = ?auto_28125 ?auto_28130 ) ) ( not ( = ?auto_28126 ?auto_28130 ) ) ( not ( = ?auto_28127 ?auto_28130 ) ) ( not ( = ?auto_28128 ?auto_28130 ) ) ( ON ?auto_28127 ?auto_28128 ) ( ON-TABLE ?auto_28129 ) ( ON ?auto_28130 ?auto_28129 ) ( not ( = ?auto_28129 ?auto_28130 ) ) ( not ( = ?auto_28129 ?auto_28128 ) ) ( not ( = ?auto_28129 ?auto_28127 ) ) ( not ( = ?auto_28125 ?auto_28129 ) ) ( not ( = ?auto_28126 ?auto_28129 ) ) ( CLEAR ?auto_28125 ) ( ON ?auto_28126 ?auto_28127 ) ( CLEAR ?auto_28126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28129 ?auto_28130 ?auto_28128 ?auto_28127 )
      ( MAKE-4PILE ?auto_28125 ?auto_28126 ?auto_28127 ?auto_28128 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28131 - BLOCK
      ?auto_28132 - BLOCK
      ?auto_28133 - BLOCK
      ?auto_28134 - BLOCK
    )
    :vars
    (
      ?auto_28135 - BLOCK
      ?auto_28136 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28131 ?auto_28132 ) ) ( not ( = ?auto_28131 ?auto_28133 ) ) ( not ( = ?auto_28131 ?auto_28134 ) ) ( not ( = ?auto_28132 ?auto_28133 ) ) ( not ( = ?auto_28132 ?auto_28134 ) ) ( not ( = ?auto_28133 ?auto_28134 ) ) ( ON ?auto_28134 ?auto_28135 ) ( not ( = ?auto_28131 ?auto_28135 ) ) ( not ( = ?auto_28132 ?auto_28135 ) ) ( not ( = ?auto_28133 ?auto_28135 ) ) ( not ( = ?auto_28134 ?auto_28135 ) ) ( ON ?auto_28133 ?auto_28134 ) ( ON-TABLE ?auto_28136 ) ( ON ?auto_28135 ?auto_28136 ) ( not ( = ?auto_28136 ?auto_28135 ) ) ( not ( = ?auto_28136 ?auto_28134 ) ) ( not ( = ?auto_28136 ?auto_28133 ) ) ( not ( = ?auto_28131 ?auto_28136 ) ) ( not ( = ?auto_28132 ?auto_28136 ) ) ( ON ?auto_28132 ?auto_28133 ) ( CLEAR ?auto_28132 ) ( HOLDING ?auto_28131 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28131 )
      ( MAKE-4PILE ?auto_28131 ?auto_28132 ?auto_28133 ?auto_28134 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28137 - BLOCK
      ?auto_28138 - BLOCK
      ?auto_28139 - BLOCK
      ?auto_28140 - BLOCK
    )
    :vars
    (
      ?auto_28142 - BLOCK
      ?auto_28141 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28137 ?auto_28138 ) ) ( not ( = ?auto_28137 ?auto_28139 ) ) ( not ( = ?auto_28137 ?auto_28140 ) ) ( not ( = ?auto_28138 ?auto_28139 ) ) ( not ( = ?auto_28138 ?auto_28140 ) ) ( not ( = ?auto_28139 ?auto_28140 ) ) ( ON ?auto_28140 ?auto_28142 ) ( not ( = ?auto_28137 ?auto_28142 ) ) ( not ( = ?auto_28138 ?auto_28142 ) ) ( not ( = ?auto_28139 ?auto_28142 ) ) ( not ( = ?auto_28140 ?auto_28142 ) ) ( ON ?auto_28139 ?auto_28140 ) ( ON-TABLE ?auto_28141 ) ( ON ?auto_28142 ?auto_28141 ) ( not ( = ?auto_28141 ?auto_28142 ) ) ( not ( = ?auto_28141 ?auto_28140 ) ) ( not ( = ?auto_28141 ?auto_28139 ) ) ( not ( = ?auto_28137 ?auto_28141 ) ) ( not ( = ?auto_28138 ?auto_28141 ) ) ( ON ?auto_28138 ?auto_28139 ) ( ON ?auto_28137 ?auto_28138 ) ( CLEAR ?auto_28137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28141 ?auto_28142 ?auto_28140 ?auto_28139 ?auto_28138 )
      ( MAKE-4PILE ?auto_28137 ?auto_28138 ?auto_28139 ?auto_28140 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28144 - BLOCK
    )
    :vars
    (
      ?auto_28145 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28145 ?auto_28144 ) ( CLEAR ?auto_28145 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28144 ) ( not ( = ?auto_28144 ?auto_28145 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28145 ?auto_28144 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28146 - BLOCK
    )
    :vars
    (
      ?auto_28147 - BLOCK
      ?auto_28148 - BLOCK
      ?auto_28149 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28147 ?auto_28146 ) ( CLEAR ?auto_28147 ) ( ON-TABLE ?auto_28146 ) ( not ( = ?auto_28146 ?auto_28147 ) ) ( HOLDING ?auto_28148 ) ( CLEAR ?auto_28149 ) ( not ( = ?auto_28146 ?auto_28148 ) ) ( not ( = ?auto_28146 ?auto_28149 ) ) ( not ( = ?auto_28147 ?auto_28148 ) ) ( not ( = ?auto_28147 ?auto_28149 ) ) ( not ( = ?auto_28148 ?auto_28149 ) ) )
    :subtasks
    ( ( !STACK ?auto_28148 ?auto_28149 )
      ( MAKE-1PILE ?auto_28146 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28150 - BLOCK
    )
    :vars
    (
      ?auto_28151 - BLOCK
      ?auto_28152 - BLOCK
      ?auto_28153 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28151 ?auto_28150 ) ( ON-TABLE ?auto_28150 ) ( not ( = ?auto_28150 ?auto_28151 ) ) ( CLEAR ?auto_28152 ) ( not ( = ?auto_28150 ?auto_28153 ) ) ( not ( = ?auto_28150 ?auto_28152 ) ) ( not ( = ?auto_28151 ?auto_28153 ) ) ( not ( = ?auto_28151 ?auto_28152 ) ) ( not ( = ?auto_28153 ?auto_28152 ) ) ( ON ?auto_28153 ?auto_28151 ) ( CLEAR ?auto_28153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28150 ?auto_28151 )
      ( MAKE-1PILE ?auto_28150 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28154 - BLOCK
    )
    :vars
    (
      ?auto_28156 - BLOCK
      ?auto_28157 - BLOCK
      ?auto_28155 - BLOCK
      ?auto_28159 - BLOCK
      ?auto_28158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28156 ?auto_28154 ) ( ON-TABLE ?auto_28154 ) ( not ( = ?auto_28154 ?auto_28156 ) ) ( not ( = ?auto_28154 ?auto_28157 ) ) ( not ( = ?auto_28154 ?auto_28155 ) ) ( not ( = ?auto_28156 ?auto_28157 ) ) ( not ( = ?auto_28156 ?auto_28155 ) ) ( not ( = ?auto_28157 ?auto_28155 ) ) ( ON ?auto_28157 ?auto_28156 ) ( CLEAR ?auto_28157 ) ( HOLDING ?auto_28155 ) ( CLEAR ?auto_28159 ) ( ON-TABLE ?auto_28158 ) ( ON ?auto_28159 ?auto_28158 ) ( not ( = ?auto_28158 ?auto_28159 ) ) ( not ( = ?auto_28158 ?auto_28155 ) ) ( not ( = ?auto_28159 ?auto_28155 ) ) ( not ( = ?auto_28154 ?auto_28159 ) ) ( not ( = ?auto_28154 ?auto_28158 ) ) ( not ( = ?auto_28156 ?auto_28159 ) ) ( not ( = ?auto_28156 ?auto_28158 ) ) ( not ( = ?auto_28157 ?auto_28159 ) ) ( not ( = ?auto_28157 ?auto_28158 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28158 ?auto_28159 ?auto_28155 )
      ( MAKE-1PILE ?auto_28154 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28160 - BLOCK
    )
    :vars
    (
      ?auto_28161 - BLOCK
      ?auto_28164 - BLOCK
      ?auto_28163 - BLOCK
      ?auto_28165 - BLOCK
      ?auto_28162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28161 ?auto_28160 ) ( ON-TABLE ?auto_28160 ) ( not ( = ?auto_28160 ?auto_28161 ) ) ( not ( = ?auto_28160 ?auto_28164 ) ) ( not ( = ?auto_28160 ?auto_28163 ) ) ( not ( = ?auto_28161 ?auto_28164 ) ) ( not ( = ?auto_28161 ?auto_28163 ) ) ( not ( = ?auto_28164 ?auto_28163 ) ) ( ON ?auto_28164 ?auto_28161 ) ( CLEAR ?auto_28165 ) ( ON-TABLE ?auto_28162 ) ( ON ?auto_28165 ?auto_28162 ) ( not ( = ?auto_28162 ?auto_28165 ) ) ( not ( = ?auto_28162 ?auto_28163 ) ) ( not ( = ?auto_28165 ?auto_28163 ) ) ( not ( = ?auto_28160 ?auto_28165 ) ) ( not ( = ?auto_28160 ?auto_28162 ) ) ( not ( = ?auto_28161 ?auto_28165 ) ) ( not ( = ?auto_28161 ?auto_28162 ) ) ( not ( = ?auto_28164 ?auto_28165 ) ) ( not ( = ?auto_28164 ?auto_28162 ) ) ( ON ?auto_28163 ?auto_28164 ) ( CLEAR ?auto_28163 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28160 ?auto_28161 ?auto_28164 )
      ( MAKE-1PILE ?auto_28160 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28166 - BLOCK
    )
    :vars
    (
      ?auto_28169 - BLOCK
      ?auto_28171 - BLOCK
      ?auto_28167 - BLOCK
      ?auto_28168 - BLOCK
      ?auto_28170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28169 ?auto_28166 ) ( ON-TABLE ?auto_28166 ) ( not ( = ?auto_28166 ?auto_28169 ) ) ( not ( = ?auto_28166 ?auto_28171 ) ) ( not ( = ?auto_28166 ?auto_28167 ) ) ( not ( = ?auto_28169 ?auto_28171 ) ) ( not ( = ?auto_28169 ?auto_28167 ) ) ( not ( = ?auto_28171 ?auto_28167 ) ) ( ON ?auto_28171 ?auto_28169 ) ( ON-TABLE ?auto_28168 ) ( not ( = ?auto_28168 ?auto_28170 ) ) ( not ( = ?auto_28168 ?auto_28167 ) ) ( not ( = ?auto_28170 ?auto_28167 ) ) ( not ( = ?auto_28166 ?auto_28170 ) ) ( not ( = ?auto_28166 ?auto_28168 ) ) ( not ( = ?auto_28169 ?auto_28170 ) ) ( not ( = ?auto_28169 ?auto_28168 ) ) ( not ( = ?auto_28171 ?auto_28170 ) ) ( not ( = ?auto_28171 ?auto_28168 ) ) ( ON ?auto_28167 ?auto_28171 ) ( CLEAR ?auto_28167 ) ( HOLDING ?auto_28170 ) ( CLEAR ?auto_28168 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28168 ?auto_28170 )
      ( MAKE-1PILE ?auto_28166 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28635 - BLOCK
    )
    :vars
    (
      ?auto_28638 - BLOCK
      ?auto_28637 - BLOCK
      ?auto_28636 - BLOCK
      ?auto_28639 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28638 ?auto_28635 ) ( ON-TABLE ?auto_28635 ) ( not ( = ?auto_28635 ?auto_28638 ) ) ( not ( = ?auto_28635 ?auto_28637 ) ) ( not ( = ?auto_28635 ?auto_28636 ) ) ( not ( = ?auto_28638 ?auto_28637 ) ) ( not ( = ?auto_28638 ?auto_28636 ) ) ( not ( = ?auto_28637 ?auto_28636 ) ) ( ON ?auto_28637 ?auto_28638 ) ( not ( = ?auto_28639 ?auto_28636 ) ) ( not ( = ?auto_28635 ?auto_28639 ) ) ( not ( = ?auto_28638 ?auto_28639 ) ) ( not ( = ?auto_28637 ?auto_28639 ) ) ( ON ?auto_28636 ?auto_28637 ) ( ON ?auto_28639 ?auto_28636 ) ( CLEAR ?auto_28639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28635 ?auto_28638 ?auto_28637 ?auto_28636 )
      ( MAKE-1PILE ?auto_28635 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28178 - BLOCK
    )
    :vars
    (
      ?auto_28183 - BLOCK
      ?auto_28181 - BLOCK
      ?auto_28180 - BLOCK
      ?auto_28182 - BLOCK
      ?auto_28179 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28183 ?auto_28178 ) ( ON-TABLE ?auto_28178 ) ( not ( = ?auto_28178 ?auto_28183 ) ) ( not ( = ?auto_28178 ?auto_28181 ) ) ( not ( = ?auto_28178 ?auto_28180 ) ) ( not ( = ?auto_28183 ?auto_28181 ) ) ( not ( = ?auto_28183 ?auto_28180 ) ) ( not ( = ?auto_28181 ?auto_28180 ) ) ( ON ?auto_28181 ?auto_28183 ) ( not ( = ?auto_28182 ?auto_28179 ) ) ( not ( = ?auto_28182 ?auto_28180 ) ) ( not ( = ?auto_28179 ?auto_28180 ) ) ( not ( = ?auto_28178 ?auto_28179 ) ) ( not ( = ?auto_28178 ?auto_28182 ) ) ( not ( = ?auto_28183 ?auto_28179 ) ) ( not ( = ?auto_28183 ?auto_28182 ) ) ( not ( = ?auto_28181 ?auto_28179 ) ) ( not ( = ?auto_28181 ?auto_28182 ) ) ( ON ?auto_28180 ?auto_28181 ) ( ON ?auto_28179 ?auto_28180 ) ( CLEAR ?auto_28179 ) ( HOLDING ?auto_28182 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28182 )
      ( MAKE-1PILE ?auto_28178 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28184 - BLOCK
    )
    :vars
    (
      ?auto_28186 - BLOCK
      ?auto_28187 - BLOCK
      ?auto_28185 - BLOCK
      ?auto_28189 - BLOCK
      ?auto_28188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28186 ?auto_28184 ) ( ON-TABLE ?auto_28184 ) ( not ( = ?auto_28184 ?auto_28186 ) ) ( not ( = ?auto_28184 ?auto_28187 ) ) ( not ( = ?auto_28184 ?auto_28185 ) ) ( not ( = ?auto_28186 ?auto_28187 ) ) ( not ( = ?auto_28186 ?auto_28185 ) ) ( not ( = ?auto_28187 ?auto_28185 ) ) ( ON ?auto_28187 ?auto_28186 ) ( not ( = ?auto_28189 ?auto_28188 ) ) ( not ( = ?auto_28189 ?auto_28185 ) ) ( not ( = ?auto_28188 ?auto_28185 ) ) ( not ( = ?auto_28184 ?auto_28188 ) ) ( not ( = ?auto_28184 ?auto_28189 ) ) ( not ( = ?auto_28186 ?auto_28188 ) ) ( not ( = ?auto_28186 ?auto_28189 ) ) ( not ( = ?auto_28187 ?auto_28188 ) ) ( not ( = ?auto_28187 ?auto_28189 ) ) ( ON ?auto_28185 ?auto_28187 ) ( ON ?auto_28188 ?auto_28185 ) ( ON ?auto_28189 ?auto_28188 ) ( CLEAR ?auto_28189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28184 ?auto_28186 ?auto_28187 ?auto_28185 ?auto_28188 )
      ( MAKE-1PILE ?auto_28184 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28195 - BLOCK
      ?auto_28196 - BLOCK
      ?auto_28197 - BLOCK
      ?auto_28198 - BLOCK
      ?auto_28199 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_28199 ) ( CLEAR ?auto_28198 ) ( ON-TABLE ?auto_28195 ) ( ON ?auto_28196 ?auto_28195 ) ( ON ?auto_28197 ?auto_28196 ) ( ON ?auto_28198 ?auto_28197 ) ( not ( = ?auto_28195 ?auto_28196 ) ) ( not ( = ?auto_28195 ?auto_28197 ) ) ( not ( = ?auto_28195 ?auto_28198 ) ) ( not ( = ?auto_28195 ?auto_28199 ) ) ( not ( = ?auto_28196 ?auto_28197 ) ) ( not ( = ?auto_28196 ?auto_28198 ) ) ( not ( = ?auto_28196 ?auto_28199 ) ) ( not ( = ?auto_28197 ?auto_28198 ) ) ( not ( = ?auto_28197 ?auto_28199 ) ) ( not ( = ?auto_28198 ?auto_28199 ) ) )
    :subtasks
    ( ( !STACK ?auto_28199 ?auto_28198 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28200 - BLOCK
      ?auto_28201 - BLOCK
      ?auto_28202 - BLOCK
      ?auto_28203 - BLOCK
      ?auto_28204 - BLOCK
    )
    :vars
    (
      ?auto_28205 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_28203 ) ( ON-TABLE ?auto_28200 ) ( ON ?auto_28201 ?auto_28200 ) ( ON ?auto_28202 ?auto_28201 ) ( ON ?auto_28203 ?auto_28202 ) ( not ( = ?auto_28200 ?auto_28201 ) ) ( not ( = ?auto_28200 ?auto_28202 ) ) ( not ( = ?auto_28200 ?auto_28203 ) ) ( not ( = ?auto_28200 ?auto_28204 ) ) ( not ( = ?auto_28201 ?auto_28202 ) ) ( not ( = ?auto_28201 ?auto_28203 ) ) ( not ( = ?auto_28201 ?auto_28204 ) ) ( not ( = ?auto_28202 ?auto_28203 ) ) ( not ( = ?auto_28202 ?auto_28204 ) ) ( not ( = ?auto_28203 ?auto_28204 ) ) ( ON ?auto_28204 ?auto_28205 ) ( CLEAR ?auto_28204 ) ( HAND-EMPTY ) ( not ( = ?auto_28200 ?auto_28205 ) ) ( not ( = ?auto_28201 ?auto_28205 ) ) ( not ( = ?auto_28202 ?auto_28205 ) ) ( not ( = ?auto_28203 ?auto_28205 ) ) ( not ( = ?auto_28204 ?auto_28205 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28204 ?auto_28205 )
      ( MAKE-5PILE ?auto_28200 ?auto_28201 ?auto_28202 ?auto_28203 ?auto_28204 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28206 - BLOCK
      ?auto_28207 - BLOCK
      ?auto_28208 - BLOCK
      ?auto_28209 - BLOCK
      ?auto_28210 - BLOCK
    )
    :vars
    (
      ?auto_28211 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28206 ) ( ON ?auto_28207 ?auto_28206 ) ( ON ?auto_28208 ?auto_28207 ) ( not ( = ?auto_28206 ?auto_28207 ) ) ( not ( = ?auto_28206 ?auto_28208 ) ) ( not ( = ?auto_28206 ?auto_28209 ) ) ( not ( = ?auto_28206 ?auto_28210 ) ) ( not ( = ?auto_28207 ?auto_28208 ) ) ( not ( = ?auto_28207 ?auto_28209 ) ) ( not ( = ?auto_28207 ?auto_28210 ) ) ( not ( = ?auto_28208 ?auto_28209 ) ) ( not ( = ?auto_28208 ?auto_28210 ) ) ( not ( = ?auto_28209 ?auto_28210 ) ) ( ON ?auto_28210 ?auto_28211 ) ( CLEAR ?auto_28210 ) ( not ( = ?auto_28206 ?auto_28211 ) ) ( not ( = ?auto_28207 ?auto_28211 ) ) ( not ( = ?auto_28208 ?auto_28211 ) ) ( not ( = ?auto_28209 ?auto_28211 ) ) ( not ( = ?auto_28210 ?auto_28211 ) ) ( HOLDING ?auto_28209 ) ( CLEAR ?auto_28208 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28206 ?auto_28207 ?auto_28208 ?auto_28209 )
      ( MAKE-5PILE ?auto_28206 ?auto_28207 ?auto_28208 ?auto_28209 ?auto_28210 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28212 - BLOCK
      ?auto_28213 - BLOCK
      ?auto_28214 - BLOCK
      ?auto_28215 - BLOCK
      ?auto_28216 - BLOCK
    )
    :vars
    (
      ?auto_28217 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28212 ) ( ON ?auto_28213 ?auto_28212 ) ( ON ?auto_28214 ?auto_28213 ) ( not ( = ?auto_28212 ?auto_28213 ) ) ( not ( = ?auto_28212 ?auto_28214 ) ) ( not ( = ?auto_28212 ?auto_28215 ) ) ( not ( = ?auto_28212 ?auto_28216 ) ) ( not ( = ?auto_28213 ?auto_28214 ) ) ( not ( = ?auto_28213 ?auto_28215 ) ) ( not ( = ?auto_28213 ?auto_28216 ) ) ( not ( = ?auto_28214 ?auto_28215 ) ) ( not ( = ?auto_28214 ?auto_28216 ) ) ( not ( = ?auto_28215 ?auto_28216 ) ) ( ON ?auto_28216 ?auto_28217 ) ( not ( = ?auto_28212 ?auto_28217 ) ) ( not ( = ?auto_28213 ?auto_28217 ) ) ( not ( = ?auto_28214 ?auto_28217 ) ) ( not ( = ?auto_28215 ?auto_28217 ) ) ( not ( = ?auto_28216 ?auto_28217 ) ) ( CLEAR ?auto_28214 ) ( ON ?auto_28215 ?auto_28216 ) ( CLEAR ?auto_28215 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28217 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28217 ?auto_28216 )
      ( MAKE-5PILE ?auto_28212 ?auto_28213 ?auto_28214 ?auto_28215 ?auto_28216 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28218 - BLOCK
      ?auto_28219 - BLOCK
      ?auto_28220 - BLOCK
      ?auto_28221 - BLOCK
      ?auto_28222 - BLOCK
    )
    :vars
    (
      ?auto_28223 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28218 ) ( ON ?auto_28219 ?auto_28218 ) ( not ( = ?auto_28218 ?auto_28219 ) ) ( not ( = ?auto_28218 ?auto_28220 ) ) ( not ( = ?auto_28218 ?auto_28221 ) ) ( not ( = ?auto_28218 ?auto_28222 ) ) ( not ( = ?auto_28219 ?auto_28220 ) ) ( not ( = ?auto_28219 ?auto_28221 ) ) ( not ( = ?auto_28219 ?auto_28222 ) ) ( not ( = ?auto_28220 ?auto_28221 ) ) ( not ( = ?auto_28220 ?auto_28222 ) ) ( not ( = ?auto_28221 ?auto_28222 ) ) ( ON ?auto_28222 ?auto_28223 ) ( not ( = ?auto_28218 ?auto_28223 ) ) ( not ( = ?auto_28219 ?auto_28223 ) ) ( not ( = ?auto_28220 ?auto_28223 ) ) ( not ( = ?auto_28221 ?auto_28223 ) ) ( not ( = ?auto_28222 ?auto_28223 ) ) ( ON ?auto_28221 ?auto_28222 ) ( CLEAR ?auto_28221 ) ( ON-TABLE ?auto_28223 ) ( HOLDING ?auto_28220 ) ( CLEAR ?auto_28219 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28218 ?auto_28219 ?auto_28220 )
      ( MAKE-5PILE ?auto_28218 ?auto_28219 ?auto_28220 ?auto_28221 ?auto_28222 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28224 - BLOCK
      ?auto_28225 - BLOCK
      ?auto_28226 - BLOCK
      ?auto_28227 - BLOCK
      ?auto_28228 - BLOCK
    )
    :vars
    (
      ?auto_28229 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28224 ) ( ON ?auto_28225 ?auto_28224 ) ( not ( = ?auto_28224 ?auto_28225 ) ) ( not ( = ?auto_28224 ?auto_28226 ) ) ( not ( = ?auto_28224 ?auto_28227 ) ) ( not ( = ?auto_28224 ?auto_28228 ) ) ( not ( = ?auto_28225 ?auto_28226 ) ) ( not ( = ?auto_28225 ?auto_28227 ) ) ( not ( = ?auto_28225 ?auto_28228 ) ) ( not ( = ?auto_28226 ?auto_28227 ) ) ( not ( = ?auto_28226 ?auto_28228 ) ) ( not ( = ?auto_28227 ?auto_28228 ) ) ( ON ?auto_28228 ?auto_28229 ) ( not ( = ?auto_28224 ?auto_28229 ) ) ( not ( = ?auto_28225 ?auto_28229 ) ) ( not ( = ?auto_28226 ?auto_28229 ) ) ( not ( = ?auto_28227 ?auto_28229 ) ) ( not ( = ?auto_28228 ?auto_28229 ) ) ( ON ?auto_28227 ?auto_28228 ) ( ON-TABLE ?auto_28229 ) ( CLEAR ?auto_28225 ) ( ON ?auto_28226 ?auto_28227 ) ( CLEAR ?auto_28226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28229 ?auto_28228 ?auto_28227 )
      ( MAKE-5PILE ?auto_28224 ?auto_28225 ?auto_28226 ?auto_28227 ?auto_28228 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28230 - BLOCK
      ?auto_28231 - BLOCK
      ?auto_28232 - BLOCK
      ?auto_28233 - BLOCK
      ?auto_28234 - BLOCK
    )
    :vars
    (
      ?auto_28235 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28230 ) ( not ( = ?auto_28230 ?auto_28231 ) ) ( not ( = ?auto_28230 ?auto_28232 ) ) ( not ( = ?auto_28230 ?auto_28233 ) ) ( not ( = ?auto_28230 ?auto_28234 ) ) ( not ( = ?auto_28231 ?auto_28232 ) ) ( not ( = ?auto_28231 ?auto_28233 ) ) ( not ( = ?auto_28231 ?auto_28234 ) ) ( not ( = ?auto_28232 ?auto_28233 ) ) ( not ( = ?auto_28232 ?auto_28234 ) ) ( not ( = ?auto_28233 ?auto_28234 ) ) ( ON ?auto_28234 ?auto_28235 ) ( not ( = ?auto_28230 ?auto_28235 ) ) ( not ( = ?auto_28231 ?auto_28235 ) ) ( not ( = ?auto_28232 ?auto_28235 ) ) ( not ( = ?auto_28233 ?auto_28235 ) ) ( not ( = ?auto_28234 ?auto_28235 ) ) ( ON ?auto_28233 ?auto_28234 ) ( ON-TABLE ?auto_28235 ) ( ON ?auto_28232 ?auto_28233 ) ( CLEAR ?auto_28232 ) ( HOLDING ?auto_28231 ) ( CLEAR ?auto_28230 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28230 ?auto_28231 )
      ( MAKE-5PILE ?auto_28230 ?auto_28231 ?auto_28232 ?auto_28233 ?auto_28234 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28236 - BLOCK
      ?auto_28237 - BLOCK
      ?auto_28238 - BLOCK
      ?auto_28239 - BLOCK
      ?auto_28240 - BLOCK
    )
    :vars
    (
      ?auto_28241 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28236 ) ( not ( = ?auto_28236 ?auto_28237 ) ) ( not ( = ?auto_28236 ?auto_28238 ) ) ( not ( = ?auto_28236 ?auto_28239 ) ) ( not ( = ?auto_28236 ?auto_28240 ) ) ( not ( = ?auto_28237 ?auto_28238 ) ) ( not ( = ?auto_28237 ?auto_28239 ) ) ( not ( = ?auto_28237 ?auto_28240 ) ) ( not ( = ?auto_28238 ?auto_28239 ) ) ( not ( = ?auto_28238 ?auto_28240 ) ) ( not ( = ?auto_28239 ?auto_28240 ) ) ( ON ?auto_28240 ?auto_28241 ) ( not ( = ?auto_28236 ?auto_28241 ) ) ( not ( = ?auto_28237 ?auto_28241 ) ) ( not ( = ?auto_28238 ?auto_28241 ) ) ( not ( = ?auto_28239 ?auto_28241 ) ) ( not ( = ?auto_28240 ?auto_28241 ) ) ( ON ?auto_28239 ?auto_28240 ) ( ON-TABLE ?auto_28241 ) ( ON ?auto_28238 ?auto_28239 ) ( CLEAR ?auto_28236 ) ( ON ?auto_28237 ?auto_28238 ) ( CLEAR ?auto_28237 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28241 ?auto_28240 ?auto_28239 ?auto_28238 )
      ( MAKE-5PILE ?auto_28236 ?auto_28237 ?auto_28238 ?auto_28239 ?auto_28240 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28242 - BLOCK
      ?auto_28243 - BLOCK
      ?auto_28244 - BLOCK
      ?auto_28245 - BLOCK
      ?auto_28246 - BLOCK
    )
    :vars
    (
      ?auto_28247 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28242 ?auto_28243 ) ) ( not ( = ?auto_28242 ?auto_28244 ) ) ( not ( = ?auto_28242 ?auto_28245 ) ) ( not ( = ?auto_28242 ?auto_28246 ) ) ( not ( = ?auto_28243 ?auto_28244 ) ) ( not ( = ?auto_28243 ?auto_28245 ) ) ( not ( = ?auto_28243 ?auto_28246 ) ) ( not ( = ?auto_28244 ?auto_28245 ) ) ( not ( = ?auto_28244 ?auto_28246 ) ) ( not ( = ?auto_28245 ?auto_28246 ) ) ( ON ?auto_28246 ?auto_28247 ) ( not ( = ?auto_28242 ?auto_28247 ) ) ( not ( = ?auto_28243 ?auto_28247 ) ) ( not ( = ?auto_28244 ?auto_28247 ) ) ( not ( = ?auto_28245 ?auto_28247 ) ) ( not ( = ?auto_28246 ?auto_28247 ) ) ( ON ?auto_28245 ?auto_28246 ) ( ON-TABLE ?auto_28247 ) ( ON ?auto_28244 ?auto_28245 ) ( ON ?auto_28243 ?auto_28244 ) ( CLEAR ?auto_28243 ) ( HOLDING ?auto_28242 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28242 )
      ( MAKE-5PILE ?auto_28242 ?auto_28243 ?auto_28244 ?auto_28245 ?auto_28246 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28248 - BLOCK
      ?auto_28249 - BLOCK
      ?auto_28250 - BLOCK
      ?auto_28251 - BLOCK
      ?auto_28252 - BLOCK
    )
    :vars
    (
      ?auto_28253 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28248 ?auto_28249 ) ) ( not ( = ?auto_28248 ?auto_28250 ) ) ( not ( = ?auto_28248 ?auto_28251 ) ) ( not ( = ?auto_28248 ?auto_28252 ) ) ( not ( = ?auto_28249 ?auto_28250 ) ) ( not ( = ?auto_28249 ?auto_28251 ) ) ( not ( = ?auto_28249 ?auto_28252 ) ) ( not ( = ?auto_28250 ?auto_28251 ) ) ( not ( = ?auto_28250 ?auto_28252 ) ) ( not ( = ?auto_28251 ?auto_28252 ) ) ( ON ?auto_28252 ?auto_28253 ) ( not ( = ?auto_28248 ?auto_28253 ) ) ( not ( = ?auto_28249 ?auto_28253 ) ) ( not ( = ?auto_28250 ?auto_28253 ) ) ( not ( = ?auto_28251 ?auto_28253 ) ) ( not ( = ?auto_28252 ?auto_28253 ) ) ( ON ?auto_28251 ?auto_28252 ) ( ON-TABLE ?auto_28253 ) ( ON ?auto_28250 ?auto_28251 ) ( ON ?auto_28249 ?auto_28250 ) ( ON ?auto_28248 ?auto_28249 ) ( CLEAR ?auto_28248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28253 ?auto_28252 ?auto_28251 ?auto_28250 ?auto_28249 )
      ( MAKE-5PILE ?auto_28248 ?auto_28249 ?auto_28250 ?auto_28251 ?auto_28252 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28312 - BLOCK
    )
    :vars
    (
      ?auto_28313 - BLOCK
      ?auto_28314 - BLOCK
      ?auto_28315 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28312 ?auto_28313 ) ( CLEAR ?auto_28312 ) ( not ( = ?auto_28312 ?auto_28313 ) ) ( HOLDING ?auto_28314 ) ( CLEAR ?auto_28315 ) ( not ( = ?auto_28312 ?auto_28314 ) ) ( not ( = ?auto_28312 ?auto_28315 ) ) ( not ( = ?auto_28313 ?auto_28314 ) ) ( not ( = ?auto_28313 ?auto_28315 ) ) ( not ( = ?auto_28314 ?auto_28315 ) ) )
    :subtasks
    ( ( !STACK ?auto_28314 ?auto_28315 )
      ( MAKE-1PILE ?auto_28312 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28316 - BLOCK
    )
    :vars
    (
      ?auto_28319 - BLOCK
      ?auto_28318 - BLOCK
      ?auto_28317 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28316 ?auto_28319 ) ( not ( = ?auto_28316 ?auto_28319 ) ) ( CLEAR ?auto_28318 ) ( not ( = ?auto_28316 ?auto_28317 ) ) ( not ( = ?auto_28316 ?auto_28318 ) ) ( not ( = ?auto_28319 ?auto_28317 ) ) ( not ( = ?auto_28319 ?auto_28318 ) ) ( not ( = ?auto_28317 ?auto_28318 ) ) ( ON ?auto_28317 ?auto_28316 ) ( CLEAR ?auto_28317 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28319 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28319 ?auto_28316 )
      ( MAKE-1PILE ?auto_28316 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28320 - BLOCK
    )
    :vars
    (
      ?auto_28323 - BLOCK
      ?auto_28321 - BLOCK
      ?auto_28322 - BLOCK
      ?auto_28325 - BLOCK
      ?auto_28324 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28320 ?auto_28323 ) ( not ( = ?auto_28320 ?auto_28323 ) ) ( not ( = ?auto_28320 ?auto_28321 ) ) ( not ( = ?auto_28320 ?auto_28322 ) ) ( not ( = ?auto_28323 ?auto_28321 ) ) ( not ( = ?auto_28323 ?auto_28322 ) ) ( not ( = ?auto_28321 ?auto_28322 ) ) ( ON ?auto_28321 ?auto_28320 ) ( CLEAR ?auto_28321 ) ( ON-TABLE ?auto_28323 ) ( HOLDING ?auto_28322 ) ( CLEAR ?auto_28325 ) ( ON-TABLE ?auto_28324 ) ( ON ?auto_28325 ?auto_28324 ) ( not ( = ?auto_28324 ?auto_28325 ) ) ( not ( = ?auto_28324 ?auto_28322 ) ) ( not ( = ?auto_28325 ?auto_28322 ) ) ( not ( = ?auto_28320 ?auto_28325 ) ) ( not ( = ?auto_28320 ?auto_28324 ) ) ( not ( = ?auto_28323 ?auto_28325 ) ) ( not ( = ?auto_28323 ?auto_28324 ) ) ( not ( = ?auto_28321 ?auto_28325 ) ) ( not ( = ?auto_28321 ?auto_28324 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28324 ?auto_28325 ?auto_28322 )
      ( MAKE-1PILE ?auto_28320 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28326 - BLOCK
    )
    :vars
    (
      ?auto_28327 - BLOCK
      ?auto_28329 - BLOCK
      ?auto_28328 - BLOCK
      ?auto_28331 - BLOCK
      ?auto_28330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28326 ?auto_28327 ) ( not ( = ?auto_28326 ?auto_28327 ) ) ( not ( = ?auto_28326 ?auto_28329 ) ) ( not ( = ?auto_28326 ?auto_28328 ) ) ( not ( = ?auto_28327 ?auto_28329 ) ) ( not ( = ?auto_28327 ?auto_28328 ) ) ( not ( = ?auto_28329 ?auto_28328 ) ) ( ON ?auto_28329 ?auto_28326 ) ( ON-TABLE ?auto_28327 ) ( CLEAR ?auto_28331 ) ( ON-TABLE ?auto_28330 ) ( ON ?auto_28331 ?auto_28330 ) ( not ( = ?auto_28330 ?auto_28331 ) ) ( not ( = ?auto_28330 ?auto_28328 ) ) ( not ( = ?auto_28331 ?auto_28328 ) ) ( not ( = ?auto_28326 ?auto_28331 ) ) ( not ( = ?auto_28326 ?auto_28330 ) ) ( not ( = ?auto_28327 ?auto_28331 ) ) ( not ( = ?auto_28327 ?auto_28330 ) ) ( not ( = ?auto_28329 ?auto_28331 ) ) ( not ( = ?auto_28329 ?auto_28330 ) ) ( ON ?auto_28328 ?auto_28329 ) ( CLEAR ?auto_28328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28327 ?auto_28326 ?auto_28329 )
      ( MAKE-1PILE ?auto_28326 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28332 - BLOCK
    )
    :vars
    (
      ?auto_28334 - BLOCK
      ?auto_28333 - BLOCK
      ?auto_28336 - BLOCK
      ?auto_28337 - BLOCK
      ?auto_28335 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28332 ?auto_28334 ) ( not ( = ?auto_28332 ?auto_28334 ) ) ( not ( = ?auto_28332 ?auto_28333 ) ) ( not ( = ?auto_28332 ?auto_28336 ) ) ( not ( = ?auto_28334 ?auto_28333 ) ) ( not ( = ?auto_28334 ?auto_28336 ) ) ( not ( = ?auto_28333 ?auto_28336 ) ) ( ON ?auto_28333 ?auto_28332 ) ( ON-TABLE ?auto_28334 ) ( ON-TABLE ?auto_28337 ) ( not ( = ?auto_28337 ?auto_28335 ) ) ( not ( = ?auto_28337 ?auto_28336 ) ) ( not ( = ?auto_28335 ?auto_28336 ) ) ( not ( = ?auto_28332 ?auto_28335 ) ) ( not ( = ?auto_28332 ?auto_28337 ) ) ( not ( = ?auto_28334 ?auto_28335 ) ) ( not ( = ?auto_28334 ?auto_28337 ) ) ( not ( = ?auto_28333 ?auto_28335 ) ) ( not ( = ?auto_28333 ?auto_28337 ) ) ( ON ?auto_28336 ?auto_28333 ) ( CLEAR ?auto_28336 ) ( HOLDING ?auto_28335 ) ( CLEAR ?auto_28337 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28337 ?auto_28335 )
      ( MAKE-1PILE ?auto_28332 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28338 - BLOCK
    )
    :vars
    (
      ?auto_28340 - BLOCK
      ?auto_28342 - BLOCK
      ?auto_28341 - BLOCK
      ?auto_28343 - BLOCK
      ?auto_28339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28338 ?auto_28340 ) ( not ( = ?auto_28338 ?auto_28340 ) ) ( not ( = ?auto_28338 ?auto_28342 ) ) ( not ( = ?auto_28338 ?auto_28341 ) ) ( not ( = ?auto_28340 ?auto_28342 ) ) ( not ( = ?auto_28340 ?auto_28341 ) ) ( not ( = ?auto_28342 ?auto_28341 ) ) ( ON ?auto_28342 ?auto_28338 ) ( ON-TABLE ?auto_28340 ) ( ON-TABLE ?auto_28343 ) ( not ( = ?auto_28343 ?auto_28339 ) ) ( not ( = ?auto_28343 ?auto_28341 ) ) ( not ( = ?auto_28339 ?auto_28341 ) ) ( not ( = ?auto_28338 ?auto_28339 ) ) ( not ( = ?auto_28338 ?auto_28343 ) ) ( not ( = ?auto_28340 ?auto_28339 ) ) ( not ( = ?auto_28340 ?auto_28343 ) ) ( not ( = ?auto_28342 ?auto_28339 ) ) ( not ( = ?auto_28342 ?auto_28343 ) ) ( ON ?auto_28341 ?auto_28342 ) ( CLEAR ?auto_28343 ) ( ON ?auto_28339 ?auto_28341 ) ( CLEAR ?auto_28339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28340 ?auto_28338 ?auto_28342 ?auto_28341 )
      ( MAKE-1PILE ?auto_28338 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28344 - BLOCK
    )
    :vars
    (
      ?auto_28346 - BLOCK
      ?auto_28349 - BLOCK
      ?auto_28348 - BLOCK
      ?auto_28347 - BLOCK
      ?auto_28345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28344 ?auto_28346 ) ( not ( = ?auto_28344 ?auto_28346 ) ) ( not ( = ?auto_28344 ?auto_28349 ) ) ( not ( = ?auto_28344 ?auto_28348 ) ) ( not ( = ?auto_28346 ?auto_28349 ) ) ( not ( = ?auto_28346 ?auto_28348 ) ) ( not ( = ?auto_28349 ?auto_28348 ) ) ( ON ?auto_28349 ?auto_28344 ) ( ON-TABLE ?auto_28346 ) ( not ( = ?auto_28347 ?auto_28345 ) ) ( not ( = ?auto_28347 ?auto_28348 ) ) ( not ( = ?auto_28345 ?auto_28348 ) ) ( not ( = ?auto_28344 ?auto_28345 ) ) ( not ( = ?auto_28344 ?auto_28347 ) ) ( not ( = ?auto_28346 ?auto_28345 ) ) ( not ( = ?auto_28346 ?auto_28347 ) ) ( not ( = ?auto_28349 ?auto_28345 ) ) ( not ( = ?auto_28349 ?auto_28347 ) ) ( ON ?auto_28348 ?auto_28349 ) ( ON ?auto_28345 ?auto_28348 ) ( CLEAR ?auto_28345 ) ( HOLDING ?auto_28347 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28347 )
      ( MAKE-1PILE ?auto_28344 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28350 - BLOCK
    )
    :vars
    (
      ?auto_28354 - BLOCK
      ?auto_28355 - BLOCK
      ?auto_28352 - BLOCK
      ?auto_28353 - BLOCK
      ?auto_28351 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28350 ?auto_28354 ) ( not ( = ?auto_28350 ?auto_28354 ) ) ( not ( = ?auto_28350 ?auto_28355 ) ) ( not ( = ?auto_28350 ?auto_28352 ) ) ( not ( = ?auto_28354 ?auto_28355 ) ) ( not ( = ?auto_28354 ?auto_28352 ) ) ( not ( = ?auto_28355 ?auto_28352 ) ) ( ON ?auto_28355 ?auto_28350 ) ( ON-TABLE ?auto_28354 ) ( not ( = ?auto_28353 ?auto_28351 ) ) ( not ( = ?auto_28353 ?auto_28352 ) ) ( not ( = ?auto_28351 ?auto_28352 ) ) ( not ( = ?auto_28350 ?auto_28351 ) ) ( not ( = ?auto_28350 ?auto_28353 ) ) ( not ( = ?auto_28354 ?auto_28351 ) ) ( not ( = ?auto_28354 ?auto_28353 ) ) ( not ( = ?auto_28355 ?auto_28351 ) ) ( not ( = ?auto_28355 ?auto_28353 ) ) ( ON ?auto_28352 ?auto_28355 ) ( ON ?auto_28351 ?auto_28352 ) ( ON ?auto_28353 ?auto_28351 ) ( CLEAR ?auto_28353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28354 ?auto_28350 ?auto_28355 ?auto_28352 ?auto_28351 )
      ( MAKE-1PILE ?auto_28350 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28363 - BLOCK
      ?auto_28364 - BLOCK
      ?auto_28365 - BLOCK
    )
    :vars
    (
      ?auto_28366 - BLOCK
      ?auto_28367 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28366 ?auto_28365 ) ( CLEAR ?auto_28366 ) ( ON-TABLE ?auto_28363 ) ( ON ?auto_28364 ?auto_28363 ) ( ON ?auto_28365 ?auto_28364 ) ( not ( = ?auto_28363 ?auto_28364 ) ) ( not ( = ?auto_28363 ?auto_28365 ) ) ( not ( = ?auto_28363 ?auto_28366 ) ) ( not ( = ?auto_28364 ?auto_28365 ) ) ( not ( = ?auto_28364 ?auto_28366 ) ) ( not ( = ?auto_28365 ?auto_28366 ) ) ( HOLDING ?auto_28367 ) ( not ( = ?auto_28363 ?auto_28367 ) ) ( not ( = ?auto_28364 ?auto_28367 ) ) ( not ( = ?auto_28365 ?auto_28367 ) ) ( not ( = ?auto_28366 ?auto_28367 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_28367 )
      ( MAKE-3PILE ?auto_28363 ?auto_28364 ?auto_28365 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28416 - BLOCK
      ?auto_28417 - BLOCK
    )
    :vars
    (
      ?auto_28418 - BLOCK
      ?auto_28420 - BLOCK
      ?auto_28419 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28416 ?auto_28417 ) ) ( ON ?auto_28417 ?auto_28418 ) ( not ( = ?auto_28416 ?auto_28418 ) ) ( not ( = ?auto_28417 ?auto_28418 ) ) ( ON ?auto_28416 ?auto_28417 ) ( CLEAR ?auto_28416 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28420 ) ( ON ?auto_28419 ?auto_28420 ) ( ON ?auto_28418 ?auto_28419 ) ( not ( = ?auto_28420 ?auto_28419 ) ) ( not ( = ?auto_28420 ?auto_28418 ) ) ( not ( = ?auto_28420 ?auto_28417 ) ) ( not ( = ?auto_28420 ?auto_28416 ) ) ( not ( = ?auto_28419 ?auto_28418 ) ) ( not ( = ?auto_28419 ?auto_28417 ) ) ( not ( = ?auto_28419 ?auto_28416 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28420 ?auto_28419 ?auto_28418 ?auto_28417 )
      ( MAKE-2PILE ?auto_28416 ?auto_28417 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28423 - BLOCK
      ?auto_28424 - BLOCK
    )
    :vars
    (
      ?auto_28425 - BLOCK
      ?auto_28426 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28423 ?auto_28424 ) ) ( ON ?auto_28424 ?auto_28425 ) ( CLEAR ?auto_28424 ) ( not ( = ?auto_28423 ?auto_28425 ) ) ( not ( = ?auto_28424 ?auto_28425 ) ) ( ON ?auto_28423 ?auto_28426 ) ( CLEAR ?auto_28423 ) ( HAND-EMPTY ) ( not ( = ?auto_28423 ?auto_28426 ) ) ( not ( = ?auto_28424 ?auto_28426 ) ) ( not ( = ?auto_28425 ?auto_28426 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28423 ?auto_28426 )
      ( MAKE-2PILE ?auto_28423 ?auto_28424 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28427 - BLOCK
      ?auto_28428 - BLOCK
    )
    :vars
    (
      ?auto_28429 - BLOCK
      ?auto_28430 - BLOCK
      ?auto_28432 - BLOCK
      ?auto_28431 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28427 ?auto_28428 ) ) ( not ( = ?auto_28427 ?auto_28429 ) ) ( not ( = ?auto_28428 ?auto_28429 ) ) ( ON ?auto_28427 ?auto_28430 ) ( CLEAR ?auto_28427 ) ( not ( = ?auto_28427 ?auto_28430 ) ) ( not ( = ?auto_28428 ?auto_28430 ) ) ( not ( = ?auto_28429 ?auto_28430 ) ) ( HOLDING ?auto_28428 ) ( CLEAR ?auto_28429 ) ( ON-TABLE ?auto_28432 ) ( ON ?auto_28431 ?auto_28432 ) ( ON ?auto_28429 ?auto_28431 ) ( not ( = ?auto_28432 ?auto_28431 ) ) ( not ( = ?auto_28432 ?auto_28429 ) ) ( not ( = ?auto_28432 ?auto_28428 ) ) ( not ( = ?auto_28431 ?auto_28429 ) ) ( not ( = ?auto_28431 ?auto_28428 ) ) ( not ( = ?auto_28427 ?auto_28432 ) ) ( not ( = ?auto_28427 ?auto_28431 ) ) ( not ( = ?auto_28430 ?auto_28432 ) ) ( not ( = ?auto_28430 ?auto_28431 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28432 ?auto_28431 ?auto_28429 ?auto_28428 )
      ( MAKE-2PILE ?auto_28427 ?auto_28428 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28433 - BLOCK
      ?auto_28434 - BLOCK
    )
    :vars
    (
      ?auto_28438 - BLOCK
      ?auto_28436 - BLOCK
      ?auto_28437 - BLOCK
      ?auto_28435 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28433 ?auto_28434 ) ) ( not ( = ?auto_28433 ?auto_28438 ) ) ( not ( = ?auto_28434 ?auto_28438 ) ) ( ON ?auto_28433 ?auto_28436 ) ( not ( = ?auto_28433 ?auto_28436 ) ) ( not ( = ?auto_28434 ?auto_28436 ) ) ( not ( = ?auto_28438 ?auto_28436 ) ) ( CLEAR ?auto_28438 ) ( ON-TABLE ?auto_28437 ) ( ON ?auto_28435 ?auto_28437 ) ( ON ?auto_28438 ?auto_28435 ) ( not ( = ?auto_28437 ?auto_28435 ) ) ( not ( = ?auto_28437 ?auto_28438 ) ) ( not ( = ?auto_28437 ?auto_28434 ) ) ( not ( = ?auto_28435 ?auto_28438 ) ) ( not ( = ?auto_28435 ?auto_28434 ) ) ( not ( = ?auto_28433 ?auto_28437 ) ) ( not ( = ?auto_28433 ?auto_28435 ) ) ( not ( = ?auto_28436 ?auto_28437 ) ) ( not ( = ?auto_28436 ?auto_28435 ) ) ( ON ?auto_28434 ?auto_28433 ) ( CLEAR ?auto_28434 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28436 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28436 ?auto_28433 )
      ( MAKE-2PILE ?auto_28433 ?auto_28434 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28439 - BLOCK
      ?auto_28440 - BLOCK
    )
    :vars
    (
      ?auto_28441 - BLOCK
      ?auto_28443 - BLOCK
      ?auto_28444 - BLOCK
      ?auto_28442 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28439 ?auto_28440 ) ) ( not ( = ?auto_28439 ?auto_28441 ) ) ( not ( = ?auto_28440 ?auto_28441 ) ) ( ON ?auto_28439 ?auto_28443 ) ( not ( = ?auto_28439 ?auto_28443 ) ) ( not ( = ?auto_28440 ?auto_28443 ) ) ( not ( = ?auto_28441 ?auto_28443 ) ) ( ON-TABLE ?auto_28444 ) ( ON ?auto_28442 ?auto_28444 ) ( not ( = ?auto_28444 ?auto_28442 ) ) ( not ( = ?auto_28444 ?auto_28441 ) ) ( not ( = ?auto_28444 ?auto_28440 ) ) ( not ( = ?auto_28442 ?auto_28441 ) ) ( not ( = ?auto_28442 ?auto_28440 ) ) ( not ( = ?auto_28439 ?auto_28444 ) ) ( not ( = ?auto_28439 ?auto_28442 ) ) ( not ( = ?auto_28443 ?auto_28444 ) ) ( not ( = ?auto_28443 ?auto_28442 ) ) ( ON ?auto_28440 ?auto_28439 ) ( CLEAR ?auto_28440 ) ( ON-TABLE ?auto_28443 ) ( HOLDING ?auto_28441 ) ( CLEAR ?auto_28442 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28444 ?auto_28442 ?auto_28441 )
      ( MAKE-2PILE ?auto_28439 ?auto_28440 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28445 - BLOCK
      ?auto_28446 - BLOCK
    )
    :vars
    (
      ?auto_28448 - BLOCK
      ?auto_28449 - BLOCK
      ?auto_28447 - BLOCK
      ?auto_28450 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28445 ?auto_28446 ) ) ( not ( = ?auto_28445 ?auto_28448 ) ) ( not ( = ?auto_28446 ?auto_28448 ) ) ( ON ?auto_28445 ?auto_28449 ) ( not ( = ?auto_28445 ?auto_28449 ) ) ( not ( = ?auto_28446 ?auto_28449 ) ) ( not ( = ?auto_28448 ?auto_28449 ) ) ( ON-TABLE ?auto_28447 ) ( ON ?auto_28450 ?auto_28447 ) ( not ( = ?auto_28447 ?auto_28450 ) ) ( not ( = ?auto_28447 ?auto_28448 ) ) ( not ( = ?auto_28447 ?auto_28446 ) ) ( not ( = ?auto_28450 ?auto_28448 ) ) ( not ( = ?auto_28450 ?auto_28446 ) ) ( not ( = ?auto_28445 ?auto_28447 ) ) ( not ( = ?auto_28445 ?auto_28450 ) ) ( not ( = ?auto_28449 ?auto_28447 ) ) ( not ( = ?auto_28449 ?auto_28450 ) ) ( ON ?auto_28446 ?auto_28445 ) ( ON-TABLE ?auto_28449 ) ( CLEAR ?auto_28450 ) ( ON ?auto_28448 ?auto_28446 ) ( CLEAR ?auto_28448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28449 ?auto_28445 ?auto_28446 )
      ( MAKE-2PILE ?auto_28445 ?auto_28446 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28451 - BLOCK
      ?auto_28452 - BLOCK
    )
    :vars
    (
      ?auto_28454 - BLOCK
      ?auto_28456 - BLOCK
      ?auto_28453 - BLOCK
      ?auto_28455 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28451 ?auto_28452 ) ) ( not ( = ?auto_28451 ?auto_28454 ) ) ( not ( = ?auto_28452 ?auto_28454 ) ) ( ON ?auto_28451 ?auto_28456 ) ( not ( = ?auto_28451 ?auto_28456 ) ) ( not ( = ?auto_28452 ?auto_28456 ) ) ( not ( = ?auto_28454 ?auto_28456 ) ) ( ON-TABLE ?auto_28453 ) ( not ( = ?auto_28453 ?auto_28455 ) ) ( not ( = ?auto_28453 ?auto_28454 ) ) ( not ( = ?auto_28453 ?auto_28452 ) ) ( not ( = ?auto_28455 ?auto_28454 ) ) ( not ( = ?auto_28455 ?auto_28452 ) ) ( not ( = ?auto_28451 ?auto_28453 ) ) ( not ( = ?auto_28451 ?auto_28455 ) ) ( not ( = ?auto_28456 ?auto_28453 ) ) ( not ( = ?auto_28456 ?auto_28455 ) ) ( ON ?auto_28452 ?auto_28451 ) ( ON-TABLE ?auto_28456 ) ( ON ?auto_28454 ?auto_28452 ) ( CLEAR ?auto_28454 ) ( HOLDING ?auto_28455 ) ( CLEAR ?auto_28453 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28453 ?auto_28455 )
      ( MAKE-2PILE ?auto_28451 ?auto_28452 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28457 - BLOCK
      ?auto_28458 - BLOCK
    )
    :vars
    (
      ?auto_28460 - BLOCK
      ?auto_28462 - BLOCK
      ?auto_28461 - BLOCK
      ?auto_28459 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28457 ?auto_28458 ) ) ( not ( = ?auto_28457 ?auto_28460 ) ) ( not ( = ?auto_28458 ?auto_28460 ) ) ( ON ?auto_28457 ?auto_28462 ) ( not ( = ?auto_28457 ?auto_28462 ) ) ( not ( = ?auto_28458 ?auto_28462 ) ) ( not ( = ?auto_28460 ?auto_28462 ) ) ( ON-TABLE ?auto_28461 ) ( not ( = ?auto_28461 ?auto_28459 ) ) ( not ( = ?auto_28461 ?auto_28460 ) ) ( not ( = ?auto_28461 ?auto_28458 ) ) ( not ( = ?auto_28459 ?auto_28460 ) ) ( not ( = ?auto_28459 ?auto_28458 ) ) ( not ( = ?auto_28457 ?auto_28461 ) ) ( not ( = ?auto_28457 ?auto_28459 ) ) ( not ( = ?auto_28462 ?auto_28461 ) ) ( not ( = ?auto_28462 ?auto_28459 ) ) ( ON ?auto_28458 ?auto_28457 ) ( ON-TABLE ?auto_28462 ) ( ON ?auto_28460 ?auto_28458 ) ( CLEAR ?auto_28461 ) ( ON ?auto_28459 ?auto_28460 ) ( CLEAR ?auto_28459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28462 ?auto_28457 ?auto_28458 ?auto_28460 )
      ( MAKE-2PILE ?auto_28457 ?auto_28458 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28463 - BLOCK
      ?auto_28464 - BLOCK
    )
    :vars
    (
      ?auto_28466 - BLOCK
      ?auto_28468 - BLOCK
      ?auto_28467 - BLOCK
      ?auto_28465 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28463 ?auto_28464 ) ) ( not ( = ?auto_28463 ?auto_28466 ) ) ( not ( = ?auto_28464 ?auto_28466 ) ) ( ON ?auto_28463 ?auto_28468 ) ( not ( = ?auto_28463 ?auto_28468 ) ) ( not ( = ?auto_28464 ?auto_28468 ) ) ( not ( = ?auto_28466 ?auto_28468 ) ) ( not ( = ?auto_28467 ?auto_28465 ) ) ( not ( = ?auto_28467 ?auto_28466 ) ) ( not ( = ?auto_28467 ?auto_28464 ) ) ( not ( = ?auto_28465 ?auto_28466 ) ) ( not ( = ?auto_28465 ?auto_28464 ) ) ( not ( = ?auto_28463 ?auto_28467 ) ) ( not ( = ?auto_28463 ?auto_28465 ) ) ( not ( = ?auto_28468 ?auto_28467 ) ) ( not ( = ?auto_28468 ?auto_28465 ) ) ( ON ?auto_28464 ?auto_28463 ) ( ON-TABLE ?auto_28468 ) ( ON ?auto_28466 ?auto_28464 ) ( ON ?auto_28465 ?auto_28466 ) ( CLEAR ?auto_28465 ) ( HOLDING ?auto_28467 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28467 )
      ( MAKE-2PILE ?auto_28463 ?auto_28464 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28469 - BLOCK
      ?auto_28470 - BLOCK
    )
    :vars
    (
      ?auto_28471 - BLOCK
      ?auto_28473 - BLOCK
      ?auto_28474 - BLOCK
      ?auto_28472 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28469 ?auto_28470 ) ) ( not ( = ?auto_28469 ?auto_28471 ) ) ( not ( = ?auto_28470 ?auto_28471 ) ) ( ON ?auto_28469 ?auto_28473 ) ( not ( = ?auto_28469 ?auto_28473 ) ) ( not ( = ?auto_28470 ?auto_28473 ) ) ( not ( = ?auto_28471 ?auto_28473 ) ) ( not ( = ?auto_28474 ?auto_28472 ) ) ( not ( = ?auto_28474 ?auto_28471 ) ) ( not ( = ?auto_28474 ?auto_28470 ) ) ( not ( = ?auto_28472 ?auto_28471 ) ) ( not ( = ?auto_28472 ?auto_28470 ) ) ( not ( = ?auto_28469 ?auto_28474 ) ) ( not ( = ?auto_28469 ?auto_28472 ) ) ( not ( = ?auto_28473 ?auto_28474 ) ) ( not ( = ?auto_28473 ?auto_28472 ) ) ( ON ?auto_28470 ?auto_28469 ) ( ON-TABLE ?auto_28473 ) ( ON ?auto_28471 ?auto_28470 ) ( ON ?auto_28472 ?auto_28471 ) ( ON ?auto_28474 ?auto_28472 ) ( CLEAR ?auto_28474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28473 ?auto_28469 ?auto_28470 ?auto_28471 ?auto_28472 )
      ( MAKE-2PILE ?auto_28469 ?auto_28470 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28490 - BLOCK
      ?auto_28491 - BLOCK
    )
    :vars
    (
      ?auto_28493 - BLOCK
      ?auto_28494 - BLOCK
      ?auto_28492 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28493 ?auto_28491 ) ( ON-TABLE ?auto_28490 ) ( ON ?auto_28491 ?auto_28490 ) ( not ( = ?auto_28490 ?auto_28491 ) ) ( not ( = ?auto_28490 ?auto_28493 ) ) ( not ( = ?auto_28491 ?auto_28493 ) ) ( not ( = ?auto_28490 ?auto_28494 ) ) ( not ( = ?auto_28490 ?auto_28492 ) ) ( not ( = ?auto_28491 ?auto_28494 ) ) ( not ( = ?auto_28491 ?auto_28492 ) ) ( not ( = ?auto_28493 ?auto_28494 ) ) ( not ( = ?auto_28493 ?auto_28492 ) ) ( not ( = ?auto_28494 ?auto_28492 ) ) ( ON ?auto_28494 ?auto_28493 ) ( CLEAR ?auto_28494 ) ( HOLDING ?auto_28492 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28492 )
      ( MAKE-2PILE ?auto_28490 ?auto_28491 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28537 - BLOCK
      ?auto_28538 - BLOCK
      ?auto_28539 - BLOCK
    )
    :vars
    (
      ?auto_28540 - BLOCK
      ?auto_28541 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28537 ) ( not ( = ?auto_28537 ?auto_28538 ) ) ( not ( = ?auto_28537 ?auto_28539 ) ) ( not ( = ?auto_28538 ?auto_28539 ) ) ( ON ?auto_28539 ?auto_28540 ) ( not ( = ?auto_28537 ?auto_28540 ) ) ( not ( = ?auto_28538 ?auto_28540 ) ) ( not ( = ?auto_28539 ?auto_28540 ) ) ( CLEAR ?auto_28537 ) ( ON ?auto_28538 ?auto_28539 ) ( CLEAR ?auto_28538 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28541 ) ( ON ?auto_28540 ?auto_28541 ) ( not ( = ?auto_28541 ?auto_28540 ) ) ( not ( = ?auto_28541 ?auto_28539 ) ) ( not ( = ?auto_28541 ?auto_28538 ) ) ( not ( = ?auto_28537 ?auto_28541 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28541 ?auto_28540 ?auto_28539 )
      ( MAKE-3PILE ?auto_28537 ?auto_28538 ?auto_28539 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28542 - BLOCK
      ?auto_28543 - BLOCK
      ?auto_28544 - BLOCK
    )
    :vars
    (
      ?auto_28546 - BLOCK
      ?auto_28545 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28542 ?auto_28543 ) ) ( not ( = ?auto_28542 ?auto_28544 ) ) ( not ( = ?auto_28543 ?auto_28544 ) ) ( ON ?auto_28544 ?auto_28546 ) ( not ( = ?auto_28542 ?auto_28546 ) ) ( not ( = ?auto_28543 ?auto_28546 ) ) ( not ( = ?auto_28544 ?auto_28546 ) ) ( ON ?auto_28543 ?auto_28544 ) ( CLEAR ?auto_28543 ) ( ON-TABLE ?auto_28545 ) ( ON ?auto_28546 ?auto_28545 ) ( not ( = ?auto_28545 ?auto_28546 ) ) ( not ( = ?auto_28545 ?auto_28544 ) ) ( not ( = ?auto_28545 ?auto_28543 ) ) ( not ( = ?auto_28542 ?auto_28545 ) ) ( HOLDING ?auto_28542 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28542 )
      ( MAKE-3PILE ?auto_28542 ?auto_28543 ?auto_28544 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28547 - BLOCK
      ?auto_28548 - BLOCK
      ?auto_28549 - BLOCK
    )
    :vars
    (
      ?auto_28550 - BLOCK
      ?auto_28551 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28547 ?auto_28548 ) ) ( not ( = ?auto_28547 ?auto_28549 ) ) ( not ( = ?auto_28548 ?auto_28549 ) ) ( ON ?auto_28549 ?auto_28550 ) ( not ( = ?auto_28547 ?auto_28550 ) ) ( not ( = ?auto_28548 ?auto_28550 ) ) ( not ( = ?auto_28549 ?auto_28550 ) ) ( ON ?auto_28548 ?auto_28549 ) ( ON-TABLE ?auto_28551 ) ( ON ?auto_28550 ?auto_28551 ) ( not ( = ?auto_28551 ?auto_28550 ) ) ( not ( = ?auto_28551 ?auto_28549 ) ) ( not ( = ?auto_28551 ?auto_28548 ) ) ( not ( = ?auto_28547 ?auto_28551 ) ) ( ON ?auto_28547 ?auto_28548 ) ( CLEAR ?auto_28547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28551 ?auto_28550 ?auto_28549 ?auto_28548 )
      ( MAKE-3PILE ?auto_28547 ?auto_28548 ?auto_28549 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28555 - BLOCK
      ?auto_28556 - BLOCK
      ?auto_28557 - BLOCK
    )
    :vars
    (
      ?auto_28558 - BLOCK
      ?auto_28559 - BLOCK
      ?auto_28560 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28555 ?auto_28556 ) ) ( not ( = ?auto_28555 ?auto_28557 ) ) ( not ( = ?auto_28556 ?auto_28557 ) ) ( ON ?auto_28557 ?auto_28558 ) ( not ( = ?auto_28555 ?auto_28558 ) ) ( not ( = ?auto_28556 ?auto_28558 ) ) ( not ( = ?auto_28557 ?auto_28558 ) ) ( ON ?auto_28556 ?auto_28557 ) ( CLEAR ?auto_28556 ) ( ON-TABLE ?auto_28559 ) ( ON ?auto_28558 ?auto_28559 ) ( not ( = ?auto_28559 ?auto_28558 ) ) ( not ( = ?auto_28559 ?auto_28557 ) ) ( not ( = ?auto_28559 ?auto_28556 ) ) ( not ( = ?auto_28555 ?auto_28559 ) ) ( ON ?auto_28555 ?auto_28560 ) ( CLEAR ?auto_28555 ) ( HAND-EMPTY ) ( not ( = ?auto_28555 ?auto_28560 ) ) ( not ( = ?auto_28556 ?auto_28560 ) ) ( not ( = ?auto_28557 ?auto_28560 ) ) ( not ( = ?auto_28558 ?auto_28560 ) ) ( not ( = ?auto_28559 ?auto_28560 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28555 ?auto_28560 )
      ( MAKE-3PILE ?auto_28555 ?auto_28556 ?auto_28557 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28561 - BLOCK
      ?auto_28562 - BLOCK
      ?auto_28563 - BLOCK
    )
    :vars
    (
      ?auto_28564 - BLOCK
      ?auto_28566 - BLOCK
      ?auto_28565 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28561 ?auto_28562 ) ) ( not ( = ?auto_28561 ?auto_28563 ) ) ( not ( = ?auto_28562 ?auto_28563 ) ) ( ON ?auto_28563 ?auto_28564 ) ( not ( = ?auto_28561 ?auto_28564 ) ) ( not ( = ?auto_28562 ?auto_28564 ) ) ( not ( = ?auto_28563 ?auto_28564 ) ) ( ON-TABLE ?auto_28566 ) ( ON ?auto_28564 ?auto_28566 ) ( not ( = ?auto_28566 ?auto_28564 ) ) ( not ( = ?auto_28566 ?auto_28563 ) ) ( not ( = ?auto_28566 ?auto_28562 ) ) ( not ( = ?auto_28561 ?auto_28566 ) ) ( ON ?auto_28561 ?auto_28565 ) ( CLEAR ?auto_28561 ) ( not ( = ?auto_28561 ?auto_28565 ) ) ( not ( = ?auto_28562 ?auto_28565 ) ) ( not ( = ?auto_28563 ?auto_28565 ) ) ( not ( = ?auto_28564 ?auto_28565 ) ) ( not ( = ?auto_28566 ?auto_28565 ) ) ( HOLDING ?auto_28562 ) ( CLEAR ?auto_28563 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28566 ?auto_28564 ?auto_28563 ?auto_28562 )
      ( MAKE-3PILE ?auto_28561 ?auto_28562 ?auto_28563 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28567 - BLOCK
      ?auto_28568 - BLOCK
      ?auto_28569 - BLOCK
    )
    :vars
    (
      ?auto_28571 - BLOCK
      ?auto_28572 - BLOCK
      ?auto_28570 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28567 ?auto_28568 ) ) ( not ( = ?auto_28567 ?auto_28569 ) ) ( not ( = ?auto_28568 ?auto_28569 ) ) ( ON ?auto_28569 ?auto_28571 ) ( not ( = ?auto_28567 ?auto_28571 ) ) ( not ( = ?auto_28568 ?auto_28571 ) ) ( not ( = ?auto_28569 ?auto_28571 ) ) ( ON-TABLE ?auto_28572 ) ( ON ?auto_28571 ?auto_28572 ) ( not ( = ?auto_28572 ?auto_28571 ) ) ( not ( = ?auto_28572 ?auto_28569 ) ) ( not ( = ?auto_28572 ?auto_28568 ) ) ( not ( = ?auto_28567 ?auto_28572 ) ) ( ON ?auto_28567 ?auto_28570 ) ( not ( = ?auto_28567 ?auto_28570 ) ) ( not ( = ?auto_28568 ?auto_28570 ) ) ( not ( = ?auto_28569 ?auto_28570 ) ) ( not ( = ?auto_28571 ?auto_28570 ) ) ( not ( = ?auto_28572 ?auto_28570 ) ) ( CLEAR ?auto_28569 ) ( ON ?auto_28568 ?auto_28567 ) ( CLEAR ?auto_28568 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28570 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28570 ?auto_28567 )
      ( MAKE-3PILE ?auto_28567 ?auto_28568 ?auto_28569 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28573 - BLOCK
      ?auto_28574 - BLOCK
      ?auto_28575 - BLOCK
    )
    :vars
    (
      ?auto_28578 - BLOCK
      ?auto_28577 - BLOCK
      ?auto_28576 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28573 ?auto_28574 ) ) ( not ( = ?auto_28573 ?auto_28575 ) ) ( not ( = ?auto_28574 ?auto_28575 ) ) ( not ( = ?auto_28573 ?auto_28578 ) ) ( not ( = ?auto_28574 ?auto_28578 ) ) ( not ( = ?auto_28575 ?auto_28578 ) ) ( ON-TABLE ?auto_28577 ) ( ON ?auto_28578 ?auto_28577 ) ( not ( = ?auto_28577 ?auto_28578 ) ) ( not ( = ?auto_28577 ?auto_28575 ) ) ( not ( = ?auto_28577 ?auto_28574 ) ) ( not ( = ?auto_28573 ?auto_28577 ) ) ( ON ?auto_28573 ?auto_28576 ) ( not ( = ?auto_28573 ?auto_28576 ) ) ( not ( = ?auto_28574 ?auto_28576 ) ) ( not ( = ?auto_28575 ?auto_28576 ) ) ( not ( = ?auto_28578 ?auto_28576 ) ) ( not ( = ?auto_28577 ?auto_28576 ) ) ( ON ?auto_28574 ?auto_28573 ) ( CLEAR ?auto_28574 ) ( ON-TABLE ?auto_28576 ) ( HOLDING ?auto_28575 ) ( CLEAR ?auto_28578 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28577 ?auto_28578 ?auto_28575 )
      ( MAKE-3PILE ?auto_28573 ?auto_28574 ?auto_28575 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28579 - BLOCK
      ?auto_28580 - BLOCK
      ?auto_28581 - BLOCK
    )
    :vars
    (
      ?auto_28582 - BLOCK
      ?auto_28584 - BLOCK
      ?auto_28583 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28579 ?auto_28580 ) ) ( not ( = ?auto_28579 ?auto_28581 ) ) ( not ( = ?auto_28580 ?auto_28581 ) ) ( not ( = ?auto_28579 ?auto_28582 ) ) ( not ( = ?auto_28580 ?auto_28582 ) ) ( not ( = ?auto_28581 ?auto_28582 ) ) ( ON-TABLE ?auto_28584 ) ( ON ?auto_28582 ?auto_28584 ) ( not ( = ?auto_28584 ?auto_28582 ) ) ( not ( = ?auto_28584 ?auto_28581 ) ) ( not ( = ?auto_28584 ?auto_28580 ) ) ( not ( = ?auto_28579 ?auto_28584 ) ) ( ON ?auto_28579 ?auto_28583 ) ( not ( = ?auto_28579 ?auto_28583 ) ) ( not ( = ?auto_28580 ?auto_28583 ) ) ( not ( = ?auto_28581 ?auto_28583 ) ) ( not ( = ?auto_28582 ?auto_28583 ) ) ( not ( = ?auto_28584 ?auto_28583 ) ) ( ON ?auto_28580 ?auto_28579 ) ( ON-TABLE ?auto_28583 ) ( CLEAR ?auto_28582 ) ( ON ?auto_28581 ?auto_28580 ) ( CLEAR ?auto_28581 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28583 ?auto_28579 ?auto_28580 )
      ( MAKE-3PILE ?auto_28579 ?auto_28580 ?auto_28581 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28585 - BLOCK
      ?auto_28586 - BLOCK
      ?auto_28587 - BLOCK
    )
    :vars
    (
      ?auto_28589 - BLOCK
      ?auto_28588 - BLOCK
      ?auto_28590 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28585 ?auto_28586 ) ) ( not ( = ?auto_28585 ?auto_28587 ) ) ( not ( = ?auto_28586 ?auto_28587 ) ) ( not ( = ?auto_28585 ?auto_28589 ) ) ( not ( = ?auto_28586 ?auto_28589 ) ) ( not ( = ?auto_28587 ?auto_28589 ) ) ( ON-TABLE ?auto_28588 ) ( not ( = ?auto_28588 ?auto_28589 ) ) ( not ( = ?auto_28588 ?auto_28587 ) ) ( not ( = ?auto_28588 ?auto_28586 ) ) ( not ( = ?auto_28585 ?auto_28588 ) ) ( ON ?auto_28585 ?auto_28590 ) ( not ( = ?auto_28585 ?auto_28590 ) ) ( not ( = ?auto_28586 ?auto_28590 ) ) ( not ( = ?auto_28587 ?auto_28590 ) ) ( not ( = ?auto_28589 ?auto_28590 ) ) ( not ( = ?auto_28588 ?auto_28590 ) ) ( ON ?auto_28586 ?auto_28585 ) ( ON-TABLE ?auto_28590 ) ( ON ?auto_28587 ?auto_28586 ) ( CLEAR ?auto_28587 ) ( HOLDING ?auto_28589 ) ( CLEAR ?auto_28588 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28588 ?auto_28589 )
      ( MAKE-3PILE ?auto_28585 ?auto_28586 ?auto_28587 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28591 - BLOCK
      ?auto_28592 - BLOCK
      ?auto_28593 - BLOCK
    )
    :vars
    (
      ?auto_28594 - BLOCK
      ?auto_28595 - BLOCK
      ?auto_28596 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28591 ?auto_28592 ) ) ( not ( = ?auto_28591 ?auto_28593 ) ) ( not ( = ?auto_28592 ?auto_28593 ) ) ( not ( = ?auto_28591 ?auto_28594 ) ) ( not ( = ?auto_28592 ?auto_28594 ) ) ( not ( = ?auto_28593 ?auto_28594 ) ) ( ON-TABLE ?auto_28595 ) ( not ( = ?auto_28595 ?auto_28594 ) ) ( not ( = ?auto_28595 ?auto_28593 ) ) ( not ( = ?auto_28595 ?auto_28592 ) ) ( not ( = ?auto_28591 ?auto_28595 ) ) ( ON ?auto_28591 ?auto_28596 ) ( not ( = ?auto_28591 ?auto_28596 ) ) ( not ( = ?auto_28592 ?auto_28596 ) ) ( not ( = ?auto_28593 ?auto_28596 ) ) ( not ( = ?auto_28594 ?auto_28596 ) ) ( not ( = ?auto_28595 ?auto_28596 ) ) ( ON ?auto_28592 ?auto_28591 ) ( ON-TABLE ?auto_28596 ) ( ON ?auto_28593 ?auto_28592 ) ( CLEAR ?auto_28595 ) ( ON ?auto_28594 ?auto_28593 ) ( CLEAR ?auto_28594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28596 ?auto_28591 ?auto_28592 ?auto_28593 )
      ( MAKE-3PILE ?auto_28591 ?auto_28592 ?auto_28593 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28597 - BLOCK
      ?auto_28598 - BLOCK
      ?auto_28599 - BLOCK
    )
    :vars
    (
      ?auto_28600 - BLOCK
      ?auto_28601 - BLOCK
      ?auto_28602 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28597 ?auto_28598 ) ) ( not ( = ?auto_28597 ?auto_28599 ) ) ( not ( = ?auto_28598 ?auto_28599 ) ) ( not ( = ?auto_28597 ?auto_28600 ) ) ( not ( = ?auto_28598 ?auto_28600 ) ) ( not ( = ?auto_28599 ?auto_28600 ) ) ( not ( = ?auto_28601 ?auto_28600 ) ) ( not ( = ?auto_28601 ?auto_28599 ) ) ( not ( = ?auto_28601 ?auto_28598 ) ) ( not ( = ?auto_28597 ?auto_28601 ) ) ( ON ?auto_28597 ?auto_28602 ) ( not ( = ?auto_28597 ?auto_28602 ) ) ( not ( = ?auto_28598 ?auto_28602 ) ) ( not ( = ?auto_28599 ?auto_28602 ) ) ( not ( = ?auto_28600 ?auto_28602 ) ) ( not ( = ?auto_28601 ?auto_28602 ) ) ( ON ?auto_28598 ?auto_28597 ) ( ON-TABLE ?auto_28602 ) ( ON ?auto_28599 ?auto_28598 ) ( ON ?auto_28600 ?auto_28599 ) ( CLEAR ?auto_28600 ) ( HOLDING ?auto_28601 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28601 )
      ( MAKE-3PILE ?auto_28597 ?auto_28598 ?auto_28599 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28603 - BLOCK
      ?auto_28604 - BLOCK
      ?auto_28605 - BLOCK
    )
    :vars
    (
      ?auto_28607 - BLOCK
      ?auto_28608 - BLOCK
      ?auto_28606 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28603 ?auto_28604 ) ) ( not ( = ?auto_28603 ?auto_28605 ) ) ( not ( = ?auto_28604 ?auto_28605 ) ) ( not ( = ?auto_28603 ?auto_28607 ) ) ( not ( = ?auto_28604 ?auto_28607 ) ) ( not ( = ?auto_28605 ?auto_28607 ) ) ( not ( = ?auto_28608 ?auto_28607 ) ) ( not ( = ?auto_28608 ?auto_28605 ) ) ( not ( = ?auto_28608 ?auto_28604 ) ) ( not ( = ?auto_28603 ?auto_28608 ) ) ( ON ?auto_28603 ?auto_28606 ) ( not ( = ?auto_28603 ?auto_28606 ) ) ( not ( = ?auto_28604 ?auto_28606 ) ) ( not ( = ?auto_28605 ?auto_28606 ) ) ( not ( = ?auto_28607 ?auto_28606 ) ) ( not ( = ?auto_28608 ?auto_28606 ) ) ( ON ?auto_28604 ?auto_28603 ) ( ON-TABLE ?auto_28606 ) ( ON ?auto_28605 ?auto_28604 ) ( ON ?auto_28607 ?auto_28605 ) ( ON ?auto_28608 ?auto_28607 ) ( CLEAR ?auto_28608 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28606 ?auto_28603 ?auto_28604 ?auto_28605 ?auto_28607 )
      ( MAKE-3PILE ?auto_28603 ?auto_28604 ?auto_28605 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28620 - BLOCK
    )
    :vars
    (
      ?auto_28622 - BLOCK
      ?auto_28623 - BLOCK
      ?auto_28621 - BLOCK
      ?auto_28624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28622 ?auto_28620 ) ( ON-TABLE ?auto_28620 ) ( not ( = ?auto_28620 ?auto_28622 ) ) ( not ( = ?auto_28620 ?auto_28623 ) ) ( not ( = ?auto_28620 ?auto_28621 ) ) ( not ( = ?auto_28622 ?auto_28623 ) ) ( not ( = ?auto_28622 ?auto_28621 ) ) ( not ( = ?auto_28623 ?auto_28621 ) ) ( ON ?auto_28623 ?auto_28622 ) ( CLEAR ?auto_28623 ) ( HOLDING ?auto_28621 ) ( CLEAR ?auto_28624 ) ( ON-TABLE ?auto_28624 ) ( not ( = ?auto_28624 ?auto_28621 ) ) ( not ( = ?auto_28620 ?auto_28624 ) ) ( not ( = ?auto_28622 ?auto_28624 ) ) ( not ( = ?auto_28623 ?auto_28624 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28624 ?auto_28621 )
      ( MAKE-1PILE ?auto_28620 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28625 - BLOCK
    )
    :vars
    (
      ?auto_28627 - BLOCK
      ?auto_28628 - BLOCK
      ?auto_28629 - BLOCK
      ?auto_28626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28627 ?auto_28625 ) ( ON-TABLE ?auto_28625 ) ( not ( = ?auto_28625 ?auto_28627 ) ) ( not ( = ?auto_28625 ?auto_28628 ) ) ( not ( = ?auto_28625 ?auto_28629 ) ) ( not ( = ?auto_28627 ?auto_28628 ) ) ( not ( = ?auto_28627 ?auto_28629 ) ) ( not ( = ?auto_28628 ?auto_28629 ) ) ( ON ?auto_28628 ?auto_28627 ) ( CLEAR ?auto_28626 ) ( ON-TABLE ?auto_28626 ) ( not ( = ?auto_28626 ?auto_28629 ) ) ( not ( = ?auto_28625 ?auto_28626 ) ) ( not ( = ?auto_28627 ?auto_28626 ) ) ( not ( = ?auto_28628 ?auto_28626 ) ) ( ON ?auto_28629 ?auto_28628 ) ( CLEAR ?auto_28629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28625 ?auto_28627 ?auto_28628 )
      ( MAKE-1PILE ?auto_28625 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28630 - BLOCK
    )
    :vars
    (
      ?auto_28634 - BLOCK
      ?auto_28633 - BLOCK
      ?auto_28631 - BLOCK
      ?auto_28632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28634 ?auto_28630 ) ( ON-TABLE ?auto_28630 ) ( not ( = ?auto_28630 ?auto_28634 ) ) ( not ( = ?auto_28630 ?auto_28633 ) ) ( not ( = ?auto_28630 ?auto_28631 ) ) ( not ( = ?auto_28634 ?auto_28633 ) ) ( not ( = ?auto_28634 ?auto_28631 ) ) ( not ( = ?auto_28633 ?auto_28631 ) ) ( ON ?auto_28633 ?auto_28634 ) ( not ( = ?auto_28632 ?auto_28631 ) ) ( not ( = ?auto_28630 ?auto_28632 ) ) ( not ( = ?auto_28634 ?auto_28632 ) ) ( not ( = ?auto_28633 ?auto_28632 ) ) ( ON ?auto_28631 ?auto_28633 ) ( CLEAR ?auto_28631 ) ( HOLDING ?auto_28632 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28632 )
      ( MAKE-1PILE ?auto_28630 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28641 - BLOCK
    )
    :vars
    (
      ?auto_28645 - BLOCK
      ?auto_28643 - BLOCK
      ?auto_28642 - BLOCK
      ?auto_28644 - BLOCK
      ?auto_28646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28645 ?auto_28641 ) ( ON-TABLE ?auto_28641 ) ( not ( = ?auto_28641 ?auto_28645 ) ) ( not ( = ?auto_28641 ?auto_28643 ) ) ( not ( = ?auto_28641 ?auto_28642 ) ) ( not ( = ?auto_28645 ?auto_28643 ) ) ( not ( = ?auto_28645 ?auto_28642 ) ) ( not ( = ?auto_28643 ?auto_28642 ) ) ( ON ?auto_28643 ?auto_28645 ) ( not ( = ?auto_28644 ?auto_28642 ) ) ( not ( = ?auto_28641 ?auto_28644 ) ) ( not ( = ?auto_28645 ?auto_28644 ) ) ( not ( = ?auto_28643 ?auto_28644 ) ) ( ON ?auto_28642 ?auto_28643 ) ( CLEAR ?auto_28642 ) ( ON ?auto_28644 ?auto_28646 ) ( CLEAR ?auto_28644 ) ( HAND-EMPTY ) ( not ( = ?auto_28641 ?auto_28646 ) ) ( not ( = ?auto_28645 ?auto_28646 ) ) ( not ( = ?auto_28643 ?auto_28646 ) ) ( not ( = ?auto_28642 ?auto_28646 ) ) ( not ( = ?auto_28644 ?auto_28646 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28644 ?auto_28646 )
      ( MAKE-1PILE ?auto_28641 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28647 - BLOCK
    )
    :vars
    (
      ?auto_28649 - BLOCK
      ?auto_28650 - BLOCK
      ?auto_28648 - BLOCK
      ?auto_28651 - BLOCK
      ?auto_28652 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28649 ?auto_28647 ) ( ON-TABLE ?auto_28647 ) ( not ( = ?auto_28647 ?auto_28649 ) ) ( not ( = ?auto_28647 ?auto_28650 ) ) ( not ( = ?auto_28647 ?auto_28648 ) ) ( not ( = ?auto_28649 ?auto_28650 ) ) ( not ( = ?auto_28649 ?auto_28648 ) ) ( not ( = ?auto_28650 ?auto_28648 ) ) ( ON ?auto_28650 ?auto_28649 ) ( not ( = ?auto_28651 ?auto_28648 ) ) ( not ( = ?auto_28647 ?auto_28651 ) ) ( not ( = ?auto_28649 ?auto_28651 ) ) ( not ( = ?auto_28650 ?auto_28651 ) ) ( ON ?auto_28651 ?auto_28652 ) ( CLEAR ?auto_28651 ) ( not ( = ?auto_28647 ?auto_28652 ) ) ( not ( = ?auto_28649 ?auto_28652 ) ) ( not ( = ?auto_28650 ?auto_28652 ) ) ( not ( = ?auto_28648 ?auto_28652 ) ) ( not ( = ?auto_28651 ?auto_28652 ) ) ( HOLDING ?auto_28648 ) ( CLEAR ?auto_28650 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28647 ?auto_28649 ?auto_28650 ?auto_28648 )
      ( MAKE-1PILE ?auto_28647 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28681 - BLOCK
      ?auto_28682 - BLOCK
      ?auto_28683 - BLOCK
      ?auto_28684 - BLOCK
    )
    :vars
    (
      ?auto_28685 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28681 ) ( ON ?auto_28682 ?auto_28681 ) ( not ( = ?auto_28681 ?auto_28682 ) ) ( not ( = ?auto_28681 ?auto_28683 ) ) ( not ( = ?auto_28681 ?auto_28684 ) ) ( not ( = ?auto_28682 ?auto_28683 ) ) ( not ( = ?auto_28682 ?auto_28684 ) ) ( not ( = ?auto_28683 ?auto_28684 ) ) ( ON ?auto_28684 ?auto_28685 ) ( not ( = ?auto_28681 ?auto_28685 ) ) ( not ( = ?auto_28682 ?auto_28685 ) ) ( not ( = ?auto_28683 ?auto_28685 ) ) ( not ( = ?auto_28684 ?auto_28685 ) ) ( CLEAR ?auto_28682 ) ( ON ?auto_28683 ?auto_28684 ) ( CLEAR ?auto_28683 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28685 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28685 ?auto_28684 )
      ( MAKE-4PILE ?auto_28681 ?auto_28682 ?auto_28683 ?auto_28684 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28686 - BLOCK
      ?auto_28687 - BLOCK
      ?auto_28688 - BLOCK
      ?auto_28689 - BLOCK
    )
    :vars
    (
      ?auto_28690 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28686 ) ( not ( = ?auto_28686 ?auto_28687 ) ) ( not ( = ?auto_28686 ?auto_28688 ) ) ( not ( = ?auto_28686 ?auto_28689 ) ) ( not ( = ?auto_28687 ?auto_28688 ) ) ( not ( = ?auto_28687 ?auto_28689 ) ) ( not ( = ?auto_28688 ?auto_28689 ) ) ( ON ?auto_28689 ?auto_28690 ) ( not ( = ?auto_28686 ?auto_28690 ) ) ( not ( = ?auto_28687 ?auto_28690 ) ) ( not ( = ?auto_28688 ?auto_28690 ) ) ( not ( = ?auto_28689 ?auto_28690 ) ) ( ON ?auto_28688 ?auto_28689 ) ( CLEAR ?auto_28688 ) ( ON-TABLE ?auto_28690 ) ( HOLDING ?auto_28687 ) ( CLEAR ?auto_28686 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28686 ?auto_28687 )
      ( MAKE-4PILE ?auto_28686 ?auto_28687 ?auto_28688 ?auto_28689 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28691 - BLOCK
      ?auto_28692 - BLOCK
      ?auto_28693 - BLOCK
      ?auto_28694 - BLOCK
    )
    :vars
    (
      ?auto_28695 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28691 ) ( not ( = ?auto_28691 ?auto_28692 ) ) ( not ( = ?auto_28691 ?auto_28693 ) ) ( not ( = ?auto_28691 ?auto_28694 ) ) ( not ( = ?auto_28692 ?auto_28693 ) ) ( not ( = ?auto_28692 ?auto_28694 ) ) ( not ( = ?auto_28693 ?auto_28694 ) ) ( ON ?auto_28694 ?auto_28695 ) ( not ( = ?auto_28691 ?auto_28695 ) ) ( not ( = ?auto_28692 ?auto_28695 ) ) ( not ( = ?auto_28693 ?auto_28695 ) ) ( not ( = ?auto_28694 ?auto_28695 ) ) ( ON ?auto_28693 ?auto_28694 ) ( ON-TABLE ?auto_28695 ) ( CLEAR ?auto_28691 ) ( ON ?auto_28692 ?auto_28693 ) ( CLEAR ?auto_28692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28695 ?auto_28694 ?auto_28693 )
      ( MAKE-4PILE ?auto_28691 ?auto_28692 ?auto_28693 ?auto_28694 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28696 - BLOCK
      ?auto_28697 - BLOCK
      ?auto_28698 - BLOCK
      ?auto_28699 - BLOCK
    )
    :vars
    (
      ?auto_28700 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28696 ?auto_28697 ) ) ( not ( = ?auto_28696 ?auto_28698 ) ) ( not ( = ?auto_28696 ?auto_28699 ) ) ( not ( = ?auto_28697 ?auto_28698 ) ) ( not ( = ?auto_28697 ?auto_28699 ) ) ( not ( = ?auto_28698 ?auto_28699 ) ) ( ON ?auto_28699 ?auto_28700 ) ( not ( = ?auto_28696 ?auto_28700 ) ) ( not ( = ?auto_28697 ?auto_28700 ) ) ( not ( = ?auto_28698 ?auto_28700 ) ) ( not ( = ?auto_28699 ?auto_28700 ) ) ( ON ?auto_28698 ?auto_28699 ) ( ON-TABLE ?auto_28700 ) ( ON ?auto_28697 ?auto_28698 ) ( CLEAR ?auto_28697 ) ( HOLDING ?auto_28696 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28696 )
      ( MAKE-4PILE ?auto_28696 ?auto_28697 ?auto_28698 ?auto_28699 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28701 - BLOCK
      ?auto_28702 - BLOCK
      ?auto_28703 - BLOCK
      ?auto_28704 - BLOCK
    )
    :vars
    (
      ?auto_28705 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28701 ?auto_28702 ) ) ( not ( = ?auto_28701 ?auto_28703 ) ) ( not ( = ?auto_28701 ?auto_28704 ) ) ( not ( = ?auto_28702 ?auto_28703 ) ) ( not ( = ?auto_28702 ?auto_28704 ) ) ( not ( = ?auto_28703 ?auto_28704 ) ) ( ON ?auto_28704 ?auto_28705 ) ( not ( = ?auto_28701 ?auto_28705 ) ) ( not ( = ?auto_28702 ?auto_28705 ) ) ( not ( = ?auto_28703 ?auto_28705 ) ) ( not ( = ?auto_28704 ?auto_28705 ) ) ( ON ?auto_28703 ?auto_28704 ) ( ON-TABLE ?auto_28705 ) ( ON ?auto_28702 ?auto_28703 ) ( ON ?auto_28701 ?auto_28702 ) ( CLEAR ?auto_28701 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28705 ?auto_28704 ?auto_28703 ?auto_28702 )
      ( MAKE-4PILE ?auto_28701 ?auto_28702 ?auto_28703 ?auto_28704 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28710 - BLOCK
      ?auto_28711 - BLOCK
      ?auto_28712 - BLOCK
      ?auto_28713 - BLOCK
    )
    :vars
    (
      ?auto_28714 - BLOCK
      ?auto_28715 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28710 ?auto_28711 ) ) ( not ( = ?auto_28710 ?auto_28712 ) ) ( not ( = ?auto_28710 ?auto_28713 ) ) ( not ( = ?auto_28711 ?auto_28712 ) ) ( not ( = ?auto_28711 ?auto_28713 ) ) ( not ( = ?auto_28712 ?auto_28713 ) ) ( ON ?auto_28713 ?auto_28714 ) ( not ( = ?auto_28710 ?auto_28714 ) ) ( not ( = ?auto_28711 ?auto_28714 ) ) ( not ( = ?auto_28712 ?auto_28714 ) ) ( not ( = ?auto_28713 ?auto_28714 ) ) ( ON ?auto_28712 ?auto_28713 ) ( ON-TABLE ?auto_28714 ) ( ON ?auto_28711 ?auto_28712 ) ( CLEAR ?auto_28711 ) ( ON ?auto_28710 ?auto_28715 ) ( CLEAR ?auto_28710 ) ( HAND-EMPTY ) ( not ( = ?auto_28710 ?auto_28715 ) ) ( not ( = ?auto_28711 ?auto_28715 ) ) ( not ( = ?auto_28712 ?auto_28715 ) ) ( not ( = ?auto_28713 ?auto_28715 ) ) ( not ( = ?auto_28714 ?auto_28715 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28710 ?auto_28715 )
      ( MAKE-4PILE ?auto_28710 ?auto_28711 ?auto_28712 ?auto_28713 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28716 - BLOCK
      ?auto_28717 - BLOCK
      ?auto_28718 - BLOCK
      ?auto_28719 - BLOCK
    )
    :vars
    (
      ?auto_28720 - BLOCK
      ?auto_28721 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28716 ?auto_28717 ) ) ( not ( = ?auto_28716 ?auto_28718 ) ) ( not ( = ?auto_28716 ?auto_28719 ) ) ( not ( = ?auto_28717 ?auto_28718 ) ) ( not ( = ?auto_28717 ?auto_28719 ) ) ( not ( = ?auto_28718 ?auto_28719 ) ) ( ON ?auto_28719 ?auto_28720 ) ( not ( = ?auto_28716 ?auto_28720 ) ) ( not ( = ?auto_28717 ?auto_28720 ) ) ( not ( = ?auto_28718 ?auto_28720 ) ) ( not ( = ?auto_28719 ?auto_28720 ) ) ( ON ?auto_28718 ?auto_28719 ) ( ON-TABLE ?auto_28720 ) ( ON ?auto_28716 ?auto_28721 ) ( CLEAR ?auto_28716 ) ( not ( = ?auto_28716 ?auto_28721 ) ) ( not ( = ?auto_28717 ?auto_28721 ) ) ( not ( = ?auto_28718 ?auto_28721 ) ) ( not ( = ?auto_28719 ?auto_28721 ) ) ( not ( = ?auto_28720 ?auto_28721 ) ) ( HOLDING ?auto_28717 ) ( CLEAR ?auto_28718 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28720 ?auto_28719 ?auto_28718 ?auto_28717 )
      ( MAKE-4PILE ?auto_28716 ?auto_28717 ?auto_28718 ?auto_28719 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28722 - BLOCK
      ?auto_28723 - BLOCK
      ?auto_28724 - BLOCK
      ?auto_28725 - BLOCK
    )
    :vars
    (
      ?auto_28727 - BLOCK
      ?auto_28726 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28722 ?auto_28723 ) ) ( not ( = ?auto_28722 ?auto_28724 ) ) ( not ( = ?auto_28722 ?auto_28725 ) ) ( not ( = ?auto_28723 ?auto_28724 ) ) ( not ( = ?auto_28723 ?auto_28725 ) ) ( not ( = ?auto_28724 ?auto_28725 ) ) ( ON ?auto_28725 ?auto_28727 ) ( not ( = ?auto_28722 ?auto_28727 ) ) ( not ( = ?auto_28723 ?auto_28727 ) ) ( not ( = ?auto_28724 ?auto_28727 ) ) ( not ( = ?auto_28725 ?auto_28727 ) ) ( ON ?auto_28724 ?auto_28725 ) ( ON-TABLE ?auto_28727 ) ( ON ?auto_28722 ?auto_28726 ) ( not ( = ?auto_28722 ?auto_28726 ) ) ( not ( = ?auto_28723 ?auto_28726 ) ) ( not ( = ?auto_28724 ?auto_28726 ) ) ( not ( = ?auto_28725 ?auto_28726 ) ) ( not ( = ?auto_28727 ?auto_28726 ) ) ( CLEAR ?auto_28724 ) ( ON ?auto_28723 ?auto_28722 ) ( CLEAR ?auto_28723 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28726 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28726 ?auto_28722 )
      ( MAKE-4PILE ?auto_28722 ?auto_28723 ?auto_28724 ?auto_28725 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28728 - BLOCK
      ?auto_28729 - BLOCK
      ?auto_28730 - BLOCK
      ?auto_28731 - BLOCK
    )
    :vars
    (
      ?auto_28733 - BLOCK
      ?auto_28732 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28728 ?auto_28729 ) ) ( not ( = ?auto_28728 ?auto_28730 ) ) ( not ( = ?auto_28728 ?auto_28731 ) ) ( not ( = ?auto_28729 ?auto_28730 ) ) ( not ( = ?auto_28729 ?auto_28731 ) ) ( not ( = ?auto_28730 ?auto_28731 ) ) ( ON ?auto_28731 ?auto_28733 ) ( not ( = ?auto_28728 ?auto_28733 ) ) ( not ( = ?auto_28729 ?auto_28733 ) ) ( not ( = ?auto_28730 ?auto_28733 ) ) ( not ( = ?auto_28731 ?auto_28733 ) ) ( ON-TABLE ?auto_28733 ) ( ON ?auto_28728 ?auto_28732 ) ( not ( = ?auto_28728 ?auto_28732 ) ) ( not ( = ?auto_28729 ?auto_28732 ) ) ( not ( = ?auto_28730 ?auto_28732 ) ) ( not ( = ?auto_28731 ?auto_28732 ) ) ( not ( = ?auto_28733 ?auto_28732 ) ) ( ON ?auto_28729 ?auto_28728 ) ( CLEAR ?auto_28729 ) ( ON-TABLE ?auto_28732 ) ( HOLDING ?auto_28730 ) ( CLEAR ?auto_28731 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28733 ?auto_28731 ?auto_28730 )
      ( MAKE-4PILE ?auto_28728 ?auto_28729 ?auto_28730 ?auto_28731 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28734 - BLOCK
      ?auto_28735 - BLOCK
      ?auto_28736 - BLOCK
      ?auto_28737 - BLOCK
    )
    :vars
    (
      ?auto_28738 - BLOCK
      ?auto_28739 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28734 ?auto_28735 ) ) ( not ( = ?auto_28734 ?auto_28736 ) ) ( not ( = ?auto_28734 ?auto_28737 ) ) ( not ( = ?auto_28735 ?auto_28736 ) ) ( not ( = ?auto_28735 ?auto_28737 ) ) ( not ( = ?auto_28736 ?auto_28737 ) ) ( ON ?auto_28737 ?auto_28738 ) ( not ( = ?auto_28734 ?auto_28738 ) ) ( not ( = ?auto_28735 ?auto_28738 ) ) ( not ( = ?auto_28736 ?auto_28738 ) ) ( not ( = ?auto_28737 ?auto_28738 ) ) ( ON-TABLE ?auto_28738 ) ( ON ?auto_28734 ?auto_28739 ) ( not ( = ?auto_28734 ?auto_28739 ) ) ( not ( = ?auto_28735 ?auto_28739 ) ) ( not ( = ?auto_28736 ?auto_28739 ) ) ( not ( = ?auto_28737 ?auto_28739 ) ) ( not ( = ?auto_28738 ?auto_28739 ) ) ( ON ?auto_28735 ?auto_28734 ) ( ON-TABLE ?auto_28739 ) ( CLEAR ?auto_28737 ) ( ON ?auto_28736 ?auto_28735 ) ( CLEAR ?auto_28736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28739 ?auto_28734 ?auto_28735 )
      ( MAKE-4PILE ?auto_28734 ?auto_28735 ?auto_28736 ?auto_28737 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28740 - BLOCK
      ?auto_28741 - BLOCK
      ?auto_28742 - BLOCK
      ?auto_28743 - BLOCK
    )
    :vars
    (
      ?auto_28744 - BLOCK
      ?auto_28745 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28740 ?auto_28741 ) ) ( not ( = ?auto_28740 ?auto_28742 ) ) ( not ( = ?auto_28740 ?auto_28743 ) ) ( not ( = ?auto_28741 ?auto_28742 ) ) ( not ( = ?auto_28741 ?auto_28743 ) ) ( not ( = ?auto_28742 ?auto_28743 ) ) ( not ( = ?auto_28740 ?auto_28744 ) ) ( not ( = ?auto_28741 ?auto_28744 ) ) ( not ( = ?auto_28742 ?auto_28744 ) ) ( not ( = ?auto_28743 ?auto_28744 ) ) ( ON-TABLE ?auto_28744 ) ( ON ?auto_28740 ?auto_28745 ) ( not ( = ?auto_28740 ?auto_28745 ) ) ( not ( = ?auto_28741 ?auto_28745 ) ) ( not ( = ?auto_28742 ?auto_28745 ) ) ( not ( = ?auto_28743 ?auto_28745 ) ) ( not ( = ?auto_28744 ?auto_28745 ) ) ( ON ?auto_28741 ?auto_28740 ) ( ON-TABLE ?auto_28745 ) ( ON ?auto_28742 ?auto_28741 ) ( CLEAR ?auto_28742 ) ( HOLDING ?auto_28743 ) ( CLEAR ?auto_28744 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28744 ?auto_28743 )
      ( MAKE-4PILE ?auto_28740 ?auto_28741 ?auto_28742 ?auto_28743 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28746 - BLOCK
      ?auto_28747 - BLOCK
      ?auto_28748 - BLOCK
      ?auto_28749 - BLOCK
    )
    :vars
    (
      ?auto_28750 - BLOCK
      ?auto_28751 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28746 ?auto_28747 ) ) ( not ( = ?auto_28746 ?auto_28748 ) ) ( not ( = ?auto_28746 ?auto_28749 ) ) ( not ( = ?auto_28747 ?auto_28748 ) ) ( not ( = ?auto_28747 ?auto_28749 ) ) ( not ( = ?auto_28748 ?auto_28749 ) ) ( not ( = ?auto_28746 ?auto_28750 ) ) ( not ( = ?auto_28747 ?auto_28750 ) ) ( not ( = ?auto_28748 ?auto_28750 ) ) ( not ( = ?auto_28749 ?auto_28750 ) ) ( ON-TABLE ?auto_28750 ) ( ON ?auto_28746 ?auto_28751 ) ( not ( = ?auto_28746 ?auto_28751 ) ) ( not ( = ?auto_28747 ?auto_28751 ) ) ( not ( = ?auto_28748 ?auto_28751 ) ) ( not ( = ?auto_28749 ?auto_28751 ) ) ( not ( = ?auto_28750 ?auto_28751 ) ) ( ON ?auto_28747 ?auto_28746 ) ( ON-TABLE ?auto_28751 ) ( ON ?auto_28748 ?auto_28747 ) ( CLEAR ?auto_28750 ) ( ON ?auto_28749 ?auto_28748 ) ( CLEAR ?auto_28749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28751 ?auto_28746 ?auto_28747 ?auto_28748 )
      ( MAKE-4PILE ?auto_28746 ?auto_28747 ?auto_28748 ?auto_28749 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28752 - BLOCK
      ?auto_28753 - BLOCK
      ?auto_28754 - BLOCK
      ?auto_28755 - BLOCK
    )
    :vars
    (
      ?auto_28756 - BLOCK
      ?auto_28757 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28752 ?auto_28753 ) ) ( not ( = ?auto_28752 ?auto_28754 ) ) ( not ( = ?auto_28752 ?auto_28755 ) ) ( not ( = ?auto_28753 ?auto_28754 ) ) ( not ( = ?auto_28753 ?auto_28755 ) ) ( not ( = ?auto_28754 ?auto_28755 ) ) ( not ( = ?auto_28752 ?auto_28756 ) ) ( not ( = ?auto_28753 ?auto_28756 ) ) ( not ( = ?auto_28754 ?auto_28756 ) ) ( not ( = ?auto_28755 ?auto_28756 ) ) ( ON ?auto_28752 ?auto_28757 ) ( not ( = ?auto_28752 ?auto_28757 ) ) ( not ( = ?auto_28753 ?auto_28757 ) ) ( not ( = ?auto_28754 ?auto_28757 ) ) ( not ( = ?auto_28755 ?auto_28757 ) ) ( not ( = ?auto_28756 ?auto_28757 ) ) ( ON ?auto_28753 ?auto_28752 ) ( ON-TABLE ?auto_28757 ) ( ON ?auto_28754 ?auto_28753 ) ( ON ?auto_28755 ?auto_28754 ) ( CLEAR ?auto_28755 ) ( HOLDING ?auto_28756 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28756 )
      ( MAKE-4PILE ?auto_28752 ?auto_28753 ?auto_28754 ?auto_28755 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28758 - BLOCK
      ?auto_28759 - BLOCK
      ?auto_28760 - BLOCK
      ?auto_28761 - BLOCK
    )
    :vars
    (
      ?auto_28762 - BLOCK
      ?auto_28763 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28758 ?auto_28759 ) ) ( not ( = ?auto_28758 ?auto_28760 ) ) ( not ( = ?auto_28758 ?auto_28761 ) ) ( not ( = ?auto_28759 ?auto_28760 ) ) ( not ( = ?auto_28759 ?auto_28761 ) ) ( not ( = ?auto_28760 ?auto_28761 ) ) ( not ( = ?auto_28758 ?auto_28762 ) ) ( not ( = ?auto_28759 ?auto_28762 ) ) ( not ( = ?auto_28760 ?auto_28762 ) ) ( not ( = ?auto_28761 ?auto_28762 ) ) ( ON ?auto_28758 ?auto_28763 ) ( not ( = ?auto_28758 ?auto_28763 ) ) ( not ( = ?auto_28759 ?auto_28763 ) ) ( not ( = ?auto_28760 ?auto_28763 ) ) ( not ( = ?auto_28761 ?auto_28763 ) ) ( not ( = ?auto_28762 ?auto_28763 ) ) ( ON ?auto_28759 ?auto_28758 ) ( ON-TABLE ?auto_28763 ) ( ON ?auto_28760 ?auto_28759 ) ( ON ?auto_28761 ?auto_28760 ) ( ON ?auto_28762 ?auto_28761 ) ( CLEAR ?auto_28762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28763 ?auto_28758 ?auto_28759 ?auto_28760 ?auto_28761 )
      ( MAKE-4PILE ?auto_28758 ?auto_28759 ?auto_28760 ?auto_28761 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28774 - BLOCK
      ?auto_28775 - BLOCK
      ?auto_28776 - BLOCK
      ?auto_28777 - BLOCK
      ?auto_28778 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_28777 ) ( ON-TABLE ?auto_28774 ) ( ON ?auto_28775 ?auto_28774 ) ( ON ?auto_28776 ?auto_28775 ) ( ON ?auto_28777 ?auto_28776 ) ( not ( = ?auto_28774 ?auto_28775 ) ) ( not ( = ?auto_28774 ?auto_28776 ) ) ( not ( = ?auto_28774 ?auto_28777 ) ) ( not ( = ?auto_28774 ?auto_28778 ) ) ( not ( = ?auto_28775 ?auto_28776 ) ) ( not ( = ?auto_28775 ?auto_28777 ) ) ( not ( = ?auto_28775 ?auto_28778 ) ) ( not ( = ?auto_28776 ?auto_28777 ) ) ( not ( = ?auto_28776 ?auto_28778 ) ) ( not ( = ?auto_28777 ?auto_28778 ) ) ( ON-TABLE ?auto_28778 ) ( CLEAR ?auto_28778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_28778 )
      ( MAKE-5PILE ?auto_28774 ?auto_28775 ?auto_28776 ?auto_28777 ?auto_28778 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28779 - BLOCK
      ?auto_28780 - BLOCK
      ?auto_28781 - BLOCK
      ?auto_28782 - BLOCK
      ?auto_28783 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28779 ) ( ON ?auto_28780 ?auto_28779 ) ( ON ?auto_28781 ?auto_28780 ) ( not ( = ?auto_28779 ?auto_28780 ) ) ( not ( = ?auto_28779 ?auto_28781 ) ) ( not ( = ?auto_28779 ?auto_28782 ) ) ( not ( = ?auto_28779 ?auto_28783 ) ) ( not ( = ?auto_28780 ?auto_28781 ) ) ( not ( = ?auto_28780 ?auto_28782 ) ) ( not ( = ?auto_28780 ?auto_28783 ) ) ( not ( = ?auto_28781 ?auto_28782 ) ) ( not ( = ?auto_28781 ?auto_28783 ) ) ( not ( = ?auto_28782 ?auto_28783 ) ) ( ON-TABLE ?auto_28783 ) ( CLEAR ?auto_28783 ) ( HOLDING ?auto_28782 ) ( CLEAR ?auto_28781 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28779 ?auto_28780 ?auto_28781 ?auto_28782 )
      ( MAKE-5PILE ?auto_28779 ?auto_28780 ?auto_28781 ?auto_28782 ?auto_28783 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28784 - BLOCK
      ?auto_28785 - BLOCK
      ?auto_28786 - BLOCK
      ?auto_28787 - BLOCK
      ?auto_28788 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28784 ) ( ON ?auto_28785 ?auto_28784 ) ( ON ?auto_28786 ?auto_28785 ) ( not ( = ?auto_28784 ?auto_28785 ) ) ( not ( = ?auto_28784 ?auto_28786 ) ) ( not ( = ?auto_28784 ?auto_28787 ) ) ( not ( = ?auto_28784 ?auto_28788 ) ) ( not ( = ?auto_28785 ?auto_28786 ) ) ( not ( = ?auto_28785 ?auto_28787 ) ) ( not ( = ?auto_28785 ?auto_28788 ) ) ( not ( = ?auto_28786 ?auto_28787 ) ) ( not ( = ?auto_28786 ?auto_28788 ) ) ( not ( = ?auto_28787 ?auto_28788 ) ) ( ON-TABLE ?auto_28788 ) ( CLEAR ?auto_28786 ) ( ON ?auto_28787 ?auto_28788 ) ( CLEAR ?auto_28787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28788 )
      ( MAKE-5PILE ?auto_28784 ?auto_28785 ?auto_28786 ?auto_28787 ?auto_28788 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28789 - BLOCK
      ?auto_28790 - BLOCK
      ?auto_28791 - BLOCK
      ?auto_28792 - BLOCK
      ?auto_28793 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28789 ) ( ON ?auto_28790 ?auto_28789 ) ( not ( = ?auto_28789 ?auto_28790 ) ) ( not ( = ?auto_28789 ?auto_28791 ) ) ( not ( = ?auto_28789 ?auto_28792 ) ) ( not ( = ?auto_28789 ?auto_28793 ) ) ( not ( = ?auto_28790 ?auto_28791 ) ) ( not ( = ?auto_28790 ?auto_28792 ) ) ( not ( = ?auto_28790 ?auto_28793 ) ) ( not ( = ?auto_28791 ?auto_28792 ) ) ( not ( = ?auto_28791 ?auto_28793 ) ) ( not ( = ?auto_28792 ?auto_28793 ) ) ( ON-TABLE ?auto_28793 ) ( ON ?auto_28792 ?auto_28793 ) ( CLEAR ?auto_28792 ) ( HOLDING ?auto_28791 ) ( CLEAR ?auto_28790 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28789 ?auto_28790 ?auto_28791 )
      ( MAKE-5PILE ?auto_28789 ?auto_28790 ?auto_28791 ?auto_28792 ?auto_28793 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28794 - BLOCK
      ?auto_28795 - BLOCK
      ?auto_28796 - BLOCK
      ?auto_28797 - BLOCK
      ?auto_28798 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28794 ) ( ON ?auto_28795 ?auto_28794 ) ( not ( = ?auto_28794 ?auto_28795 ) ) ( not ( = ?auto_28794 ?auto_28796 ) ) ( not ( = ?auto_28794 ?auto_28797 ) ) ( not ( = ?auto_28794 ?auto_28798 ) ) ( not ( = ?auto_28795 ?auto_28796 ) ) ( not ( = ?auto_28795 ?auto_28797 ) ) ( not ( = ?auto_28795 ?auto_28798 ) ) ( not ( = ?auto_28796 ?auto_28797 ) ) ( not ( = ?auto_28796 ?auto_28798 ) ) ( not ( = ?auto_28797 ?auto_28798 ) ) ( ON-TABLE ?auto_28798 ) ( ON ?auto_28797 ?auto_28798 ) ( CLEAR ?auto_28795 ) ( ON ?auto_28796 ?auto_28797 ) ( CLEAR ?auto_28796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28798 ?auto_28797 )
      ( MAKE-5PILE ?auto_28794 ?auto_28795 ?auto_28796 ?auto_28797 ?auto_28798 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28799 - BLOCK
      ?auto_28800 - BLOCK
      ?auto_28801 - BLOCK
      ?auto_28802 - BLOCK
      ?auto_28803 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28799 ) ( not ( = ?auto_28799 ?auto_28800 ) ) ( not ( = ?auto_28799 ?auto_28801 ) ) ( not ( = ?auto_28799 ?auto_28802 ) ) ( not ( = ?auto_28799 ?auto_28803 ) ) ( not ( = ?auto_28800 ?auto_28801 ) ) ( not ( = ?auto_28800 ?auto_28802 ) ) ( not ( = ?auto_28800 ?auto_28803 ) ) ( not ( = ?auto_28801 ?auto_28802 ) ) ( not ( = ?auto_28801 ?auto_28803 ) ) ( not ( = ?auto_28802 ?auto_28803 ) ) ( ON-TABLE ?auto_28803 ) ( ON ?auto_28802 ?auto_28803 ) ( ON ?auto_28801 ?auto_28802 ) ( CLEAR ?auto_28801 ) ( HOLDING ?auto_28800 ) ( CLEAR ?auto_28799 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28799 ?auto_28800 )
      ( MAKE-5PILE ?auto_28799 ?auto_28800 ?auto_28801 ?auto_28802 ?auto_28803 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28804 - BLOCK
      ?auto_28805 - BLOCK
      ?auto_28806 - BLOCK
      ?auto_28807 - BLOCK
      ?auto_28808 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28804 ) ( not ( = ?auto_28804 ?auto_28805 ) ) ( not ( = ?auto_28804 ?auto_28806 ) ) ( not ( = ?auto_28804 ?auto_28807 ) ) ( not ( = ?auto_28804 ?auto_28808 ) ) ( not ( = ?auto_28805 ?auto_28806 ) ) ( not ( = ?auto_28805 ?auto_28807 ) ) ( not ( = ?auto_28805 ?auto_28808 ) ) ( not ( = ?auto_28806 ?auto_28807 ) ) ( not ( = ?auto_28806 ?auto_28808 ) ) ( not ( = ?auto_28807 ?auto_28808 ) ) ( ON-TABLE ?auto_28808 ) ( ON ?auto_28807 ?auto_28808 ) ( ON ?auto_28806 ?auto_28807 ) ( CLEAR ?auto_28804 ) ( ON ?auto_28805 ?auto_28806 ) ( CLEAR ?auto_28805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28808 ?auto_28807 ?auto_28806 )
      ( MAKE-5PILE ?auto_28804 ?auto_28805 ?auto_28806 ?auto_28807 ?auto_28808 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28809 - BLOCK
      ?auto_28810 - BLOCK
      ?auto_28811 - BLOCK
      ?auto_28812 - BLOCK
      ?auto_28813 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28809 ?auto_28810 ) ) ( not ( = ?auto_28809 ?auto_28811 ) ) ( not ( = ?auto_28809 ?auto_28812 ) ) ( not ( = ?auto_28809 ?auto_28813 ) ) ( not ( = ?auto_28810 ?auto_28811 ) ) ( not ( = ?auto_28810 ?auto_28812 ) ) ( not ( = ?auto_28810 ?auto_28813 ) ) ( not ( = ?auto_28811 ?auto_28812 ) ) ( not ( = ?auto_28811 ?auto_28813 ) ) ( not ( = ?auto_28812 ?auto_28813 ) ) ( ON-TABLE ?auto_28813 ) ( ON ?auto_28812 ?auto_28813 ) ( ON ?auto_28811 ?auto_28812 ) ( ON ?auto_28810 ?auto_28811 ) ( CLEAR ?auto_28810 ) ( HOLDING ?auto_28809 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28809 )
      ( MAKE-5PILE ?auto_28809 ?auto_28810 ?auto_28811 ?auto_28812 ?auto_28813 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28814 - BLOCK
      ?auto_28815 - BLOCK
      ?auto_28816 - BLOCK
      ?auto_28817 - BLOCK
      ?auto_28818 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28814 ?auto_28815 ) ) ( not ( = ?auto_28814 ?auto_28816 ) ) ( not ( = ?auto_28814 ?auto_28817 ) ) ( not ( = ?auto_28814 ?auto_28818 ) ) ( not ( = ?auto_28815 ?auto_28816 ) ) ( not ( = ?auto_28815 ?auto_28817 ) ) ( not ( = ?auto_28815 ?auto_28818 ) ) ( not ( = ?auto_28816 ?auto_28817 ) ) ( not ( = ?auto_28816 ?auto_28818 ) ) ( not ( = ?auto_28817 ?auto_28818 ) ) ( ON-TABLE ?auto_28818 ) ( ON ?auto_28817 ?auto_28818 ) ( ON ?auto_28816 ?auto_28817 ) ( ON ?auto_28815 ?auto_28816 ) ( ON ?auto_28814 ?auto_28815 ) ( CLEAR ?auto_28814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28818 ?auto_28817 ?auto_28816 ?auto_28815 )
      ( MAKE-5PILE ?auto_28814 ?auto_28815 ?auto_28816 ?auto_28817 ?auto_28818 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28824 - BLOCK
      ?auto_28825 - BLOCK
      ?auto_28826 - BLOCK
      ?auto_28827 - BLOCK
      ?auto_28828 - BLOCK
    )
    :vars
    (
      ?auto_28829 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28824 ?auto_28825 ) ) ( not ( = ?auto_28824 ?auto_28826 ) ) ( not ( = ?auto_28824 ?auto_28827 ) ) ( not ( = ?auto_28824 ?auto_28828 ) ) ( not ( = ?auto_28825 ?auto_28826 ) ) ( not ( = ?auto_28825 ?auto_28827 ) ) ( not ( = ?auto_28825 ?auto_28828 ) ) ( not ( = ?auto_28826 ?auto_28827 ) ) ( not ( = ?auto_28826 ?auto_28828 ) ) ( not ( = ?auto_28827 ?auto_28828 ) ) ( ON-TABLE ?auto_28828 ) ( ON ?auto_28827 ?auto_28828 ) ( ON ?auto_28826 ?auto_28827 ) ( ON ?auto_28825 ?auto_28826 ) ( CLEAR ?auto_28825 ) ( ON ?auto_28824 ?auto_28829 ) ( CLEAR ?auto_28824 ) ( HAND-EMPTY ) ( not ( = ?auto_28824 ?auto_28829 ) ) ( not ( = ?auto_28825 ?auto_28829 ) ) ( not ( = ?auto_28826 ?auto_28829 ) ) ( not ( = ?auto_28827 ?auto_28829 ) ) ( not ( = ?auto_28828 ?auto_28829 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28824 ?auto_28829 )
      ( MAKE-5PILE ?auto_28824 ?auto_28825 ?auto_28826 ?auto_28827 ?auto_28828 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28830 - BLOCK
      ?auto_28831 - BLOCK
      ?auto_28832 - BLOCK
      ?auto_28833 - BLOCK
      ?auto_28834 - BLOCK
    )
    :vars
    (
      ?auto_28835 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28830 ?auto_28831 ) ) ( not ( = ?auto_28830 ?auto_28832 ) ) ( not ( = ?auto_28830 ?auto_28833 ) ) ( not ( = ?auto_28830 ?auto_28834 ) ) ( not ( = ?auto_28831 ?auto_28832 ) ) ( not ( = ?auto_28831 ?auto_28833 ) ) ( not ( = ?auto_28831 ?auto_28834 ) ) ( not ( = ?auto_28832 ?auto_28833 ) ) ( not ( = ?auto_28832 ?auto_28834 ) ) ( not ( = ?auto_28833 ?auto_28834 ) ) ( ON-TABLE ?auto_28834 ) ( ON ?auto_28833 ?auto_28834 ) ( ON ?auto_28832 ?auto_28833 ) ( ON ?auto_28830 ?auto_28835 ) ( CLEAR ?auto_28830 ) ( not ( = ?auto_28830 ?auto_28835 ) ) ( not ( = ?auto_28831 ?auto_28835 ) ) ( not ( = ?auto_28832 ?auto_28835 ) ) ( not ( = ?auto_28833 ?auto_28835 ) ) ( not ( = ?auto_28834 ?auto_28835 ) ) ( HOLDING ?auto_28831 ) ( CLEAR ?auto_28832 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28834 ?auto_28833 ?auto_28832 ?auto_28831 )
      ( MAKE-5PILE ?auto_28830 ?auto_28831 ?auto_28832 ?auto_28833 ?auto_28834 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28836 - BLOCK
      ?auto_28837 - BLOCK
      ?auto_28838 - BLOCK
      ?auto_28839 - BLOCK
      ?auto_28840 - BLOCK
    )
    :vars
    (
      ?auto_28841 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28836 ?auto_28837 ) ) ( not ( = ?auto_28836 ?auto_28838 ) ) ( not ( = ?auto_28836 ?auto_28839 ) ) ( not ( = ?auto_28836 ?auto_28840 ) ) ( not ( = ?auto_28837 ?auto_28838 ) ) ( not ( = ?auto_28837 ?auto_28839 ) ) ( not ( = ?auto_28837 ?auto_28840 ) ) ( not ( = ?auto_28838 ?auto_28839 ) ) ( not ( = ?auto_28838 ?auto_28840 ) ) ( not ( = ?auto_28839 ?auto_28840 ) ) ( ON-TABLE ?auto_28840 ) ( ON ?auto_28839 ?auto_28840 ) ( ON ?auto_28838 ?auto_28839 ) ( ON ?auto_28836 ?auto_28841 ) ( not ( = ?auto_28836 ?auto_28841 ) ) ( not ( = ?auto_28837 ?auto_28841 ) ) ( not ( = ?auto_28838 ?auto_28841 ) ) ( not ( = ?auto_28839 ?auto_28841 ) ) ( not ( = ?auto_28840 ?auto_28841 ) ) ( CLEAR ?auto_28838 ) ( ON ?auto_28837 ?auto_28836 ) ( CLEAR ?auto_28837 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28841 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28841 ?auto_28836 )
      ( MAKE-5PILE ?auto_28836 ?auto_28837 ?auto_28838 ?auto_28839 ?auto_28840 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28842 - BLOCK
      ?auto_28843 - BLOCK
      ?auto_28844 - BLOCK
      ?auto_28845 - BLOCK
      ?auto_28846 - BLOCK
    )
    :vars
    (
      ?auto_28847 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28842 ?auto_28843 ) ) ( not ( = ?auto_28842 ?auto_28844 ) ) ( not ( = ?auto_28842 ?auto_28845 ) ) ( not ( = ?auto_28842 ?auto_28846 ) ) ( not ( = ?auto_28843 ?auto_28844 ) ) ( not ( = ?auto_28843 ?auto_28845 ) ) ( not ( = ?auto_28843 ?auto_28846 ) ) ( not ( = ?auto_28844 ?auto_28845 ) ) ( not ( = ?auto_28844 ?auto_28846 ) ) ( not ( = ?auto_28845 ?auto_28846 ) ) ( ON-TABLE ?auto_28846 ) ( ON ?auto_28845 ?auto_28846 ) ( ON ?auto_28842 ?auto_28847 ) ( not ( = ?auto_28842 ?auto_28847 ) ) ( not ( = ?auto_28843 ?auto_28847 ) ) ( not ( = ?auto_28844 ?auto_28847 ) ) ( not ( = ?auto_28845 ?auto_28847 ) ) ( not ( = ?auto_28846 ?auto_28847 ) ) ( ON ?auto_28843 ?auto_28842 ) ( CLEAR ?auto_28843 ) ( ON-TABLE ?auto_28847 ) ( HOLDING ?auto_28844 ) ( CLEAR ?auto_28845 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28846 ?auto_28845 ?auto_28844 )
      ( MAKE-5PILE ?auto_28842 ?auto_28843 ?auto_28844 ?auto_28845 ?auto_28846 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28848 - BLOCK
      ?auto_28849 - BLOCK
      ?auto_28850 - BLOCK
      ?auto_28851 - BLOCK
      ?auto_28852 - BLOCK
    )
    :vars
    (
      ?auto_28853 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28848 ?auto_28849 ) ) ( not ( = ?auto_28848 ?auto_28850 ) ) ( not ( = ?auto_28848 ?auto_28851 ) ) ( not ( = ?auto_28848 ?auto_28852 ) ) ( not ( = ?auto_28849 ?auto_28850 ) ) ( not ( = ?auto_28849 ?auto_28851 ) ) ( not ( = ?auto_28849 ?auto_28852 ) ) ( not ( = ?auto_28850 ?auto_28851 ) ) ( not ( = ?auto_28850 ?auto_28852 ) ) ( not ( = ?auto_28851 ?auto_28852 ) ) ( ON-TABLE ?auto_28852 ) ( ON ?auto_28851 ?auto_28852 ) ( ON ?auto_28848 ?auto_28853 ) ( not ( = ?auto_28848 ?auto_28853 ) ) ( not ( = ?auto_28849 ?auto_28853 ) ) ( not ( = ?auto_28850 ?auto_28853 ) ) ( not ( = ?auto_28851 ?auto_28853 ) ) ( not ( = ?auto_28852 ?auto_28853 ) ) ( ON ?auto_28849 ?auto_28848 ) ( ON-TABLE ?auto_28853 ) ( CLEAR ?auto_28851 ) ( ON ?auto_28850 ?auto_28849 ) ( CLEAR ?auto_28850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28853 ?auto_28848 ?auto_28849 )
      ( MAKE-5PILE ?auto_28848 ?auto_28849 ?auto_28850 ?auto_28851 ?auto_28852 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28854 - BLOCK
      ?auto_28855 - BLOCK
      ?auto_28856 - BLOCK
      ?auto_28857 - BLOCK
      ?auto_28858 - BLOCK
    )
    :vars
    (
      ?auto_28859 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28854 ?auto_28855 ) ) ( not ( = ?auto_28854 ?auto_28856 ) ) ( not ( = ?auto_28854 ?auto_28857 ) ) ( not ( = ?auto_28854 ?auto_28858 ) ) ( not ( = ?auto_28855 ?auto_28856 ) ) ( not ( = ?auto_28855 ?auto_28857 ) ) ( not ( = ?auto_28855 ?auto_28858 ) ) ( not ( = ?auto_28856 ?auto_28857 ) ) ( not ( = ?auto_28856 ?auto_28858 ) ) ( not ( = ?auto_28857 ?auto_28858 ) ) ( ON-TABLE ?auto_28858 ) ( ON ?auto_28854 ?auto_28859 ) ( not ( = ?auto_28854 ?auto_28859 ) ) ( not ( = ?auto_28855 ?auto_28859 ) ) ( not ( = ?auto_28856 ?auto_28859 ) ) ( not ( = ?auto_28857 ?auto_28859 ) ) ( not ( = ?auto_28858 ?auto_28859 ) ) ( ON ?auto_28855 ?auto_28854 ) ( ON-TABLE ?auto_28859 ) ( ON ?auto_28856 ?auto_28855 ) ( CLEAR ?auto_28856 ) ( HOLDING ?auto_28857 ) ( CLEAR ?auto_28858 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28858 ?auto_28857 )
      ( MAKE-5PILE ?auto_28854 ?auto_28855 ?auto_28856 ?auto_28857 ?auto_28858 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28860 - BLOCK
      ?auto_28861 - BLOCK
      ?auto_28862 - BLOCK
      ?auto_28863 - BLOCK
      ?auto_28864 - BLOCK
    )
    :vars
    (
      ?auto_28865 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28860 ?auto_28861 ) ) ( not ( = ?auto_28860 ?auto_28862 ) ) ( not ( = ?auto_28860 ?auto_28863 ) ) ( not ( = ?auto_28860 ?auto_28864 ) ) ( not ( = ?auto_28861 ?auto_28862 ) ) ( not ( = ?auto_28861 ?auto_28863 ) ) ( not ( = ?auto_28861 ?auto_28864 ) ) ( not ( = ?auto_28862 ?auto_28863 ) ) ( not ( = ?auto_28862 ?auto_28864 ) ) ( not ( = ?auto_28863 ?auto_28864 ) ) ( ON-TABLE ?auto_28864 ) ( ON ?auto_28860 ?auto_28865 ) ( not ( = ?auto_28860 ?auto_28865 ) ) ( not ( = ?auto_28861 ?auto_28865 ) ) ( not ( = ?auto_28862 ?auto_28865 ) ) ( not ( = ?auto_28863 ?auto_28865 ) ) ( not ( = ?auto_28864 ?auto_28865 ) ) ( ON ?auto_28861 ?auto_28860 ) ( ON-TABLE ?auto_28865 ) ( ON ?auto_28862 ?auto_28861 ) ( CLEAR ?auto_28864 ) ( ON ?auto_28863 ?auto_28862 ) ( CLEAR ?auto_28863 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28865 ?auto_28860 ?auto_28861 ?auto_28862 )
      ( MAKE-5PILE ?auto_28860 ?auto_28861 ?auto_28862 ?auto_28863 ?auto_28864 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28866 - BLOCK
      ?auto_28867 - BLOCK
      ?auto_28868 - BLOCK
      ?auto_28869 - BLOCK
      ?auto_28870 - BLOCK
    )
    :vars
    (
      ?auto_28871 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28866 ?auto_28867 ) ) ( not ( = ?auto_28866 ?auto_28868 ) ) ( not ( = ?auto_28866 ?auto_28869 ) ) ( not ( = ?auto_28866 ?auto_28870 ) ) ( not ( = ?auto_28867 ?auto_28868 ) ) ( not ( = ?auto_28867 ?auto_28869 ) ) ( not ( = ?auto_28867 ?auto_28870 ) ) ( not ( = ?auto_28868 ?auto_28869 ) ) ( not ( = ?auto_28868 ?auto_28870 ) ) ( not ( = ?auto_28869 ?auto_28870 ) ) ( ON ?auto_28866 ?auto_28871 ) ( not ( = ?auto_28866 ?auto_28871 ) ) ( not ( = ?auto_28867 ?auto_28871 ) ) ( not ( = ?auto_28868 ?auto_28871 ) ) ( not ( = ?auto_28869 ?auto_28871 ) ) ( not ( = ?auto_28870 ?auto_28871 ) ) ( ON ?auto_28867 ?auto_28866 ) ( ON-TABLE ?auto_28871 ) ( ON ?auto_28868 ?auto_28867 ) ( ON ?auto_28869 ?auto_28868 ) ( CLEAR ?auto_28869 ) ( HOLDING ?auto_28870 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28870 )
      ( MAKE-5PILE ?auto_28866 ?auto_28867 ?auto_28868 ?auto_28869 ?auto_28870 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28872 - BLOCK
      ?auto_28873 - BLOCK
      ?auto_28874 - BLOCK
      ?auto_28875 - BLOCK
      ?auto_28876 - BLOCK
    )
    :vars
    (
      ?auto_28877 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28872 ?auto_28873 ) ) ( not ( = ?auto_28872 ?auto_28874 ) ) ( not ( = ?auto_28872 ?auto_28875 ) ) ( not ( = ?auto_28872 ?auto_28876 ) ) ( not ( = ?auto_28873 ?auto_28874 ) ) ( not ( = ?auto_28873 ?auto_28875 ) ) ( not ( = ?auto_28873 ?auto_28876 ) ) ( not ( = ?auto_28874 ?auto_28875 ) ) ( not ( = ?auto_28874 ?auto_28876 ) ) ( not ( = ?auto_28875 ?auto_28876 ) ) ( ON ?auto_28872 ?auto_28877 ) ( not ( = ?auto_28872 ?auto_28877 ) ) ( not ( = ?auto_28873 ?auto_28877 ) ) ( not ( = ?auto_28874 ?auto_28877 ) ) ( not ( = ?auto_28875 ?auto_28877 ) ) ( not ( = ?auto_28876 ?auto_28877 ) ) ( ON ?auto_28873 ?auto_28872 ) ( ON-TABLE ?auto_28877 ) ( ON ?auto_28874 ?auto_28873 ) ( ON ?auto_28875 ?auto_28874 ) ( ON ?auto_28876 ?auto_28875 ) ( CLEAR ?auto_28876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28877 ?auto_28872 ?auto_28873 ?auto_28874 ?auto_28875 )
      ( MAKE-5PILE ?auto_28872 ?auto_28873 ?auto_28874 ?auto_28875 ?auto_28876 ) )
  )

)

