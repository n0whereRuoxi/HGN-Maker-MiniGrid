( define ( domain Blocks4 )
  ( :requirements :strips :typing :equality :htn )
  ( :types block )
  ( :predicates
    ( ON-TABLE ?B - BLOCK )
    ( ON ?B1 - BLOCK ?B2 - BLOCK )
    ( CLEAR ?B - BLOCK )
    ( HAND-EMPTY )
    ( HOLDING ?B - BLOCK )
  )
  ( :action !PICKUP
    :parameters
    (
      ?B - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?B ) ( CLEAR ?B ) ( HAND-EMPTY ) )
    :effect
    ( and ( not ( ON-TABLE ?B ) ) ( not ( CLEAR ?B ) ) ( not ( HAND-EMPTY ) ) ( HOLDING ?B ) )
  )
  ( :action !PUTDOWN
    :parameters
    (
      ?B - BLOCK
    )
    :precondition
    ( and ( HOLDING ?B ) )
    :effect
    ( and ( not ( HOLDING ?B ) ) ( HAND-EMPTY ) ( ON-TABLE ?B ) ( CLEAR ?B ) )
  )
  ( :action !UNSTACK
    :parameters
    (
      ?B1 - BLOCK
      ?B2 - BLOCK
    )
    :precondition
    ( and ( ON ?B1 ?B2 ) ( CLEAR ?B1 ) ( HAND-EMPTY ) )
    :effect
    ( and ( not ( ON ?B1 ?B2 ) ) ( not ( CLEAR ?B1 ) ) ( not ( HAND-EMPTY ) ) ( CLEAR ?B2 ) ( HOLDING ?B1 ) )
  )
  ( :action !STACK
    :parameters
    (
      ?B1 - BLOCK
      ?B2 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?B1 ) ( CLEAR ?B2 ) )
    :effect
    ( and ( not ( HOLDING ?B1 ) ) ( not ( CLEAR ?B2 ) ) ( HAND-EMPTY ) ( ON ?B1 ?B2 ) ( CLEAR ?B1 ) )
  )
  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?GOAL - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?GOAL ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?TOP - BLOCK
      ?BOTTOM - BLOCK
    )
    :precondition
    ( and ( ON ?TOP ?BOTTOM ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON-TABLE-VERIFY
    :parameters
    (
      ?BLOCK - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?BLOCK ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON-VERIFY
    :parameters
    (
      ?B1 - BLOCK
      ?B2 - BLOCK
    )
    :precondition
    ( and ( ON ?B1 ?B2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2 - BLOCK
      ?AUTO_3 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2 ) ( CLEAR ?AUTO_3 ) ( not ( = ?AUTO_2 ?AUTO_3 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2 ?AUTO_3 )
      ( MAKE-ON-VERIFY ?AUTO_2 ?AUTO_3 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4 - BLOCK
      ?AUTO_5 - BLOCK
    )
    :vars
    (
      ?AUTO_6 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5 ) ( not ( = ?AUTO_4 ?AUTO_5 ) ) ( ON ?AUTO_4 ?AUTO_6 ) ( CLEAR ?AUTO_4 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4 ?AUTO_6 ) ) ( not ( = ?AUTO_5 ?AUTO_6 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4 ?AUTO_6 )
      ( MAKE-ON ?AUTO_4 ?AUTO_5 )
      ( MAKE-ON-VERIFY ?AUTO_4 ?AUTO_5 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9 - BLOCK
    )
    :vars
    (
      ?AUTO_10 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9 ?AUTO_10 ) ( CLEAR ?AUTO_9 ) ( HAND-EMPTY ) ( not ( = ?AUTO_9 ?AUTO_10 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9 ?AUTO_10 )
      ( MAKE-ON-TABLE ?AUTO_9 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_11 - BLOCK
    )
    :vars
    (
      ?AUTO_12 - BLOCK
      ?AUTO_13 - BLOCK
      ?AUTO_14 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_11 ?AUTO_12 ) ( CLEAR ?AUTO_11 ) ( not ( = ?AUTO_11 ?AUTO_12 ) ) ( HOLDING ?AUTO_13 ) ( CLEAR ?AUTO_14 ) ( not ( = ?AUTO_11 ?AUTO_13 ) ) ( not ( = ?AUTO_11 ?AUTO_14 ) ) ( not ( = ?AUTO_12 ?AUTO_13 ) ) ( not ( = ?AUTO_12 ?AUTO_14 ) ) ( not ( = ?AUTO_13 ?AUTO_14 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_13 ?AUTO_14 )
      ( MAKE-ON-TABLE ?AUTO_11 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_11 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_15 - BLOCK
    )
    :vars
    (
      ?AUTO_16 - BLOCK
      ?AUTO_18 - BLOCK
      ?AUTO_17 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_15 ?AUTO_16 ) ( not ( = ?AUTO_15 ?AUTO_16 ) ) ( CLEAR ?AUTO_18 ) ( not ( = ?AUTO_15 ?AUTO_17 ) ) ( not ( = ?AUTO_15 ?AUTO_18 ) ) ( not ( = ?AUTO_16 ?AUTO_17 ) ) ( not ( = ?AUTO_16 ?AUTO_18 ) ) ( not ( = ?AUTO_17 ?AUTO_18 ) ) ( ON ?AUTO_17 ?AUTO_15 ) ( CLEAR ?AUTO_17 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_17 ?AUTO_15 )
      ( MAKE-ON-TABLE ?AUTO_15 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_15 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_21 - BLOCK
      ?AUTO_22 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_21 ) ( CLEAR ?AUTO_22 ) ( not ( = ?AUTO_21 ?AUTO_22 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_21 ?AUTO_22 )
      ( MAKE-ON-VERIFY ?AUTO_21 ?AUTO_22 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_23 - BLOCK
      ?AUTO_24 - BLOCK
    )
    :vars
    (
      ?AUTO_25 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_24 ) ( not ( = ?AUTO_23 ?AUTO_24 ) ) ( ON ?AUTO_23 ?AUTO_25 ) ( CLEAR ?AUTO_23 ) ( HAND-EMPTY ) ( not ( = ?AUTO_23 ?AUTO_25 ) ) ( not ( = ?AUTO_24 ?AUTO_25 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_23 ?AUTO_25 )
      ( MAKE-ON ?AUTO_23 ?AUTO_24 )
      ( MAKE-ON-VERIFY ?AUTO_23 ?AUTO_24 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_26 - BLOCK
      ?AUTO_27 - BLOCK
    )
    :vars
    (
      ?AUTO_28 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_26 ?AUTO_27 ) ) ( ON ?AUTO_26 ?AUTO_28 ) ( CLEAR ?AUTO_26 ) ( not ( = ?AUTO_26 ?AUTO_28 ) ) ( not ( = ?AUTO_27 ?AUTO_28 ) ) ( HOLDING ?AUTO_27 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_27 )
      ( MAKE-ON ?AUTO_26 ?AUTO_27 )
      ( MAKE-ON-VERIFY ?AUTO_26 ?AUTO_27 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_29 - BLOCK
      ?AUTO_30 - BLOCK
    )
    :vars
    (
      ?AUTO_31 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_29 ?AUTO_30 ) ) ( ON ?AUTO_29 ?AUTO_31 ) ( not ( = ?AUTO_29 ?AUTO_31 ) ) ( not ( = ?AUTO_30 ?AUTO_31 ) ) ( ON ?AUTO_30 ?AUTO_29 ) ( CLEAR ?AUTO_30 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_30 ?AUTO_29 )
      ( MAKE-ON ?AUTO_29 ?AUTO_30 )
      ( MAKE-ON-VERIFY ?AUTO_29 ?AUTO_30 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_32 - BLOCK
      ?AUTO_33 - BLOCK
    )
    :vars
    (
      ?AUTO_34 - BLOCK
      ?AUTO_35 - BLOCK
      ?AUTO_36 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_32 ?AUTO_33 ) ) ( ON ?AUTO_32 ?AUTO_34 ) ( not ( = ?AUTO_32 ?AUTO_34 ) ) ( not ( = ?AUTO_33 ?AUTO_34 ) ) ( ON ?AUTO_33 ?AUTO_32 ) ( CLEAR ?AUTO_33 ) ( HOLDING ?AUTO_35 ) ( CLEAR ?AUTO_36 ) ( not ( = ?AUTO_32 ?AUTO_35 ) ) ( not ( = ?AUTO_32 ?AUTO_36 ) ) ( not ( = ?AUTO_33 ?AUTO_35 ) ) ( not ( = ?AUTO_33 ?AUTO_36 ) ) ( not ( = ?AUTO_34 ?AUTO_35 ) ) ( not ( = ?AUTO_34 ?AUTO_36 ) ) ( not ( = ?AUTO_35 ?AUTO_36 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_35 ?AUTO_36 )
      ( MAKE-ON ?AUTO_32 ?AUTO_33 )
      ( MAKE-ON-VERIFY ?AUTO_32 ?AUTO_33 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_37 - BLOCK
      ?AUTO_38 - BLOCK
    )
    :vars
    (
      ?AUTO_39 - BLOCK
      ?AUTO_40 - BLOCK
      ?AUTO_41 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_37 ?AUTO_38 ) ) ( ON ?AUTO_37 ?AUTO_39 ) ( not ( = ?AUTO_37 ?AUTO_39 ) ) ( not ( = ?AUTO_38 ?AUTO_39 ) ) ( ON ?AUTO_38 ?AUTO_37 ) ( CLEAR ?AUTO_40 ) ( not ( = ?AUTO_37 ?AUTO_41 ) ) ( not ( = ?AUTO_37 ?AUTO_40 ) ) ( not ( = ?AUTO_38 ?AUTO_41 ) ) ( not ( = ?AUTO_38 ?AUTO_40 ) ) ( not ( = ?AUTO_39 ?AUTO_41 ) ) ( not ( = ?AUTO_39 ?AUTO_40 ) ) ( not ( = ?AUTO_41 ?AUTO_40 ) ) ( ON ?AUTO_41 ?AUTO_38 ) ( CLEAR ?AUTO_41 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_41 ?AUTO_38 )
      ( MAKE-ON ?AUTO_37 ?AUTO_38 )
      ( MAKE-ON-VERIFY ?AUTO_37 ?AUTO_38 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_44 - BLOCK
      ?AUTO_45 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_44 ) ( CLEAR ?AUTO_45 ) ( not ( = ?AUTO_44 ?AUTO_45 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_44 ?AUTO_45 )
      ( MAKE-ON-VERIFY ?AUTO_44 ?AUTO_45 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_46 - BLOCK
      ?AUTO_47 - BLOCK
    )
    :vars
    (
      ?AUTO_48 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_47 ) ( not ( = ?AUTO_46 ?AUTO_47 ) ) ( ON ?AUTO_46 ?AUTO_48 ) ( CLEAR ?AUTO_46 ) ( HAND-EMPTY ) ( not ( = ?AUTO_46 ?AUTO_48 ) ) ( not ( = ?AUTO_47 ?AUTO_48 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_46 ?AUTO_48 )
      ( MAKE-ON ?AUTO_46 ?AUTO_47 )
      ( MAKE-ON-VERIFY ?AUTO_46 ?AUTO_47 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_49 - BLOCK
      ?AUTO_50 - BLOCK
    )
    :vars
    (
      ?AUTO_51 - BLOCK
      ?AUTO_52 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_49 ?AUTO_50 ) ) ( ON ?AUTO_49 ?AUTO_51 ) ( CLEAR ?AUTO_49 ) ( not ( = ?AUTO_49 ?AUTO_51 ) ) ( not ( = ?AUTO_50 ?AUTO_51 ) ) ( HOLDING ?AUTO_50 ) ( CLEAR ?AUTO_52 ) ( not ( = ?AUTO_49 ?AUTO_52 ) ) ( not ( = ?AUTO_50 ?AUTO_52 ) ) ( not ( = ?AUTO_51 ?AUTO_52 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_50 ?AUTO_52 )
      ( MAKE-ON ?AUTO_49 ?AUTO_50 )
      ( MAKE-ON-VERIFY ?AUTO_49 ?AUTO_50 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_53 - BLOCK
      ?AUTO_54 - BLOCK
    )
    :vars
    (
      ?AUTO_55 - BLOCK
      ?AUTO_56 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_53 ?AUTO_54 ) ) ( ON ?AUTO_53 ?AUTO_55 ) ( not ( = ?AUTO_53 ?AUTO_55 ) ) ( not ( = ?AUTO_54 ?AUTO_55 ) ) ( CLEAR ?AUTO_56 ) ( not ( = ?AUTO_53 ?AUTO_56 ) ) ( not ( = ?AUTO_54 ?AUTO_56 ) ) ( not ( = ?AUTO_55 ?AUTO_56 ) ) ( ON ?AUTO_54 ?AUTO_53 ) ( CLEAR ?AUTO_54 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_54 ?AUTO_53 )
      ( MAKE-ON ?AUTO_53 ?AUTO_54 )
      ( MAKE-ON-VERIFY ?AUTO_53 ?AUTO_54 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_57 - BLOCK
      ?AUTO_58 - BLOCK
    )
    :vars
    (
      ?AUTO_59 - BLOCK
      ?AUTO_60 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_57 ?AUTO_58 ) ) ( ON ?AUTO_57 ?AUTO_59 ) ( not ( = ?AUTO_57 ?AUTO_59 ) ) ( not ( = ?AUTO_58 ?AUTO_59 ) ) ( not ( = ?AUTO_57 ?AUTO_60 ) ) ( not ( = ?AUTO_58 ?AUTO_60 ) ) ( not ( = ?AUTO_59 ?AUTO_60 ) ) ( ON ?AUTO_58 ?AUTO_57 ) ( CLEAR ?AUTO_58 ) ( HOLDING ?AUTO_60 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_60 )
      ( MAKE-ON ?AUTO_57 ?AUTO_58 )
      ( MAKE-ON-VERIFY ?AUTO_57 ?AUTO_58 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_61 - BLOCK
      ?AUTO_62 - BLOCK
    )
    :vars
    (
      ?AUTO_64 - BLOCK
      ?AUTO_63 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_61 ?AUTO_62 ) ) ( ON ?AUTO_61 ?AUTO_64 ) ( not ( = ?AUTO_61 ?AUTO_64 ) ) ( not ( = ?AUTO_62 ?AUTO_64 ) ) ( not ( = ?AUTO_61 ?AUTO_63 ) ) ( not ( = ?AUTO_62 ?AUTO_63 ) ) ( not ( = ?AUTO_64 ?AUTO_63 ) ) ( ON ?AUTO_62 ?AUTO_61 ) ( ON ?AUTO_63 ?AUTO_62 ) ( CLEAR ?AUTO_63 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_63 ?AUTO_62 )
      ( MAKE-ON ?AUTO_61 ?AUTO_62 )
      ( MAKE-ON-VERIFY ?AUTO_61 ?AUTO_62 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_65 - BLOCK
      ?AUTO_66 - BLOCK
    )
    :vars
    (
      ?AUTO_67 - BLOCK
      ?AUTO_68 - BLOCK
      ?AUTO_69 - BLOCK
      ?AUTO_70 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_65 ?AUTO_66 ) ) ( ON ?AUTO_65 ?AUTO_67 ) ( not ( = ?AUTO_65 ?AUTO_67 ) ) ( not ( = ?AUTO_66 ?AUTO_67 ) ) ( not ( = ?AUTO_65 ?AUTO_68 ) ) ( not ( = ?AUTO_66 ?AUTO_68 ) ) ( not ( = ?AUTO_67 ?AUTO_68 ) ) ( ON ?AUTO_66 ?AUTO_65 ) ( ON ?AUTO_68 ?AUTO_66 ) ( CLEAR ?AUTO_68 ) ( HOLDING ?AUTO_69 ) ( CLEAR ?AUTO_70 ) ( not ( = ?AUTO_65 ?AUTO_69 ) ) ( not ( = ?AUTO_65 ?AUTO_70 ) ) ( not ( = ?AUTO_66 ?AUTO_69 ) ) ( not ( = ?AUTO_66 ?AUTO_70 ) ) ( not ( = ?AUTO_67 ?AUTO_69 ) ) ( not ( = ?AUTO_67 ?AUTO_70 ) ) ( not ( = ?AUTO_68 ?AUTO_69 ) ) ( not ( = ?AUTO_68 ?AUTO_70 ) ) ( not ( = ?AUTO_69 ?AUTO_70 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_69 ?AUTO_70 )
      ( MAKE-ON ?AUTO_65 ?AUTO_66 )
      ( MAKE-ON-VERIFY ?AUTO_65 ?AUTO_66 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_71 - BLOCK
      ?AUTO_72 - BLOCK
    )
    :vars
    (
      ?AUTO_74 - BLOCK
      ?AUTO_73 - BLOCK
      ?AUTO_76 - BLOCK
      ?AUTO_75 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_71 ?AUTO_72 ) ) ( ON ?AUTO_71 ?AUTO_74 ) ( not ( = ?AUTO_71 ?AUTO_74 ) ) ( not ( = ?AUTO_72 ?AUTO_74 ) ) ( not ( = ?AUTO_71 ?AUTO_73 ) ) ( not ( = ?AUTO_72 ?AUTO_73 ) ) ( not ( = ?AUTO_74 ?AUTO_73 ) ) ( ON ?AUTO_72 ?AUTO_71 ) ( ON ?AUTO_73 ?AUTO_72 ) ( CLEAR ?AUTO_76 ) ( not ( = ?AUTO_71 ?AUTO_75 ) ) ( not ( = ?AUTO_71 ?AUTO_76 ) ) ( not ( = ?AUTO_72 ?AUTO_75 ) ) ( not ( = ?AUTO_72 ?AUTO_76 ) ) ( not ( = ?AUTO_74 ?AUTO_75 ) ) ( not ( = ?AUTO_74 ?AUTO_76 ) ) ( not ( = ?AUTO_73 ?AUTO_75 ) ) ( not ( = ?AUTO_73 ?AUTO_76 ) ) ( not ( = ?AUTO_75 ?AUTO_76 ) ) ( ON ?AUTO_75 ?AUTO_73 ) ( CLEAR ?AUTO_75 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_75 ?AUTO_73 )
      ( MAKE-ON ?AUTO_71 ?AUTO_72 )
      ( MAKE-ON-VERIFY ?AUTO_71 ?AUTO_72 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_78 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_78 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_78 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_78 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_79 - BLOCK
    )
    :vars
    (
      ?AUTO_80 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_79 ?AUTO_80 ) ( CLEAR ?AUTO_79 ) ( HAND-EMPTY ) ( not ( = ?AUTO_79 ?AUTO_80 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_79 ?AUTO_80 )
      ( MAKE-ON-TABLE ?AUTO_79 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_79 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_81 - BLOCK
    )
    :vars
    (
      ?AUTO_82 - BLOCK
      ?AUTO_83 - BLOCK
      ?AUTO_84 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_81 ?AUTO_82 ) ( CLEAR ?AUTO_81 ) ( not ( = ?AUTO_81 ?AUTO_82 ) ) ( HOLDING ?AUTO_83 ) ( CLEAR ?AUTO_84 ) ( not ( = ?AUTO_81 ?AUTO_83 ) ) ( not ( = ?AUTO_81 ?AUTO_84 ) ) ( not ( = ?AUTO_82 ?AUTO_83 ) ) ( not ( = ?AUTO_82 ?AUTO_84 ) ) ( not ( = ?AUTO_83 ?AUTO_84 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_83 ?AUTO_84 )
      ( MAKE-ON-TABLE ?AUTO_81 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_81 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_94 - BLOCK
      ?AUTO_95 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_94 ) ( CLEAR ?AUTO_95 ) ( not ( = ?AUTO_94 ?AUTO_95 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_94 ?AUTO_95 )
      ( MAKE-ON-VERIFY ?AUTO_94 ?AUTO_95 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_96 - BLOCK
      ?AUTO_97 - BLOCK
    )
    :vars
    (
      ?AUTO_98 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_97 ) ( not ( = ?AUTO_96 ?AUTO_97 ) ) ( ON ?AUTO_96 ?AUTO_98 ) ( CLEAR ?AUTO_96 ) ( HAND-EMPTY ) ( not ( = ?AUTO_96 ?AUTO_98 ) ) ( not ( = ?AUTO_97 ?AUTO_98 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_96 ?AUTO_98 )
      ( MAKE-ON ?AUTO_96 ?AUTO_97 )
      ( MAKE-ON-VERIFY ?AUTO_96 ?AUTO_97 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_99 - BLOCK
      ?AUTO_100 - BLOCK
    )
    :vars
    (
      ?AUTO_101 - BLOCK
      ?AUTO_102 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_100 ) ( not ( = ?AUTO_99 ?AUTO_100 ) ) ( ON ?AUTO_99 ?AUTO_101 ) ( CLEAR ?AUTO_99 ) ( not ( = ?AUTO_99 ?AUTO_101 ) ) ( not ( = ?AUTO_100 ?AUTO_101 ) ) ( HOLDING ?AUTO_102 ) ( not ( = ?AUTO_99 ?AUTO_102 ) ) ( not ( = ?AUTO_100 ?AUTO_102 ) ) ( not ( = ?AUTO_101 ?AUTO_102 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_102 )
      ( MAKE-ON ?AUTO_99 ?AUTO_100 )
      ( MAKE-ON-VERIFY ?AUTO_99 ?AUTO_100 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_103 - BLOCK
      ?AUTO_104 - BLOCK
    )
    :vars
    (
      ?AUTO_105 - BLOCK
      ?AUTO_106 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_103 ?AUTO_104 ) ) ( ON ?AUTO_103 ?AUTO_105 ) ( CLEAR ?AUTO_103 ) ( not ( = ?AUTO_103 ?AUTO_105 ) ) ( not ( = ?AUTO_104 ?AUTO_105 ) ) ( not ( = ?AUTO_103 ?AUTO_106 ) ) ( not ( = ?AUTO_104 ?AUTO_106 ) ) ( not ( = ?AUTO_105 ?AUTO_106 ) ) ( ON ?AUTO_106 ?AUTO_104 ) ( CLEAR ?AUTO_106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_106 ?AUTO_104 )
      ( MAKE-ON ?AUTO_103 ?AUTO_104 )
      ( MAKE-ON-VERIFY ?AUTO_103 ?AUTO_104 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_107 - BLOCK
      ?AUTO_108 - BLOCK
    )
    :vars
    (
      ?AUTO_109 - BLOCK
      ?AUTO_110 - BLOCK
      ?AUTO_111 - BLOCK
      ?AUTO_112 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_107 ?AUTO_108 ) ) ( ON ?AUTO_107 ?AUTO_109 ) ( CLEAR ?AUTO_107 ) ( not ( = ?AUTO_107 ?AUTO_109 ) ) ( not ( = ?AUTO_108 ?AUTO_109 ) ) ( not ( = ?AUTO_107 ?AUTO_110 ) ) ( not ( = ?AUTO_108 ?AUTO_110 ) ) ( not ( = ?AUTO_109 ?AUTO_110 ) ) ( ON ?AUTO_110 ?AUTO_108 ) ( CLEAR ?AUTO_110 ) ( HOLDING ?AUTO_111 ) ( CLEAR ?AUTO_112 ) ( not ( = ?AUTO_107 ?AUTO_111 ) ) ( not ( = ?AUTO_107 ?AUTO_112 ) ) ( not ( = ?AUTO_108 ?AUTO_111 ) ) ( not ( = ?AUTO_108 ?AUTO_112 ) ) ( not ( = ?AUTO_109 ?AUTO_111 ) ) ( not ( = ?AUTO_109 ?AUTO_112 ) ) ( not ( = ?AUTO_110 ?AUTO_111 ) ) ( not ( = ?AUTO_110 ?AUTO_112 ) ) ( not ( = ?AUTO_111 ?AUTO_112 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_111 ?AUTO_112 )
      ( MAKE-ON ?AUTO_107 ?AUTO_108 )
      ( MAKE-ON-VERIFY ?AUTO_107 ?AUTO_108 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_123 - BLOCK
      ?AUTO_124 - BLOCK
    )
    :vars
    (
      ?AUTO_126 - BLOCK
      ?AUTO_125 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_123 ?AUTO_124 ) ) ( not ( = ?AUTO_123 ?AUTO_126 ) ) ( not ( = ?AUTO_124 ?AUTO_126 ) ) ( not ( = ?AUTO_123 ?AUTO_125 ) ) ( not ( = ?AUTO_124 ?AUTO_125 ) ) ( not ( = ?AUTO_126 ?AUTO_125 ) ) ( ON ?AUTO_125 ?AUTO_124 ) ( CLEAR ?AUTO_125 ) ( HOLDING ?AUTO_123 ) ( CLEAR ?AUTO_126 ) )
    :subtasks
    ( ( !STACK ?AUTO_123 ?AUTO_126 )
      ( MAKE-ON ?AUTO_123 ?AUTO_124 )
      ( MAKE-ON-VERIFY ?AUTO_123 ?AUTO_124 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_131 - BLOCK
      ?AUTO_132 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_131 ) ( CLEAR ?AUTO_132 ) ( not ( = ?AUTO_131 ?AUTO_132 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_131 ?AUTO_132 )
      ( MAKE-ON-VERIFY ?AUTO_131 ?AUTO_132 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_133 - BLOCK
      ?AUTO_134 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_134 ) ( not ( = ?AUTO_133 ?AUTO_134 ) ) ( ON-TABLE ?AUTO_133 ) ( CLEAR ?AUTO_133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_133 )
      ( MAKE-ON ?AUTO_133 ?AUTO_134 )
      ( MAKE-ON-VERIFY ?AUTO_133 ?AUTO_134 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_135 - BLOCK
      ?AUTO_136 - BLOCK
    )
    :vars
    (
      ?AUTO_137 - BLOCK
      ?AUTO_138 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_136 ) ( not ( = ?AUTO_135 ?AUTO_136 ) ) ( ON-TABLE ?AUTO_135 ) ( CLEAR ?AUTO_135 ) ( HOLDING ?AUTO_137 ) ( CLEAR ?AUTO_138 ) ( not ( = ?AUTO_135 ?AUTO_137 ) ) ( not ( = ?AUTO_135 ?AUTO_138 ) ) ( not ( = ?AUTO_136 ?AUTO_137 ) ) ( not ( = ?AUTO_136 ?AUTO_138 ) ) ( not ( = ?AUTO_137 ?AUTO_138 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_137 ?AUTO_138 )
      ( MAKE-ON ?AUTO_135 ?AUTO_136 )
      ( MAKE-ON-VERIFY ?AUTO_135 ?AUTO_136 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_145 - BLOCK
      ?AUTO_146 - BLOCK
    )
    :vars
    (
      ?AUTO_147 - BLOCK
      ?AUTO_148 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_145 ?AUTO_146 ) ) ( ON ?AUTO_145 ?AUTO_147 ) ( CLEAR ?AUTO_145 ) ( not ( = ?AUTO_145 ?AUTO_147 ) ) ( not ( = ?AUTO_146 ?AUTO_147 ) ) ( HOLDING ?AUTO_146 ) ( CLEAR ?AUTO_148 ) ( not ( = ?AUTO_145 ?AUTO_148 ) ) ( not ( = ?AUTO_146 ?AUTO_148 ) ) ( not ( = ?AUTO_147 ?AUTO_148 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_146 ?AUTO_148 )
      ( MAKE-ON ?AUTO_145 ?AUTO_146 )
      ( MAKE-ON-VERIFY ?AUTO_145 ?AUTO_146 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_157 - BLOCK
      ?AUTO_158 - BLOCK
    )
    :vars
    (
      ?AUTO_162 - BLOCK
      ?AUTO_160 - BLOCK
      ?AUTO_161 - BLOCK
      ?AUTO_159 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_157 ?AUTO_158 ) ) ( ON ?AUTO_157 ?AUTO_162 ) ( CLEAR ?AUTO_157 ) ( not ( = ?AUTO_157 ?AUTO_162 ) ) ( not ( = ?AUTO_158 ?AUTO_162 ) ) ( not ( = ?AUTO_157 ?AUTO_160 ) ) ( not ( = ?AUTO_158 ?AUTO_160 ) ) ( not ( = ?AUTO_162 ?AUTO_160 ) ) ( ON ?AUTO_160 ?AUTO_158 ) ( CLEAR ?AUTO_161 ) ( not ( = ?AUTO_157 ?AUTO_159 ) ) ( not ( = ?AUTO_157 ?AUTO_161 ) ) ( not ( = ?AUTO_158 ?AUTO_159 ) ) ( not ( = ?AUTO_158 ?AUTO_161 ) ) ( not ( = ?AUTO_162 ?AUTO_159 ) ) ( not ( = ?AUTO_162 ?AUTO_161 ) ) ( not ( = ?AUTO_160 ?AUTO_159 ) ) ( not ( = ?AUTO_160 ?AUTO_161 ) ) ( not ( = ?AUTO_159 ?AUTO_161 ) ) ( ON ?AUTO_159 ?AUTO_160 ) ( CLEAR ?AUTO_159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_159 ?AUTO_160 )
      ( MAKE-ON ?AUTO_157 ?AUTO_158 )
      ( MAKE-ON-VERIFY ?AUTO_157 ?AUTO_158 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_163 - BLOCK
      ?AUTO_164 - BLOCK
    )
    :vars
    (
      ?AUTO_167 - BLOCK
      ?AUTO_165 - BLOCK
      ?AUTO_166 - BLOCK
      ?AUTO_168 - BLOCK
      ?AUTO_169 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_163 ?AUTO_164 ) ) ( ON ?AUTO_163 ?AUTO_167 ) ( CLEAR ?AUTO_163 ) ( not ( = ?AUTO_163 ?AUTO_167 ) ) ( not ( = ?AUTO_164 ?AUTO_167 ) ) ( not ( = ?AUTO_163 ?AUTO_165 ) ) ( not ( = ?AUTO_164 ?AUTO_165 ) ) ( not ( = ?AUTO_167 ?AUTO_165 ) ) ( ON ?AUTO_165 ?AUTO_164 ) ( not ( = ?AUTO_163 ?AUTO_166 ) ) ( not ( = ?AUTO_163 ?AUTO_168 ) ) ( not ( = ?AUTO_164 ?AUTO_166 ) ) ( not ( = ?AUTO_164 ?AUTO_168 ) ) ( not ( = ?AUTO_167 ?AUTO_166 ) ) ( not ( = ?AUTO_167 ?AUTO_168 ) ) ( not ( = ?AUTO_165 ?AUTO_166 ) ) ( not ( = ?AUTO_165 ?AUTO_168 ) ) ( not ( = ?AUTO_166 ?AUTO_168 ) ) ( ON ?AUTO_166 ?AUTO_165 ) ( CLEAR ?AUTO_166 ) ( HOLDING ?AUTO_168 ) ( CLEAR ?AUTO_169 ) ( not ( = ?AUTO_163 ?AUTO_169 ) ) ( not ( = ?AUTO_164 ?AUTO_169 ) ) ( not ( = ?AUTO_167 ?AUTO_169 ) ) ( not ( = ?AUTO_165 ?AUTO_169 ) ) ( not ( = ?AUTO_166 ?AUTO_169 ) ) ( not ( = ?AUTO_168 ?AUTO_169 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_168 ?AUTO_169 )
      ( MAKE-ON ?AUTO_163 ?AUTO_164 )
      ( MAKE-ON-VERIFY ?AUTO_163 ?AUTO_164 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_170 - BLOCK
      ?AUTO_171 - BLOCK
    )
    :vars
    (
      ?AUTO_173 - BLOCK
      ?AUTO_175 - BLOCK
      ?AUTO_176 - BLOCK
      ?AUTO_172 - BLOCK
      ?AUTO_174 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_170 ?AUTO_171 ) ) ( ON ?AUTO_170 ?AUTO_173 ) ( CLEAR ?AUTO_170 ) ( not ( = ?AUTO_170 ?AUTO_173 ) ) ( not ( = ?AUTO_171 ?AUTO_173 ) ) ( not ( = ?AUTO_170 ?AUTO_175 ) ) ( not ( = ?AUTO_171 ?AUTO_175 ) ) ( not ( = ?AUTO_173 ?AUTO_175 ) ) ( ON ?AUTO_175 ?AUTO_171 ) ( not ( = ?AUTO_170 ?AUTO_176 ) ) ( not ( = ?AUTO_170 ?AUTO_172 ) ) ( not ( = ?AUTO_171 ?AUTO_176 ) ) ( not ( = ?AUTO_171 ?AUTO_172 ) ) ( not ( = ?AUTO_173 ?AUTO_176 ) ) ( not ( = ?AUTO_173 ?AUTO_172 ) ) ( not ( = ?AUTO_175 ?AUTO_176 ) ) ( not ( = ?AUTO_175 ?AUTO_172 ) ) ( not ( = ?AUTO_176 ?AUTO_172 ) ) ( ON ?AUTO_176 ?AUTO_175 ) ( CLEAR ?AUTO_174 ) ( not ( = ?AUTO_170 ?AUTO_174 ) ) ( not ( = ?AUTO_171 ?AUTO_174 ) ) ( not ( = ?AUTO_173 ?AUTO_174 ) ) ( not ( = ?AUTO_175 ?AUTO_174 ) ) ( not ( = ?AUTO_176 ?AUTO_174 ) ) ( not ( = ?AUTO_172 ?AUTO_174 ) ) ( ON ?AUTO_172 ?AUTO_176 ) ( CLEAR ?AUTO_172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_172 ?AUTO_176 )
      ( MAKE-ON ?AUTO_170 ?AUTO_171 )
      ( MAKE-ON-VERIFY ?AUTO_170 ?AUTO_171 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_179 - BLOCK
      ?AUTO_180 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_179 ) ( CLEAR ?AUTO_180 ) ( not ( = ?AUTO_179 ?AUTO_180 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_179 ?AUTO_180 )
      ( MAKE-ON-VERIFY ?AUTO_179 ?AUTO_180 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_181 - BLOCK
      ?AUTO_182 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_182 ) ( not ( = ?AUTO_181 ?AUTO_182 ) ) ( ON-TABLE ?AUTO_181 ) ( CLEAR ?AUTO_181 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_181 )
      ( MAKE-ON ?AUTO_181 ?AUTO_182 )
      ( MAKE-ON-VERIFY ?AUTO_181 ?AUTO_182 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_183 - BLOCK
      ?AUTO_184 - BLOCK
    )
    :vars
    (
      ?AUTO_185 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_183 ?AUTO_184 ) ) ( ON-TABLE ?AUTO_183 ) ( CLEAR ?AUTO_183 ) ( HOLDING ?AUTO_184 ) ( CLEAR ?AUTO_185 ) ( not ( = ?AUTO_183 ?AUTO_185 ) ) ( not ( = ?AUTO_184 ?AUTO_185 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_184 ?AUTO_185 )
      ( MAKE-ON ?AUTO_183 ?AUTO_184 )
      ( MAKE-ON-VERIFY ?AUTO_183 ?AUTO_184 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_190 - BLOCK
      ?AUTO_191 - BLOCK
    )
    :vars
    (
      ?AUTO_193 - BLOCK
      ?AUTO_192 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_191 ) ( not ( = ?AUTO_190 ?AUTO_191 ) ) ( ON-TABLE ?AUTO_190 ) ( CLEAR ?AUTO_193 ) ( not ( = ?AUTO_190 ?AUTO_192 ) ) ( not ( = ?AUTO_190 ?AUTO_193 ) ) ( not ( = ?AUTO_191 ?AUTO_192 ) ) ( not ( = ?AUTO_191 ?AUTO_193 ) ) ( not ( = ?AUTO_192 ?AUTO_193 ) ) ( ON ?AUTO_192 ?AUTO_190 ) ( CLEAR ?AUTO_192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_192 ?AUTO_190 )
      ( MAKE-ON ?AUTO_190 ?AUTO_191 )
      ( MAKE-ON-VERIFY ?AUTO_190 ?AUTO_191 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_194 - BLOCK
      ?AUTO_195 - BLOCK
    )
    :vars
    (
      ?AUTO_196 - BLOCK
      ?AUTO_197 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_194 ?AUTO_195 ) ) ( ON-TABLE ?AUTO_194 ) ( CLEAR ?AUTO_196 ) ( not ( = ?AUTO_194 ?AUTO_197 ) ) ( not ( = ?AUTO_194 ?AUTO_196 ) ) ( not ( = ?AUTO_195 ?AUTO_197 ) ) ( not ( = ?AUTO_195 ?AUTO_196 ) ) ( not ( = ?AUTO_197 ?AUTO_196 ) ) ( ON ?AUTO_197 ?AUTO_194 ) ( CLEAR ?AUTO_197 ) ( HOLDING ?AUTO_195 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_195 )
      ( MAKE-ON ?AUTO_194 ?AUTO_195 )
      ( MAKE-ON-VERIFY ?AUTO_194 ?AUTO_195 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_200 - BLOCK
      ?AUTO_201 - BLOCK
    )
    :vars
    (
      ?AUTO_202 - BLOCK
      ?AUTO_203 - BLOCK
      ?AUTO_204 - BLOCK
      ?AUTO_205 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_201 ) ( not ( = ?AUTO_200 ?AUTO_201 ) ) ( ON-TABLE ?AUTO_200 ) ( CLEAR ?AUTO_202 ) ( not ( = ?AUTO_200 ?AUTO_203 ) ) ( not ( = ?AUTO_200 ?AUTO_202 ) ) ( not ( = ?AUTO_201 ?AUTO_203 ) ) ( not ( = ?AUTO_201 ?AUTO_202 ) ) ( not ( = ?AUTO_203 ?AUTO_202 ) ) ( ON ?AUTO_203 ?AUTO_200 ) ( CLEAR ?AUTO_203 ) ( HOLDING ?AUTO_204 ) ( CLEAR ?AUTO_205 ) ( not ( = ?AUTO_200 ?AUTO_204 ) ) ( not ( = ?AUTO_200 ?AUTO_205 ) ) ( not ( = ?AUTO_201 ?AUTO_204 ) ) ( not ( = ?AUTO_201 ?AUTO_205 ) ) ( not ( = ?AUTO_202 ?AUTO_204 ) ) ( not ( = ?AUTO_202 ?AUTO_205 ) ) ( not ( = ?AUTO_203 ?AUTO_204 ) ) ( not ( = ?AUTO_203 ?AUTO_205 ) ) ( not ( = ?AUTO_204 ?AUTO_205 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_204 ?AUTO_205 )
      ( MAKE-ON ?AUTO_200 ?AUTO_201 )
      ( MAKE-ON-VERIFY ?AUTO_200 ?AUTO_201 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_212 - BLOCK
      ?AUTO_213 - BLOCK
    )
    :vars
    (
      ?AUTO_215 - BLOCK
      ?AUTO_214 - BLOCK
      ?AUTO_216 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_213 ) ( not ( = ?AUTO_212 ?AUTO_213 ) ) ( ON-TABLE ?AUTO_212 ) ( CLEAR ?AUTO_215 ) ( not ( = ?AUTO_212 ?AUTO_214 ) ) ( not ( = ?AUTO_212 ?AUTO_215 ) ) ( not ( = ?AUTO_213 ?AUTO_214 ) ) ( not ( = ?AUTO_213 ?AUTO_215 ) ) ( not ( = ?AUTO_214 ?AUTO_215 ) ) ( ON ?AUTO_214 ?AUTO_212 ) ( CLEAR ?AUTO_214 ) ( HOLDING ?AUTO_216 ) ( not ( = ?AUTO_212 ?AUTO_216 ) ) ( not ( = ?AUTO_213 ?AUTO_216 ) ) ( not ( = ?AUTO_215 ?AUTO_216 ) ) ( not ( = ?AUTO_214 ?AUTO_216 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_216 )
      ( MAKE-ON ?AUTO_212 ?AUTO_213 )
      ( MAKE-ON-VERIFY ?AUTO_212 ?AUTO_213 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_219 - BLOCK
      ?AUTO_220 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_219 ) ( CLEAR ?AUTO_220 ) ( not ( = ?AUTO_219 ?AUTO_220 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_219 ?AUTO_220 )
      ( MAKE-ON-VERIFY ?AUTO_219 ?AUTO_220 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_221 - BLOCK
      ?AUTO_222 - BLOCK
    )
    :vars
    (
      ?AUTO_223 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_222 ) ( not ( = ?AUTO_221 ?AUTO_222 ) ) ( ON ?AUTO_221 ?AUTO_223 ) ( CLEAR ?AUTO_221 ) ( HAND-EMPTY ) ( not ( = ?AUTO_221 ?AUTO_223 ) ) ( not ( = ?AUTO_222 ?AUTO_223 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_221 ?AUTO_223 )
      ( MAKE-ON ?AUTO_221 ?AUTO_222 )
      ( MAKE-ON-VERIFY ?AUTO_221 ?AUTO_222 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_226 - BLOCK
      ?AUTO_227 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_226 ) ( CLEAR ?AUTO_227 ) ( not ( = ?AUTO_226 ?AUTO_227 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_226 ?AUTO_227 )
      ( MAKE-ON-VERIFY ?AUTO_226 ?AUTO_227 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_228 - BLOCK
      ?AUTO_229 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_229 ) ( not ( = ?AUTO_228 ?AUTO_229 ) ) ( ON-TABLE ?AUTO_228 ) ( CLEAR ?AUTO_228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_228 )
      ( MAKE-ON ?AUTO_228 ?AUTO_229 )
      ( MAKE-ON-VERIFY ?AUTO_228 ?AUTO_229 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_230 - BLOCK
      ?AUTO_231 - BLOCK
    )
    :vars
    (
      ?AUTO_232 - BLOCK
      ?AUTO_233 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_231 ) ( not ( = ?AUTO_230 ?AUTO_231 ) ) ( ON-TABLE ?AUTO_230 ) ( CLEAR ?AUTO_230 ) ( HOLDING ?AUTO_232 ) ( CLEAR ?AUTO_233 ) ( not ( = ?AUTO_230 ?AUTO_232 ) ) ( not ( = ?AUTO_230 ?AUTO_233 ) ) ( not ( = ?AUTO_231 ?AUTO_232 ) ) ( not ( = ?AUTO_231 ?AUTO_233 ) ) ( not ( = ?AUTO_232 ?AUTO_233 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_232 ?AUTO_233 )
      ( MAKE-ON ?AUTO_230 ?AUTO_231 )
      ( MAKE-ON-VERIFY ?AUTO_230 ?AUTO_231 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_234 - BLOCK
      ?AUTO_235 - BLOCK
    )
    :vars
    (
      ?AUTO_236 - BLOCK
      ?AUTO_237 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_234 ?AUTO_235 ) ) ( ON-TABLE ?AUTO_234 ) ( CLEAR ?AUTO_234 ) ( CLEAR ?AUTO_236 ) ( not ( = ?AUTO_234 ?AUTO_237 ) ) ( not ( = ?AUTO_234 ?AUTO_236 ) ) ( not ( = ?AUTO_235 ?AUTO_237 ) ) ( not ( = ?AUTO_235 ?AUTO_236 ) ) ( not ( = ?AUTO_237 ?AUTO_236 ) ) ( ON ?AUTO_237 ?AUTO_235 ) ( CLEAR ?AUTO_237 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_237 ?AUTO_235 )
      ( MAKE-ON ?AUTO_234 ?AUTO_235 )
      ( MAKE-ON-VERIFY ?AUTO_234 ?AUTO_235 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_239 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_239 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_239 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_239 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_240 - BLOCK
    )
    :vars
    (
      ?AUTO_241 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_240 ?AUTO_241 ) ( CLEAR ?AUTO_240 ) ( HAND-EMPTY ) ( not ( = ?AUTO_240 ?AUTO_241 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_240 ?AUTO_241 )
      ( MAKE-ON-TABLE ?AUTO_240 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_240 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_243 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_243 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_243 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_243 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_244 - BLOCK
    )
    :vars
    (
      ?AUTO_245 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_244 ?AUTO_245 ) ( CLEAR ?AUTO_244 ) ( HAND-EMPTY ) ( not ( = ?AUTO_244 ?AUTO_245 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_244 ?AUTO_245 )
      ( MAKE-ON-TABLE ?AUTO_244 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_244 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_246 - BLOCK
    )
    :vars
    (
      ?AUTO_247 - BLOCK
      ?AUTO_248 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_246 ?AUTO_247 ) ( CLEAR ?AUTO_246 ) ( not ( = ?AUTO_246 ?AUTO_247 ) ) ( HOLDING ?AUTO_248 ) ( not ( = ?AUTO_246 ?AUTO_248 ) ) ( not ( = ?AUTO_247 ?AUTO_248 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_248 )
      ( MAKE-ON-TABLE ?AUTO_246 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_246 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_251 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_251 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_251 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_251 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_252 - BLOCK
    )
    :vars
    (
      ?AUTO_253 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_252 ?AUTO_253 ) ( CLEAR ?AUTO_252 ) ( HAND-EMPTY ) ( not ( = ?AUTO_252 ?AUTO_253 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_252 ?AUTO_253 )
      ( MAKE-ON-TABLE ?AUTO_252 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_252 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_254 - BLOCK
    )
    :vars
    (
      ?AUTO_255 - BLOCK
      ?AUTO_256 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_254 ?AUTO_255 ) ( CLEAR ?AUTO_254 ) ( not ( = ?AUTO_254 ?AUTO_255 ) ) ( HOLDING ?AUTO_256 ) ( not ( = ?AUTO_254 ?AUTO_256 ) ) ( not ( = ?AUTO_255 ?AUTO_256 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_256 )
      ( MAKE-ON-TABLE ?AUTO_254 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_254 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_257 - BLOCK
    )
    :vars
    (
      ?AUTO_259 - BLOCK
      ?AUTO_258 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_257 ?AUTO_259 ) ( not ( = ?AUTO_257 ?AUTO_259 ) ) ( not ( = ?AUTO_257 ?AUTO_258 ) ) ( not ( = ?AUTO_259 ?AUTO_258 ) ) ( ON ?AUTO_258 ?AUTO_257 ) ( CLEAR ?AUTO_258 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_258 ?AUTO_257 )
      ( MAKE-ON-TABLE ?AUTO_257 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_257 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_260 - BLOCK
    )
    :vars
    (
      ?AUTO_262 - BLOCK
      ?AUTO_261 - BLOCK
      ?AUTO_263 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_260 ?AUTO_262 ) ( not ( = ?AUTO_260 ?AUTO_262 ) ) ( not ( = ?AUTO_260 ?AUTO_261 ) ) ( not ( = ?AUTO_262 ?AUTO_261 ) ) ( ON ?AUTO_261 ?AUTO_260 ) ( CLEAR ?AUTO_261 ) ( HOLDING ?AUTO_263 ) ( not ( = ?AUTO_260 ?AUTO_263 ) ) ( not ( = ?AUTO_262 ?AUTO_263 ) ) ( not ( = ?AUTO_261 ?AUTO_263 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_263 )
      ( MAKE-ON-TABLE ?AUTO_260 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_260 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_267 - BLOCK
      ?AUTO_268 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_267 ) ( CLEAR ?AUTO_268 ) ( not ( = ?AUTO_267 ?AUTO_268 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_267 ?AUTO_268 )
      ( MAKE-ON-VERIFY ?AUTO_267 ?AUTO_268 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_269 - BLOCK
      ?AUTO_270 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_270 ) ( not ( = ?AUTO_269 ?AUTO_270 ) ) ( ON-TABLE ?AUTO_269 ) ( CLEAR ?AUTO_269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_269 )
      ( MAKE-ON ?AUTO_269 ?AUTO_270 )
      ( MAKE-ON-VERIFY ?AUTO_269 ?AUTO_270 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_271 - BLOCK
      ?AUTO_272 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_271 ?AUTO_272 ) ) ( ON-TABLE ?AUTO_271 ) ( CLEAR ?AUTO_271 ) ( HOLDING ?AUTO_272 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_272 )
      ( MAKE-ON ?AUTO_271 ?AUTO_272 )
      ( MAKE-ON-VERIFY ?AUTO_271 ?AUTO_272 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_275 - BLOCK
      ?AUTO_276 - BLOCK
    )
    :vars
    (
      ?AUTO_277 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_276 ) ( not ( = ?AUTO_275 ?AUTO_276 ) ) ( ON-TABLE ?AUTO_275 ) ( CLEAR ?AUTO_275 ) ( HOLDING ?AUTO_277 ) ( not ( = ?AUTO_275 ?AUTO_277 ) ) ( not ( = ?AUTO_276 ?AUTO_277 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_277 )
      ( MAKE-ON ?AUTO_275 ?AUTO_276 )
      ( MAKE-ON-VERIFY ?AUTO_275 ?AUTO_276 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_278 - BLOCK
      ?AUTO_279 - BLOCK
    )
    :vars
    (
      ?AUTO_280 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_278 ?AUTO_279 ) ) ( ON-TABLE ?AUTO_278 ) ( CLEAR ?AUTO_278 ) ( not ( = ?AUTO_278 ?AUTO_280 ) ) ( not ( = ?AUTO_279 ?AUTO_280 ) ) ( ON ?AUTO_280 ?AUTO_279 ) ( CLEAR ?AUTO_280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_280 ?AUTO_279 )
      ( MAKE-ON ?AUTO_278 ?AUTO_279 )
      ( MAKE-ON-VERIFY ?AUTO_278 ?AUTO_279 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_281 - BLOCK
      ?AUTO_282 - BLOCK
    )
    :vars
    (
      ?AUTO_283 - BLOCK
      ?AUTO_284 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_281 ?AUTO_282 ) ) ( ON-TABLE ?AUTO_281 ) ( CLEAR ?AUTO_281 ) ( not ( = ?AUTO_281 ?AUTO_283 ) ) ( not ( = ?AUTO_282 ?AUTO_283 ) ) ( ON ?AUTO_283 ?AUTO_282 ) ( CLEAR ?AUTO_283 ) ( HOLDING ?AUTO_284 ) ( not ( = ?AUTO_281 ?AUTO_284 ) ) ( not ( = ?AUTO_282 ?AUTO_284 ) ) ( not ( = ?AUTO_283 ?AUTO_284 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_284 )
      ( MAKE-ON ?AUTO_281 ?AUTO_282 )
      ( MAKE-ON-VERIFY ?AUTO_281 ?AUTO_282 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_289 - BLOCK
      ?AUTO_290 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_289 ) ( CLEAR ?AUTO_290 ) ( not ( = ?AUTO_289 ?AUTO_290 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_289 ?AUTO_290 )
      ( MAKE-ON-VERIFY ?AUTO_289 ?AUTO_290 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_291 - BLOCK
      ?AUTO_292 - BLOCK
    )
    :vars
    (
      ?AUTO_293 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_292 ) ( not ( = ?AUTO_291 ?AUTO_292 ) ) ( ON ?AUTO_291 ?AUTO_293 ) ( CLEAR ?AUTO_291 ) ( HAND-EMPTY ) ( not ( = ?AUTO_291 ?AUTO_293 ) ) ( not ( = ?AUTO_292 ?AUTO_293 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_291 ?AUTO_293 )
      ( MAKE-ON ?AUTO_291 ?AUTO_292 )
      ( MAKE-ON-VERIFY ?AUTO_291 ?AUTO_292 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_294 - BLOCK
      ?AUTO_295 - BLOCK
    )
    :vars
    (
      ?AUTO_296 - BLOCK
      ?AUTO_297 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_294 ?AUTO_295 ) ) ( ON ?AUTO_294 ?AUTO_296 ) ( CLEAR ?AUTO_294 ) ( not ( = ?AUTO_294 ?AUTO_296 ) ) ( not ( = ?AUTO_295 ?AUTO_296 ) ) ( HOLDING ?AUTO_295 ) ( CLEAR ?AUTO_297 ) ( not ( = ?AUTO_294 ?AUTO_297 ) ) ( not ( = ?AUTO_295 ?AUTO_297 ) ) ( not ( = ?AUTO_296 ?AUTO_297 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_295 ?AUTO_297 )
      ( MAKE-ON ?AUTO_294 ?AUTO_295 )
      ( MAKE-ON-VERIFY ?AUTO_294 ?AUTO_295 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_300 - BLOCK
      ?AUTO_301 - BLOCK
    )
    :vars
    (
      ?AUTO_302 - BLOCK
      ?AUTO_303 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_301 ) ( not ( = ?AUTO_300 ?AUTO_301 ) ) ( ON ?AUTO_300 ?AUTO_302 ) ( CLEAR ?AUTO_300 ) ( not ( = ?AUTO_300 ?AUTO_302 ) ) ( not ( = ?AUTO_301 ?AUTO_302 ) ) ( HOLDING ?AUTO_303 ) ( not ( = ?AUTO_300 ?AUTO_303 ) ) ( not ( = ?AUTO_301 ?AUTO_303 ) ) ( not ( = ?AUTO_302 ?AUTO_303 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_303 )
      ( MAKE-ON ?AUTO_300 ?AUTO_301 )
      ( MAKE-ON-VERIFY ?AUTO_300 ?AUTO_301 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_304 - BLOCK
      ?AUTO_305 - BLOCK
    )
    :vars
    (
      ?AUTO_306 - BLOCK
      ?AUTO_307 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_305 ) ( not ( = ?AUTO_304 ?AUTO_305 ) ) ( ON ?AUTO_304 ?AUTO_306 ) ( not ( = ?AUTO_304 ?AUTO_306 ) ) ( not ( = ?AUTO_305 ?AUTO_306 ) ) ( not ( = ?AUTO_304 ?AUTO_307 ) ) ( not ( = ?AUTO_305 ?AUTO_307 ) ) ( not ( = ?AUTO_306 ?AUTO_307 ) ) ( ON ?AUTO_307 ?AUTO_304 ) ( CLEAR ?AUTO_307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_307 ?AUTO_304 )
      ( MAKE-ON ?AUTO_304 ?AUTO_305 )
      ( MAKE-ON-VERIFY ?AUTO_304 ?AUTO_305 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_308 - BLOCK
      ?AUTO_309 - BLOCK
    )
    :vars
    (
      ?AUTO_311 - BLOCK
      ?AUTO_310 - BLOCK
      ?AUTO_312 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_309 ) ( not ( = ?AUTO_308 ?AUTO_309 ) ) ( ON ?AUTO_308 ?AUTO_311 ) ( not ( = ?AUTO_308 ?AUTO_311 ) ) ( not ( = ?AUTO_309 ?AUTO_311 ) ) ( not ( = ?AUTO_308 ?AUTO_310 ) ) ( not ( = ?AUTO_309 ?AUTO_310 ) ) ( not ( = ?AUTO_311 ?AUTO_310 ) ) ( ON ?AUTO_310 ?AUTO_308 ) ( CLEAR ?AUTO_310 ) ( HOLDING ?AUTO_312 ) ( not ( = ?AUTO_308 ?AUTO_312 ) ) ( not ( = ?AUTO_309 ?AUTO_312 ) ) ( not ( = ?AUTO_311 ?AUTO_312 ) ) ( not ( = ?AUTO_310 ?AUTO_312 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_312 )
      ( MAKE-ON ?AUTO_308 ?AUTO_309 )
      ( MAKE-ON-VERIFY ?AUTO_308 ?AUTO_309 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_313 - BLOCK
      ?AUTO_314 - BLOCK
    )
    :vars
    (
      ?AUTO_316 - BLOCK
      ?AUTO_315 - BLOCK
      ?AUTO_317 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_314 ) ( not ( = ?AUTO_313 ?AUTO_314 ) ) ( ON ?AUTO_313 ?AUTO_316 ) ( not ( = ?AUTO_313 ?AUTO_316 ) ) ( not ( = ?AUTO_314 ?AUTO_316 ) ) ( not ( = ?AUTO_313 ?AUTO_315 ) ) ( not ( = ?AUTO_314 ?AUTO_315 ) ) ( not ( = ?AUTO_316 ?AUTO_315 ) ) ( ON ?AUTO_315 ?AUTO_313 ) ( not ( = ?AUTO_313 ?AUTO_317 ) ) ( not ( = ?AUTO_314 ?AUTO_317 ) ) ( not ( = ?AUTO_316 ?AUTO_317 ) ) ( not ( = ?AUTO_315 ?AUTO_317 ) ) ( ON ?AUTO_317 ?AUTO_315 ) ( CLEAR ?AUTO_317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_317 ?AUTO_315 )
      ( MAKE-ON ?AUTO_313 ?AUTO_314 )
      ( MAKE-ON-VERIFY ?AUTO_313 ?AUTO_314 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_318 - BLOCK
      ?AUTO_319 - BLOCK
    )
    :vars
    (
      ?AUTO_321 - BLOCK
      ?AUTO_320 - BLOCK
      ?AUTO_322 - BLOCK
      ?AUTO_323 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_319 ) ( not ( = ?AUTO_318 ?AUTO_319 ) ) ( ON ?AUTO_318 ?AUTO_321 ) ( not ( = ?AUTO_318 ?AUTO_321 ) ) ( not ( = ?AUTO_319 ?AUTO_321 ) ) ( not ( = ?AUTO_318 ?AUTO_320 ) ) ( not ( = ?AUTO_319 ?AUTO_320 ) ) ( not ( = ?AUTO_321 ?AUTO_320 ) ) ( ON ?AUTO_320 ?AUTO_318 ) ( not ( = ?AUTO_318 ?AUTO_322 ) ) ( not ( = ?AUTO_319 ?AUTO_322 ) ) ( not ( = ?AUTO_321 ?AUTO_322 ) ) ( not ( = ?AUTO_320 ?AUTO_322 ) ) ( ON ?AUTO_322 ?AUTO_320 ) ( CLEAR ?AUTO_322 ) ( HOLDING ?AUTO_323 ) ( not ( = ?AUTO_318 ?AUTO_323 ) ) ( not ( = ?AUTO_319 ?AUTO_323 ) ) ( not ( = ?AUTO_321 ?AUTO_323 ) ) ( not ( = ?AUTO_320 ?AUTO_323 ) ) ( not ( = ?AUTO_322 ?AUTO_323 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_323 )
      ( MAKE-ON ?AUTO_318 ?AUTO_319 )
      ( MAKE-ON-VERIFY ?AUTO_318 ?AUTO_319 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_328 - BLOCK
      ?AUTO_329 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_328 ) ( CLEAR ?AUTO_329 ) ( not ( = ?AUTO_328 ?AUTO_329 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_328 ?AUTO_329 )
      ( MAKE-ON-VERIFY ?AUTO_328 ?AUTO_329 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_330 - BLOCK
      ?AUTO_331 - BLOCK
    )
    :vars
    (
      ?AUTO_332 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_331 ) ( not ( = ?AUTO_330 ?AUTO_331 ) ) ( ON ?AUTO_330 ?AUTO_332 ) ( CLEAR ?AUTO_330 ) ( HAND-EMPTY ) ( not ( = ?AUTO_330 ?AUTO_332 ) ) ( not ( = ?AUTO_331 ?AUTO_332 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_330 ?AUTO_332 )
      ( MAKE-ON ?AUTO_330 ?AUTO_331 )
      ( MAKE-ON-VERIFY ?AUTO_330 ?AUTO_331 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_333 - BLOCK
      ?AUTO_334 - BLOCK
    )
    :vars
    (
      ?AUTO_335 - BLOCK
      ?AUTO_336 - BLOCK
      ?AUTO_337 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_334 ) ( not ( = ?AUTO_333 ?AUTO_334 ) ) ( ON ?AUTO_333 ?AUTO_335 ) ( CLEAR ?AUTO_333 ) ( not ( = ?AUTO_333 ?AUTO_335 ) ) ( not ( = ?AUTO_334 ?AUTO_335 ) ) ( HOLDING ?AUTO_336 ) ( CLEAR ?AUTO_337 ) ( not ( = ?AUTO_333 ?AUTO_336 ) ) ( not ( = ?AUTO_333 ?AUTO_337 ) ) ( not ( = ?AUTO_334 ?AUTO_336 ) ) ( not ( = ?AUTO_334 ?AUTO_337 ) ) ( not ( = ?AUTO_335 ?AUTO_336 ) ) ( not ( = ?AUTO_335 ?AUTO_337 ) ) ( not ( = ?AUTO_336 ?AUTO_337 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_336 ?AUTO_337 )
      ( MAKE-ON ?AUTO_333 ?AUTO_334 )
      ( MAKE-ON-VERIFY ?AUTO_333 ?AUTO_334 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_338 - BLOCK
      ?AUTO_339 - BLOCK
    )
    :vars
    (
      ?AUTO_340 - BLOCK
      ?AUTO_341 - BLOCK
      ?AUTO_342 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_339 ) ( not ( = ?AUTO_338 ?AUTO_339 ) ) ( ON ?AUTO_338 ?AUTO_340 ) ( not ( = ?AUTO_338 ?AUTO_340 ) ) ( not ( = ?AUTO_339 ?AUTO_340 ) ) ( CLEAR ?AUTO_341 ) ( not ( = ?AUTO_338 ?AUTO_342 ) ) ( not ( = ?AUTO_338 ?AUTO_341 ) ) ( not ( = ?AUTO_339 ?AUTO_342 ) ) ( not ( = ?AUTO_339 ?AUTO_341 ) ) ( not ( = ?AUTO_340 ?AUTO_342 ) ) ( not ( = ?AUTO_340 ?AUTO_341 ) ) ( not ( = ?AUTO_342 ?AUTO_341 ) ) ( ON ?AUTO_342 ?AUTO_338 ) ( CLEAR ?AUTO_342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_342 ?AUTO_338 )
      ( MAKE-ON ?AUTO_338 ?AUTO_339 )
      ( MAKE-ON-VERIFY ?AUTO_338 ?AUTO_339 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_343 - BLOCK
      ?AUTO_344 - BLOCK
    )
    :vars
    (
      ?AUTO_346 - BLOCK
      ?AUTO_347 - BLOCK
      ?AUTO_345 - BLOCK
      ?AUTO_348 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_344 ) ( not ( = ?AUTO_343 ?AUTO_344 ) ) ( ON ?AUTO_343 ?AUTO_346 ) ( not ( = ?AUTO_343 ?AUTO_346 ) ) ( not ( = ?AUTO_344 ?AUTO_346 ) ) ( not ( = ?AUTO_343 ?AUTO_347 ) ) ( not ( = ?AUTO_343 ?AUTO_345 ) ) ( not ( = ?AUTO_344 ?AUTO_347 ) ) ( not ( = ?AUTO_344 ?AUTO_345 ) ) ( not ( = ?AUTO_346 ?AUTO_347 ) ) ( not ( = ?AUTO_346 ?AUTO_345 ) ) ( not ( = ?AUTO_347 ?AUTO_345 ) ) ( ON ?AUTO_347 ?AUTO_343 ) ( CLEAR ?AUTO_347 ) ( HOLDING ?AUTO_345 ) ( CLEAR ?AUTO_348 ) ( not ( = ?AUTO_343 ?AUTO_348 ) ) ( not ( = ?AUTO_344 ?AUTO_348 ) ) ( not ( = ?AUTO_346 ?AUTO_348 ) ) ( not ( = ?AUTO_347 ?AUTO_348 ) ) ( not ( = ?AUTO_345 ?AUTO_348 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_345 ?AUTO_348 )
      ( MAKE-ON ?AUTO_343 ?AUTO_344 )
      ( MAKE-ON-VERIFY ?AUTO_343 ?AUTO_344 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_353 - BLOCK
      ?AUTO_354 - BLOCK
    )
    :vars
    (
      ?AUTO_355 - BLOCK
      ?AUTO_357 - BLOCK
      ?AUTO_358 - BLOCK
      ?AUTO_356 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_354 ) ( not ( = ?AUTO_353 ?AUTO_354 ) ) ( ON ?AUTO_353 ?AUTO_355 ) ( not ( = ?AUTO_353 ?AUTO_355 ) ) ( not ( = ?AUTO_354 ?AUTO_355 ) ) ( not ( = ?AUTO_353 ?AUTO_357 ) ) ( not ( = ?AUTO_353 ?AUTO_358 ) ) ( not ( = ?AUTO_354 ?AUTO_357 ) ) ( not ( = ?AUTO_354 ?AUTO_358 ) ) ( not ( = ?AUTO_355 ?AUTO_357 ) ) ( not ( = ?AUTO_355 ?AUTO_358 ) ) ( not ( = ?AUTO_357 ?AUTO_358 ) ) ( ON ?AUTO_357 ?AUTO_353 ) ( CLEAR ?AUTO_356 ) ( not ( = ?AUTO_353 ?AUTO_356 ) ) ( not ( = ?AUTO_354 ?AUTO_356 ) ) ( not ( = ?AUTO_355 ?AUTO_356 ) ) ( not ( = ?AUTO_357 ?AUTO_356 ) ) ( not ( = ?AUTO_358 ?AUTO_356 ) ) ( ON ?AUTO_358 ?AUTO_357 ) ( CLEAR ?AUTO_358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_358 ?AUTO_357 )
      ( MAKE-ON ?AUTO_353 ?AUTO_354 )
      ( MAKE-ON-VERIFY ?AUTO_353 ?AUTO_354 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_359 - BLOCK
      ?AUTO_360 - BLOCK
    )
    :vars
    (
      ?AUTO_363 - BLOCK
      ?AUTO_361 - BLOCK
      ?AUTO_362 - BLOCK
      ?AUTO_364 - BLOCK
      ?AUTO_365 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_360 ) ( not ( = ?AUTO_359 ?AUTO_360 ) ) ( ON ?AUTO_359 ?AUTO_363 ) ( not ( = ?AUTO_359 ?AUTO_363 ) ) ( not ( = ?AUTO_360 ?AUTO_363 ) ) ( not ( = ?AUTO_359 ?AUTO_361 ) ) ( not ( = ?AUTO_359 ?AUTO_362 ) ) ( not ( = ?AUTO_360 ?AUTO_361 ) ) ( not ( = ?AUTO_360 ?AUTO_362 ) ) ( not ( = ?AUTO_363 ?AUTO_361 ) ) ( not ( = ?AUTO_363 ?AUTO_362 ) ) ( not ( = ?AUTO_361 ?AUTO_362 ) ) ( ON ?AUTO_361 ?AUTO_359 ) ( CLEAR ?AUTO_364 ) ( not ( = ?AUTO_359 ?AUTO_364 ) ) ( not ( = ?AUTO_360 ?AUTO_364 ) ) ( not ( = ?AUTO_363 ?AUTO_364 ) ) ( not ( = ?AUTO_361 ?AUTO_364 ) ) ( not ( = ?AUTO_362 ?AUTO_364 ) ) ( ON ?AUTO_362 ?AUTO_361 ) ( CLEAR ?AUTO_362 ) ( HOLDING ?AUTO_365 ) ( not ( = ?AUTO_359 ?AUTO_365 ) ) ( not ( = ?AUTO_360 ?AUTO_365 ) ) ( not ( = ?AUTO_363 ?AUTO_365 ) ) ( not ( = ?AUTO_361 ?AUTO_365 ) ) ( not ( = ?AUTO_362 ?AUTO_365 ) ) ( not ( = ?AUTO_364 ?AUTO_365 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_365 )
      ( MAKE-ON ?AUTO_359 ?AUTO_360 )
      ( MAKE-ON-VERIFY ?AUTO_359 ?AUTO_360 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_366 - BLOCK
      ?AUTO_367 - BLOCK
    )
    :vars
    (
      ?AUTO_368 - BLOCK
      ?AUTO_369 - BLOCK
      ?AUTO_370 - BLOCK
      ?AUTO_371 - BLOCK
      ?AUTO_372 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_367 ) ( not ( = ?AUTO_366 ?AUTO_367 ) ) ( ON ?AUTO_366 ?AUTO_368 ) ( not ( = ?AUTO_366 ?AUTO_368 ) ) ( not ( = ?AUTO_367 ?AUTO_368 ) ) ( not ( = ?AUTO_366 ?AUTO_369 ) ) ( not ( = ?AUTO_366 ?AUTO_370 ) ) ( not ( = ?AUTO_367 ?AUTO_369 ) ) ( not ( = ?AUTO_367 ?AUTO_370 ) ) ( not ( = ?AUTO_368 ?AUTO_369 ) ) ( not ( = ?AUTO_368 ?AUTO_370 ) ) ( not ( = ?AUTO_369 ?AUTO_370 ) ) ( ON ?AUTO_369 ?AUTO_366 ) ( CLEAR ?AUTO_371 ) ( not ( = ?AUTO_366 ?AUTO_371 ) ) ( not ( = ?AUTO_367 ?AUTO_371 ) ) ( not ( = ?AUTO_368 ?AUTO_371 ) ) ( not ( = ?AUTO_369 ?AUTO_371 ) ) ( not ( = ?AUTO_370 ?AUTO_371 ) ) ( ON ?AUTO_370 ?AUTO_369 ) ( not ( = ?AUTO_366 ?AUTO_372 ) ) ( not ( = ?AUTO_367 ?AUTO_372 ) ) ( not ( = ?AUTO_368 ?AUTO_372 ) ) ( not ( = ?AUTO_369 ?AUTO_372 ) ) ( not ( = ?AUTO_370 ?AUTO_372 ) ) ( not ( = ?AUTO_371 ?AUTO_372 ) ) ( ON ?AUTO_372 ?AUTO_370 ) ( CLEAR ?AUTO_372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_372 ?AUTO_370 )
      ( MAKE-ON ?AUTO_366 ?AUTO_367 )
      ( MAKE-ON-VERIFY ?AUTO_366 ?AUTO_367 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_373 - BLOCK
      ?AUTO_374 - BLOCK
    )
    :vars
    (
      ?AUTO_375 - BLOCK
      ?AUTO_376 - BLOCK
      ?AUTO_379 - BLOCK
      ?AUTO_378 - BLOCK
      ?AUTO_377 - BLOCK
      ?AUTO_380 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_374 ) ( not ( = ?AUTO_373 ?AUTO_374 ) ) ( ON ?AUTO_373 ?AUTO_375 ) ( not ( = ?AUTO_373 ?AUTO_375 ) ) ( not ( = ?AUTO_374 ?AUTO_375 ) ) ( not ( = ?AUTO_373 ?AUTO_376 ) ) ( not ( = ?AUTO_373 ?AUTO_379 ) ) ( not ( = ?AUTO_374 ?AUTO_376 ) ) ( not ( = ?AUTO_374 ?AUTO_379 ) ) ( not ( = ?AUTO_375 ?AUTO_376 ) ) ( not ( = ?AUTO_375 ?AUTO_379 ) ) ( not ( = ?AUTO_376 ?AUTO_379 ) ) ( ON ?AUTO_376 ?AUTO_373 ) ( CLEAR ?AUTO_378 ) ( not ( = ?AUTO_373 ?AUTO_378 ) ) ( not ( = ?AUTO_374 ?AUTO_378 ) ) ( not ( = ?AUTO_375 ?AUTO_378 ) ) ( not ( = ?AUTO_376 ?AUTO_378 ) ) ( not ( = ?AUTO_379 ?AUTO_378 ) ) ( ON ?AUTO_379 ?AUTO_376 ) ( not ( = ?AUTO_373 ?AUTO_377 ) ) ( not ( = ?AUTO_374 ?AUTO_377 ) ) ( not ( = ?AUTO_375 ?AUTO_377 ) ) ( not ( = ?AUTO_376 ?AUTO_377 ) ) ( not ( = ?AUTO_379 ?AUTO_377 ) ) ( not ( = ?AUTO_378 ?AUTO_377 ) ) ( ON ?AUTO_377 ?AUTO_379 ) ( CLEAR ?AUTO_377 ) ( HOLDING ?AUTO_380 ) ( not ( = ?AUTO_373 ?AUTO_380 ) ) ( not ( = ?AUTO_374 ?AUTO_380 ) ) ( not ( = ?AUTO_375 ?AUTO_380 ) ) ( not ( = ?AUTO_376 ?AUTO_380 ) ) ( not ( = ?AUTO_379 ?AUTO_380 ) ) ( not ( = ?AUTO_378 ?AUTO_380 ) ) ( not ( = ?AUTO_377 ?AUTO_380 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_380 )
      ( MAKE-ON ?AUTO_373 ?AUTO_374 )
      ( MAKE-ON-VERIFY ?AUTO_373 ?AUTO_374 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_381 - BLOCK
      ?AUTO_382 - BLOCK
    )
    :vars
    (
      ?AUTO_387 - BLOCK
      ?AUTO_383 - BLOCK
      ?AUTO_386 - BLOCK
      ?AUTO_388 - BLOCK
      ?AUTO_385 - BLOCK
      ?AUTO_384 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_381 ?AUTO_382 ) ) ( ON ?AUTO_381 ?AUTO_387 ) ( not ( = ?AUTO_381 ?AUTO_387 ) ) ( not ( = ?AUTO_382 ?AUTO_387 ) ) ( not ( = ?AUTO_381 ?AUTO_383 ) ) ( not ( = ?AUTO_381 ?AUTO_386 ) ) ( not ( = ?AUTO_382 ?AUTO_383 ) ) ( not ( = ?AUTO_382 ?AUTO_386 ) ) ( not ( = ?AUTO_387 ?AUTO_383 ) ) ( not ( = ?AUTO_387 ?AUTO_386 ) ) ( not ( = ?AUTO_383 ?AUTO_386 ) ) ( ON ?AUTO_383 ?AUTO_381 ) ( CLEAR ?AUTO_388 ) ( not ( = ?AUTO_381 ?AUTO_388 ) ) ( not ( = ?AUTO_382 ?AUTO_388 ) ) ( not ( = ?AUTO_387 ?AUTO_388 ) ) ( not ( = ?AUTO_383 ?AUTO_388 ) ) ( not ( = ?AUTO_386 ?AUTO_388 ) ) ( ON ?AUTO_386 ?AUTO_383 ) ( not ( = ?AUTO_381 ?AUTO_385 ) ) ( not ( = ?AUTO_382 ?AUTO_385 ) ) ( not ( = ?AUTO_387 ?AUTO_385 ) ) ( not ( = ?AUTO_383 ?AUTO_385 ) ) ( not ( = ?AUTO_386 ?AUTO_385 ) ) ( not ( = ?AUTO_388 ?AUTO_385 ) ) ( ON ?AUTO_385 ?AUTO_386 ) ( CLEAR ?AUTO_385 ) ( not ( = ?AUTO_381 ?AUTO_384 ) ) ( not ( = ?AUTO_382 ?AUTO_384 ) ) ( not ( = ?AUTO_387 ?AUTO_384 ) ) ( not ( = ?AUTO_383 ?AUTO_384 ) ) ( not ( = ?AUTO_386 ?AUTO_384 ) ) ( not ( = ?AUTO_388 ?AUTO_384 ) ) ( not ( = ?AUTO_385 ?AUTO_384 ) ) ( ON ?AUTO_384 ?AUTO_382 ) ( CLEAR ?AUTO_384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_384 ?AUTO_382 )
      ( MAKE-ON ?AUTO_381 ?AUTO_382 )
      ( MAKE-ON-VERIFY ?AUTO_381 ?AUTO_382 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_391 - BLOCK
      ?AUTO_392 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_391 ) ( CLEAR ?AUTO_392 ) ( not ( = ?AUTO_391 ?AUTO_392 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_391 ?AUTO_392 )
      ( MAKE-ON-VERIFY ?AUTO_391 ?AUTO_392 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_393 - BLOCK
      ?AUTO_394 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_394 ) ( not ( = ?AUTO_393 ?AUTO_394 ) ) ( ON-TABLE ?AUTO_393 ) ( CLEAR ?AUTO_393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_393 )
      ( MAKE-ON ?AUTO_393 ?AUTO_394 )
      ( MAKE-ON-VERIFY ?AUTO_393 ?AUTO_394 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_395 - BLOCK
      ?AUTO_396 - BLOCK
    )
    :vars
    (
      ?AUTO_397 - BLOCK
      ?AUTO_398 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_396 ) ( not ( = ?AUTO_395 ?AUTO_396 ) ) ( ON-TABLE ?AUTO_395 ) ( CLEAR ?AUTO_395 ) ( HOLDING ?AUTO_397 ) ( CLEAR ?AUTO_398 ) ( not ( = ?AUTO_395 ?AUTO_397 ) ) ( not ( = ?AUTO_395 ?AUTO_398 ) ) ( not ( = ?AUTO_396 ?AUTO_397 ) ) ( not ( = ?AUTO_396 ?AUTO_398 ) ) ( not ( = ?AUTO_397 ?AUTO_398 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_397 ?AUTO_398 )
      ( MAKE-ON ?AUTO_395 ?AUTO_396 )
      ( MAKE-ON-VERIFY ?AUTO_395 ?AUTO_396 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_399 - BLOCK
      ?AUTO_400 - BLOCK
    )
    :vars
    (
      ?AUTO_401 - BLOCK
      ?AUTO_402 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_400 ) ( not ( = ?AUTO_399 ?AUTO_400 ) ) ( ON-TABLE ?AUTO_399 ) ( CLEAR ?AUTO_401 ) ( not ( = ?AUTO_399 ?AUTO_402 ) ) ( not ( = ?AUTO_399 ?AUTO_401 ) ) ( not ( = ?AUTO_400 ?AUTO_402 ) ) ( not ( = ?AUTO_400 ?AUTO_401 ) ) ( not ( = ?AUTO_402 ?AUTO_401 ) ) ( ON ?AUTO_402 ?AUTO_399 ) ( CLEAR ?AUTO_402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_402 ?AUTO_399 )
      ( MAKE-ON ?AUTO_399 ?AUTO_400 )
      ( MAKE-ON-VERIFY ?AUTO_399 ?AUTO_400 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_403 - BLOCK
      ?AUTO_404 - BLOCK
    )
    :vars
    (
      ?AUTO_406 - BLOCK
      ?AUTO_405 - BLOCK
      ?AUTO_407 - BLOCK
      ?AUTO_408 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_404 ) ( not ( = ?AUTO_403 ?AUTO_404 ) ) ( ON-TABLE ?AUTO_403 ) ( CLEAR ?AUTO_406 ) ( not ( = ?AUTO_403 ?AUTO_405 ) ) ( not ( = ?AUTO_403 ?AUTO_406 ) ) ( not ( = ?AUTO_404 ?AUTO_405 ) ) ( not ( = ?AUTO_404 ?AUTO_406 ) ) ( not ( = ?AUTO_405 ?AUTO_406 ) ) ( ON ?AUTO_405 ?AUTO_403 ) ( CLEAR ?AUTO_405 ) ( HOLDING ?AUTO_407 ) ( CLEAR ?AUTO_408 ) ( not ( = ?AUTO_403 ?AUTO_407 ) ) ( not ( = ?AUTO_403 ?AUTO_408 ) ) ( not ( = ?AUTO_404 ?AUTO_407 ) ) ( not ( = ?AUTO_404 ?AUTO_408 ) ) ( not ( = ?AUTO_406 ?AUTO_407 ) ) ( not ( = ?AUTO_406 ?AUTO_408 ) ) ( not ( = ?AUTO_405 ?AUTO_407 ) ) ( not ( = ?AUTO_405 ?AUTO_408 ) ) ( not ( = ?AUTO_407 ?AUTO_408 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_407 ?AUTO_408 )
      ( MAKE-ON ?AUTO_403 ?AUTO_404 )
      ( MAKE-ON-VERIFY ?AUTO_403 ?AUTO_404 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_409 - BLOCK
      ?AUTO_410 - BLOCK
    )
    :vars
    (
      ?AUTO_411 - BLOCK
      ?AUTO_412 - BLOCK
      ?AUTO_414 - BLOCK
      ?AUTO_413 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_410 ) ( not ( = ?AUTO_409 ?AUTO_410 ) ) ( ON-TABLE ?AUTO_409 ) ( CLEAR ?AUTO_411 ) ( not ( = ?AUTO_409 ?AUTO_412 ) ) ( not ( = ?AUTO_409 ?AUTO_411 ) ) ( not ( = ?AUTO_410 ?AUTO_412 ) ) ( not ( = ?AUTO_410 ?AUTO_411 ) ) ( not ( = ?AUTO_412 ?AUTO_411 ) ) ( ON ?AUTO_412 ?AUTO_409 ) ( CLEAR ?AUTO_414 ) ( not ( = ?AUTO_409 ?AUTO_413 ) ) ( not ( = ?AUTO_409 ?AUTO_414 ) ) ( not ( = ?AUTO_410 ?AUTO_413 ) ) ( not ( = ?AUTO_410 ?AUTO_414 ) ) ( not ( = ?AUTO_411 ?AUTO_413 ) ) ( not ( = ?AUTO_411 ?AUTO_414 ) ) ( not ( = ?AUTO_412 ?AUTO_413 ) ) ( not ( = ?AUTO_412 ?AUTO_414 ) ) ( not ( = ?AUTO_413 ?AUTO_414 ) ) ( ON ?AUTO_413 ?AUTO_412 ) ( CLEAR ?AUTO_413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_413 ?AUTO_412 )
      ( MAKE-ON ?AUTO_409 ?AUTO_410 )
      ( MAKE-ON-VERIFY ?AUTO_409 ?AUTO_410 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_415 - BLOCK
      ?AUTO_416 - BLOCK
    )
    :vars
    (
      ?AUTO_417 - BLOCK
      ?AUTO_418 - BLOCK
      ?AUTO_420 - BLOCK
      ?AUTO_419 - BLOCK
      ?AUTO_421 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_416 ) ( not ( = ?AUTO_415 ?AUTO_416 ) ) ( ON-TABLE ?AUTO_415 ) ( CLEAR ?AUTO_417 ) ( not ( = ?AUTO_415 ?AUTO_418 ) ) ( not ( = ?AUTO_415 ?AUTO_417 ) ) ( not ( = ?AUTO_416 ?AUTO_418 ) ) ( not ( = ?AUTO_416 ?AUTO_417 ) ) ( not ( = ?AUTO_418 ?AUTO_417 ) ) ( ON ?AUTO_418 ?AUTO_415 ) ( not ( = ?AUTO_415 ?AUTO_420 ) ) ( not ( = ?AUTO_415 ?AUTO_419 ) ) ( not ( = ?AUTO_416 ?AUTO_420 ) ) ( not ( = ?AUTO_416 ?AUTO_419 ) ) ( not ( = ?AUTO_417 ?AUTO_420 ) ) ( not ( = ?AUTO_417 ?AUTO_419 ) ) ( not ( = ?AUTO_418 ?AUTO_420 ) ) ( not ( = ?AUTO_418 ?AUTO_419 ) ) ( not ( = ?AUTO_420 ?AUTO_419 ) ) ( ON ?AUTO_420 ?AUTO_418 ) ( CLEAR ?AUTO_420 ) ( HOLDING ?AUTO_419 ) ( CLEAR ?AUTO_421 ) ( not ( = ?AUTO_415 ?AUTO_421 ) ) ( not ( = ?AUTO_416 ?AUTO_421 ) ) ( not ( = ?AUTO_417 ?AUTO_421 ) ) ( not ( = ?AUTO_418 ?AUTO_421 ) ) ( not ( = ?AUTO_420 ?AUTO_421 ) ) ( not ( = ?AUTO_419 ?AUTO_421 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_419 ?AUTO_421 )
      ( MAKE-ON ?AUTO_415 ?AUTO_416 )
      ( MAKE-ON-VERIFY ?AUTO_415 ?AUTO_416 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_426 - BLOCK
      ?AUTO_427 - BLOCK
    )
    :vars
    (
      ?AUTO_432 - BLOCK
      ?AUTO_428 - BLOCK
      ?AUTO_430 - BLOCK
      ?AUTO_431 - BLOCK
      ?AUTO_429 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_427 ) ( not ( = ?AUTO_426 ?AUTO_427 ) ) ( ON-TABLE ?AUTO_426 ) ( CLEAR ?AUTO_432 ) ( not ( = ?AUTO_426 ?AUTO_428 ) ) ( not ( = ?AUTO_426 ?AUTO_432 ) ) ( not ( = ?AUTO_427 ?AUTO_428 ) ) ( not ( = ?AUTO_427 ?AUTO_432 ) ) ( not ( = ?AUTO_428 ?AUTO_432 ) ) ( ON ?AUTO_428 ?AUTO_426 ) ( not ( = ?AUTO_426 ?AUTO_430 ) ) ( not ( = ?AUTO_426 ?AUTO_431 ) ) ( not ( = ?AUTO_427 ?AUTO_430 ) ) ( not ( = ?AUTO_427 ?AUTO_431 ) ) ( not ( = ?AUTO_432 ?AUTO_430 ) ) ( not ( = ?AUTO_432 ?AUTO_431 ) ) ( not ( = ?AUTO_428 ?AUTO_430 ) ) ( not ( = ?AUTO_428 ?AUTO_431 ) ) ( not ( = ?AUTO_430 ?AUTO_431 ) ) ( ON ?AUTO_430 ?AUTO_428 ) ( CLEAR ?AUTO_429 ) ( not ( = ?AUTO_426 ?AUTO_429 ) ) ( not ( = ?AUTO_427 ?AUTO_429 ) ) ( not ( = ?AUTO_432 ?AUTO_429 ) ) ( not ( = ?AUTO_428 ?AUTO_429 ) ) ( not ( = ?AUTO_430 ?AUTO_429 ) ) ( not ( = ?AUTO_431 ?AUTO_429 ) ) ( ON ?AUTO_431 ?AUTO_430 ) ( CLEAR ?AUTO_431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_431 ?AUTO_430 )
      ( MAKE-ON ?AUTO_426 ?AUTO_427 )
      ( MAKE-ON-VERIFY ?AUTO_426 ?AUTO_427 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_433 - BLOCK
      ?AUTO_434 - BLOCK
    )
    :vars
    (
      ?AUTO_437 - BLOCK
      ?AUTO_436 - BLOCK
      ?AUTO_438 - BLOCK
      ?AUTO_439 - BLOCK
      ?AUTO_435 - BLOCK
      ?AUTO_440 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_434 ) ( not ( = ?AUTO_433 ?AUTO_434 ) ) ( ON-TABLE ?AUTO_433 ) ( CLEAR ?AUTO_437 ) ( not ( = ?AUTO_433 ?AUTO_436 ) ) ( not ( = ?AUTO_433 ?AUTO_437 ) ) ( not ( = ?AUTO_434 ?AUTO_436 ) ) ( not ( = ?AUTO_434 ?AUTO_437 ) ) ( not ( = ?AUTO_436 ?AUTO_437 ) ) ( ON ?AUTO_436 ?AUTO_433 ) ( not ( = ?AUTO_433 ?AUTO_438 ) ) ( not ( = ?AUTO_433 ?AUTO_439 ) ) ( not ( = ?AUTO_434 ?AUTO_438 ) ) ( not ( = ?AUTO_434 ?AUTO_439 ) ) ( not ( = ?AUTO_437 ?AUTO_438 ) ) ( not ( = ?AUTO_437 ?AUTO_439 ) ) ( not ( = ?AUTO_436 ?AUTO_438 ) ) ( not ( = ?AUTO_436 ?AUTO_439 ) ) ( not ( = ?AUTO_438 ?AUTO_439 ) ) ( ON ?AUTO_438 ?AUTO_436 ) ( CLEAR ?AUTO_435 ) ( not ( = ?AUTO_433 ?AUTO_435 ) ) ( not ( = ?AUTO_434 ?AUTO_435 ) ) ( not ( = ?AUTO_437 ?AUTO_435 ) ) ( not ( = ?AUTO_436 ?AUTO_435 ) ) ( not ( = ?AUTO_438 ?AUTO_435 ) ) ( not ( = ?AUTO_439 ?AUTO_435 ) ) ( ON ?AUTO_439 ?AUTO_438 ) ( CLEAR ?AUTO_439 ) ( HOLDING ?AUTO_440 ) ( not ( = ?AUTO_433 ?AUTO_440 ) ) ( not ( = ?AUTO_434 ?AUTO_440 ) ) ( not ( = ?AUTO_437 ?AUTO_440 ) ) ( not ( = ?AUTO_436 ?AUTO_440 ) ) ( not ( = ?AUTO_438 ?AUTO_440 ) ) ( not ( = ?AUTO_439 ?AUTO_440 ) ) ( not ( = ?AUTO_435 ?AUTO_440 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_440 )
      ( MAKE-ON ?AUTO_433 ?AUTO_434 )
      ( MAKE-ON-VERIFY ?AUTO_433 ?AUTO_434 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_441 - BLOCK
      ?AUTO_442 - BLOCK
    )
    :vars
    (
      ?AUTO_448 - BLOCK
      ?AUTO_445 - BLOCK
      ?AUTO_447 - BLOCK
      ?AUTO_443 - BLOCK
      ?AUTO_446 - BLOCK
      ?AUTO_444 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_442 ) ( not ( = ?AUTO_441 ?AUTO_442 ) ) ( ON-TABLE ?AUTO_441 ) ( CLEAR ?AUTO_448 ) ( not ( = ?AUTO_441 ?AUTO_445 ) ) ( not ( = ?AUTO_441 ?AUTO_448 ) ) ( not ( = ?AUTO_442 ?AUTO_445 ) ) ( not ( = ?AUTO_442 ?AUTO_448 ) ) ( not ( = ?AUTO_445 ?AUTO_448 ) ) ( ON ?AUTO_445 ?AUTO_441 ) ( not ( = ?AUTO_441 ?AUTO_447 ) ) ( not ( = ?AUTO_441 ?AUTO_443 ) ) ( not ( = ?AUTO_442 ?AUTO_447 ) ) ( not ( = ?AUTO_442 ?AUTO_443 ) ) ( not ( = ?AUTO_448 ?AUTO_447 ) ) ( not ( = ?AUTO_448 ?AUTO_443 ) ) ( not ( = ?AUTO_445 ?AUTO_447 ) ) ( not ( = ?AUTO_445 ?AUTO_443 ) ) ( not ( = ?AUTO_447 ?AUTO_443 ) ) ( ON ?AUTO_447 ?AUTO_445 ) ( CLEAR ?AUTO_446 ) ( not ( = ?AUTO_441 ?AUTO_446 ) ) ( not ( = ?AUTO_442 ?AUTO_446 ) ) ( not ( = ?AUTO_448 ?AUTO_446 ) ) ( not ( = ?AUTO_445 ?AUTO_446 ) ) ( not ( = ?AUTO_447 ?AUTO_446 ) ) ( not ( = ?AUTO_443 ?AUTO_446 ) ) ( ON ?AUTO_443 ?AUTO_447 ) ( not ( = ?AUTO_441 ?AUTO_444 ) ) ( not ( = ?AUTO_442 ?AUTO_444 ) ) ( not ( = ?AUTO_448 ?AUTO_444 ) ) ( not ( = ?AUTO_445 ?AUTO_444 ) ) ( not ( = ?AUTO_447 ?AUTO_444 ) ) ( not ( = ?AUTO_443 ?AUTO_444 ) ) ( not ( = ?AUTO_446 ?AUTO_444 ) ) ( ON ?AUTO_444 ?AUTO_443 ) ( CLEAR ?AUTO_444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_444 ?AUTO_443 )
      ( MAKE-ON ?AUTO_441 ?AUTO_442 )
      ( MAKE-ON-VERIFY ?AUTO_441 ?AUTO_442 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_449 - BLOCK
      ?AUTO_450 - BLOCK
    )
    :vars
    (
      ?AUTO_451 - BLOCK
      ?AUTO_453 - BLOCK
      ?AUTO_455 - BLOCK
      ?AUTO_454 - BLOCK
      ?AUTO_452 - BLOCK
      ?AUTO_456 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_449 ?AUTO_450 ) ) ( ON-TABLE ?AUTO_449 ) ( CLEAR ?AUTO_451 ) ( not ( = ?AUTO_449 ?AUTO_453 ) ) ( not ( = ?AUTO_449 ?AUTO_451 ) ) ( not ( = ?AUTO_450 ?AUTO_453 ) ) ( not ( = ?AUTO_450 ?AUTO_451 ) ) ( not ( = ?AUTO_453 ?AUTO_451 ) ) ( ON ?AUTO_453 ?AUTO_449 ) ( not ( = ?AUTO_449 ?AUTO_455 ) ) ( not ( = ?AUTO_449 ?AUTO_454 ) ) ( not ( = ?AUTO_450 ?AUTO_455 ) ) ( not ( = ?AUTO_450 ?AUTO_454 ) ) ( not ( = ?AUTO_451 ?AUTO_455 ) ) ( not ( = ?AUTO_451 ?AUTO_454 ) ) ( not ( = ?AUTO_453 ?AUTO_455 ) ) ( not ( = ?AUTO_453 ?AUTO_454 ) ) ( not ( = ?AUTO_455 ?AUTO_454 ) ) ( ON ?AUTO_455 ?AUTO_453 ) ( CLEAR ?AUTO_452 ) ( not ( = ?AUTO_449 ?AUTO_452 ) ) ( not ( = ?AUTO_450 ?AUTO_452 ) ) ( not ( = ?AUTO_451 ?AUTO_452 ) ) ( not ( = ?AUTO_453 ?AUTO_452 ) ) ( not ( = ?AUTO_455 ?AUTO_452 ) ) ( not ( = ?AUTO_454 ?AUTO_452 ) ) ( ON ?AUTO_454 ?AUTO_455 ) ( not ( = ?AUTO_449 ?AUTO_456 ) ) ( not ( = ?AUTO_450 ?AUTO_456 ) ) ( not ( = ?AUTO_451 ?AUTO_456 ) ) ( not ( = ?AUTO_453 ?AUTO_456 ) ) ( not ( = ?AUTO_455 ?AUTO_456 ) ) ( not ( = ?AUTO_454 ?AUTO_456 ) ) ( not ( = ?AUTO_452 ?AUTO_456 ) ) ( ON ?AUTO_456 ?AUTO_454 ) ( CLEAR ?AUTO_456 ) ( HOLDING ?AUTO_450 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_450 )
      ( MAKE-ON ?AUTO_449 ?AUTO_450 )
      ( MAKE-ON-VERIFY ?AUTO_449 ?AUTO_450 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_457 - BLOCK
      ?AUTO_458 - BLOCK
    )
    :vars
    (
      ?AUTO_461 - BLOCK
      ?AUTO_459 - BLOCK
      ?AUTO_460 - BLOCK
      ?AUTO_462 - BLOCK
      ?AUTO_463 - BLOCK
      ?AUTO_464 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_457 ?AUTO_458 ) ) ( ON-TABLE ?AUTO_457 ) ( not ( = ?AUTO_457 ?AUTO_461 ) ) ( not ( = ?AUTO_457 ?AUTO_459 ) ) ( not ( = ?AUTO_458 ?AUTO_461 ) ) ( not ( = ?AUTO_458 ?AUTO_459 ) ) ( not ( = ?AUTO_461 ?AUTO_459 ) ) ( ON ?AUTO_461 ?AUTO_457 ) ( not ( = ?AUTO_457 ?AUTO_460 ) ) ( not ( = ?AUTO_457 ?AUTO_462 ) ) ( not ( = ?AUTO_458 ?AUTO_460 ) ) ( not ( = ?AUTO_458 ?AUTO_462 ) ) ( not ( = ?AUTO_459 ?AUTO_460 ) ) ( not ( = ?AUTO_459 ?AUTO_462 ) ) ( not ( = ?AUTO_461 ?AUTO_460 ) ) ( not ( = ?AUTO_461 ?AUTO_462 ) ) ( not ( = ?AUTO_460 ?AUTO_462 ) ) ( ON ?AUTO_460 ?AUTO_461 ) ( CLEAR ?AUTO_463 ) ( not ( = ?AUTO_457 ?AUTO_463 ) ) ( not ( = ?AUTO_458 ?AUTO_463 ) ) ( not ( = ?AUTO_459 ?AUTO_463 ) ) ( not ( = ?AUTO_461 ?AUTO_463 ) ) ( not ( = ?AUTO_460 ?AUTO_463 ) ) ( not ( = ?AUTO_462 ?AUTO_463 ) ) ( ON ?AUTO_462 ?AUTO_460 ) ( not ( = ?AUTO_457 ?AUTO_464 ) ) ( not ( = ?AUTO_458 ?AUTO_464 ) ) ( not ( = ?AUTO_459 ?AUTO_464 ) ) ( not ( = ?AUTO_461 ?AUTO_464 ) ) ( not ( = ?AUTO_460 ?AUTO_464 ) ) ( not ( = ?AUTO_462 ?AUTO_464 ) ) ( not ( = ?AUTO_463 ?AUTO_464 ) ) ( ON ?AUTO_464 ?AUTO_462 ) ( CLEAR ?AUTO_464 ) ( ON ?AUTO_458 ?AUTO_459 ) ( CLEAR ?AUTO_458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_458 ?AUTO_459 )
      ( MAKE-ON ?AUTO_457 ?AUTO_458 )
      ( MAKE-ON-VERIFY ?AUTO_457 ?AUTO_458 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_466 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_466 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_466 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_466 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_467 - BLOCK
    )
    :vars
    (
      ?AUTO_468 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_467 ?AUTO_468 ) ( CLEAR ?AUTO_467 ) ( HAND-EMPTY ) ( not ( = ?AUTO_467 ?AUTO_468 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_467 ?AUTO_468 )
      ( MAKE-ON-TABLE ?AUTO_467 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_467 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_469 - BLOCK
    )
    :vars
    (
      ?AUTO_470 - BLOCK
      ?AUTO_471 - BLOCK
      ?AUTO_472 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_469 ?AUTO_470 ) ( CLEAR ?AUTO_469 ) ( not ( = ?AUTO_469 ?AUTO_470 ) ) ( HOLDING ?AUTO_471 ) ( CLEAR ?AUTO_472 ) ( not ( = ?AUTO_469 ?AUTO_471 ) ) ( not ( = ?AUTO_469 ?AUTO_472 ) ) ( not ( = ?AUTO_470 ?AUTO_471 ) ) ( not ( = ?AUTO_470 ?AUTO_472 ) ) ( not ( = ?AUTO_471 ?AUTO_472 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_471 ?AUTO_472 )
      ( MAKE-ON-TABLE ?AUTO_469 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_469 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_481 - BLOCK
    )
    :vars
    (
      ?AUTO_484 - BLOCK
      ?AUTO_483 - BLOCK
      ?AUTO_482 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_481 ?AUTO_484 ) ( not ( = ?AUTO_481 ?AUTO_484 ) ) ( CLEAR ?AUTO_483 ) ( not ( = ?AUTO_481 ?AUTO_482 ) ) ( not ( = ?AUTO_481 ?AUTO_483 ) ) ( not ( = ?AUTO_484 ?AUTO_482 ) ) ( not ( = ?AUTO_484 ?AUTO_483 ) ) ( not ( = ?AUTO_482 ?AUTO_483 ) ) ( ON ?AUTO_482 ?AUTO_481 ) ( CLEAR ?AUTO_482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_482 ?AUTO_481 )
      ( MAKE-ON-TABLE ?AUTO_481 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_481 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_485 - BLOCK
    )
    :vars
    (
      ?AUTO_488 - BLOCK
      ?AUTO_486 - BLOCK
      ?AUTO_487 - BLOCK
      ?AUTO_489 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_485 ?AUTO_488 ) ( not ( = ?AUTO_485 ?AUTO_488 ) ) ( CLEAR ?AUTO_486 ) ( not ( = ?AUTO_485 ?AUTO_487 ) ) ( not ( = ?AUTO_485 ?AUTO_486 ) ) ( not ( = ?AUTO_488 ?AUTO_487 ) ) ( not ( = ?AUTO_488 ?AUTO_486 ) ) ( not ( = ?AUTO_487 ?AUTO_486 ) ) ( ON ?AUTO_487 ?AUTO_485 ) ( CLEAR ?AUTO_487 ) ( HOLDING ?AUTO_489 ) ( not ( = ?AUTO_485 ?AUTO_489 ) ) ( not ( = ?AUTO_488 ?AUTO_489 ) ) ( not ( = ?AUTO_486 ?AUTO_489 ) ) ( not ( = ?AUTO_487 ?AUTO_489 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_489 )
      ( MAKE-ON-TABLE ?AUTO_485 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_485 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_490 - BLOCK
    )
    :vars
    (
      ?AUTO_494 - BLOCK
      ?AUTO_493 - BLOCK
      ?AUTO_491 - BLOCK
      ?AUTO_492 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_490 ?AUTO_494 ) ( not ( = ?AUTO_490 ?AUTO_494 ) ) ( CLEAR ?AUTO_493 ) ( not ( = ?AUTO_490 ?AUTO_491 ) ) ( not ( = ?AUTO_490 ?AUTO_493 ) ) ( not ( = ?AUTO_494 ?AUTO_491 ) ) ( not ( = ?AUTO_494 ?AUTO_493 ) ) ( not ( = ?AUTO_491 ?AUTO_493 ) ) ( ON ?AUTO_491 ?AUTO_490 ) ( not ( = ?AUTO_490 ?AUTO_492 ) ) ( not ( = ?AUTO_494 ?AUTO_492 ) ) ( not ( = ?AUTO_493 ?AUTO_492 ) ) ( not ( = ?AUTO_491 ?AUTO_492 ) ) ( ON ?AUTO_492 ?AUTO_491 ) ( CLEAR ?AUTO_492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_492 ?AUTO_491 )
      ( MAKE-ON-TABLE ?AUTO_490 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_490 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_495 - BLOCK
    )
    :vars
    (
      ?AUTO_496 - BLOCK
      ?AUTO_497 - BLOCK
      ?AUTO_498 - BLOCK
      ?AUTO_499 - BLOCK
      ?AUTO_500 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_495 ?AUTO_496 ) ( not ( = ?AUTO_495 ?AUTO_496 ) ) ( CLEAR ?AUTO_497 ) ( not ( = ?AUTO_495 ?AUTO_498 ) ) ( not ( = ?AUTO_495 ?AUTO_497 ) ) ( not ( = ?AUTO_496 ?AUTO_498 ) ) ( not ( = ?AUTO_496 ?AUTO_497 ) ) ( not ( = ?AUTO_498 ?AUTO_497 ) ) ( ON ?AUTO_498 ?AUTO_495 ) ( not ( = ?AUTO_495 ?AUTO_499 ) ) ( not ( = ?AUTO_496 ?AUTO_499 ) ) ( not ( = ?AUTO_497 ?AUTO_499 ) ) ( not ( = ?AUTO_498 ?AUTO_499 ) ) ( ON ?AUTO_499 ?AUTO_498 ) ( CLEAR ?AUTO_499 ) ( HOLDING ?AUTO_500 ) ( not ( = ?AUTO_495 ?AUTO_500 ) ) ( not ( = ?AUTO_496 ?AUTO_500 ) ) ( not ( = ?AUTO_497 ?AUTO_500 ) ) ( not ( = ?AUTO_498 ?AUTO_500 ) ) ( not ( = ?AUTO_499 ?AUTO_500 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_500 )
      ( MAKE-ON-TABLE ?AUTO_495 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_495 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_504 - BLOCK
      ?AUTO_505 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_504 ) ( CLEAR ?AUTO_505 ) ( not ( = ?AUTO_504 ?AUTO_505 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_504 ?AUTO_505 )
      ( MAKE-ON-VERIFY ?AUTO_504 ?AUTO_505 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_506 - BLOCK
      ?AUTO_507 - BLOCK
    )
    :vars
    (
      ?AUTO_508 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_507 ) ( not ( = ?AUTO_506 ?AUTO_507 ) ) ( ON ?AUTO_506 ?AUTO_508 ) ( CLEAR ?AUTO_506 ) ( HAND-EMPTY ) ( not ( = ?AUTO_506 ?AUTO_508 ) ) ( not ( = ?AUTO_507 ?AUTO_508 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_506 ?AUTO_508 )
      ( MAKE-ON ?AUTO_506 ?AUTO_507 )
      ( MAKE-ON-VERIFY ?AUTO_506 ?AUTO_507 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_509 - BLOCK
      ?AUTO_510 - BLOCK
    )
    :vars
    (
      ?AUTO_511 - BLOCK
      ?AUTO_512 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_510 ) ( not ( = ?AUTO_509 ?AUTO_510 ) ) ( ON ?AUTO_509 ?AUTO_511 ) ( CLEAR ?AUTO_509 ) ( not ( = ?AUTO_509 ?AUTO_511 ) ) ( not ( = ?AUTO_510 ?AUTO_511 ) ) ( HOLDING ?AUTO_512 ) ( not ( = ?AUTO_509 ?AUTO_512 ) ) ( not ( = ?AUTO_510 ?AUTO_512 ) ) ( not ( = ?AUTO_511 ?AUTO_512 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_512 )
      ( MAKE-ON ?AUTO_509 ?AUTO_510 )
      ( MAKE-ON-VERIFY ?AUTO_509 ?AUTO_510 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_513 - BLOCK
      ?AUTO_514 - BLOCK
    )
    :vars
    (
      ?AUTO_516 - BLOCK
      ?AUTO_515 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_514 ) ( not ( = ?AUTO_513 ?AUTO_514 ) ) ( ON ?AUTO_513 ?AUTO_516 ) ( not ( = ?AUTO_513 ?AUTO_516 ) ) ( not ( = ?AUTO_514 ?AUTO_516 ) ) ( not ( = ?AUTO_513 ?AUTO_515 ) ) ( not ( = ?AUTO_514 ?AUTO_515 ) ) ( not ( = ?AUTO_516 ?AUTO_515 ) ) ( ON ?AUTO_515 ?AUTO_513 ) ( CLEAR ?AUTO_515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_515 ?AUTO_513 )
      ( MAKE-ON ?AUTO_513 ?AUTO_514 )
      ( MAKE-ON-VERIFY ?AUTO_513 ?AUTO_514 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_517 - BLOCK
      ?AUTO_518 - BLOCK
    )
    :vars
    (
      ?AUTO_520 - BLOCK
      ?AUTO_519 - BLOCK
      ?AUTO_521 - BLOCK
      ?AUTO_522 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_518 ) ( not ( = ?AUTO_517 ?AUTO_518 ) ) ( ON ?AUTO_517 ?AUTO_520 ) ( not ( = ?AUTO_517 ?AUTO_520 ) ) ( not ( = ?AUTO_518 ?AUTO_520 ) ) ( not ( = ?AUTO_517 ?AUTO_519 ) ) ( not ( = ?AUTO_518 ?AUTO_519 ) ) ( not ( = ?AUTO_520 ?AUTO_519 ) ) ( ON ?AUTO_519 ?AUTO_517 ) ( CLEAR ?AUTO_519 ) ( HOLDING ?AUTO_521 ) ( CLEAR ?AUTO_522 ) ( not ( = ?AUTO_517 ?AUTO_521 ) ) ( not ( = ?AUTO_517 ?AUTO_522 ) ) ( not ( = ?AUTO_518 ?AUTO_521 ) ) ( not ( = ?AUTO_518 ?AUTO_522 ) ) ( not ( = ?AUTO_520 ?AUTO_521 ) ) ( not ( = ?AUTO_520 ?AUTO_522 ) ) ( not ( = ?AUTO_519 ?AUTO_521 ) ) ( not ( = ?AUTO_519 ?AUTO_522 ) ) ( not ( = ?AUTO_521 ?AUTO_522 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_521 ?AUTO_522 )
      ( MAKE-ON ?AUTO_517 ?AUTO_518 )
      ( MAKE-ON-VERIFY ?AUTO_517 ?AUTO_518 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_525 - BLOCK
      ?AUTO_526 - BLOCK
    )
    :vars
    (
      ?AUTO_528 - BLOCK
      ?AUTO_527 - BLOCK
      ?AUTO_529 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_525 ?AUTO_526 ) ) ( ON ?AUTO_525 ?AUTO_528 ) ( not ( = ?AUTO_525 ?AUTO_528 ) ) ( not ( = ?AUTO_526 ?AUTO_528 ) ) ( not ( = ?AUTO_525 ?AUTO_527 ) ) ( not ( = ?AUTO_526 ?AUTO_527 ) ) ( not ( = ?AUTO_528 ?AUTO_527 ) ) ( ON ?AUTO_527 ?AUTO_525 ) ( CLEAR ?AUTO_527 ) ( HOLDING ?AUTO_526 ) ( CLEAR ?AUTO_529 ) ( not ( = ?AUTO_525 ?AUTO_529 ) ) ( not ( = ?AUTO_526 ?AUTO_529 ) ) ( not ( = ?AUTO_528 ?AUTO_529 ) ) ( not ( = ?AUTO_527 ?AUTO_529 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_526 ?AUTO_529 )
      ( MAKE-ON ?AUTO_525 ?AUTO_526 )
      ( MAKE-ON-VERIFY ?AUTO_525 ?AUTO_526 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_534 - BLOCK
      ?AUTO_535 - BLOCK
    )
    :vars
    (
      ?AUTO_537 - BLOCK
      ?AUTO_536 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_534 ?AUTO_535 ) ) ( ON ?AUTO_534 ?AUTO_537 ) ( CLEAR ?AUTO_534 ) ( not ( = ?AUTO_534 ?AUTO_537 ) ) ( not ( = ?AUTO_535 ?AUTO_537 ) ) ( not ( = ?AUTO_534 ?AUTO_536 ) ) ( not ( = ?AUTO_535 ?AUTO_536 ) ) ( not ( = ?AUTO_537 ?AUTO_536 ) ) ( ON ?AUTO_536 ?AUTO_535 ) ( CLEAR ?AUTO_536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_536 ?AUTO_535 )
      ( MAKE-ON ?AUTO_534 ?AUTO_535 )
      ( MAKE-ON-VERIFY ?AUTO_534 ?AUTO_535 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_538 - BLOCK
      ?AUTO_539 - BLOCK
    )
    :vars
    (
      ?AUTO_541 - BLOCK
      ?AUTO_540 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_538 ?AUTO_539 ) ) ( not ( = ?AUTO_538 ?AUTO_541 ) ) ( not ( = ?AUTO_539 ?AUTO_541 ) ) ( not ( = ?AUTO_538 ?AUTO_540 ) ) ( not ( = ?AUTO_539 ?AUTO_540 ) ) ( not ( = ?AUTO_541 ?AUTO_540 ) ) ( ON ?AUTO_540 ?AUTO_539 ) ( CLEAR ?AUTO_540 ) ( HOLDING ?AUTO_538 ) ( CLEAR ?AUTO_541 ) )
    :subtasks
    ( ( !STACK ?AUTO_538 ?AUTO_541 )
      ( MAKE-ON ?AUTO_538 ?AUTO_539 )
      ( MAKE-ON-VERIFY ?AUTO_538 ?AUTO_539 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_542 - BLOCK
      ?AUTO_543 - BLOCK
    )
    :vars
    (
      ?AUTO_544 - BLOCK
      ?AUTO_545 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_542 ?AUTO_543 ) ) ( not ( = ?AUTO_542 ?AUTO_544 ) ) ( not ( = ?AUTO_543 ?AUTO_544 ) ) ( not ( = ?AUTO_542 ?AUTO_545 ) ) ( not ( = ?AUTO_543 ?AUTO_545 ) ) ( not ( = ?AUTO_544 ?AUTO_545 ) ) ( ON ?AUTO_545 ?AUTO_543 ) ( CLEAR ?AUTO_545 ) ( CLEAR ?AUTO_544 ) ( ON-TABLE ?AUTO_542 ) ( CLEAR ?AUTO_542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_542 )
      ( MAKE-ON ?AUTO_542 ?AUTO_543 )
      ( MAKE-ON-VERIFY ?AUTO_542 ?AUTO_543 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_546 - BLOCK
      ?AUTO_547 - BLOCK
    )
    :vars
    (
      ?AUTO_548 - BLOCK
      ?AUTO_549 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_546 ?AUTO_547 ) ) ( not ( = ?AUTO_546 ?AUTO_548 ) ) ( not ( = ?AUTO_547 ?AUTO_548 ) ) ( not ( = ?AUTO_546 ?AUTO_549 ) ) ( not ( = ?AUTO_547 ?AUTO_549 ) ) ( not ( = ?AUTO_548 ?AUTO_549 ) ) ( ON ?AUTO_549 ?AUTO_547 ) ( CLEAR ?AUTO_549 ) ( ON-TABLE ?AUTO_546 ) ( CLEAR ?AUTO_546 ) ( HOLDING ?AUTO_548 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_548 )
      ( MAKE-ON ?AUTO_546 ?AUTO_547 )
      ( MAKE-ON-VERIFY ?AUTO_546 ?AUTO_547 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_550 - BLOCK
      ?AUTO_551 - BLOCK
    )
    :vars
    (
      ?AUTO_552 - BLOCK
      ?AUTO_553 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_550 ?AUTO_551 ) ) ( not ( = ?AUTO_550 ?AUTO_552 ) ) ( not ( = ?AUTO_551 ?AUTO_552 ) ) ( not ( = ?AUTO_550 ?AUTO_553 ) ) ( not ( = ?AUTO_551 ?AUTO_553 ) ) ( not ( = ?AUTO_552 ?AUTO_553 ) ) ( ON ?AUTO_553 ?AUTO_551 ) ( ON-TABLE ?AUTO_550 ) ( CLEAR ?AUTO_550 ) ( ON ?AUTO_552 ?AUTO_553 ) ( CLEAR ?AUTO_552 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_552 ?AUTO_553 )
      ( MAKE-ON ?AUTO_550 ?AUTO_551 )
      ( MAKE-ON-VERIFY ?AUTO_550 ?AUTO_551 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_554 - BLOCK
      ?AUTO_555 - BLOCK
    )
    :vars
    (
      ?AUTO_557 - BLOCK
      ?AUTO_556 - BLOCK
      ?AUTO_558 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_554 ?AUTO_555 ) ) ( not ( = ?AUTO_554 ?AUTO_557 ) ) ( not ( = ?AUTO_555 ?AUTO_557 ) ) ( not ( = ?AUTO_554 ?AUTO_556 ) ) ( not ( = ?AUTO_555 ?AUTO_556 ) ) ( not ( = ?AUTO_557 ?AUTO_556 ) ) ( ON ?AUTO_556 ?AUTO_555 ) ( ON-TABLE ?AUTO_554 ) ( CLEAR ?AUTO_554 ) ( ON ?AUTO_557 ?AUTO_556 ) ( CLEAR ?AUTO_557 ) ( HOLDING ?AUTO_558 ) ( not ( = ?AUTO_554 ?AUTO_558 ) ) ( not ( = ?AUTO_555 ?AUTO_558 ) ) ( not ( = ?AUTO_557 ?AUTO_558 ) ) ( not ( = ?AUTO_556 ?AUTO_558 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_558 )
      ( MAKE-ON ?AUTO_554 ?AUTO_555 )
      ( MAKE-ON-VERIFY ?AUTO_554 ?AUTO_555 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_559 - BLOCK
      ?AUTO_560 - BLOCK
    )
    :vars
    (
      ?AUTO_561 - BLOCK
      ?AUTO_563 - BLOCK
      ?AUTO_562 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_559 ?AUTO_560 ) ) ( not ( = ?AUTO_559 ?AUTO_561 ) ) ( not ( = ?AUTO_560 ?AUTO_561 ) ) ( not ( = ?AUTO_559 ?AUTO_563 ) ) ( not ( = ?AUTO_560 ?AUTO_563 ) ) ( not ( = ?AUTO_561 ?AUTO_563 ) ) ( ON ?AUTO_563 ?AUTO_560 ) ( ON-TABLE ?AUTO_559 ) ( CLEAR ?AUTO_559 ) ( ON ?AUTO_561 ?AUTO_563 ) ( not ( = ?AUTO_559 ?AUTO_562 ) ) ( not ( = ?AUTO_560 ?AUTO_562 ) ) ( not ( = ?AUTO_561 ?AUTO_562 ) ) ( not ( = ?AUTO_563 ?AUTO_562 ) ) ( ON ?AUTO_562 ?AUTO_561 ) ( CLEAR ?AUTO_562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_562 ?AUTO_561 )
      ( MAKE-ON ?AUTO_559 ?AUTO_560 )
      ( MAKE-ON-VERIFY ?AUTO_559 ?AUTO_560 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_564 - BLOCK
      ?AUTO_565 - BLOCK
    )
    :vars
    (
      ?AUTO_567 - BLOCK
      ?AUTO_566 - BLOCK
      ?AUTO_568 - BLOCK
      ?AUTO_569 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_564 ?AUTO_565 ) ) ( not ( = ?AUTO_564 ?AUTO_567 ) ) ( not ( = ?AUTO_565 ?AUTO_567 ) ) ( not ( = ?AUTO_564 ?AUTO_566 ) ) ( not ( = ?AUTO_565 ?AUTO_566 ) ) ( not ( = ?AUTO_567 ?AUTO_566 ) ) ( ON ?AUTO_566 ?AUTO_565 ) ( ON-TABLE ?AUTO_564 ) ( CLEAR ?AUTO_564 ) ( ON ?AUTO_567 ?AUTO_566 ) ( not ( = ?AUTO_564 ?AUTO_568 ) ) ( not ( = ?AUTO_565 ?AUTO_568 ) ) ( not ( = ?AUTO_567 ?AUTO_568 ) ) ( not ( = ?AUTO_566 ?AUTO_568 ) ) ( ON ?AUTO_568 ?AUTO_567 ) ( CLEAR ?AUTO_568 ) ( HOLDING ?AUTO_569 ) ( not ( = ?AUTO_564 ?AUTO_569 ) ) ( not ( = ?AUTO_565 ?AUTO_569 ) ) ( not ( = ?AUTO_567 ?AUTO_569 ) ) ( not ( = ?AUTO_566 ?AUTO_569 ) ) ( not ( = ?AUTO_568 ?AUTO_569 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_569 )
      ( MAKE-ON ?AUTO_564 ?AUTO_565 )
      ( MAKE-ON-VERIFY ?AUTO_564 ?AUTO_565 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_574 - BLOCK
      ?AUTO_575 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_574 ) ( CLEAR ?AUTO_575 ) ( not ( = ?AUTO_574 ?AUTO_575 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_574 ?AUTO_575 )
      ( MAKE-ON-VERIFY ?AUTO_574 ?AUTO_575 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_576 - BLOCK
      ?AUTO_577 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_577 ) ( not ( = ?AUTO_576 ?AUTO_577 ) ) ( ON-TABLE ?AUTO_576 ) ( CLEAR ?AUTO_576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_576 )
      ( MAKE-ON ?AUTO_576 ?AUTO_577 )
      ( MAKE-ON-VERIFY ?AUTO_576 ?AUTO_577 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_578 - BLOCK
      ?AUTO_579 - BLOCK
    )
    :vars
    (
      ?AUTO_580 - BLOCK
      ?AUTO_581 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_579 ) ( not ( = ?AUTO_578 ?AUTO_579 ) ) ( ON-TABLE ?AUTO_578 ) ( CLEAR ?AUTO_578 ) ( HOLDING ?AUTO_580 ) ( CLEAR ?AUTO_581 ) ( not ( = ?AUTO_578 ?AUTO_580 ) ) ( not ( = ?AUTO_578 ?AUTO_581 ) ) ( not ( = ?AUTO_579 ?AUTO_580 ) ) ( not ( = ?AUTO_579 ?AUTO_581 ) ) ( not ( = ?AUTO_580 ?AUTO_581 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_580 ?AUTO_581 )
      ( MAKE-ON ?AUTO_578 ?AUTO_579 )
      ( MAKE-ON-VERIFY ?AUTO_578 ?AUTO_579 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_582 - BLOCK
      ?AUTO_583 - BLOCK
    )
    :vars
    (
      ?AUTO_584 - BLOCK
      ?AUTO_585 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_583 ) ( not ( = ?AUTO_582 ?AUTO_583 ) ) ( ON-TABLE ?AUTO_582 ) ( CLEAR ?AUTO_584 ) ( not ( = ?AUTO_582 ?AUTO_585 ) ) ( not ( = ?AUTO_582 ?AUTO_584 ) ) ( not ( = ?AUTO_583 ?AUTO_585 ) ) ( not ( = ?AUTO_583 ?AUTO_584 ) ) ( not ( = ?AUTO_585 ?AUTO_584 ) ) ( ON ?AUTO_585 ?AUTO_582 ) ( CLEAR ?AUTO_585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_585 ?AUTO_582 )
      ( MAKE-ON ?AUTO_582 ?AUTO_583 )
      ( MAKE-ON-VERIFY ?AUTO_582 ?AUTO_583 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_586 - BLOCK
      ?AUTO_587 - BLOCK
    )
    :vars
    (
      ?AUTO_589 - BLOCK
      ?AUTO_588 - BLOCK
      ?AUTO_590 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_587 ) ( not ( = ?AUTO_586 ?AUTO_587 ) ) ( ON-TABLE ?AUTO_586 ) ( CLEAR ?AUTO_589 ) ( not ( = ?AUTO_586 ?AUTO_588 ) ) ( not ( = ?AUTO_586 ?AUTO_589 ) ) ( not ( = ?AUTO_587 ?AUTO_588 ) ) ( not ( = ?AUTO_587 ?AUTO_589 ) ) ( not ( = ?AUTO_588 ?AUTO_589 ) ) ( ON ?AUTO_588 ?AUTO_586 ) ( CLEAR ?AUTO_588 ) ( HOLDING ?AUTO_590 ) ( not ( = ?AUTO_586 ?AUTO_590 ) ) ( not ( = ?AUTO_587 ?AUTO_590 ) ) ( not ( = ?AUTO_589 ?AUTO_590 ) ) ( not ( = ?AUTO_588 ?AUTO_590 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_590 )
      ( MAKE-ON ?AUTO_586 ?AUTO_587 )
      ( MAKE-ON-VERIFY ?AUTO_586 ?AUTO_587 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_591 - BLOCK
      ?AUTO_592 - BLOCK
    )
    :vars
    (
      ?AUTO_594 - BLOCK
      ?AUTO_593 - BLOCK
      ?AUTO_595 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_592 ) ( not ( = ?AUTO_591 ?AUTO_592 ) ) ( ON-TABLE ?AUTO_591 ) ( CLEAR ?AUTO_594 ) ( not ( = ?AUTO_591 ?AUTO_593 ) ) ( not ( = ?AUTO_591 ?AUTO_594 ) ) ( not ( = ?AUTO_592 ?AUTO_593 ) ) ( not ( = ?AUTO_592 ?AUTO_594 ) ) ( not ( = ?AUTO_593 ?AUTO_594 ) ) ( ON ?AUTO_593 ?AUTO_591 ) ( not ( = ?AUTO_591 ?AUTO_595 ) ) ( not ( = ?AUTO_592 ?AUTO_595 ) ) ( not ( = ?AUTO_594 ?AUTO_595 ) ) ( not ( = ?AUTO_593 ?AUTO_595 ) ) ( ON ?AUTO_595 ?AUTO_593 ) ( CLEAR ?AUTO_595 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_595 ?AUTO_593 )
      ( MAKE-ON ?AUTO_591 ?AUTO_592 )
      ( MAKE-ON-VERIFY ?AUTO_591 ?AUTO_592 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_596 - BLOCK
      ?AUTO_597 - BLOCK
    )
    :vars
    (
      ?AUTO_598 - BLOCK
      ?AUTO_599 - BLOCK
      ?AUTO_600 - BLOCK
      ?AUTO_601 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_596 ?AUTO_597 ) ) ( ON-TABLE ?AUTO_596 ) ( CLEAR ?AUTO_598 ) ( not ( = ?AUTO_596 ?AUTO_599 ) ) ( not ( = ?AUTO_596 ?AUTO_598 ) ) ( not ( = ?AUTO_597 ?AUTO_599 ) ) ( not ( = ?AUTO_597 ?AUTO_598 ) ) ( not ( = ?AUTO_599 ?AUTO_598 ) ) ( ON ?AUTO_599 ?AUTO_596 ) ( not ( = ?AUTO_596 ?AUTO_600 ) ) ( not ( = ?AUTO_597 ?AUTO_600 ) ) ( not ( = ?AUTO_598 ?AUTO_600 ) ) ( not ( = ?AUTO_599 ?AUTO_600 ) ) ( ON ?AUTO_600 ?AUTO_599 ) ( CLEAR ?AUTO_600 ) ( HOLDING ?AUTO_597 ) ( CLEAR ?AUTO_601 ) ( not ( = ?AUTO_596 ?AUTO_601 ) ) ( not ( = ?AUTO_597 ?AUTO_601 ) ) ( not ( = ?AUTO_598 ?AUTO_601 ) ) ( not ( = ?AUTO_599 ?AUTO_601 ) ) ( not ( = ?AUTO_600 ?AUTO_601 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_597 ?AUTO_601 )
      ( MAKE-ON ?AUTO_596 ?AUTO_597 )
      ( MAKE-ON-VERIFY ?AUTO_596 ?AUTO_597 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_604 - BLOCK
      ?AUTO_605 - BLOCK
    )
    :vars
    (
      ?AUTO_607 - BLOCK
      ?AUTO_608 - BLOCK
      ?AUTO_606 - BLOCK
      ?AUTO_609 - BLOCK
      ?AUTO_610 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_605 ) ( not ( = ?AUTO_604 ?AUTO_605 ) ) ( ON-TABLE ?AUTO_604 ) ( CLEAR ?AUTO_607 ) ( not ( = ?AUTO_604 ?AUTO_608 ) ) ( not ( = ?AUTO_604 ?AUTO_607 ) ) ( not ( = ?AUTO_605 ?AUTO_608 ) ) ( not ( = ?AUTO_605 ?AUTO_607 ) ) ( not ( = ?AUTO_608 ?AUTO_607 ) ) ( ON ?AUTO_608 ?AUTO_604 ) ( not ( = ?AUTO_604 ?AUTO_606 ) ) ( not ( = ?AUTO_605 ?AUTO_606 ) ) ( not ( = ?AUTO_607 ?AUTO_606 ) ) ( not ( = ?AUTO_608 ?AUTO_606 ) ) ( ON ?AUTO_606 ?AUTO_608 ) ( CLEAR ?AUTO_606 ) ( HOLDING ?AUTO_609 ) ( CLEAR ?AUTO_610 ) ( not ( = ?AUTO_604 ?AUTO_609 ) ) ( not ( = ?AUTO_604 ?AUTO_610 ) ) ( not ( = ?AUTO_605 ?AUTO_609 ) ) ( not ( = ?AUTO_605 ?AUTO_610 ) ) ( not ( = ?AUTO_607 ?AUTO_609 ) ) ( not ( = ?AUTO_607 ?AUTO_610 ) ) ( not ( = ?AUTO_608 ?AUTO_609 ) ) ( not ( = ?AUTO_608 ?AUTO_610 ) ) ( not ( = ?AUTO_606 ?AUTO_609 ) ) ( not ( = ?AUTO_606 ?AUTO_610 ) ) ( not ( = ?AUTO_609 ?AUTO_610 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_609 ?AUTO_610 )
      ( MAKE-ON ?AUTO_604 ?AUTO_605 )
      ( MAKE-ON-VERIFY ?AUTO_604 ?AUTO_605 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_611 - BLOCK
      ?AUTO_612 - BLOCK
    )
    :vars
    (
      ?AUTO_613 - BLOCK
      ?AUTO_614 - BLOCK
      ?AUTO_615 - BLOCK
      ?AUTO_617 - BLOCK
      ?AUTO_616 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_611 ?AUTO_612 ) ) ( ON-TABLE ?AUTO_611 ) ( CLEAR ?AUTO_613 ) ( not ( = ?AUTO_611 ?AUTO_614 ) ) ( not ( = ?AUTO_611 ?AUTO_613 ) ) ( not ( = ?AUTO_612 ?AUTO_614 ) ) ( not ( = ?AUTO_612 ?AUTO_613 ) ) ( not ( = ?AUTO_614 ?AUTO_613 ) ) ( ON ?AUTO_614 ?AUTO_611 ) ( not ( = ?AUTO_611 ?AUTO_615 ) ) ( not ( = ?AUTO_612 ?AUTO_615 ) ) ( not ( = ?AUTO_613 ?AUTO_615 ) ) ( not ( = ?AUTO_614 ?AUTO_615 ) ) ( ON ?AUTO_615 ?AUTO_614 ) ( CLEAR ?AUTO_615 ) ( CLEAR ?AUTO_617 ) ( not ( = ?AUTO_611 ?AUTO_616 ) ) ( not ( = ?AUTO_611 ?AUTO_617 ) ) ( not ( = ?AUTO_612 ?AUTO_616 ) ) ( not ( = ?AUTO_612 ?AUTO_617 ) ) ( not ( = ?AUTO_613 ?AUTO_616 ) ) ( not ( = ?AUTO_613 ?AUTO_617 ) ) ( not ( = ?AUTO_614 ?AUTO_616 ) ) ( not ( = ?AUTO_614 ?AUTO_617 ) ) ( not ( = ?AUTO_615 ?AUTO_616 ) ) ( not ( = ?AUTO_615 ?AUTO_617 ) ) ( not ( = ?AUTO_616 ?AUTO_617 ) ) ( ON ?AUTO_616 ?AUTO_612 ) ( CLEAR ?AUTO_616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_616 ?AUTO_612 )
      ( MAKE-ON ?AUTO_611 ?AUTO_612 )
      ( MAKE-ON-VERIFY ?AUTO_611 ?AUTO_612 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_618 - BLOCK
      ?AUTO_619 - BLOCK
    )
    :vars
    (
      ?AUTO_621 - BLOCK
      ?AUTO_620 - BLOCK
      ?AUTO_624 - BLOCK
      ?AUTO_622 - BLOCK
      ?AUTO_623 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_618 ?AUTO_619 ) ) ( ON-TABLE ?AUTO_618 ) ( CLEAR ?AUTO_621 ) ( not ( = ?AUTO_618 ?AUTO_620 ) ) ( not ( = ?AUTO_618 ?AUTO_621 ) ) ( not ( = ?AUTO_619 ?AUTO_620 ) ) ( not ( = ?AUTO_619 ?AUTO_621 ) ) ( not ( = ?AUTO_620 ?AUTO_621 ) ) ( ON ?AUTO_620 ?AUTO_618 ) ( not ( = ?AUTO_618 ?AUTO_624 ) ) ( not ( = ?AUTO_619 ?AUTO_624 ) ) ( not ( = ?AUTO_621 ?AUTO_624 ) ) ( not ( = ?AUTO_620 ?AUTO_624 ) ) ( CLEAR ?AUTO_622 ) ( not ( = ?AUTO_618 ?AUTO_623 ) ) ( not ( = ?AUTO_618 ?AUTO_622 ) ) ( not ( = ?AUTO_619 ?AUTO_623 ) ) ( not ( = ?AUTO_619 ?AUTO_622 ) ) ( not ( = ?AUTO_621 ?AUTO_623 ) ) ( not ( = ?AUTO_621 ?AUTO_622 ) ) ( not ( = ?AUTO_620 ?AUTO_623 ) ) ( not ( = ?AUTO_620 ?AUTO_622 ) ) ( not ( = ?AUTO_624 ?AUTO_623 ) ) ( not ( = ?AUTO_624 ?AUTO_622 ) ) ( not ( = ?AUTO_623 ?AUTO_622 ) ) ( ON ?AUTO_623 ?AUTO_619 ) ( CLEAR ?AUTO_623 ) ( HOLDING ?AUTO_624 ) ( CLEAR ?AUTO_620 ) )
    :subtasks
    ( ( !STACK ?AUTO_624 ?AUTO_620 )
      ( MAKE-ON ?AUTO_618 ?AUTO_619 )
      ( MAKE-ON-VERIFY ?AUTO_618 ?AUTO_619 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_625 - BLOCK
      ?AUTO_626 - BLOCK
    )
    :vars
    (
      ?AUTO_627 - BLOCK
      ?AUTO_628 - BLOCK
      ?AUTO_629 - BLOCK
      ?AUTO_631 - BLOCK
      ?AUTO_630 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_625 ?AUTO_626 ) ) ( ON-TABLE ?AUTO_625 ) ( CLEAR ?AUTO_627 ) ( not ( = ?AUTO_625 ?AUTO_628 ) ) ( not ( = ?AUTO_625 ?AUTO_627 ) ) ( not ( = ?AUTO_626 ?AUTO_628 ) ) ( not ( = ?AUTO_626 ?AUTO_627 ) ) ( not ( = ?AUTO_628 ?AUTO_627 ) ) ( ON ?AUTO_628 ?AUTO_625 ) ( not ( = ?AUTO_625 ?AUTO_629 ) ) ( not ( = ?AUTO_626 ?AUTO_629 ) ) ( not ( = ?AUTO_627 ?AUTO_629 ) ) ( not ( = ?AUTO_628 ?AUTO_629 ) ) ( CLEAR ?AUTO_631 ) ( not ( = ?AUTO_625 ?AUTO_630 ) ) ( not ( = ?AUTO_625 ?AUTO_631 ) ) ( not ( = ?AUTO_626 ?AUTO_630 ) ) ( not ( = ?AUTO_626 ?AUTO_631 ) ) ( not ( = ?AUTO_627 ?AUTO_630 ) ) ( not ( = ?AUTO_627 ?AUTO_631 ) ) ( not ( = ?AUTO_628 ?AUTO_630 ) ) ( not ( = ?AUTO_628 ?AUTO_631 ) ) ( not ( = ?AUTO_629 ?AUTO_630 ) ) ( not ( = ?AUTO_629 ?AUTO_631 ) ) ( not ( = ?AUTO_630 ?AUTO_631 ) ) ( ON ?AUTO_630 ?AUTO_626 ) ( CLEAR ?AUTO_628 ) ( ON ?AUTO_629 ?AUTO_630 ) ( CLEAR ?AUTO_629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_629 ?AUTO_630 )
      ( MAKE-ON ?AUTO_625 ?AUTO_626 )
      ( MAKE-ON-VERIFY ?AUTO_625 ?AUTO_626 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_632 - BLOCK
      ?AUTO_633 - BLOCK
    )
    :vars
    (
      ?AUTO_635 - BLOCK
      ?AUTO_634 - BLOCK
      ?AUTO_638 - BLOCK
      ?AUTO_636 - BLOCK
      ?AUTO_637 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_632 ?AUTO_633 ) ) ( ON-TABLE ?AUTO_632 ) ( CLEAR ?AUTO_635 ) ( not ( = ?AUTO_632 ?AUTO_634 ) ) ( not ( = ?AUTO_632 ?AUTO_635 ) ) ( not ( = ?AUTO_633 ?AUTO_634 ) ) ( not ( = ?AUTO_633 ?AUTO_635 ) ) ( not ( = ?AUTO_634 ?AUTO_635 ) ) ( not ( = ?AUTO_632 ?AUTO_638 ) ) ( not ( = ?AUTO_633 ?AUTO_638 ) ) ( not ( = ?AUTO_635 ?AUTO_638 ) ) ( not ( = ?AUTO_634 ?AUTO_638 ) ) ( CLEAR ?AUTO_636 ) ( not ( = ?AUTO_632 ?AUTO_637 ) ) ( not ( = ?AUTO_632 ?AUTO_636 ) ) ( not ( = ?AUTO_633 ?AUTO_637 ) ) ( not ( = ?AUTO_633 ?AUTO_636 ) ) ( not ( = ?AUTO_635 ?AUTO_637 ) ) ( not ( = ?AUTO_635 ?AUTO_636 ) ) ( not ( = ?AUTO_634 ?AUTO_637 ) ) ( not ( = ?AUTO_634 ?AUTO_636 ) ) ( not ( = ?AUTO_638 ?AUTO_637 ) ) ( not ( = ?AUTO_638 ?AUTO_636 ) ) ( not ( = ?AUTO_637 ?AUTO_636 ) ) ( ON ?AUTO_637 ?AUTO_633 ) ( ON ?AUTO_638 ?AUTO_637 ) ( CLEAR ?AUTO_638 ) ( HOLDING ?AUTO_634 ) ( CLEAR ?AUTO_632 ) )
    :subtasks
    ( ( !STACK ?AUTO_634 ?AUTO_632 )
      ( MAKE-ON ?AUTO_632 ?AUTO_633 )
      ( MAKE-ON-VERIFY ?AUTO_632 ?AUTO_633 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_639 - BLOCK
      ?AUTO_640 - BLOCK
    )
    :vars
    (
      ?AUTO_642 - BLOCK
      ?AUTO_643 - BLOCK
      ?AUTO_641 - BLOCK
      ?AUTO_645 - BLOCK
      ?AUTO_644 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_639 ?AUTO_640 ) ) ( ON-TABLE ?AUTO_639 ) ( CLEAR ?AUTO_642 ) ( not ( = ?AUTO_639 ?AUTO_643 ) ) ( not ( = ?AUTO_639 ?AUTO_642 ) ) ( not ( = ?AUTO_640 ?AUTO_643 ) ) ( not ( = ?AUTO_640 ?AUTO_642 ) ) ( not ( = ?AUTO_643 ?AUTO_642 ) ) ( not ( = ?AUTO_639 ?AUTO_641 ) ) ( not ( = ?AUTO_640 ?AUTO_641 ) ) ( not ( = ?AUTO_642 ?AUTO_641 ) ) ( not ( = ?AUTO_643 ?AUTO_641 ) ) ( CLEAR ?AUTO_645 ) ( not ( = ?AUTO_639 ?AUTO_644 ) ) ( not ( = ?AUTO_639 ?AUTO_645 ) ) ( not ( = ?AUTO_640 ?AUTO_644 ) ) ( not ( = ?AUTO_640 ?AUTO_645 ) ) ( not ( = ?AUTO_642 ?AUTO_644 ) ) ( not ( = ?AUTO_642 ?AUTO_645 ) ) ( not ( = ?AUTO_643 ?AUTO_644 ) ) ( not ( = ?AUTO_643 ?AUTO_645 ) ) ( not ( = ?AUTO_641 ?AUTO_644 ) ) ( not ( = ?AUTO_641 ?AUTO_645 ) ) ( not ( = ?AUTO_644 ?AUTO_645 ) ) ( ON ?AUTO_644 ?AUTO_640 ) ( ON ?AUTO_641 ?AUTO_644 ) ( CLEAR ?AUTO_641 ) ( CLEAR ?AUTO_639 ) ( ON-TABLE ?AUTO_643 ) ( CLEAR ?AUTO_643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_643 )
      ( MAKE-ON ?AUTO_639 ?AUTO_640 )
      ( MAKE-ON-VERIFY ?AUTO_639 ?AUTO_640 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_646 - BLOCK
      ?AUTO_647 - BLOCK
    )
    :vars
    (
      ?AUTO_650 - BLOCK
      ?AUTO_649 - BLOCK
      ?AUTO_648 - BLOCK
      ?AUTO_652 - BLOCK
      ?AUTO_651 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_646 ?AUTO_647 ) ) ( CLEAR ?AUTO_650 ) ( not ( = ?AUTO_646 ?AUTO_649 ) ) ( not ( = ?AUTO_646 ?AUTO_650 ) ) ( not ( = ?AUTO_647 ?AUTO_649 ) ) ( not ( = ?AUTO_647 ?AUTO_650 ) ) ( not ( = ?AUTO_649 ?AUTO_650 ) ) ( not ( = ?AUTO_646 ?AUTO_648 ) ) ( not ( = ?AUTO_647 ?AUTO_648 ) ) ( not ( = ?AUTO_650 ?AUTO_648 ) ) ( not ( = ?AUTO_649 ?AUTO_648 ) ) ( CLEAR ?AUTO_652 ) ( not ( = ?AUTO_646 ?AUTO_651 ) ) ( not ( = ?AUTO_646 ?AUTO_652 ) ) ( not ( = ?AUTO_647 ?AUTO_651 ) ) ( not ( = ?AUTO_647 ?AUTO_652 ) ) ( not ( = ?AUTO_650 ?AUTO_651 ) ) ( not ( = ?AUTO_650 ?AUTO_652 ) ) ( not ( = ?AUTO_649 ?AUTO_651 ) ) ( not ( = ?AUTO_649 ?AUTO_652 ) ) ( not ( = ?AUTO_648 ?AUTO_651 ) ) ( not ( = ?AUTO_648 ?AUTO_652 ) ) ( not ( = ?AUTO_651 ?AUTO_652 ) ) ( ON ?AUTO_651 ?AUTO_647 ) ( ON ?AUTO_648 ?AUTO_651 ) ( CLEAR ?AUTO_648 ) ( ON-TABLE ?AUTO_649 ) ( CLEAR ?AUTO_649 ) ( HOLDING ?AUTO_646 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_646 )
      ( MAKE-ON ?AUTO_646 ?AUTO_647 )
      ( MAKE-ON-VERIFY ?AUTO_646 ?AUTO_647 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_653 - BLOCK
      ?AUTO_654 - BLOCK
    )
    :vars
    (
      ?AUTO_658 - BLOCK
      ?AUTO_655 - BLOCK
      ?AUTO_659 - BLOCK
      ?AUTO_657 - BLOCK
      ?AUTO_656 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_653 ?AUTO_654 ) ) ( CLEAR ?AUTO_658 ) ( not ( = ?AUTO_653 ?AUTO_655 ) ) ( not ( = ?AUTO_653 ?AUTO_658 ) ) ( not ( = ?AUTO_654 ?AUTO_655 ) ) ( not ( = ?AUTO_654 ?AUTO_658 ) ) ( not ( = ?AUTO_655 ?AUTO_658 ) ) ( not ( = ?AUTO_653 ?AUTO_659 ) ) ( not ( = ?AUTO_654 ?AUTO_659 ) ) ( not ( = ?AUTO_658 ?AUTO_659 ) ) ( not ( = ?AUTO_655 ?AUTO_659 ) ) ( CLEAR ?AUTO_657 ) ( not ( = ?AUTO_653 ?AUTO_656 ) ) ( not ( = ?AUTO_653 ?AUTO_657 ) ) ( not ( = ?AUTO_654 ?AUTO_656 ) ) ( not ( = ?AUTO_654 ?AUTO_657 ) ) ( not ( = ?AUTO_658 ?AUTO_656 ) ) ( not ( = ?AUTO_658 ?AUTO_657 ) ) ( not ( = ?AUTO_655 ?AUTO_656 ) ) ( not ( = ?AUTO_655 ?AUTO_657 ) ) ( not ( = ?AUTO_659 ?AUTO_656 ) ) ( not ( = ?AUTO_659 ?AUTO_657 ) ) ( not ( = ?AUTO_656 ?AUTO_657 ) ) ( ON ?AUTO_656 ?AUTO_654 ) ( ON ?AUTO_659 ?AUTO_656 ) ( ON-TABLE ?AUTO_655 ) ( CLEAR ?AUTO_655 ) ( ON ?AUTO_653 ?AUTO_659 ) ( CLEAR ?AUTO_653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_653 ?AUTO_659 )
      ( MAKE-ON ?AUTO_653 ?AUTO_654 )
      ( MAKE-ON-VERIFY ?AUTO_653 ?AUTO_654 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_660 - BLOCK
      ?AUTO_661 - BLOCK
    )
    :vars
    (
      ?AUTO_665 - BLOCK
      ?AUTO_662 - BLOCK
      ?AUTO_663 - BLOCK
      ?AUTO_666 - BLOCK
      ?AUTO_664 - BLOCK
      ?AUTO_667 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_660 ?AUTO_661 ) ) ( CLEAR ?AUTO_665 ) ( not ( = ?AUTO_660 ?AUTO_662 ) ) ( not ( = ?AUTO_660 ?AUTO_665 ) ) ( not ( = ?AUTO_661 ?AUTO_662 ) ) ( not ( = ?AUTO_661 ?AUTO_665 ) ) ( not ( = ?AUTO_662 ?AUTO_665 ) ) ( not ( = ?AUTO_660 ?AUTO_663 ) ) ( not ( = ?AUTO_661 ?AUTO_663 ) ) ( not ( = ?AUTO_665 ?AUTO_663 ) ) ( not ( = ?AUTO_662 ?AUTO_663 ) ) ( CLEAR ?AUTO_666 ) ( not ( = ?AUTO_660 ?AUTO_664 ) ) ( not ( = ?AUTO_660 ?AUTO_666 ) ) ( not ( = ?AUTO_661 ?AUTO_664 ) ) ( not ( = ?AUTO_661 ?AUTO_666 ) ) ( not ( = ?AUTO_665 ?AUTO_664 ) ) ( not ( = ?AUTO_665 ?AUTO_666 ) ) ( not ( = ?AUTO_662 ?AUTO_664 ) ) ( not ( = ?AUTO_662 ?AUTO_666 ) ) ( not ( = ?AUTO_663 ?AUTO_664 ) ) ( not ( = ?AUTO_663 ?AUTO_666 ) ) ( not ( = ?AUTO_664 ?AUTO_666 ) ) ( ON ?AUTO_664 ?AUTO_661 ) ( ON ?AUTO_663 ?AUTO_664 ) ( ON-TABLE ?AUTO_662 ) ( CLEAR ?AUTO_662 ) ( ON ?AUTO_660 ?AUTO_663 ) ( CLEAR ?AUTO_660 ) ( HOLDING ?AUTO_667 ) ( not ( = ?AUTO_660 ?AUTO_667 ) ) ( not ( = ?AUTO_661 ?AUTO_667 ) ) ( not ( = ?AUTO_665 ?AUTO_667 ) ) ( not ( = ?AUTO_662 ?AUTO_667 ) ) ( not ( = ?AUTO_663 ?AUTO_667 ) ) ( not ( = ?AUTO_666 ?AUTO_667 ) ) ( not ( = ?AUTO_664 ?AUTO_667 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_667 )
      ( MAKE-ON ?AUTO_660 ?AUTO_661 )
      ( MAKE-ON-VERIFY ?AUTO_660 ?AUTO_661 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_668 - BLOCK
      ?AUTO_669 - BLOCK
    )
    :vars
    (
      ?AUTO_670 - BLOCK
      ?AUTO_671 - BLOCK
      ?AUTO_672 - BLOCK
      ?AUTO_675 - BLOCK
      ?AUTO_673 - BLOCK
      ?AUTO_674 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_668 ?AUTO_669 ) ) ( CLEAR ?AUTO_670 ) ( not ( = ?AUTO_668 ?AUTO_671 ) ) ( not ( = ?AUTO_668 ?AUTO_670 ) ) ( not ( = ?AUTO_669 ?AUTO_671 ) ) ( not ( = ?AUTO_669 ?AUTO_670 ) ) ( not ( = ?AUTO_671 ?AUTO_670 ) ) ( not ( = ?AUTO_668 ?AUTO_672 ) ) ( not ( = ?AUTO_669 ?AUTO_672 ) ) ( not ( = ?AUTO_670 ?AUTO_672 ) ) ( not ( = ?AUTO_671 ?AUTO_672 ) ) ( CLEAR ?AUTO_675 ) ( not ( = ?AUTO_668 ?AUTO_673 ) ) ( not ( = ?AUTO_668 ?AUTO_675 ) ) ( not ( = ?AUTO_669 ?AUTO_673 ) ) ( not ( = ?AUTO_669 ?AUTO_675 ) ) ( not ( = ?AUTO_670 ?AUTO_673 ) ) ( not ( = ?AUTO_670 ?AUTO_675 ) ) ( not ( = ?AUTO_671 ?AUTO_673 ) ) ( not ( = ?AUTO_671 ?AUTO_675 ) ) ( not ( = ?AUTO_672 ?AUTO_673 ) ) ( not ( = ?AUTO_672 ?AUTO_675 ) ) ( not ( = ?AUTO_673 ?AUTO_675 ) ) ( ON ?AUTO_673 ?AUTO_669 ) ( ON ?AUTO_672 ?AUTO_673 ) ( ON-TABLE ?AUTO_671 ) ( CLEAR ?AUTO_671 ) ( ON ?AUTO_668 ?AUTO_672 ) ( not ( = ?AUTO_668 ?AUTO_674 ) ) ( not ( = ?AUTO_669 ?AUTO_674 ) ) ( not ( = ?AUTO_670 ?AUTO_674 ) ) ( not ( = ?AUTO_671 ?AUTO_674 ) ) ( not ( = ?AUTO_672 ?AUTO_674 ) ) ( not ( = ?AUTO_675 ?AUTO_674 ) ) ( not ( = ?AUTO_673 ?AUTO_674 ) ) ( ON ?AUTO_674 ?AUTO_668 ) ( CLEAR ?AUTO_674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_674 ?AUTO_668 )
      ( MAKE-ON ?AUTO_668 ?AUTO_669 )
      ( MAKE-ON-VERIFY ?AUTO_668 ?AUTO_669 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_676 - BLOCK
      ?AUTO_677 - BLOCK
    )
    :vars
    (
      ?AUTO_678 - BLOCK
      ?AUTO_679 - BLOCK
      ?AUTO_683 - BLOCK
      ?AUTO_680 - BLOCK
      ?AUTO_682 - BLOCK
      ?AUTO_681 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_676 ?AUTO_677 ) ) ( not ( = ?AUTO_676 ?AUTO_678 ) ) ( not ( = ?AUTO_676 ?AUTO_679 ) ) ( not ( = ?AUTO_677 ?AUTO_678 ) ) ( not ( = ?AUTO_677 ?AUTO_679 ) ) ( not ( = ?AUTO_678 ?AUTO_679 ) ) ( not ( = ?AUTO_676 ?AUTO_683 ) ) ( not ( = ?AUTO_677 ?AUTO_683 ) ) ( not ( = ?AUTO_679 ?AUTO_683 ) ) ( not ( = ?AUTO_678 ?AUTO_683 ) ) ( CLEAR ?AUTO_680 ) ( not ( = ?AUTO_676 ?AUTO_682 ) ) ( not ( = ?AUTO_676 ?AUTO_680 ) ) ( not ( = ?AUTO_677 ?AUTO_682 ) ) ( not ( = ?AUTO_677 ?AUTO_680 ) ) ( not ( = ?AUTO_679 ?AUTO_682 ) ) ( not ( = ?AUTO_679 ?AUTO_680 ) ) ( not ( = ?AUTO_678 ?AUTO_682 ) ) ( not ( = ?AUTO_678 ?AUTO_680 ) ) ( not ( = ?AUTO_683 ?AUTO_682 ) ) ( not ( = ?AUTO_683 ?AUTO_680 ) ) ( not ( = ?AUTO_682 ?AUTO_680 ) ) ( ON ?AUTO_682 ?AUTO_677 ) ( ON ?AUTO_683 ?AUTO_682 ) ( ON-TABLE ?AUTO_678 ) ( CLEAR ?AUTO_678 ) ( ON ?AUTO_676 ?AUTO_683 ) ( not ( = ?AUTO_676 ?AUTO_681 ) ) ( not ( = ?AUTO_677 ?AUTO_681 ) ) ( not ( = ?AUTO_679 ?AUTO_681 ) ) ( not ( = ?AUTO_678 ?AUTO_681 ) ) ( not ( = ?AUTO_683 ?AUTO_681 ) ) ( not ( = ?AUTO_680 ?AUTO_681 ) ) ( not ( = ?AUTO_682 ?AUTO_681 ) ) ( ON ?AUTO_681 ?AUTO_676 ) ( CLEAR ?AUTO_681 ) ( HOLDING ?AUTO_679 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_679 )
      ( MAKE-ON ?AUTO_676 ?AUTO_677 )
      ( MAKE-ON-VERIFY ?AUTO_676 ?AUTO_677 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_684 - BLOCK
      ?AUTO_685 - BLOCK
    )
    :vars
    (
      ?AUTO_689 - BLOCK
      ?AUTO_687 - BLOCK
      ?AUTO_688 - BLOCK
      ?AUTO_686 - BLOCK
      ?AUTO_690 - BLOCK
      ?AUTO_691 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_684 ?AUTO_685 ) ) ( not ( = ?AUTO_684 ?AUTO_689 ) ) ( not ( = ?AUTO_684 ?AUTO_687 ) ) ( not ( = ?AUTO_685 ?AUTO_689 ) ) ( not ( = ?AUTO_685 ?AUTO_687 ) ) ( not ( = ?AUTO_689 ?AUTO_687 ) ) ( not ( = ?AUTO_684 ?AUTO_688 ) ) ( not ( = ?AUTO_685 ?AUTO_688 ) ) ( not ( = ?AUTO_687 ?AUTO_688 ) ) ( not ( = ?AUTO_689 ?AUTO_688 ) ) ( not ( = ?AUTO_684 ?AUTO_686 ) ) ( not ( = ?AUTO_684 ?AUTO_690 ) ) ( not ( = ?AUTO_685 ?AUTO_686 ) ) ( not ( = ?AUTO_685 ?AUTO_690 ) ) ( not ( = ?AUTO_687 ?AUTO_686 ) ) ( not ( = ?AUTO_687 ?AUTO_690 ) ) ( not ( = ?AUTO_689 ?AUTO_686 ) ) ( not ( = ?AUTO_689 ?AUTO_690 ) ) ( not ( = ?AUTO_688 ?AUTO_686 ) ) ( not ( = ?AUTO_688 ?AUTO_690 ) ) ( not ( = ?AUTO_686 ?AUTO_690 ) ) ( ON ?AUTO_686 ?AUTO_685 ) ( ON ?AUTO_688 ?AUTO_686 ) ( ON-TABLE ?AUTO_689 ) ( CLEAR ?AUTO_689 ) ( ON ?AUTO_684 ?AUTO_688 ) ( not ( = ?AUTO_684 ?AUTO_691 ) ) ( not ( = ?AUTO_685 ?AUTO_691 ) ) ( not ( = ?AUTO_687 ?AUTO_691 ) ) ( not ( = ?AUTO_689 ?AUTO_691 ) ) ( not ( = ?AUTO_688 ?AUTO_691 ) ) ( not ( = ?AUTO_690 ?AUTO_691 ) ) ( not ( = ?AUTO_686 ?AUTO_691 ) ) ( ON ?AUTO_691 ?AUTO_684 ) ( CLEAR ?AUTO_691 ) ( ON ?AUTO_687 ?AUTO_690 ) ( CLEAR ?AUTO_687 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_687 ?AUTO_690 )
      ( MAKE-ON ?AUTO_684 ?AUTO_685 )
      ( MAKE-ON-VERIFY ?AUTO_684 ?AUTO_685 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_694 - BLOCK
      ?AUTO_695 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_694 ) ( CLEAR ?AUTO_695 ) ( not ( = ?AUTO_694 ?AUTO_695 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_694 ?AUTO_695 )
      ( MAKE-ON-VERIFY ?AUTO_694 ?AUTO_695 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_696 - BLOCK
      ?AUTO_697 - BLOCK
    )
    :vars
    (
      ?AUTO_698 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_697 ) ( not ( = ?AUTO_696 ?AUTO_697 ) ) ( ON ?AUTO_696 ?AUTO_698 ) ( CLEAR ?AUTO_696 ) ( HAND-EMPTY ) ( not ( = ?AUTO_696 ?AUTO_698 ) ) ( not ( = ?AUTO_697 ?AUTO_698 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_696 ?AUTO_698 )
      ( MAKE-ON ?AUTO_696 ?AUTO_697 )
      ( MAKE-ON-VERIFY ?AUTO_696 ?AUTO_697 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_699 - BLOCK
      ?AUTO_700 - BLOCK
    )
    :vars
    (
      ?AUTO_701 - BLOCK
      ?AUTO_702 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_699 ?AUTO_700 ) ) ( ON ?AUTO_699 ?AUTO_701 ) ( CLEAR ?AUTO_699 ) ( not ( = ?AUTO_699 ?AUTO_701 ) ) ( not ( = ?AUTO_700 ?AUTO_701 ) ) ( HOLDING ?AUTO_700 ) ( CLEAR ?AUTO_702 ) ( not ( = ?AUTO_699 ?AUTO_702 ) ) ( not ( = ?AUTO_700 ?AUTO_702 ) ) ( not ( = ?AUTO_701 ?AUTO_702 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_700 ?AUTO_702 )
      ( MAKE-ON ?AUTO_699 ?AUTO_700 )
      ( MAKE-ON-VERIFY ?AUTO_699 ?AUTO_700 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_771 - BLOCK
      ?AUTO_772 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_771 ) ( CLEAR ?AUTO_772 ) ( not ( = ?AUTO_771 ?AUTO_772 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_771 ?AUTO_772 )
      ( MAKE-ON-VERIFY ?AUTO_771 ?AUTO_772 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_773 - BLOCK
      ?AUTO_774 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_774 ) ( not ( = ?AUTO_773 ?AUTO_774 ) ) ( ON-TABLE ?AUTO_773 ) ( CLEAR ?AUTO_773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_773 )
      ( MAKE-ON ?AUTO_773 ?AUTO_774 )
      ( MAKE-ON-VERIFY ?AUTO_773 ?AUTO_774 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_775 - BLOCK
      ?AUTO_776 - BLOCK
    )
    :vars
    (
      ?AUTO_777 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_775 ?AUTO_776 ) ) ( ON-TABLE ?AUTO_775 ) ( CLEAR ?AUTO_775 ) ( HOLDING ?AUTO_776 ) ( CLEAR ?AUTO_777 ) ( not ( = ?AUTO_775 ?AUTO_777 ) ) ( not ( = ?AUTO_776 ?AUTO_777 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_776 ?AUTO_777 )
      ( MAKE-ON ?AUTO_775 ?AUTO_776 )
      ( MAKE-ON-VERIFY ?AUTO_775 ?AUTO_776 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_780 - BLOCK
      ?AUTO_781 - BLOCK
    )
    :vars
    (
      ?AUTO_782 - BLOCK
      ?AUTO_783 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_781 ) ( not ( = ?AUTO_780 ?AUTO_781 ) ) ( ON-TABLE ?AUTO_780 ) ( CLEAR ?AUTO_780 ) ( HOLDING ?AUTO_782 ) ( CLEAR ?AUTO_783 ) ( not ( = ?AUTO_780 ?AUTO_782 ) ) ( not ( = ?AUTO_780 ?AUTO_783 ) ) ( not ( = ?AUTO_781 ?AUTO_782 ) ) ( not ( = ?AUTO_781 ?AUTO_783 ) ) ( not ( = ?AUTO_782 ?AUTO_783 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_782 ?AUTO_783 )
      ( MAKE-ON ?AUTO_780 ?AUTO_781 )
      ( MAKE-ON-VERIFY ?AUTO_780 ?AUTO_781 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_785 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_785 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_785 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_785 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_786 - BLOCK
    )
    :vars
    (
      ?AUTO_787 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_786 ?AUTO_787 ) ( CLEAR ?AUTO_786 ) ( HAND-EMPTY ) ( not ( = ?AUTO_786 ?AUTO_787 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_786 ?AUTO_787 )
      ( MAKE-ON-TABLE ?AUTO_786 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_786 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_789 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_789 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_789 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_789 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_790 - BLOCK
    )
    :vars
    (
      ?AUTO_791 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_790 ?AUTO_791 ) ( CLEAR ?AUTO_790 ) ( HAND-EMPTY ) ( not ( = ?AUTO_790 ?AUTO_791 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_790 ?AUTO_791 )
      ( MAKE-ON-TABLE ?AUTO_790 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_790 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_792 - BLOCK
    )
    :vars
    (
      ?AUTO_793 - BLOCK
      ?AUTO_794 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_792 ?AUTO_793 ) ( CLEAR ?AUTO_792 ) ( not ( = ?AUTO_792 ?AUTO_793 ) ) ( HOLDING ?AUTO_794 ) ( not ( = ?AUTO_792 ?AUTO_794 ) ) ( not ( = ?AUTO_793 ?AUTO_794 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_794 )
      ( MAKE-ON-TABLE ?AUTO_792 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_792 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_798 - BLOCK
      ?AUTO_799 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_798 ) ( CLEAR ?AUTO_799 ) ( not ( = ?AUTO_798 ?AUTO_799 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_798 ?AUTO_799 )
      ( MAKE-ON-VERIFY ?AUTO_798 ?AUTO_799 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_800 - BLOCK
      ?AUTO_801 - BLOCK
    )
    :vars
    (
      ?AUTO_802 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_801 ) ( not ( = ?AUTO_800 ?AUTO_801 ) ) ( ON ?AUTO_800 ?AUTO_802 ) ( CLEAR ?AUTO_800 ) ( HAND-EMPTY ) ( not ( = ?AUTO_800 ?AUTO_802 ) ) ( not ( = ?AUTO_801 ?AUTO_802 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_800 ?AUTO_802 )
      ( MAKE-ON ?AUTO_800 ?AUTO_801 )
      ( MAKE-ON-VERIFY ?AUTO_800 ?AUTO_801 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_803 - BLOCK
      ?AUTO_804 - BLOCK
    )
    :vars
    (
      ?AUTO_805 - BLOCK
      ?AUTO_806 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_804 ) ( not ( = ?AUTO_803 ?AUTO_804 ) ) ( ON ?AUTO_803 ?AUTO_805 ) ( CLEAR ?AUTO_803 ) ( not ( = ?AUTO_803 ?AUTO_805 ) ) ( not ( = ?AUTO_804 ?AUTO_805 ) ) ( HOLDING ?AUTO_806 ) ( not ( = ?AUTO_803 ?AUTO_806 ) ) ( not ( = ?AUTO_804 ?AUTO_806 ) ) ( not ( = ?AUTO_805 ?AUTO_806 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_806 )
      ( MAKE-ON ?AUTO_803 ?AUTO_804 )
      ( MAKE-ON-VERIFY ?AUTO_803 ?AUTO_804 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_807 - BLOCK
      ?AUTO_808 - BLOCK
    )
    :vars
    (
      ?AUTO_809 - BLOCK
      ?AUTO_810 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_808 ) ( not ( = ?AUTO_807 ?AUTO_808 ) ) ( ON ?AUTO_807 ?AUTO_809 ) ( not ( = ?AUTO_807 ?AUTO_809 ) ) ( not ( = ?AUTO_808 ?AUTO_809 ) ) ( not ( = ?AUTO_807 ?AUTO_810 ) ) ( not ( = ?AUTO_808 ?AUTO_810 ) ) ( not ( = ?AUTO_809 ?AUTO_810 ) ) ( ON ?AUTO_810 ?AUTO_807 ) ( CLEAR ?AUTO_810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_810 ?AUTO_807 )
      ( MAKE-ON ?AUTO_807 ?AUTO_808 )
      ( MAKE-ON-VERIFY ?AUTO_807 ?AUTO_808 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_811 - BLOCK
      ?AUTO_812 - BLOCK
    )
    :vars
    (
      ?AUTO_813 - BLOCK
      ?AUTO_814 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_811 ?AUTO_812 ) ) ( ON ?AUTO_811 ?AUTO_813 ) ( not ( = ?AUTO_811 ?AUTO_813 ) ) ( not ( = ?AUTO_812 ?AUTO_813 ) ) ( not ( = ?AUTO_811 ?AUTO_814 ) ) ( not ( = ?AUTO_812 ?AUTO_814 ) ) ( not ( = ?AUTO_813 ?AUTO_814 ) ) ( ON ?AUTO_814 ?AUTO_811 ) ( CLEAR ?AUTO_814 ) ( HOLDING ?AUTO_812 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_812 )
      ( MAKE-ON ?AUTO_811 ?AUTO_812 )
      ( MAKE-ON-VERIFY ?AUTO_811 ?AUTO_812 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_818 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_818 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_818 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_818 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_819 - BLOCK
    )
    :vars
    (
      ?AUTO_820 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_819 ?AUTO_820 ) ( CLEAR ?AUTO_819 ) ( HAND-EMPTY ) ( not ( = ?AUTO_819 ?AUTO_820 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_819 ?AUTO_820 )
      ( MAKE-ON-TABLE ?AUTO_819 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_819 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_821 - BLOCK
    )
    :vars
    (
      ?AUTO_822 - BLOCK
      ?AUTO_823 - BLOCK
      ?AUTO_824 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_821 ?AUTO_822 ) ( CLEAR ?AUTO_821 ) ( not ( = ?AUTO_821 ?AUTO_822 ) ) ( HOLDING ?AUTO_823 ) ( CLEAR ?AUTO_824 ) ( not ( = ?AUTO_821 ?AUTO_823 ) ) ( not ( = ?AUTO_821 ?AUTO_824 ) ) ( not ( = ?AUTO_822 ?AUTO_823 ) ) ( not ( = ?AUTO_822 ?AUTO_824 ) ) ( not ( = ?AUTO_823 ?AUTO_824 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_823 ?AUTO_824 )
      ( MAKE-ON-TABLE ?AUTO_821 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_821 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_825 - BLOCK
    )
    :vars
    (
      ?AUTO_826 - BLOCK
      ?AUTO_828 - BLOCK
      ?AUTO_827 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_825 ?AUTO_826 ) ( not ( = ?AUTO_825 ?AUTO_826 ) ) ( CLEAR ?AUTO_828 ) ( not ( = ?AUTO_825 ?AUTO_827 ) ) ( not ( = ?AUTO_825 ?AUTO_828 ) ) ( not ( = ?AUTO_826 ?AUTO_827 ) ) ( not ( = ?AUTO_826 ?AUTO_828 ) ) ( not ( = ?AUTO_827 ?AUTO_828 ) ) ( ON ?AUTO_827 ?AUTO_825 ) ( CLEAR ?AUTO_827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_827 ?AUTO_825 )
      ( MAKE-ON-TABLE ?AUTO_825 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_825 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_829 - BLOCK
    )
    :vars
    (
      ?AUTO_830 - BLOCK
      ?AUTO_832 - BLOCK
      ?AUTO_831 - BLOCK
      ?AUTO_833 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_829 ?AUTO_830 ) ( not ( = ?AUTO_829 ?AUTO_830 ) ) ( CLEAR ?AUTO_832 ) ( not ( = ?AUTO_829 ?AUTO_831 ) ) ( not ( = ?AUTO_829 ?AUTO_832 ) ) ( not ( = ?AUTO_830 ?AUTO_831 ) ) ( not ( = ?AUTO_830 ?AUTO_832 ) ) ( not ( = ?AUTO_831 ?AUTO_832 ) ) ( ON ?AUTO_831 ?AUTO_829 ) ( CLEAR ?AUTO_831 ) ( HOLDING ?AUTO_833 ) ( not ( = ?AUTO_829 ?AUTO_833 ) ) ( not ( = ?AUTO_830 ?AUTO_833 ) ) ( not ( = ?AUTO_832 ?AUTO_833 ) ) ( not ( = ?AUTO_831 ?AUTO_833 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_833 )
      ( MAKE-ON-TABLE ?AUTO_829 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_829 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_834 - BLOCK
    )
    :vars
    (
      ?AUTO_835 - BLOCK
      ?AUTO_838 - BLOCK
      ?AUTO_836 - BLOCK
      ?AUTO_837 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_834 ?AUTO_835 ) ( not ( = ?AUTO_834 ?AUTO_835 ) ) ( CLEAR ?AUTO_838 ) ( not ( = ?AUTO_834 ?AUTO_836 ) ) ( not ( = ?AUTO_834 ?AUTO_838 ) ) ( not ( = ?AUTO_835 ?AUTO_836 ) ) ( not ( = ?AUTO_835 ?AUTO_838 ) ) ( not ( = ?AUTO_836 ?AUTO_838 ) ) ( ON ?AUTO_836 ?AUTO_834 ) ( not ( = ?AUTO_834 ?AUTO_837 ) ) ( not ( = ?AUTO_835 ?AUTO_837 ) ) ( not ( = ?AUTO_838 ?AUTO_837 ) ) ( not ( = ?AUTO_836 ?AUTO_837 ) ) ( ON ?AUTO_837 ?AUTO_836 ) ( CLEAR ?AUTO_837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_837 ?AUTO_836 )
      ( MAKE-ON-TABLE ?AUTO_834 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_834 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_839 - BLOCK
    )
    :vars
    (
      ?AUTO_843 - BLOCK
      ?AUTO_842 - BLOCK
      ?AUTO_841 - BLOCK
      ?AUTO_840 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_839 ?AUTO_843 ) ( not ( = ?AUTO_839 ?AUTO_843 ) ) ( not ( = ?AUTO_839 ?AUTO_842 ) ) ( not ( = ?AUTO_839 ?AUTO_841 ) ) ( not ( = ?AUTO_843 ?AUTO_842 ) ) ( not ( = ?AUTO_843 ?AUTO_841 ) ) ( not ( = ?AUTO_842 ?AUTO_841 ) ) ( ON ?AUTO_842 ?AUTO_839 ) ( not ( = ?AUTO_839 ?AUTO_840 ) ) ( not ( = ?AUTO_843 ?AUTO_840 ) ) ( not ( = ?AUTO_841 ?AUTO_840 ) ) ( not ( = ?AUTO_842 ?AUTO_840 ) ) ( ON ?AUTO_840 ?AUTO_842 ) ( CLEAR ?AUTO_840 ) ( HOLDING ?AUTO_841 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_841 )
      ( MAKE-ON-TABLE ?AUTO_839 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_839 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_847 - BLOCK
      ?AUTO_848 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_847 ) ( CLEAR ?AUTO_848 ) ( not ( = ?AUTO_847 ?AUTO_848 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_847 ?AUTO_848 )
      ( MAKE-ON-VERIFY ?AUTO_847 ?AUTO_848 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_849 - BLOCK
      ?AUTO_850 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_850 ) ( not ( = ?AUTO_849 ?AUTO_850 ) ) ( ON-TABLE ?AUTO_849 ) ( CLEAR ?AUTO_849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_849 )
      ( MAKE-ON ?AUTO_849 ?AUTO_850 )
      ( MAKE-ON-VERIFY ?AUTO_849 ?AUTO_850 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_851 - BLOCK
      ?AUTO_852 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_851 ?AUTO_852 ) ) ( ON-TABLE ?AUTO_851 ) ( CLEAR ?AUTO_851 ) ( HOLDING ?AUTO_852 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_852 )
      ( MAKE-ON ?AUTO_851 ?AUTO_852 )
      ( MAKE-ON-VERIFY ?AUTO_851 ?AUTO_852 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_853 - BLOCK
      ?AUTO_854 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_853 ?AUTO_854 ) ) ( ON-TABLE ?AUTO_853 ) ( ON ?AUTO_854 ?AUTO_853 ) ( CLEAR ?AUTO_854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_854 ?AUTO_853 )
      ( MAKE-ON ?AUTO_853 ?AUTO_854 )
      ( MAKE-ON-VERIFY ?AUTO_853 ?AUTO_854 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_855 - BLOCK
      ?AUTO_856 - BLOCK
    )
    :vars
    (
      ?AUTO_857 - BLOCK
      ?AUTO_858 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_855 ?AUTO_856 ) ) ( ON-TABLE ?AUTO_855 ) ( ON ?AUTO_856 ?AUTO_855 ) ( CLEAR ?AUTO_856 ) ( HOLDING ?AUTO_857 ) ( CLEAR ?AUTO_858 ) ( not ( = ?AUTO_855 ?AUTO_857 ) ) ( not ( = ?AUTO_855 ?AUTO_858 ) ) ( not ( = ?AUTO_856 ?AUTO_857 ) ) ( not ( = ?AUTO_856 ?AUTO_858 ) ) ( not ( = ?AUTO_857 ?AUTO_858 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_857 ?AUTO_858 )
      ( MAKE-ON ?AUTO_855 ?AUTO_856 )
      ( MAKE-ON-VERIFY ?AUTO_855 ?AUTO_856 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_859 - BLOCK
      ?AUTO_860 - BLOCK
    )
    :vars
    (
      ?AUTO_861 - BLOCK
      ?AUTO_862 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_859 ?AUTO_860 ) ) ( ON-TABLE ?AUTO_859 ) ( ON ?AUTO_860 ?AUTO_859 ) ( CLEAR ?AUTO_861 ) ( not ( = ?AUTO_859 ?AUTO_862 ) ) ( not ( = ?AUTO_859 ?AUTO_861 ) ) ( not ( = ?AUTO_860 ?AUTO_862 ) ) ( not ( = ?AUTO_860 ?AUTO_861 ) ) ( not ( = ?AUTO_862 ?AUTO_861 ) ) ( ON ?AUTO_862 ?AUTO_860 ) ( CLEAR ?AUTO_862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_862 ?AUTO_860 )
      ( MAKE-ON ?AUTO_859 ?AUTO_860 )
      ( MAKE-ON-VERIFY ?AUTO_859 ?AUTO_860 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_863 - BLOCK
      ?AUTO_864 - BLOCK
    )
    :vars
    (
      ?AUTO_866 - BLOCK
      ?AUTO_865 - BLOCK
      ?AUTO_867 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_863 ?AUTO_864 ) ) ( ON-TABLE ?AUTO_863 ) ( ON ?AUTO_864 ?AUTO_863 ) ( CLEAR ?AUTO_866 ) ( not ( = ?AUTO_863 ?AUTO_865 ) ) ( not ( = ?AUTO_863 ?AUTO_866 ) ) ( not ( = ?AUTO_864 ?AUTO_865 ) ) ( not ( = ?AUTO_864 ?AUTO_866 ) ) ( not ( = ?AUTO_865 ?AUTO_866 ) ) ( ON ?AUTO_865 ?AUTO_864 ) ( CLEAR ?AUTO_865 ) ( HOLDING ?AUTO_867 ) ( not ( = ?AUTO_863 ?AUTO_867 ) ) ( not ( = ?AUTO_864 ?AUTO_867 ) ) ( not ( = ?AUTO_866 ?AUTO_867 ) ) ( not ( = ?AUTO_865 ?AUTO_867 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_867 )
      ( MAKE-ON ?AUTO_863 ?AUTO_864 )
      ( MAKE-ON-VERIFY ?AUTO_863 ?AUTO_864 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_868 - BLOCK
      ?AUTO_869 - BLOCK
    )
    :vars
    (
      ?AUTO_870 - BLOCK
      ?AUTO_871 - BLOCK
      ?AUTO_872 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_868 ?AUTO_869 ) ) ( ON-TABLE ?AUTO_868 ) ( ON ?AUTO_869 ?AUTO_868 ) ( CLEAR ?AUTO_870 ) ( not ( = ?AUTO_868 ?AUTO_871 ) ) ( not ( = ?AUTO_868 ?AUTO_870 ) ) ( not ( = ?AUTO_869 ?AUTO_871 ) ) ( not ( = ?AUTO_869 ?AUTO_870 ) ) ( not ( = ?AUTO_871 ?AUTO_870 ) ) ( ON ?AUTO_871 ?AUTO_869 ) ( not ( = ?AUTO_868 ?AUTO_872 ) ) ( not ( = ?AUTO_869 ?AUTO_872 ) ) ( not ( = ?AUTO_870 ?AUTO_872 ) ) ( not ( = ?AUTO_871 ?AUTO_872 ) ) ( ON ?AUTO_872 ?AUTO_871 ) ( CLEAR ?AUTO_872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_872 ?AUTO_871 )
      ( MAKE-ON ?AUTO_868 ?AUTO_869 )
      ( MAKE-ON-VERIFY ?AUTO_868 ?AUTO_869 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_873 - BLOCK
      ?AUTO_874 - BLOCK
    )
    :vars
    (
      ?AUTO_876 - BLOCK
      ?AUTO_875 - BLOCK
      ?AUTO_877 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_873 ?AUTO_874 ) ) ( ON-TABLE ?AUTO_873 ) ( ON ?AUTO_874 ?AUTO_873 ) ( not ( = ?AUTO_873 ?AUTO_876 ) ) ( not ( = ?AUTO_873 ?AUTO_875 ) ) ( not ( = ?AUTO_874 ?AUTO_876 ) ) ( not ( = ?AUTO_874 ?AUTO_875 ) ) ( not ( = ?AUTO_876 ?AUTO_875 ) ) ( ON ?AUTO_876 ?AUTO_874 ) ( not ( = ?AUTO_873 ?AUTO_877 ) ) ( not ( = ?AUTO_874 ?AUTO_877 ) ) ( not ( = ?AUTO_875 ?AUTO_877 ) ) ( not ( = ?AUTO_876 ?AUTO_877 ) ) ( ON ?AUTO_877 ?AUTO_876 ) ( CLEAR ?AUTO_877 ) ( HOLDING ?AUTO_875 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_875 )
      ( MAKE-ON ?AUTO_873 ?AUTO_874 )
      ( MAKE-ON-VERIFY ?AUTO_873 ?AUTO_874 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_882 - BLOCK
      ?AUTO_883 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_882 ) ( CLEAR ?AUTO_883 ) ( not ( = ?AUTO_882 ?AUTO_883 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_882 ?AUTO_883 )
      ( MAKE-ON-VERIFY ?AUTO_882 ?AUTO_883 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_884 - BLOCK
      ?AUTO_885 - BLOCK
    )
    :vars
    (
      ?AUTO_886 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_885 ) ( not ( = ?AUTO_884 ?AUTO_885 ) ) ( ON ?AUTO_884 ?AUTO_886 ) ( CLEAR ?AUTO_884 ) ( HAND-EMPTY ) ( not ( = ?AUTO_884 ?AUTO_886 ) ) ( not ( = ?AUTO_885 ?AUTO_886 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_884 ?AUTO_886 )
      ( MAKE-ON ?AUTO_884 ?AUTO_885 )
      ( MAKE-ON-VERIFY ?AUTO_884 ?AUTO_885 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_887 - BLOCK
      ?AUTO_888 - BLOCK
    )
    :vars
    (
      ?AUTO_889 - BLOCK
      ?AUTO_890 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_887 ?AUTO_888 ) ) ( ON ?AUTO_887 ?AUTO_889 ) ( CLEAR ?AUTO_887 ) ( not ( = ?AUTO_887 ?AUTO_889 ) ) ( not ( = ?AUTO_888 ?AUTO_889 ) ) ( HOLDING ?AUTO_888 ) ( CLEAR ?AUTO_890 ) ( not ( = ?AUTO_887 ?AUTO_890 ) ) ( not ( = ?AUTO_888 ?AUTO_890 ) ) ( not ( = ?AUTO_889 ?AUTO_890 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_888 ?AUTO_890 )
      ( MAKE-ON ?AUTO_887 ?AUTO_888 )
      ( MAKE-ON-VERIFY ?AUTO_887 ?AUTO_888 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_893 - BLOCK
      ?AUTO_894 - BLOCK
    )
    :vars
    (
      ?AUTO_895 - BLOCK
      ?AUTO_896 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_894 ) ( not ( = ?AUTO_893 ?AUTO_894 ) ) ( ON ?AUTO_893 ?AUTO_895 ) ( CLEAR ?AUTO_893 ) ( not ( = ?AUTO_893 ?AUTO_895 ) ) ( not ( = ?AUTO_894 ?AUTO_895 ) ) ( HOLDING ?AUTO_896 ) ( not ( = ?AUTO_893 ?AUTO_896 ) ) ( not ( = ?AUTO_894 ?AUTO_896 ) ) ( not ( = ?AUTO_895 ?AUTO_896 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_896 )
      ( MAKE-ON ?AUTO_893 ?AUTO_894 )
      ( MAKE-ON-VERIFY ?AUTO_893 ?AUTO_894 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_897 - BLOCK
      ?AUTO_898 - BLOCK
    )
    :vars
    (
      ?AUTO_899 - BLOCK
      ?AUTO_900 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_897 ?AUTO_898 ) ) ( ON ?AUTO_897 ?AUTO_899 ) ( CLEAR ?AUTO_897 ) ( not ( = ?AUTO_897 ?AUTO_899 ) ) ( not ( = ?AUTO_898 ?AUTO_899 ) ) ( not ( = ?AUTO_897 ?AUTO_900 ) ) ( not ( = ?AUTO_898 ?AUTO_900 ) ) ( not ( = ?AUTO_899 ?AUTO_900 ) ) ( ON ?AUTO_900 ?AUTO_898 ) ( CLEAR ?AUTO_900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_900 ?AUTO_898 )
      ( MAKE-ON ?AUTO_897 ?AUTO_898 )
      ( MAKE-ON-VERIFY ?AUTO_897 ?AUTO_898 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_901 - BLOCK
      ?AUTO_902 - BLOCK
    )
    :vars
    (
      ?AUTO_903 - BLOCK
      ?AUTO_904 - BLOCK
      ?AUTO_905 - BLOCK
      ?AUTO_906 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_901 ?AUTO_902 ) ) ( ON ?AUTO_901 ?AUTO_903 ) ( CLEAR ?AUTO_901 ) ( not ( = ?AUTO_901 ?AUTO_903 ) ) ( not ( = ?AUTO_902 ?AUTO_903 ) ) ( not ( = ?AUTO_901 ?AUTO_904 ) ) ( not ( = ?AUTO_902 ?AUTO_904 ) ) ( not ( = ?AUTO_903 ?AUTO_904 ) ) ( ON ?AUTO_904 ?AUTO_902 ) ( CLEAR ?AUTO_904 ) ( HOLDING ?AUTO_905 ) ( CLEAR ?AUTO_906 ) ( not ( = ?AUTO_901 ?AUTO_905 ) ) ( not ( = ?AUTO_901 ?AUTO_906 ) ) ( not ( = ?AUTO_902 ?AUTO_905 ) ) ( not ( = ?AUTO_902 ?AUTO_906 ) ) ( not ( = ?AUTO_903 ?AUTO_905 ) ) ( not ( = ?AUTO_903 ?AUTO_906 ) ) ( not ( = ?AUTO_904 ?AUTO_905 ) ) ( not ( = ?AUTO_904 ?AUTO_906 ) ) ( not ( = ?AUTO_905 ?AUTO_906 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_905 ?AUTO_906 )
      ( MAKE-ON ?AUTO_901 ?AUTO_902 )
      ( MAKE-ON-VERIFY ?AUTO_901 ?AUTO_902 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_907 - BLOCK
      ?AUTO_908 - BLOCK
    )
    :vars
    (
      ?AUTO_911 - BLOCK
      ?AUTO_910 - BLOCK
      ?AUTO_912 - BLOCK
      ?AUTO_909 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_907 ?AUTO_908 ) ) ( ON ?AUTO_907 ?AUTO_911 ) ( CLEAR ?AUTO_907 ) ( not ( = ?AUTO_907 ?AUTO_911 ) ) ( not ( = ?AUTO_908 ?AUTO_911 ) ) ( not ( = ?AUTO_907 ?AUTO_910 ) ) ( not ( = ?AUTO_908 ?AUTO_910 ) ) ( not ( = ?AUTO_911 ?AUTO_910 ) ) ( ON ?AUTO_910 ?AUTO_908 ) ( CLEAR ?AUTO_912 ) ( not ( = ?AUTO_907 ?AUTO_909 ) ) ( not ( = ?AUTO_907 ?AUTO_912 ) ) ( not ( = ?AUTO_908 ?AUTO_909 ) ) ( not ( = ?AUTO_908 ?AUTO_912 ) ) ( not ( = ?AUTO_911 ?AUTO_909 ) ) ( not ( = ?AUTO_911 ?AUTO_912 ) ) ( not ( = ?AUTO_910 ?AUTO_909 ) ) ( not ( = ?AUTO_910 ?AUTO_912 ) ) ( not ( = ?AUTO_909 ?AUTO_912 ) ) ( ON ?AUTO_909 ?AUTO_910 ) ( CLEAR ?AUTO_909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_909 ?AUTO_910 )
      ( MAKE-ON ?AUTO_907 ?AUTO_908 )
      ( MAKE-ON-VERIFY ?AUTO_907 ?AUTO_908 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_913 - BLOCK
      ?AUTO_914 - BLOCK
    )
    :vars
    (
      ?AUTO_917 - BLOCK
      ?AUTO_915 - BLOCK
      ?AUTO_918 - BLOCK
      ?AUTO_916 - BLOCK
      ?AUTO_919 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_913 ?AUTO_914 ) ) ( ON ?AUTO_913 ?AUTO_917 ) ( CLEAR ?AUTO_913 ) ( not ( = ?AUTO_913 ?AUTO_917 ) ) ( not ( = ?AUTO_914 ?AUTO_917 ) ) ( not ( = ?AUTO_913 ?AUTO_915 ) ) ( not ( = ?AUTO_914 ?AUTO_915 ) ) ( not ( = ?AUTO_917 ?AUTO_915 ) ) ( ON ?AUTO_915 ?AUTO_914 ) ( CLEAR ?AUTO_918 ) ( not ( = ?AUTO_913 ?AUTO_916 ) ) ( not ( = ?AUTO_913 ?AUTO_918 ) ) ( not ( = ?AUTO_914 ?AUTO_916 ) ) ( not ( = ?AUTO_914 ?AUTO_918 ) ) ( not ( = ?AUTO_917 ?AUTO_916 ) ) ( not ( = ?AUTO_917 ?AUTO_918 ) ) ( not ( = ?AUTO_915 ?AUTO_916 ) ) ( not ( = ?AUTO_915 ?AUTO_918 ) ) ( not ( = ?AUTO_916 ?AUTO_918 ) ) ( ON ?AUTO_916 ?AUTO_915 ) ( CLEAR ?AUTO_916 ) ( HOLDING ?AUTO_919 ) ( not ( = ?AUTO_913 ?AUTO_919 ) ) ( not ( = ?AUTO_914 ?AUTO_919 ) ) ( not ( = ?AUTO_917 ?AUTO_919 ) ) ( not ( = ?AUTO_915 ?AUTO_919 ) ) ( not ( = ?AUTO_918 ?AUTO_919 ) ) ( not ( = ?AUTO_916 ?AUTO_919 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_919 )
      ( MAKE-ON ?AUTO_913 ?AUTO_914 )
      ( MAKE-ON-VERIFY ?AUTO_913 ?AUTO_914 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_920 - BLOCK
      ?AUTO_921 - BLOCK
    )
    :vars
    (
      ?AUTO_925 - BLOCK
      ?AUTO_924 - BLOCK
      ?AUTO_923 - BLOCK
      ?AUTO_922 - BLOCK
      ?AUTO_926 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_920 ?AUTO_921 ) ) ( ON ?AUTO_920 ?AUTO_925 ) ( CLEAR ?AUTO_920 ) ( not ( = ?AUTO_920 ?AUTO_925 ) ) ( not ( = ?AUTO_921 ?AUTO_925 ) ) ( not ( = ?AUTO_920 ?AUTO_924 ) ) ( not ( = ?AUTO_921 ?AUTO_924 ) ) ( not ( = ?AUTO_925 ?AUTO_924 ) ) ( ON ?AUTO_924 ?AUTO_921 ) ( CLEAR ?AUTO_923 ) ( not ( = ?AUTO_920 ?AUTO_922 ) ) ( not ( = ?AUTO_920 ?AUTO_923 ) ) ( not ( = ?AUTO_921 ?AUTO_922 ) ) ( not ( = ?AUTO_921 ?AUTO_923 ) ) ( not ( = ?AUTO_925 ?AUTO_922 ) ) ( not ( = ?AUTO_925 ?AUTO_923 ) ) ( not ( = ?AUTO_924 ?AUTO_922 ) ) ( not ( = ?AUTO_924 ?AUTO_923 ) ) ( not ( = ?AUTO_922 ?AUTO_923 ) ) ( ON ?AUTO_922 ?AUTO_924 ) ( not ( = ?AUTO_920 ?AUTO_926 ) ) ( not ( = ?AUTO_921 ?AUTO_926 ) ) ( not ( = ?AUTO_925 ?AUTO_926 ) ) ( not ( = ?AUTO_924 ?AUTO_926 ) ) ( not ( = ?AUTO_923 ?AUTO_926 ) ) ( not ( = ?AUTO_922 ?AUTO_926 ) ) ( ON ?AUTO_926 ?AUTO_922 ) ( CLEAR ?AUTO_926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_926 ?AUTO_922 )
      ( MAKE-ON ?AUTO_920 ?AUTO_921 )
      ( MAKE-ON-VERIFY ?AUTO_920 ?AUTO_921 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_927 - BLOCK
      ?AUTO_928 - BLOCK
    )
    :vars
    (
      ?AUTO_933 - BLOCK
      ?AUTO_931 - BLOCK
      ?AUTO_930 - BLOCK
      ?AUTO_929 - BLOCK
      ?AUTO_932 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_927 ?AUTO_928 ) ) ( ON ?AUTO_927 ?AUTO_933 ) ( CLEAR ?AUTO_927 ) ( not ( = ?AUTO_927 ?AUTO_933 ) ) ( not ( = ?AUTO_928 ?AUTO_933 ) ) ( not ( = ?AUTO_927 ?AUTO_931 ) ) ( not ( = ?AUTO_928 ?AUTO_931 ) ) ( not ( = ?AUTO_933 ?AUTO_931 ) ) ( ON ?AUTO_931 ?AUTO_928 ) ( not ( = ?AUTO_927 ?AUTO_930 ) ) ( not ( = ?AUTO_927 ?AUTO_929 ) ) ( not ( = ?AUTO_928 ?AUTO_930 ) ) ( not ( = ?AUTO_928 ?AUTO_929 ) ) ( not ( = ?AUTO_933 ?AUTO_930 ) ) ( not ( = ?AUTO_933 ?AUTO_929 ) ) ( not ( = ?AUTO_931 ?AUTO_930 ) ) ( not ( = ?AUTO_931 ?AUTO_929 ) ) ( not ( = ?AUTO_930 ?AUTO_929 ) ) ( ON ?AUTO_930 ?AUTO_931 ) ( not ( = ?AUTO_927 ?AUTO_932 ) ) ( not ( = ?AUTO_928 ?AUTO_932 ) ) ( not ( = ?AUTO_933 ?AUTO_932 ) ) ( not ( = ?AUTO_931 ?AUTO_932 ) ) ( not ( = ?AUTO_929 ?AUTO_932 ) ) ( not ( = ?AUTO_930 ?AUTO_932 ) ) ( ON ?AUTO_932 ?AUTO_930 ) ( CLEAR ?AUTO_932 ) ( HOLDING ?AUTO_929 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_929 )
      ( MAKE-ON ?AUTO_927 ?AUTO_928 )
      ( MAKE-ON-VERIFY ?AUTO_927 ?AUTO_928 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_934 - BLOCK
      ?AUTO_935 - BLOCK
    )
    :vars
    (
      ?AUTO_939 - BLOCK
      ?AUTO_937 - BLOCK
      ?AUTO_936 - BLOCK
      ?AUTO_938 - BLOCK
      ?AUTO_940 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_934 ?AUTO_935 ) ) ( ON ?AUTO_934 ?AUTO_939 ) ( not ( = ?AUTO_934 ?AUTO_939 ) ) ( not ( = ?AUTO_935 ?AUTO_939 ) ) ( not ( = ?AUTO_934 ?AUTO_937 ) ) ( not ( = ?AUTO_935 ?AUTO_937 ) ) ( not ( = ?AUTO_939 ?AUTO_937 ) ) ( ON ?AUTO_937 ?AUTO_935 ) ( not ( = ?AUTO_934 ?AUTO_936 ) ) ( not ( = ?AUTO_934 ?AUTO_938 ) ) ( not ( = ?AUTO_935 ?AUTO_936 ) ) ( not ( = ?AUTO_935 ?AUTO_938 ) ) ( not ( = ?AUTO_939 ?AUTO_936 ) ) ( not ( = ?AUTO_939 ?AUTO_938 ) ) ( not ( = ?AUTO_937 ?AUTO_936 ) ) ( not ( = ?AUTO_937 ?AUTO_938 ) ) ( not ( = ?AUTO_936 ?AUTO_938 ) ) ( ON ?AUTO_936 ?AUTO_937 ) ( not ( = ?AUTO_934 ?AUTO_940 ) ) ( not ( = ?AUTO_935 ?AUTO_940 ) ) ( not ( = ?AUTO_939 ?AUTO_940 ) ) ( not ( = ?AUTO_937 ?AUTO_940 ) ) ( not ( = ?AUTO_938 ?AUTO_940 ) ) ( not ( = ?AUTO_936 ?AUTO_940 ) ) ( ON ?AUTO_940 ?AUTO_936 ) ( CLEAR ?AUTO_940 ) ( ON ?AUTO_938 ?AUTO_934 ) ( CLEAR ?AUTO_938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_938 ?AUTO_934 )
      ( MAKE-ON ?AUTO_934 ?AUTO_935 )
      ( MAKE-ON-VERIFY ?AUTO_934 ?AUTO_935 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_943 - BLOCK
      ?AUTO_944 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_943 ) ( CLEAR ?AUTO_944 ) ( not ( = ?AUTO_943 ?AUTO_944 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_943 ?AUTO_944 )
      ( MAKE-ON-VERIFY ?AUTO_943 ?AUTO_944 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_945 - BLOCK
      ?AUTO_946 - BLOCK
    )
    :vars
    (
      ?AUTO_947 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_946 ) ( not ( = ?AUTO_945 ?AUTO_946 ) ) ( ON ?AUTO_945 ?AUTO_947 ) ( CLEAR ?AUTO_945 ) ( HAND-EMPTY ) ( not ( = ?AUTO_945 ?AUTO_947 ) ) ( not ( = ?AUTO_946 ?AUTO_947 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_945 ?AUTO_947 )
      ( MAKE-ON ?AUTO_945 ?AUTO_946 )
      ( MAKE-ON-VERIFY ?AUTO_945 ?AUTO_946 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_948 - BLOCK
      ?AUTO_949 - BLOCK
    )
    :vars
    (
      ?AUTO_950 - BLOCK
      ?AUTO_951 - BLOCK
      ?AUTO_952 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_949 ) ( not ( = ?AUTO_948 ?AUTO_949 ) ) ( ON ?AUTO_948 ?AUTO_950 ) ( CLEAR ?AUTO_948 ) ( not ( = ?AUTO_948 ?AUTO_950 ) ) ( not ( = ?AUTO_949 ?AUTO_950 ) ) ( HOLDING ?AUTO_951 ) ( CLEAR ?AUTO_952 ) ( not ( = ?AUTO_948 ?AUTO_951 ) ) ( not ( = ?AUTO_948 ?AUTO_952 ) ) ( not ( = ?AUTO_949 ?AUTO_951 ) ) ( not ( = ?AUTO_949 ?AUTO_952 ) ) ( not ( = ?AUTO_950 ?AUTO_951 ) ) ( not ( = ?AUTO_950 ?AUTO_952 ) ) ( not ( = ?AUTO_951 ?AUTO_952 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_951 ?AUTO_952 )
      ( MAKE-ON ?AUTO_948 ?AUTO_949 )
      ( MAKE-ON-VERIFY ?AUTO_948 ?AUTO_949 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_953 - BLOCK
      ?AUTO_954 - BLOCK
    )
    :vars
    (
      ?AUTO_955 - BLOCK
      ?AUTO_956 - BLOCK
      ?AUTO_957 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_954 ) ( not ( = ?AUTO_953 ?AUTO_954 ) ) ( ON ?AUTO_953 ?AUTO_955 ) ( not ( = ?AUTO_953 ?AUTO_955 ) ) ( not ( = ?AUTO_954 ?AUTO_955 ) ) ( CLEAR ?AUTO_956 ) ( not ( = ?AUTO_953 ?AUTO_957 ) ) ( not ( = ?AUTO_953 ?AUTO_956 ) ) ( not ( = ?AUTO_954 ?AUTO_957 ) ) ( not ( = ?AUTO_954 ?AUTO_956 ) ) ( not ( = ?AUTO_955 ?AUTO_957 ) ) ( not ( = ?AUTO_955 ?AUTO_956 ) ) ( not ( = ?AUTO_957 ?AUTO_956 ) ) ( ON ?AUTO_957 ?AUTO_953 ) ( CLEAR ?AUTO_957 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_957 ?AUTO_953 )
      ( MAKE-ON ?AUTO_953 ?AUTO_954 )
      ( MAKE-ON-VERIFY ?AUTO_953 ?AUTO_954 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_958 - BLOCK
      ?AUTO_959 - BLOCK
    )
    :vars
    (
      ?AUTO_960 - BLOCK
      ?AUTO_961 - BLOCK
      ?AUTO_962 - BLOCK
      ?AUTO_963 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_959 ) ( not ( = ?AUTO_958 ?AUTO_959 ) ) ( ON ?AUTO_958 ?AUTO_960 ) ( not ( = ?AUTO_958 ?AUTO_960 ) ) ( not ( = ?AUTO_959 ?AUTO_960 ) ) ( not ( = ?AUTO_958 ?AUTO_961 ) ) ( not ( = ?AUTO_958 ?AUTO_962 ) ) ( not ( = ?AUTO_959 ?AUTO_961 ) ) ( not ( = ?AUTO_959 ?AUTO_962 ) ) ( not ( = ?AUTO_960 ?AUTO_961 ) ) ( not ( = ?AUTO_960 ?AUTO_962 ) ) ( not ( = ?AUTO_961 ?AUTO_962 ) ) ( ON ?AUTO_961 ?AUTO_958 ) ( CLEAR ?AUTO_961 ) ( HOLDING ?AUTO_962 ) ( CLEAR ?AUTO_963 ) ( not ( = ?AUTO_958 ?AUTO_963 ) ) ( not ( = ?AUTO_959 ?AUTO_963 ) ) ( not ( = ?AUTO_960 ?AUTO_963 ) ) ( not ( = ?AUTO_961 ?AUTO_963 ) ) ( not ( = ?AUTO_962 ?AUTO_963 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_962 ?AUTO_963 )
      ( MAKE-ON ?AUTO_958 ?AUTO_959 )
      ( MAKE-ON-VERIFY ?AUTO_958 ?AUTO_959 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_970 - BLOCK
      ?AUTO_971 - BLOCK
    )
    :vars
    (
      ?AUTO_972 - BLOCK
      ?AUTO_973 - BLOCK
      ?AUTO_974 - BLOCK
      ?AUTO_975 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_970 ?AUTO_971 ) ) ( ON ?AUTO_970 ?AUTO_972 ) ( not ( = ?AUTO_970 ?AUTO_972 ) ) ( not ( = ?AUTO_971 ?AUTO_972 ) ) ( CLEAR ?AUTO_973 ) ( not ( = ?AUTO_970 ?AUTO_974 ) ) ( not ( = ?AUTO_970 ?AUTO_973 ) ) ( not ( = ?AUTO_971 ?AUTO_974 ) ) ( not ( = ?AUTO_971 ?AUTO_973 ) ) ( not ( = ?AUTO_972 ?AUTO_974 ) ) ( not ( = ?AUTO_972 ?AUTO_973 ) ) ( not ( = ?AUTO_974 ?AUTO_973 ) ) ( ON ?AUTO_974 ?AUTO_970 ) ( CLEAR ?AUTO_974 ) ( HOLDING ?AUTO_971 ) ( CLEAR ?AUTO_975 ) ( not ( = ?AUTO_970 ?AUTO_975 ) ) ( not ( = ?AUTO_971 ?AUTO_975 ) ) ( not ( = ?AUTO_972 ?AUTO_975 ) ) ( not ( = ?AUTO_973 ?AUTO_975 ) ) ( not ( = ?AUTO_974 ?AUTO_975 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_971 ?AUTO_975 )
      ( MAKE-ON ?AUTO_970 ?AUTO_971 )
      ( MAKE-ON-VERIFY ?AUTO_970 ?AUTO_971 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_980 - BLOCK
      ?AUTO_981 - BLOCK
    )
    :vars
    (
      ?AUTO_982 - BLOCK
      ?AUTO_983 - BLOCK
      ?AUTO_985 - BLOCK
      ?AUTO_984 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_980 ?AUTO_981 ) ) ( ON ?AUTO_980 ?AUTO_982 ) ( not ( = ?AUTO_980 ?AUTO_982 ) ) ( not ( = ?AUTO_981 ?AUTO_982 ) ) ( not ( = ?AUTO_980 ?AUTO_983 ) ) ( not ( = ?AUTO_980 ?AUTO_985 ) ) ( not ( = ?AUTO_981 ?AUTO_983 ) ) ( not ( = ?AUTO_981 ?AUTO_985 ) ) ( not ( = ?AUTO_982 ?AUTO_983 ) ) ( not ( = ?AUTO_982 ?AUTO_985 ) ) ( not ( = ?AUTO_983 ?AUTO_985 ) ) ( ON ?AUTO_983 ?AUTO_980 ) ( CLEAR ?AUTO_983 ) ( CLEAR ?AUTO_984 ) ( not ( = ?AUTO_980 ?AUTO_984 ) ) ( not ( = ?AUTO_981 ?AUTO_984 ) ) ( not ( = ?AUTO_982 ?AUTO_984 ) ) ( not ( = ?AUTO_983 ?AUTO_984 ) ) ( not ( = ?AUTO_985 ?AUTO_984 ) ) ( ON ?AUTO_985 ?AUTO_981 ) ( CLEAR ?AUTO_985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_985 ?AUTO_981 )
      ( MAKE-ON ?AUTO_980 ?AUTO_981 )
      ( MAKE-ON-VERIFY ?AUTO_980 ?AUTO_981 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_986 - BLOCK
      ?AUTO_987 - BLOCK
    )
    :vars
    (
      ?AUTO_989 - BLOCK
      ?AUTO_990 - BLOCK
      ?AUTO_988 - BLOCK
      ?AUTO_991 - BLOCK
      ?AUTO_992 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_986 ?AUTO_987 ) ) ( ON ?AUTO_986 ?AUTO_989 ) ( not ( = ?AUTO_986 ?AUTO_989 ) ) ( not ( = ?AUTO_987 ?AUTO_989 ) ) ( not ( = ?AUTO_986 ?AUTO_990 ) ) ( not ( = ?AUTO_986 ?AUTO_988 ) ) ( not ( = ?AUTO_987 ?AUTO_990 ) ) ( not ( = ?AUTO_987 ?AUTO_988 ) ) ( not ( = ?AUTO_989 ?AUTO_990 ) ) ( not ( = ?AUTO_989 ?AUTO_988 ) ) ( not ( = ?AUTO_990 ?AUTO_988 ) ) ( ON ?AUTO_990 ?AUTO_986 ) ( CLEAR ?AUTO_990 ) ( CLEAR ?AUTO_991 ) ( not ( = ?AUTO_986 ?AUTO_991 ) ) ( not ( = ?AUTO_987 ?AUTO_991 ) ) ( not ( = ?AUTO_989 ?AUTO_991 ) ) ( not ( = ?AUTO_990 ?AUTO_991 ) ) ( not ( = ?AUTO_988 ?AUTO_991 ) ) ( ON ?AUTO_988 ?AUTO_987 ) ( CLEAR ?AUTO_988 ) ( HOLDING ?AUTO_992 ) ( not ( = ?AUTO_986 ?AUTO_992 ) ) ( not ( = ?AUTO_987 ?AUTO_992 ) ) ( not ( = ?AUTO_989 ?AUTO_992 ) ) ( not ( = ?AUTO_990 ?AUTO_992 ) ) ( not ( = ?AUTO_988 ?AUTO_992 ) ) ( not ( = ?AUTO_991 ?AUTO_992 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_992 )
      ( MAKE-ON ?AUTO_986 ?AUTO_987 )
      ( MAKE-ON-VERIFY ?AUTO_986 ?AUTO_987 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_993 - BLOCK
      ?AUTO_994 - BLOCK
    )
    :vars
    (
      ?AUTO_996 - BLOCK
      ?AUTO_999 - BLOCK
      ?AUTO_995 - BLOCK
      ?AUTO_998 - BLOCK
      ?AUTO_997 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_993 ?AUTO_994 ) ) ( ON ?AUTO_993 ?AUTO_996 ) ( not ( = ?AUTO_993 ?AUTO_996 ) ) ( not ( = ?AUTO_994 ?AUTO_996 ) ) ( not ( = ?AUTO_993 ?AUTO_999 ) ) ( not ( = ?AUTO_993 ?AUTO_995 ) ) ( not ( = ?AUTO_994 ?AUTO_999 ) ) ( not ( = ?AUTO_994 ?AUTO_995 ) ) ( not ( = ?AUTO_996 ?AUTO_999 ) ) ( not ( = ?AUTO_996 ?AUTO_995 ) ) ( not ( = ?AUTO_999 ?AUTO_995 ) ) ( ON ?AUTO_999 ?AUTO_993 ) ( CLEAR ?AUTO_998 ) ( not ( = ?AUTO_993 ?AUTO_998 ) ) ( not ( = ?AUTO_994 ?AUTO_998 ) ) ( not ( = ?AUTO_996 ?AUTO_998 ) ) ( not ( = ?AUTO_999 ?AUTO_998 ) ) ( not ( = ?AUTO_995 ?AUTO_998 ) ) ( ON ?AUTO_995 ?AUTO_994 ) ( CLEAR ?AUTO_995 ) ( not ( = ?AUTO_993 ?AUTO_997 ) ) ( not ( = ?AUTO_994 ?AUTO_997 ) ) ( not ( = ?AUTO_996 ?AUTO_997 ) ) ( not ( = ?AUTO_999 ?AUTO_997 ) ) ( not ( = ?AUTO_995 ?AUTO_997 ) ) ( not ( = ?AUTO_998 ?AUTO_997 ) ) ( ON ?AUTO_997 ?AUTO_999 ) ( CLEAR ?AUTO_997 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_997 ?AUTO_999 )
      ( MAKE-ON ?AUTO_993 ?AUTO_994 )
      ( MAKE-ON-VERIFY ?AUTO_993 ?AUTO_994 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1001 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1001 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1001 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1001 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1002 - BLOCK
    )
    :vars
    (
      ?AUTO_1003 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1002 ?AUTO_1003 ) ( CLEAR ?AUTO_1002 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1002 ?AUTO_1003 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1002 ?AUTO_1003 )
      ( MAKE-ON-TABLE ?AUTO_1002 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1002 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1004 - BLOCK
    )
    :vars
    (
      ?AUTO_1005 - BLOCK
      ?AUTO_1006 - BLOCK
      ?AUTO_1007 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1004 ?AUTO_1005 ) ( CLEAR ?AUTO_1004 ) ( not ( = ?AUTO_1004 ?AUTO_1005 ) ) ( HOLDING ?AUTO_1006 ) ( CLEAR ?AUTO_1007 ) ( not ( = ?AUTO_1004 ?AUTO_1006 ) ) ( not ( = ?AUTO_1004 ?AUTO_1007 ) ) ( not ( = ?AUTO_1005 ?AUTO_1006 ) ) ( not ( = ?AUTO_1005 ?AUTO_1007 ) ) ( not ( = ?AUTO_1006 ?AUTO_1007 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1006 ?AUTO_1007 )
      ( MAKE-ON-TABLE ?AUTO_1004 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1004 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1008 - BLOCK
    )
    :vars
    (
      ?AUTO_1009 - BLOCK
      ?AUTO_1011 - BLOCK
      ?AUTO_1010 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1008 ?AUTO_1009 ) ( not ( = ?AUTO_1008 ?AUTO_1009 ) ) ( CLEAR ?AUTO_1011 ) ( not ( = ?AUTO_1008 ?AUTO_1010 ) ) ( not ( = ?AUTO_1008 ?AUTO_1011 ) ) ( not ( = ?AUTO_1009 ?AUTO_1010 ) ) ( not ( = ?AUTO_1009 ?AUTO_1011 ) ) ( not ( = ?AUTO_1010 ?AUTO_1011 ) ) ( ON ?AUTO_1010 ?AUTO_1008 ) ( CLEAR ?AUTO_1010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1010 ?AUTO_1008 )
      ( MAKE-ON-TABLE ?AUTO_1008 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1008 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1012 - BLOCK
    )
    :vars
    (
      ?AUTO_1014 - BLOCK
      ?AUTO_1015 - BLOCK
      ?AUTO_1013 - BLOCK
      ?AUTO_1016 - BLOCK
      ?AUTO_1017 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1012 ?AUTO_1014 ) ( not ( = ?AUTO_1012 ?AUTO_1014 ) ) ( CLEAR ?AUTO_1015 ) ( not ( = ?AUTO_1012 ?AUTO_1013 ) ) ( not ( = ?AUTO_1012 ?AUTO_1015 ) ) ( not ( = ?AUTO_1014 ?AUTO_1013 ) ) ( not ( = ?AUTO_1014 ?AUTO_1015 ) ) ( not ( = ?AUTO_1013 ?AUTO_1015 ) ) ( ON ?AUTO_1013 ?AUTO_1012 ) ( CLEAR ?AUTO_1013 ) ( HOLDING ?AUTO_1016 ) ( CLEAR ?AUTO_1017 ) ( not ( = ?AUTO_1012 ?AUTO_1016 ) ) ( not ( = ?AUTO_1012 ?AUTO_1017 ) ) ( not ( = ?AUTO_1014 ?AUTO_1016 ) ) ( not ( = ?AUTO_1014 ?AUTO_1017 ) ) ( not ( = ?AUTO_1015 ?AUTO_1016 ) ) ( not ( = ?AUTO_1015 ?AUTO_1017 ) ) ( not ( = ?AUTO_1013 ?AUTO_1016 ) ) ( not ( = ?AUTO_1013 ?AUTO_1017 ) ) ( not ( = ?AUTO_1016 ?AUTO_1017 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1016 ?AUTO_1017 )
      ( MAKE-ON-TABLE ?AUTO_1012 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1012 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1018 - BLOCK
    )
    :vars
    (
      ?AUTO_1020 - BLOCK
      ?AUTO_1023 - BLOCK
      ?AUTO_1019 - BLOCK
      ?AUTO_1022 - BLOCK
      ?AUTO_1021 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1018 ?AUTO_1020 ) ( not ( = ?AUTO_1018 ?AUTO_1020 ) ) ( CLEAR ?AUTO_1023 ) ( not ( = ?AUTO_1018 ?AUTO_1019 ) ) ( not ( = ?AUTO_1018 ?AUTO_1023 ) ) ( not ( = ?AUTO_1020 ?AUTO_1019 ) ) ( not ( = ?AUTO_1020 ?AUTO_1023 ) ) ( not ( = ?AUTO_1019 ?AUTO_1023 ) ) ( ON ?AUTO_1019 ?AUTO_1018 ) ( CLEAR ?AUTO_1022 ) ( not ( = ?AUTO_1018 ?AUTO_1021 ) ) ( not ( = ?AUTO_1018 ?AUTO_1022 ) ) ( not ( = ?AUTO_1020 ?AUTO_1021 ) ) ( not ( = ?AUTO_1020 ?AUTO_1022 ) ) ( not ( = ?AUTO_1023 ?AUTO_1021 ) ) ( not ( = ?AUTO_1023 ?AUTO_1022 ) ) ( not ( = ?AUTO_1019 ?AUTO_1021 ) ) ( not ( = ?AUTO_1019 ?AUTO_1022 ) ) ( not ( = ?AUTO_1021 ?AUTO_1022 ) ) ( ON ?AUTO_1021 ?AUTO_1019 ) ( CLEAR ?AUTO_1021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1021 ?AUTO_1019 )
      ( MAKE-ON-TABLE ?AUTO_1018 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1018 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1024 - BLOCK
    )
    :vars
    (
      ?AUTO_1026 - BLOCK
      ?AUTO_1029 - BLOCK
      ?AUTO_1025 - BLOCK
      ?AUTO_1027 - BLOCK
      ?AUTO_1028 - BLOCK
      ?AUTO_1030 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1024 ?AUTO_1026 ) ( not ( = ?AUTO_1024 ?AUTO_1026 ) ) ( CLEAR ?AUTO_1029 ) ( not ( = ?AUTO_1024 ?AUTO_1025 ) ) ( not ( = ?AUTO_1024 ?AUTO_1029 ) ) ( not ( = ?AUTO_1026 ?AUTO_1025 ) ) ( not ( = ?AUTO_1026 ?AUTO_1029 ) ) ( not ( = ?AUTO_1025 ?AUTO_1029 ) ) ( ON ?AUTO_1025 ?AUTO_1024 ) ( not ( = ?AUTO_1024 ?AUTO_1027 ) ) ( not ( = ?AUTO_1024 ?AUTO_1028 ) ) ( not ( = ?AUTO_1026 ?AUTO_1027 ) ) ( not ( = ?AUTO_1026 ?AUTO_1028 ) ) ( not ( = ?AUTO_1029 ?AUTO_1027 ) ) ( not ( = ?AUTO_1029 ?AUTO_1028 ) ) ( not ( = ?AUTO_1025 ?AUTO_1027 ) ) ( not ( = ?AUTO_1025 ?AUTO_1028 ) ) ( not ( = ?AUTO_1027 ?AUTO_1028 ) ) ( ON ?AUTO_1027 ?AUTO_1025 ) ( CLEAR ?AUTO_1027 ) ( HOLDING ?AUTO_1028 ) ( CLEAR ?AUTO_1030 ) ( not ( = ?AUTO_1024 ?AUTO_1030 ) ) ( not ( = ?AUTO_1026 ?AUTO_1030 ) ) ( not ( = ?AUTO_1029 ?AUTO_1030 ) ) ( not ( = ?AUTO_1025 ?AUTO_1030 ) ) ( not ( = ?AUTO_1027 ?AUTO_1030 ) ) ( not ( = ?AUTO_1028 ?AUTO_1030 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1028 ?AUTO_1030 )
      ( MAKE-ON-TABLE ?AUTO_1024 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1024 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1039 - BLOCK
    )
    :vars
    (
      ?AUTO_1041 - BLOCK
      ?AUTO_1040 - BLOCK
      ?AUTO_1045 - BLOCK
      ?AUTO_1044 - BLOCK
      ?AUTO_1043 - BLOCK
      ?AUTO_1042 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1039 ?AUTO_1041 ) ( not ( = ?AUTO_1039 ?AUTO_1041 ) ) ( CLEAR ?AUTO_1040 ) ( not ( = ?AUTO_1039 ?AUTO_1045 ) ) ( not ( = ?AUTO_1039 ?AUTO_1040 ) ) ( not ( = ?AUTO_1041 ?AUTO_1045 ) ) ( not ( = ?AUTO_1041 ?AUTO_1040 ) ) ( not ( = ?AUTO_1045 ?AUTO_1040 ) ) ( ON ?AUTO_1045 ?AUTO_1039 ) ( not ( = ?AUTO_1039 ?AUTO_1044 ) ) ( not ( = ?AUTO_1039 ?AUTO_1043 ) ) ( not ( = ?AUTO_1041 ?AUTO_1044 ) ) ( not ( = ?AUTO_1041 ?AUTO_1043 ) ) ( not ( = ?AUTO_1040 ?AUTO_1044 ) ) ( not ( = ?AUTO_1040 ?AUTO_1043 ) ) ( not ( = ?AUTO_1045 ?AUTO_1044 ) ) ( not ( = ?AUTO_1045 ?AUTO_1043 ) ) ( not ( = ?AUTO_1044 ?AUTO_1043 ) ) ( ON ?AUTO_1044 ?AUTO_1045 ) ( CLEAR ?AUTO_1042 ) ( not ( = ?AUTO_1039 ?AUTO_1042 ) ) ( not ( = ?AUTO_1041 ?AUTO_1042 ) ) ( not ( = ?AUTO_1040 ?AUTO_1042 ) ) ( not ( = ?AUTO_1045 ?AUTO_1042 ) ) ( not ( = ?AUTO_1044 ?AUTO_1042 ) ) ( not ( = ?AUTO_1043 ?AUTO_1042 ) ) ( ON ?AUTO_1043 ?AUTO_1044 ) ( CLEAR ?AUTO_1043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1043 ?AUTO_1044 )
      ( MAKE-ON-TABLE ?AUTO_1039 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1039 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1048 - BLOCK
      ?AUTO_1049 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1048 ) ( CLEAR ?AUTO_1049 ) ( not ( = ?AUTO_1048 ?AUTO_1049 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1048 ?AUTO_1049 )
      ( MAKE-ON-VERIFY ?AUTO_1048 ?AUTO_1049 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1050 - BLOCK
      ?AUTO_1051 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1051 ) ( not ( = ?AUTO_1050 ?AUTO_1051 ) ) ( ON-TABLE ?AUTO_1050 ) ( CLEAR ?AUTO_1050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1050 )
      ( MAKE-ON ?AUTO_1050 ?AUTO_1051 )
      ( MAKE-ON-VERIFY ?AUTO_1050 ?AUTO_1051 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1052 - BLOCK
      ?AUTO_1053 - BLOCK
    )
    :vars
    (
      ?AUTO_1054 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1053 ) ( not ( = ?AUTO_1052 ?AUTO_1053 ) ) ( ON-TABLE ?AUTO_1052 ) ( CLEAR ?AUTO_1052 ) ( HOLDING ?AUTO_1054 ) ( not ( = ?AUTO_1052 ?AUTO_1054 ) ) ( not ( = ?AUTO_1053 ?AUTO_1054 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1054 )
      ( MAKE-ON ?AUTO_1052 ?AUTO_1053 )
      ( MAKE-ON-VERIFY ?AUTO_1052 ?AUTO_1053 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1055 - BLOCK
      ?AUTO_1056 - BLOCK
    )
    :vars
    (
      ?AUTO_1057 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1055 ?AUTO_1056 ) ) ( ON-TABLE ?AUTO_1055 ) ( CLEAR ?AUTO_1055 ) ( not ( = ?AUTO_1055 ?AUTO_1057 ) ) ( not ( = ?AUTO_1056 ?AUTO_1057 ) ) ( ON ?AUTO_1057 ?AUTO_1056 ) ( CLEAR ?AUTO_1057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1057 ?AUTO_1056 )
      ( MAKE-ON ?AUTO_1055 ?AUTO_1056 )
      ( MAKE-ON-VERIFY ?AUTO_1055 ?AUTO_1056 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1058 - BLOCK
      ?AUTO_1059 - BLOCK
    )
    :vars
    (
      ?AUTO_1060 - BLOCK
      ?AUTO_1061 - BLOCK
      ?AUTO_1062 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1058 ?AUTO_1059 ) ) ( ON-TABLE ?AUTO_1058 ) ( CLEAR ?AUTO_1058 ) ( not ( = ?AUTO_1058 ?AUTO_1060 ) ) ( not ( = ?AUTO_1059 ?AUTO_1060 ) ) ( ON ?AUTO_1060 ?AUTO_1059 ) ( CLEAR ?AUTO_1060 ) ( HOLDING ?AUTO_1061 ) ( CLEAR ?AUTO_1062 ) ( not ( = ?AUTO_1058 ?AUTO_1061 ) ) ( not ( = ?AUTO_1058 ?AUTO_1062 ) ) ( not ( = ?AUTO_1059 ?AUTO_1061 ) ) ( not ( = ?AUTO_1059 ?AUTO_1062 ) ) ( not ( = ?AUTO_1060 ?AUTO_1061 ) ) ( not ( = ?AUTO_1060 ?AUTO_1062 ) ) ( not ( = ?AUTO_1061 ?AUTO_1062 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1061 ?AUTO_1062 )
      ( MAKE-ON ?AUTO_1058 ?AUTO_1059 )
      ( MAKE-ON-VERIFY ?AUTO_1058 ?AUTO_1059 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1063 - BLOCK
      ?AUTO_1064 - BLOCK
    )
    :vars
    (
      ?AUTO_1065 - BLOCK
      ?AUTO_1067 - BLOCK
      ?AUTO_1066 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1063 ?AUTO_1064 ) ) ( ON-TABLE ?AUTO_1063 ) ( CLEAR ?AUTO_1063 ) ( not ( = ?AUTO_1063 ?AUTO_1065 ) ) ( not ( = ?AUTO_1064 ?AUTO_1065 ) ) ( ON ?AUTO_1065 ?AUTO_1064 ) ( CLEAR ?AUTO_1067 ) ( not ( = ?AUTO_1063 ?AUTO_1066 ) ) ( not ( = ?AUTO_1063 ?AUTO_1067 ) ) ( not ( = ?AUTO_1064 ?AUTO_1066 ) ) ( not ( = ?AUTO_1064 ?AUTO_1067 ) ) ( not ( = ?AUTO_1065 ?AUTO_1066 ) ) ( not ( = ?AUTO_1065 ?AUTO_1067 ) ) ( not ( = ?AUTO_1066 ?AUTO_1067 ) ) ( ON ?AUTO_1066 ?AUTO_1065 ) ( CLEAR ?AUTO_1066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1066 ?AUTO_1065 )
      ( MAKE-ON ?AUTO_1063 ?AUTO_1064 )
      ( MAKE-ON-VERIFY ?AUTO_1063 ?AUTO_1064 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1068 - BLOCK
      ?AUTO_1069 - BLOCK
    )
    :vars
    (
      ?AUTO_1071 - BLOCK
      ?AUTO_1070 - BLOCK
      ?AUTO_1072 - BLOCK
      ?AUTO_1073 - BLOCK
      ?AUTO_1074 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1068 ?AUTO_1069 ) ) ( ON-TABLE ?AUTO_1068 ) ( CLEAR ?AUTO_1068 ) ( not ( = ?AUTO_1068 ?AUTO_1071 ) ) ( not ( = ?AUTO_1069 ?AUTO_1071 ) ) ( ON ?AUTO_1071 ?AUTO_1069 ) ( CLEAR ?AUTO_1070 ) ( not ( = ?AUTO_1068 ?AUTO_1072 ) ) ( not ( = ?AUTO_1068 ?AUTO_1070 ) ) ( not ( = ?AUTO_1069 ?AUTO_1072 ) ) ( not ( = ?AUTO_1069 ?AUTO_1070 ) ) ( not ( = ?AUTO_1071 ?AUTO_1072 ) ) ( not ( = ?AUTO_1071 ?AUTO_1070 ) ) ( not ( = ?AUTO_1072 ?AUTO_1070 ) ) ( ON ?AUTO_1072 ?AUTO_1071 ) ( CLEAR ?AUTO_1072 ) ( HOLDING ?AUTO_1073 ) ( CLEAR ?AUTO_1074 ) ( not ( = ?AUTO_1068 ?AUTO_1073 ) ) ( not ( = ?AUTO_1068 ?AUTO_1074 ) ) ( not ( = ?AUTO_1069 ?AUTO_1073 ) ) ( not ( = ?AUTO_1069 ?AUTO_1074 ) ) ( not ( = ?AUTO_1071 ?AUTO_1073 ) ) ( not ( = ?AUTO_1071 ?AUTO_1074 ) ) ( not ( = ?AUTO_1070 ?AUTO_1073 ) ) ( not ( = ?AUTO_1070 ?AUTO_1074 ) ) ( not ( = ?AUTO_1072 ?AUTO_1073 ) ) ( not ( = ?AUTO_1072 ?AUTO_1074 ) ) ( not ( = ?AUTO_1073 ?AUTO_1074 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1073 ?AUTO_1074 )
      ( MAKE-ON ?AUTO_1068 ?AUTO_1069 )
      ( MAKE-ON-VERIFY ?AUTO_1068 ?AUTO_1069 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1075 - BLOCK
      ?AUTO_1076 - BLOCK
    )
    :vars
    (
      ?AUTO_1077 - BLOCK
      ?AUTO_1078 - BLOCK
      ?AUTO_1081 - BLOCK
      ?AUTO_1079 - BLOCK
      ?AUTO_1080 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1075 ?AUTO_1076 ) ) ( ON-TABLE ?AUTO_1075 ) ( CLEAR ?AUTO_1075 ) ( not ( = ?AUTO_1075 ?AUTO_1077 ) ) ( not ( = ?AUTO_1076 ?AUTO_1077 ) ) ( ON ?AUTO_1077 ?AUTO_1076 ) ( CLEAR ?AUTO_1078 ) ( not ( = ?AUTO_1075 ?AUTO_1081 ) ) ( not ( = ?AUTO_1075 ?AUTO_1078 ) ) ( not ( = ?AUTO_1076 ?AUTO_1081 ) ) ( not ( = ?AUTO_1076 ?AUTO_1078 ) ) ( not ( = ?AUTO_1077 ?AUTO_1081 ) ) ( not ( = ?AUTO_1077 ?AUTO_1078 ) ) ( not ( = ?AUTO_1081 ?AUTO_1078 ) ) ( ON ?AUTO_1081 ?AUTO_1077 ) ( CLEAR ?AUTO_1079 ) ( not ( = ?AUTO_1075 ?AUTO_1080 ) ) ( not ( = ?AUTO_1075 ?AUTO_1079 ) ) ( not ( = ?AUTO_1076 ?AUTO_1080 ) ) ( not ( = ?AUTO_1076 ?AUTO_1079 ) ) ( not ( = ?AUTO_1077 ?AUTO_1080 ) ) ( not ( = ?AUTO_1077 ?AUTO_1079 ) ) ( not ( = ?AUTO_1078 ?AUTO_1080 ) ) ( not ( = ?AUTO_1078 ?AUTO_1079 ) ) ( not ( = ?AUTO_1081 ?AUTO_1080 ) ) ( not ( = ?AUTO_1081 ?AUTO_1079 ) ) ( not ( = ?AUTO_1080 ?AUTO_1079 ) ) ( ON ?AUTO_1080 ?AUTO_1081 ) ( CLEAR ?AUTO_1080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1080 ?AUTO_1081 )
      ( MAKE-ON ?AUTO_1075 ?AUTO_1076 )
      ( MAKE-ON-VERIFY ?AUTO_1075 ?AUTO_1076 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1082 - BLOCK
      ?AUTO_1083 - BLOCK
    )
    :vars
    (
      ?AUTO_1084 - BLOCK
      ?AUTO_1085 - BLOCK
      ?AUTO_1088 - BLOCK
      ?AUTO_1087 - BLOCK
      ?AUTO_1086 - BLOCK
      ?AUTO_1089 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1082 ?AUTO_1083 ) ) ( ON-TABLE ?AUTO_1082 ) ( CLEAR ?AUTO_1082 ) ( not ( = ?AUTO_1082 ?AUTO_1084 ) ) ( not ( = ?AUTO_1083 ?AUTO_1084 ) ) ( ON ?AUTO_1084 ?AUTO_1083 ) ( CLEAR ?AUTO_1085 ) ( not ( = ?AUTO_1082 ?AUTO_1088 ) ) ( not ( = ?AUTO_1082 ?AUTO_1085 ) ) ( not ( = ?AUTO_1083 ?AUTO_1088 ) ) ( not ( = ?AUTO_1083 ?AUTO_1085 ) ) ( not ( = ?AUTO_1084 ?AUTO_1088 ) ) ( not ( = ?AUTO_1084 ?AUTO_1085 ) ) ( not ( = ?AUTO_1088 ?AUTO_1085 ) ) ( ON ?AUTO_1088 ?AUTO_1084 ) ( not ( = ?AUTO_1082 ?AUTO_1087 ) ) ( not ( = ?AUTO_1082 ?AUTO_1086 ) ) ( not ( = ?AUTO_1083 ?AUTO_1087 ) ) ( not ( = ?AUTO_1083 ?AUTO_1086 ) ) ( not ( = ?AUTO_1084 ?AUTO_1087 ) ) ( not ( = ?AUTO_1084 ?AUTO_1086 ) ) ( not ( = ?AUTO_1085 ?AUTO_1087 ) ) ( not ( = ?AUTO_1085 ?AUTO_1086 ) ) ( not ( = ?AUTO_1088 ?AUTO_1087 ) ) ( not ( = ?AUTO_1088 ?AUTO_1086 ) ) ( not ( = ?AUTO_1087 ?AUTO_1086 ) ) ( ON ?AUTO_1087 ?AUTO_1088 ) ( CLEAR ?AUTO_1087 ) ( HOLDING ?AUTO_1086 ) ( CLEAR ?AUTO_1089 ) ( not ( = ?AUTO_1082 ?AUTO_1089 ) ) ( not ( = ?AUTO_1083 ?AUTO_1089 ) ) ( not ( = ?AUTO_1084 ?AUTO_1089 ) ) ( not ( = ?AUTO_1085 ?AUTO_1089 ) ) ( not ( = ?AUTO_1088 ?AUTO_1089 ) ) ( not ( = ?AUTO_1087 ?AUTO_1089 ) ) ( not ( = ?AUTO_1086 ?AUTO_1089 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1086 ?AUTO_1089 )
      ( MAKE-ON ?AUTO_1082 ?AUTO_1083 )
      ( MAKE-ON-VERIFY ?AUTO_1082 ?AUTO_1083 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1100 - BLOCK
      ?AUTO_1101 - BLOCK
    )
    :vars
    (
      ?AUTO_1105 - BLOCK
      ?AUTO_1104 - BLOCK
      ?AUTO_1106 - BLOCK
      ?AUTO_1102 - BLOCK
      ?AUTO_1103 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1100 ?AUTO_1101 ) ) ( not ( = ?AUTO_1100 ?AUTO_1105 ) ) ( not ( = ?AUTO_1101 ?AUTO_1105 ) ) ( ON ?AUTO_1105 ?AUTO_1101 ) ( CLEAR ?AUTO_1104 ) ( not ( = ?AUTO_1100 ?AUTO_1106 ) ) ( not ( = ?AUTO_1100 ?AUTO_1104 ) ) ( not ( = ?AUTO_1101 ?AUTO_1106 ) ) ( not ( = ?AUTO_1101 ?AUTO_1104 ) ) ( not ( = ?AUTO_1105 ?AUTO_1106 ) ) ( not ( = ?AUTO_1105 ?AUTO_1104 ) ) ( not ( = ?AUTO_1106 ?AUTO_1104 ) ) ( ON ?AUTO_1106 ?AUTO_1105 ) ( CLEAR ?AUTO_1102 ) ( not ( = ?AUTO_1100 ?AUTO_1103 ) ) ( not ( = ?AUTO_1100 ?AUTO_1102 ) ) ( not ( = ?AUTO_1101 ?AUTO_1103 ) ) ( not ( = ?AUTO_1101 ?AUTO_1102 ) ) ( not ( = ?AUTO_1105 ?AUTO_1103 ) ) ( not ( = ?AUTO_1105 ?AUTO_1102 ) ) ( not ( = ?AUTO_1104 ?AUTO_1103 ) ) ( not ( = ?AUTO_1104 ?AUTO_1102 ) ) ( not ( = ?AUTO_1106 ?AUTO_1103 ) ) ( not ( = ?AUTO_1106 ?AUTO_1102 ) ) ( not ( = ?AUTO_1103 ?AUTO_1102 ) ) ( ON ?AUTO_1103 ?AUTO_1106 ) ( CLEAR ?AUTO_1103 ) ( HOLDING ?AUTO_1100 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1100 )
      ( MAKE-ON ?AUTO_1100 ?AUTO_1101 )
      ( MAKE-ON-VERIFY ?AUTO_1100 ?AUTO_1101 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1111 - BLOCK
      ?AUTO_1112 - BLOCK
    )
    :vars
    (
      ?AUTO_1114 - BLOCK
      ?AUTO_1117 - BLOCK
      ?AUTO_1113 - BLOCK
      ?AUTO_1115 - BLOCK
      ?AUTO_1116 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1111 ?AUTO_1112 ) ) ( ON ?AUTO_1111 ?AUTO_1114 ) ( CLEAR ?AUTO_1111 ) ( not ( = ?AUTO_1111 ?AUTO_1114 ) ) ( not ( = ?AUTO_1112 ?AUTO_1114 ) ) ( not ( = ?AUTO_1111 ?AUTO_1117 ) ) ( not ( = ?AUTO_1112 ?AUTO_1117 ) ) ( not ( = ?AUTO_1114 ?AUTO_1117 ) ) ( ON ?AUTO_1117 ?AUTO_1112 ) ( not ( = ?AUTO_1111 ?AUTO_1113 ) ) ( not ( = ?AUTO_1111 ?AUTO_1115 ) ) ( not ( = ?AUTO_1112 ?AUTO_1113 ) ) ( not ( = ?AUTO_1112 ?AUTO_1115 ) ) ( not ( = ?AUTO_1114 ?AUTO_1113 ) ) ( not ( = ?AUTO_1114 ?AUTO_1115 ) ) ( not ( = ?AUTO_1117 ?AUTO_1113 ) ) ( not ( = ?AUTO_1117 ?AUTO_1115 ) ) ( not ( = ?AUTO_1113 ?AUTO_1115 ) ) ( ON ?AUTO_1113 ?AUTO_1117 ) ( not ( = ?AUTO_1111 ?AUTO_1116 ) ) ( not ( = ?AUTO_1112 ?AUTO_1116 ) ) ( not ( = ?AUTO_1114 ?AUTO_1116 ) ) ( not ( = ?AUTO_1117 ?AUTO_1116 ) ) ( not ( = ?AUTO_1115 ?AUTO_1116 ) ) ( not ( = ?AUTO_1113 ?AUTO_1116 ) ) ( ON ?AUTO_1116 ?AUTO_1113 ) ( ON ?AUTO_1115 ?AUTO_1116 ) ( CLEAR ?AUTO_1115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1115 ?AUTO_1116 )
      ( MAKE-ON ?AUTO_1111 ?AUTO_1112 )
      ( MAKE-ON-VERIFY ?AUTO_1111 ?AUTO_1112 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1120 - BLOCK
      ?AUTO_1121 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1120 ) ( CLEAR ?AUTO_1121 ) ( not ( = ?AUTO_1120 ?AUTO_1121 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1120 ?AUTO_1121 )
      ( MAKE-ON-VERIFY ?AUTO_1120 ?AUTO_1121 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1122 - BLOCK
      ?AUTO_1123 - BLOCK
    )
    :vars
    (
      ?AUTO_1124 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1123 ) ( not ( = ?AUTO_1122 ?AUTO_1123 ) ) ( ON ?AUTO_1122 ?AUTO_1124 ) ( CLEAR ?AUTO_1122 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1122 ?AUTO_1124 ) ) ( not ( = ?AUTO_1123 ?AUTO_1124 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1122 ?AUTO_1124 )
      ( MAKE-ON ?AUTO_1122 ?AUTO_1123 )
      ( MAKE-ON-VERIFY ?AUTO_1122 ?AUTO_1123 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1125 - BLOCK
      ?AUTO_1126 - BLOCK
    )
    :vars
    (
      ?AUTO_1127 - BLOCK
      ?AUTO_1128 - BLOCK
      ?AUTO_1129 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1126 ) ( not ( = ?AUTO_1125 ?AUTO_1126 ) ) ( ON ?AUTO_1125 ?AUTO_1127 ) ( CLEAR ?AUTO_1125 ) ( not ( = ?AUTO_1125 ?AUTO_1127 ) ) ( not ( = ?AUTO_1126 ?AUTO_1127 ) ) ( HOLDING ?AUTO_1128 ) ( CLEAR ?AUTO_1129 ) ( not ( = ?AUTO_1125 ?AUTO_1128 ) ) ( not ( = ?AUTO_1125 ?AUTO_1129 ) ) ( not ( = ?AUTO_1126 ?AUTO_1128 ) ) ( not ( = ?AUTO_1126 ?AUTO_1129 ) ) ( not ( = ?AUTO_1127 ?AUTO_1128 ) ) ( not ( = ?AUTO_1127 ?AUTO_1129 ) ) ( not ( = ?AUTO_1128 ?AUTO_1129 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1128 ?AUTO_1129 )
      ( MAKE-ON ?AUTO_1125 ?AUTO_1126 )
      ( MAKE-ON-VERIFY ?AUTO_1125 ?AUTO_1126 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1132 - BLOCK
      ?AUTO_1133 - BLOCK
    )
    :vars
    (
      ?AUTO_1134 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1132 ?AUTO_1133 ) ) ( ON ?AUTO_1132 ?AUTO_1134 ) ( CLEAR ?AUTO_1132 ) ( not ( = ?AUTO_1132 ?AUTO_1134 ) ) ( not ( = ?AUTO_1133 ?AUTO_1134 ) ) ( HOLDING ?AUTO_1133 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1133 )
      ( MAKE-ON ?AUTO_1132 ?AUTO_1133 )
      ( MAKE-ON-VERIFY ?AUTO_1132 ?AUTO_1133 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1139 - BLOCK
      ?AUTO_1140 - BLOCK
    )
    :vars
    (
      ?AUTO_1143 - BLOCK
      ?AUTO_1142 - BLOCK
      ?AUTO_1141 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1139 ?AUTO_1140 ) ) ( ON ?AUTO_1139 ?AUTO_1143 ) ( CLEAR ?AUTO_1139 ) ( not ( = ?AUTO_1139 ?AUTO_1143 ) ) ( not ( = ?AUTO_1140 ?AUTO_1143 ) ) ( CLEAR ?AUTO_1142 ) ( not ( = ?AUTO_1139 ?AUTO_1141 ) ) ( not ( = ?AUTO_1139 ?AUTO_1142 ) ) ( not ( = ?AUTO_1140 ?AUTO_1141 ) ) ( not ( = ?AUTO_1140 ?AUTO_1142 ) ) ( not ( = ?AUTO_1143 ?AUTO_1141 ) ) ( not ( = ?AUTO_1143 ?AUTO_1142 ) ) ( not ( = ?AUTO_1141 ?AUTO_1142 ) ) ( ON ?AUTO_1141 ?AUTO_1140 ) ( CLEAR ?AUTO_1141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1141 ?AUTO_1140 )
      ( MAKE-ON ?AUTO_1139 ?AUTO_1140 )
      ( MAKE-ON-VERIFY ?AUTO_1139 ?AUTO_1140 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1144 - BLOCK
      ?AUTO_1145 - BLOCK
    )
    :vars
    (
      ?AUTO_1148 - BLOCK
      ?AUTO_1146 - BLOCK
      ?AUTO_1147 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1144 ?AUTO_1145 ) ) ( not ( = ?AUTO_1144 ?AUTO_1148 ) ) ( not ( = ?AUTO_1145 ?AUTO_1148 ) ) ( CLEAR ?AUTO_1146 ) ( not ( = ?AUTO_1144 ?AUTO_1147 ) ) ( not ( = ?AUTO_1144 ?AUTO_1146 ) ) ( not ( = ?AUTO_1145 ?AUTO_1147 ) ) ( not ( = ?AUTO_1145 ?AUTO_1146 ) ) ( not ( = ?AUTO_1148 ?AUTO_1147 ) ) ( not ( = ?AUTO_1148 ?AUTO_1146 ) ) ( not ( = ?AUTO_1147 ?AUTO_1146 ) ) ( ON ?AUTO_1147 ?AUTO_1145 ) ( CLEAR ?AUTO_1147 ) ( HOLDING ?AUTO_1144 ) ( CLEAR ?AUTO_1148 ) )
    :subtasks
    ( ( !STACK ?AUTO_1144 ?AUTO_1148 )
      ( MAKE-ON ?AUTO_1144 ?AUTO_1145 )
      ( MAKE-ON-VERIFY ?AUTO_1144 ?AUTO_1145 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1149 - BLOCK
      ?AUTO_1150 - BLOCK
    )
    :vars
    (
      ?AUTO_1153 - BLOCK
      ?AUTO_1151 - BLOCK
      ?AUTO_1152 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1149 ?AUTO_1150 ) ) ( not ( = ?AUTO_1149 ?AUTO_1153 ) ) ( not ( = ?AUTO_1150 ?AUTO_1153 ) ) ( CLEAR ?AUTO_1151 ) ( not ( = ?AUTO_1149 ?AUTO_1152 ) ) ( not ( = ?AUTO_1149 ?AUTO_1151 ) ) ( not ( = ?AUTO_1150 ?AUTO_1152 ) ) ( not ( = ?AUTO_1150 ?AUTO_1151 ) ) ( not ( = ?AUTO_1153 ?AUTO_1152 ) ) ( not ( = ?AUTO_1153 ?AUTO_1151 ) ) ( not ( = ?AUTO_1152 ?AUTO_1151 ) ) ( ON ?AUTO_1152 ?AUTO_1150 ) ( CLEAR ?AUTO_1153 ) ( ON ?AUTO_1149 ?AUTO_1152 ) ( CLEAR ?AUTO_1149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1149 ?AUTO_1152 )
      ( MAKE-ON ?AUTO_1149 ?AUTO_1150 )
      ( MAKE-ON-VERIFY ?AUTO_1149 ?AUTO_1150 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1154 - BLOCK
      ?AUTO_1155 - BLOCK
    )
    :vars
    (
      ?AUTO_1158 - BLOCK
      ?AUTO_1157 - BLOCK
      ?AUTO_1156 - BLOCK
      ?AUTO_1159 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1154 ?AUTO_1155 ) ) ( not ( = ?AUTO_1154 ?AUTO_1158 ) ) ( not ( = ?AUTO_1155 ?AUTO_1158 ) ) ( CLEAR ?AUTO_1157 ) ( not ( = ?AUTO_1154 ?AUTO_1156 ) ) ( not ( = ?AUTO_1154 ?AUTO_1157 ) ) ( not ( = ?AUTO_1155 ?AUTO_1156 ) ) ( not ( = ?AUTO_1155 ?AUTO_1157 ) ) ( not ( = ?AUTO_1158 ?AUTO_1156 ) ) ( not ( = ?AUTO_1158 ?AUTO_1157 ) ) ( not ( = ?AUTO_1156 ?AUTO_1157 ) ) ( ON ?AUTO_1156 ?AUTO_1155 ) ( ON ?AUTO_1154 ?AUTO_1156 ) ( CLEAR ?AUTO_1154 ) ( HOLDING ?AUTO_1158 ) ( CLEAR ?AUTO_1159 ) ( not ( = ?AUTO_1154 ?AUTO_1159 ) ) ( not ( = ?AUTO_1155 ?AUTO_1159 ) ) ( not ( = ?AUTO_1158 ?AUTO_1159 ) ) ( not ( = ?AUTO_1157 ?AUTO_1159 ) ) ( not ( = ?AUTO_1156 ?AUTO_1159 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1158 ?AUTO_1159 )
      ( MAKE-ON ?AUTO_1154 ?AUTO_1155 )
      ( MAKE-ON-VERIFY ?AUTO_1154 ?AUTO_1155 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1176 - BLOCK
      ?AUTO_1177 - BLOCK
    )
    :vars
    (
      ?AUTO_1178 - BLOCK
      ?AUTO_1179 - BLOCK
      ?AUTO_1180 - BLOCK
      ?AUTO_1181 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1176 ?AUTO_1177 ) ) ( not ( = ?AUTO_1176 ?AUTO_1178 ) ) ( not ( = ?AUTO_1177 ?AUTO_1178 ) ) ( CLEAR ?AUTO_1179 ) ( not ( = ?AUTO_1176 ?AUTO_1180 ) ) ( not ( = ?AUTO_1176 ?AUTO_1179 ) ) ( not ( = ?AUTO_1177 ?AUTO_1180 ) ) ( not ( = ?AUTO_1177 ?AUTO_1179 ) ) ( not ( = ?AUTO_1178 ?AUTO_1180 ) ) ( not ( = ?AUTO_1178 ?AUTO_1179 ) ) ( not ( = ?AUTO_1180 ?AUTO_1179 ) ) ( ON ?AUTO_1180 ?AUTO_1177 ) ( ON ?AUTO_1176 ?AUTO_1180 ) ( CLEAR ?AUTO_1181 ) ( not ( = ?AUTO_1176 ?AUTO_1181 ) ) ( not ( = ?AUTO_1177 ?AUTO_1181 ) ) ( not ( = ?AUTO_1178 ?AUTO_1181 ) ) ( not ( = ?AUTO_1179 ?AUTO_1181 ) ) ( not ( = ?AUTO_1180 ?AUTO_1181 ) ) ( ON ?AUTO_1178 ?AUTO_1176 ) ( CLEAR ?AUTO_1178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1178 ?AUTO_1176 )
      ( MAKE-ON ?AUTO_1176 ?AUTO_1177 )
      ( MAKE-ON-VERIFY ?AUTO_1176 ?AUTO_1177 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1184 - BLOCK
      ?AUTO_1185 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1184 ) ( CLEAR ?AUTO_1185 ) ( not ( = ?AUTO_1184 ?AUTO_1185 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1184 ?AUTO_1185 )
      ( MAKE-ON-VERIFY ?AUTO_1184 ?AUTO_1185 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1186 - BLOCK
      ?AUTO_1187 - BLOCK
    )
    :vars
    (
      ?AUTO_1188 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1187 ) ( not ( = ?AUTO_1186 ?AUTO_1187 ) ) ( ON ?AUTO_1186 ?AUTO_1188 ) ( CLEAR ?AUTO_1186 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1186 ?AUTO_1188 ) ) ( not ( = ?AUTO_1187 ?AUTO_1188 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1186 ?AUTO_1188 )
      ( MAKE-ON ?AUTO_1186 ?AUTO_1187 )
      ( MAKE-ON-VERIFY ?AUTO_1186 ?AUTO_1187 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1189 - BLOCK
      ?AUTO_1190 - BLOCK
    )
    :vars
    (
      ?AUTO_1191 - BLOCK
      ?AUTO_1192 - BLOCK
      ?AUTO_1193 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1190 ) ( not ( = ?AUTO_1189 ?AUTO_1190 ) ) ( ON ?AUTO_1189 ?AUTO_1191 ) ( CLEAR ?AUTO_1189 ) ( not ( = ?AUTO_1189 ?AUTO_1191 ) ) ( not ( = ?AUTO_1190 ?AUTO_1191 ) ) ( HOLDING ?AUTO_1192 ) ( CLEAR ?AUTO_1193 ) ( not ( = ?AUTO_1189 ?AUTO_1192 ) ) ( not ( = ?AUTO_1189 ?AUTO_1193 ) ) ( not ( = ?AUTO_1190 ?AUTO_1192 ) ) ( not ( = ?AUTO_1190 ?AUTO_1193 ) ) ( not ( = ?AUTO_1191 ?AUTO_1192 ) ) ( not ( = ?AUTO_1191 ?AUTO_1193 ) ) ( not ( = ?AUTO_1192 ?AUTO_1193 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1192 ?AUTO_1193 )
      ( MAKE-ON ?AUTO_1189 ?AUTO_1190 )
      ( MAKE-ON-VERIFY ?AUTO_1189 ?AUTO_1190 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1194 - BLOCK
      ?AUTO_1195 - BLOCK
    )
    :vars
    (
      ?AUTO_1198 - BLOCK
      ?AUTO_1196 - BLOCK
      ?AUTO_1197 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1195 ) ( not ( = ?AUTO_1194 ?AUTO_1195 ) ) ( ON ?AUTO_1194 ?AUTO_1198 ) ( not ( = ?AUTO_1194 ?AUTO_1198 ) ) ( not ( = ?AUTO_1195 ?AUTO_1198 ) ) ( CLEAR ?AUTO_1196 ) ( not ( = ?AUTO_1194 ?AUTO_1197 ) ) ( not ( = ?AUTO_1194 ?AUTO_1196 ) ) ( not ( = ?AUTO_1195 ?AUTO_1197 ) ) ( not ( = ?AUTO_1195 ?AUTO_1196 ) ) ( not ( = ?AUTO_1198 ?AUTO_1197 ) ) ( not ( = ?AUTO_1198 ?AUTO_1196 ) ) ( not ( = ?AUTO_1197 ?AUTO_1196 ) ) ( ON ?AUTO_1197 ?AUTO_1194 ) ( CLEAR ?AUTO_1197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1197 ?AUTO_1194 )
      ( MAKE-ON ?AUTO_1194 ?AUTO_1195 )
      ( MAKE-ON-VERIFY ?AUTO_1194 ?AUTO_1195 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1199 - BLOCK
      ?AUTO_1200 - BLOCK
    )
    :vars
    (
      ?AUTO_1203 - BLOCK
      ?AUTO_1201 - BLOCK
      ?AUTO_1202 - BLOCK
      ?AUTO_1204 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1199 ?AUTO_1200 ) ) ( ON ?AUTO_1199 ?AUTO_1203 ) ( not ( = ?AUTO_1199 ?AUTO_1203 ) ) ( not ( = ?AUTO_1200 ?AUTO_1203 ) ) ( CLEAR ?AUTO_1201 ) ( not ( = ?AUTO_1199 ?AUTO_1202 ) ) ( not ( = ?AUTO_1199 ?AUTO_1201 ) ) ( not ( = ?AUTO_1200 ?AUTO_1202 ) ) ( not ( = ?AUTO_1200 ?AUTO_1201 ) ) ( not ( = ?AUTO_1203 ?AUTO_1202 ) ) ( not ( = ?AUTO_1203 ?AUTO_1201 ) ) ( not ( = ?AUTO_1202 ?AUTO_1201 ) ) ( ON ?AUTO_1202 ?AUTO_1199 ) ( CLEAR ?AUTO_1202 ) ( HOLDING ?AUTO_1200 ) ( CLEAR ?AUTO_1204 ) ( not ( = ?AUTO_1199 ?AUTO_1204 ) ) ( not ( = ?AUTO_1200 ?AUTO_1204 ) ) ( not ( = ?AUTO_1203 ?AUTO_1204 ) ) ( not ( = ?AUTO_1201 ?AUTO_1204 ) ) ( not ( = ?AUTO_1202 ?AUTO_1204 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1200 ?AUTO_1204 )
      ( MAKE-ON ?AUTO_1199 ?AUTO_1200 )
      ( MAKE-ON-VERIFY ?AUTO_1199 ?AUTO_1200 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1207 - BLOCK
      ?AUTO_1208 - BLOCK
    )
    :vars
    (
      ?AUTO_1211 - BLOCK
      ?AUTO_1210 - BLOCK
      ?AUTO_1209 - BLOCK
      ?AUTO_1212 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1208 ) ( not ( = ?AUTO_1207 ?AUTO_1208 ) ) ( ON ?AUTO_1207 ?AUTO_1211 ) ( not ( = ?AUTO_1207 ?AUTO_1211 ) ) ( not ( = ?AUTO_1208 ?AUTO_1211 ) ) ( CLEAR ?AUTO_1210 ) ( not ( = ?AUTO_1207 ?AUTO_1209 ) ) ( not ( = ?AUTO_1207 ?AUTO_1210 ) ) ( not ( = ?AUTO_1208 ?AUTO_1209 ) ) ( not ( = ?AUTO_1208 ?AUTO_1210 ) ) ( not ( = ?AUTO_1211 ?AUTO_1209 ) ) ( not ( = ?AUTO_1211 ?AUTO_1210 ) ) ( not ( = ?AUTO_1209 ?AUTO_1210 ) ) ( ON ?AUTO_1209 ?AUTO_1207 ) ( CLEAR ?AUTO_1209 ) ( HOLDING ?AUTO_1212 ) ( not ( = ?AUTO_1207 ?AUTO_1212 ) ) ( not ( = ?AUTO_1208 ?AUTO_1212 ) ) ( not ( = ?AUTO_1211 ?AUTO_1212 ) ) ( not ( = ?AUTO_1210 ?AUTO_1212 ) ) ( not ( = ?AUTO_1209 ?AUTO_1212 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1212 )
      ( MAKE-ON ?AUTO_1207 ?AUTO_1208 )
      ( MAKE-ON-VERIFY ?AUTO_1207 ?AUTO_1208 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1229 - BLOCK
      ?AUTO_1230 - BLOCK
    )
    :vars
    (
      ?AUTO_1231 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1230 ) ( not ( = ?AUTO_1229 ?AUTO_1230 ) ) ( ON-TABLE ?AUTO_1229 ) ( not ( = ?AUTO_1229 ?AUTO_1231 ) ) ( not ( = ?AUTO_1230 ?AUTO_1231 ) ) ( ON ?AUTO_1231 ?AUTO_1229 ) ( CLEAR ?AUTO_1231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1231 ?AUTO_1229 )
      ( MAKE-ON ?AUTO_1229 ?AUTO_1230 )
      ( MAKE-ON-VERIFY ?AUTO_1229 ?AUTO_1230 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1232 - BLOCK
      ?AUTO_1233 - BLOCK
    )
    :vars
    (
      ?AUTO_1234 - BLOCK
      ?AUTO_1235 - BLOCK
      ?AUTO_1236 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1233 ) ( not ( = ?AUTO_1232 ?AUTO_1233 ) ) ( ON-TABLE ?AUTO_1232 ) ( not ( = ?AUTO_1232 ?AUTO_1234 ) ) ( not ( = ?AUTO_1233 ?AUTO_1234 ) ) ( ON ?AUTO_1234 ?AUTO_1232 ) ( CLEAR ?AUTO_1234 ) ( HOLDING ?AUTO_1235 ) ( CLEAR ?AUTO_1236 ) ( not ( = ?AUTO_1232 ?AUTO_1235 ) ) ( not ( = ?AUTO_1232 ?AUTO_1236 ) ) ( not ( = ?AUTO_1233 ?AUTO_1235 ) ) ( not ( = ?AUTO_1233 ?AUTO_1236 ) ) ( not ( = ?AUTO_1234 ?AUTO_1235 ) ) ( not ( = ?AUTO_1234 ?AUTO_1236 ) ) ( not ( = ?AUTO_1235 ?AUTO_1236 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1235 ?AUTO_1236 )
      ( MAKE-ON ?AUTO_1232 ?AUTO_1233 )
      ( MAKE-ON-VERIFY ?AUTO_1232 ?AUTO_1233 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1237 - BLOCK
      ?AUTO_1238 - BLOCK
    )
    :vars
    (
      ?AUTO_1240 - BLOCK
      ?AUTO_1241 - BLOCK
      ?AUTO_1239 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1238 ) ( not ( = ?AUTO_1237 ?AUTO_1238 ) ) ( ON-TABLE ?AUTO_1237 ) ( not ( = ?AUTO_1237 ?AUTO_1240 ) ) ( not ( = ?AUTO_1238 ?AUTO_1240 ) ) ( ON ?AUTO_1240 ?AUTO_1237 ) ( CLEAR ?AUTO_1241 ) ( not ( = ?AUTO_1237 ?AUTO_1239 ) ) ( not ( = ?AUTO_1237 ?AUTO_1241 ) ) ( not ( = ?AUTO_1238 ?AUTO_1239 ) ) ( not ( = ?AUTO_1238 ?AUTO_1241 ) ) ( not ( = ?AUTO_1240 ?AUTO_1239 ) ) ( not ( = ?AUTO_1240 ?AUTO_1241 ) ) ( not ( = ?AUTO_1239 ?AUTO_1241 ) ) ( ON ?AUTO_1239 ?AUTO_1240 ) ( CLEAR ?AUTO_1239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1239 ?AUTO_1240 )
      ( MAKE-ON ?AUTO_1237 ?AUTO_1238 )
      ( MAKE-ON-VERIFY ?AUTO_1237 ?AUTO_1238 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1242 - BLOCK
      ?AUTO_1243 - BLOCK
    )
    :vars
    (
      ?AUTO_1244 - BLOCK
      ?AUTO_1246 - BLOCK
      ?AUTO_1245 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1242 ?AUTO_1243 ) ) ( ON-TABLE ?AUTO_1242 ) ( not ( = ?AUTO_1242 ?AUTO_1244 ) ) ( not ( = ?AUTO_1243 ?AUTO_1244 ) ) ( ON ?AUTO_1244 ?AUTO_1242 ) ( CLEAR ?AUTO_1246 ) ( not ( = ?AUTO_1242 ?AUTO_1245 ) ) ( not ( = ?AUTO_1242 ?AUTO_1246 ) ) ( not ( = ?AUTO_1243 ?AUTO_1245 ) ) ( not ( = ?AUTO_1243 ?AUTO_1246 ) ) ( not ( = ?AUTO_1244 ?AUTO_1245 ) ) ( not ( = ?AUTO_1244 ?AUTO_1246 ) ) ( not ( = ?AUTO_1245 ?AUTO_1246 ) ) ( ON ?AUTO_1245 ?AUTO_1244 ) ( CLEAR ?AUTO_1245 ) ( HOLDING ?AUTO_1243 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1243 )
      ( MAKE-ON ?AUTO_1242 ?AUTO_1243 )
      ( MAKE-ON-VERIFY ?AUTO_1242 ?AUTO_1243 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1247 - BLOCK
      ?AUTO_1248 - BLOCK
    )
    :vars
    (
      ?AUTO_1250 - BLOCK
      ?AUTO_1251 - BLOCK
      ?AUTO_1249 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1247 ?AUTO_1248 ) ) ( ON-TABLE ?AUTO_1247 ) ( not ( = ?AUTO_1247 ?AUTO_1250 ) ) ( not ( = ?AUTO_1248 ?AUTO_1250 ) ) ( ON ?AUTO_1250 ?AUTO_1247 ) ( CLEAR ?AUTO_1251 ) ( not ( = ?AUTO_1247 ?AUTO_1249 ) ) ( not ( = ?AUTO_1247 ?AUTO_1251 ) ) ( not ( = ?AUTO_1248 ?AUTO_1249 ) ) ( not ( = ?AUTO_1248 ?AUTO_1251 ) ) ( not ( = ?AUTO_1250 ?AUTO_1249 ) ) ( not ( = ?AUTO_1250 ?AUTO_1251 ) ) ( not ( = ?AUTO_1249 ?AUTO_1251 ) ) ( ON ?AUTO_1249 ?AUTO_1250 ) ( ON ?AUTO_1248 ?AUTO_1249 ) ( CLEAR ?AUTO_1248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1248 ?AUTO_1249 )
      ( MAKE-ON ?AUTO_1247 ?AUTO_1248 )
      ( MAKE-ON-VERIFY ?AUTO_1247 ?AUTO_1248 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1252 - BLOCK
      ?AUTO_1253 - BLOCK
    )
    :vars
    (
      ?AUTO_1255 - BLOCK
      ?AUTO_1256 - BLOCK
      ?AUTO_1254 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1252 ?AUTO_1253 ) ) ( ON-TABLE ?AUTO_1252 ) ( not ( = ?AUTO_1252 ?AUTO_1255 ) ) ( not ( = ?AUTO_1253 ?AUTO_1255 ) ) ( ON ?AUTO_1255 ?AUTO_1252 ) ( not ( = ?AUTO_1252 ?AUTO_1256 ) ) ( not ( = ?AUTO_1252 ?AUTO_1254 ) ) ( not ( = ?AUTO_1253 ?AUTO_1256 ) ) ( not ( = ?AUTO_1253 ?AUTO_1254 ) ) ( not ( = ?AUTO_1255 ?AUTO_1256 ) ) ( not ( = ?AUTO_1255 ?AUTO_1254 ) ) ( not ( = ?AUTO_1256 ?AUTO_1254 ) ) ( ON ?AUTO_1256 ?AUTO_1255 ) ( ON ?AUTO_1253 ?AUTO_1256 ) ( CLEAR ?AUTO_1253 ) ( HOLDING ?AUTO_1254 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1254 )
      ( MAKE-ON ?AUTO_1252 ?AUTO_1253 )
      ( MAKE-ON-VERIFY ?AUTO_1252 ?AUTO_1253 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1261 - BLOCK
      ?AUTO_1262 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1261 ) ( CLEAR ?AUTO_1262 ) ( not ( = ?AUTO_1261 ?AUTO_1262 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1261 ?AUTO_1262 )
      ( MAKE-ON-VERIFY ?AUTO_1261 ?AUTO_1262 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1263 - BLOCK
      ?AUTO_1264 - BLOCK
    )
    :vars
    (
      ?AUTO_1265 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1264 ) ( not ( = ?AUTO_1263 ?AUTO_1264 ) ) ( ON ?AUTO_1263 ?AUTO_1265 ) ( CLEAR ?AUTO_1263 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1263 ?AUTO_1265 ) ) ( not ( = ?AUTO_1264 ?AUTO_1265 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1263 ?AUTO_1265 )
      ( MAKE-ON ?AUTO_1263 ?AUTO_1264 )
      ( MAKE-ON-VERIFY ?AUTO_1263 ?AUTO_1264 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1266 - BLOCK
      ?AUTO_1267 - BLOCK
    )
    :vars
    (
      ?AUTO_1268 - BLOCK
      ?AUTO_1269 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1266 ?AUTO_1267 ) ) ( ON ?AUTO_1266 ?AUTO_1268 ) ( CLEAR ?AUTO_1266 ) ( not ( = ?AUTO_1266 ?AUTO_1268 ) ) ( not ( = ?AUTO_1267 ?AUTO_1268 ) ) ( HOLDING ?AUTO_1267 ) ( CLEAR ?AUTO_1269 ) ( not ( = ?AUTO_1266 ?AUTO_1269 ) ) ( not ( = ?AUTO_1267 ?AUTO_1269 ) ) ( not ( = ?AUTO_1268 ?AUTO_1269 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1267 ?AUTO_1269 )
      ( MAKE-ON ?AUTO_1266 ?AUTO_1267 )
      ( MAKE-ON-VERIFY ?AUTO_1266 ?AUTO_1267 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1334 - BLOCK
      ?AUTO_1335 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1334 ) ( CLEAR ?AUTO_1335 ) ( not ( = ?AUTO_1334 ?AUTO_1335 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1334 ?AUTO_1335 )
      ( MAKE-ON-VERIFY ?AUTO_1334 ?AUTO_1335 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1336 - BLOCK
      ?AUTO_1337 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1337 ) ( not ( = ?AUTO_1336 ?AUTO_1337 ) ) ( ON-TABLE ?AUTO_1336 ) ( CLEAR ?AUTO_1336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1336 )
      ( MAKE-ON ?AUTO_1336 ?AUTO_1337 )
      ( MAKE-ON-VERIFY ?AUTO_1336 ?AUTO_1337 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1338 - BLOCK
      ?AUTO_1339 - BLOCK
    )
    :vars
    (
      ?AUTO_1340 - BLOCK
      ?AUTO_1341 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1339 ) ( not ( = ?AUTO_1338 ?AUTO_1339 ) ) ( ON-TABLE ?AUTO_1338 ) ( CLEAR ?AUTO_1338 ) ( HOLDING ?AUTO_1340 ) ( CLEAR ?AUTO_1341 ) ( not ( = ?AUTO_1338 ?AUTO_1340 ) ) ( not ( = ?AUTO_1338 ?AUTO_1341 ) ) ( not ( = ?AUTO_1339 ?AUTO_1340 ) ) ( not ( = ?AUTO_1339 ?AUTO_1341 ) ) ( not ( = ?AUTO_1340 ?AUTO_1341 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1340 ?AUTO_1341 )
      ( MAKE-ON ?AUTO_1338 ?AUTO_1339 )
      ( MAKE-ON-VERIFY ?AUTO_1338 ?AUTO_1339 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1342 - BLOCK
      ?AUTO_1343 - BLOCK
    )
    :vars
    (
      ?AUTO_1344 - BLOCK
      ?AUTO_1345 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1342 ?AUTO_1343 ) ) ( ON-TABLE ?AUTO_1342 ) ( CLEAR ?AUTO_1342 ) ( CLEAR ?AUTO_1344 ) ( not ( = ?AUTO_1342 ?AUTO_1345 ) ) ( not ( = ?AUTO_1342 ?AUTO_1344 ) ) ( not ( = ?AUTO_1343 ?AUTO_1345 ) ) ( not ( = ?AUTO_1343 ?AUTO_1344 ) ) ( not ( = ?AUTO_1345 ?AUTO_1344 ) ) ( ON ?AUTO_1345 ?AUTO_1343 ) ( CLEAR ?AUTO_1345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1345 ?AUTO_1343 )
      ( MAKE-ON ?AUTO_1342 ?AUTO_1343 )
      ( MAKE-ON-VERIFY ?AUTO_1342 ?AUTO_1343 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1346 - BLOCK
      ?AUTO_1347 - BLOCK
    )
    :vars
    (
      ?AUTO_1349 - BLOCK
      ?AUTO_1348 - BLOCK
      ?AUTO_1350 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1346 ?AUTO_1347 ) ) ( ON-TABLE ?AUTO_1346 ) ( CLEAR ?AUTO_1346 ) ( not ( = ?AUTO_1346 ?AUTO_1349 ) ) ( not ( = ?AUTO_1346 ?AUTO_1348 ) ) ( not ( = ?AUTO_1347 ?AUTO_1349 ) ) ( not ( = ?AUTO_1347 ?AUTO_1348 ) ) ( not ( = ?AUTO_1349 ?AUTO_1348 ) ) ( ON ?AUTO_1349 ?AUTO_1347 ) ( CLEAR ?AUTO_1349 ) ( HOLDING ?AUTO_1348 ) ( CLEAR ?AUTO_1350 ) ( not ( = ?AUTO_1346 ?AUTO_1350 ) ) ( not ( = ?AUTO_1347 ?AUTO_1350 ) ) ( not ( = ?AUTO_1349 ?AUTO_1350 ) ) ( not ( = ?AUTO_1348 ?AUTO_1350 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1348 ?AUTO_1350 )
      ( MAKE-ON ?AUTO_1346 ?AUTO_1347 )
      ( MAKE-ON-VERIFY ?AUTO_1346 ?AUTO_1347 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1351 - BLOCK
      ?AUTO_1352 - BLOCK
    )
    :vars
    (
      ?AUTO_1353 - BLOCK
      ?AUTO_1354 - BLOCK
      ?AUTO_1355 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1351 ?AUTO_1352 ) ) ( ON-TABLE ?AUTO_1351 ) ( not ( = ?AUTO_1351 ?AUTO_1353 ) ) ( not ( = ?AUTO_1351 ?AUTO_1354 ) ) ( not ( = ?AUTO_1352 ?AUTO_1353 ) ) ( not ( = ?AUTO_1352 ?AUTO_1354 ) ) ( not ( = ?AUTO_1353 ?AUTO_1354 ) ) ( ON ?AUTO_1353 ?AUTO_1352 ) ( CLEAR ?AUTO_1353 ) ( CLEAR ?AUTO_1355 ) ( not ( = ?AUTO_1351 ?AUTO_1355 ) ) ( not ( = ?AUTO_1352 ?AUTO_1355 ) ) ( not ( = ?AUTO_1353 ?AUTO_1355 ) ) ( not ( = ?AUTO_1354 ?AUTO_1355 ) ) ( ON ?AUTO_1354 ?AUTO_1351 ) ( CLEAR ?AUTO_1354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1354 ?AUTO_1351 )
      ( MAKE-ON ?AUTO_1351 ?AUTO_1352 )
      ( MAKE-ON-VERIFY ?AUTO_1351 ?AUTO_1352 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1356 - BLOCK
      ?AUTO_1357 - BLOCK
    )
    :vars
    (
      ?AUTO_1358 - BLOCK
      ?AUTO_1359 - BLOCK
      ?AUTO_1360 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1356 ?AUTO_1357 ) ) ( ON-TABLE ?AUTO_1356 ) ( not ( = ?AUTO_1356 ?AUTO_1358 ) ) ( not ( = ?AUTO_1356 ?AUTO_1359 ) ) ( not ( = ?AUTO_1357 ?AUTO_1358 ) ) ( not ( = ?AUTO_1357 ?AUTO_1359 ) ) ( not ( = ?AUTO_1358 ?AUTO_1359 ) ) ( CLEAR ?AUTO_1360 ) ( not ( = ?AUTO_1356 ?AUTO_1360 ) ) ( not ( = ?AUTO_1357 ?AUTO_1360 ) ) ( not ( = ?AUTO_1358 ?AUTO_1360 ) ) ( not ( = ?AUTO_1359 ?AUTO_1360 ) ) ( ON ?AUTO_1359 ?AUTO_1356 ) ( CLEAR ?AUTO_1359 ) ( HOLDING ?AUTO_1358 ) ( CLEAR ?AUTO_1357 ) )
    :subtasks
    ( ( !STACK ?AUTO_1358 ?AUTO_1357 )
      ( MAKE-ON ?AUTO_1356 ?AUTO_1357 )
      ( MAKE-ON-VERIFY ?AUTO_1356 ?AUTO_1357 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1361 - BLOCK
      ?AUTO_1362 - BLOCK
    )
    :vars
    (
      ?AUTO_1364 - BLOCK
      ?AUTO_1363 - BLOCK
      ?AUTO_1365 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1361 ?AUTO_1362 ) ) ( ON-TABLE ?AUTO_1361 ) ( not ( = ?AUTO_1361 ?AUTO_1364 ) ) ( not ( = ?AUTO_1361 ?AUTO_1363 ) ) ( not ( = ?AUTO_1362 ?AUTO_1364 ) ) ( not ( = ?AUTO_1362 ?AUTO_1363 ) ) ( not ( = ?AUTO_1364 ?AUTO_1363 ) ) ( CLEAR ?AUTO_1365 ) ( not ( = ?AUTO_1361 ?AUTO_1365 ) ) ( not ( = ?AUTO_1362 ?AUTO_1365 ) ) ( not ( = ?AUTO_1364 ?AUTO_1365 ) ) ( not ( = ?AUTO_1363 ?AUTO_1365 ) ) ( ON ?AUTO_1363 ?AUTO_1361 ) ( CLEAR ?AUTO_1362 ) ( ON ?AUTO_1364 ?AUTO_1363 ) ( CLEAR ?AUTO_1364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1364 ?AUTO_1363 )
      ( MAKE-ON ?AUTO_1361 ?AUTO_1362 )
      ( MAKE-ON-VERIFY ?AUTO_1361 ?AUTO_1362 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1366 - BLOCK
      ?AUTO_1367 - BLOCK
    )
    :vars
    (
      ?AUTO_1369 - BLOCK
      ?AUTO_1368 - BLOCK
      ?AUTO_1370 - BLOCK
      ?AUTO_1371 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1366 ?AUTO_1367 ) ) ( ON-TABLE ?AUTO_1366 ) ( not ( = ?AUTO_1366 ?AUTO_1369 ) ) ( not ( = ?AUTO_1366 ?AUTO_1368 ) ) ( not ( = ?AUTO_1367 ?AUTO_1369 ) ) ( not ( = ?AUTO_1367 ?AUTO_1368 ) ) ( not ( = ?AUTO_1369 ?AUTO_1368 ) ) ( not ( = ?AUTO_1366 ?AUTO_1370 ) ) ( not ( = ?AUTO_1367 ?AUTO_1370 ) ) ( not ( = ?AUTO_1369 ?AUTO_1370 ) ) ( not ( = ?AUTO_1368 ?AUTO_1370 ) ) ( ON ?AUTO_1368 ?AUTO_1366 ) ( CLEAR ?AUTO_1367 ) ( ON ?AUTO_1369 ?AUTO_1368 ) ( CLEAR ?AUTO_1369 ) ( HOLDING ?AUTO_1370 ) ( CLEAR ?AUTO_1371 ) ( not ( = ?AUTO_1366 ?AUTO_1371 ) ) ( not ( = ?AUTO_1367 ?AUTO_1371 ) ) ( not ( = ?AUTO_1369 ?AUTO_1371 ) ) ( not ( = ?AUTO_1368 ?AUTO_1371 ) ) ( not ( = ?AUTO_1370 ?AUTO_1371 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1370 ?AUTO_1371 )
      ( MAKE-ON ?AUTO_1366 ?AUTO_1367 )
      ( MAKE-ON-VERIFY ?AUTO_1366 ?AUTO_1367 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1374 - BLOCK
      ?AUTO_1375 - BLOCK
    )
    :vars
    (
      ?AUTO_1377 - BLOCK
      ?AUTO_1376 - BLOCK
      ?AUTO_1378 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1374 ?AUTO_1375 ) ) ( ON-TABLE ?AUTO_1374 ) ( not ( = ?AUTO_1374 ?AUTO_1377 ) ) ( not ( = ?AUTO_1374 ?AUTO_1376 ) ) ( not ( = ?AUTO_1375 ?AUTO_1377 ) ) ( not ( = ?AUTO_1375 ?AUTO_1376 ) ) ( not ( = ?AUTO_1377 ?AUTO_1376 ) ) ( CLEAR ?AUTO_1378 ) ( not ( = ?AUTO_1374 ?AUTO_1378 ) ) ( not ( = ?AUTO_1375 ?AUTO_1378 ) ) ( not ( = ?AUTO_1377 ?AUTO_1378 ) ) ( not ( = ?AUTO_1376 ?AUTO_1378 ) ) ( ON ?AUTO_1376 ?AUTO_1374 ) ( ON ?AUTO_1377 ?AUTO_1376 ) ( CLEAR ?AUTO_1377 ) ( HOLDING ?AUTO_1375 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1375 )
      ( MAKE-ON ?AUTO_1374 ?AUTO_1375 )
      ( MAKE-ON-VERIFY ?AUTO_1374 ?AUTO_1375 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1383 - BLOCK
      ?AUTO_1384 - BLOCK
    )
    :vars
    (
      ?AUTO_1386 - BLOCK
      ?AUTO_1388 - BLOCK
      ?AUTO_1385 - BLOCK
      ?AUTO_1387 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1383 ?AUTO_1384 ) ) ( ON-TABLE ?AUTO_1383 ) ( not ( = ?AUTO_1383 ?AUTO_1386 ) ) ( not ( = ?AUTO_1383 ?AUTO_1388 ) ) ( not ( = ?AUTO_1384 ?AUTO_1386 ) ) ( not ( = ?AUTO_1384 ?AUTO_1388 ) ) ( not ( = ?AUTO_1386 ?AUTO_1388 ) ) ( not ( = ?AUTO_1383 ?AUTO_1385 ) ) ( not ( = ?AUTO_1384 ?AUTO_1385 ) ) ( not ( = ?AUTO_1386 ?AUTO_1385 ) ) ( not ( = ?AUTO_1388 ?AUTO_1385 ) ) ( ON ?AUTO_1388 ?AUTO_1383 ) ( ON ?AUTO_1386 ?AUTO_1388 ) ( CLEAR ?AUTO_1386 ) ( CLEAR ?AUTO_1387 ) ( not ( = ?AUTO_1383 ?AUTO_1387 ) ) ( not ( = ?AUTO_1384 ?AUTO_1387 ) ) ( not ( = ?AUTO_1386 ?AUTO_1387 ) ) ( not ( = ?AUTO_1388 ?AUTO_1387 ) ) ( not ( = ?AUTO_1385 ?AUTO_1387 ) ) ( ON ?AUTO_1385 ?AUTO_1384 ) ( CLEAR ?AUTO_1385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1385 ?AUTO_1384 )
      ( MAKE-ON ?AUTO_1383 ?AUTO_1384 )
      ( MAKE-ON-VERIFY ?AUTO_1383 ?AUTO_1384 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1389 - BLOCK
      ?AUTO_1390 - BLOCK
    )
    :vars
    (
      ?AUTO_1392 - BLOCK
      ?AUTO_1393 - BLOCK
      ?AUTO_1391 - BLOCK
      ?AUTO_1394 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1389 ?AUTO_1390 ) ) ( ON-TABLE ?AUTO_1389 ) ( not ( = ?AUTO_1389 ?AUTO_1392 ) ) ( not ( = ?AUTO_1389 ?AUTO_1393 ) ) ( not ( = ?AUTO_1390 ?AUTO_1392 ) ) ( not ( = ?AUTO_1390 ?AUTO_1393 ) ) ( not ( = ?AUTO_1392 ?AUTO_1393 ) ) ( not ( = ?AUTO_1389 ?AUTO_1391 ) ) ( not ( = ?AUTO_1390 ?AUTO_1391 ) ) ( not ( = ?AUTO_1392 ?AUTO_1391 ) ) ( not ( = ?AUTO_1393 ?AUTO_1391 ) ) ( ON ?AUTO_1393 ?AUTO_1389 ) ( CLEAR ?AUTO_1394 ) ( not ( = ?AUTO_1389 ?AUTO_1394 ) ) ( not ( = ?AUTO_1390 ?AUTO_1394 ) ) ( not ( = ?AUTO_1392 ?AUTO_1394 ) ) ( not ( = ?AUTO_1393 ?AUTO_1394 ) ) ( not ( = ?AUTO_1391 ?AUTO_1394 ) ) ( ON ?AUTO_1391 ?AUTO_1390 ) ( CLEAR ?AUTO_1391 ) ( HOLDING ?AUTO_1392 ) ( CLEAR ?AUTO_1393 ) )
    :subtasks
    ( ( !STACK ?AUTO_1392 ?AUTO_1393 )
      ( MAKE-ON ?AUTO_1389 ?AUTO_1390 )
      ( MAKE-ON-VERIFY ?AUTO_1389 ?AUTO_1390 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1395 - BLOCK
      ?AUTO_1396 - BLOCK
    )
    :vars
    (
      ?AUTO_1397 - BLOCK
      ?AUTO_1398 - BLOCK
      ?AUTO_1400 - BLOCK
      ?AUTO_1399 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1395 ?AUTO_1396 ) ) ( ON-TABLE ?AUTO_1395 ) ( not ( = ?AUTO_1395 ?AUTO_1397 ) ) ( not ( = ?AUTO_1395 ?AUTO_1398 ) ) ( not ( = ?AUTO_1396 ?AUTO_1397 ) ) ( not ( = ?AUTO_1396 ?AUTO_1398 ) ) ( not ( = ?AUTO_1397 ?AUTO_1398 ) ) ( not ( = ?AUTO_1395 ?AUTO_1400 ) ) ( not ( = ?AUTO_1396 ?AUTO_1400 ) ) ( not ( = ?AUTO_1397 ?AUTO_1400 ) ) ( not ( = ?AUTO_1398 ?AUTO_1400 ) ) ( ON ?AUTO_1398 ?AUTO_1395 ) ( CLEAR ?AUTO_1399 ) ( not ( = ?AUTO_1395 ?AUTO_1399 ) ) ( not ( = ?AUTO_1396 ?AUTO_1399 ) ) ( not ( = ?AUTO_1397 ?AUTO_1399 ) ) ( not ( = ?AUTO_1398 ?AUTO_1399 ) ) ( not ( = ?AUTO_1400 ?AUTO_1399 ) ) ( ON ?AUTO_1400 ?AUTO_1396 ) ( CLEAR ?AUTO_1398 ) ( ON ?AUTO_1397 ?AUTO_1400 ) ( CLEAR ?AUTO_1397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1397 ?AUTO_1400 )
      ( MAKE-ON ?AUTO_1395 ?AUTO_1396 )
      ( MAKE-ON-VERIFY ?AUTO_1395 ?AUTO_1396 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1405 - BLOCK
      ?AUTO_1406 - BLOCK
    )
    :vars
    (
      ?AUTO_1408 - BLOCK
      ?AUTO_1409 - BLOCK
      ?AUTO_1407 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1405 ?AUTO_1406 ) ) ( not ( = ?AUTO_1405 ?AUTO_1408 ) ) ( not ( = ?AUTO_1406 ?AUTO_1408 ) ) ( ON ?AUTO_1408 ?AUTO_1406 ) ( CLEAR ?AUTO_1409 ) ( not ( = ?AUTO_1405 ?AUTO_1407 ) ) ( not ( = ?AUTO_1405 ?AUTO_1409 ) ) ( not ( = ?AUTO_1406 ?AUTO_1407 ) ) ( not ( = ?AUTO_1406 ?AUTO_1409 ) ) ( not ( = ?AUTO_1408 ?AUTO_1407 ) ) ( not ( = ?AUTO_1408 ?AUTO_1409 ) ) ( not ( = ?AUTO_1407 ?AUTO_1409 ) ) ( ON ?AUTO_1407 ?AUTO_1408 ) ( CLEAR ?AUTO_1407 ) ( HOLDING ?AUTO_1405 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1405 )
      ( MAKE-ON ?AUTO_1405 ?AUTO_1406 )
      ( MAKE-ON-VERIFY ?AUTO_1405 ?AUTO_1406 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1410 - BLOCK
      ?AUTO_1411 - BLOCK
    )
    :vars
    (
      ?AUTO_1413 - BLOCK
      ?AUTO_1412 - BLOCK
      ?AUTO_1414 - BLOCK
      ?AUTO_1415 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1410 ?AUTO_1411 ) ) ( not ( = ?AUTO_1410 ?AUTO_1413 ) ) ( not ( = ?AUTO_1411 ?AUTO_1413 ) ) ( ON ?AUTO_1413 ?AUTO_1411 ) ( CLEAR ?AUTO_1412 ) ( not ( = ?AUTO_1410 ?AUTO_1414 ) ) ( not ( = ?AUTO_1410 ?AUTO_1412 ) ) ( not ( = ?AUTO_1411 ?AUTO_1414 ) ) ( not ( = ?AUTO_1411 ?AUTO_1412 ) ) ( not ( = ?AUTO_1413 ?AUTO_1414 ) ) ( not ( = ?AUTO_1413 ?AUTO_1412 ) ) ( not ( = ?AUTO_1414 ?AUTO_1412 ) ) ( ON ?AUTO_1414 ?AUTO_1413 ) ( CLEAR ?AUTO_1414 ) ( ON ?AUTO_1410 ?AUTO_1415 ) ( CLEAR ?AUTO_1410 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1410 ?AUTO_1415 ) ) ( not ( = ?AUTO_1411 ?AUTO_1415 ) ) ( not ( = ?AUTO_1413 ?AUTO_1415 ) ) ( not ( = ?AUTO_1412 ?AUTO_1415 ) ) ( not ( = ?AUTO_1414 ?AUTO_1415 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1410 ?AUTO_1415 )
      ( MAKE-ON ?AUTO_1410 ?AUTO_1411 )
      ( MAKE-ON-VERIFY ?AUTO_1410 ?AUTO_1411 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1416 - BLOCK
      ?AUTO_1417 - BLOCK
    )
    :vars
    (
      ?AUTO_1419 - BLOCK
      ?AUTO_1420 - BLOCK
      ?AUTO_1418 - BLOCK
      ?AUTO_1421 - BLOCK
      ?AUTO_1422 - BLOCK
      ?AUTO_1423 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1416 ?AUTO_1417 ) ) ( not ( = ?AUTO_1416 ?AUTO_1419 ) ) ( not ( = ?AUTO_1417 ?AUTO_1419 ) ) ( ON ?AUTO_1419 ?AUTO_1417 ) ( CLEAR ?AUTO_1420 ) ( not ( = ?AUTO_1416 ?AUTO_1418 ) ) ( not ( = ?AUTO_1416 ?AUTO_1420 ) ) ( not ( = ?AUTO_1417 ?AUTO_1418 ) ) ( not ( = ?AUTO_1417 ?AUTO_1420 ) ) ( not ( = ?AUTO_1419 ?AUTO_1418 ) ) ( not ( = ?AUTO_1419 ?AUTO_1420 ) ) ( not ( = ?AUTO_1418 ?AUTO_1420 ) ) ( ON ?AUTO_1418 ?AUTO_1419 ) ( CLEAR ?AUTO_1418 ) ( ON ?AUTO_1416 ?AUTO_1421 ) ( CLEAR ?AUTO_1416 ) ( not ( = ?AUTO_1416 ?AUTO_1421 ) ) ( not ( = ?AUTO_1417 ?AUTO_1421 ) ) ( not ( = ?AUTO_1419 ?AUTO_1421 ) ) ( not ( = ?AUTO_1420 ?AUTO_1421 ) ) ( not ( = ?AUTO_1418 ?AUTO_1421 ) ) ( HOLDING ?AUTO_1422 ) ( CLEAR ?AUTO_1423 ) ( not ( = ?AUTO_1416 ?AUTO_1422 ) ) ( not ( = ?AUTO_1416 ?AUTO_1423 ) ) ( not ( = ?AUTO_1417 ?AUTO_1422 ) ) ( not ( = ?AUTO_1417 ?AUTO_1423 ) ) ( not ( = ?AUTO_1419 ?AUTO_1422 ) ) ( not ( = ?AUTO_1419 ?AUTO_1423 ) ) ( not ( = ?AUTO_1420 ?AUTO_1422 ) ) ( not ( = ?AUTO_1420 ?AUTO_1423 ) ) ( not ( = ?AUTO_1418 ?AUTO_1422 ) ) ( not ( = ?AUTO_1418 ?AUTO_1423 ) ) ( not ( = ?AUTO_1421 ?AUTO_1422 ) ) ( not ( = ?AUTO_1421 ?AUTO_1423 ) ) ( not ( = ?AUTO_1422 ?AUTO_1423 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1422 ?AUTO_1423 )
      ( MAKE-ON ?AUTO_1416 ?AUTO_1417 )
      ( MAKE-ON-VERIFY ?AUTO_1416 ?AUTO_1417 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1424 - BLOCK
      ?AUTO_1425 - BLOCK
    )
    :vars
    (
      ?AUTO_1430 - BLOCK
      ?AUTO_1428 - BLOCK
      ?AUTO_1429 - BLOCK
      ?AUTO_1427 - BLOCK
      ?AUTO_1426 - BLOCK
      ?AUTO_1431 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1424 ?AUTO_1425 ) ) ( not ( = ?AUTO_1424 ?AUTO_1430 ) ) ( not ( = ?AUTO_1425 ?AUTO_1430 ) ) ( ON ?AUTO_1430 ?AUTO_1425 ) ( CLEAR ?AUTO_1428 ) ( not ( = ?AUTO_1424 ?AUTO_1429 ) ) ( not ( = ?AUTO_1424 ?AUTO_1428 ) ) ( not ( = ?AUTO_1425 ?AUTO_1429 ) ) ( not ( = ?AUTO_1425 ?AUTO_1428 ) ) ( not ( = ?AUTO_1430 ?AUTO_1429 ) ) ( not ( = ?AUTO_1430 ?AUTO_1428 ) ) ( not ( = ?AUTO_1429 ?AUTO_1428 ) ) ( ON ?AUTO_1429 ?AUTO_1430 ) ( CLEAR ?AUTO_1429 ) ( ON ?AUTO_1424 ?AUTO_1427 ) ( not ( = ?AUTO_1424 ?AUTO_1427 ) ) ( not ( = ?AUTO_1425 ?AUTO_1427 ) ) ( not ( = ?AUTO_1430 ?AUTO_1427 ) ) ( not ( = ?AUTO_1428 ?AUTO_1427 ) ) ( not ( = ?AUTO_1429 ?AUTO_1427 ) ) ( CLEAR ?AUTO_1426 ) ( not ( = ?AUTO_1424 ?AUTO_1431 ) ) ( not ( = ?AUTO_1424 ?AUTO_1426 ) ) ( not ( = ?AUTO_1425 ?AUTO_1431 ) ) ( not ( = ?AUTO_1425 ?AUTO_1426 ) ) ( not ( = ?AUTO_1430 ?AUTO_1431 ) ) ( not ( = ?AUTO_1430 ?AUTO_1426 ) ) ( not ( = ?AUTO_1428 ?AUTO_1431 ) ) ( not ( = ?AUTO_1428 ?AUTO_1426 ) ) ( not ( = ?AUTO_1429 ?AUTO_1431 ) ) ( not ( = ?AUTO_1429 ?AUTO_1426 ) ) ( not ( = ?AUTO_1427 ?AUTO_1431 ) ) ( not ( = ?AUTO_1427 ?AUTO_1426 ) ) ( not ( = ?AUTO_1431 ?AUTO_1426 ) ) ( ON ?AUTO_1431 ?AUTO_1424 ) ( CLEAR ?AUTO_1431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1431 ?AUTO_1424 )
      ( MAKE-ON ?AUTO_1424 ?AUTO_1425 )
      ( MAKE-ON-VERIFY ?AUTO_1424 ?AUTO_1425 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1432 - BLOCK
      ?AUTO_1433 - BLOCK
    )
    :vars
    (
      ?AUTO_1437 - BLOCK
      ?AUTO_1439 - BLOCK
      ?AUTO_1438 - BLOCK
      ?AUTO_1435 - BLOCK
      ?AUTO_1434 - BLOCK
      ?AUTO_1436 - BLOCK
      ?AUTO_1440 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1432 ?AUTO_1433 ) ) ( not ( = ?AUTO_1432 ?AUTO_1437 ) ) ( not ( = ?AUTO_1433 ?AUTO_1437 ) ) ( ON ?AUTO_1437 ?AUTO_1433 ) ( CLEAR ?AUTO_1439 ) ( not ( = ?AUTO_1432 ?AUTO_1438 ) ) ( not ( = ?AUTO_1432 ?AUTO_1439 ) ) ( not ( = ?AUTO_1433 ?AUTO_1438 ) ) ( not ( = ?AUTO_1433 ?AUTO_1439 ) ) ( not ( = ?AUTO_1437 ?AUTO_1438 ) ) ( not ( = ?AUTO_1437 ?AUTO_1439 ) ) ( not ( = ?AUTO_1438 ?AUTO_1439 ) ) ( ON ?AUTO_1438 ?AUTO_1437 ) ( CLEAR ?AUTO_1438 ) ( ON ?AUTO_1432 ?AUTO_1435 ) ( not ( = ?AUTO_1432 ?AUTO_1435 ) ) ( not ( = ?AUTO_1433 ?AUTO_1435 ) ) ( not ( = ?AUTO_1437 ?AUTO_1435 ) ) ( not ( = ?AUTO_1439 ?AUTO_1435 ) ) ( not ( = ?AUTO_1438 ?AUTO_1435 ) ) ( CLEAR ?AUTO_1434 ) ( not ( = ?AUTO_1432 ?AUTO_1436 ) ) ( not ( = ?AUTO_1432 ?AUTO_1434 ) ) ( not ( = ?AUTO_1433 ?AUTO_1436 ) ) ( not ( = ?AUTO_1433 ?AUTO_1434 ) ) ( not ( = ?AUTO_1437 ?AUTO_1436 ) ) ( not ( = ?AUTO_1437 ?AUTO_1434 ) ) ( not ( = ?AUTO_1439 ?AUTO_1436 ) ) ( not ( = ?AUTO_1439 ?AUTO_1434 ) ) ( not ( = ?AUTO_1438 ?AUTO_1436 ) ) ( not ( = ?AUTO_1438 ?AUTO_1434 ) ) ( not ( = ?AUTO_1435 ?AUTO_1436 ) ) ( not ( = ?AUTO_1435 ?AUTO_1434 ) ) ( not ( = ?AUTO_1436 ?AUTO_1434 ) ) ( ON ?AUTO_1436 ?AUTO_1432 ) ( CLEAR ?AUTO_1436 ) ( HOLDING ?AUTO_1440 ) ( not ( = ?AUTO_1432 ?AUTO_1440 ) ) ( not ( = ?AUTO_1433 ?AUTO_1440 ) ) ( not ( = ?AUTO_1437 ?AUTO_1440 ) ) ( not ( = ?AUTO_1439 ?AUTO_1440 ) ) ( not ( = ?AUTO_1438 ?AUTO_1440 ) ) ( not ( = ?AUTO_1435 ?AUTO_1440 ) ) ( not ( = ?AUTO_1434 ?AUTO_1440 ) ) ( not ( = ?AUTO_1436 ?AUTO_1440 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1440 )
      ( MAKE-ON ?AUTO_1432 ?AUTO_1433 )
      ( MAKE-ON-VERIFY ?AUTO_1432 ?AUTO_1433 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1441 - BLOCK
      ?AUTO_1442 - BLOCK
    )
    :vars
    (
      ?AUTO_1448 - BLOCK
      ?AUTO_1449 - BLOCK
      ?AUTO_1447 - BLOCK
      ?AUTO_1445 - BLOCK
      ?AUTO_1446 - BLOCK
      ?AUTO_1443 - BLOCK
      ?AUTO_1444 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1441 ?AUTO_1442 ) ) ( not ( = ?AUTO_1441 ?AUTO_1448 ) ) ( not ( = ?AUTO_1442 ?AUTO_1448 ) ) ( ON ?AUTO_1448 ?AUTO_1442 ) ( CLEAR ?AUTO_1449 ) ( not ( = ?AUTO_1441 ?AUTO_1447 ) ) ( not ( = ?AUTO_1441 ?AUTO_1449 ) ) ( not ( = ?AUTO_1442 ?AUTO_1447 ) ) ( not ( = ?AUTO_1442 ?AUTO_1449 ) ) ( not ( = ?AUTO_1448 ?AUTO_1447 ) ) ( not ( = ?AUTO_1448 ?AUTO_1449 ) ) ( not ( = ?AUTO_1447 ?AUTO_1449 ) ) ( ON ?AUTO_1447 ?AUTO_1448 ) ( CLEAR ?AUTO_1447 ) ( ON ?AUTO_1441 ?AUTO_1445 ) ( not ( = ?AUTO_1441 ?AUTO_1445 ) ) ( not ( = ?AUTO_1442 ?AUTO_1445 ) ) ( not ( = ?AUTO_1448 ?AUTO_1445 ) ) ( not ( = ?AUTO_1449 ?AUTO_1445 ) ) ( not ( = ?AUTO_1447 ?AUTO_1445 ) ) ( CLEAR ?AUTO_1446 ) ( not ( = ?AUTO_1441 ?AUTO_1443 ) ) ( not ( = ?AUTO_1441 ?AUTO_1446 ) ) ( not ( = ?AUTO_1442 ?AUTO_1443 ) ) ( not ( = ?AUTO_1442 ?AUTO_1446 ) ) ( not ( = ?AUTO_1448 ?AUTO_1443 ) ) ( not ( = ?AUTO_1448 ?AUTO_1446 ) ) ( not ( = ?AUTO_1449 ?AUTO_1443 ) ) ( not ( = ?AUTO_1449 ?AUTO_1446 ) ) ( not ( = ?AUTO_1447 ?AUTO_1443 ) ) ( not ( = ?AUTO_1447 ?AUTO_1446 ) ) ( not ( = ?AUTO_1445 ?AUTO_1443 ) ) ( not ( = ?AUTO_1445 ?AUTO_1446 ) ) ( not ( = ?AUTO_1443 ?AUTO_1446 ) ) ( ON ?AUTO_1443 ?AUTO_1441 ) ( not ( = ?AUTO_1441 ?AUTO_1444 ) ) ( not ( = ?AUTO_1442 ?AUTO_1444 ) ) ( not ( = ?AUTO_1448 ?AUTO_1444 ) ) ( not ( = ?AUTO_1449 ?AUTO_1444 ) ) ( not ( = ?AUTO_1447 ?AUTO_1444 ) ) ( not ( = ?AUTO_1445 ?AUTO_1444 ) ) ( not ( = ?AUTO_1446 ?AUTO_1444 ) ) ( not ( = ?AUTO_1443 ?AUTO_1444 ) ) ( ON ?AUTO_1444 ?AUTO_1443 ) ( CLEAR ?AUTO_1444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1444 ?AUTO_1443 )
      ( MAKE-ON ?AUTO_1441 ?AUTO_1442 )
      ( MAKE-ON-VERIFY ?AUTO_1441 ?AUTO_1442 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1450 - BLOCK
      ?AUTO_1451 - BLOCK
    )
    :vars
    (
      ?AUTO_1452 - BLOCK
      ?AUTO_1458 - BLOCK
      ?AUTO_1453 - BLOCK
      ?AUTO_1455 - BLOCK
      ?AUTO_1456 - BLOCK
      ?AUTO_1454 - BLOCK
      ?AUTO_1457 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1450 ?AUTO_1451 ) ) ( not ( = ?AUTO_1450 ?AUTO_1452 ) ) ( not ( = ?AUTO_1451 ?AUTO_1452 ) ) ( ON ?AUTO_1452 ?AUTO_1451 ) ( CLEAR ?AUTO_1458 ) ( not ( = ?AUTO_1450 ?AUTO_1453 ) ) ( not ( = ?AUTO_1450 ?AUTO_1458 ) ) ( not ( = ?AUTO_1451 ?AUTO_1453 ) ) ( not ( = ?AUTO_1451 ?AUTO_1458 ) ) ( not ( = ?AUTO_1452 ?AUTO_1453 ) ) ( not ( = ?AUTO_1452 ?AUTO_1458 ) ) ( not ( = ?AUTO_1453 ?AUTO_1458 ) ) ( ON ?AUTO_1453 ?AUTO_1452 ) ( CLEAR ?AUTO_1453 ) ( ON ?AUTO_1450 ?AUTO_1455 ) ( not ( = ?AUTO_1450 ?AUTO_1455 ) ) ( not ( = ?AUTO_1451 ?AUTO_1455 ) ) ( not ( = ?AUTO_1452 ?AUTO_1455 ) ) ( not ( = ?AUTO_1458 ?AUTO_1455 ) ) ( not ( = ?AUTO_1453 ?AUTO_1455 ) ) ( not ( = ?AUTO_1450 ?AUTO_1456 ) ) ( not ( = ?AUTO_1450 ?AUTO_1454 ) ) ( not ( = ?AUTO_1451 ?AUTO_1456 ) ) ( not ( = ?AUTO_1451 ?AUTO_1454 ) ) ( not ( = ?AUTO_1452 ?AUTO_1456 ) ) ( not ( = ?AUTO_1452 ?AUTO_1454 ) ) ( not ( = ?AUTO_1458 ?AUTO_1456 ) ) ( not ( = ?AUTO_1458 ?AUTO_1454 ) ) ( not ( = ?AUTO_1453 ?AUTO_1456 ) ) ( not ( = ?AUTO_1453 ?AUTO_1454 ) ) ( not ( = ?AUTO_1455 ?AUTO_1456 ) ) ( not ( = ?AUTO_1455 ?AUTO_1454 ) ) ( not ( = ?AUTO_1456 ?AUTO_1454 ) ) ( ON ?AUTO_1456 ?AUTO_1450 ) ( not ( = ?AUTO_1450 ?AUTO_1457 ) ) ( not ( = ?AUTO_1451 ?AUTO_1457 ) ) ( not ( = ?AUTO_1452 ?AUTO_1457 ) ) ( not ( = ?AUTO_1458 ?AUTO_1457 ) ) ( not ( = ?AUTO_1453 ?AUTO_1457 ) ) ( not ( = ?AUTO_1455 ?AUTO_1457 ) ) ( not ( = ?AUTO_1454 ?AUTO_1457 ) ) ( not ( = ?AUTO_1456 ?AUTO_1457 ) ) ( ON ?AUTO_1457 ?AUTO_1456 ) ( CLEAR ?AUTO_1457 ) ( HOLDING ?AUTO_1454 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1454 )
      ( MAKE-ON ?AUTO_1450 ?AUTO_1451 )
      ( MAKE-ON-VERIFY ?AUTO_1450 ?AUTO_1451 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1459 - BLOCK
      ?AUTO_1460 - BLOCK
    )
    :vars
    (
      ?AUTO_1465 - BLOCK
      ?AUTO_1461 - BLOCK
      ?AUTO_1462 - BLOCK
      ?AUTO_1464 - BLOCK
      ?AUTO_1463 - BLOCK
      ?AUTO_1467 - BLOCK
      ?AUTO_1466 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1459 ?AUTO_1460 ) ) ( not ( = ?AUTO_1459 ?AUTO_1465 ) ) ( not ( = ?AUTO_1460 ?AUTO_1465 ) ) ( ON ?AUTO_1465 ?AUTO_1460 ) ( CLEAR ?AUTO_1461 ) ( not ( = ?AUTO_1459 ?AUTO_1462 ) ) ( not ( = ?AUTO_1459 ?AUTO_1461 ) ) ( not ( = ?AUTO_1460 ?AUTO_1462 ) ) ( not ( = ?AUTO_1460 ?AUTO_1461 ) ) ( not ( = ?AUTO_1465 ?AUTO_1462 ) ) ( not ( = ?AUTO_1465 ?AUTO_1461 ) ) ( not ( = ?AUTO_1462 ?AUTO_1461 ) ) ( ON ?AUTO_1462 ?AUTO_1465 ) ( ON ?AUTO_1459 ?AUTO_1464 ) ( not ( = ?AUTO_1459 ?AUTO_1464 ) ) ( not ( = ?AUTO_1460 ?AUTO_1464 ) ) ( not ( = ?AUTO_1465 ?AUTO_1464 ) ) ( not ( = ?AUTO_1461 ?AUTO_1464 ) ) ( not ( = ?AUTO_1462 ?AUTO_1464 ) ) ( not ( = ?AUTO_1459 ?AUTO_1463 ) ) ( not ( = ?AUTO_1459 ?AUTO_1467 ) ) ( not ( = ?AUTO_1460 ?AUTO_1463 ) ) ( not ( = ?AUTO_1460 ?AUTO_1467 ) ) ( not ( = ?AUTO_1465 ?AUTO_1463 ) ) ( not ( = ?AUTO_1465 ?AUTO_1467 ) ) ( not ( = ?AUTO_1461 ?AUTO_1463 ) ) ( not ( = ?AUTO_1461 ?AUTO_1467 ) ) ( not ( = ?AUTO_1462 ?AUTO_1463 ) ) ( not ( = ?AUTO_1462 ?AUTO_1467 ) ) ( not ( = ?AUTO_1464 ?AUTO_1463 ) ) ( not ( = ?AUTO_1464 ?AUTO_1467 ) ) ( not ( = ?AUTO_1463 ?AUTO_1467 ) ) ( ON ?AUTO_1463 ?AUTO_1459 ) ( not ( = ?AUTO_1459 ?AUTO_1466 ) ) ( not ( = ?AUTO_1460 ?AUTO_1466 ) ) ( not ( = ?AUTO_1465 ?AUTO_1466 ) ) ( not ( = ?AUTO_1461 ?AUTO_1466 ) ) ( not ( = ?AUTO_1462 ?AUTO_1466 ) ) ( not ( = ?AUTO_1464 ?AUTO_1466 ) ) ( not ( = ?AUTO_1467 ?AUTO_1466 ) ) ( not ( = ?AUTO_1463 ?AUTO_1466 ) ) ( ON ?AUTO_1466 ?AUTO_1463 ) ( CLEAR ?AUTO_1466 ) ( ON ?AUTO_1467 ?AUTO_1462 ) ( CLEAR ?AUTO_1467 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1467 ?AUTO_1462 )
      ( MAKE-ON ?AUTO_1459 ?AUTO_1460 )
      ( MAKE-ON-VERIFY ?AUTO_1459 ?AUTO_1460 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1469 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1469 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1469 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1469 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1470 - BLOCK
    )
    :vars
    (
      ?AUTO_1471 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1470 ?AUTO_1471 ) ( CLEAR ?AUTO_1470 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1470 ?AUTO_1471 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1470 ?AUTO_1471 )
      ( MAKE-ON-TABLE ?AUTO_1470 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1470 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1472 - BLOCK
    )
    :vars
    (
      ?AUTO_1473 - BLOCK
      ?AUTO_1474 - BLOCK
      ?AUTO_1475 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1472 ?AUTO_1473 ) ( CLEAR ?AUTO_1472 ) ( not ( = ?AUTO_1472 ?AUTO_1473 ) ) ( HOLDING ?AUTO_1474 ) ( CLEAR ?AUTO_1475 ) ( not ( = ?AUTO_1472 ?AUTO_1474 ) ) ( not ( = ?AUTO_1472 ?AUTO_1475 ) ) ( not ( = ?AUTO_1473 ?AUTO_1474 ) ) ( not ( = ?AUTO_1473 ?AUTO_1475 ) ) ( not ( = ?AUTO_1474 ?AUTO_1475 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1474 ?AUTO_1475 )
      ( MAKE-ON-TABLE ?AUTO_1472 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1472 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1503 - BLOCK
      ?AUTO_1504 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1503 ) ( CLEAR ?AUTO_1504 ) ( not ( = ?AUTO_1503 ?AUTO_1504 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1503 ?AUTO_1504 )
      ( MAKE-ON-VERIFY ?AUTO_1503 ?AUTO_1504 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1505 - BLOCK
      ?AUTO_1506 - BLOCK
    )
    :vars
    (
      ?AUTO_1507 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1506 ) ( not ( = ?AUTO_1505 ?AUTO_1506 ) ) ( ON ?AUTO_1505 ?AUTO_1507 ) ( CLEAR ?AUTO_1505 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1505 ?AUTO_1507 ) ) ( not ( = ?AUTO_1506 ?AUTO_1507 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1505 ?AUTO_1507 )
      ( MAKE-ON ?AUTO_1505 ?AUTO_1506 )
      ( MAKE-ON-VERIFY ?AUTO_1505 ?AUTO_1506 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1508 - BLOCK
      ?AUTO_1509 - BLOCK
    )
    :vars
    (
      ?AUTO_1510 - BLOCK
      ?AUTO_1511 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1509 ) ( not ( = ?AUTO_1508 ?AUTO_1509 ) ) ( ON ?AUTO_1508 ?AUTO_1510 ) ( CLEAR ?AUTO_1508 ) ( not ( = ?AUTO_1508 ?AUTO_1510 ) ) ( not ( = ?AUTO_1509 ?AUTO_1510 ) ) ( HOLDING ?AUTO_1511 ) ( not ( = ?AUTO_1508 ?AUTO_1511 ) ) ( not ( = ?AUTO_1509 ?AUTO_1511 ) ) ( not ( = ?AUTO_1510 ?AUTO_1511 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1511 )
      ( MAKE-ON ?AUTO_1508 ?AUTO_1509 )
      ( MAKE-ON-VERIFY ?AUTO_1508 ?AUTO_1509 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1512 - BLOCK
      ?AUTO_1513 - BLOCK
    )
    :vars
    (
      ?AUTO_1514 - BLOCK
      ?AUTO_1515 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1513 ) ( not ( = ?AUTO_1512 ?AUTO_1513 ) ) ( ON ?AUTO_1512 ?AUTO_1514 ) ( not ( = ?AUTO_1512 ?AUTO_1514 ) ) ( not ( = ?AUTO_1513 ?AUTO_1514 ) ) ( not ( = ?AUTO_1512 ?AUTO_1515 ) ) ( not ( = ?AUTO_1513 ?AUTO_1515 ) ) ( not ( = ?AUTO_1514 ?AUTO_1515 ) ) ( ON ?AUTO_1515 ?AUTO_1512 ) ( CLEAR ?AUTO_1515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1515 ?AUTO_1512 )
      ( MAKE-ON ?AUTO_1512 ?AUTO_1513 )
      ( MAKE-ON-VERIFY ?AUTO_1512 ?AUTO_1513 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1516 - BLOCK
      ?AUTO_1517 - BLOCK
    )
    :vars
    (
      ?AUTO_1518 - BLOCK
      ?AUTO_1519 - BLOCK
      ?AUTO_1520 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1516 ?AUTO_1517 ) ) ( ON ?AUTO_1516 ?AUTO_1518 ) ( not ( = ?AUTO_1516 ?AUTO_1518 ) ) ( not ( = ?AUTO_1517 ?AUTO_1518 ) ) ( not ( = ?AUTO_1516 ?AUTO_1519 ) ) ( not ( = ?AUTO_1517 ?AUTO_1519 ) ) ( not ( = ?AUTO_1518 ?AUTO_1519 ) ) ( ON ?AUTO_1519 ?AUTO_1516 ) ( CLEAR ?AUTO_1519 ) ( HOLDING ?AUTO_1517 ) ( CLEAR ?AUTO_1520 ) ( not ( = ?AUTO_1516 ?AUTO_1520 ) ) ( not ( = ?AUTO_1517 ?AUTO_1520 ) ) ( not ( = ?AUTO_1518 ?AUTO_1520 ) ) ( not ( = ?AUTO_1519 ?AUTO_1520 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1517 ?AUTO_1520 )
      ( MAKE-ON ?AUTO_1516 ?AUTO_1517 )
      ( MAKE-ON-VERIFY ?AUTO_1516 ?AUTO_1517 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1617 - BLOCK
      ?AUTO_1618 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1617 ) ( CLEAR ?AUTO_1618 ) ( not ( = ?AUTO_1617 ?AUTO_1618 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1617 ?AUTO_1618 )
      ( MAKE-ON-VERIFY ?AUTO_1617 ?AUTO_1618 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1619 - BLOCK
      ?AUTO_1620 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1620 ) ( not ( = ?AUTO_1619 ?AUTO_1620 ) ) ( ON-TABLE ?AUTO_1619 ) ( CLEAR ?AUTO_1619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1619 )
      ( MAKE-ON ?AUTO_1619 ?AUTO_1620 )
      ( MAKE-ON-VERIFY ?AUTO_1619 ?AUTO_1620 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1621 - BLOCK
      ?AUTO_1622 - BLOCK
    )
    :vars
    (
      ?AUTO_1623 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1621 ?AUTO_1622 ) ) ( ON-TABLE ?AUTO_1621 ) ( CLEAR ?AUTO_1621 ) ( HOLDING ?AUTO_1622 ) ( CLEAR ?AUTO_1623 ) ( not ( = ?AUTO_1621 ?AUTO_1623 ) ) ( not ( = ?AUTO_1622 ?AUTO_1623 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1622 ?AUTO_1623 )
      ( MAKE-ON ?AUTO_1621 ?AUTO_1622 )
      ( MAKE-ON-VERIFY ?AUTO_1621 ?AUTO_1622 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1625 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1625 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1625 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1625 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1626 - BLOCK
    )
    :vars
    (
      ?AUTO_1627 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1626 ?AUTO_1627 ) ( CLEAR ?AUTO_1626 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1626 ?AUTO_1627 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1626 ?AUTO_1627 )
      ( MAKE-ON-TABLE ?AUTO_1626 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1626 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1629 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1629 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1629 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1629 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1630 - BLOCK
    )
    :vars
    (
      ?AUTO_1631 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1630 ?AUTO_1631 ) ( CLEAR ?AUTO_1630 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1630 ?AUTO_1631 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1630 ?AUTO_1631 )
      ( MAKE-ON-TABLE ?AUTO_1630 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1630 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1632 - BLOCK
    )
    :vars
    (
      ?AUTO_1633 - BLOCK
      ?AUTO_1634 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1632 ?AUTO_1633 ) ( CLEAR ?AUTO_1632 ) ( not ( = ?AUTO_1632 ?AUTO_1633 ) ) ( HOLDING ?AUTO_1634 ) ( not ( = ?AUTO_1632 ?AUTO_1634 ) ) ( not ( = ?AUTO_1633 ?AUTO_1634 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1634 )
      ( MAKE-ON-TABLE ?AUTO_1632 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1632 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1635 - BLOCK
    )
    :vars
    (
      ?AUTO_1636 - BLOCK
      ?AUTO_1637 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1635 ?AUTO_1636 ) ( not ( = ?AUTO_1635 ?AUTO_1636 ) ) ( not ( = ?AUTO_1635 ?AUTO_1637 ) ) ( not ( = ?AUTO_1636 ?AUTO_1637 ) ) ( ON ?AUTO_1637 ?AUTO_1635 ) ( CLEAR ?AUTO_1637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1637 ?AUTO_1635 )
      ( MAKE-ON-TABLE ?AUTO_1635 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1635 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1640 - BLOCK
      ?AUTO_1641 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1640 ) ( CLEAR ?AUTO_1641 ) ( not ( = ?AUTO_1640 ?AUTO_1641 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1640 ?AUTO_1641 )
      ( MAKE-ON-VERIFY ?AUTO_1640 ?AUTO_1641 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1642 - BLOCK
      ?AUTO_1643 - BLOCK
    )
    :vars
    (
      ?AUTO_1644 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1643 ) ( not ( = ?AUTO_1642 ?AUTO_1643 ) ) ( ON ?AUTO_1642 ?AUTO_1644 ) ( CLEAR ?AUTO_1642 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1642 ?AUTO_1644 ) ) ( not ( = ?AUTO_1643 ?AUTO_1644 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1642 ?AUTO_1644 )
      ( MAKE-ON ?AUTO_1642 ?AUTO_1643 )
      ( MAKE-ON-VERIFY ?AUTO_1642 ?AUTO_1643 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1645 - BLOCK
      ?AUTO_1646 - BLOCK
    )
    :vars
    (
      ?AUTO_1647 - BLOCK
      ?AUTO_1648 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1646 ) ( not ( = ?AUTO_1645 ?AUTO_1646 ) ) ( ON ?AUTO_1645 ?AUTO_1647 ) ( CLEAR ?AUTO_1645 ) ( not ( = ?AUTO_1645 ?AUTO_1647 ) ) ( not ( = ?AUTO_1646 ?AUTO_1647 ) ) ( HOLDING ?AUTO_1648 ) ( not ( = ?AUTO_1645 ?AUTO_1648 ) ) ( not ( = ?AUTO_1646 ?AUTO_1648 ) ) ( not ( = ?AUTO_1647 ?AUTO_1648 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1648 )
      ( MAKE-ON ?AUTO_1645 ?AUTO_1646 )
      ( MAKE-ON-VERIFY ?AUTO_1645 ?AUTO_1646 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1649 - BLOCK
      ?AUTO_1650 - BLOCK
    )
    :vars
    (
      ?AUTO_1651 - BLOCK
      ?AUTO_1652 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1649 ?AUTO_1650 ) ) ( ON ?AUTO_1649 ?AUTO_1651 ) ( CLEAR ?AUTO_1649 ) ( not ( = ?AUTO_1649 ?AUTO_1651 ) ) ( not ( = ?AUTO_1650 ?AUTO_1651 ) ) ( not ( = ?AUTO_1649 ?AUTO_1652 ) ) ( not ( = ?AUTO_1650 ?AUTO_1652 ) ) ( not ( = ?AUTO_1651 ?AUTO_1652 ) ) ( ON ?AUTO_1652 ?AUTO_1650 ) ( CLEAR ?AUTO_1652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1652 ?AUTO_1650 )
      ( MAKE-ON ?AUTO_1649 ?AUTO_1650 )
      ( MAKE-ON-VERIFY ?AUTO_1649 ?AUTO_1650 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1653 - BLOCK
      ?AUTO_1654 - BLOCK
    )
    :vars
    (
      ?AUTO_1655 - BLOCK
      ?AUTO_1656 - BLOCK
      ?AUTO_1657 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1653 ?AUTO_1654 ) ) ( ON ?AUTO_1653 ?AUTO_1655 ) ( CLEAR ?AUTO_1653 ) ( not ( = ?AUTO_1653 ?AUTO_1655 ) ) ( not ( = ?AUTO_1654 ?AUTO_1655 ) ) ( not ( = ?AUTO_1653 ?AUTO_1656 ) ) ( not ( = ?AUTO_1654 ?AUTO_1656 ) ) ( not ( = ?AUTO_1655 ?AUTO_1656 ) ) ( ON ?AUTO_1656 ?AUTO_1654 ) ( CLEAR ?AUTO_1656 ) ( HOLDING ?AUTO_1657 ) ( not ( = ?AUTO_1653 ?AUTO_1657 ) ) ( not ( = ?AUTO_1654 ?AUTO_1657 ) ) ( not ( = ?AUTO_1655 ?AUTO_1657 ) ) ( not ( = ?AUTO_1656 ?AUTO_1657 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1657 )
      ( MAKE-ON ?AUTO_1653 ?AUTO_1654 )
      ( MAKE-ON-VERIFY ?AUTO_1653 ?AUTO_1654 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1658 - BLOCK
      ?AUTO_1659 - BLOCK
    )
    :vars
    (
      ?AUTO_1661 - BLOCK
      ?AUTO_1662 - BLOCK
      ?AUTO_1660 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1658 ?AUTO_1659 ) ) ( ON ?AUTO_1658 ?AUTO_1661 ) ( CLEAR ?AUTO_1658 ) ( not ( = ?AUTO_1658 ?AUTO_1661 ) ) ( not ( = ?AUTO_1659 ?AUTO_1661 ) ) ( not ( = ?AUTO_1658 ?AUTO_1662 ) ) ( not ( = ?AUTO_1659 ?AUTO_1662 ) ) ( not ( = ?AUTO_1661 ?AUTO_1662 ) ) ( ON ?AUTO_1662 ?AUTO_1659 ) ( not ( = ?AUTO_1658 ?AUTO_1660 ) ) ( not ( = ?AUTO_1659 ?AUTO_1660 ) ) ( not ( = ?AUTO_1661 ?AUTO_1660 ) ) ( not ( = ?AUTO_1662 ?AUTO_1660 ) ) ( ON ?AUTO_1660 ?AUTO_1662 ) ( CLEAR ?AUTO_1660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1660 ?AUTO_1662 )
      ( MAKE-ON ?AUTO_1658 ?AUTO_1659 )
      ( MAKE-ON-VERIFY ?AUTO_1658 ?AUTO_1659 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1664 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1664 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1664 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1664 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1665 - BLOCK
    )
    :vars
    (
      ?AUTO_1666 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1665 ?AUTO_1666 ) ( CLEAR ?AUTO_1665 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1665 ?AUTO_1666 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1665 ?AUTO_1666 )
      ( MAKE-ON-TABLE ?AUTO_1665 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1665 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1667 - BLOCK
    )
    :vars
    (
      ?AUTO_1668 - BLOCK
      ?AUTO_1669 - BLOCK
      ?AUTO_1670 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1667 ?AUTO_1668 ) ( CLEAR ?AUTO_1667 ) ( not ( = ?AUTO_1667 ?AUTO_1668 ) ) ( HOLDING ?AUTO_1669 ) ( CLEAR ?AUTO_1670 ) ( not ( = ?AUTO_1667 ?AUTO_1669 ) ) ( not ( = ?AUTO_1667 ?AUTO_1670 ) ) ( not ( = ?AUTO_1668 ?AUTO_1669 ) ) ( not ( = ?AUTO_1668 ?AUTO_1670 ) ) ( not ( = ?AUTO_1669 ?AUTO_1670 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1669 ?AUTO_1670 )
      ( MAKE-ON-TABLE ?AUTO_1667 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1667 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1671 - BLOCK
    )
    :vars
    (
      ?AUTO_1672 - BLOCK
      ?AUTO_1674 - BLOCK
      ?AUTO_1673 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1671 ?AUTO_1672 ) ( not ( = ?AUTO_1671 ?AUTO_1672 ) ) ( CLEAR ?AUTO_1674 ) ( not ( = ?AUTO_1671 ?AUTO_1673 ) ) ( not ( = ?AUTO_1671 ?AUTO_1674 ) ) ( not ( = ?AUTO_1672 ?AUTO_1673 ) ) ( not ( = ?AUTO_1672 ?AUTO_1674 ) ) ( not ( = ?AUTO_1673 ?AUTO_1674 ) ) ( ON ?AUTO_1673 ?AUTO_1671 ) ( CLEAR ?AUTO_1673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1673 ?AUTO_1671 )
      ( MAKE-ON-TABLE ?AUTO_1671 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1671 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1675 - BLOCK
    )
    :vars
    (
      ?AUTO_1676 - BLOCK
      ?AUTO_1678 - BLOCK
      ?AUTO_1677 - BLOCK
      ?AUTO_1679 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1675 ?AUTO_1676 ) ( not ( = ?AUTO_1675 ?AUTO_1676 ) ) ( CLEAR ?AUTO_1678 ) ( not ( = ?AUTO_1675 ?AUTO_1677 ) ) ( not ( = ?AUTO_1675 ?AUTO_1678 ) ) ( not ( = ?AUTO_1676 ?AUTO_1677 ) ) ( not ( = ?AUTO_1676 ?AUTO_1678 ) ) ( not ( = ?AUTO_1677 ?AUTO_1678 ) ) ( ON ?AUTO_1677 ?AUTO_1675 ) ( CLEAR ?AUTO_1677 ) ( HOLDING ?AUTO_1679 ) ( not ( = ?AUTO_1675 ?AUTO_1679 ) ) ( not ( = ?AUTO_1676 ?AUTO_1679 ) ) ( not ( = ?AUTO_1678 ?AUTO_1679 ) ) ( not ( = ?AUTO_1677 ?AUTO_1679 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1679 )
      ( MAKE-ON-TABLE ?AUTO_1675 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1675 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1685 - BLOCK
      ?AUTO_1686 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1685 ) ( CLEAR ?AUTO_1686 ) ( not ( = ?AUTO_1685 ?AUTO_1686 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1685 ?AUTO_1686 )
      ( MAKE-ON-VERIFY ?AUTO_1685 ?AUTO_1686 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1687 - BLOCK
      ?AUTO_1688 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1688 ) ( not ( = ?AUTO_1687 ?AUTO_1688 ) ) ( ON-TABLE ?AUTO_1687 ) ( CLEAR ?AUTO_1687 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1687 )
      ( MAKE-ON ?AUTO_1687 ?AUTO_1688 )
      ( MAKE-ON-VERIFY ?AUTO_1687 ?AUTO_1688 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1689 - BLOCK
      ?AUTO_1690 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1689 ?AUTO_1690 ) ) ( ON-TABLE ?AUTO_1689 ) ( CLEAR ?AUTO_1689 ) ( HOLDING ?AUTO_1690 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1690 )
      ( MAKE-ON ?AUTO_1689 ?AUTO_1690 )
      ( MAKE-ON-VERIFY ?AUTO_1689 ?AUTO_1690 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1693 - BLOCK
      ?AUTO_1694 - BLOCK
    )
    :vars
    (
      ?AUTO_1695 - BLOCK
      ?AUTO_1696 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1694 ) ( not ( = ?AUTO_1693 ?AUTO_1694 ) ) ( ON-TABLE ?AUTO_1693 ) ( CLEAR ?AUTO_1693 ) ( HOLDING ?AUTO_1695 ) ( CLEAR ?AUTO_1696 ) ( not ( = ?AUTO_1693 ?AUTO_1695 ) ) ( not ( = ?AUTO_1693 ?AUTO_1696 ) ) ( not ( = ?AUTO_1694 ?AUTO_1695 ) ) ( not ( = ?AUTO_1694 ?AUTO_1696 ) ) ( not ( = ?AUTO_1695 ?AUTO_1696 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1695 ?AUTO_1696 )
      ( MAKE-ON ?AUTO_1693 ?AUTO_1694 )
      ( MAKE-ON-VERIFY ?AUTO_1693 ?AUTO_1694 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1697 - BLOCK
      ?AUTO_1698 - BLOCK
    )
    :vars
    (
      ?AUTO_1699 - BLOCK
      ?AUTO_1700 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1697 ?AUTO_1698 ) ) ( ON-TABLE ?AUTO_1697 ) ( CLEAR ?AUTO_1697 ) ( CLEAR ?AUTO_1699 ) ( not ( = ?AUTO_1697 ?AUTO_1700 ) ) ( not ( = ?AUTO_1697 ?AUTO_1699 ) ) ( not ( = ?AUTO_1698 ?AUTO_1700 ) ) ( not ( = ?AUTO_1698 ?AUTO_1699 ) ) ( not ( = ?AUTO_1700 ?AUTO_1699 ) ) ( ON ?AUTO_1700 ?AUTO_1698 ) ( CLEAR ?AUTO_1700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1700 ?AUTO_1698 )
      ( MAKE-ON ?AUTO_1697 ?AUTO_1698 )
      ( MAKE-ON-VERIFY ?AUTO_1697 ?AUTO_1698 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1701 - BLOCK
      ?AUTO_1702 - BLOCK
    )
    :vars
    (
      ?AUTO_1704 - BLOCK
      ?AUTO_1703 - BLOCK
      ?AUTO_1705 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1701 ?AUTO_1702 ) ) ( ON-TABLE ?AUTO_1701 ) ( CLEAR ?AUTO_1701 ) ( CLEAR ?AUTO_1704 ) ( not ( = ?AUTO_1701 ?AUTO_1703 ) ) ( not ( = ?AUTO_1701 ?AUTO_1704 ) ) ( not ( = ?AUTO_1702 ?AUTO_1703 ) ) ( not ( = ?AUTO_1702 ?AUTO_1704 ) ) ( not ( = ?AUTO_1703 ?AUTO_1704 ) ) ( ON ?AUTO_1703 ?AUTO_1702 ) ( CLEAR ?AUTO_1703 ) ( HOLDING ?AUTO_1705 ) ( not ( = ?AUTO_1701 ?AUTO_1705 ) ) ( not ( = ?AUTO_1702 ?AUTO_1705 ) ) ( not ( = ?AUTO_1704 ?AUTO_1705 ) ) ( not ( = ?AUTO_1703 ?AUTO_1705 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1705 )
      ( MAKE-ON ?AUTO_1701 ?AUTO_1702 )
      ( MAKE-ON-VERIFY ?AUTO_1701 ?AUTO_1702 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1714 - BLOCK
      ?AUTO_1715 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1714 ) ( CLEAR ?AUTO_1715 ) ( not ( = ?AUTO_1714 ?AUTO_1715 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1714 ?AUTO_1715 )
      ( MAKE-ON-VERIFY ?AUTO_1714 ?AUTO_1715 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1716 - BLOCK
      ?AUTO_1717 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1717 ) ( not ( = ?AUTO_1716 ?AUTO_1717 ) ) ( ON-TABLE ?AUTO_1716 ) ( CLEAR ?AUTO_1716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1716 )
      ( MAKE-ON ?AUTO_1716 ?AUTO_1717 )
      ( MAKE-ON-VERIFY ?AUTO_1716 ?AUTO_1717 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1718 - BLOCK
      ?AUTO_1719 - BLOCK
    )
    :vars
    (
      ?AUTO_1720 - BLOCK
      ?AUTO_1721 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1719 ) ( not ( = ?AUTO_1718 ?AUTO_1719 ) ) ( ON-TABLE ?AUTO_1718 ) ( CLEAR ?AUTO_1718 ) ( HOLDING ?AUTO_1720 ) ( CLEAR ?AUTO_1721 ) ( not ( = ?AUTO_1718 ?AUTO_1720 ) ) ( not ( = ?AUTO_1718 ?AUTO_1721 ) ) ( not ( = ?AUTO_1719 ?AUTO_1720 ) ) ( not ( = ?AUTO_1719 ?AUTO_1721 ) ) ( not ( = ?AUTO_1720 ?AUTO_1721 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1720 ?AUTO_1721 )
      ( MAKE-ON ?AUTO_1718 ?AUTO_1719 )
      ( MAKE-ON-VERIFY ?AUTO_1718 ?AUTO_1719 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1738 - BLOCK
      ?AUTO_1739 - BLOCK
    )
    :vars
    (
      ?AUTO_1741 - BLOCK
      ?AUTO_1740 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1739 ) ( not ( = ?AUTO_1738 ?AUTO_1739 ) ) ( ON ?AUTO_1738 ?AUTO_1741 ) ( not ( = ?AUTO_1738 ?AUTO_1741 ) ) ( not ( = ?AUTO_1739 ?AUTO_1741 ) ) ( not ( = ?AUTO_1738 ?AUTO_1740 ) ) ( not ( = ?AUTO_1739 ?AUTO_1740 ) ) ( not ( = ?AUTO_1741 ?AUTO_1740 ) ) ( ON ?AUTO_1740 ?AUTO_1738 ) ( CLEAR ?AUTO_1740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1740 ?AUTO_1738 )
      ( MAKE-ON ?AUTO_1738 ?AUTO_1739 )
      ( MAKE-ON-VERIFY ?AUTO_1738 ?AUTO_1739 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1744 - BLOCK
      ?AUTO_1745 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1744 ) ( CLEAR ?AUTO_1745 ) ( not ( = ?AUTO_1744 ?AUTO_1745 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1744 ?AUTO_1745 )
      ( MAKE-ON-VERIFY ?AUTO_1744 ?AUTO_1745 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1746 - BLOCK
      ?AUTO_1747 - BLOCK
    )
    :vars
    (
      ?AUTO_1748 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1747 ) ( not ( = ?AUTO_1746 ?AUTO_1747 ) ) ( ON ?AUTO_1746 ?AUTO_1748 ) ( CLEAR ?AUTO_1746 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1746 ?AUTO_1748 ) ) ( not ( = ?AUTO_1747 ?AUTO_1748 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1746 ?AUTO_1748 )
      ( MAKE-ON ?AUTO_1746 ?AUTO_1747 )
      ( MAKE-ON-VERIFY ?AUTO_1746 ?AUTO_1747 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1749 - BLOCK
      ?AUTO_1750 - BLOCK
    )
    :vars
    (
      ?AUTO_1751 - BLOCK
      ?AUTO_1752 - BLOCK
      ?AUTO_1753 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1750 ) ( not ( = ?AUTO_1749 ?AUTO_1750 ) ) ( ON ?AUTO_1749 ?AUTO_1751 ) ( CLEAR ?AUTO_1749 ) ( not ( = ?AUTO_1749 ?AUTO_1751 ) ) ( not ( = ?AUTO_1750 ?AUTO_1751 ) ) ( HOLDING ?AUTO_1752 ) ( CLEAR ?AUTO_1753 ) ( not ( = ?AUTO_1749 ?AUTO_1752 ) ) ( not ( = ?AUTO_1749 ?AUTO_1753 ) ) ( not ( = ?AUTO_1750 ?AUTO_1752 ) ) ( not ( = ?AUTO_1750 ?AUTO_1753 ) ) ( not ( = ?AUTO_1751 ?AUTO_1752 ) ) ( not ( = ?AUTO_1751 ?AUTO_1753 ) ) ( not ( = ?AUTO_1752 ?AUTO_1753 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1752 ?AUTO_1753 )
      ( MAKE-ON ?AUTO_1749 ?AUTO_1750 )
      ( MAKE-ON-VERIFY ?AUTO_1749 ?AUTO_1750 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1756 - BLOCK
      ?AUTO_1757 - BLOCK
    )
    :vars
    (
      ?AUTO_1758 - BLOCK
      ?AUTO_1759 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1756 ?AUTO_1757 ) ) ( ON ?AUTO_1756 ?AUTO_1758 ) ( CLEAR ?AUTO_1756 ) ( not ( = ?AUTO_1756 ?AUTO_1758 ) ) ( not ( = ?AUTO_1757 ?AUTO_1758 ) ) ( HOLDING ?AUTO_1757 ) ( CLEAR ?AUTO_1759 ) ( not ( = ?AUTO_1756 ?AUTO_1759 ) ) ( not ( = ?AUTO_1757 ?AUTO_1759 ) ) ( not ( = ?AUTO_1758 ?AUTO_1759 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1757 ?AUTO_1759 )
      ( MAKE-ON ?AUTO_1756 ?AUTO_1757 )
      ( MAKE-ON-VERIFY ?AUTO_1756 ?AUTO_1757 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1764 - BLOCK
      ?AUTO_1765 - BLOCK
    )
    :vars
    (
      ?AUTO_1768 - BLOCK
      ?AUTO_1767 - BLOCK
      ?AUTO_1766 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1765 ) ( not ( = ?AUTO_1764 ?AUTO_1765 ) ) ( ON ?AUTO_1764 ?AUTO_1768 ) ( not ( = ?AUTO_1764 ?AUTO_1768 ) ) ( not ( = ?AUTO_1765 ?AUTO_1768 ) ) ( CLEAR ?AUTO_1767 ) ( not ( = ?AUTO_1764 ?AUTO_1766 ) ) ( not ( = ?AUTO_1764 ?AUTO_1767 ) ) ( not ( = ?AUTO_1765 ?AUTO_1766 ) ) ( not ( = ?AUTO_1765 ?AUTO_1767 ) ) ( not ( = ?AUTO_1768 ?AUTO_1766 ) ) ( not ( = ?AUTO_1768 ?AUTO_1767 ) ) ( not ( = ?AUTO_1766 ?AUTO_1767 ) ) ( ON ?AUTO_1766 ?AUTO_1764 ) ( CLEAR ?AUTO_1766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1766 ?AUTO_1764 )
      ( MAKE-ON ?AUTO_1764 ?AUTO_1765 )
      ( MAKE-ON-VERIFY ?AUTO_1764 ?AUTO_1765 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1769 - BLOCK
      ?AUTO_1770 - BLOCK
    )
    :vars
    (
      ?AUTO_1773 - BLOCK
      ?AUTO_1771 - BLOCK
      ?AUTO_1772 - BLOCK
      ?AUTO_1774 - BLOCK
      ?AUTO_1775 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1770 ) ( not ( = ?AUTO_1769 ?AUTO_1770 ) ) ( ON ?AUTO_1769 ?AUTO_1773 ) ( not ( = ?AUTO_1769 ?AUTO_1773 ) ) ( not ( = ?AUTO_1770 ?AUTO_1773 ) ) ( CLEAR ?AUTO_1771 ) ( not ( = ?AUTO_1769 ?AUTO_1772 ) ) ( not ( = ?AUTO_1769 ?AUTO_1771 ) ) ( not ( = ?AUTO_1770 ?AUTO_1772 ) ) ( not ( = ?AUTO_1770 ?AUTO_1771 ) ) ( not ( = ?AUTO_1773 ?AUTO_1772 ) ) ( not ( = ?AUTO_1773 ?AUTO_1771 ) ) ( not ( = ?AUTO_1772 ?AUTO_1771 ) ) ( ON ?AUTO_1772 ?AUTO_1769 ) ( CLEAR ?AUTO_1772 ) ( HOLDING ?AUTO_1774 ) ( CLEAR ?AUTO_1775 ) ( not ( = ?AUTO_1769 ?AUTO_1774 ) ) ( not ( = ?AUTO_1769 ?AUTO_1775 ) ) ( not ( = ?AUTO_1770 ?AUTO_1774 ) ) ( not ( = ?AUTO_1770 ?AUTO_1775 ) ) ( not ( = ?AUTO_1773 ?AUTO_1774 ) ) ( not ( = ?AUTO_1773 ?AUTO_1775 ) ) ( not ( = ?AUTO_1771 ?AUTO_1774 ) ) ( not ( = ?AUTO_1771 ?AUTO_1775 ) ) ( not ( = ?AUTO_1772 ?AUTO_1774 ) ) ( not ( = ?AUTO_1772 ?AUTO_1775 ) ) ( not ( = ?AUTO_1774 ?AUTO_1775 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1774 ?AUTO_1775 )
      ( MAKE-ON ?AUTO_1769 ?AUTO_1770 )
      ( MAKE-ON-VERIFY ?AUTO_1769 ?AUTO_1770 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1776 - BLOCK
      ?AUTO_1777 - BLOCK
    )
    :vars
    (
      ?AUTO_1782 - BLOCK
      ?AUTO_1778 - BLOCK
      ?AUTO_1779 - BLOCK
      ?AUTO_1781 - BLOCK
      ?AUTO_1780 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1777 ) ( not ( = ?AUTO_1776 ?AUTO_1777 ) ) ( ON ?AUTO_1776 ?AUTO_1782 ) ( not ( = ?AUTO_1776 ?AUTO_1782 ) ) ( not ( = ?AUTO_1777 ?AUTO_1782 ) ) ( CLEAR ?AUTO_1778 ) ( not ( = ?AUTO_1776 ?AUTO_1779 ) ) ( not ( = ?AUTO_1776 ?AUTO_1778 ) ) ( not ( = ?AUTO_1777 ?AUTO_1779 ) ) ( not ( = ?AUTO_1777 ?AUTO_1778 ) ) ( not ( = ?AUTO_1782 ?AUTO_1779 ) ) ( not ( = ?AUTO_1782 ?AUTO_1778 ) ) ( not ( = ?AUTO_1779 ?AUTO_1778 ) ) ( ON ?AUTO_1779 ?AUTO_1776 ) ( CLEAR ?AUTO_1781 ) ( not ( = ?AUTO_1776 ?AUTO_1780 ) ) ( not ( = ?AUTO_1776 ?AUTO_1781 ) ) ( not ( = ?AUTO_1777 ?AUTO_1780 ) ) ( not ( = ?AUTO_1777 ?AUTO_1781 ) ) ( not ( = ?AUTO_1782 ?AUTO_1780 ) ) ( not ( = ?AUTO_1782 ?AUTO_1781 ) ) ( not ( = ?AUTO_1778 ?AUTO_1780 ) ) ( not ( = ?AUTO_1778 ?AUTO_1781 ) ) ( not ( = ?AUTO_1779 ?AUTO_1780 ) ) ( not ( = ?AUTO_1779 ?AUTO_1781 ) ) ( not ( = ?AUTO_1780 ?AUTO_1781 ) ) ( ON ?AUTO_1780 ?AUTO_1779 ) ( CLEAR ?AUTO_1780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1780 ?AUTO_1779 )
      ( MAKE-ON ?AUTO_1776 ?AUTO_1777 )
      ( MAKE-ON-VERIFY ?AUTO_1776 ?AUTO_1777 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1783 - BLOCK
      ?AUTO_1784 - BLOCK
    )
    :vars
    (
      ?AUTO_1789 - BLOCK
      ?AUTO_1786 - BLOCK
      ?AUTO_1785 - BLOCK
      ?AUTO_1788 - BLOCK
      ?AUTO_1787 - BLOCK
      ?AUTO_1790 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1784 ) ( not ( = ?AUTO_1783 ?AUTO_1784 ) ) ( ON ?AUTO_1783 ?AUTO_1789 ) ( not ( = ?AUTO_1783 ?AUTO_1789 ) ) ( not ( = ?AUTO_1784 ?AUTO_1789 ) ) ( CLEAR ?AUTO_1786 ) ( not ( = ?AUTO_1783 ?AUTO_1785 ) ) ( not ( = ?AUTO_1783 ?AUTO_1786 ) ) ( not ( = ?AUTO_1784 ?AUTO_1785 ) ) ( not ( = ?AUTO_1784 ?AUTO_1786 ) ) ( not ( = ?AUTO_1789 ?AUTO_1785 ) ) ( not ( = ?AUTO_1789 ?AUTO_1786 ) ) ( not ( = ?AUTO_1785 ?AUTO_1786 ) ) ( ON ?AUTO_1785 ?AUTO_1783 ) ( CLEAR ?AUTO_1788 ) ( not ( = ?AUTO_1783 ?AUTO_1787 ) ) ( not ( = ?AUTO_1783 ?AUTO_1788 ) ) ( not ( = ?AUTO_1784 ?AUTO_1787 ) ) ( not ( = ?AUTO_1784 ?AUTO_1788 ) ) ( not ( = ?AUTO_1789 ?AUTO_1787 ) ) ( not ( = ?AUTO_1789 ?AUTO_1788 ) ) ( not ( = ?AUTO_1786 ?AUTO_1787 ) ) ( not ( = ?AUTO_1786 ?AUTO_1788 ) ) ( not ( = ?AUTO_1785 ?AUTO_1787 ) ) ( not ( = ?AUTO_1785 ?AUTO_1788 ) ) ( not ( = ?AUTO_1787 ?AUTO_1788 ) ) ( ON ?AUTO_1787 ?AUTO_1785 ) ( CLEAR ?AUTO_1787 ) ( HOLDING ?AUTO_1790 ) ( not ( = ?AUTO_1783 ?AUTO_1790 ) ) ( not ( = ?AUTO_1784 ?AUTO_1790 ) ) ( not ( = ?AUTO_1789 ?AUTO_1790 ) ) ( not ( = ?AUTO_1786 ?AUTO_1790 ) ) ( not ( = ?AUTO_1785 ?AUTO_1790 ) ) ( not ( = ?AUTO_1788 ?AUTO_1790 ) ) ( not ( = ?AUTO_1787 ?AUTO_1790 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1790 )
      ( MAKE-ON ?AUTO_1783 ?AUTO_1784 )
      ( MAKE-ON-VERIFY ?AUTO_1783 ?AUTO_1784 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1793 - BLOCK
      ?AUTO_1794 - BLOCK
    )
    :vars
    (
      ?AUTO_1797 - BLOCK
      ?AUTO_1795 - BLOCK
      ?AUTO_1798 - BLOCK
      ?AUTO_1796 - BLOCK
      ?AUTO_1799 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1794 ) ( not ( = ?AUTO_1793 ?AUTO_1794 ) ) ( ON ?AUTO_1793 ?AUTO_1797 ) ( not ( = ?AUTO_1793 ?AUTO_1797 ) ) ( not ( = ?AUTO_1794 ?AUTO_1797 ) ) ( not ( = ?AUTO_1793 ?AUTO_1795 ) ) ( not ( = ?AUTO_1793 ?AUTO_1798 ) ) ( not ( = ?AUTO_1794 ?AUTO_1795 ) ) ( not ( = ?AUTO_1794 ?AUTO_1798 ) ) ( not ( = ?AUTO_1797 ?AUTO_1795 ) ) ( not ( = ?AUTO_1797 ?AUTO_1798 ) ) ( not ( = ?AUTO_1795 ?AUTO_1798 ) ) ( ON ?AUTO_1795 ?AUTO_1793 ) ( CLEAR ?AUTO_1796 ) ( not ( = ?AUTO_1793 ?AUTO_1799 ) ) ( not ( = ?AUTO_1793 ?AUTO_1796 ) ) ( not ( = ?AUTO_1794 ?AUTO_1799 ) ) ( not ( = ?AUTO_1794 ?AUTO_1796 ) ) ( not ( = ?AUTO_1797 ?AUTO_1799 ) ) ( not ( = ?AUTO_1797 ?AUTO_1796 ) ) ( not ( = ?AUTO_1798 ?AUTO_1799 ) ) ( not ( = ?AUTO_1798 ?AUTO_1796 ) ) ( not ( = ?AUTO_1795 ?AUTO_1799 ) ) ( not ( = ?AUTO_1795 ?AUTO_1796 ) ) ( not ( = ?AUTO_1799 ?AUTO_1796 ) ) ( ON ?AUTO_1799 ?AUTO_1795 ) ( CLEAR ?AUTO_1799 ) ( HOLDING ?AUTO_1798 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1798 )
      ( MAKE-ON ?AUTO_1793 ?AUTO_1794 )
      ( MAKE-ON-VERIFY ?AUTO_1793 ?AUTO_1794 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1800 - BLOCK
      ?AUTO_1801 - BLOCK
    )
    :vars
    (
      ?AUTO_1805 - BLOCK
      ?AUTO_1803 - BLOCK
      ?AUTO_1804 - BLOCK
      ?AUTO_1806 - BLOCK
      ?AUTO_1802 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1801 ) ( not ( = ?AUTO_1800 ?AUTO_1801 ) ) ( ON ?AUTO_1800 ?AUTO_1805 ) ( not ( = ?AUTO_1800 ?AUTO_1805 ) ) ( not ( = ?AUTO_1801 ?AUTO_1805 ) ) ( not ( = ?AUTO_1800 ?AUTO_1803 ) ) ( not ( = ?AUTO_1800 ?AUTO_1804 ) ) ( not ( = ?AUTO_1801 ?AUTO_1803 ) ) ( not ( = ?AUTO_1801 ?AUTO_1804 ) ) ( not ( = ?AUTO_1805 ?AUTO_1803 ) ) ( not ( = ?AUTO_1805 ?AUTO_1804 ) ) ( not ( = ?AUTO_1803 ?AUTO_1804 ) ) ( ON ?AUTO_1803 ?AUTO_1800 ) ( not ( = ?AUTO_1800 ?AUTO_1806 ) ) ( not ( = ?AUTO_1800 ?AUTO_1802 ) ) ( not ( = ?AUTO_1801 ?AUTO_1806 ) ) ( not ( = ?AUTO_1801 ?AUTO_1802 ) ) ( not ( = ?AUTO_1805 ?AUTO_1806 ) ) ( not ( = ?AUTO_1805 ?AUTO_1802 ) ) ( not ( = ?AUTO_1804 ?AUTO_1806 ) ) ( not ( = ?AUTO_1804 ?AUTO_1802 ) ) ( not ( = ?AUTO_1803 ?AUTO_1806 ) ) ( not ( = ?AUTO_1803 ?AUTO_1802 ) ) ( not ( = ?AUTO_1806 ?AUTO_1802 ) ) ( ON ?AUTO_1806 ?AUTO_1803 ) ( CLEAR ?AUTO_1806 ) ( ON ?AUTO_1804 ?AUTO_1802 ) ( CLEAR ?AUTO_1804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1804 ?AUTO_1802 )
      ( MAKE-ON ?AUTO_1800 ?AUTO_1801 )
      ( MAKE-ON-VERIFY ?AUTO_1800 ?AUTO_1801 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1809 - BLOCK
      ?AUTO_1810 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1809 ) ( CLEAR ?AUTO_1810 ) ( not ( = ?AUTO_1809 ?AUTO_1810 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1809 ?AUTO_1810 )
      ( MAKE-ON-VERIFY ?AUTO_1809 ?AUTO_1810 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1811 - BLOCK
      ?AUTO_1812 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1812 ) ( not ( = ?AUTO_1811 ?AUTO_1812 ) ) ( ON-TABLE ?AUTO_1811 ) ( CLEAR ?AUTO_1811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1811 )
      ( MAKE-ON ?AUTO_1811 ?AUTO_1812 )
      ( MAKE-ON-VERIFY ?AUTO_1811 ?AUTO_1812 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1813 - BLOCK
      ?AUTO_1814 - BLOCK
    )
    :vars
    (
      ?AUTO_1815 - BLOCK
      ?AUTO_1816 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1814 ) ( not ( = ?AUTO_1813 ?AUTO_1814 ) ) ( ON-TABLE ?AUTO_1813 ) ( CLEAR ?AUTO_1813 ) ( HOLDING ?AUTO_1815 ) ( CLEAR ?AUTO_1816 ) ( not ( = ?AUTO_1813 ?AUTO_1815 ) ) ( not ( = ?AUTO_1813 ?AUTO_1816 ) ) ( not ( = ?AUTO_1814 ?AUTO_1815 ) ) ( not ( = ?AUTO_1814 ?AUTO_1816 ) ) ( not ( = ?AUTO_1815 ?AUTO_1816 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1815 ?AUTO_1816 )
      ( MAKE-ON ?AUTO_1813 ?AUTO_1814 )
      ( MAKE-ON-VERIFY ?AUTO_1813 ?AUTO_1814 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1817 - BLOCK
      ?AUTO_1818 - BLOCK
    )
    :vars
    (
      ?AUTO_1819 - BLOCK
      ?AUTO_1820 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1818 ) ( not ( = ?AUTO_1817 ?AUTO_1818 ) ) ( ON-TABLE ?AUTO_1817 ) ( CLEAR ?AUTO_1819 ) ( not ( = ?AUTO_1817 ?AUTO_1820 ) ) ( not ( = ?AUTO_1817 ?AUTO_1819 ) ) ( not ( = ?AUTO_1818 ?AUTO_1820 ) ) ( not ( = ?AUTO_1818 ?AUTO_1819 ) ) ( not ( = ?AUTO_1820 ?AUTO_1819 ) ) ( ON ?AUTO_1820 ?AUTO_1817 ) ( CLEAR ?AUTO_1820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1820 ?AUTO_1817 )
      ( MAKE-ON ?AUTO_1817 ?AUTO_1818 )
      ( MAKE-ON-VERIFY ?AUTO_1817 ?AUTO_1818 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1821 - BLOCK
      ?AUTO_1822 - BLOCK
    )
    :vars
    (
      ?AUTO_1823 - BLOCK
      ?AUTO_1824 - BLOCK
      ?AUTO_1825 - BLOCK
      ?AUTO_1826 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1822 ) ( not ( = ?AUTO_1821 ?AUTO_1822 ) ) ( ON-TABLE ?AUTO_1821 ) ( CLEAR ?AUTO_1823 ) ( not ( = ?AUTO_1821 ?AUTO_1824 ) ) ( not ( = ?AUTO_1821 ?AUTO_1823 ) ) ( not ( = ?AUTO_1822 ?AUTO_1824 ) ) ( not ( = ?AUTO_1822 ?AUTO_1823 ) ) ( not ( = ?AUTO_1824 ?AUTO_1823 ) ) ( ON ?AUTO_1824 ?AUTO_1821 ) ( CLEAR ?AUTO_1824 ) ( HOLDING ?AUTO_1825 ) ( CLEAR ?AUTO_1826 ) ( not ( = ?AUTO_1821 ?AUTO_1825 ) ) ( not ( = ?AUTO_1821 ?AUTO_1826 ) ) ( not ( = ?AUTO_1822 ?AUTO_1825 ) ) ( not ( = ?AUTO_1822 ?AUTO_1826 ) ) ( not ( = ?AUTO_1823 ?AUTO_1825 ) ) ( not ( = ?AUTO_1823 ?AUTO_1826 ) ) ( not ( = ?AUTO_1824 ?AUTO_1825 ) ) ( not ( = ?AUTO_1824 ?AUTO_1826 ) ) ( not ( = ?AUTO_1825 ?AUTO_1826 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1825 ?AUTO_1826 )
      ( MAKE-ON ?AUTO_1821 ?AUTO_1822 )
      ( MAKE-ON-VERIFY ?AUTO_1821 ?AUTO_1822 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1835 - BLOCK
      ?AUTO_1836 - BLOCK
    )
    :vars
    (
      ?AUTO_1839 - BLOCK
      ?AUTO_1840 - BLOCK
      ?AUTO_1838 - BLOCK
      ?AUTO_1837 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1836 ) ( not ( = ?AUTO_1835 ?AUTO_1836 ) ) ( ON-TABLE ?AUTO_1835 ) ( CLEAR ?AUTO_1839 ) ( not ( = ?AUTO_1835 ?AUTO_1840 ) ) ( not ( = ?AUTO_1835 ?AUTO_1839 ) ) ( not ( = ?AUTO_1836 ?AUTO_1840 ) ) ( not ( = ?AUTO_1836 ?AUTO_1839 ) ) ( not ( = ?AUTO_1840 ?AUTO_1839 ) ) ( ON ?AUTO_1840 ?AUTO_1835 ) ( CLEAR ?AUTO_1838 ) ( not ( = ?AUTO_1835 ?AUTO_1837 ) ) ( not ( = ?AUTO_1835 ?AUTO_1838 ) ) ( not ( = ?AUTO_1836 ?AUTO_1837 ) ) ( not ( = ?AUTO_1836 ?AUTO_1838 ) ) ( not ( = ?AUTO_1839 ?AUTO_1837 ) ) ( not ( = ?AUTO_1839 ?AUTO_1838 ) ) ( not ( = ?AUTO_1840 ?AUTO_1837 ) ) ( not ( = ?AUTO_1840 ?AUTO_1838 ) ) ( not ( = ?AUTO_1837 ?AUTO_1838 ) ) ( ON ?AUTO_1837 ?AUTO_1840 ) ( CLEAR ?AUTO_1837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1837 ?AUTO_1840 )
      ( MAKE-ON ?AUTO_1835 ?AUTO_1836 )
      ( MAKE-ON-VERIFY ?AUTO_1835 ?AUTO_1836 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1841 - BLOCK
      ?AUTO_1842 - BLOCK
    )
    :vars
    (
      ?AUTO_1846 - BLOCK
      ?AUTO_1845 - BLOCK
      ?AUTO_1843 - BLOCK
      ?AUTO_1844 - BLOCK
      ?AUTO_1847 - BLOCK
      ?AUTO_1848 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1842 ) ( not ( = ?AUTO_1841 ?AUTO_1842 ) ) ( ON-TABLE ?AUTO_1841 ) ( CLEAR ?AUTO_1846 ) ( not ( = ?AUTO_1841 ?AUTO_1845 ) ) ( not ( = ?AUTO_1841 ?AUTO_1846 ) ) ( not ( = ?AUTO_1842 ?AUTO_1845 ) ) ( not ( = ?AUTO_1842 ?AUTO_1846 ) ) ( not ( = ?AUTO_1845 ?AUTO_1846 ) ) ( ON ?AUTO_1845 ?AUTO_1841 ) ( CLEAR ?AUTO_1843 ) ( not ( = ?AUTO_1841 ?AUTO_1844 ) ) ( not ( = ?AUTO_1841 ?AUTO_1843 ) ) ( not ( = ?AUTO_1842 ?AUTO_1844 ) ) ( not ( = ?AUTO_1842 ?AUTO_1843 ) ) ( not ( = ?AUTO_1846 ?AUTO_1844 ) ) ( not ( = ?AUTO_1846 ?AUTO_1843 ) ) ( not ( = ?AUTO_1845 ?AUTO_1844 ) ) ( not ( = ?AUTO_1845 ?AUTO_1843 ) ) ( not ( = ?AUTO_1844 ?AUTO_1843 ) ) ( ON ?AUTO_1844 ?AUTO_1845 ) ( CLEAR ?AUTO_1844 ) ( HOLDING ?AUTO_1847 ) ( CLEAR ?AUTO_1848 ) ( not ( = ?AUTO_1841 ?AUTO_1847 ) ) ( not ( = ?AUTO_1841 ?AUTO_1848 ) ) ( not ( = ?AUTO_1842 ?AUTO_1847 ) ) ( not ( = ?AUTO_1842 ?AUTO_1848 ) ) ( not ( = ?AUTO_1846 ?AUTO_1847 ) ) ( not ( = ?AUTO_1846 ?AUTO_1848 ) ) ( not ( = ?AUTO_1845 ?AUTO_1847 ) ) ( not ( = ?AUTO_1845 ?AUTO_1848 ) ) ( not ( = ?AUTO_1843 ?AUTO_1847 ) ) ( not ( = ?AUTO_1843 ?AUTO_1848 ) ) ( not ( = ?AUTO_1844 ?AUTO_1847 ) ) ( not ( = ?AUTO_1844 ?AUTO_1848 ) ) ( not ( = ?AUTO_1847 ?AUTO_1848 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1847 ?AUTO_1848 )
      ( MAKE-ON ?AUTO_1841 ?AUTO_1842 )
      ( MAKE-ON-VERIFY ?AUTO_1841 ?AUTO_1842 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1849 - BLOCK
      ?AUTO_1850 - BLOCK
    )
    :vars
    (
      ?AUTO_1856 - BLOCK
      ?AUTO_1851 - BLOCK
      ?AUTO_1853 - BLOCK
      ?AUTO_1852 - BLOCK
      ?AUTO_1854 - BLOCK
      ?AUTO_1855 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1850 ) ( not ( = ?AUTO_1849 ?AUTO_1850 ) ) ( ON-TABLE ?AUTO_1849 ) ( CLEAR ?AUTO_1856 ) ( not ( = ?AUTO_1849 ?AUTO_1851 ) ) ( not ( = ?AUTO_1849 ?AUTO_1856 ) ) ( not ( = ?AUTO_1850 ?AUTO_1851 ) ) ( not ( = ?AUTO_1850 ?AUTO_1856 ) ) ( not ( = ?AUTO_1851 ?AUTO_1856 ) ) ( ON ?AUTO_1851 ?AUTO_1849 ) ( CLEAR ?AUTO_1853 ) ( not ( = ?AUTO_1849 ?AUTO_1852 ) ) ( not ( = ?AUTO_1849 ?AUTO_1853 ) ) ( not ( = ?AUTO_1850 ?AUTO_1852 ) ) ( not ( = ?AUTO_1850 ?AUTO_1853 ) ) ( not ( = ?AUTO_1856 ?AUTO_1852 ) ) ( not ( = ?AUTO_1856 ?AUTO_1853 ) ) ( not ( = ?AUTO_1851 ?AUTO_1852 ) ) ( not ( = ?AUTO_1851 ?AUTO_1853 ) ) ( not ( = ?AUTO_1852 ?AUTO_1853 ) ) ( ON ?AUTO_1852 ?AUTO_1851 ) ( CLEAR ?AUTO_1854 ) ( not ( = ?AUTO_1849 ?AUTO_1855 ) ) ( not ( = ?AUTO_1849 ?AUTO_1854 ) ) ( not ( = ?AUTO_1850 ?AUTO_1855 ) ) ( not ( = ?AUTO_1850 ?AUTO_1854 ) ) ( not ( = ?AUTO_1856 ?AUTO_1855 ) ) ( not ( = ?AUTO_1856 ?AUTO_1854 ) ) ( not ( = ?AUTO_1851 ?AUTO_1855 ) ) ( not ( = ?AUTO_1851 ?AUTO_1854 ) ) ( not ( = ?AUTO_1853 ?AUTO_1855 ) ) ( not ( = ?AUTO_1853 ?AUTO_1854 ) ) ( not ( = ?AUTO_1852 ?AUTO_1855 ) ) ( not ( = ?AUTO_1852 ?AUTO_1854 ) ) ( not ( = ?AUTO_1855 ?AUTO_1854 ) ) ( ON ?AUTO_1855 ?AUTO_1852 ) ( CLEAR ?AUTO_1855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1855 ?AUTO_1852 )
      ( MAKE-ON ?AUTO_1849 ?AUTO_1850 )
      ( MAKE-ON-VERIFY ?AUTO_1849 ?AUTO_1850 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1857 - BLOCK
      ?AUTO_1858 - BLOCK
    )
    :vars
    (
      ?AUTO_1861 - BLOCK
      ?AUTO_1860 - BLOCK
      ?AUTO_1862 - BLOCK
      ?AUTO_1859 - BLOCK
      ?AUTO_1864 - BLOCK
      ?AUTO_1863 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1858 ) ( not ( = ?AUTO_1857 ?AUTO_1858 ) ) ( ON-TABLE ?AUTO_1857 ) ( not ( = ?AUTO_1857 ?AUTO_1861 ) ) ( not ( = ?AUTO_1857 ?AUTO_1860 ) ) ( not ( = ?AUTO_1858 ?AUTO_1861 ) ) ( not ( = ?AUTO_1858 ?AUTO_1860 ) ) ( not ( = ?AUTO_1861 ?AUTO_1860 ) ) ( ON ?AUTO_1861 ?AUTO_1857 ) ( CLEAR ?AUTO_1862 ) ( not ( = ?AUTO_1857 ?AUTO_1859 ) ) ( not ( = ?AUTO_1857 ?AUTO_1862 ) ) ( not ( = ?AUTO_1858 ?AUTO_1859 ) ) ( not ( = ?AUTO_1858 ?AUTO_1862 ) ) ( not ( = ?AUTO_1860 ?AUTO_1859 ) ) ( not ( = ?AUTO_1860 ?AUTO_1862 ) ) ( not ( = ?AUTO_1861 ?AUTO_1859 ) ) ( not ( = ?AUTO_1861 ?AUTO_1862 ) ) ( not ( = ?AUTO_1859 ?AUTO_1862 ) ) ( ON ?AUTO_1859 ?AUTO_1861 ) ( CLEAR ?AUTO_1864 ) ( not ( = ?AUTO_1857 ?AUTO_1863 ) ) ( not ( = ?AUTO_1857 ?AUTO_1864 ) ) ( not ( = ?AUTO_1858 ?AUTO_1863 ) ) ( not ( = ?AUTO_1858 ?AUTO_1864 ) ) ( not ( = ?AUTO_1860 ?AUTO_1863 ) ) ( not ( = ?AUTO_1860 ?AUTO_1864 ) ) ( not ( = ?AUTO_1861 ?AUTO_1863 ) ) ( not ( = ?AUTO_1861 ?AUTO_1864 ) ) ( not ( = ?AUTO_1862 ?AUTO_1863 ) ) ( not ( = ?AUTO_1862 ?AUTO_1864 ) ) ( not ( = ?AUTO_1859 ?AUTO_1863 ) ) ( not ( = ?AUTO_1859 ?AUTO_1864 ) ) ( not ( = ?AUTO_1863 ?AUTO_1864 ) ) ( ON ?AUTO_1863 ?AUTO_1859 ) ( CLEAR ?AUTO_1863 ) ( HOLDING ?AUTO_1860 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1860 )
      ( MAKE-ON ?AUTO_1857 ?AUTO_1858 )
      ( MAKE-ON-VERIFY ?AUTO_1857 ?AUTO_1858 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1865 - BLOCK
      ?AUTO_1866 - BLOCK
    )
    :vars
    (
      ?AUTO_1869 - BLOCK
      ?AUTO_1868 - BLOCK
      ?AUTO_1872 - BLOCK
      ?AUTO_1867 - BLOCK
      ?AUTO_1870 - BLOCK
      ?AUTO_1871 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1866 ) ( not ( = ?AUTO_1865 ?AUTO_1866 ) ) ( ON-TABLE ?AUTO_1865 ) ( not ( = ?AUTO_1865 ?AUTO_1869 ) ) ( not ( = ?AUTO_1865 ?AUTO_1868 ) ) ( not ( = ?AUTO_1866 ?AUTO_1869 ) ) ( not ( = ?AUTO_1866 ?AUTO_1868 ) ) ( not ( = ?AUTO_1869 ?AUTO_1868 ) ) ( ON ?AUTO_1869 ?AUTO_1865 ) ( CLEAR ?AUTO_1872 ) ( not ( = ?AUTO_1865 ?AUTO_1867 ) ) ( not ( = ?AUTO_1865 ?AUTO_1872 ) ) ( not ( = ?AUTO_1866 ?AUTO_1867 ) ) ( not ( = ?AUTO_1866 ?AUTO_1872 ) ) ( not ( = ?AUTO_1868 ?AUTO_1867 ) ) ( not ( = ?AUTO_1868 ?AUTO_1872 ) ) ( not ( = ?AUTO_1869 ?AUTO_1867 ) ) ( not ( = ?AUTO_1869 ?AUTO_1872 ) ) ( not ( = ?AUTO_1867 ?AUTO_1872 ) ) ( ON ?AUTO_1867 ?AUTO_1869 ) ( not ( = ?AUTO_1865 ?AUTO_1870 ) ) ( not ( = ?AUTO_1865 ?AUTO_1871 ) ) ( not ( = ?AUTO_1866 ?AUTO_1870 ) ) ( not ( = ?AUTO_1866 ?AUTO_1871 ) ) ( not ( = ?AUTO_1868 ?AUTO_1870 ) ) ( not ( = ?AUTO_1868 ?AUTO_1871 ) ) ( not ( = ?AUTO_1869 ?AUTO_1870 ) ) ( not ( = ?AUTO_1869 ?AUTO_1871 ) ) ( not ( = ?AUTO_1872 ?AUTO_1870 ) ) ( not ( = ?AUTO_1872 ?AUTO_1871 ) ) ( not ( = ?AUTO_1867 ?AUTO_1870 ) ) ( not ( = ?AUTO_1867 ?AUTO_1871 ) ) ( not ( = ?AUTO_1870 ?AUTO_1871 ) ) ( ON ?AUTO_1870 ?AUTO_1867 ) ( CLEAR ?AUTO_1870 ) ( ON ?AUTO_1868 ?AUTO_1871 ) ( CLEAR ?AUTO_1868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1868 ?AUTO_1871 )
      ( MAKE-ON ?AUTO_1865 ?AUTO_1866 )
      ( MAKE-ON-VERIFY ?AUTO_1865 ?AUTO_1866 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1873 - BLOCK
      ?AUTO_1874 - BLOCK
    )
    :vars
    (
      ?AUTO_1880 - BLOCK
      ?AUTO_1875 - BLOCK
      ?AUTO_1878 - BLOCK
      ?AUTO_1876 - BLOCK
      ?AUTO_1879 - BLOCK
      ?AUTO_1877 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1873 ?AUTO_1874 ) ) ( ON-TABLE ?AUTO_1873 ) ( not ( = ?AUTO_1873 ?AUTO_1880 ) ) ( not ( = ?AUTO_1873 ?AUTO_1875 ) ) ( not ( = ?AUTO_1874 ?AUTO_1880 ) ) ( not ( = ?AUTO_1874 ?AUTO_1875 ) ) ( not ( = ?AUTO_1880 ?AUTO_1875 ) ) ( ON ?AUTO_1880 ?AUTO_1873 ) ( CLEAR ?AUTO_1878 ) ( not ( = ?AUTO_1873 ?AUTO_1876 ) ) ( not ( = ?AUTO_1873 ?AUTO_1878 ) ) ( not ( = ?AUTO_1874 ?AUTO_1876 ) ) ( not ( = ?AUTO_1874 ?AUTO_1878 ) ) ( not ( = ?AUTO_1875 ?AUTO_1876 ) ) ( not ( = ?AUTO_1875 ?AUTO_1878 ) ) ( not ( = ?AUTO_1880 ?AUTO_1876 ) ) ( not ( = ?AUTO_1880 ?AUTO_1878 ) ) ( not ( = ?AUTO_1876 ?AUTO_1878 ) ) ( ON ?AUTO_1876 ?AUTO_1880 ) ( not ( = ?AUTO_1873 ?AUTO_1879 ) ) ( not ( = ?AUTO_1873 ?AUTO_1877 ) ) ( not ( = ?AUTO_1874 ?AUTO_1879 ) ) ( not ( = ?AUTO_1874 ?AUTO_1877 ) ) ( not ( = ?AUTO_1875 ?AUTO_1879 ) ) ( not ( = ?AUTO_1875 ?AUTO_1877 ) ) ( not ( = ?AUTO_1880 ?AUTO_1879 ) ) ( not ( = ?AUTO_1880 ?AUTO_1877 ) ) ( not ( = ?AUTO_1878 ?AUTO_1879 ) ) ( not ( = ?AUTO_1878 ?AUTO_1877 ) ) ( not ( = ?AUTO_1876 ?AUTO_1879 ) ) ( not ( = ?AUTO_1876 ?AUTO_1877 ) ) ( not ( = ?AUTO_1879 ?AUTO_1877 ) ) ( ON ?AUTO_1879 ?AUTO_1876 ) ( CLEAR ?AUTO_1879 ) ( ON ?AUTO_1875 ?AUTO_1877 ) ( CLEAR ?AUTO_1875 ) ( HOLDING ?AUTO_1874 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1874 )
      ( MAKE-ON ?AUTO_1873 ?AUTO_1874 )
      ( MAKE-ON-VERIFY ?AUTO_1873 ?AUTO_1874 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1881 - BLOCK
      ?AUTO_1882 - BLOCK
    )
    :vars
    (
      ?AUTO_1887 - BLOCK
      ?AUTO_1886 - BLOCK
      ?AUTO_1885 - BLOCK
      ?AUTO_1884 - BLOCK
      ?AUTO_1883 - BLOCK
      ?AUTO_1888 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1881 ?AUTO_1882 ) ) ( ON-TABLE ?AUTO_1881 ) ( not ( = ?AUTO_1881 ?AUTO_1887 ) ) ( not ( = ?AUTO_1881 ?AUTO_1886 ) ) ( not ( = ?AUTO_1882 ?AUTO_1887 ) ) ( not ( = ?AUTO_1882 ?AUTO_1886 ) ) ( not ( = ?AUTO_1887 ?AUTO_1886 ) ) ( ON ?AUTO_1887 ?AUTO_1881 ) ( CLEAR ?AUTO_1885 ) ( not ( = ?AUTO_1881 ?AUTO_1884 ) ) ( not ( = ?AUTO_1881 ?AUTO_1885 ) ) ( not ( = ?AUTO_1882 ?AUTO_1884 ) ) ( not ( = ?AUTO_1882 ?AUTO_1885 ) ) ( not ( = ?AUTO_1886 ?AUTO_1884 ) ) ( not ( = ?AUTO_1886 ?AUTO_1885 ) ) ( not ( = ?AUTO_1887 ?AUTO_1884 ) ) ( not ( = ?AUTO_1887 ?AUTO_1885 ) ) ( not ( = ?AUTO_1884 ?AUTO_1885 ) ) ( ON ?AUTO_1884 ?AUTO_1887 ) ( not ( = ?AUTO_1881 ?AUTO_1883 ) ) ( not ( = ?AUTO_1881 ?AUTO_1888 ) ) ( not ( = ?AUTO_1882 ?AUTO_1883 ) ) ( not ( = ?AUTO_1882 ?AUTO_1888 ) ) ( not ( = ?AUTO_1886 ?AUTO_1883 ) ) ( not ( = ?AUTO_1886 ?AUTO_1888 ) ) ( not ( = ?AUTO_1887 ?AUTO_1883 ) ) ( not ( = ?AUTO_1887 ?AUTO_1888 ) ) ( not ( = ?AUTO_1885 ?AUTO_1883 ) ) ( not ( = ?AUTO_1885 ?AUTO_1888 ) ) ( not ( = ?AUTO_1884 ?AUTO_1883 ) ) ( not ( = ?AUTO_1884 ?AUTO_1888 ) ) ( not ( = ?AUTO_1883 ?AUTO_1888 ) ) ( ON ?AUTO_1883 ?AUTO_1884 ) ( CLEAR ?AUTO_1883 ) ( ON ?AUTO_1886 ?AUTO_1888 ) ( ON ?AUTO_1882 ?AUTO_1886 ) ( CLEAR ?AUTO_1882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1882 ?AUTO_1886 )
      ( MAKE-ON ?AUTO_1881 ?AUTO_1882 )
      ( MAKE-ON-VERIFY ?AUTO_1881 ?AUTO_1882 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1890 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1890 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1890 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1890 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1891 - BLOCK
    )
    :vars
    (
      ?AUTO_1892 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1891 ?AUTO_1892 ) ( CLEAR ?AUTO_1891 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1891 ?AUTO_1892 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1891 ?AUTO_1892 )
      ( MAKE-ON-TABLE ?AUTO_1891 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1891 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1894 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1894 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1894 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1894 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1895 - BLOCK
    )
    :vars
    (
      ?AUTO_1896 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1895 ?AUTO_1896 ) ( CLEAR ?AUTO_1895 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1895 ?AUTO_1896 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1895 ?AUTO_1896 )
      ( MAKE-ON-TABLE ?AUTO_1895 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1895 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1897 - BLOCK
    )
    :vars
    (
      ?AUTO_1898 - BLOCK
      ?AUTO_1899 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1897 ?AUTO_1898 ) ( CLEAR ?AUTO_1897 ) ( not ( = ?AUTO_1897 ?AUTO_1898 ) ) ( HOLDING ?AUTO_1899 ) ( not ( = ?AUTO_1897 ?AUTO_1899 ) ) ( not ( = ?AUTO_1898 ?AUTO_1899 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1899 )
      ( MAKE-ON-TABLE ?AUTO_1897 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1897 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1903 - BLOCK
      ?AUTO_1904 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1903 ) ( CLEAR ?AUTO_1904 ) ( not ( = ?AUTO_1903 ?AUTO_1904 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1903 ?AUTO_1904 )
      ( MAKE-ON-VERIFY ?AUTO_1903 ?AUTO_1904 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1905 - BLOCK
      ?AUTO_1906 - BLOCK
    )
    :vars
    (
      ?AUTO_1907 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1906 ) ( not ( = ?AUTO_1905 ?AUTO_1906 ) ) ( ON ?AUTO_1905 ?AUTO_1907 ) ( CLEAR ?AUTO_1905 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1905 ?AUTO_1907 ) ) ( not ( = ?AUTO_1906 ?AUTO_1907 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1905 ?AUTO_1907 )
      ( MAKE-ON ?AUTO_1905 ?AUTO_1906 )
      ( MAKE-ON-VERIFY ?AUTO_1905 ?AUTO_1906 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1908 - BLOCK
      ?AUTO_1909 - BLOCK
    )
    :vars
    (
      ?AUTO_1910 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1908 ?AUTO_1909 ) ) ( ON ?AUTO_1908 ?AUTO_1910 ) ( CLEAR ?AUTO_1908 ) ( not ( = ?AUTO_1908 ?AUTO_1910 ) ) ( not ( = ?AUTO_1909 ?AUTO_1910 ) ) ( HOLDING ?AUTO_1909 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1909 )
      ( MAKE-ON ?AUTO_1908 ?AUTO_1909 )
      ( MAKE-ON-VERIFY ?AUTO_1908 ?AUTO_1909 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1913 - BLOCK
      ?AUTO_1914 - BLOCK
    )
    :vars
    (
      ?AUTO_1915 - BLOCK
      ?AUTO_1916 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1914 ) ( not ( = ?AUTO_1913 ?AUTO_1914 ) ) ( ON ?AUTO_1913 ?AUTO_1915 ) ( CLEAR ?AUTO_1913 ) ( not ( = ?AUTO_1913 ?AUTO_1915 ) ) ( not ( = ?AUTO_1914 ?AUTO_1915 ) ) ( HOLDING ?AUTO_1916 ) ( not ( = ?AUTO_1913 ?AUTO_1916 ) ) ( not ( = ?AUTO_1914 ?AUTO_1916 ) ) ( not ( = ?AUTO_1915 ?AUTO_1916 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1916 )
      ( MAKE-ON ?AUTO_1913 ?AUTO_1914 )
      ( MAKE-ON-VERIFY ?AUTO_1913 ?AUTO_1914 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1917 - BLOCK
      ?AUTO_1918 - BLOCK
    )
    :vars
    (
      ?AUTO_1919 - BLOCK
      ?AUTO_1920 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1918 ) ( not ( = ?AUTO_1917 ?AUTO_1918 ) ) ( ON ?AUTO_1917 ?AUTO_1919 ) ( not ( = ?AUTO_1917 ?AUTO_1919 ) ) ( not ( = ?AUTO_1918 ?AUTO_1919 ) ) ( not ( = ?AUTO_1917 ?AUTO_1920 ) ) ( not ( = ?AUTO_1918 ?AUTO_1920 ) ) ( not ( = ?AUTO_1919 ?AUTO_1920 ) ) ( ON ?AUTO_1920 ?AUTO_1917 ) ( CLEAR ?AUTO_1920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1920 ?AUTO_1917 )
      ( MAKE-ON ?AUTO_1917 ?AUTO_1918 )
      ( MAKE-ON-VERIFY ?AUTO_1917 ?AUTO_1918 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1922 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1922 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1922 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1922 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1923 - BLOCK
    )
    :vars
    (
      ?AUTO_1924 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1923 ?AUTO_1924 ) ( CLEAR ?AUTO_1923 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1923 ?AUTO_1924 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1923 ?AUTO_1924 )
      ( MAKE-ON-TABLE ?AUTO_1923 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1923 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1925 - BLOCK
    )
    :vars
    (
      ?AUTO_1926 - BLOCK
      ?AUTO_1927 - BLOCK
      ?AUTO_1928 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1925 ?AUTO_1926 ) ( CLEAR ?AUTO_1925 ) ( not ( = ?AUTO_1925 ?AUTO_1926 ) ) ( HOLDING ?AUTO_1927 ) ( CLEAR ?AUTO_1928 ) ( not ( = ?AUTO_1925 ?AUTO_1927 ) ) ( not ( = ?AUTO_1925 ?AUTO_1928 ) ) ( not ( = ?AUTO_1926 ?AUTO_1927 ) ) ( not ( = ?AUTO_1926 ?AUTO_1928 ) ) ( not ( = ?AUTO_1927 ?AUTO_1928 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1927 ?AUTO_1928 )
      ( MAKE-ON-TABLE ?AUTO_1925 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1925 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1929 - BLOCK
    )
    :vars
    (
      ?AUTO_1930 - BLOCK
      ?AUTO_1932 - BLOCK
      ?AUTO_1931 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1929 ?AUTO_1930 ) ( not ( = ?AUTO_1929 ?AUTO_1930 ) ) ( CLEAR ?AUTO_1932 ) ( not ( = ?AUTO_1929 ?AUTO_1931 ) ) ( not ( = ?AUTO_1929 ?AUTO_1932 ) ) ( not ( = ?AUTO_1930 ?AUTO_1931 ) ) ( not ( = ?AUTO_1930 ?AUTO_1932 ) ) ( not ( = ?AUTO_1931 ?AUTO_1932 ) ) ( ON ?AUTO_1931 ?AUTO_1929 ) ( CLEAR ?AUTO_1931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1931 ?AUTO_1929 )
      ( MAKE-ON-TABLE ?AUTO_1929 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1929 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1933 - BLOCK
    )
    :vars
    (
      ?AUTO_1934 - BLOCK
      ?AUTO_1935 - BLOCK
      ?AUTO_1936 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1933 ?AUTO_1934 ) ( not ( = ?AUTO_1933 ?AUTO_1934 ) ) ( not ( = ?AUTO_1933 ?AUTO_1935 ) ) ( not ( = ?AUTO_1933 ?AUTO_1936 ) ) ( not ( = ?AUTO_1934 ?AUTO_1935 ) ) ( not ( = ?AUTO_1934 ?AUTO_1936 ) ) ( not ( = ?AUTO_1935 ?AUTO_1936 ) ) ( ON ?AUTO_1935 ?AUTO_1933 ) ( CLEAR ?AUTO_1935 ) ( HOLDING ?AUTO_1936 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1936 )
      ( MAKE-ON-TABLE ?AUTO_1933 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1933 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1939 - BLOCK
    )
    :vars
    (
      ?AUTO_1940 - BLOCK
      ?AUTO_1941 - BLOCK
      ?AUTO_1942 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1939 ?AUTO_1940 ) ( not ( = ?AUTO_1939 ?AUTO_1940 ) ) ( not ( = ?AUTO_1939 ?AUTO_1941 ) ) ( not ( = ?AUTO_1939 ?AUTO_1942 ) ) ( not ( = ?AUTO_1940 ?AUTO_1941 ) ) ( not ( = ?AUTO_1940 ?AUTO_1942 ) ) ( not ( = ?AUTO_1941 ?AUTO_1942 ) ) ( ON ?AUTO_1941 ?AUTO_1939 ) ( ON ?AUTO_1942 ?AUTO_1941 ) ( CLEAR ?AUTO_1942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1942 ?AUTO_1941 )
      ( MAKE-ON-TABLE ?AUTO_1939 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1939 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1944 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1944 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1944 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1944 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1945 - BLOCK
    )
    :vars
    (
      ?AUTO_1946 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1945 ?AUTO_1946 ) ( CLEAR ?AUTO_1945 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1945 ?AUTO_1946 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1945 ?AUTO_1946 )
      ( MAKE-ON-TABLE ?AUTO_1945 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1945 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1947 - BLOCK
    )
    :vars
    (
      ?AUTO_1948 - BLOCK
      ?AUTO_1949 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1947 ?AUTO_1948 ) ( CLEAR ?AUTO_1947 ) ( not ( = ?AUTO_1947 ?AUTO_1948 ) ) ( HOLDING ?AUTO_1949 ) ( not ( = ?AUTO_1947 ?AUTO_1949 ) ) ( not ( = ?AUTO_1948 ?AUTO_1949 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1949 )
      ( MAKE-ON-TABLE ?AUTO_1947 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1947 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1950 - BLOCK
    )
    :vars
    (
      ?AUTO_1951 - BLOCK
      ?AUTO_1952 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1950 ?AUTO_1951 ) ( not ( = ?AUTO_1950 ?AUTO_1951 ) ) ( not ( = ?AUTO_1950 ?AUTO_1952 ) ) ( not ( = ?AUTO_1951 ?AUTO_1952 ) ) ( ON ?AUTO_1952 ?AUTO_1950 ) ( CLEAR ?AUTO_1952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1952 ?AUTO_1950 )
      ( MAKE-ON-TABLE ?AUTO_1950 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1950 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1953 - BLOCK
    )
    :vars
    (
      ?AUTO_1954 - BLOCK
      ?AUTO_1955 - BLOCK
      ?AUTO_1956 - BLOCK
      ?AUTO_1957 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1953 ?AUTO_1954 ) ( not ( = ?AUTO_1953 ?AUTO_1954 ) ) ( not ( = ?AUTO_1953 ?AUTO_1955 ) ) ( not ( = ?AUTO_1954 ?AUTO_1955 ) ) ( ON ?AUTO_1955 ?AUTO_1953 ) ( CLEAR ?AUTO_1955 ) ( HOLDING ?AUTO_1956 ) ( CLEAR ?AUTO_1957 ) ( not ( = ?AUTO_1953 ?AUTO_1956 ) ) ( not ( = ?AUTO_1953 ?AUTO_1957 ) ) ( not ( = ?AUTO_1954 ?AUTO_1956 ) ) ( not ( = ?AUTO_1954 ?AUTO_1957 ) ) ( not ( = ?AUTO_1955 ?AUTO_1956 ) ) ( not ( = ?AUTO_1955 ?AUTO_1957 ) ) ( not ( = ?AUTO_1956 ?AUTO_1957 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1956 ?AUTO_1957 )
      ( MAKE-ON-TABLE ?AUTO_1953 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1953 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1958 - BLOCK
    )
    :vars
    (
      ?AUTO_1959 - BLOCK
      ?AUTO_1960 - BLOCK
      ?AUTO_1961 - BLOCK
      ?AUTO_1962 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1958 ?AUTO_1959 ) ( not ( = ?AUTO_1958 ?AUTO_1959 ) ) ( not ( = ?AUTO_1958 ?AUTO_1960 ) ) ( not ( = ?AUTO_1959 ?AUTO_1960 ) ) ( ON ?AUTO_1960 ?AUTO_1958 ) ( CLEAR ?AUTO_1961 ) ( not ( = ?AUTO_1958 ?AUTO_1962 ) ) ( not ( = ?AUTO_1958 ?AUTO_1961 ) ) ( not ( = ?AUTO_1959 ?AUTO_1962 ) ) ( not ( = ?AUTO_1959 ?AUTO_1961 ) ) ( not ( = ?AUTO_1960 ?AUTO_1962 ) ) ( not ( = ?AUTO_1960 ?AUTO_1961 ) ) ( not ( = ?AUTO_1962 ?AUTO_1961 ) ) ( ON ?AUTO_1962 ?AUTO_1960 ) ( CLEAR ?AUTO_1962 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1962 ?AUTO_1960 )
      ( MAKE-ON-TABLE ?AUTO_1958 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1958 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1963 - BLOCK
    )
    :vars
    (
      ?AUTO_1967 - BLOCK
      ?AUTO_1964 - BLOCK
      ?AUTO_1966 - BLOCK
      ?AUTO_1965 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1963 ?AUTO_1967 ) ( not ( = ?AUTO_1963 ?AUTO_1967 ) ) ( not ( = ?AUTO_1963 ?AUTO_1964 ) ) ( not ( = ?AUTO_1967 ?AUTO_1964 ) ) ( ON ?AUTO_1964 ?AUTO_1963 ) ( not ( = ?AUTO_1963 ?AUTO_1966 ) ) ( not ( = ?AUTO_1963 ?AUTO_1965 ) ) ( not ( = ?AUTO_1967 ?AUTO_1966 ) ) ( not ( = ?AUTO_1967 ?AUTO_1965 ) ) ( not ( = ?AUTO_1964 ?AUTO_1966 ) ) ( not ( = ?AUTO_1964 ?AUTO_1965 ) ) ( not ( = ?AUTO_1966 ?AUTO_1965 ) ) ( ON ?AUTO_1966 ?AUTO_1964 ) ( CLEAR ?AUTO_1966 ) ( HOLDING ?AUTO_1965 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1965 )
      ( MAKE-ON-TABLE ?AUTO_1963 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1963 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1970 - BLOCK
    )
    :vars
    (
      ?AUTO_1974 - BLOCK
      ?AUTO_1973 - BLOCK
      ?AUTO_1971 - BLOCK
      ?AUTO_1972 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1970 ?AUTO_1974 ) ( not ( = ?AUTO_1970 ?AUTO_1974 ) ) ( not ( = ?AUTO_1970 ?AUTO_1973 ) ) ( not ( = ?AUTO_1974 ?AUTO_1973 ) ) ( ON ?AUTO_1973 ?AUTO_1970 ) ( not ( = ?AUTO_1970 ?AUTO_1971 ) ) ( not ( = ?AUTO_1970 ?AUTO_1972 ) ) ( not ( = ?AUTO_1974 ?AUTO_1971 ) ) ( not ( = ?AUTO_1974 ?AUTO_1972 ) ) ( not ( = ?AUTO_1973 ?AUTO_1971 ) ) ( not ( = ?AUTO_1973 ?AUTO_1972 ) ) ( not ( = ?AUTO_1971 ?AUTO_1972 ) ) ( ON ?AUTO_1971 ?AUTO_1973 ) ( ON ?AUTO_1972 ?AUTO_1971 ) ( CLEAR ?AUTO_1972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1972 ?AUTO_1971 )
      ( MAKE-ON-TABLE ?AUTO_1970 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1970 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1977 - BLOCK
      ?AUTO_1978 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1977 ) ( CLEAR ?AUTO_1978 ) ( not ( = ?AUTO_1977 ?AUTO_1978 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1977 ?AUTO_1978 )
      ( MAKE-ON-VERIFY ?AUTO_1977 ?AUTO_1978 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1979 - BLOCK
      ?AUTO_1980 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1980 ) ( not ( = ?AUTO_1979 ?AUTO_1980 ) ) ( ON-TABLE ?AUTO_1979 ) ( CLEAR ?AUTO_1979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1979 )
      ( MAKE-ON ?AUTO_1979 ?AUTO_1980 )
      ( MAKE-ON-VERIFY ?AUTO_1979 ?AUTO_1980 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1981 - BLOCK
      ?AUTO_1982 - BLOCK
    )
    :vars
    (
      ?AUTO_1983 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1982 ) ( not ( = ?AUTO_1981 ?AUTO_1982 ) ) ( ON-TABLE ?AUTO_1981 ) ( CLEAR ?AUTO_1981 ) ( HOLDING ?AUTO_1983 ) ( not ( = ?AUTO_1981 ?AUTO_1983 ) ) ( not ( = ?AUTO_1982 ?AUTO_1983 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1983 )
      ( MAKE-ON ?AUTO_1981 ?AUTO_1982 )
      ( MAKE-ON-VERIFY ?AUTO_1981 ?AUTO_1982 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1990 - BLOCK
      ?AUTO_1991 - BLOCK
    )
    :vars
    (
      ?AUTO_1992 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1990 ?AUTO_1991 ) ) ( ON-TABLE ?AUTO_1990 ) ( CLEAR ?AUTO_1990 ) ( HOLDING ?AUTO_1991 ) ( CLEAR ?AUTO_1992 ) ( not ( = ?AUTO_1990 ?AUTO_1992 ) ) ( not ( = ?AUTO_1991 ?AUTO_1992 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1991 ?AUTO_1992 )
      ( MAKE-ON ?AUTO_1990 ?AUTO_1991 )
      ( MAKE-ON-VERIFY ?AUTO_1990 ?AUTO_1991 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1997 - BLOCK
      ?AUTO_1998 - BLOCK
    )
    :vars
    (
      ?AUTO_1999 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1998 ) ( not ( = ?AUTO_1997 ?AUTO_1998 ) ) ( ON-TABLE ?AUTO_1997 ) ( not ( = ?AUTO_1997 ?AUTO_1999 ) ) ( not ( = ?AUTO_1998 ?AUTO_1999 ) ) ( ON ?AUTO_1999 ?AUTO_1997 ) ( CLEAR ?AUTO_1999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1999 ?AUTO_1997 )
      ( MAKE-ON ?AUTO_1997 ?AUTO_1998 )
      ( MAKE-ON-VERIFY ?AUTO_1997 ?AUTO_1998 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2000 - BLOCK
      ?AUTO_2001 - BLOCK
    )
    :vars
    (
      ?AUTO_2002 - BLOCK
      ?AUTO_2003 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2001 ) ( not ( = ?AUTO_2000 ?AUTO_2001 ) ) ( ON-TABLE ?AUTO_2000 ) ( not ( = ?AUTO_2000 ?AUTO_2002 ) ) ( not ( = ?AUTO_2001 ?AUTO_2002 ) ) ( ON ?AUTO_2002 ?AUTO_2000 ) ( CLEAR ?AUTO_2002 ) ( HOLDING ?AUTO_2003 ) ( not ( = ?AUTO_2000 ?AUTO_2003 ) ) ( not ( = ?AUTO_2001 ?AUTO_2003 ) ) ( not ( = ?AUTO_2002 ?AUTO_2003 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2003 )
      ( MAKE-ON ?AUTO_2000 ?AUTO_2001 )
      ( MAKE-ON-VERIFY ?AUTO_2000 ?AUTO_2001 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2004 - BLOCK
      ?AUTO_2005 - BLOCK
    )
    :vars
    (
      ?AUTO_2006 - BLOCK
      ?AUTO_2007 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2004 ?AUTO_2005 ) ) ( ON-TABLE ?AUTO_2004 ) ( not ( = ?AUTO_2004 ?AUTO_2006 ) ) ( not ( = ?AUTO_2005 ?AUTO_2006 ) ) ( ON ?AUTO_2006 ?AUTO_2004 ) ( CLEAR ?AUTO_2006 ) ( not ( = ?AUTO_2004 ?AUTO_2007 ) ) ( not ( = ?AUTO_2005 ?AUTO_2007 ) ) ( not ( = ?AUTO_2006 ?AUTO_2007 ) ) ( ON ?AUTO_2007 ?AUTO_2005 ) ( CLEAR ?AUTO_2007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2007 ?AUTO_2005 )
      ( MAKE-ON ?AUTO_2004 ?AUTO_2005 )
      ( MAKE-ON-VERIFY ?AUTO_2004 ?AUTO_2005 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2009 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2009 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2009 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2009 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2010 - BLOCK
    )
    :vars
    (
      ?AUTO_2011 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2010 ?AUTO_2011 ) ( CLEAR ?AUTO_2010 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2010 ?AUTO_2011 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2010 ?AUTO_2011 )
      ( MAKE-ON-TABLE ?AUTO_2010 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2010 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2014 - BLOCK
      ?AUTO_2015 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2014 ) ( CLEAR ?AUTO_2015 ) ( not ( = ?AUTO_2014 ?AUTO_2015 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2014 ?AUTO_2015 )
      ( MAKE-ON-VERIFY ?AUTO_2014 ?AUTO_2015 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2016 - BLOCK
      ?AUTO_2017 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2017 ) ( not ( = ?AUTO_2016 ?AUTO_2017 ) ) ( ON-TABLE ?AUTO_2016 ) ( CLEAR ?AUTO_2016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2016 )
      ( MAKE-ON ?AUTO_2016 ?AUTO_2017 )
      ( MAKE-ON-VERIFY ?AUTO_2016 ?AUTO_2017 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2018 - BLOCK
      ?AUTO_2019 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2018 ?AUTO_2019 ) ) ( ON-TABLE ?AUTO_2018 ) ( CLEAR ?AUTO_2018 ) ( HOLDING ?AUTO_2019 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2019 )
      ( MAKE-ON ?AUTO_2018 ?AUTO_2019 )
      ( MAKE-ON-VERIFY ?AUTO_2018 ?AUTO_2019 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2024 - BLOCK
      ?AUTO_2025 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2024 ) ( CLEAR ?AUTO_2025 ) ( not ( = ?AUTO_2024 ?AUTO_2025 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2024 ?AUTO_2025 )
      ( MAKE-ON-VERIFY ?AUTO_2024 ?AUTO_2025 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2026 - BLOCK
      ?AUTO_2027 - BLOCK
    )
    :vars
    (
      ?AUTO_2028 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2027 ) ( not ( = ?AUTO_2026 ?AUTO_2027 ) ) ( ON ?AUTO_2026 ?AUTO_2028 ) ( CLEAR ?AUTO_2026 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2026 ?AUTO_2028 ) ) ( not ( = ?AUTO_2027 ?AUTO_2028 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2026 ?AUTO_2028 )
      ( MAKE-ON ?AUTO_2026 ?AUTO_2027 )
      ( MAKE-ON-VERIFY ?AUTO_2026 ?AUTO_2027 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2029 - BLOCK
      ?AUTO_2030 - BLOCK
    )
    :vars
    (
      ?AUTO_2031 - BLOCK
      ?AUTO_2032 - BLOCK
      ?AUTO_2033 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2030 ) ( not ( = ?AUTO_2029 ?AUTO_2030 ) ) ( ON ?AUTO_2029 ?AUTO_2031 ) ( CLEAR ?AUTO_2029 ) ( not ( = ?AUTO_2029 ?AUTO_2031 ) ) ( not ( = ?AUTO_2030 ?AUTO_2031 ) ) ( HOLDING ?AUTO_2032 ) ( CLEAR ?AUTO_2033 ) ( not ( = ?AUTO_2029 ?AUTO_2032 ) ) ( not ( = ?AUTO_2029 ?AUTO_2033 ) ) ( not ( = ?AUTO_2030 ?AUTO_2032 ) ) ( not ( = ?AUTO_2030 ?AUTO_2033 ) ) ( not ( = ?AUTO_2031 ?AUTO_2032 ) ) ( not ( = ?AUTO_2031 ?AUTO_2033 ) ) ( not ( = ?AUTO_2032 ?AUTO_2033 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2032 ?AUTO_2033 )
      ( MAKE-ON ?AUTO_2029 ?AUTO_2030 )
      ( MAKE-ON-VERIFY ?AUTO_2029 ?AUTO_2030 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2038 - BLOCK
      ?AUTO_2039 - BLOCK
    )
    :vars
    (
      ?AUTO_2042 - BLOCK
      ?AUTO_2041 - BLOCK
      ?AUTO_2040 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2039 ) ( not ( = ?AUTO_2038 ?AUTO_2039 ) ) ( ON ?AUTO_2038 ?AUTO_2042 ) ( not ( = ?AUTO_2038 ?AUTO_2042 ) ) ( not ( = ?AUTO_2039 ?AUTO_2042 ) ) ( CLEAR ?AUTO_2041 ) ( not ( = ?AUTO_2038 ?AUTO_2040 ) ) ( not ( = ?AUTO_2038 ?AUTO_2041 ) ) ( not ( = ?AUTO_2039 ?AUTO_2040 ) ) ( not ( = ?AUTO_2039 ?AUTO_2041 ) ) ( not ( = ?AUTO_2042 ?AUTO_2040 ) ) ( not ( = ?AUTO_2042 ?AUTO_2041 ) ) ( not ( = ?AUTO_2040 ?AUTO_2041 ) ) ( ON ?AUTO_2040 ?AUTO_2038 ) ( CLEAR ?AUTO_2040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2040 ?AUTO_2038 )
      ( MAKE-ON ?AUTO_2038 ?AUTO_2039 )
      ( MAKE-ON-VERIFY ?AUTO_2038 ?AUTO_2039 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2045 - BLOCK
      ?AUTO_2046 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2045 ) ( CLEAR ?AUTO_2046 ) ( not ( = ?AUTO_2045 ?AUTO_2046 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2045 ?AUTO_2046 )
      ( MAKE-ON-VERIFY ?AUTO_2045 ?AUTO_2046 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2047 - BLOCK
      ?AUTO_2048 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2048 ) ( not ( = ?AUTO_2047 ?AUTO_2048 ) ) ( ON-TABLE ?AUTO_2047 ) ( CLEAR ?AUTO_2047 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2047 )
      ( MAKE-ON ?AUTO_2047 ?AUTO_2048 )
      ( MAKE-ON-VERIFY ?AUTO_2047 ?AUTO_2048 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2049 - BLOCK
      ?AUTO_2050 - BLOCK
    )
    :vars
    (
      ?AUTO_2051 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2049 ?AUTO_2050 ) ) ( ON-TABLE ?AUTO_2049 ) ( CLEAR ?AUTO_2049 ) ( HOLDING ?AUTO_2050 ) ( CLEAR ?AUTO_2051 ) ( not ( = ?AUTO_2049 ?AUTO_2051 ) ) ( not ( = ?AUTO_2050 ?AUTO_2051 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2050 ?AUTO_2051 )
      ( MAKE-ON ?AUTO_2049 ?AUTO_2050 )
      ( MAKE-ON-VERIFY ?AUTO_2049 ?AUTO_2050 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2052 - BLOCK
      ?AUTO_2053 - BLOCK
    )
    :vars
    (
      ?AUTO_2054 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2052 ?AUTO_2053 ) ) ( ON-TABLE ?AUTO_2052 ) ( CLEAR ?AUTO_2054 ) ( not ( = ?AUTO_2052 ?AUTO_2054 ) ) ( not ( = ?AUTO_2053 ?AUTO_2054 ) ) ( ON ?AUTO_2053 ?AUTO_2052 ) ( CLEAR ?AUTO_2053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2053 ?AUTO_2052 )
      ( MAKE-ON ?AUTO_2052 ?AUTO_2053 )
      ( MAKE-ON-VERIFY ?AUTO_2052 ?AUTO_2053 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2055 - BLOCK
      ?AUTO_2056 - BLOCK
    )
    :vars
    (
      ?AUTO_2057 - BLOCK
      ?AUTO_2058 - BLOCK
      ?AUTO_2059 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2055 ?AUTO_2056 ) ) ( ON-TABLE ?AUTO_2055 ) ( CLEAR ?AUTO_2057 ) ( not ( = ?AUTO_2055 ?AUTO_2057 ) ) ( not ( = ?AUTO_2056 ?AUTO_2057 ) ) ( ON ?AUTO_2056 ?AUTO_2055 ) ( CLEAR ?AUTO_2056 ) ( HOLDING ?AUTO_2058 ) ( CLEAR ?AUTO_2059 ) ( not ( = ?AUTO_2055 ?AUTO_2058 ) ) ( not ( = ?AUTO_2055 ?AUTO_2059 ) ) ( not ( = ?AUTO_2056 ?AUTO_2058 ) ) ( not ( = ?AUTO_2056 ?AUTO_2059 ) ) ( not ( = ?AUTO_2057 ?AUTO_2058 ) ) ( not ( = ?AUTO_2057 ?AUTO_2059 ) ) ( not ( = ?AUTO_2058 ?AUTO_2059 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2058 ?AUTO_2059 )
      ( MAKE-ON ?AUTO_2055 ?AUTO_2056 )
      ( MAKE-ON-VERIFY ?AUTO_2055 ?AUTO_2056 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2064 - BLOCK
      ?AUTO_2065 - BLOCK
    )
    :vars
    (
      ?AUTO_2068 - BLOCK
      ?AUTO_2067 - BLOCK
      ?AUTO_2066 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2064 ?AUTO_2065 ) ) ( ON-TABLE ?AUTO_2064 ) ( CLEAR ?AUTO_2068 ) ( not ( = ?AUTO_2064 ?AUTO_2068 ) ) ( not ( = ?AUTO_2065 ?AUTO_2068 ) ) ( ON ?AUTO_2065 ?AUTO_2064 ) ( CLEAR ?AUTO_2067 ) ( not ( = ?AUTO_2064 ?AUTO_2066 ) ) ( not ( = ?AUTO_2064 ?AUTO_2067 ) ) ( not ( = ?AUTO_2065 ?AUTO_2066 ) ) ( not ( = ?AUTO_2065 ?AUTO_2067 ) ) ( not ( = ?AUTO_2068 ?AUTO_2066 ) ) ( not ( = ?AUTO_2068 ?AUTO_2067 ) ) ( not ( = ?AUTO_2066 ?AUTO_2067 ) ) ( ON ?AUTO_2066 ?AUTO_2065 ) ( CLEAR ?AUTO_2066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2066 ?AUTO_2065 )
      ( MAKE-ON ?AUTO_2064 ?AUTO_2065 )
      ( MAKE-ON-VERIFY ?AUTO_2064 ?AUTO_2065 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2071 - BLOCK
      ?AUTO_2072 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2071 ) ( CLEAR ?AUTO_2072 ) ( not ( = ?AUTO_2071 ?AUTO_2072 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2071 ?AUTO_2072 )
      ( MAKE-ON-VERIFY ?AUTO_2071 ?AUTO_2072 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2073 - BLOCK
      ?AUTO_2074 - BLOCK
    )
    :vars
    (
      ?AUTO_2075 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2074 ) ( not ( = ?AUTO_2073 ?AUTO_2074 ) ) ( ON ?AUTO_2073 ?AUTO_2075 ) ( CLEAR ?AUTO_2073 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2073 ?AUTO_2075 ) ) ( not ( = ?AUTO_2074 ?AUTO_2075 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2073 ?AUTO_2075 )
      ( MAKE-ON ?AUTO_2073 ?AUTO_2074 )
      ( MAKE-ON-VERIFY ?AUTO_2073 ?AUTO_2074 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2076 - BLOCK
      ?AUTO_2077 - BLOCK
    )
    :vars
    (
      ?AUTO_2078 - BLOCK
      ?AUTO_2079 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2076 ?AUTO_2077 ) ) ( ON ?AUTO_2076 ?AUTO_2078 ) ( CLEAR ?AUTO_2076 ) ( not ( = ?AUTO_2076 ?AUTO_2078 ) ) ( not ( = ?AUTO_2077 ?AUTO_2078 ) ) ( HOLDING ?AUTO_2077 ) ( CLEAR ?AUTO_2079 ) ( not ( = ?AUTO_2076 ?AUTO_2079 ) ) ( not ( = ?AUTO_2077 ?AUTO_2079 ) ) ( not ( = ?AUTO_2078 ?AUTO_2079 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2077 ?AUTO_2079 )
      ( MAKE-ON ?AUTO_2076 ?AUTO_2077 )
      ( MAKE-ON-VERIFY ?AUTO_2076 ?AUTO_2077 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2082 - BLOCK
      ?AUTO_2083 - BLOCK
    )
    :vars
    (
      ?AUTO_2084 - BLOCK
      ?AUTO_2085 - BLOCK
      ?AUTO_2086 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2083 ) ( not ( = ?AUTO_2082 ?AUTO_2083 ) ) ( ON ?AUTO_2082 ?AUTO_2084 ) ( CLEAR ?AUTO_2082 ) ( not ( = ?AUTO_2082 ?AUTO_2084 ) ) ( not ( = ?AUTO_2083 ?AUTO_2084 ) ) ( HOLDING ?AUTO_2085 ) ( CLEAR ?AUTO_2086 ) ( not ( = ?AUTO_2082 ?AUTO_2085 ) ) ( not ( = ?AUTO_2082 ?AUTO_2086 ) ) ( not ( = ?AUTO_2083 ?AUTO_2085 ) ) ( not ( = ?AUTO_2083 ?AUTO_2086 ) ) ( not ( = ?AUTO_2084 ?AUTO_2085 ) ) ( not ( = ?AUTO_2084 ?AUTO_2086 ) ) ( not ( = ?AUTO_2085 ?AUTO_2086 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2085 ?AUTO_2086 )
      ( MAKE-ON ?AUTO_2082 ?AUTO_2083 )
      ( MAKE-ON-VERIFY ?AUTO_2082 ?AUTO_2083 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2087 - BLOCK
      ?AUTO_2088 - BLOCK
    )
    :vars
    (
      ?AUTO_2089 - BLOCK
      ?AUTO_2090 - BLOCK
      ?AUTO_2091 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2087 ?AUTO_2088 ) ) ( ON ?AUTO_2087 ?AUTO_2089 ) ( CLEAR ?AUTO_2087 ) ( not ( = ?AUTO_2087 ?AUTO_2089 ) ) ( not ( = ?AUTO_2088 ?AUTO_2089 ) ) ( CLEAR ?AUTO_2090 ) ( not ( = ?AUTO_2087 ?AUTO_2091 ) ) ( not ( = ?AUTO_2087 ?AUTO_2090 ) ) ( not ( = ?AUTO_2088 ?AUTO_2091 ) ) ( not ( = ?AUTO_2088 ?AUTO_2090 ) ) ( not ( = ?AUTO_2089 ?AUTO_2091 ) ) ( not ( = ?AUTO_2089 ?AUTO_2090 ) ) ( not ( = ?AUTO_2091 ?AUTO_2090 ) ) ( ON ?AUTO_2091 ?AUTO_2088 ) ( CLEAR ?AUTO_2091 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2091 ?AUTO_2088 )
      ( MAKE-ON ?AUTO_2087 ?AUTO_2088 )
      ( MAKE-ON-VERIFY ?AUTO_2087 ?AUTO_2088 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2092 - BLOCK
      ?AUTO_2093 - BLOCK
    )
    :vars
    (
      ?AUTO_2094 - BLOCK
      ?AUTO_2095 - BLOCK
      ?AUTO_2096 - BLOCK
      ?AUTO_2097 - BLOCK
      ?AUTO_2098 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2092 ?AUTO_2093 ) ) ( ON ?AUTO_2092 ?AUTO_2094 ) ( CLEAR ?AUTO_2092 ) ( not ( = ?AUTO_2092 ?AUTO_2094 ) ) ( not ( = ?AUTO_2093 ?AUTO_2094 ) ) ( CLEAR ?AUTO_2095 ) ( not ( = ?AUTO_2092 ?AUTO_2096 ) ) ( not ( = ?AUTO_2092 ?AUTO_2095 ) ) ( not ( = ?AUTO_2093 ?AUTO_2096 ) ) ( not ( = ?AUTO_2093 ?AUTO_2095 ) ) ( not ( = ?AUTO_2094 ?AUTO_2096 ) ) ( not ( = ?AUTO_2094 ?AUTO_2095 ) ) ( not ( = ?AUTO_2096 ?AUTO_2095 ) ) ( ON ?AUTO_2096 ?AUTO_2093 ) ( CLEAR ?AUTO_2096 ) ( HOLDING ?AUTO_2097 ) ( CLEAR ?AUTO_2098 ) ( not ( = ?AUTO_2092 ?AUTO_2097 ) ) ( not ( = ?AUTO_2092 ?AUTO_2098 ) ) ( not ( = ?AUTO_2093 ?AUTO_2097 ) ) ( not ( = ?AUTO_2093 ?AUTO_2098 ) ) ( not ( = ?AUTO_2094 ?AUTO_2097 ) ) ( not ( = ?AUTO_2094 ?AUTO_2098 ) ) ( not ( = ?AUTO_2095 ?AUTO_2097 ) ) ( not ( = ?AUTO_2095 ?AUTO_2098 ) ) ( not ( = ?AUTO_2096 ?AUTO_2097 ) ) ( not ( = ?AUTO_2096 ?AUTO_2098 ) ) ( not ( = ?AUTO_2097 ?AUTO_2098 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2097 ?AUTO_2098 )
      ( MAKE-ON ?AUTO_2092 ?AUTO_2093 )
      ( MAKE-ON-VERIFY ?AUTO_2092 ?AUTO_2093 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2103 - BLOCK
      ?AUTO_2104 - BLOCK
    )
    :vars
    (
      ?AUTO_2109 - BLOCK
      ?AUTO_2108 - BLOCK
      ?AUTO_2105 - BLOCK
      ?AUTO_2106 - BLOCK
      ?AUTO_2107 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2103 ?AUTO_2104 ) ) ( ON ?AUTO_2103 ?AUTO_2109 ) ( CLEAR ?AUTO_2103 ) ( not ( = ?AUTO_2103 ?AUTO_2109 ) ) ( not ( = ?AUTO_2104 ?AUTO_2109 ) ) ( CLEAR ?AUTO_2108 ) ( not ( = ?AUTO_2103 ?AUTO_2105 ) ) ( not ( = ?AUTO_2103 ?AUTO_2108 ) ) ( not ( = ?AUTO_2104 ?AUTO_2105 ) ) ( not ( = ?AUTO_2104 ?AUTO_2108 ) ) ( not ( = ?AUTO_2109 ?AUTO_2105 ) ) ( not ( = ?AUTO_2109 ?AUTO_2108 ) ) ( not ( = ?AUTO_2105 ?AUTO_2108 ) ) ( ON ?AUTO_2105 ?AUTO_2104 ) ( CLEAR ?AUTO_2106 ) ( not ( = ?AUTO_2103 ?AUTO_2107 ) ) ( not ( = ?AUTO_2103 ?AUTO_2106 ) ) ( not ( = ?AUTO_2104 ?AUTO_2107 ) ) ( not ( = ?AUTO_2104 ?AUTO_2106 ) ) ( not ( = ?AUTO_2109 ?AUTO_2107 ) ) ( not ( = ?AUTO_2109 ?AUTO_2106 ) ) ( not ( = ?AUTO_2108 ?AUTO_2107 ) ) ( not ( = ?AUTO_2108 ?AUTO_2106 ) ) ( not ( = ?AUTO_2105 ?AUTO_2107 ) ) ( not ( = ?AUTO_2105 ?AUTO_2106 ) ) ( not ( = ?AUTO_2107 ?AUTO_2106 ) ) ( ON ?AUTO_2107 ?AUTO_2105 ) ( CLEAR ?AUTO_2107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2107 ?AUTO_2105 )
      ( MAKE-ON ?AUTO_2103 ?AUTO_2104 )
      ( MAKE-ON-VERIFY ?AUTO_2103 ?AUTO_2104 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2111 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2111 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2111 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2111 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2112 - BLOCK
    )
    :vars
    (
      ?AUTO_2113 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2112 ?AUTO_2113 ) ( CLEAR ?AUTO_2112 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2112 ?AUTO_2113 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2112 ?AUTO_2113 )
      ( MAKE-ON-TABLE ?AUTO_2112 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2112 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2114 - BLOCK
    )
    :vars
    (
      ?AUTO_2115 - BLOCK
      ?AUTO_2116 - BLOCK
      ?AUTO_2117 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2114 ?AUTO_2115 ) ( CLEAR ?AUTO_2114 ) ( not ( = ?AUTO_2114 ?AUTO_2115 ) ) ( HOLDING ?AUTO_2116 ) ( CLEAR ?AUTO_2117 ) ( not ( = ?AUTO_2114 ?AUTO_2116 ) ) ( not ( = ?AUTO_2114 ?AUTO_2117 ) ) ( not ( = ?AUTO_2115 ?AUTO_2116 ) ) ( not ( = ?AUTO_2115 ?AUTO_2117 ) ) ( not ( = ?AUTO_2116 ?AUTO_2117 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2116 ?AUTO_2117 )
      ( MAKE-ON-TABLE ?AUTO_2114 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2114 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2118 - BLOCK
    )
    :vars
    (
      ?AUTO_2119 - BLOCK
      ?AUTO_2121 - BLOCK
      ?AUTO_2120 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2118 ?AUTO_2119 ) ( not ( = ?AUTO_2118 ?AUTO_2119 ) ) ( CLEAR ?AUTO_2121 ) ( not ( = ?AUTO_2118 ?AUTO_2120 ) ) ( not ( = ?AUTO_2118 ?AUTO_2121 ) ) ( not ( = ?AUTO_2119 ?AUTO_2120 ) ) ( not ( = ?AUTO_2119 ?AUTO_2121 ) ) ( not ( = ?AUTO_2120 ?AUTO_2121 ) ) ( ON ?AUTO_2120 ?AUTO_2118 ) ( CLEAR ?AUTO_2120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2120 ?AUTO_2118 )
      ( MAKE-ON-TABLE ?AUTO_2118 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2118 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2122 - BLOCK
    )
    :vars
    (
      ?AUTO_2123 - BLOCK
      ?AUTO_2124 - BLOCK
      ?AUTO_2125 - BLOCK
      ?AUTO_2126 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2122 ?AUTO_2123 ) ( not ( = ?AUTO_2122 ?AUTO_2123 ) ) ( not ( = ?AUTO_2122 ?AUTO_2124 ) ) ( not ( = ?AUTO_2122 ?AUTO_2125 ) ) ( not ( = ?AUTO_2123 ?AUTO_2124 ) ) ( not ( = ?AUTO_2123 ?AUTO_2125 ) ) ( not ( = ?AUTO_2124 ?AUTO_2125 ) ) ( ON ?AUTO_2124 ?AUTO_2122 ) ( CLEAR ?AUTO_2124 ) ( HOLDING ?AUTO_2125 ) ( CLEAR ?AUTO_2126 ) ( not ( = ?AUTO_2122 ?AUTO_2126 ) ) ( not ( = ?AUTO_2123 ?AUTO_2126 ) ) ( not ( = ?AUTO_2124 ?AUTO_2126 ) ) ( not ( = ?AUTO_2125 ?AUTO_2126 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2125 ?AUTO_2126 )
      ( MAKE-ON-TABLE ?AUTO_2122 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2122 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2135 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2135 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2135 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2135 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2136 - BLOCK
    )
    :vars
    (
      ?AUTO_2137 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2136 ?AUTO_2137 ) ( CLEAR ?AUTO_2136 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2136 ?AUTO_2137 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2136 ?AUTO_2137 )
      ( MAKE-ON-TABLE ?AUTO_2136 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2136 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2138 - BLOCK
    )
    :vars
    (
      ?AUTO_2139 - BLOCK
      ?AUTO_2140 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2138 ?AUTO_2139 ) ( CLEAR ?AUTO_2138 ) ( not ( = ?AUTO_2138 ?AUTO_2139 ) ) ( HOLDING ?AUTO_2140 ) ( not ( = ?AUTO_2138 ?AUTO_2140 ) ) ( not ( = ?AUTO_2139 ?AUTO_2140 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2140 )
      ( MAKE-ON-TABLE ?AUTO_2138 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2138 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2141 - BLOCK
    )
    :vars
    (
      ?AUTO_2143 - BLOCK
      ?AUTO_2142 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2141 ?AUTO_2143 ) ( not ( = ?AUTO_2141 ?AUTO_2143 ) ) ( not ( = ?AUTO_2141 ?AUTO_2142 ) ) ( not ( = ?AUTO_2143 ?AUTO_2142 ) ) ( ON ?AUTO_2142 ?AUTO_2141 ) ( CLEAR ?AUTO_2142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2142 ?AUTO_2141 )
      ( MAKE-ON-TABLE ?AUTO_2141 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2141 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2144 - BLOCK
    )
    :vars
    (
      ?AUTO_2145 - BLOCK
      ?AUTO_2146 - BLOCK
      ?AUTO_2147 - BLOCK
      ?AUTO_2148 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2144 ?AUTO_2145 ) ( not ( = ?AUTO_2144 ?AUTO_2145 ) ) ( not ( = ?AUTO_2144 ?AUTO_2146 ) ) ( not ( = ?AUTO_2145 ?AUTO_2146 ) ) ( ON ?AUTO_2146 ?AUTO_2144 ) ( CLEAR ?AUTO_2146 ) ( HOLDING ?AUTO_2147 ) ( CLEAR ?AUTO_2148 ) ( not ( = ?AUTO_2144 ?AUTO_2147 ) ) ( not ( = ?AUTO_2144 ?AUTO_2148 ) ) ( not ( = ?AUTO_2145 ?AUTO_2147 ) ) ( not ( = ?AUTO_2145 ?AUTO_2148 ) ) ( not ( = ?AUTO_2146 ?AUTO_2147 ) ) ( not ( = ?AUTO_2146 ?AUTO_2148 ) ) ( not ( = ?AUTO_2147 ?AUTO_2148 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2147 ?AUTO_2148 )
      ( MAKE-ON-TABLE ?AUTO_2144 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2144 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2149 - BLOCK
    )
    :vars
    (
      ?AUTO_2151 - BLOCK
      ?AUTO_2150 - BLOCK
      ?AUTO_2152 - BLOCK
      ?AUTO_2153 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2149 ?AUTO_2151 ) ( not ( = ?AUTO_2149 ?AUTO_2151 ) ) ( not ( = ?AUTO_2149 ?AUTO_2150 ) ) ( not ( = ?AUTO_2151 ?AUTO_2150 ) ) ( ON ?AUTO_2150 ?AUTO_2149 ) ( CLEAR ?AUTO_2152 ) ( not ( = ?AUTO_2149 ?AUTO_2153 ) ) ( not ( = ?AUTO_2149 ?AUTO_2152 ) ) ( not ( = ?AUTO_2151 ?AUTO_2153 ) ) ( not ( = ?AUTO_2151 ?AUTO_2152 ) ) ( not ( = ?AUTO_2150 ?AUTO_2153 ) ) ( not ( = ?AUTO_2150 ?AUTO_2152 ) ) ( not ( = ?AUTO_2153 ?AUTO_2152 ) ) ( ON ?AUTO_2153 ?AUTO_2150 ) ( CLEAR ?AUTO_2153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2153 ?AUTO_2150 )
      ( MAKE-ON-TABLE ?AUTO_2149 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2149 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2154 - BLOCK
    )
    :vars
    (
      ?AUTO_2156 - BLOCK
      ?AUTO_2158 - BLOCK
      ?AUTO_2157 - BLOCK
      ?AUTO_2155 - BLOCK
      ?AUTO_2159 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2154 ?AUTO_2156 ) ( not ( = ?AUTO_2154 ?AUTO_2156 ) ) ( not ( = ?AUTO_2154 ?AUTO_2158 ) ) ( not ( = ?AUTO_2156 ?AUTO_2158 ) ) ( ON ?AUTO_2158 ?AUTO_2154 ) ( not ( = ?AUTO_2154 ?AUTO_2157 ) ) ( not ( = ?AUTO_2154 ?AUTO_2155 ) ) ( not ( = ?AUTO_2156 ?AUTO_2157 ) ) ( not ( = ?AUTO_2156 ?AUTO_2155 ) ) ( not ( = ?AUTO_2158 ?AUTO_2157 ) ) ( not ( = ?AUTO_2158 ?AUTO_2155 ) ) ( not ( = ?AUTO_2157 ?AUTO_2155 ) ) ( ON ?AUTO_2157 ?AUTO_2158 ) ( CLEAR ?AUTO_2157 ) ( HOLDING ?AUTO_2155 ) ( CLEAR ?AUTO_2159 ) ( not ( = ?AUTO_2154 ?AUTO_2159 ) ) ( not ( = ?AUTO_2156 ?AUTO_2159 ) ) ( not ( = ?AUTO_2158 ?AUTO_2159 ) ) ( not ( = ?AUTO_2157 ?AUTO_2159 ) ) ( not ( = ?AUTO_2155 ?AUTO_2159 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2155 ?AUTO_2159 )
      ( MAKE-ON-TABLE ?AUTO_2154 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2154 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2169 - BLOCK
      ?AUTO_2170 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2169 ) ( CLEAR ?AUTO_2170 ) ( not ( = ?AUTO_2169 ?AUTO_2170 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2169 ?AUTO_2170 )
      ( MAKE-ON-VERIFY ?AUTO_2169 ?AUTO_2170 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2171 - BLOCK
      ?AUTO_2172 - BLOCK
    )
    :vars
    (
      ?AUTO_2173 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2172 ) ( not ( = ?AUTO_2171 ?AUTO_2172 ) ) ( ON ?AUTO_2171 ?AUTO_2173 ) ( CLEAR ?AUTO_2171 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2171 ?AUTO_2173 ) ) ( not ( = ?AUTO_2172 ?AUTO_2173 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2171 ?AUTO_2173 )
      ( MAKE-ON ?AUTO_2171 ?AUTO_2172 )
      ( MAKE-ON-VERIFY ?AUTO_2171 ?AUTO_2172 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2174 - BLOCK
      ?AUTO_2175 - BLOCK
    )
    :vars
    (
      ?AUTO_2176 - BLOCK
      ?AUTO_2177 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2175 ) ( not ( = ?AUTO_2174 ?AUTO_2175 ) ) ( ON ?AUTO_2174 ?AUTO_2176 ) ( CLEAR ?AUTO_2174 ) ( not ( = ?AUTO_2174 ?AUTO_2176 ) ) ( not ( = ?AUTO_2175 ?AUTO_2176 ) ) ( HOLDING ?AUTO_2177 ) ( not ( = ?AUTO_2174 ?AUTO_2177 ) ) ( not ( = ?AUTO_2175 ?AUTO_2177 ) ) ( not ( = ?AUTO_2176 ?AUTO_2177 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2177 )
      ( MAKE-ON ?AUTO_2174 ?AUTO_2175 )
      ( MAKE-ON-VERIFY ?AUTO_2174 ?AUTO_2175 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2178 - BLOCK
      ?AUTO_2179 - BLOCK
    )
    :vars
    (
      ?AUTO_2180 - BLOCK
      ?AUTO_2181 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2179 ) ( not ( = ?AUTO_2178 ?AUTO_2179 ) ) ( ON ?AUTO_2178 ?AUTO_2180 ) ( not ( = ?AUTO_2178 ?AUTO_2180 ) ) ( not ( = ?AUTO_2179 ?AUTO_2180 ) ) ( not ( = ?AUTO_2178 ?AUTO_2181 ) ) ( not ( = ?AUTO_2179 ?AUTO_2181 ) ) ( not ( = ?AUTO_2180 ?AUTO_2181 ) ) ( ON ?AUTO_2181 ?AUTO_2178 ) ( CLEAR ?AUTO_2181 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2181 ?AUTO_2178 )
      ( MAKE-ON ?AUTO_2178 ?AUTO_2179 )
      ( MAKE-ON-VERIFY ?AUTO_2178 ?AUTO_2179 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2182 - BLOCK
      ?AUTO_2183 - BLOCK
    )
    :vars
    (
      ?AUTO_2184 - BLOCK
      ?AUTO_2185 - BLOCK
      ?AUTO_2186 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2183 ) ( not ( = ?AUTO_2182 ?AUTO_2183 ) ) ( ON ?AUTO_2182 ?AUTO_2184 ) ( not ( = ?AUTO_2182 ?AUTO_2184 ) ) ( not ( = ?AUTO_2183 ?AUTO_2184 ) ) ( not ( = ?AUTO_2182 ?AUTO_2185 ) ) ( not ( = ?AUTO_2183 ?AUTO_2185 ) ) ( not ( = ?AUTO_2184 ?AUTO_2185 ) ) ( ON ?AUTO_2185 ?AUTO_2182 ) ( CLEAR ?AUTO_2185 ) ( HOLDING ?AUTO_2186 ) ( not ( = ?AUTO_2182 ?AUTO_2186 ) ) ( not ( = ?AUTO_2183 ?AUTO_2186 ) ) ( not ( = ?AUTO_2184 ?AUTO_2186 ) ) ( not ( = ?AUTO_2185 ?AUTO_2186 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2186 )
      ( MAKE-ON ?AUTO_2182 ?AUTO_2183 )
      ( MAKE-ON-VERIFY ?AUTO_2182 ?AUTO_2183 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2187 - BLOCK
      ?AUTO_2188 - BLOCK
    )
    :vars
    (
      ?AUTO_2189 - BLOCK
      ?AUTO_2190 - BLOCK
      ?AUTO_2191 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2188 ) ( not ( = ?AUTO_2187 ?AUTO_2188 ) ) ( ON ?AUTO_2187 ?AUTO_2189 ) ( not ( = ?AUTO_2187 ?AUTO_2189 ) ) ( not ( = ?AUTO_2188 ?AUTO_2189 ) ) ( not ( = ?AUTO_2187 ?AUTO_2190 ) ) ( not ( = ?AUTO_2188 ?AUTO_2190 ) ) ( not ( = ?AUTO_2189 ?AUTO_2190 ) ) ( ON ?AUTO_2190 ?AUTO_2187 ) ( not ( = ?AUTO_2187 ?AUTO_2191 ) ) ( not ( = ?AUTO_2188 ?AUTO_2191 ) ) ( not ( = ?AUTO_2189 ?AUTO_2191 ) ) ( not ( = ?AUTO_2190 ?AUTO_2191 ) ) ( ON ?AUTO_2191 ?AUTO_2190 ) ( CLEAR ?AUTO_2191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2191 ?AUTO_2190 )
      ( MAKE-ON ?AUTO_2187 ?AUTO_2188 )
      ( MAKE-ON-VERIFY ?AUTO_2187 ?AUTO_2188 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2192 - BLOCK
      ?AUTO_2193 - BLOCK
    )
    :vars
    (
      ?AUTO_2195 - BLOCK
      ?AUTO_2194 - BLOCK
      ?AUTO_2196 - BLOCK
      ?AUTO_2197 - BLOCK
      ?AUTO_2198 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2193 ) ( not ( = ?AUTO_2192 ?AUTO_2193 ) ) ( ON ?AUTO_2192 ?AUTO_2195 ) ( not ( = ?AUTO_2192 ?AUTO_2195 ) ) ( not ( = ?AUTO_2193 ?AUTO_2195 ) ) ( not ( = ?AUTO_2192 ?AUTO_2194 ) ) ( not ( = ?AUTO_2193 ?AUTO_2194 ) ) ( not ( = ?AUTO_2195 ?AUTO_2194 ) ) ( ON ?AUTO_2194 ?AUTO_2192 ) ( not ( = ?AUTO_2192 ?AUTO_2196 ) ) ( not ( = ?AUTO_2193 ?AUTO_2196 ) ) ( not ( = ?AUTO_2195 ?AUTO_2196 ) ) ( not ( = ?AUTO_2194 ?AUTO_2196 ) ) ( ON ?AUTO_2196 ?AUTO_2194 ) ( CLEAR ?AUTO_2196 ) ( HOLDING ?AUTO_2197 ) ( CLEAR ?AUTO_2198 ) ( not ( = ?AUTO_2192 ?AUTO_2197 ) ) ( not ( = ?AUTO_2192 ?AUTO_2198 ) ) ( not ( = ?AUTO_2193 ?AUTO_2197 ) ) ( not ( = ?AUTO_2193 ?AUTO_2198 ) ) ( not ( = ?AUTO_2195 ?AUTO_2197 ) ) ( not ( = ?AUTO_2195 ?AUTO_2198 ) ) ( not ( = ?AUTO_2194 ?AUTO_2197 ) ) ( not ( = ?AUTO_2194 ?AUTO_2198 ) ) ( not ( = ?AUTO_2196 ?AUTO_2197 ) ) ( not ( = ?AUTO_2196 ?AUTO_2198 ) ) ( not ( = ?AUTO_2197 ?AUTO_2198 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2197 ?AUTO_2198 )
      ( MAKE-ON ?AUTO_2192 ?AUTO_2193 )
      ( MAKE-ON-VERIFY ?AUTO_2192 ?AUTO_2193 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2199 - BLOCK
      ?AUTO_2200 - BLOCK
    )
    :vars
    (
      ?AUTO_2201 - BLOCK
      ?AUTO_2202 - BLOCK
      ?AUTO_2204 - BLOCK
      ?AUTO_2205 - BLOCK
      ?AUTO_2203 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2200 ) ( not ( = ?AUTO_2199 ?AUTO_2200 ) ) ( ON ?AUTO_2199 ?AUTO_2201 ) ( not ( = ?AUTO_2199 ?AUTO_2201 ) ) ( not ( = ?AUTO_2200 ?AUTO_2201 ) ) ( not ( = ?AUTO_2199 ?AUTO_2202 ) ) ( not ( = ?AUTO_2200 ?AUTO_2202 ) ) ( not ( = ?AUTO_2201 ?AUTO_2202 ) ) ( ON ?AUTO_2202 ?AUTO_2199 ) ( not ( = ?AUTO_2199 ?AUTO_2204 ) ) ( not ( = ?AUTO_2200 ?AUTO_2204 ) ) ( not ( = ?AUTO_2201 ?AUTO_2204 ) ) ( not ( = ?AUTO_2202 ?AUTO_2204 ) ) ( ON ?AUTO_2204 ?AUTO_2202 ) ( CLEAR ?AUTO_2205 ) ( not ( = ?AUTO_2199 ?AUTO_2203 ) ) ( not ( = ?AUTO_2199 ?AUTO_2205 ) ) ( not ( = ?AUTO_2200 ?AUTO_2203 ) ) ( not ( = ?AUTO_2200 ?AUTO_2205 ) ) ( not ( = ?AUTO_2201 ?AUTO_2203 ) ) ( not ( = ?AUTO_2201 ?AUTO_2205 ) ) ( not ( = ?AUTO_2202 ?AUTO_2203 ) ) ( not ( = ?AUTO_2202 ?AUTO_2205 ) ) ( not ( = ?AUTO_2204 ?AUTO_2203 ) ) ( not ( = ?AUTO_2204 ?AUTO_2205 ) ) ( not ( = ?AUTO_2203 ?AUTO_2205 ) ) ( ON ?AUTO_2203 ?AUTO_2204 ) ( CLEAR ?AUTO_2203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2203 ?AUTO_2204 )
      ( MAKE-ON ?AUTO_2199 ?AUTO_2200 )
      ( MAKE-ON-VERIFY ?AUTO_2199 ?AUTO_2200 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2206 - BLOCK
      ?AUTO_2207 - BLOCK
    )
    :vars
    (
      ?AUTO_2209 - BLOCK
      ?AUTO_2208 - BLOCK
      ?AUTO_2212 - BLOCK
      ?AUTO_2211 - BLOCK
      ?AUTO_2210 - BLOCK
      ?AUTO_2213 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2207 ) ( not ( = ?AUTO_2206 ?AUTO_2207 ) ) ( ON ?AUTO_2206 ?AUTO_2209 ) ( not ( = ?AUTO_2206 ?AUTO_2209 ) ) ( not ( = ?AUTO_2207 ?AUTO_2209 ) ) ( not ( = ?AUTO_2206 ?AUTO_2208 ) ) ( not ( = ?AUTO_2207 ?AUTO_2208 ) ) ( not ( = ?AUTO_2209 ?AUTO_2208 ) ) ( ON ?AUTO_2208 ?AUTO_2206 ) ( not ( = ?AUTO_2206 ?AUTO_2212 ) ) ( not ( = ?AUTO_2207 ?AUTO_2212 ) ) ( not ( = ?AUTO_2209 ?AUTO_2212 ) ) ( not ( = ?AUTO_2208 ?AUTO_2212 ) ) ( ON ?AUTO_2212 ?AUTO_2208 ) ( not ( = ?AUTO_2206 ?AUTO_2211 ) ) ( not ( = ?AUTO_2206 ?AUTO_2210 ) ) ( not ( = ?AUTO_2207 ?AUTO_2211 ) ) ( not ( = ?AUTO_2207 ?AUTO_2210 ) ) ( not ( = ?AUTO_2209 ?AUTO_2211 ) ) ( not ( = ?AUTO_2209 ?AUTO_2210 ) ) ( not ( = ?AUTO_2208 ?AUTO_2211 ) ) ( not ( = ?AUTO_2208 ?AUTO_2210 ) ) ( not ( = ?AUTO_2212 ?AUTO_2211 ) ) ( not ( = ?AUTO_2212 ?AUTO_2210 ) ) ( not ( = ?AUTO_2211 ?AUTO_2210 ) ) ( ON ?AUTO_2211 ?AUTO_2212 ) ( CLEAR ?AUTO_2211 ) ( HOLDING ?AUTO_2210 ) ( CLEAR ?AUTO_2213 ) ( not ( = ?AUTO_2206 ?AUTO_2213 ) ) ( not ( = ?AUTO_2207 ?AUTO_2213 ) ) ( not ( = ?AUTO_2209 ?AUTO_2213 ) ) ( not ( = ?AUTO_2208 ?AUTO_2213 ) ) ( not ( = ?AUTO_2212 ?AUTO_2213 ) ) ( not ( = ?AUTO_2211 ?AUTO_2213 ) ) ( not ( = ?AUTO_2210 ?AUTO_2213 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2210 ?AUTO_2213 )
      ( MAKE-ON ?AUTO_2206 ?AUTO_2207 )
      ( MAKE-ON-VERIFY ?AUTO_2206 ?AUTO_2207 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2220 - BLOCK
      ?AUTO_2221 - BLOCK
    )
    :vars
    (
      ?AUTO_2222 - BLOCK
      ?AUTO_2226 - BLOCK
      ?AUTO_2224 - BLOCK
      ?AUTO_2223 - BLOCK
      ?AUTO_2225 - BLOCK
      ?AUTO_2227 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2220 ?AUTO_2221 ) ) ( ON ?AUTO_2220 ?AUTO_2222 ) ( not ( = ?AUTO_2220 ?AUTO_2222 ) ) ( not ( = ?AUTO_2221 ?AUTO_2222 ) ) ( not ( = ?AUTO_2220 ?AUTO_2226 ) ) ( not ( = ?AUTO_2221 ?AUTO_2226 ) ) ( not ( = ?AUTO_2222 ?AUTO_2226 ) ) ( ON ?AUTO_2226 ?AUTO_2220 ) ( not ( = ?AUTO_2220 ?AUTO_2224 ) ) ( not ( = ?AUTO_2221 ?AUTO_2224 ) ) ( not ( = ?AUTO_2222 ?AUTO_2224 ) ) ( not ( = ?AUTO_2226 ?AUTO_2224 ) ) ( ON ?AUTO_2224 ?AUTO_2226 ) ( CLEAR ?AUTO_2223 ) ( not ( = ?AUTO_2220 ?AUTO_2225 ) ) ( not ( = ?AUTO_2220 ?AUTO_2223 ) ) ( not ( = ?AUTO_2221 ?AUTO_2225 ) ) ( not ( = ?AUTO_2221 ?AUTO_2223 ) ) ( not ( = ?AUTO_2222 ?AUTO_2225 ) ) ( not ( = ?AUTO_2222 ?AUTO_2223 ) ) ( not ( = ?AUTO_2226 ?AUTO_2225 ) ) ( not ( = ?AUTO_2226 ?AUTO_2223 ) ) ( not ( = ?AUTO_2224 ?AUTO_2225 ) ) ( not ( = ?AUTO_2224 ?AUTO_2223 ) ) ( not ( = ?AUTO_2225 ?AUTO_2223 ) ) ( ON ?AUTO_2225 ?AUTO_2224 ) ( CLEAR ?AUTO_2225 ) ( HOLDING ?AUTO_2221 ) ( CLEAR ?AUTO_2227 ) ( not ( = ?AUTO_2220 ?AUTO_2227 ) ) ( not ( = ?AUTO_2221 ?AUTO_2227 ) ) ( not ( = ?AUTO_2222 ?AUTO_2227 ) ) ( not ( = ?AUTO_2226 ?AUTO_2227 ) ) ( not ( = ?AUTO_2224 ?AUTO_2227 ) ) ( not ( = ?AUTO_2223 ?AUTO_2227 ) ) ( not ( = ?AUTO_2225 ?AUTO_2227 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2221 ?AUTO_2227 )
      ( MAKE-ON ?AUTO_2220 ?AUTO_2221 )
      ( MAKE-ON-VERIFY ?AUTO_2220 ?AUTO_2221 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2236 - BLOCK
      ?AUTO_2237 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2236 ) ( CLEAR ?AUTO_2237 ) ( not ( = ?AUTO_2236 ?AUTO_2237 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2236 ?AUTO_2237 )
      ( MAKE-ON-VERIFY ?AUTO_2236 ?AUTO_2237 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2238 - BLOCK
      ?AUTO_2239 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2239 ) ( not ( = ?AUTO_2238 ?AUTO_2239 ) ) ( ON-TABLE ?AUTO_2238 ) ( CLEAR ?AUTO_2238 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2238 )
      ( MAKE-ON ?AUTO_2238 ?AUTO_2239 )
      ( MAKE-ON-VERIFY ?AUTO_2238 ?AUTO_2239 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2240 - BLOCK
      ?AUTO_2241 - BLOCK
    )
    :vars
    (
      ?AUTO_2242 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2240 ?AUTO_2241 ) ) ( ON-TABLE ?AUTO_2240 ) ( CLEAR ?AUTO_2240 ) ( HOLDING ?AUTO_2241 ) ( CLEAR ?AUTO_2242 ) ( not ( = ?AUTO_2240 ?AUTO_2242 ) ) ( not ( = ?AUTO_2241 ?AUTO_2242 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2241 ?AUTO_2242 )
      ( MAKE-ON ?AUTO_2240 ?AUTO_2241 )
      ( MAKE-ON-VERIFY ?AUTO_2240 ?AUTO_2241 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2329 - BLOCK
      ?AUTO_2330 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2329 ) ( CLEAR ?AUTO_2330 ) ( not ( = ?AUTO_2329 ?AUTO_2330 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2329 ?AUTO_2330 )
      ( MAKE-ON-VERIFY ?AUTO_2329 ?AUTO_2330 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2331 - BLOCK
      ?AUTO_2332 - BLOCK
    )
    :vars
    (
      ?AUTO_2333 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2332 ) ( not ( = ?AUTO_2331 ?AUTO_2332 ) ) ( ON ?AUTO_2331 ?AUTO_2333 ) ( CLEAR ?AUTO_2331 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2331 ?AUTO_2333 ) ) ( not ( = ?AUTO_2332 ?AUTO_2333 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2331 ?AUTO_2333 )
      ( MAKE-ON ?AUTO_2331 ?AUTO_2332 )
      ( MAKE-ON-VERIFY ?AUTO_2331 ?AUTO_2332 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2334 - BLOCK
      ?AUTO_2335 - BLOCK
    )
    :vars
    (
      ?AUTO_2336 - BLOCK
      ?AUTO_2337 - BLOCK
      ?AUTO_2338 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2335 ) ( not ( = ?AUTO_2334 ?AUTO_2335 ) ) ( ON ?AUTO_2334 ?AUTO_2336 ) ( CLEAR ?AUTO_2334 ) ( not ( = ?AUTO_2334 ?AUTO_2336 ) ) ( not ( = ?AUTO_2335 ?AUTO_2336 ) ) ( HOLDING ?AUTO_2337 ) ( CLEAR ?AUTO_2338 ) ( not ( = ?AUTO_2334 ?AUTO_2337 ) ) ( not ( = ?AUTO_2334 ?AUTO_2338 ) ) ( not ( = ?AUTO_2335 ?AUTO_2337 ) ) ( not ( = ?AUTO_2335 ?AUTO_2338 ) ) ( not ( = ?AUTO_2336 ?AUTO_2337 ) ) ( not ( = ?AUTO_2336 ?AUTO_2338 ) ) ( not ( = ?AUTO_2337 ?AUTO_2338 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2337 ?AUTO_2338 )
      ( MAKE-ON ?AUTO_2334 ?AUTO_2335 )
      ( MAKE-ON-VERIFY ?AUTO_2334 ?AUTO_2335 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2343 - BLOCK
      ?AUTO_2344 - BLOCK
    )
    :vars
    (
      ?AUTO_2347 - BLOCK
      ?AUTO_2345 - BLOCK
      ?AUTO_2346 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2343 ?AUTO_2344 ) ) ( ON ?AUTO_2343 ?AUTO_2347 ) ( CLEAR ?AUTO_2343 ) ( not ( = ?AUTO_2343 ?AUTO_2347 ) ) ( not ( = ?AUTO_2344 ?AUTO_2347 ) ) ( CLEAR ?AUTO_2345 ) ( not ( = ?AUTO_2343 ?AUTO_2346 ) ) ( not ( = ?AUTO_2343 ?AUTO_2345 ) ) ( not ( = ?AUTO_2344 ?AUTO_2346 ) ) ( not ( = ?AUTO_2344 ?AUTO_2345 ) ) ( not ( = ?AUTO_2347 ?AUTO_2346 ) ) ( not ( = ?AUTO_2347 ?AUTO_2345 ) ) ( not ( = ?AUTO_2346 ?AUTO_2345 ) ) ( ON ?AUTO_2346 ?AUTO_2344 ) ( CLEAR ?AUTO_2346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2346 ?AUTO_2344 )
      ( MAKE-ON ?AUTO_2343 ?AUTO_2344 )
      ( MAKE-ON-VERIFY ?AUTO_2343 ?AUTO_2344 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2348 - BLOCK
      ?AUTO_2349 - BLOCK
    )
    :vars
    (
      ?AUTO_2352 - BLOCK
      ?AUTO_2351 - BLOCK
      ?AUTO_2350 - BLOCK
      ?AUTO_2353 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2348 ?AUTO_2349 ) ) ( ON ?AUTO_2348 ?AUTO_2352 ) ( CLEAR ?AUTO_2348 ) ( not ( = ?AUTO_2348 ?AUTO_2352 ) ) ( not ( = ?AUTO_2349 ?AUTO_2352 ) ) ( CLEAR ?AUTO_2351 ) ( not ( = ?AUTO_2348 ?AUTO_2350 ) ) ( not ( = ?AUTO_2348 ?AUTO_2351 ) ) ( not ( = ?AUTO_2349 ?AUTO_2350 ) ) ( not ( = ?AUTO_2349 ?AUTO_2351 ) ) ( not ( = ?AUTO_2352 ?AUTO_2350 ) ) ( not ( = ?AUTO_2352 ?AUTO_2351 ) ) ( not ( = ?AUTO_2350 ?AUTO_2351 ) ) ( ON ?AUTO_2350 ?AUTO_2349 ) ( CLEAR ?AUTO_2350 ) ( HOLDING ?AUTO_2353 ) ( not ( = ?AUTO_2348 ?AUTO_2353 ) ) ( not ( = ?AUTO_2349 ?AUTO_2353 ) ) ( not ( = ?AUTO_2352 ?AUTO_2353 ) ) ( not ( = ?AUTO_2351 ?AUTO_2353 ) ) ( not ( = ?AUTO_2350 ?AUTO_2353 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2353 )
      ( MAKE-ON ?AUTO_2348 ?AUTO_2349 )
      ( MAKE-ON-VERIFY ?AUTO_2348 ?AUTO_2349 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2354 - BLOCK
      ?AUTO_2355 - BLOCK
    )
    :vars
    (
      ?AUTO_2358 - BLOCK
      ?AUTO_2357 - BLOCK
      ?AUTO_2356 - BLOCK
      ?AUTO_2359 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2354 ?AUTO_2355 ) ) ( ON ?AUTO_2354 ?AUTO_2358 ) ( CLEAR ?AUTO_2354 ) ( not ( = ?AUTO_2354 ?AUTO_2358 ) ) ( not ( = ?AUTO_2355 ?AUTO_2358 ) ) ( CLEAR ?AUTO_2357 ) ( not ( = ?AUTO_2354 ?AUTO_2356 ) ) ( not ( = ?AUTO_2354 ?AUTO_2357 ) ) ( not ( = ?AUTO_2355 ?AUTO_2356 ) ) ( not ( = ?AUTO_2355 ?AUTO_2357 ) ) ( not ( = ?AUTO_2358 ?AUTO_2356 ) ) ( not ( = ?AUTO_2358 ?AUTO_2357 ) ) ( not ( = ?AUTO_2356 ?AUTO_2357 ) ) ( ON ?AUTO_2356 ?AUTO_2355 ) ( not ( = ?AUTO_2354 ?AUTO_2359 ) ) ( not ( = ?AUTO_2355 ?AUTO_2359 ) ) ( not ( = ?AUTO_2358 ?AUTO_2359 ) ) ( not ( = ?AUTO_2357 ?AUTO_2359 ) ) ( not ( = ?AUTO_2356 ?AUTO_2359 ) ) ( ON ?AUTO_2359 ?AUTO_2356 ) ( CLEAR ?AUTO_2359 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2359 ?AUTO_2356 )
      ( MAKE-ON ?AUTO_2354 ?AUTO_2355 )
      ( MAKE-ON-VERIFY ?AUTO_2354 ?AUTO_2355 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2360 - BLOCK
      ?AUTO_2361 - BLOCK
    )
    :vars
    (
      ?AUTO_2364 - BLOCK
      ?AUTO_2365 - BLOCK
      ?AUTO_2363 - BLOCK
      ?AUTO_2362 - BLOCK
      ?AUTO_2366 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2360 ?AUTO_2361 ) ) ( ON ?AUTO_2360 ?AUTO_2364 ) ( CLEAR ?AUTO_2360 ) ( not ( = ?AUTO_2360 ?AUTO_2364 ) ) ( not ( = ?AUTO_2361 ?AUTO_2364 ) ) ( CLEAR ?AUTO_2365 ) ( not ( = ?AUTO_2360 ?AUTO_2363 ) ) ( not ( = ?AUTO_2360 ?AUTO_2365 ) ) ( not ( = ?AUTO_2361 ?AUTO_2363 ) ) ( not ( = ?AUTO_2361 ?AUTO_2365 ) ) ( not ( = ?AUTO_2364 ?AUTO_2363 ) ) ( not ( = ?AUTO_2364 ?AUTO_2365 ) ) ( not ( = ?AUTO_2363 ?AUTO_2365 ) ) ( ON ?AUTO_2363 ?AUTO_2361 ) ( not ( = ?AUTO_2360 ?AUTO_2362 ) ) ( not ( = ?AUTO_2361 ?AUTO_2362 ) ) ( not ( = ?AUTO_2364 ?AUTO_2362 ) ) ( not ( = ?AUTO_2365 ?AUTO_2362 ) ) ( not ( = ?AUTO_2363 ?AUTO_2362 ) ) ( ON ?AUTO_2362 ?AUTO_2363 ) ( CLEAR ?AUTO_2362 ) ( HOLDING ?AUTO_2366 ) ( not ( = ?AUTO_2360 ?AUTO_2366 ) ) ( not ( = ?AUTO_2361 ?AUTO_2366 ) ) ( not ( = ?AUTO_2364 ?AUTO_2366 ) ) ( not ( = ?AUTO_2365 ?AUTO_2366 ) ) ( not ( = ?AUTO_2363 ?AUTO_2366 ) ) ( not ( = ?AUTO_2362 ?AUTO_2366 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2366 )
      ( MAKE-ON ?AUTO_2360 ?AUTO_2361 )
      ( MAKE-ON-VERIFY ?AUTO_2360 ?AUTO_2361 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2367 - BLOCK
      ?AUTO_2368 - BLOCK
    )
    :vars
    (
      ?AUTO_2373 - BLOCK
      ?AUTO_2369 - BLOCK
      ?AUTO_2370 - BLOCK
      ?AUTO_2371 - BLOCK
      ?AUTO_2372 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2367 ?AUTO_2368 ) ) ( ON ?AUTO_2367 ?AUTO_2373 ) ( CLEAR ?AUTO_2367 ) ( not ( = ?AUTO_2367 ?AUTO_2373 ) ) ( not ( = ?AUTO_2368 ?AUTO_2373 ) ) ( CLEAR ?AUTO_2369 ) ( not ( = ?AUTO_2367 ?AUTO_2370 ) ) ( not ( = ?AUTO_2367 ?AUTO_2369 ) ) ( not ( = ?AUTO_2368 ?AUTO_2370 ) ) ( not ( = ?AUTO_2368 ?AUTO_2369 ) ) ( not ( = ?AUTO_2373 ?AUTO_2370 ) ) ( not ( = ?AUTO_2373 ?AUTO_2369 ) ) ( not ( = ?AUTO_2370 ?AUTO_2369 ) ) ( ON ?AUTO_2370 ?AUTO_2368 ) ( not ( = ?AUTO_2367 ?AUTO_2371 ) ) ( not ( = ?AUTO_2368 ?AUTO_2371 ) ) ( not ( = ?AUTO_2373 ?AUTO_2371 ) ) ( not ( = ?AUTO_2369 ?AUTO_2371 ) ) ( not ( = ?AUTO_2370 ?AUTO_2371 ) ) ( ON ?AUTO_2371 ?AUTO_2370 ) ( not ( = ?AUTO_2367 ?AUTO_2372 ) ) ( not ( = ?AUTO_2368 ?AUTO_2372 ) ) ( not ( = ?AUTO_2373 ?AUTO_2372 ) ) ( not ( = ?AUTO_2369 ?AUTO_2372 ) ) ( not ( = ?AUTO_2370 ?AUTO_2372 ) ) ( not ( = ?AUTO_2371 ?AUTO_2372 ) ) ( ON ?AUTO_2372 ?AUTO_2371 ) ( CLEAR ?AUTO_2372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2372 ?AUTO_2371 )
      ( MAKE-ON ?AUTO_2367 ?AUTO_2368 )
      ( MAKE-ON-VERIFY ?AUTO_2367 ?AUTO_2368 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2374 - BLOCK
      ?AUTO_2375 - BLOCK
    )
    :vars
    (
      ?AUTO_2379 - BLOCK
      ?AUTO_2376 - BLOCK
      ?AUTO_2377 - BLOCK
      ?AUTO_2378 - BLOCK
      ?AUTO_2380 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2374 ?AUTO_2375 ) ) ( not ( = ?AUTO_2374 ?AUTO_2379 ) ) ( not ( = ?AUTO_2375 ?AUTO_2379 ) ) ( CLEAR ?AUTO_2376 ) ( not ( = ?AUTO_2374 ?AUTO_2377 ) ) ( not ( = ?AUTO_2374 ?AUTO_2376 ) ) ( not ( = ?AUTO_2375 ?AUTO_2377 ) ) ( not ( = ?AUTO_2375 ?AUTO_2376 ) ) ( not ( = ?AUTO_2379 ?AUTO_2377 ) ) ( not ( = ?AUTO_2379 ?AUTO_2376 ) ) ( not ( = ?AUTO_2377 ?AUTO_2376 ) ) ( ON ?AUTO_2377 ?AUTO_2375 ) ( not ( = ?AUTO_2374 ?AUTO_2378 ) ) ( not ( = ?AUTO_2375 ?AUTO_2378 ) ) ( not ( = ?AUTO_2379 ?AUTO_2378 ) ) ( not ( = ?AUTO_2376 ?AUTO_2378 ) ) ( not ( = ?AUTO_2377 ?AUTO_2378 ) ) ( ON ?AUTO_2378 ?AUTO_2377 ) ( not ( = ?AUTO_2374 ?AUTO_2380 ) ) ( not ( = ?AUTO_2375 ?AUTO_2380 ) ) ( not ( = ?AUTO_2379 ?AUTO_2380 ) ) ( not ( = ?AUTO_2376 ?AUTO_2380 ) ) ( not ( = ?AUTO_2377 ?AUTO_2380 ) ) ( not ( = ?AUTO_2378 ?AUTO_2380 ) ) ( ON ?AUTO_2380 ?AUTO_2378 ) ( CLEAR ?AUTO_2380 ) ( HOLDING ?AUTO_2374 ) ( CLEAR ?AUTO_2379 ) )
    :subtasks
    ( ( !STACK ?AUTO_2374 ?AUTO_2379 )
      ( MAKE-ON ?AUTO_2374 ?AUTO_2375 )
      ( MAKE-ON-VERIFY ?AUTO_2374 ?AUTO_2375 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2381 - BLOCK
      ?AUTO_2382 - BLOCK
    )
    :vars
    (
      ?AUTO_2385 - BLOCK
      ?AUTO_2387 - BLOCK
      ?AUTO_2384 - BLOCK
      ?AUTO_2386 - BLOCK
      ?AUTO_2383 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2381 ?AUTO_2382 ) ) ( not ( = ?AUTO_2381 ?AUTO_2385 ) ) ( not ( = ?AUTO_2382 ?AUTO_2385 ) ) ( CLEAR ?AUTO_2387 ) ( not ( = ?AUTO_2381 ?AUTO_2384 ) ) ( not ( = ?AUTO_2381 ?AUTO_2387 ) ) ( not ( = ?AUTO_2382 ?AUTO_2384 ) ) ( not ( = ?AUTO_2382 ?AUTO_2387 ) ) ( not ( = ?AUTO_2385 ?AUTO_2384 ) ) ( not ( = ?AUTO_2385 ?AUTO_2387 ) ) ( not ( = ?AUTO_2384 ?AUTO_2387 ) ) ( ON ?AUTO_2384 ?AUTO_2382 ) ( not ( = ?AUTO_2381 ?AUTO_2386 ) ) ( not ( = ?AUTO_2382 ?AUTO_2386 ) ) ( not ( = ?AUTO_2385 ?AUTO_2386 ) ) ( not ( = ?AUTO_2387 ?AUTO_2386 ) ) ( not ( = ?AUTO_2384 ?AUTO_2386 ) ) ( ON ?AUTO_2386 ?AUTO_2384 ) ( not ( = ?AUTO_2381 ?AUTO_2383 ) ) ( not ( = ?AUTO_2382 ?AUTO_2383 ) ) ( not ( = ?AUTO_2385 ?AUTO_2383 ) ) ( not ( = ?AUTO_2387 ?AUTO_2383 ) ) ( not ( = ?AUTO_2384 ?AUTO_2383 ) ) ( not ( = ?AUTO_2386 ?AUTO_2383 ) ) ( ON ?AUTO_2383 ?AUTO_2386 ) ( CLEAR ?AUTO_2385 ) ( ON ?AUTO_2381 ?AUTO_2383 ) ( CLEAR ?AUTO_2381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2381 ?AUTO_2383 )
      ( MAKE-ON ?AUTO_2381 ?AUTO_2382 )
      ( MAKE-ON-VERIFY ?AUTO_2381 ?AUTO_2382 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2388 - BLOCK
      ?AUTO_2389 - BLOCK
    )
    :vars
    (
      ?AUTO_2392 - BLOCK
      ?AUTO_2393 - BLOCK
      ?AUTO_2390 - BLOCK
      ?AUTO_2394 - BLOCK
      ?AUTO_2391 - BLOCK
      ?AUTO_2395 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2388 ?AUTO_2389 ) ) ( not ( = ?AUTO_2388 ?AUTO_2392 ) ) ( not ( = ?AUTO_2389 ?AUTO_2392 ) ) ( CLEAR ?AUTO_2393 ) ( not ( = ?AUTO_2388 ?AUTO_2390 ) ) ( not ( = ?AUTO_2388 ?AUTO_2393 ) ) ( not ( = ?AUTO_2389 ?AUTO_2390 ) ) ( not ( = ?AUTO_2389 ?AUTO_2393 ) ) ( not ( = ?AUTO_2392 ?AUTO_2390 ) ) ( not ( = ?AUTO_2392 ?AUTO_2393 ) ) ( not ( = ?AUTO_2390 ?AUTO_2393 ) ) ( ON ?AUTO_2390 ?AUTO_2389 ) ( not ( = ?AUTO_2388 ?AUTO_2394 ) ) ( not ( = ?AUTO_2389 ?AUTO_2394 ) ) ( not ( = ?AUTO_2392 ?AUTO_2394 ) ) ( not ( = ?AUTO_2393 ?AUTO_2394 ) ) ( not ( = ?AUTO_2390 ?AUTO_2394 ) ) ( ON ?AUTO_2394 ?AUTO_2390 ) ( not ( = ?AUTO_2388 ?AUTO_2391 ) ) ( not ( = ?AUTO_2389 ?AUTO_2391 ) ) ( not ( = ?AUTO_2392 ?AUTO_2391 ) ) ( not ( = ?AUTO_2393 ?AUTO_2391 ) ) ( not ( = ?AUTO_2390 ?AUTO_2391 ) ) ( not ( = ?AUTO_2394 ?AUTO_2391 ) ) ( ON ?AUTO_2391 ?AUTO_2394 ) ( ON ?AUTO_2388 ?AUTO_2391 ) ( CLEAR ?AUTO_2388 ) ( HOLDING ?AUTO_2392 ) ( CLEAR ?AUTO_2395 ) ( not ( = ?AUTO_2388 ?AUTO_2395 ) ) ( not ( = ?AUTO_2389 ?AUTO_2395 ) ) ( not ( = ?AUTO_2392 ?AUTO_2395 ) ) ( not ( = ?AUTO_2393 ?AUTO_2395 ) ) ( not ( = ?AUTO_2390 ?AUTO_2395 ) ) ( not ( = ?AUTO_2394 ?AUTO_2395 ) ) ( not ( = ?AUTO_2391 ?AUTO_2395 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2392 ?AUTO_2395 )
      ( MAKE-ON ?AUTO_2388 ?AUTO_2389 )
      ( MAKE-ON-VERIFY ?AUTO_2388 ?AUTO_2389 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2412 - BLOCK
      ?AUTO_2413 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2412 ) ( CLEAR ?AUTO_2413 ) ( not ( = ?AUTO_2412 ?AUTO_2413 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2412 ?AUTO_2413 )
      ( MAKE-ON-VERIFY ?AUTO_2412 ?AUTO_2413 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2414 - BLOCK
      ?AUTO_2415 - BLOCK
    )
    :vars
    (
      ?AUTO_2416 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2415 ) ( not ( = ?AUTO_2414 ?AUTO_2415 ) ) ( ON ?AUTO_2414 ?AUTO_2416 ) ( CLEAR ?AUTO_2414 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2414 ?AUTO_2416 ) ) ( not ( = ?AUTO_2415 ?AUTO_2416 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2414 ?AUTO_2416 )
      ( MAKE-ON ?AUTO_2414 ?AUTO_2415 )
      ( MAKE-ON-VERIFY ?AUTO_2414 ?AUTO_2415 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2417 - BLOCK
      ?AUTO_2418 - BLOCK
    )
    :vars
    (
      ?AUTO_2419 - BLOCK
      ?AUTO_2420 - BLOCK
      ?AUTO_2421 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2418 ) ( not ( = ?AUTO_2417 ?AUTO_2418 ) ) ( ON ?AUTO_2417 ?AUTO_2419 ) ( CLEAR ?AUTO_2417 ) ( not ( = ?AUTO_2417 ?AUTO_2419 ) ) ( not ( = ?AUTO_2418 ?AUTO_2419 ) ) ( HOLDING ?AUTO_2420 ) ( CLEAR ?AUTO_2421 ) ( not ( = ?AUTO_2417 ?AUTO_2420 ) ) ( not ( = ?AUTO_2417 ?AUTO_2421 ) ) ( not ( = ?AUTO_2418 ?AUTO_2420 ) ) ( not ( = ?AUTO_2418 ?AUTO_2421 ) ) ( not ( = ?AUTO_2419 ?AUTO_2420 ) ) ( not ( = ?AUTO_2419 ?AUTO_2421 ) ) ( not ( = ?AUTO_2420 ?AUTO_2421 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2420 ?AUTO_2421 )
      ( MAKE-ON ?AUTO_2417 ?AUTO_2418 )
      ( MAKE-ON-VERIFY ?AUTO_2417 ?AUTO_2418 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2422 - BLOCK
      ?AUTO_2423 - BLOCK
    )
    :vars
    (
      ?AUTO_2424 - BLOCK
      ?AUTO_2425 - BLOCK
      ?AUTO_2426 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2423 ) ( not ( = ?AUTO_2422 ?AUTO_2423 ) ) ( ON ?AUTO_2422 ?AUTO_2424 ) ( not ( = ?AUTO_2422 ?AUTO_2424 ) ) ( not ( = ?AUTO_2423 ?AUTO_2424 ) ) ( CLEAR ?AUTO_2425 ) ( not ( = ?AUTO_2422 ?AUTO_2426 ) ) ( not ( = ?AUTO_2422 ?AUTO_2425 ) ) ( not ( = ?AUTO_2423 ?AUTO_2426 ) ) ( not ( = ?AUTO_2423 ?AUTO_2425 ) ) ( not ( = ?AUTO_2424 ?AUTO_2426 ) ) ( not ( = ?AUTO_2424 ?AUTO_2425 ) ) ( not ( = ?AUTO_2426 ?AUTO_2425 ) ) ( ON ?AUTO_2426 ?AUTO_2422 ) ( CLEAR ?AUTO_2426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2426 ?AUTO_2422 )
      ( MAKE-ON ?AUTO_2422 ?AUTO_2423 )
      ( MAKE-ON-VERIFY ?AUTO_2422 ?AUTO_2423 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2427 - BLOCK
      ?AUTO_2428 - BLOCK
    )
    :vars
    (
      ?AUTO_2429 - BLOCK
      ?AUTO_2431 - BLOCK
      ?AUTO_2430 - BLOCK
      ?AUTO_2432 - BLOCK
      ?AUTO_2433 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2428 ) ( not ( = ?AUTO_2427 ?AUTO_2428 ) ) ( ON ?AUTO_2427 ?AUTO_2429 ) ( not ( = ?AUTO_2427 ?AUTO_2429 ) ) ( not ( = ?AUTO_2428 ?AUTO_2429 ) ) ( CLEAR ?AUTO_2431 ) ( not ( = ?AUTO_2427 ?AUTO_2430 ) ) ( not ( = ?AUTO_2427 ?AUTO_2431 ) ) ( not ( = ?AUTO_2428 ?AUTO_2430 ) ) ( not ( = ?AUTO_2428 ?AUTO_2431 ) ) ( not ( = ?AUTO_2429 ?AUTO_2430 ) ) ( not ( = ?AUTO_2429 ?AUTO_2431 ) ) ( not ( = ?AUTO_2430 ?AUTO_2431 ) ) ( ON ?AUTO_2430 ?AUTO_2427 ) ( CLEAR ?AUTO_2430 ) ( HOLDING ?AUTO_2432 ) ( CLEAR ?AUTO_2433 ) ( not ( = ?AUTO_2427 ?AUTO_2432 ) ) ( not ( = ?AUTO_2427 ?AUTO_2433 ) ) ( not ( = ?AUTO_2428 ?AUTO_2432 ) ) ( not ( = ?AUTO_2428 ?AUTO_2433 ) ) ( not ( = ?AUTO_2429 ?AUTO_2432 ) ) ( not ( = ?AUTO_2429 ?AUTO_2433 ) ) ( not ( = ?AUTO_2431 ?AUTO_2432 ) ) ( not ( = ?AUTO_2431 ?AUTO_2433 ) ) ( not ( = ?AUTO_2430 ?AUTO_2432 ) ) ( not ( = ?AUTO_2430 ?AUTO_2433 ) ) ( not ( = ?AUTO_2432 ?AUTO_2433 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2432 ?AUTO_2433 )
      ( MAKE-ON ?AUTO_2427 ?AUTO_2428 )
      ( MAKE-ON-VERIFY ?AUTO_2427 ?AUTO_2428 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2444 - BLOCK
      ?AUTO_2445 - BLOCK
    )
    :vars
    (
      ?AUTO_2448 - BLOCK
      ?AUTO_2446 - BLOCK
      ?AUTO_2447 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2444 ?AUTO_2445 ) ) ( ON ?AUTO_2444 ?AUTO_2448 ) ( not ( = ?AUTO_2444 ?AUTO_2448 ) ) ( not ( = ?AUTO_2445 ?AUTO_2448 ) ) ( CLEAR ?AUTO_2446 ) ( not ( = ?AUTO_2444 ?AUTO_2447 ) ) ( not ( = ?AUTO_2444 ?AUTO_2446 ) ) ( not ( = ?AUTO_2445 ?AUTO_2447 ) ) ( not ( = ?AUTO_2445 ?AUTO_2446 ) ) ( not ( = ?AUTO_2448 ?AUTO_2447 ) ) ( not ( = ?AUTO_2448 ?AUTO_2446 ) ) ( not ( = ?AUTO_2447 ?AUTO_2446 ) ) ( ON ?AUTO_2447 ?AUTO_2444 ) ( CLEAR ?AUTO_2447 ) ( HOLDING ?AUTO_2445 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2445 )
      ( MAKE-ON ?AUTO_2444 ?AUTO_2445 )
      ( MAKE-ON-VERIFY ?AUTO_2444 ?AUTO_2445 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2455 - BLOCK
      ?AUTO_2456 - BLOCK
    )
    :vars
    (
      ?AUTO_2457 - BLOCK
      ?AUTO_2458 - BLOCK
      ?AUTO_2459 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2455 ?AUTO_2456 ) ) ( not ( = ?AUTO_2455 ?AUTO_2457 ) ) ( not ( = ?AUTO_2456 ?AUTO_2457 ) ) ( CLEAR ?AUTO_2458 ) ( not ( = ?AUTO_2455 ?AUTO_2459 ) ) ( not ( = ?AUTO_2455 ?AUTO_2458 ) ) ( not ( = ?AUTO_2456 ?AUTO_2459 ) ) ( not ( = ?AUTO_2456 ?AUTO_2458 ) ) ( not ( = ?AUTO_2457 ?AUTO_2459 ) ) ( not ( = ?AUTO_2457 ?AUTO_2458 ) ) ( not ( = ?AUTO_2459 ?AUTO_2458 ) ) ( ON ?AUTO_2459 ?AUTO_2456 ) ( CLEAR ?AUTO_2459 ) ( HOLDING ?AUTO_2455 ) ( CLEAR ?AUTO_2457 ) )
    :subtasks
    ( ( !STACK ?AUTO_2455 ?AUTO_2457 )
      ( MAKE-ON ?AUTO_2455 ?AUTO_2456 )
      ( MAKE-ON-VERIFY ?AUTO_2455 ?AUTO_2456 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2460 - BLOCK
      ?AUTO_2461 - BLOCK
    )
    :vars
    (
      ?AUTO_2463 - BLOCK
      ?AUTO_2464 - BLOCK
      ?AUTO_2462 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2460 ?AUTO_2461 ) ) ( not ( = ?AUTO_2460 ?AUTO_2463 ) ) ( not ( = ?AUTO_2461 ?AUTO_2463 ) ) ( CLEAR ?AUTO_2464 ) ( not ( = ?AUTO_2460 ?AUTO_2462 ) ) ( not ( = ?AUTO_2460 ?AUTO_2464 ) ) ( not ( = ?AUTO_2461 ?AUTO_2462 ) ) ( not ( = ?AUTO_2461 ?AUTO_2464 ) ) ( not ( = ?AUTO_2463 ?AUTO_2462 ) ) ( not ( = ?AUTO_2463 ?AUTO_2464 ) ) ( not ( = ?AUTO_2462 ?AUTO_2464 ) ) ( ON ?AUTO_2462 ?AUTO_2461 ) ( CLEAR ?AUTO_2462 ) ( CLEAR ?AUTO_2463 ) ( ON-TABLE ?AUTO_2460 ) ( CLEAR ?AUTO_2460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2460 )
      ( MAKE-ON ?AUTO_2460 ?AUTO_2461 )
      ( MAKE-ON-VERIFY ?AUTO_2460 ?AUTO_2461 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2465 - BLOCK
      ?AUTO_2466 - BLOCK
    )
    :vars
    (
      ?AUTO_2467 - BLOCK
      ?AUTO_2468 - BLOCK
      ?AUTO_2469 - BLOCK
      ?AUTO_2470 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2465 ?AUTO_2466 ) ) ( not ( = ?AUTO_2465 ?AUTO_2467 ) ) ( not ( = ?AUTO_2466 ?AUTO_2467 ) ) ( CLEAR ?AUTO_2468 ) ( not ( = ?AUTO_2465 ?AUTO_2469 ) ) ( not ( = ?AUTO_2465 ?AUTO_2468 ) ) ( not ( = ?AUTO_2466 ?AUTO_2469 ) ) ( not ( = ?AUTO_2466 ?AUTO_2468 ) ) ( not ( = ?AUTO_2467 ?AUTO_2469 ) ) ( not ( = ?AUTO_2467 ?AUTO_2468 ) ) ( not ( = ?AUTO_2469 ?AUTO_2468 ) ) ( ON ?AUTO_2469 ?AUTO_2466 ) ( CLEAR ?AUTO_2469 ) ( ON-TABLE ?AUTO_2465 ) ( CLEAR ?AUTO_2465 ) ( HOLDING ?AUTO_2467 ) ( CLEAR ?AUTO_2470 ) ( not ( = ?AUTO_2465 ?AUTO_2470 ) ) ( not ( = ?AUTO_2466 ?AUTO_2470 ) ) ( not ( = ?AUTO_2467 ?AUTO_2470 ) ) ( not ( = ?AUTO_2468 ?AUTO_2470 ) ) ( not ( = ?AUTO_2469 ?AUTO_2470 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2467 ?AUTO_2470 )
      ( MAKE-ON ?AUTO_2465 ?AUTO_2466 )
      ( MAKE-ON-VERIFY ?AUTO_2465 ?AUTO_2466 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2471 - BLOCK
      ?AUTO_2472 - BLOCK
    )
    :vars
    (
      ?AUTO_2473 - BLOCK
      ?AUTO_2476 - BLOCK
      ?AUTO_2475 - BLOCK
      ?AUTO_2474 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2471 ?AUTO_2472 ) ) ( not ( = ?AUTO_2471 ?AUTO_2473 ) ) ( not ( = ?AUTO_2472 ?AUTO_2473 ) ) ( CLEAR ?AUTO_2476 ) ( not ( = ?AUTO_2471 ?AUTO_2475 ) ) ( not ( = ?AUTO_2471 ?AUTO_2476 ) ) ( not ( = ?AUTO_2472 ?AUTO_2475 ) ) ( not ( = ?AUTO_2472 ?AUTO_2476 ) ) ( not ( = ?AUTO_2473 ?AUTO_2475 ) ) ( not ( = ?AUTO_2473 ?AUTO_2476 ) ) ( not ( = ?AUTO_2475 ?AUTO_2476 ) ) ( ON ?AUTO_2475 ?AUTO_2472 ) ( CLEAR ?AUTO_2475 ) ( ON-TABLE ?AUTO_2471 ) ( CLEAR ?AUTO_2474 ) ( not ( = ?AUTO_2471 ?AUTO_2474 ) ) ( not ( = ?AUTO_2472 ?AUTO_2474 ) ) ( not ( = ?AUTO_2473 ?AUTO_2474 ) ) ( not ( = ?AUTO_2476 ?AUTO_2474 ) ) ( not ( = ?AUTO_2475 ?AUTO_2474 ) ) ( ON ?AUTO_2473 ?AUTO_2471 ) ( CLEAR ?AUTO_2473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2473 ?AUTO_2471 )
      ( MAKE-ON ?AUTO_2471 ?AUTO_2472 )
      ( MAKE-ON-VERIFY ?AUTO_2471 ?AUTO_2472 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2477 - BLOCK
      ?AUTO_2478 - BLOCK
    )
    :vars
    (
      ?AUTO_2479 - BLOCK
      ?AUTO_2482 - BLOCK
      ?AUTO_2481 - BLOCK
      ?AUTO_2480 - BLOCK
      ?AUTO_2483 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2477 ?AUTO_2478 ) ) ( not ( = ?AUTO_2477 ?AUTO_2479 ) ) ( not ( = ?AUTO_2478 ?AUTO_2479 ) ) ( not ( = ?AUTO_2477 ?AUTO_2482 ) ) ( not ( = ?AUTO_2477 ?AUTO_2481 ) ) ( not ( = ?AUTO_2478 ?AUTO_2482 ) ) ( not ( = ?AUTO_2478 ?AUTO_2481 ) ) ( not ( = ?AUTO_2479 ?AUTO_2482 ) ) ( not ( = ?AUTO_2479 ?AUTO_2481 ) ) ( not ( = ?AUTO_2482 ?AUTO_2481 ) ) ( ON ?AUTO_2482 ?AUTO_2478 ) ( CLEAR ?AUTO_2482 ) ( ON-TABLE ?AUTO_2477 ) ( CLEAR ?AUTO_2480 ) ( not ( = ?AUTO_2477 ?AUTO_2480 ) ) ( not ( = ?AUTO_2478 ?AUTO_2480 ) ) ( not ( = ?AUTO_2479 ?AUTO_2480 ) ) ( not ( = ?AUTO_2481 ?AUTO_2480 ) ) ( not ( = ?AUTO_2482 ?AUTO_2480 ) ) ( ON ?AUTO_2479 ?AUTO_2477 ) ( CLEAR ?AUTO_2479 ) ( HOLDING ?AUTO_2481 ) ( CLEAR ?AUTO_2483 ) ( not ( = ?AUTO_2477 ?AUTO_2483 ) ) ( not ( = ?AUTO_2478 ?AUTO_2483 ) ) ( not ( = ?AUTO_2479 ?AUTO_2483 ) ) ( not ( = ?AUTO_2482 ?AUTO_2483 ) ) ( not ( = ?AUTO_2481 ?AUTO_2483 ) ) ( not ( = ?AUTO_2480 ?AUTO_2483 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2481 ?AUTO_2483 )
      ( MAKE-ON ?AUTO_2477 ?AUTO_2478 )
      ( MAKE-ON-VERIFY ?AUTO_2477 ?AUTO_2478 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2488 - BLOCK
      ?AUTO_2489 - BLOCK
    )
    :vars
    (
      ?AUTO_2491 - BLOCK
      ?AUTO_2492 - BLOCK
      ?AUTO_2493 - BLOCK
      ?AUTO_2494 - BLOCK
      ?AUTO_2490 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2488 ?AUTO_2489 ) ) ( not ( = ?AUTO_2488 ?AUTO_2491 ) ) ( not ( = ?AUTO_2489 ?AUTO_2491 ) ) ( not ( = ?AUTO_2488 ?AUTO_2492 ) ) ( not ( = ?AUTO_2488 ?AUTO_2493 ) ) ( not ( = ?AUTO_2489 ?AUTO_2492 ) ) ( not ( = ?AUTO_2489 ?AUTO_2493 ) ) ( not ( = ?AUTO_2491 ?AUTO_2492 ) ) ( not ( = ?AUTO_2491 ?AUTO_2493 ) ) ( not ( = ?AUTO_2492 ?AUTO_2493 ) ) ( ON ?AUTO_2492 ?AUTO_2489 ) ( CLEAR ?AUTO_2492 ) ( ON-TABLE ?AUTO_2488 ) ( CLEAR ?AUTO_2494 ) ( not ( = ?AUTO_2488 ?AUTO_2494 ) ) ( not ( = ?AUTO_2489 ?AUTO_2494 ) ) ( not ( = ?AUTO_2491 ?AUTO_2494 ) ) ( not ( = ?AUTO_2493 ?AUTO_2494 ) ) ( not ( = ?AUTO_2492 ?AUTO_2494 ) ) ( ON ?AUTO_2491 ?AUTO_2488 ) ( CLEAR ?AUTO_2490 ) ( not ( = ?AUTO_2488 ?AUTO_2490 ) ) ( not ( = ?AUTO_2489 ?AUTO_2490 ) ) ( not ( = ?AUTO_2491 ?AUTO_2490 ) ) ( not ( = ?AUTO_2492 ?AUTO_2490 ) ) ( not ( = ?AUTO_2493 ?AUTO_2490 ) ) ( not ( = ?AUTO_2494 ?AUTO_2490 ) ) ( ON ?AUTO_2493 ?AUTO_2491 ) ( CLEAR ?AUTO_2493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2493 ?AUTO_2491 )
      ( MAKE-ON ?AUTO_2488 ?AUTO_2489 )
      ( MAKE-ON-VERIFY ?AUTO_2488 ?AUTO_2489 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2497 - BLOCK
      ?AUTO_2498 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2497 ) ( CLEAR ?AUTO_2498 ) ( not ( = ?AUTO_2497 ?AUTO_2498 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2497 ?AUTO_2498 )
      ( MAKE-ON-VERIFY ?AUTO_2497 ?AUTO_2498 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2499 - BLOCK
      ?AUTO_2500 - BLOCK
    )
    :vars
    (
      ?AUTO_2501 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2500 ) ( not ( = ?AUTO_2499 ?AUTO_2500 ) ) ( ON ?AUTO_2499 ?AUTO_2501 ) ( CLEAR ?AUTO_2499 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2499 ?AUTO_2501 ) ) ( not ( = ?AUTO_2500 ?AUTO_2501 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2499 ?AUTO_2501 )
      ( MAKE-ON ?AUTO_2499 ?AUTO_2500 )
      ( MAKE-ON-VERIFY ?AUTO_2499 ?AUTO_2500 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2502 - BLOCK
      ?AUTO_2503 - BLOCK
    )
    :vars
    (
      ?AUTO_2504 - BLOCK
      ?AUTO_2505 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2502 ?AUTO_2503 ) ) ( ON ?AUTO_2502 ?AUTO_2504 ) ( CLEAR ?AUTO_2502 ) ( not ( = ?AUTO_2502 ?AUTO_2504 ) ) ( not ( = ?AUTO_2503 ?AUTO_2504 ) ) ( HOLDING ?AUTO_2503 ) ( CLEAR ?AUTO_2505 ) ( not ( = ?AUTO_2502 ?AUTO_2505 ) ) ( not ( = ?AUTO_2503 ?AUTO_2505 ) ) ( not ( = ?AUTO_2504 ?AUTO_2505 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2503 ?AUTO_2505 )
      ( MAKE-ON ?AUTO_2502 ?AUTO_2503 )
      ( MAKE-ON-VERIFY ?AUTO_2502 ?AUTO_2503 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2578 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2578 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2578 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2578 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2579 - BLOCK
    )
    :vars
    (
      ?AUTO_2580 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2579 ?AUTO_2580 ) ( CLEAR ?AUTO_2579 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2579 ?AUTO_2580 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2579 ?AUTO_2580 )
      ( MAKE-ON-TABLE ?AUTO_2579 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2579 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2581 - BLOCK
    )
    :vars
    (
      ?AUTO_2582 - BLOCK
      ?AUTO_2583 - BLOCK
      ?AUTO_2584 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2581 ?AUTO_2582 ) ( CLEAR ?AUTO_2581 ) ( not ( = ?AUTO_2581 ?AUTO_2582 ) ) ( HOLDING ?AUTO_2583 ) ( CLEAR ?AUTO_2584 ) ( not ( = ?AUTO_2581 ?AUTO_2583 ) ) ( not ( = ?AUTO_2581 ?AUTO_2584 ) ) ( not ( = ?AUTO_2582 ?AUTO_2583 ) ) ( not ( = ?AUTO_2582 ?AUTO_2584 ) ) ( not ( = ?AUTO_2583 ?AUTO_2584 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2583 ?AUTO_2584 )
      ( MAKE-ON-TABLE ?AUTO_2581 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2581 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2587 - BLOCK
    )
    :vars
    (
      ?AUTO_2590 - BLOCK
      ?AUTO_2588 - BLOCK
      ?AUTO_2589 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2587 ?AUTO_2590 ) ( not ( = ?AUTO_2587 ?AUTO_2590 ) ) ( CLEAR ?AUTO_2588 ) ( not ( = ?AUTO_2587 ?AUTO_2589 ) ) ( not ( = ?AUTO_2587 ?AUTO_2588 ) ) ( not ( = ?AUTO_2590 ?AUTO_2589 ) ) ( not ( = ?AUTO_2590 ?AUTO_2588 ) ) ( not ( = ?AUTO_2589 ?AUTO_2588 ) ) ( ON ?AUTO_2589 ?AUTO_2587 ) ( CLEAR ?AUTO_2589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2589 ?AUTO_2587 )
      ( MAKE-ON-TABLE ?AUTO_2587 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2587 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2591 - BLOCK
    )
    :vars
    (
      ?AUTO_2594 - BLOCK
      ?AUTO_2592 - BLOCK
      ?AUTO_2593 - BLOCK
      ?AUTO_2595 - BLOCK
      ?AUTO_2596 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2591 ?AUTO_2594 ) ( not ( = ?AUTO_2591 ?AUTO_2594 ) ) ( CLEAR ?AUTO_2592 ) ( not ( = ?AUTO_2591 ?AUTO_2593 ) ) ( not ( = ?AUTO_2591 ?AUTO_2592 ) ) ( not ( = ?AUTO_2594 ?AUTO_2593 ) ) ( not ( = ?AUTO_2594 ?AUTO_2592 ) ) ( not ( = ?AUTO_2593 ?AUTO_2592 ) ) ( ON ?AUTO_2593 ?AUTO_2591 ) ( CLEAR ?AUTO_2593 ) ( HOLDING ?AUTO_2595 ) ( CLEAR ?AUTO_2596 ) ( not ( = ?AUTO_2591 ?AUTO_2595 ) ) ( not ( = ?AUTO_2591 ?AUTO_2596 ) ) ( not ( = ?AUTO_2594 ?AUTO_2595 ) ) ( not ( = ?AUTO_2594 ?AUTO_2596 ) ) ( not ( = ?AUTO_2592 ?AUTO_2595 ) ) ( not ( = ?AUTO_2592 ?AUTO_2596 ) ) ( not ( = ?AUTO_2593 ?AUTO_2595 ) ) ( not ( = ?AUTO_2593 ?AUTO_2596 ) ) ( not ( = ?AUTO_2595 ?AUTO_2596 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2595 ?AUTO_2596 )
      ( MAKE-ON-TABLE ?AUTO_2591 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2591 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2597 - BLOCK
    )
    :vars
    (
      ?AUTO_2602 - BLOCK
      ?AUTO_2599 - BLOCK
      ?AUTO_2598 - BLOCK
      ?AUTO_2601 - BLOCK
      ?AUTO_2600 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2597 ?AUTO_2602 ) ( not ( = ?AUTO_2597 ?AUTO_2602 ) ) ( CLEAR ?AUTO_2599 ) ( not ( = ?AUTO_2597 ?AUTO_2598 ) ) ( not ( = ?AUTO_2597 ?AUTO_2599 ) ) ( not ( = ?AUTO_2602 ?AUTO_2598 ) ) ( not ( = ?AUTO_2602 ?AUTO_2599 ) ) ( not ( = ?AUTO_2598 ?AUTO_2599 ) ) ( ON ?AUTO_2598 ?AUTO_2597 ) ( CLEAR ?AUTO_2601 ) ( not ( = ?AUTO_2597 ?AUTO_2600 ) ) ( not ( = ?AUTO_2597 ?AUTO_2601 ) ) ( not ( = ?AUTO_2602 ?AUTO_2600 ) ) ( not ( = ?AUTO_2602 ?AUTO_2601 ) ) ( not ( = ?AUTO_2599 ?AUTO_2600 ) ) ( not ( = ?AUTO_2599 ?AUTO_2601 ) ) ( not ( = ?AUTO_2598 ?AUTO_2600 ) ) ( not ( = ?AUTO_2598 ?AUTO_2601 ) ) ( not ( = ?AUTO_2600 ?AUTO_2601 ) ) ( ON ?AUTO_2600 ?AUTO_2598 ) ( CLEAR ?AUTO_2600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2600 ?AUTO_2598 )
      ( MAKE-ON-TABLE ?AUTO_2597 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2597 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2603 - BLOCK
    )
    :vars
    (
      ?AUTO_2608 - BLOCK
      ?AUTO_2605 - BLOCK
      ?AUTO_2604 - BLOCK
      ?AUTO_2607 - BLOCK
      ?AUTO_2606 - BLOCK
      ?AUTO_2609 - BLOCK
      ?AUTO_2610 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2603 ?AUTO_2608 ) ( not ( = ?AUTO_2603 ?AUTO_2608 ) ) ( CLEAR ?AUTO_2605 ) ( not ( = ?AUTO_2603 ?AUTO_2604 ) ) ( not ( = ?AUTO_2603 ?AUTO_2605 ) ) ( not ( = ?AUTO_2608 ?AUTO_2604 ) ) ( not ( = ?AUTO_2608 ?AUTO_2605 ) ) ( not ( = ?AUTO_2604 ?AUTO_2605 ) ) ( ON ?AUTO_2604 ?AUTO_2603 ) ( CLEAR ?AUTO_2607 ) ( not ( = ?AUTO_2603 ?AUTO_2606 ) ) ( not ( = ?AUTO_2603 ?AUTO_2607 ) ) ( not ( = ?AUTO_2608 ?AUTO_2606 ) ) ( not ( = ?AUTO_2608 ?AUTO_2607 ) ) ( not ( = ?AUTO_2605 ?AUTO_2606 ) ) ( not ( = ?AUTO_2605 ?AUTO_2607 ) ) ( not ( = ?AUTO_2604 ?AUTO_2606 ) ) ( not ( = ?AUTO_2604 ?AUTO_2607 ) ) ( not ( = ?AUTO_2606 ?AUTO_2607 ) ) ( ON ?AUTO_2606 ?AUTO_2604 ) ( CLEAR ?AUTO_2606 ) ( HOLDING ?AUTO_2609 ) ( CLEAR ?AUTO_2610 ) ( not ( = ?AUTO_2603 ?AUTO_2609 ) ) ( not ( = ?AUTO_2603 ?AUTO_2610 ) ) ( not ( = ?AUTO_2608 ?AUTO_2609 ) ) ( not ( = ?AUTO_2608 ?AUTO_2610 ) ) ( not ( = ?AUTO_2605 ?AUTO_2609 ) ) ( not ( = ?AUTO_2605 ?AUTO_2610 ) ) ( not ( = ?AUTO_2604 ?AUTO_2609 ) ) ( not ( = ?AUTO_2604 ?AUTO_2610 ) ) ( not ( = ?AUTO_2607 ?AUTO_2609 ) ) ( not ( = ?AUTO_2607 ?AUTO_2610 ) ) ( not ( = ?AUTO_2606 ?AUTO_2609 ) ) ( not ( = ?AUTO_2606 ?AUTO_2610 ) ) ( not ( = ?AUTO_2609 ?AUTO_2610 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2609 ?AUTO_2610 )
      ( MAKE-ON-TABLE ?AUTO_2603 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2603 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2616 - BLOCK
    )
    :vars
    (
      ?AUTO_2617 - BLOCK
      ?AUTO_2620 - BLOCK
      ?AUTO_2618 - BLOCK
      ?AUTO_2619 - BLOCK
      ?AUTO_2621 - BLOCK
      ?AUTO_2622 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2616 ?AUTO_2617 ) ( not ( = ?AUTO_2616 ?AUTO_2617 ) ) ( CLEAR ?AUTO_2620 ) ( not ( = ?AUTO_2616 ?AUTO_2618 ) ) ( not ( = ?AUTO_2616 ?AUTO_2620 ) ) ( not ( = ?AUTO_2617 ?AUTO_2618 ) ) ( not ( = ?AUTO_2617 ?AUTO_2620 ) ) ( not ( = ?AUTO_2618 ?AUTO_2620 ) ) ( ON ?AUTO_2618 ?AUTO_2616 ) ( CLEAR ?AUTO_2619 ) ( not ( = ?AUTO_2616 ?AUTO_2621 ) ) ( not ( = ?AUTO_2616 ?AUTO_2619 ) ) ( not ( = ?AUTO_2617 ?AUTO_2621 ) ) ( not ( = ?AUTO_2617 ?AUTO_2619 ) ) ( not ( = ?AUTO_2620 ?AUTO_2621 ) ) ( not ( = ?AUTO_2620 ?AUTO_2619 ) ) ( not ( = ?AUTO_2618 ?AUTO_2621 ) ) ( not ( = ?AUTO_2618 ?AUTO_2619 ) ) ( not ( = ?AUTO_2621 ?AUTO_2619 ) ) ( ON ?AUTO_2621 ?AUTO_2618 ) ( CLEAR ?AUTO_2621 ) ( HOLDING ?AUTO_2622 ) ( not ( = ?AUTO_2616 ?AUTO_2622 ) ) ( not ( = ?AUTO_2617 ?AUTO_2622 ) ) ( not ( = ?AUTO_2620 ?AUTO_2622 ) ) ( not ( = ?AUTO_2618 ?AUTO_2622 ) ) ( not ( = ?AUTO_2619 ?AUTO_2622 ) ) ( not ( = ?AUTO_2621 ?AUTO_2622 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2622 )
      ( MAKE-ON-TABLE ?AUTO_2616 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2616 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2636 - BLOCK
      ?AUTO_2637 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2636 ) ( CLEAR ?AUTO_2637 ) ( not ( = ?AUTO_2636 ?AUTO_2637 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2636 ?AUTO_2637 )
      ( MAKE-ON-VERIFY ?AUTO_2636 ?AUTO_2637 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2638 - BLOCK
      ?AUTO_2639 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2639 ) ( not ( = ?AUTO_2638 ?AUTO_2639 ) ) ( ON-TABLE ?AUTO_2638 ) ( CLEAR ?AUTO_2638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2638 )
      ( MAKE-ON ?AUTO_2638 ?AUTO_2639 )
      ( MAKE-ON-VERIFY ?AUTO_2638 ?AUTO_2639 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2640 - BLOCK
      ?AUTO_2641 - BLOCK
    )
    :vars
    (
      ?AUTO_2642 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2641 ) ( not ( = ?AUTO_2640 ?AUTO_2641 ) ) ( ON-TABLE ?AUTO_2640 ) ( CLEAR ?AUTO_2640 ) ( HOLDING ?AUTO_2642 ) ( not ( = ?AUTO_2640 ?AUTO_2642 ) ) ( not ( = ?AUTO_2641 ?AUTO_2642 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2642 )
      ( MAKE-ON ?AUTO_2640 ?AUTO_2641 )
      ( MAKE-ON-VERIFY ?AUTO_2640 ?AUTO_2641 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2643 - BLOCK
      ?AUTO_2644 - BLOCK
    )
    :vars
    (
      ?AUTO_2645 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2644 ) ( not ( = ?AUTO_2643 ?AUTO_2644 ) ) ( ON-TABLE ?AUTO_2643 ) ( not ( = ?AUTO_2643 ?AUTO_2645 ) ) ( not ( = ?AUTO_2644 ?AUTO_2645 ) ) ( ON ?AUTO_2645 ?AUTO_2643 ) ( CLEAR ?AUTO_2645 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2645 ?AUTO_2643 )
      ( MAKE-ON ?AUTO_2643 ?AUTO_2644 )
      ( MAKE-ON-VERIFY ?AUTO_2643 ?AUTO_2644 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2646 - BLOCK
      ?AUTO_2647 - BLOCK
    )
    :vars
    (
      ?AUTO_2648 - BLOCK
      ?AUTO_2649 - BLOCK
      ?AUTO_2650 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2647 ) ( not ( = ?AUTO_2646 ?AUTO_2647 ) ) ( ON-TABLE ?AUTO_2646 ) ( not ( = ?AUTO_2646 ?AUTO_2648 ) ) ( not ( = ?AUTO_2647 ?AUTO_2648 ) ) ( ON ?AUTO_2648 ?AUTO_2646 ) ( CLEAR ?AUTO_2648 ) ( HOLDING ?AUTO_2649 ) ( CLEAR ?AUTO_2650 ) ( not ( = ?AUTO_2646 ?AUTO_2649 ) ) ( not ( = ?AUTO_2646 ?AUTO_2650 ) ) ( not ( = ?AUTO_2647 ?AUTO_2649 ) ) ( not ( = ?AUTO_2647 ?AUTO_2650 ) ) ( not ( = ?AUTO_2648 ?AUTO_2649 ) ) ( not ( = ?AUTO_2648 ?AUTO_2650 ) ) ( not ( = ?AUTO_2649 ?AUTO_2650 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2649 ?AUTO_2650 )
      ( MAKE-ON ?AUTO_2646 ?AUTO_2647 )
      ( MAKE-ON-VERIFY ?AUTO_2646 ?AUTO_2647 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2651 - BLOCK
      ?AUTO_2652 - BLOCK
    )
    :vars
    (
      ?AUTO_2653 - BLOCK
      ?AUTO_2655 - BLOCK
      ?AUTO_2654 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2651 ?AUTO_2652 ) ) ( ON-TABLE ?AUTO_2651 ) ( not ( = ?AUTO_2651 ?AUTO_2653 ) ) ( not ( = ?AUTO_2652 ?AUTO_2653 ) ) ( ON ?AUTO_2653 ?AUTO_2651 ) ( CLEAR ?AUTO_2653 ) ( CLEAR ?AUTO_2655 ) ( not ( = ?AUTO_2651 ?AUTO_2654 ) ) ( not ( = ?AUTO_2651 ?AUTO_2655 ) ) ( not ( = ?AUTO_2652 ?AUTO_2654 ) ) ( not ( = ?AUTO_2652 ?AUTO_2655 ) ) ( not ( = ?AUTO_2653 ?AUTO_2654 ) ) ( not ( = ?AUTO_2653 ?AUTO_2655 ) ) ( not ( = ?AUTO_2654 ?AUTO_2655 ) ) ( ON ?AUTO_2654 ?AUTO_2652 ) ( CLEAR ?AUTO_2654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2654 ?AUTO_2652 )
      ( MAKE-ON ?AUTO_2651 ?AUTO_2652 )
      ( MAKE-ON-VERIFY ?AUTO_2651 ?AUTO_2652 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2656 - BLOCK
      ?AUTO_2657 - BLOCK
    )
    :vars
    (
      ?AUTO_2659 - BLOCK
      ?AUTO_2660 - BLOCK
      ?AUTO_2658 - BLOCK
      ?AUTO_2661 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2656 ?AUTO_2657 ) ) ( ON-TABLE ?AUTO_2656 ) ( not ( = ?AUTO_2656 ?AUTO_2659 ) ) ( not ( = ?AUTO_2657 ?AUTO_2659 ) ) ( ON ?AUTO_2659 ?AUTO_2656 ) ( CLEAR ?AUTO_2659 ) ( not ( = ?AUTO_2656 ?AUTO_2660 ) ) ( not ( = ?AUTO_2656 ?AUTO_2658 ) ) ( not ( = ?AUTO_2657 ?AUTO_2660 ) ) ( not ( = ?AUTO_2657 ?AUTO_2658 ) ) ( not ( = ?AUTO_2659 ?AUTO_2660 ) ) ( not ( = ?AUTO_2659 ?AUTO_2658 ) ) ( not ( = ?AUTO_2660 ?AUTO_2658 ) ) ( ON ?AUTO_2660 ?AUTO_2657 ) ( CLEAR ?AUTO_2660 ) ( HOLDING ?AUTO_2658 ) ( CLEAR ?AUTO_2661 ) ( not ( = ?AUTO_2656 ?AUTO_2661 ) ) ( not ( = ?AUTO_2657 ?AUTO_2661 ) ) ( not ( = ?AUTO_2659 ?AUTO_2661 ) ) ( not ( = ?AUTO_2660 ?AUTO_2661 ) ) ( not ( = ?AUTO_2658 ?AUTO_2661 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2658 ?AUTO_2661 )
      ( MAKE-ON ?AUTO_2656 ?AUTO_2657 )
      ( MAKE-ON-VERIFY ?AUTO_2656 ?AUTO_2657 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2662 - BLOCK
      ?AUTO_2663 - BLOCK
    )
    :vars
    (
      ?AUTO_2664 - BLOCK
      ?AUTO_2667 - BLOCK
      ?AUTO_2665 - BLOCK
      ?AUTO_2666 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2662 ?AUTO_2663 ) ) ( ON-TABLE ?AUTO_2662 ) ( not ( = ?AUTO_2662 ?AUTO_2664 ) ) ( not ( = ?AUTO_2663 ?AUTO_2664 ) ) ( ON ?AUTO_2664 ?AUTO_2662 ) ( not ( = ?AUTO_2662 ?AUTO_2667 ) ) ( not ( = ?AUTO_2662 ?AUTO_2665 ) ) ( not ( = ?AUTO_2663 ?AUTO_2667 ) ) ( not ( = ?AUTO_2663 ?AUTO_2665 ) ) ( not ( = ?AUTO_2664 ?AUTO_2667 ) ) ( not ( = ?AUTO_2664 ?AUTO_2665 ) ) ( not ( = ?AUTO_2667 ?AUTO_2665 ) ) ( ON ?AUTO_2667 ?AUTO_2663 ) ( CLEAR ?AUTO_2667 ) ( CLEAR ?AUTO_2666 ) ( not ( = ?AUTO_2662 ?AUTO_2666 ) ) ( not ( = ?AUTO_2663 ?AUTO_2666 ) ) ( not ( = ?AUTO_2664 ?AUTO_2666 ) ) ( not ( = ?AUTO_2667 ?AUTO_2666 ) ) ( not ( = ?AUTO_2665 ?AUTO_2666 ) ) ( ON ?AUTO_2665 ?AUTO_2664 ) ( CLEAR ?AUTO_2665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2665 ?AUTO_2664 )
      ( MAKE-ON ?AUTO_2662 ?AUTO_2663 )
      ( MAKE-ON-VERIFY ?AUTO_2662 ?AUTO_2663 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2668 - BLOCK
      ?AUTO_2669 - BLOCK
    )
    :vars
    (
      ?AUTO_2670 - BLOCK
      ?AUTO_2672 - BLOCK
      ?AUTO_2673 - BLOCK
      ?AUTO_2671 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2668 ?AUTO_2669 ) ) ( ON-TABLE ?AUTO_2668 ) ( not ( = ?AUTO_2668 ?AUTO_2670 ) ) ( not ( = ?AUTO_2669 ?AUTO_2670 ) ) ( ON ?AUTO_2670 ?AUTO_2668 ) ( not ( = ?AUTO_2668 ?AUTO_2672 ) ) ( not ( = ?AUTO_2668 ?AUTO_2673 ) ) ( not ( = ?AUTO_2669 ?AUTO_2672 ) ) ( not ( = ?AUTO_2669 ?AUTO_2673 ) ) ( not ( = ?AUTO_2670 ?AUTO_2672 ) ) ( not ( = ?AUTO_2670 ?AUTO_2673 ) ) ( not ( = ?AUTO_2672 ?AUTO_2673 ) ) ( CLEAR ?AUTO_2671 ) ( not ( = ?AUTO_2668 ?AUTO_2671 ) ) ( not ( = ?AUTO_2669 ?AUTO_2671 ) ) ( not ( = ?AUTO_2670 ?AUTO_2671 ) ) ( not ( = ?AUTO_2672 ?AUTO_2671 ) ) ( not ( = ?AUTO_2673 ?AUTO_2671 ) ) ( ON ?AUTO_2673 ?AUTO_2670 ) ( CLEAR ?AUTO_2673 ) ( HOLDING ?AUTO_2672 ) ( CLEAR ?AUTO_2669 ) )
    :subtasks
    ( ( !STACK ?AUTO_2672 ?AUTO_2669 )
      ( MAKE-ON ?AUTO_2668 ?AUTO_2669 )
      ( MAKE-ON-VERIFY ?AUTO_2668 ?AUTO_2669 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2674 - BLOCK
      ?AUTO_2675 - BLOCK
    )
    :vars
    (
      ?AUTO_2677 - BLOCK
      ?AUTO_2679 - BLOCK
      ?AUTO_2678 - BLOCK
      ?AUTO_2676 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2674 ?AUTO_2675 ) ) ( ON-TABLE ?AUTO_2674 ) ( not ( = ?AUTO_2674 ?AUTO_2677 ) ) ( not ( = ?AUTO_2675 ?AUTO_2677 ) ) ( ON ?AUTO_2677 ?AUTO_2674 ) ( not ( = ?AUTO_2674 ?AUTO_2679 ) ) ( not ( = ?AUTO_2674 ?AUTO_2678 ) ) ( not ( = ?AUTO_2675 ?AUTO_2679 ) ) ( not ( = ?AUTO_2675 ?AUTO_2678 ) ) ( not ( = ?AUTO_2677 ?AUTO_2679 ) ) ( not ( = ?AUTO_2677 ?AUTO_2678 ) ) ( not ( = ?AUTO_2679 ?AUTO_2678 ) ) ( CLEAR ?AUTO_2676 ) ( not ( = ?AUTO_2674 ?AUTO_2676 ) ) ( not ( = ?AUTO_2675 ?AUTO_2676 ) ) ( not ( = ?AUTO_2677 ?AUTO_2676 ) ) ( not ( = ?AUTO_2679 ?AUTO_2676 ) ) ( not ( = ?AUTO_2678 ?AUTO_2676 ) ) ( ON ?AUTO_2678 ?AUTO_2677 ) ( CLEAR ?AUTO_2675 ) ( ON ?AUTO_2679 ?AUTO_2678 ) ( CLEAR ?AUTO_2679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2679 ?AUTO_2678 )
      ( MAKE-ON ?AUTO_2674 ?AUTO_2675 )
      ( MAKE-ON-VERIFY ?AUTO_2674 ?AUTO_2675 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2680 - BLOCK
      ?AUTO_2681 - BLOCK
    )
    :vars
    (
      ?AUTO_2682 - BLOCK
      ?AUTO_2684 - BLOCK
      ?AUTO_2685 - BLOCK
      ?AUTO_2683 - BLOCK
      ?AUTO_2686 - BLOCK
      ?AUTO_2687 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2680 ?AUTO_2681 ) ) ( ON-TABLE ?AUTO_2680 ) ( not ( = ?AUTO_2680 ?AUTO_2682 ) ) ( not ( = ?AUTO_2681 ?AUTO_2682 ) ) ( ON ?AUTO_2682 ?AUTO_2680 ) ( not ( = ?AUTO_2680 ?AUTO_2684 ) ) ( not ( = ?AUTO_2680 ?AUTO_2685 ) ) ( not ( = ?AUTO_2681 ?AUTO_2684 ) ) ( not ( = ?AUTO_2681 ?AUTO_2685 ) ) ( not ( = ?AUTO_2682 ?AUTO_2684 ) ) ( not ( = ?AUTO_2682 ?AUTO_2685 ) ) ( not ( = ?AUTO_2684 ?AUTO_2685 ) ) ( CLEAR ?AUTO_2683 ) ( not ( = ?AUTO_2680 ?AUTO_2683 ) ) ( not ( = ?AUTO_2681 ?AUTO_2683 ) ) ( not ( = ?AUTO_2682 ?AUTO_2683 ) ) ( not ( = ?AUTO_2684 ?AUTO_2683 ) ) ( not ( = ?AUTO_2685 ?AUTO_2683 ) ) ( ON ?AUTO_2685 ?AUTO_2682 ) ( CLEAR ?AUTO_2681 ) ( ON ?AUTO_2684 ?AUTO_2685 ) ( CLEAR ?AUTO_2684 ) ( HOLDING ?AUTO_2686 ) ( CLEAR ?AUTO_2687 ) ( not ( = ?AUTO_2680 ?AUTO_2686 ) ) ( not ( = ?AUTO_2680 ?AUTO_2687 ) ) ( not ( = ?AUTO_2681 ?AUTO_2686 ) ) ( not ( = ?AUTO_2681 ?AUTO_2687 ) ) ( not ( = ?AUTO_2682 ?AUTO_2686 ) ) ( not ( = ?AUTO_2682 ?AUTO_2687 ) ) ( not ( = ?AUTO_2684 ?AUTO_2686 ) ) ( not ( = ?AUTO_2684 ?AUTO_2687 ) ) ( not ( = ?AUTO_2685 ?AUTO_2686 ) ) ( not ( = ?AUTO_2685 ?AUTO_2687 ) ) ( not ( = ?AUTO_2683 ?AUTO_2686 ) ) ( not ( = ?AUTO_2683 ?AUTO_2687 ) ) ( not ( = ?AUTO_2686 ?AUTO_2687 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2686 ?AUTO_2687 )
      ( MAKE-ON ?AUTO_2680 ?AUTO_2681 )
      ( MAKE-ON-VERIFY ?AUTO_2680 ?AUTO_2681 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2692 - BLOCK
      ?AUTO_2693 - BLOCK
    )
    :vars
    (
      ?AUTO_2698 - BLOCK
      ?AUTO_2697 - BLOCK
      ?AUTO_2696 - BLOCK
      ?AUTO_2694 - BLOCK
      ?AUTO_2699 - BLOCK
      ?AUTO_2695 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2692 ?AUTO_2693 ) ) ( ON-TABLE ?AUTO_2692 ) ( not ( = ?AUTO_2692 ?AUTO_2698 ) ) ( not ( = ?AUTO_2693 ?AUTO_2698 ) ) ( ON ?AUTO_2698 ?AUTO_2692 ) ( not ( = ?AUTO_2692 ?AUTO_2697 ) ) ( not ( = ?AUTO_2692 ?AUTO_2696 ) ) ( not ( = ?AUTO_2693 ?AUTO_2697 ) ) ( not ( = ?AUTO_2693 ?AUTO_2696 ) ) ( not ( = ?AUTO_2698 ?AUTO_2697 ) ) ( not ( = ?AUTO_2698 ?AUTO_2696 ) ) ( not ( = ?AUTO_2697 ?AUTO_2696 ) ) ( CLEAR ?AUTO_2694 ) ( not ( = ?AUTO_2692 ?AUTO_2694 ) ) ( not ( = ?AUTO_2693 ?AUTO_2694 ) ) ( not ( = ?AUTO_2698 ?AUTO_2694 ) ) ( not ( = ?AUTO_2697 ?AUTO_2694 ) ) ( not ( = ?AUTO_2696 ?AUTO_2694 ) ) ( ON ?AUTO_2696 ?AUTO_2698 ) ( ON ?AUTO_2697 ?AUTO_2696 ) ( CLEAR ?AUTO_2697 ) ( CLEAR ?AUTO_2699 ) ( not ( = ?AUTO_2692 ?AUTO_2695 ) ) ( not ( = ?AUTO_2692 ?AUTO_2699 ) ) ( not ( = ?AUTO_2693 ?AUTO_2695 ) ) ( not ( = ?AUTO_2693 ?AUTO_2699 ) ) ( not ( = ?AUTO_2698 ?AUTO_2695 ) ) ( not ( = ?AUTO_2698 ?AUTO_2699 ) ) ( not ( = ?AUTO_2697 ?AUTO_2695 ) ) ( not ( = ?AUTO_2697 ?AUTO_2699 ) ) ( not ( = ?AUTO_2696 ?AUTO_2695 ) ) ( not ( = ?AUTO_2696 ?AUTO_2699 ) ) ( not ( = ?AUTO_2694 ?AUTO_2695 ) ) ( not ( = ?AUTO_2694 ?AUTO_2699 ) ) ( not ( = ?AUTO_2695 ?AUTO_2699 ) ) ( ON ?AUTO_2695 ?AUTO_2693 ) ( CLEAR ?AUTO_2695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2695 ?AUTO_2693 )
      ( MAKE-ON ?AUTO_2692 ?AUTO_2693 )
      ( MAKE-ON-VERIFY ?AUTO_2692 ?AUTO_2693 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2700 - BLOCK
      ?AUTO_2701 - BLOCK
    )
    :vars
    (
      ?AUTO_2703 - BLOCK
      ?AUTO_2702 - BLOCK
      ?AUTO_2707 - BLOCK
      ?AUTO_2705 - BLOCK
      ?AUTO_2706 - BLOCK
      ?AUTO_2704 - BLOCK
      ?AUTO_2708 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2700 ?AUTO_2701 ) ) ( ON-TABLE ?AUTO_2700 ) ( not ( = ?AUTO_2700 ?AUTO_2703 ) ) ( not ( = ?AUTO_2701 ?AUTO_2703 ) ) ( ON ?AUTO_2703 ?AUTO_2700 ) ( not ( = ?AUTO_2700 ?AUTO_2702 ) ) ( not ( = ?AUTO_2700 ?AUTO_2707 ) ) ( not ( = ?AUTO_2701 ?AUTO_2702 ) ) ( not ( = ?AUTO_2701 ?AUTO_2707 ) ) ( not ( = ?AUTO_2703 ?AUTO_2702 ) ) ( not ( = ?AUTO_2703 ?AUTO_2707 ) ) ( not ( = ?AUTO_2702 ?AUTO_2707 ) ) ( CLEAR ?AUTO_2705 ) ( not ( = ?AUTO_2700 ?AUTO_2705 ) ) ( not ( = ?AUTO_2701 ?AUTO_2705 ) ) ( not ( = ?AUTO_2703 ?AUTO_2705 ) ) ( not ( = ?AUTO_2702 ?AUTO_2705 ) ) ( not ( = ?AUTO_2707 ?AUTO_2705 ) ) ( ON ?AUTO_2707 ?AUTO_2703 ) ( ON ?AUTO_2702 ?AUTO_2707 ) ( CLEAR ?AUTO_2702 ) ( CLEAR ?AUTO_2706 ) ( not ( = ?AUTO_2700 ?AUTO_2704 ) ) ( not ( = ?AUTO_2700 ?AUTO_2706 ) ) ( not ( = ?AUTO_2701 ?AUTO_2704 ) ) ( not ( = ?AUTO_2701 ?AUTO_2706 ) ) ( not ( = ?AUTO_2703 ?AUTO_2704 ) ) ( not ( = ?AUTO_2703 ?AUTO_2706 ) ) ( not ( = ?AUTO_2702 ?AUTO_2704 ) ) ( not ( = ?AUTO_2702 ?AUTO_2706 ) ) ( not ( = ?AUTO_2707 ?AUTO_2704 ) ) ( not ( = ?AUTO_2707 ?AUTO_2706 ) ) ( not ( = ?AUTO_2705 ?AUTO_2704 ) ) ( not ( = ?AUTO_2705 ?AUTO_2706 ) ) ( not ( = ?AUTO_2704 ?AUTO_2706 ) ) ( ON ?AUTO_2704 ?AUTO_2701 ) ( CLEAR ?AUTO_2704 ) ( HOLDING ?AUTO_2708 ) ( not ( = ?AUTO_2700 ?AUTO_2708 ) ) ( not ( = ?AUTO_2701 ?AUTO_2708 ) ) ( not ( = ?AUTO_2703 ?AUTO_2708 ) ) ( not ( = ?AUTO_2702 ?AUTO_2708 ) ) ( not ( = ?AUTO_2707 ?AUTO_2708 ) ) ( not ( = ?AUTO_2705 ?AUTO_2708 ) ) ( not ( = ?AUTO_2706 ?AUTO_2708 ) ) ( not ( = ?AUTO_2704 ?AUTO_2708 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2708 )
      ( MAKE-ON ?AUTO_2700 ?AUTO_2701 )
      ( MAKE-ON-VERIFY ?AUTO_2700 ?AUTO_2701 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2709 - BLOCK
      ?AUTO_2710 - BLOCK
    )
    :vars
    (
      ?AUTO_2713 - BLOCK
      ?AUTO_2712 - BLOCK
      ?AUTO_2711 - BLOCK
      ?AUTO_2715 - BLOCK
      ?AUTO_2717 - BLOCK
      ?AUTO_2716 - BLOCK
      ?AUTO_2714 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2709 ?AUTO_2710 ) ) ( ON-TABLE ?AUTO_2709 ) ( not ( = ?AUTO_2709 ?AUTO_2713 ) ) ( not ( = ?AUTO_2710 ?AUTO_2713 ) ) ( ON ?AUTO_2713 ?AUTO_2709 ) ( not ( = ?AUTO_2709 ?AUTO_2712 ) ) ( not ( = ?AUTO_2709 ?AUTO_2711 ) ) ( not ( = ?AUTO_2710 ?AUTO_2712 ) ) ( not ( = ?AUTO_2710 ?AUTO_2711 ) ) ( not ( = ?AUTO_2713 ?AUTO_2712 ) ) ( not ( = ?AUTO_2713 ?AUTO_2711 ) ) ( not ( = ?AUTO_2712 ?AUTO_2711 ) ) ( CLEAR ?AUTO_2715 ) ( not ( = ?AUTO_2709 ?AUTO_2715 ) ) ( not ( = ?AUTO_2710 ?AUTO_2715 ) ) ( not ( = ?AUTO_2713 ?AUTO_2715 ) ) ( not ( = ?AUTO_2712 ?AUTO_2715 ) ) ( not ( = ?AUTO_2711 ?AUTO_2715 ) ) ( ON ?AUTO_2711 ?AUTO_2713 ) ( ON ?AUTO_2712 ?AUTO_2711 ) ( CLEAR ?AUTO_2712 ) ( CLEAR ?AUTO_2717 ) ( not ( = ?AUTO_2709 ?AUTO_2716 ) ) ( not ( = ?AUTO_2709 ?AUTO_2717 ) ) ( not ( = ?AUTO_2710 ?AUTO_2716 ) ) ( not ( = ?AUTO_2710 ?AUTO_2717 ) ) ( not ( = ?AUTO_2713 ?AUTO_2716 ) ) ( not ( = ?AUTO_2713 ?AUTO_2717 ) ) ( not ( = ?AUTO_2712 ?AUTO_2716 ) ) ( not ( = ?AUTO_2712 ?AUTO_2717 ) ) ( not ( = ?AUTO_2711 ?AUTO_2716 ) ) ( not ( = ?AUTO_2711 ?AUTO_2717 ) ) ( not ( = ?AUTO_2715 ?AUTO_2716 ) ) ( not ( = ?AUTO_2715 ?AUTO_2717 ) ) ( not ( = ?AUTO_2716 ?AUTO_2717 ) ) ( ON ?AUTO_2716 ?AUTO_2710 ) ( not ( = ?AUTO_2709 ?AUTO_2714 ) ) ( not ( = ?AUTO_2710 ?AUTO_2714 ) ) ( not ( = ?AUTO_2713 ?AUTO_2714 ) ) ( not ( = ?AUTO_2712 ?AUTO_2714 ) ) ( not ( = ?AUTO_2711 ?AUTO_2714 ) ) ( not ( = ?AUTO_2715 ?AUTO_2714 ) ) ( not ( = ?AUTO_2717 ?AUTO_2714 ) ) ( not ( = ?AUTO_2716 ?AUTO_2714 ) ) ( ON ?AUTO_2714 ?AUTO_2716 ) ( CLEAR ?AUTO_2714 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2714 ?AUTO_2716 )
      ( MAKE-ON ?AUTO_2709 ?AUTO_2710 )
      ( MAKE-ON-VERIFY ?AUTO_2709 ?AUTO_2710 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2718 - BLOCK
      ?AUTO_2719 - BLOCK
    )
    :vars
    (
      ?AUTO_2722 - BLOCK
      ?AUTO_2720 - BLOCK
      ?AUTO_2723 - BLOCK
      ?AUTO_2726 - BLOCK
      ?AUTO_2724 - BLOCK
      ?AUTO_2725 - BLOCK
      ?AUTO_2721 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2718 ?AUTO_2719 ) ) ( ON-TABLE ?AUTO_2718 ) ( not ( = ?AUTO_2718 ?AUTO_2722 ) ) ( not ( = ?AUTO_2719 ?AUTO_2722 ) ) ( ON ?AUTO_2722 ?AUTO_2718 ) ( not ( = ?AUTO_2718 ?AUTO_2720 ) ) ( not ( = ?AUTO_2718 ?AUTO_2723 ) ) ( not ( = ?AUTO_2719 ?AUTO_2720 ) ) ( not ( = ?AUTO_2719 ?AUTO_2723 ) ) ( not ( = ?AUTO_2722 ?AUTO_2720 ) ) ( not ( = ?AUTO_2722 ?AUTO_2723 ) ) ( not ( = ?AUTO_2720 ?AUTO_2723 ) ) ( not ( = ?AUTO_2718 ?AUTO_2726 ) ) ( not ( = ?AUTO_2719 ?AUTO_2726 ) ) ( not ( = ?AUTO_2722 ?AUTO_2726 ) ) ( not ( = ?AUTO_2720 ?AUTO_2726 ) ) ( not ( = ?AUTO_2723 ?AUTO_2726 ) ) ( ON ?AUTO_2723 ?AUTO_2722 ) ( ON ?AUTO_2720 ?AUTO_2723 ) ( CLEAR ?AUTO_2720 ) ( CLEAR ?AUTO_2724 ) ( not ( = ?AUTO_2718 ?AUTO_2725 ) ) ( not ( = ?AUTO_2718 ?AUTO_2724 ) ) ( not ( = ?AUTO_2719 ?AUTO_2725 ) ) ( not ( = ?AUTO_2719 ?AUTO_2724 ) ) ( not ( = ?AUTO_2722 ?AUTO_2725 ) ) ( not ( = ?AUTO_2722 ?AUTO_2724 ) ) ( not ( = ?AUTO_2720 ?AUTO_2725 ) ) ( not ( = ?AUTO_2720 ?AUTO_2724 ) ) ( not ( = ?AUTO_2723 ?AUTO_2725 ) ) ( not ( = ?AUTO_2723 ?AUTO_2724 ) ) ( not ( = ?AUTO_2726 ?AUTO_2725 ) ) ( not ( = ?AUTO_2726 ?AUTO_2724 ) ) ( not ( = ?AUTO_2725 ?AUTO_2724 ) ) ( ON ?AUTO_2725 ?AUTO_2719 ) ( not ( = ?AUTO_2718 ?AUTO_2721 ) ) ( not ( = ?AUTO_2719 ?AUTO_2721 ) ) ( not ( = ?AUTO_2722 ?AUTO_2721 ) ) ( not ( = ?AUTO_2720 ?AUTO_2721 ) ) ( not ( = ?AUTO_2723 ?AUTO_2721 ) ) ( not ( = ?AUTO_2726 ?AUTO_2721 ) ) ( not ( = ?AUTO_2724 ?AUTO_2721 ) ) ( not ( = ?AUTO_2725 ?AUTO_2721 ) ) ( ON ?AUTO_2721 ?AUTO_2725 ) ( CLEAR ?AUTO_2721 ) ( HOLDING ?AUTO_2726 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2726 )
      ( MAKE-ON ?AUTO_2718 ?AUTO_2719 )
      ( MAKE-ON-VERIFY ?AUTO_2718 ?AUTO_2719 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2727 - BLOCK
      ?AUTO_2728 - BLOCK
    )
    :vars
    (
      ?AUTO_2730 - BLOCK
      ?AUTO_2733 - BLOCK
      ?AUTO_2729 - BLOCK
      ?AUTO_2734 - BLOCK
      ?AUTO_2735 - BLOCK
      ?AUTO_2731 - BLOCK
      ?AUTO_2732 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2727 ?AUTO_2728 ) ) ( ON-TABLE ?AUTO_2727 ) ( not ( = ?AUTO_2727 ?AUTO_2730 ) ) ( not ( = ?AUTO_2728 ?AUTO_2730 ) ) ( ON ?AUTO_2730 ?AUTO_2727 ) ( not ( = ?AUTO_2727 ?AUTO_2733 ) ) ( not ( = ?AUTO_2727 ?AUTO_2729 ) ) ( not ( = ?AUTO_2728 ?AUTO_2733 ) ) ( not ( = ?AUTO_2728 ?AUTO_2729 ) ) ( not ( = ?AUTO_2730 ?AUTO_2733 ) ) ( not ( = ?AUTO_2730 ?AUTO_2729 ) ) ( not ( = ?AUTO_2733 ?AUTO_2729 ) ) ( not ( = ?AUTO_2727 ?AUTO_2734 ) ) ( not ( = ?AUTO_2728 ?AUTO_2734 ) ) ( not ( = ?AUTO_2730 ?AUTO_2734 ) ) ( not ( = ?AUTO_2733 ?AUTO_2734 ) ) ( not ( = ?AUTO_2729 ?AUTO_2734 ) ) ( ON ?AUTO_2729 ?AUTO_2730 ) ( ON ?AUTO_2733 ?AUTO_2729 ) ( CLEAR ?AUTO_2733 ) ( CLEAR ?AUTO_2735 ) ( not ( = ?AUTO_2727 ?AUTO_2731 ) ) ( not ( = ?AUTO_2727 ?AUTO_2735 ) ) ( not ( = ?AUTO_2728 ?AUTO_2731 ) ) ( not ( = ?AUTO_2728 ?AUTO_2735 ) ) ( not ( = ?AUTO_2730 ?AUTO_2731 ) ) ( not ( = ?AUTO_2730 ?AUTO_2735 ) ) ( not ( = ?AUTO_2733 ?AUTO_2731 ) ) ( not ( = ?AUTO_2733 ?AUTO_2735 ) ) ( not ( = ?AUTO_2729 ?AUTO_2731 ) ) ( not ( = ?AUTO_2729 ?AUTO_2735 ) ) ( not ( = ?AUTO_2734 ?AUTO_2731 ) ) ( not ( = ?AUTO_2734 ?AUTO_2735 ) ) ( not ( = ?AUTO_2731 ?AUTO_2735 ) ) ( ON ?AUTO_2731 ?AUTO_2728 ) ( not ( = ?AUTO_2727 ?AUTO_2732 ) ) ( not ( = ?AUTO_2728 ?AUTO_2732 ) ) ( not ( = ?AUTO_2730 ?AUTO_2732 ) ) ( not ( = ?AUTO_2733 ?AUTO_2732 ) ) ( not ( = ?AUTO_2729 ?AUTO_2732 ) ) ( not ( = ?AUTO_2734 ?AUTO_2732 ) ) ( not ( = ?AUTO_2735 ?AUTO_2732 ) ) ( not ( = ?AUTO_2731 ?AUTO_2732 ) ) ( ON ?AUTO_2732 ?AUTO_2731 ) ( ON ?AUTO_2734 ?AUTO_2732 ) ( CLEAR ?AUTO_2734 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2734 ?AUTO_2732 )
      ( MAKE-ON ?AUTO_2727 ?AUTO_2728 )
      ( MAKE-ON-VERIFY ?AUTO_2727 ?AUTO_2728 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2736 - BLOCK
      ?AUTO_2737 - BLOCK
    )
    :vars
    (
      ?AUTO_2741 - BLOCK
      ?AUTO_2739 - BLOCK
      ?AUTO_2744 - BLOCK
      ?AUTO_2738 - BLOCK
      ?AUTO_2740 - BLOCK
      ?AUTO_2743 - BLOCK
      ?AUTO_2742 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2736 ?AUTO_2737 ) ) ( ON-TABLE ?AUTO_2736 ) ( not ( = ?AUTO_2736 ?AUTO_2741 ) ) ( not ( = ?AUTO_2737 ?AUTO_2741 ) ) ( ON ?AUTO_2741 ?AUTO_2736 ) ( not ( = ?AUTO_2736 ?AUTO_2739 ) ) ( not ( = ?AUTO_2736 ?AUTO_2744 ) ) ( not ( = ?AUTO_2737 ?AUTO_2739 ) ) ( not ( = ?AUTO_2737 ?AUTO_2744 ) ) ( not ( = ?AUTO_2741 ?AUTO_2739 ) ) ( not ( = ?AUTO_2741 ?AUTO_2744 ) ) ( not ( = ?AUTO_2739 ?AUTO_2744 ) ) ( not ( = ?AUTO_2736 ?AUTO_2738 ) ) ( not ( = ?AUTO_2737 ?AUTO_2738 ) ) ( not ( = ?AUTO_2741 ?AUTO_2738 ) ) ( not ( = ?AUTO_2739 ?AUTO_2738 ) ) ( not ( = ?AUTO_2744 ?AUTO_2738 ) ) ( ON ?AUTO_2744 ?AUTO_2741 ) ( CLEAR ?AUTO_2740 ) ( not ( = ?AUTO_2736 ?AUTO_2743 ) ) ( not ( = ?AUTO_2736 ?AUTO_2740 ) ) ( not ( = ?AUTO_2737 ?AUTO_2743 ) ) ( not ( = ?AUTO_2737 ?AUTO_2740 ) ) ( not ( = ?AUTO_2741 ?AUTO_2743 ) ) ( not ( = ?AUTO_2741 ?AUTO_2740 ) ) ( not ( = ?AUTO_2739 ?AUTO_2743 ) ) ( not ( = ?AUTO_2739 ?AUTO_2740 ) ) ( not ( = ?AUTO_2744 ?AUTO_2743 ) ) ( not ( = ?AUTO_2744 ?AUTO_2740 ) ) ( not ( = ?AUTO_2738 ?AUTO_2743 ) ) ( not ( = ?AUTO_2738 ?AUTO_2740 ) ) ( not ( = ?AUTO_2743 ?AUTO_2740 ) ) ( ON ?AUTO_2743 ?AUTO_2737 ) ( not ( = ?AUTO_2736 ?AUTO_2742 ) ) ( not ( = ?AUTO_2737 ?AUTO_2742 ) ) ( not ( = ?AUTO_2741 ?AUTO_2742 ) ) ( not ( = ?AUTO_2739 ?AUTO_2742 ) ) ( not ( = ?AUTO_2744 ?AUTO_2742 ) ) ( not ( = ?AUTO_2738 ?AUTO_2742 ) ) ( not ( = ?AUTO_2740 ?AUTO_2742 ) ) ( not ( = ?AUTO_2743 ?AUTO_2742 ) ) ( ON ?AUTO_2742 ?AUTO_2743 ) ( ON ?AUTO_2738 ?AUTO_2742 ) ( CLEAR ?AUTO_2738 ) ( HOLDING ?AUTO_2739 ) ( CLEAR ?AUTO_2744 ) )
    :subtasks
    ( ( !STACK ?AUTO_2739 ?AUTO_2744 )
      ( MAKE-ON ?AUTO_2736 ?AUTO_2737 )
      ( MAKE-ON-VERIFY ?AUTO_2736 ?AUTO_2737 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2745 - BLOCK
      ?AUTO_2746 - BLOCK
    )
    :vars
    (
      ?AUTO_2752 - BLOCK
      ?AUTO_2748 - BLOCK
      ?AUTO_2749 - BLOCK
      ?AUTO_2747 - BLOCK
      ?AUTO_2751 - BLOCK
      ?AUTO_2750 - BLOCK
      ?AUTO_2753 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2745 ?AUTO_2746 ) ) ( ON-TABLE ?AUTO_2745 ) ( not ( = ?AUTO_2745 ?AUTO_2752 ) ) ( not ( = ?AUTO_2746 ?AUTO_2752 ) ) ( ON ?AUTO_2752 ?AUTO_2745 ) ( not ( = ?AUTO_2745 ?AUTO_2748 ) ) ( not ( = ?AUTO_2745 ?AUTO_2749 ) ) ( not ( = ?AUTO_2746 ?AUTO_2748 ) ) ( not ( = ?AUTO_2746 ?AUTO_2749 ) ) ( not ( = ?AUTO_2752 ?AUTO_2748 ) ) ( not ( = ?AUTO_2752 ?AUTO_2749 ) ) ( not ( = ?AUTO_2748 ?AUTO_2749 ) ) ( not ( = ?AUTO_2745 ?AUTO_2747 ) ) ( not ( = ?AUTO_2746 ?AUTO_2747 ) ) ( not ( = ?AUTO_2752 ?AUTO_2747 ) ) ( not ( = ?AUTO_2748 ?AUTO_2747 ) ) ( not ( = ?AUTO_2749 ?AUTO_2747 ) ) ( ON ?AUTO_2749 ?AUTO_2752 ) ( CLEAR ?AUTO_2751 ) ( not ( = ?AUTO_2745 ?AUTO_2750 ) ) ( not ( = ?AUTO_2745 ?AUTO_2751 ) ) ( not ( = ?AUTO_2746 ?AUTO_2750 ) ) ( not ( = ?AUTO_2746 ?AUTO_2751 ) ) ( not ( = ?AUTO_2752 ?AUTO_2750 ) ) ( not ( = ?AUTO_2752 ?AUTO_2751 ) ) ( not ( = ?AUTO_2748 ?AUTO_2750 ) ) ( not ( = ?AUTO_2748 ?AUTO_2751 ) ) ( not ( = ?AUTO_2749 ?AUTO_2750 ) ) ( not ( = ?AUTO_2749 ?AUTO_2751 ) ) ( not ( = ?AUTO_2747 ?AUTO_2750 ) ) ( not ( = ?AUTO_2747 ?AUTO_2751 ) ) ( not ( = ?AUTO_2750 ?AUTO_2751 ) ) ( ON ?AUTO_2750 ?AUTO_2746 ) ( not ( = ?AUTO_2745 ?AUTO_2753 ) ) ( not ( = ?AUTO_2746 ?AUTO_2753 ) ) ( not ( = ?AUTO_2752 ?AUTO_2753 ) ) ( not ( = ?AUTO_2748 ?AUTO_2753 ) ) ( not ( = ?AUTO_2749 ?AUTO_2753 ) ) ( not ( = ?AUTO_2747 ?AUTO_2753 ) ) ( not ( = ?AUTO_2751 ?AUTO_2753 ) ) ( not ( = ?AUTO_2750 ?AUTO_2753 ) ) ( ON ?AUTO_2753 ?AUTO_2750 ) ( ON ?AUTO_2747 ?AUTO_2753 ) ( CLEAR ?AUTO_2749 ) ( ON ?AUTO_2748 ?AUTO_2747 ) ( CLEAR ?AUTO_2748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2748 ?AUTO_2747 )
      ( MAKE-ON ?AUTO_2745 ?AUTO_2746 )
      ( MAKE-ON-VERIFY ?AUTO_2745 ?AUTO_2746 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2754 - BLOCK
      ?AUTO_2755 - BLOCK
    )
    :vars
    (
      ?AUTO_2761 - BLOCK
      ?AUTO_2756 - BLOCK
      ?AUTO_2759 - BLOCK
      ?AUTO_2762 - BLOCK
      ?AUTO_2757 - BLOCK
      ?AUTO_2758 - BLOCK
      ?AUTO_2760 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2754 ?AUTO_2755 ) ) ( ON-TABLE ?AUTO_2754 ) ( not ( = ?AUTO_2754 ?AUTO_2761 ) ) ( not ( = ?AUTO_2755 ?AUTO_2761 ) ) ( ON ?AUTO_2761 ?AUTO_2754 ) ( not ( = ?AUTO_2754 ?AUTO_2756 ) ) ( not ( = ?AUTO_2754 ?AUTO_2759 ) ) ( not ( = ?AUTO_2755 ?AUTO_2756 ) ) ( not ( = ?AUTO_2755 ?AUTO_2759 ) ) ( not ( = ?AUTO_2761 ?AUTO_2756 ) ) ( not ( = ?AUTO_2761 ?AUTO_2759 ) ) ( not ( = ?AUTO_2756 ?AUTO_2759 ) ) ( not ( = ?AUTO_2754 ?AUTO_2762 ) ) ( not ( = ?AUTO_2755 ?AUTO_2762 ) ) ( not ( = ?AUTO_2761 ?AUTO_2762 ) ) ( not ( = ?AUTO_2756 ?AUTO_2762 ) ) ( not ( = ?AUTO_2759 ?AUTO_2762 ) ) ( CLEAR ?AUTO_2757 ) ( not ( = ?AUTO_2754 ?AUTO_2758 ) ) ( not ( = ?AUTO_2754 ?AUTO_2757 ) ) ( not ( = ?AUTO_2755 ?AUTO_2758 ) ) ( not ( = ?AUTO_2755 ?AUTO_2757 ) ) ( not ( = ?AUTO_2761 ?AUTO_2758 ) ) ( not ( = ?AUTO_2761 ?AUTO_2757 ) ) ( not ( = ?AUTO_2756 ?AUTO_2758 ) ) ( not ( = ?AUTO_2756 ?AUTO_2757 ) ) ( not ( = ?AUTO_2759 ?AUTO_2758 ) ) ( not ( = ?AUTO_2759 ?AUTO_2757 ) ) ( not ( = ?AUTO_2762 ?AUTO_2758 ) ) ( not ( = ?AUTO_2762 ?AUTO_2757 ) ) ( not ( = ?AUTO_2758 ?AUTO_2757 ) ) ( ON ?AUTO_2758 ?AUTO_2755 ) ( not ( = ?AUTO_2754 ?AUTO_2760 ) ) ( not ( = ?AUTO_2755 ?AUTO_2760 ) ) ( not ( = ?AUTO_2761 ?AUTO_2760 ) ) ( not ( = ?AUTO_2756 ?AUTO_2760 ) ) ( not ( = ?AUTO_2759 ?AUTO_2760 ) ) ( not ( = ?AUTO_2762 ?AUTO_2760 ) ) ( not ( = ?AUTO_2757 ?AUTO_2760 ) ) ( not ( = ?AUTO_2758 ?AUTO_2760 ) ) ( ON ?AUTO_2760 ?AUTO_2758 ) ( ON ?AUTO_2762 ?AUTO_2760 ) ( ON ?AUTO_2756 ?AUTO_2762 ) ( CLEAR ?AUTO_2756 ) ( HOLDING ?AUTO_2759 ) ( CLEAR ?AUTO_2761 ) )
    :subtasks
    ( ( !STACK ?AUTO_2759 ?AUTO_2761 )
      ( MAKE-ON ?AUTO_2754 ?AUTO_2755 )
      ( MAKE-ON-VERIFY ?AUTO_2754 ?AUTO_2755 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2763 - BLOCK
      ?AUTO_2764 - BLOCK
    )
    :vars
    (
      ?AUTO_2768 - BLOCK
      ?AUTO_2771 - BLOCK
      ?AUTO_2769 - BLOCK
      ?AUTO_2766 - BLOCK
      ?AUTO_2765 - BLOCK
      ?AUTO_2767 - BLOCK
      ?AUTO_2770 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2763 ?AUTO_2764 ) ) ( ON-TABLE ?AUTO_2763 ) ( not ( = ?AUTO_2763 ?AUTO_2768 ) ) ( not ( = ?AUTO_2764 ?AUTO_2768 ) ) ( ON ?AUTO_2768 ?AUTO_2763 ) ( not ( = ?AUTO_2763 ?AUTO_2771 ) ) ( not ( = ?AUTO_2763 ?AUTO_2769 ) ) ( not ( = ?AUTO_2764 ?AUTO_2771 ) ) ( not ( = ?AUTO_2764 ?AUTO_2769 ) ) ( not ( = ?AUTO_2768 ?AUTO_2771 ) ) ( not ( = ?AUTO_2768 ?AUTO_2769 ) ) ( not ( = ?AUTO_2771 ?AUTO_2769 ) ) ( not ( = ?AUTO_2763 ?AUTO_2766 ) ) ( not ( = ?AUTO_2764 ?AUTO_2766 ) ) ( not ( = ?AUTO_2768 ?AUTO_2766 ) ) ( not ( = ?AUTO_2771 ?AUTO_2766 ) ) ( not ( = ?AUTO_2769 ?AUTO_2766 ) ) ( CLEAR ?AUTO_2765 ) ( not ( = ?AUTO_2763 ?AUTO_2767 ) ) ( not ( = ?AUTO_2763 ?AUTO_2765 ) ) ( not ( = ?AUTO_2764 ?AUTO_2767 ) ) ( not ( = ?AUTO_2764 ?AUTO_2765 ) ) ( not ( = ?AUTO_2768 ?AUTO_2767 ) ) ( not ( = ?AUTO_2768 ?AUTO_2765 ) ) ( not ( = ?AUTO_2771 ?AUTO_2767 ) ) ( not ( = ?AUTO_2771 ?AUTO_2765 ) ) ( not ( = ?AUTO_2769 ?AUTO_2767 ) ) ( not ( = ?AUTO_2769 ?AUTO_2765 ) ) ( not ( = ?AUTO_2766 ?AUTO_2767 ) ) ( not ( = ?AUTO_2766 ?AUTO_2765 ) ) ( not ( = ?AUTO_2767 ?AUTO_2765 ) ) ( ON ?AUTO_2767 ?AUTO_2764 ) ( not ( = ?AUTO_2763 ?AUTO_2770 ) ) ( not ( = ?AUTO_2764 ?AUTO_2770 ) ) ( not ( = ?AUTO_2768 ?AUTO_2770 ) ) ( not ( = ?AUTO_2771 ?AUTO_2770 ) ) ( not ( = ?AUTO_2769 ?AUTO_2770 ) ) ( not ( = ?AUTO_2766 ?AUTO_2770 ) ) ( not ( = ?AUTO_2765 ?AUTO_2770 ) ) ( not ( = ?AUTO_2767 ?AUTO_2770 ) ) ( ON ?AUTO_2770 ?AUTO_2767 ) ( ON ?AUTO_2766 ?AUTO_2770 ) ( ON ?AUTO_2771 ?AUTO_2766 ) ( CLEAR ?AUTO_2771 ) ( CLEAR ?AUTO_2768 ) ( ON-TABLE ?AUTO_2769 ) ( CLEAR ?AUTO_2769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2769 )
      ( MAKE-ON ?AUTO_2763 ?AUTO_2764 )
      ( MAKE-ON-VERIFY ?AUTO_2763 ?AUTO_2764 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2772 - BLOCK
      ?AUTO_2773 - BLOCK
    )
    :vars
    (
      ?AUTO_2777 - BLOCK
      ?AUTO_2775 - BLOCK
      ?AUTO_2780 - BLOCK
      ?AUTO_2776 - BLOCK
      ?AUTO_2774 - BLOCK
      ?AUTO_2778 - BLOCK
      ?AUTO_2779 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2772 ?AUTO_2773 ) ) ( ON-TABLE ?AUTO_2772 ) ( not ( = ?AUTO_2772 ?AUTO_2777 ) ) ( not ( = ?AUTO_2773 ?AUTO_2777 ) ) ( not ( = ?AUTO_2772 ?AUTO_2775 ) ) ( not ( = ?AUTO_2772 ?AUTO_2780 ) ) ( not ( = ?AUTO_2773 ?AUTO_2775 ) ) ( not ( = ?AUTO_2773 ?AUTO_2780 ) ) ( not ( = ?AUTO_2777 ?AUTO_2775 ) ) ( not ( = ?AUTO_2777 ?AUTO_2780 ) ) ( not ( = ?AUTO_2775 ?AUTO_2780 ) ) ( not ( = ?AUTO_2772 ?AUTO_2776 ) ) ( not ( = ?AUTO_2773 ?AUTO_2776 ) ) ( not ( = ?AUTO_2777 ?AUTO_2776 ) ) ( not ( = ?AUTO_2775 ?AUTO_2776 ) ) ( not ( = ?AUTO_2780 ?AUTO_2776 ) ) ( CLEAR ?AUTO_2774 ) ( not ( = ?AUTO_2772 ?AUTO_2778 ) ) ( not ( = ?AUTO_2772 ?AUTO_2774 ) ) ( not ( = ?AUTO_2773 ?AUTO_2778 ) ) ( not ( = ?AUTO_2773 ?AUTO_2774 ) ) ( not ( = ?AUTO_2777 ?AUTO_2778 ) ) ( not ( = ?AUTO_2777 ?AUTO_2774 ) ) ( not ( = ?AUTO_2775 ?AUTO_2778 ) ) ( not ( = ?AUTO_2775 ?AUTO_2774 ) ) ( not ( = ?AUTO_2780 ?AUTO_2778 ) ) ( not ( = ?AUTO_2780 ?AUTO_2774 ) ) ( not ( = ?AUTO_2776 ?AUTO_2778 ) ) ( not ( = ?AUTO_2776 ?AUTO_2774 ) ) ( not ( = ?AUTO_2778 ?AUTO_2774 ) ) ( ON ?AUTO_2778 ?AUTO_2773 ) ( not ( = ?AUTO_2772 ?AUTO_2779 ) ) ( not ( = ?AUTO_2773 ?AUTO_2779 ) ) ( not ( = ?AUTO_2777 ?AUTO_2779 ) ) ( not ( = ?AUTO_2775 ?AUTO_2779 ) ) ( not ( = ?AUTO_2780 ?AUTO_2779 ) ) ( not ( = ?AUTO_2776 ?AUTO_2779 ) ) ( not ( = ?AUTO_2774 ?AUTO_2779 ) ) ( not ( = ?AUTO_2778 ?AUTO_2779 ) ) ( ON ?AUTO_2779 ?AUTO_2778 ) ( ON ?AUTO_2776 ?AUTO_2779 ) ( ON ?AUTO_2775 ?AUTO_2776 ) ( CLEAR ?AUTO_2775 ) ( ON-TABLE ?AUTO_2780 ) ( CLEAR ?AUTO_2780 ) ( HOLDING ?AUTO_2777 ) ( CLEAR ?AUTO_2772 ) )
    :subtasks
    ( ( !STACK ?AUTO_2777 ?AUTO_2772 )
      ( MAKE-ON ?AUTO_2772 ?AUTO_2773 )
      ( MAKE-ON-VERIFY ?AUTO_2772 ?AUTO_2773 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2781 - BLOCK
      ?AUTO_2782 - BLOCK
    )
    :vars
    (
      ?AUTO_2784 - BLOCK
      ?AUTO_2786 - BLOCK
      ?AUTO_2789 - BLOCK
      ?AUTO_2785 - BLOCK
      ?AUTO_2787 - BLOCK
      ?AUTO_2783 - BLOCK
      ?AUTO_2788 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2781 ?AUTO_2782 ) ) ( ON-TABLE ?AUTO_2781 ) ( not ( = ?AUTO_2781 ?AUTO_2784 ) ) ( not ( = ?AUTO_2782 ?AUTO_2784 ) ) ( not ( = ?AUTO_2781 ?AUTO_2786 ) ) ( not ( = ?AUTO_2781 ?AUTO_2789 ) ) ( not ( = ?AUTO_2782 ?AUTO_2786 ) ) ( not ( = ?AUTO_2782 ?AUTO_2789 ) ) ( not ( = ?AUTO_2784 ?AUTO_2786 ) ) ( not ( = ?AUTO_2784 ?AUTO_2789 ) ) ( not ( = ?AUTO_2786 ?AUTO_2789 ) ) ( not ( = ?AUTO_2781 ?AUTO_2785 ) ) ( not ( = ?AUTO_2782 ?AUTO_2785 ) ) ( not ( = ?AUTO_2784 ?AUTO_2785 ) ) ( not ( = ?AUTO_2786 ?AUTO_2785 ) ) ( not ( = ?AUTO_2789 ?AUTO_2785 ) ) ( CLEAR ?AUTO_2787 ) ( not ( = ?AUTO_2781 ?AUTO_2783 ) ) ( not ( = ?AUTO_2781 ?AUTO_2787 ) ) ( not ( = ?AUTO_2782 ?AUTO_2783 ) ) ( not ( = ?AUTO_2782 ?AUTO_2787 ) ) ( not ( = ?AUTO_2784 ?AUTO_2783 ) ) ( not ( = ?AUTO_2784 ?AUTO_2787 ) ) ( not ( = ?AUTO_2786 ?AUTO_2783 ) ) ( not ( = ?AUTO_2786 ?AUTO_2787 ) ) ( not ( = ?AUTO_2789 ?AUTO_2783 ) ) ( not ( = ?AUTO_2789 ?AUTO_2787 ) ) ( not ( = ?AUTO_2785 ?AUTO_2783 ) ) ( not ( = ?AUTO_2785 ?AUTO_2787 ) ) ( not ( = ?AUTO_2783 ?AUTO_2787 ) ) ( ON ?AUTO_2783 ?AUTO_2782 ) ( not ( = ?AUTO_2781 ?AUTO_2788 ) ) ( not ( = ?AUTO_2782 ?AUTO_2788 ) ) ( not ( = ?AUTO_2784 ?AUTO_2788 ) ) ( not ( = ?AUTO_2786 ?AUTO_2788 ) ) ( not ( = ?AUTO_2789 ?AUTO_2788 ) ) ( not ( = ?AUTO_2785 ?AUTO_2788 ) ) ( not ( = ?AUTO_2787 ?AUTO_2788 ) ) ( not ( = ?AUTO_2783 ?AUTO_2788 ) ) ( ON ?AUTO_2788 ?AUTO_2783 ) ( ON ?AUTO_2785 ?AUTO_2788 ) ( ON ?AUTO_2786 ?AUTO_2785 ) ( CLEAR ?AUTO_2786 ) ( ON-TABLE ?AUTO_2789 ) ( CLEAR ?AUTO_2781 ) ( ON ?AUTO_2784 ?AUTO_2789 ) ( CLEAR ?AUTO_2784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2784 ?AUTO_2789 )
      ( MAKE-ON ?AUTO_2781 ?AUTO_2782 )
      ( MAKE-ON-VERIFY ?AUTO_2781 ?AUTO_2782 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2796 - BLOCK
      ?AUTO_2797 - BLOCK
    )
    :vars
    (
      ?AUTO_2800 - BLOCK
      ?AUTO_2802 - BLOCK
      ?AUTO_2803 - BLOCK
      ?AUTO_2798 - BLOCK
      ?AUTO_2801 - BLOCK
      ?AUTO_2799 - BLOCK
      ?AUTO_2804 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2796 ?AUTO_2797 ) ) ( ON-TABLE ?AUTO_2796 ) ( not ( = ?AUTO_2796 ?AUTO_2800 ) ) ( not ( = ?AUTO_2797 ?AUTO_2800 ) ) ( not ( = ?AUTO_2796 ?AUTO_2802 ) ) ( not ( = ?AUTO_2796 ?AUTO_2803 ) ) ( not ( = ?AUTO_2797 ?AUTO_2802 ) ) ( not ( = ?AUTO_2797 ?AUTO_2803 ) ) ( not ( = ?AUTO_2800 ?AUTO_2802 ) ) ( not ( = ?AUTO_2800 ?AUTO_2803 ) ) ( not ( = ?AUTO_2802 ?AUTO_2803 ) ) ( not ( = ?AUTO_2796 ?AUTO_2798 ) ) ( not ( = ?AUTO_2797 ?AUTO_2798 ) ) ( not ( = ?AUTO_2800 ?AUTO_2798 ) ) ( not ( = ?AUTO_2802 ?AUTO_2798 ) ) ( not ( = ?AUTO_2803 ?AUTO_2798 ) ) ( not ( = ?AUTO_2796 ?AUTO_2801 ) ) ( not ( = ?AUTO_2796 ?AUTO_2799 ) ) ( not ( = ?AUTO_2797 ?AUTO_2801 ) ) ( not ( = ?AUTO_2797 ?AUTO_2799 ) ) ( not ( = ?AUTO_2800 ?AUTO_2801 ) ) ( not ( = ?AUTO_2800 ?AUTO_2799 ) ) ( not ( = ?AUTO_2802 ?AUTO_2801 ) ) ( not ( = ?AUTO_2802 ?AUTO_2799 ) ) ( not ( = ?AUTO_2803 ?AUTO_2801 ) ) ( not ( = ?AUTO_2803 ?AUTO_2799 ) ) ( not ( = ?AUTO_2798 ?AUTO_2801 ) ) ( not ( = ?AUTO_2798 ?AUTO_2799 ) ) ( not ( = ?AUTO_2801 ?AUTO_2799 ) ) ( ON ?AUTO_2801 ?AUTO_2797 ) ( not ( = ?AUTO_2796 ?AUTO_2804 ) ) ( not ( = ?AUTO_2797 ?AUTO_2804 ) ) ( not ( = ?AUTO_2800 ?AUTO_2804 ) ) ( not ( = ?AUTO_2802 ?AUTO_2804 ) ) ( not ( = ?AUTO_2803 ?AUTO_2804 ) ) ( not ( = ?AUTO_2798 ?AUTO_2804 ) ) ( not ( = ?AUTO_2799 ?AUTO_2804 ) ) ( not ( = ?AUTO_2801 ?AUTO_2804 ) ) ( ON ?AUTO_2804 ?AUTO_2801 ) ( ON ?AUTO_2798 ?AUTO_2804 ) ( ON ?AUTO_2802 ?AUTO_2798 ) ( CLEAR ?AUTO_2802 ) ( ON-TABLE ?AUTO_2803 ) ( CLEAR ?AUTO_2803 ) ( CLEAR ?AUTO_2796 ) ( ON ?AUTO_2800 ?AUTO_2799 ) ( CLEAR ?AUTO_2800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2800 ?AUTO_2799 )
      ( MAKE-ON ?AUTO_2796 ?AUTO_2797 )
      ( MAKE-ON-VERIFY ?AUTO_2796 ?AUTO_2797 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2807 - BLOCK
      ?AUTO_2808 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2807 ) ( CLEAR ?AUTO_2808 ) ( not ( = ?AUTO_2807 ?AUTO_2808 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2807 ?AUTO_2808 )
      ( MAKE-ON-VERIFY ?AUTO_2807 ?AUTO_2808 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2809 - BLOCK
      ?AUTO_2810 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2810 ) ( not ( = ?AUTO_2809 ?AUTO_2810 ) ) ( ON-TABLE ?AUTO_2809 ) ( CLEAR ?AUTO_2809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2809 )
      ( MAKE-ON ?AUTO_2809 ?AUTO_2810 )
      ( MAKE-ON-VERIFY ?AUTO_2809 ?AUTO_2810 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2811 - BLOCK
      ?AUTO_2812 - BLOCK
    )
    :vars
    (
      ?AUTO_2813 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2811 ?AUTO_2812 ) ) ( ON-TABLE ?AUTO_2811 ) ( CLEAR ?AUTO_2811 ) ( HOLDING ?AUTO_2812 ) ( CLEAR ?AUTO_2813 ) ( not ( = ?AUTO_2811 ?AUTO_2813 ) ) ( not ( = ?AUTO_2812 ?AUTO_2813 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2812 ?AUTO_2813 )
      ( MAKE-ON ?AUTO_2811 ?AUTO_2812 )
      ( MAKE-ON-VERIFY ?AUTO_2811 ?AUTO_2812 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2971 - BLOCK
      ?AUTO_2972 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2971 ) ( CLEAR ?AUTO_2972 ) ( not ( = ?AUTO_2971 ?AUTO_2972 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2971 ?AUTO_2972 )
      ( MAKE-ON-VERIFY ?AUTO_2971 ?AUTO_2972 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2973 - BLOCK
      ?AUTO_2974 - BLOCK
    )
    :vars
    (
      ?AUTO_2975 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2974 ) ( not ( = ?AUTO_2973 ?AUTO_2974 ) ) ( ON ?AUTO_2973 ?AUTO_2975 ) ( CLEAR ?AUTO_2973 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2973 ?AUTO_2975 ) ) ( not ( = ?AUTO_2974 ?AUTO_2975 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2973 ?AUTO_2975 )
      ( MAKE-ON ?AUTO_2973 ?AUTO_2974 )
      ( MAKE-ON-VERIFY ?AUTO_2973 ?AUTO_2974 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2976 - BLOCK
      ?AUTO_2977 - BLOCK
    )
    :vars
    (
      ?AUTO_2978 - BLOCK
      ?AUTO_2979 - BLOCK
      ?AUTO_2980 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2977 ) ( not ( = ?AUTO_2976 ?AUTO_2977 ) ) ( ON ?AUTO_2976 ?AUTO_2978 ) ( CLEAR ?AUTO_2976 ) ( not ( = ?AUTO_2976 ?AUTO_2978 ) ) ( not ( = ?AUTO_2977 ?AUTO_2978 ) ) ( HOLDING ?AUTO_2979 ) ( CLEAR ?AUTO_2980 ) ( not ( = ?AUTO_2976 ?AUTO_2979 ) ) ( not ( = ?AUTO_2976 ?AUTO_2980 ) ) ( not ( = ?AUTO_2977 ?AUTO_2979 ) ) ( not ( = ?AUTO_2977 ?AUTO_2980 ) ) ( not ( = ?AUTO_2978 ?AUTO_2979 ) ) ( not ( = ?AUTO_2978 ?AUTO_2980 ) ) ( not ( = ?AUTO_2979 ?AUTO_2980 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2979 ?AUTO_2980 )
      ( MAKE-ON ?AUTO_2976 ?AUTO_2977 )
      ( MAKE-ON-VERIFY ?AUTO_2976 ?AUTO_2977 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3019 - BLOCK
      ?AUTO_3020 - BLOCK
    )
    :vars
    (
      ?AUTO_3022 - BLOCK
      ?AUTO_3021 - BLOCK
      ?AUTO_3023 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3019 ?AUTO_3020 ) ) ( not ( = ?AUTO_3019 ?AUTO_3022 ) ) ( not ( = ?AUTO_3020 ?AUTO_3022 ) ) ( CLEAR ?AUTO_3021 ) ( not ( = ?AUTO_3019 ?AUTO_3023 ) ) ( not ( = ?AUTO_3019 ?AUTO_3021 ) ) ( not ( = ?AUTO_3020 ?AUTO_3023 ) ) ( not ( = ?AUTO_3020 ?AUTO_3021 ) ) ( not ( = ?AUTO_3022 ?AUTO_3023 ) ) ( not ( = ?AUTO_3022 ?AUTO_3021 ) ) ( not ( = ?AUTO_3023 ?AUTO_3021 ) ) ( ON ?AUTO_3023 ?AUTO_3020 ) ( CLEAR ?AUTO_3023 ) ( HOLDING ?AUTO_3019 ) ( CLEAR ?AUTO_3022 ) )
    :subtasks
    ( ( !STACK ?AUTO_3019 ?AUTO_3022 )
      ( MAKE-ON ?AUTO_3019 ?AUTO_3020 )
      ( MAKE-ON-VERIFY ?AUTO_3019 ?AUTO_3020 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3024 - BLOCK
      ?AUTO_3025 - BLOCK
    )
    :vars
    (
      ?AUTO_3027 - BLOCK
      ?AUTO_3028 - BLOCK
      ?AUTO_3026 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3024 ?AUTO_3025 ) ) ( not ( = ?AUTO_3024 ?AUTO_3027 ) ) ( not ( = ?AUTO_3025 ?AUTO_3027 ) ) ( CLEAR ?AUTO_3028 ) ( not ( = ?AUTO_3024 ?AUTO_3026 ) ) ( not ( = ?AUTO_3024 ?AUTO_3028 ) ) ( not ( = ?AUTO_3025 ?AUTO_3026 ) ) ( not ( = ?AUTO_3025 ?AUTO_3028 ) ) ( not ( = ?AUTO_3027 ?AUTO_3026 ) ) ( not ( = ?AUTO_3027 ?AUTO_3028 ) ) ( not ( = ?AUTO_3026 ?AUTO_3028 ) ) ( ON ?AUTO_3026 ?AUTO_3025 ) ( CLEAR ?AUTO_3027 ) ( ON ?AUTO_3024 ?AUTO_3026 ) ( CLEAR ?AUTO_3024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3024 ?AUTO_3026 )
      ( MAKE-ON ?AUTO_3024 ?AUTO_3025 )
      ( MAKE-ON-VERIFY ?AUTO_3024 ?AUTO_3025 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3029 - BLOCK
      ?AUTO_3030 - BLOCK
    )
    :vars
    (
      ?AUTO_3031 - BLOCK
      ?AUTO_3033 - BLOCK
      ?AUTO_3032 - BLOCK
      ?AUTO_3034 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3029 ?AUTO_3030 ) ) ( not ( = ?AUTO_3029 ?AUTO_3031 ) ) ( not ( = ?AUTO_3030 ?AUTO_3031 ) ) ( CLEAR ?AUTO_3033 ) ( not ( = ?AUTO_3029 ?AUTO_3032 ) ) ( not ( = ?AUTO_3029 ?AUTO_3033 ) ) ( not ( = ?AUTO_3030 ?AUTO_3032 ) ) ( not ( = ?AUTO_3030 ?AUTO_3033 ) ) ( not ( = ?AUTO_3031 ?AUTO_3032 ) ) ( not ( = ?AUTO_3031 ?AUTO_3033 ) ) ( not ( = ?AUTO_3032 ?AUTO_3033 ) ) ( ON ?AUTO_3032 ?AUTO_3030 ) ( ON ?AUTO_3029 ?AUTO_3032 ) ( CLEAR ?AUTO_3029 ) ( HOLDING ?AUTO_3031 ) ( CLEAR ?AUTO_3034 ) ( not ( = ?AUTO_3029 ?AUTO_3034 ) ) ( not ( = ?AUTO_3030 ?AUTO_3034 ) ) ( not ( = ?AUTO_3031 ?AUTO_3034 ) ) ( not ( = ?AUTO_3033 ?AUTO_3034 ) ) ( not ( = ?AUTO_3032 ?AUTO_3034 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3031 ?AUTO_3034 )
      ( MAKE-ON ?AUTO_3029 ?AUTO_3030 )
      ( MAKE-ON-VERIFY ?AUTO_3029 ?AUTO_3030 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3051 - BLOCK
      ?AUTO_3052 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3051 ) ( CLEAR ?AUTO_3052 ) ( not ( = ?AUTO_3051 ?AUTO_3052 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3051 ?AUTO_3052 )
      ( MAKE-ON-VERIFY ?AUTO_3051 ?AUTO_3052 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3053 - BLOCK
      ?AUTO_3054 - BLOCK
    )
    :vars
    (
      ?AUTO_3055 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3054 ) ( not ( = ?AUTO_3053 ?AUTO_3054 ) ) ( ON ?AUTO_3053 ?AUTO_3055 ) ( CLEAR ?AUTO_3053 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3053 ?AUTO_3055 ) ) ( not ( = ?AUTO_3054 ?AUTO_3055 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3053 ?AUTO_3055 )
      ( MAKE-ON ?AUTO_3053 ?AUTO_3054 )
      ( MAKE-ON-VERIFY ?AUTO_3053 ?AUTO_3054 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3056 - BLOCK
      ?AUTO_3057 - BLOCK
    )
    :vars
    (
      ?AUTO_3058 - BLOCK
      ?AUTO_3059 - BLOCK
      ?AUTO_3060 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3057 ) ( not ( = ?AUTO_3056 ?AUTO_3057 ) ) ( ON ?AUTO_3056 ?AUTO_3058 ) ( CLEAR ?AUTO_3056 ) ( not ( = ?AUTO_3056 ?AUTO_3058 ) ) ( not ( = ?AUTO_3057 ?AUTO_3058 ) ) ( HOLDING ?AUTO_3059 ) ( CLEAR ?AUTO_3060 ) ( not ( = ?AUTO_3056 ?AUTO_3059 ) ) ( not ( = ?AUTO_3056 ?AUTO_3060 ) ) ( not ( = ?AUTO_3057 ?AUTO_3059 ) ) ( not ( = ?AUTO_3057 ?AUTO_3060 ) ) ( not ( = ?AUTO_3058 ?AUTO_3059 ) ) ( not ( = ?AUTO_3058 ?AUTO_3060 ) ) ( not ( = ?AUTO_3059 ?AUTO_3060 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3059 ?AUTO_3060 )
      ( MAKE-ON ?AUTO_3056 ?AUTO_3057 )
      ( MAKE-ON-VERIFY ?AUTO_3056 ?AUTO_3057 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3061 - BLOCK
      ?AUTO_3062 - BLOCK
    )
    :vars
    (
      ?AUTO_3063 - BLOCK
      ?AUTO_3064 - BLOCK
      ?AUTO_3065 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3062 ) ( not ( = ?AUTO_3061 ?AUTO_3062 ) ) ( ON ?AUTO_3061 ?AUTO_3063 ) ( not ( = ?AUTO_3061 ?AUTO_3063 ) ) ( not ( = ?AUTO_3062 ?AUTO_3063 ) ) ( CLEAR ?AUTO_3064 ) ( not ( = ?AUTO_3061 ?AUTO_3065 ) ) ( not ( = ?AUTO_3061 ?AUTO_3064 ) ) ( not ( = ?AUTO_3062 ?AUTO_3065 ) ) ( not ( = ?AUTO_3062 ?AUTO_3064 ) ) ( not ( = ?AUTO_3063 ?AUTO_3065 ) ) ( not ( = ?AUTO_3063 ?AUTO_3064 ) ) ( not ( = ?AUTO_3065 ?AUTO_3064 ) ) ( ON ?AUTO_3065 ?AUTO_3061 ) ( CLEAR ?AUTO_3065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3065 ?AUTO_3061 )
      ( MAKE-ON ?AUTO_3061 ?AUTO_3062 )
      ( MAKE-ON-VERIFY ?AUTO_3061 ?AUTO_3062 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3066 - BLOCK
      ?AUTO_3067 - BLOCK
    )
    :vars
    (
      ?AUTO_3068 - BLOCK
      ?AUTO_3070 - BLOCK
      ?AUTO_3069 - BLOCK
      ?AUTO_3071 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3066 ?AUTO_3067 ) ) ( ON ?AUTO_3066 ?AUTO_3068 ) ( not ( = ?AUTO_3066 ?AUTO_3068 ) ) ( not ( = ?AUTO_3067 ?AUTO_3068 ) ) ( CLEAR ?AUTO_3070 ) ( not ( = ?AUTO_3066 ?AUTO_3069 ) ) ( not ( = ?AUTO_3066 ?AUTO_3070 ) ) ( not ( = ?AUTO_3067 ?AUTO_3069 ) ) ( not ( = ?AUTO_3067 ?AUTO_3070 ) ) ( not ( = ?AUTO_3068 ?AUTO_3069 ) ) ( not ( = ?AUTO_3068 ?AUTO_3070 ) ) ( not ( = ?AUTO_3069 ?AUTO_3070 ) ) ( ON ?AUTO_3069 ?AUTO_3066 ) ( CLEAR ?AUTO_3069 ) ( HOLDING ?AUTO_3067 ) ( CLEAR ?AUTO_3071 ) ( not ( = ?AUTO_3066 ?AUTO_3071 ) ) ( not ( = ?AUTO_3067 ?AUTO_3071 ) ) ( not ( = ?AUTO_3068 ?AUTO_3071 ) ) ( not ( = ?AUTO_3070 ?AUTO_3071 ) ) ( not ( = ?AUTO_3069 ?AUTO_3071 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3067 ?AUTO_3071 )
      ( MAKE-ON ?AUTO_3066 ?AUTO_3067 )
      ( MAKE-ON-VERIFY ?AUTO_3066 ?AUTO_3067 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3074 - BLOCK
      ?AUTO_3075 - BLOCK
    )
    :vars
    (
      ?AUTO_3078 - BLOCK
      ?AUTO_3077 - BLOCK
      ?AUTO_3076 - BLOCK
      ?AUTO_3079 - BLOCK
      ?AUTO_3080 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3075 ) ( not ( = ?AUTO_3074 ?AUTO_3075 ) ) ( ON ?AUTO_3074 ?AUTO_3078 ) ( not ( = ?AUTO_3074 ?AUTO_3078 ) ) ( not ( = ?AUTO_3075 ?AUTO_3078 ) ) ( CLEAR ?AUTO_3077 ) ( not ( = ?AUTO_3074 ?AUTO_3076 ) ) ( not ( = ?AUTO_3074 ?AUTO_3077 ) ) ( not ( = ?AUTO_3075 ?AUTO_3076 ) ) ( not ( = ?AUTO_3075 ?AUTO_3077 ) ) ( not ( = ?AUTO_3078 ?AUTO_3076 ) ) ( not ( = ?AUTO_3078 ?AUTO_3077 ) ) ( not ( = ?AUTO_3076 ?AUTO_3077 ) ) ( ON ?AUTO_3076 ?AUTO_3074 ) ( CLEAR ?AUTO_3076 ) ( HOLDING ?AUTO_3079 ) ( CLEAR ?AUTO_3080 ) ( not ( = ?AUTO_3074 ?AUTO_3079 ) ) ( not ( = ?AUTO_3074 ?AUTO_3080 ) ) ( not ( = ?AUTO_3075 ?AUTO_3079 ) ) ( not ( = ?AUTO_3075 ?AUTO_3080 ) ) ( not ( = ?AUTO_3078 ?AUTO_3079 ) ) ( not ( = ?AUTO_3078 ?AUTO_3080 ) ) ( not ( = ?AUTO_3077 ?AUTO_3079 ) ) ( not ( = ?AUTO_3077 ?AUTO_3080 ) ) ( not ( = ?AUTO_3076 ?AUTO_3079 ) ) ( not ( = ?AUTO_3076 ?AUTO_3080 ) ) ( not ( = ?AUTO_3079 ?AUTO_3080 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3079 ?AUTO_3080 )
      ( MAKE-ON ?AUTO_3074 ?AUTO_3075 )
      ( MAKE-ON-VERIFY ?AUTO_3074 ?AUTO_3075 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3193 - BLOCK
      ?AUTO_3194 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3193 ) ( CLEAR ?AUTO_3194 ) ( not ( = ?AUTO_3193 ?AUTO_3194 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3193 ?AUTO_3194 )
      ( MAKE-ON-VERIFY ?AUTO_3193 ?AUTO_3194 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3195 - BLOCK
      ?AUTO_3196 - BLOCK
    )
    :vars
    (
      ?AUTO_3197 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3196 ) ( not ( = ?AUTO_3195 ?AUTO_3196 ) ) ( ON ?AUTO_3195 ?AUTO_3197 ) ( CLEAR ?AUTO_3195 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3195 ?AUTO_3197 ) ) ( not ( = ?AUTO_3196 ?AUTO_3197 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3195 ?AUTO_3197 )
      ( MAKE-ON ?AUTO_3195 ?AUTO_3196 )
      ( MAKE-ON-VERIFY ?AUTO_3195 ?AUTO_3196 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3198 - BLOCK
      ?AUTO_3199 - BLOCK
    )
    :vars
    (
      ?AUTO_3200 - BLOCK
      ?AUTO_3201 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3198 ?AUTO_3199 ) ) ( ON ?AUTO_3198 ?AUTO_3200 ) ( CLEAR ?AUTO_3198 ) ( not ( = ?AUTO_3198 ?AUTO_3200 ) ) ( not ( = ?AUTO_3199 ?AUTO_3200 ) ) ( HOLDING ?AUTO_3199 ) ( CLEAR ?AUTO_3201 ) ( not ( = ?AUTO_3198 ?AUTO_3201 ) ) ( not ( = ?AUTO_3199 ?AUTO_3201 ) ) ( not ( = ?AUTO_3200 ?AUTO_3201 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3199 ?AUTO_3201 )
      ( MAKE-ON ?AUTO_3198 ?AUTO_3199 )
      ( MAKE-ON-VERIFY ?AUTO_3198 ?AUTO_3199 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3203 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3203 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3203 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3203 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3204 - BLOCK
    )
    :vars
    (
      ?AUTO_3205 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3204 ?AUTO_3205 ) ( CLEAR ?AUTO_3204 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3204 ?AUTO_3205 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3204 ?AUTO_3205 )
      ( MAKE-ON-TABLE ?AUTO_3204 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3204 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3207 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3207 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3207 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3207 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3208 - BLOCK
    )
    :vars
    (
      ?AUTO_3209 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3208 ?AUTO_3209 ) ( CLEAR ?AUTO_3208 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3208 ?AUTO_3209 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3208 ?AUTO_3209 )
      ( MAKE-ON-TABLE ?AUTO_3208 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3208 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3210 - BLOCK
    )
    :vars
    (
      ?AUTO_3211 - BLOCK
      ?AUTO_3212 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3210 ?AUTO_3211 ) ( CLEAR ?AUTO_3210 ) ( not ( = ?AUTO_3210 ?AUTO_3211 ) ) ( HOLDING ?AUTO_3212 ) ( not ( = ?AUTO_3210 ?AUTO_3212 ) ) ( not ( = ?AUTO_3211 ?AUTO_3212 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3212 )
      ( MAKE-ON-TABLE ?AUTO_3210 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3210 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3213 - BLOCK
    )
    :vars
    (
      ?AUTO_3214 - BLOCK
      ?AUTO_3215 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3213 ?AUTO_3214 ) ( not ( = ?AUTO_3213 ?AUTO_3214 ) ) ( not ( = ?AUTO_3213 ?AUTO_3215 ) ) ( not ( = ?AUTO_3214 ?AUTO_3215 ) ) ( ON ?AUTO_3215 ?AUTO_3213 ) ( CLEAR ?AUTO_3215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3215 ?AUTO_3213 )
      ( MAKE-ON-TABLE ?AUTO_3213 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3213 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3217 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3217 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3217 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3217 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3218 - BLOCK
    )
    :vars
    (
      ?AUTO_3219 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3218 ?AUTO_3219 ) ( CLEAR ?AUTO_3218 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3218 ?AUTO_3219 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3218 ?AUTO_3219 )
      ( MAKE-ON-TABLE ?AUTO_3218 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3218 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3220 - BLOCK
    )
    :vars
    (
      ?AUTO_3221 - BLOCK
      ?AUTO_3222 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3220 ?AUTO_3221 ) ( CLEAR ?AUTO_3220 ) ( not ( = ?AUTO_3220 ?AUTO_3221 ) ) ( HOLDING ?AUTO_3222 ) ( not ( = ?AUTO_3220 ?AUTO_3222 ) ) ( not ( = ?AUTO_3221 ?AUTO_3222 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3222 )
      ( MAKE-ON-TABLE ?AUTO_3220 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3220 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3223 - BLOCK
    )
    :vars
    (
      ?AUTO_3224 - BLOCK
      ?AUTO_3225 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3223 ?AUTO_3224 ) ( not ( = ?AUTO_3223 ?AUTO_3224 ) ) ( not ( = ?AUTO_3223 ?AUTO_3225 ) ) ( not ( = ?AUTO_3224 ?AUTO_3225 ) ) ( ON ?AUTO_3225 ?AUTO_3223 ) ( CLEAR ?AUTO_3225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3225 ?AUTO_3223 )
      ( MAKE-ON-TABLE ?AUTO_3223 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3223 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3226 - BLOCK
    )
    :vars
    (
      ?AUTO_3227 - BLOCK
      ?AUTO_3228 - BLOCK
      ?AUTO_3229 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3226 ?AUTO_3227 ) ( not ( = ?AUTO_3226 ?AUTO_3227 ) ) ( not ( = ?AUTO_3226 ?AUTO_3228 ) ) ( not ( = ?AUTO_3227 ?AUTO_3228 ) ) ( ON ?AUTO_3228 ?AUTO_3226 ) ( CLEAR ?AUTO_3228 ) ( HOLDING ?AUTO_3229 ) ( not ( = ?AUTO_3226 ?AUTO_3229 ) ) ( not ( = ?AUTO_3227 ?AUTO_3229 ) ) ( not ( = ?AUTO_3228 ?AUTO_3229 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3229 )
      ( MAKE-ON-TABLE ?AUTO_3226 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3226 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3230 - BLOCK
    )
    :vars
    (
      ?AUTO_3231 - BLOCK
      ?AUTO_3232 - BLOCK
      ?AUTO_3233 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3230 ?AUTO_3231 ) ( not ( = ?AUTO_3230 ?AUTO_3231 ) ) ( not ( = ?AUTO_3230 ?AUTO_3232 ) ) ( not ( = ?AUTO_3231 ?AUTO_3232 ) ) ( ON ?AUTO_3232 ?AUTO_3230 ) ( not ( = ?AUTO_3230 ?AUTO_3233 ) ) ( not ( = ?AUTO_3231 ?AUTO_3233 ) ) ( not ( = ?AUTO_3232 ?AUTO_3233 ) ) ( ON ?AUTO_3233 ?AUTO_3232 ) ( CLEAR ?AUTO_3233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3233 ?AUTO_3232 )
      ( MAKE-ON-TABLE ?AUTO_3230 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3230 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3236 - BLOCK
      ?AUTO_3237 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3236 ) ( CLEAR ?AUTO_3237 ) ( not ( = ?AUTO_3236 ?AUTO_3237 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3236 ?AUTO_3237 )
      ( MAKE-ON-VERIFY ?AUTO_3236 ?AUTO_3237 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3238 - BLOCK
      ?AUTO_3239 - BLOCK
    )
    :vars
    (
      ?AUTO_3240 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3239 ) ( not ( = ?AUTO_3238 ?AUTO_3239 ) ) ( ON ?AUTO_3238 ?AUTO_3240 ) ( CLEAR ?AUTO_3238 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3238 ?AUTO_3240 ) ) ( not ( = ?AUTO_3239 ?AUTO_3240 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3238 ?AUTO_3240 )
      ( MAKE-ON ?AUTO_3238 ?AUTO_3239 )
      ( MAKE-ON-VERIFY ?AUTO_3238 ?AUTO_3239 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3241 - BLOCK
      ?AUTO_3242 - BLOCK
    )
    :vars
    (
      ?AUTO_3243 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3241 ?AUTO_3242 ) ) ( ON ?AUTO_3241 ?AUTO_3243 ) ( CLEAR ?AUTO_3241 ) ( not ( = ?AUTO_3241 ?AUTO_3243 ) ) ( not ( = ?AUTO_3242 ?AUTO_3243 ) ) ( HOLDING ?AUTO_3242 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3242 )
      ( MAKE-ON ?AUTO_3241 ?AUTO_3242 )
      ( MAKE-ON-VERIFY ?AUTO_3241 ?AUTO_3242 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3244 - BLOCK
      ?AUTO_3245 - BLOCK
    )
    :vars
    (
      ?AUTO_3246 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3244 ?AUTO_3245 ) ) ( ON ?AUTO_3244 ?AUTO_3246 ) ( not ( = ?AUTO_3244 ?AUTO_3246 ) ) ( not ( = ?AUTO_3245 ?AUTO_3246 ) ) ( ON ?AUTO_3245 ?AUTO_3244 ) ( CLEAR ?AUTO_3245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3245 ?AUTO_3244 )
      ( MAKE-ON ?AUTO_3244 ?AUTO_3245 )
      ( MAKE-ON-VERIFY ?AUTO_3244 ?AUTO_3245 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3247 - BLOCK
      ?AUTO_3248 - BLOCK
    )
    :vars
    (
      ?AUTO_3249 - BLOCK
      ?AUTO_3250 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3247 ?AUTO_3248 ) ) ( ON ?AUTO_3247 ?AUTO_3249 ) ( not ( = ?AUTO_3247 ?AUTO_3249 ) ) ( not ( = ?AUTO_3248 ?AUTO_3249 ) ) ( ON ?AUTO_3248 ?AUTO_3247 ) ( CLEAR ?AUTO_3248 ) ( HOLDING ?AUTO_3250 ) ( not ( = ?AUTO_3247 ?AUTO_3250 ) ) ( not ( = ?AUTO_3248 ?AUTO_3250 ) ) ( not ( = ?AUTO_3249 ?AUTO_3250 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3250 )
      ( MAKE-ON ?AUTO_3247 ?AUTO_3248 )
      ( MAKE-ON-VERIFY ?AUTO_3247 ?AUTO_3248 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3251 - BLOCK
      ?AUTO_3252 - BLOCK
    )
    :vars
    (
      ?AUTO_3253 - BLOCK
      ?AUTO_3254 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3251 ?AUTO_3252 ) ) ( ON ?AUTO_3251 ?AUTO_3253 ) ( not ( = ?AUTO_3251 ?AUTO_3253 ) ) ( not ( = ?AUTO_3252 ?AUTO_3253 ) ) ( ON ?AUTO_3252 ?AUTO_3251 ) ( not ( = ?AUTO_3251 ?AUTO_3254 ) ) ( not ( = ?AUTO_3252 ?AUTO_3254 ) ) ( not ( = ?AUTO_3253 ?AUTO_3254 ) ) ( ON ?AUTO_3254 ?AUTO_3252 ) ( CLEAR ?AUTO_3254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3254 ?AUTO_3252 )
      ( MAKE-ON ?AUTO_3251 ?AUTO_3252 )
      ( MAKE-ON-VERIFY ?AUTO_3251 ?AUTO_3252 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3255 - BLOCK
      ?AUTO_3256 - BLOCK
    )
    :vars
    (
      ?AUTO_3258 - BLOCK
      ?AUTO_3257 - BLOCK
      ?AUTO_3259 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3255 ?AUTO_3256 ) ) ( ON ?AUTO_3255 ?AUTO_3258 ) ( not ( = ?AUTO_3255 ?AUTO_3258 ) ) ( not ( = ?AUTO_3256 ?AUTO_3258 ) ) ( ON ?AUTO_3256 ?AUTO_3255 ) ( not ( = ?AUTO_3255 ?AUTO_3257 ) ) ( not ( = ?AUTO_3256 ?AUTO_3257 ) ) ( not ( = ?AUTO_3258 ?AUTO_3257 ) ) ( ON ?AUTO_3257 ?AUTO_3256 ) ( CLEAR ?AUTO_3257 ) ( HOLDING ?AUTO_3259 ) ( not ( = ?AUTO_3255 ?AUTO_3259 ) ) ( not ( = ?AUTO_3256 ?AUTO_3259 ) ) ( not ( = ?AUTO_3258 ?AUTO_3259 ) ) ( not ( = ?AUTO_3257 ?AUTO_3259 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3259 )
      ( MAKE-ON ?AUTO_3255 ?AUTO_3256 )
      ( MAKE-ON-VERIFY ?AUTO_3255 ?AUTO_3256 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3260 - BLOCK
      ?AUTO_3261 - BLOCK
    )
    :vars
    (
      ?AUTO_3263 - BLOCK
      ?AUTO_3262 - BLOCK
      ?AUTO_3264 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3260 ?AUTO_3261 ) ) ( ON ?AUTO_3260 ?AUTO_3263 ) ( not ( = ?AUTO_3260 ?AUTO_3263 ) ) ( not ( = ?AUTO_3261 ?AUTO_3263 ) ) ( ON ?AUTO_3261 ?AUTO_3260 ) ( not ( = ?AUTO_3260 ?AUTO_3262 ) ) ( not ( = ?AUTO_3261 ?AUTO_3262 ) ) ( not ( = ?AUTO_3263 ?AUTO_3262 ) ) ( ON ?AUTO_3262 ?AUTO_3261 ) ( not ( = ?AUTO_3260 ?AUTO_3264 ) ) ( not ( = ?AUTO_3261 ?AUTO_3264 ) ) ( not ( = ?AUTO_3263 ?AUTO_3264 ) ) ( not ( = ?AUTO_3262 ?AUTO_3264 ) ) ( ON ?AUTO_3264 ?AUTO_3262 ) ( CLEAR ?AUTO_3264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3264 ?AUTO_3262 )
      ( MAKE-ON ?AUTO_3260 ?AUTO_3261 )
      ( MAKE-ON-VERIFY ?AUTO_3260 ?AUTO_3261 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3267 - BLOCK
      ?AUTO_3268 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3267 ) ( CLEAR ?AUTO_3268 ) ( not ( = ?AUTO_3267 ?AUTO_3268 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3267 ?AUTO_3268 )
      ( MAKE-ON-VERIFY ?AUTO_3267 ?AUTO_3268 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3269 - BLOCK
      ?AUTO_3270 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3270 ) ( not ( = ?AUTO_3269 ?AUTO_3270 ) ) ( ON-TABLE ?AUTO_3269 ) ( CLEAR ?AUTO_3269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3269 )
      ( MAKE-ON ?AUTO_3269 ?AUTO_3270 )
      ( MAKE-ON-VERIFY ?AUTO_3269 ?AUTO_3270 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3271 - BLOCK
      ?AUTO_3272 - BLOCK
    )
    :vars
    (
      ?AUTO_3273 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3271 ?AUTO_3272 ) ) ( ON-TABLE ?AUTO_3271 ) ( CLEAR ?AUTO_3271 ) ( HOLDING ?AUTO_3272 ) ( CLEAR ?AUTO_3273 ) ( not ( = ?AUTO_3271 ?AUTO_3273 ) ) ( not ( = ?AUTO_3272 ?AUTO_3273 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3272 ?AUTO_3273 )
      ( MAKE-ON ?AUTO_3271 ?AUTO_3272 )
      ( MAKE-ON-VERIFY ?AUTO_3271 ?AUTO_3272 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3276 - BLOCK
      ?AUTO_3277 - BLOCK
    )
    :vars
    (
      ?AUTO_3278 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3277 ) ( not ( = ?AUTO_3276 ?AUTO_3277 ) ) ( ON-TABLE ?AUTO_3276 ) ( CLEAR ?AUTO_3276 ) ( HOLDING ?AUTO_3278 ) ( not ( = ?AUTO_3276 ?AUTO_3278 ) ) ( not ( = ?AUTO_3277 ?AUTO_3278 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3278 )
      ( MAKE-ON ?AUTO_3276 ?AUTO_3277 )
      ( MAKE-ON-VERIFY ?AUTO_3276 ?AUTO_3277 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3279 - BLOCK
      ?AUTO_3280 - BLOCK
    )
    :vars
    (
      ?AUTO_3281 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3279 ?AUTO_3280 ) ) ( ON-TABLE ?AUTO_3279 ) ( CLEAR ?AUTO_3279 ) ( not ( = ?AUTO_3279 ?AUTO_3281 ) ) ( not ( = ?AUTO_3280 ?AUTO_3281 ) ) ( ON ?AUTO_3281 ?AUTO_3280 ) ( CLEAR ?AUTO_3281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3281 ?AUTO_3280 )
      ( MAKE-ON ?AUTO_3279 ?AUTO_3280 )
      ( MAKE-ON-VERIFY ?AUTO_3279 ?AUTO_3280 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3282 - BLOCK
      ?AUTO_3283 - BLOCK
    )
    :vars
    (
      ?AUTO_3284 - BLOCK
      ?AUTO_3285 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3282 ?AUTO_3283 ) ) ( ON-TABLE ?AUTO_3282 ) ( CLEAR ?AUTO_3282 ) ( not ( = ?AUTO_3282 ?AUTO_3284 ) ) ( not ( = ?AUTO_3283 ?AUTO_3284 ) ) ( ON ?AUTO_3284 ?AUTO_3283 ) ( CLEAR ?AUTO_3284 ) ( HOLDING ?AUTO_3285 ) ( not ( = ?AUTO_3282 ?AUTO_3285 ) ) ( not ( = ?AUTO_3283 ?AUTO_3285 ) ) ( not ( = ?AUTO_3284 ?AUTO_3285 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3285 )
      ( MAKE-ON ?AUTO_3282 ?AUTO_3283 )
      ( MAKE-ON-VERIFY ?AUTO_3282 ?AUTO_3283 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3286 - BLOCK
      ?AUTO_3287 - BLOCK
    )
    :vars
    (
      ?AUTO_3288 - BLOCK
      ?AUTO_3289 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3286 ?AUTO_3287 ) ) ( ON-TABLE ?AUTO_3286 ) ( CLEAR ?AUTO_3286 ) ( not ( = ?AUTO_3286 ?AUTO_3288 ) ) ( not ( = ?AUTO_3287 ?AUTO_3288 ) ) ( ON ?AUTO_3288 ?AUTO_3287 ) ( not ( = ?AUTO_3286 ?AUTO_3289 ) ) ( not ( = ?AUTO_3287 ?AUTO_3289 ) ) ( not ( = ?AUTO_3288 ?AUTO_3289 ) ) ( ON ?AUTO_3289 ?AUTO_3288 ) ( CLEAR ?AUTO_3289 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3289 ?AUTO_3288 )
      ( MAKE-ON ?AUTO_3286 ?AUTO_3287 )
      ( MAKE-ON-VERIFY ?AUTO_3286 ?AUTO_3287 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3290 - BLOCK
      ?AUTO_3291 - BLOCK
    )
    :vars
    (
      ?AUTO_3293 - BLOCK
      ?AUTO_3292 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3290 ?AUTO_3291 ) ) ( not ( = ?AUTO_3290 ?AUTO_3293 ) ) ( not ( = ?AUTO_3291 ?AUTO_3293 ) ) ( ON ?AUTO_3293 ?AUTO_3291 ) ( not ( = ?AUTO_3290 ?AUTO_3292 ) ) ( not ( = ?AUTO_3291 ?AUTO_3292 ) ) ( not ( = ?AUTO_3293 ?AUTO_3292 ) ) ( ON ?AUTO_3292 ?AUTO_3293 ) ( CLEAR ?AUTO_3292 ) ( HOLDING ?AUTO_3290 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3290 )
      ( MAKE-ON ?AUTO_3290 ?AUTO_3291 )
      ( MAKE-ON-VERIFY ?AUTO_3290 ?AUTO_3291 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3294 - BLOCK
      ?AUTO_3295 - BLOCK
    )
    :vars
    (
      ?AUTO_3297 - BLOCK
      ?AUTO_3296 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3294 ?AUTO_3295 ) ) ( not ( = ?AUTO_3294 ?AUTO_3297 ) ) ( not ( = ?AUTO_3295 ?AUTO_3297 ) ) ( ON ?AUTO_3297 ?AUTO_3295 ) ( not ( = ?AUTO_3294 ?AUTO_3296 ) ) ( not ( = ?AUTO_3295 ?AUTO_3296 ) ) ( not ( = ?AUTO_3297 ?AUTO_3296 ) ) ( ON ?AUTO_3296 ?AUTO_3297 ) ( ON ?AUTO_3294 ?AUTO_3296 ) ( CLEAR ?AUTO_3294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3294 ?AUTO_3296 )
      ( MAKE-ON ?AUTO_3294 ?AUTO_3295 )
      ( MAKE-ON-VERIFY ?AUTO_3294 ?AUTO_3295 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3300 - BLOCK
      ?AUTO_3301 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3300 ) ( CLEAR ?AUTO_3301 ) ( not ( = ?AUTO_3300 ?AUTO_3301 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3300 ?AUTO_3301 )
      ( MAKE-ON-VERIFY ?AUTO_3300 ?AUTO_3301 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3302 - BLOCK
      ?AUTO_3303 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3303 ) ( not ( = ?AUTO_3302 ?AUTO_3303 ) ) ( ON-TABLE ?AUTO_3302 ) ( CLEAR ?AUTO_3302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3302 )
      ( MAKE-ON ?AUTO_3302 ?AUTO_3303 )
      ( MAKE-ON-VERIFY ?AUTO_3302 ?AUTO_3303 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3304 - BLOCK
      ?AUTO_3305 - BLOCK
    )
    :vars
    (
      ?AUTO_3306 - BLOCK
      ?AUTO_3307 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3305 ) ( not ( = ?AUTO_3304 ?AUTO_3305 ) ) ( ON-TABLE ?AUTO_3304 ) ( CLEAR ?AUTO_3304 ) ( HOLDING ?AUTO_3306 ) ( CLEAR ?AUTO_3307 ) ( not ( = ?AUTO_3304 ?AUTO_3306 ) ) ( not ( = ?AUTO_3304 ?AUTO_3307 ) ) ( not ( = ?AUTO_3305 ?AUTO_3306 ) ) ( not ( = ?AUTO_3305 ?AUTO_3307 ) ) ( not ( = ?AUTO_3306 ?AUTO_3307 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3306 ?AUTO_3307 )
      ( MAKE-ON ?AUTO_3304 ?AUTO_3305 )
      ( MAKE-ON-VERIFY ?AUTO_3304 ?AUTO_3305 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3328 - BLOCK
      ?AUTO_3329 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3328 ) ( CLEAR ?AUTO_3329 ) ( not ( = ?AUTO_3328 ?AUTO_3329 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3328 ?AUTO_3329 )
      ( MAKE-ON-VERIFY ?AUTO_3328 ?AUTO_3329 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3330 - BLOCK
      ?AUTO_3331 - BLOCK
    )
    :vars
    (
      ?AUTO_3332 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3331 ) ( not ( = ?AUTO_3330 ?AUTO_3331 ) ) ( ON ?AUTO_3330 ?AUTO_3332 ) ( CLEAR ?AUTO_3330 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3330 ?AUTO_3332 ) ) ( not ( = ?AUTO_3331 ?AUTO_3332 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3330 ?AUTO_3332 )
      ( MAKE-ON ?AUTO_3330 ?AUTO_3331 )
      ( MAKE-ON-VERIFY ?AUTO_3330 ?AUTO_3331 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3333 - BLOCK
      ?AUTO_3334 - BLOCK
    )
    :vars
    (
      ?AUTO_3335 - BLOCK
      ?AUTO_3336 - BLOCK
      ?AUTO_3337 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3334 ) ( not ( = ?AUTO_3333 ?AUTO_3334 ) ) ( ON ?AUTO_3333 ?AUTO_3335 ) ( CLEAR ?AUTO_3333 ) ( not ( = ?AUTO_3333 ?AUTO_3335 ) ) ( not ( = ?AUTO_3334 ?AUTO_3335 ) ) ( HOLDING ?AUTO_3336 ) ( CLEAR ?AUTO_3337 ) ( not ( = ?AUTO_3333 ?AUTO_3336 ) ) ( not ( = ?AUTO_3333 ?AUTO_3337 ) ) ( not ( = ?AUTO_3334 ?AUTO_3336 ) ) ( not ( = ?AUTO_3334 ?AUTO_3337 ) ) ( not ( = ?AUTO_3335 ?AUTO_3336 ) ) ( not ( = ?AUTO_3335 ?AUTO_3337 ) ) ( not ( = ?AUTO_3336 ?AUTO_3337 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3336 ?AUTO_3337 )
      ( MAKE-ON ?AUTO_3333 ?AUTO_3334 )
      ( MAKE-ON-VERIFY ?AUTO_3333 ?AUTO_3334 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3346 - BLOCK
      ?AUTO_3347 - BLOCK
    )
    :vars
    (
      ?AUTO_3348 - BLOCK
      ?AUTO_3349 - BLOCK
      ?AUTO_3350 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3346 ?AUTO_3347 ) ) ( ON ?AUTO_3346 ?AUTO_3348 ) ( CLEAR ?AUTO_3346 ) ( not ( = ?AUTO_3346 ?AUTO_3348 ) ) ( not ( = ?AUTO_3347 ?AUTO_3348 ) ) ( CLEAR ?AUTO_3349 ) ( not ( = ?AUTO_3346 ?AUTO_3350 ) ) ( not ( = ?AUTO_3346 ?AUTO_3349 ) ) ( not ( = ?AUTO_3347 ?AUTO_3350 ) ) ( not ( = ?AUTO_3347 ?AUTO_3349 ) ) ( not ( = ?AUTO_3348 ?AUTO_3350 ) ) ( not ( = ?AUTO_3348 ?AUTO_3349 ) ) ( not ( = ?AUTO_3350 ?AUTO_3349 ) ) ( ON ?AUTO_3350 ?AUTO_3347 ) ( CLEAR ?AUTO_3350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3350 ?AUTO_3347 )
      ( MAKE-ON ?AUTO_3346 ?AUTO_3347 )
      ( MAKE-ON-VERIFY ?AUTO_3346 ?AUTO_3347 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3351 - BLOCK
      ?AUTO_3352 - BLOCK
    )
    :vars
    (
      ?AUTO_3354 - BLOCK
      ?AUTO_3353 - BLOCK
      ?AUTO_3355 - BLOCK
      ?AUTO_3356 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3351 ?AUTO_3352 ) ) ( ON ?AUTO_3351 ?AUTO_3354 ) ( CLEAR ?AUTO_3351 ) ( not ( = ?AUTO_3351 ?AUTO_3354 ) ) ( not ( = ?AUTO_3352 ?AUTO_3354 ) ) ( CLEAR ?AUTO_3353 ) ( not ( = ?AUTO_3351 ?AUTO_3355 ) ) ( not ( = ?AUTO_3351 ?AUTO_3353 ) ) ( not ( = ?AUTO_3352 ?AUTO_3355 ) ) ( not ( = ?AUTO_3352 ?AUTO_3353 ) ) ( not ( = ?AUTO_3354 ?AUTO_3355 ) ) ( not ( = ?AUTO_3354 ?AUTO_3353 ) ) ( not ( = ?AUTO_3355 ?AUTO_3353 ) ) ( ON ?AUTO_3355 ?AUTO_3352 ) ( CLEAR ?AUTO_3355 ) ( HOLDING ?AUTO_3356 ) ( not ( = ?AUTO_3351 ?AUTO_3356 ) ) ( not ( = ?AUTO_3352 ?AUTO_3356 ) ) ( not ( = ?AUTO_3354 ?AUTO_3356 ) ) ( not ( = ?AUTO_3353 ?AUTO_3356 ) ) ( not ( = ?AUTO_3355 ?AUTO_3356 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3356 )
      ( MAKE-ON ?AUTO_3351 ?AUTO_3352 )
      ( MAKE-ON-VERIFY ?AUTO_3351 ?AUTO_3352 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3357 - BLOCK
      ?AUTO_3358 - BLOCK
    )
    :vars
    (
      ?AUTO_3359 - BLOCK
      ?AUTO_3360 - BLOCK
      ?AUTO_3361 - BLOCK
      ?AUTO_3362 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3357 ?AUTO_3358 ) ) ( ON ?AUTO_3357 ?AUTO_3359 ) ( CLEAR ?AUTO_3357 ) ( not ( = ?AUTO_3357 ?AUTO_3359 ) ) ( not ( = ?AUTO_3358 ?AUTO_3359 ) ) ( CLEAR ?AUTO_3360 ) ( not ( = ?AUTO_3357 ?AUTO_3361 ) ) ( not ( = ?AUTO_3357 ?AUTO_3360 ) ) ( not ( = ?AUTO_3358 ?AUTO_3361 ) ) ( not ( = ?AUTO_3358 ?AUTO_3360 ) ) ( not ( = ?AUTO_3359 ?AUTO_3361 ) ) ( not ( = ?AUTO_3359 ?AUTO_3360 ) ) ( not ( = ?AUTO_3361 ?AUTO_3360 ) ) ( ON ?AUTO_3361 ?AUTO_3358 ) ( not ( = ?AUTO_3357 ?AUTO_3362 ) ) ( not ( = ?AUTO_3358 ?AUTO_3362 ) ) ( not ( = ?AUTO_3359 ?AUTO_3362 ) ) ( not ( = ?AUTO_3360 ?AUTO_3362 ) ) ( not ( = ?AUTO_3361 ?AUTO_3362 ) ) ( ON ?AUTO_3362 ?AUTO_3361 ) ( CLEAR ?AUTO_3362 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3362 ?AUTO_3361 )
      ( MAKE-ON ?AUTO_3357 ?AUTO_3358 )
      ( MAKE-ON-VERIFY ?AUTO_3357 ?AUTO_3358 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3363 - BLOCK
      ?AUTO_3364 - BLOCK
    )
    :vars
    (
      ?AUTO_3366 - BLOCK
      ?AUTO_3367 - BLOCK
      ?AUTO_3365 - BLOCK
      ?AUTO_3368 - BLOCK
      ?AUTO_3369 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3363 ?AUTO_3364 ) ) ( ON ?AUTO_3363 ?AUTO_3366 ) ( CLEAR ?AUTO_3363 ) ( not ( = ?AUTO_3363 ?AUTO_3366 ) ) ( not ( = ?AUTO_3364 ?AUTO_3366 ) ) ( CLEAR ?AUTO_3367 ) ( not ( = ?AUTO_3363 ?AUTO_3365 ) ) ( not ( = ?AUTO_3363 ?AUTO_3367 ) ) ( not ( = ?AUTO_3364 ?AUTO_3365 ) ) ( not ( = ?AUTO_3364 ?AUTO_3367 ) ) ( not ( = ?AUTO_3366 ?AUTO_3365 ) ) ( not ( = ?AUTO_3366 ?AUTO_3367 ) ) ( not ( = ?AUTO_3365 ?AUTO_3367 ) ) ( ON ?AUTO_3365 ?AUTO_3364 ) ( not ( = ?AUTO_3363 ?AUTO_3368 ) ) ( not ( = ?AUTO_3364 ?AUTO_3368 ) ) ( not ( = ?AUTO_3366 ?AUTO_3368 ) ) ( not ( = ?AUTO_3367 ?AUTO_3368 ) ) ( not ( = ?AUTO_3365 ?AUTO_3368 ) ) ( ON ?AUTO_3368 ?AUTO_3365 ) ( CLEAR ?AUTO_3368 ) ( HOLDING ?AUTO_3369 ) ( not ( = ?AUTO_3363 ?AUTO_3369 ) ) ( not ( = ?AUTO_3364 ?AUTO_3369 ) ) ( not ( = ?AUTO_3366 ?AUTO_3369 ) ) ( not ( = ?AUTO_3367 ?AUTO_3369 ) ) ( not ( = ?AUTO_3365 ?AUTO_3369 ) ) ( not ( = ?AUTO_3368 ?AUTO_3369 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3369 )
      ( MAKE-ON ?AUTO_3363 ?AUTO_3364 )
      ( MAKE-ON-VERIFY ?AUTO_3363 ?AUTO_3364 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3370 - BLOCK
      ?AUTO_3371 - BLOCK
    )
    :vars
    (
      ?AUTO_3373 - BLOCK
      ?AUTO_3376 - BLOCK
      ?AUTO_3372 - BLOCK
      ?AUTO_3375 - BLOCK
      ?AUTO_3374 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3370 ?AUTO_3371 ) ) ( ON ?AUTO_3370 ?AUTO_3373 ) ( CLEAR ?AUTO_3370 ) ( not ( = ?AUTO_3370 ?AUTO_3373 ) ) ( not ( = ?AUTO_3371 ?AUTO_3373 ) ) ( CLEAR ?AUTO_3376 ) ( not ( = ?AUTO_3370 ?AUTO_3372 ) ) ( not ( = ?AUTO_3370 ?AUTO_3376 ) ) ( not ( = ?AUTO_3371 ?AUTO_3372 ) ) ( not ( = ?AUTO_3371 ?AUTO_3376 ) ) ( not ( = ?AUTO_3373 ?AUTO_3372 ) ) ( not ( = ?AUTO_3373 ?AUTO_3376 ) ) ( not ( = ?AUTO_3372 ?AUTO_3376 ) ) ( ON ?AUTO_3372 ?AUTO_3371 ) ( not ( = ?AUTO_3370 ?AUTO_3375 ) ) ( not ( = ?AUTO_3371 ?AUTO_3375 ) ) ( not ( = ?AUTO_3373 ?AUTO_3375 ) ) ( not ( = ?AUTO_3376 ?AUTO_3375 ) ) ( not ( = ?AUTO_3372 ?AUTO_3375 ) ) ( ON ?AUTO_3375 ?AUTO_3372 ) ( not ( = ?AUTO_3370 ?AUTO_3374 ) ) ( not ( = ?AUTO_3371 ?AUTO_3374 ) ) ( not ( = ?AUTO_3373 ?AUTO_3374 ) ) ( not ( = ?AUTO_3376 ?AUTO_3374 ) ) ( not ( = ?AUTO_3372 ?AUTO_3374 ) ) ( not ( = ?AUTO_3375 ?AUTO_3374 ) ) ( ON ?AUTO_3374 ?AUTO_3375 ) ( CLEAR ?AUTO_3374 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3374 ?AUTO_3375 )
      ( MAKE-ON ?AUTO_3370 ?AUTO_3371 )
      ( MAKE-ON-VERIFY ?AUTO_3370 ?AUTO_3371 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3377 - BLOCK
      ?AUTO_3378 - BLOCK
    )
    :vars
    (
      ?AUTO_3379 - BLOCK
      ?AUTO_3382 - BLOCK
      ?AUTO_3380 - BLOCK
      ?AUTO_3383 - BLOCK
      ?AUTO_3381 - BLOCK
      ?AUTO_3384 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3377 ?AUTO_3378 ) ) ( ON ?AUTO_3377 ?AUTO_3379 ) ( CLEAR ?AUTO_3377 ) ( not ( = ?AUTO_3377 ?AUTO_3379 ) ) ( not ( = ?AUTO_3378 ?AUTO_3379 ) ) ( CLEAR ?AUTO_3382 ) ( not ( = ?AUTO_3377 ?AUTO_3380 ) ) ( not ( = ?AUTO_3377 ?AUTO_3382 ) ) ( not ( = ?AUTO_3378 ?AUTO_3380 ) ) ( not ( = ?AUTO_3378 ?AUTO_3382 ) ) ( not ( = ?AUTO_3379 ?AUTO_3380 ) ) ( not ( = ?AUTO_3379 ?AUTO_3382 ) ) ( not ( = ?AUTO_3380 ?AUTO_3382 ) ) ( ON ?AUTO_3380 ?AUTO_3378 ) ( not ( = ?AUTO_3377 ?AUTO_3383 ) ) ( not ( = ?AUTO_3378 ?AUTO_3383 ) ) ( not ( = ?AUTO_3379 ?AUTO_3383 ) ) ( not ( = ?AUTO_3382 ?AUTO_3383 ) ) ( not ( = ?AUTO_3380 ?AUTO_3383 ) ) ( ON ?AUTO_3383 ?AUTO_3380 ) ( not ( = ?AUTO_3377 ?AUTO_3381 ) ) ( not ( = ?AUTO_3378 ?AUTO_3381 ) ) ( not ( = ?AUTO_3379 ?AUTO_3381 ) ) ( not ( = ?AUTO_3382 ?AUTO_3381 ) ) ( not ( = ?AUTO_3380 ?AUTO_3381 ) ) ( not ( = ?AUTO_3383 ?AUTO_3381 ) ) ( ON ?AUTO_3381 ?AUTO_3383 ) ( CLEAR ?AUTO_3381 ) ( HOLDING ?AUTO_3384 ) ( not ( = ?AUTO_3377 ?AUTO_3384 ) ) ( not ( = ?AUTO_3378 ?AUTO_3384 ) ) ( not ( = ?AUTO_3379 ?AUTO_3384 ) ) ( not ( = ?AUTO_3382 ?AUTO_3384 ) ) ( not ( = ?AUTO_3380 ?AUTO_3384 ) ) ( not ( = ?AUTO_3383 ?AUTO_3384 ) ) ( not ( = ?AUTO_3381 ?AUTO_3384 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3384 )
      ( MAKE-ON ?AUTO_3377 ?AUTO_3378 )
      ( MAKE-ON-VERIFY ?AUTO_3377 ?AUTO_3378 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3385 - BLOCK
      ?AUTO_3386 - BLOCK
    )
    :vars
    (
      ?AUTO_3389 - BLOCK
      ?AUTO_3391 - BLOCK
      ?AUTO_3388 - BLOCK
      ?AUTO_3387 - BLOCK
      ?AUTO_3390 - BLOCK
      ?AUTO_3392 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3385 ?AUTO_3386 ) ) ( ON ?AUTO_3385 ?AUTO_3389 ) ( CLEAR ?AUTO_3385 ) ( not ( = ?AUTO_3385 ?AUTO_3389 ) ) ( not ( = ?AUTO_3386 ?AUTO_3389 ) ) ( CLEAR ?AUTO_3391 ) ( not ( = ?AUTO_3385 ?AUTO_3388 ) ) ( not ( = ?AUTO_3385 ?AUTO_3391 ) ) ( not ( = ?AUTO_3386 ?AUTO_3388 ) ) ( not ( = ?AUTO_3386 ?AUTO_3391 ) ) ( not ( = ?AUTO_3389 ?AUTO_3388 ) ) ( not ( = ?AUTO_3389 ?AUTO_3391 ) ) ( not ( = ?AUTO_3388 ?AUTO_3391 ) ) ( ON ?AUTO_3388 ?AUTO_3386 ) ( not ( = ?AUTO_3385 ?AUTO_3387 ) ) ( not ( = ?AUTO_3386 ?AUTO_3387 ) ) ( not ( = ?AUTO_3389 ?AUTO_3387 ) ) ( not ( = ?AUTO_3391 ?AUTO_3387 ) ) ( not ( = ?AUTO_3388 ?AUTO_3387 ) ) ( ON ?AUTO_3387 ?AUTO_3388 ) ( not ( = ?AUTO_3385 ?AUTO_3390 ) ) ( not ( = ?AUTO_3386 ?AUTO_3390 ) ) ( not ( = ?AUTO_3389 ?AUTO_3390 ) ) ( not ( = ?AUTO_3391 ?AUTO_3390 ) ) ( not ( = ?AUTO_3388 ?AUTO_3390 ) ) ( not ( = ?AUTO_3387 ?AUTO_3390 ) ) ( ON ?AUTO_3390 ?AUTO_3387 ) ( not ( = ?AUTO_3385 ?AUTO_3392 ) ) ( not ( = ?AUTO_3386 ?AUTO_3392 ) ) ( not ( = ?AUTO_3389 ?AUTO_3392 ) ) ( not ( = ?AUTO_3391 ?AUTO_3392 ) ) ( not ( = ?AUTO_3388 ?AUTO_3392 ) ) ( not ( = ?AUTO_3387 ?AUTO_3392 ) ) ( not ( = ?AUTO_3390 ?AUTO_3392 ) ) ( ON ?AUTO_3392 ?AUTO_3390 ) ( CLEAR ?AUTO_3392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3392 ?AUTO_3390 )
      ( MAKE-ON ?AUTO_3385 ?AUTO_3386 )
      ( MAKE-ON-VERIFY ?AUTO_3385 ?AUTO_3386 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3394 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3394 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3394 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3394 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3395 - BLOCK
    )
    :vars
    (
      ?AUTO_3396 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3395 ?AUTO_3396 ) ( CLEAR ?AUTO_3395 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3395 ?AUTO_3396 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3395 ?AUTO_3396 )
      ( MAKE-ON-TABLE ?AUTO_3395 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3395 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3397 - BLOCK
    )
    :vars
    (
      ?AUTO_3398 - BLOCK
      ?AUTO_3399 - BLOCK
      ?AUTO_3400 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3397 ?AUTO_3398 ) ( CLEAR ?AUTO_3397 ) ( not ( = ?AUTO_3397 ?AUTO_3398 ) ) ( HOLDING ?AUTO_3399 ) ( CLEAR ?AUTO_3400 ) ( not ( = ?AUTO_3397 ?AUTO_3399 ) ) ( not ( = ?AUTO_3397 ?AUTO_3400 ) ) ( not ( = ?AUTO_3398 ?AUTO_3399 ) ) ( not ( = ?AUTO_3398 ?AUTO_3400 ) ) ( not ( = ?AUTO_3399 ?AUTO_3400 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3399 ?AUTO_3400 )
      ( MAKE-ON-TABLE ?AUTO_3397 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3397 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3401 - BLOCK
    )
    :vars
    (
      ?AUTO_3402 - BLOCK
      ?AUTO_3404 - BLOCK
      ?AUTO_3403 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3401 ?AUTO_3402 ) ( not ( = ?AUTO_3401 ?AUTO_3402 ) ) ( CLEAR ?AUTO_3404 ) ( not ( = ?AUTO_3401 ?AUTO_3403 ) ) ( not ( = ?AUTO_3401 ?AUTO_3404 ) ) ( not ( = ?AUTO_3402 ?AUTO_3403 ) ) ( not ( = ?AUTO_3402 ?AUTO_3404 ) ) ( not ( = ?AUTO_3403 ?AUTO_3404 ) ) ( ON ?AUTO_3403 ?AUTO_3401 ) ( CLEAR ?AUTO_3403 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3403 ?AUTO_3401 )
      ( MAKE-ON-TABLE ?AUTO_3401 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3401 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3405 - BLOCK
    )
    :vars
    (
      ?AUTO_3406 - BLOCK
      ?AUTO_3408 - BLOCK
      ?AUTO_3407 - BLOCK
      ?AUTO_3409 - BLOCK
      ?AUTO_3410 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3405 ?AUTO_3406 ) ( not ( = ?AUTO_3405 ?AUTO_3406 ) ) ( CLEAR ?AUTO_3408 ) ( not ( = ?AUTO_3405 ?AUTO_3407 ) ) ( not ( = ?AUTO_3405 ?AUTO_3408 ) ) ( not ( = ?AUTO_3406 ?AUTO_3407 ) ) ( not ( = ?AUTO_3406 ?AUTO_3408 ) ) ( not ( = ?AUTO_3407 ?AUTO_3408 ) ) ( ON ?AUTO_3407 ?AUTO_3405 ) ( CLEAR ?AUTO_3407 ) ( HOLDING ?AUTO_3409 ) ( CLEAR ?AUTO_3410 ) ( not ( = ?AUTO_3405 ?AUTO_3409 ) ) ( not ( = ?AUTO_3405 ?AUTO_3410 ) ) ( not ( = ?AUTO_3406 ?AUTO_3409 ) ) ( not ( = ?AUTO_3406 ?AUTO_3410 ) ) ( not ( = ?AUTO_3408 ?AUTO_3409 ) ) ( not ( = ?AUTO_3408 ?AUTO_3410 ) ) ( not ( = ?AUTO_3407 ?AUTO_3409 ) ) ( not ( = ?AUTO_3407 ?AUTO_3410 ) ) ( not ( = ?AUTO_3409 ?AUTO_3410 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3409 ?AUTO_3410 )
      ( MAKE-ON-TABLE ?AUTO_3405 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3405 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3423 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3423 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3423 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3423 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3424 - BLOCK
    )
    :vars
    (
      ?AUTO_3425 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3424 ?AUTO_3425 ) ( CLEAR ?AUTO_3424 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3424 ?AUTO_3425 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3424 ?AUTO_3425 )
      ( MAKE-ON-TABLE ?AUTO_3424 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3424 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3426 - BLOCK
    )
    :vars
    (
      ?AUTO_3427 - BLOCK
      ?AUTO_3428 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3426 ?AUTO_3427 ) ( CLEAR ?AUTO_3426 ) ( not ( = ?AUTO_3426 ?AUTO_3427 ) ) ( HOLDING ?AUTO_3428 ) ( not ( = ?AUTO_3426 ?AUTO_3428 ) ) ( not ( = ?AUTO_3427 ?AUTO_3428 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3428 )
      ( MAKE-ON-TABLE ?AUTO_3426 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3426 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3429 - BLOCK
    )
    :vars
    (
      ?AUTO_3430 - BLOCK
      ?AUTO_3431 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3429 ?AUTO_3430 ) ( not ( = ?AUTO_3429 ?AUTO_3430 ) ) ( not ( = ?AUTO_3429 ?AUTO_3431 ) ) ( not ( = ?AUTO_3430 ?AUTO_3431 ) ) ( ON ?AUTO_3431 ?AUTO_3429 ) ( CLEAR ?AUTO_3431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3431 ?AUTO_3429 )
      ( MAKE-ON-TABLE ?AUTO_3429 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3429 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3432 - BLOCK
    )
    :vars
    (
      ?AUTO_3433 - BLOCK
      ?AUTO_3434 - BLOCK
      ?AUTO_3435 - BLOCK
      ?AUTO_3436 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3432 ?AUTO_3433 ) ( not ( = ?AUTO_3432 ?AUTO_3433 ) ) ( not ( = ?AUTO_3432 ?AUTO_3434 ) ) ( not ( = ?AUTO_3433 ?AUTO_3434 ) ) ( ON ?AUTO_3434 ?AUTO_3432 ) ( CLEAR ?AUTO_3434 ) ( HOLDING ?AUTO_3435 ) ( CLEAR ?AUTO_3436 ) ( not ( = ?AUTO_3432 ?AUTO_3435 ) ) ( not ( = ?AUTO_3432 ?AUTO_3436 ) ) ( not ( = ?AUTO_3433 ?AUTO_3435 ) ) ( not ( = ?AUTO_3433 ?AUTO_3436 ) ) ( not ( = ?AUTO_3434 ?AUTO_3435 ) ) ( not ( = ?AUTO_3434 ?AUTO_3436 ) ) ( not ( = ?AUTO_3435 ?AUTO_3436 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3435 ?AUTO_3436 )
      ( MAKE-ON-TABLE ?AUTO_3432 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3432 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3437 - BLOCK
    )
    :vars
    (
      ?AUTO_3438 - BLOCK
      ?AUTO_3439 - BLOCK
      ?AUTO_3440 - BLOCK
      ?AUTO_3441 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3437 ?AUTO_3438 ) ( not ( = ?AUTO_3437 ?AUTO_3438 ) ) ( not ( = ?AUTO_3437 ?AUTO_3439 ) ) ( not ( = ?AUTO_3438 ?AUTO_3439 ) ) ( ON ?AUTO_3439 ?AUTO_3437 ) ( CLEAR ?AUTO_3440 ) ( not ( = ?AUTO_3437 ?AUTO_3441 ) ) ( not ( = ?AUTO_3437 ?AUTO_3440 ) ) ( not ( = ?AUTO_3438 ?AUTO_3441 ) ) ( not ( = ?AUTO_3438 ?AUTO_3440 ) ) ( not ( = ?AUTO_3439 ?AUTO_3441 ) ) ( not ( = ?AUTO_3439 ?AUTO_3440 ) ) ( not ( = ?AUTO_3441 ?AUTO_3440 ) ) ( ON ?AUTO_3441 ?AUTO_3439 ) ( CLEAR ?AUTO_3441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3441 ?AUTO_3439 )
      ( MAKE-ON-TABLE ?AUTO_3437 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3437 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3442 - BLOCK
    )
    :vars
    (
      ?AUTO_3446 - BLOCK
      ?AUTO_3444 - BLOCK
      ?AUTO_3443 - BLOCK
      ?AUTO_3445 - BLOCK
      ?AUTO_3447 - BLOCK
      ?AUTO_3448 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3442 ?AUTO_3446 ) ( not ( = ?AUTO_3442 ?AUTO_3446 ) ) ( not ( = ?AUTO_3442 ?AUTO_3444 ) ) ( not ( = ?AUTO_3446 ?AUTO_3444 ) ) ( ON ?AUTO_3444 ?AUTO_3442 ) ( CLEAR ?AUTO_3443 ) ( not ( = ?AUTO_3442 ?AUTO_3445 ) ) ( not ( = ?AUTO_3442 ?AUTO_3443 ) ) ( not ( = ?AUTO_3446 ?AUTO_3445 ) ) ( not ( = ?AUTO_3446 ?AUTO_3443 ) ) ( not ( = ?AUTO_3444 ?AUTO_3445 ) ) ( not ( = ?AUTO_3444 ?AUTO_3443 ) ) ( not ( = ?AUTO_3445 ?AUTO_3443 ) ) ( ON ?AUTO_3445 ?AUTO_3444 ) ( CLEAR ?AUTO_3445 ) ( HOLDING ?AUTO_3447 ) ( CLEAR ?AUTO_3448 ) ( not ( = ?AUTO_3442 ?AUTO_3447 ) ) ( not ( = ?AUTO_3442 ?AUTO_3448 ) ) ( not ( = ?AUTO_3446 ?AUTO_3447 ) ) ( not ( = ?AUTO_3446 ?AUTO_3448 ) ) ( not ( = ?AUTO_3444 ?AUTO_3447 ) ) ( not ( = ?AUTO_3444 ?AUTO_3448 ) ) ( not ( = ?AUTO_3443 ?AUTO_3447 ) ) ( not ( = ?AUTO_3443 ?AUTO_3448 ) ) ( not ( = ?AUTO_3445 ?AUTO_3447 ) ) ( not ( = ?AUTO_3445 ?AUTO_3448 ) ) ( not ( = ?AUTO_3447 ?AUTO_3448 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3447 ?AUTO_3448 )
      ( MAKE-ON-TABLE ?AUTO_3442 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3442 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3462 - BLOCK
      ?AUTO_3463 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3462 ) ( CLEAR ?AUTO_3463 ) ( not ( = ?AUTO_3462 ?AUTO_3463 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3462 ?AUTO_3463 )
      ( MAKE-ON-VERIFY ?AUTO_3462 ?AUTO_3463 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3464 - BLOCK
      ?AUTO_3465 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3465 ) ( not ( = ?AUTO_3464 ?AUTO_3465 ) ) ( ON-TABLE ?AUTO_3464 ) ( CLEAR ?AUTO_3464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3464 )
      ( MAKE-ON ?AUTO_3464 ?AUTO_3465 )
      ( MAKE-ON-VERIFY ?AUTO_3464 ?AUTO_3465 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3466 - BLOCK
      ?AUTO_3467 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3466 ?AUTO_3467 ) ) ( ON-TABLE ?AUTO_3466 ) ( CLEAR ?AUTO_3466 ) ( HOLDING ?AUTO_3467 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3467 )
      ( MAKE-ON ?AUTO_3466 ?AUTO_3467 )
      ( MAKE-ON-VERIFY ?AUTO_3466 ?AUTO_3467 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3584 - BLOCK
      ?AUTO_3585 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3584 ) ( CLEAR ?AUTO_3585 ) ( not ( = ?AUTO_3584 ?AUTO_3585 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3584 ?AUTO_3585 )
      ( MAKE-ON-VERIFY ?AUTO_3584 ?AUTO_3585 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3586 - BLOCK
      ?AUTO_3587 - BLOCK
    )
    :vars
    (
      ?AUTO_3588 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3587 ) ( not ( = ?AUTO_3586 ?AUTO_3587 ) ) ( ON ?AUTO_3586 ?AUTO_3588 ) ( CLEAR ?AUTO_3586 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3586 ?AUTO_3588 ) ) ( not ( = ?AUTO_3587 ?AUTO_3588 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3586 ?AUTO_3588 )
      ( MAKE-ON ?AUTO_3586 ?AUTO_3587 )
      ( MAKE-ON-VERIFY ?AUTO_3586 ?AUTO_3587 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3589 - BLOCK
      ?AUTO_3590 - BLOCK
    )
    :vars
    (
      ?AUTO_3591 - BLOCK
      ?AUTO_3592 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3589 ?AUTO_3590 ) ) ( ON ?AUTO_3589 ?AUTO_3591 ) ( CLEAR ?AUTO_3589 ) ( not ( = ?AUTO_3589 ?AUTO_3591 ) ) ( not ( = ?AUTO_3590 ?AUTO_3591 ) ) ( HOLDING ?AUTO_3590 ) ( CLEAR ?AUTO_3592 ) ( not ( = ?AUTO_3589 ?AUTO_3592 ) ) ( not ( = ?AUTO_3590 ?AUTO_3592 ) ) ( not ( = ?AUTO_3591 ?AUTO_3592 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3590 ?AUTO_3592 )
      ( MAKE-ON ?AUTO_3589 ?AUTO_3590 )
      ( MAKE-ON-VERIFY ?AUTO_3589 ?AUTO_3590 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3595 - BLOCK
      ?AUTO_3596 - BLOCK
    )
    :vars
    (
      ?AUTO_3597 - BLOCK
      ?AUTO_3598 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3596 ) ( not ( = ?AUTO_3595 ?AUTO_3596 ) ) ( ON ?AUTO_3595 ?AUTO_3597 ) ( CLEAR ?AUTO_3595 ) ( not ( = ?AUTO_3595 ?AUTO_3597 ) ) ( not ( = ?AUTO_3596 ?AUTO_3597 ) ) ( HOLDING ?AUTO_3598 ) ( not ( = ?AUTO_3595 ?AUTO_3598 ) ) ( not ( = ?AUTO_3596 ?AUTO_3598 ) ) ( not ( = ?AUTO_3597 ?AUTO_3598 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3598 )
      ( MAKE-ON ?AUTO_3595 ?AUTO_3596 )
      ( MAKE-ON-VERIFY ?AUTO_3595 ?AUTO_3596 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3694 - BLOCK
      ?AUTO_3695 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3694 ) ( CLEAR ?AUTO_3695 ) ( not ( = ?AUTO_3694 ?AUTO_3695 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3694 ?AUTO_3695 )
      ( MAKE-ON-VERIFY ?AUTO_3694 ?AUTO_3695 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3696 - BLOCK
      ?AUTO_3697 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3697 ) ( not ( = ?AUTO_3696 ?AUTO_3697 ) ) ( ON-TABLE ?AUTO_3696 ) ( CLEAR ?AUTO_3696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3696 )
      ( MAKE-ON ?AUTO_3696 ?AUTO_3697 )
      ( MAKE-ON-VERIFY ?AUTO_3696 ?AUTO_3697 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3698 - BLOCK
      ?AUTO_3699 - BLOCK
    )
    :vars
    (
      ?AUTO_3700 - BLOCK
      ?AUTO_3701 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3699 ) ( not ( = ?AUTO_3698 ?AUTO_3699 ) ) ( ON-TABLE ?AUTO_3698 ) ( CLEAR ?AUTO_3698 ) ( HOLDING ?AUTO_3700 ) ( CLEAR ?AUTO_3701 ) ( not ( = ?AUTO_3698 ?AUTO_3700 ) ) ( not ( = ?AUTO_3698 ?AUTO_3701 ) ) ( not ( = ?AUTO_3699 ?AUTO_3700 ) ) ( not ( = ?AUTO_3699 ?AUTO_3701 ) ) ( not ( = ?AUTO_3700 ?AUTO_3701 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3700 ?AUTO_3701 )
      ( MAKE-ON ?AUTO_3698 ?AUTO_3699 )
      ( MAKE-ON-VERIFY ?AUTO_3698 ?AUTO_3699 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3702 - BLOCK
      ?AUTO_3703 - BLOCK
    )
    :vars
    (
      ?AUTO_3704 - BLOCK
      ?AUTO_3705 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3703 ) ( not ( = ?AUTO_3702 ?AUTO_3703 ) ) ( ON-TABLE ?AUTO_3702 ) ( CLEAR ?AUTO_3704 ) ( not ( = ?AUTO_3702 ?AUTO_3705 ) ) ( not ( = ?AUTO_3702 ?AUTO_3704 ) ) ( not ( = ?AUTO_3703 ?AUTO_3705 ) ) ( not ( = ?AUTO_3703 ?AUTO_3704 ) ) ( not ( = ?AUTO_3705 ?AUTO_3704 ) ) ( ON ?AUTO_3705 ?AUTO_3702 ) ( CLEAR ?AUTO_3705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3705 ?AUTO_3702 )
      ( MAKE-ON ?AUTO_3702 ?AUTO_3703 )
      ( MAKE-ON-VERIFY ?AUTO_3702 ?AUTO_3703 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3706 - BLOCK
      ?AUTO_3707 - BLOCK
    )
    :vars
    (
      ?AUTO_3708 - BLOCK
      ?AUTO_3709 - BLOCK
      ?AUTO_3710 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3707 ) ( not ( = ?AUTO_3706 ?AUTO_3707 ) ) ( ON-TABLE ?AUTO_3706 ) ( not ( = ?AUTO_3706 ?AUTO_3708 ) ) ( not ( = ?AUTO_3706 ?AUTO_3709 ) ) ( not ( = ?AUTO_3707 ?AUTO_3708 ) ) ( not ( = ?AUTO_3707 ?AUTO_3709 ) ) ( not ( = ?AUTO_3708 ?AUTO_3709 ) ) ( ON ?AUTO_3708 ?AUTO_3706 ) ( CLEAR ?AUTO_3708 ) ( HOLDING ?AUTO_3709 ) ( CLEAR ?AUTO_3710 ) ( not ( = ?AUTO_3706 ?AUTO_3710 ) ) ( not ( = ?AUTO_3707 ?AUTO_3710 ) ) ( not ( = ?AUTO_3708 ?AUTO_3710 ) ) ( not ( = ?AUTO_3709 ?AUTO_3710 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3709 ?AUTO_3710 )
      ( MAKE-ON ?AUTO_3706 ?AUTO_3707 )
      ( MAKE-ON-VERIFY ?AUTO_3706 ?AUTO_3707 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3715 - BLOCK
      ?AUTO_3716 - BLOCK
    )
    :vars
    (
      ?AUTO_3719 - BLOCK
      ?AUTO_3718 - BLOCK
      ?AUTO_3717 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3715 ?AUTO_3716 ) ) ( ON-TABLE ?AUTO_3715 ) ( not ( = ?AUTO_3715 ?AUTO_3719 ) ) ( not ( = ?AUTO_3715 ?AUTO_3718 ) ) ( not ( = ?AUTO_3716 ?AUTO_3719 ) ) ( not ( = ?AUTO_3716 ?AUTO_3718 ) ) ( not ( = ?AUTO_3719 ?AUTO_3718 ) ) ( ON ?AUTO_3719 ?AUTO_3715 ) ( CLEAR ?AUTO_3719 ) ( CLEAR ?AUTO_3717 ) ( not ( = ?AUTO_3715 ?AUTO_3717 ) ) ( not ( = ?AUTO_3716 ?AUTO_3717 ) ) ( not ( = ?AUTO_3719 ?AUTO_3717 ) ) ( not ( = ?AUTO_3718 ?AUTO_3717 ) ) ( ON ?AUTO_3718 ?AUTO_3716 ) ( CLEAR ?AUTO_3718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3718 ?AUTO_3716 )
      ( MAKE-ON ?AUTO_3715 ?AUTO_3716 )
      ( MAKE-ON-VERIFY ?AUTO_3715 ?AUTO_3716 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3720 - BLOCK
      ?AUTO_3721 - BLOCK
    )
    :vars
    (
      ?AUTO_3724 - BLOCK
      ?AUTO_3722 - BLOCK
      ?AUTO_3723 - BLOCK
      ?AUTO_3725 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3720 ?AUTO_3721 ) ) ( ON-TABLE ?AUTO_3720 ) ( not ( = ?AUTO_3720 ?AUTO_3724 ) ) ( not ( = ?AUTO_3720 ?AUTO_3722 ) ) ( not ( = ?AUTO_3721 ?AUTO_3724 ) ) ( not ( = ?AUTO_3721 ?AUTO_3722 ) ) ( not ( = ?AUTO_3724 ?AUTO_3722 ) ) ( ON ?AUTO_3724 ?AUTO_3720 ) ( CLEAR ?AUTO_3724 ) ( CLEAR ?AUTO_3723 ) ( not ( = ?AUTO_3720 ?AUTO_3723 ) ) ( not ( = ?AUTO_3721 ?AUTO_3723 ) ) ( not ( = ?AUTO_3724 ?AUTO_3723 ) ) ( not ( = ?AUTO_3722 ?AUTO_3723 ) ) ( ON ?AUTO_3722 ?AUTO_3721 ) ( CLEAR ?AUTO_3722 ) ( HOLDING ?AUTO_3725 ) ( not ( = ?AUTO_3720 ?AUTO_3725 ) ) ( not ( = ?AUTO_3721 ?AUTO_3725 ) ) ( not ( = ?AUTO_3724 ?AUTO_3725 ) ) ( not ( = ?AUTO_3722 ?AUTO_3725 ) ) ( not ( = ?AUTO_3723 ?AUTO_3725 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3725 )
      ( MAKE-ON ?AUTO_3720 ?AUTO_3721 )
      ( MAKE-ON-VERIFY ?AUTO_3720 ?AUTO_3721 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3726 - BLOCK
      ?AUTO_3727 - BLOCK
    )
    :vars
    (
      ?AUTO_3731 - BLOCK
      ?AUTO_3728 - BLOCK
      ?AUTO_3729 - BLOCK
      ?AUTO_3730 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3726 ?AUTO_3727 ) ) ( ON-TABLE ?AUTO_3726 ) ( not ( = ?AUTO_3726 ?AUTO_3731 ) ) ( not ( = ?AUTO_3726 ?AUTO_3728 ) ) ( not ( = ?AUTO_3727 ?AUTO_3731 ) ) ( not ( = ?AUTO_3727 ?AUTO_3728 ) ) ( not ( = ?AUTO_3731 ?AUTO_3728 ) ) ( ON ?AUTO_3731 ?AUTO_3726 ) ( CLEAR ?AUTO_3731 ) ( CLEAR ?AUTO_3729 ) ( not ( = ?AUTO_3726 ?AUTO_3729 ) ) ( not ( = ?AUTO_3727 ?AUTO_3729 ) ) ( not ( = ?AUTO_3731 ?AUTO_3729 ) ) ( not ( = ?AUTO_3728 ?AUTO_3729 ) ) ( ON ?AUTO_3728 ?AUTO_3727 ) ( not ( = ?AUTO_3726 ?AUTO_3730 ) ) ( not ( = ?AUTO_3727 ?AUTO_3730 ) ) ( not ( = ?AUTO_3731 ?AUTO_3730 ) ) ( not ( = ?AUTO_3728 ?AUTO_3730 ) ) ( not ( = ?AUTO_3729 ?AUTO_3730 ) ) ( ON ?AUTO_3730 ?AUTO_3728 ) ( CLEAR ?AUTO_3730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3730 ?AUTO_3728 )
      ( MAKE-ON ?AUTO_3726 ?AUTO_3727 )
      ( MAKE-ON-VERIFY ?AUTO_3726 ?AUTO_3727 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3732 - BLOCK
      ?AUTO_3733 - BLOCK
    )
    :vars
    (
      ?AUTO_3736 - BLOCK
      ?AUTO_3737 - BLOCK
      ?AUTO_3735 - BLOCK
      ?AUTO_3734 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3732 ?AUTO_3733 ) ) ( ON-TABLE ?AUTO_3732 ) ( not ( = ?AUTO_3732 ?AUTO_3736 ) ) ( not ( = ?AUTO_3732 ?AUTO_3737 ) ) ( not ( = ?AUTO_3733 ?AUTO_3736 ) ) ( not ( = ?AUTO_3733 ?AUTO_3737 ) ) ( not ( = ?AUTO_3736 ?AUTO_3737 ) ) ( CLEAR ?AUTO_3735 ) ( not ( = ?AUTO_3732 ?AUTO_3735 ) ) ( not ( = ?AUTO_3733 ?AUTO_3735 ) ) ( not ( = ?AUTO_3736 ?AUTO_3735 ) ) ( not ( = ?AUTO_3737 ?AUTO_3735 ) ) ( ON ?AUTO_3737 ?AUTO_3733 ) ( not ( = ?AUTO_3732 ?AUTO_3734 ) ) ( not ( = ?AUTO_3733 ?AUTO_3734 ) ) ( not ( = ?AUTO_3736 ?AUTO_3734 ) ) ( not ( = ?AUTO_3737 ?AUTO_3734 ) ) ( not ( = ?AUTO_3735 ?AUTO_3734 ) ) ( ON ?AUTO_3734 ?AUTO_3737 ) ( CLEAR ?AUTO_3734 ) ( HOLDING ?AUTO_3736 ) ( CLEAR ?AUTO_3732 ) )
    :subtasks
    ( ( !STACK ?AUTO_3736 ?AUTO_3732 )
      ( MAKE-ON ?AUTO_3732 ?AUTO_3733 )
      ( MAKE-ON-VERIFY ?AUTO_3732 ?AUTO_3733 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3738 - BLOCK
      ?AUTO_3739 - BLOCK
    )
    :vars
    (
      ?AUTO_3743 - BLOCK
      ?AUTO_3740 - BLOCK
      ?AUTO_3741 - BLOCK
      ?AUTO_3742 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3738 ?AUTO_3739 ) ) ( ON-TABLE ?AUTO_3738 ) ( not ( = ?AUTO_3738 ?AUTO_3743 ) ) ( not ( = ?AUTO_3738 ?AUTO_3740 ) ) ( not ( = ?AUTO_3739 ?AUTO_3743 ) ) ( not ( = ?AUTO_3739 ?AUTO_3740 ) ) ( not ( = ?AUTO_3743 ?AUTO_3740 ) ) ( CLEAR ?AUTO_3741 ) ( not ( = ?AUTO_3738 ?AUTO_3741 ) ) ( not ( = ?AUTO_3739 ?AUTO_3741 ) ) ( not ( = ?AUTO_3743 ?AUTO_3741 ) ) ( not ( = ?AUTO_3740 ?AUTO_3741 ) ) ( ON ?AUTO_3740 ?AUTO_3739 ) ( not ( = ?AUTO_3738 ?AUTO_3742 ) ) ( not ( = ?AUTO_3739 ?AUTO_3742 ) ) ( not ( = ?AUTO_3743 ?AUTO_3742 ) ) ( not ( = ?AUTO_3740 ?AUTO_3742 ) ) ( not ( = ?AUTO_3741 ?AUTO_3742 ) ) ( ON ?AUTO_3742 ?AUTO_3740 ) ( CLEAR ?AUTO_3738 ) ( ON ?AUTO_3743 ?AUTO_3742 ) ( CLEAR ?AUTO_3743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3743 ?AUTO_3742 )
      ( MAKE-ON ?AUTO_3738 ?AUTO_3739 )
      ( MAKE-ON-VERIFY ?AUTO_3738 ?AUTO_3739 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3744 - BLOCK
      ?AUTO_3745 - BLOCK
    )
    :vars
    (
      ?AUTO_3748 - BLOCK
      ?AUTO_3746 - BLOCK
      ?AUTO_3747 - BLOCK
      ?AUTO_3749 - BLOCK
      ?AUTO_3750 - BLOCK
      ?AUTO_3751 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3744 ?AUTO_3745 ) ) ( ON-TABLE ?AUTO_3744 ) ( not ( = ?AUTO_3744 ?AUTO_3748 ) ) ( not ( = ?AUTO_3744 ?AUTO_3746 ) ) ( not ( = ?AUTO_3745 ?AUTO_3748 ) ) ( not ( = ?AUTO_3745 ?AUTO_3746 ) ) ( not ( = ?AUTO_3748 ?AUTO_3746 ) ) ( CLEAR ?AUTO_3747 ) ( not ( = ?AUTO_3744 ?AUTO_3747 ) ) ( not ( = ?AUTO_3745 ?AUTO_3747 ) ) ( not ( = ?AUTO_3748 ?AUTO_3747 ) ) ( not ( = ?AUTO_3746 ?AUTO_3747 ) ) ( ON ?AUTO_3746 ?AUTO_3745 ) ( not ( = ?AUTO_3744 ?AUTO_3749 ) ) ( not ( = ?AUTO_3745 ?AUTO_3749 ) ) ( not ( = ?AUTO_3748 ?AUTO_3749 ) ) ( not ( = ?AUTO_3746 ?AUTO_3749 ) ) ( not ( = ?AUTO_3747 ?AUTO_3749 ) ) ( ON ?AUTO_3749 ?AUTO_3746 ) ( CLEAR ?AUTO_3744 ) ( ON ?AUTO_3748 ?AUTO_3749 ) ( CLEAR ?AUTO_3748 ) ( HOLDING ?AUTO_3750 ) ( CLEAR ?AUTO_3751 ) ( not ( = ?AUTO_3744 ?AUTO_3750 ) ) ( not ( = ?AUTO_3744 ?AUTO_3751 ) ) ( not ( = ?AUTO_3745 ?AUTO_3750 ) ) ( not ( = ?AUTO_3745 ?AUTO_3751 ) ) ( not ( = ?AUTO_3748 ?AUTO_3750 ) ) ( not ( = ?AUTO_3748 ?AUTO_3751 ) ) ( not ( = ?AUTO_3746 ?AUTO_3750 ) ) ( not ( = ?AUTO_3746 ?AUTO_3751 ) ) ( not ( = ?AUTO_3747 ?AUTO_3750 ) ) ( not ( = ?AUTO_3747 ?AUTO_3751 ) ) ( not ( = ?AUTO_3749 ?AUTO_3750 ) ) ( not ( = ?AUTO_3749 ?AUTO_3751 ) ) ( not ( = ?AUTO_3750 ?AUTO_3751 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3750 ?AUTO_3751 )
      ( MAKE-ON ?AUTO_3744 ?AUTO_3745 )
      ( MAKE-ON-VERIFY ?AUTO_3744 ?AUTO_3745 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3760 - BLOCK
      ?AUTO_3761 - BLOCK
    )
    :vars
    (
      ?AUTO_3764 - BLOCK
      ?AUTO_3762 - BLOCK
      ?AUTO_3765 - BLOCK
      ?AUTO_3763 - BLOCK
      ?AUTO_3767 - BLOCK
      ?AUTO_3766 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3760 ?AUTO_3761 ) ) ( ON-TABLE ?AUTO_3760 ) ( not ( = ?AUTO_3760 ?AUTO_3764 ) ) ( not ( = ?AUTO_3760 ?AUTO_3762 ) ) ( not ( = ?AUTO_3761 ?AUTO_3764 ) ) ( not ( = ?AUTO_3761 ?AUTO_3762 ) ) ( not ( = ?AUTO_3764 ?AUTO_3762 ) ) ( CLEAR ?AUTO_3765 ) ( not ( = ?AUTO_3760 ?AUTO_3765 ) ) ( not ( = ?AUTO_3761 ?AUTO_3765 ) ) ( not ( = ?AUTO_3764 ?AUTO_3765 ) ) ( not ( = ?AUTO_3762 ?AUTO_3765 ) ) ( ON ?AUTO_3762 ?AUTO_3761 ) ( not ( = ?AUTO_3760 ?AUTO_3763 ) ) ( not ( = ?AUTO_3761 ?AUTO_3763 ) ) ( not ( = ?AUTO_3764 ?AUTO_3763 ) ) ( not ( = ?AUTO_3762 ?AUTO_3763 ) ) ( not ( = ?AUTO_3765 ?AUTO_3763 ) ) ( ON ?AUTO_3763 ?AUTO_3762 ) ( ON ?AUTO_3764 ?AUTO_3763 ) ( CLEAR ?AUTO_3764 ) ( CLEAR ?AUTO_3767 ) ( not ( = ?AUTO_3760 ?AUTO_3766 ) ) ( not ( = ?AUTO_3760 ?AUTO_3767 ) ) ( not ( = ?AUTO_3761 ?AUTO_3766 ) ) ( not ( = ?AUTO_3761 ?AUTO_3767 ) ) ( not ( = ?AUTO_3764 ?AUTO_3766 ) ) ( not ( = ?AUTO_3764 ?AUTO_3767 ) ) ( not ( = ?AUTO_3762 ?AUTO_3766 ) ) ( not ( = ?AUTO_3762 ?AUTO_3767 ) ) ( not ( = ?AUTO_3765 ?AUTO_3766 ) ) ( not ( = ?AUTO_3765 ?AUTO_3767 ) ) ( not ( = ?AUTO_3763 ?AUTO_3766 ) ) ( not ( = ?AUTO_3763 ?AUTO_3767 ) ) ( not ( = ?AUTO_3766 ?AUTO_3767 ) ) ( ON ?AUTO_3766 ?AUTO_3760 ) ( CLEAR ?AUTO_3766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3766 ?AUTO_3760 )
      ( MAKE-ON ?AUTO_3760 ?AUTO_3761 )
      ( MAKE-ON-VERIFY ?AUTO_3760 ?AUTO_3761 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3768 - BLOCK
      ?AUTO_3769 - BLOCK
    )
    :vars
    (
      ?AUTO_3775 - BLOCK
      ?AUTO_3774 - BLOCK
      ?AUTO_3771 - BLOCK
      ?AUTO_3772 - BLOCK
      ?AUTO_3773 - BLOCK
      ?AUTO_3770 - BLOCK
      ?AUTO_3776 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3768 ?AUTO_3769 ) ) ( ON-TABLE ?AUTO_3768 ) ( not ( = ?AUTO_3768 ?AUTO_3775 ) ) ( not ( = ?AUTO_3768 ?AUTO_3774 ) ) ( not ( = ?AUTO_3769 ?AUTO_3775 ) ) ( not ( = ?AUTO_3769 ?AUTO_3774 ) ) ( not ( = ?AUTO_3775 ?AUTO_3774 ) ) ( CLEAR ?AUTO_3771 ) ( not ( = ?AUTO_3768 ?AUTO_3771 ) ) ( not ( = ?AUTO_3769 ?AUTO_3771 ) ) ( not ( = ?AUTO_3775 ?AUTO_3771 ) ) ( not ( = ?AUTO_3774 ?AUTO_3771 ) ) ( ON ?AUTO_3774 ?AUTO_3769 ) ( not ( = ?AUTO_3768 ?AUTO_3772 ) ) ( not ( = ?AUTO_3769 ?AUTO_3772 ) ) ( not ( = ?AUTO_3775 ?AUTO_3772 ) ) ( not ( = ?AUTO_3774 ?AUTO_3772 ) ) ( not ( = ?AUTO_3771 ?AUTO_3772 ) ) ( ON ?AUTO_3772 ?AUTO_3774 ) ( ON ?AUTO_3775 ?AUTO_3772 ) ( CLEAR ?AUTO_3775 ) ( CLEAR ?AUTO_3773 ) ( not ( = ?AUTO_3768 ?AUTO_3770 ) ) ( not ( = ?AUTO_3768 ?AUTO_3773 ) ) ( not ( = ?AUTO_3769 ?AUTO_3770 ) ) ( not ( = ?AUTO_3769 ?AUTO_3773 ) ) ( not ( = ?AUTO_3775 ?AUTO_3770 ) ) ( not ( = ?AUTO_3775 ?AUTO_3773 ) ) ( not ( = ?AUTO_3774 ?AUTO_3770 ) ) ( not ( = ?AUTO_3774 ?AUTO_3773 ) ) ( not ( = ?AUTO_3771 ?AUTO_3770 ) ) ( not ( = ?AUTO_3771 ?AUTO_3773 ) ) ( not ( = ?AUTO_3772 ?AUTO_3770 ) ) ( not ( = ?AUTO_3772 ?AUTO_3773 ) ) ( not ( = ?AUTO_3770 ?AUTO_3773 ) ) ( ON ?AUTO_3770 ?AUTO_3768 ) ( CLEAR ?AUTO_3770 ) ( HOLDING ?AUTO_3776 ) ( not ( = ?AUTO_3768 ?AUTO_3776 ) ) ( not ( = ?AUTO_3769 ?AUTO_3776 ) ) ( not ( = ?AUTO_3775 ?AUTO_3776 ) ) ( not ( = ?AUTO_3774 ?AUTO_3776 ) ) ( not ( = ?AUTO_3771 ?AUTO_3776 ) ) ( not ( = ?AUTO_3772 ?AUTO_3776 ) ) ( not ( = ?AUTO_3773 ?AUTO_3776 ) ) ( not ( = ?AUTO_3770 ?AUTO_3776 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3776 )
      ( MAKE-ON ?AUTO_3768 ?AUTO_3769 )
      ( MAKE-ON-VERIFY ?AUTO_3768 ?AUTO_3769 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3777 - BLOCK
      ?AUTO_3778 - BLOCK
    )
    :vars
    (
      ?AUTO_3780 - BLOCK
      ?AUTO_3784 - BLOCK
      ?AUTO_3785 - BLOCK
      ?AUTO_3783 - BLOCK
      ?AUTO_3782 - BLOCK
      ?AUTO_3781 - BLOCK
      ?AUTO_3779 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3777 ?AUTO_3778 ) ) ( ON-TABLE ?AUTO_3777 ) ( not ( = ?AUTO_3777 ?AUTO_3780 ) ) ( not ( = ?AUTO_3777 ?AUTO_3784 ) ) ( not ( = ?AUTO_3778 ?AUTO_3780 ) ) ( not ( = ?AUTO_3778 ?AUTO_3784 ) ) ( not ( = ?AUTO_3780 ?AUTO_3784 ) ) ( CLEAR ?AUTO_3785 ) ( not ( = ?AUTO_3777 ?AUTO_3785 ) ) ( not ( = ?AUTO_3778 ?AUTO_3785 ) ) ( not ( = ?AUTO_3780 ?AUTO_3785 ) ) ( not ( = ?AUTO_3784 ?AUTO_3785 ) ) ( ON ?AUTO_3784 ?AUTO_3778 ) ( not ( = ?AUTO_3777 ?AUTO_3783 ) ) ( not ( = ?AUTO_3778 ?AUTO_3783 ) ) ( not ( = ?AUTO_3780 ?AUTO_3783 ) ) ( not ( = ?AUTO_3784 ?AUTO_3783 ) ) ( not ( = ?AUTO_3785 ?AUTO_3783 ) ) ( ON ?AUTO_3783 ?AUTO_3784 ) ( ON ?AUTO_3780 ?AUTO_3783 ) ( CLEAR ?AUTO_3780 ) ( CLEAR ?AUTO_3782 ) ( not ( = ?AUTO_3777 ?AUTO_3781 ) ) ( not ( = ?AUTO_3777 ?AUTO_3782 ) ) ( not ( = ?AUTO_3778 ?AUTO_3781 ) ) ( not ( = ?AUTO_3778 ?AUTO_3782 ) ) ( not ( = ?AUTO_3780 ?AUTO_3781 ) ) ( not ( = ?AUTO_3780 ?AUTO_3782 ) ) ( not ( = ?AUTO_3784 ?AUTO_3781 ) ) ( not ( = ?AUTO_3784 ?AUTO_3782 ) ) ( not ( = ?AUTO_3785 ?AUTO_3781 ) ) ( not ( = ?AUTO_3785 ?AUTO_3782 ) ) ( not ( = ?AUTO_3783 ?AUTO_3781 ) ) ( not ( = ?AUTO_3783 ?AUTO_3782 ) ) ( not ( = ?AUTO_3781 ?AUTO_3782 ) ) ( ON ?AUTO_3781 ?AUTO_3777 ) ( not ( = ?AUTO_3777 ?AUTO_3779 ) ) ( not ( = ?AUTO_3778 ?AUTO_3779 ) ) ( not ( = ?AUTO_3780 ?AUTO_3779 ) ) ( not ( = ?AUTO_3784 ?AUTO_3779 ) ) ( not ( = ?AUTO_3785 ?AUTO_3779 ) ) ( not ( = ?AUTO_3783 ?AUTO_3779 ) ) ( not ( = ?AUTO_3782 ?AUTO_3779 ) ) ( not ( = ?AUTO_3781 ?AUTO_3779 ) ) ( ON ?AUTO_3779 ?AUTO_3781 ) ( CLEAR ?AUTO_3779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3779 ?AUTO_3781 )
      ( MAKE-ON ?AUTO_3777 ?AUTO_3778 )
      ( MAKE-ON-VERIFY ?AUTO_3777 ?AUTO_3778 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3786 - BLOCK
      ?AUTO_3787 - BLOCK
    )
    :vars
    (
      ?AUTO_3793 - BLOCK
      ?AUTO_3788 - BLOCK
      ?AUTO_3794 - BLOCK
      ?AUTO_3789 - BLOCK
      ?AUTO_3790 - BLOCK
      ?AUTO_3791 - BLOCK
      ?AUTO_3792 - BLOCK
      ?AUTO_3795 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3786 ?AUTO_3787 ) ) ( ON-TABLE ?AUTO_3786 ) ( not ( = ?AUTO_3786 ?AUTO_3793 ) ) ( not ( = ?AUTO_3786 ?AUTO_3788 ) ) ( not ( = ?AUTO_3787 ?AUTO_3793 ) ) ( not ( = ?AUTO_3787 ?AUTO_3788 ) ) ( not ( = ?AUTO_3793 ?AUTO_3788 ) ) ( CLEAR ?AUTO_3794 ) ( not ( = ?AUTO_3786 ?AUTO_3794 ) ) ( not ( = ?AUTO_3787 ?AUTO_3794 ) ) ( not ( = ?AUTO_3793 ?AUTO_3794 ) ) ( not ( = ?AUTO_3788 ?AUTO_3794 ) ) ( ON ?AUTO_3788 ?AUTO_3787 ) ( not ( = ?AUTO_3786 ?AUTO_3789 ) ) ( not ( = ?AUTO_3787 ?AUTO_3789 ) ) ( not ( = ?AUTO_3793 ?AUTO_3789 ) ) ( not ( = ?AUTO_3788 ?AUTO_3789 ) ) ( not ( = ?AUTO_3794 ?AUTO_3789 ) ) ( ON ?AUTO_3789 ?AUTO_3788 ) ( ON ?AUTO_3793 ?AUTO_3789 ) ( CLEAR ?AUTO_3793 ) ( CLEAR ?AUTO_3790 ) ( not ( = ?AUTO_3786 ?AUTO_3791 ) ) ( not ( = ?AUTO_3786 ?AUTO_3790 ) ) ( not ( = ?AUTO_3787 ?AUTO_3791 ) ) ( not ( = ?AUTO_3787 ?AUTO_3790 ) ) ( not ( = ?AUTO_3793 ?AUTO_3791 ) ) ( not ( = ?AUTO_3793 ?AUTO_3790 ) ) ( not ( = ?AUTO_3788 ?AUTO_3791 ) ) ( not ( = ?AUTO_3788 ?AUTO_3790 ) ) ( not ( = ?AUTO_3794 ?AUTO_3791 ) ) ( not ( = ?AUTO_3794 ?AUTO_3790 ) ) ( not ( = ?AUTO_3789 ?AUTO_3791 ) ) ( not ( = ?AUTO_3789 ?AUTO_3790 ) ) ( not ( = ?AUTO_3791 ?AUTO_3790 ) ) ( ON ?AUTO_3791 ?AUTO_3786 ) ( not ( = ?AUTO_3786 ?AUTO_3792 ) ) ( not ( = ?AUTO_3787 ?AUTO_3792 ) ) ( not ( = ?AUTO_3793 ?AUTO_3792 ) ) ( not ( = ?AUTO_3788 ?AUTO_3792 ) ) ( not ( = ?AUTO_3794 ?AUTO_3792 ) ) ( not ( = ?AUTO_3789 ?AUTO_3792 ) ) ( not ( = ?AUTO_3790 ?AUTO_3792 ) ) ( not ( = ?AUTO_3791 ?AUTO_3792 ) ) ( ON ?AUTO_3792 ?AUTO_3791 ) ( CLEAR ?AUTO_3792 ) ( HOLDING ?AUTO_3795 ) ( not ( = ?AUTO_3786 ?AUTO_3795 ) ) ( not ( = ?AUTO_3787 ?AUTO_3795 ) ) ( not ( = ?AUTO_3793 ?AUTO_3795 ) ) ( not ( = ?AUTO_3788 ?AUTO_3795 ) ) ( not ( = ?AUTO_3794 ?AUTO_3795 ) ) ( not ( = ?AUTO_3789 ?AUTO_3795 ) ) ( not ( = ?AUTO_3790 ?AUTO_3795 ) ) ( not ( = ?AUTO_3791 ?AUTO_3795 ) ) ( not ( = ?AUTO_3792 ?AUTO_3795 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3795 )
      ( MAKE-ON ?AUTO_3786 ?AUTO_3787 )
      ( MAKE-ON-VERIFY ?AUTO_3786 ?AUTO_3787 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3796 - BLOCK
      ?AUTO_3797 - BLOCK
    )
    :vars
    (
      ?AUTO_3799 - BLOCK
      ?AUTO_3801 - BLOCK
      ?AUTO_3800 - BLOCK
      ?AUTO_3798 - BLOCK
      ?AUTO_3802 - BLOCK
      ?AUTO_3804 - BLOCK
      ?AUTO_3803 - BLOCK
      ?AUTO_3805 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3796 ?AUTO_3797 ) ) ( ON-TABLE ?AUTO_3796 ) ( not ( = ?AUTO_3796 ?AUTO_3799 ) ) ( not ( = ?AUTO_3796 ?AUTO_3801 ) ) ( not ( = ?AUTO_3797 ?AUTO_3799 ) ) ( not ( = ?AUTO_3797 ?AUTO_3801 ) ) ( not ( = ?AUTO_3799 ?AUTO_3801 ) ) ( CLEAR ?AUTO_3800 ) ( not ( = ?AUTO_3796 ?AUTO_3800 ) ) ( not ( = ?AUTO_3797 ?AUTO_3800 ) ) ( not ( = ?AUTO_3799 ?AUTO_3800 ) ) ( not ( = ?AUTO_3801 ?AUTO_3800 ) ) ( ON ?AUTO_3801 ?AUTO_3797 ) ( not ( = ?AUTO_3796 ?AUTO_3798 ) ) ( not ( = ?AUTO_3797 ?AUTO_3798 ) ) ( not ( = ?AUTO_3799 ?AUTO_3798 ) ) ( not ( = ?AUTO_3801 ?AUTO_3798 ) ) ( not ( = ?AUTO_3800 ?AUTO_3798 ) ) ( ON ?AUTO_3798 ?AUTO_3801 ) ( ON ?AUTO_3799 ?AUTO_3798 ) ( CLEAR ?AUTO_3799 ) ( CLEAR ?AUTO_3802 ) ( not ( = ?AUTO_3796 ?AUTO_3804 ) ) ( not ( = ?AUTO_3796 ?AUTO_3802 ) ) ( not ( = ?AUTO_3797 ?AUTO_3804 ) ) ( not ( = ?AUTO_3797 ?AUTO_3802 ) ) ( not ( = ?AUTO_3799 ?AUTO_3804 ) ) ( not ( = ?AUTO_3799 ?AUTO_3802 ) ) ( not ( = ?AUTO_3801 ?AUTO_3804 ) ) ( not ( = ?AUTO_3801 ?AUTO_3802 ) ) ( not ( = ?AUTO_3800 ?AUTO_3804 ) ) ( not ( = ?AUTO_3800 ?AUTO_3802 ) ) ( not ( = ?AUTO_3798 ?AUTO_3804 ) ) ( not ( = ?AUTO_3798 ?AUTO_3802 ) ) ( not ( = ?AUTO_3804 ?AUTO_3802 ) ) ( ON ?AUTO_3804 ?AUTO_3796 ) ( not ( = ?AUTO_3796 ?AUTO_3803 ) ) ( not ( = ?AUTO_3797 ?AUTO_3803 ) ) ( not ( = ?AUTO_3799 ?AUTO_3803 ) ) ( not ( = ?AUTO_3801 ?AUTO_3803 ) ) ( not ( = ?AUTO_3800 ?AUTO_3803 ) ) ( not ( = ?AUTO_3798 ?AUTO_3803 ) ) ( not ( = ?AUTO_3802 ?AUTO_3803 ) ) ( not ( = ?AUTO_3804 ?AUTO_3803 ) ) ( ON ?AUTO_3803 ?AUTO_3804 ) ( not ( = ?AUTO_3796 ?AUTO_3805 ) ) ( not ( = ?AUTO_3797 ?AUTO_3805 ) ) ( not ( = ?AUTO_3799 ?AUTO_3805 ) ) ( not ( = ?AUTO_3801 ?AUTO_3805 ) ) ( not ( = ?AUTO_3800 ?AUTO_3805 ) ) ( not ( = ?AUTO_3798 ?AUTO_3805 ) ) ( not ( = ?AUTO_3802 ?AUTO_3805 ) ) ( not ( = ?AUTO_3804 ?AUTO_3805 ) ) ( not ( = ?AUTO_3803 ?AUTO_3805 ) ) ( ON ?AUTO_3805 ?AUTO_3803 ) ( CLEAR ?AUTO_3805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3805 ?AUTO_3803 )
      ( MAKE-ON ?AUTO_3796 ?AUTO_3797 )
      ( MAKE-ON-VERIFY ?AUTO_3796 ?AUTO_3797 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3806 - BLOCK
      ?AUTO_3807 - BLOCK
    )
    :vars
    (
      ?AUTO_3808 - BLOCK
      ?AUTO_3814 - BLOCK
      ?AUTO_3815 - BLOCK
      ?AUTO_3812 - BLOCK
      ?AUTO_3813 - BLOCK
      ?AUTO_3810 - BLOCK
      ?AUTO_3811 - BLOCK
      ?AUTO_3809 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3806 ?AUTO_3807 ) ) ( ON-TABLE ?AUTO_3806 ) ( not ( = ?AUTO_3806 ?AUTO_3808 ) ) ( not ( = ?AUTO_3806 ?AUTO_3814 ) ) ( not ( = ?AUTO_3807 ?AUTO_3808 ) ) ( not ( = ?AUTO_3807 ?AUTO_3814 ) ) ( not ( = ?AUTO_3808 ?AUTO_3814 ) ) ( not ( = ?AUTO_3806 ?AUTO_3815 ) ) ( not ( = ?AUTO_3807 ?AUTO_3815 ) ) ( not ( = ?AUTO_3808 ?AUTO_3815 ) ) ( not ( = ?AUTO_3814 ?AUTO_3815 ) ) ( ON ?AUTO_3814 ?AUTO_3807 ) ( not ( = ?AUTO_3806 ?AUTO_3812 ) ) ( not ( = ?AUTO_3807 ?AUTO_3812 ) ) ( not ( = ?AUTO_3808 ?AUTO_3812 ) ) ( not ( = ?AUTO_3814 ?AUTO_3812 ) ) ( not ( = ?AUTO_3815 ?AUTO_3812 ) ) ( ON ?AUTO_3812 ?AUTO_3814 ) ( ON ?AUTO_3808 ?AUTO_3812 ) ( CLEAR ?AUTO_3808 ) ( CLEAR ?AUTO_3813 ) ( not ( = ?AUTO_3806 ?AUTO_3810 ) ) ( not ( = ?AUTO_3806 ?AUTO_3813 ) ) ( not ( = ?AUTO_3807 ?AUTO_3810 ) ) ( not ( = ?AUTO_3807 ?AUTO_3813 ) ) ( not ( = ?AUTO_3808 ?AUTO_3810 ) ) ( not ( = ?AUTO_3808 ?AUTO_3813 ) ) ( not ( = ?AUTO_3814 ?AUTO_3810 ) ) ( not ( = ?AUTO_3814 ?AUTO_3813 ) ) ( not ( = ?AUTO_3815 ?AUTO_3810 ) ) ( not ( = ?AUTO_3815 ?AUTO_3813 ) ) ( not ( = ?AUTO_3812 ?AUTO_3810 ) ) ( not ( = ?AUTO_3812 ?AUTO_3813 ) ) ( not ( = ?AUTO_3810 ?AUTO_3813 ) ) ( ON ?AUTO_3810 ?AUTO_3806 ) ( not ( = ?AUTO_3806 ?AUTO_3811 ) ) ( not ( = ?AUTO_3807 ?AUTO_3811 ) ) ( not ( = ?AUTO_3808 ?AUTO_3811 ) ) ( not ( = ?AUTO_3814 ?AUTO_3811 ) ) ( not ( = ?AUTO_3815 ?AUTO_3811 ) ) ( not ( = ?AUTO_3812 ?AUTO_3811 ) ) ( not ( = ?AUTO_3813 ?AUTO_3811 ) ) ( not ( = ?AUTO_3810 ?AUTO_3811 ) ) ( ON ?AUTO_3811 ?AUTO_3810 ) ( not ( = ?AUTO_3806 ?AUTO_3809 ) ) ( not ( = ?AUTO_3807 ?AUTO_3809 ) ) ( not ( = ?AUTO_3808 ?AUTO_3809 ) ) ( not ( = ?AUTO_3814 ?AUTO_3809 ) ) ( not ( = ?AUTO_3815 ?AUTO_3809 ) ) ( not ( = ?AUTO_3812 ?AUTO_3809 ) ) ( not ( = ?AUTO_3813 ?AUTO_3809 ) ) ( not ( = ?AUTO_3810 ?AUTO_3809 ) ) ( not ( = ?AUTO_3811 ?AUTO_3809 ) ) ( ON ?AUTO_3809 ?AUTO_3811 ) ( CLEAR ?AUTO_3809 ) ( HOLDING ?AUTO_3815 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3815 )
      ( MAKE-ON ?AUTO_3806 ?AUTO_3807 )
      ( MAKE-ON-VERIFY ?AUTO_3806 ?AUTO_3807 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3816 - BLOCK
      ?AUTO_3817 - BLOCK
    )
    :vars
    (
      ?AUTO_3818 - BLOCK
      ?AUTO_3820 - BLOCK
      ?AUTO_3819 - BLOCK
      ?AUTO_3824 - BLOCK
      ?AUTO_3822 - BLOCK
      ?AUTO_3823 - BLOCK
      ?AUTO_3825 - BLOCK
      ?AUTO_3821 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3816 ?AUTO_3817 ) ) ( ON-TABLE ?AUTO_3816 ) ( not ( = ?AUTO_3816 ?AUTO_3818 ) ) ( not ( = ?AUTO_3816 ?AUTO_3820 ) ) ( not ( = ?AUTO_3817 ?AUTO_3818 ) ) ( not ( = ?AUTO_3817 ?AUTO_3820 ) ) ( not ( = ?AUTO_3818 ?AUTO_3820 ) ) ( not ( = ?AUTO_3816 ?AUTO_3819 ) ) ( not ( = ?AUTO_3817 ?AUTO_3819 ) ) ( not ( = ?AUTO_3818 ?AUTO_3819 ) ) ( not ( = ?AUTO_3820 ?AUTO_3819 ) ) ( ON ?AUTO_3820 ?AUTO_3817 ) ( not ( = ?AUTO_3816 ?AUTO_3824 ) ) ( not ( = ?AUTO_3817 ?AUTO_3824 ) ) ( not ( = ?AUTO_3818 ?AUTO_3824 ) ) ( not ( = ?AUTO_3820 ?AUTO_3824 ) ) ( not ( = ?AUTO_3819 ?AUTO_3824 ) ) ( ON ?AUTO_3824 ?AUTO_3820 ) ( ON ?AUTO_3818 ?AUTO_3824 ) ( CLEAR ?AUTO_3818 ) ( CLEAR ?AUTO_3822 ) ( not ( = ?AUTO_3816 ?AUTO_3823 ) ) ( not ( = ?AUTO_3816 ?AUTO_3822 ) ) ( not ( = ?AUTO_3817 ?AUTO_3823 ) ) ( not ( = ?AUTO_3817 ?AUTO_3822 ) ) ( not ( = ?AUTO_3818 ?AUTO_3823 ) ) ( not ( = ?AUTO_3818 ?AUTO_3822 ) ) ( not ( = ?AUTO_3820 ?AUTO_3823 ) ) ( not ( = ?AUTO_3820 ?AUTO_3822 ) ) ( not ( = ?AUTO_3819 ?AUTO_3823 ) ) ( not ( = ?AUTO_3819 ?AUTO_3822 ) ) ( not ( = ?AUTO_3824 ?AUTO_3823 ) ) ( not ( = ?AUTO_3824 ?AUTO_3822 ) ) ( not ( = ?AUTO_3823 ?AUTO_3822 ) ) ( ON ?AUTO_3823 ?AUTO_3816 ) ( not ( = ?AUTO_3816 ?AUTO_3825 ) ) ( not ( = ?AUTO_3817 ?AUTO_3825 ) ) ( not ( = ?AUTO_3818 ?AUTO_3825 ) ) ( not ( = ?AUTO_3820 ?AUTO_3825 ) ) ( not ( = ?AUTO_3819 ?AUTO_3825 ) ) ( not ( = ?AUTO_3824 ?AUTO_3825 ) ) ( not ( = ?AUTO_3822 ?AUTO_3825 ) ) ( not ( = ?AUTO_3823 ?AUTO_3825 ) ) ( ON ?AUTO_3825 ?AUTO_3823 ) ( not ( = ?AUTO_3816 ?AUTO_3821 ) ) ( not ( = ?AUTO_3817 ?AUTO_3821 ) ) ( not ( = ?AUTO_3818 ?AUTO_3821 ) ) ( not ( = ?AUTO_3820 ?AUTO_3821 ) ) ( not ( = ?AUTO_3819 ?AUTO_3821 ) ) ( not ( = ?AUTO_3824 ?AUTO_3821 ) ) ( not ( = ?AUTO_3822 ?AUTO_3821 ) ) ( not ( = ?AUTO_3823 ?AUTO_3821 ) ) ( not ( = ?AUTO_3825 ?AUTO_3821 ) ) ( ON ?AUTO_3821 ?AUTO_3825 ) ( ON ?AUTO_3819 ?AUTO_3821 ) ( CLEAR ?AUTO_3819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3819 ?AUTO_3821 )
      ( MAKE-ON ?AUTO_3816 ?AUTO_3817 )
      ( MAKE-ON-VERIFY ?AUTO_3816 ?AUTO_3817 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3827 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3827 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3827 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3827 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3828 - BLOCK
    )
    :vars
    (
      ?AUTO_3829 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3828 ?AUTO_3829 ) ( CLEAR ?AUTO_3828 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3828 ?AUTO_3829 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3828 ?AUTO_3829 )
      ( MAKE-ON-TABLE ?AUTO_3828 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3828 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3832 - BLOCK
      ?AUTO_3833 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3832 ) ( CLEAR ?AUTO_3833 ) ( not ( = ?AUTO_3832 ?AUTO_3833 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3832 ?AUTO_3833 )
      ( MAKE-ON-VERIFY ?AUTO_3832 ?AUTO_3833 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3834 - BLOCK
      ?AUTO_3835 - BLOCK
    )
    :vars
    (
      ?AUTO_3836 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3835 ) ( not ( = ?AUTO_3834 ?AUTO_3835 ) ) ( ON ?AUTO_3834 ?AUTO_3836 ) ( CLEAR ?AUTO_3834 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3834 ?AUTO_3836 ) ) ( not ( = ?AUTO_3835 ?AUTO_3836 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3834 ?AUTO_3836 )
      ( MAKE-ON ?AUTO_3834 ?AUTO_3835 )
      ( MAKE-ON-VERIFY ?AUTO_3834 ?AUTO_3835 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3837 - BLOCK
      ?AUTO_3838 - BLOCK
    )
    :vars
    (
      ?AUTO_3839 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3837 ?AUTO_3838 ) ) ( ON ?AUTO_3837 ?AUTO_3839 ) ( CLEAR ?AUTO_3837 ) ( not ( = ?AUTO_3837 ?AUTO_3839 ) ) ( not ( = ?AUTO_3838 ?AUTO_3839 ) ) ( HOLDING ?AUTO_3838 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3838 )
      ( MAKE-ON ?AUTO_3837 ?AUTO_3838 )
      ( MAKE-ON-VERIFY ?AUTO_3837 ?AUTO_3838 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3843 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3843 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3843 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3843 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3844 - BLOCK
    )
    :vars
    (
      ?AUTO_3845 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3844 ?AUTO_3845 ) ( CLEAR ?AUTO_3844 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3844 ?AUTO_3845 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3844 ?AUTO_3845 )
      ( MAKE-ON-TABLE ?AUTO_3844 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3844 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3846 - BLOCK
    )
    :vars
    (
      ?AUTO_3847 - BLOCK
      ?AUTO_3848 - BLOCK
      ?AUTO_3849 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3846 ?AUTO_3847 ) ( CLEAR ?AUTO_3846 ) ( not ( = ?AUTO_3846 ?AUTO_3847 ) ) ( HOLDING ?AUTO_3848 ) ( CLEAR ?AUTO_3849 ) ( not ( = ?AUTO_3846 ?AUTO_3848 ) ) ( not ( = ?AUTO_3846 ?AUTO_3849 ) ) ( not ( = ?AUTO_3847 ?AUTO_3848 ) ) ( not ( = ?AUTO_3847 ?AUTO_3849 ) ) ( not ( = ?AUTO_3848 ?AUTO_3849 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3848 ?AUTO_3849 )
      ( MAKE-ON-TABLE ?AUTO_3846 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3846 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3852 - BLOCK
    )
    :vars
    (
      ?AUTO_3855 - BLOCK
      ?AUTO_3853 - BLOCK
      ?AUTO_3854 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3852 ?AUTO_3855 ) ( not ( = ?AUTO_3852 ?AUTO_3855 ) ) ( CLEAR ?AUTO_3853 ) ( not ( = ?AUTO_3852 ?AUTO_3854 ) ) ( not ( = ?AUTO_3852 ?AUTO_3853 ) ) ( not ( = ?AUTO_3855 ?AUTO_3854 ) ) ( not ( = ?AUTO_3855 ?AUTO_3853 ) ) ( not ( = ?AUTO_3854 ?AUTO_3853 ) ) ( ON ?AUTO_3854 ?AUTO_3852 ) ( CLEAR ?AUTO_3854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3854 ?AUTO_3852 )
      ( MAKE-ON-TABLE ?AUTO_3852 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3852 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3858 - BLOCK
      ?AUTO_3859 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3858 ) ( CLEAR ?AUTO_3859 ) ( not ( = ?AUTO_3858 ?AUTO_3859 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3858 ?AUTO_3859 )
      ( MAKE-ON-VERIFY ?AUTO_3858 ?AUTO_3859 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3860 - BLOCK
      ?AUTO_3861 - BLOCK
    )
    :vars
    (
      ?AUTO_3862 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3861 ) ( not ( = ?AUTO_3860 ?AUTO_3861 ) ) ( ON ?AUTO_3860 ?AUTO_3862 ) ( CLEAR ?AUTO_3860 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3860 ?AUTO_3862 ) ) ( not ( = ?AUTO_3861 ?AUTO_3862 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3860 ?AUTO_3862 )
      ( MAKE-ON ?AUTO_3860 ?AUTO_3861 )
      ( MAKE-ON-VERIFY ?AUTO_3860 ?AUTO_3861 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3863 - BLOCK
      ?AUTO_3864 - BLOCK
    )
    :vars
    (
      ?AUTO_3865 - BLOCK
      ?AUTO_3866 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3864 ) ( not ( = ?AUTO_3863 ?AUTO_3864 ) ) ( ON ?AUTO_3863 ?AUTO_3865 ) ( CLEAR ?AUTO_3863 ) ( not ( = ?AUTO_3863 ?AUTO_3865 ) ) ( not ( = ?AUTO_3864 ?AUTO_3865 ) ) ( HOLDING ?AUTO_3866 ) ( not ( = ?AUTO_3863 ?AUTO_3866 ) ) ( not ( = ?AUTO_3864 ?AUTO_3866 ) ) ( not ( = ?AUTO_3865 ?AUTO_3866 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3866 )
      ( MAKE-ON ?AUTO_3863 ?AUTO_3864 )
      ( MAKE-ON-VERIFY ?AUTO_3863 ?AUTO_3864 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3867 - BLOCK
      ?AUTO_3868 - BLOCK
    )
    :vars
    (
      ?AUTO_3869 - BLOCK
      ?AUTO_3870 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3868 ) ( not ( = ?AUTO_3867 ?AUTO_3868 ) ) ( ON ?AUTO_3867 ?AUTO_3869 ) ( not ( = ?AUTO_3867 ?AUTO_3869 ) ) ( not ( = ?AUTO_3868 ?AUTO_3869 ) ) ( not ( = ?AUTO_3867 ?AUTO_3870 ) ) ( not ( = ?AUTO_3868 ?AUTO_3870 ) ) ( not ( = ?AUTO_3869 ?AUTO_3870 ) ) ( ON ?AUTO_3870 ?AUTO_3867 ) ( CLEAR ?AUTO_3870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3870 ?AUTO_3867 )
      ( MAKE-ON ?AUTO_3867 ?AUTO_3868 )
      ( MAKE-ON-VERIFY ?AUTO_3867 ?AUTO_3868 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3871 - BLOCK
      ?AUTO_3872 - BLOCK
    )
    :vars
    (
      ?AUTO_3873 - BLOCK
      ?AUTO_3874 - BLOCK
      ?AUTO_3875 - BLOCK
      ?AUTO_3876 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3872 ) ( not ( = ?AUTO_3871 ?AUTO_3872 ) ) ( ON ?AUTO_3871 ?AUTO_3873 ) ( not ( = ?AUTO_3871 ?AUTO_3873 ) ) ( not ( = ?AUTO_3872 ?AUTO_3873 ) ) ( not ( = ?AUTO_3871 ?AUTO_3874 ) ) ( not ( = ?AUTO_3872 ?AUTO_3874 ) ) ( not ( = ?AUTO_3873 ?AUTO_3874 ) ) ( ON ?AUTO_3874 ?AUTO_3871 ) ( CLEAR ?AUTO_3874 ) ( HOLDING ?AUTO_3875 ) ( CLEAR ?AUTO_3876 ) ( not ( = ?AUTO_3871 ?AUTO_3875 ) ) ( not ( = ?AUTO_3871 ?AUTO_3876 ) ) ( not ( = ?AUTO_3872 ?AUTO_3875 ) ) ( not ( = ?AUTO_3872 ?AUTO_3876 ) ) ( not ( = ?AUTO_3873 ?AUTO_3875 ) ) ( not ( = ?AUTO_3873 ?AUTO_3876 ) ) ( not ( = ?AUTO_3874 ?AUTO_3875 ) ) ( not ( = ?AUTO_3874 ?AUTO_3876 ) ) ( not ( = ?AUTO_3875 ?AUTO_3876 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3875 ?AUTO_3876 )
      ( MAKE-ON ?AUTO_3871 ?AUTO_3872 )
      ( MAKE-ON-VERIFY ?AUTO_3871 ?AUTO_3872 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3877 - BLOCK
      ?AUTO_3878 - BLOCK
    )
    :vars
    (
      ?AUTO_3879 - BLOCK
      ?AUTO_3880 - BLOCK
      ?AUTO_3882 - BLOCK
      ?AUTO_3881 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3877 ?AUTO_3878 ) ) ( ON ?AUTO_3877 ?AUTO_3879 ) ( not ( = ?AUTO_3877 ?AUTO_3879 ) ) ( not ( = ?AUTO_3878 ?AUTO_3879 ) ) ( not ( = ?AUTO_3877 ?AUTO_3880 ) ) ( not ( = ?AUTO_3878 ?AUTO_3880 ) ) ( not ( = ?AUTO_3879 ?AUTO_3880 ) ) ( ON ?AUTO_3880 ?AUTO_3877 ) ( CLEAR ?AUTO_3880 ) ( CLEAR ?AUTO_3882 ) ( not ( = ?AUTO_3877 ?AUTO_3881 ) ) ( not ( = ?AUTO_3877 ?AUTO_3882 ) ) ( not ( = ?AUTO_3878 ?AUTO_3881 ) ) ( not ( = ?AUTO_3878 ?AUTO_3882 ) ) ( not ( = ?AUTO_3879 ?AUTO_3881 ) ) ( not ( = ?AUTO_3879 ?AUTO_3882 ) ) ( not ( = ?AUTO_3880 ?AUTO_3881 ) ) ( not ( = ?AUTO_3880 ?AUTO_3882 ) ) ( not ( = ?AUTO_3881 ?AUTO_3882 ) ) ( ON ?AUTO_3881 ?AUTO_3878 ) ( CLEAR ?AUTO_3881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3881 ?AUTO_3878 )
      ( MAKE-ON ?AUTO_3877 ?AUTO_3878 )
      ( MAKE-ON-VERIFY ?AUTO_3877 ?AUTO_3878 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3883 - BLOCK
      ?AUTO_3884 - BLOCK
    )
    :vars
    (
      ?AUTO_3885 - BLOCK
      ?AUTO_3888 - BLOCK
      ?AUTO_3887 - BLOCK
      ?AUTO_3886 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3883 ?AUTO_3884 ) ) ( ON ?AUTO_3883 ?AUTO_3885 ) ( not ( = ?AUTO_3883 ?AUTO_3885 ) ) ( not ( = ?AUTO_3884 ?AUTO_3885 ) ) ( not ( = ?AUTO_3883 ?AUTO_3888 ) ) ( not ( = ?AUTO_3884 ?AUTO_3888 ) ) ( not ( = ?AUTO_3885 ?AUTO_3888 ) ) ( ON ?AUTO_3888 ?AUTO_3883 ) ( CLEAR ?AUTO_3888 ) ( not ( = ?AUTO_3883 ?AUTO_3887 ) ) ( not ( = ?AUTO_3883 ?AUTO_3886 ) ) ( not ( = ?AUTO_3884 ?AUTO_3887 ) ) ( not ( = ?AUTO_3884 ?AUTO_3886 ) ) ( not ( = ?AUTO_3885 ?AUTO_3887 ) ) ( not ( = ?AUTO_3885 ?AUTO_3886 ) ) ( not ( = ?AUTO_3888 ?AUTO_3887 ) ) ( not ( = ?AUTO_3888 ?AUTO_3886 ) ) ( not ( = ?AUTO_3887 ?AUTO_3886 ) ) ( ON ?AUTO_3887 ?AUTO_3884 ) ( CLEAR ?AUTO_3887 ) ( HOLDING ?AUTO_3886 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3886 )
      ( MAKE-ON ?AUTO_3883 ?AUTO_3884 )
      ( MAKE-ON-VERIFY ?AUTO_3883 ?AUTO_3884 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3889 - BLOCK
      ?AUTO_3890 - BLOCK
    )
    :vars
    (
      ?AUTO_3893 - BLOCK
      ?AUTO_3892 - BLOCK
      ?AUTO_3894 - BLOCK
      ?AUTO_3891 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3889 ?AUTO_3890 ) ) ( ON ?AUTO_3889 ?AUTO_3893 ) ( not ( = ?AUTO_3889 ?AUTO_3893 ) ) ( not ( = ?AUTO_3890 ?AUTO_3893 ) ) ( not ( = ?AUTO_3889 ?AUTO_3892 ) ) ( not ( = ?AUTO_3890 ?AUTO_3892 ) ) ( not ( = ?AUTO_3893 ?AUTO_3892 ) ) ( ON ?AUTO_3892 ?AUTO_3889 ) ( not ( = ?AUTO_3889 ?AUTO_3894 ) ) ( not ( = ?AUTO_3889 ?AUTO_3891 ) ) ( not ( = ?AUTO_3890 ?AUTO_3894 ) ) ( not ( = ?AUTO_3890 ?AUTO_3891 ) ) ( not ( = ?AUTO_3893 ?AUTO_3894 ) ) ( not ( = ?AUTO_3893 ?AUTO_3891 ) ) ( not ( = ?AUTO_3892 ?AUTO_3894 ) ) ( not ( = ?AUTO_3892 ?AUTO_3891 ) ) ( not ( = ?AUTO_3894 ?AUTO_3891 ) ) ( ON ?AUTO_3894 ?AUTO_3890 ) ( CLEAR ?AUTO_3894 ) ( ON ?AUTO_3891 ?AUTO_3892 ) ( CLEAR ?AUTO_3891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3891 ?AUTO_3892 )
      ( MAKE-ON ?AUTO_3889 ?AUTO_3890 )
      ( MAKE-ON-VERIFY ?AUTO_3889 ?AUTO_3890 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3897 - BLOCK
      ?AUTO_3898 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3897 ) ( CLEAR ?AUTO_3898 ) ( not ( = ?AUTO_3897 ?AUTO_3898 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3897 ?AUTO_3898 )
      ( MAKE-ON-VERIFY ?AUTO_3897 ?AUTO_3898 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3899 - BLOCK
      ?AUTO_3900 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3900 ) ( not ( = ?AUTO_3899 ?AUTO_3900 ) ) ( ON-TABLE ?AUTO_3899 ) ( CLEAR ?AUTO_3899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3899 )
      ( MAKE-ON ?AUTO_3899 ?AUTO_3900 )
      ( MAKE-ON-VERIFY ?AUTO_3899 ?AUTO_3900 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3901 - BLOCK
      ?AUTO_3902 - BLOCK
    )
    :vars
    (
      ?AUTO_3903 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3901 ?AUTO_3902 ) ) ( ON-TABLE ?AUTO_3901 ) ( CLEAR ?AUTO_3901 ) ( HOLDING ?AUTO_3902 ) ( CLEAR ?AUTO_3903 ) ( not ( = ?AUTO_3901 ?AUTO_3903 ) ) ( not ( = ?AUTO_3902 ?AUTO_3903 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3902 ?AUTO_3903 )
      ( MAKE-ON ?AUTO_3901 ?AUTO_3902 )
      ( MAKE-ON-VERIFY ?AUTO_3901 ?AUTO_3902 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3904 - BLOCK
      ?AUTO_3905 - BLOCK
    )
    :vars
    (
      ?AUTO_3906 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3904 ?AUTO_3905 ) ) ( ON-TABLE ?AUTO_3904 ) ( CLEAR ?AUTO_3906 ) ( not ( = ?AUTO_3904 ?AUTO_3906 ) ) ( not ( = ?AUTO_3905 ?AUTO_3906 ) ) ( ON ?AUTO_3905 ?AUTO_3904 ) ( CLEAR ?AUTO_3905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3905 ?AUTO_3904 )
      ( MAKE-ON ?AUTO_3904 ?AUTO_3905 )
      ( MAKE-ON-VERIFY ?AUTO_3904 ?AUTO_3905 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3907 - BLOCK
      ?AUTO_3908 - BLOCK
    )
    :vars
    (
      ?AUTO_3909 - BLOCK
      ?AUTO_3910 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3907 ?AUTO_3908 ) ) ( ON-TABLE ?AUTO_3907 ) ( CLEAR ?AUTO_3909 ) ( not ( = ?AUTO_3907 ?AUTO_3909 ) ) ( not ( = ?AUTO_3908 ?AUTO_3909 ) ) ( ON ?AUTO_3908 ?AUTO_3907 ) ( CLEAR ?AUTO_3908 ) ( HOLDING ?AUTO_3910 ) ( not ( = ?AUTO_3907 ?AUTO_3910 ) ) ( not ( = ?AUTO_3908 ?AUTO_3910 ) ) ( not ( = ?AUTO_3909 ?AUTO_3910 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3910 )
      ( MAKE-ON ?AUTO_3907 ?AUTO_3908 )
      ( MAKE-ON-VERIFY ?AUTO_3907 ?AUTO_3908 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3911 - BLOCK
      ?AUTO_3912 - BLOCK
    )
    :vars
    (
      ?AUTO_3913 - BLOCK
      ?AUTO_3914 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3911 ?AUTO_3912 ) ) ( ON-TABLE ?AUTO_3911 ) ( CLEAR ?AUTO_3913 ) ( not ( = ?AUTO_3911 ?AUTO_3913 ) ) ( not ( = ?AUTO_3912 ?AUTO_3913 ) ) ( ON ?AUTO_3912 ?AUTO_3911 ) ( not ( = ?AUTO_3911 ?AUTO_3914 ) ) ( not ( = ?AUTO_3912 ?AUTO_3914 ) ) ( not ( = ?AUTO_3913 ?AUTO_3914 ) ) ( ON ?AUTO_3914 ?AUTO_3912 ) ( CLEAR ?AUTO_3914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3914 ?AUTO_3912 )
      ( MAKE-ON ?AUTO_3911 ?AUTO_3912 )
      ( MAKE-ON-VERIFY ?AUTO_3911 ?AUTO_3912 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3915 - BLOCK
      ?AUTO_3916 - BLOCK
    )
    :vars
    (
      ?AUTO_3917 - BLOCK
      ?AUTO_3918 - BLOCK
      ?AUTO_3919 - BLOCK
      ?AUTO_3920 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3915 ?AUTO_3916 ) ) ( ON-TABLE ?AUTO_3915 ) ( CLEAR ?AUTO_3917 ) ( not ( = ?AUTO_3915 ?AUTO_3917 ) ) ( not ( = ?AUTO_3916 ?AUTO_3917 ) ) ( ON ?AUTO_3916 ?AUTO_3915 ) ( not ( = ?AUTO_3915 ?AUTO_3918 ) ) ( not ( = ?AUTO_3916 ?AUTO_3918 ) ) ( not ( = ?AUTO_3917 ?AUTO_3918 ) ) ( ON ?AUTO_3918 ?AUTO_3916 ) ( CLEAR ?AUTO_3918 ) ( HOLDING ?AUTO_3919 ) ( CLEAR ?AUTO_3920 ) ( not ( = ?AUTO_3915 ?AUTO_3919 ) ) ( not ( = ?AUTO_3915 ?AUTO_3920 ) ) ( not ( = ?AUTO_3916 ?AUTO_3919 ) ) ( not ( = ?AUTO_3916 ?AUTO_3920 ) ) ( not ( = ?AUTO_3917 ?AUTO_3919 ) ) ( not ( = ?AUTO_3917 ?AUTO_3920 ) ) ( not ( = ?AUTO_3918 ?AUTO_3919 ) ) ( not ( = ?AUTO_3918 ?AUTO_3920 ) ) ( not ( = ?AUTO_3919 ?AUTO_3920 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3919 ?AUTO_3920 )
      ( MAKE-ON ?AUTO_3915 ?AUTO_3916 )
      ( MAKE-ON-VERIFY ?AUTO_3915 ?AUTO_3916 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3923 - BLOCK
      ?AUTO_3924 - BLOCK
    )
    :vars
    (
      ?AUTO_3925 - BLOCK
      ?AUTO_3926 - BLOCK
      ?AUTO_3927 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3923 ?AUTO_3924 ) ) ( ON-TABLE ?AUTO_3923 ) ( CLEAR ?AUTO_3925 ) ( not ( = ?AUTO_3923 ?AUTO_3925 ) ) ( not ( = ?AUTO_3924 ?AUTO_3925 ) ) ( ON ?AUTO_3924 ?AUTO_3923 ) ( not ( = ?AUTO_3923 ?AUTO_3926 ) ) ( not ( = ?AUTO_3924 ?AUTO_3926 ) ) ( not ( = ?AUTO_3925 ?AUTO_3926 ) ) ( ON ?AUTO_3926 ?AUTO_3924 ) ( CLEAR ?AUTO_3926 ) ( HOLDING ?AUTO_3927 ) ( not ( = ?AUTO_3923 ?AUTO_3927 ) ) ( not ( = ?AUTO_3924 ?AUTO_3927 ) ) ( not ( = ?AUTO_3925 ?AUTO_3927 ) ) ( not ( = ?AUTO_3926 ?AUTO_3927 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3927 )
      ( MAKE-ON ?AUTO_3923 ?AUTO_3924 )
      ( MAKE-ON-VERIFY ?AUTO_3923 ?AUTO_3924 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3928 - BLOCK
      ?AUTO_3929 - BLOCK
    )
    :vars
    (
      ?AUTO_3931 - BLOCK
      ?AUTO_3930 - BLOCK
      ?AUTO_3932 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3928 ?AUTO_3929 ) ) ( ON-TABLE ?AUTO_3928 ) ( CLEAR ?AUTO_3931 ) ( not ( = ?AUTO_3928 ?AUTO_3931 ) ) ( not ( = ?AUTO_3929 ?AUTO_3931 ) ) ( ON ?AUTO_3929 ?AUTO_3928 ) ( not ( = ?AUTO_3928 ?AUTO_3930 ) ) ( not ( = ?AUTO_3929 ?AUTO_3930 ) ) ( not ( = ?AUTO_3931 ?AUTO_3930 ) ) ( ON ?AUTO_3930 ?AUTO_3929 ) ( not ( = ?AUTO_3928 ?AUTO_3932 ) ) ( not ( = ?AUTO_3929 ?AUTO_3932 ) ) ( not ( = ?AUTO_3931 ?AUTO_3932 ) ) ( not ( = ?AUTO_3930 ?AUTO_3932 ) ) ( ON ?AUTO_3932 ?AUTO_3930 ) ( CLEAR ?AUTO_3932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3932 ?AUTO_3930 )
      ( MAKE-ON ?AUTO_3928 ?AUTO_3929 )
      ( MAKE-ON-VERIFY ?AUTO_3928 ?AUTO_3929 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3935 - BLOCK
      ?AUTO_3936 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3935 ) ( CLEAR ?AUTO_3936 ) ( not ( = ?AUTO_3935 ?AUTO_3936 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3935 ?AUTO_3936 )
      ( MAKE-ON-VERIFY ?AUTO_3935 ?AUTO_3936 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3937 - BLOCK
      ?AUTO_3938 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3938 ) ( not ( = ?AUTO_3937 ?AUTO_3938 ) ) ( ON-TABLE ?AUTO_3937 ) ( CLEAR ?AUTO_3937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3937 )
      ( MAKE-ON ?AUTO_3937 ?AUTO_3938 )
      ( MAKE-ON-VERIFY ?AUTO_3937 ?AUTO_3938 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3939 - BLOCK
      ?AUTO_3940 - BLOCK
    )
    :vars
    (
      ?AUTO_3941 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3939 ?AUTO_3940 ) ) ( ON-TABLE ?AUTO_3939 ) ( CLEAR ?AUTO_3939 ) ( HOLDING ?AUTO_3940 ) ( CLEAR ?AUTO_3941 ) ( not ( = ?AUTO_3939 ?AUTO_3941 ) ) ( not ( = ?AUTO_3940 ?AUTO_3941 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3940 ?AUTO_3941 )
      ( MAKE-ON ?AUTO_3939 ?AUTO_3940 )
      ( MAKE-ON-VERIFY ?AUTO_3939 ?AUTO_3940 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3944 - BLOCK
      ?AUTO_3945 - BLOCK
    )
    :vars
    (
      ?AUTO_3946 - BLOCK
      ?AUTO_3947 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3945 ) ( not ( = ?AUTO_3944 ?AUTO_3945 ) ) ( ON-TABLE ?AUTO_3944 ) ( CLEAR ?AUTO_3944 ) ( HOLDING ?AUTO_3946 ) ( CLEAR ?AUTO_3947 ) ( not ( = ?AUTO_3944 ?AUTO_3946 ) ) ( not ( = ?AUTO_3944 ?AUTO_3947 ) ) ( not ( = ?AUTO_3945 ?AUTO_3946 ) ) ( not ( = ?AUTO_3945 ?AUTO_3947 ) ) ( not ( = ?AUTO_3946 ?AUTO_3947 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3946 ?AUTO_3947 )
      ( MAKE-ON ?AUTO_3944 ?AUTO_3945 )
      ( MAKE-ON-VERIFY ?AUTO_3944 ?AUTO_3945 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3948 - BLOCK
      ?AUTO_3949 - BLOCK
    )
    :vars
    (
      ?AUTO_3950 - BLOCK
      ?AUTO_3951 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3948 ?AUTO_3949 ) ) ( ON-TABLE ?AUTO_3948 ) ( CLEAR ?AUTO_3948 ) ( CLEAR ?AUTO_3950 ) ( not ( = ?AUTO_3948 ?AUTO_3951 ) ) ( not ( = ?AUTO_3948 ?AUTO_3950 ) ) ( not ( = ?AUTO_3949 ?AUTO_3951 ) ) ( not ( = ?AUTO_3949 ?AUTO_3950 ) ) ( not ( = ?AUTO_3951 ?AUTO_3950 ) ) ( ON ?AUTO_3951 ?AUTO_3949 ) ( CLEAR ?AUTO_3951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3951 ?AUTO_3949 )
      ( MAKE-ON ?AUTO_3948 ?AUTO_3949 )
      ( MAKE-ON-VERIFY ?AUTO_3948 ?AUTO_3949 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3952 - BLOCK
      ?AUTO_3953 - BLOCK
    )
    :vars
    (
      ?AUTO_3955 - BLOCK
      ?AUTO_3954 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3952 ?AUTO_3953 ) ) ( CLEAR ?AUTO_3955 ) ( not ( = ?AUTO_3952 ?AUTO_3954 ) ) ( not ( = ?AUTO_3952 ?AUTO_3955 ) ) ( not ( = ?AUTO_3953 ?AUTO_3954 ) ) ( not ( = ?AUTO_3953 ?AUTO_3955 ) ) ( not ( = ?AUTO_3954 ?AUTO_3955 ) ) ( ON ?AUTO_3954 ?AUTO_3953 ) ( CLEAR ?AUTO_3954 ) ( HOLDING ?AUTO_3952 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3952 )
      ( MAKE-ON ?AUTO_3952 ?AUTO_3953 )
      ( MAKE-ON-VERIFY ?AUTO_3952 ?AUTO_3953 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3956 - BLOCK
      ?AUTO_3957 - BLOCK
    )
    :vars
    (
      ?AUTO_3958 - BLOCK
      ?AUTO_3959 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3956 ?AUTO_3957 ) ) ( CLEAR ?AUTO_3958 ) ( not ( = ?AUTO_3956 ?AUTO_3959 ) ) ( not ( = ?AUTO_3956 ?AUTO_3958 ) ) ( not ( = ?AUTO_3957 ?AUTO_3959 ) ) ( not ( = ?AUTO_3957 ?AUTO_3958 ) ) ( not ( = ?AUTO_3959 ?AUTO_3958 ) ) ( ON ?AUTO_3959 ?AUTO_3957 ) ( ON ?AUTO_3956 ?AUTO_3959 ) ( CLEAR ?AUTO_3956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3956 ?AUTO_3959 )
      ( MAKE-ON ?AUTO_3956 ?AUTO_3957 )
      ( MAKE-ON-VERIFY ?AUTO_3956 ?AUTO_3957 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3960 - BLOCK
      ?AUTO_3961 - BLOCK
    )
    :vars
    (
      ?AUTO_3962 - BLOCK
      ?AUTO_3963 - BLOCK
      ?AUTO_3964 - BLOCK
      ?AUTO_3965 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3960 ?AUTO_3961 ) ) ( CLEAR ?AUTO_3962 ) ( not ( = ?AUTO_3960 ?AUTO_3963 ) ) ( not ( = ?AUTO_3960 ?AUTO_3962 ) ) ( not ( = ?AUTO_3961 ?AUTO_3963 ) ) ( not ( = ?AUTO_3961 ?AUTO_3962 ) ) ( not ( = ?AUTO_3963 ?AUTO_3962 ) ) ( ON ?AUTO_3963 ?AUTO_3961 ) ( ON ?AUTO_3960 ?AUTO_3963 ) ( CLEAR ?AUTO_3960 ) ( HOLDING ?AUTO_3964 ) ( CLEAR ?AUTO_3965 ) ( not ( = ?AUTO_3960 ?AUTO_3964 ) ) ( not ( = ?AUTO_3960 ?AUTO_3965 ) ) ( not ( = ?AUTO_3961 ?AUTO_3964 ) ) ( not ( = ?AUTO_3961 ?AUTO_3965 ) ) ( not ( = ?AUTO_3962 ?AUTO_3964 ) ) ( not ( = ?AUTO_3962 ?AUTO_3965 ) ) ( not ( = ?AUTO_3963 ?AUTO_3964 ) ) ( not ( = ?AUTO_3963 ?AUTO_3965 ) ) ( not ( = ?AUTO_3964 ?AUTO_3965 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3964 ?AUTO_3965 )
      ( MAKE-ON ?AUTO_3960 ?AUTO_3961 )
      ( MAKE-ON-VERIFY ?AUTO_3960 ?AUTO_3961 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3968 - BLOCK
      ?AUTO_3969 - BLOCK
    )
    :vars
    (
      ?AUTO_3970 - BLOCK
      ?AUTO_3971 - BLOCK
      ?AUTO_3972 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3968 ?AUTO_3969 ) ) ( CLEAR ?AUTO_3970 ) ( not ( = ?AUTO_3968 ?AUTO_3971 ) ) ( not ( = ?AUTO_3968 ?AUTO_3970 ) ) ( not ( = ?AUTO_3969 ?AUTO_3971 ) ) ( not ( = ?AUTO_3969 ?AUTO_3970 ) ) ( not ( = ?AUTO_3971 ?AUTO_3970 ) ) ( ON ?AUTO_3971 ?AUTO_3969 ) ( ON ?AUTO_3968 ?AUTO_3971 ) ( CLEAR ?AUTO_3968 ) ( HOLDING ?AUTO_3972 ) ( not ( = ?AUTO_3968 ?AUTO_3972 ) ) ( not ( = ?AUTO_3969 ?AUTO_3972 ) ) ( not ( = ?AUTO_3970 ?AUTO_3972 ) ) ( not ( = ?AUTO_3971 ?AUTO_3972 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3972 )
      ( MAKE-ON ?AUTO_3968 ?AUTO_3969 )
      ( MAKE-ON-VERIFY ?AUTO_3968 ?AUTO_3969 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3973 - BLOCK
      ?AUTO_3974 - BLOCK
    )
    :vars
    (
      ?AUTO_3975 - BLOCK
      ?AUTO_3977 - BLOCK
      ?AUTO_3976 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3973 ?AUTO_3974 ) ) ( CLEAR ?AUTO_3975 ) ( not ( = ?AUTO_3973 ?AUTO_3977 ) ) ( not ( = ?AUTO_3973 ?AUTO_3975 ) ) ( not ( = ?AUTO_3974 ?AUTO_3977 ) ) ( not ( = ?AUTO_3974 ?AUTO_3975 ) ) ( not ( = ?AUTO_3977 ?AUTO_3975 ) ) ( ON ?AUTO_3977 ?AUTO_3974 ) ( ON ?AUTO_3973 ?AUTO_3977 ) ( not ( = ?AUTO_3973 ?AUTO_3976 ) ) ( not ( = ?AUTO_3974 ?AUTO_3976 ) ) ( not ( = ?AUTO_3975 ?AUTO_3976 ) ) ( not ( = ?AUTO_3977 ?AUTO_3976 ) ) ( ON ?AUTO_3976 ?AUTO_3973 ) ( CLEAR ?AUTO_3976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3976 ?AUTO_3973 )
      ( MAKE-ON ?AUTO_3973 ?AUTO_3974 )
      ( MAKE-ON-VERIFY ?AUTO_3973 ?AUTO_3974 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3979 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3979 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3979 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3979 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3980 - BLOCK
    )
    :vars
    (
      ?AUTO_3981 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3980 ?AUTO_3981 ) ( CLEAR ?AUTO_3980 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3980 ?AUTO_3981 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3980 ?AUTO_3981 )
      ( MAKE-ON-TABLE ?AUTO_3980 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3980 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3983 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3983 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3983 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3983 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3984 - BLOCK
    )
    :vars
    (
      ?AUTO_3985 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3984 ?AUTO_3985 ) ( CLEAR ?AUTO_3984 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3984 ?AUTO_3985 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3984 ?AUTO_3985 )
      ( MAKE-ON-TABLE ?AUTO_3984 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3984 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3986 - BLOCK
    )
    :vars
    (
      ?AUTO_3987 - BLOCK
      ?AUTO_3988 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3986 ?AUTO_3987 ) ( CLEAR ?AUTO_3986 ) ( not ( = ?AUTO_3986 ?AUTO_3987 ) ) ( HOLDING ?AUTO_3988 ) ( not ( = ?AUTO_3986 ?AUTO_3988 ) ) ( not ( = ?AUTO_3987 ?AUTO_3988 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3988 )
      ( MAKE-ON-TABLE ?AUTO_3986 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3986 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3991 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3991 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3991 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3991 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3992 - BLOCK
    )
    :vars
    (
      ?AUTO_3993 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3992 ?AUTO_3993 ) ( CLEAR ?AUTO_3992 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3992 ?AUTO_3993 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3992 ?AUTO_3993 )
      ( MAKE-ON-TABLE ?AUTO_3992 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3992 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3994 - BLOCK
    )
    :vars
    (
      ?AUTO_3995 - BLOCK
      ?AUTO_3996 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3994 ?AUTO_3995 ) ( CLEAR ?AUTO_3994 ) ( not ( = ?AUTO_3994 ?AUTO_3995 ) ) ( HOLDING ?AUTO_3996 ) ( not ( = ?AUTO_3994 ?AUTO_3996 ) ) ( not ( = ?AUTO_3995 ?AUTO_3996 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3996 )
      ( MAKE-ON-TABLE ?AUTO_3994 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3994 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3997 - BLOCK
    )
    :vars
    (
      ?AUTO_3999 - BLOCK
      ?AUTO_3998 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3997 ?AUTO_3999 ) ( not ( = ?AUTO_3997 ?AUTO_3999 ) ) ( not ( = ?AUTO_3997 ?AUTO_3998 ) ) ( not ( = ?AUTO_3999 ?AUTO_3998 ) ) ( ON ?AUTO_3998 ?AUTO_3997 ) ( CLEAR ?AUTO_3998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3998 ?AUTO_3997 )
      ( MAKE-ON-TABLE ?AUTO_3997 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3997 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4000 - BLOCK
    )
    :vars
    (
      ?AUTO_4002 - BLOCK
      ?AUTO_4001 - BLOCK
      ?AUTO_4003 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4000 ?AUTO_4002 ) ( not ( = ?AUTO_4000 ?AUTO_4002 ) ) ( not ( = ?AUTO_4000 ?AUTO_4001 ) ) ( not ( = ?AUTO_4002 ?AUTO_4001 ) ) ( ON ?AUTO_4001 ?AUTO_4000 ) ( CLEAR ?AUTO_4001 ) ( HOLDING ?AUTO_4003 ) ( not ( = ?AUTO_4000 ?AUTO_4003 ) ) ( not ( = ?AUTO_4002 ?AUTO_4003 ) ) ( not ( = ?AUTO_4001 ?AUTO_4003 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4003 )
      ( MAKE-ON-TABLE ?AUTO_4000 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4000 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4006 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4006 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4006 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4006 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4007 - BLOCK
    )
    :vars
    (
      ?AUTO_4008 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4007 ?AUTO_4008 ) ( CLEAR ?AUTO_4007 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4007 ?AUTO_4008 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4007 ?AUTO_4008 )
      ( MAKE-ON-TABLE ?AUTO_4007 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4007 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4009 - BLOCK
    )
    :vars
    (
      ?AUTO_4010 - BLOCK
      ?AUTO_4011 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4009 ?AUTO_4010 ) ( CLEAR ?AUTO_4009 ) ( not ( = ?AUTO_4009 ?AUTO_4010 ) ) ( HOLDING ?AUTO_4011 ) ( not ( = ?AUTO_4009 ?AUTO_4011 ) ) ( not ( = ?AUTO_4010 ?AUTO_4011 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4011 )
      ( MAKE-ON-TABLE ?AUTO_4009 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4009 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4012 - BLOCK
    )
    :vars
    (
      ?AUTO_4013 - BLOCK
      ?AUTO_4014 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4012 ?AUTO_4013 ) ( not ( = ?AUTO_4012 ?AUTO_4013 ) ) ( not ( = ?AUTO_4012 ?AUTO_4014 ) ) ( not ( = ?AUTO_4013 ?AUTO_4014 ) ) ( ON ?AUTO_4014 ?AUTO_4012 ) ( CLEAR ?AUTO_4014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4014 ?AUTO_4012 )
      ( MAKE-ON-TABLE ?AUTO_4012 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4012 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4015 - BLOCK
    )
    :vars
    (
      ?AUTO_4016 - BLOCK
      ?AUTO_4017 - BLOCK
      ?AUTO_4018 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4015 ?AUTO_4016 ) ( not ( = ?AUTO_4015 ?AUTO_4016 ) ) ( not ( = ?AUTO_4015 ?AUTO_4017 ) ) ( not ( = ?AUTO_4016 ?AUTO_4017 ) ) ( ON ?AUTO_4017 ?AUTO_4015 ) ( CLEAR ?AUTO_4017 ) ( HOLDING ?AUTO_4018 ) ( not ( = ?AUTO_4015 ?AUTO_4018 ) ) ( not ( = ?AUTO_4016 ?AUTO_4018 ) ) ( not ( = ?AUTO_4017 ?AUTO_4018 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4018 )
      ( MAKE-ON-TABLE ?AUTO_4015 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4015 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4019 - BLOCK
    )
    :vars
    (
      ?AUTO_4020 - BLOCK
      ?AUTO_4021 - BLOCK
      ?AUTO_4022 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4019 ?AUTO_4020 ) ( not ( = ?AUTO_4019 ?AUTO_4020 ) ) ( not ( = ?AUTO_4019 ?AUTO_4021 ) ) ( not ( = ?AUTO_4020 ?AUTO_4021 ) ) ( ON ?AUTO_4021 ?AUTO_4019 ) ( not ( = ?AUTO_4019 ?AUTO_4022 ) ) ( not ( = ?AUTO_4020 ?AUTO_4022 ) ) ( not ( = ?AUTO_4021 ?AUTO_4022 ) ) ( ON ?AUTO_4022 ?AUTO_4021 ) ( CLEAR ?AUTO_4022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4022 ?AUTO_4021 )
      ( MAKE-ON-TABLE ?AUTO_4019 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4019 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4023 - BLOCK
    )
    :vars
    (
      ?AUTO_4025 - BLOCK
      ?AUTO_4024 - BLOCK
      ?AUTO_4026 - BLOCK
      ?AUTO_4027 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4023 ?AUTO_4025 ) ( not ( = ?AUTO_4023 ?AUTO_4025 ) ) ( not ( = ?AUTO_4023 ?AUTO_4024 ) ) ( not ( = ?AUTO_4025 ?AUTO_4024 ) ) ( ON ?AUTO_4024 ?AUTO_4023 ) ( not ( = ?AUTO_4023 ?AUTO_4026 ) ) ( not ( = ?AUTO_4025 ?AUTO_4026 ) ) ( not ( = ?AUTO_4024 ?AUTO_4026 ) ) ( ON ?AUTO_4026 ?AUTO_4024 ) ( CLEAR ?AUTO_4026 ) ( HOLDING ?AUTO_4027 ) ( not ( = ?AUTO_4023 ?AUTO_4027 ) ) ( not ( = ?AUTO_4025 ?AUTO_4027 ) ) ( not ( = ?AUTO_4024 ?AUTO_4027 ) ) ( not ( = ?AUTO_4026 ?AUTO_4027 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4027 )
      ( MAKE-ON-TABLE ?AUTO_4023 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4023 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4031 - BLOCK
      ?AUTO_4032 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4031 ) ( CLEAR ?AUTO_4032 ) ( not ( = ?AUTO_4031 ?AUTO_4032 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4031 ?AUTO_4032 )
      ( MAKE-ON-VERIFY ?AUTO_4031 ?AUTO_4032 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4033 - BLOCK
      ?AUTO_4034 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4034 ) ( not ( = ?AUTO_4033 ?AUTO_4034 ) ) ( ON-TABLE ?AUTO_4033 ) ( CLEAR ?AUTO_4033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4033 )
      ( MAKE-ON ?AUTO_4033 ?AUTO_4034 )
      ( MAKE-ON-VERIFY ?AUTO_4033 ?AUTO_4034 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4035 - BLOCK
      ?AUTO_4036 - BLOCK
    )
    :vars
    (
      ?AUTO_4037 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4036 ) ( not ( = ?AUTO_4035 ?AUTO_4036 ) ) ( ON-TABLE ?AUTO_4035 ) ( CLEAR ?AUTO_4035 ) ( HOLDING ?AUTO_4037 ) ( not ( = ?AUTO_4035 ?AUTO_4037 ) ) ( not ( = ?AUTO_4036 ?AUTO_4037 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4037 )
      ( MAKE-ON ?AUTO_4035 ?AUTO_4036 )
      ( MAKE-ON-VERIFY ?AUTO_4035 ?AUTO_4036 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4040 - BLOCK
      ?AUTO_4041 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4040 ?AUTO_4041 ) ) ( ON-TABLE ?AUTO_4040 ) ( CLEAR ?AUTO_4040 ) ( HOLDING ?AUTO_4041 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4041 )
      ( MAKE-ON ?AUTO_4040 ?AUTO_4041 )
      ( MAKE-ON-VERIFY ?AUTO_4040 ?AUTO_4041 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4057 - BLOCK
      ?AUTO_4058 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4057 ) ( CLEAR ?AUTO_4058 ) ( not ( = ?AUTO_4057 ?AUTO_4058 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4057 ?AUTO_4058 )
      ( MAKE-ON-VERIFY ?AUTO_4057 ?AUTO_4058 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4059 - BLOCK
      ?AUTO_4060 - BLOCK
    )
    :vars
    (
      ?AUTO_4061 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4060 ) ( not ( = ?AUTO_4059 ?AUTO_4060 ) ) ( ON ?AUTO_4059 ?AUTO_4061 ) ( CLEAR ?AUTO_4059 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4059 ?AUTO_4061 ) ) ( not ( = ?AUTO_4060 ?AUTO_4061 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4059 ?AUTO_4061 )
      ( MAKE-ON ?AUTO_4059 ?AUTO_4060 )
      ( MAKE-ON-VERIFY ?AUTO_4059 ?AUTO_4060 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4062 - BLOCK
      ?AUTO_4063 - BLOCK
    )
    :vars
    (
      ?AUTO_4064 - BLOCK
      ?AUTO_4065 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4062 ?AUTO_4063 ) ) ( ON ?AUTO_4062 ?AUTO_4064 ) ( CLEAR ?AUTO_4062 ) ( not ( = ?AUTO_4062 ?AUTO_4064 ) ) ( not ( = ?AUTO_4063 ?AUTO_4064 ) ) ( HOLDING ?AUTO_4063 ) ( CLEAR ?AUTO_4065 ) ( not ( = ?AUTO_4062 ?AUTO_4065 ) ) ( not ( = ?AUTO_4063 ?AUTO_4065 ) ) ( not ( = ?AUTO_4064 ?AUTO_4065 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4063 ?AUTO_4065 )
      ( MAKE-ON ?AUTO_4062 ?AUTO_4063 )
      ( MAKE-ON-VERIFY ?AUTO_4062 ?AUTO_4063 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4068 - BLOCK
      ?AUTO_4069 - BLOCK
    )
    :vars
    (
      ?AUTO_4070 - BLOCK
      ?AUTO_4071 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4069 ) ( not ( = ?AUTO_4068 ?AUTO_4069 ) ) ( ON ?AUTO_4068 ?AUTO_4070 ) ( CLEAR ?AUTO_4068 ) ( not ( = ?AUTO_4068 ?AUTO_4070 ) ) ( not ( = ?AUTO_4069 ?AUTO_4070 ) ) ( HOLDING ?AUTO_4071 ) ( not ( = ?AUTO_4068 ?AUTO_4071 ) ) ( not ( = ?AUTO_4069 ?AUTO_4071 ) ) ( not ( = ?AUTO_4070 ?AUTO_4071 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4071 )
      ( MAKE-ON ?AUTO_4068 ?AUTO_4069 )
      ( MAKE-ON-VERIFY ?AUTO_4068 ?AUTO_4069 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4072 - BLOCK
      ?AUTO_4073 - BLOCK
    )
    :vars
    (
      ?AUTO_4074 - BLOCK
      ?AUTO_4075 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4073 ) ( not ( = ?AUTO_4072 ?AUTO_4073 ) ) ( ON ?AUTO_4072 ?AUTO_4074 ) ( not ( = ?AUTO_4072 ?AUTO_4074 ) ) ( not ( = ?AUTO_4073 ?AUTO_4074 ) ) ( not ( = ?AUTO_4072 ?AUTO_4075 ) ) ( not ( = ?AUTO_4073 ?AUTO_4075 ) ) ( not ( = ?AUTO_4074 ?AUTO_4075 ) ) ( ON ?AUTO_4075 ?AUTO_4072 ) ( CLEAR ?AUTO_4075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4075 ?AUTO_4072 )
      ( MAKE-ON ?AUTO_4072 ?AUTO_4073 )
      ( MAKE-ON-VERIFY ?AUTO_4072 ?AUTO_4073 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4076 - BLOCK
      ?AUTO_4077 - BLOCK
    )
    :vars
    (
      ?AUTO_4079 - BLOCK
      ?AUTO_4078 - BLOCK
      ?AUTO_4080 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4077 ) ( not ( = ?AUTO_4076 ?AUTO_4077 ) ) ( ON ?AUTO_4076 ?AUTO_4079 ) ( not ( = ?AUTO_4076 ?AUTO_4079 ) ) ( not ( = ?AUTO_4077 ?AUTO_4079 ) ) ( not ( = ?AUTO_4076 ?AUTO_4078 ) ) ( not ( = ?AUTO_4077 ?AUTO_4078 ) ) ( not ( = ?AUTO_4079 ?AUTO_4078 ) ) ( ON ?AUTO_4078 ?AUTO_4076 ) ( CLEAR ?AUTO_4078 ) ( HOLDING ?AUTO_4080 ) ( not ( = ?AUTO_4076 ?AUTO_4080 ) ) ( not ( = ?AUTO_4077 ?AUTO_4080 ) ) ( not ( = ?AUTO_4079 ?AUTO_4080 ) ) ( not ( = ?AUTO_4078 ?AUTO_4080 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4080 )
      ( MAKE-ON ?AUTO_4076 ?AUTO_4077 )
      ( MAKE-ON-VERIFY ?AUTO_4076 ?AUTO_4077 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4081 - BLOCK
      ?AUTO_4082 - BLOCK
    )
    :vars
    (
      ?AUTO_4085 - BLOCK
      ?AUTO_4083 - BLOCK
      ?AUTO_4084 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4082 ) ( not ( = ?AUTO_4081 ?AUTO_4082 ) ) ( ON ?AUTO_4081 ?AUTO_4085 ) ( not ( = ?AUTO_4081 ?AUTO_4085 ) ) ( not ( = ?AUTO_4082 ?AUTO_4085 ) ) ( not ( = ?AUTO_4081 ?AUTO_4083 ) ) ( not ( = ?AUTO_4082 ?AUTO_4083 ) ) ( not ( = ?AUTO_4085 ?AUTO_4083 ) ) ( ON ?AUTO_4083 ?AUTO_4081 ) ( not ( = ?AUTO_4081 ?AUTO_4084 ) ) ( not ( = ?AUTO_4082 ?AUTO_4084 ) ) ( not ( = ?AUTO_4085 ?AUTO_4084 ) ) ( not ( = ?AUTO_4083 ?AUTO_4084 ) ) ( ON ?AUTO_4084 ?AUTO_4083 ) ( CLEAR ?AUTO_4084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4084 ?AUTO_4083 )
      ( MAKE-ON ?AUTO_4081 ?AUTO_4082 )
      ( MAKE-ON-VERIFY ?AUTO_4081 ?AUTO_4082 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4086 - BLOCK
      ?AUTO_4087 - BLOCK
    )
    :vars
    (
      ?AUTO_4089 - BLOCK
      ?AUTO_4088 - BLOCK
      ?AUTO_4090 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4086 ?AUTO_4087 ) ) ( ON ?AUTO_4086 ?AUTO_4089 ) ( not ( = ?AUTO_4086 ?AUTO_4089 ) ) ( not ( = ?AUTO_4087 ?AUTO_4089 ) ) ( not ( = ?AUTO_4086 ?AUTO_4088 ) ) ( not ( = ?AUTO_4087 ?AUTO_4088 ) ) ( not ( = ?AUTO_4089 ?AUTO_4088 ) ) ( ON ?AUTO_4088 ?AUTO_4086 ) ( not ( = ?AUTO_4086 ?AUTO_4090 ) ) ( not ( = ?AUTO_4087 ?AUTO_4090 ) ) ( not ( = ?AUTO_4089 ?AUTO_4090 ) ) ( not ( = ?AUTO_4088 ?AUTO_4090 ) ) ( ON ?AUTO_4090 ?AUTO_4088 ) ( CLEAR ?AUTO_4090 ) ( HOLDING ?AUTO_4087 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4087 )
      ( MAKE-ON ?AUTO_4086 ?AUTO_4087 )
      ( MAKE-ON-VERIFY ?AUTO_4086 ?AUTO_4087 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4091 - BLOCK
      ?AUTO_4092 - BLOCK
    )
    :vars
    (
      ?AUTO_4093 - BLOCK
      ?AUTO_4094 - BLOCK
      ?AUTO_4095 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4091 ?AUTO_4092 ) ) ( ON ?AUTO_4091 ?AUTO_4093 ) ( not ( = ?AUTO_4091 ?AUTO_4093 ) ) ( not ( = ?AUTO_4092 ?AUTO_4093 ) ) ( not ( = ?AUTO_4091 ?AUTO_4094 ) ) ( not ( = ?AUTO_4092 ?AUTO_4094 ) ) ( not ( = ?AUTO_4093 ?AUTO_4094 ) ) ( ON ?AUTO_4094 ?AUTO_4091 ) ( not ( = ?AUTO_4091 ?AUTO_4095 ) ) ( not ( = ?AUTO_4092 ?AUTO_4095 ) ) ( not ( = ?AUTO_4093 ?AUTO_4095 ) ) ( not ( = ?AUTO_4094 ?AUTO_4095 ) ) ( ON ?AUTO_4095 ?AUTO_4094 ) ( ON ?AUTO_4092 ?AUTO_4095 ) ( CLEAR ?AUTO_4092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4092 ?AUTO_4095 )
      ( MAKE-ON ?AUTO_4091 ?AUTO_4092 )
      ( MAKE-ON-VERIFY ?AUTO_4091 ?AUTO_4092 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4096 - BLOCK
      ?AUTO_4097 - BLOCK
    )
    :vars
    (
      ?AUTO_4098 - BLOCK
      ?AUTO_4099 - BLOCK
      ?AUTO_4100 - BLOCK
      ?AUTO_4101 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4096 ?AUTO_4097 ) ) ( ON ?AUTO_4096 ?AUTO_4098 ) ( not ( = ?AUTO_4096 ?AUTO_4098 ) ) ( not ( = ?AUTO_4097 ?AUTO_4098 ) ) ( not ( = ?AUTO_4096 ?AUTO_4099 ) ) ( not ( = ?AUTO_4097 ?AUTO_4099 ) ) ( not ( = ?AUTO_4098 ?AUTO_4099 ) ) ( ON ?AUTO_4099 ?AUTO_4096 ) ( not ( = ?AUTO_4096 ?AUTO_4100 ) ) ( not ( = ?AUTO_4097 ?AUTO_4100 ) ) ( not ( = ?AUTO_4098 ?AUTO_4100 ) ) ( not ( = ?AUTO_4099 ?AUTO_4100 ) ) ( ON ?AUTO_4100 ?AUTO_4099 ) ( ON ?AUTO_4097 ?AUTO_4100 ) ( CLEAR ?AUTO_4097 ) ( HOLDING ?AUTO_4101 ) ( not ( = ?AUTO_4096 ?AUTO_4101 ) ) ( not ( = ?AUTO_4097 ?AUTO_4101 ) ) ( not ( = ?AUTO_4098 ?AUTO_4101 ) ) ( not ( = ?AUTO_4099 ?AUTO_4101 ) ) ( not ( = ?AUTO_4100 ?AUTO_4101 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4101 )
      ( MAKE-ON ?AUTO_4096 ?AUTO_4097 )
      ( MAKE-ON-VERIFY ?AUTO_4096 ?AUTO_4097 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4106 - BLOCK
      ?AUTO_4107 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4106 ) ( CLEAR ?AUTO_4107 ) ( not ( = ?AUTO_4106 ?AUTO_4107 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4106 ?AUTO_4107 )
      ( MAKE-ON-VERIFY ?AUTO_4106 ?AUTO_4107 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4108 - BLOCK
      ?AUTO_4109 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4109 ) ( not ( = ?AUTO_4108 ?AUTO_4109 ) ) ( ON-TABLE ?AUTO_4108 ) ( CLEAR ?AUTO_4108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4108 )
      ( MAKE-ON ?AUTO_4108 ?AUTO_4109 )
      ( MAKE-ON-VERIFY ?AUTO_4108 ?AUTO_4109 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4110 - BLOCK
      ?AUTO_4111 - BLOCK
    )
    :vars
    (
      ?AUTO_4112 - BLOCK
      ?AUTO_4113 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4111 ) ( not ( = ?AUTO_4110 ?AUTO_4111 ) ) ( ON-TABLE ?AUTO_4110 ) ( CLEAR ?AUTO_4110 ) ( HOLDING ?AUTO_4112 ) ( CLEAR ?AUTO_4113 ) ( not ( = ?AUTO_4110 ?AUTO_4112 ) ) ( not ( = ?AUTO_4110 ?AUTO_4113 ) ) ( not ( = ?AUTO_4111 ?AUTO_4112 ) ) ( not ( = ?AUTO_4111 ?AUTO_4113 ) ) ( not ( = ?AUTO_4112 ?AUTO_4113 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4112 ?AUTO_4113 )
      ( MAKE-ON ?AUTO_4110 ?AUTO_4111 )
      ( MAKE-ON-VERIFY ?AUTO_4110 ?AUTO_4111 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4114 - BLOCK
      ?AUTO_4115 - BLOCK
    )
    :vars
    (
      ?AUTO_4116 - BLOCK
      ?AUTO_4117 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4115 ) ( not ( = ?AUTO_4114 ?AUTO_4115 ) ) ( ON-TABLE ?AUTO_4114 ) ( CLEAR ?AUTO_4116 ) ( not ( = ?AUTO_4114 ?AUTO_4117 ) ) ( not ( = ?AUTO_4114 ?AUTO_4116 ) ) ( not ( = ?AUTO_4115 ?AUTO_4117 ) ) ( not ( = ?AUTO_4115 ?AUTO_4116 ) ) ( not ( = ?AUTO_4117 ?AUTO_4116 ) ) ( ON ?AUTO_4117 ?AUTO_4114 ) ( CLEAR ?AUTO_4117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4117 ?AUTO_4114 )
      ( MAKE-ON ?AUTO_4114 ?AUTO_4115 )
      ( MAKE-ON-VERIFY ?AUTO_4114 ?AUTO_4115 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4118 - BLOCK
      ?AUTO_4119 - BLOCK
    )
    :vars
    (
      ?AUTO_4120 - BLOCK
      ?AUTO_4121 - BLOCK
      ?AUTO_4122 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4119 ) ( not ( = ?AUTO_4118 ?AUTO_4119 ) ) ( ON-TABLE ?AUTO_4118 ) ( not ( = ?AUTO_4118 ?AUTO_4120 ) ) ( not ( = ?AUTO_4118 ?AUTO_4121 ) ) ( not ( = ?AUTO_4119 ?AUTO_4120 ) ) ( not ( = ?AUTO_4119 ?AUTO_4121 ) ) ( not ( = ?AUTO_4120 ?AUTO_4121 ) ) ( ON ?AUTO_4120 ?AUTO_4118 ) ( CLEAR ?AUTO_4120 ) ( HOLDING ?AUTO_4121 ) ( CLEAR ?AUTO_4122 ) ( not ( = ?AUTO_4118 ?AUTO_4122 ) ) ( not ( = ?AUTO_4119 ?AUTO_4122 ) ) ( not ( = ?AUTO_4120 ?AUTO_4122 ) ) ( not ( = ?AUTO_4121 ?AUTO_4122 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4121 ?AUTO_4122 )
      ( MAKE-ON ?AUTO_4118 ?AUTO_4119 )
      ( MAKE-ON-VERIFY ?AUTO_4118 ?AUTO_4119 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4127 - BLOCK
      ?AUTO_4128 - BLOCK
    )
    :vars
    (
      ?AUTO_4131 - BLOCK
      ?AUTO_4130 - BLOCK
      ?AUTO_4129 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4128 ) ( not ( = ?AUTO_4127 ?AUTO_4128 ) ) ( ON-TABLE ?AUTO_4127 ) ( not ( = ?AUTO_4127 ?AUTO_4131 ) ) ( not ( = ?AUTO_4127 ?AUTO_4130 ) ) ( not ( = ?AUTO_4128 ?AUTO_4131 ) ) ( not ( = ?AUTO_4128 ?AUTO_4130 ) ) ( not ( = ?AUTO_4131 ?AUTO_4130 ) ) ( ON ?AUTO_4131 ?AUTO_4127 ) ( CLEAR ?AUTO_4129 ) ( not ( = ?AUTO_4127 ?AUTO_4129 ) ) ( not ( = ?AUTO_4128 ?AUTO_4129 ) ) ( not ( = ?AUTO_4131 ?AUTO_4129 ) ) ( not ( = ?AUTO_4130 ?AUTO_4129 ) ) ( ON ?AUTO_4130 ?AUTO_4131 ) ( CLEAR ?AUTO_4130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4130 ?AUTO_4131 )
      ( MAKE-ON ?AUTO_4127 ?AUTO_4128 )
      ( MAKE-ON-VERIFY ?AUTO_4127 ?AUTO_4128 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4132 - BLOCK
      ?AUTO_4133 - BLOCK
    )
    :vars
    (
      ?AUTO_4136 - BLOCK
      ?AUTO_4135 - BLOCK
      ?AUTO_4134 - BLOCK
      ?AUTO_4137 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4133 ) ( not ( = ?AUTO_4132 ?AUTO_4133 ) ) ( ON-TABLE ?AUTO_4132 ) ( not ( = ?AUTO_4132 ?AUTO_4136 ) ) ( not ( = ?AUTO_4132 ?AUTO_4135 ) ) ( not ( = ?AUTO_4133 ?AUTO_4136 ) ) ( not ( = ?AUTO_4133 ?AUTO_4135 ) ) ( not ( = ?AUTO_4136 ?AUTO_4135 ) ) ( ON ?AUTO_4136 ?AUTO_4132 ) ( CLEAR ?AUTO_4134 ) ( not ( = ?AUTO_4132 ?AUTO_4134 ) ) ( not ( = ?AUTO_4133 ?AUTO_4134 ) ) ( not ( = ?AUTO_4136 ?AUTO_4134 ) ) ( not ( = ?AUTO_4135 ?AUTO_4134 ) ) ( ON ?AUTO_4135 ?AUTO_4136 ) ( CLEAR ?AUTO_4135 ) ( HOLDING ?AUTO_4137 ) ( not ( = ?AUTO_4132 ?AUTO_4137 ) ) ( not ( = ?AUTO_4133 ?AUTO_4137 ) ) ( not ( = ?AUTO_4136 ?AUTO_4137 ) ) ( not ( = ?AUTO_4135 ?AUTO_4137 ) ) ( not ( = ?AUTO_4134 ?AUTO_4137 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4137 )
      ( MAKE-ON ?AUTO_4132 ?AUTO_4133 )
      ( MAKE-ON-VERIFY ?AUTO_4132 ?AUTO_4133 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4138 - BLOCK
      ?AUTO_4139 - BLOCK
    )
    :vars
    (
      ?AUTO_4142 - BLOCK
      ?AUTO_4141 - BLOCK
      ?AUTO_4140 - BLOCK
      ?AUTO_4143 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4139 ) ( not ( = ?AUTO_4138 ?AUTO_4139 ) ) ( ON-TABLE ?AUTO_4138 ) ( not ( = ?AUTO_4138 ?AUTO_4142 ) ) ( not ( = ?AUTO_4138 ?AUTO_4141 ) ) ( not ( = ?AUTO_4139 ?AUTO_4142 ) ) ( not ( = ?AUTO_4139 ?AUTO_4141 ) ) ( not ( = ?AUTO_4142 ?AUTO_4141 ) ) ( ON ?AUTO_4142 ?AUTO_4138 ) ( CLEAR ?AUTO_4140 ) ( not ( = ?AUTO_4138 ?AUTO_4140 ) ) ( not ( = ?AUTO_4139 ?AUTO_4140 ) ) ( not ( = ?AUTO_4142 ?AUTO_4140 ) ) ( not ( = ?AUTO_4141 ?AUTO_4140 ) ) ( ON ?AUTO_4141 ?AUTO_4142 ) ( not ( = ?AUTO_4138 ?AUTO_4143 ) ) ( not ( = ?AUTO_4139 ?AUTO_4143 ) ) ( not ( = ?AUTO_4142 ?AUTO_4143 ) ) ( not ( = ?AUTO_4141 ?AUTO_4143 ) ) ( not ( = ?AUTO_4140 ?AUTO_4143 ) ) ( ON ?AUTO_4143 ?AUTO_4141 ) ( CLEAR ?AUTO_4143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4143 ?AUTO_4141 )
      ( MAKE-ON ?AUTO_4138 ?AUTO_4139 )
      ( MAKE-ON-VERIFY ?AUTO_4138 ?AUTO_4139 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4144 - BLOCK
      ?AUTO_4145 - BLOCK
    )
    :vars
    (
      ?AUTO_4149 - BLOCK
      ?AUTO_4146 - BLOCK
      ?AUTO_4148 - BLOCK
      ?AUTO_4147 - BLOCK
      ?AUTO_4150 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4145 ) ( not ( = ?AUTO_4144 ?AUTO_4145 ) ) ( ON-TABLE ?AUTO_4144 ) ( not ( = ?AUTO_4144 ?AUTO_4149 ) ) ( not ( = ?AUTO_4144 ?AUTO_4146 ) ) ( not ( = ?AUTO_4145 ?AUTO_4149 ) ) ( not ( = ?AUTO_4145 ?AUTO_4146 ) ) ( not ( = ?AUTO_4149 ?AUTO_4146 ) ) ( ON ?AUTO_4149 ?AUTO_4144 ) ( CLEAR ?AUTO_4148 ) ( not ( = ?AUTO_4144 ?AUTO_4148 ) ) ( not ( = ?AUTO_4145 ?AUTO_4148 ) ) ( not ( = ?AUTO_4149 ?AUTO_4148 ) ) ( not ( = ?AUTO_4146 ?AUTO_4148 ) ) ( ON ?AUTO_4146 ?AUTO_4149 ) ( not ( = ?AUTO_4144 ?AUTO_4147 ) ) ( not ( = ?AUTO_4145 ?AUTO_4147 ) ) ( not ( = ?AUTO_4149 ?AUTO_4147 ) ) ( not ( = ?AUTO_4146 ?AUTO_4147 ) ) ( not ( = ?AUTO_4148 ?AUTO_4147 ) ) ( ON ?AUTO_4147 ?AUTO_4146 ) ( CLEAR ?AUTO_4147 ) ( HOLDING ?AUTO_4150 ) ( not ( = ?AUTO_4144 ?AUTO_4150 ) ) ( not ( = ?AUTO_4145 ?AUTO_4150 ) ) ( not ( = ?AUTO_4149 ?AUTO_4150 ) ) ( not ( = ?AUTO_4146 ?AUTO_4150 ) ) ( not ( = ?AUTO_4148 ?AUTO_4150 ) ) ( not ( = ?AUTO_4147 ?AUTO_4150 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4150 )
      ( MAKE-ON ?AUTO_4144 ?AUTO_4145 )
      ( MAKE-ON-VERIFY ?AUTO_4144 ?AUTO_4145 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4151 - BLOCK
      ?AUTO_4152 - BLOCK
    )
    :vars
    (
      ?AUTO_4154 - BLOCK
      ?AUTO_4155 - BLOCK
      ?AUTO_4157 - BLOCK
      ?AUTO_4153 - BLOCK
      ?AUTO_4156 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4152 ) ( not ( = ?AUTO_4151 ?AUTO_4152 ) ) ( ON-TABLE ?AUTO_4151 ) ( not ( = ?AUTO_4151 ?AUTO_4154 ) ) ( not ( = ?AUTO_4151 ?AUTO_4155 ) ) ( not ( = ?AUTO_4152 ?AUTO_4154 ) ) ( not ( = ?AUTO_4152 ?AUTO_4155 ) ) ( not ( = ?AUTO_4154 ?AUTO_4155 ) ) ( ON ?AUTO_4154 ?AUTO_4151 ) ( CLEAR ?AUTO_4157 ) ( not ( = ?AUTO_4151 ?AUTO_4157 ) ) ( not ( = ?AUTO_4152 ?AUTO_4157 ) ) ( not ( = ?AUTO_4154 ?AUTO_4157 ) ) ( not ( = ?AUTO_4155 ?AUTO_4157 ) ) ( ON ?AUTO_4155 ?AUTO_4154 ) ( not ( = ?AUTO_4151 ?AUTO_4153 ) ) ( not ( = ?AUTO_4152 ?AUTO_4153 ) ) ( not ( = ?AUTO_4154 ?AUTO_4153 ) ) ( not ( = ?AUTO_4155 ?AUTO_4153 ) ) ( not ( = ?AUTO_4157 ?AUTO_4153 ) ) ( ON ?AUTO_4153 ?AUTO_4155 ) ( not ( = ?AUTO_4151 ?AUTO_4156 ) ) ( not ( = ?AUTO_4152 ?AUTO_4156 ) ) ( not ( = ?AUTO_4154 ?AUTO_4156 ) ) ( not ( = ?AUTO_4155 ?AUTO_4156 ) ) ( not ( = ?AUTO_4157 ?AUTO_4156 ) ) ( not ( = ?AUTO_4153 ?AUTO_4156 ) ) ( ON ?AUTO_4156 ?AUTO_4153 ) ( CLEAR ?AUTO_4156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4156 ?AUTO_4153 )
      ( MAKE-ON ?AUTO_4151 ?AUTO_4152 )
      ( MAKE-ON-VERIFY ?AUTO_4151 ?AUTO_4152 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4158 - BLOCK
      ?AUTO_4159 - BLOCK
    )
    :vars
    (
      ?AUTO_4161 - BLOCK
      ?AUTO_4164 - BLOCK
      ?AUTO_4163 - BLOCK
      ?AUTO_4160 - BLOCK
      ?AUTO_4162 - BLOCK
      ?AUTO_4165 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4159 ) ( not ( = ?AUTO_4158 ?AUTO_4159 ) ) ( ON-TABLE ?AUTO_4158 ) ( not ( = ?AUTO_4158 ?AUTO_4161 ) ) ( not ( = ?AUTO_4158 ?AUTO_4164 ) ) ( not ( = ?AUTO_4159 ?AUTO_4161 ) ) ( not ( = ?AUTO_4159 ?AUTO_4164 ) ) ( not ( = ?AUTO_4161 ?AUTO_4164 ) ) ( ON ?AUTO_4161 ?AUTO_4158 ) ( CLEAR ?AUTO_4163 ) ( not ( = ?AUTO_4158 ?AUTO_4163 ) ) ( not ( = ?AUTO_4159 ?AUTO_4163 ) ) ( not ( = ?AUTO_4161 ?AUTO_4163 ) ) ( not ( = ?AUTO_4164 ?AUTO_4163 ) ) ( ON ?AUTO_4164 ?AUTO_4161 ) ( not ( = ?AUTO_4158 ?AUTO_4160 ) ) ( not ( = ?AUTO_4159 ?AUTO_4160 ) ) ( not ( = ?AUTO_4161 ?AUTO_4160 ) ) ( not ( = ?AUTO_4164 ?AUTO_4160 ) ) ( not ( = ?AUTO_4163 ?AUTO_4160 ) ) ( ON ?AUTO_4160 ?AUTO_4164 ) ( not ( = ?AUTO_4158 ?AUTO_4162 ) ) ( not ( = ?AUTO_4159 ?AUTO_4162 ) ) ( not ( = ?AUTO_4161 ?AUTO_4162 ) ) ( not ( = ?AUTO_4164 ?AUTO_4162 ) ) ( not ( = ?AUTO_4163 ?AUTO_4162 ) ) ( not ( = ?AUTO_4160 ?AUTO_4162 ) ) ( ON ?AUTO_4162 ?AUTO_4160 ) ( CLEAR ?AUTO_4162 ) ( HOLDING ?AUTO_4165 ) ( not ( = ?AUTO_4158 ?AUTO_4165 ) ) ( not ( = ?AUTO_4159 ?AUTO_4165 ) ) ( not ( = ?AUTO_4161 ?AUTO_4165 ) ) ( not ( = ?AUTO_4164 ?AUTO_4165 ) ) ( not ( = ?AUTO_4163 ?AUTO_4165 ) ) ( not ( = ?AUTO_4160 ?AUTO_4165 ) ) ( not ( = ?AUTO_4162 ?AUTO_4165 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4165 )
      ( MAKE-ON ?AUTO_4158 ?AUTO_4159 )
      ( MAKE-ON-VERIFY ?AUTO_4158 ?AUTO_4159 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4170 - BLOCK
      ?AUTO_4171 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4170 ) ( CLEAR ?AUTO_4171 ) ( not ( = ?AUTO_4170 ?AUTO_4171 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4170 ?AUTO_4171 )
      ( MAKE-ON-VERIFY ?AUTO_4170 ?AUTO_4171 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4172 - BLOCK
      ?AUTO_4173 - BLOCK
    )
    :vars
    (
      ?AUTO_4174 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4173 ) ( not ( = ?AUTO_4172 ?AUTO_4173 ) ) ( ON ?AUTO_4172 ?AUTO_4174 ) ( CLEAR ?AUTO_4172 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4172 ?AUTO_4174 ) ) ( not ( = ?AUTO_4173 ?AUTO_4174 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4172 ?AUTO_4174 )
      ( MAKE-ON ?AUTO_4172 ?AUTO_4173 )
      ( MAKE-ON-VERIFY ?AUTO_4172 ?AUTO_4173 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4175 - BLOCK
      ?AUTO_4176 - BLOCK
    )
    :vars
    (
      ?AUTO_4177 - BLOCK
      ?AUTO_4178 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4175 ?AUTO_4176 ) ) ( ON ?AUTO_4175 ?AUTO_4177 ) ( CLEAR ?AUTO_4175 ) ( not ( = ?AUTO_4175 ?AUTO_4177 ) ) ( not ( = ?AUTO_4176 ?AUTO_4177 ) ) ( HOLDING ?AUTO_4176 ) ( CLEAR ?AUTO_4178 ) ( not ( = ?AUTO_4175 ?AUTO_4178 ) ) ( not ( = ?AUTO_4176 ?AUTO_4178 ) ) ( not ( = ?AUTO_4177 ?AUTO_4178 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4176 ?AUTO_4178 )
      ( MAKE-ON ?AUTO_4175 ?AUTO_4176 )
      ( MAKE-ON-VERIFY ?AUTO_4175 ?AUTO_4176 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4181 - BLOCK
      ?AUTO_4182 - BLOCK
    )
    :vars
    (
      ?AUTO_4183 - BLOCK
      ?AUTO_4184 - BLOCK
      ?AUTO_4185 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4182 ) ( not ( = ?AUTO_4181 ?AUTO_4182 ) ) ( ON ?AUTO_4181 ?AUTO_4183 ) ( CLEAR ?AUTO_4181 ) ( not ( = ?AUTO_4181 ?AUTO_4183 ) ) ( not ( = ?AUTO_4182 ?AUTO_4183 ) ) ( HOLDING ?AUTO_4184 ) ( CLEAR ?AUTO_4185 ) ( not ( = ?AUTO_4181 ?AUTO_4184 ) ) ( not ( = ?AUTO_4181 ?AUTO_4185 ) ) ( not ( = ?AUTO_4182 ?AUTO_4184 ) ) ( not ( = ?AUTO_4182 ?AUTO_4185 ) ) ( not ( = ?AUTO_4183 ?AUTO_4184 ) ) ( not ( = ?AUTO_4183 ?AUTO_4185 ) ) ( not ( = ?AUTO_4184 ?AUTO_4185 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4184 ?AUTO_4185 )
      ( MAKE-ON ?AUTO_4181 ?AUTO_4182 )
      ( MAKE-ON-VERIFY ?AUTO_4181 ?AUTO_4182 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4186 - BLOCK
      ?AUTO_4187 - BLOCK
    )
    :vars
    (
      ?AUTO_4188 - BLOCK
      ?AUTO_4189 - BLOCK
      ?AUTO_4190 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4186 ?AUTO_4187 ) ) ( ON ?AUTO_4186 ?AUTO_4188 ) ( CLEAR ?AUTO_4186 ) ( not ( = ?AUTO_4186 ?AUTO_4188 ) ) ( not ( = ?AUTO_4187 ?AUTO_4188 ) ) ( CLEAR ?AUTO_4189 ) ( not ( = ?AUTO_4186 ?AUTO_4190 ) ) ( not ( = ?AUTO_4186 ?AUTO_4189 ) ) ( not ( = ?AUTO_4187 ?AUTO_4190 ) ) ( not ( = ?AUTO_4187 ?AUTO_4189 ) ) ( not ( = ?AUTO_4188 ?AUTO_4190 ) ) ( not ( = ?AUTO_4188 ?AUTO_4189 ) ) ( not ( = ?AUTO_4190 ?AUTO_4189 ) ) ( ON ?AUTO_4190 ?AUTO_4187 ) ( CLEAR ?AUTO_4190 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4190 ?AUTO_4187 )
      ( MAKE-ON ?AUTO_4186 ?AUTO_4187 )
      ( MAKE-ON-VERIFY ?AUTO_4186 ?AUTO_4187 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4191 - BLOCK
      ?AUTO_4192 - BLOCK
    )
    :vars
    (
      ?AUTO_4193 - BLOCK
      ?AUTO_4195 - BLOCK
      ?AUTO_4194 - BLOCK
      ?AUTO_4196 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4191 ?AUTO_4192 ) ) ( ON ?AUTO_4191 ?AUTO_4193 ) ( CLEAR ?AUTO_4191 ) ( not ( = ?AUTO_4191 ?AUTO_4193 ) ) ( not ( = ?AUTO_4192 ?AUTO_4193 ) ) ( not ( = ?AUTO_4191 ?AUTO_4195 ) ) ( not ( = ?AUTO_4191 ?AUTO_4194 ) ) ( not ( = ?AUTO_4192 ?AUTO_4195 ) ) ( not ( = ?AUTO_4192 ?AUTO_4194 ) ) ( not ( = ?AUTO_4193 ?AUTO_4195 ) ) ( not ( = ?AUTO_4193 ?AUTO_4194 ) ) ( not ( = ?AUTO_4195 ?AUTO_4194 ) ) ( ON ?AUTO_4195 ?AUTO_4192 ) ( CLEAR ?AUTO_4195 ) ( HOLDING ?AUTO_4194 ) ( CLEAR ?AUTO_4196 ) ( not ( = ?AUTO_4191 ?AUTO_4196 ) ) ( not ( = ?AUTO_4192 ?AUTO_4196 ) ) ( not ( = ?AUTO_4193 ?AUTO_4196 ) ) ( not ( = ?AUTO_4195 ?AUTO_4196 ) ) ( not ( = ?AUTO_4194 ?AUTO_4196 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4194 ?AUTO_4196 )
      ( MAKE-ON ?AUTO_4191 ?AUTO_4192 )
      ( MAKE-ON-VERIFY ?AUTO_4191 ?AUTO_4192 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4201 - BLOCK
      ?AUTO_4202 - BLOCK
    )
    :vars
    (
      ?AUTO_4205 - BLOCK
      ?AUTO_4204 - BLOCK
      ?AUTO_4206 - BLOCK
      ?AUTO_4203 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4201 ?AUTO_4202 ) ) ( ON ?AUTO_4201 ?AUTO_4205 ) ( CLEAR ?AUTO_4201 ) ( not ( = ?AUTO_4201 ?AUTO_4205 ) ) ( not ( = ?AUTO_4202 ?AUTO_4205 ) ) ( not ( = ?AUTO_4201 ?AUTO_4204 ) ) ( not ( = ?AUTO_4201 ?AUTO_4206 ) ) ( not ( = ?AUTO_4202 ?AUTO_4204 ) ) ( not ( = ?AUTO_4202 ?AUTO_4206 ) ) ( not ( = ?AUTO_4205 ?AUTO_4204 ) ) ( not ( = ?AUTO_4205 ?AUTO_4206 ) ) ( not ( = ?AUTO_4204 ?AUTO_4206 ) ) ( ON ?AUTO_4204 ?AUTO_4202 ) ( CLEAR ?AUTO_4203 ) ( not ( = ?AUTO_4201 ?AUTO_4203 ) ) ( not ( = ?AUTO_4202 ?AUTO_4203 ) ) ( not ( = ?AUTO_4205 ?AUTO_4203 ) ) ( not ( = ?AUTO_4204 ?AUTO_4203 ) ) ( not ( = ?AUTO_4206 ?AUTO_4203 ) ) ( ON ?AUTO_4206 ?AUTO_4204 ) ( CLEAR ?AUTO_4206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4206 ?AUTO_4204 )
      ( MAKE-ON ?AUTO_4201 ?AUTO_4202 )
      ( MAKE-ON-VERIFY ?AUTO_4201 ?AUTO_4202 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4207 - BLOCK
      ?AUTO_4208 - BLOCK
    )
    :vars
    (
      ?AUTO_4209 - BLOCK
      ?AUTO_4210 - BLOCK
      ?AUTO_4211 - BLOCK
      ?AUTO_4212 - BLOCK
      ?AUTO_4213 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4207 ?AUTO_4208 ) ) ( ON ?AUTO_4207 ?AUTO_4209 ) ( CLEAR ?AUTO_4207 ) ( not ( = ?AUTO_4207 ?AUTO_4209 ) ) ( not ( = ?AUTO_4208 ?AUTO_4209 ) ) ( not ( = ?AUTO_4207 ?AUTO_4210 ) ) ( not ( = ?AUTO_4207 ?AUTO_4211 ) ) ( not ( = ?AUTO_4208 ?AUTO_4210 ) ) ( not ( = ?AUTO_4208 ?AUTO_4211 ) ) ( not ( = ?AUTO_4209 ?AUTO_4210 ) ) ( not ( = ?AUTO_4209 ?AUTO_4211 ) ) ( not ( = ?AUTO_4210 ?AUTO_4211 ) ) ( ON ?AUTO_4210 ?AUTO_4208 ) ( CLEAR ?AUTO_4212 ) ( not ( = ?AUTO_4207 ?AUTO_4212 ) ) ( not ( = ?AUTO_4208 ?AUTO_4212 ) ) ( not ( = ?AUTO_4209 ?AUTO_4212 ) ) ( not ( = ?AUTO_4210 ?AUTO_4212 ) ) ( not ( = ?AUTO_4211 ?AUTO_4212 ) ) ( ON ?AUTO_4211 ?AUTO_4210 ) ( CLEAR ?AUTO_4211 ) ( HOLDING ?AUTO_4213 ) ( not ( = ?AUTO_4207 ?AUTO_4213 ) ) ( not ( = ?AUTO_4208 ?AUTO_4213 ) ) ( not ( = ?AUTO_4209 ?AUTO_4213 ) ) ( not ( = ?AUTO_4210 ?AUTO_4213 ) ) ( not ( = ?AUTO_4211 ?AUTO_4213 ) ) ( not ( = ?AUTO_4212 ?AUTO_4213 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4213 )
      ( MAKE-ON ?AUTO_4207 ?AUTO_4208 )
      ( MAKE-ON-VERIFY ?AUTO_4207 ?AUTO_4208 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4214 - BLOCK
      ?AUTO_4215 - BLOCK
    )
    :vars
    (
      ?AUTO_4217 - BLOCK
      ?AUTO_4219 - BLOCK
      ?AUTO_4218 - BLOCK
      ?AUTO_4216 - BLOCK
      ?AUTO_4220 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4214 ?AUTO_4215 ) ) ( ON ?AUTO_4214 ?AUTO_4217 ) ( CLEAR ?AUTO_4214 ) ( not ( = ?AUTO_4214 ?AUTO_4217 ) ) ( not ( = ?AUTO_4215 ?AUTO_4217 ) ) ( not ( = ?AUTO_4214 ?AUTO_4219 ) ) ( not ( = ?AUTO_4214 ?AUTO_4218 ) ) ( not ( = ?AUTO_4215 ?AUTO_4219 ) ) ( not ( = ?AUTO_4215 ?AUTO_4218 ) ) ( not ( = ?AUTO_4217 ?AUTO_4219 ) ) ( not ( = ?AUTO_4217 ?AUTO_4218 ) ) ( not ( = ?AUTO_4219 ?AUTO_4218 ) ) ( ON ?AUTO_4219 ?AUTO_4215 ) ( CLEAR ?AUTO_4216 ) ( not ( = ?AUTO_4214 ?AUTO_4216 ) ) ( not ( = ?AUTO_4215 ?AUTO_4216 ) ) ( not ( = ?AUTO_4217 ?AUTO_4216 ) ) ( not ( = ?AUTO_4219 ?AUTO_4216 ) ) ( not ( = ?AUTO_4218 ?AUTO_4216 ) ) ( ON ?AUTO_4218 ?AUTO_4219 ) ( not ( = ?AUTO_4214 ?AUTO_4220 ) ) ( not ( = ?AUTO_4215 ?AUTO_4220 ) ) ( not ( = ?AUTO_4217 ?AUTO_4220 ) ) ( not ( = ?AUTO_4219 ?AUTO_4220 ) ) ( not ( = ?AUTO_4218 ?AUTO_4220 ) ) ( not ( = ?AUTO_4216 ?AUTO_4220 ) ) ( ON ?AUTO_4220 ?AUTO_4218 ) ( CLEAR ?AUTO_4220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4220 ?AUTO_4218 )
      ( MAKE-ON ?AUTO_4214 ?AUTO_4215 )
      ( MAKE-ON-VERIFY ?AUTO_4214 ?AUTO_4215 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4221 - BLOCK
      ?AUTO_4222 - BLOCK
    )
    :vars
    (
      ?AUTO_4227 - BLOCK
      ?AUTO_4225 - BLOCK
      ?AUTO_4226 - BLOCK
      ?AUTO_4224 - BLOCK
      ?AUTO_4223 - BLOCK
      ?AUTO_4228 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4221 ?AUTO_4222 ) ) ( ON ?AUTO_4221 ?AUTO_4227 ) ( CLEAR ?AUTO_4221 ) ( not ( = ?AUTO_4221 ?AUTO_4227 ) ) ( not ( = ?AUTO_4222 ?AUTO_4227 ) ) ( not ( = ?AUTO_4221 ?AUTO_4225 ) ) ( not ( = ?AUTO_4221 ?AUTO_4226 ) ) ( not ( = ?AUTO_4222 ?AUTO_4225 ) ) ( not ( = ?AUTO_4222 ?AUTO_4226 ) ) ( not ( = ?AUTO_4227 ?AUTO_4225 ) ) ( not ( = ?AUTO_4227 ?AUTO_4226 ) ) ( not ( = ?AUTO_4225 ?AUTO_4226 ) ) ( ON ?AUTO_4225 ?AUTO_4222 ) ( CLEAR ?AUTO_4224 ) ( not ( = ?AUTO_4221 ?AUTO_4224 ) ) ( not ( = ?AUTO_4222 ?AUTO_4224 ) ) ( not ( = ?AUTO_4227 ?AUTO_4224 ) ) ( not ( = ?AUTO_4225 ?AUTO_4224 ) ) ( not ( = ?AUTO_4226 ?AUTO_4224 ) ) ( ON ?AUTO_4226 ?AUTO_4225 ) ( not ( = ?AUTO_4221 ?AUTO_4223 ) ) ( not ( = ?AUTO_4222 ?AUTO_4223 ) ) ( not ( = ?AUTO_4227 ?AUTO_4223 ) ) ( not ( = ?AUTO_4225 ?AUTO_4223 ) ) ( not ( = ?AUTO_4226 ?AUTO_4223 ) ) ( not ( = ?AUTO_4224 ?AUTO_4223 ) ) ( ON ?AUTO_4223 ?AUTO_4226 ) ( CLEAR ?AUTO_4223 ) ( HOLDING ?AUTO_4228 ) ( not ( = ?AUTO_4221 ?AUTO_4228 ) ) ( not ( = ?AUTO_4222 ?AUTO_4228 ) ) ( not ( = ?AUTO_4227 ?AUTO_4228 ) ) ( not ( = ?AUTO_4225 ?AUTO_4228 ) ) ( not ( = ?AUTO_4226 ?AUTO_4228 ) ) ( not ( = ?AUTO_4224 ?AUTO_4228 ) ) ( not ( = ?AUTO_4223 ?AUTO_4228 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4228 )
      ( MAKE-ON ?AUTO_4221 ?AUTO_4222 )
      ( MAKE-ON-VERIFY ?AUTO_4221 ?AUTO_4222 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4229 - BLOCK
      ?AUTO_4230 - BLOCK
    )
    :vars
    (
      ?AUTO_4234 - BLOCK
      ?AUTO_4235 - BLOCK
      ?AUTO_4231 - BLOCK
      ?AUTO_4232 - BLOCK
      ?AUTO_4233 - BLOCK
      ?AUTO_4236 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4229 ?AUTO_4230 ) ) ( ON ?AUTO_4229 ?AUTO_4234 ) ( CLEAR ?AUTO_4229 ) ( not ( = ?AUTO_4229 ?AUTO_4234 ) ) ( not ( = ?AUTO_4230 ?AUTO_4234 ) ) ( not ( = ?AUTO_4229 ?AUTO_4235 ) ) ( not ( = ?AUTO_4229 ?AUTO_4231 ) ) ( not ( = ?AUTO_4230 ?AUTO_4235 ) ) ( not ( = ?AUTO_4230 ?AUTO_4231 ) ) ( not ( = ?AUTO_4234 ?AUTO_4235 ) ) ( not ( = ?AUTO_4234 ?AUTO_4231 ) ) ( not ( = ?AUTO_4235 ?AUTO_4231 ) ) ( ON ?AUTO_4235 ?AUTO_4230 ) ( CLEAR ?AUTO_4232 ) ( not ( = ?AUTO_4229 ?AUTO_4232 ) ) ( not ( = ?AUTO_4230 ?AUTO_4232 ) ) ( not ( = ?AUTO_4234 ?AUTO_4232 ) ) ( not ( = ?AUTO_4235 ?AUTO_4232 ) ) ( not ( = ?AUTO_4231 ?AUTO_4232 ) ) ( ON ?AUTO_4231 ?AUTO_4235 ) ( not ( = ?AUTO_4229 ?AUTO_4233 ) ) ( not ( = ?AUTO_4230 ?AUTO_4233 ) ) ( not ( = ?AUTO_4234 ?AUTO_4233 ) ) ( not ( = ?AUTO_4235 ?AUTO_4233 ) ) ( not ( = ?AUTO_4231 ?AUTO_4233 ) ) ( not ( = ?AUTO_4232 ?AUTO_4233 ) ) ( ON ?AUTO_4233 ?AUTO_4231 ) ( not ( = ?AUTO_4229 ?AUTO_4236 ) ) ( not ( = ?AUTO_4230 ?AUTO_4236 ) ) ( not ( = ?AUTO_4234 ?AUTO_4236 ) ) ( not ( = ?AUTO_4235 ?AUTO_4236 ) ) ( not ( = ?AUTO_4231 ?AUTO_4236 ) ) ( not ( = ?AUTO_4232 ?AUTO_4236 ) ) ( not ( = ?AUTO_4233 ?AUTO_4236 ) ) ( ON ?AUTO_4236 ?AUTO_4233 ) ( CLEAR ?AUTO_4236 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4236 ?AUTO_4233 )
      ( MAKE-ON ?AUTO_4229 ?AUTO_4230 )
      ( MAKE-ON-VERIFY ?AUTO_4229 ?AUTO_4230 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4237 - BLOCK
      ?AUTO_4238 - BLOCK
    )
    :vars
    (
      ?AUTO_4239 - BLOCK
      ?AUTO_4241 - BLOCK
      ?AUTO_4242 - BLOCK
      ?AUTO_4243 - BLOCK
      ?AUTO_4240 - BLOCK
      ?AUTO_4244 - BLOCK
      ?AUTO_4245 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4237 ?AUTO_4238 ) ) ( ON ?AUTO_4237 ?AUTO_4239 ) ( CLEAR ?AUTO_4237 ) ( not ( = ?AUTO_4237 ?AUTO_4239 ) ) ( not ( = ?AUTO_4238 ?AUTO_4239 ) ) ( not ( = ?AUTO_4237 ?AUTO_4241 ) ) ( not ( = ?AUTO_4237 ?AUTO_4242 ) ) ( not ( = ?AUTO_4238 ?AUTO_4241 ) ) ( not ( = ?AUTO_4238 ?AUTO_4242 ) ) ( not ( = ?AUTO_4239 ?AUTO_4241 ) ) ( not ( = ?AUTO_4239 ?AUTO_4242 ) ) ( not ( = ?AUTO_4241 ?AUTO_4242 ) ) ( ON ?AUTO_4241 ?AUTO_4238 ) ( CLEAR ?AUTO_4243 ) ( not ( = ?AUTO_4237 ?AUTO_4243 ) ) ( not ( = ?AUTO_4238 ?AUTO_4243 ) ) ( not ( = ?AUTO_4239 ?AUTO_4243 ) ) ( not ( = ?AUTO_4241 ?AUTO_4243 ) ) ( not ( = ?AUTO_4242 ?AUTO_4243 ) ) ( ON ?AUTO_4242 ?AUTO_4241 ) ( not ( = ?AUTO_4237 ?AUTO_4240 ) ) ( not ( = ?AUTO_4238 ?AUTO_4240 ) ) ( not ( = ?AUTO_4239 ?AUTO_4240 ) ) ( not ( = ?AUTO_4241 ?AUTO_4240 ) ) ( not ( = ?AUTO_4242 ?AUTO_4240 ) ) ( not ( = ?AUTO_4243 ?AUTO_4240 ) ) ( ON ?AUTO_4240 ?AUTO_4242 ) ( not ( = ?AUTO_4237 ?AUTO_4244 ) ) ( not ( = ?AUTO_4238 ?AUTO_4244 ) ) ( not ( = ?AUTO_4239 ?AUTO_4244 ) ) ( not ( = ?AUTO_4241 ?AUTO_4244 ) ) ( not ( = ?AUTO_4242 ?AUTO_4244 ) ) ( not ( = ?AUTO_4243 ?AUTO_4244 ) ) ( not ( = ?AUTO_4240 ?AUTO_4244 ) ) ( ON ?AUTO_4244 ?AUTO_4240 ) ( CLEAR ?AUTO_4244 ) ( HOLDING ?AUTO_4245 ) ( not ( = ?AUTO_4237 ?AUTO_4245 ) ) ( not ( = ?AUTO_4238 ?AUTO_4245 ) ) ( not ( = ?AUTO_4239 ?AUTO_4245 ) ) ( not ( = ?AUTO_4241 ?AUTO_4245 ) ) ( not ( = ?AUTO_4242 ?AUTO_4245 ) ) ( not ( = ?AUTO_4243 ?AUTO_4245 ) ) ( not ( = ?AUTO_4240 ?AUTO_4245 ) ) ( not ( = ?AUTO_4244 ?AUTO_4245 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4245 )
      ( MAKE-ON ?AUTO_4237 ?AUTO_4238 )
      ( MAKE-ON-VERIFY ?AUTO_4237 ?AUTO_4238 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4246 - BLOCK
      ?AUTO_4247 - BLOCK
    )
    :vars
    (
      ?AUTO_4250 - BLOCK
      ?AUTO_4248 - BLOCK
      ?AUTO_4253 - BLOCK
      ?AUTO_4251 - BLOCK
      ?AUTO_4252 - BLOCK
      ?AUTO_4249 - BLOCK
      ?AUTO_4254 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4246 ?AUTO_4247 ) ) ( ON ?AUTO_4246 ?AUTO_4250 ) ( not ( = ?AUTO_4246 ?AUTO_4250 ) ) ( not ( = ?AUTO_4247 ?AUTO_4250 ) ) ( not ( = ?AUTO_4246 ?AUTO_4248 ) ) ( not ( = ?AUTO_4246 ?AUTO_4253 ) ) ( not ( = ?AUTO_4247 ?AUTO_4248 ) ) ( not ( = ?AUTO_4247 ?AUTO_4253 ) ) ( not ( = ?AUTO_4250 ?AUTO_4248 ) ) ( not ( = ?AUTO_4250 ?AUTO_4253 ) ) ( not ( = ?AUTO_4248 ?AUTO_4253 ) ) ( ON ?AUTO_4248 ?AUTO_4247 ) ( CLEAR ?AUTO_4251 ) ( not ( = ?AUTO_4246 ?AUTO_4251 ) ) ( not ( = ?AUTO_4247 ?AUTO_4251 ) ) ( not ( = ?AUTO_4250 ?AUTO_4251 ) ) ( not ( = ?AUTO_4248 ?AUTO_4251 ) ) ( not ( = ?AUTO_4253 ?AUTO_4251 ) ) ( ON ?AUTO_4253 ?AUTO_4248 ) ( not ( = ?AUTO_4246 ?AUTO_4252 ) ) ( not ( = ?AUTO_4247 ?AUTO_4252 ) ) ( not ( = ?AUTO_4250 ?AUTO_4252 ) ) ( not ( = ?AUTO_4248 ?AUTO_4252 ) ) ( not ( = ?AUTO_4253 ?AUTO_4252 ) ) ( not ( = ?AUTO_4251 ?AUTO_4252 ) ) ( ON ?AUTO_4252 ?AUTO_4253 ) ( not ( = ?AUTO_4246 ?AUTO_4249 ) ) ( not ( = ?AUTO_4247 ?AUTO_4249 ) ) ( not ( = ?AUTO_4250 ?AUTO_4249 ) ) ( not ( = ?AUTO_4248 ?AUTO_4249 ) ) ( not ( = ?AUTO_4253 ?AUTO_4249 ) ) ( not ( = ?AUTO_4251 ?AUTO_4249 ) ) ( not ( = ?AUTO_4252 ?AUTO_4249 ) ) ( ON ?AUTO_4249 ?AUTO_4252 ) ( CLEAR ?AUTO_4249 ) ( not ( = ?AUTO_4246 ?AUTO_4254 ) ) ( not ( = ?AUTO_4247 ?AUTO_4254 ) ) ( not ( = ?AUTO_4250 ?AUTO_4254 ) ) ( not ( = ?AUTO_4248 ?AUTO_4254 ) ) ( not ( = ?AUTO_4253 ?AUTO_4254 ) ) ( not ( = ?AUTO_4251 ?AUTO_4254 ) ) ( not ( = ?AUTO_4252 ?AUTO_4254 ) ) ( not ( = ?AUTO_4249 ?AUTO_4254 ) ) ( ON ?AUTO_4254 ?AUTO_4246 ) ( CLEAR ?AUTO_4254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4254 ?AUTO_4246 )
      ( MAKE-ON ?AUTO_4246 ?AUTO_4247 )
      ( MAKE-ON-VERIFY ?AUTO_4246 ?AUTO_4247 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4257 - BLOCK
      ?AUTO_4258 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4257 ) ( CLEAR ?AUTO_4258 ) ( not ( = ?AUTO_4257 ?AUTO_4258 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4257 ?AUTO_4258 )
      ( MAKE-ON-VERIFY ?AUTO_4257 ?AUTO_4258 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4259 - BLOCK
      ?AUTO_4260 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4260 ) ( not ( = ?AUTO_4259 ?AUTO_4260 ) ) ( ON-TABLE ?AUTO_4259 ) ( CLEAR ?AUTO_4259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4259 )
      ( MAKE-ON ?AUTO_4259 ?AUTO_4260 )
      ( MAKE-ON-VERIFY ?AUTO_4259 ?AUTO_4260 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4261 - BLOCK
      ?AUTO_4262 - BLOCK
    )
    :vars
    (
      ?AUTO_4263 - BLOCK
      ?AUTO_4264 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4262 ) ( not ( = ?AUTO_4261 ?AUTO_4262 ) ) ( ON-TABLE ?AUTO_4261 ) ( CLEAR ?AUTO_4261 ) ( HOLDING ?AUTO_4263 ) ( CLEAR ?AUTO_4264 ) ( not ( = ?AUTO_4261 ?AUTO_4263 ) ) ( not ( = ?AUTO_4261 ?AUTO_4264 ) ) ( not ( = ?AUTO_4262 ?AUTO_4263 ) ) ( not ( = ?AUTO_4262 ?AUTO_4264 ) ) ( not ( = ?AUTO_4263 ?AUTO_4264 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4263 ?AUTO_4264 )
      ( MAKE-ON ?AUTO_4261 ?AUTO_4262 )
      ( MAKE-ON-VERIFY ?AUTO_4261 ?AUTO_4262 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4265 - BLOCK
      ?AUTO_4266 - BLOCK
    )
    :vars
    (
      ?AUTO_4267 - BLOCK
      ?AUTO_4268 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4266 ) ( not ( = ?AUTO_4265 ?AUTO_4266 ) ) ( ON-TABLE ?AUTO_4265 ) ( CLEAR ?AUTO_4267 ) ( not ( = ?AUTO_4265 ?AUTO_4268 ) ) ( not ( = ?AUTO_4265 ?AUTO_4267 ) ) ( not ( = ?AUTO_4266 ?AUTO_4268 ) ) ( not ( = ?AUTO_4266 ?AUTO_4267 ) ) ( not ( = ?AUTO_4268 ?AUTO_4267 ) ) ( ON ?AUTO_4268 ?AUTO_4265 ) ( CLEAR ?AUTO_4268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4268 ?AUTO_4265 )
      ( MAKE-ON ?AUTO_4265 ?AUTO_4266 )
      ( MAKE-ON-VERIFY ?AUTO_4265 ?AUTO_4266 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4269 - BLOCK
      ?AUTO_4270 - BLOCK
    )
    :vars
    (
      ?AUTO_4271 - BLOCK
      ?AUTO_4272 - BLOCK
      ?AUTO_4273 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4270 ) ( not ( = ?AUTO_4269 ?AUTO_4270 ) ) ( ON-TABLE ?AUTO_4269 ) ( not ( = ?AUTO_4269 ?AUTO_4271 ) ) ( not ( = ?AUTO_4269 ?AUTO_4272 ) ) ( not ( = ?AUTO_4270 ?AUTO_4271 ) ) ( not ( = ?AUTO_4270 ?AUTO_4272 ) ) ( not ( = ?AUTO_4271 ?AUTO_4272 ) ) ( ON ?AUTO_4271 ?AUTO_4269 ) ( CLEAR ?AUTO_4271 ) ( HOLDING ?AUTO_4272 ) ( CLEAR ?AUTO_4273 ) ( not ( = ?AUTO_4269 ?AUTO_4273 ) ) ( not ( = ?AUTO_4270 ?AUTO_4273 ) ) ( not ( = ?AUTO_4271 ?AUTO_4273 ) ) ( not ( = ?AUTO_4272 ?AUTO_4273 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4272 ?AUTO_4273 )
      ( MAKE-ON ?AUTO_4269 ?AUTO_4270 )
      ( MAKE-ON-VERIFY ?AUTO_4269 ?AUTO_4270 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4284 - BLOCK
      ?AUTO_4285 - BLOCK
    )
    :vars
    (
      ?AUTO_4287 - BLOCK
      ?AUTO_4286 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4284 ?AUTO_4285 ) ) ( ON-TABLE ?AUTO_4284 ) ( CLEAR ?AUTO_4287 ) ( not ( = ?AUTO_4284 ?AUTO_4286 ) ) ( not ( = ?AUTO_4284 ?AUTO_4287 ) ) ( not ( = ?AUTO_4285 ?AUTO_4286 ) ) ( not ( = ?AUTO_4285 ?AUTO_4287 ) ) ( not ( = ?AUTO_4286 ?AUTO_4287 ) ) ( ON ?AUTO_4286 ?AUTO_4284 ) ( CLEAR ?AUTO_4286 ) ( HOLDING ?AUTO_4285 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4285 )
      ( MAKE-ON ?AUTO_4284 ?AUTO_4285 )
      ( MAKE-ON-VERIFY ?AUTO_4284 ?AUTO_4285 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4292 - BLOCK
      ?AUTO_4293 - BLOCK
    )
    :vars
    (
      ?AUTO_4295 - BLOCK
      ?AUTO_4294 - BLOCK
      ?AUTO_4296 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4292 ?AUTO_4293 ) ) ( ON-TABLE ?AUTO_4292 ) ( not ( = ?AUTO_4292 ?AUTO_4295 ) ) ( not ( = ?AUTO_4292 ?AUTO_4294 ) ) ( not ( = ?AUTO_4293 ?AUTO_4295 ) ) ( not ( = ?AUTO_4293 ?AUTO_4294 ) ) ( not ( = ?AUTO_4295 ?AUTO_4294 ) ) ( ON ?AUTO_4295 ?AUTO_4292 ) ( CLEAR ?AUTO_4295 ) ( CLEAR ?AUTO_4296 ) ( not ( = ?AUTO_4292 ?AUTO_4296 ) ) ( not ( = ?AUTO_4293 ?AUTO_4296 ) ) ( not ( = ?AUTO_4295 ?AUTO_4296 ) ) ( not ( = ?AUTO_4294 ?AUTO_4296 ) ) ( ON ?AUTO_4294 ?AUTO_4293 ) ( CLEAR ?AUTO_4294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4294 ?AUTO_4293 )
      ( MAKE-ON ?AUTO_4292 ?AUTO_4293 )
      ( MAKE-ON-VERIFY ?AUTO_4292 ?AUTO_4293 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4297 - BLOCK
      ?AUTO_4298 - BLOCK
    )
    :vars
    (
      ?AUTO_4300 - BLOCK
      ?AUTO_4299 - BLOCK
      ?AUTO_4301 - BLOCK
      ?AUTO_4302 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4297 ?AUTO_4298 ) ) ( ON-TABLE ?AUTO_4297 ) ( not ( = ?AUTO_4297 ?AUTO_4300 ) ) ( not ( = ?AUTO_4297 ?AUTO_4299 ) ) ( not ( = ?AUTO_4298 ?AUTO_4300 ) ) ( not ( = ?AUTO_4298 ?AUTO_4299 ) ) ( not ( = ?AUTO_4300 ?AUTO_4299 ) ) ( ON ?AUTO_4300 ?AUTO_4297 ) ( CLEAR ?AUTO_4300 ) ( CLEAR ?AUTO_4301 ) ( not ( = ?AUTO_4297 ?AUTO_4301 ) ) ( not ( = ?AUTO_4298 ?AUTO_4301 ) ) ( not ( = ?AUTO_4300 ?AUTO_4301 ) ) ( not ( = ?AUTO_4299 ?AUTO_4301 ) ) ( ON ?AUTO_4299 ?AUTO_4298 ) ( CLEAR ?AUTO_4299 ) ( HOLDING ?AUTO_4302 ) ( not ( = ?AUTO_4297 ?AUTO_4302 ) ) ( not ( = ?AUTO_4298 ?AUTO_4302 ) ) ( not ( = ?AUTO_4300 ?AUTO_4302 ) ) ( not ( = ?AUTO_4299 ?AUTO_4302 ) ) ( not ( = ?AUTO_4301 ?AUTO_4302 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4302 )
      ( MAKE-ON ?AUTO_4297 ?AUTO_4298 )
      ( MAKE-ON-VERIFY ?AUTO_4297 ?AUTO_4298 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4303 - BLOCK
      ?AUTO_4304 - BLOCK
    )
    :vars
    (
      ?AUTO_4306 - BLOCK
      ?AUTO_4307 - BLOCK
      ?AUTO_4305 - BLOCK
      ?AUTO_4308 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4303 ?AUTO_4304 ) ) ( ON-TABLE ?AUTO_4303 ) ( not ( = ?AUTO_4303 ?AUTO_4306 ) ) ( not ( = ?AUTO_4303 ?AUTO_4307 ) ) ( not ( = ?AUTO_4304 ?AUTO_4306 ) ) ( not ( = ?AUTO_4304 ?AUTO_4307 ) ) ( not ( = ?AUTO_4306 ?AUTO_4307 ) ) ( ON ?AUTO_4306 ?AUTO_4303 ) ( CLEAR ?AUTO_4306 ) ( CLEAR ?AUTO_4305 ) ( not ( = ?AUTO_4303 ?AUTO_4305 ) ) ( not ( = ?AUTO_4304 ?AUTO_4305 ) ) ( not ( = ?AUTO_4306 ?AUTO_4305 ) ) ( not ( = ?AUTO_4307 ?AUTO_4305 ) ) ( ON ?AUTO_4307 ?AUTO_4304 ) ( not ( = ?AUTO_4303 ?AUTO_4308 ) ) ( not ( = ?AUTO_4304 ?AUTO_4308 ) ) ( not ( = ?AUTO_4306 ?AUTO_4308 ) ) ( not ( = ?AUTO_4307 ?AUTO_4308 ) ) ( not ( = ?AUTO_4305 ?AUTO_4308 ) ) ( ON ?AUTO_4308 ?AUTO_4307 ) ( CLEAR ?AUTO_4308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4308 ?AUTO_4307 )
      ( MAKE-ON ?AUTO_4303 ?AUTO_4304 )
      ( MAKE-ON-VERIFY ?AUTO_4303 ?AUTO_4304 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4309 - BLOCK
      ?AUTO_4310 - BLOCK
    )
    :vars
    (
      ?AUTO_4314 - BLOCK
      ?AUTO_4312 - BLOCK
      ?AUTO_4313 - BLOCK
      ?AUTO_4311 - BLOCK
      ?AUTO_4315 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4309 ?AUTO_4310 ) ) ( ON-TABLE ?AUTO_4309 ) ( not ( = ?AUTO_4309 ?AUTO_4314 ) ) ( not ( = ?AUTO_4309 ?AUTO_4312 ) ) ( not ( = ?AUTO_4310 ?AUTO_4314 ) ) ( not ( = ?AUTO_4310 ?AUTO_4312 ) ) ( not ( = ?AUTO_4314 ?AUTO_4312 ) ) ( ON ?AUTO_4314 ?AUTO_4309 ) ( CLEAR ?AUTO_4314 ) ( CLEAR ?AUTO_4313 ) ( not ( = ?AUTO_4309 ?AUTO_4313 ) ) ( not ( = ?AUTO_4310 ?AUTO_4313 ) ) ( not ( = ?AUTO_4314 ?AUTO_4313 ) ) ( not ( = ?AUTO_4312 ?AUTO_4313 ) ) ( ON ?AUTO_4312 ?AUTO_4310 ) ( not ( = ?AUTO_4309 ?AUTO_4311 ) ) ( not ( = ?AUTO_4310 ?AUTO_4311 ) ) ( not ( = ?AUTO_4314 ?AUTO_4311 ) ) ( not ( = ?AUTO_4312 ?AUTO_4311 ) ) ( not ( = ?AUTO_4313 ?AUTO_4311 ) ) ( ON ?AUTO_4311 ?AUTO_4312 ) ( CLEAR ?AUTO_4311 ) ( HOLDING ?AUTO_4315 ) ( not ( = ?AUTO_4309 ?AUTO_4315 ) ) ( not ( = ?AUTO_4310 ?AUTO_4315 ) ) ( not ( = ?AUTO_4314 ?AUTO_4315 ) ) ( not ( = ?AUTO_4312 ?AUTO_4315 ) ) ( not ( = ?AUTO_4313 ?AUTO_4315 ) ) ( not ( = ?AUTO_4311 ?AUTO_4315 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4315 )
      ( MAKE-ON ?AUTO_4309 ?AUTO_4310 )
      ( MAKE-ON-VERIFY ?AUTO_4309 ?AUTO_4310 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4316 - BLOCK
      ?AUTO_4317 - BLOCK
    )
    :vars
    (
      ?AUTO_4320 - BLOCK
      ?AUTO_4318 - BLOCK
      ?AUTO_4321 - BLOCK
      ?AUTO_4319 - BLOCK
      ?AUTO_4322 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4316 ?AUTO_4317 ) ) ( ON-TABLE ?AUTO_4316 ) ( not ( = ?AUTO_4316 ?AUTO_4320 ) ) ( not ( = ?AUTO_4316 ?AUTO_4318 ) ) ( not ( = ?AUTO_4317 ?AUTO_4320 ) ) ( not ( = ?AUTO_4317 ?AUTO_4318 ) ) ( not ( = ?AUTO_4320 ?AUTO_4318 ) ) ( ON ?AUTO_4320 ?AUTO_4316 ) ( CLEAR ?AUTO_4321 ) ( not ( = ?AUTO_4316 ?AUTO_4321 ) ) ( not ( = ?AUTO_4317 ?AUTO_4321 ) ) ( not ( = ?AUTO_4320 ?AUTO_4321 ) ) ( not ( = ?AUTO_4318 ?AUTO_4321 ) ) ( ON ?AUTO_4318 ?AUTO_4317 ) ( not ( = ?AUTO_4316 ?AUTO_4319 ) ) ( not ( = ?AUTO_4317 ?AUTO_4319 ) ) ( not ( = ?AUTO_4320 ?AUTO_4319 ) ) ( not ( = ?AUTO_4318 ?AUTO_4319 ) ) ( not ( = ?AUTO_4321 ?AUTO_4319 ) ) ( ON ?AUTO_4319 ?AUTO_4318 ) ( CLEAR ?AUTO_4319 ) ( not ( = ?AUTO_4316 ?AUTO_4322 ) ) ( not ( = ?AUTO_4317 ?AUTO_4322 ) ) ( not ( = ?AUTO_4320 ?AUTO_4322 ) ) ( not ( = ?AUTO_4318 ?AUTO_4322 ) ) ( not ( = ?AUTO_4321 ?AUTO_4322 ) ) ( not ( = ?AUTO_4319 ?AUTO_4322 ) ) ( ON ?AUTO_4322 ?AUTO_4320 ) ( CLEAR ?AUTO_4322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4322 ?AUTO_4320 )
      ( MAKE-ON ?AUTO_4316 ?AUTO_4317 )
      ( MAKE-ON-VERIFY ?AUTO_4316 ?AUTO_4317 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4325 - BLOCK
      ?AUTO_4326 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4325 ) ( CLEAR ?AUTO_4326 ) ( not ( = ?AUTO_4325 ?AUTO_4326 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4325 ?AUTO_4326 )
      ( MAKE-ON-VERIFY ?AUTO_4325 ?AUTO_4326 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4327 - BLOCK
      ?AUTO_4328 - BLOCK
    )
    :vars
    (
      ?AUTO_4329 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4328 ) ( not ( = ?AUTO_4327 ?AUTO_4328 ) ) ( ON ?AUTO_4327 ?AUTO_4329 ) ( CLEAR ?AUTO_4327 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4327 ?AUTO_4329 ) ) ( not ( = ?AUTO_4328 ?AUTO_4329 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4327 ?AUTO_4329 )
      ( MAKE-ON ?AUTO_4327 ?AUTO_4328 )
      ( MAKE-ON-VERIFY ?AUTO_4327 ?AUTO_4328 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4330 - BLOCK
      ?AUTO_4331 - BLOCK
    )
    :vars
    (
      ?AUTO_4332 - BLOCK
      ?AUTO_4333 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4330 ?AUTO_4331 ) ) ( ON ?AUTO_4330 ?AUTO_4332 ) ( CLEAR ?AUTO_4330 ) ( not ( = ?AUTO_4330 ?AUTO_4332 ) ) ( not ( = ?AUTO_4331 ?AUTO_4332 ) ) ( HOLDING ?AUTO_4331 ) ( CLEAR ?AUTO_4333 ) ( not ( = ?AUTO_4330 ?AUTO_4333 ) ) ( not ( = ?AUTO_4331 ?AUTO_4333 ) ) ( not ( = ?AUTO_4332 ?AUTO_4333 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4331 ?AUTO_4333 )
      ( MAKE-ON ?AUTO_4330 ?AUTO_4331 )
      ( MAKE-ON-VERIFY ?AUTO_4330 ?AUTO_4331 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4335 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4335 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4335 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4335 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4336 - BLOCK
    )
    :vars
    (
      ?AUTO_4337 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4336 ?AUTO_4337 ) ( CLEAR ?AUTO_4336 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4336 ?AUTO_4337 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4336 ?AUTO_4337 )
      ( MAKE-ON-TABLE ?AUTO_4336 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4336 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4339 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4339 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4339 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4339 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4340 - BLOCK
    )
    :vars
    (
      ?AUTO_4341 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4340 ?AUTO_4341 ) ( CLEAR ?AUTO_4340 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4340 ?AUTO_4341 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4340 ?AUTO_4341 )
      ( MAKE-ON-TABLE ?AUTO_4340 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4340 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4342 - BLOCK
    )
    :vars
    (
      ?AUTO_4343 - BLOCK
      ?AUTO_4344 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4342 ?AUTO_4343 ) ( CLEAR ?AUTO_4342 ) ( not ( = ?AUTO_4342 ?AUTO_4343 ) ) ( HOLDING ?AUTO_4344 ) ( not ( = ?AUTO_4342 ?AUTO_4344 ) ) ( not ( = ?AUTO_4343 ?AUTO_4344 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4344 )
      ( MAKE-ON-TABLE ?AUTO_4342 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4342 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4345 - BLOCK
    )
    :vars
    (
      ?AUTO_4347 - BLOCK
      ?AUTO_4346 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4345 ?AUTO_4347 ) ( not ( = ?AUTO_4345 ?AUTO_4347 ) ) ( not ( = ?AUTO_4345 ?AUTO_4346 ) ) ( not ( = ?AUTO_4347 ?AUTO_4346 ) ) ( ON ?AUTO_4346 ?AUTO_4345 ) ( CLEAR ?AUTO_4346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4346 ?AUTO_4345 )
      ( MAKE-ON-TABLE ?AUTO_4345 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4345 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4350 - BLOCK
      ?AUTO_4351 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4350 ) ( CLEAR ?AUTO_4351 ) ( not ( = ?AUTO_4350 ?AUTO_4351 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4350 ?AUTO_4351 )
      ( MAKE-ON-VERIFY ?AUTO_4350 ?AUTO_4351 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4352 - BLOCK
      ?AUTO_4353 - BLOCK
    )
    :vars
    (
      ?AUTO_4354 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4353 ) ( not ( = ?AUTO_4352 ?AUTO_4353 ) ) ( ON ?AUTO_4352 ?AUTO_4354 ) ( CLEAR ?AUTO_4352 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4352 ?AUTO_4354 ) ) ( not ( = ?AUTO_4353 ?AUTO_4354 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4352 ?AUTO_4354 )
      ( MAKE-ON ?AUTO_4352 ?AUTO_4353 )
      ( MAKE-ON-VERIFY ?AUTO_4352 ?AUTO_4353 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4355 - BLOCK
      ?AUTO_4356 - BLOCK
    )
    :vars
    (
      ?AUTO_4357 - BLOCK
      ?AUTO_4358 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4356 ) ( not ( = ?AUTO_4355 ?AUTO_4356 ) ) ( ON ?AUTO_4355 ?AUTO_4357 ) ( CLEAR ?AUTO_4355 ) ( not ( = ?AUTO_4355 ?AUTO_4357 ) ) ( not ( = ?AUTO_4356 ?AUTO_4357 ) ) ( HOLDING ?AUTO_4358 ) ( not ( = ?AUTO_4355 ?AUTO_4358 ) ) ( not ( = ?AUTO_4356 ?AUTO_4358 ) ) ( not ( = ?AUTO_4357 ?AUTO_4358 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4358 )
      ( MAKE-ON ?AUTO_4355 ?AUTO_4356 )
      ( MAKE-ON-VERIFY ?AUTO_4355 ?AUTO_4356 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4361 - BLOCK
      ?AUTO_4362 - BLOCK
    )
    :vars
    (
      ?AUTO_4363 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4361 ?AUTO_4362 ) ) ( ON ?AUTO_4361 ?AUTO_4363 ) ( CLEAR ?AUTO_4361 ) ( not ( = ?AUTO_4361 ?AUTO_4363 ) ) ( not ( = ?AUTO_4362 ?AUTO_4363 ) ) ( HOLDING ?AUTO_4362 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4362 )
      ( MAKE-ON ?AUTO_4361 ?AUTO_4362 )
      ( MAKE-ON-VERIFY ?AUTO_4361 ?AUTO_4362 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4368 - BLOCK
      ?AUTO_4369 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4368 ) ( CLEAR ?AUTO_4369 ) ( not ( = ?AUTO_4368 ?AUTO_4369 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4368 ?AUTO_4369 )
      ( MAKE-ON-VERIFY ?AUTO_4368 ?AUTO_4369 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4370 - BLOCK
      ?AUTO_4371 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4371 ) ( not ( = ?AUTO_4370 ?AUTO_4371 ) ) ( ON-TABLE ?AUTO_4370 ) ( CLEAR ?AUTO_4370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4370 )
      ( MAKE-ON ?AUTO_4370 ?AUTO_4371 )
      ( MAKE-ON-VERIFY ?AUTO_4370 ?AUTO_4371 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4372 - BLOCK
      ?AUTO_4373 - BLOCK
    )
    :vars
    (
      ?AUTO_4374 - BLOCK
      ?AUTO_4375 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4373 ) ( not ( = ?AUTO_4372 ?AUTO_4373 ) ) ( ON-TABLE ?AUTO_4372 ) ( CLEAR ?AUTO_4372 ) ( HOLDING ?AUTO_4374 ) ( CLEAR ?AUTO_4375 ) ( not ( = ?AUTO_4372 ?AUTO_4374 ) ) ( not ( = ?AUTO_4372 ?AUTO_4375 ) ) ( not ( = ?AUTO_4373 ?AUTO_4374 ) ) ( not ( = ?AUTO_4373 ?AUTO_4375 ) ) ( not ( = ?AUTO_4374 ?AUTO_4375 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4374 ?AUTO_4375 )
      ( MAKE-ON ?AUTO_4372 ?AUTO_4373 )
      ( MAKE-ON-VERIFY ?AUTO_4372 ?AUTO_4373 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4376 - BLOCK
      ?AUTO_4377 - BLOCK
    )
    :vars
    (
      ?AUTO_4378 - BLOCK
      ?AUTO_4379 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4376 ?AUTO_4377 ) ) ( ON-TABLE ?AUTO_4376 ) ( CLEAR ?AUTO_4376 ) ( CLEAR ?AUTO_4378 ) ( not ( = ?AUTO_4376 ?AUTO_4379 ) ) ( not ( = ?AUTO_4376 ?AUTO_4378 ) ) ( not ( = ?AUTO_4377 ?AUTO_4379 ) ) ( not ( = ?AUTO_4377 ?AUTO_4378 ) ) ( not ( = ?AUTO_4379 ?AUTO_4378 ) ) ( ON ?AUTO_4379 ?AUTO_4377 ) ( CLEAR ?AUTO_4379 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4379 ?AUTO_4377 )
      ( MAKE-ON ?AUTO_4376 ?AUTO_4377 )
      ( MAKE-ON-VERIFY ?AUTO_4376 ?AUTO_4377 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4380 - BLOCK
      ?AUTO_4381 - BLOCK
    )
    :vars
    (
      ?AUTO_4382 - BLOCK
      ?AUTO_4383 - BLOCK
      ?AUTO_4384 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4380 ?AUTO_4381 ) ) ( ON-TABLE ?AUTO_4380 ) ( CLEAR ?AUTO_4380 ) ( CLEAR ?AUTO_4382 ) ( not ( = ?AUTO_4380 ?AUTO_4383 ) ) ( not ( = ?AUTO_4380 ?AUTO_4382 ) ) ( not ( = ?AUTO_4381 ?AUTO_4383 ) ) ( not ( = ?AUTO_4381 ?AUTO_4382 ) ) ( not ( = ?AUTO_4383 ?AUTO_4382 ) ) ( ON ?AUTO_4383 ?AUTO_4381 ) ( CLEAR ?AUTO_4383 ) ( HOLDING ?AUTO_4384 ) ( not ( = ?AUTO_4380 ?AUTO_4384 ) ) ( not ( = ?AUTO_4381 ?AUTO_4384 ) ) ( not ( = ?AUTO_4382 ?AUTO_4384 ) ) ( not ( = ?AUTO_4383 ?AUTO_4384 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4384 )
      ( MAKE-ON ?AUTO_4380 ?AUTO_4381 )
      ( MAKE-ON-VERIFY ?AUTO_4380 ?AUTO_4381 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4385 - BLOCK
      ?AUTO_4386 - BLOCK
    )
    :vars
    (
      ?AUTO_4389 - BLOCK
      ?AUTO_4388 - BLOCK
      ?AUTO_4387 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4385 ?AUTO_4386 ) ) ( ON-TABLE ?AUTO_4385 ) ( CLEAR ?AUTO_4389 ) ( not ( = ?AUTO_4385 ?AUTO_4388 ) ) ( not ( = ?AUTO_4385 ?AUTO_4389 ) ) ( not ( = ?AUTO_4386 ?AUTO_4388 ) ) ( not ( = ?AUTO_4386 ?AUTO_4389 ) ) ( not ( = ?AUTO_4388 ?AUTO_4389 ) ) ( ON ?AUTO_4388 ?AUTO_4386 ) ( CLEAR ?AUTO_4388 ) ( not ( = ?AUTO_4385 ?AUTO_4387 ) ) ( not ( = ?AUTO_4386 ?AUTO_4387 ) ) ( not ( = ?AUTO_4389 ?AUTO_4387 ) ) ( not ( = ?AUTO_4388 ?AUTO_4387 ) ) ( ON ?AUTO_4387 ?AUTO_4385 ) ( CLEAR ?AUTO_4387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4387 ?AUTO_4385 )
      ( MAKE-ON ?AUTO_4385 ?AUTO_4386 )
      ( MAKE-ON-VERIFY ?AUTO_4385 ?AUTO_4386 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4390 - BLOCK
      ?AUTO_4391 - BLOCK
    )
    :vars
    (
      ?AUTO_4392 - BLOCK
      ?AUTO_4394 - BLOCK
      ?AUTO_4393 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4390 ?AUTO_4391 ) ) ( ON-TABLE ?AUTO_4390 ) ( not ( = ?AUTO_4390 ?AUTO_4392 ) ) ( not ( = ?AUTO_4390 ?AUTO_4394 ) ) ( not ( = ?AUTO_4391 ?AUTO_4392 ) ) ( not ( = ?AUTO_4391 ?AUTO_4394 ) ) ( not ( = ?AUTO_4392 ?AUTO_4394 ) ) ( ON ?AUTO_4392 ?AUTO_4391 ) ( CLEAR ?AUTO_4392 ) ( not ( = ?AUTO_4390 ?AUTO_4393 ) ) ( not ( = ?AUTO_4391 ?AUTO_4393 ) ) ( not ( = ?AUTO_4394 ?AUTO_4393 ) ) ( not ( = ?AUTO_4392 ?AUTO_4393 ) ) ( ON ?AUTO_4393 ?AUTO_4390 ) ( CLEAR ?AUTO_4393 ) ( HOLDING ?AUTO_4394 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4394 )
      ( MAKE-ON ?AUTO_4390 ?AUTO_4391 )
      ( MAKE-ON-VERIFY ?AUTO_4390 ?AUTO_4391 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4395 - BLOCK
      ?AUTO_4396 - BLOCK
    )
    :vars
    (
      ?AUTO_4398 - BLOCK
      ?AUTO_4399 - BLOCK
      ?AUTO_4397 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4395 ?AUTO_4396 ) ) ( ON-TABLE ?AUTO_4395 ) ( not ( = ?AUTO_4395 ?AUTO_4398 ) ) ( not ( = ?AUTO_4395 ?AUTO_4399 ) ) ( not ( = ?AUTO_4396 ?AUTO_4398 ) ) ( not ( = ?AUTO_4396 ?AUTO_4399 ) ) ( not ( = ?AUTO_4398 ?AUTO_4399 ) ) ( ON ?AUTO_4398 ?AUTO_4396 ) ( CLEAR ?AUTO_4398 ) ( not ( = ?AUTO_4395 ?AUTO_4397 ) ) ( not ( = ?AUTO_4396 ?AUTO_4397 ) ) ( not ( = ?AUTO_4399 ?AUTO_4397 ) ) ( not ( = ?AUTO_4398 ?AUTO_4397 ) ) ( ON ?AUTO_4397 ?AUTO_4395 ) ( ON ?AUTO_4399 ?AUTO_4397 ) ( CLEAR ?AUTO_4399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4399 ?AUTO_4397 )
      ( MAKE-ON ?AUTO_4395 ?AUTO_4396 )
      ( MAKE-ON-VERIFY ?AUTO_4395 ?AUTO_4396 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4401 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4401 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4401 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4401 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4402 - BLOCK
    )
    :vars
    (
      ?AUTO_4403 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4402 ?AUTO_4403 ) ( CLEAR ?AUTO_4402 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4402 ?AUTO_4403 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4402 ?AUTO_4403 )
      ( MAKE-ON-TABLE ?AUTO_4402 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4402 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4406 - BLOCK
      ?AUTO_4407 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4406 ) ( CLEAR ?AUTO_4407 ) ( not ( = ?AUTO_4406 ?AUTO_4407 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4406 ?AUTO_4407 )
      ( MAKE-ON-VERIFY ?AUTO_4406 ?AUTO_4407 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4408 - BLOCK
      ?AUTO_4409 - BLOCK
    )
    :vars
    (
      ?AUTO_4410 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4409 ) ( not ( = ?AUTO_4408 ?AUTO_4409 ) ) ( ON ?AUTO_4408 ?AUTO_4410 ) ( CLEAR ?AUTO_4408 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4408 ?AUTO_4410 ) ) ( not ( = ?AUTO_4409 ?AUTO_4410 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4408 ?AUTO_4410 )
      ( MAKE-ON ?AUTO_4408 ?AUTO_4409 )
      ( MAKE-ON-VERIFY ?AUTO_4408 ?AUTO_4409 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4411 - BLOCK
      ?AUTO_4412 - BLOCK
    )
    :vars
    (
      ?AUTO_4413 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4411 ?AUTO_4412 ) ) ( ON ?AUTO_4411 ?AUTO_4413 ) ( CLEAR ?AUTO_4411 ) ( not ( = ?AUTO_4411 ?AUTO_4413 ) ) ( not ( = ?AUTO_4412 ?AUTO_4413 ) ) ( HOLDING ?AUTO_4412 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4412 )
      ( MAKE-ON ?AUTO_4411 ?AUTO_4412 )
      ( MAKE-ON-VERIFY ?AUTO_4411 ?AUTO_4412 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4414 - BLOCK
      ?AUTO_4415 - BLOCK
    )
    :vars
    (
      ?AUTO_4416 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4414 ?AUTO_4415 ) ) ( ON ?AUTO_4414 ?AUTO_4416 ) ( not ( = ?AUTO_4414 ?AUTO_4416 ) ) ( not ( = ?AUTO_4415 ?AUTO_4416 ) ) ( ON ?AUTO_4415 ?AUTO_4414 ) ( CLEAR ?AUTO_4415 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4415 ?AUTO_4414 )
      ( MAKE-ON ?AUTO_4414 ?AUTO_4415 )
      ( MAKE-ON-VERIFY ?AUTO_4414 ?AUTO_4415 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4419 - BLOCK
      ?AUTO_4420 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4419 ) ( CLEAR ?AUTO_4420 ) ( not ( = ?AUTO_4419 ?AUTO_4420 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4419 ?AUTO_4420 )
      ( MAKE-ON-VERIFY ?AUTO_4419 ?AUTO_4420 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4421 - BLOCK
      ?AUTO_4422 - BLOCK
    )
    :vars
    (
      ?AUTO_4423 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4422 ) ( not ( = ?AUTO_4421 ?AUTO_4422 ) ) ( ON ?AUTO_4421 ?AUTO_4423 ) ( CLEAR ?AUTO_4421 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4421 ?AUTO_4423 ) ) ( not ( = ?AUTO_4422 ?AUTO_4423 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4421 ?AUTO_4423 )
      ( MAKE-ON ?AUTO_4421 ?AUTO_4422 )
      ( MAKE-ON-VERIFY ?AUTO_4421 ?AUTO_4422 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4424 - BLOCK
      ?AUTO_4425 - BLOCK
    )
    :vars
    (
      ?AUTO_4426 - BLOCK
      ?AUTO_4427 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4424 ?AUTO_4425 ) ) ( ON ?AUTO_4424 ?AUTO_4426 ) ( CLEAR ?AUTO_4424 ) ( not ( = ?AUTO_4424 ?AUTO_4426 ) ) ( not ( = ?AUTO_4425 ?AUTO_4426 ) ) ( HOLDING ?AUTO_4425 ) ( CLEAR ?AUTO_4427 ) ( not ( = ?AUTO_4424 ?AUTO_4427 ) ) ( not ( = ?AUTO_4425 ?AUTO_4427 ) ) ( not ( = ?AUTO_4426 ?AUTO_4427 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4425 ?AUTO_4427 )
      ( MAKE-ON ?AUTO_4424 ?AUTO_4425 )
      ( MAKE-ON-VERIFY ?AUTO_4424 ?AUTO_4425 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4430 - BLOCK
      ?AUTO_4431 - BLOCK
    )
    :vars
    (
      ?AUTO_4432 - BLOCK
      ?AUTO_4433 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4431 ) ( not ( = ?AUTO_4430 ?AUTO_4431 ) ) ( ON ?AUTO_4430 ?AUTO_4432 ) ( CLEAR ?AUTO_4430 ) ( not ( = ?AUTO_4430 ?AUTO_4432 ) ) ( not ( = ?AUTO_4431 ?AUTO_4432 ) ) ( HOLDING ?AUTO_4433 ) ( not ( = ?AUTO_4430 ?AUTO_4433 ) ) ( not ( = ?AUTO_4431 ?AUTO_4433 ) ) ( not ( = ?AUTO_4432 ?AUTO_4433 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4433 )
      ( MAKE-ON ?AUTO_4430 ?AUTO_4431 )
      ( MAKE-ON-VERIFY ?AUTO_4430 ?AUTO_4431 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4434 - BLOCK
      ?AUTO_4435 - BLOCK
    )
    :vars
    (
      ?AUTO_4436 - BLOCK
      ?AUTO_4437 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4434 ?AUTO_4435 ) ) ( ON ?AUTO_4434 ?AUTO_4436 ) ( CLEAR ?AUTO_4434 ) ( not ( = ?AUTO_4434 ?AUTO_4436 ) ) ( not ( = ?AUTO_4435 ?AUTO_4436 ) ) ( not ( = ?AUTO_4434 ?AUTO_4437 ) ) ( not ( = ?AUTO_4435 ?AUTO_4437 ) ) ( not ( = ?AUTO_4436 ?AUTO_4437 ) ) ( ON ?AUTO_4437 ?AUTO_4435 ) ( CLEAR ?AUTO_4437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4437 ?AUTO_4435 )
      ( MAKE-ON ?AUTO_4434 ?AUTO_4435 )
      ( MAKE-ON-VERIFY ?AUTO_4434 ?AUTO_4435 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4439 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4439 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4439 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4439 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4440 - BLOCK
    )
    :vars
    (
      ?AUTO_4441 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4440 ?AUTO_4441 ) ( CLEAR ?AUTO_4440 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4440 ?AUTO_4441 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4440 ?AUTO_4441 )
      ( MAKE-ON-TABLE ?AUTO_4440 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4440 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4442 - BLOCK
    )
    :vars
    (
      ?AUTO_4443 - BLOCK
      ?AUTO_4444 - BLOCK
      ?AUTO_4445 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4442 ?AUTO_4443 ) ( CLEAR ?AUTO_4442 ) ( not ( = ?AUTO_4442 ?AUTO_4443 ) ) ( HOLDING ?AUTO_4444 ) ( CLEAR ?AUTO_4445 ) ( not ( = ?AUTO_4442 ?AUTO_4444 ) ) ( not ( = ?AUTO_4442 ?AUTO_4445 ) ) ( not ( = ?AUTO_4443 ?AUTO_4444 ) ) ( not ( = ?AUTO_4443 ?AUTO_4445 ) ) ( not ( = ?AUTO_4444 ?AUTO_4445 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4444 ?AUTO_4445 )
      ( MAKE-ON-TABLE ?AUTO_4442 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4442 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4448 - BLOCK
    )
    :vars
    (
      ?AUTO_4451 - BLOCK
      ?AUTO_4449 - BLOCK
      ?AUTO_4450 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4448 ?AUTO_4451 ) ( not ( = ?AUTO_4448 ?AUTO_4451 ) ) ( CLEAR ?AUTO_4449 ) ( not ( = ?AUTO_4448 ?AUTO_4450 ) ) ( not ( = ?AUTO_4448 ?AUTO_4449 ) ) ( not ( = ?AUTO_4451 ?AUTO_4450 ) ) ( not ( = ?AUTO_4451 ?AUTO_4449 ) ) ( not ( = ?AUTO_4450 ?AUTO_4449 ) ) ( ON ?AUTO_4450 ?AUTO_4448 ) ( CLEAR ?AUTO_4450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4450 ?AUTO_4448 )
      ( MAKE-ON-TABLE ?AUTO_4448 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4448 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4452 - BLOCK
    )
    :vars
    (
      ?AUTO_4455 - BLOCK
      ?AUTO_4454 - BLOCK
      ?AUTO_4453 - BLOCK
      ?AUTO_4456 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4452 ?AUTO_4455 ) ( not ( = ?AUTO_4452 ?AUTO_4455 ) ) ( CLEAR ?AUTO_4454 ) ( not ( = ?AUTO_4452 ?AUTO_4453 ) ) ( not ( = ?AUTO_4452 ?AUTO_4454 ) ) ( not ( = ?AUTO_4455 ?AUTO_4453 ) ) ( not ( = ?AUTO_4455 ?AUTO_4454 ) ) ( not ( = ?AUTO_4453 ?AUTO_4454 ) ) ( ON ?AUTO_4453 ?AUTO_4452 ) ( CLEAR ?AUTO_4453 ) ( HOLDING ?AUTO_4456 ) ( not ( = ?AUTO_4452 ?AUTO_4456 ) ) ( not ( = ?AUTO_4455 ?AUTO_4456 ) ) ( not ( = ?AUTO_4454 ?AUTO_4456 ) ) ( not ( = ?AUTO_4453 ?AUTO_4456 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4456 )
      ( MAKE-ON-TABLE ?AUTO_4452 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4452 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4457 - BLOCK
    )
    :vars
    (
      ?AUTO_4461 - BLOCK
      ?AUTO_4458 - BLOCK
      ?AUTO_4459 - BLOCK
      ?AUTO_4460 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4457 ?AUTO_4461 ) ( not ( = ?AUTO_4457 ?AUTO_4461 ) ) ( CLEAR ?AUTO_4458 ) ( not ( = ?AUTO_4457 ?AUTO_4459 ) ) ( not ( = ?AUTO_4457 ?AUTO_4458 ) ) ( not ( = ?AUTO_4461 ?AUTO_4459 ) ) ( not ( = ?AUTO_4461 ?AUTO_4458 ) ) ( not ( = ?AUTO_4459 ?AUTO_4458 ) ) ( ON ?AUTO_4459 ?AUTO_4457 ) ( not ( = ?AUTO_4457 ?AUTO_4460 ) ) ( not ( = ?AUTO_4461 ?AUTO_4460 ) ) ( not ( = ?AUTO_4458 ?AUTO_4460 ) ) ( not ( = ?AUTO_4459 ?AUTO_4460 ) ) ( ON ?AUTO_4460 ?AUTO_4459 ) ( CLEAR ?AUTO_4460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4460 ?AUTO_4459 )
      ( MAKE-ON-TABLE ?AUTO_4457 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4457 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4464 - BLOCK
      ?AUTO_4465 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4464 ) ( CLEAR ?AUTO_4465 ) ( not ( = ?AUTO_4464 ?AUTO_4465 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4464 ?AUTO_4465 )
      ( MAKE-ON-VERIFY ?AUTO_4464 ?AUTO_4465 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4466 - BLOCK
      ?AUTO_4467 - BLOCK
    )
    :vars
    (
      ?AUTO_4468 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4467 ) ( not ( = ?AUTO_4466 ?AUTO_4467 ) ) ( ON ?AUTO_4466 ?AUTO_4468 ) ( CLEAR ?AUTO_4466 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4466 ?AUTO_4468 ) ) ( not ( = ?AUTO_4467 ?AUTO_4468 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4466 ?AUTO_4468 )
      ( MAKE-ON ?AUTO_4466 ?AUTO_4467 )
      ( MAKE-ON-VERIFY ?AUTO_4466 ?AUTO_4467 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4469 - BLOCK
      ?AUTO_4470 - BLOCK
    )
    :vars
    (
      ?AUTO_4471 - BLOCK
      ?AUTO_4472 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4470 ) ( not ( = ?AUTO_4469 ?AUTO_4470 ) ) ( ON ?AUTO_4469 ?AUTO_4471 ) ( CLEAR ?AUTO_4469 ) ( not ( = ?AUTO_4469 ?AUTO_4471 ) ) ( not ( = ?AUTO_4470 ?AUTO_4471 ) ) ( HOLDING ?AUTO_4472 ) ( not ( = ?AUTO_4469 ?AUTO_4472 ) ) ( not ( = ?AUTO_4470 ?AUTO_4472 ) ) ( not ( = ?AUTO_4471 ?AUTO_4472 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4472 )
      ( MAKE-ON ?AUTO_4469 ?AUTO_4470 )
      ( MAKE-ON-VERIFY ?AUTO_4469 ?AUTO_4470 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4473 - BLOCK
      ?AUTO_4474 - BLOCK
    )
    :vars
    (
      ?AUTO_4475 - BLOCK
      ?AUTO_4476 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4474 ) ( not ( = ?AUTO_4473 ?AUTO_4474 ) ) ( ON ?AUTO_4473 ?AUTO_4475 ) ( not ( = ?AUTO_4473 ?AUTO_4475 ) ) ( not ( = ?AUTO_4474 ?AUTO_4475 ) ) ( not ( = ?AUTO_4473 ?AUTO_4476 ) ) ( not ( = ?AUTO_4474 ?AUTO_4476 ) ) ( not ( = ?AUTO_4475 ?AUTO_4476 ) ) ( ON ?AUTO_4476 ?AUTO_4473 ) ( CLEAR ?AUTO_4476 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4476 ?AUTO_4473 )
      ( MAKE-ON ?AUTO_4473 ?AUTO_4474 )
      ( MAKE-ON-VERIFY ?AUTO_4473 ?AUTO_4474 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4477 - BLOCK
      ?AUTO_4478 - BLOCK
    )
    :vars
    (
      ?AUTO_4479 - BLOCK
      ?AUTO_4480 - BLOCK
      ?AUTO_4481 - BLOCK
      ?AUTO_4482 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4478 ) ( not ( = ?AUTO_4477 ?AUTO_4478 ) ) ( ON ?AUTO_4477 ?AUTO_4479 ) ( not ( = ?AUTO_4477 ?AUTO_4479 ) ) ( not ( = ?AUTO_4478 ?AUTO_4479 ) ) ( not ( = ?AUTO_4477 ?AUTO_4480 ) ) ( not ( = ?AUTO_4478 ?AUTO_4480 ) ) ( not ( = ?AUTO_4479 ?AUTO_4480 ) ) ( ON ?AUTO_4480 ?AUTO_4477 ) ( CLEAR ?AUTO_4480 ) ( HOLDING ?AUTO_4481 ) ( CLEAR ?AUTO_4482 ) ( not ( = ?AUTO_4477 ?AUTO_4481 ) ) ( not ( = ?AUTO_4477 ?AUTO_4482 ) ) ( not ( = ?AUTO_4478 ?AUTO_4481 ) ) ( not ( = ?AUTO_4478 ?AUTO_4482 ) ) ( not ( = ?AUTO_4479 ?AUTO_4481 ) ) ( not ( = ?AUTO_4479 ?AUTO_4482 ) ) ( not ( = ?AUTO_4480 ?AUTO_4481 ) ) ( not ( = ?AUTO_4480 ?AUTO_4482 ) ) ( not ( = ?AUTO_4481 ?AUTO_4482 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4481 ?AUTO_4482 )
      ( MAKE-ON ?AUTO_4477 ?AUTO_4478 )
      ( MAKE-ON-VERIFY ?AUTO_4477 ?AUTO_4478 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4483 - BLOCK
      ?AUTO_4484 - BLOCK
    )
    :vars
    (
      ?AUTO_4485 - BLOCK
      ?AUTO_4486 - BLOCK
      ?AUTO_4488 - BLOCK
      ?AUTO_4487 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4483 ?AUTO_4484 ) ) ( ON ?AUTO_4483 ?AUTO_4485 ) ( not ( = ?AUTO_4483 ?AUTO_4485 ) ) ( not ( = ?AUTO_4484 ?AUTO_4485 ) ) ( not ( = ?AUTO_4483 ?AUTO_4486 ) ) ( not ( = ?AUTO_4484 ?AUTO_4486 ) ) ( not ( = ?AUTO_4485 ?AUTO_4486 ) ) ( ON ?AUTO_4486 ?AUTO_4483 ) ( CLEAR ?AUTO_4486 ) ( CLEAR ?AUTO_4488 ) ( not ( = ?AUTO_4483 ?AUTO_4487 ) ) ( not ( = ?AUTO_4483 ?AUTO_4488 ) ) ( not ( = ?AUTO_4484 ?AUTO_4487 ) ) ( not ( = ?AUTO_4484 ?AUTO_4488 ) ) ( not ( = ?AUTO_4485 ?AUTO_4487 ) ) ( not ( = ?AUTO_4485 ?AUTO_4488 ) ) ( not ( = ?AUTO_4486 ?AUTO_4487 ) ) ( not ( = ?AUTO_4486 ?AUTO_4488 ) ) ( not ( = ?AUTO_4487 ?AUTO_4488 ) ) ( ON ?AUTO_4487 ?AUTO_4484 ) ( CLEAR ?AUTO_4487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4487 ?AUTO_4484 )
      ( MAKE-ON ?AUTO_4483 ?AUTO_4484 )
      ( MAKE-ON-VERIFY ?AUTO_4483 ?AUTO_4484 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4489 - BLOCK
      ?AUTO_4490 - BLOCK
    )
    :vars
    (
      ?AUTO_4491 - BLOCK
      ?AUTO_4494 - BLOCK
      ?AUTO_4493 - BLOCK
      ?AUTO_4492 - BLOCK
      ?AUTO_4495 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4489 ?AUTO_4490 ) ) ( ON ?AUTO_4489 ?AUTO_4491 ) ( not ( = ?AUTO_4489 ?AUTO_4491 ) ) ( not ( = ?AUTO_4490 ?AUTO_4491 ) ) ( not ( = ?AUTO_4489 ?AUTO_4494 ) ) ( not ( = ?AUTO_4490 ?AUTO_4494 ) ) ( not ( = ?AUTO_4491 ?AUTO_4494 ) ) ( ON ?AUTO_4494 ?AUTO_4489 ) ( CLEAR ?AUTO_4494 ) ( not ( = ?AUTO_4489 ?AUTO_4493 ) ) ( not ( = ?AUTO_4489 ?AUTO_4492 ) ) ( not ( = ?AUTO_4490 ?AUTO_4493 ) ) ( not ( = ?AUTO_4490 ?AUTO_4492 ) ) ( not ( = ?AUTO_4491 ?AUTO_4493 ) ) ( not ( = ?AUTO_4491 ?AUTO_4492 ) ) ( not ( = ?AUTO_4494 ?AUTO_4493 ) ) ( not ( = ?AUTO_4494 ?AUTO_4492 ) ) ( not ( = ?AUTO_4493 ?AUTO_4492 ) ) ( ON ?AUTO_4493 ?AUTO_4490 ) ( CLEAR ?AUTO_4493 ) ( HOLDING ?AUTO_4492 ) ( CLEAR ?AUTO_4495 ) ( not ( = ?AUTO_4489 ?AUTO_4495 ) ) ( not ( = ?AUTO_4490 ?AUTO_4495 ) ) ( not ( = ?AUTO_4491 ?AUTO_4495 ) ) ( not ( = ?AUTO_4494 ?AUTO_4495 ) ) ( not ( = ?AUTO_4493 ?AUTO_4495 ) ) ( not ( = ?AUTO_4492 ?AUTO_4495 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4492 ?AUTO_4495 )
      ( MAKE-ON ?AUTO_4489 ?AUTO_4490 )
      ( MAKE-ON-VERIFY ?AUTO_4489 ?AUTO_4490 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4496 - BLOCK
      ?AUTO_4497 - BLOCK
    )
    :vars
    (
      ?AUTO_4500 - BLOCK
      ?AUTO_4499 - BLOCK
      ?AUTO_4501 - BLOCK
      ?AUTO_4498 - BLOCK
      ?AUTO_4502 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4496 ?AUTO_4497 ) ) ( ON ?AUTO_4496 ?AUTO_4500 ) ( not ( = ?AUTO_4496 ?AUTO_4500 ) ) ( not ( = ?AUTO_4497 ?AUTO_4500 ) ) ( not ( = ?AUTO_4496 ?AUTO_4499 ) ) ( not ( = ?AUTO_4497 ?AUTO_4499 ) ) ( not ( = ?AUTO_4500 ?AUTO_4499 ) ) ( ON ?AUTO_4499 ?AUTO_4496 ) ( not ( = ?AUTO_4496 ?AUTO_4501 ) ) ( not ( = ?AUTO_4496 ?AUTO_4498 ) ) ( not ( = ?AUTO_4497 ?AUTO_4501 ) ) ( not ( = ?AUTO_4497 ?AUTO_4498 ) ) ( not ( = ?AUTO_4500 ?AUTO_4501 ) ) ( not ( = ?AUTO_4500 ?AUTO_4498 ) ) ( not ( = ?AUTO_4499 ?AUTO_4501 ) ) ( not ( = ?AUTO_4499 ?AUTO_4498 ) ) ( not ( = ?AUTO_4501 ?AUTO_4498 ) ) ( ON ?AUTO_4501 ?AUTO_4497 ) ( CLEAR ?AUTO_4501 ) ( CLEAR ?AUTO_4502 ) ( not ( = ?AUTO_4496 ?AUTO_4502 ) ) ( not ( = ?AUTO_4497 ?AUTO_4502 ) ) ( not ( = ?AUTO_4500 ?AUTO_4502 ) ) ( not ( = ?AUTO_4499 ?AUTO_4502 ) ) ( not ( = ?AUTO_4501 ?AUTO_4502 ) ) ( not ( = ?AUTO_4498 ?AUTO_4502 ) ) ( ON ?AUTO_4498 ?AUTO_4499 ) ( CLEAR ?AUTO_4498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4498 ?AUTO_4499 )
      ( MAKE-ON ?AUTO_4496 ?AUTO_4497 )
      ( MAKE-ON-VERIFY ?AUTO_4496 ?AUTO_4497 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4503 - BLOCK
      ?AUTO_4504 - BLOCK
    )
    :vars
    (
      ?AUTO_4508 - BLOCK
      ?AUTO_4505 - BLOCK
      ?AUTO_4507 - BLOCK
      ?AUTO_4506 - BLOCK
      ?AUTO_4509 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4503 ?AUTO_4504 ) ) ( ON ?AUTO_4503 ?AUTO_4508 ) ( not ( = ?AUTO_4503 ?AUTO_4508 ) ) ( not ( = ?AUTO_4504 ?AUTO_4508 ) ) ( not ( = ?AUTO_4503 ?AUTO_4505 ) ) ( not ( = ?AUTO_4504 ?AUTO_4505 ) ) ( not ( = ?AUTO_4508 ?AUTO_4505 ) ) ( ON ?AUTO_4505 ?AUTO_4503 ) ( not ( = ?AUTO_4503 ?AUTO_4507 ) ) ( not ( = ?AUTO_4503 ?AUTO_4506 ) ) ( not ( = ?AUTO_4504 ?AUTO_4507 ) ) ( not ( = ?AUTO_4504 ?AUTO_4506 ) ) ( not ( = ?AUTO_4508 ?AUTO_4507 ) ) ( not ( = ?AUTO_4508 ?AUTO_4506 ) ) ( not ( = ?AUTO_4505 ?AUTO_4507 ) ) ( not ( = ?AUTO_4505 ?AUTO_4506 ) ) ( not ( = ?AUTO_4507 ?AUTO_4506 ) ) ( ON ?AUTO_4507 ?AUTO_4504 ) ( CLEAR ?AUTO_4507 ) ( not ( = ?AUTO_4503 ?AUTO_4509 ) ) ( not ( = ?AUTO_4504 ?AUTO_4509 ) ) ( not ( = ?AUTO_4508 ?AUTO_4509 ) ) ( not ( = ?AUTO_4505 ?AUTO_4509 ) ) ( not ( = ?AUTO_4507 ?AUTO_4509 ) ) ( not ( = ?AUTO_4506 ?AUTO_4509 ) ) ( ON ?AUTO_4506 ?AUTO_4505 ) ( CLEAR ?AUTO_4506 ) ( HOLDING ?AUTO_4509 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4509 )
      ( MAKE-ON ?AUTO_4503 ?AUTO_4504 )
      ( MAKE-ON-VERIFY ?AUTO_4503 ?AUTO_4504 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4510 - BLOCK
      ?AUTO_4511 - BLOCK
    )
    :vars
    (
      ?AUTO_4514 - BLOCK
      ?AUTO_4515 - BLOCK
      ?AUTO_4516 - BLOCK
      ?AUTO_4512 - BLOCK
      ?AUTO_4513 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4510 ?AUTO_4511 ) ) ( ON ?AUTO_4510 ?AUTO_4514 ) ( not ( = ?AUTO_4510 ?AUTO_4514 ) ) ( not ( = ?AUTO_4511 ?AUTO_4514 ) ) ( not ( = ?AUTO_4510 ?AUTO_4515 ) ) ( not ( = ?AUTO_4511 ?AUTO_4515 ) ) ( not ( = ?AUTO_4514 ?AUTO_4515 ) ) ( ON ?AUTO_4515 ?AUTO_4510 ) ( not ( = ?AUTO_4510 ?AUTO_4516 ) ) ( not ( = ?AUTO_4510 ?AUTO_4512 ) ) ( not ( = ?AUTO_4511 ?AUTO_4516 ) ) ( not ( = ?AUTO_4511 ?AUTO_4512 ) ) ( not ( = ?AUTO_4514 ?AUTO_4516 ) ) ( not ( = ?AUTO_4514 ?AUTO_4512 ) ) ( not ( = ?AUTO_4515 ?AUTO_4516 ) ) ( not ( = ?AUTO_4515 ?AUTO_4512 ) ) ( not ( = ?AUTO_4516 ?AUTO_4512 ) ) ( ON ?AUTO_4516 ?AUTO_4511 ) ( CLEAR ?AUTO_4516 ) ( not ( = ?AUTO_4510 ?AUTO_4513 ) ) ( not ( = ?AUTO_4511 ?AUTO_4513 ) ) ( not ( = ?AUTO_4514 ?AUTO_4513 ) ) ( not ( = ?AUTO_4515 ?AUTO_4513 ) ) ( not ( = ?AUTO_4516 ?AUTO_4513 ) ) ( not ( = ?AUTO_4512 ?AUTO_4513 ) ) ( ON ?AUTO_4512 ?AUTO_4515 ) ( ON ?AUTO_4513 ?AUTO_4512 ) ( CLEAR ?AUTO_4513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4513 ?AUTO_4512 )
      ( MAKE-ON ?AUTO_4510 ?AUTO_4511 )
      ( MAKE-ON-VERIFY ?AUTO_4510 ?AUTO_4511 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4519 - BLOCK
      ?AUTO_4520 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4519 ) ( CLEAR ?AUTO_4520 ) ( not ( = ?AUTO_4519 ?AUTO_4520 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4519 ?AUTO_4520 )
      ( MAKE-ON-VERIFY ?AUTO_4519 ?AUTO_4520 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4521 - BLOCK
      ?AUTO_4522 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4522 ) ( not ( = ?AUTO_4521 ?AUTO_4522 ) ) ( ON-TABLE ?AUTO_4521 ) ( CLEAR ?AUTO_4521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4521 )
      ( MAKE-ON ?AUTO_4521 ?AUTO_4522 )
      ( MAKE-ON-VERIFY ?AUTO_4521 ?AUTO_4522 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4523 - BLOCK
      ?AUTO_4524 - BLOCK
    )
    :vars
    (
      ?AUTO_4525 - BLOCK
      ?AUTO_4526 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4524 ) ( not ( = ?AUTO_4523 ?AUTO_4524 ) ) ( ON-TABLE ?AUTO_4523 ) ( CLEAR ?AUTO_4523 ) ( HOLDING ?AUTO_4525 ) ( CLEAR ?AUTO_4526 ) ( not ( = ?AUTO_4523 ?AUTO_4525 ) ) ( not ( = ?AUTO_4523 ?AUTO_4526 ) ) ( not ( = ?AUTO_4524 ?AUTO_4525 ) ) ( not ( = ?AUTO_4524 ?AUTO_4526 ) ) ( not ( = ?AUTO_4525 ?AUTO_4526 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4525 ?AUTO_4526 )
      ( MAKE-ON ?AUTO_4523 ?AUTO_4524 )
      ( MAKE-ON-VERIFY ?AUTO_4523 ?AUTO_4524 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4527 - BLOCK
      ?AUTO_4528 - BLOCK
    )
    :vars
    (
      ?AUTO_4529 - BLOCK
      ?AUTO_4530 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4528 ) ( not ( = ?AUTO_4527 ?AUTO_4528 ) ) ( ON-TABLE ?AUTO_4527 ) ( CLEAR ?AUTO_4529 ) ( not ( = ?AUTO_4527 ?AUTO_4530 ) ) ( not ( = ?AUTO_4527 ?AUTO_4529 ) ) ( not ( = ?AUTO_4528 ?AUTO_4530 ) ) ( not ( = ?AUTO_4528 ?AUTO_4529 ) ) ( not ( = ?AUTO_4530 ?AUTO_4529 ) ) ( ON ?AUTO_4530 ?AUTO_4527 ) ( CLEAR ?AUTO_4530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4530 ?AUTO_4527 )
      ( MAKE-ON ?AUTO_4527 ?AUTO_4528 )
      ( MAKE-ON-VERIFY ?AUTO_4527 ?AUTO_4528 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4531 - BLOCK
      ?AUTO_4532 - BLOCK
    )
    :vars
    (
      ?AUTO_4534 - BLOCK
      ?AUTO_4533 - BLOCK
      ?AUTO_4535 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4532 ) ( not ( = ?AUTO_4531 ?AUTO_4532 ) ) ( ON-TABLE ?AUTO_4531 ) ( CLEAR ?AUTO_4534 ) ( not ( = ?AUTO_4531 ?AUTO_4533 ) ) ( not ( = ?AUTO_4531 ?AUTO_4534 ) ) ( not ( = ?AUTO_4532 ?AUTO_4533 ) ) ( not ( = ?AUTO_4532 ?AUTO_4534 ) ) ( not ( = ?AUTO_4533 ?AUTO_4534 ) ) ( ON ?AUTO_4533 ?AUTO_4531 ) ( CLEAR ?AUTO_4533 ) ( HOLDING ?AUTO_4535 ) ( not ( = ?AUTO_4531 ?AUTO_4535 ) ) ( not ( = ?AUTO_4532 ?AUTO_4535 ) ) ( not ( = ?AUTO_4534 ?AUTO_4535 ) ) ( not ( = ?AUTO_4533 ?AUTO_4535 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4535 )
      ( MAKE-ON ?AUTO_4531 ?AUTO_4532 )
      ( MAKE-ON-VERIFY ?AUTO_4531 ?AUTO_4532 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4536 - BLOCK
      ?AUTO_4537 - BLOCK
    )
    :vars
    (
      ?AUTO_4540 - BLOCK
      ?AUTO_4539 - BLOCK
      ?AUTO_4538 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4537 ) ( not ( = ?AUTO_4536 ?AUTO_4537 ) ) ( ON-TABLE ?AUTO_4536 ) ( CLEAR ?AUTO_4540 ) ( not ( = ?AUTO_4536 ?AUTO_4539 ) ) ( not ( = ?AUTO_4536 ?AUTO_4540 ) ) ( not ( = ?AUTO_4537 ?AUTO_4539 ) ) ( not ( = ?AUTO_4537 ?AUTO_4540 ) ) ( not ( = ?AUTO_4539 ?AUTO_4540 ) ) ( ON ?AUTO_4539 ?AUTO_4536 ) ( not ( = ?AUTO_4536 ?AUTO_4538 ) ) ( not ( = ?AUTO_4537 ?AUTO_4538 ) ) ( not ( = ?AUTO_4540 ?AUTO_4538 ) ) ( not ( = ?AUTO_4539 ?AUTO_4538 ) ) ( ON ?AUTO_4538 ?AUTO_4539 ) ( CLEAR ?AUTO_4538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4538 ?AUTO_4539 )
      ( MAKE-ON ?AUTO_4536 ?AUTO_4537 )
      ( MAKE-ON-VERIFY ?AUTO_4536 ?AUTO_4537 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4541 - BLOCK
      ?AUTO_4542 - BLOCK
    )
    :vars
    (
      ?AUTO_4545 - BLOCK
      ?AUTO_4543 - BLOCK
      ?AUTO_4544 - BLOCK
      ?AUTO_4546 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4541 ?AUTO_4542 ) ) ( ON-TABLE ?AUTO_4541 ) ( CLEAR ?AUTO_4545 ) ( not ( = ?AUTO_4541 ?AUTO_4543 ) ) ( not ( = ?AUTO_4541 ?AUTO_4545 ) ) ( not ( = ?AUTO_4542 ?AUTO_4543 ) ) ( not ( = ?AUTO_4542 ?AUTO_4545 ) ) ( not ( = ?AUTO_4543 ?AUTO_4545 ) ) ( ON ?AUTO_4543 ?AUTO_4541 ) ( not ( = ?AUTO_4541 ?AUTO_4544 ) ) ( not ( = ?AUTO_4542 ?AUTO_4544 ) ) ( not ( = ?AUTO_4545 ?AUTO_4544 ) ) ( not ( = ?AUTO_4543 ?AUTO_4544 ) ) ( ON ?AUTO_4544 ?AUTO_4543 ) ( CLEAR ?AUTO_4544 ) ( HOLDING ?AUTO_4542 ) ( CLEAR ?AUTO_4546 ) ( not ( = ?AUTO_4541 ?AUTO_4546 ) ) ( not ( = ?AUTO_4542 ?AUTO_4546 ) ) ( not ( = ?AUTO_4545 ?AUTO_4546 ) ) ( not ( = ?AUTO_4543 ?AUTO_4546 ) ) ( not ( = ?AUTO_4544 ?AUTO_4546 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4542 ?AUTO_4546 )
      ( MAKE-ON ?AUTO_4541 ?AUTO_4542 )
      ( MAKE-ON-VERIFY ?AUTO_4541 ?AUTO_4542 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4549 - BLOCK
      ?AUTO_4550 - BLOCK
    )
    :vars
    (
      ?AUTO_4552 - BLOCK
      ?AUTO_4551 - BLOCK
      ?AUTO_4553 - BLOCK
      ?AUTO_4554 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4550 ) ( not ( = ?AUTO_4549 ?AUTO_4550 ) ) ( ON-TABLE ?AUTO_4549 ) ( not ( = ?AUTO_4549 ?AUTO_4552 ) ) ( not ( = ?AUTO_4549 ?AUTO_4551 ) ) ( not ( = ?AUTO_4550 ?AUTO_4552 ) ) ( not ( = ?AUTO_4550 ?AUTO_4551 ) ) ( not ( = ?AUTO_4552 ?AUTO_4551 ) ) ( ON ?AUTO_4552 ?AUTO_4549 ) ( not ( = ?AUTO_4549 ?AUTO_4553 ) ) ( not ( = ?AUTO_4550 ?AUTO_4553 ) ) ( not ( = ?AUTO_4551 ?AUTO_4553 ) ) ( not ( = ?AUTO_4552 ?AUTO_4553 ) ) ( ON ?AUTO_4553 ?AUTO_4552 ) ( CLEAR ?AUTO_4553 ) ( HOLDING ?AUTO_4551 ) ( CLEAR ?AUTO_4554 ) ( not ( = ?AUTO_4549 ?AUTO_4554 ) ) ( not ( = ?AUTO_4550 ?AUTO_4554 ) ) ( not ( = ?AUTO_4552 ?AUTO_4554 ) ) ( not ( = ?AUTO_4551 ?AUTO_4554 ) ) ( not ( = ?AUTO_4553 ?AUTO_4554 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4551 ?AUTO_4554 )
      ( MAKE-ON ?AUTO_4549 ?AUTO_4550 )
      ( MAKE-ON-VERIFY ?AUTO_4549 ?AUTO_4550 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4555 - BLOCK
      ?AUTO_4556 - BLOCK
    )
    :vars
    (
      ?AUTO_4557 - BLOCK
      ?AUTO_4559 - BLOCK
      ?AUTO_4558 - BLOCK
      ?AUTO_4560 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4556 ) ( not ( = ?AUTO_4555 ?AUTO_4556 ) ) ( ON-TABLE ?AUTO_4555 ) ( not ( = ?AUTO_4555 ?AUTO_4557 ) ) ( not ( = ?AUTO_4555 ?AUTO_4559 ) ) ( not ( = ?AUTO_4556 ?AUTO_4557 ) ) ( not ( = ?AUTO_4556 ?AUTO_4559 ) ) ( not ( = ?AUTO_4557 ?AUTO_4559 ) ) ( ON ?AUTO_4557 ?AUTO_4555 ) ( not ( = ?AUTO_4555 ?AUTO_4558 ) ) ( not ( = ?AUTO_4556 ?AUTO_4558 ) ) ( not ( = ?AUTO_4559 ?AUTO_4558 ) ) ( not ( = ?AUTO_4557 ?AUTO_4558 ) ) ( ON ?AUTO_4558 ?AUTO_4557 ) ( CLEAR ?AUTO_4560 ) ( not ( = ?AUTO_4555 ?AUTO_4560 ) ) ( not ( = ?AUTO_4556 ?AUTO_4560 ) ) ( not ( = ?AUTO_4557 ?AUTO_4560 ) ) ( not ( = ?AUTO_4559 ?AUTO_4560 ) ) ( not ( = ?AUTO_4558 ?AUTO_4560 ) ) ( ON ?AUTO_4559 ?AUTO_4558 ) ( CLEAR ?AUTO_4559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4559 ?AUTO_4558 )
      ( MAKE-ON ?AUTO_4555 ?AUTO_4556 )
      ( MAKE-ON-VERIFY ?AUTO_4555 ?AUTO_4556 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4561 - BLOCK
      ?AUTO_4562 - BLOCK
    )
    :vars
    (
      ?AUTO_4566 - BLOCK
      ?AUTO_4564 - BLOCK
      ?AUTO_4565 - BLOCK
      ?AUTO_4563 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4562 ) ( not ( = ?AUTO_4561 ?AUTO_4562 ) ) ( ON-TABLE ?AUTO_4561 ) ( not ( = ?AUTO_4561 ?AUTO_4566 ) ) ( not ( = ?AUTO_4561 ?AUTO_4564 ) ) ( not ( = ?AUTO_4562 ?AUTO_4566 ) ) ( not ( = ?AUTO_4562 ?AUTO_4564 ) ) ( not ( = ?AUTO_4566 ?AUTO_4564 ) ) ( ON ?AUTO_4566 ?AUTO_4561 ) ( not ( = ?AUTO_4561 ?AUTO_4565 ) ) ( not ( = ?AUTO_4562 ?AUTO_4565 ) ) ( not ( = ?AUTO_4564 ?AUTO_4565 ) ) ( not ( = ?AUTO_4566 ?AUTO_4565 ) ) ( ON ?AUTO_4565 ?AUTO_4566 ) ( not ( = ?AUTO_4561 ?AUTO_4563 ) ) ( not ( = ?AUTO_4562 ?AUTO_4563 ) ) ( not ( = ?AUTO_4566 ?AUTO_4563 ) ) ( not ( = ?AUTO_4564 ?AUTO_4563 ) ) ( not ( = ?AUTO_4565 ?AUTO_4563 ) ) ( ON ?AUTO_4564 ?AUTO_4565 ) ( CLEAR ?AUTO_4564 ) ( HOLDING ?AUTO_4563 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4563 )
      ( MAKE-ON ?AUTO_4561 ?AUTO_4562 )
      ( MAKE-ON-VERIFY ?AUTO_4561 ?AUTO_4562 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4567 - BLOCK
      ?AUTO_4568 - BLOCK
    )
    :vars
    (
      ?AUTO_4569 - BLOCK
      ?AUTO_4571 - BLOCK
      ?AUTO_4572 - BLOCK
      ?AUTO_4570 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4568 ) ( not ( = ?AUTO_4567 ?AUTO_4568 ) ) ( ON-TABLE ?AUTO_4567 ) ( not ( = ?AUTO_4567 ?AUTO_4569 ) ) ( not ( = ?AUTO_4567 ?AUTO_4571 ) ) ( not ( = ?AUTO_4568 ?AUTO_4569 ) ) ( not ( = ?AUTO_4568 ?AUTO_4571 ) ) ( not ( = ?AUTO_4569 ?AUTO_4571 ) ) ( ON ?AUTO_4569 ?AUTO_4567 ) ( not ( = ?AUTO_4567 ?AUTO_4572 ) ) ( not ( = ?AUTO_4568 ?AUTO_4572 ) ) ( not ( = ?AUTO_4571 ?AUTO_4572 ) ) ( not ( = ?AUTO_4569 ?AUTO_4572 ) ) ( ON ?AUTO_4572 ?AUTO_4569 ) ( not ( = ?AUTO_4567 ?AUTO_4570 ) ) ( not ( = ?AUTO_4568 ?AUTO_4570 ) ) ( not ( = ?AUTO_4569 ?AUTO_4570 ) ) ( not ( = ?AUTO_4571 ?AUTO_4570 ) ) ( not ( = ?AUTO_4572 ?AUTO_4570 ) ) ( ON ?AUTO_4571 ?AUTO_4572 ) ( ON ?AUTO_4570 ?AUTO_4571 ) ( CLEAR ?AUTO_4570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4570 ?AUTO_4571 )
      ( MAKE-ON ?AUTO_4567 ?AUTO_4568 )
      ( MAKE-ON-VERIFY ?AUTO_4567 ?AUTO_4568 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4575 - BLOCK
      ?AUTO_4576 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4575 ) ( CLEAR ?AUTO_4576 ) ( not ( = ?AUTO_4575 ?AUTO_4576 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4575 ?AUTO_4576 )
      ( MAKE-ON-VERIFY ?AUTO_4575 ?AUTO_4576 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4577 - BLOCK
      ?AUTO_4578 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4578 ) ( not ( = ?AUTO_4577 ?AUTO_4578 ) ) ( ON-TABLE ?AUTO_4577 ) ( CLEAR ?AUTO_4577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4577 )
      ( MAKE-ON ?AUTO_4577 ?AUTO_4578 )
      ( MAKE-ON-VERIFY ?AUTO_4577 ?AUTO_4578 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4579 - BLOCK
      ?AUTO_4580 - BLOCK
    )
    :vars
    (
      ?AUTO_4581 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4579 ?AUTO_4580 ) ) ( ON-TABLE ?AUTO_4579 ) ( CLEAR ?AUTO_4579 ) ( HOLDING ?AUTO_4580 ) ( CLEAR ?AUTO_4581 ) ( not ( = ?AUTO_4579 ?AUTO_4581 ) ) ( not ( = ?AUTO_4580 ?AUTO_4581 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4580 ?AUTO_4581 )
      ( MAKE-ON ?AUTO_4579 ?AUTO_4580 )
      ( MAKE-ON-VERIFY ?AUTO_4579 ?AUTO_4580 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4586 - BLOCK
      ?AUTO_4587 - BLOCK
    )
    :vars
    (
      ?AUTO_4589 - BLOCK
      ?AUTO_4588 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4586 ?AUTO_4587 ) ) ( ON-TABLE ?AUTO_4586 ) ( CLEAR ?AUTO_4586 ) ( CLEAR ?AUTO_4589 ) ( not ( = ?AUTO_4586 ?AUTO_4588 ) ) ( not ( = ?AUTO_4586 ?AUTO_4589 ) ) ( not ( = ?AUTO_4587 ?AUTO_4588 ) ) ( not ( = ?AUTO_4587 ?AUTO_4589 ) ) ( not ( = ?AUTO_4588 ?AUTO_4589 ) ) ( ON ?AUTO_4588 ?AUTO_4587 ) ( CLEAR ?AUTO_4588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4588 ?AUTO_4587 )
      ( MAKE-ON ?AUTO_4586 ?AUTO_4587 )
      ( MAKE-ON-VERIFY ?AUTO_4586 ?AUTO_4587 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4590 - BLOCK
      ?AUTO_4591 - BLOCK
    )
    :vars
    (
      ?AUTO_4593 - BLOCK
      ?AUTO_4592 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4590 ?AUTO_4591 ) ) ( CLEAR ?AUTO_4593 ) ( not ( = ?AUTO_4590 ?AUTO_4592 ) ) ( not ( = ?AUTO_4590 ?AUTO_4593 ) ) ( not ( = ?AUTO_4591 ?AUTO_4592 ) ) ( not ( = ?AUTO_4591 ?AUTO_4593 ) ) ( not ( = ?AUTO_4592 ?AUTO_4593 ) ) ( ON ?AUTO_4592 ?AUTO_4591 ) ( CLEAR ?AUTO_4592 ) ( HOLDING ?AUTO_4590 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4590 )
      ( MAKE-ON ?AUTO_4590 ?AUTO_4591 )
      ( MAKE-ON-VERIFY ?AUTO_4590 ?AUTO_4591 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4594 - BLOCK
      ?AUTO_4595 - BLOCK
    )
    :vars
    (
      ?AUTO_4597 - BLOCK
      ?AUTO_4596 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4594 ?AUTO_4595 ) ) ( CLEAR ?AUTO_4597 ) ( not ( = ?AUTO_4594 ?AUTO_4596 ) ) ( not ( = ?AUTO_4594 ?AUTO_4597 ) ) ( not ( = ?AUTO_4595 ?AUTO_4596 ) ) ( not ( = ?AUTO_4595 ?AUTO_4597 ) ) ( not ( = ?AUTO_4596 ?AUTO_4597 ) ) ( ON ?AUTO_4596 ?AUTO_4595 ) ( ON ?AUTO_4594 ?AUTO_4596 ) ( CLEAR ?AUTO_4594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4594 ?AUTO_4596 )
      ( MAKE-ON ?AUTO_4594 ?AUTO_4595 )
      ( MAKE-ON-VERIFY ?AUTO_4594 ?AUTO_4595 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4598 - BLOCK
      ?AUTO_4599 - BLOCK
    )
    :vars
    (
      ?AUTO_4601 - BLOCK
      ?AUTO_4600 - BLOCK
      ?AUTO_4602 - BLOCK
      ?AUTO_4603 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4598 ?AUTO_4599 ) ) ( CLEAR ?AUTO_4601 ) ( not ( = ?AUTO_4598 ?AUTO_4600 ) ) ( not ( = ?AUTO_4598 ?AUTO_4601 ) ) ( not ( = ?AUTO_4599 ?AUTO_4600 ) ) ( not ( = ?AUTO_4599 ?AUTO_4601 ) ) ( not ( = ?AUTO_4600 ?AUTO_4601 ) ) ( ON ?AUTO_4600 ?AUTO_4599 ) ( ON ?AUTO_4598 ?AUTO_4600 ) ( CLEAR ?AUTO_4598 ) ( HOLDING ?AUTO_4602 ) ( CLEAR ?AUTO_4603 ) ( not ( = ?AUTO_4598 ?AUTO_4602 ) ) ( not ( = ?AUTO_4598 ?AUTO_4603 ) ) ( not ( = ?AUTO_4599 ?AUTO_4602 ) ) ( not ( = ?AUTO_4599 ?AUTO_4603 ) ) ( not ( = ?AUTO_4601 ?AUTO_4602 ) ) ( not ( = ?AUTO_4601 ?AUTO_4603 ) ) ( not ( = ?AUTO_4600 ?AUTO_4602 ) ) ( not ( = ?AUTO_4600 ?AUTO_4603 ) ) ( not ( = ?AUTO_4602 ?AUTO_4603 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4602 ?AUTO_4603 )
      ( MAKE-ON ?AUTO_4598 ?AUTO_4599 )
      ( MAKE-ON-VERIFY ?AUTO_4598 ?AUTO_4599 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4608 - BLOCK
      ?AUTO_4609 - BLOCK
    )
    :vars
    (
      ?AUTO_4612 - BLOCK
      ?AUTO_4613 - BLOCK
      ?AUTO_4611 - BLOCK
      ?AUTO_4610 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4608 ?AUTO_4609 ) ) ( CLEAR ?AUTO_4612 ) ( not ( = ?AUTO_4608 ?AUTO_4613 ) ) ( not ( = ?AUTO_4608 ?AUTO_4612 ) ) ( not ( = ?AUTO_4609 ?AUTO_4613 ) ) ( not ( = ?AUTO_4609 ?AUTO_4612 ) ) ( not ( = ?AUTO_4613 ?AUTO_4612 ) ) ( ON ?AUTO_4613 ?AUTO_4609 ) ( ON ?AUTO_4608 ?AUTO_4613 ) ( CLEAR ?AUTO_4611 ) ( not ( = ?AUTO_4608 ?AUTO_4610 ) ) ( not ( = ?AUTO_4608 ?AUTO_4611 ) ) ( not ( = ?AUTO_4609 ?AUTO_4610 ) ) ( not ( = ?AUTO_4609 ?AUTO_4611 ) ) ( not ( = ?AUTO_4612 ?AUTO_4610 ) ) ( not ( = ?AUTO_4612 ?AUTO_4611 ) ) ( not ( = ?AUTO_4613 ?AUTO_4610 ) ) ( not ( = ?AUTO_4613 ?AUTO_4611 ) ) ( not ( = ?AUTO_4610 ?AUTO_4611 ) ) ( ON ?AUTO_4610 ?AUTO_4608 ) ( CLEAR ?AUTO_4610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4610 ?AUTO_4608 )
      ( MAKE-ON ?AUTO_4608 ?AUTO_4609 )
      ( MAKE-ON-VERIFY ?AUTO_4608 ?AUTO_4609 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4614 - BLOCK
      ?AUTO_4615 - BLOCK
    )
    :vars
    (
      ?AUTO_4619 - BLOCK
      ?AUTO_4617 - BLOCK
      ?AUTO_4616 - BLOCK
      ?AUTO_4618 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4614 ?AUTO_4615 ) ) ( not ( = ?AUTO_4614 ?AUTO_4619 ) ) ( not ( = ?AUTO_4614 ?AUTO_4617 ) ) ( not ( = ?AUTO_4615 ?AUTO_4619 ) ) ( not ( = ?AUTO_4615 ?AUTO_4617 ) ) ( not ( = ?AUTO_4619 ?AUTO_4617 ) ) ( ON ?AUTO_4619 ?AUTO_4615 ) ( ON ?AUTO_4614 ?AUTO_4619 ) ( CLEAR ?AUTO_4616 ) ( not ( = ?AUTO_4614 ?AUTO_4618 ) ) ( not ( = ?AUTO_4614 ?AUTO_4616 ) ) ( not ( = ?AUTO_4615 ?AUTO_4618 ) ) ( not ( = ?AUTO_4615 ?AUTO_4616 ) ) ( not ( = ?AUTO_4617 ?AUTO_4618 ) ) ( not ( = ?AUTO_4617 ?AUTO_4616 ) ) ( not ( = ?AUTO_4619 ?AUTO_4618 ) ) ( not ( = ?AUTO_4619 ?AUTO_4616 ) ) ( not ( = ?AUTO_4618 ?AUTO_4616 ) ) ( ON ?AUTO_4618 ?AUTO_4614 ) ( CLEAR ?AUTO_4618 ) ( HOLDING ?AUTO_4617 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4617 )
      ( MAKE-ON ?AUTO_4614 ?AUTO_4615 )
      ( MAKE-ON-VERIFY ?AUTO_4614 ?AUTO_4615 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4620 - BLOCK
      ?AUTO_4621 - BLOCK
    )
    :vars
    (
      ?AUTO_4623 - BLOCK
      ?AUTO_4624 - BLOCK
      ?AUTO_4625 - BLOCK
      ?AUTO_4622 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4620 ?AUTO_4621 ) ) ( not ( = ?AUTO_4620 ?AUTO_4623 ) ) ( not ( = ?AUTO_4620 ?AUTO_4624 ) ) ( not ( = ?AUTO_4621 ?AUTO_4623 ) ) ( not ( = ?AUTO_4621 ?AUTO_4624 ) ) ( not ( = ?AUTO_4623 ?AUTO_4624 ) ) ( ON ?AUTO_4623 ?AUTO_4621 ) ( ON ?AUTO_4620 ?AUTO_4623 ) ( CLEAR ?AUTO_4625 ) ( not ( = ?AUTO_4620 ?AUTO_4622 ) ) ( not ( = ?AUTO_4620 ?AUTO_4625 ) ) ( not ( = ?AUTO_4621 ?AUTO_4622 ) ) ( not ( = ?AUTO_4621 ?AUTO_4625 ) ) ( not ( = ?AUTO_4624 ?AUTO_4622 ) ) ( not ( = ?AUTO_4624 ?AUTO_4625 ) ) ( not ( = ?AUTO_4623 ?AUTO_4622 ) ) ( not ( = ?AUTO_4623 ?AUTO_4625 ) ) ( not ( = ?AUTO_4622 ?AUTO_4625 ) ) ( ON ?AUTO_4622 ?AUTO_4620 ) ( ON ?AUTO_4624 ?AUTO_4622 ) ( CLEAR ?AUTO_4624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4624 ?AUTO_4622 )
      ( MAKE-ON ?AUTO_4620 ?AUTO_4621 )
      ( MAKE-ON-VERIFY ?AUTO_4620 ?AUTO_4621 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4627 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4627 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4627 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4627 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4628 - BLOCK
    )
    :vars
    (
      ?AUTO_4629 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4628 ?AUTO_4629 ) ( CLEAR ?AUTO_4628 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4628 ?AUTO_4629 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4628 ?AUTO_4629 )
      ( MAKE-ON-TABLE ?AUTO_4628 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4628 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4631 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4631 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4631 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4631 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4632 - BLOCK
    )
    :vars
    (
      ?AUTO_4633 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4632 ?AUTO_4633 ) ( CLEAR ?AUTO_4632 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4632 ?AUTO_4633 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4632 ?AUTO_4633 )
      ( MAKE-ON-TABLE ?AUTO_4632 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4632 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4634 - BLOCK
    )
    :vars
    (
      ?AUTO_4635 - BLOCK
      ?AUTO_4636 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4634 ?AUTO_4635 ) ( CLEAR ?AUTO_4634 ) ( not ( = ?AUTO_4634 ?AUTO_4635 ) ) ( HOLDING ?AUTO_4636 ) ( not ( = ?AUTO_4634 ?AUTO_4636 ) ) ( not ( = ?AUTO_4635 ?AUTO_4636 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4636 )
      ( MAKE-ON-TABLE ?AUTO_4634 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4634 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4637 - BLOCK
    )
    :vars
    (
      ?AUTO_4639 - BLOCK
      ?AUTO_4638 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4637 ?AUTO_4639 ) ( not ( = ?AUTO_4637 ?AUTO_4639 ) ) ( not ( = ?AUTO_4637 ?AUTO_4638 ) ) ( not ( = ?AUTO_4639 ?AUTO_4638 ) ) ( ON ?AUTO_4638 ?AUTO_4637 ) ( CLEAR ?AUTO_4638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4638 ?AUTO_4637 )
      ( MAKE-ON-TABLE ?AUTO_4637 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4637 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4641 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4641 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4641 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4641 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4642 - BLOCK
    )
    :vars
    (
      ?AUTO_4643 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4642 ?AUTO_4643 ) ( CLEAR ?AUTO_4642 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4642 ?AUTO_4643 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4642 ?AUTO_4643 )
      ( MAKE-ON-TABLE ?AUTO_4642 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4642 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4644 - BLOCK
    )
    :vars
    (
      ?AUTO_4645 - BLOCK
      ?AUTO_4646 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4644 ?AUTO_4645 ) ( CLEAR ?AUTO_4644 ) ( not ( = ?AUTO_4644 ?AUTO_4645 ) ) ( HOLDING ?AUTO_4646 ) ( not ( = ?AUTO_4644 ?AUTO_4646 ) ) ( not ( = ?AUTO_4645 ?AUTO_4646 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4646 )
      ( MAKE-ON-TABLE ?AUTO_4644 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4644 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4647 - BLOCK
    )
    :vars
    (
      ?AUTO_4648 - BLOCK
      ?AUTO_4649 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4647 ?AUTO_4648 ) ( not ( = ?AUTO_4647 ?AUTO_4648 ) ) ( not ( = ?AUTO_4647 ?AUTO_4649 ) ) ( not ( = ?AUTO_4648 ?AUTO_4649 ) ) ( ON ?AUTO_4649 ?AUTO_4647 ) ( CLEAR ?AUTO_4649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4649 ?AUTO_4647 )
      ( MAKE-ON-TABLE ?AUTO_4647 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4647 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4650 - BLOCK
    )
    :vars
    (
      ?AUTO_4651 - BLOCK
      ?AUTO_4652 - BLOCK
      ?AUTO_4653 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4650 ?AUTO_4651 ) ( not ( = ?AUTO_4650 ?AUTO_4651 ) ) ( not ( = ?AUTO_4650 ?AUTO_4652 ) ) ( not ( = ?AUTO_4651 ?AUTO_4652 ) ) ( ON ?AUTO_4652 ?AUTO_4650 ) ( CLEAR ?AUTO_4652 ) ( HOLDING ?AUTO_4653 ) ( not ( = ?AUTO_4650 ?AUTO_4653 ) ) ( not ( = ?AUTO_4651 ?AUTO_4653 ) ) ( not ( = ?AUTO_4652 ?AUTO_4653 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4653 )
      ( MAKE-ON-TABLE ?AUTO_4650 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4650 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4654 - BLOCK
    )
    :vars
    (
      ?AUTO_4656 - BLOCK
      ?AUTO_4655 - BLOCK
      ?AUTO_4657 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4654 ?AUTO_4656 ) ( not ( = ?AUTO_4654 ?AUTO_4656 ) ) ( not ( = ?AUTO_4654 ?AUTO_4655 ) ) ( not ( = ?AUTO_4656 ?AUTO_4655 ) ) ( ON ?AUTO_4655 ?AUTO_4654 ) ( not ( = ?AUTO_4654 ?AUTO_4657 ) ) ( not ( = ?AUTO_4656 ?AUTO_4657 ) ) ( not ( = ?AUTO_4655 ?AUTO_4657 ) ) ( ON ?AUTO_4657 ?AUTO_4655 ) ( CLEAR ?AUTO_4657 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4657 ?AUTO_4655 )
      ( MAKE-ON-TABLE ?AUTO_4654 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4654 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4659 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4659 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4659 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4659 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4660 - BLOCK
    )
    :vars
    (
      ?AUTO_4661 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4660 ?AUTO_4661 ) ( CLEAR ?AUTO_4660 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4660 ?AUTO_4661 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4660 ?AUTO_4661 )
      ( MAKE-ON-TABLE ?AUTO_4660 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4660 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4662 - BLOCK
    )
    :vars
    (
      ?AUTO_4663 - BLOCK
      ?AUTO_4664 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4662 ?AUTO_4663 ) ( CLEAR ?AUTO_4662 ) ( not ( = ?AUTO_4662 ?AUTO_4663 ) ) ( HOLDING ?AUTO_4664 ) ( not ( = ?AUTO_4662 ?AUTO_4664 ) ) ( not ( = ?AUTO_4663 ?AUTO_4664 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4664 )
      ( MAKE-ON-TABLE ?AUTO_4662 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4662 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4665 - BLOCK
    )
    :vars
    (
      ?AUTO_4666 - BLOCK
      ?AUTO_4667 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4665 ?AUTO_4666 ) ( not ( = ?AUTO_4665 ?AUTO_4666 ) ) ( not ( = ?AUTO_4665 ?AUTO_4667 ) ) ( not ( = ?AUTO_4666 ?AUTO_4667 ) ) ( ON ?AUTO_4667 ?AUTO_4665 ) ( CLEAR ?AUTO_4667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4667 ?AUTO_4665 )
      ( MAKE-ON-TABLE ?AUTO_4665 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4665 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4668 - BLOCK
    )
    :vars
    (
      ?AUTO_4669 - BLOCK
      ?AUTO_4670 - BLOCK
      ?AUTO_4671 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4668 ?AUTO_4669 ) ( not ( = ?AUTO_4668 ?AUTO_4669 ) ) ( not ( = ?AUTO_4668 ?AUTO_4670 ) ) ( not ( = ?AUTO_4669 ?AUTO_4670 ) ) ( ON ?AUTO_4670 ?AUTO_4668 ) ( CLEAR ?AUTO_4670 ) ( HOLDING ?AUTO_4671 ) ( not ( = ?AUTO_4668 ?AUTO_4671 ) ) ( not ( = ?AUTO_4669 ?AUTO_4671 ) ) ( not ( = ?AUTO_4670 ?AUTO_4671 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4671 )
      ( MAKE-ON-TABLE ?AUTO_4668 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4668 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4672 - BLOCK
    )
    :vars
    (
      ?AUTO_4673 - BLOCK
      ?AUTO_4674 - BLOCK
      ?AUTO_4675 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4672 ?AUTO_4673 ) ( not ( = ?AUTO_4672 ?AUTO_4673 ) ) ( not ( = ?AUTO_4672 ?AUTO_4674 ) ) ( not ( = ?AUTO_4673 ?AUTO_4674 ) ) ( ON ?AUTO_4674 ?AUTO_4672 ) ( not ( = ?AUTO_4672 ?AUTO_4675 ) ) ( not ( = ?AUTO_4673 ?AUTO_4675 ) ) ( not ( = ?AUTO_4674 ?AUTO_4675 ) ) ( ON ?AUTO_4675 ?AUTO_4674 ) ( CLEAR ?AUTO_4675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4675 ?AUTO_4674 )
      ( MAKE-ON-TABLE ?AUTO_4672 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4672 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4676 - BLOCK
    )
    :vars
    (
      ?AUTO_4679 - BLOCK
      ?AUTO_4677 - BLOCK
      ?AUTO_4678 - BLOCK
      ?AUTO_4680 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4676 ?AUTO_4679 ) ( not ( = ?AUTO_4676 ?AUTO_4679 ) ) ( not ( = ?AUTO_4676 ?AUTO_4677 ) ) ( not ( = ?AUTO_4679 ?AUTO_4677 ) ) ( ON ?AUTO_4677 ?AUTO_4676 ) ( not ( = ?AUTO_4676 ?AUTO_4678 ) ) ( not ( = ?AUTO_4679 ?AUTO_4678 ) ) ( not ( = ?AUTO_4677 ?AUTO_4678 ) ) ( ON ?AUTO_4678 ?AUTO_4677 ) ( CLEAR ?AUTO_4678 ) ( HOLDING ?AUTO_4680 ) ( not ( = ?AUTO_4676 ?AUTO_4680 ) ) ( not ( = ?AUTO_4679 ?AUTO_4680 ) ) ( not ( = ?AUTO_4677 ?AUTO_4680 ) ) ( not ( = ?AUTO_4678 ?AUTO_4680 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4680 )
      ( MAKE-ON-TABLE ?AUTO_4676 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4676 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4681 - BLOCK
    )
    :vars
    (
      ?AUTO_4682 - BLOCK
      ?AUTO_4685 - BLOCK
      ?AUTO_4683 - BLOCK
      ?AUTO_4684 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4681 ?AUTO_4682 ) ( not ( = ?AUTO_4681 ?AUTO_4682 ) ) ( not ( = ?AUTO_4681 ?AUTO_4685 ) ) ( not ( = ?AUTO_4682 ?AUTO_4685 ) ) ( ON ?AUTO_4685 ?AUTO_4681 ) ( not ( = ?AUTO_4681 ?AUTO_4683 ) ) ( not ( = ?AUTO_4682 ?AUTO_4683 ) ) ( not ( = ?AUTO_4685 ?AUTO_4683 ) ) ( ON ?AUTO_4683 ?AUTO_4685 ) ( not ( = ?AUTO_4681 ?AUTO_4684 ) ) ( not ( = ?AUTO_4682 ?AUTO_4684 ) ) ( not ( = ?AUTO_4685 ?AUTO_4684 ) ) ( not ( = ?AUTO_4683 ?AUTO_4684 ) ) ( ON ?AUTO_4684 ?AUTO_4683 ) ( CLEAR ?AUTO_4684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4684 ?AUTO_4683 )
      ( MAKE-ON-TABLE ?AUTO_4681 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4681 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4688 - BLOCK
      ?AUTO_4689 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4688 ) ( CLEAR ?AUTO_4689 ) ( not ( = ?AUTO_4688 ?AUTO_4689 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4688 ?AUTO_4689 )
      ( MAKE-ON-VERIFY ?AUTO_4688 ?AUTO_4689 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4690 - BLOCK
      ?AUTO_4691 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4691 ) ( not ( = ?AUTO_4690 ?AUTO_4691 ) ) ( ON-TABLE ?AUTO_4690 ) ( CLEAR ?AUTO_4690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4690 )
      ( MAKE-ON ?AUTO_4690 ?AUTO_4691 )
      ( MAKE-ON-VERIFY ?AUTO_4690 ?AUTO_4691 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4692 - BLOCK
      ?AUTO_4693 - BLOCK
    )
    :vars
    (
      ?AUTO_4694 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4693 ) ( not ( = ?AUTO_4692 ?AUTO_4693 ) ) ( ON-TABLE ?AUTO_4692 ) ( CLEAR ?AUTO_4692 ) ( HOLDING ?AUTO_4694 ) ( not ( = ?AUTO_4692 ?AUTO_4694 ) ) ( not ( = ?AUTO_4693 ?AUTO_4694 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4694 )
      ( MAKE-ON ?AUTO_4692 ?AUTO_4693 )
      ( MAKE-ON-VERIFY ?AUTO_4692 ?AUTO_4693 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4695 - BLOCK
      ?AUTO_4696 - BLOCK
    )
    :vars
    (
      ?AUTO_4697 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4695 ?AUTO_4696 ) ) ( ON-TABLE ?AUTO_4695 ) ( CLEAR ?AUTO_4695 ) ( not ( = ?AUTO_4695 ?AUTO_4697 ) ) ( not ( = ?AUTO_4696 ?AUTO_4697 ) ) ( ON ?AUTO_4697 ?AUTO_4696 ) ( CLEAR ?AUTO_4697 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4697 ?AUTO_4696 )
      ( MAKE-ON ?AUTO_4695 ?AUTO_4696 )
      ( MAKE-ON-VERIFY ?AUTO_4695 ?AUTO_4696 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4698 - BLOCK
      ?AUTO_4699 - BLOCK
    )
    :vars
    (
      ?AUTO_4700 - BLOCK
      ?AUTO_4701 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4698 ?AUTO_4699 ) ) ( ON-TABLE ?AUTO_4698 ) ( CLEAR ?AUTO_4698 ) ( not ( = ?AUTO_4698 ?AUTO_4700 ) ) ( not ( = ?AUTO_4699 ?AUTO_4700 ) ) ( ON ?AUTO_4700 ?AUTO_4699 ) ( CLEAR ?AUTO_4700 ) ( HOLDING ?AUTO_4701 ) ( not ( = ?AUTO_4698 ?AUTO_4701 ) ) ( not ( = ?AUTO_4699 ?AUTO_4701 ) ) ( not ( = ?AUTO_4700 ?AUTO_4701 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4701 )
      ( MAKE-ON ?AUTO_4698 ?AUTO_4699 )
      ( MAKE-ON-VERIFY ?AUTO_4698 ?AUTO_4699 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4702 - BLOCK
      ?AUTO_4703 - BLOCK
    )
    :vars
    (
      ?AUTO_4704 - BLOCK
      ?AUTO_4705 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4702 ?AUTO_4703 ) ) ( ON-TABLE ?AUTO_4702 ) ( CLEAR ?AUTO_4702 ) ( not ( = ?AUTO_4702 ?AUTO_4704 ) ) ( not ( = ?AUTO_4703 ?AUTO_4704 ) ) ( ON ?AUTO_4704 ?AUTO_4703 ) ( not ( = ?AUTO_4702 ?AUTO_4705 ) ) ( not ( = ?AUTO_4703 ?AUTO_4705 ) ) ( not ( = ?AUTO_4704 ?AUTO_4705 ) ) ( ON ?AUTO_4705 ?AUTO_4704 ) ( CLEAR ?AUTO_4705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4705 ?AUTO_4704 )
      ( MAKE-ON ?AUTO_4702 ?AUTO_4703 )
      ( MAKE-ON-VERIFY ?AUTO_4702 ?AUTO_4703 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4706 - BLOCK
      ?AUTO_4707 - BLOCK
    )
    :vars
    (
      ?AUTO_4708 - BLOCK
      ?AUTO_4709 - BLOCK
      ?AUTO_4710 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4706 ?AUTO_4707 ) ) ( ON-TABLE ?AUTO_4706 ) ( CLEAR ?AUTO_4706 ) ( not ( = ?AUTO_4706 ?AUTO_4708 ) ) ( not ( = ?AUTO_4707 ?AUTO_4708 ) ) ( ON ?AUTO_4708 ?AUTO_4707 ) ( not ( = ?AUTO_4706 ?AUTO_4709 ) ) ( not ( = ?AUTO_4707 ?AUTO_4709 ) ) ( not ( = ?AUTO_4708 ?AUTO_4709 ) ) ( ON ?AUTO_4709 ?AUTO_4708 ) ( CLEAR ?AUTO_4709 ) ( HOLDING ?AUTO_4710 ) ( not ( = ?AUTO_4706 ?AUTO_4710 ) ) ( not ( = ?AUTO_4707 ?AUTO_4710 ) ) ( not ( = ?AUTO_4708 ?AUTO_4710 ) ) ( not ( = ?AUTO_4709 ?AUTO_4710 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4710 )
      ( MAKE-ON ?AUTO_4706 ?AUTO_4707 )
      ( MAKE-ON-VERIFY ?AUTO_4706 ?AUTO_4707 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4711 - BLOCK
      ?AUTO_4712 - BLOCK
    )
    :vars
    (
      ?AUTO_4714 - BLOCK
      ?AUTO_4715 - BLOCK
      ?AUTO_4713 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4711 ?AUTO_4712 ) ) ( ON-TABLE ?AUTO_4711 ) ( CLEAR ?AUTO_4711 ) ( not ( = ?AUTO_4711 ?AUTO_4714 ) ) ( not ( = ?AUTO_4712 ?AUTO_4714 ) ) ( ON ?AUTO_4714 ?AUTO_4712 ) ( not ( = ?AUTO_4711 ?AUTO_4715 ) ) ( not ( = ?AUTO_4712 ?AUTO_4715 ) ) ( not ( = ?AUTO_4714 ?AUTO_4715 ) ) ( ON ?AUTO_4715 ?AUTO_4714 ) ( not ( = ?AUTO_4711 ?AUTO_4713 ) ) ( not ( = ?AUTO_4712 ?AUTO_4713 ) ) ( not ( = ?AUTO_4714 ?AUTO_4713 ) ) ( not ( = ?AUTO_4715 ?AUTO_4713 ) ) ( ON ?AUTO_4713 ?AUTO_4715 ) ( CLEAR ?AUTO_4713 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4713 ?AUTO_4715 )
      ( MAKE-ON ?AUTO_4711 ?AUTO_4712 )
      ( MAKE-ON-VERIFY ?AUTO_4711 ?AUTO_4712 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4716 - BLOCK
      ?AUTO_4717 - BLOCK
    )
    :vars
    (
      ?AUTO_4719 - BLOCK
      ?AUTO_4720 - BLOCK
      ?AUTO_4718 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4716 ?AUTO_4717 ) ) ( not ( = ?AUTO_4716 ?AUTO_4719 ) ) ( not ( = ?AUTO_4717 ?AUTO_4719 ) ) ( ON ?AUTO_4719 ?AUTO_4717 ) ( not ( = ?AUTO_4716 ?AUTO_4720 ) ) ( not ( = ?AUTO_4717 ?AUTO_4720 ) ) ( not ( = ?AUTO_4719 ?AUTO_4720 ) ) ( ON ?AUTO_4720 ?AUTO_4719 ) ( not ( = ?AUTO_4716 ?AUTO_4718 ) ) ( not ( = ?AUTO_4717 ?AUTO_4718 ) ) ( not ( = ?AUTO_4719 ?AUTO_4718 ) ) ( not ( = ?AUTO_4720 ?AUTO_4718 ) ) ( ON ?AUTO_4718 ?AUTO_4720 ) ( CLEAR ?AUTO_4718 ) ( HOLDING ?AUTO_4716 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4716 )
      ( MAKE-ON ?AUTO_4716 ?AUTO_4717 )
      ( MAKE-ON-VERIFY ?AUTO_4716 ?AUTO_4717 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4721 - BLOCK
      ?AUTO_4722 - BLOCK
    )
    :vars
    (
      ?AUTO_4723 - BLOCK
      ?AUTO_4725 - BLOCK
      ?AUTO_4724 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4721 ?AUTO_4722 ) ) ( not ( = ?AUTO_4721 ?AUTO_4723 ) ) ( not ( = ?AUTO_4722 ?AUTO_4723 ) ) ( ON ?AUTO_4723 ?AUTO_4722 ) ( not ( = ?AUTO_4721 ?AUTO_4725 ) ) ( not ( = ?AUTO_4722 ?AUTO_4725 ) ) ( not ( = ?AUTO_4723 ?AUTO_4725 ) ) ( ON ?AUTO_4725 ?AUTO_4723 ) ( not ( = ?AUTO_4721 ?AUTO_4724 ) ) ( not ( = ?AUTO_4722 ?AUTO_4724 ) ) ( not ( = ?AUTO_4723 ?AUTO_4724 ) ) ( not ( = ?AUTO_4725 ?AUTO_4724 ) ) ( ON ?AUTO_4724 ?AUTO_4725 ) ( ON ?AUTO_4721 ?AUTO_4724 ) ( CLEAR ?AUTO_4721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4721 ?AUTO_4724 )
      ( MAKE-ON ?AUTO_4721 ?AUTO_4722 )
      ( MAKE-ON-VERIFY ?AUTO_4721 ?AUTO_4722 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4727 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4727 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4727 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4727 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4728 - BLOCK
    )
    :vars
    (
      ?AUTO_4729 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4728 ?AUTO_4729 ) ( CLEAR ?AUTO_4728 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4728 ?AUTO_4729 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4728 ?AUTO_4729 )
      ( MAKE-ON-TABLE ?AUTO_4728 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4728 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4731 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4731 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4731 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4731 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4732 - BLOCK
    )
    :vars
    (
      ?AUTO_4733 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4732 ?AUTO_4733 ) ( CLEAR ?AUTO_4732 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4732 ?AUTO_4733 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4732 ?AUTO_4733 )
      ( MAKE-ON-TABLE ?AUTO_4732 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4732 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4734 - BLOCK
    )
    :vars
    (
      ?AUTO_4735 - BLOCK
      ?AUTO_4736 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4734 ?AUTO_4735 ) ( CLEAR ?AUTO_4734 ) ( not ( = ?AUTO_4734 ?AUTO_4735 ) ) ( HOLDING ?AUTO_4736 ) ( not ( = ?AUTO_4734 ?AUTO_4736 ) ) ( not ( = ?AUTO_4735 ?AUTO_4736 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4736 )
      ( MAKE-ON-TABLE ?AUTO_4734 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4734 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4740 - BLOCK
      ?AUTO_4741 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4740 ) ( CLEAR ?AUTO_4741 ) ( not ( = ?AUTO_4740 ?AUTO_4741 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4740 ?AUTO_4741 )
      ( MAKE-ON-VERIFY ?AUTO_4740 ?AUTO_4741 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4742 - BLOCK
      ?AUTO_4743 - BLOCK
    )
    :vars
    (
      ?AUTO_4744 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4743 ) ( not ( = ?AUTO_4742 ?AUTO_4743 ) ) ( ON ?AUTO_4742 ?AUTO_4744 ) ( CLEAR ?AUTO_4742 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4742 ?AUTO_4744 ) ) ( not ( = ?AUTO_4743 ?AUTO_4744 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4742 ?AUTO_4744 )
      ( MAKE-ON ?AUTO_4742 ?AUTO_4743 )
      ( MAKE-ON-VERIFY ?AUTO_4742 ?AUTO_4743 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4745 - BLOCK
      ?AUTO_4746 - BLOCK
    )
    :vars
    (
      ?AUTO_4747 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4745 ?AUTO_4746 ) ) ( ON ?AUTO_4745 ?AUTO_4747 ) ( CLEAR ?AUTO_4745 ) ( not ( = ?AUTO_4745 ?AUTO_4747 ) ) ( not ( = ?AUTO_4746 ?AUTO_4747 ) ) ( HOLDING ?AUTO_4746 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4746 )
      ( MAKE-ON ?AUTO_4745 ?AUTO_4746 )
      ( MAKE-ON-VERIFY ?AUTO_4745 ?AUTO_4746 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4748 - BLOCK
      ?AUTO_4749 - BLOCK
    )
    :vars
    (
      ?AUTO_4750 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4748 ?AUTO_4749 ) ) ( ON ?AUTO_4748 ?AUTO_4750 ) ( not ( = ?AUTO_4748 ?AUTO_4750 ) ) ( not ( = ?AUTO_4749 ?AUTO_4750 ) ) ( ON ?AUTO_4749 ?AUTO_4748 ) ( CLEAR ?AUTO_4749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4749 ?AUTO_4748 )
      ( MAKE-ON ?AUTO_4748 ?AUTO_4749 )
      ( MAKE-ON-VERIFY ?AUTO_4748 ?AUTO_4749 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4751 - BLOCK
      ?AUTO_4752 - BLOCK
    )
    :vars
    (
      ?AUTO_4753 - BLOCK
      ?AUTO_4754 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4751 ?AUTO_4752 ) ) ( ON ?AUTO_4751 ?AUTO_4753 ) ( not ( = ?AUTO_4751 ?AUTO_4753 ) ) ( not ( = ?AUTO_4752 ?AUTO_4753 ) ) ( ON ?AUTO_4752 ?AUTO_4751 ) ( CLEAR ?AUTO_4752 ) ( HOLDING ?AUTO_4754 ) ( not ( = ?AUTO_4751 ?AUTO_4754 ) ) ( not ( = ?AUTO_4752 ?AUTO_4754 ) ) ( not ( = ?AUTO_4753 ?AUTO_4754 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4754 )
      ( MAKE-ON ?AUTO_4751 ?AUTO_4752 )
      ( MAKE-ON-VERIFY ?AUTO_4751 ?AUTO_4752 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4759 - BLOCK
      ?AUTO_4760 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4759 ) ( CLEAR ?AUTO_4760 ) ( not ( = ?AUTO_4759 ?AUTO_4760 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4759 ?AUTO_4760 )
      ( MAKE-ON-VERIFY ?AUTO_4759 ?AUTO_4760 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4761 - BLOCK
      ?AUTO_4762 - BLOCK
    )
    :vars
    (
      ?AUTO_4763 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4762 ) ( not ( = ?AUTO_4761 ?AUTO_4762 ) ) ( ON ?AUTO_4761 ?AUTO_4763 ) ( CLEAR ?AUTO_4761 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4761 ?AUTO_4763 ) ) ( not ( = ?AUTO_4762 ?AUTO_4763 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4761 ?AUTO_4763 )
      ( MAKE-ON ?AUTO_4761 ?AUTO_4762 )
      ( MAKE-ON-VERIFY ?AUTO_4761 ?AUTO_4762 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4764 - BLOCK
      ?AUTO_4765 - BLOCK
    )
    :vars
    (
      ?AUTO_4766 - BLOCK
      ?AUTO_4767 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4764 ?AUTO_4765 ) ) ( ON ?AUTO_4764 ?AUTO_4766 ) ( CLEAR ?AUTO_4764 ) ( not ( = ?AUTO_4764 ?AUTO_4766 ) ) ( not ( = ?AUTO_4765 ?AUTO_4766 ) ) ( HOLDING ?AUTO_4765 ) ( CLEAR ?AUTO_4767 ) ( not ( = ?AUTO_4764 ?AUTO_4767 ) ) ( not ( = ?AUTO_4765 ?AUTO_4767 ) ) ( not ( = ?AUTO_4766 ?AUTO_4767 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4765 ?AUTO_4767 )
      ( MAKE-ON ?AUTO_4764 ?AUTO_4765 )
      ( MAKE-ON-VERIFY ?AUTO_4764 ?AUTO_4765 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4770 - BLOCK
      ?AUTO_4771 - BLOCK
    )
    :vars
    (
      ?AUTO_4772 - BLOCK
      ?AUTO_4773 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4771 ) ( not ( = ?AUTO_4770 ?AUTO_4771 ) ) ( ON ?AUTO_4770 ?AUTO_4772 ) ( CLEAR ?AUTO_4770 ) ( not ( = ?AUTO_4770 ?AUTO_4772 ) ) ( not ( = ?AUTO_4771 ?AUTO_4772 ) ) ( HOLDING ?AUTO_4773 ) ( not ( = ?AUTO_4770 ?AUTO_4773 ) ) ( not ( = ?AUTO_4771 ?AUTO_4773 ) ) ( not ( = ?AUTO_4772 ?AUTO_4773 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4773 )
      ( MAKE-ON ?AUTO_4770 ?AUTO_4771 )
      ( MAKE-ON-VERIFY ?AUTO_4770 ?AUTO_4771 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4774 - BLOCK
      ?AUTO_4775 - BLOCK
    )
    :vars
    (
      ?AUTO_4776 - BLOCK
      ?AUTO_4777 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4774 ?AUTO_4775 ) ) ( ON ?AUTO_4774 ?AUTO_4776 ) ( CLEAR ?AUTO_4774 ) ( not ( = ?AUTO_4774 ?AUTO_4776 ) ) ( not ( = ?AUTO_4775 ?AUTO_4776 ) ) ( not ( = ?AUTO_4774 ?AUTO_4777 ) ) ( not ( = ?AUTO_4775 ?AUTO_4777 ) ) ( not ( = ?AUTO_4776 ?AUTO_4777 ) ) ( ON ?AUTO_4777 ?AUTO_4775 ) ( CLEAR ?AUTO_4777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4777 ?AUTO_4775 )
      ( MAKE-ON ?AUTO_4774 ?AUTO_4775 )
      ( MAKE-ON-VERIFY ?AUTO_4774 ?AUTO_4775 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4778 - BLOCK
      ?AUTO_4779 - BLOCK
    )
    :vars
    (
      ?AUTO_4780 - BLOCK
      ?AUTO_4781 - BLOCK
      ?AUTO_4782 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4778 ?AUTO_4779 ) ) ( ON ?AUTO_4778 ?AUTO_4780 ) ( CLEAR ?AUTO_4778 ) ( not ( = ?AUTO_4778 ?AUTO_4780 ) ) ( not ( = ?AUTO_4779 ?AUTO_4780 ) ) ( not ( = ?AUTO_4778 ?AUTO_4781 ) ) ( not ( = ?AUTO_4779 ?AUTO_4781 ) ) ( not ( = ?AUTO_4780 ?AUTO_4781 ) ) ( ON ?AUTO_4781 ?AUTO_4779 ) ( CLEAR ?AUTO_4781 ) ( HOLDING ?AUTO_4782 ) ( not ( = ?AUTO_4778 ?AUTO_4782 ) ) ( not ( = ?AUTO_4779 ?AUTO_4782 ) ) ( not ( = ?AUTO_4780 ?AUTO_4782 ) ) ( not ( = ?AUTO_4781 ?AUTO_4782 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4782 )
      ( MAKE-ON ?AUTO_4778 ?AUTO_4779 )
      ( MAKE-ON-VERIFY ?AUTO_4778 ?AUTO_4779 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4783 - BLOCK
      ?AUTO_4784 - BLOCK
    )
    :vars
    (
      ?AUTO_4785 - BLOCK
      ?AUTO_4786 - BLOCK
      ?AUTO_4787 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4783 ?AUTO_4784 ) ) ( ON ?AUTO_4783 ?AUTO_4785 ) ( not ( = ?AUTO_4783 ?AUTO_4785 ) ) ( not ( = ?AUTO_4784 ?AUTO_4785 ) ) ( not ( = ?AUTO_4783 ?AUTO_4786 ) ) ( not ( = ?AUTO_4784 ?AUTO_4786 ) ) ( not ( = ?AUTO_4785 ?AUTO_4786 ) ) ( ON ?AUTO_4786 ?AUTO_4784 ) ( CLEAR ?AUTO_4786 ) ( not ( = ?AUTO_4783 ?AUTO_4787 ) ) ( not ( = ?AUTO_4784 ?AUTO_4787 ) ) ( not ( = ?AUTO_4785 ?AUTO_4787 ) ) ( not ( = ?AUTO_4786 ?AUTO_4787 ) ) ( ON ?AUTO_4787 ?AUTO_4783 ) ( CLEAR ?AUTO_4787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4787 ?AUTO_4783 )
      ( MAKE-ON ?AUTO_4783 ?AUTO_4784 )
      ( MAKE-ON-VERIFY ?AUTO_4783 ?AUTO_4784 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4790 - BLOCK
      ?AUTO_4791 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4790 ) ( CLEAR ?AUTO_4791 ) ( not ( = ?AUTO_4790 ?AUTO_4791 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4790 ?AUTO_4791 )
      ( MAKE-ON-VERIFY ?AUTO_4790 ?AUTO_4791 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4792 - BLOCK
      ?AUTO_4793 - BLOCK
    )
    :vars
    (
      ?AUTO_4794 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4793 ) ( not ( = ?AUTO_4792 ?AUTO_4793 ) ) ( ON ?AUTO_4792 ?AUTO_4794 ) ( CLEAR ?AUTO_4792 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4792 ?AUTO_4794 ) ) ( not ( = ?AUTO_4793 ?AUTO_4794 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4792 ?AUTO_4794 )
      ( MAKE-ON ?AUTO_4792 ?AUTO_4793 )
      ( MAKE-ON-VERIFY ?AUTO_4792 ?AUTO_4793 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4795 - BLOCK
      ?AUTO_4796 - BLOCK
    )
    :vars
    (
      ?AUTO_4797 - BLOCK
      ?AUTO_4798 - BLOCK
      ?AUTO_4799 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4796 ) ( not ( = ?AUTO_4795 ?AUTO_4796 ) ) ( ON ?AUTO_4795 ?AUTO_4797 ) ( CLEAR ?AUTO_4795 ) ( not ( = ?AUTO_4795 ?AUTO_4797 ) ) ( not ( = ?AUTO_4796 ?AUTO_4797 ) ) ( HOLDING ?AUTO_4798 ) ( CLEAR ?AUTO_4799 ) ( not ( = ?AUTO_4795 ?AUTO_4798 ) ) ( not ( = ?AUTO_4795 ?AUTO_4799 ) ) ( not ( = ?AUTO_4796 ?AUTO_4798 ) ) ( not ( = ?AUTO_4796 ?AUTO_4799 ) ) ( not ( = ?AUTO_4797 ?AUTO_4798 ) ) ( not ( = ?AUTO_4797 ?AUTO_4799 ) ) ( not ( = ?AUTO_4798 ?AUTO_4799 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4798 ?AUTO_4799 )
      ( MAKE-ON ?AUTO_4795 ?AUTO_4796 )
      ( MAKE-ON-VERIFY ?AUTO_4795 ?AUTO_4796 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4800 - BLOCK
      ?AUTO_4801 - BLOCK
    )
    :vars
    (
      ?AUTO_4802 - BLOCK
      ?AUTO_4803 - BLOCK
      ?AUTO_4804 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4800 ?AUTO_4801 ) ) ( ON ?AUTO_4800 ?AUTO_4802 ) ( CLEAR ?AUTO_4800 ) ( not ( = ?AUTO_4800 ?AUTO_4802 ) ) ( not ( = ?AUTO_4801 ?AUTO_4802 ) ) ( CLEAR ?AUTO_4803 ) ( not ( = ?AUTO_4800 ?AUTO_4804 ) ) ( not ( = ?AUTO_4800 ?AUTO_4803 ) ) ( not ( = ?AUTO_4801 ?AUTO_4804 ) ) ( not ( = ?AUTO_4801 ?AUTO_4803 ) ) ( not ( = ?AUTO_4802 ?AUTO_4804 ) ) ( not ( = ?AUTO_4802 ?AUTO_4803 ) ) ( not ( = ?AUTO_4804 ?AUTO_4803 ) ) ( ON ?AUTO_4804 ?AUTO_4801 ) ( CLEAR ?AUTO_4804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4804 ?AUTO_4801 )
      ( MAKE-ON ?AUTO_4800 ?AUTO_4801 )
      ( MAKE-ON-VERIFY ?AUTO_4800 ?AUTO_4801 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4805 - BLOCK
      ?AUTO_4806 - BLOCK
    )
    :vars
    (
      ?AUTO_4809 - BLOCK
      ?AUTO_4808 - BLOCK
      ?AUTO_4807 - BLOCK
      ?AUTO_4810 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4805 ?AUTO_4806 ) ) ( ON ?AUTO_4805 ?AUTO_4809 ) ( CLEAR ?AUTO_4805 ) ( not ( = ?AUTO_4805 ?AUTO_4809 ) ) ( not ( = ?AUTO_4806 ?AUTO_4809 ) ) ( not ( = ?AUTO_4805 ?AUTO_4808 ) ) ( not ( = ?AUTO_4805 ?AUTO_4807 ) ) ( not ( = ?AUTO_4806 ?AUTO_4808 ) ) ( not ( = ?AUTO_4806 ?AUTO_4807 ) ) ( not ( = ?AUTO_4809 ?AUTO_4808 ) ) ( not ( = ?AUTO_4809 ?AUTO_4807 ) ) ( not ( = ?AUTO_4808 ?AUTO_4807 ) ) ( ON ?AUTO_4808 ?AUTO_4806 ) ( CLEAR ?AUTO_4808 ) ( HOLDING ?AUTO_4807 ) ( CLEAR ?AUTO_4810 ) ( not ( = ?AUTO_4805 ?AUTO_4810 ) ) ( not ( = ?AUTO_4806 ?AUTO_4810 ) ) ( not ( = ?AUTO_4809 ?AUTO_4810 ) ) ( not ( = ?AUTO_4808 ?AUTO_4810 ) ) ( not ( = ?AUTO_4807 ?AUTO_4810 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4807 ?AUTO_4810 )
      ( MAKE-ON ?AUTO_4805 ?AUTO_4806 )
      ( MAKE-ON-VERIFY ?AUTO_4805 ?AUTO_4806 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4811 - BLOCK
      ?AUTO_4812 - BLOCK
    )
    :vars
    (
      ?AUTO_4816 - BLOCK
      ?AUTO_4813 - BLOCK
      ?AUTO_4814 - BLOCK
      ?AUTO_4815 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4811 ?AUTO_4812 ) ) ( ON ?AUTO_4811 ?AUTO_4816 ) ( not ( = ?AUTO_4811 ?AUTO_4816 ) ) ( not ( = ?AUTO_4812 ?AUTO_4816 ) ) ( not ( = ?AUTO_4811 ?AUTO_4813 ) ) ( not ( = ?AUTO_4811 ?AUTO_4814 ) ) ( not ( = ?AUTO_4812 ?AUTO_4813 ) ) ( not ( = ?AUTO_4812 ?AUTO_4814 ) ) ( not ( = ?AUTO_4816 ?AUTO_4813 ) ) ( not ( = ?AUTO_4816 ?AUTO_4814 ) ) ( not ( = ?AUTO_4813 ?AUTO_4814 ) ) ( ON ?AUTO_4813 ?AUTO_4812 ) ( CLEAR ?AUTO_4813 ) ( CLEAR ?AUTO_4815 ) ( not ( = ?AUTO_4811 ?AUTO_4815 ) ) ( not ( = ?AUTO_4812 ?AUTO_4815 ) ) ( not ( = ?AUTO_4816 ?AUTO_4815 ) ) ( not ( = ?AUTO_4813 ?AUTO_4815 ) ) ( not ( = ?AUTO_4814 ?AUTO_4815 ) ) ( ON ?AUTO_4814 ?AUTO_4811 ) ( CLEAR ?AUTO_4814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4814 ?AUTO_4811 )
      ( MAKE-ON ?AUTO_4811 ?AUTO_4812 )
      ( MAKE-ON-VERIFY ?AUTO_4811 ?AUTO_4812 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4817 - BLOCK
      ?AUTO_4818 - BLOCK
    )
    :vars
    (
      ?AUTO_4822 - BLOCK
      ?AUTO_4820 - BLOCK
      ?AUTO_4819 - BLOCK
      ?AUTO_4821 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4817 ?AUTO_4818 ) ) ( ON ?AUTO_4817 ?AUTO_4822 ) ( not ( = ?AUTO_4817 ?AUTO_4822 ) ) ( not ( = ?AUTO_4818 ?AUTO_4822 ) ) ( not ( = ?AUTO_4817 ?AUTO_4820 ) ) ( not ( = ?AUTO_4817 ?AUTO_4819 ) ) ( not ( = ?AUTO_4818 ?AUTO_4820 ) ) ( not ( = ?AUTO_4818 ?AUTO_4819 ) ) ( not ( = ?AUTO_4822 ?AUTO_4820 ) ) ( not ( = ?AUTO_4822 ?AUTO_4819 ) ) ( not ( = ?AUTO_4820 ?AUTO_4819 ) ) ( ON ?AUTO_4820 ?AUTO_4818 ) ( CLEAR ?AUTO_4820 ) ( not ( = ?AUTO_4817 ?AUTO_4821 ) ) ( not ( = ?AUTO_4818 ?AUTO_4821 ) ) ( not ( = ?AUTO_4822 ?AUTO_4821 ) ) ( not ( = ?AUTO_4820 ?AUTO_4821 ) ) ( not ( = ?AUTO_4819 ?AUTO_4821 ) ) ( ON ?AUTO_4819 ?AUTO_4817 ) ( CLEAR ?AUTO_4819 ) ( HOLDING ?AUTO_4821 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4821 )
      ( MAKE-ON ?AUTO_4817 ?AUTO_4818 )
      ( MAKE-ON-VERIFY ?AUTO_4817 ?AUTO_4818 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4823 - BLOCK
      ?AUTO_4824 - BLOCK
    )
    :vars
    (
      ?AUTO_4826 - BLOCK
      ?AUTO_4825 - BLOCK
      ?AUTO_4827 - BLOCK
      ?AUTO_4828 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4823 ?AUTO_4824 ) ) ( ON ?AUTO_4823 ?AUTO_4826 ) ( not ( = ?AUTO_4823 ?AUTO_4826 ) ) ( not ( = ?AUTO_4824 ?AUTO_4826 ) ) ( not ( = ?AUTO_4823 ?AUTO_4825 ) ) ( not ( = ?AUTO_4823 ?AUTO_4827 ) ) ( not ( = ?AUTO_4824 ?AUTO_4825 ) ) ( not ( = ?AUTO_4824 ?AUTO_4827 ) ) ( not ( = ?AUTO_4826 ?AUTO_4825 ) ) ( not ( = ?AUTO_4826 ?AUTO_4827 ) ) ( not ( = ?AUTO_4825 ?AUTO_4827 ) ) ( ON ?AUTO_4825 ?AUTO_4824 ) ( CLEAR ?AUTO_4825 ) ( not ( = ?AUTO_4823 ?AUTO_4828 ) ) ( not ( = ?AUTO_4824 ?AUTO_4828 ) ) ( not ( = ?AUTO_4826 ?AUTO_4828 ) ) ( not ( = ?AUTO_4825 ?AUTO_4828 ) ) ( not ( = ?AUTO_4827 ?AUTO_4828 ) ) ( ON ?AUTO_4827 ?AUTO_4823 ) ( ON ?AUTO_4828 ?AUTO_4827 ) ( CLEAR ?AUTO_4828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4828 ?AUTO_4827 )
      ( MAKE-ON ?AUTO_4823 ?AUTO_4824 )
      ( MAKE-ON-VERIFY ?AUTO_4823 ?AUTO_4824 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4829 - BLOCK
      ?AUTO_4830 - BLOCK
    )
    :vars
    (
      ?AUTO_4831 - BLOCK
      ?AUTO_4832 - BLOCK
      ?AUTO_4834 - BLOCK
      ?AUTO_4833 - BLOCK
      ?AUTO_4835 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4829 ?AUTO_4830 ) ) ( ON ?AUTO_4829 ?AUTO_4831 ) ( not ( = ?AUTO_4829 ?AUTO_4831 ) ) ( not ( = ?AUTO_4830 ?AUTO_4831 ) ) ( not ( = ?AUTO_4829 ?AUTO_4832 ) ) ( not ( = ?AUTO_4829 ?AUTO_4834 ) ) ( not ( = ?AUTO_4830 ?AUTO_4832 ) ) ( not ( = ?AUTO_4830 ?AUTO_4834 ) ) ( not ( = ?AUTO_4831 ?AUTO_4832 ) ) ( not ( = ?AUTO_4831 ?AUTO_4834 ) ) ( not ( = ?AUTO_4832 ?AUTO_4834 ) ) ( ON ?AUTO_4832 ?AUTO_4830 ) ( CLEAR ?AUTO_4832 ) ( not ( = ?AUTO_4829 ?AUTO_4833 ) ) ( not ( = ?AUTO_4830 ?AUTO_4833 ) ) ( not ( = ?AUTO_4831 ?AUTO_4833 ) ) ( not ( = ?AUTO_4832 ?AUTO_4833 ) ) ( not ( = ?AUTO_4834 ?AUTO_4833 ) ) ( ON ?AUTO_4834 ?AUTO_4829 ) ( ON ?AUTO_4833 ?AUTO_4834 ) ( CLEAR ?AUTO_4833 ) ( HOLDING ?AUTO_4835 ) ( not ( = ?AUTO_4829 ?AUTO_4835 ) ) ( not ( = ?AUTO_4830 ?AUTO_4835 ) ) ( not ( = ?AUTO_4831 ?AUTO_4835 ) ) ( not ( = ?AUTO_4832 ?AUTO_4835 ) ) ( not ( = ?AUTO_4834 ?AUTO_4835 ) ) ( not ( = ?AUTO_4833 ?AUTO_4835 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4835 )
      ( MAKE-ON ?AUTO_4829 ?AUTO_4830 )
      ( MAKE-ON-VERIFY ?AUTO_4829 ?AUTO_4830 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4836 - BLOCK
      ?AUTO_4837 - BLOCK
    )
    :vars
    (
      ?AUTO_4839 - BLOCK
      ?AUTO_4838 - BLOCK
      ?AUTO_4840 - BLOCK
      ?AUTO_4841 - BLOCK
      ?AUTO_4842 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4836 ?AUTO_4837 ) ) ( ON ?AUTO_4836 ?AUTO_4839 ) ( not ( = ?AUTO_4836 ?AUTO_4839 ) ) ( not ( = ?AUTO_4837 ?AUTO_4839 ) ) ( not ( = ?AUTO_4836 ?AUTO_4838 ) ) ( not ( = ?AUTO_4836 ?AUTO_4840 ) ) ( not ( = ?AUTO_4837 ?AUTO_4838 ) ) ( not ( = ?AUTO_4837 ?AUTO_4840 ) ) ( not ( = ?AUTO_4839 ?AUTO_4838 ) ) ( not ( = ?AUTO_4839 ?AUTO_4840 ) ) ( not ( = ?AUTO_4838 ?AUTO_4840 ) ) ( ON ?AUTO_4838 ?AUTO_4837 ) ( not ( = ?AUTO_4836 ?AUTO_4841 ) ) ( not ( = ?AUTO_4837 ?AUTO_4841 ) ) ( not ( = ?AUTO_4839 ?AUTO_4841 ) ) ( not ( = ?AUTO_4838 ?AUTO_4841 ) ) ( not ( = ?AUTO_4840 ?AUTO_4841 ) ) ( ON ?AUTO_4840 ?AUTO_4836 ) ( ON ?AUTO_4841 ?AUTO_4840 ) ( CLEAR ?AUTO_4841 ) ( not ( = ?AUTO_4836 ?AUTO_4842 ) ) ( not ( = ?AUTO_4837 ?AUTO_4842 ) ) ( not ( = ?AUTO_4839 ?AUTO_4842 ) ) ( not ( = ?AUTO_4838 ?AUTO_4842 ) ) ( not ( = ?AUTO_4840 ?AUTO_4842 ) ) ( not ( = ?AUTO_4841 ?AUTO_4842 ) ) ( ON ?AUTO_4842 ?AUTO_4838 ) ( CLEAR ?AUTO_4842 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4842 ?AUTO_4838 )
      ( MAKE-ON ?AUTO_4836 ?AUTO_4837 )
      ( MAKE-ON-VERIFY ?AUTO_4836 ?AUTO_4837 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4845 - BLOCK
      ?AUTO_4846 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4845 ) ( CLEAR ?AUTO_4846 ) ( not ( = ?AUTO_4845 ?AUTO_4846 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4845 ?AUTO_4846 )
      ( MAKE-ON-VERIFY ?AUTO_4845 ?AUTO_4846 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4847 - BLOCK
      ?AUTO_4848 - BLOCK
    )
    :vars
    (
      ?AUTO_4849 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4848 ) ( not ( = ?AUTO_4847 ?AUTO_4848 ) ) ( ON ?AUTO_4847 ?AUTO_4849 ) ( CLEAR ?AUTO_4847 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4847 ?AUTO_4849 ) ) ( not ( = ?AUTO_4848 ?AUTO_4849 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4847 ?AUTO_4849 )
      ( MAKE-ON ?AUTO_4847 ?AUTO_4848 )
      ( MAKE-ON-VERIFY ?AUTO_4847 ?AUTO_4848 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4850 - BLOCK
      ?AUTO_4851 - BLOCK
    )
    :vars
    (
      ?AUTO_4852 - BLOCK
      ?AUTO_4853 - BLOCK
      ?AUTO_4854 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4851 ) ( not ( = ?AUTO_4850 ?AUTO_4851 ) ) ( ON ?AUTO_4850 ?AUTO_4852 ) ( CLEAR ?AUTO_4850 ) ( not ( = ?AUTO_4850 ?AUTO_4852 ) ) ( not ( = ?AUTO_4851 ?AUTO_4852 ) ) ( HOLDING ?AUTO_4853 ) ( CLEAR ?AUTO_4854 ) ( not ( = ?AUTO_4850 ?AUTO_4853 ) ) ( not ( = ?AUTO_4850 ?AUTO_4854 ) ) ( not ( = ?AUTO_4851 ?AUTO_4853 ) ) ( not ( = ?AUTO_4851 ?AUTO_4854 ) ) ( not ( = ?AUTO_4852 ?AUTO_4853 ) ) ( not ( = ?AUTO_4852 ?AUTO_4854 ) ) ( not ( = ?AUTO_4853 ?AUTO_4854 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4853 ?AUTO_4854 )
      ( MAKE-ON ?AUTO_4850 ?AUTO_4851 )
      ( MAKE-ON-VERIFY ?AUTO_4850 ?AUTO_4851 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4857 - BLOCK
      ?AUTO_4858 - BLOCK
    )
    :vars
    (
      ?AUTO_4859 - BLOCK
      ?AUTO_4860 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4857 ?AUTO_4858 ) ) ( ON ?AUTO_4857 ?AUTO_4859 ) ( CLEAR ?AUTO_4857 ) ( not ( = ?AUTO_4857 ?AUTO_4859 ) ) ( not ( = ?AUTO_4858 ?AUTO_4859 ) ) ( HOLDING ?AUTO_4858 ) ( CLEAR ?AUTO_4860 ) ( not ( = ?AUTO_4857 ?AUTO_4860 ) ) ( not ( = ?AUTO_4858 ?AUTO_4860 ) ) ( not ( = ?AUTO_4859 ?AUTO_4860 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4858 ?AUTO_4860 )
      ( MAKE-ON ?AUTO_4857 ?AUTO_4858 )
      ( MAKE-ON-VERIFY ?AUTO_4857 ?AUTO_4858 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4877 - BLOCK
      ?AUTO_4878 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4877 ) ( CLEAR ?AUTO_4878 ) ( not ( = ?AUTO_4877 ?AUTO_4878 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4877 ?AUTO_4878 )
      ( MAKE-ON-VERIFY ?AUTO_4877 ?AUTO_4878 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4879 - BLOCK
      ?AUTO_4880 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4880 ) ( not ( = ?AUTO_4879 ?AUTO_4880 ) ) ( ON-TABLE ?AUTO_4879 ) ( CLEAR ?AUTO_4879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4879 )
      ( MAKE-ON ?AUTO_4879 ?AUTO_4880 )
      ( MAKE-ON-VERIFY ?AUTO_4879 ?AUTO_4880 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4881 - BLOCK
      ?AUTO_4882 - BLOCK
    )
    :vars
    (
      ?AUTO_4883 - BLOCK
      ?AUTO_4884 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4882 ) ( not ( = ?AUTO_4881 ?AUTO_4882 ) ) ( ON-TABLE ?AUTO_4881 ) ( CLEAR ?AUTO_4881 ) ( HOLDING ?AUTO_4883 ) ( CLEAR ?AUTO_4884 ) ( not ( = ?AUTO_4881 ?AUTO_4883 ) ) ( not ( = ?AUTO_4881 ?AUTO_4884 ) ) ( not ( = ?AUTO_4882 ?AUTO_4883 ) ) ( not ( = ?AUTO_4882 ?AUTO_4884 ) ) ( not ( = ?AUTO_4883 ?AUTO_4884 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4883 ?AUTO_4884 )
      ( MAKE-ON ?AUTO_4881 ?AUTO_4882 )
      ( MAKE-ON-VERIFY ?AUTO_4881 ?AUTO_4882 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4885 - BLOCK
      ?AUTO_4886 - BLOCK
    )
    :vars
    (
      ?AUTO_4887 - BLOCK
      ?AUTO_4888 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4886 ) ( not ( = ?AUTO_4885 ?AUTO_4886 ) ) ( ON-TABLE ?AUTO_4885 ) ( CLEAR ?AUTO_4887 ) ( not ( = ?AUTO_4885 ?AUTO_4888 ) ) ( not ( = ?AUTO_4885 ?AUTO_4887 ) ) ( not ( = ?AUTO_4886 ?AUTO_4888 ) ) ( not ( = ?AUTO_4886 ?AUTO_4887 ) ) ( not ( = ?AUTO_4888 ?AUTO_4887 ) ) ( ON ?AUTO_4888 ?AUTO_4885 ) ( CLEAR ?AUTO_4888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4888 ?AUTO_4885 )
      ( MAKE-ON ?AUTO_4885 ?AUTO_4886 )
      ( MAKE-ON-VERIFY ?AUTO_4885 ?AUTO_4886 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4889 - BLOCK
      ?AUTO_4890 - BLOCK
    )
    :vars
    (
      ?AUTO_4892 - BLOCK
      ?AUTO_4891 - BLOCK
      ?AUTO_4893 - BLOCK
      ?AUTO_4894 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4890 ) ( not ( = ?AUTO_4889 ?AUTO_4890 ) ) ( ON-TABLE ?AUTO_4889 ) ( CLEAR ?AUTO_4892 ) ( not ( = ?AUTO_4889 ?AUTO_4891 ) ) ( not ( = ?AUTO_4889 ?AUTO_4892 ) ) ( not ( = ?AUTO_4890 ?AUTO_4891 ) ) ( not ( = ?AUTO_4890 ?AUTO_4892 ) ) ( not ( = ?AUTO_4891 ?AUTO_4892 ) ) ( ON ?AUTO_4891 ?AUTO_4889 ) ( CLEAR ?AUTO_4891 ) ( HOLDING ?AUTO_4893 ) ( CLEAR ?AUTO_4894 ) ( not ( = ?AUTO_4889 ?AUTO_4893 ) ) ( not ( = ?AUTO_4889 ?AUTO_4894 ) ) ( not ( = ?AUTO_4890 ?AUTO_4893 ) ) ( not ( = ?AUTO_4890 ?AUTO_4894 ) ) ( not ( = ?AUTO_4892 ?AUTO_4893 ) ) ( not ( = ?AUTO_4892 ?AUTO_4894 ) ) ( not ( = ?AUTO_4891 ?AUTO_4893 ) ) ( not ( = ?AUTO_4891 ?AUTO_4894 ) ) ( not ( = ?AUTO_4893 ?AUTO_4894 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4893 ?AUTO_4894 )
      ( MAKE-ON ?AUTO_4889 ?AUTO_4890 )
      ( MAKE-ON-VERIFY ?AUTO_4889 ?AUTO_4890 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4909 - BLOCK
      ?AUTO_4910 - BLOCK
    )
    :vars
    (
      ?AUTO_4912 - BLOCK
      ?AUTO_4911 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4909 ?AUTO_4910 ) ) ( ON-TABLE ?AUTO_4909 ) ( CLEAR ?AUTO_4912 ) ( not ( = ?AUTO_4909 ?AUTO_4911 ) ) ( not ( = ?AUTO_4909 ?AUTO_4912 ) ) ( not ( = ?AUTO_4910 ?AUTO_4911 ) ) ( not ( = ?AUTO_4910 ?AUTO_4912 ) ) ( not ( = ?AUTO_4911 ?AUTO_4912 ) ) ( ON ?AUTO_4911 ?AUTO_4909 ) ( CLEAR ?AUTO_4911 ) ( HOLDING ?AUTO_4910 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4910 )
      ( MAKE-ON ?AUTO_4909 ?AUTO_4910 )
      ( MAKE-ON-VERIFY ?AUTO_4909 ?AUTO_4910 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4914 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4914 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4914 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4914 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4915 - BLOCK
    )
    :vars
    (
      ?AUTO_4916 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4915 ?AUTO_4916 ) ( CLEAR ?AUTO_4915 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4915 ?AUTO_4916 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4915 ?AUTO_4916 )
      ( MAKE-ON-TABLE ?AUTO_4915 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4915 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4918 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4918 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4918 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4918 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4919 - BLOCK
    )
    :vars
    (
      ?AUTO_4920 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4919 ?AUTO_4920 ) ( CLEAR ?AUTO_4919 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4919 ?AUTO_4920 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4919 ?AUTO_4920 )
      ( MAKE-ON-TABLE ?AUTO_4919 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4919 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4921 - BLOCK
    )
    :vars
    (
      ?AUTO_4922 - BLOCK
      ?AUTO_4923 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4921 ?AUTO_4922 ) ( CLEAR ?AUTO_4921 ) ( not ( = ?AUTO_4921 ?AUTO_4922 ) ) ( HOLDING ?AUTO_4923 ) ( not ( = ?AUTO_4921 ?AUTO_4923 ) ) ( not ( = ?AUTO_4922 ?AUTO_4923 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4923 )
      ( MAKE-ON-TABLE ?AUTO_4921 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4921 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4926 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4926 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4926 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4926 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4927 - BLOCK
    )
    :vars
    (
      ?AUTO_4928 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4927 ?AUTO_4928 ) ( CLEAR ?AUTO_4927 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4927 ?AUTO_4928 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4927 ?AUTO_4928 )
      ( MAKE-ON-TABLE ?AUTO_4927 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4927 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4929 - BLOCK
    )
    :vars
    (
      ?AUTO_4930 - BLOCK
      ?AUTO_4931 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4929 ?AUTO_4930 ) ( CLEAR ?AUTO_4929 ) ( not ( = ?AUTO_4929 ?AUTO_4930 ) ) ( HOLDING ?AUTO_4931 ) ( not ( = ?AUTO_4929 ?AUTO_4931 ) ) ( not ( = ?AUTO_4930 ?AUTO_4931 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4931 )
      ( MAKE-ON-TABLE ?AUTO_4929 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4929 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4932 - BLOCK
    )
    :vars
    (
      ?AUTO_4933 - BLOCK
      ?AUTO_4934 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4932 ?AUTO_4933 ) ( not ( = ?AUTO_4932 ?AUTO_4933 ) ) ( not ( = ?AUTO_4932 ?AUTO_4934 ) ) ( not ( = ?AUTO_4933 ?AUTO_4934 ) ) ( ON ?AUTO_4934 ?AUTO_4932 ) ( CLEAR ?AUTO_4934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4934 ?AUTO_4932 )
      ( MAKE-ON-TABLE ?AUTO_4932 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4932 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4935 - BLOCK
    )
    :vars
    (
      ?AUTO_4936 - BLOCK
      ?AUTO_4937 - BLOCK
      ?AUTO_4938 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4935 ?AUTO_4936 ) ( not ( = ?AUTO_4935 ?AUTO_4936 ) ) ( not ( = ?AUTO_4935 ?AUTO_4937 ) ) ( not ( = ?AUTO_4936 ?AUTO_4937 ) ) ( ON ?AUTO_4937 ?AUTO_4935 ) ( CLEAR ?AUTO_4937 ) ( HOLDING ?AUTO_4938 ) ( not ( = ?AUTO_4935 ?AUTO_4938 ) ) ( not ( = ?AUTO_4936 ?AUTO_4938 ) ) ( not ( = ?AUTO_4937 ?AUTO_4938 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4938 )
      ( MAKE-ON-TABLE ?AUTO_4935 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4935 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4942 - BLOCK
      ?AUTO_4943 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4942 ) ( CLEAR ?AUTO_4943 ) ( not ( = ?AUTO_4942 ?AUTO_4943 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4942 ?AUTO_4943 )
      ( MAKE-ON-VERIFY ?AUTO_4942 ?AUTO_4943 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4944 - BLOCK
      ?AUTO_4945 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4945 ) ( not ( = ?AUTO_4944 ?AUTO_4945 ) ) ( ON-TABLE ?AUTO_4944 ) ( CLEAR ?AUTO_4944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4944 )
      ( MAKE-ON ?AUTO_4944 ?AUTO_4945 )
      ( MAKE-ON-VERIFY ?AUTO_4944 ?AUTO_4945 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4946 - BLOCK
      ?AUTO_4947 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4946 ?AUTO_4947 ) ) ( ON-TABLE ?AUTO_4946 ) ( CLEAR ?AUTO_4946 ) ( HOLDING ?AUTO_4947 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4947 )
      ( MAKE-ON ?AUTO_4946 ?AUTO_4947 )
      ( MAKE-ON-VERIFY ?AUTO_4946 ?AUTO_4947 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4962 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4962 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4962 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4962 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4963 - BLOCK
    )
    :vars
    (
      ?AUTO_4964 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4963 ?AUTO_4964 ) ( CLEAR ?AUTO_4963 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4963 ?AUTO_4964 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4963 ?AUTO_4964 )
      ( MAKE-ON-TABLE ?AUTO_4963 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4963 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4965 - BLOCK
    )
    :vars
    (
      ?AUTO_4966 - BLOCK
      ?AUTO_4967 - BLOCK
      ?AUTO_4968 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4965 ?AUTO_4966 ) ( CLEAR ?AUTO_4965 ) ( not ( = ?AUTO_4965 ?AUTO_4966 ) ) ( HOLDING ?AUTO_4967 ) ( CLEAR ?AUTO_4968 ) ( not ( = ?AUTO_4965 ?AUTO_4967 ) ) ( not ( = ?AUTO_4965 ?AUTO_4968 ) ) ( not ( = ?AUTO_4966 ?AUTO_4967 ) ) ( not ( = ?AUTO_4966 ?AUTO_4968 ) ) ( not ( = ?AUTO_4967 ?AUTO_4968 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4967 ?AUTO_4968 )
      ( MAKE-ON-TABLE ?AUTO_4965 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4965 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4971 - BLOCK
    )
    :vars
    (
      ?AUTO_4974 - BLOCK
      ?AUTO_4972 - BLOCK
      ?AUTO_4973 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4971 ?AUTO_4974 ) ( not ( = ?AUTO_4971 ?AUTO_4974 ) ) ( CLEAR ?AUTO_4972 ) ( not ( = ?AUTO_4971 ?AUTO_4973 ) ) ( not ( = ?AUTO_4971 ?AUTO_4972 ) ) ( not ( = ?AUTO_4974 ?AUTO_4973 ) ) ( not ( = ?AUTO_4974 ?AUTO_4972 ) ) ( not ( = ?AUTO_4973 ?AUTO_4972 ) ) ( ON ?AUTO_4973 ?AUTO_4971 ) ( CLEAR ?AUTO_4973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4973 ?AUTO_4971 )
      ( MAKE-ON-TABLE ?AUTO_4971 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4971 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4975 - BLOCK
    )
    :vars
    (
      ?AUTO_4978 - BLOCK
      ?AUTO_4977 - BLOCK
      ?AUTO_4976 - BLOCK
      ?AUTO_4979 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4975 ?AUTO_4978 ) ( not ( = ?AUTO_4975 ?AUTO_4978 ) ) ( CLEAR ?AUTO_4977 ) ( not ( = ?AUTO_4975 ?AUTO_4976 ) ) ( not ( = ?AUTO_4975 ?AUTO_4977 ) ) ( not ( = ?AUTO_4978 ?AUTO_4976 ) ) ( not ( = ?AUTO_4978 ?AUTO_4977 ) ) ( not ( = ?AUTO_4976 ?AUTO_4977 ) ) ( ON ?AUTO_4976 ?AUTO_4975 ) ( CLEAR ?AUTO_4976 ) ( HOLDING ?AUTO_4979 ) ( not ( = ?AUTO_4975 ?AUTO_4979 ) ) ( not ( = ?AUTO_4978 ?AUTO_4979 ) ) ( not ( = ?AUTO_4977 ?AUTO_4979 ) ) ( not ( = ?AUTO_4976 ?AUTO_4979 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4979 )
      ( MAKE-ON-TABLE ?AUTO_4975 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4975 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4980 - BLOCK
    )
    :vars
    (
      ?AUTO_4984 - BLOCK
      ?AUTO_4981 - BLOCK
      ?AUTO_4983 - BLOCK
      ?AUTO_4982 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4980 ?AUTO_4984 ) ( not ( = ?AUTO_4980 ?AUTO_4984 ) ) ( CLEAR ?AUTO_4981 ) ( not ( = ?AUTO_4980 ?AUTO_4983 ) ) ( not ( = ?AUTO_4980 ?AUTO_4981 ) ) ( not ( = ?AUTO_4984 ?AUTO_4983 ) ) ( not ( = ?AUTO_4984 ?AUTO_4981 ) ) ( not ( = ?AUTO_4983 ?AUTO_4981 ) ) ( ON ?AUTO_4983 ?AUTO_4980 ) ( not ( = ?AUTO_4980 ?AUTO_4982 ) ) ( not ( = ?AUTO_4984 ?AUTO_4982 ) ) ( not ( = ?AUTO_4981 ?AUTO_4982 ) ) ( not ( = ?AUTO_4983 ?AUTO_4982 ) ) ( ON ?AUTO_4982 ?AUTO_4983 ) ( CLEAR ?AUTO_4982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4982 ?AUTO_4983 )
      ( MAKE-ON-TABLE ?AUTO_4980 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4980 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4985 - BLOCK
    )
    :vars
    (
      ?AUTO_4986 - BLOCK
      ?AUTO_4989 - BLOCK
      ?AUTO_4987 - BLOCK
      ?AUTO_4988 - BLOCK
      ?AUTO_4990 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4985 ?AUTO_4986 ) ( not ( = ?AUTO_4985 ?AUTO_4986 ) ) ( CLEAR ?AUTO_4989 ) ( not ( = ?AUTO_4985 ?AUTO_4987 ) ) ( not ( = ?AUTO_4985 ?AUTO_4989 ) ) ( not ( = ?AUTO_4986 ?AUTO_4987 ) ) ( not ( = ?AUTO_4986 ?AUTO_4989 ) ) ( not ( = ?AUTO_4987 ?AUTO_4989 ) ) ( ON ?AUTO_4987 ?AUTO_4985 ) ( not ( = ?AUTO_4985 ?AUTO_4988 ) ) ( not ( = ?AUTO_4986 ?AUTO_4988 ) ) ( not ( = ?AUTO_4989 ?AUTO_4988 ) ) ( not ( = ?AUTO_4987 ?AUTO_4988 ) ) ( ON ?AUTO_4988 ?AUTO_4987 ) ( CLEAR ?AUTO_4988 ) ( HOLDING ?AUTO_4990 ) ( not ( = ?AUTO_4985 ?AUTO_4990 ) ) ( not ( = ?AUTO_4986 ?AUTO_4990 ) ) ( not ( = ?AUTO_4989 ?AUTO_4990 ) ) ( not ( = ?AUTO_4987 ?AUTO_4990 ) ) ( not ( = ?AUTO_4988 ?AUTO_4990 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4990 )
      ( MAKE-ON-TABLE ?AUTO_4985 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4985 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4993 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4993 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4993 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4993 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4994 - BLOCK
    )
    :vars
    (
      ?AUTO_4995 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4994 ?AUTO_4995 ) ( CLEAR ?AUTO_4994 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4994 ?AUTO_4995 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4994 ?AUTO_4995 )
      ( MAKE-ON-TABLE ?AUTO_4994 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4994 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4996 - BLOCK
    )
    :vars
    (
      ?AUTO_4997 - BLOCK
      ?AUTO_4998 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4996 ?AUTO_4997 ) ( CLEAR ?AUTO_4996 ) ( not ( = ?AUTO_4996 ?AUTO_4997 ) ) ( HOLDING ?AUTO_4998 ) ( not ( = ?AUTO_4996 ?AUTO_4998 ) ) ( not ( = ?AUTO_4997 ?AUTO_4998 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4998 )
      ( MAKE-ON-TABLE ?AUTO_4996 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4996 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4999 - BLOCK
    )
    :vars
    (
      ?AUTO_5000 - BLOCK
      ?AUTO_5001 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4999 ?AUTO_5000 ) ( not ( = ?AUTO_4999 ?AUTO_5000 ) ) ( not ( = ?AUTO_4999 ?AUTO_5001 ) ) ( not ( = ?AUTO_5000 ?AUTO_5001 ) ) ( ON ?AUTO_5001 ?AUTO_4999 ) ( CLEAR ?AUTO_5001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5001 ?AUTO_4999 )
      ( MAKE-ON-TABLE ?AUTO_4999 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4999 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5002 - BLOCK
    )
    :vars
    (
      ?AUTO_5004 - BLOCK
      ?AUTO_5003 - BLOCK
      ?AUTO_5005 - BLOCK
      ?AUTO_5006 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5002 ?AUTO_5004 ) ( not ( = ?AUTO_5002 ?AUTO_5004 ) ) ( not ( = ?AUTO_5002 ?AUTO_5003 ) ) ( not ( = ?AUTO_5004 ?AUTO_5003 ) ) ( ON ?AUTO_5003 ?AUTO_5002 ) ( CLEAR ?AUTO_5003 ) ( HOLDING ?AUTO_5005 ) ( CLEAR ?AUTO_5006 ) ( not ( = ?AUTO_5002 ?AUTO_5005 ) ) ( not ( = ?AUTO_5002 ?AUTO_5006 ) ) ( not ( = ?AUTO_5004 ?AUTO_5005 ) ) ( not ( = ?AUTO_5004 ?AUTO_5006 ) ) ( not ( = ?AUTO_5003 ?AUTO_5005 ) ) ( not ( = ?AUTO_5003 ?AUTO_5006 ) ) ( not ( = ?AUTO_5005 ?AUTO_5006 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5005 ?AUTO_5006 )
      ( MAKE-ON-TABLE ?AUTO_5002 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5002 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5009 - BLOCK
    )
    :vars
    (
      ?AUTO_5012 - BLOCK
      ?AUTO_5013 - BLOCK
      ?AUTO_5011 - BLOCK
      ?AUTO_5010 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5009 ?AUTO_5012 ) ( not ( = ?AUTO_5009 ?AUTO_5012 ) ) ( not ( = ?AUTO_5009 ?AUTO_5013 ) ) ( not ( = ?AUTO_5012 ?AUTO_5013 ) ) ( ON ?AUTO_5013 ?AUTO_5009 ) ( CLEAR ?AUTO_5011 ) ( not ( = ?AUTO_5009 ?AUTO_5010 ) ) ( not ( = ?AUTO_5009 ?AUTO_5011 ) ) ( not ( = ?AUTO_5012 ?AUTO_5010 ) ) ( not ( = ?AUTO_5012 ?AUTO_5011 ) ) ( not ( = ?AUTO_5013 ?AUTO_5010 ) ) ( not ( = ?AUTO_5013 ?AUTO_5011 ) ) ( not ( = ?AUTO_5010 ?AUTO_5011 ) ) ( ON ?AUTO_5010 ?AUTO_5013 ) ( CLEAR ?AUTO_5010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5010 ?AUTO_5013 )
      ( MAKE-ON-TABLE ?AUTO_5009 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5009 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5014 - BLOCK
    )
    :vars
    (
      ?AUTO_5016 - BLOCK
      ?AUTO_5015 - BLOCK
      ?AUTO_5018 - BLOCK
      ?AUTO_5017 - BLOCK
      ?AUTO_5019 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5014 ?AUTO_5016 ) ( not ( = ?AUTO_5014 ?AUTO_5016 ) ) ( not ( = ?AUTO_5014 ?AUTO_5015 ) ) ( not ( = ?AUTO_5016 ?AUTO_5015 ) ) ( ON ?AUTO_5015 ?AUTO_5014 ) ( CLEAR ?AUTO_5018 ) ( not ( = ?AUTO_5014 ?AUTO_5017 ) ) ( not ( = ?AUTO_5014 ?AUTO_5018 ) ) ( not ( = ?AUTO_5016 ?AUTO_5017 ) ) ( not ( = ?AUTO_5016 ?AUTO_5018 ) ) ( not ( = ?AUTO_5015 ?AUTO_5017 ) ) ( not ( = ?AUTO_5015 ?AUTO_5018 ) ) ( not ( = ?AUTO_5017 ?AUTO_5018 ) ) ( ON ?AUTO_5017 ?AUTO_5015 ) ( CLEAR ?AUTO_5017 ) ( HOLDING ?AUTO_5019 ) ( not ( = ?AUTO_5014 ?AUTO_5019 ) ) ( not ( = ?AUTO_5016 ?AUTO_5019 ) ) ( not ( = ?AUTO_5015 ?AUTO_5019 ) ) ( not ( = ?AUTO_5018 ?AUTO_5019 ) ) ( not ( = ?AUTO_5017 ?AUTO_5019 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5019 )
      ( MAKE-ON-TABLE ?AUTO_5014 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5014 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5020 - BLOCK
    )
    :vars
    (
      ?AUTO_5021 - BLOCK
      ?AUTO_5022 - BLOCK
      ?AUTO_5023 - BLOCK
      ?AUTO_5024 - BLOCK
      ?AUTO_5025 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5020 ?AUTO_5021 ) ( not ( = ?AUTO_5020 ?AUTO_5021 ) ) ( not ( = ?AUTO_5020 ?AUTO_5022 ) ) ( not ( = ?AUTO_5021 ?AUTO_5022 ) ) ( ON ?AUTO_5022 ?AUTO_5020 ) ( CLEAR ?AUTO_5023 ) ( not ( = ?AUTO_5020 ?AUTO_5024 ) ) ( not ( = ?AUTO_5020 ?AUTO_5023 ) ) ( not ( = ?AUTO_5021 ?AUTO_5024 ) ) ( not ( = ?AUTO_5021 ?AUTO_5023 ) ) ( not ( = ?AUTO_5022 ?AUTO_5024 ) ) ( not ( = ?AUTO_5022 ?AUTO_5023 ) ) ( not ( = ?AUTO_5024 ?AUTO_5023 ) ) ( ON ?AUTO_5024 ?AUTO_5022 ) ( not ( = ?AUTO_5020 ?AUTO_5025 ) ) ( not ( = ?AUTO_5021 ?AUTO_5025 ) ) ( not ( = ?AUTO_5022 ?AUTO_5025 ) ) ( not ( = ?AUTO_5023 ?AUTO_5025 ) ) ( not ( = ?AUTO_5024 ?AUTO_5025 ) ) ( ON ?AUTO_5025 ?AUTO_5024 ) ( CLEAR ?AUTO_5025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5025 ?AUTO_5024 )
      ( MAKE-ON-TABLE ?AUTO_5020 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5020 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5026 - BLOCK
    )
    :vars
    (
      ?AUTO_5029 - BLOCK
      ?AUTO_5031 - BLOCK
      ?AUTO_5028 - BLOCK
      ?AUTO_5030 - BLOCK
      ?AUTO_5027 - BLOCK
      ?AUTO_5032 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5026 ?AUTO_5029 ) ( not ( = ?AUTO_5026 ?AUTO_5029 ) ) ( not ( = ?AUTO_5026 ?AUTO_5031 ) ) ( not ( = ?AUTO_5029 ?AUTO_5031 ) ) ( ON ?AUTO_5031 ?AUTO_5026 ) ( CLEAR ?AUTO_5028 ) ( not ( = ?AUTO_5026 ?AUTO_5030 ) ) ( not ( = ?AUTO_5026 ?AUTO_5028 ) ) ( not ( = ?AUTO_5029 ?AUTO_5030 ) ) ( not ( = ?AUTO_5029 ?AUTO_5028 ) ) ( not ( = ?AUTO_5031 ?AUTO_5030 ) ) ( not ( = ?AUTO_5031 ?AUTO_5028 ) ) ( not ( = ?AUTO_5030 ?AUTO_5028 ) ) ( ON ?AUTO_5030 ?AUTO_5031 ) ( not ( = ?AUTO_5026 ?AUTO_5027 ) ) ( not ( = ?AUTO_5029 ?AUTO_5027 ) ) ( not ( = ?AUTO_5031 ?AUTO_5027 ) ) ( not ( = ?AUTO_5028 ?AUTO_5027 ) ) ( not ( = ?AUTO_5030 ?AUTO_5027 ) ) ( ON ?AUTO_5027 ?AUTO_5030 ) ( CLEAR ?AUTO_5027 ) ( HOLDING ?AUTO_5032 ) ( not ( = ?AUTO_5026 ?AUTO_5032 ) ) ( not ( = ?AUTO_5029 ?AUTO_5032 ) ) ( not ( = ?AUTO_5031 ?AUTO_5032 ) ) ( not ( = ?AUTO_5028 ?AUTO_5032 ) ) ( not ( = ?AUTO_5030 ?AUTO_5032 ) ) ( not ( = ?AUTO_5027 ?AUTO_5032 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5032 )
      ( MAKE-ON-TABLE ?AUTO_5026 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5026 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5036 - BLOCK
      ?AUTO_5037 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5036 ) ( CLEAR ?AUTO_5037 ) ( not ( = ?AUTO_5036 ?AUTO_5037 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5036 ?AUTO_5037 )
      ( MAKE-ON-VERIFY ?AUTO_5036 ?AUTO_5037 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5038 - BLOCK
      ?AUTO_5039 - BLOCK
    )
    :vars
    (
      ?AUTO_5040 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5039 ) ( not ( = ?AUTO_5038 ?AUTO_5039 ) ) ( ON ?AUTO_5038 ?AUTO_5040 ) ( CLEAR ?AUTO_5038 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5038 ?AUTO_5040 ) ) ( not ( = ?AUTO_5039 ?AUTO_5040 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5038 ?AUTO_5040 )
      ( MAKE-ON ?AUTO_5038 ?AUTO_5039 )
      ( MAKE-ON-VERIFY ?AUTO_5038 ?AUTO_5039 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5041 - BLOCK
      ?AUTO_5042 - BLOCK
    )
    :vars
    (
      ?AUTO_5043 - BLOCK
      ?AUTO_5044 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5042 ) ( not ( = ?AUTO_5041 ?AUTO_5042 ) ) ( ON ?AUTO_5041 ?AUTO_5043 ) ( CLEAR ?AUTO_5041 ) ( not ( = ?AUTO_5041 ?AUTO_5043 ) ) ( not ( = ?AUTO_5042 ?AUTO_5043 ) ) ( HOLDING ?AUTO_5044 ) ( not ( = ?AUTO_5041 ?AUTO_5044 ) ) ( not ( = ?AUTO_5042 ?AUTO_5044 ) ) ( not ( = ?AUTO_5043 ?AUTO_5044 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5044 )
      ( MAKE-ON ?AUTO_5041 ?AUTO_5042 )
      ( MAKE-ON-VERIFY ?AUTO_5041 ?AUTO_5042 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5045 - BLOCK
      ?AUTO_5046 - BLOCK
    )
    :vars
    (
      ?AUTO_5047 - BLOCK
      ?AUTO_5048 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5045 ?AUTO_5046 ) ) ( ON ?AUTO_5045 ?AUTO_5047 ) ( CLEAR ?AUTO_5045 ) ( not ( = ?AUTO_5045 ?AUTO_5047 ) ) ( not ( = ?AUTO_5046 ?AUTO_5047 ) ) ( not ( = ?AUTO_5045 ?AUTO_5048 ) ) ( not ( = ?AUTO_5046 ?AUTO_5048 ) ) ( not ( = ?AUTO_5047 ?AUTO_5048 ) ) ( ON ?AUTO_5048 ?AUTO_5046 ) ( CLEAR ?AUTO_5048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5048 ?AUTO_5046 )
      ( MAKE-ON ?AUTO_5045 ?AUTO_5046 )
      ( MAKE-ON-VERIFY ?AUTO_5045 ?AUTO_5046 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5049 - BLOCK
      ?AUTO_5050 - BLOCK
    )
    :vars
    (
      ?AUTO_5051 - BLOCK
      ?AUTO_5052 - BLOCK
      ?AUTO_5053 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5049 ?AUTO_5050 ) ) ( ON ?AUTO_5049 ?AUTO_5051 ) ( CLEAR ?AUTO_5049 ) ( not ( = ?AUTO_5049 ?AUTO_5051 ) ) ( not ( = ?AUTO_5050 ?AUTO_5051 ) ) ( not ( = ?AUTO_5049 ?AUTO_5052 ) ) ( not ( = ?AUTO_5050 ?AUTO_5052 ) ) ( not ( = ?AUTO_5051 ?AUTO_5052 ) ) ( ON ?AUTO_5052 ?AUTO_5050 ) ( CLEAR ?AUTO_5052 ) ( HOLDING ?AUTO_5053 ) ( not ( = ?AUTO_5049 ?AUTO_5053 ) ) ( not ( = ?AUTO_5050 ?AUTO_5053 ) ) ( not ( = ?AUTO_5051 ?AUTO_5053 ) ) ( not ( = ?AUTO_5052 ?AUTO_5053 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5053 )
      ( MAKE-ON ?AUTO_5049 ?AUTO_5050 )
      ( MAKE-ON-VERIFY ?AUTO_5049 ?AUTO_5050 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5054 - BLOCK
      ?AUTO_5055 - BLOCK
    )
    :vars
    (
      ?AUTO_5056 - BLOCK
      ?AUTO_5057 - BLOCK
      ?AUTO_5058 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5054 ?AUTO_5055 ) ) ( ON ?AUTO_5054 ?AUTO_5056 ) ( CLEAR ?AUTO_5054 ) ( not ( = ?AUTO_5054 ?AUTO_5056 ) ) ( not ( = ?AUTO_5055 ?AUTO_5056 ) ) ( not ( = ?AUTO_5054 ?AUTO_5057 ) ) ( not ( = ?AUTO_5055 ?AUTO_5057 ) ) ( not ( = ?AUTO_5056 ?AUTO_5057 ) ) ( ON ?AUTO_5057 ?AUTO_5055 ) ( not ( = ?AUTO_5054 ?AUTO_5058 ) ) ( not ( = ?AUTO_5055 ?AUTO_5058 ) ) ( not ( = ?AUTO_5056 ?AUTO_5058 ) ) ( not ( = ?AUTO_5057 ?AUTO_5058 ) ) ( ON ?AUTO_5058 ?AUTO_5057 ) ( CLEAR ?AUTO_5058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5058 ?AUTO_5057 )
      ( MAKE-ON ?AUTO_5054 ?AUTO_5055 )
      ( MAKE-ON-VERIFY ?AUTO_5054 ?AUTO_5055 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5059 - BLOCK
      ?AUTO_5060 - BLOCK
    )
    :vars
    (
      ?AUTO_5062 - BLOCK
      ?AUTO_5061 - BLOCK
      ?AUTO_5063 - BLOCK
      ?AUTO_5064 - BLOCK
      ?AUTO_5065 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5059 ?AUTO_5060 ) ) ( ON ?AUTO_5059 ?AUTO_5062 ) ( CLEAR ?AUTO_5059 ) ( not ( = ?AUTO_5059 ?AUTO_5062 ) ) ( not ( = ?AUTO_5060 ?AUTO_5062 ) ) ( not ( = ?AUTO_5059 ?AUTO_5061 ) ) ( not ( = ?AUTO_5060 ?AUTO_5061 ) ) ( not ( = ?AUTO_5062 ?AUTO_5061 ) ) ( ON ?AUTO_5061 ?AUTO_5060 ) ( not ( = ?AUTO_5059 ?AUTO_5063 ) ) ( not ( = ?AUTO_5060 ?AUTO_5063 ) ) ( not ( = ?AUTO_5062 ?AUTO_5063 ) ) ( not ( = ?AUTO_5061 ?AUTO_5063 ) ) ( ON ?AUTO_5063 ?AUTO_5061 ) ( CLEAR ?AUTO_5063 ) ( HOLDING ?AUTO_5064 ) ( CLEAR ?AUTO_5065 ) ( not ( = ?AUTO_5059 ?AUTO_5064 ) ) ( not ( = ?AUTO_5059 ?AUTO_5065 ) ) ( not ( = ?AUTO_5060 ?AUTO_5064 ) ) ( not ( = ?AUTO_5060 ?AUTO_5065 ) ) ( not ( = ?AUTO_5062 ?AUTO_5064 ) ) ( not ( = ?AUTO_5062 ?AUTO_5065 ) ) ( not ( = ?AUTO_5061 ?AUTO_5064 ) ) ( not ( = ?AUTO_5061 ?AUTO_5065 ) ) ( not ( = ?AUTO_5063 ?AUTO_5064 ) ) ( not ( = ?AUTO_5063 ?AUTO_5065 ) ) ( not ( = ?AUTO_5064 ?AUTO_5065 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5064 ?AUTO_5065 )
      ( MAKE-ON ?AUTO_5059 ?AUTO_5060 )
      ( MAKE-ON-VERIFY ?AUTO_5059 ?AUTO_5060 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5070 - BLOCK
      ?AUTO_5071 - BLOCK
    )
    :vars
    (
      ?AUTO_5075 - BLOCK
      ?AUTO_5074 - BLOCK
      ?AUTO_5076 - BLOCK
      ?AUTO_5073 - BLOCK
      ?AUTO_5072 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5070 ?AUTO_5071 ) ) ( ON ?AUTO_5070 ?AUTO_5075 ) ( CLEAR ?AUTO_5070 ) ( not ( = ?AUTO_5070 ?AUTO_5075 ) ) ( not ( = ?AUTO_5071 ?AUTO_5075 ) ) ( not ( = ?AUTO_5070 ?AUTO_5074 ) ) ( not ( = ?AUTO_5071 ?AUTO_5074 ) ) ( not ( = ?AUTO_5075 ?AUTO_5074 ) ) ( ON ?AUTO_5074 ?AUTO_5071 ) ( not ( = ?AUTO_5070 ?AUTO_5076 ) ) ( not ( = ?AUTO_5071 ?AUTO_5076 ) ) ( not ( = ?AUTO_5075 ?AUTO_5076 ) ) ( not ( = ?AUTO_5074 ?AUTO_5076 ) ) ( ON ?AUTO_5076 ?AUTO_5074 ) ( CLEAR ?AUTO_5073 ) ( not ( = ?AUTO_5070 ?AUTO_5072 ) ) ( not ( = ?AUTO_5070 ?AUTO_5073 ) ) ( not ( = ?AUTO_5071 ?AUTO_5072 ) ) ( not ( = ?AUTO_5071 ?AUTO_5073 ) ) ( not ( = ?AUTO_5075 ?AUTO_5072 ) ) ( not ( = ?AUTO_5075 ?AUTO_5073 ) ) ( not ( = ?AUTO_5074 ?AUTO_5072 ) ) ( not ( = ?AUTO_5074 ?AUTO_5073 ) ) ( not ( = ?AUTO_5076 ?AUTO_5072 ) ) ( not ( = ?AUTO_5076 ?AUTO_5073 ) ) ( not ( = ?AUTO_5072 ?AUTO_5073 ) ) ( ON ?AUTO_5072 ?AUTO_5076 ) ( CLEAR ?AUTO_5072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5072 ?AUTO_5076 )
      ( MAKE-ON ?AUTO_5070 ?AUTO_5071 )
      ( MAKE-ON-VERIFY ?AUTO_5070 ?AUTO_5071 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5077 - BLOCK
      ?AUTO_5078 - BLOCK
    )
    :vars
    (
      ?AUTO_5082 - BLOCK
      ?AUTO_5081 - BLOCK
      ?AUTO_5079 - BLOCK
      ?AUTO_5080 - BLOCK
      ?AUTO_5083 - BLOCK
      ?AUTO_5084 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5077 ?AUTO_5078 ) ) ( ON ?AUTO_5077 ?AUTO_5082 ) ( CLEAR ?AUTO_5077 ) ( not ( = ?AUTO_5077 ?AUTO_5082 ) ) ( not ( = ?AUTO_5078 ?AUTO_5082 ) ) ( not ( = ?AUTO_5077 ?AUTO_5081 ) ) ( not ( = ?AUTO_5078 ?AUTO_5081 ) ) ( not ( = ?AUTO_5082 ?AUTO_5081 ) ) ( ON ?AUTO_5081 ?AUTO_5078 ) ( not ( = ?AUTO_5077 ?AUTO_5079 ) ) ( not ( = ?AUTO_5078 ?AUTO_5079 ) ) ( not ( = ?AUTO_5082 ?AUTO_5079 ) ) ( not ( = ?AUTO_5081 ?AUTO_5079 ) ) ( ON ?AUTO_5079 ?AUTO_5081 ) ( CLEAR ?AUTO_5080 ) ( not ( = ?AUTO_5077 ?AUTO_5083 ) ) ( not ( = ?AUTO_5077 ?AUTO_5080 ) ) ( not ( = ?AUTO_5078 ?AUTO_5083 ) ) ( not ( = ?AUTO_5078 ?AUTO_5080 ) ) ( not ( = ?AUTO_5082 ?AUTO_5083 ) ) ( not ( = ?AUTO_5082 ?AUTO_5080 ) ) ( not ( = ?AUTO_5081 ?AUTO_5083 ) ) ( not ( = ?AUTO_5081 ?AUTO_5080 ) ) ( not ( = ?AUTO_5079 ?AUTO_5083 ) ) ( not ( = ?AUTO_5079 ?AUTO_5080 ) ) ( not ( = ?AUTO_5083 ?AUTO_5080 ) ) ( ON ?AUTO_5083 ?AUTO_5079 ) ( CLEAR ?AUTO_5083 ) ( HOLDING ?AUTO_5084 ) ( not ( = ?AUTO_5077 ?AUTO_5084 ) ) ( not ( = ?AUTO_5078 ?AUTO_5084 ) ) ( not ( = ?AUTO_5082 ?AUTO_5084 ) ) ( not ( = ?AUTO_5081 ?AUTO_5084 ) ) ( not ( = ?AUTO_5079 ?AUTO_5084 ) ) ( not ( = ?AUTO_5080 ?AUTO_5084 ) ) ( not ( = ?AUTO_5083 ?AUTO_5084 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5084 )
      ( MAKE-ON ?AUTO_5077 ?AUTO_5078 )
      ( MAKE-ON-VERIFY ?AUTO_5077 ?AUTO_5078 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5085 - BLOCK
      ?AUTO_5086 - BLOCK
    )
    :vars
    (
      ?AUTO_5089 - BLOCK
      ?AUTO_5092 - BLOCK
      ?AUTO_5091 - BLOCK
      ?AUTO_5090 - BLOCK
      ?AUTO_5088 - BLOCK
      ?AUTO_5087 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5085 ?AUTO_5086 ) ) ( ON ?AUTO_5085 ?AUTO_5089 ) ( CLEAR ?AUTO_5085 ) ( not ( = ?AUTO_5085 ?AUTO_5089 ) ) ( not ( = ?AUTO_5086 ?AUTO_5089 ) ) ( not ( = ?AUTO_5085 ?AUTO_5092 ) ) ( not ( = ?AUTO_5086 ?AUTO_5092 ) ) ( not ( = ?AUTO_5089 ?AUTO_5092 ) ) ( ON ?AUTO_5092 ?AUTO_5086 ) ( not ( = ?AUTO_5085 ?AUTO_5091 ) ) ( not ( = ?AUTO_5086 ?AUTO_5091 ) ) ( not ( = ?AUTO_5089 ?AUTO_5091 ) ) ( not ( = ?AUTO_5092 ?AUTO_5091 ) ) ( ON ?AUTO_5091 ?AUTO_5092 ) ( CLEAR ?AUTO_5090 ) ( not ( = ?AUTO_5085 ?AUTO_5088 ) ) ( not ( = ?AUTO_5085 ?AUTO_5090 ) ) ( not ( = ?AUTO_5086 ?AUTO_5088 ) ) ( not ( = ?AUTO_5086 ?AUTO_5090 ) ) ( not ( = ?AUTO_5089 ?AUTO_5088 ) ) ( not ( = ?AUTO_5089 ?AUTO_5090 ) ) ( not ( = ?AUTO_5092 ?AUTO_5088 ) ) ( not ( = ?AUTO_5092 ?AUTO_5090 ) ) ( not ( = ?AUTO_5091 ?AUTO_5088 ) ) ( not ( = ?AUTO_5091 ?AUTO_5090 ) ) ( not ( = ?AUTO_5088 ?AUTO_5090 ) ) ( ON ?AUTO_5088 ?AUTO_5091 ) ( not ( = ?AUTO_5085 ?AUTO_5087 ) ) ( not ( = ?AUTO_5086 ?AUTO_5087 ) ) ( not ( = ?AUTO_5089 ?AUTO_5087 ) ) ( not ( = ?AUTO_5092 ?AUTO_5087 ) ) ( not ( = ?AUTO_5091 ?AUTO_5087 ) ) ( not ( = ?AUTO_5090 ?AUTO_5087 ) ) ( not ( = ?AUTO_5088 ?AUTO_5087 ) ) ( ON ?AUTO_5087 ?AUTO_5088 ) ( CLEAR ?AUTO_5087 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5087 ?AUTO_5088 )
      ( MAKE-ON ?AUTO_5085 ?AUTO_5086 )
      ( MAKE-ON-VERIFY ?AUTO_5085 ?AUTO_5086 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5093 - BLOCK
      ?AUTO_5094 - BLOCK
    )
    :vars
    (
      ?AUTO_5100 - BLOCK
      ?AUTO_5097 - BLOCK
      ?AUTO_5098 - BLOCK
      ?AUTO_5096 - BLOCK
      ?AUTO_5099 - BLOCK
      ?AUTO_5095 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5093 ?AUTO_5094 ) ) ( ON ?AUTO_5093 ?AUTO_5100 ) ( CLEAR ?AUTO_5093 ) ( not ( = ?AUTO_5093 ?AUTO_5100 ) ) ( not ( = ?AUTO_5094 ?AUTO_5100 ) ) ( not ( = ?AUTO_5093 ?AUTO_5097 ) ) ( not ( = ?AUTO_5094 ?AUTO_5097 ) ) ( not ( = ?AUTO_5100 ?AUTO_5097 ) ) ( ON ?AUTO_5097 ?AUTO_5094 ) ( not ( = ?AUTO_5093 ?AUTO_5098 ) ) ( not ( = ?AUTO_5094 ?AUTO_5098 ) ) ( not ( = ?AUTO_5100 ?AUTO_5098 ) ) ( not ( = ?AUTO_5097 ?AUTO_5098 ) ) ( ON ?AUTO_5098 ?AUTO_5097 ) ( not ( = ?AUTO_5093 ?AUTO_5096 ) ) ( not ( = ?AUTO_5093 ?AUTO_5099 ) ) ( not ( = ?AUTO_5094 ?AUTO_5096 ) ) ( not ( = ?AUTO_5094 ?AUTO_5099 ) ) ( not ( = ?AUTO_5100 ?AUTO_5096 ) ) ( not ( = ?AUTO_5100 ?AUTO_5099 ) ) ( not ( = ?AUTO_5097 ?AUTO_5096 ) ) ( not ( = ?AUTO_5097 ?AUTO_5099 ) ) ( not ( = ?AUTO_5098 ?AUTO_5096 ) ) ( not ( = ?AUTO_5098 ?AUTO_5099 ) ) ( not ( = ?AUTO_5096 ?AUTO_5099 ) ) ( ON ?AUTO_5096 ?AUTO_5098 ) ( not ( = ?AUTO_5093 ?AUTO_5095 ) ) ( not ( = ?AUTO_5094 ?AUTO_5095 ) ) ( not ( = ?AUTO_5100 ?AUTO_5095 ) ) ( not ( = ?AUTO_5097 ?AUTO_5095 ) ) ( not ( = ?AUTO_5098 ?AUTO_5095 ) ) ( not ( = ?AUTO_5099 ?AUTO_5095 ) ) ( not ( = ?AUTO_5096 ?AUTO_5095 ) ) ( ON ?AUTO_5095 ?AUTO_5096 ) ( CLEAR ?AUTO_5095 ) ( HOLDING ?AUTO_5099 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5099 )
      ( MAKE-ON ?AUTO_5093 ?AUTO_5094 )
      ( MAKE-ON-VERIFY ?AUTO_5093 ?AUTO_5094 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5101 - BLOCK
      ?AUTO_5102 - BLOCK
    )
    :vars
    (
      ?AUTO_5107 - BLOCK
      ?AUTO_5103 - BLOCK
      ?AUTO_5106 - BLOCK
      ?AUTO_5105 - BLOCK
      ?AUTO_5104 - BLOCK
      ?AUTO_5108 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5101 ?AUTO_5102 ) ) ( ON ?AUTO_5101 ?AUTO_5107 ) ( not ( = ?AUTO_5101 ?AUTO_5107 ) ) ( not ( = ?AUTO_5102 ?AUTO_5107 ) ) ( not ( = ?AUTO_5101 ?AUTO_5103 ) ) ( not ( = ?AUTO_5102 ?AUTO_5103 ) ) ( not ( = ?AUTO_5107 ?AUTO_5103 ) ) ( ON ?AUTO_5103 ?AUTO_5102 ) ( not ( = ?AUTO_5101 ?AUTO_5106 ) ) ( not ( = ?AUTO_5102 ?AUTO_5106 ) ) ( not ( = ?AUTO_5107 ?AUTO_5106 ) ) ( not ( = ?AUTO_5103 ?AUTO_5106 ) ) ( ON ?AUTO_5106 ?AUTO_5103 ) ( not ( = ?AUTO_5101 ?AUTO_5105 ) ) ( not ( = ?AUTO_5101 ?AUTO_5104 ) ) ( not ( = ?AUTO_5102 ?AUTO_5105 ) ) ( not ( = ?AUTO_5102 ?AUTO_5104 ) ) ( not ( = ?AUTO_5107 ?AUTO_5105 ) ) ( not ( = ?AUTO_5107 ?AUTO_5104 ) ) ( not ( = ?AUTO_5103 ?AUTO_5105 ) ) ( not ( = ?AUTO_5103 ?AUTO_5104 ) ) ( not ( = ?AUTO_5106 ?AUTO_5105 ) ) ( not ( = ?AUTO_5106 ?AUTO_5104 ) ) ( not ( = ?AUTO_5105 ?AUTO_5104 ) ) ( ON ?AUTO_5105 ?AUTO_5106 ) ( not ( = ?AUTO_5101 ?AUTO_5108 ) ) ( not ( = ?AUTO_5102 ?AUTO_5108 ) ) ( not ( = ?AUTO_5107 ?AUTO_5108 ) ) ( not ( = ?AUTO_5103 ?AUTO_5108 ) ) ( not ( = ?AUTO_5106 ?AUTO_5108 ) ) ( not ( = ?AUTO_5104 ?AUTO_5108 ) ) ( not ( = ?AUTO_5105 ?AUTO_5108 ) ) ( ON ?AUTO_5108 ?AUTO_5105 ) ( CLEAR ?AUTO_5108 ) ( ON ?AUTO_5104 ?AUTO_5101 ) ( CLEAR ?AUTO_5104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5104 ?AUTO_5101 )
      ( MAKE-ON ?AUTO_5101 ?AUTO_5102 )
      ( MAKE-ON-VERIFY ?AUTO_5101 ?AUTO_5102 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5111 - BLOCK
      ?AUTO_5112 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5111 ) ( CLEAR ?AUTO_5112 ) ( not ( = ?AUTO_5111 ?AUTO_5112 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5111 ?AUTO_5112 )
      ( MAKE-ON-VERIFY ?AUTO_5111 ?AUTO_5112 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5113 - BLOCK
      ?AUTO_5114 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5114 ) ( not ( = ?AUTO_5113 ?AUTO_5114 ) ) ( ON-TABLE ?AUTO_5113 ) ( CLEAR ?AUTO_5113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5113 )
      ( MAKE-ON ?AUTO_5113 ?AUTO_5114 )
      ( MAKE-ON-VERIFY ?AUTO_5113 ?AUTO_5114 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5115 - BLOCK
      ?AUTO_5116 - BLOCK
    )
    :vars
    (
      ?AUTO_5117 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5115 ?AUTO_5116 ) ) ( ON-TABLE ?AUTO_5115 ) ( CLEAR ?AUTO_5115 ) ( HOLDING ?AUTO_5116 ) ( CLEAR ?AUTO_5117 ) ( not ( = ?AUTO_5115 ?AUTO_5117 ) ) ( not ( = ?AUTO_5116 ?AUTO_5117 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5116 ?AUTO_5117 )
      ( MAKE-ON ?AUTO_5115 ?AUTO_5116 )
      ( MAKE-ON-VERIFY ?AUTO_5115 ?AUTO_5116 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5126 - BLOCK
      ?AUTO_5127 - BLOCK
    )
    :vars
    (
      ?AUTO_5129 - BLOCK
      ?AUTO_5128 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5127 ) ( not ( = ?AUTO_5126 ?AUTO_5127 ) ) ( ON ?AUTO_5126 ?AUTO_5129 ) ( not ( = ?AUTO_5126 ?AUTO_5129 ) ) ( not ( = ?AUTO_5127 ?AUTO_5129 ) ) ( not ( = ?AUTO_5126 ?AUTO_5128 ) ) ( not ( = ?AUTO_5127 ?AUTO_5128 ) ) ( not ( = ?AUTO_5129 ?AUTO_5128 ) ) ( ON ?AUTO_5128 ?AUTO_5126 ) ( CLEAR ?AUTO_5128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5128 ?AUTO_5126 )
      ( MAKE-ON ?AUTO_5126 ?AUTO_5127 )
      ( MAKE-ON-VERIFY ?AUTO_5126 ?AUTO_5127 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5130 - BLOCK
      ?AUTO_5131 - BLOCK
    )
    :vars
    (
      ?AUTO_5132 - BLOCK
      ?AUTO_5133 - BLOCK
      ?AUTO_5134 - BLOCK
      ?AUTO_5135 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5131 ) ( not ( = ?AUTO_5130 ?AUTO_5131 ) ) ( ON ?AUTO_5130 ?AUTO_5132 ) ( not ( = ?AUTO_5130 ?AUTO_5132 ) ) ( not ( = ?AUTO_5131 ?AUTO_5132 ) ) ( not ( = ?AUTO_5130 ?AUTO_5133 ) ) ( not ( = ?AUTO_5131 ?AUTO_5133 ) ) ( not ( = ?AUTO_5132 ?AUTO_5133 ) ) ( ON ?AUTO_5133 ?AUTO_5130 ) ( CLEAR ?AUTO_5133 ) ( HOLDING ?AUTO_5134 ) ( CLEAR ?AUTO_5135 ) ( not ( = ?AUTO_5130 ?AUTO_5134 ) ) ( not ( = ?AUTO_5130 ?AUTO_5135 ) ) ( not ( = ?AUTO_5131 ?AUTO_5134 ) ) ( not ( = ?AUTO_5131 ?AUTO_5135 ) ) ( not ( = ?AUTO_5132 ?AUTO_5134 ) ) ( not ( = ?AUTO_5132 ?AUTO_5135 ) ) ( not ( = ?AUTO_5133 ?AUTO_5134 ) ) ( not ( = ?AUTO_5133 ?AUTO_5135 ) ) ( not ( = ?AUTO_5134 ?AUTO_5135 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5134 ?AUTO_5135 )
      ( MAKE-ON ?AUTO_5130 ?AUTO_5131 )
      ( MAKE-ON-VERIFY ?AUTO_5130 ?AUTO_5131 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5140 - BLOCK
      ?AUTO_5141 - BLOCK
    )
    :vars
    (
      ?AUTO_5142 - BLOCK
      ?AUTO_5145 - BLOCK
      ?AUTO_5143 - BLOCK
      ?AUTO_5144 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5141 ) ( not ( = ?AUTO_5140 ?AUTO_5141 ) ) ( ON ?AUTO_5140 ?AUTO_5142 ) ( not ( = ?AUTO_5140 ?AUTO_5142 ) ) ( not ( = ?AUTO_5141 ?AUTO_5142 ) ) ( not ( = ?AUTO_5140 ?AUTO_5145 ) ) ( not ( = ?AUTO_5141 ?AUTO_5145 ) ) ( not ( = ?AUTO_5142 ?AUTO_5145 ) ) ( ON ?AUTO_5145 ?AUTO_5140 ) ( CLEAR ?AUTO_5143 ) ( not ( = ?AUTO_5140 ?AUTO_5144 ) ) ( not ( = ?AUTO_5140 ?AUTO_5143 ) ) ( not ( = ?AUTO_5141 ?AUTO_5144 ) ) ( not ( = ?AUTO_5141 ?AUTO_5143 ) ) ( not ( = ?AUTO_5142 ?AUTO_5144 ) ) ( not ( = ?AUTO_5142 ?AUTO_5143 ) ) ( not ( = ?AUTO_5145 ?AUTO_5144 ) ) ( not ( = ?AUTO_5145 ?AUTO_5143 ) ) ( not ( = ?AUTO_5144 ?AUTO_5143 ) ) ( ON ?AUTO_5144 ?AUTO_5145 ) ( CLEAR ?AUTO_5144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5144 ?AUTO_5145 )
      ( MAKE-ON ?AUTO_5140 ?AUTO_5141 )
      ( MAKE-ON-VERIFY ?AUTO_5140 ?AUTO_5141 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5146 - BLOCK
      ?AUTO_5147 - BLOCK
    )
    :vars
    (
      ?AUTO_5151 - BLOCK
      ?AUTO_5149 - BLOCK
      ?AUTO_5148 - BLOCK
      ?AUTO_5150 - BLOCK
      ?AUTO_5152 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5147 ) ( not ( = ?AUTO_5146 ?AUTO_5147 ) ) ( ON ?AUTO_5146 ?AUTO_5151 ) ( not ( = ?AUTO_5146 ?AUTO_5151 ) ) ( not ( = ?AUTO_5147 ?AUTO_5151 ) ) ( not ( = ?AUTO_5146 ?AUTO_5149 ) ) ( not ( = ?AUTO_5147 ?AUTO_5149 ) ) ( not ( = ?AUTO_5151 ?AUTO_5149 ) ) ( ON ?AUTO_5149 ?AUTO_5146 ) ( CLEAR ?AUTO_5148 ) ( not ( = ?AUTO_5146 ?AUTO_5150 ) ) ( not ( = ?AUTO_5146 ?AUTO_5148 ) ) ( not ( = ?AUTO_5147 ?AUTO_5150 ) ) ( not ( = ?AUTO_5147 ?AUTO_5148 ) ) ( not ( = ?AUTO_5151 ?AUTO_5150 ) ) ( not ( = ?AUTO_5151 ?AUTO_5148 ) ) ( not ( = ?AUTO_5149 ?AUTO_5150 ) ) ( not ( = ?AUTO_5149 ?AUTO_5148 ) ) ( not ( = ?AUTO_5150 ?AUTO_5148 ) ) ( ON ?AUTO_5150 ?AUTO_5149 ) ( CLEAR ?AUTO_5150 ) ( HOLDING ?AUTO_5152 ) ( not ( = ?AUTO_5146 ?AUTO_5152 ) ) ( not ( = ?AUTO_5147 ?AUTO_5152 ) ) ( not ( = ?AUTO_5151 ?AUTO_5152 ) ) ( not ( = ?AUTO_5149 ?AUTO_5152 ) ) ( not ( = ?AUTO_5148 ?AUTO_5152 ) ) ( not ( = ?AUTO_5150 ?AUTO_5152 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5152 )
      ( MAKE-ON ?AUTO_5146 ?AUTO_5147 )
      ( MAKE-ON-VERIFY ?AUTO_5146 ?AUTO_5147 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5153 - BLOCK
      ?AUTO_5154 - BLOCK
    )
    :vars
    (
      ?AUTO_5157 - BLOCK
      ?AUTO_5158 - BLOCK
      ?AUTO_5155 - BLOCK
      ?AUTO_5156 - BLOCK
      ?AUTO_5159 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5154 ) ( not ( = ?AUTO_5153 ?AUTO_5154 ) ) ( ON ?AUTO_5153 ?AUTO_5157 ) ( not ( = ?AUTO_5153 ?AUTO_5157 ) ) ( not ( = ?AUTO_5154 ?AUTO_5157 ) ) ( not ( = ?AUTO_5153 ?AUTO_5158 ) ) ( not ( = ?AUTO_5154 ?AUTO_5158 ) ) ( not ( = ?AUTO_5157 ?AUTO_5158 ) ) ( ON ?AUTO_5158 ?AUTO_5153 ) ( CLEAR ?AUTO_5155 ) ( not ( = ?AUTO_5153 ?AUTO_5156 ) ) ( not ( = ?AUTO_5153 ?AUTO_5155 ) ) ( not ( = ?AUTO_5154 ?AUTO_5156 ) ) ( not ( = ?AUTO_5154 ?AUTO_5155 ) ) ( not ( = ?AUTO_5157 ?AUTO_5156 ) ) ( not ( = ?AUTO_5157 ?AUTO_5155 ) ) ( not ( = ?AUTO_5158 ?AUTO_5156 ) ) ( not ( = ?AUTO_5158 ?AUTO_5155 ) ) ( not ( = ?AUTO_5156 ?AUTO_5155 ) ) ( ON ?AUTO_5156 ?AUTO_5158 ) ( not ( = ?AUTO_5153 ?AUTO_5159 ) ) ( not ( = ?AUTO_5154 ?AUTO_5159 ) ) ( not ( = ?AUTO_5157 ?AUTO_5159 ) ) ( not ( = ?AUTO_5158 ?AUTO_5159 ) ) ( not ( = ?AUTO_5155 ?AUTO_5159 ) ) ( not ( = ?AUTO_5156 ?AUTO_5159 ) ) ( ON ?AUTO_5159 ?AUTO_5156 ) ( CLEAR ?AUTO_5159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5159 ?AUTO_5156 )
      ( MAKE-ON ?AUTO_5153 ?AUTO_5154 )
      ( MAKE-ON-VERIFY ?AUTO_5153 ?AUTO_5154 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5160 - BLOCK
      ?AUTO_5161 - BLOCK
    )
    :vars
    (
      ?AUTO_5164 - BLOCK
      ?AUTO_5163 - BLOCK
      ?AUTO_5166 - BLOCK
      ?AUTO_5165 - BLOCK
      ?AUTO_5162 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5161 ) ( not ( = ?AUTO_5160 ?AUTO_5161 ) ) ( ON ?AUTO_5160 ?AUTO_5164 ) ( not ( = ?AUTO_5160 ?AUTO_5164 ) ) ( not ( = ?AUTO_5161 ?AUTO_5164 ) ) ( not ( = ?AUTO_5160 ?AUTO_5163 ) ) ( not ( = ?AUTO_5161 ?AUTO_5163 ) ) ( not ( = ?AUTO_5164 ?AUTO_5163 ) ) ( ON ?AUTO_5163 ?AUTO_5160 ) ( not ( = ?AUTO_5160 ?AUTO_5166 ) ) ( not ( = ?AUTO_5160 ?AUTO_5165 ) ) ( not ( = ?AUTO_5161 ?AUTO_5166 ) ) ( not ( = ?AUTO_5161 ?AUTO_5165 ) ) ( not ( = ?AUTO_5164 ?AUTO_5166 ) ) ( not ( = ?AUTO_5164 ?AUTO_5165 ) ) ( not ( = ?AUTO_5163 ?AUTO_5166 ) ) ( not ( = ?AUTO_5163 ?AUTO_5165 ) ) ( not ( = ?AUTO_5166 ?AUTO_5165 ) ) ( ON ?AUTO_5166 ?AUTO_5163 ) ( not ( = ?AUTO_5160 ?AUTO_5162 ) ) ( not ( = ?AUTO_5161 ?AUTO_5162 ) ) ( not ( = ?AUTO_5164 ?AUTO_5162 ) ) ( not ( = ?AUTO_5163 ?AUTO_5162 ) ) ( not ( = ?AUTO_5165 ?AUTO_5162 ) ) ( not ( = ?AUTO_5166 ?AUTO_5162 ) ) ( ON ?AUTO_5162 ?AUTO_5166 ) ( CLEAR ?AUTO_5162 ) ( HOLDING ?AUTO_5165 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5165 )
      ( MAKE-ON ?AUTO_5160 ?AUTO_5161 )
      ( MAKE-ON-VERIFY ?AUTO_5160 ?AUTO_5161 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5167 - BLOCK
      ?AUTO_5168 - BLOCK
    )
    :vars
    (
      ?AUTO_5173 - BLOCK
      ?AUTO_5171 - BLOCK
      ?AUTO_5170 - BLOCK
      ?AUTO_5172 - BLOCK
      ?AUTO_5169 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5167 ?AUTO_5168 ) ) ( ON ?AUTO_5167 ?AUTO_5173 ) ( not ( = ?AUTO_5167 ?AUTO_5173 ) ) ( not ( = ?AUTO_5168 ?AUTO_5173 ) ) ( not ( = ?AUTO_5167 ?AUTO_5171 ) ) ( not ( = ?AUTO_5168 ?AUTO_5171 ) ) ( not ( = ?AUTO_5173 ?AUTO_5171 ) ) ( ON ?AUTO_5171 ?AUTO_5167 ) ( not ( = ?AUTO_5167 ?AUTO_5170 ) ) ( not ( = ?AUTO_5167 ?AUTO_5172 ) ) ( not ( = ?AUTO_5168 ?AUTO_5170 ) ) ( not ( = ?AUTO_5168 ?AUTO_5172 ) ) ( not ( = ?AUTO_5173 ?AUTO_5170 ) ) ( not ( = ?AUTO_5173 ?AUTO_5172 ) ) ( not ( = ?AUTO_5171 ?AUTO_5170 ) ) ( not ( = ?AUTO_5171 ?AUTO_5172 ) ) ( not ( = ?AUTO_5170 ?AUTO_5172 ) ) ( ON ?AUTO_5170 ?AUTO_5171 ) ( not ( = ?AUTO_5167 ?AUTO_5169 ) ) ( not ( = ?AUTO_5168 ?AUTO_5169 ) ) ( not ( = ?AUTO_5173 ?AUTO_5169 ) ) ( not ( = ?AUTO_5171 ?AUTO_5169 ) ) ( not ( = ?AUTO_5172 ?AUTO_5169 ) ) ( not ( = ?AUTO_5170 ?AUTO_5169 ) ) ( ON ?AUTO_5169 ?AUTO_5170 ) ( CLEAR ?AUTO_5169 ) ( ON ?AUTO_5172 ?AUTO_5168 ) ( CLEAR ?AUTO_5172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5172 ?AUTO_5168 )
      ( MAKE-ON ?AUTO_5167 ?AUTO_5168 )
      ( MAKE-ON-VERIFY ?AUTO_5167 ?AUTO_5168 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5176 - BLOCK
      ?AUTO_5177 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5176 ) ( CLEAR ?AUTO_5177 ) ( not ( = ?AUTO_5176 ?AUTO_5177 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5176 ?AUTO_5177 )
      ( MAKE-ON-VERIFY ?AUTO_5176 ?AUTO_5177 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5178 - BLOCK
      ?AUTO_5179 - BLOCK
    )
    :vars
    (
      ?AUTO_5180 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5179 ) ( not ( = ?AUTO_5178 ?AUTO_5179 ) ) ( ON ?AUTO_5178 ?AUTO_5180 ) ( CLEAR ?AUTO_5178 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5178 ?AUTO_5180 ) ) ( not ( = ?AUTO_5179 ?AUTO_5180 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5178 ?AUTO_5180 )
      ( MAKE-ON ?AUTO_5178 ?AUTO_5179 )
      ( MAKE-ON-VERIFY ?AUTO_5178 ?AUTO_5179 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5181 - BLOCK
      ?AUTO_5182 - BLOCK
    )
    :vars
    (
      ?AUTO_5183 - BLOCK
      ?AUTO_5184 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5181 ?AUTO_5182 ) ) ( ON ?AUTO_5181 ?AUTO_5183 ) ( CLEAR ?AUTO_5181 ) ( not ( = ?AUTO_5181 ?AUTO_5183 ) ) ( not ( = ?AUTO_5182 ?AUTO_5183 ) ) ( HOLDING ?AUTO_5182 ) ( CLEAR ?AUTO_5184 ) ( not ( = ?AUTO_5181 ?AUTO_5184 ) ) ( not ( = ?AUTO_5182 ?AUTO_5184 ) ) ( not ( = ?AUTO_5183 ?AUTO_5184 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5182 ?AUTO_5184 )
      ( MAKE-ON ?AUTO_5181 ?AUTO_5182 )
      ( MAKE-ON-VERIFY ?AUTO_5181 ?AUTO_5182 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5187 - BLOCK
      ?AUTO_5188 - BLOCK
    )
    :vars
    (
      ?AUTO_5189 - BLOCK
      ?AUTO_5190 - BLOCK
      ?AUTO_5191 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5188 ) ( not ( = ?AUTO_5187 ?AUTO_5188 ) ) ( ON ?AUTO_5187 ?AUTO_5189 ) ( CLEAR ?AUTO_5187 ) ( not ( = ?AUTO_5187 ?AUTO_5189 ) ) ( not ( = ?AUTO_5188 ?AUTO_5189 ) ) ( HOLDING ?AUTO_5190 ) ( CLEAR ?AUTO_5191 ) ( not ( = ?AUTO_5187 ?AUTO_5190 ) ) ( not ( = ?AUTO_5187 ?AUTO_5191 ) ) ( not ( = ?AUTO_5188 ?AUTO_5190 ) ) ( not ( = ?AUTO_5188 ?AUTO_5191 ) ) ( not ( = ?AUTO_5189 ?AUTO_5190 ) ) ( not ( = ?AUTO_5189 ?AUTO_5191 ) ) ( not ( = ?AUTO_5190 ?AUTO_5191 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5190 ?AUTO_5191 )
      ( MAKE-ON ?AUTO_5187 ?AUTO_5188 )
      ( MAKE-ON-VERIFY ?AUTO_5187 ?AUTO_5188 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5192 - BLOCK
      ?AUTO_5193 - BLOCK
    )
    :vars
    (
      ?AUTO_5194 - BLOCK
      ?AUTO_5195 - BLOCK
      ?AUTO_5196 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5193 ) ( not ( = ?AUTO_5192 ?AUTO_5193 ) ) ( ON ?AUTO_5192 ?AUTO_5194 ) ( not ( = ?AUTO_5192 ?AUTO_5194 ) ) ( not ( = ?AUTO_5193 ?AUTO_5194 ) ) ( CLEAR ?AUTO_5195 ) ( not ( = ?AUTO_5192 ?AUTO_5196 ) ) ( not ( = ?AUTO_5192 ?AUTO_5195 ) ) ( not ( = ?AUTO_5193 ?AUTO_5196 ) ) ( not ( = ?AUTO_5193 ?AUTO_5195 ) ) ( not ( = ?AUTO_5194 ?AUTO_5196 ) ) ( not ( = ?AUTO_5194 ?AUTO_5195 ) ) ( not ( = ?AUTO_5196 ?AUTO_5195 ) ) ( ON ?AUTO_5196 ?AUTO_5192 ) ( CLEAR ?AUTO_5196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5196 ?AUTO_5192 )
      ( MAKE-ON ?AUTO_5192 ?AUTO_5193 )
      ( MAKE-ON-VERIFY ?AUTO_5192 ?AUTO_5193 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5197 - BLOCK
      ?AUTO_5198 - BLOCK
    )
    :vars
    (
      ?AUTO_5199 - BLOCK
      ?AUTO_5200 - BLOCK
      ?AUTO_5201 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5197 ?AUTO_5198 ) ) ( ON ?AUTO_5197 ?AUTO_5199 ) ( not ( = ?AUTO_5197 ?AUTO_5199 ) ) ( not ( = ?AUTO_5198 ?AUTO_5199 ) ) ( CLEAR ?AUTO_5200 ) ( not ( = ?AUTO_5197 ?AUTO_5201 ) ) ( not ( = ?AUTO_5197 ?AUTO_5200 ) ) ( not ( = ?AUTO_5198 ?AUTO_5201 ) ) ( not ( = ?AUTO_5198 ?AUTO_5200 ) ) ( not ( = ?AUTO_5199 ?AUTO_5201 ) ) ( not ( = ?AUTO_5199 ?AUTO_5200 ) ) ( not ( = ?AUTO_5201 ?AUTO_5200 ) ) ( ON ?AUTO_5201 ?AUTO_5197 ) ( CLEAR ?AUTO_5201 ) ( HOLDING ?AUTO_5198 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5198 )
      ( MAKE-ON ?AUTO_5197 ?AUTO_5198 )
      ( MAKE-ON-VERIFY ?AUTO_5197 ?AUTO_5198 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5204 - BLOCK
      ?AUTO_5205 - BLOCK
    )
    :vars
    (
      ?AUTO_5206 - BLOCK
      ?AUTO_5208 - BLOCK
      ?AUTO_5207 - BLOCK
      ?AUTO_5209 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5205 ) ( not ( = ?AUTO_5204 ?AUTO_5205 ) ) ( ON ?AUTO_5204 ?AUTO_5206 ) ( not ( = ?AUTO_5204 ?AUTO_5206 ) ) ( not ( = ?AUTO_5205 ?AUTO_5206 ) ) ( CLEAR ?AUTO_5208 ) ( not ( = ?AUTO_5204 ?AUTO_5207 ) ) ( not ( = ?AUTO_5204 ?AUTO_5208 ) ) ( not ( = ?AUTO_5205 ?AUTO_5207 ) ) ( not ( = ?AUTO_5205 ?AUTO_5208 ) ) ( not ( = ?AUTO_5206 ?AUTO_5207 ) ) ( not ( = ?AUTO_5206 ?AUTO_5208 ) ) ( not ( = ?AUTO_5207 ?AUTO_5208 ) ) ( ON ?AUTO_5207 ?AUTO_5204 ) ( CLEAR ?AUTO_5207 ) ( HOLDING ?AUTO_5209 ) ( not ( = ?AUTO_5204 ?AUTO_5209 ) ) ( not ( = ?AUTO_5205 ?AUTO_5209 ) ) ( not ( = ?AUTO_5206 ?AUTO_5209 ) ) ( not ( = ?AUTO_5208 ?AUTO_5209 ) ) ( not ( = ?AUTO_5207 ?AUTO_5209 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5209 )
      ( MAKE-ON ?AUTO_5204 ?AUTO_5205 )
      ( MAKE-ON-VERIFY ?AUTO_5204 ?AUTO_5205 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5210 - BLOCK
      ?AUTO_5211 - BLOCK
    )
    :vars
    (
      ?AUTO_5213 - BLOCK
      ?AUTO_5214 - BLOCK
      ?AUTO_5212 - BLOCK
      ?AUTO_5215 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5210 ?AUTO_5211 ) ) ( ON ?AUTO_5210 ?AUTO_5213 ) ( not ( = ?AUTO_5210 ?AUTO_5213 ) ) ( not ( = ?AUTO_5211 ?AUTO_5213 ) ) ( CLEAR ?AUTO_5214 ) ( not ( = ?AUTO_5210 ?AUTO_5212 ) ) ( not ( = ?AUTO_5210 ?AUTO_5214 ) ) ( not ( = ?AUTO_5211 ?AUTO_5212 ) ) ( not ( = ?AUTO_5211 ?AUTO_5214 ) ) ( not ( = ?AUTO_5213 ?AUTO_5212 ) ) ( not ( = ?AUTO_5213 ?AUTO_5214 ) ) ( not ( = ?AUTO_5212 ?AUTO_5214 ) ) ( ON ?AUTO_5212 ?AUTO_5210 ) ( CLEAR ?AUTO_5212 ) ( not ( = ?AUTO_5210 ?AUTO_5215 ) ) ( not ( = ?AUTO_5211 ?AUTO_5215 ) ) ( not ( = ?AUTO_5213 ?AUTO_5215 ) ) ( not ( = ?AUTO_5214 ?AUTO_5215 ) ) ( not ( = ?AUTO_5212 ?AUTO_5215 ) ) ( ON ?AUTO_5215 ?AUTO_5211 ) ( CLEAR ?AUTO_5215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5215 ?AUTO_5211 )
      ( MAKE-ON ?AUTO_5210 ?AUTO_5211 )
      ( MAKE-ON-VERIFY ?AUTO_5210 ?AUTO_5211 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5216 - BLOCK
      ?AUTO_5217 - BLOCK
    )
    :vars
    (
      ?AUTO_5218 - BLOCK
      ?AUTO_5219 - BLOCK
      ?AUTO_5221 - BLOCK
      ?AUTO_5220 - BLOCK
      ?AUTO_5222 - BLOCK
      ?AUTO_5223 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5216 ?AUTO_5217 ) ) ( ON ?AUTO_5216 ?AUTO_5218 ) ( not ( = ?AUTO_5216 ?AUTO_5218 ) ) ( not ( = ?AUTO_5217 ?AUTO_5218 ) ) ( CLEAR ?AUTO_5219 ) ( not ( = ?AUTO_5216 ?AUTO_5221 ) ) ( not ( = ?AUTO_5216 ?AUTO_5219 ) ) ( not ( = ?AUTO_5217 ?AUTO_5221 ) ) ( not ( = ?AUTO_5217 ?AUTO_5219 ) ) ( not ( = ?AUTO_5218 ?AUTO_5221 ) ) ( not ( = ?AUTO_5218 ?AUTO_5219 ) ) ( not ( = ?AUTO_5221 ?AUTO_5219 ) ) ( ON ?AUTO_5221 ?AUTO_5216 ) ( CLEAR ?AUTO_5221 ) ( not ( = ?AUTO_5216 ?AUTO_5220 ) ) ( not ( = ?AUTO_5217 ?AUTO_5220 ) ) ( not ( = ?AUTO_5218 ?AUTO_5220 ) ) ( not ( = ?AUTO_5219 ?AUTO_5220 ) ) ( not ( = ?AUTO_5221 ?AUTO_5220 ) ) ( ON ?AUTO_5220 ?AUTO_5217 ) ( CLEAR ?AUTO_5220 ) ( HOLDING ?AUTO_5222 ) ( CLEAR ?AUTO_5223 ) ( not ( = ?AUTO_5216 ?AUTO_5222 ) ) ( not ( = ?AUTO_5216 ?AUTO_5223 ) ) ( not ( = ?AUTO_5217 ?AUTO_5222 ) ) ( not ( = ?AUTO_5217 ?AUTO_5223 ) ) ( not ( = ?AUTO_5218 ?AUTO_5222 ) ) ( not ( = ?AUTO_5218 ?AUTO_5223 ) ) ( not ( = ?AUTO_5219 ?AUTO_5222 ) ) ( not ( = ?AUTO_5219 ?AUTO_5223 ) ) ( not ( = ?AUTO_5221 ?AUTO_5222 ) ) ( not ( = ?AUTO_5221 ?AUTO_5223 ) ) ( not ( = ?AUTO_5220 ?AUTO_5222 ) ) ( not ( = ?AUTO_5220 ?AUTO_5223 ) ) ( not ( = ?AUTO_5222 ?AUTO_5223 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5222 ?AUTO_5223 )
      ( MAKE-ON ?AUTO_5216 ?AUTO_5217 )
      ( MAKE-ON-VERIFY ?AUTO_5216 ?AUTO_5217 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5228 - BLOCK
      ?AUTO_5229 - BLOCK
    )
    :vars
    (
      ?AUTO_5230 - BLOCK
      ?AUTO_5232 - BLOCK
      ?AUTO_5233 - BLOCK
      ?AUTO_5231 - BLOCK
      ?AUTO_5235 - BLOCK
      ?AUTO_5234 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5228 ?AUTO_5229 ) ) ( ON ?AUTO_5228 ?AUTO_5230 ) ( not ( = ?AUTO_5228 ?AUTO_5230 ) ) ( not ( = ?AUTO_5229 ?AUTO_5230 ) ) ( CLEAR ?AUTO_5232 ) ( not ( = ?AUTO_5228 ?AUTO_5233 ) ) ( not ( = ?AUTO_5228 ?AUTO_5232 ) ) ( not ( = ?AUTO_5229 ?AUTO_5233 ) ) ( not ( = ?AUTO_5229 ?AUTO_5232 ) ) ( not ( = ?AUTO_5230 ?AUTO_5233 ) ) ( not ( = ?AUTO_5230 ?AUTO_5232 ) ) ( not ( = ?AUTO_5233 ?AUTO_5232 ) ) ( ON ?AUTO_5233 ?AUTO_5228 ) ( CLEAR ?AUTO_5233 ) ( not ( = ?AUTO_5228 ?AUTO_5231 ) ) ( not ( = ?AUTO_5229 ?AUTO_5231 ) ) ( not ( = ?AUTO_5230 ?AUTO_5231 ) ) ( not ( = ?AUTO_5232 ?AUTO_5231 ) ) ( not ( = ?AUTO_5233 ?AUTO_5231 ) ) ( ON ?AUTO_5231 ?AUTO_5229 ) ( CLEAR ?AUTO_5235 ) ( not ( = ?AUTO_5228 ?AUTO_5234 ) ) ( not ( = ?AUTO_5228 ?AUTO_5235 ) ) ( not ( = ?AUTO_5229 ?AUTO_5234 ) ) ( not ( = ?AUTO_5229 ?AUTO_5235 ) ) ( not ( = ?AUTO_5230 ?AUTO_5234 ) ) ( not ( = ?AUTO_5230 ?AUTO_5235 ) ) ( not ( = ?AUTO_5232 ?AUTO_5234 ) ) ( not ( = ?AUTO_5232 ?AUTO_5235 ) ) ( not ( = ?AUTO_5233 ?AUTO_5234 ) ) ( not ( = ?AUTO_5233 ?AUTO_5235 ) ) ( not ( = ?AUTO_5231 ?AUTO_5234 ) ) ( not ( = ?AUTO_5231 ?AUTO_5235 ) ) ( not ( = ?AUTO_5234 ?AUTO_5235 ) ) ( ON ?AUTO_5234 ?AUTO_5231 ) ( CLEAR ?AUTO_5234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5234 ?AUTO_5231 )
      ( MAKE-ON ?AUTO_5228 ?AUTO_5229 )
      ( MAKE-ON-VERIFY ?AUTO_5228 ?AUTO_5229 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5236 - BLOCK
      ?AUTO_5237 - BLOCK
    )
    :vars
    (
      ?AUTO_5238 - BLOCK
      ?AUTO_5243 - BLOCK
      ?AUTO_5241 - BLOCK
      ?AUTO_5239 - BLOCK
      ?AUTO_5240 - BLOCK
      ?AUTO_5242 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5236 ?AUTO_5237 ) ) ( ON ?AUTO_5236 ?AUTO_5238 ) ( not ( = ?AUTO_5236 ?AUTO_5238 ) ) ( not ( = ?AUTO_5237 ?AUTO_5238 ) ) ( CLEAR ?AUTO_5243 ) ( not ( = ?AUTO_5236 ?AUTO_5241 ) ) ( not ( = ?AUTO_5236 ?AUTO_5243 ) ) ( not ( = ?AUTO_5237 ?AUTO_5241 ) ) ( not ( = ?AUTO_5237 ?AUTO_5243 ) ) ( not ( = ?AUTO_5238 ?AUTO_5241 ) ) ( not ( = ?AUTO_5238 ?AUTO_5243 ) ) ( not ( = ?AUTO_5241 ?AUTO_5243 ) ) ( ON ?AUTO_5241 ?AUTO_5236 ) ( CLEAR ?AUTO_5241 ) ( not ( = ?AUTO_5236 ?AUTO_5239 ) ) ( not ( = ?AUTO_5237 ?AUTO_5239 ) ) ( not ( = ?AUTO_5238 ?AUTO_5239 ) ) ( not ( = ?AUTO_5243 ?AUTO_5239 ) ) ( not ( = ?AUTO_5241 ?AUTO_5239 ) ) ( ON ?AUTO_5239 ?AUTO_5237 ) ( not ( = ?AUTO_5236 ?AUTO_5240 ) ) ( not ( = ?AUTO_5236 ?AUTO_5242 ) ) ( not ( = ?AUTO_5237 ?AUTO_5240 ) ) ( not ( = ?AUTO_5237 ?AUTO_5242 ) ) ( not ( = ?AUTO_5238 ?AUTO_5240 ) ) ( not ( = ?AUTO_5238 ?AUTO_5242 ) ) ( not ( = ?AUTO_5243 ?AUTO_5240 ) ) ( not ( = ?AUTO_5243 ?AUTO_5242 ) ) ( not ( = ?AUTO_5241 ?AUTO_5240 ) ) ( not ( = ?AUTO_5241 ?AUTO_5242 ) ) ( not ( = ?AUTO_5239 ?AUTO_5240 ) ) ( not ( = ?AUTO_5239 ?AUTO_5242 ) ) ( not ( = ?AUTO_5240 ?AUTO_5242 ) ) ( ON ?AUTO_5240 ?AUTO_5239 ) ( CLEAR ?AUTO_5240 ) ( HOLDING ?AUTO_5242 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5242 )
      ( MAKE-ON ?AUTO_5236 ?AUTO_5237 )
      ( MAKE-ON-VERIFY ?AUTO_5236 ?AUTO_5237 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5244 - BLOCK
      ?AUTO_5245 - BLOCK
    )
    :vars
    (
      ?AUTO_5251 - BLOCK
      ?AUTO_5246 - BLOCK
      ?AUTO_5248 - BLOCK
      ?AUTO_5249 - BLOCK
      ?AUTO_5250 - BLOCK
      ?AUTO_5247 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5244 ?AUTO_5245 ) ) ( ON ?AUTO_5244 ?AUTO_5251 ) ( not ( = ?AUTO_5244 ?AUTO_5251 ) ) ( not ( = ?AUTO_5245 ?AUTO_5251 ) ) ( CLEAR ?AUTO_5246 ) ( not ( = ?AUTO_5244 ?AUTO_5248 ) ) ( not ( = ?AUTO_5244 ?AUTO_5246 ) ) ( not ( = ?AUTO_5245 ?AUTO_5248 ) ) ( not ( = ?AUTO_5245 ?AUTO_5246 ) ) ( not ( = ?AUTO_5251 ?AUTO_5248 ) ) ( not ( = ?AUTO_5251 ?AUTO_5246 ) ) ( not ( = ?AUTO_5248 ?AUTO_5246 ) ) ( ON ?AUTO_5248 ?AUTO_5244 ) ( CLEAR ?AUTO_5248 ) ( not ( = ?AUTO_5244 ?AUTO_5249 ) ) ( not ( = ?AUTO_5245 ?AUTO_5249 ) ) ( not ( = ?AUTO_5251 ?AUTO_5249 ) ) ( not ( = ?AUTO_5246 ?AUTO_5249 ) ) ( not ( = ?AUTO_5248 ?AUTO_5249 ) ) ( ON ?AUTO_5249 ?AUTO_5245 ) ( not ( = ?AUTO_5244 ?AUTO_5250 ) ) ( not ( = ?AUTO_5244 ?AUTO_5247 ) ) ( not ( = ?AUTO_5245 ?AUTO_5250 ) ) ( not ( = ?AUTO_5245 ?AUTO_5247 ) ) ( not ( = ?AUTO_5251 ?AUTO_5250 ) ) ( not ( = ?AUTO_5251 ?AUTO_5247 ) ) ( not ( = ?AUTO_5246 ?AUTO_5250 ) ) ( not ( = ?AUTO_5246 ?AUTO_5247 ) ) ( not ( = ?AUTO_5248 ?AUTO_5250 ) ) ( not ( = ?AUTO_5248 ?AUTO_5247 ) ) ( not ( = ?AUTO_5249 ?AUTO_5250 ) ) ( not ( = ?AUTO_5249 ?AUTO_5247 ) ) ( not ( = ?AUTO_5250 ?AUTO_5247 ) ) ( ON ?AUTO_5250 ?AUTO_5249 ) ( ON ?AUTO_5247 ?AUTO_5250 ) ( CLEAR ?AUTO_5247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5247 ?AUTO_5250 )
      ( MAKE-ON ?AUTO_5244 ?AUTO_5245 )
      ( MAKE-ON-VERIFY ?AUTO_5244 ?AUTO_5245 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5252 - BLOCK
      ?AUTO_5253 - BLOCK
    )
    :vars
    (
      ?AUTO_5256 - BLOCK
      ?AUTO_5257 - BLOCK
      ?AUTO_5254 - BLOCK
      ?AUTO_5259 - BLOCK
      ?AUTO_5258 - BLOCK
      ?AUTO_5255 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5252 ?AUTO_5253 ) ) ( ON ?AUTO_5252 ?AUTO_5256 ) ( not ( = ?AUTO_5252 ?AUTO_5256 ) ) ( not ( = ?AUTO_5253 ?AUTO_5256 ) ) ( not ( = ?AUTO_5252 ?AUTO_5257 ) ) ( not ( = ?AUTO_5252 ?AUTO_5254 ) ) ( not ( = ?AUTO_5253 ?AUTO_5257 ) ) ( not ( = ?AUTO_5253 ?AUTO_5254 ) ) ( not ( = ?AUTO_5256 ?AUTO_5257 ) ) ( not ( = ?AUTO_5256 ?AUTO_5254 ) ) ( not ( = ?AUTO_5257 ?AUTO_5254 ) ) ( ON ?AUTO_5257 ?AUTO_5252 ) ( CLEAR ?AUTO_5257 ) ( not ( = ?AUTO_5252 ?AUTO_5259 ) ) ( not ( = ?AUTO_5253 ?AUTO_5259 ) ) ( not ( = ?AUTO_5256 ?AUTO_5259 ) ) ( not ( = ?AUTO_5254 ?AUTO_5259 ) ) ( not ( = ?AUTO_5257 ?AUTO_5259 ) ) ( ON ?AUTO_5259 ?AUTO_5253 ) ( not ( = ?AUTO_5252 ?AUTO_5258 ) ) ( not ( = ?AUTO_5252 ?AUTO_5255 ) ) ( not ( = ?AUTO_5253 ?AUTO_5258 ) ) ( not ( = ?AUTO_5253 ?AUTO_5255 ) ) ( not ( = ?AUTO_5256 ?AUTO_5258 ) ) ( not ( = ?AUTO_5256 ?AUTO_5255 ) ) ( not ( = ?AUTO_5254 ?AUTO_5258 ) ) ( not ( = ?AUTO_5254 ?AUTO_5255 ) ) ( not ( = ?AUTO_5257 ?AUTO_5258 ) ) ( not ( = ?AUTO_5257 ?AUTO_5255 ) ) ( not ( = ?AUTO_5259 ?AUTO_5258 ) ) ( not ( = ?AUTO_5259 ?AUTO_5255 ) ) ( not ( = ?AUTO_5258 ?AUTO_5255 ) ) ( ON ?AUTO_5258 ?AUTO_5259 ) ( ON ?AUTO_5255 ?AUTO_5258 ) ( CLEAR ?AUTO_5255 ) ( HOLDING ?AUTO_5254 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5254 )
      ( MAKE-ON ?AUTO_5252 ?AUTO_5253 )
      ( MAKE-ON-VERIFY ?AUTO_5252 ?AUTO_5253 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5260 - BLOCK
      ?AUTO_5261 - BLOCK
    )
    :vars
    (
      ?AUTO_5266 - BLOCK
      ?AUTO_5267 - BLOCK
      ?AUTO_5262 - BLOCK
      ?AUTO_5264 - BLOCK
      ?AUTO_5263 - BLOCK
      ?AUTO_5265 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5260 ?AUTO_5261 ) ) ( ON ?AUTO_5260 ?AUTO_5266 ) ( not ( = ?AUTO_5260 ?AUTO_5266 ) ) ( not ( = ?AUTO_5261 ?AUTO_5266 ) ) ( not ( = ?AUTO_5260 ?AUTO_5267 ) ) ( not ( = ?AUTO_5260 ?AUTO_5262 ) ) ( not ( = ?AUTO_5261 ?AUTO_5267 ) ) ( not ( = ?AUTO_5261 ?AUTO_5262 ) ) ( not ( = ?AUTO_5266 ?AUTO_5267 ) ) ( not ( = ?AUTO_5266 ?AUTO_5262 ) ) ( not ( = ?AUTO_5267 ?AUTO_5262 ) ) ( ON ?AUTO_5267 ?AUTO_5260 ) ( not ( = ?AUTO_5260 ?AUTO_5264 ) ) ( not ( = ?AUTO_5261 ?AUTO_5264 ) ) ( not ( = ?AUTO_5266 ?AUTO_5264 ) ) ( not ( = ?AUTO_5262 ?AUTO_5264 ) ) ( not ( = ?AUTO_5267 ?AUTO_5264 ) ) ( ON ?AUTO_5264 ?AUTO_5261 ) ( not ( = ?AUTO_5260 ?AUTO_5263 ) ) ( not ( = ?AUTO_5260 ?AUTO_5265 ) ) ( not ( = ?AUTO_5261 ?AUTO_5263 ) ) ( not ( = ?AUTO_5261 ?AUTO_5265 ) ) ( not ( = ?AUTO_5266 ?AUTO_5263 ) ) ( not ( = ?AUTO_5266 ?AUTO_5265 ) ) ( not ( = ?AUTO_5262 ?AUTO_5263 ) ) ( not ( = ?AUTO_5262 ?AUTO_5265 ) ) ( not ( = ?AUTO_5267 ?AUTO_5263 ) ) ( not ( = ?AUTO_5267 ?AUTO_5265 ) ) ( not ( = ?AUTO_5264 ?AUTO_5263 ) ) ( not ( = ?AUTO_5264 ?AUTO_5265 ) ) ( not ( = ?AUTO_5263 ?AUTO_5265 ) ) ( ON ?AUTO_5263 ?AUTO_5264 ) ( ON ?AUTO_5265 ?AUTO_5263 ) ( CLEAR ?AUTO_5265 ) ( ON ?AUTO_5262 ?AUTO_5267 ) ( CLEAR ?AUTO_5262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5262 ?AUTO_5267 )
      ( MAKE-ON ?AUTO_5260 ?AUTO_5261 )
      ( MAKE-ON-VERIFY ?AUTO_5260 ?AUTO_5261 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5270 - BLOCK
      ?AUTO_5271 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5270 ) ( CLEAR ?AUTO_5271 ) ( not ( = ?AUTO_5270 ?AUTO_5271 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5270 ?AUTO_5271 )
      ( MAKE-ON-VERIFY ?AUTO_5270 ?AUTO_5271 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5272 - BLOCK
      ?AUTO_5273 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5273 ) ( not ( = ?AUTO_5272 ?AUTO_5273 ) ) ( ON-TABLE ?AUTO_5272 ) ( CLEAR ?AUTO_5272 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5272 )
      ( MAKE-ON ?AUTO_5272 ?AUTO_5273 )
      ( MAKE-ON-VERIFY ?AUTO_5272 ?AUTO_5273 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5274 - BLOCK
      ?AUTO_5275 - BLOCK
    )
    :vars
    (
      ?AUTO_5276 - BLOCK
      ?AUTO_5277 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5275 ) ( not ( = ?AUTO_5274 ?AUTO_5275 ) ) ( ON-TABLE ?AUTO_5274 ) ( CLEAR ?AUTO_5274 ) ( HOLDING ?AUTO_5276 ) ( CLEAR ?AUTO_5277 ) ( not ( = ?AUTO_5274 ?AUTO_5276 ) ) ( not ( = ?AUTO_5274 ?AUTO_5277 ) ) ( not ( = ?AUTO_5275 ?AUTO_5276 ) ) ( not ( = ?AUTO_5275 ?AUTO_5277 ) ) ( not ( = ?AUTO_5276 ?AUTO_5277 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5276 ?AUTO_5277 )
      ( MAKE-ON ?AUTO_5274 ?AUTO_5275 )
      ( MAKE-ON-VERIFY ?AUTO_5274 ?AUTO_5275 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5278 - BLOCK
      ?AUTO_5279 - BLOCK
    )
    :vars
    (
      ?AUTO_5280 - BLOCK
      ?AUTO_5281 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5279 ) ( not ( = ?AUTO_5278 ?AUTO_5279 ) ) ( ON-TABLE ?AUTO_5278 ) ( CLEAR ?AUTO_5280 ) ( not ( = ?AUTO_5278 ?AUTO_5281 ) ) ( not ( = ?AUTO_5278 ?AUTO_5280 ) ) ( not ( = ?AUTO_5279 ?AUTO_5281 ) ) ( not ( = ?AUTO_5279 ?AUTO_5280 ) ) ( not ( = ?AUTO_5281 ?AUTO_5280 ) ) ( ON ?AUTO_5281 ?AUTO_5278 ) ( CLEAR ?AUTO_5281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5281 ?AUTO_5278 )
      ( MAKE-ON ?AUTO_5278 ?AUTO_5279 )
      ( MAKE-ON-VERIFY ?AUTO_5278 ?AUTO_5279 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5282 - BLOCK
      ?AUTO_5283 - BLOCK
    )
    :vars
    (
      ?AUTO_5284 - BLOCK
      ?AUTO_5285 - BLOCK
      ?AUTO_5286 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5283 ) ( not ( = ?AUTO_5282 ?AUTO_5283 ) ) ( ON-TABLE ?AUTO_5282 ) ( not ( = ?AUTO_5282 ?AUTO_5284 ) ) ( not ( = ?AUTO_5282 ?AUTO_5285 ) ) ( not ( = ?AUTO_5283 ?AUTO_5284 ) ) ( not ( = ?AUTO_5283 ?AUTO_5285 ) ) ( not ( = ?AUTO_5284 ?AUTO_5285 ) ) ( ON ?AUTO_5284 ?AUTO_5282 ) ( CLEAR ?AUTO_5284 ) ( HOLDING ?AUTO_5285 ) ( CLEAR ?AUTO_5286 ) ( not ( = ?AUTO_5282 ?AUTO_5286 ) ) ( not ( = ?AUTO_5283 ?AUTO_5286 ) ) ( not ( = ?AUTO_5284 ?AUTO_5286 ) ) ( not ( = ?AUTO_5285 ?AUTO_5286 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5285 ?AUTO_5286 )
      ( MAKE-ON ?AUTO_5282 ?AUTO_5283 )
      ( MAKE-ON-VERIFY ?AUTO_5282 ?AUTO_5283 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5291 - BLOCK
      ?AUTO_5292 - BLOCK
    )
    :vars
    (
      ?AUTO_5295 - BLOCK
      ?AUTO_5294 - BLOCK
      ?AUTO_5293 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5292 ) ( not ( = ?AUTO_5291 ?AUTO_5292 ) ) ( ON-TABLE ?AUTO_5291 ) ( not ( = ?AUTO_5291 ?AUTO_5295 ) ) ( not ( = ?AUTO_5291 ?AUTO_5294 ) ) ( not ( = ?AUTO_5292 ?AUTO_5295 ) ) ( not ( = ?AUTO_5292 ?AUTO_5294 ) ) ( not ( = ?AUTO_5295 ?AUTO_5294 ) ) ( ON ?AUTO_5295 ?AUTO_5291 ) ( CLEAR ?AUTO_5293 ) ( not ( = ?AUTO_5291 ?AUTO_5293 ) ) ( not ( = ?AUTO_5292 ?AUTO_5293 ) ) ( not ( = ?AUTO_5295 ?AUTO_5293 ) ) ( not ( = ?AUTO_5294 ?AUTO_5293 ) ) ( ON ?AUTO_5294 ?AUTO_5295 ) ( CLEAR ?AUTO_5294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5294 ?AUTO_5295 )
      ( MAKE-ON ?AUTO_5291 ?AUTO_5292 )
      ( MAKE-ON-VERIFY ?AUTO_5291 ?AUTO_5292 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5296 - BLOCK
      ?AUTO_5297 - BLOCK
    )
    :vars
    (
      ?AUTO_5300 - BLOCK
      ?AUTO_5299 - BLOCK
      ?AUTO_5298 - BLOCK
      ?AUTO_5301 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5297 ) ( not ( = ?AUTO_5296 ?AUTO_5297 ) ) ( ON-TABLE ?AUTO_5296 ) ( not ( = ?AUTO_5296 ?AUTO_5300 ) ) ( not ( = ?AUTO_5296 ?AUTO_5299 ) ) ( not ( = ?AUTO_5297 ?AUTO_5300 ) ) ( not ( = ?AUTO_5297 ?AUTO_5299 ) ) ( not ( = ?AUTO_5300 ?AUTO_5299 ) ) ( ON ?AUTO_5300 ?AUTO_5296 ) ( CLEAR ?AUTO_5298 ) ( not ( = ?AUTO_5296 ?AUTO_5298 ) ) ( not ( = ?AUTO_5297 ?AUTO_5298 ) ) ( not ( = ?AUTO_5300 ?AUTO_5298 ) ) ( not ( = ?AUTO_5299 ?AUTO_5298 ) ) ( ON ?AUTO_5299 ?AUTO_5300 ) ( CLEAR ?AUTO_5299 ) ( HOLDING ?AUTO_5301 ) ( not ( = ?AUTO_5296 ?AUTO_5301 ) ) ( not ( = ?AUTO_5297 ?AUTO_5301 ) ) ( not ( = ?AUTO_5300 ?AUTO_5301 ) ) ( not ( = ?AUTO_5299 ?AUTO_5301 ) ) ( not ( = ?AUTO_5298 ?AUTO_5301 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5301 )
      ( MAKE-ON ?AUTO_5296 ?AUTO_5297 )
      ( MAKE-ON-VERIFY ?AUTO_5296 ?AUTO_5297 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5308 - BLOCK
      ?AUTO_5309 - BLOCK
    )
    :vars
    (
      ?AUTO_5312 - BLOCK
      ?AUTO_5310 - BLOCK
      ?AUTO_5311 - BLOCK
      ?AUTO_5313 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5308 ?AUTO_5309 ) ) ( ON-TABLE ?AUTO_5308 ) ( not ( = ?AUTO_5308 ?AUTO_5312 ) ) ( not ( = ?AUTO_5308 ?AUTO_5310 ) ) ( not ( = ?AUTO_5309 ?AUTO_5312 ) ) ( not ( = ?AUTO_5309 ?AUTO_5310 ) ) ( not ( = ?AUTO_5312 ?AUTO_5310 ) ) ( ON ?AUTO_5312 ?AUTO_5308 ) ( CLEAR ?AUTO_5311 ) ( not ( = ?AUTO_5308 ?AUTO_5311 ) ) ( not ( = ?AUTO_5309 ?AUTO_5311 ) ) ( not ( = ?AUTO_5312 ?AUTO_5311 ) ) ( not ( = ?AUTO_5310 ?AUTO_5311 ) ) ( ON ?AUTO_5310 ?AUTO_5312 ) ( CLEAR ?AUTO_5310 ) ( HOLDING ?AUTO_5309 ) ( CLEAR ?AUTO_5313 ) ( not ( = ?AUTO_5308 ?AUTO_5313 ) ) ( not ( = ?AUTO_5309 ?AUTO_5313 ) ) ( not ( = ?AUTO_5312 ?AUTO_5313 ) ) ( not ( = ?AUTO_5310 ?AUTO_5313 ) ) ( not ( = ?AUTO_5311 ?AUTO_5313 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5309 ?AUTO_5313 )
      ( MAKE-ON ?AUTO_5308 ?AUTO_5309 )
      ( MAKE-ON-VERIFY ?AUTO_5308 ?AUTO_5309 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5324 - BLOCK
      ?AUTO_5325 - BLOCK
    )
    :vars
    (
      ?AUTO_5328 - BLOCK
      ?AUTO_5326 - BLOCK
      ?AUTO_5327 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5325 ) ( not ( = ?AUTO_5324 ?AUTO_5325 ) ) ( ON-TABLE ?AUTO_5324 ) ( not ( = ?AUTO_5324 ?AUTO_5328 ) ) ( not ( = ?AUTO_5324 ?AUTO_5326 ) ) ( not ( = ?AUTO_5325 ?AUTO_5328 ) ) ( not ( = ?AUTO_5325 ?AUTO_5326 ) ) ( not ( = ?AUTO_5328 ?AUTO_5326 ) ) ( ON ?AUTO_5328 ?AUTO_5324 ) ( not ( = ?AUTO_5324 ?AUTO_5327 ) ) ( not ( = ?AUTO_5325 ?AUTO_5327 ) ) ( not ( = ?AUTO_5328 ?AUTO_5327 ) ) ( not ( = ?AUTO_5326 ?AUTO_5327 ) ) ( ON ?AUTO_5326 ?AUTO_5328 ) ( CLEAR ?AUTO_5326 ) ( HOLDING ?AUTO_5327 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5327 )
      ( MAKE-ON ?AUTO_5324 ?AUTO_5325 )
      ( MAKE-ON-VERIFY ?AUTO_5324 ?AUTO_5325 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5329 - BLOCK
      ?AUTO_5330 - BLOCK
    )
    :vars
    (
      ?AUTO_5333 - BLOCK
      ?AUTO_5331 - BLOCK
      ?AUTO_5332 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5330 ) ( not ( = ?AUTO_5329 ?AUTO_5330 ) ) ( ON-TABLE ?AUTO_5329 ) ( not ( = ?AUTO_5329 ?AUTO_5333 ) ) ( not ( = ?AUTO_5329 ?AUTO_5331 ) ) ( not ( = ?AUTO_5330 ?AUTO_5333 ) ) ( not ( = ?AUTO_5330 ?AUTO_5331 ) ) ( not ( = ?AUTO_5333 ?AUTO_5331 ) ) ( ON ?AUTO_5333 ?AUTO_5329 ) ( not ( = ?AUTO_5329 ?AUTO_5332 ) ) ( not ( = ?AUTO_5330 ?AUTO_5332 ) ) ( not ( = ?AUTO_5333 ?AUTO_5332 ) ) ( not ( = ?AUTO_5331 ?AUTO_5332 ) ) ( ON ?AUTO_5331 ?AUTO_5333 ) ( ON ?AUTO_5332 ?AUTO_5331 ) ( CLEAR ?AUTO_5332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5332 ?AUTO_5331 )
      ( MAKE-ON ?AUTO_5329 ?AUTO_5330 )
      ( MAKE-ON-VERIFY ?AUTO_5329 ?AUTO_5330 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5336 - BLOCK
      ?AUTO_5337 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5336 ) ( CLEAR ?AUTO_5337 ) ( not ( = ?AUTO_5336 ?AUTO_5337 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5336 ?AUTO_5337 )
      ( MAKE-ON-VERIFY ?AUTO_5336 ?AUTO_5337 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5338 - BLOCK
      ?AUTO_5339 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5339 ) ( not ( = ?AUTO_5338 ?AUTO_5339 ) ) ( ON-TABLE ?AUTO_5338 ) ( CLEAR ?AUTO_5338 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5338 )
      ( MAKE-ON ?AUTO_5338 ?AUTO_5339 )
      ( MAKE-ON-VERIFY ?AUTO_5338 ?AUTO_5339 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5340 - BLOCK
      ?AUTO_5341 - BLOCK
    )
    :vars
    (
      ?AUTO_5342 - BLOCK
      ?AUTO_5343 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5341 ) ( not ( = ?AUTO_5340 ?AUTO_5341 ) ) ( ON-TABLE ?AUTO_5340 ) ( CLEAR ?AUTO_5340 ) ( HOLDING ?AUTO_5342 ) ( CLEAR ?AUTO_5343 ) ( not ( = ?AUTO_5340 ?AUTO_5342 ) ) ( not ( = ?AUTO_5340 ?AUTO_5343 ) ) ( not ( = ?AUTO_5341 ?AUTO_5342 ) ) ( not ( = ?AUTO_5341 ?AUTO_5343 ) ) ( not ( = ?AUTO_5342 ?AUTO_5343 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5342 ?AUTO_5343 )
      ( MAKE-ON ?AUTO_5340 ?AUTO_5341 )
      ( MAKE-ON-VERIFY ?AUTO_5340 ?AUTO_5341 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5346 - BLOCK
      ?AUTO_5347 - BLOCK
    )
    :vars
    (
      ?AUTO_5348 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5346 ?AUTO_5347 ) ) ( ON-TABLE ?AUTO_5346 ) ( CLEAR ?AUTO_5346 ) ( HOLDING ?AUTO_5347 ) ( CLEAR ?AUTO_5348 ) ( not ( = ?AUTO_5346 ?AUTO_5348 ) ) ( not ( = ?AUTO_5347 ?AUTO_5348 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5347 ?AUTO_5348 )
      ( MAKE-ON ?AUTO_5346 ?AUTO_5347 )
      ( MAKE-ON-VERIFY ?AUTO_5346 ?AUTO_5347 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5357 - BLOCK
      ?AUTO_5358 - BLOCK
    )
    :vars
    (
      ?AUTO_5359 - BLOCK
      ?AUTO_5360 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5357 ?AUTO_5358 ) ) ( ON-TABLE ?AUTO_5357 ) ( CLEAR ?AUTO_5357 ) ( CLEAR ?AUTO_5359 ) ( not ( = ?AUTO_5357 ?AUTO_5360 ) ) ( not ( = ?AUTO_5357 ?AUTO_5359 ) ) ( not ( = ?AUTO_5358 ?AUTO_5360 ) ) ( not ( = ?AUTO_5358 ?AUTO_5359 ) ) ( not ( = ?AUTO_5360 ?AUTO_5359 ) ) ( ON ?AUTO_5360 ?AUTO_5358 ) ( CLEAR ?AUTO_5360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5360 ?AUTO_5358 )
      ( MAKE-ON ?AUTO_5357 ?AUTO_5358 )
      ( MAKE-ON-VERIFY ?AUTO_5357 ?AUTO_5358 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5361 - BLOCK
      ?AUTO_5362 - BLOCK
    )
    :vars
    (
      ?AUTO_5364 - BLOCK
      ?AUTO_5363 - BLOCK
      ?AUTO_5365 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5361 ?AUTO_5362 ) ) ( ON-TABLE ?AUTO_5361 ) ( CLEAR ?AUTO_5361 ) ( CLEAR ?AUTO_5364 ) ( not ( = ?AUTO_5361 ?AUTO_5363 ) ) ( not ( = ?AUTO_5361 ?AUTO_5364 ) ) ( not ( = ?AUTO_5362 ?AUTO_5363 ) ) ( not ( = ?AUTO_5362 ?AUTO_5364 ) ) ( not ( = ?AUTO_5363 ?AUTO_5364 ) ) ( ON ?AUTO_5363 ?AUTO_5362 ) ( CLEAR ?AUTO_5363 ) ( HOLDING ?AUTO_5365 ) ( not ( = ?AUTO_5361 ?AUTO_5365 ) ) ( not ( = ?AUTO_5362 ?AUTO_5365 ) ) ( not ( = ?AUTO_5364 ?AUTO_5365 ) ) ( not ( = ?AUTO_5363 ?AUTO_5365 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5365 )
      ( MAKE-ON ?AUTO_5361 ?AUTO_5362 )
      ( MAKE-ON-VERIFY ?AUTO_5361 ?AUTO_5362 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5368 - BLOCK
      ?AUTO_5369 - BLOCK
    )
    :vars
    (
      ?AUTO_5371 - BLOCK
      ?AUTO_5370 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5368 ?AUTO_5369 ) ) ( CLEAR ?AUTO_5371 ) ( not ( = ?AUTO_5368 ?AUTO_5370 ) ) ( not ( = ?AUTO_5368 ?AUTO_5371 ) ) ( not ( = ?AUTO_5369 ?AUTO_5370 ) ) ( not ( = ?AUTO_5369 ?AUTO_5371 ) ) ( not ( = ?AUTO_5370 ?AUTO_5371 ) ) ( ON ?AUTO_5370 ?AUTO_5369 ) ( CLEAR ?AUTO_5370 ) ( HOLDING ?AUTO_5368 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5368 )
      ( MAKE-ON ?AUTO_5368 ?AUTO_5369 )
      ( MAKE-ON-VERIFY ?AUTO_5368 ?AUTO_5369 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5382 - BLOCK
      ?AUTO_5383 - BLOCK
    )
    :vars
    (
      ?AUTO_5384 - BLOCK
      ?AUTO_5386 - BLOCK
      ?AUTO_5385 - BLOCK
      ?AUTO_5387 - BLOCK
      ?AUTO_5388 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5382 ?AUTO_5383 ) ) ( ON ?AUTO_5382 ?AUTO_5384 ) ( not ( = ?AUTO_5382 ?AUTO_5384 ) ) ( not ( = ?AUTO_5383 ?AUTO_5384 ) ) ( CLEAR ?AUTO_5386 ) ( not ( = ?AUTO_5382 ?AUTO_5385 ) ) ( not ( = ?AUTO_5382 ?AUTO_5386 ) ) ( not ( = ?AUTO_5383 ?AUTO_5385 ) ) ( not ( = ?AUTO_5383 ?AUTO_5386 ) ) ( not ( = ?AUTO_5384 ?AUTO_5385 ) ) ( not ( = ?AUTO_5384 ?AUTO_5386 ) ) ( not ( = ?AUTO_5385 ?AUTO_5386 ) ) ( ON ?AUTO_5385 ?AUTO_5382 ) ( CLEAR ?AUTO_5385 ) ( not ( = ?AUTO_5382 ?AUTO_5387 ) ) ( not ( = ?AUTO_5383 ?AUTO_5387 ) ) ( not ( = ?AUTO_5384 ?AUTO_5387 ) ) ( not ( = ?AUTO_5386 ?AUTO_5387 ) ) ( not ( = ?AUTO_5385 ?AUTO_5387 ) ) ( ON ?AUTO_5387 ?AUTO_5383 ) ( CLEAR ?AUTO_5387 ) ( HOLDING ?AUTO_5388 ) ( not ( = ?AUTO_5382 ?AUTO_5388 ) ) ( not ( = ?AUTO_5383 ?AUTO_5388 ) ) ( not ( = ?AUTO_5384 ?AUTO_5388 ) ) ( not ( = ?AUTO_5386 ?AUTO_5388 ) ) ( not ( = ?AUTO_5385 ?AUTO_5388 ) ) ( not ( = ?AUTO_5387 ?AUTO_5388 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5388 )
      ( MAKE-ON ?AUTO_5382 ?AUTO_5383 )
      ( MAKE-ON-VERIFY ?AUTO_5382 ?AUTO_5383 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5389 - BLOCK
      ?AUTO_5390 - BLOCK
    )
    :vars
    (
      ?AUTO_5395 - BLOCK
      ?AUTO_5392 - BLOCK
      ?AUTO_5394 - BLOCK
      ?AUTO_5391 - BLOCK
      ?AUTO_5393 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5389 ?AUTO_5390 ) ) ( ON ?AUTO_5389 ?AUTO_5395 ) ( not ( = ?AUTO_5389 ?AUTO_5395 ) ) ( not ( = ?AUTO_5390 ?AUTO_5395 ) ) ( CLEAR ?AUTO_5392 ) ( not ( = ?AUTO_5389 ?AUTO_5394 ) ) ( not ( = ?AUTO_5389 ?AUTO_5392 ) ) ( not ( = ?AUTO_5390 ?AUTO_5394 ) ) ( not ( = ?AUTO_5390 ?AUTO_5392 ) ) ( not ( = ?AUTO_5395 ?AUTO_5394 ) ) ( not ( = ?AUTO_5395 ?AUTO_5392 ) ) ( not ( = ?AUTO_5394 ?AUTO_5392 ) ) ( ON ?AUTO_5394 ?AUTO_5389 ) ( not ( = ?AUTO_5389 ?AUTO_5391 ) ) ( not ( = ?AUTO_5390 ?AUTO_5391 ) ) ( not ( = ?AUTO_5395 ?AUTO_5391 ) ) ( not ( = ?AUTO_5392 ?AUTO_5391 ) ) ( not ( = ?AUTO_5394 ?AUTO_5391 ) ) ( ON ?AUTO_5391 ?AUTO_5390 ) ( CLEAR ?AUTO_5391 ) ( not ( = ?AUTO_5389 ?AUTO_5393 ) ) ( not ( = ?AUTO_5390 ?AUTO_5393 ) ) ( not ( = ?AUTO_5395 ?AUTO_5393 ) ) ( not ( = ?AUTO_5392 ?AUTO_5393 ) ) ( not ( = ?AUTO_5394 ?AUTO_5393 ) ) ( not ( = ?AUTO_5391 ?AUTO_5393 ) ) ( ON ?AUTO_5393 ?AUTO_5394 ) ( CLEAR ?AUTO_5393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5393 ?AUTO_5394 )
      ( MAKE-ON ?AUTO_5389 ?AUTO_5390 )
      ( MAKE-ON-VERIFY ?AUTO_5389 ?AUTO_5390 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5396 - BLOCK
      ?AUTO_5397 - BLOCK
    )
    :vars
    (
      ?AUTO_5400 - BLOCK
      ?AUTO_5401 - BLOCK
      ?AUTO_5399 - BLOCK
      ?AUTO_5398 - BLOCK
      ?AUTO_5402 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5396 ?AUTO_5397 ) ) ( ON ?AUTO_5396 ?AUTO_5400 ) ( not ( = ?AUTO_5396 ?AUTO_5400 ) ) ( not ( = ?AUTO_5397 ?AUTO_5400 ) ) ( not ( = ?AUTO_5396 ?AUTO_5401 ) ) ( not ( = ?AUTO_5396 ?AUTO_5399 ) ) ( not ( = ?AUTO_5397 ?AUTO_5401 ) ) ( not ( = ?AUTO_5397 ?AUTO_5399 ) ) ( not ( = ?AUTO_5400 ?AUTO_5401 ) ) ( not ( = ?AUTO_5400 ?AUTO_5399 ) ) ( not ( = ?AUTO_5401 ?AUTO_5399 ) ) ( ON ?AUTO_5401 ?AUTO_5396 ) ( not ( = ?AUTO_5396 ?AUTO_5398 ) ) ( not ( = ?AUTO_5397 ?AUTO_5398 ) ) ( not ( = ?AUTO_5400 ?AUTO_5398 ) ) ( not ( = ?AUTO_5399 ?AUTO_5398 ) ) ( not ( = ?AUTO_5401 ?AUTO_5398 ) ) ( ON ?AUTO_5398 ?AUTO_5397 ) ( CLEAR ?AUTO_5398 ) ( not ( = ?AUTO_5396 ?AUTO_5402 ) ) ( not ( = ?AUTO_5397 ?AUTO_5402 ) ) ( not ( = ?AUTO_5400 ?AUTO_5402 ) ) ( not ( = ?AUTO_5399 ?AUTO_5402 ) ) ( not ( = ?AUTO_5401 ?AUTO_5402 ) ) ( not ( = ?AUTO_5398 ?AUTO_5402 ) ) ( ON ?AUTO_5402 ?AUTO_5401 ) ( CLEAR ?AUTO_5402 ) ( HOLDING ?AUTO_5399 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5399 )
      ( MAKE-ON ?AUTO_5396 ?AUTO_5397 )
      ( MAKE-ON-VERIFY ?AUTO_5396 ?AUTO_5397 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5403 - BLOCK
      ?AUTO_5404 - BLOCK
    )
    :vars
    (
      ?AUTO_5409 - BLOCK
      ?AUTO_5408 - BLOCK
      ?AUTO_5405 - BLOCK
      ?AUTO_5406 - BLOCK
      ?AUTO_5407 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5403 ?AUTO_5404 ) ) ( ON ?AUTO_5403 ?AUTO_5409 ) ( not ( = ?AUTO_5403 ?AUTO_5409 ) ) ( not ( = ?AUTO_5404 ?AUTO_5409 ) ) ( not ( = ?AUTO_5403 ?AUTO_5408 ) ) ( not ( = ?AUTO_5403 ?AUTO_5405 ) ) ( not ( = ?AUTO_5404 ?AUTO_5408 ) ) ( not ( = ?AUTO_5404 ?AUTO_5405 ) ) ( not ( = ?AUTO_5409 ?AUTO_5408 ) ) ( not ( = ?AUTO_5409 ?AUTO_5405 ) ) ( not ( = ?AUTO_5408 ?AUTO_5405 ) ) ( ON ?AUTO_5408 ?AUTO_5403 ) ( not ( = ?AUTO_5403 ?AUTO_5406 ) ) ( not ( = ?AUTO_5404 ?AUTO_5406 ) ) ( not ( = ?AUTO_5409 ?AUTO_5406 ) ) ( not ( = ?AUTO_5405 ?AUTO_5406 ) ) ( not ( = ?AUTO_5408 ?AUTO_5406 ) ) ( ON ?AUTO_5406 ?AUTO_5404 ) ( not ( = ?AUTO_5403 ?AUTO_5407 ) ) ( not ( = ?AUTO_5404 ?AUTO_5407 ) ) ( not ( = ?AUTO_5409 ?AUTO_5407 ) ) ( not ( = ?AUTO_5405 ?AUTO_5407 ) ) ( not ( = ?AUTO_5408 ?AUTO_5407 ) ) ( not ( = ?AUTO_5406 ?AUTO_5407 ) ) ( ON ?AUTO_5407 ?AUTO_5408 ) ( CLEAR ?AUTO_5407 ) ( ON ?AUTO_5405 ?AUTO_5406 ) ( CLEAR ?AUTO_5405 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5405 ?AUTO_5406 )
      ( MAKE-ON ?AUTO_5403 ?AUTO_5404 )
      ( MAKE-ON-VERIFY ?AUTO_5403 ?AUTO_5404 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5411 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5411 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5411 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5411 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5412 - BLOCK
    )
    :vars
    (
      ?AUTO_5413 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5412 ?AUTO_5413 ) ( CLEAR ?AUTO_5412 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5412 ?AUTO_5413 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5412 ?AUTO_5413 )
      ( MAKE-ON-TABLE ?AUTO_5412 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5412 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5415 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5415 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5415 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5415 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5416 - BLOCK
    )
    :vars
    (
      ?AUTO_5417 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5416 ?AUTO_5417 ) ( CLEAR ?AUTO_5416 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5416 ?AUTO_5417 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5416 ?AUTO_5417 )
      ( MAKE-ON-TABLE ?AUTO_5416 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5416 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5418 - BLOCK
    )
    :vars
    (
      ?AUTO_5419 - BLOCK
      ?AUTO_5420 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5418 ?AUTO_5419 ) ( CLEAR ?AUTO_5418 ) ( not ( = ?AUTO_5418 ?AUTO_5419 ) ) ( HOLDING ?AUTO_5420 ) ( not ( = ?AUTO_5418 ?AUTO_5420 ) ) ( not ( = ?AUTO_5419 ?AUTO_5420 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5420 )
      ( MAKE-ON-TABLE ?AUTO_5418 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5418 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5423 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5423 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5423 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5423 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5424 - BLOCK
    )
    :vars
    (
      ?AUTO_5425 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5424 ?AUTO_5425 ) ( CLEAR ?AUTO_5424 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5424 ?AUTO_5425 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5424 ?AUTO_5425 )
      ( MAKE-ON-TABLE ?AUTO_5424 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5424 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5426 - BLOCK
    )
    :vars
    (
      ?AUTO_5427 - BLOCK
      ?AUTO_5428 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5426 ?AUTO_5427 ) ( CLEAR ?AUTO_5426 ) ( not ( = ?AUTO_5426 ?AUTO_5427 ) ) ( HOLDING ?AUTO_5428 ) ( not ( = ?AUTO_5426 ?AUTO_5428 ) ) ( not ( = ?AUTO_5427 ?AUTO_5428 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5428 )
      ( MAKE-ON-TABLE ?AUTO_5426 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5426 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5429 - BLOCK
    )
    :vars
    (
      ?AUTO_5430 - BLOCK
      ?AUTO_5431 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5429 ?AUTO_5430 ) ( not ( = ?AUTO_5429 ?AUTO_5430 ) ) ( not ( = ?AUTO_5429 ?AUTO_5431 ) ) ( not ( = ?AUTO_5430 ?AUTO_5431 ) ) ( ON ?AUTO_5431 ?AUTO_5429 ) ( CLEAR ?AUTO_5431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5431 ?AUTO_5429 )
      ( MAKE-ON-TABLE ?AUTO_5429 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5429 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5432 - BLOCK
    )
    :vars
    (
      ?AUTO_5433 - BLOCK
      ?AUTO_5434 - BLOCK
      ?AUTO_5435 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5432 ?AUTO_5433 ) ( not ( = ?AUTO_5432 ?AUTO_5433 ) ) ( not ( = ?AUTO_5432 ?AUTO_5434 ) ) ( not ( = ?AUTO_5433 ?AUTO_5434 ) ) ( ON ?AUTO_5434 ?AUTO_5432 ) ( CLEAR ?AUTO_5434 ) ( HOLDING ?AUTO_5435 ) ( not ( = ?AUTO_5432 ?AUTO_5435 ) ) ( not ( = ?AUTO_5433 ?AUTO_5435 ) ) ( not ( = ?AUTO_5434 ?AUTO_5435 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5435 )
      ( MAKE-ON-TABLE ?AUTO_5432 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5432 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5438 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5438 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5438 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5438 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5439 - BLOCK
    )
    :vars
    (
      ?AUTO_5440 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5439 ?AUTO_5440 ) ( CLEAR ?AUTO_5439 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5439 ?AUTO_5440 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5439 ?AUTO_5440 )
      ( MAKE-ON-TABLE ?AUTO_5439 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5439 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5441 - BLOCK
    )
    :vars
    (
      ?AUTO_5442 - BLOCK
      ?AUTO_5443 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5441 ?AUTO_5442 ) ( CLEAR ?AUTO_5441 ) ( not ( = ?AUTO_5441 ?AUTO_5442 ) ) ( HOLDING ?AUTO_5443 ) ( not ( = ?AUTO_5441 ?AUTO_5443 ) ) ( not ( = ?AUTO_5442 ?AUTO_5443 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5443 )
      ( MAKE-ON-TABLE ?AUTO_5441 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5441 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5451 - BLOCK
      ?AUTO_5452 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5451 ) ( CLEAR ?AUTO_5452 ) ( not ( = ?AUTO_5451 ?AUTO_5452 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5451 ?AUTO_5452 )
      ( MAKE-ON-VERIFY ?AUTO_5451 ?AUTO_5452 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5453 - BLOCK
      ?AUTO_5454 - BLOCK
    )
    :vars
    (
      ?AUTO_5455 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5454 ) ( not ( = ?AUTO_5453 ?AUTO_5454 ) ) ( ON ?AUTO_5453 ?AUTO_5455 ) ( CLEAR ?AUTO_5453 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5453 ?AUTO_5455 ) ) ( not ( = ?AUTO_5454 ?AUTO_5455 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5453 ?AUTO_5455 )
      ( MAKE-ON ?AUTO_5453 ?AUTO_5454 )
      ( MAKE-ON-VERIFY ?AUTO_5453 ?AUTO_5454 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5456 - BLOCK
      ?AUTO_5457 - BLOCK
    )
    :vars
    (
      ?AUTO_5458 - BLOCK
      ?AUTO_5459 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5457 ) ( not ( = ?AUTO_5456 ?AUTO_5457 ) ) ( ON ?AUTO_5456 ?AUTO_5458 ) ( CLEAR ?AUTO_5456 ) ( not ( = ?AUTO_5456 ?AUTO_5458 ) ) ( not ( = ?AUTO_5457 ?AUTO_5458 ) ) ( HOLDING ?AUTO_5459 ) ( not ( = ?AUTO_5456 ?AUTO_5459 ) ) ( not ( = ?AUTO_5457 ?AUTO_5459 ) ) ( not ( = ?AUTO_5458 ?AUTO_5459 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5459 )
      ( MAKE-ON ?AUTO_5456 ?AUTO_5457 )
      ( MAKE-ON-VERIFY ?AUTO_5456 ?AUTO_5457 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5460 - BLOCK
      ?AUTO_5461 - BLOCK
    )
    :vars
    (
      ?AUTO_5462 - BLOCK
      ?AUTO_5463 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5461 ) ( not ( = ?AUTO_5460 ?AUTO_5461 ) ) ( ON ?AUTO_5460 ?AUTO_5462 ) ( not ( = ?AUTO_5460 ?AUTO_5462 ) ) ( not ( = ?AUTO_5461 ?AUTO_5462 ) ) ( not ( = ?AUTO_5460 ?AUTO_5463 ) ) ( not ( = ?AUTO_5461 ?AUTO_5463 ) ) ( not ( = ?AUTO_5462 ?AUTO_5463 ) ) ( ON ?AUTO_5463 ?AUTO_5460 ) ( CLEAR ?AUTO_5463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5463 ?AUTO_5460 )
      ( MAKE-ON ?AUTO_5460 ?AUTO_5461 )
      ( MAKE-ON-VERIFY ?AUTO_5460 ?AUTO_5461 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5464 - BLOCK
      ?AUTO_5465 - BLOCK
    )
    :vars
    (
      ?AUTO_5466 - BLOCK
      ?AUTO_5467 - BLOCK
      ?AUTO_5468 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5465 ) ( not ( = ?AUTO_5464 ?AUTO_5465 ) ) ( ON ?AUTO_5464 ?AUTO_5466 ) ( not ( = ?AUTO_5464 ?AUTO_5466 ) ) ( not ( = ?AUTO_5465 ?AUTO_5466 ) ) ( not ( = ?AUTO_5464 ?AUTO_5467 ) ) ( not ( = ?AUTO_5465 ?AUTO_5467 ) ) ( not ( = ?AUTO_5466 ?AUTO_5467 ) ) ( ON ?AUTO_5467 ?AUTO_5464 ) ( CLEAR ?AUTO_5467 ) ( HOLDING ?AUTO_5468 ) ( not ( = ?AUTO_5464 ?AUTO_5468 ) ) ( not ( = ?AUTO_5465 ?AUTO_5468 ) ) ( not ( = ?AUTO_5466 ?AUTO_5468 ) ) ( not ( = ?AUTO_5467 ?AUTO_5468 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5468 )
      ( MAKE-ON ?AUTO_5464 ?AUTO_5465 )
      ( MAKE-ON-VERIFY ?AUTO_5464 ?AUTO_5465 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5471 - BLOCK
      ?AUTO_5472 - BLOCK
    )
    :vars
    (
      ?AUTO_5474 - BLOCK
      ?AUTO_5473 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5471 ?AUTO_5472 ) ) ( ON ?AUTO_5471 ?AUTO_5474 ) ( not ( = ?AUTO_5471 ?AUTO_5474 ) ) ( not ( = ?AUTO_5472 ?AUTO_5474 ) ) ( not ( = ?AUTO_5471 ?AUTO_5473 ) ) ( not ( = ?AUTO_5472 ?AUTO_5473 ) ) ( not ( = ?AUTO_5474 ?AUTO_5473 ) ) ( ON ?AUTO_5473 ?AUTO_5471 ) ( CLEAR ?AUTO_5473 ) ( HOLDING ?AUTO_5472 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5472 )
      ( MAKE-ON ?AUTO_5471 ?AUTO_5472 )
      ( MAKE-ON-VERIFY ?AUTO_5471 ?AUTO_5472 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5479 - BLOCK
      ?AUTO_5480 - BLOCK
    )
    :vars
    (
      ?AUTO_5483 - BLOCK
      ?AUTO_5482 - BLOCK
      ?AUTO_5481 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5480 ) ( not ( = ?AUTO_5479 ?AUTO_5480 ) ) ( ON ?AUTO_5479 ?AUTO_5483 ) ( not ( = ?AUTO_5479 ?AUTO_5483 ) ) ( not ( = ?AUTO_5480 ?AUTO_5483 ) ) ( not ( = ?AUTO_5479 ?AUTO_5482 ) ) ( not ( = ?AUTO_5480 ?AUTO_5482 ) ) ( not ( = ?AUTO_5483 ?AUTO_5482 ) ) ( ON ?AUTO_5482 ?AUTO_5479 ) ( not ( = ?AUTO_5479 ?AUTO_5481 ) ) ( not ( = ?AUTO_5480 ?AUTO_5481 ) ) ( not ( = ?AUTO_5483 ?AUTO_5481 ) ) ( not ( = ?AUTO_5482 ?AUTO_5481 ) ) ( ON ?AUTO_5481 ?AUTO_5482 ) ( CLEAR ?AUTO_5481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5481 ?AUTO_5482 )
      ( MAKE-ON ?AUTO_5479 ?AUTO_5480 )
      ( MAKE-ON-VERIFY ?AUTO_5479 ?AUTO_5480 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5486 - BLOCK
      ?AUTO_5487 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5486 ) ( CLEAR ?AUTO_5487 ) ( not ( = ?AUTO_5486 ?AUTO_5487 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5486 ?AUTO_5487 )
      ( MAKE-ON-VERIFY ?AUTO_5486 ?AUTO_5487 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5488 - BLOCK
      ?AUTO_5489 - BLOCK
    )
    :vars
    (
      ?AUTO_5490 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5489 ) ( not ( = ?AUTO_5488 ?AUTO_5489 ) ) ( ON ?AUTO_5488 ?AUTO_5490 ) ( CLEAR ?AUTO_5488 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5488 ?AUTO_5490 ) ) ( not ( = ?AUTO_5489 ?AUTO_5490 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5488 ?AUTO_5490 )
      ( MAKE-ON ?AUTO_5488 ?AUTO_5489 )
      ( MAKE-ON-VERIFY ?AUTO_5488 ?AUTO_5489 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5491 - BLOCK
      ?AUTO_5492 - BLOCK
    )
    :vars
    (
      ?AUTO_5493 - BLOCK
      ?AUTO_5494 - BLOCK
      ?AUTO_5495 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5492 ) ( not ( = ?AUTO_5491 ?AUTO_5492 ) ) ( ON ?AUTO_5491 ?AUTO_5493 ) ( CLEAR ?AUTO_5491 ) ( not ( = ?AUTO_5491 ?AUTO_5493 ) ) ( not ( = ?AUTO_5492 ?AUTO_5493 ) ) ( HOLDING ?AUTO_5494 ) ( CLEAR ?AUTO_5495 ) ( not ( = ?AUTO_5491 ?AUTO_5494 ) ) ( not ( = ?AUTO_5491 ?AUTO_5495 ) ) ( not ( = ?AUTO_5492 ?AUTO_5494 ) ) ( not ( = ?AUTO_5492 ?AUTO_5495 ) ) ( not ( = ?AUTO_5493 ?AUTO_5494 ) ) ( not ( = ?AUTO_5493 ?AUTO_5495 ) ) ( not ( = ?AUTO_5494 ?AUTO_5495 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5494 ?AUTO_5495 )
      ( MAKE-ON ?AUTO_5491 ?AUTO_5492 )
      ( MAKE-ON-VERIFY ?AUTO_5491 ?AUTO_5492 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5496 - BLOCK
      ?AUTO_5497 - BLOCK
    )
    :vars
    (
      ?AUTO_5498 - BLOCK
      ?AUTO_5499 - BLOCK
      ?AUTO_5500 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5497 ) ( not ( = ?AUTO_5496 ?AUTO_5497 ) ) ( ON ?AUTO_5496 ?AUTO_5498 ) ( not ( = ?AUTO_5496 ?AUTO_5498 ) ) ( not ( = ?AUTO_5497 ?AUTO_5498 ) ) ( CLEAR ?AUTO_5499 ) ( not ( = ?AUTO_5496 ?AUTO_5500 ) ) ( not ( = ?AUTO_5496 ?AUTO_5499 ) ) ( not ( = ?AUTO_5497 ?AUTO_5500 ) ) ( not ( = ?AUTO_5497 ?AUTO_5499 ) ) ( not ( = ?AUTO_5498 ?AUTO_5500 ) ) ( not ( = ?AUTO_5498 ?AUTO_5499 ) ) ( not ( = ?AUTO_5500 ?AUTO_5499 ) ) ( ON ?AUTO_5500 ?AUTO_5496 ) ( CLEAR ?AUTO_5500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5500 ?AUTO_5496 )
      ( MAKE-ON ?AUTO_5496 ?AUTO_5497 )
      ( MAKE-ON-VERIFY ?AUTO_5496 ?AUTO_5497 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5501 - BLOCK
      ?AUTO_5502 - BLOCK
    )
    :vars
    (
      ?AUTO_5503 - BLOCK
      ?AUTO_5505 - BLOCK
      ?AUTO_5504 - BLOCK
      ?AUTO_5506 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5502 ) ( not ( = ?AUTO_5501 ?AUTO_5502 ) ) ( ON ?AUTO_5501 ?AUTO_5503 ) ( not ( = ?AUTO_5501 ?AUTO_5503 ) ) ( not ( = ?AUTO_5502 ?AUTO_5503 ) ) ( CLEAR ?AUTO_5505 ) ( not ( = ?AUTO_5501 ?AUTO_5504 ) ) ( not ( = ?AUTO_5501 ?AUTO_5505 ) ) ( not ( = ?AUTO_5502 ?AUTO_5504 ) ) ( not ( = ?AUTO_5502 ?AUTO_5505 ) ) ( not ( = ?AUTO_5503 ?AUTO_5504 ) ) ( not ( = ?AUTO_5503 ?AUTO_5505 ) ) ( not ( = ?AUTO_5504 ?AUTO_5505 ) ) ( ON ?AUTO_5504 ?AUTO_5501 ) ( CLEAR ?AUTO_5504 ) ( HOLDING ?AUTO_5506 ) ( not ( = ?AUTO_5501 ?AUTO_5506 ) ) ( not ( = ?AUTO_5502 ?AUTO_5506 ) ) ( not ( = ?AUTO_5503 ?AUTO_5506 ) ) ( not ( = ?AUTO_5505 ?AUTO_5506 ) ) ( not ( = ?AUTO_5504 ?AUTO_5506 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5506 )
      ( MAKE-ON ?AUTO_5501 ?AUTO_5502 )
      ( MAKE-ON-VERIFY ?AUTO_5501 ?AUTO_5502 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5507 - BLOCK
      ?AUTO_5508 - BLOCK
    )
    :vars
    (
      ?AUTO_5510 - BLOCK
      ?AUTO_5511 - BLOCK
      ?AUTO_5509 - BLOCK
      ?AUTO_5512 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5508 ) ( not ( = ?AUTO_5507 ?AUTO_5508 ) ) ( ON ?AUTO_5507 ?AUTO_5510 ) ( not ( = ?AUTO_5507 ?AUTO_5510 ) ) ( not ( = ?AUTO_5508 ?AUTO_5510 ) ) ( CLEAR ?AUTO_5511 ) ( not ( = ?AUTO_5507 ?AUTO_5509 ) ) ( not ( = ?AUTO_5507 ?AUTO_5511 ) ) ( not ( = ?AUTO_5508 ?AUTO_5509 ) ) ( not ( = ?AUTO_5508 ?AUTO_5511 ) ) ( not ( = ?AUTO_5510 ?AUTO_5509 ) ) ( not ( = ?AUTO_5510 ?AUTO_5511 ) ) ( not ( = ?AUTO_5509 ?AUTO_5511 ) ) ( ON ?AUTO_5509 ?AUTO_5507 ) ( not ( = ?AUTO_5507 ?AUTO_5512 ) ) ( not ( = ?AUTO_5508 ?AUTO_5512 ) ) ( not ( = ?AUTO_5510 ?AUTO_5512 ) ) ( not ( = ?AUTO_5511 ?AUTO_5512 ) ) ( not ( = ?AUTO_5509 ?AUTO_5512 ) ) ( ON ?AUTO_5512 ?AUTO_5509 ) ( CLEAR ?AUTO_5512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5512 ?AUTO_5509 )
      ( MAKE-ON ?AUTO_5507 ?AUTO_5508 )
      ( MAKE-ON-VERIFY ?AUTO_5507 ?AUTO_5508 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5513 - BLOCK
      ?AUTO_5514 - BLOCK
    )
    :vars
    (
      ?AUTO_5517 - BLOCK
      ?AUTO_5516 - BLOCK
      ?AUTO_5518 - BLOCK
      ?AUTO_5515 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5513 ?AUTO_5514 ) ) ( ON ?AUTO_5513 ?AUTO_5517 ) ( not ( = ?AUTO_5513 ?AUTO_5517 ) ) ( not ( = ?AUTO_5514 ?AUTO_5517 ) ) ( CLEAR ?AUTO_5516 ) ( not ( = ?AUTO_5513 ?AUTO_5518 ) ) ( not ( = ?AUTO_5513 ?AUTO_5516 ) ) ( not ( = ?AUTO_5514 ?AUTO_5518 ) ) ( not ( = ?AUTO_5514 ?AUTO_5516 ) ) ( not ( = ?AUTO_5517 ?AUTO_5518 ) ) ( not ( = ?AUTO_5517 ?AUTO_5516 ) ) ( not ( = ?AUTO_5518 ?AUTO_5516 ) ) ( ON ?AUTO_5518 ?AUTO_5513 ) ( not ( = ?AUTO_5513 ?AUTO_5515 ) ) ( not ( = ?AUTO_5514 ?AUTO_5515 ) ) ( not ( = ?AUTO_5517 ?AUTO_5515 ) ) ( not ( = ?AUTO_5516 ?AUTO_5515 ) ) ( not ( = ?AUTO_5518 ?AUTO_5515 ) ) ( ON ?AUTO_5515 ?AUTO_5518 ) ( CLEAR ?AUTO_5515 ) ( HOLDING ?AUTO_5514 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5514 )
      ( MAKE-ON ?AUTO_5513 ?AUTO_5514 )
      ( MAKE-ON-VERIFY ?AUTO_5513 ?AUTO_5514 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5521 - BLOCK
      ?AUTO_5522 - BLOCK
    )
    :vars
    (
      ?AUTO_5523 - BLOCK
      ?AUTO_5526 - BLOCK
      ?AUTO_5524 - BLOCK
      ?AUTO_5525 - BLOCK
      ?AUTO_5527 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5522 ) ( not ( = ?AUTO_5521 ?AUTO_5522 ) ) ( ON ?AUTO_5521 ?AUTO_5523 ) ( not ( = ?AUTO_5521 ?AUTO_5523 ) ) ( not ( = ?AUTO_5522 ?AUTO_5523 ) ) ( CLEAR ?AUTO_5526 ) ( not ( = ?AUTO_5521 ?AUTO_5524 ) ) ( not ( = ?AUTO_5521 ?AUTO_5526 ) ) ( not ( = ?AUTO_5522 ?AUTO_5524 ) ) ( not ( = ?AUTO_5522 ?AUTO_5526 ) ) ( not ( = ?AUTO_5523 ?AUTO_5524 ) ) ( not ( = ?AUTO_5523 ?AUTO_5526 ) ) ( not ( = ?AUTO_5524 ?AUTO_5526 ) ) ( ON ?AUTO_5524 ?AUTO_5521 ) ( not ( = ?AUTO_5521 ?AUTO_5525 ) ) ( not ( = ?AUTO_5522 ?AUTO_5525 ) ) ( not ( = ?AUTO_5523 ?AUTO_5525 ) ) ( not ( = ?AUTO_5526 ?AUTO_5525 ) ) ( not ( = ?AUTO_5524 ?AUTO_5525 ) ) ( ON ?AUTO_5525 ?AUTO_5524 ) ( CLEAR ?AUTO_5525 ) ( HOLDING ?AUTO_5527 ) ( not ( = ?AUTO_5521 ?AUTO_5527 ) ) ( not ( = ?AUTO_5522 ?AUTO_5527 ) ) ( not ( = ?AUTO_5523 ?AUTO_5527 ) ) ( not ( = ?AUTO_5526 ?AUTO_5527 ) ) ( not ( = ?AUTO_5524 ?AUTO_5527 ) ) ( not ( = ?AUTO_5525 ?AUTO_5527 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5527 )
      ( MAKE-ON ?AUTO_5521 ?AUTO_5522 )
      ( MAKE-ON-VERIFY ?AUTO_5521 ?AUTO_5522 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5528 - BLOCK
      ?AUTO_5529 - BLOCK
    )
    :vars
    (
      ?AUTO_5531 - BLOCK
      ?AUTO_5534 - BLOCK
      ?AUTO_5530 - BLOCK
      ?AUTO_5532 - BLOCK
      ?AUTO_5533 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5528 ?AUTO_5529 ) ) ( ON ?AUTO_5528 ?AUTO_5531 ) ( not ( = ?AUTO_5528 ?AUTO_5531 ) ) ( not ( = ?AUTO_5529 ?AUTO_5531 ) ) ( CLEAR ?AUTO_5534 ) ( not ( = ?AUTO_5528 ?AUTO_5530 ) ) ( not ( = ?AUTO_5528 ?AUTO_5534 ) ) ( not ( = ?AUTO_5529 ?AUTO_5530 ) ) ( not ( = ?AUTO_5529 ?AUTO_5534 ) ) ( not ( = ?AUTO_5531 ?AUTO_5530 ) ) ( not ( = ?AUTO_5531 ?AUTO_5534 ) ) ( not ( = ?AUTO_5530 ?AUTO_5534 ) ) ( ON ?AUTO_5530 ?AUTO_5528 ) ( not ( = ?AUTO_5528 ?AUTO_5532 ) ) ( not ( = ?AUTO_5529 ?AUTO_5532 ) ) ( not ( = ?AUTO_5531 ?AUTO_5532 ) ) ( not ( = ?AUTO_5534 ?AUTO_5532 ) ) ( not ( = ?AUTO_5530 ?AUTO_5532 ) ) ( ON ?AUTO_5532 ?AUTO_5530 ) ( CLEAR ?AUTO_5532 ) ( not ( = ?AUTO_5528 ?AUTO_5533 ) ) ( not ( = ?AUTO_5529 ?AUTO_5533 ) ) ( not ( = ?AUTO_5531 ?AUTO_5533 ) ) ( not ( = ?AUTO_5534 ?AUTO_5533 ) ) ( not ( = ?AUTO_5530 ?AUTO_5533 ) ) ( not ( = ?AUTO_5532 ?AUTO_5533 ) ) ( ON ?AUTO_5533 ?AUTO_5529 ) ( CLEAR ?AUTO_5533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5533 ?AUTO_5529 )
      ( MAKE-ON ?AUTO_5528 ?AUTO_5529 )
      ( MAKE-ON-VERIFY ?AUTO_5528 ?AUTO_5529 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5535 - BLOCK
      ?AUTO_5536 - BLOCK
    )
    :vars
    (
      ?AUTO_5539 - BLOCK
      ?AUTO_5538 - BLOCK
      ?AUTO_5541 - BLOCK
      ?AUTO_5537 - BLOCK
      ?AUTO_5540 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5535 ?AUTO_5536 ) ) ( ON ?AUTO_5535 ?AUTO_5539 ) ( not ( = ?AUTO_5535 ?AUTO_5539 ) ) ( not ( = ?AUTO_5536 ?AUTO_5539 ) ) ( not ( = ?AUTO_5535 ?AUTO_5538 ) ) ( not ( = ?AUTO_5535 ?AUTO_5541 ) ) ( not ( = ?AUTO_5536 ?AUTO_5538 ) ) ( not ( = ?AUTO_5536 ?AUTO_5541 ) ) ( not ( = ?AUTO_5539 ?AUTO_5538 ) ) ( not ( = ?AUTO_5539 ?AUTO_5541 ) ) ( not ( = ?AUTO_5538 ?AUTO_5541 ) ) ( ON ?AUTO_5538 ?AUTO_5535 ) ( not ( = ?AUTO_5535 ?AUTO_5537 ) ) ( not ( = ?AUTO_5536 ?AUTO_5537 ) ) ( not ( = ?AUTO_5539 ?AUTO_5537 ) ) ( not ( = ?AUTO_5541 ?AUTO_5537 ) ) ( not ( = ?AUTO_5538 ?AUTO_5537 ) ) ( ON ?AUTO_5537 ?AUTO_5538 ) ( CLEAR ?AUTO_5537 ) ( not ( = ?AUTO_5535 ?AUTO_5540 ) ) ( not ( = ?AUTO_5536 ?AUTO_5540 ) ) ( not ( = ?AUTO_5539 ?AUTO_5540 ) ) ( not ( = ?AUTO_5541 ?AUTO_5540 ) ) ( not ( = ?AUTO_5538 ?AUTO_5540 ) ) ( not ( = ?AUTO_5537 ?AUTO_5540 ) ) ( ON ?AUTO_5540 ?AUTO_5536 ) ( CLEAR ?AUTO_5540 ) ( HOLDING ?AUTO_5541 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5541 )
      ( MAKE-ON ?AUTO_5535 ?AUTO_5536 )
      ( MAKE-ON-VERIFY ?AUTO_5535 ?AUTO_5536 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5542 - BLOCK
      ?AUTO_5543 - BLOCK
    )
    :vars
    (
      ?AUTO_5548 - BLOCK
      ?AUTO_5546 - BLOCK
      ?AUTO_5544 - BLOCK
      ?AUTO_5547 - BLOCK
      ?AUTO_5545 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5542 ?AUTO_5543 ) ) ( ON ?AUTO_5542 ?AUTO_5548 ) ( not ( = ?AUTO_5542 ?AUTO_5548 ) ) ( not ( = ?AUTO_5543 ?AUTO_5548 ) ) ( not ( = ?AUTO_5542 ?AUTO_5546 ) ) ( not ( = ?AUTO_5542 ?AUTO_5544 ) ) ( not ( = ?AUTO_5543 ?AUTO_5546 ) ) ( not ( = ?AUTO_5543 ?AUTO_5544 ) ) ( not ( = ?AUTO_5548 ?AUTO_5546 ) ) ( not ( = ?AUTO_5548 ?AUTO_5544 ) ) ( not ( = ?AUTO_5546 ?AUTO_5544 ) ) ( ON ?AUTO_5546 ?AUTO_5542 ) ( not ( = ?AUTO_5542 ?AUTO_5547 ) ) ( not ( = ?AUTO_5543 ?AUTO_5547 ) ) ( not ( = ?AUTO_5548 ?AUTO_5547 ) ) ( not ( = ?AUTO_5544 ?AUTO_5547 ) ) ( not ( = ?AUTO_5546 ?AUTO_5547 ) ) ( ON ?AUTO_5547 ?AUTO_5546 ) ( not ( = ?AUTO_5542 ?AUTO_5545 ) ) ( not ( = ?AUTO_5543 ?AUTO_5545 ) ) ( not ( = ?AUTO_5548 ?AUTO_5545 ) ) ( not ( = ?AUTO_5544 ?AUTO_5545 ) ) ( not ( = ?AUTO_5546 ?AUTO_5545 ) ) ( not ( = ?AUTO_5547 ?AUTO_5545 ) ) ( ON ?AUTO_5545 ?AUTO_5543 ) ( CLEAR ?AUTO_5545 ) ( ON ?AUTO_5544 ?AUTO_5547 ) ( CLEAR ?AUTO_5544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5544 ?AUTO_5547 )
      ( MAKE-ON ?AUTO_5542 ?AUTO_5543 )
      ( MAKE-ON-VERIFY ?AUTO_5542 ?AUTO_5543 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5551 - BLOCK
      ?AUTO_5552 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5551 ) ( CLEAR ?AUTO_5552 ) ( not ( = ?AUTO_5551 ?AUTO_5552 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5551 ?AUTO_5552 )
      ( MAKE-ON-VERIFY ?AUTO_5551 ?AUTO_5552 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5553 - BLOCK
      ?AUTO_5554 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5554 ) ( not ( = ?AUTO_5553 ?AUTO_5554 ) ) ( ON-TABLE ?AUTO_5553 ) ( CLEAR ?AUTO_5553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5553 )
      ( MAKE-ON ?AUTO_5553 ?AUTO_5554 )
      ( MAKE-ON-VERIFY ?AUTO_5553 ?AUTO_5554 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5555 - BLOCK
      ?AUTO_5556 - BLOCK
    )
    :vars
    (
      ?AUTO_5557 - BLOCK
      ?AUTO_5558 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5556 ) ( not ( = ?AUTO_5555 ?AUTO_5556 ) ) ( ON-TABLE ?AUTO_5555 ) ( CLEAR ?AUTO_5555 ) ( HOLDING ?AUTO_5557 ) ( CLEAR ?AUTO_5558 ) ( not ( = ?AUTO_5555 ?AUTO_5557 ) ) ( not ( = ?AUTO_5555 ?AUTO_5558 ) ) ( not ( = ?AUTO_5556 ?AUTO_5557 ) ) ( not ( = ?AUTO_5556 ?AUTO_5558 ) ) ( not ( = ?AUTO_5557 ?AUTO_5558 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5557 ?AUTO_5558 )
      ( MAKE-ON ?AUTO_5555 ?AUTO_5556 )
      ( MAKE-ON-VERIFY ?AUTO_5555 ?AUTO_5556 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5559 - BLOCK
      ?AUTO_5560 - BLOCK
    )
    :vars
    (
      ?AUTO_5561 - BLOCK
      ?AUTO_5562 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5559 ?AUTO_5560 ) ) ( ON-TABLE ?AUTO_5559 ) ( CLEAR ?AUTO_5559 ) ( CLEAR ?AUTO_5561 ) ( not ( = ?AUTO_5559 ?AUTO_5562 ) ) ( not ( = ?AUTO_5559 ?AUTO_5561 ) ) ( not ( = ?AUTO_5560 ?AUTO_5562 ) ) ( not ( = ?AUTO_5560 ?AUTO_5561 ) ) ( not ( = ?AUTO_5562 ?AUTO_5561 ) ) ( ON ?AUTO_5562 ?AUTO_5560 ) ( CLEAR ?AUTO_5562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5562 ?AUTO_5560 )
      ( MAKE-ON ?AUTO_5559 ?AUTO_5560 )
      ( MAKE-ON-VERIFY ?AUTO_5559 ?AUTO_5560 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5563 - BLOCK
      ?AUTO_5564 - BLOCK
    )
    :vars
    (
      ?AUTO_5565 - BLOCK
      ?AUTO_5566 - BLOCK
      ?AUTO_5567 - BLOCK
      ?AUTO_5568 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5563 ?AUTO_5564 ) ) ( ON-TABLE ?AUTO_5563 ) ( CLEAR ?AUTO_5563 ) ( CLEAR ?AUTO_5565 ) ( not ( = ?AUTO_5563 ?AUTO_5566 ) ) ( not ( = ?AUTO_5563 ?AUTO_5565 ) ) ( not ( = ?AUTO_5564 ?AUTO_5566 ) ) ( not ( = ?AUTO_5564 ?AUTO_5565 ) ) ( not ( = ?AUTO_5566 ?AUTO_5565 ) ) ( ON ?AUTO_5566 ?AUTO_5564 ) ( CLEAR ?AUTO_5566 ) ( HOLDING ?AUTO_5567 ) ( CLEAR ?AUTO_5568 ) ( not ( = ?AUTO_5563 ?AUTO_5567 ) ) ( not ( = ?AUTO_5563 ?AUTO_5568 ) ) ( not ( = ?AUTO_5564 ?AUTO_5567 ) ) ( not ( = ?AUTO_5564 ?AUTO_5568 ) ) ( not ( = ?AUTO_5565 ?AUTO_5567 ) ) ( not ( = ?AUTO_5565 ?AUTO_5568 ) ) ( not ( = ?AUTO_5566 ?AUTO_5567 ) ) ( not ( = ?AUTO_5566 ?AUTO_5568 ) ) ( not ( = ?AUTO_5567 ?AUTO_5568 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5567 ?AUTO_5568 )
      ( MAKE-ON ?AUTO_5563 ?AUTO_5564 )
      ( MAKE-ON-VERIFY ?AUTO_5563 ?AUTO_5564 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5569 - BLOCK
      ?AUTO_5570 - BLOCK
    )
    :vars
    (
      ?AUTO_5572 - BLOCK
      ?AUTO_5571 - BLOCK
      ?AUTO_5574 - BLOCK
      ?AUTO_5573 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5569 ?AUTO_5570 ) ) ( ON-TABLE ?AUTO_5569 ) ( CLEAR ?AUTO_5569 ) ( CLEAR ?AUTO_5572 ) ( not ( = ?AUTO_5569 ?AUTO_5571 ) ) ( not ( = ?AUTO_5569 ?AUTO_5572 ) ) ( not ( = ?AUTO_5570 ?AUTO_5571 ) ) ( not ( = ?AUTO_5570 ?AUTO_5572 ) ) ( not ( = ?AUTO_5571 ?AUTO_5572 ) ) ( ON ?AUTO_5571 ?AUTO_5570 ) ( CLEAR ?AUTO_5574 ) ( not ( = ?AUTO_5569 ?AUTO_5573 ) ) ( not ( = ?AUTO_5569 ?AUTO_5574 ) ) ( not ( = ?AUTO_5570 ?AUTO_5573 ) ) ( not ( = ?AUTO_5570 ?AUTO_5574 ) ) ( not ( = ?AUTO_5572 ?AUTO_5573 ) ) ( not ( = ?AUTO_5572 ?AUTO_5574 ) ) ( not ( = ?AUTO_5571 ?AUTO_5573 ) ) ( not ( = ?AUTO_5571 ?AUTO_5574 ) ) ( not ( = ?AUTO_5573 ?AUTO_5574 ) ) ( ON ?AUTO_5573 ?AUTO_5571 ) ( CLEAR ?AUTO_5573 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5573 ?AUTO_5571 )
      ( MAKE-ON ?AUTO_5569 ?AUTO_5570 )
      ( MAKE-ON-VERIFY ?AUTO_5569 ?AUTO_5570 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5575 - BLOCK
      ?AUTO_5576 - BLOCK
    )
    :vars
    (
      ?AUTO_5577 - BLOCK
      ?AUTO_5580 - BLOCK
      ?AUTO_5578 - BLOCK
      ?AUTO_5579 - BLOCK
      ?AUTO_5581 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5575 ?AUTO_5576 ) ) ( ON-TABLE ?AUTO_5575 ) ( CLEAR ?AUTO_5575 ) ( CLEAR ?AUTO_5577 ) ( not ( = ?AUTO_5575 ?AUTO_5580 ) ) ( not ( = ?AUTO_5575 ?AUTO_5577 ) ) ( not ( = ?AUTO_5576 ?AUTO_5580 ) ) ( not ( = ?AUTO_5576 ?AUTO_5577 ) ) ( not ( = ?AUTO_5580 ?AUTO_5577 ) ) ( ON ?AUTO_5580 ?AUTO_5576 ) ( CLEAR ?AUTO_5578 ) ( not ( = ?AUTO_5575 ?AUTO_5579 ) ) ( not ( = ?AUTO_5575 ?AUTO_5578 ) ) ( not ( = ?AUTO_5576 ?AUTO_5579 ) ) ( not ( = ?AUTO_5576 ?AUTO_5578 ) ) ( not ( = ?AUTO_5577 ?AUTO_5579 ) ) ( not ( = ?AUTO_5577 ?AUTO_5578 ) ) ( not ( = ?AUTO_5580 ?AUTO_5579 ) ) ( not ( = ?AUTO_5580 ?AUTO_5578 ) ) ( not ( = ?AUTO_5579 ?AUTO_5578 ) ) ( ON ?AUTO_5579 ?AUTO_5580 ) ( CLEAR ?AUTO_5579 ) ( HOLDING ?AUTO_5581 ) ( not ( = ?AUTO_5575 ?AUTO_5581 ) ) ( not ( = ?AUTO_5576 ?AUTO_5581 ) ) ( not ( = ?AUTO_5577 ?AUTO_5581 ) ) ( not ( = ?AUTO_5580 ?AUTO_5581 ) ) ( not ( = ?AUTO_5578 ?AUTO_5581 ) ) ( not ( = ?AUTO_5579 ?AUTO_5581 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5581 )
      ( MAKE-ON ?AUTO_5575 ?AUTO_5576 )
      ( MAKE-ON-VERIFY ?AUTO_5575 ?AUTO_5576 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5582 - BLOCK
      ?AUTO_5583 - BLOCK
    )
    :vars
    (
      ?AUTO_5586 - BLOCK
      ?AUTO_5585 - BLOCK
      ?AUTO_5584 - BLOCK
      ?AUTO_5587 - BLOCK
      ?AUTO_5588 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5582 ?AUTO_5583 ) ) ( ON-TABLE ?AUTO_5582 ) ( CLEAR ?AUTO_5582 ) ( CLEAR ?AUTO_5586 ) ( not ( = ?AUTO_5582 ?AUTO_5585 ) ) ( not ( = ?AUTO_5582 ?AUTO_5586 ) ) ( not ( = ?AUTO_5583 ?AUTO_5585 ) ) ( not ( = ?AUTO_5583 ?AUTO_5586 ) ) ( not ( = ?AUTO_5585 ?AUTO_5586 ) ) ( ON ?AUTO_5585 ?AUTO_5583 ) ( CLEAR ?AUTO_5584 ) ( not ( = ?AUTO_5582 ?AUTO_5587 ) ) ( not ( = ?AUTO_5582 ?AUTO_5584 ) ) ( not ( = ?AUTO_5583 ?AUTO_5587 ) ) ( not ( = ?AUTO_5583 ?AUTO_5584 ) ) ( not ( = ?AUTO_5586 ?AUTO_5587 ) ) ( not ( = ?AUTO_5586 ?AUTO_5584 ) ) ( not ( = ?AUTO_5585 ?AUTO_5587 ) ) ( not ( = ?AUTO_5585 ?AUTO_5584 ) ) ( not ( = ?AUTO_5587 ?AUTO_5584 ) ) ( ON ?AUTO_5587 ?AUTO_5585 ) ( not ( = ?AUTO_5582 ?AUTO_5588 ) ) ( not ( = ?AUTO_5583 ?AUTO_5588 ) ) ( not ( = ?AUTO_5586 ?AUTO_5588 ) ) ( not ( = ?AUTO_5585 ?AUTO_5588 ) ) ( not ( = ?AUTO_5584 ?AUTO_5588 ) ) ( not ( = ?AUTO_5587 ?AUTO_5588 ) ) ( ON ?AUTO_5588 ?AUTO_5587 ) ( CLEAR ?AUTO_5588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5588 ?AUTO_5587 )
      ( MAKE-ON ?AUTO_5582 ?AUTO_5583 )
      ( MAKE-ON-VERIFY ?AUTO_5582 ?AUTO_5583 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5589 - BLOCK
      ?AUTO_5590 - BLOCK
    )
    :vars
    (
      ?AUTO_5592 - BLOCK
      ?AUTO_5591 - BLOCK
      ?AUTO_5593 - BLOCK
      ?AUTO_5595 - BLOCK
      ?AUTO_5594 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5589 ?AUTO_5590 ) ) ( ON-TABLE ?AUTO_5589 ) ( CLEAR ?AUTO_5589 ) ( not ( = ?AUTO_5589 ?AUTO_5592 ) ) ( not ( = ?AUTO_5589 ?AUTO_5591 ) ) ( not ( = ?AUTO_5590 ?AUTO_5592 ) ) ( not ( = ?AUTO_5590 ?AUTO_5591 ) ) ( not ( = ?AUTO_5592 ?AUTO_5591 ) ) ( ON ?AUTO_5592 ?AUTO_5590 ) ( CLEAR ?AUTO_5593 ) ( not ( = ?AUTO_5589 ?AUTO_5595 ) ) ( not ( = ?AUTO_5589 ?AUTO_5593 ) ) ( not ( = ?AUTO_5590 ?AUTO_5595 ) ) ( not ( = ?AUTO_5590 ?AUTO_5593 ) ) ( not ( = ?AUTO_5591 ?AUTO_5595 ) ) ( not ( = ?AUTO_5591 ?AUTO_5593 ) ) ( not ( = ?AUTO_5592 ?AUTO_5595 ) ) ( not ( = ?AUTO_5592 ?AUTO_5593 ) ) ( not ( = ?AUTO_5595 ?AUTO_5593 ) ) ( ON ?AUTO_5595 ?AUTO_5592 ) ( not ( = ?AUTO_5589 ?AUTO_5594 ) ) ( not ( = ?AUTO_5590 ?AUTO_5594 ) ) ( not ( = ?AUTO_5591 ?AUTO_5594 ) ) ( not ( = ?AUTO_5592 ?AUTO_5594 ) ) ( not ( = ?AUTO_5593 ?AUTO_5594 ) ) ( not ( = ?AUTO_5595 ?AUTO_5594 ) ) ( ON ?AUTO_5594 ?AUTO_5595 ) ( CLEAR ?AUTO_5594 ) ( HOLDING ?AUTO_5591 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5591 )
      ( MAKE-ON ?AUTO_5589 ?AUTO_5590 )
      ( MAKE-ON-VERIFY ?AUTO_5589 ?AUTO_5590 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5596 - BLOCK
      ?AUTO_5597 - BLOCK
    )
    :vars
    (
      ?AUTO_5600 - BLOCK
      ?AUTO_5598 - BLOCK
      ?AUTO_5602 - BLOCK
      ?AUTO_5601 - BLOCK
      ?AUTO_5599 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5596 ?AUTO_5597 ) ) ( ON-TABLE ?AUTO_5596 ) ( not ( = ?AUTO_5596 ?AUTO_5600 ) ) ( not ( = ?AUTO_5596 ?AUTO_5598 ) ) ( not ( = ?AUTO_5597 ?AUTO_5600 ) ) ( not ( = ?AUTO_5597 ?AUTO_5598 ) ) ( not ( = ?AUTO_5600 ?AUTO_5598 ) ) ( ON ?AUTO_5600 ?AUTO_5597 ) ( CLEAR ?AUTO_5602 ) ( not ( = ?AUTO_5596 ?AUTO_5601 ) ) ( not ( = ?AUTO_5596 ?AUTO_5602 ) ) ( not ( = ?AUTO_5597 ?AUTO_5601 ) ) ( not ( = ?AUTO_5597 ?AUTO_5602 ) ) ( not ( = ?AUTO_5598 ?AUTO_5601 ) ) ( not ( = ?AUTO_5598 ?AUTO_5602 ) ) ( not ( = ?AUTO_5600 ?AUTO_5601 ) ) ( not ( = ?AUTO_5600 ?AUTO_5602 ) ) ( not ( = ?AUTO_5601 ?AUTO_5602 ) ) ( ON ?AUTO_5601 ?AUTO_5600 ) ( not ( = ?AUTO_5596 ?AUTO_5599 ) ) ( not ( = ?AUTO_5597 ?AUTO_5599 ) ) ( not ( = ?AUTO_5598 ?AUTO_5599 ) ) ( not ( = ?AUTO_5600 ?AUTO_5599 ) ) ( not ( = ?AUTO_5602 ?AUTO_5599 ) ) ( not ( = ?AUTO_5601 ?AUTO_5599 ) ) ( ON ?AUTO_5599 ?AUTO_5601 ) ( CLEAR ?AUTO_5599 ) ( ON ?AUTO_5598 ?AUTO_5596 ) ( CLEAR ?AUTO_5598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5598 ?AUTO_5596 )
      ( MAKE-ON ?AUTO_5596 ?AUTO_5597 )
      ( MAKE-ON-VERIFY ?AUTO_5596 ?AUTO_5597 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5603 - BLOCK
      ?AUTO_5604 - BLOCK
    )
    :vars
    (
      ?AUTO_5608 - BLOCK
      ?AUTO_5606 - BLOCK
      ?AUTO_5609 - BLOCK
      ?AUTO_5607 - BLOCK
      ?AUTO_5605 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5603 ?AUTO_5604 ) ) ( ON-TABLE ?AUTO_5603 ) ( not ( = ?AUTO_5603 ?AUTO_5608 ) ) ( not ( = ?AUTO_5603 ?AUTO_5606 ) ) ( not ( = ?AUTO_5604 ?AUTO_5608 ) ) ( not ( = ?AUTO_5604 ?AUTO_5606 ) ) ( not ( = ?AUTO_5608 ?AUTO_5606 ) ) ( ON ?AUTO_5608 ?AUTO_5604 ) ( not ( = ?AUTO_5603 ?AUTO_5609 ) ) ( not ( = ?AUTO_5603 ?AUTO_5607 ) ) ( not ( = ?AUTO_5604 ?AUTO_5609 ) ) ( not ( = ?AUTO_5604 ?AUTO_5607 ) ) ( not ( = ?AUTO_5606 ?AUTO_5609 ) ) ( not ( = ?AUTO_5606 ?AUTO_5607 ) ) ( not ( = ?AUTO_5608 ?AUTO_5609 ) ) ( not ( = ?AUTO_5608 ?AUTO_5607 ) ) ( not ( = ?AUTO_5609 ?AUTO_5607 ) ) ( ON ?AUTO_5609 ?AUTO_5608 ) ( not ( = ?AUTO_5603 ?AUTO_5605 ) ) ( not ( = ?AUTO_5604 ?AUTO_5605 ) ) ( not ( = ?AUTO_5606 ?AUTO_5605 ) ) ( not ( = ?AUTO_5608 ?AUTO_5605 ) ) ( not ( = ?AUTO_5607 ?AUTO_5605 ) ) ( not ( = ?AUTO_5609 ?AUTO_5605 ) ) ( ON ?AUTO_5605 ?AUTO_5609 ) ( CLEAR ?AUTO_5605 ) ( ON ?AUTO_5606 ?AUTO_5603 ) ( CLEAR ?AUTO_5606 ) ( HOLDING ?AUTO_5607 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5607 )
      ( MAKE-ON ?AUTO_5603 ?AUTO_5604 )
      ( MAKE-ON-VERIFY ?AUTO_5603 ?AUTO_5604 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5610 - BLOCK
      ?AUTO_5611 - BLOCK
    )
    :vars
    (
      ?AUTO_5615 - BLOCK
      ?AUTO_5614 - BLOCK
      ?AUTO_5612 - BLOCK
      ?AUTO_5616 - BLOCK
      ?AUTO_5613 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5610 ?AUTO_5611 ) ) ( ON-TABLE ?AUTO_5610 ) ( not ( = ?AUTO_5610 ?AUTO_5615 ) ) ( not ( = ?AUTO_5610 ?AUTO_5614 ) ) ( not ( = ?AUTO_5611 ?AUTO_5615 ) ) ( not ( = ?AUTO_5611 ?AUTO_5614 ) ) ( not ( = ?AUTO_5615 ?AUTO_5614 ) ) ( ON ?AUTO_5615 ?AUTO_5611 ) ( not ( = ?AUTO_5610 ?AUTO_5612 ) ) ( not ( = ?AUTO_5610 ?AUTO_5616 ) ) ( not ( = ?AUTO_5611 ?AUTO_5612 ) ) ( not ( = ?AUTO_5611 ?AUTO_5616 ) ) ( not ( = ?AUTO_5614 ?AUTO_5612 ) ) ( not ( = ?AUTO_5614 ?AUTO_5616 ) ) ( not ( = ?AUTO_5615 ?AUTO_5612 ) ) ( not ( = ?AUTO_5615 ?AUTO_5616 ) ) ( not ( = ?AUTO_5612 ?AUTO_5616 ) ) ( ON ?AUTO_5612 ?AUTO_5615 ) ( not ( = ?AUTO_5610 ?AUTO_5613 ) ) ( not ( = ?AUTO_5611 ?AUTO_5613 ) ) ( not ( = ?AUTO_5614 ?AUTO_5613 ) ) ( not ( = ?AUTO_5615 ?AUTO_5613 ) ) ( not ( = ?AUTO_5616 ?AUTO_5613 ) ) ( not ( = ?AUTO_5612 ?AUTO_5613 ) ) ( ON ?AUTO_5613 ?AUTO_5612 ) ( CLEAR ?AUTO_5613 ) ( ON ?AUTO_5614 ?AUTO_5610 ) ( ON ?AUTO_5616 ?AUTO_5614 ) ( CLEAR ?AUTO_5616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5616 ?AUTO_5614 )
      ( MAKE-ON ?AUTO_5610 ?AUTO_5611 )
      ( MAKE-ON-VERIFY ?AUTO_5610 ?AUTO_5611 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5617 - BLOCK
      ?AUTO_5618 - BLOCK
    )
    :vars
    (
      ?AUTO_5621 - BLOCK
      ?AUTO_5623 - BLOCK
      ?AUTO_5619 - BLOCK
      ?AUTO_5622 - BLOCK
      ?AUTO_5620 - BLOCK
      ?AUTO_5624 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5617 ?AUTO_5618 ) ) ( ON-TABLE ?AUTO_5617 ) ( not ( = ?AUTO_5617 ?AUTO_5621 ) ) ( not ( = ?AUTO_5617 ?AUTO_5623 ) ) ( not ( = ?AUTO_5618 ?AUTO_5621 ) ) ( not ( = ?AUTO_5618 ?AUTO_5623 ) ) ( not ( = ?AUTO_5621 ?AUTO_5623 ) ) ( ON ?AUTO_5621 ?AUTO_5618 ) ( not ( = ?AUTO_5617 ?AUTO_5619 ) ) ( not ( = ?AUTO_5617 ?AUTO_5622 ) ) ( not ( = ?AUTO_5618 ?AUTO_5619 ) ) ( not ( = ?AUTO_5618 ?AUTO_5622 ) ) ( not ( = ?AUTO_5623 ?AUTO_5619 ) ) ( not ( = ?AUTO_5623 ?AUTO_5622 ) ) ( not ( = ?AUTO_5621 ?AUTO_5619 ) ) ( not ( = ?AUTO_5621 ?AUTO_5622 ) ) ( not ( = ?AUTO_5619 ?AUTO_5622 ) ) ( ON ?AUTO_5619 ?AUTO_5621 ) ( not ( = ?AUTO_5617 ?AUTO_5620 ) ) ( not ( = ?AUTO_5618 ?AUTO_5620 ) ) ( not ( = ?AUTO_5623 ?AUTO_5620 ) ) ( not ( = ?AUTO_5621 ?AUTO_5620 ) ) ( not ( = ?AUTO_5622 ?AUTO_5620 ) ) ( not ( = ?AUTO_5619 ?AUTO_5620 ) ) ( ON ?AUTO_5620 ?AUTO_5619 ) ( CLEAR ?AUTO_5620 ) ( ON ?AUTO_5623 ?AUTO_5617 ) ( ON ?AUTO_5622 ?AUTO_5623 ) ( CLEAR ?AUTO_5622 ) ( HOLDING ?AUTO_5624 ) ( not ( = ?AUTO_5617 ?AUTO_5624 ) ) ( not ( = ?AUTO_5618 ?AUTO_5624 ) ) ( not ( = ?AUTO_5621 ?AUTO_5624 ) ) ( not ( = ?AUTO_5623 ?AUTO_5624 ) ) ( not ( = ?AUTO_5619 ?AUTO_5624 ) ) ( not ( = ?AUTO_5622 ?AUTO_5624 ) ) ( not ( = ?AUTO_5620 ?AUTO_5624 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5624 )
      ( MAKE-ON ?AUTO_5617 ?AUTO_5618 )
      ( MAKE-ON-VERIFY ?AUTO_5617 ?AUTO_5618 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5625 - BLOCK
      ?AUTO_5626 - BLOCK
    )
    :vars
    (
      ?AUTO_5630 - BLOCK
      ?AUTO_5628 - BLOCK
      ?AUTO_5632 - BLOCK
      ?AUTO_5629 - BLOCK
      ?AUTO_5631 - BLOCK
      ?AUTO_5627 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5625 ?AUTO_5626 ) ) ( ON-TABLE ?AUTO_5625 ) ( not ( = ?AUTO_5625 ?AUTO_5630 ) ) ( not ( = ?AUTO_5625 ?AUTO_5628 ) ) ( not ( = ?AUTO_5626 ?AUTO_5630 ) ) ( not ( = ?AUTO_5626 ?AUTO_5628 ) ) ( not ( = ?AUTO_5630 ?AUTO_5628 ) ) ( ON ?AUTO_5630 ?AUTO_5626 ) ( not ( = ?AUTO_5625 ?AUTO_5632 ) ) ( not ( = ?AUTO_5625 ?AUTO_5629 ) ) ( not ( = ?AUTO_5626 ?AUTO_5632 ) ) ( not ( = ?AUTO_5626 ?AUTO_5629 ) ) ( not ( = ?AUTO_5628 ?AUTO_5632 ) ) ( not ( = ?AUTO_5628 ?AUTO_5629 ) ) ( not ( = ?AUTO_5630 ?AUTO_5632 ) ) ( not ( = ?AUTO_5630 ?AUTO_5629 ) ) ( not ( = ?AUTO_5632 ?AUTO_5629 ) ) ( ON ?AUTO_5632 ?AUTO_5630 ) ( not ( = ?AUTO_5625 ?AUTO_5631 ) ) ( not ( = ?AUTO_5626 ?AUTO_5631 ) ) ( not ( = ?AUTO_5628 ?AUTO_5631 ) ) ( not ( = ?AUTO_5630 ?AUTO_5631 ) ) ( not ( = ?AUTO_5629 ?AUTO_5631 ) ) ( not ( = ?AUTO_5632 ?AUTO_5631 ) ) ( ON ?AUTO_5631 ?AUTO_5632 ) ( ON ?AUTO_5628 ?AUTO_5625 ) ( ON ?AUTO_5629 ?AUTO_5628 ) ( CLEAR ?AUTO_5629 ) ( not ( = ?AUTO_5625 ?AUTO_5627 ) ) ( not ( = ?AUTO_5626 ?AUTO_5627 ) ) ( not ( = ?AUTO_5630 ?AUTO_5627 ) ) ( not ( = ?AUTO_5628 ?AUTO_5627 ) ) ( not ( = ?AUTO_5632 ?AUTO_5627 ) ) ( not ( = ?AUTO_5629 ?AUTO_5627 ) ) ( not ( = ?AUTO_5631 ?AUTO_5627 ) ) ( ON ?AUTO_5627 ?AUTO_5631 ) ( CLEAR ?AUTO_5627 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5627 ?AUTO_5631 )
      ( MAKE-ON ?AUTO_5625 ?AUTO_5626 )
      ( MAKE-ON-VERIFY ?AUTO_5625 ?AUTO_5626 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5634 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5634 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5634 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5634 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5635 - BLOCK
    )
    :vars
    (
      ?AUTO_5636 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5635 ?AUTO_5636 ) ( CLEAR ?AUTO_5635 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5635 ?AUTO_5636 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5635 ?AUTO_5636 )
      ( MAKE-ON-TABLE ?AUTO_5635 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5635 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5637 - BLOCK
    )
    :vars
    (
      ?AUTO_5638 - BLOCK
      ?AUTO_5639 - BLOCK
      ?AUTO_5640 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5637 ?AUTO_5638 ) ( CLEAR ?AUTO_5637 ) ( not ( = ?AUTO_5637 ?AUTO_5638 ) ) ( HOLDING ?AUTO_5639 ) ( CLEAR ?AUTO_5640 ) ( not ( = ?AUTO_5637 ?AUTO_5639 ) ) ( not ( = ?AUTO_5637 ?AUTO_5640 ) ) ( not ( = ?AUTO_5638 ?AUTO_5639 ) ) ( not ( = ?AUTO_5638 ?AUTO_5640 ) ) ( not ( = ?AUTO_5639 ?AUTO_5640 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5639 ?AUTO_5640 )
      ( MAKE-ON-TABLE ?AUTO_5637 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5637 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5647 - BLOCK
    )
    :vars
    (
      ?AUTO_5648 - BLOCK
      ?AUTO_5650 - BLOCK
      ?AUTO_5649 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5647 ?AUTO_5648 ) ( not ( = ?AUTO_5647 ?AUTO_5648 ) ) ( CLEAR ?AUTO_5650 ) ( not ( = ?AUTO_5647 ?AUTO_5649 ) ) ( not ( = ?AUTO_5647 ?AUTO_5650 ) ) ( not ( = ?AUTO_5648 ?AUTO_5649 ) ) ( not ( = ?AUTO_5648 ?AUTO_5650 ) ) ( not ( = ?AUTO_5649 ?AUTO_5650 ) ) ( ON ?AUTO_5649 ?AUTO_5647 ) ( CLEAR ?AUTO_5649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5649 ?AUTO_5647 )
      ( MAKE-ON-TABLE ?AUTO_5647 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5647 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5651 - BLOCK
    )
    :vars
    (
      ?AUTO_5653 - BLOCK
      ?AUTO_5654 - BLOCK
      ?AUTO_5652 - BLOCK
      ?AUTO_5655 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5651 ?AUTO_5653 ) ( not ( = ?AUTO_5651 ?AUTO_5653 ) ) ( CLEAR ?AUTO_5654 ) ( not ( = ?AUTO_5651 ?AUTO_5652 ) ) ( not ( = ?AUTO_5651 ?AUTO_5654 ) ) ( not ( = ?AUTO_5653 ?AUTO_5652 ) ) ( not ( = ?AUTO_5653 ?AUTO_5654 ) ) ( not ( = ?AUTO_5652 ?AUTO_5654 ) ) ( ON ?AUTO_5652 ?AUTO_5651 ) ( CLEAR ?AUTO_5652 ) ( HOLDING ?AUTO_5655 ) ( not ( = ?AUTO_5651 ?AUTO_5655 ) ) ( not ( = ?AUTO_5653 ?AUTO_5655 ) ) ( not ( = ?AUTO_5654 ?AUTO_5655 ) ) ( not ( = ?AUTO_5652 ?AUTO_5655 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5655 )
      ( MAKE-ON-TABLE ?AUTO_5651 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5651 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5660 - BLOCK
    )
    :vars
    (
      ?AUTO_5662 - BLOCK
      ?AUTO_5663 - BLOCK
      ?AUTO_5661 - BLOCK
      ?AUTO_5664 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5660 ?AUTO_5662 ) ( not ( = ?AUTO_5660 ?AUTO_5662 ) ) ( CLEAR ?AUTO_5663 ) ( not ( = ?AUTO_5660 ?AUTO_5661 ) ) ( not ( = ?AUTO_5660 ?AUTO_5663 ) ) ( not ( = ?AUTO_5662 ?AUTO_5661 ) ) ( not ( = ?AUTO_5662 ?AUTO_5663 ) ) ( not ( = ?AUTO_5661 ?AUTO_5663 ) ) ( ON ?AUTO_5661 ?AUTO_5660 ) ( not ( = ?AUTO_5660 ?AUTO_5664 ) ) ( not ( = ?AUTO_5662 ?AUTO_5664 ) ) ( not ( = ?AUTO_5663 ?AUTO_5664 ) ) ( not ( = ?AUTO_5661 ?AUTO_5664 ) ) ( ON ?AUTO_5664 ?AUTO_5661 ) ( CLEAR ?AUTO_5664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5664 ?AUTO_5661 )
      ( MAKE-ON-TABLE ?AUTO_5660 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5660 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5667 - BLOCK
      ?AUTO_5668 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5667 ) ( CLEAR ?AUTO_5668 ) ( not ( = ?AUTO_5667 ?AUTO_5668 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5667 ?AUTO_5668 )
      ( MAKE-ON-VERIFY ?AUTO_5667 ?AUTO_5668 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5669 - BLOCK
      ?AUTO_5670 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5670 ) ( not ( = ?AUTO_5669 ?AUTO_5670 ) ) ( ON-TABLE ?AUTO_5669 ) ( CLEAR ?AUTO_5669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5669 )
      ( MAKE-ON ?AUTO_5669 ?AUTO_5670 )
      ( MAKE-ON-VERIFY ?AUTO_5669 ?AUTO_5670 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5671 - BLOCK
      ?AUTO_5672 - BLOCK
    )
    :vars
    (
      ?AUTO_5673 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5672 ) ( not ( = ?AUTO_5671 ?AUTO_5672 ) ) ( ON-TABLE ?AUTO_5671 ) ( CLEAR ?AUTO_5671 ) ( HOLDING ?AUTO_5673 ) ( not ( = ?AUTO_5671 ?AUTO_5673 ) ) ( not ( = ?AUTO_5672 ?AUTO_5673 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5673 )
      ( MAKE-ON ?AUTO_5671 ?AUTO_5672 )
      ( MAKE-ON-VERIFY ?AUTO_5671 ?AUTO_5672 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5674 - BLOCK
      ?AUTO_5675 - BLOCK
    )
    :vars
    (
      ?AUTO_5676 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5675 ) ( not ( = ?AUTO_5674 ?AUTO_5675 ) ) ( ON-TABLE ?AUTO_5674 ) ( not ( = ?AUTO_5674 ?AUTO_5676 ) ) ( not ( = ?AUTO_5675 ?AUTO_5676 ) ) ( ON ?AUTO_5676 ?AUTO_5674 ) ( CLEAR ?AUTO_5676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5676 ?AUTO_5674 )
      ( MAKE-ON ?AUTO_5674 ?AUTO_5675 )
      ( MAKE-ON-VERIFY ?AUTO_5674 ?AUTO_5675 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5677 - BLOCK
      ?AUTO_5678 - BLOCK
    )
    :vars
    (
      ?AUTO_5679 - BLOCK
      ?AUTO_5680 - BLOCK
      ?AUTO_5681 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5678 ) ( not ( = ?AUTO_5677 ?AUTO_5678 ) ) ( ON-TABLE ?AUTO_5677 ) ( not ( = ?AUTO_5677 ?AUTO_5679 ) ) ( not ( = ?AUTO_5678 ?AUTO_5679 ) ) ( ON ?AUTO_5679 ?AUTO_5677 ) ( CLEAR ?AUTO_5679 ) ( HOLDING ?AUTO_5680 ) ( CLEAR ?AUTO_5681 ) ( not ( = ?AUTO_5677 ?AUTO_5680 ) ) ( not ( = ?AUTO_5677 ?AUTO_5681 ) ) ( not ( = ?AUTO_5678 ?AUTO_5680 ) ) ( not ( = ?AUTO_5678 ?AUTO_5681 ) ) ( not ( = ?AUTO_5679 ?AUTO_5680 ) ) ( not ( = ?AUTO_5679 ?AUTO_5681 ) ) ( not ( = ?AUTO_5680 ?AUTO_5681 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5680 ?AUTO_5681 )
      ( MAKE-ON ?AUTO_5677 ?AUTO_5678 )
      ( MAKE-ON-VERIFY ?AUTO_5677 ?AUTO_5678 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5684 - BLOCK
      ?AUTO_5685 - BLOCK
    )
    :vars
    (
      ?AUTO_5686 - BLOCK
      ?AUTO_5687 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5684 ?AUTO_5685 ) ) ( ON-TABLE ?AUTO_5684 ) ( not ( = ?AUTO_5684 ?AUTO_5686 ) ) ( not ( = ?AUTO_5685 ?AUTO_5686 ) ) ( ON ?AUTO_5686 ?AUTO_5684 ) ( CLEAR ?AUTO_5686 ) ( HOLDING ?AUTO_5685 ) ( CLEAR ?AUTO_5687 ) ( not ( = ?AUTO_5684 ?AUTO_5687 ) ) ( not ( = ?AUTO_5685 ?AUTO_5687 ) ) ( not ( = ?AUTO_5686 ?AUTO_5687 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5685 ?AUTO_5687 )
      ( MAKE-ON ?AUTO_5684 ?AUTO_5685 )
      ( MAKE-ON-VERIFY ?AUTO_5684 ?AUTO_5685 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5702 - BLOCK
      ?AUTO_5703 - BLOCK
    )
    :vars
    (
      ?AUTO_5706 - BLOCK
      ?AUTO_5707 - BLOCK
      ?AUTO_5705 - BLOCK
      ?AUTO_5704 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5702 ?AUTO_5703 ) ) ( CLEAR ?AUTO_5706 ) ( not ( = ?AUTO_5702 ?AUTO_5707 ) ) ( not ( = ?AUTO_5702 ?AUTO_5706 ) ) ( not ( = ?AUTO_5703 ?AUTO_5707 ) ) ( not ( = ?AUTO_5703 ?AUTO_5706 ) ) ( not ( = ?AUTO_5707 ?AUTO_5706 ) ) ( ON ?AUTO_5707 ?AUTO_5703 ) ( CLEAR ?AUTO_5705 ) ( not ( = ?AUTO_5702 ?AUTO_5704 ) ) ( not ( = ?AUTO_5702 ?AUTO_5705 ) ) ( not ( = ?AUTO_5703 ?AUTO_5704 ) ) ( not ( = ?AUTO_5703 ?AUTO_5705 ) ) ( not ( = ?AUTO_5706 ?AUTO_5704 ) ) ( not ( = ?AUTO_5706 ?AUTO_5705 ) ) ( not ( = ?AUTO_5707 ?AUTO_5704 ) ) ( not ( = ?AUTO_5707 ?AUTO_5705 ) ) ( not ( = ?AUTO_5704 ?AUTO_5705 ) ) ( ON ?AUTO_5704 ?AUTO_5707 ) ( CLEAR ?AUTO_5704 ) ( HOLDING ?AUTO_5702 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5702 )
      ( MAKE-ON ?AUTO_5702 ?AUTO_5703 )
      ( MAKE-ON-VERIFY ?AUTO_5702 ?AUTO_5703 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5708 - BLOCK
      ?AUTO_5709 - BLOCK
    )
    :vars
    (
      ?AUTO_5713 - BLOCK
      ?AUTO_5712 - BLOCK
      ?AUTO_5711 - BLOCK
      ?AUTO_5710 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5708 ?AUTO_5709 ) ) ( not ( = ?AUTO_5708 ?AUTO_5713 ) ) ( not ( = ?AUTO_5708 ?AUTO_5712 ) ) ( not ( = ?AUTO_5709 ?AUTO_5713 ) ) ( not ( = ?AUTO_5709 ?AUTO_5712 ) ) ( not ( = ?AUTO_5713 ?AUTO_5712 ) ) ( ON ?AUTO_5713 ?AUTO_5709 ) ( CLEAR ?AUTO_5711 ) ( not ( = ?AUTO_5708 ?AUTO_5710 ) ) ( not ( = ?AUTO_5708 ?AUTO_5711 ) ) ( not ( = ?AUTO_5709 ?AUTO_5710 ) ) ( not ( = ?AUTO_5709 ?AUTO_5711 ) ) ( not ( = ?AUTO_5712 ?AUTO_5710 ) ) ( not ( = ?AUTO_5712 ?AUTO_5711 ) ) ( not ( = ?AUTO_5713 ?AUTO_5710 ) ) ( not ( = ?AUTO_5713 ?AUTO_5711 ) ) ( not ( = ?AUTO_5710 ?AUTO_5711 ) ) ( ON ?AUTO_5710 ?AUTO_5713 ) ( CLEAR ?AUTO_5710 ) ( ON ?AUTO_5708 ?AUTO_5712 ) ( CLEAR ?AUTO_5708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5708 ?AUTO_5712 )
      ( MAKE-ON ?AUTO_5708 ?AUTO_5709 )
      ( MAKE-ON-VERIFY ?AUTO_5708 ?AUTO_5709 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5714 - BLOCK
      ?AUTO_5715 - BLOCK
    )
    :vars
    (
      ?AUTO_5719 - BLOCK
      ?AUTO_5718 - BLOCK
      ?AUTO_5716 - BLOCK
      ?AUTO_5717 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5714 ?AUTO_5715 ) ) ( not ( = ?AUTO_5714 ?AUTO_5719 ) ) ( not ( = ?AUTO_5714 ?AUTO_5718 ) ) ( not ( = ?AUTO_5715 ?AUTO_5719 ) ) ( not ( = ?AUTO_5715 ?AUTO_5718 ) ) ( not ( = ?AUTO_5719 ?AUTO_5718 ) ) ( ON ?AUTO_5719 ?AUTO_5715 ) ( not ( = ?AUTO_5714 ?AUTO_5716 ) ) ( not ( = ?AUTO_5714 ?AUTO_5717 ) ) ( not ( = ?AUTO_5715 ?AUTO_5716 ) ) ( not ( = ?AUTO_5715 ?AUTO_5717 ) ) ( not ( = ?AUTO_5718 ?AUTO_5716 ) ) ( not ( = ?AUTO_5718 ?AUTO_5717 ) ) ( not ( = ?AUTO_5719 ?AUTO_5716 ) ) ( not ( = ?AUTO_5719 ?AUTO_5717 ) ) ( not ( = ?AUTO_5716 ?AUTO_5717 ) ) ( ON ?AUTO_5716 ?AUTO_5719 ) ( CLEAR ?AUTO_5716 ) ( ON ?AUTO_5714 ?AUTO_5718 ) ( CLEAR ?AUTO_5714 ) ( HOLDING ?AUTO_5717 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5717 )
      ( MAKE-ON ?AUTO_5714 ?AUTO_5715 )
      ( MAKE-ON-VERIFY ?AUTO_5714 ?AUTO_5715 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5720 - BLOCK
      ?AUTO_5721 - BLOCK
    )
    :vars
    (
      ?AUTO_5722 - BLOCK
      ?AUTO_5725 - BLOCK
      ?AUTO_5724 - BLOCK
      ?AUTO_5723 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5720 ?AUTO_5721 ) ) ( not ( = ?AUTO_5720 ?AUTO_5722 ) ) ( not ( = ?AUTO_5720 ?AUTO_5725 ) ) ( not ( = ?AUTO_5721 ?AUTO_5722 ) ) ( not ( = ?AUTO_5721 ?AUTO_5725 ) ) ( not ( = ?AUTO_5722 ?AUTO_5725 ) ) ( ON ?AUTO_5722 ?AUTO_5721 ) ( not ( = ?AUTO_5720 ?AUTO_5724 ) ) ( not ( = ?AUTO_5720 ?AUTO_5723 ) ) ( not ( = ?AUTO_5721 ?AUTO_5724 ) ) ( not ( = ?AUTO_5721 ?AUTO_5723 ) ) ( not ( = ?AUTO_5725 ?AUTO_5724 ) ) ( not ( = ?AUTO_5725 ?AUTO_5723 ) ) ( not ( = ?AUTO_5722 ?AUTO_5724 ) ) ( not ( = ?AUTO_5722 ?AUTO_5723 ) ) ( not ( = ?AUTO_5724 ?AUTO_5723 ) ) ( ON ?AUTO_5724 ?AUTO_5722 ) ( ON ?AUTO_5720 ?AUTO_5725 ) ( CLEAR ?AUTO_5720 ) ( ON ?AUTO_5723 ?AUTO_5724 ) ( CLEAR ?AUTO_5723 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5723 ?AUTO_5724 )
      ( MAKE-ON ?AUTO_5720 ?AUTO_5721 )
      ( MAKE-ON-VERIFY ?AUTO_5720 ?AUTO_5721 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5728 - BLOCK
      ?AUTO_5729 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5728 ) ( CLEAR ?AUTO_5729 ) ( not ( = ?AUTO_5728 ?AUTO_5729 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5728 ?AUTO_5729 )
      ( MAKE-ON-VERIFY ?AUTO_5728 ?AUTO_5729 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5730 - BLOCK
      ?AUTO_5731 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5731 ) ( not ( = ?AUTO_5730 ?AUTO_5731 ) ) ( ON-TABLE ?AUTO_5730 ) ( CLEAR ?AUTO_5730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5730 )
      ( MAKE-ON ?AUTO_5730 ?AUTO_5731 )
      ( MAKE-ON-VERIFY ?AUTO_5730 ?AUTO_5731 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5732 - BLOCK
      ?AUTO_5733 - BLOCK
    )
    :vars
    (
      ?AUTO_5734 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5732 ?AUTO_5733 ) ) ( ON-TABLE ?AUTO_5732 ) ( CLEAR ?AUTO_5732 ) ( HOLDING ?AUTO_5733 ) ( CLEAR ?AUTO_5734 ) ( not ( = ?AUTO_5732 ?AUTO_5734 ) ) ( not ( = ?AUTO_5733 ?AUTO_5734 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5733 ?AUTO_5734 )
      ( MAKE-ON ?AUTO_5732 ?AUTO_5733 )
      ( MAKE-ON-VERIFY ?AUTO_5732 ?AUTO_5733 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5783 - BLOCK
      ?AUTO_5784 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5783 ) ( CLEAR ?AUTO_5784 ) ( not ( = ?AUTO_5783 ?AUTO_5784 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5783 ?AUTO_5784 )
      ( MAKE-ON-VERIFY ?AUTO_5783 ?AUTO_5784 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5785 - BLOCK
      ?AUTO_5786 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5786 ) ( not ( = ?AUTO_5785 ?AUTO_5786 ) ) ( ON-TABLE ?AUTO_5785 ) ( CLEAR ?AUTO_5785 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5785 )
      ( MAKE-ON ?AUTO_5785 ?AUTO_5786 )
      ( MAKE-ON-VERIFY ?AUTO_5785 ?AUTO_5786 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5787 - BLOCK
      ?AUTO_5788 - BLOCK
    )
    :vars
    (
      ?AUTO_5789 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5787 ?AUTO_5788 ) ) ( ON-TABLE ?AUTO_5787 ) ( CLEAR ?AUTO_5787 ) ( HOLDING ?AUTO_5788 ) ( CLEAR ?AUTO_5789 ) ( not ( = ?AUTO_5787 ?AUTO_5789 ) ) ( not ( = ?AUTO_5788 ?AUTO_5789 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5788 ?AUTO_5789 )
      ( MAKE-ON ?AUTO_5787 ?AUTO_5788 )
      ( MAKE-ON-VERIFY ?AUTO_5787 ?AUTO_5788 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5792 - BLOCK
      ?AUTO_5793 - BLOCK
    )
    :vars
    (
      ?AUTO_5794 - BLOCK
      ?AUTO_5795 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5793 ) ( not ( = ?AUTO_5792 ?AUTO_5793 ) ) ( ON-TABLE ?AUTO_5792 ) ( CLEAR ?AUTO_5792 ) ( HOLDING ?AUTO_5794 ) ( CLEAR ?AUTO_5795 ) ( not ( = ?AUTO_5792 ?AUTO_5794 ) ) ( not ( = ?AUTO_5792 ?AUTO_5795 ) ) ( not ( = ?AUTO_5793 ?AUTO_5794 ) ) ( not ( = ?AUTO_5793 ?AUTO_5795 ) ) ( not ( = ?AUTO_5794 ?AUTO_5795 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5794 ?AUTO_5795 )
      ( MAKE-ON ?AUTO_5792 ?AUTO_5793 )
      ( MAKE-ON-VERIFY ?AUTO_5792 ?AUTO_5793 ) )
  )

)

