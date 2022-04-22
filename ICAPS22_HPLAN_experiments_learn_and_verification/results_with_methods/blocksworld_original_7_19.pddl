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

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_129973 - BLOCK
      ?auto_129974 - BLOCK
      ?auto_129975 - BLOCK
      ?auto_129976 - BLOCK
      ?auto_129977 - BLOCK
      ?auto_129978 - BLOCK
      ?auto_129979 - BLOCK
    )
    :vars
    (
      ?auto_129980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129980 ?auto_129979 ) ( CLEAR ?auto_129980 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_129973 ) ( ON ?auto_129974 ?auto_129973 ) ( ON ?auto_129975 ?auto_129974 ) ( ON ?auto_129976 ?auto_129975 ) ( ON ?auto_129977 ?auto_129976 ) ( ON ?auto_129978 ?auto_129977 ) ( ON ?auto_129979 ?auto_129978 ) ( not ( = ?auto_129973 ?auto_129974 ) ) ( not ( = ?auto_129973 ?auto_129975 ) ) ( not ( = ?auto_129973 ?auto_129976 ) ) ( not ( = ?auto_129973 ?auto_129977 ) ) ( not ( = ?auto_129973 ?auto_129978 ) ) ( not ( = ?auto_129973 ?auto_129979 ) ) ( not ( = ?auto_129973 ?auto_129980 ) ) ( not ( = ?auto_129974 ?auto_129975 ) ) ( not ( = ?auto_129974 ?auto_129976 ) ) ( not ( = ?auto_129974 ?auto_129977 ) ) ( not ( = ?auto_129974 ?auto_129978 ) ) ( not ( = ?auto_129974 ?auto_129979 ) ) ( not ( = ?auto_129974 ?auto_129980 ) ) ( not ( = ?auto_129975 ?auto_129976 ) ) ( not ( = ?auto_129975 ?auto_129977 ) ) ( not ( = ?auto_129975 ?auto_129978 ) ) ( not ( = ?auto_129975 ?auto_129979 ) ) ( not ( = ?auto_129975 ?auto_129980 ) ) ( not ( = ?auto_129976 ?auto_129977 ) ) ( not ( = ?auto_129976 ?auto_129978 ) ) ( not ( = ?auto_129976 ?auto_129979 ) ) ( not ( = ?auto_129976 ?auto_129980 ) ) ( not ( = ?auto_129977 ?auto_129978 ) ) ( not ( = ?auto_129977 ?auto_129979 ) ) ( not ( = ?auto_129977 ?auto_129980 ) ) ( not ( = ?auto_129978 ?auto_129979 ) ) ( not ( = ?auto_129978 ?auto_129980 ) ) ( not ( = ?auto_129979 ?auto_129980 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_129980 ?auto_129979 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129982 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_129982 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_129982 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129983 - BLOCK
    )
    :vars
    (
      ?auto_129984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129983 ?auto_129984 ) ( CLEAR ?auto_129983 ) ( HAND-EMPTY ) ( not ( = ?auto_129983 ?auto_129984 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_129983 ?auto_129984 )
      ( MAKE-1PILE ?auto_129983 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_129991 - BLOCK
      ?auto_129992 - BLOCK
      ?auto_129993 - BLOCK
      ?auto_129994 - BLOCK
      ?auto_129995 - BLOCK
      ?auto_129996 - BLOCK
    )
    :vars
    (
      ?auto_129997 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129997 ?auto_129996 ) ( CLEAR ?auto_129997 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_129991 ) ( ON ?auto_129992 ?auto_129991 ) ( ON ?auto_129993 ?auto_129992 ) ( ON ?auto_129994 ?auto_129993 ) ( ON ?auto_129995 ?auto_129994 ) ( ON ?auto_129996 ?auto_129995 ) ( not ( = ?auto_129991 ?auto_129992 ) ) ( not ( = ?auto_129991 ?auto_129993 ) ) ( not ( = ?auto_129991 ?auto_129994 ) ) ( not ( = ?auto_129991 ?auto_129995 ) ) ( not ( = ?auto_129991 ?auto_129996 ) ) ( not ( = ?auto_129991 ?auto_129997 ) ) ( not ( = ?auto_129992 ?auto_129993 ) ) ( not ( = ?auto_129992 ?auto_129994 ) ) ( not ( = ?auto_129992 ?auto_129995 ) ) ( not ( = ?auto_129992 ?auto_129996 ) ) ( not ( = ?auto_129992 ?auto_129997 ) ) ( not ( = ?auto_129993 ?auto_129994 ) ) ( not ( = ?auto_129993 ?auto_129995 ) ) ( not ( = ?auto_129993 ?auto_129996 ) ) ( not ( = ?auto_129993 ?auto_129997 ) ) ( not ( = ?auto_129994 ?auto_129995 ) ) ( not ( = ?auto_129994 ?auto_129996 ) ) ( not ( = ?auto_129994 ?auto_129997 ) ) ( not ( = ?auto_129995 ?auto_129996 ) ) ( not ( = ?auto_129995 ?auto_129997 ) ) ( not ( = ?auto_129996 ?auto_129997 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_129997 ?auto_129996 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_129998 - BLOCK
      ?auto_129999 - BLOCK
      ?auto_130000 - BLOCK
      ?auto_130001 - BLOCK
      ?auto_130002 - BLOCK
      ?auto_130003 - BLOCK
    )
    :vars
    (
      ?auto_130004 - BLOCK
      ?auto_130005 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130004 ?auto_130003 ) ( CLEAR ?auto_130004 ) ( ON-TABLE ?auto_129998 ) ( ON ?auto_129999 ?auto_129998 ) ( ON ?auto_130000 ?auto_129999 ) ( ON ?auto_130001 ?auto_130000 ) ( ON ?auto_130002 ?auto_130001 ) ( ON ?auto_130003 ?auto_130002 ) ( not ( = ?auto_129998 ?auto_129999 ) ) ( not ( = ?auto_129998 ?auto_130000 ) ) ( not ( = ?auto_129998 ?auto_130001 ) ) ( not ( = ?auto_129998 ?auto_130002 ) ) ( not ( = ?auto_129998 ?auto_130003 ) ) ( not ( = ?auto_129998 ?auto_130004 ) ) ( not ( = ?auto_129999 ?auto_130000 ) ) ( not ( = ?auto_129999 ?auto_130001 ) ) ( not ( = ?auto_129999 ?auto_130002 ) ) ( not ( = ?auto_129999 ?auto_130003 ) ) ( not ( = ?auto_129999 ?auto_130004 ) ) ( not ( = ?auto_130000 ?auto_130001 ) ) ( not ( = ?auto_130000 ?auto_130002 ) ) ( not ( = ?auto_130000 ?auto_130003 ) ) ( not ( = ?auto_130000 ?auto_130004 ) ) ( not ( = ?auto_130001 ?auto_130002 ) ) ( not ( = ?auto_130001 ?auto_130003 ) ) ( not ( = ?auto_130001 ?auto_130004 ) ) ( not ( = ?auto_130002 ?auto_130003 ) ) ( not ( = ?auto_130002 ?auto_130004 ) ) ( not ( = ?auto_130003 ?auto_130004 ) ) ( HOLDING ?auto_130005 ) ( not ( = ?auto_129998 ?auto_130005 ) ) ( not ( = ?auto_129999 ?auto_130005 ) ) ( not ( = ?auto_130000 ?auto_130005 ) ) ( not ( = ?auto_130001 ?auto_130005 ) ) ( not ( = ?auto_130002 ?auto_130005 ) ) ( not ( = ?auto_130003 ?auto_130005 ) ) ( not ( = ?auto_130004 ?auto_130005 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_130005 )
      ( MAKE-6PILE ?auto_129998 ?auto_129999 ?auto_130000 ?auto_130001 ?auto_130002 ?auto_130003 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_130006 - BLOCK
      ?auto_130007 - BLOCK
      ?auto_130008 - BLOCK
      ?auto_130009 - BLOCK
      ?auto_130010 - BLOCK
      ?auto_130011 - BLOCK
    )
    :vars
    (
      ?auto_130012 - BLOCK
      ?auto_130013 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130012 ?auto_130011 ) ( ON-TABLE ?auto_130006 ) ( ON ?auto_130007 ?auto_130006 ) ( ON ?auto_130008 ?auto_130007 ) ( ON ?auto_130009 ?auto_130008 ) ( ON ?auto_130010 ?auto_130009 ) ( ON ?auto_130011 ?auto_130010 ) ( not ( = ?auto_130006 ?auto_130007 ) ) ( not ( = ?auto_130006 ?auto_130008 ) ) ( not ( = ?auto_130006 ?auto_130009 ) ) ( not ( = ?auto_130006 ?auto_130010 ) ) ( not ( = ?auto_130006 ?auto_130011 ) ) ( not ( = ?auto_130006 ?auto_130012 ) ) ( not ( = ?auto_130007 ?auto_130008 ) ) ( not ( = ?auto_130007 ?auto_130009 ) ) ( not ( = ?auto_130007 ?auto_130010 ) ) ( not ( = ?auto_130007 ?auto_130011 ) ) ( not ( = ?auto_130007 ?auto_130012 ) ) ( not ( = ?auto_130008 ?auto_130009 ) ) ( not ( = ?auto_130008 ?auto_130010 ) ) ( not ( = ?auto_130008 ?auto_130011 ) ) ( not ( = ?auto_130008 ?auto_130012 ) ) ( not ( = ?auto_130009 ?auto_130010 ) ) ( not ( = ?auto_130009 ?auto_130011 ) ) ( not ( = ?auto_130009 ?auto_130012 ) ) ( not ( = ?auto_130010 ?auto_130011 ) ) ( not ( = ?auto_130010 ?auto_130012 ) ) ( not ( = ?auto_130011 ?auto_130012 ) ) ( not ( = ?auto_130006 ?auto_130013 ) ) ( not ( = ?auto_130007 ?auto_130013 ) ) ( not ( = ?auto_130008 ?auto_130013 ) ) ( not ( = ?auto_130009 ?auto_130013 ) ) ( not ( = ?auto_130010 ?auto_130013 ) ) ( not ( = ?auto_130011 ?auto_130013 ) ) ( not ( = ?auto_130012 ?auto_130013 ) ) ( ON ?auto_130013 ?auto_130012 ) ( CLEAR ?auto_130013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_130006 ?auto_130007 ?auto_130008 ?auto_130009 ?auto_130010 ?auto_130011 ?auto_130012 )
      ( MAKE-6PILE ?auto_130006 ?auto_130007 ?auto_130008 ?auto_130009 ?auto_130010 ?auto_130011 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_130016 - BLOCK
      ?auto_130017 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_130017 ) ( CLEAR ?auto_130016 ) ( ON-TABLE ?auto_130016 ) ( not ( = ?auto_130016 ?auto_130017 ) ) )
    :subtasks
    ( ( !STACK ?auto_130017 ?auto_130016 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_130018 - BLOCK
      ?auto_130019 - BLOCK
    )
    :vars
    (
      ?auto_130020 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_130018 ) ( ON-TABLE ?auto_130018 ) ( not ( = ?auto_130018 ?auto_130019 ) ) ( ON ?auto_130019 ?auto_130020 ) ( CLEAR ?auto_130019 ) ( HAND-EMPTY ) ( not ( = ?auto_130018 ?auto_130020 ) ) ( not ( = ?auto_130019 ?auto_130020 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_130019 ?auto_130020 )
      ( MAKE-2PILE ?auto_130018 ?auto_130019 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_130021 - BLOCK
      ?auto_130022 - BLOCK
    )
    :vars
    (
      ?auto_130023 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130021 ?auto_130022 ) ) ( ON ?auto_130022 ?auto_130023 ) ( CLEAR ?auto_130022 ) ( not ( = ?auto_130021 ?auto_130023 ) ) ( not ( = ?auto_130022 ?auto_130023 ) ) ( HOLDING ?auto_130021 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_130021 )
      ( MAKE-2PILE ?auto_130021 ?auto_130022 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_130024 - BLOCK
      ?auto_130025 - BLOCK
    )
    :vars
    (
      ?auto_130026 - BLOCK
      ?auto_130029 - BLOCK
      ?auto_130028 - BLOCK
      ?auto_130027 - BLOCK
      ?auto_130030 - BLOCK
      ?auto_130031 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130024 ?auto_130025 ) ) ( ON ?auto_130025 ?auto_130026 ) ( not ( = ?auto_130024 ?auto_130026 ) ) ( not ( = ?auto_130025 ?auto_130026 ) ) ( ON ?auto_130024 ?auto_130025 ) ( CLEAR ?auto_130024 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_130029 ) ( ON ?auto_130028 ?auto_130029 ) ( ON ?auto_130027 ?auto_130028 ) ( ON ?auto_130030 ?auto_130027 ) ( ON ?auto_130031 ?auto_130030 ) ( ON ?auto_130026 ?auto_130031 ) ( not ( = ?auto_130029 ?auto_130028 ) ) ( not ( = ?auto_130029 ?auto_130027 ) ) ( not ( = ?auto_130029 ?auto_130030 ) ) ( not ( = ?auto_130029 ?auto_130031 ) ) ( not ( = ?auto_130029 ?auto_130026 ) ) ( not ( = ?auto_130029 ?auto_130025 ) ) ( not ( = ?auto_130029 ?auto_130024 ) ) ( not ( = ?auto_130028 ?auto_130027 ) ) ( not ( = ?auto_130028 ?auto_130030 ) ) ( not ( = ?auto_130028 ?auto_130031 ) ) ( not ( = ?auto_130028 ?auto_130026 ) ) ( not ( = ?auto_130028 ?auto_130025 ) ) ( not ( = ?auto_130028 ?auto_130024 ) ) ( not ( = ?auto_130027 ?auto_130030 ) ) ( not ( = ?auto_130027 ?auto_130031 ) ) ( not ( = ?auto_130027 ?auto_130026 ) ) ( not ( = ?auto_130027 ?auto_130025 ) ) ( not ( = ?auto_130027 ?auto_130024 ) ) ( not ( = ?auto_130030 ?auto_130031 ) ) ( not ( = ?auto_130030 ?auto_130026 ) ) ( not ( = ?auto_130030 ?auto_130025 ) ) ( not ( = ?auto_130030 ?auto_130024 ) ) ( not ( = ?auto_130031 ?auto_130026 ) ) ( not ( = ?auto_130031 ?auto_130025 ) ) ( not ( = ?auto_130031 ?auto_130024 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_130029 ?auto_130028 ?auto_130027 ?auto_130030 ?auto_130031 ?auto_130026 ?auto_130025 )
      ( MAKE-2PILE ?auto_130024 ?auto_130025 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_130037 - BLOCK
      ?auto_130038 - BLOCK
      ?auto_130039 - BLOCK
      ?auto_130040 - BLOCK
      ?auto_130041 - BLOCK
    )
    :vars
    (
      ?auto_130042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130042 ?auto_130041 ) ( CLEAR ?auto_130042 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_130037 ) ( ON ?auto_130038 ?auto_130037 ) ( ON ?auto_130039 ?auto_130038 ) ( ON ?auto_130040 ?auto_130039 ) ( ON ?auto_130041 ?auto_130040 ) ( not ( = ?auto_130037 ?auto_130038 ) ) ( not ( = ?auto_130037 ?auto_130039 ) ) ( not ( = ?auto_130037 ?auto_130040 ) ) ( not ( = ?auto_130037 ?auto_130041 ) ) ( not ( = ?auto_130037 ?auto_130042 ) ) ( not ( = ?auto_130038 ?auto_130039 ) ) ( not ( = ?auto_130038 ?auto_130040 ) ) ( not ( = ?auto_130038 ?auto_130041 ) ) ( not ( = ?auto_130038 ?auto_130042 ) ) ( not ( = ?auto_130039 ?auto_130040 ) ) ( not ( = ?auto_130039 ?auto_130041 ) ) ( not ( = ?auto_130039 ?auto_130042 ) ) ( not ( = ?auto_130040 ?auto_130041 ) ) ( not ( = ?auto_130040 ?auto_130042 ) ) ( not ( = ?auto_130041 ?auto_130042 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_130042 ?auto_130041 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_130043 - BLOCK
      ?auto_130044 - BLOCK
      ?auto_130045 - BLOCK
      ?auto_130046 - BLOCK
      ?auto_130047 - BLOCK
    )
    :vars
    (
      ?auto_130048 - BLOCK
      ?auto_130049 - BLOCK
      ?auto_130050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130048 ?auto_130047 ) ( CLEAR ?auto_130048 ) ( ON-TABLE ?auto_130043 ) ( ON ?auto_130044 ?auto_130043 ) ( ON ?auto_130045 ?auto_130044 ) ( ON ?auto_130046 ?auto_130045 ) ( ON ?auto_130047 ?auto_130046 ) ( not ( = ?auto_130043 ?auto_130044 ) ) ( not ( = ?auto_130043 ?auto_130045 ) ) ( not ( = ?auto_130043 ?auto_130046 ) ) ( not ( = ?auto_130043 ?auto_130047 ) ) ( not ( = ?auto_130043 ?auto_130048 ) ) ( not ( = ?auto_130044 ?auto_130045 ) ) ( not ( = ?auto_130044 ?auto_130046 ) ) ( not ( = ?auto_130044 ?auto_130047 ) ) ( not ( = ?auto_130044 ?auto_130048 ) ) ( not ( = ?auto_130045 ?auto_130046 ) ) ( not ( = ?auto_130045 ?auto_130047 ) ) ( not ( = ?auto_130045 ?auto_130048 ) ) ( not ( = ?auto_130046 ?auto_130047 ) ) ( not ( = ?auto_130046 ?auto_130048 ) ) ( not ( = ?auto_130047 ?auto_130048 ) ) ( HOLDING ?auto_130049 ) ( CLEAR ?auto_130050 ) ( not ( = ?auto_130043 ?auto_130049 ) ) ( not ( = ?auto_130043 ?auto_130050 ) ) ( not ( = ?auto_130044 ?auto_130049 ) ) ( not ( = ?auto_130044 ?auto_130050 ) ) ( not ( = ?auto_130045 ?auto_130049 ) ) ( not ( = ?auto_130045 ?auto_130050 ) ) ( not ( = ?auto_130046 ?auto_130049 ) ) ( not ( = ?auto_130046 ?auto_130050 ) ) ( not ( = ?auto_130047 ?auto_130049 ) ) ( not ( = ?auto_130047 ?auto_130050 ) ) ( not ( = ?auto_130048 ?auto_130049 ) ) ( not ( = ?auto_130048 ?auto_130050 ) ) ( not ( = ?auto_130049 ?auto_130050 ) ) )
    :subtasks
    ( ( !STACK ?auto_130049 ?auto_130050 )
      ( MAKE-5PILE ?auto_130043 ?auto_130044 ?auto_130045 ?auto_130046 ?auto_130047 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_130051 - BLOCK
      ?auto_130052 - BLOCK
      ?auto_130053 - BLOCK
      ?auto_130054 - BLOCK
      ?auto_130055 - BLOCK
    )
    :vars
    (
      ?auto_130057 - BLOCK
      ?auto_130056 - BLOCK
      ?auto_130058 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130057 ?auto_130055 ) ( ON-TABLE ?auto_130051 ) ( ON ?auto_130052 ?auto_130051 ) ( ON ?auto_130053 ?auto_130052 ) ( ON ?auto_130054 ?auto_130053 ) ( ON ?auto_130055 ?auto_130054 ) ( not ( = ?auto_130051 ?auto_130052 ) ) ( not ( = ?auto_130051 ?auto_130053 ) ) ( not ( = ?auto_130051 ?auto_130054 ) ) ( not ( = ?auto_130051 ?auto_130055 ) ) ( not ( = ?auto_130051 ?auto_130057 ) ) ( not ( = ?auto_130052 ?auto_130053 ) ) ( not ( = ?auto_130052 ?auto_130054 ) ) ( not ( = ?auto_130052 ?auto_130055 ) ) ( not ( = ?auto_130052 ?auto_130057 ) ) ( not ( = ?auto_130053 ?auto_130054 ) ) ( not ( = ?auto_130053 ?auto_130055 ) ) ( not ( = ?auto_130053 ?auto_130057 ) ) ( not ( = ?auto_130054 ?auto_130055 ) ) ( not ( = ?auto_130054 ?auto_130057 ) ) ( not ( = ?auto_130055 ?auto_130057 ) ) ( CLEAR ?auto_130056 ) ( not ( = ?auto_130051 ?auto_130058 ) ) ( not ( = ?auto_130051 ?auto_130056 ) ) ( not ( = ?auto_130052 ?auto_130058 ) ) ( not ( = ?auto_130052 ?auto_130056 ) ) ( not ( = ?auto_130053 ?auto_130058 ) ) ( not ( = ?auto_130053 ?auto_130056 ) ) ( not ( = ?auto_130054 ?auto_130058 ) ) ( not ( = ?auto_130054 ?auto_130056 ) ) ( not ( = ?auto_130055 ?auto_130058 ) ) ( not ( = ?auto_130055 ?auto_130056 ) ) ( not ( = ?auto_130057 ?auto_130058 ) ) ( not ( = ?auto_130057 ?auto_130056 ) ) ( not ( = ?auto_130058 ?auto_130056 ) ) ( ON ?auto_130058 ?auto_130057 ) ( CLEAR ?auto_130058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_130051 ?auto_130052 ?auto_130053 ?auto_130054 ?auto_130055 ?auto_130057 )
      ( MAKE-5PILE ?auto_130051 ?auto_130052 ?auto_130053 ?auto_130054 ?auto_130055 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_130059 - BLOCK
      ?auto_130060 - BLOCK
      ?auto_130061 - BLOCK
      ?auto_130062 - BLOCK
      ?auto_130063 - BLOCK
    )
    :vars
    (
      ?auto_130066 - BLOCK
      ?auto_130065 - BLOCK
      ?auto_130064 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130066 ?auto_130063 ) ( ON-TABLE ?auto_130059 ) ( ON ?auto_130060 ?auto_130059 ) ( ON ?auto_130061 ?auto_130060 ) ( ON ?auto_130062 ?auto_130061 ) ( ON ?auto_130063 ?auto_130062 ) ( not ( = ?auto_130059 ?auto_130060 ) ) ( not ( = ?auto_130059 ?auto_130061 ) ) ( not ( = ?auto_130059 ?auto_130062 ) ) ( not ( = ?auto_130059 ?auto_130063 ) ) ( not ( = ?auto_130059 ?auto_130066 ) ) ( not ( = ?auto_130060 ?auto_130061 ) ) ( not ( = ?auto_130060 ?auto_130062 ) ) ( not ( = ?auto_130060 ?auto_130063 ) ) ( not ( = ?auto_130060 ?auto_130066 ) ) ( not ( = ?auto_130061 ?auto_130062 ) ) ( not ( = ?auto_130061 ?auto_130063 ) ) ( not ( = ?auto_130061 ?auto_130066 ) ) ( not ( = ?auto_130062 ?auto_130063 ) ) ( not ( = ?auto_130062 ?auto_130066 ) ) ( not ( = ?auto_130063 ?auto_130066 ) ) ( not ( = ?auto_130059 ?auto_130065 ) ) ( not ( = ?auto_130059 ?auto_130064 ) ) ( not ( = ?auto_130060 ?auto_130065 ) ) ( not ( = ?auto_130060 ?auto_130064 ) ) ( not ( = ?auto_130061 ?auto_130065 ) ) ( not ( = ?auto_130061 ?auto_130064 ) ) ( not ( = ?auto_130062 ?auto_130065 ) ) ( not ( = ?auto_130062 ?auto_130064 ) ) ( not ( = ?auto_130063 ?auto_130065 ) ) ( not ( = ?auto_130063 ?auto_130064 ) ) ( not ( = ?auto_130066 ?auto_130065 ) ) ( not ( = ?auto_130066 ?auto_130064 ) ) ( not ( = ?auto_130065 ?auto_130064 ) ) ( ON ?auto_130065 ?auto_130066 ) ( CLEAR ?auto_130065 ) ( HOLDING ?auto_130064 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_130064 )
      ( MAKE-5PILE ?auto_130059 ?auto_130060 ?auto_130061 ?auto_130062 ?auto_130063 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_130067 - BLOCK
      ?auto_130068 - BLOCK
      ?auto_130069 - BLOCK
      ?auto_130070 - BLOCK
      ?auto_130071 - BLOCK
    )
    :vars
    (
      ?auto_130074 - BLOCK
      ?auto_130072 - BLOCK
      ?auto_130073 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130074 ?auto_130071 ) ( ON-TABLE ?auto_130067 ) ( ON ?auto_130068 ?auto_130067 ) ( ON ?auto_130069 ?auto_130068 ) ( ON ?auto_130070 ?auto_130069 ) ( ON ?auto_130071 ?auto_130070 ) ( not ( = ?auto_130067 ?auto_130068 ) ) ( not ( = ?auto_130067 ?auto_130069 ) ) ( not ( = ?auto_130067 ?auto_130070 ) ) ( not ( = ?auto_130067 ?auto_130071 ) ) ( not ( = ?auto_130067 ?auto_130074 ) ) ( not ( = ?auto_130068 ?auto_130069 ) ) ( not ( = ?auto_130068 ?auto_130070 ) ) ( not ( = ?auto_130068 ?auto_130071 ) ) ( not ( = ?auto_130068 ?auto_130074 ) ) ( not ( = ?auto_130069 ?auto_130070 ) ) ( not ( = ?auto_130069 ?auto_130071 ) ) ( not ( = ?auto_130069 ?auto_130074 ) ) ( not ( = ?auto_130070 ?auto_130071 ) ) ( not ( = ?auto_130070 ?auto_130074 ) ) ( not ( = ?auto_130071 ?auto_130074 ) ) ( not ( = ?auto_130067 ?auto_130072 ) ) ( not ( = ?auto_130067 ?auto_130073 ) ) ( not ( = ?auto_130068 ?auto_130072 ) ) ( not ( = ?auto_130068 ?auto_130073 ) ) ( not ( = ?auto_130069 ?auto_130072 ) ) ( not ( = ?auto_130069 ?auto_130073 ) ) ( not ( = ?auto_130070 ?auto_130072 ) ) ( not ( = ?auto_130070 ?auto_130073 ) ) ( not ( = ?auto_130071 ?auto_130072 ) ) ( not ( = ?auto_130071 ?auto_130073 ) ) ( not ( = ?auto_130074 ?auto_130072 ) ) ( not ( = ?auto_130074 ?auto_130073 ) ) ( not ( = ?auto_130072 ?auto_130073 ) ) ( ON ?auto_130072 ?auto_130074 ) ( ON ?auto_130073 ?auto_130072 ) ( CLEAR ?auto_130073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_130067 ?auto_130068 ?auto_130069 ?auto_130070 ?auto_130071 ?auto_130074 ?auto_130072 )
      ( MAKE-5PILE ?auto_130067 ?auto_130068 ?auto_130069 ?auto_130070 ?auto_130071 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_130078 - BLOCK
      ?auto_130079 - BLOCK
      ?auto_130080 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_130080 ) ( CLEAR ?auto_130079 ) ( ON-TABLE ?auto_130078 ) ( ON ?auto_130079 ?auto_130078 ) ( not ( = ?auto_130078 ?auto_130079 ) ) ( not ( = ?auto_130078 ?auto_130080 ) ) ( not ( = ?auto_130079 ?auto_130080 ) ) )
    :subtasks
    ( ( !STACK ?auto_130080 ?auto_130079 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_130081 - BLOCK
      ?auto_130082 - BLOCK
      ?auto_130083 - BLOCK
    )
    :vars
    (
      ?auto_130084 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_130082 ) ( ON-TABLE ?auto_130081 ) ( ON ?auto_130082 ?auto_130081 ) ( not ( = ?auto_130081 ?auto_130082 ) ) ( not ( = ?auto_130081 ?auto_130083 ) ) ( not ( = ?auto_130082 ?auto_130083 ) ) ( ON ?auto_130083 ?auto_130084 ) ( CLEAR ?auto_130083 ) ( HAND-EMPTY ) ( not ( = ?auto_130081 ?auto_130084 ) ) ( not ( = ?auto_130082 ?auto_130084 ) ) ( not ( = ?auto_130083 ?auto_130084 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_130083 ?auto_130084 )
      ( MAKE-3PILE ?auto_130081 ?auto_130082 ?auto_130083 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_130085 - BLOCK
      ?auto_130086 - BLOCK
      ?auto_130087 - BLOCK
    )
    :vars
    (
      ?auto_130088 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130085 ) ( not ( = ?auto_130085 ?auto_130086 ) ) ( not ( = ?auto_130085 ?auto_130087 ) ) ( not ( = ?auto_130086 ?auto_130087 ) ) ( ON ?auto_130087 ?auto_130088 ) ( CLEAR ?auto_130087 ) ( not ( = ?auto_130085 ?auto_130088 ) ) ( not ( = ?auto_130086 ?auto_130088 ) ) ( not ( = ?auto_130087 ?auto_130088 ) ) ( HOLDING ?auto_130086 ) ( CLEAR ?auto_130085 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_130085 ?auto_130086 )
      ( MAKE-3PILE ?auto_130085 ?auto_130086 ?auto_130087 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_130089 - BLOCK
      ?auto_130090 - BLOCK
      ?auto_130091 - BLOCK
    )
    :vars
    (
      ?auto_130092 - BLOCK
      ?auto_130095 - BLOCK
      ?auto_130093 - BLOCK
      ?auto_130096 - BLOCK
      ?auto_130094 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130089 ) ( not ( = ?auto_130089 ?auto_130090 ) ) ( not ( = ?auto_130089 ?auto_130091 ) ) ( not ( = ?auto_130090 ?auto_130091 ) ) ( ON ?auto_130091 ?auto_130092 ) ( not ( = ?auto_130089 ?auto_130092 ) ) ( not ( = ?auto_130090 ?auto_130092 ) ) ( not ( = ?auto_130091 ?auto_130092 ) ) ( CLEAR ?auto_130089 ) ( ON ?auto_130090 ?auto_130091 ) ( CLEAR ?auto_130090 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_130095 ) ( ON ?auto_130093 ?auto_130095 ) ( ON ?auto_130096 ?auto_130093 ) ( ON ?auto_130094 ?auto_130096 ) ( ON ?auto_130092 ?auto_130094 ) ( not ( = ?auto_130095 ?auto_130093 ) ) ( not ( = ?auto_130095 ?auto_130096 ) ) ( not ( = ?auto_130095 ?auto_130094 ) ) ( not ( = ?auto_130095 ?auto_130092 ) ) ( not ( = ?auto_130095 ?auto_130091 ) ) ( not ( = ?auto_130095 ?auto_130090 ) ) ( not ( = ?auto_130093 ?auto_130096 ) ) ( not ( = ?auto_130093 ?auto_130094 ) ) ( not ( = ?auto_130093 ?auto_130092 ) ) ( not ( = ?auto_130093 ?auto_130091 ) ) ( not ( = ?auto_130093 ?auto_130090 ) ) ( not ( = ?auto_130096 ?auto_130094 ) ) ( not ( = ?auto_130096 ?auto_130092 ) ) ( not ( = ?auto_130096 ?auto_130091 ) ) ( not ( = ?auto_130096 ?auto_130090 ) ) ( not ( = ?auto_130094 ?auto_130092 ) ) ( not ( = ?auto_130094 ?auto_130091 ) ) ( not ( = ?auto_130094 ?auto_130090 ) ) ( not ( = ?auto_130089 ?auto_130095 ) ) ( not ( = ?auto_130089 ?auto_130093 ) ) ( not ( = ?auto_130089 ?auto_130096 ) ) ( not ( = ?auto_130089 ?auto_130094 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_130095 ?auto_130093 ?auto_130096 ?auto_130094 ?auto_130092 ?auto_130091 )
      ( MAKE-3PILE ?auto_130089 ?auto_130090 ?auto_130091 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_130097 - BLOCK
      ?auto_130098 - BLOCK
      ?auto_130099 - BLOCK
    )
    :vars
    (
      ?auto_130104 - BLOCK
      ?auto_130101 - BLOCK
      ?auto_130100 - BLOCK
      ?auto_130103 - BLOCK
      ?auto_130102 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130097 ?auto_130098 ) ) ( not ( = ?auto_130097 ?auto_130099 ) ) ( not ( = ?auto_130098 ?auto_130099 ) ) ( ON ?auto_130099 ?auto_130104 ) ( not ( = ?auto_130097 ?auto_130104 ) ) ( not ( = ?auto_130098 ?auto_130104 ) ) ( not ( = ?auto_130099 ?auto_130104 ) ) ( ON ?auto_130098 ?auto_130099 ) ( CLEAR ?auto_130098 ) ( ON-TABLE ?auto_130101 ) ( ON ?auto_130100 ?auto_130101 ) ( ON ?auto_130103 ?auto_130100 ) ( ON ?auto_130102 ?auto_130103 ) ( ON ?auto_130104 ?auto_130102 ) ( not ( = ?auto_130101 ?auto_130100 ) ) ( not ( = ?auto_130101 ?auto_130103 ) ) ( not ( = ?auto_130101 ?auto_130102 ) ) ( not ( = ?auto_130101 ?auto_130104 ) ) ( not ( = ?auto_130101 ?auto_130099 ) ) ( not ( = ?auto_130101 ?auto_130098 ) ) ( not ( = ?auto_130100 ?auto_130103 ) ) ( not ( = ?auto_130100 ?auto_130102 ) ) ( not ( = ?auto_130100 ?auto_130104 ) ) ( not ( = ?auto_130100 ?auto_130099 ) ) ( not ( = ?auto_130100 ?auto_130098 ) ) ( not ( = ?auto_130103 ?auto_130102 ) ) ( not ( = ?auto_130103 ?auto_130104 ) ) ( not ( = ?auto_130103 ?auto_130099 ) ) ( not ( = ?auto_130103 ?auto_130098 ) ) ( not ( = ?auto_130102 ?auto_130104 ) ) ( not ( = ?auto_130102 ?auto_130099 ) ) ( not ( = ?auto_130102 ?auto_130098 ) ) ( not ( = ?auto_130097 ?auto_130101 ) ) ( not ( = ?auto_130097 ?auto_130100 ) ) ( not ( = ?auto_130097 ?auto_130103 ) ) ( not ( = ?auto_130097 ?auto_130102 ) ) ( HOLDING ?auto_130097 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_130097 )
      ( MAKE-3PILE ?auto_130097 ?auto_130098 ?auto_130099 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_130105 - BLOCK
      ?auto_130106 - BLOCK
      ?auto_130107 - BLOCK
    )
    :vars
    (
      ?auto_130111 - BLOCK
      ?auto_130108 - BLOCK
      ?auto_130109 - BLOCK
      ?auto_130110 - BLOCK
      ?auto_130112 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130105 ?auto_130106 ) ) ( not ( = ?auto_130105 ?auto_130107 ) ) ( not ( = ?auto_130106 ?auto_130107 ) ) ( ON ?auto_130107 ?auto_130111 ) ( not ( = ?auto_130105 ?auto_130111 ) ) ( not ( = ?auto_130106 ?auto_130111 ) ) ( not ( = ?auto_130107 ?auto_130111 ) ) ( ON ?auto_130106 ?auto_130107 ) ( ON-TABLE ?auto_130108 ) ( ON ?auto_130109 ?auto_130108 ) ( ON ?auto_130110 ?auto_130109 ) ( ON ?auto_130112 ?auto_130110 ) ( ON ?auto_130111 ?auto_130112 ) ( not ( = ?auto_130108 ?auto_130109 ) ) ( not ( = ?auto_130108 ?auto_130110 ) ) ( not ( = ?auto_130108 ?auto_130112 ) ) ( not ( = ?auto_130108 ?auto_130111 ) ) ( not ( = ?auto_130108 ?auto_130107 ) ) ( not ( = ?auto_130108 ?auto_130106 ) ) ( not ( = ?auto_130109 ?auto_130110 ) ) ( not ( = ?auto_130109 ?auto_130112 ) ) ( not ( = ?auto_130109 ?auto_130111 ) ) ( not ( = ?auto_130109 ?auto_130107 ) ) ( not ( = ?auto_130109 ?auto_130106 ) ) ( not ( = ?auto_130110 ?auto_130112 ) ) ( not ( = ?auto_130110 ?auto_130111 ) ) ( not ( = ?auto_130110 ?auto_130107 ) ) ( not ( = ?auto_130110 ?auto_130106 ) ) ( not ( = ?auto_130112 ?auto_130111 ) ) ( not ( = ?auto_130112 ?auto_130107 ) ) ( not ( = ?auto_130112 ?auto_130106 ) ) ( not ( = ?auto_130105 ?auto_130108 ) ) ( not ( = ?auto_130105 ?auto_130109 ) ) ( not ( = ?auto_130105 ?auto_130110 ) ) ( not ( = ?auto_130105 ?auto_130112 ) ) ( ON ?auto_130105 ?auto_130106 ) ( CLEAR ?auto_130105 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_130108 ?auto_130109 ?auto_130110 ?auto_130112 ?auto_130111 ?auto_130107 ?auto_130106 )
      ( MAKE-3PILE ?auto_130105 ?auto_130106 ?auto_130107 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130117 - BLOCK
      ?auto_130118 - BLOCK
      ?auto_130119 - BLOCK
      ?auto_130120 - BLOCK
    )
    :vars
    (
      ?auto_130121 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130121 ?auto_130120 ) ( CLEAR ?auto_130121 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_130117 ) ( ON ?auto_130118 ?auto_130117 ) ( ON ?auto_130119 ?auto_130118 ) ( ON ?auto_130120 ?auto_130119 ) ( not ( = ?auto_130117 ?auto_130118 ) ) ( not ( = ?auto_130117 ?auto_130119 ) ) ( not ( = ?auto_130117 ?auto_130120 ) ) ( not ( = ?auto_130117 ?auto_130121 ) ) ( not ( = ?auto_130118 ?auto_130119 ) ) ( not ( = ?auto_130118 ?auto_130120 ) ) ( not ( = ?auto_130118 ?auto_130121 ) ) ( not ( = ?auto_130119 ?auto_130120 ) ) ( not ( = ?auto_130119 ?auto_130121 ) ) ( not ( = ?auto_130120 ?auto_130121 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_130121 ?auto_130120 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130122 - BLOCK
      ?auto_130123 - BLOCK
      ?auto_130124 - BLOCK
      ?auto_130125 - BLOCK
    )
    :vars
    (
      ?auto_130126 - BLOCK
      ?auto_130127 - BLOCK
      ?auto_130128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130126 ?auto_130125 ) ( CLEAR ?auto_130126 ) ( ON-TABLE ?auto_130122 ) ( ON ?auto_130123 ?auto_130122 ) ( ON ?auto_130124 ?auto_130123 ) ( ON ?auto_130125 ?auto_130124 ) ( not ( = ?auto_130122 ?auto_130123 ) ) ( not ( = ?auto_130122 ?auto_130124 ) ) ( not ( = ?auto_130122 ?auto_130125 ) ) ( not ( = ?auto_130122 ?auto_130126 ) ) ( not ( = ?auto_130123 ?auto_130124 ) ) ( not ( = ?auto_130123 ?auto_130125 ) ) ( not ( = ?auto_130123 ?auto_130126 ) ) ( not ( = ?auto_130124 ?auto_130125 ) ) ( not ( = ?auto_130124 ?auto_130126 ) ) ( not ( = ?auto_130125 ?auto_130126 ) ) ( HOLDING ?auto_130127 ) ( CLEAR ?auto_130128 ) ( not ( = ?auto_130122 ?auto_130127 ) ) ( not ( = ?auto_130122 ?auto_130128 ) ) ( not ( = ?auto_130123 ?auto_130127 ) ) ( not ( = ?auto_130123 ?auto_130128 ) ) ( not ( = ?auto_130124 ?auto_130127 ) ) ( not ( = ?auto_130124 ?auto_130128 ) ) ( not ( = ?auto_130125 ?auto_130127 ) ) ( not ( = ?auto_130125 ?auto_130128 ) ) ( not ( = ?auto_130126 ?auto_130127 ) ) ( not ( = ?auto_130126 ?auto_130128 ) ) ( not ( = ?auto_130127 ?auto_130128 ) ) )
    :subtasks
    ( ( !STACK ?auto_130127 ?auto_130128 )
      ( MAKE-4PILE ?auto_130122 ?auto_130123 ?auto_130124 ?auto_130125 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130129 - BLOCK
      ?auto_130130 - BLOCK
      ?auto_130131 - BLOCK
      ?auto_130132 - BLOCK
    )
    :vars
    (
      ?auto_130135 - BLOCK
      ?auto_130134 - BLOCK
      ?auto_130133 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130135 ?auto_130132 ) ( ON-TABLE ?auto_130129 ) ( ON ?auto_130130 ?auto_130129 ) ( ON ?auto_130131 ?auto_130130 ) ( ON ?auto_130132 ?auto_130131 ) ( not ( = ?auto_130129 ?auto_130130 ) ) ( not ( = ?auto_130129 ?auto_130131 ) ) ( not ( = ?auto_130129 ?auto_130132 ) ) ( not ( = ?auto_130129 ?auto_130135 ) ) ( not ( = ?auto_130130 ?auto_130131 ) ) ( not ( = ?auto_130130 ?auto_130132 ) ) ( not ( = ?auto_130130 ?auto_130135 ) ) ( not ( = ?auto_130131 ?auto_130132 ) ) ( not ( = ?auto_130131 ?auto_130135 ) ) ( not ( = ?auto_130132 ?auto_130135 ) ) ( CLEAR ?auto_130134 ) ( not ( = ?auto_130129 ?auto_130133 ) ) ( not ( = ?auto_130129 ?auto_130134 ) ) ( not ( = ?auto_130130 ?auto_130133 ) ) ( not ( = ?auto_130130 ?auto_130134 ) ) ( not ( = ?auto_130131 ?auto_130133 ) ) ( not ( = ?auto_130131 ?auto_130134 ) ) ( not ( = ?auto_130132 ?auto_130133 ) ) ( not ( = ?auto_130132 ?auto_130134 ) ) ( not ( = ?auto_130135 ?auto_130133 ) ) ( not ( = ?auto_130135 ?auto_130134 ) ) ( not ( = ?auto_130133 ?auto_130134 ) ) ( ON ?auto_130133 ?auto_130135 ) ( CLEAR ?auto_130133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_130129 ?auto_130130 ?auto_130131 ?auto_130132 ?auto_130135 )
      ( MAKE-4PILE ?auto_130129 ?auto_130130 ?auto_130131 ?auto_130132 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130136 - BLOCK
      ?auto_130137 - BLOCK
      ?auto_130138 - BLOCK
      ?auto_130139 - BLOCK
    )
    :vars
    (
      ?auto_130141 - BLOCK
      ?auto_130142 - BLOCK
      ?auto_130140 - BLOCK
      ?auto_130143 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130141 ?auto_130139 ) ( ON-TABLE ?auto_130136 ) ( ON ?auto_130137 ?auto_130136 ) ( ON ?auto_130138 ?auto_130137 ) ( ON ?auto_130139 ?auto_130138 ) ( not ( = ?auto_130136 ?auto_130137 ) ) ( not ( = ?auto_130136 ?auto_130138 ) ) ( not ( = ?auto_130136 ?auto_130139 ) ) ( not ( = ?auto_130136 ?auto_130141 ) ) ( not ( = ?auto_130137 ?auto_130138 ) ) ( not ( = ?auto_130137 ?auto_130139 ) ) ( not ( = ?auto_130137 ?auto_130141 ) ) ( not ( = ?auto_130138 ?auto_130139 ) ) ( not ( = ?auto_130138 ?auto_130141 ) ) ( not ( = ?auto_130139 ?auto_130141 ) ) ( not ( = ?auto_130136 ?auto_130142 ) ) ( not ( = ?auto_130136 ?auto_130140 ) ) ( not ( = ?auto_130137 ?auto_130142 ) ) ( not ( = ?auto_130137 ?auto_130140 ) ) ( not ( = ?auto_130138 ?auto_130142 ) ) ( not ( = ?auto_130138 ?auto_130140 ) ) ( not ( = ?auto_130139 ?auto_130142 ) ) ( not ( = ?auto_130139 ?auto_130140 ) ) ( not ( = ?auto_130141 ?auto_130142 ) ) ( not ( = ?auto_130141 ?auto_130140 ) ) ( not ( = ?auto_130142 ?auto_130140 ) ) ( ON ?auto_130142 ?auto_130141 ) ( CLEAR ?auto_130142 ) ( HOLDING ?auto_130140 ) ( CLEAR ?auto_130143 ) ( ON-TABLE ?auto_130143 ) ( not ( = ?auto_130143 ?auto_130140 ) ) ( not ( = ?auto_130136 ?auto_130143 ) ) ( not ( = ?auto_130137 ?auto_130143 ) ) ( not ( = ?auto_130138 ?auto_130143 ) ) ( not ( = ?auto_130139 ?auto_130143 ) ) ( not ( = ?auto_130141 ?auto_130143 ) ) ( not ( = ?auto_130142 ?auto_130143 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_130143 ?auto_130140 )
      ( MAKE-4PILE ?auto_130136 ?auto_130137 ?auto_130138 ?auto_130139 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130144 - BLOCK
      ?auto_130145 - BLOCK
      ?auto_130146 - BLOCK
      ?auto_130147 - BLOCK
    )
    :vars
    (
      ?auto_130151 - BLOCK
      ?auto_130149 - BLOCK
      ?auto_130148 - BLOCK
      ?auto_130150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130151 ?auto_130147 ) ( ON-TABLE ?auto_130144 ) ( ON ?auto_130145 ?auto_130144 ) ( ON ?auto_130146 ?auto_130145 ) ( ON ?auto_130147 ?auto_130146 ) ( not ( = ?auto_130144 ?auto_130145 ) ) ( not ( = ?auto_130144 ?auto_130146 ) ) ( not ( = ?auto_130144 ?auto_130147 ) ) ( not ( = ?auto_130144 ?auto_130151 ) ) ( not ( = ?auto_130145 ?auto_130146 ) ) ( not ( = ?auto_130145 ?auto_130147 ) ) ( not ( = ?auto_130145 ?auto_130151 ) ) ( not ( = ?auto_130146 ?auto_130147 ) ) ( not ( = ?auto_130146 ?auto_130151 ) ) ( not ( = ?auto_130147 ?auto_130151 ) ) ( not ( = ?auto_130144 ?auto_130149 ) ) ( not ( = ?auto_130144 ?auto_130148 ) ) ( not ( = ?auto_130145 ?auto_130149 ) ) ( not ( = ?auto_130145 ?auto_130148 ) ) ( not ( = ?auto_130146 ?auto_130149 ) ) ( not ( = ?auto_130146 ?auto_130148 ) ) ( not ( = ?auto_130147 ?auto_130149 ) ) ( not ( = ?auto_130147 ?auto_130148 ) ) ( not ( = ?auto_130151 ?auto_130149 ) ) ( not ( = ?auto_130151 ?auto_130148 ) ) ( not ( = ?auto_130149 ?auto_130148 ) ) ( ON ?auto_130149 ?auto_130151 ) ( CLEAR ?auto_130150 ) ( ON-TABLE ?auto_130150 ) ( not ( = ?auto_130150 ?auto_130148 ) ) ( not ( = ?auto_130144 ?auto_130150 ) ) ( not ( = ?auto_130145 ?auto_130150 ) ) ( not ( = ?auto_130146 ?auto_130150 ) ) ( not ( = ?auto_130147 ?auto_130150 ) ) ( not ( = ?auto_130151 ?auto_130150 ) ) ( not ( = ?auto_130149 ?auto_130150 ) ) ( ON ?auto_130148 ?auto_130149 ) ( CLEAR ?auto_130148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_130144 ?auto_130145 ?auto_130146 ?auto_130147 ?auto_130151 ?auto_130149 )
      ( MAKE-4PILE ?auto_130144 ?auto_130145 ?auto_130146 ?auto_130147 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130152 - BLOCK
      ?auto_130153 - BLOCK
      ?auto_130154 - BLOCK
      ?auto_130155 - BLOCK
    )
    :vars
    (
      ?auto_130159 - BLOCK
      ?auto_130156 - BLOCK
      ?auto_130158 - BLOCK
      ?auto_130157 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130159 ?auto_130155 ) ( ON-TABLE ?auto_130152 ) ( ON ?auto_130153 ?auto_130152 ) ( ON ?auto_130154 ?auto_130153 ) ( ON ?auto_130155 ?auto_130154 ) ( not ( = ?auto_130152 ?auto_130153 ) ) ( not ( = ?auto_130152 ?auto_130154 ) ) ( not ( = ?auto_130152 ?auto_130155 ) ) ( not ( = ?auto_130152 ?auto_130159 ) ) ( not ( = ?auto_130153 ?auto_130154 ) ) ( not ( = ?auto_130153 ?auto_130155 ) ) ( not ( = ?auto_130153 ?auto_130159 ) ) ( not ( = ?auto_130154 ?auto_130155 ) ) ( not ( = ?auto_130154 ?auto_130159 ) ) ( not ( = ?auto_130155 ?auto_130159 ) ) ( not ( = ?auto_130152 ?auto_130156 ) ) ( not ( = ?auto_130152 ?auto_130158 ) ) ( not ( = ?auto_130153 ?auto_130156 ) ) ( not ( = ?auto_130153 ?auto_130158 ) ) ( not ( = ?auto_130154 ?auto_130156 ) ) ( not ( = ?auto_130154 ?auto_130158 ) ) ( not ( = ?auto_130155 ?auto_130156 ) ) ( not ( = ?auto_130155 ?auto_130158 ) ) ( not ( = ?auto_130159 ?auto_130156 ) ) ( not ( = ?auto_130159 ?auto_130158 ) ) ( not ( = ?auto_130156 ?auto_130158 ) ) ( ON ?auto_130156 ?auto_130159 ) ( not ( = ?auto_130157 ?auto_130158 ) ) ( not ( = ?auto_130152 ?auto_130157 ) ) ( not ( = ?auto_130153 ?auto_130157 ) ) ( not ( = ?auto_130154 ?auto_130157 ) ) ( not ( = ?auto_130155 ?auto_130157 ) ) ( not ( = ?auto_130159 ?auto_130157 ) ) ( not ( = ?auto_130156 ?auto_130157 ) ) ( ON ?auto_130158 ?auto_130156 ) ( CLEAR ?auto_130158 ) ( HOLDING ?auto_130157 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_130157 )
      ( MAKE-4PILE ?auto_130152 ?auto_130153 ?auto_130154 ?auto_130155 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130160 - BLOCK
      ?auto_130161 - BLOCK
      ?auto_130162 - BLOCK
      ?auto_130163 - BLOCK
    )
    :vars
    (
      ?auto_130164 - BLOCK
      ?auto_130165 - BLOCK
      ?auto_130167 - BLOCK
      ?auto_130166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130164 ?auto_130163 ) ( ON-TABLE ?auto_130160 ) ( ON ?auto_130161 ?auto_130160 ) ( ON ?auto_130162 ?auto_130161 ) ( ON ?auto_130163 ?auto_130162 ) ( not ( = ?auto_130160 ?auto_130161 ) ) ( not ( = ?auto_130160 ?auto_130162 ) ) ( not ( = ?auto_130160 ?auto_130163 ) ) ( not ( = ?auto_130160 ?auto_130164 ) ) ( not ( = ?auto_130161 ?auto_130162 ) ) ( not ( = ?auto_130161 ?auto_130163 ) ) ( not ( = ?auto_130161 ?auto_130164 ) ) ( not ( = ?auto_130162 ?auto_130163 ) ) ( not ( = ?auto_130162 ?auto_130164 ) ) ( not ( = ?auto_130163 ?auto_130164 ) ) ( not ( = ?auto_130160 ?auto_130165 ) ) ( not ( = ?auto_130160 ?auto_130167 ) ) ( not ( = ?auto_130161 ?auto_130165 ) ) ( not ( = ?auto_130161 ?auto_130167 ) ) ( not ( = ?auto_130162 ?auto_130165 ) ) ( not ( = ?auto_130162 ?auto_130167 ) ) ( not ( = ?auto_130163 ?auto_130165 ) ) ( not ( = ?auto_130163 ?auto_130167 ) ) ( not ( = ?auto_130164 ?auto_130165 ) ) ( not ( = ?auto_130164 ?auto_130167 ) ) ( not ( = ?auto_130165 ?auto_130167 ) ) ( ON ?auto_130165 ?auto_130164 ) ( not ( = ?auto_130166 ?auto_130167 ) ) ( not ( = ?auto_130160 ?auto_130166 ) ) ( not ( = ?auto_130161 ?auto_130166 ) ) ( not ( = ?auto_130162 ?auto_130166 ) ) ( not ( = ?auto_130163 ?auto_130166 ) ) ( not ( = ?auto_130164 ?auto_130166 ) ) ( not ( = ?auto_130165 ?auto_130166 ) ) ( ON ?auto_130167 ?auto_130165 ) ( ON ?auto_130166 ?auto_130167 ) ( CLEAR ?auto_130166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_130160 ?auto_130161 ?auto_130162 ?auto_130163 ?auto_130164 ?auto_130165 ?auto_130167 )
      ( MAKE-4PILE ?auto_130160 ?auto_130161 ?auto_130162 ?auto_130163 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130172 - BLOCK
      ?auto_130173 - BLOCK
      ?auto_130174 - BLOCK
      ?auto_130175 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_130175 ) ( CLEAR ?auto_130174 ) ( ON-TABLE ?auto_130172 ) ( ON ?auto_130173 ?auto_130172 ) ( ON ?auto_130174 ?auto_130173 ) ( not ( = ?auto_130172 ?auto_130173 ) ) ( not ( = ?auto_130172 ?auto_130174 ) ) ( not ( = ?auto_130172 ?auto_130175 ) ) ( not ( = ?auto_130173 ?auto_130174 ) ) ( not ( = ?auto_130173 ?auto_130175 ) ) ( not ( = ?auto_130174 ?auto_130175 ) ) )
    :subtasks
    ( ( !STACK ?auto_130175 ?auto_130174 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130176 - BLOCK
      ?auto_130177 - BLOCK
      ?auto_130178 - BLOCK
      ?auto_130179 - BLOCK
    )
    :vars
    (
      ?auto_130180 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_130178 ) ( ON-TABLE ?auto_130176 ) ( ON ?auto_130177 ?auto_130176 ) ( ON ?auto_130178 ?auto_130177 ) ( not ( = ?auto_130176 ?auto_130177 ) ) ( not ( = ?auto_130176 ?auto_130178 ) ) ( not ( = ?auto_130176 ?auto_130179 ) ) ( not ( = ?auto_130177 ?auto_130178 ) ) ( not ( = ?auto_130177 ?auto_130179 ) ) ( not ( = ?auto_130178 ?auto_130179 ) ) ( ON ?auto_130179 ?auto_130180 ) ( CLEAR ?auto_130179 ) ( HAND-EMPTY ) ( not ( = ?auto_130176 ?auto_130180 ) ) ( not ( = ?auto_130177 ?auto_130180 ) ) ( not ( = ?auto_130178 ?auto_130180 ) ) ( not ( = ?auto_130179 ?auto_130180 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_130179 ?auto_130180 )
      ( MAKE-4PILE ?auto_130176 ?auto_130177 ?auto_130178 ?auto_130179 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130181 - BLOCK
      ?auto_130182 - BLOCK
      ?auto_130183 - BLOCK
      ?auto_130184 - BLOCK
    )
    :vars
    (
      ?auto_130185 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130181 ) ( ON ?auto_130182 ?auto_130181 ) ( not ( = ?auto_130181 ?auto_130182 ) ) ( not ( = ?auto_130181 ?auto_130183 ) ) ( not ( = ?auto_130181 ?auto_130184 ) ) ( not ( = ?auto_130182 ?auto_130183 ) ) ( not ( = ?auto_130182 ?auto_130184 ) ) ( not ( = ?auto_130183 ?auto_130184 ) ) ( ON ?auto_130184 ?auto_130185 ) ( CLEAR ?auto_130184 ) ( not ( = ?auto_130181 ?auto_130185 ) ) ( not ( = ?auto_130182 ?auto_130185 ) ) ( not ( = ?auto_130183 ?auto_130185 ) ) ( not ( = ?auto_130184 ?auto_130185 ) ) ( HOLDING ?auto_130183 ) ( CLEAR ?auto_130182 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_130181 ?auto_130182 ?auto_130183 )
      ( MAKE-4PILE ?auto_130181 ?auto_130182 ?auto_130183 ?auto_130184 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130186 - BLOCK
      ?auto_130187 - BLOCK
      ?auto_130188 - BLOCK
      ?auto_130189 - BLOCK
    )
    :vars
    (
      ?auto_130190 - BLOCK
      ?auto_130193 - BLOCK
      ?auto_130191 - BLOCK
      ?auto_130192 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130186 ) ( ON ?auto_130187 ?auto_130186 ) ( not ( = ?auto_130186 ?auto_130187 ) ) ( not ( = ?auto_130186 ?auto_130188 ) ) ( not ( = ?auto_130186 ?auto_130189 ) ) ( not ( = ?auto_130187 ?auto_130188 ) ) ( not ( = ?auto_130187 ?auto_130189 ) ) ( not ( = ?auto_130188 ?auto_130189 ) ) ( ON ?auto_130189 ?auto_130190 ) ( not ( = ?auto_130186 ?auto_130190 ) ) ( not ( = ?auto_130187 ?auto_130190 ) ) ( not ( = ?auto_130188 ?auto_130190 ) ) ( not ( = ?auto_130189 ?auto_130190 ) ) ( CLEAR ?auto_130187 ) ( ON ?auto_130188 ?auto_130189 ) ( CLEAR ?auto_130188 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_130193 ) ( ON ?auto_130191 ?auto_130193 ) ( ON ?auto_130192 ?auto_130191 ) ( ON ?auto_130190 ?auto_130192 ) ( not ( = ?auto_130193 ?auto_130191 ) ) ( not ( = ?auto_130193 ?auto_130192 ) ) ( not ( = ?auto_130193 ?auto_130190 ) ) ( not ( = ?auto_130193 ?auto_130189 ) ) ( not ( = ?auto_130193 ?auto_130188 ) ) ( not ( = ?auto_130191 ?auto_130192 ) ) ( not ( = ?auto_130191 ?auto_130190 ) ) ( not ( = ?auto_130191 ?auto_130189 ) ) ( not ( = ?auto_130191 ?auto_130188 ) ) ( not ( = ?auto_130192 ?auto_130190 ) ) ( not ( = ?auto_130192 ?auto_130189 ) ) ( not ( = ?auto_130192 ?auto_130188 ) ) ( not ( = ?auto_130186 ?auto_130193 ) ) ( not ( = ?auto_130186 ?auto_130191 ) ) ( not ( = ?auto_130186 ?auto_130192 ) ) ( not ( = ?auto_130187 ?auto_130193 ) ) ( not ( = ?auto_130187 ?auto_130191 ) ) ( not ( = ?auto_130187 ?auto_130192 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_130193 ?auto_130191 ?auto_130192 ?auto_130190 ?auto_130189 )
      ( MAKE-4PILE ?auto_130186 ?auto_130187 ?auto_130188 ?auto_130189 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130194 - BLOCK
      ?auto_130195 - BLOCK
      ?auto_130196 - BLOCK
      ?auto_130197 - BLOCK
    )
    :vars
    (
      ?auto_130198 - BLOCK
      ?auto_130201 - BLOCK
      ?auto_130200 - BLOCK
      ?auto_130199 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130194 ) ( not ( = ?auto_130194 ?auto_130195 ) ) ( not ( = ?auto_130194 ?auto_130196 ) ) ( not ( = ?auto_130194 ?auto_130197 ) ) ( not ( = ?auto_130195 ?auto_130196 ) ) ( not ( = ?auto_130195 ?auto_130197 ) ) ( not ( = ?auto_130196 ?auto_130197 ) ) ( ON ?auto_130197 ?auto_130198 ) ( not ( = ?auto_130194 ?auto_130198 ) ) ( not ( = ?auto_130195 ?auto_130198 ) ) ( not ( = ?auto_130196 ?auto_130198 ) ) ( not ( = ?auto_130197 ?auto_130198 ) ) ( ON ?auto_130196 ?auto_130197 ) ( CLEAR ?auto_130196 ) ( ON-TABLE ?auto_130201 ) ( ON ?auto_130200 ?auto_130201 ) ( ON ?auto_130199 ?auto_130200 ) ( ON ?auto_130198 ?auto_130199 ) ( not ( = ?auto_130201 ?auto_130200 ) ) ( not ( = ?auto_130201 ?auto_130199 ) ) ( not ( = ?auto_130201 ?auto_130198 ) ) ( not ( = ?auto_130201 ?auto_130197 ) ) ( not ( = ?auto_130201 ?auto_130196 ) ) ( not ( = ?auto_130200 ?auto_130199 ) ) ( not ( = ?auto_130200 ?auto_130198 ) ) ( not ( = ?auto_130200 ?auto_130197 ) ) ( not ( = ?auto_130200 ?auto_130196 ) ) ( not ( = ?auto_130199 ?auto_130198 ) ) ( not ( = ?auto_130199 ?auto_130197 ) ) ( not ( = ?auto_130199 ?auto_130196 ) ) ( not ( = ?auto_130194 ?auto_130201 ) ) ( not ( = ?auto_130194 ?auto_130200 ) ) ( not ( = ?auto_130194 ?auto_130199 ) ) ( not ( = ?auto_130195 ?auto_130201 ) ) ( not ( = ?auto_130195 ?auto_130200 ) ) ( not ( = ?auto_130195 ?auto_130199 ) ) ( HOLDING ?auto_130195 ) ( CLEAR ?auto_130194 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_130194 ?auto_130195 )
      ( MAKE-4PILE ?auto_130194 ?auto_130195 ?auto_130196 ?auto_130197 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130202 - BLOCK
      ?auto_130203 - BLOCK
      ?auto_130204 - BLOCK
      ?auto_130205 - BLOCK
    )
    :vars
    (
      ?auto_130209 - BLOCK
      ?auto_130207 - BLOCK
      ?auto_130206 - BLOCK
      ?auto_130208 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130202 ) ( not ( = ?auto_130202 ?auto_130203 ) ) ( not ( = ?auto_130202 ?auto_130204 ) ) ( not ( = ?auto_130202 ?auto_130205 ) ) ( not ( = ?auto_130203 ?auto_130204 ) ) ( not ( = ?auto_130203 ?auto_130205 ) ) ( not ( = ?auto_130204 ?auto_130205 ) ) ( ON ?auto_130205 ?auto_130209 ) ( not ( = ?auto_130202 ?auto_130209 ) ) ( not ( = ?auto_130203 ?auto_130209 ) ) ( not ( = ?auto_130204 ?auto_130209 ) ) ( not ( = ?auto_130205 ?auto_130209 ) ) ( ON ?auto_130204 ?auto_130205 ) ( ON-TABLE ?auto_130207 ) ( ON ?auto_130206 ?auto_130207 ) ( ON ?auto_130208 ?auto_130206 ) ( ON ?auto_130209 ?auto_130208 ) ( not ( = ?auto_130207 ?auto_130206 ) ) ( not ( = ?auto_130207 ?auto_130208 ) ) ( not ( = ?auto_130207 ?auto_130209 ) ) ( not ( = ?auto_130207 ?auto_130205 ) ) ( not ( = ?auto_130207 ?auto_130204 ) ) ( not ( = ?auto_130206 ?auto_130208 ) ) ( not ( = ?auto_130206 ?auto_130209 ) ) ( not ( = ?auto_130206 ?auto_130205 ) ) ( not ( = ?auto_130206 ?auto_130204 ) ) ( not ( = ?auto_130208 ?auto_130209 ) ) ( not ( = ?auto_130208 ?auto_130205 ) ) ( not ( = ?auto_130208 ?auto_130204 ) ) ( not ( = ?auto_130202 ?auto_130207 ) ) ( not ( = ?auto_130202 ?auto_130206 ) ) ( not ( = ?auto_130202 ?auto_130208 ) ) ( not ( = ?auto_130203 ?auto_130207 ) ) ( not ( = ?auto_130203 ?auto_130206 ) ) ( not ( = ?auto_130203 ?auto_130208 ) ) ( CLEAR ?auto_130202 ) ( ON ?auto_130203 ?auto_130204 ) ( CLEAR ?auto_130203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_130207 ?auto_130206 ?auto_130208 ?auto_130209 ?auto_130205 ?auto_130204 )
      ( MAKE-4PILE ?auto_130202 ?auto_130203 ?auto_130204 ?auto_130205 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130210 - BLOCK
      ?auto_130211 - BLOCK
      ?auto_130212 - BLOCK
      ?auto_130213 - BLOCK
    )
    :vars
    (
      ?auto_130215 - BLOCK
      ?auto_130216 - BLOCK
      ?auto_130214 - BLOCK
      ?auto_130217 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130210 ?auto_130211 ) ) ( not ( = ?auto_130210 ?auto_130212 ) ) ( not ( = ?auto_130210 ?auto_130213 ) ) ( not ( = ?auto_130211 ?auto_130212 ) ) ( not ( = ?auto_130211 ?auto_130213 ) ) ( not ( = ?auto_130212 ?auto_130213 ) ) ( ON ?auto_130213 ?auto_130215 ) ( not ( = ?auto_130210 ?auto_130215 ) ) ( not ( = ?auto_130211 ?auto_130215 ) ) ( not ( = ?auto_130212 ?auto_130215 ) ) ( not ( = ?auto_130213 ?auto_130215 ) ) ( ON ?auto_130212 ?auto_130213 ) ( ON-TABLE ?auto_130216 ) ( ON ?auto_130214 ?auto_130216 ) ( ON ?auto_130217 ?auto_130214 ) ( ON ?auto_130215 ?auto_130217 ) ( not ( = ?auto_130216 ?auto_130214 ) ) ( not ( = ?auto_130216 ?auto_130217 ) ) ( not ( = ?auto_130216 ?auto_130215 ) ) ( not ( = ?auto_130216 ?auto_130213 ) ) ( not ( = ?auto_130216 ?auto_130212 ) ) ( not ( = ?auto_130214 ?auto_130217 ) ) ( not ( = ?auto_130214 ?auto_130215 ) ) ( not ( = ?auto_130214 ?auto_130213 ) ) ( not ( = ?auto_130214 ?auto_130212 ) ) ( not ( = ?auto_130217 ?auto_130215 ) ) ( not ( = ?auto_130217 ?auto_130213 ) ) ( not ( = ?auto_130217 ?auto_130212 ) ) ( not ( = ?auto_130210 ?auto_130216 ) ) ( not ( = ?auto_130210 ?auto_130214 ) ) ( not ( = ?auto_130210 ?auto_130217 ) ) ( not ( = ?auto_130211 ?auto_130216 ) ) ( not ( = ?auto_130211 ?auto_130214 ) ) ( not ( = ?auto_130211 ?auto_130217 ) ) ( ON ?auto_130211 ?auto_130212 ) ( CLEAR ?auto_130211 ) ( HOLDING ?auto_130210 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_130210 )
      ( MAKE-4PILE ?auto_130210 ?auto_130211 ?auto_130212 ?auto_130213 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130218 - BLOCK
      ?auto_130219 - BLOCK
      ?auto_130220 - BLOCK
      ?auto_130221 - BLOCK
    )
    :vars
    (
      ?auto_130224 - BLOCK
      ?auto_130222 - BLOCK
      ?auto_130223 - BLOCK
      ?auto_130225 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130218 ?auto_130219 ) ) ( not ( = ?auto_130218 ?auto_130220 ) ) ( not ( = ?auto_130218 ?auto_130221 ) ) ( not ( = ?auto_130219 ?auto_130220 ) ) ( not ( = ?auto_130219 ?auto_130221 ) ) ( not ( = ?auto_130220 ?auto_130221 ) ) ( ON ?auto_130221 ?auto_130224 ) ( not ( = ?auto_130218 ?auto_130224 ) ) ( not ( = ?auto_130219 ?auto_130224 ) ) ( not ( = ?auto_130220 ?auto_130224 ) ) ( not ( = ?auto_130221 ?auto_130224 ) ) ( ON ?auto_130220 ?auto_130221 ) ( ON-TABLE ?auto_130222 ) ( ON ?auto_130223 ?auto_130222 ) ( ON ?auto_130225 ?auto_130223 ) ( ON ?auto_130224 ?auto_130225 ) ( not ( = ?auto_130222 ?auto_130223 ) ) ( not ( = ?auto_130222 ?auto_130225 ) ) ( not ( = ?auto_130222 ?auto_130224 ) ) ( not ( = ?auto_130222 ?auto_130221 ) ) ( not ( = ?auto_130222 ?auto_130220 ) ) ( not ( = ?auto_130223 ?auto_130225 ) ) ( not ( = ?auto_130223 ?auto_130224 ) ) ( not ( = ?auto_130223 ?auto_130221 ) ) ( not ( = ?auto_130223 ?auto_130220 ) ) ( not ( = ?auto_130225 ?auto_130224 ) ) ( not ( = ?auto_130225 ?auto_130221 ) ) ( not ( = ?auto_130225 ?auto_130220 ) ) ( not ( = ?auto_130218 ?auto_130222 ) ) ( not ( = ?auto_130218 ?auto_130223 ) ) ( not ( = ?auto_130218 ?auto_130225 ) ) ( not ( = ?auto_130219 ?auto_130222 ) ) ( not ( = ?auto_130219 ?auto_130223 ) ) ( not ( = ?auto_130219 ?auto_130225 ) ) ( ON ?auto_130219 ?auto_130220 ) ( ON ?auto_130218 ?auto_130219 ) ( CLEAR ?auto_130218 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_130222 ?auto_130223 ?auto_130225 ?auto_130224 ?auto_130221 ?auto_130220 ?auto_130219 )
      ( MAKE-4PILE ?auto_130218 ?auto_130219 ?auto_130220 ?auto_130221 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_130229 - BLOCK
      ?auto_130230 - BLOCK
      ?auto_130231 - BLOCK
    )
    :vars
    (
      ?auto_130232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130232 ?auto_130231 ) ( CLEAR ?auto_130232 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_130229 ) ( ON ?auto_130230 ?auto_130229 ) ( ON ?auto_130231 ?auto_130230 ) ( not ( = ?auto_130229 ?auto_130230 ) ) ( not ( = ?auto_130229 ?auto_130231 ) ) ( not ( = ?auto_130229 ?auto_130232 ) ) ( not ( = ?auto_130230 ?auto_130231 ) ) ( not ( = ?auto_130230 ?auto_130232 ) ) ( not ( = ?auto_130231 ?auto_130232 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_130232 ?auto_130231 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_130233 - BLOCK
      ?auto_130234 - BLOCK
      ?auto_130235 - BLOCK
    )
    :vars
    (
      ?auto_130236 - BLOCK
      ?auto_130237 - BLOCK
      ?auto_130238 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130236 ?auto_130235 ) ( CLEAR ?auto_130236 ) ( ON-TABLE ?auto_130233 ) ( ON ?auto_130234 ?auto_130233 ) ( ON ?auto_130235 ?auto_130234 ) ( not ( = ?auto_130233 ?auto_130234 ) ) ( not ( = ?auto_130233 ?auto_130235 ) ) ( not ( = ?auto_130233 ?auto_130236 ) ) ( not ( = ?auto_130234 ?auto_130235 ) ) ( not ( = ?auto_130234 ?auto_130236 ) ) ( not ( = ?auto_130235 ?auto_130236 ) ) ( HOLDING ?auto_130237 ) ( CLEAR ?auto_130238 ) ( not ( = ?auto_130233 ?auto_130237 ) ) ( not ( = ?auto_130233 ?auto_130238 ) ) ( not ( = ?auto_130234 ?auto_130237 ) ) ( not ( = ?auto_130234 ?auto_130238 ) ) ( not ( = ?auto_130235 ?auto_130237 ) ) ( not ( = ?auto_130235 ?auto_130238 ) ) ( not ( = ?auto_130236 ?auto_130237 ) ) ( not ( = ?auto_130236 ?auto_130238 ) ) ( not ( = ?auto_130237 ?auto_130238 ) ) )
    :subtasks
    ( ( !STACK ?auto_130237 ?auto_130238 )
      ( MAKE-3PILE ?auto_130233 ?auto_130234 ?auto_130235 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_130239 - BLOCK
      ?auto_130240 - BLOCK
      ?auto_130241 - BLOCK
    )
    :vars
    (
      ?auto_130244 - BLOCK
      ?auto_130243 - BLOCK
      ?auto_130242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130244 ?auto_130241 ) ( ON-TABLE ?auto_130239 ) ( ON ?auto_130240 ?auto_130239 ) ( ON ?auto_130241 ?auto_130240 ) ( not ( = ?auto_130239 ?auto_130240 ) ) ( not ( = ?auto_130239 ?auto_130241 ) ) ( not ( = ?auto_130239 ?auto_130244 ) ) ( not ( = ?auto_130240 ?auto_130241 ) ) ( not ( = ?auto_130240 ?auto_130244 ) ) ( not ( = ?auto_130241 ?auto_130244 ) ) ( CLEAR ?auto_130243 ) ( not ( = ?auto_130239 ?auto_130242 ) ) ( not ( = ?auto_130239 ?auto_130243 ) ) ( not ( = ?auto_130240 ?auto_130242 ) ) ( not ( = ?auto_130240 ?auto_130243 ) ) ( not ( = ?auto_130241 ?auto_130242 ) ) ( not ( = ?auto_130241 ?auto_130243 ) ) ( not ( = ?auto_130244 ?auto_130242 ) ) ( not ( = ?auto_130244 ?auto_130243 ) ) ( not ( = ?auto_130242 ?auto_130243 ) ) ( ON ?auto_130242 ?auto_130244 ) ( CLEAR ?auto_130242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_130239 ?auto_130240 ?auto_130241 ?auto_130244 )
      ( MAKE-3PILE ?auto_130239 ?auto_130240 ?auto_130241 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_130245 - BLOCK
      ?auto_130246 - BLOCK
      ?auto_130247 - BLOCK
    )
    :vars
    (
      ?auto_130248 - BLOCK
      ?auto_130249 - BLOCK
      ?auto_130250 - BLOCK
      ?auto_130251 - BLOCK
      ?auto_130252 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130248 ?auto_130247 ) ( ON-TABLE ?auto_130245 ) ( ON ?auto_130246 ?auto_130245 ) ( ON ?auto_130247 ?auto_130246 ) ( not ( = ?auto_130245 ?auto_130246 ) ) ( not ( = ?auto_130245 ?auto_130247 ) ) ( not ( = ?auto_130245 ?auto_130248 ) ) ( not ( = ?auto_130246 ?auto_130247 ) ) ( not ( = ?auto_130246 ?auto_130248 ) ) ( not ( = ?auto_130247 ?auto_130248 ) ) ( not ( = ?auto_130245 ?auto_130249 ) ) ( not ( = ?auto_130245 ?auto_130250 ) ) ( not ( = ?auto_130246 ?auto_130249 ) ) ( not ( = ?auto_130246 ?auto_130250 ) ) ( not ( = ?auto_130247 ?auto_130249 ) ) ( not ( = ?auto_130247 ?auto_130250 ) ) ( not ( = ?auto_130248 ?auto_130249 ) ) ( not ( = ?auto_130248 ?auto_130250 ) ) ( not ( = ?auto_130249 ?auto_130250 ) ) ( ON ?auto_130249 ?auto_130248 ) ( CLEAR ?auto_130249 ) ( HOLDING ?auto_130250 ) ( CLEAR ?auto_130251 ) ( ON-TABLE ?auto_130252 ) ( ON ?auto_130251 ?auto_130252 ) ( not ( = ?auto_130252 ?auto_130251 ) ) ( not ( = ?auto_130252 ?auto_130250 ) ) ( not ( = ?auto_130251 ?auto_130250 ) ) ( not ( = ?auto_130245 ?auto_130251 ) ) ( not ( = ?auto_130245 ?auto_130252 ) ) ( not ( = ?auto_130246 ?auto_130251 ) ) ( not ( = ?auto_130246 ?auto_130252 ) ) ( not ( = ?auto_130247 ?auto_130251 ) ) ( not ( = ?auto_130247 ?auto_130252 ) ) ( not ( = ?auto_130248 ?auto_130251 ) ) ( not ( = ?auto_130248 ?auto_130252 ) ) ( not ( = ?auto_130249 ?auto_130251 ) ) ( not ( = ?auto_130249 ?auto_130252 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_130252 ?auto_130251 ?auto_130250 )
      ( MAKE-3PILE ?auto_130245 ?auto_130246 ?auto_130247 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_130253 - BLOCK
      ?auto_130254 - BLOCK
      ?auto_130255 - BLOCK
    )
    :vars
    (
      ?auto_130258 - BLOCK
      ?auto_130257 - BLOCK
      ?auto_130256 - BLOCK
      ?auto_130260 - BLOCK
      ?auto_130259 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130258 ?auto_130255 ) ( ON-TABLE ?auto_130253 ) ( ON ?auto_130254 ?auto_130253 ) ( ON ?auto_130255 ?auto_130254 ) ( not ( = ?auto_130253 ?auto_130254 ) ) ( not ( = ?auto_130253 ?auto_130255 ) ) ( not ( = ?auto_130253 ?auto_130258 ) ) ( not ( = ?auto_130254 ?auto_130255 ) ) ( not ( = ?auto_130254 ?auto_130258 ) ) ( not ( = ?auto_130255 ?auto_130258 ) ) ( not ( = ?auto_130253 ?auto_130257 ) ) ( not ( = ?auto_130253 ?auto_130256 ) ) ( not ( = ?auto_130254 ?auto_130257 ) ) ( not ( = ?auto_130254 ?auto_130256 ) ) ( not ( = ?auto_130255 ?auto_130257 ) ) ( not ( = ?auto_130255 ?auto_130256 ) ) ( not ( = ?auto_130258 ?auto_130257 ) ) ( not ( = ?auto_130258 ?auto_130256 ) ) ( not ( = ?auto_130257 ?auto_130256 ) ) ( ON ?auto_130257 ?auto_130258 ) ( CLEAR ?auto_130260 ) ( ON-TABLE ?auto_130259 ) ( ON ?auto_130260 ?auto_130259 ) ( not ( = ?auto_130259 ?auto_130260 ) ) ( not ( = ?auto_130259 ?auto_130256 ) ) ( not ( = ?auto_130260 ?auto_130256 ) ) ( not ( = ?auto_130253 ?auto_130260 ) ) ( not ( = ?auto_130253 ?auto_130259 ) ) ( not ( = ?auto_130254 ?auto_130260 ) ) ( not ( = ?auto_130254 ?auto_130259 ) ) ( not ( = ?auto_130255 ?auto_130260 ) ) ( not ( = ?auto_130255 ?auto_130259 ) ) ( not ( = ?auto_130258 ?auto_130260 ) ) ( not ( = ?auto_130258 ?auto_130259 ) ) ( not ( = ?auto_130257 ?auto_130260 ) ) ( not ( = ?auto_130257 ?auto_130259 ) ) ( ON ?auto_130256 ?auto_130257 ) ( CLEAR ?auto_130256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_130253 ?auto_130254 ?auto_130255 ?auto_130258 ?auto_130257 )
      ( MAKE-3PILE ?auto_130253 ?auto_130254 ?auto_130255 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_130261 - BLOCK
      ?auto_130262 - BLOCK
      ?auto_130263 - BLOCK
    )
    :vars
    (
      ?auto_130267 - BLOCK
      ?auto_130266 - BLOCK
      ?auto_130265 - BLOCK
      ?auto_130264 - BLOCK
      ?auto_130268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130267 ?auto_130263 ) ( ON-TABLE ?auto_130261 ) ( ON ?auto_130262 ?auto_130261 ) ( ON ?auto_130263 ?auto_130262 ) ( not ( = ?auto_130261 ?auto_130262 ) ) ( not ( = ?auto_130261 ?auto_130263 ) ) ( not ( = ?auto_130261 ?auto_130267 ) ) ( not ( = ?auto_130262 ?auto_130263 ) ) ( not ( = ?auto_130262 ?auto_130267 ) ) ( not ( = ?auto_130263 ?auto_130267 ) ) ( not ( = ?auto_130261 ?auto_130266 ) ) ( not ( = ?auto_130261 ?auto_130265 ) ) ( not ( = ?auto_130262 ?auto_130266 ) ) ( not ( = ?auto_130262 ?auto_130265 ) ) ( not ( = ?auto_130263 ?auto_130266 ) ) ( not ( = ?auto_130263 ?auto_130265 ) ) ( not ( = ?auto_130267 ?auto_130266 ) ) ( not ( = ?auto_130267 ?auto_130265 ) ) ( not ( = ?auto_130266 ?auto_130265 ) ) ( ON ?auto_130266 ?auto_130267 ) ( ON-TABLE ?auto_130264 ) ( not ( = ?auto_130264 ?auto_130268 ) ) ( not ( = ?auto_130264 ?auto_130265 ) ) ( not ( = ?auto_130268 ?auto_130265 ) ) ( not ( = ?auto_130261 ?auto_130268 ) ) ( not ( = ?auto_130261 ?auto_130264 ) ) ( not ( = ?auto_130262 ?auto_130268 ) ) ( not ( = ?auto_130262 ?auto_130264 ) ) ( not ( = ?auto_130263 ?auto_130268 ) ) ( not ( = ?auto_130263 ?auto_130264 ) ) ( not ( = ?auto_130267 ?auto_130268 ) ) ( not ( = ?auto_130267 ?auto_130264 ) ) ( not ( = ?auto_130266 ?auto_130268 ) ) ( not ( = ?auto_130266 ?auto_130264 ) ) ( ON ?auto_130265 ?auto_130266 ) ( CLEAR ?auto_130265 ) ( HOLDING ?auto_130268 ) ( CLEAR ?auto_130264 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_130264 ?auto_130268 )
      ( MAKE-3PILE ?auto_130261 ?auto_130262 ?auto_130263 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_130269 - BLOCK
      ?auto_130270 - BLOCK
      ?auto_130271 - BLOCK
    )
    :vars
    (
      ?auto_130272 - BLOCK
      ?auto_130275 - BLOCK
      ?auto_130274 - BLOCK
      ?auto_130276 - BLOCK
      ?auto_130273 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130272 ?auto_130271 ) ( ON-TABLE ?auto_130269 ) ( ON ?auto_130270 ?auto_130269 ) ( ON ?auto_130271 ?auto_130270 ) ( not ( = ?auto_130269 ?auto_130270 ) ) ( not ( = ?auto_130269 ?auto_130271 ) ) ( not ( = ?auto_130269 ?auto_130272 ) ) ( not ( = ?auto_130270 ?auto_130271 ) ) ( not ( = ?auto_130270 ?auto_130272 ) ) ( not ( = ?auto_130271 ?auto_130272 ) ) ( not ( = ?auto_130269 ?auto_130275 ) ) ( not ( = ?auto_130269 ?auto_130274 ) ) ( not ( = ?auto_130270 ?auto_130275 ) ) ( not ( = ?auto_130270 ?auto_130274 ) ) ( not ( = ?auto_130271 ?auto_130275 ) ) ( not ( = ?auto_130271 ?auto_130274 ) ) ( not ( = ?auto_130272 ?auto_130275 ) ) ( not ( = ?auto_130272 ?auto_130274 ) ) ( not ( = ?auto_130275 ?auto_130274 ) ) ( ON ?auto_130275 ?auto_130272 ) ( ON-TABLE ?auto_130276 ) ( not ( = ?auto_130276 ?auto_130273 ) ) ( not ( = ?auto_130276 ?auto_130274 ) ) ( not ( = ?auto_130273 ?auto_130274 ) ) ( not ( = ?auto_130269 ?auto_130273 ) ) ( not ( = ?auto_130269 ?auto_130276 ) ) ( not ( = ?auto_130270 ?auto_130273 ) ) ( not ( = ?auto_130270 ?auto_130276 ) ) ( not ( = ?auto_130271 ?auto_130273 ) ) ( not ( = ?auto_130271 ?auto_130276 ) ) ( not ( = ?auto_130272 ?auto_130273 ) ) ( not ( = ?auto_130272 ?auto_130276 ) ) ( not ( = ?auto_130275 ?auto_130273 ) ) ( not ( = ?auto_130275 ?auto_130276 ) ) ( ON ?auto_130274 ?auto_130275 ) ( CLEAR ?auto_130276 ) ( ON ?auto_130273 ?auto_130274 ) ( CLEAR ?auto_130273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_130269 ?auto_130270 ?auto_130271 ?auto_130272 ?auto_130275 ?auto_130274 )
      ( MAKE-3PILE ?auto_130269 ?auto_130270 ?auto_130271 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_130277 - BLOCK
      ?auto_130278 - BLOCK
      ?auto_130279 - BLOCK
    )
    :vars
    (
      ?auto_130280 - BLOCK
      ?auto_130283 - BLOCK
      ?auto_130282 - BLOCK
      ?auto_130284 - BLOCK
      ?auto_130281 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130280 ?auto_130279 ) ( ON-TABLE ?auto_130277 ) ( ON ?auto_130278 ?auto_130277 ) ( ON ?auto_130279 ?auto_130278 ) ( not ( = ?auto_130277 ?auto_130278 ) ) ( not ( = ?auto_130277 ?auto_130279 ) ) ( not ( = ?auto_130277 ?auto_130280 ) ) ( not ( = ?auto_130278 ?auto_130279 ) ) ( not ( = ?auto_130278 ?auto_130280 ) ) ( not ( = ?auto_130279 ?auto_130280 ) ) ( not ( = ?auto_130277 ?auto_130283 ) ) ( not ( = ?auto_130277 ?auto_130282 ) ) ( not ( = ?auto_130278 ?auto_130283 ) ) ( not ( = ?auto_130278 ?auto_130282 ) ) ( not ( = ?auto_130279 ?auto_130283 ) ) ( not ( = ?auto_130279 ?auto_130282 ) ) ( not ( = ?auto_130280 ?auto_130283 ) ) ( not ( = ?auto_130280 ?auto_130282 ) ) ( not ( = ?auto_130283 ?auto_130282 ) ) ( ON ?auto_130283 ?auto_130280 ) ( not ( = ?auto_130284 ?auto_130281 ) ) ( not ( = ?auto_130284 ?auto_130282 ) ) ( not ( = ?auto_130281 ?auto_130282 ) ) ( not ( = ?auto_130277 ?auto_130281 ) ) ( not ( = ?auto_130277 ?auto_130284 ) ) ( not ( = ?auto_130278 ?auto_130281 ) ) ( not ( = ?auto_130278 ?auto_130284 ) ) ( not ( = ?auto_130279 ?auto_130281 ) ) ( not ( = ?auto_130279 ?auto_130284 ) ) ( not ( = ?auto_130280 ?auto_130281 ) ) ( not ( = ?auto_130280 ?auto_130284 ) ) ( not ( = ?auto_130283 ?auto_130281 ) ) ( not ( = ?auto_130283 ?auto_130284 ) ) ( ON ?auto_130282 ?auto_130283 ) ( ON ?auto_130281 ?auto_130282 ) ( CLEAR ?auto_130281 ) ( HOLDING ?auto_130284 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_130284 )
      ( MAKE-3PILE ?auto_130277 ?auto_130278 ?auto_130279 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_130285 - BLOCK
      ?auto_130286 - BLOCK
      ?auto_130287 - BLOCK
    )
    :vars
    (
      ?auto_130288 - BLOCK
      ?auto_130292 - BLOCK
      ?auto_130291 - BLOCK
      ?auto_130289 - BLOCK
      ?auto_130290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130288 ?auto_130287 ) ( ON-TABLE ?auto_130285 ) ( ON ?auto_130286 ?auto_130285 ) ( ON ?auto_130287 ?auto_130286 ) ( not ( = ?auto_130285 ?auto_130286 ) ) ( not ( = ?auto_130285 ?auto_130287 ) ) ( not ( = ?auto_130285 ?auto_130288 ) ) ( not ( = ?auto_130286 ?auto_130287 ) ) ( not ( = ?auto_130286 ?auto_130288 ) ) ( not ( = ?auto_130287 ?auto_130288 ) ) ( not ( = ?auto_130285 ?auto_130292 ) ) ( not ( = ?auto_130285 ?auto_130291 ) ) ( not ( = ?auto_130286 ?auto_130292 ) ) ( not ( = ?auto_130286 ?auto_130291 ) ) ( not ( = ?auto_130287 ?auto_130292 ) ) ( not ( = ?auto_130287 ?auto_130291 ) ) ( not ( = ?auto_130288 ?auto_130292 ) ) ( not ( = ?auto_130288 ?auto_130291 ) ) ( not ( = ?auto_130292 ?auto_130291 ) ) ( ON ?auto_130292 ?auto_130288 ) ( not ( = ?auto_130289 ?auto_130290 ) ) ( not ( = ?auto_130289 ?auto_130291 ) ) ( not ( = ?auto_130290 ?auto_130291 ) ) ( not ( = ?auto_130285 ?auto_130290 ) ) ( not ( = ?auto_130285 ?auto_130289 ) ) ( not ( = ?auto_130286 ?auto_130290 ) ) ( not ( = ?auto_130286 ?auto_130289 ) ) ( not ( = ?auto_130287 ?auto_130290 ) ) ( not ( = ?auto_130287 ?auto_130289 ) ) ( not ( = ?auto_130288 ?auto_130290 ) ) ( not ( = ?auto_130288 ?auto_130289 ) ) ( not ( = ?auto_130292 ?auto_130290 ) ) ( not ( = ?auto_130292 ?auto_130289 ) ) ( ON ?auto_130291 ?auto_130292 ) ( ON ?auto_130290 ?auto_130291 ) ( ON ?auto_130289 ?auto_130290 ) ( CLEAR ?auto_130289 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_130285 ?auto_130286 ?auto_130287 ?auto_130288 ?auto_130292 ?auto_130291 ?auto_130290 )
      ( MAKE-3PILE ?auto_130285 ?auto_130286 ?auto_130287 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_130298 - BLOCK
      ?auto_130299 - BLOCK
      ?auto_130300 - BLOCK
      ?auto_130301 - BLOCK
      ?auto_130302 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_130302 ) ( CLEAR ?auto_130301 ) ( ON-TABLE ?auto_130298 ) ( ON ?auto_130299 ?auto_130298 ) ( ON ?auto_130300 ?auto_130299 ) ( ON ?auto_130301 ?auto_130300 ) ( not ( = ?auto_130298 ?auto_130299 ) ) ( not ( = ?auto_130298 ?auto_130300 ) ) ( not ( = ?auto_130298 ?auto_130301 ) ) ( not ( = ?auto_130298 ?auto_130302 ) ) ( not ( = ?auto_130299 ?auto_130300 ) ) ( not ( = ?auto_130299 ?auto_130301 ) ) ( not ( = ?auto_130299 ?auto_130302 ) ) ( not ( = ?auto_130300 ?auto_130301 ) ) ( not ( = ?auto_130300 ?auto_130302 ) ) ( not ( = ?auto_130301 ?auto_130302 ) ) )
    :subtasks
    ( ( !STACK ?auto_130302 ?auto_130301 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_130303 - BLOCK
      ?auto_130304 - BLOCK
      ?auto_130305 - BLOCK
      ?auto_130306 - BLOCK
      ?auto_130307 - BLOCK
    )
    :vars
    (
      ?auto_130308 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_130306 ) ( ON-TABLE ?auto_130303 ) ( ON ?auto_130304 ?auto_130303 ) ( ON ?auto_130305 ?auto_130304 ) ( ON ?auto_130306 ?auto_130305 ) ( not ( = ?auto_130303 ?auto_130304 ) ) ( not ( = ?auto_130303 ?auto_130305 ) ) ( not ( = ?auto_130303 ?auto_130306 ) ) ( not ( = ?auto_130303 ?auto_130307 ) ) ( not ( = ?auto_130304 ?auto_130305 ) ) ( not ( = ?auto_130304 ?auto_130306 ) ) ( not ( = ?auto_130304 ?auto_130307 ) ) ( not ( = ?auto_130305 ?auto_130306 ) ) ( not ( = ?auto_130305 ?auto_130307 ) ) ( not ( = ?auto_130306 ?auto_130307 ) ) ( ON ?auto_130307 ?auto_130308 ) ( CLEAR ?auto_130307 ) ( HAND-EMPTY ) ( not ( = ?auto_130303 ?auto_130308 ) ) ( not ( = ?auto_130304 ?auto_130308 ) ) ( not ( = ?auto_130305 ?auto_130308 ) ) ( not ( = ?auto_130306 ?auto_130308 ) ) ( not ( = ?auto_130307 ?auto_130308 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_130307 ?auto_130308 )
      ( MAKE-5PILE ?auto_130303 ?auto_130304 ?auto_130305 ?auto_130306 ?auto_130307 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_130309 - BLOCK
      ?auto_130310 - BLOCK
      ?auto_130311 - BLOCK
      ?auto_130312 - BLOCK
      ?auto_130313 - BLOCK
    )
    :vars
    (
      ?auto_130314 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130309 ) ( ON ?auto_130310 ?auto_130309 ) ( ON ?auto_130311 ?auto_130310 ) ( not ( = ?auto_130309 ?auto_130310 ) ) ( not ( = ?auto_130309 ?auto_130311 ) ) ( not ( = ?auto_130309 ?auto_130312 ) ) ( not ( = ?auto_130309 ?auto_130313 ) ) ( not ( = ?auto_130310 ?auto_130311 ) ) ( not ( = ?auto_130310 ?auto_130312 ) ) ( not ( = ?auto_130310 ?auto_130313 ) ) ( not ( = ?auto_130311 ?auto_130312 ) ) ( not ( = ?auto_130311 ?auto_130313 ) ) ( not ( = ?auto_130312 ?auto_130313 ) ) ( ON ?auto_130313 ?auto_130314 ) ( CLEAR ?auto_130313 ) ( not ( = ?auto_130309 ?auto_130314 ) ) ( not ( = ?auto_130310 ?auto_130314 ) ) ( not ( = ?auto_130311 ?auto_130314 ) ) ( not ( = ?auto_130312 ?auto_130314 ) ) ( not ( = ?auto_130313 ?auto_130314 ) ) ( HOLDING ?auto_130312 ) ( CLEAR ?auto_130311 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_130309 ?auto_130310 ?auto_130311 ?auto_130312 )
      ( MAKE-5PILE ?auto_130309 ?auto_130310 ?auto_130311 ?auto_130312 ?auto_130313 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_130315 - BLOCK
      ?auto_130316 - BLOCK
      ?auto_130317 - BLOCK
      ?auto_130318 - BLOCK
      ?auto_130319 - BLOCK
    )
    :vars
    (
      ?auto_130320 - BLOCK
      ?auto_130322 - BLOCK
      ?auto_130321 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130315 ) ( ON ?auto_130316 ?auto_130315 ) ( ON ?auto_130317 ?auto_130316 ) ( not ( = ?auto_130315 ?auto_130316 ) ) ( not ( = ?auto_130315 ?auto_130317 ) ) ( not ( = ?auto_130315 ?auto_130318 ) ) ( not ( = ?auto_130315 ?auto_130319 ) ) ( not ( = ?auto_130316 ?auto_130317 ) ) ( not ( = ?auto_130316 ?auto_130318 ) ) ( not ( = ?auto_130316 ?auto_130319 ) ) ( not ( = ?auto_130317 ?auto_130318 ) ) ( not ( = ?auto_130317 ?auto_130319 ) ) ( not ( = ?auto_130318 ?auto_130319 ) ) ( ON ?auto_130319 ?auto_130320 ) ( not ( = ?auto_130315 ?auto_130320 ) ) ( not ( = ?auto_130316 ?auto_130320 ) ) ( not ( = ?auto_130317 ?auto_130320 ) ) ( not ( = ?auto_130318 ?auto_130320 ) ) ( not ( = ?auto_130319 ?auto_130320 ) ) ( CLEAR ?auto_130317 ) ( ON ?auto_130318 ?auto_130319 ) ( CLEAR ?auto_130318 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_130322 ) ( ON ?auto_130321 ?auto_130322 ) ( ON ?auto_130320 ?auto_130321 ) ( not ( = ?auto_130322 ?auto_130321 ) ) ( not ( = ?auto_130322 ?auto_130320 ) ) ( not ( = ?auto_130322 ?auto_130319 ) ) ( not ( = ?auto_130322 ?auto_130318 ) ) ( not ( = ?auto_130321 ?auto_130320 ) ) ( not ( = ?auto_130321 ?auto_130319 ) ) ( not ( = ?auto_130321 ?auto_130318 ) ) ( not ( = ?auto_130315 ?auto_130322 ) ) ( not ( = ?auto_130315 ?auto_130321 ) ) ( not ( = ?auto_130316 ?auto_130322 ) ) ( not ( = ?auto_130316 ?auto_130321 ) ) ( not ( = ?auto_130317 ?auto_130322 ) ) ( not ( = ?auto_130317 ?auto_130321 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_130322 ?auto_130321 ?auto_130320 ?auto_130319 )
      ( MAKE-5PILE ?auto_130315 ?auto_130316 ?auto_130317 ?auto_130318 ?auto_130319 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_130323 - BLOCK
      ?auto_130324 - BLOCK
      ?auto_130325 - BLOCK
      ?auto_130326 - BLOCK
      ?auto_130327 - BLOCK
    )
    :vars
    (
      ?auto_130328 - BLOCK
      ?auto_130330 - BLOCK
      ?auto_130329 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130323 ) ( ON ?auto_130324 ?auto_130323 ) ( not ( = ?auto_130323 ?auto_130324 ) ) ( not ( = ?auto_130323 ?auto_130325 ) ) ( not ( = ?auto_130323 ?auto_130326 ) ) ( not ( = ?auto_130323 ?auto_130327 ) ) ( not ( = ?auto_130324 ?auto_130325 ) ) ( not ( = ?auto_130324 ?auto_130326 ) ) ( not ( = ?auto_130324 ?auto_130327 ) ) ( not ( = ?auto_130325 ?auto_130326 ) ) ( not ( = ?auto_130325 ?auto_130327 ) ) ( not ( = ?auto_130326 ?auto_130327 ) ) ( ON ?auto_130327 ?auto_130328 ) ( not ( = ?auto_130323 ?auto_130328 ) ) ( not ( = ?auto_130324 ?auto_130328 ) ) ( not ( = ?auto_130325 ?auto_130328 ) ) ( not ( = ?auto_130326 ?auto_130328 ) ) ( not ( = ?auto_130327 ?auto_130328 ) ) ( ON ?auto_130326 ?auto_130327 ) ( CLEAR ?auto_130326 ) ( ON-TABLE ?auto_130330 ) ( ON ?auto_130329 ?auto_130330 ) ( ON ?auto_130328 ?auto_130329 ) ( not ( = ?auto_130330 ?auto_130329 ) ) ( not ( = ?auto_130330 ?auto_130328 ) ) ( not ( = ?auto_130330 ?auto_130327 ) ) ( not ( = ?auto_130330 ?auto_130326 ) ) ( not ( = ?auto_130329 ?auto_130328 ) ) ( not ( = ?auto_130329 ?auto_130327 ) ) ( not ( = ?auto_130329 ?auto_130326 ) ) ( not ( = ?auto_130323 ?auto_130330 ) ) ( not ( = ?auto_130323 ?auto_130329 ) ) ( not ( = ?auto_130324 ?auto_130330 ) ) ( not ( = ?auto_130324 ?auto_130329 ) ) ( not ( = ?auto_130325 ?auto_130330 ) ) ( not ( = ?auto_130325 ?auto_130329 ) ) ( HOLDING ?auto_130325 ) ( CLEAR ?auto_130324 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_130323 ?auto_130324 ?auto_130325 )
      ( MAKE-5PILE ?auto_130323 ?auto_130324 ?auto_130325 ?auto_130326 ?auto_130327 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_130331 - BLOCK
      ?auto_130332 - BLOCK
      ?auto_130333 - BLOCK
      ?auto_130334 - BLOCK
      ?auto_130335 - BLOCK
    )
    :vars
    (
      ?auto_130338 - BLOCK
      ?auto_130337 - BLOCK
      ?auto_130336 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130331 ) ( ON ?auto_130332 ?auto_130331 ) ( not ( = ?auto_130331 ?auto_130332 ) ) ( not ( = ?auto_130331 ?auto_130333 ) ) ( not ( = ?auto_130331 ?auto_130334 ) ) ( not ( = ?auto_130331 ?auto_130335 ) ) ( not ( = ?auto_130332 ?auto_130333 ) ) ( not ( = ?auto_130332 ?auto_130334 ) ) ( not ( = ?auto_130332 ?auto_130335 ) ) ( not ( = ?auto_130333 ?auto_130334 ) ) ( not ( = ?auto_130333 ?auto_130335 ) ) ( not ( = ?auto_130334 ?auto_130335 ) ) ( ON ?auto_130335 ?auto_130338 ) ( not ( = ?auto_130331 ?auto_130338 ) ) ( not ( = ?auto_130332 ?auto_130338 ) ) ( not ( = ?auto_130333 ?auto_130338 ) ) ( not ( = ?auto_130334 ?auto_130338 ) ) ( not ( = ?auto_130335 ?auto_130338 ) ) ( ON ?auto_130334 ?auto_130335 ) ( ON-TABLE ?auto_130337 ) ( ON ?auto_130336 ?auto_130337 ) ( ON ?auto_130338 ?auto_130336 ) ( not ( = ?auto_130337 ?auto_130336 ) ) ( not ( = ?auto_130337 ?auto_130338 ) ) ( not ( = ?auto_130337 ?auto_130335 ) ) ( not ( = ?auto_130337 ?auto_130334 ) ) ( not ( = ?auto_130336 ?auto_130338 ) ) ( not ( = ?auto_130336 ?auto_130335 ) ) ( not ( = ?auto_130336 ?auto_130334 ) ) ( not ( = ?auto_130331 ?auto_130337 ) ) ( not ( = ?auto_130331 ?auto_130336 ) ) ( not ( = ?auto_130332 ?auto_130337 ) ) ( not ( = ?auto_130332 ?auto_130336 ) ) ( not ( = ?auto_130333 ?auto_130337 ) ) ( not ( = ?auto_130333 ?auto_130336 ) ) ( CLEAR ?auto_130332 ) ( ON ?auto_130333 ?auto_130334 ) ( CLEAR ?auto_130333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_130337 ?auto_130336 ?auto_130338 ?auto_130335 ?auto_130334 )
      ( MAKE-5PILE ?auto_130331 ?auto_130332 ?auto_130333 ?auto_130334 ?auto_130335 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_130339 - BLOCK
      ?auto_130340 - BLOCK
      ?auto_130341 - BLOCK
      ?auto_130342 - BLOCK
      ?auto_130343 - BLOCK
    )
    :vars
    (
      ?auto_130344 - BLOCK
      ?auto_130346 - BLOCK
      ?auto_130345 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130339 ) ( not ( = ?auto_130339 ?auto_130340 ) ) ( not ( = ?auto_130339 ?auto_130341 ) ) ( not ( = ?auto_130339 ?auto_130342 ) ) ( not ( = ?auto_130339 ?auto_130343 ) ) ( not ( = ?auto_130340 ?auto_130341 ) ) ( not ( = ?auto_130340 ?auto_130342 ) ) ( not ( = ?auto_130340 ?auto_130343 ) ) ( not ( = ?auto_130341 ?auto_130342 ) ) ( not ( = ?auto_130341 ?auto_130343 ) ) ( not ( = ?auto_130342 ?auto_130343 ) ) ( ON ?auto_130343 ?auto_130344 ) ( not ( = ?auto_130339 ?auto_130344 ) ) ( not ( = ?auto_130340 ?auto_130344 ) ) ( not ( = ?auto_130341 ?auto_130344 ) ) ( not ( = ?auto_130342 ?auto_130344 ) ) ( not ( = ?auto_130343 ?auto_130344 ) ) ( ON ?auto_130342 ?auto_130343 ) ( ON-TABLE ?auto_130346 ) ( ON ?auto_130345 ?auto_130346 ) ( ON ?auto_130344 ?auto_130345 ) ( not ( = ?auto_130346 ?auto_130345 ) ) ( not ( = ?auto_130346 ?auto_130344 ) ) ( not ( = ?auto_130346 ?auto_130343 ) ) ( not ( = ?auto_130346 ?auto_130342 ) ) ( not ( = ?auto_130345 ?auto_130344 ) ) ( not ( = ?auto_130345 ?auto_130343 ) ) ( not ( = ?auto_130345 ?auto_130342 ) ) ( not ( = ?auto_130339 ?auto_130346 ) ) ( not ( = ?auto_130339 ?auto_130345 ) ) ( not ( = ?auto_130340 ?auto_130346 ) ) ( not ( = ?auto_130340 ?auto_130345 ) ) ( not ( = ?auto_130341 ?auto_130346 ) ) ( not ( = ?auto_130341 ?auto_130345 ) ) ( ON ?auto_130341 ?auto_130342 ) ( CLEAR ?auto_130341 ) ( HOLDING ?auto_130340 ) ( CLEAR ?auto_130339 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_130339 ?auto_130340 )
      ( MAKE-5PILE ?auto_130339 ?auto_130340 ?auto_130341 ?auto_130342 ?auto_130343 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_130347 - BLOCK
      ?auto_130348 - BLOCK
      ?auto_130349 - BLOCK
      ?auto_130350 - BLOCK
      ?auto_130351 - BLOCK
    )
    :vars
    (
      ?auto_130353 - BLOCK
      ?auto_130352 - BLOCK
      ?auto_130354 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130347 ) ( not ( = ?auto_130347 ?auto_130348 ) ) ( not ( = ?auto_130347 ?auto_130349 ) ) ( not ( = ?auto_130347 ?auto_130350 ) ) ( not ( = ?auto_130347 ?auto_130351 ) ) ( not ( = ?auto_130348 ?auto_130349 ) ) ( not ( = ?auto_130348 ?auto_130350 ) ) ( not ( = ?auto_130348 ?auto_130351 ) ) ( not ( = ?auto_130349 ?auto_130350 ) ) ( not ( = ?auto_130349 ?auto_130351 ) ) ( not ( = ?auto_130350 ?auto_130351 ) ) ( ON ?auto_130351 ?auto_130353 ) ( not ( = ?auto_130347 ?auto_130353 ) ) ( not ( = ?auto_130348 ?auto_130353 ) ) ( not ( = ?auto_130349 ?auto_130353 ) ) ( not ( = ?auto_130350 ?auto_130353 ) ) ( not ( = ?auto_130351 ?auto_130353 ) ) ( ON ?auto_130350 ?auto_130351 ) ( ON-TABLE ?auto_130352 ) ( ON ?auto_130354 ?auto_130352 ) ( ON ?auto_130353 ?auto_130354 ) ( not ( = ?auto_130352 ?auto_130354 ) ) ( not ( = ?auto_130352 ?auto_130353 ) ) ( not ( = ?auto_130352 ?auto_130351 ) ) ( not ( = ?auto_130352 ?auto_130350 ) ) ( not ( = ?auto_130354 ?auto_130353 ) ) ( not ( = ?auto_130354 ?auto_130351 ) ) ( not ( = ?auto_130354 ?auto_130350 ) ) ( not ( = ?auto_130347 ?auto_130352 ) ) ( not ( = ?auto_130347 ?auto_130354 ) ) ( not ( = ?auto_130348 ?auto_130352 ) ) ( not ( = ?auto_130348 ?auto_130354 ) ) ( not ( = ?auto_130349 ?auto_130352 ) ) ( not ( = ?auto_130349 ?auto_130354 ) ) ( ON ?auto_130349 ?auto_130350 ) ( CLEAR ?auto_130347 ) ( ON ?auto_130348 ?auto_130349 ) ( CLEAR ?auto_130348 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_130352 ?auto_130354 ?auto_130353 ?auto_130351 ?auto_130350 ?auto_130349 )
      ( MAKE-5PILE ?auto_130347 ?auto_130348 ?auto_130349 ?auto_130350 ?auto_130351 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_130355 - BLOCK
      ?auto_130356 - BLOCK
      ?auto_130357 - BLOCK
      ?auto_130358 - BLOCK
      ?auto_130359 - BLOCK
    )
    :vars
    (
      ?auto_130362 - BLOCK
      ?auto_130361 - BLOCK
      ?auto_130360 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130355 ?auto_130356 ) ) ( not ( = ?auto_130355 ?auto_130357 ) ) ( not ( = ?auto_130355 ?auto_130358 ) ) ( not ( = ?auto_130355 ?auto_130359 ) ) ( not ( = ?auto_130356 ?auto_130357 ) ) ( not ( = ?auto_130356 ?auto_130358 ) ) ( not ( = ?auto_130356 ?auto_130359 ) ) ( not ( = ?auto_130357 ?auto_130358 ) ) ( not ( = ?auto_130357 ?auto_130359 ) ) ( not ( = ?auto_130358 ?auto_130359 ) ) ( ON ?auto_130359 ?auto_130362 ) ( not ( = ?auto_130355 ?auto_130362 ) ) ( not ( = ?auto_130356 ?auto_130362 ) ) ( not ( = ?auto_130357 ?auto_130362 ) ) ( not ( = ?auto_130358 ?auto_130362 ) ) ( not ( = ?auto_130359 ?auto_130362 ) ) ( ON ?auto_130358 ?auto_130359 ) ( ON-TABLE ?auto_130361 ) ( ON ?auto_130360 ?auto_130361 ) ( ON ?auto_130362 ?auto_130360 ) ( not ( = ?auto_130361 ?auto_130360 ) ) ( not ( = ?auto_130361 ?auto_130362 ) ) ( not ( = ?auto_130361 ?auto_130359 ) ) ( not ( = ?auto_130361 ?auto_130358 ) ) ( not ( = ?auto_130360 ?auto_130362 ) ) ( not ( = ?auto_130360 ?auto_130359 ) ) ( not ( = ?auto_130360 ?auto_130358 ) ) ( not ( = ?auto_130355 ?auto_130361 ) ) ( not ( = ?auto_130355 ?auto_130360 ) ) ( not ( = ?auto_130356 ?auto_130361 ) ) ( not ( = ?auto_130356 ?auto_130360 ) ) ( not ( = ?auto_130357 ?auto_130361 ) ) ( not ( = ?auto_130357 ?auto_130360 ) ) ( ON ?auto_130357 ?auto_130358 ) ( ON ?auto_130356 ?auto_130357 ) ( CLEAR ?auto_130356 ) ( HOLDING ?auto_130355 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_130355 )
      ( MAKE-5PILE ?auto_130355 ?auto_130356 ?auto_130357 ?auto_130358 ?auto_130359 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_130363 - BLOCK
      ?auto_130364 - BLOCK
      ?auto_130365 - BLOCK
      ?auto_130366 - BLOCK
      ?auto_130367 - BLOCK
    )
    :vars
    (
      ?auto_130370 - BLOCK
      ?auto_130369 - BLOCK
      ?auto_130368 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130363 ?auto_130364 ) ) ( not ( = ?auto_130363 ?auto_130365 ) ) ( not ( = ?auto_130363 ?auto_130366 ) ) ( not ( = ?auto_130363 ?auto_130367 ) ) ( not ( = ?auto_130364 ?auto_130365 ) ) ( not ( = ?auto_130364 ?auto_130366 ) ) ( not ( = ?auto_130364 ?auto_130367 ) ) ( not ( = ?auto_130365 ?auto_130366 ) ) ( not ( = ?auto_130365 ?auto_130367 ) ) ( not ( = ?auto_130366 ?auto_130367 ) ) ( ON ?auto_130367 ?auto_130370 ) ( not ( = ?auto_130363 ?auto_130370 ) ) ( not ( = ?auto_130364 ?auto_130370 ) ) ( not ( = ?auto_130365 ?auto_130370 ) ) ( not ( = ?auto_130366 ?auto_130370 ) ) ( not ( = ?auto_130367 ?auto_130370 ) ) ( ON ?auto_130366 ?auto_130367 ) ( ON-TABLE ?auto_130369 ) ( ON ?auto_130368 ?auto_130369 ) ( ON ?auto_130370 ?auto_130368 ) ( not ( = ?auto_130369 ?auto_130368 ) ) ( not ( = ?auto_130369 ?auto_130370 ) ) ( not ( = ?auto_130369 ?auto_130367 ) ) ( not ( = ?auto_130369 ?auto_130366 ) ) ( not ( = ?auto_130368 ?auto_130370 ) ) ( not ( = ?auto_130368 ?auto_130367 ) ) ( not ( = ?auto_130368 ?auto_130366 ) ) ( not ( = ?auto_130363 ?auto_130369 ) ) ( not ( = ?auto_130363 ?auto_130368 ) ) ( not ( = ?auto_130364 ?auto_130369 ) ) ( not ( = ?auto_130364 ?auto_130368 ) ) ( not ( = ?auto_130365 ?auto_130369 ) ) ( not ( = ?auto_130365 ?auto_130368 ) ) ( ON ?auto_130365 ?auto_130366 ) ( ON ?auto_130364 ?auto_130365 ) ( ON ?auto_130363 ?auto_130364 ) ( CLEAR ?auto_130363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_130369 ?auto_130368 ?auto_130370 ?auto_130367 ?auto_130366 ?auto_130365 ?auto_130364 )
      ( MAKE-5PILE ?auto_130363 ?auto_130364 ?auto_130365 ?auto_130366 ?auto_130367 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_130373 - BLOCK
      ?auto_130374 - BLOCK
    )
    :vars
    (
      ?auto_130375 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130375 ?auto_130374 ) ( CLEAR ?auto_130375 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_130373 ) ( ON ?auto_130374 ?auto_130373 ) ( not ( = ?auto_130373 ?auto_130374 ) ) ( not ( = ?auto_130373 ?auto_130375 ) ) ( not ( = ?auto_130374 ?auto_130375 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_130375 ?auto_130374 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_130376 - BLOCK
      ?auto_130377 - BLOCK
    )
    :vars
    (
      ?auto_130378 - BLOCK
      ?auto_130379 - BLOCK
      ?auto_130380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130378 ?auto_130377 ) ( CLEAR ?auto_130378 ) ( ON-TABLE ?auto_130376 ) ( ON ?auto_130377 ?auto_130376 ) ( not ( = ?auto_130376 ?auto_130377 ) ) ( not ( = ?auto_130376 ?auto_130378 ) ) ( not ( = ?auto_130377 ?auto_130378 ) ) ( HOLDING ?auto_130379 ) ( CLEAR ?auto_130380 ) ( not ( = ?auto_130376 ?auto_130379 ) ) ( not ( = ?auto_130376 ?auto_130380 ) ) ( not ( = ?auto_130377 ?auto_130379 ) ) ( not ( = ?auto_130377 ?auto_130380 ) ) ( not ( = ?auto_130378 ?auto_130379 ) ) ( not ( = ?auto_130378 ?auto_130380 ) ) ( not ( = ?auto_130379 ?auto_130380 ) ) )
    :subtasks
    ( ( !STACK ?auto_130379 ?auto_130380 )
      ( MAKE-2PILE ?auto_130376 ?auto_130377 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_130381 - BLOCK
      ?auto_130382 - BLOCK
    )
    :vars
    (
      ?auto_130383 - BLOCK
      ?auto_130384 - BLOCK
      ?auto_130385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130383 ?auto_130382 ) ( ON-TABLE ?auto_130381 ) ( ON ?auto_130382 ?auto_130381 ) ( not ( = ?auto_130381 ?auto_130382 ) ) ( not ( = ?auto_130381 ?auto_130383 ) ) ( not ( = ?auto_130382 ?auto_130383 ) ) ( CLEAR ?auto_130384 ) ( not ( = ?auto_130381 ?auto_130385 ) ) ( not ( = ?auto_130381 ?auto_130384 ) ) ( not ( = ?auto_130382 ?auto_130385 ) ) ( not ( = ?auto_130382 ?auto_130384 ) ) ( not ( = ?auto_130383 ?auto_130385 ) ) ( not ( = ?auto_130383 ?auto_130384 ) ) ( not ( = ?auto_130385 ?auto_130384 ) ) ( ON ?auto_130385 ?auto_130383 ) ( CLEAR ?auto_130385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_130381 ?auto_130382 ?auto_130383 )
      ( MAKE-2PILE ?auto_130381 ?auto_130382 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_130386 - BLOCK
      ?auto_130387 - BLOCK
    )
    :vars
    (
      ?auto_130388 - BLOCK
      ?auto_130389 - BLOCK
      ?auto_130390 - BLOCK
      ?auto_130392 - BLOCK
      ?auto_130391 - BLOCK
      ?auto_130393 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130388 ?auto_130387 ) ( ON-TABLE ?auto_130386 ) ( ON ?auto_130387 ?auto_130386 ) ( not ( = ?auto_130386 ?auto_130387 ) ) ( not ( = ?auto_130386 ?auto_130388 ) ) ( not ( = ?auto_130387 ?auto_130388 ) ) ( not ( = ?auto_130386 ?auto_130389 ) ) ( not ( = ?auto_130386 ?auto_130390 ) ) ( not ( = ?auto_130387 ?auto_130389 ) ) ( not ( = ?auto_130387 ?auto_130390 ) ) ( not ( = ?auto_130388 ?auto_130389 ) ) ( not ( = ?auto_130388 ?auto_130390 ) ) ( not ( = ?auto_130389 ?auto_130390 ) ) ( ON ?auto_130389 ?auto_130388 ) ( CLEAR ?auto_130389 ) ( HOLDING ?auto_130390 ) ( CLEAR ?auto_130392 ) ( ON-TABLE ?auto_130391 ) ( ON ?auto_130393 ?auto_130391 ) ( ON ?auto_130392 ?auto_130393 ) ( not ( = ?auto_130391 ?auto_130393 ) ) ( not ( = ?auto_130391 ?auto_130392 ) ) ( not ( = ?auto_130391 ?auto_130390 ) ) ( not ( = ?auto_130393 ?auto_130392 ) ) ( not ( = ?auto_130393 ?auto_130390 ) ) ( not ( = ?auto_130392 ?auto_130390 ) ) ( not ( = ?auto_130386 ?auto_130392 ) ) ( not ( = ?auto_130386 ?auto_130391 ) ) ( not ( = ?auto_130386 ?auto_130393 ) ) ( not ( = ?auto_130387 ?auto_130392 ) ) ( not ( = ?auto_130387 ?auto_130391 ) ) ( not ( = ?auto_130387 ?auto_130393 ) ) ( not ( = ?auto_130388 ?auto_130392 ) ) ( not ( = ?auto_130388 ?auto_130391 ) ) ( not ( = ?auto_130388 ?auto_130393 ) ) ( not ( = ?auto_130389 ?auto_130392 ) ) ( not ( = ?auto_130389 ?auto_130391 ) ) ( not ( = ?auto_130389 ?auto_130393 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_130391 ?auto_130393 ?auto_130392 ?auto_130390 )
      ( MAKE-2PILE ?auto_130386 ?auto_130387 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_130394 - BLOCK
      ?auto_130395 - BLOCK
    )
    :vars
    (
      ?auto_130398 - BLOCK
      ?auto_130400 - BLOCK
      ?auto_130397 - BLOCK
      ?auto_130399 - BLOCK
      ?auto_130401 - BLOCK
      ?auto_130396 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130398 ?auto_130395 ) ( ON-TABLE ?auto_130394 ) ( ON ?auto_130395 ?auto_130394 ) ( not ( = ?auto_130394 ?auto_130395 ) ) ( not ( = ?auto_130394 ?auto_130398 ) ) ( not ( = ?auto_130395 ?auto_130398 ) ) ( not ( = ?auto_130394 ?auto_130400 ) ) ( not ( = ?auto_130394 ?auto_130397 ) ) ( not ( = ?auto_130395 ?auto_130400 ) ) ( not ( = ?auto_130395 ?auto_130397 ) ) ( not ( = ?auto_130398 ?auto_130400 ) ) ( not ( = ?auto_130398 ?auto_130397 ) ) ( not ( = ?auto_130400 ?auto_130397 ) ) ( ON ?auto_130400 ?auto_130398 ) ( CLEAR ?auto_130399 ) ( ON-TABLE ?auto_130401 ) ( ON ?auto_130396 ?auto_130401 ) ( ON ?auto_130399 ?auto_130396 ) ( not ( = ?auto_130401 ?auto_130396 ) ) ( not ( = ?auto_130401 ?auto_130399 ) ) ( not ( = ?auto_130401 ?auto_130397 ) ) ( not ( = ?auto_130396 ?auto_130399 ) ) ( not ( = ?auto_130396 ?auto_130397 ) ) ( not ( = ?auto_130399 ?auto_130397 ) ) ( not ( = ?auto_130394 ?auto_130399 ) ) ( not ( = ?auto_130394 ?auto_130401 ) ) ( not ( = ?auto_130394 ?auto_130396 ) ) ( not ( = ?auto_130395 ?auto_130399 ) ) ( not ( = ?auto_130395 ?auto_130401 ) ) ( not ( = ?auto_130395 ?auto_130396 ) ) ( not ( = ?auto_130398 ?auto_130399 ) ) ( not ( = ?auto_130398 ?auto_130401 ) ) ( not ( = ?auto_130398 ?auto_130396 ) ) ( not ( = ?auto_130400 ?auto_130399 ) ) ( not ( = ?auto_130400 ?auto_130401 ) ) ( not ( = ?auto_130400 ?auto_130396 ) ) ( ON ?auto_130397 ?auto_130400 ) ( CLEAR ?auto_130397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_130394 ?auto_130395 ?auto_130398 ?auto_130400 )
      ( MAKE-2PILE ?auto_130394 ?auto_130395 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_130402 - BLOCK
      ?auto_130403 - BLOCK
    )
    :vars
    (
      ?auto_130409 - BLOCK
      ?auto_130405 - BLOCK
      ?auto_130408 - BLOCK
      ?auto_130406 - BLOCK
      ?auto_130404 - BLOCK
      ?auto_130407 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130409 ?auto_130403 ) ( ON-TABLE ?auto_130402 ) ( ON ?auto_130403 ?auto_130402 ) ( not ( = ?auto_130402 ?auto_130403 ) ) ( not ( = ?auto_130402 ?auto_130409 ) ) ( not ( = ?auto_130403 ?auto_130409 ) ) ( not ( = ?auto_130402 ?auto_130405 ) ) ( not ( = ?auto_130402 ?auto_130408 ) ) ( not ( = ?auto_130403 ?auto_130405 ) ) ( not ( = ?auto_130403 ?auto_130408 ) ) ( not ( = ?auto_130409 ?auto_130405 ) ) ( not ( = ?auto_130409 ?auto_130408 ) ) ( not ( = ?auto_130405 ?auto_130408 ) ) ( ON ?auto_130405 ?auto_130409 ) ( ON-TABLE ?auto_130406 ) ( ON ?auto_130404 ?auto_130406 ) ( not ( = ?auto_130406 ?auto_130404 ) ) ( not ( = ?auto_130406 ?auto_130407 ) ) ( not ( = ?auto_130406 ?auto_130408 ) ) ( not ( = ?auto_130404 ?auto_130407 ) ) ( not ( = ?auto_130404 ?auto_130408 ) ) ( not ( = ?auto_130407 ?auto_130408 ) ) ( not ( = ?auto_130402 ?auto_130407 ) ) ( not ( = ?auto_130402 ?auto_130406 ) ) ( not ( = ?auto_130402 ?auto_130404 ) ) ( not ( = ?auto_130403 ?auto_130407 ) ) ( not ( = ?auto_130403 ?auto_130406 ) ) ( not ( = ?auto_130403 ?auto_130404 ) ) ( not ( = ?auto_130409 ?auto_130407 ) ) ( not ( = ?auto_130409 ?auto_130406 ) ) ( not ( = ?auto_130409 ?auto_130404 ) ) ( not ( = ?auto_130405 ?auto_130407 ) ) ( not ( = ?auto_130405 ?auto_130406 ) ) ( not ( = ?auto_130405 ?auto_130404 ) ) ( ON ?auto_130408 ?auto_130405 ) ( CLEAR ?auto_130408 ) ( HOLDING ?auto_130407 ) ( CLEAR ?auto_130404 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_130406 ?auto_130404 ?auto_130407 )
      ( MAKE-2PILE ?auto_130402 ?auto_130403 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_130410 - BLOCK
      ?auto_130411 - BLOCK
    )
    :vars
    (
      ?auto_130417 - BLOCK
      ?auto_130412 - BLOCK
      ?auto_130416 - BLOCK
      ?auto_130414 - BLOCK
      ?auto_130415 - BLOCK
      ?auto_130413 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130417 ?auto_130411 ) ( ON-TABLE ?auto_130410 ) ( ON ?auto_130411 ?auto_130410 ) ( not ( = ?auto_130410 ?auto_130411 ) ) ( not ( = ?auto_130410 ?auto_130417 ) ) ( not ( = ?auto_130411 ?auto_130417 ) ) ( not ( = ?auto_130410 ?auto_130412 ) ) ( not ( = ?auto_130410 ?auto_130416 ) ) ( not ( = ?auto_130411 ?auto_130412 ) ) ( not ( = ?auto_130411 ?auto_130416 ) ) ( not ( = ?auto_130417 ?auto_130412 ) ) ( not ( = ?auto_130417 ?auto_130416 ) ) ( not ( = ?auto_130412 ?auto_130416 ) ) ( ON ?auto_130412 ?auto_130417 ) ( ON-TABLE ?auto_130414 ) ( ON ?auto_130415 ?auto_130414 ) ( not ( = ?auto_130414 ?auto_130415 ) ) ( not ( = ?auto_130414 ?auto_130413 ) ) ( not ( = ?auto_130414 ?auto_130416 ) ) ( not ( = ?auto_130415 ?auto_130413 ) ) ( not ( = ?auto_130415 ?auto_130416 ) ) ( not ( = ?auto_130413 ?auto_130416 ) ) ( not ( = ?auto_130410 ?auto_130413 ) ) ( not ( = ?auto_130410 ?auto_130414 ) ) ( not ( = ?auto_130410 ?auto_130415 ) ) ( not ( = ?auto_130411 ?auto_130413 ) ) ( not ( = ?auto_130411 ?auto_130414 ) ) ( not ( = ?auto_130411 ?auto_130415 ) ) ( not ( = ?auto_130417 ?auto_130413 ) ) ( not ( = ?auto_130417 ?auto_130414 ) ) ( not ( = ?auto_130417 ?auto_130415 ) ) ( not ( = ?auto_130412 ?auto_130413 ) ) ( not ( = ?auto_130412 ?auto_130414 ) ) ( not ( = ?auto_130412 ?auto_130415 ) ) ( ON ?auto_130416 ?auto_130412 ) ( CLEAR ?auto_130415 ) ( ON ?auto_130413 ?auto_130416 ) ( CLEAR ?auto_130413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_130410 ?auto_130411 ?auto_130417 ?auto_130412 ?auto_130416 )
      ( MAKE-2PILE ?auto_130410 ?auto_130411 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_130418 - BLOCK
      ?auto_130419 - BLOCK
    )
    :vars
    (
      ?auto_130422 - BLOCK
      ?auto_130424 - BLOCK
      ?auto_130420 - BLOCK
      ?auto_130425 - BLOCK
      ?auto_130423 - BLOCK
      ?auto_130421 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130422 ?auto_130419 ) ( ON-TABLE ?auto_130418 ) ( ON ?auto_130419 ?auto_130418 ) ( not ( = ?auto_130418 ?auto_130419 ) ) ( not ( = ?auto_130418 ?auto_130422 ) ) ( not ( = ?auto_130419 ?auto_130422 ) ) ( not ( = ?auto_130418 ?auto_130424 ) ) ( not ( = ?auto_130418 ?auto_130420 ) ) ( not ( = ?auto_130419 ?auto_130424 ) ) ( not ( = ?auto_130419 ?auto_130420 ) ) ( not ( = ?auto_130422 ?auto_130424 ) ) ( not ( = ?auto_130422 ?auto_130420 ) ) ( not ( = ?auto_130424 ?auto_130420 ) ) ( ON ?auto_130424 ?auto_130422 ) ( ON-TABLE ?auto_130425 ) ( not ( = ?auto_130425 ?auto_130423 ) ) ( not ( = ?auto_130425 ?auto_130421 ) ) ( not ( = ?auto_130425 ?auto_130420 ) ) ( not ( = ?auto_130423 ?auto_130421 ) ) ( not ( = ?auto_130423 ?auto_130420 ) ) ( not ( = ?auto_130421 ?auto_130420 ) ) ( not ( = ?auto_130418 ?auto_130421 ) ) ( not ( = ?auto_130418 ?auto_130425 ) ) ( not ( = ?auto_130418 ?auto_130423 ) ) ( not ( = ?auto_130419 ?auto_130421 ) ) ( not ( = ?auto_130419 ?auto_130425 ) ) ( not ( = ?auto_130419 ?auto_130423 ) ) ( not ( = ?auto_130422 ?auto_130421 ) ) ( not ( = ?auto_130422 ?auto_130425 ) ) ( not ( = ?auto_130422 ?auto_130423 ) ) ( not ( = ?auto_130424 ?auto_130421 ) ) ( not ( = ?auto_130424 ?auto_130425 ) ) ( not ( = ?auto_130424 ?auto_130423 ) ) ( ON ?auto_130420 ?auto_130424 ) ( ON ?auto_130421 ?auto_130420 ) ( CLEAR ?auto_130421 ) ( HOLDING ?auto_130423 ) ( CLEAR ?auto_130425 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_130425 ?auto_130423 )
      ( MAKE-2PILE ?auto_130418 ?auto_130419 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_130426 - BLOCK
      ?auto_130427 - BLOCK
    )
    :vars
    (
      ?auto_130428 - BLOCK
      ?auto_130429 - BLOCK
      ?auto_130430 - BLOCK
      ?auto_130433 - BLOCK
      ?auto_130432 - BLOCK
      ?auto_130431 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130428 ?auto_130427 ) ( ON-TABLE ?auto_130426 ) ( ON ?auto_130427 ?auto_130426 ) ( not ( = ?auto_130426 ?auto_130427 ) ) ( not ( = ?auto_130426 ?auto_130428 ) ) ( not ( = ?auto_130427 ?auto_130428 ) ) ( not ( = ?auto_130426 ?auto_130429 ) ) ( not ( = ?auto_130426 ?auto_130430 ) ) ( not ( = ?auto_130427 ?auto_130429 ) ) ( not ( = ?auto_130427 ?auto_130430 ) ) ( not ( = ?auto_130428 ?auto_130429 ) ) ( not ( = ?auto_130428 ?auto_130430 ) ) ( not ( = ?auto_130429 ?auto_130430 ) ) ( ON ?auto_130429 ?auto_130428 ) ( ON-TABLE ?auto_130433 ) ( not ( = ?auto_130433 ?auto_130432 ) ) ( not ( = ?auto_130433 ?auto_130431 ) ) ( not ( = ?auto_130433 ?auto_130430 ) ) ( not ( = ?auto_130432 ?auto_130431 ) ) ( not ( = ?auto_130432 ?auto_130430 ) ) ( not ( = ?auto_130431 ?auto_130430 ) ) ( not ( = ?auto_130426 ?auto_130431 ) ) ( not ( = ?auto_130426 ?auto_130433 ) ) ( not ( = ?auto_130426 ?auto_130432 ) ) ( not ( = ?auto_130427 ?auto_130431 ) ) ( not ( = ?auto_130427 ?auto_130433 ) ) ( not ( = ?auto_130427 ?auto_130432 ) ) ( not ( = ?auto_130428 ?auto_130431 ) ) ( not ( = ?auto_130428 ?auto_130433 ) ) ( not ( = ?auto_130428 ?auto_130432 ) ) ( not ( = ?auto_130429 ?auto_130431 ) ) ( not ( = ?auto_130429 ?auto_130433 ) ) ( not ( = ?auto_130429 ?auto_130432 ) ) ( ON ?auto_130430 ?auto_130429 ) ( ON ?auto_130431 ?auto_130430 ) ( CLEAR ?auto_130433 ) ( ON ?auto_130432 ?auto_130431 ) ( CLEAR ?auto_130432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_130426 ?auto_130427 ?auto_130428 ?auto_130429 ?auto_130430 ?auto_130431 )
      ( MAKE-2PILE ?auto_130426 ?auto_130427 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_130434 - BLOCK
      ?auto_130435 - BLOCK
    )
    :vars
    (
      ?auto_130440 - BLOCK
      ?auto_130436 - BLOCK
      ?auto_130439 - BLOCK
      ?auto_130438 - BLOCK
      ?auto_130437 - BLOCK
      ?auto_130441 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130440 ?auto_130435 ) ( ON-TABLE ?auto_130434 ) ( ON ?auto_130435 ?auto_130434 ) ( not ( = ?auto_130434 ?auto_130435 ) ) ( not ( = ?auto_130434 ?auto_130440 ) ) ( not ( = ?auto_130435 ?auto_130440 ) ) ( not ( = ?auto_130434 ?auto_130436 ) ) ( not ( = ?auto_130434 ?auto_130439 ) ) ( not ( = ?auto_130435 ?auto_130436 ) ) ( not ( = ?auto_130435 ?auto_130439 ) ) ( not ( = ?auto_130440 ?auto_130436 ) ) ( not ( = ?auto_130440 ?auto_130439 ) ) ( not ( = ?auto_130436 ?auto_130439 ) ) ( ON ?auto_130436 ?auto_130440 ) ( not ( = ?auto_130438 ?auto_130437 ) ) ( not ( = ?auto_130438 ?auto_130441 ) ) ( not ( = ?auto_130438 ?auto_130439 ) ) ( not ( = ?auto_130437 ?auto_130441 ) ) ( not ( = ?auto_130437 ?auto_130439 ) ) ( not ( = ?auto_130441 ?auto_130439 ) ) ( not ( = ?auto_130434 ?auto_130441 ) ) ( not ( = ?auto_130434 ?auto_130438 ) ) ( not ( = ?auto_130434 ?auto_130437 ) ) ( not ( = ?auto_130435 ?auto_130441 ) ) ( not ( = ?auto_130435 ?auto_130438 ) ) ( not ( = ?auto_130435 ?auto_130437 ) ) ( not ( = ?auto_130440 ?auto_130441 ) ) ( not ( = ?auto_130440 ?auto_130438 ) ) ( not ( = ?auto_130440 ?auto_130437 ) ) ( not ( = ?auto_130436 ?auto_130441 ) ) ( not ( = ?auto_130436 ?auto_130438 ) ) ( not ( = ?auto_130436 ?auto_130437 ) ) ( ON ?auto_130439 ?auto_130436 ) ( ON ?auto_130441 ?auto_130439 ) ( ON ?auto_130437 ?auto_130441 ) ( CLEAR ?auto_130437 ) ( HOLDING ?auto_130438 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_130438 )
      ( MAKE-2PILE ?auto_130434 ?auto_130435 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_130442 - BLOCK
      ?auto_130443 - BLOCK
    )
    :vars
    (
      ?auto_130445 - BLOCK
      ?auto_130448 - BLOCK
      ?auto_130444 - BLOCK
      ?auto_130449 - BLOCK
      ?auto_130446 - BLOCK
      ?auto_130447 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130445 ?auto_130443 ) ( ON-TABLE ?auto_130442 ) ( ON ?auto_130443 ?auto_130442 ) ( not ( = ?auto_130442 ?auto_130443 ) ) ( not ( = ?auto_130442 ?auto_130445 ) ) ( not ( = ?auto_130443 ?auto_130445 ) ) ( not ( = ?auto_130442 ?auto_130448 ) ) ( not ( = ?auto_130442 ?auto_130444 ) ) ( not ( = ?auto_130443 ?auto_130448 ) ) ( not ( = ?auto_130443 ?auto_130444 ) ) ( not ( = ?auto_130445 ?auto_130448 ) ) ( not ( = ?auto_130445 ?auto_130444 ) ) ( not ( = ?auto_130448 ?auto_130444 ) ) ( ON ?auto_130448 ?auto_130445 ) ( not ( = ?auto_130449 ?auto_130446 ) ) ( not ( = ?auto_130449 ?auto_130447 ) ) ( not ( = ?auto_130449 ?auto_130444 ) ) ( not ( = ?auto_130446 ?auto_130447 ) ) ( not ( = ?auto_130446 ?auto_130444 ) ) ( not ( = ?auto_130447 ?auto_130444 ) ) ( not ( = ?auto_130442 ?auto_130447 ) ) ( not ( = ?auto_130442 ?auto_130449 ) ) ( not ( = ?auto_130442 ?auto_130446 ) ) ( not ( = ?auto_130443 ?auto_130447 ) ) ( not ( = ?auto_130443 ?auto_130449 ) ) ( not ( = ?auto_130443 ?auto_130446 ) ) ( not ( = ?auto_130445 ?auto_130447 ) ) ( not ( = ?auto_130445 ?auto_130449 ) ) ( not ( = ?auto_130445 ?auto_130446 ) ) ( not ( = ?auto_130448 ?auto_130447 ) ) ( not ( = ?auto_130448 ?auto_130449 ) ) ( not ( = ?auto_130448 ?auto_130446 ) ) ( ON ?auto_130444 ?auto_130448 ) ( ON ?auto_130447 ?auto_130444 ) ( ON ?auto_130446 ?auto_130447 ) ( ON ?auto_130449 ?auto_130446 ) ( CLEAR ?auto_130449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_130442 ?auto_130443 ?auto_130445 ?auto_130448 ?auto_130444 ?auto_130447 ?auto_130446 )
      ( MAKE-2PILE ?auto_130442 ?auto_130443 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_130456 - BLOCK
      ?auto_130457 - BLOCK
      ?auto_130458 - BLOCK
      ?auto_130459 - BLOCK
      ?auto_130460 - BLOCK
      ?auto_130461 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_130461 ) ( CLEAR ?auto_130460 ) ( ON-TABLE ?auto_130456 ) ( ON ?auto_130457 ?auto_130456 ) ( ON ?auto_130458 ?auto_130457 ) ( ON ?auto_130459 ?auto_130458 ) ( ON ?auto_130460 ?auto_130459 ) ( not ( = ?auto_130456 ?auto_130457 ) ) ( not ( = ?auto_130456 ?auto_130458 ) ) ( not ( = ?auto_130456 ?auto_130459 ) ) ( not ( = ?auto_130456 ?auto_130460 ) ) ( not ( = ?auto_130456 ?auto_130461 ) ) ( not ( = ?auto_130457 ?auto_130458 ) ) ( not ( = ?auto_130457 ?auto_130459 ) ) ( not ( = ?auto_130457 ?auto_130460 ) ) ( not ( = ?auto_130457 ?auto_130461 ) ) ( not ( = ?auto_130458 ?auto_130459 ) ) ( not ( = ?auto_130458 ?auto_130460 ) ) ( not ( = ?auto_130458 ?auto_130461 ) ) ( not ( = ?auto_130459 ?auto_130460 ) ) ( not ( = ?auto_130459 ?auto_130461 ) ) ( not ( = ?auto_130460 ?auto_130461 ) ) )
    :subtasks
    ( ( !STACK ?auto_130461 ?auto_130460 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_130462 - BLOCK
      ?auto_130463 - BLOCK
      ?auto_130464 - BLOCK
      ?auto_130465 - BLOCK
      ?auto_130466 - BLOCK
      ?auto_130467 - BLOCK
    )
    :vars
    (
      ?auto_130468 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_130466 ) ( ON-TABLE ?auto_130462 ) ( ON ?auto_130463 ?auto_130462 ) ( ON ?auto_130464 ?auto_130463 ) ( ON ?auto_130465 ?auto_130464 ) ( ON ?auto_130466 ?auto_130465 ) ( not ( = ?auto_130462 ?auto_130463 ) ) ( not ( = ?auto_130462 ?auto_130464 ) ) ( not ( = ?auto_130462 ?auto_130465 ) ) ( not ( = ?auto_130462 ?auto_130466 ) ) ( not ( = ?auto_130462 ?auto_130467 ) ) ( not ( = ?auto_130463 ?auto_130464 ) ) ( not ( = ?auto_130463 ?auto_130465 ) ) ( not ( = ?auto_130463 ?auto_130466 ) ) ( not ( = ?auto_130463 ?auto_130467 ) ) ( not ( = ?auto_130464 ?auto_130465 ) ) ( not ( = ?auto_130464 ?auto_130466 ) ) ( not ( = ?auto_130464 ?auto_130467 ) ) ( not ( = ?auto_130465 ?auto_130466 ) ) ( not ( = ?auto_130465 ?auto_130467 ) ) ( not ( = ?auto_130466 ?auto_130467 ) ) ( ON ?auto_130467 ?auto_130468 ) ( CLEAR ?auto_130467 ) ( HAND-EMPTY ) ( not ( = ?auto_130462 ?auto_130468 ) ) ( not ( = ?auto_130463 ?auto_130468 ) ) ( not ( = ?auto_130464 ?auto_130468 ) ) ( not ( = ?auto_130465 ?auto_130468 ) ) ( not ( = ?auto_130466 ?auto_130468 ) ) ( not ( = ?auto_130467 ?auto_130468 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_130467 ?auto_130468 )
      ( MAKE-6PILE ?auto_130462 ?auto_130463 ?auto_130464 ?auto_130465 ?auto_130466 ?auto_130467 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_130469 - BLOCK
      ?auto_130470 - BLOCK
      ?auto_130471 - BLOCK
      ?auto_130472 - BLOCK
      ?auto_130473 - BLOCK
      ?auto_130474 - BLOCK
    )
    :vars
    (
      ?auto_130475 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130469 ) ( ON ?auto_130470 ?auto_130469 ) ( ON ?auto_130471 ?auto_130470 ) ( ON ?auto_130472 ?auto_130471 ) ( not ( = ?auto_130469 ?auto_130470 ) ) ( not ( = ?auto_130469 ?auto_130471 ) ) ( not ( = ?auto_130469 ?auto_130472 ) ) ( not ( = ?auto_130469 ?auto_130473 ) ) ( not ( = ?auto_130469 ?auto_130474 ) ) ( not ( = ?auto_130470 ?auto_130471 ) ) ( not ( = ?auto_130470 ?auto_130472 ) ) ( not ( = ?auto_130470 ?auto_130473 ) ) ( not ( = ?auto_130470 ?auto_130474 ) ) ( not ( = ?auto_130471 ?auto_130472 ) ) ( not ( = ?auto_130471 ?auto_130473 ) ) ( not ( = ?auto_130471 ?auto_130474 ) ) ( not ( = ?auto_130472 ?auto_130473 ) ) ( not ( = ?auto_130472 ?auto_130474 ) ) ( not ( = ?auto_130473 ?auto_130474 ) ) ( ON ?auto_130474 ?auto_130475 ) ( CLEAR ?auto_130474 ) ( not ( = ?auto_130469 ?auto_130475 ) ) ( not ( = ?auto_130470 ?auto_130475 ) ) ( not ( = ?auto_130471 ?auto_130475 ) ) ( not ( = ?auto_130472 ?auto_130475 ) ) ( not ( = ?auto_130473 ?auto_130475 ) ) ( not ( = ?auto_130474 ?auto_130475 ) ) ( HOLDING ?auto_130473 ) ( CLEAR ?auto_130472 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_130469 ?auto_130470 ?auto_130471 ?auto_130472 ?auto_130473 )
      ( MAKE-6PILE ?auto_130469 ?auto_130470 ?auto_130471 ?auto_130472 ?auto_130473 ?auto_130474 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_130476 - BLOCK
      ?auto_130477 - BLOCK
      ?auto_130478 - BLOCK
      ?auto_130479 - BLOCK
      ?auto_130480 - BLOCK
      ?auto_130481 - BLOCK
    )
    :vars
    (
      ?auto_130482 - BLOCK
      ?auto_130483 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130476 ) ( ON ?auto_130477 ?auto_130476 ) ( ON ?auto_130478 ?auto_130477 ) ( ON ?auto_130479 ?auto_130478 ) ( not ( = ?auto_130476 ?auto_130477 ) ) ( not ( = ?auto_130476 ?auto_130478 ) ) ( not ( = ?auto_130476 ?auto_130479 ) ) ( not ( = ?auto_130476 ?auto_130480 ) ) ( not ( = ?auto_130476 ?auto_130481 ) ) ( not ( = ?auto_130477 ?auto_130478 ) ) ( not ( = ?auto_130477 ?auto_130479 ) ) ( not ( = ?auto_130477 ?auto_130480 ) ) ( not ( = ?auto_130477 ?auto_130481 ) ) ( not ( = ?auto_130478 ?auto_130479 ) ) ( not ( = ?auto_130478 ?auto_130480 ) ) ( not ( = ?auto_130478 ?auto_130481 ) ) ( not ( = ?auto_130479 ?auto_130480 ) ) ( not ( = ?auto_130479 ?auto_130481 ) ) ( not ( = ?auto_130480 ?auto_130481 ) ) ( ON ?auto_130481 ?auto_130482 ) ( not ( = ?auto_130476 ?auto_130482 ) ) ( not ( = ?auto_130477 ?auto_130482 ) ) ( not ( = ?auto_130478 ?auto_130482 ) ) ( not ( = ?auto_130479 ?auto_130482 ) ) ( not ( = ?auto_130480 ?auto_130482 ) ) ( not ( = ?auto_130481 ?auto_130482 ) ) ( CLEAR ?auto_130479 ) ( ON ?auto_130480 ?auto_130481 ) ( CLEAR ?auto_130480 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_130483 ) ( ON ?auto_130482 ?auto_130483 ) ( not ( = ?auto_130483 ?auto_130482 ) ) ( not ( = ?auto_130483 ?auto_130481 ) ) ( not ( = ?auto_130483 ?auto_130480 ) ) ( not ( = ?auto_130476 ?auto_130483 ) ) ( not ( = ?auto_130477 ?auto_130483 ) ) ( not ( = ?auto_130478 ?auto_130483 ) ) ( not ( = ?auto_130479 ?auto_130483 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_130483 ?auto_130482 ?auto_130481 )
      ( MAKE-6PILE ?auto_130476 ?auto_130477 ?auto_130478 ?auto_130479 ?auto_130480 ?auto_130481 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_130484 - BLOCK
      ?auto_130485 - BLOCK
      ?auto_130486 - BLOCK
      ?auto_130487 - BLOCK
      ?auto_130488 - BLOCK
      ?auto_130489 - BLOCK
    )
    :vars
    (
      ?auto_130490 - BLOCK
      ?auto_130491 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130484 ) ( ON ?auto_130485 ?auto_130484 ) ( ON ?auto_130486 ?auto_130485 ) ( not ( = ?auto_130484 ?auto_130485 ) ) ( not ( = ?auto_130484 ?auto_130486 ) ) ( not ( = ?auto_130484 ?auto_130487 ) ) ( not ( = ?auto_130484 ?auto_130488 ) ) ( not ( = ?auto_130484 ?auto_130489 ) ) ( not ( = ?auto_130485 ?auto_130486 ) ) ( not ( = ?auto_130485 ?auto_130487 ) ) ( not ( = ?auto_130485 ?auto_130488 ) ) ( not ( = ?auto_130485 ?auto_130489 ) ) ( not ( = ?auto_130486 ?auto_130487 ) ) ( not ( = ?auto_130486 ?auto_130488 ) ) ( not ( = ?auto_130486 ?auto_130489 ) ) ( not ( = ?auto_130487 ?auto_130488 ) ) ( not ( = ?auto_130487 ?auto_130489 ) ) ( not ( = ?auto_130488 ?auto_130489 ) ) ( ON ?auto_130489 ?auto_130490 ) ( not ( = ?auto_130484 ?auto_130490 ) ) ( not ( = ?auto_130485 ?auto_130490 ) ) ( not ( = ?auto_130486 ?auto_130490 ) ) ( not ( = ?auto_130487 ?auto_130490 ) ) ( not ( = ?auto_130488 ?auto_130490 ) ) ( not ( = ?auto_130489 ?auto_130490 ) ) ( ON ?auto_130488 ?auto_130489 ) ( CLEAR ?auto_130488 ) ( ON-TABLE ?auto_130491 ) ( ON ?auto_130490 ?auto_130491 ) ( not ( = ?auto_130491 ?auto_130490 ) ) ( not ( = ?auto_130491 ?auto_130489 ) ) ( not ( = ?auto_130491 ?auto_130488 ) ) ( not ( = ?auto_130484 ?auto_130491 ) ) ( not ( = ?auto_130485 ?auto_130491 ) ) ( not ( = ?auto_130486 ?auto_130491 ) ) ( not ( = ?auto_130487 ?auto_130491 ) ) ( HOLDING ?auto_130487 ) ( CLEAR ?auto_130486 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_130484 ?auto_130485 ?auto_130486 ?auto_130487 )
      ( MAKE-6PILE ?auto_130484 ?auto_130485 ?auto_130486 ?auto_130487 ?auto_130488 ?auto_130489 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_130492 - BLOCK
      ?auto_130493 - BLOCK
      ?auto_130494 - BLOCK
      ?auto_130495 - BLOCK
      ?auto_130496 - BLOCK
      ?auto_130497 - BLOCK
    )
    :vars
    (
      ?auto_130498 - BLOCK
      ?auto_130499 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130492 ) ( ON ?auto_130493 ?auto_130492 ) ( ON ?auto_130494 ?auto_130493 ) ( not ( = ?auto_130492 ?auto_130493 ) ) ( not ( = ?auto_130492 ?auto_130494 ) ) ( not ( = ?auto_130492 ?auto_130495 ) ) ( not ( = ?auto_130492 ?auto_130496 ) ) ( not ( = ?auto_130492 ?auto_130497 ) ) ( not ( = ?auto_130493 ?auto_130494 ) ) ( not ( = ?auto_130493 ?auto_130495 ) ) ( not ( = ?auto_130493 ?auto_130496 ) ) ( not ( = ?auto_130493 ?auto_130497 ) ) ( not ( = ?auto_130494 ?auto_130495 ) ) ( not ( = ?auto_130494 ?auto_130496 ) ) ( not ( = ?auto_130494 ?auto_130497 ) ) ( not ( = ?auto_130495 ?auto_130496 ) ) ( not ( = ?auto_130495 ?auto_130497 ) ) ( not ( = ?auto_130496 ?auto_130497 ) ) ( ON ?auto_130497 ?auto_130498 ) ( not ( = ?auto_130492 ?auto_130498 ) ) ( not ( = ?auto_130493 ?auto_130498 ) ) ( not ( = ?auto_130494 ?auto_130498 ) ) ( not ( = ?auto_130495 ?auto_130498 ) ) ( not ( = ?auto_130496 ?auto_130498 ) ) ( not ( = ?auto_130497 ?auto_130498 ) ) ( ON ?auto_130496 ?auto_130497 ) ( ON-TABLE ?auto_130499 ) ( ON ?auto_130498 ?auto_130499 ) ( not ( = ?auto_130499 ?auto_130498 ) ) ( not ( = ?auto_130499 ?auto_130497 ) ) ( not ( = ?auto_130499 ?auto_130496 ) ) ( not ( = ?auto_130492 ?auto_130499 ) ) ( not ( = ?auto_130493 ?auto_130499 ) ) ( not ( = ?auto_130494 ?auto_130499 ) ) ( not ( = ?auto_130495 ?auto_130499 ) ) ( CLEAR ?auto_130494 ) ( ON ?auto_130495 ?auto_130496 ) ( CLEAR ?auto_130495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_130499 ?auto_130498 ?auto_130497 ?auto_130496 )
      ( MAKE-6PILE ?auto_130492 ?auto_130493 ?auto_130494 ?auto_130495 ?auto_130496 ?auto_130497 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_130500 - BLOCK
      ?auto_130501 - BLOCK
      ?auto_130502 - BLOCK
      ?auto_130503 - BLOCK
      ?auto_130504 - BLOCK
      ?auto_130505 - BLOCK
    )
    :vars
    (
      ?auto_130506 - BLOCK
      ?auto_130507 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130500 ) ( ON ?auto_130501 ?auto_130500 ) ( not ( = ?auto_130500 ?auto_130501 ) ) ( not ( = ?auto_130500 ?auto_130502 ) ) ( not ( = ?auto_130500 ?auto_130503 ) ) ( not ( = ?auto_130500 ?auto_130504 ) ) ( not ( = ?auto_130500 ?auto_130505 ) ) ( not ( = ?auto_130501 ?auto_130502 ) ) ( not ( = ?auto_130501 ?auto_130503 ) ) ( not ( = ?auto_130501 ?auto_130504 ) ) ( not ( = ?auto_130501 ?auto_130505 ) ) ( not ( = ?auto_130502 ?auto_130503 ) ) ( not ( = ?auto_130502 ?auto_130504 ) ) ( not ( = ?auto_130502 ?auto_130505 ) ) ( not ( = ?auto_130503 ?auto_130504 ) ) ( not ( = ?auto_130503 ?auto_130505 ) ) ( not ( = ?auto_130504 ?auto_130505 ) ) ( ON ?auto_130505 ?auto_130506 ) ( not ( = ?auto_130500 ?auto_130506 ) ) ( not ( = ?auto_130501 ?auto_130506 ) ) ( not ( = ?auto_130502 ?auto_130506 ) ) ( not ( = ?auto_130503 ?auto_130506 ) ) ( not ( = ?auto_130504 ?auto_130506 ) ) ( not ( = ?auto_130505 ?auto_130506 ) ) ( ON ?auto_130504 ?auto_130505 ) ( ON-TABLE ?auto_130507 ) ( ON ?auto_130506 ?auto_130507 ) ( not ( = ?auto_130507 ?auto_130506 ) ) ( not ( = ?auto_130507 ?auto_130505 ) ) ( not ( = ?auto_130507 ?auto_130504 ) ) ( not ( = ?auto_130500 ?auto_130507 ) ) ( not ( = ?auto_130501 ?auto_130507 ) ) ( not ( = ?auto_130502 ?auto_130507 ) ) ( not ( = ?auto_130503 ?auto_130507 ) ) ( ON ?auto_130503 ?auto_130504 ) ( CLEAR ?auto_130503 ) ( HOLDING ?auto_130502 ) ( CLEAR ?auto_130501 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_130500 ?auto_130501 ?auto_130502 )
      ( MAKE-6PILE ?auto_130500 ?auto_130501 ?auto_130502 ?auto_130503 ?auto_130504 ?auto_130505 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_130508 - BLOCK
      ?auto_130509 - BLOCK
      ?auto_130510 - BLOCK
      ?auto_130511 - BLOCK
      ?auto_130512 - BLOCK
      ?auto_130513 - BLOCK
    )
    :vars
    (
      ?auto_130514 - BLOCK
      ?auto_130515 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130508 ) ( ON ?auto_130509 ?auto_130508 ) ( not ( = ?auto_130508 ?auto_130509 ) ) ( not ( = ?auto_130508 ?auto_130510 ) ) ( not ( = ?auto_130508 ?auto_130511 ) ) ( not ( = ?auto_130508 ?auto_130512 ) ) ( not ( = ?auto_130508 ?auto_130513 ) ) ( not ( = ?auto_130509 ?auto_130510 ) ) ( not ( = ?auto_130509 ?auto_130511 ) ) ( not ( = ?auto_130509 ?auto_130512 ) ) ( not ( = ?auto_130509 ?auto_130513 ) ) ( not ( = ?auto_130510 ?auto_130511 ) ) ( not ( = ?auto_130510 ?auto_130512 ) ) ( not ( = ?auto_130510 ?auto_130513 ) ) ( not ( = ?auto_130511 ?auto_130512 ) ) ( not ( = ?auto_130511 ?auto_130513 ) ) ( not ( = ?auto_130512 ?auto_130513 ) ) ( ON ?auto_130513 ?auto_130514 ) ( not ( = ?auto_130508 ?auto_130514 ) ) ( not ( = ?auto_130509 ?auto_130514 ) ) ( not ( = ?auto_130510 ?auto_130514 ) ) ( not ( = ?auto_130511 ?auto_130514 ) ) ( not ( = ?auto_130512 ?auto_130514 ) ) ( not ( = ?auto_130513 ?auto_130514 ) ) ( ON ?auto_130512 ?auto_130513 ) ( ON-TABLE ?auto_130515 ) ( ON ?auto_130514 ?auto_130515 ) ( not ( = ?auto_130515 ?auto_130514 ) ) ( not ( = ?auto_130515 ?auto_130513 ) ) ( not ( = ?auto_130515 ?auto_130512 ) ) ( not ( = ?auto_130508 ?auto_130515 ) ) ( not ( = ?auto_130509 ?auto_130515 ) ) ( not ( = ?auto_130510 ?auto_130515 ) ) ( not ( = ?auto_130511 ?auto_130515 ) ) ( ON ?auto_130511 ?auto_130512 ) ( CLEAR ?auto_130509 ) ( ON ?auto_130510 ?auto_130511 ) ( CLEAR ?auto_130510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_130515 ?auto_130514 ?auto_130513 ?auto_130512 ?auto_130511 )
      ( MAKE-6PILE ?auto_130508 ?auto_130509 ?auto_130510 ?auto_130511 ?auto_130512 ?auto_130513 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_130516 - BLOCK
      ?auto_130517 - BLOCK
      ?auto_130518 - BLOCK
      ?auto_130519 - BLOCK
      ?auto_130520 - BLOCK
      ?auto_130521 - BLOCK
    )
    :vars
    (
      ?auto_130523 - BLOCK
      ?auto_130522 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130516 ) ( not ( = ?auto_130516 ?auto_130517 ) ) ( not ( = ?auto_130516 ?auto_130518 ) ) ( not ( = ?auto_130516 ?auto_130519 ) ) ( not ( = ?auto_130516 ?auto_130520 ) ) ( not ( = ?auto_130516 ?auto_130521 ) ) ( not ( = ?auto_130517 ?auto_130518 ) ) ( not ( = ?auto_130517 ?auto_130519 ) ) ( not ( = ?auto_130517 ?auto_130520 ) ) ( not ( = ?auto_130517 ?auto_130521 ) ) ( not ( = ?auto_130518 ?auto_130519 ) ) ( not ( = ?auto_130518 ?auto_130520 ) ) ( not ( = ?auto_130518 ?auto_130521 ) ) ( not ( = ?auto_130519 ?auto_130520 ) ) ( not ( = ?auto_130519 ?auto_130521 ) ) ( not ( = ?auto_130520 ?auto_130521 ) ) ( ON ?auto_130521 ?auto_130523 ) ( not ( = ?auto_130516 ?auto_130523 ) ) ( not ( = ?auto_130517 ?auto_130523 ) ) ( not ( = ?auto_130518 ?auto_130523 ) ) ( not ( = ?auto_130519 ?auto_130523 ) ) ( not ( = ?auto_130520 ?auto_130523 ) ) ( not ( = ?auto_130521 ?auto_130523 ) ) ( ON ?auto_130520 ?auto_130521 ) ( ON-TABLE ?auto_130522 ) ( ON ?auto_130523 ?auto_130522 ) ( not ( = ?auto_130522 ?auto_130523 ) ) ( not ( = ?auto_130522 ?auto_130521 ) ) ( not ( = ?auto_130522 ?auto_130520 ) ) ( not ( = ?auto_130516 ?auto_130522 ) ) ( not ( = ?auto_130517 ?auto_130522 ) ) ( not ( = ?auto_130518 ?auto_130522 ) ) ( not ( = ?auto_130519 ?auto_130522 ) ) ( ON ?auto_130519 ?auto_130520 ) ( ON ?auto_130518 ?auto_130519 ) ( CLEAR ?auto_130518 ) ( HOLDING ?auto_130517 ) ( CLEAR ?auto_130516 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_130516 ?auto_130517 )
      ( MAKE-6PILE ?auto_130516 ?auto_130517 ?auto_130518 ?auto_130519 ?auto_130520 ?auto_130521 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_130524 - BLOCK
      ?auto_130525 - BLOCK
      ?auto_130526 - BLOCK
      ?auto_130527 - BLOCK
      ?auto_130528 - BLOCK
      ?auto_130529 - BLOCK
    )
    :vars
    (
      ?auto_130531 - BLOCK
      ?auto_130530 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130524 ) ( not ( = ?auto_130524 ?auto_130525 ) ) ( not ( = ?auto_130524 ?auto_130526 ) ) ( not ( = ?auto_130524 ?auto_130527 ) ) ( not ( = ?auto_130524 ?auto_130528 ) ) ( not ( = ?auto_130524 ?auto_130529 ) ) ( not ( = ?auto_130525 ?auto_130526 ) ) ( not ( = ?auto_130525 ?auto_130527 ) ) ( not ( = ?auto_130525 ?auto_130528 ) ) ( not ( = ?auto_130525 ?auto_130529 ) ) ( not ( = ?auto_130526 ?auto_130527 ) ) ( not ( = ?auto_130526 ?auto_130528 ) ) ( not ( = ?auto_130526 ?auto_130529 ) ) ( not ( = ?auto_130527 ?auto_130528 ) ) ( not ( = ?auto_130527 ?auto_130529 ) ) ( not ( = ?auto_130528 ?auto_130529 ) ) ( ON ?auto_130529 ?auto_130531 ) ( not ( = ?auto_130524 ?auto_130531 ) ) ( not ( = ?auto_130525 ?auto_130531 ) ) ( not ( = ?auto_130526 ?auto_130531 ) ) ( not ( = ?auto_130527 ?auto_130531 ) ) ( not ( = ?auto_130528 ?auto_130531 ) ) ( not ( = ?auto_130529 ?auto_130531 ) ) ( ON ?auto_130528 ?auto_130529 ) ( ON-TABLE ?auto_130530 ) ( ON ?auto_130531 ?auto_130530 ) ( not ( = ?auto_130530 ?auto_130531 ) ) ( not ( = ?auto_130530 ?auto_130529 ) ) ( not ( = ?auto_130530 ?auto_130528 ) ) ( not ( = ?auto_130524 ?auto_130530 ) ) ( not ( = ?auto_130525 ?auto_130530 ) ) ( not ( = ?auto_130526 ?auto_130530 ) ) ( not ( = ?auto_130527 ?auto_130530 ) ) ( ON ?auto_130527 ?auto_130528 ) ( ON ?auto_130526 ?auto_130527 ) ( CLEAR ?auto_130524 ) ( ON ?auto_130525 ?auto_130526 ) ( CLEAR ?auto_130525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_130530 ?auto_130531 ?auto_130529 ?auto_130528 ?auto_130527 ?auto_130526 )
      ( MAKE-6PILE ?auto_130524 ?auto_130525 ?auto_130526 ?auto_130527 ?auto_130528 ?auto_130529 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_130532 - BLOCK
      ?auto_130533 - BLOCK
      ?auto_130534 - BLOCK
      ?auto_130535 - BLOCK
      ?auto_130536 - BLOCK
      ?auto_130537 - BLOCK
    )
    :vars
    (
      ?auto_130539 - BLOCK
      ?auto_130538 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130532 ?auto_130533 ) ) ( not ( = ?auto_130532 ?auto_130534 ) ) ( not ( = ?auto_130532 ?auto_130535 ) ) ( not ( = ?auto_130532 ?auto_130536 ) ) ( not ( = ?auto_130532 ?auto_130537 ) ) ( not ( = ?auto_130533 ?auto_130534 ) ) ( not ( = ?auto_130533 ?auto_130535 ) ) ( not ( = ?auto_130533 ?auto_130536 ) ) ( not ( = ?auto_130533 ?auto_130537 ) ) ( not ( = ?auto_130534 ?auto_130535 ) ) ( not ( = ?auto_130534 ?auto_130536 ) ) ( not ( = ?auto_130534 ?auto_130537 ) ) ( not ( = ?auto_130535 ?auto_130536 ) ) ( not ( = ?auto_130535 ?auto_130537 ) ) ( not ( = ?auto_130536 ?auto_130537 ) ) ( ON ?auto_130537 ?auto_130539 ) ( not ( = ?auto_130532 ?auto_130539 ) ) ( not ( = ?auto_130533 ?auto_130539 ) ) ( not ( = ?auto_130534 ?auto_130539 ) ) ( not ( = ?auto_130535 ?auto_130539 ) ) ( not ( = ?auto_130536 ?auto_130539 ) ) ( not ( = ?auto_130537 ?auto_130539 ) ) ( ON ?auto_130536 ?auto_130537 ) ( ON-TABLE ?auto_130538 ) ( ON ?auto_130539 ?auto_130538 ) ( not ( = ?auto_130538 ?auto_130539 ) ) ( not ( = ?auto_130538 ?auto_130537 ) ) ( not ( = ?auto_130538 ?auto_130536 ) ) ( not ( = ?auto_130532 ?auto_130538 ) ) ( not ( = ?auto_130533 ?auto_130538 ) ) ( not ( = ?auto_130534 ?auto_130538 ) ) ( not ( = ?auto_130535 ?auto_130538 ) ) ( ON ?auto_130535 ?auto_130536 ) ( ON ?auto_130534 ?auto_130535 ) ( ON ?auto_130533 ?auto_130534 ) ( CLEAR ?auto_130533 ) ( HOLDING ?auto_130532 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_130532 )
      ( MAKE-6PILE ?auto_130532 ?auto_130533 ?auto_130534 ?auto_130535 ?auto_130536 ?auto_130537 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_130540 - BLOCK
      ?auto_130541 - BLOCK
      ?auto_130542 - BLOCK
      ?auto_130543 - BLOCK
      ?auto_130544 - BLOCK
      ?auto_130545 - BLOCK
    )
    :vars
    (
      ?auto_130547 - BLOCK
      ?auto_130546 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130540 ?auto_130541 ) ) ( not ( = ?auto_130540 ?auto_130542 ) ) ( not ( = ?auto_130540 ?auto_130543 ) ) ( not ( = ?auto_130540 ?auto_130544 ) ) ( not ( = ?auto_130540 ?auto_130545 ) ) ( not ( = ?auto_130541 ?auto_130542 ) ) ( not ( = ?auto_130541 ?auto_130543 ) ) ( not ( = ?auto_130541 ?auto_130544 ) ) ( not ( = ?auto_130541 ?auto_130545 ) ) ( not ( = ?auto_130542 ?auto_130543 ) ) ( not ( = ?auto_130542 ?auto_130544 ) ) ( not ( = ?auto_130542 ?auto_130545 ) ) ( not ( = ?auto_130543 ?auto_130544 ) ) ( not ( = ?auto_130543 ?auto_130545 ) ) ( not ( = ?auto_130544 ?auto_130545 ) ) ( ON ?auto_130545 ?auto_130547 ) ( not ( = ?auto_130540 ?auto_130547 ) ) ( not ( = ?auto_130541 ?auto_130547 ) ) ( not ( = ?auto_130542 ?auto_130547 ) ) ( not ( = ?auto_130543 ?auto_130547 ) ) ( not ( = ?auto_130544 ?auto_130547 ) ) ( not ( = ?auto_130545 ?auto_130547 ) ) ( ON ?auto_130544 ?auto_130545 ) ( ON-TABLE ?auto_130546 ) ( ON ?auto_130547 ?auto_130546 ) ( not ( = ?auto_130546 ?auto_130547 ) ) ( not ( = ?auto_130546 ?auto_130545 ) ) ( not ( = ?auto_130546 ?auto_130544 ) ) ( not ( = ?auto_130540 ?auto_130546 ) ) ( not ( = ?auto_130541 ?auto_130546 ) ) ( not ( = ?auto_130542 ?auto_130546 ) ) ( not ( = ?auto_130543 ?auto_130546 ) ) ( ON ?auto_130543 ?auto_130544 ) ( ON ?auto_130542 ?auto_130543 ) ( ON ?auto_130541 ?auto_130542 ) ( ON ?auto_130540 ?auto_130541 ) ( CLEAR ?auto_130540 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_130546 ?auto_130547 ?auto_130545 ?auto_130544 ?auto_130543 ?auto_130542 ?auto_130541 )
      ( MAKE-6PILE ?auto_130540 ?auto_130541 ?auto_130542 ?auto_130543 ?auto_130544 ?auto_130545 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_130549 - BLOCK
    )
    :vars
    (
      ?auto_130550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130550 ?auto_130549 ) ( CLEAR ?auto_130550 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_130549 ) ( not ( = ?auto_130549 ?auto_130550 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_130550 ?auto_130549 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_130551 - BLOCK
    )
    :vars
    (
      ?auto_130552 - BLOCK
      ?auto_130553 - BLOCK
      ?auto_130554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130552 ?auto_130551 ) ( CLEAR ?auto_130552 ) ( ON-TABLE ?auto_130551 ) ( not ( = ?auto_130551 ?auto_130552 ) ) ( HOLDING ?auto_130553 ) ( CLEAR ?auto_130554 ) ( not ( = ?auto_130551 ?auto_130553 ) ) ( not ( = ?auto_130551 ?auto_130554 ) ) ( not ( = ?auto_130552 ?auto_130553 ) ) ( not ( = ?auto_130552 ?auto_130554 ) ) ( not ( = ?auto_130553 ?auto_130554 ) ) )
    :subtasks
    ( ( !STACK ?auto_130553 ?auto_130554 )
      ( MAKE-1PILE ?auto_130551 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_130555 - BLOCK
    )
    :vars
    (
      ?auto_130556 - BLOCK
      ?auto_130558 - BLOCK
      ?auto_130557 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130556 ?auto_130555 ) ( ON-TABLE ?auto_130555 ) ( not ( = ?auto_130555 ?auto_130556 ) ) ( CLEAR ?auto_130558 ) ( not ( = ?auto_130555 ?auto_130557 ) ) ( not ( = ?auto_130555 ?auto_130558 ) ) ( not ( = ?auto_130556 ?auto_130557 ) ) ( not ( = ?auto_130556 ?auto_130558 ) ) ( not ( = ?auto_130557 ?auto_130558 ) ) ( ON ?auto_130557 ?auto_130556 ) ( CLEAR ?auto_130557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_130555 ?auto_130556 )
      ( MAKE-1PILE ?auto_130555 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_130559 - BLOCK
    )
    :vars
    (
      ?auto_130560 - BLOCK
      ?auto_130561 - BLOCK
      ?auto_130562 - BLOCK
      ?auto_130565 - BLOCK
      ?auto_130566 - BLOCK
      ?auto_130563 - BLOCK
      ?auto_130564 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130560 ?auto_130559 ) ( ON-TABLE ?auto_130559 ) ( not ( = ?auto_130559 ?auto_130560 ) ) ( not ( = ?auto_130559 ?auto_130561 ) ) ( not ( = ?auto_130559 ?auto_130562 ) ) ( not ( = ?auto_130560 ?auto_130561 ) ) ( not ( = ?auto_130560 ?auto_130562 ) ) ( not ( = ?auto_130561 ?auto_130562 ) ) ( ON ?auto_130561 ?auto_130560 ) ( CLEAR ?auto_130561 ) ( HOLDING ?auto_130562 ) ( CLEAR ?auto_130565 ) ( ON-TABLE ?auto_130566 ) ( ON ?auto_130563 ?auto_130566 ) ( ON ?auto_130564 ?auto_130563 ) ( ON ?auto_130565 ?auto_130564 ) ( not ( = ?auto_130566 ?auto_130563 ) ) ( not ( = ?auto_130566 ?auto_130564 ) ) ( not ( = ?auto_130566 ?auto_130565 ) ) ( not ( = ?auto_130566 ?auto_130562 ) ) ( not ( = ?auto_130563 ?auto_130564 ) ) ( not ( = ?auto_130563 ?auto_130565 ) ) ( not ( = ?auto_130563 ?auto_130562 ) ) ( not ( = ?auto_130564 ?auto_130565 ) ) ( not ( = ?auto_130564 ?auto_130562 ) ) ( not ( = ?auto_130565 ?auto_130562 ) ) ( not ( = ?auto_130559 ?auto_130565 ) ) ( not ( = ?auto_130559 ?auto_130566 ) ) ( not ( = ?auto_130559 ?auto_130563 ) ) ( not ( = ?auto_130559 ?auto_130564 ) ) ( not ( = ?auto_130560 ?auto_130565 ) ) ( not ( = ?auto_130560 ?auto_130566 ) ) ( not ( = ?auto_130560 ?auto_130563 ) ) ( not ( = ?auto_130560 ?auto_130564 ) ) ( not ( = ?auto_130561 ?auto_130565 ) ) ( not ( = ?auto_130561 ?auto_130566 ) ) ( not ( = ?auto_130561 ?auto_130563 ) ) ( not ( = ?auto_130561 ?auto_130564 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_130566 ?auto_130563 ?auto_130564 ?auto_130565 ?auto_130562 )
      ( MAKE-1PILE ?auto_130559 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_130567 - BLOCK
    )
    :vars
    (
      ?auto_130569 - BLOCK
      ?auto_130572 - BLOCK
      ?auto_130574 - BLOCK
      ?auto_130571 - BLOCK
      ?auto_130568 - BLOCK
      ?auto_130570 - BLOCK
      ?auto_130573 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130569 ?auto_130567 ) ( ON-TABLE ?auto_130567 ) ( not ( = ?auto_130567 ?auto_130569 ) ) ( not ( = ?auto_130567 ?auto_130572 ) ) ( not ( = ?auto_130567 ?auto_130574 ) ) ( not ( = ?auto_130569 ?auto_130572 ) ) ( not ( = ?auto_130569 ?auto_130574 ) ) ( not ( = ?auto_130572 ?auto_130574 ) ) ( ON ?auto_130572 ?auto_130569 ) ( CLEAR ?auto_130571 ) ( ON-TABLE ?auto_130568 ) ( ON ?auto_130570 ?auto_130568 ) ( ON ?auto_130573 ?auto_130570 ) ( ON ?auto_130571 ?auto_130573 ) ( not ( = ?auto_130568 ?auto_130570 ) ) ( not ( = ?auto_130568 ?auto_130573 ) ) ( not ( = ?auto_130568 ?auto_130571 ) ) ( not ( = ?auto_130568 ?auto_130574 ) ) ( not ( = ?auto_130570 ?auto_130573 ) ) ( not ( = ?auto_130570 ?auto_130571 ) ) ( not ( = ?auto_130570 ?auto_130574 ) ) ( not ( = ?auto_130573 ?auto_130571 ) ) ( not ( = ?auto_130573 ?auto_130574 ) ) ( not ( = ?auto_130571 ?auto_130574 ) ) ( not ( = ?auto_130567 ?auto_130571 ) ) ( not ( = ?auto_130567 ?auto_130568 ) ) ( not ( = ?auto_130567 ?auto_130570 ) ) ( not ( = ?auto_130567 ?auto_130573 ) ) ( not ( = ?auto_130569 ?auto_130571 ) ) ( not ( = ?auto_130569 ?auto_130568 ) ) ( not ( = ?auto_130569 ?auto_130570 ) ) ( not ( = ?auto_130569 ?auto_130573 ) ) ( not ( = ?auto_130572 ?auto_130571 ) ) ( not ( = ?auto_130572 ?auto_130568 ) ) ( not ( = ?auto_130572 ?auto_130570 ) ) ( not ( = ?auto_130572 ?auto_130573 ) ) ( ON ?auto_130574 ?auto_130572 ) ( CLEAR ?auto_130574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_130567 ?auto_130569 ?auto_130572 )
      ( MAKE-1PILE ?auto_130567 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_130575 - BLOCK
    )
    :vars
    (
      ?auto_130579 - BLOCK
      ?auto_130577 - BLOCK
      ?auto_130580 - BLOCK
      ?auto_130582 - BLOCK
      ?auto_130578 - BLOCK
      ?auto_130576 - BLOCK
      ?auto_130581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130579 ?auto_130575 ) ( ON-TABLE ?auto_130575 ) ( not ( = ?auto_130575 ?auto_130579 ) ) ( not ( = ?auto_130575 ?auto_130577 ) ) ( not ( = ?auto_130575 ?auto_130580 ) ) ( not ( = ?auto_130579 ?auto_130577 ) ) ( not ( = ?auto_130579 ?auto_130580 ) ) ( not ( = ?auto_130577 ?auto_130580 ) ) ( ON ?auto_130577 ?auto_130579 ) ( ON-TABLE ?auto_130582 ) ( ON ?auto_130578 ?auto_130582 ) ( ON ?auto_130576 ?auto_130578 ) ( not ( = ?auto_130582 ?auto_130578 ) ) ( not ( = ?auto_130582 ?auto_130576 ) ) ( not ( = ?auto_130582 ?auto_130581 ) ) ( not ( = ?auto_130582 ?auto_130580 ) ) ( not ( = ?auto_130578 ?auto_130576 ) ) ( not ( = ?auto_130578 ?auto_130581 ) ) ( not ( = ?auto_130578 ?auto_130580 ) ) ( not ( = ?auto_130576 ?auto_130581 ) ) ( not ( = ?auto_130576 ?auto_130580 ) ) ( not ( = ?auto_130581 ?auto_130580 ) ) ( not ( = ?auto_130575 ?auto_130581 ) ) ( not ( = ?auto_130575 ?auto_130582 ) ) ( not ( = ?auto_130575 ?auto_130578 ) ) ( not ( = ?auto_130575 ?auto_130576 ) ) ( not ( = ?auto_130579 ?auto_130581 ) ) ( not ( = ?auto_130579 ?auto_130582 ) ) ( not ( = ?auto_130579 ?auto_130578 ) ) ( not ( = ?auto_130579 ?auto_130576 ) ) ( not ( = ?auto_130577 ?auto_130581 ) ) ( not ( = ?auto_130577 ?auto_130582 ) ) ( not ( = ?auto_130577 ?auto_130578 ) ) ( not ( = ?auto_130577 ?auto_130576 ) ) ( ON ?auto_130580 ?auto_130577 ) ( CLEAR ?auto_130580 ) ( HOLDING ?auto_130581 ) ( CLEAR ?auto_130576 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_130582 ?auto_130578 ?auto_130576 ?auto_130581 )
      ( MAKE-1PILE ?auto_130575 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_130583 - BLOCK
    )
    :vars
    (
      ?auto_130584 - BLOCK
      ?auto_130585 - BLOCK
      ?auto_130587 - BLOCK
      ?auto_130588 - BLOCK
      ?auto_130586 - BLOCK
      ?auto_130589 - BLOCK
      ?auto_130590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130584 ?auto_130583 ) ( ON-TABLE ?auto_130583 ) ( not ( = ?auto_130583 ?auto_130584 ) ) ( not ( = ?auto_130583 ?auto_130585 ) ) ( not ( = ?auto_130583 ?auto_130587 ) ) ( not ( = ?auto_130584 ?auto_130585 ) ) ( not ( = ?auto_130584 ?auto_130587 ) ) ( not ( = ?auto_130585 ?auto_130587 ) ) ( ON ?auto_130585 ?auto_130584 ) ( ON-TABLE ?auto_130588 ) ( ON ?auto_130586 ?auto_130588 ) ( ON ?auto_130589 ?auto_130586 ) ( not ( = ?auto_130588 ?auto_130586 ) ) ( not ( = ?auto_130588 ?auto_130589 ) ) ( not ( = ?auto_130588 ?auto_130590 ) ) ( not ( = ?auto_130588 ?auto_130587 ) ) ( not ( = ?auto_130586 ?auto_130589 ) ) ( not ( = ?auto_130586 ?auto_130590 ) ) ( not ( = ?auto_130586 ?auto_130587 ) ) ( not ( = ?auto_130589 ?auto_130590 ) ) ( not ( = ?auto_130589 ?auto_130587 ) ) ( not ( = ?auto_130590 ?auto_130587 ) ) ( not ( = ?auto_130583 ?auto_130590 ) ) ( not ( = ?auto_130583 ?auto_130588 ) ) ( not ( = ?auto_130583 ?auto_130586 ) ) ( not ( = ?auto_130583 ?auto_130589 ) ) ( not ( = ?auto_130584 ?auto_130590 ) ) ( not ( = ?auto_130584 ?auto_130588 ) ) ( not ( = ?auto_130584 ?auto_130586 ) ) ( not ( = ?auto_130584 ?auto_130589 ) ) ( not ( = ?auto_130585 ?auto_130590 ) ) ( not ( = ?auto_130585 ?auto_130588 ) ) ( not ( = ?auto_130585 ?auto_130586 ) ) ( not ( = ?auto_130585 ?auto_130589 ) ) ( ON ?auto_130587 ?auto_130585 ) ( CLEAR ?auto_130589 ) ( ON ?auto_130590 ?auto_130587 ) ( CLEAR ?auto_130590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_130583 ?auto_130584 ?auto_130585 ?auto_130587 )
      ( MAKE-1PILE ?auto_130583 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_130591 - BLOCK
    )
    :vars
    (
      ?auto_130597 - BLOCK
      ?auto_130598 - BLOCK
      ?auto_130594 - BLOCK
      ?auto_130592 - BLOCK
      ?auto_130593 - BLOCK
      ?auto_130596 - BLOCK
      ?auto_130595 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130597 ?auto_130591 ) ( ON-TABLE ?auto_130591 ) ( not ( = ?auto_130591 ?auto_130597 ) ) ( not ( = ?auto_130591 ?auto_130598 ) ) ( not ( = ?auto_130591 ?auto_130594 ) ) ( not ( = ?auto_130597 ?auto_130598 ) ) ( not ( = ?auto_130597 ?auto_130594 ) ) ( not ( = ?auto_130598 ?auto_130594 ) ) ( ON ?auto_130598 ?auto_130597 ) ( ON-TABLE ?auto_130592 ) ( ON ?auto_130593 ?auto_130592 ) ( not ( = ?auto_130592 ?auto_130593 ) ) ( not ( = ?auto_130592 ?auto_130596 ) ) ( not ( = ?auto_130592 ?auto_130595 ) ) ( not ( = ?auto_130592 ?auto_130594 ) ) ( not ( = ?auto_130593 ?auto_130596 ) ) ( not ( = ?auto_130593 ?auto_130595 ) ) ( not ( = ?auto_130593 ?auto_130594 ) ) ( not ( = ?auto_130596 ?auto_130595 ) ) ( not ( = ?auto_130596 ?auto_130594 ) ) ( not ( = ?auto_130595 ?auto_130594 ) ) ( not ( = ?auto_130591 ?auto_130595 ) ) ( not ( = ?auto_130591 ?auto_130592 ) ) ( not ( = ?auto_130591 ?auto_130593 ) ) ( not ( = ?auto_130591 ?auto_130596 ) ) ( not ( = ?auto_130597 ?auto_130595 ) ) ( not ( = ?auto_130597 ?auto_130592 ) ) ( not ( = ?auto_130597 ?auto_130593 ) ) ( not ( = ?auto_130597 ?auto_130596 ) ) ( not ( = ?auto_130598 ?auto_130595 ) ) ( not ( = ?auto_130598 ?auto_130592 ) ) ( not ( = ?auto_130598 ?auto_130593 ) ) ( not ( = ?auto_130598 ?auto_130596 ) ) ( ON ?auto_130594 ?auto_130598 ) ( ON ?auto_130595 ?auto_130594 ) ( CLEAR ?auto_130595 ) ( HOLDING ?auto_130596 ) ( CLEAR ?auto_130593 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_130592 ?auto_130593 ?auto_130596 )
      ( MAKE-1PILE ?auto_130591 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_130599 - BLOCK
    )
    :vars
    (
      ?auto_130603 - BLOCK
      ?auto_130606 - BLOCK
      ?auto_130601 - BLOCK
      ?auto_130602 - BLOCK
      ?auto_130600 - BLOCK
      ?auto_130604 - BLOCK
      ?auto_130605 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130603 ?auto_130599 ) ( ON-TABLE ?auto_130599 ) ( not ( = ?auto_130599 ?auto_130603 ) ) ( not ( = ?auto_130599 ?auto_130606 ) ) ( not ( = ?auto_130599 ?auto_130601 ) ) ( not ( = ?auto_130603 ?auto_130606 ) ) ( not ( = ?auto_130603 ?auto_130601 ) ) ( not ( = ?auto_130606 ?auto_130601 ) ) ( ON ?auto_130606 ?auto_130603 ) ( ON-TABLE ?auto_130602 ) ( ON ?auto_130600 ?auto_130602 ) ( not ( = ?auto_130602 ?auto_130600 ) ) ( not ( = ?auto_130602 ?auto_130604 ) ) ( not ( = ?auto_130602 ?auto_130605 ) ) ( not ( = ?auto_130602 ?auto_130601 ) ) ( not ( = ?auto_130600 ?auto_130604 ) ) ( not ( = ?auto_130600 ?auto_130605 ) ) ( not ( = ?auto_130600 ?auto_130601 ) ) ( not ( = ?auto_130604 ?auto_130605 ) ) ( not ( = ?auto_130604 ?auto_130601 ) ) ( not ( = ?auto_130605 ?auto_130601 ) ) ( not ( = ?auto_130599 ?auto_130605 ) ) ( not ( = ?auto_130599 ?auto_130602 ) ) ( not ( = ?auto_130599 ?auto_130600 ) ) ( not ( = ?auto_130599 ?auto_130604 ) ) ( not ( = ?auto_130603 ?auto_130605 ) ) ( not ( = ?auto_130603 ?auto_130602 ) ) ( not ( = ?auto_130603 ?auto_130600 ) ) ( not ( = ?auto_130603 ?auto_130604 ) ) ( not ( = ?auto_130606 ?auto_130605 ) ) ( not ( = ?auto_130606 ?auto_130602 ) ) ( not ( = ?auto_130606 ?auto_130600 ) ) ( not ( = ?auto_130606 ?auto_130604 ) ) ( ON ?auto_130601 ?auto_130606 ) ( ON ?auto_130605 ?auto_130601 ) ( CLEAR ?auto_130600 ) ( ON ?auto_130604 ?auto_130605 ) ( CLEAR ?auto_130604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_130599 ?auto_130603 ?auto_130606 ?auto_130601 ?auto_130605 )
      ( MAKE-1PILE ?auto_130599 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_130607 - BLOCK
    )
    :vars
    (
      ?auto_130612 - BLOCK
      ?auto_130609 - BLOCK
      ?auto_130608 - BLOCK
      ?auto_130614 - BLOCK
      ?auto_130613 - BLOCK
      ?auto_130610 - BLOCK
      ?auto_130611 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130612 ?auto_130607 ) ( ON-TABLE ?auto_130607 ) ( not ( = ?auto_130607 ?auto_130612 ) ) ( not ( = ?auto_130607 ?auto_130609 ) ) ( not ( = ?auto_130607 ?auto_130608 ) ) ( not ( = ?auto_130612 ?auto_130609 ) ) ( not ( = ?auto_130612 ?auto_130608 ) ) ( not ( = ?auto_130609 ?auto_130608 ) ) ( ON ?auto_130609 ?auto_130612 ) ( ON-TABLE ?auto_130614 ) ( not ( = ?auto_130614 ?auto_130613 ) ) ( not ( = ?auto_130614 ?auto_130610 ) ) ( not ( = ?auto_130614 ?auto_130611 ) ) ( not ( = ?auto_130614 ?auto_130608 ) ) ( not ( = ?auto_130613 ?auto_130610 ) ) ( not ( = ?auto_130613 ?auto_130611 ) ) ( not ( = ?auto_130613 ?auto_130608 ) ) ( not ( = ?auto_130610 ?auto_130611 ) ) ( not ( = ?auto_130610 ?auto_130608 ) ) ( not ( = ?auto_130611 ?auto_130608 ) ) ( not ( = ?auto_130607 ?auto_130611 ) ) ( not ( = ?auto_130607 ?auto_130614 ) ) ( not ( = ?auto_130607 ?auto_130613 ) ) ( not ( = ?auto_130607 ?auto_130610 ) ) ( not ( = ?auto_130612 ?auto_130611 ) ) ( not ( = ?auto_130612 ?auto_130614 ) ) ( not ( = ?auto_130612 ?auto_130613 ) ) ( not ( = ?auto_130612 ?auto_130610 ) ) ( not ( = ?auto_130609 ?auto_130611 ) ) ( not ( = ?auto_130609 ?auto_130614 ) ) ( not ( = ?auto_130609 ?auto_130613 ) ) ( not ( = ?auto_130609 ?auto_130610 ) ) ( ON ?auto_130608 ?auto_130609 ) ( ON ?auto_130611 ?auto_130608 ) ( ON ?auto_130610 ?auto_130611 ) ( CLEAR ?auto_130610 ) ( HOLDING ?auto_130613 ) ( CLEAR ?auto_130614 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_130614 ?auto_130613 )
      ( MAKE-1PILE ?auto_130607 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_130615 - BLOCK
    )
    :vars
    (
      ?auto_130622 - BLOCK
      ?auto_130621 - BLOCK
      ?auto_130618 - BLOCK
      ?auto_130616 - BLOCK
      ?auto_130617 - BLOCK
      ?auto_130620 - BLOCK
      ?auto_130619 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130622 ?auto_130615 ) ( ON-TABLE ?auto_130615 ) ( not ( = ?auto_130615 ?auto_130622 ) ) ( not ( = ?auto_130615 ?auto_130621 ) ) ( not ( = ?auto_130615 ?auto_130618 ) ) ( not ( = ?auto_130622 ?auto_130621 ) ) ( not ( = ?auto_130622 ?auto_130618 ) ) ( not ( = ?auto_130621 ?auto_130618 ) ) ( ON ?auto_130621 ?auto_130622 ) ( ON-TABLE ?auto_130616 ) ( not ( = ?auto_130616 ?auto_130617 ) ) ( not ( = ?auto_130616 ?auto_130620 ) ) ( not ( = ?auto_130616 ?auto_130619 ) ) ( not ( = ?auto_130616 ?auto_130618 ) ) ( not ( = ?auto_130617 ?auto_130620 ) ) ( not ( = ?auto_130617 ?auto_130619 ) ) ( not ( = ?auto_130617 ?auto_130618 ) ) ( not ( = ?auto_130620 ?auto_130619 ) ) ( not ( = ?auto_130620 ?auto_130618 ) ) ( not ( = ?auto_130619 ?auto_130618 ) ) ( not ( = ?auto_130615 ?auto_130619 ) ) ( not ( = ?auto_130615 ?auto_130616 ) ) ( not ( = ?auto_130615 ?auto_130617 ) ) ( not ( = ?auto_130615 ?auto_130620 ) ) ( not ( = ?auto_130622 ?auto_130619 ) ) ( not ( = ?auto_130622 ?auto_130616 ) ) ( not ( = ?auto_130622 ?auto_130617 ) ) ( not ( = ?auto_130622 ?auto_130620 ) ) ( not ( = ?auto_130621 ?auto_130619 ) ) ( not ( = ?auto_130621 ?auto_130616 ) ) ( not ( = ?auto_130621 ?auto_130617 ) ) ( not ( = ?auto_130621 ?auto_130620 ) ) ( ON ?auto_130618 ?auto_130621 ) ( ON ?auto_130619 ?auto_130618 ) ( ON ?auto_130620 ?auto_130619 ) ( CLEAR ?auto_130616 ) ( ON ?auto_130617 ?auto_130620 ) ( CLEAR ?auto_130617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_130615 ?auto_130622 ?auto_130621 ?auto_130618 ?auto_130619 ?auto_130620 )
      ( MAKE-1PILE ?auto_130615 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_130623 - BLOCK
    )
    :vars
    (
      ?auto_130627 - BLOCK
      ?auto_130625 - BLOCK
      ?auto_130630 - BLOCK
      ?auto_130628 - BLOCK
      ?auto_130624 - BLOCK
      ?auto_130626 - BLOCK
      ?auto_130629 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130627 ?auto_130623 ) ( ON-TABLE ?auto_130623 ) ( not ( = ?auto_130623 ?auto_130627 ) ) ( not ( = ?auto_130623 ?auto_130625 ) ) ( not ( = ?auto_130623 ?auto_130630 ) ) ( not ( = ?auto_130627 ?auto_130625 ) ) ( not ( = ?auto_130627 ?auto_130630 ) ) ( not ( = ?auto_130625 ?auto_130630 ) ) ( ON ?auto_130625 ?auto_130627 ) ( not ( = ?auto_130628 ?auto_130624 ) ) ( not ( = ?auto_130628 ?auto_130626 ) ) ( not ( = ?auto_130628 ?auto_130629 ) ) ( not ( = ?auto_130628 ?auto_130630 ) ) ( not ( = ?auto_130624 ?auto_130626 ) ) ( not ( = ?auto_130624 ?auto_130629 ) ) ( not ( = ?auto_130624 ?auto_130630 ) ) ( not ( = ?auto_130626 ?auto_130629 ) ) ( not ( = ?auto_130626 ?auto_130630 ) ) ( not ( = ?auto_130629 ?auto_130630 ) ) ( not ( = ?auto_130623 ?auto_130629 ) ) ( not ( = ?auto_130623 ?auto_130628 ) ) ( not ( = ?auto_130623 ?auto_130624 ) ) ( not ( = ?auto_130623 ?auto_130626 ) ) ( not ( = ?auto_130627 ?auto_130629 ) ) ( not ( = ?auto_130627 ?auto_130628 ) ) ( not ( = ?auto_130627 ?auto_130624 ) ) ( not ( = ?auto_130627 ?auto_130626 ) ) ( not ( = ?auto_130625 ?auto_130629 ) ) ( not ( = ?auto_130625 ?auto_130628 ) ) ( not ( = ?auto_130625 ?auto_130624 ) ) ( not ( = ?auto_130625 ?auto_130626 ) ) ( ON ?auto_130630 ?auto_130625 ) ( ON ?auto_130629 ?auto_130630 ) ( ON ?auto_130626 ?auto_130629 ) ( ON ?auto_130624 ?auto_130626 ) ( CLEAR ?auto_130624 ) ( HOLDING ?auto_130628 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_130628 )
      ( MAKE-1PILE ?auto_130623 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_130631 - BLOCK
    )
    :vars
    (
      ?auto_130635 - BLOCK
      ?auto_130632 - BLOCK
      ?auto_130637 - BLOCK
      ?auto_130633 - BLOCK
      ?auto_130636 - BLOCK
      ?auto_130634 - BLOCK
      ?auto_130638 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130635 ?auto_130631 ) ( ON-TABLE ?auto_130631 ) ( not ( = ?auto_130631 ?auto_130635 ) ) ( not ( = ?auto_130631 ?auto_130632 ) ) ( not ( = ?auto_130631 ?auto_130637 ) ) ( not ( = ?auto_130635 ?auto_130632 ) ) ( not ( = ?auto_130635 ?auto_130637 ) ) ( not ( = ?auto_130632 ?auto_130637 ) ) ( ON ?auto_130632 ?auto_130635 ) ( not ( = ?auto_130633 ?auto_130636 ) ) ( not ( = ?auto_130633 ?auto_130634 ) ) ( not ( = ?auto_130633 ?auto_130638 ) ) ( not ( = ?auto_130633 ?auto_130637 ) ) ( not ( = ?auto_130636 ?auto_130634 ) ) ( not ( = ?auto_130636 ?auto_130638 ) ) ( not ( = ?auto_130636 ?auto_130637 ) ) ( not ( = ?auto_130634 ?auto_130638 ) ) ( not ( = ?auto_130634 ?auto_130637 ) ) ( not ( = ?auto_130638 ?auto_130637 ) ) ( not ( = ?auto_130631 ?auto_130638 ) ) ( not ( = ?auto_130631 ?auto_130633 ) ) ( not ( = ?auto_130631 ?auto_130636 ) ) ( not ( = ?auto_130631 ?auto_130634 ) ) ( not ( = ?auto_130635 ?auto_130638 ) ) ( not ( = ?auto_130635 ?auto_130633 ) ) ( not ( = ?auto_130635 ?auto_130636 ) ) ( not ( = ?auto_130635 ?auto_130634 ) ) ( not ( = ?auto_130632 ?auto_130638 ) ) ( not ( = ?auto_130632 ?auto_130633 ) ) ( not ( = ?auto_130632 ?auto_130636 ) ) ( not ( = ?auto_130632 ?auto_130634 ) ) ( ON ?auto_130637 ?auto_130632 ) ( ON ?auto_130638 ?auto_130637 ) ( ON ?auto_130634 ?auto_130638 ) ( ON ?auto_130636 ?auto_130634 ) ( ON ?auto_130633 ?auto_130636 ) ( CLEAR ?auto_130633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_130631 ?auto_130635 ?auto_130632 ?auto_130637 ?auto_130638 ?auto_130634 ?auto_130636 )
      ( MAKE-1PILE ?auto_130631 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_130646 - BLOCK
      ?auto_130647 - BLOCK
      ?auto_130648 - BLOCK
      ?auto_130649 - BLOCK
      ?auto_130650 - BLOCK
      ?auto_130651 - BLOCK
      ?auto_130652 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_130652 ) ( CLEAR ?auto_130651 ) ( ON-TABLE ?auto_130646 ) ( ON ?auto_130647 ?auto_130646 ) ( ON ?auto_130648 ?auto_130647 ) ( ON ?auto_130649 ?auto_130648 ) ( ON ?auto_130650 ?auto_130649 ) ( ON ?auto_130651 ?auto_130650 ) ( not ( = ?auto_130646 ?auto_130647 ) ) ( not ( = ?auto_130646 ?auto_130648 ) ) ( not ( = ?auto_130646 ?auto_130649 ) ) ( not ( = ?auto_130646 ?auto_130650 ) ) ( not ( = ?auto_130646 ?auto_130651 ) ) ( not ( = ?auto_130646 ?auto_130652 ) ) ( not ( = ?auto_130647 ?auto_130648 ) ) ( not ( = ?auto_130647 ?auto_130649 ) ) ( not ( = ?auto_130647 ?auto_130650 ) ) ( not ( = ?auto_130647 ?auto_130651 ) ) ( not ( = ?auto_130647 ?auto_130652 ) ) ( not ( = ?auto_130648 ?auto_130649 ) ) ( not ( = ?auto_130648 ?auto_130650 ) ) ( not ( = ?auto_130648 ?auto_130651 ) ) ( not ( = ?auto_130648 ?auto_130652 ) ) ( not ( = ?auto_130649 ?auto_130650 ) ) ( not ( = ?auto_130649 ?auto_130651 ) ) ( not ( = ?auto_130649 ?auto_130652 ) ) ( not ( = ?auto_130650 ?auto_130651 ) ) ( not ( = ?auto_130650 ?auto_130652 ) ) ( not ( = ?auto_130651 ?auto_130652 ) ) )
    :subtasks
    ( ( !STACK ?auto_130652 ?auto_130651 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_130653 - BLOCK
      ?auto_130654 - BLOCK
      ?auto_130655 - BLOCK
      ?auto_130656 - BLOCK
      ?auto_130657 - BLOCK
      ?auto_130658 - BLOCK
      ?auto_130659 - BLOCK
    )
    :vars
    (
      ?auto_130660 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_130658 ) ( ON-TABLE ?auto_130653 ) ( ON ?auto_130654 ?auto_130653 ) ( ON ?auto_130655 ?auto_130654 ) ( ON ?auto_130656 ?auto_130655 ) ( ON ?auto_130657 ?auto_130656 ) ( ON ?auto_130658 ?auto_130657 ) ( not ( = ?auto_130653 ?auto_130654 ) ) ( not ( = ?auto_130653 ?auto_130655 ) ) ( not ( = ?auto_130653 ?auto_130656 ) ) ( not ( = ?auto_130653 ?auto_130657 ) ) ( not ( = ?auto_130653 ?auto_130658 ) ) ( not ( = ?auto_130653 ?auto_130659 ) ) ( not ( = ?auto_130654 ?auto_130655 ) ) ( not ( = ?auto_130654 ?auto_130656 ) ) ( not ( = ?auto_130654 ?auto_130657 ) ) ( not ( = ?auto_130654 ?auto_130658 ) ) ( not ( = ?auto_130654 ?auto_130659 ) ) ( not ( = ?auto_130655 ?auto_130656 ) ) ( not ( = ?auto_130655 ?auto_130657 ) ) ( not ( = ?auto_130655 ?auto_130658 ) ) ( not ( = ?auto_130655 ?auto_130659 ) ) ( not ( = ?auto_130656 ?auto_130657 ) ) ( not ( = ?auto_130656 ?auto_130658 ) ) ( not ( = ?auto_130656 ?auto_130659 ) ) ( not ( = ?auto_130657 ?auto_130658 ) ) ( not ( = ?auto_130657 ?auto_130659 ) ) ( not ( = ?auto_130658 ?auto_130659 ) ) ( ON ?auto_130659 ?auto_130660 ) ( CLEAR ?auto_130659 ) ( HAND-EMPTY ) ( not ( = ?auto_130653 ?auto_130660 ) ) ( not ( = ?auto_130654 ?auto_130660 ) ) ( not ( = ?auto_130655 ?auto_130660 ) ) ( not ( = ?auto_130656 ?auto_130660 ) ) ( not ( = ?auto_130657 ?auto_130660 ) ) ( not ( = ?auto_130658 ?auto_130660 ) ) ( not ( = ?auto_130659 ?auto_130660 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_130659 ?auto_130660 )
      ( MAKE-7PILE ?auto_130653 ?auto_130654 ?auto_130655 ?auto_130656 ?auto_130657 ?auto_130658 ?auto_130659 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_130661 - BLOCK
      ?auto_130662 - BLOCK
      ?auto_130663 - BLOCK
      ?auto_130664 - BLOCK
      ?auto_130665 - BLOCK
      ?auto_130666 - BLOCK
      ?auto_130667 - BLOCK
    )
    :vars
    (
      ?auto_130668 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130661 ) ( ON ?auto_130662 ?auto_130661 ) ( ON ?auto_130663 ?auto_130662 ) ( ON ?auto_130664 ?auto_130663 ) ( ON ?auto_130665 ?auto_130664 ) ( not ( = ?auto_130661 ?auto_130662 ) ) ( not ( = ?auto_130661 ?auto_130663 ) ) ( not ( = ?auto_130661 ?auto_130664 ) ) ( not ( = ?auto_130661 ?auto_130665 ) ) ( not ( = ?auto_130661 ?auto_130666 ) ) ( not ( = ?auto_130661 ?auto_130667 ) ) ( not ( = ?auto_130662 ?auto_130663 ) ) ( not ( = ?auto_130662 ?auto_130664 ) ) ( not ( = ?auto_130662 ?auto_130665 ) ) ( not ( = ?auto_130662 ?auto_130666 ) ) ( not ( = ?auto_130662 ?auto_130667 ) ) ( not ( = ?auto_130663 ?auto_130664 ) ) ( not ( = ?auto_130663 ?auto_130665 ) ) ( not ( = ?auto_130663 ?auto_130666 ) ) ( not ( = ?auto_130663 ?auto_130667 ) ) ( not ( = ?auto_130664 ?auto_130665 ) ) ( not ( = ?auto_130664 ?auto_130666 ) ) ( not ( = ?auto_130664 ?auto_130667 ) ) ( not ( = ?auto_130665 ?auto_130666 ) ) ( not ( = ?auto_130665 ?auto_130667 ) ) ( not ( = ?auto_130666 ?auto_130667 ) ) ( ON ?auto_130667 ?auto_130668 ) ( CLEAR ?auto_130667 ) ( not ( = ?auto_130661 ?auto_130668 ) ) ( not ( = ?auto_130662 ?auto_130668 ) ) ( not ( = ?auto_130663 ?auto_130668 ) ) ( not ( = ?auto_130664 ?auto_130668 ) ) ( not ( = ?auto_130665 ?auto_130668 ) ) ( not ( = ?auto_130666 ?auto_130668 ) ) ( not ( = ?auto_130667 ?auto_130668 ) ) ( HOLDING ?auto_130666 ) ( CLEAR ?auto_130665 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_130661 ?auto_130662 ?auto_130663 ?auto_130664 ?auto_130665 ?auto_130666 )
      ( MAKE-7PILE ?auto_130661 ?auto_130662 ?auto_130663 ?auto_130664 ?auto_130665 ?auto_130666 ?auto_130667 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_130669 - BLOCK
      ?auto_130670 - BLOCK
      ?auto_130671 - BLOCK
      ?auto_130672 - BLOCK
      ?auto_130673 - BLOCK
      ?auto_130674 - BLOCK
      ?auto_130675 - BLOCK
    )
    :vars
    (
      ?auto_130676 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130669 ) ( ON ?auto_130670 ?auto_130669 ) ( ON ?auto_130671 ?auto_130670 ) ( ON ?auto_130672 ?auto_130671 ) ( ON ?auto_130673 ?auto_130672 ) ( not ( = ?auto_130669 ?auto_130670 ) ) ( not ( = ?auto_130669 ?auto_130671 ) ) ( not ( = ?auto_130669 ?auto_130672 ) ) ( not ( = ?auto_130669 ?auto_130673 ) ) ( not ( = ?auto_130669 ?auto_130674 ) ) ( not ( = ?auto_130669 ?auto_130675 ) ) ( not ( = ?auto_130670 ?auto_130671 ) ) ( not ( = ?auto_130670 ?auto_130672 ) ) ( not ( = ?auto_130670 ?auto_130673 ) ) ( not ( = ?auto_130670 ?auto_130674 ) ) ( not ( = ?auto_130670 ?auto_130675 ) ) ( not ( = ?auto_130671 ?auto_130672 ) ) ( not ( = ?auto_130671 ?auto_130673 ) ) ( not ( = ?auto_130671 ?auto_130674 ) ) ( not ( = ?auto_130671 ?auto_130675 ) ) ( not ( = ?auto_130672 ?auto_130673 ) ) ( not ( = ?auto_130672 ?auto_130674 ) ) ( not ( = ?auto_130672 ?auto_130675 ) ) ( not ( = ?auto_130673 ?auto_130674 ) ) ( not ( = ?auto_130673 ?auto_130675 ) ) ( not ( = ?auto_130674 ?auto_130675 ) ) ( ON ?auto_130675 ?auto_130676 ) ( not ( = ?auto_130669 ?auto_130676 ) ) ( not ( = ?auto_130670 ?auto_130676 ) ) ( not ( = ?auto_130671 ?auto_130676 ) ) ( not ( = ?auto_130672 ?auto_130676 ) ) ( not ( = ?auto_130673 ?auto_130676 ) ) ( not ( = ?auto_130674 ?auto_130676 ) ) ( not ( = ?auto_130675 ?auto_130676 ) ) ( CLEAR ?auto_130673 ) ( ON ?auto_130674 ?auto_130675 ) ( CLEAR ?auto_130674 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_130676 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_130676 ?auto_130675 )
      ( MAKE-7PILE ?auto_130669 ?auto_130670 ?auto_130671 ?auto_130672 ?auto_130673 ?auto_130674 ?auto_130675 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_130677 - BLOCK
      ?auto_130678 - BLOCK
      ?auto_130679 - BLOCK
      ?auto_130680 - BLOCK
      ?auto_130681 - BLOCK
      ?auto_130682 - BLOCK
      ?auto_130683 - BLOCK
    )
    :vars
    (
      ?auto_130684 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130677 ) ( ON ?auto_130678 ?auto_130677 ) ( ON ?auto_130679 ?auto_130678 ) ( ON ?auto_130680 ?auto_130679 ) ( not ( = ?auto_130677 ?auto_130678 ) ) ( not ( = ?auto_130677 ?auto_130679 ) ) ( not ( = ?auto_130677 ?auto_130680 ) ) ( not ( = ?auto_130677 ?auto_130681 ) ) ( not ( = ?auto_130677 ?auto_130682 ) ) ( not ( = ?auto_130677 ?auto_130683 ) ) ( not ( = ?auto_130678 ?auto_130679 ) ) ( not ( = ?auto_130678 ?auto_130680 ) ) ( not ( = ?auto_130678 ?auto_130681 ) ) ( not ( = ?auto_130678 ?auto_130682 ) ) ( not ( = ?auto_130678 ?auto_130683 ) ) ( not ( = ?auto_130679 ?auto_130680 ) ) ( not ( = ?auto_130679 ?auto_130681 ) ) ( not ( = ?auto_130679 ?auto_130682 ) ) ( not ( = ?auto_130679 ?auto_130683 ) ) ( not ( = ?auto_130680 ?auto_130681 ) ) ( not ( = ?auto_130680 ?auto_130682 ) ) ( not ( = ?auto_130680 ?auto_130683 ) ) ( not ( = ?auto_130681 ?auto_130682 ) ) ( not ( = ?auto_130681 ?auto_130683 ) ) ( not ( = ?auto_130682 ?auto_130683 ) ) ( ON ?auto_130683 ?auto_130684 ) ( not ( = ?auto_130677 ?auto_130684 ) ) ( not ( = ?auto_130678 ?auto_130684 ) ) ( not ( = ?auto_130679 ?auto_130684 ) ) ( not ( = ?auto_130680 ?auto_130684 ) ) ( not ( = ?auto_130681 ?auto_130684 ) ) ( not ( = ?auto_130682 ?auto_130684 ) ) ( not ( = ?auto_130683 ?auto_130684 ) ) ( ON ?auto_130682 ?auto_130683 ) ( CLEAR ?auto_130682 ) ( ON-TABLE ?auto_130684 ) ( HOLDING ?auto_130681 ) ( CLEAR ?auto_130680 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_130677 ?auto_130678 ?auto_130679 ?auto_130680 ?auto_130681 )
      ( MAKE-7PILE ?auto_130677 ?auto_130678 ?auto_130679 ?auto_130680 ?auto_130681 ?auto_130682 ?auto_130683 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_130685 - BLOCK
      ?auto_130686 - BLOCK
      ?auto_130687 - BLOCK
      ?auto_130688 - BLOCK
      ?auto_130689 - BLOCK
      ?auto_130690 - BLOCK
      ?auto_130691 - BLOCK
    )
    :vars
    (
      ?auto_130692 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130685 ) ( ON ?auto_130686 ?auto_130685 ) ( ON ?auto_130687 ?auto_130686 ) ( ON ?auto_130688 ?auto_130687 ) ( not ( = ?auto_130685 ?auto_130686 ) ) ( not ( = ?auto_130685 ?auto_130687 ) ) ( not ( = ?auto_130685 ?auto_130688 ) ) ( not ( = ?auto_130685 ?auto_130689 ) ) ( not ( = ?auto_130685 ?auto_130690 ) ) ( not ( = ?auto_130685 ?auto_130691 ) ) ( not ( = ?auto_130686 ?auto_130687 ) ) ( not ( = ?auto_130686 ?auto_130688 ) ) ( not ( = ?auto_130686 ?auto_130689 ) ) ( not ( = ?auto_130686 ?auto_130690 ) ) ( not ( = ?auto_130686 ?auto_130691 ) ) ( not ( = ?auto_130687 ?auto_130688 ) ) ( not ( = ?auto_130687 ?auto_130689 ) ) ( not ( = ?auto_130687 ?auto_130690 ) ) ( not ( = ?auto_130687 ?auto_130691 ) ) ( not ( = ?auto_130688 ?auto_130689 ) ) ( not ( = ?auto_130688 ?auto_130690 ) ) ( not ( = ?auto_130688 ?auto_130691 ) ) ( not ( = ?auto_130689 ?auto_130690 ) ) ( not ( = ?auto_130689 ?auto_130691 ) ) ( not ( = ?auto_130690 ?auto_130691 ) ) ( ON ?auto_130691 ?auto_130692 ) ( not ( = ?auto_130685 ?auto_130692 ) ) ( not ( = ?auto_130686 ?auto_130692 ) ) ( not ( = ?auto_130687 ?auto_130692 ) ) ( not ( = ?auto_130688 ?auto_130692 ) ) ( not ( = ?auto_130689 ?auto_130692 ) ) ( not ( = ?auto_130690 ?auto_130692 ) ) ( not ( = ?auto_130691 ?auto_130692 ) ) ( ON ?auto_130690 ?auto_130691 ) ( ON-TABLE ?auto_130692 ) ( CLEAR ?auto_130688 ) ( ON ?auto_130689 ?auto_130690 ) ( CLEAR ?auto_130689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_130692 ?auto_130691 ?auto_130690 )
      ( MAKE-7PILE ?auto_130685 ?auto_130686 ?auto_130687 ?auto_130688 ?auto_130689 ?auto_130690 ?auto_130691 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_130693 - BLOCK
      ?auto_130694 - BLOCK
      ?auto_130695 - BLOCK
      ?auto_130696 - BLOCK
      ?auto_130697 - BLOCK
      ?auto_130698 - BLOCK
      ?auto_130699 - BLOCK
    )
    :vars
    (
      ?auto_130700 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130693 ) ( ON ?auto_130694 ?auto_130693 ) ( ON ?auto_130695 ?auto_130694 ) ( not ( = ?auto_130693 ?auto_130694 ) ) ( not ( = ?auto_130693 ?auto_130695 ) ) ( not ( = ?auto_130693 ?auto_130696 ) ) ( not ( = ?auto_130693 ?auto_130697 ) ) ( not ( = ?auto_130693 ?auto_130698 ) ) ( not ( = ?auto_130693 ?auto_130699 ) ) ( not ( = ?auto_130694 ?auto_130695 ) ) ( not ( = ?auto_130694 ?auto_130696 ) ) ( not ( = ?auto_130694 ?auto_130697 ) ) ( not ( = ?auto_130694 ?auto_130698 ) ) ( not ( = ?auto_130694 ?auto_130699 ) ) ( not ( = ?auto_130695 ?auto_130696 ) ) ( not ( = ?auto_130695 ?auto_130697 ) ) ( not ( = ?auto_130695 ?auto_130698 ) ) ( not ( = ?auto_130695 ?auto_130699 ) ) ( not ( = ?auto_130696 ?auto_130697 ) ) ( not ( = ?auto_130696 ?auto_130698 ) ) ( not ( = ?auto_130696 ?auto_130699 ) ) ( not ( = ?auto_130697 ?auto_130698 ) ) ( not ( = ?auto_130697 ?auto_130699 ) ) ( not ( = ?auto_130698 ?auto_130699 ) ) ( ON ?auto_130699 ?auto_130700 ) ( not ( = ?auto_130693 ?auto_130700 ) ) ( not ( = ?auto_130694 ?auto_130700 ) ) ( not ( = ?auto_130695 ?auto_130700 ) ) ( not ( = ?auto_130696 ?auto_130700 ) ) ( not ( = ?auto_130697 ?auto_130700 ) ) ( not ( = ?auto_130698 ?auto_130700 ) ) ( not ( = ?auto_130699 ?auto_130700 ) ) ( ON ?auto_130698 ?auto_130699 ) ( ON-TABLE ?auto_130700 ) ( ON ?auto_130697 ?auto_130698 ) ( CLEAR ?auto_130697 ) ( HOLDING ?auto_130696 ) ( CLEAR ?auto_130695 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_130693 ?auto_130694 ?auto_130695 ?auto_130696 )
      ( MAKE-7PILE ?auto_130693 ?auto_130694 ?auto_130695 ?auto_130696 ?auto_130697 ?auto_130698 ?auto_130699 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_130701 - BLOCK
      ?auto_130702 - BLOCK
      ?auto_130703 - BLOCK
      ?auto_130704 - BLOCK
      ?auto_130705 - BLOCK
      ?auto_130706 - BLOCK
      ?auto_130707 - BLOCK
    )
    :vars
    (
      ?auto_130708 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130701 ) ( ON ?auto_130702 ?auto_130701 ) ( ON ?auto_130703 ?auto_130702 ) ( not ( = ?auto_130701 ?auto_130702 ) ) ( not ( = ?auto_130701 ?auto_130703 ) ) ( not ( = ?auto_130701 ?auto_130704 ) ) ( not ( = ?auto_130701 ?auto_130705 ) ) ( not ( = ?auto_130701 ?auto_130706 ) ) ( not ( = ?auto_130701 ?auto_130707 ) ) ( not ( = ?auto_130702 ?auto_130703 ) ) ( not ( = ?auto_130702 ?auto_130704 ) ) ( not ( = ?auto_130702 ?auto_130705 ) ) ( not ( = ?auto_130702 ?auto_130706 ) ) ( not ( = ?auto_130702 ?auto_130707 ) ) ( not ( = ?auto_130703 ?auto_130704 ) ) ( not ( = ?auto_130703 ?auto_130705 ) ) ( not ( = ?auto_130703 ?auto_130706 ) ) ( not ( = ?auto_130703 ?auto_130707 ) ) ( not ( = ?auto_130704 ?auto_130705 ) ) ( not ( = ?auto_130704 ?auto_130706 ) ) ( not ( = ?auto_130704 ?auto_130707 ) ) ( not ( = ?auto_130705 ?auto_130706 ) ) ( not ( = ?auto_130705 ?auto_130707 ) ) ( not ( = ?auto_130706 ?auto_130707 ) ) ( ON ?auto_130707 ?auto_130708 ) ( not ( = ?auto_130701 ?auto_130708 ) ) ( not ( = ?auto_130702 ?auto_130708 ) ) ( not ( = ?auto_130703 ?auto_130708 ) ) ( not ( = ?auto_130704 ?auto_130708 ) ) ( not ( = ?auto_130705 ?auto_130708 ) ) ( not ( = ?auto_130706 ?auto_130708 ) ) ( not ( = ?auto_130707 ?auto_130708 ) ) ( ON ?auto_130706 ?auto_130707 ) ( ON-TABLE ?auto_130708 ) ( ON ?auto_130705 ?auto_130706 ) ( CLEAR ?auto_130703 ) ( ON ?auto_130704 ?auto_130705 ) ( CLEAR ?auto_130704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_130708 ?auto_130707 ?auto_130706 ?auto_130705 )
      ( MAKE-7PILE ?auto_130701 ?auto_130702 ?auto_130703 ?auto_130704 ?auto_130705 ?auto_130706 ?auto_130707 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_130709 - BLOCK
      ?auto_130710 - BLOCK
      ?auto_130711 - BLOCK
      ?auto_130712 - BLOCK
      ?auto_130713 - BLOCK
      ?auto_130714 - BLOCK
      ?auto_130715 - BLOCK
    )
    :vars
    (
      ?auto_130716 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130709 ) ( ON ?auto_130710 ?auto_130709 ) ( not ( = ?auto_130709 ?auto_130710 ) ) ( not ( = ?auto_130709 ?auto_130711 ) ) ( not ( = ?auto_130709 ?auto_130712 ) ) ( not ( = ?auto_130709 ?auto_130713 ) ) ( not ( = ?auto_130709 ?auto_130714 ) ) ( not ( = ?auto_130709 ?auto_130715 ) ) ( not ( = ?auto_130710 ?auto_130711 ) ) ( not ( = ?auto_130710 ?auto_130712 ) ) ( not ( = ?auto_130710 ?auto_130713 ) ) ( not ( = ?auto_130710 ?auto_130714 ) ) ( not ( = ?auto_130710 ?auto_130715 ) ) ( not ( = ?auto_130711 ?auto_130712 ) ) ( not ( = ?auto_130711 ?auto_130713 ) ) ( not ( = ?auto_130711 ?auto_130714 ) ) ( not ( = ?auto_130711 ?auto_130715 ) ) ( not ( = ?auto_130712 ?auto_130713 ) ) ( not ( = ?auto_130712 ?auto_130714 ) ) ( not ( = ?auto_130712 ?auto_130715 ) ) ( not ( = ?auto_130713 ?auto_130714 ) ) ( not ( = ?auto_130713 ?auto_130715 ) ) ( not ( = ?auto_130714 ?auto_130715 ) ) ( ON ?auto_130715 ?auto_130716 ) ( not ( = ?auto_130709 ?auto_130716 ) ) ( not ( = ?auto_130710 ?auto_130716 ) ) ( not ( = ?auto_130711 ?auto_130716 ) ) ( not ( = ?auto_130712 ?auto_130716 ) ) ( not ( = ?auto_130713 ?auto_130716 ) ) ( not ( = ?auto_130714 ?auto_130716 ) ) ( not ( = ?auto_130715 ?auto_130716 ) ) ( ON ?auto_130714 ?auto_130715 ) ( ON-TABLE ?auto_130716 ) ( ON ?auto_130713 ?auto_130714 ) ( ON ?auto_130712 ?auto_130713 ) ( CLEAR ?auto_130712 ) ( HOLDING ?auto_130711 ) ( CLEAR ?auto_130710 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_130709 ?auto_130710 ?auto_130711 )
      ( MAKE-7PILE ?auto_130709 ?auto_130710 ?auto_130711 ?auto_130712 ?auto_130713 ?auto_130714 ?auto_130715 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_130717 - BLOCK
      ?auto_130718 - BLOCK
      ?auto_130719 - BLOCK
      ?auto_130720 - BLOCK
      ?auto_130721 - BLOCK
      ?auto_130722 - BLOCK
      ?auto_130723 - BLOCK
    )
    :vars
    (
      ?auto_130724 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130717 ) ( ON ?auto_130718 ?auto_130717 ) ( not ( = ?auto_130717 ?auto_130718 ) ) ( not ( = ?auto_130717 ?auto_130719 ) ) ( not ( = ?auto_130717 ?auto_130720 ) ) ( not ( = ?auto_130717 ?auto_130721 ) ) ( not ( = ?auto_130717 ?auto_130722 ) ) ( not ( = ?auto_130717 ?auto_130723 ) ) ( not ( = ?auto_130718 ?auto_130719 ) ) ( not ( = ?auto_130718 ?auto_130720 ) ) ( not ( = ?auto_130718 ?auto_130721 ) ) ( not ( = ?auto_130718 ?auto_130722 ) ) ( not ( = ?auto_130718 ?auto_130723 ) ) ( not ( = ?auto_130719 ?auto_130720 ) ) ( not ( = ?auto_130719 ?auto_130721 ) ) ( not ( = ?auto_130719 ?auto_130722 ) ) ( not ( = ?auto_130719 ?auto_130723 ) ) ( not ( = ?auto_130720 ?auto_130721 ) ) ( not ( = ?auto_130720 ?auto_130722 ) ) ( not ( = ?auto_130720 ?auto_130723 ) ) ( not ( = ?auto_130721 ?auto_130722 ) ) ( not ( = ?auto_130721 ?auto_130723 ) ) ( not ( = ?auto_130722 ?auto_130723 ) ) ( ON ?auto_130723 ?auto_130724 ) ( not ( = ?auto_130717 ?auto_130724 ) ) ( not ( = ?auto_130718 ?auto_130724 ) ) ( not ( = ?auto_130719 ?auto_130724 ) ) ( not ( = ?auto_130720 ?auto_130724 ) ) ( not ( = ?auto_130721 ?auto_130724 ) ) ( not ( = ?auto_130722 ?auto_130724 ) ) ( not ( = ?auto_130723 ?auto_130724 ) ) ( ON ?auto_130722 ?auto_130723 ) ( ON-TABLE ?auto_130724 ) ( ON ?auto_130721 ?auto_130722 ) ( ON ?auto_130720 ?auto_130721 ) ( CLEAR ?auto_130718 ) ( ON ?auto_130719 ?auto_130720 ) ( CLEAR ?auto_130719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_130724 ?auto_130723 ?auto_130722 ?auto_130721 ?auto_130720 )
      ( MAKE-7PILE ?auto_130717 ?auto_130718 ?auto_130719 ?auto_130720 ?auto_130721 ?auto_130722 ?auto_130723 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_130725 - BLOCK
      ?auto_130726 - BLOCK
      ?auto_130727 - BLOCK
      ?auto_130728 - BLOCK
      ?auto_130729 - BLOCK
      ?auto_130730 - BLOCK
      ?auto_130731 - BLOCK
    )
    :vars
    (
      ?auto_130732 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130725 ) ( not ( = ?auto_130725 ?auto_130726 ) ) ( not ( = ?auto_130725 ?auto_130727 ) ) ( not ( = ?auto_130725 ?auto_130728 ) ) ( not ( = ?auto_130725 ?auto_130729 ) ) ( not ( = ?auto_130725 ?auto_130730 ) ) ( not ( = ?auto_130725 ?auto_130731 ) ) ( not ( = ?auto_130726 ?auto_130727 ) ) ( not ( = ?auto_130726 ?auto_130728 ) ) ( not ( = ?auto_130726 ?auto_130729 ) ) ( not ( = ?auto_130726 ?auto_130730 ) ) ( not ( = ?auto_130726 ?auto_130731 ) ) ( not ( = ?auto_130727 ?auto_130728 ) ) ( not ( = ?auto_130727 ?auto_130729 ) ) ( not ( = ?auto_130727 ?auto_130730 ) ) ( not ( = ?auto_130727 ?auto_130731 ) ) ( not ( = ?auto_130728 ?auto_130729 ) ) ( not ( = ?auto_130728 ?auto_130730 ) ) ( not ( = ?auto_130728 ?auto_130731 ) ) ( not ( = ?auto_130729 ?auto_130730 ) ) ( not ( = ?auto_130729 ?auto_130731 ) ) ( not ( = ?auto_130730 ?auto_130731 ) ) ( ON ?auto_130731 ?auto_130732 ) ( not ( = ?auto_130725 ?auto_130732 ) ) ( not ( = ?auto_130726 ?auto_130732 ) ) ( not ( = ?auto_130727 ?auto_130732 ) ) ( not ( = ?auto_130728 ?auto_130732 ) ) ( not ( = ?auto_130729 ?auto_130732 ) ) ( not ( = ?auto_130730 ?auto_130732 ) ) ( not ( = ?auto_130731 ?auto_130732 ) ) ( ON ?auto_130730 ?auto_130731 ) ( ON-TABLE ?auto_130732 ) ( ON ?auto_130729 ?auto_130730 ) ( ON ?auto_130728 ?auto_130729 ) ( ON ?auto_130727 ?auto_130728 ) ( CLEAR ?auto_130727 ) ( HOLDING ?auto_130726 ) ( CLEAR ?auto_130725 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_130725 ?auto_130726 )
      ( MAKE-7PILE ?auto_130725 ?auto_130726 ?auto_130727 ?auto_130728 ?auto_130729 ?auto_130730 ?auto_130731 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_130733 - BLOCK
      ?auto_130734 - BLOCK
      ?auto_130735 - BLOCK
      ?auto_130736 - BLOCK
      ?auto_130737 - BLOCK
      ?auto_130738 - BLOCK
      ?auto_130739 - BLOCK
    )
    :vars
    (
      ?auto_130740 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130733 ) ( not ( = ?auto_130733 ?auto_130734 ) ) ( not ( = ?auto_130733 ?auto_130735 ) ) ( not ( = ?auto_130733 ?auto_130736 ) ) ( not ( = ?auto_130733 ?auto_130737 ) ) ( not ( = ?auto_130733 ?auto_130738 ) ) ( not ( = ?auto_130733 ?auto_130739 ) ) ( not ( = ?auto_130734 ?auto_130735 ) ) ( not ( = ?auto_130734 ?auto_130736 ) ) ( not ( = ?auto_130734 ?auto_130737 ) ) ( not ( = ?auto_130734 ?auto_130738 ) ) ( not ( = ?auto_130734 ?auto_130739 ) ) ( not ( = ?auto_130735 ?auto_130736 ) ) ( not ( = ?auto_130735 ?auto_130737 ) ) ( not ( = ?auto_130735 ?auto_130738 ) ) ( not ( = ?auto_130735 ?auto_130739 ) ) ( not ( = ?auto_130736 ?auto_130737 ) ) ( not ( = ?auto_130736 ?auto_130738 ) ) ( not ( = ?auto_130736 ?auto_130739 ) ) ( not ( = ?auto_130737 ?auto_130738 ) ) ( not ( = ?auto_130737 ?auto_130739 ) ) ( not ( = ?auto_130738 ?auto_130739 ) ) ( ON ?auto_130739 ?auto_130740 ) ( not ( = ?auto_130733 ?auto_130740 ) ) ( not ( = ?auto_130734 ?auto_130740 ) ) ( not ( = ?auto_130735 ?auto_130740 ) ) ( not ( = ?auto_130736 ?auto_130740 ) ) ( not ( = ?auto_130737 ?auto_130740 ) ) ( not ( = ?auto_130738 ?auto_130740 ) ) ( not ( = ?auto_130739 ?auto_130740 ) ) ( ON ?auto_130738 ?auto_130739 ) ( ON-TABLE ?auto_130740 ) ( ON ?auto_130737 ?auto_130738 ) ( ON ?auto_130736 ?auto_130737 ) ( ON ?auto_130735 ?auto_130736 ) ( CLEAR ?auto_130733 ) ( ON ?auto_130734 ?auto_130735 ) ( CLEAR ?auto_130734 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_130740 ?auto_130739 ?auto_130738 ?auto_130737 ?auto_130736 ?auto_130735 )
      ( MAKE-7PILE ?auto_130733 ?auto_130734 ?auto_130735 ?auto_130736 ?auto_130737 ?auto_130738 ?auto_130739 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_130741 - BLOCK
      ?auto_130742 - BLOCK
      ?auto_130743 - BLOCK
      ?auto_130744 - BLOCK
      ?auto_130745 - BLOCK
      ?auto_130746 - BLOCK
      ?auto_130747 - BLOCK
    )
    :vars
    (
      ?auto_130748 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130741 ?auto_130742 ) ) ( not ( = ?auto_130741 ?auto_130743 ) ) ( not ( = ?auto_130741 ?auto_130744 ) ) ( not ( = ?auto_130741 ?auto_130745 ) ) ( not ( = ?auto_130741 ?auto_130746 ) ) ( not ( = ?auto_130741 ?auto_130747 ) ) ( not ( = ?auto_130742 ?auto_130743 ) ) ( not ( = ?auto_130742 ?auto_130744 ) ) ( not ( = ?auto_130742 ?auto_130745 ) ) ( not ( = ?auto_130742 ?auto_130746 ) ) ( not ( = ?auto_130742 ?auto_130747 ) ) ( not ( = ?auto_130743 ?auto_130744 ) ) ( not ( = ?auto_130743 ?auto_130745 ) ) ( not ( = ?auto_130743 ?auto_130746 ) ) ( not ( = ?auto_130743 ?auto_130747 ) ) ( not ( = ?auto_130744 ?auto_130745 ) ) ( not ( = ?auto_130744 ?auto_130746 ) ) ( not ( = ?auto_130744 ?auto_130747 ) ) ( not ( = ?auto_130745 ?auto_130746 ) ) ( not ( = ?auto_130745 ?auto_130747 ) ) ( not ( = ?auto_130746 ?auto_130747 ) ) ( ON ?auto_130747 ?auto_130748 ) ( not ( = ?auto_130741 ?auto_130748 ) ) ( not ( = ?auto_130742 ?auto_130748 ) ) ( not ( = ?auto_130743 ?auto_130748 ) ) ( not ( = ?auto_130744 ?auto_130748 ) ) ( not ( = ?auto_130745 ?auto_130748 ) ) ( not ( = ?auto_130746 ?auto_130748 ) ) ( not ( = ?auto_130747 ?auto_130748 ) ) ( ON ?auto_130746 ?auto_130747 ) ( ON-TABLE ?auto_130748 ) ( ON ?auto_130745 ?auto_130746 ) ( ON ?auto_130744 ?auto_130745 ) ( ON ?auto_130743 ?auto_130744 ) ( ON ?auto_130742 ?auto_130743 ) ( CLEAR ?auto_130742 ) ( HOLDING ?auto_130741 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_130741 )
      ( MAKE-7PILE ?auto_130741 ?auto_130742 ?auto_130743 ?auto_130744 ?auto_130745 ?auto_130746 ?auto_130747 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_130749 - BLOCK
      ?auto_130750 - BLOCK
      ?auto_130751 - BLOCK
      ?auto_130752 - BLOCK
      ?auto_130753 - BLOCK
      ?auto_130754 - BLOCK
      ?auto_130755 - BLOCK
    )
    :vars
    (
      ?auto_130756 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130749 ?auto_130750 ) ) ( not ( = ?auto_130749 ?auto_130751 ) ) ( not ( = ?auto_130749 ?auto_130752 ) ) ( not ( = ?auto_130749 ?auto_130753 ) ) ( not ( = ?auto_130749 ?auto_130754 ) ) ( not ( = ?auto_130749 ?auto_130755 ) ) ( not ( = ?auto_130750 ?auto_130751 ) ) ( not ( = ?auto_130750 ?auto_130752 ) ) ( not ( = ?auto_130750 ?auto_130753 ) ) ( not ( = ?auto_130750 ?auto_130754 ) ) ( not ( = ?auto_130750 ?auto_130755 ) ) ( not ( = ?auto_130751 ?auto_130752 ) ) ( not ( = ?auto_130751 ?auto_130753 ) ) ( not ( = ?auto_130751 ?auto_130754 ) ) ( not ( = ?auto_130751 ?auto_130755 ) ) ( not ( = ?auto_130752 ?auto_130753 ) ) ( not ( = ?auto_130752 ?auto_130754 ) ) ( not ( = ?auto_130752 ?auto_130755 ) ) ( not ( = ?auto_130753 ?auto_130754 ) ) ( not ( = ?auto_130753 ?auto_130755 ) ) ( not ( = ?auto_130754 ?auto_130755 ) ) ( ON ?auto_130755 ?auto_130756 ) ( not ( = ?auto_130749 ?auto_130756 ) ) ( not ( = ?auto_130750 ?auto_130756 ) ) ( not ( = ?auto_130751 ?auto_130756 ) ) ( not ( = ?auto_130752 ?auto_130756 ) ) ( not ( = ?auto_130753 ?auto_130756 ) ) ( not ( = ?auto_130754 ?auto_130756 ) ) ( not ( = ?auto_130755 ?auto_130756 ) ) ( ON ?auto_130754 ?auto_130755 ) ( ON-TABLE ?auto_130756 ) ( ON ?auto_130753 ?auto_130754 ) ( ON ?auto_130752 ?auto_130753 ) ( ON ?auto_130751 ?auto_130752 ) ( ON ?auto_130750 ?auto_130751 ) ( ON ?auto_130749 ?auto_130750 ) ( CLEAR ?auto_130749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_130756 ?auto_130755 ?auto_130754 ?auto_130753 ?auto_130752 ?auto_130751 ?auto_130750 )
      ( MAKE-7PILE ?auto_130749 ?auto_130750 ?auto_130751 ?auto_130752 ?auto_130753 ?auto_130754 ?auto_130755 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_130763 - BLOCK
      ?auto_130764 - BLOCK
      ?auto_130765 - BLOCK
      ?auto_130766 - BLOCK
      ?auto_130767 - BLOCK
      ?auto_130768 - BLOCK
    )
    :vars
    (
      ?auto_130769 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130769 ?auto_130768 ) ( CLEAR ?auto_130769 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_130763 ) ( ON ?auto_130764 ?auto_130763 ) ( ON ?auto_130765 ?auto_130764 ) ( ON ?auto_130766 ?auto_130765 ) ( ON ?auto_130767 ?auto_130766 ) ( ON ?auto_130768 ?auto_130767 ) ( not ( = ?auto_130763 ?auto_130764 ) ) ( not ( = ?auto_130763 ?auto_130765 ) ) ( not ( = ?auto_130763 ?auto_130766 ) ) ( not ( = ?auto_130763 ?auto_130767 ) ) ( not ( = ?auto_130763 ?auto_130768 ) ) ( not ( = ?auto_130763 ?auto_130769 ) ) ( not ( = ?auto_130764 ?auto_130765 ) ) ( not ( = ?auto_130764 ?auto_130766 ) ) ( not ( = ?auto_130764 ?auto_130767 ) ) ( not ( = ?auto_130764 ?auto_130768 ) ) ( not ( = ?auto_130764 ?auto_130769 ) ) ( not ( = ?auto_130765 ?auto_130766 ) ) ( not ( = ?auto_130765 ?auto_130767 ) ) ( not ( = ?auto_130765 ?auto_130768 ) ) ( not ( = ?auto_130765 ?auto_130769 ) ) ( not ( = ?auto_130766 ?auto_130767 ) ) ( not ( = ?auto_130766 ?auto_130768 ) ) ( not ( = ?auto_130766 ?auto_130769 ) ) ( not ( = ?auto_130767 ?auto_130768 ) ) ( not ( = ?auto_130767 ?auto_130769 ) ) ( not ( = ?auto_130768 ?auto_130769 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_130769 ?auto_130768 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_130785 - BLOCK
      ?auto_130786 - BLOCK
      ?auto_130787 - BLOCK
      ?auto_130788 - BLOCK
      ?auto_130789 - BLOCK
      ?auto_130790 - BLOCK
    )
    :vars
    (
      ?auto_130791 - BLOCK
      ?auto_130792 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130785 ) ( ON ?auto_130786 ?auto_130785 ) ( ON ?auto_130787 ?auto_130786 ) ( ON ?auto_130788 ?auto_130787 ) ( ON ?auto_130789 ?auto_130788 ) ( not ( = ?auto_130785 ?auto_130786 ) ) ( not ( = ?auto_130785 ?auto_130787 ) ) ( not ( = ?auto_130785 ?auto_130788 ) ) ( not ( = ?auto_130785 ?auto_130789 ) ) ( not ( = ?auto_130785 ?auto_130790 ) ) ( not ( = ?auto_130785 ?auto_130791 ) ) ( not ( = ?auto_130786 ?auto_130787 ) ) ( not ( = ?auto_130786 ?auto_130788 ) ) ( not ( = ?auto_130786 ?auto_130789 ) ) ( not ( = ?auto_130786 ?auto_130790 ) ) ( not ( = ?auto_130786 ?auto_130791 ) ) ( not ( = ?auto_130787 ?auto_130788 ) ) ( not ( = ?auto_130787 ?auto_130789 ) ) ( not ( = ?auto_130787 ?auto_130790 ) ) ( not ( = ?auto_130787 ?auto_130791 ) ) ( not ( = ?auto_130788 ?auto_130789 ) ) ( not ( = ?auto_130788 ?auto_130790 ) ) ( not ( = ?auto_130788 ?auto_130791 ) ) ( not ( = ?auto_130789 ?auto_130790 ) ) ( not ( = ?auto_130789 ?auto_130791 ) ) ( not ( = ?auto_130790 ?auto_130791 ) ) ( ON ?auto_130791 ?auto_130792 ) ( CLEAR ?auto_130791 ) ( not ( = ?auto_130785 ?auto_130792 ) ) ( not ( = ?auto_130786 ?auto_130792 ) ) ( not ( = ?auto_130787 ?auto_130792 ) ) ( not ( = ?auto_130788 ?auto_130792 ) ) ( not ( = ?auto_130789 ?auto_130792 ) ) ( not ( = ?auto_130790 ?auto_130792 ) ) ( not ( = ?auto_130791 ?auto_130792 ) ) ( HOLDING ?auto_130790 ) ( CLEAR ?auto_130789 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_130785 ?auto_130786 ?auto_130787 ?auto_130788 ?auto_130789 ?auto_130790 ?auto_130791 )
      ( MAKE-6PILE ?auto_130785 ?auto_130786 ?auto_130787 ?auto_130788 ?auto_130789 ?auto_130790 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_130793 - BLOCK
      ?auto_130794 - BLOCK
      ?auto_130795 - BLOCK
      ?auto_130796 - BLOCK
      ?auto_130797 - BLOCK
      ?auto_130798 - BLOCK
    )
    :vars
    (
      ?auto_130800 - BLOCK
      ?auto_130799 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130793 ) ( ON ?auto_130794 ?auto_130793 ) ( ON ?auto_130795 ?auto_130794 ) ( ON ?auto_130796 ?auto_130795 ) ( ON ?auto_130797 ?auto_130796 ) ( not ( = ?auto_130793 ?auto_130794 ) ) ( not ( = ?auto_130793 ?auto_130795 ) ) ( not ( = ?auto_130793 ?auto_130796 ) ) ( not ( = ?auto_130793 ?auto_130797 ) ) ( not ( = ?auto_130793 ?auto_130798 ) ) ( not ( = ?auto_130793 ?auto_130800 ) ) ( not ( = ?auto_130794 ?auto_130795 ) ) ( not ( = ?auto_130794 ?auto_130796 ) ) ( not ( = ?auto_130794 ?auto_130797 ) ) ( not ( = ?auto_130794 ?auto_130798 ) ) ( not ( = ?auto_130794 ?auto_130800 ) ) ( not ( = ?auto_130795 ?auto_130796 ) ) ( not ( = ?auto_130795 ?auto_130797 ) ) ( not ( = ?auto_130795 ?auto_130798 ) ) ( not ( = ?auto_130795 ?auto_130800 ) ) ( not ( = ?auto_130796 ?auto_130797 ) ) ( not ( = ?auto_130796 ?auto_130798 ) ) ( not ( = ?auto_130796 ?auto_130800 ) ) ( not ( = ?auto_130797 ?auto_130798 ) ) ( not ( = ?auto_130797 ?auto_130800 ) ) ( not ( = ?auto_130798 ?auto_130800 ) ) ( ON ?auto_130800 ?auto_130799 ) ( not ( = ?auto_130793 ?auto_130799 ) ) ( not ( = ?auto_130794 ?auto_130799 ) ) ( not ( = ?auto_130795 ?auto_130799 ) ) ( not ( = ?auto_130796 ?auto_130799 ) ) ( not ( = ?auto_130797 ?auto_130799 ) ) ( not ( = ?auto_130798 ?auto_130799 ) ) ( not ( = ?auto_130800 ?auto_130799 ) ) ( CLEAR ?auto_130797 ) ( ON ?auto_130798 ?auto_130800 ) ( CLEAR ?auto_130798 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_130799 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_130799 ?auto_130800 )
      ( MAKE-6PILE ?auto_130793 ?auto_130794 ?auto_130795 ?auto_130796 ?auto_130797 ?auto_130798 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_130801 - BLOCK
      ?auto_130802 - BLOCK
      ?auto_130803 - BLOCK
      ?auto_130804 - BLOCK
      ?auto_130805 - BLOCK
      ?auto_130806 - BLOCK
    )
    :vars
    (
      ?auto_130807 - BLOCK
      ?auto_130808 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130801 ) ( ON ?auto_130802 ?auto_130801 ) ( ON ?auto_130803 ?auto_130802 ) ( ON ?auto_130804 ?auto_130803 ) ( not ( = ?auto_130801 ?auto_130802 ) ) ( not ( = ?auto_130801 ?auto_130803 ) ) ( not ( = ?auto_130801 ?auto_130804 ) ) ( not ( = ?auto_130801 ?auto_130805 ) ) ( not ( = ?auto_130801 ?auto_130806 ) ) ( not ( = ?auto_130801 ?auto_130807 ) ) ( not ( = ?auto_130802 ?auto_130803 ) ) ( not ( = ?auto_130802 ?auto_130804 ) ) ( not ( = ?auto_130802 ?auto_130805 ) ) ( not ( = ?auto_130802 ?auto_130806 ) ) ( not ( = ?auto_130802 ?auto_130807 ) ) ( not ( = ?auto_130803 ?auto_130804 ) ) ( not ( = ?auto_130803 ?auto_130805 ) ) ( not ( = ?auto_130803 ?auto_130806 ) ) ( not ( = ?auto_130803 ?auto_130807 ) ) ( not ( = ?auto_130804 ?auto_130805 ) ) ( not ( = ?auto_130804 ?auto_130806 ) ) ( not ( = ?auto_130804 ?auto_130807 ) ) ( not ( = ?auto_130805 ?auto_130806 ) ) ( not ( = ?auto_130805 ?auto_130807 ) ) ( not ( = ?auto_130806 ?auto_130807 ) ) ( ON ?auto_130807 ?auto_130808 ) ( not ( = ?auto_130801 ?auto_130808 ) ) ( not ( = ?auto_130802 ?auto_130808 ) ) ( not ( = ?auto_130803 ?auto_130808 ) ) ( not ( = ?auto_130804 ?auto_130808 ) ) ( not ( = ?auto_130805 ?auto_130808 ) ) ( not ( = ?auto_130806 ?auto_130808 ) ) ( not ( = ?auto_130807 ?auto_130808 ) ) ( ON ?auto_130806 ?auto_130807 ) ( CLEAR ?auto_130806 ) ( ON-TABLE ?auto_130808 ) ( HOLDING ?auto_130805 ) ( CLEAR ?auto_130804 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_130801 ?auto_130802 ?auto_130803 ?auto_130804 ?auto_130805 )
      ( MAKE-6PILE ?auto_130801 ?auto_130802 ?auto_130803 ?auto_130804 ?auto_130805 ?auto_130806 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_130809 - BLOCK
      ?auto_130810 - BLOCK
      ?auto_130811 - BLOCK
      ?auto_130812 - BLOCK
      ?auto_130813 - BLOCK
      ?auto_130814 - BLOCK
    )
    :vars
    (
      ?auto_130815 - BLOCK
      ?auto_130816 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130809 ) ( ON ?auto_130810 ?auto_130809 ) ( ON ?auto_130811 ?auto_130810 ) ( ON ?auto_130812 ?auto_130811 ) ( not ( = ?auto_130809 ?auto_130810 ) ) ( not ( = ?auto_130809 ?auto_130811 ) ) ( not ( = ?auto_130809 ?auto_130812 ) ) ( not ( = ?auto_130809 ?auto_130813 ) ) ( not ( = ?auto_130809 ?auto_130814 ) ) ( not ( = ?auto_130809 ?auto_130815 ) ) ( not ( = ?auto_130810 ?auto_130811 ) ) ( not ( = ?auto_130810 ?auto_130812 ) ) ( not ( = ?auto_130810 ?auto_130813 ) ) ( not ( = ?auto_130810 ?auto_130814 ) ) ( not ( = ?auto_130810 ?auto_130815 ) ) ( not ( = ?auto_130811 ?auto_130812 ) ) ( not ( = ?auto_130811 ?auto_130813 ) ) ( not ( = ?auto_130811 ?auto_130814 ) ) ( not ( = ?auto_130811 ?auto_130815 ) ) ( not ( = ?auto_130812 ?auto_130813 ) ) ( not ( = ?auto_130812 ?auto_130814 ) ) ( not ( = ?auto_130812 ?auto_130815 ) ) ( not ( = ?auto_130813 ?auto_130814 ) ) ( not ( = ?auto_130813 ?auto_130815 ) ) ( not ( = ?auto_130814 ?auto_130815 ) ) ( ON ?auto_130815 ?auto_130816 ) ( not ( = ?auto_130809 ?auto_130816 ) ) ( not ( = ?auto_130810 ?auto_130816 ) ) ( not ( = ?auto_130811 ?auto_130816 ) ) ( not ( = ?auto_130812 ?auto_130816 ) ) ( not ( = ?auto_130813 ?auto_130816 ) ) ( not ( = ?auto_130814 ?auto_130816 ) ) ( not ( = ?auto_130815 ?auto_130816 ) ) ( ON ?auto_130814 ?auto_130815 ) ( ON-TABLE ?auto_130816 ) ( CLEAR ?auto_130812 ) ( ON ?auto_130813 ?auto_130814 ) ( CLEAR ?auto_130813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_130816 ?auto_130815 ?auto_130814 )
      ( MAKE-6PILE ?auto_130809 ?auto_130810 ?auto_130811 ?auto_130812 ?auto_130813 ?auto_130814 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_130817 - BLOCK
      ?auto_130818 - BLOCK
      ?auto_130819 - BLOCK
      ?auto_130820 - BLOCK
      ?auto_130821 - BLOCK
      ?auto_130822 - BLOCK
    )
    :vars
    (
      ?auto_130823 - BLOCK
      ?auto_130824 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130817 ) ( ON ?auto_130818 ?auto_130817 ) ( ON ?auto_130819 ?auto_130818 ) ( not ( = ?auto_130817 ?auto_130818 ) ) ( not ( = ?auto_130817 ?auto_130819 ) ) ( not ( = ?auto_130817 ?auto_130820 ) ) ( not ( = ?auto_130817 ?auto_130821 ) ) ( not ( = ?auto_130817 ?auto_130822 ) ) ( not ( = ?auto_130817 ?auto_130823 ) ) ( not ( = ?auto_130818 ?auto_130819 ) ) ( not ( = ?auto_130818 ?auto_130820 ) ) ( not ( = ?auto_130818 ?auto_130821 ) ) ( not ( = ?auto_130818 ?auto_130822 ) ) ( not ( = ?auto_130818 ?auto_130823 ) ) ( not ( = ?auto_130819 ?auto_130820 ) ) ( not ( = ?auto_130819 ?auto_130821 ) ) ( not ( = ?auto_130819 ?auto_130822 ) ) ( not ( = ?auto_130819 ?auto_130823 ) ) ( not ( = ?auto_130820 ?auto_130821 ) ) ( not ( = ?auto_130820 ?auto_130822 ) ) ( not ( = ?auto_130820 ?auto_130823 ) ) ( not ( = ?auto_130821 ?auto_130822 ) ) ( not ( = ?auto_130821 ?auto_130823 ) ) ( not ( = ?auto_130822 ?auto_130823 ) ) ( ON ?auto_130823 ?auto_130824 ) ( not ( = ?auto_130817 ?auto_130824 ) ) ( not ( = ?auto_130818 ?auto_130824 ) ) ( not ( = ?auto_130819 ?auto_130824 ) ) ( not ( = ?auto_130820 ?auto_130824 ) ) ( not ( = ?auto_130821 ?auto_130824 ) ) ( not ( = ?auto_130822 ?auto_130824 ) ) ( not ( = ?auto_130823 ?auto_130824 ) ) ( ON ?auto_130822 ?auto_130823 ) ( ON-TABLE ?auto_130824 ) ( ON ?auto_130821 ?auto_130822 ) ( CLEAR ?auto_130821 ) ( HOLDING ?auto_130820 ) ( CLEAR ?auto_130819 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_130817 ?auto_130818 ?auto_130819 ?auto_130820 )
      ( MAKE-6PILE ?auto_130817 ?auto_130818 ?auto_130819 ?auto_130820 ?auto_130821 ?auto_130822 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_130825 - BLOCK
      ?auto_130826 - BLOCK
      ?auto_130827 - BLOCK
      ?auto_130828 - BLOCK
      ?auto_130829 - BLOCK
      ?auto_130830 - BLOCK
    )
    :vars
    (
      ?auto_130831 - BLOCK
      ?auto_130832 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130825 ) ( ON ?auto_130826 ?auto_130825 ) ( ON ?auto_130827 ?auto_130826 ) ( not ( = ?auto_130825 ?auto_130826 ) ) ( not ( = ?auto_130825 ?auto_130827 ) ) ( not ( = ?auto_130825 ?auto_130828 ) ) ( not ( = ?auto_130825 ?auto_130829 ) ) ( not ( = ?auto_130825 ?auto_130830 ) ) ( not ( = ?auto_130825 ?auto_130831 ) ) ( not ( = ?auto_130826 ?auto_130827 ) ) ( not ( = ?auto_130826 ?auto_130828 ) ) ( not ( = ?auto_130826 ?auto_130829 ) ) ( not ( = ?auto_130826 ?auto_130830 ) ) ( not ( = ?auto_130826 ?auto_130831 ) ) ( not ( = ?auto_130827 ?auto_130828 ) ) ( not ( = ?auto_130827 ?auto_130829 ) ) ( not ( = ?auto_130827 ?auto_130830 ) ) ( not ( = ?auto_130827 ?auto_130831 ) ) ( not ( = ?auto_130828 ?auto_130829 ) ) ( not ( = ?auto_130828 ?auto_130830 ) ) ( not ( = ?auto_130828 ?auto_130831 ) ) ( not ( = ?auto_130829 ?auto_130830 ) ) ( not ( = ?auto_130829 ?auto_130831 ) ) ( not ( = ?auto_130830 ?auto_130831 ) ) ( ON ?auto_130831 ?auto_130832 ) ( not ( = ?auto_130825 ?auto_130832 ) ) ( not ( = ?auto_130826 ?auto_130832 ) ) ( not ( = ?auto_130827 ?auto_130832 ) ) ( not ( = ?auto_130828 ?auto_130832 ) ) ( not ( = ?auto_130829 ?auto_130832 ) ) ( not ( = ?auto_130830 ?auto_130832 ) ) ( not ( = ?auto_130831 ?auto_130832 ) ) ( ON ?auto_130830 ?auto_130831 ) ( ON-TABLE ?auto_130832 ) ( ON ?auto_130829 ?auto_130830 ) ( CLEAR ?auto_130827 ) ( ON ?auto_130828 ?auto_130829 ) ( CLEAR ?auto_130828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_130832 ?auto_130831 ?auto_130830 ?auto_130829 )
      ( MAKE-6PILE ?auto_130825 ?auto_130826 ?auto_130827 ?auto_130828 ?auto_130829 ?auto_130830 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_130833 - BLOCK
      ?auto_130834 - BLOCK
      ?auto_130835 - BLOCK
      ?auto_130836 - BLOCK
      ?auto_130837 - BLOCK
      ?auto_130838 - BLOCK
    )
    :vars
    (
      ?auto_130839 - BLOCK
      ?auto_130840 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130833 ) ( ON ?auto_130834 ?auto_130833 ) ( not ( = ?auto_130833 ?auto_130834 ) ) ( not ( = ?auto_130833 ?auto_130835 ) ) ( not ( = ?auto_130833 ?auto_130836 ) ) ( not ( = ?auto_130833 ?auto_130837 ) ) ( not ( = ?auto_130833 ?auto_130838 ) ) ( not ( = ?auto_130833 ?auto_130839 ) ) ( not ( = ?auto_130834 ?auto_130835 ) ) ( not ( = ?auto_130834 ?auto_130836 ) ) ( not ( = ?auto_130834 ?auto_130837 ) ) ( not ( = ?auto_130834 ?auto_130838 ) ) ( not ( = ?auto_130834 ?auto_130839 ) ) ( not ( = ?auto_130835 ?auto_130836 ) ) ( not ( = ?auto_130835 ?auto_130837 ) ) ( not ( = ?auto_130835 ?auto_130838 ) ) ( not ( = ?auto_130835 ?auto_130839 ) ) ( not ( = ?auto_130836 ?auto_130837 ) ) ( not ( = ?auto_130836 ?auto_130838 ) ) ( not ( = ?auto_130836 ?auto_130839 ) ) ( not ( = ?auto_130837 ?auto_130838 ) ) ( not ( = ?auto_130837 ?auto_130839 ) ) ( not ( = ?auto_130838 ?auto_130839 ) ) ( ON ?auto_130839 ?auto_130840 ) ( not ( = ?auto_130833 ?auto_130840 ) ) ( not ( = ?auto_130834 ?auto_130840 ) ) ( not ( = ?auto_130835 ?auto_130840 ) ) ( not ( = ?auto_130836 ?auto_130840 ) ) ( not ( = ?auto_130837 ?auto_130840 ) ) ( not ( = ?auto_130838 ?auto_130840 ) ) ( not ( = ?auto_130839 ?auto_130840 ) ) ( ON ?auto_130838 ?auto_130839 ) ( ON-TABLE ?auto_130840 ) ( ON ?auto_130837 ?auto_130838 ) ( ON ?auto_130836 ?auto_130837 ) ( CLEAR ?auto_130836 ) ( HOLDING ?auto_130835 ) ( CLEAR ?auto_130834 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_130833 ?auto_130834 ?auto_130835 )
      ( MAKE-6PILE ?auto_130833 ?auto_130834 ?auto_130835 ?auto_130836 ?auto_130837 ?auto_130838 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_130841 - BLOCK
      ?auto_130842 - BLOCK
      ?auto_130843 - BLOCK
      ?auto_130844 - BLOCK
      ?auto_130845 - BLOCK
      ?auto_130846 - BLOCK
    )
    :vars
    (
      ?auto_130847 - BLOCK
      ?auto_130848 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130841 ) ( ON ?auto_130842 ?auto_130841 ) ( not ( = ?auto_130841 ?auto_130842 ) ) ( not ( = ?auto_130841 ?auto_130843 ) ) ( not ( = ?auto_130841 ?auto_130844 ) ) ( not ( = ?auto_130841 ?auto_130845 ) ) ( not ( = ?auto_130841 ?auto_130846 ) ) ( not ( = ?auto_130841 ?auto_130847 ) ) ( not ( = ?auto_130842 ?auto_130843 ) ) ( not ( = ?auto_130842 ?auto_130844 ) ) ( not ( = ?auto_130842 ?auto_130845 ) ) ( not ( = ?auto_130842 ?auto_130846 ) ) ( not ( = ?auto_130842 ?auto_130847 ) ) ( not ( = ?auto_130843 ?auto_130844 ) ) ( not ( = ?auto_130843 ?auto_130845 ) ) ( not ( = ?auto_130843 ?auto_130846 ) ) ( not ( = ?auto_130843 ?auto_130847 ) ) ( not ( = ?auto_130844 ?auto_130845 ) ) ( not ( = ?auto_130844 ?auto_130846 ) ) ( not ( = ?auto_130844 ?auto_130847 ) ) ( not ( = ?auto_130845 ?auto_130846 ) ) ( not ( = ?auto_130845 ?auto_130847 ) ) ( not ( = ?auto_130846 ?auto_130847 ) ) ( ON ?auto_130847 ?auto_130848 ) ( not ( = ?auto_130841 ?auto_130848 ) ) ( not ( = ?auto_130842 ?auto_130848 ) ) ( not ( = ?auto_130843 ?auto_130848 ) ) ( not ( = ?auto_130844 ?auto_130848 ) ) ( not ( = ?auto_130845 ?auto_130848 ) ) ( not ( = ?auto_130846 ?auto_130848 ) ) ( not ( = ?auto_130847 ?auto_130848 ) ) ( ON ?auto_130846 ?auto_130847 ) ( ON-TABLE ?auto_130848 ) ( ON ?auto_130845 ?auto_130846 ) ( ON ?auto_130844 ?auto_130845 ) ( CLEAR ?auto_130842 ) ( ON ?auto_130843 ?auto_130844 ) ( CLEAR ?auto_130843 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_130848 ?auto_130847 ?auto_130846 ?auto_130845 ?auto_130844 )
      ( MAKE-6PILE ?auto_130841 ?auto_130842 ?auto_130843 ?auto_130844 ?auto_130845 ?auto_130846 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_130849 - BLOCK
      ?auto_130850 - BLOCK
      ?auto_130851 - BLOCK
      ?auto_130852 - BLOCK
      ?auto_130853 - BLOCK
      ?auto_130854 - BLOCK
    )
    :vars
    (
      ?auto_130855 - BLOCK
      ?auto_130856 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130849 ) ( not ( = ?auto_130849 ?auto_130850 ) ) ( not ( = ?auto_130849 ?auto_130851 ) ) ( not ( = ?auto_130849 ?auto_130852 ) ) ( not ( = ?auto_130849 ?auto_130853 ) ) ( not ( = ?auto_130849 ?auto_130854 ) ) ( not ( = ?auto_130849 ?auto_130855 ) ) ( not ( = ?auto_130850 ?auto_130851 ) ) ( not ( = ?auto_130850 ?auto_130852 ) ) ( not ( = ?auto_130850 ?auto_130853 ) ) ( not ( = ?auto_130850 ?auto_130854 ) ) ( not ( = ?auto_130850 ?auto_130855 ) ) ( not ( = ?auto_130851 ?auto_130852 ) ) ( not ( = ?auto_130851 ?auto_130853 ) ) ( not ( = ?auto_130851 ?auto_130854 ) ) ( not ( = ?auto_130851 ?auto_130855 ) ) ( not ( = ?auto_130852 ?auto_130853 ) ) ( not ( = ?auto_130852 ?auto_130854 ) ) ( not ( = ?auto_130852 ?auto_130855 ) ) ( not ( = ?auto_130853 ?auto_130854 ) ) ( not ( = ?auto_130853 ?auto_130855 ) ) ( not ( = ?auto_130854 ?auto_130855 ) ) ( ON ?auto_130855 ?auto_130856 ) ( not ( = ?auto_130849 ?auto_130856 ) ) ( not ( = ?auto_130850 ?auto_130856 ) ) ( not ( = ?auto_130851 ?auto_130856 ) ) ( not ( = ?auto_130852 ?auto_130856 ) ) ( not ( = ?auto_130853 ?auto_130856 ) ) ( not ( = ?auto_130854 ?auto_130856 ) ) ( not ( = ?auto_130855 ?auto_130856 ) ) ( ON ?auto_130854 ?auto_130855 ) ( ON-TABLE ?auto_130856 ) ( ON ?auto_130853 ?auto_130854 ) ( ON ?auto_130852 ?auto_130853 ) ( ON ?auto_130851 ?auto_130852 ) ( CLEAR ?auto_130851 ) ( HOLDING ?auto_130850 ) ( CLEAR ?auto_130849 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_130849 ?auto_130850 )
      ( MAKE-6PILE ?auto_130849 ?auto_130850 ?auto_130851 ?auto_130852 ?auto_130853 ?auto_130854 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_130857 - BLOCK
      ?auto_130858 - BLOCK
      ?auto_130859 - BLOCK
      ?auto_130860 - BLOCK
      ?auto_130861 - BLOCK
      ?auto_130862 - BLOCK
    )
    :vars
    (
      ?auto_130863 - BLOCK
      ?auto_130864 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130857 ) ( not ( = ?auto_130857 ?auto_130858 ) ) ( not ( = ?auto_130857 ?auto_130859 ) ) ( not ( = ?auto_130857 ?auto_130860 ) ) ( not ( = ?auto_130857 ?auto_130861 ) ) ( not ( = ?auto_130857 ?auto_130862 ) ) ( not ( = ?auto_130857 ?auto_130863 ) ) ( not ( = ?auto_130858 ?auto_130859 ) ) ( not ( = ?auto_130858 ?auto_130860 ) ) ( not ( = ?auto_130858 ?auto_130861 ) ) ( not ( = ?auto_130858 ?auto_130862 ) ) ( not ( = ?auto_130858 ?auto_130863 ) ) ( not ( = ?auto_130859 ?auto_130860 ) ) ( not ( = ?auto_130859 ?auto_130861 ) ) ( not ( = ?auto_130859 ?auto_130862 ) ) ( not ( = ?auto_130859 ?auto_130863 ) ) ( not ( = ?auto_130860 ?auto_130861 ) ) ( not ( = ?auto_130860 ?auto_130862 ) ) ( not ( = ?auto_130860 ?auto_130863 ) ) ( not ( = ?auto_130861 ?auto_130862 ) ) ( not ( = ?auto_130861 ?auto_130863 ) ) ( not ( = ?auto_130862 ?auto_130863 ) ) ( ON ?auto_130863 ?auto_130864 ) ( not ( = ?auto_130857 ?auto_130864 ) ) ( not ( = ?auto_130858 ?auto_130864 ) ) ( not ( = ?auto_130859 ?auto_130864 ) ) ( not ( = ?auto_130860 ?auto_130864 ) ) ( not ( = ?auto_130861 ?auto_130864 ) ) ( not ( = ?auto_130862 ?auto_130864 ) ) ( not ( = ?auto_130863 ?auto_130864 ) ) ( ON ?auto_130862 ?auto_130863 ) ( ON-TABLE ?auto_130864 ) ( ON ?auto_130861 ?auto_130862 ) ( ON ?auto_130860 ?auto_130861 ) ( ON ?auto_130859 ?auto_130860 ) ( CLEAR ?auto_130857 ) ( ON ?auto_130858 ?auto_130859 ) ( CLEAR ?auto_130858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_130864 ?auto_130863 ?auto_130862 ?auto_130861 ?auto_130860 ?auto_130859 )
      ( MAKE-6PILE ?auto_130857 ?auto_130858 ?auto_130859 ?auto_130860 ?auto_130861 ?auto_130862 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_130865 - BLOCK
      ?auto_130866 - BLOCK
      ?auto_130867 - BLOCK
      ?auto_130868 - BLOCK
      ?auto_130869 - BLOCK
      ?auto_130870 - BLOCK
    )
    :vars
    (
      ?auto_130872 - BLOCK
      ?auto_130871 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130865 ?auto_130866 ) ) ( not ( = ?auto_130865 ?auto_130867 ) ) ( not ( = ?auto_130865 ?auto_130868 ) ) ( not ( = ?auto_130865 ?auto_130869 ) ) ( not ( = ?auto_130865 ?auto_130870 ) ) ( not ( = ?auto_130865 ?auto_130872 ) ) ( not ( = ?auto_130866 ?auto_130867 ) ) ( not ( = ?auto_130866 ?auto_130868 ) ) ( not ( = ?auto_130866 ?auto_130869 ) ) ( not ( = ?auto_130866 ?auto_130870 ) ) ( not ( = ?auto_130866 ?auto_130872 ) ) ( not ( = ?auto_130867 ?auto_130868 ) ) ( not ( = ?auto_130867 ?auto_130869 ) ) ( not ( = ?auto_130867 ?auto_130870 ) ) ( not ( = ?auto_130867 ?auto_130872 ) ) ( not ( = ?auto_130868 ?auto_130869 ) ) ( not ( = ?auto_130868 ?auto_130870 ) ) ( not ( = ?auto_130868 ?auto_130872 ) ) ( not ( = ?auto_130869 ?auto_130870 ) ) ( not ( = ?auto_130869 ?auto_130872 ) ) ( not ( = ?auto_130870 ?auto_130872 ) ) ( ON ?auto_130872 ?auto_130871 ) ( not ( = ?auto_130865 ?auto_130871 ) ) ( not ( = ?auto_130866 ?auto_130871 ) ) ( not ( = ?auto_130867 ?auto_130871 ) ) ( not ( = ?auto_130868 ?auto_130871 ) ) ( not ( = ?auto_130869 ?auto_130871 ) ) ( not ( = ?auto_130870 ?auto_130871 ) ) ( not ( = ?auto_130872 ?auto_130871 ) ) ( ON ?auto_130870 ?auto_130872 ) ( ON-TABLE ?auto_130871 ) ( ON ?auto_130869 ?auto_130870 ) ( ON ?auto_130868 ?auto_130869 ) ( ON ?auto_130867 ?auto_130868 ) ( ON ?auto_130866 ?auto_130867 ) ( CLEAR ?auto_130866 ) ( HOLDING ?auto_130865 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_130865 )
      ( MAKE-6PILE ?auto_130865 ?auto_130866 ?auto_130867 ?auto_130868 ?auto_130869 ?auto_130870 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_130873 - BLOCK
      ?auto_130874 - BLOCK
      ?auto_130875 - BLOCK
      ?auto_130876 - BLOCK
      ?auto_130877 - BLOCK
      ?auto_130878 - BLOCK
    )
    :vars
    (
      ?auto_130880 - BLOCK
      ?auto_130879 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130873 ?auto_130874 ) ) ( not ( = ?auto_130873 ?auto_130875 ) ) ( not ( = ?auto_130873 ?auto_130876 ) ) ( not ( = ?auto_130873 ?auto_130877 ) ) ( not ( = ?auto_130873 ?auto_130878 ) ) ( not ( = ?auto_130873 ?auto_130880 ) ) ( not ( = ?auto_130874 ?auto_130875 ) ) ( not ( = ?auto_130874 ?auto_130876 ) ) ( not ( = ?auto_130874 ?auto_130877 ) ) ( not ( = ?auto_130874 ?auto_130878 ) ) ( not ( = ?auto_130874 ?auto_130880 ) ) ( not ( = ?auto_130875 ?auto_130876 ) ) ( not ( = ?auto_130875 ?auto_130877 ) ) ( not ( = ?auto_130875 ?auto_130878 ) ) ( not ( = ?auto_130875 ?auto_130880 ) ) ( not ( = ?auto_130876 ?auto_130877 ) ) ( not ( = ?auto_130876 ?auto_130878 ) ) ( not ( = ?auto_130876 ?auto_130880 ) ) ( not ( = ?auto_130877 ?auto_130878 ) ) ( not ( = ?auto_130877 ?auto_130880 ) ) ( not ( = ?auto_130878 ?auto_130880 ) ) ( ON ?auto_130880 ?auto_130879 ) ( not ( = ?auto_130873 ?auto_130879 ) ) ( not ( = ?auto_130874 ?auto_130879 ) ) ( not ( = ?auto_130875 ?auto_130879 ) ) ( not ( = ?auto_130876 ?auto_130879 ) ) ( not ( = ?auto_130877 ?auto_130879 ) ) ( not ( = ?auto_130878 ?auto_130879 ) ) ( not ( = ?auto_130880 ?auto_130879 ) ) ( ON ?auto_130878 ?auto_130880 ) ( ON-TABLE ?auto_130879 ) ( ON ?auto_130877 ?auto_130878 ) ( ON ?auto_130876 ?auto_130877 ) ( ON ?auto_130875 ?auto_130876 ) ( ON ?auto_130874 ?auto_130875 ) ( ON ?auto_130873 ?auto_130874 ) ( CLEAR ?auto_130873 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_130879 ?auto_130880 ?auto_130878 ?auto_130877 ?auto_130876 ?auto_130875 ?auto_130874 )
      ( MAKE-6PILE ?auto_130873 ?auto_130874 ?auto_130875 ?auto_130876 ?auto_130877 ?auto_130878 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_130882 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_130882 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_130882 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_130883 - BLOCK
    )
    :vars
    (
      ?auto_130884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130883 ?auto_130884 ) ( CLEAR ?auto_130883 ) ( HAND-EMPTY ) ( not ( = ?auto_130883 ?auto_130884 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_130883 ?auto_130884 )
      ( MAKE-1PILE ?auto_130883 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_130885 - BLOCK
    )
    :vars
    (
      ?auto_130886 - BLOCK
      ?auto_130890 - BLOCK
      ?auto_130888 - BLOCK
      ?auto_130887 - BLOCK
      ?auto_130889 - BLOCK
      ?auto_130891 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130885 ?auto_130886 ) ) ( HOLDING ?auto_130885 ) ( CLEAR ?auto_130886 ) ( ON-TABLE ?auto_130890 ) ( ON ?auto_130888 ?auto_130890 ) ( ON ?auto_130887 ?auto_130888 ) ( ON ?auto_130889 ?auto_130887 ) ( ON ?auto_130891 ?auto_130889 ) ( ON ?auto_130886 ?auto_130891 ) ( not ( = ?auto_130890 ?auto_130888 ) ) ( not ( = ?auto_130890 ?auto_130887 ) ) ( not ( = ?auto_130890 ?auto_130889 ) ) ( not ( = ?auto_130890 ?auto_130891 ) ) ( not ( = ?auto_130890 ?auto_130886 ) ) ( not ( = ?auto_130890 ?auto_130885 ) ) ( not ( = ?auto_130888 ?auto_130887 ) ) ( not ( = ?auto_130888 ?auto_130889 ) ) ( not ( = ?auto_130888 ?auto_130891 ) ) ( not ( = ?auto_130888 ?auto_130886 ) ) ( not ( = ?auto_130888 ?auto_130885 ) ) ( not ( = ?auto_130887 ?auto_130889 ) ) ( not ( = ?auto_130887 ?auto_130891 ) ) ( not ( = ?auto_130887 ?auto_130886 ) ) ( not ( = ?auto_130887 ?auto_130885 ) ) ( not ( = ?auto_130889 ?auto_130891 ) ) ( not ( = ?auto_130889 ?auto_130886 ) ) ( not ( = ?auto_130889 ?auto_130885 ) ) ( not ( = ?auto_130891 ?auto_130886 ) ) ( not ( = ?auto_130891 ?auto_130885 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_130890 ?auto_130888 ?auto_130887 ?auto_130889 ?auto_130891 ?auto_130886 ?auto_130885 )
      ( MAKE-1PILE ?auto_130885 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_130892 - BLOCK
    )
    :vars
    (
      ?auto_130898 - BLOCK
      ?auto_130895 - BLOCK
      ?auto_130897 - BLOCK
      ?auto_130893 - BLOCK
      ?auto_130896 - BLOCK
      ?auto_130894 - BLOCK
      ?auto_130899 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130892 ?auto_130898 ) ) ( CLEAR ?auto_130898 ) ( ON-TABLE ?auto_130895 ) ( ON ?auto_130897 ?auto_130895 ) ( ON ?auto_130893 ?auto_130897 ) ( ON ?auto_130896 ?auto_130893 ) ( ON ?auto_130894 ?auto_130896 ) ( ON ?auto_130898 ?auto_130894 ) ( not ( = ?auto_130895 ?auto_130897 ) ) ( not ( = ?auto_130895 ?auto_130893 ) ) ( not ( = ?auto_130895 ?auto_130896 ) ) ( not ( = ?auto_130895 ?auto_130894 ) ) ( not ( = ?auto_130895 ?auto_130898 ) ) ( not ( = ?auto_130895 ?auto_130892 ) ) ( not ( = ?auto_130897 ?auto_130893 ) ) ( not ( = ?auto_130897 ?auto_130896 ) ) ( not ( = ?auto_130897 ?auto_130894 ) ) ( not ( = ?auto_130897 ?auto_130898 ) ) ( not ( = ?auto_130897 ?auto_130892 ) ) ( not ( = ?auto_130893 ?auto_130896 ) ) ( not ( = ?auto_130893 ?auto_130894 ) ) ( not ( = ?auto_130893 ?auto_130898 ) ) ( not ( = ?auto_130893 ?auto_130892 ) ) ( not ( = ?auto_130896 ?auto_130894 ) ) ( not ( = ?auto_130896 ?auto_130898 ) ) ( not ( = ?auto_130896 ?auto_130892 ) ) ( not ( = ?auto_130894 ?auto_130898 ) ) ( not ( = ?auto_130894 ?auto_130892 ) ) ( ON ?auto_130892 ?auto_130899 ) ( CLEAR ?auto_130892 ) ( HAND-EMPTY ) ( not ( = ?auto_130892 ?auto_130899 ) ) ( not ( = ?auto_130898 ?auto_130899 ) ) ( not ( = ?auto_130895 ?auto_130899 ) ) ( not ( = ?auto_130897 ?auto_130899 ) ) ( not ( = ?auto_130893 ?auto_130899 ) ) ( not ( = ?auto_130896 ?auto_130899 ) ) ( not ( = ?auto_130894 ?auto_130899 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_130892 ?auto_130899 )
      ( MAKE-1PILE ?auto_130892 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_130900 - BLOCK
    )
    :vars
    (
      ?auto_130904 - BLOCK
      ?auto_130901 - BLOCK
      ?auto_130907 - BLOCK
      ?auto_130903 - BLOCK
      ?auto_130906 - BLOCK
      ?auto_130905 - BLOCK
      ?auto_130902 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130900 ?auto_130904 ) ) ( ON-TABLE ?auto_130901 ) ( ON ?auto_130907 ?auto_130901 ) ( ON ?auto_130903 ?auto_130907 ) ( ON ?auto_130906 ?auto_130903 ) ( ON ?auto_130905 ?auto_130906 ) ( not ( = ?auto_130901 ?auto_130907 ) ) ( not ( = ?auto_130901 ?auto_130903 ) ) ( not ( = ?auto_130901 ?auto_130906 ) ) ( not ( = ?auto_130901 ?auto_130905 ) ) ( not ( = ?auto_130901 ?auto_130904 ) ) ( not ( = ?auto_130901 ?auto_130900 ) ) ( not ( = ?auto_130907 ?auto_130903 ) ) ( not ( = ?auto_130907 ?auto_130906 ) ) ( not ( = ?auto_130907 ?auto_130905 ) ) ( not ( = ?auto_130907 ?auto_130904 ) ) ( not ( = ?auto_130907 ?auto_130900 ) ) ( not ( = ?auto_130903 ?auto_130906 ) ) ( not ( = ?auto_130903 ?auto_130905 ) ) ( not ( = ?auto_130903 ?auto_130904 ) ) ( not ( = ?auto_130903 ?auto_130900 ) ) ( not ( = ?auto_130906 ?auto_130905 ) ) ( not ( = ?auto_130906 ?auto_130904 ) ) ( not ( = ?auto_130906 ?auto_130900 ) ) ( not ( = ?auto_130905 ?auto_130904 ) ) ( not ( = ?auto_130905 ?auto_130900 ) ) ( ON ?auto_130900 ?auto_130902 ) ( CLEAR ?auto_130900 ) ( not ( = ?auto_130900 ?auto_130902 ) ) ( not ( = ?auto_130904 ?auto_130902 ) ) ( not ( = ?auto_130901 ?auto_130902 ) ) ( not ( = ?auto_130907 ?auto_130902 ) ) ( not ( = ?auto_130903 ?auto_130902 ) ) ( not ( = ?auto_130906 ?auto_130902 ) ) ( not ( = ?auto_130905 ?auto_130902 ) ) ( HOLDING ?auto_130904 ) ( CLEAR ?auto_130905 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_130901 ?auto_130907 ?auto_130903 ?auto_130906 ?auto_130905 ?auto_130904 )
      ( MAKE-1PILE ?auto_130900 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_130908 - BLOCK
    )
    :vars
    (
      ?auto_130909 - BLOCK
      ?auto_130914 - BLOCK
      ?auto_130912 - BLOCK
      ?auto_130911 - BLOCK
      ?auto_130915 - BLOCK
      ?auto_130913 - BLOCK
      ?auto_130910 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130908 ?auto_130909 ) ) ( ON-TABLE ?auto_130914 ) ( ON ?auto_130912 ?auto_130914 ) ( ON ?auto_130911 ?auto_130912 ) ( ON ?auto_130915 ?auto_130911 ) ( ON ?auto_130913 ?auto_130915 ) ( not ( = ?auto_130914 ?auto_130912 ) ) ( not ( = ?auto_130914 ?auto_130911 ) ) ( not ( = ?auto_130914 ?auto_130915 ) ) ( not ( = ?auto_130914 ?auto_130913 ) ) ( not ( = ?auto_130914 ?auto_130909 ) ) ( not ( = ?auto_130914 ?auto_130908 ) ) ( not ( = ?auto_130912 ?auto_130911 ) ) ( not ( = ?auto_130912 ?auto_130915 ) ) ( not ( = ?auto_130912 ?auto_130913 ) ) ( not ( = ?auto_130912 ?auto_130909 ) ) ( not ( = ?auto_130912 ?auto_130908 ) ) ( not ( = ?auto_130911 ?auto_130915 ) ) ( not ( = ?auto_130911 ?auto_130913 ) ) ( not ( = ?auto_130911 ?auto_130909 ) ) ( not ( = ?auto_130911 ?auto_130908 ) ) ( not ( = ?auto_130915 ?auto_130913 ) ) ( not ( = ?auto_130915 ?auto_130909 ) ) ( not ( = ?auto_130915 ?auto_130908 ) ) ( not ( = ?auto_130913 ?auto_130909 ) ) ( not ( = ?auto_130913 ?auto_130908 ) ) ( ON ?auto_130908 ?auto_130910 ) ( not ( = ?auto_130908 ?auto_130910 ) ) ( not ( = ?auto_130909 ?auto_130910 ) ) ( not ( = ?auto_130914 ?auto_130910 ) ) ( not ( = ?auto_130912 ?auto_130910 ) ) ( not ( = ?auto_130911 ?auto_130910 ) ) ( not ( = ?auto_130915 ?auto_130910 ) ) ( not ( = ?auto_130913 ?auto_130910 ) ) ( CLEAR ?auto_130913 ) ( ON ?auto_130909 ?auto_130908 ) ( CLEAR ?auto_130909 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_130910 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_130910 ?auto_130908 )
      ( MAKE-1PILE ?auto_130908 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_130916 - BLOCK
    )
    :vars
    (
      ?auto_130918 - BLOCK
      ?auto_130919 - BLOCK
      ?auto_130923 - BLOCK
      ?auto_130921 - BLOCK
      ?auto_130922 - BLOCK
      ?auto_130920 - BLOCK
      ?auto_130917 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130916 ?auto_130918 ) ) ( ON-TABLE ?auto_130919 ) ( ON ?auto_130923 ?auto_130919 ) ( ON ?auto_130921 ?auto_130923 ) ( ON ?auto_130922 ?auto_130921 ) ( not ( = ?auto_130919 ?auto_130923 ) ) ( not ( = ?auto_130919 ?auto_130921 ) ) ( not ( = ?auto_130919 ?auto_130922 ) ) ( not ( = ?auto_130919 ?auto_130920 ) ) ( not ( = ?auto_130919 ?auto_130918 ) ) ( not ( = ?auto_130919 ?auto_130916 ) ) ( not ( = ?auto_130923 ?auto_130921 ) ) ( not ( = ?auto_130923 ?auto_130922 ) ) ( not ( = ?auto_130923 ?auto_130920 ) ) ( not ( = ?auto_130923 ?auto_130918 ) ) ( not ( = ?auto_130923 ?auto_130916 ) ) ( not ( = ?auto_130921 ?auto_130922 ) ) ( not ( = ?auto_130921 ?auto_130920 ) ) ( not ( = ?auto_130921 ?auto_130918 ) ) ( not ( = ?auto_130921 ?auto_130916 ) ) ( not ( = ?auto_130922 ?auto_130920 ) ) ( not ( = ?auto_130922 ?auto_130918 ) ) ( not ( = ?auto_130922 ?auto_130916 ) ) ( not ( = ?auto_130920 ?auto_130918 ) ) ( not ( = ?auto_130920 ?auto_130916 ) ) ( ON ?auto_130916 ?auto_130917 ) ( not ( = ?auto_130916 ?auto_130917 ) ) ( not ( = ?auto_130918 ?auto_130917 ) ) ( not ( = ?auto_130919 ?auto_130917 ) ) ( not ( = ?auto_130923 ?auto_130917 ) ) ( not ( = ?auto_130921 ?auto_130917 ) ) ( not ( = ?auto_130922 ?auto_130917 ) ) ( not ( = ?auto_130920 ?auto_130917 ) ) ( ON ?auto_130918 ?auto_130916 ) ( CLEAR ?auto_130918 ) ( ON-TABLE ?auto_130917 ) ( HOLDING ?auto_130920 ) ( CLEAR ?auto_130922 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_130919 ?auto_130923 ?auto_130921 ?auto_130922 ?auto_130920 )
      ( MAKE-1PILE ?auto_130916 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_130924 - BLOCK
    )
    :vars
    (
      ?auto_130928 - BLOCK
      ?auto_130926 - BLOCK
      ?auto_130929 - BLOCK
      ?auto_130925 - BLOCK
      ?auto_130931 - BLOCK
      ?auto_130927 - BLOCK
      ?auto_130930 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130924 ?auto_130928 ) ) ( ON-TABLE ?auto_130926 ) ( ON ?auto_130929 ?auto_130926 ) ( ON ?auto_130925 ?auto_130929 ) ( ON ?auto_130931 ?auto_130925 ) ( not ( = ?auto_130926 ?auto_130929 ) ) ( not ( = ?auto_130926 ?auto_130925 ) ) ( not ( = ?auto_130926 ?auto_130931 ) ) ( not ( = ?auto_130926 ?auto_130927 ) ) ( not ( = ?auto_130926 ?auto_130928 ) ) ( not ( = ?auto_130926 ?auto_130924 ) ) ( not ( = ?auto_130929 ?auto_130925 ) ) ( not ( = ?auto_130929 ?auto_130931 ) ) ( not ( = ?auto_130929 ?auto_130927 ) ) ( not ( = ?auto_130929 ?auto_130928 ) ) ( not ( = ?auto_130929 ?auto_130924 ) ) ( not ( = ?auto_130925 ?auto_130931 ) ) ( not ( = ?auto_130925 ?auto_130927 ) ) ( not ( = ?auto_130925 ?auto_130928 ) ) ( not ( = ?auto_130925 ?auto_130924 ) ) ( not ( = ?auto_130931 ?auto_130927 ) ) ( not ( = ?auto_130931 ?auto_130928 ) ) ( not ( = ?auto_130931 ?auto_130924 ) ) ( not ( = ?auto_130927 ?auto_130928 ) ) ( not ( = ?auto_130927 ?auto_130924 ) ) ( ON ?auto_130924 ?auto_130930 ) ( not ( = ?auto_130924 ?auto_130930 ) ) ( not ( = ?auto_130928 ?auto_130930 ) ) ( not ( = ?auto_130926 ?auto_130930 ) ) ( not ( = ?auto_130929 ?auto_130930 ) ) ( not ( = ?auto_130925 ?auto_130930 ) ) ( not ( = ?auto_130931 ?auto_130930 ) ) ( not ( = ?auto_130927 ?auto_130930 ) ) ( ON ?auto_130928 ?auto_130924 ) ( ON-TABLE ?auto_130930 ) ( CLEAR ?auto_130931 ) ( ON ?auto_130927 ?auto_130928 ) ( CLEAR ?auto_130927 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_130930 ?auto_130924 ?auto_130928 )
      ( MAKE-1PILE ?auto_130924 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_130932 - BLOCK
    )
    :vars
    (
      ?auto_130936 - BLOCK
      ?auto_130935 - BLOCK
      ?auto_130938 - BLOCK
      ?auto_130933 - BLOCK
      ?auto_130934 - BLOCK
      ?auto_130937 - BLOCK
      ?auto_130939 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130932 ?auto_130936 ) ) ( ON-TABLE ?auto_130935 ) ( ON ?auto_130938 ?auto_130935 ) ( ON ?auto_130933 ?auto_130938 ) ( not ( = ?auto_130935 ?auto_130938 ) ) ( not ( = ?auto_130935 ?auto_130933 ) ) ( not ( = ?auto_130935 ?auto_130934 ) ) ( not ( = ?auto_130935 ?auto_130937 ) ) ( not ( = ?auto_130935 ?auto_130936 ) ) ( not ( = ?auto_130935 ?auto_130932 ) ) ( not ( = ?auto_130938 ?auto_130933 ) ) ( not ( = ?auto_130938 ?auto_130934 ) ) ( not ( = ?auto_130938 ?auto_130937 ) ) ( not ( = ?auto_130938 ?auto_130936 ) ) ( not ( = ?auto_130938 ?auto_130932 ) ) ( not ( = ?auto_130933 ?auto_130934 ) ) ( not ( = ?auto_130933 ?auto_130937 ) ) ( not ( = ?auto_130933 ?auto_130936 ) ) ( not ( = ?auto_130933 ?auto_130932 ) ) ( not ( = ?auto_130934 ?auto_130937 ) ) ( not ( = ?auto_130934 ?auto_130936 ) ) ( not ( = ?auto_130934 ?auto_130932 ) ) ( not ( = ?auto_130937 ?auto_130936 ) ) ( not ( = ?auto_130937 ?auto_130932 ) ) ( ON ?auto_130932 ?auto_130939 ) ( not ( = ?auto_130932 ?auto_130939 ) ) ( not ( = ?auto_130936 ?auto_130939 ) ) ( not ( = ?auto_130935 ?auto_130939 ) ) ( not ( = ?auto_130938 ?auto_130939 ) ) ( not ( = ?auto_130933 ?auto_130939 ) ) ( not ( = ?auto_130934 ?auto_130939 ) ) ( not ( = ?auto_130937 ?auto_130939 ) ) ( ON ?auto_130936 ?auto_130932 ) ( ON-TABLE ?auto_130939 ) ( ON ?auto_130937 ?auto_130936 ) ( CLEAR ?auto_130937 ) ( HOLDING ?auto_130934 ) ( CLEAR ?auto_130933 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_130935 ?auto_130938 ?auto_130933 ?auto_130934 )
      ( MAKE-1PILE ?auto_130932 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_130940 - BLOCK
    )
    :vars
    (
      ?auto_130943 - BLOCK
      ?auto_130944 - BLOCK
      ?auto_130947 - BLOCK
      ?auto_130942 - BLOCK
      ?auto_130941 - BLOCK
      ?auto_130945 - BLOCK
      ?auto_130946 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130940 ?auto_130943 ) ) ( ON-TABLE ?auto_130944 ) ( ON ?auto_130947 ?auto_130944 ) ( ON ?auto_130942 ?auto_130947 ) ( not ( = ?auto_130944 ?auto_130947 ) ) ( not ( = ?auto_130944 ?auto_130942 ) ) ( not ( = ?auto_130944 ?auto_130941 ) ) ( not ( = ?auto_130944 ?auto_130945 ) ) ( not ( = ?auto_130944 ?auto_130943 ) ) ( not ( = ?auto_130944 ?auto_130940 ) ) ( not ( = ?auto_130947 ?auto_130942 ) ) ( not ( = ?auto_130947 ?auto_130941 ) ) ( not ( = ?auto_130947 ?auto_130945 ) ) ( not ( = ?auto_130947 ?auto_130943 ) ) ( not ( = ?auto_130947 ?auto_130940 ) ) ( not ( = ?auto_130942 ?auto_130941 ) ) ( not ( = ?auto_130942 ?auto_130945 ) ) ( not ( = ?auto_130942 ?auto_130943 ) ) ( not ( = ?auto_130942 ?auto_130940 ) ) ( not ( = ?auto_130941 ?auto_130945 ) ) ( not ( = ?auto_130941 ?auto_130943 ) ) ( not ( = ?auto_130941 ?auto_130940 ) ) ( not ( = ?auto_130945 ?auto_130943 ) ) ( not ( = ?auto_130945 ?auto_130940 ) ) ( ON ?auto_130940 ?auto_130946 ) ( not ( = ?auto_130940 ?auto_130946 ) ) ( not ( = ?auto_130943 ?auto_130946 ) ) ( not ( = ?auto_130944 ?auto_130946 ) ) ( not ( = ?auto_130947 ?auto_130946 ) ) ( not ( = ?auto_130942 ?auto_130946 ) ) ( not ( = ?auto_130941 ?auto_130946 ) ) ( not ( = ?auto_130945 ?auto_130946 ) ) ( ON ?auto_130943 ?auto_130940 ) ( ON-TABLE ?auto_130946 ) ( ON ?auto_130945 ?auto_130943 ) ( CLEAR ?auto_130942 ) ( ON ?auto_130941 ?auto_130945 ) ( CLEAR ?auto_130941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_130946 ?auto_130940 ?auto_130943 ?auto_130945 )
      ( MAKE-1PILE ?auto_130940 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_130948 - BLOCK
    )
    :vars
    (
      ?auto_130954 - BLOCK
      ?auto_130952 - BLOCK
      ?auto_130953 - BLOCK
      ?auto_130955 - BLOCK
      ?auto_130951 - BLOCK
      ?auto_130949 - BLOCK
      ?auto_130950 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130948 ?auto_130954 ) ) ( ON-TABLE ?auto_130952 ) ( ON ?auto_130953 ?auto_130952 ) ( not ( = ?auto_130952 ?auto_130953 ) ) ( not ( = ?auto_130952 ?auto_130955 ) ) ( not ( = ?auto_130952 ?auto_130951 ) ) ( not ( = ?auto_130952 ?auto_130949 ) ) ( not ( = ?auto_130952 ?auto_130954 ) ) ( not ( = ?auto_130952 ?auto_130948 ) ) ( not ( = ?auto_130953 ?auto_130955 ) ) ( not ( = ?auto_130953 ?auto_130951 ) ) ( not ( = ?auto_130953 ?auto_130949 ) ) ( not ( = ?auto_130953 ?auto_130954 ) ) ( not ( = ?auto_130953 ?auto_130948 ) ) ( not ( = ?auto_130955 ?auto_130951 ) ) ( not ( = ?auto_130955 ?auto_130949 ) ) ( not ( = ?auto_130955 ?auto_130954 ) ) ( not ( = ?auto_130955 ?auto_130948 ) ) ( not ( = ?auto_130951 ?auto_130949 ) ) ( not ( = ?auto_130951 ?auto_130954 ) ) ( not ( = ?auto_130951 ?auto_130948 ) ) ( not ( = ?auto_130949 ?auto_130954 ) ) ( not ( = ?auto_130949 ?auto_130948 ) ) ( ON ?auto_130948 ?auto_130950 ) ( not ( = ?auto_130948 ?auto_130950 ) ) ( not ( = ?auto_130954 ?auto_130950 ) ) ( not ( = ?auto_130952 ?auto_130950 ) ) ( not ( = ?auto_130953 ?auto_130950 ) ) ( not ( = ?auto_130955 ?auto_130950 ) ) ( not ( = ?auto_130951 ?auto_130950 ) ) ( not ( = ?auto_130949 ?auto_130950 ) ) ( ON ?auto_130954 ?auto_130948 ) ( ON-TABLE ?auto_130950 ) ( ON ?auto_130949 ?auto_130954 ) ( ON ?auto_130951 ?auto_130949 ) ( CLEAR ?auto_130951 ) ( HOLDING ?auto_130955 ) ( CLEAR ?auto_130953 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_130952 ?auto_130953 ?auto_130955 )
      ( MAKE-1PILE ?auto_130948 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_130956 - BLOCK
    )
    :vars
    (
      ?auto_130958 - BLOCK
      ?auto_130959 - BLOCK
      ?auto_130960 - BLOCK
      ?auto_130963 - BLOCK
      ?auto_130962 - BLOCK
      ?auto_130957 - BLOCK
      ?auto_130961 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130956 ?auto_130958 ) ) ( ON-TABLE ?auto_130959 ) ( ON ?auto_130960 ?auto_130959 ) ( not ( = ?auto_130959 ?auto_130960 ) ) ( not ( = ?auto_130959 ?auto_130963 ) ) ( not ( = ?auto_130959 ?auto_130962 ) ) ( not ( = ?auto_130959 ?auto_130957 ) ) ( not ( = ?auto_130959 ?auto_130958 ) ) ( not ( = ?auto_130959 ?auto_130956 ) ) ( not ( = ?auto_130960 ?auto_130963 ) ) ( not ( = ?auto_130960 ?auto_130962 ) ) ( not ( = ?auto_130960 ?auto_130957 ) ) ( not ( = ?auto_130960 ?auto_130958 ) ) ( not ( = ?auto_130960 ?auto_130956 ) ) ( not ( = ?auto_130963 ?auto_130962 ) ) ( not ( = ?auto_130963 ?auto_130957 ) ) ( not ( = ?auto_130963 ?auto_130958 ) ) ( not ( = ?auto_130963 ?auto_130956 ) ) ( not ( = ?auto_130962 ?auto_130957 ) ) ( not ( = ?auto_130962 ?auto_130958 ) ) ( not ( = ?auto_130962 ?auto_130956 ) ) ( not ( = ?auto_130957 ?auto_130958 ) ) ( not ( = ?auto_130957 ?auto_130956 ) ) ( ON ?auto_130956 ?auto_130961 ) ( not ( = ?auto_130956 ?auto_130961 ) ) ( not ( = ?auto_130958 ?auto_130961 ) ) ( not ( = ?auto_130959 ?auto_130961 ) ) ( not ( = ?auto_130960 ?auto_130961 ) ) ( not ( = ?auto_130963 ?auto_130961 ) ) ( not ( = ?auto_130962 ?auto_130961 ) ) ( not ( = ?auto_130957 ?auto_130961 ) ) ( ON ?auto_130958 ?auto_130956 ) ( ON-TABLE ?auto_130961 ) ( ON ?auto_130957 ?auto_130958 ) ( ON ?auto_130962 ?auto_130957 ) ( CLEAR ?auto_130960 ) ( ON ?auto_130963 ?auto_130962 ) ( CLEAR ?auto_130963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_130961 ?auto_130956 ?auto_130958 ?auto_130957 ?auto_130962 )
      ( MAKE-1PILE ?auto_130956 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_130964 - BLOCK
    )
    :vars
    (
      ?auto_130965 - BLOCK
      ?auto_130970 - BLOCK
      ?auto_130966 - BLOCK
      ?auto_130971 - BLOCK
      ?auto_130967 - BLOCK
      ?auto_130969 - BLOCK
      ?auto_130968 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130964 ?auto_130965 ) ) ( ON-TABLE ?auto_130970 ) ( not ( = ?auto_130970 ?auto_130966 ) ) ( not ( = ?auto_130970 ?auto_130971 ) ) ( not ( = ?auto_130970 ?auto_130967 ) ) ( not ( = ?auto_130970 ?auto_130969 ) ) ( not ( = ?auto_130970 ?auto_130965 ) ) ( not ( = ?auto_130970 ?auto_130964 ) ) ( not ( = ?auto_130966 ?auto_130971 ) ) ( not ( = ?auto_130966 ?auto_130967 ) ) ( not ( = ?auto_130966 ?auto_130969 ) ) ( not ( = ?auto_130966 ?auto_130965 ) ) ( not ( = ?auto_130966 ?auto_130964 ) ) ( not ( = ?auto_130971 ?auto_130967 ) ) ( not ( = ?auto_130971 ?auto_130969 ) ) ( not ( = ?auto_130971 ?auto_130965 ) ) ( not ( = ?auto_130971 ?auto_130964 ) ) ( not ( = ?auto_130967 ?auto_130969 ) ) ( not ( = ?auto_130967 ?auto_130965 ) ) ( not ( = ?auto_130967 ?auto_130964 ) ) ( not ( = ?auto_130969 ?auto_130965 ) ) ( not ( = ?auto_130969 ?auto_130964 ) ) ( ON ?auto_130964 ?auto_130968 ) ( not ( = ?auto_130964 ?auto_130968 ) ) ( not ( = ?auto_130965 ?auto_130968 ) ) ( not ( = ?auto_130970 ?auto_130968 ) ) ( not ( = ?auto_130966 ?auto_130968 ) ) ( not ( = ?auto_130971 ?auto_130968 ) ) ( not ( = ?auto_130967 ?auto_130968 ) ) ( not ( = ?auto_130969 ?auto_130968 ) ) ( ON ?auto_130965 ?auto_130964 ) ( ON-TABLE ?auto_130968 ) ( ON ?auto_130969 ?auto_130965 ) ( ON ?auto_130967 ?auto_130969 ) ( ON ?auto_130971 ?auto_130967 ) ( CLEAR ?auto_130971 ) ( HOLDING ?auto_130966 ) ( CLEAR ?auto_130970 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_130970 ?auto_130966 )
      ( MAKE-1PILE ?auto_130964 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_130972 - BLOCK
    )
    :vars
    (
      ?auto_130973 - BLOCK
      ?auto_130979 - BLOCK
      ?auto_130974 - BLOCK
      ?auto_130975 - BLOCK
      ?auto_130976 - BLOCK
      ?auto_130977 - BLOCK
      ?auto_130978 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130972 ?auto_130973 ) ) ( ON-TABLE ?auto_130979 ) ( not ( = ?auto_130979 ?auto_130974 ) ) ( not ( = ?auto_130979 ?auto_130975 ) ) ( not ( = ?auto_130979 ?auto_130976 ) ) ( not ( = ?auto_130979 ?auto_130977 ) ) ( not ( = ?auto_130979 ?auto_130973 ) ) ( not ( = ?auto_130979 ?auto_130972 ) ) ( not ( = ?auto_130974 ?auto_130975 ) ) ( not ( = ?auto_130974 ?auto_130976 ) ) ( not ( = ?auto_130974 ?auto_130977 ) ) ( not ( = ?auto_130974 ?auto_130973 ) ) ( not ( = ?auto_130974 ?auto_130972 ) ) ( not ( = ?auto_130975 ?auto_130976 ) ) ( not ( = ?auto_130975 ?auto_130977 ) ) ( not ( = ?auto_130975 ?auto_130973 ) ) ( not ( = ?auto_130975 ?auto_130972 ) ) ( not ( = ?auto_130976 ?auto_130977 ) ) ( not ( = ?auto_130976 ?auto_130973 ) ) ( not ( = ?auto_130976 ?auto_130972 ) ) ( not ( = ?auto_130977 ?auto_130973 ) ) ( not ( = ?auto_130977 ?auto_130972 ) ) ( ON ?auto_130972 ?auto_130978 ) ( not ( = ?auto_130972 ?auto_130978 ) ) ( not ( = ?auto_130973 ?auto_130978 ) ) ( not ( = ?auto_130979 ?auto_130978 ) ) ( not ( = ?auto_130974 ?auto_130978 ) ) ( not ( = ?auto_130975 ?auto_130978 ) ) ( not ( = ?auto_130976 ?auto_130978 ) ) ( not ( = ?auto_130977 ?auto_130978 ) ) ( ON ?auto_130973 ?auto_130972 ) ( ON-TABLE ?auto_130978 ) ( ON ?auto_130977 ?auto_130973 ) ( ON ?auto_130976 ?auto_130977 ) ( ON ?auto_130975 ?auto_130976 ) ( CLEAR ?auto_130979 ) ( ON ?auto_130974 ?auto_130975 ) ( CLEAR ?auto_130974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_130978 ?auto_130972 ?auto_130973 ?auto_130977 ?auto_130976 ?auto_130975 )
      ( MAKE-1PILE ?auto_130972 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_130980 - BLOCK
    )
    :vars
    (
      ?auto_130987 - BLOCK
      ?auto_130985 - BLOCK
      ?auto_130983 - BLOCK
      ?auto_130984 - BLOCK
      ?auto_130981 - BLOCK
      ?auto_130982 - BLOCK
      ?auto_130986 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130980 ?auto_130987 ) ) ( not ( = ?auto_130985 ?auto_130983 ) ) ( not ( = ?auto_130985 ?auto_130984 ) ) ( not ( = ?auto_130985 ?auto_130981 ) ) ( not ( = ?auto_130985 ?auto_130982 ) ) ( not ( = ?auto_130985 ?auto_130987 ) ) ( not ( = ?auto_130985 ?auto_130980 ) ) ( not ( = ?auto_130983 ?auto_130984 ) ) ( not ( = ?auto_130983 ?auto_130981 ) ) ( not ( = ?auto_130983 ?auto_130982 ) ) ( not ( = ?auto_130983 ?auto_130987 ) ) ( not ( = ?auto_130983 ?auto_130980 ) ) ( not ( = ?auto_130984 ?auto_130981 ) ) ( not ( = ?auto_130984 ?auto_130982 ) ) ( not ( = ?auto_130984 ?auto_130987 ) ) ( not ( = ?auto_130984 ?auto_130980 ) ) ( not ( = ?auto_130981 ?auto_130982 ) ) ( not ( = ?auto_130981 ?auto_130987 ) ) ( not ( = ?auto_130981 ?auto_130980 ) ) ( not ( = ?auto_130982 ?auto_130987 ) ) ( not ( = ?auto_130982 ?auto_130980 ) ) ( ON ?auto_130980 ?auto_130986 ) ( not ( = ?auto_130980 ?auto_130986 ) ) ( not ( = ?auto_130987 ?auto_130986 ) ) ( not ( = ?auto_130985 ?auto_130986 ) ) ( not ( = ?auto_130983 ?auto_130986 ) ) ( not ( = ?auto_130984 ?auto_130986 ) ) ( not ( = ?auto_130981 ?auto_130986 ) ) ( not ( = ?auto_130982 ?auto_130986 ) ) ( ON ?auto_130987 ?auto_130980 ) ( ON-TABLE ?auto_130986 ) ( ON ?auto_130982 ?auto_130987 ) ( ON ?auto_130981 ?auto_130982 ) ( ON ?auto_130984 ?auto_130981 ) ( ON ?auto_130983 ?auto_130984 ) ( CLEAR ?auto_130983 ) ( HOLDING ?auto_130985 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_130985 )
      ( MAKE-1PILE ?auto_130980 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_130988 - BLOCK
    )
    :vars
    (
      ?auto_130990 - BLOCK
      ?auto_130991 - BLOCK
      ?auto_130993 - BLOCK
      ?auto_130994 - BLOCK
      ?auto_130992 - BLOCK
      ?auto_130989 - BLOCK
      ?auto_130995 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130988 ?auto_130990 ) ) ( not ( = ?auto_130991 ?auto_130993 ) ) ( not ( = ?auto_130991 ?auto_130994 ) ) ( not ( = ?auto_130991 ?auto_130992 ) ) ( not ( = ?auto_130991 ?auto_130989 ) ) ( not ( = ?auto_130991 ?auto_130990 ) ) ( not ( = ?auto_130991 ?auto_130988 ) ) ( not ( = ?auto_130993 ?auto_130994 ) ) ( not ( = ?auto_130993 ?auto_130992 ) ) ( not ( = ?auto_130993 ?auto_130989 ) ) ( not ( = ?auto_130993 ?auto_130990 ) ) ( not ( = ?auto_130993 ?auto_130988 ) ) ( not ( = ?auto_130994 ?auto_130992 ) ) ( not ( = ?auto_130994 ?auto_130989 ) ) ( not ( = ?auto_130994 ?auto_130990 ) ) ( not ( = ?auto_130994 ?auto_130988 ) ) ( not ( = ?auto_130992 ?auto_130989 ) ) ( not ( = ?auto_130992 ?auto_130990 ) ) ( not ( = ?auto_130992 ?auto_130988 ) ) ( not ( = ?auto_130989 ?auto_130990 ) ) ( not ( = ?auto_130989 ?auto_130988 ) ) ( ON ?auto_130988 ?auto_130995 ) ( not ( = ?auto_130988 ?auto_130995 ) ) ( not ( = ?auto_130990 ?auto_130995 ) ) ( not ( = ?auto_130991 ?auto_130995 ) ) ( not ( = ?auto_130993 ?auto_130995 ) ) ( not ( = ?auto_130994 ?auto_130995 ) ) ( not ( = ?auto_130992 ?auto_130995 ) ) ( not ( = ?auto_130989 ?auto_130995 ) ) ( ON ?auto_130990 ?auto_130988 ) ( ON-TABLE ?auto_130995 ) ( ON ?auto_130989 ?auto_130990 ) ( ON ?auto_130992 ?auto_130989 ) ( ON ?auto_130994 ?auto_130992 ) ( ON ?auto_130993 ?auto_130994 ) ( ON ?auto_130991 ?auto_130993 ) ( CLEAR ?auto_130991 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_130995 ?auto_130988 ?auto_130990 ?auto_130989 ?auto_130992 ?auto_130994 ?auto_130993 )
      ( MAKE-1PILE ?auto_130988 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_131001 - BLOCK
      ?auto_131002 - BLOCK
      ?auto_131003 - BLOCK
      ?auto_131004 - BLOCK
      ?auto_131005 - BLOCK
    )
    :vars
    (
      ?auto_131006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131006 ?auto_131005 ) ( CLEAR ?auto_131006 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_131001 ) ( ON ?auto_131002 ?auto_131001 ) ( ON ?auto_131003 ?auto_131002 ) ( ON ?auto_131004 ?auto_131003 ) ( ON ?auto_131005 ?auto_131004 ) ( not ( = ?auto_131001 ?auto_131002 ) ) ( not ( = ?auto_131001 ?auto_131003 ) ) ( not ( = ?auto_131001 ?auto_131004 ) ) ( not ( = ?auto_131001 ?auto_131005 ) ) ( not ( = ?auto_131001 ?auto_131006 ) ) ( not ( = ?auto_131002 ?auto_131003 ) ) ( not ( = ?auto_131002 ?auto_131004 ) ) ( not ( = ?auto_131002 ?auto_131005 ) ) ( not ( = ?auto_131002 ?auto_131006 ) ) ( not ( = ?auto_131003 ?auto_131004 ) ) ( not ( = ?auto_131003 ?auto_131005 ) ) ( not ( = ?auto_131003 ?auto_131006 ) ) ( not ( = ?auto_131004 ?auto_131005 ) ) ( not ( = ?auto_131004 ?auto_131006 ) ) ( not ( = ?auto_131005 ?auto_131006 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_131006 ?auto_131005 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_131007 - BLOCK
      ?auto_131008 - BLOCK
      ?auto_131009 - BLOCK
      ?auto_131010 - BLOCK
      ?auto_131011 - BLOCK
    )
    :vars
    (
      ?auto_131012 - BLOCK
      ?auto_131013 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131012 ?auto_131011 ) ( CLEAR ?auto_131012 ) ( ON-TABLE ?auto_131007 ) ( ON ?auto_131008 ?auto_131007 ) ( ON ?auto_131009 ?auto_131008 ) ( ON ?auto_131010 ?auto_131009 ) ( ON ?auto_131011 ?auto_131010 ) ( not ( = ?auto_131007 ?auto_131008 ) ) ( not ( = ?auto_131007 ?auto_131009 ) ) ( not ( = ?auto_131007 ?auto_131010 ) ) ( not ( = ?auto_131007 ?auto_131011 ) ) ( not ( = ?auto_131007 ?auto_131012 ) ) ( not ( = ?auto_131008 ?auto_131009 ) ) ( not ( = ?auto_131008 ?auto_131010 ) ) ( not ( = ?auto_131008 ?auto_131011 ) ) ( not ( = ?auto_131008 ?auto_131012 ) ) ( not ( = ?auto_131009 ?auto_131010 ) ) ( not ( = ?auto_131009 ?auto_131011 ) ) ( not ( = ?auto_131009 ?auto_131012 ) ) ( not ( = ?auto_131010 ?auto_131011 ) ) ( not ( = ?auto_131010 ?auto_131012 ) ) ( not ( = ?auto_131011 ?auto_131012 ) ) ( HOLDING ?auto_131013 ) ( not ( = ?auto_131007 ?auto_131013 ) ) ( not ( = ?auto_131008 ?auto_131013 ) ) ( not ( = ?auto_131009 ?auto_131013 ) ) ( not ( = ?auto_131010 ?auto_131013 ) ) ( not ( = ?auto_131011 ?auto_131013 ) ) ( not ( = ?auto_131012 ?auto_131013 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_131013 )
      ( MAKE-5PILE ?auto_131007 ?auto_131008 ?auto_131009 ?auto_131010 ?auto_131011 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_131014 - BLOCK
      ?auto_131015 - BLOCK
      ?auto_131016 - BLOCK
      ?auto_131017 - BLOCK
      ?auto_131018 - BLOCK
    )
    :vars
    (
      ?auto_131019 - BLOCK
      ?auto_131020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131019 ?auto_131018 ) ( ON-TABLE ?auto_131014 ) ( ON ?auto_131015 ?auto_131014 ) ( ON ?auto_131016 ?auto_131015 ) ( ON ?auto_131017 ?auto_131016 ) ( ON ?auto_131018 ?auto_131017 ) ( not ( = ?auto_131014 ?auto_131015 ) ) ( not ( = ?auto_131014 ?auto_131016 ) ) ( not ( = ?auto_131014 ?auto_131017 ) ) ( not ( = ?auto_131014 ?auto_131018 ) ) ( not ( = ?auto_131014 ?auto_131019 ) ) ( not ( = ?auto_131015 ?auto_131016 ) ) ( not ( = ?auto_131015 ?auto_131017 ) ) ( not ( = ?auto_131015 ?auto_131018 ) ) ( not ( = ?auto_131015 ?auto_131019 ) ) ( not ( = ?auto_131016 ?auto_131017 ) ) ( not ( = ?auto_131016 ?auto_131018 ) ) ( not ( = ?auto_131016 ?auto_131019 ) ) ( not ( = ?auto_131017 ?auto_131018 ) ) ( not ( = ?auto_131017 ?auto_131019 ) ) ( not ( = ?auto_131018 ?auto_131019 ) ) ( not ( = ?auto_131014 ?auto_131020 ) ) ( not ( = ?auto_131015 ?auto_131020 ) ) ( not ( = ?auto_131016 ?auto_131020 ) ) ( not ( = ?auto_131017 ?auto_131020 ) ) ( not ( = ?auto_131018 ?auto_131020 ) ) ( not ( = ?auto_131019 ?auto_131020 ) ) ( ON ?auto_131020 ?auto_131019 ) ( CLEAR ?auto_131020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_131014 ?auto_131015 ?auto_131016 ?auto_131017 ?auto_131018 ?auto_131019 )
      ( MAKE-5PILE ?auto_131014 ?auto_131015 ?auto_131016 ?auto_131017 ?auto_131018 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_131021 - BLOCK
      ?auto_131022 - BLOCK
      ?auto_131023 - BLOCK
      ?auto_131024 - BLOCK
      ?auto_131025 - BLOCK
    )
    :vars
    (
      ?auto_131026 - BLOCK
      ?auto_131027 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131026 ?auto_131025 ) ( ON-TABLE ?auto_131021 ) ( ON ?auto_131022 ?auto_131021 ) ( ON ?auto_131023 ?auto_131022 ) ( ON ?auto_131024 ?auto_131023 ) ( ON ?auto_131025 ?auto_131024 ) ( not ( = ?auto_131021 ?auto_131022 ) ) ( not ( = ?auto_131021 ?auto_131023 ) ) ( not ( = ?auto_131021 ?auto_131024 ) ) ( not ( = ?auto_131021 ?auto_131025 ) ) ( not ( = ?auto_131021 ?auto_131026 ) ) ( not ( = ?auto_131022 ?auto_131023 ) ) ( not ( = ?auto_131022 ?auto_131024 ) ) ( not ( = ?auto_131022 ?auto_131025 ) ) ( not ( = ?auto_131022 ?auto_131026 ) ) ( not ( = ?auto_131023 ?auto_131024 ) ) ( not ( = ?auto_131023 ?auto_131025 ) ) ( not ( = ?auto_131023 ?auto_131026 ) ) ( not ( = ?auto_131024 ?auto_131025 ) ) ( not ( = ?auto_131024 ?auto_131026 ) ) ( not ( = ?auto_131025 ?auto_131026 ) ) ( not ( = ?auto_131021 ?auto_131027 ) ) ( not ( = ?auto_131022 ?auto_131027 ) ) ( not ( = ?auto_131023 ?auto_131027 ) ) ( not ( = ?auto_131024 ?auto_131027 ) ) ( not ( = ?auto_131025 ?auto_131027 ) ) ( not ( = ?auto_131026 ?auto_131027 ) ) ( HOLDING ?auto_131027 ) ( CLEAR ?auto_131026 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_131021 ?auto_131022 ?auto_131023 ?auto_131024 ?auto_131025 ?auto_131026 ?auto_131027 )
      ( MAKE-5PILE ?auto_131021 ?auto_131022 ?auto_131023 ?auto_131024 ?auto_131025 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_131028 - BLOCK
      ?auto_131029 - BLOCK
      ?auto_131030 - BLOCK
      ?auto_131031 - BLOCK
      ?auto_131032 - BLOCK
    )
    :vars
    (
      ?auto_131034 - BLOCK
      ?auto_131033 - BLOCK
      ?auto_131035 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131034 ?auto_131032 ) ( ON-TABLE ?auto_131028 ) ( ON ?auto_131029 ?auto_131028 ) ( ON ?auto_131030 ?auto_131029 ) ( ON ?auto_131031 ?auto_131030 ) ( ON ?auto_131032 ?auto_131031 ) ( not ( = ?auto_131028 ?auto_131029 ) ) ( not ( = ?auto_131028 ?auto_131030 ) ) ( not ( = ?auto_131028 ?auto_131031 ) ) ( not ( = ?auto_131028 ?auto_131032 ) ) ( not ( = ?auto_131028 ?auto_131034 ) ) ( not ( = ?auto_131029 ?auto_131030 ) ) ( not ( = ?auto_131029 ?auto_131031 ) ) ( not ( = ?auto_131029 ?auto_131032 ) ) ( not ( = ?auto_131029 ?auto_131034 ) ) ( not ( = ?auto_131030 ?auto_131031 ) ) ( not ( = ?auto_131030 ?auto_131032 ) ) ( not ( = ?auto_131030 ?auto_131034 ) ) ( not ( = ?auto_131031 ?auto_131032 ) ) ( not ( = ?auto_131031 ?auto_131034 ) ) ( not ( = ?auto_131032 ?auto_131034 ) ) ( not ( = ?auto_131028 ?auto_131033 ) ) ( not ( = ?auto_131029 ?auto_131033 ) ) ( not ( = ?auto_131030 ?auto_131033 ) ) ( not ( = ?auto_131031 ?auto_131033 ) ) ( not ( = ?auto_131032 ?auto_131033 ) ) ( not ( = ?auto_131034 ?auto_131033 ) ) ( CLEAR ?auto_131034 ) ( ON ?auto_131033 ?auto_131035 ) ( CLEAR ?auto_131033 ) ( HAND-EMPTY ) ( not ( = ?auto_131028 ?auto_131035 ) ) ( not ( = ?auto_131029 ?auto_131035 ) ) ( not ( = ?auto_131030 ?auto_131035 ) ) ( not ( = ?auto_131031 ?auto_131035 ) ) ( not ( = ?auto_131032 ?auto_131035 ) ) ( not ( = ?auto_131034 ?auto_131035 ) ) ( not ( = ?auto_131033 ?auto_131035 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_131033 ?auto_131035 )
      ( MAKE-5PILE ?auto_131028 ?auto_131029 ?auto_131030 ?auto_131031 ?auto_131032 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_131052 - BLOCK
      ?auto_131053 - BLOCK
      ?auto_131054 - BLOCK
      ?auto_131055 - BLOCK
      ?auto_131056 - BLOCK
    )
    :vars
    (
      ?auto_131059 - BLOCK
      ?auto_131058 - BLOCK
      ?auto_131057 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131052 ) ( ON ?auto_131053 ?auto_131052 ) ( ON ?auto_131054 ?auto_131053 ) ( ON ?auto_131055 ?auto_131054 ) ( not ( = ?auto_131052 ?auto_131053 ) ) ( not ( = ?auto_131052 ?auto_131054 ) ) ( not ( = ?auto_131052 ?auto_131055 ) ) ( not ( = ?auto_131052 ?auto_131056 ) ) ( not ( = ?auto_131052 ?auto_131059 ) ) ( not ( = ?auto_131053 ?auto_131054 ) ) ( not ( = ?auto_131053 ?auto_131055 ) ) ( not ( = ?auto_131053 ?auto_131056 ) ) ( not ( = ?auto_131053 ?auto_131059 ) ) ( not ( = ?auto_131054 ?auto_131055 ) ) ( not ( = ?auto_131054 ?auto_131056 ) ) ( not ( = ?auto_131054 ?auto_131059 ) ) ( not ( = ?auto_131055 ?auto_131056 ) ) ( not ( = ?auto_131055 ?auto_131059 ) ) ( not ( = ?auto_131056 ?auto_131059 ) ) ( not ( = ?auto_131052 ?auto_131058 ) ) ( not ( = ?auto_131053 ?auto_131058 ) ) ( not ( = ?auto_131054 ?auto_131058 ) ) ( not ( = ?auto_131055 ?auto_131058 ) ) ( not ( = ?auto_131056 ?auto_131058 ) ) ( not ( = ?auto_131059 ?auto_131058 ) ) ( ON ?auto_131058 ?auto_131057 ) ( not ( = ?auto_131052 ?auto_131057 ) ) ( not ( = ?auto_131053 ?auto_131057 ) ) ( not ( = ?auto_131054 ?auto_131057 ) ) ( not ( = ?auto_131055 ?auto_131057 ) ) ( not ( = ?auto_131056 ?auto_131057 ) ) ( not ( = ?auto_131059 ?auto_131057 ) ) ( not ( = ?auto_131058 ?auto_131057 ) ) ( ON ?auto_131059 ?auto_131058 ) ( CLEAR ?auto_131059 ) ( HOLDING ?auto_131056 ) ( CLEAR ?auto_131055 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_131052 ?auto_131053 ?auto_131054 ?auto_131055 ?auto_131056 ?auto_131059 )
      ( MAKE-5PILE ?auto_131052 ?auto_131053 ?auto_131054 ?auto_131055 ?auto_131056 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_131060 - BLOCK
      ?auto_131061 - BLOCK
      ?auto_131062 - BLOCK
      ?auto_131063 - BLOCK
      ?auto_131064 - BLOCK
    )
    :vars
    (
      ?auto_131066 - BLOCK
      ?auto_131065 - BLOCK
      ?auto_131067 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131060 ) ( ON ?auto_131061 ?auto_131060 ) ( ON ?auto_131062 ?auto_131061 ) ( ON ?auto_131063 ?auto_131062 ) ( not ( = ?auto_131060 ?auto_131061 ) ) ( not ( = ?auto_131060 ?auto_131062 ) ) ( not ( = ?auto_131060 ?auto_131063 ) ) ( not ( = ?auto_131060 ?auto_131064 ) ) ( not ( = ?auto_131060 ?auto_131066 ) ) ( not ( = ?auto_131061 ?auto_131062 ) ) ( not ( = ?auto_131061 ?auto_131063 ) ) ( not ( = ?auto_131061 ?auto_131064 ) ) ( not ( = ?auto_131061 ?auto_131066 ) ) ( not ( = ?auto_131062 ?auto_131063 ) ) ( not ( = ?auto_131062 ?auto_131064 ) ) ( not ( = ?auto_131062 ?auto_131066 ) ) ( not ( = ?auto_131063 ?auto_131064 ) ) ( not ( = ?auto_131063 ?auto_131066 ) ) ( not ( = ?auto_131064 ?auto_131066 ) ) ( not ( = ?auto_131060 ?auto_131065 ) ) ( not ( = ?auto_131061 ?auto_131065 ) ) ( not ( = ?auto_131062 ?auto_131065 ) ) ( not ( = ?auto_131063 ?auto_131065 ) ) ( not ( = ?auto_131064 ?auto_131065 ) ) ( not ( = ?auto_131066 ?auto_131065 ) ) ( ON ?auto_131065 ?auto_131067 ) ( not ( = ?auto_131060 ?auto_131067 ) ) ( not ( = ?auto_131061 ?auto_131067 ) ) ( not ( = ?auto_131062 ?auto_131067 ) ) ( not ( = ?auto_131063 ?auto_131067 ) ) ( not ( = ?auto_131064 ?auto_131067 ) ) ( not ( = ?auto_131066 ?auto_131067 ) ) ( not ( = ?auto_131065 ?auto_131067 ) ) ( ON ?auto_131066 ?auto_131065 ) ( CLEAR ?auto_131063 ) ( ON ?auto_131064 ?auto_131066 ) ( CLEAR ?auto_131064 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_131067 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_131067 ?auto_131065 ?auto_131066 )
      ( MAKE-5PILE ?auto_131060 ?auto_131061 ?auto_131062 ?auto_131063 ?auto_131064 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_131068 - BLOCK
      ?auto_131069 - BLOCK
      ?auto_131070 - BLOCK
      ?auto_131071 - BLOCK
      ?auto_131072 - BLOCK
    )
    :vars
    (
      ?auto_131074 - BLOCK
      ?auto_131073 - BLOCK
      ?auto_131075 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131068 ) ( ON ?auto_131069 ?auto_131068 ) ( ON ?auto_131070 ?auto_131069 ) ( not ( = ?auto_131068 ?auto_131069 ) ) ( not ( = ?auto_131068 ?auto_131070 ) ) ( not ( = ?auto_131068 ?auto_131071 ) ) ( not ( = ?auto_131068 ?auto_131072 ) ) ( not ( = ?auto_131068 ?auto_131074 ) ) ( not ( = ?auto_131069 ?auto_131070 ) ) ( not ( = ?auto_131069 ?auto_131071 ) ) ( not ( = ?auto_131069 ?auto_131072 ) ) ( not ( = ?auto_131069 ?auto_131074 ) ) ( not ( = ?auto_131070 ?auto_131071 ) ) ( not ( = ?auto_131070 ?auto_131072 ) ) ( not ( = ?auto_131070 ?auto_131074 ) ) ( not ( = ?auto_131071 ?auto_131072 ) ) ( not ( = ?auto_131071 ?auto_131074 ) ) ( not ( = ?auto_131072 ?auto_131074 ) ) ( not ( = ?auto_131068 ?auto_131073 ) ) ( not ( = ?auto_131069 ?auto_131073 ) ) ( not ( = ?auto_131070 ?auto_131073 ) ) ( not ( = ?auto_131071 ?auto_131073 ) ) ( not ( = ?auto_131072 ?auto_131073 ) ) ( not ( = ?auto_131074 ?auto_131073 ) ) ( ON ?auto_131073 ?auto_131075 ) ( not ( = ?auto_131068 ?auto_131075 ) ) ( not ( = ?auto_131069 ?auto_131075 ) ) ( not ( = ?auto_131070 ?auto_131075 ) ) ( not ( = ?auto_131071 ?auto_131075 ) ) ( not ( = ?auto_131072 ?auto_131075 ) ) ( not ( = ?auto_131074 ?auto_131075 ) ) ( not ( = ?auto_131073 ?auto_131075 ) ) ( ON ?auto_131074 ?auto_131073 ) ( ON ?auto_131072 ?auto_131074 ) ( CLEAR ?auto_131072 ) ( ON-TABLE ?auto_131075 ) ( HOLDING ?auto_131071 ) ( CLEAR ?auto_131070 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_131068 ?auto_131069 ?auto_131070 ?auto_131071 )
      ( MAKE-5PILE ?auto_131068 ?auto_131069 ?auto_131070 ?auto_131071 ?auto_131072 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_131076 - BLOCK
      ?auto_131077 - BLOCK
      ?auto_131078 - BLOCK
      ?auto_131079 - BLOCK
      ?auto_131080 - BLOCK
    )
    :vars
    (
      ?auto_131082 - BLOCK
      ?auto_131081 - BLOCK
      ?auto_131083 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131076 ) ( ON ?auto_131077 ?auto_131076 ) ( ON ?auto_131078 ?auto_131077 ) ( not ( = ?auto_131076 ?auto_131077 ) ) ( not ( = ?auto_131076 ?auto_131078 ) ) ( not ( = ?auto_131076 ?auto_131079 ) ) ( not ( = ?auto_131076 ?auto_131080 ) ) ( not ( = ?auto_131076 ?auto_131082 ) ) ( not ( = ?auto_131077 ?auto_131078 ) ) ( not ( = ?auto_131077 ?auto_131079 ) ) ( not ( = ?auto_131077 ?auto_131080 ) ) ( not ( = ?auto_131077 ?auto_131082 ) ) ( not ( = ?auto_131078 ?auto_131079 ) ) ( not ( = ?auto_131078 ?auto_131080 ) ) ( not ( = ?auto_131078 ?auto_131082 ) ) ( not ( = ?auto_131079 ?auto_131080 ) ) ( not ( = ?auto_131079 ?auto_131082 ) ) ( not ( = ?auto_131080 ?auto_131082 ) ) ( not ( = ?auto_131076 ?auto_131081 ) ) ( not ( = ?auto_131077 ?auto_131081 ) ) ( not ( = ?auto_131078 ?auto_131081 ) ) ( not ( = ?auto_131079 ?auto_131081 ) ) ( not ( = ?auto_131080 ?auto_131081 ) ) ( not ( = ?auto_131082 ?auto_131081 ) ) ( ON ?auto_131081 ?auto_131083 ) ( not ( = ?auto_131076 ?auto_131083 ) ) ( not ( = ?auto_131077 ?auto_131083 ) ) ( not ( = ?auto_131078 ?auto_131083 ) ) ( not ( = ?auto_131079 ?auto_131083 ) ) ( not ( = ?auto_131080 ?auto_131083 ) ) ( not ( = ?auto_131082 ?auto_131083 ) ) ( not ( = ?auto_131081 ?auto_131083 ) ) ( ON ?auto_131082 ?auto_131081 ) ( ON ?auto_131080 ?auto_131082 ) ( ON-TABLE ?auto_131083 ) ( CLEAR ?auto_131078 ) ( ON ?auto_131079 ?auto_131080 ) ( CLEAR ?auto_131079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_131083 ?auto_131081 ?auto_131082 ?auto_131080 )
      ( MAKE-5PILE ?auto_131076 ?auto_131077 ?auto_131078 ?auto_131079 ?auto_131080 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_131084 - BLOCK
      ?auto_131085 - BLOCK
      ?auto_131086 - BLOCK
      ?auto_131087 - BLOCK
      ?auto_131088 - BLOCK
    )
    :vars
    (
      ?auto_131090 - BLOCK
      ?auto_131089 - BLOCK
      ?auto_131091 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131084 ) ( ON ?auto_131085 ?auto_131084 ) ( not ( = ?auto_131084 ?auto_131085 ) ) ( not ( = ?auto_131084 ?auto_131086 ) ) ( not ( = ?auto_131084 ?auto_131087 ) ) ( not ( = ?auto_131084 ?auto_131088 ) ) ( not ( = ?auto_131084 ?auto_131090 ) ) ( not ( = ?auto_131085 ?auto_131086 ) ) ( not ( = ?auto_131085 ?auto_131087 ) ) ( not ( = ?auto_131085 ?auto_131088 ) ) ( not ( = ?auto_131085 ?auto_131090 ) ) ( not ( = ?auto_131086 ?auto_131087 ) ) ( not ( = ?auto_131086 ?auto_131088 ) ) ( not ( = ?auto_131086 ?auto_131090 ) ) ( not ( = ?auto_131087 ?auto_131088 ) ) ( not ( = ?auto_131087 ?auto_131090 ) ) ( not ( = ?auto_131088 ?auto_131090 ) ) ( not ( = ?auto_131084 ?auto_131089 ) ) ( not ( = ?auto_131085 ?auto_131089 ) ) ( not ( = ?auto_131086 ?auto_131089 ) ) ( not ( = ?auto_131087 ?auto_131089 ) ) ( not ( = ?auto_131088 ?auto_131089 ) ) ( not ( = ?auto_131090 ?auto_131089 ) ) ( ON ?auto_131089 ?auto_131091 ) ( not ( = ?auto_131084 ?auto_131091 ) ) ( not ( = ?auto_131085 ?auto_131091 ) ) ( not ( = ?auto_131086 ?auto_131091 ) ) ( not ( = ?auto_131087 ?auto_131091 ) ) ( not ( = ?auto_131088 ?auto_131091 ) ) ( not ( = ?auto_131090 ?auto_131091 ) ) ( not ( = ?auto_131089 ?auto_131091 ) ) ( ON ?auto_131090 ?auto_131089 ) ( ON ?auto_131088 ?auto_131090 ) ( ON-TABLE ?auto_131091 ) ( ON ?auto_131087 ?auto_131088 ) ( CLEAR ?auto_131087 ) ( HOLDING ?auto_131086 ) ( CLEAR ?auto_131085 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_131084 ?auto_131085 ?auto_131086 )
      ( MAKE-5PILE ?auto_131084 ?auto_131085 ?auto_131086 ?auto_131087 ?auto_131088 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_131092 - BLOCK
      ?auto_131093 - BLOCK
      ?auto_131094 - BLOCK
      ?auto_131095 - BLOCK
      ?auto_131096 - BLOCK
    )
    :vars
    (
      ?auto_131098 - BLOCK
      ?auto_131097 - BLOCK
      ?auto_131099 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131092 ) ( ON ?auto_131093 ?auto_131092 ) ( not ( = ?auto_131092 ?auto_131093 ) ) ( not ( = ?auto_131092 ?auto_131094 ) ) ( not ( = ?auto_131092 ?auto_131095 ) ) ( not ( = ?auto_131092 ?auto_131096 ) ) ( not ( = ?auto_131092 ?auto_131098 ) ) ( not ( = ?auto_131093 ?auto_131094 ) ) ( not ( = ?auto_131093 ?auto_131095 ) ) ( not ( = ?auto_131093 ?auto_131096 ) ) ( not ( = ?auto_131093 ?auto_131098 ) ) ( not ( = ?auto_131094 ?auto_131095 ) ) ( not ( = ?auto_131094 ?auto_131096 ) ) ( not ( = ?auto_131094 ?auto_131098 ) ) ( not ( = ?auto_131095 ?auto_131096 ) ) ( not ( = ?auto_131095 ?auto_131098 ) ) ( not ( = ?auto_131096 ?auto_131098 ) ) ( not ( = ?auto_131092 ?auto_131097 ) ) ( not ( = ?auto_131093 ?auto_131097 ) ) ( not ( = ?auto_131094 ?auto_131097 ) ) ( not ( = ?auto_131095 ?auto_131097 ) ) ( not ( = ?auto_131096 ?auto_131097 ) ) ( not ( = ?auto_131098 ?auto_131097 ) ) ( ON ?auto_131097 ?auto_131099 ) ( not ( = ?auto_131092 ?auto_131099 ) ) ( not ( = ?auto_131093 ?auto_131099 ) ) ( not ( = ?auto_131094 ?auto_131099 ) ) ( not ( = ?auto_131095 ?auto_131099 ) ) ( not ( = ?auto_131096 ?auto_131099 ) ) ( not ( = ?auto_131098 ?auto_131099 ) ) ( not ( = ?auto_131097 ?auto_131099 ) ) ( ON ?auto_131098 ?auto_131097 ) ( ON ?auto_131096 ?auto_131098 ) ( ON-TABLE ?auto_131099 ) ( ON ?auto_131095 ?auto_131096 ) ( CLEAR ?auto_131093 ) ( ON ?auto_131094 ?auto_131095 ) ( CLEAR ?auto_131094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_131099 ?auto_131097 ?auto_131098 ?auto_131096 ?auto_131095 )
      ( MAKE-5PILE ?auto_131092 ?auto_131093 ?auto_131094 ?auto_131095 ?auto_131096 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_131100 - BLOCK
      ?auto_131101 - BLOCK
      ?auto_131102 - BLOCK
      ?auto_131103 - BLOCK
      ?auto_131104 - BLOCK
    )
    :vars
    (
      ?auto_131105 - BLOCK
      ?auto_131106 - BLOCK
      ?auto_131107 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131100 ) ( not ( = ?auto_131100 ?auto_131101 ) ) ( not ( = ?auto_131100 ?auto_131102 ) ) ( not ( = ?auto_131100 ?auto_131103 ) ) ( not ( = ?auto_131100 ?auto_131104 ) ) ( not ( = ?auto_131100 ?auto_131105 ) ) ( not ( = ?auto_131101 ?auto_131102 ) ) ( not ( = ?auto_131101 ?auto_131103 ) ) ( not ( = ?auto_131101 ?auto_131104 ) ) ( not ( = ?auto_131101 ?auto_131105 ) ) ( not ( = ?auto_131102 ?auto_131103 ) ) ( not ( = ?auto_131102 ?auto_131104 ) ) ( not ( = ?auto_131102 ?auto_131105 ) ) ( not ( = ?auto_131103 ?auto_131104 ) ) ( not ( = ?auto_131103 ?auto_131105 ) ) ( not ( = ?auto_131104 ?auto_131105 ) ) ( not ( = ?auto_131100 ?auto_131106 ) ) ( not ( = ?auto_131101 ?auto_131106 ) ) ( not ( = ?auto_131102 ?auto_131106 ) ) ( not ( = ?auto_131103 ?auto_131106 ) ) ( not ( = ?auto_131104 ?auto_131106 ) ) ( not ( = ?auto_131105 ?auto_131106 ) ) ( ON ?auto_131106 ?auto_131107 ) ( not ( = ?auto_131100 ?auto_131107 ) ) ( not ( = ?auto_131101 ?auto_131107 ) ) ( not ( = ?auto_131102 ?auto_131107 ) ) ( not ( = ?auto_131103 ?auto_131107 ) ) ( not ( = ?auto_131104 ?auto_131107 ) ) ( not ( = ?auto_131105 ?auto_131107 ) ) ( not ( = ?auto_131106 ?auto_131107 ) ) ( ON ?auto_131105 ?auto_131106 ) ( ON ?auto_131104 ?auto_131105 ) ( ON-TABLE ?auto_131107 ) ( ON ?auto_131103 ?auto_131104 ) ( ON ?auto_131102 ?auto_131103 ) ( CLEAR ?auto_131102 ) ( HOLDING ?auto_131101 ) ( CLEAR ?auto_131100 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_131100 ?auto_131101 )
      ( MAKE-5PILE ?auto_131100 ?auto_131101 ?auto_131102 ?auto_131103 ?auto_131104 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_131108 - BLOCK
      ?auto_131109 - BLOCK
      ?auto_131110 - BLOCK
      ?auto_131111 - BLOCK
      ?auto_131112 - BLOCK
    )
    :vars
    (
      ?auto_131114 - BLOCK
      ?auto_131115 - BLOCK
      ?auto_131113 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131108 ) ( not ( = ?auto_131108 ?auto_131109 ) ) ( not ( = ?auto_131108 ?auto_131110 ) ) ( not ( = ?auto_131108 ?auto_131111 ) ) ( not ( = ?auto_131108 ?auto_131112 ) ) ( not ( = ?auto_131108 ?auto_131114 ) ) ( not ( = ?auto_131109 ?auto_131110 ) ) ( not ( = ?auto_131109 ?auto_131111 ) ) ( not ( = ?auto_131109 ?auto_131112 ) ) ( not ( = ?auto_131109 ?auto_131114 ) ) ( not ( = ?auto_131110 ?auto_131111 ) ) ( not ( = ?auto_131110 ?auto_131112 ) ) ( not ( = ?auto_131110 ?auto_131114 ) ) ( not ( = ?auto_131111 ?auto_131112 ) ) ( not ( = ?auto_131111 ?auto_131114 ) ) ( not ( = ?auto_131112 ?auto_131114 ) ) ( not ( = ?auto_131108 ?auto_131115 ) ) ( not ( = ?auto_131109 ?auto_131115 ) ) ( not ( = ?auto_131110 ?auto_131115 ) ) ( not ( = ?auto_131111 ?auto_131115 ) ) ( not ( = ?auto_131112 ?auto_131115 ) ) ( not ( = ?auto_131114 ?auto_131115 ) ) ( ON ?auto_131115 ?auto_131113 ) ( not ( = ?auto_131108 ?auto_131113 ) ) ( not ( = ?auto_131109 ?auto_131113 ) ) ( not ( = ?auto_131110 ?auto_131113 ) ) ( not ( = ?auto_131111 ?auto_131113 ) ) ( not ( = ?auto_131112 ?auto_131113 ) ) ( not ( = ?auto_131114 ?auto_131113 ) ) ( not ( = ?auto_131115 ?auto_131113 ) ) ( ON ?auto_131114 ?auto_131115 ) ( ON ?auto_131112 ?auto_131114 ) ( ON-TABLE ?auto_131113 ) ( ON ?auto_131111 ?auto_131112 ) ( ON ?auto_131110 ?auto_131111 ) ( CLEAR ?auto_131108 ) ( ON ?auto_131109 ?auto_131110 ) ( CLEAR ?auto_131109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_131113 ?auto_131115 ?auto_131114 ?auto_131112 ?auto_131111 ?auto_131110 )
      ( MAKE-5PILE ?auto_131108 ?auto_131109 ?auto_131110 ?auto_131111 ?auto_131112 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_131116 - BLOCK
      ?auto_131117 - BLOCK
      ?auto_131118 - BLOCK
      ?auto_131119 - BLOCK
      ?auto_131120 - BLOCK
    )
    :vars
    (
      ?auto_131123 - BLOCK
      ?auto_131122 - BLOCK
      ?auto_131121 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131116 ?auto_131117 ) ) ( not ( = ?auto_131116 ?auto_131118 ) ) ( not ( = ?auto_131116 ?auto_131119 ) ) ( not ( = ?auto_131116 ?auto_131120 ) ) ( not ( = ?auto_131116 ?auto_131123 ) ) ( not ( = ?auto_131117 ?auto_131118 ) ) ( not ( = ?auto_131117 ?auto_131119 ) ) ( not ( = ?auto_131117 ?auto_131120 ) ) ( not ( = ?auto_131117 ?auto_131123 ) ) ( not ( = ?auto_131118 ?auto_131119 ) ) ( not ( = ?auto_131118 ?auto_131120 ) ) ( not ( = ?auto_131118 ?auto_131123 ) ) ( not ( = ?auto_131119 ?auto_131120 ) ) ( not ( = ?auto_131119 ?auto_131123 ) ) ( not ( = ?auto_131120 ?auto_131123 ) ) ( not ( = ?auto_131116 ?auto_131122 ) ) ( not ( = ?auto_131117 ?auto_131122 ) ) ( not ( = ?auto_131118 ?auto_131122 ) ) ( not ( = ?auto_131119 ?auto_131122 ) ) ( not ( = ?auto_131120 ?auto_131122 ) ) ( not ( = ?auto_131123 ?auto_131122 ) ) ( ON ?auto_131122 ?auto_131121 ) ( not ( = ?auto_131116 ?auto_131121 ) ) ( not ( = ?auto_131117 ?auto_131121 ) ) ( not ( = ?auto_131118 ?auto_131121 ) ) ( not ( = ?auto_131119 ?auto_131121 ) ) ( not ( = ?auto_131120 ?auto_131121 ) ) ( not ( = ?auto_131123 ?auto_131121 ) ) ( not ( = ?auto_131122 ?auto_131121 ) ) ( ON ?auto_131123 ?auto_131122 ) ( ON ?auto_131120 ?auto_131123 ) ( ON-TABLE ?auto_131121 ) ( ON ?auto_131119 ?auto_131120 ) ( ON ?auto_131118 ?auto_131119 ) ( ON ?auto_131117 ?auto_131118 ) ( CLEAR ?auto_131117 ) ( HOLDING ?auto_131116 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_131116 )
      ( MAKE-5PILE ?auto_131116 ?auto_131117 ?auto_131118 ?auto_131119 ?auto_131120 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_131124 - BLOCK
      ?auto_131125 - BLOCK
      ?auto_131126 - BLOCK
      ?auto_131127 - BLOCK
      ?auto_131128 - BLOCK
    )
    :vars
    (
      ?auto_131131 - BLOCK
      ?auto_131129 - BLOCK
      ?auto_131130 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131124 ?auto_131125 ) ) ( not ( = ?auto_131124 ?auto_131126 ) ) ( not ( = ?auto_131124 ?auto_131127 ) ) ( not ( = ?auto_131124 ?auto_131128 ) ) ( not ( = ?auto_131124 ?auto_131131 ) ) ( not ( = ?auto_131125 ?auto_131126 ) ) ( not ( = ?auto_131125 ?auto_131127 ) ) ( not ( = ?auto_131125 ?auto_131128 ) ) ( not ( = ?auto_131125 ?auto_131131 ) ) ( not ( = ?auto_131126 ?auto_131127 ) ) ( not ( = ?auto_131126 ?auto_131128 ) ) ( not ( = ?auto_131126 ?auto_131131 ) ) ( not ( = ?auto_131127 ?auto_131128 ) ) ( not ( = ?auto_131127 ?auto_131131 ) ) ( not ( = ?auto_131128 ?auto_131131 ) ) ( not ( = ?auto_131124 ?auto_131129 ) ) ( not ( = ?auto_131125 ?auto_131129 ) ) ( not ( = ?auto_131126 ?auto_131129 ) ) ( not ( = ?auto_131127 ?auto_131129 ) ) ( not ( = ?auto_131128 ?auto_131129 ) ) ( not ( = ?auto_131131 ?auto_131129 ) ) ( ON ?auto_131129 ?auto_131130 ) ( not ( = ?auto_131124 ?auto_131130 ) ) ( not ( = ?auto_131125 ?auto_131130 ) ) ( not ( = ?auto_131126 ?auto_131130 ) ) ( not ( = ?auto_131127 ?auto_131130 ) ) ( not ( = ?auto_131128 ?auto_131130 ) ) ( not ( = ?auto_131131 ?auto_131130 ) ) ( not ( = ?auto_131129 ?auto_131130 ) ) ( ON ?auto_131131 ?auto_131129 ) ( ON ?auto_131128 ?auto_131131 ) ( ON-TABLE ?auto_131130 ) ( ON ?auto_131127 ?auto_131128 ) ( ON ?auto_131126 ?auto_131127 ) ( ON ?auto_131125 ?auto_131126 ) ( ON ?auto_131124 ?auto_131125 ) ( CLEAR ?auto_131124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_131130 ?auto_131129 ?auto_131131 ?auto_131128 ?auto_131127 ?auto_131126 ?auto_131125 )
      ( MAKE-5PILE ?auto_131124 ?auto_131125 ?auto_131126 ?auto_131127 ?auto_131128 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_131134 - BLOCK
      ?auto_131135 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_131135 ) ( CLEAR ?auto_131134 ) ( ON-TABLE ?auto_131134 ) ( not ( = ?auto_131134 ?auto_131135 ) ) )
    :subtasks
    ( ( !STACK ?auto_131135 ?auto_131134 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_131136 - BLOCK
      ?auto_131137 - BLOCK
    )
    :vars
    (
      ?auto_131138 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_131136 ) ( ON-TABLE ?auto_131136 ) ( not ( = ?auto_131136 ?auto_131137 ) ) ( ON ?auto_131137 ?auto_131138 ) ( CLEAR ?auto_131137 ) ( HAND-EMPTY ) ( not ( = ?auto_131136 ?auto_131138 ) ) ( not ( = ?auto_131137 ?auto_131138 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_131137 ?auto_131138 )
      ( MAKE-2PILE ?auto_131136 ?auto_131137 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_131139 - BLOCK
      ?auto_131140 - BLOCK
    )
    :vars
    (
      ?auto_131141 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131139 ?auto_131140 ) ) ( ON ?auto_131140 ?auto_131141 ) ( CLEAR ?auto_131140 ) ( not ( = ?auto_131139 ?auto_131141 ) ) ( not ( = ?auto_131140 ?auto_131141 ) ) ( HOLDING ?auto_131139 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_131139 )
      ( MAKE-2PILE ?auto_131139 ?auto_131140 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_131142 - BLOCK
      ?auto_131143 - BLOCK
    )
    :vars
    (
      ?auto_131144 - BLOCK
      ?auto_131148 - BLOCK
      ?auto_131146 - BLOCK
      ?auto_131145 - BLOCK
      ?auto_131147 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131142 ?auto_131143 ) ) ( ON ?auto_131143 ?auto_131144 ) ( not ( = ?auto_131142 ?auto_131144 ) ) ( not ( = ?auto_131143 ?auto_131144 ) ) ( ON ?auto_131142 ?auto_131143 ) ( CLEAR ?auto_131142 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_131148 ) ( ON ?auto_131146 ?auto_131148 ) ( ON ?auto_131145 ?auto_131146 ) ( ON ?auto_131147 ?auto_131145 ) ( ON ?auto_131144 ?auto_131147 ) ( not ( = ?auto_131148 ?auto_131146 ) ) ( not ( = ?auto_131148 ?auto_131145 ) ) ( not ( = ?auto_131148 ?auto_131147 ) ) ( not ( = ?auto_131148 ?auto_131144 ) ) ( not ( = ?auto_131148 ?auto_131143 ) ) ( not ( = ?auto_131148 ?auto_131142 ) ) ( not ( = ?auto_131146 ?auto_131145 ) ) ( not ( = ?auto_131146 ?auto_131147 ) ) ( not ( = ?auto_131146 ?auto_131144 ) ) ( not ( = ?auto_131146 ?auto_131143 ) ) ( not ( = ?auto_131146 ?auto_131142 ) ) ( not ( = ?auto_131145 ?auto_131147 ) ) ( not ( = ?auto_131145 ?auto_131144 ) ) ( not ( = ?auto_131145 ?auto_131143 ) ) ( not ( = ?auto_131145 ?auto_131142 ) ) ( not ( = ?auto_131147 ?auto_131144 ) ) ( not ( = ?auto_131147 ?auto_131143 ) ) ( not ( = ?auto_131147 ?auto_131142 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_131148 ?auto_131146 ?auto_131145 ?auto_131147 ?auto_131144 ?auto_131143 )
      ( MAKE-2PILE ?auto_131142 ?auto_131143 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_131149 - BLOCK
      ?auto_131150 - BLOCK
    )
    :vars
    (
      ?auto_131152 - BLOCK
      ?auto_131155 - BLOCK
      ?auto_131154 - BLOCK
      ?auto_131151 - BLOCK
      ?auto_131153 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131149 ?auto_131150 ) ) ( ON ?auto_131150 ?auto_131152 ) ( not ( = ?auto_131149 ?auto_131152 ) ) ( not ( = ?auto_131150 ?auto_131152 ) ) ( ON-TABLE ?auto_131155 ) ( ON ?auto_131154 ?auto_131155 ) ( ON ?auto_131151 ?auto_131154 ) ( ON ?auto_131153 ?auto_131151 ) ( ON ?auto_131152 ?auto_131153 ) ( not ( = ?auto_131155 ?auto_131154 ) ) ( not ( = ?auto_131155 ?auto_131151 ) ) ( not ( = ?auto_131155 ?auto_131153 ) ) ( not ( = ?auto_131155 ?auto_131152 ) ) ( not ( = ?auto_131155 ?auto_131150 ) ) ( not ( = ?auto_131155 ?auto_131149 ) ) ( not ( = ?auto_131154 ?auto_131151 ) ) ( not ( = ?auto_131154 ?auto_131153 ) ) ( not ( = ?auto_131154 ?auto_131152 ) ) ( not ( = ?auto_131154 ?auto_131150 ) ) ( not ( = ?auto_131154 ?auto_131149 ) ) ( not ( = ?auto_131151 ?auto_131153 ) ) ( not ( = ?auto_131151 ?auto_131152 ) ) ( not ( = ?auto_131151 ?auto_131150 ) ) ( not ( = ?auto_131151 ?auto_131149 ) ) ( not ( = ?auto_131153 ?auto_131152 ) ) ( not ( = ?auto_131153 ?auto_131150 ) ) ( not ( = ?auto_131153 ?auto_131149 ) ) ( HOLDING ?auto_131149 ) ( CLEAR ?auto_131150 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_131155 ?auto_131154 ?auto_131151 ?auto_131153 ?auto_131152 ?auto_131150 ?auto_131149 )
      ( MAKE-2PILE ?auto_131149 ?auto_131150 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_131156 - BLOCK
      ?auto_131157 - BLOCK
    )
    :vars
    (
      ?auto_131161 - BLOCK
      ?auto_131159 - BLOCK
      ?auto_131158 - BLOCK
      ?auto_131160 - BLOCK
      ?auto_131162 - BLOCK
      ?auto_131163 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131156 ?auto_131157 ) ) ( ON ?auto_131157 ?auto_131161 ) ( not ( = ?auto_131156 ?auto_131161 ) ) ( not ( = ?auto_131157 ?auto_131161 ) ) ( ON-TABLE ?auto_131159 ) ( ON ?auto_131158 ?auto_131159 ) ( ON ?auto_131160 ?auto_131158 ) ( ON ?auto_131162 ?auto_131160 ) ( ON ?auto_131161 ?auto_131162 ) ( not ( = ?auto_131159 ?auto_131158 ) ) ( not ( = ?auto_131159 ?auto_131160 ) ) ( not ( = ?auto_131159 ?auto_131162 ) ) ( not ( = ?auto_131159 ?auto_131161 ) ) ( not ( = ?auto_131159 ?auto_131157 ) ) ( not ( = ?auto_131159 ?auto_131156 ) ) ( not ( = ?auto_131158 ?auto_131160 ) ) ( not ( = ?auto_131158 ?auto_131162 ) ) ( not ( = ?auto_131158 ?auto_131161 ) ) ( not ( = ?auto_131158 ?auto_131157 ) ) ( not ( = ?auto_131158 ?auto_131156 ) ) ( not ( = ?auto_131160 ?auto_131162 ) ) ( not ( = ?auto_131160 ?auto_131161 ) ) ( not ( = ?auto_131160 ?auto_131157 ) ) ( not ( = ?auto_131160 ?auto_131156 ) ) ( not ( = ?auto_131162 ?auto_131161 ) ) ( not ( = ?auto_131162 ?auto_131157 ) ) ( not ( = ?auto_131162 ?auto_131156 ) ) ( CLEAR ?auto_131157 ) ( ON ?auto_131156 ?auto_131163 ) ( CLEAR ?auto_131156 ) ( HAND-EMPTY ) ( not ( = ?auto_131156 ?auto_131163 ) ) ( not ( = ?auto_131157 ?auto_131163 ) ) ( not ( = ?auto_131161 ?auto_131163 ) ) ( not ( = ?auto_131159 ?auto_131163 ) ) ( not ( = ?auto_131158 ?auto_131163 ) ) ( not ( = ?auto_131160 ?auto_131163 ) ) ( not ( = ?auto_131162 ?auto_131163 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_131156 ?auto_131163 )
      ( MAKE-2PILE ?auto_131156 ?auto_131157 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_131164 - BLOCK
      ?auto_131165 - BLOCK
    )
    :vars
    (
      ?auto_131166 - BLOCK
      ?auto_131169 - BLOCK
      ?auto_131168 - BLOCK
      ?auto_131170 - BLOCK
      ?auto_131167 - BLOCK
      ?auto_131171 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131164 ?auto_131165 ) ) ( not ( = ?auto_131164 ?auto_131166 ) ) ( not ( = ?auto_131165 ?auto_131166 ) ) ( ON-TABLE ?auto_131169 ) ( ON ?auto_131168 ?auto_131169 ) ( ON ?auto_131170 ?auto_131168 ) ( ON ?auto_131167 ?auto_131170 ) ( ON ?auto_131166 ?auto_131167 ) ( not ( = ?auto_131169 ?auto_131168 ) ) ( not ( = ?auto_131169 ?auto_131170 ) ) ( not ( = ?auto_131169 ?auto_131167 ) ) ( not ( = ?auto_131169 ?auto_131166 ) ) ( not ( = ?auto_131169 ?auto_131165 ) ) ( not ( = ?auto_131169 ?auto_131164 ) ) ( not ( = ?auto_131168 ?auto_131170 ) ) ( not ( = ?auto_131168 ?auto_131167 ) ) ( not ( = ?auto_131168 ?auto_131166 ) ) ( not ( = ?auto_131168 ?auto_131165 ) ) ( not ( = ?auto_131168 ?auto_131164 ) ) ( not ( = ?auto_131170 ?auto_131167 ) ) ( not ( = ?auto_131170 ?auto_131166 ) ) ( not ( = ?auto_131170 ?auto_131165 ) ) ( not ( = ?auto_131170 ?auto_131164 ) ) ( not ( = ?auto_131167 ?auto_131166 ) ) ( not ( = ?auto_131167 ?auto_131165 ) ) ( not ( = ?auto_131167 ?auto_131164 ) ) ( ON ?auto_131164 ?auto_131171 ) ( CLEAR ?auto_131164 ) ( not ( = ?auto_131164 ?auto_131171 ) ) ( not ( = ?auto_131165 ?auto_131171 ) ) ( not ( = ?auto_131166 ?auto_131171 ) ) ( not ( = ?auto_131169 ?auto_131171 ) ) ( not ( = ?auto_131168 ?auto_131171 ) ) ( not ( = ?auto_131170 ?auto_131171 ) ) ( not ( = ?auto_131167 ?auto_131171 ) ) ( HOLDING ?auto_131165 ) ( CLEAR ?auto_131166 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_131169 ?auto_131168 ?auto_131170 ?auto_131167 ?auto_131166 ?auto_131165 )
      ( MAKE-2PILE ?auto_131164 ?auto_131165 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_131172 - BLOCK
      ?auto_131173 - BLOCK
    )
    :vars
    (
      ?auto_131177 - BLOCK
      ?auto_131175 - BLOCK
      ?auto_131174 - BLOCK
      ?auto_131179 - BLOCK
      ?auto_131178 - BLOCK
      ?auto_131176 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131172 ?auto_131173 ) ) ( not ( = ?auto_131172 ?auto_131177 ) ) ( not ( = ?auto_131173 ?auto_131177 ) ) ( ON-TABLE ?auto_131175 ) ( ON ?auto_131174 ?auto_131175 ) ( ON ?auto_131179 ?auto_131174 ) ( ON ?auto_131178 ?auto_131179 ) ( ON ?auto_131177 ?auto_131178 ) ( not ( = ?auto_131175 ?auto_131174 ) ) ( not ( = ?auto_131175 ?auto_131179 ) ) ( not ( = ?auto_131175 ?auto_131178 ) ) ( not ( = ?auto_131175 ?auto_131177 ) ) ( not ( = ?auto_131175 ?auto_131173 ) ) ( not ( = ?auto_131175 ?auto_131172 ) ) ( not ( = ?auto_131174 ?auto_131179 ) ) ( not ( = ?auto_131174 ?auto_131178 ) ) ( not ( = ?auto_131174 ?auto_131177 ) ) ( not ( = ?auto_131174 ?auto_131173 ) ) ( not ( = ?auto_131174 ?auto_131172 ) ) ( not ( = ?auto_131179 ?auto_131178 ) ) ( not ( = ?auto_131179 ?auto_131177 ) ) ( not ( = ?auto_131179 ?auto_131173 ) ) ( not ( = ?auto_131179 ?auto_131172 ) ) ( not ( = ?auto_131178 ?auto_131177 ) ) ( not ( = ?auto_131178 ?auto_131173 ) ) ( not ( = ?auto_131178 ?auto_131172 ) ) ( ON ?auto_131172 ?auto_131176 ) ( not ( = ?auto_131172 ?auto_131176 ) ) ( not ( = ?auto_131173 ?auto_131176 ) ) ( not ( = ?auto_131177 ?auto_131176 ) ) ( not ( = ?auto_131175 ?auto_131176 ) ) ( not ( = ?auto_131174 ?auto_131176 ) ) ( not ( = ?auto_131179 ?auto_131176 ) ) ( not ( = ?auto_131178 ?auto_131176 ) ) ( CLEAR ?auto_131177 ) ( ON ?auto_131173 ?auto_131172 ) ( CLEAR ?auto_131173 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_131176 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_131176 ?auto_131172 )
      ( MAKE-2PILE ?auto_131172 ?auto_131173 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_131180 - BLOCK
      ?auto_131181 - BLOCK
    )
    :vars
    (
      ?auto_131187 - BLOCK
      ?auto_131186 - BLOCK
      ?auto_131185 - BLOCK
      ?auto_131182 - BLOCK
      ?auto_131184 - BLOCK
      ?auto_131183 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131180 ?auto_131181 ) ) ( not ( = ?auto_131180 ?auto_131187 ) ) ( not ( = ?auto_131181 ?auto_131187 ) ) ( ON-TABLE ?auto_131186 ) ( ON ?auto_131185 ?auto_131186 ) ( ON ?auto_131182 ?auto_131185 ) ( ON ?auto_131184 ?auto_131182 ) ( not ( = ?auto_131186 ?auto_131185 ) ) ( not ( = ?auto_131186 ?auto_131182 ) ) ( not ( = ?auto_131186 ?auto_131184 ) ) ( not ( = ?auto_131186 ?auto_131187 ) ) ( not ( = ?auto_131186 ?auto_131181 ) ) ( not ( = ?auto_131186 ?auto_131180 ) ) ( not ( = ?auto_131185 ?auto_131182 ) ) ( not ( = ?auto_131185 ?auto_131184 ) ) ( not ( = ?auto_131185 ?auto_131187 ) ) ( not ( = ?auto_131185 ?auto_131181 ) ) ( not ( = ?auto_131185 ?auto_131180 ) ) ( not ( = ?auto_131182 ?auto_131184 ) ) ( not ( = ?auto_131182 ?auto_131187 ) ) ( not ( = ?auto_131182 ?auto_131181 ) ) ( not ( = ?auto_131182 ?auto_131180 ) ) ( not ( = ?auto_131184 ?auto_131187 ) ) ( not ( = ?auto_131184 ?auto_131181 ) ) ( not ( = ?auto_131184 ?auto_131180 ) ) ( ON ?auto_131180 ?auto_131183 ) ( not ( = ?auto_131180 ?auto_131183 ) ) ( not ( = ?auto_131181 ?auto_131183 ) ) ( not ( = ?auto_131187 ?auto_131183 ) ) ( not ( = ?auto_131186 ?auto_131183 ) ) ( not ( = ?auto_131185 ?auto_131183 ) ) ( not ( = ?auto_131182 ?auto_131183 ) ) ( not ( = ?auto_131184 ?auto_131183 ) ) ( ON ?auto_131181 ?auto_131180 ) ( CLEAR ?auto_131181 ) ( ON-TABLE ?auto_131183 ) ( HOLDING ?auto_131187 ) ( CLEAR ?auto_131184 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_131186 ?auto_131185 ?auto_131182 ?auto_131184 ?auto_131187 )
      ( MAKE-2PILE ?auto_131180 ?auto_131181 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_131188 - BLOCK
      ?auto_131189 - BLOCK
    )
    :vars
    (
      ?auto_131193 - BLOCK
      ?auto_131195 - BLOCK
      ?auto_131191 - BLOCK
      ?auto_131190 - BLOCK
      ?auto_131192 - BLOCK
      ?auto_131194 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131188 ?auto_131189 ) ) ( not ( = ?auto_131188 ?auto_131193 ) ) ( not ( = ?auto_131189 ?auto_131193 ) ) ( ON-TABLE ?auto_131195 ) ( ON ?auto_131191 ?auto_131195 ) ( ON ?auto_131190 ?auto_131191 ) ( ON ?auto_131192 ?auto_131190 ) ( not ( = ?auto_131195 ?auto_131191 ) ) ( not ( = ?auto_131195 ?auto_131190 ) ) ( not ( = ?auto_131195 ?auto_131192 ) ) ( not ( = ?auto_131195 ?auto_131193 ) ) ( not ( = ?auto_131195 ?auto_131189 ) ) ( not ( = ?auto_131195 ?auto_131188 ) ) ( not ( = ?auto_131191 ?auto_131190 ) ) ( not ( = ?auto_131191 ?auto_131192 ) ) ( not ( = ?auto_131191 ?auto_131193 ) ) ( not ( = ?auto_131191 ?auto_131189 ) ) ( not ( = ?auto_131191 ?auto_131188 ) ) ( not ( = ?auto_131190 ?auto_131192 ) ) ( not ( = ?auto_131190 ?auto_131193 ) ) ( not ( = ?auto_131190 ?auto_131189 ) ) ( not ( = ?auto_131190 ?auto_131188 ) ) ( not ( = ?auto_131192 ?auto_131193 ) ) ( not ( = ?auto_131192 ?auto_131189 ) ) ( not ( = ?auto_131192 ?auto_131188 ) ) ( ON ?auto_131188 ?auto_131194 ) ( not ( = ?auto_131188 ?auto_131194 ) ) ( not ( = ?auto_131189 ?auto_131194 ) ) ( not ( = ?auto_131193 ?auto_131194 ) ) ( not ( = ?auto_131195 ?auto_131194 ) ) ( not ( = ?auto_131191 ?auto_131194 ) ) ( not ( = ?auto_131190 ?auto_131194 ) ) ( not ( = ?auto_131192 ?auto_131194 ) ) ( ON ?auto_131189 ?auto_131188 ) ( ON-TABLE ?auto_131194 ) ( CLEAR ?auto_131192 ) ( ON ?auto_131193 ?auto_131189 ) ( CLEAR ?auto_131193 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_131194 ?auto_131188 ?auto_131189 )
      ( MAKE-2PILE ?auto_131188 ?auto_131189 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_131196 - BLOCK
      ?auto_131197 - BLOCK
    )
    :vars
    (
      ?auto_131199 - BLOCK
      ?auto_131198 - BLOCK
      ?auto_131200 - BLOCK
      ?auto_131202 - BLOCK
      ?auto_131201 - BLOCK
      ?auto_131203 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131196 ?auto_131197 ) ) ( not ( = ?auto_131196 ?auto_131199 ) ) ( not ( = ?auto_131197 ?auto_131199 ) ) ( ON-TABLE ?auto_131198 ) ( ON ?auto_131200 ?auto_131198 ) ( ON ?auto_131202 ?auto_131200 ) ( not ( = ?auto_131198 ?auto_131200 ) ) ( not ( = ?auto_131198 ?auto_131202 ) ) ( not ( = ?auto_131198 ?auto_131201 ) ) ( not ( = ?auto_131198 ?auto_131199 ) ) ( not ( = ?auto_131198 ?auto_131197 ) ) ( not ( = ?auto_131198 ?auto_131196 ) ) ( not ( = ?auto_131200 ?auto_131202 ) ) ( not ( = ?auto_131200 ?auto_131201 ) ) ( not ( = ?auto_131200 ?auto_131199 ) ) ( not ( = ?auto_131200 ?auto_131197 ) ) ( not ( = ?auto_131200 ?auto_131196 ) ) ( not ( = ?auto_131202 ?auto_131201 ) ) ( not ( = ?auto_131202 ?auto_131199 ) ) ( not ( = ?auto_131202 ?auto_131197 ) ) ( not ( = ?auto_131202 ?auto_131196 ) ) ( not ( = ?auto_131201 ?auto_131199 ) ) ( not ( = ?auto_131201 ?auto_131197 ) ) ( not ( = ?auto_131201 ?auto_131196 ) ) ( ON ?auto_131196 ?auto_131203 ) ( not ( = ?auto_131196 ?auto_131203 ) ) ( not ( = ?auto_131197 ?auto_131203 ) ) ( not ( = ?auto_131199 ?auto_131203 ) ) ( not ( = ?auto_131198 ?auto_131203 ) ) ( not ( = ?auto_131200 ?auto_131203 ) ) ( not ( = ?auto_131202 ?auto_131203 ) ) ( not ( = ?auto_131201 ?auto_131203 ) ) ( ON ?auto_131197 ?auto_131196 ) ( ON-TABLE ?auto_131203 ) ( ON ?auto_131199 ?auto_131197 ) ( CLEAR ?auto_131199 ) ( HOLDING ?auto_131201 ) ( CLEAR ?auto_131202 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_131198 ?auto_131200 ?auto_131202 ?auto_131201 )
      ( MAKE-2PILE ?auto_131196 ?auto_131197 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_131204 - BLOCK
      ?auto_131205 - BLOCK
    )
    :vars
    (
      ?auto_131207 - BLOCK
      ?auto_131209 - BLOCK
      ?auto_131208 - BLOCK
      ?auto_131210 - BLOCK
      ?auto_131206 - BLOCK
      ?auto_131211 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131204 ?auto_131205 ) ) ( not ( = ?auto_131204 ?auto_131207 ) ) ( not ( = ?auto_131205 ?auto_131207 ) ) ( ON-TABLE ?auto_131209 ) ( ON ?auto_131208 ?auto_131209 ) ( ON ?auto_131210 ?auto_131208 ) ( not ( = ?auto_131209 ?auto_131208 ) ) ( not ( = ?auto_131209 ?auto_131210 ) ) ( not ( = ?auto_131209 ?auto_131206 ) ) ( not ( = ?auto_131209 ?auto_131207 ) ) ( not ( = ?auto_131209 ?auto_131205 ) ) ( not ( = ?auto_131209 ?auto_131204 ) ) ( not ( = ?auto_131208 ?auto_131210 ) ) ( not ( = ?auto_131208 ?auto_131206 ) ) ( not ( = ?auto_131208 ?auto_131207 ) ) ( not ( = ?auto_131208 ?auto_131205 ) ) ( not ( = ?auto_131208 ?auto_131204 ) ) ( not ( = ?auto_131210 ?auto_131206 ) ) ( not ( = ?auto_131210 ?auto_131207 ) ) ( not ( = ?auto_131210 ?auto_131205 ) ) ( not ( = ?auto_131210 ?auto_131204 ) ) ( not ( = ?auto_131206 ?auto_131207 ) ) ( not ( = ?auto_131206 ?auto_131205 ) ) ( not ( = ?auto_131206 ?auto_131204 ) ) ( ON ?auto_131204 ?auto_131211 ) ( not ( = ?auto_131204 ?auto_131211 ) ) ( not ( = ?auto_131205 ?auto_131211 ) ) ( not ( = ?auto_131207 ?auto_131211 ) ) ( not ( = ?auto_131209 ?auto_131211 ) ) ( not ( = ?auto_131208 ?auto_131211 ) ) ( not ( = ?auto_131210 ?auto_131211 ) ) ( not ( = ?auto_131206 ?auto_131211 ) ) ( ON ?auto_131205 ?auto_131204 ) ( ON-TABLE ?auto_131211 ) ( ON ?auto_131207 ?auto_131205 ) ( CLEAR ?auto_131210 ) ( ON ?auto_131206 ?auto_131207 ) ( CLEAR ?auto_131206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_131211 ?auto_131204 ?auto_131205 ?auto_131207 )
      ( MAKE-2PILE ?auto_131204 ?auto_131205 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_131212 - BLOCK
      ?auto_131213 - BLOCK
    )
    :vars
    (
      ?auto_131216 - BLOCK
      ?auto_131215 - BLOCK
      ?auto_131214 - BLOCK
      ?auto_131219 - BLOCK
      ?auto_131218 - BLOCK
      ?auto_131217 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131212 ?auto_131213 ) ) ( not ( = ?auto_131212 ?auto_131216 ) ) ( not ( = ?auto_131213 ?auto_131216 ) ) ( ON-TABLE ?auto_131215 ) ( ON ?auto_131214 ?auto_131215 ) ( not ( = ?auto_131215 ?auto_131214 ) ) ( not ( = ?auto_131215 ?auto_131219 ) ) ( not ( = ?auto_131215 ?auto_131218 ) ) ( not ( = ?auto_131215 ?auto_131216 ) ) ( not ( = ?auto_131215 ?auto_131213 ) ) ( not ( = ?auto_131215 ?auto_131212 ) ) ( not ( = ?auto_131214 ?auto_131219 ) ) ( not ( = ?auto_131214 ?auto_131218 ) ) ( not ( = ?auto_131214 ?auto_131216 ) ) ( not ( = ?auto_131214 ?auto_131213 ) ) ( not ( = ?auto_131214 ?auto_131212 ) ) ( not ( = ?auto_131219 ?auto_131218 ) ) ( not ( = ?auto_131219 ?auto_131216 ) ) ( not ( = ?auto_131219 ?auto_131213 ) ) ( not ( = ?auto_131219 ?auto_131212 ) ) ( not ( = ?auto_131218 ?auto_131216 ) ) ( not ( = ?auto_131218 ?auto_131213 ) ) ( not ( = ?auto_131218 ?auto_131212 ) ) ( ON ?auto_131212 ?auto_131217 ) ( not ( = ?auto_131212 ?auto_131217 ) ) ( not ( = ?auto_131213 ?auto_131217 ) ) ( not ( = ?auto_131216 ?auto_131217 ) ) ( not ( = ?auto_131215 ?auto_131217 ) ) ( not ( = ?auto_131214 ?auto_131217 ) ) ( not ( = ?auto_131219 ?auto_131217 ) ) ( not ( = ?auto_131218 ?auto_131217 ) ) ( ON ?auto_131213 ?auto_131212 ) ( ON-TABLE ?auto_131217 ) ( ON ?auto_131216 ?auto_131213 ) ( ON ?auto_131218 ?auto_131216 ) ( CLEAR ?auto_131218 ) ( HOLDING ?auto_131219 ) ( CLEAR ?auto_131214 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_131215 ?auto_131214 ?auto_131219 )
      ( MAKE-2PILE ?auto_131212 ?auto_131213 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_131220 - BLOCK
      ?auto_131221 - BLOCK
    )
    :vars
    (
      ?auto_131223 - BLOCK
      ?auto_131225 - BLOCK
      ?auto_131222 - BLOCK
      ?auto_131226 - BLOCK
      ?auto_131224 - BLOCK
      ?auto_131227 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131220 ?auto_131221 ) ) ( not ( = ?auto_131220 ?auto_131223 ) ) ( not ( = ?auto_131221 ?auto_131223 ) ) ( ON-TABLE ?auto_131225 ) ( ON ?auto_131222 ?auto_131225 ) ( not ( = ?auto_131225 ?auto_131222 ) ) ( not ( = ?auto_131225 ?auto_131226 ) ) ( not ( = ?auto_131225 ?auto_131224 ) ) ( not ( = ?auto_131225 ?auto_131223 ) ) ( not ( = ?auto_131225 ?auto_131221 ) ) ( not ( = ?auto_131225 ?auto_131220 ) ) ( not ( = ?auto_131222 ?auto_131226 ) ) ( not ( = ?auto_131222 ?auto_131224 ) ) ( not ( = ?auto_131222 ?auto_131223 ) ) ( not ( = ?auto_131222 ?auto_131221 ) ) ( not ( = ?auto_131222 ?auto_131220 ) ) ( not ( = ?auto_131226 ?auto_131224 ) ) ( not ( = ?auto_131226 ?auto_131223 ) ) ( not ( = ?auto_131226 ?auto_131221 ) ) ( not ( = ?auto_131226 ?auto_131220 ) ) ( not ( = ?auto_131224 ?auto_131223 ) ) ( not ( = ?auto_131224 ?auto_131221 ) ) ( not ( = ?auto_131224 ?auto_131220 ) ) ( ON ?auto_131220 ?auto_131227 ) ( not ( = ?auto_131220 ?auto_131227 ) ) ( not ( = ?auto_131221 ?auto_131227 ) ) ( not ( = ?auto_131223 ?auto_131227 ) ) ( not ( = ?auto_131225 ?auto_131227 ) ) ( not ( = ?auto_131222 ?auto_131227 ) ) ( not ( = ?auto_131226 ?auto_131227 ) ) ( not ( = ?auto_131224 ?auto_131227 ) ) ( ON ?auto_131221 ?auto_131220 ) ( ON-TABLE ?auto_131227 ) ( ON ?auto_131223 ?auto_131221 ) ( ON ?auto_131224 ?auto_131223 ) ( CLEAR ?auto_131222 ) ( ON ?auto_131226 ?auto_131224 ) ( CLEAR ?auto_131226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_131227 ?auto_131220 ?auto_131221 ?auto_131223 ?auto_131224 )
      ( MAKE-2PILE ?auto_131220 ?auto_131221 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_131228 - BLOCK
      ?auto_131229 - BLOCK
    )
    :vars
    (
      ?auto_131235 - BLOCK
      ?auto_131232 - BLOCK
      ?auto_131231 - BLOCK
      ?auto_131233 - BLOCK
      ?auto_131234 - BLOCK
      ?auto_131230 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131228 ?auto_131229 ) ) ( not ( = ?auto_131228 ?auto_131235 ) ) ( not ( = ?auto_131229 ?auto_131235 ) ) ( ON-TABLE ?auto_131232 ) ( not ( = ?auto_131232 ?auto_131231 ) ) ( not ( = ?auto_131232 ?auto_131233 ) ) ( not ( = ?auto_131232 ?auto_131234 ) ) ( not ( = ?auto_131232 ?auto_131235 ) ) ( not ( = ?auto_131232 ?auto_131229 ) ) ( not ( = ?auto_131232 ?auto_131228 ) ) ( not ( = ?auto_131231 ?auto_131233 ) ) ( not ( = ?auto_131231 ?auto_131234 ) ) ( not ( = ?auto_131231 ?auto_131235 ) ) ( not ( = ?auto_131231 ?auto_131229 ) ) ( not ( = ?auto_131231 ?auto_131228 ) ) ( not ( = ?auto_131233 ?auto_131234 ) ) ( not ( = ?auto_131233 ?auto_131235 ) ) ( not ( = ?auto_131233 ?auto_131229 ) ) ( not ( = ?auto_131233 ?auto_131228 ) ) ( not ( = ?auto_131234 ?auto_131235 ) ) ( not ( = ?auto_131234 ?auto_131229 ) ) ( not ( = ?auto_131234 ?auto_131228 ) ) ( ON ?auto_131228 ?auto_131230 ) ( not ( = ?auto_131228 ?auto_131230 ) ) ( not ( = ?auto_131229 ?auto_131230 ) ) ( not ( = ?auto_131235 ?auto_131230 ) ) ( not ( = ?auto_131232 ?auto_131230 ) ) ( not ( = ?auto_131231 ?auto_131230 ) ) ( not ( = ?auto_131233 ?auto_131230 ) ) ( not ( = ?auto_131234 ?auto_131230 ) ) ( ON ?auto_131229 ?auto_131228 ) ( ON-TABLE ?auto_131230 ) ( ON ?auto_131235 ?auto_131229 ) ( ON ?auto_131234 ?auto_131235 ) ( ON ?auto_131233 ?auto_131234 ) ( CLEAR ?auto_131233 ) ( HOLDING ?auto_131231 ) ( CLEAR ?auto_131232 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_131232 ?auto_131231 )
      ( MAKE-2PILE ?auto_131228 ?auto_131229 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_131236 - BLOCK
      ?auto_131237 - BLOCK
    )
    :vars
    (
      ?auto_131243 - BLOCK
      ?auto_131238 - BLOCK
      ?auto_131242 - BLOCK
      ?auto_131239 - BLOCK
      ?auto_131241 - BLOCK
      ?auto_131240 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131236 ?auto_131237 ) ) ( not ( = ?auto_131236 ?auto_131243 ) ) ( not ( = ?auto_131237 ?auto_131243 ) ) ( ON-TABLE ?auto_131238 ) ( not ( = ?auto_131238 ?auto_131242 ) ) ( not ( = ?auto_131238 ?auto_131239 ) ) ( not ( = ?auto_131238 ?auto_131241 ) ) ( not ( = ?auto_131238 ?auto_131243 ) ) ( not ( = ?auto_131238 ?auto_131237 ) ) ( not ( = ?auto_131238 ?auto_131236 ) ) ( not ( = ?auto_131242 ?auto_131239 ) ) ( not ( = ?auto_131242 ?auto_131241 ) ) ( not ( = ?auto_131242 ?auto_131243 ) ) ( not ( = ?auto_131242 ?auto_131237 ) ) ( not ( = ?auto_131242 ?auto_131236 ) ) ( not ( = ?auto_131239 ?auto_131241 ) ) ( not ( = ?auto_131239 ?auto_131243 ) ) ( not ( = ?auto_131239 ?auto_131237 ) ) ( not ( = ?auto_131239 ?auto_131236 ) ) ( not ( = ?auto_131241 ?auto_131243 ) ) ( not ( = ?auto_131241 ?auto_131237 ) ) ( not ( = ?auto_131241 ?auto_131236 ) ) ( ON ?auto_131236 ?auto_131240 ) ( not ( = ?auto_131236 ?auto_131240 ) ) ( not ( = ?auto_131237 ?auto_131240 ) ) ( not ( = ?auto_131243 ?auto_131240 ) ) ( not ( = ?auto_131238 ?auto_131240 ) ) ( not ( = ?auto_131242 ?auto_131240 ) ) ( not ( = ?auto_131239 ?auto_131240 ) ) ( not ( = ?auto_131241 ?auto_131240 ) ) ( ON ?auto_131237 ?auto_131236 ) ( ON-TABLE ?auto_131240 ) ( ON ?auto_131243 ?auto_131237 ) ( ON ?auto_131241 ?auto_131243 ) ( ON ?auto_131239 ?auto_131241 ) ( CLEAR ?auto_131238 ) ( ON ?auto_131242 ?auto_131239 ) ( CLEAR ?auto_131242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_131240 ?auto_131236 ?auto_131237 ?auto_131243 ?auto_131241 ?auto_131239 )
      ( MAKE-2PILE ?auto_131236 ?auto_131237 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_131244 - BLOCK
      ?auto_131245 - BLOCK
    )
    :vars
    (
      ?auto_131246 - BLOCK
      ?auto_131250 - BLOCK
      ?auto_131247 - BLOCK
      ?auto_131248 - BLOCK
      ?auto_131249 - BLOCK
      ?auto_131251 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131244 ?auto_131245 ) ) ( not ( = ?auto_131244 ?auto_131246 ) ) ( not ( = ?auto_131245 ?auto_131246 ) ) ( not ( = ?auto_131250 ?auto_131247 ) ) ( not ( = ?auto_131250 ?auto_131248 ) ) ( not ( = ?auto_131250 ?auto_131249 ) ) ( not ( = ?auto_131250 ?auto_131246 ) ) ( not ( = ?auto_131250 ?auto_131245 ) ) ( not ( = ?auto_131250 ?auto_131244 ) ) ( not ( = ?auto_131247 ?auto_131248 ) ) ( not ( = ?auto_131247 ?auto_131249 ) ) ( not ( = ?auto_131247 ?auto_131246 ) ) ( not ( = ?auto_131247 ?auto_131245 ) ) ( not ( = ?auto_131247 ?auto_131244 ) ) ( not ( = ?auto_131248 ?auto_131249 ) ) ( not ( = ?auto_131248 ?auto_131246 ) ) ( not ( = ?auto_131248 ?auto_131245 ) ) ( not ( = ?auto_131248 ?auto_131244 ) ) ( not ( = ?auto_131249 ?auto_131246 ) ) ( not ( = ?auto_131249 ?auto_131245 ) ) ( not ( = ?auto_131249 ?auto_131244 ) ) ( ON ?auto_131244 ?auto_131251 ) ( not ( = ?auto_131244 ?auto_131251 ) ) ( not ( = ?auto_131245 ?auto_131251 ) ) ( not ( = ?auto_131246 ?auto_131251 ) ) ( not ( = ?auto_131250 ?auto_131251 ) ) ( not ( = ?auto_131247 ?auto_131251 ) ) ( not ( = ?auto_131248 ?auto_131251 ) ) ( not ( = ?auto_131249 ?auto_131251 ) ) ( ON ?auto_131245 ?auto_131244 ) ( ON-TABLE ?auto_131251 ) ( ON ?auto_131246 ?auto_131245 ) ( ON ?auto_131249 ?auto_131246 ) ( ON ?auto_131248 ?auto_131249 ) ( ON ?auto_131247 ?auto_131248 ) ( CLEAR ?auto_131247 ) ( HOLDING ?auto_131250 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_131250 )
      ( MAKE-2PILE ?auto_131244 ?auto_131245 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_131252 - BLOCK
      ?auto_131253 - BLOCK
    )
    :vars
    (
      ?auto_131256 - BLOCK
      ?auto_131255 - BLOCK
      ?auto_131257 - BLOCK
      ?auto_131254 - BLOCK
      ?auto_131258 - BLOCK
      ?auto_131259 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131252 ?auto_131253 ) ) ( not ( = ?auto_131252 ?auto_131256 ) ) ( not ( = ?auto_131253 ?auto_131256 ) ) ( not ( = ?auto_131255 ?auto_131257 ) ) ( not ( = ?auto_131255 ?auto_131254 ) ) ( not ( = ?auto_131255 ?auto_131258 ) ) ( not ( = ?auto_131255 ?auto_131256 ) ) ( not ( = ?auto_131255 ?auto_131253 ) ) ( not ( = ?auto_131255 ?auto_131252 ) ) ( not ( = ?auto_131257 ?auto_131254 ) ) ( not ( = ?auto_131257 ?auto_131258 ) ) ( not ( = ?auto_131257 ?auto_131256 ) ) ( not ( = ?auto_131257 ?auto_131253 ) ) ( not ( = ?auto_131257 ?auto_131252 ) ) ( not ( = ?auto_131254 ?auto_131258 ) ) ( not ( = ?auto_131254 ?auto_131256 ) ) ( not ( = ?auto_131254 ?auto_131253 ) ) ( not ( = ?auto_131254 ?auto_131252 ) ) ( not ( = ?auto_131258 ?auto_131256 ) ) ( not ( = ?auto_131258 ?auto_131253 ) ) ( not ( = ?auto_131258 ?auto_131252 ) ) ( ON ?auto_131252 ?auto_131259 ) ( not ( = ?auto_131252 ?auto_131259 ) ) ( not ( = ?auto_131253 ?auto_131259 ) ) ( not ( = ?auto_131256 ?auto_131259 ) ) ( not ( = ?auto_131255 ?auto_131259 ) ) ( not ( = ?auto_131257 ?auto_131259 ) ) ( not ( = ?auto_131254 ?auto_131259 ) ) ( not ( = ?auto_131258 ?auto_131259 ) ) ( ON ?auto_131253 ?auto_131252 ) ( ON-TABLE ?auto_131259 ) ( ON ?auto_131256 ?auto_131253 ) ( ON ?auto_131258 ?auto_131256 ) ( ON ?auto_131254 ?auto_131258 ) ( ON ?auto_131257 ?auto_131254 ) ( ON ?auto_131255 ?auto_131257 ) ( CLEAR ?auto_131255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_131259 ?auto_131252 ?auto_131253 ?auto_131256 ?auto_131258 ?auto_131254 ?auto_131257 )
      ( MAKE-2PILE ?auto_131252 ?auto_131253 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_131264 - BLOCK
      ?auto_131265 - BLOCK
      ?auto_131266 - BLOCK
      ?auto_131267 - BLOCK
    )
    :vars
    (
      ?auto_131268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131268 ?auto_131267 ) ( CLEAR ?auto_131268 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_131264 ) ( ON ?auto_131265 ?auto_131264 ) ( ON ?auto_131266 ?auto_131265 ) ( ON ?auto_131267 ?auto_131266 ) ( not ( = ?auto_131264 ?auto_131265 ) ) ( not ( = ?auto_131264 ?auto_131266 ) ) ( not ( = ?auto_131264 ?auto_131267 ) ) ( not ( = ?auto_131264 ?auto_131268 ) ) ( not ( = ?auto_131265 ?auto_131266 ) ) ( not ( = ?auto_131265 ?auto_131267 ) ) ( not ( = ?auto_131265 ?auto_131268 ) ) ( not ( = ?auto_131266 ?auto_131267 ) ) ( not ( = ?auto_131266 ?auto_131268 ) ) ( not ( = ?auto_131267 ?auto_131268 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_131268 ?auto_131267 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_131269 - BLOCK
      ?auto_131270 - BLOCK
      ?auto_131271 - BLOCK
      ?auto_131272 - BLOCK
    )
    :vars
    (
      ?auto_131273 - BLOCK
      ?auto_131274 - BLOCK
      ?auto_131275 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131273 ?auto_131272 ) ( CLEAR ?auto_131273 ) ( ON-TABLE ?auto_131269 ) ( ON ?auto_131270 ?auto_131269 ) ( ON ?auto_131271 ?auto_131270 ) ( ON ?auto_131272 ?auto_131271 ) ( not ( = ?auto_131269 ?auto_131270 ) ) ( not ( = ?auto_131269 ?auto_131271 ) ) ( not ( = ?auto_131269 ?auto_131272 ) ) ( not ( = ?auto_131269 ?auto_131273 ) ) ( not ( = ?auto_131270 ?auto_131271 ) ) ( not ( = ?auto_131270 ?auto_131272 ) ) ( not ( = ?auto_131270 ?auto_131273 ) ) ( not ( = ?auto_131271 ?auto_131272 ) ) ( not ( = ?auto_131271 ?auto_131273 ) ) ( not ( = ?auto_131272 ?auto_131273 ) ) ( HOLDING ?auto_131274 ) ( CLEAR ?auto_131275 ) ( not ( = ?auto_131269 ?auto_131274 ) ) ( not ( = ?auto_131269 ?auto_131275 ) ) ( not ( = ?auto_131270 ?auto_131274 ) ) ( not ( = ?auto_131270 ?auto_131275 ) ) ( not ( = ?auto_131271 ?auto_131274 ) ) ( not ( = ?auto_131271 ?auto_131275 ) ) ( not ( = ?auto_131272 ?auto_131274 ) ) ( not ( = ?auto_131272 ?auto_131275 ) ) ( not ( = ?auto_131273 ?auto_131274 ) ) ( not ( = ?auto_131273 ?auto_131275 ) ) ( not ( = ?auto_131274 ?auto_131275 ) ) )
    :subtasks
    ( ( !STACK ?auto_131274 ?auto_131275 )
      ( MAKE-4PILE ?auto_131269 ?auto_131270 ?auto_131271 ?auto_131272 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_131276 - BLOCK
      ?auto_131277 - BLOCK
      ?auto_131278 - BLOCK
      ?auto_131279 - BLOCK
    )
    :vars
    (
      ?auto_131280 - BLOCK
      ?auto_131282 - BLOCK
      ?auto_131281 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131280 ?auto_131279 ) ( ON-TABLE ?auto_131276 ) ( ON ?auto_131277 ?auto_131276 ) ( ON ?auto_131278 ?auto_131277 ) ( ON ?auto_131279 ?auto_131278 ) ( not ( = ?auto_131276 ?auto_131277 ) ) ( not ( = ?auto_131276 ?auto_131278 ) ) ( not ( = ?auto_131276 ?auto_131279 ) ) ( not ( = ?auto_131276 ?auto_131280 ) ) ( not ( = ?auto_131277 ?auto_131278 ) ) ( not ( = ?auto_131277 ?auto_131279 ) ) ( not ( = ?auto_131277 ?auto_131280 ) ) ( not ( = ?auto_131278 ?auto_131279 ) ) ( not ( = ?auto_131278 ?auto_131280 ) ) ( not ( = ?auto_131279 ?auto_131280 ) ) ( CLEAR ?auto_131282 ) ( not ( = ?auto_131276 ?auto_131281 ) ) ( not ( = ?auto_131276 ?auto_131282 ) ) ( not ( = ?auto_131277 ?auto_131281 ) ) ( not ( = ?auto_131277 ?auto_131282 ) ) ( not ( = ?auto_131278 ?auto_131281 ) ) ( not ( = ?auto_131278 ?auto_131282 ) ) ( not ( = ?auto_131279 ?auto_131281 ) ) ( not ( = ?auto_131279 ?auto_131282 ) ) ( not ( = ?auto_131280 ?auto_131281 ) ) ( not ( = ?auto_131280 ?auto_131282 ) ) ( not ( = ?auto_131281 ?auto_131282 ) ) ( ON ?auto_131281 ?auto_131280 ) ( CLEAR ?auto_131281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_131276 ?auto_131277 ?auto_131278 ?auto_131279 ?auto_131280 )
      ( MAKE-4PILE ?auto_131276 ?auto_131277 ?auto_131278 ?auto_131279 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_131283 - BLOCK
      ?auto_131284 - BLOCK
      ?auto_131285 - BLOCK
      ?auto_131286 - BLOCK
    )
    :vars
    (
      ?auto_131288 - BLOCK
      ?auto_131287 - BLOCK
      ?auto_131289 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131288 ?auto_131286 ) ( ON-TABLE ?auto_131283 ) ( ON ?auto_131284 ?auto_131283 ) ( ON ?auto_131285 ?auto_131284 ) ( ON ?auto_131286 ?auto_131285 ) ( not ( = ?auto_131283 ?auto_131284 ) ) ( not ( = ?auto_131283 ?auto_131285 ) ) ( not ( = ?auto_131283 ?auto_131286 ) ) ( not ( = ?auto_131283 ?auto_131288 ) ) ( not ( = ?auto_131284 ?auto_131285 ) ) ( not ( = ?auto_131284 ?auto_131286 ) ) ( not ( = ?auto_131284 ?auto_131288 ) ) ( not ( = ?auto_131285 ?auto_131286 ) ) ( not ( = ?auto_131285 ?auto_131288 ) ) ( not ( = ?auto_131286 ?auto_131288 ) ) ( not ( = ?auto_131283 ?auto_131287 ) ) ( not ( = ?auto_131283 ?auto_131289 ) ) ( not ( = ?auto_131284 ?auto_131287 ) ) ( not ( = ?auto_131284 ?auto_131289 ) ) ( not ( = ?auto_131285 ?auto_131287 ) ) ( not ( = ?auto_131285 ?auto_131289 ) ) ( not ( = ?auto_131286 ?auto_131287 ) ) ( not ( = ?auto_131286 ?auto_131289 ) ) ( not ( = ?auto_131288 ?auto_131287 ) ) ( not ( = ?auto_131288 ?auto_131289 ) ) ( not ( = ?auto_131287 ?auto_131289 ) ) ( ON ?auto_131287 ?auto_131288 ) ( CLEAR ?auto_131287 ) ( HOLDING ?auto_131289 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_131289 )
      ( MAKE-4PILE ?auto_131283 ?auto_131284 ?auto_131285 ?auto_131286 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_131290 - BLOCK
      ?auto_131291 - BLOCK
      ?auto_131292 - BLOCK
      ?auto_131293 - BLOCK
    )
    :vars
    (
      ?auto_131296 - BLOCK
      ?auto_131294 - BLOCK
      ?auto_131295 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131296 ?auto_131293 ) ( ON-TABLE ?auto_131290 ) ( ON ?auto_131291 ?auto_131290 ) ( ON ?auto_131292 ?auto_131291 ) ( ON ?auto_131293 ?auto_131292 ) ( not ( = ?auto_131290 ?auto_131291 ) ) ( not ( = ?auto_131290 ?auto_131292 ) ) ( not ( = ?auto_131290 ?auto_131293 ) ) ( not ( = ?auto_131290 ?auto_131296 ) ) ( not ( = ?auto_131291 ?auto_131292 ) ) ( not ( = ?auto_131291 ?auto_131293 ) ) ( not ( = ?auto_131291 ?auto_131296 ) ) ( not ( = ?auto_131292 ?auto_131293 ) ) ( not ( = ?auto_131292 ?auto_131296 ) ) ( not ( = ?auto_131293 ?auto_131296 ) ) ( not ( = ?auto_131290 ?auto_131294 ) ) ( not ( = ?auto_131290 ?auto_131295 ) ) ( not ( = ?auto_131291 ?auto_131294 ) ) ( not ( = ?auto_131291 ?auto_131295 ) ) ( not ( = ?auto_131292 ?auto_131294 ) ) ( not ( = ?auto_131292 ?auto_131295 ) ) ( not ( = ?auto_131293 ?auto_131294 ) ) ( not ( = ?auto_131293 ?auto_131295 ) ) ( not ( = ?auto_131296 ?auto_131294 ) ) ( not ( = ?auto_131296 ?auto_131295 ) ) ( not ( = ?auto_131294 ?auto_131295 ) ) ( ON ?auto_131294 ?auto_131296 ) ( ON ?auto_131295 ?auto_131294 ) ( CLEAR ?auto_131295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_131290 ?auto_131291 ?auto_131292 ?auto_131293 ?auto_131296 ?auto_131294 )
      ( MAKE-4PILE ?auto_131290 ?auto_131291 ?auto_131292 ?auto_131293 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_131297 - BLOCK
      ?auto_131298 - BLOCK
      ?auto_131299 - BLOCK
      ?auto_131300 - BLOCK
    )
    :vars
    (
      ?auto_131303 - BLOCK
      ?auto_131302 - BLOCK
      ?auto_131301 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131303 ?auto_131300 ) ( ON-TABLE ?auto_131297 ) ( ON ?auto_131298 ?auto_131297 ) ( ON ?auto_131299 ?auto_131298 ) ( ON ?auto_131300 ?auto_131299 ) ( not ( = ?auto_131297 ?auto_131298 ) ) ( not ( = ?auto_131297 ?auto_131299 ) ) ( not ( = ?auto_131297 ?auto_131300 ) ) ( not ( = ?auto_131297 ?auto_131303 ) ) ( not ( = ?auto_131298 ?auto_131299 ) ) ( not ( = ?auto_131298 ?auto_131300 ) ) ( not ( = ?auto_131298 ?auto_131303 ) ) ( not ( = ?auto_131299 ?auto_131300 ) ) ( not ( = ?auto_131299 ?auto_131303 ) ) ( not ( = ?auto_131300 ?auto_131303 ) ) ( not ( = ?auto_131297 ?auto_131302 ) ) ( not ( = ?auto_131297 ?auto_131301 ) ) ( not ( = ?auto_131298 ?auto_131302 ) ) ( not ( = ?auto_131298 ?auto_131301 ) ) ( not ( = ?auto_131299 ?auto_131302 ) ) ( not ( = ?auto_131299 ?auto_131301 ) ) ( not ( = ?auto_131300 ?auto_131302 ) ) ( not ( = ?auto_131300 ?auto_131301 ) ) ( not ( = ?auto_131303 ?auto_131302 ) ) ( not ( = ?auto_131303 ?auto_131301 ) ) ( not ( = ?auto_131302 ?auto_131301 ) ) ( ON ?auto_131302 ?auto_131303 ) ( HOLDING ?auto_131301 ) ( CLEAR ?auto_131302 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_131297 ?auto_131298 ?auto_131299 ?auto_131300 ?auto_131303 ?auto_131302 ?auto_131301 )
      ( MAKE-4PILE ?auto_131297 ?auto_131298 ?auto_131299 ?auto_131300 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_131304 - BLOCK
      ?auto_131305 - BLOCK
      ?auto_131306 - BLOCK
      ?auto_131307 - BLOCK
    )
    :vars
    (
      ?auto_131310 - BLOCK
      ?auto_131309 - BLOCK
      ?auto_131308 - BLOCK
      ?auto_131311 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131310 ?auto_131307 ) ( ON-TABLE ?auto_131304 ) ( ON ?auto_131305 ?auto_131304 ) ( ON ?auto_131306 ?auto_131305 ) ( ON ?auto_131307 ?auto_131306 ) ( not ( = ?auto_131304 ?auto_131305 ) ) ( not ( = ?auto_131304 ?auto_131306 ) ) ( not ( = ?auto_131304 ?auto_131307 ) ) ( not ( = ?auto_131304 ?auto_131310 ) ) ( not ( = ?auto_131305 ?auto_131306 ) ) ( not ( = ?auto_131305 ?auto_131307 ) ) ( not ( = ?auto_131305 ?auto_131310 ) ) ( not ( = ?auto_131306 ?auto_131307 ) ) ( not ( = ?auto_131306 ?auto_131310 ) ) ( not ( = ?auto_131307 ?auto_131310 ) ) ( not ( = ?auto_131304 ?auto_131309 ) ) ( not ( = ?auto_131304 ?auto_131308 ) ) ( not ( = ?auto_131305 ?auto_131309 ) ) ( not ( = ?auto_131305 ?auto_131308 ) ) ( not ( = ?auto_131306 ?auto_131309 ) ) ( not ( = ?auto_131306 ?auto_131308 ) ) ( not ( = ?auto_131307 ?auto_131309 ) ) ( not ( = ?auto_131307 ?auto_131308 ) ) ( not ( = ?auto_131310 ?auto_131309 ) ) ( not ( = ?auto_131310 ?auto_131308 ) ) ( not ( = ?auto_131309 ?auto_131308 ) ) ( ON ?auto_131309 ?auto_131310 ) ( CLEAR ?auto_131309 ) ( ON ?auto_131308 ?auto_131311 ) ( CLEAR ?auto_131308 ) ( HAND-EMPTY ) ( not ( = ?auto_131304 ?auto_131311 ) ) ( not ( = ?auto_131305 ?auto_131311 ) ) ( not ( = ?auto_131306 ?auto_131311 ) ) ( not ( = ?auto_131307 ?auto_131311 ) ) ( not ( = ?auto_131310 ?auto_131311 ) ) ( not ( = ?auto_131309 ?auto_131311 ) ) ( not ( = ?auto_131308 ?auto_131311 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_131308 ?auto_131311 )
      ( MAKE-4PILE ?auto_131304 ?auto_131305 ?auto_131306 ?auto_131307 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_131312 - BLOCK
      ?auto_131313 - BLOCK
      ?auto_131314 - BLOCK
      ?auto_131315 - BLOCK
    )
    :vars
    (
      ?auto_131317 - BLOCK
      ?auto_131319 - BLOCK
      ?auto_131318 - BLOCK
      ?auto_131316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131317 ?auto_131315 ) ( ON-TABLE ?auto_131312 ) ( ON ?auto_131313 ?auto_131312 ) ( ON ?auto_131314 ?auto_131313 ) ( ON ?auto_131315 ?auto_131314 ) ( not ( = ?auto_131312 ?auto_131313 ) ) ( not ( = ?auto_131312 ?auto_131314 ) ) ( not ( = ?auto_131312 ?auto_131315 ) ) ( not ( = ?auto_131312 ?auto_131317 ) ) ( not ( = ?auto_131313 ?auto_131314 ) ) ( not ( = ?auto_131313 ?auto_131315 ) ) ( not ( = ?auto_131313 ?auto_131317 ) ) ( not ( = ?auto_131314 ?auto_131315 ) ) ( not ( = ?auto_131314 ?auto_131317 ) ) ( not ( = ?auto_131315 ?auto_131317 ) ) ( not ( = ?auto_131312 ?auto_131319 ) ) ( not ( = ?auto_131312 ?auto_131318 ) ) ( not ( = ?auto_131313 ?auto_131319 ) ) ( not ( = ?auto_131313 ?auto_131318 ) ) ( not ( = ?auto_131314 ?auto_131319 ) ) ( not ( = ?auto_131314 ?auto_131318 ) ) ( not ( = ?auto_131315 ?auto_131319 ) ) ( not ( = ?auto_131315 ?auto_131318 ) ) ( not ( = ?auto_131317 ?auto_131319 ) ) ( not ( = ?auto_131317 ?auto_131318 ) ) ( not ( = ?auto_131319 ?auto_131318 ) ) ( ON ?auto_131318 ?auto_131316 ) ( CLEAR ?auto_131318 ) ( not ( = ?auto_131312 ?auto_131316 ) ) ( not ( = ?auto_131313 ?auto_131316 ) ) ( not ( = ?auto_131314 ?auto_131316 ) ) ( not ( = ?auto_131315 ?auto_131316 ) ) ( not ( = ?auto_131317 ?auto_131316 ) ) ( not ( = ?auto_131319 ?auto_131316 ) ) ( not ( = ?auto_131318 ?auto_131316 ) ) ( HOLDING ?auto_131319 ) ( CLEAR ?auto_131317 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_131312 ?auto_131313 ?auto_131314 ?auto_131315 ?auto_131317 ?auto_131319 )
      ( MAKE-4PILE ?auto_131312 ?auto_131313 ?auto_131314 ?auto_131315 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_131320 - BLOCK
      ?auto_131321 - BLOCK
      ?auto_131322 - BLOCK
      ?auto_131323 - BLOCK
    )
    :vars
    (
      ?auto_131326 - BLOCK
      ?auto_131327 - BLOCK
      ?auto_131324 - BLOCK
      ?auto_131325 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131326 ?auto_131323 ) ( ON-TABLE ?auto_131320 ) ( ON ?auto_131321 ?auto_131320 ) ( ON ?auto_131322 ?auto_131321 ) ( ON ?auto_131323 ?auto_131322 ) ( not ( = ?auto_131320 ?auto_131321 ) ) ( not ( = ?auto_131320 ?auto_131322 ) ) ( not ( = ?auto_131320 ?auto_131323 ) ) ( not ( = ?auto_131320 ?auto_131326 ) ) ( not ( = ?auto_131321 ?auto_131322 ) ) ( not ( = ?auto_131321 ?auto_131323 ) ) ( not ( = ?auto_131321 ?auto_131326 ) ) ( not ( = ?auto_131322 ?auto_131323 ) ) ( not ( = ?auto_131322 ?auto_131326 ) ) ( not ( = ?auto_131323 ?auto_131326 ) ) ( not ( = ?auto_131320 ?auto_131327 ) ) ( not ( = ?auto_131320 ?auto_131324 ) ) ( not ( = ?auto_131321 ?auto_131327 ) ) ( not ( = ?auto_131321 ?auto_131324 ) ) ( not ( = ?auto_131322 ?auto_131327 ) ) ( not ( = ?auto_131322 ?auto_131324 ) ) ( not ( = ?auto_131323 ?auto_131327 ) ) ( not ( = ?auto_131323 ?auto_131324 ) ) ( not ( = ?auto_131326 ?auto_131327 ) ) ( not ( = ?auto_131326 ?auto_131324 ) ) ( not ( = ?auto_131327 ?auto_131324 ) ) ( ON ?auto_131324 ?auto_131325 ) ( not ( = ?auto_131320 ?auto_131325 ) ) ( not ( = ?auto_131321 ?auto_131325 ) ) ( not ( = ?auto_131322 ?auto_131325 ) ) ( not ( = ?auto_131323 ?auto_131325 ) ) ( not ( = ?auto_131326 ?auto_131325 ) ) ( not ( = ?auto_131327 ?auto_131325 ) ) ( not ( = ?auto_131324 ?auto_131325 ) ) ( CLEAR ?auto_131326 ) ( ON ?auto_131327 ?auto_131324 ) ( CLEAR ?auto_131327 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_131325 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_131325 ?auto_131324 )
      ( MAKE-4PILE ?auto_131320 ?auto_131321 ?auto_131322 ?auto_131323 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_131344 - BLOCK
      ?auto_131345 - BLOCK
      ?auto_131346 - BLOCK
      ?auto_131347 - BLOCK
    )
    :vars
    (
      ?auto_131350 - BLOCK
      ?auto_131349 - BLOCK
      ?auto_131348 - BLOCK
      ?auto_131351 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131344 ) ( ON ?auto_131345 ?auto_131344 ) ( ON ?auto_131346 ?auto_131345 ) ( not ( = ?auto_131344 ?auto_131345 ) ) ( not ( = ?auto_131344 ?auto_131346 ) ) ( not ( = ?auto_131344 ?auto_131347 ) ) ( not ( = ?auto_131344 ?auto_131350 ) ) ( not ( = ?auto_131345 ?auto_131346 ) ) ( not ( = ?auto_131345 ?auto_131347 ) ) ( not ( = ?auto_131345 ?auto_131350 ) ) ( not ( = ?auto_131346 ?auto_131347 ) ) ( not ( = ?auto_131346 ?auto_131350 ) ) ( not ( = ?auto_131347 ?auto_131350 ) ) ( not ( = ?auto_131344 ?auto_131349 ) ) ( not ( = ?auto_131344 ?auto_131348 ) ) ( not ( = ?auto_131345 ?auto_131349 ) ) ( not ( = ?auto_131345 ?auto_131348 ) ) ( not ( = ?auto_131346 ?auto_131349 ) ) ( not ( = ?auto_131346 ?auto_131348 ) ) ( not ( = ?auto_131347 ?auto_131349 ) ) ( not ( = ?auto_131347 ?auto_131348 ) ) ( not ( = ?auto_131350 ?auto_131349 ) ) ( not ( = ?auto_131350 ?auto_131348 ) ) ( not ( = ?auto_131349 ?auto_131348 ) ) ( ON ?auto_131348 ?auto_131351 ) ( not ( = ?auto_131344 ?auto_131351 ) ) ( not ( = ?auto_131345 ?auto_131351 ) ) ( not ( = ?auto_131346 ?auto_131351 ) ) ( not ( = ?auto_131347 ?auto_131351 ) ) ( not ( = ?auto_131350 ?auto_131351 ) ) ( not ( = ?auto_131349 ?auto_131351 ) ) ( not ( = ?auto_131348 ?auto_131351 ) ) ( ON ?auto_131349 ?auto_131348 ) ( ON-TABLE ?auto_131351 ) ( ON ?auto_131350 ?auto_131349 ) ( CLEAR ?auto_131350 ) ( HOLDING ?auto_131347 ) ( CLEAR ?auto_131346 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_131344 ?auto_131345 ?auto_131346 ?auto_131347 ?auto_131350 )
      ( MAKE-4PILE ?auto_131344 ?auto_131345 ?auto_131346 ?auto_131347 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_131352 - BLOCK
      ?auto_131353 - BLOCK
      ?auto_131354 - BLOCK
      ?auto_131355 - BLOCK
    )
    :vars
    (
      ?auto_131357 - BLOCK
      ?auto_131358 - BLOCK
      ?auto_131356 - BLOCK
      ?auto_131359 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131352 ) ( ON ?auto_131353 ?auto_131352 ) ( ON ?auto_131354 ?auto_131353 ) ( not ( = ?auto_131352 ?auto_131353 ) ) ( not ( = ?auto_131352 ?auto_131354 ) ) ( not ( = ?auto_131352 ?auto_131355 ) ) ( not ( = ?auto_131352 ?auto_131357 ) ) ( not ( = ?auto_131353 ?auto_131354 ) ) ( not ( = ?auto_131353 ?auto_131355 ) ) ( not ( = ?auto_131353 ?auto_131357 ) ) ( not ( = ?auto_131354 ?auto_131355 ) ) ( not ( = ?auto_131354 ?auto_131357 ) ) ( not ( = ?auto_131355 ?auto_131357 ) ) ( not ( = ?auto_131352 ?auto_131358 ) ) ( not ( = ?auto_131352 ?auto_131356 ) ) ( not ( = ?auto_131353 ?auto_131358 ) ) ( not ( = ?auto_131353 ?auto_131356 ) ) ( not ( = ?auto_131354 ?auto_131358 ) ) ( not ( = ?auto_131354 ?auto_131356 ) ) ( not ( = ?auto_131355 ?auto_131358 ) ) ( not ( = ?auto_131355 ?auto_131356 ) ) ( not ( = ?auto_131357 ?auto_131358 ) ) ( not ( = ?auto_131357 ?auto_131356 ) ) ( not ( = ?auto_131358 ?auto_131356 ) ) ( ON ?auto_131356 ?auto_131359 ) ( not ( = ?auto_131352 ?auto_131359 ) ) ( not ( = ?auto_131353 ?auto_131359 ) ) ( not ( = ?auto_131354 ?auto_131359 ) ) ( not ( = ?auto_131355 ?auto_131359 ) ) ( not ( = ?auto_131357 ?auto_131359 ) ) ( not ( = ?auto_131358 ?auto_131359 ) ) ( not ( = ?auto_131356 ?auto_131359 ) ) ( ON ?auto_131358 ?auto_131356 ) ( ON-TABLE ?auto_131359 ) ( ON ?auto_131357 ?auto_131358 ) ( CLEAR ?auto_131354 ) ( ON ?auto_131355 ?auto_131357 ) ( CLEAR ?auto_131355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_131359 ?auto_131356 ?auto_131358 ?auto_131357 )
      ( MAKE-4PILE ?auto_131352 ?auto_131353 ?auto_131354 ?auto_131355 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_131360 - BLOCK
      ?auto_131361 - BLOCK
      ?auto_131362 - BLOCK
      ?auto_131363 - BLOCK
    )
    :vars
    (
      ?auto_131364 - BLOCK
      ?auto_131367 - BLOCK
      ?auto_131365 - BLOCK
      ?auto_131366 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131360 ) ( ON ?auto_131361 ?auto_131360 ) ( not ( = ?auto_131360 ?auto_131361 ) ) ( not ( = ?auto_131360 ?auto_131362 ) ) ( not ( = ?auto_131360 ?auto_131363 ) ) ( not ( = ?auto_131360 ?auto_131364 ) ) ( not ( = ?auto_131361 ?auto_131362 ) ) ( not ( = ?auto_131361 ?auto_131363 ) ) ( not ( = ?auto_131361 ?auto_131364 ) ) ( not ( = ?auto_131362 ?auto_131363 ) ) ( not ( = ?auto_131362 ?auto_131364 ) ) ( not ( = ?auto_131363 ?auto_131364 ) ) ( not ( = ?auto_131360 ?auto_131367 ) ) ( not ( = ?auto_131360 ?auto_131365 ) ) ( not ( = ?auto_131361 ?auto_131367 ) ) ( not ( = ?auto_131361 ?auto_131365 ) ) ( not ( = ?auto_131362 ?auto_131367 ) ) ( not ( = ?auto_131362 ?auto_131365 ) ) ( not ( = ?auto_131363 ?auto_131367 ) ) ( not ( = ?auto_131363 ?auto_131365 ) ) ( not ( = ?auto_131364 ?auto_131367 ) ) ( not ( = ?auto_131364 ?auto_131365 ) ) ( not ( = ?auto_131367 ?auto_131365 ) ) ( ON ?auto_131365 ?auto_131366 ) ( not ( = ?auto_131360 ?auto_131366 ) ) ( not ( = ?auto_131361 ?auto_131366 ) ) ( not ( = ?auto_131362 ?auto_131366 ) ) ( not ( = ?auto_131363 ?auto_131366 ) ) ( not ( = ?auto_131364 ?auto_131366 ) ) ( not ( = ?auto_131367 ?auto_131366 ) ) ( not ( = ?auto_131365 ?auto_131366 ) ) ( ON ?auto_131367 ?auto_131365 ) ( ON-TABLE ?auto_131366 ) ( ON ?auto_131364 ?auto_131367 ) ( ON ?auto_131363 ?auto_131364 ) ( CLEAR ?auto_131363 ) ( HOLDING ?auto_131362 ) ( CLEAR ?auto_131361 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_131360 ?auto_131361 ?auto_131362 )
      ( MAKE-4PILE ?auto_131360 ?auto_131361 ?auto_131362 ?auto_131363 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_131368 - BLOCK
      ?auto_131369 - BLOCK
      ?auto_131370 - BLOCK
      ?auto_131371 - BLOCK
    )
    :vars
    (
      ?auto_131375 - BLOCK
      ?auto_131374 - BLOCK
      ?auto_131372 - BLOCK
      ?auto_131373 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131368 ) ( ON ?auto_131369 ?auto_131368 ) ( not ( = ?auto_131368 ?auto_131369 ) ) ( not ( = ?auto_131368 ?auto_131370 ) ) ( not ( = ?auto_131368 ?auto_131371 ) ) ( not ( = ?auto_131368 ?auto_131375 ) ) ( not ( = ?auto_131369 ?auto_131370 ) ) ( not ( = ?auto_131369 ?auto_131371 ) ) ( not ( = ?auto_131369 ?auto_131375 ) ) ( not ( = ?auto_131370 ?auto_131371 ) ) ( not ( = ?auto_131370 ?auto_131375 ) ) ( not ( = ?auto_131371 ?auto_131375 ) ) ( not ( = ?auto_131368 ?auto_131374 ) ) ( not ( = ?auto_131368 ?auto_131372 ) ) ( not ( = ?auto_131369 ?auto_131374 ) ) ( not ( = ?auto_131369 ?auto_131372 ) ) ( not ( = ?auto_131370 ?auto_131374 ) ) ( not ( = ?auto_131370 ?auto_131372 ) ) ( not ( = ?auto_131371 ?auto_131374 ) ) ( not ( = ?auto_131371 ?auto_131372 ) ) ( not ( = ?auto_131375 ?auto_131374 ) ) ( not ( = ?auto_131375 ?auto_131372 ) ) ( not ( = ?auto_131374 ?auto_131372 ) ) ( ON ?auto_131372 ?auto_131373 ) ( not ( = ?auto_131368 ?auto_131373 ) ) ( not ( = ?auto_131369 ?auto_131373 ) ) ( not ( = ?auto_131370 ?auto_131373 ) ) ( not ( = ?auto_131371 ?auto_131373 ) ) ( not ( = ?auto_131375 ?auto_131373 ) ) ( not ( = ?auto_131374 ?auto_131373 ) ) ( not ( = ?auto_131372 ?auto_131373 ) ) ( ON ?auto_131374 ?auto_131372 ) ( ON-TABLE ?auto_131373 ) ( ON ?auto_131375 ?auto_131374 ) ( ON ?auto_131371 ?auto_131375 ) ( CLEAR ?auto_131369 ) ( ON ?auto_131370 ?auto_131371 ) ( CLEAR ?auto_131370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_131373 ?auto_131372 ?auto_131374 ?auto_131375 ?auto_131371 )
      ( MAKE-4PILE ?auto_131368 ?auto_131369 ?auto_131370 ?auto_131371 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_131376 - BLOCK
      ?auto_131377 - BLOCK
      ?auto_131378 - BLOCK
      ?auto_131379 - BLOCK
    )
    :vars
    (
      ?auto_131381 - BLOCK
      ?auto_131383 - BLOCK
      ?auto_131382 - BLOCK
      ?auto_131380 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131376 ) ( not ( = ?auto_131376 ?auto_131377 ) ) ( not ( = ?auto_131376 ?auto_131378 ) ) ( not ( = ?auto_131376 ?auto_131379 ) ) ( not ( = ?auto_131376 ?auto_131381 ) ) ( not ( = ?auto_131377 ?auto_131378 ) ) ( not ( = ?auto_131377 ?auto_131379 ) ) ( not ( = ?auto_131377 ?auto_131381 ) ) ( not ( = ?auto_131378 ?auto_131379 ) ) ( not ( = ?auto_131378 ?auto_131381 ) ) ( not ( = ?auto_131379 ?auto_131381 ) ) ( not ( = ?auto_131376 ?auto_131383 ) ) ( not ( = ?auto_131376 ?auto_131382 ) ) ( not ( = ?auto_131377 ?auto_131383 ) ) ( not ( = ?auto_131377 ?auto_131382 ) ) ( not ( = ?auto_131378 ?auto_131383 ) ) ( not ( = ?auto_131378 ?auto_131382 ) ) ( not ( = ?auto_131379 ?auto_131383 ) ) ( not ( = ?auto_131379 ?auto_131382 ) ) ( not ( = ?auto_131381 ?auto_131383 ) ) ( not ( = ?auto_131381 ?auto_131382 ) ) ( not ( = ?auto_131383 ?auto_131382 ) ) ( ON ?auto_131382 ?auto_131380 ) ( not ( = ?auto_131376 ?auto_131380 ) ) ( not ( = ?auto_131377 ?auto_131380 ) ) ( not ( = ?auto_131378 ?auto_131380 ) ) ( not ( = ?auto_131379 ?auto_131380 ) ) ( not ( = ?auto_131381 ?auto_131380 ) ) ( not ( = ?auto_131383 ?auto_131380 ) ) ( not ( = ?auto_131382 ?auto_131380 ) ) ( ON ?auto_131383 ?auto_131382 ) ( ON-TABLE ?auto_131380 ) ( ON ?auto_131381 ?auto_131383 ) ( ON ?auto_131379 ?auto_131381 ) ( ON ?auto_131378 ?auto_131379 ) ( CLEAR ?auto_131378 ) ( HOLDING ?auto_131377 ) ( CLEAR ?auto_131376 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_131376 ?auto_131377 )
      ( MAKE-4PILE ?auto_131376 ?auto_131377 ?auto_131378 ?auto_131379 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_131384 - BLOCK
      ?auto_131385 - BLOCK
      ?auto_131386 - BLOCK
      ?auto_131387 - BLOCK
    )
    :vars
    (
      ?auto_131389 - BLOCK
      ?auto_131390 - BLOCK
      ?auto_131391 - BLOCK
      ?auto_131388 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131384 ) ( not ( = ?auto_131384 ?auto_131385 ) ) ( not ( = ?auto_131384 ?auto_131386 ) ) ( not ( = ?auto_131384 ?auto_131387 ) ) ( not ( = ?auto_131384 ?auto_131389 ) ) ( not ( = ?auto_131385 ?auto_131386 ) ) ( not ( = ?auto_131385 ?auto_131387 ) ) ( not ( = ?auto_131385 ?auto_131389 ) ) ( not ( = ?auto_131386 ?auto_131387 ) ) ( not ( = ?auto_131386 ?auto_131389 ) ) ( not ( = ?auto_131387 ?auto_131389 ) ) ( not ( = ?auto_131384 ?auto_131390 ) ) ( not ( = ?auto_131384 ?auto_131391 ) ) ( not ( = ?auto_131385 ?auto_131390 ) ) ( not ( = ?auto_131385 ?auto_131391 ) ) ( not ( = ?auto_131386 ?auto_131390 ) ) ( not ( = ?auto_131386 ?auto_131391 ) ) ( not ( = ?auto_131387 ?auto_131390 ) ) ( not ( = ?auto_131387 ?auto_131391 ) ) ( not ( = ?auto_131389 ?auto_131390 ) ) ( not ( = ?auto_131389 ?auto_131391 ) ) ( not ( = ?auto_131390 ?auto_131391 ) ) ( ON ?auto_131391 ?auto_131388 ) ( not ( = ?auto_131384 ?auto_131388 ) ) ( not ( = ?auto_131385 ?auto_131388 ) ) ( not ( = ?auto_131386 ?auto_131388 ) ) ( not ( = ?auto_131387 ?auto_131388 ) ) ( not ( = ?auto_131389 ?auto_131388 ) ) ( not ( = ?auto_131390 ?auto_131388 ) ) ( not ( = ?auto_131391 ?auto_131388 ) ) ( ON ?auto_131390 ?auto_131391 ) ( ON-TABLE ?auto_131388 ) ( ON ?auto_131389 ?auto_131390 ) ( ON ?auto_131387 ?auto_131389 ) ( ON ?auto_131386 ?auto_131387 ) ( CLEAR ?auto_131384 ) ( ON ?auto_131385 ?auto_131386 ) ( CLEAR ?auto_131385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_131388 ?auto_131391 ?auto_131390 ?auto_131389 ?auto_131387 ?auto_131386 )
      ( MAKE-4PILE ?auto_131384 ?auto_131385 ?auto_131386 ?auto_131387 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_131392 - BLOCK
      ?auto_131393 - BLOCK
      ?auto_131394 - BLOCK
      ?auto_131395 - BLOCK
    )
    :vars
    (
      ?auto_131399 - BLOCK
      ?auto_131396 - BLOCK
      ?auto_131398 - BLOCK
      ?auto_131397 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131392 ?auto_131393 ) ) ( not ( = ?auto_131392 ?auto_131394 ) ) ( not ( = ?auto_131392 ?auto_131395 ) ) ( not ( = ?auto_131392 ?auto_131399 ) ) ( not ( = ?auto_131393 ?auto_131394 ) ) ( not ( = ?auto_131393 ?auto_131395 ) ) ( not ( = ?auto_131393 ?auto_131399 ) ) ( not ( = ?auto_131394 ?auto_131395 ) ) ( not ( = ?auto_131394 ?auto_131399 ) ) ( not ( = ?auto_131395 ?auto_131399 ) ) ( not ( = ?auto_131392 ?auto_131396 ) ) ( not ( = ?auto_131392 ?auto_131398 ) ) ( not ( = ?auto_131393 ?auto_131396 ) ) ( not ( = ?auto_131393 ?auto_131398 ) ) ( not ( = ?auto_131394 ?auto_131396 ) ) ( not ( = ?auto_131394 ?auto_131398 ) ) ( not ( = ?auto_131395 ?auto_131396 ) ) ( not ( = ?auto_131395 ?auto_131398 ) ) ( not ( = ?auto_131399 ?auto_131396 ) ) ( not ( = ?auto_131399 ?auto_131398 ) ) ( not ( = ?auto_131396 ?auto_131398 ) ) ( ON ?auto_131398 ?auto_131397 ) ( not ( = ?auto_131392 ?auto_131397 ) ) ( not ( = ?auto_131393 ?auto_131397 ) ) ( not ( = ?auto_131394 ?auto_131397 ) ) ( not ( = ?auto_131395 ?auto_131397 ) ) ( not ( = ?auto_131399 ?auto_131397 ) ) ( not ( = ?auto_131396 ?auto_131397 ) ) ( not ( = ?auto_131398 ?auto_131397 ) ) ( ON ?auto_131396 ?auto_131398 ) ( ON-TABLE ?auto_131397 ) ( ON ?auto_131399 ?auto_131396 ) ( ON ?auto_131395 ?auto_131399 ) ( ON ?auto_131394 ?auto_131395 ) ( ON ?auto_131393 ?auto_131394 ) ( CLEAR ?auto_131393 ) ( HOLDING ?auto_131392 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_131392 )
      ( MAKE-4PILE ?auto_131392 ?auto_131393 ?auto_131394 ?auto_131395 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_131400 - BLOCK
      ?auto_131401 - BLOCK
      ?auto_131402 - BLOCK
      ?auto_131403 - BLOCK
    )
    :vars
    (
      ?auto_131407 - BLOCK
      ?auto_131404 - BLOCK
      ?auto_131405 - BLOCK
      ?auto_131406 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131400 ?auto_131401 ) ) ( not ( = ?auto_131400 ?auto_131402 ) ) ( not ( = ?auto_131400 ?auto_131403 ) ) ( not ( = ?auto_131400 ?auto_131407 ) ) ( not ( = ?auto_131401 ?auto_131402 ) ) ( not ( = ?auto_131401 ?auto_131403 ) ) ( not ( = ?auto_131401 ?auto_131407 ) ) ( not ( = ?auto_131402 ?auto_131403 ) ) ( not ( = ?auto_131402 ?auto_131407 ) ) ( not ( = ?auto_131403 ?auto_131407 ) ) ( not ( = ?auto_131400 ?auto_131404 ) ) ( not ( = ?auto_131400 ?auto_131405 ) ) ( not ( = ?auto_131401 ?auto_131404 ) ) ( not ( = ?auto_131401 ?auto_131405 ) ) ( not ( = ?auto_131402 ?auto_131404 ) ) ( not ( = ?auto_131402 ?auto_131405 ) ) ( not ( = ?auto_131403 ?auto_131404 ) ) ( not ( = ?auto_131403 ?auto_131405 ) ) ( not ( = ?auto_131407 ?auto_131404 ) ) ( not ( = ?auto_131407 ?auto_131405 ) ) ( not ( = ?auto_131404 ?auto_131405 ) ) ( ON ?auto_131405 ?auto_131406 ) ( not ( = ?auto_131400 ?auto_131406 ) ) ( not ( = ?auto_131401 ?auto_131406 ) ) ( not ( = ?auto_131402 ?auto_131406 ) ) ( not ( = ?auto_131403 ?auto_131406 ) ) ( not ( = ?auto_131407 ?auto_131406 ) ) ( not ( = ?auto_131404 ?auto_131406 ) ) ( not ( = ?auto_131405 ?auto_131406 ) ) ( ON ?auto_131404 ?auto_131405 ) ( ON-TABLE ?auto_131406 ) ( ON ?auto_131407 ?auto_131404 ) ( ON ?auto_131403 ?auto_131407 ) ( ON ?auto_131402 ?auto_131403 ) ( ON ?auto_131401 ?auto_131402 ) ( ON ?auto_131400 ?auto_131401 ) ( CLEAR ?auto_131400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_131406 ?auto_131405 ?auto_131404 ?auto_131407 ?auto_131403 ?auto_131402 ?auto_131401 )
      ( MAKE-4PILE ?auto_131400 ?auto_131401 ?auto_131402 ?auto_131403 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_131411 - BLOCK
      ?auto_131412 - BLOCK
      ?auto_131413 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_131413 ) ( CLEAR ?auto_131412 ) ( ON-TABLE ?auto_131411 ) ( ON ?auto_131412 ?auto_131411 ) ( not ( = ?auto_131411 ?auto_131412 ) ) ( not ( = ?auto_131411 ?auto_131413 ) ) ( not ( = ?auto_131412 ?auto_131413 ) ) )
    :subtasks
    ( ( !STACK ?auto_131413 ?auto_131412 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_131414 - BLOCK
      ?auto_131415 - BLOCK
      ?auto_131416 - BLOCK
    )
    :vars
    (
      ?auto_131417 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_131415 ) ( ON-TABLE ?auto_131414 ) ( ON ?auto_131415 ?auto_131414 ) ( not ( = ?auto_131414 ?auto_131415 ) ) ( not ( = ?auto_131414 ?auto_131416 ) ) ( not ( = ?auto_131415 ?auto_131416 ) ) ( ON ?auto_131416 ?auto_131417 ) ( CLEAR ?auto_131416 ) ( HAND-EMPTY ) ( not ( = ?auto_131414 ?auto_131417 ) ) ( not ( = ?auto_131415 ?auto_131417 ) ) ( not ( = ?auto_131416 ?auto_131417 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_131416 ?auto_131417 )
      ( MAKE-3PILE ?auto_131414 ?auto_131415 ?auto_131416 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_131418 - BLOCK
      ?auto_131419 - BLOCK
      ?auto_131420 - BLOCK
    )
    :vars
    (
      ?auto_131421 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131418 ) ( not ( = ?auto_131418 ?auto_131419 ) ) ( not ( = ?auto_131418 ?auto_131420 ) ) ( not ( = ?auto_131419 ?auto_131420 ) ) ( ON ?auto_131420 ?auto_131421 ) ( CLEAR ?auto_131420 ) ( not ( = ?auto_131418 ?auto_131421 ) ) ( not ( = ?auto_131419 ?auto_131421 ) ) ( not ( = ?auto_131420 ?auto_131421 ) ) ( HOLDING ?auto_131419 ) ( CLEAR ?auto_131418 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_131418 ?auto_131419 )
      ( MAKE-3PILE ?auto_131418 ?auto_131419 ?auto_131420 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_131422 - BLOCK
      ?auto_131423 - BLOCK
      ?auto_131424 - BLOCK
    )
    :vars
    (
      ?auto_131425 - BLOCK
      ?auto_131427 - BLOCK
      ?auto_131428 - BLOCK
      ?auto_131426 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131422 ) ( not ( = ?auto_131422 ?auto_131423 ) ) ( not ( = ?auto_131422 ?auto_131424 ) ) ( not ( = ?auto_131423 ?auto_131424 ) ) ( ON ?auto_131424 ?auto_131425 ) ( not ( = ?auto_131422 ?auto_131425 ) ) ( not ( = ?auto_131423 ?auto_131425 ) ) ( not ( = ?auto_131424 ?auto_131425 ) ) ( CLEAR ?auto_131422 ) ( ON ?auto_131423 ?auto_131424 ) ( CLEAR ?auto_131423 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_131427 ) ( ON ?auto_131428 ?auto_131427 ) ( ON ?auto_131426 ?auto_131428 ) ( ON ?auto_131425 ?auto_131426 ) ( not ( = ?auto_131427 ?auto_131428 ) ) ( not ( = ?auto_131427 ?auto_131426 ) ) ( not ( = ?auto_131427 ?auto_131425 ) ) ( not ( = ?auto_131427 ?auto_131424 ) ) ( not ( = ?auto_131427 ?auto_131423 ) ) ( not ( = ?auto_131428 ?auto_131426 ) ) ( not ( = ?auto_131428 ?auto_131425 ) ) ( not ( = ?auto_131428 ?auto_131424 ) ) ( not ( = ?auto_131428 ?auto_131423 ) ) ( not ( = ?auto_131426 ?auto_131425 ) ) ( not ( = ?auto_131426 ?auto_131424 ) ) ( not ( = ?auto_131426 ?auto_131423 ) ) ( not ( = ?auto_131422 ?auto_131427 ) ) ( not ( = ?auto_131422 ?auto_131428 ) ) ( not ( = ?auto_131422 ?auto_131426 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_131427 ?auto_131428 ?auto_131426 ?auto_131425 ?auto_131424 )
      ( MAKE-3PILE ?auto_131422 ?auto_131423 ?auto_131424 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_131429 - BLOCK
      ?auto_131430 - BLOCK
      ?auto_131431 - BLOCK
    )
    :vars
    (
      ?auto_131434 - BLOCK
      ?auto_131435 - BLOCK
      ?auto_131433 - BLOCK
      ?auto_131432 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131429 ?auto_131430 ) ) ( not ( = ?auto_131429 ?auto_131431 ) ) ( not ( = ?auto_131430 ?auto_131431 ) ) ( ON ?auto_131431 ?auto_131434 ) ( not ( = ?auto_131429 ?auto_131434 ) ) ( not ( = ?auto_131430 ?auto_131434 ) ) ( not ( = ?auto_131431 ?auto_131434 ) ) ( ON ?auto_131430 ?auto_131431 ) ( CLEAR ?auto_131430 ) ( ON-TABLE ?auto_131435 ) ( ON ?auto_131433 ?auto_131435 ) ( ON ?auto_131432 ?auto_131433 ) ( ON ?auto_131434 ?auto_131432 ) ( not ( = ?auto_131435 ?auto_131433 ) ) ( not ( = ?auto_131435 ?auto_131432 ) ) ( not ( = ?auto_131435 ?auto_131434 ) ) ( not ( = ?auto_131435 ?auto_131431 ) ) ( not ( = ?auto_131435 ?auto_131430 ) ) ( not ( = ?auto_131433 ?auto_131432 ) ) ( not ( = ?auto_131433 ?auto_131434 ) ) ( not ( = ?auto_131433 ?auto_131431 ) ) ( not ( = ?auto_131433 ?auto_131430 ) ) ( not ( = ?auto_131432 ?auto_131434 ) ) ( not ( = ?auto_131432 ?auto_131431 ) ) ( not ( = ?auto_131432 ?auto_131430 ) ) ( not ( = ?auto_131429 ?auto_131435 ) ) ( not ( = ?auto_131429 ?auto_131433 ) ) ( not ( = ?auto_131429 ?auto_131432 ) ) ( HOLDING ?auto_131429 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_131429 )
      ( MAKE-3PILE ?auto_131429 ?auto_131430 ?auto_131431 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_131436 - BLOCK
      ?auto_131437 - BLOCK
      ?auto_131438 - BLOCK
    )
    :vars
    (
      ?auto_131441 - BLOCK
      ?auto_131442 - BLOCK
      ?auto_131440 - BLOCK
      ?auto_131439 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131436 ?auto_131437 ) ) ( not ( = ?auto_131436 ?auto_131438 ) ) ( not ( = ?auto_131437 ?auto_131438 ) ) ( ON ?auto_131438 ?auto_131441 ) ( not ( = ?auto_131436 ?auto_131441 ) ) ( not ( = ?auto_131437 ?auto_131441 ) ) ( not ( = ?auto_131438 ?auto_131441 ) ) ( ON ?auto_131437 ?auto_131438 ) ( ON-TABLE ?auto_131442 ) ( ON ?auto_131440 ?auto_131442 ) ( ON ?auto_131439 ?auto_131440 ) ( ON ?auto_131441 ?auto_131439 ) ( not ( = ?auto_131442 ?auto_131440 ) ) ( not ( = ?auto_131442 ?auto_131439 ) ) ( not ( = ?auto_131442 ?auto_131441 ) ) ( not ( = ?auto_131442 ?auto_131438 ) ) ( not ( = ?auto_131442 ?auto_131437 ) ) ( not ( = ?auto_131440 ?auto_131439 ) ) ( not ( = ?auto_131440 ?auto_131441 ) ) ( not ( = ?auto_131440 ?auto_131438 ) ) ( not ( = ?auto_131440 ?auto_131437 ) ) ( not ( = ?auto_131439 ?auto_131441 ) ) ( not ( = ?auto_131439 ?auto_131438 ) ) ( not ( = ?auto_131439 ?auto_131437 ) ) ( not ( = ?auto_131436 ?auto_131442 ) ) ( not ( = ?auto_131436 ?auto_131440 ) ) ( not ( = ?auto_131436 ?auto_131439 ) ) ( ON ?auto_131436 ?auto_131437 ) ( CLEAR ?auto_131436 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_131442 ?auto_131440 ?auto_131439 ?auto_131441 ?auto_131438 ?auto_131437 )
      ( MAKE-3PILE ?auto_131436 ?auto_131437 ?auto_131438 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_131443 - BLOCK
      ?auto_131444 - BLOCK
      ?auto_131445 - BLOCK
    )
    :vars
    (
      ?auto_131449 - BLOCK
      ?auto_131447 - BLOCK
      ?auto_131446 - BLOCK
      ?auto_131448 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131443 ?auto_131444 ) ) ( not ( = ?auto_131443 ?auto_131445 ) ) ( not ( = ?auto_131444 ?auto_131445 ) ) ( ON ?auto_131445 ?auto_131449 ) ( not ( = ?auto_131443 ?auto_131449 ) ) ( not ( = ?auto_131444 ?auto_131449 ) ) ( not ( = ?auto_131445 ?auto_131449 ) ) ( ON ?auto_131444 ?auto_131445 ) ( ON-TABLE ?auto_131447 ) ( ON ?auto_131446 ?auto_131447 ) ( ON ?auto_131448 ?auto_131446 ) ( ON ?auto_131449 ?auto_131448 ) ( not ( = ?auto_131447 ?auto_131446 ) ) ( not ( = ?auto_131447 ?auto_131448 ) ) ( not ( = ?auto_131447 ?auto_131449 ) ) ( not ( = ?auto_131447 ?auto_131445 ) ) ( not ( = ?auto_131447 ?auto_131444 ) ) ( not ( = ?auto_131446 ?auto_131448 ) ) ( not ( = ?auto_131446 ?auto_131449 ) ) ( not ( = ?auto_131446 ?auto_131445 ) ) ( not ( = ?auto_131446 ?auto_131444 ) ) ( not ( = ?auto_131448 ?auto_131449 ) ) ( not ( = ?auto_131448 ?auto_131445 ) ) ( not ( = ?auto_131448 ?auto_131444 ) ) ( not ( = ?auto_131443 ?auto_131447 ) ) ( not ( = ?auto_131443 ?auto_131446 ) ) ( not ( = ?auto_131443 ?auto_131448 ) ) ( HOLDING ?auto_131443 ) ( CLEAR ?auto_131444 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_131447 ?auto_131446 ?auto_131448 ?auto_131449 ?auto_131445 ?auto_131444 ?auto_131443 )
      ( MAKE-3PILE ?auto_131443 ?auto_131444 ?auto_131445 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_131450 - BLOCK
      ?auto_131451 - BLOCK
      ?auto_131452 - BLOCK
    )
    :vars
    (
      ?auto_131456 - BLOCK
      ?auto_131455 - BLOCK
      ?auto_131454 - BLOCK
      ?auto_131453 - BLOCK
      ?auto_131457 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131450 ?auto_131451 ) ) ( not ( = ?auto_131450 ?auto_131452 ) ) ( not ( = ?auto_131451 ?auto_131452 ) ) ( ON ?auto_131452 ?auto_131456 ) ( not ( = ?auto_131450 ?auto_131456 ) ) ( not ( = ?auto_131451 ?auto_131456 ) ) ( not ( = ?auto_131452 ?auto_131456 ) ) ( ON ?auto_131451 ?auto_131452 ) ( ON-TABLE ?auto_131455 ) ( ON ?auto_131454 ?auto_131455 ) ( ON ?auto_131453 ?auto_131454 ) ( ON ?auto_131456 ?auto_131453 ) ( not ( = ?auto_131455 ?auto_131454 ) ) ( not ( = ?auto_131455 ?auto_131453 ) ) ( not ( = ?auto_131455 ?auto_131456 ) ) ( not ( = ?auto_131455 ?auto_131452 ) ) ( not ( = ?auto_131455 ?auto_131451 ) ) ( not ( = ?auto_131454 ?auto_131453 ) ) ( not ( = ?auto_131454 ?auto_131456 ) ) ( not ( = ?auto_131454 ?auto_131452 ) ) ( not ( = ?auto_131454 ?auto_131451 ) ) ( not ( = ?auto_131453 ?auto_131456 ) ) ( not ( = ?auto_131453 ?auto_131452 ) ) ( not ( = ?auto_131453 ?auto_131451 ) ) ( not ( = ?auto_131450 ?auto_131455 ) ) ( not ( = ?auto_131450 ?auto_131454 ) ) ( not ( = ?auto_131450 ?auto_131453 ) ) ( CLEAR ?auto_131451 ) ( ON ?auto_131450 ?auto_131457 ) ( CLEAR ?auto_131450 ) ( HAND-EMPTY ) ( not ( = ?auto_131450 ?auto_131457 ) ) ( not ( = ?auto_131451 ?auto_131457 ) ) ( not ( = ?auto_131452 ?auto_131457 ) ) ( not ( = ?auto_131456 ?auto_131457 ) ) ( not ( = ?auto_131455 ?auto_131457 ) ) ( not ( = ?auto_131454 ?auto_131457 ) ) ( not ( = ?auto_131453 ?auto_131457 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_131450 ?auto_131457 )
      ( MAKE-3PILE ?auto_131450 ?auto_131451 ?auto_131452 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_131458 - BLOCK
      ?auto_131459 - BLOCK
      ?auto_131460 - BLOCK
    )
    :vars
    (
      ?auto_131462 - BLOCK
      ?auto_131463 - BLOCK
      ?auto_131464 - BLOCK
      ?auto_131461 - BLOCK
      ?auto_131465 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131458 ?auto_131459 ) ) ( not ( = ?auto_131458 ?auto_131460 ) ) ( not ( = ?auto_131459 ?auto_131460 ) ) ( ON ?auto_131460 ?auto_131462 ) ( not ( = ?auto_131458 ?auto_131462 ) ) ( not ( = ?auto_131459 ?auto_131462 ) ) ( not ( = ?auto_131460 ?auto_131462 ) ) ( ON-TABLE ?auto_131463 ) ( ON ?auto_131464 ?auto_131463 ) ( ON ?auto_131461 ?auto_131464 ) ( ON ?auto_131462 ?auto_131461 ) ( not ( = ?auto_131463 ?auto_131464 ) ) ( not ( = ?auto_131463 ?auto_131461 ) ) ( not ( = ?auto_131463 ?auto_131462 ) ) ( not ( = ?auto_131463 ?auto_131460 ) ) ( not ( = ?auto_131463 ?auto_131459 ) ) ( not ( = ?auto_131464 ?auto_131461 ) ) ( not ( = ?auto_131464 ?auto_131462 ) ) ( not ( = ?auto_131464 ?auto_131460 ) ) ( not ( = ?auto_131464 ?auto_131459 ) ) ( not ( = ?auto_131461 ?auto_131462 ) ) ( not ( = ?auto_131461 ?auto_131460 ) ) ( not ( = ?auto_131461 ?auto_131459 ) ) ( not ( = ?auto_131458 ?auto_131463 ) ) ( not ( = ?auto_131458 ?auto_131464 ) ) ( not ( = ?auto_131458 ?auto_131461 ) ) ( ON ?auto_131458 ?auto_131465 ) ( CLEAR ?auto_131458 ) ( not ( = ?auto_131458 ?auto_131465 ) ) ( not ( = ?auto_131459 ?auto_131465 ) ) ( not ( = ?auto_131460 ?auto_131465 ) ) ( not ( = ?auto_131462 ?auto_131465 ) ) ( not ( = ?auto_131463 ?auto_131465 ) ) ( not ( = ?auto_131464 ?auto_131465 ) ) ( not ( = ?auto_131461 ?auto_131465 ) ) ( HOLDING ?auto_131459 ) ( CLEAR ?auto_131460 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_131463 ?auto_131464 ?auto_131461 ?auto_131462 ?auto_131460 ?auto_131459 )
      ( MAKE-3PILE ?auto_131458 ?auto_131459 ?auto_131460 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_131466 - BLOCK
      ?auto_131467 - BLOCK
      ?auto_131468 - BLOCK
    )
    :vars
    (
      ?auto_131470 - BLOCK
      ?auto_131472 - BLOCK
      ?auto_131471 - BLOCK
      ?auto_131469 - BLOCK
      ?auto_131473 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131466 ?auto_131467 ) ) ( not ( = ?auto_131466 ?auto_131468 ) ) ( not ( = ?auto_131467 ?auto_131468 ) ) ( ON ?auto_131468 ?auto_131470 ) ( not ( = ?auto_131466 ?auto_131470 ) ) ( not ( = ?auto_131467 ?auto_131470 ) ) ( not ( = ?auto_131468 ?auto_131470 ) ) ( ON-TABLE ?auto_131472 ) ( ON ?auto_131471 ?auto_131472 ) ( ON ?auto_131469 ?auto_131471 ) ( ON ?auto_131470 ?auto_131469 ) ( not ( = ?auto_131472 ?auto_131471 ) ) ( not ( = ?auto_131472 ?auto_131469 ) ) ( not ( = ?auto_131472 ?auto_131470 ) ) ( not ( = ?auto_131472 ?auto_131468 ) ) ( not ( = ?auto_131472 ?auto_131467 ) ) ( not ( = ?auto_131471 ?auto_131469 ) ) ( not ( = ?auto_131471 ?auto_131470 ) ) ( not ( = ?auto_131471 ?auto_131468 ) ) ( not ( = ?auto_131471 ?auto_131467 ) ) ( not ( = ?auto_131469 ?auto_131470 ) ) ( not ( = ?auto_131469 ?auto_131468 ) ) ( not ( = ?auto_131469 ?auto_131467 ) ) ( not ( = ?auto_131466 ?auto_131472 ) ) ( not ( = ?auto_131466 ?auto_131471 ) ) ( not ( = ?auto_131466 ?auto_131469 ) ) ( ON ?auto_131466 ?auto_131473 ) ( not ( = ?auto_131466 ?auto_131473 ) ) ( not ( = ?auto_131467 ?auto_131473 ) ) ( not ( = ?auto_131468 ?auto_131473 ) ) ( not ( = ?auto_131470 ?auto_131473 ) ) ( not ( = ?auto_131472 ?auto_131473 ) ) ( not ( = ?auto_131471 ?auto_131473 ) ) ( not ( = ?auto_131469 ?auto_131473 ) ) ( CLEAR ?auto_131468 ) ( ON ?auto_131467 ?auto_131466 ) ( CLEAR ?auto_131467 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_131473 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_131473 ?auto_131466 )
      ( MAKE-3PILE ?auto_131466 ?auto_131467 ?auto_131468 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_131474 - BLOCK
      ?auto_131475 - BLOCK
      ?auto_131476 - BLOCK
    )
    :vars
    (
      ?auto_131478 - BLOCK
      ?auto_131480 - BLOCK
      ?auto_131479 - BLOCK
      ?auto_131481 - BLOCK
      ?auto_131477 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131474 ?auto_131475 ) ) ( not ( = ?auto_131474 ?auto_131476 ) ) ( not ( = ?auto_131475 ?auto_131476 ) ) ( not ( = ?auto_131474 ?auto_131478 ) ) ( not ( = ?auto_131475 ?auto_131478 ) ) ( not ( = ?auto_131476 ?auto_131478 ) ) ( ON-TABLE ?auto_131480 ) ( ON ?auto_131479 ?auto_131480 ) ( ON ?auto_131481 ?auto_131479 ) ( ON ?auto_131478 ?auto_131481 ) ( not ( = ?auto_131480 ?auto_131479 ) ) ( not ( = ?auto_131480 ?auto_131481 ) ) ( not ( = ?auto_131480 ?auto_131478 ) ) ( not ( = ?auto_131480 ?auto_131476 ) ) ( not ( = ?auto_131480 ?auto_131475 ) ) ( not ( = ?auto_131479 ?auto_131481 ) ) ( not ( = ?auto_131479 ?auto_131478 ) ) ( not ( = ?auto_131479 ?auto_131476 ) ) ( not ( = ?auto_131479 ?auto_131475 ) ) ( not ( = ?auto_131481 ?auto_131478 ) ) ( not ( = ?auto_131481 ?auto_131476 ) ) ( not ( = ?auto_131481 ?auto_131475 ) ) ( not ( = ?auto_131474 ?auto_131480 ) ) ( not ( = ?auto_131474 ?auto_131479 ) ) ( not ( = ?auto_131474 ?auto_131481 ) ) ( ON ?auto_131474 ?auto_131477 ) ( not ( = ?auto_131474 ?auto_131477 ) ) ( not ( = ?auto_131475 ?auto_131477 ) ) ( not ( = ?auto_131476 ?auto_131477 ) ) ( not ( = ?auto_131478 ?auto_131477 ) ) ( not ( = ?auto_131480 ?auto_131477 ) ) ( not ( = ?auto_131479 ?auto_131477 ) ) ( not ( = ?auto_131481 ?auto_131477 ) ) ( ON ?auto_131475 ?auto_131474 ) ( CLEAR ?auto_131475 ) ( ON-TABLE ?auto_131477 ) ( HOLDING ?auto_131476 ) ( CLEAR ?auto_131478 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_131480 ?auto_131479 ?auto_131481 ?auto_131478 ?auto_131476 )
      ( MAKE-3PILE ?auto_131474 ?auto_131475 ?auto_131476 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_131482 - BLOCK
      ?auto_131483 - BLOCK
      ?auto_131484 - BLOCK
    )
    :vars
    (
      ?auto_131485 - BLOCK
      ?auto_131487 - BLOCK
      ?auto_131489 - BLOCK
      ?auto_131486 - BLOCK
      ?auto_131488 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131482 ?auto_131483 ) ) ( not ( = ?auto_131482 ?auto_131484 ) ) ( not ( = ?auto_131483 ?auto_131484 ) ) ( not ( = ?auto_131482 ?auto_131485 ) ) ( not ( = ?auto_131483 ?auto_131485 ) ) ( not ( = ?auto_131484 ?auto_131485 ) ) ( ON-TABLE ?auto_131487 ) ( ON ?auto_131489 ?auto_131487 ) ( ON ?auto_131486 ?auto_131489 ) ( ON ?auto_131485 ?auto_131486 ) ( not ( = ?auto_131487 ?auto_131489 ) ) ( not ( = ?auto_131487 ?auto_131486 ) ) ( not ( = ?auto_131487 ?auto_131485 ) ) ( not ( = ?auto_131487 ?auto_131484 ) ) ( not ( = ?auto_131487 ?auto_131483 ) ) ( not ( = ?auto_131489 ?auto_131486 ) ) ( not ( = ?auto_131489 ?auto_131485 ) ) ( not ( = ?auto_131489 ?auto_131484 ) ) ( not ( = ?auto_131489 ?auto_131483 ) ) ( not ( = ?auto_131486 ?auto_131485 ) ) ( not ( = ?auto_131486 ?auto_131484 ) ) ( not ( = ?auto_131486 ?auto_131483 ) ) ( not ( = ?auto_131482 ?auto_131487 ) ) ( not ( = ?auto_131482 ?auto_131489 ) ) ( not ( = ?auto_131482 ?auto_131486 ) ) ( ON ?auto_131482 ?auto_131488 ) ( not ( = ?auto_131482 ?auto_131488 ) ) ( not ( = ?auto_131483 ?auto_131488 ) ) ( not ( = ?auto_131484 ?auto_131488 ) ) ( not ( = ?auto_131485 ?auto_131488 ) ) ( not ( = ?auto_131487 ?auto_131488 ) ) ( not ( = ?auto_131489 ?auto_131488 ) ) ( not ( = ?auto_131486 ?auto_131488 ) ) ( ON ?auto_131483 ?auto_131482 ) ( ON-TABLE ?auto_131488 ) ( CLEAR ?auto_131485 ) ( ON ?auto_131484 ?auto_131483 ) ( CLEAR ?auto_131484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_131488 ?auto_131482 ?auto_131483 )
      ( MAKE-3PILE ?auto_131482 ?auto_131483 ?auto_131484 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_131490 - BLOCK
      ?auto_131491 - BLOCK
      ?auto_131492 - BLOCK
    )
    :vars
    (
      ?auto_131493 - BLOCK
      ?auto_131497 - BLOCK
      ?auto_131495 - BLOCK
      ?auto_131494 - BLOCK
      ?auto_131496 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131490 ?auto_131491 ) ) ( not ( = ?auto_131490 ?auto_131492 ) ) ( not ( = ?auto_131491 ?auto_131492 ) ) ( not ( = ?auto_131490 ?auto_131493 ) ) ( not ( = ?auto_131491 ?auto_131493 ) ) ( not ( = ?auto_131492 ?auto_131493 ) ) ( ON-TABLE ?auto_131497 ) ( ON ?auto_131495 ?auto_131497 ) ( ON ?auto_131494 ?auto_131495 ) ( not ( = ?auto_131497 ?auto_131495 ) ) ( not ( = ?auto_131497 ?auto_131494 ) ) ( not ( = ?auto_131497 ?auto_131493 ) ) ( not ( = ?auto_131497 ?auto_131492 ) ) ( not ( = ?auto_131497 ?auto_131491 ) ) ( not ( = ?auto_131495 ?auto_131494 ) ) ( not ( = ?auto_131495 ?auto_131493 ) ) ( not ( = ?auto_131495 ?auto_131492 ) ) ( not ( = ?auto_131495 ?auto_131491 ) ) ( not ( = ?auto_131494 ?auto_131493 ) ) ( not ( = ?auto_131494 ?auto_131492 ) ) ( not ( = ?auto_131494 ?auto_131491 ) ) ( not ( = ?auto_131490 ?auto_131497 ) ) ( not ( = ?auto_131490 ?auto_131495 ) ) ( not ( = ?auto_131490 ?auto_131494 ) ) ( ON ?auto_131490 ?auto_131496 ) ( not ( = ?auto_131490 ?auto_131496 ) ) ( not ( = ?auto_131491 ?auto_131496 ) ) ( not ( = ?auto_131492 ?auto_131496 ) ) ( not ( = ?auto_131493 ?auto_131496 ) ) ( not ( = ?auto_131497 ?auto_131496 ) ) ( not ( = ?auto_131495 ?auto_131496 ) ) ( not ( = ?auto_131494 ?auto_131496 ) ) ( ON ?auto_131491 ?auto_131490 ) ( ON-TABLE ?auto_131496 ) ( ON ?auto_131492 ?auto_131491 ) ( CLEAR ?auto_131492 ) ( HOLDING ?auto_131493 ) ( CLEAR ?auto_131494 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_131497 ?auto_131495 ?auto_131494 ?auto_131493 )
      ( MAKE-3PILE ?auto_131490 ?auto_131491 ?auto_131492 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_131498 - BLOCK
      ?auto_131499 - BLOCK
      ?auto_131500 - BLOCK
    )
    :vars
    (
      ?auto_131504 - BLOCK
      ?auto_131503 - BLOCK
      ?auto_131501 - BLOCK
      ?auto_131505 - BLOCK
      ?auto_131502 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131498 ?auto_131499 ) ) ( not ( = ?auto_131498 ?auto_131500 ) ) ( not ( = ?auto_131499 ?auto_131500 ) ) ( not ( = ?auto_131498 ?auto_131504 ) ) ( not ( = ?auto_131499 ?auto_131504 ) ) ( not ( = ?auto_131500 ?auto_131504 ) ) ( ON-TABLE ?auto_131503 ) ( ON ?auto_131501 ?auto_131503 ) ( ON ?auto_131505 ?auto_131501 ) ( not ( = ?auto_131503 ?auto_131501 ) ) ( not ( = ?auto_131503 ?auto_131505 ) ) ( not ( = ?auto_131503 ?auto_131504 ) ) ( not ( = ?auto_131503 ?auto_131500 ) ) ( not ( = ?auto_131503 ?auto_131499 ) ) ( not ( = ?auto_131501 ?auto_131505 ) ) ( not ( = ?auto_131501 ?auto_131504 ) ) ( not ( = ?auto_131501 ?auto_131500 ) ) ( not ( = ?auto_131501 ?auto_131499 ) ) ( not ( = ?auto_131505 ?auto_131504 ) ) ( not ( = ?auto_131505 ?auto_131500 ) ) ( not ( = ?auto_131505 ?auto_131499 ) ) ( not ( = ?auto_131498 ?auto_131503 ) ) ( not ( = ?auto_131498 ?auto_131501 ) ) ( not ( = ?auto_131498 ?auto_131505 ) ) ( ON ?auto_131498 ?auto_131502 ) ( not ( = ?auto_131498 ?auto_131502 ) ) ( not ( = ?auto_131499 ?auto_131502 ) ) ( not ( = ?auto_131500 ?auto_131502 ) ) ( not ( = ?auto_131504 ?auto_131502 ) ) ( not ( = ?auto_131503 ?auto_131502 ) ) ( not ( = ?auto_131501 ?auto_131502 ) ) ( not ( = ?auto_131505 ?auto_131502 ) ) ( ON ?auto_131499 ?auto_131498 ) ( ON-TABLE ?auto_131502 ) ( ON ?auto_131500 ?auto_131499 ) ( CLEAR ?auto_131505 ) ( ON ?auto_131504 ?auto_131500 ) ( CLEAR ?auto_131504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_131502 ?auto_131498 ?auto_131499 ?auto_131500 )
      ( MAKE-3PILE ?auto_131498 ?auto_131499 ?auto_131500 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_131506 - BLOCK
      ?auto_131507 - BLOCK
      ?auto_131508 - BLOCK
    )
    :vars
    (
      ?auto_131511 - BLOCK
      ?auto_131513 - BLOCK
      ?auto_131512 - BLOCK
      ?auto_131510 - BLOCK
      ?auto_131509 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131506 ?auto_131507 ) ) ( not ( = ?auto_131506 ?auto_131508 ) ) ( not ( = ?auto_131507 ?auto_131508 ) ) ( not ( = ?auto_131506 ?auto_131511 ) ) ( not ( = ?auto_131507 ?auto_131511 ) ) ( not ( = ?auto_131508 ?auto_131511 ) ) ( ON-TABLE ?auto_131513 ) ( ON ?auto_131512 ?auto_131513 ) ( not ( = ?auto_131513 ?auto_131512 ) ) ( not ( = ?auto_131513 ?auto_131510 ) ) ( not ( = ?auto_131513 ?auto_131511 ) ) ( not ( = ?auto_131513 ?auto_131508 ) ) ( not ( = ?auto_131513 ?auto_131507 ) ) ( not ( = ?auto_131512 ?auto_131510 ) ) ( not ( = ?auto_131512 ?auto_131511 ) ) ( not ( = ?auto_131512 ?auto_131508 ) ) ( not ( = ?auto_131512 ?auto_131507 ) ) ( not ( = ?auto_131510 ?auto_131511 ) ) ( not ( = ?auto_131510 ?auto_131508 ) ) ( not ( = ?auto_131510 ?auto_131507 ) ) ( not ( = ?auto_131506 ?auto_131513 ) ) ( not ( = ?auto_131506 ?auto_131512 ) ) ( not ( = ?auto_131506 ?auto_131510 ) ) ( ON ?auto_131506 ?auto_131509 ) ( not ( = ?auto_131506 ?auto_131509 ) ) ( not ( = ?auto_131507 ?auto_131509 ) ) ( not ( = ?auto_131508 ?auto_131509 ) ) ( not ( = ?auto_131511 ?auto_131509 ) ) ( not ( = ?auto_131513 ?auto_131509 ) ) ( not ( = ?auto_131512 ?auto_131509 ) ) ( not ( = ?auto_131510 ?auto_131509 ) ) ( ON ?auto_131507 ?auto_131506 ) ( ON-TABLE ?auto_131509 ) ( ON ?auto_131508 ?auto_131507 ) ( ON ?auto_131511 ?auto_131508 ) ( CLEAR ?auto_131511 ) ( HOLDING ?auto_131510 ) ( CLEAR ?auto_131512 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_131513 ?auto_131512 ?auto_131510 )
      ( MAKE-3PILE ?auto_131506 ?auto_131507 ?auto_131508 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_131514 - BLOCK
      ?auto_131515 - BLOCK
      ?auto_131516 - BLOCK
    )
    :vars
    (
      ?auto_131521 - BLOCK
      ?auto_131519 - BLOCK
      ?auto_131520 - BLOCK
      ?auto_131518 - BLOCK
      ?auto_131517 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131514 ?auto_131515 ) ) ( not ( = ?auto_131514 ?auto_131516 ) ) ( not ( = ?auto_131515 ?auto_131516 ) ) ( not ( = ?auto_131514 ?auto_131521 ) ) ( not ( = ?auto_131515 ?auto_131521 ) ) ( not ( = ?auto_131516 ?auto_131521 ) ) ( ON-TABLE ?auto_131519 ) ( ON ?auto_131520 ?auto_131519 ) ( not ( = ?auto_131519 ?auto_131520 ) ) ( not ( = ?auto_131519 ?auto_131518 ) ) ( not ( = ?auto_131519 ?auto_131521 ) ) ( not ( = ?auto_131519 ?auto_131516 ) ) ( not ( = ?auto_131519 ?auto_131515 ) ) ( not ( = ?auto_131520 ?auto_131518 ) ) ( not ( = ?auto_131520 ?auto_131521 ) ) ( not ( = ?auto_131520 ?auto_131516 ) ) ( not ( = ?auto_131520 ?auto_131515 ) ) ( not ( = ?auto_131518 ?auto_131521 ) ) ( not ( = ?auto_131518 ?auto_131516 ) ) ( not ( = ?auto_131518 ?auto_131515 ) ) ( not ( = ?auto_131514 ?auto_131519 ) ) ( not ( = ?auto_131514 ?auto_131520 ) ) ( not ( = ?auto_131514 ?auto_131518 ) ) ( ON ?auto_131514 ?auto_131517 ) ( not ( = ?auto_131514 ?auto_131517 ) ) ( not ( = ?auto_131515 ?auto_131517 ) ) ( not ( = ?auto_131516 ?auto_131517 ) ) ( not ( = ?auto_131521 ?auto_131517 ) ) ( not ( = ?auto_131519 ?auto_131517 ) ) ( not ( = ?auto_131520 ?auto_131517 ) ) ( not ( = ?auto_131518 ?auto_131517 ) ) ( ON ?auto_131515 ?auto_131514 ) ( ON-TABLE ?auto_131517 ) ( ON ?auto_131516 ?auto_131515 ) ( ON ?auto_131521 ?auto_131516 ) ( CLEAR ?auto_131520 ) ( ON ?auto_131518 ?auto_131521 ) ( CLEAR ?auto_131518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_131517 ?auto_131514 ?auto_131515 ?auto_131516 ?auto_131521 )
      ( MAKE-3PILE ?auto_131514 ?auto_131515 ?auto_131516 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_131522 - BLOCK
      ?auto_131523 - BLOCK
      ?auto_131524 - BLOCK
    )
    :vars
    (
      ?auto_131526 - BLOCK
      ?auto_131529 - BLOCK
      ?auto_131527 - BLOCK
      ?auto_131525 - BLOCK
      ?auto_131528 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131522 ?auto_131523 ) ) ( not ( = ?auto_131522 ?auto_131524 ) ) ( not ( = ?auto_131523 ?auto_131524 ) ) ( not ( = ?auto_131522 ?auto_131526 ) ) ( not ( = ?auto_131523 ?auto_131526 ) ) ( not ( = ?auto_131524 ?auto_131526 ) ) ( ON-TABLE ?auto_131529 ) ( not ( = ?auto_131529 ?auto_131527 ) ) ( not ( = ?auto_131529 ?auto_131525 ) ) ( not ( = ?auto_131529 ?auto_131526 ) ) ( not ( = ?auto_131529 ?auto_131524 ) ) ( not ( = ?auto_131529 ?auto_131523 ) ) ( not ( = ?auto_131527 ?auto_131525 ) ) ( not ( = ?auto_131527 ?auto_131526 ) ) ( not ( = ?auto_131527 ?auto_131524 ) ) ( not ( = ?auto_131527 ?auto_131523 ) ) ( not ( = ?auto_131525 ?auto_131526 ) ) ( not ( = ?auto_131525 ?auto_131524 ) ) ( not ( = ?auto_131525 ?auto_131523 ) ) ( not ( = ?auto_131522 ?auto_131529 ) ) ( not ( = ?auto_131522 ?auto_131527 ) ) ( not ( = ?auto_131522 ?auto_131525 ) ) ( ON ?auto_131522 ?auto_131528 ) ( not ( = ?auto_131522 ?auto_131528 ) ) ( not ( = ?auto_131523 ?auto_131528 ) ) ( not ( = ?auto_131524 ?auto_131528 ) ) ( not ( = ?auto_131526 ?auto_131528 ) ) ( not ( = ?auto_131529 ?auto_131528 ) ) ( not ( = ?auto_131527 ?auto_131528 ) ) ( not ( = ?auto_131525 ?auto_131528 ) ) ( ON ?auto_131523 ?auto_131522 ) ( ON-TABLE ?auto_131528 ) ( ON ?auto_131524 ?auto_131523 ) ( ON ?auto_131526 ?auto_131524 ) ( ON ?auto_131525 ?auto_131526 ) ( CLEAR ?auto_131525 ) ( HOLDING ?auto_131527 ) ( CLEAR ?auto_131529 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_131529 ?auto_131527 )
      ( MAKE-3PILE ?auto_131522 ?auto_131523 ?auto_131524 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_131530 - BLOCK
      ?auto_131531 - BLOCK
      ?auto_131532 - BLOCK
    )
    :vars
    (
      ?auto_131537 - BLOCK
      ?auto_131536 - BLOCK
      ?auto_131535 - BLOCK
      ?auto_131533 - BLOCK
      ?auto_131534 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131530 ?auto_131531 ) ) ( not ( = ?auto_131530 ?auto_131532 ) ) ( not ( = ?auto_131531 ?auto_131532 ) ) ( not ( = ?auto_131530 ?auto_131537 ) ) ( not ( = ?auto_131531 ?auto_131537 ) ) ( not ( = ?auto_131532 ?auto_131537 ) ) ( ON-TABLE ?auto_131536 ) ( not ( = ?auto_131536 ?auto_131535 ) ) ( not ( = ?auto_131536 ?auto_131533 ) ) ( not ( = ?auto_131536 ?auto_131537 ) ) ( not ( = ?auto_131536 ?auto_131532 ) ) ( not ( = ?auto_131536 ?auto_131531 ) ) ( not ( = ?auto_131535 ?auto_131533 ) ) ( not ( = ?auto_131535 ?auto_131537 ) ) ( not ( = ?auto_131535 ?auto_131532 ) ) ( not ( = ?auto_131535 ?auto_131531 ) ) ( not ( = ?auto_131533 ?auto_131537 ) ) ( not ( = ?auto_131533 ?auto_131532 ) ) ( not ( = ?auto_131533 ?auto_131531 ) ) ( not ( = ?auto_131530 ?auto_131536 ) ) ( not ( = ?auto_131530 ?auto_131535 ) ) ( not ( = ?auto_131530 ?auto_131533 ) ) ( ON ?auto_131530 ?auto_131534 ) ( not ( = ?auto_131530 ?auto_131534 ) ) ( not ( = ?auto_131531 ?auto_131534 ) ) ( not ( = ?auto_131532 ?auto_131534 ) ) ( not ( = ?auto_131537 ?auto_131534 ) ) ( not ( = ?auto_131536 ?auto_131534 ) ) ( not ( = ?auto_131535 ?auto_131534 ) ) ( not ( = ?auto_131533 ?auto_131534 ) ) ( ON ?auto_131531 ?auto_131530 ) ( ON-TABLE ?auto_131534 ) ( ON ?auto_131532 ?auto_131531 ) ( ON ?auto_131537 ?auto_131532 ) ( ON ?auto_131533 ?auto_131537 ) ( CLEAR ?auto_131536 ) ( ON ?auto_131535 ?auto_131533 ) ( CLEAR ?auto_131535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_131534 ?auto_131530 ?auto_131531 ?auto_131532 ?auto_131537 ?auto_131533 )
      ( MAKE-3PILE ?auto_131530 ?auto_131531 ?auto_131532 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_131538 - BLOCK
      ?auto_131539 - BLOCK
      ?auto_131540 - BLOCK
    )
    :vars
    (
      ?auto_131541 - BLOCK
      ?auto_131545 - BLOCK
      ?auto_131544 - BLOCK
      ?auto_131542 - BLOCK
      ?auto_131543 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131538 ?auto_131539 ) ) ( not ( = ?auto_131538 ?auto_131540 ) ) ( not ( = ?auto_131539 ?auto_131540 ) ) ( not ( = ?auto_131538 ?auto_131541 ) ) ( not ( = ?auto_131539 ?auto_131541 ) ) ( not ( = ?auto_131540 ?auto_131541 ) ) ( not ( = ?auto_131545 ?auto_131544 ) ) ( not ( = ?auto_131545 ?auto_131542 ) ) ( not ( = ?auto_131545 ?auto_131541 ) ) ( not ( = ?auto_131545 ?auto_131540 ) ) ( not ( = ?auto_131545 ?auto_131539 ) ) ( not ( = ?auto_131544 ?auto_131542 ) ) ( not ( = ?auto_131544 ?auto_131541 ) ) ( not ( = ?auto_131544 ?auto_131540 ) ) ( not ( = ?auto_131544 ?auto_131539 ) ) ( not ( = ?auto_131542 ?auto_131541 ) ) ( not ( = ?auto_131542 ?auto_131540 ) ) ( not ( = ?auto_131542 ?auto_131539 ) ) ( not ( = ?auto_131538 ?auto_131545 ) ) ( not ( = ?auto_131538 ?auto_131544 ) ) ( not ( = ?auto_131538 ?auto_131542 ) ) ( ON ?auto_131538 ?auto_131543 ) ( not ( = ?auto_131538 ?auto_131543 ) ) ( not ( = ?auto_131539 ?auto_131543 ) ) ( not ( = ?auto_131540 ?auto_131543 ) ) ( not ( = ?auto_131541 ?auto_131543 ) ) ( not ( = ?auto_131545 ?auto_131543 ) ) ( not ( = ?auto_131544 ?auto_131543 ) ) ( not ( = ?auto_131542 ?auto_131543 ) ) ( ON ?auto_131539 ?auto_131538 ) ( ON-TABLE ?auto_131543 ) ( ON ?auto_131540 ?auto_131539 ) ( ON ?auto_131541 ?auto_131540 ) ( ON ?auto_131542 ?auto_131541 ) ( ON ?auto_131544 ?auto_131542 ) ( CLEAR ?auto_131544 ) ( HOLDING ?auto_131545 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_131545 )
      ( MAKE-3PILE ?auto_131538 ?auto_131539 ?auto_131540 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_131546 - BLOCK
      ?auto_131547 - BLOCK
      ?auto_131548 - BLOCK
    )
    :vars
    (
      ?auto_131552 - BLOCK
      ?auto_131553 - BLOCK
      ?auto_131550 - BLOCK
      ?auto_131549 - BLOCK
      ?auto_131551 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131546 ?auto_131547 ) ) ( not ( = ?auto_131546 ?auto_131548 ) ) ( not ( = ?auto_131547 ?auto_131548 ) ) ( not ( = ?auto_131546 ?auto_131552 ) ) ( not ( = ?auto_131547 ?auto_131552 ) ) ( not ( = ?auto_131548 ?auto_131552 ) ) ( not ( = ?auto_131553 ?auto_131550 ) ) ( not ( = ?auto_131553 ?auto_131549 ) ) ( not ( = ?auto_131553 ?auto_131552 ) ) ( not ( = ?auto_131553 ?auto_131548 ) ) ( not ( = ?auto_131553 ?auto_131547 ) ) ( not ( = ?auto_131550 ?auto_131549 ) ) ( not ( = ?auto_131550 ?auto_131552 ) ) ( not ( = ?auto_131550 ?auto_131548 ) ) ( not ( = ?auto_131550 ?auto_131547 ) ) ( not ( = ?auto_131549 ?auto_131552 ) ) ( not ( = ?auto_131549 ?auto_131548 ) ) ( not ( = ?auto_131549 ?auto_131547 ) ) ( not ( = ?auto_131546 ?auto_131553 ) ) ( not ( = ?auto_131546 ?auto_131550 ) ) ( not ( = ?auto_131546 ?auto_131549 ) ) ( ON ?auto_131546 ?auto_131551 ) ( not ( = ?auto_131546 ?auto_131551 ) ) ( not ( = ?auto_131547 ?auto_131551 ) ) ( not ( = ?auto_131548 ?auto_131551 ) ) ( not ( = ?auto_131552 ?auto_131551 ) ) ( not ( = ?auto_131553 ?auto_131551 ) ) ( not ( = ?auto_131550 ?auto_131551 ) ) ( not ( = ?auto_131549 ?auto_131551 ) ) ( ON ?auto_131547 ?auto_131546 ) ( ON-TABLE ?auto_131551 ) ( ON ?auto_131548 ?auto_131547 ) ( ON ?auto_131552 ?auto_131548 ) ( ON ?auto_131549 ?auto_131552 ) ( ON ?auto_131550 ?auto_131549 ) ( ON ?auto_131553 ?auto_131550 ) ( CLEAR ?auto_131553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_131551 ?auto_131546 ?auto_131547 ?auto_131548 ?auto_131552 ?auto_131549 ?auto_131550 )
      ( MAKE-3PILE ?auto_131546 ?auto_131547 ?auto_131548 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_131557 - BLOCK
      ?auto_131558 - BLOCK
      ?auto_131559 - BLOCK
    )
    :vars
    (
      ?auto_131560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131560 ?auto_131559 ) ( CLEAR ?auto_131560 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_131557 ) ( ON ?auto_131558 ?auto_131557 ) ( ON ?auto_131559 ?auto_131558 ) ( not ( = ?auto_131557 ?auto_131558 ) ) ( not ( = ?auto_131557 ?auto_131559 ) ) ( not ( = ?auto_131557 ?auto_131560 ) ) ( not ( = ?auto_131558 ?auto_131559 ) ) ( not ( = ?auto_131558 ?auto_131560 ) ) ( not ( = ?auto_131559 ?auto_131560 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_131560 ?auto_131559 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_131561 - BLOCK
      ?auto_131562 - BLOCK
      ?auto_131563 - BLOCK
    )
    :vars
    (
      ?auto_131564 - BLOCK
      ?auto_131565 - BLOCK
      ?auto_131566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131564 ?auto_131563 ) ( CLEAR ?auto_131564 ) ( ON-TABLE ?auto_131561 ) ( ON ?auto_131562 ?auto_131561 ) ( ON ?auto_131563 ?auto_131562 ) ( not ( = ?auto_131561 ?auto_131562 ) ) ( not ( = ?auto_131561 ?auto_131563 ) ) ( not ( = ?auto_131561 ?auto_131564 ) ) ( not ( = ?auto_131562 ?auto_131563 ) ) ( not ( = ?auto_131562 ?auto_131564 ) ) ( not ( = ?auto_131563 ?auto_131564 ) ) ( HOLDING ?auto_131565 ) ( CLEAR ?auto_131566 ) ( not ( = ?auto_131561 ?auto_131565 ) ) ( not ( = ?auto_131561 ?auto_131566 ) ) ( not ( = ?auto_131562 ?auto_131565 ) ) ( not ( = ?auto_131562 ?auto_131566 ) ) ( not ( = ?auto_131563 ?auto_131565 ) ) ( not ( = ?auto_131563 ?auto_131566 ) ) ( not ( = ?auto_131564 ?auto_131565 ) ) ( not ( = ?auto_131564 ?auto_131566 ) ) ( not ( = ?auto_131565 ?auto_131566 ) ) )
    :subtasks
    ( ( !STACK ?auto_131565 ?auto_131566 )
      ( MAKE-3PILE ?auto_131561 ?auto_131562 ?auto_131563 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_131567 - BLOCK
      ?auto_131568 - BLOCK
      ?auto_131569 - BLOCK
    )
    :vars
    (
      ?auto_131571 - BLOCK
      ?auto_131570 - BLOCK
      ?auto_131572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131571 ?auto_131569 ) ( ON-TABLE ?auto_131567 ) ( ON ?auto_131568 ?auto_131567 ) ( ON ?auto_131569 ?auto_131568 ) ( not ( = ?auto_131567 ?auto_131568 ) ) ( not ( = ?auto_131567 ?auto_131569 ) ) ( not ( = ?auto_131567 ?auto_131571 ) ) ( not ( = ?auto_131568 ?auto_131569 ) ) ( not ( = ?auto_131568 ?auto_131571 ) ) ( not ( = ?auto_131569 ?auto_131571 ) ) ( CLEAR ?auto_131570 ) ( not ( = ?auto_131567 ?auto_131572 ) ) ( not ( = ?auto_131567 ?auto_131570 ) ) ( not ( = ?auto_131568 ?auto_131572 ) ) ( not ( = ?auto_131568 ?auto_131570 ) ) ( not ( = ?auto_131569 ?auto_131572 ) ) ( not ( = ?auto_131569 ?auto_131570 ) ) ( not ( = ?auto_131571 ?auto_131572 ) ) ( not ( = ?auto_131571 ?auto_131570 ) ) ( not ( = ?auto_131572 ?auto_131570 ) ) ( ON ?auto_131572 ?auto_131571 ) ( CLEAR ?auto_131572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_131567 ?auto_131568 ?auto_131569 ?auto_131571 )
      ( MAKE-3PILE ?auto_131567 ?auto_131568 ?auto_131569 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_131573 - BLOCK
      ?auto_131574 - BLOCK
      ?auto_131575 - BLOCK
    )
    :vars
    (
      ?auto_131578 - BLOCK
      ?auto_131576 - BLOCK
      ?auto_131577 - BLOCK
      ?auto_131579 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131578 ?auto_131575 ) ( ON-TABLE ?auto_131573 ) ( ON ?auto_131574 ?auto_131573 ) ( ON ?auto_131575 ?auto_131574 ) ( not ( = ?auto_131573 ?auto_131574 ) ) ( not ( = ?auto_131573 ?auto_131575 ) ) ( not ( = ?auto_131573 ?auto_131578 ) ) ( not ( = ?auto_131574 ?auto_131575 ) ) ( not ( = ?auto_131574 ?auto_131578 ) ) ( not ( = ?auto_131575 ?auto_131578 ) ) ( not ( = ?auto_131573 ?auto_131576 ) ) ( not ( = ?auto_131573 ?auto_131577 ) ) ( not ( = ?auto_131574 ?auto_131576 ) ) ( not ( = ?auto_131574 ?auto_131577 ) ) ( not ( = ?auto_131575 ?auto_131576 ) ) ( not ( = ?auto_131575 ?auto_131577 ) ) ( not ( = ?auto_131578 ?auto_131576 ) ) ( not ( = ?auto_131578 ?auto_131577 ) ) ( not ( = ?auto_131576 ?auto_131577 ) ) ( ON ?auto_131576 ?auto_131578 ) ( CLEAR ?auto_131576 ) ( HOLDING ?auto_131577 ) ( CLEAR ?auto_131579 ) ( ON-TABLE ?auto_131579 ) ( not ( = ?auto_131579 ?auto_131577 ) ) ( not ( = ?auto_131573 ?auto_131579 ) ) ( not ( = ?auto_131574 ?auto_131579 ) ) ( not ( = ?auto_131575 ?auto_131579 ) ) ( not ( = ?auto_131578 ?auto_131579 ) ) ( not ( = ?auto_131576 ?auto_131579 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_131579 ?auto_131577 )
      ( MAKE-3PILE ?auto_131573 ?auto_131574 ?auto_131575 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_131580 - BLOCK
      ?auto_131581 - BLOCK
      ?auto_131582 - BLOCK
    )
    :vars
    (
      ?auto_131584 - BLOCK
      ?auto_131586 - BLOCK
      ?auto_131585 - BLOCK
      ?auto_131583 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131584 ?auto_131582 ) ( ON-TABLE ?auto_131580 ) ( ON ?auto_131581 ?auto_131580 ) ( ON ?auto_131582 ?auto_131581 ) ( not ( = ?auto_131580 ?auto_131581 ) ) ( not ( = ?auto_131580 ?auto_131582 ) ) ( not ( = ?auto_131580 ?auto_131584 ) ) ( not ( = ?auto_131581 ?auto_131582 ) ) ( not ( = ?auto_131581 ?auto_131584 ) ) ( not ( = ?auto_131582 ?auto_131584 ) ) ( not ( = ?auto_131580 ?auto_131586 ) ) ( not ( = ?auto_131580 ?auto_131585 ) ) ( not ( = ?auto_131581 ?auto_131586 ) ) ( not ( = ?auto_131581 ?auto_131585 ) ) ( not ( = ?auto_131582 ?auto_131586 ) ) ( not ( = ?auto_131582 ?auto_131585 ) ) ( not ( = ?auto_131584 ?auto_131586 ) ) ( not ( = ?auto_131584 ?auto_131585 ) ) ( not ( = ?auto_131586 ?auto_131585 ) ) ( ON ?auto_131586 ?auto_131584 ) ( CLEAR ?auto_131583 ) ( ON-TABLE ?auto_131583 ) ( not ( = ?auto_131583 ?auto_131585 ) ) ( not ( = ?auto_131580 ?auto_131583 ) ) ( not ( = ?auto_131581 ?auto_131583 ) ) ( not ( = ?auto_131582 ?auto_131583 ) ) ( not ( = ?auto_131584 ?auto_131583 ) ) ( not ( = ?auto_131586 ?auto_131583 ) ) ( ON ?auto_131585 ?auto_131586 ) ( CLEAR ?auto_131585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_131580 ?auto_131581 ?auto_131582 ?auto_131584 ?auto_131586 )
      ( MAKE-3PILE ?auto_131580 ?auto_131581 ?auto_131582 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_131587 - BLOCK
      ?auto_131588 - BLOCK
      ?auto_131589 - BLOCK
    )
    :vars
    (
      ?auto_131591 - BLOCK
      ?auto_131590 - BLOCK
      ?auto_131593 - BLOCK
      ?auto_131592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131591 ?auto_131589 ) ( ON-TABLE ?auto_131587 ) ( ON ?auto_131588 ?auto_131587 ) ( ON ?auto_131589 ?auto_131588 ) ( not ( = ?auto_131587 ?auto_131588 ) ) ( not ( = ?auto_131587 ?auto_131589 ) ) ( not ( = ?auto_131587 ?auto_131591 ) ) ( not ( = ?auto_131588 ?auto_131589 ) ) ( not ( = ?auto_131588 ?auto_131591 ) ) ( not ( = ?auto_131589 ?auto_131591 ) ) ( not ( = ?auto_131587 ?auto_131590 ) ) ( not ( = ?auto_131587 ?auto_131593 ) ) ( not ( = ?auto_131588 ?auto_131590 ) ) ( not ( = ?auto_131588 ?auto_131593 ) ) ( not ( = ?auto_131589 ?auto_131590 ) ) ( not ( = ?auto_131589 ?auto_131593 ) ) ( not ( = ?auto_131591 ?auto_131590 ) ) ( not ( = ?auto_131591 ?auto_131593 ) ) ( not ( = ?auto_131590 ?auto_131593 ) ) ( ON ?auto_131590 ?auto_131591 ) ( not ( = ?auto_131592 ?auto_131593 ) ) ( not ( = ?auto_131587 ?auto_131592 ) ) ( not ( = ?auto_131588 ?auto_131592 ) ) ( not ( = ?auto_131589 ?auto_131592 ) ) ( not ( = ?auto_131591 ?auto_131592 ) ) ( not ( = ?auto_131590 ?auto_131592 ) ) ( ON ?auto_131593 ?auto_131590 ) ( CLEAR ?auto_131593 ) ( HOLDING ?auto_131592 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_131592 )
      ( MAKE-3PILE ?auto_131587 ?auto_131588 ?auto_131589 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_131594 - BLOCK
      ?auto_131595 - BLOCK
      ?auto_131596 - BLOCK
    )
    :vars
    (
      ?auto_131597 - BLOCK
      ?auto_131599 - BLOCK
      ?auto_131598 - BLOCK
      ?auto_131600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131597 ?auto_131596 ) ( ON-TABLE ?auto_131594 ) ( ON ?auto_131595 ?auto_131594 ) ( ON ?auto_131596 ?auto_131595 ) ( not ( = ?auto_131594 ?auto_131595 ) ) ( not ( = ?auto_131594 ?auto_131596 ) ) ( not ( = ?auto_131594 ?auto_131597 ) ) ( not ( = ?auto_131595 ?auto_131596 ) ) ( not ( = ?auto_131595 ?auto_131597 ) ) ( not ( = ?auto_131596 ?auto_131597 ) ) ( not ( = ?auto_131594 ?auto_131599 ) ) ( not ( = ?auto_131594 ?auto_131598 ) ) ( not ( = ?auto_131595 ?auto_131599 ) ) ( not ( = ?auto_131595 ?auto_131598 ) ) ( not ( = ?auto_131596 ?auto_131599 ) ) ( not ( = ?auto_131596 ?auto_131598 ) ) ( not ( = ?auto_131597 ?auto_131599 ) ) ( not ( = ?auto_131597 ?auto_131598 ) ) ( not ( = ?auto_131599 ?auto_131598 ) ) ( ON ?auto_131599 ?auto_131597 ) ( not ( = ?auto_131600 ?auto_131598 ) ) ( not ( = ?auto_131594 ?auto_131600 ) ) ( not ( = ?auto_131595 ?auto_131600 ) ) ( not ( = ?auto_131596 ?auto_131600 ) ) ( not ( = ?auto_131597 ?auto_131600 ) ) ( not ( = ?auto_131599 ?auto_131600 ) ) ( ON ?auto_131598 ?auto_131599 ) ( ON ?auto_131600 ?auto_131598 ) ( CLEAR ?auto_131600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_131594 ?auto_131595 ?auto_131596 ?auto_131597 ?auto_131599 ?auto_131598 )
      ( MAKE-3PILE ?auto_131594 ?auto_131595 ?auto_131596 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_131601 - BLOCK
      ?auto_131602 - BLOCK
      ?auto_131603 - BLOCK
    )
    :vars
    (
      ?auto_131604 - BLOCK
      ?auto_131605 - BLOCK
      ?auto_131607 - BLOCK
      ?auto_131606 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131604 ?auto_131603 ) ( ON-TABLE ?auto_131601 ) ( ON ?auto_131602 ?auto_131601 ) ( ON ?auto_131603 ?auto_131602 ) ( not ( = ?auto_131601 ?auto_131602 ) ) ( not ( = ?auto_131601 ?auto_131603 ) ) ( not ( = ?auto_131601 ?auto_131604 ) ) ( not ( = ?auto_131602 ?auto_131603 ) ) ( not ( = ?auto_131602 ?auto_131604 ) ) ( not ( = ?auto_131603 ?auto_131604 ) ) ( not ( = ?auto_131601 ?auto_131605 ) ) ( not ( = ?auto_131601 ?auto_131607 ) ) ( not ( = ?auto_131602 ?auto_131605 ) ) ( not ( = ?auto_131602 ?auto_131607 ) ) ( not ( = ?auto_131603 ?auto_131605 ) ) ( not ( = ?auto_131603 ?auto_131607 ) ) ( not ( = ?auto_131604 ?auto_131605 ) ) ( not ( = ?auto_131604 ?auto_131607 ) ) ( not ( = ?auto_131605 ?auto_131607 ) ) ( ON ?auto_131605 ?auto_131604 ) ( not ( = ?auto_131606 ?auto_131607 ) ) ( not ( = ?auto_131601 ?auto_131606 ) ) ( not ( = ?auto_131602 ?auto_131606 ) ) ( not ( = ?auto_131603 ?auto_131606 ) ) ( not ( = ?auto_131604 ?auto_131606 ) ) ( not ( = ?auto_131605 ?auto_131606 ) ) ( ON ?auto_131607 ?auto_131605 ) ( HOLDING ?auto_131606 ) ( CLEAR ?auto_131607 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_131601 ?auto_131602 ?auto_131603 ?auto_131604 ?auto_131605 ?auto_131607 ?auto_131606 )
      ( MAKE-3PILE ?auto_131601 ?auto_131602 ?auto_131603 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_131608 - BLOCK
      ?auto_131609 - BLOCK
      ?auto_131610 - BLOCK
    )
    :vars
    (
      ?auto_131612 - BLOCK
      ?auto_131611 - BLOCK
      ?auto_131613 - BLOCK
      ?auto_131614 - BLOCK
      ?auto_131615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131612 ?auto_131610 ) ( ON-TABLE ?auto_131608 ) ( ON ?auto_131609 ?auto_131608 ) ( ON ?auto_131610 ?auto_131609 ) ( not ( = ?auto_131608 ?auto_131609 ) ) ( not ( = ?auto_131608 ?auto_131610 ) ) ( not ( = ?auto_131608 ?auto_131612 ) ) ( not ( = ?auto_131609 ?auto_131610 ) ) ( not ( = ?auto_131609 ?auto_131612 ) ) ( not ( = ?auto_131610 ?auto_131612 ) ) ( not ( = ?auto_131608 ?auto_131611 ) ) ( not ( = ?auto_131608 ?auto_131613 ) ) ( not ( = ?auto_131609 ?auto_131611 ) ) ( not ( = ?auto_131609 ?auto_131613 ) ) ( not ( = ?auto_131610 ?auto_131611 ) ) ( not ( = ?auto_131610 ?auto_131613 ) ) ( not ( = ?auto_131612 ?auto_131611 ) ) ( not ( = ?auto_131612 ?auto_131613 ) ) ( not ( = ?auto_131611 ?auto_131613 ) ) ( ON ?auto_131611 ?auto_131612 ) ( not ( = ?auto_131614 ?auto_131613 ) ) ( not ( = ?auto_131608 ?auto_131614 ) ) ( not ( = ?auto_131609 ?auto_131614 ) ) ( not ( = ?auto_131610 ?auto_131614 ) ) ( not ( = ?auto_131612 ?auto_131614 ) ) ( not ( = ?auto_131611 ?auto_131614 ) ) ( ON ?auto_131613 ?auto_131611 ) ( CLEAR ?auto_131613 ) ( ON ?auto_131614 ?auto_131615 ) ( CLEAR ?auto_131614 ) ( HAND-EMPTY ) ( not ( = ?auto_131608 ?auto_131615 ) ) ( not ( = ?auto_131609 ?auto_131615 ) ) ( not ( = ?auto_131610 ?auto_131615 ) ) ( not ( = ?auto_131612 ?auto_131615 ) ) ( not ( = ?auto_131611 ?auto_131615 ) ) ( not ( = ?auto_131613 ?auto_131615 ) ) ( not ( = ?auto_131614 ?auto_131615 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_131614 ?auto_131615 )
      ( MAKE-3PILE ?auto_131608 ?auto_131609 ?auto_131610 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_131616 - BLOCK
      ?auto_131617 - BLOCK
      ?auto_131618 - BLOCK
    )
    :vars
    (
      ?auto_131623 - BLOCK
      ?auto_131622 - BLOCK
      ?auto_131620 - BLOCK
      ?auto_131621 - BLOCK
      ?auto_131619 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131623 ?auto_131618 ) ( ON-TABLE ?auto_131616 ) ( ON ?auto_131617 ?auto_131616 ) ( ON ?auto_131618 ?auto_131617 ) ( not ( = ?auto_131616 ?auto_131617 ) ) ( not ( = ?auto_131616 ?auto_131618 ) ) ( not ( = ?auto_131616 ?auto_131623 ) ) ( not ( = ?auto_131617 ?auto_131618 ) ) ( not ( = ?auto_131617 ?auto_131623 ) ) ( not ( = ?auto_131618 ?auto_131623 ) ) ( not ( = ?auto_131616 ?auto_131622 ) ) ( not ( = ?auto_131616 ?auto_131620 ) ) ( not ( = ?auto_131617 ?auto_131622 ) ) ( not ( = ?auto_131617 ?auto_131620 ) ) ( not ( = ?auto_131618 ?auto_131622 ) ) ( not ( = ?auto_131618 ?auto_131620 ) ) ( not ( = ?auto_131623 ?auto_131622 ) ) ( not ( = ?auto_131623 ?auto_131620 ) ) ( not ( = ?auto_131622 ?auto_131620 ) ) ( ON ?auto_131622 ?auto_131623 ) ( not ( = ?auto_131621 ?auto_131620 ) ) ( not ( = ?auto_131616 ?auto_131621 ) ) ( not ( = ?auto_131617 ?auto_131621 ) ) ( not ( = ?auto_131618 ?auto_131621 ) ) ( not ( = ?auto_131623 ?auto_131621 ) ) ( not ( = ?auto_131622 ?auto_131621 ) ) ( ON ?auto_131621 ?auto_131619 ) ( CLEAR ?auto_131621 ) ( not ( = ?auto_131616 ?auto_131619 ) ) ( not ( = ?auto_131617 ?auto_131619 ) ) ( not ( = ?auto_131618 ?auto_131619 ) ) ( not ( = ?auto_131623 ?auto_131619 ) ) ( not ( = ?auto_131622 ?auto_131619 ) ) ( not ( = ?auto_131620 ?auto_131619 ) ) ( not ( = ?auto_131621 ?auto_131619 ) ) ( HOLDING ?auto_131620 ) ( CLEAR ?auto_131622 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_131616 ?auto_131617 ?auto_131618 ?auto_131623 ?auto_131622 ?auto_131620 )
      ( MAKE-3PILE ?auto_131616 ?auto_131617 ?auto_131618 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_131624 - BLOCK
      ?auto_131625 - BLOCK
      ?auto_131626 - BLOCK
    )
    :vars
    (
      ?auto_131629 - BLOCK
      ?auto_131630 - BLOCK
      ?auto_131628 - BLOCK
      ?auto_131627 - BLOCK
      ?auto_131631 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131629 ?auto_131626 ) ( ON-TABLE ?auto_131624 ) ( ON ?auto_131625 ?auto_131624 ) ( ON ?auto_131626 ?auto_131625 ) ( not ( = ?auto_131624 ?auto_131625 ) ) ( not ( = ?auto_131624 ?auto_131626 ) ) ( not ( = ?auto_131624 ?auto_131629 ) ) ( not ( = ?auto_131625 ?auto_131626 ) ) ( not ( = ?auto_131625 ?auto_131629 ) ) ( not ( = ?auto_131626 ?auto_131629 ) ) ( not ( = ?auto_131624 ?auto_131630 ) ) ( not ( = ?auto_131624 ?auto_131628 ) ) ( not ( = ?auto_131625 ?auto_131630 ) ) ( not ( = ?auto_131625 ?auto_131628 ) ) ( not ( = ?auto_131626 ?auto_131630 ) ) ( not ( = ?auto_131626 ?auto_131628 ) ) ( not ( = ?auto_131629 ?auto_131630 ) ) ( not ( = ?auto_131629 ?auto_131628 ) ) ( not ( = ?auto_131630 ?auto_131628 ) ) ( ON ?auto_131630 ?auto_131629 ) ( not ( = ?auto_131627 ?auto_131628 ) ) ( not ( = ?auto_131624 ?auto_131627 ) ) ( not ( = ?auto_131625 ?auto_131627 ) ) ( not ( = ?auto_131626 ?auto_131627 ) ) ( not ( = ?auto_131629 ?auto_131627 ) ) ( not ( = ?auto_131630 ?auto_131627 ) ) ( ON ?auto_131627 ?auto_131631 ) ( not ( = ?auto_131624 ?auto_131631 ) ) ( not ( = ?auto_131625 ?auto_131631 ) ) ( not ( = ?auto_131626 ?auto_131631 ) ) ( not ( = ?auto_131629 ?auto_131631 ) ) ( not ( = ?auto_131630 ?auto_131631 ) ) ( not ( = ?auto_131628 ?auto_131631 ) ) ( not ( = ?auto_131627 ?auto_131631 ) ) ( CLEAR ?auto_131630 ) ( ON ?auto_131628 ?auto_131627 ) ( CLEAR ?auto_131628 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_131631 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_131631 ?auto_131627 )
      ( MAKE-3PILE ?auto_131624 ?auto_131625 ?auto_131626 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_131632 - BLOCK
      ?auto_131633 - BLOCK
      ?auto_131634 - BLOCK
    )
    :vars
    (
      ?auto_131639 - BLOCK
      ?auto_131637 - BLOCK
      ?auto_131638 - BLOCK
      ?auto_131635 - BLOCK
      ?auto_131636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131639 ?auto_131634 ) ( ON-TABLE ?auto_131632 ) ( ON ?auto_131633 ?auto_131632 ) ( ON ?auto_131634 ?auto_131633 ) ( not ( = ?auto_131632 ?auto_131633 ) ) ( not ( = ?auto_131632 ?auto_131634 ) ) ( not ( = ?auto_131632 ?auto_131639 ) ) ( not ( = ?auto_131633 ?auto_131634 ) ) ( not ( = ?auto_131633 ?auto_131639 ) ) ( not ( = ?auto_131634 ?auto_131639 ) ) ( not ( = ?auto_131632 ?auto_131637 ) ) ( not ( = ?auto_131632 ?auto_131638 ) ) ( not ( = ?auto_131633 ?auto_131637 ) ) ( not ( = ?auto_131633 ?auto_131638 ) ) ( not ( = ?auto_131634 ?auto_131637 ) ) ( not ( = ?auto_131634 ?auto_131638 ) ) ( not ( = ?auto_131639 ?auto_131637 ) ) ( not ( = ?auto_131639 ?auto_131638 ) ) ( not ( = ?auto_131637 ?auto_131638 ) ) ( not ( = ?auto_131635 ?auto_131638 ) ) ( not ( = ?auto_131632 ?auto_131635 ) ) ( not ( = ?auto_131633 ?auto_131635 ) ) ( not ( = ?auto_131634 ?auto_131635 ) ) ( not ( = ?auto_131639 ?auto_131635 ) ) ( not ( = ?auto_131637 ?auto_131635 ) ) ( ON ?auto_131635 ?auto_131636 ) ( not ( = ?auto_131632 ?auto_131636 ) ) ( not ( = ?auto_131633 ?auto_131636 ) ) ( not ( = ?auto_131634 ?auto_131636 ) ) ( not ( = ?auto_131639 ?auto_131636 ) ) ( not ( = ?auto_131637 ?auto_131636 ) ) ( not ( = ?auto_131638 ?auto_131636 ) ) ( not ( = ?auto_131635 ?auto_131636 ) ) ( ON ?auto_131638 ?auto_131635 ) ( CLEAR ?auto_131638 ) ( ON-TABLE ?auto_131636 ) ( HOLDING ?auto_131637 ) ( CLEAR ?auto_131639 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_131632 ?auto_131633 ?auto_131634 ?auto_131639 ?auto_131637 )
      ( MAKE-3PILE ?auto_131632 ?auto_131633 ?auto_131634 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_131640 - BLOCK
      ?auto_131641 - BLOCK
      ?auto_131642 - BLOCK
    )
    :vars
    (
      ?auto_131646 - BLOCK
      ?auto_131647 - BLOCK
      ?auto_131644 - BLOCK
      ?auto_131645 - BLOCK
      ?auto_131643 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131646 ?auto_131642 ) ( ON-TABLE ?auto_131640 ) ( ON ?auto_131641 ?auto_131640 ) ( ON ?auto_131642 ?auto_131641 ) ( not ( = ?auto_131640 ?auto_131641 ) ) ( not ( = ?auto_131640 ?auto_131642 ) ) ( not ( = ?auto_131640 ?auto_131646 ) ) ( not ( = ?auto_131641 ?auto_131642 ) ) ( not ( = ?auto_131641 ?auto_131646 ) ) ( not ( = ?auto_131642 ?auto_131646 ) ) ( not ( = ?auto_131640 ?auto_131647 ) ) ( not ( = ?auto_131640 ?auto_131644 ) ) ( not ( = ?auto_131641 ?auto_131647 ) ) ( not ( = ?auto_131641 ?auto_131644 ) ) ( not ( = ?auto_131642 ?auto_131647 ) ) ( not ( = ?auto_131642 ?auto_131644 ) ) ( not ( = ?auto_131646 ?auto_131647 ) ) ( not ( = ?auto_131646 ?auto_131644 ) ) ( not ( = ?auto_131647 ?auto_131644 ) ) ( not ( = ?auto_131645 ?auto_131644 ) ) ( not ( = ?auto_131640 ?auto_131645 ) ) ( not ( = ?auto_131641 ?auto_131645 ) ) ( not ( = ?auto_131642 ?auto_131645 ) ) ( not ( = ?auto_131646 ?auto_131645 ) ) ( not ( = ?auto_131647 ?auto_131645 ) ) ( ON ?auto_131645 ?auto_131643 ) ( not ( = ?auto_131640 ?auto_131643 ) ) ( not ( = ?auto_131641 ?auto_131643 ) ) ( not ( = ?auto_131642 ?auto_131643 ) ) ( not ( = ?auto_131646 ?auto_131643 ) ) ( not ( = ?auto_131647 ?auto_131643 ) ) ( not ( = ?auto_131644 ?auto_131643 ) ) ( not ( = ?auto_131645 ?auto_131643 ) ) ( ON ?auto_131644 ?auto_131645 ) ( ON-TABLE ?auto_131643 ) ( CLEAR ?auto_131646 ) ( ON ?auto_131647 ?auto_131644 ) ( CLEAR ?auto_131647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_131643 ?auto_131645 ?auto_131644 )
      ( MAKE-3PILE ?auto_131640 ?auto_131641 ?auto_131642 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_131664 - BLOCK
      ?auto_131665 - BLOCK
      ?auto_131666 - BLOCK
    )
    :vars
    (
      ?auto_131668 - BLOCK
      ?auto_131667 - BLOCK
      ?auto_131671 - BLOCK
      ?auto_131670 - BLOCK
      ?auto_131669 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131664 ) ( ON ?auto_131665 ?auto_131664 ) ( not ( = ?auto_131664 ?auto_131665 ) ) ( not ( = ?auto_131664 ?auto_131666 ) ) ( not ( = ?auto_131664 ?auto_131668 ) ) ( not ( = ?auto_131665 ?auto_131666 ) ) ( not ( = ?auto_131665 ?auto_131668 ) ) ( not ( = ?auto_131666 ?auto_131668 ) ) ( not ( = ?auto_131664 ?auto_131667 ) ) ( not ( = ?auto_131664 ?auto_131671 ) ) ( not ( = ?auto_131665 ?auto_131667 ) ) ( not ( = ?auto_131665 ?auto_131671 ) ) ( not ( = ?auto_131666 ?auto_131667 ) ) ( not ( = ?auto_131666 ?auto_131671 ) ) ( not ( = ?auto_131668 ?auto_131667 ) ) ( not ( = ?auto_131668 ?auto_131671 ) ) ( not ( = ?auto_131667 ?auto_131671 ) ) ( not ( = ?auto_131670 ?auto_131671 ) ) ( not ( = ?auto_131664 ?auto_131670 ) ) ( not ( = ?auto_131665 ?auto_131670 ) ) ( not ( = ?auto_131666 ?auto_131670 ) ) ( not ( = ?auto_131668 ?auto_131670 ) ) ( not ( = ?auto_131667 ?auto_131670 ) ) ( ON ?auto_131670 ?auto_131669 ) ( not ( = ?auto_131664 ?auto_131669 ) ) ( not ( = ?auto_131665 ?auto_131669 ) ) ( not ( = ?auto_131666 ?auto_131669 ) ) ( not ( = ?auto_131668 ?auto_131669 ) ) ( not ( = ?auto_131667 ?auto_131669 ) ) ( not ( = ?auto_131671 ?auto_131669 ) ) ( not ( = ?auto_131670 ?auto_131669 ) ) ( ON ?auto_131671 ?auto_131670 ) ( ON-TABLE ?auto_131669 ) ( ON ?auto_131667 ?auto_131671 ) ( ON ?auto_131668 ?auto_131667 ) ( CLEAR ?auto_131668 ) ( HOLDING ?auto_131666 ) ( CLEAR ?auto_131665 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_131664 ?auto_131665 ?auto_131666 ?auto_131668 )
      ( MAKE-3PILE ?auto_131664 ?auto_131665 ?auto_131666 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_131672 - BLOCK
      ?auto_131673 - BLOCK
      ?auto_131674 - BLOCK
    )
    :vars
    (
      ?auto_131678 - BLOCK
      ?auto_131676 - BLOCK
      ?auto_131679 - BLOCK
      ?auto_131675 - BLOCK
      ?auto_131677 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131672 ) ( ON ?auto_131673 ?auto_131672 ) ( not ( = ?auto_131672 ?auto_131673 ) ) ( not ( = ?auto_131672 ?auto_131674 ) ) ( not ( = ?auto_131672 ?auto_131678 ) ) ( not ( = ?auto_131673 ?auto_131674 ) ) ( not ( = ?auto_131673 ?auto_131678 ) ) ( not ( = ?auto_131674 ?auto_131678 ) ) ( not ( = ?auto_131672 ?auto_131676 ) ) ( not ( = ?auto_131672 ?auto_131679 ) ) ( not ( = ?auto_131673 ?auto_131676 ) ) ( not ( = ?auto_131673 ?auto_131679 ) ) ( not ( = ?auto_131674 ?auto_131676 ) ) ( not ( = ?auto_131674 ?auto_131679 ) ) ( not ( = ?auto_131678 ?auto_131676 ) ) ( not ( = ?auto_131678 ?auto_131679 ) ) ( not ( = ?auto_131676 ?auto_131679 ) ) ( not ( = ?auto_131675 ?auto_131679 ) ) ( not ( = ?auto_131672 ?auto_131675 ) ) ( not ( = ?auto_131673 ?auto_131675 ) ) ( not ( = ?auto_131674 ?auto_131675 ) ) ( not ( = ?auto_131678 ?auto_131675 ) ) ( not ( = ?auto_131676 ?auto_131675 ) ) ( ON ?auto_131675 ?auto_131677 ) ( not ( = ?auto_131672 ?auto_131677 ) ) ( not ( = ?auto_131673 ?auto_131677 ) ) ( not ( = ?auto_131674 ?auto_131677 ) ) ( not ( = ?auto_131678 ?auto_131677 ) ) ( not ( = ?auto_131676 ?auto_131677 ) ) ( not ( = ?auto_131679 ?auto_131677 ) ) ( not ( = ?auto_131675 ?auto_131677 ) ) ( ON ?auto_131679 ?auto_131675 ) ( ON-TABLE ?auto_131677 ) ( ON ?auto_131676 ?auto_131679 ) ( ON ?auto_131678 ?auto_131676 ) ( CLEAR ?auto_131673 ) ( ON ?auto_131674 ?auto_131678 ) ( CLEAR ?auto_131674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_131677 ?auto_131675 ?auto_131679 ?auto_131676 ?auto_131678 )
      ( MAKE-3PILE ?auto_131672 ?auto_131673 ?auto_131674 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_131680 - BLOCK
      ?auto_131681 - BLOCK
      ?auto_131682 - BLOCK
    )
    :vars
    (
      ?auto_131683 - BLOCK
      ?auto_131686 - BLOCK
      ?auto_131685 - BLOCK
      ?auto_131684 - BLOCK
      ?auto_131687 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131680 ) ( not ( = ?auto_131680 ?auto_131681 ) ) ( not ( = ?auto_131680 ?auto_131682 ) ) ( not ( = ?auto_131680 ?auto_131683 ) ) ( not ( = ?auto_131681 ?auto_131682 ) ) ( not ( = ?auto_131681 ?auto_131683 ) ) ( not ( = ?auto_131682 ?auto_131683 ) ) ( not ( = ?auto_131680 ?auto_131686 ) ) ( not ( = ?auto_131680 ?auto_131685 ) ) ( not ( = ?auto_131681 ?auto_131686 ) ) ( not ( = ?auto_131681 ?auto_131685 ) ) ( not ( = ?auto_131682 ?auto_131686 ) ) ( not ( = ?auto_131682 ?auto_131685 ) ) ( not ( = ?auto_131683 ?auto_131686 ) ) ( not ( = ?auto_131683 ?auto_131685 ) ) ( not ( = ?auto_131686 ?auto_131685 ) ) ( not ( = ?auto_131684 ?auto_131685 ) ) ( not ( = ?auto_131680 ?auto_131684 ) ) ( not ( = ?auto_131681 ?auto_131684 ) ) ( not ( = ?auto_131682 ?auto_131684 ) ) ( not ( = ?auto_131683 ?auto_131684 ) ) ( not ( = ?auto_131686 ?auto_131684 ) ) ( ON ?auto_131684 ?auto_131687 ) ( not ( = ?auto_131680 ?auto_131687 ) ) ( not ( = ?auto_131681 ?auto_131687 ) ) ( not ( = ?auto_131682 ?auto_131687 ) ) ( not ( = ?auto_131683 ?auto_131687 ) ) ( not ( = ?auto_131686 ?auto_131687 ) ) ( not ( = ?auto_131685 ?auto_131687 ) ) ( not ( = ?auto_131684 ?auto_131687 ) ) ( ON ?auto_131685 ?auto_131684 ) ( ON-TABLE ?auto_131687 ) ( ON ?auto_131686 ?auto_131685 ) ( ON ?auto_131683 ?auto_131686 ) ( ON ?auto_131682 ?auto_131683 ) ( CLEAR ?auto_131682 ) ( HOLDING ?auto_131681 ) ( CLEAR ?auto_131680 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_131680 ?auto_131681 )
      ( MAKE-3PILE ?auto_131680 ?auto_131681 ?auto_131682 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_131688 - BLOCK
      ?auto_131689 - BLOCK
      ?auto_131690 - BLOCK
    )
    :vars
    (
      ?auto_131691 - BLOCK
      ?auto_131695 - BLOCK
      ?auto_131694 - BLOCK
      ?auto_131692 - BLOCK
      ?auto_131693 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131688 ) ( not ( = ?auto_131688 ?auto_131689 ) ) ( not ( = ?auto_131688 ?auto_131690 ) ) ( not ( = ?auto_131688 ?auto_131691 ) ) ( not ( = ?auto_131689 ?auto_131690 ) ) ( not ( = ?auto_131689 ?auto_131691 ) ) ( not ( = ?auto_131690 ?auto_131691 ) ) ( not ( = ?auto_131688 ?auto_131695 ) ) ( not ( = ?auto_131688 ?auto_131694 ) ) ( not ( = ?auto_131689 ?auto_131695 ) ) ( not ( = ?auto_131689 ?auto_131694 ) ) ( not ( = ?auto_131690 ?auto_131695 ) ) ( not ( = ?auto_131690 ?auto_131694 ) ) ( not ( = ?auto_131691 ?auto_131695 ) ) ( not ( = ?auto_131691 ?auto_131694 ) ) ( not ( = ?auto_131695 ?auto_131694 ) ) ( not ( = ?auto_131692 ?auto_131694 ) ) ( not ( = ?auto_131688 ?auto_131692 ) ) ( not ( = ?auto_131689 ?auto_131692 ) ) ( not ( = ?auto_131690 ?auto_131692 ) ) ( not ( = ?auto_131691 ?auto_131692 ) ) ( not ( = ?auto_131695 ?auto_131692 ) ) ( ON ?auto_131692 ?auto_131693 ) ( not ( = ?auto_131688 ?auto_131693 ) ) ( not ( = ?auto_131689 ?auto_131693 ) ) ( not ( = ?auto_131690 ?auto_131693 ) ) ( not ( = ?auto_131691 ?auto_131693 ) ) ( not ( = ?auto_131695 ?auto_131693 ) ) ( not ( = ?auto_131694 ?auto_131693 ) ) ( not ( = ?auto_131692 ?auto_131693 ) ) ( ON ?auto_131694 ?auto_131692 ) ( ON-TABLE ?auto_131693 ) ( ON ?auto_131695 ?auto_131694 ) ( ON ?auto_131691 ?auto_131695 ) ( ON ?auto_131690 ?auto_131691 ) ( CLEAR ?auto_131688 ) ( ON ?auto_131689 ?auto_131690 ) ( CLEAR ?auto_131689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_131693 ?auto_131692 ?auto_131694 ?auto_131695 ?auto_131691 ?auto_131690 )
      ( MAKE-3PILE ?auto_131688 ?auto_131689 ?auto_131690 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_131696 - BLOCK
      ?auto_131697 - BLOCK
      ?auto_131698 - BLOCK
    )
    :vars
    (
      ?auto_131699 - BLOCK
      ?auto_131703 - BLOCK
      ?auto_131700 - BLOCK
      ?auto_131702 - BLOCK
      ?auto_131701 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131696 ?auto_131697 ) ) ( not ( = ?auto_131696 ?auto_131698 ) ) ( not ( = ?auto_131696 ?auto_131699 ) ) ( not ( = ?auto_131697 ?auto_131698 ) ) ( not ( = ?auto_131697 ?auto_131699 ) ) ( not ( = ?auto_131698 ?auto_131699 ) ) ( not ( = ?auto_131696 ?auto_131703 ) ) ( not ( = ?auto_131696 ?auto_131700 ) ) ( not ( = ?auto_131697 ?auto_131703 ) ) ( not ( = ?auto_131697 ?auto_131700 ) ) ( not ( = ?auto_131698 ?auto_131703 ) ) ( not ( = ?auto_131698 ?auto_131700 ) ) ( not ( = ?auto_131699 ?auto_131703 ) ) ( not ( = ?auto_131699 ?auto_131700 ) ) ( not ( = ?auto_131703 ?auto_131700 ) ) ( not ( = ?auto_131702 ?auto_131700 ) ) ( not ( = ?auto_131696 ?auto_131702 ) ) ( not ( = ?auto_131697 ?auto_131702 ) ) ( not ( = ?auto_131698 ?auto_131702 ) ) ( not ( = ?auto_131699 ?auto_131702 ) ) ( not ( = ?auto_131703 ?auto_131702 ) ) ( ON ?auto_131702 ?auto_131701 ) ( not ( = ?auto_131696 ?auto_131701 ) ) ( not ( = ?auto_131697 ?auto_131701 ) ) ( not ( = ?auto_131698 ?auto_131701 ) ) ( not ( = ?auto_131699 ?auto_131701 ) ) ( not ( = ?auto_131703 ?auto_131701 ) ) ( not ( = ?auto_131700 ?auto_131701 ) ) ( not ( = ?auto_131702 ?auto_131701 ) ) ( ON ?auto_131700 ?auto_131702 ) ( ON-TABLE ?auto_131701 ) ( ON ?auto_131703 ?auto_131700 ) ( ON ?auto_131699 ?auto_131703 ) ( ON ?auto_131698 ?auto_131699 ) ( ON ?auto_131697 ?auto_131698 ) ( CLEAR ?auto_131697 ) ( HOLDING ?auto_131696 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_131696 )
      ( MAKE-3PILE ?auto_131696 ?auto_131697 ?auto_131698 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_131704 - BLOCK
      ?auto_131705 - BLOCK
      ?auto_131706 - BLOCK
    )
    :vars
    (
      ?auto_131710 - BLOCK
      ?auto_131707 - BLOCK
      ?auto_131711 - BLOCK
      ?auto_131708 - BLOCK
      ?auto_131709 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131704 ?auto_131705 ) ) ( not ( = ?auto_131704 ?auto_131706 ) ) ( not ( = ?auto_131704 ?auto_131710 ) ) ( not ( = ?auto_131705 ?auto_131706 ) ) ( not ( = ?auto_131705 ?auto_131710 ) ) ( not ( = ?auto_131706 ?auto_131710 ) ) ( not ( = ?auto_131704 ?auto_131707 ) ) ( not ( = ?auto_131704 ?auto_131711 ) ) ( not ( = ?auto_131705 ?auto_131707 ) ) ( not ( = ?auto_131705 ?auto_131711 ) ) ( not ( = ?auto_131706 ?auto_131707 ) ) ( not ( = ?auto_131706 ?auto_131711 ) ) ( not ( = ?auto_131710 ?auto_131707 ) ) ( not ( = ?auto_131710 ?auto_131711 ) ) ( not ( = ?auto_131707 ?auto_131711 ) ) ( not ( = ?auto_131708 ?auto_131711 ) ) ( not ( = ?auto_131704 ?auto_131708 ) ) ( not ( = ?auto_131705 ?auto_131708 ) ) ( not ( = ?auto_131706 ?auto_131708 ) ) ( not ( = ?auto_131710 ?auto_131708 ) ) ( not ( = ?auto_131707 ?auto_131708 ) ) ( ON ?auto_131708 ?auto_131709 ) ( not ( = ?auto_131704 ?auto_131709 ) ) ( not ( = ?auto_131705 ?auto_131709 ) ) ( not ( = ?auto_131706 ?auto_131709 ) ) ( not ( = ?auto_131710 ?auto_131709 ) ) ( not ( = ?auto_131707 ?auto_131709 ) ) ( not ( = ?auto_131711 ?auto_131709 ) ) ( not ( = ?auto_131708 ?auto_131709 ) ) ( ON ?auto_131711 ?auto_131708 ) ( ON-TABLE ?auto_131709 ) ( ON ?auto_131707 ?auto_131711 ) ( ON ?auto_131710 ?auto_131707 ) ( ON ?auto_131706 ?auto_131710 ) ( ON ?auto_131705 ?auto_131706 ) ( ON ?auto_131704 ?auto_131705 ) ( CLEAR ?auto_131704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_131709 ?auto_131708 ?auto_131711 ?auto_131707 ?auto_131710 ?auto_131706 ?auto_131705 )
      ( MAKE-3PILE ?auto_131704 ?auto_131705 ?auto_131706 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_131716 - BLOCK
      ?auto_131717 - BLOCK
      ?auto_131718 - BLOCK
      ?auto_131719 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_131719 ) ( CLEAR ?auto_131718 ) ( ON-TABLE ?auto_131716 ) ( ON ?auto_131717 ?auto_131716 ) ( ON ?auto_131718 ?auto_131717 ) ( not ( = ?auto_131716 ?auto_131717 ) ) ( not ( = ?auto_131716 ?auto_131718 ) ) ( not ( = ?auto_131716 ?auto_131719 ) ) ( not ( = ?auto_131717 ?auto_131718 ) ) ( not ( = ?auto_131717 ?auto_131719 ) ) ( not ( = ?auto_131718 ?auto_131719 ) ) )
    :subtasks
    ( ( !STACK ?auto_131719 ?auto_131718 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_131720 - BLOCK
      ?auto_131721 - BLOCK
      ?auto_131722 - BLOCK
      ?auto_131723 - BLOCK
    )
    :vars
    (
      ?auto_131724 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_131722 ) ( ON-TABLE ?auto_131720 ) ( ON ?auto_131721 ?auto_131720 ) ( ON ?auto_131722 ?auto_131721 ) ( not ( = ?auto_131720 ?auto_131721 ) ) ( not ( = ?auto_131720 ?auto_131722 ) ) ( not ( = ?auto_131720 ?auto_131723 ) ) ( not ( = ?auto_131721 ?auto_131722 ) ) ( not ( = ?auto_131721 ?auto_131723 ) ) ( not ( = ?auto_131722 ?auto_131723 ) ) ( ON ?auto_131723 ?auto_131724 ) ( CLEAR ?auto_131723 ) ( HAND-EMPTY ) ( not ( = ?auto_131720 ?auto_131724 ) ) ( not ( = ?auto_131721 ?auto_131724 ) ) ( not ( = ?auto_131722 ?auto_131724 ) ) ( not ( = ?auto_131723 ?auto_131724 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_131723 ?auto_131724 )
      ( MAKE-4PILE ?auto_131720 ?auto_131721 ?auto_131722 ?auto_131723 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_131725 - BLOCK
      ?auto_131726 - BLOCK
      ?auto_131727 - BLOCK
      ?auto_131728 - BLOCK
    )
    :vars
    (
      ?auto_131729 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131725 ) ( ON ?auto_131726 ?auto_131725 ) ( not ( = ?auto_131725 ?auto_131726 ) ) ( not ( = ?auto_131725 ?auto_131727 ) ) ( not ( = ?auto_131725 ?auto_131728 ) ) ( not ( = ?auto_131726 ?auto_131727 ) ) ( not ( = ?auto_131726 ?auto_131728 ) ) ( not ( = ?auto_131727 ?auto_131728 ) ) ( ON ?auto_131728 ?auto_131729 ) ( CLEAR ?auto_131728 ) ( not ( = ?auto_131725 ?auto_131729 ) ) ( not ( = ?auto_131726 ?auto_131729 ) ) ( not ( = ?auto_131727 ?auto_131729 ) ) ( not ( = ?auto_131728 ?auto_131729 ) ) ( HOLDING ?auto_131727 ) ( CLEAR ?auto_131726 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_131725 ?auto_131726 ?auto_131727 )
      ( MAKE-4PILE ?auto_131725 ?auto_131726 ?auto_131727 ?auto_131728 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_131730 - BLOCK
      ?auto_131731 - BLOCK
      ?auto_131732 - BLOCK
      ?auto_131733 - BLOCK
    )
    :vars
    (
      ?auto_131734 - BLOCK
      ?auto_131736 - BLOCK
      ?auto_131735 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131730 ) ( ON ?auto_131731 ?auto_131730 ) ( not ( = ?auto_131730 ?auto_131731 ) ) ( not ( = ?auto_131730 ?auto_131732 ) ) ( not ( = ?auto_131730 ?auto_131733 ) ) ( not ( = ?auto_131731 ?auto_131732 ) ) ( not ( = ?auto_131731 ?auto_131733 ) ) ( not ( = ?auto_131732 ?auto_131733 ) ) ( ON ?auto_131733 ?auto_131734 ) ( not ( = ?auto_131730 ?auto_131734 ) ) ( not ( = ?auto_131731 ?auto_131734 ) ) ( not ( = ?auto_131732 ?auto_131734 ) ) ( not ( = ?auto_131733 ?auto_131734 ) ) ( CLEAR ?auto_131731 ) ( ON ?auto_131732 ?auto_131733 ) ( CLEAR ?auto_131732 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_131736 ) ( ON ?auto_131735 ?auto_131736 ) ( ON ?auto_131734 ?auto_131735 ) ( not ( = ?auto_131736 ?auto_131735 ) ) ( not ( = ?auto_131736 ?auto_131734 ) ) ( not ( = ?auto_131736 ?auto_131733 ) ) ( not ( = ?auto_131736 ?auto_131732 ) ) ( not ( = ?auto_131735 ?auto_131734 ) ) ( not ( = ?auto_131735 ?auto_131733 ) ) ( not ( = ?auto_131735 ?auto_131732 ) ) ( not ( = ?auto_131730 ?auto_131736 ) ) ( not ( = ?auto_131730 ?auto_131735 ) ) ( not ( = ?auto_131731 ?auto_131736 ) ) ( not ( = ?auto_131731 ?auto_131735 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_131736 ?auto_131735 ?auto_131734 ?auto_131733 )
      ( MAKE-4PILE ?auto_131730 ?auto_131731 ?auto_131732 ?auto_131733 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_131737 - BLOCK
      ?auto_131738 - BLOCK
      ?auto_131739 - BLOCK
      ?auto_131740 - BLOCK
    )
    :vars
    (
      ?auto_131743 - BLOCK
      ?auto_131741 - BLOCK
      ?auto_131742 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131737 ) ( not ( = ?auto_131737 ?auto_131738 ) ) ( not ( = ?auto_131737 ?auto_131739 ) ) ( not ( = ?auto_131737 ?auto_131740 ) ) ( not ( = ?auto_131738 ?auto_131739 ) ) ( not ( = ?auto_131738 ?auto_131740 ) ) ( not ( = ?auto_131739 ?auto_131740 ) ) ( ON ?auto_131740 ?auto_131743 ) ( not ( = ?auto_131737 ?auto_131743 ) ) ( not ( = ?auto_131738 ?auto_131743 ) ) ( not ( = ?auto_131739 ?auto_131743 ) ) ( not ( = ?auto_131740 ?auto_131743 ) ) ( ON ?auto_131739 ?auto_131740 ) ( CLEAR ?auto_131739 ) ( ON-TABLE ?auto_131741 ) ( ON ?auto_131742 ?auto_131741 ) ( ON ?auto_131743 ?auto_131742 ) ( not ( = ?auto_131741 ?auto_131742 ) ) ( not ( = ?auto_131741 ?auto_131743 ) ) ( not ( = ?auto_131741 ?auto_131740 ) ) ( not ( = ?auto_131741 ?auto_131739 ) ) ( not ( = ?auto_131742 ?auto_131743 ) ) ( not ( = ?auto_131742 ?auto_131740 ) ) ( not ( = ?auto_131742 ?auto_131739 ) ) ( not ( = ?auto_131737 ?auto_131741 ) ) ( not ( = ?auto_131737 ?auto_131742 ) ) ( not ( = ?auto_131738 ?auto_131741 ) ) ( not ( = ?auto_131738 ?auto_131742 ) ) ( HOLDING ?auto_131738 ) ( CLEAR ?auto_131737 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_131737 ?auto_131738 )
      ( MAKE-4PILE ?auto_131737 ?auto_131738 ?auto_131739 ?auto_131740 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_131744 - BLOCK
      ?auto_131745 - BLOCK
      ?auto_131746 - BLOCK
      ?auto_131747 - BLOCK
    )
    :vars
    (
      ?auto_131748 - BLOCK
      ?auto_131749 - BLOCK
      ?auto_131750 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131744 ) ( not ( = ?auto_131744 ?auto_131745 ) ) ( not ( = ?auto_131744 ?auto_131746 ) ) ( not ( = ?auto_131744 ?auto_131747 ) ) ( not ( = ?auto_131745 ?auto_131746 ) ) ( not ( = ?auto_131745 ?auto_131747 ) ) ( not ( = ?auto_131746 ?auto_131747 ) ) ( ON ?auto_131747 ?auto_131748 ) ( not ( = ?auto_131744 ?auto_131748 ) ) ( not ( = ?auto_131745 ?auto_131748 ) ) ( not ( = ?auto_131746 ?auto_131748 ) ) ( not ( = ?auto_131747 ?auto_131748 ) ) ( ON ?auto_131746 ?auto_131747 ) ( ON-TABLE ?auto_131749 ) ( ON ?auto_131750 ?auto_131749 ) ( ON ?auto_131748 ?auto_131750 ) ( not ( = ?auto_131749 ?auto_131750 ) ) ( not ( = ?auto_131749 ?auto_131748 ) ) ( not ( = ?auto_131749 ?auto_131747 ) ) ( not ( = ?auto_131749 ?auto_131746 ) ) ( not ( = ?auto_131750 ?auto_131748 ) ) ( not ( = ?auto_131750 ?auto_131747 ) ) ( not ( = ?auto_131750 ?auto_131746 ) ) ( not ( = ?auto_131744 ?auto_131749 ) ) ( not ( = ?auto_131744 ?auto_131750 ) ) ( not ( = ?auto_131745 ?auto_131749 ) ) ( not ( = ?auto_131745 ?auto_131750 ) ) ( CLEAR ?auto_131744 ) ( ON ?auto_131745 ?auto_131746 ) ( CLEAR ?auto_131745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_131749 ?auto_131750 ?auto_131748 ?auto_131747 ?auto_131746 )
      ( MAKE-4PILE ?auto_131744 ?auto_131745 ?auto_131746 ?auto_131747 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_131751 - BLOCK
      ?auto_131752 - BLOCK
      ?auto_131753 - BLOCK
      ?auto_131754 - BLOCK
    )
    :vars
    (
      ?auto_131756 - BLOCK
      ?auto_131755 - BLOCK
      ?auto_131757 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131751 ?auto_131752 ) ) ( not ( = ?auto_131751 ?auto_131753 ) ) ( not ( = ?auto_131751 ?auto_131754 ) ) ( not ( = ?auto_131752 ?auto_131753 ) ) ( not ( = ?auto_131752 ?auto_131754 ) ) ( not ( = ?auto_131753 ?auto_131754 ) ) ( ON ?auto_131754 ?auto_131756 ) ( not ( = ?auto_131751 ?auto_131756 ) ) ( not ( = ?auto_131752 ?auto_131756 ) ) ( not ( = ?auto_131753 ?auto_131756 ) ) ( not ( = ?auto_131754 ?auto_131756 ) ) ( ON ?auto_131753 ?auto_131754 ) ( ON-TABLE ?auto_131755 ) ( ON ?auto_131757 ?auto_131755 ) ( ON ?auto_131756 ?auto_131757 ) ( not ( = ?auto_131755 ?auto_131757 ) ) ( not ( = ?auto_131755 ?auto_131756 ) ) ( not ( = ?auto_131755 ?auto_131754 ) ) ( not ( = ?auto_131755 ?auto_131753 ) ) ( not ( = ?auto_131757 ?auto_131756 ) ) ( not ( = ?auto_131757 ?auto_131754 ) ) ( not ( = ?auto_131757 ?auto_131753 ) ) ( not ( = ?auto_131751 ?auto_131755 ) ) ( not ( = ?auto_131751 ?auto_131757 ) ) ( not ( = ?auto_131752 ?auto_131755 ) ) ( not ( = ?auto_131752 ?auto_131757 ) ) ( ON ?auto_131752 ?auto_131753 ) ( CLEAR ?auto_131752 ) ( HOLDING ?auto_131751 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_131751 )
      ( MAKE-4PILE ?auto_131751 ?auto_131752 ?auto_131753 ?auto_131754 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_131758 - BLOCK
      ?auto_131759 - BLOCK
      ?auto_131760 - BLOCK
      ?auto_131761 - BLOCK
    )
    :vars
    (
      ?auto_131764 - BLOCK
      ?auto_131762 - BLOCK
      ?auto_131763 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131758 ?auto_131759 ) ) ( not ( = ?auto_131758 ?auto_131760 ) ) ( not ( = ?auto_131758 ?auto_131761 ) ) ( not ( = ?auto_131759 ?auto_131760 ) ) ( not ( = ?auto_131759 ?auto_131761 ) ) ( not ( = ?auto_131760 ?auto_131761 ) ) ( ON ?auto_131761 ?auto_131764 ) ( not ( = ?auto_131758 ?auto_131764 ) ) ( not ( = ?auto_131759 ?auto_131764 ) ) ( not ( = ?auto_131760 ?auto_131764 ) ) ( not ( = ?auto_131761 ?auto_131764 ) ) ( ON ?auto_131760 ?auto_131761 ) ( ON-TABLE ?auto_131762 ) ( ON ?auto_131763 ?auto_131762 ) ( ON ?auto_131764 ?auto_131763 ) ( not ( = ?auto_131762 ?auto_131763 ) ) ( not ( = ?auto_131762 ?auto_131764 ) ) ( not ( = ?auto_131762 ?auto_131761 ) ) ( not ( = ?auto_131762 ?auto_131760 ) ) ( not ( = ?auto_131763 ?auto_131764 ) ) ( not ( = ?auto_131763 ?auto_131761 ) ) ( not ( = ?auto_131763 ?auto_131760 ) ) ( not ( = ?auto_131758 ?auto_131762 ) ) ( not ( = ?auto_131758 ?auto_131763 ) ) ( not ( = ?auto_131759 ?auto_131762 ) ) ( not ( = ?auto_131759 ?auto_131763 ) ) ( ON ?auto_131759 ?auto_131760 ) ( ON ?auto_131758 ?auto_131759 ) ( CLEAR ?auto_131758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_131762 ?auto_131763 ?auto_131764 ?auto_131761 ?auto_131760 ?auto_131759 )
      ( MAKE-4PILE ?auto_131758 ?auto_131759 ?auto_131760 ?auto_131761 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_131765 - BLOCK
      ?auto_131766 - BLOCK
      ?auto_131767 - BLOCK
      ?auto_131768 - BLOCK
    )
    :vars
    (
      ?auto_131769 - BLOCK
      ?auto_131770 - BLOCK
      ?auto_131771 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131765 ?auto_131766 ) ) ( not ( = ?auto_131765 ?auto_131767 ) ) ( not ( = ?auto_131765 ?auto_131768 ) ) ( not ( = ?auto_131766 ?auto_131767 ) ) ( not ( = ?auto_131766 ?auto_131768 ) ) ( not ( = ?auto_131767 ?auto_131768 ) ) ( ON ?auto_131768 ?auto_131769 ) ( not ( = ?auto_131765 ?auto_131769 ) ) ( not ( = ?auto_131766 ?auto_131769 ) ) ( not ( = ?auto_131767 ?auto_131769 ) ) ( not ( = ?auto_131768 ?auto_131769 ) ) ( ON ?auto_131767 ?auto_131768 ) ( ON-TABLE ?auto_131770 ) ( ON ?auto_131771 ?auto_131770 ) ( ON ?auto_131769 ?auto_131771 ) ( not ( = ?auto_131770 ?auto_131771 ) ) ( not ( = ?auto_131770 ?auto_131769 ) ) ( not ( = ?auto_131770 ?auto_131768 ) ) ( not ( = ?auto_131770 ?auto_131767 ) ) ( not ( = ?auto_131771 ?auto_131769 ) ) ( not ( = ?auto_131771 ?auto_131768 ) ) ( not ( = ?auto_131771 ?auto_131767 ) ) ( not ( = ?auto_131765 ?auto_131770 ) ) ( not ( = ?auto_131765 ?auto_131771 ) ) ( not ( = ?auto_131766 ?auto_131770 ) ) ( not ( = ?auto_131766 ?auto_131771 ) ) ( ON ?auto_131766 ?auto_131767 ) ( HOLDING ?auto_131765 ) ( CLEAR ?auto_131766 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_131770 ?auto_131771 ?auto_131769 ?auto_131768 ?auto_131767 ?auto_131766 ?auto_131765 )
      ( MAKE-4PILE ?auto_131765 ?auto_131766 ?auto_131767 ?auto_131768 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_131772 - BLOCK
      ?auto_131773 - BLOCK
      ?auto_131774 - BLOCK
      ?auto_131775 - BLOCK
    )
    :vars
    (
      ?auto_131776 - BLOCK
      ?auto_131778 - BLOCK
      ?auto_131777 - BLOCK
      ?auto_131779 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131772 ?auto_131773 ) ) ( not ( = ?auto_131772 ?auto_131774 ) ) ( not ( = ?auto_131772 ?auto_131775 ) ) ( not ( = ?auto_131773 ?auto_131774 ) ) ( not ( = ?auto_131773 ?auto_131775 ) ) ( not ( = ?auto_131774 ?auto_131775 ) ) ( ON ?auto_131775 ?auto_131776 ) ( not ( = ?auto_131772 ?auto_131776 ) ) ( not ( = ?auto_131773 ?auto_131776 ) ) ( not ( = ?auto_131774 ?auto_131776 ) ) ( not ( = ?auto_131775 ?auto_131776 ) ) ( ON ?auto_131774 ?auto_131775 ) ( ON-TABLE ?auto_131778 ) ( ON ?auto_131777 ?auto_131778 ) ( ON ?auto_131776 ?auto_131777 ) ( not ( = ?auto_131778 ?auto_131777 ) ) ( not ( = ?auto_131778 ?auto_131776 ) ) ( not ( = ?auto_131778 ?auto_131775 ) ) ( not ( = ?auto_131778 ?auto_131774 ) ) ( not ( = ?auto_131777 ?auto_131776 ) ) ( not ( = ?auto_131777 ?auto_131775 ) ) ( not ( = ?auto_131777 ?auto_131774 ) ) ( not ( = ?auto_131772 ?auto_131778 ) ) ( not ( = ?auto_131772 ?auto_131777 ) ) ( not ( = ?auto_131773 ?auto_131778 ) ) ( not ( = ?auto_131773 ?auto_131777 ) ) ( ON ?auto_131773 ?auto_131774 ) ( CLEAR ?auto_131773 ) ( ON ?auto_131772 ?auto_131779 ) ( CLEAR ?auto_131772 ) ( HAND-EMPTY ) ( not ( = ?auto_131772 ?auto_131779 ) ) ( not ( = ?auto_131773 ?auto_131779 ) ) ( not ( = ?auto_131774 ?auto_131779 ) ) ( not ( = ?auto_131775 ?auto_131779 ) ) ( not ( = ?auto_131776 ?auto_131779 ) ) ( not ( = ?auto_131778 ?auto_131779 ) ) ( not ( = ?auto_131777 ?auto_131779 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_131772 ?auto_131779 )
      ( MAKE-4PILE ?auto_131772 ?auto_131773 ?auto_131774 ?auto_131775 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_131780 - BLOCK
      ?auto_131781 - BLOCK
      ?auto_131782 - BLOCK
      ?auto_131783 - BLOCK
    )
    :vars
    (
      ?auto_131787 - BLOCK
      ?auto_131785 - BLOCK
      ?auto_131786 - BLOCK
      ?auto_131784 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131780 ?auto_131781 ) ) ( not ( = ?auto_131780 ?auto_131782 ) ) ( not ( = ?auto_131780 ?auto_131783 ) ) ( not ( = ?auto_131781 ?auto_131782 ) ) ( not ( = ?auto_131781 ?auto_131783 ) ) ( not ( = ?auto_131782 ?auto_131783 ) ) ( ON ?auto_131783 ?auto_131787 ) ( not ( = ?auto_131780 ?auto_131787 ) ) ( not ( = ?auto_131781 ?auto_131787 ) ) ( not ( = ?auto_131782 ?auto_131787 ) ) ( not ( = ?auto_131783 ?auto_131787 ) ) ( ON ?auto_131782 ?auto_131783 ) ( ON-TABLE ?auto_131785 ) ( ON ?auto_131786 ?auto_131785 ) ( ON ?auto_131787 ?auto_131786 ) ( not ( = ?auto_131785 ?auto_131786 ) ) ( not ( = ?auto_131785 ?auto_131787 ) ) ( not ( = ?auto_131785 ?auto_131783 ) ) ( not ( = ?auto_131785 ?auto_131782 ) ) ( not ( = ?auto_131786 ?auto_131787 ) ) ( not ( = ?auto_131786 ?auto_131783 ) ) ( not ( = ?auto_131786 ?auto_131782 ) ) ( not ( = ?auto_131780 ?auto_131785 ) ) ( not ( = ?auto_131780 ?auto_131786 ) ) ( not ( = ?auto_131781 ?auto_131785 ) ) ( not ( = ?auto_131781 ?auto_131786 ) ) ( ON ?auto_131780 ?auto_131784 ) ( CLEAR ?auto_131780 ) ( not ( = ?auto_131780 ?auto_131784 ) ) ( not ( = ?auto_131781 ?auto_131784 ) ) ( not ( = ?auto_131782 ?auto_131784 ) ) ( not ( = ?auto_131783 ?auto_131784 ) ) ( not ( = ?auto_131787 ?auto_131784 ) ) ( not ( = ?auto_131785 ?auto_131784 ) ) ( not ( = ?auto_131786 ?auto_131784 ) ) ( HOLDING ?auto_131781 ) ( CLEAR ?auto_131782 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_131785 ?auto_131786 ?auto_131787 ?auto_131783 ?auto_131782 ?auto_131781 )
      ( MAKE-4PILE ?auto_131780 ?auto_131781 ?auto_131782 ?auto_131783 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_131788 - BLOCK
      ?auto_131789 - BLOCK
      ?auto_131790 - BLOCK
      ?auto_131791 - BLOCK
    )
    :vars
    (
      ?auto_131792 - BLOCK
      ?auto_131793 - BLOCK
      ?auto_131794 - BLOCK
      ?auto_131795 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131788 ?auto_131789 ) ) ( not ( = ?auto_131788 ?auto_131790 ) ) ( not ( = ?auto_131788 ?auto_131791 ) ) ( not ( = ?auto_131789 ?auto_131790 ) ) ( not ( = ?auto_131789 ?auto_131791 ) ) ( not ( = ?auto_131790 ?auto_131791 ) ) ( ON ?auto_131791 ?auto_131792 ) ( not ( = ?auto_131788 ?auto_131792 ) ) ( not ( = ?auto_131789 ?auto_131792 ) ) ( not ( = ?auto_131790 ?auto_131792 ) ) ( not ( = ?auto_131791 ?auto_131792 ) ) ( ON ?auto_131790 ?auto_131791 ) ( ON-TABLE ?auto_131793 ) ( ON ?auto_131794 ?auto_131793 ) ( ON ?auto_131792 ?auto_131794 ) ( not ( = ?auto_131793 ?auto_131794 ) ) ( not ( = ?auto_131793 ?auto_131792 ) ) ( not ( = ?auto_131793 ?auto_131791 ) ) ( not ( = ?auto_131793 ?auto_131790 ) ) ( not ( = ?auto_131794 ?auto_131792 ) ) ( not ( = ?auto_131794 ?auto_131791 ) ) ( not ( = ?auto_131794 ?auto_131790 ) ) ( not ( = ?auto_131788 ?auto_131793 ) ) ( not ( = ?auto_131788 ?auto_131794 ) ) ( not ( = ?auto_131789 ?auto_131793 ) ) ( not ( = ?auto_131789 ?auto_131794 ) ) ( ON ?auto_131788 ?auto_131795 ) ( not ( = ?auto_131788 ?auto_131795 ) ) ( not ( = ?auto_131789 ?auto_131795 ) ) ( not ( = ?auto_131790 ?auto_131795 ) ) ( not ( = ?auto_131791 ?auto_131795 ) ) ( not ( = ?auto_131792 ?auto_131795 ) ) ( not ( = ?auto_131793 ?auto_131795 ) ) ( not ( = ?auto_131794 ?auto_131795 ) ) ( CLEAR ?auto_131790 ) ( ON ?auto_131789 ?auto_131788 ) ( CLEAR ?auto_131789 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_131795 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_131795 ?auto_131788 )
      ( MAKE-4PILE ?auto_131788 ?auto_131789 ?auto_131790 ?auto_131791 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_131796 - BLOCK
      ?auto_131797 - BLOCK
      ?auto_131798 - BLOCK
      ?auto_131799 - BLOCK
    )
    :vars
    (
      ?auto_131802 - BLOCK
      ?auto_131803 - BLOCK
      ?auto_131800 - BLOCK
      ?auto_131801 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131796 ?auto_131797 ) ) ( not ( = ?auto_131796 ?auto_131798 ) ) ( not ( = ?auto_131796 ?auto_131799 ) ) ( not ( = ?auto_131797 ?auto_131798 ) ) ( not ( = ?auto_131797 ?auto_131799 ) ) ( not ( = ?auto_131798 ?auto_131799 ) ) ( ON ?auto_131799 ?auto_131802 ) ( not ( = ?auto_131796 ?auto_131802 ) ) ( not ( = ?auto_131797 ?auto_131802 ) ) ( not ( = ?auto_131798 ?auto_131802 ) ) ( not ( = ?auto_131799 ?auto_131802 ) ) ( ON-TABLE ?auto_131803 ) ( ON ?auto_131800 ?auto_131803 ) ( ON ?auto_131802 ?auto_131800 ) ( not ( = ?auto_131803 ?auto_131800 ) ) ( not ( = ?auto_131803 ?auto_131802 ) ) ( not ( = ?auto_131803 ?auto_131799 ) ) ( not ( = ?auto_131803 ?auto_131798 ) ) ( not ( = ?auto_131800 ?auto_131802 ) ) ( not ( = ?auto_131800 ?auto_131799 ) ) ( not ( = ?auto_131800 ?auto_131798 ) ) ( not ( = ?auto_131796 ?auto_131803 ) ) ( not ( = ?auto_131796 ?auto_131800 ) ) ( not ( = ?auto_131797 ?auto_131803 ) ) ( not ( = ?auto_131797 ?auto_131800 ) ) ( ON ?auto_131796 ?auto_131801 ) ( not ( = ?auto_131796 ?auto_131801 ) ) ( not ( = ?auto_131797 ?auto_131801 ) ) ( not ( = ?auto_131798 ?auto_131801 ) ) ( not ( = ?auto_131799 ?auto_131801 ) ) ( not ( = ?auto_131802 ?auto_131801 ) ) ( not ( = ?auto_131803 ?auto_131801 ) ) ( not ( = ?auto_131800 ?auto_131801 ) ) ( ON ?auto_131797 ?auto_131796 ) ( CLEAR ?auto_131797 ) ( ON-TABLE ?auto_131801 ) ( HOLDING ?auto_131798 ) ( CLEAR ?auto_131799 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_131803 ?auto_131800 ?auto_131802 ?auto_131799 ?auto_131798 )
      ( MAKE-4PILE ?auto_131796 ?auto_131797 ?auto_131798 ?auto_131799 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_131804 - BLOCK
      ?auto_131805 - BLOCK
      ?auto_131806 - BLOCK
      ?auto_131807 - BLOCK
    )
    :vars
    (
      ?auto_131809 - BLOCK
      ?auto_131808 - BLOCK
      ?auto_131810 - BLOCK
      ?auto_131811 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131804 ?auto_131805 ) ) ( not ( = ?auto_131804 ?auto_131806 ) ) ( not ( = ?auto_131804 ?auto_131807 ) ) ( not ( = ?auto_131805 ?auto_131806 ) ) ( not ( = ?auto_131805 ?auto_131807 ) ) ( not ( = ?auto_131806 ?auto_131807 ) ) ( ON ?auto_131807 ?auto_131809 ) ( not ( = ?auto_131804 ?auto_131809 ) ) ( not ( = ?auto_131805 ?auto_131809 ) ) ( not ( = ?auto_131806 ?auto_131809 ) ) ( not ( = ?auto_131807 ?auto_131809 ) ) ( ON-TABLE ?auto_131808 ) ( ON ?auto_131810 ?auto_131808 ) ( ON ?auto_131809 ?auto_131810 ) ( not ( = ?auto_131808 ?auto_131810 ) ) ( not ( = ?auto_131808 ?auto_131809 ) ) ( not ( = ?auto_131808 ?auto_131807 ) ) ( not ( = ?auto_131808 ?auto_131806 ) ) ( not ( = ?auto_131810 ?auto_131809 ) ) ( not ( = ?auto_131810 ?auto_131807 ) ) ( not ( = ?auto_131810 ?auto_131806 ) ) ( not ( = ?auto_131804 ?auto_131808 ) ) ( not ( = ?auto_131804 ?auto_131810 ) ) ( not ( = ?auto_131805 ?auto_131808 ) ) ( not ( = ?auto_131805 ?auto_131810 ) ) ( ON ?auto_131804 ?auto_131811 ) ( not ( = ?auto_131804 ?auto_131811 ) ) ( not ( = ?auto_131805 ?auto_131811 ) ) ( not ( = ?auto_131806 ?auto_131811 ) ) ( not ( = ?auto_131807 ?auto_131811 ) ) ( not ( = ?auto_131809 ?auto_131811 ) ) ( not ( = ?auto_131808 ?auto_131811 ) ) ( not ( = ?auto_131810 ?auto_131811 ) ) ( ON ?auto_131805 ?auto_131804 ) ( ON-TABLE ?auto_131811 ) ( CLEAR ?auto_131807 ) ( ON ?auto_131806 ?auto_131805 ) ( CLEAR ?auto_131806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_131811 ?auto_131804 ?auto_131805 )
      ( MAKE-4PILE ?auto_131804 ?auto_131805 ?auto_131806 ?auto_131807 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_131812 - BLOCK
      ?auto_131813 - BLOCK
      ?auto_131814 - BLOCK
      ?auto_131815 - BLOCK
    )
    :vars
    (
      ?auto_131816 - BLOCK
      ?auto_131819 - BLOCK
      ?auto_131818 - BLOCK
      ?auto_131817 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131812 ?auto_131813 ) ) ( not ( = ?auto_131812 ?auto_131814 ) ) ( not ( = ?auto_131812 ?auto_131815 ) ) ( not ( = ?auto_131813 ?auto_131814 ) ) ( not ( = ?auto_131813 ?auto_131815 ) ) ( not ( = ?auto_131814 ?auto_131815 ) ) ( not ( = ?auto_131812 ?auto_131816 ) ) ( not ( = ?auto_131813 ?auto_131816 ) ) ( not ( = ?auto_131814 ?auto_131816 ) ) ( not ( = ?auto_131815 ?auto_131816 ) ) ( ON-TABLE ?auto_131819 ) ( ON ?auto_131818 ?auto_131819 ) ( ON ?auto_131816 ?auto_131818 ) ( not ( = ?auto_131819 ?auto_131818 ) ) ( not ( = ?auto_131819 ?auto_131816 ) ) ( not ( = ?auto_131819 ?auto_131815 ) ) ( not ( = ?auto_131819 ?auto_131814 ) ) ( not ( = ?auto_131818 ?auto_131816 ) ) ( not ( = ?auto_131818 ?auto_131815 ) ) ( not ( = ?auto_131818 ?auto_131814 ) ) ( not ( = ?auto_131812 ?auto_131819 ) ) ( not ( = ?auto_131812 ?auto_131818 ) ) ( not ( = ?auto_131813 ?auto_131819 ) ) ( not ( = ?auto_131813 ?auto_131818 ) ) ( ON ?auto_131812 ?auto_131817 ) ( not ( = ?auto_131812 ?auto_131817 ) ) ( not ( = ?auto_131813 ?auto_131817 ) ) ( not ( = ?auto_131814 ?auto_131817 ) ) ( not ( = ?auto_131815 ?auto_131817 ) ) ( not ( = ?auto_131816 ?auto_131817 ) ) ( not ( = ?auto_131819 ?auto_131817 ) ) ( not ( = ?auto_131818 ?auto_131817 ) ) ( ON ?auto_131813 ?auto_131812 ) ( ON-TABLE ?auto_131817 ) ( ON ?auto_131814 ?auto_131813 ) ( CLEAR ?auto_131814 ) ( HOLDING ?auto_131815 ) ( CLEAR ?auto_131816 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_131819 ?auto_131818 ?auto_131816 ?auto_131815 )
      ( MAKE-4PILE ?auto_131812 ?auto_131813 ?auto_131814 ?auto_131815 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_131820 - BLOCK
      ?auto_131821 - BLOCK
      ?auto_131822 - BLOCK
      ?auto_131823 - BLOCK
    )
    :vars
    (
      ?auto_131825 - BLOCK
      ?auto_131824 - BLOCK
      ?auto_131826 - BLOCK
      ?auto_131827 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131820 ?auto_131821 ) ) ( not ( = ?auto_131820 ?auto_131822 ) ) ( not ( = ?auto_131820 ?auto_131823 ) ) ( not ( = ?auto_131821 ?auto_131822 ) ) ( not ( = ?auto_131821 ?auto_131823 ) ) ( not ( = ?auto_131822 ?auto_131823 ) ) ( not ( = ?auto_131820 ?auto_131825 ) ) ( not ( = ?auto_131821 ?auto_131825 ) ) ( not ( = ?auto_131822 ?auto_131825 ) ) ( not ( = ?auto_131823 ?auto_131825 ) ) ( ON-TABLE ?auto_131824 ) ( ON ?auto_131826 ?auto_131824 ) ( ON ?auto_131825 ?auto_131826 ) ( not ( = ?auto_131824 ?auto_131826 ) ) ( not ( = ?auto_131824 ?auto_131825 ) ) ( not ( = ?auto_131824 ?auto_131823 ) ) ( not ( = ?auto_131824 ?auto_131822 ) ) ( not ( = ?auto_131826 ?auto_131825 ) ) ( not ( = ?auto_131826 ?auto_131823 ) ) ( not ( = ?auto_131826 ?auto_131822 ) ) ( not ( = ?auto_131820 ?auto_131824 ) ) ( not ( = ?auto_131820 ?auto_131826 ) ) ( not ( = ?auto_131821 ?auto_131824 ) ) ( not ( = ?auto_131821 ?auto_131826 ) ) ( ON ?auto_131820 ?auto_131827 ) ( not ( = ?auto_131820 ?auto_131827 ) ) ( not ( = ?auto_131821 ?auto_131827 ) ) ( not ( = ?auto_131822 ?auto_131827 ) ) ( not ( = ?auto_131823 ?auto_131827 ) ) ( not ( = ?auto_131825 ?auto_131827 ) ) ( not ( = ?auto_131824 ?auto_131827 ) ) ( not ( = ?auto_131826 ?auto_131827 ) ) ( ON ?auto_131821 ?auto_131820 ) ( ON-TABLE ?auto_131827 ) ( ON ?auto_131822 ?auto_131821 ) ( CLEAR ?auto_131825 ) ( ON ?auto_131823 ?auto_131822 ) ( CLEAR ?auto_131823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_131827 ?auto_131820 ?auto_131821 ?auto_131822 )
      ( MAKE-4PILE ?auto_131820 ?auto_131821 ?auto_131822 ?auto_131823 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_131828 - BLOCK
      ?auto_131829 - BLOCK
      ?auto_131830 - BLOCK
      ?auto_131831 - BLOCK
    )
    :vars
    (
      ?auto_131834 - BLOCK
      ?auto_131833 - BLOCK
      ?auto_131835 - BLOCK
      ?auto_131832 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131828 ?auto_131829 ) ) ( not ( = ?auto_131828 ?auto_131830 ) ) ( not ( = ?auto_131828 ?auto_131831 ) ) ( not ( = ?auto_131829 ?auto_131830 ) ) ( not ( = ?auto_131829 ?auto_131831 ) ) ( not ( = ?auto_131830 ?auto_131831 ) ) ( not ( = ?auto_131828 ?auto_131834 ) ) ( not ( = ?auto_131829 ?auto_131834 ) ) ( not ( = ?auto_131830 ?auto_131834 ) ) ( not ( = ?auto_131831 ?auto_131834 ) ) ( ON-TABLE ?auto_131833 ) ( ON ?auto_131835 ?auto_131833 ) ( not ( = ?auto_131833 ?auto_131835 ) ) ( not ( = ?auto_131833 ?auto_131834 ) ) ( not ( = ?auto_131833 ?auto_131831 ) ) ( not ( = ?auto_131833 ?auto_131830 ) ) ( not ( = ?auto_131835 ?auto_131834 ) ) ( not ( = ?auto_131835 ?auto_131831 ) ) ( not ( = ?auto_131835 ?auto_131830 ) ) ( not ( = ?auto_131828 ?auto_131833 ) ) ( not ( = ?auto_131828 ?auto_131835 ) ) ( not ( = ?auto_131829 ?auto_131833 ) ) ( not ( = ?auto_131829 ?auto_131835 ) ) ( ON ?auto_131828 ?auto_131832 ) ( not ( = ?auto_131828 ?auto_131832 ) ) ( not ( = ?auto_131829 ?auto_131832 ) ) ( not ( = ?auto_131830 ?auto_131832 ) ) ( not ( = ?auto_131831 ?auto_131832 ) ) ( not ( = ?auto_131834 ?auto_131832 ) ) ( not ( = ?auto_131833 ?auto_131832 ) ) ( not ( = ?auto_131835 ?auto_131832 ) ) ( ON ?auto_131829 ?auto_131828 ) ( ON-TABLE ?auto_131832 ) ( ON ?auto_131830 ?auto_131829 ) ( ON ?auto_131831 ?auto_131830 ) ( CLEAR ?auto_131831 ) ( HOLDING ?auto_131834 ) ( CLEAR ?auto_131835 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_131833 ?auto_131835 ?auto_131834 )
      ( MAKE-4PILE ?auto_131828 ?auto_131829 ?auto_131830 ?auto_131831 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_131836 - BLOCK
      ?auto_131837 - BLOCK
      ?auto_131838 - BLOCK
      ?auto_131839 - BLOCK
    )
    :vars
    (
      ?auto_131842 - BLOCK
      ?auto_131841 - BLOCK
      ?auto_131843 - BLOCK
      ?auto_131840 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131836 ?auto_131837 ) ) ( not ( = ?auto_131836 ?auto_131838 ) ) ( not ( = ?auto_131836 ?auto_131839 ) ) ( not ( = ?auto_131837 ?auto_131838 ) ) ( not ( = ?auto_131837 ?auto_131839 ) ) ( not ( = ?auto_131838 ?auto_131839 ) ) ( not ( = ?auto_131836 ?auto_131842 ) ) ( not ( = ?auto_131837 ?auto_131842 ) ) ( not ( = ?auto_131838 ?auto_131842 ) ) ( not ( = ?auto_131839 ?auto_131842 ) ) ( ON-TABLE ?auto_131841 ) ( ON ?auto_131843 ?auto_131841 ) ( not ( = ?auto_131841 ?auto_131843 ) ) ( not ( = ?auto_131841 ?auto_131842 ) ) ( not ( = ?auto_131841 ?auto_131839 ) ) ( not ( = ?auto_131841 ?auto_131838 ) ) ( not ( = ?auto_131843 ?auto_131842 ) ) ( not ( = ?auto_131843 ?auto_131839 ) ) ( not ( = ?auto_131843 ?auto_131838 ) ) ( not ( = ?auto_131836 ?auto_131841 ) ) ( not ( = ?auto_131836 ?auto_131843 ) ) ( not ( = ?auto_131837 ?auto_131841 ) ) ( not ( = ?auto_131837 ?auto_131843 ) ) ( ON ?auto_131836 ?auto_131840 ) ( not ( = ?auto_131836 ?auto_131840 ) ) ( not ( = ?auto_131837 ?auto_131840 ) ) ( not ( = ?auto_131838 ?auto_131840 ) ) ( not ( = ?auto_131839 ?auto_131840 ) ) ( not ( = ?auto_131842 ?auto_131840 ) ) ( not ( = ?auto_131841 ?auto_131840 ) ) ( not ( = ?auto_131843 ?auto_131840 ) ) ( ON ?auto_131837 ?auto_131836 ) ( ON-TABLE ?auto_131840 ) ( ON ?auto_131838 ?auto_131837 ) ( ON ?auto_131839 ?auto_131838 ) ( CLEAR ?auto_131843 ) ( ON ?auto_131842 ?auto_131839 ) ( CLEAR ?auto_131842 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_131840 ?auto_131836 ?auto_131837 ?auto_131838 ?auto_131839 )
      ( MAKE-4PILE ?auto_131836 ?auto_131837 ?auto_131838 ?auto_131839 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_131844 - BLOCK
      ?auto_131845 - BLOCK
      ?auto_131846 - BLOCK
      ?auto_131847 - BLOCK
    )
    :vars
    (
      ?auto_131850 - BLOCK
      ?auto_131851 - BLOCK
      ?auto_131849 - BLOCK
      ?auto_131848 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131844 ?auto_131845 ) ) ( not ( = ?auto_131844 ?auto_131846 ) ) ( not ( = ?auto_131844 ?auto_131847 ) ) ( not ( = ?auto_131845 ?auto_131846 ) ) ( not ( = ?auto_131845 ?auto_131847 ) ) ( not ( = ?auto_131846 ?auto_131847 ) ) ( not ( = ?auto_131844 ?auto_131850 ) ) ( not ( = ?auto_131845 ?auto_131850 ) ) ( not ( = ?auto_131846 ?auto_131850 ) ) ( not ( = ?auto_131847 ?auto_131850 ) ) ( ON-TABLE ?auto_131851 ) ( not ( = ?auto_131851 ?auto_131849 ) ) ( not ( = ?auto_131851 ?auto_131850 ) ) ( not ( = ?auto_131851 ?auto_131847 ) ) ( not ( = ?auto_131851 ?auto_131846 ) ) ( not ( = ?auto_131849 ?auto_131850 ) ) ( not ( = ?auto_131849 ?auto_131847 ) ) ( not ( = ?auto_131849 ?auto_131846 ) ) ( not ( = ?auto_131844 ?auto_131851 ) ) ( not ( = ?auto_131844 ?auto_131849 ) ) ( not ( = ?auto_131845 ?auto_131851 ) ) ( not ( = ?auto_131845 ?auto_131849 ) ) ( ON ?auto_131844 ?auto_131848 ) ( not ( = ?auto_131844 ?auto_131848 ) ) ( not ( = ?auto_131845 ?auto_131848 ) ) ( not ( = ?auto_131846 ?auto_131848 ) ) ( not ( = ?auto_131847 ?auto_131848 ) ) ( not ( = ?auto_131850 ?auto_131848 ) ) ( not ( = ?auto_131851 ?auto_131848 ) ) ( not ( = ?auto_131849 ?auto_131848 ) ) ( ON ?auto_131845 ?auto_131844 ) ( ON-TABLE ?auto_131848 ) ( ON ?auto_131846 ?auto_131845 ) ( ON ?auto_131847 ?auto_131846 ) ( ON ?auto_131850 ?auto_131847 ) ( CLEAR ?auto_131850 ) ( HOLDING ?auto_131849 ) ( CLEAR ?auto_131851 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_131851 ?auto_131849 )
      ( MAKE-4PILE ?auto_131844 ?auto_131845 ?auto_131846 ?auto_131847 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_131852 - BLOCK
      ?auto_131853 - BLOCK
      ?auto_131854 - BLOCK
      ?auto_131855 - BLOCK
    )
    :vars
    (
      ?auto_131856 - BLOCK
      ?auto_131858 - BLOCK
      ?auto_131859 - BLOCK
      ?auto_131857 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131852 ?auto_131853 ) ) ( not ( = ?auto_131852 ?auto_131854 ) ) ( not ( = ?auto_131852 ?auto_131855 ) ) ( not ( = ?auto_131853 ?auto_131854 ) ) ( not ( = ?auto_131853 ?auto_131855 ) ) ( not ( = ?auto_131854 ?auto_131855 ) ) ( not ( = ?auto_131852 ?auto_131856 ) ) ( not ( = ?auto_131853 ?auto_131856 ) ) ( not ( = ?auto_131854 ?auto_131856 ) ) ( not ( = ?auto_131855 ?auto_131856 ) ) ( ON-TABLE ?auto_131858 ) ( not ( = ?auto_131858 ?auto_131859 ) ) ( not ( = ?auto_131858 ?auto_131856 ) ) ( not ( = ?auto_131858 ?auto_131855 ) ) ( not ( = ?auto_131858 ?auto_131854 ) ) ( not ( = ?auto_131859 ?auto_131856 ) ) ( not ( = ?auto_131859 ?auto_131855 ) ) ( not ( = ?auto_131859 ?auto_131854 ) ) ( not ( = ?auto_131852 ?auto_131858 ) ) ( not ( = ?auto_131852 ?auto_131859 ) ) ( not ( = ?auto_131853 ?auto_131858 ) ) ( not ( = ?auto_131853 ?auto_131859 ) ) ( ON ?auto_131852 ?auto_131857 ) ( not ( = ?auto_131852 ?auto_131857 ) ) ( not ( = ?auto_131853 ?auto_131857 ) ) ( not ( = ?auto_131854 ?auto_131857 ) ) ( not ( = ?auto_131855 ?auto_131857 ) ) ( not ( = ?auto_131856 ?auto_131857 ) ) ( not ( = ?auto_131858 ?auto_131857 ) ) ( not ( = ?auto_131859 ?auto_131857 ) ) ( ON ?auto_131853 ?auto_131852 ) ( ON-TABLE ?auto_131857 ) ( ON ?auto_131854 ?auto_131853 ) ( ON ?auto_131855 ?auto_131854 ) ( ON ?auto_131856 ?auto_131855 ) ( CLEAR ?auto_131858 ) ( ON ?auto_131859 ?auto_131856 ) ( CLEAR ?auto_131859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_131857 ?auto_131852 ?auto_131853 ?auto_131854 ?auto_131855 ?auto_131856 )
      ( MAKE-4PILE ?auto_131852 ?auto_131853 ?auto_131854 ?auto_131855 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_131860 - BLOCK
      ?auto_131861 - BLOCK
      ?auto_131862 - BLOCK
      ?auto_131863 - BLOCK
    )
    :vars
    (
      ?auto_131864 - BLOCK
      ?auto_131865 - BLOCK
      ?auto_131866 - BLOCK
      ?auto_131867 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131860 ?auto_131861 ) ) ( not ( = ?auto_131860 ?auto_131862 ) ) ( not ( = ?auto_131860 ?auto_131863 ) ) ( not ( = ?auto_131861 ?auto_131862 ) ) ( not ( = ?auto_131861 ?auto_131863 ) ) ( not ( = ?auto_131862 ?auto_131863 ) ) ( not ( = ?auto_131860 ?auto_131864 ) ) ( not ( = ?auto_131861 ?auto_131864 ) ) ( not ( = ?auto_131862 ?auto_131864 ) ) ( not ( = ?auto_131863 ?auto_131864 ) ) ( not ( = ?auto_131865 ?auto_131866 ) ) ( not ( = ?auto_131865 ?auto_131864 ) ) ( not ( = ?auto_131865 ?auto_131863 ) ) ( not ( = ?auto_131865 ?auto_131862 ) ) ( not ( = ?auto_131866 ?auto_131864 ) ) ( not ( = ?auto_131866 ?auto_131863 ) ) ( not ( = ?auto_131866 ?auto_131862 ) ) ( not ( = ?auto_131860 ?auto_131865 ) ) ( not ( = ?auto_131860 ?auto_131866 ) ) ( not ( = ?auto_131861 ?auto_131865 ) ) ( not ( = ?auto_131861 ?auto_131866 ) ) ( ON ?auto_131860 ?auto_131867 ) ( not ( = ?auto_131860 ?auto_131867 ) ) ( not ( = ?auto_131861 ?auto_131867 ) ) ( not ( = ?auto_131862 ?auto_131867 ) ) ( not ( = ?auto_131863 ?auto_131867 ) ) ( not ( = ?auto_131864 ?auto_131867 ) ) ( not ( = ?auto_131865 ?auto_131867 ) ) ( not ( = ?auto_131866 ?auto_131867 ) ) ( ON ?auto_131861 ?auto_131860 ) ( ON-TABLE ?auto_131867 ) ( ON ?auto_131862 ?auto_131861 ) ( ON ?auto_131863 ?auto_131862 ) ( ON ?auto_131864 ?auto_131863 ) ( ON ?auto_131866 ?auto_131864 ) ( CLEAR ?auto_131866 ) ( HOLDING ?auto_131865 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_131865 )
      ( MAKE-4PILE ?auto_131860 ?auto_131861 ?auto_131862 ?auto_131863 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_131868 - BLOCK
      ?auto_131869 - BLOCK
      ?auto_131870 - BLOCK
      ?auto_131871 - BLOCK
    )
    :vars
    (
      ?auto_131875 - BLOCK
      ?auto_131874 - BLOCK
      ?auto_131873 - BLOCK
      ?auto_131872 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131868 ?auto_131869 ) ) ( not ( = ?auto_131868 ?auto_131870 ) ) ( not ( = ?auto_131868 ?auto_131871 ) ) ( not ( = ?auto_131869 ?auto_131870 ) ) ( not ( = ?auto_131869 ?auto_131871 ) ) ( not ( = ?auto_131870 ?auto_131871 ) ) ( not ( = ?auto_131868 ?auto_131875 ) ) ( not ( = ?auto_131869 ?auto_131875 ) ) ( not ( = ?auto_131870 ?auto_131875 ) ) ( not ( = ?auto_131871 ?auto_131875 ) ) ( not ( = ?auto_131874 ?auto_131873 ) ) ( not ( = ?auto_131874 ?auto_131875 ) ) ( not ( = ?auto_131874 ?auto_131871 ) ) ( not ( = ?auto_131874 ?auto_131870 ) ) ( not ( = ?auto_131873 ?auto_131875 ) ) ( not ( = ?auto_131873 ?auto_131871 ) ) ( not ( = ?auto_131873 ?auto_131870 ) ) ( not ( = ?auto_131868 ?auto_131874 ) ) ( not ( = ?auto_131868 ?auto_131873 ) ) ( not ( = ?auto_131869 ?auto_131874 ) ) ( not ( = ?auto_131869 ?auto_131873 ) ) ( ON ?auto_131868 ?auto_131872 ) ( not ( = ?auto_131868 ?auto_131872 ) ) ( not ( = ?auto_131869 ?auto_131872 ) ) ( not ( = ?auto_131870 ?auto_131872 ) ) ( not ( = ?auto_131871 ?auto_131872 ) ) ( not ( = ?auto_131875 ?auto_131872 ) ) ( not ( = ?auto_131874 ?auto_131872 ) ) ( not ( = ?auto_131873 ?auto_131872 ) ) ( ON ?auto_131869 ?auto_131868 ) ( ON-TABLE ?auto_131872 ) ( ON ?auto_131870 ?auto_131869 ) ( ON ?auto_131871 ?auto_131870 ) ( ON ?auto_131875 ?auto_131871 ) ( ON ?auto_131873 ?auto_131875 ) ( ON ?auto_131874 ?auto_131873 ) ( CLEAR ?auto_131874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_131872 ?auto_131868 ?auto_131869 ?auto_131870 ?auto_131871 ?auto_131875 ?auto_131873 )
      ( MAKE-4PILE ?auto_131868 ?auto_131869 ?auto_131870 ?auto_131871 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_131878 - BLOCK
      ?auto_131879 - BLOCK
    )
    :vars
    (
      ?auto_131880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131880 ?auto_131879 ) ( CLEAR ?auto_131880 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_131878 ) ( ON ?auto_131879 ?auto_131878 ) ( not ( = ?auto_131878 ?auto_131879 ) ) ( not ( = ?auto_131878 ?auto_131880 ) ) ( not ( = ?auto_131879 ?auto_131880 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_131880 ?auto_131879 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_131881 - BLOCK
      ?auto_131882 - BLOCK
    )
    :vars
    (
      ?auto_131883 - BLOCK
      ?auto_131884 - BLOCK
      ?auto_131885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131883 ?auto_131882 ) ( CLEAR ?auto_131883 ) ( ON-TABLE ?auto_131881 ) ( ON ?auto_131882 ?auto_131881 ) ( not ( = ?auto_131881 ?auto_131882 ) ) ( not ( = ?auto_131881 ?auto_131883 ) ) ( not ( = ?auto_131882 ?auto_131883 ) ) ( HOLDING ?auto_131884 ) ( CLEAR ?auto_131885 ) ( not ( = ?auto_131881 ?auto_131884 ) ) ( not ( = ?auto_131881 ?auto_131885 ) ) ( not ( = ?auto_131882 ?auto_131884 ) ) ( not ( = ?auto_131882 ?auto_131885 ) ) ( not ( = ?auto_131883 ?auto_131884 ) ) ( not ( = ?auto_131883 ?auto_131885 ) ) ( not ( = ?auto_131884 ?auto_131885 ) ) )
    :subtasks
    ( ( !STACK ?auto_131884 ?auto_131885 )
      ( MAKE-2PILE ?auto_131881 ?auto_131882 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_131886 - BLOCK
      ?auto_131887 - BLOCK
    )
    :vars
    (
      ?auto_131889 - BLOCK
      ?auto_131888 - BLOCK
      ?auto_131890 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131889 ?auto_131887 ) ( ON-TABLE ?auto_131886 ) ( ON ?auto_131887 ?auto_131886 ) ( not ( = ?auto_131886 ?auto_131887 ) ) ( not ( = ?auto_131886 ?auto_131889 ) ) ( not ( = ?auto_131887 ?auto_131889 ) ) ( CLEAR ?auto_131888 ) ( not ( = ?auto_131886 ?auto_131890 ) ) ( not ( = ?auto_131886 ?auto_131888 ) ) ( not ( = ?auto_131887 ?auto_131890 ) ) ( not ( = ?auto_131887 ?auto_131888 ) ) ( not ( = ?auto_131889 ?auto_131890 ) ) ( not ( = ?auto_131889 ?auto_131888 ) ) ( not ( = ?auto_131890 ?auto_131888 ) ) ( ON ?auto_131890 ?auto_131889 ) ( CLEAR ?auto_131890 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_131886 ?auto_131887 ?auto_131889 )
      ( MAKE-2PILE ?auto_131886 ?auto_131887 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_131891 - BLOCK
      ?auto_131892 - BLOCK
    )
    :vars
    (
      ?auto_131894 - BLOCK
      ?auto_131893 - BLOCK
      ?auto_131895 - BLOCK
      ?auto_131896 - BLOCK
      ?auto_131897 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131894 ?auto_131892 ) ( ON-TABLE ?auto_131891 ) ( ON ?auto_131892 ?auto_131891 ) ( not ( = ?auto_131891 ?auto_131892 ) ) ( not ( = ?auto_131891 ?auto_131894 ) ) ( not ( = ?auto_131892 ?auto_131894 ) ) ( not ( = ?auto_131891 ?auto_131893 ) ) ( not ( = ?auto_131891 ?auto_131895 ) ) ( not ( = ?auto_131892 ?auto_131893 ) ) ( not ( = ?auto_131892 ?auto_131895 ) ) ( not ( = ?auto_131894 ?auto_131893 ) ) ( not ( = ?auto_131894 ?auto_131895 ) ) ( not ( = ?auto_131893 ?auto_131895 ) ) ( ON ?auto_131893 ?auto_131894 ) ( CLEAR ?auto_131893 ) ( HOLDING ?auto_131895 ) ( CLEAR ?auto_131896 ) ( ON-TABLE ?auto_131897 ) ( ON ?auto_131896 ?auto_131897 ) ( not ( = ?auto_131897 ?auto_131896 ) ) ( not ( = ?auto_131897 ?auto_131895 ) ) ( not ( = ?auto_131896 ?auto_131895 ) ) ( not ( = ?auto_131891 ?auto_131896 ) ) ( not ( = ?auto_131891 ?auto_131897 ) ) ( not ( = ?auto_131892 ?auto_131896 ) ) ( not ( = ?auto_131892 ?auto_131897 ) ) ( not ( = ?auto_131894 ?auto_131896 ) ) ( not ( = ?auto_131894 ?auto_131897 ) ) ( not ( = ?auto_131893 ?auto_131896 ) ) ( not ( = ?auto_131893 ?auto_131897 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_131897 ?auto_131896 ?auto_131895 )
      ( MAKE-2PILE ?auto_131891 ?auto_131892 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_131898 - BLOCK
      ?auto_131899 - BLOCK
    )
    :vars
    (
      ?auto_131903 - BLOCK
      ?auto_131902 - BLOCK
      ?auto_131901 - BLOCK
      ?auto_131900 - BLOCK
      ?auto_131904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131903 ?auto_131899 ) ( ON-TABLE ?auto_131898 ) ( ON ?auto_131899 ?auto_131898 ) ( not ( = ?auto_131898 ?auto_131899 ) ) ( not ( = ?auto_131898 ?auto_131903 ) ) ( not ( = ?auto_131899 ?auto_131903 ) ) ( not ( = ?auto_131898 ?auto_131902 ) ) ( not ( = ?auto_131898 ?auto_131901 ) ) ( not ( = ?auto_131899 ?auto_131902 ) ) ( not ( = ?auto_131899 ?auto_131901 ) ) ( not ( = ?auto_131903 ?auto_131902 ) ) ( not ( = ?auto_131903 ?auto_131901 ) ) ( not ( = ?auto_131902 ?auto_131901 ) ) ( ON ?auto_131902 ?auto_131903 ) ( CLEAR ?auto_131900 ) ( ON-TABLE ?auto_131904 ) ( ON ?auto_131900 ?auto_131904 ) ( not ( = ?auto_131904 ?auto_131900 ) ) ( not ( = ?auto_131904 ?auto_131901 ) ) ( not ( = ?auto_131900 ?auto_131901 ) ) ( not ( = ?auto_131898 ?auto_131900 ) ) ( not ( = ?auto_131898 ?auto_131904 ) ) ( not ( = ?auto_131899 ?auto_131900 ) ) ( not ( = ?auto_131899 ?auto_131904 ) ) ( not ( = ?auto_131903 ?auto_131900 ) ) ( not ( = ?auto_131903 ?auto_131904 ) ) ( not ( = ?auto_131902 ?auto_131900 ) ) ( not ( = ?auto_131902 ?auto_131904 ) ) ( ON ?auto_131901 ?auto_131902 ) ( CLEAR ?auto_131901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_131898 ?auto_131899 ?auto_131903 ?auto_131902 )
      ( MAKE-2PILE ?auto_131898 ?auto_131899 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_131905 - BLOCK
      ?auto_131906 - BLOCK
    )
    :vars
    (
      ?auto_131908 - BLOCK
      ?auto_131910 - BLOCK
      ?auto_131909 - BLOCK
      ?auto_131911 - BLOCK
      ?auto_131907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131908 ?auto_131906 ) ( ON-TABLE ?auto_131905 ) ( ON ?auto_131906 ?auto_131905 ) ( not ( = ?auto_131905 ?auto_131906 ) ) ( not ( = ?auto_131905 ?auto_131908 ) ) ( not ( = ?auto_131906 ?auto_131908 ) ) ( not ( = ?auto_131905 ?auto_131910 ) ) ( not ( = ?auto_131905 ?auto_131909 ) ) ( not ( = ?auto_131906 ?auto_131910 ) ) ( not ( = ?auto_131906 ?auto_131909 ) ) ( not ( = ?auto_131908 ?auto_131910 ) ) ( not ( = ?auto_131908 ?auto_131909 ) ) ( not ( = ?auto_131910 ?auto_131909 ) ) ( ON ?auto_131910 ?auto_131908 ) ( ON-TABLE ?auto_131911 ) ( not ( = ?auto_131911 ?auto_131907 ) ) ( not ( = ?auto_131911 ?auto_131909 ) ) ( not ( = ?auto_131907 ?auto_131909 ) ) ( not ( = ?auto_131905 ?auto_131907 ) ) ( not ( = ?auto_131905 ?auto_131911 ) ) ( not ( = ?auto_131906 ?auto_131907 ) ) ( not ( = ?auto_131906 ?auto_131911 ) ) ( not ( = ?auto_131908 ?auto_131907 ) ) ( not ( = ?auto_131908 ?auto_131911 ) ) ( not ( = ?auto_131910 ?auto_131907 ) ) ( not ( = ?auto_131910 ?auto_131911 ) ) ( ON ?auto_131909 ?auto_131910 ) ( CLEAR ?auto_131909 ) ( HOLDING ?auto_131907 ) ( CLEAR ?auto_131911 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_131911 ?auto_131907 )
      ( MAKE-2PILE ?auto_131905 ?auto_131906 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_131912 - BLOCK
      ?auto_131913 - BLOCK
    )
    :vars
    (
      ?auto_131916 - BLOCK
      ?auto_131914 - BLOCK
      ?auto_131915 - BLOCK
      ?auto_131917 - BLOCK
      ?auto_131918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131916 ?auto_131913 ) ( ON-TABLE ?auto_131912 ) ( ON ?auto_131913 ?auto_131912 ) ( not ( = ?auto_131912 ?auto_131913 ) ) ( not ( = ?auto_131912 ?auto_131916 ) ) ( not ( = ?auto_131913 ?auto_131916 ) ) ( not ( = ?auto_131912 ?auto_131914 ) ) ( not ( = ?auto_131912 ?auto_131915 ) ) ( not ( = ?auto_131913 ?auto_131914 ) ) ( not ( = ?auto_131913 ?auto_131915 ) ) ( not ( = ?auto_131916 ?auto_131914 ) ) ( not ( = ?auto_131916 ?auto_131915 ) ) ( not ( = ?auto_131914 ?auto_131915 ) ) ( ON ?auto_131914 ?auto_131916 ) ( ON-TABLE ?auto_131917 ) ( not ( = ?auto_131917 ?auto_131918 ) ) ( not ( = ?auto_131917 ?auto_131915 ) ) ( not ( = ?auto_131918 ?auto_131915 ) ) ( not ( = ?auto_131912 ?auto_131918 ) ) ( not ( = ?auto_131912 ?auto_131917 ) ) ( not ( = ?auto_131913 ?auto_131918 ) ) ( not ( = ?auto_131913 ?auto_131917 ) ) ( not ( = ?auto_131916 ?auto_131918 ) ) ( not ( = ?auto_131916 ?auto_131917 ) ) ( not ( = ?auto_131914 ?auto_131918 ) ) ( not ( = ?auto_131914 ?auto_131917 ) ) ( ON ?auto_131915 ?auto_131914 ) ( CLEAR ?auto_131917 ) ( ON ?auto_131918 ?auto_131915 ) ( CLEAR ?auto_131918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_131912 ?auto_131913 ?auto_131916 ?auto_131914 ?auto_131915 )
      ( MAKE-2PILE ?auto_131912 ?auto_131913 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_131919 - BLOCK
      ?auto_131920 - BLOCK
    )
    :vars
    (
      ?auto_131923 - BLOCK
      ?auto_131924 - BLOCK
      ?auto_131922 - BLOCK
      ?auto_131925 - BLOCK
      ?auto_131921 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131923 ?auto_131920 ) ( ON-TABLE ?auto_131919 ) ( ON ?auto_131920 ?auto_131919 ) ( not ( = ?auto_131919 ?auto_131920 ) ) ( not ( = ?auto_131919 ?auto_131923 ) ) ( not ( = ?auto_131920 ?auto_131923 ) ) ( not ( = ?auto_131919 ?auto_131924 ) ) ( not ( = ?auto_131919 ?auto_131922 ) ) ( not ( = ?auto_131920 ?auto_131924 ) ) ( not ( = ?auto_131920 ?auto_131922 ) ) ( not ( = ?auto_131923 ?auto_131924 ) ) ( not ( = ?auto_131923 ?auto_131922 ) ) ( not ( = ?auto_131924 ?auto_131922 ) ) ( ON ?auto_131924 ?auto_131923 ) ( not ( = ?auto_131925 ?auto_131921 ) ) ( not ( = ?auto_131925 ?auto_131922 ) ) ( not ( = ?auto_131921 ?auto_131922 ) ) ( not ( = ?auto_131919 ?auto_131921 ) ) ( not ( = ?auto_131919 ?auto_131925 ) ) ( not ( = ?auto_131920 ?auto_131921 ) ) ( not ( = ?auto_131920 ?auto_131925 ) ) ( not ( = ?auto_131923 ?auto_131921 ) ) ( not ( = ?auto_131923 ?auto_131925 ) ) ( not ( = ?auto_131924 ?auto_131921 ) ) ( not ( = ?auto_131924 ?auto_131925 ) ) ( ON ?auto_131922 ?auto_131924 ) ( ON ?auto_131921 ?auto_131922 ) ( CLEAR ?auto_131921 ) ( HOLDING ?auto_131925 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_131925 )
      ( MAKE-2PILE ?auto_131919 ?auto_131920 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_131926 - BLOCK
      ?auto_131927 - BLOCK
    )
    :vars
    (
      ?auto_131932 - BLOCK
      ?auto_131928 - BLOCK
      ?auto_131930 - BLOCK
      ?auto_131929 - BLOCK
      ?auto_131931 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131932 ?auto_131927 ) ( ON-TABLE ?auto_131926 ) ( ON ?auto_131927 ?auto_131926 ) ( not ( = ?auto_131926 ?auto_131927 ) ) ( not ( = ?auto_131926 ?auto_131932 ) ) ( not ( = ?auto_131927 ?auto_131932 ) ) ( not ( = ?auto_131926 ?auto_131928 ) ) ( not ( = ?auto_131926 ?auto_131930 ) ) ( not ( = ?auto_131927 ?auto_131928 ) ) ( not ( = ?auto_131927 ?auto_131930 ) ) ( not ( = ?auto_131932 ?auto_131928 ) ) ( not ( = ?auto_131932 ?auto_131930 ) ) ( not ( = ?auto_131928 ?auto_131930 ) ) ( ON ?auto_131928 ?auto_131932 ) ( not ( = ?auto_131929 ?auto_131931 ) ) ( not ( = ?auto_131929 ?auto_131930 ) ) ( not ( = ?auto_131931 ?auto_131930 ) ) ( not ( = ?auto_131926 ?auto_131931 ) ) ( not ( = ?auto_131926 ?auto_131929 ) ) ( not ( = ?auto_131927 ?auto_131931 ) ) ( not ( = ?auto_131927 ?auto_131929 ) ) ( not ( = ?auto_131932 ?auto_131931 ) ) ( not ( = ?auto_131932 ?auto_131929 ) ) ( not ( = ?auto_131928 ?auto_131931 ) ) ( not ( = ?auto_131928 ?auto_131929 ) ) ( ON ?auto_131930 ?auto_131928 ) ( ON ?auto_131931 ?auto_131930 ) ( ON ?auto_131929 ?auto_131931 ) ( CLEAR ?auto_131929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_131926 ?auto_131927 ?auto_131932 ?auto_131928 ?auto_131930 ?auto_131931 )
      ( MAKE-2PILE ?auto_131926 ?auto_131927 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_131933 - BLOCK
      ?auto_131934 - BLOCK
    )
    :vars
    (
      ?auto_131938 - BLOCK
      ?auto_131939 - BLOCK
      ?auto_131937 - BLOCK
      ?auto_131936 - BLOCK
      ?auto_131935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131938 ?auto_131934 ) ( ON-TABLE ?auto_131933 ) ( ON ?auto_131934 ?auto_131933 ) ( not ( = ?auto_131933 ?auto_131934 ) ) ( not ( = ?auto_131933 ?auto_131938 ) ) ( not ( = ?auto_131934 ?auto_131938 ) ) ( not ( = ?auto_131933 ?auto_131939 ) ) ( not ( = ?auto_131933 ?auto_131937 ) ) ( not ( = ?auto_131934 ?auto_131939 ) ) ( not ( = ?auto_131934 ?auto_131937 ) ) ( not ( = ?auto_131938 ?auto_131939 ) ) ( not ( = ?auto_131938 ?auto_131937 ) ) ( not ( = ?auto_131939 ?auto_131937 ) ) ( ON ?auto_131939 ?auto_131938 ) ( not ( = ?auto_131936 ?auto_131935 ) ) ( not ( = ?auto_131936 ?auto_131937 ) ) ( not ( = ?auto_131935 ?auto_131937 ) ) ( not ( = ?auto_131933 ?auto_131935 ) ) ( not ( = ?auto_131933 ?auto_131936 ) ) ( not ( = ?auto_131934 ?auto_131935 ) ) ( not ( = ?auto_131934 ?auto_131936 ) ) ( not ( = ?auto_131938 ?auto_131935 ) ) ( not ( = ?auto_131938 ?auto_131936 ) ) ( not ( = ?auto_131939 ?auto_131935 ) ) ( not ( = ?auto_131939 ?auto_131936 ) ) ( ON ?auto_131937 ?auto_131939 ) ( ON ?auto_131935 ?auto_131937 ) ( HOLDING ?auto_131936 ) ( CLEAR ?auto_131935 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_131933 ?auto_131934 ?auto_131938 ?auto_131939 ?auto_131937 ?auto_131935 ?auto_131936 )
      ( MAKE-2PILE ?auto_131933 ?auto_131934 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_131940 - BLOCK
      ?auto_131941 - BLOCK
    )
    :vars
    (
      ?auto_131945 - BLOCK
      ?auto_131942 - BLOCK
      ?auto_131944 - BLOCK
      ?auto_131946 - BLOCK
      ?auto_131943 - BLOCK
      ?auto_131947 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131945 ?auto_131941 ) ( ON-TABLE ?auto_131940 ) ( ON ?auto_131941 ?auto_131940 ) ( not ( = ?auto_131940 ?auto_131941 ) ) ( not ( = ?auto_131940 ?auto_131945 ) ) ( not ( = ?auto_131941 ?auto_131945 ) ) ( not ( = ?auto_131940 ?auto_131942 ) ) ( not ( = ?auto_131940 ?auto_131944 ) ) ( not ( = ?auto_131941 ?auto_131942 ) ) ( not ( = ?auto_131941 ?auto_131944 ) ) ( not ( = ?auto_131945 ?auto_131942 ) ) ( not ( = ?auto_131945 ?auto_131944 ) ) ( not ( = ?auto_131942 ?auto_131944 ) ) ( ON ?auto_131942 ?auto_131945 ) ( not ( = ?auto_131946 ?auto_131943 ) ) ( not ( = ?auto_131946 ?auto_131944 ) ) ( not ( = ?auto_131943 ?auto_131944 ) ) ( not ( = ?auto_131940 ?auto_131943 ) ) ( not ( = ?auto_131940 ?auto_131946 ) ) ( not ( = ?auto_131941 ?auto_131943 ) ) ( not ( = ?auto_131941 ?auto_131946 ) ) ( not ( = ?auto_131945 ?auto_131943 ) ) ( not ( = ?auto_131945 ?auto_131946 ) ) ( not ( = ?auto_131942 ?auto_131943 ) ) ( not ( = ?auto_131942 ?auto_131946 ) ) ( ON ?auto_131944 ?auto_131942 ) ( ON ?auto_131943 ?auto_131944 ) ( CLEAR ?auto_131943 ) ( ON ?auto_131946 ?auto_131947 ) ( CLEAR ?auto_131946 ) ( HAND-EMPTY ) ( not ( = ?auto_131940 ?auto_131947 ) ) ( not ( = ?auto_131941 ?auto_131947 ) ) ( not ( = ?auto_131945 ?auto_131947 ) ) ( not ( = ?auto_131942 ?auto_131947 ) ) ( not ( = ?auto_131944 ?auto_131947 ) ) ( not ( = ?auto_131946 ?auto_131947 ) ) ( not ( = ?auto_131943 ?auto_131947 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_131946 ?auto_131947 )
      ( MAKE-2PILE ?auto_131940 ?auto_131941 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_131948 - BLOCK
      ?auto_131949 - BLOCK
    )
    :vars
    (
      ?auto_131953 - BLOCK
      ?auto_131951 - BLOCK
      ?auto_131954 - BLOCK
      ?auto_131955 - BLOCK
      ?auto_131950 - BLOCK
      ?auto_131952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131953 ?auto_131949 ) ( ON-TABLE ?auto_131948 ) ( ON ?auto_131949 ?auto_131948 ) ( not ( = ?auto_131948 ?auto_131949 ) ) ( not ( = ?auto_131948 ?auto_131953 ) ) ( not ( = ?auto_131949 ?auto_131953 ) ) ( not ( = ?auto_131948 ?auto_131951 ) ) ( not ( = ?auto_131948 ?auto_131954 ) ) ( not ( = ?auto_131949 ?auto_131951 ) ) ( not ( = ?auto_131949 ?auto_131954 ) ) ( not ( = ?auto_131953 ?auto_131951 ) ) ( not ( = ?auto_131953 ?auto_131954 ) ) ( not ( = ?auto_131951 ?auto_131954 ) ) ( ON ?auto_131951 ?auto_131953 ) ( not ( = ?auto_131955 ?auto_131950 ) ) ( not ( = ?auto_131955 ?auto_131954 ) ) ( not ( = ?auto_131950 ?auto_131954 ) ) ( not ( = ?auto_131948 ?auto_131950 ) ) ( not ( = ?auto_131948 ?auto_131955 ) ) ( not ( = ?auto_131949 ?auto_131950 ) ) ( not ( = ?auto_131949 ?auto_131955 ) ) ( not ( = ?auto_131953 ?auto_131950 ) ) ( not ( = ?auto_131953 ?auto_131955 ) ) ( not ( = ?auto_131951 ?auto_131950 ) ) ( not ( = ?auto_131951 ?auto_131955 ) ) ( ON ?auto_131954 ?auto_131951 ) ( ON ?auto_131955 ?auto_131952 ) ( CLEAR ?auto_131955 ) ( not ( = ?auto_131948 ?auto_131952 ) ) ( not ( = ?auto_131949 ?auto_131952 ) ) ( not ( = ?auto_131953 ?auto_131952 ) ) ( not ( = ?auto_131951 ?auto_131952 ) ) ( not ( = ?auto_131954 ?auto_131952 ) ) ( not ( = ?auto_131955 ?auto_131952 ) ) ( not ( = ?auto_131950 ?auto_131952 ) ) ( HOLDING ?auto_131950 ) ( CLEAR ?auto_131954 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_131948 ?auto_131949 ?auto_131953 ?auto_131951 ?auto_131954 ?auto_131950 )
      ( MAKE-2PILE ?auto_131948 ?auto_131949 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_131956 - BLOCK
      ?auto_131957 - BLOCK
    )
    :vars
    (
      ?auto_131960 - BLOCK
      ?auto_131958 - BLOCK
      ?auto_131961 - BLOCK
      ?auto_131959 - BLOCK
      ?auto_131962 - BLOCK
      ?auto_131963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131960 ?auto_131957 ) ( ON-TABLE ?auto_131956 ) ( ON ?auto_131957 ?auto_131956 ) ( not ( = ?auto_131956 ?auto_131957 ) ) ( not ( = ?auto_131956 ?auto_131960 ) ) ( not ( = ?auto_131957 ?auto_131960 ) ) ( not ( = ?auto_131956 ?auto_131958 ) ) ( not ( = ?auto_131956 ?auto_131961 ) ) ( not ( = ?auto_131957 ?auto_131958 ) ) ( not ( = ?auto_131957 ?auto_131961 ) ) ( not ( = ?auto_131960 ?auto_131958 ) ) ( not ( = ?auto_131960 ?auto_131961 ) ) ( not ( = ?auto_131958 ?auto_131961 ) ) ( ON ?auto_131958 ?auto_131960 ) ( not ( = ?auto_131959 ?auto_131962 ) ) ( not ( = ?auto_131959 ?auto_131961 ) ) ( not ( = ?auto_131962 ?auto_131961 ) ) ( not ( = ?auto_131956 ?auto_131962 ) ) ( not ( = ?auto_131956 ?auto_131959 ) ) ( not ( = ?auto_131957 ?auto_131962 ) ) ( not ( = ?auto_131957 ?auto_131959 ) ) ( not ( = ?auto_131960 ?auto_131962 ) ) ( not ( = ?auto_131960 ?auto_131959 ) ) ( not ( = ?auto_131958 ?auto_131962 ) ) ( not ( = ?auto_131958 ?auto_131959 ) ) ( ON ?auto_131961 ?auto_131958 ) ( ON ?auto_131959 ?auto_131963 ) ( not ( = ?auto_131956 ?auto_131963 ) ) ( not ( = ?auto_131957 ?auto_131963 ) ) ( not ( = ?auto_131960 ?auto_131963 ) ) ( not ( = ?auto_131958 ?auto_131963 ) ) ( not ( = ?auto_131961 ?auto_131963 ) ) ( not ( = ?auto_131959 ?auto_131963 ) ) ( not ( = ?auto_131962 ?auto_131963 ) ) ( CLEAR ?auto_131961 ) ( ON ?auto_131962 ?auto_131959 ) ( CLEAR ?auto_131962 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_131963 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_131963 ?auto_131959 )
      ( MAKE-2PILE ?auto_131956 ?auto_131957 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_131964 - BLOCK
      ?auto_131965 - BLOCK
    )
    :vars
    (
      ?auto_131966 - BLOCK
      ?auto_131968 - BLOCK
      ?auto_131970 - BLOCK
      ?auto_131969 - BLOCK
      ?auto_131971 - BLOCK
      ?auto_131967 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131966 ?auto_131965 ) ( ON-TABLE ?auto_131964 ) ( ON ?auto_131965 ?auto_131964 ) ( not ( = ?auto_131964 ?auto_131965 ) ) ( not ( = ?auto_131964 ?auto_131966 ) ) ( not ( = ?auto_131965 ?auto_131966 ) ) ( not ( = ?auto_131964 ?auto_131968 ) ) ( not ( = ?auto_131964 ?auto_131970 ) ) ( not ( = ?auto_131965 ?auto_131968 ) ) ( not ( = ?auto_131965 ?auto_131970 ) ) ( not ( = ?auto_131966 ?auto_131968 ) ) ( not ( = ?auto_131966 ?auto_131970 ) ) ( not ( = ?auto_131968 ?auto_131970 ) ) ( ON ?auto_131968 ?auto_131966 ) ( not ( = ?auto_131969 ?auto_131971 ) ) ( not ( = ?auto_131969 ?auto_131970 ) ) ( not ( = ?auto_131971 ?auto_131970 ) ) ( not ( = ?auto_131964 ?auto_131971 ) ) ( not ( = ?auto_131964 ?auto_131969 ) ) ( not ( = ?auto_131965 ?auto_131971 ) ) ( not ( = ?auto_131965 ?auto_131969 ) ) ( not ( = ?auto_131966 ?auto_131971 ) ) ( not ( = ?auto_131966 ?auto_131969 ) ) ( not ( = ?auto_131968 ?auto_131971 ) ) ( not ( = ?auto_131968 ?auto_131969 ) ) ( ON ?auto_131969 ?auto_131967 ) ( not ( = ?auto_131964 ?auto_131967 ) ) ( not ( = ?auto_131965 ?auto_131967 ) ) ( not ( = ?auto_131966 ?auto_131967 ) ) ( not ( = ?auto_131968 ?auto_131967 ) ) ( not ( = ?auto_131970 ?auto_131967 ) ) ( not ( = ?auto_131969 ?auto_131967 ) ) ( not ( = ?auto_131971 ?auto_131967 ) ) ( ON ?auto_131971 ?auto_131969 ) ( CLEAR ?auto_131971 ) ( ON-TABLE ?auto_131967 ) ( HOLDING ?auto_131970 ) ( CLEAR ?auto_131968 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_131964 ?auto_131965 ?auto_131966 ?auto_131968 ?auto_131970 )
      ( MAKE-2PILE ?auto_131964 ?auto_131965 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_131972 - BLOCK
      ?auto_131973 - BLOCK
    )
    :vars
    (
      ?auto_131976 - BLOCK
      ?auto_131975 - BLOCK
      ?auto_131977 - BLOCK
      ?auto_131979 - BLOCK
      ?auto_131978 - BLOCK
      ?auto_131974 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131976 ?auto_131973 ) ( ON-TABLE ?auto_131972 ) ( ON ?auto_131973 ?auto_131972 ) ( not ( = ?auto_131972 ?auto_131973 ) ) ( not ( = ?auto_131972 ?auto_131976 ) ) ( not ( = ?auto_131973 ?auto_131976 ) ) ( not ( = ?auto_131972 ?auto_131975 ) ) ( not ( = ?auto_131972 ?auto_131977 ) ) ( not ( = ?auto_131973 ?auto_131975 ) ) ( not ( = ?auto_131973 ?auto_131977 ) ) ( not ( = ?auto_131976 ?auto_131975 ) ) ( not ( = ?auto_131976 ?auto_131977 ) ) ( not ( = ?auto_131975 ?auto_131977 ) ) ( ON ?auto_131975 ?auto_131976 ) ( not ( = ?auto_131979 ?auto_131978 ) ) ( not ( = ?auto_131979 ?auto_131977 ) ) ( not ( = ?auto_131978 ?auto_131977 ) ) ( not ( = ?auto_131972 ?auto_131978 ) ) ( not ( = ?auto_131972 ?auto_131979 ) ) ( not ( = ?auto_131973 ?auto_131978 ) ) ( not ( = ?auto_131973 ?auto_131979 ) ) ( not ( = ?auto_131976 ?auto_131978 ) ) ( not ( = ?auto_131976 ?auto_131979 ) ) ( not ( = ?auto_131975 ?auto_131978 ) ) ( not ( = ?auto_131975 ?auto_131979 ) ) ( ON ?auto_131979 ?auto_131974 ) ( not ( = ?auto_131972 ?auto_131974 ) ) ( not ( = ?auto_131973 ?auto_131974 ) ) ( not ( = ?auto_131976 ?auto_131974 ) ) ( not ( = ?auto_131975 ?auto_131974 ) ) ( not ( = ?auto_131977 ?auto_131974 ) ) ( not ( = ?auto_131979 ?auto_131974 ) ) ( not ( = ?auto_131978 ?auto_131974 ) ) ( ON ?auto_131978 ?auto_131979 ) ( ON-TABLE ?auto_131974 ) ( CLEAR ?auto_131975 ) ( ON ?auto_131977 ?auto_131978 ) ( CLEAR ?auto_131977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_131974 ?auto_131979 ?auto_131978 )
      ( MAKE-2PILE ?auto_131972 ?auto_131973 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_131980 - BLOCK
      ?auto_131981 - BLOCK
    )
    :vars
    (
      ?auto_131983 - BLOCK
      ?auto_131984 - BLOCK
      ?auto_131986 - BLOCK
      ?auto_131987 - BLOCK
      ?auto_131982 - BLOCK
      ?auto_131985 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131983 ?auto_131981 ) ( ON-TABLE ?auto_131980 ) ( ON ?auto_131981 ?auto_131980 ) ( not ( = ?auto_131980 ?auto_131981 ) ) ( not ( = ?auto_131980 ?auto_131983 ) ) ( not ( = ?auto_131981 ?auto_131983 ) ) ( not ( = ?auto_131980 ?auto_131984 ) ) ( not ( = ?auto_131980 ?auto_131986 ) ) ( not ( = ?auto_131981 ?auto_131984 ) ) ( not ( = ?auto_131981 ?auto_131986 ) ) ( not ( = ?auto_131983 ?auto_131984 ) ) ( not ( = ?auto_131983 ?auto_131986 ) ) ( not ( = ?auto_131984 ?auto_131986 ) ) ( not ( = ?auto_131987 ?auto_131982 ) ) ( not ( = ?auto_131987 ?auto_131986 ) ) ( not ( = ?auto_131982 ?auto_131986 ) ) ( not ( = ?auto_131980 ?auto_131982 ) ) ( not ( = ?auto_131980 ?auto_131987 ) ) ( not ( = ?auto_131981 ?auto_131982 ) ) ( not ( = ?auto_131981 ?auto_131987 ) ) ( not ( = ?auto_131983 ?auto_131982 ) ) ( not ( = ?auto_131983 ?auto_131987 ) ) ( not ( = ?auto_131984 ?auto_131982 ) ) ( not ( = ?auto_131984 ?auto_131987 ) ) ( ON ?auto_131987 ?auto_131985 ) ( not ( = ?auto_131980 ?auto_131985 ) ) ( not ( = ?auto_131981 ?auto_131985 ) ) ( not ( = ?auto_131983 ?auto_131985 ) ) ( not ( = ?auto_131984 ?auto_131985 ) ) ( not ( = ?auto_131986 ?auto_131985 ) ) ( not ( = ?auto_131987 ?auto_131985 ) ) ( not ( = ?auto_131982 ?auto_131985 ) ) ( ON ?auto_131982 ?auto_131987 ) ( ON-TABLE ?auto_131985 ) ( ON ?auto_131986 ?auto_131982 ) ( CLEAR ?auto_131986 ) ( HOLDING ?auto_131984 ) ( CLEAR ?auto_131983 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_131980 ?auto_131981 ?auto_131983 ?auto_131984 )
      ( MAKE-2PILE ?auto_131980 ?auto_131981 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_131988 - BLOCK
      ?auto_131989 - BLOCK
    )
    :vars
    (
      ?auto_131993 - BLOCK
      ?auto_131994 - BLOCK
      ?auto_131991 - BLOCK
      ?auto_131990 - BLOCK
      ?auto_131992 - BLOCK
      ?auto_131995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131993 ?auto_131989 ) ( ON-TABLE ?auto_131988 ) ( ON ?auto_131989 ?auto_131988 ) ( not ( = ?auto_131988 ?auto_131989 ) ) ( not ( = ?auto_131988 ?auto_131993 ) ) ( not ( = ?auto_131989 ?auto_131993 ) ) ( not ( = ?auto_131988 ?auto_131994 ) ) ( not ( = ?auto_131988 ?auto_131991 ) ) ( not ( = ?auto_131989 ?auto_131994 ) ) ( not ( = ?auto_131989 ?auto_131991 ) ) ( not ( = ?auto_131993 ?auto_131994 ) ) ( not ( = ?auto_131993 ?auto_131991 ) ) ( not ( = ?auto_131994 ?auto_131991 ) ) ( not ( = ?auto_131990 ?auto_131992 ) ) ( not ( = ?auto_131990 ?auto_131991 ) ) ( not ( = ?auto_131992 ?auto_131991 ) ) ( not ( = ?auto_131988 ?auto_131992 ) ) ( not ( = ?auto_131988 ?auto_131990 ) ) ( not ( = ?auto_131989 ?auto_131992 ) ) ( not ( = ?auto_131989 ?auto_131990 ) ) ( not ( = ?auto_131993 ?auto_131992 ) ) ( not ( = ?auto_131993 ?auto_131990 ) ) ( not ( = ?auto_131994 ?auto_131992 ) ) ( not ( = ?auto_131994 ?auto_131990 ) ) ( ON ?auto_131990 ?auto_131995 ) ( not ( = ?auto_131988 ?auto_131995 ) ) ( not ( = ?auto_131989 ?auto_131995 ) ) ( not ( = ?auto_131993 ?auto_131995 ) ) ( not ( = ?auto_131994 ?auto_131995 ) ) ( not ( = ?auto_131991 ?auto_131995 ) ) ( not ( = ?auto_131990 ?auto_131995 ) ) ( not ( = ?auto_131992 ?auto_131995 ) ) ( ON ?auto_131992 ?auto_131990 ) ( ON-TABLE ?auto_131995 ) ( ON ?auto_131991 ?auto_131992 ) ( CLEAR ?auto_131993 ) ( ON ?auto_131994 ?auto_131991 ) ( CLEAR ?auto_131994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_131995 ?auto_131990 ?auto_131992 ?auto_131991 )
      ( MAKE-2PILE ?auto_131988 ?auto_131989 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_132012 - BLOCK
      ?auto_132013 - BLOCK
    )
    :vars
    (
      ?auto_132018 - BLOCK
      ?auto_132014 - BLOCK
      ?auto_132017 - BLOCK
      ?auto_132016 - BLOCK
      ?auto_132019 - BLOCK
      ?auto_132015 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132012 ) ( not ( = ?auto_132012 ?auto_132013 ) ) ( not ( = ?auto_132012 ?auto_132018 ) ) ( not ( = ?auto_132013 ?auto_132018 ) ) ( not ( = ?auto_132012 ?auto_132014 ) ) ( not ( = ?auto_132012 ?auto_132017 ) ) ( not ( = ?auto_132013 ?auto_132014 ) ) ( not ( = ?auto_132013 ?auto_132017 ) ) ( not ( = ?auto_132018 ?auto_132014 ) ) ( not ( = ?auto_132018 ?auto_132017 ) ) ( not ( = ?auto_132014 ?auto_132017 ) ) ( not ( = ?auto_132016 ?auto_132019 ) ) ( not ( = ?auto_132016 ?auto_132017 ) ) ( not ( = ?auto_132019 ?auto_132017 ) ) ( not ( = ?auto_132012 ?auto_132019 ) ) ( not ( = ?auto_132012 ?auto_132016 ) ) ( not ( = ?auto_132013 ?auto_132019 ) ) ( not ( = ?auto_132013 ?auto_132016 ) ) ( not ( = ?auto_132018 ?auto_132019 ) ) ( not ( = ?auto_132018 ?auto_132016 ) ) ( not ( = ?auto_132014 ?auto_132019 ) ) ( not ( = ?auto_132014 ?auto_132016 ) ) ( ON ?auto_132016 ?auto_132015 ) ( not ( = ?auto_132012 ?auto_132015 ) ) ( not ( = ?auto_132013 ?auto_132015 ) ) ( not ( = ?auto_132018 ?auto_132015 ) ) ( not ( = ?auto_132014 ?auto_132015 ) ) ( not ( = ?auto_132017 ?auto_132015 ) ) ( not ( = ?auto_132016 ?auto_132015 ) ) ( not ( = ?auto_132019 ?auto_132015 ) ) ( ON ?auto_132019 ?auto_132016 ) ( ON-TABLE ?auto_132015 ) ( ON ?auto_132017 ?auto_132019 ) ( ON ?auto_132014 ?auto_132017 ) ( ON ?auto_132018 ?auto_132014 ) ( CLEAR ?auto_132018 ) ( HOLDING ?auto_132013 ) ( CLEAR ?auto_132012 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_132012 ?auto_132013 ?auto_132018 )
      ( MAKE-2PILE ?auto_132012 ?auto_132013 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_132020 - BLOCK
      ?auto_132021 - BLOCK
    )
    :vars
    (
      ?auto_132025 - BLOCK
      ?auto_132023 - BLOCK
      ?auto_132022 - BLOCK
      ?auto_132024 - BLOCK
      ?auto_132026 - BLOCK
      ?auto_132027 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132020 ) ( not ( = ?auto_132020 ?auto_132021 ) ) ( not ( = ?auto_132020 ?auto_132025 ) ) ( not ( = ?auto_132021 ?auto_132025 ) ) ( not ( = ?auto_132020 ?auto_132023 ) ) ( not ( = ?auto_132020 ?auto_132022 ) ) ( not ( = ?auto_132021 ?auto_132023 ) ) ( not ( = ?auto_132021 ?auto_132022 ) ) ( not ( = ?auto_132025 ?auto_132023 ) ) ( not ( = ?auto_132025 ?auto_132022 ) ) ( not ( = ?auto_132023 ?auto_132022 ) ) ( not ( = ?auto_132024 ?auto_132026 ) ) ( not ( = ?auto_132024 ?auto_132022 ) ) ( not ( = ?auto_132026 ?auto_132022 ) ) ( not ( = ?auto_132020 ?auto_132026 ) ) ( not ( = ?auto_132020 ?auto_132024 ) ) ( not ( = ?auto_132021 ?auto_132026 ) ) ( not ( = ?auto_132021 ?auto_132024 ) ) ( not ( = ?auto_132025 ?auto_132026 ) ) ( not ( = ?auto_132025 ?auto_132024 ) ) ( not ( = ?auto_132023 ?auto_132026 ) ) ( not ( = ?auto_132023 ?auto_132024 ) ) ( ON ?auto_132024 ?auto_132027 ) ( not ( = ?auto_132020 ?auto_132027 ) ) ( not ( = ?auto_132021 ?auto_132027 ) ) ( not ( = ?auto_132025 ?auto_132027 ) ) ( not ( = ?auto_132023 ?auto_132027 ) ) ( not ( = ?auto_132022 ?auto_132027 ) ) ( not ( = ?auto_132024 ?auto_132027 ) ) ( not ( = ?auto_132026 ?auto_132027 ) ) ( ON ?auto_132026 ?auto_132024 ) ( ON-TABLE ?auto_132027 ) ( ON ?auto_132022 ?auto_132026 ) ( ON ?auto_132023 ?auto_132022 ) ( ON ?auto_132025 ?auto_132023 ) ( CLEAR ?auto_132020 ) ( ON ?auto_132021 ?auto_132025 ) ( CLEAR ?auto_132021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_132027 ?auto_132024 ?auto_132026 ?auto_132022 ?auto_132023 ?auto_132025 )
      ( MAKE-2PILE ?auto_132020 ?auto_132021 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_132028 - BLOCK
      ?auto_132029 - BLOCK
    )
    :vars
    (
      ?auto_132031 - BLOCK
      ?auto_132033 - BLOCK
      ?auto_132034 - BLOCK
      ?auto_132030 - BLOCK
      ?auto_132035 - BLOCK
      ?auto_132032 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132028 ?auto_132029 ) ) ( not ( = ?auto_132028 ?auto_132031 ) ) ( not ( = ?auto_132029 ?auto_132031 ) ) ( not ( = ?auto_132028 ?auto_132033 ) ) ( not ( = ?auto_132028 ?auto_132034 ) ) ( not ( = ?auto_132029 ?auto_132033 ) ) ( not ( = ?auto_132029 ?auto_132034 ) ) ( not ( = ?auto_132031 ?auto_132033 ) ) ( not ( = ?auto_132031 ?auto_132034 ) ) ( not ( = ?auto_132033 ?auto_132034 ) ) ( not ( = ?auto_132030 ?auto_132035 ) ) ( not ( = ?auto_132030 ?auto_132034 ) ) ( not ( = ?auto_132035 ?auto_132034 ) ) ( not ( = ?auto_132028 ?auto_132035 ) ) ( not ( = ?auto_132028 ?auto_132030 ) ) ( not ( = ?auto_132029 ?auto_132035 ) ) ( not ( = ?auto_132029 ?auto_132030 ) ) ( not ( = ?auto_132031 ?auto_132035 ) ) ( not ( = ?auto_132031 ?auto_132030 ) ) ( not ( = ?auto_132033 ?auto_132035 ) ) ( not ( = ?auto_132033 ?auto_132030 ) ) ( ON ?auto_132030 ?auto_132032 ) ( not ( = ?auto_132028 ?auto_132032 ) ) ( not ( = ?auto_132029 ?auto_132032 ) ) ( not ( = ?auto_132031 ?auto_132032 ) ) ( not ( = ?auto_132033 ?auto_132032 ) ) ( not ( = ?auto_132034 ?auto_132032 ) ) ( not ( = ?auto_132030 ?auto_132032 ) ) ( not ( = ?auto_132035 ?auto_132032 ) ) ( ON ?auto_132035 ?auto_132030 ) ( ON-TABLE ?auto_132032 ) ( ON ?auto_132034 ?auto_132035 ) ( ON ?auto_132033 ?auto_132034 ) ( ON ?auto_132031 ?auto_132033 ) ( ON ?auto_132029 ?auto_132031 ) ( CLEAR ?auto_132029 ) ( HOLDING ?auto_132028 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_132028 )
      ( MAKE-2PILE ?auto_132028 ?auto_132029 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_132036 - BLOCK
      ?auto_132037 - BLOCK
    )
    :vars
    (
      ?auto_132038 - BLOCK
      ?auto_132041 - BLOCK
      ?auto_132042 - BLOCK
      ?auto_132039 - BLOCK
      ?auto_132043 - BLOCK
      ?auto_132040 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132036 ?auto_132037 ) ) ( not ( = ?auto_132036 ?auto_132038 ) ) ( not ( = ?auto_132037 ?auto_132038 ) ) ( not ( = ?auto_132036 ?auto_132041 ) ) ( not ( = ?auto_132036 ?auto_132042 ) ) ( not ( = ?auto_132037 ?auto_132041 ) ) ( not ( = ?auto_132037 ?auto_132042 ) ) ( not ( = ?auto_132038 ?auto_132041 ) ) ( not ( = ?auto_132038 ?auto_132042 ) ) ( not ( = ?auto_132041 ?auto_132042 ) ) ( not ( = ?auto_132039 ?auto_132043 ) ) ( not ( = ?auto_132039 ?auto_132042 ) ) ( not ( = ?auto_132043 ?auto_132042 ) ) ( not ( = ?auto_132036 ?auto_132043 ) ) ( not ( = ?auto_132036 ?auto_132039 ) ) ( not ( = ?auto_132037 ?auto_132043 ) ) ( not ( = ?auto_132037 ?auto_132039 ) ) ( not ( = ?auto_132038 ?auto_132043 ) ) ( not ( = ?auto_132038 ?auto_132039 ) ) ( not ( = ?auto_132041 ?auto_132043 ) ) ( not ( = ?auto_132041 ?auto_132039 ) ) ( ON ?auto_132039 ?auto_132040 ) ( not ( = ?auto_132036 ?auto_132040 ) ) ( not ( = ?auto_132037 ?auto_132040 ) ) ( not ( = ?auto_132038 ?auto_132040 ) ) ( not ( = ?auto_132041 ?auto_132040 ) ) ( not ( = ?auto_132042 ?auto_132040 ) ) ( not ( = ?auto_132039 ?auto_132040 ) ) ( not ( = ?auto_132043 ?auto_132040 ) ) ( ON ?auto_132043 ?auto_132039 ) ( ON-TABLE ?auto_132040 ) ( ON ?auto_132042 ?auto_132043 ) ( ON ?auto_132041 ?auto_132042 ) ( ON ?auto_132038 ?auto_132041 ) ( ON ?auto_132037 ?auto_132038 ) ( ON ?auto_132036 ?auto_132037 ) ( CLEAR ?auto_132036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_132040 ?auto_132039 ?auto_132043 ?auto_132042 ?auto_132041 ?auto_132038 ?auto_132037 )
      ( MAKE-2PILE ?auto_132036 ?auto_132037 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132049 - BLOCK
      ?auto_132050 - BLOCK
      ?auto_132051 - BLOCK
      ?auto_132052 - BLOCK
      ?auto_132053 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_132053 ) ( CLEAR ?auto_132052 ) ( ON-TABLE ?auto_132049 ) ( ON ?auto_132050 ?auto_132049 ) ( ON ?auto_132051 ?auto_132050 ) ( ON ?auto_132052 ?auto_132051 ) ( not ( = ?auto_132049 ?auto_132050 ) ) ( not ( = ?auto_132049 ?auto_132051 ) ) ( not ( = ?auto_132049 ?auto_132052 ) ) ( not ( = ?auto_132049 ?auto_132053 ) ) ( not ( = ?auto_132050 ?auto_132051 ) ) ( not ( = ?auto_132050 ?auto_132052 ) ) ( not ( = ?auto_132050 ?auto_132053 ) ) ( not ( = ?auto_132051 ?auto_132052 ) ) ( not ( = ?auto_132051 ?auto_132053 ) ) ( not ( = ?auto_132052 ?auto_132053 ) ) )
    :subtasks
    ( ( !STACK ?auto_132053 ?auto_132052 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132054 - BLOCK
      ?auto_132055 - BLOCK
      ?auto_132056 - BLOCK
      ?auto_132057 - BLOCK
      ?auto_132058 - BLOCK
    )
    :vars
    (
      ?auto_132059 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_132057 ) ( ON-TABLE ?auto_132054 ) ( ON ?auto_132055 ?auto_132054 ) ( ON ?auto_132056 ?auto_132055 ) ( ON ?auto_132057 ?auto_132056 ) ( not ( = ?auto_132054 ?auto_132055 ) ) ( not ( = ?auto_132054 ?auto_132056 ) ) ( not ( = ?auto_132054 ?auto_132057 ) ) ( not ( = ?auto_132054 ?auto_132058 ) ) ( not ( = ?auto_132055 ?auto_132056 ) ) ( not ( = ?auto_132055 ?auto_132057 ) ) ( not ( = ?auto_132055 ?auto_132058 ) ) ( not ( = ?auto_132056 ?auto_132057 ) ) ( not ( = ?auto_132056 ?auto_132058 ) ) ( not ( = ?auto_132057 ?auto_132058 ) ) ( ON ?auto_132058 ?auto_132059 ) ( CLEAR ?auto_132058 ) ( HAND-EMPTY ) ( not ( = ?auto_132054 ?auto_132059 ) ) ( not ( = ?auto_132055 ?auto_132059 ) ) ( not ( = ?auto_132056 ?auto_132059 ) ) ( not ( = ?auto_132057 ?auto_132059 ) ) ( not ( = ?auto_132058 ?auto_132059 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_132058 ?auto_132059 )
      ( MAKE-5PILE ?auto_132054 ?auto_132055 ?auto_132056 ?auto_132057 ?auto_132058 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132060 - BLOCK
      ?auto_132061 - BLOCK
      ?auto_132062 - BLOCK
      ?auto_132063 - BLOCK
      ?auto_132064 - BLOCK
    )
    :vars
    (
      ?auto_132065 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132060 ) ( ON ?auto_132061 ?auto_132060 ) ( ON ?auto_132062 ?auto_132061 ) ( not ( = ?auto_132060 ?auto_132061 ) ) ( not ( = ?auto_132060 ?auto_132062 ) ) ( not ( = ?auto_132060 ?auto_132063 ) ) ( not ( = ?auto_132060 ?auto_132064 ) ) ( not ( = ?auto_132061 ?auto_132062 ) ) ( not ( = ?auto_132061 ?auto_132063 ) ) ( not ( = ?auto_132061 ?auto_132064 ) ) ( not ( = ?auto_132062 ?auto_132063 ) ) ( not ( = ?auto_132062 ?auto_132064 ) ) ( not ( = ?auto_132063 ?auto_132064 ) ) ( ON ?auto_132064 ?auto_132065 ) ( CLEAR ?auto_132064 ) ( not ( = ?auto_132060 ?auto_132065 ) ) ( not ( = ?auto_132061 ?auto_132065 ) ) ( not ( = ?auto_132062 ?auto_132065 ) ) ( not ( = ?auto_132063 ?auto_132065 ) ) ( not ( = ?auto_132064 ?auto_132065 ) ) ( HOLDING ?auto_132063 ) ( CLEAR ?auto_132062 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_132060 ?auto_132061 ?auto_132062 ?auto_132063 )
      ( MAKE-5PILE ?auto_132060 ?auto_132061 ?auto_132062 ?auto_132063 ?auto_132064 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132066 - BLOCK
      ?auto_132067 - BLOCK
      ?auto_132068 - BLOCK
      ?auto_132069 - BLOCK
      ?auto_132070 - BLOCK
    )
    :vars
    (
      ?auto_132071 - BLOCK
      ?auto_132072 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132066 ) ( ON ?auto_132067 ?auto_132066 ) ( ON ?auto_132068 ?auto_132067 ) ( not ( = ?auto_132066 ?auto_132067 ) ) ( not ( = ?auto_132066 ?auto_132068 ) ) ( not ( = ?auto_132066 ?auto_132069 ) ) ( not ( = ?auto_132066 ?auto_132070 ) ) ( not ( = ?auto_132067 ?auto_132068 ) ) ( not ( = ?auto_132067 ?auto_132069 ) ) ( not ( = ?auto_132067 ?auto_132070 ) ) ( not ( = ?auto_132068 ?auto_132069 ) ) ( not ( = ?auto_132068 ?auto_132070 ) ) ( not ( = ?auto_132069 ?auto_132070 ) ) ( ON ?auto_132070 ?auto_132071 ) ( not ( = ?auto_132066 ?auto_132071 ) ) ( not ( = ?auto_132067 ?auto_132071 ) ) ( not ( = ?auto_132068 ?auto_132071 ) ) ( not ( = ?auto_132069 ?auto_132071 ) ) ( not ( = ?auto_132070 ?auto_132071 ) ) ( CLEAR ?auto_132068 ) ( ON ?auto_132069 ?auto_132070 ) ( CLEAR ?auto_132069 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_132072 ) ( ON ?auto_132071 ?auto_132072 ) ( not ( = ?auto_132072 ?auto_132071 ) ) ( not ( = ?auto_132072 ?auto_132070 ) ) ( not ( = ?auto_132072 ?auto_132069 ) ) ( not ( = ?auto_132066 ?auto_132072 ) ) ( not ( = ?auto_132067 ?auto_132072 ) ) ( not ( = ?auto_132068 ?auto_132072 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_132072 ?auto_132071 ?auto_132070 )
      ( MAKE-5PILE ?auto_132066 ?auto_132067 ?auto_132068 ?auto_132069 ?auto_132070 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132073 - BLOCK
      ?auto_132074 - BLOCK
      ?auto_132075 - BLOCK
      ?auto_132076 - BLOCK
      ?auto_132077 - BLOCK
    )
    :vars
    (
      ?auto_132079 - BLOCK
      ?auto_132078 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132073 ) ( ON ?auto_132074 ?auto_132073 ) ( not ( = ?auto_132073 ?auto_132074 ) ) ( not ( = ?auto_132073 ?auto_132075 ) ) ( not ( = ?auto_132073 ?auto_132076 ) ) ( not ( = ?auto_132073 ?auto_132077 ) ) ( not ( = ?auto_132074 ?auto_132075 ) ) ( not ( = ?auto_132074 ?auto_132076 ) ) ( not ( = ?auto_132074 ?auto_132077 ) ) ( not ( = ?auto_132075 ?auto_132076 ) ) ( not ( = ?auto_132075 ?auto_132077 ) ) ( not ( = ?auto_132076 ?auto_132077 ) ) ( ON ?auto_132077 ?auto_132079 ) ( not ( = ?auto_132073 ?auto_132079 ) ) ( not ( = ?auto_132074 ?auto_132079 ) ) ( not ( = ?auto_132075 ?auto_132079 ) ) ( not ( = ?auto_132076 ?auto_132079 ) ) ( not ( = ?auto_132077 ?auto_132079 ) ) ( ON ?auto_132076 ?auto_132077 ) ( CLEAR ?auto_132076 ) ( ON-TABLE ?auto_132078 ) ( ON ?auto_132079 ?auto_132078 ) ( not ( = ?auto_132078 ?auto_132079 ) ) ( not ( = ?auto_132078 ?auto_132077 ) ) ( not ( = ?auto_132078 ?auto_132076 ) ) ( not ( = ?auto_132073 ?auto_132078 ) ) ( not ( = ?auto_132074 ?auto_132078 ) ) ( not ( = ?auto_132075 ?auto_132078 ) ) ( HOLDING ?auto_132075 ) ( CLEAR ?auto_132074 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_132073 ?auto_132074 ?auto_132075 )
      ( MAKE-5PILE ?auto_132073 ?auto_132074 ?auto_132075 ?auto_132076 ?auto_132077 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132080 - BLOCK
      ?auto_132081 - BLOCK
      ?auto_132082 - BLOCK
      ?auto_132083 - BLOCK
      ?auto_132084 - BLOCK
    )
    :vars
    (
      ?auto_132085 - BLOCK
      ?auto_132086 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132080 ) ( ON ?auto_132081 ?auto_132080 ) ( not ( = ?auto_132080 ?auto_132081 ) ) ( not ( = ?auto_132080 ?auto_132082 ) ) ( not ( = ?auto_132080 ?auto_132083 ) ) ( not ( = ?auto_132080 ?auto_132084 ) ) ( not ( = ?auto_132081 ?auto_132082 ) ) ( not ( = ?auto_132081 ?auto_132083 ) ) ( not ( = ?auto_132081 ?auto_132084 ) ) ( not ( = ?auto_132082 ?auto_132083 ) ) ( not ( = ?auto_132082 ?auto_132084 ) ) ( not ( = ?auto_132083 ?auto_132084 ) ) ( ON ?auto_132084 ?auto_132085 ) ( not ( = ?auto_132080 ?auto_132085 ) ) ( not ( = ?auto_132081 ?auto_132085 ) ) ( not ( = ?auto_132082 ?auto_132085 ) ) ( not ( = ?auto_132083 ?auto_132085 ) ) ( not ( = ?auto_132084 ?auto_132085 ) ) ( ON ?auto_132083 ?auto_132084 ) ( ON-TABLE ?auto_132086 ) ( ON ?auto_132085 ?auto_132086 ) ( not ( = ?auto_132086 ?auto_132085 ) ) ( not ( = ?auto_132086 ?auto_132084 ) ) ( not ( = ?auto_132086 ?auto_132083 ) ) ( not ( = ?auto_132080 ?auto_132086 ) ) ( not ( = ?auto_132081 ?auto_132086 ) ) ( not ( = ?auto_132082 ?auto_132086 ) ) ( CLEAR ?auto_132081 ) ( ON ?auto_132082 ?auto_132083 ) ( CLEAR ?auto_132082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_132086 ?auto_132085 ?auto_132084 ?auto_132083 )
      ( MAKE-5PILE ?auto_132080 ?auto_132081 ?auto_132082 ?auto_132083 ?auto_132084 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132087 - BLOCK
      ?auto_132088 - BLOCK
      ?auto_132089 - BLOCK
      ?auto_132090 - BLOCK
      ?auto_132091 - BLOCK
    )
    :vars
    (
      ?auto_132093 - BLOCK
      ?auto_132092 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132087 ) ( not ( = ?auto_132087 ?auto_132088 ) ) ( not ( = ?auto_132087 ?auto_132089 ) ) ( not ( = ?auto_132087 ?auto_132090 ) ) ( not ( = ?auto_132087 ?auto_132091 ) ) ( not ( = ?auto_132088 ?auto_132089 ) ) ( not ( = ?auto_132088 ?auto_132090 ) ) ( not ( = ?auto_132088 ?auto_132091 ) ) ( not ( = ?auto_132089 ?auto_132090 ) ) ( not ( = ?auto_132089 ?auto_132091 ) ) ( not ( = ?auto_132090 ?auto_132091 ) ) ( ON ?auto_132091 ?auto_132093 ) ( not ( = ?auto_132087 ?auto_132093 ) ) ( not ( = ?auto_132088 ?auto_132093 ) ) ( not ( = ?auto_132089 ?auto_132093 ) ) ( not ( = ?auto_132090 ?auto_132093 ) ) ( not ( = ?auto_132091 ?auto_132093 ) ) ( ON ?auto_132090 ?auto_132091 ) ( ON-TABLE ?auto_132092 ) ( ON ?auto_132093 ?auto_132092 ) ( not ( = ?auto_132092 ?auto_132093 ) ) ( not ( = ?auto_132092 ?auto_132091 ) ) ( not ( = ?auto_132092 ?auto_132090 ) ) ( not ( = ?auto_132087 ?auto_132092 ) ) ( not ( = ?auto_132088 ?auto_132092 ) ) ( not ( = ?auto_132089 ?auto_132092 ) ) ( ON ?auto_132089 ?auto_132090 ) ( CLEAR ?auto_132089 ) ( HOLDING ?auto_132088 ) ( CLEAR ?auto_132087 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_132087 ?auto_132088 )
      ( MAKE-5PILE ?auto_132087 ?auto_132088 ?auto_132089 ?auto_132090 ?auto_132091 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132094 - BLOCK
      ?auto_132095 - BLOCK
      ?auto_132096 - BLOCK
      ?auto_132097 - BLOCK
      ?auto_132098 - BLOCK
    )
    :vars
    (
      ?auto_132099 - BLOCK
      ?auto_132100 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132094 ) ( not ( = ?auto_132094 ?auto_132095 ) ) ( not ( = ?auto_132094 ?auto_132096 ) ) ( not ( = ?auto_132094 ?auto_132097 ) ) ( not ( = ?auto_132094 ?auto_132098 ) ) ( not ( = ?auto_132095 ?auto_132096 ) ) ( not ( = ?auto_132095 ?auto_132097 ) ) ( not ( = ?auto_132095 ?auto_132098 ) ) ( not ( = ?auto_132096 ?auto_132097 ) ) ( not ( = ?auto_132096 ?auto_132098 ) ) ( not ( = ?auto_132097 ?auto_132098 ) ) ( ON ?auto_132098 ?auto_132099 ) ( not ( = ?auto_132094 ?auto_132099 ) ) ( not ( = ?auto_132095 ?auto_132099 ) ) ( not ( = ?auto_132096 ?auto_132099 ) ) ( not ( = ?auto_132097 ?auto_132099 ) ) ( not ( = ?auto_132098 ?auto_132099 ) ) ( ON ?auto_132097 ?auto_132098 ) ( ON-TABLE ?auto_132100 ) ( ON ?auto_132099 ?auto_132100 ) ( not ( = ?auto_132100 ?auto_132099 ) ) ( not ( = ?auto_132100 ?auto_132098 ) ) ( not ( = ?auto_132100 ?auto_132097 ) ) ( not ( = ?auto_132094 ?auto_132100 ) ) ( not ( = ?auto_132095 ?auto_132100 ) ) ( not ( = ?auto_132096 ?auto_132100 ) ) ( ON ?auto_132096 ?auto_132097 ) ( CLEAR ?auto_132094 ) ( ON ?auto_132095 ?auto_132096 ) ( CLEAR ?auto_132095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_132100 ?auto_132099 ?auto_132098 ?auto_132097 ?auto_132096 )
      ( MAKE-5PILE ?auto_132094 ?auto_132095 ?auto_132096 ?auto_132097 ?auto_132098 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132101 - BLOCK
      ?auto_132102 - BLOCK
      ?auto_132103 - BLOCK
      ?auto_132104 - BLOCK
      ?auto_132105 - BLOCK
    )
    :vars
    (
      ?auto_132107 - BLOCK
      ?auto_132106 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132101 ?auto_132102 ) ) ( not ( = ?auto_132101 ?auto_132103 ) ) ( not ( = ?auto_132101 ?auto_132104 ) ) ( not ( = ?auto_132101 ?auto_132105 ) ) ( not ( = ?auto_132102 ?auto_132103 ) ) ( not ( = ?auto_132102 ?auto_132104 ) ) ( not ( = ?auto_132102 ?auto_132105 ) ) ( not ( = ?auto_132103 ?auto_132104 ) ) ( not ( = ?auto_132103 ?auto_132105 ) ) ( not ( = ?auto_132104 ?auto_132105 ) ) ( ON ?auto_132105 ?auto_132107 ) ( not ( = ?auto_132101 ?auto_132107 ) ) ( not ( = ?auto_132102 ?auto_132107 ) ) ( not ( = ?auto_132103 ?auto_132107 ) ) ( not ( = ?auto_132104 ?auto_132107 ) ) ( not ( = ?auto_132105 ?auto_132107 ) ) ( ON ?auto_132104 ?auto_132105 ) ( ON-TABLE ?auto_132106 ) ( ON ?auto_132107 ?auto_132106 ) ( not ( = ?auto_132106 ?auto_132107 ) ) ( not ( = ?auto_132106 ?auto_132105 ) ) ( not ( = ?auto_132106 ?auto_132104 ) ) ( not ( = ?auto_132101 ?auto_132106 ) ) ( not ( = ?auto_132102 ?auto_132106 ) ) ( not ( = ?auto_132103 ?auto_132106 ) ) ( ON ?auto_132103 ?auto_132104 ) ( ON ?auto_132102 ?auto_132103 ) ( CLEAR ?auto_132102 ) ( HOLDING ?auto_132101 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_132101 )
      ( MAKE-5PILE ?auto_132101 ?auto_132102 ?auto_132103 ?auto_132104 ?auto_132105 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132108 - BLOCK
      ?auto_132109 - BLOCK
      ?auto_132110 - BLOCK
      ?auto_132111 - BLOCK
      ?auto_132112 - BLOCK
    )
    :vars
    (
      ?auto_132113 - BLOCK
      ?auto_132114 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132108 ?auto_132109 ) ) ( not ( = ?auto_132108 ?auto_132110 ) ) ( not ( = ?auto_132108 ?auto_132111 ) ) ( not ( = ?auto_132108 ?auto_132112 ) ) ( not ( = ?auto_132109 ?auto_132110 ) ) ( not ( = ?auto_132109 ?auto_132111 ) ) ( not ( = ?auto_132109 ?auto_132112 ) ) ( not ( = ?auto_132110 ?auto_132111 ) ) ( not ( = ?auto_132110 ?auto_132112 ) ) ( not ( = ?auto_132111 ?auto_132112 ) ) ( ON ?auto_132112 ?auto_132113 ) ( not ( = ?auto_132108 ?auto_132113 ) ) ( not ( = ?auto_132109 ?auto_132113 ) ) ( not ( = ?auto_132110 ?auto_132113 ) ) ( not ( = ?auto_132111 ?auto_132113 ) ) ( not ( = ?auto_132112 ?auto_132113 ) ) ( ON ?auto_132111 ?auto_132112 ) ( ON-TABLE ?auto_132114 ) ( ON ?auto_132113 ?auto_132114 ) ( not ( = ?auto_132114 ?auto_132113 ) ) ( not ( = ?auto_132114 ?auto_132112 ) ) ( not ( = ?auto_132114 ?auto_132111 ) ) ( not ( = ?auto_132108 ?auto_132114 ) ) ( not ( = ?auto_132109 ?auto_132114 ) ) ( not ( = ?auto_132110 ?auto_132114 ) ) ( ON ?auto_132110 ?auto_132111 ) ( ON ?auto_132109 ?auto_132110 ) ( ON ?auto_132108 ?auto_132109 ) ( CLEAR ?auto_132108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_132114 ?auto_132113 ?auto_132112 ?auto_132111 ?auto_132110 ?auto_132109 )
      ( MAKE-5PILE ?auto_132108 ?auto_132109 ?auto_132110 ?auto_132111 ?auto_132112 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132115 - BLOCK
      ?auto_132116 - BLOCK
      ?auto_132117 - BLOCK
      ?auto_132118 - BLOCK
      ?auto_132119 - BLOCK
    )
    :vars
    (
      ?auto_132120 - BLOCK
      ?auto_132121 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132115 ?auto_132116 ) ) ( not ( = ?auto_132115 ?auto_132117 ) ) ( not ( = ?auto_132115 ?auto_132118 ) ) ( not ( = ?auto_132115 ?auto_132119 ) ) ( not ( = ?auto_132116 ?auto_132117 ) ) ( not ( = ?auto_132116 ?auto_132118 ) ) ( not ( = ?auto_132116 ?auto_132119 ) ) ( not ( = ?auto_132117 ?auto_132118 ) ) ( not ( = ?auto_132117 ?auto_132119 ) ) ( not ( = ?auto_132118 ?auto_132119 ) ) ( ON ?auto_132119 ?auto_132120 ) ( not ( = ?auto_132115 ?auto_132120 ) ) ( not ( = ?auto_132116 ?auto_132120 ) ) ( not ( = ?auto_132117 ?auto_132120 ) ) ( not ( = ?auto_132118 ?auto_132120 ) ) ( not ( = ?auto_132119 ?auto_132120 ) ) ( ON ?auto_132118 ?auto_132119 ) ( ON-TABLE ?auto_132121 ) ( ON ?auto_132120 ?auto_132121 ) ( not ( = ?auto_132121 ?auto_132120 ) ) ( not ( = ?auto_132121 ?auto_132119 ) ) ( not ( = ?auto_132121 ?auto_132118 ) ) ( not ( = ?auto_132115 ?auto_132121 ) ) ( not ( = ?auto_132116 ?auto_132121 ) ) ( not ( = ?auto_132117 ?auto_132121 ) ) ( ON ?auto_132117 ?auto_132118 ) ( ON ?auto_132116 ?auto_132117 ) ( HOLDING ?auto_132115 ) ( CLEAR ?auto_132116 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_132121 ?auto_132120 ?auto_132119 ?auto_132118 ?auto_132117 ?auto_132116 ?auto_132115 )
      ( MAKE-5PILE ?auto_132115 ?auto_132116 ?auto_132117 ?auto_132118 ?auto_132119 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132122 - BLOCK
      ?auto_132123 - BLOCK
      ?auto_132124 - BLOCK
      ?auto_132125 - BLOCK
      ?auto_132126 - BLOCK
    )
    :vars
    (
      ?auto_132127 - BLOCK
      ?auto_132128 - BLOCK
      ?auto_132129 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132122 ?auto_132123 ) ) ( not ( = ?auto_132122 ?auto_132124 ) ) ( not ( = ?auto_132122 ?auto_132125 ) ) ( not ( = ?auto_132122 ?auto_132126 ) ) ( not ( = ?auto_132123 ?auto_132124 ) ) ( not ( = ?auto_132123 ?auto_132125 ) ) ( not ( = ?auto_132123 ?auto_132126 ) ) ( not ( = ?auto_132124 ?auto_132125 ) ) ( not ( = ?auto_132124 ?auto_132126 ) ) ( not ( = ?auto_132125 ?auto_132126 ) ) ( ON ?auto_132126 ?auto_132127 ) ( not ( = ?auto_132122 ?auto_132127 ) ) ( not ( = ?auto_132123 ?auto_132127 ) ) ( not ( = ?auto_132124 ?auto_132127 ) ) ( not ( = ?auto_132125 ?auto_132127 ) ) ( not ( = ?auto_132126 ?auto_132127 ) ) ( ON ?auto_132125 ?auto_132126 ) ( ON-TABLE ?auto_132128 ) ( ON ?auto_132127 ?auto_132128 ) ( not ( = ?auto_132128 ?auto_132127 ) ) ( not ( = ?auto_132128 ?auto_132126 ) ) ( not ( = ?auto_132128 ?auto_132125 ) ) ( not ( = ?auto_132122 ?auto_132128 ) ) ( not ( = ?auto_132123 ?auto_132128 ) ) ( not ( = ?auto_132124 ?auto_132128 ) ) ( ON ?auto_132124 ?auto_132125 ) ( ON ?auto_132123 ?auto_132124 ) ( CLEAR ?auto_132123 ) ( ON ?auto_132122 ?auto_132129 ) ( CLEAR ?auto_132122 ) ( HAND-EMPTY ) ( not ( = ?auto_132122 ?auto_132129 ) ) ( not ( = ?auto_132123 ?auto_132129 ) ) ( not ( = ?auto_132124 ?auto_132129 ) ) ( not ( = ?auto_132125 ?auto_132129 ) ) ( not ( = ?auto_132126 ?auto_132129 ) ) ( not ( = ?auto_132127 ?auto_132129 ) ) ( not ( = ?auto_132128 ?auto_132129 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_132122 ?auto_132129 )
      ( MAKE-5PILE ?auto_132122 ?auto_132123 ?auto_132124 ?auto_132125 ?auto_132126 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132130 - BLOCK
      ?auto_132131 - BLOCK
      ?auto_132132 - BLOCK
      ?auto_132133 - BLOCK
      ?auto_132134 - BLOCK
    )
    :vars
    (
      ?auto_132137 - BLOCK
      ?auto_132136 - BLOCK
      ?auto_132135 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132130 ?auto_132131 ) ) ( not ( = ?auto_132130 ?auto_132132 ) ) ( not ( = ?auto_132130 ?auto_132133 ) ) ( not ( = ?auto_132130 ?auto_132134 ) ) ( not ( = ?auto_132131 ?auto_132132 ) ) ( not ( = ?auto_132131 ?auto_132133 ) ) ( not ( = ?auto_132131 ?auto_132134 ) ) ( not ( = ?auto_132132 ?auto_132133 ) ) ( not ( = ?auto_132132 ?auto_132134 ) ) ( not ( = ?auto_132133 ?auto_132134 ) ) ( ON ?auto_132134 ?auto_132137 ) ( not ( = ?auto_132130 ?auto_132137 ) ) ( not ( = ?auto_132131 ?auto_132137 ) ) ( not ( = ?auto_132132 ?auto_132137 ) ) ( not ( = ?auto_132133 ?auto_132137 ) ) ( not ( = ?auto_132134 ?auto_132137 ) ) ( ON ?auto_132133 ?auto_132134 ) ( ON-TABLE ?auto_132136 ) ( ON ?auto_132137 ?auto_132136 ) ( not ( = ?auto_132136 ?auto_132137 ) ) ( not ( = ?auto_132136 ?auto_132134 ) ) ( not ( = ?auto_132136 ?auto_132133 ) ) ( not ( = ?auto_132130 ?auto_132136 ) ) ( not ( = ?auto_132131 ?auto_132136 ) ) ( not ( = ?auto_132132 ?auto_132136 ) ) ( ON ?auto_132132 ?auto_132133 ) ( ON ?auto_132130 ?auto_132135 ) ( CLEAR ?auto_132130 ) ( not ( = ?auto_132130 ?auto_132135 ) ) ( not ( = ?auto_132131 ?auto_132135 ) ) ( not ( = ?auto_132132 ?auto_132135 ) ) ( not ( = ?auto_132133 ?auto_132135 ) ) ( not ( = ?auto_132134 ?auto_132135 ) ) ( not ( = ?auto_132137 ?auto_132135 ) ) ( not ( = ?auto_132136 ?auto_132135 ) ) ( HOLDING ?auto_132131 ) ( CLEAR ?auto_132132 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_132136 ?auto_132137 ?auto_132134 ?auto_132133 ?auto_132132 ?auto_132131 )
      ( MAKE-5PILE ?auto_132130 ?auto_132131 ?auto_132132 ?auto_132133 ?auto_132134 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132138 - BLOCK
      ?auto_132139 - BLOCK
      ?auto_132140 - BLOCK
      ?auto_132141 - BLOCK
      ?auto_132142 - BLOCK
    )
    :vars
    (
      ?auto_132144 - BLOCK
      ?auto_132145 - BLOCK
      ?auto_132143 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132138 ?auto_132139 ) ) ( not ( = ?auto_132138 ?auto_132140 ) ) ( not ( = ?auto_132138 ?auto_132141 ) ) ( not ( = ?auto_132138 ?auto_132142 ) ) ( not ( = ?auto_132139 ?auto_132140 ) ) ( not ( = ?auto_132139 ?auto_132141 ) ) ( not ( = ?auto_132139 ?auto_132142 ) ) ( not ( = ?auto_132140 ?auto_132141 ) ) ( not ( = ?auto_132140 ?auto_132142 ) ) ( not ( = ?auto_132141 ?auto_132142 ) ) ( ON ?auto_132142 ?auto_132144 ) ( not ( = ?auto_132138 ?auto_132144 ) ) ( not ( = ?auto_132139 ?auto_132144 ) ) ( not ( = ?auto_132140 ?auto_132144 ) ) ( not ( = ?auto_132141 ?auto_132144 ) ) ( not ( = ?auto_132142 ?auto_132144 ) ) ( ON ?auto_132141 ?auto_132142 ) ( ON-TABLE ?auto_132145 ) ( ON ?auto_132144 ?auto_132145 ) ( not ( = ?auto_132145 ?auto_132144 ) ) ( not ( = ?auto_132145 ?auto_132142 ) ) ( not ( = ?auto_132145 ?auto_132141 ) ) ( not ( = ?auto_132138 ?auto_132145 ) ) ( not ( = ?auto_132139 ?auto_132145 ) ) ( not ( = ?auto_132140 ?auto_132145 ) ) ( ON ?auto_132140 ?auto_132141 ) ( ON ?auto_132138 ?auto_132143 ) ( not ( = ?auto_132138 ?auto_132143 ) ) ( not ( = ?auto_132139 ?auto_132143 ) ) ( not ( = ?auto_132140 ?auto_132143 ) ) ( not ( = ?auto_132141 ?auto_132143 ) ) ( not ( = ?auto_132142 ?auto_132143 ) ) ( not ( = ?auto_132144 ?auto_132143 ) ) ( not ( = ?auto_132145 ?auto_132143 ) ) ( CLEAR ?auto_132140 ) ( ON ?auto_132139 ?auto_132138 ) ( CLEAR ?auto_132139 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_132143 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_132143 ?auto_132138 )
      ( MAKE-5PILE ?auto_132138 ?auto_132139 ?auto_132140 ?auto_132141 ?auto_132142 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132146 - BLOCK
      ?auto_132147 - BLOCK
      ?auto_132148 - BLOCK
      ?auto_132149 - BLOCK
      ?auto_132150 - BLOCK
    )
    :vars
    (
      ?auto_132153 - BLOCK
      ?auto_132152 - BLOCK
      ?auto_132151 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132146 ?auto_132147 ) ) ( not ( = ?auto_132146 ?auto_132148 ) ) ( not ( = ?auto_132146 ?auto_132149 ) ) ( not ( = ?auto_132146 ?auto_132150 ) ) ( not ( = ?auto_132147 ?auto_132148 ) ) ( not ( = ?auto_132147 ?auto_132149 ) ) ( not ( = ?auto_132147 ?auto_132150 ) ) ( not ( = ?auto_132148 ?auto_132149 ) ) ( not ( = ?auto_132148 ?auto_132150 ) ) ( not ( = ?auto_132149 ?auto_132150 ) ) ( ON ?auto_132150 ?auto_132153 ) ( not ( = ?auto_132146 ?auto_132153 ) ) ( not ( = ?auto_132147 ?auto_132153 ) ) ( not ( = ?auto_132148 ?auto_132153 ) ) ( not ( = ?auto_132149 ?auto_132153 ) ) ( not ( = ?auto_132150 ?auto_132153 ) ) ( ON ?auto_132149 ?auto_132150 ) ( ON-TABLE ?auto_132152 ) ( ON ?auto_132153 ?auto_132152 ) ( not ( = ?auto_132152 ?auto_132153 ) ) ( not ( = ?auto_132152 ?auto_132150 ) ) ( not ( = ?auto_132152 ?auto_132149 ) ) ( not ( = ?auto_132146 ?auto_132152 ) ) ( not ( = ?auto_132147 ?auto_132152 ) ) ( not ( = ?auto_132148 ?auto_132152 ) ) ( ON ?auto_132146 ?auto_132151 ) ( not ( = ?auto_132146 ?auto_132151 ) ) ( not ( = ?auto_132147 ?auto_132151 ) ) ( not ( = ?auto_132148 ?auto_132151 ) ) ( not ( = ?auto_132149 ?auto_132151 ) ) ( not ( = ?auto_132150 ?auto_132151 ) ) ( not ( = ?auto_132153 ?auto_132151 ) ) ( not ( = ?auto_132152 ?auto_132151 ) ) ( ON ?auto_132147 ?auto_132146 ) ( CLEAR ?auto_132147 ) ( ON-TABLE ?auto_132151 ) ( HOLDING ?auto_132148 ) ( CLEAR ?auto_132149 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_132152 ?auto_132153 ?auto_132150 ?auto_132149 ?auto_132148 )
      ( MAKE-5PILE ?auto_132146 ?auto_132147 ?auto_132148 ?auto_132149 ?auto_132150 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132154 - BLOCK
      ?auto_132155 - BLOCK
      ?auto_132156 - BLOCK
      ?auto_132157 - BLOCK
      ?auto_132158 - BLOCK
    )
    :vars
    (
      ?auto_132161 - BLOCK
      ?auto_132159 - BLOCK
      ?auto_132160 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132154 ?auto_132155 ) ) ( not ( = ?auto_132154 ?auto_132156 ) ) ( not ( = ?auto_132154 ?auto_132157 ) ) ( not ( = ?auto_132154 ?auto_132158 ) ) ( not ( = ?auto_132155 ?auto_132156 ) ) ( not ( = ?auto_132155 ?auto_132157 ) ) ( not ( = ?auto_132155 ?auto_132158 ) ) ( not ( = ?auto_132156 ?auto_132157 ) ) ( not ( = ?auto_132156 ?auto_132158 ) ) ( not ( = ?auto_132157 ?auto_132158 ) ) ( ON ?auto_132158 ?auto_132161 ) ( not ( = ?auto_132154 ?auto_132161 ) ) ( not ( = ?auto_132155 ?auto_132161 ) ) ( not ( = ?auto_132156 ?auto_132161 ) ) ( not ( = ?auto_132157 ?auto_132161 ) ) ( not ( = ?auto_132158 ?auto_132161 ) ) ( ON ?auto_132157 ?auto_132158 ) ( ON-TABLE ?auto_132159 ) ( ON ?auto_132161 ?auto_132159 ) ( not ( = ?auto_132159 ?auto_132161 ) ) ( not ( = ?auto_132159 ?auto_132158 ) ) ( not ( = ?auto_132159 ?auto_132157 ) ) ( not ( = ?auto_132154 ?auto_132159 ) ) ( not ( = ?auto_132155 ?auto_132159 ) ) ( not ( = ?auto_132156 ?auto_132159 ) ) ( ON ?auto_132154 ?auto_132160 ) ( not ( = ?auto_132154 ?auto_132160 ) ) ( not ( = ?auto_132155 ?auto_132160 ) ) ( not ( = ?auto_132156 ?auto_132160 ) ) ( not ( = ?auto_132157 ?auto_132160 ) ) ( not ( = ?auto_132158 ?auto_132160 ) ) ( not ( = ?auto_132161 ?auto_132160 ) ) ( not ( = ?auto_132159 ?auto_132160 ) ) ( ON ?auto_132155 ?auto_132154 ) ( ON-TABLE ?auto_132160 ) ( CLEAR ?auto_132157 ) ( ON ?auto_132156 ?auto_132155 ) ( CLEAR ?auto_132156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_132160 ?auto_132154 ?auto_132155 )
      ( MAKE-5PILE ?auto_132154 ?auto_132155 ?auto_132156 ?auto_132157 ?auto_132158 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132162 - BLOCK
      ?auto_132163 - BLOCK
      ?auto_132164 - BLOCK
      ?auto_132165 - BLOCK
      ?auto_132166 - BLOCK
    )
    :vars
    (
      ?auto_132167 - BLOCK
      ?auto_132169 - BLOCK
      ?auto_132168 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132162 ?auto_132163 ) ) ( not ( = ?auto_132162 ?auto_132164 ) ) ( not ( = ?auto_132162 ?auto_132165 ) ) ( not ( = ?auto_132162 ?auto_132166 ) ) ( not ( = ?auto_132163 ?auto_132164 ) ) ( not ( = ?auto_132163 ?auto_132165 ) ) ( not ( = ?auto_132163 ?auto_132166 ) ) ( not ( = ?auto_132164 ?auto_132165 ) ) ( not ( = ?auto_132164 ?auto_132166 ) ) ( not ( = ?auto_132165 ?auto_132166 ) ) ( ON ?auto_132166 ?auto_132167 ) ( not ( = ?auto_132162 ?auto_132167 ) ) ( not ( = ?auto_132163 ?auto_132167 ) ) ( not ( = ?auto_132164 ?auto_132167 ) ) ( not ( = ?auto_132165 ?auto_132167 ) ) ( not ( = ?auto_132166 ?auto_132167 ) ) ( ON-TABLE ?auto_132169 ) ( ON ?auto_132167 ?auto_132169 ) ( not ( = ?auto_132169 ?auto_132167 ) ) ( not ( = ?auto_132169 ?auto_132166 ) ) ( not ( = ?auto_132169 ?auto_132165 ) ) ( not ( = ?auto_132162 ?auto_132169 ) ) ( not ( = ?auto_132163 ?auto_132169 ) ) ( not ( = ?auto_132164 ?auto_132169 ) ) ( ON ?auto_132162 ?auto_132168 ) ( not ( = ?auto_132162 ?auto_132168 ) ) ( not ( = ?auto_132163 ?auto_132168 ) ) ( not ( = ?auto_132164 ?auto_132168 ) ) ( not ( = ?auto_132165 ?auto_132168 ) ) ( not ( = ?auto_132166 ?auto_132168 ) ) ( not ( = ?auto_132167 ?auto_132168 ) ) ( not ( = ?auto_132169 ?auto_132168 ) ) ( ON ?auto_132163 ?auto_132162 ) ( ON-TABLE ?auto_132168 ) ( ON ?auto_132164 ?auto_132163 ) ( CLEAR ?auto_132164 ) ( HOLDING ?auto_132165 ) ( CLEAR ?auto_132166 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_132169 ?auto_132167 ?auto_132166 ?auto_132165 )
      ( MAKE-5PILE ?auto_132162 ?auto_132163 ?auto_132164 ?auto_132165 ?auto_132166 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132170 - BLOCK
      ?auto_132171 - BLOCK
      ?auto_132172 - BLOCK
      ?auto_132173 - BLOCK
      ?auto_132174 - BLOCK
    )
    :vars
    (
      ?auto_132176 - BLOCK
      ?auto_132177 - BLOCK
      ?auto_132175 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132170 ?auto_132171 ) ) ( not ( = ?auto_132170 ?auto_132172 ) ) ( not ( = ?auto_132170 ?auto_132173 ) ) ( not ( = ?auto_132170 ?auto_132174 ) ) ( not ( = ?auto_132171 ?auto_132172 ) ) ( not ( = ?auto_132171 ?auto_132173 ) ) ( not ( = ?auto_132171 ?auto_132174 ) ) ( not ( = ?auto_132172 ?auto_132173 ) ) ( not ( = ?auto_132172 ?auto_132174 ) ) ( not ( = ?auto_132173 ?auto_132174 ) ) ( ON ?auto_132174 ?auto_132176 ) ( not ( = ?auto_132170 ?auto_132176 ) ) ( not ( = ?auto_132171 ?auto_132176 ) ) ( not ( = ?auto_132172 ?auto_132176 ) ) ( not ( = ?auto_132173 ?auto_132176 ) ) ( not ( = ?auto_132174 ?auto_132176 ) ) ( ON-TABLE ?auto_132177 ) ( ON ?auto_132176 ?auto_132177 ) ( not ( = ?auto_132177 ?auto_132176 ) ) ( not ( = ?auto_132177 ?auto_132174 ) ) ( not ( = ?auto_132177 ?auto_132173 ) ) ( not ( = ?auto_132170 ?auto_132177 ) ) ( not ( = ?auto_132171 ?auto_132177 ) ) ( not ( = ?auto_132172 ?auto_132177 ) ) ( ON ?auto_132170 ?auto_132175 ) ( not ( = ?auto_132170 ?auto_132175 ) ) ( not ( = ?auto_132171 ?auto_132175 ) ) ( not ( = ?auto_132172 ?auto_132175 ) ) ( not ( = ?auto_132173 ?auto_132175 ) ) ( not ( = ?auto_132174 ?auto_132175 ) ) ( not ( = ?auto_132176 ?auto_132175 ) ) ( not ( = ?auto_132177 ?auto_132175 ) ) ( ON ?auto_132171 ?auto_132170 ) ( ON-TABLE ?auto_132175 ) ( ON ?auto_132172 ?auto_132171 ) ( CLEAR ?auto_132174 ) ( ON ?auto_132173 ?auto_132172 ) ( CLEAR ?auto_132173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_132175 ?auto_132170 ?auto_132171 ?auto_132172 )
      ( MAKE-5PILE ?auto_132170 ?auto_132171 ?auto_132172 ?auto_132173 ?auto_132174 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132178 - BLOCK
      ?auto_132179 - BLOCK
      ?auto_132180 - BLOCK
      ?auto_132181 - BLOCK
      ?auto_132182 - BLOCK
    )
    :vars
    (
      ?auto_132183 - BLOCK
      ?auto_132184 - BLOCK
      ?auto_132185 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132178 ?auto_132179 ) ) ( not ( = ?auto_132178 ?auto_132180 ) ) ( not ( = ?auto_132178 ?auto_132181 ) ) ( not ( = ?auto_132178 ?auto_132182 ) ) ( not ( = ?auto_132179 ?auto_132180 ) ) ( not ( = ?auto_132179 ?auto_132181 ) ) ( not ( = ?auto_132179 ?auto_132182 ) ) ( not ( = ?auto_132180 ?auto_132181 ) ) ( not ( = ?auto_132180 ?auto_132182 ) ) ( not ( = ?auto_132181 ?auto_132182 ) ) ( not ( = ?auto_132178 ?auto_132183 ) ) ( not ( = ?auto_132179 ?auto_132183 ) ) ( not ( = ?auto_132180 ?auto_132183 ) ) ( not ( = ?auto_132181 ?auto_132183 ) ) ( not ( = ?auto_132182 ?auto_132183 ) ) ( ON-TABLE ?auto_132184 ) ( ON ?auto_132183 ?auto_132184 ) ( not ( = ?auto_132184 ?auto_132183 ) ) ( not ( = ?auto_132184 ?auto_132182 ) ) ( not ( = ?auto_132184 ?auto_132181 ) ) ( not ( = ?auto_132178 ?auto_132184 ) ) ( not ( = ?auto_132179 ?auto_132184 ) ) ( not ( = ?auto_132180 ?auto_132184 ) ) ( ON ?auto_132178 ?auto_132185 ) ( not ( = ?auto_132178 ?auto_132185 ) ) ( not ( = ?auto_132179 ?auto_132185 ) ) ( not ( = ?auto_132180 ?auto_132185 ) ) ( not ( = ?auto_132181 ?auto_132185 ) ) ( not ( = ?auto_132182 ?auto_132185 ) ) ( not ( = ?auto_132183 ?auto_132185 ) ) ( not ( = ?auto_132184 ?auto_132185 ) ) ( ON ?auto_132179 ?auto_132178 ) ( ON-TABLE ?auto_132185 ) ( ON ?auto_132180 ?auto_132179 ) ( ON ?auto_132181 ?auto_132180 ) ( CLEAR ?auto_132181 ) ( HOLDING ?auto_132182 ) ( CLEAR ?auto_132183 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_132184 ?auto_132183 ?auto_132182 )
      ( MAKE-5PILE ?auto_132178 ?auto_132179 ?auto_132180 ?auto_132181 ?auto_132182 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132186 - BLOCK
      ?auto_132187 - BLOCK
      ?auto_132188 - BLOCK
      ?auto_132189 - BLOCK
      ?auto_132190 - BLOCK
    )
    :vars
    (
      ?auto_132192 - BLOCK
      ?auto_132191 - BLOCK
      ?auto_132193 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132186 ?auto_132187 ) ) ( not ( = ?auto_132186 ?auto_132188 ) ) ( not ( = ?auto_132186 ?auto_132189 ) ) ( not ( = ?auto_132186 ?auto_132190 ) ) ( not ( = ?auto_132187 ?auto_132188 ) ) ( not ( = ?auto_132187 ?auto_132189 ) ) ( not ( = ?auto_132187 ?auto_132190 ) ) ( not ( = ?auto_132188 ?auto_132189 ) ) ( not ( = ?auto_132188 ?auto_132190 ) ) ( not ( = ?auto_132189 ?auto_132190 ) ) ( not ( = ?auto_132186 ?auto_132192 ) ) ( not ( = ?auto_132187 ?auto_132192 ) ) ( not ( = ?auto_132188 ?auto_132192 ) ) ( not ( = ?auto_132189 ?auto_132192 ) ) ( not ( = ?auto_132190 ?auto_132192 ) ) ( ON-TABLE ?auto_132191 ) ( ON ?auto_132192 ?auto_132191 ) ( not ( = ?auto_132191 ?auto_132192 ) ) ( not ( = ?auto_132191 ?auto_132190 ) ) ( not ( = ?auto_132191 ?auto_132189 ) ) ( not ( = ?auto_132186 ?auto_132191 ) ) ( not ( = ?auto_132187 ?auto_132191 ) ) ( not ( = ?auto_132188 ?auto_132191 ) ) ( ON ?auto_132186 ?auto_132193 ) ( not ( = ?auto_132186 ?auto_132193 ) ) ( not ( = ?auto_132187 ?auto_132193 ) ) ( not ( = ?auto_132188 ?auto_132193 ) ) ( not ( = ?auto_132189 ?auto_132193 ) ) ( not ( = ?auto_132190 ?auto_132193 ) ) ( not ( = ?auto_132192 ?auto_132193 ) ) ( not ( = ?auto_132191 ?auto_132193 ) ) ( ON ?auto_132187 ?auto_132186 ) ( ON-TABLE ?auto_132193 ) ( ON ?auto_132188 ?auto_132187 ) ( ON ?auto_132189 ?auto_132188 ) ( CLEAR ?auto_132192 ) ( ON ?auto_132190 ?auto_132189 ) ( CLEAR ?auto_132190 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_132193 ?auto_132186 ?auto_132187 ?auto_132188 ?auto_132189 )
      ( MAKE-5PILE ?auto_132186 ?auto_132187 ?auto_132188 ?auto_132189 ?auto_132190 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132194 - BLOCK
      ?auto_132195 - BLOCK
      ?auto_132196 - BLOCK
      ?auto_132197 - BLOCK
      ?auto_132198 - BLOCK
    )
    :vars
    (
      ?auto_132199 - BLOCK
      ?auto_132200 - BLOCK
      ?auto_132201 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132194 ?auto_132195 ) ) ( not ( = ?auto_132194 ?auto_132196 ) ) ( not ( = ?auto_132194 ?auto_132197 ) ) ( not ( = ?auto_132194 ?auto_132198 ) ) ( not ( = ?auto_132195 ?auto_132196 ) ) ( not ( = ?auto_132195 ?auto_132197 ) ) ( not ( = ?auto_132195 ?auto_132198 ) ) ( not ( = ?auto_132196 ?auto_132197 ) ) ( not ( = ?auto_132196 ?auto_132198 ) ) ( not ( = ?auto_132197 ?auto_132198 ) ) ( not ( = ?auto_132194 ?auto_132199 ) ) ( not ( = ?auto_132195 ?auto_132199 ) ) ( not ( = ?auto_132196 ?auto_132199 ) ) ( not ( = ?auto_132197 ?auto_132199 ) ) ( not ( = ?auto_132198 ?auto_132199 ) ) ( ON-TABLE ?auto_132200 ) ( not ( = ?auto_132200 ?auto_132199 ) ) ( not ( = ?auto_132200 ?auto_132198 ) ) ( not ( = ?auto_132200 ?auto_132197 ) ) ( not ( = ?auto_132194 ?auto_132200 ) ) ( not ( = ?auto_132195 ?auto_132200 ) ) ( not ( = ?auto_132196 ?auto_132200 ) ) ( ON ?auto_132194 ?auto_132201 ) ( not ( = ?auto_132194 ?auto_132201 ) ) ( not ( = ?auto_132195 ?auto_132201 ) ) ( not ( = ?auto_132196 ?auto_132201 ) ) ( not ( = ?auto_132197 ?auto_132201 ) ) ( not ( = ?auto_132198 ?auto_132201 ) ) ( not ( = ?auto_132199 ?auto_132201 ) ) ( not ( = ?auto_132200 ?auto_132201 ) ) ( ON ?auto_132195 ?auto_132194 ) ( ON-TABLE ?auto_132201 ) ( ON ?auto_132196 ?auto_132195 ) ( ON ?auto_132197 ?auto_132196 ) ( ON ?auto_132198 ?auto_132197 ) ( CLEAR ?auto_132198 ) ( HOLDING ?auto_132199 ) ( CLEAR ?auto_132200 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_132200 ?auto_132199 )
      ( MAKE-5PILE ?auto_132194 ?auto_132195 ?auto_132196 ?auto_132197 ?auto_132198 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132202 - BLOCK
      ?auto_132203 - BLOCK
      ?auto_132204 - BLOCK
      ?auto_132205 - BLOCK
      ?auto_132206 - BLOCK
    )
    :vars
    (
      ?auto_132209 - BLOCK
      ?auto_132207 - BLOCK
      ?auto_132208 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132202 ?auto_132203 ) ) ( not ( = ?auto_132202 ?auto_132204 ) ) ( not ( = ?auto_132202 ?auto_132205 ) ) ( not ( = ?auto_132202 ?auto_132206 ) ) ( not ( = ?auto_132203 ?auto_132204 ) ) ( not ( = ?auto_132203 ?auto_132205 ) ) ( not ( = ?auto_132203 ?auto_132206 ) ) ( not ( = ?auto_132204 ?auto_132205 ) ) ( not ( = ?auto_132204 ?auto_132206 ) ) ( not ( = ?auto_132205 ?auto_132206 ) ) ( not ( = ?auto_132202 ?auto_132209 ) ) ( not ( = ?auto_132203 ?auto_132209 ) ) ( not ( = ?auto_132204 ?auto_132209 ) ) ( not ( = ?auto_132205 ?auto_132209 ) ) ( not ( = ?auto_132206 ?auto_132209 ) ) ( ON-TABLE ?auto_132207 ) ( not ( = ?auto_132207 ?auto_132209 ) ) ( not ( = ?auto_132207 ?auto_132206 ) ) ( not ( = ?auto_132207 ?auto_132205 ) ) ( not ( = ?auto_132202 ?auto_132207 ) ) ( not ( = ?auto_132203 ?auto_132207 ) ) ( not ( = ?auto_132204 ?auto_132207 ) ) ( ON ?auto_132202 ?auto_132208 ) ( not ( = ?auto_132202 ?auto_132208 ) ) ( not ( = ?auto_132203 ?auto_132208 ) ) ( not ( = ?auto_132204 ?auto_132208 ) ) ( not ( = ?auto_132205 ?auto_132208 ) ) ( not ( = ?auto_132206 ?auto_132208 ) ) ( not ( = ?auto_132209 ?auto_132208 ) ) ( not ( = ?auto_132207 ?auto_132208 ) ) ( ON ?auto_132203 ?auto_132202 ) ( ON-TABLE ?auto_132208 ) ( ON ?auto_132204 ?auto_132203 ) ( ON ?auto_132205 ?auto_132204 ) ( ON ?auto_132206 ?auto_132205 ) ( CLEAR ?auto_132207 ) ( ON ?auto_132209 ?auto_132206 ) ( CLEAR ?auto_132209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_132208 ?auto_132202 ?auto_132203 ?auto_132204 ?auto_132205 ?auto_132206 )
      ( MAKE-5PILE ?auto_132202 ?auto_132203 ?auto_132204 ?auto_132205 ?auto_132206 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132210 - BLOCK
      ?auto_132211 - BLOCK
      ?auto_132212 - BLOCK
      ?auto_132213 - BLOCK
      ?auto_132214 - BLOCK
    )
    :vars
    (
      ?auto_132216 - BLOCK
      ?auto_132215 - BLOCK
      ?auto_132217 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132210 ?auto_132211 ) ) ( not ( = ?auto_132210 ?auto_132212 ) ) ( not ( = ?auto_132210 ?auto_132213 ) ) ( not ( = ?auto_132210 ?auto_132214 ) ) ( not ( = ?auto_132211 ?auto_132212 ) ) ( not ( = ?auto_132211 ?auto_132213 ) ) ( not ( = ?auto_132211 ?auto_132214 ) ) ( not ( = ?auto_132212 ?auto_132213 ) ) ( not ( = ?auto_132212 ?auto_132214 ) ) ( not ( = ?auto_132213 ?auto_132214 ) ) ( not ( = ?auto_132210 ?auto_132216 ) ) ( not ( = ?auto_132211 ?auto_132216 ) ) ( not ( = ?auto_132212 ?auto_132216 ) ) ( not ( = ?auto_132213 ?auto_132216 ) ) ( not ( = ?auto_132214 ?auto_132216 ) ) ( not ( = ?auto_132215 ?auto_132216 ) ) ( not ( = ?auto_132215 ?auto_132214 ) ) ( not ( = ?auto_132215 ?auto_132213 ) ) ( not ( = ?auto_132210 ?auto_132215 ) ) ( not ( = ?auto_132211 ?auto_132215 ) ) ( not ( = ?auto_132212 ?auto_132215 ) ) ( ON ?auto_132210 ?auto_132217 ) ( not ( = ?auto_132210 ?auto_132217 ) ) ( not ( = ?auto_132211 ?auto_132217 ) ) ( not ( = ?auto_132212 ?auto_132217 ) ) ( not ( = ?auto_132213 ?auto_132217 ) ) ( not ( = ?auto_132214 ?auto_132217 ) ) ( not ( = ?auto_132216 ?auto_132217 ) ) ( not ( = ?auto_132215 ?auto_132217 ) ) ( ON ?auto_132211 ?auto_132210 ) ( ON-TABLE ?auto_132217 ) ( ON ?auto_132212 ?auto_132211 ) ( ON ?auto_132213 ?auto_132212 ) ( ON ?auto_132214 ?auto_132213 ) ( ON ?auto_132216 ?auto_132214 ) ( CLEAR ?auto_132216 ) ( HOLDING ?auto_132215 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_132215 )
      ( MAKE-5PILE ?auto_132210 ?auto_132211 ?auto_132212 ?auto_132213 ?auto_132214 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132218 - BLOCK
      ?auto_132219 - BLOCK
      ?auto_132220 - BLOCK
      ?auto_132221 - BLOCK
      ?auto_132222 - BLOCK
    )
    :vars
    (
      ?auto_132224 - BLOCK
      ?auto_132225 - BLOCK
      ?auto_132223 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132218 ?auto_132219 ) ) ( not ( = ?auto_132218 ?auto_132220 ) ) ( not ( = ?auto_132218 ?auto_132221 ) ) ( not ( = ?auto_132218 ?auto_132222 ) ) ( not ( = ?auto_132219 ?auto_132220 ) ) ( not ( = ?auto_132219 ?auto_132221 ) ) ( not ( = ?auto_132219 ?auto_132222 ) ) ( not ( = ?auto_132220 ?auto_132221 ) ) ( not ( = ?auto_132220 ?auto_132222 ) ) ( not ( = ?auto_132221 ?auto_132222 ) ) ( not ( = ?auto_132218 ?auto_132224 ) ) ( not ( = ?auto_132219 ?auto_132224 ) ) ( not ( = ?auto_132220 ?auto_132224 ) ) ( not ( = ?auto_132221 ?auto_132224 ) ) ( not ( = ?auto_132222 ?auto_132224 ) ) ( not ( = ?auto_132225 ?auto_132224 ) ) ( not ( = ?auto_132225 ?auto_132222 ) ) ( not ( = ?auto_132225 ?auto_132221 ) ) ( not ( = ?auto_132218 ?auto_132225 ) ) ( not ( = ?auto_132219 ?auto_132225 ) ) ( not ( = ?auto_132220 ?auto_132225 ) ) ( ON ?auto_132218 ?auto_132223 ) ( not ( = ?auto_132218 ?auto_132223 ) ) ( not ( = ?auto_132219 ?auto_132223 ) ) ( not ( = ?auto_132220 ?auto_132223 ) ) ( not ( = ?auto_132221 ?auto_132223 ) ) ( not ( = ?auto_132222 ?auto_132223 ) ) ( not ( = ?auto_132224 ?auto_132223 ) ) ( not ( = ?auto_132225 ?auto_132223 ) ) ( ON ?auto_132219 ?auto_132218 ) ( ON-TABLE ?auto_132223 ) ( ON ?auto_132220 ?auto_132219 ) ( ON ?auto_132221 ?auto_132220 ) ( ON ?auto_132222 ?auto_132221 ) ( ON ?auto_132224 ?auto_132222 ) ( ON ?auto_132225 ?auto_132224 ) ( CLEAR ?auto_132225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_132223 ?auto_132218 ?auto_132219 ?auto_132220 ?auto_132221 ?auto_132222 ?auto_132224 )
      ( MAKE-5PILE ?auto_132218 ?auto_132219 ?auto_132220 ?auto_132221 ?auto_132222 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_132227 - BLOCK
    )
    :vars
    (
      ?auto_132228 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132228 ?auto_132227 ) ( CLEAR ?auto_132228 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_132227 ) ( not ( = ?auto_132227 ?auto_132228 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_132228 ?auto_132227 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_132229 - BLOCK
    )
    :vars
    (
      ?auto_132230 - BLOCK
      ?auto_132231 - BLOCK
      ?auto_132232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132230 ?auto_132229 ) ( CLEAR ?auto_132230 ) ( ON-TABLE ?auto_132229 ) ( not ( = ?auto_132229 ?auto_132230 ) ) ( HOLDING ?auto_132231 ) ( CLEAR ?auto_132232 ) ( not ( = ?auto_132229 ?auto_132231 ) ) ( not ( = ?auto_132229 ?auto_132232 ) ) ( not ( = ?auto_132230 ?auto_132231 ) ) ( not ( = ?auto_132230 ?auto_132232 ) ) ( not ( = ?auto_132231 ?auto_132232 ) ) )
    :subtasks
    ( ( !STACK ?auto_132231 ?auto_132232 )
      ( MAKE-1PILE ?auto_132229 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_132233 - BLOCK
    )
    :vars
    (
      ?auto_132234 - BLOCK
      ?auto_132235 - BLOCK
      ?auto_132236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132234 ?auto_132233 ) ( ON-TABLE ?auto_132233 ) ( not ( = ?auto_132233 ?auto_132234 ) ) ( CLEAR ?auto_132235 ) ( not ( = ?auto_132233 ?auto_132236 ) ) ( not ( = ?auto_132233 ?auto_132235 ) ) ( not ( = ?auto_132234 ?auto_132236 ) ) ( not ( = ?auto_132234 ?auto_132235 ) ) ( not ( = ?auto_132236 ?auto_132235 ) ) ( ON ?auto_132236 ?auto_132234 ) ( CLEAR ?auto_132236 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_132233 ?auto_132234 )
      ( MAKE-1PILE ?auto_132233 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_132237 - BLOCK
    )
    :vars
    (
      ?auto_132239 - BLOCK
      ?auto_132240 - BLOCK
      ?auto_132238 - BLOCK
      ?auto_132242 - BLOCK
      ?auto_132241 - BLOCK
      ?auto_132243 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132239 ?auto_132237 ) ( ON-TABLE ?auto_132237 ) ( not ( = ?auto_132237 ?auto_132239 ) ) ( not ( = ?auto_132237 ?auto_132240 ) ) ( not ( = ?auto_132237 ?auto_132238 ) ) ( not ( = ?auto_132239 ?auto_132240 ) ) ( not ( = ?auto_132239 ?auto_132238 ) ) ( not ( = ?auto_132240 ?auto_132238 ) ) ( ON ?auto_132240 ?auto_132239 ) ( CLEAR ?auto_132240 ) ( HOLDING ?auto_132238 ) ( CLEAR ?auto_132242 ) ( ON-TABLE ?auto_132241 ) ( ON ?auto_132243 ?auto_132241 ) ( ON ?auto_132242 ?auto_132243 ) ( not ( = ?auto_132241 ?auto_132243 ) ) ( not ( = ?auto_132241 ?auto_132242 ) ) ( not ( = ?auto_132241 ?auto_132238 ) ) ( not ( = ?auto_132243 ?auto_132242 ) ) ( not ( = ?auto_132243 ?auto_132238 ) ) ( not ( = ?auto_132242 ?auto_132238 ) ) ( not ( = ?auto_132237 ?auto_132242 ) ) ( not ( = ?auto_132237 ?auto_132241 ) ) ( not ( = ?auto_132237 ?auto_132243 ) ) ( not ( = ?auto_132239 ?auto_132242 ) ) ( not ( = ?auto_132239 ?auto_132241 ) ) ( not ( = ?auto_132239 ?auto_132243 ) ) ( not ( = ?auto_132240 ?auto_132242 ) ) ( not ( = ?auto_132240 ?auto_132241 ) ) ( not ( = ?auto_132240 ?auto_132243 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_132241 ?auto_132243 ?auto_132242 ?auto_132238 )
      ( MAKE-1PILE ?auto_132237 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_132244 - BLOCK
    )
    :vars
    (
      ?auto_132247 - BLOCK
      ?auto_132248 - BLOCK
      ?auto_132249 - BLOCK
      ?auto_132245 - BLOCK
      ?auto_132250 - BLOCK
      ?auto_132246 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132247 ?auto_132244 ) ( ON-TABLE ?auto_132244 ) ( not ( = ?auto_132244 ?auto_132247 ) ) ( not ( = ?auto_132244 ?auto_132248 ) ) ( not ( = ?auto_132244 ?auto_132249 ) ) ( not ( = ?auto_132247 ?auto_132248 ) ) ( not ( = ?auto_132247 ?auto_132249 ) ) ( not ( = ?auto_132248 ?auto_132249 ) ) ( ON ?auto_132248 ?auto_132247 ) ( CLEAR ?auto_132245 ) ( ON-TABLE ?auto_132250 ) ( ON ?auto_132246 ?auto_132250 ) ( ON ?auto_132245 ?auto_132246 ) ( not ( = ?auto_132250 ?auto_132246 ) ) ( not ( = ?auto_132250 ?auto_132245 ) ) ( not ( = ?auto_132250 ?auto_132249 ) ) ( not ( = ?auto_132246 ?auto_132245 ) ) ( not ( = ?auto_132246 ?auto_132249 ) ) ( not ( = ?auto_132245 ?auto_132249 ) ) ( not ( = ?auto_132244 ?auto_132245 ) ) ( not ( = ?auto_132244 ?auto_132250 ) ) ( not ( = ?auto_132244 ?auto_132246 ) ) ( not ( = ?auto_132247 ?auto_132245 ) ) ( not ( = ?auto_132247 ?auto_132250 ) ) ( not ( = ?auto_132247 ?auto_132246 ) ) ( not ( = ?auto_132248 ?auto_132245 ) ) ( not ( = ?auto_132248 ?auto_132250 ) ) ( not ( = ?auto_132248 ?auto_132246 ) ) ( ON ?auto_132249 ?auto_132248 ) ( CLEAR ?auto_132249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_132244 ?auto_132247 ?auto_132248 )
      ( MAKE-1PILE ?auto_132244 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_132251 - BLOCK
    )
    :vars
    (
      ?auto_132252 - BLOCK
      ?auto_132254 - BLOCK
      ?auto_132257 - BLOCK
      ?auto_132256 - BLOCK
      ?auto_132253 - BLOCK
      ?auto_132255 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132252 ?auto_132251 ) ( ON-TABLE ?auto_132251 ) ( not ( = ?auto_132251 ?auto_132252 ) ) ( not ( = ?auto_132251 ?auto_132254 ) ) ( not ( = ?auto_132251 ?auto_132257 ) ) ( not ( = ?auto_132252 ?auto_132254 ) ) ( not ( = ?auto_132252 ?auto_132257 ) ) ( not ( = ?auto_132254 ?auto_132257 ) ) ( ON ?auto_132254 ?auto_132252 ) ( ON-TABLE ?auto_132256 ) ( ON ?auto_132253 ?auto_132256 ) ( not ( = ?auto_132256 ?auto_132253 ) ) ( not ( = ?auto_132256 ?auto_132255 ) ) ( not ( = ?auto_132256 ?auto_132257 ) ) ( not ( = ?auto_132253 ?auto_132255 ) ) ( not ( = ?auto_132253 ?auto_132257 ) ) ( not ( = ?auto_132255 ?auto_132257 ) ) ( not ( = ?auto_132251 ?auto_132255 ) ) ( not ( = ?auto_132251 ?auto_132256 ) ) ( not ( = ?auto_132251 ?auto_132253 ) ) ( not ( = ?auto_132252 ?auto_132255 ) ) ( not ( = ?auto_132252 ?auto_132256 ) ) ( not ( = ?auto_132252 ?auto_132253 ) ) ( not ( = ?auto_132254 ?auto_132255 ) ) ( not ( = ?auto_132254 ?auto_132256 ) ) ( not ( = ?auto_132254 ?auto_132253 ) ) ( ON ?auto_132257 ?auto_132254 ) ( CLEAR ?auto_132257 ) ( HOLDING ?auto_132255 ) ( CLEAR ?auto_132253 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_132256 ?auto_132253 ?auto_132255 )
      ( MAKE-1PILE ?auto_132251 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_132258 - BLOCK
    )
    :vars
    (
      ?auto_132262 - BLOCK
      ?auto_132263 - BLOCK
      ?auto_132261 - BLOCK
      ?auto_132260 - BLOCK
      ?auto_132259 - BLOCK
      ?auto_132264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132262 ?auto_132258 ) ( ON-TABLE ?auto_132258 ) ( not ( = ?auto_132258 ?auto_132262 ) ) ( not ( = ?auto_132258 ?auto_132263 ) ) ( not ( = ?auto_132258 ?auto_132261 ) ) ( not ( = ?auto_132262 ?auto_132263 ) ) ( not ( = ?auto_132262 ?auto_132261 ) ) ( not ( = ?auto_132263 ?auto_132261 ) ) ( ON ?auto_132263 ?auto_132262 ) ( ON-TABLE ?auto_132260 ) ( ON ?auto_132259 ?auto_132260 ) ( not ( = ?auto_132260 ?auto_132259 ) ) ( not ( = ?auto_132260 ?auto_132264 ) ) ( not ( = ?auto_132260 ?auto_132261 ) ) ( not ( = ?auto_132259 ?auto_132264 ) ) ( not ( = ?auto_132259 ?auto_132261 ) ) ( not ( = ?auto_132264 ?auto_132261 ) ) ( not ( = ?auto_132258 ?auto_132264 ) ) ( not ( = ?auto_132258 ?auto_132260 ) ) ( not ( = ?auto_132258 ?auto_132259 ) ) ( not ( = ?auto_132262 ?auto_132264 ) ) ( not ( = ?auto_132262 ?auto_132260 ) ) ( not ( = ?auto_132262 ?auto_132259 ) ) ( not ( = ?auto_132263 ?auto_132264 ) ) ( not ( = ?auto_132263 ?auto_132260 ) ) ( not ( = ?auto_132263 ?auto_132259 ) ) ( ON ?auto_132261 ?auto_132263 ) ( CLEAR ?auto_132259 ) ( ON ?auto_132264 ?auto_132261 ) ( CLEAR ?auto_132264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_132258 ?auto_132262 ?auto_132263 ?auto_132261 )
      ( MAKE-1PILE ?auto_132258 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_132265 - BLOCK
    )
    :vars
    (
      ?auto_132267 - BLOCK
      ?auto_132266 - BLOCK
      ?auto_132268 - BLOCK
      ?auto_132270 - BLOCK
      ?auto_132271 - BLOCK
      ?auto_132269 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132267 ?auto_132265 ) ( ON-TABLE ?auto_132265 ) ( not ( = ?auto_132265 ?auto_132267 ) ) ( not ( = ?auto_132265 ?auto_132266 ) ) ( not ( = ?auto_132265 ?auto_132268 ) ) ( not ( = ?auto_132267 ?auto_132266 ) ) ( not ( = ?auto_132267 ?auto_132268 ) ) ( not ( = ?auto_132266 ?auto_132268 ) ) ( ON ?auto_132266 ?auto_132267 ) ( ON-TABLE ?auto_132270 ) ( not ( = ?auto_132270 ?auto_132271 ) ) ( not ( = ?auto_132270 ?auto_132269 ) ) ( not ( = ?auto_132270 ?auto_132268 ) ) ( not ( = ?auto_132271 ?auto_132269 ) ) ( not ( = ?auto_132271 ?auto_132268 ) ) ( not ( = ?auto_132269 ?auto_132268 ) ) ( not ( = ?auto_132265 ?auto_132269 ) ) ( not ( = ?auto_132265 ?auto_132270 ) ) ( not ( = ?auto_132265 ?auto_132271 ) ) ( not ( = ?auto_132267 ?auto_132269 ) ) ( not ( = ?auto_132267 ?auto_132270 ) ) ( not ( = ?auto_132267 ?auto_132271 ) ) ( not ( = ?auto_132266 ?auto_132269 ) ) ( not ( = ?auto_132266 ?auto_132270 ) ) ( not ( = ?auto_132266 ?auto_132271 ) ) ( ON ?auto_132268 ?auto_132266 ) ( ON ?auto_132269 ?auto_132268 ) ( CLEAR ?auto_132269 ) ( HOLDING ?auto_132271 ) ( CLEAR ?auto_132270 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_132270 ?auto_132271 )
      ( MAKE-1PILE ?auto_132265 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_132272 - BLOCK
    )
    :vars
    (
      ?auto_132278 - BLOCK
      ?auto_132276 - BLOCK
      ?auto_132273 - BLOCK
      ?auto_132277 - BLOCK
      ?auto_132275 - BLOCK
      ?auto_132274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132278 ?auto_132272 ) ( ON-TABLE ?auto_132272 ) ( not ( = ?auto_132272 ?auto_132278 ) ) ( not ( = ?auto_132272 ?auto_132276 ) ) ( not ( = ?auto_132272 ?auto_132273 ) ) ( not ( = ?auto_132278 ?auto_132276 ) ) ( not ( = ?auto_132278 ?auto_132273 ) ) ( not ( = ?auto_132276 ?auto_132273 ) ) ( ON ?auto_132276 ?auto_132278 ) ( ON-TABLE ?auto_132277 ) ( not ( = ?auto_132277 ?auto_132275 ) ) ( not ( = ?auto_132277 ?auto_132274 ) ) ( not ( = ?auto_132277 ?auto_132273 ) ) ( not ( = ?auto_132275 ?auto_132274 ) ) ( not ( = ?auto_132275 ?auto_132273 ) ) ( not ( = ?auto_132274 ?auto_132273 ) ) ( not ( = ?auto_132272 ?auto_132274 ) ) ( not ( = ?auto_132272 ?auto_132277 ) ) ( not ( = ?auto_132272 ?auto_132275 ) ) ( not ( = ?auto_132278 ?auto_132274 ) ) ( not ( = ?auto_132278 ?auto_132277 ) ) ( not ( = ?auto_132278 ?auto_132275 ) ) ( not ( = ?auto_132276 ?auto_132274 ) ) ( not ( = ?auto_132276 ?auto_132277 ) ) ( not ( = ?auto_132276 ?auto_132275 ) ) ( ON ?auto_132273 ?auto_132276 ) ( ON ?auto_132274 ?auto_132273 ) ( CLEAR ?auto_132277 ) ( ON ?auto_132275 ?auto_132274 ) ( CLEAR ?auto_132275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_132272 ?auto_132278 ?auto_132276 ?auto_132273 ?auto_132274 )
      ( MAKE-1PILE ?auto_132272 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_132279 - BLOCK
    )
    :vars
    (
      ?auto_132282 - BLOCK
      ?auto_132281 - BLOCK
      ?auto_132285 - BLOCK
      ?auto_132283 - BLOCK
      ?auto_132280 - BLOCK
      ?auto_132284 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132282 ?auto_132279 ) ( ON-TABLE ?auto_132279 ) ( not ( = ?auto_132279 ?auto_132282 ) ) ( not ( = ?auto_132279 ?auto_132281 ) ) ( not ( = ?auto_132279 ?auto_132285 ) ) ( not ( = ?auto_132282 ?auto_132281 ) ) ( not ( = ?auto_132282 ?auto_132285 ) ) ( not ( = ?auto_132281 ?auto_132285 ) ) ( ON ?auto_132281 ?auto_132282 ) ( not ( = ?auto_132283 ?auto_132280 ) ) ( not ( = ?auto_132283 ?auto_132284 ) ) ( not ( = ?auto_132283 ?auto_132285 ) ) ( not ( = ?auto_132280 ?auto_132284 ) ) ( not ( = ?auto_132280 ?auto_132285 ) ) ( not ( = ?auto_132284 ?auto_132285 ) ) ( not ( = ?auto_132279 ?auto_132284 ) ) ( not ( = ?auto_132279 ?auto_132283 ) ) ( not ( = ?auto_132279 ?auto_132280 ) ) ( not ( = ?auto_132282 ?auto_132284 ) ) ( not ( = ?auto_132282 ?auto_132283 ) ) ( not ( = ?auto_132282 ?auto_132280 ) ) ( not ( = ?auto_132281 ?auto_132284 ) ) ( not ( = ?auto_132281 ?auto_132283 ) ) ( not ( = ?auto_132281 ?auto_132280 ) ) ( ON ?auto_132285 ?auto_132281 ) ( ON ?auto_132284 ?auto_132285 ) ( ON ?auto_132280 ?auto_132284 ) ( CLEAR ?auto_132280 ) ( HOLDING ?auto_132283 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_132283 )
      ( MAKE-1PILE ?auto_132279 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_132286 - BLOCK
    )
    :vars
    (
      ?auto_132289 - BLOCK
      ?auto_132288 - BLOCK
      ?auto_132291 - BLOCK
      ?auto_132290 - BLOCK
      ?auto_132287 - BLOCK
      ?auto_132292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132289 ?auto_132286 ) ( ON-TABLE ?auto_132286 ) ( not ( = ?auto_132286 ?auto_132289 ) ) ( not ( = ?auto_132286 ?auto_132288 ) ) ( not ( = ?auto_132286 ?auto_132291 ) ) ( not ( = ?auto_132289 ?auto_132288 ) ) ( not ( = ?auto_132289 ?auto_132291 ) ) ( not ( = ?auto_132288 ?auto_132291 ) ) ( ON ?auto_132288 ?auto_132289 ) ( not ( = ?auto_132290 ?auto_132287 ) ) ( not ( = ?auto_132290 ?auto_132292 ) ) ( not ( = ?auto_132290 ?auto_132291 ) ) ( not ( = ?auto_132287 ?auto_132292 ) ) ( not ( = ?auto_132287 ?auto_132291 ) ) ( not ( = ?auto_132292 ?auto_132291 ) ) ( not ( = ?auto_132286 ?auto_132292 ) ) ( not ( = ?auto_132286 ?auto_132290 ) ) ( not ( = ?auto_132286 ?auto_132287 ) ) ( not ( = ?auto_132289 ?auto_132292 ) ) ( not ( = ?auto_132289 ?auto_132290 ) ) ( not ( = ?auto_132289 ?auto_132287 ) ) ( not ( = ?auto_132288 ?auto_132292 ) ) ( not ( = ?auto_132288 ?auto_132290 ) ) ( not ( = ?auto_132288 ?auto_132287 ) ) ( ON ?auto_132291 ?auto_132288 ) ( ON ?auto_132292 ?auto_132291 ) ( ON ?auto_132287 ?auto_132292 ) ( ON ?auto_132290 ?auto_132287 ) ( CLEAR ?auto_132290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_132286 ?auto_132289 ?auto_132288 ?auto_132291 ?auto_132292 ?auto_132287 )
      ( MAKE-1PILE ?auto_132286 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_132293 - BLOCK
    )
    :vars
    (
      ?auto_132298 - BLOCK
      ?auto_132297 - BLOCK
      ?auto_132295 - BLOCK
      ?auto_132299 - BLOCK
      ?auto_132296 - BLOCK
      ?auto_132294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132298 ?auto_132293 ) ( ON-TABLE ?auto_132293 ) ( not ( = ?auto_132293 ?auto_132298 ) ) ( not ( = ?auto_132293 ?auto_132297 ) ) ( not ( = ?auto_132293 ?auto_132295 ) ) ( not ( = ?auto_132298 ?auto_132297 ) ) ( not ( = ?auto_132298 ?auto_132295 ) ) ( not ( = ?auto_132297 ?auto_132295 ) ) ( ON ?auto_132297 ?auto_132298 ) ( not ( = ?auto_132299 ?auto_132296 ) ) ( not ( = ?auto_132299 ?auto_132294 ) ) ( not ( = ?auto_132299 ?auto_132295 ) ) ( not ( = ?auto_132296 ?auto_132294 ) ) ( not ( = ?auto_132296 ?auto_132295 ) ) ( not ( = ?auto_132294 ?auto_132295 ) ) ( not ( = ?auto_132293 ?auto_132294 ) ) ( not ( = ?auto_132293 ?auto_132299 ) ) ( not ( = ?auto_132293 ?auto_132296 ) ) ( not ( = ?auto_132298 ?auto_132294 ) ) ( not ( = ?auto_132298 ?auto_132299 ) ) ( not ( = ?auto_132298 ?auto_132296 ) ) ( not ( = ?auto_132297 ?auto_132294 ) ) ( not ( = ?auto_132297 ?auto_132299 ) ) ( not ( = ?auto_132297 ?auto_132296 ) ) ( ON ?auto_132295 ?auto_132297 ) ( ON ?auto_132294 ?auto_132295 ) ( ON ?auto_132296 ?auto_132294 ) ( HOLDING ?auto_132299 ) ( CLEAR ?auto_132296 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_132293 ?auto_132298 ?auto_132297 ?auto_132295 ?auto_132294 ?auto_132296 ?auto_132299 )
      ( MAKE-1PILE ?auto_132293 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_132300 - BLOCK
    )
    :vars
    (
      ?auto_132301 - BLOCK
      ?auto_132304 - BLOCK
      ?auto_132306 - BLOCK
      ?auto_132302 - BLOCK
      ?auto_132305 - BLOCK
      ?auto_132303 - BLOCK
      ?auto_132307 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132301 ?auto_132300 ) ( ON-TABLE ?auto_132300 ) ( not ( = ?auto_132300 ?auto_132301 ) ) ( not ( = ?auto_132300 ?auto_132304 ) ) ( not ( = ?auto_132300 ?auto_132306 ) ) ( not ( = ?auto_132301 ?auto_132304 ) ) ( not ( = ?auto_132301 ?auto_132306 ) ) ( not ( = ?auto_132304 ?auto_132306 ) ) ( ON ?auto_132304 ?auto_132301 ) ( not ( = ?auto_132302 ?auto_132305 ) ) ( not ( = ?auto_132302 ?auto_132303 ) ) ( not ( = ?auto_132302 ?auto_132306 ) ) ( not ( = ?auto_132305 ?auto_132303 ) ) ( not ( = ?auto_132305 ?auto_132306 ) ) ( not ( = ?auto_132303 ?auto_132306 ) ) ( not ( = ?auto_132300 ?auto_132303 ) ) ( not ( = ?auto_132300 ?auto_132302 ) ) ( not ( = ?auto_132300 ?auto_132305 ) ) ( not ( = ?auto_132301 ?auto_132303 ) ) ( not ( = ?auto_132301 ?auto_132302 ) ) ( not ( = ?auto_132301 ?auto_132305 ) ) ( not ( = ?auto_132304 ?auto_132303 ) ) ( not ( = ?auto_132304 ?auto_132302 ) ) ( not ( = ?auto_132304 ?auto_132305 ) ) ( ON ?auto_132306 ?auto_132304 ) ( ON ?auto_132303 ?auto_132306 ) ( ON ?auto_132305 ?auto_132303 ) ( CLEAR ?auto_132305 ) ( ON ?auto_132302 ?auto_132307 ) ( CLEAR ?auto_132302 ) ( HAND-EMPTY ) ( not ( = ?auto_132300 ?auto_132307 ) ) ( not ( = ?auto_132301 ?auto_132307 ) ) ( not ( = ?auto_132304 ?auto_132307 ) ) ( not ( = ?auto_132306 ?auto_132307 ) ) ( not ( = ?auto_132302 ?auto_132307 ) ) ( not ( = ?auto_132305 ?auto_132307 ) ) ( not ( = ?auto_132303 ?auto_132307 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_132302 ?auto_132307 )
      ( MAKE-1PILE ?auto_132300 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_132308 - BLOCK
    )
    :vars
    (
      ?auto_132313 - BLOCK
      ?auto_132311 - BLOCK
      ?auto_132312 - BLOCK
      ?auto_132315 - BLOCK
      ?auto_132310 - BLOCK
      ?auto_132314 - BLOCK
      ?auto_132309 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132313 ?auto_132308 ) ( ON-TABLE ?auto_132308 ) ( not ( = ?auto_132308 ?auto_132313 ) ) ( not ( = ?auto_132308 ?auto_132311 ) ) ( not ( = ?auto_132308 ?auto_132312 ) ) ( not ( = ?auto_132313 ?auto_132311 ) ) ( not ( = ?auto_132313 ?auto_132312 ) ) ( not ( = ?auto_132311 ?auto_132312 ) ) ( ON ?auto_132311 ?auto_132313 ) ( not ( = ?auto_132315 ?auto_132310 ) ) ( not ( = ?auto_132315 ?auto_132314 ) ) ( not ( = ?auto_132315 ?auto_132312 ) ) ( not ( = ?auto_132310 ?auto_132314 ) ) ( not ( = ?auto_132310 ?auto_132312 ) ) ( not ( = ?auto_132314 ?auto_132312 ) ) ( not ( = ?auto_132308 ?auto_132314 ) ) ( not ( = ?auto_132308 ?auto_132315 ) ) ( not ( = ?auto_132308 ?auto_132310 ) ) ( not ( = ?auto_132313 ?auto_132314 ) ) ( not ( = ?auto_132313 ?auto_132315 ) ) ( not ( = ?auto_132313 ?auto_132310 ) ) ( not ( = ?auto_132311 ?auto_132314 ) ) ( not ( = ?auto_132311 ?auto_132315 ) ) ( not ( = ?auto_132311 ?auto_132310 ) ) ( ON ?auto_132312 ?auto_132311 ) ( ON ?auto_132314 ?auto_132312 ) ( ON ?auto_132315 ?auto_132309 ) ( CLEAR ?auto_132315 ) ( not ( = ?auto_132308 ?auto_132309 ) ) ( not ( = ?auto_132313 ?auto_132309 ) ) ( not ( = ?auto_132311 ?auto_132309 ) ) ( not ( = ?auto_132312 ?auto_132309 ) ) ( not ( = ?auto_132315 ?auto_132309 ) ) ( not ( = ?auto_132310 ?auto_132309 ) ) ( not ( = ?auto_132314 ?auto_132309 ) ) ( HOLDING ?auto_132310 ) ( CLEAR ?auto_132314 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_132308 ?auto_132313 ?auto_132311 ?auto_132312 ?auto_132314 ?auto_132310 )
      ( MAKE-1PILE ?auto_132308 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_132316 - BLOCK
    )
    :vars
    (
      ?auto_132323 - BLOCK
      ?auto_132321 - BLOCK
      ?auto_132322 - BLOCK
      ?auto_132317 - BLOCK
      ?auto_132319 - BLOCK
      ?auto_132318 - BLOCK
      ?auto_132320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132323 ?auto_132316 ) ( ON-TABLE ?auto_132316 ) ( not ( = ?auto_132316 ?auto_132323 ) ) ( not ( = ?auto_132316 ?auto_132321 ) ) ( not ( = ?auto_132316 ?auto_132322 ) ) ( not ( = ?auto_132323 ?auto_132321 ) ) ( not ( = ?auto_132323 ?auto_132322 ) ) ( not ( = ?auto_132321 ?auto_132322 ) ) ( ON ?auto_132321 ?auto_132323 ) ( not ( = ?auto_132317 ?auto_132319 ) ) ( not ( = ?auto_132317 ?auto_132318 ) ) ( not ( = ?auto_132317 ?auto_132322 ) ) ( not ( = ?auto_132319 ?auto_132318 ) ) ( not ( = ?auto_132319 ?auto_132322 ) ) ( not ( = ?auto_132318 ?auto_132322 ) ) ( not ( = ?auto_132316 ?auto_132318 ) ) ( not ( = ?auto_132316 ?auto_132317 ) ) ( not ( = ?auto_132316 ?auto_132319 ) ) ( not ( = ?auto_132323 ?auto_132318 ) ) ( not ( = ?auto_132323 ?auto_132317 ) ) ( not ( = ?auto_132323 ?auto_132319 ) ) ( not ( = ?auto_132321 ?auto_132318 ) ) ( not ( = ?auto_132321 ?auto_132317 ) ) ( not ( = ?auto_132321 ?auto_132319 ) ) ( ON ?auto_132322 ?auto_132321 ) ( ON ?auto_132318 ?auto_132322 ) ( ON ?auto_132317 ?auto_132320 ) ( not ( = ?auto_132316 ?auto_132320 ) ) ( not ( = ?auto_132323 ?auto_132320 ) ) ( not ( = ?auto_132321 ?auto_132320 ) ) ( not ( = ?auto_132322 ?auto_132320 ) ) ( not ( = ?auto_132317 ?auto_132320 ) ) ( not ( = ?auto_132319 ?auto_132320 ) ) ( not ( = ?auto_132318 ?auto_132320 ) ) ( CLEAR ?auto_132318 ) ( ON ?auto_132319 ?auto_132317 ) ( CLEAR ?auto_132319 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_132320 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_132320 ?auto_132317 )
      ( MAKE-1PILE ?auto_132316 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_132324 - BLOCK
    )
    :vars
    (
      ?auto_132329 - BLOCK
      ?auto_132326 - BLOCK
      ?auto_132331 - BLOCK
      ?auto_132330 - BLOCK
      ?auto_132325 - BLOCK
      ?auto_132328 - BLOCK
      ?auto_132327 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132329 ?auto_132324 ) ( ON-TABLE ?auto_132324 ) ( not ( = ?auto_132324 ?auto_132329 ) ) ( not ( = ?auto_132324 ?auto_132326 ) ) ( not ( = ?auto_132324 ?auto_132331 ) ) ( not ( = ?auto_132329 ?auto_132326 ) ) ( not ( = ?auto_132329 ?auto_132331 ) ) ( not ( = ?auto_132326 ?auto_132331 ) ) ( ON ?auto_132326 ?auto_132329 ) ( not ( = ?auto_132330 ?auto_132325 ) ) ( not ( = ?auto_132330 ?auto_132328 ) ) ( not ( = ?auto_132330 ?auto_132331 ) ) ( not ( = ?auto_132325 ?auto_132328 ) ) ( not ( = ?auto_132325 ?auto_132331 ) ) ( not ( = ?auto_132328 ?auto_132331 ) ) ( not ( = ?auto_132324 ?auto_132328 ) ) ( not ( = ?auto_132324 ?auto_132330 ) ) ( not ( = ?auto_132324 ?auto_132325 ) ) ( not ( = ?auto_132329 ?auto_132328 ) ) ( not ( = ?auto_132329 ?auto_132330 ) ) ( not ( = ?auto_132329 ?auto_132325 ) ) ( not ( = ?auto_132326 ?auto_132328 ) ) ( not ( = ?auto_132326 ?auto_132330 ) ) ( not ( = ?auto_132326 ?auto_132325 ) ) ( ON ?auto_132331 ?auto_132326 ) ( ON ?auto_132330 ?auto_132327 ) ( not ( = ?auto_132324 ?auto_132327 ) ) ( not ( = ?auto_132329 ?auto_132327 ) ) ( not ( = ?auto_132326 ?auto_132327 ) ) ( not ( = ?auto_132331 ?auto_132327 ) ) ( not ( = ?auto_132330 ?auto_132327 ) ) ( not ( = ?auto_132325 ?auto_132327 ) ) ( not ( = ?auto_132328 ?auto_132327 ) ) ( ON ?auto_132325 ?auto_132330 ) ( CLEAR ?auto_132325 ) ( ON-TABLE ?auto_132327 ) ( HOLDING ?auto_132328 ) ( CLEAR ?auto_132331 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_132324 ?auto_132329 ?auto_132326 ?auto_132331 ?auto_132328 )
      ( MAKE-1PILE ?auto_132324 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_132332 - BLOCK
    )
    :vars
    (
      ?auto_132337 - BLOCK
      ?auto_132334 - BLOCK
      ?auto_132336 - BLOCK
      ?auto_132339 - BLOCK
      ?auto_132338 - BLOCK
      ?auto_132335 - BLOCK
      ?auto_132333 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132337 ?auto_132332 ) ( ON-TABLE ?auto_132332 ) ( not ( = ?auto_132332 ?auto_132337 ) ) ( not ( = ?auto_132332 ?auto_132334 ) ) ( not ( = ?auto_132332 ?auto_132336 ) ) ( not ( = ?auto_132337 ?auto_132334 ) ) ( not ( = ?auto_132337 ?auto_132336 ) ) ( not ( = ?auto_132334 ?auto_132336 ) ) ( ON ?auto_132334 ?auto_132337 ) ( not ( = ?auto_132339 ?auto_132338 ) ) ( not ( = ?auto_132339 ?auto_132335 ) ) ( not ( = ?auto_132339 ?auto_132336 ) ) ( not ( = ?auto_132338 ?auto_132335 ) ) ( not ( = ?auto_132338 ?auto_132336 ) ) ( not ( = ?auto_132335 ?auto_132336 ) ) ( not ( = ?auto_132332 ?auto_132335 ) ) ( not ( = ?auto_132332 ?auto_132339 ) ) ( not ( = ?auto_132332 ?auto_132338 ) ) ( not ( = ?auto_132337 ?auto_132335 ) ) ( not ( = ?auto_132337 ?auto_132339 ) ) ( not ( = ?auto_132337 ?auto_132338 ) ) ( not ( = ?auto_132334 ?auto_132335 ) ) ( not ( = ?auto_132334 ?auto_132339 ) ) ( not ( = ?auto_132334 ?auto_132338 ) ) ( ON ?auto_132336 ?auto_132334 ) ( ON ?auto_132339 ?auto_132333 ) ( not ( = ?auto_132332 ?auto_132333 ) ) ( not ( = ?auto_132337 ?auto_132333 ) ) ( not ( = ?auto_132334 ?auto_132333 ) ) ( not ( = ?auto_132336 ?auto_132333 ) ) ( not ( = ?auto_132339 ?auto_132333 ) ) ( not ( = ?auto_132338 ?auto_132333 ) ) ( not ( = ?auto_132335 ?auto_132333 ) ) ( ON ?auto_132338 ?auto_132339 ) ( ON-TABLE ?auto_132333 ) ( CLEAR ?auto_132336 ) ( ON ?auto_132335 ?auto_132338 ) ( CLEAR ?auto_132335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_132333 ?auto_132339 ?auto_132338 )
      ( MAKE-1PILE ?auto_132332 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_132340 - BLOCK
    )
    :vars
    (
      ?auto_132343 - BLOCK
      ?auto_132344 - BLOCK
      ?auto_132341 - BLOCK
      ?auto_132347 - BLOCK
      ?auto_132345 - BLOCK
      ?auto_132342 - BLOCK
      ?auto_132346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132343 ?auto_132340 ) ( ON-TABLE ?auto_132340 ) ( not ( = ?auto_132340 ?auto_132343 ) ) ( not ( = ?auto_132340 ?auto_132344 ) ) ( not ( = ?auto_132340 ?auto_132341 ) ) ( not ( = ?auto_132343 ?auto_132344 ) ) ( not ( = ?auto_132343 ?auto_132341 ) ) ( not ( = ?auto_132344 ?auto_132341 ) ) ( ON ?auto_132344 ?auto_132343 ) ( not ( = ?auto_132347 ?auto_132345 ) ) ( not ( = ?auto_132347 ?auto_132342 ) ) ( not ( = ?auto_132347 ?auto_132341 ) ) ( not ( = ?auto_132345 ?auto_132342 ) ) ( not ( = ?auto_132345 ?auto_132341 ) ) ( not ( = ?auto_132342 ?auto_132341 ) ) ( not ( = ?auto_132340 ?auto_132342 ) ) ( not ( = ?auto_132340 ?auto_132347 ) ) ( not ( = ?auto_132340 ?auto_132345 ) ) ( not ( = ?auto_132343 ?auto_132342 ) ) ( not ( = ?auto_132343 ?auto_132347 ) ) ( not ( = ?auto_132343 ?auto_132345 ) ) ( not ( = ?auto_132344 ?auto_132342 ) ) ( not ( = ?auto_132344 ?auto_132347 ) ) ( not ( = ?auto_132344 ?auto_132345 ) ) ( ON ?auto_132347 ?auto_132346 ) ( not ( = ?auto_132340 ?auto_132346 ) ) ( not ( = ?auto_132343 ?auto_132346 ) ) ( not ( = ?auto_132344 ?auto_132346 ) ) ( not ( = ?auto_132341 ?auto_132346 ) ) ( not ( = ?auto_132347 ?auto_132346 ) ) ( not ( = ?auto_132345 ?auto_132346 ) ) ( not ( = ?auto_132342 ?auto_132346 ) ) ( ON ?auto_132345 ?auto_132347 ) ( ON-TABLE ?auto_132346 ) ( ON ?auto_132342 ?auto_132345 ) ( CLEAR ?auto_132342 ) ( HOLDING ?auto_132341 ) ( CLEAR ?auto_132344 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_132340 ?auto_132343 ?auto_132344 ?auto_132341 )
      ( MAKE-1PILE ?auto_132340 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_132348 - BLOCK
    )
    :vars
    (
      ?auto_132352 - BLOCK
      ?auto_132353 - BLOCK
      ?auto_132350 - BLOCK
      ?auto_132349 - BLOCK
      ?auto_132354 - BLOCK
      ?auto_132351 - BLOCK
      ?auto_132355 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132352 ?auto_132348 ) ( ON-TABLE ?auto_132348 ) ( not ( = ?auto_132348 ?auto_132352 ) ) ( not ( = ?auto_132348 ?auto_132353 ) ) ( not ( = ?auto_132348 ?auto_132350 ) ) ( not ( = ?auto_132352 ?auto_132353 ) ) ( not ( = ?auto_132352 ?auto_132350 ) ) ( not ( = ?auto_132353 ?auto_132350 ) ) ( ON ?auto_132353 ?auto_132352 ) ( not ( = ?auto_132349 ?auto_132354 ) ) ( not ( = ?auto_132349 ?auto_132351 ) ) ( not ( = ?auto_132349 ?auto_132350 ) ) ( not ( = ?auto_132354 ?auto_132351 ) ) ( not ( = ?auto_132354 ?auto_132350 ) ) ( not ( = ?auto_132351 ?auto_132350 ) ) ( not ( = ?auto_132348 ?auto_132351 ) ) ( not ( = ?auto_132348 ?auto_132349 ) ) ( not ( = ?auto_132348 ?auto_132354 ) ) ( not ( = ?auto_132352 ?auto_132351 ) ) ( not ( = ?auto_132352 ?auto_132349 ) ) ( not ( = ?auto_132352 ?auto_132354 ) ) ( not ( = ?auto_132353 ?auto_132351 ) ) ( not ( = ?auto_132353 ?auto_132349 ) ) ( not ( = ?auto_132353 ?auto_132354 ) ) ( ON ?auto_132349 ?auto_132355 ) ( not ( = ?auto_132348 ?auto_132355 ) ) ( not ( = ?auto_132352 ?auto_132355 ) ) ( not ( = ?auto_132353 ?auto_132355 ) ) ( not ( = ?auto_132350 ?auto_132355 ) ) ( not ( = ?auto_132349 ?auto_132355 ) ) ( not ( = ?auto_132354 ?auto_132355 ) ) ( not ( = ?auto_132351 ?auto_132355 ) ) ( ON ?auto_132354 ?auto_132349 ) ( ON-TABLE ?auto_132355 ) ( ON ?auto_132351 ?auto_132354 ) ( CLEAR ?auto_132353 ) ( ON ?auto_132350 ?auto_132351 ) ( CLEAR ?auto_132350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_132355 ?auto_132349 ?auto_132354 ?auto_132351 )
      ( MAKE-1PILE ?auto_132348 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_132356 - BLOCK
    )
    :vars
    (
      ?auto_132358 - BLOCK
      ?auto_132361 - BLOCK
      ?auto_132359 - BLOCK
      ?auto_132363 - BLOCK
      ?auto_132357 - BLOCK
      ?auto_132362 - BLOCK
      ?auto_132360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132358 ?auto_132356 ) ( ON-TABLE ?auto_132356 ) ( not ( = ?auto_132356 ?auto_132358 ) ) ( not ( = ?auto_132356 ?auto_132361 ) ) ( not ( = ?auto_132356 ?auto_132359 ) ) ( not ( = ?auto_132358 ?auto_132361 ) ) ( not ( = ?auto_132358 ?auto_132359 ) ) ( not ( = ?auto_132361 ?auto_132359 ) ) ( not ( = ?auto_132363 ?auto_132357 ) ) ( not ( = ?auto_132363 ?auto_132362 ) ) ( not ( = ?auto_132363 ?auto_132359 ) ) ( not ( = ?auto_132357 ?auto_132362 ) ) ( not ( = ?auto_132357 ?auto_132359 ) ) ( not ( = ?auto_132362 ?auto_132359 ) ) ( not ( = ?auto_132356 ?auto_132362 ) ) ( not ( = ?auto_132356 ?auto_132363 ) ) ( not ( = ?auto_132356 ?auto_132357 ) ) ( not ( = ?auto_132358 ?auto_132362 ) ) ( not ( = ?auto_132358 ?auto_132363 ) ) ( not ( = ?auto_132358 ?auto_132357 ) ) ( not ( = ?auto_132361 ?auto_132362 ) ) ( not ( = ?auto_132361 ?auto_132363 ) ) ( not ( = ?auto_132361 ?auto_132357 ) ) ( ON ?auto_132363 ?auto_132360 ) ( not ( = ?auto_132356 ?auto_132360 ) ) ( not ( = ?auto_132358 ?auto_132360 ) ) ( not ( = ?auto_132361 ?auto_132360 ) ) ( not ( = ?auto_132359 ?auto_132360 ) ) ( not ( = ?auto_132363 ?auto_132360 ) ) ( not ( = ?auto_132357 ?auto_132360 ) ) ( not ( = ?auto_132362 ?auto_132360 ) ) ( ON ?auto_132357 ?auto_132363 ) ( ON-TABLE ?auto_132360 ) ( ON ?auto_132362 ?auto_132357 ) ( ON ?auto_132359 ?auto_132362 ) ( CLEAR ?auto_132359 ) ( HOLDING ?auto_132361 ) ( CLEAR ?auto_132358 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_132356 ?auto_132358 ?auto_132361 )
      ( MAKE-1PILE ?auto_132356 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_132364 - BLOCK
    )
    :vars
    (
      ?auto_132367 - BLOCK
      ?auto_132371 - BLOCK
      ?auto_132369 - BLOCK
      ?auto_132365 - BLOCK
      ?auto_132370 - BLOCK
      ?auto_132366 - BLOCK
      ?auto_132368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132367 ?auto_132364 ) ( ON-TABLE ?auto_132364 ) ( not ( = ?auto_132364 ?auto_132367 ) ) ( not ( = ?auto_132364 ?auto_132371 ) ) ( not ( = ?auto_132364 ?auto_132369 ) ) ( not ( = ?auto_132367 ?auto_132371 ) ) ( not ( = ?auto_132367 ?auto_132369 ) ) ( not ( = ?auto_132371 ?auto_132369 ) ) ( not ( = ?auto_132365 ?auto_132370 ) ) ( not ( = ?auto_132365 ?auto_132366 ) ) ( not ( = ?auto_132365 ?auto_132369 ) ) ( not ( = ?auto_132370 ?auto_132366 ) ) ( not ( = ?auto_132370 ?auto_132369 ) ) ( not ( = ?auto_132366 ?auto_132369 ) ) ( not ( = ?auto_132364 ?auto_132366 ) ) ( not ( = ?auto_132364 ?auto_132365 ) ) ( not ( = ?auto_132364 ?auto_132370 ) ) ( not ( = ?auto_132367 ?auto_132366 ) ) ( not ( = ?auto_132367 ?auto_132365 ) ) ( not ( = ?auto_132367 ?auto_132370 ) ) ( not ( = ?auto_132371 ?auto_132366 ) ) ( not ( = ?auto_132371 ?auto_132365 ) ) ( not ( = ?auto_132371 ?auto_132370 ) ) ( ON ?auto_132365 ?auto_132368 ) ( not ( = ?auto_132364 ?auto_132368 ) ) ( not ( = ?auto_132367 ?auto_132368 ) ) ( not ( = ?auto_132371 ?auto_132368 ) ) ( not ( = ?auto_132369 ?auto_132368 ) ) ( not ( = ?auto_132365 ?auto_132368 ) ) ( not ( = ?auto_132370 ?auto_132368 ) ) ( not ( = ?auto_132366 ?auto_132368 ) ) ( ON ?auto_132370 ?auto_132365 ) ( ON-TABLE ?auto_132368 ) ( ON ?auto_132366 ?auto_132370 ) ( ON ?auto_132369 ?auto_132366 ) ( CLEAR ?auto_132367 ) ( ON ?auto_132371 ?auto_132369 ) ( CLEAR ?auto_132371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_132368 ?auto_132365 ?auto_132370 ?auto_132366 ?auto_132369 )
      ( MAKE-1PILE ?auto_132364 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_132388 - BLOCK
    )
    :vars
    (
      ?auto_132390 - BLOCK
      ?auto_132393 - BLOCK
      ?auto_132392 - BLOCK
      ?auto_132394 - BLOCK
      ?auto_132389 - BLOCK
      ?auto_132391 - BLOCK
      ?auto_132395 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132388 ?auto_132390 ) ) ( not ( = ?auto_132388 ?auto_132393 ) ) ( not ( = ?auto_132388 ?auto_132392 ) ) ( not ( = ?auto_132390 ?auto_132393 ) ) ( not ( = ?auto_132390 ?auto_132392 ) ) ( not ( = ?auto_132393 ?auto_132392 ) ) ( not ( = ?auto_132394 ?auto_132389 ) ) ( not ( = ?auto_132394 ?auto_132391 ) ) ( not ( = ?auto_132394 ?auto_132392 ) ) ( not ( = ?auto_132389 ?auto_132391 ) ) ( not ( = ?auto_132389 ?auto_132392 ) ) ( not ( = ?auto_132391 ?auto_132392 ) ) ( not ( = ?auto_132388 ?auto_132391 ) ) ( not ( = ?auto_132388 ?auto_132394 ) ) ( not ( = ?auto_132388 ?auto_132389 ) ) ( not ( = ?auto_132390 ?auto_132391 ) ) ( not ( = ?auto_132390 ?auto_132394 ) ) ( not ( = ?auto_132390 ?auto_132389 ) ) ( not ( = ?auto_132393 ?auto_132391 ) ) ( not ( = ?auto_132393 ?auto_132394 ) ) ( not ( = ?auto_132393 ?auto_132389 ) ) ( ON ?auto_132394 ?auto_132395 ) ( not ( = ?auto_132388 ?auto_132395 ) ) ( not ( = ?auto_132390 ?auto_132395 ) ) ( not ( = ?auto_132393 ?auto_132395 ) ) ( not ( = ?auto_132392 ?auto_132395 ) ) ( not ( = ?auto_132394 ?auto_132395 ) ) ( not ( = ?auto_132389 ?auto_132395 ) ) ( not ( = ?auto_132391 ?auto_132395 ) ) ( ON ?auto_132389 ?auto_132394 ) ( ON-TABLE ?auto_132395 ) ( ON ?auto_132391 ?auto_132389 ) ( ON ?auto_132392 ?auto_132391 ) ( ON ?auto_132393 ?auto_132392 ) ( ON ?auto_132390 ?auto_132393 ) ( CLEAR ?auto_132390 ) ( HOLDING ?auto_132388 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_132388 ?auto_132390 )
      ( MAKE-1PILE ?auto_132388 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_132396 - BLOCK
    )
    :vars
    (
      ?auto_132399 - BLOCK
      ?auto_132402 - BLOCK
      ?auto_132400 - BLOCK
      ?auto_132397 - BLOCK
      ?auto_132401 - BLOCK
      ?auto_132398 - BLOCK
      ?auto_132403 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132396 ?auto_132399 ) ) ( not ( = ?auto_132396 ?auto_132402 ) ) ( not ( = ?auto_132396 ?auto_132400 ) ) ( not ( = ?auto_132399 ?auto_132402 ) ) ( not ( = ?auto_132399 ?auto_132400 ) ) ( not ( = ?auto_132402 ?auto_132400 ) ) ( not ( = ?auto_132397 ?auto_132401 ) ) ( not ( = ?auto_132397 ?auto_132398 ) ) ( not ( = ?auto_132397 ?auto_132400 ) ) ( not ( = ?auto_132401 ?auto_132398 ) ) ( not ( = ?auto_132401 ?auto_132400 ) ) ( not ( = ?auto_132398 ?auto_132400 ) ) ( not ( = ?auto_132396 ?auto_132398 ) ) ( not ( = ?auto_132396 ?auto_132397 ) ) ( not ( = ?auto_132396 ?auto_132401 ) ) ( not ( = ?auto_132399 ?auto_132398 ) ) ( not ( = ?auto_132399 ?auto_132397 ) ) ( not ( = ?auto_132399 ?auto_132401 ) ) ( not ( = ?auto_132402 ?auto_132398 ) ) ( not ( = ?auto_132402 ?auto_132397 ) ) ( not ( = ?auto_132402 ?auto_132401 ) ) ( ON ?auto_132397 ?auto_132403 ) ( not ( = ?auto_132396 ?auto_132403 ) ) ( not ( = ?auto_132399 ?auto_132403 ) ) ( not ( = ?auto_132402 ?auto_132403 ) ) ( not ( = ?auto_132400 ?auto_132403 ) ) ( not ( = ?auto_132397 ?auto_132403 ) ) ( not ( = ?auto_132401 ?auto_132403 ) ) ( not ( = ?auto_132398 ?auto_132403 ) ) ( ON ?auto_132401 ?auto_132397 ) ( ON-TABLE ?auto_132403 ) ( ON ?auto_132398 ?auto_132401 ) ( ON ?auto_132400 ?auto_132398 ) ( ON ?auto_132402 ?auto_132400 ) ( ON ?auto_132399 ?auto_132402 ) ( ON ?auto_132396 ?auto_132399 ) ( CLEAR ?auto_132396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_132403 ?auto_132397 ?auto_132401 ?auto_132398 ?auto_132400 ?auto_132402 ?auto_132399 )
      ( MAKE-1PILE ?auto_132396 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_132410 - BLOCK
      ?auto_132411 - BLOCK
      ?auto_132412 - BLOCK
      ?auto_132413 - BLOCK
      ?auto_132414 - BLOCK
      ?auto_132415 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_132415 ) ( CLEAR ?auto_132414 ) ( ON-TABLE ?auto_132410 ) ( ON ?auto_132411 ?auto_132410 ) ( ON ?auto_132412 ?auto_132411 ) ( ON ?auto_132413 ?auto_132412 ) ( ON ?auto_132414 ?auto_132413 ) ( not ( = ?auto_132410 ?auto_132411 ) ) ( not ( = ?auto_132410 ?auto_132412 ) ) ( not ( = ?auto_132410 ?auto_132413 ) ) ( not ( = ?auto_132410 ?auto_132414 ) ) ( not ( = ?auto_132410 ?auto_132415 ) ) ( not ( = ?auto_132411 ?auto_132412 ) ) ( not ( = ?auto_132411 ?auto_132413 ) ) ( not ( = ?auto_132411 ?auto_132414 ) ) ( not ( = ?auto_132411 ?auto_132415 ) ) ( not ( = ?auto_132412 ?auto_132413 ) ) ( not ( = ?auto_132412 ?auto_132414 ) ) ( not ( = ?auto_132412 ?auto_132415 ) ) ( not ( = ?auto_132413 ?auto_132414 ) ) ( not ( = ?auto_132413 ?auto_132415 ) ) ( not ( = ?auto_132414 ?auto_132415 ) ) )
    :subtasks
    ( ( !STACK ?auto_132415 ?auto_132414 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_132416 - BLOCK
      ?auto_132417 - BLOCK
      ?auto_132418 - BLOCK
      ?auto_132419 - BLOCK
      ?auto_132420 - BLOCK
      ?auto_132421 - BLOCK
    )
    :vars
    (
      ?auto_132422 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_132420 ) ( ON-TABLE ?auto_132416 ) ( ON ?auto_132417 ?auto_132416 ) ( ON ?auto_132418 ?auto_132417 ) ( ON ?auto_132419 ?auto_132418 ) ( ON ?auto_132420 ?auto_132419 ) ( not ( = ?auto_132416 ?auto_132417 ) ) ( not ( = ?auto_132416 ?auto_132418 ) ) ( not ( = ?auto_132416 ?auto_132419 ) ) ( not ( = ?auto_132416 ?auto_132420 ) ) ( not ( = ?auto_132416 ?auto_132421 ) ) ( not ( = ?auto_132417 ?auto_132418 ) ) ( not ( = ?auto_132417 ?auto_132419 ) ) ( not ( = ?auto_132417 ?auto_132420 ) ) ( not ( = ?auto_132417 ?auto_132421 ) ) ( not ( = ?auto_132418 ?auto_132419 ) ) ( not ( = ?auto_132418 ?auto_132420 ) ) ( not ( = ?auto_132418 ?auto_132421 ) ) ( not ( = ?auto_132419 ?auto_132420 ) ) ( not ( = ?auto_132419 ?auto_132421 ) ) ( not ( = ?auto_132420 ?auto_132421 ) ) ( ON ?auto_132421 ?auto_132422 ) ( CLEAR ?auto_132421 ) ( HAND-EMPTY ) ( not ( = ?auto_132416 ?auto_132422 ) ) ( not ( = ?auto_132417 ?auto_132422 ) ) ( not ( = ?auto_132418 ?auto_132422 ) ) ( not ( = ?auto_132419 ?auto_132422 ) ) ( not ( = ?auto_132420 ?auto_132422 ) ) ( not ( = ?auto_132421 ?auto_132422 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_132421 ?auto_132422 )
      ( MAKE-6PILE ?auto_132416 ?auto_132417 ?auto_132418 ?auto_132419 ?auto_132420 ?auto_132421 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_132423 - BLOCK
      ?auto_132424 - BLOCK
      ?auto_132425 - BLOCK
      ?auto_132426 - BLOCK
      ?auto_132427 - BLOCK
      ?auto_132428 - BLOCK
    )
    :vars
    (
      ?auto_132429 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132423 ) ( ON ?auto_132424 ?auto_132423 ) ( ON ?auto_132425 ?auto_132424 ) ( ON ?auto_132426 ?auto_132425 ) ( not ( = ?auto_132423 ?auto_132424 ) ) ( not ( = ?auto_132423 ?auto_132425 ) ) ( not ( = ?auto_132423 ?auto_132426 ) ) ( not ( = ?auto_132423 ?auto_132427 ) ) ( not ( = ?auto_132423 ?auto_132428 ) ) ( not ( = ?auto_132424 ?auto_132425 ) ) ( not ( = ?auto_132424 ?auto_132426 ) ) ( not ( = ?auto_132424 ?auto_132427 ) ) ( not ( = ?auto_132424 ?auto_132428 ) ) ( not ( = ?auto_132425 ?auto_132426 ) ) ( not ( = ?auto_132425 ?auto_132427 ) ) ( not ( = ?auto_132425 ?auto_132428 ) ) ( not ( = ?auto_132426 ?auto_132427 ) ) ( not ( = ?auto_132426 ?auto_132428 ) ) ( not ( = ?auto_132427 ?auto_132428 ) ) ( ON ?auto_132428 ?auto_132429 ) ( CLEAR ?auto_132428 ) ( not ( = ?auto_132423 ?auto_132429 ) ) ( not ( = ?auto_132424 ?auto_132429 ) ) ( not ( = ?auto_132425 ?auto_132429 ) ) ( not ( = ?auto_132426 ?auto_132429 ) ) ( not ( = ?auto_132427 ?auto_132429 ) ) ( not ( = ?auto_132428 ?auto_132429 ) ) ( HOLDING ?auto_132427 ) ( CLEAR ?auto_132426 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_132423 ?auto_132424 ?auto_132425 ?auto_132426 ?auto_132427 )
      ( MAKE-6PILE ?auto_132423 ?auto_132424 ?auto_132425 ?auto_132426 ?auto_132427 ?auto_132428 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_132430 - BLOCK
      ?auto_132431 - BLOCK
      ?auto_132432 - BLOCK
      ?auto_132433 - BLOCK
      ?auto_132434 - BLOCK
      ?auto_132435 - BLOCK
    )
    :vars
    (
      ?auto_132436 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132430 ) ( ON ?auto_132431 ?auto_132430 ) ( ON ?auto_132432 ?auto_132431 ) ( ON ?auto_132433 ?auto_132432 ) ( not ( = ?auto_132430 ?auto_132431 ) ) ( not ( = ?auto_132430 ?auto_132432 ) ) ( not ( = ?auto_132430 ?auto_132433 ) ) ( not ( = ?auto_132430 ?auto_132434 ) ) ( not ( = ?auto_132430 ?auto_132435 ) ) ( not ( = ?auto_132431 ?auto_132432 ) ) ( not ( = ?auto_132431 ?auto_132433 ) ) ( not ( = ?auto_132431 ?auto_132434 ) ) ( not ( = ?auto_132431 ?auto_132435 ) ) ( not ( = ?auto_132432 ?auto_132433 ) ) ( not ( = ?auto_132432 ?auto_132434 ) ) ( not ( = ?auto_132432 ?auto_132435 ) ) ( not ( = ?auto_132433 ?auto_132434 ) ) ( not ( = ?auto_132433 ?auto_132435 ) ) ( not ( = ?auto_132434 ?auto_132435 ) ) ( ON ?auto_132435 ?auto_132436 ) ( not ( = ?auto_132430 ?auto_132436 ) ) ( not ( = ?auto_132431 ?auto_132436 ) ) ( not ( = ?auto_132432 ?auto_132436 ) ) ( not ( = ?auto_132433 ?auto_132436 ) ) ( not ( = ?auto_132434 ?auto_132436 ) ) ( not ( = ?auto_132435 ?auto_132436 ) ) ( CLEAR ?auto_132433 ) ( ON ?auto_132434 ?auto_132435 ) ( CLEAR ?auto_132434 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_132436 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_132436 ?auto_132435 )
      ( MAKE-6PILE ?auto_132430 ?auto_132431 ?auto_132432 ?auto_132433 ?auto_132434 ?auto_132435 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_132437 - BLOCK
      ?auto_132438 - BLOCK
      ?auto_132439 - BLOCK
      ?auto_132440 - BLOCK
      ?auto_132441 - BLOCK
      ?auto_132442 - BLOCK
    )
    :vars
    (
      ?auto_132443 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132437 ) ( ON ?auto_132438 ?auto_132437 ) ( ON ?auto_132439 ?auto_132438 ) ( not ( = ?auto_132437 ?auto_132438 ) ) ( not ( = ?auto_132437 ?auto_132439 ) ) ( not ( = ?auto_132437 ?auto_132440 ) ) ( not ( = ?auto_132437 ?auto_132441 ) ) ( not ( = ?auto_132437 ?auto_132442 ) ) ( not ( = ?auto_132438 ?auto_132439 ) ) ( not ( = ?auto_132438 ?auto_132440 ) ) ( not ( = ?auto_132438 ?auto_132441 ) ) ( not ( = ?auto_132438 ?auto_132442 ) ) ( not ( = ?auto_132439 ?auto_132440 ) ) ( not ( = ?auto_132439 ?auto_132441 ) ) ( not ( = ?auto_132439 ?auto_132442 ) ) ( not ( = ?auto_132440 ?auto_132441 ) ) ( not ( = ?auto_132440 ?auto_132442 ) ) ( not ( = ?auto_132441 ?auto_132442 ) ) ( ON ?auto_132442 ?auto_132443 ) ( not ( = ?auto_132437 ?auto_132443 ) ) ( not ( = ?auto_132438 ?auto_132443 ) ) ( not ( = ?auto_132439 ?auto_132443 ) ) ( not ( = ?auto_132440 ?auto_132443 ) ) ( not ( = ?auto_132441 ?auto_132443 ) ) ( not ( = ?auto_132442 ?auto_132443 ) ) ( ON ?auto_132441 ?auto_132442 ) ( CLEAR ?auto_132441 ) ( ON-TABLE ?auto_132443 ) ( HOLDING ?auto_132440 ) ( CLEAR ?auto_132439 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_132437 ?auto_132438 ?auto_132439 ?auto_132440 )
      ( MAKE-6PILE ?auto_132437 ?auto_132438 ?auto_132439 ?auto_132440 ?auto_132441 ?auto_132442 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_132444 - BLOCK
      ?auto_132445 - BLOCK
      ?auto_132446 - BLOCK
      ?auto_132447 - BLOCK
      ?auto_132448 - BLOCK
      ?auto_132449 - BLOCK
    )
    :vars
    (
      ?auto_132450 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132444 ) ( ON ?auto_132445 ?auto_132444 ) ( ON ?auto_132446 ?auto_132445 ) ( not ( = ?auto_132444 ?auto_132445 ) ) ( not ( = ?auto_132444 ?auto_132446 ) ) ( not ( = ?auto_132444 ?auto_132447 ) ) ( not ( = ?auto_132444 ?auto_132448 ) ) ( not ( = ?auto_132444 ?auto_132449 ) ) ( not ( = ?auto_132445 ?auto_132446 ) ) ( not ( = ?auto_132445 ?auto_132447 ) ) ( not ( = ?auto_132445 ?auto_132448 ) ) ( not ( = ?auto_132445 ?auto_132449 ) ) ( not ( = ?auto_132446 ?auto_132447 ) ) ( not ( = ?auto_132446 ?auto_132448 ) ) ( not ( = ?auto_132446 ?auto_132449 ) ) ( not ( = ?auto_132447 ?auto_132448 ) ) ( not ( = ?auto_132447 ?auto_132449 ) ) ( not ( = ?auto_132448 ?auto_132449 ) ) ( ON ?auto_132449 ?auto_132450 ) ( not ( = ?auto_132444 ?auto_132450 ) ) ( not ( = ?auto_132445 ?auto_132450 ) ) ( not ( = ?auto_132446 ?auto_132450 ) ) ( not ( = ?auto_132447 ?auto_132450 ) ) ( not ( = ?auto_132448 ?auto_132450 ) ) ( not ( = ?auto_132449 ?auto_132450 ) ) ( ON ?auto_132448 ?auto_132449 ) ( ON-TABLE ?auto_132450 ) ( CLEAR ?auto_132446 ) ( ON ?auto_132447 ?auto_132448 ) ( CLEAR ?auto_132447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_132450 ?auto_132449 ?auto_132448 )
      ( MAKE-6PILE ?auto_132444 ?auto_132445 ?auto_132446 ?auto_132447 ?auto_132448 ?auto_132449 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_132451 - BLOCK
      ?auto_132452 - BLOCK
      ?auto_132453 - BLOCK
      ?auto_132454 - BLOCK
      ?auto_132455 - BLOCK
      ?auto_132456 - BLOCK
    )
    :vars
    (
      ?auto_132457 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132451 ) ( ON ?auto_132452 ?auto_132451 ) ( not ( = ?auto_132451 ?auto_132452 ) ) ( not ( = ?auto_132451 ?auto_132453 ) ) ( not ( = ?auto_132451 ?auto_132454 ) ) ( not ( = ?auto_132451 ?auto_132455 ) ) ( not ( = ?auto_132451 ?auto_132456 ) ) ( not ( = ?auto_132452 ?auto_132453 ) ) ( not ( = ?auto_132452 ?auto_132454 ) ) ( not ( = ?auto_132452 ?auto_132455 ) ) ( not ( = ?auto_132452 ?auto_132456 ) ) ( not ( = ?auto_132453 ?auto_132454 ) ) ( not ( = ?auto_132453 ?auto_132455 ) ) ( not ( = ?auto_132453 ?auto_132456 ) ) ( not ( = ?auto_132454 ?auto_132455 ) ) ( not ( = ?auto_132454 ?auto_132456 ) ) ( not ( = ?auto_132455 ?auto_132456 ) ) ( ON ?auto_132456 ?auto_132457 ) ( not ( = ?auto_132451 ?auto_132457 ) ) ( not ( = ?auto_132452 ?auto_132457 ) ) ( not ( = ?auto_132453 ?auto_132457 ) ) ( not ( = ?auto_132454 ?auto_132457 ) ) ( not ( = ?auto_132455 ?auto_132457 ) ) ( not ( = ?auto_132456 ?auto_132457 ) ) ( ON ?auto_132455 ?auto_132456 ) ( ON-TABLE ?auto_132457 ) ( ON ?auto_132454 ?auto_132455 ) ( CLEAR ?auto_132454 ) ( HOLDING ?auto_132453 ) ( CLEAR ?auto_132452 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_132451 ?auto_132452 ?auto_132453 )
      ( MAKE-6PILE ?auto_132451 ?auto_132452 ?auto_132453 ?auto_132454 ?auto_132455 ?auto_132456 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_132458 - BLOCK
      ?auto_132459 - BLOCK
      ?auto_132460 - BLOCK
      ?auto_132461 - BLOCK
      ?auto_132462 - BLOCK
      ?auto_132463 - BLOCK
    )
    :vars
    (
      ?auto_132464 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132458 ) ( ON ?auto_132459 ?auto_132458 ) ( not ( = ?auto_132458 ?auto_132459 ) ) ( not ( = ?auto_132458 ?auto_132460 ) ) ( not ( = ?auto_132458 ?auto_132461 ) ) ( not ( = ?auto_132458 ?auto_132462 ) ) ( not ( = ?auto_132458 ?auto_132463 ) ) ( not ( = ?auto_132459 ?auto_132460 ) ) ( not ( = ?auto_132459 ?auto_132461 ) ) ( not ( = ?auto_132459 ?auto_132462 ) ) ( not ( = ?auto_132459 ?auto_132463 ) ) ( not ( = ?auto_132460 ?auto_132461 ) ) ( not ( = ?auto_132460 ?auto_132462 ) ) ( not ( = ?auto_132460 ?auto_132463 ) ) ( not ( = ?auto_132461 ?auto_132462 ) ) ( not ( = ?auto_132461 ?auto_132463 ) ) ( not ( = ?auto_132462 ?auto_132463 ) ) ( ON ?auto_132463 ?auto_132464 ) ( not ( = ?auto_132458 ?auto_132464 ) ) ( not ( = ?auto_132459 ?auto_132464 ) ) ( not ( = ?auto_132460 ?auto_132464 ) ) ( not ( = ?auto_132461 ?auto_132464 ) ) ( not ( = ?auto_132462 ?auto_132464 ) ) ( not ( = ?auto_132463 ?auto_132464 ) ) ( ON ?auto_132462 ?auto_132463 ) ( ON-TABLE ?auto_132464 ) ( ON ?auto_132461 ?auto_132462 ) ( CLEAR ?auto_132459 ) ( ON ?auto_132460 ?auto_132461 ) ( CLEAR ?auto_132460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_132464 ?auto_132463 ?auto_132462 ?auto_132461 )
      ( MAKE-6PILE ?auto_132458 ?auto_132459 ?auto_132460 ?auto_132461 ?auto_132462 ?auto_132463 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_132465 - BLOCK
      ?auto_132466 - BLOCK
      ?auto_132467 - BLOCK
      ?auto_132468 - BLOCK
      ?auto_132469 - BLOCK
      ?auto_132470 - BLOCK
    )
    :vars
    (
      ?auto_132471 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132465 ) ( not ( = ?auto_132465 ?auto_132466 ) ) ( not ( = ?auto_132465 ?auto_132467 ) ) ( not ( = ?auto_132465 ?auto_132468 ) ) ( not ( = ?auto_132465 ?auto_132469 ) ) ( not ( = ?auto_132465 ?auto_132470 ) ) ( not ( = ?auto_132466 ?auto_132467 ) ) ( not ( = ?auto_132466 ?auto_132468 ) ) ( not ( = ?auto_132466 ?auto_132469 ) ) ( not ( = ?auto_132466 ?auto_132470 ) ) ( not ( = ?auto_132467 ?auto_132468 ) ) ( not ( = ?auto_132467 ?auto_132469 ) ) ( not ( = ?auto_132467 ?auto_132470 ) ) ( not ( = ?auto_132468 ?auto_132469 ) ) ( not ( = ?auto_132468 ?auto_132470 ) ) ( not ( = ?auto_132469 ?auto_132470 ) ) ( ON ?auto_132470 ?auto_132471 ) ( not ( = ?auto_132465 ?auto_132471 ) ) ( not ( = ?auto_132466 ?auto_132471 ) ) ( not ( = ?auto_132467 ?auto_132471 ) ) ( not ( = ?auto_132468 ?auto_132471 ) ) ( not ( = ?auto_132469 ?auto_132471 ) ) ( not ( = ?auto_132470 ?auto_132471 ) ) ( ON ?auto_132469 ?auto_132470 ) ( ON-TABLE ?auto_132471 ) ( ON ?auto_132468 ?auto_132469 ) ( ON ?auto_132467 ?auto_132468 ) ( CLEAR ?auto_132467 ) ( HOLDING ?auto_132466 ) ( CLEAR ?auto_132465 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_132465 ?auto_132466 )
      ( MAKE-6PILE ?auto_132465 ?auto_132466 ?auto_132467 ?auto_132468 ?auto_132469 ?auto_132470 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_132472 - BLOCK
      ?auto_132473 - BLOCK
      ?auto_132474 - BLOCK
      ?auto_132475 - BLOCK
      ?auto_132476 - BLOCK
      ?auto_132477 - BLOCK
    )
    :vars
    (
      ?auto_132478 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132472 ) ( not ( = ?auto_132472 ?auto_132473 ) ) ( not ( = ?auto_132472 ?auto_132474 ) ) ( not ( = ?auto_132472 ?auto_132475 ) ) ( not ( = ?auto_132472 ?auto_132476 ) ) ( not ( = ?auto_132472 ?auto_132477 ) ) ( not ( = ?auto_132473 ?auto_132474 ) ) ( not ( = ?auto_132473 ?auto_132475 ) ) ( not ( = ?auto_132473 ?auto_132476 ) ) ( not ( = ?auto_132473 ?auto_132477 ) ) ( not ( = ?auto_132474 ?auto_132475 ) ) ( not ( = ?auto_132474 ?auto_132476 ) ) ( not ( = ?auto_132474 ?auto_132477 ) ) ( not ( = ?auto_132475 ?auto_132476 ) ) ( not ( = ?auto_132475 ?auto_132477 ) ) ( not ( = ?auto_132476 ?auto_132477 ) ) ( ON ?auto_132477 ?auto_132478 ) ( not ( = ?auto_132472 ?auto_132478 ) ) ( not ( = ?auto_132473 ?auto_132478 ) ) ( not ( = ?auto_132474 ?auto_132478 ) ) ( not ( = ?auto_132475 ?auto_132478 ) ) ( not ( = ?auto_132476 ?auto_132478 ) ) ( not ( = ?auto_132477 ?auto_132478 ) ) ( ON ?auto_132476 ?auto_132477 ) ( ON-TABLE ?auto_132478 ) ( ON ?auto_132475 ?auto_132476 ) ( ON ?auto_132474 ?auto_132475 ) ( CLEAR ?auto_132472 ) ( ON ?auto_132473 ?auto_132474 ) ( CLEAR ?auto_132473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_132478 ?auto_132477 ?auto_132476 ?auto_132475 ?auto_132474 )
      ( MAKE-6PILE ?auto_132472 ?auto_132473 ?auto_132474 ?auto_132475 ?auto_132476 ?auto_132477 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_132479 - BLOCK
      ?auto_132480 - BLOCK
      ?auto_132481 - BLOCK
      ?auto_132482 - BLOCK
      ?auto_132483 - BLOCK
      ?auto_132484 - BLOCK
    )
    :vars
    (
      ?auto_132485 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132479 ?auto_132480 ) ) ( not ( = ?auto_132479 ?auto_132481 ) ) ( not ( = ?auto_132479 ?auto_132482 ) ) ( not ( = ?auto_132479 ?auto_132483 ) ) ( not ( = ?auto_132479 ?auto_132484 ) ) ( not ( = ?auto_132480 ?auto_132481 ) ) ( not ( = ?auto_132480 ?auto_132482 ) ) ( not ( = ?auto_132480 ?auto_132483 ) ) ( not ( = ?auto_132480 ?auto_132484 ) ) ( not ( = ?auto_132481 ?auto_132482 ) ) ( not ( = ?auto_132481 ?auto_132483 ) ) ( not ( = ?auto_132481 ?auto_132484 ) ) ( not ( = ?auto_132482 ?auto_132483 ) ) ( not ( = ?auto_132482 ?auto_132484 ) ) ( not ( = ?auto_132483 ?auto_132484 ) ) ( ON ?auto_132484 ?auto_132485 ) ( not ( = ?auto_132479 ?auto_132485 ) ) ( not ( = ?auto_132480 ?auto_132485 ) ) ( not ( = ?auto_132481 ?auto_132485 ) ) ( not ( = ?auto_132482 ?auto_132485 ) ) ( not ( = ?auto_132483 ?auto_132485 ) ) ( not ( = ?auto_132484 ?auto_132485 ) ) ( ON ?auto_132483 ?auto_132484 ) ( ON-TABLE ?auto_132485 ) ( ON ?auto_132482 ?auto_132483 ) ( ON ?auto_132481 ?auto_132482 ) ( ON ?auto_132480 ?auto_132481 ) ( CLEAR ?auto_132480 ) ( HOLDING ?auto_132479 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_132479 )
      ( MAKE-6PILE ?auto_132479 ?auto_132480 ?auto_132481 ?auto_132482 ?auto_132483 ?auto_132484 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_132486 - BLOCK
      ?auto_132487 - BLOCK
      ?auto_132488 - BLOCK
      ?auto_132489 - BLOCK
      ?auto_132490 - BLOCK
      ?auto_132491 - BLOCK
    )
    :vars
    (
      ?auto_132492 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132486 ?auto_132487 ) ) ( not ( = ?auto_132486 ?auto_132488 ) ) ( not ( = ?auto_132486 ?auto_132489 ) ) ( not ( = ?auto_132486 ?auto_132490 ) ) ( not ( = ?auto_132486 ?auto_132491 ) ) ( not ( = ?auto_132487 ?auto_132488 ) ) ( not ( = ?auto_132487 ?auto_132489 ) ) ( not ( = ?auto_132487 ?auto_132490 ) ) ( not ( = ?auto_132487 ?auto_132491 ) ) ( not ( = ?auto_132488 ?auto_132489 ) ) ( not ( = ?auto_132488 ?auto_132490 ) ) ( not ( = ?auto_132488 ?auto_132491 ) ) ( not ( = ?auto_132489 ?auto_132490 ) ) ( not ( = ?auto_132489 ?auto_132491 ) ) ( not ( = ?auto_132490 ?auto_132491 ) ) ( ON ?auto_132491 ?auto_132492 ) ( not ( = ?auto_132486 ?auto_132492 ) ) ( not ( = ?auto_132487 ?auto_132492 ) ) ( not ( = ?auto_132488 ?auto_132492 ) ) ( not ( = ?auto_132489 ?auto_132492 ) ) ( not ( = ?auto_132490 ?auto_132492 ) ) ( not ( = ?auto_132491 ?auto_132492 ) ) ( ON ?auto_132490 ?auto_132491 ) ( ON-TABLE ?auto_132492 ) ( ON ?auto_132489 ?auto_132490 ) ( ON ?auto_132488 ?auto_132489 ) ( ON ?auto_132487 ?auto_132488 ) ( ON ?auto_132486 ?auto_132487 ) ( CLEAR ?auto_132486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_132492 ?auto_132491 ?auto_132490 ?auto_132489 ?auto_132488 ?auto_132487 )
      ( MAKE-6PILE ?auto_132486 ?auto_132487 ?auto_132488 ?auto_132489 ?auto_132490 ?auto_132491 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_132493 - BLOCK
      ?auto_132494 - BLOCK
      ?auto_132495 - BLOCK
      ?auto_132496 - BLOCK
      ?auto_132497 - BLOCK
      ?auto_132498 - BLOCK
    )
    :vars
    (
      ?auto_132499 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132493 ?auto_132494 ) ) ( not ( = ?auto_132493 ?auto_132495 ) ) ( not ( = ?auto_132493 ?auto_132496 ) ) ( not ( = ?auto_132493 ?auto_132497 ) ) ( not ( = ?auto_132493 ?auto_132498 ) ) ( not ( = ?auto_132494 ?auto_132495 ) ) ( not ( = ?auto_132494 ?auto_132496 ) ) ( not ( = ?auto_132494 ?auto_132497 ) ) ( not ( = ?auto_132494 ?auto_132498 ) ) ( not ( = ?auto_132495 ?auto_132496 ) ) ( not ( = ?auto_132495 ?auto_132497 ) ) ( not ( = ?auto_132495 ?auto_132498 ) ) ( not ( = ?auto_132496 ?auto_132497 ) ) ( not ( = ?auto_132496 ?auto_132498 ) ) ( not ( = ?auto_132497 ?auto_132498 ) ) ( ON ?auto_132498 ?auto_132499 ) ( not ( = ?auto_132493 ?auto_132499 ) ) ( not ( = ?auto_132494 ?auto_132499 ) ) ( not ( = ?auto_132495 ?auto_132499 ) ) ( not ( = ?auto_132496 ?auto_132499 ) ) ( not ( = ?auto_132497 ?auto_132499 ) ) ( not ( = ?auto_132498 ?auto_132499 ) ) ( ON ?auto_132497 ?auto_132498 ) ( ON-TABLE ?auto_132499 ) ( ON ?auto_132496 ?auto_132497 ) ( ON ?auto_132495 ?auto_132496 ) ( ON ?auto_132494 ?auto_132495 ) ( HOLDING ?auto_132493 ) ( CLEAR ?auto_132494 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_132499 ?auto_132498 ?auto_132497 ?auto_132496 ?auto_132495 ?auto_132494 ?auto_132493 )
      ( MAKE-6PILE ?auto_132493 ?auto_132494 ?auto_132495 ?auto_132496 ?auto_132497 ?auto_132498 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_132500 - BLOCK
      ?auto_132501 - BLOCK
      ?auto_132502 - BLOCK
      ?auto_132503 - BLOCK
      ?auto_132504 - BLOCK
      ?auto_132505 - BLOCK
    )
    :vars
    (
      ?auto_132506 - BLOCK
      ?auto_132507 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132500 ?auto_132501 ) ) ( not ( = ?auto_132500 ?auto_132502 ) ) ( not ( = ?auto_132500 ?auto_132503 ) ) ( not ( = ?auto_132500 ?auto_132504 ) ) ( not ( = ?auto_132500 ?auto_132505 ) ) ( not ( = ?auto_132501 ?auto_132502 ) ) ( not ( = ?auto_132501 ?auto_132503 ) ) ( not ( = ?auto_132501 ?auto_132504 ) ) ( not ( = ?auto_132501 ?auto_132505 ) ) ( not ( = ?auto_132502 ?auto_132503 ) ) ( not ( = ?auto_132502 ?auto_132504 ) ) ( not ( = ?auto_132502 ?auto_132505 ) ) ( not ( = ?auto_132503 ?auto_132504 ) ) ( not ( = ?auto_132503 ?auto_132505 ) ) ( not ( = ?auto_132504 ?auto_132505 ) ) ( ON ?auto_132505 ?auto_132506 ) ( not ( = ?auto_132500 ?auto_132506 ) ) ( not ( = ?auto_132501 ?auto_132506 ) ) ( not ( = ?auto_132502 ?auto_132506 ) ) ( not ( = ?auto_132503 ?auto_132506 ) ) ( not ( = ?auto_132504 ?auto_132506 ) ) ( not ( = ?auto_132505 ?auto_132506 ) ) ( ON ?auto_132504 ?auto_132505 ) ( ON-TABLE ?auto_132506 ) ( ON ?auto_132503 ?auto_132504 ) ( ON ?auto_132502 ?auto_132503 ) ( ON ?auto_132501 ?auto_132502 ) ( CLEAR ?auto_132501 ) ( ON ?auto_132500 ?auto_132507 ) ( CLEAR ?auto_132500 ) ( HAND-EMPTY ) ( not ( = ?auto_132500 ?auto_132507 ) ) ( not ( = ?auto_132501 ?auto_132507 ) ) ( not ( = ?auto_132502 ?auto_132507 ) ) ( not ( = ?auto_132503 ?auto_132507 ) ) ( not ( = ?auto_132504 ?auto_132507 ) ) ( not ( = ?auto_132505 ?auto_132507 ) ) ( not ( = ?auto_132506 ?auto_132507 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_132500 ?auto_132507 )
      ( MAKE-6PILE ?auto_132500 ?auto_132501 ?auto_132502 ?auto_132503 ?auto_132504 ?auto_132505 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_132508 - BLOCK
      ?auto_132509 - BLOCK
      ?auto_132510 - BLOCK
      ?auto_132511 - BLOCK
      ?auto_132512 - BLOCK
      ?auto_132513 - BLOCK
    )
    :vars
    (
      ?auto_132515 - BLOCK
      ?auto_132514 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132508 ?auto_132509 ) ) ( not ( = ?auto_132508 ?auto_132510 ) ) ( not ( = ?auto_132508 ?auto_132511 ) ) ( not ( = ?auto_132508 ?auto_132512 ) ) ( not ( = ?auto_132508 ?auto_132513 ) ) ( not ( = ?auto_132509 ?auto_132510 ) ) ( not ( = ?auto_132509 ?auto_132511 ) ) ( not ( = ?auto_132509 ?auto_132512 ) ) ( not ( = ?auto_132509 ?auto_132513 ) ) ( not ( = ?auto_132510 ?auto_132511 ) ) ( not ( = ?auto_132510 ?auto_132512 ) ) ( not ( = ?auto_132510 ?auto_132513 ) ) ( not ( = ?auto_132511 ?auto_132512 ) ) ( not ( = ?auto_132511 ?auto_132513 ) ) ( not ( = ?auto_132512 ?auto_132513 ) ) ( ON ?auto_132513 ?auto_132515 ) ( not ( = ?auto_132508 ?auto_132515 ) ) ( not ( = ?auto_132509 ?auto_132515 ) ) ( not ( = ?auto_132510 ?auto_132515 ) ) ( not ( = ?auto_132511 ?auto_132515 ) ) ( not ( = ?auto_132512 ?auto_132515 ) ) ( not ( = ?auto_132513 ?auto_132515 ) ) ( ON ?auto_132512 ?auto_132513 ) ( ON-TABLE ?auto_132515 ) ( ON ?auto_132511 ?auto_132512 ) ( ON ?auto_132510 ?auto_132511 ) ( ON ?auto_132508 ?auto_132514 ) ( CLEAR ?auto_132508 ) ( not ( = ?auto_132508 ?auto_132514 ) ) ( not ( = ?auto_132509 ?auto_132514 ) ) ( not ( = ?auto_132510 ?auto_132514 ) ) ( not ( = ?auto_132511 ?auto_132514 ) ) ( not ( = ?auto_132512 ?auto_132514 ) ) ( not ( = ?auto_132513 ?auto_132514 ) ) ( not ( = ?auto_132515 ?auto_132514 ) ) ( HOLDING ?auto_132509 ) ( CLEAR ?auto_132510 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_132515 ?auto_132513 ?auto_132512 ?auto_132511 ?auto_132510 ?auto_132509 )
      ( MAKE-6PILE ?auto_132508 ?auto_132509 ?auto_132510 ?auto_132511 ?auto_132512 ?auto_132513 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_132516 - BLOCK
      ?auto_132517 - BLOCK
      ?auto_132518 - BLOCK
      ?auto_132519 - BLOCK
      ?auto_132520 - BLOCK
      ?auto_132521 - BLOCK
    )
    :vars
    (
      ?auto_132523 - BLOCK
      ?auto_132522 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132516 ?auto_132517 ) ) ( not ( = ?auto_132516 ?auto_132518 ) ) ( not ( = ?auto_132516 ?auto_132519 ) ) ( not ( = ?auto_132516 ?auto_132520 ) ) ( not ( = ?auto_132516 ?auto_132521 ) ) ( not ( = ?auto_132517 ?auto_132518 ) ) ( not ( = ?auto_132517 ?auto_132519 ) ) ( not ( = ?auto_132517 ?auto_132520 ) ) ( not ( = ?auto_132517 ?auto_132521 ) ) ( not ( = ?auto_132518 ?auto_132519 ) ) ( not ( = ?auto_132518 ?auto_132520 ) ) ( not ( = ?auto_132518 ?auto_132521 ) ) ( not ( = ?auto_132519 ?auto_132520 ) ) ( not ( = ?auto_132519 ?auto_132521 ) ) ( not ( = ?auto_132520 ?auto_132521 ) ) ( ON ?auto_132521 ?auto_132523 ) ( not ( = ?auto_132516 ?auto_132523 ) ) ( not ( = ?auto_132517 ?auto_132523 ) ) ( not ( = ?auto_132518 ?auto_132523 ) ) ( not ( = ?auto_132519 ?auto_132523 ) ) ( not ( = ?auto_132520 ?auto_132523 ) ) ( not ( = ?auto_132521 ?auto_132523 ) ) ( ON ?auto_132520 ?auto_132521 ) ( ON-TABLE ?auto_132523 ) ( ON ?auto_132519 ?auto_132520 ) ( ON ?auto_132518 ?auto_132519 ) ( ON ?auto_132516 ?auto_132522 ) ( not ( = ?auto_132516 ?auto_132522 ) ) ( not ( = ?auto_132517 ?auto_132522 ) ) ( not ( = ?auto_132518 ?auto_132522 ) ) ( not ( = ?auto_132519 ?auto_132522 ) ) ( not ( = ?auto_132520 ?auto_132522 ) ) ( not ( = ?auto_132521 ?auto_132522 ) ) ( not ( = ?auto_132523 ?auto_132522 ) ) ( CLEAR ?auto_132518 ) ( ON ?auto_132517 ?auto_132516 ) ( CLEAR ?auto_132517 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_132522 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_132522 ?auto_132516 )
      ( MAKE-6PILE ?auto_132516 ?auto_132517 ?auto_132518 ?auto_132519 ?auto_132520 ?auto_132521 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_132524 - BLOCK
      ?auto_132525 - BLOCK
      ?auto_132526 - BLOCK
      ?auto_132527 - BLOCK
      ?auto_132528 - BLOCK
      ?auto_132529 - BLOCK
    )
    :vars
    (
      ?auto_132530 - BLOCK
      ?auto_132531 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132524 ?auto_132525 ) ) ( not ( = ?auto_132524 ?auto_132526 ) ) ( not ( = ?auto_132524 ?auto_132527 ) ) ( not ( = ?auto_132524 ?auto_132528 ) ) ( not ( = ?auto_132524 ?auto_132529 ) ) ( not ( = ?auto_132525 ?auto_132526 ) ) ( not ( = ?auto_132525 ?auto_132527 ) ) ( not ( = ?auto_132525 ?auto_132528 ) ) ( not ( = ?auto_132525 ?auto_132529 ) ) ( not ( = ?auto_132526 ?auto_132527 ) ) ( not ( = ?auto_132526 ?auto_132528 ) ) ( not ( = ?auto_132526 ?auto_132529 ) ) ( not ( = ?auto_132527 ?auto_132528 ) ) ( not ( = ?auto_132527 ?auto_132529 ) ) ( not ( = ?auto_132528 ?auto_132529 ) ) ( ON ?auto_132529 ?auto_132530 ) ( not ( = ?auto_132524 ?auto_132530 ) ) ( not ( = ?auto_132525 ?auto_132530 ) ) ( not ( = ?auto_132526 ?auto_132530 ) ) ( not ( = ?auto_132527 ?auto_132530 ) ) ( not ( = ?auto_132528 ?auto_132530 ) ) ( not ( = ?auto_132529 ?auto_132530 ) ) ( ON ?auto_132528 ?auto_132529 ) ( ON-TABLE ?auto_132530 ) ( ON ?auto_132527 ?auto_132528 ) ( ON ?auto_132524 ?auto_132531 ) ( not ( = ?auto_132524 ?auto_132531 ) ) ( not ( = ?auto_132525 ?auto_132531 ) ) ( not ( = ?auto_132526 ?auto_132531 ) ) ( not ( = ?auto_132527 ?auto_132531 ) ) ( not ( = ?auto_132528 ?auto_132531 ) ) ( not ( = ?auto_132529 ?auto_132531 ) ) ( not ( = ?auto_132530 ?auto_132531 ) ) ( ON ?auto_132525 ?auto_132524 ) ( CLEAR ?auto_132525 ) ( ON-TABLE ?auto_132531 ) ( HOLDING ?auto_132526 ) ( CLEAR ?auto_132527 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_132530 ?auto_132529 ?auto_132528 ?auto_132527 ?auto_132526 )
      ( MAKE-6PILE ?auto_132524 ?auto_132525 ?auto_132526 ?auto_132527 ?auto_132528 ?auto_132529 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_132532 - BLOCK
      ?auto_132533 - BLOCK
      ?auto_132534 - BLOCK
      ?auto_132535 - BLOCK
      ?auto_132536 - BLOCK
      ?auto_132537 - BLOCK
    )
    :vars
    (
      ?auto_132538 - BLOCK
      ?auto_132539 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132532 ?auto_132533 ) ) ( not ( = ?auto_132532 ?auto_132534 ) ) ( not ( = ?auto_132532 ?auto_132535 ) ) ( not ( = ?auto_132532 ?auto_132536 ) ) ( not ( = ?auto_132532 ?auto_132537 ) ) ( not ( = ?auto_132533 ?auto_132534 ) ) ( not ( = ?auto_132533 ?auto_132535 ) ) ( not ( = ?auto_132533 ?auto_132536 ) ) ( not ( = ?auto_132533 ?auto_132537 ) ) ( not ( = ?auto_132534 ?auto_132535 ) ) ( not ( = ?auto_132534 ?auto_132536 ) ) ( not ( = ?auto_132534 ?auto_132537 ) ) ( not ( = ?auto_132535 ?auto_132536 ) ) ( not ( = ?auto_132535 ?auto_132537 ) ) ( not ( = ?auto_132536 ?auto_132537 ) ) ( ON ?auto_132537 ?auto_132538 ) ( not ( = ?auto_132532 ?auto_132538 ) ) ( not ( = ?auto_132533 ?auto_132538 ) ) ( not ( = ?auto_132534 ?auto_132538 ) ) ( not ( = ?auto_132535 ?auto_132538 ) ) ( not ( = ?auto_132536 ?auto_132538 ) ) ( not ( = ?auto_132537 ?auto_132538 ) ) ( ON ?auto_132536 ?auto_132537 ) ( ON-TABLE ?auto_132538 ) ( ON ?auto_132535 ?auto_132536 ) ( ON ?auto_132532 ?auto_132539 ) ( not ( = ?auto_132532 ?auto_132539 ) ) ( not ( = ?auto_132533 ?auto_132539 ) ) ( not ( = ?auto_132534 ?auto_132539 ) ) ( not ( = ?auto_132535 ?auto_132539 ) ) ( not ( = ?auto_132536 ?auto_132539 ) ) ( not ( = ?auto_132537 ?auto_132539 ) ) ( not ( = ?auto_132538 ?auto_132539 ) ) ( ON ?auto_132533 ?auto_132532 ) ( ON-TABLE ?auto_132539 ) ( CLEAR ?auto_132535 ) ( ON ?auto_132534 ?auto_132533 ) ( CLEAR ?auto_132534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_132539 ?auto_132532 ?auto_132533 )
      ( MAKE-6PILE ?auto_132532 ?auto_132533 ?auto_132534 ?auto_132535 ?auto_132536 ?auto_132537 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_132540 - BLOCK
      ?auto_132541 - BLOCK
      ?auto_132542 - BLOCK
      ?auto_132543 - BLOCK
      ?auto_132544 - BLOCK
      ?auto_132545 - BLOCK
    )
    :vars
    (
      ?auto_132547 - BLOCK
      ?auto_132546 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132540 ?auto_132541 ) ) ( not ( = ?auto_132540 ?auto_132542 ) ) ( not ( = ?auto_132540 ?auto_132543 ) ) ( not ( = ?auto_132540 ?auto_132544 ) ) ( not ( = ?auto_132540 ?auto_132545 ) ) ( not ( = ?auto_132541 ?auto_132542 ) ) ( not ( = ?auto_132541 ?auto_132543 ) ) ( not ( = ?auto_132541 ?auto_132544 ) ) ( not ( = ?auto_132541 ?auto_132545 ) ) ( not ( = ?auto_132542 ?auto_132543 ) ) ( not ( = ?auto_132542 ?auto_132544 ) ) ( not ( = ?auto_132542 ?auto_132545 ) ) ( not ( = ?auto_132543 ?auto_132544 ) ) ( not ( = ?auto_132543 ?auto_132545 ) ) ( not ( = ?auto_132544 ?auto_132545 ) ) ( ON ?auto_132545 ?auto_132547 ) ( not ( = ?auto_132540 ?auto_132547 ) ) ( not ( = ?auto_132541 ?auto_132547 ) ) ( not ( = ?auto_132542 ?auto_132547 ) ) ( not ( = ?auto_132543 ?auto_132547 ) ) ( not ( = ?auto_132544 ?auto_132547 ) ) ( not ( = ?auto_132545 ?auto_132547 ) ) ( ON ?auto_132544 ?auto_132545 ) ( ON-TABLE ?auto_132547 ) ( ON ?auto_132540 ?auto_132546 ) ( not ( = ?auto_132540 ?auto_132546 ) ) ( not ( = ?auto_132541 ?auto_132546 ) ) ( not ( = ?auto_132542 ?auto_132546 ) ) ( not ( = ?auto_132543 ?auto_132546 ) ) ( not ( = ?auto_132544 ?auto_132546 ) ) ( not ( = ?auto_132545 ?auto_132546 ) ) ( not ( = ?auto_132547 ?auto_132546 ) ) ( ON ?auto_132541 ?auto_132540 ) ( ON-TABLE ?auto_132546 ) ( ON ?auto_132542 ?auto_132541 ) ( CLEAR ?auto_132542 ) ( HOLDING ?auto_132543 ) ( CLEAR ?auto_132544 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_132547 ?auto_132545 ?auto_132544 ?auto_132543 )
      ( MAKE-6PILE ?auto_132540 ?auto_132541 ?auto_132542 ?auto_132543 ?auto_132544 ?auto_132545 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_132548 - BLOCK
      ?auto_132549 - BLOCK
      ?auto_132550 - BLOCK
      ?auto_132551 - BLOCK
      ?auto_132552 - BLOCK
      ?auto_132553 - BLOCK
    )
    :vars
    (
      ?auto_132554 - BLOCK
      ?auto_132555 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132548 ?auto_132549 ) ) ( not ( = ?auto_132548 ?auto_132550 ) ) ( not ( = ?auto_132548 ?auto_132551 ) ) ( not ( = ?auto_132548 ?auto_132552 ) ) ( not ( = ?auto_132548 ?auto_132553 ) ) ( not ( = ?auto_132549 ?auto_132550 ) ) ( not ( = ?auto_132549 ?auto_132551 ) ) ( not ( = ?auto_132549 ?auto_132552 ) ) ( not ( = ?auto_132549 ?auto_132553 ) ) ( not ( = ?auto_132550 ?auto_132551 ) ) ( not ( = ?auto_132550 ?auto_132552 ) ) ( not ( = ?auto_132550 ?auto_132553 ) ) ( not ( = ?auto_132551 ?auto_132552 ) ) ( not ( = ?auto_132551 ?auto_132553 ) ) ( not ( = ?auto_132552 ?auto_132553 ) ) ( ON ?auto_132553 ?auto_132554 ) ( not ( = ?auto_132548 ?auto_132554 ) ) ( not ( = ?auto_132549 ?auto_132554 ) ) ( not ( = ?auto_132550 ?auto_132554 ) ) ( not ( = ?auto_132551 ?auto_132554 ) ) ( not ( = ?auto_132552 ?auto_132554 ) ) ( not ( = ?auto_132553 ?auto_132554 ) ) ( ON ?auto_132552 ?auto_132553 ) ( ON-TABLE ?auto_132554 ) ( ON ?auto_132548 ?auto_132555 ) ( not ( = ?auto_132548 ?auto_132555 ) ) ( not ( = ?auto_132549 ?auto_132555 ) ) ( not ( = ?auto_132550 ?auto_132555 ) ) ( not ( = ?auto_132551 ?auto_132555 ) ) ( not ( = ?auto_132552 ?auto_132555 ) ) ( not ( = ?auto_132553 ?auto_132555 ) ) ( not ( = ?auto_132554 ?auto_132555 ) ) ( ON ?auto_132549 ?auto_132548 ) ( ON-TABLE ?auto_132555 ) ( ON ?auto_132550 ?auto_132549 ) ( CLEAR ?auto_132552 ) ( ON ?auto_132551 ?auto_132550 ) ( CLEAR ?auto_132551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_132555 ?auto_132548 ?auto_132549 ?auto_132550 )
      ( MAKE-6PILE ?auto_132548 ?auto_132549 ?auto_132550 ?auto_132551 ?auto_132552 ?auto_132553 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_132556 - BLOCK
      ?auto_132557 - BLOCK
      ?auto_132558 - BLOCK
      ?auto_132559 - BLOCK
      ?auto_132560 - BLOCK
      ?auto_132561 - BLOCK
    )
    :vars
    (
      ?auto_132562 - BLOCK
      ?auto_132563 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132556 ?auto_132557 ) ) ( not ( = ?auto_132556 ?auto_132558 ) ) ( not ( = ?auto_132556 ?auto_132559 ) ) ( not ( = ?auto_132556 ?auto_132560 ) ) ( not ( = ?auto_132556 ?auto_132561 ) ) ( not ( = ?auto_132557 ?auto_132558 ) ) ( not ( = ?auto_132557 ?auto_132559 ) ) ( not ( = ?auto_132557 ?auto_132560 ) ) ( not ( = ?auto_132557 ?auto_132561 ) ) ( not ( = ?auto_132558 ?auto_132559 ) ) ( not ( = ?auto_132558 ?auto_132560 ) ) ( not ( = ?auto_132558 ?auto_132561 ) ) ( not ( = ?auto_132559 ?auto_132560 ) ) ( not ( = ?auto_132559 ?auto_132561 ) ) ( not ( = ?auto_132560 ?auto_132561 ) ) ( ON ?auto_132561 ?auto_132562 ) ( not ( = ?auto_132556 ?auto_132562 ) ) ( not ( = ?auto_132557 ?auto_132562 ) ) ( not ( = ?auto_132558 ?auto_132562 ) ) ( not ( = ?auto_132559 ?auto_132562 ) ) ( not ( = ?auto_132560 ?auto_132562 ) ) ( not ( = ?auto_132561 ?auto_132562 ) ) ( ON-TABLE ?auto_132562 ) ( ON ?auto_132556 ?auto_132563 ) ( not ( = ?auto_132556 ?auto_132563 ) ) ( not ( = ?auto_132557 ?auto_132563 ) ) ( not ( = ?auto_132558 ?auto_132563 ) ) ( not ( = ?auto_132559 ?auto_132563 ) ) ( not ( = ?auto_132560 ?auto_132563 ) ) ( not ( = ?auto_132561 ?auto_132563 ) ) ( not ( = ?auto_132562 ?auto_132563 ) ) ( ON ?auto_132557 ?auto_132556 ) ( ON-TABLE ?auto_132563 ) ( ON ?auto_132558 ?auto_132557 ) ( ON ?auto_132559 ?auto_132558 ) ( CLEAR ?auto_132559 ) ( HOLDING ?auto_132560 ) ( CLEAR ?auto_132561 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_132562 ?auto_132561 ?auto_132560 )
      ( MAKE-6PILE ?auto_132556 ?auto_132557 ?auto_132558 ?auto_132559 ?auto_132560 ?auto_132561 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_132564 - BLOCK
      ?auto_132565 - BLOCK
      ?auto_132566 - BLOCK
      ?auto_132567 - BLOCK
      ?auto_132568 - BLOCK
      ?auto_132569 - BLOCK
    )
    :vars
    (
      ?auto_132570 - BLOCK
      ?auto_132571 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132564 ?auto_132565 ) ) ( not ( = ?auto_132564 ?auto_132566 ) ) ( not ( = ?auto_132564 ?auto_132567 ) ) ( not ( = ?auto_132564 ?auto_132568 ) ) ( not ( = ?auto_132564 ?auto_132569 ) ) ( not ( = ?auto_132565 ?auto_132566 ) ) ( not ( = ?auto_132565 ?auto_132567 ) ) ( not ( = ?auto_132565 ?auto_132568 ) ) ( not ( = ?auto_132565 ?auto_132569 ) ) ( not ( = ?auto_132566 ?auto_132567 ) ) ( not ( = ?auto_132566 ?auto_132568 ) ) ( not ( = ?auto_132566 ?auto_132569 ) ) ( not ( = ?auto_132567 ?auto_132568 ) ) ( not ( = ?auto_132567 ?auto_132569 ) ) ( not ( = ?auto_132568 ?auto_132569 ) ) ( ON ?auto_132569 ?auto_132570 ) ( not ( = ?auto_132564 ?auto_132570 ) ) ( not ( = ?auto_132565 ?auto_132570 ) ) ( not ( = ?auto_132566 ?auto_132570 ) ) ( not ( = ?auto_132567 ?auto_132570 ) ) ( not ( = ?auto_132568 ?auto_132570 ) ) ( not ( = ?auto_132569 ?auto_132570 ) ) ( ON-TABLE ?auto_132570 ) ( ON ?auto_132564 ?auto_132571 ) ( not ( = ?auto_132564 ?auto_132571 ) ) ( not ( = ?auto_132565 ?auto_132571 ) ) ( not ( = ?auto_132566 ?auto_132571 ) ) ( not ( = ?auto_132567 ?auto_132571 ) ) ( not ( = ?auto_132568 ?auto_132571 ) ) ( not ( = ?auto_132569 ?auto_132571 ) ) ( not ( = ?auto_132570 ?auto_132571 ) ) ( ON ?auto_132565 ?auto_132564 ) ( ON-TABLE ?auto_132571 ) ( ON ?auto_132566 ?auto_132565 ) ( ON ?auto_132567 ?auto_132566 ) ( CLEAR ?auto_132569 ) ( ON ?auto_132568 ?auto_132567 ) ( CLEAR ?auto_132568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_132571 ?auto_132564 ?auto_132565 ?auto_132566 ?auto_132567 )
      ( MAKE-6PILE ?auto_132564 ?auto_132565 ?auto_132566 ?auto_132567 ?auto_132568 ?auto_132569 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_132572 - BLOCK
      ?auto_132573 - BLOCK
      ?auto_132574 - BLOCK
      ?auto_132575 - BLOCK
      ?auto_132576 - BLOCK
      ?auto_132577 - BLOCK
    )
    :vars
    (
      ?auto_132578 - BLOCK
      ?auto_132579 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132572 ?auto_132573 ) ) ( not ( = ?auto_132572 ?auto_132574 ) ) ( not ( = ?auto_132572 ?auto_132575 ) ) ( not ( = ?auto_132572 ?auto_132576 ) ) ( not ( = ?auto_132572 ?auto_132577 ) ) ( not ( = ?auto_132573 ?auto_132574 ) ) ( not ( = ?auto_132573 ?auto_132575 ) ) ( not ( = ?auto_132573 ?auto_132576 ) ) ( not ( = ?auto_132573 ?auto_132577 ) ) ( not ( = ?auto_132574 ?auto_132575 ) ) ( not ( = ?auto_132574 ?auto_132576 ) ) ( not ( = ?auto_132574 ?auto_132577 ) ) ( not ( = ?auto_132575 ?auto_132576 ) ) ( not ( = ?auto_132575 ?auto_132577 ) ) ( not ( = ?auto_132576 ?auto_132577 ) ) ( not ( = ?auto_132572 ?auto_132578 ) ) ( not ( = ?auto_132573 ?auto_132578 ) ) ( not ( = ?auto_132574 ?auto_132578 ) ) ( not ( = ?auto_132575 ?auto_132578 ) ) ( not ( = ?auto_132576 ?auto_132578 ) ) ( not ( = ?auto_132577 ?auto_132578 ) ) ( ON-TABLE ?auto_132578 ) ( ON ?auto_132572 ?auto_132579 ) ( not ( = ?auto_132572 ?auto_132579 ) ) ( not ( = ?auto_132573 ?auto_132579 ) ) ( not ( = ?auto_132574 ?auto_132579 ) ) ( not ( = ?auto_132575 ?auto_132579 ) ) ( not ( = ?auto_132576 ?auto_132579 ) ) ( not ( = ?auto_132577 ?auto_132579 ) ) ( not ( = ?auto_132578 ?auto_132579 ) ) ( ON ?auto_132573 ?auto_132572 ) ( ON-TABLE ?auto_132579 ) ( ON ?auto_132574 ?auto_132573 ) ( ON ?auto_132575 ?auto_132574 ) ( ON ?auto_132576 ?auto_132575 ) ( CLEAR ?auto_132576 ) ( HOLDING ?auto_132577 ) ( CLEAR ?auto_132578 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_132578 ?auto_132577 )
      ( MAKE-6PILE ?auto_132572 ?auto_132573 ?auto_132574 ?auto_132575 ?auto_132576 ?auto_132577 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_132580 - BLOCK
      ?auto_132581 - BLOCK
      ?auto_132582 - BLOCK
      ?auto_132583 - BLOCK
      ?auto_132584 - BLOCK
      ?auto_132585 - BLOCK
    )
    :vars
    (
      ?auto_132586 - BLOCK
      ?auto_132587 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132580 ?auto_132581 ) ) ( not ( = ?auto_132580 ?auto_132582 ) ) ( not ( = ?auto_132580 ?auto_132583 ) ) ( not ( = ?auto_132580 ?auto_132584 ) ) ( not ( = ?auto_132580 ?auto_132585 ) ) ( not ( = ?auto_132581 ?auto_132582 ) ) ( not ( = ?auto_132581 ?auto_132583 ) ) ( not ( = ?auto_132581 ?auto_132584 ) ) ( not ( = ?auto_132581 ?auto_132585 ) ) ( not ( = ?auto_132582 ?auto_132583 ) ) ( not ( = ?auto_132582 ?auto_132584 ) ) ( not ( = ?auto_132582 ?auto_132585 ) ) ( not ( = ?auto_132583 ?auto_132584 ) ) ( not ( = ?auto_132583 ?auto_132585 ) ) ( not ( = ?auto_132584 ?auto_132585 ) ) ( not ( = ?auto_132580 ?auto_132586 ) ) ( not ( = ?auto_132581 ?auto_132586 ) ) ( not ( = ?auto_132582 ?auto_132586 ) ) ( not ( = ?auto_132583 ?auto_132586 ) ) ( not ( = ?auto_132584 ?auto_132586 ) ) ( not ( = ?auto_132585 ?auto_132586 ) ) ( ON-TABLE ?auto_132586 ) ( ON ?auto_132580 ?auto_132587 ) ( not ( = ?auto_132580 ?auto_132587 ) ) ( not ( = ?auto_132581 ?auto_132587 ) ) ( not ( = ?auto_132582 ?auto_132587 ) ) ( not ( = ?auto_132583 ?auto_132587 ) ) ( not ( = ?auto_132584 ?auto_132587 ) ) ( not ( = ?auto_132585 ?auto_132587 ) ) ( not ( = ?auto_132586 ?auto_132587 ) ) ( ON ?auto_132581 ?auto_132580 ) ( ON-TABLE ?auto_132587 ) ( ON ?auto_132582 ?auto_132581 ) ( ON ?auto_132583 ?auto_132582 ) ( ON ?auto_132584 ?auto_132583 ) ( CLEAR ?auto_132586 ) ( ON ?auto_132585 ?auto_132584 ) ( CLEAR ?auto_132585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_132587 ?auto_132580 ?auto_132581 ?auto_132582 ?auto_132583 ?auto_132584 )
      ( MAKE-6PILE ?auto_132580 ?auto_132581 ?auto_132582 ?auto_132583 ?auto_132584 ?auto_132585 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_132588 - BLOCK
      ?auto_132589 - BLOCK
      ?auto_132590 - BLOCK
      ?auto_132591 - BLOCK
      ?auto_132592 - BLOCK
      ?auto_132593 - BLOCK
    )
    :vars
    (
      ?auto_132594 - BLOCK
      ?auto_132595 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132588 ?auto_132589 ) ) ( not ( = ?auto_132588 ?auto_132590 ) ) ( not ( = ?auto_132588 ?auto_132591 ) ) ( not ( = ?auto_132588 ?auto_132592 ) ) ( not ( = ?auto_132588 ?auto_132593 ) ) ( not ( = ?auto_132589 ?auto_132590 ) ) ( not ( = ?auto_132589 ?auto_132591 ) ) ( not ( = ?auto_132589 ?auto_132592 ) ) ( not ( = ?auto_132589 ?auto_132593 ) ) ( not ( = ?auto_132590 ?auto_132591 ) ) ( not ( = ?auto_132590 ?auto_132592 ) ) ( not ( = ?auto_132590 ?auto_132593 ) ) ( not ( = ?auto_132591 ?auto_132592 ) ) ( not ( = ?auto_132591 ?auto_132593 ) ) ( not ( = ?auto_132592 ?auto_132593 ) ) ( not ( = ?auto_132588 ?auto_132594 ) ) ( not ( = ?auto_132589 ?auto_132594 ) ) ( not ( = ?auto_132590 ?auto_132594 ) ) ( not ( = ?auto_132591 ?auto_132594 ) ) ( not ( = ?auto_132592 ?auto_132594 ) ) ( not ( = ?auto_132593 ?auto_132594 ) ) ( ON ?auto_132588 ?auto_132595 ) ( not ( = ?auto_132588 ?auto_132595 ) ) ( not ( = ?auto_132589 ?auto_132595 ) ) ( not ( = ?auto_132590 ?auto_132595 ) ) ( not ( = ?auto_132591 ?auto_132595 ) ) ( not ( = ?auto_132592 ?auto_132595 ) ) ( not ( = ?auto_132593 ?auto_132595 ) ) ( not ( = ?auto_132594 ?auto_132595 ) ) ( ON ?auto_132589 ?auto_132588 ) ( ON-TABLE ?auto_132595 ) ( ON ?auto_132590 ?auto_132589 ) ( ON ?auto_132591 ?auto_132590 ) ( ON ?auto_132592 ?auto_132591 ) ( ON ?auto_132593 ?auto_132592 ) ( CLEAR ?auto_132593 ) ( HOLDING ?auto_132594 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_132594 )
      ( MAKE-6PILE ?auto_132588 ?auto_132589 ?auto_132590 ?auto_132591 ?auto_132592 ?auto_132593 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_132596 - BLOCK
      ?auto_132597 - BLOCK
      ?auto_132598 - BLOCK
      ?auto_132599 - BLOCK
      ?auto_132600 - BLOCK
      ?auto_132601 - BLOCK
    )
    :vars
    (
      ?auto_132602 - BLOCK
      ?auto_132603 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132596 ?auto_132597 ) ) ( not ( = ?auto_132596 ?auto_132598 ) ) ( not ( = ?auto_132596 ?auto_132599 ) ) ( not ( = ?auto_132596 ?auto_132600 ) ) ( not ( = ?auto_132596 ?auto_132601 ) ) ( not ( = ?auto_132597 ?auto_132598 ) ) ( not ( = ?auto_132597 ?auto_132599 ) ) ( not ( = ?auto_132597 ?auto_132600 ) ) ( not ( = ?auto_132597 ?auto_132601 ) ) ( not ( = ?auto_132598 ?auto_132599 ) ) ( not ( = ?auto_132598 ?auto_132600 ) ) ( not ( = ?auto_132598 ?auto_132601 ) ) ( not ( = ?auto_132599 ?auto_132600 ) ) ( not ( = ?auto_132599 ?auto_132601 ) ) ( not ( = ?auto_132600 ?auto_132601 ) ) ( not ( = ?auto_132596 ?auto_132602 ) ) ( not ( = ?auto_132597 ?auto_132602 ) ) ( not ( = ?auto_132598 ?auto_132602 ) ) ( not ( = ?auto_132599 ?auto_132602 ) ) ( not ( = ?auto_132600 ?auto_132602 ) ) ( not ( = ?auto_132601 ?auto_132602 ) ) ( ON ?auto_132596 ?auto_132603 ) ( not ( = ?auto_132596 ?auto_132603 ) ) ( not ( = ?auto_132597 ?auto_132603 ) ) ( not ( = ?auto_132598 ?auto_132603 ) ) ( not ( = ?auto_132599 ?auto_132603 ) ) ( not ( = ?auto_132600 ?auto_132603 ) ) ( not ( = ?auto_132601 ?auto_132603 ) ) ( not ( = ?auto_132602 ?auto_132603 ) ) ( ON ?auto_132597 ?auto_132596 ) ( ON-TABLE ?auto_132603 ) ( ON ?auto_132598 ?auto_132597 ) ( ON ?auto_132599 ?auto_132598 ) ( ON ?auto_132600 ?auto_132599 ) ( ON ?auto_132601 ?auto_132600 ) ( ON ?auto_132602 ?auto_132601 ) ( CLEAR ?auto_132602 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_132603 ?auto_132596 ?auto_132597 ?auto_132598 ?auto_132599 ?auto_132600 ?auto_132601 )
      ( MAKE-6PILE ?auto_132596 ?auto_132597 ?auto_132598 ?auto_132599 ?auto_132600 ?auto_132601 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132611 - BLOCK
      ?auto_132612 - BLOCK
      ?auto_132613 - BLOCK
      ?auto_132614 - BLOCK
      ?auto_132615 - BLOCK
      ?auto_132616 - BLOCK
      ?auto_132617 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_132617 ) ( CLEAR ?auto_132616 ) ( ON-TABLE ?auto_132611 ) ( ON ?auto_132612 ?auto_132611 ) ( ON ?auto_132613 ?auto_132612 ) ( ON ?auto_132614 ?auto_132613 ) ( ON ?auto_132615 ?auto_132614 ) ( ON ?auto_132616 ?auto_132615 ) ( not ( = ?auto_132611 ?auto_132612 ) ) ( not ( = ?auto_132611 ?auto_132613 ) ) ( not ( = ?auto_132611 ?auto_132614 ) ) ( not ( = ?auto_132611 ?auto_132615 ) ) ( not ( = ?auto_132611 ?auto_132616 ) ) ( not ( = ?auto_132611 ?auto_132617 ) ) ( not ( = ?auto_132612 ?auto_132613 ) ) ( not ( = ?auto_132612 ?auto_132614 ) ) ( not ( = ?auto_132612 ?auto_132615 ) ) ( not ( = ?auto_132612 ?auto_132616 ) ) ( not ( = ?auto_132612 ?auto_132617 ) ) ( not ( = ?auto_132613 ?auto_132614 ) ) ( not ( = ?auto_132613 ?auto_132615 ) ) ( not ( = ?auto_132613 ?auto_132616 ) ) ( not ( = ?auto_132613 ?auto_132617 ) ) ( not ( = ?auto_132614 ?auto_132615 ) ) ( not ( = ?auto_132614 ?auto_132616 ) ) ( not ( = ?auto_132614 ?auto_132617 ) ) ( not ( = ?auto_132615 ?auto_132616 ) ) ( not ( = ?auto_132615 ?auto_132617 ) ) ( not ( = ?auto_132616 ?auto_132617 ) ) )
    :subtasks
    ( ( !STACK ?auto_132617 ?auto_132616 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132618 - BLOCK
      ?auto_132619 - BLOCK
      ?auto_132620 - BLOCK
      ?auto_132621 - BLOCK
      ?auto_132622 - BLOCK
      ?auto_132623 - BLOCK
      ?auto_132624 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_132623 ) ( ON-TABLE ?auto_132618 ) ( ON ?auto_132619 ?auto_132618 ) ( ON ?auto_132620 ?auto_132619 ) ( ON ?auto_132621 ?auto_132620 ) ( ON ?auto_132622 ?auto_132621 ) ( ON ?auto_132623 ?auto_132622 ) ( not ( = ?auto_132618 ?auto_132619 ) ) ( not ( = ?auto_132618 ?auto_132620 ) ) ( not ( = ?auto_132618 ?auto_132621 ) ) ( not ( = ?auto_132618 ?auto_132622 ) ) ( not ( = ?auto_132618 ?auto_132623 ) ) ( not ( = ?auto_132618 ?auto_132624 ) ) ( not ( = ?auto_132619 ?auto_132620 ) ) ( not ( = ?auto_132619 ?auto_132621 ) ) ( not ( = ?auto_132619 ?auto_132622 ) ) ( not ( = ?auto_132619 ?auto_132623 ) ) ( not ( = ?auto_132619 ?auto_132624 ) ) ( not ( = ?auto_132620 ?auto_132621 ) ) ( not ( = ?auto_132620 ?auto_132622 ) ) ( not ( = ?auto_132620 ?auto_132623 ) ) ( not ( = ?auto_132620 ?auto_132624 ) ) ( not ( = ?auto_132621 ?auto_132622 ) ) ( not ( = ?auto_132621 ?auto_132623 ) ) ( not ( = ?auto_132621 ?auto_132624 ) ) ( not ( = ?auto_132622 ?auto_132623 ) ) ( not ( = ?auto_132622 ?auto_132624 ) ) ( not ( = ?auto_132623 ?auto_132624 ) ) ( ON-TABLE ?auto_132624 ) ( CLEAR ?auto_132624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_132624 )
      ( MAKE-7PILE ?auto_132618 ?auto_132619 ?auto_132620 ?auto_132621 ?auto_132622 ?auto_132623 ?auto_132624 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132625 - BLOCK
      ?auto_132626 - BLOCK
      ?auto_132627 - BLOCK
      ?auto_132628 - BLOCK
      ?auto_132629 - BLOCK
      ?auto_132630 - BLOCK
      ?auto_132631 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132625 ) ( ON ?auto_132626 ?auto_132625 ) ( ON ?auto_132627 ?auto_132626 ) ( ON ?auto_132628 ?auto_132627 ) ( ON ?auto_132629 ?auto_132628 ) ( not ( = ?auto_132625 ?auto_132626 ) ) ( not ( = ?auto_132625 ?auto_132627 ) ) ( not ( = ?auto_132625 ?auto_132628 ) ) ( not ( = ?auto_132625 ?auto_132629 ) ) ( not ( = ?auto_132625 ?auto_132630 ) ) ( not ( = ?auto_132625 ?auto_132631 ) ) ( not ( = ?auto_132626 ?auto_132627 ) ) ( not ( = ?auto_132626 ?auto_132628 ) ) ( not ( = ?auto_132626 ?auto_132629 ) ) ( not ( = ?auto_132626 ?auto_132630 ) ) ( not ( = ?auto_132626 ?auto_132631 ) ) ( not ( = ?auto_132627 ?auto_132628 ) ) ( not ( = ?auto_132627 ?auto_132629 ) ) ( not ( = ?auto_132627 ?auto_132630 ) ) ( not ( = ?auto_132627 ?auto_132631 ) ) ( not ( = ?auto_132628 ?auto_132629 ) ) ( not ( = ?auto_132628 ?auto_132630 ) ) ( not ( = ?auto_132628 ?auto_132631 ) ) ( not ( = ?auto_132629 ?auto_132630 ) ) ( not ( = ?auto_132629 ?auto_132631 ) ) ( not ( = ?auto_132630 ?auto_132631 ) ) ( ON-TABLE ?auto_132631 ) ( CLEAR ?auto_132631 ) ( HOLDING ?auto_132630 ) ( CLEAR ?auto_132629 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_132625 ?auto_132626 ?auto_132627 ?auto_132628 ?auto_132629 ?auto_132630 )
      ( MAKE-7PILE ?auto_132625 ?auto_132626 ?auto_132627 ?auto_132628 ?auto_132629 ?auto_132630 ?auto_132631 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132632 - BLOCK
      ?auto_132633 - BLOCK
      ?auto_132634 - BLOCK
      ?auto_132635 - BLOCK
      ?auto_132636 - BLOCK
      ?auto_132637 - BLOCK
      ?auto_132638 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132632 ) ( ON ?auto_132633 ?auto_132632 ) ( ON ?auto_132634 ?auto_132633 ) ( ON ?auto_132635 ?auto_132634 ) ( ON ?auto_132636 ?auto_132635 ) ( not ( = ?auto_132632 ?auto_132633 ) ) ( not ( = ?auto_132632 ?auto_132634 ) ) ( not ( = ?auto_132632 ?auto_132635 ) ) ( not ( = ?auto_132632 ?auto_132636 ) ) ( not ( = ?auto_132632 ?auto_132637 ) ) ( not ( = ?auto_132632 ?auto_132638 ) ) ( not ( = ?auto_132633 ?auto_132634 ) ) ( not ( = ?auto_132633 ?auto_132635 ) ) ( not ( = ?auto_132633 ?auto_132636 ) ) ( not ( = ?auto_132633 ?auto_132637 ) ) ( not ( = ?auto_132633 ?auto_132638 ) ) ( not ( = ?auto_132634 ?auto_132635 ) ) ( not ( = ?auto_132634 ?auto_132636 ) ) ( not ( = ?auto_132634 ?auto_132637 ) ) ( not ( = ?auto_132634 ?auto_132638 ) ) ( not ( = ?auto_132635 ?auto_132636 ) ) ( not ( = ?auto_132635 ?auto_132637 ) ) ( not ( = ?auto_132635 ?auto_132638 ) ) ( not ( = ?auto_132636 ?auto_132637 ) ) ( not ( = ?auto_132636 ?auto_132638 ) ) ( not ( = ?auto_132637 ?auto_132638 ) ) ( ON-TABLE ?auto_132638 ) ( CLEAR ?auto_132636 ) ( ON ?auto_132637 ?auto_132638 ) ( CLEAR ?auto_132637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_132638 )
      ( MAKE-7PILE ?auto_132632 ?auto_132633 ?auto_132634 ?auto_132635 ?auto_132636 ?auto_132637 ?auto_132638 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132639 - BLOCK
      ?auto_132640 - BLOCK
      ?auto_132641 - BLOCK
      ?auto_132642 - BLOCK
      ?auto_132643 - BLOCK
      ?auto_132644 - BLOCK
      ?auto_132645 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132639 ) ( ON ?auto_132640 ?auto_132639 ) ( ON ?auto_132641 ?auto_132640 ) ( ON ?auto_132642 ?auto_132641 ) ( not ( = ?auto_132639 ?auto_132640 ) ) ( not ( = ?auto_132639 ?auto_132641 ) ) ( not ( = ?auto_132639 ?auto_132642 ) ) ( not ( = ?auto_132639 ?auto_132643 ) ) ( not ( = ?auto_132639 ?auto_132644 ) ) ( not ( = ?auto_132639 ?auto_132645 ) ) ( not ( = ?auto_132640 ?auto_132641 ) ) ( not ( = ?auto_132640 ?auto_132642 ) ) ( not ( = ?auto_132640 ?auto_132643 ) ) ( not ( = ?auto_132640 ?auto_132644 ) ) ( not ( = ?auto_132640 ?auto_132645 ) ) ( not ( = ?auto_132641 ?auto_132642 ) ) ( not ( = ?auto_132641 ?auto_132643 ) ) ( not ( = ?auto_132641 ?auto_132644 ) ) ( not ( = ?auto_132641 ?auto_132645 ) ) ( not ( = ?auto_132642 ?auto_132643 ) ) ( not ( = ?auto_132642 ?auto_132644 ) ) ( not ( = ?auto_132642 ?auto_132645 ) ) ( not ( = ?auto_132643 ?auto_132644 ) ) ( not ( = ?auto_132643 ?auto_132645 ) ) ( not ( = ?auto_132644 ?auto_132645 ) ) ( ON-TABLE ?auto_132645 ) ( ON ?auto_132644 ?auto_132645 ) ( CLEAR ?auto_132644 ) ( HOLDING ?auto_132643 ) ( CLEAR ?auto_132642 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_132639 ?auto_132640 ?auto_132641 ?auto_132642 ?auto_132643 )
      ( MAKE-7PILE ?auto_132639 ?auto_132640 ?auto_132641 ?auto_132642 ?auto_132643 ?auto_132644 ?auto_132645 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132646 - BLOCK
      ?auto_132647 - BLOCK
      ?auto_132648 - BLOCK
      ?auto_132649 - BLOCK
      ?auto_132650 - BLOCK
      ?auto_132651 - BLOCK
      ?auto_132652 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132646 ) ( ON ?auto_132647 ?auto_132646 ) ( ON ?auto_132648 ?auto_132647 ) ( ON ?auto_132649 ?auto_132648 ) ( not ( = ?auto_132646 ?auto_132647 ) ) ( not ( = ?auto_132646 ?auto_132648 ) ) ( not ( = ?auto_132646 ?auto_132649 ) ) ( not ( = ?auto_132646 ?auto_132650 ) ) ( not ( = ?auto_132646 ?auto_132651 ) ) ( not ( = ?auto_132646 ?auto_132652 ) ) ( not ( = ?auto_132647 ?auto_132648 ) ) ( not ( = ?auto_132647 ?auto_132649 ) ) ( not ( = ?auto_132647 ?auto_132650 ) ) ( not ( = ?auto_132647 ?auto_132651 ) ) ( not ( = ?auto_132647 ?auto_132652 ) ) ( not ( = ?auto_132648 ?auto_132649 ) ) ( not ( = ?auto_132648 ?auto_132650 ) ) ( not ( = ?auto_132648 ?auto_132651 ) ) ( not ( = ?auto_132648 ?auto_132652 ) ) ( not ( = ?auto_132649 ?auto_132650 ) ) ( not ( = ?auto_132649 ?auto_132651 ) ) ( not ( = ?auto_132649 ?auto_132652 ) ) ( not ( = ?auto_132650 ?auto_132651 ) ) ( not ( = ?auto_132650 ?auto_132652 ) ) ( not ( = ?auto_132651 ?auto_132652 ) ) ( ON-TABLE ?auto_132652 ) ( ON ?auto_132651 ?auto_132652 ) ( CLEAR ?auto_132649 ) ( ON ?auto_132650 ?auto_132651 ) ( CLEAR ?auto_132650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_132652 ?auto_132651 )
      ( MAKE-7PILE ?auto_132646 ?auto_132647 ?auto_132648 ?auto_132649 ?auto_132650 ?auto_132651 ?auto_132652 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132653 - BLOCK
      ?auto_132654 - BLOCK
      ?auto_132655 - BLOCK
      ?auto_132656 - BLOCK
      ?auto_132657 - BLOCK
      ?auto_132658 - BLOCK
      ?auto_132659 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132653 ) ( ON ?auto_132654 ?auto_132653 ) ( ON ?auto_132655 ?auto_132654 ) ( not ( = ?auto_132653 ?auto_132654 ) ) ( not ( = ?auto_132653 ?auto_132655 ) ) ( not ( = ?auto_132653 ?auto_132656 ) ) ( not ( = ?auto_132653 ?auto_132657 ) ) ( not ( = ?auto_132653 ?auto_132658 ) ) ( not ( = ?auto_132653 ?auto_132659 ) ) ( not ( = ?auto_132654 ?auto_132655 ) ) ( not ( = ?auto_132654 ?auto_132656 ) ) ( not ( = ?auto_132654 ?auto_132657 ) ) ( not ( = ?auto_132654 ?auto_132658 ) ) ( not ( = ?auto_132654 ?auto_132659 ) ) ( not ( = ?auto_132655 ?auto_132656 ) ) ( not ( = ?auto_132655 ?auto_132657 ) ) ( not ( = ?auto_132655 ?auto_132658 ) ) ( not ( = ?auto_132655 ?auto_132659 ) ) ( not ( = ?auto_132656 ?auto_132657 ) ) ( not ( = ?auto_132656 ?auto_132658 ) ) ( not ( = ?auto_132656 ?auto_132659 ) ) ( not ( = ?auto_132657 ?auto_132658 ) ) ( not ( = ?auto_132657 ?auto_132659 ) ) ( not ( = ?auto_132658 ?auto_132659 ) ) ( ON-TABLE ?auto_132659 ) ( ON ?auto_132658 ?auto_132659 ) ( ON ?auto_132657 ?auto_132658 ) ( CLEAR ?auto_132657 ) ( HOLDING ?auto_132656 ) ( CLEAR ?auto_132655 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_132653 ?auto_132654 ?auto_132655 ?auto_132656 )
      ( MAKE-7PILE ?auto_132653 ?auto_132654 ?auto_132655 ?auto_132656 ?auto_132657 ?auto_132658 ?auto_132659 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132660 - BLOCK
      ?auto_132661 - BLOCK
      ?auto_132662 - BLOCK
      ?auto_132663 - BLOCK
      ?auto_132664 - BLOCK
      ?auto_132665 - BLOCK
      ?auto_132666 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132660 ) ( ON ?auto_132661 ?auto_132660 ) ( ON ?auto_132662 ?auto_132661 ) ( not ( = ?auto_132660 ?auto_132661 ) ) ( not ( = ?auto_132660 ?auto_132662 ) ) ( not ( = ?auto_132660 ?auto_132663 ) ) ( not ( = ?auto_132660 ?auto_132664 ) ) ( not ( = ?auto_132660 ?auto_132665 ) ) ( not ( = ?auto_132660 ?auto_132666 ) ) ( not ( = ?auto_132661 ?auto_132662 ) ) ( not ( = ?auto_132661 ?auto_132663 ) ) ( not ( = ?auto_132661 ?auto_132664 ) ) ( not ( = ?auto_132661 ?auto_132665 ) ) ( not ( = ?auto_132661 ?auto_132666 ) ) ( not ( = ?auto_132662 ?auto_132663 ) ) ( not ( = ?auto_132662 ?auto_132664 ) ) ( not ( = ?auto_132662 ?auto_132665 ) ) ( not ( = ?auto_132662 ?auto_132666 ) ) ( not ( = ?auto_132663 ?auto_132664 ) ) ( not ( = ?auto_132663 ?auto_132665 ) ) ( not ( = ?auto_132663 ?auto_132666 ) ) ( not ( = ?auto_132664 ?auto_132665 ) ) ( not ( = ?auto_132664 ?auto_132666 ) ) ( not ( = ?auto_132665 ?auto_132666 ) ) ( ON-TABLE ?auto_132666 ) ( ON ?auto_132665 ?auto_132666 ) ( ON ?auto_132664 ?auto_132665 ) ( CLEAR ?auto_132662 ) ( ON ?auto_132663 ?auto_132664 ) ( CLEAR ?auto_132663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_132666 ?auto_132665 ?auto_132664 )
      ( MAKE-7PILE ?auto_132660 ?auto_132661 ?auto_132662 ?auto_132663 ?auto_132664 ?auto_132665 ?auto_132666 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132667 - BLOCK
      ?auto_132668 - BLOCK
      ?auto_132669 - BLOCK
      ?auto_132670 - BLOCK
      ?auto_132671 - BLOCK
      ?auto_132672 - BLOCK
      ?auto_132673 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132667 ) ( ON ?auto_132668 ?auto_132667 ) ( not ( = ?auto_132667 ?auto_132668 ) ) ( not ( = ?auto_132667 ?auto_132669 ) ) ( not ( = ?auto_132667 ?auto_132670 ) ) ( not ( = ?auto_132667 ?auto_132671 ) ) ( not ( = ?auto_132667 ?auto_132672 ) ) ( not ( = ?auto_132667 ?auto_132673 ) ) ( not ( = ?auto_132668 ?auto_132669 ) ) ( not ( = ?auto_132668 ?auto_132670 ) ) ( not ( = ?auto_132668 ?auto_132671 ) ) ( not ( = ?auto_132668 ?auto_132672 ) ) ( not ( = ?auto_132668 ?auto_132673 ) ) ( not ( = ?auto_132669 ?auto_132670 ) ) ( not ( = ?auto_132669 ?auto_132671 ) ) ( not ( = ?auto_132669 ?auto_132672 ) ) ( not ( = ?auto_132669 ?auto_132673 ) ) ( not ( = ?auto_132670 ?auto_132671 ) ) ( not ( = ?auto_132670 ?auto_132672 ) ) ( not ( = ?auto_132670 ?auto_132673 ) ) ( not ( = ?auto_132671 ?auto_132672 ) ) ( not ( = ?auto_132671 ?auto_132673 ) ) ( not ( = ?auto_132672 ?auto_132673 ) ) ( ON-TABLE ?auto_132673 ) ( ON ?auto_132672 ?auto_132673 ) ( ON ?auto_132671 ?auto_132672 ) ( ON ?auto_132670 ?auto_132671 ) ( CLEAR ?auto_132670 ) ( HOLDING ?auto_132669 ) ( CLEAR ?auto_132668 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_132667 ?auto_132668 ?auto_132669 )
      ( MAKE-7PILE ?auto_132667 ?auto_132668 ?auto_132669 ?auto_132670 ?auto_132671 ?auto_132672 ?auto_132673 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132674 - BLOCK
      ?auto_132675 - BLOCK
      ?auto_132676 - BLOCK
      ?auto_132677 - BLOCK
      ?auto_132678 - BLOCK
      ?auto_132679 - BLOCK
      ?auto_132680 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132674 ) ( ON ?auto_132675 ?auto_132674 ) ( not ( = ?auto_132674 ?auto_132675 ) ) ( not ( = ?auto_132674 ?auto_132676 ) ) ( not ( = ?auto_132674 ?auto_132677 ) ) ( not ( = ?auto_132674 ?auto_132678 ) ) ( not ( = ?auto_132674 ?auto_132679 ) ) ( not ( = ?auto_132674 ?auto_132680 ) ) ( not ( = ?auto_132675 ?auto_132676 ) ) ( not ( = ?auto_132675 ?auto_132677 ) ) ( not ( = ?auto_132675 ?auto_132678 ) ) ( not ( = ?auto_132675 ?auto_132679 ) ) ( not ( = ?auto_132675 ?auto_132680 ) ) ( not ( = ?auto_132676 ?auto_132677 ) ) ( not ( = ?auto_132676 ?auto_132678 ) ) ( not ( = ?auto_132676 ?auto_132679 ) ) ( not ( = ?auto_132676 ?auto_132680 ) ) ( not ( = ?auto_132677 ?auto_132678 ) ) ( not ( = ?auto_132677 ?auto_132679 ) ) ( not ( = ?auto_132677 ?auto_132680 ) ) ( not ( = ?auto_132678 ?auto_132679 ) ) ( not ( = ?auto_132678 ?auto_132680 ) ) ( not ( = ?auto_132679 ?auto_132680 ) ) ( ON-TABLE ?auto_132680 ) ( ON ?auto_132679 ?auto_132680 ) ( ON ?auto_132678 ?auto_132679 ) ( ON ?auto_132677 ?auto_132678 ) ( CLEAR ?auto_132675 ) ( ON ?auto_132676 ?auto_132677 ) ( CLEAR ?auto_132676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_132680 ?auto_132679 ?auto_132678 ?auto_132677 )
      ( MAKE-7PILE ?auto_132674 ?auto_132675 ?auto_132676 ?auto_132677 ?auto_132678 ?auto_132679 ?auto_132680 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132681 - BLOCK
      ?auto_132682 - BLOCK
      ?auto_132683 - BLOCK
      ?auto_132684 - BLOCK
      ?auto_132685 - BLOCK
      ?auto_132686 - BLOCK
      ?auto_132687 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132681 ) ( not ( = ?auto_132681 ?auto_132682 ) ) ( not ( = ?auto_132681 ?auto_132683 ) ) ( not ( = ?auto_132681 ?auto_132684 ) ) ( not ( = ?auto_132681 ?auto_132685 ) ) ( not ( = ?auto_132681 ?auto_132686 ) ) ( not ( = ?auto_132681 ?auto_132687 ) ) ( not ( = ?auto_132682 ?auto_132683 ) ) ( not ( = ?auto_132682 ?auto_132684 ) ) ( not ( = ?auto_132682 ?auto_132685 ) ) ( not ( = ?auto_132682 ?auto_132686 ) ) ( not ( = ?auto_132682 ?auto_132687 ) ) ( not ( = ?auto_132683 ?auto_132684 ) ) ( not ( = ?auto_132683 ?auto_132685 ) ) ( not ( = ?auto_132683 ?auto_132686 ) ) ( not ( = ?auto_132683 ?auto_132687 ) ) ( not ( = ?auto_132684 ?auto_132685 ) ) ( not ( = ?auto_132684 ?auto_132686 ) ) ( not ( = ?auto_132684 ?auto_132687 ) ) ( not ( = ?auto_132685 ?auto_132686 ) ) ( not ( = ?auto_132685 ?auto_132687 ) ) ( not ( = ?auto_132686 ?auto_132687 ) ) ( ON-TABLE ?auto_132687 ) ( ON ?auto_132686 ?auto_132687 ) ( ON ?auto_132685 ?auto_132686 ) ( ON ?auto_132684 ?auto_132685 ) ( ON ?auto_132683 ?auto_132684 ) ( CLEAR ?auto_132683 ) ( HOLDING ?auto_132682 ) ( CLEAR ?auto_132681 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_132681 ?auto_132682 )
      ( MAKE-7PILE ?auto_132681 ?auto_132682 ?auto_132683 ?auto_132684 ?auto_132685 ?auto_132686 ?auto_132687 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132688 - BLOCK
      ?auto_132689 - BLOCK
      ?auto_132690 - BLOCK
      ?auto_132691 - BLOCK
      ?auto_132692 - BLOCK
      ?auto_132693 - BLOCK
      ?auto_132694 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132688 ) ( not ( = ?auto_132688 ?auto_132689 ) ) ( not ( = ?auto_132688 ?auto_132690 ) ) ( not ( = ?auto_132688 ?auto_132691 ) ) ( not ( = ?auto_132688 ?auto_132692 ) ) ( not ( = ?auto_132688 ?auto_132693 ) ) ( not ( = ?auto_132688 ?auto_132694 ) ) ( not ( = ?auto_132689 ?auto_132690 ) ) ( not ( = ?auto_132689 ?auto_132691 ) ) ( not ( = ?auto_132689 ?auto_132692 ) ) ( not ( = ?auto_132689 ?auto_132693 ) ) ( not ( = ?auto_132689 ?auto_132694 ) ) ( not ( = ?auto_132690 ?auto_132691 ) ) ( not ( = ?auto_132690 ?auto_132692 ) ) ( not ( = ?auto_132690 ?auto_132693 ) ) ( not ( = ?auto_132690 ?auto_132694 ) ) ( not ( = ?auto_132691 ?auto_132692 ) ) ( not ( = ?auto_132691 ?auto_132693 ) ) ( not ( = ?auto_132691 ?auto_132694 ) ) ( not ( = ?auto_132692 ?auto_132693 ) ) ( not ( = ?auto_132692 ?auto_132694 ) ) ( not ( = ?auto_132693 ?auto_132694 ) ) ( ON-TABLE ?auto_132694 ) ( ON ?auto_132693 ?auto_132694 ) ( ON ?auto_132692 ?auto_132693 ) ( ON ?auto_132691 ?auto_132692 ) ( ON ?auto_132690 ?auto_132691 ) ( CLEAR ?auto_132688 ) ( ON ?auto_132689 ?auto_132690 ) ( CLEAR ?auto_132689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_132694 ?auto_132693 ?auto_132692 ?auto_132691 ?auto_132690 )
      ( MAKE-7PILE ?auto_132688 ?auto_132689 ?auto_132690 ?auto_132691 ?auto_132692 ?auto_132693 ?auto_132694 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132695 - BLOCK
      ?auto_132696 - BLOCK
      ?auto_132697 - BLOCK
      ?auto_132698 - BLOCK
      ?auto_132699 - BLOCK
      ?auto_132700 - BLOCK
      ?auto_132701 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132695 ?auto_132696 ) ) ( not ( = ?auto_132695 ?auto_132697 ) ) ( not ( = ?auto_132695 ?auto_132698 ) ) ( not ( = ?auto_132695 ?auto_132699 ) ) ( not ( = ?auto_132695 ?auto_132700 ) ) ( not ( = ?auto_132695 ?auto_132701 ) ) ( not ( = ?auto_132696 ?auto_132697 ) ) ( not ( = ?auto_132696 ?auto_132698 ) ) ( not ( = ?auto_132696 ?auto_132699 ) ) ( not ( = ?auto_132696 ?auto_132700 ) ) ( not ( = ?auto_132696 ?auto_132701 ) ) ( not ( = ?auto_132697 ?auto_132698 ) ) ( not ( = ?auto_132697 ?auto_132699 ) ) ( not ( = ?auto_132697 ?auto_132700 ) ) ( not ( = ?auto_132697 ?auto_132701 ) ) ( not ( = ?auto_132698 ?auto_132699 ) ) ( not ( = ?auto_132698 ?auto_132700 ) ) ( not ( = ?auto_132698 ?auto_132701 ) ) ( not ( = ?auto_132699 ?auto_132700 ) ) ( not ( = ?auto_132699 ?auto_132701 ) ) ( not ( = ?auto_132700 ?auto_132701 ) ) ( ON-TABLE ?auto_132701 ) ( ON ?auto_132700 ?auto_132701 ) ( ON ?auto_132699 ?auto_132700 ) ( ON ?auto_132698 ?auto_132699 ) ( ON ?auto_132697 ?auto_132698 ) ( ON ?auto_132696 ?auto_132697 ) ( CLEAR ?auto_132696 ) ( HOLDING ?auto_132695 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_132695 )
      ( MAKE-7PILE ?auto_132695 ?auto_132696 ?auto_132697 ?auto_132698 ?auto_132699 ?auto_132700 ?auto_132701 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132702 - BLOCK
      ?auto_132703 - BLOCK
      ?auto_132704 - BLOCK
      ?auto_132705 - BLOCK
      ?auto_132706 - BLOCK
      ?auto_132707 - BLOCK
      ?auto_132708 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132702 ?auto_132703 ) ) ( not ( = ?auto_132702 ?auto_132704 ) ) ( not ( = ?auto_132702 ?auto_132705 ) ) ( not ( = ?auto_132702 ?auto_132706 ) ) ( not ( = ?auto_132702 ?auto_132707 ) ) ( not ( = ?auto_132702 ?auto_132708 ) ) ( not ( = ?auto_132703 ?auto_132704 ) ) ( not ( = ?auto_132703 ?auto_132705 ) ) ( not ( = ?auto_132703 ?auto_132706 ) ) ( not ( = ?auto_132703 ?auto_132707 ) ) ( not ( = ?auto_132703 ?auto_132708 ) ) ( not ( = ?auto_132704 ?auto_132705 ) ) ( not ( = ?auto_132704 ?auto_132706 ) ) ( not ( = ?auto_132704 ?auto_132707 ) ) ( not ( = ?auto_132704 ?auto_132708 ) ) ( not ( = ?auto_132705 ?auto_132706 ) ) ( not ( = ?auto_132705 ?auto_132707 ) ) ( not ( = ?auto_132705 ?auto_132708 ) ) ( not ( = ?auto_132706 ?auto_132707 ) ) ( not ( = ?auto_132706 ?auto_132708 ) ) ( not ( = ?auto_132707 ?auto_132708 ) ) ( ON-TABLE ?auto_132708 ) ( ON ?auto_132707 ?auto_132708 ) ( ON ?auto_132706 ?auto_132707 ) ( ON ?auto_132705 ?auto_132706 ) ( ON ?auto_132704 ?auto_132705 ) ( ON ?auto_132703 ?auto_132704 ) ( ON ?auto_132702 ?auto_132703 ) ( CLEAR ?auto_132702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_132708 ?auto_132707 ?auto_132706 ?auto_132705 ?auto_132704 ?auto_132703 )
      ( MAKE-7PILE ?auto_132702 ?auto_132703 ?auto_132704 ?auto_132705 ?auto_132706 ?auto_132707 ?auto_132708 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132709 - BLOCK
      ?auto_132710 - BLOCK
      ?auto_132711 - BLOCK
      ?auto_132712 - BLOCK
      ?auto_132713 - BLOCK
      ?auto_132714 - BLOCK
      ?auto_132715 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132709 ?auto_132710 ) ) ( not ( = ?auto_132709 ?auto_132711 ) ) ( not ( = ?auto_132709 ?auto_132712 ) ) ( not ( = ?auto_132709 ?auto_132713 ) ) ( not ( = ?auto_132709 ?auto_132714 ) ) ( not ( = ?auto_132709 ?auto_132715 ) ) ( not ( = ?auto_132710 ?auto_132711 ) ) ( not ( = ?auto_132710 ?auto_132712 ) ) ( not ( = ?auto_132710 ?auto_132713 ) ) ( not ( = ?auto_132710 ?auto_132714 ) ) ( not ( = ?auto_132710 ?auto_132715 ) ) ( not ( = ?auto_132711 ?auto_132712 ) ) ( not ( = ?auto_132711 ?auto_132713 ) ) ( not ( = ?auto_132711 ?auto_132714 ) ) ( not ( = ?auto_132711 ?auto_132715 ) ) ( not ( = ?auto_132712 ?auto_132713 ) ) ( not ( = ?auto_132712 ?auto_132714 ) ) ( not ( = ?auto_132712 ?auto_132715 ) ) ( not ( = ?auto_132713 ?auto_132714 ) ) ( not ( = ?auto_132713 ?auto_132715 ) ) ( not ( = ?auto_132714 ?auto_132715 ) ) ( ON-TABLE ?auto_132715 ) ( ON ?auto_132714 ?auto_132715 ) ( ON ?auto_132713 ?auto_132714 ) ( ON ?auto_132712 ?auto_132713 ) ( ON ?auto_132711 ?auto_132712 ) ( ON ?auto_132710 ?auto_132711 ) ( HOLDING ?auto_132709 ) ( CLEAR ?auto_132710 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_132715 ?auto_132714 ?auto_132713 ?auto_132712 ?auto_132711 ?auto_132710 ?auto_132709 )
      ( MAKE-7PILE ?auto_132709 ?auto_132710 ?auto_132711 ?auto_132712 ?auto_132713 ?auto_132714 ?auto_132715 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132716 - BLOCK
      ?auto_132717 - BLOCK
      ?auto_132718 - BLOCK
      ?auto_132719 - BLOCK
      ?auto_132720 - BLOCK
      ?auto_132721 - BLOCK
      ?auto_132722 - BLOCK
    )
    :vars
    (
      ?auto_132723 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132716 ?auto_132717 ) ) ( not ( = ?auto_132716 ?auto_132718 ) ) ( not ( = ?auto_132716 ?auto_132719 ) ) ( not ( = ?auto_132716 ?auto_132720 ) ) ( not ( = ?auto_132716 ?auto_132721 ) ) ( not ( = ?auto_132716 ?auto_132722 ) ) ( not ( = ?auto_132717 ?auto_132718 ) ) ( not ( = ?auto_132717 ?auto_132719 ) ) ( not ( = ?auto_132717 ?auto_132720 ) ) ( not ( = ?auto_132717 ?auto_132721 ) ) ( not ( = ?auto_132717 ?auto_132722 ) ) ( not ( = ?auto_132718 ?auto_132719 ) ) ( not ( = ?auto_132718 ?auto_132720 ) ) ( not ( = ?auto_132718 ?auto_132721 ) ) ( not ( = ?auto_132718 ?auto_132722 ) ) ( not ( = ?auto_132719 ?auto_132720 ) ) ( not ( = ?auto_132719 ?auto_132721 ) ) ( not ( = ?auto_132719 ?auto_132722 ) ) ( not ( = ?auto_132720 ?auto_132721 ) ) ( not ( = ?auto_132720 ?auto_132722 ) ) ( not ( = ?auto_132721 ?auto_132722 ) ) ( ON-TABLE ?auto_132722 ) ( ON ?auto_132721 ?auto_132722 ) ( ON ?auto_132720 ?auto_132721 ) ( ON ?auto_132719 ?auto_132720 ) ( ON ?auto_132718 ?auto_132719 ) ( ON ?auto_132717 ?auto_132718 ) ( CLEAR ?auto_132717 ) ( ON ?auto_132716 ?auto_132723 ) ( CLEAR ?auto_132716 ) ( HAND-EMPTY ) ( not ( = ?auto_132716 ?auto_132723 ) ) ( not ( = ?auto_132717 ?auto_132723 ) ) ( not ( = ?auto_132718 ?auto_132723 ) ) ( not ( = ?auto_132719 ?auto_132723 ) ) ( not ( = ?auto_132720 ?auto_132723 ) ) ( not ( = ?auto_132721 ?auto_132723 ) ) ( not ( = ?auto_132722 ?auto_132723 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_132716 ?auto_132723 )
      ( MAKE-7PILE ?auto_132716 ?auto_132717 ?auto_132718 ?auto_132719 ?auto_132720 ?auto_132721 ?auto_132722 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132724 - BLOCK
      ?auto_132725 - BLOCK
      ?auto_132726 - BLOCK
      ?auto_132727 - BLOCK
      ?auto_132728 - BLOCK
      ?auto_132729 - BLOCK
      ?auto_132730 - BLOCK
    )
    :vars
    (
      ?auto_132731 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132724 ?auto_132725 ) ) ( not ( = ?auto_132724 ?auto_132726 ) ) ( not ( = ?auto_132724 ?auto_132727 ) ) ( not ( = ?auto_132724 ?auto_132728 ) ) ( not ( = ?auto_132724 ?auto_132729 ) ) ( not ( = ?auto_132724 ?auto_132730 ) ) ( not ( = ?auto_132725 ?auto_132726 ) ) ( not ( = ?auto_132725 ?auto_132727 ) ) ( not ( = ?auto_132725 ?auto_132728 ) ) ( not ( = ?auto_132725 ?auto_132729 ) ) ( not ( = ?auto_132725 ?auto_132730 ) ) ( not ( = ?auto_132726 ?auto_132727 ) ) ( not ( = ?auto_132726 ?auto_132728 ) ) ( not ( = ?auto_132726 ?auto_132729 ) ) ( not ( = ?auto_132726 ?auto_132730 ) ) ( not ( = ?auto_132727 ?auto_132728 ) ) ( not ( = ?auto_132727 ?auto_132729 ) ) ( not ( = ?auto_132727 ?auto_132730 ) ) ( not ( = ?auto_132728 ?auto_132729 ) ) ( not ( = ?auto_132728 ?auto_132730 ) ) ( not ( = ?auto_132729 ?auto_132730 ) ) ( ON-TABLE ?auto_132730 ) ( ON ?auto_132729 ?auto_132730 ) ( ON ?auto_132728 ?auto_132729 ) ( ON ?auto_132727 ?auto_132728 ) ( ON ?auto_132726 ?auto_132727 ) ( ON ?auto_132724 ?auto_132731 ) ( CLEAR ?auto_132724 ) ( not ( = ?auto_132724 ?auto_132731 ) ) ( not ( = ?auto_132725 ?auto_132731 ) ) ( not ( = ?auto_132726 ?auto_132731 ) ) ( not ( = ?auto_132727 ?auto_132731 ) ) ( not ( = ?auto_132728 ?auto_132731 ) ) ( not ( = ?auto_132729 ?auto_132731 ) ) ( not ( = ?auto_132730 ?auto_132731 ) ) ( HOLDING ?auto_132725 ) ( CLEAR ?auto_132726 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_132730 ?auto_132729 ?auto_132728 ?auto_132727 ?auto_132726 ?auto_132725 )
      ( MAKE-7PILE ?auto_132724 ?auto_132725 ?auto_132726 ?auto_132727 ?auto_132728 ?auto_132729 ?auto_132730 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132732 - BLOCK
      ?auto_132733 - BLOCK
      ?auto_132734 - BLOCK
      ?auto_132735 - BLOCK
      ?auto_132736 - BLOCK
      ?auto_132737 - BLOCK
      ?auto_132738 - BLOCK
    )
    :vars
    (
      ?auto_132739 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132732 ?auto_132733 ) ) ( not ( = ?auto_132732 ?auto_132734 ) ) ( not ( = ?auto_132732 ?auto_132735 ) ) ( not ( = ?auto_132732 ?auto_132736 ) ) ( not ( = ?auto_132732 ?auto_132737 ) ) ( not ( = ?auto_132732 ?auto_132738 ) ) ( not ( = ?auto_132733 ?auto_132734 ) ) ( not ( = ?auto_132733 ?auto_132735 ) ) ( not ( = ?auto_132733 ?auto_132736 ) ) ( not ( = ?auto_132733 ?auto_132737 ) ) ( not ( = ?auto_132733 ?auto_132738 ) ) ( not ( = ?auto_132734 ?auto_132735 ) ) ( not ( = ?auto_132734 ?auto_132736 ) ) ( not ( = ?auto_132734 ?auto_132737 ) ) ( not ( = ?auto_132734 ?auto_132738 ) ) ( not ( = ?auto_132735 ?auto_132736 ) ) ( not ( = ?auto_132735 ?auto_132737 ) ) ( not ( = ?auto_132735 ?auto_132738 ) ) ( not ( = ?auto_132736 ?auto_132737 ) ) ( not ( = ?auto_132736 ?auto_132738 ) ) ( not ( = ?auto_132737 ?auto_132738 ) ) ( ON-TABLE ?auto_132738 ) ( ON ?auto_132737 ?auto_132738 ) ( ON ?auto_132736 ?auto_132737 ) ( ON ?auto_132735 ?auto_132736 ) ( ON ?auto_132734 ?auto_132735 ) ( ON ?auto_132732 ?auto_132739 ) ( not ( = ?auto_132732 ?auto_132739 ) ) ( not ( = ?auto_132733 ?auto_132739 ) ) ( not ( = ?auto_132734 ?auto_132739 ) ) ( not ( = ?auto_132735 ?auto_132739 ) ) ( not ( = ?auto_132736 ?auto_132739 ) ) ( not ( = ?auto_132737 ?auto_132739 ) ) ( not ( = ?auto_132738 ?auto_132739 ) ) ( CLEAR ?auto_132734 ) ( ON ?auto_132733 ?auto_132732 ) ( CLEAR ?auto_132733 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_132739 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_132739 ?auto_132732 )
      ( MAKE-7PILE ?auto_132732 ?auto_132733 ?auto_132734 ?auto_132735 ?auto_132736 ?auto_132737 ?auto_132738 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132740 - BLOCK
      ?auto_132741 - BLOCK
      ?auto_132742 - BLOCK
      ?auto_132743 - BLOCK
      ?auto_132744 - BLOCK
      ?auto_132745 - BLOCK
      ?auto_132746 - BLOCK
    )
    :vars
    (
      ?auto_132747 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132740 ?auto_132741 ) ) ( not ( = ?auto_132740 ?auto_132742 ) ) ( not ( = ?auto_132740 ?auto_132743 ) ) ( not ( = ?auto_132740 ?auto_132744 ) ) ( not ( = ?auto_132740 ?auto_132745 ) ) ( not ( = ?auto_132740 ?auto_132746 ) ) ( not ( = ?auto_132741 ?auto_132742 ) ) ( not ( = ?auto_132741 ?auto_132743 ) ) ( not ( = ?auto_132741 ?auto_132744 ) ) ( not ( = ?auto_132741 ?auto_132745 ) ) ( not ( = ?auto_132741 ?auto_132746 ) ) ( not ( = ?auto_132742 ?auto_132743 ) ) ( not ( = ?auto_132742 ?auto_132744 ) ) ( not ( = ?auto_132742 ?auto_132745 ) ) ( not ( = ?auto_132742 ?auto_132746 ) ) ( not ( = ?auto_132743 ?auto_132744 ) ) ( not ( = ?auto_132743 ?auto_132745 ) ) ( not ( = ?auto_132743 ?auto_132746 ) ) ( not ( = ?auto_132744 ?auto_132745 ) ) ( not ( = ?auto_132744 ?auto_132746 ) ) ( not ( = ?auto_132745 ?auto_132746 ) ) ( ON-TABLE ?auto_132746 ) ( ON ?auto_132745 ?auto_132746 ) ( ON ?auto_132744 ?auto_132745 ) ( ON ?auto_132743 ?auto_132744 ) ( ON ?auto_132740 ?auto_132747 ) ( not ( = ?auto_132740 ?auto_132747 ) ) ( not ( = ?auto_132741 ?auto_132747 ) ) ( not ( = ?auto_132742 ?auto_132747 ) ) ( not ( = ?auto_132743 ?auto_132747 ) ) ( not ( = ?auto_132744 ?auto_132747 ) ) ( not ( = ?auto_132745 ?auto_132747 ) ) ( not ( = ?auto_132746 ?auto_132747 ) ) ( ON ?auto_132741 ?auto_132740 ) ( CLEAR ?auto_132741 ) ( ON-TABLE ?auto_132747 ) ( HOLDING ?auto_132742 ) ( CLEAR ?auto_132743 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_132746 ?auto_132745 ?auto_132744 ?auto_132743 ?auto_132742 )
      ( MAKE-7PILE ?auto_132740 ?auto_132741 ?auto_132742 ?auto_132743 ?auto_132744 ?auto_132745 ?auto_132746 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132748 - BLOCK
      ?auto_132749 - BLOCK
      ?auto_132750 - BLOCK
      ?auto_132751 - BLOCK
      ?auto_132752 - BLOCK
      ?auto_132753 - BLOCK
      ?auto_132754 - BLOCK
    )
    :vars
    (
      ?auto_132755 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132748 ?auto_132749 ) ) ( not ( = ?auto_132748 ?auto_132750 ) ) ( not ( = ?auto_132748 ?auto_132751 ) ) ( not ( = ?auto_132748 ?auto_132752 ) ) ( not ( = ?auto_132748 ?auto_132753 ) ) ( not ( = ?auto_132748 ?auto_132754 ) ) ( not ( = ?auto_132749 ?auto_132750 ) ) ( not ( = ?auto_132749 ?auto_132751 ) ) ( not ( = ?auto_132749 ?auto_132752 ) ) ( not ( = ?auto_132749 ?auto_132753 ) ) ( not ( = ?auto_132749 ?auto_132754 ) ) ( not ( = ?auto_132750 ?auto_132751 ) ) ( not ( = ?auto_132750 ?auto_132752 ) ) ( not ( = ?auto_132750 ?auto_132753 ) ) ( not ( = ?auto_132750 ?auto_132754 ) ) ( not ( = ?auto_132751 ?auto_132752 ) ) ( not ( = ?auto_132751 ?auto_132753 ) ) ( not ( = ?auto_132751 ?auto_132754 ) ) ( not ( = ?auto_132752 ?auto_132753 ) ) ( not ( = ?auto_132752 ?auto_132754 ) ) ( not ( = ?auto_132753 ?auto_132754 ) ) ( ON-TABLE ?auto_132754 ) ( ON ?auto_132753 ?auto_132754 ) ( ON ?auto_132752 ?auto_132753 ) ( ON ?auto_132751 ?auto_132752 ) ( ON ?auto_132748 ?auto_132755 ) ( not ( = ?auto_132748 ?auto_132755 ) ) ( not ( = ?auto_132749 ?auto_132755 ) ) ( not ( = ?auto_132750 ?auto_132755 ) ) ( not ( = ?auto_132751 ?auto_132755 ) ) ( not ( = ?auto_132752 ?auto_132755 ) ) ( not ( = ?auto_132753 ?auto_132755 ) ) ( not ( = ?auto_132754 ?auto_132755 ) ) ( ON ?auto_132749 ?auto_132748 ) ( ON-TABLE ?auto_132755 ) ( CLEAR ?auto_132751 ) ( ON ?auto_132750 ?auto_132749 ) ( CLEAR ?auto_132750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_132755 ?auto_132748 ?auto_132749 )
      ( MAKE-7PILE ?auto_132748 ?auto_132749 ?auto_132750 ?auto_132751 ?auto_132752 ?auto_132753 ?auto_132754 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132756 - BLOCK
      ?auto_132757 - BLOCK
      ?auto_132758 - BLOCK
      ?auto_132759 - BLOCK
      ?auto_132760 - BLOCK
      ?auto_132761 - BLOCK
      ?auto_132762 - BLOCK
    )
    :vars
    (
      ?auto_132763 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132756 ?auto_132757 ) ) ( not ( = ?auto_132756 ?auto_132758 ) ) ( not ( = ?auto_132756 ?auto_132759 ) ) ( not ( = ?auto_132756 ?auto_132760 ) ) ( not ( = ?auto_132756 ?auto_132761 ) ) ( not ( = ?auto_132756 ?auto_132762 ) ) ( not ( = ?auto_132757 ?auto_132758 ) ) ( not ( = ?auto_132757 ?auto_132759 ) ) ( not ( = ?auto_132757 ?auto_132760 ) ) ( not ( = ?auto_132757 ?auto_132761 ) ) ( not ( = ?auto_132757 ?auto_132762 ) ) ( not ( = ?auto_132758 ?auto_132759 ) ) ( not ( = ?auto_132758 ?auto_132760 ) ) ( not ( = ?auto_132758 ?auto_132761 ) ) ( not ( = ?auto_132758 ?auto_132762 ) ) ( not ( = ?auto_132759 ?auto_132760 ) ) ( not ( = ?auto_132759 ?auto_132761 ) ) ( not ( = ?auto_132759 ?auto_132762 ) ) ( not ( = ?auto_132760 ?auto_132761 ) ) ( not ( = ?auto_132760 ?auto_132762 ) ) ( not ( = ?auto_132761 ?auto_132762 ) ) ( ON-TABLE ?auto_132762 ) ( ON ?auto_132761 ?auto_132762 ) ( ON ?auto_132760 ?auto_132761 ) ( ON ?auto_132756 ?auto_132763 ) ( not ( = ?auto_132756 ?auto_132763 ) ) ( not ( = ?auto_132757 ?auto_132763 ) ) ( not ( = ?auto_132758 ?auto_132763 ) ) ( not ( = ?auto_132759 ?auto_132763 ) ) ( not ( = ?auto_132760 ?auto_132763 ) ) ( not ( = ?auto_132761 ?auto_132763 ) ) ( not ( = ?auto_132762 ?auto_132763 ) ) ( ON ?auto_132757 ?auto_132756 ) ( ON-TABLE ?auto_132763 ) ( ON ?auto_132758 ?auto_132757 ) ( CLEAR ?auto_132758 ) ( HOLDING ?auto_132759 ) ( CLEAR ?auto_132760 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_132762 ?auto_132761 ?auto_132760 ?auto_132759 )
      ( MAKE-7PILE ?auto_132756 ?auto_132757 ?auto_132758 ?auto_132759 ?auto_132760 ?auto_132761 ?auto_132762 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132764 - BLOCK
      ?auto_132765 - BLOCK
      ?auto_132766 - BLOCK
      ?auto_132767 - BLOCK
      ?auto_132768 - BLOCK
      ?auto_132769 - BLOCK
      ?auto_132770 - BLOCK
    )
    :vars
    (
      ?auto_132771 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132764 ?auto_132765 ) ) ( not ( = ?auto_132764 ?auto_132766 ) ) ( not ( = ?auto_132764 ?auto_132767 ) ) ( not ( = ?auto_132764 ?auto_132768 ) ) ( not ( = ?auto_132764 ?auto_132769 ) ) ( not ( = ?auto_132764 ?auto_132770 ) ) ( not ( = ?auto_132765 ?auto_132766 ) ) ( not ( = ?auto_132765 ?auto_132767 ) ) ( not ( = ?auto_132765 ?auto_132768 ) ) ( not ( = ?auto_132765 ?auto_132769 ) ) ( not ( = ?auto_132765 ?auto_132770 ) ) ( not ( = ?auto_132766 ?auto_132767 ) ) ( not ( = ?auto_132766 ?auto_132768 ) ) ( not ( = ?auto_132766 ?auto_132769 ) ) ( not ( = ?auto_132766 ?auto_132770 ) ) ( not ( = ?auto_132767 ?auto_132768 ) ) ( not ( = ?auto_132767 ?auto_132769 ) ) ( not ( = ?auto_132767 ?auto_132770 ) ) ( not ( = ?auto_132768 ?auto_132769 ) ) ( not ( = ?auto_132768 ?auto_132770 ) ) ( not ( = ?auto_132769 ?auto_132770 ) ) ( ON-TABLE ?auto_132770 ) ( ON ?auto_132769 ?auto_132770 ) ( ON ?auto_132768 ?auto_132769 ) ( ON ?auto_132764 ?auto_132771 ) ( not ( = ?auto_132764 ?auto_132771 ) ) ( not ( = ?auto_132765 ?auto_132771 ) ) ( not ( = ?auto_132766 ?auto_132771 ) ) ( not ( = ?auto_132767 ?auto_132771 ) ) ( not ( = ?auto_132768 ?auto_132771 ) ) ( not ( = ?auto_132769 ?auto_132771 ) ) ( not ( = ?auto_132770 ?auto_132771 ) ) ( ON ?auto_132765 ?auto_132764 ) ( ON-TABLE ?auto_132771 ) ( ON ?auto_132766 ?auto_132765 ) ( CLEAR ?auto_132768 ) ( ON ?auto_132767 ?auto_132766 ) ( CLEAR ?auto_132767 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_132771 ?auto_132764 ?auto_132765 ?auto_132766 )
      ( MAKE-7PILE ?auto_132764 ?auto_132765 ?auto_132766 ?auto_132767 ?auto_132768 ?auto_132769 ?auto_132770 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132772 - BLOCK
      ?auto_132773 - BLOCK
      ?auto_132774 - BLOCK
      ?auto_132775 - BLOCK
      ?auto_132776 - BLOCK
      ?auto_132777 - BLOCK
      ?auto_132778 - BLOCK
    )
    :vars
    (
      ?auto_132779 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132772 ?auto_132773 ) ) ( not ( = ?auto_132772 ?auto_132774 ) ) ( not ( = ?auto_132772 ?auto_132775 ) ) ( not ( = ?auto_132772 ?auto_132776 ) ) ( not ( = ?auto_132772 ?auto_132777 ) ) ( not ( = ?auto_132772 ?auto_132778 ) ) ( not ( = ?auto_132773 ?auto_132774 ) ) ( not ( = ?auto_132773 ?auto_132775 ) ) ( not ( = ?auto_132773 ?auto_132776 ) ) ( not ( = ?auto_132773 ?auto_132777 ) ) ( not ( = ?auto_132773 ?auto_132778 ) ) ( not ( = ?auto_132774 ?auto_132775 ) ) ( not ( = ?auto_132774 ?auto_132776 ) ) ( not ( = ?auto_132774 ?auto_132777 ) ) ( not ( = ?auto_132774 ?auto_132778 ) ) ( not ( = ?auto_132775 ?auto_132776 ) ) ( not ( = ?auto_132775 ?auto_132777 ) ) ( not ( = ?auto_132775 ?auto_132778 ) ) ( not ( = ?auto_132776 ?auto_132777 ) ) ( not ( = ?auto_132776 ?auto_132778 ) ) ( not ( = ?auto_132777 ?auto_132778 ) ) ( ON-TABLE ?auto_132778 ) ( ON ?auto_132777 ?auto_132778 ) ( ON ?auto_132772 ?auto_132779 ) ( not ( = ?auto_132772 ?auto_132779 ) ) ( not ( = ?auto_132773 ?auto_132779 ) ) ( not ( = ?auto_132774 ?auto_132779 ) ) ( not ( = ?auto_132775 ?auto_132779 ) ) ( not ( = ?auto_132776 ?auto_132779 ) ) ( not ( = ?auto_132777 ?auto_132779 ) ) ( not ( = ?auto_132778 ?auto_132779 ) ) ( ON ?auto_132773 ?auto_132772 ) ( ON-TABLE ?auto_132779 ) ( ON ?auto_132774 ?auto_132773 ) ( ON ?auto_132775 ?auto_132774 ) ( CLEAR ?auto_132775 ) ( HOLDING ?auto_132776 ) ( CLEAR ?auto_132777 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_132778 ?auto_132777 ?auto_132776 )
      ( MAKE-7PILE ?auto_132772 ?auto_132773 ?auto_132774 ?auto_132775 ?auto_132776 ?auto_132777 ?auto_132778 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132780 - BLOCK
      ?auto_132781 - BLOCK
      ?auto_132782 - BLOCK
      ?auto_132783 - BLOCK
      ?auto_132784 - BLOCK
      ?auto_132785 - BLOCK
      ?auto_132786 - BLOCK
    )
    :vars
    (
      ?auto_132787 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132780 ?auto_132781 ) ) ( not ( = ?auto_132780 ?auto_132782 ) ) ( not ( = ?auto_132780 ?auto_132783 ) ) ( not ( = ?auto_132780 ?auto_132784 ) ) ( not ( = ?auto_132780 ?auto_132785 ) ) ( not ( = ?auto_132780 ?auto_132786 ) ) ( not ( = ?auto_132781 ?auto_132782 ) ) ( not ( = ?auto_132781 ?auto_132783 ) ) ( not ( = ?auto_132781 ?auto_132784 ) ) ( not ( = ?auto_132781 ?auto_132785 ) ) ( not ( = ?auto_132781 ?auto_132786 ) ) ( not ( = ?auto_132782 ?auto_132783 ) ) ( not ( = ?auto_132782 ?auto_132784 ) ) ( not ( = ?auto_132782 ?auto_132785 ) ) ( not ( = ?auto_132782 ?auto_132786 ) ) ( not ( = ?auto_132783 ?auto_132784 ) ) ( not ( = ?auto_132783 ?auto_132785 ) ) ( not ( = ?auto_132783 ?auto_132786 ) ) ( not ( = ?auto_132784 ?auto_132785 ) ) ( not ( = ?auto_132784 ?auto_132786 ) ) ( not ( = ?auto_132785 ?auto_132786 ) ) ( ON-TABLE ?auto_132786 ) ( ON ?auto_132785 ?auto_132786 ) ( ON ?auto_132780 ?auto_132787 ) ( not ( = ?auto_132780 ?auto_132787 ) ) ( not ( = ?auto_132781 ?auto_132787 ) ) ( not ( = ?auto_132782 ?auto_132787 ) ) ( not ( = ?auto_132783 ?auto_132787 ) ) ( not ( = ?auto_132784 ?auto_132787 ) ) ( not ( = ?auto_132785 ?auto_132787 ) ) ( not ( = ?auto_132786 ?auto_132787 ) ) ( ON ?auto_132781 ?auto_132780 ) ( ON-TABLE ?auto_132787 ) ( ON ?auto_132782 ?auto_132781 ) ( ON ?auto_132783 ?auto_132782 ) ( CLEAR ?auto_132785 ) ( ON ?auto_132784 ?auto_132783 ) ( CLEAR ?auto_132784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_132787 ?auto_132780 ?auto_132781 ?auto_132782 ?auto_132783 )
      ( MAKE-7PILE ?auto_132780 ?auto_132781 ?auto_132782 ?auto_132783 ?auto_132784 ?auto_132785 ?auto_132786 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132788 - BLOCK
      ?auto_132789 - BLOCK
      ?auto_132790 - BLOCK
      ?auto_132791 - BLOCK
      ?auto_132792 - BLOCK
      ?auto_132793 - BLOCK
      ?auto_132794 - BLOCK
    )
    :vars
    (
      ?auto_132795 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132788 ?auto_132789 ) ) ( not ( = ?auto_132788 ?auto_132790 ) ) ( not ( = ?auto_132788 ?auto_132791 ) ) ( not ( = ?auto_132788 ?auto_132792 ) ) ( not ( = ?auto_132788 ?auto_132793 ) ) ( not ( = ?auto_132788 ?auto_132794 ) ) ( not ( = ?auto_132789 ?auto_132790 ) ) ( not ( = ?auto_132789 ?auto_132791 ) ) ( not ( = ?auto_132789 ?auto_132792 ) ) ( not ( = ?auto_132789 ?auto_132793 ) ) ( not ( = ?auto_132789 ?auto_132794 ) ) ( not ( = ?auto_132790 ?auto_132791 ) ) ( not ( = ?auto_132790 ?auto_132792 ) ) ( not ( = ?auto_132790 ?auto_132793 ) ) ( not ( = ?auto_132790 ?auto_132794 ) ) ( not ( = ?auto_132791 ?auto_132792 ) ) ( not ( = ?auto_132791 ?auto_132793 ) ) ( not ( = ?auto_132791 ?auto_132794 ) ) ( not ( = ?auto_132792 ?auto_132793 ) ) ( not ( = ?auto_132792 ?auto_132794 ) ) ( not ( = ?auto_132793 ?auto_132794 ) ) ( ON-TABLE ?auto_132794 ) ( ON ?auto_132788 ?auto_132795 ) ( not ( = ?auto_132788 ?auto_132795 ) ) ( not ( = ?auto_132789 ?auto_132795 ) ) ( not ( = ?auto_132790 ?auto_132795 ) ) ( not ( = ?auto_132791 ?auto_132795 ) ) ( not ( = ?auto_132792 ?auto_132795 ) ) ( not ( = ?auto_132793 ?auto_132795 ) ) ( not ( = ?auto_132794 ?auto_132795 ) ) ( ON ?auto_132789 ?auto_132788 ) ( ON-TABLE ?auto_132795 ) ( ON ?auto_132790 ?auto_132789 ) ( ON ?auto_132791 ?auto_132790 ) ( ON ?auto_132792 ?auto_132791 ) ( CLEAR ?auto_132792 ) ( HOLDING ?auto_132793 ) ( CLEAR ?auto_132794 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_132794 ?auto_132793 )
      ( MAKE-7PILE ?auto_132788 ?auto_132789 ?auto_132790 ?auto_132791 ?auto_132792 ?auto_132793 ?auto_132794 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132796 - BLOCK
      ?auto_132797 - BLOCK
      ?auto_132798 - BLOCK
      ?auto_132799 - BLOCK
      ?auto_132800 - BLOCK
      ?auto_132801 - BLOCK
      ?auto_132802 - BLOCK
    )
    :vars
    (
      ?auto_132803 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132796 ?auto_132797 ) ) ( not ( = ?auto_132796 ?auto_132798 ) ) ( not ( = ?auto_132796 ?auto_132799 ) ) ( not ( = ?auto_132796 ?auto_132800 ) ) ( not ( = ?auto_132796 ?auto_132801 ) ) ( not ( = ?auto_132796 ?auto_132802 ) ) ( not ( = ?auto_132797 ?auto_132798 ) ) ( not ( = ?auto_132797 ?auto_132799 ) ) ( not ( = ?auto_132797 ?auto_132800 ) ) ( not ( = ?auto_132797 ?auto_132801 ) ) ( not ( = ?auto_132797 ?auto_132802 ) ) ( not ( = ?auto_132798 ?auto_132799 ) ) ( not ( = ?auto_132798 ?auto_132800 ) ) ( not ( = ?auto_132798 ?auto_132801 ) ) ( not ( = ?auto_132798 ?auto_132802 ) ) ( not ( = ?auto_132799 ?auto_132800 ) ) ( not ( = ?auto_132799 ?auto_132801 ) ) ( not ( = ?auto_132799 ?auto_132802 ) ) ( not ( = ?auto_132800 ?auto_132801 ) ) ( not ( = ?auto_132800 ?auto_132802 ) ) ( not ( = ?auto_132801 ?auto_132802 ) ) ( ON-TABLE ?auto_132802 ) ( ON ?auto_132796 ?auto_132803 ) ( not ( = ?auto_132796 ?auto_132803 ) ) ( not ( = ?auto_132797 ?auto_132803 ) ) ( not ( = ?auto_132798 ?auto_132803 ) ) ( not ( = ?auto_132799 ?auto_132803 ) ) ( not ( = ?auto_132800 ?auto_132803 ) ) ( not ( = ?auto_132801 ?auto_132803 ) ) ( not ( = ?auto_132802 ?auto_132803 ) ) ( ON ?auto_132797 ?auto_132796 ) ( ON-TABLE ?auto_132803 ) ( ON ?auto_132798 ?auto_132797 ) ( ON ?auto_132799 ?auto_132798 ) ( ON ?auto_132800 ?auto_132799 ) ( CLEAR ?auto_132802 ) ( ON ?auto_132801 ?auto_132800 ) ( CLEAR ?auto_132801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_132803 ?auto_132796 ?auto_132797 ?auto_132798 ?auto_132799 ?auto_132800 )
      ( MAKE-7PILE ?auto_132796 ?auto_132797 ?auto_132798 ?auto_132799 ?auto_132800 ?auto_132801 ?auto_132802 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132804 - BLOCK
      ?auto_132805 - BLOCK
      ?auto_132806 - BLOCK
      ?auto_132807 - BLOCK
      ?auto_132808 - BLOCK
      ?auto_132809 - BLOCK
      ?auto_132810 - BLOCK
    )
    :vars
    (
      ?auto_132811 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132804 ?auto_132805 ) ) ( not ( = ?auto_132804 ?auto_132806 ) ) ( not ( = ?auto_132804 ?auto_132807 ) ) ( not ( = ?auto_132804 ?auto_132808 ) ) ( not ( = ?auto_132804 ?auto_132809 ) ) ( not ( = ?auto_132804 ?auto_132810 ) ) ( not ( = ?auto_132805 ?auto_132806 ) ) ( not ( = ?auto_132805 ?auto_132807 ) ) ( not ( = ?auto_132805 ?auto_132808 ) ) ( not ( = ?auto_132805 ?auto_132809 ) ) ( not ( = ?auto_132805 ?auto_132810 ) ) ( not ( = ?auto_132806 ?auto_132807 ) ) ( not ( = ?auto_132806 ?auto_132808 ) ) ( not ( = ?auto_132806 ?auto_132809 ) ) ( not ( = ?auto_132806 ?auto_132810 ) ) ( not ( = ?auto_132807 ?auto_132808 ) ) ( not ( = ?auto_132807 ?auto_132809 ) ) ( not ( = ?auto_132807 ?auto_132810 ) ) ( not ( = ?auto_132808 ?auto_132809 ) ) ( not ( = ?auto_132808 ?auto_132810 ) ) ( not ( = ?auto_132809 ?auto_132810 ) ) ( ON ?auto_132804 ?auto_132811 ) ( not ( = ?auto_132804 ?auto_132811 ) ) ( not ( = ?auto_132805 ?auto_132811 ) ) ( not ( = ?auto_132806 ?auto_132811 ) ) ( not ( = ?auto_132807 ?auto_132811 ) ) ( not ( = ?auto_132808 ?auto_132811 ) ) ( not ( = ?auto_132809 ?auto_132811 ) ) ( not ( = ?auto_132810 ?auto_132811 ) ) ( ON ?auto_132805 ?auto_132804 ) ( ON-TABLE ?auto_132811 ) ( ON ?auto_132806 ?auto_132805 ) ( ON ?auto_132807 ?auto_132806 ) ( ON ?auto_132808 ?auto_132807 ) ( ON ?auto_132809 ?auto_132808 ) ( CLEAR ?auto_132809 ) ( HOLDING ?auto_132810 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_132810 )
      ( MAKE-7PILE ?auto_132804 ?auto_132805 ?auto_132806 ?auto_132807 ?auto_132808 ?auto_132809 ?auto_132810 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132812 - BLOCK
      ?auto_132813 - BLOCK
      ?auto_132814 - BLOCK
      ?auto_132815 - BLOCK
      ?auto_132816 - BLOCK
      ?auto_132817 - BLOCK
      ?auto_132818 - BLOCK
    )
    :vars
    (
      ?auto_132819 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132812 ?auto_132813 ) ) ( not ( = ?auto_132812 ?auto_132814 ) ) ( not ( = ?auto_132812 ?auto_132815 ) ) ( not ( = ?auto_132812 ?auto_132816 ) ) ( not ( = ?auto_132812 ?auto_132817 ) ) ( not ( = ?auto_132812 ?auto_132818 ) ) ( not ( = ?auto_132813 ?auto_132814 ) ) ( not ( = ?auto_132813 ?auto_132815 ) ) ( not ( = ?auto_132813 ?auto_132816 ) ) ( not ( = ?auto_132813 ?auto_132817 ) ) ( not ( = ?auto_132813 ?auto_132818 ) ) ( not ( = ?auto_132814 ?auto_132815 ) ) ( not ( = ?auto_132814 ?auto_132816 ) ) ( not ( = ?auto_132814 ?auto_132817 ) ) ( not ( = ?auto_132814 ?auto_132818 ) ) ( not ( = ?auto_132815 ?auto_132816 ) ) ( not ( = ?auto_132815 ?auto_132817 ) ) ( not ( = ?auto_132815 ?auto_132818 ) ) ( not ( = ?auto_132816 ?auto_132817 ) ) ( not ( = ?auto_132816 ?auto_132818 ) ) ( not ( = ?auto_132817 ?auto_132818 ) ) ( ON ?auto_132812 ?auto_132819 ) ( not ( = ?auto_132812 ?auto_132819 ) ) ( not ( = ?auto_132813 ?auto_132819 ) ) ( not ( = ?auto_132814 ?auto_132819 ) ) ( not ( = ?auto_132815 ?auto_132819 ) ) ( not ( = ?auto_132816 ?auto_132819 ) ) ( not ( = ?auto_132817 ?auto_132819 ) ) ( not ( = ?auto_132818 ?auto_132819 ) ) ( ON ?auto_132813 ?auto_132812 ) ( ON-TABLE ?auto_132819 ) ( ON ?auto_132814 ?auto_132813 ) ( ON ?auto_132815 ?auto_132814 ) ( ON ?auto_132816 ?auto_132815 ) ( ON ?auto_132817 ?auto_132816 ) ( ON ?auto_132818 ?auto_132817 ) ( CLEAR ?auto_132818 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_132819 ?auto_132812 ?auto_132813 ?auto_132814 ?auto_132815 ?auto_132816 ?auto_132817 )
      ( MAKE-7PILE ?auto_132812 ?auto_132813 ?auto_132814 ?auto_132815 ?auto_132816 ?auto_132817 ?auto_132818 ) )
  )

)

